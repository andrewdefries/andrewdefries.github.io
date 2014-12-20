---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.304015, 0.3249275, -3.849672, 1, 0, 0, 1,
-3.008221, 0.4622546, -3.074827, 1, 0.007843138, 0, 1,
-2.717853, -1.234388, -1.315698, 1, 0.01176471, 0, 1,
-2.694615, -1.033363, -2.353293, 1, 0.01960784, 0, 1,
-2.645772, -1.124708, -2.447934, 1, 0.02352941, 0, 1,
-2.574299, 1.056721, -0.1303075, 1, 0.03137255, 0, 1,
-2.529577, -0.4280077, -1.08024, 1, 0.03529412, 0, 1,
-2.438128, -1.397337, -0.7458618, 1, 0.04313726, 0, 1,
-2.431302, 0.993868, -2.364974, 1, 0.04705882, 0, 1,
-2.422345, 0.1776032, -1.404074, 1, 0.05490196, 0, 1,
-2.401459, 0.8452694, -2.175104, 1, 0.05882353, 0, 1,
-2.366331, -0.8010358, -2.692663, 1, 0.06666667, 0, 1,
-2.329554, 0.379445, -1.045782, 1, 0.07058824, 0, 1,
-2.327133, -0.5845671, -1.555257, 1, 0.07843138, 0, 1,
-2.274267, 1.257355, 0.2073609, 1, 0.08235294, 0, 1,
-2.256817, -1.213436, -1.296216, 1, 0.09019608, 0, 1,
-2.158082, 0.5699843, -0.2610989, 1, 0.09411765, 0, 1,
-2.123626, 0.3773499, -1.623208, 1, 0.1019608, 0, 1,
-2.074619, 0.2003215, -2.602685, 1, 0.1098039, 0, 1,
-2.011949, -1.430215, -2.016808, 1, 0.1137255, 0, 1,
-1.987147, 0.7323416, -0.3132691, 1, 0.1215686, 0, 1,
-1.959004, -0.3439054, -3.121854, 1, 0.1254902, 0, 1,
-1.951763, 1.390567, -2.593845, 1, 0.1333333, 0, 1,
-1.919774, -0.09014503, -1.232651, 1, 0.1372549, 0, 1,
-1.916584, 0.1085062, -2.814777, 1, 0.145098, 0, 1,
-1.810858, -0.01991638, -3.715961, 1, 0.1490196, 0, 1,
-1.808092, -0.4896166, -1.858021, 1, 0.1568628, 0, 1,
-1.804049, -0.9518712, -2.64932, 1, 0.1607843, 0, 1,
-1.802068, -1.109324, -2.59333, 1, 0.1686275, 0, 1,
-1.780419, -2.118368, -2.212971, 1, 0.172549, 0, 1,
-1.779806, 0.1051754, -2.739782, 1, 0.1803922, 0, 1,
-1.768616, -0.7389471, -1.565104, 1, 0.1843137, 0, 1,
-1.766773, -0.01095782, -0.03680085, 1, 0.1921569, 0, 1,
-1.763559, -0.2052602, -1.648362, 1, 0.1960784, 0, 1,
-1.762908, 1.001017, 0.9719084, 1, 0.2039216, 0, 1,
-1.7592, -0.6692311, -2.676827, 1, 0.2117647, 0, 1,
-1.724734, -0.5112123, 1.080093, 1, 0.2156863, 0, 1,
-1.709527, -0.5597806, -2.73558, 1, 0.2235294, 0, 1,
-1.703601, -0.06661999, -2.104111, 1, 0.227451, 0, 1,
-1.701209, -0.7968008, -3.783755, 1, 0.2352941, 0, 1,
-1.683468, -0.06555262, -1.390417, 1, 0.2392157, 0, 1,
-1.682851, 0.3153864, -1.403125, 1, 0.2470588, 0, 1,
-1.67924, -0.2805702, -2.593561, 1, 0.2509804, 0, 1,
-1.668409, -1.533755, -1.401796, 1, 0.2588235, 0, 1,
-1.663875, 0.7503314, -1.690494, 1, 0.2627451, 0, 1,
-1.662386, 0.7265507, -2.176783, 1, 0.2705882, 0, 1,
-1.656655, 1.895543, -0.6296561, 1, 0.2745098, 0, 1,
-1.653926, 0.6267325, -2.807457, 1, 0.282353, 0, 1,
-1.640719, -0.3666011, -0.6026202, 1, 0.2862745, 0, 1,
-1.638194, -0.832606, -0.9717452, 1, 0.2941177, 0, 1,
-1.636699, 1.138908, 0.3034934, 1, 0.3019608, 0, 1,
-1.630873, 0.429649, -2.520853, 1, 0.3058824, 0, 1,
-1.629715, 0.1348253, -1.282605, 1, 0.3137255, 0, 1,
-1.623004, -0.8842619, -2.319293, 1, 0.3176471, 0, 1,
-1.622808, -0.3649026, -2.671705, 1, 0.3254902, 0, 1,
-1.614657, 0.09810697, -2.80986, 1, 0.3294118, 0, 1,
-1.612231, -0.4446791, -0.9284698, 1, 0.3372549, 0, 1,
-1.607579, 0.2277167, -1.831487, 1, 0.3411765, 0, 1,
-1.604241, 0.3766656, -2.294551, 1, 0.3490196, 0, 1,
-1.585176, 0.1962339, -0.6897123, 1, 0.3529412, 0, 1,
-1.571894, -0.8343906, -1.835331, 1, 0.3607843, 0, 1,
-1.568401, 0.9309176, -0.9625951, 1, 0.3647059, 0, 1,
-1.566599, 1.142777, -0.3555569, 1, 0.372549, 0, 1,
-1.545788, 1.408689, -0.7295009, 1, 0.3764706, 0, 1,
-1.542978, 0.9563539, -0.3676626, 1, 0.3843137, 0, 1,
-1.533081, -0.01059687, -1.791902, 1, 0.3882353, 0, 1,
-1.520877, -0.6293274, -3.102042, 1, 0.3960784, 0, 1,
-1.510402, 1.445844, 2.041631, 1, 0.4039216, 0, 1,
-1.504861, 1.516191, -0.5121657, 1, 0.4078431, 0, 1,
-1.48717, -0.3753857, -2.774686, 1, 0.4156863, 0, 1,
-1.482801, 0.4551946, -2.967972, 1, 0.4196078, 0, 1,
-1.478471, -0.3746927, -1.567246, 1, 0.427451, 0, 1,
-1.474658, -1.749428, -2.54985, 1, 0.4313726, 0, 1,
-1.447826, -0.795924, -1.44687, 1, 0.4392157, 0, 1,
-1.442926, -1.319009, -1.892913, 1, 0.4431373, 0, 1,
-1.407658, -1.384102, -3.298252, 1, 0.4509804, 0, 1,
-1.402913, 0.1106874, -2.031263, 1, 0.454902, 0, 1,
-1.399887, 0.7194375, -0.8195674, 1, 0.4627451, 0, 1,
-1.399825, 1.477352, 0.6551151, 1, 0.4666667, 0, 1,
-1.375316, 1.889893, 0.3417928, 1, 0.4745098, 0, 1,
-1.371289, -0.1218275, -2.423206, 1, 0.4784314, 0, 1,
-1.360776, -1.093697, -2.400204, 1, 0.4862745, 0, 1,
-1.358039, -2.499879, -4.7539, 1, 0.4901961, 0, 1,
-1.351402, 1.432855, -0.9029362, 1, 0.4980392, 0, 1,
-1.345406, 1.328045, 0.2527202, 1, 0.5058824, 0, 1,
-1.33583, 0.5410542, 0.06020265, 1, 0.509804, 0, 1,
-1.331689, -0.1177407, -1.500759, 1, 0.5176471, 0, 1,
-1.329568, 0.1164373, -1.434007, 1, 0.5215687, 0, 1,
-1.325093, 0.9602782, -0.2983319, 1, 0.5294118, 0, 1,
-1.324599, -1.532589, -2.760923, 1, 0.5333334, 0, 1,
-1.318474, 2.062898, -0.4969791, 1, 0.5411765, 0, 1,
-1.316342, 1.219788, -0.518249, 1, 0.5450981, 0, 1,
-1.313603, 1.646487, -1.664952, 1, 0.5529412, 0, 1,
-1.307719, -0.659197, -0.8604541, 1, 0.5568628, 0, 1,
-1.307193, 0.06605923, -2.223943, 1, 0.5647059, 0, 1,
-1.307069, 0.7292518, -0.4880762, 1, 0.5686275, 0, 1,
-1.293067, 0.3270843, -1.028473, 1, 0.5764706, 0, 1,
-1.292285, 0.05323019, 0.3653326, 1, 0.5803922, 0, 1,
-1.287419, -0.7240713, -1.189824, 1, 0.5882353, 0, 1,
-1.287243, -1.520112, -2.772135, 1, 0.5921569, 0, 1,
-1.285151, 1.319713, -0.6405927, 1, 0.6, 0, 1,
-1.28511, -0.8818317, -2.675858, 1, 0.6078432, 0, 1,
-1.281187, 0.8099498, -2.099205, 1, 0.6117647, 0, 1,
-1.276905, -0.7737913, -3.24791, 1, 0.6196079, 0, 1,
-1.273188, -0.03294687, -2.007771, 1, 0.6235294, 0, 1,
-1.267348, 0.2719111, -1.453337, 1, 0.6313726, 0, 1,
-1.263775, -0.5528929, -3.337826, 1, 0.6352941, 0, 1,
-1.258425, -0.4287606, -2.463704, 1, 0.6431373, 0, 1,
-1.251533, 0.1394558, -1.376124, 1, 0.6470588, 0, 1,
-1.249928, -0.4102617, -2.988979, 1, 0.654902, 0, 1,
-1.241797, -0.8514752, -1.286431, 1, 0.6588235, 0, 1,
-1.237072, -0.424031, -0.9176656, 1, 0.6666667, 0, 1,
-1.235487, 2.457431, -0.1815785, 1, 0.6705883, 0, 1,
-1.232811, -1.07422, -2.376545, 1, 0.6784314, 0, 1,
-1.230476, -2.966761, -3.654835, 1, 0.682353, 0, 1,
-1.229313, 1.986629, 0.4384917, 1, 0.6901961, 0, 1,
-1.223992, -0.5955014, -2.286335, 1, 0.6941177, 0, 1,
-1.216867, -0.1080392, -1.800334, 1, 0.7019608, 0, 1,
-1.214534, 1.221309, 0.5670144, 1, 0.7098039, 0, 1,
-1.207555, -0.419789, -3.64906, 1, 0.7137255, 0, 1,
-1.205734, 0.01974725, -2.177716, 1, 0.7215686, 0, 1,
-1.20469, 1.39124, -1.229501, 1, 0.7254902, 0, 1,
-1.204387, -0.2738743, -2.03119, 1, 0.7333333, 0, 1,
-1.198798, -1.002914, -1.955432, 1, 0.7372549, 0, 1,
-1.192282, -1.232755, -3.968771, 1, 0.7450981, 0, 1,
-1.188709, 1.677159, -0.2221896, 1, 0.7490196, 0, 1,
-1.186, 2.162429, 0.9769487, 1, 0.7568628, 0, 1,
-1.185802, 0.2337144, 1.511001, 1, 0.7607843, 0, 1,
-1.184303, 1.174878, -0.4694154, 1, 0.7686275, 0, 1,
-1.178554, 0.4343598, -1.084361, 1, 0.772549, 0, 1,
-1.173284, 0.5516517, -0.6185989, 1, 0.7803922, 0, 1,
-1.169174, 0.212139, -2.090317, 1, 0.7843137, 0, 1,
-1.168765, -1.98904, -1.888153, 1, 0.7921569, 0, 1,
-1.167483, -0.2627125, -2.483764, 1, 0.7960784, 0, 1,
-1.165459, 0.4194738, -0.6950988, 1, 0.8039216, 0, 1,
-1.160085, 0.4858681, -1.021661, 1, 0.8117647, 0, 1,
-1.156853, 1.196086, -0.6024223, 1, 0.8156863, 0, 1,
-1.14293, -2.153344, -2.111749, 1, 0.8235294, 0, 1,
-1.136364, 1.011436, -2.100192, 1, 0.827451, 0, 1,
-1.128226, 0.4936847, -1.468427, 1, 0.8352941, 0, 1,
-1.124091, 1.169449, 1.467733, 1, 0.8392157, 0, 1,
-1.120242, 0.06949311, -2.192718, 1, 0.8470588, 0, 1,
-1.115149, 0.8903727, 0.4851871, 1, 0.8509804, 0, 1,
-1.106113, 0.3847177, -0.4614993, 1, 0.8588235, 0, 1,
-1.103235, -0.4314422, -0.2512513, 1, 0.8627451, 0, 1,
-1.088278, -0.03536223, -2.741242, 1, 0.8705882, 0, 1,
-1.085626, 0.3467548, -1.771671, 1, 0.8745098, 0, 1,
-1.083566, 0.76491, -0.1625195, 1, 0.8823529, 0, 1,
-1.080918, -0.8718871, -0.9581761, 1, 0.8862745, 0, 1,
-1.080683, -0.7442878, -2.149947, 1, 0.8941177, 0, 1,
-1.075501, -0.4324889, -1.42865, 1, 0.8980392, 0, 1,
-1.070374, 0.1494843, -1.395989, 1, 0.9058824, 0, 1,
-1.059368, 0.2154135, -1.13171, 1, 0.9137255, 0, 1,
-1.054812, 0.572616, -1.810279, 1, 0.9176471, 0, 1,
-1.053179, -1.510311, -1.09416, 1, 0.9254902, 0, 1,
-1.053024, -0.5442904, -2.840874, 1, 0.9294118, 0, 1,
-1.048948, 0.8578436, -0.3103443, 1, 0.9372549, 0, 1,
-1.038908, 0.828777, -1.113059, 1, 0.9411765, 0, 1,
-1.026605, 0.3462139, -2.044359, 1, 0.9490196, 0, 1,
-1.024328, -0.3266044, -0.1894261, 1, 0.9529412, 0, 1,
-1.015533, -0.6749272, -0.6966605, 1, 0.9607843, 0, 1,
-1.01226, 1.665154, -0.6214092, 1, 0.9647059, 0, 1,
-1.003423, -1.792393, -2.630884, 1, 0.972549, 0, 1,
-0.9992222, -1.52375, -2.418278, 1, 0.9764706, 0, 1,
-0.9972093, -0.09241459, -0.8183042, 1, 0.9843137, 0, 1,
-0.9937762, -0.2157637, -1.511151, 1, 0.9882353, 0, 1,
-0.975581, 0.1539495, -0.5734717, 1, 0.9960784, 0, 1,
-0.9743004, 0.2137661, -0.1744688, 0.9960784, 1, 0, 1,
-0.9712265, 0.4982281, -3.298116, 0.9921569, 1, 0, 1,
-0.9656844, 0.8507475, -0.02799874, 0.9843137, 1, 0, 1,
-0.9645089, -0.4273804, -3.346137, 0.9803922, 1, 0, 1,
-0.9571372, 1.54644, -0.5086237, 0.972549, 1, 0, 1,
-0.9570716, -1.292655, -3.179662, 0.9686275, 1, 0, 1,
-0.9538572, 1.082102, -0.321109, 0.9607843, 1, 0, 1,
-0.9499122, -1.192557, -2.796178, 0.9568627, 1, 0, 1,
-0.9492106, 1.236252, 0.2787484, 0.9490196, 1, 0, 1,
-0.9424738, -0.3337686, -1.489758, 0.945098, 1, 0, 1,
-0.9422251, 0.4226303, -2.375529, 0.9372549, 1, 0, 1,
-0.9413363, -2.247733, -3.400584, 0.9333333, 1, 0, 1,
-0.9405666, 0.1706168, -0.1517455, 0.9254902, 1, 0, 1,
-0.9382441, -1.498068, -2.153746, 0.9215686, 1, 0, 1,
-0.9327081, -0.07248525, -1.981194, 0.9137255, 1, 0, 1,
-0.9287404, 1.577387, -0.4415936, 0.9098039, 1, 0, 1,
-0.9277251, -0.2857663, -3.010805, 0.9019608, 1, 0, 1,
-0.9242567, 0.3624862, -0.960246, 0.8941177, 1, 0, 1,
-0.9176421, 0.5159118, -0.9623412, 0.8901961, 1, 0, 1,
-0.9020767, 1.052341, 0.5036711, 0.8823529, 1, 0, 1,
-0.8985939, 0.9512583, -0.06092533, 0.8784314, 1, 0, 1,
-0.8961254, -0.247803, -4.735304, 0.8705882, 1, 0, 1,
-0.8864741, 0.6339981, -0.9449679, 0.8666667, 1, 0, 1,
-0.8864672, -0.5272321, -0.5841489, 0.8588235, 1, 0, 1,
-0.8790371, -0.2230584, -2.617891, 0.854902, 1, 0, 1,
-0.8773556, -1.738042, -3.170196, 0.8470588, 1, 0, 1,
-0.8736386, 2.641114, 1.141537, 0.8431373, 1, 0, 1,
-0.8678753, -1.031487, -1.819586, 0.8352941, 1, 0, 1,
-0.8667262, 1.517153, -0.4843688, 0.8313726, 1, 0, 1,
-0.8665339, 0.5856376, 1.06326, 0.8235294, 1, 0, 1,
-0.8648956, -0.6202632, -2.960329, 0.8196079, 1, 0, 1,
-0.8633088, -0.9274832, -2.884811, 0.8117647, 1, 0, 1,
-0.8601658, -0.720127, -1.837347, 0.8078431, 1, 0, 1,
-0.8568403, 1.531804, -1.692652, 0.8, 1, 0, 1,
-0.853709, -2.681773, -2.143568, 0.7921569, 1, 0, 1,
-0.8490558, 0.05439502, -1.721119, 0.7882353, 1, 0, 1,
-0.8473661, -1.508821, -1.63348, 0.7803922, 1, 0, 1,
-0.8347147, -1.107877, -3.869975, 0.7764706, 1, 0, 1,
-0.8236136, -2.125163, -2.911522, 0.7686275, 1, 0, 1,
-0.8223619, -0.3531186, -1.503178, 0.7647059, 1, 0, 1,
-0.8222353, 0.7764941, -0.01076266, 0.7568628, 1, 0, 1,
-0.8196153, 0.05175389, -3.181196, 0.7529412, 1, 0, 1,
-0.8179186, -0.1150881, -3.122709, 0.7450981, 1, 0, 1,
-0.8177184, -0.7985455, -1.691238, 0.7411765, 1, 0, 1,
-0.8133586, -0.1371818, -0.6285117, 0.7333333, 1, 0, 1,
-0.8116081, -0.3242332, -2.928098, 0.7294118, 1, 0, 1,
-0.8092185, 0.5062523, -0.3185956, 0.7215686, 1, 0, 1,
-0.8075341, -1.245134, -2.017947, 0.7176471, 1, 0, 1,
-0.8074518, -0.7339404, -2.745343, 0.7098039, 1, 0, 1,
-0.7962057, -1.699368, -3.322108, 0.7058824, 1, 0, 1,
-0.7924694, -0.1878759, -0.7870882, 0.6980392, 1, 0, 1,
-0.7818777, 1.214318, -0.05796458, 0.6901961, 1, 0, 1,
-0.7811002, -1.544642, -3.597358, 0.6862745, 1, 0, 1,
-0.7799875, -0.09326136, -1.314511, 0.6784314, 1, 0, 1,
-0.767275, -0.2171292, -1.822479, 0.6745098, 1, 0, 1,
-0.7569069, 1.271068, -1.722739, 0.6666667, 1, 0, 1,
-0.7481628, 1.075533, -1.216695, 0.6627451, 1, 0, 1,
-0.7439561, -0.2271625, -2.190624, 0.654902, 1, 0, 1,
-0.7417446, 1.006349, 0.4428127, 0.6509804, 1, 0, 1,
-0.7397099, 0.4046017, -2.538649, 0.6431373, 1, 0, 1,
-0.7325568, 1.151194, -1.124879, 0.6392157, 1, 0, 1,
-0.7321346, 0.9127431, -0.5590518, 0.6313726, 1, 0, 1,
-0.7316987, 2.056978, 0.4310434, 0.627451, 1, 0, 1,
-0.7316642, 0.07462732, -1.086746, 0.6196079, 1, 0, 1,
-0.7212794, 0.9330488, 0.05420426, 0.6156863, 1, 0, 1,
-0.7200994, -0.2656718, -3.053125, 0.6078432, 1, 0, 1,
-0.7162414, -0.03636706, -0.07168729, 0.6039216, 1, 0, 1,
-0.7153085, 0.02170198, -1.869437, 0.5960785, 1, 0, 1,
-0.7142394, 1.364406, 1.883519, 0.5882353, 1, 0, 1,
-0.7052739, -0.2433821, -1.569374, 0.5843138, 1, 0, 1,
-0.7041736, 1.055894, -1.808217, 0.5764706, 1, 0, 1,
-0.7032818, 1.962433, 1.015378, 0.572549, 1, 0, 1,
-0.7021776, -0.4490303, -3.82149, 0.5647059, 1, 0, 1,
-0.7009014, 1.549853, 0.1341201, 0.5607843, 1, 0, 1,
-0.6980577, -2.562889, -3.140405, 0.5529412, 1, 0, 1,
-0.6972414, 1.084282, 0.006410385, 0.5490196, 1, 0, 1,
-0.6971799, 0.561191, -1.294388, 0.5411765, 1, 0, 1,
-0.6957963, 0.5777363, -1.44656, 0.5372549, 1, 0, 1,
-0.689741, -0.7931814, -4.059656, 0.5294118, 1, 0, 1,
-0.6895536, -0.04215218, -1.842266, 0.5254902, 1, 0, 1,
-0.6854909, -0.06011382, 0.435197, 0.5176471, 1, 0, 1,
-0.680275, -0.8263251, -0.5725843, 0.5137255, 1, 0, 1,
-0.6773896, -0.5443045, -2.193661, 0.5058824, 1, 0, 1,
-0.6754255, -0.4981434, -1.902751, 0.5019608, 1, 0, 1,
-0.6674865, -0.3756317, -2.112676, 0.4941176, 1, 0, 1,
-0.6661327, 0.4426924, -0.6845505, 0.4862745, 1, 0, 1,
-0.6621807, 1.334569, 0.9751288, 0.4823529, 1, 0, 1,
-0.6609138, 0.5646705, -0.5061862, 0.4745098, 1, 0, 1,
-0.6562227, 0.5334907, -0.1032163, 0.4705882, 1, 0, 1,
-0.6422849, 0.4978837, -0.4881177, 0.4627451, 1, 0, 1,
-0.6373079, -0.3633826, -2.039086, 0.4588235, 1, 0, 1,
-0.6341655, 0.8278668, 1.436154, 0.4509804, 1, 0, 1,
-0.6329558, 0.4920291, -1.031307, 0.4470588, 1, 0, 1,
-0.6314644, -0.3676259, -1.550686, 0.4392157, 1, 0, 1,
-0.6248867, 1.067519, -0.9698322, 0.4352941, 1, 0, 1,
-0.6191244, -0.1997399, -2.527709, 0.427451, 1, 0, 1,
-0.6167641, -0.3886012, -2.344713, 0.4235294, 1, 0, 1,
-0.6134126, 1.202992, -0.3954537, 0.4156863, 1, 0, 1,
-0.61172, -2.162029, -3.846642, 0.4117647, 1, 0, 1,
-0.61088, -0.0213675, -2.305914, 0.4039216, 1, 0, 1,
-0.6098031, 1.60215, -0.1052883, 0.3960784, 1, 0, 1,
-0.6060101, 0.4591354, -1.137098, 0.3921569, 1, 0, 1,
-0.6055918, 0.9823511, -0.6850204, 0.3843137, 1, 0, 1,
-0.6044571, 0.4910896, -2.82034, 0.3803922, 1, 0, 1,
-0.6040276, 0.1612088, -1.865907, 0.372549, 1, 0, 1,
-0.6017052, -1.333814, -3.109302, 0.3686275, 1, 0, 1,
-0.600934, 0.9180436, -1.36882, 0.3607843, 1, 0, 1,
-0.5983698, -0.5435048, -2.73909, 0.3568628, 1, 0, 1,
-0.5949423, -0.2911088, -2.87731, 0.3490196, 1, 0, 1,
-0.5915532, 0.0908468, 0.5501276, 0.345098, 1, 0, 1,
-0.5879546, 1.055961, -1.437049, 0.3372549, 1, 0, 1,
-0.5747479, -1.25547, -1.838535, 0.3333333, 1, 0, 1,
-0.5712919, -2.124326, -2.189603, 0.3254902, 1, 0, 1,
-0.5661922, 0.743535, 1.348663, 0.3215686, 1, 0, 1,
-0.5643523, -0.4119411, -1.760282, 0.3137255, 1, 0, 1,
-0.5641309, -1.461836, -3.665192, 0.3098039, 1, 0, 1,
-0.5618241, 1.89689, 1.34028, 0.3019608, 1, 0, 1,
-0.5582588, 0.5411349, 0.8740466, 0.2941177, 1, 0, 1,
-0.5567433, 0.9193801, -1.621325, 0.2901961, 1, 0, 1,
-0.5561683, -0.1122098, -1.6618, 0.282353, 1, 0, 1,
-0.5515538, -1.592821, -3.063796, 0.2784314, 1, 0, 1,
-0.5484056, -0.3471697, -2.619498, 0.2705882, 1, 0, 1,
-0.5478033, -2.335977, -2.431148, 0.2666667, 1, 0, 1,
-0.5405629, -0.4062385, -1.880485, 0.2588235, 1, 0, 1,
-0.5371388, -1.339084, -2.677064, 0.254902, 1, 0, 1,
-0.5354013, 0.9042261, -1.357339, 0.2470588, 1, 0, 1,
-0.5315625, -2.31775, -2.205683, 0.2431373, 1, 0, 1,
-0.5262328, 0.3022401, -0.2974281, 0.2352941, 1, 0, 1,
-0.5212352, -0.1056979, -2.870798, 0.2313726, 1, 0, 1,
-0.5192105, -0.1298613, -1.10124, 0.2235294, 1, 0, 1,
-0.5058089, 0.08525684, -2.136785, 0.2196078, 1, 0, 1,
-0.5037955, 0.6105996, -0.9998937, 0.2117647, 1, 0, 1,
-0.5004263, 1.728399, -2.482017, 0.2078431, 1, 0, 1,
-0.4993188, -2.233588, -2.743209, 0.2, 1, 0, 1,
-0.4962133, -0.96141, -1.512494, 0.1921569, 1, 0, 1,
-0.4955861, -0.3814945, -1.677485, 0.1882353, 1, 0, 1,
-0.4901938, 0.09144296, -1.558933, 0.1803922, 1, 0, 1,
-0.4877131, -1.025787, -4.397745, 0.1764706, 1, 0, 1,
-0.4856606, -0.686478, -2.378427, 0.1686275, 1, 0, 1,
-0.4780037, 0.01558992, 0.4426437, 0.1647059, 1, 0, 1,
-0.4737256, -1.144093, -3.093711, 0.1568628, 1, 0, 1,
-0.472844, -0.2514969, -3.043451, 0.1529412, 1, 0, 1,
-0.4683208, 0.5069591, -0.1531819, 0.145098, 1, 0, 1,
-0.4681218, 0.138387, -0.4640253, 0.1411765, 1, 0, 1,
-0.4678703, -0.02428247, -2.117185, 0.1333333, 1, 0, 1,
-0.4609987, -1.352743, -3.662661, 0.1294118, 1, 0, 1,
-0.454298, 0.5860054, 1.752703, 0.1215686, 1, 0, 1,
-0.453263, -0.6302287, -1.496422, 0.1176471, 1, 0, 1,
-0.4483152, -1.209926, -2.825595, 0.1098039, 1, 0, 1,
-0.4420098, 3.050809, 0.5697725, 0.1058824, 1, 0, 1,
-0.438711, 0.04555508, -1.330311, 0.09803922, 1, 0, 1,
-0.4309943, 0.1700774, -0.7354617, 0.09019608, 1, 0, 1,
-0.4296217, 0.4727055, 0.4258177, 0.08627451, 1, 0, 1,
-0.4283192, -1.963674, -2.938932, 0.07843138, 1, 0, 1,
-0.4207695, -0.7258305, -1.962541, 0.07450981, 1, 0, 1,
-0.4179748, -1.375584, -2.965099, 0.06666667, 1, 0, 1,
-0.4179605, -0.2167446, -2.148304, 0.0627451, 1, 0, 1,
-0.4158983, -1.11843, -3.902948, 0.05490196, 1, 0, 1,
-0.4136129, 0.2044494, -0.2106318, 0.05098039, 1, 0, 1,
-0.4107606, 0.787406, -0.8774594, 0.04313726, 1, 0, 1,
-0.4079511, 0.1988018, -0.3518388, 0.03921569, 1, 0, 1,
-0.4064364, 1.345172, 0.9286813, 0.03137255, 1, 0, 1,
-0.3978525, 1.100615, -0.8770184, 0.02745098, 1, 0, 1,
-0.3868223, 0.9537917, -0.01896146, 0.01960784, 1, 0, 1,
-0.3840982, 1.211473, -1.302108, 0.01568628, 1, 0, 1,
-0.3815288, -1.199244, -1.779771, 0.007843138, 1, 0, 1,
-0.3788501, 0.5996868, -1.394843, 0.003921569, 1, 0, 1,
-0.3776651, -1.766428, -2.603485, 0, 1, 0.003921569, 1,
-0.3775644, -2.110013, -2.24811, 0, 1, 0.01176471, 1,
-0.3746341, -1.416216, -2.524599, 0, 1, 0.01568628, 1,
-0.3700675, 0.9860175, 1.634678, 0, 1, 0.02352941, 1,
-0.3698199, 0.7672324, -0.99605, 0, 1, 0.02745098, 1,
-0.3672036, 0.00203056, -1.288827, 0, 1, 0.03529412, 1,
-0.3663308, -0.8695921, -2.418917, 0, 1, 0.03921569, 1,
-0.3642401, -0.6480643, -1.797763, 0, 1, 0.04705882, 1,
-0.3597121, -0.3427016, -1.535333, 0, 1, 0.05098039, 1,
-0.3575713, 1.453634, -0.3004104, 0, 1, 0.05882353, 1,
-0.3564844, -1.322821, -1.979675, 0, 1, 0.0627451, 1,
-0.3564093, -0.1625826, -1.527666, 0, 1, 0.07058824, 1,
-0.3543079, -1.025833, -3.061631, 0, 1, 0.07450981, 1,
-0.3522753, -1.142188, -1.82485, 0, 1, 0.08235294, 1,
-0.3512625, -1.167913, -5.124095, 0, 1, 0.08627451, 1,
-0.3454134, 1.056092, 0.3314384, 0, 1, 0.09411765, 1,
-0.3452561, 3.50741, 0.01528003, 0, 1, 0.1019608, 1,
-0.3441833, 0.03708065, -2.111734, 0, 1, 0.1058824, 1,
-0.3429641, 0.3561705, -0.8620756, 0, 1, 0.1137255, 1,
-0.3403061, -0.4383668, -3.420401, 0, 1, 0.1176471, 1,
-0.335687, -0.01544519, -2.799532, 0, 1, 0.1254902, 1,
-0.3356326, -1.661449, -1.290965, 0, 1, 0.1294118, 1,
-0.3348619, 0.5488416, 0.992797, 0, 1, 0.1372549, 1,
-0.3309684, 0.2270202, -0.2142214, 0, 1, 0.1411765, 1,
-0.3304027, 0.6006497, -1.242861, 0, 1, 0.1490196, 1,
-0.3103163, -0.5869598, -2.505508, 0, 1, 0.1529412, 1,
-0.3089326, -0.187561, -1.590293, 0, 1, 0.1607843, 1,
-0.3071291, 1.996592, 0.7119841, 0, 1, 0.1647059, 1,
-0.3026598, -1.257734, -5.046487, 0, 1, 0.172549, 1,
-0.301839, 0.3472391, -0.1770762, 0, 1, 0.1764706, 1,
-0.2990335, 1.360926, 0.3933344, 0, 1, 0.1843137, 1,
-0.2875243, 0.3437821, -0.9270797, 0, 1, 0.1882353, 1,
-0.2869777, -1.49544, -2.201512, 0, 1, 0.1960784, 1,
-0.2857013, -0.3999571, -0.5371247, 0, 1, 0.2039216, 1,
-0.2787214, -1.722203, -2.528026, 0, 1, 0.2078431, 1,
-0.2716114, 0.8066812, -1.815004, 0, 1, 0.2156863, 1,
-0.2701989, -0.2230326, -1.507469, 0, 1, 0.2196078, 1,
-0.2700849, -1.043681, -2.240757, 0, 1, 0.227451, 1,
-0.2674988, -0.3568299, -2.669635, 0, 1, 0.2313726, 1,
-0.2665015, -0.8637019, -2.988093, 0, 1, 0.2392157, 1,
-0.2661001, 0.680816, -0.1599054, 0, 1, 0.2431373, 1,
-0.2654169, -0.6192714, -2.048523, 0, 1, 0.2509804, 1,
-0.2540802, 0.516575, -1.031032, 0, 1, 0.254902, 1,
-0.2528579, -0.01363946, -0.4318761, 0, 1, 0.2627451, 1,
-0.2520095, 0.1203574, -3.42479, 0, 1, 0.2666667, 1,
-0.2513748, 0.5831608, -1.396717, 0, 1, 0.2745098, 1,
-0.2443342, -0.3952285, -3.657818, 0, 1, 0.2784314, 1,
-0.2414607, -1.559532, -5.435182, 0, 1, 0.2862745, 1,
-0.2402514, -1.753502, -1.221901, 0, 1, 0.2901961, 1,
-0.2371162, 1.44, -1.472093, 0, 1, 0.2980392, 1,
-0.2366659, -1.551014, -3.323261, 0, 1, 0.3058824, 1,
-0.2346436, 0.5417565, 0.0272977, 0, 1, 0.3098039, 1,
-0.2278466, 1.345472, 0.07209022, 0, 1, 0.3176471, 1,
-0.2239951, 1.348876, 0.006029748, 0, 1, 0.3215686, 1,
-0.223331, 0.4509634, -0.9034337, 0, 1, 0.3294118, 1,
-0.2225075, 0.2869891, -1.611291, 0, 1, 0.3333333, 1,
-0.2196606, 0.3244615, -1.820047, 0, 1, 0.3411765, 1,
-0.2184092, 1.007585, -1.379462, 0, 1, 0.345098, 1,
-0.2177738, -1.826622, -2.45835, 0, 1, 0.3529412, 1,
-0.2177003, -1.066017, -3.404788, 0, 1, 0.3568628, 1,
-0.2158535, 0.1120563, -1.642144, 0, 1, 0.3647059, 1,
-0.2145182, -0.4137293, -2.916407, 0, 1, 0.3686275, 1,
-0.2132103, 0.1617698, -1.219397, 0, 1, 0.3764706, 1,
-0.2070802, -1.586887, -3.707485, 0, 1, 0.3803922, 1,
-0.2070158, -2.35464, -1.210405, 0, 1, 0.3882353, 1,
-0.2064163, -1.290643, -3.842883, 0, 1, 0.3921569, 1,
-0.2045406, 0.2574204, 0.2628953, 0, 1, 0.4, 1,
-0.2025916, -0.6651322, -3.312447, 0, 1, 0.4078431, 1,
-0.2019771, 0.6560869, -0.4737417, 0, 1, 0.4117647, 1,
-0.2016452, -0.7685789, -4.142315, 0, 1, 0.4196078, 1,
-0.201645, -1.002699, -3.416947, 0, 1, 0.4235294, 1,
-0.2009656, 0.4573354, 0.8685339, 0, 1, 0.4313726, 1,
-0.1992094, 1.118398, -1.114915, 0, 1, 0.4352941, 1,
-0.1982896, -2.56868, -3.721921, 0, 1, 0.4431373, 1,
-0.1971147, -1.650727, -0.9304218, 0, 1, 0.4470588, 1,
-0.1967606, -0.3382709, -1.207166, 0, 1, 0.454902, 1,
-0.195016, -0.2722382, -1.42228, 0, 1, 0.4588235, 1,
-0.1910791, -2.089702, -3.704603, 0, 1, 0.4666667, 1,
-0.1905647, -0.3720396, -1.803255, 0, 1, 0.4705882, 1,
-0.188272, -0.1734516, -2.061293, 0, 1, 0.4784314, 1,
-0.1877603, -0.2744083, -2.941194, 0, 1, 0.4823529, 1,
-0.1852558, -1.993541, -1.666401, 0, 1, 0.4901961, 1,
-0.1780715, -0.04867209, -0.306518, 0, 1, 0.4941176, 1,
-0.1767825, -0.7061131, -3.068564, 0, 1, 0.5019608, 1,
-0.1752197, 0.0176732, -0.5600029, 0, 1, 0.509804, 1,
-0.1714954, 0.9389191, 0.6516949, 0, 1, 0.5137255, 1,
-0.1714633, 0.6748209, -0.5551398, 0, 1, 0.5215687, 1,
-0.166185, -1.790018, -3.141336, 0, 1, 0.5254902, 1,
-0.165222, 0.2773466, -0.8494127, 0, 1, 0.5333334, 1,
-0.1587681, -0.5224701, -2.292363, 0, 1, 0.5372549, 1,
-0.157278, 1.573288, -0.2475795, 0, 1, 0.5450981, 1,
-0.1508956, 0.4404128, -0.6512827, 0, 1, 0.5490196, 1,
-0.1461141, -0.5174755, -2.346731, 0, 1, 0.5568628, 1,
-0.1386665, -2.587835, -1.753212, 0, 1, 0.5607843, 1,
-0.1381367, 1.392725, 1.342973, 0, 1, 0.5686275, 1,
-0.1365738, 0.3618386, -1.210949, 0, 1, 0.572549, 1,
-0.1359685, -0.07585115, -3.391657, 0, 1, 0.5803922, 1,
-0.1338256, -0.4031397, -3.14706, 0, 1, 0.5843138, 1,
-0.1317898, 0.687494, -1.723949, 0, 1, 0.5921569, 1,
-0.1280681, -0.2905586, -2.434443, 0, 1, 0.5960785, 1,
-0.1240911, 1.071514, 1.806492, 0, 1, 0.6039216, 1,
-0.1227027, 1.11017, -1.562502, 0, 1, 0.6117647, 1,
-0.1182624, -0.3862575, -1.597271, 0, 1, 0.6156863, 1,
-0.1182194, 0.2096626, -0.4996042, 0, 1, 0.6235294, 1,
-0.117292, 0.4867835, -0.377702, 0, 1, 0.627451, 1,
-0.1164619, -1.814288, -2.973819, 0, 1, 0.6352941, 1,
-0.1131333, -2.372085, -4.373092, 0, 1, 0.6392157, 1,
-0.1097936, 0.01331344, -1.100239, 0, 1, 0.6470588, 1,
-0.1056164, -0.9860798, -4.079472, 0, 1, 0.6509804, 1,
-0.09871182, -0.1521971, -2.714142, 0, 1, 0.6588235, 1,
-0.09695803, 0.1649268, -0.9582549, 0, 1, 0.6627451, 1,
-0.09679796, 0.329536, 0.155846, 0, 1, 0.6705883, 1,
-0.09528468, 0.2422376, -3.162728, 0, 1, 0.6745098, 1,
-0.09344454, -1.914796, -2.993064, 0, 1, 0.682353, 1,
-0.0881583, -0.2750744, -2.064438, 0, 1, 0.6862745, 1,
-0.08288556, -1.820806, -4.23564, 0, 1, 0.6941177, 1,
-0.08217292, 0.646217, 0.2523623, 0, 1, 0.7019608, 1,
-0.07320599, -1.534304, -3.99971, 0, 1, 0.7058824, 1,
-0.0679155, 0.4780103, 0.2353102, 0, 1, 0.7137255, 1,
-0.06741808, 0.5711576, 0.03102235, 0, 1, 0.7176471, 1,
-0.06259944, 0.08658125, -1.288567, 0, 1, 0.7254902, 1,
-0.06062315, 0.1539602, -0.5503628, 0, 1, 0.7294118, 1,
-0.05803452, -0.5951915, -3.175325, 0, 1, 0.7372549, 1,
-0.05325565, 1.55001, 1.345112, 0, 1, 0.7411765, 1,
-0.0528012, -0.1567736, -3.834845, 0, 1, 0.7490196, 1,
-0.05211059, -1.19829, -3.117734, 0, 1, 0.7529412, 1,
-0.05022867, 0.3142243, 0.722449, 0, 1, 0.7607843, 1,
-0.04962852, 1.037369, -1.001441, 0, 1, 0.7647059, 1,
-0.04419484, -0.2579583, -3.271026, 0, 1, 0.772549, 1,
-0.04226785, -0.01629123, -2.801278, 0, 1, 0.7764706, 1,
-0.04141206, -0.3160606, -3.702884, 0, 1, 0.7843137, 1,
-0.03146939, 0.1512125, -1.774965, 0, 1, 0.7882353, 1,
-0.02837666, 0.2527304, 1.485003, 0, 1, 0.7960784, 1,
-0.0263816, 0.08459267, 0.9552467, 0, 1, 0.8039216, 1,
-0.02638052, 1.392666, -0.9744446, 0, 1, 0.8078431, 1,
-0.02303605, 0.1449734, 0.8411877, 0, 1, 0.8156863, 1,
-0.02133742, 0.8844727, -0.4283037, 0, 1, 0.8196079, 1,
-0.01722801, -0.3021975, -0.5512026, 0, 1, 0.827451, 1,
-0.01194453, -0.4174143, -4.649047, 0, 1, 0.8313726, 1,
-0.01013271, -1.430651, -2.726992, 0, 1, 0.8392157, 1,
-0.00903459, 0.3148068, 0.05400142, 0, 1, 0.8431373, 1,
-0.005550073, 2.012649, 0.3176101, 0, 1, 0.8509804, 1,
-0.00498538, -0.8693982, -2.994264, 0, 1, 0.854902, 1,
-0.002489572, -0.2128993, -2.535552, 0, 1, 0.8627451, 1,
-0.001328264, 0.4403501, -1.424284, 0, 1, 0.8666667, 1,
-0.0003018287, -0.04756415, -2.252807, 0, 1, 0.8745098, 1,
0.008853419, 0.1284043, -0.1455542, 0, 1, 0.8784314, 1,
0.01179542, 0.2052202, 1.074616, 0, 1, 0.8862745, 1,
0.01346505, 0.6047445, -1.383977, 0, 1, 0.8901961, 1,
0.01573688, -0.6486988, 3.643234, 0, 1, 0.8980392, 1,
0.01621646, 0.9756099, 0.6121692, 0, 1, 0.9058824, 1,
0.01852747, 0.5163246, 1.435581, 0, 1, 0.9098039, 1,
0.02519332, 0.5578739, -1.904048, 0, 1, 0.9176471, 1,
0.02612413, 0.9054782, 1.654405, 0, 1, 0.9215686, 1,
0.02898474, -0.6582118, 3.253664, 0, 1, 0.9294118, 1,
0.03123051, 0.7364998, -2.310521, 0, 1, 0.9333333, 1,
0.0362565, -0.4945025, 2.396111, 0, 1, 0.9411765, 1,
0.03745636, -1.072168, 1.607375, 0, 1, 0.945098, 1,
0.04086113, 0.02444879, 0.3215808, 0, 1, 0.9529412, 1,
0.04173923, -0.1415984, 2.952348, 0, 1, 0.9568627, 1,
0.046785, -0.0886069, 3.375477, 0, 1, 0.9647059, 1,
0.04790581, 1.620178, -1.366769, 0, 1, 0.9686275, 1,
0.0529971, 0.1921635, 0.814725, 0, 1, 0.9764706, 1,
0.0540954, -0.01537965, 1.078591, 0, 1, 0.9803922, 1,
0.05931289, -0.6232538, 5.083756, 0, 1, 0.9882353, 1,
0.06373166, 0.9096856, 1.191219, 0, 1, 0.9921569, 1,
0.06598843, 0.3679774, 1.383775, 0, 1, 1, 1,
0.0672866, 0.933594, 0.4786635, 0, 0.9921569, 1, 1,
0.06872869, -0.198278, 3.525248, 0, 0.9882353, 1, 1,
0.07465933, -1.354613, 3.60543, 0, 0.9803922, 1, 1,
0.07523415, 1.321871, -0.5629497, 0, 0.9764706, 1, 1,
0.0763429, -1.25763, 3.092576, 0, 0.9686275, 1, 1,
0.07653616, -0.4234274, 3.230983, 0, 0.9647059, 1, 1,
0.07831235, -1.270671, 3.111714, 0, 0.9568627, 1, 1,
0.08379383, -2.031607, 3.955018, 0, 0.9529412, 1, 1,
0.08878221, 0.5567278, 0.6963052, 0, 0.945098, 1, 1,
0.0924494, -0.3600212, 1.966194, 0, 0.9411765, 1, 1,
0.09660538, -0.46118, 4.357151, 0, 0.9333333, 1, 1,
0.102083, 0.2637362, 0.1211182, 0, 0.9294118, 1, 1,
0.1025084, -1.247553, 2.578309, 0, 0.9215686, 1, 1,
0.1029587, -0.1551285, 2.227935, 0, 0.9176471, 1, 1,
0.1048946, -0.04814404, 2.629932, 0, 0.9098039, 1, 1,
0.1138147, 1.876253, 2.335912, 0, 0.9058824, 1, 1,
0.115799, 0.01533253, -0.45914, 0, 0.8980392, 1, 1,
0.1170331, 0.2568699, 1.205944, 0, 0.8901961, 1, 1,
0.1225606, -0.1787154, 2.155491, 0, 0.8862745, 1, 1,
0.1227685, 0.6918699, 0.3009985, 0, 0.8784314, 1, 1,
0.1234268, 0.4221415, -1.142673, 0, 0.8745098, 1, 1,
0.1253405, -0.5304669, 3.250455, 0, 0.8666667, 1, 1,
0.1283095, 0.1917616, -0.5096124, 0, 0.8627451, 1, 1,
0.1286265, -0.9669734, 3.730351, 0, 0.854902, 1, 1,
0.1411424, 1.771151, 0.683901, 0, 0.8509804, 1, 1,
0.1441867, -0.9604638, 1.959856, 0, 0.8431373, 1, 1,
0.1490483, -0.8400103, 2.292033, 0, 0.8392157, 1, 1,
0.1526859, 1.955909, -0.4587112, 0, 0.8313726, 1, 1,
0.1632062, 0.8774948, -0.907595, 0, 0.827451, 1, 1,
0.1642443, 0.003176435, 1.23462, 0, 0.8196079, 1, 1,
0.1647495, 0.3019634, -0.005767909, 0, 0.8156863, 1, 1,
0.1669922, -0.7181349, 1.188984, 0, 0.8078431, 1, 1,
0.1695825, 0.5045906, -1.660916, 0, 0.8039216, 1, 1,
0.1715254, -1.358481, 1.56587, 0, 0.7960784, 1, 1,
0.1731479, -0.4357256, 2.077343, 0, 0.7882353, 1, 1,
0.1744064, 0.3195014, -0.0812732, 0, 0.7843137, 1, 1,
0.1780075, -0.1540553, 3.848495, 0, 0.7764706, 1, 1,
0.1785389, 0.2992687, 0.9465541, 0, 0.772549, 1, 1,
0.1826908, -1.178784, 3.82847, 0, 0.7647059, 1, 1,
0.1871774, -0.07122009, 0.3325136, 0, 0.7607843, 1, 1,
0.2037768, 0.9723663, 0.1050256, 0, 0.7529412, 1, 1,
0.20777, 0.3865267, 0.2831222, 0, 0.7490196, 1, 1,
0.2082962, -1.188257, 1.616381, 0, 0.7411765, 1, 1,
0.2096675, 2.234371, 0.06555386, 0, 0.7372549, 1, 1,
0.215965, -1.060228, 3.055779, 0, 0.7294118, 1, 1,
0.2179739, 0.006127548, 0.637904, 0, 0.7254902, 1, 1,
0.2275706, 1.494961, -0.3112182, 0, 0.7176471, 1, 1,
0.2318723, 0.4499414, -0.9879337, 0, 0.7137255, 1, 1,
0.23885, 0.6578383, 1.689838, 0, 0.7058824, 1, 1,
0.240165, -0.0998261, 1.617433, 0, 0.6980392, 1, 1,
0.2416292, 1.564098, 0.6283101, 0, 0.6941177, 1, 1,
0.2458548, -0.4444467, 3.539508, 0, 0.6862745, 1, 1,
0.2488841, 0.53025, -1.706641, 0, 0.682353, 1, 1,
0.2492652, -0.4569362, 2.961529, 0, 0.6745098, 1, 1,
0.2498578, -0.1546439, 2.936952, 0, 0.6705883, 1, 1,
0.2523586, 0.9458779, -0.3482135, 0, 0.6627451, 1, 1,
0.253701, -0.2208672, 5.080469, 0, 0.6588235, 1, 1,
0.2573821, 0.2752396, 0.3975579, 0, 0.6509804, 1, 1,
0.2582612, -0.3394047, 4.495216, 0, 0.6470588, 1, 1,
0.2584972, 1.208282, -0.05587385, 0, 0.6392157, 1, 1,
0.2610939, -2.27947, 2.684341, 0, 0.6352941, 1, 1,
0.2614189, -0.04893466, 0.6245161, 0, 0.627451, 1, 1,
0.2666965, 0.1683657, -1.251725, 0, 0.6235294, 1, 1,
0.2726078, -0.6042243, 1.514186, 0, 0.6156863, 1, 1,
0.275233, -0.2373786, 1.400271, 0, 0.6117647, 1, 1,
0.275785, -0.04223438, 0.7219375, 0, 0.6039216, 1, 1,
0.2774754, -0.1743865, 2.059753, 0, 0.5960785, 1, 1,
0.2796747, -2.229256, 3.677965, 0, 0.5921569, 1, 1,
0.281252, 1.43419, -0.6987443, 0, 0.5843138, 1, 1,
0.2839633, -0.3726988, 1.642825, 0, 0.5803922, 1, 1,
0.2873574, 0.7159672, -0.7089272, 0, 0.572549, 1, 1,
0.2880833, -1.03795, 2.440662, 0, 0.5686275, 1, 1,
0.2896951, 1.222464, -0.08917777, 0, 0.5607843, 1, 1,
0.2938051, -0.3928117, 2.094798, 0, 0.5568628, 1, 1,
0.3012519, -0.8199247, 1.648419, 0, 0.5490196, 1, 1,
0.304922, 1.011506, -1.616586, 0, 0.5450981, 1, 1,
0.3057511, 1.082902, 1.576689, 0, 0.5372549, 1, 1,
0.309374, 0.4887176, -2.03803, 0, 0.5333334, 1, 1,
0.3119475, -0.009082542, 0.8907279, 0, 0.5254902, 1, 1,
0.3132013, -0.6738616, 3.902292, 0, 0.5215687, 1, 1,
0.3158194, -1.432967, 3.561318, 0, 0.5137255, 1, 1,
0.3186874, 1.324933, 0.6148608, 0, 0.509804, 1, 1,
0.3187484, -0.1162926, 3.264125, 0, 0.5019608, 1, 1,
0.3190264, 0.06151662, 2.511174, 0, 0.4941176, 1, 1,
0.322539, 0.5580118, 1.145875, 0, 0.4901961, 1, 1,
0.3313014, -1.71227, 5.457982, 0, 0.4823529, 1, 1,
0.3314168, 0.1609093, 1.87948, 0, 0.4784314, 1, 1,
0.3348548, 0.2093223, 2.688357, 0, 0.4705882, 1, 1,
0.3350605, -0.007949119, 2.49946, 0, 0.4666667, 1, 1,
0.3472093, -0.1220467, 3.302905, 0, 0.4588235, 1, 1,
0.3478085, 1.06334, 0.06462163, 0, 0.454902, 1, 1,
0.3547316, -0.2455103, 2.700168, 0, 0.4470588, 1, 1,
0.3572579, 0.3474823, 0.4440754, 0, 0.4431373, 1, 1,
0.3610062, 1.19141, -0.4044718, 0, 0.4352941, 1, 1,
0.362194, -0.9247399, 2.124006, 0, 0.4313726, 1, 1,
0.3670639, 1.594344, -0.07413484, 0, 0.4235294, 1, 1,
0.3730476, -1.626964, 1.294098, 0, 0.4196078, 1, 1,
0.3748628, 0.09013481, 1.808866, 0, 0.4117647, 1, 1,
0.3764524, -0.6113076, 3.909869, 0, 0.4078431, 1, 1,
0.3774996, -0.6897073, 1.967429, 0, 0.4, 1, 1,
0.3795392, -1.406151, 2.744741, 0, 0.3921569, 1, 1,
0.3806144, -0.6505865, 3.160001, 0, 0.3882353, 1, 1,
0.3816427, -0.794522, 2.61357, 0, 0.3803922, 1, 1,
0.3816437, 0.5035131, 0.6103441, 0, 0.3764706, 1, 1,
0.3842964, 1.975066, 1.41524, 0, 0.3686275, 1, 1,
0.3937725, -2.037235, 3.506744, 0, 0.3647059, 1, 1,
0.3945671, 0.4001041, 0.6516865, 0, 0.3568628, 1, 1,
0.3952231, 1.664084, -1.202676, 0, 0.3529412, 1, 1,
0.396327, -1.717722, 1.226361, 0, 0.345098, 1, 1,
0.3976788, -1.585394, 1.773609, 0, 0.3411765, 1, 1,
0.3981598, -0.7287808, 2.499462, 0, 0.3333333, 1, 1,
0.4017998, 0.2309972, 2.541807, 0, 0.3294118, 1, 1,
0.4099734, 0.2015555, 2.613956, 0, 0.3215686, 1, 1,
0.4125113, -0.2446649, 0.5965901, 0, 0.3176471, 1, 1,
0.4133026, 1.792955, 0.3317525, 0, 0.3098039, 1, 1,
0.4176297, 1.845411, 1.030794, 0, 0.3058824, 1, 1,
0.4179843, -1.944492, 2.564891, 0, 0.2980392, 1, 1,
0.4250293, -1.565377, 4.758242, 0, 0.2901961, 1, 1,
0.4257698, 0.6648972, -0.04559695, 0, 0.2862745, 1, 1,
0.4258127, -0.4873641, 3.441944, 0, 0.2784314, 1, 1,
0.4259253, 1.11271, -0.4124462, 0, 0.2745098, 1, 1,
0.4304374, 0.1186181, 1.126543, 0, 0.2666667, 1, 1,
0.4306548, 0.8457287, 1.360223, 0, 0.2627451, 1, 1,
0.4325989, -2.162774, 3.112163, 0, 0.254902, 1, 1,
0.4332044, 1.250414, 1.406351, 0, 0.2509804, 1, 1,
0.4364178, 0.7020597, -0.3820067, 0, 0.2431373, 1, 1,
0.4386018, 1.220542, 0.8587443, 0, 0.2392157, 1, 1,
0.4412249, -0.6470126, 2.630921, 0, 0.2313726, 1, 1,
0.4416279, -0.3909915, 2.261483, 0, 0.227451, 1, 1,
0.4420279, 1.13614, 1.419227, 0, 0.2196078, 1, 1,
0.4426891, -0.6023089, 3.189398, 0, 0.2156863, 1, 1,
0.4428532, 0.5447116, -0.01792659, 0, 0.2078431, 1, 1,
0.4456509, 0.7933302, 0.0871162, 0, 0.2039216, 1, 1,
0.4477309, 0.5333428, 0.1297912, 0, 0.1960784, 1, 1,
0.4554157, -0.1091206, 1.964057, 0, 0.1882353, 1, 1,
0.4563709, 0.3371763, -0.08494121, 0, 0.1843137, 1, 1,
0.4582328, 1.398602, 1.513655, 0, 0.1764706, 1, 1,
0.458759, -0.4617905, 1.801224, 0, 0.172549, 1, 1,
0.4644038, 1.064601, 1.639371, 0, 0.1647059, 1, 1,
0.4647365, 2.179773, -0.6789986, 0, 0.1607843, 1, 1,
0.4657454, -0.7713928, 3.213116, 0, 0.1529412, 1, 1,
0.4662682, 1.927143, 0.6908599, 0, 0.1490196, 1, 1,
0.4728942, -0.2155286, 2.633713, 0, 0.1411765, 1, 1,
0.4755178, 0.3527102, 0.6463543, 0, 0.1372549, 1, 1,
0.4778595, -1.161268, 3.14891, 0, 0.1294118, 1, 1,
0.4778778, 0.06541113, 2.747971, 0, 0.1254902, 1, 1,
0.4797901, -2.174228, 3.403954, 0, 0.1176471, 1, 1,
0.48071, -0.0478249, 2.155207, 0, 0.1137255, 1, 1,
0.4858736, -0.9037597, 2.764943, 0, 0.1058824, 1, 1,
0.49097, -0.8018119, 4.31797, 0, 0.09803922, 1, 1,
0.4919658, -0.5018843, 2.611358, 0, 0.09411765, 1, 1,
0.4950265, -0.3880989, 2.541774, 0, 0.08627451, 1, 1,
0.4976177, -0.7631961, 2.29376, 0, 0.08235294, 1, 1,
0.5058527, -0.4087926, 3.799728, 0, 0.07450981, 1, 1,
0.5082628, 0.1522, 1.70695, 0, 0.07058824, 1, 1,
0.5093766, 0.9833863, 2.171726, 0, 0.0627451, 1, 1,
0.5127377, 2.085959, 0.2940508, 0, 0.05882353, 1, 1,
0.5172195, -1.021353, 3.437738, 0, 0.05098039, 1, 1,
0.5178701, 0.2545183, 1.863635, 0, 0.04705882, 1, 1,
0.5229576, 0.129032, 2.986817, 0, 0.03921569, 1, 1,
0.5243436, -0.3116882, 1.795853, 0, 0.03529412, 1, 1,
0.5250993, -0.9809366, 2.321397, 0, 0.02745098, 1, 1,
0.5324638, -1.232993, 1.941751, 0, 0.02352941, 1, 1,
0.5334937, 0.217691, 2.114444, 0, 0.01568628, 1, 1,
0.5335968, -2.055262, 3.591638, 0, 0.01176471, 1, 1,
0.5340729, -0.9294361, 3.179311, 0, 0.003921569, 1, 1,
0.5389724, -0.4623286, -0.160852, 0.003921569, 0, 1, 1,
0.5414725, -1.459589, 1.419777, 0.007843138, 0, 1, 1,
0.5484304, 0.1480201, 2.747627, 0.01568628, 0, 1, 1,
0.5505591, 1.466372, -0.314225, 0.01960784, 0, 1, 1,
0.5511071, -0.4189318, 1.741968, 0.02745098, 0, 1, 1,
0.5539212, 0.6116514, -2.042211, 0.03137255, 0, 1, 1,
0.5552971, -0.7229506, 2.922656, 0.03921569, 0, 1, 1,
0.5569804, -0.9878748, 4.470413, 0.04313726, 0, 1, 1,
0.5681975, -1.116801, 1.72387, 0.05098039, 0, 1, 1,
0.5683508, 1.110256, 1.268932, 0.05490196, 0, 1, 1,
0.5753936, 1.26355, 0.1251844, 0.0627451, 0, 1, 1,
0.5805058, -0.4515173, 2.597815, 0.06666667, 0, 1, 1,
0.5811895, 1.627035, -0.8952964, 0.07450981, 0, 1, 1,
0.5821022, -1.414409, 3.085559, 0.07843138, 0, 1, 1,
0.5844199, 0.709737, 0.3611212, 0.08627451, 0, 1, 1,
0.5899125, 0.4496955, 1.218244, 0.09019608, 0, 1, 1,
0.5985069, -0.1061751, 1.56661, 0.09803922, 0, 1, 1,
0.600329, -2.628869, 3.081219, 0.1058824, 0, 1, 1,
0.609137, 0.04588358, 2.657745, 0.1098039, 0, 1, 1,
0.6099107, -2.538126, 4.910141, 0.1176471, 0, 1, 1,
0.6101145, -0.8128957, 3.147944, 0.1215686, 0, 1, 1,
0.6103185, -1.177611, 3.281811, 0.1294118, 0, 1, 1,
0.6117396, 1.018513, 1.873793, 0.1333333, 0, 1, 1,
0.6126254, -0.9216305, 3.276788, 0.1411765, 0, 1, 1,
0.6127191, -0.3700091, 1.70259, 0.145098, 0, 1, 1,
0.6130934, -0.07050095, 2.190853, 0.1529412, 0, 1, 1,
0.6153355, 0.3157268, 1.144803, 0.1568628, 0, 1, 1,
0.615777, -0.8991186, 2.996686, 0.1647059, 0, 1, 1,
0.61914, 0.9403242, 0.7147128, 0.1686275, 0, 1, 1,
0.6208361, -0.3760505, 1.86758, 0.1764706, 0, 1, 1,
0.6295483, 0.4128212, 2.352795, 0.1803922, 0, 1, 1,
0.630239, 1.143964, -0.6302871, 0.1882353, 0, 1, 1,
0.6338368, 0.8155695, -0.06455947, 0.1921569, 0, 1, 1,
0.6401112, 1.550405, -0.06379621, 0.2, 0, 1, 1,
0.6437231, -1.491454, 4.883687, 0.2078431, 0, 1, 1,
0.646737, -0.1454684, 1.09255, 0.2117647, 0, 1, 1,
0.6484, -1.07426, 2.563744, 0.2196078, 0, 1, 1,
0.6495767, 0.657329, 0.7226934, 0.2235294, 0, 1, 1,
0.6555703, 0.5898011, 1.007584, 0.2313726, 0, 1, 1,
0.6556524, 0.3498017, 1.253206, 0.2352941, 0, 1, 1,
0.660215, -0.3273893, 1.27682, 0.2431373, 0, 1, 1,
0.6611779, 0.3903662, 1.737745, 0.2470588, 0, 1, 1,
0.6624033, -1.095544, 2.128821, 0.254902, 0, 1, 1,
0.6628183, 0.51762, 1.627403, 0.2588235, 0, 1, 1,
0.6687115, 1.140988, 0.8893301, 0.2666667, 0, 1, 1,
0.6698434, 0.8462103, 0.136156, 0.2705882, 0, 1, 1,
0.6726737, -0.07178421, 2.211918, 0.2784314, 0, 1, 1,
0.6739545, -1.114085, 2.79486, 0.282353, 0, 1, 1,
0.6745149, 0.9279824, 0.2198454, 0.2901961, 0, 1, 1,
0.6802936, -1.499144, 3.49941, 0.2941177, 0, 1, 1,
0.6821348, -0.4735655, 3.592164, 0.3019608, 0, 1, 1,
0.6822881, -1.041008, 4.055055, 0.3098039, 0, 1, 1,
0.6825092, 1.251728, 0.7531185, 0.3137255, 0, 1, 1,
0.6863897, -0.2539267, 2.864608, 0.3215686, 0, 1, 1,
0.6884019, 0.8577219, 1.211999, 0.3254902, 0, 1, 1,
0.688647, -0.15714, 2.360989, 0.3333333, 0, 1, 1,
0.6921093, 0.771058, -0.4147052, 0.3372549, 0, 1, 1,
0.6926438, 1.278761, 0.739195, 0.345098, 0, 1, 1,
0.6933082, 0.1130718, 1.978228, 0.3490196, 0, 1, 1,
0.69551, -1.684435, 3.092961, 0.3568628, 0, 1, 1,
0.7015789, 0.4454554, 3.640861, 0.3607843, 0, 1, 1,
0.7072546, 0.3279263, 2.190135, 0.3686275, 0, 1, 1,
0.7134071, 0.791932, -0.04218438, 0.372549, 0, 1, 1,
0.7161943, 0.3151032, 2.245045, 0.3803922, 0, 1, 1,
0.7166984, 0.3413679, -1.91991, 0.3843137, 0, 1, 1,
0.7199674, -1.015551, 3.19648, 0.3921569, 0, 1, 1,
0.7232615, -1.001754, 2.469203, 0.3960784, 0, 1, 1,
0.7269436, -0.3305206, 4.196486, 0.4039216, 0, 1, 1,
0.7281867, -0.3705328, 1.167822, 0.4117647, 0, 1, 1,
0.7295364, 1.183615, 0.9513201, 0.4156863, 0, 1, 1,
0.7308587, -0.0647218, 2.194893, 0.4235294, 0, 1, 1,
0.7312189, -1.894304, 3.414376, 0.427451, 0, 1, 1,
0.7339247, 0.6164455, 1.258321, 0.4352941, 0, 1, 1,
0.7371813, 0.5405414, 1.118435, 0.4392157, 0, 1, 1,
0.737624, -0.273732, 1.227469, 0.4470588, 0, 1, 1,
0.7451496, 1.204493, 1.101896, 0.4509804, 0, 1, 1,
0.745959, -0.7687588, 2.321961, 0.4588235, 0, 1, 1,
0.7472721, -1.403633, 2.765885, 0.4627451, 0, 1, 1,
0.750141, -1.613796, 2.707711, 0.4705882, 0, 1, 1,
0.7512838, -1.012083, 2.225193, 0.4745098, 0, 1, 1,
0.7515413, -1.528251, 3.418238, 0.4823529, 0, 1, 1,
0.7628531, 1.239581, 0.02013124, 0.4862745, 0, 1, 1,
0.7652665, -0.3291137, 2.499958, 0.4941176, 0, 1, 1,
0.7693706, -1.428388, 2.688828, 0.5019608, 0, 1, 1,
0.7706633, -0.2415098, 2.44988, 0.5058824, 0, 1, 1,
0.7739223, 0.7181668, 0.5233598, 0.5137255, 0, 1, 1,
0.775245, 1.706537, -0.4795859, 0.5176471, 0, 1, 1,
0.7754221, -0.1282099, 1.026263, 0.5254902, 0, 1, 1,
0.7775738, 1.870675, -0.8052856, 0.5294118, 0, 1, 1,
0.7776226, 0.1630529, 0.1389528, 0.5372549, 0, 1, 1,
0.7829348, -1.099417, 2.455616, 0.5411765, 0, 1, 1,
0.7902427, -0.6378266, 2.383884, 0.5490196, 0, 1, 1,
0.7917783, -0.1027158, 2.047302, 0.5529412, 0, 1, 1,
0.7940419, -0.1406986, 0.3724789, 0.5607843, 0, 1, 1,
0.7952031, 0.4287531, 2.099184, 0.5647059, 0, 1, 1,
0.7985312, 1.115177, 0.7039297, 0.572549, 0, 1, 1,
0.8005858, -0.3566135, 1.044652, 0.5764706, 0, 1, 1,
0.8015945, 0.7494672, 1.112576, 0.5843138, 0, 1, 1,
0.8050609, -1.174504, 2.422534, 0.5882353, 0, 1, 1,
0.8082592, 1.479403, 1.404138, 0.5960785, 0, 1, 1,
0.8086238, -0.2963093, 0.4960135, 0.6039216, 0, 1, 1,
0.8116715, 0.201486, 1.624765, 0.6078432, 0, 1, 1,
0.8124422, 0.515097, 1.208092, 0.6156863, 0, 1, 1,
0.8169363, -0.7339091, 1.901847, 0.6196079, 0, 1, 1,
0.8170547, -0.06359772, 2.216647, 0.627451, 0, 1, 1,
0.8223116, -1.896608, 3.697315, 0.6313726, 0, 1, 1,
0.8306782, -0.9585835, 0.8759874, 0.6392157, 0, 1, 1,
0.8385025, 0.7893323, 2.043519, 0.6431373, 0, 1, 1,
0.8396216, 0.0355657, 2.486733, 0.6509804, 0, 1, 1,
0.8427551, 1.62112, -0.6004393, 0.654902, 0, 1, 1,
0.8437791, 0.8770384, 3.14636, 0.6627451, 0, 1, 1,
0.845394, 0.5435528, 0.8747339, 0.6666667, 0, 1, 1,
0.8490725, -1.476032, 1.769001, 0.6745098, 0, 1, 1,
0.8572309, -0.2603483, 2.153525, 0.6784314, 0, 1, 1,
0.8611624, 0.704868, 1.20202, 0.6862745, 0, 1, 1,
0.8649259, 1.521143, 0.05065341, 0.6901961, 0, 1, 1,
0.8682957, 0.2183931, 1.85936, 0.6980392, 0, 1, 1,
0.8699293, 0.9508601, 0.2146163, 0.7058824, 0, 1, 1,
0.8716022, 0.1595112, -0.04274891, 0.7098039, 0, 1, 1,
0.874473, 1.144459, 0.8660143, 0.7176471, 0, 1, 1,
0.87622, -2.655787, 3.354725, 0.7215686, 0, 1, 1,
0.8791112, -0.9011927, 2.553738, 0.7294118, 0, 1, 1,
0.8869645, -1.428954, 2.258209, 0.7333333, 0, 1, 1,
0.8886238, 1.241804, -0.1724725, 0.7411765, 0, 1, 1,
0.8928869, -0.2429445, 2.147682, 0.7450981, 0, 1, 1,
0.8937293, 1.120995, -0.3002196, 0.7529412, 0, 1, 1,
0.9052415, 0.3502969, 0.9611303, 0.7568628, 0, 1, 1,
0.9073383, -1.033962, 3.881428, 0.7647059, 0, 1, 1,
0.9111857, 0.2326941, 1.765377, 0.7686275, 0, 1, 1,
0.9165851, 1.212637, 0.3496263, 0.7764706, 0, 1, 1,
0.9200097, -0.0822248, 1.200504, 0.7803922, 0, 1, 1,
0.9210992, -0.896557, 3.782853, 0.7882353, 0, 1, 1,
0.9272681, -0.484628, 2.053216, 0.7921569, 0, 1, 1,
0.9282079, -0.1232336, 3.1282, 0.8, 0, 1, 1,
0.936984, 0.1852991, 1.871528, 0.8078431, 0, 1, 1,
0.9410365, -1.29244, 0.2923459, 0.8117647, 0, 1, 1,
0.9443856, -1.047065, 2.020925, 0.8196079, 0, 1, 1,
0.9444754, -1.804533, 3.848832, 0.8235294, 0, 1, 1,
0.9478153, 0.2882781, 0.1394863, 0.8313726, 0, 1, 1,
0.9481559, 0.9350935, 1.577706, 0.8352941, 0, 1, 1,
0.9527435, -0.06809953, 2.685525, 0.8431373, 0, 1, 1,
0.9529144, -1.051238, 1.229574, 0.8470588, 0, 1, 1,
0.9557171, 0.1954114, 1.123858, 0.854902, 0, 1, 1,
0.9564625, 1.165497, 0.4786979, 0.8588235, 0, 1, 1,
0.9570065, 0.2743201, -0.09831146, 0.8666667, 0, 1, 1,
0.9570175, -0.3361098, 2.986388, 0.8705882, 0, 1, 1,
0.9576924, 1.136105, 0.3797307, 0.8784314, 0, 1, 1,
0.9591723, -1.829254, 3.171784, 0.8823529, 0, 1, 1,
0.9728281, 0.7322299, 1.383641, 0.8901961, 0, 1, 1,
0.9807979, -0.2627254, 1.277294, 0.8941177, 0, 1, 1,
0.9828864, -0.5252261, 4.788953, 0.9019608, 0, 1, 1,
0.9837162, -1.011316, 3.345803, 0.9098039, 0, 1, 1,
0.986776, -1.570718, 2.880136, 0.9137255, 0, 1, 1,
0.989742, 0.7232648, 0.2502411, 0.9215686, 0, 1, 1,
0.9989129, -0.6211948, 1.229952, 0.9254902, 0, 1, 1,
0.9997857, 0.3884598, 0.635393, 0.9333333, 0, 1, 1,
1.000357, 1.206554, 0.121657, 0.9372549, 0, 1, 1,
1.001953, -0.6089758, 3.322834, 0.945098, 0, 1, 1,
1.002856, -0.8385936, 2.142285, 0.9490196, 0, 1, 1,
1.003655, 0.2908561, 1.407253, 0.9568627, 0, 1, 1,
1.015796, 2.729286, 0.587171, 0.9607843, 0, 1, 1,
1.017185, 0.335342, 0.9006124, 0.9686275, 0, 1, 1,
1.020826, 0.4214948, 1.681758, 0.972549, 0, 1, 1,
1.024611, 1.103268, -0.2971112, 0.9803922, 0, 1, 1,
1.025548, -0.1831492, 1.961434, 0.9843137, 0, 1, 1,
1.03259, 1.450243, 2.252338, 0.9921569, 0, 1, 1,
1.034007, 0.3814698, 0.5315211, 0.9960784, 0, 1, 1,
1.043129, 0.2043622, -0.2826088, 1, 0, 0.9960784, 1,
1.047272, -1.168665, 2.098861, 1, 0, 0.9882353, 1,
1.051723, 0.2563192, 1.331481, 1, 0, 0.9843137, 1,
1.053843, -0.9846451, 2.020104, 1, 0, 0.9764706, 1,
1.054038, 1.524932, 0.6689698, 1, 0, 0.972549, 1,
1.065549, -0.3295158, 0.1430344, 1, 0, 0.9647059, 1,
1.068365, 0.9399542, 2.830748, 1, 0, 0.9607843, 1,
1.068965, -0.3888514, 3.656415, 1, 0, 0.9529412, 1,
1.070154, -1.131569, 0.8722494, 1, 0, 0.9490196, 1,
1.073038, 0.2540587, 0.4150897, 1, 0, 0.9411765, 1,
1.078131, 1.4965, 0.973843, 1, 0, 0.9372549, 1,
1.088665, -0.6856314, 3.594664, 1, 0, 0.9294118, 1,
1.090507, 0.8869865, 0.1884041, 1, 0, 0.9254902, 1,
1.099071, 0.5897952, 2.222386, 1, 0, 0.9176471, 1,
1.101213, -1.263028, 3.541864, 1, 0, 0.9137255, 1,
1.102101, -0.5658694, 2.946014, 1, 0, 0.9058824, 1,
1.103397, 0.3522876, 1.256632, 1, 0, 0.9019608, 1,
1.116843, -0.7459106, 1.44022, 1, 0, 0.8941177, 1,
1.12323, 0.5595809, 1.899716, 1, 0, 0.8862745, 1,
1.12541, 1.761282, 0.3135301, 1, 0, 0.8823529, 1,
1.125733, -0.3855487, 1.436692, 1, 0, 0.8745098, 1,
1.130939, 0.2845725, -0.1801732, 1, 0, 0.8705882, 1,
1.131248, -0.6310351, 0.2435553, 1, 0, 0.8627451, 1,
1.132033, -2.135633, 1.117832, 1, 0, 0.8588235, 1,
1.134675, 0.1330336, 1.932858, 1, 0, 0.8509804, 1,
1.138683, -0.7892848, 1.71009, 1, 0, 0.8470588, 1,
1.143308, -0.1129707, 1.384017, 1, 0, 0.8392157, 1,
1.15578, -0.5085325, 1.688952, 1, 0, 0.8352941, 1,
1.157149, -0.2707483, 2.661638, 1, 0, 0.827451, 1,
1.15745, 1.553432, -1.186069, 1, 0, 0.8235294, 1,
1.164179, 1.263256, -0.06265174, 1, 0, 0.8156863, 1,
1.169354, -1.18637, 2.226788, 1, 0, 0.8117647, 1,
1.175954, -1.798926, 2.083652, 1, 0, 0.8039216, 1,
1.180554, -0.8683495, 3.32217, 1, 0, 0.7960784, 1,
1.184546, 0.8632745, 1.139327, 1, 0, 0.7921569, 1,
1.196435, 1.801694, 2.628974, 1, 0, 0.7843137, 1,
1.202757, -0.511418, 3.317173, 1, 0, 0.7803922, 1,
1.204853, 0.3483541, 2.042047, 1, 0, 0.772549, 1,
1.209836, -0.1329392, 2.190897, 1, 0, 0.7686275, 1,
1.217076, -2.050096, 1.392927, 1, 0, 0.7607843, 1,
1.21876, -0.5282652, 2.204669, 1, 0, 0.7568628, 1,
1.218934, 0.6815147, -0.6669759, 1, 0, 0.7490196, 1,
1.229976, 2.553544, 0.8571522, 1, 0, 0.7450981, 1,
1.239197, -0.1436021, 2.399963, 1, 0, 0.7372549, 1,
1.241232, -0.3351559, 0.273346, 1, 0, 0.7333333, 1,
1.243076, -0.2654147, 1.675793, 1, 0, 0.7254902, 1,
1.244074, 1.449502, 1.40866, 1, 0, 0.7215686, 1,
1.249844, -0.9174576, 0.8627454, 1, 0, 0.7137255, 1,
1.250409, 0.9352578, 1.933598, 1, 0, 0.7098039, 1,
1.252815, -0.1681249, 1.027947, 1, 0, 0.7019608, 1,
1.254164, -1.574376, 1.877193, 1, 0, 0.6941177, 1,
1.254622, -0.6928534, -0.1387078, 1, 0, 0.6901961, 1,
1.271906, 0.4422145, 1.344023, 1, 0, 0.682353, 1,
1.288729, -0.3321837, 2.044122, 1, 0, 0.6784314, 1,
1.294093, 0.03810662, 0.8055351, 1, 0, 0.6705883, 1,
1.305126, 0.1222481, 0.6761413, 1, 0, 0.6666667, 1,
1.312408, -1.014886, 2.678583, 1, 0, 0.6588235, 1,
1.317974, 0.04390927, 1.349866, 1, 0, 0.654902, 1,
1.326397, -1.38562, 4.256717, 1, 0, 0.6470588, 1,
1.334973, 0.297984, 3.181015, 1, 0, 0.6431373, 1,
1.346961, 0.5141308, 0.8170407, 1, 0, 0.6352941, 1,
1.355929, -1.009235, 1.17118, 1, 0, 0.6313726, 1,
1.366842, 0.2604214, 1.556911, 1, 0, 0.6235294, 1,
1.369526, 0.6237487, 1.152769, 1, 0, 0.6196079, 1,
1.370911, -2.355558, 2.658294, 1, 0, 0.6117647, 1,
1.374957, 0.555755, 1.154847, 1, 0, 0.6078432, 1,
1.381105, -0.1447239, 1.531951, 1, 0, 0.6, 1,
1.384229, 0.3347071, 1.580855, 1, 0, 0.5921569, 1,
1.393937, 0.1888531, 3.601243, 1, 0, 0.5882353, 1,
1.406319, -0.238408, 0.9505006, 1, 0, 0.5803922, 1,
1.40792, 0.9461113, -0.457395, 1, 0, 0.5764706, 1,
1.410478, 0.3605576, 0.6219357, 1, 0, 0.5686275, 1,
1.415846, 1.780638, 0.1033202, 1, 0, 0.5647059, 1,
1.420047, -0.5174197, 1.773544, 1, 0, 0.5568628, 1,
1.423861, 1.12737, 1.488007, 1, 0, 0.5529412, 1,
1.426811, 0.6373698, 2.115292, 1, 0, 0.5450981, 1,
1.426978, -0.7600763, 0.6839318, 1, 0, 0.5411765, 1,
1.434497, 1.228645, 0.8383032, 1, 0, 0.5333334, 1,
1.436483, 0.5768066, 1.829337, 1, 0, 0.5294118, 1,
1.439205, -0.462241, 1.5568, 1, 0, 0.5215687, 1,
1.439702, 0.7634445, 1.066565, 1, 0, 0.5176471, 1,
1.446315, 0.06887119, 1.430894, 1, 0, 0.509804, 1,
1.45769, -1.219014, 0.9454864, 1, 0, 0.5058824, 1,
1.458399, -0.3782439, 0.9662842, 1, 0, 0.4980392, 1,
1.459215, -2.12516, 0.869001, 1, 0, 0.4901961, 1,
1.459456, -0.0163797, 1.050801, 1, 0, 0.4862745, 1,
1.462039, -0.1332889, 0.6723093, 1, 0, 0.4784314, 1,
1.476858, -0.09544379, 0.9806818, 1, 0, 0.4745098, 1,
1.495442, 0.7973696, 1.912501, 1, 0, 0.4666667, 1,
1.498602, -0.6199244, 1.114996, 1, 0, 0.4627451, 1,
1.499726, -0.7101348, 0.01645533, 1, 0, 0.454902, 1,
1.501336, 0.9477983, 0.7846652, 1, 0, 0.4509804, 1,
1.514685, 0.8957435, 0.9196899, 1, 0, 0.4431373, 1,
1.530204, -0.4002987, 1.725404, 1, 0, 0.4392157, 1,
1.532797, 0.5206193, 1.155484, 1, 0, 0.4313726, 1,
1.547978, -0.3413829, 0.07719541, 1, 0, 0.427451, 1,
1.553034, 0.9464315, 0.799702, 1, 0, 0.4196078, 1,
1.585207, -0.8289474, 1.677268, 1, 0, 0.4156863, 1,
1.585345, 0.4920782, 1.728122, 1, 0, 0.4078431, 1,
1.593569, -0.4140251, 0.4273261, 1, 0, 0.4039216, 1,
1.594221, 1.95991, -0.4238198, 1, 0, 0.3960784, 1,
1.59456, 1.088031, 0.5125122, 1, 0, 0.3882353, 1,
1.606017, -1.04737, 2.694618, 1, 0, 0.3843137, 1,
1.606953, 0.5644443, 2.343949, 1, 0, 0.3764706, 1,
1.614201, 0.3556604, 1.814422, 1, 0, 0.372549, 1,
1.615271, -0.2172347, 1.285398, 1, 0, 0.3647059, 1,
1.623085, 1.922456, 1.191076, 1, 0, 0.3607843, 1,
1.624723, 1.599023, 1.386077, 1, 0, 0.3529412, 1,
1.625388, 0.7260947, -1.07252, 1, 0, 0.3490196, 1,
1.628536, 0.6510465, -0.4620339, 1, 0, 0.3411765, 1,
1.629312, 1.879561, 0.3044761, 1, 0, 0.3372549, 1,
1.642816, -0.03826774, 0.1905715, 1, 0, 0.3294118, 1,
1.653025, -0.5585499, 2.006682, 1, 0, 0.3254902, 1,
1.655089, 1.023424, 0.3965628, 1, 0, 0.3176471, 1,
1.655866, -1.306739, 2.007147, 1, 0, 0.3137255, 1,
1.6623, -0.2661372, 1.132819, 1, 0, 0.3058824, 1,
1.66357, -1.789171, 2.698979, 1, 0, 0.2980392, 1,
1.667637, 0.9126108, -0.3202213, 1, 0, 0.2941177, 1,
1.692412, 1.530667, 1.083524, 1, 0, 0.2862745, 1,
1.693795, -2.819734, 1.365462, 1, 0, 0.282353, 1,
1.719318, -0.7508773, 1.782455, 1, 0, 0.2745098, 1,
1.722246, -1.197176, 2.541246, 1, 0, 0.2705882, 1,
1.725162, -0.3292727, 3.259835, 1, 0, 0.2627451, 1,
1.729213, -0.6502317, 0.7949919, 1, 0, 0.2588235, 1,
1.7313, -0.6849337, 3.213242, 1, 0, 0.2509804, 1,
1.765348, 0.6121702, 1.034673, 1, 0, 0.2470588, 1,
1.768545, 1.208841, 0.8485076, 1, 0, 0.2392157, 1,
1.769489, -1.346471, 3.74877, 1, 0, 0.2352941, 1,
1.798709, 0.9011511, 1.34157, 1, 0, 0.227451, 1,
1.810909, -1.168209, 1.327443, 1, 0, 0.2235294, 1,
1.830579, -0.09832948, 1.193764, 1, 0, 0.2156863, 1,
1.852888, -0.9910088, 1.345784, 1, 0, 0.2117647, 1,
1.873006, 1.494154, 0.6047772, 1, 0, 0.2039216, 1,
1.877704, 1.543764, 0.6699312, 1, 0, 0.1960784, 1,
1.896487, 0.5511747, 2.839819, 1, 0, 0.1921569, 1,
1.911169, -0.08476763, 1.360923, 1, 0, 0.1843137, 1,
1.924651, -0.5658153, 1.301405, 1, 0, 0.1803922, 1,
1.935306, -0.9760665, 2.238067, 1, 0, 0.172549, 1,
1.936018, -0.7437261, 1.794602, 1, 0, 0.1686275, 1,
1.940552, -0.3264066, -0.5813631, 1, 0, 0.1607843, 1,
1.961859, 0.9707153, 1.056715, 1, 0, 0.1568628, 1,
1.965764, 0.6918276, 0.9864451, 1, 0, 0.1490196, 1,
1.971597, -1.2708, 3.211622, 1, 0, 0.145098, 1,
1.972469, -0.98468, 1.887412, 1, 0, 0.1372549, 1,
1.983142, -0.5431986, 2.168061, 1, 0, 0.1333333, 1,
1.995012, -0.2830307, 1.049514, 1, 0, 0.1254902, 1,
1.996922, 1.980318, 0.99597, 1, 0, 0.1215686, 1,
2.004293, 0.2532657, 3.356312, 1, 0, 0.1137255, 1,
2.022304, -1.139121, -0.1495747, 1, 0, 0.1098039, 1,
2.033166, -0.5734102, 2.501967, 1, 0, 0.1019608, 1,
2.098161, 0.6653271, 2.050774, 1, 0, 0.09411765, 1,
2.119956, 0.8438939, 0.2241109, 1, 0, 0.09019608, 1,
2.133732, -0.871039, 2.586432, 1, 0, 0.08235294, 1,
2.15964, 1.280525, 1.405484, 1, 0, 0.07843138, 1,
2.198428, -1.280324, 0.185127, 1, 0, 0.07058824, 1,
2.238439, 0.0762472, 3.761183, 1, 0, 0.06666667, 1,
2.265963, 0.0728818, 0.6941056, 1, 0, 0.05882353, 1,
2.275307, 0.5957972, 0.2782282, 1, 0, 0.05490196, 1,
2.287282, -2.204643, 3.800838, 1, 0, 0.04705882, 1,
2.385749, 0.6342433, 1.759799, 1, 0, 0.04313726, 1,
2.392301, -0.2333541, -0.6455762, 1, 0, 0.03529412, 1,
2.529251, -1.007208, 1.078964, 1, 0, 0.03137255, 1,
2.641565, 0.5211629, 0.831396, 1, 0, 0.02352941, 1,
2.746627, 1.019117, 1.06906, 1, 0, 0.01960784, 1,
2.81979, 0.5839546, 0.1798002, 1, 0, 0.01176471, 1,
3.511294, 1.84804, -0.2032395, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.1036394, -4.064133, -7.281573, 0, -0.5, 0.5, 0.5,
0.1036394, -4.064133, -7.281573, 1, -0.5, 0.5, 0.5,
0.1036394, -4.064133, -7.281573, 1, 1.5, 0.5, 0.5,
0.1036394, -4.064133, -7.281573, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.45921, 0.2703245, -7.281573, 0, -0.5, 0.5, 0.5,
-4.45921, 0.2703245, -7.281573, 1, -0.5, 0.5, 0.5,
-4.45921, 0.2703245, -7.281573, 1, 1.5, 0.5, 0.5,
-4.45921, 0.2703245, -7.281573, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.45921, -4.064133, 0.01140022, 0, -0.5, 0.5, 0.5,
-4.45921, -4.064133, 0.01140022, 1, -0.5, 0.5, 0.5,
-4.45921, -4.064133, 0.01140022, 1, 1.5, 0.5, 0.5,
-4.45921, -4.064133, 0.01140022, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.063874, -5.598579,
3, -3.063874, -5.598579,
-3, -3.063874, -5.598579,
-3, -3.230583, -5.879078,
-2, -3.063874, -5.598579,
-2, -3.230583, -5.879078,
-1, -3.063874, -5.598579,
-1, -3.230583, -5.879078,
0, -3.063874, -5.598579,
0, -3.230583, -5.879078,
1, -3.063874, -5.598579,
1, -3.230583, -5.879078,
2, -3.063874, -5.598579,
2, -3.230583, -5.879078,
3, -3.063874, -5.598579,
3, -3.230583, -5.879078
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
-3, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
-3, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
-3, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5,
-2, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
-2, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
-2, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
-2, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5,
-1, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
-1, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
-1, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
-1, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5,
0, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
0, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
0, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
0, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5,
1, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
1, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
1, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
1, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5,
2, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
2, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
2, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
2, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5,
3, -3.564003, -6.440076, 0, -0.5, 0.5, 0.5,
3, -3.564003, -6.440076, 1, -0.5, 0.5, 0.5,
3, -3.564003, -6.440076, 1, 1.5, 0.5, 0.5,
3, -3.564003, -6.440076, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.406245, -2, -5.598579,
-3.406245, 3, -5.598579,
-3.406245, -2, -5.598579,
-3.581739, -2, -5.879078,
-3.406245, -1, -5.598579,
-3.581739, -1, -5.879078,
-3.406245, 0, -5.598579,
-3.581739, 0, -5.879078,
-3.406245, 1, -5.598579,
-3.581739, 1, -5.879078,
-3.406245, 2, -5.598579,
-3.581739, 2, -5.879078,
-3.406245, 3, -5.598579,
-3.581739, 3, -5.879078
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.932727, -2, -6.440076, 0, -0.5, 0.5, 0.5,
-3.932727, -2, -6.440076, 1, -0.5, 0.5, 0.5,
-3.932727, -2, -6.440076, 1, 1.5, 0.5, 0.5,
-3.932727, -2, -6.440076, 0, 1.5, 0.5, 0.5,
-3.932727, -1, -6.440076, 0, -0.5, 0.5, 0.5,
-3.932727, -1, -6.440076, 1, -0.5, 0.5, 0.5,
-3.932727, -1, -6.440076, 1, 1.5, 0.5, 0.5,
-3.932727, -1, -6.440076, 0, 1.5, 0.5, 0.5,
-3.932727, 0, -6.440076, 0, -0.5, 0.5, 0.5,
-3.932727, 0, -6.440076, 1, -0.5, 0.5, 0.5,
-3.932727, 0, -6.440076, 1, 1.5, 0.5, 0.5,
-3.932727, 0, -6.440076, 0, 1.5, 0.5, 0.5,
-3.932727, 1, -6.440076, 0, -0.5, 0.5, 0.5,
-3.932727, 1, -6.440076, 1, -0.5, 0.5, 0.5,
-3.932727, 1, -6.440076, 1, 1.5, 0.5, 0.5,
-3.932727, 1, -6.440076, 0, 1.5, 0.5, 0.5,
-3.932727, 2, -6.440076, 0, -0.5, 0.5, 0.5,
-3.932727, 2, -6.440076, 1, -0.5, 0.5, 0.5,
-3.932727, 2, -6.440076, 1, 1.5, 0.5, 0.5,
-3.932727, 2, -6.440076, 0, 1.5, 0.5, 0.5,
-3.932727, 3, -6.440076, 0, -0.5, 0.5, 0.5,
-3.932727, 3, -6.440076, 1, -0.5, 0.5, 0.5,
-3.932727, 3, -6.440076, 1, 1.5, 0.5, 0.5,
-3.932727, 3, -6.440076, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.406245, -3.063874, -4,
-3.406245, -3.063874, 4,
-3.406245, -3.063874, -4,
-3.581739, -3.230583, -4,
-3.406245, -3.063874, -2,
-3.581739, -3.230583, -2,
-3.406245, -3.063874, 0,
-3.581739, -3.230583, 0,
-3.406245, -3.063874, 2,
-3.581739, -3.230583, 2,
-3.406245, -3.063874, 4,
-3.581739, -3.230583, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.932727, -3.564003, -4, 0, -0.5, 0.5, 0.5,
-3.932727, -3.564003, -4, 1, -0.5, 0.5, 0.5,
-3.932727, -3.564003, -4, 1, 1.5, 0.5, 0.5,
-3.932727, -3.564003, -4, 0, 1.5, 0.5, 0.5,
-3.932727, -3.564003, -2, 0, -0.5, 0.5, 0.5,
-3.932727, -3.564003, -2, 1, -0.5, 0.5, 0.5,
-3.932727, -3.564003, -2, 1, 1.5, 0.5, 0.5,
-3.932727, -3.564003, -2, 0, 1.5, 0.5, 0.5,
-3.932727, -3.564003, 0, 0, -0.5, 0.5, 0.5,
-3.932727, -3.564003, 0, 1, -0.5, 0.5, 0.5,
-3.932727, -3.564003, 0, 1, 1.5, 0.5, 0.5,
-3.932727, -3.564003, 0, 0, 1.5, 0.5, 0.5,
-3.932727, -3.564003, 2, 0, -0.5, 0.5, 0.5,
-3.932727, -3.564003, 2, 1, -0.5, 0.5, 0.5,
-3.932727, -3.564003, 2, 1, 1.5, 0.5, 0.5,
-3.932727, -3.564003, 2, 0, 1.5, 0.5, 0.5,
-3.932727, -3.564003, 4, 0, -0.5, 0.5, 0.5,
-3.932727, -3.564003, 4, 1, -0.5, 0.5, 0.5,
-3.932727, -3.564003, 4, 1, 1.5, 0.5, 0.5,
-3.932727, -3.564003, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.406245, -3.063874, -5.598579,
-3.406245, 3.604522, -5.598579,
-3.406245, -3.063874, 5.621379,
-3.406245, 3.604522, 5.621379,
-3.406245, -3.063874, -5.598579,
-3.406245, -3.063874, 5.621379,
-3.406245, 3.604522, -5.598579,
-3.406245, 3.604522, 5.621379,
-3.406245, -3.063874, -5.598579,
3.613523, -3.063874, -5.598579,
-3.406245, -3.063874, 5.621379,
3.613523, -3.063874, 5.621379,
-3.406245, 3.604522, -5.598579,
3.613523, 3.604522, -5.598579,
-3.406245, 3.604522, 5.621379,
3.613523, 3.604522, 5.621379,
3.613523, -3.063874, -5.598579,
3.613523, 3.604522, -5.598579,
3.613523, -3.063874, 5.621379,
3.613523, 3.604522, 5.621379,
3.613523, -3.063874, -5.598579,
3.613523, -3.063874, 5.621379,
3.613523, 3.604522, -5.598579,
3.613523, 3.604522, 5.621379
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.913587;
var distance = 35.20845;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1036394, -0.2703245, -0.01140022 );
mvMatrix.scale( 1.21889, 1.283116, 0.7625987 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20845);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
terallethrin<-read.table("terallethrin.xyz")
```

```
## Error in read.table("terallethrin.xyz"): no lines available in input
```

```r
x<-terallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
y<-terallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
z<-terallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.304015, 0.3249275, -3.849672, 0, 0, 1, 1, 1,
-3.008221, 0.4622546, -3.074827, 1, 0, 0, 1, 1,
-2.717853, -1.234388, -1.315698, 1, 0, 0, 1, 1,
-2.694615, -1.033363, -2.353293, 1, 0, 0, 1, 1,
-2.645772, -1.124708, -2.447934, 1, 0, 0, 1, 1,
-2.574299, 1.056721, -0.1303075, 1, 0, 0, 1, 1,
-2.529577, -0.4280077, -1.08024, 0, 0, 0, 1, 1,
-2.438128, -1.397337, -0.7458618, 0, 0, 0, 1, 1,
-2.431302, 0.993868, -2.364974, 0, 0, 0, 1, 1,
-2.422345, 0.1776032, -1.404074, 0, 0, 0, 1, 1,
-2.401459, 0.8452694, -2.175104, 0, 0, 0, 1, 1,
-2.366331, -0.8010358, -2.692663, 0, 0, 0, 1, 1,
-2.329554, 0.379445, -1.045782, 0, 0, 0, 1, 1,
-2.327133, -0.5845671, -1.555257, 1, 1, 1, 1, 1,
-2.274267, 1.257355, 0.2073609, 1, 1, 1, 1, 1,
-2.256817, -1.213436, -1.296216, 1, 1, 1, 1, 1,
-2.158082, 0.5699843, -0.2610989, 1, 1, 1, 1, 1,
-2.123626, 0.3773499, -1.623208, 1, 1, 1, 1, 1,
-2.074619, 0.2003215, -2.602685, 1, 1, 1, 1, 1,
-2.011949, -1.430215, -2.016808, 1, 1, 1, 1, 1,
-1.987147, 0.7323416, -0.3132691, 1, 1, 1, 1, 1,
-1.959004, -0.3439054, -3.121854, 1, 1, 1, 1, 1,
-1.951763, 1.390567, -2.593845, 1, 1, 1, 1, 1,
-1.919774, -0.09014503, -1.232651, 1, 1, 1, 1, 1,
-1.916584, 0.1085062, -2.814777, 1, 1, 1, 1, 1,
-1.810858, -0.01991638, -3.715961, 1, 1, 1, 1, 1,
-1.808092, -0.4896166, -1.858021, 1, 1, 1, 1, 1,
-1.804049, -0.9518712, -2.64932, 1, 1, 1, 1, 1,
-1.802068, -1.109324, -2.59333, 0, 0, 1, 1, 1,
-1.780419, -2.118368, -2.212971, 1, 0, 0, 1, 1,
-1.779806, 0.1051754, -2.739782, 1, 0, 0, 1, 1,
-1.768616, -0.7389471, -1.565104, 1, 0, 0, 1, 1,
-1.766773, -0.01095782, -0.03680085, 1, 0, 0, 1, 1,
-1.763559, -0.2052602, -1.648362, 1, 0, 0, 1, 1,
-1.762908, 1.001017, 0.9719084, 0, 0, 0, 1, 1,
-1.7592, -0.6692311, -2.676827, 0, 0, 0, 1, 1,
-1.724734, -0.5112123, 1.080093, 0, 0, 0, 1, 1,
-1.709527, -0.5597806, -2.73558, 0, 0, 0, 1, 1,
-1.703601, -0.06661999, -2.104111, 0, 0, 0, 1, 1,
-1.701209, -0.7968008, -3.783755, 0, 0, 0, 1, 1,
-1.683468, -0.06555262, -1.390417, 0, 0, 0, 1, 1,
-1.682851, 0.3153864, -1.403125, 1, 1, 1, 1, 1,
-1.67924, -0.2805702, -2.593561, 1, 1, 1, 1, 1,
-1.668409, -1.533755, -1.401796, 1, 1, 1, 1, 1,
-1.663875, 0.7503314, -1.690494, 1, 1, 1, 1, 1,
-1.662386, 0.7265507, -2.176783, 1, 1, 1, 1, 1,
-1.656655, 1.895543, -0.6296561, 1, 1, 1, 1, 1,
-1.653926, 0.6267325, -2.807457, 1, 1, 1, 1, 1,
-1.640719, -0.3666011, -0.6026202, 1, 1, 1, 1, 1,
-1.638194, -0.832606, -0.9717452, 1, 1, 1, 1, 1,
-1.636699, 1.138908, 0.3034934, 1, 1, 1, 1, 1,
-1.630873, 0.429649, -2.520853, 1, 1, 1, 1, 1,
-1.629715, 0.1348253, -1.282605, 1, 1, 1, 1, 1,
-1.623004, -0.8842619, -2.319293, 1, 1, 1, 1, 1,
-1.622808, -0.3649026, -2.671705, 1, 1, 1, 1, 1,
-1.614657, 0.09810697, -2.80986, 1, 1, 1, 1, 1,
-1.612231, -0.4446791, -0.9284698, 0, 0, 1, 1, 1,
-1.607579, 0.2277167, -1.831487, 1, 0, 0, 1, 1,
-1.604241, 0.3766656, -2.294551, 1, 0, 0, 1, 1,
-1.585176, 0.1962339, -0.6897123, 1, 0, 0, 1, 1,
-1.571894, -0.8343906, -1.835331, 1, 0, 0, 1, 1,
-1.568401, 0.9309176, -0.9625951, 1, 0, 0, 1, 1,
-1.566599, 1.142777, -0.3555569, 0, 0, 0, 1, 1,
-1.545788, 1.408689, -0.7295009, 0, 0, 0, 1, 1,
-1.542978, 0.9563539, -0.3676626, 0, 0, 0, 1, 1,
-1.533081, -0.01059687, -1.791902, 0, 0, 0, 1, 1,
-1.520877, -0.6293274, -3.102042, 0, 0, 0, 1, 1,
-1.510402, 1.445844, 2.041631, 0, 0, 0, 1, 1,
-1.504861, 1.516191, -0.5121657, 0, 0, 0, 1, 1,
-1.48717, -0.3753857, -2.774686, 1, 1, 1, 1, 1,
-1.482801, 0.4551946, -2.967972, 1, 1, 1, 1, 1,
-1.478471, -0.3746927, -1.567246, 1, 1, 1, 1, 1,
-1.474658, -1.749428, -2.54985, 1, 1, 1, 1, 1,
-1.447826, -0.795924, -1.44687, 1, 1, 1, 1, 1,
-1.442926, -1.319009, -1.892913, 1, 1, 1, 1, 1,
-1.407658, -1.384102, -3.298252, 1, 1, 1, 1, 1,
-1.402913, 0.1106874, -2.031263, 1, 1, 1, 1, 1,
-1.399887, 0.7194375, -0.8195674, 1, 1, 1, 1, 1,
-1.399825, 1.477352, 0.6551151, 1, 1, 1, 1, 1,
-1.375316, 1.889893, 0.3417928, 1, 1, 1, 1, 1,
-1.371289, -0.1218275, -2.423206, 1, 1, 1, 1, 1,
-1.360776, -1.093697, -2.400204, 1, 1, 1, 1, 1,
-1.358039, -2.499879, -4.7539, 1, 1, 1, 1, 1,
-1.351402, 1.432855, -0.9029362, 1, 1, 1, 1, 1,
-1.345406, 1.328045, 0.2527202, 0, 0, 1, 1, 1,
-1.33583, 0.5410542, 0.06020265, 1, 0, 0, 1, 1,
-1.331689, -0.1177407, -1.500759, 1, 0, 0, 1, 1,
-1.329568, 0.1164373, -1.434007, 1, 0, 0, 1, 1,
-1.325093, 0.9602782, -0.2983319, 1, 0, 0, 1, 1,
-1.324599, -1.532589, -2.760923, 1, 0, 0, 1, 1,
-1.318474, 2.062898, -0.4969791, 0, 0, 0, 1, 1,
-1.316342, 1.219788, -0.518249, 0, 0, 0, 1, 1,
-1.313603, 1.646487, -1.664952, 0, 0, 0, 1, 1,
-1.307719, -0.659197, -0.8604541, 0, 0, 0, 1, 1,
-1.307193, 0.06605923, -2.223943, 0, 0, 0, 1, 1,
-1.307069, 0.7292518, -0.4880762, 0, 0, 0, 1, 1,
-1.293067, 0.3270843, -1.028473, 0, 0, 0, 1, 1,
-1.292285, 0.05323019, 0.3653326, 1, 1, 1, 1, 1,
-1.287419, -0.7240713, -1.189824, 1, 1, 1, 1, 1,
-1.287243, -1.520112, -2.772135, 1, 1, 1, 1, 1,
-1.285151, 1.319713, -0.6405927, 1, 1, 1, 1, 1,
-1.28511, -0.8818317, -2.675858, 1, 1, 1, 1, 1,
-1.281187, 0.8099498, -2.099205, 1, 1, 1, 1, 1,
-1.276905, -0.7737913, -3.24791, 1, 1, 1, 1, 1,
-1.273188, -0.03294687, -2.007771, 1, 1, 1, 1, 1,
-1.267348, 0.2719111, -1.453337, 1, 1, 1, 1, 1,
-1.263775, -0.5528929, -3.337826, 1, 1, 1, 1, 1,
-1.258425, -0.4287606, -2.463704, 1, 1, 1, 1, 1,
-1.251533, 0.1394558, -1.376124, 1, 1, 1, 1, 1,
-1.249928, -0.4102617, -2.988979, 1, 1, 1, 1, 1,
-1.241797, -0.8514752, -1.286431, 1, 1, 1, 1, 1,
-1.237072, -0.424031, -0.9176656, 1, 1, 1, 1, 1,
-1.235487, 2.457431, -0.1815785, 0, 0, 1, 1, 1,
-1.232811, -1.07422, -2.376545, 1, 0, 0, 1, 1,
-1.230476, -2.966761, -3.654835, 1, 0, 0, 1, 1,
-1.229313, 1.986629, 0.4384917, 1, 0, 0, 1, 1,
-1.223992, -0.5955014, -2.286335, 1, 0, 0, 1, 1,
-1.216867, -0.1080392, -1.800334, 1, 0, 0, 1, 1,
-1.214534, 1.221309, 0.5670144, 0, 0, 0, 1, 1,
-1.207555, -0.419789, -3.64906, 0, 0, 0, 1, 1,
-1.205734, 0.01974725, -2.177716, 0, 0, 0, 1, 1,
-1.20469, 1.39124, -1.229501, 0, 0, 0, 1, 1,
-1.204387, -0.2738743, -2.03119, 0, 0, 0, 1, 1,
-1.198798, -1.002914, -1.955432, 0, 0, 0, 1, 1,
-1.192282, -1.232755, -3.968771, 0, 0, 0, 1, 1,
-1.188709, 1.677159, -0.2221896, 1, 1, 1, 1, 1,
-1.186, 2.162429, 0.9769487, 1, 1, 1, 1, 1,
-1.185802, 0.2337144, 1.511001, 1, 1, 1, 1, 1,
-1.184303, 1.174878, -0.4694154, 1, 1, 1, 1, 1,
-1.178554, 0.4343598, -1.084361, 1, 1, 1, 1, 1,
-1.173284, 0.5516517, -0.6185989, 1, 1, 1, 1, 1,
-1.169174, 0.212139, -2.090317, 1, 1, 1, 1, 1,
-1.168765, -1.98904, -1.888153, 1, 1, 1, 1, 1,
-1.167483, -0.2627125, -2.483764, 1, 1, 1, 1, 1,
-1.165459, 0.4194738, -0.6950988, 1, 1, 1, 1, 1,
-1.160085, 0.4858681, -1.021661, 1, 1, 1, 1, 1,
-1.156853, 1.196086, -0.6024223, 1, 1, 1, 1, 1,
-1.14293, -2.153344, -2.111749, 1, 1, 1, 1, 1,
-1.136364, 1.011436, -2.100192, 1, 1, 1, 1, 1,
-1.128226, 0.4936847, -1.468427, 1, 1, 1, 1, 1,
-1.124091, 1.169449, 1.467733, 0, 0, 1, 1, 1,
-1.120242, 0.06949311, -2.192718, 1, 0, 0, 1, 1,
-1.115149, 0.8903727, 0.4851871, 1, 0, 0, 1, 1,
-1.106113, 0.3847177, -0.4614993, 1, 0, 0, 1, 1,
-1.103235, -0.4314422, -0.2512513, 1, 0, 0, 1, 1,
-1.088278, -0.03536223, -2.741242, 1, 0, 0, 1, 1,
-1.085626, 0.3467548, -1.771671, 0, 0, 0, 1, 1,
-1.083566, 0.76491, -0.1625195, 0, 0, 0, 1, 1,
-1.080918, -0.8718871, -0.9581761, 0, 0, 0, 1, 1,
-1.080683, -0.7442878, -2.149947, 0, 0, 0, 1, 1,
-1.075501, -0.4324889, -1.42865, 0, 0, 0, 1, 1,
-1.070374, 0.1494843, -1.395989, 0, 0, 0, 1, 1,
-1.059368, 0.2154135, -1.13171, 0, 0, 0, 1, 1,
-1.054812, 0.572616, -1.810279, 1, 1, 1, 1, 1,
-1.053179, -1.510311, -1.09416, 1, 1, 1, 1, 1,
-1.053024, -0.5442904, -2.840874, 1, 1, 1, 1, 1,
-1.048948, 0.8578436, -0.3103443, 1, 1, 1, 1, 1,
-1.038908, 0.828777, -1.113059, 1, 1, 1, 1, 1,
-1.026605, 0.3462139, -2.044359, 1, 1, 1, 1, 1,
-1.024328, -0.3266044, -0.1894261, 1, 1, 1, 1, 1,
-1.015533, -0.6749272, -0.6966605, 1, 1, 1, 1, 1,
-1.01226, 1.665154, -0.6214092, 1, 1, 1, 1, 1,
-1.003423, -1.792393, -2.630884, 1, 1, 1, 1, 1,
-0.9992222, -1.52375, -2.418278, 1, 1, 1, 1, 1,
-0.9972093, -0.09241459, -0.8183042, 1, 1, 1, 1, 1,
-0.9937762, -0.2157637, -1.511151, 1, 1, 1, 1, 1,
-0.975581, 0.1539495, -0.5734717, 1, 1, 1, 1, 1,
-0.9743004, 0.2137661, -0.1744688, 1, 1, 1, 1, 1,
-0.9712265, 0.4982281, -3.298116, 0, 0, 1, 1, 1,
-0.9656844, 0.8507475, -0.02799874, 1, 0, 0, 1, 1,
-0.9645089, -0.4273804, -3.346137, 1, 0, 0, 1, 1,
-0.9571372, 1.54644, -0.5086237, 1, 0, 0, 1, 1,
-0.9570716, -1.292655, -3.179662, 1, 0, 0, 1, 1,
-0.9538572, 1.082102, -0.321109, 1, 0, 0, 1, 1,
-0.9499122, -1.192557, -2.796178, 0, 0, 0, 1, 1,
-0.9492106, 1.236252, 0.2787484, 0, 0, 0, 1, 1,
-0.9424738, -0.3337686, -1.489758, 0, 0, 0, 1, 1,
-0.9422251, 0.4226303, -2.375529, 0, 0, 0, 1, 1,
-0.9413363, -2.247733, -3.400584, 0, 0, 0, 1, 1,
-0.9405666, 0.1706168, -0.1517455, 0, 0, 0, 1, 1,
-0.9382441, -1.498068, -2.153746, 0, 0, 0, 1, 1,
-0.9327081, -0.07248525, -1.981194, 1, 1, 1, 1, 1,
-0.9287404, 1.577387, -0.4415936, 1, 1, 1, 1, 1,
-0.9277251, -0.2857663, -3.010805, 1, 1, 1, 1, 1,
-0.9242567, 0.3624862, -0.960246, 1, 1, 1, 1, 1,
-0.9176421, 0.5159118, -0.9623412, 1, 1, 1, 1, 1,
-0.9020767, 1.052341, 0.5036711, 1, 1, 1, 1, 1,
-0.8985939, 0.9512583, -0.06092533, 1, 1, 1, 1, 1,
-0.8961254, -0.247803, -4.735304, 1, 1, 1, 1, 1,
-0.8864741, 0.6339981, -0.9449679, 1, 1, 1, 1, 1,
-0.8864672, -0.5272321, -0.5841489, 1, 1, 1, 1, 1,
-0.8790371, -0.2230584, -2.617891, 1, 1, 1, 1, 1,
-0.8773556, -1.738042, -3.170196, 1, 1, 1, 1, 1,
-0.8736386, 2.641114, 1.141537, 1, 1, 1, 1, 1,
-0.8678753, -1.031487, -1.819586, 1, 1, 1, 1, 1,
-0.8667262, 1.517153, -0.4843688, 1, 1, 1, 1, 1,
-0.8665339, 0.5856376, 1.06326, 0, 0, 1, 1, 1,
-0.8648956, -0.6202632, -2.960329, 1, 0, 0, 1, 1,
-0.8633088, -0.9274832, -2.884811, 1, 0, 0, 1, 1,
-0.8601658, -0.720127, -1.837347, 1, 0, 0, 1, 1,
-0.8568403, 1.531804, -1.692652, 1, 0, 0, 1, 1,
-0.853709, -2.681773, -2.143568, 1, 0, 0, 1, 1,
-0.8490558, 0.05439502, -1.721119, 0, 0, 0, 1, 1,
-0.8473661, -1.508821, -1.63348, 0, 0, 0, 1, 1,
-0.8347147, -1.107877, -3.869975, 0, 0, 0, 1, 1,
-0.8236136, -2.125163, -2.911522, 0, 0, 0, 1, 1,
-0.8223619, -0.3531186, -1.503178, 0, 0, 0, 1, 1,
-0.8222353, 0.7764941, -0.01076266, 0, 0, 0, 1, 1,
-0.8196153, 0.05175389, -3.181196, 0, 0, 0, 1, 1,
-0.8179186, -0.1150881, -3.122709, 1, 1, 1, 1, 1,
-0.8177184, -0.7985455, -1.691238, 1, 1, 1, 1, 1,
-0.8133586, -0.1371818, -0.6285117, 1, 1, 1, 1, 1,
-0.8116081, -0.3242332, -2.928098, 1, 1, 1, 1, 1,
-0.8092185, 0.5062523, -0.3185956, 1, 1, 1, 1, 1,
-0.8075341, -1.245134, -2.017947, 1, 1, 1, 1, 1,
-0.8074518, -0.7339404, -2.745343, 1, 1, 1, 1, 1,
-0.7962057, -1.699368, -3.322108, 1, 1, 1, 1, 1,
-0.7924694, -0.1878759, -0.7870882, 1, 1, 1, 1, 1,
-0.7818777, 1.214318, -0.05796458, 1, 1, 1, 1, 1,
-0.7811002, -1.544642, -3.597358, 1, 1, 1, 1, 1,
-0.7799875, -0.09326136, -1.314511, 1, 1, 1, 1, 1,
-0.767275, -0.2171292, -1.822479, 1, 1, 1, 1, 1,
-0.7569069, 1.271068, -1.722739, 1, 1, 1, 1, 1,
-0.7481628, 1.075533, -1.216695, 1, 1, 1, 1, 1,
-0.7439561, -0.2271625, -2.190624, 0, 0, 1, 1, 1,
-0.7417446, 1.006349, 0.4428127, 1, 0, 0, 1, 1,
-0.7397099, 0.4046017, -2.538649, 1, 0, 0, 1, 1,
-0.7325568, 1.151194, -1.124879, 1, 0, 0, 1, 1,
-0.7321346, 0.9127431, -0.5590518, 1, 0, 0, 1, 1,
-0.7316987, 2.056978, 0.4310434, 1, 0, 0, 1, 1,
-0.7316642, 0.07462732, -1.086746, 0, 0, 0, 1, 1,
-0.7212794, 0.9330488, 0.05420426, 0, 0, 0, 1, 1,
-0.7200994, -0.2656718, -3.053125, 0, 0, 0, 1, 1,
-0.7162414, -0.03636706, -0.07168729, 0, 0, 0, 1, 1,
-0.7153085, 0.02170198, -1.869437, 0, 0, 0, 1, 1,
-0.7142394, 1.364406, 1.883519, 0, 0, 0, 1, 1,
-0.7052739, -0.2433821, -1.569374, 0, 0, 0, 1, 1,
-0.7041736, 1.055894, -1.808217, 1, 1, 1, 1, 1,
-0.7032818, 1.962433, 1.015378, 1, 1, 1, 1, 1,
-0.7021776, -0.4490303, -3.82149, 1, 1, 1, 1, 1,
-0.7009014, 1.549853, 0.1341201, 1, 1, 1, 1, 1,
-0.6980577, -2.562889, -3.140405, 1, 1, 1, 1, 1,
-0.6972414, 1.084282, 0.006410385, 1, 1, 1, 1, 1,
-0.6971799, 0.561191, -1.294388, 1, 1, 1, 1, 1,
-0.6957963, 0.5777363, -1.44656, 1, 1, 1, 1, 1,
-0.689741, -0.7931814, -4.059656, 1, 1, 1, 1, 1,
-0.6895536, -0.04215218, -1.842266, 1, 1, 1, 1, 1,
-0.6854909, -0.06011382, 0.435197, 1, 1, 1, 1, 1,
-0.680275, -0.8263251, -0.5725843, 1, 1, 1, 1, 1,
-0.6773896, -0.5443045, -2.193661, 1, 1, 1, 1, 1,
-0.6754255, -0.4981434, -1.902751, 1, 1, 1, 1, 1,
-0.6674865, -0.3756317, -2.112676, 1, 1, 1, 1, 1,
-0.6661327, 0.4426924, -0.6845505, 0, 0, 1, 1, 1,
-0.6621807, 1.334569, 0.9751288, 1, 0, 0, 1, 1,
-0.6609138, 0.5646705, -0.5061862, 1, 0, 0, 1, 1,
-0.6562227, 0.5334907, -0.1032163, 1, 0, 0, 1, 1,
-0.6422849, 0.4978837, -0.4881177, 1, 0, 0, 1, 1,
-0.6373079, -0.3633826, -2.039086, 1, 0, 0, 1, 1,
-0.6341655, 0.8278668, 1.436154, 0, 0, 0, 1, 1,
-0.6329558, 0.4920291, -1.031307, 0, 0, 0, 1, 1,
-0.6314644, -0.3676259, -1.550686, 0, 0, 0, 1, 1,
-0.6248867, 1.067519, -0.9698322, 0, 0, 0, 1, 1,
-0.6191244, -0.1997399, -2.527709, 0, 0, 0, 1, 1,
-0.6167641, -0.3886012, -2.344713, 0, 0, 0, 1, 1,
-0.6134126, 1.202992, -0.3954537, 0, 0, 0, 1, 1,
-0.61172, -2.162029, -3.846642, 1, 1, 1, 1, 1,
-0.61088, -0.0213675, -2.305914, 1, 1, 1, 1, 1,
-0.6098031, 1.60215, -0.1052883, 1, 1, 1, 1, 1,
-0.6060101, 0.4591354, -1.137098, 1, 1, 1, 1, 1,
-0.6055918, 0.9823511, -0.6850204, 1, 1, 1, 1, 1,
-0.6044571, 0.4910896, -2.82034, 1, 1, 1, 1, 1,
-0.6040276, 0.1612088, -1.865907, 1, 1, 1, 1, 1,
-0.6017052, -1.333814, -3.109302, 1, 1, 1, 1, 1,
-0.600934, 0.9180436, -1.36882, 1, 1, 1, 1, 1,
-0.5983698, -0.5435048, -2.73909, 1, 1, 1, 1, 1,
-0.5949423, -0.2911088, -2.87731, 1, 1, 1, 1, 1,
-0.5915532, 0.0908468, 0.5501276, 1, 1, 1, 1, 1,
-0.5879546, 1.055961, -1.437049, 1, 1, 1, 1, 1,
-0.5747479, -1.25547, -1.838535, 1, 1, 1, 1, 1,
-0.5712919, -2.124326, -2.189603, 1, 1, 1, 1, 1,
-0.5661922, 0.743535, 1.348663, 0, 0, 1, 1, 1,
-0.5643523, -0.4119411, -1.760282, 1, 0, 0, 1, 1,
-0.5641309, -1.461836, -3.665192, 1, 0, 0, 1, 1,
-0.5618241, 1.89689, 1.34028, 1, 0, 0, 1, 1,
-0.5582588, 0.5411349, 0.8740466, 1, 0, 0, 1, 1,
-0.5567433, 0.9193801, -1.621325, 1, 0, 0, 1, 1,
-0.5561683, -0.1122098, -1.6618, 0, 0, 0, 1, 1,
-0.5515538, -1.592821, -3.063796, 0, 0, 0, 1, 1,
-0.5484056, -0.3471697, -2.619498, 0, 0, 0, 1, 1,
-0.5478033, -2.335977, -2.431148, 0, 0, 0, 1, 1,
-0.5405629, -0.4062385, -1.880485, 0, 0, 0, 1, 1,
-0.5371388, -1.339084, -2.677064, 0, 0, 0, 1, 1,
-0.5354013, 0.9042261, -1.357339, 0, 0, 0, 1, 1,
-0.5315625, -2.31775, -2.205683, 1, 1, 1, 1, 1,
-0.5262328, 0.3022401, -0.2974281, 1, 1, 1, 1, 1,
-0.5212352, -0.1056979, -2.870798, 1, 1, 1, 1, 1,
-0.5192105, -0.1298613, -1.10124, 1, 1, 1, 1, 1,
-0.5058089, 0.08525684, -2.136785, 1, 1, 1, 1, 1,
-0.5037955, 0.6105996, -0.9998937, 1, 1, 1, 1, 1,
-0.5004263, 1.728399, -2.482017, 1, 1, 1, 1, 1,
-0.4993188, -2.233588, -2.743209, 1, 1, 1, 1, 1,
-0.4962133, -0.96141, -1.512494, 1, 1, 1, 1, 1,
-0.4955861, -0.3814945, -1.677485, 1, 1, 1, 1, 1,
-0.4901938, 0.09144296, -1.558933, 1, 1, 1, 1, 1,
-0.4877131, -1.025787, -4.397745, 1, 1, 1, 1, 1,
-0.4856606, -0.686478, -2.378427, 1, 1, 1, 1, 1,
-0.4780037, 0.01558992, 0.4426437, 1, 1, 1, 1, 1,
-0.4737256, -1.144093, -3.093711, 1, 1, 1, 1, 1,
-0.472844, -0.2514969, -3.043451, 0, 0, 1, 1, 1,
-0.4683208, 0.5069591, -0.1531819, 1, 0, 0, 1, 1,
-0.4681218, 0.138387, -0.4640253, 1, 0, 0, 1, 1,
-0.4678703, -0.02428247, -2.117185, 1, 0, 0, 1, 1,
-0.4609987, -1.352743, -3.662661, 1, 0, 0, 1, 1,
-0.454298, 0.5860054, 1.752703, 1, 0, 0, 1, 1,
-0.453263, -0.6302287, -1.496422, 0, 0, 0, 1, 1,
-0.4483152, -1.209926, -2.825595, 0, 0, 0, 1, 1,
-0.4420098, 3.050809, 0.5697725, 0, 0, 0, 1, 1,
-0.438711, 0.04555508, -1.330311, 0, 0, 0, 1, 1,
-0.4309943, 0.1700774, -0.7354617, 0, 0, 0, 1, 1,
-0.4296217, 0.4727055, 0.4258177, 0, 0, 0, 1, 1,
-0.4283192, -1.963674, -2.938932, 0, 0, 0, 1, 1,
-0.4207695, -0.7258305, -1.962541, 1, 1, 1, 1, 1,
-0.4179748, -1.375584, -2.965099, 1, 1, 1, 1, 1,
-0.4179605, -0.2167446, -2.148304, 1, 1, 1, 1, 1,
-0.4158983, -1.11843, -3.902948, 1, 1, 1, 1, 1,
-0.4136129, 0.2044494, -0.2106318, 1, 1, 1, 1, 1,
-0.4107606, 0.787406, -0.8774594, 1, 1, 1, 1, 1,
-0.4079511, 0.1988018, -0.3518388, 1, 1, 1, 1, 1,
-0.4064364, 1.345172, 0.9286813, 1, 1, 1, 1, 1,
-0.3978525, 1.100615, -0.8770184, 1, 1, 1, 1, 1,
-0.3868223, 0.9537917, -0.01896146, 1, 1, 1, 1, 1,
-0.3840982, 1.211473, -1.302108, 1, 1, 1, 1, 1,
-0.3815288, -1.199244, -1.779771, 1, 1, 1, 1, 1,
-0.3788501, 0.5996868, -1.394843, 1, 1, 1, 1, 1,
-0.3776651, -1.766428, -2.603485, 1, 1, 1, 1, 1,
-0.3775644, -2.110013, -2.24811, 1, 1, 1, 1, 1,
-0.3746341, -1.416216, -2.524599, 0, 0, 1, 1, 1,
-0.3700675, 0.9860175, 1.634678, 1, 0, 0, 1, 1,
-0.3698199, 0.7672324, -0.99605, 1, 0, 0, 1, 1,
-0.3672036, 0.00203056, -1.288827, 1, 0, 0, 1, 1,
-0.3663308, -0.8695921, -2.418917, 1, 0, 0, 1, 1,
-0.3642401, -0.6480643, -1.797763, 1, 0, 0, 1, 1,
-0.3597121, -0.3427016, -1.535333, 0, 0, 0, 1, 1,
-0.3575713, 1.453634, -0.3004104, 0, 0, 0, 1, 1,
-0.3564844, -1.322821, -1.979675, 0, 0, 0, 1, 1,
-0.3564093, -0.1625826, -1.527666, 0, 0, 0, 1, 1,
-0.3543079, -1.025833, -3.061631, 0, 0, 0, 1, 1,
-0.3522753, -1.142188, -1.82485, 0, 0, 0, 1, 1,
-0.3512625, -1.167913, -5.124095, 0, 0, 0, 1, 1,
-0.3454134, 1.056092, 0.3314384, 1, 1, 1, 1, 1,
-0.3452561, 3.50741, 0.01528003, 1, 1, 1, 1, 1,
-0.3441833, 0.03708065, -2.111734, 1, 1, 1, 1, 1,
-0.3429641, 0.3561705, -0.8620756, 1, 1, 1, 1, 1,
-0.3403061, -0.4383668, -3.420401, 1, 1, 1, 1, 1,
-0.335687, -0.01544519, -2.799532, 1, 1, 1, 1, 1,
-0.3356326, -1.661449, -1.290965, 1, 1, 1, 1, 1,
-0.3348619, 0.5488416, 0.992797, 1, 1, 1, 1, 1,
-0.3309684, 0.2270202, -0.2142214, 1, 1, 1, 1, 1,
-0.3304027, 0.6006497, -1.242861, 1, 1, 1, 1, 1,
-0.3103163, -0.5869598, -2.505508, 1, 1, 1, 1, 1,
-0.3089326, -0.187561, -1.590293, 1, 1, 1, 1, 1,
-0.3071291, 1.996592, 0.7119841, 1, 1, 1, 1, 1,
-0.3026598, -1.257734, -5.046487, 1, 1, 1, 1, 1,
-0.301839, 0.3472391, -0.1770762, 1, 1, 1, 1, 1,
-0.2990335, 1.360926, 0.3933344, 0, 0, 1, 1, 1,
-0.2875243, 0.3437821, -0.9270797, 1, 0, 0, 1, 1,
-0.2869777, -1.49544, -2.201512, 1, 0, 0, 1, 1,
-0.2857013, -0.3999571, -0.5371247, 1, 0, 0, 1, 1,
-0.2787214, -1.722203, -2.528026, 1, 0, 0, 1, 1,
-0.2716114, 0.8066812, -1.815004, 1, 0, 0, 1, 1,
-0.2701989, -0.2230326, -1.507469, 0, 0, 0, 1, 1,
-0.2700849, -1.043681, -2.240757, 0, 0, 0, 1, 1,
-0.2674988, -0.3568299, -2.669635, 0, 0, 0, 1, 1,
-0.2665015, -0.8637019, -2.988093, 0, 0, 0, 1, 1,
-0.2661001, 0.680816, -0.1599054, 0, 0, 0, 1, 1,
-0.2654169, -0.6192714, -2.048523, 0, 0, 0, 1, 1,
-0.2540802, 0.516575, -1.031032, 0, 0, 0, 1, 1,
-0.2528579, -0.01363946, -0.4318761, 1, 1, 1, 1, 1,
-0.2520095, 0.1203574, -3.42479, 1, 1, 1, 1, 1,
-0.2513748, 0.5831608, -1.396717, 1, 1, 1, 1, 1,
-0.2443342, -0.3952285, -3.657818, 1, 1, 1, 1, 1,
-0.2414607, -1.559532, -5.435182, 1, 1, 1, 1, 1,
-0.2402514, -1.753502, -1.221901, 1, 1, 1, 1, 1,
-0.2371162, 1.44, -1.472093, 1, 1, 1, 1, 1,
-0.2366659, -1.551014, -3.323261, 1, 1, 1, 1, 1,
-0.2346436, 0.5417565, 0.0272977, 1, 1, 1, 1, 1,
-0.2278466, 1.345472, 0.07209022, 1, 1, 1, 1, 1,
-0.2239951, 1.348876, 0.006029748, 1, 1, 1, 1, 1,
-0.223331, 0.4509634, -0.9034337, 1, 1, 1, 1, 1,
-0.2225075, 0.2869891, -1.611291, 1, 1, 1, 1, 1,
-0.2196606, 0.3244615, -1.820047, 1, 1, 1, 1, 1,
-0.2184092, 1.007585, -1.379462, 1, 1, 1, 1, 1,
-0.2177738, -1.826622, -2.45835, 0, 0, 1, 1, 1,
-0.2177003, -1.066017, -3.404788, 1, 0, 0, 1, 1,
-0.2158535, 0.1120563, -1.642144, 1, 0, 0, 1, 1,
-0.2145182, -0.4137293, -2.916407, 1, 0, 0, 1, 1,
-0.2132103, 0.1617698, -1.219397, 1, 0, 0, 1, 1,
-0.2070802, -1.586887, -3.707485, 1, 0, 0, 1, 1,
-0.2070158, -2.35464, -1.210405, 0, 0, 0, 1, 1,
-0.2064163, -1.290643, -3.842883, 0, 0, 0, 1, 1,
-0.2045406, 0.2574204, 0.2628953, 0, 0, 0, 1, 1,
-0.2025916, -0.6651322, -3.312447, 0, 0, 0, 1, 1,
-0.2019771, 0.6560869, -0.4737417, 0, 0, 0, 1, 1,
-0.2016452, -0.7685789, -4.142315, 0, 0, 0, 1, 1,
-0.201645, -1.002699, -3.416947, 0, 0, 0, 1, 1,
-0.2009656, 0.4573354, 0.8685339, 1, 1, 1, 1, 1,
-0.1992094, 1.118398, -1.114915, 1, 1, 1, 1, 1,
-0.1982896, -2.56868, -3.721921, 1, 1, 1, 1, 1,
-0.1971147, -1.650727, -0.9304218, 1, 1, 1, 1, 1,
-0.1967606, -0.3382709, -1.207166, 1, 1, 1, 1, 1,
-0.195016, -0.2722382, -1.42228, 1, 1, 1, 1, 1,
-0.1910791, -2.089702, -3.704603, 1, 1, 1, 1, 1,
-0.1905647, -0.3720396, -1.803255, 1, 1, 1, 1, 1,
-0.188272, -0.1734516, -2.061293, 1, 1, 1, 1, 1,
-0.1877603, -0.2744083, -2.941194, 1, 1, 1, 1, 1,
-0.1852558, -1.993541, -1.666401, 1, 1, 1, 1, 1,
-0.1780715, -0.04867209, -0.306518, 1, 1, 1, 1, 1,
-0.1767825, -0.7061131, -3.068564, 1, 1, 1, 1, 1,
-0.1752197, 0.0176732, -0.5600029, 1, 1, 1, 1, 1,
-0.1714954, 0.9389191, 0.6516949, 1, 1, 1, 1, 1,
-0.1714633, 0.6748209, -0.5551398, 0, 0, 1, 1, 1,
-0.166185, -1.790018, -3.141336, 1, 0, 0, 1, 1,
-0.165222, 0.2773466, -0.8494127, 1, 0, 0, 1, 1,
-0.1587681, -0.5224701, -2.292363, 1, 0, 0, 1, 1,
-0.157278, 1.573288, -0.2475795, 1, 0, 0, 1, 1,
-0.1508956, 0.4404128, -0.6512827, 1, 0, 0, 1, 1,
-0.1461141, -0.5174755, -2.346731, 0, 0, 0, 1, 1,
-0.1386665, -2.587835, -1.753212, 0, 0, 0, 1, 1,
-0.1381367, 1.392725, 1.342973, 0, 0, 0, 1, 1,
-0.1365738, 0.3618386, -1.210949, 0, 0, 0, 1, 1,
-0.1359685, -0.07585115, -3.391657, 0, 0, 0, 1, 1,
-0.1338256, -0.4031397, -3.14706, 0, 0, 0, 1, 1,
-0.1317898, 0.687494, -1.723949, 0, 0, 0, 1, 1,
-0.1280681, -0.2905586, -2.434443, 1, 1, 1, 1, 1,
-0.1240911, 1.071514, 1.806492, 1, 1, 1, 1, 1,
-0.1227027, 1.11017, -1.562502, 1, 1, 1, 1, 1,
-0.1182624, -0.3862575, -1.597271, 1, 1, 1, 1, 1,
-0.1182194, 0.2096626, -0.4996042, 1, 1, 1, 1, 1,
-0.117292, 0.4867835, -0.377702, 1, 1, 1, 1, 1,
-0.1164619, -1.814288, -2.973819, 1, 1, 1, 1, 1,
-0.1131333, -2.372085, -4.373092, 1, 1, 1, 1, 1,
-0.1097936, 0.01331344, -1.100239, 1, 1, 1, 1, 1,
-0.1056164, -0.9860798, -4.079472, 1, 1, 1, 1, 1,
-0.09871182, -0.1521971, -2.714142, 1, 1, 1, 1, 1,
-0.09695803, 0.1649268, -0.9582549, 1, 1, 1, 1, 1,
-0.09679796, 0.329536, 0.155846, 1, 1, 1, 1, 1,
-0.09528468, 0.2422376, -3.162728, 1, 1, 1, 1, 1,
-0.09344454, -1.914796, -2.993064, 1, 1, 1, 1, 1,
-0.0881583, -0.2750744, -2.064438, 0, 0, 1, 1, 1,
-0.08288556, -1.820806, -4.23564, 1, 0, 0, 1, 1,
-0.08217292, 0.646217, 0.2523623, 1, 0, 0, 1, 1,
-0.07320599, -1.534304, -3.99971, 1, 0, 0, 1, 1,
-0.0679155, 0.4780103, 0.2353102, 1, 0, 0, 1, 1,
-0.06741808, 0.5711576, 0.03102235, 1, 0, 0, 1, 1,
-0.06259944, 0.08658125, -1.288567, 0, 0, 0, 1, 1,
-0.06062315, 0.1539602, -0.5503628, 0, 0, 0, 1, 1,
-0.05803452, -0.5951915, -3.175325, 0, 0, 0, 1, 1,
-0.05325565, 1.55001, 1.345112, 0, 0, 0, 1, 1,
-0.0528012, -0.1567736, -3.834845, 0, 0, 0, 1, 1,
-0.05211059, -1.19829, -3.117734, 0, 0, 0, 1, 1,
-0.05022867, 0.3142243, 0.722449, 0, 0, 0, 1, 1,
-0.04962852, 1.037369, -1.001441, 1, 1, 1, 1, 1,
-0.04419484, -0.2579583, -3.271026, 1, 1, 1, 1, 1,
-0.04226785, -0.01629123, -2.801278, 1, 1, 1, 1, 1,
-0.04141206, -0.3160606, -3.702884, 1, 1, 1, 1, 1,
-0.03146939, 0.1512125, -1.774965, 1, 1, 1, 1, 1,
-0.02837666, 0.2527304, 1.485003, 1, 1, 1, 1, 1,
-0.0263816, 0.08459267, 0.9552467, 1, 1, 1, 1, 1,
-0.02638052, 1.392666, -0.9744446, 1, 1, 1, 1, 1,
-0.02303605, 0.1449734, 0.8411877, 1, 1, 1, 1, 1,
-0.02133742, 0.8844727, -0.4283037, 1, 1, 1, 1, 1,
-0.01722801, -0.3021975, -0.5512026, 1, 1, 1, 1, 1,
-0.01194453, -0.4174143, -4.649047, 1, 1, 1, 1, 1,
-0.01013271, -1.430651, -2.726992, 1, 1, 1, 1, 1,
-0.00903459, 0.3148068, 0.05400142, 1, 1, 1, 1, 1,
-0.005550073, 2.012649, 0.3176101, 1, 1, 1, 1, 1,
-0.00498538, -0.8693982, -2.994264, 0, 0, 1, 1, 1,
-0.002489572, -0.2128993, -2.535552, 1, 0, 0, 1, 1,
-0.001328264, 0.4403501, -1.424284, 1, 0, 0, 1, 1,
-0.0003018287, -0.04756415, -2.252807, 1, 0, 0, 1, 1,
0.008853419, 0.1284043, -0.1455542, 1, 0, 0, 1, 1,
0.01179542, 0.2052202, 1.074616, 1, 0, 0, 1, 1,
0.01346505, 0.6047445, -1.383977, 0, 0, 0, 1, 1,
0.01573688, -0.6486988, 3.643234, 0, 0, 0, 1, 1,
0.01621646, 0.9756099, 0.6121692, 0, 0, 0, 1, 1,
0.01852747, 0.5163246, 1.435581, 0, 0, 0, 1, 1,
0.02519332, 0.5578739, -1.904048, 0, 0, 0, 1, 1,
0.02612413, 0.9054782, 1.654405, 0, 0, 0, 1, 1,
0.02898474, -0.6582118, 3.253664, 0, 0, 0, 1, 1,
0.03123051, 0.7364998, -2.310521, 1, 1, 1, 1, 1,
0.0362565, -0.4945025, 2.396111, 1, 1, 1, 1, 1,
0.03745636, -1.072168, 1.607375, 1, 1, 1, 1, 1,
0.04086113, 0.02444879, 0.3215808, 1, 1, 1, 1, 1,
0.04173923, -0.1415984, 2.952348, 1, 1, 1, 1, 1,
0.046785, -0.0886069, 3.375477, 1, 1, 1, 1, 1,
0.04790581, 1.620178, -1.366769, 1, 1, 1, 1, 1,
0.0529971, 0.1921635, 0.814725, 1, 1, 1, 1, 1,
0.0540954, -0.01537965, 1.078591, 1, 1, 1, 1, 1,
0.05931289, -0.6232538, 5.083756, 1, 1, 1, 1, 1,
0.06373166, 0.9096856, 1.191219, 1, 1, 1, 1, 1,
0.06598843, 0.3679774, 1.383775, 1, 1, 1, 1, 1,
0.0672866, 0.933594, 0.4786635, 1, 1, 1, 1, 1,
0.06872869, -0.198278, 3.525248, 1, 1, 1, 1, 1,
0.07465933, -1.354613, 3.60543, 1, 1, 1, 1, 1,
0.07523415, 1.321871, -0.5629497, 0, 0, 1, 1, 1,
0.0763429, -1.25763, 3.092576, 1, 0, 0, 1, 1,
0.07653616, -0.4234274, 3.230983, 1, 0, 0, 1, 1,
0.07831235, -1.270671, 3.111714, 1, 0, 0, 1, 1,
0.08379383, -2.031607, 3.955018, 1, 0, 0, 1, 1,
0.08878221, 0.5567278, 0.6963052, 1, 0, 0, 1, 1,
0.0924494, -0.3600212, 1.966194, 0, 0, 0, 1, 1,
0.09660538, -0.46118, 4.357151, 0, 0, 0, 1, 1,
0.102083, 0.2637362, 0.1211182, 0, 0, 0, 1, 1,
0.1025084, -1.247553, 2.578309, 0, 0, 0, 1, 1,
0.1029587, -0.1551285, 2.227935, 0, 0, 0, 1, 1,
0.1048946, -0.04814404, 2.629932, 0, 0, 0, 1, 1,
0.1138147, 1.876253, 2.335912, 0, 0, 0, 1, 1,
0.115799, 0.01533253, -0.45914, 1, 1, 1, 1, 1,
0.1170331, 0.2568699, 1.205944, 1, 1, 1, 1, 1,
0.1225606, -0.1787154, 2.155491, 1, 1, 1, 1, 1,
0.1227685, 0.6918699, 0.3009985, 1, 1, 1, 1, 1,
0.1234268, 0.4221415, -1.142673, 1, 1, 1, 1, 1,
0.1253405, -0.5304669, 3.250455, 1, 1, 1, 1, 1,
0.1283095, 0.1917616, -0.5096124, 1, 1, 1, 1, 1,
0.1286265, -0.9669734, 3.730351, 1, 1, 1, 1, 1,
0.1411424, 1.771151, 0.683901, 1, 1, 1, 1, 1,
0.1441867, -0.9604638, 1.959856, 1, 1, 1, 1, 1,
0.1490483, -0.8400103, 2.292033, 1, 1, 1, 1, 1,
0.1526859, 1.955909, -0.4587112, 1, 1, 1, 1, 1,
0.1632062, 0.8774948, -0.907595, 1, 1, 1, 1, 1,
0.1642443, 0.003176435, 1.23462, 1, 1, 1, 1, 1,
0.1647495, 0.3019634, -0.005767909, 1, 1, 1, 1, 1,
0.1669922, -0.7181349, 1.188984, 0, 0, 1, 1, 1,
0.1695825, 0.5045906, -1.660916, 1, 0, 0, 1, 1,
0.1715254, -1.358481, 1.56587, 1, 0, 0, 1, 1,
0.1731479, -0.4357256, 2.077343, 1, 0, 0, 1, 1,
0.1744064, 0.3195014, -0.0812732, 1, 0, 0, 1, 1,
0.1780075, -0.1540553, 3.848495, 1, 0, 0, 1, 1,
0.1785389, 0.2992687, 0.9465541, 0, 0, 0, 1, 1,
0.1826908, -1.178784, 3.82847, 0, 0, 0, 1, 1,
0.1871774, -0.07122009, 0.3325136, 0, 0, 0, 1, 1,
0.2037768, 0.9723663, 0.1050256, 0, 0, 0, 1, 1,
0.20777, 0.3865267, 0.2831222, 0, 0, 0, 1, 1,
0.2082962, -1.188257, 1.616381, 0, 0, 0, 1, 1,
0.2096675, 2.234371, 0.06555386, 0, 0, 0, 1, 1,
0.215965, -1.060228, 3.055779, 1, 1, 1, 1, 1,
0.2179739, 0.006127548, 0.637904, 1, 1, 1, 1, 1,
0.2275706, 1.494961, -0.3112182, 1, 1, 1, 1, 1,
0.2318723, 0.4499414, -0.9879337, 1, 1, 1, 1, 1,
0.23885, 0.6578383, 1.689838, 1, 1, 1, 1, 1,
0.240165, -0.0998261, 1.617433, 1, 1, 1, 1, 1,
0.2416292, 1.564098, 0.6283101, 1, 1, 1, 1, 1,
0.2458548, -0.4444467, 3.539508, 1, 1, 1, 1, 1,
0.2488841, 0.53025, -1.706641, 1, 1, 1, 1, 1,
0.2492652, -0.4569362, 2.961529, 1, 1, 1, 1, 1,
0.2498578, -0.1546439, 2.936952, 1, 1, 1, 1, 1,
0.2523586, 0.9458779, -0.3482135, 1, 1, 1, 1, 1,
0.253701, -0.2208672, 5.080469, 1, 1, 1, 1, 1,
0.2573821, 0.2752396, 0.3975579, 1, 1, 1, 1, 1,
0.2582612, -0.3394047, 4.495216, 1, 1, 1, 1, 1,
0.2584972, 1.208282, -0.05587385, 0, 0, 1, 1, 1,
0.2610939, -2.27947, 2.684341, 1, 0, 0, 1, 1,
0.2614189, -0.04893466, 0.6245161, 1, 0, 0, 1, 1,
0.2666965, 0.1683657, -1.251725, 1, 0, 0, 1, 1,
0.2726078, -0.6042243, 1.514186, 1, 0, 0, 1, 1,
0.275233, -0.2373786, 1.400271, 1, 0, 0, 1, 1,
0.275785, -0.04223438, 0.7219375, 0, 0, 0, 1, 1,
0.2774754, -0.1743865, 2.059753, 0, 0, 0, 1, 1,
0.2796747, -2.229256, 3.677965, 0, 0, 0, 1, 1,
0.281252, 1.43419, -0.6987443, 0, 0, 0, 1, 1,
0.2839633, -0.3726988, 1.642825, 0, 0, 0, 1, 1,
0.2873574, 0.7159672, -0.7089272, 0, 0, 0, 1, 1,
0.2880833, -1.03795, 2.440662, 0, 0, 0, 1, 1,
0.2896951, 1.222464, -0.08917777, 1, 1, 1, 1, 1,
0.2938051, -0.3928117, 2.094798, 1, 1, 1, 1, 1,
0.3012519, -0.8199247, 1.648419, 1, 1, 1, 1, 1,
0.304922, 1.011506, -1.616586, 1, 1, 1, 1, 1,
0.3057511, 1.082902, 1.576689, 1, 1, 1, 1, 1,
0.309374, 0.4887176, -2.03803, 1, 1, 1, 1, 1,
0.3119475, -0.009082542, 0.8907279, 1, 1, 1, 1, 1,
0.3132013, -0.6738616, 3.902292, 1, 1, 1, 1, 1,
0.3158194, -1.432967, 3.561318, 1, 1, 1, 1, 1,
0.3186874, 1.324933, 0.6148608, 1, 1, 1, 1, 1,
0.3187484, -0.1162926, 3.264125, 1, 1, 1, 1, 1,
0.3190264, 0.06151662, 2.511174, 1, 1, 1, 1, 1,
0.322539, 0.5580118, 1.145875, 1, 1, 1, 1, 1,
0.3313014, -1.71227, 5.457982, 1, 1, 1, 1, 1,
0.3314168, 0.1609093, 1.87948, 1, 1, 1, 1, 1,
0.3348548, 0.2093223, 2.688357, 0, 0, 1, 1, 1,
0.3350605, -0.007949119, 2.49946, 1, 0, 0, 1, 1,
0.3472093, -0.1220467, 3.302905, 1, 0, 0, 1, 1,
0.3478085, 1.06334, 0.06462163, 1, 0, 0, 1, 1,
0.3547316, -0.2455103, 2.700168, 1, 0, 0, 1, 1,
0.3572579, 0.3474823, 0.4440754, 1, 0, 0, 1, 1,
0.3610062, 1.19141, -0.4044718, 0, 0, 0, 1, 1,
0.362194, -0.9247399, 2.124006, 0, 0, 0, 1, 1,
0.3670639, 1.594344, -0.07413484, 0, 0, 0, 1, 1,
0.3730476, -1.626964, 1.294098, 0, 0, 0, 1, 1,
0.3748628, 0.09013481, 1.808866, 0, 0, 0, 1, 1,
0.3764524, -0.6113076, 3.909869, 0, 0, 0, 1, 1,
0.3774996, -0.6897073, 1.967429, 0, 0, 0, 1, 1,
0.3795392, -1.406151, 2.744741, 1, 1, 1, 1, 1,
0.3806144, -0.6505865, 3.160001, 1, 1, 1, 1, 1,
0.3816427, -0.794522, 2.61357, 1, 1, 1, 1, 1,
0.3816437, 0.5035131, 0.6103441, 1, 1, 1, 1, 1,
0.3842964, 1.975066, 1.41524, 1, 1, 1, 1, 1,
0.3937725, -2.037235, 3.506744, 1, 1, 1, 1, 1,
0.3945671, 0.4001041, 0.6516865, 1, 1, 1, 1, 1,
0.3952231, 1.664084, -1.202676, 1, 1, 1, 1, 1,
0.396327, -1.717722, 1.226361, 1, 1, 1, 1, 1,
0.3976788, -1.585394, 1.773609, 1, 1, 1, 1, 1,
0.3981598, -0.7287808, 2.499462, 1, 1, 1, 1, 1,
0.4017998, 0.2309972, 2.541807, 1, 1, 1, 1, 1,
0.4099734, 0.2015555, 2.613956, 1, 1, 1, 1, 1,
0.4125113, -0.2446649, 0.5965901, 1, 1, 1, 1, 1,
0.4133026, 1.792955, 0.3317525, 1, 1, 1, 1, 1,
0.4176297, 1.845411, 1.030794, 0, 0, 1, 1, 1,
0.4179843, -1.944492, 2.564891, 1, 0, 0, 1, 1,
0.4250293, -1.565377, 4.758242, 1, 0, 0, 1, 1,
0.4257698, 0.6648972, -0.04559695, 1, 0, 0, 1, 1,
0.4258127, -0.4873641, 3.441944, 1, 0, 0, 1, 1,
0.4259253, 1.11271, -0.4124462, 1, 0, 0, 1, 1,
0.4304374, 0.1186181, 1.126543, 0, 0, 0, 1, 1,
0.4306548, 0.8457287, 1.360223, 0, 0, 0, 1, 1,
0.4325989, -2.162774, 3.112163, 0, 0, 0, 1, 1,
0.4332044, 1.250414, 1.406351, 0, 0, 0, 1, 1,
0.4364178, 0.7020597, -0.3820067, 0, 0, 0, 1, 1,
0.4386018, 1.220542, 0.8587443, 0, 0, 0, 1, 1,
0.4412249, -0.6470126, 2.630921, 0, 0, 0, 1, 1,
0.4416279, -0.3909915, 2.261483, 1, 1, 1, 1, 1,
0.4420279, 1.13614, 1.419227, 1, 1, 1, 1, 1,
0.4426891, -0.6023089, 3.189398, 1, 1, 1, 1, 1,
0.4428532, 0.5447116, -0.01792659, 1, 1, 1, 1, 1,
0.4456509, 0.7933302, 0.0871162, 1, 1, 1, 1, 1,
0.4477309, 0.5333428, 0.1297912, 1, 1, 1, 1, 1,
0.4554157, -0.1091206, 1.964057, 1, 1, 1, 1, 1,
0.4563709, 0.3371763, -0.08494121, 1, 1, 1, 1, 1,
0.4582328, 1.398602, 1.513655, 1, 1, 1, 1, 1,
0.458759, -0.4617905, 1.801224, 1, 1, 1, 1, 1,
0.4644038, 1.064601, 1.639371, 1, 1, 1, 1, 1,
0.4647365, 2.179773, -0.6789986, 1, 1, 1, 1, 1,
0.4657454, -0.7713928, 3.213116, 1, 1, 1, 1, 1,
0.4662682, 1.927143, 0.6908599, 1, 1, 1, 1, 1,
0.4728942, -0.2155286, 2.633713, 1, 1, 1, 1, 1,
0.4755178, 0.3527102, 0.6463543, 0, 0, 1, 1, 1,
0.4778595, -1.161268, 3.14891, 1, 0, 0, 1, 1,
0.4778778, 0.06541113, 2.747971, 1, 0, 0, 1, 1,
0.4797901, -2.174228, 3.403954, 1, 0, 0, 1, 1,
0.48071, -0.0478249, 2.155207, 1, 0, 0, 1, 1,
0.4858736, -0.9037597, 2.764943, 1, 0, 0, 1, 1,
0.49097, -0.8018119, 4.31797, 0, 0, 0, 1, 1,
0.4919658, -0.5018843, 2.611358, 0, 0, 0, 1, 1,
0.4950265, -0.3880989, 2.541774, 0, 0, 0, 1, 1,
0.4976177, -0.7631961, 2.29376, 0, 0, 0, 1, 1,
0.5058527, -0.4087926, 3.799728, 0, 0, 0, 1, 1,
0.5082628, 0.1522, 1.70695, 0, 0, 0, 1, 1,
0.5093766, 0.9833863, 2.171726, 0, 0, 0, 1, 1,
0.5127377, 2.085959, 0.2940508, 1, 1, 1, 1, 1,
0.5172195, -1.021353, 3.437738, 1, 1, 1, 1, 1,
0.5178701, 0.2545183, 1.863635, 1, 1, 1, 1, 1,
0.5229576, 0.129032, 2.986817, 1, 1, 1, 1, 1,
0.5243436, -0.3116882, 1.795853, 1, 1, 1, 1, 1,
0.5250993, -0.9809366, 2.321397, 1, 1, 1, 1, 1,
0.5324638, -1.232993, 1.941751, 1, 1, 1, 1, 1,
0.5334937, 0.217691, 2.114444, 1, 1, 1, 1, 1,
0.5335968, -2.055262, 3.591638, 1, 1, 1, 1, 1,
0.5340729, -0.9294361, 3.179311, 1, 1, 1, 1, 1,
0.5389724, -0.4623286, -0.160852, 1, 1, 1, 1, 1,
0.5414725, -1.459589, 1.419777, 1, 1, 1, 1, 1,
0.5484304, 0.1480201, 2.747627, 1, 1, 1, 1, 1,
0.5505591, 1.466372, -0.314225, 1, 1, 1, 1, 1,
0.5511071, -0.4189318, 1.741968, 1, 1, 1, 1, 1,
0.5539212, 0.6116514, -2.042211, 0, 0, 1, 1, 1,
0.5552971, -0.7229506, 2.922656, 1, 0, 0, 1, 1,
0.5569804, -0.9878748, 4.470413, 1, 0, 0, 1, 1,
0.5681975, -1.116801, 1.72387, 1, 0, 0, 1, 1,
0.5683508, 1.110256, 1.268932, 1, 0, 0, 1, 1,
0.5753936, 1.26355, 0.1251844, 1, 0, 0, 1, 1,
0.5805058, -0.4515173, 2.597815, 0, 0, 0, 1, 1,
0.5811895, 1.627035, -0.8952964, 0, 0, 0, 1, 1,
0.5821022, -1.414409, 3.085559, 0, 0, 0, 1, 1,
0.5844199, 0.709737, 0.3611212, 0, 0, 0, 1, 1,
0.5899125, 0.4496955, 1.218244, 0, 0, 0, 1, 1,
0.5985069, -0.1061751, 1.56661, 0, 0, 0, 1, 1,
0.600329, -2.628869, 3.081219, 0, 0, 0, 1, 1,
0.609137, 0.04588358, 2.657745, 1, 1, 1, 1, 1,
0.6099107, -2.538126, 4.910141, 1, 1, 1, 1, 1,
0.6101145, -0.8128957, 3.147944, 1, 1, 1, 1, 1,
0.6103185, -1.177611, 3.281811, 1, 1, 1, 1, 1,
0.6117396, 1.018513, 1.873793, 1, 1, 1, 1, 1,
0.6126254, -0.9216305, 3.276788, 1, 1, 1, 1, 1,
0.6127191, -0.3700091, 1.70259, 1, 1, 1, 1, 1,
0.6130934, -0.07050095, 2.190853, 1, 1, 1, 1, 1,
0.6153355, 0.3157268, 1.144803, 1, 1, 1, 1, 1,
0.615777, -0.8991186, 2.996686, 1, 1, 1, 1, 1,
0.61914, 0.9403242, 0.7147128, 1, 1, 1, 1, 1,
0.6208361, -0.3760505, 1.86758, 1, 1, 1, 1, 1,
0.6295483, 0.4128212, 2.352795, 1, 1, 1, 1, 1,
0.630239, 1.143964, -0.6302871, 1, 1, 1, 1, 1,
0.6338368, 0.8155695, -0.06455947, 1, 1, 1, 1, 1,
0.6401112, 1.550405, -0.06379621, 0, 0, 1, 1, 1,
0.6437231, -1.491454, 4.883687, 1, 0, 0, 1, 1,
0.646737, -0.1454684, 1.09255, 1, 0, 0, 1, 1,
0.6484, -1.07426, 2.563744, 1, 0, 0, 1, 1,
0.6495767, 0.657329, 0.7226934, 1, 0, 0, 1, 1,
0.6555703, 0.5898011, 1.007584, 1, 0, 0, 1, 1,
0.6556524, 0.3498017, 1.253206, 0, 0, 0, 1, 1,
0.660215, -0.3273893, 1.27682, 0, 0, 0, 1, 1,
0.6611779, 0.3903662, 1.737745, 0, 0, 0, 1, 1,
0.6624033, -1.095544, 2.128821, 0, 0, 0, 1, 1,
0.6628183, 0.51762, 1.627403, 0, 0, 0, 1, 1,
0.6687115, 1.140988, 0.8893301, 0, 0, 0, 1, 1,
0.6698434, 0.8462103, 0.136156, 0, 0, 0, 1, 1,
0.6726737, -0.07178421, 2.211918, 1, 1, 1, 1, 1,
0.6739545, -1.114085, 2.79486, 1, 1, 1, 1, 1,
0.6745149, 0.9279824, 0.2198454, 1, 1, 1, 1, 1,
0.6802936, -1.499144, 3.49941, 1, 1, 1, 1, 1,
0.6821348, -0.4735655, 3.592164, 1, 1, 1, 1, 1,
0.6822881, -1.041008, 4.055055, 1, 1, 1, 1, 1,
0.6825092, 1.251728, 0.7531185, 1, 1, 1, 1, 1,
0.6863897, -0.2539267, 2.864608, 1, 1, 1, 1, 1,
0.6884019, 0.8577219, 1.211999, 1, 1, 1, 1, 1,
0.688647, -0.15714, 2.360989, 1, 1, 1, 1, 1,
0.6921093, 0.771058, -0.4147052, 1, 1, 1, 1, 1,
0.6926438, 1.278761, 0.739195, 1, 1, 1, 1, 1,
0.6933082, 0.1130718, 1.978228, 1, 1, 1, 1, 1,
0.69551, -1.684435, 3.092961, 1, 1, 1, 1, 1,
0.7015789, 0.4454554, 3.640861, 1, 1, 1, 1, 1,
0.7072546, 0.3279263, 2.190135, 0, 0, 1, 1, 1,
0.7134071, 0.791932, -0.04218438, 1, 0, 0, 1, 1,
0.7161943, 0.3151032, 2.245045, 1, 0, 0, 1, 1,
0.7166984, 0.3413679, -1.91991, 1, 0, 0, 1, 1,
0.7199674, -1.015551, 3.19648, 1, 0, 0, 1, 1,
0.7232615, -1.001754, 2.469203, 1, 0, 0, 1, 1,
0.7269436, -0.3305206, 4.196486, 0, 0, 0, 1, 1,
0.7281867, -0.3705328, 1.167822, 0, 0, 0, 1, 1,
0.7295364, 1.183615, 0.9513201, 0, 0, 0, 1, 1,
0.7308587, -0.0647218, 2.194893, 0, 0, 0, 1, 1,
0.7312189, -1.894304, 3.414376, 0, 0, 0, 1, 1,
0.7339247, 0.6164455, 1.258321, 0, 0, 0, 1, 1,
0.7371813, 0.5405414, 1.118435, 0, 0, 0, 1, 1,
0.737624, -0.273732, 1.227469, 1, 1, 1, 1, 1,
0.7451496, 1.204493, 1.101896, 1, 1, 1, 1, 1,
0.745959, -0.7687588, 2.321961, 1, 1, 1, 1, 1,
0.7472721, -1.403633, 2.765885, 1, 1, 1, 1, 1,
0.750141, -1.613796, 2.707711, 1, 1, 1, 1, 1,
0.7512838, -1.012083, 2.225193, 1, 1, 1, 1, 1,
0.7515413, -1.528251, 3.418238, 1, 1, 1, 1, 1,
0.7628531, 1.239581, 0.02013124, 1, 1, 1, 1, 1,
0.7652665, -0.3291137, 2.499958, 1, 1, 1, 1, 1,
0.7693706, -1.428388, 2.688828, 1, 1, 1, 1, 1,
0.7706633, -0.2415098, 2.44988, 1, 1, 1, 1, 1,
0.7739223, 0.7181668, 0.5233598, 1, 1, 1, 1, 1,
0.775245, 1.706537, -0.4795859, 1, 1, 1, 1, 1,
0.7754221, -0.1282099, 1.026263, 1, 1, 1, 1, 1,
0.7775738, 1.870675, -0.8052856, 1, 1, 1, 1, 1,
0.7776226, 0.1630529, 0.1389528, 0, 0, 1, 1, 1,
0.7829348, -1.099417, 2.455616, 1, 0, 0, 1, 1,
0.7902427, -0.6378266, 2.383884, 1, 0, 0, 1, 1,
0.7917783, -0.1027158, 2.047302, 1, 0, 0, 1, 1,
0.7940419, -0.1406986, 0.3724789, 1, 0, 0, 1, 1,
0.7952031, 0.4287531, 2.099184, 1, 0, 0, 1, 1,
0.7985312, 1.115177, 0.7039297, 0, 0, 0, 1, 1,
0.8005858, -0.3566135, 1.044652, 0, 0, 0, 1, 1,
0.8015945, 0.7494672, 1.112576, 0, 0, 0, 1, 1,
0.8050609, -1.174504, 2.422534, 0, 0, 0, 1, 1,
0.8082592, 1.479403, 1.404138, 0, 0, 0, 1, 1,
0.8086238, -0.2963093, 0.4960135, 0, 0, 0, 1, 1,
0.8116715, 0.201486, 1.624765, 0, 0, 0, 1, 1,
0.8124422, 0.515097, 1.208092, 1, 1, 1, 1, 1,
0.8169363, -0.7339091, 1.901847, 1, 1, 1, 1, 1,
0.8170547, -0.06359772, 2.216647, 1, 1, 1, 1, 1,
0.8223116, -1.896608, 3.697315, 1, 1, 1, 1, 1,
0.8306782, -0.9585835, 0.8759874, 1, 1, 1, 1, 1,
0.8385025, 0.7893323, 2.043519, 1, 1, 1, 1, 1,
0.8396216, 0.0355657, 2.486733, 1, 1, 1, 1, 1,
0.8427551, 1.62112, -0.6004393, 1, 1, 1, 1, 1,
0.8437791, 0.8770384, 3.14636, 1, 1, 1, 1, 1,
0.845394, 0.5435528, 0.8747339, 1, 1, 1, 1, 1,
0.8490725, -1.476032, 1.769001, 1, 1, 1, 1, 1,
0.8572309, -0.2603483, 2.153525, 1, 1, 1, 1, 1,
0.8611624, 0.704868, 1.20202, 1, 1, 1, 1, 1,
0.8649259, 1.521143, 0.05065341, 1, 1, 1, 1, 1,
0.8682957, 0.2183931, 1.85936, 1, 1, 1, 1, 1,
0.8699293, 0.9508601, 0.2146163, 0, 0, 1, 1, 1,
0.8716022, 0.1595112, -0.04274891, 1, 0, 0, 1, 1,
0.874473, 1.144459, 0.8660143, 1, 0, 0, 1, 1,
0.87622, -2.655787, 3.354725, 1, 0, 0, 1, 1,
0.8791112, -0.9011927, 2.553738, 1, 0, 0, 1, 1,
0.8869645, -1.428954, 2.258209, 1, 0, 0, 1, 1,
0.8886238, 1.241804, -0.1724725, 0, 0, 0, 1, 1,
0.8928869, -0.2429445, 2.147682, 0, 0, 0, 1, 1,
0.8937293, 1.120995, -0.3002196, 0, 0, 0, 1, 1,
0.9052415, 0.3502969, 0.9611303, 0, 0, 0, 1, 1,
0.9073383, -1.033962, 3.881428, 0, 0, 0, 1, 1,
0.9111857, 0.2326941, 1.765377, 0, 0, 0, 1, 1,
0.9165851, 1.212637, 0.3496263, 0, 0, 0, 1, 1,
0.9200097, -0.0822248, 1.200504, 1, 1, 1, 1, 1,
0.9210992, -0.896557, 3.782853, 1, 1, 1, 1, 1,
0.9272681, -0.484628, 2.053216, 1, 1, 1, 1, 1,
0.9282079, -0.1232336, 3.1282, 1, 1, 1, 1, 1,
0.936984, 0.1852991, 1.871528, 1, 1, 1, 1, 1,
0.9410365, -1.29244, 0.2923459, 1, 1, 1, 1, 1,
0.9443856, -1.047065, 2.020925, 1, 1, 1, 1, 1,
0.9444754, -1.804533, 3.848832, 1, 1, 1, 1, 1,
0.9478153, 0.2882781, 0.1394863, 1, 1, 1, 1, 1,
0.9481559, 0.9350935, 1.577706, 1, 1, 1, 1, 1,
0.9527435, -0.06809953, 2.685525, 1, 1, 1, 1, 1,
0.9529144, -1.051238, 1.229574, 1, 1, 1, 1, 1,
0.9557171, 0.1954114, 1.123858, 1, 1, 1, 1, 1,
0.9564625, 1.165497, 0.4786979, 1, 1, 1, 1, 1,
0.9570065, 0.2743201, -0.09831146, 1, 1, 1, 1, 1,
0.9570175, -0.3361098, 2.986388, 0, 0, 1, 1, 1,
0.9576924, 1.136105, 0.3797307, 1, 0, 0, 1, 1,
0.9591723, -1.829254, 3.171784, 1, 0, 0, 1, 1,
0.9728281, 0.7322299, 1.383641, 1, 0, 0, 1, 1,
0.9807979, -0.2627254, 1.277294, 1, 0, 0, 1, 1,
0.9828864, -0.5252261, 4.788953, 1, 0, 0, 1, 1,
0.9837162, -1.011316, 3.345803, 0, 0, 0, 1, 1,
0.986776, -1.570718, 2.880136, 0, 0, 0, 1, 1,
0.989742, 0.7232648, 0.2502411, 0, 0, 0, 1, 1,
0.9989129, -0.6211948, 1.229952, 0, 0, 0, 1, 1,
0.9997857, 0.3884598, 0.635393, 0, 0, 0, 1, 1,
1.000357, 1.206554, 0.121657, 0, 0, 0, 1, 1,
1.001953, -0.6089758, 3.322834, 0, 0, 0, 1, 1,
1.002856, -0.8385936, 2.142285, 1, 1, 1, 1, 1,
1.003655, 0.2908561, 1.407253, 1, 1, 1, 1, 1,
1.015796, 2.729286, 0.587171, 1, 1, 1, 1, 1,
1.017185, 0.335342, 0.9006124, 1, 1, 1, 1, 1,
1.020826, 0.4214948, 1.681758, 1, 1, 1, 1, 1,
1.024611, 1.103268, -0.2971112, 1, 1, 1, 1, 1,
1.025548, -0.1831492, 1.961434, 1, 1, 1, 1, 1,
1.03259, 1.450243, 2.252338, 1, 1, 1, 1, 1,
1.034007, 0.3814698, 0.5315211, 1, 1, 1, 1, 1,
1.043129, 0.2043622, -0.2826088, 1, 1, 1, 1, 1,
1.047272, -1.168665, 2.098861, 1, 1, 1, 1, 1,
1.051723, 0.2563192, 1.331481, 1, 1, 1, 1, 1,
1.053843, -0.9846451, 2.020104, 1, 1, 1, 1, 1,
1.054038, 1.524932, 0.6689698, 1, 1, 1, 1, 1,
1.065549, -0.3295158, 0.1430344, 1, 1, 1, 1, 1,
1.068365, 0.9399542, 2.830748, 0, 0, 1, 1, 1,
1.068965, -0.3888514, 3.656415, 1, 0, 0, 1, 1,
1.070154, -1.131569, 0.8722494, 1, 0, 0, 1, 1,
1.073038, 0.2540587, 0.4150897, 1, 0, 0, 1, 1,
1.078131, 1.4965, 0.973843, 1, 0, 0, 1, 1,
1.088665, -0.6856314, 3.594664, 1, 0, 0, 1, 1,
1.090507, 0.8869865, 0.1884041, 0, 0, 0, 1, 1,
1.099071, 0.5897952, 2.222386, 0, 0, 0, 1, 1,
1.101213, -1.263028, 3.541864, 0, 0, 0, 1, 1,
1.102101, -0.5658694, 2.946014, 0, 0, 0, 1, 1,
1.103397, 0.3522876, 1.256632, 0, 0, 0, 1, 1,
1.116843, -0.7459106, 1.44022, 0, 0, 0, 1, 1,
1.12323, 0.5595809, 1.899716, 0, 0, 0, 1, 1,
1.12541, 1.761282, 0.3135301, 1, 1, 1, 1, 1,
1.125733, -0.3855487, 1.436692, 1, 1, 1, 1, 1,
1.130939, 0.2845725, -0.1801732, 1, 1, 1, 1, 1,
1.131248, -0.6310351, 0.2435553, 1, 1, 1, 1, 1,
1.132033, -2.135633, 1.117832, 1, 1, 1, 1, 1,
1.134675, 0.1330336, 1.932858, 1, 1, 1, 1, 1,
1.138683, -0.7892848, 1.71009, 1, 1, 1, 1, 1,
1.143308, -0.1129707, 1.384017, 1, 1, 1, 1, 1,
1.15578, -0.5085325, 1.688952, 1, 1, 1, 1, 1,
1.157149, -0.2707483, 2.661638, 1, 1, 1, 1, 1,
1.15745, 1.553432, -1.186069, 1, 1, 1, 1, 1,
1.164179, 1.263256, -0.06265174, 1, 1, 1, 1, 1,
1.169354, -1.18637, 2.226788, 1, 1, 1, 1, 1,
1.175954, -1.798926, 2.083652, 1, 1, 1, 1, 1,
1.180554, -0.8683495, 3.32217, 1, 1, 1, 1, 1,
1.184546, 0.8632745, 1.139327, 0, 0, 1, 1, 1,
1.196435, 1.801694, 2.628974, 1, 0, 0, 1, 1,
1.202757, -0.511418, 3.317173, 1, 0, 0, 1, 1,
1.204853, 0.3483541, 2.042047, 1, 0, 0, 1, 1,
1.209836, -0.1329392, 2.190897, 1, 0, 0, 1, 1,
1.217076, -2.050096, 1.392927, 1, 0, 0, 1, 1,
1.21876, -0.5282652, 2.204669, 0, 0, 0, 1, 1,
1.218934, 0.6815147, -0.6669759, 0, 0, 0, 1, 1,
1.229976, 2.553544, 0.8571522, 0, 0, 0, 1, 1,
1.239197, -0.1436021, 2.399963, 0, 0, 0, 1, 1,
1.241232, -0.3351559, 0.273346, 0, 0, 0, 1, 1,
1.243076, -0.2654147, 1.675793, 0, 0, 0, 1, 1,
1.244074, 1.449502, 1.40866, 0, 0, 0, 1, 1,
1.249844, -0.9174576, 0.8627454, 1, 1, 1, 1, 1,
1.250409, 0.9352578, 1.933598, 1, 1, 1, 1, 1,
1.252815, -0.1681249, 1.027947, 1, 1, 1, 1, 1,
1.254164, -1.574376, 1.877193, 1, 1, 1, 1, 1,
1.254622, -0.6928534, -0.1387078, 1, 1, 1, 1, 1,
1.271906, 0.4422145, 1.344023, 1, 1, 1, 1, 1,
1.288729, -0.3321837, 2.044122, 1, 1, 1, 1, 1,
1.294093, 0.03810662, 0.8055351, 1, 1, 1, 1, 1,
1.305126, 0.1222481, 0.6761413, 1, 1, 1, 1, 1,
1.312408, -1.014886, 2.678583, 1, 1, 1, 1, 1,
1.317974, 0.04390927, 1.349866, 1, 1, 1, 1, 1,
1.326397, -1.38562, 4.256717, 1, 1, 1, 1, 1,
1.334973, 0.297984, 3.181015, 1, 1, 1, 1, 1,
1.346961, 0.5141308, 0.8170407, 1, 1, 1, 1, 1,
1.355929, -1.009235, 1.17118, 1, 1, 1, 1, 1,
1.366842, 0.2604214, 1.556911, 0, 0, 1, 1, 1,
1.369526, 0.6237487, 1.152769, 1, 0, 0, 1, 1,
1.370911, -2.355558, 2.658294, 1, 0, 0, 1, 1,
1.374957, 0.555755, 1.154847, 1, 0, 0, 1, 1,
1.381105, -0.1447239, 1.531951, 1, 0, 0, 1, 1,
1.384229, 0.3347071, 1.580855, 1, 0, 0, 1, 1,
1.393937, 0.1888531, 3.601243, 0, 0, 0, 1, 1,
1.406319, -0.238408, 0.9505006, 0, 0, 0, 1, 1,
1.40792, 0.9461113, -0.457395, 0, 0, 0, 1, 1,
1.410478, 0.3605576, 0.6219357, 0, 0, 0, 1, 1,
1.415846, 1.780638, 0.1033202, 0, 0, 0, 1, 1,
1.420047, -0.5174197, 1.773544, 0, 0, 0, 1, 1,
1.423861, 1.12737, 1.488007, 0, 0, 0, 1, 1,
1.426811, 0.6373698, 2.115292, 1, 1, 1, 1, 1,
1.426978, -0.7600763, 0.6839318, 1, 1, 1, 1, 1,
1.434497, 1.228645, 0.8383032, 1, 1, 1, 1, 1,
1.436483, 0.5768066, 1.829337, 1, 1, 1, 1, 1,
1.439205, -0.462241, 1.5568, 1, 1, 1, 1, 1,
1.439702, 0.7634445, 1.066565, 1, 1, 1, 1, 1,
1.446315, 0.06887119, 1.430894, 1, 1, 1, 1, 1,
1.45769, -1.219014, 0.9454864, 1, 1, 1, 1, 1,
1.458399, -0.3782439, 0.9662842, 1, 1, 1, 1, 1,
1.459215, -2.12516, 0.869001, 1, 1, 1, 1, 1,
1.459456, -0.0163797, 1.050801, 1, 1, 1, 1, 1,
1.462039, -0.1332889, 0.6723093, 1, 1, 1, 1, 1,
1.476858, -0.09544379, 0.9806818, 1, 1, 1, 1, 1,
1.495442, 0.7973696, 1.912501, 1, 1, 1, 1, 1,
1.498602, -0.6199244, 1.114996, 1, 1, 1, 1, 1,
1.499726, -0.7101348, 0.01645533, 0, 0, 1, 1, 1,
1.501336, 0.9477983, 0.7846652, 1, 0, 0, 1, 1,
1.514685, 0.8957435, 0.9196899, 1, 0, 0, 1, 1,
1.530204, -0.4002987, 1.725404, 1, 0, 0, 1, 1,
1.532797, 0.5206193, 1.155484, 1, 0, 0, 1, 1,
1.547978, -0.3413829, 0.07719541, 1, 0, 0, 1, 1,
1.553034, 0.9464315, 0.799702, 0, 0, 0, 1, 1,
1.585207, -0.8289474, 1.677268, 0, 0, 0, 1, 1,
1.585345, 0.4920782, 1.728122, 0, 0, 0, 1, 1,
1.593569, -0.4140251, 0.4273261, 0, 0, 0, 1, 1,
1.594221, 1.95991, -0.4238198, 0, 0, 0, 1, 1,
1.59456, 1.088031, 0.5125122, 0, 0, 0, 1, 1,
1.606017, -1.04737, 2.694618, 0, 0, 0, 1, 1,
1.606953, 0.5644443, 2.343949, 1, 1, 1, 1, 1,
1.614201, 0.3556604, 1.814422, 1, 1, 1, 1, 1,
1.615271, -0.2172347, 1.285398, 1, 1, 1, 1, 1,
1.623085, 1.922456, 1.191076, 1, 1, 1, 1, 1,
1.624723, 1.599023, 1.386077, 1, 1, 1, 1, 1,
1.625388, 0.7260947, -1.07252, 1, 1, 1, 1, 1,
1.628536, 0.6510465, -0.4620339, 1, 1, 1, 1, 1,
1.629312, 1.879561, 0.3044761, 1, 1, 1, 1, 1,
1.642816, -0.03826774, 0.1905715, 1, 1, 1, 1, 1,
1.653025, -0.5585499, 2.006682, 1, 1, 1, 1, 1,
1.655089, 1.023424, 0.3965628, 1, 1, 1, 1, 1,
1.655866, -1.306739, 2.007147, 1, 1, 1, 1, 1,
1.6623, -0.2661372, 1.132819, 1, 1, 1, 1, 1,
1.66357, -1.789171, 2.698979, 1, 1, 1, 1, 1,
1.667637, 0.9126108, -0.3202213, 1, 1, 1, 1, 1,
1.692412, 1.530667, 1.083524, 0, 0, 1, 1, 1,
1.693795, -2.819734, 1.365462, 1, 0, 0, 1, 1,
1.719318, -0.7508773, 1.782455, 1, 0, 0, 1, 1,
1.722246, -1.197176, 2.541246, 1, 0, 0, 1, 1,
1.725162, -0.3292727, 3.259835, 1, 0, 0, 1, 1,
1.729213, -0.6502317, 0.7949919, 1, 0, 0, 1, 1,
1.7313, -0.6849337, 3.213242, 0, 0, 0, 1, 1,
1.765348, 0.6121702, 1.034673, 0, 0, 0, 1, 1,
1.768545, 1.208841, 0.8485076, 0, 0, 0, 1, 1,
1.769489, -1.346471, 3.74877, 0, 0, 0, 1, 1,
1.798709, 0.9011511, 1.34157, 0, 0, 0, 1, 1,
1.810909, -1.168209, 1.327443, 0, 0, 0, 1, 1,
1.830579, -0.09832948, 1.193764, 0, 0, 0, 1, 1,
1.852888, -0.9910088, 1.345784, 1, 1, 1, 1, 1,
1.873006, 1.494154, 0.6047772, 1, 1, 1, 1, 1,
1.877704, 1.543764, 0.6699312, 1, 1, 1, 1, 1,
1.896487, 0.5511747, 2.839819, 1, 1, 1, 1, 1,
1.911169, -0.08476763, 1.360923, 1, 1, 1, 1, 1,
1.924651, -0.5658153, 1.301405, 1, 1, 1, 1, 1,
1.935306, -0.9760665, 2.238067, 1, 1, 1, 1, 1,
1.936018, -0.7437261, 1.794602, 1, 1, 1, 1, 1,
1.940552, -0.3264066, -0.5813631, 1, 1, 1, 1, 1,
1.961859, 0.9707153, 1.056715, 1, 1, 1, 1, 1,
1.965764, 0.6918276, 0.9864451, 1, 1, 1, 1, 1,
1.971597, -1.2708, 3.211622, 1, 1, 1, 1, 1,
1.972469, -0.98468, 1.887412, 1, 1, 1, 1, 1,
1.983142, -0.5431986, 2.168061, 1, 1, 1, 1, 1,
1.995012, -0.2830307, 1.049514, 1, 1, 1, 1, 1,
1.996922, 1.980318, 0.99597, 0, 0, 1, 1, 1,
2.004293, 0.2532657, 3.356312, 1, 0, 0, 1, 1,
2.022304, -1.139121, -0.1495747, 1, 0, 0, 1, 1,
2.033166, -0.5734102, 2.501967, 1, 0, 0, 1, 1,
2.098161, 0.6653271, 2.050774, 1, 0, 0, 1, 1,
2.119956, 0.8438939, 0.2241109, 1, 0, 0, 1, 1,
2.133732, -0.871039, 2.586432, 0, 0, 0, 1, 1,
2.15964, 1.280525, 1.405484, 0, 0, 0, 1, 1,
2.198428, -1.280324, 0.185127, 0, 0, 0, 1, 1,
2.238439, 0.0762472, 3.761183, 0, 0, 0, 1, 1,
2.265963, 0.0728818, 0.6941056, 0, 0, 0, 1, 1,
2.275307, 0.5957972, 0.2782282, 0, 0, 0, 1, 1,
2.287282, -2.204643, 3.800838, 0, 0, 0, 1, 1,
2.385749, 0.6342433, 1.759799, 1, 1, 1, 1, 1,
2.392301, -0.2333541, -0.6455762, 1, 1, 1, 1, 1,
2.529251, -1.007208, 1.078964, 1, 1, 1, 1, 1,
2.641565, 0.5211629, 0.831396, 1, 1, 1, 1, 1,
2.746627, 1.019117, 1.06906, 1, 1, 1, 1, 1,
2.81979, 0.5839546, 0.1798002, 1, 1, 1, 1, 1,
3.511294, 1.84804, -0.2032395, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.773222;
var distance = 34.32803;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1036394, -0.2703246, -0.01140022 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32803);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
