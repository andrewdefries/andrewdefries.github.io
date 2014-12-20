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
-3.64707, -0.2415852, -1.477057, 1, 0, 0, 1,
-3.266394, 0.7889286, -0.8429751, 1, 0.007843138, 0, 1,
-2.925446, -0.2592935, -2.414689, 1, 0.01176471, 0, 1,
-2.8792, -1.768754, -1.873754, 1, 0.01960784, 0, 1,
-2.787789, -1.525458, -1.057022, 1, 0.02352941, 0, 1,
-2.726924, -0.2686997, -1.20737, 1, 0.03137255, 0, 1,
-2.683815, -1.267748, -1.209632, 1, 0.03529412, 0, 1,
-2.677638, -0.5614684, -3.243393, 1, 0.04313726, 0, 1,
-2.67731, 1.304648, -1.394689, 1, 0.04705882, 0, 1,
-2.311772, -0.6464878, -2.753257, 1, 0.05490196, 0, 1,
-2.304046, -0.7054022, -3.204844, 1, 0.05882353, 0, 1,
-2.304027, -1.800472, -3.604788, 1, 0.06666667, 0, 1,
-2.179635, -0.6787511, 0.7332404, 1, 0.07058824, 0, 1,
-2.179317, -0.3340653, -1.943113, 1, 0.07843138, 0, 1,
-2.172029, 0.6714588, -1.266046, 1, 0.08235294, 0, 1,
-2.166907, -0.2558455, -0.974524, 1, 0.09019608, 0, 1,
-2.142263, -1.079363, -0.7430941, 1, 0.09411765, 0, 1,
-2.138896, -1.773106, -0.6413429, 1, 0.1019608, 0, 1,
-2.121932, 0.4401538, -0.336214, 1, 0.1098039, 0, 1,
-2.092773, 0.6650097, -1.624815, 1, 0.1137255, 0, 1,
-2.081776, 0.2636552, -0.6397808, 1, 0.1215686, 0, 1,
-2.06913, 0.6681142, -0.5836466, 1, 0.1254902, 0, 1,
-2.039724, -0.3642806, -3.18611, 1, 0.1333333, 0, 1,
-2.014142, -0.855863, -1.622196, 1, 0.1372549, 0, 1,
-2.010167, -0.6986134, -1.016903, 1, 0.145098, 0, 1,
-1.985814, -0.6333333, -3.1213, 1, 0.1490196, 0, 1,
-1.985533, -1.197163, -2.732554, 1, 0.1568628, 0, 1,
-1.97381, -1.813025, -2.422804, 1, 0.1607843, 0, 1,
-1.968729, 0.2387377, -1.364139, 1, 0.1686275, 0, 1,
-1.9597, 0.2452468, 0.3837655, 1, 0.172549, 0, 1,
-1.95055, 0.9011005, 0.3805745, 1, 0.1803922, 0, 1,
-1.945585, 0.2535637, -2.322241, 1, 0.1843137, 0, 1,
-1.930262, -1.032848, -1.440568, 1, 0.1921569, 0, 1,
-1.919944, -1.040861, -2.846037, 1, 0.1960784, 0, 1,
-1.909279, 0.1194471, -1.279708, 1, 0.2039216, 0, 1,
-1.86714, -0.9658862, -1.182415, 1, 0.2117647, 0, 1,
-1.856689, -1.188924, -0.1903809, 1, 0.2156863, 0, 1,
-1.843642, -1.070426, 0.04316782, 1, 0.2235294, 0, 1,
-1.81875, -0.04332611, -2.09803, 1, 0.227451, 0, 1,
-1.814549, 1.576105, -0.6460537, 1, 0.2352941, 0, 1,
-1.811482, -0.7977438, -0.5009187, 1, 0.2392157, 0, 1,
-1.801549, 0.6708181, -0.3027699, 1, 0.2470588, 0, 1,
-1.79348, -1.038068, -1.509028, 1, 0.2509804, 0, 1,
-1.772469, 0.774258, -0.5658929, 1, 0.2588235, 0, 1,
-1.759598, 0.4952252, -0.4341076, 1, 0.2627451, 0, 1,
-1.733999, 0.4990112, -2.445904, 1, 0.2705882, 0, 1,
-1.73294, 0.4310862, -0.3322125, 1, 0.2745098, 0, 1,
-1.732583, -0.5682365, -2.350174, 1, 0.282353, 0, 1,
-1.730197, 0.006850636, 0.2043879, 1, 0.2862745, 0, 1,
-1.715693, 0.6271714, -2.854128, 1, 0.2941177, 0, 1,
-1.715263, 0.03210511, -2.670224, 1, 0.3019608, 0, 1,
-1.710848, 0.3786906, -2.602436, 1, 0.3058824, 0, 1,
-1.710645, 0.3734446, -2.413984, 1, 0.3137255, 0, 1,
-1.700156, 0.3186593, -1.177782, 1, 0.3176471, 0, 1,
-1.688073, -0.5629373, -1.613945, 1, 0.3254902, 0, 1,
-1.672184, -0.6192457, -0.9600222, 1, 0.3294118, 0, 1,
-1.670727, -0.4332636, -1.406765, 1, 0.3372549, 0, 1,
-1.667715, -0.9867932, -3.104419, 1, 0.3411765, 0, 1,
-1.648237, 0.3092603, -0.8209013, 1, 0.3490196, 0, 1,
-1.632393, 0.9596002, -1.844718, 1, 0.3529412, 0, 1,
-1.616476, -1.351049, -3.00637, 1, 0.3607843, 0, 1,
-1.613169, 0.2794518, -1.687669, 1, 0.3647059, 0, 1,
-1.588694, -0.1665882, -1.491537, 1, 0.372549, 0, 1,
-1.587321, 1.281895, -0.9510779, 1, 0.3764706, 0, 1,
-1.581746, 0.2021155, 0.1835289, 1, 0.3843137, 0, 1,
-1.580665, -0.269969, -1.747104, 1, 0.3882353, 0, 1,
-1.580414, -0.9422505, -0.6858289, 1, 0.3960784, 0, 1,
-1.579312, -1.306358, -1.0821, 1, 0.4039216, 0, 1,
-1.578914, -0.3716803, -1.367277, 1, 0.4078431, 0, 1,
-1.57745, 0.4490186, -2.133588, 1, 0.4156863, 0, 1,
-1.551689, 2.302186, 1.066014, 1, 0.4196078, 0, 1,
-1.54693, 1.377519, 0.6657012, 1, 0.427451, 0, 1,
-1.545456, 0.1776852, -0.9109541, 1, 0.4313726, 0, 1,
-1.544215, 0.7854682, -1.309827, 1, 0.4392157, 0, 1,
-1.54173, -0.2776107, -2.866076, 1, 0.4431373, 0, 1,
-1.539037, -0.4083616, -2.663273, 1, 0.4509804, 0, 1,
-1.5288, -0.08473893, -0.4776341, 1, 0.454902, 0, 1,
-1.527894, 0.1371693, -1.938476, 1, 0.4627451, 0, 1,
-1.521471, -0.9697911, -2.110364, 1, 0.4666667, 0, 1,
-1.520594, 0.1758622, -2.322967, 1, 0.4745098, 0, 1,
-1.497513, -0.7411665, -2.007031, 1, 0.4784314, 0, 1,
-1.490685, -0.2394479, -2.493312, 1, 0.4862745, 0, 1,
-1.488204, 0.2776723, -2.518099, 1, 0.4901961, 0, 1,
-1.468317, 0.450433, -0.809755, 1, 0.4980392, 0, 1,
-1.451039, -0.8495546, -0.9260601, 1, 0.5058824, 0, 1,
-1.447006, 0.2533142, -2.539502, 1, 0.509804, 0, 1,
-1.442398, -0.7963997, -1.832075, 1, 0.5176471, 0, 1,
-1.441826, 0.848025, -0.3081399, 1, 0.5215687, 0, 1,
-1.43216, 0.1095165, -2.383808, 1, 0.5294118, 0, 1,
-1.430511, -0.6462663, -1.076126, 1, 0.5333334, 0, 1,
-1.429569, 0.5970148, -0.2199024, 1, 0.5411765, 0, 1,
-1.418752, 0.3518864, -2.120515, 1, 0.5450981, 0, 1,
-1.405418, 1.951128, -1.264387, 1, 0.5529412, 0, 1,
-1.402593, 0.07136977, -4.100764, 1, 0.5568628, 0, 1,
-1.400085, 1.239519, -0.6035942, 1, 0.5647059, 0, 1,
-1.393804, 0.8425012, -0.7465985, 1, 0.5686275, 0, 1,
-1.393443, -0.5577371, -0.7724128, 1, 0.5764706, 0, 1,
-1.389314, 0.703316, -2.531504, 1, 0.5803922, 0, 1,
-1.38595, 0.1470921, -0.6646736, 1, 0.5882353, 0, 1,
-1.380294, 1.017164, 0.0895893, 1, 0.5921569, 0, 1,
-1.377181, 1.121378, -1.346913, 1, 0.6, 0, 1,
-1.37501, 1.78676, 0.7611668, 1, 0.6078432, 0, 1,
-1.372258, -0.6801598, -2.553945, 1, 0.6117647, 0, 1,
-1.370448, 0.180254, -1.260714, 1, 0.6196079, 0, 1,
-1.36887, -0.03228356, -1.492197, 1, 0.6235294, 0, 1,
-1.356149, -0.2044633, -2.552273, 1, 0.6313726, 0, 1,
-1.355042, 1.218241, -0.2557292, 1, 0.6352941, 0, 1,
-1.353536, -0.8157365, -2.339774, 1, 0.6431373, 0, 1,
-1.342472, 0.7204806, -1.90167, 1, 0.6470588, 0, 1,
-1.340472, 2.150257, 0.2048657, 1, 0.654902, 0, 1,
-1.325841, -0.532776, -1.417706, 1, 0.6588235, 0, 1,
-1.321511, 0.1742302, -0.9313868, 1, 0.6666667, 0, 1,
-1.310664, 0.2247509, -0.6200967, 1, 0.6705883, 0, 1,
-1.306548, -2.00228, -1.295417, 1, 0.6784314, 0, 1,
-1.30428, -1.467999, -2.972194, 1, 0.682353, 0, 1,
-1.283228, -0.004396927, -0.4830936, 1, 0.6901961, 0, 1,
-1.267241, 0.3408849, -1.832691, 1, 0.6941177, 0, 1,
-1.266316, 0.995576, -0.5213528, 1, 0.7019608, 0, 1,
-1.261154, 1.700539, 0.4273884, 1, 0.7098039, 0, 1,
-1.255006, -0.4982205, -4.464382, 1, 0.7137255, 0, 1,
-1.243481, -0.4631192, -1.377328, 1, 0.7215686, 0, 1,
-1.240431, -1.294526, -1.306779, 1, 0.7254902, 0, 1,
-1.234881, 0.3574729, -2.695097, 1, 0.7333333, 0, 1,
-1.230108, 0.763509, -3.144905, 1, 0.7372549, 0, 1,
-1.228579, -1.120749, -2.987952, 1, 0.7450981, 0, 1,
-1.224258, -0.8477815, -1.993421, 1, 0.7490196, 0, 1,
-1.222283, 0.3603814, 0.3267977, 1, 0.7568628, 0, 1,
-1.222227, -1.061671, -1.469142, 1, 0.7607843, 0, 1,
-1.218754, -0.1145163, -1.74383, 1, 0.7686275, 0, 1,
-1.21736, -0.8702161, -0.3418787, 1, 0.772549, 0, 1,
-1.213857, 0.4954177, -2.010759, 1, 0.7803922, 0, 1,
-1.211674, 0.2497956, -2.431618, 1, 0.7843137, 0, 1,
-1.211274, -1.740877, -1.431534, 1, 0.7921569, 0, 1,
-1.208378, 0.3711502, -2.391211, 1, 0.7960784, 0, 1,
-1.207368, 0.001424931, -2.425835, 1, 0.8039216, 0, 1,
-1.192165, -1.609865, -4.442125, 1, 0.8117647, 0, 1,
-1.176278, -1.553487, -2.28984, 1, 0.8156863, 0, 1,
-1.163523, 1.348235, 0.02593691, 1, 0.8235294, 0, 1,
-1.154468, 0.1340406, -0.874915, 1, 0.827451, 0, 1,
-1.146669, -1.122247, -3.843544, 1, 0.8352941, 0, 1,
-1.14329, 0.2345571, -1.824029, 1, 0.8392157, 0, 1,
-1.139461, 1.832724, -0.8924004, 1, 0.8470588, 0, 1,
-1.128094, -1.339326, -3.354181, 1, 0.8509804, 0, 1,
-1.127345, 1.876173, -0.03741319, 1, 0.8588235, 0, 1,
-1.114586, 1.551166, -0.7695251, 1, 0.8627451, 0, 1,
-1.108404, 0.5875852, -1.666496, 1, 0.8705882, 0, 1,
-1.104625, -2.110643, -3.865523, 1, 0.8745098, 0, 1,
-1.104531, 0.7407404, -1.414973, 1, 0.8823529, 0, 1,
-1.099678, -0.6371968, -1.828047, 1, 0.8862745, 0, 1,
-1.096738, -0.6322451, -2.739393, 1, 0.8941177, 0, 1,
-1.087999, 0.1849509, -1.378916, 1, 0.8980392, 0, 1,
-1.070284, -0.6500189, -2.78439, 1, 0.9058824, 0, 1,
-1.067595, 0.6090456, -0.4340939, 1, 0.9137255, 0, 1,
-1.067054, -0.2474206, -2.763013, 1, 0.9176471, 0, 1,
-1.067016, 0.5452375, -0.3857093, 1, 0.9254902, 0, 1,
-1.064513, -0.9322182, -1.145699, 1, 0.9294118, 0, 1,
-1.063985, 1.316316, -0.7792283, 1, 0.9372549, 0, 1,
-1.060138, 0.9186602, -0.4449068, 1, 0.9411765, 0, 1,
-1.058973, 1.288352, 0.5087838, 1, 0.9490196, 0, 1,
-1.054637, -0.2413023, -2.305384, 1, 0.9529412, 0, 1,
-1.054371, -1.443368, -1.485927, 1, 0.9607843, 0, 1,
-1.05431, -1.194836, -2.964487, 1, 0.9647059, 0, 1,
-1.037516, -1.527229, -2.392113, 1, 0.972549, 0, 1,
-1.03362, -1.591278, -3.322289, 1, 0.9764706, 0, 1,
-1.029456, 0.1172785, -1.706576, 1, 0.9843137, 0, 1,
-1.025431, 1.087341, -0.6657479, 1, 0.9882353, 0, 1,
-1.025335, -1.012784, -3.326462, 1, 0.9960784, 0, 1,
-1.02157, 0.1826539, 0.03758974, 0.9960784, 1, 0, 1,
-1.013491, 1.415395, -1.078135, 0.9921569, 1, 0, 1,
-1.009151, -1.173105, -1.127394, 0.9843137, 1, 0, 1,
-1.005199, -1.046894, -3.558318, 0.9803922, 1, 0, 1,
-1.004205, 0.929931, 1.832057, 0.972549, 1, 0, 1,
-1.003945, 0.8140768, 0.1413487, 0.9686275, 1, 0, 1,
-1.001858, 0.7627697, 0.1383125, 0.9607843, 1, 0, 1,
-0.9970164, 0.8626742, -2.081936, 0.9568627, 1, 0, 1,
-0.996087, -0.09448279, -1.712087, 0.9490196, 1, 0, 1,
-0.989494, -0.5580424, -1.657306, 0.945098, 1, 0, 1,
-0.9845793, 0.7495297, 0.5969951, 0.9372549, 1, 0, 1,
-0.9829036, 1.095072, -0.7670066, 0.9333333, 1, 0, 1,
-0.980063, 0.9868265, 0.9210339, 0.9254902, 1, 0, 1,
-0.9795416, 1.021772, 1.153653, 0.9215686, 1, 0, 1,
-0.9792995, -0.2983828, -3.414509, 0.9137255, 1, 0, 1,
-0.9773418, 0.2877969, 0.05442795, 0.9098039, 1, 0, 1,
-0.9770809, 0.1832094, -1.220118, 0.9019608, 1, 0, 1,
-0.9754878, -2.311794, -2.144717, 0.8941177, 1, 0, 1,
-0.9678616, -1.015708, -2.555148, 0.8901961, 1, 0, 1,
-0.9633808, 1.453843, 0.1458097, 0.8823529, 1, 0, 1,
-0.9471282, -0.1920533, -2.590584, 0.8784314, 1, 0, 1,
-0.9450422, -1.492182, -1.710803, 0.8705882, 1, 0, 1,
-0.9435776, 0.3085709, -1.646657, 0.8666667, 1, 0, 1,
-0.9426662, 1.357455, 0.7488801, 0.8588235, 1, 0, 1,
-0.9336284, 0.2381723, -1.574697, 0.854902, 1, 0, 1,
-0.9248169, -1.663285, -3.508374, 0.8470588, 1, 0, 1,
-0.921939, 1.493477, -1.674055, 0.8431373, 1, 0, 1,
-0.9174501, 0.9922379, -1.246177, 0.8352941, 1, 0, 1,
-0.9142114, 0.5390822, 0.3614088, 0.8313726, 1, 0, 1,
-0.9123615, -2.294128, -2.528068, 0.8235294, 1, 0, 1,
-0.9117793, 0.82468, -0.6585262, 0.8196079, 1, 0, 1,
-0.9077085, 1.962675, -0.3526671, 0.8117647, 1, 0, 1,
-0.9063669, 2.210241, 0.9268051, 0.8078431, 1, 0, 1,
-0.9050159, 0.4574442, 0.6769369, 0.8, 1, 0, 1,
-0.9022512, -1.466771, -2.187234, 0.7921569, 1, 0, 1,
-0.8918396, -2.171517, -4.842875, 0.7882353, 1, 0, 1,
-0.8832666, -0.01882766, -0.4785275, 0.7803922, 1, 0, 1,
-0.8777663, -0.5006542, -4.423602, 0.7764706, 1, 0, 1,
-0.8748918, 0.4325437, -0.6467973, 0.7686275, 1, 0, 1,
-0.8733109, -0.5719565, -1.806525, 0.7647059, 1, 0, 1,
-0.8692496, -0.3545418, -3.308797, 0.7568628, 1, 0, 1,
-0.8614473, 1.154117, -2.010808, 0.7529412, 1, 0, 1,
-0.8583632, -0.8122996, -1.392294, 0.7450981, 1, 0, 1,
-0.8575715, 0.1384158, -1.940017, 0.7411765, 1, 0, 1,
-0.8558893, -0.2614933, -2.064281, 0.7333333, 1, 0, 1,
-0.8546205, -1.231504, -3.444336, 0.7294118, 1, 0, 1,
-0.8426971, 0.1013033, -0.6030322, 0.7215686, 1, 0, 1,
-0.8348358, 0.1409186, -0.2589518, 0.7176471, 1, 0, 1,
-0.8309743, 1.680056, 1.062547, 0.7098039, 1, 0, 1,
-0.8302991, -0.1039465, -2.079754, 0.7058824, 1, 0, 1,
-0.8247162, -0.4249529, -3.061263, 0.6980392, 1, 0, 1,
-0.8236597, -1.21411, -3.410594, 0.6901961, 1, 0, 1,
-0.818489, 0.2260142, -2.703219, 0.6862745, 1, 0, 1,
-0.8133909, -0.9593217, -3.9574, 0.6784314, 1, 0, 1,
-0.812049, 1.706436, -0.5035862, 0.6745098, 1, 0, 1,
-0.8113304, -0.7885052, -1.661144, 0.6666667, 1, 0, 1,
-0.8085914, 1.038259, -0.6972398, 0.6627451, 1, 0, 1,
-0.8049484, -1.432266, -3.531767, 0.654902, 1, 0, 1,
-0.8031587, 1.880156, -2.488688, 0.6509804, 1, 0, 1,
-0.8025263, 0.6590492, 0.3906121, 0.6431373, 1, 0, 1,
-0.8004498, -1.955786, -2.041154, 0.6392157, 1, 0, 1,
-0.7987145, 0.1345113, -2.333076, 0.6313726, 1, 0, 1,
-0.7958747, -0.8224795, -2.970108, 0.627451, 1, 0, 1,
-0.7923192, -0.08203849, -2.44046, 0.6196079, 1, 0, 1,
-0.7898168, 0.2869492, 1.709918, 0.6156863, 1, 0, 1,
-0.7858601, -1.186008, -1.042261, 0.6078432, 1, 0, 1,
-0.7849331, 0.673901, 1.887026, 0.6039216, 1, 0, 1,
-0.784431, 0.06184587, -1.307587, 0.5960785, 1, 0, 1,
-0.7732507, 0.4524591, -1.872544, 0.5882353, 1, 0, 1,
-0.7672534, 1.212672, 0.09893236, 0.5843138, 1, 0, 1,
-0.759858, 0.6999228, -0.5272501, 0.5764706, 1, 0, 1,
-0.7539786, -0.2672573, -2.001802, 0.572549, 1, 0, 1,
-0.7532652, -0.0880116, -1.212105, 0.5647059, 1, 0, 1,
-0.7521414, -2.674825, -2.50802, 0.5607843, 1, 0, 1,
-0.7521135, 0.6781968, -0.2666598, 0.5529412, 1, 0, 1,
-0.7501439, -0.2308528, -2.198579, 0.5490196, 1, 0, 1,
-0.7457089, 0.08744784, -2.330283, 0.5411765, 1, 0, 1,
-0.7366914, -0.9942812, -3.282427, 0.5372549, 1, 0, 1,
-0.7324488, -1.099688, -1.865331, 0.5294118, 1, 0, 1,
-0.7232819, 1.725725, -2.616385, 0.5254902, 1, 0, 1,
-0.7228201, -0.5260468, -1.009813, 0.5176471, 1, 0, 1,
-0.7207435, -0.2713032, -2.435187, 0.5137255, 1, 0, 1,
-0.7194154, -0.5388094, -3.35589, 0.5058824, 1, 0, 1,
-0.7156136, -0.0720155, -3.381372, 0.5019608, 1, 0, 1,
-0.7131695, -1.384825, -4.716223, 0.4941176, 1, 0, 1,
-0.7100106, -0.8635895, -3.367689, 0.4862745, 1, 0, 1,
-0.7099554, -0.2623146, -0.004399581, 0.4823529, 1, 0, 1,
-0.7082835, -1.379911, -1.2654, 0.4745098, 1, 0, 1,
-0.7042874, 0.4283551, 0.3909015, 0.4705882, 1, 0, 1,
-0.7035222, -1.567701, -2.962411, 0.4627451, 1, 0, 1,
-0.6984903, 0.7084323, -0.8783922, 0.4588235, 1, 0, 1,
-0.6952928, -0.6554695, -3.877737, 0.4509804, 1, 0, 1,
-0.6895278, 2.034525, -0.3002293, 0.4470588, 1, 0, 1,
-0.6846633, -1.036166, -3.140398, 0.4392157, 1, 0, 1,
-0.6792718, -0.09190813, -3.540916, 0.4352941, 1, 0, 1,
-0.6740031, 0.2716062, 0.09389441, 0.427451, 1, 0, 1,
-0.6720023, 0.6971377, -2.493438, 0.4235294, 1, 0, 1,
-0.6706543, -1.155066, -2.949989, 0.4156863, 1, 0, 1,
-0.6651166, 1.431339, -1.358189, 0.4117647, 1, 0, 1,
-0.6640452, 1.632264, -0.1183083, 0.4039216, 1, 0, 1,
-0.6640043, 1.113943, -1.839351, 0.3960784, 1, 0, 1,
-0.6615432, 0.6568338, -2.270192, 0.3921569, 1, 0, 1,
-0.6575787, -0.7065306, -1.29073, 0.3843137, 1, 0, 1,
-0.653299, 2.132852, -0.6674218, 0.3803922, 1, 0, 1,
-0.6529867, 1.47078, -0.1322585, 0.372549, 1, 0, 1,
-0.6506472, 1.050295, -0.2941552, 0.3686275, 1, 0, 1,
-0.6496925, 0.02212738, -2.274518, 0.3607843, 1, 0, 1,
-0.6465988, -1.417082, -1.126141, 0.3568628, 1, 0, 1,
-0.6450725, -0.4282966, -4.460567, 0.3490196, 1, 0, 1,
-0.6440198, -1.064482, -4.166952, 0.345098, 1, 0, 1,
-0.6392859, 0.4229843, -0.05634379, 0.3372549, 1, 0, 1,
-0.6368017, -0.4734468, -2.81604, 0.3333333, 1, 0, 1,
-0.6356715, 0.09732217, -0.2556853, 0.3254902, 1, 0, 1,
-0.6352631, -0.03113799, -0.8144681, 0.3215686, 1, 0, 1,
-0.6329489, 0.5374449, -2.571494, 0.3137255, 1, 0, 1,
-0.6138042, 1.875548, 0.216131, 0.3098039, 1, 0, 1,
-0.6075844, -1.935407, -1.460524, 0.3019608, 1, 0, 1,
-0.6015872, -1.121248, -2.916888, 0.2941177, 1, 0, 1,
-0.6015121, -1.180668, -1.548568, 0.2901961, 1, 0, 1,
-0.6001861, 0.9856519, -0.2174609, 0.282353, 1, 0, 1,
-0.5997005, -1.281716, -2.553433, 0.2784314, 1, 0, 1,
-0.5989359, 0.3448115, -2.400024, 0.2705882, 1, 0, 1,
-0.5983029, -0.2199202, -1.761796, 0.2666667, 1, 0, 1,
-0.5952095, 0.2179436, -0.9743024, 0.2588235, 1, 0, 1,
-0.5941851, -1.232036, -3.193036, 0.254902, 1, 0, 1,
-0.5900719, 0.3060142, -2.281004, 0.2470588, 1, 0, 1,
-0.5876835, 1.088708, 0.2812178, 0.2431373, 1, 0, 1,
-0.5850555, 0.3306924, -0.5870563, 0.2352941, 1, 0, 1,
-0.5752435, 0.01597475, 0.001382746, 0.2313726, 1, 0, 1,
-0.5659503, -1.091018, -3.405608, 0.2235294, 1, 0, 1,
-0.5612224, -1.43071, -2.425254, 0.2196078, 1, 0, 1,
-0.553035, 0.1120519, -3.307286, 0.2117647, 1, 0, 1,
-0.5523719, 2.424852, 1.034523, 0.2078431, 1, 0, 1,
-0.5487496, -0.1675417, -0.966724, 0.2, 1, 0, 1,
-0.5479802, 0.6486636, 0.8889032, 0.1921569, 1, 0, 1,
-0.5455463, 0.3647878, -0.4550124, 0.1882353, 1, 0, 1,
-0.544416, 0.5763499, 0.1806129, 0.1803922, 1, 0, 1,
-0.5432588, -0.1495376, -0.2261416, 0.1764706, 1, 0, 1,
-0.5400829, 0.9431418, 1.588523, 0.1686275, 1, 0, 1,
-0.5396807, -0.03492866, -1.29928, 0.1647059, 1, 0, 1,
-0.5337856, 0.4339342, 0.6534221, 0.1568628, 1, 0, 1,
-0.5333921, -1.731943, -3.315489, 0.1529412, 1, 0, 1,
-0.5258167, 0.5923805, -0.1855251, 0.145098, 1, 0, 1,
-0.5238532, 0.03836631, -1.26932, 0.1411765, 1, 0, 1,
-0.5214723, -1.553685, -2.942915, 0.1333333, 1, 0, 1,
-0.5203494, -1.181888, -4.283706, 0.1294118, 1, 0, 1,
-0.5187721, 0.4812524, -1.574858, 0.1215686, 1, 0, 1,
-0.5176412, -0.932526, -2.048454, 0.1176471, 1, 0, 1,
-0.5157504, 0.8819107, -1.042811, 0.1098039, 1, 0, 1,
-0.5121989, 0.9077356, -1.23654, 0.1058824, 1, 0, 1,
-0.5081707, 1.991793, -0.8145598, 0.09803922, 1, 0, 1,
-0.5067663, -1.189538, -3.439579, 0.09019608, 1, 0, 1,
-0.5033375, 0.01681411, -2.643338, 0.08627451, 1, 0, 1,
-0.5029621, 0.484414, 0.9062405, 0.07843138, 1, 0, 1,
-0.4968558, 0.2658947, 0.6095027, 0.07450981, 1, 0, 1,
-0.4956365, -0.9401265, -2.117862, 0.06666667, 1, 0, 1,
-0.4937454, -1.009681, -2.701546, 0.0627451, 1, 0, 1,
-0.4933226, -1.340322, -3.32942, 0.05490196, 1, 0, 1,
-0.4919857, 0.5364411, -0.1521121, 0.05098039, 1, 0, 1,
-0.4916688, -0.6922673, -3.282772, 0.04313726, 1, 0, 1,
-0.487444, -0.1664486, -2.484836, 0.03921569, 1, 0, 1,
-0.4863173, -0.8003097, -2.984867, 0.03137255, 1, 0, 1,
-0.4863113, 0.1299549, -1.483636, 0.02745098, 1, 0, 1,
-0.4812915, 0.4000021, 0.7395442, 0.01960784, 1, 0, 1,
-0.4809698, 0.2109073, -0.703994, 0.01568628, 1, 0, 1,
-0.4778848, -1.256877, -2.597326, 0.007843138, 1, 0, 1,
-0.4772615, 2.52287, 1.421451, 0.003921569, 1, 0, 1,
-0.4754508, -0.7737197, -1.188943, 0, 1, 0.003921569, 1,
-0.4737308, -0.8813479, -1.191454, 0, 1, 0.01176471, 1,
-0.4736812, 1.295944, -0.9184294, 0, 1, 0.01568628, 1,
-0.4677019, -1.64555, -2.699243, 0, 1, 0.02352941, 1,
-0.4659238, 0.1694396, -2.864071, 0, 1, 0.02745098, 1,
-0.4659203, -0.7556978, -3.615319, 0, 1, 0.03529412, 1,
-0.4639973, -0.6827111, -2.23175, 0, 1, 0.03921569, 1,
-0.462377, -0.9517046, -3.246876, 0, 1, 0.04705882, 1,
-0.4619182, -0.7264107, -2.410983, 0, 1, 0.05098039, 1,
-0.4615442, -0.344465, -3.20022, 0, 1, 0.05882353, 1,
-0.4488177, -1.050377, -2.046097, 0, 1, 0.0627451, 1,
-0.4486423, 2.416698, 0.3899325, 0, 1, 0.07058824, 1,
-0.4483229, -0.8401326, -1.93574, 0, 1, 0.07450981, 1,
-0.4478288, 1.03742, -2.320302, 0, 1, 0.08235294, 1,
-0.4371604, -1.078031, -1.631294, 0, 1, 0.08627451, 1,
-0.4365019, 0.4183387, 0.354966, 0, 1, 0.09411765, 1,
-0.4346893, -0.4365789, -3.609686, 0, 1, 0.1019608, 1,
-0.4326176, 0.1584025, -1.485661, 0, 1, 0.1058824, 1,
-0.4243795, 1.304256, -0.1153611, 0, 1, 0.1137255, 1,
-0.4228703, -0.9043806, -4.047178, 0, 1, 0.1176471, 1,
-0.4205918, -0.4142726, -2.804562, 0, 1, 0.1254902, 1,
-0.419985, 0.9486453, 1.400411, 0, 1, 0.1294118, 1,
-0.419928, 1.754107, -0.6315826, 0, 1, 0.1372549, 1,
-0.4196662, -0.2963353, -2.515044, 0, 1, 0.1411765, 1,
-0.4104626, 1.992201, -0.3981328, 0, 1, 0.1490196, 1,
-0.3960835, -0.9857484, -3.846787, 0, 1, 0.1529412, 1,
-0.3943876, -2.821076, -3.228357, 0, 1, 0.1607843, 1,
-0.3922741, 0.1588388, -0.7376752, 0, 1, 0.1647059, 1,
-0.3901786, -1.938036, -1.669596, 0, 1, 0.172549, 1,
-0.3883582, 0.1029124, 0.491246, 0, 1, 0.1764706, 1,
-0.3868219, 1.098638, -0.3458855, 0, 1, 0.1843137, 1,
-0.3736232, 0.6962482, -0.4812383, 0, 1, 0.1882353, 1,
-0.3709247, 2.910954, 1.152554, 0, 1, 0.1960784, 1,
-0.3674233, -0.2304834, -1.219183, 0, 1, 0.2039216, 1,
-0.3673607, 0.3569795, -1.708834, 0, 1, 0.2078431, 1,
-0.3670249, -1.439992, -2.456857, 0, 1, 0.2156863, 1,
-0.3649065, -0.6179464, -2.829327, 0, 1, 0.2196078, 1,
-0.3558397, -0.229751, -0.9277594, 0, 1, 0.227451, 1,
-0.3542591, 0.01515513, -2.175038, 0, 1, 0.2313726, 1,
-0.3522005, -0.02137461, -1.49794, 0, 1, 0.2392157, 1,
-0.3521475, 1.068411, -1.723213, 0, 1, 0.2431373, 1,
-0.3498186, 0.7051637, -0.2731692, 0, 1, 0.2509804, 1,
-0.3482566, -1.098484, -2.52156, 0, 1, 0.254902, 1,
-0.3472998, 0.971917, 0.2452886, 0, 1, 0.2627451, 1,
-0.3460436, 0.9564512, 0.2049744, 0, 1, 0.2666667, 1,
-0.3358116, -1.701813, -3.758388, 0, 1, 0.2745098, 1,
-0.3313376, 0.5005912, -1.055846, 0, 1, 0.2784314, 1,
-0.3311208, 2.10433, -0.5564438, 0, 1, 0.2862745, 1,
-0.3308516, -0.4757927, -2.080378, 0, 1, 0.2901961, 1,
-0.330789, -1.188292, -1.410469, 0, 1, 0.2980392, 1,
-0.3255331, 0.1714176, -2.767497, 0, 1, 0.3058824, 1,
-0.3223417, 0.5672561, -1.715775, 0, 1, 0.3098039, 1,
-0.3148533, 0.270605, -1.930092, 0, 1, 0.3176471, 1,
-0.3106342, -1.45186, -2.405346, 0, 1, 0.3215686, 1,
-0.3098271, -0.8255266, -2.694648, 0, 1, 0.3294118, 1,
-0.3010729, 0.9203181, -2.160289, 0, 1, 0.3333333, 1,
-0.3001772, -1.296576, -1.126779, 0, 1, 0.3411765, 1,
-0.2994392, 1.076749, -2.461347, 0, 1, 0.345098, 1,
-0.2983415, 0.2790937, -1.259823, 0, 1, 0.3529412, 1,
-0.2968645, -1.110217, -3.673976, 0, 1, 0.3568628, 1,
-0.2915685, -0.2309749, -2.894867, 0, 1, 0.3647059, 1,
-0.2909297, 0.03520808, -1.698049, 0, 1, 0.3686275, 1,
-0.290878, 0.1279691, -0.7584673, 0, 1, 0.3764706, 1,
-0.2902239, -0.6946483, -0.2401431, 0, 1, 0.3803922, 1,
-0.2884575, -0.545471, -5.043623, 0, 1, 0.3882353, 1,
-0.2818116, 1.712944, 0.1210917, 0, 1, 0.3921569, 1,
-0.2785387, 1.423127, 0.2640841, 0, 1, 0.4, 1,
-0.2769993, -0.7097427, -4.074041, 0, 1, 0.4078431, 1,
-0.2735981, 1.394758, -0.2889057, 0, 1, 0.4117647, 1,
-0.2677137, 0.6164752, 0.5571644, 0, 1, 0.4196078, 1,
-0.2650985, 0.3080798, 1.420621, 0, 1, 0.4235294, 1,
-0.2623499, -0.6986786, -3.545836, 0, 1, 0.4313726, 1,
-0.2613926, 1.172113, -0.8425086, 0, 1, 0.4352941, 1,
-0.2601705, -1.382429, -3.544502, 0, 1, 0.4431373, 1,
-0.2598848, -0.5043503, -2.663297, 0, 1, 0.4470588, 1,
-0.2597963, 0.1549595, -2.245462, 0, 1, 0.454902, 1,
-0.2536103, -1.061686, -3.785189, 0, 1, 0.4588235, 1,
-0.2513271, 0.9851089, 0.7192371, 0, 1, 0.4666667, 1,
-0.2483452, -0.1513542, -2.904615, 0, 1, 0.4705882, 1,
-0.2475746, -0.4256169, -0.940194, 0, 1, 0.4784314, 1,
-0.2388753, 1.216966, -1.094164, 0, 1, 0.4823529, 1,
-0.2373834, -0.04235846, -1.067349, 0, 1, 0.4901961, 1,
-0.2350321, 0.1422168, -1.209794, 0, 1, 0.4941176, 1,
-0.2333025, 1.915663, -0.244978, 0, 1, 0.5019608, 1,
-0.2283971, 0.1511046, -2.55406, 0, 1, 0.509804, 1,
-0.2281926, -0.639882, -2.464143, 0, 1, 0.5137255, 1,
-0.2232316, -1.581355, -4.929255, 0, 1, 0.5215687, 1,
-0.2225842, -0.3311653, -4.665479, 0, 1, 0.5254902, 1,
-0.2218296, -2.00691, -1.714963, 0, 1, 0.5333334, 1,
-0.2218292, 1.238697, 0.501931, 0, 1, 0.5372549, 1,
-0.2212675, 0.3043884, -1.990238, 0, 1, 0.5450981, 1,
-0.2196711, 0.5118352, -0.04172132, 0, 1, 0.5490196, 1,
-0.218569, -0.5792994, -2.799089, 0, 1, 0.5568628, 1,
-0.2162633, -0.2732031, -1.107167, 0, 1, 0.5607843, 1,
-0.2123682, 0.4204479, -1.701757, 0, 1, 0.5686275, 1,
-0.2101979, -1.566857, -2.586222, 0, 1, 0.572549, 1,
-0.2044847, 0.8608883, 2.876656, 0, 1, 0.5803922, 1,
-0.2020376, 1.577174, -1.594532, 0, 1, 0.5843138, 1,
-0.196969, -0.5373675, -3.692653, 0, 1, 0.5921569, 1,
-0.1950191, 0.3930405, -1.013837, 0, 1, 0.5960785, 1,
-0.1944729, 0.1077588, -1.436426, 0, 1, 0.6039216, 1,
-0.1897316, -1.035556, -2.349039, 0, 1, 0.6117647, 1,
-0.1853486, 0.5001607, -1.455768, 0, 1, 0.6156863, 1,
-0.1824205, 0.7185627, -2.523273, 0, 1, 0.6235294, 1,
-0.1772411, 0.1556958, 0.1422433, 0, 1, 0.627451, 1,
-0.1756312, -0.8624132, -2.793343, 0, 1, 0.6352941, 1,
-0.1710768, 0.135344, -1.532517, 0, 1, 0.6392157, 1,
-0.1697059, 0.7117499, -0.4360356, 0, 1, 0.6470588, 1,
-0.1688408, 0.8125007, 0.5848988, 0, 1, 0.6509804, 1,
-0.1628819, 0.6027408, 0.3338098, 0, 1, 0.6588235, 1,
-0.1590542, -0.6209321, -2.496635, 0, 1, 0.6627451, 1,
-0.1586042, -0.3072175, -2.045706, 0, 1, 0.6705883, 1,
-0.1584317, -0.1238651, -2.114864, 0, 1, 0.6745098, 1,
-0.15783, -0.741388, -4.184447, 0, 1, 0.682353, 1,
-0.1558867, -1.117473, -4.624491, 0, 1, 0.6862745, 1,
-0.1508482, 2.553102, 0.763952, 0, 1, 0.6941177, 1,
-0.1507235, 1.033207, 1.374192, 0, 1, 0.7019608, 1,
-0.150706, 0.2251864, 0.4870234, 0, 1, 0.7058824, 1,
-0.1482343, -0.8874048, -1.801616, 0, 1, 0.7137255, 1,
-0.1440641, -0.863807, -3.863337, 0, 1, 0.7176471, 1,
-0.1397185, 0.7086884, -0.5927436, 0, 1, 0.7254902, 1,
-0.1393277, -0.8159862, -2.267709, 0, 1, 0.7294118, 1,
-0.1381208, -0.2299901, -3.275306, 0, 1, 0.7372549, 1,
-0.1378082, 0.669662, 0.1122102, 0, 1, 0.7411765, 1,
-0.1360955, -0.2576864, -3.174527, 0, 1, 0.7490196, 1,
-0.1323439, 1.339808, -0.1298412, 0, 1, 0.7529412, 1,
-0.1307441, 0.1901173, 0.675006, 0, 1, 0.7607843, 1,
-0.1280444, -1.183943, -3.263663, 0, 1, 0.7647059, 1,
-0.1252357, -0.8386257, -3.669608, 0, 1, 0.772549, 1,
-0.1248454, -1.631987, -3.249603, 0, 1, 0.7764706, 1,
-0.119774, 0.3558838, -1.145489, 0, 1, 0.7843137, 1,
-0.1189848, 0.2083516, 0.4306213, 0, 1, 0.7882353, 1,
-0.1188194, -1.627638, -1.780659, 0, 1, 0.7960784, 1,
-0.1187482, 1.656717, 0.9839442, 0, 1, 0.8039216, 1,
-0.1182943, 0.377235, -2.787592, 0, 1, 0.8078431, 1,
-0.1170385, 0.02961031, -4.323463, 0, 1, 0.8156863, 1,
-0.1123715, -0.4847139, -0.8875654, 0, 1, 0.8196079, 1,
-0.1120055, -0.4099529, -2.137149, 0, 1, 0.827451, 1,
-0.1096451, 2.014307, 1.588425, 0, 1, 0.8313726, 1,
-0.09995522, -1.248822, -3.445168, 0, 1, 0.8392157, 1,
-0.09856463, 1.308925, -0.1294839, 0, 1, 0.8431373, 1,
-0.09816239, -0.5440009, -3.342662, 0, 1, 0.8509804, 1,
-0.09480085, -0.7976441, -2.324167, 0, 1, 0.854902, 1,
-0.09258843, -1.11228, -3.864746, 0, 1, 0.8627451, 1,
-0.08846986, 1.942523, -0.4235801, 0, 1, 0.8666667, 1,
-0.08520547, 0.4217466, 0.1353714, 0, 1, 0.8745098, 1,
-0.0842756, 0.4369755, -0.9605423, 0, 1, 0.8784314, 1,
-0.08200502, -0.2406319, -2.64921, 0, 1, 0.8862745, 1,
-0.06942052, 0.3826322, -0.1917343, 0, 1, 0.8901961, 1,
-0.06351501, -0.106199, -1.831796, 0, 1, 0.8980392, 1,
-0.05749103, 1.053817, 0.7076064, 0, 1, 0.9058824, 1,
-0.05138772, 1.427429, -0.4959058, 0, 1, 0.9098039, 1,
-0.05115667, 0.1897089, -0.2081988, 0, 1, 0.9176471, 1,
-0.04915934, -2.214009, -3.278075, 0, 1, 0.9215686, 1,
-0.04819853, -0.4337095, -3.302151, 0, 1, 0.9294118, 1,
-0.04311872, -0.0947542, -2.415241, 0, 1, 0.9333333, 1,
-0.04216937, -0.8205618, -4.111064, 0, 1, 0.9411765, 1,
-0.04125816, -1.340872, -3.582375, 0, 1, 0.945098, 1,
-0.04039955, 1.811234, -1.565351, 0, 1, 0.9529412, 1,
-0.03886412, -1.205232, -3.424025, 0, 1, 0.9568627, 1,
-0.0364177, 0.7793299, -1.078038, 0, 1, 0.9647059, 1,
-0.03412357, -0.09581164, -2.956517, 0, 1, 0.9686275, 1,
-0.03394516, -1.909087, -5.754894, 0, 1, 0.9764706, 1,
-0.03141288, -0.703145, -4.708743, 0, 1, 0.9803922, 1,
-0.03011964, -1.092273, -3.497784, 0, 1, 0.9882353, 1,
-0.02781118, -0.9412193, -3.100626, 0, 1, 0.9921569, 1,
-0.02732721, -1.328433, -1.575914, 0, 1, 1, 1,
-0.02221865, -0.8314444, -5.274752, 0, 0.9921569, 1, 1,
-0.02155504, 0.4312953, -0.00464672, 0, 0.9882353, 1, 1,
-0.01985918, 0.4987089, -0.1629805, 0, 0.9803922, 1, 1,
-0.01269979, -0.5455933, -2.596815, 0, 0.9764706, 1, 1,
-0.01118337, -1.216646, -2.675849, 0, 0.9686275, 1, 1,
-0.01096382, 0.6309961, 0.8494421, 0, 0.9647059, 1, 1,
-0.005830113, -0.6596702, -2.701241, 0, 0.9568627, 1, 1,
-0.005630405, 0.2016816, 0.6029625, 0, 0.9529412, 1, 1,
-0.004501412, -1.157753, -0.4634086, 0, 0.945098, 1, 1,
0.0009215573, 0.6025813, -0.2678326, 0, 0.9411765, 1, 1,
0.001522222, -0.6772985, 2.868063, 0, 0.9333333, 1, 1,
0.00285147, -0.5101918, 5.149445, 0, 0.9294118, 1, 1,
0.006752802, -0.6047845, 2.572852, 0, 0.9215686, 1, 1,
0.006828516, -0.4845358, 4.240329, 0, 0.9176471, 1, 1,
0.00820843, -0.2563145, 3.572993, 0, 0.9098039, 1, 1,
0.01187199, -0.7476491, 2.625772, 0, 0.9058824, 1, 1,
0.0126027, -1.723522, 3.277925, 0, 0.8980392, 1, 1,
0.01275663, 0.6125509, -1.78455, 0, 0.8901961, 1, 1,
0.01439134, -0.1697228, 4.402416, 0, 0.8862745, 1, 1,
0.01752217, -1.407615, 1.624754, 0, 0.8784314, 1, 1,
0.01949332, -1.134261, 3.989272, 0, 0.8745098, 1, 1,
0.02584912, -0.0040814, 0.8997905, 0, 0.8666667, 1, 1,
0.03453172, -0.1834866, 2.308322, 0, 0.8627451, 1, 1,
0.04480005, -0.1191086, 1.540348, 0, 0.854902, 1, 1,
0.04646066, -1.203341, 3.514973, 0, 0.8509804, 1, 1,
0.05521451, -1.474992, 4.657664, 0, 0.8431373, 1, 1,
0.0555081, 0.5460253, -0.999364, 0, 0.8392157, 1, 1,
0.05785561, -0.2044808, 2.571812, 0, 0.8313726, 1, 1,
0.06205024, -0.1590013, 2.936754, 0, 0.827451, 1, 1,
0.07272436, -0.4975501, 4.127019, 0, 0.8196079, 1, 1,
0.07345387, 0.06145256, 1.315332, 0, 0.8156863, 1, 1,
0.07345629, 0.4246836, 0.7895042, 0, 0.8078431, 1, 1,
0.0746275, 0.9322786, 1.876194, 0, 0.8039216, 1, 1,
0.07712344, -0.7018939, 1.825045, 0, 0.7960784, 1, 1,
0.07744566, 0.586771, 1.226281, 0, 0.7882353, 1, 1,
0.08219891, -0.9931804, 2.468297, 0, 0.7843137, 1, 1,
0.08226547, -1.610997, 2.858433, 0, 0.7764706, 1, 1,
0.08433247, -2.968626, 4.219347, 0, 0.772549, 1, 1,
0.08482531, 0.4187909, -1.532155, 0, 0.7647059, 1, 1,
0.08531953, 0.04608794, 1.727601, 0, 0.7607843, 1, 1,
0.08651767, 1.721717, 2.239964, 0, 0.7529412, 1, 1,
0.08767575, 2.893419, 1.856551, 0, 0.7490196, 1, 1,
0.08816443, -2.695467, 4.352478, 0, 0.7411765, 1, 1,
0.08919678, -0.2812214, 2.831964, 0, 0.7372549, 1, 1,
0.09259224, -1.105237, 2.662032, 0, 0.7294118, 1, 1,
0.09312382, -0.9965668, 3.078071, 0, 0.7254902, 1, 1,
0.09934051, -0.3516017, 2.556845, 0, 0.7176471, 1, 1,
0.09960984, -0.5823205, 3.156437, 0, 0.7137255, 1, 1,
0.1001264, -1.653376, 2.996283, 0, 0.7058824, 1, 1,
0.103246, 0.3179931, 0.01343593, 0, 0.6980392, 1, 1,
0.1091722, 1.657695, -0.6354091, 0, 0.6941177, 1, 1,
0.1146486, -0.06568286, 4.091298, 0, 0.6862745, 1, 1,
0.1167551, 0.6798528, 0.4416295, 0, 0.682353, 1, 1,
0.1174785, -1.265756, 2.852062, 0, 0.6745098, 1, 1,
0.1197692, 0.3122735, 2.524028, 0, 0.6705883, 1, 1,
0.1217894, -0.07969568, 2.198163, 0, 0.6627451, 1, 1,
0.1234624, -0.3093548, 2.958241, 0, 0.6588235, 1, 1,
0.1245634, -0.7425395, 2.833748, 0, 0.6509804, 1, 1,
0.1250424, -0.6024005, 3.116416, 0, 0.6470588, 1, 1,
0.1257538, 0.986153, -0.7203857, 0, 0.6392157, 1, 1,
0.1276803, -0.6275206, 3.052374, 0, 0.6352941, 1, 1,
0.1282244, -0.5517903, 2.746682, 0, 0.627451, 1, 1,
0.1301536, -0.8877856, 3.66498, 0, 0.6235294, 1, 1,
0.1308391, 0.4712605, 0.7445455, 0, 0.6156863, 1, 1,
0.1338862, -0.4114212, 2.969549, 0, 0.6117647, 1, 1,
0.1340813, 0.0899298, 0.878808, 0, 0.6039216, 1, 1,
0.1350353, -0.1004355, 2.378981, 0, 0.5960785, 1, 1,
0.1392955, -0.09922808, 1.794862, 0, 0.5921569, 1, 1,
0.140511, 1.817751, -1.413629, 0, 0.5843138, 1, 1,
0.1438676, -0.3487552, 4.833044, 0, 0.5803922, 1, 1,
0.1453087, 0.4479289, 0.4454055, 0, 0.572549, 1, 1,
0.1467894, -0.878028, 2.854644, 0, 0.5686275, 1, 1,
0.1477473, 0.9242433, 0.2237816, 0, 0.5607843, 1, 1,
0.148884, 1.63375, -1.49365, 0, 0.5568628, 1, 1,
0.153117, 0.5714515, -0.7099293, 0, 0.5490196, 1, 1,
0.1548863, -0.4737361, 1.891116, 0, 0.5450981, 1, 1,
0.1596436, -2.096678, 3.820534, 0, 0.5372549, 1, 1,
0.166657, 0.983961, -2.230789, 0, 0.5333334, 1, 1,
0.1702485, 1.158146, -0.5190135, 0, 0.5254902, 1, 1,
0.1752677, 1.799035, -0.1642842, 0, 0.5215687, 1, 1,
0.181818, 0.5774237, 0.4016955, 0, 0.5137255, 1, 1,
0.1847395, 1.075886, 0.568541, 0, 0.509804, 1, 1,
0.1854099, -2.54997, 4.39509, 0, 0.5019608, 1, 1,
0.186382, -0.8042992, 4.531107, 0, 0.4941176, 1, 1,
0.1869123, 0.487507, -1.70959, 0, 0.4901961, 1, 1,
0.1900201, 0.3573683, -0.3616974, 0, 0.4823529, 1, 1,
0.1930795, -0.01638609, 0.9812607, 0, 0.4784314, 1, 1,
0.1940716, -0.1655013, 2.091612, 0, 0.4705882, 1, 1,
0.1968837, -0.322428, 2.300864, 0, 0.4666667, 1, 1,
0.1984497, -0.2933775, 2.179201, 0, 0.4588235, 1, 1,
0.1985325, 0.5797988, 0.5994396, 0, 0.454902, 1, 1,
0.1998412, 0.4361614, -0.14708, 0, 0.4470588, 1, 1,
0.2011558, 0.2979978, 1.636823, 0, 0.4431373, 1, 1,
0.2039519, -0.9159999, 5.142261, 0, 0.4352941, 1, 1,
0.2082524, 0.3024095, 0.79698, 0, 0.4313726, 1, 1,
0.2097964, -0.7274981, 3.682938, 0, 0.4235294, 1, 1,
0.2152856, 0.348189, -0.4807843, 0, 0.4196078, 1, 1,
0.2206004, 0.3089595, -0.8189337, 0, 0.4117647, 1, 1,
0.2259423, -0.4127972, 3.09025, 0, 0.4078431, 1, 1,
0.2305485, 1.039399, 0.4715028, 0, 0.4, 1, 1,
0.2315935, 0.7977978, -0.2237636, 0, 0.3921569, 1, 1,
0.2364053, 0.3637157, 1.299275, 0, 0.3882353, 1, 1,
0.237556, 1.018616, -0.6993406, 0, 0.3803922, 1, 1,
0.2441116, -1.561332, 2.956011, 0, 0.3764706, 1, 1,
0.2480313, 1.914252, -0.4207055, 0, 0.3686275, 1, 1,
0.2508709, -0.3877504, 0.5236899, 0, 0.3647059, 1, 1,
0.253042, 1.370965, 0.1057139, 0, 0.3568628, 1, 1,
0.2579805, -0.09608505, 3.983342, 0, 0.3529412, 1, 1,
0.2581766, -1.003778, 2.775831, 0, 0.345098, 1, 1,
0.262913, 0.878301, 0.8043389, 0, 0.3411765, 1, 1,
0.2644214, -0.1625363, 2.339307, 0, 0.3333333, 1, 1,
0.2647874, -0.8270839, 1.79543, 0, 0.3294118, 1, 1,
0.2676054, 0.05188615, 2.468051, 0, 0.3215686, 1, 1,
0.2705737, 0.4383322, 0.8817917, 0, 0.3176471, 1, 1,
0.2711373, 0.5020432, 1.003487, 0, 0.3098039, 1, 1,
0.2718553, 0.2563133, -0.2495872, 0, 0.3058824, 1, 1,
0.2771282, 1.078987, -1.278086, 0, 0.2980392, 1, 1,
0.2799249, -0.3017526, 0.6759908, 0, 0.2901961, 1, 1,
0.2903267, -0.4941621, 3.120363, 0, 0.2862745, 1, 1,
0.2924899, -0.1136234, 2.520336, 0, 0.2784314, 1, 1,
0.2993584, 1.092082, -0.03845382, 0, 0.2745098, 1, 1,
0.3050562, 0.09975007, 1.871386, 0, 0.2666667, 1, 1,
0.3064414, -1.65217, 2.370106, 0, 0.2627451, 1, 1,
0.3116721, 0.4959156, 0.333889, 0, 0.254902, 1, 1,
0.312209, 0.06781925, 1.258541, 0, 0.2509804, 1, 1,
0.3123853, 0.5725077, 0.03751347, 0, 0.2431373, 1, 1,
0.3244279, 0.07362928, 2.430275, 0, 0.2392157, 1, 1,
0.3413576, -0.9240781, 2.656031, 0, 0.2313726, 1, 1,
0.3430767, 1.025645, -1.691782, 0, 0.227451, 1, 1,
0.3450582, 1.159983, 0.9523375, 0, 0.2196078, 1, 1,
0.3473243, -0.09492712, 3.02992, 0, 0.2156863, 1, 1,
0.3522869, -1.608308, 1.707571, 0, 0.2078431, 1, 1,
0.3582287, 1.504652, 1.019304, 0, 0.2039216, 1, 1,
0.3618402, 0.4630537, 1.591928, 0, 0.1960784, 1, 1,
0.3623323, 0.1977481, 0.2422994, 0, 0.1882353, 1, 1,
0.364812, 0.4267154, 0.7883428, 0, 0.1843137, 1, 1,
0.3678702, -1.267174, 2.747938, 0, 0.1764706, 1, 1,
0.3714789, -0.8969229, 3.079655, 0, 0.172549, 1, 1,
0.3800063, 1.157933, 1.448103, 0, 0.1647059, 1, 1,
0.3823283, -0.7014273, 1.710757, 0, 0.1607843, 1, 1,
0.3858886, -1.342112, 2.438097, 0, 0.1529412, 1, 1,
0.3870359, 0.8113331, 0.3868168, 0, 0.1490196, 1, 1,
0.3899024, 0.9093528, -0.5144373, 0, 0.1411765, 1, 1,
0.3932634, 0.5921751, 1.006908, 0, 0.1372549, 1, 1,
0.4033417, -0.9605507, 3.410802, 0, 0.1294118, 1, 1,
0.4090485, 2.020828, -0.2708366, 0, 0.1254902, 1, 1,
0.4128885, 1.779251, 1.356332, 0, 0.1176471, 1, 1,
0.4152233, -1.42202, 0.8635452, 0, 0.1137255, 1, 1,
0.4191103, -1.086987, 5.286096, 0, 0.1058824, 1, 1,
0.4195028, 0.9261458, 1.130428, 0, 0.09803922, 1, 1,
0.4203057, 1.502163, 0.9001752, 0, 0.09411765, 1, 1,
0.4211667, -1.369518, 3.272975, 0, 0.08627451, 1, 1,
0.4228449, 1.250181, -0.2386332, 0, 0.08235294, 1, 1,
0.4235207, -0.796753, 1.781657, 0, 0.07450981, 1, 1,
0.4240558, -0.967766, 2.177836, 0, 0.07058824, 1, 1,
0.424975, -0.8073223, 2.746555, 0, 0.0627451, 1, 1,
0.4269979, 0.3033794, 1.650428, 0, 0.05882353, 1, 1,
0.427011, 0.4909112, 1.494238, 0, 0.05098039, 1, 1,
0.4270347, 0.5615532, 1.481212, 0, 0.04705882, 1, 1,
0.4273434, 2.118866, 0.3801365, 0, 0.03921569, 1, 1,
0.427766, -1.327025, 0.5739489, 0, 0.03529412, 1, 1,
0.4322732, 2.437607, 0.4421288, 0, 0.02745098, 1, 1,
0.4408661, -0.7114297, 4.131171, 0, 0.02352941, 1, 1,
0.4420662, -1.388609, 2.832807, 0, 0.01568628, 1, 1,
0.4460611, 0.02395858, 0.2084032, 0, 0.01176471, 1, 1,
0.4497642, 0.7955871, -1.811179, 0, 0.003921569, 1, 1,
0.4498189, 0.4678515, 0.872951, 0.003921569, 0, 1, 1,
0.4516498, -0.4162251, 1.645019, 0.007843138, 0, 1, 1,
0.4524423, -0.592979, 2.742267, 0.01568628, 0, 1, 1,
0.4548129, -0.561143, 2.778559, 0.01960784, 0, 1, 1,
0.4550317, -0.5351979, 2.371737, 0.02745098, 0, 1, 1,
0.455684, 0.2900036, 0.9442821, 0.03137255, 0, 1, 1,
0.4565183, 0.2407834, 1.526374, 0.03921569, 0, 1, 1,
0.4630794, 2.137405, 0.7422984, 0.04313726, 0, 1, 1,
0.465635, -0.6277793, 2.561466, 0.05098039, 0, 1, 1,
0.4735008, -0.7540313, 2.863224, 0.05490196, 0, 1, 1,
0.4801181, 0.6608468, 0.7436283, 0.0627451, 0, 1, 1,
0.4925575, -0.8780183, 3.52534, 0.06666667, 0, 1, 1,
0.4980864, 0.7616408, 0.1685264, 0.07450981, 0, 1, 1,
0.4993401, -0.1188318, 1.721979, 0.07843138, 0, 1, 1,
0.5023199, 0.5597355, 0.1733279, 0.08627451, 0, 1, 1,
0.5042055, -1.295113, -0.3052667, 0.09019608, 0, 1, 1,
0.5063673, -0.6853617, 1.52006, 0.09803922, 0, 1, 1,
0.5080143, -0.8547035, 1.175623, 0.1058824, 0, 1, 1,
0.5087872, -1.182932, 3.34, 0.1098039, 0, 1, 1,
0.5089343, -1.740564, 3.175811, 0.1176471, 0, 1, 1,
0.5104243, -1.423088, 1.863524, 0.1215686, 0, 1, 1,
0.5110782, -0.5973752, 3.529938, 0.1294118, 0, 1, 1,
0.5147536, 0.9615069, -0.5779857, 0.1333333, 0, 1, 1,
0.5166128, -0.5625759, 3.265993, 0.1411765, 0, 1, 1,
0.5176764, 0.5568532, 0.392298, 0.145098, 0, 1, 1,
0.5192079, -0.05975291, 0.1159231, 0.1529412, 0, 1, 1,
0.5206057, -1.070601, 2.591097, 0.1568628, 0, 1, 1,
0.5220058, -0.5012105, 1.669866, 0.1647059, 0, 1, 1,
0.5230414, 1.393184, -0.03369349, 0.1686275, 0, 1, 1,
0.5268935, -0.7896762, 0.1383593, 0.1764706, 0, 1, 1,
0.5291985, 0.5222074, 1.056673, 0.1803922, 0, 1, 1,
0.5389567, 1.0709, 0.5803697, 0.1882353, 0, 1, 1,
0.5431435, -0.3417808, 2.426712, 0.1921569, 0, 1, 1,
0.5445248, -0.7296262, 2.581573, 0.2, 0, 1, 1,
0.5449698, -0.7217354, 5.178121, 0.2078431, 0, 1, 1,
0.5458722, -0.3108256, 2.69953, 0.2117647, 0, 1, 1,
0.5492421, 1.488358, -0.7395766, 0.2196078, 0, 1, 1,
0.5533064, -1.127472, 3.051757, 0.2235294, 0, 1, 1,
0.5569828, -0.5496436, 3.879616, 0.2313726, 0, 1, 1,
0.5604017, -0.8936048, 1.690853, 0.2352941, 0, 1, 1,
0.5614755, 0.08884468, 0.8552635, 0.2431373, 0, 1, 1,
0.5639809, 1.103229, 1.607327, 0.2470588, 0, 1, 1,
0.5640774, -0.5998784, 0.8650845, 0.254902, 0, 1, 1,
0.566628, -0.1419701, 1.710588, 0.2588235, 0, 1, 1,
0.569849, 0.05603238, 1.272522, 0.2666667, 0, 1, 1,
0.5708713, 1.219927, -0.3395726, 0.2705882, 0, 1, 1,
0.5766224, -2.781624, 1.652871, 0.2784314, 0, 1, 1,
0.5847351, -0.3050275, 1.780036, 0.282353, 0, 1, 1,
0.5874324, -1.272001, 2.642625, 0.2901961, 0, 1, 1,
0.5888488, 0.8993691, 1.692558, 0.2941177, 0, 1, 1,
0.5905802, 0.7261834, 0.9890072, 0.3019608, 0, 1, 1,
0.5911472, -0.6156712, 3.002769, 0.3098039, 0, 1, 1,
0.5913049, -0.3331495, 2.732498, 0.3137255, 0, 1, 1,
0.593006, 0.3265758, 1.690336, 0.3215686, 0, 1, 1,
0.5933111, -1.065807, 3.54812, 0.3254902, 0, 1, 1,
0.5951813, -0.225452, 1.72024, 0.3333333, 0, 1, 1,
0.599601, 0.9952056, 1.688274, 0.3372549, 0, 1, 1,
0.6014228, 1.422732, 2.195746, 0.345098, 0, 1, 1,
0.6041369, 1.357908, -0.577682, 0.3490196, 0, 1, 1,
0.6052076, 0.1262973, 0.4179395, 0.3568628, 0, 1, 1,
0.6063089, 0.686753, 2.616787, 0.3607843, 0, 1, 1,
0.6065685, 0.2155144, 1.981441, 0.3686275, 0, 1, 1,
0.6103671, -0.3366469, 1.778372, 0.372549, 0, 1, 1,
0.6117431, 1.248211, 1.78475, 0.3803922, 0, 1, 1,
0.6151063, -0.5094125, 3.847865, 0.3843137, 0, 1, 1,
0.6151453, -2.455423, 2.068337, 0.3921569, 0, 1, 1,
0.619146, -0.278309, 2.030911, 0.3960784, 0, 1, 1,
0.6207469, -0.1477553, 3.46975, 0.4039216, 0, 1, 1,
0.6208561, 0.8083521, 0.753309, 0.4117647, 0, 1, 1,
0.6216483, 0.266133, -0.7528393, 0.4156863, 0, 1, 1,
0.6221478, 0.8289956, 0.6002145, 0.4235294, 0, 1, 1,
0.624937, 0.6679253, 2.649721, 0.427451, 0, 1, 1,
0.6252784, -0.995719, 4.672644, 0.4352941, 0, 1, 1,
0.6277749, 0.6421461, -1.674428, 0.4392157, 0, 1, 1,
0.6297401, 1.063321, 1.086908, 0.4470588, 0, 1, 1,
0.6321172, 0.3122835, 2.048953, 0.4509804, 0, 1, 1,
0.6399877, -0.4845429, 4.666825, 0.4588235, 0, 1, 1,
0.6435632, -2.174199, 3.082458, 0.4627451, 0, 1, 1,
0.6505869, 0.9346629, 1.313642, 0.4705882, 0, 1, 1,
0.6525057, 1.941651, -0.4778858, 0.4745098, 0, 1, 1,
0.6527041, -0.05112446, 2.133076, 0.4823529, 0, 1, 1,
0.6542763, 0.05516765, 0.8994161, 0.4862745, 0, 1, 1,
0.6607398, -1.247213, 1.378614, 0.4941176, 0, 1, 1,
0.6670682, -0.08845986, 1.99967, 0.5019608, 0, 1, 1,
0.667088, -0.6409226, 1.566629, 0.5058824, 0, 1, 1,
0.6674087, -0.9000185, 1.614362, 0.5137255, 0, 1, 1,
0.6749366, -0.0112471, 0.9750773, 0.5176471, 0, 1, 1,
0.6772946, -0.1502797, 1.524682, 0.5254902, 0, 1, 1,
0.677803, -0.6382535, 1.712627, 0.5294118, 0, 1, 1,
0.6912816, 0.01166498, 0.5980034, 0.5372549, 0, 1, 1,
0.6941609, 0.6525404, 1.132453, 0.5411765, 0, 1, 1,
0.697942, -0.3603806, 2.120927, 0.5490196, 0, 1, 1,
0.7002777, -0.3227032, 0.01585147, 0.5529412, 0, 1, 1,
0.7027531, -1.7831, 3.859585, 0.5607843, 0, 1, 1,
0.7034942, 0.4250708, 3.009185, 0.5647059, 0, 1, 1,
0.7053432, -0.2298365, 3.402912, 0.572549, 0, 1, 1,
0.7093492, -0.7837263, 3.46803, 0.5764706, 0, 1, 1,
0.7147495, 2.076168, 0.3726847, 0.5843138, 0, 1, 1,
0.7163251, 0.4893641, 0.3137189, 0.5882353, 0, 1, 1,
0.7207402, 0.5639127, 1.289818, 0.5960785, 0, 1, 1,
0.7218984, 0.8489282, 2.446019, 0.6039216, 0, 1, 1,
0.7227418, 1.147063, 1.371699, 0.6078432, 0, 1, 1,
0.7244212, 0.4575547, 0.1902694, 0.6156863, 0, 1, 1,
0.729687, -0.8828677, 1.7096, 0.6196079, 0, 1, 1,
0.7329938, -1.036599, 0.1105664, 0.627451, 0, 1, 1,
0.7385641, -1.033669, 1.659958, 0.6313726, 0, 1, 1,
0.7392884, 1.763122, 1.397878, 0.6392157, 0, 1, 1,
0.7415071, -0.1276301, 0.8337396, 0.6431373, 0, 1, 1,
0.74217, 0.04703641, 1.001904, 0.6509804, 0, 1, 1,
0.7440221, -0.5713477, 2.442086, 0.654902, 0, 1, 1,
0.7625915, 0.738064, -0.172606, 0.6627451, 0, 1, 1,
0.763972, 0.4293242, -0.4328841, 0.6666667, 0, 1, 1,
0.7656417, -1.921308, 3.242368, 0.6745098, 0, 1, 1,
0.767202, -1.657514, 2.783405, 0.6784314, 0, 1, 1,
0.7686486, -1.054141, -0.2878712, 0.6862745, 0, 1, 1,
0.7692033, 0.9928019, 0.6598659, 0.6901961, 0, 1, 1,
0.7700472, 0.1465683, 1.805905, 0.6980392, 0, 1, 1,
0.7734175, -1.734267, 4.656831, 0.7058824, 0, 1, 1,
0.7741863, 0.1964236, 0.6895751, 0.7098039, 0, 1, 1,
0.7751076, 0.6185864, -0.3757164, 0.7176471, 0, 1, 1,
0.7804299, 1.072456, 2.1292, 0.7215686, 0, 1, 1,
0.7925205, 0.09658981, 2.264145, 0.7294118, 0, 1, 1,
0.7995133, 1.341141, 2.749953, 0.7333333, 0, 1, 1,
0.8031781, 0.4664844, 1.787517, 0.7411765, 0, 1, 1,
0.8042971, -0.622465, 3.551572, 0.7450981, 0, 1, 1,
0.8175265, -2.094108, 3.529673, 0.7529412, 0, 1, 1,
0.8181891, -0.7009386, 3.825865, 0.7568628, 0, 1, 1,
0.82691, 0.2611696, 1.650928, 0.7647059, 0, 1, 1,
0.8279753, -0.2839568, 2.887922, 0.7686275, 0, 1, 1,
0.8391922, -0.93596, 1.784973, 0.7764706, 0, 1, 1,
0.8393577, 0.4881532, 0.3524785, 0.7803922, 0, 1, 1,
0.8404889, 0.1926865, 1.469019, 0.7882353, 0, 1, 1,
0.8424299, 1.483223, -0.4032025, 0.7921569, 0, 1, 1,
0.8459816, -1.407147, 4.078186, 0.8, 0, 1, 1,
0.8460959, -0.6837471, 2.713684, 0.8078431, 0, 1, 1,
0.8713635, 0.3516761, 0.2382796, 0.8117647, 0, 1, 1,
0.8736028, 0.3950007, 1.624765, 0.8196079, 0, 1, 1,
0.8764367, -2.14104, 4.513385, 0.8235294, 0, 1, 1,
0.8812462, -1.246135, 1.455819, 0.8313726, 0, 1, 1,
0.8887529, -1.656585, 3.724386, 0.8352941, 0, 1, 1,
0.8899339, 0.7039858, 0.4799583, 0.8431373, 0, 1, 1,
0.8928164, -0.3141633, 1.39183, 0.8470588, 0, 1, 1,
0.8937204, 1.146919, 0.1578292, 0.854902, 0, 1, 1,
0.896818, 0.1144486, 1.125985, 0.8588235, 0, 1, 1,
0.9138591, 0.3240915, -0.1365004, 0.8666667, 0, 1, 1,
0.914322, 0.09981198, 1.585236, 0.8705882, 0, 1, 1,
0.9166044, -0.207541, 2.821487, 0.8784314, 0, 1, 1,
0.9252239, 1.023912, -0.6673209, 0.8823529, 0, 1, 1,
0.9295797, -0.7848539, -0.1886017, 0.8901961, 0, 1, 1,
0.9339245, 1.119883, -0.188558, 0.8941177, 0, 1, 1,
0.9373097, 0.07976323, 1.583213, 0.9019608, 0, 1, 1,
0.9393322, 1.550833, -0.03114709, 0.9098039, 0, 1, 1,
0.9424276, -0.8767767, 1.813194, 0.9137255, 0, 1, 1,
0.9439406, 2.137077, 0.8287849, 0.9215686, 0, 1, 1,
0.958631, 0.7731717, 1.631176, 0.9254902, 0, 1, 1,
0.9602721, 0.6305706, 0.2464949, 0.9333333, 0, 1, 1,
0.9608892, 0.8584709, 1.268833, 0.9372549, 0, 1, 1,
0.9610882, 0.8953574, 1.617648, 0.945098, 0, 1, 1,
0.9660133, 0.1034216, 0.03458173, 0.9490196, 0, 1, 1,
0.9665581, -0.5137013, 2.503152, 0.9568627, 0, 1, 1,
0.9683168, -0.04750552, 1.750924, 0.9607843, 0, 1, 1,
0.969374, 0.186574, 1.223362, 0.9686275, 0, 1, 1,
0.9780807, -0.7727281, 1.098991, 0.972549, 0, 1, 1,
0.9832073, -0.3941874, 1.35735, 0.9803922, 0, 1, 1,
0.984387, -0.1323109, 2.026703, 0.9843137, 0, 1, 1,
0.985205, -1.936853, 3.411879, 0.9921569, 0, 1, 1,
0.990418, -0.5278663, 0.6385043, 0.9960784, 0, 1, 1,
1.008097, 0.1366588, 0.290634, 1, 0, 0.9960784, 1,
1.009323, 1.463516, 0.4039536, 1, 0, 0.9882353, 1,
1.010581, 0.3903002, 0.2584633, 1, 0, 0.9843137, 1,
1.020248, 0.484923, 0.6711153, 1, 0, 0.9764706, 1,
1.02167, 0.6132153, 3.80072, 1, 0, 0.972549, 1,
1.023995, 0.4818672, 1.071873, 1, 0, 0.9647059, 1,
1.027333, -0.7009052, 2.690432, 1, 0, 0.9607843, 1,
1.029448, 0.5892875, 1.001427, 1, 0, 0.9529412, 1,
1.036325, -1.649779, 1.750626, 1, 0, 0.9490196, 1,
1.042907, 1.724677, -0.1193562, 1, 0, 0.9411765, 1,
1.044431, 1.064787, 0.5704083, 1, 0, 0.9372549, 1,
1.046755, -0.2782565, 0.5382566, 1, 0, 0.9294118, 1,
1.060666, 0.4910336, 1.833113, 1, 0, 0.9254902, 1,
1.06388, -0.0832161, 0.9887235, 1, 0, 0.9176471, 1,
1.064476, -0.6867125, 1.82756, 1, 0, 0.9137255, 1,
1.064917, 0.8743392, -0.5050255, 1, 0, 0.9058824, 1,
1.071247, 1.155819, 1.145571, 1, 0, 0.9019608, 1,
1.072551, 0.2337557, 0.4976178, 1, 0, 0.8941177, 1,
1.076687, 1.327507, 1.478466, 1, 0, 0.8862745, 1,
1.077636, -0.1857393, 2.021162, 1, 0, 0.8823529, 1,
1.077935, 0.4744586, 2.148505, 1, 0, 0.8745098, 1,
1.080053, 1.406368, 2.036604, 1, 0, 0.8705882, 1,
1.08809, 1.188091, 0.4711445, 1, 0, 0.8627451, 1,
1.093478, 0.9094834, 0.7345981, 1, 0, 0.8588235, 1,
1.095475, -0.272395, 1.664597, 1, 0, 0.8509804, 1,
1.10363, -0.9906716, 1.566458, 1, 0, 0.8470588, 1,
1.114083, -1.94765, 3.26878, 1, 0, 0.8392157, 1,
1.115626, -0.4626961, 2.878055, 1, 0, 0.8352941, 1,
1.117579, -0.5946261, 0.8947819, 1, 0, 0.827451, 1,
1.123445, 1.409372, 0.7746381, 1, 0, 0.8235294, 1,
1.126771, 1.339254, 0.8383597, 1, 0, 0.8156863, 1,
1.130107, 2.211229, 0.4192213, 1, 0, 0.8117647, 1,
1.130844, -1.209302, 1.293919, 1, 0, 0.8039216, 1,
1.137319, 0.7467554, -0.2395846, 1, 0, 0.7960784, 1,
1.138962, 0.6184496, 1.113983, 1, 0, 0.7921569, 1,
1.140501, -0.8992649, 3.226233, 1, 0, 0.7843137, 1,
1.147295, -0.05760894, 3.047459, 1, 0, 0.7803922, 1,
1.149416, -0.1609691, 2.243986, 1, 0, 0.772549, 1,
1.152744, -0.02715283, 2.053486, 1, 0, 0.7686275, 1,
1.155789, -0.6790012, 1.566599, 1, 0, 0.7607843, 1,
1.160312, -0.1808164, 2.653306, 1, 0, 0.7568628, 1,
1.160757, -0.79404, -0.1896152, 1, 0, 0.7490196, 1,
1.162906, 0.5166067, 0.4224813, 1, 0, 0.7450981, 1,
1.163719, -0.9172263, 2.62663, 1, 0, 0.7372549, 1,
1.168095, -0.3586516, 0.8580061, 1, 0, 0.7333333, 1,
1.170453, 0.1093863, 0.03158405, 1, 0, 0.7254902, 1,
1.183883, -1.208934, 3.116574, 1, 0, 0.7215686, 1,
1.191638, 0.4605641, 0.4795502, 1, 0, 0.7137255, 1,
1.2064, -0.5197745, 1.097849, 1, 0, 0.7098039, 1,
1.208964, 0.2810862, 1.176733, 1, 0, 0.7019608, 1,
1.226886, 1.191944, 1.237126, 1, 0, 0.6941177, 1,
1.230174, 0.8838053, 1.386996, 1, 0, 0.6901961, 1,
1.238641, 0.3353519, 1.691312, 1, 0, 0.682353, 1,
1.252895, -1.253168, 3.320639, 1, 0, 0.6784314, 1,
1.254089, -0.9112903, 1.300269, 1, 0, 0.6705883, 1,
1.255408, -0.4255776, 2.361845, 1, 0, 0.6666667, 1,
1.260488, 0.6942542, 0.9268788, 1, 0, 0.6588235, 1,
1.269659, 0.25605, 2.264516, 1, 0, 0.654902, 1,
1.281168, 1.135843, -1.180369, 1, 0, 0.6470588, 1,
1.292294, 0.8280872, 1.583063, 1, 0, 0.6431373, 1,
1.294626, 0.01688809, 1.73466, 1, 0, 0.6352941, 1,
1.300535, -1.124561, 2.054586, 1, 0, 0.6313726, 1,
1.307852, -2.729544, 3.162329, 1, 0, 0.6235294, 1,
1.308138, -0.4984436, 1.582572, 1, 0, 0.6196079, 1,
1.314237, 0.8460994, 1.441084, 1, 0, 0.6117647, 1,
1.317322, 0.09618695, 1.71346, 1, 0, 0.6078432, 1,
1.345621, 0.3834099, -0.5641863, 1, 0, 0.6, 1,
1.352288, -0.3499894, 1.980709, 1, 0, 0.5921569, 1,
1.358428, 0.3886559, 0.6848716, 1, 0, 0.5882353, 1,
1.359665, 0.3100584, 0.8030858, 1, 0, 0.5803922, 1,
1.368865, 0.4916021, 0.92996, 1, 0, 0.5764706, 1,
1.38225, 0.5089343, 0.2105085, 1, 0, 0.5686275, 1,
1.3841, 0.2335399, 0.2305374, 1, 0, 0.5647059, 1,
1.387308, -0.5511467, 1.737774, 1, 0, 0.5568628, 1,
1.39345, 0.1117734, 0.6521311, 1, 0, 0.5529412, 1,
1.398144, -0.9583911, 2.765848, 1, 0, 0.5450981, 1,
1.410147, -0.5676438, 2.131862, 1, 0, 0.5411765, 1,
1.415347, -0.8033962, 1.771483, 1, 0, 0.5333334, 1,
1.421354, 0.3245619, 2.444006, 1, 0, 0.5294118, 1,
1.422566, -1.126636, 1.087113, 1, 0, 0.5215687, 1,
1.424729, 0.8126866, 0.8662689, 1, 0, 0.5176471, 1,
1.426092, 1.050701, 0.6462904, 1, 0, 0.509804, 1,
1.444503, -0.5431376, 2.533328, 1, 0, 0.5058824, 1,
1.445634, -0.8229905, 1.735182, 1, 0, 0.4980392, 1,
1.446184, -0.2605058, 0.6329536, 1, 0, 0.4901961, 1,
1.456476, 0.3172797, -0.4023985, 1, 0, 0.4862745, 1,
1.45974, -1.070405, 3.628205, 1, 0, 0.4784314, 1,
1.461559, 1.06741, 2.549019, 1, 0, 0.4745098, 1,
1.469768, 0.5484529, 0.8817483, 1, 0, 0.4666667, 1,
1.479046, 0.9053224, -0.7472571, 1, 0, 0.4627451, 1,
1.481767, 1.175732, -0.5193948, 1, 0, 0.454902, 1,
1.485115, -1.439746, 1.304732, 1, 0, 0.4509804, 1,
1.492122, 0.7908492, 1.415199, 1, 0, 0.4431373, 1,
1.49479, -1.253356, 2.207226, 1, 0, 0.4392157, 1,
1.508403, -0.491766, 1.383919, 1, 0, 0.4313726, 1,
1.510779, 0.3911282, 0.3764247, 1, 0, 0.427451, 1,
1.514104, 1.39781, -0.6653314, 1, 0, 0.4196078, 1,
1.540369, 0.2318595, 1.947377, 1, 0, 0.4156863, 1,
1.545843, 0.5618376, -0.6196958, 1, 0, 0.4078431, 1,
1.576214, 0.1153979, -0.2869888, 1, 0, 0.4039216, 1,
1.607058, -0.1867152, 1.980273, 1, 0, 0.3960784, 1,
1.623151, -3.032503, 2.401056, 1, 0, 0.3882353, 1,
1.624807, -0.2175461, 1.652961, 1, 0, 0.3843137, 1,
1.628902, -0.1659148, 2.445873, 1, 0, 0.3764706, 1,
1.650194, -0.8171603, 1.461999, 1, 0, 0.372549, 1,
1.65161, 0.4813835, 1.125405, 1, 0, 0.3647059, 1,
1.665717, 0.4892824, 1.642685, 1, 0, 0.3607843, 1,
1.666969, 0.6943958, 1.560232, 1, 0, 0.3529412, 1,
1.667179, -0.6816171, 1.170309, 1, 0, 0.3490196, 1,
1.669212, 0.04565554, 1.932281, 1, 0, 0.3411765, 1,
1.674385, 0.1883775, 0.4568534, 1, 0, 0.3372549, 1,
1.684782, -0.1541334, 2.46628, 1, 0, 0.3294118, 1,
1.701056, -0.190274, 1.493267, 1, 0, 0.3254902, 1,
1.703127, 0.6938139, 0.7444453, 1, 0, 0.3176471, 1,
1.705157, 0.4042097, 1.257661, 1, 0, 0.3137255, 1,
1.71496, 0.06879652, 2.525624, 1, 0, 0.3058824, 1,
1.720252, -0.6272925, 1.080765, 1, 0, 0.2980392, 1,
1.724741, 0.8419595, 1.164292, 1, 0, 0.2941177, 1,
1.737163, -0.5841469, 0.8077996, 1, 0, 0.2862745, 1,
1.749418, 0.3063152, 2.561302, 1, 0, 0.282353, 1,
1.750743, 1.330365, 1.915743, 1, 0, 0.2745098, 1,
1.761963, -0.2554431, 2.105729, 1, 0, 0.2705882, 1,
1.770322, -0.1938267, 0.7277833, 1, 0, 0.2627451, 1,
1.800636, -2.406639, 3.077824, 1, 0, 0.2588235, 1,
1.812847, 1.473238, 0.7189404, 1, 0, 0.2509804, 1,
1.814202, -1.357211, 3.417137, 1, 0, 0.2470588, 1,
1.834516, -1.062364, 0.4773, 1, 0, 0.2392157, 1,
1.85305, 0.3741941, 1.083191, 1, 0, 0.2352941, 1,
1.857227, -0.2758514, 1.309743, 1, 0, 0.227451, 1,
1.868733, -0.423916, 1.52305, 1, 0, 0.2235294, 1,
1.880717, 0.4883248, 0.602293, 1, 0, 0.2156863, 1,
1.887958, 0.8554801, 2.222611, 1, 0, 0.2117647, 1,
1.896411, 0.8464595, 0.2740382, 1, 0, 0.2039216, 1,
1.922367, 0.1695931, 0.9053016, 1, 0, 0.1960784, 1,
1.926301, -0.3591629, 2.643861, 1, 0, 0.1921569, 1,
1.939092, -1.162731, 1.975755, 1, 0, 0.1843137, 1,
1.939501, 1.13385, 1.63879, 1, 0, 0.1803922, 1,
1.954783, 0.1067054, 2.633659, 1, 0, 0.172549, 1,
1.972428, 0.3462584, 0.8414677, 1, 0, 0.1686275, 1,
1.97481, 1.151307, 1.739951, 1, 0, 0.1607843, 1,
1.97523, 0.8187714, 2.008654, 1, 0, 0.1568628, 1,
1.975404, 0.8770448, 1.289226, 1, 0, 0.1490196, 1,
1.987524, 1.272968, -0.4529019, 1, 0, 0.145098, 1,
2.000747, -1.405769, 2.731766, 1, 0, 0.1372549, 1,
2.004177, -0.3216728, 1.708772, 1, 0, 0.1333333, 1,
2.055447, 0.5560019, 1.587962, 1, 0, 0.1254902, 1,
2.060616, -0.509074, 2.881086, 1, 0, 0.1215686, 1,
2.090277, 0.09061158, 1.225236, 1, 0, 0.1137255, 1,
2.09142, -1.246294, 2.58917, 1, 0, 0.1098039, 1,
2.102241, 0.5970625, 0.8804082, 1, 0, 0.1019608, 1,
2.112662, 0.1825962, 1.416661, 1, 0, 0.09411765, 1,
2.123276, 0.2785748, 3.084641, 1, 0, 0.09019608, 1,
2.20377, -0.04416444, 2.12501, 1, 0, 0.08235294, 1,
2.212741, -0.3365491, 0.1657481, 1, 0, 0.07843138, 1,
2.217924, 0.0525792, -0.1636241, 1, 0, 0.07058824, 1,
2.267686, 0.520325, 2.307393, 1, 0, 0.06666667, 1,
2.299083, 0.9184987, 3.150008, 1, 0, 0.05882353, 1,
2.382179, -0.2963986, 3.110789, 1, 0, 0.05490196, 1,
2.448296, -2.162856, 1.868346, 1, 0, 0.04705882, 1,
2.45533, -1.34636, 0.33908, 1, 0, 0.04313726, 1,
2.485972, 0.7210066, 1.642773, 1, 0, 0.03529412, 1,
2.577178, -0.4113212, 2.165649, 1, 0, 0.03137255, 1,
2.59156, -1.147129, 0.926795, 1, 0, 0.02352941, 1,
2.620418, 1.091928, 0.5765707, 1, 0, 0.01960784, 1,
2.75496, 1.403957, 0.7391357, 1, 0, 0.01176471, 1,
2.937145, 0.3515918, 2.903097, 1, 0, 0.007843138, 1
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
-0.3549626, -4.039919, -7.626341, 0, -0.5, 0.5, 0.5,
-0.3549626, -4.039919, -7.626341, 1, -0.5, 0.5, 0.5,
-0.3549626, -4.039919, -7.626341, 1, 1.5, 0.5, 0.5,
-0.3549626, -4.039919, -7.626341, 0, 1.5, 0.5, 0.5
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
-4.763094, -0.06077421, -7.626341, 0, -0.5, 0.5, 0.5,
-4.763094, -0.06077421, -7.626341, 1, -0.5, 0.5, 0.5,
-4.763094, -0.06077421, -7.626341, 1, 1.5, 0.5, 0.5,
-4.763094, -0.06077421, -7.626341, 0, 1.5, 0.5, 0.5
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
-4.763094, -4.039919, -0.2343991, 0, -0.5, 0.5, 0.5,
-4.763094, -4.039919, -0.2343991, 1, -0.5, 0.5, 0.5,
-4.763094, -4.039919, -0.2343991, 1, 1.5, 0.5, 0.5,
-4.763094, -4.039919, -0.2343991, 0, 1.5, 0.5, 0.5
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
-3, -3.121655, -5.920508,
2, -3.121655, -5.920508,
-3, -3.121655, -5.920508,
-3, -3.274699, -6.204814,
-2, -3.121655, -5.920508,
-2, -3.274699, -6.204814,
-1, -3.121655, -5.920508,
-1, -3.274699, -6.204814,
0, -3.121655, -5.920508,
0, -3.274699, -6.204814,
1, -3.121655, -5.920508,
1, -3.274699, -6.204814,
2, -3.121655, -5.920508,
2, -3.274699, -6.204814
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
"2"
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
-3, -3.580787, -6.773425, 0, -0.5, 0.5, 0.5,
-3, -3.580787, -6.773425, 1, -0.5, 0.5, 0.5,
-3, -3.580787, -6.773425, 1, 1.5, 0.5, 0.5,
-3, -3.580787, -6.773425, 0, 1.5, 0.5, 0.5,
-2, -3.580787, -6.773425, 0, -0.5, 0.5, 0.5,
-2, -3.580787, -6.773425, 1, -0.5, 0.5, 0.5,
-2, -3.580787, -6.773425, 1, 1.5, 0.5, 0.5,
-2, -3.580787, -6.773425, 0, 1.5, 0.5, 0.5,
-1, -3.580787, -6.773425, 0, -0.5, 0.5, 0.5,
-1, -3.580787, -6.773425, 1, -0.5, 0.5, 0.5,
-1, -3.580787, -6.773425, 1, 1.5, 0.5, 0.5,
-1, -3.580787, -6.773425, 0, 1.5, 0.5, 0.5,
0, -3.580787, -6.773425, 0, -0.5, 0.5, 0.5,
0, -3.580787, -6.773425, 1, -0.5, 0.5, 0.5,
0, -3.580787, -6.773425, 1, 1.5, 0.5, 0.5,
0, -3.580787, -6.773425, 0, 1.5, 0.5, 0.5,
1, -3.580787, -6.773425, 0, -0.5, 0.5, 0.5,
1, -3.580787, -6.773425, 1, -0.5, 0.5, 0.5,
1, -3.580787, -6.773425, 1, 1.5, 0.5, 0.5,
1, -3.580787, -6.773425, 0, 1.5, 0.5, 0.5,
2, -3.580787, -6.773425, 0, -0.5, 0.5, 0.5,
2, -3.580787, -6.773425, 1, -0.5, 0.5, 0.5,
2, -3.580787, -6.773425, 1, 1.5, 0.5, 0.5,
2, -3.580787, -6.773425, 0, 1.5, 0.5, 0.5
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
-3.745833, -3, -5.920508,
-3.745833, 2, -5.920508,
-3.745833, -3, -5.920508,
-3.915377, -3, -6.204814,
-3.745833, -2, -5.920508,
-3.915377, -2, -6.204814,
-3.745833, -1, -5.920508,
-3.915377, -1, -6.204814,
-3.745833, 0, -5.920508,
-3.915377, 0, -6.204814,
-3.745833, 1, -5.920508,
-3.915377, 1, -6.204814,
-3.745833, 2, -5.920508,
-3.915377, 2, -6.204814
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
"-3",
"-2",
"-1",
"0",
"1",
"2"
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
-4.254464, -3, -6.773425, 0, -0.5, 0.5, 0.5,
-4.254464, -3, -6.773425, 1, -0.5, 0.5, 0.5,
-4.254464, -3, -6.773425, 1, 1.5, 0.5, 0.5,
-4.254464, -3, -6.773425, 0, 1.5, 0.5, 0.5,
-4.254464, -2, -6.773425, 0, -0.5, 0.5, 0.5,
-4.254464, -2, -6.773425, 1, -0.5, 0.5, 0.5,
-4.254464, -2, -6.773425, 1, 1.5, 0.5, 0.5,
-4.254464, -2, -6.773425, 0, 1.5, 0.5, 0.5,
-4.254464, -1, -6.773425, 0, -0.5, 0.5, 0.5,
-4.254464, -1, -6.773425, 1, -0.5, 0.5, 0.5,
-4.254464, -1, -6.773425, 1, 1.5, 0.5, 0.5,
-4.254464, -1, -6.773425, 0, 1.5, 0.5, 0.5,
-4.254464, 0, -6.773425, 0, -0.5, 0.5, 0.5,
-4.254464, 0, -6.773425, 1, -0.5, 0.5, 0.5,
-4.254464, 0, -6.773425, 1, 1.5, 0.5, 0.5,
-4.254464, 0, -6.773425, 0, 1.5, 0.5, 0.5,
-4.254464, 1, -6.773425, 0, -0.5, 0.5, 0.5,
-4.254464, 1, -6.773425, 1, -0.5, 0.5, 0.5,
-4.254464, 1, -6.773425, 1, 1.5, 0.5, 0.5,
-4.254464, 1, -6.773425, 0, 1.5, 0.5, 0.5,
-4.254464, 2, -6.773425, 0, -0.5, 0.5, 0.5,
-4.254464, 2, -6.773425, 1, -0.5, 0.5, 0.5,
-4.254464, 2, -6.773425, 1, 1.5, 0.5, 0.5,
-4.254464, 2, -6.773425, 0, 1.5, 0.5, 0.5
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
-3.745833, -3.121655, -4,
-3.745833, -3.121655, 4,
-3.745833, -3.121655, -4,
-3.915377, -3.274699, -4,
-3.745833, -3.121655, -2,
-3.915377, -3.274699, -2,
-3.745833, -3.121655, 0,
-3.915377, -3.274699, 0,
-3.745833, -3.121655, 2,
-3.915377, -3.274699, 2,
-3.745833, -3.121655, 4,
-3.915377, -3.274699, 4
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
-4.254464, -3.580787, -4, 0, -0.5, 0.5, 0.5,
-4.254464, -3.580787, -4, 1, -0.5, 0.5, 0.5,
-4.254464, -3.580787, -4, 1, 1.5, 0.5, 0.5,
-4.254464, -3.580787, -4, 0, 1.5, 0.5, 0.5,
-4.254464, -3.580787, -2, 0, -0.5, 0.5, 0.5,
-4.254464, -3.580787, -2, 1, -0.5, 0.5, 0.5,
-4.254464, -3.580787, -2, 1, 1.5, 0.5, 0.5,
-4.254464, -3.580787, -2, 0, 1.5, 0.5, 0.5,
-4.254464, -3.580787, 0, 0, -0.5, 0.5, 0.5,
-4.254464, -3.580787, 0, 1, -0.5, 0.5, 0.5,
-4.254464, -3.580787, 0, 1, 1.5, 0.5, 0.5,
-4.254464, -3.580787, 0, 0, 1.5, 0.5, 0.5,
-4.254464, -3.580787, 2, 0, -0.5, 0.5, 0.5,
-4.254464, -3.580787, 2, 1, -0.5, 0.5, 0.5,
-4.254464, -3.580787, 2, 1, 1.5, 0.5, 0.5,
-4.254464, -3.580787, 2, 0, 1.5, 0.5, 0.5,
-4.254464, -3.580787, 4, 0, -0.5, 0.5, 0.5,
-4.254464, -3.580787, 4, 1, -0.5, 0.5, 0.5,
-4.254464, -3.580787, 4, 1, 1.5, 0.5, 0.5,
-4.254464, -3.580787, 4, 0, 1.5, 0.5, 0.5
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
-3.745833, -3.121655, -5.920508,
-3.745833, 3.000106, -5.920508,
-3.745833, -3.121655, 5.45171,
-3.745833, 3.000106, 5.45171,
-3.745833, -3.121655, -5.920508,
-3.745833, -3.121655, 5.45171,
-3.745833, 3.000106, -5.920508,
-3.745833, 3.000106, 5.45171,
-3.745833, -3.121655, -5.920508,
3.035908, -3.121655, -5.920508,
-3.745833, -3.121655, 5.45171,
3.035908, -3.121655, 5.45171,
-3.745833, 3.000106, -5.920508,
3.035908, 3.000106, -5.920508,
-3.745833, 3.000106, 5.45171,
3.035908, 3.000106, 5.45171,
3.035908, -3.121655, -5.920508,
3.035908, 3.000106, -5.920508,
3.035908, -3.121655, 5.45171,
3.035908, 3.000106, 5.45171,
3.035908, -3.121655, -5.920508,
3.035908, -3.121655, 5.45171,
3.035908, 3.000106, -5.920508,
3.035908, 3.000106, 5.45171
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
var radius = 7.789445;
var distance = 34.65612;
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
mvMatrix.translate( 0.3549626, 0.06077421, 0.2343991 );
mvMatrix.scale( 1.241879, 1.375764, 0.7405855 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65612);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Moxie<-read.table("Moxie.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Moxie$V2
```

```
## Error in eval(expr, envir, enclos): object 'Moxie' not found
```

```r
y<-Moxie$V3
```

```
## Error in eval(expr, envir, enclos): object 'Moxie' not found
```

```r
z<-Moxie$V4
```

```
## Error in eval(expr, envir, enclos): object 'Moxie' not found
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
-3.64707, -0.2415852, -1.477057, 0, 0, 1, 1, 1,
-3.266394, 0.7889286, -0.8429751, 1, 0, 0, 1, 1,
-2.925446, -0.2592935, -2.414689, 1, 0, 0, 1, 1,
-2.8792, -1.768754, -1.873754, 1, 0, 0, 1, 1,
-2.787789, -1.525458, -1.057022, 1, 0, 0, 1, 1,
-2.726924, -0.2686997, -1.20737, 1, 0, 0, 1, 1,
-2.683815, -1.267748, -1.209632, 0, 0, 0, 1, 1,
-2.677638, -0.5614684, -3.243393, 0, 0, 0, 1, 1,
-2.67731, 1.304648, -1.394689, 0, 0, 0, 1, 1,
-2.311772, -0.6464878, -2.753257, 0, 0, 0, 1, 1,
-2.304046, -0.7054022, -3.204844, 0, 0, 0, 1, 1,
-2.304027, -1.800472, -3.604788, 0, 0, 0, 1, 1,
-2.179635, -0.6787511, 0.7332404, 0, 0, 0, 1, 1,
-2.179317, -0.3340653, -1.943113, 1, 1, 1, 1, 1,
-2.172029, 0.6714588, -1.266046, 1, 1, 1, 1, 1,
-2.166907, -0.2558455, -0.974524, 1, 1, 1, 1, 1,
-2.142263, -1.079363, -0.7430941, 1, 1, 1, 1, 1,
-2.138896, -1.773106, -0.6413429, 1, 1, 1, 1, 1,
-2.121932, 0.4401538, -0.336214, 1, 1, 1, 1, 1,
-2.092773, 0.6650097, -1.624815, 1, 1, 1, 1, 1,
-2.081776, 0.2636552, -0.6397808, 1, 1, 1, 1, 1,
-2.06913, 0.6681142, -0.5836466, 1, 1, 1, 1, 1,
-2.039724, -0.3642806, -3.18611, 1, 1, 1, 1, 1,
-2.014142, -0.855863, -1.622196, 1, 1, 1, 1, 1,
-2.010167, -0.6986134, -1.016903, 1, 1, 1, 1, 1,
-1.985814, -0.6333333, -3.1213, 1, 1, 1, 1, 1,
-1.985533, -1.197163, -2.732554, 1, 1, 1, 1, 1,
-1.97381, -1.813025, -2.422804, 1, 1, 1, 1, 1,
-1.968729, 0.2387377, -1.364139, 0, 0, 1, 1, 1,
-1.9597, 0.2452468, 0.3837655, 1, 0, 0, 1, 1,
-1.95055, 0.9011005, 0.3805745, 1, 0, 0, 1, 1,
-1.945585, 0.2535637, -2.322241, 1, 0, 0, 1, 1,
-1.930262, -1.032848, -1.440568, 1, 0, 0, 1, 1,
-1.919944, -1.040861, -2.846037, 1, 0, 0, 1, 1,
-1.909279, 0.1194471, -1.279708, 0, 0, 0, 1, 1,
-1.86714, -0.9658862, -1.182415, 0, 0, 0, 1, 1,
-1.856689, -1.188924, -0.1903809, 0, 0, 0, 1, 1,
-1.843642, -1.070426, 0.04316782, 0, 0, 0, 1, 1,
-1.81875, -0.04332611, -2.09803, 0, 0, 0, 1, 1,
-1.814549, 1.576105, -0.6460537, 0, 0, 0, 1, 1,
-1.811482, -0.7977438, -0.5009187, 0, 0, 0, 1, 1,
-1.801549, 0.6708181, -0.3027699, 1, 1, 1, 1, 1,
-1.79348, -1.038068, -1.509028, 1, 1, 1, 1, 1,
-1.772469, 0.774258, -0.5658929, 1, 1, 1, 1, 1,
-1.759598, 0.4952252, -0.4341076, 1, 1, 1, 1, 1,
-1.733999, 0.4990112, -2.445904, 1, 1, 1, 1, 1,
-1.73294, 0.4310862, -0.3322125, 1, 1, 1, 1, 1,
-1.732583, -0.5682365, -2.350174, 1, 1, 1, 1, 1,
-1.730197, 0.006850636, 0.2043879, 1, 1, 1, 1, 1,
-1.715693, 0.6271714, -2.854128, 1, 1, 1, 1, 1,
-1.715263, 0.03210511, -2.670224, 1, 1, 1, 1, 1,
-1.710848, 0.3786906, -2.602436, 1, 1, 1, 1, 1,
-1.710645, 0.3734446, -2.413984, 1, 1, 1, 1, 1,
-1.700156, 0.3186593, -1.177782, 1, 1, 1, 1, 1,
-1.688073, -0.5629373, -1.613945, 1, 1, 1, 1, 1,
-1.672184, -0.6192457, -0.9600222, 1, 1, 1, 1, 1,
-1.670727, -0.4332636, -1.406765, 0, 0, 1, 1, 1,
-1.667715, -0.9867932, -3.104419, 1, 0, 0, 1, 1,
-1.648237, 0.3092603, -0.8209013, 1, 0, 0, 1, 1,
-1.632393, 0.9596002, -1.844718, 1, 0, 0, 1, 1,
-1.616476, -1.351049, -3.00637, 1, 0, 0, 1, 1,
-1.613169, 0.2794518, -1.687669, 1, 0, 0, 1, 1,
-1.588694, -0.1665882, -1.491537, 0, 0, 0, 1, 1,
-1.587321, 1.281895, -0.9510779, 0, 0, 0, 1, 1,
-1.581746, 0.2021155, 0.1835289, 0, 0, 0, 1, 1,
-1.580665, -0.269969, -1.747104, 0, 0, 0, 1, 1,
-1.580414, -0.9422505, -0.6858289, 0, 0, 0, 1, 1,
-1.579312, -1.306358, -1.0821, 0, 0, 0, 1, 1,
-1.578914, -0.3716803, -1.367277, 0, 0, 0, 1, 1,
-1.57745, 0.4490186, -2.133588, 1, 1, 1, 1, 1,
-1.551689, 2.302186, 1.066014, 1, 1, 1, 1, 1,
-1.54693, 1.377519, 0.6657012, 1, 1, 1, 1, 1,
-1.545456, 0.1776852, -0.9109541, 1, 1, 1, 1, 1,
-1.544215, 0.7854682, -1.309827, 1, 1, 1, 1, 1,
-1.54173, -0.2776107, -2.866076, 1, 1, 1, 1, 1,
-1.539037, -0.4083616, -2.663273, 1, 1, 1, 1, 1,
-1.5288, -0.08473893, -0.4776341, 1, 1, 1, 1, 1,
-1.527894, 0.1371693, -1.938476, 1, 1, 1, 1, 1,
-1.521471, -0.9697911, -2.110364, 1, 1, 1, 1, 1,
-1.520594, 0.1758622, -2.322967, 1, 1, 1, 1, 1,
-1.497513, -0.7411665, -2.007031, 1, 1, 1, 1, 1,
-1.490685, -0.2394479, -2.493312, 1, 1, 1, 1, 1,
-1.488204, 0.2776723, -2.518099, 1, 1, 1, 1, 1,
-1.468317, 0.450433, -0.809755, 1, 1, 1, 1, 1,
-1.451039, -0.8495546, -0.9260601, 0, 0, 1, 1, 1,
-1.447006, 0.2533142, -2.539502, 1, 0, 0, 1, 1,
-1.442398, -0.7963997, -1.832075, 1, 0, 0, 1, 1,
-1.441826, 0.848025, -0.3081399, 1, 0, 0, 1, 1,
-1.43216, 0.1095165, -2.383808, 1, 0, 0, 1, 1,
-1.430511, -0.6462663, -1.076126, 1, 0, 0, 1, 1,
-1.429569, 0.5970148, -0.2199024, 0, 0, 0, 1, 1,
-1.418752, 0.3518864, -2.120515, 0, 0, 0, 1, 1,
-1.405418, 1.951128, -1.264387, 0, 0, 0, 1, 1,
-1.402593, 0.07136977, -4.100764, 0, 0, 0, 1, 1,
-1.400085, 1.239519, -0.6035942, 0, 0, 0, 1, 1,
-1.393804, 0.8425012, -0.7465985, 0, 0, 0, 1, 1,
-1.393443, -0.5577371, -0.7724128, 0, 0, 0, 1, 1,
-1.389314, 0.703316, -2.531504, 1, 1, 1, 1, 1,
-1.38595, 0.1470921, -0.6646736, 1, 1, 1, 1, 1,
-1.380294, 1.017164, 0.0895893, 1, 1, 1, 1, 1,
-1.377181, 1.121378, -1.346913, 1, 1, 1, 1, 1,
-1.37501, 1.78676, 0.7611668, 1, 1, 1, 1, 1,
-1.372258, -0.6801598, -2.553945, 1, 1, 1, 1, 1,
-1.370448, 0.180254, -1.260714, 1, 1, 1, 1, 1,
-1.36887, -0.03228356, -1.492197, 1, 1, 1, 1, 1,
-1.356149, -0.2044633, -2.552273, 1, 1, 1, 1, 1,
-1.355042, 1.218241, -0.2557292, 1, 1, 1, 1, 1,
-1.353536, -0.8157365, -2.339774, 1, 1, 1, 1, 1,
-1.342472, 0.7204806, -1.90167, 1, 1, 1, 1, 1,
-1.340472, 2.150257, 0.2048657, 1, 1, 1, 1, 1,
-1.325841, -0.532776, -1.417706, 1, 1, 1, 1, 1,
-1.321511, 0.1742302, -0.9313868, 1, 1, 1, 1, 1,
-1.310664, 0.2247509, -0.6200967, 0, 0, 1, 1, 1,
-1.306548, -2.00228, -1.295417, 1, 0, 0, 1, 1,
-1.30428, -1.467999, -2.972194, 1, 0, 0, 1, 1,
-1.283228, -0.004396927, -0.4830936, 1, 0, 0, 1, 1,
-1.267241, 0.3408849, -1.832691, 1, 0, 0, 1, 1,
-1.266316, 0.995576, -0.5213528, 1, 0, 0, 1, 1,
-1.261154, 1.700539, 0.4273884, 0, 0, 0, 1, 1,
-1.255006, -0.4982205, -4.464382, 0, 0, 0, 1, 1,
-1.243481, -0.4631192, -1.377328, 0, 0, 0, 1, 1,
-1.240431, -1.294526, -1.306779, 0, 0, 0, 1, 1,
-1.234881, 0.3574729, -2.695097, 0, 0, 0, 1, 1,
-1.230108, 0.763509, -3.144905, 0, 0, 0, 1, 1,
-1.228579, -1.120749, -2.987952, 0, 0, 0, 1, 1,
-1.224258, -0.8477815, -1.993421, 1, 1, 1, 1, 1,
-1.222283, 0.3603814, 0.3267977, 1, 1, 1, 1, 1,
-1.222227, -1.061671, -1.469142, 1, 1, 1, 1, 1,
-1.218754, -0.1145163, -1.74383, 1, 1, 1, 1, 1,
-1.21736, -0.8702161, -0.3418787, 1, 1, 1, 1, 1,
-1.213857, 0.4954177, -2.010759, 1, 1, 1, 1, 1,
-1.211674, 0.2497956, -2.431618, 1, 1, 1, 1, 1,
-1.211274, -1.740877, -1.431534, 1, 1, 1, 1, 1,
-1.208378, 0.3711502, -2.391211, 1, 1, 1, 1, 1,
-1.207368, 0.001424931, -2.425835, 1, 1, 1, 1, 1,
-1.192165, -1.609865, -4.442125, 1, 1, 1, 1, 1,
-1.176278, -1.553487, -2.28984, 1, 1, 1, 1, 1,
-1.163523, 1.348235, 0.02593691, 1, 1, 1, 1, 1,
-1.154468, 0.1340406, -0.874915, 1, 1, 1, 1, 1,
-1.146669, -1.122247, -3.843544, 1, 1, 1, 1, 1,
-1.14329, 0.2345571, -1.824029, 0, 0, 1, 1, 1,
-1.139461, 1.832724, -0.8924004, 1, 0, 0, 1, 1,
-1.128094, -1.339326, -3.354181, 1, 0, 0, 1, 1,
-1.127345, 1.876173, -0.03741319, 1, 0, 0, 1, 1,
-1.114586, 1.551166, -0.7695251, 1, 0, 0, 1, 1,
-1.108404, 0.5875852, -1.666496, 1, 0, 0, 1, 1,
-1.104625, -2.110643, -3.865523, 0, 0, 0, 1, 1,
-1.104531, 0.7407404, -1.414973, 0, 0, 0, 1, 1,
-1.099678, -0.6371968, -1.828047, 0, 0, 0, 1, 1,
-1.096738, -0.6322451, -2.739393, 0, 0, 0, 1, 1,
-1.087999, 0.1849509, -1.378916, 0, 0, 0, 1, 1,
-1.070284, -0.6500189, -2.78439, 0, 0, 0, 1, 1,
-1.067595, 0.6090456, -0.4340939, 0, 0, 0, 1, 1,
-1.067054, -0.2474206, -2.763013, 1, 1, 1, 1, 1,
-1.067016, 0.5452375, -0.3857093, 1, 1, 1, 1, 1,
-1.064513, -0.9322182, -1.145699, 1, 1, 1, 1, 1,
-1.063985, 1.316316, -0.7792283, 1, 1, 1, 1, 1,
-1.060138, 0.9186602, -0.4449068, 1, 1, 1, 1, 1,
-1.058973, 1.288352, 0.5087838, 1, 1, 1, 1, 1,
-1.054637, -0.2413023, -2.305384, 1, 1, 1, 1, 1,
-1.054371, -1.443368, -1.485927, 1, 1, 1, 1, 1,
-1.05431, -1.194836, -2.964487, 1, 1, 1, 1, 1,
-1.037516, -1.527229, -2.392113, 1, 1, 1, 1, 1,
-1.03362, -1.591278, -3.322289, 1, 1, 1, 1, 1,
-1.029456, 0.1172785, -1.706576, 1, 1, 1, 1, 1,
-1.025431, 1.087341, -0.6657479, 1, 1, 1, 1, 1,
-1.025335, -1.012784, -3.326462, 1, 1, 1, 1, 1,
-1.02157, 0.1826539, 0.03758974, 1, 1, 1, 1, 1,
-1.013491, 1.415395, -1.078135, 0, 0, 1, 1, 1,
-1.009151, -1.173105, -1.127394, 1, 0, 0, 1, 1,
-1.005199, -1.046894, -3.558318, 1, 0, 0, 1, 1,
-1.004205, 0.929931, 1.832057, 1, 0, 0, 1, 1,
-1.003945, 0.8140768, 0.1413487, 1, 0, 0, 1, 1,
-1.001858, 0.7627697, 0.1383125, 1, 0, 0, 1, 1,
-0.9970164, 0.8626742, -2.081936, 0, 0, 0, 1, 1,
-0.996087, -0.09448279, -1.712087, 0, 0, 0, 1, 1,
-0.989494, -0.5580424, -1.657306, 0, 0, 0, 1, 1,
-0.9845793, 0.7495297, 0.5969951, 0, 0, 0, 1, 1,
-0.9829036, 1.095072, -0.7670066, 0, 0, 0, 1, 1,
-0.980063, 0.9868265, 0.9210339, 0, 0, 0, 1, 1,
-0.9795416, 1.021772, 1.153653, 0, 0, 0, 1, 1,
-0.9792995, -0.2983828, -3.414509, 1, 1, 1, 1, 1,
-0.9773418, 0.2877969, 0.05442795, 1, 1, 1, 1, 1,
-0.9770809, 0.1832094, -1.220118, 1, 1, 1, 1, 1,
-0.9754878, -2.311794, -2.144717, 1, 1, 1, 1, 1,
-0.9678616, -1.015708, -2.555148, 1, 1, 1, 1, 1,
-0.9633808, 1.453843, 0.1458097, 1, 1, 1, 1, 1,
-0.9471282, -0.1920533, -2.590584, 1, 1, 1, 1, 1,
-0.9450422, -1.492182, -1.710803, 1, 1, 1, 1, 1,
-0.9435776, 0.3085709, -1.646657, 1, 1, 1, 1, 1,
-0.9426662, 1.357455, 0.7488801, 1, 1, 1, 1, 1,
-0.9336284, 0.2381723, -1.574697, 1, 1, 1, 1, 1,
-0.9248169, -1.663285, -3.508374, 1, 1, 1, 1, 1,
-0.921939, 1.493477, -1.674055, 1, 1, 1, 1, 1,
-0.9174501, 0.9922379, -1.246177, 1, 1, 1, 1, 1,
-0.9142114, 0.5390822, 0.3614088, 1, 1, 1, 1, 1,
-0.9123615, -2.294128, -2.528068, 0, 0, 1, 1, 1,
-0.9117793, 0.82468, -0.6585262, 1, 0, 0, 1, 1,
-0.9077085, 1.962675, -0.3526671, 1, 0, 0, 1, 1,
-0.9063669, 2.210241, 0.9268051, 1, 0, 0, 1, 1,
-0.9050159, 0.4574442, 0.6769369, 1, 0, 0, 1, 1,
-0.9022512, -1.466771, -2.187234, 1, 0, 0, 1, 1,
-0.8918396, -2.171517, -4.842875, 0, 0, 0, 1, 1,
-0.8832666, -0.01882766, -0.4785275, 0, 0, 0, 1, 1,
-0.8777663, -0.5006542, -4.423602, 0, 0, 0, 1, 1,
-0.8748918, 0.4325437, -0.6467973, 0, 0, 0, 1, 1,
-0.8733109, -0.5719565, -1.806525, 0, 0, 0, 1, 1,
-0.8692496, -0.3545418, -3.308797, 0, 0, 0, 1, 1,
-0.8614473, 1.154117, -2.010808, 0, 0, 0, 1, 1,
-0.8583632, -0.8122996, -1.392294, 1, 1, 1, 1, 1,
-0.8575715, 0.1384158, -1.940017, 1, 1, 1, 1, 1,
-0.8558893, -0.2614933, -2.064281, 1, 1, 1, 1, 1,
-0.8546205, -1.231504, -3.444336, 1, 1, 1, 1, 1,
-0.8426971, 0.1013033, -0.6030322, 1, 1, 1, 1, 1,
-0.8348358, 0.1409186, -0.2589518, 1, 1, 1, 1, 1,
-0.8309743, 1.680056, 1.062547, 1, 1, 1, 1, 1,
-0.8302991, -0.1039465, -2.079754, 1, 1, 1, 1, 1,
-0.8247162, -0.4249529, -3.061263, 1, 1, 1, 1, 1,
-0.8236597, -1.21411, -3.410594, 1, 1, 1, 1, 1,
-0.818489, 0.2260142, -2.703219, 1, 1, 1, 1, 1,
-0.8133909, -0.9593217, -3.9574, 1, 1, 1, 1, 1,
-0.812049, 1.706436, -0.5035862, 1, 1, 1, 1, 1,
-0.8113304, -0.7885052, -1.661144, 1, 1, 1, 1, 1,
-0.8085914, 1.038259, -0.6972398, 1, 1, 1, 1, 1,
-0.8049484, -1.432266, -3.531767, 0, 0, 1, 1, 1,
-0.8031587, 1.880156, -2.488688, 1, 0, 0, 1, 1,
-0.8025263, 0.6590492, 0.3906121, 1, 0, 0, 1, 1,
-0.8004498, -1.955786, -2.041154, 1, 0, 0, 1, 1,
-0.7987145, 0.1345113, -2.333076, 1, 0, 0, 1, 1,
-0.7958747, -0.8224795, -2.970108, 1, 0, 0, 1, 1,
-0.7923192, -0.08203849, -2.44046, 0, 0, 0, 1, 1,
-0.7898168, 0.2869492, 1.709918, 0, 0, 0, 1, 1,
-0.7858601, -1.186008, -1.042261, 0, 0, 0, 1, 1,
-0.7849331, 0.673901, 1.887026, 0, 0, 0, 1, 1,
-0.784431, 0.06184587, -1.307587, 0, 0, 0, 1, 1,
-0.7732507, 0.4524591, -1.872544, 0, 0, 0, 1, 1,
-0.7672534, 1.212672, 0.09893236, 0, 0, 0, 1, 1,
-0.759858, 0.6999228, -0.5272501, 1, 1, 1, 1, 1,
-0.7539786, -0.2672573, -2.001802, 1, 1, 1, 1, 1,
-0.7532652, -0.0880116, -1.212105, 1, 1, 1, 1, 1,
-0.7521414, -2.674825, -2.50802, 1, 1, 1, 1, 1,
-0.7521135, 0.6781968, -0.2666598, 1, 1, 1, 1, 1,
-0.7501439, -0.2308528, -2.198579, 1, 1, 1, 1, 1,
-0.7457089, 0.08744784, -2.330283, 1, 1, 1, 1, 1,
-0.7366914, -0.9942812, -3.282427, 1, 1, 1, 1, 1,
-0.7324488, -1.099688, -1.865331, 1, 1, 1, 1, 1,
-0.7232819, 1.725725, -2.616385, 1, 1, 1, 1, 1,
-0.7228201, -0.5260468, -1.009813, 1, 1, 1, 1, 1,
-0.7207435, -0.2713032, -2.435187, 1, 1, 1, 1, 1,
-0.7194154, -0.5388094, -3.35589, 1, 1, 1, 1, 1,
-0.7156136, -0.0720155, -3.381372, 1, 1, 1, 1, 1,
-0.7131695, -1.384825, -4.716223, 1, 1, 1, 1, 1,
-0.7100106, -0.8635895, -3.367689, 0, 0, 1, 1, 1,
-0.7099554, -0.2623146, -0.004399581, 1, 0, 0, 1, 1,
-0.7082835, -1.379911, -1.2654, 1, 0, 0, 1, 1,
-0.7042874, 0.4283551, 0.3909015, 1, 0, 0, 1, 1,
-0.7035222, -1.567701, -2.962411, 1, 0, 0, 1, 1,
-0.6984903, 0.7084323, -0.8783922, 1, 0, 0, 1, 1,
-0.6952928, -0.6554695, -3.877737, 0, 0, 0, 1, 1,
-0.6895278, 2.034525, -0.3002293, 0, 0, 0, 1, 1,
-0.6846633, -1.036166, -3.140398, 0, 0, 0, 1, 1,
-0.6792718, -0.09190813, -3.540916, 0, 0, 0, 1, 1,
-0.6740031, 0.2716062, 0.09389441, 0, 0, 0, 1, 1,
-0.6720023, 0.6971377, -2.493438, 0, 0, 0, 1, 1,
-0.6706543, -1.155066, -2.949989, 0, 0, 0, 1, 1,
-0.6651166, 1.431339, -1.358189, 1, 1, 1, 1, 1,
-0.6640452, 1.632264, -0.1183083, 1, 1, 1, 1, 1,
-0.6640043, 1.113943, -1.839351, 1, 1, 1, 1, 1,
-0.6615432, 0.6568338, -2.270192, 1, 1, 1, 1, 1,
-0.6575787, -0.7065306, -1.29073, 1, 1, 1, 1, 1,
-0.653299, 2.132852, -0.6674218, 1, 1, 1, 1, 1,
-0.6529867, 1.47078, -0.1322585, 1, 1, 1, 1, 1,
-0.6506472, 1.050295, -0.2941552, 1, 1, 1, 1, 1,
-0.6496925, 0.02212738, -2.274518, 1, 1, 1, 1, 1,
-0.6465988, -1.417082, -1.126141, 1, 1, 1, 1, 1,
-0.6450725, -0.4282966, -4.460567, 1, 1, 1, 1, 1,
-0.6440198, -1.064482, -4.166952, 1, 1, 1, 1, 1,
-0.6392859, 0.4229843, -0.05634379, 1, 1, 1, 1, 1,
-0.6368017, -0.4734468, -2.81604, 1, 1, 1, 1, 1,
-0.6356715, 0.09732217, -0.2556853, 1, 1, 1, 1, 1,
-0.6352631, -0.03113799, -0.8144681, 0, 0, 1, 1, 1,
-0.6329489, 0.5374449, -2.571494, 1, 0, 0, 1, 1,
-0.6138042, 1.875548, 0.216131, 1, 0, 0, 1, 1,
-0.6075844, -1.935407, -1.460524, 1, 0, 0, 1, 1,
-0.6015872, -1.121248, -2.916888, 1, 0, 0, 1, 1,
-0.6015121, -1.180668, -1.548568, 1, 0, 0, 1, 1,
-0.6001861, 0.9856519, -0.2174609, 0, 0, 0, 1, 1,
-0.5997005, -1.281716, -2.553433, 0, 0, 0, 1, 1,
-0.5989359, 0.3448115, -2.400024, 0, 0, 0, 1, 1,
-0.5983029, -0.2199202, -1.761796, 0, 0, 0, 1, 1,
-0.5952095, 0.2179436, -0.9743024, 0, 0, 0, 1, 1,
-0.5941851, -1.232036, -3.193036, 0, 0, 0, 1, 1,
-0.5900719, 0.3060142, -2.281004, 0, 0, 0, 1, 1,
-0.5876835, 1.088708, 0.2812178, 1, 1, 1, 1, 1,
-0.5850555, 0.3306924, -0.5870563, 1, 1, 1, 1, 1,
-0.5752435, 0.01597475, 0.001382746, 1, 1, 1, 1, 1,
-0.5659503, -1.091018, -3.405608, 1, 1, 1, 1, 1,
-0.5612224, -1.43071, -2.425254, 1, 1, 1, 1, 1,
-0.553035, 0.1120519, -3.307286, 1, 1, 1, 1, 1,
-0.5523719, 2.424852, 1.034523, 1, 1, 1, 1, 1,
-0.5487496, -0.1675417, -0.966724, 1, 1, 1, 1, 1,
-0.5479802, 0.6486636, 0.8889032, 1, 1, 1, 1, 1,
-0.5455463, 0.3647878, -0.4550124, 1, 1, 1, 1, 1,
-0.544416, 0.5763499, 0.1806129, 1, 1, 1, 1, 1,
-0.5432588, -0.1495376, -0.2261416, 1, 1, 1, 1, 1,
-0.5400829, 0.9431418, 1.588523, 1, 1, 1, 1, 1,
-0.5396807, -0.03492866, -1.29928, 1, 1, 1, 1, 1,
-0.5337856, 0.4339342, 0.6534221, 1, 1, 1, 1, 1,
-0.5333921, -1.731943, -3.315489, 0, 0, 1, 1, 1,
-0.5258167, 0.5923805, -0.1855251, 1, 0, 0, 1, 1,
-0.5238532, 0.03836631, -1.26932, 1, 0, 0, 1, 1,
-0.5214723, -1.553685, -2.942915, 1, 0, 0, 1, 1,
-0.5203494, -1.181888, -4.283706, 1, 0, 0, 1, 1,
-0.5187721, 0.4812524, -1.574858, 1, 0, 0, 1, 1,
-0.5176412, -0.932526, -2.048454, 0, 0, 0, 1, 1,
-0.5157504, 0.8819107, -1.042811, 0, 0, 0, 1, 1,
-0.5121989, 0.9077356, -1.23654, 0, 0, 0, 1, 1,
-0.5081707, 1.991793, -0.8145598, 0, 0, 0, 1, 1,
-0.5067663, -1.189538, -3.439579, 0, 0, 0, 1, 1,
-0.5033375, 0.01681411, -2.643338, 0, 0, 0, 1, 1,
-0.5029621, 0.484414, 0.9062405, 0, 0, 0, 1, 1,
-0.4968558, 0.2658947, 0.6095027, 1, 1, 1, 1, 1,
-0.4956365, -0.9401265, -2.117862, 1, 1, 1, 1, 1,
-0.4937454, -1.009681, -2.701546, 1, 1, 1, 1, 1,
-0.4933226, -1.340322, -3.32942, 1, 1, 1, 1, 1,
-0.4919857, 0.5364411, -0.1521121, 1, 1, 1, 1, 1,
-0.4916688, -0.6922673, -3.282772, 1, 1, 1, 1, 1,
-0.487444, -0.1664486, -2.484836, 1, 1, 1, 1, 1,
-0.4863173, -0.8003097, -2.984867, 1, 1, 1, 1, 1,
-0.4863113, 0.1299549, -1.483636, 1, 1, 1, 1, 1,
-0.4812915, 0.4000021, 0.7395442, 1, 1, 1, 1, 1,
-0.4809698, 0.2109073, -0.703994, 1, 1, 1, 1, 1,
-0.4778848, -1.256877, -2.597326, 1, 1, 1, 1, 1,
-0.4772615, 2.52287, 1.421451, 1, 1, 1, 1, 1,
-0.4754508, -0.7737197, -1.188943, 1, 1, 1, 1, 1,
-0.4737308, -0.8813479, -1.191454, 1, 1, 1, 1, 1,
-0.4736812, 1.295944, -0.9184294, 0, 0, 1, 1, 1,
-0.4677019, -1.64555, -2.699243, 1, 0, 0, 1, 1,
-0.4659238, 0.1694396, -2.864071, 1, 0, 0, 1, 1,
-0.4659203, -0.7556978, -3.615319, 1, 0, 0, 1, 1,
-0.4639973, -0.6827111, -2.23175, 1, 0, 0, 1, 1,
-0.462377, -0.9517046, -3.246876, 1, 0, 0, 1, 1,
-0.4619182, -0.7264107, -2.410983, 0, 0, 0, 1, 1,
-0.4615442, -0.344465, -3.20022, 0, 0, 0, 1, 1,
-0.4488177, -1.050377, -2.046097, 0, 0, 0, 1, 1,
-0.4486423, 2.416698, 0.3899325, 0, 0, 0, 1, 1,
-0.4483229, -0.8401326, -1.93574, 0, 0, 0, 1, 1,
-0.4478288, 1.03742, -2.320302, 0, 0, 0, 1, 1,
-0.4371604, -1.078031, -1.631294, 0, 0, 0, 1, 1,
-0.4365019, 0.4183387, 0.354966, 1, 1, 1, 1, 1,
-0.4346893, -0.4365789, -3.609686, 1, 1, 1, 1, 1,
-0.4326176, 0.1584025, -1.485661, 1, 1, 1, 1, 1,
-0.4243795, 1.304256, -0.1153611, 1, 1, 1, 1, 1,
-0.4228703, -0.9043806, -4.047178, 1, 1, 1, 1, 1,
-0.4205918, -0.4142726, -2.804562, 1, 1, 1, 1, 1,
-0.419985, 0.9486453, 1.400411, 1, 1, 1, 1, 1,
-0.419928, 1.754107, -0.6315826, 1, 1, 1, 1, 1,
-0.4196662, -0.2963353, -2.515044, 1, 1, 1, 1, 1,
-0.4104626, 1.992201, -0.3981328, 1, 1, 1, 1, 1,
-0.3960835, -0.9857484, -3.846787, 1, 1, 1, 1, 1,
-0.3943876, -2.821076, -3.228357, 1, 1, 1, 1, 1,
-0.3922741, 0.1588388, -0.7376752, 1, 1, 1, 1, 1,
-0.3901786, -1.938036, -1.669596, 1, 1, 1, 1, 1,
-0.3883582, 0.1029124, 0.491246, 1, 1, 1, 1, 1,
-0.3868219, 1.098638, -0.3458855, 0, 0, 1, 1, 1,
-0.3736232, 0.6962482, -0.4812383, 1, 0, 0, 1, 1,
-0.3709247, 2.910954, 1.152554, 1, 0, 0, 1, 1,
-0.3674233, -0.2304834, -1.219183, 1, 0, 0, 1, 1,
-0.3673607, 0.3569795, -1.708834, 1, 0, 0, 1, 1,
-0.3670249, -1.439992, -2.456857, 1, 0, 0, 1, 1,
-0.3649065, -0.6179464, -2.829327, 0, 0, 0, 1, 1,
-0.3558397, -0.229751, -0.9277594, 0, 0, 0, 1, 1,
-0.3542591, 0.01515513, -2.175038, 0, 0, 0, 1, 1,
-0.3522005, -0.02137461, -1.49794, 0, 0, 0, 1, 1,
-0.3521475, 1.068411, -1.723213, 0, 0, 0, 1, 1,
-0.3498186, 0.7051637, -0.2731692, 0, 0, 0, 1, 1,
-0.3482566, -1.098484, -2.52156, 0, 0, 0, 1, 1,
-0.3472998, 0.971917, 0.2452886, 1, 1, 1, 1, 1,
-0.3460436, 0.9564512, 0.2049744, 1, 1, 1, 1, 1,
-0.3358116, -1.701813, -3.758388, 1, 1, 1, 1, 1,
-0.3313376, 0.5005912, -1.055846, 1, 1, 1, 1, 1,
-0.3311208, 2.10433, -0.5564438, 1, 1, 1, 1, 1,
-0.3308516, -0.4757927, -2.080378, 1, 1, 1, 1, 1,
-0.330789, -1.188292, -1.410469, 1, 1, 1, 1, 1,
-0.3255331, 0.1714176, -2.767497, 1, 1, 1, 1, 1,
-0.3223417, 0.5672561, -1.715775, 1, 1, 1, 1, 1,
-0.3148533, 0.270605, -1.930092, 1, 1, 1, 1, 1,
-0.3106342, -1.45186, -2.405346, 1, 1, 1, 1, 1,
-0.3098271, -0.8255266, -2.694648, 1, 1, 1, 1, 1,
-0.3010729, 0.9203181, -2.160289, 1, 1, 1, 1, 1,
-0.3001772, -1.296576, -1.126779, 1, 1, 1, 1, 1,
-0.2994392, 1.076749, -2.461347, 1, 1, 1, 1, 1,
-0.2983415, 0.2790937, -1.259823, 0, 0, 1, 1, 1,
-0.2968645, -1.110217, -3.673976, 1, 0, 0, 1, 1,
-0.2915685, -0.2309749, -2.894867, 1, 0, 0, 1, 1,
-0.2909297, 0.03520808, -1.698049, 1, 0, 0, 1, 1,
-0.290878, 0.1279691, -0.7584673, 1, 0, 0, 1, 1,
-0.2902239, -0.6946483, -0.2401431, 1, 0, 0, 1, 1,
-0.2884575, -0.545471, -5.043623, 0, 0, 0, 1, 1,
-0.2818116, 1.712944, 0.1210917, 0, 0, 0, 1, 1,
-0.2785387, 1.423127, 0.2640841, 0, 0, 0, 1, 1,
-0.2769993, -0.7097427, -4.074041, 0, 0, 0, 1, 1,
-0.2735981, 1.394758, -0.2889057, 0, 0, 0, 1, 1,
-0.2677137, 0.6164752, 0.5571644, 0, 0, 0, 1, 1,
-0.2650985, 0.3080798, 1.420621, 0, 0, 0, 1, 1,
-0.2623499, -0.6986786, -3.545836, 1, 1, 1, 1, 1,
-0.2613926, 1.172113, -0.8425086, 1, 1, 1, 1, 1,
-0.2601705, -1.382429, -3.544502, 1, 1, 1, 1, 1,
-0.2598848, -0.5043503, -2.663297, 1, 1, 1, 1, 1,
-0.2597963, 0.1549595, -2.245462, 1, 1, 1, 1, 1,
-0.2536103, -1.061686, -3.785189, 1, 1, 1, 1, 1,
-0.2513271, 0.9851089, 0.7192371, 1, 1, 1, 1, 1,
-0.2483452, -0.1513542, -2.904615, 1, 1, 1, 1, 1,
-0.2475746, -0.4256169, -0.940194, 1, 1, 1, 1, 1,
-0.2388753, 1.216966, -1.094164, 1, 1, 1, 1, 1,
-0.2373834, -0.04235846, -1.067349, 1, 1, 1, 1, 1,
-0.2350321, 0.1422168, -1.209794, 1, 1, 1, 1, 1,
-0.2333025, 1.915663, -0.244978, 1, 1, 1, 1, 1,
-0.2283971, 0.1511046, -2.55406, 1, 1, 1, 1, 1,
-0.2281926, -0.639882, -2.464143, 1, 1, 1, 1, 1,
-0.2232316, -1.581355, -4.929255, 0, 0, 1, 1, 1,
-0.2225842, -0.3311653, -4.665479, 1, 0, 0, 1, 1,
-0.2218296, -2.00691, -1.714963, 1, 0, 0, 1, 1,
-0.2218292, 1.238697, 0.501931, 1, 0, 0, 1, 1,
-0.2212675, 0.3043884, -1.990238, 1, 0, 0, 1, 1,
-0.2196711, 0.5118352, -0.04172132, 1, 0, 0, 1, 1,
-0.218569, -0.5792994, -2.799089, 0, 0, 0, 1, 1,
-0.2162633, -0.2732031, -1.107167, 0, 0, 0, 1, 1,
-0.2123682, 0.4204479, -1.701757, 0, 0, 0, 1, 1,
-0.2101979, -1.566857, -2.586222, 0, 0, 0, 1, 1,
-0.2044847, 0.8608883, 2.876656, 0, 0, 0, 1, 1,
-0.2020376, 1.577174, -1.594532, 0, 0, 0, 1, 1,
-0.196969, -0.5373675, -3.692653, 0, 0, 0, 1, 1,
-0.1950191, 0.3930405, -1.013837, 1, 1, 1, 1, 1,
-0.1944729, 0.1077588, -1.436426, 1, 1, 1, 1, 1,
-0.1897316, -1.035556, -2.349039, 1, 1, 1, 1, 1,
-0.1853486, 0.5001607, -1.455768, 1, 1, 1, 1, 1,
-0.1824205, 0.7185627, -2.523273, 1, 1, 1, 1, 1,
-0.1772411, 0.1556958, 0.1422433, 1, 1, 1, 1, 1,
-0.1756312, -0.8624132, -2.793343, 1, 1, 1, 1, 1,
-0.1710768, 0.135344, -1.532517, 1, 1, 1, 1, 1,
-0.1697059, 0.7117499, -0.4360356, 1, 1, 1, 1, 1,
-0.1688408, 0.8125007, 0.5848988, 1, 1, 1, 1, 1,
-0.1628819, 0.6027408, 0.3338098, 1, 1, 1, 1, 1,
-0.1590542, -0.6209321, -2.496635, 1, 1, 1, 1, 1,
-0.1586042, -0.3072175, -2.045706, 1, 1, 1, 1, 1,
-0.1584317, -0.1238651, -2.114864, 1, 1, 1, 1, 1,
-0.15783, -0.741388, -4.184447, 1, 1, 1, 1, 1,
-0.1558867, -1.117473, -4.624491, 0, 0, 1, 1, 1,
-0.1508482, 2.553102, 0.763952, 1, 0, 0, 1, 1,
-0.1507235, 1.033207, 1.374192, 1, 0, 0, 1, 1,
-0.150706, 0.2251864, 0.4870234, 1, 0, 0, 1, 1,
-0.1482343, -0.8874048, -1.801616, 1, 0, 0, 1, 1,
-0.1440641, -0.863807, -3.863337, 1, 0, 0, 1, 1,
-0.1397185, 0.7086884, -0.5927436, 0, 0, 0, 1, 1,
-0.1393277, -0.8159862, -2.267709, 0, 0, 0, 1, 1,
-0.1381208, -0.2299901, -3.275306, 0, 0, 0, 1, 1,
-0.1378082, 0.669662, 0.1122102, 0, 0, 0, 1, 1,
-0.1360955, -0.2576864, -3.174527, 0, 0, 0, 1, 1,
-0.1323439, 1.339808, -0.1298412, 0, 0, 0, 1, 1,
-0.1307441, 0.1901173, 0.675006, 0, 0, 0, 1, 1,
-0.1280444, -1.183943, -3.263663, 1, 1, 1, 1, 1,
-0.1252357, -0.8386257, -3.669608, 1, 1, 1, 1, 1,
-0.1248454, -1.631987, -3.249603, 1, 1, 1, 1, 1,
-0.119774, 0.3558838, -1.145489, 1, 1, 1, 1, 1,
-0.1189848, 0.2083516, 0.4306213, 1, 1, 1, 1, 1,
-0.1188194, -1.627638, -1.780659, 1, 1, 1, 1, 1,
-0.1187482, 1.656717, 0.9839442, 1, 1, 1, 1, 1,
-0.1182943, 0.377235, -2.787592, 1, 1, 1, 1, 1,
-0.1170385, 0.02961031, -4.323463, 1, 1, 1, 1, 1,
-0.1123715, -0.4847139, -0.8875654, 1, 1, 1, 1, 1,
-0.1120055, -0.4099529, -2.137149, 1, 1, 1, 1, 1,
-0.1096451, 2.014307, 1.588425, 1, 1, 1, 1, 1,
-0.09995522, -1.248822, -3.445168, 1, 1, 1, 1, 1,
-0.09856463, 1.308925, -0.1294839, 1, 1, 1, 1, 1,
-0.09816239, -0.5440009, -3.342662, 1, 1, 1, 1, 1,
-0.09480085, -0.7976441, -2.324167, 0, 0, 1, 1, 1,
-0.09258843, -1.11228, -3.864746, 1, 0, 0, 1, 1,
-0.08846986, 1.942523, -0.4235801, 1, 0, 0, 1, 1,
-0.08520547, 0.4217466, 0.1353714, 1, 0, 0, 1, 1,
-0.0842756, 0.4369755, -0.9605423, 1, 0, 0, 1, 1,
-0.08200502, -0.2406319, -2.64921, 1, 0, 0, 1, 1,
-0.06942052, 0.3826322, -0.1917343, 0, 0, 0, 1, 1,
-0.06351501, -0.106199, -1.831796, 0, 0, 0, 1, 1,
-0.05749103, 1.053817, 0.7076064, 0, 0, 0, 1, 1,
-0.05138772, 1.427429, -0.4959058, 0, 0, 0, 1, 1,
-0.05115667, 0.1897089, -0.2081988, 0, 0, 0, 1, 1,
-0.04915934, -2.214009, -3.278075, 0, 0, 0, 1, 1,
-0.04819853, -0.4337095, -3.302151, 0, 0, 0, 1, 1,
-0.04311872, -0.0947542, -2.415241, 1, 1, 1, 1, 1,
-0.04216937, -0.8205618, -4.111064, 1, 1, 1, 1, 1,
-0.04125816, -1.340872, -3.582375, 1, 1, 1, 1, 1,
-0.04039955, 1.811234, -1.565351, 1, 1, 1, 1, 1,
-0.03886412, -1.205232, -3.424025, 1, 1, 1, 1, 1,
-0.0364177, 0.7793299, -1.078038, 1, 1, 1, 1, 1,
-0.03412357, -0.09581164, -2.956517, 1, 1, 1, 1, 1,
-0.03394516, -1.909087, -5.754894, 1, 1, 1, 1, 1,
-0.03141288, -0.703145, -4.708743, 1, 1, 1, 1, 1,
-0.03011964, -1.092273, -3.497784, 1, 1, 1, 1, 1,
-0.02781118, -0.9412193, -3.100626, 1, 1, 1, 1, 1,
-0.02732721, -1.328433, -1.575914, 1, 1, 1, 1, 1,
-0.02221865, -0.8314444, -5.274752, 1, 1, 1, 1, 1,
-0.02155504, 0.4312953, -0.00464672, 1, 1, 1, 1, 1,
-0.01985918, 0.4987089, -0.1629805, 1, 1, 1, 1, 1,
-0.01269979, -0.5455933, -2.596815, 0, 0, 1, 1, 1,
-0.01118337, -1.216646, -2.675849, 1, 0, 0, 1, 1,
-0.01096382, 0.6309961, 0.8494421, 1, 0, 0, 1, 1,
-0.005830113, -0.6596702, -2.701241, 1, 0, 0, 1, 1,
-0.005630405, 0.2016816, 0.6029625, 1, 0, 0, 1, 1,
-0.004501412, -1.157753, -0.4634086, 1, 0, 0, 1, 1,
0.0009215573, 0.6025813, -0.2678326, 0, 0, 0, 1, 1,
0.001522222, -0.6772985, 2.868063, 0, 0, 0, 1, 1,
0.00285147, -0.5101918, 5.149445, 0, 0, 0, 1, 1,
0.006752802, -0.6047845, 2.572852, 0, 0, 0, 1, 1,
0.006828516, -0.4845358, 4.240329, 0, 0, 0, 1, 1,
0.00820843, -0.2563145, 3.572993, 0, 0, 0, 1, 1,
0.01187199, -0.7476491, 2.625772, 0, 0, 0, 1, 1,
0.0126027, -1.723522, 3.277925, 1, 1, 1, 1, 1,
0.01275663, 0.6125509, -1.78455, 1, 1, 1, 1, 1,
0.01439134, -0.1697228, 4.402416, 1, 1, 1, 1, 1,
0.01752217, -1.407615, 1.624754, 1, 1, 1, 1, 1,
0.01949332, -1.134261, 3.989272, 1, 1, 1, 1, 1,
0.02584912, -0.0040814, 0.8997905, 1, 1, 1, 1, 1,
0.03453172, -0.1834866, 2.308322, 1, 1, 1, 1, 1,
0.04480005, -0.1191086, 1.540348, 1, 1, 1, 1, 1,
0.04646066, -1.203341, 3.514973, 1, 1, 1, 1, 1,
0.05521451, -1.474992, 4.657664, 1, 1, 1, 1, 1,
0.0555081, 0.5460253, -0.999364, 1, 1, 1, 1, 1,
0.05785561, -0.2044808, 2.571812, 1, 1, 1, 1, 1,
0.06205024, -0.1590013, 2.936754, 1, 1, 1, 1, 1,
0.07272436, -0.4975501, 4.127019, 1, 1, 1, 1, 1,
0.07345387, 0.06145256, 1.315332, 1, 1, 1, 1, 1,
0.07345629, 0.4246836, 0.7895042, 0, 0, 1, 1, 1,
0.0746275, 0.9322786, 1.876194, 1, 0, 0, 1, 1,
0.07712344, -0.7018939, 1.825045, 1, 0, 0, 1, 1,
0.07744566, 0.586771, 1.226281, 1, 0, 0, 1, 1,
0.08219891, -0.9931804, 2.468297, 1, 0, 0, 1, 1,
0.08226547, -1.610997, 2.858433, 1, 0, 0, 1, 1,
0.08433247, -2.968626, 4.219347, 0, 0, 0, 1, 1,
0.08482531, 0.4187909, -1.532155, 0, 0, 0, 1, 1,
0.08531953, 0.04608794, 1.727601, 0, 0, 0, 1, 1,
0.08651767, 1.721717, 2.239964, 0, 0, 0, 1, 1,
0.08767575, 2.893419, 1.856551, 0, 0, 0, 1, 1,
0.08816443, -2.695467, 4.352478, 0, 0, 0, 1, 1,
0.08919678, -0.2812214, 2.831964, 0, 0, 0, 1, 1,
0.09259224, -1.105237, 2.662032, 1, 1, 1, 1, 1,
0.09312382, -0.9965668, 3.078071, 1, 1, 1, 1, 1,
0.09934051, -0.3516017, 2.556845, 1, 1, 1, 1, 1,
0.09960984, -0.5823205, 3.156437, 1, 1, 1, 1, 1,
0.1001264, -1.653376, 2.996283, 1, 1, 1, 1, 1,
0.103246, 0.3179931, 0.01343593, 1, 1, 1, 1, 1,
0.1091722, 1.657695, -0.6354091, 1, 1, 1, 1, 1,
0.1146486, -0.06568286, 4.091298, 1, 1, 1, 1, 1,
0.1167551, 0.6798528, 0.4416295, 1, 1, 1, 1, 1,
0.1174785, -1.265756, 2.852062, 1, 1, 1, 1, 1,
0.1197692, 0.3122735, 2.524028, 1, 1, 1, 1, 1,
0.1217894, -0.07969568, 2.198163, 1, 1, 1, 1, 1,
0.1234624, -0.3093548, 2.958241, 1, 1, 1, 1, 1,
0.1245634, -0.7425395, 2.833748, 1, 1, 1, 1, 1,
0.1250424, -0.6024005, 3.116416, 1, 1, 1, 1, 1,
0.1257538, 0.986153, -0.7203857, 0, 0, 1, 1, 1,
0.1276803, -0.6275206, 3.052374, 1, 0, 0, 1, 1,
0.1282244, -0.5517903, 2.746682, 1, 0, 0, 1, 1,
0.1301536, -0.8877856, 3.66498, 1, 0, 0, 1, 1,
0.1308391, 0.4712605, 0.7445455, 1, 0, 0, 1, 1,
0.1338862, -0.4114212, 2.969549, 1, 0, 0, 1, 1,
0.1340813, 0.0899298, 0.878808, 0, 0, 0, 1, 1,
0.1350353, -0.1004355, 2.378981, 0, 0, 0, 1, 1,
0.1392955, -0.09922808, 1.794862, 0, 0, 0, 1, 1,
0.140511, 1.817751, -1.413629, 0, 0, 0, 1, 1,
0.1438676, -0.3487552, 4.833044, 0, 0, 0, 1, 1,
0.1453087, 0.4479289, 0.4454055, 0, 0, 0, 1, 1,
0.1467894, -0.878028, 2.854644, 0, 0, 0, 1, 1,
0.1477473, 0.9242433, 0.2237816, 1, 1, 1, 1, 1,
0.148884, 1.63375, -1.49365, 1, 1, 1, 1, 1,
0.153117, 0.5714515, -0.7099293, 1, 1, 1, 1, 1,
0.1548863, -0.4737361, 1.891116, 1, 1, 1, 1, 1,
0.1596436, -2.096678, 3.820534, 1, 1, 1, 1, 1,
0.166657, 0.983961, -2.230789, 1, 1, 1, 1, 1,
0.1702485, 1.158146, -0.5190135, 1, 1, 1, 1, 1,
0.1752677, 1.799035, -0.1642842, 1, 1, 1, 1, 1,
0.181818, 0.5774237, 0.4016955, 1, 1, 1, 1, 1,
0.1847395, 1.075886, 0.568541, 1, 1, 1, 1, 1,
0.1854099, -2.54997, 4.39509, 1, 1, 1, 1, 1,
0.186382, -0.8042992, 4.531107, 1, 1, 1, 1, 1,
0.1869123, 0.487507, -1.70959, 1, 1, 1, 1, 1,
0.1900201, 0.3573683, -0.3616974, 1, 1, 1, 1, 1,
0.1930795, -0.01638609, 0.9812607, 1, 1, 1, 1, 1,
0.1940716, -0.1655013, 2.091612, 0, 0, 1, 1, 1,
0.1968837, -0.322428, 2.300864, 1, 0, 0, 1, 1,
0.1984497, -0.2933775, 2.179201, 1, 0, 0, 1, 1,
0.1985325, 0.5797988, 0.5994396, 1, 0, 0, 1, 1,
0.1998412, 0.4361614, -0.14708, 1, 0, 0, 1, 1,
0.2011558, 0.2979978, 1.636823, 1, 0, 0, 1, 1,
0.2039519, -0.9159999, 5.142261, 0, 0, 0, 1, 1,
0.2082524, 0.3024095, 0.79698, 0, 0, 0, 1, 1,
0.2097964, -0.7274981, 3.682938, 0, 0, 0, 1, 1,
0.2152856, 0.348189, -0.4807843, 0, 0, 0, 1, 1,
0.2206004, 0.3089595, -0.8189337, 0, 0, 0, 1, 1,
0.2259423, -0.4127972, 3.09025, 0, 0, 0, 1, 1,
0.2305485, 1.039399, 0.4715028, 0, 0, 0, 1, 1,
0.2315935, 0.7977978, -0.2237636, 1, 1, 1, 1, 1,
0.2364053, 0.3637157, 1.299275, 1, 1, 1, 1, 1,
0.237556, 1.018616, -0.6993406, 1, 1, 1, 1, 1,
0.2441116, -1.561332, 2.956011, 1, 1, 1, 1, 1,
0.2480313, 1.914252, -0.4207055, 1, 1, 1, 1, 1,
0.2508709, -0.3877504, 0.5236899, 1, 1, 1, 1, 1,
0.253042, 1.370965, 0.1057139, 1, 1, 1, 1, 1,
0.2579805, -0.09608505, 3.983342, 1, 1, 1, 1, 1,
0.2581766, -1.003778, 2.775831, 1, 1, 1, 1, 1,
0.262913, 0.878301, 0.8043389, 1, 1, 1, 1, 1,
0.2644214, -0.1625363, 2.339307, 1, 1, 1, 1, 1,
0.2647874, -0.8270839, 1.79543, 1, 1, 1, 1, 1,
0.2676054, 0.05188615, 2.468051, 1, 1, 1, 1, 1,
0.2705737, 0.4383322, 0.8817917, 1, 1, 1, 1, 1,
0.2711373, 0.5020432, 1.003487, 1, 1, 1, 1, 1,
0.2718553, 0.2563133, -0.2495872, 0, 0, 1, 1, 1,
0.2771282, 1.078987, -1.278086, 1, 0, 0, 1, 1,
0.2799249, -0.3017526, 0.6759908, 1, 0, 0, 1, 1,
0.2903267, -0.4941621, 3.120363, 1, 0, 0, 1, 1,
0.2924899, -0.1136234, 2.520336, 1, 0, 0, 1, 1,
0.2993584, 1.092082, -0.03845382, 1, 0, 0, 1, 1,
0.3050562, 0.09975007, 1.871386, 0, 0, 0, 1, 1,
0.3064414, -1.65217, 2.370106, 0, 0, 0, 1, 1,
0.3116721, 0.4959156, 0.333889, 0, 0, 0, 1, 1,
0.312209, 0.06781925, 1.258541, 0, 0, 0, 1, 1,
0.3123853, 0.5725077, 0.03751347, 0, 0, 0, 1, 1,
0.3244279, 0.07362928, 2.430275, 0, 0, 0, 1, 1,
0.3413576, -0.9240781, 2.656031, 0, 0, 0, 1, 1,
0.3430767, 1.025645, -1.691782, 1, 1, 1, 1, 1,
0.3450582, 1.159983, 0.9523375, 1, 1, 1, 1, 1,
0.3473243, -0.09492712, 3.02992, 1, 1, 1, 1, 1,
0.3522869, -1.608308, 1.707571, 1, 1, 1, 1, 1,
0.3582287, 1.504652, 1.019304, 1, 1, 1, 1, 1,
0.3618402, 0.4630537, 1.591928, 1, 1, 1, 1, 1,
0.3623323, 0.1977481, 0.2422994, 1, 1, 1, 1, 1,
0.364812, 0.4267154, 0.7883428, 1, 1, 1, 1, 1,
0.3678702, -1.267174, 2.747938, 1, 1, 1, 1, 1,
0.3714789, -0.8969229, 3.079655, 1, 1, 1, 1, 1,
0.3800063, 1.157933, 1.448103, 1, 1, 1, 1, 1,
0.3823283, -0.7014273, 1.710757, 1, 1, 1, 1, 1,
0.3858886, -1.342112, 2.438097, 1, 1, 1, 1, 1,
0.3870359, 0.8113331, 0.3868168, 1, 1, 1, 1, 1,
0.3899024, 0.9093528, -0.5144373, 1, 1, 1, 1, 1,
0.3932634, 0.5921751, 1.006908, 0, 0, 1, 1, 1,
0.4033417, -0.9605507, 3.410802, 1, 0, 0, 1, 1,
0.4090485, 2.020828, -0.2708366, 1, 0, 0, 1, 1,
0.4128885, 1.779251, 1.356332, 1, 0, 0, 1, 1,
0.4152233, -1.42202, 0.8635452, 1, 0, 0, 1, 1,
0.4191103, -1.086987, 5.286096, 1, 0, 0, 1, 1,
0.4195028, 0.9261458, 1.130428, 0, 0, 0, 1, 1,
0.4203057, 1.502163, 0.9001752, 0, 0, 0, 1, 1,
0.4211667, -1.369518, 3.272975, 0, 0, 0, 1, 1,
0.4228449, 1.250181, -0.2386332, 0, 0, 0, 1, 1,
0.4235207, -0.796753, 1.781657, 0, 0, 0, 1, 1,
0.4240558, -0.967766, 2.177836, 0, 0, 0, 1, 1,
0.424975, -0.8073223, 2.746555, 0, 0, 0, 1, 1,
0.4269979, 0.3033794, 1.650428, 1, 1, 1, 1, 1,
0.427011, 0.4909112, 1.494238, 1, 1, 1, 1, 1,
0.4270347, 0.5615532, 1.481212, 1, 1, 1, 1, 1,
0.4273434, 2.118866, 0.3801365, 1, 1, 1, 1, 1,
0.427766, -1.327025, 0.5739489, 1, 1, 1, 1, 1,
0.4322732, 2.437607, 0.4421288, 1, 1, 1, 1, 1,
0.4408661, -0.7114297, 4.131171, 1, 1, 1, 1, 1,
0.4420662, -1.388609, 2.832807, 1, 1, 1, 1, 1,
0.4460611, 0.02395858, 0.2084032, 1, 1, 1, 1, 1,
0.4497642, 0.7955871, -1.811179, 1, 1, 1, 1, 1,
0.4498189, 0.4678515, 0.872951, 1, 1, 1, 1, 1,
0.4516498, -0.4162251, 1.645019, 1, 1, 1, 1, 1,
0.4524423, -0.592979, 2.742267, 1, 1, 1, 1, 1,
0.4548129, -0.561143, 2.778559, 1, 1, 1, 1, 1,
0.4550317, -0.5351979, 2.371737, 1, 1, 1, 1, 1,
0.455684, 0.2900036, 0.9442821, 0, 0, 1, 1, 1,
0.4565183, 0.2407834, 1.526374, 1, 0, 0, 1, 1,
0.4630794, 2.137405, 0.7422984, 1, 0, 0, 1, 1,
0.465635, -0.6277793, 2.561466, 1, 0, 0, 1, 1,
0.4735008, -0.7540313, 2.863224, 1, 0, 0, 1, 1,
0.4801181, 0.6608468, 0.7436283, 1, 0, 0, 1, 1,
0.4925575, -0.8780183, 3.52534, 0, 0, 0, 1, 1,
0.4980864, 0.7616408, 0.1685264, 0, 0, 0, 1, 1,
0.4993401, -0.1188318, 1.721979, 0, 0, 0, 1, 1,
0.5023199, 0.5597355, 0.1733279, 0, 0, 0, 1, 1,
0.5042055, -1.295113, -0.3052667, 0, 0, 0, 1, 1,
0.5063673, -0.6853617, 1.52006, 0, 0, 0, 1, 1,
0.5080143, -0.8547035, 1.175623, 0, 0, 0, 1, 1,
0.5087872, -1.182932, 3.34, 1, 1, 1, 1, 1,
0.5089343, -1.740564, 3.175811, 1, 1, 1, 1, 1,
0.5104243, -1.423088, 1.863524, 1, 1, 1, 1, 1,
0.5110782, -0.5973752, 3.529938, 1, 1, 1, 1, 1,
0.5147536, 0.9615069, -0.5779857, 1, 1, 1, 1, 1,
0.5166128, -0.5625759, 3.265993, 1, 1, 1, 1, 1,
0.5176764, 0.5568532, 0.392298, 1, 1, 1, 1, 1,
0.5192079, -0.05975291, 0.1159231, 1, 1, 1, 1, 1,
0.5206057, -1.070601, 2.591097, 1, 1, 1, 1, 1,
0.5220058, -0.5012105, 1.669866, 1, 1, 1, 1, 1,
0.5230414, 1.393184, -0.03369349, 1, 1, 1, 1, 1,
0.5268935, -0.7896762, 0.1383593, 1, 1, 1, 1, 1,
0.5291985, 0.5222074, 1.056673, 1, 1, 1, 1, 1,
0.5389567, 1.0709, 0.5803697, 1, 1, 1, 1, 1,
0.5431435, -0.3417808, 2.426712, 1, 1, 1, 1, 1,
0.5445248, -0.7296262, 2.581573, 0, 0, 1, 1, 1,
0.5449698, -0.7217354, 5.178121, 1, 0, 0, 1, 1,
0.5458722, -0.3108256, 2.69953, 1, 0, 0, 1, 1,
0.5492421, 1.488358, -0.7395766, 1, 0, 0, 1, 1,
0.5533064, -1.127472, 3.051757, 1, 0, 0, 1, 1,
0.5569828, -0.5496436, 3.879616, 1, 0, 0, 1, 1,
0.5604017, -0.8936048, 1.690853, 0, 0, 0, 1, 1,
0.5614755, 0.08884468, 0.8552635, 0, 0, 0, 1, 1,
0.5639809, 1.103229, 1.607327, 0, 0, 0, 1, 1,
0.5640774, -0.5998784, 0.8650845, 0, 0, 0, 1, 1,
0.566628, -0.1419701, 1.710588, 0, 0, 0, 1, 1,
0.569849, 0.05603238, 1.272522, 0, 0, 0, 1, 1,
0.5708713, 1.219927, -0.3395726, 0, 0, 0, 1, 1,
0.5766224, -2.781624, 1.652871, 1, 1, 1, 1, 1,
0.5847351, -0.3050275, 1.780036, 1, 1, 1, 1, 1,
0.5874324, -1.272001, 2.642625, 1, 1, 1, 1, 1,
0.5888488, 0.8993691, 1.692558, 1, 1, 1, 1, 1,
0.5905802, 0.7261834, 0.9890072, 1, 1, 1, 1, 1,
0.5911472, -0.6156712, 3.002769, 1, 1, 1, 1, 1,
0.5913049, -0.3331495, 2.732498, 1, 1, 1, 1, 1,
0.593006, 0.3265758, 1.690336, 1, 1, 1, 1, 1,
0.5933111, -1.065807, 3.54812, 1, 1, 1, 1, 1,
0.5951813, -0.225452, 1.72024, 1, 1, 1, 1, 1,
0.599601, 0.9952056, 1.688274, 1, 1, 1, 1, 1,
0.6014228, 1.422732, 2.195746, 1, 1, 1, 1, 1,
0.6041369, 1.357908, -0.577682, 1, 1, 1, 1, 1,
0.6052076, 0.1262973, 0.4179395, 1, 1, 1, 1, 1,
0.6063089, 0.686753, 2.616787, 1, 1, 1, 1, 1,
0.6065685, 0.2155144, 1.981441, 0, 0, 1, 1, 1,
0.6103671, -0.3366469, 1.778372, 1, 0, 0, 1, 1,
0.6117431, 1.248211, 1.78475, 1, 0, 0, 1, 1,
0.6151063, -0.5094125, 3.847865, 1, 0, 0, 1, 1,
0.6151453, -2.455423, 2.068337, 1, 0, 0, 1, 1,
0.619146, -0.278309, 2.030911, 1, 0, 0, 1, 1,
0.6207469, -0.1477553, 3.46975, 0, 0, 0, 1, 1,
0.6208561, 0.8083521, 0.753309, 0, 0, 0, 1, 1,
0.6216483, 0.266133, -0.7528393, 0, 0, 0, 1, 1,
0.6221478, 0.8289956, 0.6002145, 0, 0, 0, 1, 1,
0.624937, 0.6679253, 2.649721, 0, 0, 0, 1, 1,
0.6252784, -0.995719, 4.672644, 0, 0, 0, 1, 1,
0.6277749, 0.6421461, -1.674428, 0, 0, 0, 1, 1,
0.6297401, 1.063321, 1.086908, 1, 1, 1, 1, 1,
0.6321172, 0.3122835, 2.048953, 1, 1, 1, 1, 1,
0.6399877, -0.4845429, 4.666825, 1, 1, 1, 1, 1,
0.6435632, -2.174199, 3.082458, 1, 1, 1, 1, 1,
0.6505869, 0.9346629, 1.313642, 1, 1, 1, 1, 1,
0.6525057, 1.941651, -0.4778858, 1, 1, 1, 1, 1,
0.6527041, -0.05112446, 2.133076, 1, 1, 1, 1, 1,
0.6542763, 0.05516765, 0.8994161, 1, 1, 1, 1, 1,
0.6607398, -1.247213, 1.378614, 1, 1, 1, 1, 1,
0.6670682, -0.08845986, 1.99967, 1, 1, 1, 1, 1,
0.667088, -0.6409226, 1.566629, 1, 1, 1, 1, 1,
0.6674087, -0.9000185, 1.614362, 1, 1, 1, 1, 1,
0.6749366, -0.0112471, 0.9750773, 1, 1, 1, 1, 1,
0.6772946, -0.1502797, 1.524682, 1, 1, 1, 1, 1,
0.677803, -0.6382535, 1.712627, 1, 1, 1, 1, 1,
0.6912816, 0.01166498, 0.5980034, 0, 0, 1, 1, 1,
0.6941609, 0.6525404, 1.132453, 1, 0, 0, 1, 1,
0.697942, -0.3603806, 2.120927, 1, 0, 0, 1, 1,
0.7002777, -0.3227032, 0.01585147, 1, 0, 0, 1, 1,
0.7027531, -1.7831, 3.859585, 1, 0, 0, 1, 1,
0.7034942, 0.4250708, 3.009185, 1, 0, 0, 1, 1,
0.7053432, -0.2298365, 3.402912, 0, 0, 0, 1, 1,
0.7093492, -0.7837263, 3.46803, 0, 0, 0, 1, 1,
0.7147495, 2.076168, 0.3726847, 0, 0, 0, 1, 1,
0.7163251, 0.4893641, 0.3137189, 0, 0, 0, 1, 1,
0.7207402, 0.5639127, 1.289818, 0, 0, 0, 1, 1,
0.7218984, 0.8489282, 2.446019, 0, 0, 0, 1, 1,
0.7227418, 1.147063, 1.371699, 0, 0, 0, 1, 1,
0.7244212, 0.4575547, 0.1902694, 1, 1, 1, 1, 1,
0.729687, -0.8828677, 1.7096, 1, 1, 1, 1, 1,
0.7329938, -1.036599, 0.1105664, 1, 1, 1, 1, 1,
0.7385641, -1.033669, 1.659958, 1, 1, 1, 1, 1,
0.7392884, 1.763122, 1.397878, 1, 1, 1, 1, 1,
0.7415071, -0.1276301, 0.8337396, 1, 1, 1, 1, 1,
0.74217, 0.04703641, 1.001904, 1, 1, 1, 1, 1,
0.7440221, -0.5713477, 2.442086, 1, 1, 1, 1, 1,
0.7625915, 0.738064, -0.172606, 1, 1, 1, 1, 1,
0.763972, 0.4293242, -0.4328841, 1, 1, 1, 1, 1,
0.7656417, -1.921308, 3.242368, 1, 1, 1, 1, 1,
0.767202, -1.657514, 2.783405, 1, 1, 1, 1, 1,
0.7686486, -1.054141, -0.2878712, 1, 1, 1, 1, 1,
0.7692033, 0.9928019, 0.6598659, 1, 1, 1, 1, 1,
0.7700472, 0.1465683, 1.805905, 1, 1, 1, 1, 1,
0.7734175, -1.734267, 4.656831, 0, 0, 1, 1, 1,
0.7741863, 0.1964236, 0.6895751, 1, 0, 0, 1, 1,
0.7751076, 0.6185864, -0.3757164, 1, 0, 0, 1, 1,
0.7804299, 1.072456, 2.1292, 1, 0, 0, 1, 1,
0.7925205, 0.09658981, 2.264145, 1, 0, 0, 1, 1,
0.7995133, 1.341141, 2.749953, 1, 0, 0, 1, 1,
0.8031781, 0.4664844, 1.787517, 0, 0, 0, 1, 1,
0.8042971, -0.622465, 3.551572, 0, 0, 0, 1, 1,
0.8175265, -2.094108, 3.529673, 0, 0, 0, 1, 1,
0.8181891, -0.7009386, 3.825865, 0, 0, 0, 1, 1,
0.82691, 0.2611696, 1.650928, 0, 0, 0, 1, 1,
0.8279753, -0.2839568, 2.887922, 0, 0, 0, 1, 1,
0.8391922, -0.93596, 1.784973, 0, 0, 0, 1, 1,
0.8393577, 0.4881532, 0.3524785, 1, 1, 1, 1, 1,
0.8404889, 0.1926865, 1.469019, 1, 1, 1, 1, 1,
0.8424299, 1.483223, -0.4032025, 1, 1, 1, 1, 1,
0.8459816, -1.407147, 4.078186, 1, 1, 1, 1, 1,
0.8460959, -0.6837471, 2.713684, 1, 1, 1, 1, 1,
0.8713635, 0.3516761, 0.2382796, 1, 1, 1, 1, 1,
0.8736028, 0.3950007, 1.624765, 1, 1, 1, 1, 1,
0.8764367, -2.14104, 4.513385, 1, 1, 1, 1, 1,
0.8812462, -1.246135, 1.455819, 1, 1, 1, 1, 1,
0.8887529, -1.656585, 3.724386, 1, 1, 1, 1, 1,
0.8899339, 0.7039858, 0.4799583, 1, 1, 1, 1, 1,
0.8928164, -0.3141633, 1.39183, 1, 1, 1, 1, 1,
0.8937204, 1.146919, 0.1578292, 1, 1, 1, 1, 1,
0.896818, 0.1144486, 1.125985, 1, 1, 1, 1, 1,
0.9138591, 0.3240915, -0.1365004, 1, 1, 1, 1, 1,
0.914322, 0.09981198, 1.585236, 0, 0, 1, 1, 1,
0.9166044, -0.207541, 2.821487, 1, 0, 0, 1, 1,
0.9252239, 1.023912, -0.6673209, 1, 0, 0, 1, 1,
0.9295797, -0.7848539, -0.1886017, 1, 0, 0, 1, 1,
0.9339245, 1.119883, -0.188558, 1, 0, 0, 1, 1,
0.9373097, 0.07976323, 1.583213, 1, 0, 0, 1, 1,
0.9393322, 1.550833, -0.03114709, 0, 0, 0, 1, 1,
0.9424276, -0.8767767, 1.813194, 0, 0, 0, 1, 1,
0.9439406, 2.137077, 0.8287849, 0, 0, 0, 1, 1,
0.958631, 0.7731717, 1.631176, 0, 0, 0, 1, 1,
0.9602721, 0.6305706, 0.2464949, 0, 0, 0, 1, 1,
0.9608892, 0.8584709, 1.268833, 0, 0, 0, 1, 1,
0.9610882, 0.8953574, 1.617648, 0, 0, 0, 1, 1,
0.9660133, 0.1034216, 0.03458173, 1, 1, 1, 1, 1,
0.9665581, -0.5137013, 2.503152, 1, 1, 1, 1, 1,
0.9683168, -0.04750552, 1.750924, 1, 1, 1, 1, 1,
0.969374, 0.186574, 1.223362, 1, 1, 1, 1, 1,
0.9780807, -0.7727281, 1.098991, 1, 1, 1, 1, 1,
0.9832073, -0.3941874, 1.35735, 1, 1, 1, 1, 1,
0.984387, -0.1323109, 2.026703, 1, 1, 1, 1, 1,
0.985205, -1.936853, 3.411879, 1, 1, 1, 1, 1,
0.990418, -0.5278663, 0.6385043, 1, 1, 1, 1, 1,
1.008097, 0.1366588, 0.290634, 1, 1, 1, 1, 1,
1.009323, 1.463516, 0.4039536, 1, 1, 1, 1, 1,
1.010581, 0.3903002, 0.2584633, 1, 1, 1, 1, 1,
1.020248, 0.484923, 0.6711153, 1, 1, 1, 1, 1,
1.02167, 0.6132153, 3.80072, 1, 1, 1, 1, 1,
1.023995, 0.4818672, 1.071873, 1, 1, 1, 1, 1,
1.027333, -0.7009052, 2.690432, 0, 0, 1, 1, 1,
1.029448, 0.5892875, 1.001427, 1, 0, 0, 1, 1,
1.036325, -1.649779, 1.750626, 1, 0, 0, 1, 1,
1.042907, 1.724677, -0.1193562, 1, 0, 0, 1, 1,
1.044431, 1.064787, 0.5704083, 1, 0, 0, 1, 1,
1.046755, -0.2782565, 0.5382566, 1, 0, 0, 1, 1,
1.060666, 0.4910336, 1.833113, 0, 0, 0, 1, 1,
1.06388, -0.0832161, 0.9887235, 0, 0, 0, 1, 1,
1.064476, -0.6867125, 1.82756, 0, 0, 0, 1, 1,
1.064917, 0.8743392, -0.5050255, 0, 0, 0, 1, 1,
1.071247, 1.155819, 1.145571, 0, 0, 0, 1, 1,
1.072551, 0.2337557, 0.4976178, 0, 0, 0, 1, 1,
1.076687, 1.327507, 1.478466, 0, 0, 0, 1, 1,
1.077636, -0.1857393, 2.021162, 1, 1, 1, 1, 1,
1.077935, 0.4744586, 2.148505, 1, 1, 1, 1, 1,
1.080053, 1.406368, 2.036604, 1, 1, 1, 1, 1,
1.08809, 1.188091, 0.4711445, 1, 1, 1, 1, 1,
1.093478, 0.9094834, 0.7345981, 1, 1, 1, 1, 1,
1.095475, -0.272395, 1.664597, 1, 1, 1, 1, 1,
1.10363, -0.9906716, 1.566458, 1, 1, 1, 1, 1,
1.114083, -1.94765, 3.26878, 1, 1, 1, 1, 1,
1.115626, -0.4626961, 2.878055, 1, 1, 1, 1, 1,
1.117579, -0.5946261, 0.8947819, 1, 1, 1, 1, 1,
1.123445, 1.409372, 0.7746381, 1, 1, 1, 1, 1,
1.126771, 1.339254, 0.8383597, 1, 1, 1, 1, 1,
1.130107, 2.211229, 0.4192213, 1, 1, 1, 1, 1,
1.130844, -1.209302, 1.293919, 1, 1, 1, 1, 1,
1.137319, 0.7467554, -0.2395846, 1, 1, 1, 1, 1,
1.138962, 0.6184496, 1.113983, 0, 0, 1, 1, 1,
1.140501, -0.8992649, 3.226233, 1, 0, 0, 1, 1,
1.147295, -0.05760894, 3.047459, 1, 0, 0, 1, 1,
1.149416, -0.1609691, 2.243986, 1, 0, 0, 1, 1,
1.152744, -0.02715283, 2.053486, 1, 0, 0, 1, 1,
1.155789, -0.6790012, 1.566599, 1, 0, 0, 1, 1,
1.160312, -0.1808164, 2.653306, 0, 0, 0, 1, 1,
1.160757, -0.79404, -0.1896152, 0, 0, 0, 1, 1,
1.162906, 0.5166067, 0.4224813, 0, 0, 0, 1, 1,
1.163719, -0.9172263, 2.62663, 0, 0, 0, 1, 1,
1.168095, -0.3586516, 0.8580061, 0, 0, 0, 1, 1,
1.170453, 0.1093863, 0.03158405, 0, 0, 0, 1, 1,
1.183883, -1.208934, 3.116574, 0, 0, 0, 1, 1,
1.191638, 0.4605641, 0.4795502, 1, 1, 1, 1, 1,
1.2064, -0.5197745, 1.097849, 1, 1, 1, 1, 1,
1.208964, 0.2810862, 1.176733, 1, 1, 1, 1, 1,
1.226886, 1.191944, 1.237126, 1, 1, 1, 1, 1,
1.230174, 0.8838053, 1.386996, 1, 1, 1, 1, 1,
1.238641, 0.3353519, 1.691312, 1, 1, 1, 1, 1,
1.252895, -1.253168, 3.320639, 1, 1, 1, 1, 1,
1.254089, -0.9112903, 1.300269, 1, 1, 1, 1, 1,
1.255408, -0.4255776, 2.361845, 1, 1, 1, 1, 1,
1.260488, 0.6942542, 0.9268788, 1, 1, 1, 1, 1,
1.269659, 0.25605, 2.264516, 1, 1, 1, 1, 1,
1.281168, 1.135843, -1.180369, 1, 1, 1, 1, 1,
1.292294, 0.8280872, 1.583063, 1, 1, 1, 1, 1,
1.294626, 0.01688809, 1.73466, 1, 1, 1, 1, 1,
1.300535, -1.124561, 2.054586, 1, 1, 1, 1, 1,
1.307852, -2.729544, 3.162329, 0, 0, 1, 1, 1,
1.308138, -0.4984436, 1.582572, 1, 0, 0, 1, 1,
1.314237, 0.8460994, 1.441084, 1, 0, 0, 1, 1,
1.317322, 0.09618695, 1.71346, 1, 0, 0, 1, 1,
1.345621, 0.3834099, -0.5641863, 1, 0, 0, 1, 1,
1.352288, -0.3499894, 1.980709, 1, 0, 0, 1, 1,
1.358428, 0.3886559, 0.6848716, 0, 0, 0, 1, 1,
1.359665, 0.3100584, 0.8030858, 0, 0, 0, 1, 1,
1.368865, 0.4916021, 0.92996, 0, 0, 0, 1, 1,
1.38225, 0.5089343, 0.2105085, 0, 0, 0, 1, 1,
1.3841, 0.2335399, 0.2305374, 0, 0, 0, 1, 1,
1.387308, -0.5511467, 1.737774, 0, 0, 0, 1, 1,
1.39345, 0.1117734, 0.6521311, 0, 0, 0, 1, 1,
1.398144, -0.9583911, 2.765848, 1, 1, 1, 1, 1,
1.410147, -0.5676438, 2.131862, 1, 1, 1, 1, 1,
1.415347, -0.8033962, 1.771483, 1, 1, 1, 1, 1,
1.421354, 0.3245619, 2.444006, 1, 1, 1, 1, 1,
1.422566, -1.126636, 1.087113, 1, 1, 1, 1, 1,
1.424729, 0.8126866, 0.8662689, 1, 1, 1, 1, 1,
1.426092, 1.050701, 0.6462904, 1, 1, 1, 1, 1,
1.444503, -0.5431376, 2.533328, 1, 1, 1, 1, 1,
1.445634, -0.8229905, 1.735182, 1, 1, 1, 1, 1,
1.446184, -0.2605058, 0.6329536, 1, 1, 1, 1, 1,
1.456476, 0.3172797, -0.4023985, 1, 1, 1, 1, 1,
1.45974, -1.070405, 3.628205, 1, 1, 1, 1, 1,
1.461559, 1.06741, 2.549019, 1, 1, 1, 1, 1,
1.469768, 0.5484529, 0.8817483, 1, 1, 1, 1, 1,
1.479046, 0.9053224, -0.7472571, 1, 1, 1, 1, 1,
1.481767, 1.175732, -0.5193948, 0, 0, 1, 1, 1,
1.485115, -1.439746, 1.304732, 1, 0, 0, 1, 1,
1.492122, 0.7908492, 1.415199, 1, 0, 0, 1, 1,
1.49479, -1.253356, 2.207226, 1, 0, 0, 1, 1,
1.508403, -0.491766, 1.383919, 1, 0, 0, 1, 1,
1.510779, 0.3911282, 0.3764247, 1, 0, 0, 1, 1,
1.514104, 1.39781, -0.6653314, 0, 0, 0, 1, 1,
1.540369, 0.2318595, 1.947377, 0, 0, 0, 1, 1,
1.545843, 0.5618376, -0.6196958, 0, 0, 0, 1, 1,
1.576214, 0.1153979, -0.2869888, 0, 0, 0, 1, 1,
1.607058, -0.1867152, 1.980273, 0, 0, 0, 1, 1,
1.623151, -3.032503, 2.401056, 0, 0, 0, 1, 1,
1.624807, -0.2175461, 1.652961, 0, 0, 0, 1, 1,
1.628902, -0.1659148, 2.445873, 1, 1, 1, 1, 1,
1.650194, -0.8171603, 1.461999, 1, 1, 1, 1, 1,
1.65161, 0.4813835, 1.125405, 1, 1, 1, 1, 1,
1.665717, 0.4892824, 1.642685, 1, 1, 1, 1, 1,
1.666969, 0.6943958, 1.560232, 1, 1, 1, 1, 1,
1.667179, -0.6816171, 1.170309, 1, 1, 1, 1, 1,
1.669212, 0.04565554, 1.932281, 1, 1, 1, 1, 1,
1.674385, 0.1883775, 0.4568534, 1, 1, 1, 1, 1,
1.684782, -0.1541334, 2.46628, 1, 1, 1, 1, 1,
1.701056, -0.190274, 1.493267, 1, 1, 1, 1, 1,
1.703127, 0.6938139, 0.7444453, 1, 1, 1, 1, 1,
1.705157, 0.4042097, 1.257661, 1, 1, 1, 1, 1,
1.71496, 0.06879652, 2.525624, 1, 1, 1, 1, 1,
1.720252, -0.6272925, 1.080765, 1, 1, 1, 1, 1,
1.724741, 0.8419595, 1.164292, 1, 1, 1, 1, 1,
1.737163, -0.5841469, 0.8077996, 0, 0, 1, 1, 1,
1.749418, 0.3063152, 2.561302, 1, 0, 0, 1, 1,
1.750743, 1.330365, 1.915743, 1, 0, 0, 1, 1,
1.761963, -0.2554431, 2.105729, 1, 0, 0, 1, 1,
1.770322, -0.1938267, 0.7277833, 1, 0, 0, 1, 1,
1.800636, -2.406639, 3.077824, 1, 0, 0, 1, 1,
1.812847, 1.473238, 0.7189404, 0, 0, 0, 1, 1,
1.814202, -1.357211, 3.417137, 0, 0, 0, 1, 1,
1.834516, -1.062364, 0.4773, 0, 0, 0, 1, 1,
1.85305, 0.3741941, 1.083191, 0, 0, 0, 1, 1,
1.857227, -0.2758514, 1.309743, 0, 0, 0, 1, 1,
1.868733, -0.423916, 1.52305, 0, 0, 0, 1, 1,
1.880717, 0.4883248, 0.602293, 0, 0, 0, 1, 1,
1.887958, 0.8554801, 2.222611, 1, 1, 1, 1, 1,
1.896411, 0.8464595, 0.2740382, 1, 1, 1, 1, 1,
1.922367, 0.1695931, 0.9053016, 1, 1, 1, 1, 1,
1.926301, -0.3591629, 2.643861, 1, 1, 1, 1, 1,
1.939092, -1.162731, 1.975755, 1, 1, 1, 1, 1,
1.939501, 1.13385, 1.63879, 1, 1, 1, 1, 1,
1.954783, 0.1067054, 2.633659, 1, 1, 1, 1, 1,
1.972428, 0.3462584, 0.8414677, 1, 1, 1, 1, 1,
1.97481, 1.151307, 1.739951, 1, 1, 1, 1, 1,
1.97523, 0.8187714, 2.008654, 1, 1, 1, 1, 1,
1.975404, 0.8770448, 1.289226, 1, 1, 1, 1, 1,
1.987524, 1.272968, -0.4529019, 1, 1, 1, 1, 1,
2.000747, -1.405769, 2.731766, 1, 1, 1, 1, 1,
2.004177, -0.3216728, 1.708772, 1, 1, 1, 1, 1,
2.055447, 0.5560019, 1.587962, 1, 1, 1, 1, 1,
2.060616, -0.509074, 2.881086, 0, 0, 1, 1, 1,
2.090277, 0.09061158, 1.225236, 1, 0, 0, 1, 1,
2.09142, -1.246294, 2.58917, 1, 0, 0, 1, 1,
2.102241, 0.5970625, 0.8804082, 1, 0, 0, 1, 1,
2.112662, 0.1825962, 1.416661, 1, 0, 0, 1, 1,
2.123276, 0.2785748, 3.084641, 1, 0, 0, 1, 1,
2.20377, -0.04416444, 2.12501, 0, 0, 0, 1, 1,
2.212741, -0.3365491, 0.1657481, 0, 0, 0, 1, 1,
2.217924, 0.0525792, -0.1636241, 0, 0, 0, 1, 1,
2.267686, 0.520325, 2.307393, 0, 0, 0, 1, 1,
2.299083, 0.9184987, 3.150008, 0, 0, 0, 1, 1,
2.382179, -0.2963986, 3.110789, 0, 0, 0, 1, 1,
2.448296, -2.162856, 1.868346, 0, 0, 0, 1, 1,
2.45533, -1.34636, 0.33908, 1, 1, 1, 1, 1,
2.485972, 0.7210066, 1.642773, 1, 1, 1, 1, 1,
2.577178, -0.4113212, 2.165649, 1, 1, 1, 1, 1,
2.59156, -1.147129, 0.926795, 1, 1, 1, 1, 1,
2.620418, 1.091928, 0.5765707, 1, 1, 1, 1, 1,
2.75496, 1.403957, 0.7391357, 1, 1, 1, 1, 1,
2.937145, 0.3515918, 2.903097, 1, 1, 1, 1, 1
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
var radius = 9.634497;
var distance = 33.84076;
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
mvMatrix.translate( 0.3549626, 0.06077433, 0.2343991 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84076);
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
