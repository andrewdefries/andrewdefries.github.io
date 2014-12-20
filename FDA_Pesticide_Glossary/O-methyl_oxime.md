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
-2.77791, 0.8638568, -0.1839942, 1, 0, 0, 1,
-2.586907, -1.106863, -2.129615, 1, 0.007843138, 0, 1,
-2.552792, -0.2273329, -2.491593, 1, 0.01176471, 0, 1,
-2.444704, -0.6010647, -1.923001, 1, 0.01960784, 0, 1,
-2.404929, 0.692381, 0.2740624, 1, 0.02352941, 0, 1,
-2.384236, 1.457355, 0.3439405, 1, 0.03137255, 0, 1,
-2.355838, -0.425735, -0.03566745, 1, 0.03529412, 0, 1,
-2.255829, 2.556947, -1.298122, 1, 0.04313726, 0, 1,
-2.234547, 0.6512311, -0.9650456, 1, 0.04705882, 0, 1,
-2.21693, 0.5916055, -1.440245, 1, 0.05490196, 0, 1,
-2.179225, -1.28112, -2.528479, 1, 0.05882353, 0, 1,
-2.166798, -2.510095, -2.591722, 1, 0.06666667, 0, 1,
-2.139786, -0.7730101, -2.071575, 1, 0.07058824, 0, 1,
-2.080745, -0.03610665, -1.46196, 1, 0.07843138, 0, 1,
-2.053837, -0.4792523, -1.556122, 1, 0.08235294, 0, 1,
-2.048843, -0.09936503, -2.170404, 1, 0.09019608, 0, 1,
-2.045151, 0.07918858, -0.7870189, 1, 0.09411765, 0, 1,
-2.007269, 1.047582, 0.6033701, 1, 0.1019608, 0, 1,
-1.992755, -0.004357811, -1.071182, 1, 0.1098039, 0, 1,
-1.979643, 0.1092271, -1.720879, 1, 0.1137255, 0, 1,
-1.972326, 1.392957, -2.434656, 1, 0.1215686, 0, 1,
-1.96245, -0.3393038, -2.842195, 1, 0.1254902, 0, 1,
-1.961991, -0.957802, -1.834124, 1, 0.1333333, 0, 1,
-1.93168, -0.7707516, -0.9242858, 1, 0.1372549, 0, 1,
-1.901434, -1.791737, -2.70507, 1, 0.145098, 0, 1,
-1.899769, -0.08468165, -1.218642, 1, 0.1490196, 0, 1,
-1.874244, -1.292129, -1.408878, 1, 0.1568628, 0, 1,
-1.860365, 1.687479, -0.1493447, 1, 0.1607843, 0, 1,
-1.856218, 1.20256, -1.03968, 1, 0.1686275, 0, 1,
-1.851739, 0.9926507, -1.170841, 1, 0.172549, 0, 1,
-1.843989, 0.06904152, -2.046697, 1, 0.1803922, 0, 1,
-1.835135, -0.4078069, -1.816936, 1, 0.1843137, 0, 1,
-1.821978, -0.6224715, -3.512384, 1, 0.1921569, 0, 1,
-1.818422, 0.9875306, -2.028084, 1, 0.1960784, 0, 1,
-1.81628, -0.5434217, -2.034647, 1, 0.2039216, 0, 1,
-1.81114, 0.7285756, -2.286193, 1, 0.2117647, 0, 1,
-1.797732, 0.3275753, 0.02480368, 1, 0.2156863, 0, 1,
-1.789539, 0.5996076, -2.850548, 1, 0.2235294, 0, 1,
-1.781508, 0.05605134, -2.742674, 1, 0.227451, 0, 1,
-1.756445, -1.038975, -2.889423, 1, 0.2352941, 0, 1,
-1.755885, 1.285861, -0.3704605, 1, 0.2392157, 0, 1,
-1.750585, 0.8151522, -2.414022, 1, 0.2470588, 0, 1,
-1.741211, 0.2316297, -1.625055, 1, 0.2509804, 0, 1,
-1.740962, 0.3314155, -2.826797, 1, 0.2588235, 0, 1,
-1.738113, -1.701752, -0.7452809, 1, 0.2627451, 0, 1,
-1.722109, 0.4328219, -0.9546239, 1, 0.2705882, 0, 1,
-1.717986, 0.5461707, 0.06247487, 1, 0.2745098, 0, 1,
-1.701544, -0.1342114, -1.797376, 1, 0.282353, 0, 1,
-1.697248, -1.906159, -1.677447, 1, 0.2862745, 0, 1,
-1.689826, 0.7474416, 0.02643955, 1, 0.2941177, 0, 1,
-1.684991, 0.08334855, -2.188566, 1, 0.3019608, 0, 1,
-1.640664, 1.211892, -0.1513924, 1, 0.3058824, 0, 1,
-1.639165, -0.2866454, -2.484786, 1, 0.3137255, 0, 1,
-1.638287, 0.4356901, -1.617119, 1, 0.3176471, 0, 1,
-1.607215, 1.930735, -0.8332474, 1, 0.3254902, 0, 1,
-1.593918, 0.09053344, -0.8726352, 1, 0.3294118, 0, 1,
-1.589797, 0.1222747, -1.377699, 1, 0.3372549, 0, 1,
-1.583787, -0.7317593, -2.614826, 1, 0.3411765, 0, 1,
-1.58028, 0.6946609, -1.548572, 1, 0.3490196, 0, 1,
-1.573782, 0.4366851, -0.5564805, 1, 0.3529412, 0, 1,
-1.563855, -1.810997, -1.732779, 1, 0.3607843, 0, 1,
-1.561291, -0.539516, 0.05485848, 1, 0.3647059, 0, 1,
-1.546936, 0.6314965, -1.267509, 1, 0.372549, 0, 1,
-1.521277, -1.991171, -3.214026, 1, 0.3764706, 0, 1,
-1.510702, -1.740515, -2.805451, 1, 0.3843137, 0, 1,
-1.507403, 0.8875856, -1.283395, 1, 0.3882353, 0, 1,
-1.506705, 0.2513742, -1.586404, 1, 0.3960784, 0, 1,
-1.500519, 0.3235801, -1.569849, 1, 0.4039216, 0, 1,
-1.490967, -0.2301201, -2.282641, 1, 0.4078431, 0, 1,
-1.490275, 1.251344, 0.5256495, 1, 0.4156863, 0, 1,
-1.482785, 0.0931922, -2.997519, 1, 0.4196078, 0, 1,
-1.471283, 0.1424314, -0.2528667, 1, 0.427451, 0, 1,
-1.463972, 0.6974267, 1.084957, 1, 0.4313726, 0, 1,
-1.460807, 0.3951132, -0.9339814, 1, 0.4392157, 0, 1,
-1.459327, -0.306459, -1.796818, 1, 0.4431373, 0, 1,
-1.458999, -0.8102481, -1.362887, 1, 0.4509804, 0, 1,
-1.451209, -0.0952567, -1.823833, 1, 0.454902, 0, 1,
-1.442722, 0.6898479, -1.015552, 1, 0.4627451, 0, 1,
-1.44209, -1.385074, -1.766674, 1, 0.4666667, 0, 1,
-1.433729, -1.0386, -6.815134, 1, 0.4745098, 0, 1,
-1.431674, 0.6033222, -0.06324705, 1, 0.4784314, 0, 1,
-1.41505, -0.7771668, -1.928726, 1, 0.4862745, 0, 1,
-1.414001, 2.092385, -0.6035602, 1, 0.4901961, 0, 1,
-1.412301, 0.3679182, -2.222156, 1, 0.4980392, 0, 1,
-1.412286, 1.11365, 0.5337066, 1, 0.5058824, 0, 1,
-1.39333, 1.054085, -1.271685, 1, 0.509804, 0, 1,
-1.391159, 0.05266351, 0.08937597, 1, 0.5176471, 0, 1,
-1.389163, -1.440933, -3.705138, 1, 0.5215687, 0, 1,
-1.378437, 0.3631759, -3.993463, 1, 0.5294118, 0, 1,
-1.368636, 0.2003647, -1.489823, 1, 0.5333334, 0, 1,
-1.366919, 0.04300988, -0.8166335, 1, 0.5411765, 0, 1,
-1.364406, -0.5719862, -0.9650133, 1, 0.5450981, 0, 1,
-1.340801, -0.4680612, -2.37672, 1, 0.5529412, 0, 1,
-1.333843, 0.02226837, -2.679599, 1, 0.5568628, 0, 1,
-1.332437, -2.007327, -2.46139, 1, 0.5647059, 0, 1,
-1.331717, 1.723925, -0.8927767, 1, 0.5686275, 0, 1,
-1.329282, -1.045089, -2.257528, 1, 0.5764706, 0, 1,
-1.32783, 0.952786, -1.189955, 1, 0.5803922, 0, 1,
-1.314961, -0.3291035, -2.387463, 1, 0.5882353, 0, 1,
-1.309407, -0.7888955, -0.5423639, 1, 0.5921569, 0, 1,
-1.300309, 0.9429386, -1.687988, 1, 0.6, 0, 1,
-1.298945, -0.2086609, -1.809416, 1, 0.6078432, 0, 1,
-1.298242, -0.5838367, -2.901083, 1, 0.6117647, 0, 1,
-1.298185, -2.461497, -1.443875, 1, 0.6196079, 0, 1,
-1.257372, -2.650027, -1.88306, 1, 0.6235294, 0, 1,
-1.25354, -0.2251026, -0.7257649, 1, 0.6313726, 0, 1,
-1.253346, 0.5004126, -1.872231, 1, 0.6352941, 0, 1,
-1.249381, -0.274912, -1.328626, 1, 0.6431373, 0, 1,
-1.234822, 1.055268, -1.087773, 1, 0.6470588, 0, 1,
-1.233722, -0.6227272, -1.810207, 1, 0.654902, 0, 1,
-1.233061, -0.6665359, -2.023318, 1, 0.6588235, 0, 1,
-1.228703, 0.4597697, -2.125866, 1, 0.6666667, 0, 1,
-1.221768, -0.5301694, 0.2761063, 1, 0.6705883, 0, 1,
-1.221728, 0.6191958, -2.364897, 1, 0.6784314, 0, 1,
-1.214624, 0.4092593, -3.255981, 1, 0.682353, 0, 1,
-1.211957, 1.444283, -1.363807, 1, 0.6901961, 0, 1,
-1.211365, 1.543354, -0.7476884, 1, 0.6941177, 0, 1,
-1.197618, -0.5535488, -2.01368, 1, 0.7019608, 0, 1,
-1.185404, 1.426585, 0.06809651, 1, 0.7098039, 0, 1,
-1.184866, -0.9185, -1.839709, 1, 0.7137255, 0, 1,
-1.184428, 0.05395432, -2.965441, 1, 0.7215686, 0, 1,
-1.183413, -0.4378435, -4.34174, 1, 0.7254902, 0, 1,
-1.177011, -0.7451862, -1.142571, 1, 0.7333333, 0, 1,
-1.173762, 0.3381426, -1.389472, 1, 0.7372549, 0, 1,
-1.173049, 1.074402, 0.484414, 1, 0.7450981, 0, 1,
-1.171884, 0.6287202, -0.8661715, 1, 0.7490196, 0, 1,
-1.16997, -0.531316, -2.73578, 1, 0.7568628, 0, 1,
-1.1678, 0.7221099, -3.028591, 1, 0.7607843, 0, 1,
-1.163569, -0.7979243, -1.369644, 1, 0.7686275, 0, 1,
-1.150059, 1.645358, -2.46041, 1, 0.772549, 0, 1,
-1.148778, 0.05638631, -1.163453, 1, 0.7803922, 0, 1,
-1.144696, -0.4240279, -0.9387634, 1, 0.7843137, 0, 1,
-1.143127, -0.1579102, -1.82145, 1, 0.7921569, 0, 1,
-1.122404, -0.6561775, -2.941403, 1, 0.7960784, 0, 1,
-1.108185, 0.1018549, -2.100037, 1, 0.8039216, 0, 1,
-1.104781, 0.1433029, 0.346382, 1, 0.8117647, 0, 1,
-1.102189, -0.8212186, -2.957573, 1, 0.8156863, 0, 1,
-1.094483, -0.09549906, -0.8384855, 1, 0.8235294, 0, 1,
-1.09343, -0.3799191, -0.7480394, 1, 0.827451, 0, 1,
-1.093189, -1.400544, -3.324033, 1, 0.8352941, 0, 1,
-1.081604, 0.2725668, -2.693494, 1, 0.8392157, 0, 1,
-1.080456, 1.135612, -0.1438359, 1, 0.8470588, 0, 1,
-1.072949, -0.3575517, -0.9252506, 1, 0.8509804, 0, 1,
-1.063466, -0.03286472, -1.62937, 1, 0.8588235, 0, 1,
-1.056869, 0.6812111, -1.657634, 1, 0.8627451, 0, 1,
-1.044209, -1.86119, -0.1330925, 1, 0.8705882, 0, 1,
-1.034915, -0.5355383, 0.3940183, 1, 0.8745098, 0, 1,
-1.034265, -1.081763, -2.127551, 1, 0.8823529, 0, 1,
-1.033954, 0.07577397, -1.305046, 1, 0.8862745, 0, 1,
-1.032663, -1.052706, -1.663698, 1, 0.8941177, 0, 1,
-1.03128, -0.259894, 0.3859343, 1, 0.8980392, 0, 1,
-1.029234, 0.2572529, -1.712132, 1, 0.9058824, 0, 1,
-1.026326, 0.7779573, 0.6369862, 1, 0.9137255, 0, 1,
-1.02492, 0.9581454, -2.771207, 1, 0.9176471, 0, 1,
-1.017871, 0.1766263, -0.5107995, 1, 0.9254902, 0, 1,
-1.014623, 1.934878, -1.169701, 1, 0.9294118, 0, 1,
-1.013048, -1.078321, -3.804165, 1, 0.9372549, 0, 1,
-1.011171, -0.6778963, -2.815549, 1, 0.9411765, 0, 1,
-1.010964, -0.4806478, -2.516222, 1, 0.9490196, 0, 1,
-1.004679, -0.5009981, -2.020495, 1, 0.9529412, 0, 1,
-1.003101, 0.2596874, -1.818908, 1, 0.9607843, 0, 1,
-1.002665, 0.9031558, -1.627609, 1, 0.9647059, 0, 1,
-1.00265, 0.6746282, -0.8207045, 1, 0.972549, 0, 1,
-0.9985352, -0.04731364, -1.834525, 1, 0.9764706, 0, 1,
-0.9898456, 0.3834403, -0.915844, 1, 0.9843137, 0, 1,
-0.9896424, -0.1105444, -1.454773, 1, 0.9882353, 0, 1,
-0.9847239, 1.422149, -1.05861, 1, 0.9960784, 0, 1,
-0.9827692, -0.9632436, -1.707666, 0.9960784, 1, 0, 1,
-0.9790661, 0.5867363, -1.980033, 0.9921569, 1, 0, 1,
-0.9724924, -0.9934939, -2.888332, 0.9843137, 1, 0, 1,
-0.9697171, 0.1834226, -2.335507, 0.9803922, 1, 0, 1,
-0.9682256, -1.275782, -1.456851, 0.972549, 1, 0, 1,
-0.9668171, 0.06493482, -1.831265, 0.9686275, 1, 0, 1,
-0.9666723, 1.379185, -1.603239, 0.9607843, 1, 0, 1,
-0.9573467, 1.344997, 0.5311357, 0.9568627, 1, 0, 1,
-0.9539988, 0.8287516, -0.2911536, 0.9490196, 1, 0, 1,
-0.9412482, -0.01249906, -0.9408157, 0.945098, 1, 0, 1,
-0.9412458, -0.05413974, -2.279113, 0.9372549, 1, 0, 1,
-0.9402815, 0.4445867, -2.405818, 0.9333333, 1, 0, 1,
-0.9394578, -0.01282014, 0.3855419, 0.9254902, 1, 0, 1,
-0.9351321, -0.1074497, -2.686059, 0.9215686, 1, 0, 1,
-0.9342721, -0.8239729, -0.7131, 0.9137255, 1, 0, 1,
-0.9314456, 0.2818383, 0.1221124, 0.9098039, 1, 0, 1,
-0.9299704, 0.3864512, -0.1842288, 0.9019608, 1, 0, 1,
-0.9268037, 0.5650809, -1.686896, 0.8941177, 1, 0, 1,
-0.9232993, 1.288062, -0.3165367, 0.8901961, 1, 0, 1,
-0.917699, -1.43375, -4.000498, 0.8823529, 1, 0, 1,
-0.9153691, 1.846259, -2.544377, 0.8784314, 1, 0, 1,
-0.9101903, 0.1228098, -0.7143679, 0.8705882, 1, 0, 1,
-0.9057447, -1.297487, -3.177878, 0.8666667, 1, 0, 1,
-0.9003922, -0.6617655, -2.591559, 0.8588235, 1, 0, 1,
-0.8991969, 0.2497459, -0.1411174, 0.854902, 1, 0, 1,
-0.8981233, 0.1352869, -1.183036, 0.8470588, 1, 0, 1,
-0.897995, -0.1280288, -2.577312, 0.8431373, 1, 0, 1,
-0.8853219, 1.874377, -0.7860441, 0.8352941, 1, 0, 1,
-0.8824998, -1.320634, -2.824548, 0.8313726, 1, 0, 1,
-0.881501, 0.9607944, -2.020308, 0.8235294, 1, 0, 1,
-0.8806856, 1.550899, -0.7831743, 0.8196079, 1, 0, 1,
-0.8773239, -1.960178, -2.863679, 0.8117647, 1, 0, 1,
-0.8627822, -0.9237922, -1.75265, 0.8078431, 1, 0, 1,
-0.8592664, 1.846842, -1.218121, 0.8, 1, 0, 1,
-0.8492406, 1.632677, -1.773492, 0.7921569, 1, 0, 1,
-0.8482024, -0.9380388, -2.48456, 0.7882353, 1, 0, 1,
-0.8481974, -0.2203484, -1.84101, 0.7803922, 1, 0, 1,
-0.8464379, 0.4239187, -0.3983525, 0.7764706, 1, 0, 1,
-0.8428377, -0.1545353, -0.1175413, 0.7686275, 1, 0, 1,
-0.8413401, -1.679254, -1.904314, 0.7647059, 1, 0, 1,
-0.8354648, 0.9497374, -2.094978, 0.7568628, 1, 0, 1,
-0.8350198, -0.03286651, -0.7431313, 0.7529412, 1, 0, 1,
-0.8344131, -1.415545, -2.402378, 0.7450981, 1, 0, 1,
-0.8339676, 1.496062, -0.7944498, 0.7411765, 1, 0, 1,
-0.833331, -0.2649529, -0.1391039, 0.7333333, 1, 0, 1,
-0.8292221, -1.468934, -2.679942, 0.7294118, 1, 0, 1,
-0.8268353, 1.061243, 1.515002, 0.7215686, 1, 0, 1,
-0.8242355, -0.4550912, 0.1318429, 0.7176471, 1, 0, 1,
-0.8126334, 0.4568922, -0.9130216, 0.7098039, 1, 0, 1,
-0.8105569, 0.6912414, -0.03682037, 0.7058824, 1, 0, 1,
-0.8082157, -0.5951458, -2.5871, 0.6980392, 1, 0, 1,
-0.8064384, -0.4999579, -2.8623, 0.6901961, 1, 0, 1,
-0.8060049, 0.4751793, -2.352813, 0.6862745, 1, 0, 1,
-0.8058307, -3.038087, -3.31465, 0.6784314, 1, 0, 1,
-0.8057359, 1.397484, -0.422037, 0.6745098, 1, 0, 1,
-0.8045407, -0.7640692, -1.018451, 0.6666667, 1, 0, 1,
-0.8025715, 1.94465, -1.113672, 0.6627451, 1, 0, 1,
-0.8006337, 1.591771, -0.441927, 0.654902, 1, 0, 1,
-0.7981744, 2.006895, 2.820148, 0.6509804, 1, 0, 1,
-0.7946253, -0.4434016, -3.207623, 0.6431373, 1, 0, 1,
-0.794411, 0.1549802, -1.202664, 0.6392157, 1, 0, 1,
-0.7943683, -0.3288784, -2.137309, 0.6313726, 1, 0, 1,
-0.7920921, -0.3255559, -2.473258, 0.627451, 1, 0, 1,
-0.7792802, -0.4768977, -2.646535, 0.6196079, 1, 0, 1,
-0.7763001, -0.2256901, -1.675101, 0.6156863, 1, 0, 1,
-0.7749873, 0.4634135, -1.3569, 0.6078432, 1, 0, 1,
-0.7737731, 0.1351156, -3.016407, 0.6039216, 1, 0, 1,
-0.7728977, 0.5645922, -1.035502, 0.5960785, 1, 0, 1,
-0.7718222, -1.362657, -2.447698, 0.5882353, 1, 0, 1,
-0.7638249, 0.7235924, 0.3736713, 0.5843138, 1, 0, 1,
-0.7620583, -0.7271188, -1.762086, 0.5764706, 1, 0, 1,
-0.7474415, -0.1628098, -2.705898, 0.572549, 1, 0, 1,
-0.7460178, 0.2461078, -0.03549774, 0.5647059, 1, 0, 1,
-0.7405406, -0.4159282, -2.166912, 0.5607843, 1, 0, 1,
-0.737568, 2.117674, -1.283548, 0.5529412, 1, 0, 1,
-0.7350562, -0.7952156, -2.102653, 0.5490196, 1, 0, 1,
-0.7337888, -1.361337, -1.806764, 0.5411765, 1, 0, 1,
-0.7322915, 0.9999672, 0.3442688, 0.5372549, 1, 0, 1,
-0.731928, -0.2664209, -1.173733, 0.5294118, 1, 0, 1,
-0.7242956, -1.131296, -1.693882, 0.5254902, 1, 0, 1,
-0.7139063, 0.4436138, -0.4686284, 0.5176471, 1, 0, 1,
-0.7113144, -1.523287, -2.419352, 0.5137255, 1, 0, 1,
-0.7063552, -0.5386796, -2.998267, 0.5058824, 1, 0, 1,
-0.7058445, -1.320422, -1.996994, 0.5019608, 1, 0, 1,
-0.704009, 0.03930278, -2.16593, 0.4941176, 1, 0, 1,
-0.7022781, -0.6625868, -2.222282, 0.4862745, 1, 0, 1,
-0.6968331, 0.2770658, -0.3915089, 0.4823529, 1, 0, 1,
-0.6963452, 0.5659596, -0.504983, 0.4745098, 1, 0, 1,
-0.690262, 0.9204913, -0.2275646, 0.4705882, 1, 0, 1,
-0.689981, 0.01909014, -1.354009, 0.4627451, 1, 0, 1,
-0.6854538, -1.560824, -2.911617, 0.4588235, 1, 0, 1,
-0.6830771, 0.047978, -1.514441, 0.4509804, 1, 0, 1,
-0.677893, -0.758711, -3.334095, 0.4470588, 1, 0, 1,
-0.6764841, 1.024031, -1.060563, 0.4392157, 1, 0, 1,
-0.6715929, -0.1518901, -2.368379, 0.4352941, 1, 0, 1,
-0.6634516, 0.6754918, -1.096003, 0.427451, 1, 0, 1,
-0.6566991, -0.8333946, -1.331028, 0.4235294, 1, 0, 1,
-0.6550159, -0.9024962, -4.0822, 0.4156863, 1, 0, 1,
-0.6538799, -0.3248618, -3.654374, 0.4117647, 1, 0, 1,
-0.6519824, 1.78641, 0.08875851, 0.4039216, 1, 0, 1,
-0.6504254, 0.8401883, -2.29877, 0.3960784, 1, 0, 1,
-0.650356, -1.346985, -2.049404, 0.3921569, 1, 0, 1,
-0.6479499, 2.213585, -0.08312561, 0.3843137, 1, 0, 1,
-0.6394516, -0.6443785, -1.825614, 0.3803922, 1, 0, 1,
-0.637589, 0.1436161, -2.179917, 0.372549, 1, 0, 1,
-0.6292046, 0.0597901, 0.5308978, 0.3686275, 1, 0, 1,
-0.6289485, -0.9767745, -4.852594, 0.3607843, 1, 0, 1,
-0.6261498, -1.120282, -2.323171, 0.3568628, 1, 0, 1,
-0.624613, -0.8738471, -2.572273, 0.3490196, 1, 0, 1,
-0.6241715, 1.683263, -1.424857, 0.345098, 1, 0, 1,
-0.6226789, 0.1519596, -1.57318, 0.3372549, 1, 0, 1,
-0.6200266, 0.3424421, -1.383305, 0.3333333, 1, 0, 1,
-0.6085089, -1.098142, -3.393775, 0.3254902, 1, 0, 1,
-0.6074086, -0.5765814, -3.142212, 0.3215686, 1, 0, 1,
-0.6050673, -0.7506577, -3.084129, 0.3137255, 1, 0, 1,
-0.602716, 1.341111, -0.6760095, 0.3098039, 1, 0, 1,
-0.5978597, 1.7329, -0.6479679, 0.3019608, 1, 0, 1,
-0.596784, -0.2501719, -1.899986, 0.2941177, 1, 0, 1,
-0.5940654, 0.5974402, -1.629839, 0.2901961, 1, 0, 1,
-0.5925454, -0.3054579, -1.599504, 0.282353, 1, 0, 1,
-0.5891705, -0.5789263, -0.8415542, 0.2784314, 1, 0, 1,
-0.5887433, 1.30846, -0.8490573, 0.2705882, 1, 0, 1,
-0.5808688, 0.2070026, -1.864714, 0.2666667, 1, 0, 1,
-0.5800415, -0.1056889, -1.27949, 0.2588235, 1, 0, 1,
-0.5796008, -1.104529, -2.433965, 0.254902, 1, 0, 1,
-0.5766916, -0.4803976, -1.334378, 0.2470588, 1, 0, 1,
-0.5744454, 1.514618, 0.5670863, 0.2431373, 1, 0, 1,
-0.5662069, 0.1787058, -0.7121624, 0.2352941, 1, 0, 1,
-0.566159, 0.6163321, -0.2185805, 0.2313726, 1, 0, 1,
-0.5643498, 0.4535153, -0.05218982, 0.2235294, 1, 0, 1,
-0.5541072, 0.6204792, -0.2974555, 0.2196078, 1, 0, 1,
-0.5453415, -0.7892251, -2.377623, 0.2117647, 1, 0, 1,
-0.5385205, -1.946913, -1.578388, 0.2078431, 1, 0, 1,
-0.5369994, 0.380782, 0.2842875, 0.2, 1, 0, 1,
-0.5340725, -1.098755, -3.794124, 0.1921569, 1, 0, 1,
-0.5301888, -3.398242, -4.316617, 0.1882353, 1, 0, 1,
-0.5195956, -0.1806403, -0.03500373, 0.1803922, 1, 0, 1,
-0.5172768, 2.025441, -0.2040804, 0.1764706, 1, 0, 1,
-0.5109515, -1.086493, -3.005059, 0.1686275, 1, 0, 1,
-0.5062923, 0.4538259, -1.275708, 0.1647059, 1, 0, 1,
-0.5051559, 0.03737353, -0.1935031, 0.1568628, 1, 0, 1,
-0.5040138, 0.7514559, -0.5292264, 0.1529412, 1, 0, 1,
-0.5033147, -0.142871, -3.804351, 0.145098, 1, 0, 1,
-0.5006171, 1.41064, -0.8244739, 0.1411765, 1, 0, 1,
-0.4991673, 0.9167416, -0.6772545, 0.1333333, 1, 0, 1,
-0.4987275, 1.392365, -0.2661188, 0.1294118, 1, 0, 1,
-0.4979227, 0.8219339, 0.5682713, 0.1215686, 1, 0, 1,
-0.494527, -0.9646189, -2.855803, 0.1176471, 1, 0, 1,
-0.4940329, 0.4008743, -0.6185327, 0.1098039, 1, 0, 1,
-0.4932075, 0.729772, -0.203926, 0.1058824, 1, 0, 1,
-0.4893827, 2.995617, 0.6442651, 0.09803922, 1, 0, 1,
-0.4891604, -2.269487, -4.067669, 0.09019608, 1, 0, 1,
-0.4889479, -0.04219298, -1.157409, 0.08627451, 1, 0, 1,
-0.4864888, -2.230548, -3.424805, 0.07843138, 1, 0, 1,
-0.4849602, -0.9554634, -3.240378, 0.07450981, 1, 0, 1,
-0.4783191, -1.029171, -1.608492, 0.06666667, 1, 0, 1,
-0.4775613, -1.648188, -3.45447, 0.0627451, 1, 0, 1,
-0.4767405, -0.9316482, -2.210098, 0.05490196, 1, 0, 1,
-0.4762274, 0.3035736, -1.550098, 0.05098039, 1, 0, 1,
-0.4753039, 0.2133047, -2.62681, 0.04313726, 1, 0, 1,
-0.4741952, -1.42437, -2.139246, 0.03921569, 1, 0, 1,
-0.4658778, 0.3026538, -1.452936, 0.03137255, 1, 0, 1,
-0.463346, 0.3354988, -0.9002938, 0.02745098, 1, 0, 1,
-0.4632964, 0.2289237, -1.261045, 0.01960784, 1, 0, 1,
-0.4615903, -1.136849, -3.634888, 0.01568628, 1, 0, 1,
-0.4574695, -0.4498316, -2.761125, 0.007843138, 1, 0, 1,
-0.4523552, 0.1457888, -0.5689536, 0.003921569, 1, 0, 1,
-0.4503134, 1.629598, 0.617074, 0, 1, 0.003921569, 1,
-0.4492897, 1.063576, -0.3861087, 0, 1, 0.01176471, 1,
-0.4458102, 0.144052, -1.247661, 0, 1, 0.01568628, 1,
-0.4448882, 0.4744417, -0.538365, 0, 1, 0.02352941, 1,
-0.4445818, 1.137671, 0.4118772, 0, 1, 0.02745098, 1,
-0.4427451, -0.9832155, -2.061045, 0, 1, 0.03529412, 1,
-0.4421947, 0.5305711, -0.2797706, 0, 1, 0.03921569, 1,
-0.4414175, -1.994045, -5.370842, 0, 1, 0.04705882, 1,
-0.4368178, -0.2558682, -2.914769, 0, 1, 0.05098039, 1,
-0.4298802, -1.997857, -2.498432, 0, 1, 0.05882353, 1,
-0.4258636, 0.4524387, -0.5850009, 0, 1, 0.0627451, 1,
-0.4247804, 1.18492, 2.431763, 0, 1, 0.07058824, 1,
-0.4227971, 0.7816058, -0.9874485, 0, 1, 0.07450981, 1,
-0.4218421, -0.6775244, -2.251729, 0, 1, 0.08235294, 1,
-0.4080544, 0.718622, -0.3124337, 0, 1, 0.08627451, 1,
-0.4073839, -1.921648, -1.258534, 0, 1, 0.09411765, 1,
-0.406517, 2.541265, -2.454886, 0, 1, 0.1019608, 1,
-0.4052805, -0.7696891, -1.609871, 0, 1, 0.1058824, 1,
-0.4048587, -0.2617397, -3.477373, 0, 1, 0.1137255, 1,
-0.3994265, 2.653299, 0.578787, 0, 1, 0.1176471, 1,
-0.3983942, -0.03616666, -0.6402, 0, 1, 0.1254902, 1,
-0.3955154, 0.4811718, 0.9413884, 0, 1, 0.1294118, 1,
-0.3944073, 1.478869, -0.9100955, 0, 1, 0.1372549, 1,
-0.3924832, 0.9255803, -1.331754, 0, 1, 0.1411765, 1,
-0.3909984, 0.42439, -1.474373, 0, 1, 0.1490196, 1,
-0.3883782, 2.532604, 1.342095, 0, 1, 0.1529412, 1,
-0.383, 0.09531064, -2.093825, 0, 1, 0.1607843, 1,
-0.3786306, 0.511066, -1.824062, 0, 1, 0.1647059, 1,
-0.3697713, -0.06979066, -1.458514, 0, 1, 0.172549, 1,
-0.3688523, -0.2820494, -2.351334, 0, 1, 0.1764706, 1,
-0.3672832, 0.4336715, -1.789879, 0, 1, 0.1843137, 1,
-0.3620127, 0.9025885, -0.5839123, 0, 1, 0.1882353, 1,
-0.3556193, -1.287823, -1.653456, 0, 1, 0.1960784, 1,
-0.3547497, -0.8201368, -5.041109, 0, 1, 0.2039216, 1,
-0.3515454, 1.661959, -0.7301015, 0, 1, 0.2078431, 1,
-0.3510793, 1.726348, 0.1424738, 0, 1, 0.2156863, 1,
-0.3498861, 0.7387672, -1.718896, 0, 1, 0.2196078, 1,
-0.3497669, 2.051829, -0.5309711, 0, 1, 0.227451, 1,
-0.3456345, -0.541893, -4.76231, 0, 1, 0.2313726, 1,
-0.3361931, -1.599019, -2.879749, 0, 1, 0.2392157, 1,
-0.3338429, 0.2241601, -0.1226866, 0, 1, 0.2431373, 1,
-0.3325759, -1.625626, -3.380319, 0, 1, 0.2509804, 1,
-0.3267335, 0.001522359, -2.724406, 0, 1, 0.254902, 1,
-0.3190985, 0.3127304, -0.8347593, 0, 1, 0.2627451, 1,
-0.3171058, -0.2582003, -2.04021, 0, 1, 0.2666667, 1,
-0.3167461, -2.316194, -2.145182, 0, 1, 0.2745098, 1,
-0.3127188, 0.5077586, 0.3157417, 0, 1, 0.2784314, 1,
-0.3087151, -0.2514535, -3.212388, 0, 1, 0.2862745, 1,
-0.3066608, 0.59875, 0.4559231, 0, 1, 0.2901961, 1,
-0.3043036, 0.06109274, -1.501825, 0, 1, 0.2980392, 1,
-0.3034604, 0.6359092, -0.3946216, 0, 1, 0.3058824, 1,
-0.3030293, 1.093074, 1.232828, 0, 1, 0.3098039, 1,
-0.2940706, 0.7081854, 0.04842807, 0, 1, 0.3176471, 1,
-0.293714, -0.8749679, -2.705472, 0, 1, 0.3215686, 1,
-0.2935708, 0.6201777, -0.2369315, 0, 1, 0.3294118, 1,
-0.2926441, -1.42872, -2.966466, 0, 1, 0.3333333, 1,
-0.2884566, -0.2784439, -3.251303, 0, 1, 0.3411765, 1,
-0.2833564, -0.3937956, -2.276584, 0, 1, 0.345098, 1,
-0.2819476, 0.98987, 0.607875, 0, 1, 0.3529412, 1,
-0.2781043, -1.862558, -1.687883, 0, 1, 0.3568628, 1,
-0.2780541, -0.6159809, -2.96888, 0, 1, 0.3647059, 1,
-0.2713057, 0.6428533, -0.3935888, 0, 1, 0.3686275, 1,
-0.2710979, -0.6813228, -2.939347, 0, 1, 0.3764706, 1,
-0.2680816, -1.142339, -4.400265, 0, 1, 0.3803922, 1,
-0.263681, 1.197612, 0.2076637, 0, 1, 0.3882353, 1,
-0.2631862, -0.7406371, -2.872341, 0, 1, 0.3921569, 1,
-0.2626518, -0.2860781, -1.913642, 0, 1, 0.4, 1,
-0.2552648, 0.4401958, -0.8977358, 0, 1, 0.4078431, 1,
-0.2537167, 1.072963, 0.5706295, 0, 1, 0.4117647, 1,
-0.2526315, -0.416155, -4.053322, 0, 1, 0.4196078, 1,
-0.2415175, -0.5808675, -3.694909, 0, 1, 0.4235294, 1,
-0.2400527, -0.3879628, -1.861824, 0, 1, 0.4313726, 1,
-0.2373753, 0.6224343, -0.8458888, 0, 1, 0.4352941, 1,
-0.2363248, 1.256749, 0.7426703, 0, 1, 0.4431373, 1,
-0.2325391, -0.216292, -4.04657, 0, 1, 0.4470588, 1,
-0.2315858, -0.8839159, -1.146471, 0, 1, 0.454902, 1,
-0.2268081, -0.1624743, -3.536453, 0, 1, 0.4588235, 1,
-0.2267879, 0.9988934, -0.4268663, 0, 1, 0.4666667, 1,
-0.221875, -0.2356563, -0.9060945, 0, 1, 0.4705882, 1,
-0.2162651, 1.508382, -0.409261, 0, 1, 0.4784314, 1,
-0.2116617, 1.215704, 0.5188596, 0, 1, 0.4823529, 1,
-0.2113708, 2.011878, 0.5305684, 0, 1, 0.4901961, 1,
-0.2090001, 0.6830727, -0.8722118, 0, 1, 0.4941176, 1,
-0.2082884, -0.04747514, -1.531461, 0, 1, 0.5019608, 1,
-0.2043266, 0.4373968, 0.6216567, 0, 1, 0.509804, 1,
-0.1934418, 0.8452396, -0.5973654, 0, 1, 0.5137255, 1,
-0.1923922, -0.4455979, -1.937438, 0, 1, 0.5215687, 1,
-0.1864276, 1.578126, -1.159472, 0, 1, 0.5254902, 1,
-0.186117, -0.5049088, -1.69405, 0, 1, 0.5333334, 1,
-0.1847421, 0.8816789, -1.7586, 0, 1, 0.5372549, 1,
-0.1763239, -0.4888253, -1.619615, 0, 1, 0.5450981, 1,
-0.1761627, 1.180565, -0.3469594, 0, 1, 0.5490196, 1,
-0.1743789, 1.722141, -1.574879, 0, 1, 0.5568628, 1,
-0.1698116, -0.08010568, -2.494427, 0, 1, 0.5607843, 1,
-0.1692025, 0.1589831, -1.378114, 0, 1, 0.5686275, 1,
-0.1688828, -1.451514, -3.352766, 0, 1, 0.572549, 1,
-0.163804, -1.289122, -2.252406, 0, 1, 0.5803922, 1,
-0.161489, 0.1346736, -0.4706385, 0, 1, 0.5843138, 1,
-0.1585421, 0.739971, -0.8860229, 0, 1, 0.5921569, 1,
-0.1525867, -0.1394602, -2.09082, 0, 1, 0.5960785, 1,
-0.1500682, 0.6368512, -1.101754, 0, 1, 0.6039216, 1,
-0.1500596, 0.9553553, -0.004886258, 0, 1, 0.6117647, 1,
-0.1500203, -1.085671, -1.960142, 0, 1, 0.6156863, 1,
-0.146179, 1.47366, -1.085271, 0, 1, 0.6235294, 1,
-0.1447208, 2.736717, -0.7103329, 0, 1, 0.627451, 1,
-0.1343505, -0.9395028, -3.868951, 0, 1, 0.6352941, 1,
-0.1339312, -0.4430116, -1.923851, 0, 1, 0.6392157, 1,
-0.1325272, 0.3139883, -0.3526444, 0, 1, 0.6470588, 1,
-0.1278221, -0.3982969, -2.10471, 0, 1, 0.6509804, 1,
-0.1240504, 0.1361268, -2.951962, 0, 1, 0.6588235, 1,
-0.1176849, 0.9357483, 0.1743391, 0, 1, 0.6627451, 1,
-0.1156634, -0.7880431, -4.384315, 0, 1, 0.6705883, 1,
-0.1132698, -0.02574868, -1.302721, 0, 1, 0.6745098, 1,
-0.1125047, 0.6136042, 0.7940412, 0, 1, 0.682353, 1,
-0.1123226, -0.7453173, -4.822301, 0, 1, 0.6862745, 1,
-0.1100531, 0.5711918, -0.985694, 0, 1, 0.6941177, 1,
-0.1095937, -0.7070863, -2.015232, 0, 1, 0.7019608, 1,
-0.1086031, 0.9525236, -0.09347022, 0, 1, 0.7058824, 1,
-0.1055433, -0.2930245, -2.240084, 0, 1, 0.7137255, 1,
-0.1044556, 0.6782848, -1.12485, 0, 1, 0.7176471, 1,
-0.09707834, 0.5825763, -0.525101, 0, 1, 0.7254902, 1,
-0.0965246, -0.7487262, -1.649503, 0, 1, 0.7294118, 1,
-0.09592901, -0.0247029, -2.335181, 0, 1, 0.7372549, 1,
-0.09270206, 1.880114, -0.1093909, 0, 1, 0.7411765, 1,
-0.09182727, 0.2858078, 0.5733365, 0, 1, 0.7490196, 1,
-0.08970638, 0.9309971, -0.9169146, 0, 1, 0.7529412, 1,
-0.08783319, -1.71823, -2.893124, 0, 1, 0.7607843, 1,
-0.08624937, 1.233675, -0.7601555, 0, 1, 0.7647059, 1,
-0.08575846, 1.036044, -1.158973, 0, 1, 0.772549, 1,
-0.07640345, 0.2799763, 1.239621, 0, 1, 0.7764706, 1,
-0.07282678, 0.9640388, -0.8221644, 0, 1, 0.7843137, 1,
-0.06980441, 0.8363786, 0.03770372, 0, 1, 0.7882353, 1,
-0.06936522, -1.177487, -2.590086, 0, 1, 0.7960784, 1,
-0.06269287, 1.390537, 0.9186611, 0, 1, 0.8039216, 1,
-0.06086713, 0.424111, 0.1686728, 0, 1, 0.8078431, 1,
-0.06034223, -0.5826558, -4.494691, 0, 1, 0.8156863, 1,
-0.05974146, 0.1796996, -0.9864639, 0, 1, 0.8196079, 1,
-0.05740632, -0.7618671, -1.816177, 0, 1, 0.827451, 1,
-0.05522243, -0.1799656, -1.795964, 0, 1, 0.8313726, 1,
-0.05265785, 0.8157504, -0.6497971, 0, 1, 0.8392157, 1,
-0.04737209, 0.1155187, -0.7731285, 0, 1, 0.8431373, 1,
-0.04434801, 0.1880611, -0.4571564, 0, 1, 0.8509804, 1,
-0.04177408, 0.498838, -1.850045, 0, 1, 0.854902, 1,
-0.0411434, 1.439162, -0.4805053, 0, 1, 0.8627451, 1,
-0.03526687, -0.8744571, -2.035073, 0, 1, 0.8666667, 1,
-0.03421775, 1.007945, 0.9037864, 0, 1, 0.8745098, 1,
-0.03318973, -0.7133385, -1.974709, 0, 1, 0.8784314, 1,
-0.03152765, 1.477273, -0.6814637, 0, 1, 0.8862745, 1,
-0.02985361, 0.8290089, -1.505682, 0, 1, 0.8901961, 1,
-0.02666999, -0.6989806, -4.745337, 0, 1, 0.8980392, 1,
-0.02638497, 0.905108, -0.8635788, 0, 1, 0.9058824, 1,
-0.02249382, -1.263731, -1.881343, 0, 1, 0.9098039, 1,
-0.01698977, 0.8844625, 0.1880289, 0, 1, 0.9176471, 1,
-0.01286926, -2.636895, -3.845016, 0, 1, 0.9215686, 1,
-0.01208734, 0.001987694, -1.533591, 0, 1, 0.9294118, 1,
-0.01051437, -0.2858809, -3.438639, 0, 1, 0.9333333, 1,
-0.006344892, -0.5324163, -2.836616, 0, 1, 0.9411765, 1,
0.0009322721, 0.1223488, 0.91197, 0, 1, 0.945098, 1,
0.004164432, -1.495974, 4.305828, 0, 1, 0.9529412, 1,
0.005765925, -0.9939858, 4.091516, 0, 1, 0.9568627, 1,
0.008390415, -0.6780793, 4.455444, 0, 1, 0.9647059, 1,
0.008904728, -0.4060033, 3.500065, 0, 1, 0.9686275, 1,
0.01027297, 0.5692511, -0.09892045, 0, 1, 0.9764706, 1,
0.01137355, -0.8416051, 2.971079, 0, 1, 0.9803922, 1,
0.01225922, -0.08346934, 2.402329, 0, 1, 0.9882353, 1,
0.01726, 0.07795338, -0.2230849, 0, 1, 0.9921569, 1,
0.02217091, -2.236939, 2.375505, 0, 1, 1, 1,
0.02372168, -0.04371812, 3.514508, 0, 0.9921569, 1, 1,
0.02437122, -0.2322219, 4.069383, 0, 0.9882353, 1, 1,
0.0267354, 0.929727, -0.09619547, 0, 0.9803922, 1, 1,
0.02689525, 0.04327201, 7.75435e-05, 0, 0.9764706, 1, 1,
0.02864772, 1.638877, -0.4097994, 0, 0.9686275, 1, 1,
0.03439875, 2.734426, -0.3584501, 0, 0.9647059, 1, 1,
0.03685433, -0.1686238, 2.34943, 0, 0.9568627, 1, 1,
0.03763995, -1.113344, 3.809228, 0, 0.9529412, 1, 1,
0.0377554, -0.1930857, 2.110231, 0, 0.945098, 1, 1,
0.03806205, 0.4995983, 0.2196419, 0, 0.9411765, 1, 1,
0.03971702, -1.136156, 2.834135, 0, 0.9333333, 1, 1,
0.04992757, 1.078964, 0.7458627, 0, 0.9294118, 1, 1,
0.0508946, 0.559555, 0.3363876, 0, 0.9215686, 1, 1,
0.05555394, -0.3570808, 4.030936, 0, 0.9176471, 1, 1,
0.05703653, -0.1679003, 2.99979, 0, 0.9098039, 1, 1,
0.05786874, -0.7735696, 3.223599, 0, 0.9058824, 1, 1,
0.05949504, -1.077874, 2.928115, 0, 0.8980392, 1, 1,
0.06204764, 1.200468, 1.153785, 0, 0.8901961, 1, 1,
0.06403577, -0.6912448, 0.9283137, 0, 0.8862745, 1, 1,
0.0644009, 0.693791, -0.7017988, 0, 0.8784314, 1, 1,
0.06521562, 1.034067, -0.6077572, 0, 0.8745098, 1, 1,
0.06564152, 0.3057612, -0.3891183, 0, 0.8666667, 1, 1,
0.06698998, -1.248631, 2.838713, 0, 0.8627451, 1, 1,
0.06905462, 0.9080035, 0.6761815, 0, 0.854902, 1, 1,
0.07173175, 0.3433399, -1.007221, 0, 0.8509804, 1, 1,
0.07343663, 1.080328, -1.069501, 0, 0.8431373, 1, 1,
0.07753778, 1.787558, 0.2605002, 0, 0.8392157, 1, 1,
0.07775726, 1.874108, -0.5084186, 0, 0.8313726, 1, 1,
0.08305486, 0.4314943, 1.242609, 0, 0.827451, 1, 1,
0.08367535, -0.602378, 2.403376, 0, 0.8196079, 1, 1,
0.08994666, 0.5050142, 2.461197, 0, 0.8156863, 1, 1,
0.09576946, -0.2598456, 2.47888, 0, 0.8078431, 1, 1,
0.0975833, -0.2106692, 0.3907321, 0, 0.8039216, 1, 1,
0.09993079, -0.8710678, 2.949673, 0, 0.7960784, 1, 1,
0.1008059, 1.068464, 0.3707529, 0, 0.7882353, 1, 1,
0.1029248, -0.7301129, 3.152433, 0, 0.7843137, 1, 1,
0.1055072, -0.7483093, 1.257489, 0, 0.7764706, 1, 1,
0.1111661, 0.97994, -1.460169, 0, 0.772549, 1, 1,
0.1133739, 0.6848378, 0.2327182, 0, 0.7647059, 1, 1,
0.1153411, 0.5071681, -0.2855571, 0, 0.7607843, 1, 1,
0.1155605, -0.3166682, 3.979089, 0, 0.7529412, 1, 1,
0.1160926, 1.166289, 2.031549, 0, 0.7490196, 1, 1,
0.122201, 0.6687562, 0.5871511, 0, 0.7411765, 1, 1,
0.1246834, 0.8435167, -1.14815, 0, 0.7372549, 1, 1,
0.1247555, 0.4629802, 2.701064, 0, 0.7294118, 1, 1,
0.1268628, -1.058915, 4.571597, 0, 0.7254902, 1, 1,
0.1322979, -0.5372748, 3.028372, 0, 0.7176471, 1, 1,
0.1370928, 0.1532193, 0.2667225, 0, 0.7137255, 1, 1,
0.1418592, 0.4992651, 0.2048445, 0, 0.7058824, 1, 1,
0.1462792, 0.9048725, -0.2738858, 0, 0.6980392, 1, 1,
0.147837, 1.487633, 1.512056, 0, 0.6941177, 1, 1,
0.1503154, -0.7838646, 2.889904, 0, 0.6862745, 1, 1,
0.1554983, -1.163154, 2.60041, 0, 0.682353, 1, 1,
0.1559115, -0.6235418, 1.405896, 0, 0.6745098, 1, 1,
0.1568083, -1.414865, 4.421841, 0, 0.6705883, 1, 1,
0.1579192, 1.146405, 0.2072399, 0, 0.6627451, 1, 1,
0.1584517, -2.536009, 2.503511, 0, 0.6588235, 1, 1,
0.1592595, -0.5454739, 2.693011, 0, 0.6509804, 1, 1,
0.1599078, 2.160695, 1.647833, 0, 0.6470588, 1, 1,
0.1660298, -0.7422189, 3.618963, 0, 0.6392157, 1, 1,
0.1662844, -1.836092, 4.269953, 0, 0.6352941, 1, 1,
0.1688612, -1.374808, 4.081111, 0, 0.627451, 1, 1,
0.169773, 0.3428574, 0.21917, 0, 0.6235294, 1, 1,
0.1711487, -0.2102123, 2.200394, 0, 0.6156863, 1, 1,
0.1719984, 0.9395963, 1.755484, 0, 0.6117647, 1, 1,
0.175638, -0.07757289, 1.364956, 0, 0.6039216, 1, 1,
0.1769312, 0.5988309, -0.6206889, 0, 0.5960785, 1, 1,
0.177275, -0.9818608, 2.085963, 0, 0.5921569, 1, 1,
0.1818895, -2.10403, 1.091104, 0, 0.5843138, 1, 1,
0.1842456, -0.8304846, 3.521221, 0, 0.5803922, 1, 1,
0.1862334, 1.603459, 0.2491411, 0, 0.572549, 1, 1,
0.1866377, -0.2753203, 4.151006, 0, 0.5686275, 1, 1,
0.1912667, 1.697424, -1.044621, 0, 0.5607843, 1, 1,
0.1989505, 1.150076, -1.734457, 0, 0.5568628, 1, 1,
0.1995578, -1.507827, 4.269385, 0, 0.5490196, 1, 1,
0.204809, -1.545313, 5.387455, 0, 0.5450981, 1, 1,
0.2104404, -1.029711, 2.277389, 0, 0.5372549, 1, 1,
0.2110981, -0.4164422, 0.5597531, 0, 0.5333334, 1, 1,
0.2122326, 0.3242404, 1.531839, 0, 0.5254902, 1, 1,
0.213223, -0.2505085, 3.857632, 0, 0.5215687, 1, 1,
0.2153412, 0.004411651, 1.183012, 0, 0.5137255, 1, 1,
0.2207949, 1.03832, -0.2725776, 0, 0.509804, 1, 1,
0.2224173, 1.151147, 0.6175317, 0, 0.5019608, 1, 1,
0.2233732, 0.1801047, 0.2509066, 0, 0.4941176, 1, 1,
0.2293341, -0.6827766, 4.058352, 0, 0.4901961, 1, 1,
0.23128, -0.3153279, 1.011603, 0, 0.4823529, 1, 1,
0.2337572, 1.726864, 0.1508042, 0, 0.4784314, 1, 1,
0.2383429, -0.1427916, 0.6671078, 0, 0.4705882, 1, 1,
0.2401471, 1.234015, -0.6861961, 0, 0.4666667, 1, 1,
0.2401487, -0.5759032, 3.136665, 0, 0.4588235, 1, 1,
0.2409306, 0.7282476, -0.894287, 0, 0.454902, 1, 1,
0.2420121, -0.2814409, 2.830867, 0, 0.4470588, 1, 1,
0.244437, -0.8950437, 3.636404, 0, 0.4431373, 1, 1,
0.2483818, 0.2024325, -0.1548608, 0, 0.4352941, 1, 1,
0.2489861, 0.3221701, 0.21703, 0, 0.4313726, 1, 1,
0.2502733, -0.6445264, 2.335393, 0, 0.4235294, 1, 1,
0.2502755, -1.160438, 4.24907, 0, 0.4196078, 1, 1,
0.252975, -1.73138, 2.108418, 0, 0.4117647, 1, 1,
0.2564984, -1.174611, 2.39762, 0, 0.4078431, 1, 1,
0.2581927, 0.2226675, 0.9888975, 0, 0.4, 1, 1,
0.2601377, -0.144786, 1.097993, 0, 0.3921569, 1, 1,
0.2618852, 0.4589004, 0.8027211, 0, 0.3882353, 1, 1,
0.263934, 0.3726462, 0.4359527, 0, 0.3803922, 1, 1,
0.2656487, -0.1745567, 3.594954, 0, 0.3764706, 1, 1,
0.2698044, -0.6258363, 3.226754, 0, 0.3686275, 1, 1,
0.2739732, -1.37108, 3.439439, 0, 0.3647059, 1, 1,
0.2758192, 0.08688962, 1.660483, 0, 0.3568628, 1, 1,
0.2812812, -0.6133577, 3.677015, 0, 0.3529412, 1, 1,
0.2873359, 0.396158, 0.1645812, 0, 0.345098, 1, 1,
0.289836, -0.1287457, 2.216361, 0, 0.3411765, 1, 1,
0.2908356, -1.788414, 2.145171, 0, 0.3333333, 1, 1,
0.292226, -1.087721, 2.342955, 0, 0.3294118, 1, 1,
0.2962344, -0.6254283, 0.5834405, 0, 0.3215686, 1, 1,
0.2964432, -1.723925, 2.241517, 0, 0.3176471, 1, 1,
0.2982025, 0.6694349, 1.293651, 0, 0.3098039, 1, 1,
0.2988264, -2.187269, 4.779767, 0, 0.3058824, 1, 1,
0.3012221, -0.6115056, 1.783552, 0, 0.2980392, 1, 1,
0.3066227, -0.4792374, 2.132222, 0, 0.2901961, 1, 1,
0.3103431, 1.57087, -0.3035011, 0, 0.2862745, 1, 1,
0.3111482, -0.2485453, 2.025398, 0, 0.2784314, 1, 1,
0.3167434, -0.3193916, 3.112365, 0, 0.2745098, 1, 1,
0.3220362, 0.05419024, 3.110548, 0, 0.2666667, 1, 1,
0.3240064, 1.306975, 1.20554, 0, 0.2627451, 1, 1,
0.329956, 1.336954, 0.234491, 0, 0.254902, 1, 1,
0.3332744, -0.6536297, 4.105567, 0, 0.2509804, 1, 1,
0.3345067, -1.230024, 3.898305, 0, 0.2431373, 1, 1,
0.3349897, 1.396902, 0.542155, 0, 0.2392157, 1, 1,
0.3362174, -0.3653997, 2.248511, 0, 0.2313726, 1, 1,
0.337939, -0.02206686, 0.9216981, 0, 0.227451, 1, 1,
0.3390706, -1.592788, 2.908722, 0, 0.2196078, 1, 1,
0.3413657, 0.01760076, 1.574347, 0, 0.2156863, 1, 1,
0.3416602, 0.009788644, 2.895954, 0, 0.2078431, 1, 1,
0.3471425, 0.7170318, -0.2320221, 0, 0.2039216, 1, 1,
0.3492518, 0.3406265, -0.4762258, 0, 0.1960784, 1, 1,
0.3513637, 0.267821, 1.381624, 0, 0.1882353, 1, 1,
0.35172, -0.4475026, 2.650946, 0, 0.1843137, 1, 1,
0.3604313, 1.172426, 1.173785, 0, 0.1764706, 1, 1,
0.3665089, 1.657872, -0.04610444, 0, 0.172549, 1, 1,
0.3778545, -0.6219237, 2.231356, 0, 0.1647059, 1, 1,
0.3800084, -0.2856616, 2.779321, 0, 0.1607843, 1, 1,
0.3867691, 1.018135, 0.5552031, 0, 0.1529412, 1, 1,
0.3870964, 0.3078966, 1.263142, 0, 0.1490196, 1, 1,
0.3875766, -1.11736, 3.479041, 0, 0.1411765, 1, 1,
0.3894665, -0.002247327, 3.118261, 0, 0.1372549, 1, 1,
0.3903869, -1.818301, 3.02749, 0, 0.1294118, 1, 1,
0.3921327, -1.728828, 2.997871, 0, 0.1254902, 1, 1,
0.393297, 1.901557, 0.295005, 0, 0.1176471, 1, 1,
0.3972071, -1.678077, 4.060697, 0, 0.1137255, 1, 1,
0.405818, -0.7004061, 4.050706, 0, 0.1058824, 1, 1,
0.409366, 2.142928, 0.8358347, 0, 0.09803922, 1, 1,
0.4098609, -0.3324282, 2.071151, 0, 0.09411765, 1, 1,
0.4161254, 0.1205861, 1.379925, 0, 0.08627451, 1, 1,
0.4168292, 0.01790616, 1.073996, 0, 0.08235294, 1, 1,
0.4176484, -1.082221, 4.020914, 0, 0.07450981, 1, 1,
0.421085, -0.9688945, 2.690559, 0, 0.07058824, 1, 1,
0.4259594, -0.9400577, 3.440636, 0, 0.0627451, 1, 1,
0.4289766, -0.479569, 3.376473, 0, 0.05882353, 1, 1,
0.4333664, -1.149259, 3.188495, 0, 0.05098039, 1, 1,
0.4505477, 0.7445459, 1.936896, 0, 0.04705882, 1, 1,
0.4539961, -0.6638691, 2.431187, 0, 0.03921569, 1, 1,
0.4541307, -1.178373, 1.6771, 0, 0.03529412, 1, 1,
0.4545399, 0.6910006, 0.8953939, 0, 0.02745098, 1, 1,
0.4668759, 0.4102548, 0.3061644, 0, 0.02352941, 1, 1,
0.4669558, -1.915478, 2.415409, 0, 0.01568628, 1, 1,
0.4699273, -0.4777158, 1.090144, 0, 0.01176471, 1, 1,
0.4716191, -0.4105226, 0.2895775, 0, 0.003921569, 1, 1,
0.4722679, 0.3530635, 1.05318, 0.003921569, 0, 1, 1,
0.4723471, 1.424487, 1.608334, 0.007843138, 0, 1, 1,
0.4725201, 1.742695, 2.256455, 0.01568628, 0, 1, 1,
0.4737321, 1.332754, -1.969931, 0.01960784, 0, 1, 1,
0.4827348, 1.673406, -1.462073, 0.02745098, 0, 1, 1,
0.4855797, 0.206374, 1.093968, 0.03137255, 0, 1, 1,
0.489006, -0.691516, 2.484143, 0.03921569, 0, 1, 1,
0.4963806, -0.01179752, 0.6536791, 0.04313726, 0, 1, 1,
0.4974862, -0.5566582, 1.465631, 0.05098039, 0, 1, 1,
0.4978119, -0.749126, 3.437968, 0.05490196, 0, 1, 1,
0.497997, -0.03802228, 0.7346023, 0.0627451, 0, 1, 1,
0.4986005, 0.7352992, 0.3675535, 0.06666667, 0, 1, 1,
0.5028513, -0.5998048, 5.01085, 0.07450981, 0, 1, 1,
0.5044991, 0.4175417, 1.048096, 0.07843138, 0, 1, 1,
0.5052728, -0.4106107, 3.912904, 0.08627451, 0, 1, 1,
0.5056074, 0.9539687, -0.4845913, 0.09019608, 0, 1, 1,
0.5060943, -0.1948884, 1.534182, 0.09803922, 0, 1, 1,
0.5065509, -0.415716, 2.017912, 0.1058824, 0, 1, 1,
0.5066965, -0.06518378, 1.516246, 0.1098039, 0, 1, 1,
0.5079336, 0.04260732, 1.367337, 0.1176471, 0, 1, 1,
0.508564, 0.5649053, 1.713524, 0.1215686, 0, 1, 1,
0.5108232, -1.230702, 3.573552, 0.1294118, 0, 1, 1,
0.5170961, -0.2380414, 2.418556, 0.1333333, 0, 1, 1,
0.5179561, -1.116299, 3.270066, 0.1411765, 0, 1, 1,
0.5229074, 0.289112, 2.729778, 0.145098, 0, 1, 1,
0.5230703, 0.2311673, 0.9187691, 0.1529412, 0, 1, 1,
0.5280534, 1.400361, -1.879945, 0.1568628, 0, 1, 1,
0.5290656, 0.3881319, 0.9883226, 0.1647059, 0, 1, 1,
0.5316151, -2.289247, 4.298164, 0.1686275, 0, 1, 1,
0.5327746, 0.2952099, 0.160875, 0.1764706, 0, 1, 1,
0.5333046, -0.5688295, 2.654571, 0.1803922, 0, 1, 1,
0.537544, 1.587001, -0.3947015, 0.1882353, 0, 1, 1,
0.5383824, 2.597388, 1.273106, 0.1921569, 0, 1, 1,
0.5384325, -0.1141004, 1.372757, 0.2, 0, 1, 1,
0.542505, 0.6160268, 2.779557, 0.2078431, 0, 1, 1,
0.5427889, 0.5973557, -0.4441684, 0.2117647, 0, 1, 1,
0.5434843, 0.2464383, 1.907552, 0.2196078, 0, 1, 1,
0.5455911, 1.483593, 0.5307164, 0.2235294, 0, 1, 1,
0.5473894, 0.2578158, -0.0933835, 0.2313726, 0, 1, 1,
0.5478851, -0.2174389, 1.377008, 0.2352941, 0, 1, 1,
0.54866, 0.5258218, 2.38179, 0.2431373, 0, 1, 1,
0.5573078, 0.7592283, 0.2244949, 0.2470588, 0, 1, 1,
0.5596494, 0.07829309, 1.323453, 0.254902, 0, 1, 1,
0.560679, -2.257993, 2.938076, 0.2588235, 0, 1, 1,
0.5638461, -0.07523626, 1.091497, 0.2666667, 0, 1, 1,
0.565062, 0.5670261, 0.7831683, 0.2705882, 0, 1, 1,
0.5651476, -1.811224, 4.814653, 0.2784314, 0, 1, 1,
0.567037, -2.035527, 1.132331, 0.282353, 0, 1, 1,
0.5674426, 0.311213, 1.747969, 0.2901961, 0, 1, 1,
0.5682078, -0.2006707, 2.639812, 0.2941177, 0, 1, 1,
0.5702633, 0.6616709, 1.346563, 0.3019608, 0, 1, 1,
0.5829835, 0.6446666, 1.113357, 0.3098039, 0, 1, 1,
0.5836026, -1.773455, 3.042417, 0.3137255, 0, 1, 1,
0.5841032, -0.2222323, 3.375133, 0.3215686, 0, 1, 1,
0.5860556, -1.985126, 1.152723, 0.3254902, 0, 1, 1,
0.5869483, 1.084653, 1.537256, 0.3333333, 0, 1, 1,
0.5885168, -1.295024, 2.850889, 0.3372549, 0, 1, 1,
0.59522, -1.521572, 2.366247, 0.345098, 0, 1, 1,
0.6028627, -0.1034664, 2.617332, 0.3490196, 0, 1, 1,
0.602936, 1.291208, 1.497553, 0.3568628, 0, 1, 1,
0.6029613, 0.7886376, 0.7184985, 0.3607843, 0, 1, 1,
0.6060711, 0.5994889, 0.1082559, 0.3686275, 0, 1, 1,
0.607429, 1.131728, 1.076438, 0.372549, 0, 1, 1,
0.6091473, -1.144142, 2.199101, 0.3803922, 0, 1, 1,
0.6147021, -0.1662729, 0.6716144, 0.3843137, 0, 1, 1,
0.6183043, 0.348814, 2.264086, 0.3921569, 0, 1, 1,
0.6214792, 0.1997676, 1.39236, 0.3960784, 0, 1, 1,
0.6256495, -0.5790529, 2.431221, 0.4039216, 0, 1, 1,
0.6344204, -0.6144134, 4.549178, 0.4117647, 0, 1, 1,
0.6424168, 1.230186, 0.5859724, 0.4156863, 0, 1, 1,
0.6455674, -0.9904231, 2.559778, 0.4235294, 0, 1, 1,
0.6493186, -0.6356956, 3.102783, 0.427451, 0, 1, 1,
0.6550422, -0.4714736, 2.705436, 0.4352941, 0, 1, 1,
0.6642494, 0.8336338, 1.137291, 0.4392157, 0, 1, 1,
0.6677004, 1.510462, 0.8320047, 0.4470588, 0, 1, 1,
0.6692116, 0.5887846, 1.893467, 0.4509804, 0, 1, 1,
0.6703321, -0.6108479, 0.8842138, 0.4588235, 0, 1, 1,
0.6753855, 0.2120346, 1.88117, 0.4627451, 0, 1, 1,
0.6754865, 0.6634149, 0.1305434, 0.4705882, 0, 1, 1,
0.6821424, -0.4069589, 3.296419, 0.4745098, 0, 1, 1,
0.6869831, 1.167948, -1.894596, 0.4823529, 0, 1, 1,
0.6908415, -0.4992623, 1.750481, 0.4862745, 0, 1, 1,
0.6936396, 0.5639402, 2.561774, 0.4941176, 0, 1, 1,
0.6958786, 0.7509179, -0.9259402, 0.5019608, 0, 1, 1,
0.6968445, -1.522903, 2.033186, 0.5058824, 0, 1, 1,
0.7051049, 0.7175273, 2.244218, 0.5137255, 0, 1, 1,
0.7124839, 0.4617463, 0.1408764, 0.5176471, 0, 1, 1,
0.7175601, -0.4957332, 0.1024664, 0.5254902, 0, 1, 1,
0.7182884, 2.016656, 0.1898199, 0.5294118, 0, 1, 1,
0.7242795, -0.01362748, 1.396924, 0.5372549, 0, 1, 1,
0.7287811, -1.131466, 3.415989, 0.5411765, 0, 1, 1,
0.7326906, 0.1606169, 0.1274586, 0.5490196, 0, 1, 1,
0.7331048, -0.4901524, 1.642748, 0.5529412, 0, 1, 1,
0.7341616, 1.488019, -0.1062384, 0.5607843, 0, 1, 1,
0.7375439, -0.3688733, 1.720654, 0.5647059, 0, 1, 1,
0.7424825, -0.1531547, 1.46979, 0.572549, 0, 1, 1,
0.7535844, -0.1217994, 1.797734, 0.5764706, 0, 1, 1,
0.7538656, -0.3323749, 2.198422, 0.5843138, 0, 1, 1,
0.7602493, 0.5180062, -0.08198964, 0.5882353, 0, 1, 1,
0.7622067, -0.6872811, 2.0166, 0.5960785, 0, 1, 1,
0.7640408, 1.628296, 1.547418, 0.6039216, 0, 1, 1,
0.7827195, 0.1992724, 0.6319714, 0.6078432, 0, 1, 1,
0.7875434, 0.3439627, 2.135413, 0.6156863, 0, 1, 1,
0.788073, 0.444902, 0.7481402, 0.6196079, 0, 1, 1,
0.7955933, -0.551302, 0.5858566, 0.627451, 0, 1, 1,
0.8026335, -0.8179109, 0.7265916, 0.6313726, 0, 1, 1,
0.8173669, -1.045207, 3.257282, 0.6392157, 0, 1, 1,
0.8178115, -1.285973, 1.686996, 0.6431373, 0, 1, 1,
0.8189429, 0.4436071, 1.377277, 0.6509804, 0, 1, 1,
0.8237388, 0.6815937, 0.6303779, 0.654902, 0, 1, 1,
0.8312265, -0.1489611, 1.124225, 0.6627451, 0, 1, 1,
0.8348297, 0.7512607, 0.6675975, 0.6666667, 0, 1, 1,
0.8356955, -0.813306, 1.964196, 0.6745098, 0, 1, 1,
0.8378431, -1.74952, 4.553881, 0.6784314, 0, 1, 1,
0.8400352, 0.9088005, 2.071961, 0.6862745, 0, 1, 1,
0.8427351, -0.9015753, 2.326118, 0.6901961, 0, 1, 1,
0.84439, 1.071604, 1.157651, 0.6980392, 0, 1, 1,
0.8466358, 0.4990766, 2.164786, 0.7058824, 0, 1, 1,
0.85085, -0.1390582, 3.603235, 0.7098039, 0, 1, 1,
0.8598738, 0.7431257, -0.2592979, 0.7176471, 0, 1, 1,
0.8642166, -0.5093573, 2.135969, 0.7215686, 0, 1, 1,
0.8680171, -1.57801, 2.805676, 0.7294118, 0, 1, 1,
0.868975, 0.815156, 2.562531, 0.7333333, 0, 1, 1,
0.871745, -0.4526775, 1.417024, 0.7411765, 0, 1, 1,
0.8720333, 0.4551657, 0.370838, 0.7450981, 0, 1, 1,
0.8726658, 0.8550536, 1.234018, 0.7529412, 0, 1, 1,
0.8888348, -0.2359982, 2.009155, 0.7568628, 0, 1, 1,
0.8931135, 0.1493901, 1.172681, 0.7647059, 0, 1, 1,
0.8934684, 0.2898314, 0.321914, 0.7686275, 0, 1, 1,
0.9034276, -0.5837789, 1.258161, 0.7764706, 0, 1, 1,
0.9047145, -0.7221749, 1.411, 0.7803922, 0, 1, 1,
0.9108886, 1.226346, 0.1842575, 0.7882353, 0, 1, 1,
0.9222069, -0.5466105, 3.494068, 0.7921569, 0, 1, 1,
0.9227607, -0.798638, 3.812001, 0.8, 0, 1, 1,
0.9275213, 0.04271583, 2.338095, 0.8078431, 0, 1, 1,
0.9285479, -0.3142526, 3.126463, 0.8117647, 0, 1, 1,
0.9292776, 0.6590833, 1.481784, 0.8196079, 0, 1, 1,
0.9310309, 0.3063008, 1.252396, 0.8235294, 0, 1, 1,
0.9341613, -2.602994, 2.63133, 0.8313726, 0, 1, 1,
0.9528362, -0.9797762, 1.191855, 0.8352941, 0, 1, 1,
0.9582528, 0.6160532, 1.522688, 0.8431373, 0, 1, 1,
0.960907, 0.08780272, 0.5647007, 0.8470588, 0, 1, 1,
0.9624275, 0.7059637, -0.2890754, 0.854902, 0, 1, 1,
0.9642544, 0.317911, 0.3288616, 0.8588235, 0, 1, 1,
0.9644464, -0.2848115, 1.825115, 0.8666667, 0, 1, 1,
0.964958, 0.03096914, -0.6790363, 0.8705882, 0, 1, 1,
0.9682987, -1.557092, 1.652641, 0.8784314, 0, 1, 1,
0.9750561, -1.029313, 0.8141934, 0.8823529, 0, 1, 1,
0.9751807, 0.7510344, 1.936701, 0.8901961, 0, 1, 1,
0.9800436, -1.187862, 3.028279, 0.8941177, 0, 1, 1,
0.9813742, -1.723835, 4.251992, 0.9019608, 0, 1, 1,
0.982142, 0.3264624, -1.014772, 0.9098039, 0, 1, 1,
0.98318, -0.4216659, 1.465202, 0.9137255, 0, 1, 1,
0.9923848, -1.158845, 0.4501993, 0.9215686, 0, 1, 1,
0.9933017, 0.5448152, 2.258452, 0.9254902, 0, 1, 1,
1.013054, 1.026297, 0.3970051, 0.9333333, 0, 1, 1,
1.01343, 0.5087686, 2.563284, 0.9372549, 0, 1, 1,
1.014098, 1.327209, 2.375554, 0.945098, 0, 1, 1,
1.016507, -0.195943, 1.404358, 0.9490196, 0, 1, 1,
1.018481, -1.640923, 1.650169, 0.9568627, 0, 1, 1,
1.0195, -0.8824918, 1.789871, 0.9607843, 0, 1, 1,
1.02106, 1.771639, -1.290613, 0.9686275, 0, 1, 1,
1.022233, -1.113441, 3.8886, 0.972549, 0, 1, 1,
1.023466, -0.956285, 2.093166, 0.9803922, 0, 1, 1,
1.02512, -1.757689, 2.599277, 0.9843137, 0, 1, 1,
1.032875, 1.551374, 0.5953051, 0.9921569, 0, 1, 1,
1.033114, -0.9049164, 2.833515, 0.9960784, 0, 1, 1,
1.035842, -0.4822909, 2.308783, 1, 0, 0.9960784, 1,
1.039143, 1.488269, -0.3595192, 1, 0, 0.9882353, 1,
1.040514, 0.2466975, 3.204741, 1, 0, 0.9843137, 1,
1.041342, 0.3841569, 1.273563, 1, 0, 0.9764706, 1,
1.044577, 0.7750797, 0.8993338, 1, 0, 0.972549, 1,
1.045232, -0.2941099, 1.429404, 1, 0, 0.9647059, 1,
1.047286, -0.2776273, 2.362613, 1, 0, 0.9607843, 1,
1.069698, 0.3420717, 1.150363, 1, 0, 0.9529412, 1,
1.0768, 0.708155, -0.7049441, 1, 0, 0.9490196, 1,
1.077479, 0.8079261, -1.336098, 1, 0, 0.9411765, 1,
1.077804, -1.13843, 2.587375, 1, 0, 0.9372549, 1,
1.078449, -0.4421072, 2.251179, 1, 0, 0.9294118, 1,
1.078541, 2.103111, 2.924835, 1, 0, 0.9254902, 1,
1.078732, 1.989064, 0.5122925, 1, 0, 0.9176471, 1,
1.087216, 1.381382, -0.3977997, 1, 0, 0.9137255, 1,
1.088377, -0.7941929, 2.382575, 1, 0, 0.9058824, 1,
1.090571, 0.814669, 0.2671122, 1, 0, 0.9019608, 1,
1.097841, -0.4133174, 1.517571, 1, 0, 0.8941177, 1,
1.105116, -1.675675, 3.181917, 1, 0, 0.8862745, 1,
1.105291, -0.4274834, 2.559309, 1, 0, 0.8823529, 1,
1.105467, -1.892173, 2.427933, 1, 0, 0.8745098, 1,
1.106715, -0.3249826, 2.271093, 1, 0, 0.8705882, 1,
1.108994, 0.7978525, 1.555892, 1, 0, 0.8627451, 1,
1.113978, -0.09251036, 2.431088, 1, 0, 0.8588235, 1,
1.114666, -0.7974436, 2.479779, 1, 0, 0.8509804, 1,
1.11477, 0.3506838, 1.634857, 1, 0, 0.8470588, 1,
1.123404, 0.009625128, 2.692044, 1, 0, 0.8392157, 1,
1.124359, 0.5205843, 1.761378, 1, 0, 0.8352941, 1,
1.133114, 1.367363, 1.727694, 1, 0, 0.827451, 1,
1.136008, 1.369172, 0.3907466, 1, 0, 0.8235294, 1,
1.139936, 0.2332454, 1.756215, 1, 0, 0.8156863, 1,
1.140404, 1.249724, 0.7522695, 1, 0, 0.8117647, 1,
1.141915, -1.566653, 2.608472, 1, 0, 0.8039216, 1,
1.144814, 1.310793, -2.21035, 1, 0, 0.7960784, 1,
1.149274, 0.3075777, 0.1436016, 1, 0, 0.7921569, 1,
1.150042, -0.321043, 0.9703804, 1, 0, 0.7843137, 1,
1.151545, 0.04388916, 2.477464, 1, 0, 0.7803922, 1,
1.156025, 1.450045, -0.61321, 1, 0, 0.772549, 1,
1.161495, 0.09264711, 1.450228, 1, 0, 0.7686275, 1,
1.161976, -1.3966, 4.334297, 1, 0, 0.7607843, 1,
1.16303, -1.027367, 1.643616, 1, 0, 0.7568628, 1,
1.163141, -0.01892896, 1.480451, 1, 0, 0.7490196, 1,
1.163201, 2.181513, 0.05344523, 1, 0, 0.7450981, 1,
1.165371, 0.1601633, 0.103921, 1, 0, 0.7372549, 1,
1.169669, 0.5698594, 0.3984541, 1, 0, 0.7333333, 1,
1.181654, -0.7196913, 1.59915, 1, 0, 0.7254902, 1,
1.1872, -1.039277, 2.007551, 1, 0, 0.7215686, 1,
1.188773, -1.148354, 2.331006, 1, 0, 0.7137255, 1,
1.198282, 0.255231, -0.1001165, 1, 0, 0.7098039, 1,
1.203214, 0.4014288, 1.57639, 1, 0, 0.7019608, 1,
1.216888, -1.265438, 0.7822919, 1, 0, 0.6941177, 1,
1.218856, -0.5493704, 0.9214462, 1, 0, 0.6901961, 1,
1.219236, 0.03773259, 0.7347865, 1, 0, 0.682353, 1,
1.219971, -0.5519153, 2.05049, 1, 0, 0.6784314, 1,
1.224801, -1.550144, 0.7164556, 1, 0, 0.6705883, 1,
1.226188, -0.3882405, 3.175873, 1, 0, 0.6666667, 1,
1.226503, -0.5981424, 2.143084, 1, 0, 0.6588235, 1,
1.233546, 1.283741, -0.7927711, 1, 0, 0.654902, 1,
1.254994, 0.3758089, 2.8576, 1, 0, 0.6470588, 1,
1.261929, 1.261448, -0.2595434, 1, 0, 0.6431373, 1,
1.263612, 0.08748092, 2.73989, 1, 0, 0.6352941, 1,
1.263694, -0.5934688, 2.472585, 1, 0, 0.6313726, 1,
1.28322, 0.2456111, 1.143191, 1, 0, 0.6235294, 1,
1.287242, 0.6006069, -0.3839045, 1, 0, 0.6196079, 1,
1.294162, 0.6737152, 0.1589527, 1, 0, 0.6117647, 1,
1.30324, -1.104354, 2.373264, 1, 0, 0.6078432, 1,
1.306998, -1.040228, 1.437603, 1, 0, 0.6, 1,
1.307456, -0.4190407, 3.164962, 1, 0, 0.5921569, 1,
1.314569, 0.2268722, 2.404346, 1, 0, 0.5882353, 1,
1.323703, -0.1373267, 2.245562, 1, 0, 0.5803922, 1,
1.324758, 0.8920336, -0.2176301, 1, 0, 0.5764706, 1,
1.334517, -0.3616499, 1.226229, 1, 0, 0.5686275, 1,
1.334992, 0.2611171, 0.8437043, 1, 0, 0.5647059, 1,
1.337047, -0.6555215, 2.047727, 1, 0, 0.5568628, 1,
1.348717, -0.6559857, 2.8815, 1, 0, 0.5529412, 1,
1.363559, -1.430959, 4.332154, 1, 0, 0.5450981, 1,
1.37412, 0.2593191, 0.1563557, 1, 0, 0.5411765, 1,
1.375328, 1.243639, 1.808755, 1, 0, 0.5333334, 1,
1.382252, 1.874549, -0.2037357, 1, 0, 0.5294118, 1,
1.390621, 1.312299, 0.4520967, 1, 0, 0.5215687, 1,
1.403508, 0.2168043, 2.943222, 1, 0, 0.5176471, 1,
1.406303, -0.05518699, 1.727865, 1, 0, 0.509804, 1,
1.414854, -0.1920033, 1.412855, 1, 0, 0.5058824, 1,
1.441796, -0.2020026, 1.542503, 1, 0, 0.4980392, 1,
1.451733, -0.00682099, 2.116471, 1, 0, 0.4901961, 1,
1.452589, -0.3547999, 2.700828, 1, 0, 0.4862745, 1,
1.452729, 2.325137, 1.012702, 1, 0, 0.4784314, 1,
1.453251, 2.590454, 0.9144172, 1, 0, 0.4745098, 1,
1.458501, -0.5079279, 2.592132, 1, 0, 0.4666667, 1,
1.463928, -0.5583436, 2.357855, 1, 0, 0.4627451, 1,
1.478004, -0.3772592, 1.780422, 1, 0, 0.454902, 1,
1.478756, 1.095667, 1.783228, 1, 0, 0.4509804, 1,
1.483802, 0.2075227, -0.8056352, 1, 0, 0.4431373, 1,
1.508958, 0.03688221, 0.7819865, 1, 0, 0.4392157, 1,
1.510118, 0.05935064, 1.464861, 1, 0, 0.4313726, 1,
1.514534, 0.5995899, 1.88181, 1, 0, 0.427451, 1,
1.518978, -0.04594053, 1.882026, 1, 0, 0.4196078, 1,
1.52695, 0.1697908, 2.663357, 1, 0, 0.4156863, 1,
1.532308, 0.9061088, 2.284155, 1, 0, 0.4078431, 1,
1.536986, 1.466984, -0.9391139, 1, 0, 0.4039216, 1,
1.5427, 0.05384435, 0.9444935, 1, 0, 0.3960784, 1,
1.548479, 0.2470948, 3.169873, 1, 0, 0.3882353, 1,
1.579413, 0.1593185, 1.118209, 1, 0, 0.3843137, 1,
1.595592, 0.6480703, -0.9551112, 1, 0, 0.3764706, 1,
1.59589, -0.785489, 2.393043, 1, 0, 0.372549, 1,
1.608151, 0.7500046, 1.383243, 1, 0, 0.3647059, 1,
1.61128, -0.6893195, 2.489172, 1, 0, 0.3607843, 1,
1.619424, -0.07853826, 0.7941452, 1, 0, 0.3529412, 1,
1.623036, 4.108109, 0.05070407, 1, 0, 0.3490196, 1,
1.632666, -0.04529789, 1.879483, 1, 0, 0.3411765, 1,
1.632915, 0.9348928, 1.113279, 1, 0, 0.3372549, 1,
1.64387, 0.1946157, -1.098088, 1, 0, 0.3294118, 1,
1.660237, 0.7093849, 0.9334379, 1, 0, 0.3254902, 1,
1.664086, 0.273131, 0.7483507, 1, 0, 0.3176471, 1,
1.668575, -1.780366, 3.224107, 1, 0, 0.3137255, 1,
1.689365, 0.04240964, 0.8277337, 1, 0, 0.3058824, 1,
1.703964, -0.9748703, 2.290315, 1, 0, 0.2980392, 1,
1.711297, 1.074896, 2.06406, 1, 0, 0.2941177, 1,
1.712457, -0.02000236, -0.3094434, 1, 0, 0.2862745, 1,
1.720672, 1.066917, 1.943654, 1, 0, 0.282353, 1,
1.720914, -1.036247, 2.25754, 1, 0, 0.2745098, 1,
1.72732, -0.4502363, 3.053788, 1, 0, 0.2705882, 1,
1.745607, 0.5560974, 0.7827097, 1, 0, 0.2627451, 1,
1.749581, 1.246843, 1.786336, 1, 0, 0.2588235, 1,
1.760935, -0.7640569, 1.823186, 1, 0, 0.2509804, 1,
1.767887, 0.5593826, 0.1285681, 1, 0, 0.2470588, 1,
1.783117, 0.5454862, 1.05784, 1, 0, 0.2392157, 1,
1.786114, -1.637302, 3.562213, 1, 0, 0.2352941, 1,
1.786703, 0.1041908, 1.965723, 1, 0, 0.227451, 1,
1.794632, 3.159358, -0.3614294, 1, 0, 0.2235294, 1,
1.806673, 0.2429443, 2.415093, 1, 0, 0.2156863, 1,
1.808118, 1.179657, 2.382206, 1, 0, 0.2117647, 1,
1.821932, 1.176376, 0.537837, 1, 0, 0.2039216, 1,
1.84229, -2.144899, 4.414415, 1, 0, 0.1960784, 1,
1.849336, -1.656025, 3.422616, 1, 0, 0.1921569, 1,
1.860439, 0.547766, 1.349981, 1, 0, 0.1843137, 1,
1.890538, 0.7067941, 1.177301, 1, 0, 0.1803922, 1,
1.917003, -0.4430266, 1.284633, 1, 0, 0.172549, 1,
1.921523, 1.589963, 0.863439, 1, 0, 0.1686275, 1,
1.935449, 0.3165959, 1.734341, 1, 0, 0.1607843, 1,
1.939583, 0.7081001, 1.515263, 1, 0, 0.1568628, 1,
1.972346, -0.5509172, 2.091272, 1, 0, 0.1490196, 1,
2.002115, -0.9634751, 2.614452, 1, 0, 0.145098, 1,
2.003601, 0.4308764, 0.3503205, 1, 0, 0.1372549, 1,
2.019442, -0.06912596, 1.168834, 1, 0, 0.1333333, 1,
2.043323, 0.3580025, 1.268034, 1, 0, 0.1254902, 1,
2.043443, -0.8381414, 2.179442, 1, 0, 0.1215686, 1,
2.06818, 0.5144972, 0.6140274, 1, 0, 0.1137255, 1,
2.077673, 0.763576, 1.704728, 1, 0, 0.1098039, 1,
2.086594, 1.119368, 2.500378, 1, 0, 0.1019608, 1,
2.114682, -0.7285318, 1.685741, 1, 0, 0.09411765, 1,
2.129184, -0.5901357, 3.1946, 1, 0, 0.09019608, 1,
2.136261, -1.284773, 1.359874, 1, 0, 0.08235294, 1,
2.145854, 0.4134519, 1.626046, 1, 0, 0.07843138, 1,
2.166197, 0.7036523, 0.9436864, 1, 0, 0.07058824, 1,
2.17865, -2.258331, 2.914279, 1, 0, 0.06666667, 1,
2.241416, 0.08206426, 1.743798, 1, 0, 0.05882353, 1,
2.326309, 0.06288399, 0.4603017, 1, 0, 0.05490196, 1,
2.36645, -0.9935045, 1.560027, 1, 0, 0.04705882, 1,
2.436176, 1.502854, 1.809595, 1, 0, 0.04313726, 1,
2.519958, -0.2015359, 1.679518, 1, 0, 0.03529412, 1,
2.623424, -1.861485, 1.47177, 1, 0, 0.03137255, 1,
2.635168, -0.2616262, 2.1309, 1, 0, 0.02352941, 1,
2.70884, -1.926229, 3.961217, 1, 0, 0.01960784, 1,
2.729481, -0.8065655, 1.809186, 1, 0, 0.01176471, 1,
3.112684, 0.1648577, 1.225014, 1, 0, 0.007843138, 1
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
0.1673871, -4.670569, -8.883472, 0, -0.5, 0.5, 0.5,
0.1673871, -4.670569, -8.883472, 1, -0.5, 0.5, 0.5,
0.1673871, -4.670569, -8.883472, 1, 1.5, 0.5, 0.5,
0.1673871, -4.670569, -8.883472, 0, 1.5, 0.5, 0.5
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
-3.776366, 0.3549336, -8.883472, 0, -0.5, 0.5, 0.5,
-3.776366, 0.3549336, -8.883472, 1, -0.5, 0.5, 0.5,
-3.776366, 0.3549336, -8.883472, 1, 1.5, 0.5, 0.5,
-3.776366, 0.3549336, -8.883472, 0, 1.5, 0.5, 0.5
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
-3.776366, -4.670569, -0.7138398, 0, -0.5, 0.5, 0.5,
-3.776366, -4.670569, -0.7138398, 1, -0.5, 0.5, 0.5,
-3.776366, -4.670569, -0.7138398, 1, 1.5, 0.5, 0.5,
-3.776366, -4.670569, -0.7138398, 0, 1.5, 0.5, 0.5
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
-2, -3.510838, -6.998173,
3, -3.510838, -6.998173,
-2, -3.510838, -6.998173,
-2, -3.704126, -7.312389,
-1, -3.510838, -6.998173,
-1, -3.704126, -7.312389,
0, -3.510838, -6.998173,
0, -3.704126, -7.312389,
1, -3.510838, -6.998173,
1, -3.704126, -7.312389,
2, -3.510838, -6.998173,
2, -3.704126, -7.312389,
3, -3.510838, -6.998173,
3, -3.704126, -7.312389
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
-2, -4.090703, -7.940823, 0, -0.5, 0.5, 0.5,
-2, -4.090703, -7.940823, 1, -0.5, 0.5, 0.5,
-2, -4.090703, -7.940823, 1, 1.5, 0.5, 0.5,
-2, -4.090703, -7.940823, 0, 1.5, 0.5, 0.5,
-1, -4.090703, -7.940823, 0, -0.5, 0.5, 0.5,
-1, -4.090703, -7.940823, 1, -0.5, 0.5, 0.5,
-1, -4.090703, -7.940823, 1, 1.5, 0.5, 0.5,
-1, -4.090703, -7.940823, 0, 1.5, 0.5, 0.5,
0, -4.090703, -7.940823, 0, -0.5, 0.5, 0.5,
0, -4.090703, -7.940823, 1, -0.5, 0.5, 0.5,
0, -4.090703, -7.940823, 1, 1.5, 0.5, 0.5,
0, -4.090703, -7.940823, 0, 1.5, 0.5, 0.5,
1, -4.090703, -7.940823, 0, -0.5, 0.5, 0.5,
1, -4.090703, -7.940823, 1, -0.5, 0.5, 0.5,
1, -4.090703, -7.940823, 1, 1.5, 0.5, 0.5,
1, -4.090703, -7.940823, 0, 1.5, 0.5, 0.5,
2, -4.090703, -7.940823, 0, -0.5, 0.5, 0.5,
2, -4.090703, -7.940823, 1, -0.5, 0.5, 0.5,
2, -4.090703, -7.940823, 1, 1.5, 0.5, 0.5,
2, -4.090703, -7.940823, 0, 1.5, 0.5, 0.5,
3, -4.090703, -7.940823, 0, -0.5, 0.5, 0.5,
3, -4.090703, -7.940823, 1, -0.5, 0.5, 0.5,
3, -4.090703, -7.940823, 1, 1.5, 0.5, 0.5,
3, -4.090703, -7.940823, 0, 1.5, 0.5, 0.5
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
-2.866269, -2, -6.998173,
-2.866269, 4, -6.998173,
-2.866269, -2, -6.998173,
-3.017952, -2, -7.312389,
-2.866269, 0, -6.998173,
-3.017952, 0, -7.312389,
-2.866269, 2, -6.998173,
-3.017952, 2, -7.312389,
-2.866269, 4, -6.998173,
-3.017952, 4, -7.312389
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
"0",
"2",
"4"
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
-3.321317, -2, -7.940823, 0, -0.5, 0.5, 0.5,
-3.321317, -2, -7.940823, 1, -0.5, 0.5, 0.5,
-3.321317, -2, -7.940823, 1, 1.5, 0.5, 0.5,
-3.321317, -2, -7.940823, 0, 1.5, 0.5, 0.5,
-3.321317, 0, -7.940823, 0, -0.5, 0.5, 0.5,
-3.321317, 0, -7.940823, 1, -0.5, 0.5, 0.5,
-3.321317, 0, -7.940823, 1, 1.5, 0.5, 0.5,
-3.321317, 0, -7.940823, 0, 1.5, 0.5, 0.5,
-3.321317, 2, -7.940823, 0, -0.5, 0.5, 0.5,
-3.321317, 2, -7.940823, 1, -0.5, 0.5, 0.5,
-3.321317, 2, -7.940823, 1, 1.5, 0.5, 0.5,
-3.321317, 2, -7.940823, 0, 1.5, 0.5, 0.5,
-3.321317, 4, -7.940823, 0, -0.5, 0.5, 0.5,
-3.321317, 4, -7.940823, 1, -0.5, 0.5, 0.5,
-3.321317, 4, -7.940823, 1, 1.5, 0.5, 0.5,
-3.321317, 4, -7.940823, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.866269, -3.510838, -6,
-2.866269, -3.510838, 4,
-2.866269, -3.510838, -6,
-3.017952, -3.704126, -6,
-2.866269, -3.510838, -4,
-3.017952, -3.704126, -4,
-2.866269, -3.510838, -2,
-3.017952, -3.704126, -2,
-2.866269, -3.510838, 0,
-3.017952, -3.704126, 0,
-2.866269, -3.510838, 2,
-3.017952, -3.704126, 2,
-2.866269, -3.510838, 4,
-3.017952, -3.704126, 4
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
"-6",
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
-3.321317, -4.090703, -6, 0, -0.5, 0.5, 0.5,
-3.321317, -4.090703, -6, 1, -0.5, 0.5, 0.5,
-3.321317, -4.090703, -6, 1, 1.5, 0.5, 0.5,
-3.321317, -4.090703, -6, 0, 1.5, 0.5, 0.5,
-3.321317, -4.090703, -4, 0, -0.5, 0.5, 0.5,
-3.321317, -4.090703, -4, 1, -0.5, 0.5, 0.5,
-3.321317, -4.090703, -4, 1, 1.5, 0.5, 0.5,
-3.321317, -4.090703, -4, 0, 1.5, 0.5, 0.5,
-3.321317, -4.090703, -2, 0, -0.5, 0.5, 0.5,
-3.321317, -4.090703, -2, 1, -0.5, 0.5, 0.5,
-3.321317, -4.090703, -2, 1, 1.5, 0.5, 0.5,
-3.321317, -4.090703, -2, 0, 1.5, 0.5, 0.5,
-3.321317, -4.090703, 0, 0, -0.5, 0.5, 0.5,
-3.321317, -4.090703, 0, 1, -0.5, 0.5, 0.5,
-3.321317, -4.090703, 0, 1, 1.5, 0.5, 0.5,
-3.321317, -4.090703, 0, 0, 1.5, 0.5, 0.5,
-3.321317, -4.090703, 2, 0, -0.5, 0.5, 0.5,
-3.321317, -4.090703, 2, 1, -0.5, 0.5, 0.5,
-3.321317, -4.090703, 2, 1, 1.5, 0.5, 0.5,
-3.321317, -4.090703, 2, 0, 1.5, 0.5, 0.5,
-3.321317, -4.090703, 4, 0, -0.5, 0.5, 0.5,
-3.321317, -4.090703, 4, 1, -0.5, 0.5, 0.5,
-3.321317, -4.090703, 4, 1, 1.5, 0.5, 0.5,
-3.321317, -4.090703, 4, 0, 1.5, 0.5, 0.5
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
-2.866269, -3.510838, -6.998173,
-2.866269, 4.220705, -6.998173,
-2.866269, -3.510838, 5.570493,
-2.866269, 4.220705, 5.570493,
-2.866269, -3.510838, -6.998173,
-2.866269, -3.510838, 5.570493,
-2.866269, 4.220705, -6.998173,
-2.866269, 4.220705, 5.570493,
-2.866269, -3.510838, -6.998173,
3.201043, -3.510838, -6.998173,
-2.866269, -3.510838, 5.570493,
3.201043, -3.510838, 5.570493,
-2.866269, 4.220705, -6.998173,
3.201043, 4.220705, -6.998173,
-2.866269, 4.220705, 5.570493,
3.201043, 4.220705, 5.570493,
3.201043, -3.510838, -6.998173,
3.201043, 4.220705, -6.998173,
3.201043, -3.510838, 5.570493,
3.201043, 4.220705, 5.570493,
3.201043, -3.510838, -6.998173,
3.201043, -3.510838, 5.570493,
3.201043, 4.220705, -6.998173,
3.201043, 4.220705, 5.570493
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
var radius = 8.519633;
var distance = 37.90481;
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
mvMatrix.translate( -0.1673871, -0.3549336, 0.7138398 );
mvMatrix.scale( 1.518233, 1.19143, 0.7329015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.90481);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
O-methyl_oxime<-read.table("O-methyl_oxime.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-O-methyl_oxime$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-methyl_oxime$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-methyl_oxime$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-2.77791, 0.8638568, -0.1839942, 0, 0, 1, 1, 1,
-2.586907, -1.106863, -2.129615, 1, 0, 0, 1, 1,
-2.552792, -0.2273329, -2.491593, 1, 0, 0, 1, 1,
-2.444704, -0.6010647, -1.923001, 1, 0, 0, 1, 1,
-2.404929, 0.692381, 0.2740624, 1, 0, 0, 1, 1,
-2.384236, 1.457355, 0.3439405, 1, 0, 0, 1, 1,
-2.355838, -0.425735, -0.03566745, 0, 0, 0, 1, 1,
-2.255829, 2.556947, -1.298122, 0, 0, 0, 1, 1,
-2.234547, 0.6512311, -0.9650456, 0, 0, 0, 1, 1,
-2.21693, 0.5916055, -1.440245, 0, 0, 0, 1, 1,
-2.179225, -1.28112, -2.528479, 0, 0, 0, 1, 1,
-2.166798, -2.510095, -2.591722, 0, 0, 0, 1, 1,
-2.139786, -0.7730101, -2.071575, 0, 0, 0, 1, 1,
-2.080745, -0.03610665, -1.46196, 1, 1, 1, 1, 1,
-2.053837, -0.4792523, -1.556122, 1, 1, 1, 1, 1,
-2.048843, -0.09936503, -2.170404, 1, 1, 1, 1, 1,
-2.045151, 0.07918858, -0.7870189, 1, 1, 1, 1, 1,
-2.007269, 1.047582, 0.6033701, 1, 1, 1, 1, 1,
-1.992755, -0.004357811, -1.071182, 1, 1, 1, 1, 1,
-1.979643, 0.1092271, -1.720879, 1, 1, 1, 1, 1,
-1.972326, 1.392957, -2.434656, 1, 1, 1, 1, 1,
-1.96245, -0.3393038, -2.842195, 1, 1, 1, 1, 1,
-1.961991, -0.957802, -1.834124, 1, 1, 1, 1, 1,
-1.93168, -0.7707516, -0.9242858, 1, 1, 1, 1, 1,
-1.901434, -1.791737, -2.70507, 1, 1, 1, 1, 1,
-1.899769, -0.08468165, -1.218642, 1, 1, 1, 1, 1,
-1.874244, -1.292129, -1.408878, 1, 1, 1, 1, 1,
-1.860365, 1.687479, -0.1493447, 1, 1, 1, 1, 1,
-1.856218, 1.20256, -1.03968, 0, 0, 1, 1, 1,
-1.851739, 0.9926507, -1.170841, 1, 0, 0, 1, 1,
-1.843989, 0.06904152, -2.046697, 1, 0, 0, 1, 1,
-1.835135, -0.4078069, -1.816936, 1, 0, 0, 1, 1,
-1.821978, -0.6224715, -3.512384, 1, 0, 0, 1, 1,
-1.818422, 0.9875306, -2.028084, 1, 0, 0, 1, 1,
-1.81628, -0.5434217, -2.034647, 0, 0, 0, 1, 1,
-1.81114, 0.7285756, -2.286193, 0, 0, 0, 1, 1,
-1.797732, 0.3275753, 0.02480368, 0, 0, 0, 1, 1,
-1.789539, 0.5996076, -2.850548, 0, 0, 0, 1, 1,
-1.781508, 0.05605134, -2.742674, 0, 0, 0, 1, 1,
-1.756445, -1.038975, -2.889423, 0, 0, 0, 1, 1,
-1.755885, 1.285861, -0.3704605, 0, 0, 0, 1, 1,
-1.750585, 0.8151522, -2.414022, 1, 1, 1, 1, 1,
-1.741211, 0.2316297, -1.625055, 1, 1, 1, 1, 1,
-1.740962, 0.3314155, -2.826797, 1, 1, 1, 1, 1,
-1.738113, -1.701752, -0.7452809, 1, 1, 1, 1, 1,
-1.722109, 0.4328219, -0.9546239, 1, 1, 1, 1, 1,
-1.717986, 0.5461707, 0.06247487, 1, 1, 1, 1, 1,
-1.701544, -0.1342114, -1.797376, 1, 1, 1, 1, 1,
-1.697248, -1.906159, -1.677447, 1, 1, 1, 1, 1,
-1.689826, 0.7474416, 0.02643955, 1, 1, 1, 1, 1,
-1.684991, 0.08334855, -2.188566, 1, 1, 1, 1, 1,
-1.640664, 1.211892, -0.1513924, 1, 1, 1, 1, 1,
-1.639165, -0.2866454, -2.484786, 1, 1, 1, 1, 1,
-1.638287, 0.4356901, -1.617119, 1, 1, 1, 1, 1,
-1.607215, 1.930735, -0.8332474, 1, 1, 1, 1, 1,
-1.593918, 0.09053344, -0.8726352, 1, 1, 1, 1, 1,
-1.589797, 0.1222747, -1.377699, 0, 0, 1, 1, 1,
-1.583787, -0.7317593, -2.614826, 1, 0, 0, 1, 1,
-1.58028, 0.6946609, -1.548572, 1, 0, 0, 1, 1,
-1.573782, 0.4366851, -0.5564805, 1, 0, 0, 1, 1,
-1.563855, -1.810997, -1.732779, 1, 0, 0, 1, 1,
-1.561291, -0.539516, 0.05485848, 1, 0, 0, 1, 1,
-1.546936, 0.6314965, -1.267509, 0, 0, 0, 1, 1,
-1.521277, -1.991171, -3.214026, 0, 0, 0, 1, 1,
-1.510702, -1.740515, -2.805451, 0, 0, 0, 1, 1,
-1.507403, 0.8875856, -1.283395, 0, 0, 0, 1, 1,
-1.506705, 0.2513742, -1.586404, 0, 0, 0, 1, 1,
-1.500519, 0.3235801, -1.569849, 0, 0, 0, 1, 1,
-1.490967, -0.2301201, -2.282641, 0, 0, 0, 1, 1,
-1.490275, 1.251344, 0.5256495, 1, 1, 1, 1, 1,
-1.482785, 0.0931922, -2.997519, 1, 1, 1, 1, 1,
-1.471283, 0.1424314, -0.2528667, 1, 1, 1, 1, 1,
-1.463972, 0.6974267, 1.084957, 1, 1, 1, 1, 1,
-1.460807, 0.3951132, -0.9339814, 1, 1, 1, 1, 1,
-1.459327, -0.306459, -1.796818, 1, 1, 1, 1, 1,
-1.458999, -0.8102481, -1.362887, 1, 1, 1, 1, 1,
-1.451209, -0.0952567, -1.823833, 1, 1, 1, 1, 1,
-1.442722, 0.6898479, -1.015552, 1, 1, 1, 1, 1,
-1.44209, -1.385074, -1.766674, 1, 1, 1, 1, 1,
-1.433729, -1.0386, -6.815134, 1, 1, 1, 1, 1,
-1.431674, 0.6033222, -0.06324705, 1, 1, 1, 1, 1,
-1.41505, -0.7771668, -1.928726, 1, 1, 1, 1, 1,
-1.414001, 2.092385, -0.6035602, 1, 1, 1, 1, 1,
-1.412301, 0.3679182, -2.222156, 1, 1, 1, 1, 1,
-1.412286, 1.11365, 0.5337066, 0, 0, 1, 1, 1,
-1.39333, 1.054085, -1.271685, 1, 0, 0, 1, 1,
-1.391159, 0.05266351, 0.08937597, 1, 0, 0, 1, 1,
-1.389163, -1.440933, -3.705138, 1, 0, 0, 1, 1,
-1.378437, 0.3631759, -3.993463, 1, 0, 0, 1, 1,
-1.368636, 0.2003647, -1.489823, 1, 0, 0, 1, 1,
-1.366919, 0.04300988, -0.8166335, 0, 0, 0, 1, 1,
-1.364406, -0.5719862, -0.9650133, 0, 0, 0, 1, 1,
-1.340801, -0.4680612, -2.37672, 0, 0, 0, 1, 1,
-1.333843, 0.02226837, -2.679599, 0, 0, 0, 1, 1,
-1.332437, -2.007327, -2.46139, 0, 0, 0, 1, 1,
-1.331717, 1.723925, -0.8927767, 0, 0, 0, 1, 1,
-1.329282, -1.045089, -2.257528, 0, 0, 0, 1, 1,
-1.32783, 0.952786, -1.189955, 1, 1, 1, 1, 1,
-1.314961, -0.3291035, -2.387463, 1, 1, 1, 1, 1,
-1.309407, -0.7888955, -0.5423639, 1, 1, 1, 1, 1,
-1.300309, 0.9429386, -1.687988, 1, 1, 1, 1, 1,
-1.298945, -0.2086609, -1.809416, 1, 1, 1, 1, 1,
-1.298242, -0.5838367, -2.901083, 1, 1, 1, 1, 1,
-1.298185, -2.461497, -1.443875, 1, 1, 1, 1, 1,
-1.257372, -2.650027, -1.88306, 1, 1, 1, 1, 1,
-1.25354, -0.2251026, -0.7257649, 1, 1, 1, 1, 1,
-1.253346, 0.5004126, -1.872231, 1, 1, 1, 1, 1,
-1.249381, -0.274912, -1.328626, 1, 1, 1, 1, 1,
-1.234822, 1.055268, -1.087773, 1, 1, 1, 1, 1,
-1.233722, -0.6227272, -1.810207, 1, 1, 1, 1, 1,
-1.233061, -0.6665359, -2.023318, 1, 1, 1, 1, 1,
-1.228703, 0.4597697, -2.125866, 1, 1, 1, 1, 1,
-1.221768, -0.5301694, 0.2761063, 0, 0, 1, 1, 1,
-1.221728, 0.6191958, -2.364897, 1, 0, 0, 1, 1,
-1.214624, 0.4092593, -3.255981, 1, 0, 0, 1, 1,
-1.211957, 1.444283, -1.363807, 1, 0, 0, 1, 1,
-1.211365, 1.543354, -0.7476884, 1, 0, 0, 1, 1,
-1.197618, -0.5535488, -2.01368, 1, 0, 0, 1, 1,
-1.185404, 1.426585, 0.06809651, 0, 0, 0, 1, 1,
-1.184866, -0.9185, -1.839709, 0, 0, 0, 1, 1,
-1.184428, 0.05395432, -2.965441, 0, 0, 0, 1, 1,
-1.183413, -0.4378435, -4.34174, 0, 0, 0, 1, 1,
-1.177011, -0.7451862, -1.142571, 0, 0, 0, 1, 1,
-1.173762, 0.3381426, -1.389472, 0, 0, 0, 1, 1,
-1.173049, 1.074402, 0.484414, 0, 0, 0, 1, 1,
-1.171884, 0.6287202, -0.8661715, 1, 1, 1, 1, 1,
-1.16997, -0.531316, -2.73578, 1, 1, 1, 1, 1,
-1.1678, 0.7221099, -3.028591, 1, 1, 1, 1, 1,
-1.163569, -0.7979243, -1.369644, 1, 1, 1, 1, 1,
-1.150059, 1.645358, -2.46041, 1, 1, 1, 1, 1,
-1.148778, 0.05638631, -1.163453, 1, 1, 1, 1, 1,
-1.144696, -0.4240279, -0.9387634, 1, 1, 1, 1, 1,
-1.143127, -0.1579102, -1.82145, 1, 1, 1, 1, 1,
-1.122404, -0.6561775, -2.941403, 1, 1, 1, 1, 1,
-1.108185, 0.1018549, -2.100037, 1, 1, 1, 1, 1,
-1.104781, 0.1433029, 0.346382, 1, 1, 1, 1, 1,
-1.102189, -0.8212186, -2.957573, 1, 1, 1, 1, 1,
-1.094483, -0.09549906, -0.8384855, 1, 1, 1, 1, 1,
-1.09343, -0.3799191, -0.7480394, 1, 1, 1, 1, 1,
-1.093189, -1.400544, -3.324033, 1, 1, 1, 1, 1,
-1.081604, 0.2725668, -2.693494, 0, 0, 1, 1, 1,
-1.080456, 1.135612, -0.1438359, 1, 0, 0, 1, 1,
-1.072949, -0.3575517, -0.9252506, 1, 0, 0, 1, 1,
-1.063466, -0.03286472, -1.62937, 1, 0, 0, 1, 1,
-1.056869, 0.6812111, -1.657634, 1, 0, 0, 1, 1,
-1.044209, -1.86119, -0.1330925, 1, 0, 0, 1, 1,
-1.034915, -0.5355383, 0.3940183, 0, 0, 0, 1, 1,
-1.034265, -1.081763, -2.127551, 0, 0, 0, 1, 1,
-1.033954, 0.07577397, -1.305046, 0, 0, 0, 1, 1,
-1.032663, -1.052706, -1.663698, 0, 0, 0, 1, 1,
-1.03128, -0.259894, 0.3859343, 0, 0, 0, 1, 1,
-1.029234, 0.2572529, -1.712132, 0, 0, 0, 1, 1,
-1.026326, 0.7779573, 0.6369862, 0, 0, 0, 1, 1,
-1.02492, 0.9581454, -2.771207, 1, 1, 1, 1, 1,
-1.017871, 0.1766263, -0.5107995, 1, 1, 1, 1, 1,
-1.014623, 1.934878, -1.169701, 1, 1, 1, 1, 1,
-1.013048, -1.078321, -3.804165, 1, 1, 1, 1, 1,
-1.011171, -0.6778963, -2.815549, 1, 1, 1, 1, 1,
-1.010964, -0.4806478, -2.516222, 1, 1, 1, 1, 1,
-1.004679, -0.5009981, -2.020495, 1, 1, 1, 1, 1,
-1.003101, 0.2596874, -1.818908, 1, 1, 1, 1, 1,
-1.002665, 0.9031558, -1.627609, 1, 1, 1, 1, 1,
-1.00265, 0.6746282, -0.8207045, 1, 1, 1, 1, 1,
-0.9985352, -0.04731364, -1.834525, 1, 1, 1, 1, 1,
-0.9898456, 0.3834403, -0.915844, 1, 1, 1, 1, 1,
-0.9896424, -0.1105444, -1.454773, 1, 1, 1, 1, 1,
-0.9847239, 1.422149, -1.05861, 1, 1, 1, 1, 1,
-0.9827692, -0.9632436, -1.707666, 1, 1, 1, 1, 1,
-0.9790661, 0.5867363, -1.980033, 0, 0, 1, 1, 1,
-0.9724924, -0.9934939, -2.888332, 1, 0, 0, 1, 1,
-0.9697171, 0.1834226, -2.335507, 1, 0, 0, 1, 1,
-0.9682256, -1.275782, -1.456851, 1, 0, 0, 1, 1,
-0.9668171, 0.06493482, -1.831265, 1, 0, 0, 1, 1,
-0.9666723, 1.379185, -1.603239, 1, 0, 0, 1, 1,
-0.9573467, 1.344997, 0.5311357, 0, 0, 0, 1, 1,
-0.9539988, 0.8287516, -0.2911536, 0, 0, 0, 1, 1,
-0.9412482, -0.01249906, -0.9408157, 0, 0, 0, 1, 1,
-0.9412458, -0.05413974, -2.279113, 0, 0, 0, 1, 1,
-0.9402815, 0.4445867, -2.405818, 0, 0, 0, 1, 1,
-0.9394578, -0.01282014, 0.3855419, 0, 0, 0, 1, 1,
-0.9351321, -0.1074497, -2.686059, 0, 0, 0, 1, 1,
-0.9342721, -0.8239729, -0.7131, 1, 1, 1, 1, 1,
-0.9314456, 0.2818383, 0.1221124, 1, 1, 1, 1, 1,
-0.9299704, 0.3864512, -0.1842288, 1, 1, 1, 1, 1,
-0.9268037, 0.5650809, -1.686896, 1, 1, 1, 1, 1,
-0.9232993, 1.288062, -0.3165367, 1, 1, 1, 1, 1,
-0.917699, -1.43375, -4.000498, 1, 1, 1, 1, 1,
-0.9153691, 1.846259, -2.544377, 1, 1, 1, 1, 1,
-0.9101903, 0.1228098, -0.7143679, 1, 1, 1, 1, 1,
-0.9057447, -1.297487, -3.177878, 1, 1, 1, 1, 1,
-0.9003922, -0.6617655, -2.591559, 1, 1, 1, 1, 1,
-0.8991969, 0.2497459, -0.1411174, 1, 1, 1, 1, 1,
-0.8981233, 0.1352869, -1.183036, 1, 1, 1, 1, 1,
-0.897995, -0.1280288, -2.577312, 1, 1, 1, 1, 1,
-0.8853219, 1.874377, -0.7860441, 1, 1, 1, 1, 1,
-0.8824998, -1.320634, -2.824548, 1, 1, 1, 1, 1,
-0.881501, 0.9607944, -2.020308, 0, 0, 1, 1, 1,
-0.8806856, 1.550899, -0.7831743, 1, 0, 0, 1, 1,
-0.8773239, -1.960178, -2.863679, 1, 0, 0, 1, 1,
-0.8627822, -0.9237922, -1.75265, 1, 0, 0, 1, 1,
-0.8592664, 1.846842, -1.218121, 1, 0, 0, 1, 1,
-0.8492406, 1.632677, -1.773492, 1, 0, 0, 1, 1,
-0.8482024, -0.9380388, -2.48456, 0, 0, 0, 1, 1,
-0.8481974, -0.2203484, -1.84101, 0, 0, 0, 1, 1,
-0.8464379, 0.4239187, -0.3983525, 0, 0, 0, 1, 1,
-0.8428377, -0.1545353, -0.1175413, 0, 0, 0, 1, 1,
-0.8413401, -1.679254, -1.904314, 0, 0, 0, 1, 1,
-0.8354648, 0.9497374, -2.094978, 0, 0, 0, 1, 1,
-0.8350198, -0.03286651, -0.7431313, 0, 0, 0, 1, 1,
-0.8344131, -1.415545, -2.402378, 1, 1, 1, 1, 1,
-0.8339676, 1.496062, -0.7944498, 1, 1, 1, 1, 1,
-0.833331, -0.2649529, -0.1391039, 1, 1, 1, 1, 1,
-0.8292221, -1.468934, -2.679942, 1, 1, 1, 1, 1,
-0.8268353, 1.061243, 1.515002, 1, 1, 1, 1, 1,
-0.8242355, -0.4550912, 0.1318429, 1, 1, 1, 1, 1,
-0.8126334, 0.4568922, -0.9130216, 1, 1, 1, 1, 1,
-0.8105569, 0.6912414, -0.03682037, 1, 1, 1, 1, 1,
-0.8082157, -0.5951458, -2.5871, 1, 1, 1, 1, 1,
-0.8064384, -0.4999579, -2.8623, 1, 1, 1, 1, 1,
-0.8060049, 0.4751793, -2.352813, 1, 1, 1, 1, 1,
-0.8058307, -3.038087, -3.31465, 1, 1, 1, 1, 1,
-0.8057359, 1.397484, -0.422037, 1, 1, 1, 1, 1,
-0.8045407, -0.7640692, -1.018451, 1, 1, 1, 1, 1,
-0.8025715, 1.94465, -1.113672, 1, 1, 1, 1, 1,
-0.8006337, 1.591771, -0.441927, 0, 0, 1, 1, 1,
-0.7981744, 2.006895, 2.820148, 1, 0, 0, 1, 1,
-0.7946253, -0.4434016, -3.207623, 1, 0, 0, 1, 1,
-0.794411, 0.1549802, -1.202664, 1, 0, 0, 1, 1,
-0.7943683, -0.3288784, -2.137309, 1, 0, 0, 1, 1,
-0.7920921, -0.3255559, -2.473258, 1, 0, 0, 1, 1,
-0.7792802, -0.4768977, -2.646535, 0, 0, 0, 1, 1,
-0.7763001, -0.2256901, -1.675101, 0, 0, 0, 1, 1,
-0.7749873, 0.4634135, -1.3569, 0, 0, 0, 1, 1,
-0.7737731, 0.1351156, -3.016407, 0, 0, 0, 1, 1,
-0.7728977, 0.5645922, -1.035502, 0, 0, 0, 1, 1,
-0.7718222, -1.362657, -2.447698, 0, 0, 0, 1, 1,
-0.7638249, 0.7235924, 0.3736713, 0, 0, 0, 1, 1,
-0.7620583, -0.7271188, -1.762086, 1, 1, 1, 1, 1,
-0.7474415, -0.1628098, -2.705898, 1, 1, 1, 1, 1,
-0.7460178, 0.2461078, -0.03549774, 1, 1, 1, 1, 1,
-0.7405406, -0.4159282, -2.166912, 1, 1, 1, 1, 1,
-0.737568, 2.117674, -1.283548, 1, 1, 1, 1, 1,
-0.7350562, -0.7952156, -2.102653, 1, 1, 1, 1, 1,
-0.7337888, -1.361337, -1.806764, 1, 1, 1, 1, 1,
-0.7322915, 0.9999672, 0.3442688, 1, 1, 1, 1, 1,
-0.731928, -0.2664209, -1.173733, 1, 1, 1, 1, 1,
-0.7242956, -1.131296, -1.693882, 1, 1, 1, 1, 1,
-0.7139063, 0.4436138, -0.4686284, 1, 1, 1, 1, 1,
-0.7113144, -1.523287, -2.419352, 1, 1, 1, 1, 1,
-0.7063552, -0.5386796, -2.998267, 1, 1, 1, 1, 1,
-0.7058445, -1.320422, -1.996994, 1, 1, 1, 1, 1,
-0.704009, 0.03930278, -2.16593, 1, 1, 1, 1, 1,
-0.7022781, -0.6625868, -2.222282, 0, 0, 1, 1, 1,
-0.6968331, 0.2770658, -0.3915089, 1, 0, 0, 1, 1,
-0.6963452, 0.5659596, -0.504983, 1, 0, 0, 1, 1,
-0.690262, 0.9204913, -0.2275646, 1, 0, 0, 1, 1,
-0.689981, 0.01909014, -1.354009, 1, 0, 0, 1, 1,
-0.6854538, -1.560824, -2.911617, 1, 0, 0, 1, 1,
-0.6830771, 0.047978, -1.514441, 0, 0, 0, 1, 1,
-0.677893, -0.758711, -3.334095, 0, 0, 0, 1, 1,
-0.6764841, 1.024031, -1.060563, 0, 0, 0, 1, 1,
-0.6715929, -0.1518901, -2.368379, 0, 0, 0, 1, 1,
-0.6634516, 0.6754918, -1.096003, 0, 0, 0, 1, 1,
-0.6566991, -0.8333946, -1.331028, 0, 0, 0, 1, 1,
-0.6550159, -0.9024962, -4.0822, 0, 0, 0, 1, 1,
-0.6538799, -0.3248618, -3.654374, 1, 1, 1, 1, 1,
-0.6519824, 1.78641, 0.08875851, 1, 1, 1, 1, 1,
-0.6504254, 0.8401883, -2.29877, 1, 1, 1, 1, 1,
-0.650356, -1.346985, -2.049404, 1, 1, 1, 1, 1,
-0.6479499, 2.213585, -0.08312561, 1, 1, 1, 1, 1,
-0.6394516, -0.6443785, -1.825614, 1, 1, 1, 1, 1,
-0.637589, 0.1436161, -2.179917, 1, 1, 1, 1, 1,
-0.6292046, 0.0597901, 0.5308978, 1, 1, 1, 1, 1,
-0.6289485, -0.9767745, -4.852594, 1, 1, 1, 1, 1,
-0.6261498, -1.120282, -2.323171, 1, 1, 1, 1, 1,
-0.624613, -0.8738471, -2.572273, 1, 1, 1, 1, 1,
-0.6241715, 1.683263, -1.424857, 1, 1, 1, 1, 1,
-0.6226789, 0.1519596, -1.57318, 1, 1, 1, 1, 1,
-0.6200266, 0.3424421, -1.383305, 1, 1, 1, 1, 1,
-0.6085089, -1.098142, -3.393775, 1, 1, 1, 1, 1,
-0.6074086, -0.5765814, -3.142212, 0, 0, 1, 1, 1,
-0.6050673, -0.7506577, -3.084129, 1, 0, 0, 1, 1,
-0.602716, 1.341111, -0.6760095, 1, 0, 0, 1, 1,
-0.5978597, 1.7329, -0.6479679, 1, 0, 0, 1, 1,
-0.596784, -0.2501719, -1.899986, 1, 0, 0, 1, 1,
-0.5940654, 0.5974402, -1.629839, 1, 0, 0, 1, 1,
-0.5925454, -0.3054579, -1.599504, 0, 0, 0, 1, 1,
-0.5891705, -0.5789263, -0.8415542, 0, 0, 0, 1, 1,
-0.5887433, 1.30846, -0.8490573, 0, 0, 0, 1, 1,
-0.5808688, 0.2070026, -1.864714, 0, 0, 0, 1, 1,
-0.5800415, -0.1056889, -1.27949, 0, 0, 0, 1, 1,
-0.5796008, -1.104529, -2.433965, 0, 0, 0, 1, 1,
-0.5766916, -0.4803976, -1.334378, 0, 0, 0, 1, 1,
-0.5744454, 1.514618, 0.5670863, 1, 1, 1, 1, 1,
-0.5662069, 0.1787058, -0.7121624, 1, 1, 1, 1, 1,
-0.566159, 0.6163321, -0.2185805, 1, 1, 1, 1, 1,
-0.5643498, 0.4535153, -0.05218982, 1, 1, 1, 1, 1,
-0.5541072, 0.6204792, -0.2974555, 1, 1, 1, 1, 1,
-0.5453415, -0.7892251, -2.377623, 1, 1, 1, 1, 1,
-0.5385205, -1.946913, -1.578388, 1, 1, 1, 1, 1,
-0.5369994, 0.380782, 0.2842875, 1, 1, 1, 1, 1,
-0.5340725, -1.098755, -3.794124, 1, 1, 1, 1, 1,
-0.5301888, -3.398242, -4.316617, 1, 1, 1, 1, 1,
-0.5195956, -0.1806403, -0.03500373, 1, 1, 1, 1, 1,
-0.5172768, 2.025441, -0.2040804, 1, 1, 1, 1, 1,
-0.5109515, -1.086493, -3.005059, 1, 1, 1, 1, 1,
-0.5062923, 0.4538259, -1.275708, 1, 1, 1, 1, 1,
-0.5051559, 0.03737353, -0.1935031, 1, 1, 1, 1, 1,
-0.5040138, 0.7514559, -0.5292264, 0, 0, 1, 1, 1,
-0.5033147, -0.142871, -3.804351, 1, 0, 0, 1, 1,
-0.5006171, 1.41064, -0.8244739, 1, 0, 0, 1, 1,
-0.4991673, 0.9167416, -0.6772545, 1, 0, 0, 1, 1,
-0.4987275, 1.392365, -0.2661188, 1, 0, 0, 1, 1,
-0.4979227, 0.8219339, 0.5682713, 1, 0, 0, 1, 1,
-0.494527, -0.9646189, -2.855803, 0, 0, 0, 1, 1,
-0.4940329, 0.4008743, -0.6185327, 0, 0, 0, 1, 1,
-0.4932075, 0.729772, -0.203926, 0, 0, 0, 1, 1,
-0.4893827, 2.995617, 0.6442651, 0, 0, 0, 1, 1,
-0.4891604, -2.269487, -4.067669, 0, 0, 0, 1, 1,
-0.4889479, -0.04219298, -1.157409, 0, 0, 0, 1, 1,
-0.4864888, -2.230548, -3.424805, 0, 0, 0, 1, 1,
-0.4849602, -0.9554634, -3.240378, 1, 1, 1, 1, 1,
-0.4783191, -1.029171, -1.608492, 1, 1, 1, 1, 1,
-0.4775613, -1.648188, -3.45447, 1, 1, 1, 1, 1,
-0.4767405, -0.9316482, -2.210098, 1, 1, 1, 1, 1,
-0.4762274, 0.3035736, -1.550098, 1, 1, 1, 1, 1,
-0.4753039, 0.2133047, -2.62681, 1, 1, 1, 1, 1,
-0.4741952, -1.42437, -2.139246, 1, 1, 1, 1, 1,
-0.4658778, 0.3026538, -1.452936, 1, 1, 1, 1, 1,
-0.463346, 0.3354988, -0.9002938, 1, 1, 1, 1, 1,
-0.4632964, 0.2289237, -1.261045, 1, 1, 1, 1, 1,
-0.4615903, -1.136849, -3.634888, 1, 1, 1, 1, 1,
-0.4574695, -0.4498316, -2.761125, 1, 1, 1, 1, 1,
-0.4523552, 0.1457888, -0.5689536, 1, 1, 1, 1, 1,
-0.4503134, 1.629598, 0.617074, 1, 1, 1, 1, 1,
-0.4492897, 1.063576, -0.3861087, 1, 1, 1, 1, 1,
-0.4458102, 0.144052, -1.247661, 0, 0, 1, 1, 1,
-0.4448882, 0.4744417, -0.538365, 1, 0, 0, 1, 1,
-0.4445818, 1.137671, 0.4118772, 1, 0, 0, 1, 1,
-0.4427451, -0.9832155, -2.061045, 1, 0, 0, 1, 1,
-0.4421947, 0.5305711, -0.2797706, 1, 0, 0, 1, 1,
-0.4414175, -1.994045, -5.370842, 1, 0, 0, 1, 1,
-0.4368178, -0.2558682, -2.914769, 0, 0, 0, 1, 1,
-0.4298802, -1.997857, -2.498432, 0, 0, 0, 1, 1,
-0.4258636, 0.4524387, -0.5850009, 0, 0, 0, 1, 1,
-0.4247804, 1.18492, 2.431763, 0, 0, 0, 1, 1,
-0.4227971, 0.7816058, -0.9874485, 0, 0, 0, 1, 1,
-0.4218421, -0.6775244, -2.251729, 0, 0, 0, 1, 1,
-0.4080544, 0.718622, -0.3124337, 0, 0, 0, 1, 1,
-0.4073839, -1.921648, -1.258534, 1, 1, 1, 1, 1,
-0.406517, 2.541265, -2.454886, 1, 1, 1, 1, 1,
-0.4052805, -0.7696891, -1.609871, 1, 1, 1, 1, 1,
-0.4048587, -0.2617397, -3.477373, 1, 1, 1, 1, 1,
-0.3994265, 2.653299, 0.578787, 1, 1, 1, 1, 1,
-0.3983942, -0.03616666, -0.6402, 1, 1, 1, 1, 1,
-0.3955154, 0.4811718, 0.9413884, 1, 1, 1, 1, 1,
-0.3944073, 1.478869, -0.9100955, 1, 1, 1, 1, 1,
-0.3924832, 0.9255803, -1.331754, 1, 1, 1, 1, 1,
-0.3909984, 0.42439, -1.474373, 1, 1, 1, 1, 1,
-0.3883782, 2.532604, 1.342095, 1, 1, 1, 1, 1,
-0.383, 0.09531064, -2.093825, 1, 1, 1, 1, 1,
-0.3786306, 0.511066, -1.824062, 1, 1, 1, 1, 1,
-0.3697713, -0.06979066, -1.458514, 1, 1, 1, 1, 1,
-0.3688523, -0.2820494, -2.351334, 1, 1, 1, 1, 1,
-0.3672832, 0.4336715, -1.789879, 0, 0, 1, 1, 1,
-0.3620127, 0.9025885, -0.5839123, 1, 0, 0, 1, 1,
-0.3556193, -1.287823, -1.653456, 1, 0, 0, 1, 1,
-0.3547497, -0.8201368, -5.041109, 1, 0, 0, 1, 1,
-0.3515454, 1.661959, -0.7301015, 1, 0, 0, 1, 1,
-0.3510793, 1.726348, 0.1424738, 1, 0, 0, 1, 1,
-0.3498861, 0.7387672, -1.718896, 0, 0, 0, 1, 1,
-0.3497669, 2.051829, -0.5309711, 0, 0, 0, 1, 1,
-0.3456345, -0.541893, -4.76231, 0, 0, 0, 1, 1,
-0.3361931, -1.599019, -2.879749, 0, 0, 0, 1, 1,
-0.3338429, 0.2241601, -0.1226866, 0, 0, 0, 1, 1,
-0.3325759, -1.625626, -3.380319, 0, 0, 0, 1, 1,
-0.3267335, 0.001522359, -2.724406, 0, 0, 0, 1, 1,
-0.3190985, 0.3127304, -0.8347593, 1, 1, 1, 1, 1,
-0.3171058, -0.2582003, -2.04021, 1, 1, 1, 1, 1,
-0.3167461, -2.316194, -2.145182, 1, 1, 1, 1, 1,
-0.3127188, 0.5077586, 0.3157417, 1, 1, 1, 1, 1,
-0.3087151, -0.2514535, -3.212388, 1, 1, 1, 1, 1,
-0.3066608, 0.59875, 0.4559231, 1, 1, 1, 1, 1,
-0.3043036, 0.06109274, -1.501825, 1, 1, 1, 1, 1,
-0.3034604, 0.6359092, -0.3946216, 1, 1, 1, 1, 1,
-0.3030293, 1.093074, 1.232828, 1, 1, 1, 1, 1,
-0.2940706, 0.7081854, 0.04842807, 1, 1, 1, 1, 1,
-0.293714, -0.8749679, -2.705472, 1, 1, 1, 1, 1,
-0.2935708, 0.6201777, -0.2369315, 1, 1, 1, 1, 1,
-0.2926441, -1.42872, -2.966466, 1, 1, 1, 1, 1,
-0.2884566, -0.2784439, -3.251303, 1, 1, 1, 1, 1,
-0.2833564, -0.3937956, -2.276584, 1, 1, 1, 1, 1,
-0.2819476, 0.98987, 0.607875, 0, 0, 1, 1, 1,
-0.2781043, -1.862558, -1.687883, 1, 0, 0, 1, 1,
-0.2780541, -0.6159809, -2.96888, 1, 0, 0, 1, 1,
-0.2713057, 0.6428533, -0.3935888, 1, 0, 0, 1, 1,
-0.2710979, -0.6813228, -2.939347, 1, 0, 0, 1, 1,
-0.2680816, -1.142339, -4.400265, 1, 0, 0, 1, 1,
-0.263681, 1.197612, 0.2076637, 0, 0, 0, 1, 1,
-0.2631862, -0.7406371, -2.872341, 0, 0, 0, 1, 1,
-0.2626518, -0.2860781, -1.913642, 0, 0, 0, 1, 1,
-0.2552648, 0.4401958, -0.8977358, 0, 0, 0, 1, 1,
-0.2537167, 1.072963, 0.5706295, 0, 0, 0, 1, 1,
-0.2526315, -0.416155, -4.053322, 0, 0, 0, 1, 1,
-0.2415175, -0.5808675, -3.694909, 0, 0, 0, 1, 1,
-0.2400527, -0.3879628, -1.861824, 1, 1, 1, 1, 1,
-0.2373753, 0.6224343, -0.8458888, 1, 1, 1, 1, 1,
-0.2363248, 1.256749, 0.7426703, 1, 1, 1, 1, 1,
-0.2325391, -0.216292, -4.04657, 1, 1, 1, 1, 1,
-0.2315858, -0.8839159, -1.146471, 1, 1, 1, 1, 1,
-0.2268081, -0.1624743, -3.536453, 1, 1, 1, 1, 1,
-0.2267879, 0.9988934, -0.4268663, 1, 1, 1, 1, 1,
-0.221875, -0.2356563, -0.9060945, 1, 1, 1, 1, 1,
-0.2162651, 1.508382, -0.409261, 1, 1, 1, 1, 1,
-0.2116617, 1.215704, 0.5188596, 1, 1, 1, 1, 1,
-0.2113708, 2.011878, 0.5305684, 1, 1, 1, 1, 1,
-0.2090001, 0.6830727, -0.8722118, 1, 1, 1, 1, 1,
-0.2082884, -0.04747514, -1.531461, 1, 1, 1, 1, 1,
-0.2043266, 0.4373968, 0.6216567, 1, 1, 1, 1, 1,
-0.1934418, 0.8452396, -0.5973654, 1, 1, 1, 1, 1,
-0.1923922, -0.4455979, -1.937438, 0, 0, 1, 1, 1,
-0.1864276, 1.578126, -1.159472, 1, 0, 0, 1, 1,
-0.186117, -0.5049088, -1.69405, 1, 0, 0, 1, 1,
-0.1847421, 0.8816789, -1.7586, 1, 0, 0, 1, 1,
-0.1763239, -0.4888253, -1.619615, 1, 0, 0, 1, 1,
-0.1761627, 1.180565, -0.3469594, 1, 0, 0, 1, 1,
-0.1743789, 1.722141, -1.574879, 0, 0, 0, 1, 1,
-0.1698116, -0.08010568, -2.494427, 0, 0, 0, 1, 1,
-0.1692025, 0.1589831, -1.378114, 0, 0, 0, 1, 1,
-0.1688828, -1.451514, -3.352766, 0, 0, 0, 1, 1,
-0.163804, -1.289122, -2.252406, 0, 0, 0, 1, 1,
-0.161489, 0.1346736, -0.4706385, 0, 0, 0, 1, 1,
-0.1585421, 0.739971, -0.8860229, 0, 0, 0, 1, 1,
-0.1525867, -0.1394602, -2.09082, 1, 1, 1, 1, 1,
-0.1500682, 0.6368512, -1.101754, 1, 1, 1, 1, 1,
-0.1500596, 0.9553553, -0.004886258, 1, 1, 1, 1, 1,
-0.1500203, -1.085671, -1.960142, 1, 1, 1, 1, 1,
-0.146179, 1.47366, -1.085271, 1, 1, 1, 1, 1,
-0.1447208, 2.736717, -0.7103329, 1, 1, 1, 1, 1,
-0.1343505, -0.9395028, -3.868951, 1, 1, 1, 1, 1,
-0.1339312, -0.4430116, -1.923851, 1, 1, 1, 1, 1,
-0.1325272, 0.3139883, -0.3526444, 1, 1, 1, 1, 1,
-0.1278221, -0.3982969, -2.10471, 1, 1, 1, 1, 1,
-0.1240504, 0.1361268, -2.951962, 1, 1, 1, 1, 1,
-0.1176849, 0.9357483, 0.1743391, 1, 1, 1, 1, 1,
-0.1156634, -0.7880431, -4.384315, 1, 1, 1, 1, 1,
-0.1132698, -0.02574868, -1.302721, 1, 1, 1, 1, 1,
-0.1125047, 0.6136042, 0.7940412, 1, 1, 1, 1, 1,
-0.1123226, -0.7453173, -4.822301, 0, 0, 1, 1, 1,
-0.1100531, 0.5711918, -0.985694, 1, 0, 0, 1, 1,
-0.1095937, -0.7070863, -2.015232, 1, 0, 0, 1, 1,
-0.1086031, 0.9525236, -0.09347022, 1, 0, 0, 1, 1,
-0.1055433, -0.2930245, -2.240084, 1, 0, 0, 1, 1,
-0.1044556, 0.6782848, -1.12485, 1, 0, 0, 1, 1,
-0.09707834, 0.5825763, -0.525101, 0, 0, 0, 1, 1,
-0.0965246, -0.7487262, -1.649503, 0, 0, 0, 1, 1,
-0.09592901, -0.0247029, -2.335181, 0, 0, 0, 1, 1,
-0.09270206, 1.880114, -0.1093909, 0, 0, 0, 1, 1,
-0.09182727, 0.2858078, 0.5733365, 0, 0, 0, 1, 1,
-0.08970638, 0.9309971, -0.9169146, 0, 0, 0, 1, 1,
-0.08783319, -1.71823, -2.893124, 0, 0, 0, 1, 1,
-0.08624937, 1.233675, -0.7601555, 1, 1, 1, 1, 1,
-0.08575846, 1.036044, -1.158973, 1, 1, 1, 1, 1,
-0.07640345, 0.2799763, 1.239621, 1, 1, 1, 1, 1,
-0.07282678, 0.9640388, -0.8221644, 1, 1, 1, 1, 1,
-0.06980441, 0.8363786, 0.03770372, 1, 1, 1, 1, 1,
-0.06936522, -1.177487, -2.590086, 1, 1, 1, 1, 1,
-0.06269287, 1.390537, 0.9186611, 1, 1, 1, 1, 1,
-0.06086713, 0.424111, 0.1686728, 1, 1, 1, 1, 1,
-0.06034223, -0.5826558, -4.494691, 1, 1, 1, 1, 1,
-0.05974146, 0.1796996, -0.9864639, 1, 1, 1, 1, 1,
-0.05740632, -0.7618671, -1.816177, 1, 1, 1, 1, 1,
-0.05522243, -0.1799656, -1.795964, 1, 1, 1, 1, 1,
-0.05265785, 0.8157504, -0.6497971, 1, 1, 1, 1, 1,
-0.04737209, 0.1155187, -0.7731285, 1, 1, 1, 1, 1,
-0.04434801, 0.1880611, -0.4571564, 1, 1, 1, 1, 1,
-0.04177408, 0.498838, -1.850045, 0, 0, 1, 1, 1,
-0.0411434, 1.439162, -0.4805053, 1, 0, 0, 1, 1,
-0.03526687, -0.8744571, -2.035073, 1, 0, 0, 1, 1,
-0.03421775, 1.007945, 0.9037864, 1, 0, 0, 1, 1,
-0.03318973, -0.7133385, -1.974709, 1, 0, 0, 1, 1,
-0.03152765, 1.477273, -0.6814637, 1, 0, 0, 1, 1,
-0.02985361, 0.8290089, -1.505682, 0, 0, 0, 1, 1,
-0.02666999, -0.6989806, -4.745337, 0, 0, 0, 1, 1,
-0.02638497, 0.905108, -0.8635788, 0, 0, 0, 1, 1,
-0.02249382, -1.263731, -1.881343, 0, 0, 0, 1, 1,
-0.01698977, 0.8844625, 0.1880289, 0, 0, 0, 1, 1,
-0.01286926, -2.636895, -3.845016, 0, 0, 0, 1, 1,
-0.01208734, 0.001987694, -1.533591, 0, 0, 0, 1, 1,
-0.01051437, -0.2858809, -3.438639, 1, 1, 1, 1, 1,
-0.006344892, -0.5324163, -2.836616, 1, 1, 1, 1, 1,
0.0009322721, 0.1223488, 0.91197, 1, 1, 1, 1, 1,
0.004164432, -1.495974, 4.305828, 1, 1, 1, 1, 1,
0.005765925, -0.9939858, 4.091516, 1, 1, 1, 1, 1,
0.008390415, -0.6780793, 4.455444, 1, 1, 1, 1, 1,
0.008904728, -0.4060033, 3.500065, 1, 1, 1, 1, 1,
0.01027297, 0.5692511, -0.09892045, 1, 1, 1, 1, 1,
0.01137355, -0.8416051, 2.971079, 1, 1, 1, 1, 1,
0.01225922, -0.08346934, 2.402329, 1, 1, 1, 1, 1,
0.01726, 0.07795338, -0.2230849, 1, 1, 1, 1, 1,
0.02217091, -2.236939, 2.375505, 1, 1, 1, 1, 1,
0.02372168, -0.04371812, 3.514508, 1, 1, 1, 1, 1,
0.02437122, -0.2322219, 4.069383, 1, 1, 1, 1, 1,
0.0267354, 0.929727, -0.09619547, 1, 1, 1, 1, 1,
0.02689525, 0.04327201, 7.75435e-05, 0, 0, 1, 1, 1,
0.02864772, 1.638877, -0.4097994, 1, 0, 0, 1, 1,
0.03439875, 2.734426, -0.3584501, 1, 0, 0, 1, 1,
0.03685433, -0.1686238, 2.34943, 1, 0, 0, 1, 1,
0.03763995, -1.113344, 3.809228, 1, 0, 0, 1, 1,
0.0377554, -0.1930857, 2.110231, 1, 0, 0, 1, 1,
0.03806205, 0.4995983, 0.2196419, 0, 0, 0, 1, 1,
0.03971702, -1.136156, 2.834135, 0, 0, 0, 1, 1,
0.04992757, 1.078964, 0.7458627, 0, 0, 0, 1, 1,
0.0508946, 0.559555, 0.3363876, 0, 0, 0, 1, 1,
0.05555394, -0.3570808, 4.030936, 0, 0, 0, 1, 1,
0.05703653, -0.1679003, 2.99979, 0, 0, 0, 1, 1,
0.05786874, -0.7735696, 3.223599, 0, 0, 0, 1, 1,
0.05949504, -1.077874, 2.928115, 1, 1, 1, 1, 1,
0.06204764, 1.200468, 1.153785, 1, 1, 1, 1, 1,
0.06403577, -0.6912448, 0.9283137, 1, 1, 1, 1, 1,
0.0644009, 0.693791, -0.7017988, 1, 1, 1, 1, 1,
0.06521562, 1.034067, -0.6077572, 1, 1, 1, 1, 1,
0.06564152, 0.3057612, -0.3891183, 1, 1, 1, 1, 1,
0.06698998, -1.248631, 2.838713, 1, 1, 1, 1, 1,
0.06905462, 0.9080035, 0.6761815, 1, 1, 1, 1, 1,
0.07173175, 0.3433399, -1.007221, 1, 1, 1, 1, 1,
0.07343663, 1.080328, -1.069501, 1, 1, 1, 1, 1,
0.07753778, 1.787558, 0.2605002, 1, 1, 1, 1, 1,
0.07775726, 1.874108, -0.5084186, 1, 1, 1, 1, 1,
0.08305486, 0.4314943, 1.242609, 1, 1, 1, 1, 1,
0.08367535, -0.602378, 2.403376, 1, 1, 1, 1, 1,
0.08994666, 0.5050142, 2.461197, 1, 1, 1, 1, 1,
0.09576946, -0.2598456, 2.47888, 0, 0, 1, 1, 1,
0.0975833, -0.2106692, 0.3907321, 1, 0, 0, 1, 1,
0.09993079, -0.8710678, 2.949673, 1, 0, 0, 1, 1,
0.1008059, 1.068464, 0.3707529, 1, 0, 0, 1, 1,
0.1029248, -0.7301129, 3.152433, 1, 0, 0, 1, 1,
0.1055072, -0.7483093, 1.257489, 1, 0, 0, 1, 1,
0.1111661, 0.97994, -1.460169, 0, 0, 0, 1, 1,
0.1133739, 0.6848378, 0.2327182, 0, 0, 0, 1, 1,
0.1153411, 0.5071681, -0.2855571, 0, 0, 0, 1, 1,
0.1155605, -0.3166682, 3.979089, 0, 0, 0, 1, 1,
0.1160926, 1.166289, 2.031549, 0, 0, 0, 1, 1,
0.122201, 0.6687562, 0.5871511, 0, 0, 0, 1, 1,
0.1246834, 0.8435167, -1.14815, 0, 0, 0, 1, 1,
0.1247555, 0.4629802, 2.701064, 1, 1, 1, 1, 1,
0.1268628, -1.058915, 4.571597, 1, 1, 1, 1, 1,
0.1322979, -0.5372748, 3.028372, 1, 1, 1, 1, 1,
0.1370928, 0.1532193, 0.2667225, 1, 1, 1, 1, 1,
0.1418592, 0.4992651, 0.2048445, 1, 1, 1, 1, 1,
0.1462792, 0.9048725, -0.2738858, 1, 1, 1, 1, 1,
0.147837, 1.487633, 1.512056, 1, 1, 1, 1, 1,
0.1503154, -0.7838646, 2.889904, 1, 1, 1, 1, 1,
0.1554983, -1.163154, 2.60041, 1, 1, 1, 1, 1,
0.1559115, -0.6235418, 1.405896, 1, 1, 1, 1, 1,
0.1568083, -1.414865, 4.421841, 1, 1, 1, 1, 1,
0.1579192, 1.146405, 0.2072399, 1, 1, 1, 1, 1,
0.1584517, -2.536009, 2.503511, 1, 1, 1, 1, 1,
0.1592595, -0.5454739, 2.693011, 1, 1, 1, 1, 1,
0.1599078, 2.160695, 1.647833, 1, 1, 1, 1, 1,
0.1660298, -0.7422189, 3.618963, 0, 0, 1, 1, 1,
0.1662844, -1.836092, 4.269953, 1, 0, 0, 1, 1,
0.1688612, -1.374808, 4.081111, 1, 0, 0, 1, 1,
0.169773, 0.3428574, 0.21917, 1, 0, 0, 1, 1,
0.1711487, -0.2102123, 2.200394, 1, 0, 0, 1, 1,
0.1719984, 0.9395963, 1.755484, 1, 0, 0, 1, 1,
0.175638, -0.07757289, 1.364956, 0, 0, 0, 1, 1,
0.1769312, 0.5988309, -0.6206889, 0, 0, 0, 1, 1,
0.177275, -0.9818608, 2.085963, 0, 0, 0, 1, 1,
0.1818895, -2.10403, 1.091104, 0, 0, 0, 1, 1,
0.1842456, -0.8304846, 3.521221, 0, 0, 0, 1, 1,
0.1862334, 1.603459, 0.2491411, 0, 0, 0, 1, 1,
0.1866377, -0.2753203, 4.151006, 0, 0, 0, 1, 1,
0.1912667, 1.697424, -1.044621, 1, 1, 1, 1, 1,
0.1989505, 1.150076, -1.734457, 1, 1, 1, 1, 1,
0.1995578, -1.507827, 4.269385, 1, 1, 1, 1, 1,
0.204809, -1.545313, 5.387455, 1, 1, 1, 1, 1,
0.2104404, -1.029711, 2.277389, 1, 1, 1, 1, 1,
0.2110981, -0.4164422, 0.5597531, 1, 1, 1, 1, 1,
0.2122326, 0.3242404, 1.531839, 1, 1, 1, 1, 1,
0.213223, -0.2505085, 3.857632, 1, 1, 1, 1, 1,
0.2153412, 0.004411651, 1.183012, 1, 1, 1, 1, 1,
0.2207949, 1.03832, -0.2725776, 1, 1, 1, 1, 1,
0.2224173, 1.151147, 0.6175317, 1, 1, 1, 1, 1,
0.2233732, 0.1801047, 0.2509066, 1, 1, 1, 1, 1,
0.2293341, -0.6827766, 4.058352, 1, 1, 1, 1, 1,
0.23128, -0.3153279, 1.011603, 1, 1, 1, 1, 1,
0.2337572, 1.726864, 0.1508042, 1, 1, 1, 1, 1,
0.2383429, -0.1427916, 0.6671078, 0, 0, 1, 1, 1,
0.2401471, 1.234015, -0.6861961, 1, 0, 0, 1, 1,
0.2401487, -0.5759032, 3.136665, 1, 0, 0, 1, 1,
0.2409306, 0.7282476, -0.894287, 1, 0, 0, 1, 1,
0.2420121, -0.2814409, 2.830867, 1, 0, 0, 1, 1,
0.244437, -0.8950437, 3.636404, 1, 0, 0, 1, 1,
0.2483818, 0.2024325, -0.1548608, 0, 0, 0, 1, 1,
0.2489861, 0.3221701, 0.21703, 0, 0, 0, 1, 1,
0.2502733, -0.6445264, 2.335393, 0, 0, 0, 1, 1,
0.2502755, -1.160438, 4.24907, 0, 0, 0, 1, 1,
0.252975, -1.73138, 2.108418, 0, 0, 0, 1, 1,
0.2564984, -1.174611, 2.39762, 0, 0, 0, 1, 1,
0.2581927, 0.2226675, 0.9888975, 0, 0, 0, 1, 1,
0.2601377, -0.144786, 1.097993, 1, 1, 1, 1, 1,
0.2618852, 0.4589004, 0.8027211, 1, 1, 1, 1, 1,
0.263934, 0.3726462, 0.4359527, 1, 1, 1, 1, 1,
0.2656487, -0.1745567, 3.594954, 1, 1, 1, 1, 1,
0.2698044, -0.6258363, 3.226754, 1, 1, 1, 1, 1,
0.2739732, -1.37108, 3.439439, 1, 1, 1, 1, 1,
0.2758192, 0.08688962, 1.660483, 1, 1, 1, 1, 1,
0.2812812, -0.6133577, 3.677015, 1, 1, 1, 1, 1,
0.2873359, 0.396158, 0.1645812, 1, 1, 1, 1, 1,
0.289836, -0.1287457, 2.216361, 1, 1, 1, 1, 1,
0.2908356, -1.788414, 2.145171, 1, 1, 1, 1, 1,
0.292226, -1.087721, 2.342955, 1, 1, 1, 1, 1,
0.2962344, -0.6254283, 0.5834405, 1, 1, 1, 1, 1,
0.2964432, -1.723925, 2.241517, 1, 1, 1, 1, 1,
0.2982025, 0.6694349, 1.293651, 1, 1, 1, 1, 1,
0.2988264, -2.187269, 4.779767, 0, 0, 1, 1, 1,
0.3012221, -0.6115056, 1.783552, 1, 0, 0, 1, 1,
0.3066227, -0.4792374, 2.132222, 1, 0, 0, 1, 1,
0.3103431, 1.57087, -0.3035011, 1, 0, 0, 1, 1,
0.3111482, -0.2485453, 2.025398, 1, 0, 0, 1, 1,
0.3167434, -0.3193916, 3.112365, 1, 0, 0, 1, 1,
0.3220362, 0.05419024, 3.110548, 0, 0, 0, 1, 1,
0.3240064, 1.306975, 1.20554, 0, 0, 0, 1, 1,
0.329956, 1.336954, 0.234491, 0, 0, 0, 1, 1,
0.3332744, -0.6536297, 4.105567, 0, 0, 0, 1, 1,
0.3345067, -1.230024, 3.898305, 0, 0, 0, 1, 1,
0.3349897, 1.396902, 0.542155, 0, 0, 0, 1, 1,
0.3362174, -0.3653997, 2.248511, 0, 0, 0, 1, 1,
0.337939, -0.02206686, 0.9216981, 1, 1, 1, 1, 1,
0.3390706, -1.592788, 2.908722, 1, 1, 1, 1, 1,
0.3413657, 0.01760076, 1.574347, 1, 1, 1, 1, 1,
0.3416602, 0.009788644, 2.895954, 1, 1, 1, 1, 1,
0.3471425, 0.7170318, -0.2320221, 1, 1, 1, 1, 1,
0.3492518, 0.3406265, -0.4762258, 1, 1, 1, 1, 1,
0.3513637, 0.267821, 1.381624, 1, 1, 1, 1, 1,
0.35172, -0.4475026, 2.650946, 1, 1, 1, 1, 1,
0.3604313, 1.172426, 1.173785, 1, 1, 1, 1, 1,
0.3665089, 1.657872, -0.04610444, 1, 1, 1, 1, 1,
0.3778545, -0.6219237, 2.231356, 1, 1, 1, 1, 1,
0.3800084, -0.2856616, 2.779321, 1, 1, 1, 1, 1,
0.3867691, 1.018135, 0.5552031, 1, 1, 1, 1, 1,
0.3870964, 0.3078966, 1.263142, 1, 1, 1, 1, 1,
0.3875766, -1.11736, 3.479041, 1, 1, 1, 1, 1,
0.3894665, -0.002247327, 3.118261, 0, 0, 1, 1, 1,
0.3903869, -1.818301, 3.02749, 1, 0, 0, 1, 1,
0.3921327, -1.728828, 2.997871, 1, 0, 0, 1, 1,
0.393297, 1.901557, 0.295005, 1, 0, 0, 1, 1,
0.3972071, -1.678077, 4.060697, 1, 0, 0, 1, 1,
0.405818, -0.7004061, 4.050706, 1, 0, 0, 1, 1,
0.409366, 2.142928, 0.8358347, 0, 0, 0, 1, 1,
0.4098609, -0.3324282, 2.071151, 0, 0, 0, 1, 1,
0.4161254, 0.1205861, 1.379925, 0, 0, 0, 1, 1,
0.4168292, 0.01790616, 1.073996, 0, 0, 0, 1, 1,
0.4176484, -1.082221, 4.020914, 0, 0, 0, 1, 1,
0.421085, -0.9688945, 2.690559, 0, 0, 0, 1, 1,
0.4259594, -0.9400577, 3.440636, 0, 0, 0, 1, 1,
0.4289766, -0.479569, 3.376473, 1, 1, 1, 1, 1,
0.4333664, -1.149259, 3.188495, 1, 1, 1, 1, 1,
0.4505477, 0.7445459, 1.936896, 1, 1, 1, 1, 1,
0.4539961, -0.6638691, 2.431187, 1, 1, 1, 1, 1,
0.4541307, -1.178373, 1.6771, 1, 1, 1, 1, 1,
0.4545399, 0.6910006, 0.8953939, 1, 1, 1, 1, 1,
0.4668759, 0.4102548, 0.3061644, 1, 1, 1, 1, 1,
0.4669558, -1.915478, 2.415409, 1, 1, 1, 1, 1,
0.4699273, -0.4777158, 1.090144, 1, 1, 1, 1, 1,
0.4716191, -0.4105226, 0.2895775, 1, 1, 1, 1, 1,
0.4722679, 0.3530635, 1.05318, 1, 1, 1, 1, 1,
0.4723471, 1.424487, 1.608334, 1, 1, 1, 1, 1,
0.4725201, 1.742695, 2.256455, 1, 1, 1, 1, 1,
0.4737321, 1.332754, -1.969931, 1, 1, 1, 1, 1,
0.4827348, 1.673406, -1.462073, 1, 1, 1, 1, 1,
0.4855797, 0.206374, 1.093968, 0, 0, 1, 1, 1,
0.489006, -0.691516, 2.484143, 1, 0, 0, 1, 1,
0.4963806, -0.01179752, 0.6536791, 1, 0, 0, 1, 1,
0.4974862, -0.5566582, 1.465631, 1, 0, 0, 1, 1,
0.4978119, -0.749126, 3.437968, 1, 0, 0, 1, 1,
0.497997, -0.03802228, 0.7346023, 1, 0, 0, 1, 1,
0.4986005, 0.7352992, 0.3675535, 0, 0, 0, 1, 1,
0.5028513, -0.5998048, 5.01085, 0, 0, 0, 1, 1,
0.5044991, 0.4175417, 1.048096, 0, 0, 0, 1, 1,
0.5052728, -0.4106107, 3.912904, 0, 0, 0, 1, 1,
0.5056074, 0.9539687, -0.4845913, 0, 0, 0, 1, 1,
0.5060943, -0.1948884, 1.534182, 0, 0, 0, 1, 1,
0.5065509, -0.415716, 2.017912, 0, 0, 0, 1, 1,
0.5066965, -0.06518378, 1.516246, 1, 1, 1, 1, 1,
0.5079336, 0.04260732, 1.367337, 1, 1, 1, 1, 1,
0.508564, 0.5649053, 1.713524, 1, 1, 1, 1, 1,
0.5108232, -1.230702, 3.573552, 1, 1, 1, 1, 1,
0.5170961, -0.2380414, 2.418556, 1, 1, 1, 1, 1,
0.5179561, -1.116299, 3.270066, 1, 1, 1, 1, 1,
0.5229074, 0.289112, 2.729778, 1, 1, 1, 1, 1,
0.5230703, 0.2311673, 0.9187691, 1, 1, 1, 1, 1,
0.5280534, 1.400361, -1.879945, 1, 1, 1, 1, 1,
0.5290656, 0.3881319, 0.9883226, 1, 1, 1, 1, 1,
0.5316151, -2.289247, 4.298164, 1, 1, 1, 1, 1,
0.5327746, 0.2952099, 0.160875, 1, 1, 1, 1, 1,
0.5333046, -0.5688295, 2.654571, 1, 1, 1, 1, 1,
0.537544, 1.587001, -0.3947015, 1, 1, 1, 1, 1,
0.5383824, 2.597388, 1.273106, 1, 1, 1, 1, 1,
0.5384325, -0.1141004, 1.372757, 0, 0, 1, 1, 1,
0.542505, 0.6160268, 2.779557, 1, 0, 0, 1, 1,
0.5427889, 0.5973557, -0.4441684, 1, 0, 0, 1, 1,
0.5434843, 0.2464383, 1.907552, 1, 0, 0, 1, 1,
0.5455911, 1.483593, 0.5307164, 1, 0, 0, 1, 1,
0.5473894, 0.2578158, -0.0933835, 1, 0, 0, 1, 1,
0.5478851, -0.2174389, 1.377008, 0, 0, 0, 1, 1,
0.54866, 0.5258218, 2.38179, 0, 0, 0, 1, 1,
0.5573078, 0.7592283, 0.2244949, 0, 0, 0, 1, 1,
0.5596494, 0.07829309, 1.323453, 0, 0, 0, 1, 1,
0.560679, -2.257993, 2.938076, 0, 0, 0, 1, 1,
0.5638461, -0.07523626, 1.091497, 0, 0, 0, 1, 1,
0.565062, 0.5670261, 0.7831683, 0, 0, 0, 1, 1,
0.5651476, -1.811224, 4.814653, 1, 1, 1, 1, 1,
0.567037, -2.035527, 1.132331, 1, 1, 1, 1, 1,
0.5674426, 0.311213, 1.747969, 1, 1, 1, 1, 1,
0.5682078, -0.2006707, 2.639812, 1, 1, 1, 1, 1,
0.5702633, 0.6616709, 1.346563, 1, 1, 1, 1, 1,
0.5829835, 0.6446666, 1.113357, 1, 1, 1, 1, 1,
0.5836026, -1.773455, 3.042417, 1, 1, 1, 1, 1,
0.5841032, -0.2222323, 3.375133, 1, 1, 1, 1, 1,
0.5860556, -1.985126, 1.152723, 1, 1, 1, 1, 1,
0.5869483, 1.084653, 1.537256, 1, 1, 1, 1, 1,
0.5885168, -1.295024, 2.850889, 1, 1, 1, 1, 1,
0.59522, -1.521572, 2.366247, 1, 1, 1, 1, 1,
0.6028627, -0.1034664, 2.617332, 1, 1, 1, 1, 1,
0.602936, 1.291208, 1.497553, 1, 1, 1, 1, 1,
0.6029613, 0.7886376, 0.7184985, 1, 1, 1, 1, 1,
0.6060711, 0.5994889, 0.1082559, 0, 0, 1, 1, 1,
0.607429, 1.131728, 1.076438, 1, 0, 0, 1, 1,
0.6091473, -1.144142, 2.199101, 1, 0, 0, 1, 1,
0.6147021, -0.1662729, 0.6716144, 1, 0, 0, 1, 1,
0.6183043, 0.348814, 2.264086, 1, 0, 0, 1, 1,
0.6214792, 0.1997676, 1.39236, 1, 0, 0, 1, 1,
0.6256495, -0.5790529, 2.431221, 0, 0, 0, 1, 1,
0.6344204, -0.6144134, 4.549178, 0, 0, 0, 1, 1,
0.6424168, 1.230186, 0.5859724, 0, 0, 0, 1, 1,
0.6455674, -0.9904231, 2.559778, 0, 0, 0, 1, 1,
0.6493186, -0.6356956, 3.102783, 0, 0, 0, 1, 1,
0.6550422, -0.4714736, 2.705436, 0, 0, 0, 1, 1,
0.6642494, 0.8336338, 1.137291, 0, 0, 0, 1, 1,
0.6677004, 1.510462, 0.8320047, 1, 1, 1, 1, 1,
0.6692116, 0.5887846, 1.893467, 1, 1, 1, 1, 1,
0.6703321, -0.6108479, 0.8842138, 1, 1, 1, 1, 1,
0.6753855, 0.2120346, 1.88117, 1, 1, 1, 1, 1,
0.6754865, 0.6634149, 0.1305434, 1, 1, 1, 1, 1,
0.6821424, -0.4069589, 3.296419, 1, 1, 1, 1, 1,
0.6869831, 1.167948, -1.894596, 1, 1, 1, 1, 1,
0.6908415, -0.4992623, 1.750481, 1, 1, 1, 1, 1,
0.6936396, 0.5639402, 2.561774, 1, 1, 1, 1, 1,
0.6958786, 0.7509179, -0.9259402, 1, 1, 1, 1, 1,
0.6968445, -1.522903, 2.033186, 1, 1, 1, 1, 1,
0.7051049, 0.7175273, 2.244218, 1, 1, 1, 1, 1,
0.7124839, 0.4617463, 0.1408764, 1, 1, 1, 1, 1,
0.7175601, -0.4957332, 0.1024664, 1, 1, 1, 1, 1,
0.7182884, 2.016656, 0.1898199, 1, 1, 1, 1, 1,
0.7242795, -0.01362748, 1.396924, 0, 0, 1, 1, 1,
0.7287811, -1.131466, 3.415989, 1, 0, 0, 1, 1,
0.7326906, 0.1606169, 0.1274586, 1, 0, 0, 1, 1,
0.7331048, -0.4901524, 1.642748, 1, 0, 0, 1, 1,
0.7341616, 1.488019, -0.1062384, 1, 0, 0, 1, 1,
0.7375439, -0.3688733, 1.720654, 1, 0, 0, 1, 1,
0.7424825, -0.1531547, 1.46979, 0, 0, 0, 1, 1,
0.7535844, -0.1217994, 1.797734, 0, 0, 0, 1, 1,
0.7538656, -0.3323749, 2.198422, 0, 0, 0, 1, 1,
0.7602493, 0.5180062, -0.08198964, 0, 0, 0, 1, 1,
0.7622067, -0.6872811, 2.0166, 0, 0, 0, 1, 1,
0.7640408, 1.628296, 1.547418, 0, 0, 0, 1, 1,
0.7827195, 0.1992724, 0.6319714, 0, 0, 0, 1, 1,
0.7875434, 0.3439627, 2.135413, 1, 1, 1, 1, 1,
0.788073, 0.444902, 0.7481402, 1, 1, 1, 1, 1,
0.7955933, -0.551302, 0.5858566, 1, 1, 1, 1, 1,
0.8026335, -0.8179109, 0.7265916, 1, 1, 1, 1, 1,
0.8173669, -1.045207, 3.257282, 1, 1, 1, 1, 1,
0.8178115, -1.285973, 1.686996, 1, 1, 1, 1, 1,
0.8189429, 0.4436071, 1.377277, 1, 1, 1, 1, 1,
0.8237388, 0.6815937, 0.6303779, 1, 1, 1, 1, 1,
0.8312265, -0.1489611, 1.124225, 1, 1, 1, 1, 1,
0.8348297, 0.7512607, 0.6675975, 1, 1, 1, 1, 1,
0.8356955, -0.813306, 1.964196, 1, 1, 1, 1, 1,
0.8378431, -1.74952, 4.553881, 1, 1, 1, 1, 1,
0.8400352, 0.9088005, 2.071961, 1, 1, 1, 1, 1,
0.8427351, -0.9015753, 2.326118, 1, 1, 1, 1, 1,
0.84439, 1.071604, 1.157651, 1, 1, 1, 1, 1,
0.8466358, 0.4990766, 2.164786, 0, 0, 1, 1, 1,
0.85085, -0.1390582, 3.603235, 1, 0, 0, 1, 1,
0.8598738, 0.7431257, -0.2592979, 1, 0, 0, 1, 1,
0.8642166, -0.5093573, 2.135969, 1, 0, 0, 1, 1,
0.8680171, -1.57801, 2.805676, 1, 0, 0, 1, 1,
0.868975, 0.815156, 2.562531, 1, 0, 0, 1, 1,
0.871745, -0.4526775, 1.417024, 0, 0, 0, 1, 1,
0.8720333, 0.4551657, 0.370838, 0, 0, 0, 1, 1,
0.8726658, 0.8550536, 1.234018, 0, 0, 0, 1, 1,
0.8888348, -0.2359982, 2.009155, 0, 0, 0, 1, 1,
0.8931135, 0.1493901, 1.172681, 0, 0, 0, 1, 1,
0.8934684, 0.2898314, 0.321914, 0, 0, 0, 1, 1,
0.9034276, -0.5837789, 1.258161, 0, 0, 0, 1, 1,
0.9047145, -0.7221749, 1.411, 1, 1, 1, 1, 1,
0.9108886, 1.226346, 0.1842575, 1, 1, 1, 1, 1,
0.9222069, -0.5466105, 3.494068, 1, 1, 1, 1, 1,
0.9227607, -0.798638, 3.812001, 1, 1, 1, 1, 1,
0.9275213, 0.04271583, 2.338095, 1, 1, 1, 1, 1,
0.9285479, -0.3142526, 3.126463, 1, 1, 1, 1, 1,
0.9292776, 0.6590833, 1.481784, 1, 1, 1, 1, 1,
0.9310309, 0.3063008, 1.252396, 1, 1, 1, 1, 1,
0.9341613, -2.602994, 2.63133, 1, 1, 1, 1, 1,
0.9528362, -0.9797762, 1.191855, 1, 1, 1, 1, 1,
0.9582528, 0.6160532, 1.522688, 1, 1, 1, 1, 1,
0.960907, 0.08780272, 0.5647007, 1, 1, 1, 1, 1,
0.9624275, 0.7059637, -0.2890754, 1, 1, 1, 1, 1,
0.9642544, 0.317911, 0.3288616, 1, 1, 1, 1, 1,
0.9644464, -0.2848115, 1.825115, 1, 1, 1, 1, 1,
0.964958, 0.03096914, -0.6790363, 0, 0, 1, 1, 1,
0.9682987, -1.557092, 1.652641, 1, 0, 0, 1, 1,
0.9750561, -1.029313, 0.8141934, 1, 0, 0, 1, 1,
0.9751807, 0.7510344, 1.936701, 1, 0, 0, 1, 1,
0.9800436, -1.187862, 3.028279, 1, 0, 0, 1, 1,
0.9813742, -1.723835, 4.251992, 1, 0, 0, 1, 1,
0.982142, 0.3264624, -1.014772, 0, 0, 0, 1, 1,
0.98318, -0.4216659, 1.465202, 0, 0, 0, 1, 1,
0.9923848, -1.158845, 0.4501993, 0, 0, 0, 1, 1,
0.9933017, 0.5448152, 2.258452, 0, 0, 0, 1, 1,
1.013054, 1.026297, 0.3970051, 0, 0, 0, 1, 1,
1.01343, 0.5087686, 2.563284, 0, 0, 0, 1, 1,
1.014098, 1.327209, 2.375554, 0, 0, 0, 1, 1,
1.016507, -0.195943, 1.404358, 1, 1, 1, 1, 1,
1.018481, -1.640923, 1.650169, 1, 1, 1, 1, 1,
1.0195, -0.8824918, 1.789871, 1, 1, 1, 1, 1,
1.02106, 1.771639, -1.290613, 1, 1, 1, 1, 1,
1.022233, -1.113441, 3.8886, 1, 1, 1, 1, 1,
1.023466, -0.956285, 2.093166, 1, 1, 1, 1, 1,
1.02512, -1.757689, 2.599277, 1, 1, 1, 1, 1,
1.032875, 1.551374, 0.5953051, 1, 1, 1, 1, 1,
1.033114, -0.9049164, 2.833515, 1, 1, 1, 1, 1,
1.035842, -0.4822909, 2.308783, 1, 1, 1, 1, 1,
1.039143, 1.488269, -0.3595192, 1, 1, 1, 1, 1,
1.040514, 0.2466975, 3.204741, 1, 1, 1, 1, 1,
1.041342, 0.3841569, 1.273563, 1, 1, 1, 1, 1,
1.044577, 0.7750797, 0.8993338, 1, 1, 1, 1, 1,
1.045232, -0.2941099, 1.429404, 1, 1, 1, 1, 1,
1.047286, -0.2776273, 2.362613, 0, 0, 1, 1, 1,
1.069698, 0.3420717, 1.150363, 1, 0, 0, 1, 1,
1.0768, 0.708155, -0.7049441, 1, 0, 0, 1, 1,
1.077479, 0.8079261, -1.336098, 1, 0, 0, 1, 1,
1.077804, -1.13843, 2.587375, 1, 0, 0, 1, 1,
1.078449, -0.4421072, 2.251179, 1, 0, 0, 1, 1,
1.078541, 2.103111, 2.924835, 0, 0, 0, 1, 1,
1.078732, 1.989064, 0.5122925, 0, 0, 0, 1, 1,
1.087216, 1.381382, -0.3977997, 0, 0, 0, 1, 1,
1.088377, -0.7941929, 2.382575, 0, 0, 0, 1, 1,
1.090571, 0.814669, 0.2671122, 0, 0, 0, 1, 1,
1.097841, -0.4133174, 1.517571, 0, 0, 0, 1, 1,
1.105116, -1.675675, 3.181917, 0, 0, 0, 1, 1,
1.105291, -0.4274834, 2.559309, 1, 1, 1, 1, 1,
1.105467, -1.892173, 2.427933, 1, 1, 1, 1, 1,
1.106715, -0.3249826, 2.271093, 1, 1, 1, 1, 1,
1.108994, 0.7978525, 1.555892, 1, 1, 1, 1, 1,
1.113978, -0.09251036, 2.431088, 1, 1, 1, 1, 1,
1.114666, -0.7974436, 2.479779, 1, 1, 1, 1, 1,
1.11477, 0.3506838, 1.634857, 1, 1, 1, 1, 1,
1.123404, 0.009625128, 2.692044, 1, 1, 1, 1, 1,
1.124359, 0.5205843, 1.761378, 1, 1, 1, 1, 1,
1.133114, 1.367363, 1.727694, 1, 1, 1, 1, 1,
1.136008, 1.369172, 0.3907466, 1, 1, 1, 1, 1,
1.139936, 0.2332454, 1.756215, 1, 1, 1, 1, 1,
1.140404, 1.249724, 0.7522695, 1, 1, 1, 1, 1,
1.141915, -1.566653, 2.608472, 1, 1, 1, 1, 1,
1.144814, 1.310793, -2.21035, 1, 1, 1, 1, 1,
1.149274, 0.3075777, 0.1436016, 0, 0, 1, 1, 1,
1.150042, -0.321043, 0.9703804, 1, 0, 0, 1, 1,
1.151545, 0.04388916, 2.477464, 1, 0, 0, 1, 1,
1.156025, 1.450045, -0.61321, 1, 0, 0, 1, 1,
1.161495, 0.09264711, 1.450228, 1, 0, 0, 1, 1,
1.161976, -1.3966, 4.334297, 1, 0, 0, 1, 1,
1.16303, -1.027367, 1.643616, 0, 0, 0, 1, 1,
1.163141, -0.01892896, 1.480451, 0, 0, 0, 1, 1,
1.163201, 2.181513, 0.05344523, 0, 0, 0, 1, 1,
1.165371, 0.1601633, 0.103921, 0, 0, 0, 1, 1,
1.169669, 0.5698594, 0.3984541, 0, 0, 0, 1, 1,
1.181654, -0.7196913, 1.59915, 0, 0, 0, 1, 1,
1.1872, -1.039277, 2.007551, 0, 0, 0, 1, 1,
1.188773, -1.148354, 2.331006, 1, 1, 1, 1, 1,
1.198282, 0.255231, -0.1001165, 1, 1, 1, 1, 1,
1.203214, 0.4014288, 1.57639, 1, 1, 1, 1, 1,
1.216888, -1.265438, 0.7822919, 1, 1, 1, 1, 1,
1.218856, -0.5493704, 0.9214462, 1, 1, 1, 1, 1,
1.219236, 0.03773259, 0.7347865, 1, 1, 1, 1, 1,
1.219971, -0.5519153, 2.05049, 1, 1, 1, 1, 1,
1.224801, -1.550144, 0.7164556, 1, 1, 1, 1, 1,
1.226188, -0.3882405, 3.175873, 1, 1, 1, 1, 1,
1.226503, -0.5981424, 2.143084, 1, 1, 1, 1, 1,
1.233546, 1.283741, -0.7927711, 1, 1, 1, 1, 1,
1.254994, 0.3758089, 2.8576, 1, 1, 1, 1, 1,
1.261929, 1.261448, -0.2595434, 1, 1, 1, 1, 1,
1.263612, 0.08748092, 2.73989, 1, 1, 1, 1, 1,
1.263694, -0.5934688, 2.472585, 1, 1, 1, 1, 1,
1.28322, 0.2456111, 1.143191, 0, 0, 1, 1, 1,
1.287242, 0.6006069, -0.3839045, 1, 0, 0, 1, 1,
1.294162, 0.6737152, 0.1589527, 1, 0, 0, 1, 1,
1.30324, -1.104354, 2.373264, 1, 0, 0, 1, 1,
1.306998, -1.040228, 1.437603, 1, 0, 0, 1, 1,
1.307456, -0.4190407, 3.164962, 1, 0, 0, 1, 1,
1.314569, 0.2268722, 2.404346, 0, 0, 0, 1, 1,
1.323703, -0.1373267, 2.245562, 0, 0, 0, 1, 1,
1.324758, 0.8920336, -0.2176301, 0, 0, 0, 1, 1,
1.334517, -0.3616499, 1.226229, 0, 0, 0, 1, 1,
1.334992, 0.2611171, 0.8437043, 0, 0, 0, 1, 1,
1.337047, -0.6555215, 2.047727, 0, 0, 0, 1, 1,
1.348717, -0.6559857, 2.8815, 0, 0, 0, 1, 1,
1.363559, -1.430959, 4.332154, 1, 1, 1, 1, 1,
1.37412, 0.2593191, 0.1563557, 1, 1, 1, 1, 1,
1.375328, 1.243639, 1.808755, 1, 1, 1, 1, 1,
1.382252, 1.874549, -0.2037357, 1, 1, 1, 1, 1,
1.390621, 1.312299, 0.4520967, 1, 1, 1, 1, 1,
1.403508, 0.2168043, 2.943222, 1, 1, 1, 1, 1,
1.406303, -0.05518699, 1.727865, 1, 1, 1, 1, 1,
1.414854, -0.1920033, 1.412855, 1, 1, 1, 1, 1,
1.441796, -0.2020026, 1.542503, 1, 1, 1, 1, 1,
1.451733, -0.00682099, 2.116471, 1, 1, 1, 1, 1,
1.452589, -0.3547999, 2.700828, 1, 1, 1, 1, 1,
1.452729, 2.325137, 1.012702, 1, 1, 1, 1, 1,
1.453251, 2.590454, 0.9144172, 1, 1, 1, 1, 1,
1.458501, -0.5079279, 2.592132, 1, 1, 1, 1, 1,
1.463928, -0.5583436, 2.357855, 1, 1, 1, 1, 1,
1.478004, -0.3772592, 1.780422, 0, 0, 1, 1, 1,
1.478756, 1.095667, 1.783228, 1, 0, 0, 1, 1,
1.483802, 0.2075227, -0.8056352, 1, 0, 0, 1, 1,
1.508958, 0.03688221, 0.7819865, 1, 0, 0, 1, 1,
1.510118, 0.05935064, 1.464861, 1, 0, 0, 1, 1,
1.514534, 0.5995899, 1.88181, 1, 0, 0, 1, 1,
1.518978, -0.04594053, 1.882026, 0, 0, 0, 1, 1,
1.52695, 0.1697908, 2.663357, 0, 0, 0, 1, 1,
1.532308, 0.9061088, 2.284155, 0, 0, 0, 1, 1,
1.536986, 1.466984, -0.9391139, 0, 0, 0, 1, 1,
1.5427, 0.05384435, 0.9444935, 0, 0, 0, 1, 1,
1.548479, 0.2470948, 3.169873, 0, 0, 0, 1, 1,
1.579413, 0.1593185, 1.118209, 0, 0, 0, 1, 1,
1.595592, 0.6480703, -0.9551112, 1, 1, 1, 1, 1,
1.59589, -0.785489, 2.393043, 1, 1, 1, 1, 1,
1.608151, 0.7500046, 1.383243, 1, 1, 1, 1, 1,
1.61128, -0.6893195, 2.489172, 1, 1, 1, 1, 1,
1.619424, -0.07853826, 0.7941452, 1, 1, 1, 1, 1,
1.623036, 4.108109, 0.05070407, 1, 1, 1, 1, 1,
1.632666, -0.04529789, 1.879483, 1, 1, 1, 1, 1,
1.632915, 0.9348928, 1.113279, 1, 1, 1, 1, 1,
1.64387, 0.1946157, -1.098088, 1, 1, 1, 1, 1,
1.660237, 0.7093849, 0.9334379, 1, 1, 1, 1, 1,
1.664086, 0.273131, 0.7483507, 1, 1, 1, 1, 1,
1.668575, -1.780366, 3.224107, 1, 1, 1, 1, 1,
1.689365, 0.04240964, 0.8277337, 1, 1, 1, 1, 1,
1.703964, -0.9748703, 2.290315, 1, 1, 1, 1, 1,
1.711297, 1.074896, 2.06406, 1, 1, 1, 1, 1,
1.712457, -0.02000236, -0.3094434, 0, 0, 1, 1, 1,
1.720672, 1.066917, 1.943654, 1, 0, 0, 1, 1,
1.720914, -1.036247, 2.25754, 1, 0, 0, 1, 1,
1.72732, -0.4502363, 3.053788, 1, 0, 0, 1, 1,
1.745607, 0.5560974, 0.7827097, 1, 0, 0, 1, 1,
1.749581, 1.246843, 1.786336, 1, 0, 0, 1, 1,
1.760935, -0.7640569, 1.823186, 0, 0, 0, 1, 1,
1.767887, 0.5593826, 0.1285681, 0, 0, 0, 1, 1,
1.783117, 0.5454862, 1.05784, 0, 0, 0, 1, 1,
1.786114, -1.637302, 3.562213, 0, 0, 0, 1, 1,
1.786703, 0.1041908, 1.965723, 0, 0, 0, 1, 1,
1.794632, 3.159358, -0.3614294, 0, 0, 0, 1, 1,
1.806673, 0.2429443, 2.415093, 0, 0, 0, 1, 1,
1.808118, 1.179657, 2.382206, 1, 1, 1, 1, 1,
1.821932, 1.176376, 0.537837, 1, 1, 1, 1, 1,
1.84229, -2.144899, 4.414415, 1, 1, 1, 1, 1,
1.849336, -1.656025, 3.422616, 1, 1, 1, 1, 1,
1.860439, 0.547766, 1.349981, 1, 1, 1, 1, 1,
1.890538, 0.7067941, 1.177301, 1, 1, 1, 1, 1,
1.917003, -0.4430266, 1.284633, 1, 1, 1, 1, 1,
1.921523, 1.589963, 0.863439, 1, 1, 1, 1, 1,
1.935449, 0.3165959, 1.734341, 1, 1, 1, 1, 1,
1.939583, 0.7081001, 1.515263, 1, 1, 1, 1, 1,
1.972346, -0.5509172, 2.091272, 1, 1, 1, 1, 1,
2.002115, -0.9634751, 2.614452, 1, 1, 1, 1, 1,
2.003601, 0.4308764, 0.3503205, 1, 1, 1, 1, 1,
2.019442, -0.06912596, 1.168834, 1, 1, 1, 1, 1,
2.043323, 0.3580025, 1.268034, 1, 1, 1, 1, 1,
2.043443, -0.8381414, 2.179442, 0, 0, 1, 1, 1,
2.06818, 0.5144972, 0.6140274, 1, 0, 0, 1, 1,
2.077673, 0.763576, 1.704728, 1, 0, 0, 1, 1,
2.086594, 1.119368, 2.500378, 1, 0, 0, 1, 1,
2.114682, -0.7285318, 1.685741, 1, 0, 0, 1, 1,
2.129184, -0.5901357, 3.1946, 1, 0, 0, 1, 1,
2.136261, -1.284773, 1.359874, 0, 0, 0, 1, 1,
2.145854, 0.4134519, 1.626046, 0, 0, 0, 1, 1,
2.166197, 0.7036523, 0.9436864, 0, 0, 0, 1, 1,
2.17865, -2.258331, 2.914279, 0, 0, 0, 1, 1,
2.241416, 0.08206426, 1.743798, 0, 0, 0, 1, 1,
2.326309, 0.06288399, 0.4603017, 0, 0, 0, 1, 1,
2.36645, -0.9935045, 1.560027, 0, 0, 0, 1, 1,
2.436176, 1.502854, 1.809595, 1, 1, 1, 1, 1,
2.519958, -0.2015359, 1.679518, 1, 1, 1, 1, 1,
2.623424, -1.861485, 1.47177, 1, 1, 1, 1, 1,
2.635168, -0.2616262, 2.1309, 1, 1, 1, 1, 1,
2.70884, -1.926229, 3.961217, 1, 1, 1, 1, 1,
2.729481, -0.8065655, 1.809186, 1, 1, 1, 1, 1,
3.112684, 0.1648577, 1.225014, 1, 1, 1, 1, 1
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
var radius = 10.35324;
var distance = 36.36532;
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
mvMatrix.translate( -0.1673871, -0.3549337, 0.7138398 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.36532);
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
