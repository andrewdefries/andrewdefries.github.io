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
-4.005992, -0.330568, 0.8287815, 1, 0, 0, 1,
-2.982832, 0.3513607, -0.5481793, 1, 0.007843138, 0, 1,
-2.633106, 0.05150631, -2.171354, 1, 0.01176471, 0, 1,
-2.602184, 0.2351293, -1.583855, 1, 0.01960784, 0, 1,
-2.513421, -0.1341583, -0.0790728, 1, 0.02352941, 0, 1,
-2.466665, -0.6746045, -1.809559, 1, 0.03137255, 0, 1,
-2.445275, -0.07005708, -2.272445, 1, 0.03529412, 0, 1,
-2.435185, 0.3388724, -3.542433, 1, 0.04313726, 0, 1,
-2.429447, 0.5582566, -0.9235113, 1, 0.04705882, 0, 1,
-2.389433, -1.721503, -2.458008, 1, 0.05490196, 0, 1,
-2.369279, 0.2147244, -1.593408, 1, 0.05882353, 0, 1,
-2.32028, -0.6406021, -3.09849, 1, 0.06666667, 0, 1,
-2.308334, 0.9983546, -0.8889684, 1, 0.07058824, 0, 1,
-2.294852, -1.934934, -2.162296, 1, 0.07843138, 0, 1,
-2.231209, 0.2016222, -3.774023, 1, 0.08235294, 0, 1,
-2.212007, -0.1655462, -2.304069, 1, 0.09019608, 0, 1,
-2.185248, 0.3956535, -2.559732, 1, 0.09411765, 0, 1,
-2.160334, -1.210016, -2.990747, 1, 0.1019608, 0, 1,
-2.127033, -1.258232, -2.956182, 1, 0.1098039, 0, 1,
-2.071419, 0.06450327, -1.882335, 1, 0.1137255, 0, 1,
-2.063578, -0.8038462, 0.08913662, 1, 0.1215686, 0, 1,
-2.036712, -1.34191, -1.662696, 1, 0.1254902, 0, 1,
-2.030477, 1.296658, 1.139359, 1, 0.1333333, 0, 1,
-2.012554, 0.05806658, -0.6894741, 1, 0.1372549, 0, 1,
-1.998374, -0.6171501, -2.446122, 1, 0.145098, 0, 1,
-1.979203, -0.9146538, -2.230802, 1, 0.1490196, 0, 1,
-1.964935, 0.3213294, -1.228474, 1, 0.1568628, 0, 1,
-1.959055, -0.4617621, -1.596526, 1, 0.1607843, 0, 1,
-1.949376, 1.546833, -0.1099128, 1, 0.1686275, 0, 1,
-1.935734, 0.06693684, -2.659382, 1, 0.172549, 0, 1,
-1.933893, 1.660945, -2.526987, 1, 0.1803922, 0, 1,
-1.932507, -1.507661, -0.823283, 1, 0.1843137, 0, 1,
-1.929628, -0.3805853, -2.23203, 1, 0.1921569, 0, 1,
-1.905046, -1.04771, -2.387852, 1, 0.1960784, 0, 1,
-1.903107, -0.02044009, -1.879836, 1, 0.2039216, 0, 1,
-1.889433, 1.431007, -1.74025, 1, 0.2117647, 0, 1,
-1.880922, 0.4338789, -1.210552, 1, 0.2156863, 0, 1,
-1.874284, -0.04573738, 0.7732258, 1, 0.2235294, 0, 1,
-1.852027, 0.4883716, -1.869069, 1, 0.227451, 0, 1,
-1.828157, -1.94176, -0.7766485, 1, 0.2352941, 0, 1,
-1.808028, 1.201027, -0.8318571, 1, 0.2392157, 0, 1,
-1.792057, 0.1406257, -1.547427, 1, 0.2470588, 0, 1,
-1.7764, -2.454293, -0.5159575, 1, 0.2509804, 0, 1,
-1.767335, -0.907538, -3.093905, 1, 0.2588235, 0, 1,
-1.754648, 1.806288, 1.167834, 1, 0.2627451, 0, 1,
-1.742966, -1.000415, -2.951531, 1, 0.2705882, 0, 1,
-1.737115, -0.9377652, -1.133693, 1, 0.2745098, 0, 1,
-1.699959, -0.172701, -0.7525129, 1, 0.282353, 0, 1,
-1.692729, 0.8952188, -1.755143, 1, 0.2862745, 0, 1,
-1.681283, 0.6952537, -1.650139, 1, 0.2941177, 0, 1,
-1.670014, 0.06536891, -1.066159, 1, 0.3019608, 0, 1,
-1.666261, -0.2269889, -1.135792, 1, 0.3058824, 0, 1,
-1.660525, -0.2950205, -2.679488, 1, 0.3137255, 0, 1,
-1.65365, 1.356072, -3.03138, 1, 0.3176471, 0, 1,
-1.649931, -0.253302, -1.565607, 1, 0.3254902, 0, 1,
-1.636246, -0.07424682, -1.312551, 1, 0.3294118, 0, 1,
-1.631478, 0.1698983, -1.135576, 1, 0.3372549, 0, 1,
-1.623289, 0.9026865, -1.235902, 1, 0.3411765, 0, 1,
-1.604642, -1.828683, -4.208089, 1, 0.3490196, 0, 1,
-1.604003, 0.9187583, -0.7532738, 1, 0.3529412, 0, 1,
-1.59743, 0.6505322, -0.2098949, 1, 0.3607843, 0, 1,
-1.596978, -0.1638187, -1.77968, 1, 0.3647059, 0, 1,
-1.591968, 0.9121162, 0.4173141, 1, 0.372549, 0, 1,
-1.590668, 0.02147789, -1.772919, 1, 0.3764706, 0, 1,
-1.589995, 0.2253033, -3.233718, 1, 0.3843137, 0, 1,
-1.583485, 0.5735902, -0.7881734, 1, 0.3882353, 0, 1,
-1.569298, -1.133973, -2.674674, 1, 0.3960784, 0, 1,
-1.560345, -0.1989726, -0.707417, 1, 0.4039216, 0, 1,
-1.557482, -1.287451, -2.561123, 1, 0.4078431, 0, 1,
-1.55329, -0.5881335, -2.907038, 1, 0.4156863, 0, 1,
-1.552344, 0.08767367, -0.6302379, 1, 0.4196078, 0, 1,
-1.545956, 0.06667251, -2.315984, 1, 0.427451, 0, 1,
-1.545535, -2.276155, -1.767738, 1, 0.4313726, 0, 1,
-1.540976, -0.4715102, -2.615062, 1, 0.4392157, 0, 1,
-1.533885, -0.988721, -0.6080904, 1, 0.4431373, 0, 1,
-1.509859, 3.024539, 1.781193, 1, 0.4509804, 0, 1,
-1.506735, 0.1273623, -1.318501, 1, 0.454902, 0, 1,
-1.490829, -0.03515464, -2.327607, 1, 0.4627451, 0, 1,
-1.473523, 0.8952441, -0.9312234, 1, 0.4666667, 0, 1,
-1.446636, 0.4693164, -1.540299, 1, 0.4745098, 0, 1,
-1.441711, 1.019674, 1.024147, 1, 0.4784314, 0, 1,
-1.437684, 0.1194242, 0.3908201, 1, 0.4862745, 0, 1,
-1.431789, 0.4942637, -1.387079, 1, 0.4901961, 0, 1,
-1.425647, -0.2212126, -0.2022845, 1, 0.4980392, 0, 1,
-1.425549, -0.9775647, -3.093261, 1, 0.5058824, 0, 1,
-1.41092, 0.02340673, -0.9879615, 1, 0.509804, 0, 1,
-1.410668, 1.007287, -1.692863, 1, 0.5176471, 0, 1,
-1.40098, 0.6354408, 0.7803462, 1, 0.5215687, 0, 1,
-1.400306, -0.8954009, -3.334409, 1, 0.5294118, 0, 1,
-1.396438, -1.26612, -3.55105, 1, 0.5333334, 0, 1,
-1.384827, 0.7008139, 0.5616425, 1, 0.5411765, 0, 1,
-1.377382, -0.7296201, -1.078298, 1, 0.5450981, 0, 1,
-1.371545, 0.9247596, -1.266279, 1, 0.5529412, 0, 1,
-1.36276, 1.179436, -1.042468, 1, 0.5568628, 0, 1,
-1.359492, 1.367599, 0.1170475, 1, 0.5647059, 0, 1,
-1.356524, -0.5043124, -0.3550251, 1, 0.5686275, 0, 1,
-1.354729, 0.7896745, -0.951345, 1, 0.5764706, 0, 1,
-1.352951, -0.3754084, -0.8520414, 1, 0.5803922, 0, 1,
-1.345363, 0.7464192, -2.091193, 1, 0.5882353, 0, 1,
-1.34424, 0.3864814, -0.2592378, 1, 0.5921569, 0, 1,
-1.323115, -2.261245, -4.292086, 1, 0.6, 0, 1,
-1.317364, -0.3516915, -1.262779, 1, 0.6078432, 0, 1,
-1.314318, 1.396668, -2.555902, 1, 0.6117647, 0, 1,
-1.310216, 1.241668, -3.291787, 1, 0.6196079, 0, 1,
-1.309706, 1.221678, -1.433206, 1, 0.6235294, 0, 1,
-1.299501, -1.514223, -2.471349, 1, 0.6313726, 0, 1,
-1.29015, 1.924636, -0.2824128, 1, 0.6352941, 0, 1,
-1.289137, 0.9816085, -0.7489686, 1, 0.6431373, 0, 1,
-1.283856, 1.023893, -1.316231, 1, 0.6470588, 0, 1,
-1.280157, 0.9381547, -0.5271181, 1, 0.654902, 0, 1,
-1.278553, 1.018732, -0.05329898, 1, 0.6588235, 0, 1,
-1.275823, -0.2549951, -2.422163, 1, 0.6666667, 0, 1,
-1.271598, -1.607292, -1.649185, 1, 0.6705883, 0, 1,
-1.270422, 0.3365863, 0.06718208, 1, 0.6784314, 0, 1,
-1.26885, 0.4068417, -2.265814, 1, 0.682353, 0, 1,
-1.26368, 1.519958, -0.5746244, 1, 0.6901961, 0, 1,
-1.262143, -0.09293334, -1.40685, 1, 0.6941177, 0, 1,
-1.251204, -0.04072238, -2.417625, 1, 0.7019608, 0, 1,
-1.23701, -0.4672991, -0.3491946, 1, 0.7098039, 0, 1,
-1.236156, -0.01670019, -2.379071, 1, 0.7137255, 0, 1,
-1.235374, -1.38087, -1.394621, 1, 0.7215686, 0, 1,
-1.232286, -0.3004567, -1.739188, 1, 0.7254902, 0, 1,
-1.23135, -0.7331967, -2.878642, 1, 0.7333333, 0, 1,
-1.226841, 0.8289215, -1.99382, 1, 0.7372549, 0, 1,
-1.225838, 0.4921659, -0.8398867, 1, 0.7450981, 0, 1,
-1.225073, -0.5269461, -2.536223, 1, 0.7490196, 0, 1,
-1.223172, -0.4389267, -2.126525, 1, 0.7568628, 0, 1,
-1.206141, 0.3528482, -1.190841, 1, 0.7607843, 0, 1,
-1.204111, -1.737699, -3.688112, 1, 0.7686275, 0, 1,
-1.203125, -0.0823674, -2.586189, 1, 0.772549, 0, 1,
-1.201039, 0.04893082, -1.623564, 1, 0.7803922, 0, 1,
-1.198306, -0.5758414, -1.567663, 1, 0.7843137, 0, 1,
-1.194383, 0.3614498, -1.3252, 1, 0.7921569, 0, 1,
-1.186991, -1.087985, -2.686374, 1, 0.7960784, 0, 1,
-1.186015, 0.9853078, -2.09483, 1, 0.8039216, 0, 1,
-1.182693, 0.1653756, -1.997803, 1, 0.8117647, 0, 1,
-1.180675, -0.7406035, -2.613927, 1, 0.8156863, 0, 1,
-1.177622, 0.08126877, -2.116233, 1, 0.8235294, 0, 1,
-1.175948, 0.04738365, -2.229981, 1, 0.827451, 0, 1,
-1.167407, -0.5784835, -4.611245, 1, 0.8352941, 0, 1,
-1.159648, 1.507479, -0.8224341, 1, 0.8392157, 0, 1,
-1.159018, -0.678607, -1.962972, 1, 0.8470588, 0, 1,
-1.155948, 2.121116, 0.2076809, 1, 0.8509804, 0, 1,
-1.141396, 0.9318777, 0.762367, 1, 0.8588235, 0, 1,
-1.141262, -2.066148, -1.886383, 1, 0.8627451, 0, 1,
-1.132754, 0.008227627, -1.22688, 1, 0.8705882, 0, 1,
-1.12963, 0.07532107, -0.1506825, 1, 0.8745098, 0, 1,
-1.129573, 1.213295, -0.5315281, 1, 0.8823529, 0, 1,
-1.128267, 0.3341081, -2.158426, 1, 0.8862745, 0, 1,
-1.123641, 1.01068, -2.105167, 1, 0.8941177, 0, 1,
-1.120516, 1.367958, -0.6415028, 1, 0.8980392, 0, 1,
-1.119085, -0.4440858, -0.5441951, 1, 0.9058824, 0, 1,
-1.106334, 0.6670312, -1.518604, 1, 0.9137255, 0, 1,
-1.104855, 1.339091, 1.55108, 1, 0.9176471, 0, 1,
-1.09744, -1.636603, -3.457875, 1, 0.9254902, 0, 1,
-1.094886, -0.1427551, 1.374485, 1, 0.9294118, 0, 1,
-1.091439, 0.428389, -2.846637, 1, 0.9372549, 0, 1,
-1.088723, 1.903192, -1.038403, 1, 0.9411765, 0, 1,
-1.079345, 1.058369, -1.110189, 1, 0.9490196, 0, 1,
-1.076302, 0.4066096, -0.1340206, 1, 0.9529412, 0, 1,
-1.059008, -0.7819855, -3.600291, 1, 0.9607843, 0, 1,
-1.052522, 0.6603027, 0.06305932, 1, 0.9647059, 0, 1,
-1.049857, 1.945349, -1.419581, 1, 0.972549, 0, 1,
-1.045843, -1.169341, -2.657771, 1, 0.9764706, 0, 1,
-1.041707, -0.2484059, -1.803913, 1, 0.9843137, 0, 1,
-1.040837, -0.4779968, -2.303116, 1, 0.9882353, 0, 1,
-1.039532, -1.58939, -2.863859, 1, 0.9960784, 0, 1,
-1.034608, -0.8108991, -0.6307467, 0.9960784, 1, 0, 1,
-1.031105, -3.079426, -2.814566, 0.9921569, 1, 0, 1,
-1.022457, -0.7341551, -3.004537, 0.9843137, 1, 0, 1,
-1.016141, -0.05230813, -1.877216, 0.9803922, 1, 0, 1,
-1.010336, 1.24007, -1.15418, 0.972549, 1, 0, 1,
-0.9891135, -0.3055913, -2.438825, 0.9686275, 1, 0, 1,
-0.9744322, 0.681325, -2.097505, 0.9607843, 1, 0, 1,
-0.9734436, 0.326887, -2.542037, 0.9568627, 1, 0, 1,
-0.9733123, 1.69648, -0.6002637, 0.9490196, 1, 0, 1,
-0.9713662, -1.295637, -3.484325, 0.945098, 1, 0, 1,
-0.9683236, -0.1091555, -0.9835637, 0.9372549, 1, 0, 1,
-0.9633965, -0.9423879, -4.904443, 0.9333333, 1, 0, 1,
-0.9584467, -1.924558, -2.050316, 0.9254902, 1, 0, 1,
-0.9582946, 0.6928813, -0.8073251, 0.9215686, 1, 0, 1,
-0.9558474, 0.7706666, -0.1293832, 0.9137255, 1, 0, 1,
-0.949227, 1.522587, 0.2705852, 0.9098039, 1, 0, 1,
-0.9484184, -0.3768832, -1.512484, 0.9019608, 1, 0, 1,
-0.9279928, -1.727992, -2.362334, 0.8941177, 1, 0, 1,
-0.9269773, -0.1366567, -0.6564609, 0.8901961, 1, 0, 1,
-0.9252769, 0.408855, -0.705061, 0.8823529, 1, 0, 1,
-0.9242668, -0.36336, -3.126132, 0.8784314, 1, 0, 1,
-0.9216884, -2.494601, -1.691337, 0.8705882, 1, 0, 1,
-0.9168873, -1.681626, -2.812503, 0.8666667, 1, 0, 1,
-0.9166955, -1.310327, -2.427076, 0.8588235, 1, 0, 1,
-0.9153525, 1.038146, -1.48324, 0.854902, 1, 0, 1,
-0.9138408, -1.158503, -2.140692, 0.8470588, 1, 0, 1,
-0.9016291, -0.02796042, -1.21395, 0.8431373, 1, 0, 1,
-0.8976957, 0.1874132, -1.475881, 0.8352941, 1, 0, 1,
-0.8975012, -1.012479, -3.311467, 0.8313726, 1, 0, 1,
-0.8970696, 0.9471889, 0.01750818, 0.8235294, 1, 0, 1,
-0.89165, -0.8342192, -0.8884413, 0.8196079, 1, 0, 1,
-0.8910081, 1.599331, 0.05297266, 0.8117647, 1, 0, 1,
-0.8886661, -1.303152, -3.174552, 0.8078431, 1, 0, 1,
-0.8845525, -0.9579038, -3.500713, 0.8, 1, 0, 1,
-0.8845174, -0.708986, -3.219238, 0.7921569, 1, 0, 1,
-0.8791119, 0.7196665, -2.182332, 0.7882353, 1, 0, 1,
-0.8762957, 0.9896827, 0.1789968, 0.7803922, 1, 0, 1,
-0.8719005, -0.2372777, -1.076903, 0.7764706, 1, 0, 1,
-0.8691549, -1.164719, -1.957419, 0.7686275, 1, 0, 1,
-0.867678, 0.4117081, -1.783043, 0.7647059, 1, 0, 1,
-0.8645796, 0.13308, -1.890483, 0.7568628, 1, 0, 1,
-0.8586663, -0.147148, -0.6555597, 0.7529412, 1, 0, 1,
-0.8554696, -0.6457544, -1.492859, 0.7450981, 1, 0, 1,
-0.850762, 0.3700781, -2.31729, 0.7411765, 1, 0, 1,
-0.8485197, 1.28137, -1.361344, 0.7333333, 1, 0, 1,
-0.84794, -0.2272297, -2.620167, 0.7294118, 1, 0, 1,
-0.846297, -0.03135277, -2.332714, 0.7215686, 1, 0, 1,
-0.8365502, 1.179568, -0.6378009, 0.7176471, 1, 0, 1,
-0.829821, 0.500708, -1.698808, 0.7098039, 1, 0, 1,
-0.8257403, 0.05201726, -0.8283799, 0.7058824, 1, 0, 1,
-0.8180294, -0.655924, -0.7912474, 0.6980392, 1, 0, 1,
-0.8178509, -0.5034745, -1.14862, 0.6901961, 1, 0, 1,
-0.8090922, 1.071473, -0.9816114, 0.6862745, 1, 0, 1,
-0.8002287, 2.349201, -1.093518, 0.6784314, 1, 0, 1,
-0.7981355, -0.3293747, -2.745804, 0.6745098, 1, 0, 1,
-0.7955448, 0.1493104, -1.92873, 0.6666667, 1, 0, 1,
-0.7921291, -1.228981, -3.460163, 0.6627451, 1, 0, 1,
-0.7908861, -0.1434986, -1.670639, 0.654902, 1, 0, 1,
-0.7889361, 0.6909609, -0.3743204, 0.6509804, 1, 0, 1,
-0.7828529, 1.113875, 0.8567402, 0.6431373, 1, 0, 1,
-0.7766661, 0.3145739, -2.084661, 0.6392157, 1, 0, 1,
-0.7714391, 0.3060754, -0.03550787, 0.6313726, 1, 0, 1,
-0.7710471, -0.6266813, -2.350949, 0.627451, 1, 0, 1,
-0.7673911, 0.3110646, -0.03623465, 0.6196079, 1, 0, 1,
-0.7671352, 0.7665966, -1.528606, 0.6156863, 1, 0, 1,
-0.7670398, 0.6903719, 0.3505615, 0.6078432, 1, 0, 1,
-0.7667497, -0.4706426, -1.278456, 0.6039216, 1, 0, 1,
-0.7655921, -0.4508844, -1.216974, 0.5960785, 1, 0, 1,
-0.7619966, 1.681675, -0.4841259, 0.5882353, 1, 0, 1,
-0.7612042, 0.8314562, -1.614216, 0.5843138, 1, 0, 1,
-0.7557451, -0.4438641, -1.303972, 0.5764706, 1, 0, 1,
-0.7504973, -1.745098, -4.196753, 0.572549, 1, 0, 1,
-0.7466648, 0.1907945, -0.5708812, 0.5647059, 1, 0, 1,
-0.7453418, -0.03570322, -3.886155, 0.5607843, 1, 0, 1,
-0.74142, -0.7194424, -3.783784, 0.5529412, 1, 0, 1,
-0.7400934, 0.7949177, -1.467716, 0.5490196, 1, 0, 1,
-0.7298021, -1.383505, -2.51555, 0.5411765, 1, 0, 1,
-0.7263056, 0.2754765, -1.040607, 0.5372549, 1, 0, 1,
-0.7261502, -0.6641759, -3.159247, 0.5294118, 1, 0, 1,
-0.7235982, -1.718909, -3.023031, 0.5254902, 1, 0, 1,
-0.7223247, 1.869845, 0.7636855, 0.5176471, 1, 0, 1,
-0.7213558, -0.4008842, -1.808918, 0.5137255, 1, 0, 1,
-0.7192345, 0.708588, 0.8579938, 0.5058824, 1, 0, 1,
-0.7091314, 0.2647959, -0.04159625, 0.5019608, 1, 0, 1,
-0.7087177, 1.590908, -1.692565, 0.4941176, 1, 0, 1,
-0.7051778, 0.6854085, -0.4169879, 0.4862745, 1, 0, 1,
-0.7051409, -0.1624958, -2.281316, 0.4823529, 1, 0, 1,
-0.7008813, 1.157791, -0.1068007, 0.4745098, 1, 0, 1,
-0.6854137, 0.4488885, -0.02621475, 0.4705882, 1, 0, 1,
-0.6790378, -0.9298841, -3.684848, 0.4627451, 1, 0, 1,
-0.673855, 0.1333859, 1.315604, 0.4588235, 1, 0, 1,
-0.6732894, -0.5093249, -2.215525, 0.4509804, 1, 0, 1,
-0.6726566, 0.9640856, -1.143098, 0.4470588, 1, 0, 1,
-0.6658702, -0.3490522, -1.450037, 0.4392157, 1, 0, 1,
-0.6554646, -0.1439745, -2.065174, 0.4352941, 1, 0, 1,
-0.6551434, 0.8349724, -0.3440657, 0.427451, 1, 0, 1,
-0.6532565, 0.4194768, -1.271899, 0.4235294, 1, 0, 1,
-0.6453742, -0.6241722, -2.479299, 0.4156863, 1, 0, 1,
-0.6450691, 0.9504771, -0.2321013, 0.4117647, 1, 0, 1,
-0.6378778, -1.853835, -3.411453, 0.4039216, 1, 0, 1,
-0.6369843, 1.759514, -0.5802336, 0.3960784, 1, 0, 1,
-0.6319462, -0.1040484, -1.864055, 0.3921569, 1, 0, 1,
-0.6285058, -1.657342, -3.183223, 0.3843137, 1, 0, 1,
-0.6272489, 0.9486509, -0.6669809, 0.3803922, 1, 0, 1,
-0.6243418, 0.442376, -2.237758, 0.372549, 1, 0, 1,
-0.6238404, -1.499664, -2.300132, 0.3686275, 1, 0, 1,
-0.6171103, -0.8352242, -1.614553, 0.3607843, 1, 0, 1,
-0.6148997, 1.258025, -1.89036, 0.3568628, 1, 0, 1,
-0.6076871, 2.137537, -1.899842, 0.3490196, 1, 0, 1,
-0.6071895, -1.047718, -0.5065061, 0.345098, 1, 0, 1,
-0.6066818, -0.6743982, -2.624878, 0.3372549, 1, 0, 1,
-0.6015715, -0.2614525, -0.225231, 0.3333333, 1, 0, 1,
-0.5979443, 1.930758, 1.303007, 0.3254902, 1, 0, 1,
-0.5968348, -0.6833444, -1.851796, 0.3215686, 1, 0, 1,
-0.5961335, 1.108062, 0.3094335, 0.3137255, 1, 0, 1,
-0.596088, 1.411271, -0.2609602, 0.3098039, 1, 0, 1,
-0.5946131, -0.6806929, -2.363663, 0.3019608, 1, 0, 1,
-0.5933146, 0.9588711, 0.3913819, 0.2941177, 1, 0, 1,
-0.5903262, -1.725235, -0.5895029, 0.2901961, 1, 0, 1,
-0.590041, 1.139104, 1.359192, 0.282353, 1, 0, 1,
-0.5860604, 0.5772043, -1.068465, 0.2784314, 1, 0, 1,
-0.5839085, 1.966735, 0.068452, 0.2705882, 1, 0, 1,
-0.5819251, -0.0699163, -0.9428465, 0.2666667, 1, 0, 1,
-0.5815597, -0.4756497, -3.287413, 0.2588235, 1, 0, 1,
-0.5770476, 0.7821203, -0.06226811, 0.254902, 1, 0, 1,
-0.5739957, 0.04031305, -1.119768, 0.2470588, 1, 0, 1,
-0.5732087, -0.4572731, -1.001601, 0.2431373, 1, 0, 1,
-0.5705263, -1.205018, -2.604378, 0.2352941, 1, 0, 1,
-0.5670058, -1.069435, -3.05933, 0.2313726, 1, 0, 1,
-0.5654334, 0.7827861, -0.3945208, 0.2235294, 1, 0, 1,
-0.564138, -0.7854242, -3.007444, 0.2196078, 1, 0, 1,
-0.5620005, -2.435158, -4.932796, 0.2117647, 1, 0, 1,
-0.5590635, 1.593032, 0.1712278, 0.2078431, 1, 0, 1,
-0.5432029, 0.8499846, 1.060803, 0.2, 1, 0, 1,
-0.540676, -0.6012235, -1.025716, 0.1921569, 1, 0, 1,
-0.5404813, -0.7068222, -1.747725, 0.1882353, 1, 0, 1,
-0.5399758, 0.5054926, -1.543059, 0.1803922, 1, 0, 1,
-0.5384973, -2.13097, -2.783389, 0.1764706, 1, 0, 1,
-0.5287722, -0.5730837, -2.650391, 0.1686275, 1, 0, 1,
-0.52701, -0.971497, -1.071522, 0.1647059, 1, 0, 1,
-0.5260902, -1.11041, -2.935194, 0.1568628, 1, 0, 1,
-0.5251552, 0.4863273, -0.01802154, 0.1529412, 1, 0, 1,
-0.5246426, -0.6776851, -2.434894, 0.145098, 1, 0, 1,
-0.5082868, -2.055677, -4.134263, 0.1411765, 1, 0, 1,
-0.5077898, -0.03489293, -1.650217, 0.1333333, 1, 0, 1,
-0.4976044, -0.1839231, -0.5954956, 0.1294118, 1, 0, 1,
-0.4945524, -0.06884175, -1.819075, 0.1215686, 1, 0, 1,
-0.4922719, 0.4044465, -1.002029, 0.1176471, 1, 0, 1,
-0.4904782, 0.9709006, 0.6378361, 0.1098039, 1, 0, 1,
-0.4888632, -0.2045161, -2.809563, 0.1058824, 1, 0, 1,
-0.4874501, -0.3327964, -2.24347, 0.09803922, 1, 0, 1,
-0.4833928, 1.580978, -2.770317, 0.09019608, 1, 0, 1,
-0.483191, 0.5230297, -0.9502149, 0.08627451, 1, 0, 1,
-0.4807782, 0.4619671, 2.058546, 0.07843138, 1, 0, 1,
-0.4791843, 1.344185, -1.767526, 0.07450981, 1, 0, 1,
-0.4762173, -0.3359217, -2.717261, 0.06666667, 1, 0, 1,
-0.4758935, -0.484775, -2.232512, 0.0627451, 1, 0, 1,
-0.47464, 0.6391536, -0.1719108, 0.05490196, 1, 0, 1,
-0.4706479, -0.873906, -0.7904333, 0.05098039, 1, 0, 1,
-0.4702287, 0.5809196, -1.000461, 0.04313726, 1, 0, 1,
-0.469772, -0.1373054, -0.9995123, 0.03921569, 1, 0, 1,
-0.4668605, -0.6217059, -1.550015, 0.03137255, 1, 0, 1,
-0.4596457, -0.6496582, -1.300331, 0.02745098, 1, 0, 1,
-0.4595276, -0.5371826, -2.835211, 0.01960784, 1, 0, 1,
-0.4578057, -0.02970231, -3.14225, 0.01568628, 1, 0, 1,
-0.4533343, 1.268114, 0.244608, 0.007843138, 1, 0, 1,
-0.4525081, -0.9932199, -1.318312, 0.003921569, 1, 0, 1,
-0.4511526, 0.3923566, 1.284731, 0, 1, 0.003921569, 1,
-0.4501329, -0.4205455, -2.901174, 0, 1, 0.01176471, 1,
-0.4452392, 1.839724, 0.5260524, 0, 1, 0.01568628, 1,
-0.444099, 1.724725, -0.04664248, 0, 1, 0.02352941, 1,
-0.4419158, -1.677868, -2.220534, 0, 1, 0.02745098, 1,
-0.4392902, -1.259106, -2.125546, 0, 1, 0.03529412, 1,
-0.4377801, -0.08694154, -2.51012, 0, 1, 0.03921569, 1,
-0.4351928, -0.5993978, -1.078684, 0, 1, 0.04705882, 1,
-0.4337844, 0.4635254, -1.159643, 0, 1, 0.05098039, 1,
-0.4297882, -0.2700916, -2.005528, 0, 1, 0.05882353, 1,
-0.4223633, -1.784622, -2.696108, 0, 1, 0.0627451, 1,
-0.4157343, 0.2591, 0.7787654, 0, 1, 0.07058824, 1,
-0.4088161, -0.06673887, -1.867752, 0, 1, 0.07450981, 1,
-0.4082754, -0.3954602, -1.752689, 0, 1, 0.08235294, 1,
-0.4062585, -0.349494, -1.126432, 0, 1, 0.08627451, 1,
-0.4027816, 0.2258437, 0.921033, 0, 1, 0.09411765, 1,
-0.3946342, 0.8628798, -0.6748937, 0, 1, 0.1019608, 1,
-0.391908, 0.6402583, -0.4181238, 0, 1, 0.1058824, 1,
-0.3915448, 1.171972, -0.09296124, 0, 1, 0.1137255, 1,
-0.388849, -0.5575065, -0.9393709, 0, 1, 0.1176471, 1,
-0.3880053, -1.167332, -4.437397, 0, 1, 0.1254902, 1,
-0.3857468, 0.7696797, 1.091372, 0, 1, 0.1294118, 1,
-0.384771, 1.359855, -0.8546969, 0, 1, 0.1372549, 1,
-0.3847186, 0.338055, -0.4795311, 0, 1, 0.1411765, 1,
-0.3845468, 0.09258461, -0.9075199, 0, 1, 0.1490196, 1,
-0.380376, -0.7955495, -3.603916, 0, 1, 0.1529412, 1,
-0.3790568, 0.8324395, -0.02567021, 0, 1, 0.1607843, 1,
-0.3787574, -0.3834806, -1.630211, 0, 1, 0.1647059, 1,
-0.3775486, -1.328593, -4.030525, 0, 1, 0.172549, 1,
-0.3772298, 0.4596113, 0.5398993, 0, 1, 0.1764706, 1,
-0.3763762, 0.06651653, -1.617589, 0, 1, 0.1843137, 1,
-0.3758377, 0.6833899, 0.4356308, 0, 1, 0.1882353, 1,
-0.3689492, 1.990066, 1.063847, 0, 1, 0.1960784, 1,
-0.365124, 0.1497317, -1.25918, 0, 1, 0.2039216, 1,
-0.3640533, 0.6267353, -0.9738092, 0, 1, 0.2078431, 1,
-0.3601924, -0.8026814, -4.046239, 0, 1, 0.2156863, 1,
-0.3575763, -1.365921, -3.935421, 0, 1, 0.2196078, 1,
-0.3538855, -0.1843747, -2.098758, 0, 1, 0.227451, 1,
-0.3534938, -2.58149, -3.376243, 0, 1, 0.2313726, 1,
-0.3512992, 1.45891, -1.925619, 0, 1, 0.2392157, 1,
-0.350375, -0.7682334, -4.720194, 0, 1, 0.2431373, 1,
-0.3473069, -1.359413, -1.898158, 0, 1, 0.2509804, 1,
-0.3270736, 0.8205487, -0.5232224, 0, 1, 0.254902, 1,
-0.3265509, -0.2534432, -1.370086, 0, 1, 0.2627451, 1,
-0.3262633, -0.5292643, -1.906648, 0, 1, 0.2666667, 1,
-0.3258993, -0.2143987, -4.48513, 0, 1, 0.2745098, 1,
-0.3218825, -0.3385936, -4.591169, 0, 1, 0.2784314, 1,
-0.3217385, -1.290421, -2.276372, 0, 1, 0.2862745, 1,
-0.3155281, -0.3664988, -0.3844085, 0, 1, 0.2901961, 1,
-0.3103983, -0.07762226, -0.5453467, 0, 1, 0.2980392, 1,
-0.3098367, -0.9660538, -4.008081, 0, 1, 0.3058824, 1,
-0.307591, -0.5599119, -0.7160106, 0, 1, 0.3098039, 1,
-0.3073012, 0.8016559, -0.3439853, 0, 1, 0.3176471, 1,
-0.3071595, 0.8750019, -0.8229811, 0, 1, 0.3215686, 1,
-0.3063597, -0.3345163, -1.780415, 0, 1, 0.3294118, 1,
-0.2951456, -0.6195982, -3.696588, 0, 1, 0.3333333, 1,
-0.2926411, -0.5465962, -2.334348, 0, 1, 0.3411765, 1,
-0.2872948, -1.176813, -2.755678, 0, 1, 0.345098, 1,
-0.2870578, 0.5791293, -0.2301064, 0, 1, 0.3529412, 1,
-0.2866849, 0.2809384, 0.2770793, 0, 1, 0.3568628, 1,
-0.2848433, 1.216501, -0.8151818, 0, 1, 0.3647059, 1,
-0.2841025, -0.4685694, -4.746542, 0, 1, 0.3686275, 1,
-0.2833304, 1.055872, -1.306675, 0, 1, 0.3764706, 1,
-0.2757919, 1.63032, 0.1602078, 0, 1, 0.3803922, 1,
-0.2725457, -1.304697, -1.850978, 0, 1, 0.3882353, 1,
-0.2718596, -0.218523, -2.359481, 0, 1, 0.3921569, 1,
-0.2691816, -0.6709494, -2.70623, 0, 1, 0.4, 1,
-0.267678, 0.514219, -0.3657428, 0, 1, 0.4078431, 1,
-0.2661785, 0.1477326, -1.47071, 0, 1, 0.4117647, 1,
-0.2660683, 1.206671, 1.225302, 0, 1, 0.4196078, 1,
-0.2645399, -1.027591, -2.777691, 0, 1, 0.4235294, 1,
-0.2643997, 1.109805, -1.586779, 0, 1, 0.4313726, 1,
-0.2630719, 1.710764, -1.195902, 0, 1, 0.4352941, 1,
-0.2606953, 0.628038, -0.7064976, 0, 1, 0.4431373, 1,
-0.2585986, -0.6288216, -1.806048, 0, 1, 0.4470588, 1,
-0.2566852, 0.5832182, -0.805474, 0, 1, 0.454902, 1,
-0.2549572, -0.04586997, -3.433071, 0, 1, 0.4588235, 1,
-0.2516491, 0.7945213, -1.453614, 0, 1, 0.4666667, 1,
-0.2498045, 1.121892, 0.1370524, 0, 1, 0.4705882, 1,
-0.2472335, 0.5321724, -1.075765, 0, 1, 0.4784314, 1,
-0.2447021, 3.457649, -1.166533, 0, 1, 0.4823529, 1,
-0.2442258, -0.9426085, -2.257871, 0, 1, 0.4901961, 1,
-0.2430877, 0.7214808, 1.431175, 0, 1, 0.4941176, 1,
-0.2411785, 0.9163579, 0.858328, 0, 1, 0.5019608, 1,
-0.2372674, -1.167675, -3.022005, 0, 1, 0.509804, 1,
-0.2333568, -0.6573454, -1.800849, 0, 1, 0.5137255, 1,
-0.2311142, -0.9235082, -3.423656, 0, 1, 0.5215687, 1,
-0.2281678, 2.043375, -0.4289715, 0, 1, 0.5254902, 1,
-0.2256877, -0.4589441, -0.7181352, 0, 1, 0.5333334, 1,
-0.2240853, -0.7452905, -1.781722, 0, 1, 0.5372549, 1,
-0.2231792, -0.7257285, -2.263775, 0, 1, 0.5450981, 1,
-0.2196539, 0.313419, 0.2843717, 0, 1, 0.5490196, 1,
-0.2156464, -1.145303, -2.936038, 0, 1, 0.5568628, 1,
-0.2125963, 0.9545557, 0.8003741, 0, 1, 0.5607843, 1,
-0.2090519, 0.1737823, 0.3804874, 0, 1, 0.5686275, 1,
-0.2047463, 1.940453, 0.3862143, 0, 1, 0.572549, 1,
-0.2040615, -0.5027367, -1.214924, 0, 1, 0.5803922, 1,
-0.1981505, 0.4678841, -0.2783945, 0, 1, 0.5843138, 1,
-0.1916882, -0.2184013, -1.996437, 0, 1, 0.5921569, 1,
-0.1910146, -1.828613, -1.28173, 0, 1, 0.5960785, 1,
-0.1903086, -0.2795215, -2.454938, 0, 1, 0.6039216, 1,
-0.1877165, 0.0392104, -2.515677, 0, 1, 0.6117647, 1,
-0.1779315, -0.3792221, -1.571505, 0, 1, 0.6156863, 1,
-0.1768873, -0.4166658, -2.061085, 0, 1, 0.6235294, 1,
-0.1747127, -0.5990829, -4.752716, 0, 1, 0.627451, 1,
-0.1715334, 0.6224957, -2.697094, 0, 1, 0.6352941, 1,
-0.1708245, 0.8990725, 0.08466259, 0, 1, 0.6392157, 1,
-0.1700162, -1.999466, -2.660088, 0, 1, 0.6470588, 1,
-0.1695618, 1.810238, -1.995822, 0, 1, 0.6509804, 1,
-0.1689189, 1.768776, -0.4767073, 0, 1, 0.6588235, 1,
-0.1668686, -0.2219869, -2.952455, 0, 1, 0.6627451, 1,
-0.1629725, -1.461177, -4.613875, 0, 1, 0.6705883, 1,
-0.1617509, 0.989132, -0.7568733, 0, 1, 0.6745098, 1,
-0.1610051, -0.5381819, -2.425593, 0, 1, 0.682353, 1,
-0.1599794, -0.3227374, -3.329156, 0, 1, 0.6862745, 1,
-0.1583603, -0.1374868, -1.875363, 0, 1, 0.6941177, 1,
-0.1558845, -0.4394183, -3.527137, 0, 1, 0.7019608, 1,
-0.1542188, 0.3638262, -0.7900627, 0, 1, 0.7058824, 1,
-0.150797, -0.2800928, -1.566887, 0, 1, 0.7137255, 1,
-0.1437052, 0.04161348, -0.5943008, 0, 1, 0.7176471, 1,
-0.1436476, -0.5115216, -1.931931, 0, 1, 0.7254902, 1,
-0.1430192, -0.4128995, -3.645001, 0, 1, 0.7294118, 1,
-0.1408965, -0.1660891, -3.468265, 0, 1, 0.7372549, 1,
-0.1387327, 1.815416, -1.296118, 0, 1, 0.7411765, 1,
-0.1360337, 0.1554423, -1.092717, 0, 1, 0.7490196, 1,
-0.1349079, -1.97943, -2.080956, 0, 1, 0.7529412, 1,
-0.1346533, 0.6022146, 0.04327909, 0, 1, 0.7607843, 1,
-0.1332186, -0.1988191, -3.527409, 0, 1, 0.7647059, 1,
-0.130495, 0.7173885, -0.6579807, 0, 1, 0.772549, 1,
-0.1301153, 0.7528904, -0.7255214, 0, 1, 0.7764706, 1,
-0.1284201, -0.9368222, -2.98106, 0, 1, 0.7843137, 1,
-0.1250362, -0.9148959, -3.267164, 0, 1, 0.7882353, 1,
-0.1237692, 0.06838026, -1.523931, 0, 1, 0.7960784, 1,
-0.1214309, 0.1798781, -0.9609947, 0, 1, 0.8039216, 1,
-0.1211948, 0.7815688, 0.1732993, 0, 1, 0.8078431, 1,
-0.1106558, -0.9938845, -3.298577, 0, 1, 0.8156863, 1,
-0.1081393, -0.1059255, -2.776526, 0, 1, 0.8196079, 1,
-0.1068246, -0.03080027, -1.52953, 0, 1, 0.827451, 1,
-0.1067179, -1.093261, -2.147208, 0, 1, 0.8313726, 1,
-0.1063506, 1.346075, -1.714851, 0, 1, 0.8392157, 1,
-0.1062211, 1.539435, 1.043175, 0, 1, 0.8431373, 1,
-0.09861916, 0.2880095, 0.7044943, 0, 1, 0.8509804, 1,
-0.09854373, 0.076161, 0.591648, 0, 1, 0.854902, 1,
-0.09812837, -0.1638668, -1.743551, 0, 1, 0.8627451, 1,
-0.09443022, 0.4114663, -0.6241844, 0, 1, 0.8666667, 1,
-0.09438757, -0.256154, -2.596161, 0, 1, 0.8745098, 1,
-0.09211332, -0.1547198, -2.30287, 0, 1, 0.8784314, 1,
-0.08985228, 0.5184658, -0.1360182, 0, 1, 0.8862745, 1,
-0.0896908, -0.5864304, -2.694052, 0, 1, 0.8901961, 1,
-0.08541224, -0.02401284, -1.37299, 0, 1, 0.8980392, 1,
-0.08294506, 2.535131, 0.4798899, 0, 1, 0.9058824, 1,
-0.0797755, -0.09691823, -3.29843, 0, 1, 0.9098039, 1,
-0.07896335, 0.04447411, -1.629328, 0, 1, 0.9176471, 1,
-0.07878489, -0.0177427, -0.4220181, 0, 1, 0.9215686, 1,
-0.07129145, -1.524665, -3.469222, 0, 1, 0.9294118, 1,
-0.07010268, -0.01894101, -1.310042, 0, 1, 0.9333333, 1,
-0.06879927, -0.08108541, -3.815172, 0, 1, 0.9411765, 1,
-0.05995533, 1.182598, 0.9190649, 0, 1, 0.945098, 1,
-0.05862437, -0.5804884, -3.344096, 0, 1, 0.9529412, 1,
-0.05453255, 1.276776, -0.5333309, 0, 1, 0.9568627, 1,
-0.05274114, 0.6368262, -1.444085, 0, 1, 0.9647059, 1,
-0.05139577, -1.658225, -3.379552, 0, 1, 0.9686275, 1,
-0.05036002, 1.168538, 1.815403, 0, 1, 0.9764706, 1,
-0.04612399, 0.02385024, -1.023794, 0, 1, 0.9803922, 1,
-0.04416074, 0.256458, -1.074761, 0, 1, 0.9882353, 1,
-0.04343628, -0.7009896, -2.349355, 0, 1, 0.9921569, 1,
-0.03812294, -0.4731303, -3.347307, 0, 1, 1, 1,
-0.03614183, 0.5437502, -0.927514, 0, 0.9921569, 1, 1,
-0.0347065, 0.8916348, 0.620867, 0, 0.9882353, 1, 1,
-0.034263, 0.506908, -0.3594519, 0, 0.9803922, 1, 1,
-0.03399502, 1.159414, -0.3392619, 0, 0.9764706, 1, 1,
-0.03099617, 1.504495, -1.090118, 0, 0.9686275, 1, 1,
-0.02856234, -1.647879, -3.262254, 0, 0.9647059, 1, 1,
-0.02440524, 1.662212, -1.273037, 0, 0.9568627, 1, 1,
-0.02364371, 0.0124227, -0.1741632, 0, 0.9529412, 1, 1,
-0.008154669, -0.8838399, -1.886165, 0, 0.945098, 1, 1,
-0.007867913, -0.0698357, -1.550651, 0, 0.9411765, 1, 1,
-7.086757e-05, 1.273439, 1.289818, 0, 0.9333333, 1, 1,
0.0005389082, -0.9806299, 3.423982, 0, 0.9294118, 1, 1,
0.001628535, -0.2999203, 1.82504, 0, 0.9215686, 1, 1,
0.00185227, 1.574759, 1.335074, 0, 0.9176471, 1, 1,
0.002877229, 0.468489, -0.9233152, 0, 0.9098039, 1, 1,
0.005445467, 0.151688, 0.4083231, 0, 0.9058824, 1, 1,
0.01270717, -0.5885741, 4.939803, 0, 0.8980392, 1, 1,
0.01284358, -0.8637477, 4.968604, 0, 0.8901961, 1, 1,
0.01461646, 0.9563952, -0.7273927, 0, 0.8862745, 1, 1,
0.01510418, 0.2973702, 0.9477444, 0, 0.8784314, 1, 1,
0.01644945, -1.697129, 2.182235, 0, 0.8745098, 1, 1,
0.01732514, 1.331828, -1.189338, 0, 0.8666667, 1, 1,
0.01971283, -0.6324944, 2.356718, 0, 0.8627451, 1, 1,
0.02531429, -0.7301349, 2.525053, 0, 0.854902, 1, 1,
0.03023308, -0.4402818, 2.062975, 0, 0.8509804, 1, 1,
0.03162419, 0.3385078, -0.3506696, 0, 0.8431373, 1, 1,
0.03214353, 0.4569906, -0.2558166, 0, 0.8392157, 1, 1,
0.03300117, -1.507113, 2.008755, 0, 0.8313726, 1, 1,
0.03321302, 0.1765545, -0.5265282, 0, 0.827451, 1, 1,
0.038876, -0.06789512, 1.608036, 0, 0.8196079, 1, 1,
0.04144644, -0.05866656, 2.651212, 0, 0.8156863, 1, 1,
0.04655476, 0.9110076, 0.4318205, 0, 0.8078431, 1, 1,
0.04838653, -0.3238699, 2.971946, 0, 0.8039216, 1, 1,
0.05175795, -0.4767743, 3.544499, 0, 0.7960784, 1, 1,
0.05438767, -1.612039, 2.927937, 0, 0.7882353, 1, 1,
0.05692494, -0.7380365, 2.059487, 0, 0.7843137, 1, 1,
0.05822966, 1.020292, 0.2400782, 0, 0.7764706, 1, 1,
0.06339302, 2.670193, 1.414963, 0, 0.772549, 1, 1,
0.06359419, 1.447901, -1.352511, 0, 0.7647059, 1, 1,
0.06440558, 0.2350879, 0.8896649, 0, 0.7607843, 1, 1,
0.0705185, -0.4260288, 2.966349, 0, 0.7529412, 1, 1,
0.07289168, 0.09304395, 0.8631945, 0, 0.7490196, 1, 1,
0.0729915, 0.1373209, -0.05115718, 0, 0.7411765, 1, 1,
0.07421999, -1.070675, 2.966881, 0, 0.7372549, 1, 1,
0.07946346, -0.4807032, 2.362018, 0, 0.7294118, 1, 1,
0.08067235, 1.38078, -1.868067, 0, 0.7254902, 1, 1,
0.08401719, 0.3678251, 0.04380516, 0, 0.7176471, 1, 1,
0.09063393, -0.05448158, 1.35798, 0, 0.7137255, 1, 1,
0.09297712, 0.6049633, -0.2489142, 0, 0.7058824, 1, 1,
0.09602601, 0.5051644, 2.50096, 0, 0.6980392, 1, 1,
0.0966284, -0.7402002, 3.200424, 0, 0.6941177, 1, 1,
0.09846489, 0.3023772, -1.19219, 0, 0.6862745, 1, 1,
0.09872845, 0.8414694, -0.9998721, 0, 0.682353, 1, 1,
0.09916703, 0.7146445, -0.4436564, 0, 0.6745098, 1, 1,
0.1072353, -0.2222582, 2.532498, 0, 0.6705883, 1, 1,
0.1079486, -0.7268115, 4.431486, 0, 0.6627451, 1, 1,
0.1108906, -0.09430286, 1.932404, 0, 0.6588235, 1, 1,
0.1145141, -0.7965645, 4.097547, 0, 0.6509804, 1, 1,
0.1151784, 2.093231, 1.630987, 0, 0.6470588, 1, 1,
0.1155215, -0.5669197, 1.637566, 0, 0.6392157, 1, 1,
0.1194703, 0.6127628, -2.118558, 0, 0.6352941, 1, 1,
0.1285585, 1.051036, -2.650114, 0, 0.627451, 1, 1,
0.1305329, 1.977055, -1.31981, 0, 0.6235294, 1, 1,
0.1328006, 0.9092779, -0.775093, 0, 0.6156863, 1, 1,
0.1369579, -0.2875567, 3.540092, 0, 0.6117647, 1, 1,
0.1424022, 0.684432, 0.9203976, 0, 0.6039216, 1, 1,
0.1449924, 0.4493796, 0.9414988, 0, 0.5960785, 1, 1,
0.1450829, 1.470887, 0.4184645, 0, 0.5921569, 1, 1,
0.1452329, -1.62844, 3.272956, 0, 0.5843138, 1, 1,
0.1493552, 0.981718, 0.128617, 0, 0.5803922, 1, 1,
0.1502884, -0.8046855, 1.295206, 0, 0.572549, 1, 1,
0.1520741, 0.3663519, 1.601675, 0, 0.5686275, 1, 1,
0.153448, 0.7323331, -0.3394969, 0, 0.5607843, 1, 1,
0.1546947, -0.9063222, 4.91858, 0, 0.5568628, 1, 1,
0.1600226, -0.6439851, 3.532681, 0, 0.5490196, 1, 1,
0.1614364, -0.3004116, 3.687303, 0, 0.5450981, 1, 1,
0.1735287, -0.3395715, 2.538578, 0, 0.5372549, 1, 1,
0.176492, 0.3762721, -0.8810073, 0, 0.5333334, 1, 1,
0.1788227, -1.650941, 3.71821, 0, 0.5254902, 1, 1,
0.1796131, 0.09561647, 1.077601, 0, 0.5215687, 1, 1,
0.1828039, 1.226711, 0.8196896, 0, 0.5137255, 1, 1,
0.1863786, 0.927812, -0.01929378, 0, 0.509804, 1, 1,
0.1865928, 0.8699551, -0.9825469, 0, 0.5019608, 1, 1,
0.1868629, -1.647798, 4.04507, 0, 0.4941176, 1, 1,
0.1939755, -0.2782649, 1.136778, 0, 0.4901961, 1, 1,
0.194773, 1.188096, -0.8792924, 0, 0.4823529, 1, 1,
0.1947993, -0.8380376, 2.405333, 0, 0.4784314, 1, 1,
0.1951342, -0.2614484, 2.57394, 0, 0.4705882, 1, 1,
0.1971159, -0.06614639, 0.7452536, 0, 0.4666667, 1, 1,
0.2010397, -0.5694832, 1.026219, 0, 0.4588235, 1, 1,
0.2045288, -2.299638, 0.8556041, 0, 0.454902, 1, 1,
0.2059788, 0.4755081, -0.7093524, 0, 0.4470588, 1, 1,
0.2073889, 1.58172, 1.613393, 0, 0.4431373, 1, 1,
0.2082621, 0.66884, 1.326139, 0, 0.4352941, 1, 1,
0.2086931, 1.377311, -1.548345, 0, 0.4313726, 1, 1,
0.2115431, -1.8229, 4.326522, 0, 0.4235294, 1, 1,
0.2148932, 0.9229125, -0.3622252, 0, 0.4196078, 1, 1,
0.2162859, -0.4337854, 3.517186, 0, 0.4117647, 1, 1,
0.2202212, 0.04523031, 2.656927, 0, 0.4078431, 1, 1,
0.2202627, 1.338672, -0.7885647, 0, 0.4, 1, 1,
0.2211666, 0.3345718, 1.860376, 0, 0.3921569, 1, 1,
0.2232863, 0.4175654, -0.1807577, 0, 0.3882353, 1, 1,
0.2247885, 1.720937, -0.9707367, 0, 0.3803922, 1, 1,
0.2279207, 0.7223811, 1.145236, 0, 0.3764706, 1, 1,
0.231472, 0.6142913, -0.2222396, 0, 0.3686275, 1, 1,
0.2371838, 0.7936007, -0.9548081, 0, 0.3647059, 1, 1,
0.2378716, 0.4004573, -0.7776716, 0, 0.3568628, 1, 1,
0.2395985, 1.554226, -0.1121505, 0, 0.3529412, 1, 1,
0.2487466, -0.7460502, 3.074459, 0, 0.345098, 1, 1,
0.249913, -2.443285, 4.756799, 0, 0.3411765, 1, 1,
0.2525277, -0.563809, 4.712476, 0, 0.3333333, 1, 1,
0.2529694, 0.9412063, 1.791416, 0, 0.3294118, 1, 1,
0.2609032, -1.924862, 4.101991, 0, 0.3215686, 1, 1,
0.2627031, -0.8859019, 2.092953, 0, 0.3176471, 1, 1,
0.2627135, 1.249345, -0.08208223, 0, 0.3098039, 1, 1,
0.2641802, 0.5170965, -0.7758768, 0, 0.3058824, 1, 1,
0.2679412, 1.418925, 0.8866874, 0, 0.2980392, 1, 1,
0.2689288, 1.871448, -0.6950554, 0, 0.2901961, 1, 1,
0.2755091, -0.9355462, 2.552058, 0, 0.2862745, 1, 1,
0.2766981, 0.1871967, 1.583481, 0, 0.2784314, 1, 1,
0.2806237, -1.511362, 3.923008, 0, 0.2745098, 1, 1,
0.2848939, -0.5569152, 3.424375, 0, 0.2666667, 1, 1,
0.2859147, 2.127682, 0.3703349, 0, 0.2627451, 1, 1,
0.2894246, -0.01320256, 1.42758, 0, 0.254902, 1, 1,
0.2897637, -0.1249439, 3.247624, 0, 0.2509804, 1, 1,
0.2933173, -0.5054483, 2.645363, 0, 0.2431373, 1, 1,
0.294126, -0.8627635, 3.277821, 0, 0.2392157, 1, 1,
0.3001652, -0.1595911, 1.720303, 0, 0.2313726, 1, 1,
0.3066045, -0.8951891, 1.014881, 0, 0.227451, 1, 1,
0.3082213, 0.1383565, 0.4893303, 0, 0.2196078, 1, 1,
0.3170626, -1.877279, 2.674246, 0, 0.2156863, 1, 1,
0.3179991, -0.7332336, 2.852815, 0, 0.2078431, 1, 1,
0.319018, 0.2891578, 1.273618, 0, 0.2039216, 1, 1,
0.321242, 1.44917, 0.3332995, 0, 0.1960784, 1, 1,
0.3228529, 0.1960161, -1.268219, 0, 0.1882353, 1, 1,
0.324988, -1.335377, 2.245481, 0, 0.1843137, 1, 1,
0.3272286, -1.377617, 1.341973, 0, 0.1764706, 1, 1,
0.3278874, 0.9810818, 0.3352958, 0, 0.172549, 1, 1,
0.3304696, -0.5342466, 2.883285, 0, 0.1647059, 1, 1,
0.3312253, 2.754318, 0.03509935, 0, 0.1607843, 1, 1,
0.3315201, -0.3339915, 3.375153, 0, 0.1529412, 1, 1,
0.3318621, 0.399522, 1.060261, 0, 0.1490196, 1, 1,
0.3374324, 0.1480002, 0.9608871, 0, 0.1411765, 1, 1,
0.3374707, -0.4430062, 1.228343, 0, 0.1372549, 1, 1,
0.3385608, -0.2282519, 1.701903, 0, 0.1294118, 1, 1,
0.3474224, -1.756305, 2.68872, 0, 0.1254902, 1, 1,
0.3488139, -0.513359, 3.280182, 0, 0.1176471, 1, 1,
0.3522588, 0.123894, 2.174542, 0, 0.1137255, 1, 1,
0.3563652, 0.7654567, 0.8288096, 0, 0.1058824, 1, 1,
0.3568137, 1.463967, 1.752911, 0, 0.09803922, 1, 1,
0.3637504, -0.4109613, 2.5974, 0, 0.09411765, 1, 1,
0.3667996, -0.2380725, 2.321739, 0, 0.08627451, 1, 1,
0.3689154, 0.8274136, -0.1106232, 0, 0.08235294, 1, 1,
0.3697719, 0.4921049, 1.654538, 0, 0.07450981, 1, 1,
0.3714481, 0.3117054, 0.6584603, 0, 0.07058824, 1, 1,
0.3721028, -0.585664, 1.187289, 0, 0.0627451, 1, 1,
0.3801121, 0.2830495, 0.05085648, 0, 0.05882353, 1, 1,
0.3810464, 1.043938, 0.9883646, 0, 0.05098039, 1, 1,
0.3825732, 0.5712106, 1.82907, 0, 0.04705882, 1, 1,
0.3830664, -0.5901432, 3.181081, 0, 0.03921569, 1, 1,
0.3889413, 0.2394238, 0.2457231, 0, 0.03529412, 1, 1,
0.3890235, -0.8775615, 3.407339, 0, 0.02745098, 1, 1,
0.3897443, 2.217451, 0.1347387, 0, 0.02352941, 1, 1,
0.3910103, -0.8546415, 1.576604, 0, 0.01568628, 1, 1,
0.3915831, -0.002675583, 0.00202943, 0, 0.01176471, 1, 1,
0.3917226, -0.9852069, 3.605638, 0, 0.003921569, 1, 1,
0.3919257, -2.849197, 1.884649, 0.003921569, 0, 1, 1,
0.3948768, 0.0904827, 1.035148, 0.007843138, 0, 1, 1,
0.3956516, 2.472492, -0.3373424, 0.01568628, 0, 1, 1,
0.3978925, -1.609866, 3.840536, 0.01960784, 0, 1, 1,
0.4006132, -0.3730453, 1.831882, 0.02745098, 0, 1, 1,
0.4090931, -0.6454641, 1.844902, 0.03137255, 0, 1, 1,
0.4125181, -1.435495, 2.409271, 0.03921569, 0, 1, 1,
0.4201546, 0.3823698, 3.269233, 0.04313726, 0, 1, 1,
0.4226967, -2.196986, 2.379369, 0.05098039, 0, 1, 1,
0.426488, 0.1292468, 1.43448, 0.05490196, 0, 1, 1,
0.427236, 0.7882893, -0.01155864, 0.0627451, 0, 1, 1,
0.4279394, 2.804622, 2.852855, 0.06666667, 0, 1, 1,
0.4341165, 0.01473064, 1.223045, 0.07450981, 0, 1, 1,
0.4345255, -0.8535956, 2.83993, 0.07843138, 0, 1, 1,
0.4383371, -0.9860791, 3.822951, 0.08627451, 0, 1, 1,
0.4405378, -0.5912982, 2.221281, 0.09019608, 0, 1, 1,
0.4428178, 1.131763, 0.8873997, 0.09803922, 0, 1, 1,
0.4448231, 0.4581381, 0.129186, 0.1058824, 0, 1, 1,
0.4482189, -0.7865737, 2.087856, 0.1098039, 0, 1, 1,
0.4482362, -0.9719264, 3.220196, 0.1176471, 0, 1, 1,
0.4514687, 0.1126731, 1.176446, 0.1215686, 0, 1, 1,
0.4540619, 0.9934581, -0.2925895, 0.1294118, 0, 1, 1,
0.4575217, 0.0889492, 2.386209, 0.1333333, 0, 1, 1,
0.4593638, 1.074944, 1.777616, 0.1411765, 0, 1, 1,
0.4600276, 0.6878023, 0.2355301, 0.145098, 0, 1, 1,
0.472572, 0.8316475, 0.7684811, 0.1529412, 0, 1, 1,
0.4811039, 0.8786874, -0.329942, 0.1568628, 0, 1, 1,
0.4982644, 2.280852, -1.043312, 0.1647059, 0, 1, 1,
0.4991254, -0.3938698, 2.697674, 0.1686275, 0, 1, 1,
0.4993645, -0.8738055, 2.56477, 0.1764706, 0, 1, 1,
0.4994753, -2.536536, 2.705241, 0.1803922, 0, 1, 1,
0.4998136, 0.7287441, 0.8757436, 0.1882353, 0, 1, 1,
0.5024775, -0.4670091, 3.760016, 0.1921569, 0, 1, 1,
0.5028575, 1.649117, 0.6039611, 0.2, 0, 1, 1,
0.5070022, 0.748822, 1.546045, 0.2078431, 0, 1, 1,
0.5070313, 0.5198061, 1.462782, 0.2117647, 0, 1, 1,
0.5116497, -0.04548487, 1.113049, 0.2196078, 0, 1, 1,
0.5135271, -0.6619536, 2.332749, 0.2235294, 0, 1, 1,
0.5154012, 0.5062474, 1.175245, 0.2313726, 0, 1, 1,
0.5229955, -0.9743498, 2.757392, 0.2352941, 0, 1, 1,
0.5253481, 0.065617, 1.607264, 0.2431373, 0, 1, 1,
0.5291565, -0.2850809, 1.92217, 0.2470588, 0, 1, 1,
0.5341713, -0.4550329, 2.237875, 0.254902, 0, 1, 1,
0.5369852, -0.684151, 0.791524, 0.2588235, 0, 1, 1,
0.5399824, -1.371309, 1.870052, 0.2666667, 0, 1, 1,
0.5494886, 0.2464881, 0.390622, 0.2705882, 0, 1, 1,
0.5578519, -1.259717, 1.949872, 0.2784314, 0, 1, 1,
0.5650862, 0.04357519, 1.146003, 0.282353, 0, 1, 1,
0.5704761, 0.1937364, 2.218178, 0.2901961, 0, 1, 1,
0.5723885, -0.03769689, 0.4373549, 0.2941177, 0, 1, 1,
0.5761046, -1.254421, 4.724807, 0.3019608, 0, 1, 1,
0.5797918, 0.6900773, 0.733206, 0.3098039, 0, 1, 1,
0.5854301, 0.7380317, 1.700742, 0.3137255, 0, 1, 1,
0.5857973, 0.5069792, 1.862289, 0.3215686, 0, 1, 1,
0.5862055, 1.828804, 0.812095, 0.3254902, 0, 1, 1,
0.5867912, -0.8593536, 3.531803, 0.3333333, 0, 1, 1,
0.5880287, -1.545839, 2.991936, 0.3372549, 0, 1, 1,
0.5932711, -0.8949741, 0.844291, 0.345098, 0, 1, 1,
0.59341, -0.4031489, 2.663615, 0.3490196, 0, 1, 1,
0.5977772, 0.7340718, 1.250437, 0.3568628, 0, 1, 1,
0.6024653, 1.095711, 1.71264, 0.3607843, 0, 1, 1,
0.6025433, -0.05273744, 2.369385, 0.3686275, 0, 1, 1,
0.6147366, 0.5318531, 0.4454762, 0.372549, 0, 1, 1,
0.6167489, 1.068268, 1.033945, 0.3803922, 0, 1, 1,
0.6177039, 0.4469588, 0.9565192, 0.3843137, 0, 1, 1,
0.6178688, 0.4832869, -1.532444, 0.3921569, 0, 1, 1,
0.618442, 1.337607, 1.429999, 0.3960784, 0, 1, 1,
0.6201805, -0.6565895, 2.020804, 0.4039216, 0, 1, 1,
0.6221734, -0.08545183, 2.611468, 0.4117647, 0, 1, 1,
0.6294817, -1.042593, 1.40701, 0.4156863, 0, 1, 1,
0.6306195, 0.4471065, 0.6920846, 0.4235294, 0, 1, 1,
0.6320633, -0.2833285, 0.657383, 0.427451, 0, 1, 1,
0.6322438, 1.341932, 0.274717, 0.4352941, 0, 1, 1,
0.6333433, -0.1710159, 1.675812, 0.4392157, 0, 1, 1,
0.6387947, 0.7399212, -0.5892178, 0.4470588, 0, 1, 1,
0.6401764, 3.263779, -0.9308376, 0.4509804, 0, 1, 1,
0.6410223, -1.047821, 2.221524, 0.4588235, 0, 1, 1,
0.6421489, -0.1155545, 3.060996, 0.4627451, 0, 1, 1,
0.6539672, -0.9068539, 3.696706, 0.4705882, 0, 1, 1,
0.6578261, -0.7355928, 2.833511, 0.4745098, 0, 1, 1,
0.6657543, -0.2938589, 0.902088, 0.4823529, 0, 1, 1,
0.66706, 0.6067883, -0.9275825, 0.4862745, 0, 1, 1,
0.6693409, 0.672459, 1.729004, 0.4941176, 0, 1, 1,
0.6696319, -0.7357216, 0.9996105, 0.5019608, 0, 1, 1,
0.670215, -1.329859, 3.958773, 0.5058824, 0, 1, 1,
0.6761394, 1.437577, 0.1929332, 0.5137255, 0, 1, 1,
0.6769306, -0.663725, 1.304135, 0.5176471, 0, 1, 1,
0.6817665, -1.942198, 3.130541, 0.5254902, 0, 1, 1,
0.6820093, -0.4689922, 2.815294, 0.5294118, 0, 1, 1,
0.6840324, -0.5711818, 3.156318, 0.5372549, 0, 1, 1,
0.6914136, 0.9081768, 2.585587, 0.5411765, 0, 1, 1,
0.6974905, 1.014707, -0.3646564, 0.5490196, 0, 1, 1,
0.6988312, -0.7288561, 1.556737, 0.5529412, 0, 1, 1,
0.7017748, 2.796963, -0.7626652, 0.5607843, 0, 1, 1,
0.7046294, -0.77999, 1.857159, 0.5647059, 0, 1, 1,
0.7054942, 0.6999076, 0.500393, 0.572549, 0, 1, 1,
0.7112696, 0.6264909, 2.369863, 0.5764706, 0, 1, 1,
0.7126724, -1.287073, 2.140814, 0.5843138, 0, 1, 1,
0.716401, 0.3919828, -0.7485481, 0.5882353, 0, 1, 1,
0.7185987, 2.073828, -0.4512289, 0.5960785, 0, 1, 1,
0.7224679, -0.5083004, 4.34359, 0.6039216, 0, 1, 1,
0.7230159, 0.881351, -0.8914119, 0.6078432, 0, 1, 1,
0.7230169, -2.613072, 2.584672, 0.6156863, 0, 1, 1,
0.7239454, -0.6142731, 2.541473, 0.6196079, 0, 1, 1,
0.7272071, 1.118363, 0.7466633, 0.627451, 0, 1, 1,
0.7290316, 0.124521, 1.58609, 0.6313726, 0, 1, 1,
0.7304272, -1.659749, 2.58146, 0.6392157, 0, 1, 1,
0.7342403, 1.45252, 0.4604886, 0.6431373, 0, 1, 1,
0.738468, 1.964393, 1.430236, 0.6509804, 0, 1, 1,
0.7388784, 0.1656131, -0.6965472, 0.654902, 0, 1, 1,
0.7477253, -0.4645263, 2.44047, 0.6627451, 0, 1, 1,
0.7505119, 2.262736, 0.05622648, 0.6666667, 0, 1, 1,
0.7533967, -0.01269761, 1.014901, 0.6745098, 0, 1, 1,
0.7661794, -0.7059277, 2.182949, 0.6784314, 0, 1, 1,
0.7663997, -0.2292609, 2.570057, 0.6862745, 0, 1, 1,
0.7678002, -1.075766, 2.009449, 0.6901961, 0, 1, 1,
0.768104, 0.075699, 1.372435, 0.6980392, 0, 1, 1,
0.76872, -1.342439, 2.480008, 0.7058824, 0, 1, 1,
0.7719721, -0.928316, 2.025438, 0.7098039, 0, 1, 1,
0.7795531, -1.457892, 1.353959, 0.7176471, 0, 1, 1,
0.780961, -0.01148172, 0.8898193, 0.7215686, 0, 1, 1,
0.7839175, 0.07302738, 2.310651, 0.7294118, 0, 1, 1,
0.7850747, 0.2976948, 1.141997, 0.7333333, 0, 1, 1,
0.7855023, -0.0474446, 2.759805, 0.7411765, 0, 1, 1,
0.7977349, 0.9567033, -1.323936, 0.7450981, 0, 1, 1,
0.797977, -1.242002, 4.112906, 0.7529412, 0, 1, 1,
0.8029572, -1.169238, 2.776891, 0.7568628, 0, 1, 1,
0.8068268, 1.36883, 2.547733, 0.7647059, 0, 1, 1,
0.8132295, 0.4791265, -0.2548146, 0.7686275, 0, 1, 1,
0.8141438, -0.2557034, 2.392181, 0.7764706, 0, 1, 1,
0.817041, 0.6107556, 0.2118132, 0.7803922, 0, 1, 1,
0.8215313, 0.8396059, -0.7792515, 0.7882353, 0, 1, 1,
0.8330706, 0.1945191, 1.334769, 0.7921569, 0, 1, 1,
0.841863, -0.2251382, 2.182687, 0.8, 0, 1, 1,
0.8486505, 0.6626841, 1.640082, 0.8078431, 0, 1, 1,
0.850731, -1.575998, 2.011428, 0.8117647, 0, 1, 1,
0.857207, 1.607418, 0.4305425, 0.8196079, 0, 1, 1,
0.8588569, 1.20723, 1.244504, 0.8235294, 0, 1, 1,
0.8607174, 0.3704616, 1.058972, 0.8313726, 0, 1, 1,
0.8621463, -0.4497938, 0.8211083, 0.8352941, 0, 1, 1,
0.8634418, -0.9269705, 4.053484, 0.8431373, 0, 1, 1,
0.8664951, 1.913186, 0.4640033, 0.8470588, 0, 1, 1,
0.8697175, -0.8002762, 2.138929, 0.854902, 0, 1, 1,
0.8708543, 0.872953, 1.013245, 0.8588235, 0, 1, 1,
0.8764375, 0.4435697, 0.3783318, 0.8666667, 0, 1, 1,
0.8769212, 0.6147195, 0.9905788, 0.8705882, 0, 1, 1,
0.8780228, 0.2315625, -0.3285337, 0.8784314, 0, 1, 1,
0.8856101, 0.1402079, 1.531304, 0.8823529, 0, 1, 1,
0.8897235, 0.1254182, 2.772795, 0.8901961, 0, 1, 1,
0.8952768, -1.106693, 2.813664, 0.8941177, 0, 1, 1,
0.8966358, 0.6983729, 0.4475703, 0.9019608, 0, 1, 1,
0.8998704, -0.7687496, 1.127409, 0.9098039, 0, 1, 1,
0.9011919, 0.05716716, 1.550155, 0.9137255, 0, 1, 1,
0.9028654, 0.7125741, 2.08137, 0.9215686, 0, 1, 1,
0.9041775, 0.6781191, 2.106162, 0.9254902, 0, 1, 1,
0.9045861, -0.192264, 1.986288, 0.9333333, 0, 1, 1,
0.9046398, 1.578716, 1.066904, 0.9372549, 0, 1, 1,
0.9104938, 1.244993, 1.651289, 0.945098, 0, 1, 1,
0.910512, -1.409862, 4.253657, 0.9490196, 0, 1, 1,
0.919513, 1.56631, 0.2361197, 0.9568627, 0, 1, 1,
0.9207423, 0.8886813, 0.1754806, 0.9607843, 0, 1, 1,
0.9284406, 1.66328, 0.940819, 0.9686275, 0, 1, 1,
0.9328414, 0.1121217, 1.386809, 0.972549, 0, 1, 1,
0.9348746, 0.6830725, -0.5637272, 0.9803922, 0, 1, 1,
0.9413787, -0.5873559, 2.310707, 0.9843137, 0, 1, 1,
0.9483203, -0.3348098, 2.401375, 0.9921569, 0, 1, 1,
0.9483245, 0.6933492, 2.120178, 0.9960784, 0, 1, 1,
0.9484313, -1.276708, 1.186657, 1, 0, 0.9960784, 1,
0.9623492, 0.8963082, -0.984307, 1, 0, 0.9882353, 1,
0.9660628, 0.4834558, 1.307204, 1, 0, 0.9843137, 1,
0.9733393, 1.69271, 1.13755, 1, 0, 0.9764706, 1,
0.9805219, 0.358486, 1.977177, 1, 0, 0.972549, 1,
0.9897828, 0.1835154, 0.04022366, 1, 0, 0.9647059, 1,
1.002221, -0.3210095, 1.683983, 1, 0, 0.9607843, 1,
1.004196, 1.51602, 0.0201456, 1, 0, 0.9529412, 1,
1.005444, 0.6155255, 2.217947, 1, 0, 0.9490196, 1,
1.007296, -1.417959, 2.335534, 1, 0, 0.9411765, 1,
1.007779, 1.411654, -0.6299314, 1, 0, 0.9372549, 1,
1.012818, 0.2190932, 1.001745, 1, 0, 0.9294118, 1,
1.025933, 0.1889832, 0.9007534, 1, 0, 0.9254902, 1,
1.029521, 0.3701495, -0.1357156, 1, 0, 0.9176471, 1,
1.030285, 1.939343, 1.087865, 1, 0, 0.9137255, 1,
1.032849, -0.3766472, 1.390402, 1, 0, 0.9058824, 1,
1.035564, -0.6854672, -0.3330441, 1, 0, 0.9019608, 1,
1.036896, 0.3335294, -0.5562466, 1, 0, 0.8941177, 1,
1.044174, 0.385291, -0.7866147, 1, 0, 0.8862745, 1,
1.050009, -2.002777, 3.360038, 1, 0, 0.8823529, 1,
1.053749, 1.530701, -0.5861029, 1, 0, 0.8745098, 1,
1.056653, 0.8606495, 2.400303, 1, 0, 0.8705882, 1,
1.06141, 0.07720055, 0.9364639, 1, 0, 0.8627451, 1,
1.064855, -0.3802535, 1.863645, 1, 0, 0.8588235, 1,
1.065258, -0.7840838, 3.079847, 1, 0, 0.8509804, 1,
1.074117, 1.741497, 1.404993, 1, 0, 0.8470588, 1,
1.08457, 0.456349, 1.391086, 1, 0, 0.8392157, 1,
1.088925, 0.1983309, 2.145807, 1, 0, 0.8352941, 1,
1.094907, 0.2560456, 1.688396, 1, 0, 0.827451, 1,
1.095778, -1.091059, 2.339056, 1, 0, 0.8235294, 1,
1.101703, -0.8997002, 4.271836, 1, 0, 0.8156863, 1,
1.102548, 0.7290357, 1.354534, 1, 0, 0.8117647, 1,
1.106558, -0.07291652, -0.1063802, 1, 0, 0.8039216, 1,
1.109293, -0.1411826, 4.098997, 1, 0, 0.7960784, 1,
1.116405, -1.082621, 1.50081, 1, 0, 0.7921569, 1,
1.122383, -0.5035636, 2.279483, 1, 0, 0.7843137, 1,
1.123933, 0.3815494, 1.112964, 1, 0, 0.7803922, 1,
1.141497, -1.485093, 3.416844, 1, 0, 0.772549, 1,
1.148384, -0.04596475, 3.185505, 1, 0, 0.7686275, 1,
1.174257, 1.243013, 1.71935, 1, 0, 0.7607843, 1,
1.194083, 1.295677, 0.6703709, 1, 0, 0.7568628, 1,
1.197102, 1.186772, 2.864127, 1, 0, 0.7490196, 1,
1.203199, 0.4810356, 1.625861, 1, 0, 0.7450981, 1,
1.208938, -1.070884, 4.157773, 1, 0, 0.7372549, 1,
1.212247, -0.7739614, 0.262165, 1, 0, 0.7333333, 1,
1.216072, -0.6041984, 0.7443579, 1, 0, 0.7254902, 1,
1.227992, -1.51177, 3.725255, 1, 0, 0.7215686, 1,
1.233327, 0.339656, 1.406396, 1, 0, 0.7137255, 1,
1.236621, -2.299148, 3.228857, 1, 0, 0.7098039, 1,
1.244096, -1.572625, 2.990061, 1, 0, 0.7019608, 1,
1.250258, -0.4989223, 0.9964051, 1, 0, 0.6941177, 1,
1.250307, -0.5173842, 1.472842, 1, 0, 0.6901961, 1,
1.252517, 0.7750192, -0.5440159, 1, 0, 0.682353, 1,
1.263994, 0.798108, 0.5523857, 1, 0, 0.6784314, 1,
1.266257, -0.4122887, 1.719782, 1, 0, 0.6705883, 1,
1.27248, 1.121508, 0.4740255, 1, 0, 0.6666667, 1,
1.272714, 1.193524, 0.5582194, 1, 0, 0.6588235, 1,
1.278527, 0.2751895, 1.954111, 1, 0, 0.654902, 1,
1.278968, -1.606535, 1.164476, 1, 0, 0.6470588, 1,
1.287268, 0.1622524, 1.306242, 1, 0, 0.6431373, 1,
1.29132, 1.132636, -0.3429261, 1, 0, 0.6352941, 1,
1.293009, -0.7656723, 3.538301, 1, 0, 0.6313726, 1,
1.300829, 1.328313, 3.231441, 1, 0, 0.6235294, 1,
1.32344, 0.5562317, 1.534465, 1, 0, 0.6196079, 1,
1.32567, -0.09397864, 1.631701, 1, 0, 0.6117647, 1,
1.326499, -0.749763, 1.941887, 1, 0, 0.6078432, 1,
1.329718, 0.9215648, 1.925546, 1, 0, 0.6, 1,
1.344116, 0.03930764, 1.113405, 1, 0, 0.5921569, 1,
1.34923, -0.4338514, 0.1554718, 1, 0, 0.5882353, 1,
1.357067, -1.037904, 3.519419, 1, 0, 0.5803922, 1,
1.360432, -0.2959967, 3.935236, 1, 0, 0.5764706, 1,
1.362797, -0.460635, 1.195248, 1, 0, 0.5686275, 1,
1.362824, 0.3111561, 2.53744, 1, 0, 0.5647059, 1,
1.367546, -1.370252, 3.640707, 1, 0, 0.5568628, 1,
1.378575, -0.9510427, 1.353835, 1, 0, 0.5529412, 1,
1.380766, 0.02685754, 2.233392, 1, 0, 0.5450981, 1,
1.388815, 1.219802, 1.851151, 1, 0, 0.5411765, 1,
1.391561, 0.136769, 1.251563, 1, 0, 0.5333334, 1,
1.398026, 0.09507149, 1.739972, 1, 0, 0.5294118, 1,
1.400111, -0.2920035, 1.461809, 1, 0, 0.5215687, 1,
1.406578, 0.1076954, 0.6121567, 1, 0, 0.5176471, 1,
1.408407, -0.8019978, 3.214374, 1, 0, 0.509804, 1,
1.412572, 0.1136126, 1.156383, 1, 0, 0.5058824, 1,
1.413748, -0.8968493, 3.247468, 1, 0, 0.4980392, 1,
1.423021, 0.08057258, 1.963295, 1, 0, 0.4901961, 1,
1.433568, -0.4654237, 1.053211, 1, 0, 0.4862745, 1,
1.445788, 1.144492, -0.07201975, 1, 0, 0.4784314, 1,
1.445871, 1.928033, -1.498458, 1, 0, 0.4745098, 1,
1.446164, -1.712804, 2.99965, 1, 0, 0.4666667, 1,
1.454798, 0.319139, 0.7873941, 1, 0, 0.4627451, 1,
1.455774, -0.2954269, 2.556297, 1, 0, 0.454902, 1,
1.458848, -0.1886517, 1.031556, 1, 0, 0.4509804, 1,
1.462698, 0.1470101, 1.293591, 1, 0, 0.4431373, 1,
1.477846, -0.03940431, 1.032597, 1, 0, 0.4392157, 1,
1.478626, -0.6746111, 0.9654917, 1, 0, 0.4313726, 1,
1.486909, 0.4725571, 0.2730498, 1, 0, 0.427451, 1,
1.501837, 0.7964368, 2.886656, 1, 0, 0.4196078, 1,
1.517338, -0.7211376, -0.483241, 1, 0, 0.4156863, 1,
1.527441, 1.791887, 2.076283, 1, 0, 0.4078431, 1,
1.533467, -0.4826126, 3.933457, 1, 0, 0.4039216, 1,
1.546553, -0.1148217, 2.025177, 1, 0, 0.3960784, 1,
1.574914, -1.226699, 2.041349, 1, 0, 0.3882353, 1,
1.57503, 0.3550799, 0.03245523, 1, 0, 0.3843137, 1,
1.578731, 1.082413, 1.02528, 1, 0, 0.3764706, 1,
1.589073, 0.05270375, 2.191845, 1, 0, 0.372549, 1,
1.59212, -0.5437186, -0.4626659, 1, 0, 0.3647059, 1,
1.592812, -0.06058834, 2.44292, 1, 0, 0.3607843, 1,
1.603999, 0.8703026, 1.350544, 1, 0, 0.3529412, 1,
1.616508, -1.053852, 1.204247, 1, 0, 0.3490196, 1,
1.622941, 1.588593, 1.127154, 1, 0, 0.3411765, 1,
1.638046, -0.6463034, 2.90771, 1, 0, 0.3372549, 1,
1.648141, -0.1615042, 1.117594, 1, 0, 0.3294118, 1,
1.656551, 0.5165972, 0.9679543, 1, 0, 0.3254902, 1,
1.656735, -0.5531445, 1.184946, 1, 0, 0.3176471, 1,
1.667773, -0.7588136, 1.52208, 1, 0, 0.3137255, 1,
1.671265, -0.8719386, -0.1079415, 1, 0, 0.3058824, 1,
1.685391, 0.811601, 1.238516, 1, 0, 0.2980392, 1,
1.714916, -0.6763253, 0.9833733, 1, 0, 0.2941177, 1,
1.716569, 0.5553097, 2.612977, 1, 0, 0.2862745, 1,
1.727982, 1.870093, 0.6826251, 1, 0, 0.282353, 1,
1.72957, 0.3333311, -0.2543664, 1, 0, 0.2745098, 1,
1.752163, 0.7698112, 1.641175, 1, 0, 0.2705882, 1,
1.785733, -2.331036, 1.985022, 1, 0, 0.2627451, 1,
1.789163, -1.839287, 3.912691, 1, 0, 0.2588235, 1,
1.799702, 0.1375439, 2.104787, 1, 0, 0.2509804, 1,
1.804738, 1.068239, 0.8575084, 1, 0, 0.2470588, 1,
1.813353, -1.492577, 1.179454, 1, 0, 0.2392157, 1,
1.829236, 0.2436297, 3.785876, 1, 0, 0.2352941, 1,
1.850535, -1.125858, 1.42367, 1, 0, 0.227451, 1,
1.871069, -1.614149, 2.634177, 1, 0, 0.2235294, 1,
1.881462, 0.8854978, 1.232813, 1, 0, 0.2156863, 1,
1.884972, -0.9092671, 2.582611, 1, 0, 0.2117647, 1,
1.911484, 0.9766855, 0.4643583, 1, 0, 0.2039216, 1,
1.920939, -0.8514162, 0.7358946, 1, 0, 0.1960784, 1,
1.925109, -1.242184, 2.930577, 1, 0, 0.1921569, 1,
1.959571, 0.8088591, 1.07015, 1, 0, 0.1843137, 1,
1.974796, 0.663794, -0.2036625, 1, 0, 0.1803922, 1,
1.988766, -1.784351, 2.628664, 1, 0, 0.172549, 1,
2.004293, -0.4173265, 0.0657439, 1, 0, 0.1686275, 1,
2.008821, 0.4941128, 0.6558901, 1, 0, 0.1607843, 1,
2.016324, 1.033497, 1.761067, 1, 0, 0.1568628, 1,
2.032144, -0.6307566, 2.847113, 1, 0, 0.1490196, 1,
2.037008, 0.3877417, 1.363755, 1, 0, 0.145098, 1,
2.040893, 0.8672085, -0.4699574, 1, 0, 0.1372549, 1,
2.048584, 0.4348027, 0.9348717, 1, 0, 0.1333333, 1,
2.050118, -1.245211, 2.081795, 1, 0, 0.1254902, 1,
2.05175, -1.158969, 1.210275, 1, 0, 0.1215686, 1,
2.069157, -1.359814, 2.638678, 1, 0, 0.1137255, 1,
2.088748, -0.9483239, 3.006806, 1, 0, 0.1098039, 1,
2.187335, 1.90271, 1.731575, 1, 0, 0.1019608, 1,
2.206441, -0.4394651, 1.156407, 1, 0, 0.09411765, 1,
2.213271, -1.914982, 2.938615, 1, 0, 0.09019608, 1,
2.256507, 1.769183, 1.154196, 1, 0, 0.08235294, 1,
2.267838, -0.8845041, 2.921593, 1, 0, 0.07843138, 1,
2.288157, 1.016225, 0.8937483, 1, 0, 0.07058824, 1,
2.294349, -0.2732008, 2.087545, 1, 0, 0.06666667, 1,
2.294794, -1.439085, 2.901795, 1, 0, 0.05882353, 1,
2.353004, -1.354323, 3.160189, 1, 0, 0.05490196, 1,
2.412593, 0.4970436, 1.009755, 1, 0, 0.04705882, 1,
2.464246, 0.1662476, 0.9231604, 1, 0, 0.04313726, 1,
2.486076, -0.3885044, 1.193365, 1, 0, 0.03529412, 1,
2.525269, -1.740412, -0.4638047, 1, 0, 0.03137255, 1,
2.527645, 0.2267375, 2.375582, 1, 0, 0.02352941, 1,
2.577756, -0.9221606, 0.1346217, 1, 0, 0.01960784, 1,
2.607333, 0.6689939, 1.608194, 1, 0, 0.01176471, 1,
3.076691, 0.8192691, 0.4717686, 1, 0, 0.007843138, 1
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
-0.4646508, -4.18746, -6.611084, 0, -0.5, 0.5, 0.5,
-0.4646508, -4.18746, -6.611084, 1, -0.5, 0.5, 0.5,
-0.4646508, -4.18746, -6.611084, 1, 1.5, 0.5, 0.5,
-0.4646508, -4.18746, -6.611084, 0, 1.5, 0.5, 0.5
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
-5.206507, 0.1891114, -6.611084, 0, -0.5, 0.5, 0.5,
-5.206507, 0.1891114, -6.611084, 1, -0.5, 0.5, 0.5,
-5.206507, 0.1891114, -6.611084, 1, 1.5, 0.5, 0.5,
-5.206507, 0.1891114, -6.611084, 0, 1.5, 0.5, 0.5
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
-5.206507, -4.18746, 0.01790357, 0, -0.5, 0.5, 0.5,
-5.206507, -4.18746, 0.01790357, 1, -0.5, 0.5, 0.5,
-5.206507, -4.18746, 0.01790357, 1, 1.5, 0.5, 0.5,
-5.206507, -4.18746, 0.01790357, 0, 1.5, 0.5, 0.5
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
-4, -3.177482, -5.081317,
2, -3.177482, -5.081317,
-4, -3.177482, -5.081317,
-4, -3.345812, -5.336278,
-2, -3.177482, -5.081317,
-2, -3.345812, -5.336278,
0, -3.177482, -5.081317,
0, -3.345812, -5.336278,
2, -3.177482, -5.081317,
2, -3.345812, -5.336278
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
"-4",
"-2",
"0",
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
-4, -3.682471, -5.8462, 0, -0.5, 0.5, 0.5,
-4, -3.682471, -5.8462, 1, -0.5, 0.5, 0.5,
-4, -3.682471, -5.8462, 1, 1.5, 0.5, 0.5,
-4, -3.682471, -5.8462, 0, 1.5, 0.5, 0.5,
-2, -3.682471, -5.8462, 0, -0.5, 0.5, 0.5,
-2, -3.682471, -5.8462, 1, -0.5, 0.5, 0.5,
-2, -3.682471, -5.8462, 1, 1.5, 0.5, 0.5,
-2, -3.682471, -5.8462, 0, 1.5, 0.5, 0.5,
0, -3.682471, -5.8462, 0, -0.5, 0.5, 0.5,
0, -3.682471, -5.8462, 1, -0.5, 0.5, 0.5,
0, -3.682471, -5.8462, 1, 1.5, 0.5, 0.5,
0, -3.682471, -5.8462, 0, 1.5, 0.5, 0.5,
2, -3.682471, -5.8462, 0, -0.5, 0.5, 0.5,
2, -3.682471, -5.8462, 1, -0.5, 0.5, 0.5,
2, -3.682471, -5.8462, 1, 1.5, 0.5, 0.5,
2, -3.682471, -5.8462, 0, 1.5, 0.5, 0.5
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
-4.112233, -3, -5.081317,
-4.112233, 3, -5.081317,
-4.112233, -3, -5.081317,
-4.294612, -3, -5.336278,
-4.112233, -2, -5.081317,
-4.294612, -2, -5.336278,
-4.112233, -1, -5.081317,
-4.294612, -1, -5.336278,
-4.112233, 0, -5.081317,
-4.294612, 0, -5.336278,
-4.112233, 1, -5.081317,
-4.294612, 1, -5.336278,
-4.112233, 2, -5.081317,
-4.294612, 2, -5.336278,
-4.112233, 3, -5.081317,
-4.294612, 3, -5.336278
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
-4.65937, -3, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, -3, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, -3, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, -3, -5.8462, 0, 1.5, 0.5, 0.5,
-4.65937, -2, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, -2, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, -2, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, -2, -5.8462, 0, 1.5, 0.5, 0.5,
-4.65937, -1, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, -1, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, -1, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, -1, -5.8462, 0, 1.5, 0.5, 0.5,
-4.65937, 0, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, 0, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, 0, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, 0, -5.8462, 0, 1.5, 0.5, 0.5,
-4.65937, 1, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, 1, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, 1, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, 1, -5.8462, 0, 1.5, 0.5, 0.5,
-4.65937, 2, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, 2, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, 2, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, 2, -5.8462, 0, 1.5, 0.5, 0.5,
-4.65937, 3, -5.8462, 0, -0.5, 0.5, 0.5,
-4.65937, 3, -5.8462, 1, -0.5, 0.5, 0.5,
-4.65937, 3, -5.8462, 1, 1.5, 0.5, 0.5,
-4.65937, 3, -5.8462, 0, 1.5, 0.5, 0.5
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
-4.112233, -3.177482, -4,
-4.112233, -3.177482, 4,
-4.112233, -3.177482, -4,
-4.294612, -3.345812, -4,
-4.112233, -3.177482, -2,
-4.294612, -3.345812, -2,
-4.112233, -3.177482, 0,
-4.294612, -3.345812, 0,
-4.112233, -3.177482, 2,
-4.294612, -3.345812, 2,
-4.112233, -3.177482, 4,
-4.294612, -3.345812, 4
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
-4.65937, -3.682471, -4, 0, -0.5, 0.5, 0.5,
-4.65937, -3.682471, -4, 1, -0.5, 0.5, 0.5,
-4.65937, -3.682471, -4, 1, 1.5, 0.5, 0.5,
-4.65937, -3.682471, -4, 0, 1.5, 0.5, 0.5,
-4.65937, -3.682471, -2, 0, -0.5, 0.5, 0.5,
-4.65937, -3.682471, -2, 1, -0.5, 0.5, 0.5,
-4.65937, -3.682471, -2, 1, 1.5, 0.5, 0.5,
-4.65937, -3.682471, -2, 0, 1.5, 0.5, 0.5,
-4.65937, -3.682471, 0, 0, -0.5, 0.5, 0.5,
-4.65937, -3.682471, 0, 1, -0.5, 0.5, 0.5,
-4.65937, -3.682471, 0, 1, 1.5, 0.5, 0.5,
-4.65937, -3.682471, 0, 0, 1.5, 0.5, 0.5,
-4.65937, -3.682471, 2, 0, -0.5, 0.5, 0.5,
-4.65937, -3.682471, 2, 1, -0.5, 0.5, 0.5,
-4.65937, -3.682471, 2, 1, 1.5, 0.5, 0.5,
-4.65937, -3.682471, 2, 0, 1.5, 0.5, 0.5,
-4.65937, -3.682471, 4, 0, -0.5, 0.5, 0.5,
-4.65937, -3.682471, 4, 1, -0.5, 0.5, 0.5,
-4.65937, -3.682471, 4, 1, 1.5, 0.5, 0.5,
-4.65937, -3.682471, 4, 0, 1.5, 0.5, 0.5
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
-4.112233, -3.177482, -5.081317,
-4.112233, 3.555705, -5.081317,
-4.112233, -3.177482, 5.117125,
-4.112233, 3.555705, 5.117125,
-4.112233, -3.177482, -5.081317,
-4.112233, -3.177482, 5.117125,
-4.112233, 3.555705, -5.081317,
-4.112233, 3.555705, 5.117125,
-4.112233, -3.177482, -5.081317,
3.182931, -3.177482, -5.081317,
-4.112233, -3.177482, 5.117125,
3.182931, -3.177482, 5.117125,
-4.112233, 3.555705, -5.081317,
3.182931, 3.555705, -5.081317,
-4.112233, 3.555705, 5.117125,
3.182931, 3.555705, 5.117125,
3.182931, -3.177482, -5.081317,
3.182931, 3.555705, -5.081317,
3.182931, -3.177482, 5.117125,
3.182931, 3.555705, 5.117125,
3.182931, -3.177482, -5.081317,
3.182931, -3.177482, 5.117125,
3.182931, 3.555705, -5.081317,
3.182931, 3.555705, 5.117125
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
var radius = 7.599867;
var distance = 33.81266;
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
mvMatrix.translate( 0.4646508, -0.1891114, -0.01790357 );
mvMatrix.scale( 1.12638, 1.220392, 0.8057235 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81266);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Phenanthrene<-read.table("Phenanthrene.xyz")
```

```
## Error in read.table("Phenanthrene.xyz"): no lines available in input
```

```r
x<-Phenanthrene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenanthrene' not found
```

```r
y<-Phenanthrene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenanthrene' not found
```

```r
z<-Phenanthrene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenanthrene' not found
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
-4.005992, -0.330568, 0.8287815, 0, 0, 1, 1, 1,
-2.982832, 0.3513607, -0.5481793, 1, 0, 0, 1, 1,
-2.633106, 0.05150631, -2.171354, 1, 0, 0, 1, 1,
-2.602184, 0.2351293, -1.583855, 1, 0, 0, 1, 1,
-2.513421, -0.1341583, -0.0790728, 1, 0, 0, 1, 1,
-2.466665, -0.6746045, -1.809559, 1, 0, 0, 1, 1,
-2.445275, -0.07005708, -2.272445, 0, 0, 0, 1, 1,
-2.435185, 0.3388724, -3.542433, 0, 0, 0, 1, 1,
-2.429447, 0.5582566, -0.9235113, 0, 0, 0, 1, 1,
-2.389433, -1.721503, -2.458008, 0, 0, 0, 1, 1,
-2.369279, 0.2147244, -1.593408, 0, 0, 0, 1, 1,
-2.32028, -0.6406021, -3.09849, 0, 0, 0, 1, 1,
-2.308334, 0.9983546, -0.8889684, 0, 0, 0, 1, 1,
-2.294852, -1.934934, -2.162296, 1, 1, 1, 1, 1,
-2.231209, 0.2016222, -3.774023, 1, 1, 1, 1, 1,
-2.212007, -0.1655462, -2.304069, 1, 1, 1, 1, 1,
-2.185248, 0.3956535, -2.559732, 1, 1, 1, 1, 1,
-2.160334, -1.210016, -2.990747, 1, 1, 1, 1, 1,
-2.127033, -1.258232, -2.956182, 1, 1, 1, 1, 1,
-2.071419, 0.06450327, -1.882335, 1, 1, 1, 1, 1,
-2.063578, -0.8038462, 0.08913662, 1, 1, 1, 1, 1,
-2.036712, -1.34191, -1.662696, 1, 1, 1, 1, 1,
-2.030477, 1.296658, 1.139359, 1, 1, 1, 1, 1,
-2.012554, 0.05806658, -0.6894741, 1, 1, 1, 1, 1,
-1.998374, -0.6171501, -2.446122, 1, 1, 1, 1, 1,
-1.979203, -0.9146538, -2.230802, 1, 1, 1, 1, 1,
-1.964935, 0.3213294, -1.228474, 1, 1, 1, 1, 1,
-1.959055, -0.4617621, -1.596526, 1, 1, 1, 1, 1,
-1.949376, 1.546833, -0.1099128, 0, 0, 1, 1, 1,
-1.935734, 0.06693684, -2.659382, 1, 0, 0, 1, 1,
-1.933893, 1.660945, -2.526987, 1, 0, 0, 1, 1,
-1.932507, -1.507661, -0.823283, 1, 0, 0, 1, 1,
-1.929628, -0.3805853, -2.23203, 1, 0, 0, 1, 1,
-1.905046, -1.04771, -2.387852, 1, 0, 0, 1, 1,
-1.903107, -0.02044009, -1.879836, 0, 0, 0, 1, 1,
-1.889433, 1.431007, -1.74025, 0, 0, 0, 1, 1,
-1.880922, 0.4338789, -1.210552, 0, 0, 0, 1, 1,
-1.874284, -0.04573738, 0.7732258, 0, 0, 0, 1, 1,
-1.852027, 0.4883716, -1.869069, 0, 0, 0, 1, 1,
-1.828157, -1.94176, -0.7766485, 0, 0, 0, 1, 1,
-1.808028, 1.201027, -0.8318571, 0, 0, 0, 1, 1,
-1.792057, 0.1406257, -1.547427, 1, 1, 1, 1, 1,
-1.7764, -2.454293, -0.5159575, 1, 1, 1, 1, 1,
-1.767335, -0.907538, -3.093905, 1, 1, 1, 1, 1,
-1.754648, 1.806288, 1.167834, 1, 1, 1, 1, 1,
-1.742966, -1.000415, -2.951531, 1, 1, 1, 1, 1,
-1.737115, -0.9377652, -1.133693, 1, 1, 1, 1, 1,
-1.699959, -0.172701, -0.7525129, 1, 1, 1, 1, 1,
-1.692729, 0.8952188, -1.755143, 1, 1, 1, 1, 1,
-1.681283, 0.6952537, -1.650139, 1, 1, 1, 1, 1,
-1.670014, 0.06536891, -1.066159, 1, 1, 1, 1, 1,
-1.666261, -0.2269889, -1.135792, 1, 1, 1, 1, 1,
-1.660525, -0.2950205, -2.679488, 1, 1, 1, 1, 1,
-1.65365, 1.356072, -3.03138, 1, 1, 1, 1, 1,
-1.649931, -0.253302, -1.565607, 1, 1, 1, 1, 1,
-1.636246, -0.07424682, -1.312551, 1, 1, 1, 1, 1,
-1.631478, 0.1698983, -1.135576, 0, 0, 1, 1, 1,
-1.623289, 0.9026865, -1.235902, 1, 0, 0, 1, 1,
-1.604642, -1.828683, -4.208089, 1, 0, 0, 1, 1,
-1.604003, 0.9187583, -0.7532738, 1, 0, 0, 1, 1,
-1.59743, 0.6505322, -0.2098949, 1, 0, 0, 1, 1,
-1.596978, -0.1638187, -1.77968, 1, 0, 0, 1, 1,
-1.591968, 0.9121162, 0.4173141, 0, 0, 0, 1, 1,
-1.590668, 0.02147789, -1.772919, 0, 0, 0, 1, 1,
-1.589995, 0.2253033, -3.233718, 0, 0, 0, 1, 1,
-1.583485, 0.5735902, -0.7881734, 0, 0, 0, 1, 1,
-1.569298, -1.133973, -2.674674, 0, 0, 0, 1, 1,
-1.560345, -0.1989726, -0.707417, 0, 0, 0, 1, 1,
-1.557482, -1.287451, -2.561123, 0, 0, 0, 1, 1,
-1.55329, -0.5881335, -2.907038, 1, 1, 1, 1, 1,
-1.552344, 0.08767367, -0.6302379, 1, 1, 1, 1, 1,
-1.545956, 0.06667251, -2.315984, 1, 1, 1, 1, 1,
-1.545535, -2.276155, -1.767738, 1, 1, 1, 1, 1,
-1.540976, -0.4715102, -2.615062, 1, 1, 1, 1, 1,
-1.533885, -0.988721, -0.6080904, 1, 1, 1, 1, 1,
-1.509859, 3.024539, 1.781193, 1, 1, 1, 1, 1,
-1.506735, 0.1273623, -1.318501, 1, 1, 1, 1, 1,
-1.490829, -0.03515464, -2.327607, 1, 1, 1, 1, 1,
-1.473523, 0.8952441, -0.9312234, 1, 1, 1, 1, 1,
-1.446636, 0.4693164, -1.540299, 1, 1, 1, 1, 1,
-1.441711, 1.019674, 1.024147, 1, 1, 1, 1, 1,
-1.437684, 0.1194242, 0.3908201, 1, 1, 1, 1, 1,
-1.431789, 0.4942637, -1.387079, 1, 1, 1, 1, 1,
-1.425647, -0.2212126, -0.2022845, 1, 1, 1, 1, 1,
-1.425549, -0.9775647, -3.093261, 0, 0, 1, 1, 1,
-1.41092, 0.02340673, -0.9879615, 1, 0, 0, 1, 1,
-1.410668, 1.007287, -1.692863, 1, 0, 0, 1, 1,
-1.40098, 0.6354408, 0.7803462, 1, 0, 0, 1, 1,
-1.400306, -0.8954009, -3.334409, 1, 0, 0, 1, 1,
-1.396438, -1.26612, -3.55105, 1, 0, 0, 1, 1,
-1.384827, 0.7008139, 0.5616425, 0, 0, 0, 1, 1,
-1.377382, -0.7296201, -1.078298, 0, 0, 0, 1, 1,
-1.371545, 0.9247596, -1.266279, 0, 0, 0, 1, 1,
-1.36276, 1.179436, -1.042468, 0, 0, 0, 1, 1,
-1.359492, 1.367599, 0.1170475, 0, 0, 0, 1, 1,
-1.356524, -0.5043124, -0.3550251, 0, 0, 0, 1, 1,
-1.354729, 0.7896745, -0.951345, 0, 0, 0, 1, 1,
-1.352951, -0.3754084, -0.8520414, 1, 1, 1, 1, 1,
-1.345363, 0.7464192, -2.091193, 1, 1, 1, 1, 1,
-1.34424, 0.3864814, -0.2592378, 1, 1, 1, 1, 1,
-1.323115, -2.261245, -4.292086, 1, 1, 1, 1, 1,
-1.317364, -0.3516915, -1.262779, 1, 1, 1, 1, 1,
-1.314318, 1.396668, -2.555902, 1, 1, 1, 1, 1,
-1.310216, 1.241668, -3.291787, 1, 1, 1, 1, 1,
-1.309706, 1.221678, -1.433206, 1, 1, 1, 1, 1,
-1.299501, -1.514223, -2.471349, 1, 1, 1, 1, 1,
-1.29015, 1.924636, -0.2824128, 1, 1, 1, 1, 1,
-1.289137, 0.9816085, -0.7489686, 1, 1, 1, 1, 1,
-1.283856, 1.023893, -1.316231, 1, 1, 1, 1, 1,
-1.280157, 0.9381547, -0.5271181, 1, 1, 1, 1, 1,
-1.278553, 1.018732, -0.05329898, 1, 1, 1, 1, 1,
-1.275823, -0.2549951, -2.422163, 1, 1, 1, 1, 1,
-1.271598, -1.607292, -1.649185, 0, 0, 1, 1, 1,
-1.270422, 0.3365863, 0.06718208, 1, 0, 0, 1, 1,
-1.26885, 0.4068417, -2.265814, 1, 0, 0, 1, 1,
-1.26368, 1.519958, -0.5746244, 1, 0, 0, 1, 1,
-1.262143, -0.09293334, -1.40685, 1, 0, 0, 1, 1,
-1.251204, -0.04072238, -2.417625, 1, 0, 0, 1, 1,
-1.23701, -0.4672991, -0.3491946, 0, 0, 0, 1, 1,
-1.236156, -0.01670019, -2.379071, 0, 0, 0, 1, 1,
-1.235374, -1.38087, -1.394621, 0, 0, 0, 1, 1,
-1.232286, -0.3004567, -1.739188, 0, 0, 0, 1, 1,
-1.23135, -0.7331967, -2.878642, 0, 0, 0, 1, 1,
-1.226841, 0.8289215, -1.99382, 0, 0, 0, 1, 1,
-1.225838, 0.4921659, -0.8398867, 0, 0, 0, 1, 1,
-1.225073, -0.5269461, -2.536223, 1, 1, 1, 1, 1,
-1.223172, -0.4389267, -2.126525, 1, 1, 1, 1, 1,
-1.206141, 0.3528482, -1.190841, 1, 1, 1, 1, 1,
-1.204111, -1.737699, -3.688112, 1, 1, 1, 1, 1,
-1.203125, -0.0823674, -2.586189, 1, 1, 1, 1, 1,
-1.201039, 0.04893082, -1.623564, 1, 1, 1, 1, 1,
-1.198306, -0.5758414, -1.567663, 1, 1, 1, 1, 1,
-1.194383, 0.3614498, -1.3252, 1, 1, 1, 1, 1,
-1.186991, -1.087985, -2.686374, 1, 1, 1, 1, 1,
-1.186015, 0.9853078, -2.09483, 1, 1, 1, 1, 1,
-1.182693, 0.1653756, -1.997803, 1, 1, 1, 1, 1,
-1.180675, -0.7406035, -2.613927, 1, 1, 1, 1, 1,
-1.177622, 0.08126877, -2.116233, 1, 1, 1, 1, 1,
-1.175948, 0.04738365, -2.229981, 1, 1, 1, 1, 1,
-1.167407, -0.5784835, -4.611245, 1, 1, 1, 1, 1,
-1.159648, 1.507479, -0.8224341, 0, 0, 1, 1, 1,
-1.159018, -0.678607, -1.962972, 1, 0, 0, 1, 1,
-1.155948, 2.121116, 0.2076809, 1, 0, 0, 1, 1,
-1.141396, 0.9318777, 0.762367, 1, 0, 0, 1, 1,
-1.141262, -2.066148, -1.886383, 1, 0, 0, 1, 1,
-1.132754, 0.008227627, -1.22688, 1, 0, 0, 1, 1,
-1.12963, 0.07532107, -0.1506825, 0, 0, 0, 1, 1,
-1.129573, 1.213295, -0.5315281, 0, 0, 0, 1, 1,
-1.128267, 0.3341081, -2.158426, 0, 0, 0, 1, 1,
-1.123641, 1.01068, -2.105167, 0, 0, 0, 1, 1,
-1.120516, 1.367958, -0.6415028, 0, 0, 0, 1, 1,
-1.119085, -0.4440858, -0.5441951, 0, 0, 0, 1, 1,
-1.106334, 0.6670312, -1.518604, 0, 0, 0, 1, 1,
-1.104855, 1.339091, 1.55108, 1, 1, 1, 1, 1,
-1.09744, -1.636603, -3.457875, 1, 1, 1, 1, 1,
-1.094886, -0.1427551, 1.374485, 1, 1, 1, 1, 1,
-1.091439, 0.428389, -2.846637, 1, 1, 1, 1, 1,
-1.088723, 1.903192, -1.038403, 1, 1, 1, 1, 1,
-1.079345, 1.058369, -1.110189, 1, 1, 1, 1, 1,
-1.076302, 0.4066096, -0.1340206, 1, 1, 1, 1, 1,
-1.059008, -0.7819855, -3.600291, 1, 1, 1, 1, 1,
-1.052522, 0.6603027, 0.06305932, 1, 1, 1, 1, 1,
-1.049857, 1.945349, -1.419581, 1, 1, 1, 1, 1,
-1.045843, -1.169341, -2.657771, 1, 1, 1, 1, 1,
-1.041707, -0.2484059, -1.803913, 1, 1, 1, 1, 1,
-1.040837, -0.4779968, -2.303116, 1, 1, 1, 1, 1,
-1.039532, -1.58939, -2.863859, 1, 1, 1, 1, 1,
-1.034608, -0.8108991, -0.6307467, 1, 1, 1, 1, 1,
-1.031105, -3.079426, -2.814566, 0, 0, 1, 1, 1,
-1.022457, -0.7341551, -3.004537, 1, 0, 0, 1, 1,
-1.016141, -0.05230813, -1.877216, 1, 0, 0, 1, 1,
-1.010336, 1.24007, -1.15418, 1, 0, 0, 1, 1,
-0.9891135, -0.3055913, -2.438825, 1, 0, 0, 1, 1,
-0.9744322, 0.681325, -2.097505, 1, 0, 0, 1, 1,
-0.9734436, 0.326887, -2.542037, 0, 0, 0, 1, 1,
-0.9733123, 1.69648, -0.6002637, 0, 0, 0, 1, 1,
-0.9713662, -1.295637, -3.484325, 0, 0, 0, 1, 1,
-0.9683236, -0.1091555, -0.9835637, 0, 0, 0, 1, 1,
-0.9633965, -0.9423879, -4.904443, 0, 0, 0, 1, 1,
-0.9584467, -1.924558, -2.050316, 0, 0, 0, 1, 1,
-0.9582946, 0.6928813, -0.8073251, 0, 0, 0, 1, 1,
-0.9558474, 0.7706666, -0.1293832, 1, 1, 1, 1, 1,
-0.949227, 1.522587, 0.2705852, 1, 1, 1, 1, 1,
-0.9484184, -0.3768832, -1.512484, 1, 1, 1, 1, 1,
-0.9279928, -1.727992, -2.362334, 1, 1, 1, 1, 1,
-0.9269773, -0.1366567, -0.6564609, 1, 1, 1, 1, 1,
-0.9252769, 0.408855, -0.705061, 1, 1, 1, 1, 1,
-0.9242668, -0.36336, -3.126132, 1, 1, 1, 1, 1,
-0.9216884, -2.494601, -1.691337, 1, 1, 1, 1, 1,
-0.9168873, -1.681626, -2.812503, 1, 1, 1, 1, 1,
-0.9166955, -1.310327, -2.427076, 1, 1, 1, 1, 1,
-0.9153525, 1.038146, -1.48324, 1, 1, 1, 1, 1,
-0.9138408, -1.158503, -2.140692, 1, 1, 1, 1, 1,
-0.9016291, -0.02796042, -1.21395, 1, 1, 1, 1, 1,
-0.8976957, 0.1874132, -1.475881, 1, 1, 1, 1, 1,
-0.8975012, -1.012479, -3.311467, 1, 1, 1, 1, 1,
-0.8970696, 0.9471889, 0.01750818, 0, 0, 1, 1, 1,
-0.89165, -0.8342192, -0.8884413, 1, 0, 0, 1, 1,
-0.8910081, 1.599331, 0.05297266, 1, 0, 0, 1, 1,
-0.8886661, -1.303152, -3.174552, 1, 0, 0, 1, 1,
-0.8845525, -0.9579038, -3.500713, 1, 0, 0, 1, 1,
-0.8845174, -0.708986, -3.219238, 1, 0, 0, 1, 1,
-0.8791119, 0.7196665, -2.182332, 0, 0, 0, 1, 1,
-0.8762957, 0.9896827, 0.1789968, 0, 0, 0, 1, 1,
-0.8719005, -0.2372777, -1.076903, 0, 0, 0, 1, 1,
-0.8691549, -1.164719, -1.957419, 0, 0, 0, 1, 1,
-0.867678, 0.4117081, -1.783043, 0, 0, 0, 1, 1,
-0.8645796, 0.13308, -1.890483, 0, 0, 0, 1, 1,
-0.8586663, -0.147148, -0.6555597, 0, 0, 0, 1, 1,
-0.8554696, -0.6457544, -1.492859, 1, 1, 1, 1, 1,
-0.850762, 0.3700781, -2.31729, 1, 1, 1, 1, 1,
-0.8485197, 1.28137, -1.361344, 1, 1, 1, 1, 1,
-0.84794, -0.2272297, -2.620167, 1, 1, 1, 1, 1,
-0.846297, -0.03135277, -2.332714, 1, 1, 1, 1, 1,
-0.8365502, 1.179568, -0.6378009, 1, 1, 1, 1, 1,
-0.829821, 0.500708, -1.698808, 1, 1, 1, 1, 1,
-0.8257403, 0.05201726, -0.8283799, 1, 1, 1, 1, 1,
-0.8180294, -0.655924, -0.7912474, 1, 1, 1, 1, 1,
-0.8178509, -0.5034745, -1.14862, 1, 1, 1, 1, 1,
-0.8090922, 1.071473, -0.9816114, 1, 1, 1, 1, 1,
-0.8002287, 2.349201, -1.093518, 1, 1, 1, 1, 1,
-0.7981355, -0.3293747, -2.745804, 1, 1, 1, 1, 1,
-0.7955448, 0.1493104, -1.92873, 1, 1, 1, 1, 1,
-0.7921291, -1.228981, -3.460163, 1, 1, 1, 1, 1,
-0.7908861, -0.1434986, -1.670639, 0, 0, 1, 1, 1,
-0.7889361, 0.6909609, -0.3743204, 1, 0, 0, 1, 1,
-0.7828529, 1.113875, 0.8567402, 1, 0, 0, 1, 1,
-0.7766661, 0.3145739, -2.084661, 1, 0, 0, 1, 1,
-0.7714391, 0.3060754, -0.03550787, 1, 0, 0, 1, 1,
-0.7710471, -0.6266813, -2.350949, 1, 0, 0, 1, 1,
-0.7673911, 0.3110646, -0.03623465, 0, 0, 0, 1, 1,
-0.7671352, 0.7665966, -1.528606, 0, 0, 0, 1, 1,
-0.7670398, 0.6903719, 0.3505615, 0, 0, 0, 1, 1,
-0.7667497, -0.4706426, -1.278456, 0, 0, 0, 1, 1,
-0.7655921, -0.4508844, -1.216974, 0, 0, 0, 1, 1,
-0.7619966, 1.681675, -0.4841259, 0, 0, 0, 1, 1,
-0.7612042, 0.8314562, -1.614216, 0, 0, 0, 1, 1,
-0.7557451, -0.4438641, -1.303972, 1, 1, 1, 1, 1,
-0.7504973, -1.745098, -4.196753, 1, 1, 1, 1, 1,
-0.7466648, 0.1907945, -0.5708812, 1, 1, 1, 1, 1,
-0.7453418, -0.03570322, -3.886155, 1, 1, 1, 1, 1,
-0.74142, -0.7194424, -3.783784, 1, 1, 1, 1, 1,
-0.7400934, 0.7949177, -1.467716, 1, 1, 1, 1, 1,
-0.7298021, -1.383505, -2.51555, 1, 1, 1, 1, 1,
-0.7263056, 0.2754765, -1.040607, 1, 1, 1, 1, 1,
-0.7261502, -0.6641759, -3.159247, 1, 1, 1, 1, 1,
-0.7235982, -1.718909, -3.023031, 1, 1, 1, 1, 1,
-0.7223247, 1.869845, 0.7636855, 1, 1, 1, 1, 1,
-0.7213558, -0.4008842, -1.808918, 1, 1, 1, 1, 1,
-0.7192345, 0.708588, 0.8579938, 1, 1, 1, 1, 1,
-0.7091314, 0.2647959, -0.04159625, 1, 1, 1, 1, 1,
-0.7087177, 1.590908, -1.692565, 1, 1, 1, 1, 1,
-0.7051778, 0.6854085, -0.4169879, 0, 0, 1, 1, 1,
-0.7051409, -0.1624958, -2.281316, 1, 0, 0, 1, 1,
-0.7008813, 1.157791, -0.1068007, 1, 0, 0, 1, 1,
-0.6854137, 0.4488885, -0.02621475, 1, 0, 0, 1, 1,
-0.6790378, -0.9298841, -3.684848, 1, 0, 0, 1, 1,
-0.673855, 0.1333859, 1.315604, 1, 0, 0, 1, 1,
-0.6732894, -0.5093249, -2.215525, 0, 0, 0, 1, 1,
-0.6726566, 0.9640856, -1.143098, 0, 0, 0, 1, 1,
-0.6658702, -0.3490522, -1.450037, 0, 0, 0, 1, 1,
-0.6554646, -0.1439745, -2.065174, 0, 0, 0, 1, 1,
-0.6551434, 0.8349724, -0.3440657, 0, 0, 0, 1, 1,
-0.6532565, 0.4194768, -1.271899, 0, 0, 0, 1, 1,
-0.6453742, -0.6241722, -2.479299, 0, 0, 0, 1, 1,
-0.6450691, 0.9504771, -0.2321013, 1, 1, 1, 1, 1,
-0.6378778, -1.853835, -3.411453, 1, 1, 1, 1, 1,
-0.6369843, 1.759514, -0.5802336, 1, 1, 1, 1, 1,
-0.6319462, -0.1040484, -1.864055, 1, 1, 1, 1, 1,
-0.6285058, -1.657342, -3.183223, 1, 1, 1, 1, 1,
-0.6272489, 0.9486509, -0.6669809, 1, 1, 1, 1, 1,
-0.6243418, 0.442376, -2.237758, 1, 1, 1, 1, 1,
-0.6238404, -1.499664, -2.300132, 1, 1, 1, 1, 1,
-0.6171103, -0.8352242, -1.614553, 1, 1, 1, 1, 1,
-0.6148997, 1.258025, -1.89036, 1, 1, 1, 1, 1,
-0.6076871, 2.137537, -1.899842, 1, 1, 1, 1, 1,
-0.6071895, -1.047718, -0.5065061, 1, 1, 1, 1, 1,
-0.6066818, -0.6743982, -2.624878, 1, 1, 1, 1, 1,
-0.6015715, -0.2614525, -0.225231, 1, 1, 1, 1, 1,
-0.5979443, 1.930758, 1.303007, 1, 1, 1, 1, 1,
-0.5968348, -0.6833444, -1.851796, 0, 0, 1, 1, 1,
-0.5961335, 1.108062, 0.3094335, 1, 0, 0, 1, 1,
-0.596088, 1.411271, -0.2609602, 1, 0, 0, 1, 1,
-0.5946131, -0.6806929, -2.363663, 1, 0, 0, 1, 1,
-0.5933146, 0.9588711, 0.3913819, 1, 0, 0, 1, 1,
-0.5903262, -1.725235, -0.5895029, 1, 0, 0, 1, 1,
-0.590041, 1.139104, 1.359192, 0, 0, 0, 1, 1,
-0.5860604, 0.5772043, -1.068465, 0, 0, 0, 1, 1,
-0.5839085, 1.966735, 0.068452, 0, 0, 0, 1, 1,
-0.5819251, -0.0699163, -0.9428465, 0, 0, 0, 1, 1,
-0.5815597, -0.4756497, -3.287413, 0, 0, 0, 1, 1,
-0.5770476, 0.7821203, -0.06226811, 0, 0, 0, 1, 1,
-0.5739957, 0.04031305, -1.119768, 0, 0, 0, 1, 1,
-0.5732087, -0.4572731, -1.001601, 1, 1, 1, 1, 1,
-0.5705263, -1.205018, -2.604378, 1, 1, 1, 1, 1,
-0.5670058, -1.069435, -3.05933, 1, 1, 1, 1, 1,
-0.5654334, 0.7827861, -0.3945208, 1, 1, 1, 1, 1,
-0.564138, -0.7854242, -3.007444, 1, 1, 1, 1, 1,
-0.5620005, -2.435158, -4.932796, 1, 1, 1, 1, 1,
-0.5590635, 1.593032, 0.1712278, 1, 1, 1, 1, 1,
-0.5432029, 0.8499846, 1.060803, 1, 1, 1, 1, 1,
-0.540676, -0.6012235, -1.025716, 1, 1, 1, 1, 1,
-0.5404813, -0.7068222, -1.747725, 1, 1, 1, 1, 1,
-0.5399758, 0.5054926, -1.543059, 1, 1, 1, 1, 1,
-0.5384973, -2.13097, -2.783389, 1, 1, 1, 1, 1,
-0.5287722, -0.5730837, -2.650391, 1, 1, 1, 1, 1,
-0.52701, -0.971497, -1.071522, 1, 1, 1, 1, 1,
-0.5260902, -1.11041, -2.935194, 1, 1, 1, 1, 1,
-0.5251552, 0.4863273, -0.01802154, 0, 0, 1, 1, 1,
-0.5246426, -0.6776851, -2.434894, 1, 0, 0, 1, 1,
-0.5082868, -2.055677, -4.134263, 1, 0, 0, 1, 1,
-0.5077898, -0.03489293, -1.650217, 1, 0, 0, 1, 1,
-0.4976044, -0.1839231, -0.5954956, 1, 0, 0, 1, 1,
-0.4945524, -0.06884175, -1.819075, 1, 0, 0, 1, 1,
-0.4922719, 0.4044465, -1.002029, 0, 0, 0, 1, 1,
-0.4904782, 0.9709006, 0.6378361, 0, 0, 0, 1, 1,
-0.4888632, -0.2045161, -2.809563, 0, 0, 0, 1, 1,
-0.4874501, -0.3327964, -2.24347, 0, 0, 0, 1, 1,
-0.4833928, 1.580978, -2.770317, 0, 0, 0, 1, 1,
-0.483191, 0.5230297, -0.9502149, 0, 0, 0, 1, 1,
-0.4807782, 0.4619671, 2.058546, 0, 0, 0, 1, 1,
-0.4791843, 1.344185, -1.767526, 1, 1, 1, 1, 1,
-0.4762173, -0.3359217, -2.717261, 1, 1, 1, 1, 1,
-0.4758935, -0.484775, -2.232512, 1, 1, 1, 1, 1,
-0.47464, 0.6391536, -0.1719108, 1, 1, 1, 1, 1,
-0.4706479, -0.873906, -0.7904333, 1, 1, 1, 1, 1,
-0.4702287, 0.5809196, -1.000461, 1, 1, 1, 1, 1,
-0.469772, -0.1373054, -0.9995123, 1, 1, 1, 1, 1,
-0.4668605, -0.6217059, -1.550015, 1, 1, 1, 1, 1,
-0.4596457, -0.6496582, -1.300331, 1, 1, 1, 1, 1,
-0.4595276, -0.5371826, -2.835211, 1, 1, 1, 1, 1,
-0.4578057, -0.02970231, -3.14225, 1, 1, 1, 1, 1,
-0.4533343, 1.268114, 0.244608, 1, 1, 1, 1, 1,
-0.4525081, -0.9932199, -1.318312, 1, 1, 1, 1, 1,
-0.4511526, 0.3923566, 1.284731, 1, 1, 1, 1, 1,
-0.4501329, -0.4205455, -2.901174, 1, 1, 1, 1, 1,
-0.4452392, 1.839724, 0.5260524, 0, 0, 1, 1, 1,
-0.444099, 1.724725, -0.04664248, 1, 0, 0, 1, 1,
-0.4419158, -1.677868, -2.220534, 1, 0, 0, 1, 1,
-0.4392902, -1.259106, -2.125546, 1, 0, 0, 1, 1,
-0.4377801, -0.08694154, -2.51012, 1, 0, 0, 1, 1,
-0.4351928, -0.5993978, -1.078684, 1, 0, 0, 1, 1,
-0.4337844, 0.4635254, -1.159643, 0, 0, 0, 1, 1,
-0.4297882, -0.2700916, -2.005528, 0, 0, 0, 1, 1,
-0.4223633, -1.784622, -2.696108, 0, 0, 0, 1, 1,
-0.4157343, 0.2591, 0.7787654, 0, 0, 0, 1, 1,
-0.4088161, -0.06673887, -1.867752, 0, 0, 0, 1, 1,
-0.4082754, -0.3954602, -1.752689, 0, 0, 0, 1, 1,
-0.4062585, -0.349494, -1.126432, 0, 0, 0, 1, 1,
-0.4027816, 0.2258437, 0.921033, 1, 1, 1, 1, 1,
-0.3946342, 0.8628798, -0.6748937, 1, 1, 1, 1, 1,
-0.391908, 0.6402583, -0.4181238, 1, 1, 1, 1, 1,
-0.3915448, 1.171972, -0.09296124, 1, 1, 1, 1, 1,
-0.388849, -0.5575065, -0.9393709, 1, 1, 1, 1, 1,
-0.3880053, -1.167332, -4.437397, 1, 1, 1, 1, 1,
-0.3857468, 0.7696797, 1.091372, 1, 1, 1, 1, 1,
-0.384771, 1.359855, -0.8546969, 1, 1, 1, 1, 1,
-0.3847186, 0.338055, -0.4795311, 1, 1, 1, 1, 1,
-0.3845468, 0.09258461, -0.9075199, 1, 1, 1, 1, 1,
-0.380376, -0.7955495, -3.603916, 1, 1, 1, 1, 1,
-0.3790568, 0.8324395, -0.02567021, 1, 1, 1, 1, 1,
-0.3787574, -0.3834806, -1.630211, 1, 1, 1, 1, 1,
-0.3775486, -1.328593, -4.030525, 1, 1, 1, 1, 1,
-0.3772298, 0.4596113, 0.5398993, 1, 1, 1, 1, 1,
-0.3763762, 0.06651653, -1.617589, 0, 0, 1, 1, 1,
-0.3758377, 0.6833899, 0.4356308, 1, 0, 0, 1, 1,
-0.3689492, 1.990066, 1.063847, 1, 0, 0, 1, 1,
-0.365124, 0.1497317, -1.25918, 1, 0, 0, 1, 1,
-0.3640533, 0.6267353, -0.9738092, 1, 0, 0, 1, 1,
-0.3601924, -0.8026814, -4.046239, 1, 0, 0, 1, 1,
-0.3575763, -1.365921, -3.935421, 0, 0, 0, 1, 1,
-0.3538855, -0.1843747, -2.098758, 0, 0, 0, 1, 1,
-0.3534938, -2.58149, -3.376243, 0, 0, 0, 1, 1,
-0.3512992, 1.45891, -1.925619, 0, 0, 0, 1, 1,
-0.350375, -0.7682334, -4.720194, 0, 0, 0, 1, 1,
-0.3473069, -1.359413, -1.898158, 0, 0, 0, 1, 1,
-0.3270736, 0.8205487, -0.5232224, 0, 0, 0, 1, 1,
-0.3265509, -0.2534432, -1.370086, 1, 1, 1, 1, 1,
-0.3262633, -0.5292643, -1.906648, 1, 1, 1, 1, 1,
-0.3258993, -0.2143987, -4.48513, 1, 1, 1, 1, 1,
-0.3218825, -0.3385936, -4.591169, 1, 1, 1, 1, 1,
-0.3217385, -1.290421, -2.276372, 1, 1, 1, 1, 1,
-0.3155281, -0.3664988, -0.3844085, 1, 1, 1, 1, 1,
-0.3103983, -0.07762226, -0.5453467, 1, 1, 1, 1, 1,
-0.3098367, -0.9660538, -4.008081, 1, 1, 1, 1, 1,
-0.307591, -0.5599119, -0.7160106, 1, 1, 1, 1, 1,
-0.3073012, 0.8016559, -0.3439853, 1, 1, 1, 1, 1,
-0.3071595, 0.8750019, -0.8229811, 1, 1, 1, 1, 1,
-0.3063597, -0.3345163, -1.780415, 1, 1, 1, 1, 1,
-0.2951456, -0.6195982, -3.696588, 1, 1, 1, 1, 1,
-0.2926411, -0.5465962, -2.334348, 1, 1, 1, 1, 1,
-0.2872948, -1.176813, -2.755678, 1, 1, 1, 1, 1,
-0.2870578, 0.5791293, -0.2301064, 0, 0, 1, 1, 1,
-0.2866849, 0.2809384, 0.2770793, 1, 0, 0, 1, 1,
-0.2848433, 1.216501, -0.8151818, 1, 0, 0, 1, 1,
-0.2841025, -0.4685694, -4.746542, 1, 0, 0, 1, 1,
-0.2833304, 1.055872, -1.306675, 1, 0, 0, 1, 1,
-0.2757919, 1.63032, 0.1602078, 1, 0, 0, 1, 1,
-0.2725457, -1.304697, -1.850978, 0, 0, 0, 1, 1,
-0.2718596, -0.218523, -2.359481, 0, 0, 0, 1, 1,
-0.2691816, -0.6709494, -2.70623, 0, 0, 0, 1, 1,
-0.267678, 0.514219, -0.3657428, 0, 0, 0, 1, 1,
-0.2661785, 0.1477326, -1.47071, 0, 0, 0, 1, 1,
-0.2660683, 1.206671, 1.225302, 0, 0, 0, 1, 1,
-0.2645399, -1.027591, -2.777691, 0, 0, 0, 1, 1,
-0.2643997, 1.109805, -1.586779, 1, 1, 1, 1, 1,
-0.2630719, 1.710764, -1.195902, 1, 1, 1, 1, 1,
-0.2606953, 0.628038, -0.7064976, 1, 1, 1, 1, 1,
-0.2585986, -0.6288216, -1.806048, 1, 1, 1, 1, 1,
-0.2566852, 0.5832182, -0.805474, 1, 1, 1, 1, 1,
-0.2549572, -0.04586997, -3.433071, 1, 1, 1, 1, 1,
-0.2516491, 0.7945213, -1.453614, 1, 1, 1, 1, 1,
-0.2498045, 1.121892, 0.1370524, 1, 1, 1, 1, 1,
-0.2472335, 0.5321724, -1.075765, 1, 1, 1, 1, 1,
-0.2447021, 3.457649, -1.166533, 1, 1, 1, 1, 1,
-0.2442258, -0.9426085, -2.257871, 1, 1, 1, 1, 1,
-0.2430877, 0.7214808, 1.431175, 1, 1, 1, 1, 1,
-0.2411785, 0.9163579, 0.858328, 1, 1, 1, 1, 1,
-0.2372674, -1.167675, -3.022005, 1, 1, 1, 1, 1,
-0.2333568, -0.6573454, -1.800849, 1, 1, 1, 1, 1,
-0.2311142, -0.9235082, -3.423656, 0, 0, 1, 1, 1,
-0.2281678, 2.043375, -0.4289715, 1, 0, 0, 1, 1,
-0.2256877, -0.4589441, -0.7181352, 1, 0, 0, 1, 1,
-0.2240853, -0.7452905, -1.781722, 1, 0, 0, 1, 1,
-0.2231792, -0.7257285, -2.263775, 1, 0, 0, 1, 1,
-0.2196539, 0.313419, 0.2843717, 1, 0, 0, 1, 1,
-0.2156464, -1.145303, -2.936038, 0, 0, 0, 1, 1,
-0.2125963, 0.9545557, 0.8003741, 0, 0, 0, 1, 1,
-0.2090519, 0.1737823, 0.3804874, 0, 0, 0, 1, 1,
-0.2047463, 1.940453, 0.3862143, 0, 0, 0, 1, 1,
-0.2040615, -0.5027367, -1.214924, 0, 0, 0, 1, 1,
-0.1981505, 0.4678841, -0.2783945, 0, 0, 0, 1, 1,
-0.1916882, -0.2184013, -1.996437, 0, 0, 0, 1, 1,
-0.1910146, -1.828613, -1.28173, 1, 1, 1, 1, 1,
-0.1903086, -0.2795215, -2.454938, 1, 1, 1, 1, 1,
-0.1877165, 0.0392104, -2.515677, 1, 1, 1, 1, 1,
-0.1779315, -0.3792221, -1.571505, 1, 1, 1, 1, 1,
-0.1768873, -0.4166658, -2.061085, 1, 1, 1, 1, 1,
-0.1747127, -0.5990829, -4.752716, 1, 1, 1, 1, 1,
-0.1715334, 0.6224957, -2.697094, 1, 1, 1, 1, 1,
-0.1708245, 0.8990725, 0.08466259, 1, 1, 1, 1, 1,
-0.1700162, -1.999466, -2.660088, 1, 1, 1, 1, 1,
-0.1695618, 1.810238, -1.995822, 1, 1, 1, 1, 1,
-0.1689189, 1.768776, -0.4767073, 1, 1, 1, 1, 1,
-0.1668686, -0.2219869, -2.952455, 1, 1, 1, 1, 1,
-0.1629725, -1.461177, -4.613875, 1, 1, 1, 1, 1,
-0.1617509, 0.989132, -0.7568733, 1, 1, 1, 1, 1,
-0.1610051, -0.5381819, -2.425593, 1, 1, 1, 1, 1,
-0.1599794, -0.3227374, -3.329156, 0, 0, 1, 1, 1,
-0.1583603, -0.1374868, -1.875363, 1, 0, 0, 1, 1,
-0.1558845, -0.4394183, -3.527137, 1, 0, 0, 1, 1,
-0.1542188, 0.3638262, -0.7900627, 1, 0, 0, 1, 1,
-0.150797, -0.2800928, -1.566887, 1, 0, 0, 1, 1,
-0.1437052, 0.04161348, -0.5943008, 1, 0, 0, 1, 1,
-0.1436476, -0.5115216, -1.931931, 0, 0, 0, 1, 1,
-0.1430192, -0.4128995, -3.645001, 0, 0, 0, 1, 1,
-0.1408965, -0.1660891, -3.468265, 0, 0, 0, 1, 1,
-0.1387327, 1.815416, -1.296118, 0, 0, 0, 1, 1,
-0.1360337, 0.1554423, -1.092717, 0, 0, 0, 1, 1,
-0.1349079, -1.97943, -2.080956, 0, 0, 0, 1, 1,
-0.1346533, 0.6022146, 0.04327909, 0, 0, 0, 1, 1,
-0.1332186, -0.1988191, -3.527409, 1, 1, 1, 1, 1,
-0.130495, 0.7173885, -0.6579807, 1, 1, 1, 1, 1,
-0.1301153, 0.7528904, -0.7255214, 1, 1, 1, 1, 1,
-0.1284201, -0.9368222, -2.98106, 1, 1, 1, 1, 1,
-0.1250362, -0.9148959, -3.267164, 1, 1, 1, 1, 1,
-0.1237692, 0.06838026, -1.523931, 1, 1, 1, 1, 1,
-0.1214309, 0.1798781, -0.9609947, 1, 1, 1, 1, 1,
-0.1211948, 0.7815688, 0.1732993, 1, 1, 1, 1, 1,
-0.1106558, -0.9938845, -3.298577, 1, 1, 1, 1, 1,
-0.1081393, -0.1059255, -2.776526, 1, 1, 1, 1, 1,
-0.1068246, -0.03080027, -1.52953, 1, 1, 1, 1, 1,
-0.1067179, -1.093261, -2.147208, 1, 1, 1, 1, 1,
-0.1063506, 1.346075, -1.714851, 1, 1, 1, 1, 1,
-0.1062211, 1.539435, 1.043175, 1, 1, 1, 1, 1,
-0.09861916, 0.2880095, 0.7044943, 1, 1, 1, 1, 1,
-0.09854373, 0.076161, 0.591648, 0, 0, 1, 1, 1,
-0.09812837, -0.1638668, -1.743551, 1, 0, 0, 1, 1,
-0.09443022, 0.4114663, -0.6241844, 1, 0, 0, 1, 1,
-0.09438757, -0.256154, -2.596161, 1, 0, 0, 1, 1,
-0.09211332, -0.1547198, -2.30287, 1, 0, 0, 1, 1,
-0.08985228, 0.5184658, -0.1360182, 1, 0, 0, 1, 1,
-0.0896908, -0.5864304, -2.694052, 0, 0, 0, 1, 1,
-0.08541224, -0.02401284, -1.37299, 0, 0, 0, 1, 1,
-0.08294506, 2.535131, 0.4798899, 0, 0, 0, 1, 1,
-0.0797755, -0.09691823, -3.29843, 0, 0, 0, 1, 1,
-0.07896335, 0.04447411, -1.629328, 0, 0, 0, 1, 1,
-0.07878489, -0.0177427, -0.4220181, 0, 0, 0, 1, 1,
-0.07129145, -1.524665, -3.469222, 0, 0, 0, 1, 1,
-0.07010268, -0.01894101, -1.310042, 1, 1, 1, 1, 1,
-0.06879927, -0.08108541, -3.815172, 1, 1, 1, 1, 1,
-0.05995533, 1.182598, 0.9190649, 1, 1, 1, 1, 1,
-0.05862437, -0.5804884, -3.344096, 1, 1, 1, 1, 1,
-0.05453255, 1.276776, -0.5333309, 1, 1, 1, 1, 1,
-0.05274114, 0.6368262, -1.444085, 1, 1, 1, 1, 1,
-0.05139577, -1.658225, -3.379552, 1, 1, 1, 1, 1,
-0.05036002, 1.168538, 1.815403, 1, 1, 1, 1, 1,
-0.04612399, 0.02385024, -1.023794, 1, 1, 1, 1, 1,
-0.04416074, 0.256458, -1.074761, 1, 1, 1, 1, 1,
-0.04343628, -0.7009896, -2.349355, 1, 1, 1, 1, 1,
-0.03812294, -0.4731303, -3.347307, 1, 1, 1, 1, 1,
-0.03614183, 0.5437502, -0.927514, 1, 1, 1, 1, 1,
-0.0347065, 0.8916348, 0.620867, 1, 1, 1, 1, 1,
-0.034263, 0.506908, -0.3594519, 1, 1, 1, 1, 1,
-0.03399502, 1.159414, -0.3392619, 0, 0, 1, 1, 1,
-0.03099617, 1.504495, -1.090118, 1, 0, 0, 1, 1,
-0.02856234, -1.647879, -3.262254, 1, 0, 0, 1, 1,
-0.02440524, 1.662212, -1.273037, 1, 0, 0, 1, 1,
-0.02364371, 0.0124227, -0.1741632, 1, 0, 0, 1, 1,
-0.008154669, -0.8838399, -1.886165, 1, 0, 0, 1, 1,
-0.007867913, -0.0698357, -1.550651, 0, 0, 0, 1, 1,
-7.086757e-05, 1.273439, 1.289818, 0, 0, 0, 1, 1,
0.0005389082, -0.9806299, 3.423982, 0, 0, 0, 1, 1,
0.001628535, -0.2999203, 1.82504, 0, 0, 0, 1, 1,
0.00185227, 1.574759, 1.335074, 0, 0, 0, 1, 1,
0.002877229, 0.468489, -0.9233152, 0, 0, 0, 1, 1,
0.005445467, 0.151688, 0.4083231, 0, 0, 0, 1, 1,
0.01270717, -0.5885741, 4.939803, 1, 1, 1, 1, 1,
0.01284358, -0.8637477, 4.968604, 1, 1, 1, 1, 1,
0.01461646, 0.9563952, -0.7273927, 1, 1, 1, 1, 1,
0.01510418, 0.2973702, 0.9477444, 1, 1, 1, 1, 1,
0.01644945, -1.697129, 2.182235, 1, 1, 1, 1, 1,
0.01732514, 1.331828, -1.189338, 1, 1, 1, 1, 1,
0.01971283, -0.6324944, 2.356718, 1, 1, 1, 1, 1,
0.02531429, -0.7301349, 2.525053, 1, 1, 1, 1, 1,
0.03023308, -0.4402818, 2.062975, 1, 1, 1, 1, 1,
0.03162419, 0.3385078, -0.3506696, 1, 1, 1, 1, 1,
0.03214353, 0.4569906, -0.2558166, 1, 1, 1, 1, 1,
0.03300117, -1.507113, 2.008755, 1, 1, 1, 1, 1,
0.03321302, 0.1765545, -0.5265282, 1, 1, 1, 1, 1,
0.038876, -0.06789512, 1.608036, 1, 1, 1, 1, 1,
0.04144644, -0.05866656, 2.651212, 1, 1, 1, 1, 1,
0.04655476, 0.9110076, 0.4318205, 0, 0, 1, 1, 1,
0.04838653, -0.3238699, 2.971946, 1, 0, 0, 1, 1,
0.05175795, -0.4767743, 3.544499, 1, 0, 0, 1, 1,
0.05438767, -1.612039, 2.927937, 1, 0, 0, 1, 1,
0.05692494, -0.7380365, 2.059487, 1, 0, 0, 1, 1,
0.05822966, 1.020292, 0.2400782, 1, 0, 0, 1, 1,
0.06339302, 2.670193, 1.414963, 0, 0, 0, 1, 1,
0.06359419, 1.447901, -1.352511, 0, 0, 0, 1, 1,
0.06440558, 0.2350879, 0.8896649, 0, 0, 0, 1, 1,
0.0705185, -0.4260288, 2.966349, 0, 0, 0, 1, 1,
0.07289168, 0.09304395, 0.8631945, 0, 0, 0, 1, 1,
0.0729915, 0.1373209, -0.05115718, 0, 0, 0, 1, 1,
0.07421999, -1.070675, 2.966881, 0, 0, 0, 1, 1,
0.07946346, -0.4807032, 2.362018, 1, 1, 1, 1, 1,
0.08067235, 1.38078, -1.868067, 1, 1, 1, 1, 1,
0.08401719, 0.3678251, 0.04380516, 1, 1, 1, 1, 1,
0.09063393, -0.05448158, 1.35798, 1, 1, 1, 1, 1,
0.09297712, 0.6049633, -0.2489142, 1, 1, 1, 1, 1,
0.09602601, 0.5051644, 2.50096, 1, 1, 1, 1, 1,
0.0966284, -0.7402002, 3.200424, 1, 1, 1, 1, 1,
0.09846489, 0.3023772, -1.19219, 1, 1, 1, 1, 1,
0.09872845, 0.8414694, -0.9998721, 1, 1, 1, 1, 1,
0.09916703, 0.7146445, -0.4436564, 1, 1, 1, 1, 1,
0.1072353, -0.2222582, 2.532498, 1, 1, 1, 1, 1,
0.1079486, -0.7268115, 4.431486, 1, 1, 1, 1, 1,
0.1108906, -0.09430286, 1.932404, 1, 1, 1, 1, 1,
0.1145141, -0.7965645, 4.097547, 1, 1, 1, 1, 1,
0.1151784, 2.093231, 1.630987, 1, 1, 1, 1, 1,
0.1155215, -0.5669197, 1.637566, 0, 0, 1, 1, 1,
0.1194703, 0.6127628, -2.118558, 1, 0, 0, 1, 1,
0.1285585, 1.051036, -2.650114, 1, 0, 0, 1, 1,
0.1305329, 1.977055, -1.31981, 1, 0, 0, 1, 1,
0.1328006, 0.9092779, -0.775093, 1, 0, 0, 1, 1,
0.1369579, -0.2875567, 3.540092, 1, 0, 0, 1, 1,
0.1424022, 0.684432, 0.9203976, 0, 0, 0, 1, 1,
0.1449924, 0.4493796, 0.9414988, 0, 0, 0, 1, 1,
0.1450829, 1.470887, 0.4184645, 0, 0, 0, 1, 1,
0.1452329, -1.62844, 3.272956, 0, 0, 0, 1, 1,
0.1493552, 0.981718, 0.128617, 0, 0, 0, 1, 1,
0.1502884, -0.8046855, 1.295206, 0, 0, 0, 1, 1,
0.1520741, 0.3663519, 1.601675, 0, 0, 0, 1, 1,
0.153448, 0.7323331, -0.3394969, 1, 1, 1, 1, 1,
0.1546947, -0.9063222, 4.91858, 1, 1, 1, 1, 1,
0.1600226, -0.6439851, 3.532681, 1, 1, 1, 1, 1,
0.1614364, -0.3004116, 3.687303, 1, 1, 1, 1, 1,
0.1735287, -0.3395715, 2.538578, 1, 1, 1, 1, 1,
0.176492, 0.3762721, -0.8810073, 1, 1, 1, 1, 1,
0.1788227, -1.650941, 3.71821, 1, 1, 1, 1, 1,
0.1796131, 0.09561647, 1.077601, 1, 1, 1, 1, 1,
0.1828039, 1.226711, 0.8196896, 1, 1, 1, 1, 1,
0.1863786, 0.927812, -0.01929378, 1, 1, 1, 1, 1,
0.1865928, 0.8699551, -0.9825469, 1, 1, 1, 1, 1,
0.1868629, -1.647798, 4.04507, 1, 1, 1, 1, 1,
0.1939755, -0.2782649, 1.136778, 1, 1, 1, 1, 1,
0.194773, 1.188096, -0.8792924, 1, 1, 1, 1, 1,
0.1947993, -0.8380376, 2.405333, 1, 1, 1, 1, 1,
0.1951342, -0.2614484, 2.57394, 0, 0, 1, 1, 1,
0.1971159, -0.06614639, 0.7452536, 1, 0, 0, 1, 1,
0.2010397, -0.5694832, 1.026219, 1, 0, 0, 1, 1,
0.2045288, -2.299638, 0.8556041, 1, 0, 0, 1, 1,
0.2059788, 0.4755081, -0.7093524, 1, 0, 0, 1, 1,
0.2073889, 1.58172, 1.613393, 1, 0, 0, 1, 1,
0.2082621, 0.66884, 1.326139, 0, 0, 0, 1, 1,
0.2086931, 1.377311, -1.548345, 0, 0, 0, 1, 1,
0.2115431, -1.8229, 4.326522, 0, 0, 0, 1, 1,
0.2148932, 0.9229125, -0.3622252, 0, 0, 0, 1, 1,
0.2162859, -0.4337854, 3.517186, 0, 0, 0, 1, 1,
0.2202212, 0.04523031, 2.656927, 0, 0, 0, 1, 1,
0.2202627, 1.338672, -0.7885647, 0, 0, 0, 1, 1,
0.2211666, 0.3345718, 1.860376, 1, 1, 1, 1, 1,
0.2232863, 0.4175654, -0.1807577, 1, 1, 1, 1, 1,
0.2247885, 1.720937, -0.9707367, 1, 1, 1, 1, 1,
0.2279207, 0.7223811, 1.145236, 1, 1, 1, 1, 1,
0.231472, 0.6142913, -0.2222396, 1, 1, 1, 1, 1,
0.2371838, 0.7936007, -0.9548081, 1, 1, 1, 1, 1,
0.2378716, 0.4004573, -0.7776716, 1, 1, 1, 1, 1,
0.2395985, 1.554226, -0.1121505, 1, 1, 1, 1, 1,
0.2487466, -0.7460502, 3.074459, 1, 1, 1, 1, 1,
0.249913, -2.443285, 4.756799, 1, 1, 1, 1, 1,
0.2525277, -0.563809, 4.712476, 1, 1, 1, 1, 1,
0.2529694, 0.9412063, 1.791416, 1, 1, 1, 1, 1,
0.2609032, -1.924862, 4.101991, 1, 1, 1, 1, 1,
0.2627031, -0.8859019, 2.092953, 1, 1, 1, 1, 1,
0.2627135, 1.249345, -0.08208223, 1, 1, 1, 1, 1,
0.2641802, 0.5170965, -0.7758768, 0, 0, 1, 1, 1,
0.2679412, 1.418925, 0.8866874, 1, 0, 0, 1, 1,
0.2689288, 1.871448, -0.6950554, 1, 0, 0, 1, 1,
0.2755091, -0.9355462, 2.552058, 1, 0, 0, 1, 1,
0.2766981, 0.1871967, 1.583481, 1, 0, 0, 1, 1,
0.2806237, -1.511362, 3.923008, 1, 0, 0, 1, 1,
0.2848939, -0.5569152, 3.424375, 0, 0, 0, 1, 1,
0.2859147, 2.127682, 0.3703349, 0, 0, 0, 1, 1,
0.2894246, -0.01320256, 1.42758, 0, 0, 0, 1, 1,
0.2897637, -0.1249439, 3.247624, 0, 0, 0, 1, 1,
0.2933173, -0.5054483, 2.645363, 0, 0, 0, 1, 1,
0.294126, -0.8627635, 3.277821, 0, 0, 0, 1, 1,
0.3001652, -0.1595911, 1.720303, 0, 0, 0, 1, 1,
0.3066045, -0.8951891, 1.014881, 1, 1, 1, 1, 1,
0.3082213, 0.1383565, 0.4893303, 1, 1, 1, 1, 1,
0.3170626, -1.877279, 2.674246, 1, 1, 1, 1, 1,
0.3179991, -0.7332336, 2.852815, 1, 1, 1, 1, 1,
0.319018, 0.2891578, 1.273618, 1, 1, 1, 1, 1,
0.321242, 1.44917, 0.3332995, 1, 1, 1, 1, 1,
0.3228529, 0.1960161, -1.268219, 1, 1, 1, 1, 1,
0.324988, -1.335377, 2.245481, 1, 1, 1, 1, 1,
0.3272286, -1.377617, 1.341973, 1, 1, 1, 1, 1,
0.3278874, 0.9810818, 0.3352958, 1, 1, 1, 1, 1,
0.3304696, -0.5342466, 2.883285, 1, 1, 1, 1, 1,
0.3312253, 2.754318, 0.03509935, 1, 1, 1, 1, 1,
0.3315201, -0.3339915, 3.375153, 1, 1, 1, 1, 1,
0.3318621, 0.399522, 1.060261, 1, 1, 1, 1, 1,
0.3374324, 0.1480002, 0.9608871, 1, 1, 1, 1, 1,
0.3374707, -0.4430062, 1.228343, 0, 0, 1, 1, 1,
0.3385608, -0.2282519, 1.701903, 1, 0, 0, 1, 1,
0.3474224, -1.756305, 2.68872, 1, 0, 0, 1, 1,
0.3488139, -0.513359, 3.280182, 1, 0, 0, 1, 1,
0.3522588, 0.123894, 2.174542, 1, 0, 0, 1, 1,
0.3563652, 0.7654567, 0.8288096, 1, 0, 0, 1, 1,
0.3568137, 1.463967, 1.752911, 0, 0, 0, 1, 1,
0.3637504, -0.4109613, 2.5974, 0, 0, 0, 1, 1,
0.3667996, -0.2380725, 2.321739, 0, 0, 0, 1, 1,
0.3689154, 0.8274136, -0.1106232, 0, 0, 0, 1, 1,
0.3697719, 0.4921049, 1.654538, 0, 0, 0, 1, 1,
0.3714481, 0.3117054, 0.6584603, 0, 0, 0, 1, 1,
0.3721028, -0.585664, 1.187289, 0, 0, 0, 1, 1,
0.3801121, 0.2830495, 0.05085648, 1, 1, 1, 1, 1,
0.3810464, 1.043938, 0.9883646, 1, 1, 1, 1, 1,
0.3825732, 0.5712106, 1.82907, 1, 1, 1, 1, 1,
0.3830664, -0.5901432, 3.181081, 1, 1, 1, 1, 1,
0.3889413, 0.2394238, 0.2457231, 1, 1, 1, 1, 1,
0.3890235, -0.8775615, 3.407339, 1, 1, 1, 1, 1,
0.3897443, 2.217451, 0.1347387, 1, 1, 1, 1, 1,
0.3910103, -0.8546415, 1.576604, 1, 1, 1, 1, 1,
0.3915831, -0.002675583, 0.00202943, 1, 1, 1, 1, 1,
0.3917226, -0.9852069, 3.605638, 1, 1, 1, 1, 1,
0.3919257, -2.849197, 1.884649, 1, 1, 1, 1, 1,
0.3948768, 0.0904827, 1.035148, 1, 1, 1, 1, 1,
0.3956516, 2.472492, -0.3373424, 1, 1, 1, 1, 1,
0.3978925, -1.609866, 3.840536, 1, 1, 1, 1, 1,
0.4006132, -0.3730453, 1.831882, 1, 1, 1, 1, 1,
0.4090931, -0.6454641, 1.844902, 0, 0, 1, 1, 1,
0.4125181, -1.435495, 2.409271, 1, 0, 0, 1, 1,
0.4201546, 0.3823698, 3.269233, 1, 0, 0, 1, 1,
0.4226967, -2.196986, 2.379369, 1, 0, 0, 1, 1,
0.426488, 0.1292468, 1.43448, 1, 0, 0, 1, 1,
0.427236, 0.7882893, -0.01155864, 1, 0, 0, 1, 1,
0.4279394, 2.804622, 2.852855, 0, 0, 0, 1, 1,
0.4341165, 0.01473064, 1.223045, 0, 0, 0, 1, 1,
0.4345255, -0.8535956, 2.83993, 0, 0, 0, 1, 1,
0.4383371, -0.9860791, 3.822951, 0, 0, 0, 1, 1,
0.4405378, -0.5912982, 2.221281, 0, 0, 0, 1, 1,
0.4428178, 1.131763, 0.8873997, 0, 0, 0, 1, 1,
0.4448231, 0.4581381, 0.129186, 0, 0, 0, 1, 1,
0.4482189, -0.7865737, 2.087856, 1, 1, 1, 1, 1,
0.4482362, -0.9719264, 3.220196, 1, 1, 1, 1, 1,
0.4514687, 0.1126731, 1.176446, 1, 1, 1, 1, 1,
0.4540619, 0.9934581, -0.2925895, 1, 1, 1, 1, 1,
0.4575217, 0.0889492, 2.386209, 1, 1, 1, 1, 1,
0.4593638, 1.074944, 1.777616, 1, 1, 1, 1, 1,
0.4600276, 0.6878023, 0.2355301, 1, 1, 1, 1, 1,
0.472572, 0.8316475, 0.7684811, 1, 1, 1, 1, 1,
0.4811039, 0.8786874, -0.329942, 1, 1, 1, 1, 1,
0.4982644, 2.280852, -1.043312, 1, 1, 1, 1, 1,
0.4991254, -0.3938698, 2.697674, 1, 1, 1, 1, 1,
0.4993645, -0.8738055, 2.56477, 1, 1, 1, 1, 1,
0.4994753, -2.536536, 2.705241, 1, 1, 1, 1, 1,
0.4998136, 0.7287441, 0.8757436, 1, 1, 1, 1, 1,
0.5024775, -0.4670091, 3.760016, 1, 1, 1, 1, 1,
0.5028575, 1.649117, 0.6039611, 0, 0, 1, 1, 1,
0.5070022, 0.748822, 1.546045, 1, 0, 0, 1, 1,
0.5070313, 0.5198061, 1.462782, 1, 0, 0, 1, 1,
0.5116497, -0.04548487, 1.113049, 1, 0, 0, 1, 1,
0.5135271, -0.6619536, 2.332749, 1, 0, 0, 1, 1,
0.5154012, 0.5062474, 1.175245, 1, 0, 0, 1, 1,
0.5229955, -0.9743498, 2.757392, 0, 0, 0, 1, 1,
0.5253481, 0.065617, 1.607264, 0, 0, 0, 1, 1,
0.5291565, -0.2850809, 1.92217, 0, 0, 0, 1, 1,
0.5341713, -0.4550329, 2.237875, 0, 0, 0, 1, 1,
0.5369852, -0.684151, 0.791524, 0, 0, 0, 1, 1,
0.5399824, -1.371309, 1.870052, 0, 0, 0, 1, 1,
0.5494886, 0.2464881, 0.390622, 0, 0, 0, 1, 1,
0.5578519, -1.259717, 1.949872, 1, 1, 1, 1, 1,
0.5650862, 0.04357519, 1.146003, 1, 1, 1, 1, 1,
0.5704761, 0.1937364, 2.218178, 1, 1, 1, 1, 1,
0.5723885, -0.03769689, 0.4373549, 1, 1, 1, 1, 1,
0.5761046, -1.254421, 4.724807, 1, 1, 1, 1, 1,
0.5797918, 0.6900773, 0.733206, 1, 1, 1, 1, 1,
0.5854301, 0.7380317, 1.700742, 1, 1, 1, 1, 1,
0.5857973, 0.5069792, 1.862289, 1, 1, 1, 1, 1,
0.5862055, 1.828804, 0.812095, 1, 1, 1, 1, 1,
0.5867912, -0.8593536, 3.531803, 1, 1, 1, 1, 1,
0.5880287, -1.545839, 2.991936, 1, 1, 1, 1, 1,
0.5932711, -0.8949741, 0.844291, 1, 1, 1, 1, 1,
0.59341, -0.4031489, 2.663615, 1, 1, 1, 1, 1,
0.5977772, 0.7340718, 1.250437, 1, 1, 1, 1, 1,
0.6024653, 1.095711, 1.71264, 1, 1, 1, 1, 1,
0.6025433, -0.05273744, 2.369385, 0, 0, 1, 1, 1,
0.6147366, 0.5318531, 0.4454762, 1, 0, 0, 1, 1,
0.6167489, 1.068268, 1.033945, 1, 0, 0, 1, 1,
0.6177039, 0.4469588, 0.9565192, 1, 0, 0, 1, 1,
0.6178688, 0.4832869, -1.532444, 1, 0, 0, 1, 1,
0.618442, 1.337607, 1.429999, 1, 0, 0, 1, 1,
0.6201805, -0.6565895, 2.020804, 0, 0, 0, 1, 1,
0.6221734, -0.08545183, 2.611468, 0, 0, 0, 1, 1,
0.6294817, -1.042593, 1.40701, 0, 0, 0, 1, 1,
0.6306195, 0.4471065, 0.6920846, 0, 0, 0, 1, 1,
0.6320633, -0.2833285, 0.657383, 0, 0, 0, 1, 1,
0.6322438, 1.341932, 0.274717, 0, 0, 0, 1, 1,
0.6333433, -0.1710159, 1.675812, 0, 0, 0, 1, 1,
0.6387947, 0.7399212, -0.5892178, 1, 1, 1, 1, 1,
0.6401764, 3.263779, -0.9308376, 1, 1, 1, 1, 1,
0.6410223, -1.047821, 2.221524, 1, 1, 1, 1, 1,
0.6421489, -0.1155545, 3.060996, 1, 1, 1, 1, 1,
0.6539672, -0.9068539, 3.696706, 1, 1, 1, 1, 1,
0.6578261, -0.7355928, 2.833511, 1, 1, 1, 1, 1,
0.6657543, -0.2938589, 0.902088, 1, 1, 1, 1, 1,
0.66706, 0.6067883, -0.9275825, 1, 1, 1, 1, 1,
0.6693409, 0.672459, 1.729004, 1, 1, 1, 1, 1,
0.6696319, -0.7357216, 0.9996105, 1, 1, 1, 1, 1,
0.670215, -1.329859, 3.958773, 1, 1, 1, 1, 1,
0.6761394, 1.437577, 0.1929332, 1, 1, 1, 1, 1,
0.6769306, -0.663725, 1.304135, 1, 1, 1, 1, 1,
0.6817665, -1.942198, 3.130541, 1, 1, 1, 1, 1,
0.6820093, -0.4689922, 2.815294, 1, 1, 1, 1, 1,
0.6840324, -0.5711818, 3.156318, 0, 0, 1, 1, 1,
0.6914136, 0.9081768, 2.585587, 1, 0, 0, 1, 1,
0.6974905, 1.014707, -0.3646564, 1, 0, 0, 1, 1,
0.6988312, -0.7288561, 1.556737, 1, 0, 0, 1, 1,
0.7017748, 2.796963, -0.7626652, 1, 0, 0, 1, 1,
0.7046294, -0.77999, 1.857159, 1, 0, 0, 1, 1,
0.7054942, 0.6999076, 0.500393, 0, 0, 0, 1, 1,
0.7112696, 0.6264909, 2.369863, 0, 0, 0, 1, 1,
0.7126724, -1.287073, 2.140814, 0, 0, 0, 1, 1,
0.716401, 0.3919828, -0.7485481, 0, 0, 0, 1, 1,
0.7185987, 2.073828, -0.4512289, 0, 0, 0, 1, 1,
0.7224679, -0.5083004, 4.34359, 0, 0, 0, 1, 1,
0.7230159, 0.881351, -0.8914119, 0, 0, 0, 1, 1,
0.7230169, -2.613072, 2.584672, 1, 1, 1, 1, 1,
0.7239454, -0.6142731, 2.541473, 1, 1, 1, 1, 1,
0.7272071, 1.118363, 0.7466633, 1, 1, 1, 1, 1,
0.7290316, 0.124521, 1.58609, 1, 1, 1, 1, 1,
0.7304272, -1.659749, 2.58146, 1, 1, 1, 1, 1,
0.7342403, 1.45252, 0.4604886, 1, 1, 1, 1, 1,
0.738468, 1.964393, 1.430236, 1, 1, 1, 1, 1,
0.7388784, 0.1656131, -0.6965472, 1, 1, 1, 1, 1,
0.7477253, -0.4645263, 2.44047, 1, 1, 1, 1, 1,
0.7505119, 2.262736, 0.05622648, 1, 1, 1, 1, 1,
0.7533967, -0.01269761, 1.014901, 1, 1, 1, 1, 1,
0.7661794, -0.7059277, 2.182949, 1, 1, 1, 1, 1,
0.7663997, -0.2292609, 2.570057, 1, 1, 1, 1, 1,
0.7678002, -1.075766, 2.009449, 1, 1, 1, 1, 1,
0.768104, 0.075699, 1.372435, 1, 1, 1, 1, 1,
0.76872, -1.342439, 2.480008, 0, 0, 1, 1, 1,
0.7719721, -0.928316, 2.025438, 1, 0, 0, 1, 1,
0.7795531, -1.457892, 1.353959, 1, 0, 0, 1, 1,
0.780961, -0.01148172, 0.8898193, 1, 0, 0, 1, 1,
0.7839175, 0.07302738, 2.310651, 1, 0, 0, 1, 1,
0.7850747, 0.2976948, 1.141997, 1, 0, 0, 1, 1,
0.7855023, -0.0474446, 2.759805, 0, 0, 0, 1, 1,
0.7977349, 0.9567033, -1.323936, 0, 0, 0, 1, 1,
0.797977, -1.242002, 4.112906, 0, 0, 0, 1, 1,
0.8029572, -1.169238, 2.776891, 0, 0, 0, 1, 1,
0.8068268, 1.36883, 2.547733, 0, 0, 0, 1, 1,
0.8132295, 0.4791265, -0.2548146, 0, 0, 0, 1, 1,
0.8141438, -0.2557034, 2.392181, 0, 0, 0, 1, 1,
0.817041, 0.6107556, 0.2118132, 1, 1, 1, 1, 1,
0.8215313, 0.8396059, -0.7792515, 1, 1, 1, 1, 1,
0.8330706, 0.1945191, 1.334769, 1, 1, 1, 1, 1,
0.841863, -0.2251382, 2.182687, 1, 1, 1, 1, 1,
0.8486505, 0.6626841, 1.640082, 1, 1, 1, 1, 1,
0.850731, -1.575998, 2.011428, 1, 1, 1, 1, 1,
0.857207, 1.607418, 0.4305425, 1, 1, 1, 1, 1,
0.8588569, 1.20723, 1.244504, 1, 1, 1, 1, 1,
0.8607174, 0.3704616, 1.058972, 1, 1, 1, 1, 1,
0.8621463, -0.4497938, 0.8211083, 1, 1, 1, 1, 1,
0.8634418, -0.9269705, 4.053484, 1, 1, 1, 1, 1,
0.8664951, 1.913186, 0.4640033, 1, 1, 1, 1, 1,
0.8697175, -0.8002762, 2.138929, 1, 1, 1, 1, 1,
0.8708543, 0.872953, 1.013245, 1, 1, 1, 1, 1,
0.8764375, 0.4435697, 0.3783318, 1, 1, 1, 1, 1,
0.8769212, 0.6147195, 0.9905788, 0, 0, 1, 1, 1,
0.8780228, 0.2315625, -0.3285337, 1, 0, 0, 1, 1,
0.8856101, 0.1402079, 1.531304, 1, 0, 0, 1, 1,
0.8897235, 0.1254182, 2.772795, 1, 0, 0, 1, 1,
0.8952768, -1.106693, 2.813664, 1, 0, 0, 1, 1,
0.8966358, 0.6983729, 0.4475703, 1, 0, 0, 1, 1,
0.8998704, -0.7687496, 1.127409, 0, 0, 0, 1, 1,
0.9011919, 0.05716716, 1.550155, 0, 0, 0, 1, 1,
0.9028654, 0.7125741, 2.08137, 0, 0, 0, 1, 1,
0.9041775, 0.6781191, 2.106162, 0, 0, 0, 1, 1,
0.9045861, -0.192264, 1.986288, 0, 0, 0, 1, 1,
0.9046398, 1.578716, 1.066904, 0, 0, 0, 1, 1,
0.9104938, 1.244993, 1.651289, 0, 0, 0, 1, 1,
0.910512, -1.409862, 4.253657, 1, 1, 1, 1, 1,
0.919513, 1.56631, 0.2361197, 1, 1, 1, 1, 1,
0.9207423, 0.8886813, 0.1754806, 1, 1, 1, 1, 1,
0.9284406, 1.66328, 0.940819, 1, 1, 1, 1, 1,
0.9328414, 0.1121217, 1.386809, 1, 1, 1, 1, 1,
0.9348746, 0.6830725, -0.5637272, 1, 1, 1, 1, 1,
0.9413787, -0.5873559, 2.310707, 1, 1, 1, 1, 1,
0.9483203, -0.3348098, 2.401375, 1, 1, 1, 1, 1,
0.9483245, 0.6933492, 2.120178, 1, 1, 1, 1, 1,
0.9484313, -1.276708, 1.186657, 1, 1, 1, 1, 1,
0.9623492, 0.8963082, -0.984307, 1, 1, 1, 1, 1,
0.9660628, 0.4834558, 1.307204, 1, 1, 1, 1, 1,
0.9733393, 1.69271, 1.13755, 1, 1, 1, 1, 1,
0.9805219, 0.358486, 1.977177, 1, 1, 1, 1, 1,
0.9897828, 0.1835154, 0.04022366, 1, 1, 1, 1, 1,
1.002221, -0.3210095, 1.683983, 0, 0, 1, 1, 1,
1.004196, 1.51602, 0.0201456, 1, 0, 0, 1, 1,
1.005444, 0.6155255, 2.217947, 1, 0, 0, 1, 1,
1.007296, -1.417959, 2.335534, 1, 0, 0, 1, 1,
1.007779, 1.411654, -0.6299314, 1, 0, 0, 1, 1,
1.012818, 0.2190932, 1.001745, 1, 0, 0, 1, 1,
1.025933, 0.1889832, 0.9007534, 0, 0, 0, 1, 1,
1.029521, 0.3701495, -0.1357156, 0, 0, 0, 1, 1,
1.030285, 1.939343, 1.087865, 0, 0, 0, 1, 1,
1.032849, -0.3766472, 1.390402, 0, 0, 0, 1, 1,
1.035564, -0.6854672, -0.3330441, 0, 0, 0, 1, 1,
1.036896, 0.3335294, -0.5562466, 0, 0, 0, 1, 1,
1.044174, 0.385291, -0.7866147, 0, 0, 0, 1, 1,
1.050009, -2.002777, 3.360038, 1, 1, 1, 1, 1,
1.053749, 1.530701, -0.5861029, 1, 1, 1, 1, 1,
1.056653, 0.8606495, 2.400303, 1, 1, 1, 1, 1,
1.06141, 0.07720055, 0.9364639, 1, 1, 1, 1, 1,
1.064855, -0.3802535, 1.863645, 1, 1, 1, 1, 1,
1.065258, -0.7840838, 3.079847, 1, 1, 1, 1, 1,
1.074117, 1.741497, 1.404993, 1, 1, 1, 1, 1,
1.08457, 0.456349, 1.391086, 1, 1, 1, 1, 1,
1.088925, 0.1983309, 2.145807, 1, 1, 1, 1, 1,
1.094907, 0.2560456, 1.688396, 1, 1, 1, 1, 1,
1.095778, -1.091059, 2.339056, 1, 1, 1, 1, 1,
1.101703, -0.8997002, 4.271836, 1, 1, 1, 1, 1,
1.102548, 0.7290357, 1.354534, 1, 1, 1, 1, 1,
1.106558, -0.07291652, -0.1063802, 1, 1, 1, 1, 1,
1.109293, -0.1411826, 4.098997, 1, 1, 1, 1, 1,
1.116405, -1.082621, 1.50081, 0, 0, 1, 1, 1,
1.122383, -0.5035636, 2.279483, 1, 0, 0, 1, 1,
1.123933, 0.3815494, 1.112964, 1, 0, 0, 1, 1,
1.141497, -1.485093, 3.416844, 1, 0, 0, 1, 1,
1.148384, -0.04596475, 3.185505, 1, 0, 0, 1, 1,
1.174257, 1.243013, 1.71935, 1, 0, 0, 1, 1,
1.194083, 1.295677, 0.6703709, 0, 0, 0, 1, 1,
1.197102, 1.186772, 2.864127, 0, 0, 0, 1, 1,
1.203199, 0.4810356, 1.625861, 0, 0, 0, 1, 1,
1.208938, -1.070884, 4.157773, 0, 0, 0, 1, 1,
1.212247, -0.7739614, 0.262165, 0, 0, 0, 1, 1,
1.216072, -0.6041984, 0.7443579, 0, 0, 0, 1, 1,
1.227992, -1.51177, 3.725255, 0, 0, 0, 1, 1,
1.233327, 0.339656, 1.406396, 1, 1, 1, 1, 1,
1.236621, -2.299148, 3.228857, 1, 1, 1, 1, 1,
1.244096, -1.572625, 2.990061, 1, 1, 1, 1, 1,
1.250258, -0.4989223, 0.9964051, 1, 1, 1, 1, 1,
1.250307, -0.5173842, 1.472842, 1, 1, 1, 1, 1,
1.252517, 0.7750192, -0.5440159, 1, 1, 1, 1, 1,
1.263994, 0.798108, 0.5523857, 1, 1, 1, 1, 1,
1.266257, -0.4122887, 1.719782, 1, 1, 1, 1, 1,
1.27248, 1.121508, 0.4740255, 1, 1, 1, 1, 1,
1.272714, 1.193524, 0.5582194, 1, 1, 1, 1, 1,
1.278527, 0.2751895, 1.954111, 1, 1, 1, 1, 1,
1.278968, -1.606535, 1.164476, 1, 1, 1, 1, 1,
1.287268, 0.1622524, 1.306242, 1, 1, 1, 1, 1,
1.29132, 1.132636, -0.3429261, 1, 1, 1, 1, 1,
1.293009, -0.7656723, 3.538301, 1, 1, 1, 1, 1,
1.300829, 1.328313, 3.231441, 0, 0, 1, 1, 1,
1.32344, 0.5562317, 1.534465, 1, 0, 0, 1, 1,
1.32567, -0.09397864, 1.631701, 1, 0, 0, 1, 1,
1.326499, -0.749763, 1.941887, 1, 0, 0, 1, 1,
1.329718, 0.9215648, 1.925546, 1, 0, 0, 1, 1,
1.344116, 0.03930764, 1.113405, 1, 0, 0, 1, 1,
1.34923, -0.4338514, 0.1554718, 0, 0, 0, 1, 1,
1.357067, -1.037904, 3.519419, 0, 0, 0, 1, 1,
1.360432, -0.2959967, 3.935236, 0, 0, 0, 1, 1,
1.362797, -0.460635, 1.195248, 0, 0, 0, 1, 1,
1.362824, 0.3111561, 2.53744, 0, 0, 0, 1, 1,
1.367546, -1.370252, 3.640707, 0, 0, 0, 1, 1,
1.378575, -0.9510427, 1.353835, 0, 0, 0, 1, 1,
1.380766, 0.02685754, 2.233392, 1, 1, 1, 1, 1,
1.388815, 1.219802, 1.851151, 1, 1, 1, 1, 1,
1.391561, 0.136769, 1.251563, 1, 1, 1, 1, 1,
1.398026, 0.09507149, 1.739972, 1, 1, 1, 1, 1,
1.400111, -0.2920035, 1.461809, 1, 1, 1, 1, 1,
1.406578, 0.1076954, 0.6121567, 1, 1, 1, 1, 1,
1.408407, -0.8019978, 3.214374, 1, 1, 1, 1, 1,
1.412572, 0.1136126, 1.156383, 1, 1, 1, 1, 1,
1.413748, -0.8968493, 3.247468, 1, 1, 1, 1, 1,
1.423021, 0.08057258, 1.963295, 1, 1, 1, 1, 1,
1.433568, -0.4654237, 1.053211, 1, 1, 1, 1, 1,
1.445788, 1.144492, -0.07201975, 1, 1, 1, 1, 1,
1.445871, 1.928033, -1.498458, 1, 1, 1, 1, 1,
1.446164, -1.712804, 2.99965, 1, 1, 1, 1, 1,
1.454798, 0.319139, 0.7873941, 1, 1, 1, 1, 1,
1.455774, -0.2954269, 2.556297, 0, 0, 1, 1, 1,
1.458848, -0.1886517, 1.031556, 1, 0, 0, 1, 1,
1.462698, 0.1470101, 1.293591, 1, 0, 0, 1, 1,
1.477846, -0.03940431, 1.032597, 1, 0, 0, 1, 1,
1.478626, -0.6746111, 0.9654917, 1, 0, 0, 1, 1,
1.486909, 0.4725571, 0.2730498, 1, 0, 0, 1, 1,
1.501837, 0.7964368, 2.886656, 0, 0, 0, 1, 1,
1.517338, -0.7211376, -0.483241, 0, 0, 0, 1, 1,
1.527441, 1.791887, 2.076283, 0, 0, 0, 1, 1,
1.533467, -0.4826126, 3.933457, 0, 0, 0, 1, 1,
1.546553, -0.1148217, 2.025177, 0, 0, 0, 1, 1,
1.574914, -1.226699, 2.041349, 0, 0, 0, 1, 1,
1.57503, 0.3550799, 0.03245523, 0, 0, 0, 1, 1,
1.578731, 1.082413, 1.02528, 1, 1, 1, 1, 1,
1.589073, 0.05270375, 2.191845, 1, 1, 1, 1, 1,
1.59212, -0.5437186, -0.4626659, 1, 1, 1, 1, 1,
1.592812, -0.06058834, 2.44292, 1, 1, 1, 1, 1,
1.603999, 0.8703026, 1.350544, 1, 1, 1, 1, 1,
1.616508, -1.053852, 1.204247, 1, 1, 1, 1, 1,
1.622941, 1.588593, 1.127154, 1, 1, 1, 1, 1,
1.638046, -0.6463034, 2.90771, 1, 1, 1, 1, 1,
1.648141, -0.1615042, 1.117594, 1, 1, 1, 1, 1,
1.656551, 0.5165972, 0.9679543, 1, 1, 1, 1, 1,
1.656735, -0.5531445, 1.184946, 1, 1, 1, 1, 1,
1.667773, -0.7588136, 1.52208, 1, 1, 1, 1, 1,
1.671265, -0.8719386, -0.1079415, 1, 1, 1, 1, 1,
1.685391, 0.811601, 1.238516, 1, 1, 1, 1, 1,
1.714916, -0.6763253, 0.9833733, 1, 1, 1, 1, 1,
1.716569, 0.5553097, 2.612977, 0, 0, 1, 1, 1,
1.727982, 1.870093, 0.6826251, 1, 0, 0, 1, 1,
1.72957, 0.3333311, -0.2543664, 1, 0, 0, 1, 1,
1.752163, 0.7698112, 1.641175, 1, 0, 0, 1, 1,
1.785733, -2.331036, 1.985022, 1, 0, 0, 1, 1,
1.789163, -1.839287, 3.912691, 1, 0, 0, 1, 1,
1.799702, 0.1375439, 2.104787, 0, 0, 0, 1, 1,
1.804738, 1.068239, 0.8575084, 0, 0, 0, 1, 1,
1.813353, -1.492577, 1.179454, 0, 0, 0, 1, 1,
1.829236, 0.2436297, 3.785876, 0, 0, 0, 1, 1,
1.850535, -1.125858, 1.42367, 0, 0, 0, 1, 1,
1.871069, -1.614149, 2.634177, 0, 0, 0, 1, 1,
1.881462, 0.8854978, 1.232813, 0, 0, 0, 1, 1,
1.884972, -0.9092671, 2.582611, 1, 1, 1, 1, 1,
1.911484, 0.9766855, 0.4643583, 1, 1, 1, 1, 1,
1.920939, -0.8514162, 0.7358946, 1, 1, 1, 1, 1,
1.925109, -1.242184, 2.930577, 1, 1, 1, 1, 1,
1.959571, 0.8088591, 1.07015, 1, 1, 1, 1, 1,
1.974796, 0.663794, -0.2036625, 1, 1, 1, 1, 1,
1.988766, -1.784351, 2.628664, 1, 1, 1, 1, 1,
2.004293, -0.4173265, 0.0657439, 1, 1, 1, 1, 1,
2.008821, 0.4941128, 0.6558901, 1, 1, 1, 1, 1,
2.016324, 1.033497, 1.761067, 1, 1, 1, 1, 1,
2.032144, -0.6307566, 2.847113, 1, 1, 1, 1, 1,
2.037008, 0.3877417, 1.363755, 1, 1, 1, 1, 1,
2.040893, 0.8672085, -0.4699574, 1, 1, 1, 1, 1,
2.048584, 0.4348027, 0.9348717, 1, 1, 1, 1, 1,
2.050118, -1.245211, 2.081795, 1, 1, 1, 1, 1,
2.05175, -1.158969, 1.210275, 0, 0, 1, 1, 1,
2.069157, -1.359814, 2.638678, 1, 0, 0, 1, 1,
2.088748, -0.9483239, 3.006806, 1, 0, 0, 1, 1,
2.187335, 1.90271, 1.731575, 1, 0, 0, 1, 1,
2.206441, -0.4394651, 1.156407, 1, 0, 0, 1, 1,
2.213271, -1.914982, 2.938615, 1, 0, 0, 1, 1,
2.256507, 1.769183, 1.154196, 0, 0, 0, 1, 1,
2.267838, -0.8845041, 2.921593, 0, 0, 0, 1, 1,
2.288157, 1.016225, 0.8937483, 0, 0, 0, 1, 1,
2.294349, -0.2732008, 2.087545, 0, 0, 0, 1, 1,
2.294794, -1.439085, 2.901795, 0, 0, 0, 1, 1,
2.353004, -1.354323, 3.160189, 0, 0, 0, 1, 1,
2.412593, 0.4970436, 1.009755, 0, 0, 0, 1, 1,
2.464246, 0.1662476, 0.9231604, 1, 1, 1, 1, 1,
2.486076, -0.3885044, 1.193365, 1, 1, 1, 1, 1,
2.525269, -1.740412, -0.4638047, 1, 1, 1, 1, 1,
2.527645, 0.2267375, 2.375582, 1, 1, 1, 1, 1,
2.577756, -0.9221606, 0.1346217, 1, 1, 1, 1, 1,
2.607333, 0.6689939, 1.608194, 1, 1, 1, 1, 1,
3.076691, 0.8192691, 0.4717686, 1, 1, 1, 1, 1
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
var radius = 9.478849;
var distance = 33.29405;
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
mvMatrix.translate( 0.4646509, -0.1891112, -0.01790357 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29405);
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
