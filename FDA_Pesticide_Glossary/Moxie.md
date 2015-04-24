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
-3.481963, 1.140472, -1.276875, 1, 0, 0, 1,
-3.291557, 0.9428613, -0.4276536, 1, 0.007843138, 0, 1,
-3.007527, -2.49201, -2.752967, 1, 0.01176471, 0, 1,
-2.960377, -1.406281, -4.624834, 1, 0.01960784, 0, 1,
-2.808108, -1.989815, -2.094388, 1, 0.02352941, 0, 1,
-2.642035, -0.9308151, -2.815765, 1, 0.03137255, 0, 1,
-2.576272, -0.4779159, -2.658643, 1, 0.03529412, 0, 1,
-2.557029, 0.05883528, -1.672343, 1, 0.04313726, 0, 1,
-2.541511, 1.896766, -1.870576, 1, 0.04705882, 0, 1,
-2.435456, -0.6118867, -1.407095, 1, 0.05490196, 0, 1,
-2.387638, -1.686235, -2.233763, 1, 0.05882353, 0, 1,
-2.355597, 0.822575, -0.1367996, 1, 0.06666667, 0, 1,
-2.304695, 1.777594, -1.413479, 1, 0.07058824, 0, 1,
-2.264525, -1.040031, -3.195812, 1, 0.07843138, 0, 1,
-2.25615, -0.6137434, -1.552866, 1, 0.08235294, 0, 1,
-2.254283, -1.233755, -2.366211, 1, 0.09019608, 0, 1,
-2.24862, -1.352703, -2.401243, 1, 0.09411765, 0, 1,
-2.226371, 0.0740534, -1.428899, 1, 0.1019608, 0, 1,
-2.202062, 0.3829204, -1.702687, 1, 0.1098039, 0, 1,
-2.136978, 0.1875513, -2.111012, 1, 0.1137255, 0, 1,
-2.125425, 1.81556, -1.110808, 1, 0.1215686, 0, 1,
-2.120384, 0.1174211, 0.3653929, 1, 0.1254902, 0, 1,
-2.094205, -0.3578165, -2.386994, 1, 0.1333333, 0, 1,
-2.084069, 0.2576078, -1.557844, 1, 0.1372549, 0, 1,
-2.036732, -0.008456035, -0.01289811, 1, 0.145098, 0, 1,
-2.027988, -0.6714198, -0.960894, 1, 0.1490196, 0, 1,
-2.027145, -1.145007, -4.993538, 1, 0.1568628, 0, 1,
-2.019251, -0.2175745, -3.975894, 1, 0.1607843, 0, 1,
-1.998516, 0.1183498, -0.9127005, 1, 0.1686275, 0, 1,
-1.964674, 0.2904794, -0.993084, 1, 0.172549, 0, 1,
-1.953303, -0.2353067, -1.154948, 1, 0.1803922, 0, 1,
-1.93204, -0.1468649, -1.66007, 1, 0.1843137, 0, 1,
-1.899395, 1.138839, -0.6418821, 1, 0.1921569, 0, 1,
-1.893253, -0.9539233, -1.442096, 1, 0.1960784, 0, 1,
-1.860846, -0.7561814, -1.227368, 1, 0.2039216, 0, 1,
-1.855713, 0.2468223, -0.3191753, 1, 0.2117647, 0, 1,
-1.847643, -1.228238, -2.291848, 1, 0.2156863, 0, 1,
-1.832875, -0.9215981, -2.984054, 1, 0.2235294, 0, 1,
-1.821642, 0.4817567, -2.141237, 1, 0.227451, 0, 1,
-1.806316, -2.055064, -0.404233, 1, 0.2352941, 0, 1,
-1.795308, -1.300355, -2.36769, 1, 0.2392157, 0, 1,
-1.792725, 0.05992368, -2.63978, 1, 0.2470588, 0, 1,
-1.783793, -1.028468, -2.865703, 1, 0.2509804, 0, 1,
-1.779383, 0.2443668, -2.599015, 1, 0.2588235, 0, 1,
-1.769235, 0.2437262, -0.2259064, 1, 0.2627451, 0, 1,
-1.764402, -1.357551, -3.62084, 1, 0.2705882, 0, 1,
-1.762168, 0.6851892, -3.049909, 1, 0.2745098, 0, 1,
-1.750209, -1.064947, -2.740805, 1, 0.282353, 0, 1,
-1.744011, 0.3390069, -1.722956, 1, 0.2862745, 0, 1,
-1.74294, 0.2793479, -2.0861, 1, 0.2941177, 0, 1,
-1.728654, 1.460511, -3.183114, 1, 0.3019608, 0, 1,
-1.725567, 0.7635874, -1.349895, 1, 0.3058824, 0, 1,
-1.706684, 1.273502, -0.338016, 1, 0.3137255, 0, 1,
-1.70139, 1.093786, -2.745957, 1, 0.3176471, 0, 1,
-1.672764, -0.4383107, -5.771549, 1, 0.3254902, 0, 1,
-1.672747, -0.2847099, -2.403814, 1, 0.3294118, 0, 1,
-1.665715, 0.01216573, -1.747648, 1, 0.3372549, 0, 1,
-1.664178, -0.3198727, -0.9785461, 1, 0.3411765, 0, 1,
-1.657787, 1.323341, -1.708387, 1, 0.3490196, 0, 1,
-1.652761, 0.2646593, -1.085325, 1, 0.3529412, 0, 1,
-1.647516, -2.601872, -3.955638, 1, 0.3607843, 0, 1,
-1.645198, -0.7216536, -1.872912, 1, 0.3647059, 0, 1,
-1.644134, 0.3989054, -1.791684, 1, 0.372549, 0, 1,
-1.636647, -0.2453562, -1.029128, 1, 0.3764706, 0, 1,
-1.634587, 0.09749056, -1.266895, 1, 0.3843137, 0, 1,
-1.633333, -0.5736562, -2.733868, 1, 0.3882353, 0, 1,
-1.624288, 0.6586435, -1.01033, 1, 0.3960784, 0, 1,
-1.606902, 0.1692137, -0.2531639, 1, 0.4039216, 0, 1,
-1.599933, -2.278869, -2.855755, 1, 0.4078431, 0, 1,
-1.594919, 0.9413919, -2.284038, 1, 0.4156863, 0, 1,
-1.585312, -0.1513239, -1.298642, 1, 0.4196078, 0, 1,
-1.580615, 0.04182792, -0.5596533, 1, 0.427451, 0, 1,
-1.575542, -0.8449399, -2.052272, 1, 0.4313726, 0, 1,
-1.562691, -0.7668692, -2.615044, 1, 0.4392157, 0, 1,
-1.55937, -1.388932, -3.71031, 1, 0.4431373, 0, 1,
-1.557809, -0.2362702, -2.140037, 1, 0.4509804, 0, 1,
-1.555042, 0.4932955, -1.532937, 1, 0.454902, 0, 1,
-1.532407, 0.7150022, -1.720564, 1, 0.4627451, 0, 1,
-1.52581, 0.8798832, -0.1780068, 1, 0.4666667, 0, 1,
-1.508017, 0.4377446, -1.78083, 1, 0.4745098, 0, 1,
-1.502942, -1.053717, -2.028304, 1, 0.4784314, 0, 1,
-1.489202, -0.1271721, -0.4224415, 1, 0.4862745, 0, 1,
-1.476834, 1.094503, -1.785032, 1, 0.4901961, 0, 1,
-1.462845, 0.4444632, -0.7440812, 1, 0.4980392, 0, 1,
-1.461384, -0.2043527, -1.802519, 1, 0.5058824, 0, 1,
-1.460618, -0.655961, -2.24113, 1, 0.509804, 0, 1,
-1.444463, -0.3063234, -1.314972, 1, 0.5176471, 0, 1,
-1.441175, 0.09053377, -2.965953, 1, 0.5215687, 0, 1,
-1.42577, -1.160218, -1.566938, 1, 0.5294118, 0, 1,
-1.407561, 0.3648578, -0.9767002, 1, 0.5333334, 0, 1,
-1.405105, -0.9439475, -1.195258, 1, 0.5411765, 0, 1,
-1.368578, 0.5487162, -0.6304299, 1, 0.5450981, 0, 1,
-1.367377, -0.8767754, -0.9743945, 1, 0.5529412, 0, 1,
-1.342629, 0.03929198, -2.018814, 1, 0.5568628, 0, 1,
-1.332092, 1.269191, -0.30184, 1, 0.5647059, 0, 1,
-1.331332, 1.393458, -1.051401, 1, 0.5686275, 0, 1,
-1.324488, 0.4560435, -0.03565225, 1, 0.5764706, 0, 1,
-1.323379, -2.211072, -2.226521, 1, 0.5803922, 0, 1,
-1.317695, -0.6809498, -1.656552, 1, 0.5882353, 0, 1,
-1.306838, 1.155829, -1.211484, 1, 0.5921569, 0, 1,
-1.305831, 1.327209, -2.924073, 1, 0.6, 0, 1,
-1.298846, -0.8207406, -2.253164, 1, 0.6078432, 0, 1,
-1.296276, -1.102759, -3.879087, 1, 0.6117647, 0, 1,
-1.286449, 1.024533, -0.3529939, 1, 0.6196079, 0, 1,
-1.285232, -0.8625048, -3.137142, 1, 0.6235294, 0, 1,
-1.284234, 0.9760534, -0.4830588, 1, 0.6313726, 0, 1,
-1.283518, -1.005388, -1.961473, 1, 0.6352941, 0, 1,
-1.276411, -0.09281249, -1.067429, 1, 0.6431373, 0, 1,
-1.269774, -1.487296, -1.835356, 1, 0.6470588, 0, 1,
-1.233811, 0.4770279, -0.607223, 1, 0.654902, 0, 1,
-1.233099, -0.8140581, -3.933229, 1, 0.6588235, 0, 1,
-1.229863, -1.792385, -1.971157, 1, 0.6666667, 0, 1,
-1.223751, 0.318958, -1.273988, 1, 0.6705883, 0, 1,
-1.22123, -0.8083957, -1.141859, 1, 0.6784314, 0, 1,
-1.218738, -1.102319, -1.731919, 1, 0.682353, 0, 1,
-1.2183, -1.848566, -4.118407, 1, 0.6901961, 0, 1,
-1.209573, -0.01069473, -0.5208081, 1, 0.6941177, 0, 1,
-1.207754, -0.03930526, -2.133691, 1, 0.7019608, 0, 1,
-1.198544, -0.849869, -1.935254, 1, 0.7098039, 0, 1,
-1.188226, 0.08848735, -1.437751, 1, 0.7137255, 0, 1,
-1.182661, -0.6537933, -2.63913, 1, 0.7215686, 0, 1,
-1.181749, 2.167784, -0.1151038, 1, 0.7254902, 0, 1,
-1.177662, 0.2106473, -1.750539, 1, 0.7333333, 0, 1,
-1.176555, -0.8353527, -0.731028, 1, 0.7372549, 0, 1,
-1.165978, 0.03186421, -3.224632, 1, 0.7450981, 0, 1,
-1.164251, 0.6901048, 0.1061951, 1, 0.7490196, 0, 1,
-1.161382, -0.3697961, -1.996287, 1, 0.7568628, 0, 1,
-1.158883, 1.63598, -1.031016, 1, 0.7607843, 0, 1,
-1.148734, 0.309021, -2.827873, 1, 0.7686275, 0, 1,
-1.148316, -0.243165, -1.073998, 1, 0.772549, 0, 1,
-1.142692, 0.8481003, -0.003091504, 1, 0.7803922, 0, 1,
-1.139208, 1.818989, 0.7088114, 1, 0.7843137, 0, 1,
-1.13862, -0.7694128, -1.226092, 1, 0.7921569, 0, 1,
-1.128881, -0.3931862, -1.646, 1, 0.7960784, 0, 1,
-1.119851, 0.4609013, -1.733834, 1, 0.8039216, 0, 1,
-1.111144, 0.143745, -1.850902, 1, 0.8117647, 0, 1,
-1.10562, 1.541069, -0.4358164, 1, 0.8156863, 0, 1,
-1.103403, 0.2971646, -2.885788, 1, 0.8235294, 0, 1,
-1.098997, -1.432406, -2.368579, 1, 0.827451, 0, 1,
-1.097693, -0.3071437, -2.35013, 1, 0.8352941, 0, 1,
-1.087456, -0.9285698, -1.589476, 1, 0.8392157, 0, 1,
-1.0856, -1.593596, -2.527016, 1, 0.8470588, 0, 1,
-1.084487, 1.289407, -1.11167, 1, 0.8509804, 0, 1,
-1.081857, -0.5933484, -2.636101, 1, 0.8588235, 0, 1,
-1.079179, 0.2570267, -0.8609701, 1, 0.8627451, 0, 1,
-1.076651, -1.136109, 0.6370168, 1, 0.8705882, 0, 1,
-1.06893, 0.06430946, -1.656704, 1, 0.8745098, 0, 1,
-1.065123, 0.2452483, 0.1660825, 1, 0.8823529, 0, 1,
-1.062967, 0.4035024, -2.022462, 1, 0.8862745, 0, 1,
-1.051997, -0.8179282, -2.166176, 1, 0.8941177, 0, 1,
-1.045411, 0.6525947, -0.004344594, 1, 0.8980392, 0, 1,
-1.035959, -0.8091823, -3.073113, 1, 0.9058824, 0, 1,
-1.034849, 0.9265205, -0.8432948, 1, 0.9137255, 0, 1,
-1.034414, 1.264199, -1.559616, 1, 0.9176471, 0, 1,
-1.033053, -0.698008, -1.997076, 1, 0.9254902, 0, 1,
-1.027931, -1.37356, -1.677961, 1, 0.9294118, 0, 1,
-1.022969, -0.03547665, -1.378845, 1, 0.9372549, 0, 1,
-1.017709, 1.112436, -0.7790797, 1, 0.9411765, 0, 1,
-1.013478, 0.939393, -0.4239039, 1, 0.9490196, 0, 1,
-1.008824, 0.6618768, -0.6455388, 1, 0.9529412, 0, 1,
-1.000752, 0.4285168, -0.3456855, 1, 0.9607843, 0, 1,
-0.9995816, 0.2469103, -0.1644122, 1, 0.9647059, 0, 1,
-0.997516, -1.961802, -2.367593, 1, 0.972549, 0, 1,
-0.9880711, -0.9633723, -1.145292, 1, 0.9764706, 0, 1,
-0.9880374, -1.501697, -2.038985, 1, 0.9843137, 0, 1,
-0.986807, 0.1380847, -0.655006, 1, 0.9882353, 0, 1,
-0.9836805, -0.281346, -1.536199, 1, 0.9960784, 0, 1,
-0.9806547, -0.4584387, -0.1744119, 0.9960784, 1, 0, 1,
-0.9784951, 1.27871, -0.08486726, 0.9921569, 1, 0, 1,
-0.9747651, 1.933546, -2.519351, 0.9843137, 1, 0, 1,
-0.9708268, -0.6850902, -3.284937, 0.9803922, 1, 0, 1,
-0.9678347, 0.4090645, -1.821491, 0.972549, 1, 0, 1,
-0.9619176, -0.5099156, -2.268435, 0.9686275, 1, 0, 1,
-0.9606571, 1.131585, -0.895429, 0.9607843, 1, 0, 1,
-0.959435, 0.1246654, -1.035525, 0.9568627, 1, 0, 1,
-0.953103, -0.8526944, -1.966264, 0.9490196, 1, 0, 1,
-0.953024, -0.07412013, -1.42199, 0.945098, 1, 0, 1,
-0.9516266, 0.9844195, -1.694491, 0.9372549, 1, 0, 1,
-0.9441636, 1.243184, -0.08727625, 0.9333333, 1, 0, 1,
-0.9428216, -0.3405525, -3.286094, 0.9254902, 1, 0, 1,
-0.9423867, -1.062058, -3.406309, 0.9215686, 1, 0, 1,
-0.9418937, -1.499049, -1.327525, 0.9137255, 1, 0, 1,
-0.9390748, -0.7650099, -1.696017, 0.9098039, 1, 0, 1,
-0.9361164, -0.4900385, -1.627324, 0.9019608, 1, 0, 1,
-0.9350101, -0.3279687, -1.473746, 0.8941177, 1, 0, 1,
-0.9290011, -0.02173274, -2.077997, 0.8901961, 1, 0, 1,
-0.9288991, 1.251216, -1.397141, 0.8823529, 1, 0, 1,
-0.9279843, -1.758515, -4.060512, 0.8784314, 1, 0, 1,
-0.9181255, -0.3989696, -1.049946, 0.8705882, 1, 0, 1,
-0.9162403, 0.4036726, -1.378128, 0.8666667, 1, 0, 1,
-0.9128107, -0.5573517, -1.226786, 0.8588235, 1, 0, 1,
-0.9120402, -1.603284, -3.559747, 0.854902, 1, 0, 1,
-0.9114216, 0.2016412, -1.829271, 0.8470588, 1, 0, 1,
-0.9001782, -0.4666432, -0.9637179, 0.8431373, 1, 0, 1,
-0.8997834, -0.6571621, -1.918596, 0.8352941, 1, 0, 1,
-0.89561, 1.573692, -0.6854186, 0.8313726, 1, 0, 1,
-0.8904265, 0.3151197, -0.6142755, 0.8235294, 1, 0, 1,
-0.8890567, -0.007794017, -1.282356, 0.8196079, 1, 0, 1,
-0.8890299, -0.2048932, -2.77271, 0.8117647, 1, 0, 1,
-0.887041, -0.5496464, -2.864972, 0.8078431, 1, 0, 1,
-0.8855296, -0.5640535, -1.293771, 0.8, 1, 0, 1,
-0.8855133, -0.2182535, -2.250288, 0.7921569, 1, 0, 1,
-0.8831819, -0.302263, -2.056269, 0.7882353, 1, 0, 1,
-0.8802586, 0.2063984, 0.9928432, 0.7803922, 1, 0, 1,
-0.8791159, 1.465392, 0.6234363, 0.7764706, 1, 0, 1,
-0.8770685, 0.3083817, -1.267282, 0.7686275, 1, 0, 1,
-0.8708838, 0.09872486, -0.3597788, 0.7647059, 1, 0, 1,
-0.8701581, -0.00373476, -1.734029, 0.7568628, 1, 0, 1,
-0.8680981, 0.6812758, -1.527865, 0.7529412, 1, 0, 1,
-0.8676949, -2.36482, -3.498719, 0.7450981, 1, 0, 1,
-0.8618133, -0.9064237, -3.66242, 0.7411765, 1, 0, 1,
-0.8614831, 1.697196, 0.336942, 0.7333333, 1, 0, 1,
-0.8613771, -0.6521398, -1.757802, 0.7294118, 1, 0, 1,
-0.8563663, -1.758859, -2.950487, 0.7215686, 1, 0, 1,
-0.8535731, 0.7734102, -0.1591201, 0.7176471, 1, 0, 1,
-0.8516949, -0.9097269, -3.086459, 0.7098039, 1, 0, 1,
-0.8427178, 0.3471946, -0.6830392, 0.7058824, 1, 0, 1,
-0.8359066, 0.4237134, -0.9478996, 0.6980392, 1, 0, 1,
-0.831998, 0.0549452, -1.951287, 0.6901961, 1, 0, 1,
-0.8312684, -1.513524, -1.730342, 0.6862745, 1, 0, 1,
-0.8296766, -1.466067, -2.512391, 0.6784314, 1, 0, 1,
-0.828364, -0.2384818, -2.247663, 0.6745098, 1, 0, 1,
-0.8228697, 0.8412604, -0.5108028, 0.6666667, 1, 0, 1,
-0.8157237, 1.515321, 0.8953043, 0.6627451, 1, 0, 1,
-0.8133453, 0.1792499, 0.2751046, 0.654902, 1, 0, 1,
-0.7991717, 0.3233252, -0.1946263, 0.6509804, 1, 0, 1,
-0.7990962, 0.04544549, -3.148211, 0.6431373, 1, 0, 1,
-0.796129, -0.06284162, -0.6009492, 0.6392157, 1, 0, 1,
-0.7951722, 1.619911, 0.05672521, 0.6313726, 1, 0, 1,
-0.7908803, 0.3924467, -1.539285, 0.627451, 1, 0, 1,
-0.7896286, 0.3839956, -1.10632, 0.6196079, 1, 0, 1,
-0.7758666, 0.109411, -3.212814, 0.6156863, 1, 0, 1,
-0.769334, 1.377219, -1.884012, 0.6078432, 1, 0, 1,
-0.7691178, 0.1622887, -1.314397, 0.6039216, 1, 0, 1,
-0.7680252, 1.183887, -1.030066, 0.5960785, 1, 0, 1,
-0.7675964, -0.9755843, -1.440318, 0.5882353, 1, 0, 1,
-0.7623114, -0.5160444, -2.915378, 0.5843138, 1, 0, 1,
-0.7485092, -1.123586, -1.53067, 0.5764706, 1, 0, 1,
-0.7453007, -0.02083774, -1.258851, 0.572549, 1, 0, 1,
-0.7444896, -0.7918219, -1.338296, 0.5647059, 1, 0, 1,
-0.743939, -1.497452, -3.916606, 0.5607843, 1, 0, 1,
-0.7398145, -0.2113381, -0.2632438, 0.5529412, 1, 0, 1,
-0.7389669, 0.859184, -0.5975979, 0.5490196, 1, 0, 1,
-0.7385876, -0.7261581, -0.98048, 0.5411765, 1, 0, 1,
-0.7361542, -0.3844933, -0.1879223, 0.5372549, 1, 0, 1,
-0.7349211, 0.5200456, 0.136929, 0.5294118, 1, 0, 1,
-0.7344964, -1.517339, -1.781839, 0.5254902, 1, 0, 1,
-0.7317782, 0.003196749, -2.279333, 0.5176471, 1, 0, 1,
-0.728388, 0.2613496, -1.50506, 0.5137255, 1, 0, 1,
-0.7258266, 0.3932084, -0.7105271, 0.5058824, 1, 0, 1,
-0.7242894, 0.30373, -0.3866779, 0.5019608, 1, 0, 1,
-0.7125906, -0.03499621, -3.460449, 0.4941176, 1, 0, 1,
-0.7094061, -0.5345929, -0.1028039, 0.4862745, 1, 0, 1,
-0.703576, -0.7450077, -0.7229821, 0.4823529, 1, 0, 1,
-0.7032536, 0.3568239, -3.017421, 0.4745098, 1, 0, 1,
-0.7024753, -0.5285015, -3.394696, 0.4705882, 1, 0, 1,
-0.6933743, 0.6987082, -1.545202, 0.4627451, 1, 0, 1,
-0.6894132, -0.2081861, -0.7473747, 0.4588235, 1, 0, 1,
-0.6888574, -0.8613566, -3.311926, 0.4509804, 1, 0, 1,
-0.6814319, 0.3162462, -1.49319, 0.4470588, 1, 0, 1,
-0.6767548, 0.4439287, -1.487208, 0.4392157, 1, 0, 1,
-0.6732211, -1.131682, -1.007407, 0.4352941, 1, 0, 1,
-0.6668621, 1.2632, -0.1775907, 0.427451, 1, 0, 1,
-0.6651677, 1.391296, -0.712291, 0.4235294, 1, 0, 1,
-0.6613117, 0.9882289, -0.3453255, 0.4156863, 1, 0, 1,
-0.6560389, -1.185838, -1.679056, 0.4117647, 1, 0, 1,
-0.6523599, 0.102564, -2.233924, 0.4039216, 1, 0, 1,
-0.6442472, -0.0233194, -1.511202, 0.3960784, 1, 0, 1,
-0.643346, 2.006056, 0.4239563, 0.3921569, 1, 0, 1,
-0.6418555, 0.7308993, -0.09391525, 0.3843137, 1, 0, 1,
-0.6382732, -1.125097, -4.359637, 0.3803922, 1, 0, 1,
-0.6364012, 0.02355611, -3.506874, 0.372549, 1, 0, 1,
-0.6294774, -0.8307266, -1.932176, 0.3686275, 1, 0, 1,
-0.6292548, -1.307142, -2.193945, 0.3607843, 1, 0, 1,
-0.6254467, 0.7223172, 0.8805125, 0.3568628, 1, 0, 1,
-0.6238505, 0.5572685, -1.463805, 0.3490196, 1, 0, 1,
-0.6237962, 1.259407, 1.087901, 0.345098, 1, 0, 1,
-0.623069, 0.9297192, -0.9715443, 0.3372549, 1, 0, 1,
-0.622196, -2.331537, -2.703816, 0.3333333, 1, 0, 1,
-0.6217317, -0.1798676, -3.338872, 0.3254902, 1, 0, 1,
-0.620442, -0.7966468, -1.674714, 0.3215686, 1, 0, 1,
-0.6169966, 0.1087951, -2.688346, 0.3137255, 1, 0, 1,
-0.6154745, -0.1342531, -0.7171127, 0.3098039, 1, 0, 1,
-0.6076195, 0.2556782, -0.8453825, 0.3019608, 1, 0, 1,
-0.607313, 0.3863178, -0.4137491, 0.2941177, 1, 0, 1,
-0.6014002, 0.4538527, -0.9437481, 0.2901961, 1, 0, 1,
-0.5969629, 0.02005249, -1.676261, 0.282353, 1, 0, 1,
-0.5886427, 1.610795, 0.5719284, 0.2784314, 1, 0, 1,
-0.588526, -0.1660919, 0.08968034, 0.2705882, 1, 0, 1,
-0.5855977, -0.3617947, -1.562517, 0.2666667, 1, 0, 1,
-0.5810198, -0.2755405, -1.839365, 0.2588235, 1, 0, 1,
-0.5773399, -0.09458623, -3.48745, 0.254902, 1, 0, 1,
-0.5772208, 0.02354434, -1.46795, 0.2470588, 1, 0, 1,
-0.5757705, 0.9719255, 0.3414583, 0.2431373, 1, 0, 1,
-0.5671182, 0.6383567, -1.455444, 0.2352941, 1, 0, 1,
-0.5654538, 0.09689872, -0.322583, 0.2313726, 1, 0, 1,
-0.5635968, -0.4282342, -0.8289184, 0.2235294, 1, 0, 1,
-0.5416315, -0.4768559, -3.839177, 0.2196078, 1, 0, 1,
-0.53367, 0.7422297, -1.380537, 0.2117647, 1, 0, 1,
-0.5314839, 1.131754, 0.2163488, 0.2078431, 1, 0, 1,
-0.5314586, 1.740849, -1.327171, 0.2, 1, 0, 1,
-0.5298924, 0.1989046, -1.986655, 0.1921569, 1, 0, 1,
-0.5282857, -0.005538572, -1.405641, 0.1882353, 1, 0, 1,
-0.5262716, -0.7662514, -2.560889, 0.1803922, 1, 0, 1,
-0.5223381, 1.600527, 0.6245809, 0.1764706, 1, 0, 1,
-0.5192862, -0.9860123, -3.067405, 0.1686275, 1, 0, 1,
-0.5187124, 1.4691, 0.7343709, 0.1647059, 1, 0, 1,
-0.5171344, 1.141794, -2.244382, 0.1568628, 1, 0, 1,
-0.5151405, -0.4374515, -3.158775, 0.1529412, 1, 0, 1,
-0.5070755, 0.1491722, -1.7302, 0.145098, 1, 0, 1,
-0.5058135, 2.00036, 0.9754686, 0.1411765, 1, 0, 1,
-0.5012073, 0.3510758, -0.7642453, 0.1333333, 1, 0, 1,
-0.4953782, 0.6572288, -1.444789, 0.1294118, 1, 0, 1,
-0.4943311, 1.002142, -0.4693151, 0.1215686, 1, 0, 1,
-0.4880534, 0.4904802, -1.10105, 0.1176471, 1, 0, 1,
-0.4869721, 0.1547182, -1.16028, 0.1098039, 1, 0, 1,
-0.4840552, -0.5064703, -2.727161, 0.1058824, 1, 0, 1,
-0.4839608, -0.3615208, -1.5573, 0.09803922, 1, 0, 1,
-0.4813051, -0.346157, -2.541187, 0.09019608, 1, 0, 1,
-0.4810048, -0.2469595, -2.556962, 0.08627451, 1, 0, 1,
-0.478795, -0.09341717, -2.993454, 0.07843138, 1, 0, 1,
-0.4774184, -0.5495782, -1.114653, 0.07450981, 1, 0, 1,
-0.4761854, -0.6735386, -1.208647, 0.06666667, 1, 0, 1,
-0.4751061, 1.699247, -0.5969284, 0.0627451, 1, 0, 1,
-0.4699846, -0.2566141, -1.573051, 0.05490196, 1, 0, 1,
-0.469979, 0.05817994, 0.1543811, 0.05098039, 1, 0, 1,
-0.4686483, -0.0359203, -1.191208, 0.04313726, 1, 0, 1,
-0.4673111, 0.973314, -1.368298, 0.03921569, 1, 0, 1,
-0.4643857, -1.02993, -3.540137, 0.03137255, 1, 0, 1,
-0.4611453, 0.180199, -1.417236, 0.02745098, 1, 0, 1,
-0.4512615, 0.941674, 0.1979477, 0.01960784, 1, 0, 1,
-0.4505079, 1.010007, -1.674306, 0.01568628, 1, 0, 1,
-0.4496237, -0.8355945, -2.334349, 0.007843138, 1, 0, 1,
-0.4459751, -0.8739487, -2.912615, 0.003921569, 1, 0, 1,
-0.4446396, 0.2625753, -1.07829, 0, 1, 0.003921569, 1,
-0.4424861, 1.491866, -2.453891, 0, 1, 0.01176471, 1,
-0.4424496, -0.7412742, -3.643109, 0, 1, 0.01568628, 1,
-0.4399814, 0.08918784, -2.079015, 0, 1, 0.02352941, 1,
-0.43454, -1.41485, -4.300043, 0, 1, 0.02745098, 1,
-0.433851, 2.098704, 0.8961621, 0, 1, 0.03529412, 1,
-0.4297858, -0.1192584, -2.0346, 0, 1, 0.03921569, 1,
-0.4285656, -0.05332561, -0.2350865, 0, 1, 0.04705882, 1,
-0.4273694, -0.0003171638, -2.02274, 0, 1, 0.05098039, 1,
-0.4254323, 0.5276803, -0.5104386, 0, 1, 0.05882353, 1,
-0.4210632, -0.3713088, -1.005905, 0, 1, 0.0627451, 1,
-0.4192538, -0.2082617, -0.858303, 0, 1, 0.07058824, 1,
-0.4115162, 0.4202791, -0.8266277, 0, 1, 0.07450981, 1,
-0.4101403, -0.1137553, -0.7161315, 0, 1, 0.08235294, 1,
-0.4072541, -0.9396798, -3.666616, 0, 1, 0.08627451, 1,
-0.406884, 1.643241, -0.3098919, 0, 1, 0.09411765, 1,
-0.3958815, -1.99997, -2.365447, 0, 1, 0.1019608, 1,
-0.3948448, -0.5294429, -0.1222995, 0, 1, 0.1058824, 1,
-0.3919376, -1.333683, -2.539202, 0, 1, 0.1137255, 1,
-0.3917349, 0.6733834, -1.533001, 0, 1, 0.1176471, 1,
-0.391137, -0.3476898, -2.385771, 0, 1, 0.1254902, 1,
-0.3897334, 1.123117, -0.7047883, 0, 1, 0.1294118, 1,
-0.3838343, -0.9508821, -2.443601, 0, 1, 0.1372549, 1,
-0.3806642, -1.662974, -2.529057, 0, 1, 0.1411765, 1,
-0.3804061, -1.993431, -4.038296, 0, 1, 0.1490196, 1,
-0.3790779, -0.2665548, -1.93911, 0, 1, 0.1529412, 1,
-0.3790742, -0.5154319, -4.081052, 0, 1, 0.1607843, 1,
-0.3790734, 0.638742, 1.059603, 0, 1, 0.1647059, 1,
-0.3788346, -0.7411691, -2.30078, 0, 1, 0.172549, 1,
-0.3783595, 1.880973, -0.07066583, 0, 1, 0.1764706, 1,
-0.3730602, 0.5734688, 0.5262539, 0, 1, 0.1843137, 1,
-0.3728756, 0.2677292, -0.1519753, 0, 1, 0.1882353, 1,
-0.372834, -0.230002, -2.549604, 0, 1, 0.1960784, 1,
-0.372577, 0.72901, -0.0512795, 0, 1, 0.2039216, 1,
-0.3645549, -0.1649089, -2.334036, 0, 1, 0.2078431, 1,
-0.3596939, -0.3063172, -3.513885, 0, 1, 0.2156863, 1,
-0.3573557, -1.315304, -1.945721, 0, 1, 0.2196078, 1,
-0.3523549, -0.1480458, -0.8827139, 0, 1, 0.227451, 1,
-0.3500214, -0.2148748, -1.862015, 0, 1, 0.2313726, 1,
-0.3498768, -1.044137, -5.566272, 0, 1, 0.2392157, 1,
-0.3454226, -0.0213328, -1.00298, 0, 1, 0.2431373, 1,
-0.345234, 0.2090535, -0.2431349, 0, 1, 0.2509804, 1,
-0.3389524, -1.137651, -2.873586, 0, 1, 0.254902, 1,
-0.338457, -0.2045202, -0.287573, 0, 1, 0.2627451, 1,
-0.3366938, -0.5748001, -3.485743, 0, 1, 0.2666667, 1,
-0.3350316, 0.9507796, 0.4328811, 0, 1, 0.2745098, 1,
-0.3244372, 0.6949662, -0.9239293, 0, 1, 0.2784314, 1,
-0.3227102, -0.4993132, -2.946562, 0, 1, 0.2862745, 1,
-0.3212166, 0.4591948, -0.7782475, 0, 1, 0.2901961, 1,
-0.3190799, -0.4460847, -1.825602, 0, 1, 0.2980392, 1,
-0.3181993, 0.1758298, -1.047373, 0, 1, 0.3058824, 1,
-0.3181909, 0.3871924, -2.444503, 0, 1, 0.3098039, 1,
-0.3123754, -0.3979768, -3.92224, 0, 1, 0.3176471, 1,
-0.3121803, -0.03000519, -2.554988, 0, 1, 0.3215686, 1,
-0.3055283, 1.283657, -0.1822011, 0, 1, 0.3294118, 1,
-0.3041667, 0.7981781, -0.5108535, 0, 1, 0.3333333, 1,
-0.3028933, 1.363522, -0.5873901, 0, 1, 0.3411765, 1,
-0.3004662, -0.387064, -1.002894, 0, 1, 0.345098, 1,
-0.3002762, 0.02409231, -1.209377, 0, 1, 0.3529412, 1,
-0.2916256, 1.735558, 0.8676463, 0, 1, 0.3568628, 1,
-0.289642, 0.4417532, 0.2320968, 0, 1, 0.3647059, 1,
-0.2885904, -0.5413335, -2.839043, 0, 1, 0.3686275, 1,
-0.2857724, -1.257618, -3.304745, 0, 1, 0.3764706, 1,
-0.2848983, -1.48015, -2.032032, 0, 1, 0.3803922, 1,
-0.2814744, 1.158409, 0.08507883, 0, 1, 0.3882353, 1,
-0.2796451, 0.05379594, -2.857124, 0, 1, 0.3921569, 1,
-0.2782334, 0.1178766, -2.456844, 0, 1, 0.4, 1,
-0.2778286, 1.603409, -0.3865358, 0, 1, 0.4078431, 1,
-0.2750426, 1.7324, -0.9604257, 0, 1, 0.4117647, 1,
-0.2696579, -0.2110685, -2.097978, 0, 1, 0.4196078, 1,
-0.2687398, 0.2978966, -1.716963, 0, 1, 0.4235294, 1,
-0.261099, 0.2264874, -1.138379, 0, 1, 0.4313726, 1,
-0.2593761, -2.250111, -2.311315, 0, 1, 0.4352941, 1,
-0.259157, 1.069535, -0.3718482, 0, 1, 0.4431373, 1,
-0.2580944, -0.747425, -2.602963, 0, 1, 0.4470588, 1,
-0.255757, 0.8260226, 1.608562, 0, 1, 0.454902, 1,
-0.254267, 1.278427, 1.701707, 0, 1, 0.4588235, 1,
-0.2460847, 1.865829, -0.6729453, 0, 1, 0.4666667, 1,
-0.2452556, -1.563785, -3.117251, 0, 1, 0.4705882, 1,
-0.2437666, -0.2910734, -1.715636, 0, 1, 0.4784314, 1,
-0.2435903, -0.7508244, -2.522897, 0, 1, 0.4823529, 1,
-0.2417471, -0.5111691, -2.512717, 0, 1, 0.4901961, 1,
-0.2391616, -1.098339, -1.546738, 0, 1, 0.4941176, 1,
-0.2372778, -0.6005588, -1.901551, 0, 1, 0.5019608, 1,
-0.2350462, 0.34823, -0.9353375, 0, 1, 0.509804, 1,
-0.234061, -0.8471538, -3.375855, 0, 1, 0.5137255, 1,
-0.234035, 0.4962892, -1.00755, 0, 1, 0.5215687, 1,
-0.2326276, -0.7091817, -0.3436576, 0, 1, 0.5254902, 1,
-0.2285281, -1.072069, -4.440999, 0, 1, 0.5333334, 1,
-0.2275357, -0.4821461, -1.044533, 0, 1, 0.5372549, 1,
-0.218937, -1.417794, -4.117918, 0, 1, 0.5450981, 1,
-0.2149164, -0.3745836, -1.094919, 0, 1, 0.5490196, 1,
-0.2134874, 1.684324, -0.816047, 0, 1, 0.5568628, 1,
-0.2133486, -0.348513, -3.704805, 0, 1, 0.5607843, 1,
-0.211144, -0.8892152, -2.880139, 0, 1, 0.5686275, 1,
-0.2033596, -0.8250068, -4.648932, 0, 1, 0.572549, 1,
-0.1989395, 0.003473375, -0.38018, 0, 1, 0.5803922, 1,
-0.1971808, 0.7363907, 0.5914111, 0, 1, 0.5843138, 1,
-0.1968634, 0.6491139, -1.248245, 0, 1, 0.5921569, 1,
-0.1955612, 0.3640255, -0.7475404, 0, 1, 0.5960785, 1,
-0.1938272, -0.3428887, -2.699178, 0, 1, 0.6039216, 1,
-0.1926045, 1.778477, -0.726325, 0, 1, 0.6117647, 1,
-0.1924225, 0.587793, -0.5793402, 0, 1, 0.6156863, 1,
-0.1896223, 1.14011, -0.4584678, 0, 1, 0.6235294, 1,
-0.189147, -0.8557978, -1.329399, 0, 1, 0.627451, 1,
-0.1872753, 1.515539, 0.4184223, 0, 1, 0.6352941, 1,
-0.1851595, -1.330451, -2.843333, 0, 1, 0.6392157, 1,
-0.1851542, 0.7185262, 0.4924512, 0, 1, 0.6470588, 1,
-0.1822861, -1.171805, -2.560163, 0, 1, 0.6509804, 1,
-0.1812863, 0.3226291, -1.164834, 0, 1, 0.6588235, 1,
-0.180551, -0.4812812, -3.520333, 0, 1, 0.6627451, 1,
-0.180448, -0.6110024, -3.428498, 0, 1, 0.6705883, 1,
-0.1782814, -0.05903419, -1.281002, 0, 1, 0.6745098, 1,
-0.1780345, 2.195654, 0.1447046, 0, 1, 0.682353, 1,
-0.1764591, 0.3498914, -0.6372271, 0, 1, 0.6862745, 1,
-0.1739577, -0.3598768, -2.17718, 0, 1, 0.6941177, 1,
-0.164718, 1.388376, -1.157043, 0, 1, 0.7019608, 1,
-0.1624963, -0.7738234, -2.97243, 0, 1, 0.7058824, 1,
-0.1623763, -1.407673, -1.964249, 0, 1, 0.7137255, 1,
-0.1597599, 0.6667603, 1.041432, 0, 1, 0.7176471, 1,
-0.1534633, -0.7987909, -2.867998, 0, 1, 0.7254902, 1,
-0.148841, -1.901743, -3.753544, 0, 1, 0.7294118, 1,
-0.1445099, 0.2201804, -0.3622271, 0, 1, 0.7372549, 1,
-0.1432985, 1.2577, 1.5433, 0, 1, 0.7411765, 1,
-0.1432111, 0.5442561, -0.1758131, 0, 1, 0.7490196, 1,
-0.1429825, 0.08349641, -1.372599, 0, 1, 0.7529412, 1,
-0.13948, -0.4129384, -2.690813, 0, 1, 0.7607843, 1,
-0.1358433, -1.026328, -3.164426, 0, 1, 0.7647059, 1,
-0.131875, -1.342727, -2.714591, 0, 1, 0.772549, 1,
-0.130197, -0.5785993, -0.7239423, 0, 1, 0.7764706, 1,
-0.1272268, -0.7047486, -4.139472, 0, 1, 0.7843137, 1,
-0.1266516, 0.8108953, 1.180076, 0, 1, 0.7882353, 1,
-0.1263355, 1.5462, -0.8504469, 0, 1, 0.7960784, 1,
-0.1221648, -0.5610619, -3.504629, 0, 1, 0.8039216, 1,
-0.1195991, -0.1801323, -5.531698, 0, 1, 0.8078431, 1,
-0.114502, -0.3789534, -1.598659, 0, 1, 0.8156863, 1,
-0.1133971, -0.2431206, -2.224558, 0, 1, 0.8196079, 1,
-0.1126063, 0.6730824, 0.05016821, 0, 1, 0.827451, 1,
-0.112194, 1.093152, -0.9542543, 0, 1, 0.8313726, 1,
-0.1110526, -1.103056, -3.124495, 0, 1, 0.8392157, 1,
-0.1094782, -0.8338903, -3.090707, 0, 1, 0.8431373, 1,
-0.1082409, 1.215221, 0.09164724, 0, 1, 0.8509804, 1,
-0.1053929, -0.2711436, -2.565697, 0, 1, 0.854902, 1,
-0.1050073, -0.2672896, -3.126656, 0, 1, 0.8627451, 1,
-0.1024042, 0.9836766, 0.6091661, 0, 1, 0.8666667, 1,
-0.100294, -0.7100012, -1.839866, 0, 1, 0.8745098, 1,
-0.09867928, -1.247826, -3.329578, 0, 1, 0.8784314, 1,
-0.09625666, -0.6444455, -2.898599, 0, 1, 0.8862745, 1,
-0.09231202, -2.347347, -3.55738, 0, 1, 0.8901961, 1,
-0.08857983, -2.604286, -4.061402, 0, 1, 0.8980392, 1,
-0.08823352, 0.2492663, -0.2827094, 0, 1, 0.9058824, 1,
-0.08687067, 1.190655, 0.9906633, 0, 1, 0.9098039, 1,
-0.08490741, -1.892107, -2.451839, 0, 1, 0.9176471, 1,
-0.08256005, 1.660398, -1.083681, 0, 1, 0.9215686, 1,
-0.07356093, 1.418287, 0.5065469, 0, 1, 0.9294118, 1,
-0.07051098, -0.07855064, -0.1454927, 0, 1, 0.9333333, 1,
-0.06884478, -1.17486, -3.671348, 0, 1, 0.9411765, 1,
-0.0621837, -0.8572001, -2.282459, 0, 1, 0.945098, 1,
-0.04863347, 0.142375, -0.6884944, 0, 1, 0.9529412, 1,
-0.04539857, 1.037149, 0.01622036, 0, 1, 0.9568627, 1,
-0.04440815, 0.7072201, 0.1925255, 0, 1, 0.9647059, 1,
-0.04301096, 0.8261246, 0.7509184, 0, 1, 0.9686275, 1,
-0.0418886, -0.3109963, -2.830374, 0, 1, 0.9764706, 1,
-0.04158634, -1.643444, -3.587635, 0, 1, 0.9803922, 1,
-0.03828665, -0.2335732, -3.067786, 0, 1, 0.9882353, 1,
-0.02828266, 0.5014095, -0.02186006, 0, 1, 0.9921569, 1,
-0.02713278, 0.8746968, 1.898069, 0, 1, 1, 1,
-0.02655936, -0.2175153, -1.457992, 0, 0.9921569, 1, 1,
-0.02639013, -0.1565473, -3.805904, 0, 0.9882353, 1, 1,
-0.01718851, -0.9453284, -3.146592, 0, 0.9803922, 1, 1,
-0.01705704, -1.879189, -2.911696, 0, 0.9764706, 1, 1,
-0.01547614, -2.365918, -2.045501, 0, 0.9686275, 1, 1,
-0.01511404, 0.3219293, 0.8944427, 0, 0.9647059, 1, 1,
-0.01022895, -0.02046691, -0.9788885, 0, 0.9568627, 1, 1,
-0.01021817, 1.270823, -0.05478854, 0, 0.9529412, 1, 1,
-0.01009517, 0.6584388, -1.565271, 0, 0.945098, 1, 1,
-0.007504499, -0.7638213, -2.993784, 0, 0.9411765, 1, 1,
-0.005493165, 0.4318486, -1.816882, 0, 0.9333333, 1, 1,
-0.002202231, 1.296041, -0.7251629, 0, 0.9294118, 1, 1,
2.102604e-05, -2.423632, 3.776626, 0, 0.9215686, 1, 1,
0.003858759, -0.5610609, 4.207894, 0, 0.9176471, 1, 1,
0.003865344, 1.094134, -1.526268, 0, 0.9098039, 1, 1,
0.0072086, 2.71066, -0.3512178, 0, 0.9058824, 1, 1,
0.00747589, -0.6483505, 4.162753, 0, 0.8980392, 1, 1,
0.007934676, 0.5348861, -1.387247, 0, 0.8901961, 1, 1,
0.01116516, -0.395318, 1.716152, 0, 0.8862745, 1, 1,
0.01148326, -1.30782, 1.684674, 0, 0.8784314, 1, 1,
0.01428162, 0.268802, 0.9751928, 0, 0.8745098, 1, 1,
0.01454345, 1.274717, 1.127759, 0, 0.8666667, 1, 1,
0.01502013, -1.192337, 2.196987, 0, 0.8627451, 1, 1,
0.0183098, -0.1840647, 2.897217, 0, 0.854902, 1, 1,
0.02125972, 0.1973352, 0.1426602, 0, 0.8509804, 1, 1,
0.02410157, 0.5794438, -1.197048, 0, 0.8431373, 1, 1,
0.0268537, -0.3644219, 3.235526, 0, 0.8392157, 1, 1,
0.02899727, -0.9069992, 3.045473, 0, 0.8313726, 1, 1,
0.03129601, 1.933842, -0.9638234, 0, 0.827451, 1, 1,
0.03344175, -1.119666, 2.558655, 0, 0.8196079, 1, 1,
0.03567664, -0.5046684, 3.785951, 0, 0.8156863, 1, 1,
0.03610613, 1.812794, 0.06930017, 0, 0.8078431, 1, 1,
0.03684703, -0.8759765, 3.632969, 0, 0.8039216, 1, 1,
0.03906941, 0.3292286, 0.2382672, 0, 0.7960784, 1, 1,
0.04417853, -1.222746, 3.237554, 0, 0.7882353, 1, 1,
0.04804118, 0.6734062, -1.947203, 0, 0.7843137, 1, 1,
0.04829854, 0.8849478, -0.02784394, 0, 0.7764706, 1, 1,
0.04911273, 0.07296427, 1.384622, 0, 0.772549, 1, 1,
0.04937935, -1.109653, 2.966287, 0, 0.7647059, 1, 1,
0.05165603, 0.8205892, -0.1596474, 0, 0.7607843, 1, 1,
0.05661593, -1.545092, 2.862885, 0, 0.7529412, 1, 1,
0.05853298, 0.6182127, -1.347847, 0, 0.7490196, 1, 1,
0.06116779, 0.1634051, 0.9390225, 0, 0.7411765, 1, 1,
0.06186231, 2.816243, -0.7865166, 0, 0.7372549, 1, 1,
0.0673293, -0.4893358, 2.911199, 0, 0.7294118, 1, 1,
0.06760915, -0.03821559, 1.74024, 0, 0.7254902, 1, 1,
0.0677297, -2.297799, 3.632903, 0, 0.7176471, 1, 1,
0.06787448, -1.310124, 1.681478, 0, 0.7137255, 1, 1,
0.07180983, -0.3570172, 3.297972, 0, 0.7058824, 1, 1,
0.07191063, -0.2791488, 3.421097, 0, 0.6980392, 1, 1,
0.07392033, 0.7950911, -0.1610803, 0, 0.6941177, 1, 1,
0.07393378, -1.01083, 3.87179, 0, 0.6862745, 1, 1,
0.07504009, 0.5990657, -0.02706174, 0, 0.682353, 1, 1,
0.07512011, -1.682083, 2.460968, 0, 0.6745098, 1, 1,
0.07874016, 0.1606764, 0.4932563, 0, 0.6705883, 1, 1,
0.08109906, -0.9354906, 3.671443, 0, 0.6627451, 1, 1,
0.09342995, 0.04191331, -0.4462972, 0, 0.6588235, 1, 1,
0.09369431, -0.290823, 2.129847, 0, 0.6509804, 1, 1,
0.09399081, -1.468201, 4.038295, 0, 0.6470588, 1, 1,
0.09623108, 0.3566437, 0.9767362, 0, 0.6392157, 1, 1,
0.09748226, 1.143623, 0.8703629, 0, 0.6352941, 1, 1,
0.09780784, 0.4729979, 0.08203641, 0, 0.627451, 1, 1,
0.09880973, 1.093995, -0.3833094, 0, 0.6235294, 1, 1,
0.101285, -0.4923562, 3.540677, 0, 0.6156863, 1, 1,
0.1013985, 0.9376582, 1.818387, 0, 0.6117647, 1, 1,
0.1033219, -1.760366, 2.450251, 0, 0.6039216, 1, 1,
0.110663, 0.1395039, 2.598626, 0, 0.5960785, 1, 1,
0.1109424, -0.360275, 2.733546, 0, 0.5921569, 1, 1,
0.1110445, 1.140615, 0.4501268, 0, 0.5843138, 1, 1,
0.1118968, -0.3396119, 2.689241, 0, 0.5803922, 1, 1,
0.1133287, -0.1918177, 2.36535, 0, 0.572549, 1, 1,
0.1218922, 0.5316792, -0.5764245, 0, 0.5686275, 1, 1,
0.127293, 0.1626264, 2.64094, 0, 0.5607843, 1, 1,
0.1275589, -0.8980291, 2.258546, 0, 0.5568628, 1, 1,
0.1278469, -0.7515528, 0.9108672, 0, 0.5490196, 1, 1,
0.1339763, 1.643687, -0.830395, 0, 0.5450981, 1, 1,
0.1349067, 0.6947428, 1.094752, 0, 0.5372549, 1, 1,
0.1364928, 0.249504, 2.809637, 0, 0.5333334, 1, 1,
0.1376063, 0.6464903, 2.474339, 0, 0.5254902, 1, 1,
0.1391012, -2.025124, 2.999265, 0, 0.5215687, 1, 1,
0.1414738, 0.7114519, 1.402606, 0, 0.5137255, 1, 1,
0.1418755, 0.502607, 0.2994771, 0, 0.509804, 1, 1,
0.1477706, -0.7018736, 3.980116, 0, 0.5019608, 1, 1,
0.1489011, -0.08617917, 2.215251, 0, 0.4941176, 1, 1,
0.1493435, 0.4506317, -0.2457561, 0, 0.4901961, 1, 1,
0.1500725, 1.806392, -1.002965, 0, 0.4823529, 1, 1,
0.1531764, 0.8286194, -0.5252042, 0, 0.4784314, 1, 1,
0.1549997, -0.2447868, 4.208453, 0, 0.4705882, 1, 1,
0.1583293, -0.2223601, 4.897761, 0, 0.4666667, 1, 1,
0.1666185, -0.6004853, 2.266737, 0, 0.4588235, 1, 1,
0.1697349, -1.211872, 1.259951, 0, 0.454902, 1, 1,
0.1700975, -0.9060751, 2.350063, 0, 0.4470588, 1, 1,
0.1744161, -0.07398753, 2.462352, 0, 0.4431373, 1, 1,
0.1754676, 1.400502, 1.938974, 0, 0.4352941, 1, 1,
0.1755705, -0.2306895, 2.632107, 0, 0.4313726, 1, 1,
0.180261, 0.6918304, -0.5014091, 0, 0.4235294, 1, 1,
0.1830503, 0.06939147, 0.8534289, 0, 0.4196078, 1, 1,
0.1845894, -1.087888, 4.705056, 0, 0.4117647, 1, 1,
0.1914096, -0.7157059, 2.46845, 0, 0.4078431, 1, 1,
0.1915088, -0.5012072, 1.727921, 0, 0.4, 1, 1,
0.1978916, 0.9687573, -0.957914, 0, 0.3921569, 1, 1,
0.1994961, 1.897911, -1.560156, 0, 0.3882353, 1, 1,
0.2023106, 1.117579, 0.6306399, 0, 0.3803922, 1, 1,
0.2034564, -2.065941, 3.819901, 0, 0.3764706, 1, 1,
0.2057071, 0.4143965, 0.4971114, 0, 0.3686275, 1, 1,
0.2083097, 1.373645, 1.18696, 0, 0.3647059, 1, 1,
0.2093152, 0.357616, 1.72469, 0, 0.3568628, 1, 1,
0.2100485, 0.7927331, 0.1248917, 0, 0.3529412, 1, 1,
0.2108012, -1.676074, 3.09653, 0, 0.345098, 1, 1,
0.2108728, 1.201877, -1.715455, 0, 0.3411765, 1, 1,
0.2116216, -0.8185405, 4.007888, 0, 0.3333333, 1, 1,
0.214296, -0.05272414, 2.276421, 0, 0.3294118, 1, 1,
0.2152294, -0.920061, 3.099165, 0, 0.3215686, 1, 1,
0.2167661, 0.6641582, -0.6285848, 0, 0.3176471, 1, 1,
0.2225292, 0.4372173, 1.945337, 0, 0.3098039, 1, 1,
0.2238849, -0.2095526, 1.954862, 0, 0.3058824, 1, 1,
0.2287062, 1.099023, -0.8104663, 0, 0.2980392, 1, 1,
0.232014, -0.6894531, 2.26931, 0, 0.2901961, 1, 1,
0.2417304, -0.1728693, 1.085735, 0, 0.2862745, 1, 1,
0.2428945, -0.2083956, 2.427889, 0, 0.2784314, 1, 1,
0.2444809, 2.030118, -1.67485, 0, 0.2745098, 1, 1,
0.246783, 1.036494, 0.9502754, 0, 0.2666667, 1, 1,
0.2481032, -0.4571479, 3.592335, 0, 0.2627451, 1, 1,
0.2583707, -0.8614044, 2.602701, 0, 0.254902, 1, 1,
0.2603548, 0.906343, 1.682025, 0, 0.2509804, 1, 1,
0.2604598, 1.183008, 0.7918079, 0, 0.2431373, 1, 1,
0.2647996, 0.6145255, -0.6151915, 0, 0.2392157, 1, 1,
0.2696853, 0.04050835, -0.3747787, 0, 0.2313726, 1, 1,
0.2718773, 1.293921, 0.2893832, 0, 0.227451, 1, 1,
0.2745399, -0.1028161, 0.8703099, 0, 0.2196078, 1, 1,
0.2771039, 0.6295743, 2.310075, 0, 0.2156863, 1, 1,
0.2791418, 2.039886, 1.039836, 0, 0.2078431, 1, 1,
0.2848668, 1.74576, 1.360109, 0, 0.2039216, 1, 1,
0.2851542, 0.6629385, 1.521904, 0, 0.1960784, 1, 1,
0.2911613, 0.8428066, 0.2361551, 0, 0.1882353, 1, 1,
0.2950404, -0.5605428, 3.625059, 0, 0.1843137, 1, 1,
0.297807, 0.3015631, 1.15401, 0, 0.1764706, 1, 1,
0.2984326, 0.2666414, -0.1782239, 0, 0.172549, 1, 1,
0.300901, 1.057026, 0.5606828, 0, 0.1647059, 1, 1,
0.3037368, -1.184744, 2.494006, 0, 0.1607843, 1, 1,
0.3079421, -0.3286755, 2.551237, 0, 0.1529412, 1, 1,
0.31675, 1.487818, -0.6277366, 0, 0.1490196, 1, 1,
0.3201937, 0.8867381, 1.898939, 0, 0.1411765, 1, 1,
0.3257687, -0.1222046, 2.157789, 0, 0.1372549, 1, 1,
0.3260415, -0.8521559, 2.003682, 0, 0.1294118, 1, 1,
0.3275095, 0.5649105, 1.670137, 0, 0.1254902, 1, 1,
0.3313191, 0.421487, 2.699259, 0, 0.1176471, 1, 1,
0.3324869, -0.3801763, 1.862286, 0, 0.1137255, 1, 1,
0.3404696, -1.997747, 1.850516, 0, 0.1058824, 1, 1,
0.3444589, -0.3707767, 2.001853, 0, 0.09803922, 1, 1,
0.3480166, 0.5060907, 1.134863, 0, 0.09411765, 1, 1,
0.3494702, -1.451184, 3.588546, 0, 0.08627451, 1, 1,
0.3559745, -0.5801572, 3.098905, 0, 0.08235294, 1, 1,
0.3632274, -1.169158, 2.41625, 0, 0.07450981, 1, 1,
0.3634814, 0.08050427, -0.1249301, 0, 0.07058824, 1, 1,
0.3636384, 0.698957, 0.7987941, 0, 0.0627451, 1, 1,
0.366234, 0.546262, 2.20102, 0, 0.05882353, 1, 1,
0.3688597, 1.518104, 0.7522189, 0, 0.05098039, 1, 1,
0.3728234, 1.722259, 1.096287, 0, 0.04705882, 1, 1,
0.3783652, 0.1598423, 0.9728658, 0, 0.03921569, 1, 1,
0.3785074, -0.293927, 2.742697, 0, 0.03529412, 1, 1,
0.3788861, 1.266833, -0.8273277, 0, 0.02745098, 1, 1,
0.3788977, 2.373814, -0.9633597, 0, 0.02352941, 1, 1,
0.378918, -1.356178, 2.946055, 0, 0.01568628, 1, 1,
0.3839395, -1.662143, 2.346442, 0, 0.01176471, 1, 1,
0.3842648, -1.392366, 1.696233, 0, 0.003921569, 1, 1,
0.3868971, 0.5049562, 1.061792, 0.003921569, 0, 1, 1,
0.3886137, -0.2047909, 2.571719, 0.007843138, 0, 1, 1,
0.39194, 1.20147, 0.01522056, 0.01568628, 0, 1, 1,
0.3953125, 1.097853, -0.09765965, 0.01960784, 0, 1, 1,
0.3955344, -0.7627704, 3.036549, 0.02745098, 0, 1, 1,
0.3997611, 0.9880348, 1.584023, 0.03137255, 0, 1, 1,
0.4014195, 1.790444, 0.6516677, 0.03921569, 0, 1, 1,
0.4017357, -0.5796869, 1.930805, 0.04313726, 0, 1, 1,
0.4058007, -1.167068, 1.046129, 0.05098039, 0, 1, 1,
0.4066912, -1.37634, 2.768715, 0.05490196, 0, 1, 1,
0.4141448, -0.6053953, 4.606005, 0.0627451, 0, 1, 1,
0.4192425, 0.644671, 1.2831, 0.06666667, 0, 1, 1,
0.4236451, 0.7329552, 0.5905051, 0.07450981, 0, 1, 1,
0.4239865, -0.7199379, 1.964079, 0.07843138, 0, 1, 1,
0.4244435, -0.5492691, 2.792855, 0.08627451, 0, 1, 1,
0.4263074, 0.8463399, 2.048916, 0.09019608, 0, 1, 1,
0.4277247, 1.021556, 1.028364, 0.09803922, 0, 1, 1,
0.428446, 1.242628, 0.1506397, 0.1058824, 0, 1, 1,
0.4304245, -0.7909193, 2.617409, 0.1098039, 0, 1, 1,
0.4328529, -0.5028799, 2.746535, 0.1176471, 0, 1, 1,
0.4350495, -0.07678358, 1.581773, 0.1215686, 0, 1, 1,
0.4372041, -0.7218806, 1.444748, 0.1294118, 0, 1, 1,
0.4437241, 1.550885, 0.9134086, 0.1333333, 0, 1, 1,
0.4455507, 0.05347611, 1.890848, 0.1411765, 0, 1, 1,
0.4474298, 0.9819305, -0.6661865, 0.145098, 0, 1, 1,
0.4481393, -0.3474048, 3.125467, 0.1529412, 0, 1, 1,
0.4505426, 0.1830728, 1.114235, 0.1568628, 0, 1, 1,
0.4525884, -0.06996483, 3.101019, 0.1647059, 0, 1, 1,
0.4551483, 1.915732, 0.2027697, 0.1686275, 0, 1, 1,
0.4575696, -1.252766, 3.60777, 0.1764706, 0, 1, 1,
0.4593042, -0.6388252, 2.226138, 0.1803922, 0, 1, 1,
0.4631183, -0.3502645, 0.4825468, 0.1882353, 0, 1, 1,
0.465096, -0.7139864, 2.871076, 0.1921569, 0, 1, 1,
0.4699459, -0.1862593, 1.443792, 0.2, 0, 1, 1,
0.4730834, 2.012981, -2.124132, 0.2078431, 0, 1, 1,
0.4750181, 0.411874, 2.376564, 0.2117647, 0, 1, 1,
0.4778531, 0.2004385, -1.042472, 0.2196078, 0, 1, 1,
0.4804253, 0.5558771, -0.02868669, 0.2235294, 0, 1, 1,
0.4812768, 1.392843, -0.5219231, 0.2313726, 0, 1, 1,
0.4880947, -0.7459699, 1.19984, 0.2352941, 0, 1, 1,
0.488214, -0.5409037, 2.785356, 0.2431373, 0, 1, 1,
0.4968204, -1.039151, 2.47185, 0.2470588, 0, 1, 1,
0.5004892, 0.5200787, 0.4873058, 0.254902, 0, 1, 1,
0.502225, -0.3542185, 0.4790652, 0.2588235, 0, 1, 1,
0.5084683, 0.431582, 1.684597, 0.2666667, 0, 1, 1,
0.5109317, -1.121963, 3.475387, 0.2705882, 0, 1, 1,
0.5123115, 0.3382991, 1.441293, 0.2784314, 0, 1, 1,
0.5127083, -0.5166112, 2.262832, 0.282353, 0, 1, 1,
0.518434, 0.5509707, 0.497902, 0.2901961, 0, 1, 1,
0.5206667, -1.009788, 2.884206, 0.2941177, 0, 1, 1,
0.5210901, -0.1501056, 2.825727, 0.3019608, 0, 1, 1,
0.5218387, -0.6464958, 2.26146, 0.3098039, 0, 1, 1,
0.5220274, -0.5568692, 1.869769, 0.3137255, 0, 1, 1,
0.5232013, -0.5966431, 2.843443, 0.3215686, 0, 1, 1,
0.5302415, -0.1781569, 1.423164, 0.3254902, 0, 1, 1,
0.5322148, -1.633211, 0.7540824, 0.3333333, 0, 1, 1,
0.5339067, 1.23107, 0.5882046, 0.3372549, 0, 1, 1,
0.5341564, -0.6938993, 2.272895, 0.345098, 0, 1, 1,
0.535065, -0.4604809, 2.082249, 0.3490196, 0, 1, 1,
0.5404244, 0.3707145, 0.3400934, 0.3568628, 0, 1, 1,
0.5498856, -0.5608718, 1.417688, 0.3607843, 0, 1, 1,
0.5557655, -1.105913, 1.876316, 0.3686275, 0, 1, 1,
0.5623819, 0.947443, -0.5821549, 0.372549, 0, 1, 1,
0.5659942, 0.1655066, 0.2723282, 0.3803922, 0, 1, 1,
0.5777377, -1.223879, 2.111639, 0.3843137, 0, 1, 1,
0.5877755, 0.646131, -0.9761264, 0.3921569, 0, 1, 1,
0.5881007, -1.075047, 3.221311, 0.3960784, 0, 1, 1,
0.5910788, -1.594498, 2.186347, 0.4039216, 0, 1, 1,
0.5966201, 0.2143597, 0.9055706, 0.4117647, 0, 1, 1,
0.5968636, 1.825738, 0.9023753, 0.4156863, 0, 1, 1,
0.6004168, 1.087062, -0.3708749, 0.4235294, 0, 1, 1,
0.6019329, -0.07565028, 1.428352, 0.427451, 0, 1, 1,
0.6084296, 1.039873, 0.09247664, 0.4352941, 0, 1, 1,
0.608767, 0.2434541, 1.015245, 0.4392157, 0, 1, 1,
0.6094885, -1.285715, 2.795801, 0.4470588, 0, 1, 1,
0.6194924, 0.7444582, -0.7827116, 0.4509804, 0, 1, 1,
0.621964, -0.2369151, 1.833049, 0.4588235, 0, 1, 1,
0.6248542, -0.3780158, 1.533555, 0.4627451, 0, 1, 1,
0.6400633, 1.347017, 0.3700949, 0.4705882, 0, 1, 1,
0.6405929, 2.083049, 1.175227, 0.4745098, 0, 1, 1,
0.6451392, 0.8982016, 0.7840784, 0.4823529, 0, 1, 1,
0.6525878, -2.526269, 3.667668, 0.4862745, 0, 1, 1,
0.6528876, 1.772199, 0.8741486, 0.4941176, 0, 1, 1,
0.654359, -1.569654, 2.592159, 0.5019608, 0, 1, 1,
0.654442, -0.08128657, -0.2431294, 0.5058824, 0, 1, 1,
0.6554169, -0.08254237, 2.077114, 0.5137255, 0, 1, 1,
0.6555048, 1.749658, -2.184131, 0.5176471, 0, 1, 1,
0.6615672, 0.5910236, 0.9621989, 0.5254902, 0, 1, 1,
0.6621929, 0.3229178, 2.530133, 0.5294118, 0, 1, 1,
0.6663333, -0.4593556, 2.698059, 0.5372549, 0, 1, 1,
0.6692122, -1.299625, 2.718647, 0.5411765, 0, 1, 1,
0.6696851, 2.114099, -0.3032023, 0.5490196, 0, 1, 1,
0.6714376, 0.9758646, -0.2498664, 0.5529412, 0, 1, 1,
0.6720545, -0.2899552, 2.112559, 0.5607843, 0, 1, 1,
0.6753103, 0.8720469, -0.8281705, 0.5647059, 0, 1, 1,
0.6780544, -1.035203, 0.8691481, 0.572549, 0, 1, 1,
0.6825653, 0.3228003, 3.153768, 0.5764706, 0, 1, 1,
0.6857332, -0.4033157, 2.491472, 0.5843138, 0, 1, 1,
0.6887209, -0.3028294, -0.004604215, 0.5882353, 0, 1, 1,
0.6899356, -1.776591, 4.681696, 0.5960785, 0, 1, 1,
0.6904176, -1.695448, 3.071241, 0.6039216, 0, 1, 1,
0.6940185, 1.135436, 0.8851824, 0.6078432, 0, 1, 1,
0.6945345, -0.2350919, 2.584614, 0.6156863, 0, 1, 1,
0.7014937, -1.515651, 2.339803, 0.6196079, 0, 1, 1,
0.7066123, -1.450561, 2.384138, 0.627451, 0, 1, 1,
0.719363, -0.673332, 1.212098, 0.6313726, 0, 1, 1,
0.7195077, -0.6157572, 1.634672, 0.6392157, 0, 1, 1,
0.7324458, 0.5615401, 1.402762, 0.6431373, 0, 1, 1,
0.7324945, 0.9706457, 0.793521, 0.6509804, 0, 1, 1,
0.7373472, -2.461614, 2.856738, 0.654902, 0, 1, 1,
0.7393769, 1.89817, 1.270515, 0.6627451, 0, 1, 1,
0.7449122, -0.5130821, 2.294359, 0.6666667, 0, 1, 1,
0.7510632, -0.5252632, 2.564514, 0.6745098, 0, 1, 1,
0.7596595, 0.7845078, 1.022784, 0.6784314, 0, 1, 1,
0.7632852, 1.824342, 0.6715407, 0.6862745, 0, 1, 1,
0.7656354, 2.296351, 0.7163956, 0.6901961, 0, 1, 1,
0.7666215, -0.5178978, 1.806466, 0.6980392, 0, 1, 1,
0.7688633, 1.313127, -0.02095821, 0.7058824, 0, 1, 1,
0.7718056, -0.05821889, 1.831848, 0.7098039, 0, 1, 1,
0.7720841, 0.9718448, 1.548197, 0.7176471, 0, 1, 1,
0.7728236, 0.285287, 0.2961252, 0.7215686, 0, 1, 1,
0.7732854, 0.8486847, -0.05763665, 0.7294118, 0, 1, 1,
0.7770965, 1.37588, -0.1500516, 0.7333333, 0, 1, 1,
0.7782394, 1.596161, 0.3587322, 0.7411765, 0, 1, 1,
0.7803549, 1.451033, -0.5497839, 0.7450981, 0, 1, 1,
0.7805618, -0.4493807, 3.561161, 0.7529412, 0, 1, 1,
0.7810647, -1.430325, 2.714431, 0.7568628, 0, 1, 1,
0.788434, 1.673848, 0.2037146, 0.7647059, 0, 1, 1,
0.7989923, 0.512789, -0.1141845, 0.7686275, 0, 1, 1,
0.8064084, -0.07391312, 1.784433, 0.7764706, 0, 1, 1,
0.8114392, -0.6918439, 1.667025, 0.7803922, 0, 1, 1,
0.812976, 1.233544, 3.197544, 0.7882353, 0, 1, 1,
0.8160014, -0.2631035, 0.7797049, 0.7921569, 0, 1, 1,
0.8205128, 0.7249315, 0.2710089, 0.8, 0, 1, 1,
0.8211151, 0.1786081, 1.617688, 0.8078431, 0, 1, 1,
0.8218269, 1.474228, 0.09705583, 0.8117647, 0, 1, 1,
0.8249713, -0.4128935, 2.925483, 0.8196079, 0, 1, 1,
0.8277659, 0.01226792, 1.426017, 0.8235294, 0, 1, 1,
0.8280513, -0.3830816, 2.45089, 0.8313726, 0, 1, 1,
0.8337277, 0.612725, -0.1678721, 0.8352941, 0, 1, 1,
0.8407844, 0.2258208, 1.895357, 0.8431373, 0, 1, 1,
0.8408888, -0.8849311, 2.479033, 0.8470588, 0, 1, 1,
0.8435251, -0.2001883, 2.118578, 0.854902, 0, 1, 1,
0.8538997, 1.386569, 0.7522703, 0.8588235, 0, 1, 1,
0.8554322, 0.4769018, -0.3916512, 0.8666667, 0, 1, 1,
0.8634511, 0.8981263, 1.812254, 0.8705882, 0, 1, 1,
0.864513, -0.1480669, 1.896136, 0.8784314, 0, 1, 1,
0.8667763, 0.7411401, 0.492282, 0.8823529, 0, 1, 1,
0.8763303, 0.08588389, 3.246435, 0.8901961, 0, 1, 1,
0.8805571, -0.1921145, 2.436034, 0.8941177, 0, 1, 1,
0.8829945, -0.4069244, 0.148321, 0.9019608, 0, 1, 1,
0.8863773, -1.841189, 3.189281, 0.9098039, 0, 1, 1,
0.8916323, -0.2865407, 0.08188958, 0.9137255, 0, 1, 1,
0.8953632, 1.932904, 0.9692731, 0.9215686, 0, 1, 1,
0.9016649, -0.3109809, 2.524258, 0.9254902, 0, 1, 1,
0.9028879, -1.214188, 1.547735, 0.9333333, 0, 1, 1,
0.9103829, 0.3486413, 0.2391911, 0.9372549, 0, 1, 1,
0.9115404, -1.164961, 3.810256, 0.945098, 0, 1, 1,
0.9145415, -0.1617342, 2.307817, 0.9490196, 0, 1, 1,
0.9195127, 0.7893646, 2.584493, 0.9568627, 0, 1, 1,
0.9217745, -1.817924, 3.412332, 0.9607843, 0, 1, 1,
0.9241655, -0.1772399, 2.893402, 0.9686275, 0, 1, 1,
0.9270495, 1.038506, -0.6313865, 0.972549, 0, 1, 1,
0.9322378, 0.06700696, 1.739378, 0.9803922, 0, 1, 1,
0.9353228, 0.3621774, -0.9093446, 0.9843137, 0, 1, 1,
0.9359295, 0.2592001, 2.536689, 0.9921569, 0, 1, 1,
0.9361414, 0.4421859, 1.083757, 0.9960784, 0, 1, 1,
0.9421093, 1.164196, 1.3222, 1, 0, 0.9960784, 1,
0.9479858, 0.06033751, 0.4259088, 1, 0, 0.9882353, 1,
0.9486929, 0.2938117, 1.013223, 1, 0, 0.9843137, 1,
0.9493379, 0.4487346, 3.736934, 1, 0, 0.9764706, 1,
0.9519483, 0.6018798, 1.642069, 1, 0, 0.972549, 1,
0.9525281, 0.8022923, 0.8859375, 1, 0, 0.9647059, 1,
0.9641638, 0.779556, 1.221399, 1, 0, 0.9607843, 1,
0.9820062, 0.6943936, 0.04822837, 1, 0, 0.9529412, 1,
0.9876205, 0.8899407, 1.989998, 1, 0, 0.9490196, 1,
0.9896798, 0.9558036, 0.1251853, 1, 0, 0.9411765, 1,
0.9925054, 0.3262179, 0.1017539, 1, 0, 0.9372549, 1,
0.9938927, -2.181155, 3.882246, 1, 0, 0.9294118, 1,
0.9994141, -1.2537, 1.952633, 1, 0, 0.9254902, 1,
1.006163, -0.3523743, 1.176203, 1, 0, 0.9176471, 1,
1.006221, -0.2842815, 3.07036, 1, 0, 0.9137255, 1,
1.007222, -0.08170269, 0.05514404, 1, 0, 0.9058824, 1,
1.007888, -0.09736412, 1.654034, 1, 0, 0.9019608, 1,
1.009025, 0.7126372, -0.5462034, 1, 0, 0.8941177, 1,
1.010295, -0.1780051, 2.086518, 1, 0, 0.8862745, 1,
1.015236, -0.1319949, 1.599817, 1, 0, 0.8823529, 1,
1.024085, 0.4253946, 2.0215, 1, 0, 0.8745098, 1,
1.027805, -0.5133027, 0.5557863, 1, 0, 0.8705882, 1,
1.02828, 0.4901353, 2.148903, 1, 0, 0.8627451, 1,
1.033601, -0.4551104, 1.741928, 1, 0, 0.8588235, 1,
1.03408, 0.6917894, 3.030699, 1, 0, 0.8509804, 1,
1.037431, 0.155501, -0.724254, 1, 0, 0.8470588, 1,
1.038808, 1.617644, 1.110856, 1, 0, 0.8392157, 1,
1.043409, -0.1647795, 2.824828, 1, 0, 0.8352941, 1,
1.046746, -1.13606, 1.359089, 1, 0, 0.827451, 1,
1.05958, -0.9988067, 3.09777, 1, 0, 0.8235294, 1,
1.065134, 1.31742, 0.5529751, 1, 0, 0.8156863, 1,
1.071559, 0.3480463, 1.14428, 1, 0, 0.8117647, 1,
1.072865, 0.004766087, 2.077949, 1, 0, 0.8039216, 1,
1.075646, 1.135752, -0.134404, 1, 0, 0.7960784, 1,
1.07991, -0.04414983, 0.2018867, 1, 0, 0.7921569, 1,
1.080695, 0.07595827, 0.7308363, 1, 0, 0.7843137, 1,
1.081295, -1.394713, 3.015953, 1, 0, 0.7803922, 1,
1.110185, -0.3499262, 1.018384, 1, 0, 0.772549, 1,
1.110415, 0.7011306, 0.2129938, 1, 0, 0.7686275, 1,
1.113701, 0.3307742, 1.081197, 1, 0, 0.7607843, 1,
1.115809, -0.2736419, 1.102207, 1, 0, 0.7568628, 1,
1.13241, 1.008106, 1.108981, 1, 0, 0.7490196, 1,
1.140411, -0.6404242, 1.071688, 1, 0, 0.7450981, 1,
1.143488, 0.1105814, 2.893331, 1, 0, 0.7372549, 1,
1.145567, -0.1208977, 2.477, 1, 0, 0.7333333, 1,
1.166378, -1.368468, 3.653672, 1, 0, 0.7254902, 1,
1.171366, -1.096239, 1.715547, 1, 0, 0.7215686, 1,
1.180665, 1.756221, 0.08625446, 1, 0, 0.7137255, 1,
1.185922, 0.9241145, 1.049267, 1, 0, 0.7098039, 1,
1.186514, 0.210106, 2.200051, 1, 0, 0.7019608, 1,
1.195019, 0.3151818, 0.3449663, 1, 0, 0.6941177, 1,
1.205609, -0.7724533, 2.243458, 1, 0, 0.6901961, 1,
1.20601, 1.192662, 0.8346891, 1, 0, 0.682353, 1,
1.208547, -0.528202, 1.550888, 1, 0, 0.6784314, 1,
1.215876, 0.1140427, 0.8681204, 1, 0, 0.6705883, 1,
1.217725, -0.08867707, 1.268303, 1, 0, 0.6666667, 1,
1.222991, -0.04622414, 2.142505, 1, 0, 0.6588235, 1,
1.248065, -0.676828, 3.510548, 1, 0, 0.654902, 1,
1.250511, -0.4010882, 1.482116, 1, 0, 0.6470588, 1,
1.25221, 1.362766, 0.532321, 1, 0, 0.6431373, 1,
1.252255, 0.7708777, 1.419768, 1, 0, 0.6352941, 1,
1.25431, -2.098736, 1.466831, 1, 0, 0.6313726, 1,
1.25514, -0.728633, 2.982692, 1, 0, 0.6235294, 1,
1.25533, -1.605081, 2.3324, 1, 0, 0.6196079, 1,
1.258903, 1.105901, 1.579509, 1, 0, 0.6117647, 1,
1.261222, -0.5470728, 2.581208, 1, 0, 0.6078432, 1,
1.2703, -0.9368891, 0.7042051, 1, 0, 0.6, 1,
1.271041, -0.07200895, 1.14997, 1, 0, 0.5921569, 1,
1.282178, -0.008826144, 2.653661, 1, 0, 0.5882353, 1,
1.28393, -0.09053674, 1.485254, 1, 0, 0.5803922, 1,
1.28645, 0.4250622, 0.2542016, 1, 0, 0.5764706, 1,
1.287028, 0.9845856, -0.4980423, 1, 0, 0.5686275, 1,
1.292504, 2.481088, 0.2561482, 1, 0, 0.5647059, 1,
1.295762, -1.113207, 3.572587, 1, 0, 0.5568628, 1,
1.296799, 0.483794, 3.193167, 1, 0, 0.5529412, 1,
1.297012, -0.8972762, 3.727812, 1, 0, 0.5450981, 1,
1.3094, 0.5065605, 2.411916, 1, 0, 0.5411765, 1,
1.312868, -1.278687, 2.254285, 1, 0, 0.5333334, 1,
1.322446, -0.1574787, 2.165025, 1, 0, 0.5294118, 1,
1.324062, 0.7098122, 2.522649, 1, 0, 0.5215687, 1,
1.32599, -1.048471, 2.891393, 1, 0, 0.5176471, 1,
1.327849, -2.247813, 2.564551, 1, 0, 0.509804, 1,
1.330574, -0.8160095, 2.684353, 1, 0, 0.5058824, 1,
1.33136, 0.7389598, 1.473078, 1, 0, 0.4980392, 1,
1.336036, 0.2380338, 1.849611, 1, 0, 0.4901961, 1,
1.346346, -0.02820478, 2.061365, 1, 0, 0.4862745, 1,
1.348412, 0.2805054, -0.6600809, 1, 0, 0.4784314, 1,
1.349514, -0.3242999, 0.8703534, 1, 0, 0.4745098, 1,
1.353382, 0.2690741, 2.712056, 1, 0, 0.4666667, 1,
1.367028, 2.062599, -1.641208, 1, 0, 0.4627451, 1,
1.370743, 0.1049632, 0.2866899, 1, 0, 0.454902, 1,
1.381451, 0.2003867, 1.87016, 1, 0, 0.4509804, 1,
1.388785, 0.9156941, 0.7676256, 1, 0, 0.4431373, 1,
1.396646, -0.140087, 3.488814, 1, 0, 0.4392157, 1,
1.413425, 2.057971, 1.028132, 1, 0, 0.4313726, 1,
1.434522, -0.9476851, 3.050254, 1, 0, 0.427451, 1,
1.434834, -0.6026006, -0.49531, 1, 0, 0.4196078, 1,
1.436948, -0.365047, 1.777439, 1, 0, 0.4156863, 1,
1.441288, 0.07313281, 1.743671, 1, 0, 0.4078431, 1,
1.441393, -0.8278008, 2.659454, 1, 0, 0.4039216, 1,
1.450697, 0.5284988, 1.659934, 1, 0, 0.3960784, 1,
1.451841, -0.3159043, 2.034921, 1, 0, 0.3882353, 1,
1.463365, -0.07067801, 1.211148, 1, 0, 0.3843137, 1,
1.473776, 1.219338, 1.075509, 1, 0, 0.3764706, 1,
1.484343, -0.02817639, 0.4276175, 1, 0, 0.372549, 1,
1.495526, -0.1545842, 2.769958, 1, 0, 0.3647059, 1,
1.495781, -1.046533, 1.346565, 1, 0, 0.3607843, 1,
1.496225, -0.3146921, 0.2592663, 1, 0, 0.3529412, 1,
1.506092, 0.8070654, 0.3198424, 1, 0, 0.3490196, 1,
1.516393, -1.23836, 2.116929, 1, 0, 0.3411765, 1,
1.531446, 0.5543852, -0.08490638, 1, 0, 0.3372549, 1,
1.538134, -0.6067874, 2.645212, 1, 0, 0.3294118, 1,
1.538578, -1.034174, 0.6625378, 1, 0, 0.3254902, 1,
1.539086, -1.259929, 4.564169, 1, 0, 0.3176471, 1,
1.549019, 0.4429191, 1.882208, 1, 0, 0.3137255, 1,
1.551187, 0.2369334, 1.803982, 1, 0, 0.3058824, 1,
1.561267, -0.459448, 1.308136, 1, 0, 0.2980392, 1,
1.565493, 0.8472106, 1.770686, 1, 0, 0.2941177, 1,
1.575126, 1.056857, 0.2972619, 1, 0, 0.2862745, 1,
1.591245, -1.040337, 2.824201, 1, 0, 0.282353, 1,
1.610742, -0.5128904, 2.112253, 1, 0, 0.2745098, 1,
1.611051, 1.428499, 1.896533, 1, 0, 0.2705882, 1,
1.615162, 1.649617, 2.368405, 1, 0, 0.2627451, 1,
1.64226, 0.00202325, 1.795276, 1, 0, 0.2588235, 1,
1.649252, -0.3188442, -0.5293459, 1, 0, 0.2509804, 1,
1.66794, -1.110327, 1.908081, 1, 0, 0.2470588, 1,
1.684788, 0.4761816, 1.014872, 1, 0, 0.2392157, 1,
1.686434, -0.2242129, 1.42931, 1, 0, 0.2352941, 1,
1.688711, -0.06621914, 3.198948, 1, 0, 0.227451, 1,
1.69669, 0.1954283, 1.682142, 1, 0, 0.2235294, 1,
1.736424, 0.2149113, 2.908208, 1, 0, 0.2156863, 1,
1.760551, -0.6048062, 1.098842, 1, 0, 0.2117647, 1,
1.771982, 1.555683, 1.369995, 1, 0, 0.2039216, 1,
1.801221, 0.1727495, 1.363201, 1, 0, 0.1960784, 1,
1.813674, -0.5778844, 3.992811, 1, 0, 0.1921569, 1,
1.824877, 1.294991, 0.07875066, 1, 0, 0.1843137, 1,
1.825425, 0.05808873, 1.691156, 1, 0, 0.1803922, 1,
1.831415, -0.474602, 0.7108256, 1, 0, 0.172549, 1,
1.84547, 1.122345, 1.280244, 1, 0, 0.1686275, 1,
1.854819, -2.082763, 2.574317, 1, 0, 0.1607843, 1,
1.857556, 1.142609, 2.091102, 1, 0, 0.1568628, 1,
1.878927, 0.5342185, 1.591001, 1, 0, 0.1490196, 1,
1.87995, 0.4302375, 2.459327, 1, 0, 0.145098, 1,
1.893476, -1.269399, 3.69249, 1, 0, 0.1372549, 1,
1.901753, -2.828494, 2.540223, 1, 0, 0.1333333, 1,
1.916548, 0.7570626, 1.457161, 1, 0, 0.1254902, 1,
1.922781, -0.04395124, 1.816602, 1, 0, 0.1215686, 1,
1.940571, 0.9402148, 1.225841, 1, 0, 0.1137255, 1,
1.947471, -0.9773956, 2.315711, 1, 0, 0.1098039, 1,
1.952658, 0.1123874, 1.651928, 1, 0, 0.1019608, 1,
1.986077, -1.414066, -0.2196039, 1, 0, 0.09411765, 1,
1.997875, 2.132157, 0.3163723, 1, 0, 0.09019608, 1,
2.027543, -0.1648944, 2.111601, 1, 0, 0.08235294, 1,
2.056656, -1.327939, 1.308427, 1, 0, 0.07843138, 1,
2.075907, -1.866658, 2.397364, 1, 0, 0.07058824, 1,
2.078949, 0.4222193, 0.8550965, 1, 0, 0.06666667, 1,
2.083488, -0.1073999, 1.217877, 1, 0, 0.05882353, 1,
2.148626, -0.3412772, 2.199253, 1, 0, 0.05490196, 1,
2.151801, 2.448588, 0.4670679, 1, 0, 0.04705882, 1,
2.227093, 1.169005, 2.399925, 1, 0, 0.04313726, 1,
2.275975, -0.1764401, 1.691846, 1, 0, 0.03529412, 1,
2.401011, 0.4547608, 0.9317449, 1, 0, 0.03137255, 1,
2.524646, -1.721475, 2.977196, 1, 0, 0.02352941, 1,
2.669163, -0.213849, 1.010652, 1, 0, 0.01960784, 1,
2.71736, -1.917613, 1.614849, 1, 0, 0.01176471, 1,
3.237305, 0.6243916, 0.4464588, 1, 0, 0.007843138, 1
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
-0.1223286, -3.785277, -7.579998, 0, -0.5, 0.5, 0.5,
-0.1223286, -3.785277, -7.579998, 1, -0.5, 0.5, 0.5,
-0.1223286, -3.785277, -7.579998, 1, 1.5, 0.5, 0.5,
-0.1223286, -3.785277, -7.579998, 0, 1.5, 0.5, 0.5
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
-4.620879, -0.006125569, -7.579998, 0, -0.5, 0.5, 0.5,
-4.620879, -0.006125569, -7.579998, 1, -0.5, 0.5, 0.5,
-4.620879, -0.006125569, -7.579998, 1, 1.5, 0.5, 0.5,
-4.620879, -0.006125569, -7.579998, 0, 1.5, 0.5, 0.5
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
-4.620879, -3.785277, -0.4368939, 0, -0.5, 0.5, 0.5,
-4.620879, -3.785277, -0.4368939, 1, -0.5, 0.5, 0.5,
-4.620879, -3.785277, -0.4368939, 1, 1.5, 0.5, 0.5,
-4.620879, -3.785277, -0.4368939, 0, 1.5, 0.5, 0.5
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
-3, -2.913165, -5.931589,
3, -2.913165, -5.931589,
-3, -2.913165, -5.931589,
-3, -3.058517, -6.206324,
-2, -2.913165, -5.931589,
-2, -3.058517, -6.206324,
-1, -2.913165, -5.931589,
-1, -3.058517, -6.206324,
0, -2.913165, -5.931589,
0, -3.058517, -6.206324,
1, -2.913165, -5.931589,
1, -3.058517, -6.206324,
2, -2.913165, -5.931589,
2, -3.058517, -6.206324,
3, -2.913165, -5.931589,
3, -3.058517, -6.206324
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
-3, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
-3, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
-3, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
-3, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5,
-2, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
-2, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
-2, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
-2, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5,
-1, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
-1, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
-1, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
-1, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5,
0, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
0, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
0, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
0, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5,
1, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
1, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
1, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
1, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5,
2, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
2, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
2, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
2, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5,
3, -3.349221, -6.755793, 0, -0.5, 0.5, 0.5,
3, -3.349221, -6.755793, 1, -0.5, 0.5, 0.5,
3, -3.349221, -6.755793, 1, 1.5, 0.5, 0.5,
3, -3.349221, -6.755793, 0, 1.5, 0.5, 0.5
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
-3.582752, -2, -5.931589,
-3.582752, 2, -5.931589,
-3.582752, -2, -5.931589,
-3.755773, -2, -6.206324,
-3.582752, -1, -5.931589,
-3.755773, -1, -6.206324,
-3.582752, 0, -5.931589,
-3.755773, 0, -6.206324,
-3.582752, 1, -5.931589,
-3.755773, 1, -6.206324,
-3.582752, 2, -5.931589,
-3.755773, 2, -6.206324
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
-4.101815, -2, -6.755793, 0, -0.5, 0.5, 0.5,
-4.101815, -2, -6.755793, 1, -0.5, 0.5, 0.5,
-4.101815, -2, -6.755793, 1, 1.5, 0.5, 0.5,
-4.101815, -2, -6.755793, 0, 1.5, 0.5, 0.5,
-4.101815, -1, -6.755793, 0, -0.5, 0.5, 0.5,
-4.101815, -1, -6.755793, 1, -0.5, 0.5, 0.5,
-4.101815, -1, -6.755793, 1, 1.5, 0.5, 0.5,
-4.101815, -1, -6.755793, 0, 1.5, 0.5, 0.5,
-4.101815, 0, -6.755793, 0, -0.5, 0.5, 0.5,
-4.101815, 0, -6.755793, 1, -0.5, 0.5, 0.5,
-4.101815, 0, -6.755793, 1, 1.5, 0.5, 0.5,
-4.101815, 0, -6.755793, 0, 1.5, 0.5, 0.5,
-4.101815, 1, -6.755793, 0, -0.5, 0.5, 0.5,
-4.101815, 1, -6.755793, 1, -0.5, 0.5, 0.5,
-4.101815, 1, -6.755793, 1, 1.5, 0.5, 0.5,
-4.101815, 1, -6.755793, 0, 1.5, 0.5, 0.5,
-4.101815, 2, -6.755793, 0, -0.5, 0.5, 0.5,
-4.101815, 2, -6.755793, 1, -0.5, 0.5, 0.5,
-4.101815, 2, -6.755793, 1, 1.5, 0.5, 0.5,
-4.101815, 2, -6.755793, 0, 1.5, 0.5, 0.5
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
-3.582752, -2.913165, -4,
-3.582752, -2.913165, 4,
-3.582752, -2.913165, -4,
-3.755773, -3.058517, -4,
-3.582752, -2.913165, -2,
-3.755773, -3.058517, -2,
-3.582752, -2.913165, 0,
-3.755773, -3.058517, 0,
-3.582752, -2.913165, 2,
-3.755773, -3.058517, 2,
-3.582752, -2.913165, 4,
-3.755773, -3.058517, 4
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
-4.101815, -3.349221, -4, 0, -0.5, 0.5, 0.5,
-4.101815, -3.349221, -4, 1, -0.5, 0.5, 0.5,
-4.101815, -3.349221, -4, 1, 1.5, 0.5, 0.5,
-4.101815, -3.349221, -4, 0, 1.5, 0.5, 0.5,
-4.101815, -3.349221, -2, 0, -0.5, 0.5, 0.5,
-4.101815, -3.349221, -2, 1, -0.5, 0.5, 0.5,
-4.101815, -3.349221, -2, 1, 1.5, 0.5, 0.5,
-4.101815, -3.349221, -2, 0, 1.5, 0.5, 0.5,
-4.101815, -3.349221, 0, 0, -0.5, 0.5, 0.5,
-4.101815, -3.349221, 0, 1, -0.5, 0.5, 0.5,
-4.101815, -3.349221, 0, 1, 1.5, 0.5, 0.5,
-4.101815, -3.349221, 0, 0, 1.5, 0.5, 0.5,
-4.101815, -3.349221, 2, 0, -0.5, 0.5, 0.5,
-4.101815, -3.349221, 2, 1, -0.5, 0.5, 0.5,
-4.101815, -3.349221, 2, 1, 1.5, 0.5, 0.5,
-4.101815, -3.349221, 2, 0, 1.5, 0.5, 0.5,
-4.101815, -3.349221, 4, 0, -0.5, 0.5, 0.5,
-4.101815, -3.349221, 4, 1, -0.5, 0.5, 0.5,
-4.101815, -3.349221, 4, 1, 1.5, 0.5, 0.5,
-4.101815, -3.349221, 4, 0, 1.5, 0.5, 0.5
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
-3.582752, -2.913165, -5.931589,
-3.582752, 2.900914, -5.931589,
-3.582752, -2.913165, 5.057801,
-3.582752, 2.900914, 5.057801,
-3.582752, -2.913165, -5.931589,
-3.582752, -2.913165, 5.057801,
-3.582752, 2.900914, -5.931589,
-3.582752, 2.900914, 5.057801,
-3.582752, -2.913165, -5.931589,
3.338094, -2.913165, -5.931589,
-3.582752, -2.913165, 5.057801,
3.338094, -2.913165, 5.057801,
-3.582752, 2.900914, -5.931589,
3.338094, 2.900914, -5.931589,
-3.582752, 2.900914, 5.057801,
3.338094, 2.900914, 5.057801,
3.338094, -2.913165, -5.931589,
3.338094, 2.900914, -5.931589,
3.338094, -2.913165, 5.057801,
3.338094, 2.900914, 5.057801,
3.338094, -2.913165, -5.931589,
3.338094, -2.913165, 5.057801,
3.338094, 2.900914, -5.931589,
3.338094, 2.900914, 5.057801
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
var radius = 7.598082;
var distance = 33.80473;
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
mvMatrix.translate( 0.1223286, 0.006125569, 0.4368939 );
mvMatrix.scale( 1.187022, 1.412983, 0.747557 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80473);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Moxie<-read.table("Moxie.xyz", skip=1)
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
-3.481963, 1.140472, -1.276875, 0, 0, 1, 1, 1,
-3.291557, 0.9428613, -0.4276536, 1, 0, 0, 1, 1,
-3.007527, -2.49201, -2.752967, 1, 0, 0, 1, 1,
-2.960377, -1.406281, -4.624834, 1, 0, 0, 1, 1,
-2.808108, -1.989815, -2.094388, 1, 0, 0, 1, 1,
-2.642035, -0.9308151, -2.815765, 1, 0, 0, 1, 1,
-2.576272, -0.4779159, -2.658643, 0, 0, 0, 1, 1,
-2.557029, 0.05883528, -1.672343, 0, 0, 0, 1, 1,
-2.541511, 1.896766, -1.870576, 0, 0, 0, 1, 1,
-2.435456, -0.6118867, -1.407095, 0, 0, 0, 1, 1,
-2.387638, -1.686235, -2.233763, 0, 0, 0, 1, 1,
-2.355597, 0.822575, -0.1367996, 0, 0, 0, 1, 1,
-2.304695, 1.777594, -1.413479, 0, 0, 0, 1, 1,
-2.264525, -1.040031, -3.195812, 1, 1, 1, 1, 1,
-2.25615, -0.6137434, -1.552866, 1, 1, 1, 1, 1,
-2.254283, -1.233755, -2.366211, 1, 1, 1, 1, 1,
-2.24862, -1.352703, -2.401243, 1, 1, 1, 1, 1,
-2.226371, 0.0740534, -1.428899, 1, 1, 1, 1, 1,
-2.202062, 0.3829204, -1.702687, 1, 1, 1, 1, 1,
-2.136978, 0.1875513, -2.111012, 1, 1, 1, 1, 1,
-2.125425, 1.81556, -1.110808, 1, 1, 1, 1, 1,
-2.120384, 0.1174211, 0.3653929, 1, 1, 1, 1, 1,
-2.094205, -0.3578165, -2.386994, 1, 1, 1, 1, 1,
-2.084069, 0.2576078, -1.557844, 1, 1, 1, 1, 1,
-2.036732, -0.008456035, -0.01289811, 1, 1, 1, 1, 1,
-2.027988, -0.6714198, -0.960894, 1, 1, 1, 1, 1,
-2.027145, -1.145007, -4.993538, 1, 1, 1, 1, 1,
-2.019251, -0.2175745, -3.975894, 1, 1, 1, 1, 1,
-1.998516, 0.1183498, -0.9127005, 0, 0, 1, 1, 1,
-1.964674, 0.2904794, -0.993084, 1, 0, 0, 1, 1,
-1.953303, -0.2353067, -1.154948, 1, 0, 0, 1, 1,
-1.93204, -0.1468649, -1.66007, 1, 0, 0, 1, 1,
-1.899395, 1.138839, -0.6418821, 1, 0, 0, 1, 1,
-1.893253, -0.9539233, -1.442096, 1, 0, 0, 1, 1,
-1.860846, -0.7561814, -1.227368, 0, 0, 0, 1, 1,
-1.855713, 0.2468223, -0.3191753, 0, 0, 0, 1, 1,
-1.847643, -1.228238, -2.291848, 0, 0, 0, 1, 1,
-1.832875, -0.9215981, -2.984054, 0, 0, 0, 1, 1,
-1.821642, 0.4817567, -2.141237, 0, 0, 0, 1, 1,
-1.806316, -2.055064, -0.404233, 0, 0, 0, 1, 1,
-1.795308, -1.300355, -2.36769, 0, 0, 0, 1, 1,
-1.792725, 0.05992368, -2.63978, 1, 1, 1, 1, 1,
-1.783793, -1.028468, -2.865703, 1, 1, 1, 1, 1,
-1.779383, 0.2443668, -2.599015, 1, 1, 1, 1, 1,
-1.769235, 0.2437262, -0.2259064, 1, 1, 1, 1, 1,
-1.764402, -1.357551, -3.62084, 1, 1, 1, 1, 1,
-1.762168, 0.6851892, -3.049909, 1, 1, 1, 1, 1,
-1.750209, -1.064947, -2.740805, 1, 1, 1, 1, 1,
-1.744011, 0.3390069, -1.722956, 1, 1, 1, 1, 1,
-1.74294, 0.2793479, -2.0861, 1, 1, 1, 1, 1,
-1.728654, 1.460511, -3.183114, 1, 1, 1, 1, 1,
-1.725567, 0.7635874, -1.349895, 1, 1, 1, 1, 1,
-1.706684, 1.273502, -0.338016, 1, 1, 1, 1, 1,
-1.70139, 1.093786, -2.745957, 1, 1, 1, 1, 1,
-1.672764, -0.4383107, -5.771549, 1, 1, 1, 1, 1,
-1.672747, -0.2847099, -2.403814, 1, 1, 1, 1, 1,
-1.665715, 0.01216573, -1.747648, 0, 0, 1, 1, 1,
-1.664178, -0.3198727, -0.9785461, 1, 0, 0, 1, 1,
-1.657787, 1.323341, -1.708387, 1, 0, 0, 1, 1,
-1.652761, 0.2646593, -1.085325, 1, 0, 0, 1, 1,
-1.647516, -2.601872, -3.955638, 1, 0, 0, 1, 1,
-1.645198, -0.7216536, -1.872912, 1, 0, 0, 1, 1,
-1.644134, 0.3989054, -1.791684, 0, 0, 0, 1, 1,
-1.636647, -0.2453562, -1.029128, 0, 0, 0, 1, 1,
-1.634587, 0.09749056, -1.266895, 0, 0, 0, 1, 1,
-1.633333, -0.5736562, -2.733868, 0, 0, 0, 1, 1,
-1.624288, 0.6586435, -1.01033, 0, 0, 0, 1, 1,
-1.606902, 0.1692137, -0.2531639, 0, 0, 0, 1, 1,
-1.599933, -2.278869, -2.855755, 0, 0, 0, 1, 1,
-1.594919, 0.9413919, -2.284038, 1, 1, 1, 1, 1,
-1.585312, -0.1513239, -1.298642, 1, 1, 1, 1, 1,
-1.580615, 0.04182792, -0.5596533, 1, 1, 1, 1, 1,
-1.575542, -0.8449399, -2.052272, 1, 1, 1, 1, 1,
-1.562691, -0.7668692, -2.615044, 1, 1, 1, 1, 1,
-1.55937, -1.388932, -3.71031, 1, 1, 1, 1, 1,
-1.557809, -0.2362702, -2.140037, 1, 1, 1, 1, 1,
-1.555042, 0.4932955, -1.532937, 1, 1, 1, 1, 1,
-1.532407, 0.7150022, -1.720564, 1, 1, 1, 1, 1,
-1.52581, 0.8798832, -0.1780068, 1, 1, 1, 1, 1,
-1.508017, 0.4377446, -1.78083, 1, 1, 1, 1, 1,
-1.502942, -1.053717, -2.028304, 1, 1, 1, 1, 1,
-1.489202, -0.1271721, -0.4224415, 1, 1, 1, 1, 1,
-1.476834, 1.094503, -1.785032, 1, 1, 1, 1, 1,
-1.462845, 0.4444632, -0.7440812, 1, 1, 1, 1, 1,
-1.461384, -0.2043527, -1.802519, 0, 0, 1, 1, 1,
-1.460618, -0.655961, -2.24113, 1, 0, 0, 1, 1,
-1.444463, -0.3063234, -1.314972, 1, 0, 0, 1, 1,
-1.441175, 0.09053377, -2.965953, 1, 0, 0, 1, 1,
-1.42577, -1.160218, -1.566938, 1, 0, 0, 1, 1,
-1.407561, 0.3648578, -0.9767002, 1, 0, 0, 1, 1,
-1.405105, -0.9439475, -1.195258, 0, 0, 0, 1, 1,
-1.368578, 0.5487162, -0.6304299, 0, 0, 0, 1, 1,
-1.367377, -0.8767754, -0.9743945, 0, 0, 0, 1, 1,
-1.342629, 0.03929198, -2.018814, 0, 0, 0, 1, 1,
-1.332092, 1.269191, -0.30184, 0, 0, 0, 1, 1,
-1.331332, 1.393458, -1.051401, 0, 0, 0, 1, 1,
-1.324488, 0.4560435, -0.03565225, 0, 0, 0, 1, 1,
-1.323379, -2.211072, -2.226521, 1, 1, 1, 1, 1,
-1.317695, -0.6809498, -1.656552, 1, 1, 1, 1, 1,
-1.306838, 1.155829, -1.211484, 1, 1, 1, 1, 1,
-1.305831, 1.327209, -2.924073, 1, 1, 1, 1, 1,
-1.298846, -0.8207406, -2.253164, 1, 1, 1, 1, 1,
-1.296276, -1.102759, -3.879087, 1, 1, 1, 1, 1,
-1.286449, 1.024533, -0.3529939, 1, 1, 1, 1, 1,
-1.285232, -0.8625048, -3.137142, 1, 1, 1, 1, 1,
-1.284234, 0.9760534, -0.4830588, 1, 1, 1, 1, 1,
-1.283518, -1.005388, -1.961473, 1, 1, 1, 1, 1,
-1.276411, -0.09281249, -1.067429, 1, 1, 1, 1, 1,
-1.269774, -1.487296, -1.835356, 1, 1, 1, 1, 1,
-1.233811, 0.4770279, -0.607223, 1, 1, 1, 1, 1,
-1.233099, -0.8140581, -3.933229, 1, 1, 1, 1, 1,
-1.229863, -1.792385, -1.971157, 1, 1, 1, 1, 1,
-1.223751, 0.318958, -1.273988, 0, 0, 1, 1, 1,
-1.22123, -0.8083957, -1.141859, 1, 0, 0, 1, 1,
-1.218738, -1.102319, -1.731919, 1, 0, 0, 1, 1,
-1.2183, -1.848566, -4.118407, 1, 0, 0, 1, 1,
-1.209573, -0.01069473, -0.5208081, 1, 0, 0, 1, 1,
-1.207754, -0.03930526, -2.133691, 1, 0, 0, 1, 1,
-1.198544, -0.849869, -1.935254, 0, 0, 0, 1, 1,
-1.188226, 0.08848735, -1.437751, 0, 0, 0, 1, 1,
-1.182661, -0.6537933, -2.63913, 0, 0, 0, 1, 1,
-1.181749, 2.167784, -0.1151038, 0, 0, 0, 1, 1,
-1.177662, 0.2106473, -1.750539, 0, 0, 0, 1, 1,
-1.176555, -0.8353527, -0.731028, 0, 0, 0, 1, 1,
-1.165978, 0.03186421, -3.224632, 0, 0, 0, 1, 1,
-1.164251, 0.6901048, 0.1061951, 1, 1, 1, 1, 1,
-1.161382, -0.3697961, -1.996287, 1, 1, 1, 1, 1,
-1.158883, 1.63598, -1.031016, 1, 1, 1, 1, 1,
-1.148734, 0.309021, -2.827873, 1, 1, 1, 1, 1,
-1.148316, -0.243165, -1.073998, 1, 1, 1, 1, 1,
-1.142692, 0.8481003, -0.003091504, 1, 1, 1, 1, 1,
-1.139208, 1.818989, 0.7088114, 1, 1, 1, 1, 1,
-1.13862, -0.7694128, -1.226092, 1, 1, 1, 1, 1,
-1.128881, -0.3931862, -1.646, 1, 1, 1, 1, 1,
-1.119851, 0.4609013, -1.733834, 1, 1, 1, 1, 1,
-1.111144, 0.143745, -1.850902, 1, 1, 1, 1, 1,
-1.10562, 1.541069, -0.4358164, 1, 1, 1, 1, 1,
-1.103403, 0.2971646, -2.885788, 1, 1, 1, 1, 1,
-1.098997, -1.432406, -2.368579, 1, 1, 1, 1, 1,
-1.097693, -0.3071437, -2.35013, 1, 1, 1, 1, 1,
-1.087456, -0.9285698, -1.589476, 0, 0, 1, 1, 1,
-1.0856, -1.593596, -2.527016, 1, 0, 0, 1, 1,
-1.084487, 1.289407, -1.11167, 1, 0, 0, 1, 1,
-1.081857, -0.5933484, -2.636101, 1, 0, 0, 1, 1,
-1.079179, 0.2570267, -0.8609701, 1, 0, 0, 1, 1,
-1.076651, -1.136109, 0.6370168, 1, 0, 0, 1, 1,
-1.06893, 0.06430946, -1.656704, 0, 0, 0, 1, 1,
-1.065123, 0.2452483, 0.1660825, 0, 0, 0, 1, 1,
-1.062967, 0.4035024, -2.022462, 0, 0, 0, 1, 1,
-1.051997, -0.8179282, -2.166176, 0, 0, 0, 1, 1,
-1.045411, 0.6525947, -0.004344594, 0, 0, 0, 1, 1,
-1.035959, -0.8091823, -3.073113, 0, 0, 0, 1, 1,
-1.034849, 0.9265205, -0.8432948, 0, 0, 0, 1, 1,
-1.034414, 1.264199, -1.559616, 1, 1, 1, 1, 1,
-1.033053, -0.698008, -1.997076, 1, 1, 1, 1, 1,
-1.027931, -1.37356, -1.677961, 1, 1, 1, 1, 1,
-1.022969, -0.03547665, -1.378845, 1, 1, 1, 1, 1,
-1.017709, 1.112436, -0.7790797, 1, 1, 1, 1, 1,
-1.013478, 0.939393, -0.4239039, 1, 1, 1, 1, 1,
-1.008824, 0.6618768, -0.6455388, 1, 1, 1, 1, 1,
-1.000752, 0.4285168, -0.3456855, 1, 1, 1, 1, 1,
-0.9995816, 0.2469103, -0.1644122, 1, 1, 1, 1, 1,
-0.997516, -1.961802, -2.367593, 1, 1, 1, 1, 1,
-0.9880711, -0.9633723, -1.145292, 1, 1, 1, 1, 1,
-0.9880374, -1.501697, -2.038985, 1, 1, 1, 1, 1,
-0.986807, 0.1380847, -0.655006, 1, 1, 1, 1, 1,
-0.9836805, -0.281346, -1.536199, 1, 1, 1, 1, 1,
-0.9806547, -0.4584387, -0.1744119, 1, 1, 1, 1, 1,
-0.9784951, 1.27871, -0.08486726, 0, 0, 1, 1, 1,
-0.9747651, 1.933546, -2.519351, 1, 0, 0, 1, 1,
-0.9708268, -0.6850902, -3.284937, 1, 0, 0, 1, 1,
-0.9678347, 0.4090645, -1.821491, 1, 0, 0, 1, 1,
-0.9619176, -0.5099156, -2.268435, 1, 0, 0, 1, 1,
-0.9606571, 1.131585, -0.895429, 1, 0, 0, 1, 1,
-0.959435, 0.1246654, -1.035525, 0, 0, 0, 1, 1,
-0.953103, -0.8526944, -1.966264, 0, 0, 0, 1, 1,
-0.953024, -0.07412013, -1.42199, 0, 0, 0, 1, 1,
-0.9516266, 0.9844195, -1.694491, 0, 0, 0, 1, 1,
-0.9441636, 1.243184, -0.08727625, 0, 0, 0, 1, 1,
-0.9428216, -0.3405525, -3.286094, 0, 0, 0, 1, 1,
-0.9423867, -1.062058, -3.406309, 0, 0, 0, 1, 1,
-0.9418937, -1.499049, -1.327525, 1, 1, 1, 1, 1,
-0.9390748, -0.7650099, -1.696017, 1, 1, 1, 1, 1,
-0.9361164, -0.4900385, -1.627324, 1, 1, 1, 1, 1,
-0.9350101, -0.3279687, -1.473746, 1, 1, 1, 1, 1,
-0.9290011, -0.02173274, -2.077997, 1, 1, 1, 1, 1,
-0.9288991, 1.251216, -1.397141, 1, 1, 1, 1, 1,
-0.9279843, -1.758515, -4.060512, 1, 1, 1, 1, 1,
-0.9181255, -0.3989696, -1.049946, 1, 1, 1, 1, 1,
-0.9162403, 0.4036726, -1.378128, 1, 1, 1, 1, 1,
-0.9128107, -0.5573517, -1.226786, 1, 1, 1, 1, 1,
-0.9120402, -1.603284, -3.559747, 1, 1, 1, 1, 1,
-0.9114216, 0.2016412, -1.829271, 1, 1, 1, 1, 1,
-0.9001782, -0.4666432, -0.9637179, 1, 1, 1, 1, 1,
-0.8997834, -0.6571621, -1.918596, 1, 1, 1, 1, 1,
-0.89561, 1.573692, -0.6854186, 1, 1, 1, 1, 1,
-0.8904265, 0.3151197, -0.6142755, 0, 0, 1, 1, 1,
-0.8890567, -0.007794017, -1.282356, 1, 0, 0, 1, 1,
-0.8890299, -0.2048932, -2.77271, 1, 0, 0, 1, 1,
-0.887041, -0.5496464, -2.864972, 1, 0, 0, 1, 1,
-0.8855296, -0.5640535, -1.293771, 1, 0, 0, 1, 1,
-0.8855133, -0.2182535, -2.250288, 1, 0, 0, 1, 1,
-0.8831819, -0.302263, -2.056269, 0, 0, 0, 1, 1,
-0.8802586, 0.2063984, 0.9928432, 0, 0, 0, 1, 1,
-0.8791159, 1.465392, 0.6234363, 0, 0, 0, 1, 1,
-0.8770685, 0.3083817, -1.267282, 0, 0, 0, 1, 1,
-0.8708838, 0.09872486, -0.3597788, 0, 0, 0, 1, 1,
-0.8701581, -0.00373476, -1.734029, 0, 0, 0, 1, 1,
-0.8680981, 0.6812758, -1.527865, 0, 0, 0, 1, 1,
-0.8676949, -2.36482, -3.498719, 1, 1, 1, 1, 1,
-0.8618133, -0.9064237, -3.66242, 1, 1, 1, 1, 1,
-0.8614831, 1.697196, 0.336942, 1, 1, 1, 1, 1,
-0.8613771, -0.6521398, -1.757802, 1, 1, 1, 1, 1,
-0.8563663, -1.758859, -2.950487, 1, 1, 1, 1, 1,
-0.8535731, 0.7734102, -0.1591201, 1, 1, 1, 1, 1,
-0.8516949, -0.9097269, -3.086459, 1, 1, 1, 1, 1,
-0.8427178, 0.3471946, -0.6830392, 1, 1, 1, 1, 1,
-0.8359066, 0.4237134, -0.9478996, 1, 1, 1, 1, 1,
-0.831998, 0.0549452, -1.951287, 1, 1, 1, 1, 1,
-0.8312684, -1.513524, -1.730342, 1, 1, 1, 1, 1,
-0.8296766, -1.466067, -2.512391, 1, 1, 1, 1, 1,
-0.828364, -0.2384818, -2.247663, 1, 1, 1, 1, 1,
-0.8228697, 0.8412604, -0.5108028, 1, 1, 1, 1, 1,
-0.8157237, 1.515321, 0.8953043, 1, 1, 1, 1, 1,
-0.8133453, 0.1792499, 0.2751046, 0, 0, 1, 1, 1,
-0.7991717, 0.3233252, -0.1946263, 1, 0, 0, 1, 1,
-0.7990962, 0.04544549, -3.148211, 1, 0, 0, 1, 1,
-0.796129, -0.06284162, -0.6009492, 1, 0, 0, 1, 1,
-0.7951722, 1.619911, 0.05672521, 1, 0, 0, 1, 1,
-0.7908803, 0.3924467, -1.539285, 1, 0, 0, 1, 1,
-0.7896286, 0.3839956, -1.10632, 0, 0, 0, 1, 1,
-0.7758666, 0.109411, -3.212814, 0, 0, 0, 1, 1,
-0.769334, 1.377219, -1.884012, 0, 0, 0, 1, 1,
-0.7691178, 0.1622887, -1.314397, 0, 0, 0, 1, 1,
-0.7680252, 1.183887, -1.030066, 0, 0, 0, 1, 1,
-0.7675964, -0.9755843, -1.440318, 0, 0, 0, 1, 1,
-0.7623114, -0.5160444, -2.915378, 0, 0, 0, 1, 1,
-0.7485092, -1.123586, -1.53067, 1, 1, 1, 1, 1,
-0.7453007, -0.02083774, -1.258851, 1, 1, 1, 1, 1,
-0.7444896, -0.7918219, -1.338296, 1, 1, 1, 1, 1,
-0.743939, -1.497452, -3.916606, 1, 1, 1, 1, 1,
-0.7398145, -0.2113381, -0.2632438, 1, 1, 1, 1, 1,
-0.7389669, 0.859184, -0.5975979, 1, 1, 1, 1, 1,
-0.7385876, -0.7261581, -0.98048, 1, 1, 1, 1, 1,
-0.7361542, -0.3844933, -0.1879223, 1, 1, 1, 1, 1,
-0.7349211, 0.5200456, 0.136929, 1, 1, 1, 1, 1,
-0.7344964, -1.517339, -1.781839, 1, 1, 1, 1, 1,
-0.7317782, 0.003196749, -2.279333, 1, 1, 1, 1, 1,
-0.728388, 0.2613496, -1.50506, 1, 1, 1, 1, 1,
-0.7258266, 0.3932084, -0.7105271, 1, 1, 1, 1, 1,
-0.7242894, 0.30373, -0.3866779, 1, 1, 1, 1, 1,
-0.7125906, -0.03499621, -3.460449, 1, 1, 1, 1, 1,
-0.7094061, -0.5345929, -0.1028039, 0, 0, 1, 1, 1,
-0.703576, -0.7450077, -0.7229821, 1, 0, 0, 1, 1,
-0.7032536, 0.3568239, -3.017421, 1, 0, 0, 1, 1,
-0.7024753, -0.5285015, -3.394696, 1, 0, 0, 1, 1,
-0.6933743, 0.6987082, -1.545202, 1, 0, 0, 1, 1,
-0.6894132, -0.2081861, -0.7473747, 1, 0, 0, 1, 1,
-0.6888574, -0.8613566, -3.311926, 0, 0, 0, 1, 1,
-0.6814319, 0.3162462, -1.49319, 0, 0, 0, 1, 1,
-0.6767548, 0.4439287, -1.487208, 0, 0, 0, 1, 1,
-0.6732211, -1.131682, -1.007407, 0, 0, 0, 1, 1,
-0.6668621, 1.2632, -0.1775907, 0, 0, 0, 1, 1,
-0.6651677, 1.391296, -0.712291, 0, 0, 0, 1, 1,
-0.6613117, 0.9882289, -0.3453255, 0, 0, 0, 1, 1,
-0.6560389, -1.185838, -1.679056, 1, 1, 1, 1, 1,
-0.6523599, 0.102564, -2.233924, 1, 1, 1, 1, 1,
-0.6442472, -0.0233194, -1.511202, 1, 1, 1, 1, 1,
-0.643346, 2.006056, 0.4239563, 1, 1, 1, 1, 1,
-0.6418555, 0.7308993, -0.09391525, 1, 1, 1, 1, 1,
-0.6382732, -1.125097, -4.359637, 1, 1, 1, 1, 1,
-0.6364012, 0.02355611, -3.506874, 1, 1, 1, 1, 1,
-0.6294774, -0.8307266, -1.932176, 1, 1, 1, 1, 1,
-0.6292548, -1.307142, -2.193945, 1, 1, 1, 1, 1,
-0.6254467, 0.7223172, 0.8805125, 1, 1, 1, 1, 1,
-0.6238505, 0.5572685, -1.463805, 1, 1, 1, 1, 1,
-0.6237962, 1.259407, 1.087901, 1, 1, 1, 1, 1,
-0.623069, 0.9297192, -0.9715443, 1, 1, 1, 1, 1,
-0.622196, -2.331537, -2.703816, 1, 1, 1, 1, 1,
-0.6217317, -0.1798676, -3.338872, 1, 1, 1, 1, 1,
-0.620442, -0.7966468, -1.674714, 0, 0, 1, 1, 1,
-0.6169966, 0.1087951, -2.688346, 1, 0, 0, 1, 1,
-0.6154745, -0.1342531, -0.7171127, 1, 0, 0, 1, 1,
-0.6076195, 0.2556782, -0.8453825, 1, 0, 0, 1, 1,
-0.607313, 0.3863178, -0.4137491, 1, 0, 0, 1, 1,
-0.6014002, 0.4538527, -0.9437481, 1, 0, 0, 1, 1,
-0.5969629, 0.02005249, -1.676261, 0, 0, 0, 1, 1,
-0.5886427, 1.610795, 0.5719284, 0, 0, 0, 1, 1,
-0.588526, -0.1660919, 0.08968034, 0, 0, 0, 1, 1,
-0.5855977, -0.3617947, -1.562517, 0, 0, 0, 1, 1,
-0.5810198, -0.2755405, -1.839365, 0, 0, 0, 1, 1,
-0.5773399, -0.09458623, -3.48745, 0, 0, 0, 1, 1,
-0.5772208, 0.02354434, -1.46795, 0, 0, 0, 1, 1,
-0.5757705, 0.9719255, 0.3414583, 1, 1, 1, 1, 1,
-0.5671182, 0.6383567, -1.455444, 1, 1, 1, 1, 1,
-0.5654538, 0.09689872, -0.322583, 1, 1, 1, 1, 1,
-0.5635968, -0.4282342, -0.8289184, 1, 1, 1, 1, 1,
-0.5416315, -0.4768559, -3.839177, 1, 1, 1, 1, 1,
-0.53367, 0.7422297, -1.380537, 1, 1, 1, 1, 1,
-0.5314839, 1.131754, 0.2163488, 1, 1, 1, 1, 1,
-0.5314586, 1.740849, -1.327171, 1, 1, 1, 1, 1,
-0.5298924, 0.1989046, -1.986655, 1, 1, 1, 1, 1,
-0.5282857, -0.005538572, -1.405641, 1, 1, 1, 1, 1,
-0.5262716, -0.7662514, -2.560889, 1, 1, 1, 1, 1,
-0.5223381, 1.600527, 0.6245809, 1, 1, 1, 1, 1,
-0.5192862, -0.9860123, -3.067405, 1, 1, 1, 1, 1,
-0.5187124, 1.4691, 0.7343709, 1, 1, 1, 1, 1,
-0.5171344, 1.141794, -2.244382, 1, 1, 1, 1, 1,
-0.5151405, -0.4374515, -3.158775, 0, 0, 1, 1, 1,
-0.5070755, 0.1491722, -1.7302, 1, 0, 0, 1, 1,
-0.5058135, 2.00036, 0.9754686, 1, 0, 0, 1, 1,
-0.5012073, 0.3510758, -0.7642453, 1, 0, 0, 1, 1,
-0.4953782, 0.6572288, -1.444789, 1, 0, 0, 1, 1,
-0.4943311, 1.002142, -0.4693151, 1, 0, 0, 1, 1,
-0.4880534, 0.4904802, -1.10105, 0, 0, 0, 1, 1,
-0.4869721, 0.1547182, -1.16028, 0, 0, 0, 1, 1,
-0.4840552, -0.5064703, -2.727161, 0, 0, 0, 1, 1,
-0.4839608, -0.3615208, -1.5573, 0, 0, 0, 1, 1,
-0.4813051, -0.346157, -2.541187, 0, 0, 0, 1, 1,
-0.4810048, -0.2469595, -2.556962, 0, 0, 0, 1, 1,
-0.478795, -0.09341717, -2.993454, 0, 0, 0, 1, 1,
-0.4774184, -0.5495782, -1.114653, 1, 1, 1, 1, 1,
-0.4761854, -0.6735386, -1.208647, 1, 1, 1, 1, 1,
-0.4751061, 1.699247, -0.5969284, 1, 1, 1, 1, 1,
-0.4699846, -0.2566141, -1.573051, 1, 1, 1, 1, 1,
-0.469979, 0.05817994, 0.1543811, 1, 1, 1, 1, 1,
-0.4686483, -0.0359203, -1.191208, 1, 1, 1, 1, 1,
-0.4673111, 0.973314, -1.368298, 1, 1, 1, 1, 1,
-0.4643857, -1.02993, -3.540137, 1, 1, 1, 1, 1,
-0.4611453, 0.180199, -1.417236, 1, 1, 1, 1, 1,
-0.4512615, 0.941674, 0.1979477, 1, 1, 1, 1, 1,
-0.4505079, 1.010007, -1.674306, 1, 1, 1, 1, 1,
-0.4496237, -0.8355945, -2.334349, 1, 1, 1, 1, 1,
-0.4459751, -0.8739487, -2.912615, 1, 1, 1, 1, 1,
-0.4446396, 0.2625753, -1.07829, 1, 1, 1, 1, 1,
-0.4424861, 1.491866, -2.453891, 1, 1, 1, 1, 1,
-0.4424496, -0.7412742, -3.643109, 0, 0, 1, 1, 1,
-0.4399814, 0.08918784, -2.079015, 1, 0, 0, 1, 1,
-0.43454, -1.41485, -4.300043, 1, 0, 0, 1, 1,
-0.433851, 2.098704, 0.8961621, 1, 0, 0, 1, 1,
-0.4297858, -0.1192584, -2.0346, 1, 0, 0, 1, 1,
-0.4285656, -0.05332561, -0.2350865, 1, 0, 0, 1, 1,
-0.4273694, -0.0003171638, -2.02274, 0, 0, 0, 1, 1,
-0.4254323, 0.5276803, -0.5104386, 0, 0, 0, 1, 1,
-0.4210632, -0.3713088, -1.005905, 0, 0, 0, 1, 1,
-0.4192538, -0.2082617, -0.858303, 0, 0, 0, 1, 1,
-0.4115162, 0.4202791, -0.8266277, 0, 0, 0, 1, 1,
-0.4101403, -0.1137553, -0.7161315, 0, 0, 0, 1, 1,
-0.4072541, -0.9396798, -3.666616, 0, 0, 0, 1, 1,
-0.406884, 1.643241, -0.3098919, 1, 1, 1, 1, 1,
-0.3958815, -1.99997, -2.365447, 1, 1, 1, 1, 1,
-0.3948448, -0.5294429, -0.1222995, 1, 1, 1, 1, 1,
-0.3919376, -1.333683, -2.539202, 1, 1, 1, 1, 1,
-0.3917349, 0.6733834, -1.533001, 1, 1, 1, 1, 1,
-0.391137, -0.3476898, -2.385771, 1, 1, 1, 1, 1,
-0.3897334, 1.123117, -0.7047883, 1, 1, 1, 1, 1,
-0.3838343, -0.9508821, -2.443601, 1, 1, 1, 1, 1,
-0.3806642, -1.662974, -2.529057, 1, 1, 1, 1, 1,
-0.3804061, -1.993431, -4.038296, 1, 1, 1, 1, 1,
-0.3790779, -0.2665548, -1.93911, 1, 1, 1, 1, 1,
-0.3790742, -0.5154319, -4.081052, 1, 1, 1, 1, 1,
-0.3790734, 0.638742, 1.059603, 1, 1, 1, 1, 1,
-0.3788346, -0.7411691, -2.30078, 1, 1, 1, 1, 1,
-0.3783595, 1.880973, -0.07066583, 1, 1, 1, 1, 1,
-0.3730602, 0.5734688, 0.5262539, 0, 0, 1, 1, 1,
-0.3728756, 0.2677292, -0.1519753, 1, 0, 0, 1, 1,
-0.372834, -0.230002, -2.549604, 1, 0, 0, 1, 1,
-0.372577, 0.72901, -0.0512795, 1, 0, 0, 1, 1,
-0.3645549, -0.1649089, -2.334036, 1, 0, 0, 1, 1,
-0.3596939, -0.3063172, -3.513885, 1, 0, 0, 1, 1,
-0.3573557, -1.315304, -1.945721, 0, 0, 0, 1, 1,
-0.3523549, -0.1480458, -0.8827139, 0, 0, 0, 1, 1,
-0.3500214, -0.2148748, -1.862015, 0, 0, 0, 1, 1,
-0.3498768, -1.044137, -5.566272, 0, 0, 0, 1, 1,
-0.3454226, -0.0213328, -1.00298, 0, 0, 0, 1, 1,
-0.345234, 0.2090535, -0.2431349, 0, 0, 0, 1, 1,
-0.3389524, -1.137651, -2.873586, 0, 0, 0, 1, 1,
-0.338457, -0.2045202, -0.287573, 1, 1, 1, 1, 1,
-0.3366938, -0.5748001, -3.485743, 1, 1, 1, 1, 1,
-0.3350316, 0.9507796, 0.4328811, 1, 1, 1, 1, 1,
-0.3244372, 0.6949662, -0.9239293, 1, 1, 1, 1, 1,
-0.3227102, -0.4993132, -2.946562, 1, 1, 1, 1, 1,
-0.3212166, 0.4591948, -0.7782475, 1, 1, 1, 1, 1,
-0.3190799, -0.4460847, -1.825602, 1, 1, 1, 1, 1,
-0.3181993, 0.1758298, -1.047373, 1, 1, 1, 1, 1,
-0.3181909, 0.3871924, -2.444503, 1, 1, 1, 1, 1,
-0.3123754, -0.3979768, -3.92224, 1, 1, 1, 1, 1,
-0.3121803, -0.03000519, -2.554988, 1, 1, 1, 1, 1,
-0.3055283, 1.283657, -0.1822011, 1, 1, 1, 1, 1,
-0.3041667, 0.7981781, -0.5108535, 1, 1, 1, 1, 1,
-0.3028933, 1.363522, -0.5873901, 1, 1, 1, 1, 1,
-0.3004662, -0.387064, -1.002894, 1, 1, 1, 1, 1,
-0.3002762, 0.02409231, -1.209377, 0, 0, 1, 1, 1,
-0.2916256, 1.735558, 0.8676463, 1, 0, 0, 1, 1,
-0.289642, 0.4417532, 0.2320968, 1, 0, 0, 1, 1,
-0.2885904, -0.5413335, -2.839043, 1, 0, 0, 1, 1,
-0.2857724, -1.257618, -3.304745, 1, 0, 0, 1, 1,
-0.2848983, -1.48015, -2.032032, 1, 0, 0, 1, 1,
-0.2814744, 1.158409, 0.08507883, 0, 0, 0, 1, 1,
-0.2796451, 0.05379594, -2.857124, 0, 0, 0, 1, 1,
-0.2782334, 0.1178766, -2.456844, 0, 0, 0, 1, 1,
-0.2778286, 1.603409, -0.3865358, 0, 0, 0, 1, 1,
-0.2750426, 1.7324, -0.9604257, 0, 0, 0, 1, 1,
-0.2696579, -0.2110685, -2.097978, 0, 0, 0, 1, 1,
-0.2687398, 0.2978966, -1.716963, 0, 0, 0, 1, 1,
-0.261099, 0.2264874, -1.138379, 1, 1, 1, 1, 1,
-0.2593761, -2.250111, -2.311315, 1, 1, 1, 1, 1,
-0.259157, 1.069535, -0.3718482, 1, 1, 1, 1, 1,
-0.2580944, -0.747425, -2.602963, 1, 1, 1, 1, 1,
-0.255757, 0.8260226, 1.608562, 1, 1, 1, 1, 1,
-0.254267, 1.278427, 1.701707, 1, 1, 1, 1, 1,
-0.2460847, 1.865829, -0.6729453, 1, 1, 1, 1, 1,
-0.2452556, -1.563785, -3.117251, 1, 1, 1, 1, 1,
-0.2437666, -0.2910734, -1.715636, 1, 1, 1, 1, 1,
-0.2435903, -0.7508244, -2.522897, 1, 1, 1, 1, 1,
-0.2417471, -0.5111691, -2.512717, 1, 1, 1, 1, 1,
-0.2391616, -1.098339, -1.546738, 1, 1, 1, 1, 1,
-0.2372778, -0.6005588, -1.901551, 1, 1, 1, 1, 1,
-0.2350462, 0.34823, -0.9353375, 1, 1, 1, 1, 1,
-0.234061, -0.8471538, -3.375855, 1, 1, 1, 1, 1,
-0.234035, 0.4962892, -1.00755, 0, 0, 1, 1, 1,
-0.2326276, -0.7091817, -0.3436576, 1, 0, 0, 1, 1,
-0.2285281, -1.072069, -4.440999, 1, 0, 0, 1, 1,
-0.2275357, -0.4821461, -1.044533, 1, 0, 0, 1, 1,
-0.218937, -1.417794, -4.117918, 1, 0, 0, 1, 1,
-0.2149164, -0.3745836, -1.094919, 1, 0, 0, 1, 1,
-0.2134874, 1.684324, -0.816047, 0, 0, 0, 1, 1,
-0.2133486, -0.348513, -3.704805, 0, 0, 0, 1, 1,
-0.211144, -0.8892152, -2.880139, 0, 0, 0, 1, 1,
-0.2033596, -0.8250068, -4.648932, 0, 0, 0, 1, 1,
-0.1989395, 0.003473375, -0.38018, 0, 0, 0, 1, 1,
-0.1971808, 0.7363907, 0.5914111, 0, 0, 0, 1, 1,
-0.1968634, 0.6491139, -1.248245, 0, 0, 0, 1, 1,
-0.1955612, 0.3640255, -0.7475404, 1, 1, 1, 1, 1,
-0.1938272, -0.3428887, -2.699178, 1, 1, 1, 1, 1,
-0.1926045, 1.778477, -0.726325, 1, 1, 1, 1, 1,
-0.1924225, 0.587793, -0.5793402, 1, 1, 1, 1, 1,
-0.1896223, 1.14011, -0.4584678, 1, 1, 1, 1, 1,
-0.189147, -0.8557978, -1.329399, 1, 1, 1, 1, 1,
-0.1872753, 1.515539, 0.4184223, 1, 1, 1, 1, 1,
-0.1851595, -1.330451, -2.843333, 1, 1, 1, 1, 1,
-0.1851542, 0.7185262, 0.4924512, 1, 1, 1, 1, 1,
-0.1822861, -1.171805, -2.560163, 1, 1, 1, 1, 1,
-0.1812863, 0.3226291, -1.164834, 1, 1, 1, 1, 1,
-0.180551, -0.4812812, -3.520333, 1, 1, 1, 1, 1,
-0.180448, -0.6110024, -3.428498, 1, 1, 1, 1, 1,
-0.1782814, -0.05903419, -1.281002, 1, 1, 1, 1, 1,
-0.1780345, 2.195654, 0.1447046, 1, 1, 1, 1, 1,
-0.1764591, 0.3498914, -0.6372271, 0, 0, 1, 1, 1,
-0.1739577, -0.3598768, -2.17718, 1, 0, 0, 1, 1,
-0.164718, 1.388376, -1.157043, 1, 0, 0, 1, 1,
-0.1624963, -0.7738234, -2.97243, 1, 0, 0, 1, 1,
-0.1623763, -1.407673, -1.964249, 1, 0, 0, 1, 1,
-0.1597599, 0.6667603, 1.041432, 1, 0, 0, 1, 1,
-0.1534633, -0.7987909, -2.867998, 0, 0, 0, 1, 1,
-0.148841, -1.901743, -3.753544, 0, 0, 0, 1, 1,
-0.1445099, 0.2201804, -0.3622271, 0, 0, 0, 1, 1,
-0.1432985, 1.2577, 1.5433, 0, 0, 0, 1, 1,
-0.1432111, 0.5442561, -0.1758131, 0, 0, 0, 1, 1,
-0.1429825, 0.08349641, -1.372599, 0, 0, 0, 1, 1,
-0.13948, -0.4129384, -2.690813, 0, 0, 0, 1, 1,
-0.1358433, -1.026328, -3.164426, 1, 1, 1, 1, 1,
-0.131875, -1.342727, -2.714591, 1, 1, 1, 1, 1,
-0.130197, -0.5785993, -0.7239423, 1, 1, 1, 1, 1,
-0.1272268, -0.7047486, -4.139472, 1, 1, 1, 1, 1,
-0.1266516, 0.8108953, 1.180076, 1, 1, 1, 1, 1,
-0.1263355, 1.5462, -0.8504469, 1, 1, 1, 1, 1,
-0.1221648, -0.5610619, -3.504629, 1, 1, 1, 1, 1,
-0.1195991, -0.1801323, -5.531698, 1, 1, 1, 1, 1,
-0.114502, -0.3789534, -1.598659, 1, 1, 1, 1, 1,
-0.1133971, -0.2431206, -2.224558, 1, 1, 1, 1, 1,
-0.1126063, 0.6730824, 0.05016821, 1, 1, 1, 1, 1,
-0.112194, 1.093152, -0.9542543, 1, 1, 1, 1, 1,
-0.1110526, -1.103056, -3.124495, 1, 1, 1, 1, 1,
-0.1094782, -0.8338903, -3.090707, 1, 1, 1, 1, 1,
-0.1082409, 1.215221, 0.09164724, 1, 1, 1, 1, 1,
-0.1053929, -0.2711436, -2.565697, 0, 0, 1, 1, 1,
-0.1050073, -0.2672896, -3.126656, 1, 0, 0, 1, 1,
-0.1024042, 0.9836766, 0.6091661, 1, 0, 0, 1, 1,
-0.100294, -0.7100012, -1.839866, 1, 0, 0, 1, 1,
-0.09867928, -1.247826, -3.329578, 1, 0, 0, 1, 1,
-0.09625666, -0.6444455, -2.898599, 1, 0, 0, 1, 1,
-0.09231202, -2.347347, -3.55738, 0, 0, 0, 1, 1,
-0.08857983, -2.604286, -4.061402, 0, 0, 0, 1, 1,
-0.08823352, 0.2492663, -0.2827094, 0, 0, 0, 1, 1,
-0.08687067, 1.190655, 0.9906633, 0, 0, 0, 1, 1,
-0.08490741, -1.892107, -2.451839, 0, 0, 0, 1, 1,
-0.08256005, 1.660398, -1.083681, 0, 0, 0, 1, 1,
-0.07356093, 1.418287, 0.5065469, 0, 0, 0, 1, 1,
-0.07051098, -0.07855064, -0.1454927, 1, 1, 1, 1, 1,
-0.06884478, -1.17486, -3.671348, 1, 1, 1, 1, 1,
-0.0621837, -0.8572001, -2.282459, 1, 1, 1, 1, 1,
-0.04863347, 0.142375, -0.6884944, 1, 1, 1, 1, 1,
-0.04539857, 1.037149, 0.01622036, 1, 1, 1, 1, 1,
-0.04440815, 0.7072201, 0.1925255, 1, 1, 1, 1, 1,
-0.04301096, 0.8261246, 0.7509184, 1, 1, 1, 1, 1,
-0.0418886, -0.3109963, -2.830374, 1, 1, 1, 1, 1,
-0.04158634, -1.643444, -3.587635, 1, 1, 1, 1, 1,
-0.03828665, -0.2335732, -3.067786, 1, 1, 1, 1, 1,
-0.02828266, 0.5014095, -0.02186006, 1, 1, 1, 1, 1,
-0.02713278, 0.8746968, 1.898069, 1, 1, 1, 1, 1,
-0.02655936, -0.2175153, -1.457992, 1, 1, 1, 1, 1,
-0.02639013, -0.1565473, -3.805904, 1, 1, 1, 1, 1,
-0.01718851, -0.9453284, -3.146592, 1, 1, 1, 1, 1,
-0.01705704, -1.879189, -2.911696, 0, 0, 1, 1, 1,
-0.01547614, -2.365918, -2.045501, 1, 0, 0, 1, 1,
-0.01511404, 0.3219293, 0.8944427, 1, 0, 0, 1, 1,
-0.01022895, -0.02046691, -0.9788885, 1, 0, 0, 1, 1,
-0.01021817, 1.270823, -0.05478854, 1, 0, 0, 1, 1,
-0.01009517, 0.6584388, -1.565271, 1, 0, 0, 1, 1,
-0.007504499, -0.7638213, -2.993784, 0, 0, 0, 1, 1,
-0.005493165, 0.4318486, -1.816882, 0, 0, 0, 1, 1,
-0.002202231, 1.296041, -0.7251629, 0, 0, 0, 1, 1,
2.102604e-05, -2.423632, 3.776626, 0, 0, 0, 1, 1,
0.003858759, -0.5610609, 4.207894, 0, 0, 0, 1, 1,
0.003865344, 1.094134, -1.526268, 0, 0, 0, 1, 1,
0.0072086, 2.71066, -0.3512178, 0, 0, 0, 1, 1,
0.00747589, -0.6483505, 4.162753, 1, 1, 1, 1, 1,
0.007934676, 0.5348861, -1.387247, 1, 1, 1, 1, 1,
0.01116516, -0.395318, 1.716152, 1, 1, 1, 1, 1,
0.01148326, -1.30782, 1.684674, 1, 1, 1, 1, 1,
0.01428162, 0.268802, 0.9751928, 1, 1, 1, 1, 1,
0.01454345, 1.274717, 1.127759, 1, 1, 1, 1, 1,
0.01502013, -1.192337, 2.196987, 1, 1, 1, 1, 1,
0.0183098, -0.1840647, 2.897217, 1, 1, 1, 1, 1,
0.02125972, 0.1973352, 0.1426602, 1, 1, 1, 1, 1,
0.02410157, 0.5794438, -1.197048, 1, 1, 1, 1, 1,
0.0268537, -0.3644219, 3.235526, 1, 1, 1, 1, 1,
0.02899727, -0.9069992, 3.045473, 1, 1, 1, 1, 1,
0.03129601, 1.933842, -0.9638234, 1, 1, 1, 1, 1,
0.03344175, -1.119666, 2.558655, 1, 1, 1, 1, 1,
0.03567664, -0.5046684, 3.785951, 1, 1, 1, 1, 1,
0.03610613, 1.812794, 0.06930017, 0, 0, 1, 1, 1,
0.03684703, -0.8759765, 3.632969, 1, 0, 0, 1, 1,
0.03906941, 0.3292286, 0.2382672, 1, 0, 0, 1, 1,
0.04417853, -1.222746, 3.237554, 1, 0, 0, 1, 1,
0.04804118, 0.6734062, -1.947203, 1, 0, 0, 1, 1,
0.04829854, 0.8849478, -0.02784394, 1, 0, 0, 1, 1,
0.04911273, 0.07296427, 1.384622, 0, 0, 0, 1, 1,
0.04937935, -1.109653, 2.966287, 0, 0, 0, 1, 1,
0.05165603, 0.8205892, -0.1596474, 0, 0, 0, 1, 1,
0.05661593, -1.545092, 2.862885, 0, 0, 0, 1, 1,
0.05853298, 0.6182127, -1.347847, 0, 0, 0, 1, 1,
0.06116779, 0.1634051, 0.9390225, 0, 0, 0, 1, 1,
0.06186231, 2.816243, -0.7865166, 0, 0, 0, 1, 1,
0.0673293, -0.4893358, 2.911199, 1, 1, 1, 1, 1,
0.06760915, -0.03821559, 1.74024, 1, 1, 1, 1, 1,
0.0677297, -2.297799, 3.632903, 1, 1, 1, 1, 1,
0.06787448, -1.310124, 1.681478, 1, 1, 1, 1, 1,
0.07180983, -0.3570172, 3.297972, 1, 1, 1, 1, 1,
0.07191063, -0.2791488, 3.421097, 1, 1, 1, 1, 1,
0.07392033, 0.7950911, -0.1610803, 1, 1, 1, 1, 1,
0.07393378, -1.01083, 3.87179, 1, 1, 1, 1, 1,
0.07504009, 0.5990657, -0.02706174, 1, 1, 1, 1, 1,
0.07512011, -1.682083, 2.460968, 1, 1, 1, 1, 1,
0.07874016, 0.1606764, 0.4932563, 1, 1, 1, 1, 1,
0.08109906, -0.9354906, 3.671443, 1, 1, 1, 1, 1,
0.09342995, 0.04191331, -0.4462972, 1, 1, 1, 1, 1,
0.09369431, -0.290823, 2.129847, 1, 1, 1, 1, 1,
0.09399081, -1.468201, 4.038295, 1, 1, 1, 1, 1,
0.09623108, 0.3566437, 0.9767362, 0, 0, 1, 1, 1,
0.09748226, 1.143623, 0.8703629, 1, 0, 0, 1, 1,
0.09780784, 0.4729979, 0.08203641, 1, 0, 0, 1, 1,
0.09880973, 1.093995, -0.3833094, 1, 0, 0, 1, 1,
0.101285, -0.4923562, 3.540677, 1, 0, 0, 1, 1,
0.1013985, 0.9376582, 1.818387, 1, 0, 0, 1, 1,
0.1033219, -1.760366, 2.450251, 0, 0, 0, 1, 1,
0.110663, 0.1395039, 2.598626, 0, 0, 0, 1, 1,
0.1109424, -0.360275, 2.733546, 0, 0, 0, 1, 1,
0.1110445, 1.140615, 0.4501268, 0, 0, 0, 1, 1,
0.1118968, -0.3396119, 2.689241, 0, 0, 0, 1, 1,
0.1133287, -0.1918177, 2.36535, 0, 0, 0, 1, 1,
0.1218922, 0.5316792, -0.5764245, 0, 0, 0, 1, 1,
0.127293, 0.1626264, 2.64094, 1, 1, 1, 1, 1,
0.1275589, -0.8980291, 2.258546, 1, 1, 1, 1, 1,
0.1278469, -0.7515528, 0.9108672, 1, 1, 1, 1, 1,
0.1339763, 1.643687, -0.830395, 1, 1, 1, 1, 1,
0.1349067, 0.6947428, 1.094752, 1, 1, 1, 1, 1,
0.1364928, 0.249504, 2.809637, 1, 1, 1, 1, 1,
0.1376063, 0.6464903, 2.474339, 1, 1, 1, 1, 1,
0.1391012, -2.025124, 2.999265, 1, 1, 1, 1, 1,
0.1414738, 0.7114519, 1.402606, 1, 1, 1, 1, 1,
0.1418755, 0.502607, 0.2994771, 1, 1, 1, 1, 1,
0.1477706, -0.7018736, 3.980116, 1, 1, 1, 1, 1,
0.1489011, -0.08617917, 2.215251, 1, 1, 1, 1, 1,
0.1493435, 0.4506317, -0.2457561, 1, 1, 1, 1, 1,
0.1500725, 1.806392, -1.002965, 1, 1, 1, 1, 1,
0.1531764, 0.8286194, -0.5252042, 1, 1, 1, 1, 1,
0.1549997, -0.2447868, 4.208453, 0, 0, 1, 1, 1,
0.1583293, -0.2223601, 4.897761, 1, 0, 0, 1, 1,
0.1666185, -0.6004853, 2.266737, 1, 0, 0, 1, 1,
0.1697349, -1.211872, 1.259951, 1, 0, 0, 1, 1,
0.1700975, -0.9060751, 2.350063, 1, 0, 0, 1, 1,
0.1744161, -0.07398753, 2.462352, 1, 0, 0, 1, 1,
0.1754676, 1.400502, 1.938974, 0, 0, 0, 1, 1,
0.1755705, -0.2306895, 2.632107, 0, 0, 0, 1, 1,
0.180261, 0.6918304, -0.5014091, 0, 0, 0, 1, 1,
0.1830503, 0.06939147, 0.8534289, 0, 0, 0, 1, 1,
0.1845894, -1.087888, 4.705056, 0, 0, 0, 1, 1,
0.1914096, -0.7157059, 2.46845, 0, 0, 0, 1, 1,
0.1915088, -0.5012072, 1.727921, 0, 0, 0, 1, 1,
0.1978916, 0.9687573, -0.957914, 1, 1, 1, 1, 1,
0.1994961, 1.897911, -1.560156, 1, 1, 1, 1, 1,
0.2023106, 1.117579, 0.6306399, 1, 1, 1, 1, 1,
0.2034564, -2.065941, 3.819901, 1, 1, 1, 1, 1,
0.2057071, 0.4143965, 0.4971114, 1, 1, 1, 1, 1,
0.2083097, 1.373645, 1.18696, 1, 1, 1, 1, 1,
0.2093152, 0.357616, 1.72469, 1, 1, 1, 1, 1,
0.2100485, 0.7927331, 0.1248917, 1, 1, 1, 1, 1,
0.2108012, -1.676074, 3.09653, 1, 1, 1, 1, 1,
0.2108728, 1.201877, -1.715455, 1, 1, 1, 1, 1,
0.2116216, -0.8185405, 4.007888, 1, 1, 1, 1, 1,
0.214296, -0.05272414, 2.276421, 1, 1, 1, 1, 1,
0.2152294, -0.920061, 3.099165, 1, 1, 1, 1, 1,
0.2167661, 0.6641582, -0.6285848, 1, 1, 1, 1, 1,
0.2225292, 0.4372173, 1.945337, 1, 1, 1, 1, 1,
0.2238849, -0.2095526, 1.954862, 0, 0, 1, 1, 1,
0.2287062, 1.099023, -0.8104663, 1, 0, 0, 1, 1,
0.232014, -0.6894531, 2.26931, 1, 0, 0, 1, 1,
0.2417304, -0.1728693, 1.085735, 1, 0, 0, 1, 1,
0.2428945, -0.2083956, 2.427889, 1, 0, 0, 1, 1,
0.2444809, 2.030118, -1.67485, 1, 0, 0, 1, 1,
0.246783, 1.036494, 0.9502754, 0, 0, 0, 1, 1,
0.2481032, -0.4571479, 3.592335, 0, 0, 0, 1, 1,
0.2583707, -0.8614044, 2.602701, 0, 0, 0, 1, 1,
0.2603548, 0.906343, 1.682025, 0, 0, 0, 1, 1,
0.2604598, 1.183008, 0.7918079, 0, 0, 0, 1, 1,
0.2647996, 0.6145255, -0.6151915, 0, 0, 0, 1, 1,
0.2696853, 0.04050835, -0.3747787, 0, 0, 0, 1, 1,
0.2718773, 1.293921, 0.2893832, 1, 1, 1, 1, 1,
0.2745399, -0.1028161, 0.8703099, 1, 1, 1, 1, 1,
0.2771039, 0.6295743, 2.310075, 1, 1, 1, 1, 1,
0.2791418, 2.039886, 1.039836, 1, 1, 1, 1, 1,
0.2848668, 1.74576, 1.360109, 1, 1, 1, 1, 1,
0.2851542, 0.6629385, 1.521904, 1, 1, 1, 1, 1,
0.2911613, 0.8428066, 0.2361551, 1, 1, 1, 1, 1,
0.2950404, -0.5605428, 3.625059, 1, 1, 1, 1, 1,
0.297807, 0.3015631, 1.15401, 1, 1, 1, 1, 1,
0.2984326, 0.2666414, -0.1782239, 1, 1, 1, 1, 1,
0.300901, 1.057026, 0.5606828, 1, 1, 1, 1, 1,
0.3037368, -1.184744, 2.494006, 1, 1, 1, 1, 1,
0.3079421, -0.3286755, 2.551237, 1, 1, 1, 1, 1,
0.31675, 1.487818, -0.6277366, 1, 1, 1, 1, 1,
0.3201937, 0.8867381, 1.898939, 1, 1, 1, 1, 1,
0.3257687, -0.1222046, 2.157789, 0, 0, 1, 1, 1,
0.3260415, -0.8521559, 2.003682, 1, 0, 0, 1, 1,
0.3275095, 0.5649105, 1.670137, 1, 0, 0, 1, 1,
0.3313191, 0.421487, 2.699259, 1, 0, 0, 1, 1,
0.3324869, -0.3801763, 1.862286, 1, 0, 0, 1, 1,
0.3404696, -1.997747, 1.850516, 1, 0, 0, 1, 1,
0.3444589, -0.3707767, 2.001853, 0, 0, 0, 1, 1,
0.3480166, 0.5060907, 1.134863, 0, 0, 0, 1, 1,
0.3494702, -1.451184, 3.588546, 0, 0, 0, 1, 1,
0.3559745, -0.5801572, 3.098905, 0, 0, 0, 1, 1,
0.3632274, -1.169158, 2.41625, 0, 0, 0, 1, 1,
0.3634814, 0.08050427, -0.1249301, 0, 0, 0, 1, 1,
0.3636384, 0.698957, 0.7987941, 0, 0, 0, 1, 1,
0.366234, 0.546262, 2.20102, 1, 1, 1, 1, 1,
0.3688597, 1.518104, 0.7522189, 1, 1, 1, 1, 1,
0.3728234, 1.722259, 1.096287, 1, 1, 1, 1, 1,
0.3783652, 0.1598423, 0.9728658, 1, 1, 1, 1, 1,
0.3785074, -0.293927, 2.742697, 1, 1, 1, 1, 1,
0.3788861, 1.266833, -0.8273277, 1, 1, 1, 1, 1,
0.3788977, 2.373814, -0.9633597, 1, 1, 1, 1, 1,
0.378918, -1.356178, 2.946055, 1, 1, 1, 1, 1,
0.3839395, -1.662143, 2.346442, 1, 1, 1, 1, 1,
0.3842648, -1.392366, 1.696233, 1, 1, 1, 1, 1,
0.3868971, 0.5049562, 1.061792, 1, 1, 1, 1, 1,
0.3886137, -0.2047909, 2.571719, 1, 1, 1, 1, 1,
0.39194, 1.20147, 0.01522056, 1, 1, 1, 1, 1,
0.3953125, 1.097853, -0.09765965, 1, 1, 1, 1, 1,
0.3955344, -0.7627704, 3.036549, 1, 1, 1, 1, 1,
0.3997611, 0.9880348, 1.584023, 0, 0, 1, 1, 1,
0.4014195, 1.790444, 0.6516677, 1, 0, 0, 1, 1,
0.4017357, -0.5796869, 1.930805, 1, 0, 0, 1, 1,
0.4058007, -1.167068, 1.046129, 1, 0, 0, 1, 1,
0.4066912, -1.37634, 2.768715, 1, 0, 0, 1, 1,
0.4141448, -0.6053953, 4.606005, 1, 0, 0, 1, 1,
0.4192425, 0.644671, 1.2831, 0, 0, 0, 1, 1,
0.4236451, 0.7329552, 0.5905051, 0, 0, 0, 1, 1,
0.4239865, -0.7199379, 1.964079, 0, 0, 0, 1, 1,
0.4244435, -0.5492691, 2.792855, 0, 0, 0, 1, 1,
0.4263074, 0.8463399, 2.048916, 0, 0, 0, 1, 1,
0.4277247, 1.021556, 1.028364, 0, 0, 0, 1, 1,
0.428446, 1.242628, 0.1506397, 0, 0, 0, 1, 1,
0.4304245, -0.7909193, 2.617409, 1, 1, 1, 1, 1,
0.4328529, -0.5028799, 2.746535, 1, 1, 1, 1, 1,
0.4350495, -0.07678358, 1.581773, 1, 1, 1, 1, 1,
0.4372041, -0.7218806, 1.444748, 1, 1, 1, 1, 1,
0.4437241, 1.550885, 0.9134086, 1, 1, 1, 1, 1,
0.4455507, 0.05347611, 1.890848, 1, 1, 1, 1, 1,
0.4474298, 0.9819305, -0.6661865, 1, 1, 1, 1, 1,
0.4481393, -0.3474048, 3.125467, 1, 1, 1, 1, 1,
0.4505426, 0.1830728, 1.114235, 1, 1, 1, 1, 1,
0.4525884, -0.06996483, 3.101019, 1, 1, 1, 1, 1,
0.4551483, 1.915732, 0.2027697, 1, 1, 1, 1, 1,
0.4575696, -1.252766, 3.60777, 1, 1, 1, 1, 1,
0.4593042, -0.6388252, 2.226138, 1, 1, 1, 1, 1,
0.4631183, -0.3502645, 0.4825468, 1, 1, 1, 1, 1,
0.465096, -0.7139864, 2.871076, 1, 1, 1, 1, 1,
0.4699459, -0.1862593, 1.443792, 0, 0, 1, 1, 1,
0.4730834, 2.012981, -2.124132, 1, 0, 0, 1, 1,
0.4750181, 0.411874, 2.376564, 1, 0, 0, 1, 1,
0.4778531, 0.2004385, -1.042472, 1, 0, 0, 1, 1,
0.4804253, 0.5558771, -0.02868669, 1, 0, 0, 1, 1,
0.4812768, 1.392843, -0.5219231, 1, 0, 0, 1, 1,
0.4880947, -0.7459699, 1.19984, 0, 0, 0, 1, 1,
0.488214, -0.5409037, 2.785356, 0, 0, 0, 1, 1,
0.4968204, -1.039151, 2.47185, 0, 0, 0, 1, 1,
0.5004892, 0.5200787, 0.4873058, 0, 0, 0, 1, 1,
0.502225, -0.3542185, 0.4790652, 0, 0, 0, 1, 1,
0.5084683, 0.431582, 1.684597, 0, 0, 0, 1, 1,
0.5109317, -1.121963, 3.475387, 0, 0, 0, 1, 1,
0.5123115, 0.3382991, 1.441293, 1, 1, 1, 1, 1,
0.5127083, -0.5166112, 2.262832, 1, 1, 1, 1, 1,
0.518434, 0.5509707, 0.497902, 1, 1, 1, 1, 1,
0.5206667, -1.009788, 2.884206, 1, 1, 1, 1, 1,
0.5210901, -0.1501056, 2.825727, 1, 1, 1, 1, 1,
0.5218387, -0.6464958, 2.26146, 1, 1, 1, 1, 1,
0.5220274, -0.5568692, 1.869769, 1, 1, 1, 1, 1,
0.5232013, -0.5966431, 2.843443, 1, 1, 1, 1, 1,
0.5302415, -0.1781569, 1.423164, 1, 1, 1, 1, 1,
0.5322148, -1.633211, 0.7540824, 1, 1, 1, 1, 1,
0.5339067, 1.23107, 0.5882046, 1, 1, 1, 1, 1,
0.5341564, -0.6938993, 2.272895, 1, 1, 1, 1, 1,
0.535065, -0.4604809, 2.082249, 1, 1, 1, 1, 1,
0.5404244, 0.3707145, 0.3400934, 1, 1, 1, 1, 1,
0.5498856, -0.5608718, 1.417688, 1, 1, 1, 1, 1,
0.5557655, -1.105913, 1.876316, 0, 0, 1, 1, 1,
0.5623819, 0.947443, -0.5821549, 1, 0, 0, 1, 1,
0.5659942, 0.1655066, 0.2723282, 1, 0, 0, 1, 1,
0.5777377, -1.223879, 2.111639, 1, 0, 0, 1, 1,
0.5877755, 0.646131, -0.9761264, 1, 0, 0, 1, 1,
0.5881007, -1.075047, 3.221311, 1, 0, 0, 1, 1,
0.5910788, -1.594498, 2.186347, 0, 0, 0, 1, 1,
0.5966201, 0.2143597, 0.9055706, 0, 0, 0, 1, 1,
0.5968636, 1.825738, 0.9023753, 0, 0, 0, 1, 1,
0.6004168, 1.087062, -0.3708749, 0, 0, 0, 1, 1,
0.6019329, -0.07565028, 1.428352, 0, 0, 0, 1, 1,
0.6084296, 1.039873, 0.09247664, 0, 0, 0, 1, 1,
0.608767, 0.2434541, 1.015245, 0, 0, 0, 1, 1,
0.6094885, -1.285715, 2.795801, 1, 1, 1, 1, 1,
0.6194924, 0.7444582, -0.7827116, 1, 1, 1, 1, 1,
0.621964, -0.2369151, 1.833049, 1, 1, 1, 1, 1,
0.6248542, -0.3780158, 1.533555, 1, 1, 1, 1, 1,
0.6400633, 1.347017, 0.3700949, 1, 1, 1, 1, 1,
0.6405929, 2.083049, 1.175227, 1, 1, 1, 1, 1,
0.6451392, 0.8982016, 0.7840784, 1, 1, 1, 1, 1,
0.6525878, -2.526269, 3.667668, 1, 1, 1, 1, 1,
0.6528876, 1.772199, 0.8741486, 1, 1, 1, 1, 1,
0.654359, -1.569654, 2.592159, 1, 1, 1, 1, 1,
0.654442, -0.08128657, -0.2431294, 1, 1, 1, 1, 1,
0.6554169, -0.08254237, 2.077114, 1, 1, 1, 1, 1,
0.6555048, 1.749658, -2.184131, 1, 1, 1, 1, 1,
0.6615672, 0.5910236, 0.9621989, 1, 1, 1, 1, 1,
0.6621929, 0.3229178, 2.530133, 1, 1, 1, 1, 1,
0.6663333, -0.4593556, 2.698059, 0, 0, 1, 1, 1,
0.6692122, -1.299625, 2.718647, 1, 0, 0, 1, 1,
0.6696851, 2.114099, -0.3032023, 1, 0, 0, 1, 1,
0.6714376, 0.9758646, -0.2498664, 1, 0, 0, 1, 1,
0.6720545, -0.2899552, 2.112559, 1, 0, 0, 1, 1,
0.6753103, 0.8720469, -0.8281705, 1, 0, 0, 1, 1,
0.6780544, -1.035203, 0.8691481, 0, 0, 0, 1, 1,
0.6825653, 0.3228003, 3.153768, 0, 0, 0, 1, 1,
0.6857332, -0.4033157, 2.491472, 0, 0, 0, 1, 1,
0.6887209, -0.3028294, -0.004604215, 0, 0, 0, 1, 1,
0.6899356, -1.776591, 4.681696, 0, 0, 0, 1, 1,
0.6904176, -1.695448, 3.071241, 0, 0, 0, 1, 1,
0.6940185, 1.135436, 0.8851824, 0, 0, 0, 1, 1,
0.6945345, -0.2350919, 2.584614, 1, 1, 1, 1, 1,
0.7014937, -1.515651, 2.339803, 1, 1, 1, 1, 1,
0.7066123, -1.450561, 2.384138, 1, 1, 1, 1, 1,
0.719363, -0.673332, 1.212098, 1, 1, 1, 1, 1,
0.7195077, -0.6157572, 1.634672, 1, 1, 1, 1, 1,
0.7324458, 0.5615401, 1.402762, 1, 1, 1, 1, 1,
0.7324945, 0.9706457, 0.793521, 1, 1, 1, 1, 1,
0.7373472, -2.461614, 2.856738, 1, 1, 1, 1, 1,
0.7393769, 1.89817, 1.270515, 1, 1, 1, 1, 1,
0.7449122, -0.5130821, 2.294359, 1, 1, 1, 1, 1,
0.7510632, -0.5252632, 2.564514, 1, 1, 1, 1, 1,
0.7596595, 0.7845078, 1.022784, 1, 1, 1, 1, 1,
0.7632852, 1.824342, 0.6715407, 1, 1, 1, 1, 1,
0.7656354, 2.296351, 0.7163956, 1, 1, 1, 1, 1,
0.7666215, -0.5178978, 1.806466, 1, 1, 1, 1, 1,
0.7688633, 1.313127, -0.02095821, 0, 0, 1, 1, 1,
0.7718056, -0.05821889, 1.831848, 1, 0, 0, 1, 1,
0.7720841, 0.9718448, 1.548197, 1, 0, 0, 1, 1,
0.7728236, 0.285287, 0.2961252, 1, 0, 0, 1, 1,
0.7732854, 0.8486847, -0.05763665, 1, 0, 0, 1, 1,
0.7770965, 1.37588, -0.1500516, 1, 0, 0, 1, 1,
0.7782394, 1.596161, 0.3587322, 0, 0, 0, 1, 1,
0.7803549, 1.451033, -0.5497839, 0, 0, 0, 1, 1,
0.7805618, -0.4493807, 3.561161, 0, 0, 0, 1, 1,
0.7810647, -1.430325, 2.714431, 0, 0, 0, 1, 1,
0.788434, 1.673848, 0.2037146, 0, 0, 0, 1, 1,
0.7989923, 0.512789, -0.1141845, 0, 0, 0, 1, 1,
0.8064084, -0.07391312, 1.784433, 0, 0, 0, 1, 1,
0.8114392, -0.6918439, 1.667025, 1, 1, 1, 1, 1,
0.812976, 1.233544, 3.197544, 1, 1, 1, 1, 1,
0.8160014, -0.2631035, 0.7797049, 1, 1, 1, 1, 1,
0.8205128, 0.7249315, 0.2710089, 1, 1, 1, 1, 1,
0.8211151, 0.1786081, 1.617688, 1, 1, 1, 1, 1,
0.8218269, 1.474228, 0.09705583, 1, 1, 1, 1, 1,
0.8249713, -0.4128935, 2.925483, 1, 1, 1, 1, 1,
0.8277659, 0.01226792, 1.426017, 1, 1, 1, 1, 1,
0.8280513, -0.3830816, 2.45089, 1, 1, 1, 1, 1,
0.8337277, 0.612725, -0.1678721, 1, 1, 1, 1, 1,
0.8407844, 0.2258208, 1.895357, 1, 1, 1, 1, 1,
0.8408888, -0.8849311, 2.479033, 1, 1, 1, 1, 1,
0.8435251, -0.2001883, 2.118578, 1, 1, 1, 1, 1,
0.8538997, 1.386569, 0.7522703, 1, 1, 1, 1, 1,
0.8554322, 0.4769018, -0.3916512, 1, 1, 1, 1, 1,
0.8634511, 0.8981263, 1.812254, 0, 0, 1, 1, 1,
0.864513, -0.1480669, 1.896136, 1, 0, 0, 1, 1,
0.8667763, 0.7411401, 0.492282, 1, 0, 0, 1, 1,
0.8763303, 0.08588389, 3.246435, 1, 0, 0, 1, 1,
0.8805571, -0.1921145, 2.436034, 1, 0, 0, 1, 1,
0.8829945, -0.4069244, 0.148321, 1, 0, 0, 1, 1,
0.8863773, -1.841189, 3.189281, 0, 0, 0, 1, 1,
0.8916323, -0.2865407, 0.08188958, 0, 0, 0, 1, 1,
0.8953632, 1.932904, 0.9692731, 0, 0, 0, 1, 1,
0.9016649, -0.3109809, 2.524258, 0, 0, 0, 1, 1,
0.9028879, -1.214188, 1.547735, 0, 0, 0, 1, 1,
0.9103829, 0.3486413, 0.2391911, 0, 0, 0, 1, 1,
0.9115404, -1.164961, 3.810256, 0, 0, 0, 1, 1,
0.9145415, -0.1617342, 2.307817, 1, 1, 1, 1, 1,
0.9195127, 0.7893646, 2.584493, 1, 1, 1, 1, 1,
0.9217745, -1.817924, 3.412332, 1, 1, 1, 1, 1,
0.9241655, -0.1772399, 2.893402, 1, 1, 1, 1, 1,
0.9270495, 1.038506, -0.6313865, 1, 1, 1, 1, 1,
0.9322378, 0.06700696, 1.739378, 1, 1, 1, 1, 1,
0.9353228, 0.3621774, -0.9093446, 1, 1, 1, 1, 1,
0.9359295, 0.2592001, 2.536689, 1, 1, 1, 1, 1,
0.9361414, 0.4421859, 1.083757, 1, 1, 1, 1, 1,
0.9421093, 1.164196, 1.3222, 1, 1, 1, 1, 1,
0.9479858, 0.06033751, 0.4259088, 1, 1, 1, 1, 1,
0.9486929, 0.2938117, 1.013223, 1, 1, 1, 1, 1,
0.9493379, 0.4487346, 3.736934, 1, 1, 1, 1, 1,
0.9519483, 0.6018798, 1.642069, 1, 1, 1, 1, 1,
0.9525281, 0.8022923, 0.8859375, 1, 1, 1, 1, 1,
0.9641638, 0.779556, 1.221399, 0, 0, 1, 1, 1,
0.9820062, 0.6943936, 0.04822837, 1, 0, 0, 1, 1,
0.9876205, 0.8899407, 1.989998, 1, 0, 0, 1, 1,
0.9896798, 0.9558036, 0.1251853, 1, 0, 0, 1, 1,
0.9925054, 0.3262179, 0.1017539, 1, 0, 0, 1, 1,
0.9938927, -2.181155, 3.882246, 1, 0, 0, 1, 1,
0.9994141, -1.2537, 1.952633, 0, 0, 0, 1, 1,
1.006163, -0.3523743, 1.176203, 0, 0, 0, 1, 1,
1.006221, -0.2842815, 3.07036, 0, 0, 0, 1, 1,
1.007222, -0.08170269, 0.05514404, 0, 0, 0, 1, 1,
1.007888, -0.09736412, 1.654034, 0, 0, 0, 1, 1,
1.009025, 0.7126372, -0.5462034, 0, 0, 0, 1, 1,
1.010295, -0.1780051, 2.086518, 0, 0, 0, 1, 1,
1.015236, -0.1319949, 1.599817, 1, 1, 1, 1, 1,
1.024085, 0.4253946, 2.0215, 1, 1, 1, 1, 1,
1.027805, -0.5133027, 0.5557863, 1, 1, 1, 1, 1,
1.02828, 0.4901353, 2.148903, 1, 1, 1, 1, 1,
1.033601, -0.4551104, 1.741928, 1, 1, 1, 1, 1,
1.03408, 0.6917894, 3.030699, 1, 1, 1, 1, 1,
1.037431, 0.155501, -0.724254, 1, 1, 1, 1, 1,
1.038808, 1.617644, 1.110856, 1, 1, 1, 1, 1,
1.043409, -0.1647795, 2.824828, 1, 1, 1, 1, 1,
1.046746, -1.13606, 1.359089, 1, 1, 1, 1, 1,
1.05958, -0.9988067, 3.09777, 1, 1, 1, 1, 1,
1.065134, 1.31742, 0.5529751, 1, 1, 1, 1, 1,
1.071559, 0.3480463, 1.14428, 1, 1, 1, 1, 1,
1.072865, 0.004766087, 2.077949, 1, 1, 1, 1, 1,
1.075646, 1.135752, -0.134404, 1, 1, 1, 1, 1,
1.07991, -0.04414983, 0.2018867, 0, 0, 1, 1, 1,
1.080695, 0.07595827, 0.7308363, 1, 0, 0, 1, 1,
1.081295, -1.394713, 3.015953, 1, 0, 0, 1, 1,
1.110185, -0.3499262, 1.018384, 1, 0, 0, 1, 1,
1.110415, 0.7011306, 0.2129938, 1, 0, 0, 1, 1,
1.113701, 0.3307742, 1.081197, 1, 0, 0, 1, 1,
1.115809, -0.2736419, 1.102207, 0, 0, 0, 1, 1,
1.13241, 1.008106, 1.108981, 0, 0, 0, 1, 1,
1.140411, -0.6404242, 1.071688, 0, 0, 0, 1, 1,
1.143488, 0.1105814, 2.893331, 0, 0, 0, 1, 1,
1.145567, -0.1208977, 2.477, 0, 0, 0, 1, 1,
1.166378, -1.368468, 3.653672, 0, 0, 0, 1, 1,
1.171366, -1.096239, 1.715547, 0, 0, 0, 1, 1,
1.180665, 1.756221, 0.08625446, 1, 1, 1, 1, 1,
1.185922, 0.9241145, 1.049267, 1, 1, 1, 1, 1,
1.186514, 0.210106, 2.200051, 1, 1, 1, 1, 1,
1.195019, 0.3151818, 0.3449663, 1, 1, 1, 1, 1,
1.205609, -0.7724533, 2.243458, 1, 1, 1, 1, 1,
1.20601, 1.192662, 0.8346891, 1, 1, 1, 1, 1,
1.208547, -0.528202, 1.550888, 1, 1, 1, 1, 1,
1.215876, 0.1140427, 0.8681204, 1, 1, 1, 1, 1,
1.217725, -0.08867707, 1.268303, 1, 1, 1, 1, 1,
1.222991, -0.04622414, 2.142505, 1, 1, 1, 1, 1,
1.248065, -0.676828, 3.510548, 1, 1, 1, 1, 1,
1.250511, -0.4010882, 1.482116, 1, 1, 1, 1, 1,
1.25221, 1.362766, 0.532321, 1, 1, 1, 1, 1,
1.252255, 0.7708777, 1.419768, 1, 1, 1, 1, 1,
1.25431, -2.098736, 1.466831, 1, 1, 1, 1, 1,
1.25514, -0.728633, 2.982692, 0, 0, 1, 1, 1,
1.25533, -1.605081, 2.3324, 1, 0, 0, 1, 1,
1.258903, 1.105901, 1.579509, 1, 0, 0, 1, 1,
1.261222, -0.5470728, 2.581208, 1, 0, 0, 1, 1,
1.2703, -0.9368891, 0.7042051, 1, 0, 0, 1, 1,
1.271041, -0.07200895, 1.14997, 1, 0, 0, 1, 1,
1.282178, -0.008826144, 2.653661, 0, 0, 0, 1, 1,
1.28393, -0.09053674, 1.485254, 0, 0, 0, 1, 1,
1.28645, 0.4250622, 0.2542016, 0, 0, 0, 1, 1,
1.287028, 0.9845856, -0.4980423, 0, 0, 0, 1, 1,
1.292504, 2.481088, 0.2561482, 0, 0, 0, 1, 1,
1.295762, -1.113207, 3.572587, 0, 0, 0, 1, 1,
1.296799, 0.483794, 3.193167, 0, 0, 0, 1, 1,
1.297012, -0.8972762, 3.727812, 1, 1, 1, 1, 1,
1.3094, 0.5065605, 2.411916, 1, 1, 1, 1, 1,
1.312868, -1.278687, 2.254285, 1, 1, 1, 1, 1,
1.322446, -0.1574787, 2.165025, 1, 1, 1, 1, 1,
1.324062, 0.7098122, 2.522649, 1, 1, 1, 1, 1,
1.32599, -1.048471, 2.891393, 1, 1, 1, 1, 1,
1.327849, -2.247813, 2.564551, 1, 1, 1, 1, 1,
1.330574, -0.8160095, 2.684353, 1, 1, 1, 1, 1,
1.33136, 0.7389598, 1.473078, 1, 1, 1, 1, 1,
1.336036, 0.2380338, 1.849611, 1, 1, 1, 1, 1,
1.346346, -0.02820478, 2.061365, 1, 1, 1, 1, 1,
1.348412, 0.2805054, -0.6600809, 1, 1, 1, 1, 1,
1.349514, -0.3242999, 0.8703534, 1, 1, 1, 1, 1,
1.353382, 0.2690741, 2.712056, 1, 1, 1, 1, 1,
1.367028, 2.062599, -1.641208, 1, 1, 1, 1, 1,
1.370743, 0.1049632, 0.2866899, 0, 0, 1, 1, 1,
1.381451, 0.2003867, 1.87016, 1, 0, 0, 1, 1,
1.388785, 0.9156941, 0.7676256, 1, 0, 0, 1, 1,
1.396646, -0.140087, 3.488814, 1, 0, 0, 1, 1,
1.413425, 2.057971, 1.028132, 1, 0, 0, 1, 1,
1.434522, -0.9476851, 3.050254, 1, 0, 0, 1, 1,
1.434834, -0.6026006, -0.49531, 0, 0, 0, 1, 1,
1.436948, -0.365047, 1.777439, 0, 0, 0, 1, 1,
1.441288, 0.07313281, 1.743671, 0, 0, 0, 1, 1,
1.441393, -0.8278008, 2.659454, 0, 0, 0, 1, 1,
1.450697, 0.5284988, 1.659934, 0, 0, 0, 1, 1,
1.451841, -0.3159043, 2.034921, 0, 0, 0, 1, 1,
1.463365, -0.07067801, 1.211148, 0, 0, 0, 1, 1,
1.473776, 1.219338, 1.075509, 1, 1, 1, 1, 1,
1.484343, -0.02817639, 0.4276175, 1, 1, 1, 1, 1,
1.495526, -0.1545842, 2.769958, 1, 1, 1, 1, 1,
1.495781, -1.046533, 1.346565, 1, 1, 1, 1, 1,
1.496225, -0.3146921, 0.2592663, 1, 1, 1, 1, 1,
1.506092, 0.8070654, 0.3198424, 1, 1, 1, 1, 1,
1.516393, -1.23836, 2.116929, 1, 1, 1, 1, 1,
1.531446, 0.5543852, -0.08490638, 1, 1, 1, 1, 1,
1.538134, -0.6067874, 2.645212, 1, 1, 1, 1, 1,
1.538578, -1.034174, 0.6625378, 1, 1, 1, 1, 1,
1.539086, -1.259929, 4.564169, 1, 1, 1, 1, 1,
1.549019, 0.4429191, 1.882208, 1, 1, 1, 1, 1,
1.551187, 0.2369334, 1.803982, 1, 1, 1, 1, 1,
1.561267, -0.459448, 1.308136, 1, 1, 1, 1, 1,
1.565493, 0.8472106, 1.770686, 1, 1, 1, 1, 1,
1.575126, 1.056857, 0.2972619, 0, 0, 1, 1, 1,
1.591245, -1.040337, 2.824201, 1, 0, 0, 1, 1,
1.610742, -0.5128904, 2.112253, 1, 0, 0, 1, 1,
1.611051, 1.428499, 1.896533, 1, 0, 0, 1, 1,
1.615162, 1.649617, 2.368405, 1, 0, 0, 1, 1,
1.64226, 0.00202325, 1.795276, 1, 0, 0, 1, 1,
1.649252, -0.3188442, -0.5293459, 0, 0, 0, 1, 1,
1.66794, -1.110327, 1.908081, 0, 0, 0, 1, 1,
1.684788, 0.4761816, 1.014872, 0, 0, 0, 1, 1,
1.686434, -0.2242129, 1.42931, 0, 0, 0, 1, 1,
1.688711, -0.06621914, 3.198948, 0, 0, 0, 1, 1,
1.69669, 0.1954283, 1.682142, 0, 0, 0, 1, 1,
1.736424, 0.2149113, 2.908208, 0, 0, 0, 1, 1,
1.760551, -0.6048062, 1.098842, 1, 1, 1, 1, 1,
1.771982, 1.555683, 1.369995, 1, 1, 1, 1, 1,
1.801221, 0.1727495, 1.363201, 1, 1, 1, 1, 1,
1.813674, -0.5778844, 3.992811, 1, 1, 1, 1, 1,
1.824877, 1.294991, 0.07875066, 1, 1, 1, 1, 1,
1.825425, 0.05808873, 1.691156, 1, 1, 1, 1, 1,
1.831415, -0.474602, 0.7108256, 1, 1, 1, 1, 1,
1.84547, 1.122345, 1.280244, 1, 1, 1, 1, 1,
1.854819, -2.082763, 2.574317, 1, 1, 1, 1, 1,
1.857556, 1.142609, 2.091102, 1, 1, 1, 1, 1,
1.878927, 0.5342185, 1.591001, 1, 1, 1, 1, 1,
1.87995, 0.4302375, 2.459327, 1, 1, 1, 1, 1,
1.893476, -1.269399, 3.69249, 1, 1, 1, 1, 1,
1.901753, -2.828494, 2.540223, 1, 1, 1, 1, 1,
1.916548, 0.7570626, 1.457161, 1, 1, 1, 1, 1,
1.922781, -0.04395124, 1.816602, 0, 0, 1, 1, 1,
1.940571, 0.9402148, 1.225841, 1, 0, 0, 1, 1,
1.947471, -0.9773956, 2.315711, 1, 0, 0, 1, 1,
1.952658, 0.1123874, 1.651928, 1, 0, 0, 1, 1,
1.986077, -1.414066, -0.2196039, 1, 0, 0, 1, 1,
1.997875, 2.132157, 0.3163723, 1, 0, 0, 1, 1,
2.027543, -0.1648944, 2.111601, 0, 0, 0, 1, 1,
2.056656, -1.327939, 1.308427, 0, 0, 0, 1, 1,
2.075907, -1.866658, 2.397364, 0, 0, 0, 1, 1,
2.078949, 0.4222193, 0.8550965, 0, 0, 0, 1, 1,
2.083488, -0.1073999, 1.217877, 0, 0, 0, 1, 1,
2.148626, -0.3412772, 2.199253, 0, 0, 0, 1, 1,
2.151801, 2.448588, 0.4670679, 0, 0, 0, 1, 1,
2.227093, 1.169005, 2.399925, 1, 1, 1, 1, 1,
2.275975, -0.1764401, 1.691846, 1, 1, 1, 1, 1,
2.401011, 0.4547608, 0.9317449, 1, 1, 1, 1, 1,
2.524646, -1.721475, 2.977196, 1, 1, 1, 1, 1,
2.669163, -0.213849, 1.010652, 1, 1, 1, 1, 1,
2.71736, -1.917613, 1.614849, 1, 1, 1, 1, 1,
3.237305, 0.6243916, 0.4464588, 1, 1, 1, 1, 1
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
var radius = 9.446225;
var distance = 33.17947;
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
mvMatrix.translate( 0.1223285, 0.006125569, 0.4368939 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17947);
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