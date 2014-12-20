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
-3.337062, 0.9936279, -0.1302588, 1, 0, 0, 1,
-2.880231, -0.0623429, -0.6524011, 1, 0.007843138, 0, 1,
-2.844204, 0.3720109, -1.246804, 1, 0.01176471, 0, 1,
-2.639745, 0.6144032, -1.366904, 1, 0.01960784, 0, 1,
-2.574149, 1.324082, -0.8125012, 1, 0.02352941, 0, 1,
-2.496557, -0.861799, -1.099125, 1, 0.03137255, 0, 1,
-2.453066, -1.368926, -2.280481, 1, 0.03529412, 0, 1,
-2.409077, -0.1804751, -2.337078, 1, 0.04313726, 0, 1,
-2.343235, 1.986365, -0.5936464, 1, 0.04705882, 0, 1,
-2.321607, -1.413753, -2.146438, 1, 0.05490196, 0, 1,
-2.235316, -0.05167337, -2.720895, 1, 0.05882353, 0, 1,
-2.233592, -0.1536799, -2.632103, 1, 0.06666667, 0, 1,
-2.220059, -0.411908, -2.549411, 1, 0.07058824, 0, 1,
-2.202824, 0.05950799, -0.403875, 1, 0.07843138, 0, 1,
-2.1969, 0.1174825, -0.8553881, 1, 0.08235294, 0, 1,
-2.194661, 0.09538334, -1.935263, 1, 0.09019608, 0, 1,
-2.1655, 0.03682974, -1.041621, 1, 0.09411765, 0, 1,
-2.12997, -1.117802, -2.057009, 1, 0.1019608, 0, 1,
-2.129745, -0.6448312, -1.168133, 1, 0.1098039, 0, 1,
-2.1001, 0.0292553, -0.5038449, 1, 0.1137255, 0, 1,
-2.087224, 0.9268156, -1.162753, 1, 0.1215686, 0, 1,
-2.079284, 0.8475223, 0.1790956, 1, 0.1254902, 0, 1,
-2.070748, -1.586416, -2.417505, 1, 0.1333333, 0, 1,
-2.061851, -0.4169024, -0.4777804, 1, 0.1372549, 0, 1,
-2.059578, 1.144355, -2.699212, 1, 0.145098, 0, 1,
-1.99179, -1.00602, -2.409388, 1, 0.1490196, 0, 1,
-1.991165, 1.007619, -2.723901, 1, 0.1568628, 0, 1,
-1.988296, -0.4201135, -1.375607, 1, 0.1607843, 0, 1,
-1.968521, 0.9715002, -1.779666, 1, 0.1686275, 0, 1,
-1.955366, -0.4631315, -1.93823, 1, 0.172549, 0, 1,
-1.938244, -0.2214869, -3.510601, 1, 0.1803922, 0, 1,
-1.913486, 0.6008747, -2.283213, 1, 0.1843137, 0, 1,
-1.908606, -2.90082, -3.045643, 1, 0.1921569, 0, 1,
-1.890226, -0.31535, -1.961601, 1, 0.1960784, 0, 1,
-1.888103, -2.760769, -2.829864, 1, 0.2039216, 0, 1,
-1.876984, -0.2780424, -4.217038, 1, 0.2117647, 0, 1,
-1.866619, -0.5987483, -1.387084, 1, 0.2156863, 0, 1,
-1.846557, -1.124391, -3.039255, 1, 0.2235294, 0, 1,
-1.820665, -0.802048, -1.171962, 1, 0.227451, 0, 1,
-1.81792, -0.1802192, -2.185496, 1, 0.2352941, 0, 1,
-1.806712, -1.979017, -4.955626, 1, 0.2392157, 0, 1,
-1.78368, -0.403195, -2.310312, 1, 0.2470588, 0, 1,
-1.759662, 0.2086466, -1.044495, 1, 0.2509804, 0, 1,
-1.755869, -0.03863871, -2.725213, 1, 0.2588235, 0, 1,
-1.745979, 0.3974254, -0.9106905, 1, 0.2627451, 0, 1,
-1.744138, 1.209224, -0.5524846, 1, 0.2705882, 0, 1,
-1.718249, 0.9142312, 1.202437, 1, 0.2745098, 0, 1,
-1.713992, -1.829992, -0.4315532, 1, 0.282353, 0, 1,
-1.712801, 1.705701, -0.01381273, 1, 0.2862745, 0, 1,
-1.687745, -0.08022523, -2.759969, 1, 0.2941177, 0, 1,
-1.686046, -1.41327, -2.184683, 1, 0.3019608, 0, 1,
-1.674671, 0.9064642, -0.7465954, 1, 0.3058824, 0, 1,
-1.658025, 1.442021, -2.129785, 1, 0.3137255, 0, 1,
-1.652989, -0.3746966, -0.7464851, 1, 0.3176471, 0, 1,
-1.6405, -0.1282537, -1.911511, 1, 0.3254902, 0, 1,
-1.631553, -2.13395, -2.863971, 1, 0.3294118, 0, 1,
-1.614533, -0.4417163, -3.761189, 1, 0.3372549, 0, 1,
-1.611798, -0.4632666, -2.96155, 1, 0.3411765, 0, 1,
-1.611656, -0.2170077, -2.782401, 1, 0.3490196, 0, 1,
-1.605034, 0.432235, -1.041164, 1, 0.3529412, 0, 1,
-1.576776, -0.6327744, -4.084228, 1, 0.3607843, 0, 1,
-1.565379, -0.2576136, -1.646244, 1, 0.3647059, 0, 1,
-1.556332, -0.114186, -2.48784, 1, 0.372549, 0, 1,
-1.554931, 1.204394, -0.2708711, 1, 0.3764706, 0, 1,
-1.552581, -0.6503449, -2.257839, 1, 0.3843137, 0, 1,
-1.550064, 0.297202, -2.11848, 1, 0.3882353, 0, 1,
-1.548899, 1.782866, 1.23311, 1, 0.3960784, 0, 1,
-1.54566, -1.457287, -3.329875, 1, 0.4039216, 0, 1,
-1.539033, 0.3622911, -1.620244, 1, 0.4078431, 0, 1,
-1.531522, 0.5131499, -1.107942, 1, 0.4156863, 0, 1,
-1.506669, 0.5575373, -0.0351028, 1, 0.4196078, 0, 1,
-1.492639, 0.5704883, -0.2869145, 1, 0.427451, 0, 1,
-1.478763, 1.241936, -0.04498389, 1, 0.4313726, 0, 1,
-1.47544, -0.2972918, -1.378006, 1, 0.4392157, 0, 1,
-1.461441, -2.52921, -4.066635, 1, 0.4431373, 0, 1,
-1.45489, 0.8931739, -1.487021, 1, 0.4509804, 0, 1,
-1.454641, 1.43621, -3.431003, 1, 0.454902, 0, 1,
-1.438208, 0.7575241, -2.000354, 1, 0.4627451, 0, 1,
-1.431427, -0.2354293, -1.278576, 1, 0.4666667, 0, 1,
-1.425462, 0.8759988, -1.36115, 1, 0.4745098, 0, 1,
-1.423486, 0.3733054, -0.1514759, 1, 0.4784314, 0, 1,
-1.419913, -0.8671443, -0.3541704, 1, 0.4862745, 0, 1,
-1.419619, -0.08671495, -1.780177, 1, 0.4901961, 0, 1,
-1.417935, -1.748511, -1.524758, 1, 0.4980392, 0, 1,
-1.410131, 1.224059, -0.1967053, 1, 0.5058824, 0, 1,
-1.401158, -1.591992, -1.67256, 1, 0.509804, 0, 1,
-1.399323, 1.235683, -0.01203225, 1, 0.5176471, 0, 1,
-1.395073, -1.441764, -1.911028, 1, 0.5215687, 0, 1,
-1.394853, 0.8437245, 0.124352, 1, 0.5294118, 0, 1,
-1.391034, 0.1846124, -0.655124, 1, 0.5333334, 0, 1,
-1.387869, 0.5458782, -1.296876, 1, 0.5411765, 0, 1,
-1.374438, 1.589947, -0.8470941, 1, 0.5450981, 0, 1,
-1.370309, -0.3773372, -1.891762, 1, 0.5529412, 0, 1,
-1.361828, 0.3564506, -0.1242885, 1, 0.5568628, 0, 1,
-1.35269, -1.021358, -3.580761, 1, 0.5647059, 0, 1,
-1.35255, -0.8923596, -3.04549, 1, 0.5686275, 0, 1,
-1.350642, 1.521977, 1.492975, 1, 0.5764706, 0, 1,
-1.345861, -0.507374, 0.06233964, 1, 0.5803922, 0, 1,
-1.339936, -0.7374091, -2.783075, 1, 0.5882353, 0, 1,
-1.334636, 0.2089213, -1.197906, 1, 0.5921569, 0, 1,
-1.330221, -1.687942, -4.191345, 1, 0.6, 0, 1,
-1.323233, -1.545517, -4.829041, 1, 0.6078432, 0, 1,
-1.315847, -0.3858513, -3.371389, 1, 0.6117647, 0, 1,
-1.302395, -0.6910887, -2.647299, 1, 0.6196079, 0, 1,
-1.301415, 0.8328086, 0.3363482, 1, 0.6235294, 0, 1,
-1.295365, -0.3753699, -1.687557, 1, 0.6313726, 0, 1,
-1.283758, -0.648271, -2.424466, 1, 0.6352941, 0, 1,
-1.27706, -0.2588548, -3.347424, 1, 0.6431373, 0, 1,
-1.269474, -2.989539, -3.497337, 1, 0.6470588, 0, 1,
-1.267713, -0.3667912, -2.324737, 1, 0.654902, 0, 1,
-1.267059, -1.300118, -4.389577, 1, 0.6588235, 0, 1,
-1.261279, -0.6018949, -3.018911, 1, 0.6666667, 0, 1,
-1.252646, 1.542565, -1.665974, 1, 0.6705883, 0, 1,
-1.249166, 1.795264, -0.610719, 1, 0.6784314, 0, 1,
-1.248253, -0.7148805, -1.227623, 1, 0.682353, 0, 1,
-1.238346, 1.15691, -0.6392527, 1, 0.6901961, 0, 1,
-1.230811, 1.049709, -0.2687602, 1, 0.6941177, 0, 1,
-1.230205, 1.136153, -1.832352, 1, 0.7019608, 0, 1,
-1.205587, -0.8768195, -2.71662, 1, 0.7098039, 0, 1,
-1.20272, 0.2345814, -0.3114346, 1, 0.7137255, 0, 1,
-1.195046, -0.2401931, -2.425748, 1, 0.7215686, 0, 1,
-1.194915, -2.210804, -3.661304, 1, 0.7254902, 0, 1,
-1.190626, -0.7724527, -1.91312, 1, 0.7333333, 0, 1,
-1.186249, -0.168308, -1.561466, 1, 0.7372549, 0, 1,
-1.182556, -0.1233613, -2.830532, 1, 0.7450981, 0, 1,
-1.171067, 0.7157477, -1.084663, 1, 0.7490196, 0, 1,
-1.166785, -0.321592, -3.43728, 1, 0.7568628, 0, 1,
-1.16432, 0.1864277, -1.690583, 1, 0.7607843, 0, 1,
-1.157372, -0.2705988, -2.101247, 1, 0.7686275, 0, 1,
-1.153318, 0.618641, 0.4979303, 1, 0.772549, 0, 1,
-1.152276, -0.8944892, -1.498294, 1, 0.7803922, 0, 1,
-1.15203, -0.7690156, -1.27341, 1, 0.7843137, 0, 1,
-1.127586, -2.571554, -3.092186, 1, 0.7921569, 0, 1,
-1.125051, -0.5164816, -3.270974, 1, 0.7960784, 0, 1,
-1.121324, -1.142216, -1.644676, 1, 0.8039216, 0, 1,
-1.113038, -2.436567, -2.300951, 1, 0.8117647, 0, 1,
-1.104836, -1.246595, -3.048963, 1, 0.8156863, 0, 1,
-1.101308, 1.362741, 0.8460689, 1, 0.8235294, 0, 1,
-1.095126, -0.8142264, -2.652311, 1, 0.827451, 0, 1,
-1.094832, 2.245298, -1.659399, 1, 0.8352941, 0, 1,
-1.089721, -0.1085187, -3.074665, 1, 0.8392157, 0, 1,
-1.089302, -0.7926082, -2.06544, 1, 0.8470588, 0, 1,
-1.089041, 0.6809369, 0.3584996, 1, 0.8509804, 0, 1,
-1.081419, -0.5279338, -2.794912, 1, 0.8588235, 0, 1,
-1.06812, -0.5002777, -1.697758, 1, 0.8627451, 0, 1,
-1.067343, 0.1093548, -1.404241, 1, 0.8705882, 0, 1,
-1.059546, -0.1923178, -2.701197, 1, 0.8745098, 0, 1,
-1.055528, -1.173288, -1.375214, 1, 0.8823529, 0, 1,
-1.051012, -1.369062, -3.492615, 1, 0.8862745, 0, 1,
-1.047742, 1.359146, -0.4770011, 1, 0.8941177, 0, 1,
-1.04544, -1.131316, -1.238029, 1, 0.8980392, 0, 1,
-1.044361, -0.5307423, -1.693936, 1, 0.9058824, 0, 1,
-1.043326, 0.5880654, -3.155972, 1, 0.9137255, 0, 1,
-1.039744, -1.432044, -3.11871, 1, 0.9176471, 0, 1,
-1.037357, -1.992399, -3.210854, 1, 0.9254902, 0, 1,
-1.028085, 0.3778719, -0.262408, 1, 0.9294118, 0, 1,
-1.020145, -1.033222, -2.451014, 1, 0.9372549, 0, 1,
-1.01986, -0.247199, -2.976419, 1, 0.9411765, 0, 1,
-1.019625, -1.128531, -2.735276, 1, 0.9490196, 0, 1,
-1.013139, 2.040389, 0.195262, 1, 0.9529412, 0, 1,
-1.00882, -0.6164238, -2.69157, 1, 0.9607843, 0, 1,
-1.006694, 0.7142532, -0.6071397, 1, 0.9647059, 0, 1,
-1.004856, 0.8945224, -2.340789, 1, 0.972549, 0, 1,
-1.002469, 1.235678, -0.3029383, 1, 0.9764706, 0, 1,
-0.9998484, -0.6996839, -2.411635, 1, 0.9843137, 0, 1,
-0.9976964, 0.1754241, -0.1198568, 1, 0.9882353, 0, 1,
-0.9946724, 0.4551538, -1.289726, 1, 0.9960784, 0, 1,
-0.9907557, -0.04978671, -0.7486059, 0.9960784, 1, 0, 1,
-0.9815506, 0.3571644, -1.672286, 0.9921569, 1, 0, 1,
-0.981196, -1.198797, -2.502425, 0.9843137, 1, 0, 1,
-0.9775436, -0.1279262, -1.279564, 0.9803922, 1, 0, 1,
-0.9752891, -0.7189231, -0.5086866, 0.972549, 1, 0, 1,
-0.974718, 0.02551357, -1.050829, 0.9686275, 1, 0, 1,
-0.9706268, 0.2888404, -1.306784, 0.9607843, 1, 0, 1,
-0.9666491, -0.03367984, -0.75966, 0.9568627, 1, 0, 1,
-0.9580677, 0.928663, 0.1406075, 0.9490196, 1, 0, 1,
-0.9492779, 1.414719, -2.076199, 0.945098, 1, 0, 1,
-0.9461933, -0.3672058, -1.638765, 0.9372549, 1, 0, 1,
-0.9436765, -0.4082351, -2.718031, 0.9333333, 1, 0, 1,
-0.9415845, 0.07901583, -1.945589, 0.9254902, 1, 0, 1,
-0.9401491, -0.4028584, -1.013395, 0.9215686, 1, 0, 1,
-0.9377654, -0.1534086, -1.967023, 0.9137255, 1, 0, 1,
-0.9332677, 1.424016, -0.95753, 0.9098039, 1, 0, 1,
-0.9304944, -0.8821175, -1.256729, 0.9019608, 1, 0, 1,
-0.9278728, 1.067106, -1.376558, 0.8941177, 1, 0, 1,
-0.9217154, -2.644777, -1.438916, 0.8901961, 1, 0, 1,
-0.9216008, 0.6124747, 0.069746, 0.8823529, 1, 0, 1,
-0.9169965, -0.31681, -0.119178, 0.8784314, 1, 0, 1,
-0.9128587, -0.1255503, -1.136659, 0.8705882, 1, 0, 1,
-0.9097057, -0.9686311, -3.881342, 0.8666667, 1, 0, 1,
-0.9023381, 0.1920339, -1.975819, 0.8588235, 1, 0, 1,
-0.9015421, 0.4689648, -1.130615, 0.854902, 1, 0, 1,
-0.8996492, -1.956432, -3.913632, 0.8470588, 1, 0, 1,
-0.8995744, -1.209519, -0.7303942, 0.8431373, 1, 0, 1,
-0.8989307, 0.2470193, -2.015579, 0.8352941, 1, 0, 1,
-0.8961686, 0.1481764, -1.404406, 0.8313726, 1, 0, 1,
-0.8927239, 0.6449068, -0.07610645, 0.8235294, 1, 0, 1,
-0.8918707, 0.8346957, 0.4330157, 0.8196079, 1, 0, 1,
-0.8904952, 0.07699333, -0.3610522, 0.8117647, 1, 0, 1,
-0.8882967, -0.0230519, -2.505171, 0.8078431, 1, 0, 1,
-0.8859838, 0.008261422, -1.789675, 0.8, 1, 0, 1,
-0.8773154, 1.543712, -0.2390236, 0.7921569, 1, 0, 1,
-0.8750242, 1.165572, -0.62186, 0.7882353, 1, 0, 1,
-0.8709708, -0.6144476, -1.834924, 0.7803922, 1, 0, 1,
-0.8689685, -0.9806359, -3.481568, 0.7764706, 1, 0, 1,
-0.8630461, 0.8860188, 0.9537277, 0.7686275, 1, 0, 1,
-0.8623856, -0.5063969, -2.984302, 0.7647059, 1, 0, 1,
-0.8607499, -1.181638, -1.840668, 0.7568628, 1, 0, 1,
-0.8523137, 1.412718, -0.1403378, 0.7529412, 1, 0, 1,
-0.851777, 0.6967927, -2.376065, 0.7450981, 1, 0, 1,
-0.8505071, -0.1780913, -1.59272, 0.7411765, 1, 0, 1,
-0.847319, -0.4590758, -3.609147, 0.7333333, 1, 0, 1,
-0.8448149, 1.585258, -1.373703, 0.7294118, 1, 0, 1,
-0.8394116, 2.107223, -1.115515, 0.7215686, 1, 0, 1,
-0.8358677, -0.7874768, -1.887688, 0.7176471, 1, 0, 1,
-0.8348072, -1.205485, -2.857965, 0.7098039, 1, 0, 1,
-0.8346649, -0.789372, -0.6434156, 0.7058824, 1, 0, 1,
-0.8342421, -0.9593405, -3.198373, 0.6980392, 1, 0, 1,
-0.8323492, -0.6661564, -1.853164, 0.6901961, 1, 0, 1,
-0.8271919, 0.1006057, -1.825442, 0.6862745, 1, 0, 1,
-0.8198054, 0.07854423, -3.17406, 0.6784314, 1, 0, 1,
-0.8173978, 0.4069107, -1.303855, 0.6745098, 1, 0, 1,
-0.8154561, -0.2855241, -2.158328, 0.6666667, 1, 0, 1,
-0.8148893, 0.5803092, 0.05954735, 0.6627451, 1, 0, 1,
-0.8047479, -0.3079768, -3.403291, 0.654902, 1, 0, 1,
-0.8040468, -0.04222918, -1.929389, 0.6509804, 1, 0, 1,
-0.803897, 1.322111, 1.594479, 0.6431373, 1, 0, 1,
-0.8036734, -1.184689, -1.996545, 0.6392157, 1, 0, 1,
-0.8027837, -0.2314004, -2.449902, 0.6313726, 1, 0, 1,
-0.8024518, -0.6088871, -1.544151, 0.627451, 1, 0, 1,
-0.8002577, -1.5698, -2.416606, 0.6196079, 1, 0, 1,
-0.7990592, -1.649199, -2.597277, 0.6156863, 1, 0, 1,
-0.795149, -1.186325, -3.556916, 0.6078432, 1, 0, 1,
-0.7929096, -0.5231544, -3.472945, 0.6039216, 1, 0, 1,
-0.7892635, 0.5082838, -2.099838, 0.5960785, 1, 0, 1,
-0.7830551, 0.9293029, 0.3830131, 0.5882353, 1, 0, 1,
-0.776668, -0.7328147, -3.070124, 0.5843138, 1, 0, 1,
-0.773806, -0.4713879, -1.986232, 0.5764706, 1, 0, 1,
-0.7699246, -0.1351176, -3.139966, 0.572549, 1, 0, 1,
-0.7629177, -0.5744598, -2.251407, 0.5647059, 1, 0, 1,
-0.7569512, -0.5673832, -3.209682, 0.5607843, 1, 0, 1,
-0.7545159, -0.8889506, -3.992232, 0.5529412, 1, 0, 1,
-0.7496448, 0.4585632, -1.511958, 0.5490196, 1, 0, 1,
-0.7445775, -0.2488059, -3.221526, 0.5411765, 1, 0, 1,
-0.742646, 2.784652, 1.786777, 0.5372549, 1, 0, 1,
-0.7421505, 0.34738, -2.793573, 0.5294118, 1, 0, 1,
-0.7414851, 1.003715, -0.6645343, 0.5254902, 1, 0, 1,
-0.7405104, -1.286066, -4.151338, 0.5176471, 1, 0, 1,
-0.7389218, -0.1023927, -2.593095, 0.5137255, 1, 0, 1,
-0.7372544, -0.3346382, -0.2993907, 0.5058824, 1, 0, 1,
-0.7335718, 2.156522, 0.337268, 0.5019608, 1, 0, 1,
-0.7290097, 0.5866207, 0.6116775, 0.4941176, 1, 0, 1,
-0.7282671, 0.2854944, 1.095051, 0.4862745, 1, 0, 1,
-0.7262579, -2.483536, -2.209458, 0.4823529, 1, 0, 1,
-0.7249758, -0.6581621, -1.140148, 0.4745098, 1, 0, 1,
-0.7213201, 2.214047, 1.081098, 0.4705882, 1, 0, 1,
-0.7170358, 0.6552176, -3.452642, 0.4627451, 1, 0, 1,
-0.7118193, -2.100434, -3.228598, 0.4588235, 1, 0, 1,
-0.7047123, -0.7024302, -2.354596, 0.4509804, 1, 0, 1,
-0.7036248, 0.6358546, 0.1507694, 0.4470588, 1, 0, 1,
-0.6970635, -1.40569, -2.809662, 0.4392157, 1, 0, 1,
-0.6953309, -1.712242, -2.564857, 0.4352941, 1, 0, 1,
-0.6926574, 0.3120476, -0.5656444, 0.427451, 1, 0, 1,
-0.6918165, -0.2877443, -2.286419, 0.4235294, 1, 0, 1,
-0.6880923, 0.11662, -1.14631, 0.4156863, 1, 0, 1,
-0.6829353, -0.3440945, -1.943816, 0.4117647, 1, 0, 1,
-0.6746401, -0.729036, -2.134397, 0.4039216, 1, 0, 1,
-0.6727587, 0.7906361, 0.1609418, 0.3960784, 1, 0, 1,
-0.6689379, -1.472108, -2.895505, 0.3921569, 1, 0, 1,
-0.6681952, 1.351097, -0.08342321, 0.3843137, 1, 0, 1,
-0.6672018, 0.164621, -2.833789, 0.3803922, 1, 0, 1,
-0.6664072, -0.8357639, -2.839122, 0.372549, 1, 0, 1,
-0.6620571, 0.2652339, -1.996836, 0.3686275, 1, 0, 1,
-0.6576734, -1.43603, -2.165025, 0.3607843, 1, 0, 1,
-0.6511934, 0.7190973, -1.843672, 0.3568628, 1, 0, 1,
-0.639698, 1.386729, -1.504675, 0.3490196, 1, 0, 1,
-0.6396828, 1.180041, 0.6605864, 0.345098, 1, 0, 1,
-0.6373881, 0.6800356, 0.3193576, 0.3372549, 1, 0, 1,
-0.6207931, 0.4930959, -0.7736366, 0.3333333, 1, 0, 1,
-0.6204565, -1.066964, -2.643892, 0.3254902, 1, 0, 1,
-0.6183365, 0.2430577, -1.678399, 0.3215686, 1, 0, 1,
-0.6172654, 1.169239, -1.624758, 0.3137255, 1, 0, 1,
-0.6141235, 0.2533205, -2.127779, 0.3098039, 1, 0, 1,
-0.6127028, 0.1212029, -2.128027, 0.3019608, 1, 0, 1,
-0.6098952, -0.7183776, -2.816947, 0.2941177, 1, 0, 1,
-0.608305, -1.059362, -2.096548, 0.2901961, 1, 0, 1,
-0.6069593, -1.021365, -2.047218, 0.282353, 1, 0, 1,
-0.6059394, 0.9250427, -0.5612018, 0.2784314, 1, 0, 1,
-0.6041458, 0.09225675, -1.858801, 0.2705882, 1, 0, 1,
-0.6034725, -1.55487, -4.446927, 0.2666667, 1, 0, 1,
-0.6021307, 1.598059, -1.159402, 0.2588235, 1, 0, 1,
-0.6011391, 0.08595576, -0.5687618, 0.254902, 1, 0, 1,
-0.5991966, 0.003416228, -2.349571, 0.2470588, 1, 0, 1,
-0.5983899, -1.041317, -3.389024, 0.2431373, 1, 0, 1,
-0.5943847, -0.8311024, -1.227315, 0.2352941, 1, 0, 1,
-0.5914218, 2.594209, -0.182865, 0.2313726, 1, 0, 1,
-0.590305, 0.7460887, -1.34152, 0.2235294, 1, 0, 1,
-0.5819646, -0.423975, -1.14096, 0.2196078, 1, 0, 1,
-0.581249, -1.11315, -1.604312, 0.2117647, 1, 0, 1,
-0.5779124, 0.00916444, -1.452405, 0.2078431, 1, 0, 1,
-0.569879, 0.1221286, -1.785399, 0.2, 1, 0, 1,
-0.5644277, 0.4756541, -1.192366, 0.1921569, 1, 0, 1,
-0.5555027, -0.3529461, -1.718949, 0.1882353, 1, 0, 1,
-0.5524518, 0.2950588, 0.383923, 0.1803922, 1, 0, 1,
-0.5502873, 0.3714779, -1.817105, 0.1764706, 1, 0, 1,
-0.5502719, -1.620246, -2.668684, 0.1686275, 1, 0, 1,
-0.5466599, -0.3379488, -1.44456, 0.1647059, 1, 0, 1,
-0.5461681, -0.6437733, -0.7680641, 0.1568628, 1, 0, 1,
-0.5412655, 0.2630474, 0.0242062, 0.1529412, 1, 0, 1,
-0.5381104, 1.933053, 0.4913756, 0.145098, 1, 0, 1,
-0.5371615, -1.720188, -2.384557, 0.1411765, 1, 0, 1,
-0.5357306, 1.136908, -0.05188823, 0.1333333, 1, 0, 1,
-0.5357095, 0.1299012, -3.192989, 0.1294118, 1, 0, 1,
-0.5301433, 1.666512, 0.6614383, 0.1215686, 1, 0, 1,
-0.5290886, 2.349809, 1.565877, 0.1176471, 1, 0, 1,
-0.5271227, 0.4582421, -0.5864699, 0.1098039, 1, 0, 1,
-0.5260848, -0.3074999, -0.1505466, 0.1058824, 1, 0, 1,
-0.5260245, 0.6123406, 2.743301, 0.09803922, 1, 0, 1,
-0.5244705, -1.056544, -4.120527, 0.09019608, 1, 0, 1,
-0.5241495, 1.059086, 0.2805847, 0.08627451, 1, 0, 1,
-0.5240275, -0.03919004, -2.287225, 0.07843138, 1, 0, 1,
-0.523917, 0.2662923, -0.4917894, 0.07450981, 1, 0, 1,
-0.5216025, -1.620537, -1.655998, 0.06666667, 1, 0, 1,
-0.5195079, -0.4494614, -1.443333, 0.0627451, 1, 0, 1,
-0.5178245, -0.5739667, -0.8387645, 0.05490196, 1, 0, 1,
-0.5150537, 1.150848, -0.3989884, 0.05098039, 1, 0, 1,
-0.5114454, 0.2536133, -0.7405984, 0.04313726, 1, 0, 1,
-0.4963831, 0.7564831, 0.4965996, 0.03921569, 1, 0, 1,
-0.4963622, -0.2739064, -0.7257147, 0.03137255, 1, 0, 1,
-0.4890352, 0.06955422, -1.390143, 0.02745098, 1, 0, 1,
-0.4802904, -0.3228958, -1.480518, 0.01960784, 1, 0, 1,
-0.4766536, -0.231741, -2.177356, 0.01568628, 1, 0, 1,
-0.4763147, 0.08060265, -2.466737, 0.007843138, 1, 0, 1,
-0.4762353, -1.531119, -3.679119, 0.003921569, 1, 0, 1,
-0.4755691, -0.6440802, -2.340219, 0, 1, 0.003921569, 1,
-0.4744918, -0.4320211, -2.74168, 0, 1, 0.01176471, 1,
-0.4681264, -0.6329837, -3.071336, 0, 1, 0.01568628, 1,
-0.4669225, -0.02496546, -2.595178, 0, 1, 0.02352941, 1,
-0.4596029, 0.7189399, -2.021987, 0, 1, 0.02745098, 1,
-0.4575522, -1.690184, -4.530901, 0, 1, 0.03529412, 1,
-0.4567756, -0.4907117, -2.448078, 0, 1, 0.03921569, 1,
-0.4562134, -0.01325311, -2.678219, 0, 1, 0.04705882, 1,
-0.4523933, 0.3354766, -0.7715534, 0, 1, 0.05098039, 1,
-0.4490209, 0.7870414, -1.079032, 0, 1, 0.05882353, 1,
-0.4452356, -1.940714, -5.125493, 0, 1, 0.0627451, 1,
-0.4444616, -0.5203369, -2.120989, 0, 1, 0.07058824, 1,
-0.4442443, 0.3318423, -0.9315362, 0, 1, 0.07450981, 1,
-0.4440367, -0.1403481, -0.9953851, 0, 1, 0.08235294, 1,
-0.4436698, -0.01869644, -2.352421, 0, 1, 0.08627451, 1,
-0.4432667, 1.281099, -0.8687028, 0, 1, 0.09411765, 1,
-0.4421989, -1.296324, -3.02023, 0, 1, 0.1019608, 1,
-0.4391448, -0.6435621, -4.446338, 0, 1, 0.1058824, 1,
-0.4370497, 0.6246779, -2.980725, 0, 1, 0.1137255, 1,
-0.4334723, 1.119424, 0.9249592, 0, 1, 0.1176471, 1,
-0.432887, 0.7058917, 0.4852881, 0, 1, 0.1254902, 1,
-0.4321291, 1.193447, -1.526661, 0, 1, 0.1294118, 1,
-0.4282205, -0.06023151, -2.092083, 0, 1, 0.1372549, 1,
-0.427802, 0.1898305, 0.7516409, 0, 1, 0.1411765, 1,
-0.4271309, -0.8904433, -3.599067, 0, 1, 0.1490196, 1,
-0.4170245, -0.2459087, -1.8319, 0, 1, 0.1529412, 1,
-0.4139383, 0.610218, -2.310849, 0, 1, 0.1607843, 1,
-0.405256, -0.409531, -2.017905, 0, 1, 0.1647059, 1,
-0.4052283, -2.045921, -4.217701, 0, 1, 0.172549, 1,
-0.4051925, -2.395453, -3.987866, 0, 1, 0.1764706, 1,
-0.4048213, -0.4802116, -2.860972, 0, 1, 0.1843137, 1,
-0.4043253, -0.08318464, -1.054982, 0, 1, 0.1882353, 1,
-0.4030131, -0.3761095, -1.980286, 0, 1, 0.1960784, 1,
-0.397212, -1.73525, -2.049117, 0, 1, 0.2039216, 1,
-0.394949, -0.2011816, -3.247967, 0, 1, 0.2078431, 1,
-0.3919813, -0.7619739, -1.559749, 0, 1, 0.2156863, 1,
-0.391172, 0.221271, -3.094307, 0, 1, 0.2196078, 1,
-0.3847246, -0.4351695, -2.270399, 0, 1, 0.227451, 1,
-0.3823155, -0.5203014, -2.458329, 0, 1, 0.2313726, 1,
-0.3740282, -0.691103, -3.114834, 0, 1, 0.2392157, 1,
-0.3719987, -0.6936752, -3.476906, 0, 1, 0.2431373, 1,
-0.3699904, -1.118652, -0.02624976, 0, 1, 0.2509804, 1,
-0.3692961, -1.024701, -3.746794, 0, 1, 0.254902, 1,
-0.3680064, 1.678677, -0.9627703, 0, 1, 0.2627451, 1,
-0.3660475, 2.571851, -1.207833, 0, 1, 0.2666667, 1,
-0.3618879, -0.1375728, -1.810411, 0, 1, 0.2745098, 1,
-0.3612202, -2.032858, -1.749069, 0, 1, 0.2784314, 1,
-0.3598521, -0.3402367, -1.58305, 0, 1, 0.2862745, 1,
-0.3590633, -0.3966889, -1.753243, 0, 1, 0.2901961, 1,
-0.3588237, -0.02840477, -1.549124, 0, 1, 0.2980392, 1,
-0.3581635, 1.03941, -0.246135, 0, 1, 0.3058824, 1,
-0.3510468, 0.004425087, -1.437222, 0, 1, 0.3098039, 1,
-0.3494762, 0.4830367, 0.8907993, 0, 1, 0.3176471, 1,
-0.3488412, 0.6276693, 0.2743467, 0, 1, 0.3215686, 1,
-0.3470875, 0.5288324, -1.125246, 0, 1, 0.3294118, 1,
-0.3468443, -0.1607404, -1.89607, 0, 1, 0.3333333, 1,
-0.3431967, -0.460502, -2.120967, 0, 1, 0.3411765, 1,
-0.3393711, -1.734011, -1.563153, 0, 1, 0.345098, 1,
-0.3351102, -0.1917272, -3.62636, 0, 1, 0.3529412, 1,
-0.3342846, -0.5722308, -3.869938, 0, 1, 0.3568628, 1,
-0.3312601, -1.314856, -1.744412, 0, 1, 0.3647059, 1,
-0.3256989, 0.0825967, -0.9131817, 0, 1, 0.3686275, 1,
-0.3207345, -1.26896, -3.082461, 0, 1, 0.3764706, 1,
-0.3206018, 1.133597, -0.9882883, 0, 1, 0.3803922, 1,
-0.3201702, 1.247761, 1.596658, 0, 1, 0.3882353, 1,
-0.3132164, 0.2558913, -0.3706959, 0, 1, 0.3921569, 1,
-0.3130103, 0.8323529, 1.858236, 0, 1, 0.4, 1,
-0.3103954, -0.1735905, -1.134737, 0, 1, 0.4078431, 1,
-0.304736, 0.6436778, 0.1330673, 0, 1, 0.4117647, 1,
-0.3021974, 1.102035, -1.339267, 0, 1, 0.4196078, 1,
-0.3021836, -0.8725228, -2.663476, 0, 1, 0.4235294, 1,
-0.30104, 0.4284386, 0.2446294, 0, 1, 0.4313726, 1,
-0.2992214, -0.004494408, -0.8065017, 0, 1, 0.4352941, 1,
-0.2974947, 0.9574667, 0.1261677, 0, 1, 0.4431373, 1,
-0.2969091, 0.1395734, -1.204312, 0, 1, 0.4470588, 1,
-0.2951085, -0.09854551, -3.629804, 0, 1, 0.454902, 1,
-0.2930683, -0.3418814, -1.71666, 0, 1, 0.4588235, 1,
-0.2871936, -0.113491, -3.747876, 0, 1, 0.4666667, 1,
-0.2855262, 0.5213997, 0.5513951, 0, 1, 0.4705882, 1,
-0.2833542, 0.4886245, -1.176127, 0, 1, 0.4784314, 1,
-0.2813861, 0.08616765, -1.335203, 0, 1, 0.4823529, 1,
-0.28078, -0.8728225, -3.111636, 0, 1, 0.4901961, 1,
-0.2803068, -0.06569647, -2.24078, 0, 1, 0.4941176, 1,
-0.2801411, 1.069951, 0.4967127, 0, 1, 0.5019608, 1,
-0.2742456, -1.413796, -4.048126, 0, 1, 0.509804, 1,
-0.2738587, 1.265018, -1.810712, 0, 1, 0.5137255, 1,
-0.2724177, -0.3954152, -1.807182, 0, 1, 0.5215687, 1,
-0.271271, 0.3952763, 0.4222209, 0, 1, 0.5254902, 1,
-0.2633515, -2.007957, -1.543556, 0, 1, 0.5333334, 1,
-0.2622125, -1.598253, -3.63715, 0, 1, 0.5372549, 1,
-0.2591946, -0.9156017, -3.425253, 0, 1, 0.5450981, 1,
-0.2538819, -1.279164, -2.51413, 0, 1, 0.5490196, 1,
-0.2502309, 1.085808, 1.534757, 0, 1, 0.5568628, 1,
-0.2493727, -0.2961078, -3.403441, 0, 1, 0.5607843, 1,
-0.2493546, -1.426575, -2.703639, 0, 1, 0.5686275, 1,
-0.2419991, -0.5264251, -2.830091, 0, 1, 0.572549, 1,
-0.2414315, 0.1044743, 0.3335056, 0, 1, 0.5803922, 1,
-0.2393913, 0.6571926, -1.020356, 0, 1, 0.5843138, 1,
-0.235236, 0.9706828, -1.716921, 0, 1, 0.5921569, 1,
-0.2344708, -1.484505, -4.990819, 0, 1, 0.5960785, 1,
-0.2296108, -0.01352083, -0.7802569, 0, 1, 0.6039216, 1,
-0.2273472, -0.6538163, -2.630248, 0, 1, 0.6117647, 1,
-0.2272706, 0.6649495, 0.1872951, 0, 1, 0.6156863, 1,
-0.2247453, -0.8112839, -4.289562, 0, 1, 0.6235294, 1,
-0.2191306, -0.5321098, -0.4172517, 0, 1, 0.627451, 1,
-0.2191119, 1.175948, 0.8377486, 0, 1, 0.6352941, 1,
-0.2152878, 0.1381747, -2.351593, 0, 1, 0.6392157, 1,
-0.2139877, -1.747184, -3.391005, 0, 1, 0.6470588, 1,
-0.2106279, -0.8169424, -2.340273, 0, 1, 0.6509804, 1,
-0.207524, -1.588934, -2.204177, 0, 1, 0.6588235, 1,
-0.2070889, -2.148733, -4.355424, 0, 1, 0.6627451, 1,
-0.2063729, -0.5910565, -2.369023, 0, 1, 0.6705883, 1,
-0.2016246, -0.1917571, -3.694301, 0, 1, 0.6745098, 1,
-0.1985466, -1.218073, -2.941705, 0, 1, 0.682353, 1,
-0.1960905, -0.0943979, -3.353819, 0, 1, 0.6862745, 1,
-0.1950004, -0.5670756, -1.458702, 0, 1, 0.6941177, 1,
-0.1940251, -1.756234, -1.808496, 0, 1, 0.7019608, 1,
-0.188583, 0.4337802, -1.829757, 0, 1, 0.7058824, 1,
-0.1870296, -1.648684, -2.590457, 0, 1, 0.7137255, 1,
-0.1850433, -0.2016421, -4.236717, 0, 1, 0.7176471, 1,
-0.1849532, -0.6384775, -1.66863, 0, 1, 0.7254902, 1,
-0.1833541, 0.6578375, 0.1440209, 0, 1, 0.7294118, 1,
-0.1826855, 1.862413, -0.4596895, 0, 1, 0.7372549, 1,
-0.1815287, -0.1270187, -0.5715206, 0, 1, 0.7411765, 1,
-0.1807865, 0.3509808, -1.655546, 0, 1, 0.7490196, 1,
-0.1804926, 0.605092, -0.8957158, 0, 1, 0.7529412, 1,
-0.1787882, 0.6773756, 0.69481, 0, 1, 0.7607843, 1,
-0.178654, -0.6741338, -3.953847, 0, 1, 0.7647059, 1,
-0.1765621, -0.8965037, -2.486934, 0, 1, 0.772549, 1,
-0.1746721, 0.5157976, 0.4798082, 0, 1, 0.7764706, 1,
-0.1722999, -0.2465642, -3.445331, 0, 1, 0.7843137, 1,
-0.1716676, 1.264081, -2.443861, 0, 1, 0.7882353, 1,
-0.1667859, -0.2013859, -1.772186, 0, 1, 0.7960784, 1,
-0.1604148, -2.091249, -4.264355, 0, 1, 0.8039216, 1,
-0.1586473, 0.4740288, 2.913865, 0, 1, 0.8078431, 1,
-0.1524809, -1.598473, -4.545413, 0, 1, 0.8156863, 1,
-0.1519464, 1.029135, -0.431699, 0, 1, 0.8196079, 1,
-0.1475923, 0.3876191, 0.8868415, 0, 1, 0.827451, 1,
-0.1444023, 0.1392836, -1.240892, 0, 1, 0.8313726, 1,
-0.1434342, -0.8244244, -4.830868, 0, 1, 0.8392157, 1,
-0.1433463, -0.9261039, -2.889795, 0, 1, 0.8431373, 1,
-0.1404558, 1.32877, 1.509751, 0, 1, 0.8509804, 1,
-0.1393137, -1.322524, -2.767042, 0, 1, 0.854902, 1,
-0.1387588, 0.006750728, -0.8423885, 0, 1, 0.8627451, 1,
-0.1373455, -0.7282129, -4.118713, 0, 1, 0.8666667, 1,
-0.125457, -0.1831914, -3.644914, 0, 1, 0.8745098, 1,
-0.1249543, 0.34372, -0.388459, 0, 1, 0.8784314, 1,
-0.1223475, -0.5998322, -4.010676, 0, 1, 0.8862745, 1,
-0.1223237, -0.9528764, -1.951217, 0, 1, 0.8901961, 1,
-0.119928, 0.7715912, 0.2114189, 0, 1, 0.8980392, 1,
-0.1193355, 0.6101721, 0.4161266, 0, 1, 0.9058824, 1,
-0.1189041, 0.3701078, -1.326174, 0, 1, 0.9098039, 1,
-0.1180563, -0.4144491, -3.785992, 0, 1, 0.9176471, 1,
-0.1180417, 1.31962, -0.3142147, 0, 1, 0.9215686, 1,
-0.1167548, 0.5827462, -0.3058017, 0, 1, 0.9294118, 1,
-0.1153863, 0.609219, -0.1359306, 0, 1, 0.9333333, 1,
-0.1145772, 0.5961301, -0.9843499, 0, 1, 0.9411765, 1,
-0.0974551, -1.215506, -3.895251, 0, 1, 0.945098, 1,
-0.08724068, -0.1513404, -0.9112702, 0, 1, 0.9529412, 1,
-0.08704903, -0.7803515, 0.1294353, 0, 1, 0.9568627, 1,
-0.08585904, -0.1089456, -1.321491, 0, 1, 0.9647059, 1,
-0.08219013, 0.2263752, -1.057962, 0, 1, 0.9686275, 1,
-0.07841834, 0.1148197, -1.255523, 0, 1, 0.9764706, 1,
-0.07356698, -0.8539061, -3.523283, 0, 1, 0.9803922, 1,
-0.07119537, -1.302914, -2.824925, 0, 1, 0.9882353, 1,
-0.06721938, -1.357494, -3.306959, 0, 1, 0.9921569, 1,
-0.06317296, -2.689914, -1.453333, 0, 1, 1, 1,
-0.05620252, 0.1105926, -0.935347, 0, 0.9921569, 1, 1,
-0.0558497, 0.02603287, -0.9363682, 0, 0.9882353, 1, 1,
-0.05069737, -0.04717205, -2.533552, 0, 0.9803922, 1, 1,
-0.04980804, 0.3848011, -1.224735, 0, 0.9764706, 1, 1,
-0.04431673, -0.3964878, -1.00574, 0, 0.9686275, 1, 1,
-0.04423358, -0.890843, -3.892051, 0, 0.9647059, 1, 1,
-0.04367838, 0.3547457, -0.5585887, 0, 0.9568627, 1, 1,
-0.04032177, 0.3607988, -0.0734281, 0, 0.9529412, 1, 1,
-0.03941284, -0.07342589, -3.27786, 0, 0.945098, 1, 1,
-0.03913018, -0.2045915, -2.646087, 0, 0.9411765, 1, 1,
-0.03569496, 0.5842133, -1.748547, 0, 0.9333333, 1, 1,
-0.03165488, -1.188834, -4.280725, 0, 0.9294118, 1, 1,
-0.02839111, -2.251768, -3.589202, 0, 0.9215686, 1, 1,
-0.02413145, 1.366605, 0.5282611, 0, 0.9176471, 1, 1,
-0.02267909, -0.2941164, -2.190563, 0, 0.9098039, 1, 1,
-0.0212021, 1.429625, -0.380505, 0, 0.9058824, 1, 1,
-0.02049366, 1.313807, -1.493651, 0, 0.8980392, 1, 1,
-0.01526574, 1.089756, -1.29249, 0, 0.8901961, 1, 1,
-0.01329803, -0.8682432, -3.80284, 0, 0.8862745, 1, 1,
-0.004116672, -0.6650754, -2.042583, 0, 0.8784314, 1, 1,
-0.0008748068, 0.2807149, 0.2177421, 0, 0.8745098, 1, 1,
0.006033679, 0.07205223, -0.7369074, 0, 0.8666667, 1, 1,
0.006853664, -2.674518, 1.940709, 0, 0.8627451, 1, 1,
0.01356884, -0.7306767, 3.45419, 0, 0.854902, 1, 1,
0.01369265, -0.9973396, 2.590293, 0, 0.8509804, 1, 1,
0.01727649, 1.114342, 1.849883, 0, 0.8431373, 1, 1,
0.02393345, 0.5400526, 0.8150661, 0, 0.8392157, 1, 1,
0.02415729, 1.269586, -1.209355, 0, 0.8313726, 1, 1,
0.02585527, 0.9078202, 0.3531532, 0, 0.827451, 1, 1,
0.0266139, 0.7807518, -0.4933031, 0, 0.8196079, 1, 1,
0.03395584, -1.459954, 3.956209, 0, 0.8156863, 1, 1,
0.03517095, 0.2932115, -0.1294899, 0, 0.8078431, 1, 1,
0.04024087, -0.7348465, 3.982715, 0, 0.8039216, 1, 1,
0.04336859, 0.4412988, -0.7515809, 0, 0.7960784, 1, 1,
0.0467507, -0.115779, 0.9164741, 0, 0.7882353, 1, 1,
0.04834957, -1.292678, 2.522712, 0, 0.7843137, 1, 1,
0.05000098, -0.04148486, 2.091731, 0, 0.7764706, 1, 1,
0.05015693, 0.04571217, -0.02546285, 0, 0.772549, 1, 1,
0.05311137, 0.252949, -0.7521955, 0, 0.7647059, 1, 1,
0.05724545, -1.325598, 3.702055, 0, 0.7607843, 1, 1,
0.05953581, -1.011362, 3.746249, 0, 0.7529412, 1, 1,
0.06073927, -0.293701, 2.538296, 0, 0.7490196, 1, 1,
0.06213862, 0.1156071, -0.2400142, 0, 0.7411765, 1, 1,
0.06242728, 0.5238141, 1.220176, 0, 0.7372549, 1, 1,
0.06384908, -1.557461, 4.078311, 0, 0.7294118, 1, 1,
0.0731881, -0.8849508, 4.16263, 0, 0.7254902, 1, 1,
0.08006739, 0.4724602, 0.516345, 0, 0.7176471, 1, 1,
0.08089374, 2.093024, -1.370481, 0, 0.7137255, 1, 1,
0.09145507, 0.7994418, -0.7231222, 0, 0.7058824, 1, 1,
0.09406328, 1.871487, 0.5341795, 0, 0.6980392, 1, 1,
0.09420393, 0.6070306, 0.2439125, 0, 0.6941177, 1, 1,
0.09773292, 0.03038523, 0.3883617, 0, 0.6862745, 1, 1,
0.09839227, -0.03915177, 2.246703, 0, 0.682353, 1, 1,
0.1061418, -0.1640739, 2.381761, 0, 0.6745098, 1, 1,
0.1089413, 0.1860936, 1.217564, 0, 0.6705883, 1, 1,
0.1135499, 1.502427, 1.335334, 0, 0.6627451, 1, 1,
0.1150631, 0.01711497, 1.61176, 0, 0.6588235, 1, 1,
0.1163295, -2.479719, 4.137467, 0, 0.6509804, 1, 1,
0.1198893, -1.039052, 3.429992, 0, 0.6470588, 1, 1,
0.1221292, 1.118325, 0.8243868, 0, 0.6392157, 1, 1,
0.1258156, 0.5916364, -0.3581223, 0, 0.6352941, 1, 1,
0.1258948, 0.7031351, 1.152257, 0, 0.627451, 1, 1,
0.1262374, 0.7002071, -0.776962, 0, 0.6235294, 1, 1,
0.1292937, -0.5729808, 0.5874902, 0, 0.6156863, 1, 1,
0.1296433, -0.7843773, 2.491278, 0, 0.6117647, 1, 1,
0.1345594, -1.224319, 2.974499, 0, 0.6039216, 1, 1,
0.1360992, 1.304132, 2.258626, 0, 0.5960785, 1, 1,
0.1364954, -0.09953599, 2.864863, 0, 0.5921569, 1, 1,
0.1474856, -0.7235274, 0.2642963, 0, 0.5843138, 1, 1,
0.1559866, -1.617815, 2.136666, 0, 0.5803922, 1, 1,
0.1619247, 0.07685248, 0.9077824, 0, 0.572549, 1, 1,
0.1682413, -1.535645, 3.229844, 0, 0.5686275, 1, 1,
0.1691685, -0.8151597, 3.19294, 0, 0.5607843, 1, 1,
0.1790596, 0.8006768, 0.5522224, 0, 0.5568628, 1, 1,
0.1793454, 0.8552043, -0.9445947, 0, 0.5490196, 1, 1,
0.1801114, -0.07587727, 3.663112, 0, 0.5450981, 1, 1,
0.1809079, -0.06657911, 1.382621, 0, 0.5372549, 1, 1,
0.1811455, 0.2773364, -0.7823901, 0, 0.5333334, 1, 1,
0.1812853, 0.8513644, 0.7493366, 0, 0.5254902, 1, 1,
0.1816322, 1.356565, -0.1347932, 0, 0.5215687, 1, 1,
0.182346, 0.8868677, 0.2257009, 0, 0.5137255, 1, 1,
0.185561, 1.084199, 0.985561, 0, 0.509804, 1, 1,
0.1859864, 1.112638, -0.2261571, 0, 0.5019608, 1, 1,
0.1904167, -0.2489459, 2.386569, 0, 0.4941176, 1, 1,
0.1920878, -1.83413, 2.836222, 0, 0.4901961, 1, 1,
0.1969103, -1.200903, 4.672112, 0, 0.4823529, 1, 1,
0.1980353, -1.522529, 3.542561, 0, 0.4784314, 1, 1,
0.1996244, 0.01657252, -0.2821967, 0, 0.4705882, 1, 1,
0.2030095, 0.1528855, 0.1296884, 0, 0.4666667, 1, 1,
0.2041597, -0.9343758, 3.734952, 0, 0.4588235, 1, 1,
0.2109796, -2.526634, 4.008891, 0, 0.454902, 1, 1,
0.2186516, -1.424016, 3.26182, 0, 0.4470588, 1, 1,
0.2189214, 2.083721, 0.659965, 0, 0.4431373, 1, 1,
0.2196663, 0.0966715, 2.816308, 0, 0.4352941, 1, 1,
0.221025, 0.8566542, -0.213685, 0, 0.4313726, 1, 1,
0.2212453, 1.030277, -1.38414, 0, 0.4235294, 1, 1,
0.2216887, 2.007731, -0.02612901, 0, 0.4196078, 1, 1,
0.2240843, -1.350324, 1.871435, 0, 0.4117647, 1, 1,
0.2241643, -1.588004, 2.359596, 0, 0.4078431, 1, 1,
0.227574, 0.07865751, 1.403747, 0, 0.4, 1, 1,
0.2280933, -0.9782169, 1.875635, 0, 0.3921569, 1, 1,
0.2289908, 0.1540528, -0.3455311, 0, 0.3882353, 1, 1,
0.23076, 1.392361, 1.618433, 0, 0.3803922, 1, 1,
0.2361408, -0.1825426, 2.593548, 0, 0.3764706, 1, 1,
0.2375291, -0.7842767, 3.335278, 0, 0.3686275, 1, 1,
0.2392174, -0.7595502, 0.9493567, 0, 0.3647059, 1, 1,
0.2393196, 0.2660596, -1.014947, 0, 0.3568628, 1, 1,
0.2418467, 0.5125592, 1.055129, 0, 0.3529412, 1, 1,
0.2480142, 1.665285, -1.196434, 0, 0.345098, 1, 1,
0.2496742, -0.5319929, 3.104929, 0, 0.3411765, 1, 1,
0.2505313, -1.388128, 4.5418, 0, 0.3333333, 1, 1,
0.2512234, 1.301502, 0.2030709, 0, 0.3294118, 1, 1,
0.2524463, -0.01251196, 2.192838, 0, 0.3215686, 1, 1,
0.2537857, 0.171742, 1.217869, 0, 0.3176471, 1, 1,
0.2556699, 0.4684872, -0.3396804, 0, 0.3098039, 1, 1,
0.2560963, 0.1194409, 0.8425958, 0, 0.3058824, 1, 1,
0.2561434, -0.8304049, 3.457504, 0, 0.2980392, 1, 1,
0.2563846, -0.4921107, 2.44857, 0, 0.2901961, 1, 1,
0.2576684, -1.42721, 5.489785, 0, 0.2862745, 1, 1,
0.2600284, 0.1891347, 2.832474, 0, 0.2784314, 1, 1,
0.2601373, 0.3925871, 0.3566708, 0, 0.2745098, 1, 1,
0.2623047, -0.1017705, 2.318276, 0, 0.2666667, 1, 1,
0.265147, 0.9888398, 0.9990851, 0, 0.2627451, 1, 1,
0.2666445, 0.2169836, 0.7757395, 0, 0.254902, 1, 1,
0.2679746, 0.8916218, -0.03820666, 0, 0.2509804, 1, 1,
0.2681867, 1.193482, 2.424912, 0, 0.2431373, 1, 1,
0.2698683, -0.5438818, 1.6968, 0, 0.2392157, 1, 1,
0.2711511, -0.5515337, 2.889128, 0, 0.2313726, 1, 1,
0.2721818, -2.786653, 2.605418, 0, 0.227451, 1, 1,
0.2804621, -1.476644, 2.893859, 0, 0.2196078, 1, 1,
0.2847583, 0.7932632, 0.09004971, 0, 0.2156863, 1, 1,
0.2911007, 0.2696255, 1.948287, 0, 0.2078431, 1, 1,
0.2953355, -0.01992561, 0.8655174, 0, 0.2039216, 1, 1,
0.2985927, 2.260714, -1.617958, 0, 0.1960784, 1, 1,
0.3072608, -0.1001335, 1.521546, 0, 0.1882353, 1, 1,
0.3073739, 0.04529967, 1.88203, 0, 0.1843137, 1, 1,
0.3092318, -0.7338954, 3.36291, 0, 0.1764706, 1, 1,
0.3132189, 1.368909, 1.418318, 0, 0.172549, 1, 1,
0.3138217, -1.147812, 4.343023, 0, 0.1647059, 1, 1,
0.3191036, 0.333886, 0.9417499, 0, 0.1607843, 1, 1,
0.3204074, -0.3687021, 2.123534, 0, 0.1529412, 1, 1,
0.3226652, -1.709312, 1.885047, 0, 0.1490196, 1, 1,
0.3239011, 0.1340562, 1.503573, 0, 0.1411765, 1, 1,
0.3265984, 0.2952084, 2.877363, 0, 0.1372549, 1, 1,
0.3290454, -0.0270202, 1.976812, 0, 0.1294118, 1, 1,
0.3311728, -0.6404973, 2.200095, 0, 0.1254902, 1, 1,
0.3315754, 1.080741, 0.9547788, 0, 0.1176471, 1, 1,
0.3340476, 0.4586337, 0.2584136, 0, 0.1137255, 1, 1,
0.3353409, -1.771146, 4.8272, 0, 0.1058824, 1, 1,
0.3416574, -0.5031807, 1.345629, 0, 0.09803922, 1, 1,
0.3416725, 0.5311155, -0.2278634, 0, 0.09411765, 1, 1,
0.3430201, -1.856697, 3.376415, 0, 0.08627451, 1, 1,
0.3473998, 1.035315, 2.995154, 0, 0.08235294, 1, 1,
0.3474224, -0.1135694, 1.817926, 0, 0.07450981, 1, 1,
0.3507214, -0.591617, 2.10655, 0, 0.07058824, 1, 1,
0.3534164, 0.2624948, 0.5490981, 0, 0.0627451, 1, 1,
0.3614746, 2.405923, 0.9722682, 0, 0.05882353, 1, 1,
0.365346, -1.618887, 3.468857, 0, 0.05098039, 1, 1,
0.3673129, 0.3347008, 0.6113671, 0, 0.04705882, 1, 1,
0.3693757, -0.03241819, 2.367776, 0, 0.03921569, 1, 1,
0.3700999, 1.343009, 1.021122, 0, 0.03529412, 1, 1,
0.3734604, -0.06389163, 2.523317, 0, 0.02745098, 1, 1,
0.3735323, 0.606516, -0.03405342, 0, 0.02352941, 1, 1,
0.3810684, -0.3083257, 1.681087, 0, 0.01568628, 1, 1,
0.3841842, 0.1295899, 1.543773, 0, 0.01176471, 1, 1,
0.390738, 1.571019, -0.1451742, 0, 0.003921569, 1, 1,
0.39631, 0.7852965, 0.4178717, 0.003921569, 0, 1, 1,
0.396606, -0.3326578, -0.1025114, 0.007843138, 0, 1, 1,
0.3967818, 1.778727, 0.9221362, 0.01568628, 0, 1, 1,
0.3987277, -1.230159, 2.892616, 0.01960784, 0, 1, 1,
0.3997912, -0.0850687, 2.757228, 0.02745098, 0, 1, 1,
0.400071, 1.052951, 0.3800537, 0.03137255, 0, 1, 1,
0.4039729, 1.720951, 0.4022565, 0.03921569, 0, 1, 1,
0.4134164, -1.055209, 3.645349, 0.04313726, 0, 1, 1,
0.4194669, -1.006467, 3.211885, 0.05098039, 0, 1, 1,
0.4271175, 0.5075735, 0.9915642, 0.05490196, 0, 1, 1,
0.4331354, 0.5067256, -0.1116213, 0.0627451, 0, 1, 1,
0.4443851, -0.04321699, 2.073552, 0.06666667, 0, 1, 1,
0.4447397, -1.268157, 2.742731, 0.07450981, 0, 1, 1,
0.4451758, -0.606997, 1.705461, 0.07843138, 0, 1, 1,
0.4475845, 0.4944239, 0.2409421, 0.08627451, 0, 1, 1,
0.4517742, -2.806209, 2.44727, 0.09019608, 0, 1, 1,
0.4539035, -0.4389596, 0.381613, 0.09803922, 0, 1, 1,
0.4560186, 0.4674052, -0.3138108, 0.1058824, 0, 1, 1,
0.459786, 1.855875, -0.9737657, 0.1098039, 0, 1, 1,
0.4645784, 1.809139, 1.2355, 0.1176471, 0, 1, 1,
0.4729609, -0.5080783, 2.656303, 0.1215686, 0, 1, 1,
0.4730472, 0.06536657, 0.7671331, 0.1294118, 0, 1, 1,
0.4737336, -0.7256379, 1.322008, 0.1333333, 0, 1, 1,
0.4754224, -0.8849291, 3.939458, 0.1411765, 0, 1, 1,
0.4790509, 1.493769, 1.239974, 0.145098, 0, 1, 1,
0.4839597, 1.079355, 0.5927109, 0.1529412, 0, 1, 1,
0.4975747, -0.5079517, 2.138277, 0.1568628, 0, 1, 1,
0.4999346, -0.4552468, 2.974247, 0.1647059, 0, 1, 1,
0.5007273, -0.4829379, 2.945773, 0.1686275, 0, 1, 1,
0.5031096, 0.29428, 0.4415394, 0.1764706, 0, 1, 1,
0.5070758, 0.2390728, 0.9755934, 0.1803922, 0, 1, 1,
0.5182499, -0.4641813, 2.754519, 0.1882353, 0, 1, 1,
0.5192882, -0.2349797, -0.2724663, 0.1921569, 0, 1, 1,
0.5196795, 0.2499944, 2.576653, 0.2, 0, 1, 1,
0.520063, 2.525443, 0.218176, 0.2078431, 0, 1, 1,
0.522225, -0.219731, 1.730874, 0.2117647, 0, 1, 1,
0.5234717, -1.164687, 1.025229, 0.2196078, 0, 1, 1,
0.5260156, -0.07120536, 3.279406, 0.2235294, 0, 1, 1,
0.5334261, 1.250944, 1.480074, 0.2313726, 0, 1, 1,
0.5392626, -0.8347859, 2.476401, 0.2352941, 0, 1, 1,
0.5394549, -0.2973744, 2.831302, 0.2431373, 0, 1, 1,
0.541891, -0.01046107, -0.8248739, 0.2470588, 0, 1, 1,
0.5432991, 0.8519353, 1.485623, 0.254902, 0, 1, 1,
0.5433357, -0.1533846, 1.384281, 0.2588235, 0, 1, 1,
0.5441287, 0.2179799, 2.487384, 0.2666667, 0, 1, 1,
0.5463547, -0.3454486, -0.04091043, 0.2705882, 0, 1, 1,
0.5481802, -0.8637113, 3.076528, 0.2784314, 0, 1, 1,
0.5483789, -0.3613422, 2.275264, 0.282353, 0, 1, 1,
0.5491862, 0.6127745, 0.2630325, 0.2901961, 0, 1, 1,
0.5500941, -0.5404744, 2.405284, 0.2941177, 0, 1, 1,
0.5503476, -0.2029554, 2.436927, 0.3019608, 0, 1, 1,
0.5527567, 0.5853332, 0.4622908, 0.3098039, 0, 1, 1,
0.554939, -1.181834, 3.668487, 0.3137255, 0, 1, 1,
0.5568656, -0.646163, 2.582307, 0.3215686, 0, 1, 1,
0.5671314, -1.252428, 1.519109, 0.3254902, 0, 1, 1,
0.5737686, 1.210161, 0.3913302, 0.3333333, 0, 1, 1,
0.5750923, 1.004512, 1.810867, 0.3372549, 0, 1, 1,
0.5751296, -0.2689129, 2.700034, 0.345098, 0, 1, 1,
0.5814881, 1.130007, 1.834476, 0.3490196, 0, 1, 1,
0.5851607, -0.4154796, 1.702815, 0.3568628, 0, 1, 1,
0.5877345, 2.689674, 1.77062, 0.3607843, 0, 1, 1,
0.5916129, -1.511673, 1.447715, 0.3686275, 0, 1, 1,
0.5987608, -0.5748023, 3.531413, 0.372549, 0, 1, 1,
0.5998499, -0.8945611, 3.466418, 0.3803922, 0, 1, 1,
0.6015495, -0.01317392, 2.787999, 0.3843137, 0, 1, 1,
0.601638, 0.163377, 2.786763, 0.3921569, 0, 1, 1,
0.60264, -0.3618123, -0.08538354, 0.3960784, 0, 1, 1,
0.6064848, -1.507968, 1.853245, 0.4039216, 0, 1, 1,
0.6115003, -1.207661, 2.888022, 0.4117647, 0, 1, 1,
0.6144298, 0.7524962, 1.081451, 0.4156863, 0, 1, 1,
0.6150436, 0.7330784, 0.7470921, 0.4235294, 0, 1, 1,
0.6153287, 1.162079, 1.959782, 0.427451, 0, 1, 1,
0.6153865, 0.7484254, -0.5362667, 0.4352941, 0, 1, 1,
0.6181178, 0.5561222, -0.02520535, 0.4392157, 0, 1, 1,
0.6288208, 0.3576885, 2.5905, 0.4470588, 0, 1, 1,
0.6298375, -1.615508, 2.063964, 0.4509804, 0, 1, 1,
0.6319182, -0.3262161, 0.6164501, 0.4588235, 0, 1, 1,
0.6354005, 0.8728001, 1.710198, 0.4627451, 0, 1, 1,
0.6379061, -1.901273, 1.398302, 0.4705882, 0, 1, 1,
0.6381255, 0.02237802, 1.572762, 0.4745098, 0, 1, 1,
0.6409567, 2.009875, 0.2194731, 0.4823529, 0, 1, 1,
0.646171, 1.316858, -0.1801249, 0.4862745, 0, 1, 1,
0.6503524, -0.7645646, 3.362221, 0.4941176, 0, 1, 1,
0.6561201, -0.4349325, 1.079486, 0.5019608, 0, 1, 1,
0.6646299, 0.649715, 2.329829, 0.5058824, 0, 1, 1,
0.6689647, 0.3838198, 0.9240518, 0.5137255, 0, 1, 1,
0.6707888, -1.663928, 3.806213, 0.5176471, 0, 1, 1,
0.6720052, 0.6260788, 0.8632216, 0.5254902, 0, 1, 1,
0.6765866, 0.4709454, 1.371335, 0.5294118, 0, 1, 1,
0.677431, 1.487052, 0.3527587, 0.5372549, 0, 1, 1,
0.6775425, -0.2153484, 2.567705, 0.5411765, 0, 1, 1,
0.677588, 0.5024562, 1.627337, 0.5490196, 0, 1, 1,
0.6782573, 0.4196207, 1.322648, 0.5529412, 0, 1, 1,
0.6910347, 0.8329125, 2.924742, 0.5607843, 0, 1, 1,
0.6937672, 0.141213, -0.6617178, 0.5647059, 0, 1, 1,
0.6939214, 2.438731, 2.597301, 0.572549, 0, 1, 1,
0.6940837, 0.8836614, -0.2313352, 0.5764706, 0, 1, 1,
0.6972043, 2.461164, 0.1393554, 0.5843138, 0, 1, 1,
0.700575, 0.1949489, 1.687111, 0.5882353, 0, 1, 1,
0.7013521, 0.3757748, 2.060148, 0.5960785, 0, 1, 1,
0.7034352, -0.3671636, 2.869883, 0.6039216, 0, 1, 1,
0.7074543, -0.703089, 2.606516, 0.6078432, 0, 1, 1,
0.7084795, 1.204185, -0.06721292, 0.6156863, 0, 1, 1,
0.7087464, 1.073452, 1.496616, 0.6196079, 0, 1, 1,
0.7096959, -1.944365, 1.221325, 0.627451, 0, 1, 1,
0.7100058, 2.138885, -0.7997947, 0.6313726, 0, 1, 1,
0.7115794, -2.016015, 1.631396, 0.6392157, 0, 1, 1,
0.7176169, -1.595399, 1.699705, 0.6431373, 0, 1, 1,
0.7185324, 1.526477, -0.01739092, 0.6509804, 0, 1, 1,
0.7237376, -0.5783148, 2.252742, 0.654902, 0, 1, 1,
0.7338874, 1.335841, 1.561809, 0.6627451, 0, 1, 1,
0.7400532, 1.210086, 1.478466, 0.6666667, 0, 1, 1,
0.7415658, 1.040633, -0.3254426, 0.6745098, 0, 1, 1,
0.7452617, -2.029408, 3.712924, 0.6784314, 0, 1, 1,
0.7453156, -1.109278, 1.138679, 0.6862745, 0, 1, 1,
0.7476215, -0.3127981, 2.177211, 0.6901961, 0, 1, 1,
0.7496573, -2.54574, 2.395836, 0.6980392, 0, 1, 1,
0.7604955, -2.901593, 3.380677, 0.7058824, 0, 1, 1,
0.7605101, 0.8719341, 1.351569, 0.7098039, 0, 1, 1,
0.7648699, 2.244003, -0.8981526, 0.7176471, 0, 1, 1,
0.7656743, -0.06789741, 1.871023, 0.7215686, 0, 1, 1,
0.7667859, 1.046385, 1.375753, 0.7294118, 0, 1, 1,
0.7677783, 0.2702717, 1.119548, 0.7333333, 0, 1, 1,
0.7731172, 0.7031754, 1.05487, 0.7411765, 0, 1, 1,
0.7738863, 0.331615, 2.491462, 0.7450981, 0, 1, 1,
0.7777045, 0.312881, 3.092063, 0.7529412, 0, 1, 1,
0.7801446, -0.8180652, -0.001516847, 0.7568628, 0, 1, 1,
0.7843879, 0.8237122, 1.513206, 0.7647059, 0, 1, 1,
0.7863209, -0.8208563, 3.788665, 0.7686275, 0, 1, 1,
0.7886935, -0.6949857, 2.125743, 0.7764706, 0, 1, 1,
0.7918383, 0.5534896, 0.1726384, 0.7803922, 0, 1, 1,
0.7994623, -0.8426756, 1.360451, 0.7882353, 0, 1, 1,
0.8010167, -0.9308617, 2.512849, 0.7921569, 0, 1, 1,
0.8023759, -1.022349, 0.7569643, 0.8, 0, 1, 1,
0.8034974, 0.2310995, 0.7079532, 0.8078431, 0, 1, 1,
0.8064597, 0.730764, 0.4286081, 0.8117647, 0, 1, 1,
0.8071051, 0.0009820198, 2.591465, 0.8196079, 0, 1, 1,
0.8112392, 0.6925262, 1.989564, 0.8235294, 0, 1, 1,
0.8116066, 0.5937948, 0.7151397, 0.8313726, 0, 1, 1,
0.8116845, 1.358074, 2.034261, 0.8352941, 0, 1, 1,
0.8146514, -0.7616473, 2.056139, 0.8431373, 0, 1, 1,
0.8152938, -0.3002579, 1.703685, 0.8470588, 0, 1, 1,
0.8158459, -0.3095409, 1.587417, 0.854902, 0, 1, 1,
0.8199805, 0.0269092, 2.305635, 0.8588235, 0, 1, 1,
0.8213372, 0.7672307, 0.4654567, 0.8666667, 0, 1, 1,
0.8221133, 0.949324, 1.799313, 0.8705882, 0, 1, 1,
0.8240861, 1.034962, 1.365557, 0.8784314, 0, 1, 1,
0.827265, 0.2673583, 0.7832323, 0.8823529, 0, 1, 1,
0.8338585, 2.474372, 0.885864, 0.8901961, 0, 1, 1,
0.8357823, -0.9990798, 1.724307, 0.8941177, 0, 1, 1,
0.8398685, 0.5765487, -0.2006444, 0.9019608, 0, 1, 1,
0.8401563, 0.3126132, 1.670539, 0.9098039, 0, 1, 1,
0.8489211, 0.06239414, 1.993333, 0.9137255, 0, 1, 1,
0.859087, 1.225862, 0.5784903, 0.9215686, 0, 1, 1,
0.8617932, 0.6330129, 0.2988079, 0.9254902, 0, 1, 1,
0.8648628, 1.640051, 0.4658951, 0.9333333, 0, 1, 1,
0.869396, -0.415267, 2.90116, 0.9372549, 0, 1, 1,
0.8770689, 0.2670652, 2.963457, 0.945098, 0, 1, 1,
0.8782433, 0.1551756, 0.8940656, 0.9490196, 0, 1, 1,
0.8915453, -0.03960209, 1.87098, 0.9568627, 0, 1, 1,
0.8981481, -0.5903652, 2.631207, 0.9607843, 0, 1, 1,
0.8988757, 1.169851, 0.897173, 0.9686275, 0, 1, 1,
0.8999456, -0.1192791, 0.6010953, 0.972549, 0, 1, 1,
0.9072564, 1.118286, 1.88496, 0.9803922, 0, 1, 1,
0.9138106, -0.5899378, -0.05271796, 0.9843137, 0, 1, 1,
0.92761, 0.07018753, 2.029937, 0.9921569, 0, 1, 1,
0.9279816, 1.207003, 2.160083, 0.9960784, 0, 1, 1,
0.9292529, -0.1493837, 0.7036183, 1, 0, 0.9960784, 1,
0.9342648, -0.5759056, 2.194739, 1, 0, 0.9882353, 1,
0.9410169, -0.6223811, 3.416548, 1, 0, 0.9843137, 1,
0.9415421, 0.6680486, 0.7609998, 1, 0, 0.9764706, 1,
0.9458994, -0.9766461, 2.613704, 1, 0, 0.972549, 1,
0.9493086, -0.1253608, 0.5672441, 1, 0, 0.9647059, 1,
0.950469, -0.07299998, 2.601427, 1, 0, 0.9607843, 1,
0.9534983, -0.2422877, 1.608975, 1, 0, 0.9529412, 1,
0.9628991, -0.3019559, 2.470394, 1, 0, 0.9490196, 1,
0.9642337, -0.1304394, 0.6631603, 1, 0, 0.9411765, 1,
0.9733381, -0.7354871, 1.799549, 1, 0, 0.9372549, 1,
0.9768903, -1.738157, 1.835129, 1, 0, 0.9294118, 1,
0.9891423, -0.9520882, 1.197819, 1, 0, 0.9254902, 1,
0.9894999, 1.421131, 1.410995, 1, 0, 0.9176471, 1,
0.9903, 0.2963436, 2.692745, 1, 0, 0.9137255, 1,
1.002526, -2.166324, 2.905219, 1, 0, 0.9058824, 1,
1.017315, -0.9896014, 2.959124, 1, 0, 0.9019608, 1,
1.018045, 0.4490245, 2.957787, 1, 0, 0.8941177, 1,
1.023814, -0.546194, 2.328975, 1, 0, 0.8862745, 1,
1.030263, 0.6910092, -0.6581504, 1, 0, 0.8823529, 1,
1.033722, -2.453276, 3.562743, 1, 0, 0.8745098, 1,
1.04003, -1.954013, 2.261994, 1, 0, 0.8705882, 1,
1.042176, -1.230504, 3.738387, 1, 0, 0.8627451, 1,
1.044588, 0.5704553, 2.044902, 1, 0, 0.8588235, 1,
1.045882, 0.04510901, 1.693894, 1, 0, 0.8509804, 1,
1.058815, 0.01682289, 2.250953, 1, 0, 0.8470588, 1,
1.06096, 2.022825, 0.7240793, 1, 0, 0.8392157, 1,
1.061708, 0.2374259, 0.7243137, 1, 0, 0.8352941, 1,
1.064386, 0.8599615, 0.8289272, 1, 0, 0.827451, 1,
1.07632, 0.3870377, 1.000919, 1, 0, 0.8235294, 1,
1.077235, -0.5223224, 2.128575, 1, 0, 0.8156863, 1,
1.085697, -0.9351667, 3.936647, 1, 0, 0.8117647, 1,
1.087281, 0.6073607, -0.700788, 1, 0, 0.8039216, 1,
1.101879, -1.697091, 3.252197, 1, 0, 0.7960784, 1,
1.102169, -0.2026119, 2.466057, 1, 0, 0.7921569, 1,
1.102602, -0.02274233, 1.118888, 1, 0, 0.7843137, 1,
1.112089, 0.7693112, 0.8053293, 1, 0, 0.7803922, 1,
1.113348, 0.07422777, 0.8325932, 1, 0, 0.772549, 1,
1.118634, 1.002694, 1.148777, 1, 0, 0.7686275, 1,
1.119103, -0.180654, 2.174476, 1, 0, 0.7607843, 1,
1.12292, 0.5320369, 1.60087, 1, 0, 0.7568628, 1,
1.125176, 0.8044332, 0.693732, 1, 0, 0.7490196, 1,
1.126871, -0.2232049, 0.8710557, 1, 0, 0.7450981, 1,
1.131427, 0.6778013, 1.272318, 1, 0, 0.7372549, 1,
1.13171, -1.801955, 2.200145, 1, 0, 0.7333333, 1,
1.137385, -0.9049617, 2.885986, 1, 0, 0.7254902, 1,
1.137584, 1.151795, 1.347973, 1, 0, 0.7215686, 1,
1.141225, -0.2044569, 4.371958, 1, 0, 0.7137255, 1,
1.151428, -1.005136, 1.885279, 1, 0, 0.7098039, 1,
1.154308, 1.034813, 0.3573914, 1, 0, 0.7019608, 1,
1.157506, 0.8842787, 0.2422884, 1, 0, 0.6941177, 1,
1.170712, 0.1553339, 0.626813, 1, 0, 0.6901961, 1,
1.173666, -0.1757268, 2.711112, 1, 0, 0.682353, 1,
1.176359, -1.703595, 2.505028, 1, 0, 0.6784314, 1,
1.176591, -0.1084926, 1.661222, 1, 0, 0.6705883, 1,
1.191144, 1.027342, 0.5720997, 1, 0, 0.6666667, 1,
1.191341, 2.063303, 0.5060123, 1, 0, 0.6588235, 1,
1.199033, 2.173184, 1.208797, 1, 0, 0.654902, 1,
1.201447, -1.327619, 4.477285, 1, 0, 0.6470588, 1,
1.205548, -0.7429242, 2.344811, 1, 0, 0.6431373, 1,
1.207733, -1.011562, 2.3295, 1, 0, 0.6352941, 1,
1.210864, 1.088725, 1.22683, 1, 0, 0.6313726, 1,
1.219285, 0.1706742, 1.565606, 1, 0, 0.6235294, 1,
1.219694, -1.098921, 1.693298, 1, 0, 0.6196079, 1,
1.220302, -0.1662913, 1.113449, 1, 0, 0.6117647, 1,
1.220923, 1.066843, 0.1481565, 1, 0, 0.6078432, 1,
1.222392, -1.669609, 2.522557, 1, 0, 0.6, 1,
1.228922, -1.00108, 2.461218, 1, 0, 0.5921569, 1,
1.229713, 0.1745228, -0.3648891, 1, 0, 0.5882353, 1,
1.230974, -0.2105903, 1.941887, 1, 0, 0.5803922, 1,
1.237917, -0.9354578, 3.363001, 1, 0, 0.5764706, 1,
1.250869, -1.403413, 1.408371, 1, 0, 0.5686275, 1,
1.261309, 1.202341, 1.151158, 1, 0, 0.5647059, 1,
1.277857, -1.830181, 2.93864, 1, 0, 0.5568628, 1,
1.278319, -0.2550251, 2.591772, 1, 0, 0.5529412, 1,
1.281192, -0.5836002, 2.113427, 1, 0, 0.5450981, 1,
1.285912, -2.557185, 1.701139, 1, 0, 0.5411765, 1,
1.286954, -0.7007235, 2.282337, 1, 0, 0.5333334, 1,
1.300739, 1.468631, 1.83882, 1, 0, 0.5294118, 1,
1.302472, -0.05040402, 1.169625, 1, 0, 0.5215687, 1,
1.308548, 0.6088403, 1.634935, 1, 0, 0.5176471, 1,
1.310324, 1.034385, 0.9231874, 1, 0, 0.509804, 1,
1.326137, 0.40315, 1.602878, 1, 0, 0.5058824, 1,
1.338671, -0.175317, 1.663019, 1, 0, 0.4980392, 1,
1.342028, -0.3873142, 1.985827, 1, 0, 0.4901961, 1,
1.343808, -0.1212915, 2.55968, 1, 0, 0.4862745, 1,
1.354258, 1.16618, 1.81749, 1, 0, 0.4784314, 1,
1.354669, -0.2347028, 0.7056205, 1, 0, 0.4745098, 1,
1.356077, -1.30447, 1.987875, 1, 0, 0.4666667, 1,
1.357059, 1.250534, 1.357929, 1, 0, 0.4627451, 1,
1.358387, -0.1457019, 1.832466, 1, 0, 0.454902, 1,
1.360817, -1.834112, 2.927711, 1, 0, 0.4509804, 1,
1.361414, -0.212119, 2.518247, 1, 0, 0.4431373, 1,
1.362338, -0.3917069, 1.793719, 1, 0, 0.4392157, 1,
1.381798, -0.4003799, 1.228944, 1, 0, 0.4313726, 1,
1.401097, 2.329005, 1.823205, 1, 0, 0.427451, 1,
1.419991, -0.1105545, 1.247478, 1, 0, 0.4196078, 1,
1.4224, 0.6666545, 0.9772412, 1, 0, 0.4156863, 1,
1.42405, 0.3201219, -0.5310884, 1, 0, 0.4078431, 1,
1.426345, 0.1142306, -0.33711, 1, 0, 0.4039216, 1,
1.426707, -0.02292463, 1.517728, 1, 0, 0.3960784, 1,
1.460673, -0.7321035, 1.173854, 1, 0, 0.3882353, 1,
1.480661, -1.495297, 1.788004, 1, 0, 0.3843137, 1,
1.481708, 0.27937, 0.29921, 1, 0, 0.3764706, 1,
1.48852, -0.5978981, 1.710319, 1, 0, 0.372549, 1,
1.488873, 1.229949, 0.6059567, 1, 0, 0.3647059, 1,
1.498172, -0.6054918, 0.8478786, 1, 0, 0.3607843, 1,
1.503304, 0.2798547, 2.525318, 1, 0, 0.3529412, 1,
1.509023, -1.659275, 3.396341, 1, 0, 0.3490196, 1,
1.509091, -0.3346156, 2.569816, 1, 0, 0.3411765, 1,
1.51743, 0.1048278, 3.124156, 1, 0, 0.3372549, 1,
1.525596, -0.540159, -0.2178404, 1, 0, 0.3294118, 1,
1.544404, -0.2696291, 1.195202, 1, 0, 0.3254902, 1,
1.55118, 1.336202, -1.441978, 1, 0, 0.3176471, 1,
1.558292, 1.46932, -0.589353, 1, 0, 0.3137255, 1,
1.566189, -0.7122131, 2.627836, 1, 0, 0.3058824, 1,
1.567974, 0.5379707, 2.08687, 1, 0, 0.2980392, 1,
1.603027, -0.7199665, 1.126466, 1, 0, 0.2941177, 1,
1.603809, -0.4764352, 1.58998, 1, 0, 0.2862745, 1,
1.616037, 0.4566657, 1.202338, 1, 0, 0.282353, 1,
1.655348, 0.1818953, -0.3985903, 1, 0, 0.2745098, 1,
1.656162, -0.01063116, 1.782809, 1, 0, 0.2705882, 1,
1.664371, -2.113528, 2.519129, 1, 0, 0.2627451, 1,
1.718416, -0.5236531, 3.862684, 1, 0, 0.2588235, 1,
1.763871, 0.3023838, 1.444469, 1, 0, 0.2509804, 1,
1.767815, -0.09939298, 1.144853, 1, 0, 0.2470588, 1,
1.802907, 0.005832123, 1.122955, 1, 0, 0.2392157, 1,
1.810569, 1.338764, -0.1853306, 1, 0, 0.2352941, 1,
1.815096, -1.078661, 1.946766, 1, 0, 0.227451, 1,
1.820821, 1.245919, 0.4847912, 1, 0, 0.2235294, 1,
1.829439, -2.057391, 3.997396, 1, 0, 0.2156863, 1,
1.831106, 0.252028, 1.535388, 1, 0, 0.2117647, 1,
1.852911, -0.1441117, 1.493343, 1, 0, 0.2039216, 1,
1.855209, -0.798799, 1.551363, 1, 0, 0.1960784, 1,
1.858184, 0.7491008, 0.6118868, 1, 0, 0.1921569, 1,
1.89753, 0.9233918, -0.1141908, 1, 0, 0.1843137, 1,
1.902782, 0.433886, -0.03433385, 1, 0, 0.1803922, 1,
1.905462, 1.132758, -0.4743151, 1, 0, 0.172549, 1,
1.906116, 1.187755, -0.3683791, 1, 0, 0.1686275, 1,
1.952146, -1.27916, 3.835528, 1, 0, 0.1607843, 1,
1.962865, 0.5502456, 0.6780217, 1, 0, 0.1568628, 1,
1.983539, -3.035424, 2.369026, 1, 0, 0.1490196, 1,
1.997963, -0.8221226, 1.397703, 1, 0, 0.145098, 1,
2.000956, 0.6278538, 2.622553, 1, 0, 0.1372549, 1,
2.003506, -1.286473, -0.2102858, 1, 0, 0.1333333, 1,
2.023737, -1.144382, 2.424795, 1, 0, 0.1254902, 1,
2.025517, 0.08370028, 2.933715, 1, 0, 0.1215686, 1,
2.043774, 0.6074392, 2.290734, 1, 0, 0.1137255, 1,
2.106421, 0.5380868, 0.5520217, 1, 0, 0.1098039, 1,
2.108117, 0.4064418, 1.388745, 1, 0, 0.1019608, 1,
2.111013, -1.605037, 1.298198, 1, 0, 0.09411765, 1,
2.120567, 0.8409615, 1.298625, 1, 0, 0.09019608, 1,
2.13713, -2.283555, 2.988661, 1, 0, 0.08235294, 1,
2.137951, -1.34586, 1.801977, 1, 0, 0.07843138, 1,
2.158609, 2.378867, 1.28754, 1, 0, 0.07058824, 1,
2.171479, 0.03809186, 2.262665, 1, 0, 0.06666667, 1,
2.257046, -1.840909, 2.438982, 1, 0, 0.05882353, 1,
2.338802, -0.07176599, 2.234144, 1, 0, 0.05490196, 1,
2.344984, 0.9596663, 2.327078, 1, 0, 0.04705882, 1,
2.459546, 1.244476, 2.904517, 1, 0, 0.04313726, 1,
2.492633, -0.5816227, 1.625267, 1, 0, 0.03529412, 1,
2.541733, 0.02947648, 1.106473, 1, 0, 0.03137255, 1,
2.546518, -0.1579019, 2.47684, 1, 0, 0.02352941, 1,
2.587545, 0.6748801, -0.6304388, 1, 0, 0.01960784, 1,
2.749542, 0.1153298, 0.6847586, 1, 0, 0.01176471, 1,
2.750292, -0.8467932, 1.453141, 1, 0, 0.007843138, 1
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
-0.2933849, -4.021927, -6.924782, 0, -0.5, 0.5, 0.5,
-0.2933849, -4.021927, -6.924782, 1, -0.5, 0.5, 0.5,
-0.2933849, -4.021927, -6.924782, 1, 1.5, 0.5, 0.5,
-0.2933849, -4.021927, -6.924782, 0, 1.5, 0.5, 0.5
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
-4.368869, -0.1253859, -6.924782, 0, -0.5, 0.5, 0.5,
-4.368869, -0.1253859, -6.924782, 1, -0.5, 0.5, 0.5,
-4.368869, -0.1253859, -6.924782, 1, 1.5, 0.5, 0.5,
-4.368869, -0.1253859, -6.924782, 0, 1.5, 0.5, 0.5
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
-4.368869, -4.021927, 0.1821463, 0, -0.5, 0.5, 0.5,
-4.368869, -4.021927, 0.1821463, 1, -0.5, 0.5, 0.5,
-4.368869, -4.021927, 0.1821463, 1, 1.5, 0.5, 0.5,
-4.368869, -4.021927, 0.1821463, 0, 1.5, 0.5, 0.5
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
-3, -3.122725, -5.284722,
2, -3.122725, -5.284722,
-3, -3.122725, -5.284722,
-3, -3.272592, -5.558065,
-2, -3.122725, -5.284722,
-2, -3.272592, -5.558065,
-1, -3.122725, -5.284722,
-1, -3.272592, -5.558065,
0, -3.122725, -5.284722,
0, -3.272592, -5.558065,
1, -3.122725, -5.284722,
1, -3.272592, -5.558065,
2, -3.122725, -5.284722,
2, -3.272592, -5.558065
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
-3, -3.572326, -6.104752, 0, -0.5, 0.5, 0.5,
-3, -3.572326, -6.104752, 1, -0.5, 0.5, 0.5,
-3, -3.572326, -6.104752, 1, 1.5, 0.5, 0.5,
-3, -3.572326, -6.104752, 0, 1.5, 0.5, 0.5,
-2, -3.572326, -6.104752, 0, -0.5, 0.5, 0.5,
-2, -3.572326, -6.104752, 1, -0.5, 0.5, 0.5,
-2, -3.572326, -6.104752, 1, 1.5, 0.5, 0.5,
-2, -3.572326, -6.104752, 0, 1.5, 0.5, 0.5,
-1, -3.572326, -6.104752, 0, -0.5, 0.5, 0.5,
-1, -3.572326, -6.104752, 1, -0.5, 0.5, 0.5,
-1, -3.572326, -6.104752, 1, 1.5, 0.5, 0.5,
-1, -3.572326, -6.104752, 0, 1.5, 0.5, 0.5,
0, -3.572326, -6.104752, 0, -0.5, 0.5, 0.5,
0, -3.572326, -6.104752, 1, -0.5, 0.5, 0.5,
0, -3.572326, -6.104752, 1, 1.5, 0.5, 0.5,
0, -3.572326, -6.104752, 0, 1.5, 0.5, 0.5,
1, -3.572326, -6.104752, 0, -0.5, 0.5, 0.5,
1, -3.572326, -6.104752, 1, -0.5, 0.5, 0.5,
1, -3.572326, -6.104752, 1, 1.5, 0.5, 0.5,
1, -3.572326, -6.104752, 0, 1.5, 0.5, 0.5,
2, -3.572326, -6.104752, 0, -0.5, 0.5, 0.5,
2, -3.572326, -6.104752, 1, -0.5, 0.5, 0.5,
2, -3.572326, -6.104752, 1, 1.5, 0.5, 0.5,
2, -3.572326, -6.104752, 0, 1.5, 0.5, 0.5
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
-3.428372, -3, -5.284722,
-3.428372, 2, -5.284722,
-3.428372, -3, -5.284722,
-3.585122, -3, -5.558065,
-3.428372, -2, -5.284722,
-3.585122, -2, -5.558065,
-3.428372, -1, -5.284722,
-3.585122, -1, -5.558065,
-3.428372, 0, -5.284722,
-3.585122, 0, -5.558065,
-3.428372, 1, -5.284722,
-3.585122, 1, -5.558065,
-3.428372, 2, -5.284722,
-3.585122, 2, -5.558065
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
-3.898621, -3, -6.104752, 0, -0.5, 0.5, 0.5,
-3.898621, -3, -6.104752, 1, -0.5, 0.5, 0.5,
-3.898621, -3, -6.104752, 1, 1.5, 0.5, 0.5,
-3.898621, -3, -6.104752, 0, 1.5, 0.5, 0.5,
-3.898621, -2, -6.104752, 0, -0.5, 0.5, 0.5,
-3.898621, -2, -6.104752, 1, -0.5, 0.5, 0.5,
-3.898621, -2, -6.104752, 1, 1.5, 0.5, 0.5,
-3.898621, -2, -6.104752, 0, 1.5, 0.5, 0.5,
-3.898621, -1, -6.104752, 0, -0.5, 0.5, 0.5,
-3.898621, -1, -6.104752, 1, -0.5, 0.5, 0.5,
-3.898621, -1, -6.104752, 1, 1.5, 0.5, 0.5,
-3.898621, -1, -6.104752, 0, 1.5, 0.5, 0.5,
-3.898621, 0, -6.104752, 0, -0.5, 0.5, 0.5,
-3.898621, 0, -6.104752, 1, -0.5, 0.5, 0.5,
-3.898621, 0, -6.104752, 1, 1.5, 0.5, 0.5,
-3.898621, 0, -6.104752, 0, 1.5, 0.5, 0.5,
-3.898621, 1, -6.104752, 0, -0.5, 0.5, 0.5,
-3.898621, 1, -6.104752, 1, -0.5, 0.5, 0.5,
-3.898621, 1, -6.104752, 1, 1.5, 0.5, 0.5,
-3.898621, 1, -6.104752, 0, 1.5, 0.5, 0.5,
-3.898621, 2, -6.104752, 0, -0.5, 0.5, 0.5,
-3.898621, 2, -6.104752, 1, -0.5, 0.5, 0.5,
-3.898621, 2, -6.104752, 1, 1.5, 0.5, 0.5,
-3.898621, 2, -6.104752, 0, 1.5, 0.5, 0.5
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
-3.428372, -3.122725, -4,
-3.428372, -3.122725, 4,
-3.428372, -3.122725, -4,
-3.585122, -3.272592, -4,
-3.428372, -3.122725, -2,
-3.585122, -3.272592, -2,
-3.428372, -3.122725, 0,
-3.585122, -3.272592, 0,
-3.428372, -3.122725, 2,
-3.585122, -3.272592, 2,
-3.428372, -3.122725, 4,
-3.585122, -3.272592, 4
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
-3.898621, -3.572326, -4, 0, -0.5, 0.5, 0.5,
-3.898621, -3.572326, -4, 1, -0.5, 0.5, 0.5,
-3.898621, -3.572326, -4, 1, 1.5, 0.5, 0.5,
-3.898621, -3.572326, -4, 0, 1.5, 0.5, 0.5,
-3.898621, -3.572326, -2, 0, -0.5, 0.5, 0.5,
-3.898621, -3.572326, -2, 1, -0.5, 0.5, 0.5,
-3.898621, -3.572326, -2, 1, 1.5, 0.5, 0.5,
-3.898621, -3.572326, -2, 0, 1.5, 0.5, 0.5,
-3.898621, -3.572326, 0, 0, -0.5, 0.5, 0.5,
-3.898621, -3.572326, 0, 1, -0.5, 0.5, 0.5,
-3.898621, -3.572326, 0, 1, 1.5, 0.5, 0.5,
-3.898621, -3.572326, 0, 0, 1.5, 0.5, 0.5,
-3.898621, -3.572326, 2, 0, -0.5, 0.5, 0.5,
-3.898621, -3.572326, 2, 1, -0.5, 0.5, 0.5,
-3.898621, -3.572326, 2, 1, 1.5, 0.5, 0.5,
-3.898621, -3.572326, 2, 0, 1.5, 0.5, 0.5,
-3.898621, -3.572326, 4, 0, -0.5, 0.5, 0.5,
-3.898621, -3.572326, 4, 1, -0.5, 0.5, 0.5,
-3.898621, -3.572326, 4, 1, 1.5, 0.5, 0.5,
-3.898621, -3.572326, 4, 0, 1.5, 0.5, 0.5
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
-3.428372, -3.122725, -5.284722,
-3.428372, 2.871954, -5.284722,
-3.428372, -3.122725, 5.649014,
-3.428372, 2.871954, 5.649014,
-3.428372, -3.122725, -5.284722,
-3.428372, -3.122725, 5.649014,
-3.428372, 2.871954, -5.284722,
-3.428372, 2.871954, 5.649014,
-3.428372, -3.122725, -5.284722,
2.841603, -3.122725, -5.284722,
-3.428372, -3.122725, 5.649014,
2.841603, -3.122725, 5.649014,
-3.428372, 2.871954, -5.284722,
2.841603, 2.871954, -5.284722,
-3.428372, 2.871954, 5.649014,
2.841603, 2.871954, 5.649014,
2.841603, -3.122725, -5.284722,
2.841603, 2.871954, -5.284722,
2.841603, -3.122725, 5.649014,
2.841603, 2.871954, 5.649014,
2.841603, -3.122725, -5.284722,
2.841603, -3.122725, 5.649014,
2.841603, 2.871954, -5.284722,
2.841603, 2.871954, 5.649014
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
var radius = 7.452719;
var distance = 33.15799;
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
mvMatrix.translate( 0.2933849, 0.1253859, -0.1821463 );
mvMatrix.scale( 1.285177, 1.344196, 0.7369874 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.15799);
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
Pirimicarb<-read.table("Pirimicarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pirimicarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pirimicarb' not found
```

```r
y<-Pirimicarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pirimicarb' not found
```

```r
z<-Pirimicarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pirimicarb' not found
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
-3.337062, 0.9936279, -0.1302588, 0, 0, 1, 1, 1,
-2.880231, -0.0623429, -0.6524011, 1, 0, 0, 1, 1,
-2.844204, 0.3720109, -1.246804, 1, 0, 0, 1, 1,
-2.639745, 0.6144032, -1.366904, 1, 0, 0, 1, 1,
-2.574149, 1.324082, -0.8125012, 1, 0, 0, 1, 1,
-2.496557, -0.861799, -1.099125, 1, 0, 0, 1, 1,
-2.453066, -1.368926, -2.280481, 0, 0, 0, 1, 1,
-2.409077, -0.1804751, -2.337078, 0, 0, 0, 1, 1,
-2.343235, 1.986365, -0.5936464, 0, 0, 0, 1, 1,
-2.321607, -1.413753, -2.146438, 0, 0, 0, 1, 1,
-2.235316, -0.05167337, -2.720895, 0, 0, 0, 1, 1,
-2.233592, -0.1536799, -2.632103, 0, 0, 0, 1, 1,
-2.220059, -0.411908, -2.549411, 0, 0, 0, 1, 1,
-2.202824, 0.05950799, -0.403875, 1, 1, 1, 1, 1,
-2.1969, 0.1174825, -0.8553881, 1, 1, 1, 1, 1,
-2.194661, 0.09538334, -1.935263, 1, 1, 1, 1, 1,
-2.1655, 0.03682974, -1.041621, 1, 1, 1, 1, 1,
-2.12997, -1.117802, -2.057009, 1, 1, 1, 1, 1,
-2.129745, -0.6448312, -1.168133, 1, 1, 1, 1, 1,
-2.1001, 0.0292553, -0.5038449, 1, 1, 1, 1, 1,
-2.087224, 0.9268156, -1.162753, 1, 1, 1, 1, 1,
-2.079284, 0.8475223, 0.1790956, 1, 1, 1, 1, 1,
-2.070748, -1.586416, -2.417505, 1, 1, 1, 1, 1,
-2.061851, -0.4169024, -0.4777804, 1, 1, 1, 1, 1,
-2.059578, 1.144355, -2.699212, 1, 1, 1, 1, 1,
-1.99179, -1.00602, -2.409388, 1, 1, 1, 1, 1,
-1.991165, 1.007619, -2.723901, 1, 1, 1, 1, 1,
-1.988296, -0.4201135, -1.375607, 1, 1, 1, 1, 1,
-1.968521, 0.9715002, -1.779666, 0, 0, 1, 1, 1,
-1.955366, -0.4631315, -1.93823, 1, 0, 0, 1, 1,
-1.938244, -0.2214869, -3.510601, 1, 0, 0, 1, 1,
-1.913486, 0.6008747, -2.283213, 1, 0, 0, 1, 1,
-1.908606, -2.90082, -3.045643, 1, 0, 0, 1, 1,
-1.890226, -0.31535, -1.961601, 1, 0, 0, 1, 1,
-1.888103, -2.760769, -2.829864, 0, 0, 0, 1, 1,
-1.876984, -0.2780424, -4.217038, 0, 0, 0, 1, 1,
-1.866619, -0.5987483, -1.387084, 0, 0, 0, 1, 1,
-1.846557, -1.124391, -3.039255, 0, 0, 0, 1, 1,
-1.820665, -0.802048, -1.171962, 0, 0, 0, 1, 1,
-1.81792, -0.1802192, -2.185496, 0, 0, 0, 1, 1,
-1.806712, -1.979017, -4.955626, 0, 0, 0, 1, 1,
-1.78368, -0.403195, -2.310312, 1, 1, 1, 1, 1,
-1.759662, 0.2086466, -1.044495, 1, 1, 1, 1, 1,
-1.755869, -0.03863871, -2.725213, 1, 1, 1, 1, 1,
-1.745979, 0.3974254, -0.9106905, 1, 1, 1, 1, 1,
-1.744138, 1.209224, -0.5524846, 1, 1, 1, 1, 1,
-1.718249, 0.9142312, 1.202437, 1, 1, 1, 1, 1,
-1.713992, -1.829992, -0.4315532, 1, 1, 1, 1, 1,
-1.712801, 1.705701, -0.01381273, 1, 1, 1, 1, 1,
-1.687745, -0.08022523, -2.759969, 1, 1, 1, 1, 1,
-1.686046, -1.41327, -2.184683, 1, 1, 1, 1, 1,
-1.674671, 0.9064642, -0.7465954, 1, 1, 1, 1, 1,
-1.658025, 1.442021, -2.129785, 1, 1, 1, 1, 1,
-1.652989, -0.3746966, -0.7464851, 1, 1, 1, 1, 1,
-1.6405, -0.1282537, -1.911511, 1, 1, 1, 1, 1,
-1.631553, -2.13395, -2.863971, 1, 1, 1, 1, 1,
-1.614533, -0.4417163, -3.761189, 0, 0, 1, 1, 1,
-1.611798, -0.4632666, -2.96155, 1, 0, 0, 1, 1,
-1.611656, -0.2170077, -2.782401, 1, 0, 0, 1, 1,
-1.605034, 0.432235, -1.041164, 1, 0, 0, 1, 1,
-1.576776, -0.6327744, -4.084228, 1, 0, 0, 1, 1,
-1.565379, -0.2576136, -1.646244, 1, 0, 0, 1, 1,
-1.556332, -0.114186, -2.48784, 0, 0, 0, 1, 1,
-1.554931, 1.204394, -0.2708711, 0, 0, 0, 1, 1,
-1.552581, -0.6503449, -2.257839, 0, 0, 0, 1, 1,
-1.550064, 0.297202, -2.11848, 0, 0, 0, 1, 1,
-1.548899, 1.782866, 1.23311, 0, 0, 0, 1, 1,
-1.54566, -1.457287, -3.329875, 0, 0, 0, 1, 1,
-1.539033, 0.3622911, -1.620244, 0, 0, 0, 1, 1,
-1.531522, 0.5131499, -1.107942, 1, 1, 1, 1, 1,
-1.506669, 0.5575373, -0.0351028, 1, 1, 1, 1, 1,
-1.492639, 0.5704883, -0.2869145, 1, 1, 1, 1, 1,
-1.478763, 1.241936, -0.04498389, 1, 1, 1, 1, 1,
-1.47544, -0.2972918, -1.378006, 1, 1, 1, 1, 1,
-1.461441, -2.52921, -4.066635, 1, 1, 1, 1, 1,
-1.45489, 0.8931739, -1.487021, 1, 1, 1, 1, 1,
-1.454641, 1.43621, -3.431003, 1, 1, 1, 1, 1,
-1.438208, 0.7575241, -2.000354, 1, 1, 1, 1, 1,
-1.431427, -0.2354293, -1.278576, 1, 1, 1, 1, 1,
-1.425462, 0.8759988, -1.36115, 1, 1, 1, 1, 1,
-1.423486, 0.3733054, -0.1514759, 1, 1, 1, 1, 1,
-1.419913, -0.8671443, -0.3541704, 1, 1, 1, 1, 1,
-1.419619, -0.08671495, -1.780177, 1, 1, 1, 1, 1,
-1.417935, -1.748511, -1.524758, 1, 1, 1, 1, 1,
-1.410131, 1.224059, -0.1967053, 0, 0, 1, 1, 1,
-1.401158, -1.591992, -1.67256, 1, 0, 0, 1, 1,
-1.399323, 1.235683, -0.01203225, 1, 0, 0, 1, 1,
-1.395073, -1.441764, -1.911028, 1, 0, 0, 1, 1,
-1.394853, 0.8437245, 0.124352, 1, 0, 0, 1, 1,
-1.391034, 0.1846124, -0.655124, 1, 0, 0, 1, 1,
-1.387869, 0.5458782, -1.296876, 0, 0, 0, 1, 1,
-1.374438, 1.589947, -0.8470941, 0, 0, 0, 1, 1,
-1.370309, -0.3773372, -1.891762, 0, 0, 0, 1, 1,
-1.361828, 0.3564506, -0.1242885, 0, 0, 0, 1, 1,
-1.35269, -1.021358, -3.580761, 0, 0, 0, 1, 1,
-1.35255, -0.8923596, -3.04549, 0, 0, 0, 1, 1,
-1.350642, 1.521977, 1.492975, 0, 0, 0, 1, 1,
-1.345861, -0.507374, 0.06233964, 1, 1, 1, 1, 1,
-1.339936, -0.7374091, -2.783075, 1, 1, 1, 1, 1,
-1.334636, 0.2089213, -1.197906, 1, 1, 1, 1, 1,
-1.330221, -1.687942, -4.191345, 1, 1, 1, 1, 1,
-1.323233, -1.545517, -4.829041, 1, 1, 1, 1, 1,
-1.315847, -0.3858513, -3.371389, 1, 1, 1, 1, 1,
-1.302395, -0.6910887, -2.647299, 1, 1, 1, 1, 1,
-1.301415, 0.8328086, 0.3363482, 1, 1, 1, 1, 1,
-1.295365, -0.3753699, -1.687557, 1, 1, 1, 1, 1,
-1.283758, -0.648271, -2.424466, 1, 1, 1, 1, 1,
-1.27706, -0.2588548, -3.347424, 1, 1, 1, 1, 1,
-1.269474, -2.989539, -3.497337, 1, 1, 1, 1, 1,
-1.267713, -0.3667912, -2.324737, 1, 1, 1, 1, 1,
-1.267059, -1.300118, -4.389577, 1, 1, 1, 1, 1,
-1.261279, -0.6018949, -3.018911, 1, 1, 1, 1, 1,
-1.252646, 1.542565, -1.665974, 0, 0, 1, 1, 1,
-1.249166, 1.795264, -0.610719, 1, 0, 0, 1, 1,
-1.248253, -0.7148805, -1.227623, 1, 0, 0, 1, 1,
-1.238346, 1.15691, -0.6392527, 1, 0, 0, 1, 1,
-1.230811, 1.049709, -0.2687602, 1, 0, 0, 1, 1,
-1.230205, 1.136153, -1.832352, 1, 0, 0, 1, 1,
-1.205587, -0.8768195, -2.71662, 0, 0, 0, 1, 1,
-1.20272, 0.2345814, -0.3114346, 0, 0, 0, 1, 1,
-1.195046, -0.2401931, -2.425748, 0, 0, 0, 1, 1,
-1.194915, -2.210804, -3.661304, 0, 0, 0, 1, 1,
-1.190626, -0.7724527, -1.91312, 0, 0, 0, 1, 1,
-1.186249, -0.168308, -1.561466, 0, 0, 0, 1, 1,
-1.182556, -0.1233613, -2.830532, 0, 0, 0, 1, 1,
-1.171067, 0.7157477, -1.084663, 1, 1, 1, 1, 1,
-1.166785, -0.321592, -3.43728, 1, 1, 1, 1, 1,
-1.16432, 0.1864277, -1.690583, 1, 1, 1, 1, 1,
-1.157372, -0.2705988, -2.101247, 1, 1, 1, 1, 1,
-1.153318, 0.618641, 0.4979303, 1, 1, 1, 1, 1,
-1.152276, -0.8944892, -1.498294, 1, 1, 1, 1, 1,
-1.15203, -0.7690156, -1.27341, 1, 1, 1, 1, 1,
-1.127586, -2.571554, -3.092186, 1, 1, 1, 1, 1,
-1.125051, -0.5164816, -3.270974, 1, 1, 1, 1, 1,
-1.121324, -1.142216, -1.644676, 1, 1, 1, 1, 1,
-1.113038, -2.436567, -2.300951, 1, 1, 1, 1, 1,
-1.104836, -1.246595, -3.048963, 1, 1, 1, 1, 1,
-1.101308, 1.362741, 0.8460689, 1, 1, 1, 1, 1,
-1.095126, -0.8142264, -2.652311, 1, 1, 1, 1, 1,
-1.094832, 2.245298, -1.659399, 1, 1, 1, 1, 1,
-1.089721, -0.1085187, -3.074665, 0, 0, 1, 1, 1,
-1.089302, -0.7926082, -2.06544, 1, 0, 0, 1, 1,
-1.089041, 0.6809369, 0.3584996, 1, 0, 0, 1, 1,
-1.081419, -0.5279338, -2.794912, 1, 0, 0, 1, 1,
-1.06812, -0.5002777, -1.697758, 1, 0, 0, 1, 1,
-1.067343, 0.1093548, -1.404241, 1, 0, 0, 1, 1,
-1.059546, -0.1923178, -2.701197, 0, 0, 0, 1, 1,
-1.055528, -1.173288, -1.375214, 0, 0, 0, 1, 1,
-1.051012, -1.369062, -3.492615, 0, 0, 0, 1, 1,
-1.047742, 1.359146, -0.4770011, 0, 0, 0, 1, 1,
-1.04544, -1.131316, -1.238029, 0, 0, 0, 1, 1,
-1.044361, -0.5307423, -1.693936, 0, 0, 0, 1, 1,
-1.043326, 0.5880654, -3.155972, 0, 0, 0, 1, 1,
-1.039744, -1.432044, -3.11871, 1, 1, 1, 1, 1,
-1.037357, -1.992399, -3.210854, 1, 1, 1, 1, 1,
-1.028085, 0.3778719, -0.262408, 1, 1, 1, 1, 1,
-1.020145, -1.033222, -2.451014, 1, 1, 1, 1, 1,
-1.01986, -0.247199, -2.976419, 1, 1, 1, 1, 1,
-1.019625, -1.128531, -2.735276, 1, 1, 1, 1, 1,
-1.013139, 2.040389, 0.195262, 1, 1, 1, 1, 1,
-1.00882, -0.6164238, -2.69157, 1, 1, 1, 1, 1,
-1.006694, 0.7142532, -0.6071397, 1, 1, 1, 1, 1,
-1.004856, 0.8945224, -2.340789, 1, 1, 1, 1, 1,
-1.002469, 1.235678, -0.3029383, 1, 1, 1, 1, 1,
-0.9998484, -0.6996839, -2.411635, 1, 1, 1, 1, 1,
-0.9976964, 0.1754241, -0.1198568, 1, 1, 1, 1, 1,
-0.9946724, 0.4551538, -1.289726, 1, 1, 1, 1, 1,
-0.9907557, -0.04978671, -0.7486059, 1, 1, 1, 1, 1,
-0.9815506, 0.3571644, -1.672286, 0, 0, 1, 1, 1,
-0.981196, -1.198797, -2.502425, 1, 0, 0, 1, 1,
-0.9775436, -0.1279262, -1.279564, 1, 0, 0, 1, 1,
-0.9752891, -0.7189231, -0.5086866, 1, 0, 0, 1, 1,
-0.974718, 0.02551357, -1.050829, 1, 0, 0, 1, 1,
-0.9706268, 0.2888404, -1.306784, 1, 0, 0, 1, 1,
-0.9666491, -0.03367984, -0.75966, 0, 0, 0, 1, 1,
-0.9580677, 0.928663, 0.1406075, 0, 0, 0, 1, 1,
-0.9492779, 1.414719, -2.076199, 0, 0, 0, 1, 1,
-0.9461933, -0.3672058, -1.638765, 0, 0, 0, 1, 1,
-0.9436765, -0.4082351, -2.718031, 0, 0, 0, 1, 1,
-0.9415845, 0.07901583, -1.945589, 0, 0, 0, 1, 1,
-0.9401491, -0.4028584, -1.013395, 0, 0, 0, 1, 1,
-0.9377654, -0.1534086, -1.967023, 1, 1, 1, 1, 1,
-0.9332677, 1.424016, -0.95753, 1, 1, 1, 1, 1,
-0.9304944, -0.8821175, -1.256729, 1, 1, 1, 1, 1,
-0.9278728, 1.067106, -1.376558, 1, 1, 1, 1, 1,
-0.9217154, -2.644777, -1.438916, 1, 1, 1, 1, 1,
-0.9216008, 0.6124747, 0.069746, 1, 1, 1, 1, 1,
-0.9169965, -0.31681, -0.119178, 1, 1, 1, 1, 1,
-0.9128587, -0.1255503, -1.136659, 1, 1, 1, 1, 1,
-0.9097057, -0.9686311, -3.881342, 1, 1, 1, 1, 1,
-0.9023381, 0.1920339, -1.975819, 1, 1, 1, 1, 1,
-0.9015421, 0.4689648, -1.130615, 1, 1, 1, 1, 1,
-0.8996492, -1.956432, -3.913632, 1, 1, 1, 1, 1,
-0.8995744, -1.209519, -0.7303942, 1, 1, 1, 1, 1,
-0.8989307, 0.2470193, -2.015579, 1, 1, 1, 1, 1,
-0.8961686, 0.1481764, -1.404406, 1, 1, 1, 1, 1,
-0.8927239, 0.6449068, -0.07610645, 0, 0, 1, 1, 1,
-0.8918707, 0.8346957, 0.4330157, 1, 0, 0, 1, 1,
-0.8904952, 0.07699333, -0.3610522, 1, 0, 0, 1, 1,
-0.8882967, -0.0230519, -2.505171, 1, 0, 0, 1, 1,
-0.8859838, 0.008261422, -1.789675, 1, 0, 0, 1, 1,
-0.8773154, 1.543712, -0.2390236, 1, 0, 0, 1, 1,
-0.8750242, 1.165572, -0.62186, 0, 0, 0, 1, 1,
-0.8709708, -0.6144476, -1.834924, 0, 0, 0, 1, 1,
-0.8689685, -0.9806359, -3.481568, 0, 0, 0, 1, 1,
-0.8630461, 0.8860188, 0.9537277, 0, 0, 0, 1, 1,
-0.8623856, -0.5063969, -2.984302, 0, 0, 0, 1, 1,
-0.8607499, -1.181638, -1.840668, 0, 0, 0, 1, 1,
-0.8523137, 1.412718, -0.1403378, 0, 0, 0, 1, 1,
-0.851777, 0.6967927, -2.376065, 1, 1, 1, 1, 1,
-0.8505071, -0.1780913, -1.59272, 1, 1, 1, 1, 1,
-0.847319, -0.4590758, -3.609147, 1, 1, 1, 1, 1,
-0.8448149, 1.585258, -1.373703, 1, 1, 1, 1, 1,
-0.8394116, 2.107223, -1.115515, 1, 1, 1, 1, 1,
-0.8358677, -0.7874768, -1.887688, 1, 1, 1, 1, 1,
-0.8348072, -1.205485, -2.857965, 1, 1, 1, 1, 1,
-0.8346649, -0.789372, -0.6434156, 1, 1, 1, 1, 1,
-0.8342421, -0.9593405, -3.198373, 1, 1, 1, 1, 1,
-0.8323492, -0.6661564, -1.853164, 1, 1, 1, 1, 1,
-0.8271919, 0.1006057, -1.825442, 1, 1, 1, 1, 1,
-0.8198054, 0.07854423, -3.17406, 1, 1, 1, 1, 1,
-0.8173978, 0.4069107, -1.303855, 1, 1, 1, 1, 1,
-0.8154561, -0.2855241, -2.158328, 1, 1, 1, 1, 1,
-0.8148893, 0.5803092, 0.05954735, 1, 1, 1, 1, 1,
-0.8047479, -0.3079768, -3.403291, 0, 0, 1, 1, 1,
-0.8040468, -0.04222918, -1.929389, 1, 0, 0, 1, 1,
-0.803897, 1.322111, 1.594479, 1, 0, 0, 1, 1,
-0.8036734, -1.184689, -1.996545, 1, 0, 0, 1, 1,
-0.8027837, -0.2314004, -2.449902, 1, 0, 0, 1, 1,
-0.8024518, -0.6088871, -1.544151, 1, 0, 0, 1, 1,
-0.8002577, -1.5698, -2.416606, 0, 0, 0, 1, 1,
-0.7990592, -1.649199, -2.597277, 0, 0, 0, 1, 1,
-0.795149, -1.186325, -3.556916, 0, 0, 0, 1, 1,
-0.7929096, -0.5231544, -3.472945, 0, 0, 0, 1, 1,
-0.7892635, 0.5082838, -2.099838, 0, 0, 0, 1, 1,
-0.7830551, 0.9293029, 0.3830131, 0, 0, 0, 1, 1,
-0.776668, -0.7328147, -3.070124, 0, 0, 0, 1, 1,
-0.773806, -0.4713879, -1.986232, 1, 1, 1, 1, 1,
-0.7699246, -0.1351176, -3.139966, 1, 1, 1, 1, 1,
-0.7629177, -0.5744598, -2.251407, 1, 1, 1, 1, 1,
-0.7569512, -0.5673832, -3.209682, 1, 1, 1, 1, 1,
-0.7545159, -0.8889506, -3.992232, 1, 1, 1, 1, 1,
-0.7496448, 0.4585632, -1.511958, 1, 1, 1, 1, 1,
-0.7445775, -0.2488059, -3.221526, 1, 1, 1, 1, 1,
-0.742646, 2.784652, 1.786777, 1, 1, 1, 1, 1,
-0.7421505, 0.34738, -2.793573, 1, 1, 1, 1, 1,
-0.7414851, 1.003715, -0.6645343, 1, 1, 1, 1, 1,
-0.7405104, -1.286066, -4.151338, 1, 1, 1, 1, 1,
-0.7389218, -0.1023927, -2.593095, 1, 1, 1, 1, 1,
-0.7372544, -0.3346382, -0.2993907, 1, 1, 1, 1, 1,
-0.7335718, 2.156522, 0.337268, 1, 1, 1, 1, 1,
-0.7290097, 0.5866207, 0.6116775, 1, 1, 1, 1, 1,
-0.7282671, 0.2854944, 1.095051, 0, 0, 1, 1, 1,
-0.7262579, -2.483536, -2.209458, 1, 0, 0, 1, 1,
-0.7249758, -0.6581621, -1.140148, 1, 0, 0, 1, 1,
-0.7213201, 2.214047, 1.081098, 1, 0, 0, 1, 1,
-0.7170358, 0.6552176, -3.452642, 1, 0, 0, 1, 1,
-0.7118193, -2.100434, -3.228598, 1, 0, 0, 1, 1,
-0.7047123, -0.7024302, -2.354596, 0, 0, 0, 1, 1,
-0.7036248, 0.6358546, 0.1507694, 0, 0, 0, 1, 1,
-0.6970635, -1.40569, -2.809662, 0, 0, 0, 1, 1,
-0.6953309, -1.712242, -2.564857, 0, 0, 0, 1, 1,
-0.6926574, 0.3120476, -0.5656444, 0, 0, 0, 1, 1,
-0.6918165, -0.2877443, -2.286419, 0, 0, 0, 1, 1,
-0.6880923, 0.11662, -1.14631, 0, 0, 0, 1, 1,
-0.6829353, -0.3440945, -1.943816, 1, 1, 1, 1, 1,
-0.6746401, -0.729036, -2.134397, 1, 1, 1, 1, 1,
-0.6727587, 0.7906361, 0.1609418, 1, 1, 1, 1, 1,
-0.6689379, -1.472108, -2.895505, 1, 1, 1, 1, 1,
-0.6681952, 1.351097, -0.08342321, 1, 1, 1, 1, 1,
-0.6672018, 0.164621, -2.833789, 1, 1, 1, 1, 1,
-0.6664072, -0.8357639, -2.839122, 1, 1, 1, 1, 1,
-0.6620571, 0.2652339, -1.996836, 1, 1, 1, 1, 1,
-0.6576734, -1.43603, -2.165025, 1, 1, 1, 1, 1,
-0.6511934, 0.7190973, -1.843672, 1, 1, 1, 1, 1,
-0.639698, 1.386729, -1.504675, 1, 1, 1, 1, 1,
-0.6396828, 1.180041, 0.6605864, 1, 1, 1, 1, 1,
-0.6373881, 0.6800356, 0.3193576, 1, 1, 1, 1, 1,
-0.6207931, 0.4930959, -0.7736366, 1, 1, 1, 1, 1,
-0.6204565, -1.066964, -2.643892, 1, 1, 1, 1, 1,
-0.6183365, 0.2430577, -1.678399, 0, 0, 1, 1, 1,
-0.6172654, 1.169239, -1.624758, 1, 0, 0, 1, 1,
-0.6141235, 0.2533205, -2.127779, 1, 0, 0, 1, 1,
-0.6127028, 0.1212029, -2.128027, 1, 0, 0, 1, 1,
-0.6098952, -0.7183776, -2.816947, 1, 0, 0, 1, 1,
-0.608305, -1.059362, -2.096548, 1, 0, 0, 1, 1,
-0.6069593, -1.021365, -2.047218, 0, 0, 0, 1, 1,
-0.6059394, 0.9250427, -0.5612018, 0, 0, 0, 1, 1,
-0.6041458, 0.09225675, -1.858801, 0, 0, 0, 1, 1,
-0.6034725, -1.55487, -4.446927, 0, 0, 0, 1, 1,
-0.6021307, 1.598059, -1.159402, 0, 0, 0, 1, 1,
-0.6011391, 0.08595576, -0.5687618, 0, 0, 0, 1, 1,
-0.5991966, 0.003416228, -2.349571, 0, 0, 0, 1, 1,
-0.5983899, -1.041317, -3.389024, 1, 1, 1, 1, 1,
-0.5943847, -0.8311024, -1.227315, 1, 1, 1, 1, 1,
-0.5914218, 2.594209, -0.182865, 1, 1, 1, 1, 1,
-0.590305, 0.7460887, -1.34152, 1, 1, 1, 1, 1,
-0.5819646, -0.423975, -1.14096, 1, 1, 1, 1, 1,
-0.581249, -1.11315, -1.604312, 1, 1, 1, 1, 1,
-0.5779124, 0.00916444, -1.452405, 1, 1, 1, 1, 1,
-0.569879, 0.1221286, -1.785399, 1, 1, 1, 1, 1,
-0.5644277, 0.4756541, -1.192366, 1, 1, 1, 1, 1,
-0.5555027, -0.3529461, -1.718949, 1, 1, 1, 1, 1,
-0.5524518, 0.2950588, 0.383923, 1, 1, 1, 1, 1,
-0.5502873, 0.3714779, -1.817105, 1, 1, 1, 1, 1,
-0.5502719, -1.620246, -2.668684, 1, 1, 1, 1, 1,
-0.5466599, -0.3379488, -1.44456, 1, 1, 1, 1, 1,
-0.5461681, -0.6437733, -0.7680641, 1, 1, 1, 1, 1,
-0.5412655, 0.2630474, 0.0242062, 0, 0, 1, 1, 1,
-0.5381104, 1.933053, 0.4913756, 1, 0, 0, 1, 1,
-0.5371615, -1.720188, -2.384557, 1, 0, 0, 1, 1,
-0.5357306, 1.136908, -0.05188823, 1, 0, 0, 1, 1,
-0.5357095, 0.1299012, -3.192989, 1, 0, 0, 1, 1,
-0.5301433, 1.666512, 0.6614383, 1, 0, 0, 1, 1,
-0.5290886, 2.349809, 1.565877, 0, 0, 0, 1, 1,
-0.5271227, 0.4582421, -0.5864699, 0, 0, 0, 1, 1,
-0.5260848, -0.3074999, -0.1505466, 0, 0, 0, 1, 1,
-0.5260245, 0.6123406, 2.743301, 0, 0, 0, 1, 1,
-0.5244705, -1.056544, -4.120527, 0, 0, 0, 1, 1,
-0.5241495, 1.059086, 0.2805847, 0, 0, 0, 1, 1,
-0.5240275, -0.03919004, -2.287225, 0, 0, 0, 1, 1,
-0.523917, 0.2662923, -0.4917894, 1, 1, 1, 1, 1,
-0.5216025, -1.620537, -1.655998, 1, 1, 1, 1, 1,
-0.5195079, -0.4494614, -1.443333, 1, 1, 1, 1, 1,
-0.5178245, -0.5739667, -0.8387645, 1, 1, 1, 1, 1,
-0.5150537, 1.150848, -0.3989884, 1, 1, 1, 1, 1,
-0.5114454, 0.2536133, -0.7405984, 1, 1, 1, 1, 1,
-0.4963831, 0.7564831, 0.4965996, 1, 1, 1, 1, 1,
-0.4963622, -0.2739064, -0.7257147, 1, 1, 1, 1, 1,
-0.4890352, 0.06955422, -1.390143, 1, 1, 1, 1, 1,
-0.4802904, -0.3228958, -1.480518, 1, 1, 1, 1, 1,
-0.4766536, -0.231741, -2.177356, 1, 1, 1, 1, 1,
-0.4763147, 0.08060265, -2.466737, 1, 1, 1, 1, 1,
-0.4762353, -1.531119, -3.679119, 1, 1, 1, 1, 1,
-0.4755691, -0.6440802, -2.340219, 1, 1, 1, 1, 1,
-0.4744918, -0.4320211, -2.74168, 1, 1, 1, 1, 1,
-0.4681264, -0.6329837, -3.071336, 0, 0, 1, 1, 1,
-0.4669225, -0.02496546, -2.595178, 1, 0, 0, 1, 1,
-0.4596029, 0.7189399, -2.021987, 1, 0, 0, 1, 1,
-0.4575522, -1.690184, -4.530901, 1, 0, 0, 1, 1,
-0.4567756, -0.4907117, -2.448078, 1, 0, 0, 1, 1,
-0.4562134, -0.01325311, -2.678219, 1, 0, 0, 1, 1,
-0.4523933, 0.3354766, -0.7715534, 0, 0, 0, 1, 1,
-0.4490209, 0.7870414, -1.079032, 0, 0, 0, 1, 1,
-0.4452356, -1.940714, -5.125493, 0, 0, 0, 1, 1,
-0.4444616, -0.5203369, -2.120989, 0, 0, 0, 1, 1,
-0.4442443, 0.3318423, -0.9315362, 0, 0, 0, 1, 1,
-0.4440367, -0.1403481, -0.9953851, 0, 0, 0, 1, 1,
-0.4436698, -0.01869644, -2.352421, 0, 0, 0, 1, 1,
-0.4432667, 1.281099, -0.8687028, 1, 1, 1, 1, 1,
-0.4421989, -1.296324, -3.02023, 1, 1, 1, 1, 1,
-0.4391448, -0.6435621, -4.446338, 1, 1, 1, 1, 1,
-0.4370497, 0.6246779, -2.980725, 1, 1, 1, 1, 1,
-0.4334723, 1.119424, 0.9249592, 1, 1, 1, 1, 1,
-0.432887, 0.7058917, 0.4852881, 1, 1, 1, 1, 1,
-0.4321291, 1.193447, -1.526661, 1, 1, 1, 1, 1,
-0.4282205, -0.06023151, -2.092083, 1, 1, 1, 1, 1,
-0.427802, 0.1898305, 0.7516409, 1, 1, 1, 1, 1,
-0.4271309, -0.8904433, -3.599067, 1, 1, 1, 1, 1,
-0.4170245, -0.2459087, -1.8319, 1, 1, 1, 1, 1,
-0.4139383, 0.610218, -2.310849, 1, 1, 1, 1, 1,
-0.405256, -0.409531, -2.017905, 1, 1, 1, 1, 1,
-0.4052283, -2.045921, -4.217701, 1, 1, 1, 1, 1,
-0.4051925, -2.395453, -3.987866, 1, 1, 1, 1, 1,
-0.4048213, -0.4802116, -2.860972, 0, 0, 1, 1, 1,
-0.4043253, -0.08318464, -1.054982, 1, 0, 0, 1, 1,
-0.4030131, -0.3761095, -1.980286, 1, 0, 0, 1, 1,
-0.397212, -1.73525, -2.049117, 1, 0, 0, 1, 1,
-0.394949, -0.2011816, -3.247967, 1, 0, 0, 1, 1,
-0.3919813, -0.7619739, -1.559749, 1, 0, 0, 1, 1,
-0.391172, 0.221271, -3.094307, 0, 0, 0, 1, 1,
-0.3847246, -0.4351695, -2.270399, 0, 0, 0, 1, 1,
-0.3823155, -0.5203014, -2.458329, 0, 0, 0, 1, 1,
-0.3740282, -0.691103, -3.114834, 0, 0, 0, 1, 1,
-0.3719987, -0.6936752, -3.476906, 0, 0, 0, 1, 1,
-0.3699904, -1.118652, -0.02624976, 0, 0, 0, 1, 1,
-0.3692961, -1.024701, -3.746794, 0, 0, 0, 1, 1,
-0.3680064, 1.678677, -0.9627703, 1, 1, 1, 1, 1,
-0.3660475, 2.571851, -1.207833, 1, 1, 1, 1, 1,
-0.3618879, -0.1375728, -1.810411, 1, 1, 1, 1, 1,
-0.3612202, -2.032858, -1.749069, 1, 1, 1, 1, 1,
-0.3598521, -0.3402367, -1.58305, 1, 1, 1, 1, 1,
-0.3590633, -0.3966889, -1.753243, 1, 1, 1, 1, 1,
-0.3588237, -0.02840477, -1.549124, 1, 1, 1, 1, 1,
-0.3581635, 1.03941, -0.246135, 1, 1, 1, 1, 1,
-0.3510468, 0.004425087, -1.437222, 1, 1, 1, 1, 1,
-0.3494762, 0.4830367, 0.8907993, 1, 1, 1, 1, 1,
-0.3488412, 0.6276693, 0.2743467, 1, 1, 1, 1, 1,
-0.3470875, 0.5288324, -1.125246, 1, 1, 1, 1, 1,
-0.3468443, -0.1607404, -1.89607, 1, 1, 1, 1, 1,
-0.3431967, -0.460502, -2.120967, 1, 1, 1, 1, 1,
-0.3393711, -1.734011, -1.563153, 1, 1, 1, 1, 1,
-0.3351102, -0.1917272, -3.62636, 0, 0, 1, 1, 1,
-0.3342846, -0.5722308, -3.869938, 1, 0, 0, 1, 1,
-0.3312601, -1.314856, -1.744412, 1, 0, 0, 1, 1,
-0.3256989, 0.0825967, -0.9131817, 1, 0, 0, 1, 1,
-0.3207345, -1.26896, -3.082461, 1, 0, 0, 1, 1,
-0.3206018, 1.133597, -0.9882883, 1, 0, 0, 1, 1,
-0.3201702, 1.247761, 1.596658, 0, 0, 0, 1, 1,
-0.3132164, 0.2558913, -0.3706959, 0, 0, 0, 1, 1,
-0.3130103, 0.8323529, 1.858236, 0, 0, 0, 1, 1,
-0.3103954, -0.1735905, -1.134737, 0, 0, 0, 1, 1,
-0.304736, 0.6436778, 0.1330673, 0, 0, 0, 1, 1,
-0.3021974, 1.102035, -1.339267, 0, 0, 0, 1, 1,
-0.3021836, -0.8725228, -2.663476, 0, 0, 0, 1, 1,
-0.30104, 0.4284386, 0.2446294, 1, 1, 1, 1, 1,
-0.2992214, -0.004494408, -0.8065017, 1, 1, 1, 1, 1,
-0.2974947, 0.9574667, 0.1261677, 1, 1, 1, 1, 1,
-0.2969091, 0.1395734, -1.204312, 1, 1, 1, 1, 1,
-0.2951085, -0.09854551, -3.629804, 1, 1, 1, 1, 1,
-0.2930683, -0.3418814, -1.71666, 1, 1, 1, 1, 1,
-0.2871936, -0.113491, -3.747876, 1, 1, 1, 1, 1,
-0.2855262, 0.5213997, 0.5513951, 1, 1, 1, 1, 1,
-0.2833542, 0.4886245, -1.176127, 1, 1, 1, 1, 1,
-0.2813861, 0.08616765, -1.335203, 1, 1, 1, 1, 1,
-0.28078, -0.8728225, -3.111636, 1, 1, 1, 1, 1,
-0.2803068, -0.06569647, -2.24078, 1, 1, 1, 1, 1,
-0.2801411, 1.069951, 0.4967127, 1, 1, 1, 1, 1,
-0.2742456, -1.413796, -4.048126, 1, 1, 1, 1, 1,
-0.2738587, 1.265018, -1.810712, 1, 1, 1, 1, 1,
-0.2724177, -0.3954152, -1.807182, 0, 0, 1, 1, 1,
-0.271271, 0.3952763, 0.4222209, 1, 0, 0, 1, 1,
-0.2633515, -2.007957, -1.543556, 1, 0, 0, 1, 1,
-0.2622125, -1.598253, -3.63715, 1, 0, 0, 1, 1,
-0.2591946, -0.9156017, -3.425253, 1, 0, 0, 1, 1,
-0.2538819, -1.279164, -2.51413, 1, 0, 0, 1, 1,
-0.2502309, 1.085808, 1.534757, 0, 0, 0, 1, 1,
-0.2493727, -0.2961078, -3.403441, 0, 0, 0, 1, 1,
-0.2493546, -1.426575, -2.703639, 0, 0, 0, 1, 1,
-0.2419991, -0.5264251, -2.830091, 0, 0, 0, 1, 1,
-0.2414315, 0.1044743, 0.3335056, 0, 0, 0, 1, 1,
-0.2393913, 0.6571926, -1.020356, 0, 0, 0, 1, 1,
-0.235236, 0.9706828, -1.716921, 0, 0, 0, 1, 1,
-0.2344708, -1.484505, -4.990819, 1, 1, 1, 1, 1,
-0.2296108, -0.01352083, -0.7802569, 1, 1, 1, 1, 1,
-0.2273472, -0.6538163, -2.630248, 1, 1, 1, 1, 1,
-0.2272706, 0.6649495, 0.1872951, 1, 1, 1, 1, 1,
-0.2247453, -0.8112839, -4.289562, 1, 1, 1, 1, 1,
-0.2191306, -0.5321098, -0.4172517, 1, 1, 1, 1, 1,
-0.2191119, 1.175948, 0.8377486, 1, 1, 1, 1, 1,
-0.2152878, 0.1381747, -2.351593, 1, 1, 1, 1, 1,
-0.2139877, -1.747184, -3.391005, 1, 1, 1, 1, 1,
-0.2106279, -0.8169424, -2.340273, 1, 1, 1, 1, 1,
-0.207524, -1.588934, -2.204177, 1, 1, 1, 1, 1,
-0.2070889, -2.148733, -4.355424, 1, 1, 1, 1, 1,
-0.2063729, -0.5910565, -2.369023, 1, 1, 1, 1, 1,
-0.2016246, -0.1917571, -3.694301, 1, 1, 1, 1, 1,
-0.1985466, -1.218073, -2.941705, 1, 1, 1, 1, 1,
-0.1960905, -0.0943979, -3.353819, 0, 0, 1, 1, 1,
-0.1950004, -0.5670756, -1.458702, 1, 0, 0, 1, 1,
-0.1940251, -1.756234, -1.808496, 1, 0, 0, 1, 1,
-0.188583, 0.4337802, -1.829757, 1, 0, 0, 1, 1,
-0.1870296, -1.648684, -2.590457, 1, 0, 0, 1, 1,
-0.1850433, -0.2016421, -4.236717, 1, 0, 0, 1, 1,
-0.1849532, -0.6384775, -1.66863, 0, 0, 0, 1, 1,
-0.1833541, 0.6578375, 0.1440209, 0, 0, 0, 1, 1,
-0.1826855, 1.862413, -0.4596895, 0, 0, 0, 1, 1,
-0.1815287, -0.1270187, -0.5715206, 0, 0, 0, 1, 1,
-0.1807865, 0.3509808, -1.655546, 0, 0, 0, 1, 1,
-0.1804926, 0.605092, -0.8957158, 0, 0, 0, 1, 1,
-0.1787882, 0.6773756, 0.69481, 0, 0, 0, 1, 1,
-0.178654, -0.6741338, -3.953847, 1, 1, 1, 1, 1,
-0.1765621, -0.8965037, -2.486934, 1, 1, 1, 1, 1,
-0.1746721, 0.5157976, 0.4798082, 1, 1, 1, 1, 1,
-0.1722999, -0.2465642, -3.445331, 1, 1, 1, 1, 1,
-0.1716676, 1.264081, -2.443861, 1, 1, 1, 1, 1,
-0.1667859, -0.2013859, -1.772186, 1, 1, 1, 1, 1,
-0.1604148, -2.091249, -4.264355, 1, 1, 1, 1, 1,
-0.1586473, 0.4740288, 2.913865, 1, 1, 1, 1, 1,
-0.1524809, -1.598473, -4.545413, 1, 1, 1, 1, 1,
-0.1519464, 1.029135, -0.431699, 1, 1, 1, 1, 1,
-0.1475923, 0.3876191, 0.8868415, 1, 1, 1, 1, 1,
-0.1444023, 0.1392836, -1.240892, 1, 1, 1, 1, 1,
-0.1434342, -0.8244244, -4.830868, 1, 1, 1, 1, 1,
-0.1433463, -0.9261039, -2.889795, 1, 1, 1, 1, 1,
-0.1404558, 1.32877, 1.509751, 1, 1, 1, 1, 1,
-0.1393137, -1.322524, -2.767042, 0, 0, 1, 1, 1,
-0.1387588, 0.006750728, -0.8423885, 1, 0, 0, 1, 1,
-0.1373455, -0.7282129, -4.118713, 1, 0, 0, 1, 1,
-0.125457, -0.1831914, -3.644914, 1, 0, 0, 1, 1,
-0.1249543, 0.34372, -0.388459, 1, 0, 0, 1, 1,
-0.1223475, -0.5998322, -4.010676, 1, 0, 0, 1, 1,
-0.1223237, -0.9528764, -1.951217, 0, 0, 0, 1, 1,
-0.119928, 0.7715912, 0.2114189, 0, 0, 0, 1, 1,
-0.1193355, 0.6101721, 0.4161266, 0, 0, 0, 1, 1,
-0.1189041, 0.3701078, -1.326174, 0, 0, 0, 1, 1,
-0.1180563, -0.4144491, -3.785992, 0, 0, 0, 1, 1,
-0.1180417, 1.31962, -0.3142147, 0, 0, 0, 1, 1,
-0.1167548, 0.5827462, -0.3058017, 0, 0, 0, 1, 1,
-0.1153863, 0.609219, -0.1359306, 1, 1, 1, 1, 1,
-0.1145772, 0.5961301, -0.9843499, 1, 1, 1, 1, 1,
-0.0974551, -1.215506, -3.895251, 1, 1, 1, 1, 1,
-0.08724068, -0.1513404, -0.9112702, 1, 1, 1, 1, 1,
-0.08704903, -0.7803515, 0.1294353, 1, 1, 1, 1, 1,
-0.08585904, -0.1089456, -1.321491, 1, 1, 1, 1, 1,
-0.08219013, 0.2263752, -1.057962, 1, 1, 1, 1, 1,
-0.07841834, 0.1148197, -1.255523, 1, 1, 1, 1, 1,
-0.07356698, -0.8539061, -3.523283, 1, 1, 1, 1, 1,
-0.07119537, -1.302914, -2.824925, 1, 1, 1, 1, 1,
-0.06721938, -1.357494, -3.306959, 1, 1, 1, 1, 1,
-0.06317296, -2.689914, -1.453333, 1, 1, 1, 1, 1,
-0.05620252, 0.1105926, -0.935347, 1, 1, 1, 1, 1,
-0.0558497, 0.02603287, -0.9363682, 1, 1, 1, 1, 1,
-0.05069737, -0.04717205, -2.533552, 1, 1, 1, 1, 1,
-0.04980804, 0.3848011, -1.224735, 0, 0, 1, 1, 1,
-0.04431673, -0.3964878, -1.00574, 1, 0, 0, 1, 1,
-0.04423358, -0.890843, -3.892051, 1, 0, 0, 1, 1,
-0.04367838, 0.3547457, -0.5585887, 1, 0, 0, 1, 1,
-0.04032177, 0.3607988, -0.0734281, 1, 0, 0, 1, 1,
-0.03941284, -0.07342589, -3.27786, 1, 0, 0, 1, 1,
-0.03913018, -0.2045915, -2.646087, 0, 0, 0, 1, 1,
-0.03569496, 0.5842133, -1.748547, 0, 0, 0, 1, 1,
-0.03165488, -1.188834, -4.280725, 0, 0, 0, 1, 1,
-0.02839111, -2.251768, -3.589202, 0, 0, 0, 1, 1,
-0.02413145, 1.366605, 0.5282611, 0, 0, 0, 1, 1,
-0.02267909, -0.2941164, -2.190563, 0, 0, 0, 1, 1,
-0.0212021, 1.429625, -0.380505, 0, 0, 0, 1, 1,
-0.02049366, 1.313807, -1.493651, 1, 1, 1, 1, 1,
-0.01526574, 1.089756, -1.29249, 1, 1, 1, 1, 1,
-0.01329803, -0.8682432, -3.80284, 1, 1, 1, 1, 1,
-0.004116672, -0.6650754, -2.042583, 1, 1, 1, 1, 1,
-0.0008748068, 0.2807149, 0.2177421, 1, 1, 1, 1, 1,
0.006033679, 0.07205223, -0.7369074, 1, 1, 1, 1, 1,
0.006853664, -2.674518, 1.940709, 1, 1, 1, 1, 1,
0.01356884, -0.7306767, 3.45419, 1, 1, 1, 1, 1,
0.01369265, -0.9973396, 2.590293, 1, 1, 1, 1, 1,
0.01727649, 1.114342, 1.849883, 1, 1, 1, 1, 1,
0.02393345, 0.5400526, 0.8150661, 1, 1, 1, 1, 1,
0.02415729, 1.269586, -1.209355, 1, 1, 1, 1, 1,
0.02585527, 0.9078202, 0.3531532, 1, 1, 1, 1, 1,
0.0266139, 0.7807518, -0.4933031, 1, 1, 1, 1, 1,
0.03395584, -1.459954, 3.956209, 1, 1, 1, 1, 1,
0.03517095, 0.2932115, -0.1294899, 0, 0, 1, 1, 1,
0.04024087, -0.7348465, 3.982715, 1, 0, 0, 1, 1,
0.04336859, 0.4412988, -0.7515809, 1, 0, 0, 1, 1,
0.0467507, -0.115779, 0.9164741, 1, 0, 0, 1, 1,
0.04834957, -1.292678, 2.522712, 1, 0, 0, 1, 1,
0.05000098, -0.04148486, 2.091731, 1, 0, 0, 1, 1,
0.05015693, 0.04571217, -0.02546285, 0, 0, 0, 1, 1,
0.05311137, 0.252949, -0.7521955, 0, 0, 0, 1, 1,
0.05724545, -1.325598, 3.702055, 0, 0, 0, 1, 1,
0.05953581, -1.011362, 3.746249, 0, 0, 0, 1, 1,
0.06073927, -0.293701, 2.538296, 0, 0, 0, 1, 1,
0.06213862, 0.1156071, -0.2400142, 0, 0, 0, 1, 1,
0.06242728, 0.5238141, 1.220176, 0, 0, 0, 1, 1,
0.06384908, -1.557461, 4.078311, 1, 1, 1, 1, 1,
0.0731881, -0.8849508, 4.16263, 1, 1, 1, 1, 1,
0.08006739, 0.4724602, 0.516345, 1, 1, 1, 1, 1,
0.08089374, 2.093024, -1.370481, 1, 1, 1, 1, 1,
0.09145507, 0.7994418, -0.7231222, 1, 1, 1, 1, 1,
0.09406328, 1.871487, 0.5341795, 1, 1, 1, 1, 1,
0.09420393, 0.6070306, 0.2439125, 1, 1, 1, 1, 1,
0.09773292, 0.03038523, 0.3883617, 1, 1, 1, 1, 1,
0.09839227, -0.03915177, 2.246703, 1, 1, 1, 1, 1,
0.1061418, -0.1640739, 2.381761, 1, 1, 1, 1, 1,
0.1089413, 0.1860936, 1.217564, 1, 1, 1, 1, 1,
0.1135499, 1.502427, 1.335334, 1, 1, 1, 1, 1,
0.1150631, 0.01711497, 1.61176, 1, 1, 1, 1, 1,
0.1163295, -2.479719, 4.137467, 1, 1, 1, 1, 1,
0.1198893, -1.039052, 3.429992, 1, 1, 1, 1, 1,
0.1221292, 1.118325, 0.8243868, 0, 0, 1, 1, 1,
0.1258156, 0.5916364, -0.3581223, 1, 0, 0, 1, 1,
0.1258948, 0.7031351, 1.152257, 1, 0, 0, 1, 1,
0.1262374, 0.7002071, -0.776962, 1, 0, 0, 1, 1,
0.1292937, -0.5729808, 0.5874902, 1, 0, 0, 1, 1,
0.1296433, -0.7843773, 2.491278, 1, 0, 0, 1, 1,
0.1345594, -1.224319, 2.974499, 0, 0, 0, 1, 1,
0.1360992, 1.304132, 2.258626, 0, 0, 0, 1, 1,
0.1364954, -0.09953599, 2.864863, 0, 0, 0, 1, 1,
0.1474856, -0.7235274, 0.2642963, 0, 0, 0, 1, 1,
0.1559866, -1.617815, 2.136666, 0, 0, 0, 1, 1,
0.1619247, 0.07685248, 0.9077824, 0, 0, 0, 1, 1,
0.1682413, -1.535645, 3.229844, 0, 0, 0, 1, 1,
0.1691685, -0.8151597, 3.19294, 1, 1, 1, 1, 1,
0.1790596, 0.8006768, 0.5522224, 1, 1, 1, 1, 1,
0.1793454, 0.8552043, -0.9445947, 1, 1, 1, 1, 1,
0.1801114, -0.07587727, 3.663112, 1, 1, 1, 1, 1,
0.1809079, -0.06657911, 1.382621, 1, 1, 1, 1, 1,
0.1811455, 0.2773364, -0.7823901, 1, 1, 1, 1, 1,
0.1812853, 0.8513644, 0.7493366, 1, 1, 1, 1, 1,
0.1816322, 1.356565, -0.1347932, 1, 1, 1, 1, 1,
0.182346, 0.8868677, 0.2257009, 1, 1, 1, 1, 1,
0.185561, 1.084199, 0.985561, 1, 1, 1, 1, 1,
0.1859864, 1.112638, -0.2261571, 1, 1, 1, 1, 1,
0.1904167, -0.2489459, 2.386569, 1, 1, 1, 1, 1,
0.1920878, -1.83413, 2.836222, 1, 1, 1, 1, 1,
0.1969103, -1.200903, 4.672112, 1, 1, 1, 1, 1,
0.1980353, -1.522529, 3.542561, 1, 1, 1, 1, 1,
0.1996244, 0.01657252, -0.2821967, 0, 0, 1, 1, 1,
0.2030095, 0.1528855, 0.1296884, 1, 0, 0, 1, 1,
0.2041597, -0.9343758, 3.734952, 1, 0, 0, 1, 1,
0.2109796, -2.526634, 4.008891, 1, 0, 0, 1, 1,
0.2186516, -1.424016, 3.26182, 1, 0, 0, 1, 1,
0.2189214, 2.083721, 0.659965, 1, 0, 0, 1, 1,
0.2196663, 0.0966715, 2.816308, 0, 0, 0, 1, 1,
0.221025, 0.8566542, -0.213685, 0, 0, 0, 1, 1,
0.2212453, 1.030277, -1.38414, 0, 0, 0, 1, 1,
0.2216887, 2.007731, -0.02612901, 0, 0, 0, 1, 1,
0.2240843, -1.350324, 1.871435, 0, 0, 0, 1, 1,
0.2241643, -1.588004, 2.359596, 0, 0, 0, 1, 1,
0.227574, 0.07865751, 1.403747, 0, 0, 0, 1, 1,
0.2280933, -0.9782169, 1.875635, 1, 1, 1, 1, 1,
0.2289908, 0.1540528, -0.3455311, 1, 1, 1, 1, 1,
0.23076, 1.392361, 1.618433, 1, 1, 1, 1, 1,
0.2361408, -0.1825426, 2.593548, 1, 1, 1, 1, 1,
0.2375291, -0.7842767, 3.335278, 1, 1, 1, 1, 1,
0.2392174, -0.7595502, 0.9493567, 1, 1, 1, 1, 1,
0.2393196, 0.2660596, -1.014947, 1, 1, 1, 1, 1,
0.2418467, 0.5125592, 1.055129, 1, 1, 1, 1, 1,
0.2480142, 1.665285, -1.196434, 1, 1, 1, 1, 1,
0.2496742, -0.5319929, 3.104929, 1, 1, 1, 1, 1,
0.2505313, -1.388128, 4.5418, 1, 1, 1, 1, 1,
0.2512234, 1.301502, 0.2030709, 1, 1, 1, 1, 1,
0.2524463, -0.01251196, 2.192838, 1, 1, 1, 1, 1,
0.2537857, 0.171742, 1.217869, 1, 1, 1, 1, 1,
0.2556699, 0.4684872, -0.3396804, 1, 1, 1, 1, 1,
0.2560963, 0.1194409, 0.8425958, 0, 0, 1, 1, 1,
0.2561434, -0.8304049, 3.457504, 1, 0, 0, 1, 1,
0.2563846, -0.4921107, 2.44857, 1, 0, 0, 1, 1,
0.2576684, -1.42721, 5.489785, 1, 0, 0, 1, 1,
0.2600284, 0.1891347, 2.832474, 1, 0, 0, 1, 1,
0.2601373, 0.3925871, 0.3566708, 1, 0, 0, 1, 1,
0.2623047, -0.1017705, 2.318276, 0, 0, 0, 1, 1,
0.265147, 0.9888398, 0.9990851, 0, 0, 0, 1, 1,
0.2666445, 0.2169836, 0.7757395, 0, 0, 0, 1, 1,
0.2679746, 0.8916218, -0.03820666, 0, 0, 0, 1, 1,
0.2681867, 1.193482, 2.424912, 0, 0, 0, 1, 1,
0.2698683, -0.5438818, 1.6968, 0, 0, 0, 1, 1,
0.2711511, -0.5515337, 2.889128, 0, 0, 0, 1, 1,
0.2721818, -2.786653, 2.605418, 1, 1, 1, 1, 1,
0.2804621, -1.476644, 2.893859, 1, 1, 1, 1, 1,
0.2847583, 0.7932632, 0.09004971, 1, 1, 1, 1, 1,
0.2911007, 0.2696255, 1.948287, 1, 1, 1, 1, 1,
0.2953355, -0.01992561, 0.8655174, 1, 1, 1, 1, 1,
0.2985927, 2.260714, -1.617958, 1, 1, 1, 1, 1,
0.3072608, -0.1001335, 1.521546, 1, 1, 1, 1, 1,
0.3073739, 0.04529967, 1.88203, 1, 1, 1, 1, 1,
0.3092318, -0.7338954, 3.36291, 1, 1, 1, 1, 1,
0.3132189, 1.368909, 1.418318, 1, 1, 1, 1, 1,
0.3138217, -1.147812, 4.343023, 1, 1, 1, 1, 1,
0.3191036, 0.333886, 0.9417499, 1, 1, 1, 1, 1,
0.3204074, -0.3687021, 2.123534, 1, 1, 1, 1, 1,
0.3226652, -1.709312, 1.885047, 1, 1, 1, 1, 1,
0.3239011, 0.1340562, 1.503573, 1, 1, 1, 1, 1,
0.3265984, 0.2952084, 2.877363, 0, 0, 1, 1, 1,
0.3290454, -0.0270202, 1.976812, 1, 0, 0, 1, 1,
0.3311728, -0.6404973, 2.200095, 1, 0, 0, 1, 1,
0.3315754, 1.080741, 0.9547788, 1, 0, 0, 1, 1,
0.3340476, 0.4586337, 0.2584136, 1, 0, 0, 1, 1,
0.3353409, -1.771146, 4.8272, 1, 0, 0, 1, 1,
0.3416574, -0.5031807, 1.345629, 0, 0, 0, 1, 1,
0.3416725, 0.5311155, -0.2278634, 0, 0, 0, 1, 1,
0.3430201, -1.856697, 3.376415, 0, 0, 0, 1, 1,
0.3473998, 1.035315, 2.995154, 0, 0, 0, 1, 1,
0.3474224, -0.1135694, 1.817926, 0, 0, 0, 1, 1,
0.3507214, -0.591617, 2.10655, 0, 0, 0, 1, 1,
0.3534164, 0.2624948, 0.5490981, 0, 0, 0, 1, 1,
0.3614746, 2.405923, 0.9722682, 1, 1, 1, 1, 1,
0.365346, -1.618887, 3.468857, 1, 1, 1, 1, 1,
0.3673129, 0.3347008, 0.6113671, 1, 1, 1, 1, 1,
0.3693757, -0.03241819, 2.367776, 1, 1, 1, 1, 1,
0.3700999, 1.343009, 1.021122, 1, 1, 1, 1, 1,
0.3734604, -0.06389163, 2.523317, 1, 1, 1, 1, 1,
0.3735323, 0.606516, -0.03405342, 1, 1, 1, 1, 1,
0.3810684, -0.3083257, 1.681087, 1, 1, 1, 1, 1,
0.3841842, 0.1295899, 1.543773, 1, 1, 1, 1, 1,
0.390738, 1.571019, -0.1451742, 1, 1, 1, 1, 1,
0.39631, 0.7852965, 0.4178717, 1, 1, 1, 1, 1,
0.396606, -0.3326578, -0.1025114, 1, 1, 1, 1, 1,
0.3967818, 1.778727, 0.9221362, 1, 1, 1, 1, 1,
0.3987277, -1.230159, 2.892616, 1, 1, 1, 1, 1,
0.3997912, -0.0850687, 2.757228, 1, 1, 1, 1, 1,
0.400071, 1.052951, 0.3800537, 0, 0, 1, 1, 1,
0.4039729, 1.720951, 0.4022565, 1, 0, 0, 1, 1,
0.4134164, -1.055209, 3.645349, 1, 0, 0, 1, 1,
0.4194669, -1.006467, 3.211885, 1, 0, 0, 1, 1,
0.4271175, 0.5075735, 0.9915642, 1, 0, 0, 1, 1,
0.4331354, 0.5067256, -0.1116213, 1, 0, 0, 1, 1,
0.4443851, -0.04321699, 2.073552, 0, 0, 0, 1, 1,
0.4447397, -1.268157, 2.742731, 0, 0, 0, 1, 1,
0.4451758, -0.606997, 1.705461, 0, 0, 0, 1, 1,
0.4475845, 0.4944239, 0.2409421, 0, 0, 0, 1, 1,
0.4517742, -2.806209, 2.44727, 0, 0, 0, 1, 1,
0.4539035, -0.4389596, 0.381613, 0, 0, 0, 1, 1,
0.4560186, 0.4674052, -0.3138108, 0, 0, 0, 1, 1,
0.459786, 1.855875, -0.9737657, 1, 1, 1, 1, 1,
0.4645784, 1.809139, 1.2355, 1, 1, 1, 1, 1,
0.4729609, -0.5080783, 2.656303, 1, 1, 1, 1, 1,
0.4730472, 0.06536657, 0.7671331, 1, 1, 1, 1, 1,
0.4737336, -0.7256379, 1.322008, 1, 1, 1, 1, 1,
0.4754224, -0.8849291, 3.939458, 1, 1, 1, 1, 1,
0.4790509, 1.493769, 1.239974, 1, 1, 1, 1, 1,
0.4839597, 1.079355, 0.5927109, 1, 1, 1, 1, 1,
0.4975747, -0.5079517, 2.138277, 1, 1, 1, 1, 1,
0.4999346, -0.4552468, 2.974247, 1, 1, 1, 1, 1,
0.5007273, -0.4829379, 2.945773, 1, 1, 1, 1, 1,
0.5031096, 0.29428, 0.4415394, 1, 1, 1, 1, 1,
0.5070758, 0.2390728, 0.9755934, 1, 1, 1, 1, 1,
0.5182499, -0.4641813, 2.754519, 1, 1, 1, 1, 1,
0.5192882, -0.2349797, -0.2724663, 1, 1, 1, 1, 1,
0.5196795, 0.2499944, 2.576653, 0, 0, 1, 1, 1,
0.520063, 2.525443, 0.218176, 1, 0, 0, 1, 1,
0.522225, -0.219731, 1.730874, 1, 0, 0, 1, 1,
0.5234717, -1.164687, 1.025229, 1, 0, 0, 1, 1,
0.5260156, -0.07120536, 3.279406, 1, 0, 0, 1, 1,
0.5334261, 1.250944, 1.480074, 1, 0, 0, 1, 1,
0.5392626, -0.8347859, 2.476401, 0, 0, 0, 1, 1,
0.5394549, -0.2973744, 2.831302, 0, 0, 0, 1, 1,
0.541891, -0.01046107, -0.8248739, 0, 0, 0, 1, 1,
0.5432991, 0.8519353, 1.485623, 0, 0, 0, 1, 1,
0.5433357, -0.1533846, 1.384281, 0, 0, 0, 1, 1,
0.5441287, 0.2179799, 2.487384, 0, 0, 0, 1, 1,
0.5463547, -0.3454486, -0.04091043, 0, 0, 0, 1, 1,
0.5481802, -0.8637113, 3.076528, 1, 1, 1, 1, 1,
0.5483789, -0.3613422, 2.275264, 1, 1, 1, 1, 1,
0.5491862, 0.6127745, 0.2630325, 1, 1, 1, 1, 1,
0.5500941, -0.5404744, 2.405284, 1, 1, 1, 1, 1,
0.5503476, -0.2029554, 2.436927, 1, 1, 1, 1, 1,
0.5527567, 0.5853332, 0.4622908, 1, 1, 1, 1, 1,
0.554939, -1.181834, 3.668487, 1, 1, 1, 1, 1,
0.5568656, -0.646163, 2.582307, 1, 1, 1, 1, 1,
0.5671314, -1.252428, 1.519109, 1, 1, 1, 1, 1,
0.5737686, 1.210161, 0.3913302, 1, 1, 1, 1, 1,
0.5750923, 1.004512, 1.810867, 1, 1, 1, 1, 1,
0.5751296, -0.2689129, 2.700034, 1, 1, 1, 1, 1,
0.5814881, 1.130007, 1.834476, 1, 1, 1, 1, 1,
0.5851607, -0.4154796, 1.702815, 1, 1, 1, 1, 1,
0.5877345, 2.689674, 1.77062, 1, 1, 1, 1, 1,
0.5916129, -1.511673, 1.447715, 0, 0, 1, 1, 1,
0.5987608, -0.5748023, 3.531413, 1, 0, 0, 1, 1,
0.5998499, -0.8945611, 3.466418, 1, 0, 0, 1, 1,
0.6015495, -0.01317392, 2.787999, 1, 0, 0, 1, 1,
0.601638, 0.163377, 2.786763, 1, 0, 0, 1, 1,
0.60264, -0.3618123, -0.08538354, 1, 0, 0, 1, 1,
0.6064848, -1.507968, 1.853245, 0, 0, 0, 1, 1,
0.6115003, -1.207661, 2.888022, 0, 0, 0, 1, 1,
0.6144298, 0.7524962, 1.081451, 0, 0, 0, 1, 1,
0.6150436, 0.7330784, 0.7470921, 0, 0, 0, 1, 1,
0.6153287, 1.162079, 1.959782, 0, 0, 0, 1, 1,
0.6153865, 0.7484254, -0.5362667, 0, 0, 0, 1, 1,
0.6181178, 0.5561222, -0.02520535, 0, 0, 0, 1, 1,
0.6288208, 0.3576885, 2.5905, 1, 1, 1, 1, 1,
0.6298375, -1.615508, 2.063964, 1, 1, 1, 1, 1,
0.6319182, -0.3262161, 0.6164501, 1, 1, 1, 1, 1,
0.6354005, 0.8728001, 1.710198, 1, 1, 1, 1, 1,
0.6379061, -1.901273, 1.398302, 1, 1, 1, 1, 1,
0.6381255, 0.02237802, 1.572762, 1, 1, 1, 1, 1,
0.6409567, 2.009875, 0.2194731, 1, 1, 1, 1, 1,
0.646171, 1.316858, -0.1801249, 1, 1, 1, 1, 1,
0.6503524, -0.7645646, 3.362221, 1, 1, 1, 1, 1,
0.6561201, -0.4349325, 1.079486, 1, 1, 1, 1, 1,
0.6646299, 0.649715, 2.329829, 1, 1, 1, 1, 1,
0.6689647, 0.3838198, 0.9240518, 1, 1, 1, 1, 1,
0.6707888, -1.663928, 3.806213, 1, 1, 1, 1, 1,
0.6720052, 0.6260788, 0.8632216, 1, 1, 1, 1, 1,
0.6765866, 0.4709454, 1.371335, 1, 1, 1, 1, 1,
0.677431, 1.487052, 0.3527587, 0, 0, 1, 1, 1,
0.6775425, -0.2153484, 2.567705, 1, 0, 0, 1, 1,
0.677588, 0.5024562, 1.627337, 1, 0, 0, 1, 1,
0.6782573, 0.4196207, 1.322648, 1, 0, 0, 1, 1,
0.6910347, 0.8329125, 2.924742, 1, 0, 0, 1, 1,
0.6937672, 0.141213, -0.6617178, 1, 0, 0, 1, 1,
0.6939214, 2.438731, 2.597301, 0, 0, 0, 1, 1,
0.6940837, 0.8836614, -0.2313352, 0, 0, 0, 1, 1,
0.6972043, 2.461164, 0.1393554, 0, 0, 0, 1, 1,
0.700575, 0.1949489, 1.687111, 0, 0, 0, 1, 1,
0.7013521, 0.3757748, 2.060148, 0, 0, 0, 1, 1,
0.7034352, -0.3671636, 2.869883, 0, 0, 0, 1, 1,
0.7074543, -0.703089, 2.606516, 0, 0, 0, 1, 1,
0.7084795, 1.204185, -0.06721292, 1, 1, 1, 1, 1,
0.7087464, 1.073452, 1.496616, 1, 1, 1, 1, 1,
0.7096959, -1.944365, 1.221325, 1, 1, 1, 1, 1,
0.7100058, 2.138885, -0.7997947, 1, 1, 1, 1, 1,
0.7115794, -2.016015, 1.631396, 1, 1, 1, 1, 1,
0.7176169, -1.595399, 1.699705, 1, 1, 1, 1, 1,
0.7185324, 1.526477, -0.01739092, 1, 1, 1, 1, 1,
0.7237376, -0.5783148, 2.252742, 1, 1, 1, 1, 1,
0.7338874, 1.335841, 1.561809, 1, 1, 1, 1, 1,
0.7400532, 1.210086, 1.478466, 1, 1, 1, 1, 1,
0.7415658, 1.040633, -0.3254426, 1, 1, 1, 1, 1,
0.7452617, -2.029408, 3.712924, 1, 1, 1, 1, 1,
0.7453156, -1.109278, 1.138679, 1, 1, 1, 1, 1,
0.7476215, -0.3127981, 2.177211, 1, 1, 1, 1, 1,
0.7496573, -2.54574, 2.395836, 1, 1, 1, 1, 1,
0.7604955, -2.901593, 3.380677, 0, 0, 1, 1, 1,
0.7605101, 0.8719341, 1.351569, 1, 0, 0, 1, 1,
0.7648699, 2.244003, -0.8981526, 1, 0, 0, 1, 1,
0.7656743, -0.06789741, 1.871023, 1, 0, 0, 1, 1,
0.7667859, 1.046385, 1.375753, 1, 0, 0, 1, 1,
0.7677783, 0.2702717, 1.119548, 1, 0, 0, 1, 1,
0.7731172, 0.7031754, 1.05487, 0, 0, 0, 1, 1,
0.7738863, 0.331615, 2.491462, 0, 0, 0, 1, 1,
0.7777045, 0.312881, 3.092063, 0, 0, 0, 1, 1,
0.7801446, -0.8180652, -0.001516847, 0, 0, 0, 1, 1,
0.7843879, 0.8237122, 1.513206, 0, 0, 0, 1, 1,
0.7863209, -0.8208563, 3.788665, 0, 0, 0, 1, 1,
0.7886935, -0.6949857, 2.125743, 0, 0, 0, 1, 1,
0.7918383, 0.5534896, 0.1726384, 1, 1, 1, 1, 1,
0.7994623, -0.8426756, 1.360451, 1, 1, 1, 1, 1,
0.8010167, -0.9308617, 2.512849, 1, 1, 1, 1, 1,
0.8023759, -1.022349, 0.7569643, 1, 1, 1, 1, 1,
0.8034974, 0.2310995, 0.7079532, 1, 1, 1, 1, 1,
0.8064597, 0.730764, 0.4286081, 1, 1, 1, 1, 1,
0.8071051, 0.0009820198, 2.591465, 1, 1, 1, 1, 1,
0.8112392, 0.6925262, 1.989564, 1, 1, 1, 1, 1,
0.8116066, 0.5937948, 0.7151397, 1, 1, 1, 1, 1,
0.8116845, 1.358074, 2.034261, 1, 1, 1, 1, 1,
0.8146514, -0.7616473, 2.056139, 1, 1, 1, 1, 1,
0.8152938, -0.3002579, 1.703685, 1, 1, 1, 1, 1,
0.8158459, -0.3095409, 1.587417, 1, 1, 1, 1, 1,
0.8199805, 0.0269092, 2.305635, 1, 1, 1, 1, 1,
0.8213372, 0.7672307, 0.4654567, 1, 1, 1, 1, 1,
0.8221133, 0.949324, 1.799313, 0, 0, 1, 1, 1,
0.8240861, 1.034962, 1.365557, 1, 0, 0, 1, 1,
0.827265, 0.2673583, 0.7832323, 1, 0, 0, 1, 1,
0.8338585, 2.474372, 0.885864, 1, 0, 0, 1, 1,
0.8357823, -0.9990798, 1.724307, 1, 0, 0, 1, 1,
0.8398685, 0.5765487, -0.2006444, 1, 0, 0, 1, 1,
0.8401563, 0.3126132, 1.670539, 0, 0, 0, 1, 1,
0.8489211, 0.06239414, 1.993333, 0, 0, 0, 1, 1,
0.859087, 1.225862, 0.5784903, 0, 0, 0, 1, 1,
0.8617932, 0.6330129, 0.2988079, 0, 0, 0, 1, 1,
0.8648628, 1.640051, 0.4658951, 0, 0, 0, 1, 1,
0.869396, -0.415267, 2.90116, 0, 0, 0, 1, 1,
0.8770689, 0.2670652, 2.963457, 0, 0, 0, 1, 1,
0.8782433, 0.1551756, 0.8940656, 1, 1, 1, 1, 1,
0.8915453, -0.03960209, 1.87098, 1, 1, 1, 1, 1,
0.8981481, -0.5903652, 2.631207, 1, 1, 1, 1, 1,
0.8988757, 1.169851, 0.897173, 1, 1, 1, 1, 1,
0.8999456, -0.1192791, 0.6010953, 1, 1, 1, 1, 1,
0.9072564, 1.118286, 1.88496, 1, 1, 1, 1, 1,
0.9138106, -0.5899378, -0.05271796, 1, 1, 1, 1, 1,
0.92761, 0.07018753, 2.029937, 1, 1, 1, 1, 1,
0.9279816, 1.207003, 2.160083, 1, 1, 1, 1, 1,
0.9292529, -0.1493837, 0.7036183, 1, 1, 1, 1, 1,
0.9342648, -0.5759056, 2.194739, 1, 1, 1, 1, 1,
0.9410169, -0.6223811, 3.416548, 1, 1, 1, 1, 1,
0.9415421, 0.6680486, 0.7609998, 1, 1, 1, 1, 1,
0.9458994, -0.9766461, 2.613704, 1, 1, 1, 1, 1,
0.9493086, -0.1253608, 0.5672441, 1, 1, 1, 1, 1,
0.950469, -0.07299998, 2.601427, 0, 0, 1, 1, 1,
0.9534983, -0.2422877, 1.608975, 1, 0, 0, 1, 1,
0.9628991, -0.3019559, 2.470394, 1, 0, 0, 1, 1,
0.9642337, -0.1304394, 0.6631603, 1, 0, 0, 1, 1,
0.9733381, -0.7354871, 1.799549, 1, 0, 0, 1, 1,
0.9768903, -1.738157, 1.835129, 1, 0, 0, 1, 1,
0.9891423, -0.9520882, 1.197819, 0, 0, 0, 1, 1,
0.9894999, 1.421131, 1.410995, 0, 0, 0, 1, 1,
0.9903, 0.2963436, 2.692745, 0, 0, 0, 1, 1,
1.002526, -2.166324, 2.905219, 0, 0, 0, 1, 1,
1.017315, -0.9896014, 2.959124, 0, 0, 0, 1, 1,
1.018045, 0.4490245, 2.957787, 0, 0, 0, 1, 1,
1.023814, -0.546194, 2.328975, 0, 0, 0, 1, 1,
1.030263, 0.6910092, -0.6581504, 1, 1, 1, 1, 1,
1.033722, -2.453276, 3.562743, 1, 1, 1, 1, 1,
1.04003, -1.954013, 2.261994, 1, 1, 1, 1, 1,
1.042176, -1.230504, 3.738387, 1, 1, 1, 1, 1,
1.044588, 0.5704553, 2.044902, 1, 1, 1, 1, 1,
1.045882, 0.04510901, 1.693894, 1, 1, 1, 1, 1,
1.058815, 0.01682289, 2.250953, 1, 1, 1, 1, 1,
1.06096, 2.022825, 0.7240793, 1, 1, 1, 1, 1,
1.061708, 0.2374259, 0.7243137, 1, 1, 1, 1, 1,
1.064386, 0.8599615, 0.8289272, 1, 1, 1, 1, 1,
1.07632, 0.3870377, 1.000919, 1, 1, 1, 1, 1,
1.077235, -0.5223224, 2.128575, 1, 1, 1, 1, 1,
1.085697, -0.9351667, 3.936647, 1, 1, 1, 1, 1,
1.087281, 0.6073607, -0.700788, 1, 1, 1, 1, 1,
1.101879, -1.697091, 3.252197, 1, 1, 1, 1, 1,
1.102169, -0.2026119, 2.466057, 0, 0, 1, 1, 1,
1.102602, -0.02274233, 1.118888, 1, 0, 0, 1, 1,
1.112089, 0.7693112, 0.8053293, 1, 0, 0, 1, 1,
1.113348, 0.07422777, 0.8325932, 1, 0, 0, 1, 1,
1.118634, 1.002694, 1.148777, 1, 0, 0, 1, 1,
1.119103, -0.180654, 2.174476, 1, 0, 0, 1, 1,
1.12292, 0.5320369, 1.60087, 0, 0, 0, 1, 1,
1.125176, 0.8044332, 0.693732, 0, 0, 0, 1, 1,
1.126871, -0.2232049, 0.8710557, 0, 0, 0, 1, 1,
1.131427, 0.6778013, 1.272318, 0, 0, 0, 1, 1,
1.13171, -1.801955, 2.200145, 0, 0, 0, 1, 1,
1.137385, -0.9049617, 2.885986, 0, 0, 0, 1, 1,
1.137584, 1.151795, 1.347973, 0, 0, 0, 1, 1,
1.141225, -0.2044569, 4.371958, 1, 1, 1, 1, 1,
1.151428, -1.005136, 1.885279, 1, 1, 1, 1, 1,
1.154308, 1.034813, 0.3573914, 1, 1, 1, 1, 1,
1.157506, 0.8842787, 0.2422884, 1, 1, 1, 1, 1,
1.170712, 0.1553339, 0.626813, 1, 1, 1, 1, 1,
1.173666, -0.1757268, 2.711112, 1, 1, 1, 1, 1,
1.176359, -1.703595, 2.505028, 1, 1, 1, 1, 1,
1.176591, -0.1084926, 1.661222, 1, 1, 1, 1, 1,
1.191144, 1.027342, 0.5720997, 1, 1, 1, 1, 1,
1.191341, 2.063303, 0.5060123, 1, 1, 1, 1, 1,
1.199033, 2.173184, 1.208797, 1, 1, 1, 1, 1,
1.201447, -1.327619, 4.477285, 1, 1, 1, 1, 1,
1.205548, -0.7429242, 2.344811, 1, 1, 1, 1, 1,
1.207733, -1.011562, 2.3295, 1, 1, 1, 1, 1,
1.210864, 1.088725, 1.22683, 1, 1, 1, 1, 1,
1.219285, 0.1706742, 1.565606, 0, 0, 1, 1, 1,
1.219694, -1.098921, 1.693298, 1, 0, 0, 1, 1,
1.220302, -0.1662913, 1.113449, 1, 0, 0, 1, 1,
1.220923, 1.066843, 0.1481565, 1, 0, 0, 1, 1,
1.222392, -1.669609, 2.522557, 1, 0, 0, 1, 1,
1.228922, -1.00108, 2.461218, 1, 0, 0, 1, 1,
1.229713, 0.1745228, -0.3648891, 0, 0, 0, 1, 1,
1.230974, -0.2105903, 1.941887, 0, 0, 0, 1, 1,
1.237917, -0.9354578, 3.363001, 0, 0, 0, 1, 1,
1.250869, -1.403413, 1.408371, 0, 0, 0, 1, 1,
1.261309, 1.202341, 1.151158, 0, 0, 0, 1, 1,
1.277857, -1.830181, 2.93864, 0, 0, 0, 1, 1,
1.278319, -0.2550251, 2.591772, 0, 0, 0, 1, 1,
1.281192, -0.5836002, 2.113427, 1, 1, 1, 1, 1,
1.285912, -2.557185, 1.701139, 1, 1, 1, 1, 1,
1.286954, -0.7007235, 2.282337, 1, 1, 1, 1, 1,
1.300739, 1.468631, 1.83882, 1, 1, 1, 1, 1,
1.302472, -0.05040402, 1.169625, 1, 1, 1, 1, 1,
1.308548, 0.6088403, 1.634935, 1, 1, 1, 1, 1,
1.310324, 1.034385, 0.9231874, 1, 1, 1, 1, 1,
1.326137, 0.40315, 1.602878, 1, 1, 1, 1, 1,
1.338671, -0.175317, 1.663019, 1, 1, 1, 1, 1,
1.342028, -0.3873142, 1.985827, 1, 1, 1, 1, 1,
1.343808, -0.1212915, 2.55968, 1, 1, 1, 1, 1,
1.354258, 1.16618, 1.81749, 1, 1, 1, 1, 1,
1.354669, -0.2347028, 0.7056205, 1, 1, 1, 1, 1,
1.356077, -1.30447, 1.987875, 1, 1, 1, 1, 1,
1.357059, 1.250534, 1.357929, 1, 1, 1, 1, 1,
1.358387, -0.1457019, 1.832466, 0, 0, 1, 1, 1,
1.360817, -1.834112, 2.927711, 1, 0, 0, 1, 1,
1.361414, -0.212119, 2.518247, 1, 0, 0, 1, 1,
1.362338, -0.3917069, 1.793719, 1, 0, 0, 1, 1,
1.381798, -0.4003799, 1.228944, 1, 0, 0, 1, 1,
1.401097, 2.329005, 1.823205, 1, 0, 0, 1, 1,
1.419991, -0.1105545, 1.247478, 0, 0, 0, 1, 1,
1.4224, 0.6666545, 0.9772412, 0, 0, 0, 1, 1,
1.42405, 0.3201219, -0.5310884, 0, 0, 0, 1, 1,
1.426345, 0.1142306, -0.33711, 0, 0, 0, 1, 1,
1.426707, -0.02292463, 1.517728, 0, 0, 0, 1, 1,
1.460673, -0.7321035, 1.173854, 0, 0, 0, 1, 1,
1.480661, -1.495297, 1.788004, 0, 0, 0, 1, 1,
1.481708, 0.27937, 0.29921, 1, 1, 1, 1, 1,
1.48852, -0.5978981, 1.710319, 1, 1, 1, 1, 1,
1.488873, 1.229949, 0.6059567, 1, 1, 1, 1, 1,
1.498172, -0.6054918, 0.8478786, 1, 1, 1, 1, 1,
1.503304, 0.2798547, 2.525318, 1, 1, 1, 1, 1,
1.509023, -1.659275, 3.396341, 1, 1, 1, 1, 1,
1.509091, -0.3346156, 2.569816, 1, 1, 1, 1, 1,
1.51743, 0.1048278, 3.124156, 1, 1, 1, 1, 1,
1.525596, -0.540159, -0.2178404, 1, 1, 1, 1, 1,
1.544404, -0.2696291, 1.195202, 1, 1, 1, 1, 1,
1.55118, 1.336202, -1.441978, 1, 1, 1, 1, 1,
1.558292, 1.46932, -0.589353, 1, 1, 1, 1, 1,
1.566189, -0.7122131, 2.627836, 1, 1, 1, 1, 1,
1.567974, 0.5379707, 2.08687, 1, 1, 1, 1, 1,
1.603027, -0.7199665, 1.126466, 1, 1, 1, 1, 1,
1.603809, -0.4764352, 1.58998, 0, 0, 1, 1, 1,
1.616037, 0.4566657, 1.202338, 1, 0, 0, 1, 1,
1.655348, 0.1818953, -0.3985903, 1, 0, 0, 1, 1,
1.656162, -0.01063116, 1.782809, 1, 0, 0, 1, 1,
1.664371, -2.113528, 2.519129, 1, 0, 0, 1, 1,
1.718416, -0.5236531, 3.862684, 1, 0, 0, 1, 1,
1.763871, 0.3023838, 1.444469, 0, 0, 0, 1, 1,
1.767815, -0.09939298, 1.144853, 0, 0, 0, 1, 1,
1.802907, 0.005832123, 1.122955, 0, 0, 0, 1, 1,
1.810569, 1.338764, -0.1853306, 0, 0, 0, 1, 1,
1.815096, -1.078661, 1.946766, 0, 0, 0, 1, 1,
1.820821, 1.245919, 0.4847912, 0, 0, 0, 1, 1,
1.829439, -2.057391, 3.997396, 0, 0, 0, 1, 1,
1.831106, 0.252028, 1.535388, 1, 1, 1, 1, 1,
1.852911, -0.1441117, 1.493343, 1, 1, 1, 1, 1,
1.855209, -0.798799, 1.551363, 1, 1, 1, 1, 1,
1.858184, 0.7491008, 0.6118868, 1, 1, 1, 1, 1,
1.89753, 0.9233918, -0.1141908, 1, 1, 1, 1, 1,
1.902782, 0.433886, -0.03433385, 1, 1, 1, 1, 1,
1.905462, 1.132758, -0.4743151, 1, 1, 1, 1, 1,
1.906116, 1.187755, -0.3683791, 1, 1, 1, 1, 1,
1.952146, -1.27916, 3.835528, 1, 1, 1, 1, 1,
1.962865, 0.5502456, 0.6780217, 1, 1, 1, 1, 1,
1.983539, -3.035424, 2.369026, 1, 1, 1, 1, 1,
1.997963, -0.8221226, 1.397703, 1, 1, 1, 1, 1,
2.000956, 0.6278538, 2.622553, 1, 1, 1, 1, 1,
2.003506, -1.286473, -0.2102858, 1, 1, 1, 1, 1,
2.023737, -1.144382, 2.424795, 1, 1, 1, 1, 1,
2.025517, 0.08370028, 2.933715, 0, 0, 1, 1, 1,
2.043774, 0.6074392, 2.290734, 1, 0, 0, 1, 1,
2.106421, 0.5380868, 0.5520217, 1, 0, 0, 1, 1,
2.108117, 0.4064418, 1.388745, 1, 0, 0, 1, 1,
2.111013, -1.605037, 1.298198, 1, 0, 0, 1, 1,
2.120567, 0.8409615, 1.298625, 1, 0, 0, 1, 1,
2.13713, -2.283555, 2.988661, 0, 0, 0, 1, 1,
2.137951, -1.34586, 1.801977, 0, 0, 0, 1, 1,
2.158609, 2.378867, 1.28754, 0, 0, 0, 1, 1,
2.171479, 0.03809186, 2.262665, 0, 0, 0, 1, 1,
2.257046, -1.840909, 2.438982, 0, 0, 0, 1, 1,
2.338802, -0.07176599, 2.234144, 0, 0, 0, 1, 1,
2.344984, 0.9596663, 2.327078, 0, 0, 0, 1, 1,
2.459546, 1.244476, 2.904517, 1, 1, 1, 1, 1,
2.492633, -0.5816227, 1.625267, 1, 1, 1, 1, 1,
2.541733, 0.02947648, 1.106473, 1, 1, 1, 1, 1,
2.546518, -0.1579019, 2.47684, 1, 1, 1, 1, 1,
2.587545, 0.6748801, -0.6304388, 1, 1, 1, 1, 1,
2.749542, 0.1153298, 0.6847586, 1, 1, 1, 1, 1,
2.750292, -0.8467932, 1.453141, 1, 1, 1, 1, 1
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
var radius = 9.296532;
var distance = 32.65368;
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
mvMatrix.translate( 0.2933848, 0.1253859, -0.1821463 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.65368);
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
