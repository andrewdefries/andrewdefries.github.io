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
-3.628829, 0.03641913, -0.2760943, 1, 0, 0, 1,
-3.4171, -3.797281, -2.837508, 1, 0.007843138, 0, 1,
-3.171211, -0.1847636, -1.036545, 1, 0.01176471, 0, 1,
-2.766117, -1.479357, -2.015302, 1, 0.01960784, 0, 1,
-2.69862, 1.070263, -0.4190578, 1, 0.02352941, 0, 1,
-2.628323, 1.400049, -2.748891, 1, 0.03137255, 0, 1,
-2.625585, -0.6369865, -1.284411, 1, 0.03529412, 0, 1,
-2.613399, 0.5571555, -1.8008, 1, 0.04313726, 0, 1,
-2.404029, -0.6858509, -2.116394, 1, 0.04705882, 0, 1,
-2.401719, 1.35131, -2.132308, 1, 0.05490196, 0, 1,
-2.383438, -1.128487, -2.685595, 1, 0.05882353, 0, 1,
-2.29408, 1.19653, -1.608266, 1, 0.06666667, 0, 1,
-2.29006, 0.09572249, -2.524764, 1, 0.07058824, 0, 1,
-2.235922, -0.6501244, -2.118023, 1, 0.07843138, 0, 1,
-2.212507, -2.507117, -1.391244, 1, 0.08235294, 0, 1,
-2.186506, 0.1843345, -0.6770838, 1, 0.09019608, 0, 1,
-2.055854, -0.2512393, -0.8633242, 1, 0.09411765, 0, 1,
-2.05512, 0.1479853, -2.043878, 1, 0.1019608, 0, 1,
-2.035892, -2.078089, -1.027104, 1, 0.1098039, 0, 1,
-2.03253, -0.3702724, -1.61974, 1, 0.1137255, 0, 1,
-2.025936, 0.7851104, -1.191586, 1, 0.1215686, 0, 1,
-2.024604, 0.7749627, -1.579283, 1, 0.1254902, 0, 1,
-2.010546, -0.4093582, -1.361852, 1, 0.1333333, 0, 1,
-1.996482, -0.395658, -2.557902, 1, 0.1372549, 0, 1,
-1.976024, 1.626381, -0.3800102, 1, 0.145098, 0, 1,
-1.973187, -2.564879, -1.93392, 1, 0.1490196, 0, 1,
-1.971603, -0.2262438, -1.257378, 1, 0.1568628, 0, 1,
-1.967684, -1.181952, -2.566471, 1, 0.1607843, 0, 1,
-1.918395, -0.3092213, -1.428094, 1, 0.1686275, 0, 1,
-1.911492, 0.6600901, -2.622112, 1, 0.172549, 0, 1,
-1.909037, -0.6926879, -1.966888, 1, 0.1803922, 0, 1,
-1.890839, 0.8057383, -1.860838, 1, 0.1843137, 0, 1,
-1.876178, 0.6920584, -0.8064347, 1, 0.1921569, 0, 1,
-1.865153, 0.1431063, -1.498928, 1, 0.1960784, 0, 1,
-1.860793, -0.8594323, -1.036007, 1, 0.2039216, 0, 1,
-1.848913, 1.003832, -0.9438097, 1, 0.2117647, 0, 1,
-1.841712, 0.302142, -0.4691256, 1, 0.2156863, 0, 1,
-1.826317, 0.5342357, -2.045343, 1, 0.2235294, 0, 1,
-1.824463, -1.656652, -2.02086, 1, 0.227451, 0, 1,
-1.810098, -0.9812078, -2.532285, 1, 0.2352941, 0, 1,
-1.800226, -0.8361265, -1.88436, 1, 0.2392157, 0, 1,
-1.795391, -0.8088315, -3.02143, 1, 0.2470588, 0, 1,
-1.756642, -1.242806, -0.7340837, 1, 0.2509804, 0, 1,
-1.754892, -0.6555573, -0.9743243, 1, 0.2588235, 0, 1,
-1.740094, -1.575802, -1.089034, 1, 0.2627451, 0, 1,
-1.724639, 0.9621546, -1.684265, 1, 0.2705882, 0, 1,
-1.722841, -2.342728, -1.996591, 1, 0.2745098, 0, 1,
-1.721986, -1.328078, -1.558531, 1, 0.282353, 0, 1,
-1.721529, 0.4037985, -0.7424195, 1, 0.2862745, 0, 1,
-1.711422, -1.380469, -1.883498, 1, 0.2941177, 0, 1,
-1.708452, 0.4015897, 0.4898664, 1, 0.3019608, 0, 1,
-1.708, -2.017677, -2.832589, 1, 0.3058824, 0, 1,
-1.706165, 1.553468, -0.06838719, 1, 0.3137255, 0, 1,
-1.702932, 0.4274678, -0.9497751, 1, 0.3176471, 0, 1,
-1.68999, 0.005168837, -1.652027, 1, 0.3254902, 0, 1,
-1.683684, 0.7215273, -1.065724, 1, 0.3294118, 0, 1,
-1.682014, 0.3194883, 0.2956003, 1, 0.3372549, 0, 1,
-1.672589, 1.714535, -2.229701, 1, 0.3411765, 0, 1,
-1.667857, -0.4817336, -2.189603, 1, 0.3490196, 0, 1,
-1.663782, -0.4843214, -1.181625, 1, 0.3529412, 0, 1,
-1.654716, -0.1224127, -1.580975, 1, 0.3607843, 0, 1,
-1.632568, -1.091709, -1.426765, 1, 0.3647059, 0, 1,
-1.590925, 0.1247221, -0.6301779, 1, 0.372549, 0, 1,
-1.582572, -0.9273646, 0.1718009, 1, 0.3764706, 0, 1,
-1.579207, -1.929088, -1.910412, 1, 0.3843137, 0, 1,
-1.577578, -0.4560225, -2.289716, 1, 0.3882353, 0, 1,
-1.552136, 1.755029, 0.2074589, 1, 0.3960784, 0, 1,
-1.548206, 0.4166795, 0.2996365, 1, 0.4039216, 0, 1,
-1.538393, -0.9378726, -2.563109, 1, 0.4078431, 0, 1,
-1.534967, 0.4408758, -1.792639, 1, 0.4156863, 0, 1,
-1.527809, -0.8735539, -2.273924, 1, 0.4196078, 0, 1,
-1.513429, -0.8946596, -3.02634, 1, 0.427451, 0, 1,
-1.500593, 1.637559, -1.176926, 1, 0.4313726, 0, 1,
-1.500231, 0.1910176, -2.97293, 1, 0.4392157, 0, 1,
-1.481269, -0.5124345, -3.224563, 1, 0.4431373, 0, 1,
-1.479978, -0.04675753, -2.480151, 1, 0.4509804, 0, 1,
-1.478953, 0.2008328, -2.578079, 1, 0.454902, 0, 1,
-1.470201, 1.041927, -1.331782, 1, 0.4627451, 0, 1,
-1.469021, -0.2514876, 0.1063651, 1, 0.4666667, 0, 1,
-1.456163, 0.2871696, -1.272089, 1, 0.4745098, 0, 1,
-1.450101, 0.7891721, -1.487871, 1, 0.4784314, 0, 1,
-1.446543, -0.6392199, -1.350093, 1, 0.4862745, 0, 1,
-1.441167, -0.8390393, -1.675141, 1, 0.4901961, 0, 1,
-1.431173, 1.067016, -2.603448, 1, 0.4980392, 0, 1,
-1.42977, 1.363679, -0.01942827, 1, 0.5058824, 0, 1,
-1.429219, -0.9451353, -0.4725972, 1, 0.509804, 0, 1,
-1.424059, 1.364796, -1.177004, 1, 0.5176471, 0, 1,
-1.402319, 1.018383, -3.304672, 1, 0.5215687, 0, 1,
-1.398624, -0.9210361, -2.337893, 1, 0.5294118, 0, 1,
-1.396884, 0.8372509, -0.6561166, 1, 0.5333334, 0, 1,
-1.391043, 0.2865264, -2.656913, 1, 0.5411765, 0, 1,
-1.390309, -0.7531857, -0.8133529, 1, 0.5450981, 0, 1,
-1.378482, 0.07230546, -2.11361, 1, 0.5529412, 0, 1,
-1.372203, 0.1042844, -1.446161, 1, 0.5568628, 0, 1,
-1.371798, 0.2133346, -0.9958656, 1, 0.5647059, 0, 1,
-1.351691, 1.239329, -2.128458, 1, 0.5686275, 0, 1,
-1.348245, -1.201005, -2.839865, 1, 0.5764706, 0, 1,
-1.332379, 0.9135112, -0.7998485, 1, 0.5803922, 0, 1,
-1.330438, -1.317009, -3.60579, 1, 0.5882353, 0, 1,
-1.302685, -1.99496, -0.1011602, 1, 0.5921569, 0, 1,
-1.294828, -1.144414, -2.115669, 1, 0.6, 0, 1,
-1.294499, -0.28725, -0.7922176, 1, 0.6078432, 0, 1,
-1.294314, -0.2799812, -3.239715, 1, 0.6117647, 0, 1,
-1.28688, 0.8865354, -3.144687, 1, 0.6196079, 0, 1,
-1.28596, -1.537615, -1.391583, 1, 0.6235294, 0, 1,
-1.280554, -0.5989801, -1.114371, 1, 0.6313726, 0, 1,
-1.280299, 1.487818, -1.821437, 1, 0.6352941, 0, 1,
-1.27512, -1.317669, -2.322993, 1, 0.6431373, 0, 1,
-1.268192, 0.5277743, -1.799494, 1, 0.6470588, 0, 1,
-1.25971, 1.675861, -1.297956, 1, 0.654902, 0, 1,
-1.251258, -0.6238584, -2.044038, 1, 0.6588235, 0, 1,
-1.249933, 2.545716, 0.9981153, 1, 0.6666667, 0, 1,
-1.2417, -0.5872476, -3.225161, 1, 0.6705883, 0, 1,
-1.228123, 0.7526119, -0.5692558, 1, 0.6784314, 0, 1,
-1.225918, 0.4642225, -0.1008455, 1, 0.682353, 0, 1,
-1.22302, -0.5358633, -0.2231674, 1, 0.6901961, 0, 1,
-1.2218, -0.008217688, -1.28597, 1, 0.6941177, 0, 1,
-1.213005, -0.2038141, -2.064995, 1, 0.7019608, 0, 1,
-1.211845, -1.659243, -3.614171, 1, 0.7098039, 0, 1,
-1.196484, 0.6178305, -1.676948, 1, 0.7137255, 0, 1,
-1.186251, -0.8604795, -2.153126, 1, 0.7215686, 0, 1,
-1.183029, -0.07325923, 0.368502, 1, 0.7254902, 0, 1,
-1.181337, 0.003994395, -2.677155, 1, 0.7333333, 0, 1,
-1.179559, 1.749395, 0.8932773, 1, 0.7372549, 0, 1,
-1.173097, 1.073572, -1.97756, 1, 0.7450981, 0, 1,
-1.171181, -0.1339237, -1.762751, 1, 0.7490196, 0, 1,
-1.170037, -0.2793009, -0.7758453, 1, 0.7568628, 0, 1,
-1.161425, -1.677873, -0.07660363, 1, 0.7607843, 0, 1,
-1.158927, 0.9413607, -2.724522, 1, 0.7686275, 0, 1,
-1.152246, -1.212023, -2.962642, 1, 0.772549, 0, 1,
-1.145831, 0.2926182, -0.5681928, 1, 0.7803922, 0, 1,
-1.143967, -0.6544939, -1.51796, 1, 0.7843137, 0, 1,
-1.140762, 0.2938053, -2.235857, 1, 0.7921569, 0, 1,
-1.129403, 1.027814, 0.1058659, 1, 0.7960784, 0, 1,
-1.115602, -1.498119, -3.761018, 1, 0.8039216, 0, 1,
-1.113483, 0.4378889, -2.071848, 1, 0.8117647, 0, 1,
-1.112817, 0.6958603, -1.080067, 1, 0.8156863, 0, 1,
-1.110538, 0.9978117, -0.3739555, 1, 0.8235294, 0, 1,
-1.110147, -1.150903, -2.460762, 1, 0.827451, 0, 1,
-1.099845, -0.5317593, -2.298645, 1, 0.8352941, 0, 1,
-1.091245, -1.049751, -0.4916306, 1, 0.8392157, 0, 1,
-1.088916, 0.5113059, -0.6250085, 1, 0.8470588, 0, 1,
-1.086841, 1.266986, -0.8647737, 1, 0.8509804, 0, 1,
-1.07721, -0.3049917, -1.758937, 1, 0.8588235, 0, 1,
-1.074886, -0.3436469, -2.689591, 1, 0.8627451, 0, 1,
-1.072857, 0.9781078, -0.5519583, 1, 0.8705882, 0, 1,
-1.071498, -0.5084816, -3.84453, 1, 0.8745098, 0, 1,
-1.070894, 0.5583977, -1.818085, 1, 0.8823529, 0, 1,
-1.068555, -0.8862082, -2.110958, 1, 0.8862745, 0, 1,
-1.064865, 0.724876, -2.987088, 1, 0.8941177, 0, 1,
-1.062532, 0.8831398, -2.593151, 1, 0.8980392, 0, 1,
-1.061237, 0.1247553, -0.4385162, 1, 0.9058824, 0, 1,
-1.059467, -1.041667, -4.094465, 1, 0.9137255, 0, 1,
-1.059126, -2.188305, -3.626277, 1, 0.9176471, 0, 1,
-1.055318, -0.195, -0.9828242, 1, 0.9254902, 0, 1,
-1.041923, 0.3795106, -0.3603496, 1, 0.9294118, 0, 1,
-1.039944, -0.6484138, -2.689825, 1, 0.9372549, 0, 1,
-1.032002, -2.394742, -1.535486, 1, 0.9411765, 0, 1,
-1.030466, 1.17076, -0.4524606, 1, 0.9490196, 0, 1,
-1.023997, 0.3237187, -0.4178396, 1, 0.9529412, 0, 1,
-1.021981, -1.415561, -2.449325, 1, 0.9607843, 0, 1,
-1.015123, 0.03133829, -1.701241, 1, 0.9647059, 0, 1,
-1.012211, -0.6620254, -2.701917, 1, 0.972549, 0, 1,
-1.009861, 2.270748, -0.3685639, 1, 0.9764706, 0, 1,
-1.006975, 0.7734839, -1.849471, 1, 0.9843137, 0, 1,
-1.005684, -0.4990852, -4.103675, 1, 0.9882353, 0, 1,
-0.9980456, -1.094342, -1.775666, 1, 0.9960784, 0, 1,
-0.9965255, -0.3631631, -1.166676, 0.9960784, 1, 0, 1,
-0.9960709, 0.5062924, -2.104564, 0.9921569, 1, 0, 1,
-0.9950613, 0.4703492, -1.98919, 0.9843137, 1, 0, 1,
-0.9919834, -0.7865736, -1.016743, 0.9803922, 1, 0, 1,
-0.9858608, 0.4202963, -0.07156086, 0.972549, 1, 0, 1,
-0.9822081, -1.255683, -1.929535, 0.9686275, 1, 0, 1,
-0.980114, -0.5465029, -2.024111, 0.9607843, 1, 0, 1,
-0.9706717, 1.901788, -0.7374325, 0.9568627, 1, 0, 1,
-0.968906, -1.421857, -1.435146, 0.9490196, 1, 0, 1,
-0.9663292, 0.190098, -1.094802, 0.945098, 1, 0, 1,
-0.9644909, 1.47369, -1.226661, 0.9372549, 1, 0, 1,
-0.9637496, 0.5075017, -1.267556, 0.9333333, 1, 0, 1,
-0.9624278, 1.229997, -0.08814412, 0.9254902, 1, 0, 1,
-0.959555, 1.632474, 0.3125021, 0.9215686, 1, 0, 1,
-0.9581181, 1.444566, -0.4089022, 0.9137255, 1, 0, 1,
-0.9575549, 0.3213173, 0.1471786, 0.9098039, 1, 0, 1,
-0.9407998, -0.64741, -2.989279, 0.9019608, 1, 0, 1,
-0.9345843, -0.3215361, -1.531793, 0.8941177, 1, 0, 1,
-0.9218925, 0.4334993, -2.094001, 0.8901961, 1, 0, 1,
-0.9181968, -1.620493, -2.810113, 0.8823529, 1, 0, 1,
-0.9178435, 0.4278373, -1.461472, 0.8784314, 1, 0, 1,
-0.907344, 0.2508241, -2.444512, 0.8705882, 1, 0, 1,
-0.9057595, -0.04488813, -1.873272, 0.8666667, 1, 0, 1,
-0.9055377, 0.9594178, -0.9517534, 0.8588235, 1, 0, 1,
-0.9035303, -0.3467021, -3.261331, 0.854902, 1, 0, 1,
-0.8983141, -1.201779, -2.58993, 0.8470588, 1, 0, 1,
-0.8942013, 1.341072, -0.1591918, 0.8431373, 1, 0, 1,
-0.8871301, 0.2347972, -1.273414, 0.8352941, 1, 0, 1,
-0.8839121, -0.2649475, -1.795435, 0.8313726, 1, 0, 1,
-0.8762875, 1.42444, -1.836853, 0.8235294, 1, 0, 1,
-0.8750389, 0.0307483, -1.939209, 0.8196079, 1, 0, 1,
-0.8712004, 0.04190928, -2.607179, 0.8117647, 1, 0, 1,
-0.870582, -1.281483, -3.839808, 0.8078431, 1, 0, 1,
-0.869324, -1.22118, -2.994595, 0.8, 1, 0, 1,
-0.8686321, 0.4855241, 0.2073775, 0.7921569, 1, 0, 1,
-0.8645726, -0.6137425, -4.061569, 0.7882353, 1, 0, 1,
-0.8634545, 0.7119432, -2.322173, 0.7803922, 1, 0, 1,
-0.8590078, -0.2089054, -0.04664903, 0.7764706, 1, 0, 1,
-0.8565547, -0.4498684, -1.072791, 0.7686275, 1, 0, 1,
-0.8564504, -1.039285, -1.255519, 0.7647059, 1, 0, 1,
-0.8536267, -0.875785, -3.825718, 0.7568628, 1, 0, 1,
-0.8518589, 0.1530818, -1.811669, 0.7529412, 1, 0, 1,
-0.831269, -1.725765, -2.893514, 0.7450981, 1, 0, 1,
-0.8308676, 0.09006001, -1.909345, 0.7411765, 1, 0, 1,
-0.8183681, -0.3201818, -1.917414, 0.7333333, 1, 0, 1,
-0.818332, -1.808188, 0.2731206, 0.7294118, 1, 0, 1,
-0.8149161, 1.016911, -1.041502, 0.7215686, 1, 0, 1,
-0.8135408, -0.2003376, -1.830789, 0.7176471, 1, 0, 1,
-0.8070615, -0.8988158, -2.488241, 0.7098039, 1, 0, 1,
-0.8045499, -0.8860264, -2.419551, 0.7058824, 1, 0, 1,
-0.8025414, -0.4648494, -0.6689622, 0.6980392, 1, 0, 1,
-0.8004287, -1.432123, -3.48663, 0.6901961, 1, 0, 1,
-0.7988076, -0.5005175, -3.283923, 0.6862745, 1, 0, 1,
-0.7972564, 0.4397146, 0.4213703, 0.6784314, 1, 0, 1,
-0.7971495, -0.7882737, -1.800094, 0.6745098, 1, 0, 1,
-0.7959462, 0.3772275, 0.5887798, 0.6666667, 1, 0, 1,
-0.7896932, -0.8151532, -2.538193, 0.6627451, 1, 0, 1,
-0.7872385, -0.6785083, -2.302807, 0.654902, 1, 0, 1,
-0.7778078, -1.278402, -2.855253, 0.6509804, 1, 0, 1,
-0.7754133, 0.8931901, 0.08410992, 0.6431373, 1, 0, 1,
-0.7749305, -1.865451, -2.649504, 0.6392157, 1, 0, 1,
-0.7728459, 1.873216, 0.2756232, 0.6313726, 1, 0, 1,
-0.7696176, -1.077976, -3.711165, 0.627451, 1, 0, 1,
-0.7688187, 1.852735, -0.04252952, 0.6196079, 1, 0, 1,
-0.7683128, 0.4189622, -1.902321, 0.6156863, 1, 0, 1,
-0.7675695, -0.5036547, -2.453797, 0.6078432, 1, 0, 1,
-0.7654727, -0.4318085, 0.5865127, 0.6039216, 1, 0, 1,
-0.7652275, -0.06171403, -1.170822, 0.5960785, 1, 0, 1,
-0.7612504, -1.257438, -4.499952, 0.5882353, 1, 0, 1,
-0.7596332, 0.6402572, -0.7277893, 0.5843138, 1, 0, 1,
-0.7595516, 0.2955873, -0.9997411, 0.5764706, 1, 0, 1,
-0.7592552, 0.6280388, 0.1795981, 0.572549, 1, 0, 1,
-0.7574228, -0.9775878, -1.622822, 0.5647059, 1, 0, 1,
-0.7566418, -1.774394, -5.006829, 0.5607843, 1, 0, 1,
-0.7506118, -0.3460074, -0.8876041, 0.5529412, 1, 0, 1,
-0.749455, 0.7506033, -1.529847, 0.5490196, 1, 0, 1,
-0.7454659, 0.9224953, -1.461146, 0.5411765, 1, 0, 1,
-0.7417388, 0.1180043, -0.00727532, 0.5372549, 1, 0, 1,
-0.7401626, 2.25183, -0.8023824, 0.5294118, 1, 0, 1,
-0.7378809, 0.4922564, -1.174605, 0.5254902, 1, 0, 1,
-0.7342193, 0.03755909, -0.5629473, 0.5176471, 1, 0, 1,
-0.7318959, -0.8784566, -1.07245, 0.5137255, 1, 0, 1,
-0.7313555, -1.146431, -4.346331, 0.5058824, 1, 0, 1,
-0.7308773, -1.843287, -3.127832, 0.5019608, 1, 0, 1,
-0.7275988, -0.7877393, -2.346679, 0.4941176, 1, 0, 1,
-0.7232079, -0.5603262, -0.8411287, 0.4862745, 1, 0, 1,
-0.7231274, -0.01209799, -0.6676716, 0.4823529, 1, 0, 1,
-0.7205832, -0.1435374, -2.511176, 0.4745098, 1, 0, 1,
-0.7172911, 0.6058987, 0.4172978, 0.4705882, 1, 0, 1,
-0.7150854, -1.147127, -2.961092, 0.4627451, 1, 0, 1,
-0.7110283, -0.3403051, -0.882645, 0.4588235, 1, 0, 1,
-0.7108648, 0.4284996, -0.7289733, 0.4509804, 1, 0, 1,
-0.710079, 0.9321686, -1.454406, 0.4470588, 1, 0, 1,
-0.7096643, 0.5106974, 0.5797999, 0.4392157, 1, 0, 1,
-0.7096019, -0.5092191, -4.050564, 0.4352941, 1, 0, 1,
-0.7077547, 0.7924054, 0.494737, 0.427451, 1, 0, 1,
-0.7032847, 0.1575288, 0.01503898, 0.4235294, 1, 0, 1,
-0.7031704, -0.3309242, -1.305854, 0.4156863, 1, 0, 1,
-0.7031703, -1.585222, -1.73039, 0.4117647, 1, 0, 1,
-0.7013357, 0.4710605, -0.9421521, 0.4039216, 1, 0, 1,
-0.6988456, 0.7709625, -0.9242421, 0.3960784, 1, 0, 1,
-0.6931201, 0.05228081, -1.477647, 0.3921569, 1, 0, 1,
-0.6901562, -0.3875313, -0.467467, 0.3843137, 1, 0, 1,
-0.6884496, -0.612599, -2.044075, 0.3803922, 1, 0, 1,
-0.6770633, 0.2231549, -2.838889, 0.372549, 1, 0, 1,
-0.6749303, -1.377218, -3.277997, 0.3686275, 1, 0, 1,
-0.6719402, 0.4906236, 0.3296145, 0.3607843, 1, 0, 1,
-0.671677, -0.8930289, -4.286812, 0.3568628, 1, 0, 1,
-0.6706544, 2.242329, 0.6286502, 0.3490196, 1, 0, 1,
-0.6648491, -0.3140407, -2.197537, 0.345098, 1, 0, 1,
-0.6620806, -0.3641193, -3.175983, 0.3372549, 1, 0, 1,
-0.6613231, -1.283428, -4.528818, 0.3333333, 1, 0, 1,
-0.6570129, 0.7808828, 0.6759259, 0.3254902, 1, 0, 1,
-0.6553473, 0.8863016, -0.633867, 0.3215686, 1, 0, 1,
-0.6539817, 0.7391368, -0.9043071, 0.3137255, 1, 0, 1,
-0.6529469, 0.1998309, 0.5838984, 0.3098039, 1, 0, 1,
-0.6444641, 0.06423476, -0.8150721, 0.3019608, 1, 0, 1,
-0.6383787, 0.4089346, -0.1819757, 0.2941177, 1, 0, 1,
-0.6288759, -0.643416, -0.6739951, 0.2901961, 1, 0, 1,
-0.6212206, -1.470315, -4.079248, 0.282353, 1, 0, 1,
-0.619281, -0.8715795, -1.808963, 0.2784314, 1, 0, 1,
-0.6191732, 1.022759, -0.977581, 0.2705882, 1, 0, 1,
-0.6191576, 0.5798118, -1.420184, 0.2666667, 1, 0, 1,
-0.6167315, 2.289323, -0.5405017, 0.2588235, 1, 0, 1,
-0.6130659, -1.38533, -1.845313, 0.254902, 1, 0, 1,
-0.6126021, 0.3812678, -0.2512676, 0.2470588, 1, 0, 1,
-0.6098212, -0.3825769, -2.496881, 0.2431373, 1, 0, 1,
-0.6072347, 0.6612068, -1.02646, 0.2352941, 1, 0, 1,
-0.6052619, 1.194445, -1.351343, 0.2313726, 1, 0, 1,
-0.6046454, -1.644348, -3.478307, 0.2235294, 1, 0, 1,
-0.6005633, -1.045008, -0.8266597, 0.2196078, 1, 0, 1,
-0.59644, 0.8491623, -1.461981, 0.2117647, 1, 0, 1,
-0.5918698, -1.299705, -3.848447, 0.2078431, 1, 0, 1,
-0.5784375, 0.06619062, -2.093997, 0.2, 1, 0, 1,
-0.5781376, -0.3350027, -0.9600704, 0.1921569, 1, 0, 1,
-0.5731612, -0.3690773, -2.309648, 0.1882353, 1, 0, 1,
-0.5673185, -0.7165795, -3.935621, 0.1803922, 1, 0, 1,
-0.5622272, 0.5955456, -0.2762519, 0.1764706, 1, 0, 1,
-0.5528979, -3.550557, -2.451998, 0.1686275, 1, 0, 1,
-0.5514954, 0.02639396, -3.389396, 0.1647059, 1, 0, 1,
-0.5463142, -0.03950637, -0.4826272, 0.1568628, 1, 0, 1,
-0.5443224, 1.225998, 0.288318, 0.1529412, 1, 0, 1,
-0.5382876, -0.06259815, -2.651143, 0.145098, 1, 0, 1,
-0.5355843, -0.7594132, -3.060297, 0.1411765, 1, 0, 1,
-0.533662, 1.41699, 0.5314127, 0.1333333, 1, 0, 1,
-0.5311018, -0.5716389, -1.344332, 0.1294118, 1, 0, 1,
-0.5286701, 0.7031497, -1.330286, 0.1215686, 1, 0, 1,
-0.5243509, 0.7841618, 1.090637, 0.1176471, 1, 0, 1,
-0.5180666, -0.4043546, -1.742723, 0.1098039, 1, 0, 1,
-0.5153168, -1.532367, -4.470751, 0.1058824, 1, 0, 1,
-0.5140714, 0.6785387, -2.013777, 0.09803922, 1, 0, 1,
-0.5114444, -2.868619, -1.119053, 0.09019608, 1, 0, 1,
-0.510125, -0.3780421, -1.246718, 0.08627451, 1, 0, 1,
-0.5098732, -1.762766, -1.777566, 0.07843138, 1, 0, 1,
-0.5089846, -0.139695, -2.185451, 0.07450981, 1, 0, 1,
-0.5084503, -1.604349, -4.219255, 0.06666667, 1, 0, 1,
-0.5070039, -2.677454, -2.606683, 0.0627451, 1, 0, 1,
-0.5036697, -1.002347, -3.509446, 0.05490196, 1, 0, 1,
-0.4896833, 0.9557828, 2.847321, 0.05098039, 1, 0, 1,
-0.4889771, 3.21964, 0.8785727, 0.04313726, 1, 0, 1,
-0.4820393, 0.6907001, 0.1836215, 0.03921569, 1, 0, 1,
-0.4753665, 0.9949645, 0.6731403, 0.03137255, 1, 0, 1,
-0.4726297, -0.0918847, -2.335927, 0.02745098, 1, 0, 1,
-0.4720823, -0.1717782, -0.8694878, 0.01960784, 1, 0, 1,
-0.467032, -0.7174029, -3.32427, 0.01568628, 1, 0, 1,
-0.4659627, -0.1057916, -2.571787, 0.007843138, 1, 0, 1,
-0.4655394, 1.027599, 0.09600876, 0.003921569, 1, 0, 1,
-0.4630311, -1.762748, -3.73512, 0, 1, 0.003921569, 1,
-0.4573608, 0.2954899, -0.7523986, 0, 1, 0.01176471, 1,
-0.4548336, -0.1508632, -1.755048, 0, 1, 0.01568628, 1,
-0.4508512, -2.403417, -4.206032, 0, 1, 0.02352941, 1,
-0.4502125, 1.200557, -1.058304, 0, 1, 0.02745098, 1,
-0.4483603, -0.5879248, -1.461854, 0, 1, 0.03529412, 1,
-0.4468006, 0.9021023, -0.4369187, 0, 1, 0.03921569, 1,
-0.4451463, 0.03832165, -2.126331, 0, 1, 0.04705882, 1,
-0.4426106, -1.612686, -2.601418, 0, 1, 0.05098039, 1,
-0.4418124, 1.245613, -0.60096, 0, 1, 0.05882353, 1,
-0.4412865, -0.5748365, -1.986609, 0, 1, 0.0627451, 1,
-0.4411568, -2.271405, -2.454199, 0, 1, 0.07058824, 1,
-0.4408285, -0.78132, -2.158518, 0, 1, 0.07450981, 1,
-0.4386147, 0.461946, -1.416241, 0, 1, 0.08235294, 1,
-0.4381951, 0.4209019, -1.135696, 0, 1, 0.08627451, 1,
-0.4364446, -1.881417, -2.528244, 0, 1, 0.09411765, 1,
-0.4355008, 0.006837423, -1.052737, 0, 1, 0.1019608, 1,
-0.431386, 0.3013254, -0.9657368, 0, 1, 0.1058824, 1,
-0.4235585, 1.082727, -1.591036, 0, 1, 0.1137255, 1,
-0.4214597, 1.087921, -1.309993, 0, 1, 0.1176471, 1,
-0.4189247, -0.3181701, -2.051531, 0, 1, 0.1254902, 1,
-0.4168828, -0.4605808, -1.889375, 0, 1, 0.1294118, 1,
-0.415499, 1.096354, -0.6862209, 0, 1, 0.1372549, 1,
-0.4129827, -0.1592499, -2.011902, 0, 1, 0.1411765, 1,
-0.4126356, 0.3413941, -1.356974, 0, 1, 0.1490196, 1,
-0.4119773, -0.8985012, -2.091756, 0, 1, 0.1529412, 1,
-0.4098373, 1.832932, -1.17792, 0, 1, 0.1607843, 1,
-0.4061315, -2.563676, -2.490377, 0, 1, 0.1647059, 1,
-0.4035161, 1.283222, -0.1366482, 0, 1, 0.172549, 1,
-0.3955049, -0.1018688, -1.737934, 0, 1, 0.1764706, 1,
-0.3947739, 0.2493834, -2.724013, 0, 1, 0.1843137, 1,
-0.3923414, 0.6854822, -1.611624, 0, 1, 0.1882353, 1,
-0.3892469, -0.5388167, -2.536897, 0, 1, 0.1960784, 1,
-0.3884085, 0.4485129, -1.225561, 0, 1, 0.2039216, 1,
-0.3845979, 1.036389, -1.159767, 0, 1, 0.2078431, 1,
-0.38322, 0.20609, -0.9865801, 0, 1, 0.2156863, 1,
-0.3824362, 0.8445202, -0.03957686, 0, 1, 0.2196078, 1,
-0.3800648, -0.4906144, -4.575088, 0, 1, 0.227451, 1,
-0.3794308, -1.914477, -1.548393, 0, 1, 0.2313726, 1,
-0.3696941, -1.468435, -4.074606, 0, 1, 0.2392157, 1,
-0.3615303, -0.3670214, -0.6825624, 0, 1, 0.2431373, 1,
-0.3603202, 2.068636, 0.5168568, 0, 1, 0.2509804, 1,
-0.3592197, -0.9342072, -2.262362, 0, 1, 0.254902, 1,
-0.3584153, -1.188582, -2.11241, 0, 1, 0.2627451, 1,
-0.3583039, -1.017637, -2.21411, 0, 1, 0.2666667, 1,
-0.3582488, -1.065417, -2.073325, 0, 1, 0.2745098, 1,
-0.352902, 0.5483463, -0.847111, 0, 1, 0.2784314, 1,
-0.3508299, -1.247619, -1.564571, 0, 1, 0.2862745, 1,
-0.3489618, -0.4061514, -1.761713, 0, 1, 0.2901961, 1,
-0.3366812, -0.8789915, -2.674619, 0, 1, 0.2980392, 1,
-0.3357058, 1.053003, -0.4240052, 0, 1, 0.3058824, 1,
-0.3354108, -0.3448788, -2.24315, 0, 1, 0.3098039, 1,
-0.3346183, 1.443311, -0.1270972, 0, 1, 0.3176471, 1,
-0.3345793, -0.7701314, -2.024194, 0, 1, 0.3215686, 1,
-0.333591, -0.3808014, -3.075158, 0, 1, 0.3294118, 1,
-0.3293719, -0.4200112, -2.274427, 0, 1, 0.3333333, 1,
-0.3277056, 1.647642, -0.9596193, 0, 1, 0.3411765, 1,
-0.3225599, -1.489209, -3.321358, 0, 1, 0.345098, 1,
-0.3204868, 0.8799879, -1.251403, 0, 1, 0.3529412, 1,
-0.3200157, -0.4677612, -1.793947, 0, 1, 0.3568628, 1,
-0.3195755, -0.3288078, -3.817795, 0, 1, 0.3647059, 1,
-0.3193209, 0.03235228, -1.161057, 0, 1, 0.3686275, 1,
-0.3179871, 0.2450056, -2.447385, 0, 1, 0.3764706, 1,
-0.3085776, -0.9192879, -2.138684, 0, 1, 0.3803922, 1,
-0.3072016, 0.1934631, -1.679118, 0, 1, 0.3882353, 1,
-0.307151, 1.044134, 1.167683, 0, 1, 0.3921569, 1,
-0.3065836, -0.07883913, -0.3409906, 0, 1, 0.4, 1,
-0.305829, -0.7912151, -2.297711, 0, 1, 0.4078431, 1,
-0.3016841, 0.9146245, 2.194142, 0, 1, 0.4117647, 1,
-0.2987339, -1.295293, -1.413723, 0, 1, 0.4196078, 1,
-0.292588, 0.5132148, 0.5876413, 0, 1, 0.4235294, 1,
-0.2924621, 1.490662, -0.387262, 0, 1, 0.4313726, 1,
-0.289316, 0.05948405, 0.4453343, 0, 1, 0.4352941, 1,
-0.2882255, -0.9180601, -3.771531, 0, 1, 0.4431373, 1,
-0.2869548, -0.7603347, -2.805076, 0, 1, 0.4470588, 1,
-0.2844883, -0.05734108, -1.719193, 0, 1, 0.454902, 1,
-0.2796927, -0.4011172, -0.2253103, 0, 1, 0.4588235, 1,
-0.2778939, 0.3588002, 0.3241404, 0, 1, 0.4666667, 1,
-0.2729023, 0.06406379, -2.118351, 0, 1, 0.4705882, 1,
-0.2673825, -0.2536363, -1.078399, 0, 1, 0.4784314, 1,
-0.2668495, 0.6841012, 0.6519679, 0, 1, 0.4823529, 1,
-0.2620212, -0.5852946, -1.986865, 0, 1, 0.4901961, 1,
-0.2546165, -0.2505935, -2.864162, 0, 1, 0.4941176, 1,
-0.250599, -2.126543, -3.094915, 0, 1, 0.5019608, 1,
-0.2486114, -0.3548754, -4.400745, 0, 1, 0.509804, 1,
-0.2471733, 2.246708, 0.3906382, 0, 1, 0.5137255, 1,
-0.2471219, -1.938465, -3.260606, 0, 1, 0.5215687, 1,
-0.2443561, -2.383965, -1.428922, 0, 1, 0.5254902, 1,
-0.2438545, 1.170086, 0.3682965, 0, 1, 0.5333334, 1,
-0.2420529, -0.9546001, -1.935548, 0, 1, 0.5372549, 1,
-0.2378699, 0.1918426, -0.6033635, 0, 1, 0.5450981, 1,
-0.2341681, -0.4392424, -1.45663, 0, 1, 0.5490196, 1,
-0.2339095, -0.2036979, -1.637275, 0, 1, 0.5568628, 1,
-0.2274271, -0.9263943, -2.013429, 0, 1, 0.5607843, 1,
-0.2265508, 0.516685, -0.5003434, 0, 1, 0.5686275, 1,
-0.2259896, 1.239888, -0.2471105, 0, 1, 0.572549, 1,
-0.2252724, -0.03762536, -0.4814155, 0, 1, 0.5803922, 1,
-0.2160201, 0.886534, -2.219188, 0, 1, 0.5843138, 1,
-0.2143901, -1.871806, -2.996658, 0, 1, 0.5921569, 1,
-0.2122186, 0.9406258, 0.2803362, 0, 1, 0.5960785, 1,
-0.2112774, -0.09297404, -1.86064, 0, 1, 0.6039216, 1,
-0.208707, -1.332186, -2.989874, 0, 1, 0.6117647, 1,
-0.2069132, 0.1910363, 1.041148, 0, 1, 0.6156863, 1,
-0.193708, -1.346901, -1.697097, 0, 1, 0.6235294, 1,
-0.1924588, -0.3419235, -2.910362, 0, 1, 0.627451, 1,
-0.1904021, -0.4280897, -4.240856, 0, 1, 0.6352941, 1,
-0.1885152, -1.055166, -3.597104, 0, 1, 0.6392157, 1,
-0.1742461, 0.1748859, -1.307752, 0, 1, 0.6470588, 1,
-0.1724447, 0.0242974, -1.28339, 0, 1, 0.6509804, 1,
-0.1686276, -2.134724, -4.260554, 0, 1, 0.6588235, 1,
-0.1567344, 0.7360355, 1.013443, 0, 1, 0.6627451, 1,
-0.1527209, 0.4436029, -1.14989, 0, 1, 0.6705883, 1,
-0.1520786, -0.9646748, -4.645947, 0, 1, 0.6745098, 1,
-0.1515511, -0.3196859, -1.948339, 0, 1, 0.682353, 1,
-0.1474921, 0.3133811, -1.335007, 0, 1, 0.6862745, 1,
-0.1457877, 0.8168861, 0.3413728, 0, 1, 0.6941177, 1,
-0.1447866, 0.640237, -0.8046886, 0, 1, 0.7019608, 1,
-0.1414881, -0.6547453, -2.456934, 0, 1, 0.7058824, 1,
-0.1412452, 0.1431746, -0.2124572, 0, 1, 0.7137255, 1,
-0.1347014, -0.2878799, -2.940165, 0, 1, 0.7176471, 1,
-0.1272154, 1.303995, -0.4801524, 0, 1, 0.7254902, 1,
-0.1260679, -1.613027, -3.803348, 0, 1, 0.7294118, 1,
-0.1223902, 0.1651176, -1.383477, 0, 1, 0.7372549, 1,
-0.1223663, 0.2604388, 0.7476136, 0, 1, 0.7411765, 1,
-0.1210635, 1.81564, 0.406902, 0, 1, 0.7490196, 1,
-0.1160508, -1.262149, -3.175902, 0, 1, 0.7529412, 1,
-0.1145557, 1.571951, 0.2806836, 0, 1, 0.7607843, 1,
-0.113033, 0.2925333, 0.8484858, 0, 1, 0.7647059, 1,
-0.112769, 0.83699, -2.130038, 0, 1, 0.772549, 1,
-0.1107491, 0.6381876, -1.446978, 0, 1, 0.7764706, 1,
-0.1086317, -0.09208626, -0.9143998, 0, 1, 0.7843137, 1,
-0.1062678, 2.126576, 1.162151, 0, 1, 0.7882353, 1,
-0.101321, 0.6356086, -1.882668, 0, 1, 0.7960784, 1,
-0.09590437, 0.7484223, 0.4556108, 0, 1, 0.8039216, 1,
-0.09383, -1.556029, -4.42081, 0, 1, 0.8078431, 1,
-0.09297366, 0.2993295, 0.354873, 0, 1, 0.8156863, 1,
-0.09248496, 0.6805356, -1.138088, 0, 1, 0.8196079, 1,
-0.08851372, -0.1772097, -1.154521, 0, 1, 0.827451, 1,
-0.08681906, 0.128415, -1.156459, 0, 1, 0.8313726, 1,
-0.0850247, -1.066242, -1.061459, 0, 1, 0.8392157, 1,
-0.08242206, -1.579983, -4.08544, 0, 1, 0.8431373, 1,
-0.08169293, -0.2315514, -2.318614, 0, 1, 0.8509804, 1,
-0.08034281, 0.01369938, -1.800495, 0, 1, 0.854902, 1,
-0.07914715, 0.8946388, 0.7978569, 0, 1, 0.8627451, 1,
-0.07904001, 0.2222307, -0.7968025, 0, 1, 0.8666667, 1,
-0.07644799, 0.7482241, 0.2045284, 0, 1, 0.8745098, 1,
-0.07214352, -1.791713, -1.248, 0, 1, 0.8784314, 1,
-0.06999285, -0.1153257, -1.675167, 0, 1, 0.8862745, 1,
-0.06715848, -0.4200409, -2.93002, 0, 1, 0.8901961, 1,
-0.06640151, -0.5363104, -2.61438, 0, 1, 0.8980392, 1,
-0.06383924, -1.547238, -3.298488, 0, 1, 0.9058824, 1,
-0.05893115, -0.3176064, -2.373661, 0, 1, 0.9098039, 1,
-0.0581162, 1.381021, -1.174004, 0, 1, 0.9176471, 1,
-0.05637861, 0.6253499, -0.2645119, 0, 1, 0.9215686, 1,
-0.05474558, -1.240056, -5.459253, 0, 1, 0.9294118, 1,
-0.05135848, -1.662624, -4.212895, 0, 1, 0.9333333, 1,
-0.04354292, -0.3097527, -3.962253, 0, 1, 0.9411765, 1,
-0.04137485, 0.2702162, -1.007435, 0, 1, 0.945098, 1,
-0.03837009, -0.1606392, -4.481973, 0, 1, 0.9529412, 1,
-0.03565755, 0.004646726, -1.953465, 0, 1, 0.9568627, 1,
-0.03455547, 0.3249058, 0.3508815, 0, 1, 0.9647059, 1,
-0.03402505, 0.49045, -1.47386, 0, 1, 0.9686275, 1,
-0.03331963, 0.9744865, 0.2034863, 0, 1, 0.9764706, 1,
-0.03314709, -1.583896, -2.095395, 0, 1, 0.9803922, 1,
-0.03180402, 0.1080898, -0.1291418, 0, 1, 0.9882353, 1,
-0.02913186, -0.7434142, -3.47362, 0, 1, 0.9921569, 1,
-0.02890819, 0.04281216, -0.6753715, 0, 1, 1, 1,
-0.02671463, 0.8247625, 1.340843, 0, 0.9921569, 1, 1,
-0.02513334, 1.590498, 0.004460631, 0, 0.9882353, 1, 1,
-0.02465339, 0.9348599, -1.321588, 0, 0.9803922, 1, 1,
-0.01911844, -0.1665598, -3.159098, 0, 0.9764706, 1, 1,
-0.01702866, -0.7690079, -1.614809, 0, 0.9686275, 1, 1,
-0.009364096, -0.5088191, -2.663924, 0, 0.9647059, 1, 1,
-0.009296955, 0.7766479, -0.985128, 0, 0.9568627, 1, 1,
-0.005881563, 2.223732, -0.9168664, 0, 0.9529412, 1, 1,
-0.005387542, -0.2659708, -4.077922, 0, 0.945098, 1, 1,
0.004947952, -1.575011, 3.363107, 0, 0.9411765, 1, 1,
0.009636656, 0.1966805, 0.2693274, 0, 0.9333333, 1, 1,
0.01261573, -1.193847, 4.676089, 0, 0.9294118, 1, 1,
0.01539325, 0.8738528, 1.834528, 0, 0.9215686, 1, 1,
0.01603108, 1.069319, -0.6769753, 0, 0.9176471, 1, 1,
0.0182947, -0.6328608, 3.550704, 0, 0.9098039, 1, 1,
0.01890868, 0.7718174, 0.4103682, 0, 0.9058824, 1, 1,
0.02143118, 0.1428944, -0.2891563, 0, 0.8980392, 1, 1,
0.02595378, -1.410169, 3.35862, 0, 0.8901961, 1, 1,
0.02766426, -0.7400398, 4.226916, 0, 0.8862745, 1, 1,
0.02873198, -0.9716764, 2.890148, 0, 0.8784314, 1, 1,
0.03069079, -0.04419839, 4.72285, 0, 0.8745098, 1, 1,
0.0437135, 1.218362, 0.2850428, 0, 0.8666667, 1, 1,
0.04876111, -0.01972041, 0.6846911, 0, 0.8627451, 1, 1,
0.05649686, 0.3914675, -0.3439037, 0, 0.854902, 1, 1,
0.05985436, 1.035966, 1.273046, 0, 0.8509804, 1, 1,
0.06033032, 1.543525, 0.2540385, 0, 0.8431373, 1, 1,
0.0636145, -0.02894715, 3.248647, 0, 0.8392157, 1, 1,
0.06447908, 0.4085939, 0.4213001, 0, 0.8313726, 1, 1,
0.06663506, -0.2139661, 2.065283, 0, 0.827451, 1, 1,
0.06700419, 2.049227, 1.190727, 0, 0.8196079, 1, 1,
0.07018995, 0.7454004, 1.458205, 0, 0.8156863, 1, 1,
0.07271743, -0.8295936, 2.662231, 0, 0.8078431, 1, 1,
0.07668594, 0.9189836, 0.6019934, 0, 0.8039216, 1, 1,
0.07669371, -0.004367511, 0.7120488, 0, 0.7960784, 1, 1,
0.07848439, 0.891284, -0.01638739, 0, 0.7882353, 1, 1,
0.08208685, 0.3305048, -0.6680817, 0, 0.7843137, 1, 1,
0.08366771, -0.05523741, 0.8116367, 0, 0.7764706, 1, 1,
0.08706414, 0.9373167, 1.126234, 0, 0.772549, 1, 1,
0.08800603, 0.23799, 1.319718, 0, 0.7647059, 1, 1,
0.09044465, -1.055311, 1.138927, 0, 0.7607843, 1, 1,
0.09128743, -1.199234, 2.034359, 0, 0.7529412, 1, 1,
0.09899234, -0.8922266, 4.234725, 0, 0.7490196, 1, 1,
0.1052297, -0.5487171, 3.421446, 0, 0.7411765, 1, 1,
0.1078974, -0.4249981, 2.699202, 0, 0.7372549, 1, 1,
0.1079331, 0.1361213, 0.9231862, 0, 0.7294118, 1, 1,
0.1116459, -0.7979689, 4.631216, 0, 0.7254902, 1, 1,
0.1129956, 1.239776, -0.5896281, 0, 0.7176471, 1, 1,
0.1163579, -0.7305042, 1.230629, 0, 0.7137255, 1, 1,
0.1195032, 0.06719543, 0.7524837, 0, 0.7058824, 1, 1,
0.1200843, -0.7141755, 2.968621, 0, 0.6980392, 1, 1,
0.1201011, 1.351042, 0.8041692, 0, 0.6941177, 1, 1,
0.1207768, 0.6347032, 0.6447446, 0, 0.6862745, 1, 1,
0.1220681, -1.442842, 3.283447, 0, 0.682353, 1, 1,
0.131061, 0.2384609, 0.5919099, 0, 0.6745098, 1, 1,
0.1330441, -0.946658, 1.531992, 0, 0.6705883, 1, 1,
0.1332739, -1.596063, 4.231304, 0, 0.6627451, 1, 1,
0.1360395, -0.3380806, 1.531278, 0, 0.6588235, 1, 1,
0.1408539, 1.166762, 1.435893, 0, 0.6509804, 1, 1,
0.1540404, 1.239754, -0.5858236, 0, 0.6470588, 1, 1,
0.1561726, -0.2373654, 4.154477, 0, 0.6392157, 1, 1,
0.1590188, -1.152911, 2.412052, 0, 0.6352941, 1, 1,
0.1612151, -0.1003559, 2.171048, 0, 0.627451, 1, 1,
0.1617665, -1.60157, 3.605841, 0, 0.6235294, 1, 1,
0.1670904, -0.6314976, 2.038917, 0, 0.6156863, 1, 1,
0.1685396, -0.4833411, 3.79727, 0, 0.6117647, 1, 1,
0.1750293, 0.2732339, 0.548902, 0, 0.6039216, 1, 1,
0.1755595, 0.3226188, 0.07492662, 0, 0.5960785, 1, 1,
0.176297, -0.2247656, 2.282276, 0, 0.5921569, 1, 1,
0.1768524, -1.142515, 1.014906, 0, 0.5843138, 1, 1,
0.1786575, -0.2832629, 3.065711, 0, 0.5803922, 1, 1,
0.1790355, 0.9305008, 0.7978577, 0, 0.572549, 1, 1,
0.179717, -0.1290995, 1.300924, 0, 0.5686275, 1, 1,
0.1817512, 1.557679, 1.459188, 0, 0.5607843, 1, 1,
0.1932399, -0.417326, 2.698833, 0, 0.5568628, 1, 1,
0.1944173, -1.612772, 3.549989, 0, 0.5490196, 1, 1,
0.1957542, 0.6419799, 1.374127, 0, 0.5450981, 1, 1,
0.2011475, -1.405115, 1.60545, 0, 0.5372549, 1, 1,
0.2058569, -0.1530669, 2.922893, 0, 0.5333334, 1, 1,
0.2084258, 0.6056989, 0.548619, 0, 0.5254902, 1, 1,
0.2137433, 1.077448, -0.7512277, 0, 0.5215687, 1, 1,
0.2138999, -0.7835543, 2.194829, 0, 0.5137255, 1, 1,
0.2165475, -0.4046152, 2.693669, 0, 0.509804, 1, 1,
0.2179336, 0.06434912, 1.944993, 0, 0.5019608, 1, 1,
0.2191885, 0.170914, 0.5125561, 0, 0.4941176, 1, 1,
0.2343568, -0.9253969, 2.515675, 0, 0.4901961, 1, 1,
0.2361808, 0.6983531, -0.2011059, 0, 0.4823529, 1, 1,
0.2389005, -2.357131, 3.017578, 0, 0.4784314, 1, 1,
0.244084, 1.177708, 0.05527656, 0, 0.4705882, 1, 1,
0.2449271, -1.087853, 3.927571, 0, 0.4666667, 1, 1,
0.251314, 1.098635, -0.2237666, 0, 0.4588235, 1, 1,
0.2535041, 0.2894465, -0.1561396, 0, 0.454902, 1, 1,
0.2555048, -0.6501754, 0.05457061, 0, 0.4470588, 1, 1,
0.2581874, -0.6170074, 2.072489, 0, 0.4431373, 1, 1,
0.2644259, -2.291773, 1.795027, 0, 0.4352941, 1, 1,
0.2648669, 0.5537397, 0.3254811, 0, 0.4313726, 1, 1,
0.2657036, 0.5470926, -0.1205079, 0, 0.4235294, 1, 1,
0.2667904, -1.337526, 0.5009171, 0, 0.4196078, 1, 1,
0.2668117, 1.080321, -1.235877, 0, 0.4117647, 1, 1,
0.2691735, 0.5333108, 0.5656621, 0, 0.4078431, 1, 1,
0.2693878, -0.06941155, 0.2929282, 0, 0.4, 1, 1,
0.2764369, 0.3922453, -0.03857705, 0, 0.3921569, 1, 1,
0.2779357, 0.271191, 1.137574, 0, 0.3882353, 1, 1,
0.2794957, -0.8575236, 3.953556, 0, 0.3803922, 1, 1,
0.280757, -0.8278996, 2.018898, 0, 0.3764706, 1, 1,
0.281257, -0.3052283, 4.045129, 0, 0.3686275, 1, 1,
0.2822204, 1.234634, -1.757679, 0, 0.3647059, 1, 1,
0.2831274, -0.0537389, 2.016472, 0, 0.3568628, 1, 1,
0.2832726, 1.058171, -0.9646835, 0, 0.3529412, 1, 1,
0.2833, 1.495475, 0.6202281, 0, 0.345098, 1, 1,
0.2839401, 0.1158677, 1.587042, 0, 0.3411765, 1, 1,
0.2844854, -0.7061232, 4.361878, 0, 0.3333333, 1, 1,
0.2869106, -0.9617766, 1.853743, 0, 0.3294118, 1, 1,
0.2881113, -2.793602, 4.810323, 0, 0.3215686, 1, 1,
0.2915601, -1.201323, 3.151111, 0, 0.3176471, 1, 1,
0.2920496, 0.961883, 1.686256, 0, 0.3098039, 1, 1,
0.2921973, 0.4577905, 1.138371, 0, 0.3058824, 1, 1,
0.2931299, 0.181263, 1.513238, 0, 0.2980392, 1, 1,
0.2951216, -0.01411904, 2.610362, 0, 0.2901961, 1, 1,
0.2954995, 1.368428, -0.956939, 0, 0.2862745, 1, 1,
0.2964455, -1.311518, 2.678112, 0, 0.2784314, 1, 1,
0.3006342, 1.251741, -0.4521034, 0, 0.2745098, 1, 1,
0.3010334, 0.07844764, 1.663098, 0, 0.2666667, 1, 1,
0.3023645, 0.2317969, 0.4547021, 0, 0.2627451, 1, 1,
0.3099871, -0.0913357, 2.530406, 0, 0.254902, 1, 1,
0.311192, 0.326115, 0.2801525, 0, 0.2509804, 1, 1,
0.3113727, -0.8625868, 2.09612, 0, 0.2431373, 1, 1,
0.3140659, -0.5922434, 1.044876, 0, 0.2392157, 1, 1,
0.3171818, -0.2845733, 2.274032, 0, 0.2313726, 1, 1,
0.3173542, -0.03130798, -0.04616806, 0, 0.227451, 1, 1,
0.319314, -1.507921, 2.32594, 0, 0.2196078, 1, 1,
0.3207475, 1.17738, 1.469867, 0, 0.2156863, 1, 1,
0.3213798, 0.3451776, 0.6997247, 0, 0.2078431, 1, 1,
0.3297002, 1.372357, 0.6583393, 0, 0.2039216, 1, 1,
0.3338657, 1.222149, -0.367861, 0, 0.1960784, 1, 1,
0.3340497, 1.307667, 0.142446, 0, 0.1882353, 1, 1,
0.337503, -0.2833378, 3.990751, 0, 0.1843137, 1, 1,
0.3410639, -1.384405, 4.408595, 0, 0.1764706, 1, 1,
0.3433087, 0.5150943, 1.806894, 0, 0.172549, 1, 1,
0.3474844, 0.3624954, 0.1720444, 0, 0.1647059, 1, 1,
0.348483, 0.4053083, 0.7001467, 0, 0.1607843, 1, 1,
0.3581954, -0.8075261, 3.862923, 0, 0.1529412, 1, 1,
0.359741, 0.1268099, 1.023729, 0, 0.1490196, 1, 1,
0.3639899, -0.07359217, 1.554531, 0, 0.1411765, 1, 1,
0.3668104, -0.1397153, 1.951833, 0, 0.1372549, 1, 1,
0.3791526, -0.3818779, 2.420141, 0, 0.1294118, 1, 1,
0.3823628, 0.5906475, 0.802789, 0, 0.1254902, 1, 1,
0.3895269, 0.9550002, 1.372421, 0, 0.1176471, 1, 1,
0.3900111, 0.5118848, -0.2650901, 0, 0.1137255, 1, 1,
0.3938511, 1.603816, -0.2993039, 0, 0.1058824, 1, 1,
0.3938566, -2.462422, 1.467903, 0, 0.09803922, 1, 1,
0.3961599, 1.490208, 0.7030302, 0, 0.09411765, 1, 1,
0.4109195, 0.1904167, 0.5973948, 0, 0.08627451, 1, 1,
0.416455, 0.1241385, -0.03275707, 0, 0.08235294, 1, 1,
0.4165746, -0.1470513, 0.3450114, 0, 0.07450981, 1, 1,
0.4175282, -0.2535202, 1.846997, 0, 0.07058824, 1, 1,
0.42137, -0.4051948, 2.998316, 0, 0.0627451, 1, 1,
0.422441, -1.332439, 3.907168, 0, 0.05882353, 1, 1,
0.4351323, -0.6585959, 2.245451, 0, 0.05098039, 1, 1,
0.4438007, -1.463823, 3.556319, 0, 0.04705882, 1, 1,
0.4462712, 0.292792, 0.9273445, 0, 0.03921569, 1, 1,
0.4506361, -1.602177, 2.852553, 0, 0.03529412, 1, 1,
0.4509548, 1.594437, 1.205712, 0, 0.02745098, 1, 1,
0.4601735, -0.5413963, 1.735635, 0, 0.02352941, 1, 1,
0.4607696, 0.9500463, 2.107641, 0, 0.01568628, 1, 1,
0.4615526, 0.001710444, 2.185907, 0, 0.01176471, 1, 1,
0.4623224, 1.87186, 0.5388646, 0, 0.003921569, 1, 1,
0.4667121, 0.6199766, 1.800962, 0.003921569, 0, 1, 1,
0.4669609, 0.1862433, 2.424004, 0.007843138, 0, 1, 1,
0.470174, 0.7740838, -0.3844675, 0.01568628, 0, 1, 1,
0.4704068, 0.1977317, 0.9612235, 0.01960784, 0, 1, 1,
0.4740883, -1.802504, 3.0563, 0.02745098, 0, 1, 1,
0.4758105, 1.353853, -1.067061, 0.03137255, 0, 1, 1,
0.4792716, 0.9407566, -1.093364, 0.03921569, 0, 1, 1,
0.4799918, -1.471506, 2.079237, 0.04313726, 0, 1, 1,
0.4840287, 2.064258, 2.32142, 0.05098039, 0, 1, 1,
0.4845838, 0.382964, 0.5226375, 0.05490196, 0, 1, 1,
0.4865081, 0.4388326, 2.60031, 0.0627451, 0, 1, 1,
0.4872692, -3.006478, 3.674312, 0.06666667, 0, 1, 1,
0.4900813, -0.0707993, 4.051219, 0.07450981, 0, 1, 1,
0.4931473, 0.6132092, 2.128298, 0.07843138, 0, 1, 1,
0.494196, -0.379077, 2.948709, 0.08627451, 0, 1, 1,
0.5021687, 1.607997, 0.677648, 0.09019608, 0, 1, 1,
0.5075881, -1.738748, 2.461487, 0.09803922, 0, 1, 1,
0.5080943, 0.1650708, 1.264583, 0.1058824, 0, 1, 1,
0.5082101, -0.06600907, 1.917145, 0.1098039, 0, 1, 1,
0.5138628, -1.028994, 1.505163, 0.1176471, 0, 1, 1,
0.514438, 0.3382565, 0.04530172, 0.1215686, 0, 1, 1,
0.5166715, -2.855422, 3.069124, 0.1294118, 0, 1, 1,
0.5170251, 0.8887957, 0.8375254, 0.1333333, 0, 1, 1,
0.5181968, 0.3843222, 0.9166038, 0.1411765, 0, 1, 1,
0.5186737, -1.787602, 1.876737, 0.145098, 0, 1, 1,
0.5221398, 0.01195302, 3.127517, 0.1529412, 0, 1, 1,
0.5234225, 0.02131927, -0.1907105, 0.1568628, 0, 1, 1,
0.5252931, -0.9355984, 3.452401, 0.1647059, 0, 1, 1,
0.5260462, -0.2377164, 1.290453, 0.1686275, 0, 1, 1,
0.5262715, 0.2721099, 1.544056, 0.1764706, 0, 1, 1,
0.5338521, 0.2984701, -0.3312982, 0.1803922, 0, 1, 1,
0.5367296, -1.010339, 3.912542, 0.1882353, 0, 1, 1,
0.5466934, -0.8063362, 0.9708129, 0.1921569, 0, 1, 1,
0.5489762, -0.467704, 1.613856, 0.2, 0, 1, 1,
0.5535496, 1.024993, -0.2039833, 0.2078431, 0, 1, 1,
0.5573454, -0.7696925, 4.740203, 0.2117647, 0, 1, 1,
0.5636507, -0.3077184, 2.428518, 0.2196078, 0, 1, 1,
0.5649737, 1.015193, -0.1059091, 0.2235294, 0, 1, 1,
0.5675132, -0.5130874, 2.417222, 0.2313726, 0, 1, 1,
0.5679154, 0.08332496, 3.492939, 0.2352941, 0, 1, 1,
0.5684443, -0.2795545, 2.53396, 0.2431373, 0, 1, 1,
0.5832281, 0.4759459, 1.712307, 0.2470588, 0, 1, 1,
0.5838622, -1.115263, 2.738341, 0.254902, 0, 1, 1,
0.5863331, 0.1575118, 1.203805, 0.2588235, 0, 1, 1,
0.588353, 1.118125, 0.2460417, 0.2666667, 0, 1, 1,
0.5933771, 1.604786, 1.42106, 0.2705882, 0, 1, 1,
0.5960086, 1.4842, -1.192251, 0.2784314, 0, 1, 1,
0.5961056, 0.9297915, 1.470782, 0.282353, 0, 1, 1,
0.5986628, 0.1596721, 0.1411975, 0.2901961, 0, 1, 1,
0.6081523, -0.5666313, 2.080645, 0.2941177, 0, 1, 1,
0.6131141, -0.7084451, 3.891941, 0.3019608, 0, 1, 1,
0.6166078, -0.05027787, 2.475921, 0.3098039, 0, 1, 1,
0.6174431, 0.4686265, 0.2524658, 0.3137255, 0, 1, 1,
0.6176277, -0.8175275, 4.271161, 0.3215686, 0, 1, 1,
0.6199813, 0.1679082, 2.908128, 0.3254902, 0, 1, 1,
0.6256642, -0.9985871, 3.523687, 0.3333333, 0, 1, 1,
0.631867, -1.749766, 4.450566, 0.3372549, 0, 1, 1,
0.6335544, 0.07092886, 1.830708, 0.345098, 0, 1, 1,
0.6338965, 1.887825, -2.36294, 0.3490196, 0, 1, 1,
0.6360174, 0.6178341, 0.2035504, 0.3568628, 0, 1, 1,
0.6406966, -0.009452119, 0.6316653, 0.3607843, 0, 1, 1,
0.6416362, 2.296672, 0.9032331, 0.3686275, 0, 1, 1,
0.6419652, -0.9508814, 1.151132, 0.372549, 0, 1, 1,
0.6421183, -1.405441, 1.570493, 0.3803922, 0, 1, 1,
0.6424316, 0.2704422, 1.318618, 0.3843137, 0, 1, 1,
0.654356, 1.117058, 0.67007, 0.3921569, 0, 1, 1,
0.6557956, 0.4075593, 0.3993816, 0.3960784, 0, 1, 1,
0.6564625, 1.175389, 0.7142774, 0.4039216, 0, 1, 1,
0.6583499, 0.9695327, 1.683437, 0.4117647, 0, 1, 1,
0.6593863, 0.03587462, 2.097589, 0.4156863, 0, 1, 1,
0.6596726, -0.5127487, 1.102497, 0.4235294, 0, 1, 1,
0.6611496, 0.3493097, -0.4535764, 0.427451, 0, 1, 1,
0.6639621, -0.3067472, 1.245465, 0.4352941, 0, 1, 1,
0.6656331, 0.3062077, 1.551942, 0.4392157, 0, 1, 1,
0.6723263, 0.6715954, 2.351769, 0.4470588, 0, 1, 1,
0.6751724, -0.2475704, 1.469429, 0.4509804, 0, 1, 1,
0.6790155, -0.56696, 3.608887, 0.4588235, 0, 1, 1,
0.681514, 1.194149, 0.1705689, 0.4627451, 0, 1, 1,
0.6825233, -1.551123, 3.302536, 0.4705882, 0, 1, 1,
0.6841385, 1.16758, 1.351193, 0.4745098, 0, 1, 1,
0.6884236, 1.06893, 2.389375, 0.4823529, 0, 1, 1,
0.6914658, -0.4938703, 2.008195, 0.4862745, 0, 1, 1,
0.6927376, 0.2912869, -0.7402204, 0.4941176, 0, 1, 1,
0.6929438, -0.5691828, 2.212228, 0.5019608, 0, 1, 1,
0.693441, 0.04236998, 2.608899, 0.5058824, 0, 1, 1,
0.6940761, 1.450659, -0.4171412, 0.5137255, 0, 1, 1,
0.7014945, 2.440919, -0.5176054, 0.5176471, 0, 1, 1,
0.7100344, 0.4661203, 1.925444, 0.5254902, 0, 1, 1,
0.7103152, 1.099235, 2.029657, 0.5294118, 0, 1, 1,
0.7107487, 0.8128918, 1.875411, 0.5372549, 0, 1, 1,
0.7177352, -0.2939796, 0.4973725, 0.5411765, 0, 1, 1,
0.7195437, -0.5037043, 1.570726, 0.5490196, 0, 1, 1,
0.7234931, -0.7463257, 3.981516, 0.5529412, 0, 1, 1,
0.7244952, -0.03458549, 2.228053, 0.5607843, 0, 1, 1,
0.7273794, -0.2279969, 1.104381, 0.5647059, 0, 1, 1,
0.7327487, 0.7989971, 0.5920886, 0.572549, 0, 1, 1,
0.7331713, -0.3651692, 1.59452, 0.5764706, 0, 1, 1,
0.7348409, -0.08631143, 0.9625604, 0.5843138, 0, 1, 1,
0.7371188, 0.8070934, 1.24866, 0.5882353, 0, 1, 1,
0.7378985, 0.1794132, -0.438313, 0.5960785, 0, 1, 1,
0.7403705, 0.3445897, 0.5386692, 0.6039216, 0, 1, 1,
0.7590061, -0.538102, 1.780938, 0.6078432, 0, 1, 1,
0.7598566, -2.896016, 4.801207, 0.6156863, 0, 1, 1,
0.7621009, -0.1827424, 0.3173431, 0.6196079, 0, 1, 1,
0.7660272, -0.3771914, 1.48576, 0.627451, 0, 1, 1,
0.7660524, 0.6404549, 1.981348, 0.6313726, 0, 1, 1,
0.7673749, -1.596896, 3.464203, 0.6392157, 0, 1, 1,
0.770999, -0.6278201, 0.8226042, 0.6431373, 0, 1, 1,
0.7724606, -0.3802252, 1.280533, 0.6509804, 0, 1, 1,
0.7737931, 0.5602103, 1.562807, 0.654902, 0, 1, 1,
0.774615, 1.242357, -0.02577684, 0.6627451, 0, 1, 1,
0.7748109, -1.741131, 4.45912, 0.6666667, 0, 1, 1,
0.7754292, 0.3145618, 3.70069, 0.6745098, 0, 1, 1,
0.7851169, 1.009679, 0.8529725, 0.6784314, 0, 1, 1,
0.7882513, 0.335302, 1.818419, 0.6862745, 0, 1, 1,
0.789359, 0.8479139, 1.195144, 0.6901961, 0, 1, 1,
0.791438, 0.1340168, 2.715466, 0.6980392, 0, 1, 1,
0.7926757, 0.2759627, 1.15328, 0.7058824, 0, 1, 1,
0.7995433, -0.521538, 2.652899, 0.7098039, 0, 1, 1,
0.8007082, 0.2732667, -0.1879684, 0.7176471, 0, 1, 1,
0.8012732, -0.5984525, 2.941624, 0.7215686, 0, 1, 1,
0.804, 0.06750291, 0.1960782, 0.7294118, 0, 1, 1,
0.8114047, 0.5853239, 0.9279774, 0.7333333, 0, 1, 1,
0.8143039, -0.854697, 0.6123266, 0.7411765, 0, 1, 1,
0.8144966, -0.4292279, 4.045477, 0.7450981, 0, 1, 1,
0.8231522, -1.58145, 2.479271, 0.7529412, 0, 1, 1,
0.8309703, -2.97208, 2.006072, 0.7568628, 0, 1, 1,
0.8344168, 0.9121259, 2.413843, 0.7647059, 0, 1, 1,
0.8362926, -1.179499, 3.023638, 0.7686275, 0, 1, 1,
0.8371124, -1.494372, 3.936288, 0.7764706, 0, 1, 1,
0.8401279, 0.1612596, 2.44803, 0.7803922, 0, 1, 1,
0.8406187, 0.4599868, -0.2623149, 0.7882353, 0, 1, 1,
0.843024, 0.7146278, 1.045224, 0.7921569, 0, 1, 1,
0.8458453, -0.5279765, 1.570136, 0.8, 0, 1, 1,
0.8471479, -1.584542, 3.185426, 0.8078431, 0, 1, 1,
0.8481635, -0.9078133, 3.330865, 0.8117647, 0, 1, 1,
0.8533936, -0.2303321, 2.302631, 0.8196079, 0, 1, 1,
0.8555076, 0.2851242, 0.3502199, 0.8235294, 0, 1, 1,
0.858871, 1.540911, -0.6342006, 0.8313726, 0, 1, 1,
0.8644593, 2.398638, -2.410136, 0.8352941, 0, 1, 1,
0.8669528, 1.081527, -0.7258873, 0.8431373, 0, 1, 1,
0.8674191, 0.3567505, 1.267525, 0.8470588, 0, 1, 1,
0.8792252, -0.680681, 1.768701, 0.854902, 0, 1, 1,
0.8823155, -1.110371, 2.279537, 0.8588235, 0, 1, 1,
0.8930573, 0.6700484, 2.934808, 0.8666667, 0, 1, 1,
0.8945302, 0.3841944, 0.5455264, 0.8705882, 0, 1, 1,
0.8975331, -1.021929, 1.15545, 0.8784314, 0, 1, 1,
0.899954, -0.7159817, 1.785225, 0.8823529, 0, 1, 1,
0.9018796, 1.401108, 0.3198498, 0.8901961, 0, 1, 1,
0.9021556, 1.485884, -0.5246131, 0.8941177, 0, 1, 1,
0.9043469, -0.2061853, 1.88173, 0.9019608, 0, 1, 1,
0.9069875, -1.249365, 3.809115, 0.9098039, 0, 1, 1,
0.907604, 0.7486961, 2.223255, 0.9137255, 0, 1, 1,
0.9089563, 0.2937026, 0.4982148, 0.9215686, 0, 1, 1,
0.9140086, -1.350238, 1.035829, 0.9254902, 0, 1, 1,
0.9211539, 0.2890714, 0.955721, 0.9333333, 0, 1, 1,
0.924795, 0.5075143, 0.6298445, 0.9372549, 0, 1, 1,
0.936393, 1.565261, 2.067583, 0.945098, 0, 1, 1,
0.9371968, -0.3914847, 2.910407, 0.9490196, 0, 1, 1,
0.937676, 2.378134, -0.1761294, 0.9568627, 0, 1, 1,
0.9428574, 1.419518, 0.4635065, 0.9607843, 0, 1, 1,
0.946826, -0.9039729, 3.493207, 0.9686275, 0, 1, 1,
0.9509771, 0.4082261, 1.210333, 0.972549, 0, 1, 1,
0.9587368, 1.090077, 2.358069, 0.9803922, 0, 1, 1,
0.9729947, -0.9978162, 2.017373, 0.9843137, 0, 1, 1,
0.9745452, -3.258143, 3.89288, 0.9921569, 0, 1, 1,
0.9808448, 0.769366, 1.519045, 0.9960784, 0, 1, 1,
0.9896404, -0.0607251, 1.417247, 1, 0, 0.9960784, 1,
0.9998433, 1.286025, 1.596991, 1, 0, 0.9882353, 1,
1.005213, -0.08152604, 1.281141, 1, 0, 0.9843137, 1,
1.011844, -1.187048, 1.028901, 1, 0, 0.9764706, 1,
1.025166, -1.690683, 2.842162, 1, 0, 0.972549, 1,
1.029097, 0.3043289, 2.256979, 1, 0, 0.9647059, 1,
1.036264, -0.64982, 1.03652, 1, 0, 0.9607843, 1,
1.039896, -1.369797, 1.790664, 1, 0, 0.9529412, 1,
1.041346, -2.594055, 3.173779, 1, 0, 0.9490196, 1,
1.044823, 0.6919995, 1.962605, 1, 0, 0.9411765, 1,
1.055427, -0.3114698, 2.361613, 1, 0, 0.9372549, 1,
1.063251, 0.343631, 2.470251, 1, 0, 0.9294118, 1,
1.070895, 0.3194461, 2.064754, 1, 0, 0.9254902, 1,
1.075071, -0.3654673, 0.2681645, 1, 0, 0.9176471, 1,
1.079286, -1.387799, 2.096819, 1, 0, 0.9137255, 1,
1.081913, 1.815456, -0.1684076, 1, 0, 0.9058824, 1,
1.08909, 0.5673892, 2.551296, 1, 0, 0.9019608, 1,
1.090667, -1.67436, 2.682953, 1, 0, 0.8941177, 1,
1.095674, -0.8335449, 1.899621, 1, 0, 0.8862745, 1,
1.095756, -1.00061, 1.229841, 1, 0, 0.8823529, 1,
1.104331, -1.986326, 2.958045, 1, 0, 0.8745098, 1,
1.10448, 0.6204897, 0.9317918, 1, 0, 0.8705882, 1,
1.104799, -1.264303, 3.641098, 1, 0, 0.8627451, 1,
1.111441, 0.02254893, -0.3302023, 1, 0, 0.8588235, 1,
1.127191, 0.1677668, 2.123432, 1, 0, 0.8509804, 1,
1.129719, 0.03094053, 0.3222162, 1, 0, 0.8470588, 1,
1.131068, 0.70885, -1.553552, 1, 0, 0.8392157, 1,
1.135188, 0.9504771, 0.2790046, 1, 0, 0.8352941, 1,
1.135359, 0.9485668, -0.06063308, 1, 0, 0.827451, 1,
1.140109, 0.9275671, 1.065967, 1, 0, 0.8235294, 1,
1.147425, 1.038637, 0.9726684, 1, 0, 0.8156863, 1,
1.149309, -1.106899, 1.952156, 1, 0, 0.8117647, 1,
1.151494, -1.164197, 1.704304, 1, 0, 0.8039216, 1,
1.151974, 0.7255426, 0.5981204, 1, 0, 0.7960784, 1,
1.15249, 0.9712701, 1.569353, 1, 0, 0.7921569, 1,
1.161687, 0.7685736, 0.5789163, 1, 0, 0.7843137, 1,
1.163895, -0.8130426, 2.572916, 1, 0, 0.7803922, 1,
1.167582, -0.7832239, 2.482039, 1, 0, 0.772549, 1,
1.169653, 0.741223, 0.3669955, 1, 0, 0.7686275, 1,
1.184806, 1.733602, -1.543143, 1, 0, 0.7607843, 1,
1.199942, -1.736618, 1.714256, 1, 0, 0.7568628, 1,
1.200847, -0.01060697, 1.406989, 1, 0, 0.7490196, 1,
1.209104, 0.7682852, 1.879614, 1, 0, 0.7450981, 1,
1.210921, 0.02302847, 1.143297, 1, 0, 0.7372549, 1,
1.217556, 0.8484885, 1.493996, 1, 0, 0.7333333, 1,
1.224391, 1.551217, 1.853607, 1, 0, 0.7254902, 1,
1.224496, -0.1753568, 0.361881, 1, 0, 0.7215686, 1,
1.226137, 0.7711951, 0.1664482, 1, 0, 0.7137255, 1,
1.226428, 0.1213692, 1.989758, 1, 0, 0.7098039, 1,
1.235364, -0.8547325, 3.66448, 1, 0, 0.7019608, 1,
1.23831, 1.401024, 1.760222, 1, 0, 0.6941177, 1,
1.239063, 1.22292, 1.555862, 1, 0, 0.6901961, 1,
1.239182, 1.022642, -0.0945864, 1, 0, 0.682353, 1,
1.241496, -0.06305911, 1.769606, 1, 0, 0.6784314, 1,
1.248238, -0.3761629, 2.020815, 1, 0, 0.6705883, 1,
1.254256, -0.701107, 2.960394, 1, 0, 0.6666667, 1,
1.2602, -1.518727, 3.430553, 1, 0, 0.6588235, 1,
1.269649, -0.737212, 1.360359, 1, 0, 0.654902, 1,
1.273852, -0.0250001, 2.70573, 1, 0, 0.6470588, 1,
1.27729, 2.099701, -0.2443024, 1, 0, 0.6431373, 1,
1.289646, 0.2508911, 1.761614, 1, 0, 0.6352941, 1,
1.296166, 1.396613, 1.466642, 1, 0, 0.6313726, 1,
1.298656, 1.138022, 1.162206, 1, 0, 0.6235294, 1,
1.307398, -0.2774959, 1.732278, 1, 0, 0.6196079, 1,
1.310224, 0.6842496, 0.1970471, 1, 0, 0.6117647, 1,
1.316029, 0.6294286, 0.9877474, 1, 0, 0.6078432, 1,
1.318446, -0.5611584, 2.970499, 1, 0, 0.6, 1,
1.321154, 0.2439297, 2.003273, 1, 0, 0.5921569, 1,
1.327859, 0.2400771, 1.462657, 1, 0, 0.5882353, 1,
1.329571, 1.993722, 2.993134, 1, 0, 0.5803922, 1,
1.339164, 0.2690118, -0.1681808, 1, 0, 0.5764706, 1,
1.351269, -0.598679, 3.592465, 1, 0, 0.5686275, 1,
1.3515, 1.090736, 1.247161, 1, 0, 0.5647059, 1,
1.352719, 0.5143416, 1.939064, 1, 0, 0.5568628, 1,
1.370447, 0.3668243, 1.938606, 1, 0, 0.5529412, 1,
1.379447, -1.241728, 2.054344, 1, 0, 0.5450981, 1,
1.392107, -0.8602272, 1.239214, 1, 0, 0.5411765, 1,
1.396123, -0.6871996, 0.8105637, 1, 0, 0.5333334, 1,
1.403418, -0.4436825, 2.945238, 1, 0, 0.5294118, 1,
1.410455, 0.054028, 0.4982116, 1, 0, 0.5215687, 1,
1.421666, -2.486761, 2.195261, 1, 0, 0.5176471, 1,
1.438053, -0.9275913, 1.570147, 1, 0, 0.509804, 1,
1.451172, -1.046053, 2.917459, 1, 0, 0.5058824, 1,
1.453894, 1.1912, 0.8519083, 1, 0, 0.4980392, 1,
1.464585, -1.439589, 2.161784, 1, 0, 0.4901961, 1,
1.469376, 0.5263478, 0.03371703, 1, 0, 0.4862745, 1,
1.469527, 0.2105591, 1.218301, 1, 0, 0.4784314, 1,
1.479001, 0.7234873, 2.123889, 1, 0, 0.4745098, 1,
1.492624, 1.043594, 0.000104208, 1, 0, 0.4666667, 1,
1.492729, 0.3448288, 0.2056712, 1, 0, 0.4627451, 1,
1.493328, 0.1442636, 1.126715, 1, 0, 0.454902, 1,
1.496115, 1.5609, 0.5396656, 1, 0, 0.4509804, 1,
1.498569, -0.1940222, 0.9640309, 1, 0, 0.4431373, 1,
1.503423, -0.985783, 2.660763, 1, 0, 0.4392157, 1,
1.509145, -0.378298, 1.450973, 1, 0, 0.4313726, 1,
1.512053, 1.432652, -0.3660639, 1, 0, 0.427451, 1,
1.545605, 1.213721, -0.3839748, 1, 0, 0.4196078, 1,
1.59092, -0.3874812, 1.152318, 1, 0, 0.4156863, 1,
1.593943, -1.517664, 3.027359, 1, 0, 0.4078431, 1,
1.599267, -0.8929586, 3.883524, 1, 0, 0.4039216, 1,
1.613452, -0.8180868, 2.418169, 1, 0, 0.3960784, 1,
1.620152, -0.8708321, 0.330815, 1, 0, 0.3882353, 1,
1.639689, -1.856169, 1.529982, 1, 0, 0.3843137, 1,
1.65956, -0.0762524, 2.354413, 1, 0, 0.3764706, 1,
1.661163, 0.1165734, 2.519901, 1, 0, 0.372549, 1,
1.661803, -0.6789523, 2.387703, 1, 0, 0.3647059, 1,
1.668218, 0.01836454, 1.140037, 1, 0, 0.3607843, 1,
1.672678, -1.061926, 0.97005, 1, 0, 0.3529412, 1,
1.673051, 0.6249063, 0.3913661, 1, 0, 0.3490196, 1,
1.693492, 0.3003063, 1.547956, 1, 0, 0.3411765, 1,
1.711369, -0.1749993, 0.8297436, 1, 0, 0.3372549, 1,
1.723668, 1.083866, 0.6642357, 1, 0, 0.3294118, 1,
1.735469, -0.9140839, 1.909541, 1, 0, 0.3254902, 1,
1.756075, -0.7458918, 1.701466, 1, 0, 0.3176471, 1,
1.759728, 0.2946962, 2.171194, 1, 0, 0.3137255, 1,
1.773898, -0.9695752, 2.281137, 1, 0, 0.3058824, 1,
1.775283, -0.8434024, 2.962794, 1, 0, 0.2980392, 1,
1.777159, 2.133494, 0.2863011, 1, 0, 0.2941177, 1,
1.798487, -0.06223327, 2.292516, 1, 0, 0.2862745, 1,
1.805154, -0.7444921, 2.559622, 1, 0, 0.282353, 1,
1.811551, 0.4869565, 1.777695, 1, 0, 0.2745098, 1,
1.814025, -0.6550933, 4.262351, 1, 0, 0.2705882, 1,
1.826212, 0.759087, 2.691913, 1, 0, 0.2627451, 1,
1.830785, -0.2003154, 0.6380836, 1, 0, 0.2588235, 1,
1.837396, -0.9440976, 1.395145, 1, 0, 0.2509804, 1,
1.844273, -0.7222828, 2.079257, 1, 0, 0.2470588, 1,
1.852503, 1.447132, 0.438248, 1, 0, 0.2392157, 1,
1.886114, 2.047011, 0.4909037, 1, 0, 0.2352941, 1,
1.893294, 0.5231533, 1.230727, 1, 0, 0.227451, 1,
1.913379, 0.498766, 1.073512, 1, 0, 0.2235294, 1,
1.915464, -1.927815, 1.393122, 1, 0, 0.2156863, 1,
1.946724, -0.5319383, 2.291571, 1, 0, 0.2117647, 1,
1.949223, -0.4822132, 0.7851377, 1, 0, 0.2039216, 1,
1.952349, 1.411886, 0.7725427, 1, 0, 0.1960784, 1,
1.953002, 2.076492, -0.834365, 1, 0, 0.1921569, 1,
1.968635, -0.4791081, 0.4332565, 1, 0, 0.1843137, 1,
1.986021, 1.068496, 2.025629, 1, 0, 0.1803922, 1,
2.009959, -0.4564653, 2.057081, 1, 0, 0.172549, 1,
2.023628, -0.8386176, 1.757071, 1, 0, 0.1686275, 1,
2.028105, 0.5625021, -0.2188401, 1, 0, 0.1607843, 1,
2.032361, 0.6567752, 1.782969, 1, 0, 0.1568628, 1,
2.055409, 0.6031047, 1.315478, 1, 0, 0.1490196, 1,
2.061368, 0.6571692, 1.653613, 1, 0, 0.145098, 1,
2.078285, 0.9523997, 2.698374, 1, 0, 0.1372549, 1,
2.119857, -0.5806594, 1.219139, 1, 0, 0.1333333, 1,
2.166697, -0.001343276, 0.8289496, 1, 0, 0.1254902, 1,
2.186147, 1.005449, 0.3142547, 1, 0, 0.1215686, 1,
2.197895, 0.8613998, 0.7113255, 1, 0, 0.1137255, 1,
2.207001, -0.6130024, 2.40797, 1, 0, 0.1098039, 1,
2.225111, -0.2817352, 2.155236, 1, 0, 0.1019608, 1,
2.231288, 0.6620708, 1.51272, 1, 0, 0.09411765, 1,
2.231987, 0.1703129, -0.4171185, 1, 0, 0.09019608, 1,
2.240971, 0.8095072, 1.081655, 1, 0, 0.08235294, 1,
2.262394, 0.4112802, 0.6260603, 1, 0, 0.07843138, 1,
2.263045, -1.389431, 1.673428, 1, 0, 0.07058824, 1,
2.354308, -0.276237, 2.614026, 1, 0, 0.06666667, 1,
2.4129, -0.6514486, 2.408911, 1, 0, 0.05882353, 1,
2.480539, 0.3740259, 0.6500977, 1, 0, 0.05490196, 1,
2.521146, 0.1467268, -0.5684032, 1, 0, 0.04705882, 1,
2.666375, -0.92361, 1.579911, 1, 0, 0.04313726, 1,
2.682364, 0.1360733, 1.034643, 1, 0, 0.03529412, 1,
2.758109, -0.05409893, 1.90516, 1, 0, 0.03137255, 1,
2.93317, 1.116508, 0.5339872, 1, 0, 0.02352941, 1,
2.947445, -0.02457992, -0.4623215, 1, 0, 0.01960784, 1,
3.052891, 1.258359, 0.4536087, 1, 0, 0.01176471, 1,
3.185848, -1.065203, 3.183755, 1, 0, 0.007843138, 1
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
-0.2214909, -4.986649, -7.199946, 0, -0.5, 0.5, 0.5,
-0.2214909, -4.986649, -7.199946, 1, -0.5, 0.5, 0.5,
-0.2214909, -4.986649, -7.199946, 1, 1.5, 0.5, 0.5,
-0.2214909, -4.986649, -7.199946, 0, 1.5, 0.5, 0.5
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
-4.783917, -0.2888201, -7.199946, 0, -0.5, 0.5, 0.5,
-4.783917, -0.2888201, -7.199946, 1, -0.5, 0.5, 0.5,
-4.783917, -0.2888201, -7.199946, 1, 1.5, 0.5, 0.5,
-4.783917, -0.2888201, -7.199946, 0, 1.5, 0.5, 0.5
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
-4.783917, -4.986649, -0.324465, 0, -0.5, 0.5, 0.5,
-4.783917, -4.986649, -0.324465, 1, -0.5, 0.5, 0.5,
-4.783917, -4.986649, -0.324465, 1, 1.5, 0.5, 0.5,
-4.783917, -4.986649, -0.324465, 0, 1.5, 0.5, 0.5
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
-3, -3.902534, -5.613297,
3, -3.902534, -5.613297,
-3, -3.902534, -5.613297,
-3, -4.08322, -5.877738,
-2, -3.902534, -5.613297,
-2, -4.08322, -5.877738,
-1, -3.902534, -5.613297,
-1, -4.08322, -5.877738,
0, -3.902534, -5.613297,
0, -4.08322, -5.877738,
1, -3.902534, -5.613297,
1, -4.08322, -5.877738,
2, -3.902534, -5.613297,
2, -4.08322, -5.877738,
3, -3.902534, -5.613297,
3, -4.08322, -5.877738
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
-3, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
-3, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
-3, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
-3, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5,
-2, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
-2, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
-2, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
-2, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5,
-1, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
-1, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
-1, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
-1, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5,
0, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
0, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
0, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
0, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5,
1, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
1, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
1, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
1, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5,
2, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
2, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
2, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
2, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5,
3, -4.444592, -6.406622, 0, -0.5, 0.5, 0.5,
3, -4.444592, -6.406622, 1, -0.5, 0.5, 0.5,
3, -4.444592, -6.406622, 1, 1.5, 0.5, 0.5,
3, -4.444592, -6.406622, 0, 1.5, 0.5, 0.5
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
-3.731049, -2, -5.613297,
-3.731049, 2, -5.613297,
-3.731049, -2, -5.613297,
-3.906527, -2, -5.877738,
-3.731049, 0, -5.613297,
-3.906527, 0, -5.877738,
-3.731049, 2, -5.613297,
-3.906527, 2, -5.877738
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
-4.257483, -2, -6.406622, 0, -0.5, 0.5, 0.5,
-4.257483, -2, -6.406622, 1, -0.5, 0.5, 0.5,
-4.257483, -2, -6.406622, 1, 1.5, 0.5, 0.5,
-4.257483, -2, -6.406622, 0, 1.5, 0.5, 0.5,
-4.257483, 0, -6.406622, 0, -0.5, 0.5, 0.5,
-4.257483, 0, -6.406622, 1, -0.5, 0.5, 0.5,
-4.257483, 0, -6.406622, 1, 1.5, 0.5, 0.5,
-4.257483, 0, -6.406622, 0, 1.5, 0.5, 0.5,
-4.257483, 2, -6.406622, 0, -0.5, 0.5, 0.5,
-4.257483, 2, -6.406622, 1, -0.5, 0.5, 0.5,
-4.257483, 2, -6.406622, 1, 1.5, 0.5, 0.5,
-4.257483, 2, -6.406622, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.731049, -3.902534, -4,
-3.731049, -3.902534, 4,
-3.731049, -3.902534, -4,
-3.906527, -4.08322, -4,
-3.731049, -3.902534, -2,
-3.906527, -4.08322, -2,
-3.731049, -3.902534, 0,
-3.906527, -4.08322, 0,
-3.731049, -3.902534, 2,
-3.906527, -4.08322, 2,
-3.731049, -3.902534, 4,
-3.906527, -4.08322, 4
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
-4.257483, -4.444592, -4, 0, -0.5, 0.5, 0.5,
-4.257483, -4.444592, -4, 1, -0.5, 0.5, 0.5,
-4.257483, -4.444592, -4, 1, 1.5, 0.5, 0.5,
-4.257483, -4.444592, -4, 0, 1.5, 0.5, 0.5,
-4.257483, -4.444592, -2, 0, -0.5, 0.5, 0.5,
-4.257483, -4.444592, -2, 1, -0.5, 0.5, 0.5,
-4.257483, -4.444592, -2, 1, 1.5, 0.5, 0.5,
-4.257483, -4.444592, -2, 0, 1.5, 0.5, 0.5,
-4.257483, -4.444592, 0, 0, -0.5, 0.5, 0.5,
-4.257483, -4.444592, 0, 1, -0.5, 0.5, 0.5,
-4.257483, -4.444592, 0, 1, 1.5, 0.5, 0.5,
-4.257483, -4.444592, 0, 0, 1.5, 0.5, 0.5,
-4.257483, -4.444592, 2, 0, -0.5, 0.5, 0.5,
-4.257483, -4.444592, 2, 1, -0.5, 0.5, 0.5,
-4.257483, -4.444592, 2, 1, 1.5, 0.5, 0.5,
-4.257483, -4.444592, 2, 0, 1.5, 0.5, 0.5,
-4.257483, -4.444592, 4, 0, -0.5, 0.5, 0.5,
-4.257483, -4.444592, 4, 1, -0.5, 0.5, 0.5,
-4.257483, -4.444592, 4, 1, 1.5, 0.5, 0.5,
-4.257483, -4.444592, 4, 0, 1.5, 0.5, 0.5
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
-3.731049, -3.902534, -5.613297,
-3.731049, 3.324894, -5.613297,
-3.731049, -3.902534, 4.964367,
-3.731049, 3.324894, 4.964367,
-3.731049, -3.902534, -5.613297,
-3.731049, -3.902534, 4.964367,
-3.731049, 3.324894, -5.613297,
-3.731049, 3.324894, 4.964367,
-3.731049, -3.902534, -5.613297,
3.288068, -3.902534, -5.613297,
-3.731049, -3.902534, 4.964367,
3.288068, -3.902534, 4.964367,
-3.731049, 3.324894, -5.613297,
3.288068, 3.324894, -5.613297,
-3.731049, 3.324894, 4.964367,
3.288068, 3.324894, 4.964367,
3.288068, -3.902534, -5.613297,
3.288068, 3.324894, -5.613297,
3.288068, -3.902534, 4.964367,
3.288068, 3.324894, 4.964367,
3.288068, -3.902534, -5.613297,
3.288068, -3.902534, 4.964367,
3.288068, 3.324894, -5.613297,
3.288068, 3.324894, 4.964367
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
var radius = 7.800334;
var distance = 34.70457;
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
mvMatrix.translate( 0.2214909, 0.2888201, 0.324465 );
mvMatrix.scale( 1.201558, 1.166926, 0.7973287 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.70457);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Prothoate<-read.table("Prothoate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Prothoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
```

```r
y<-Prothoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
```

```r
z<-Prothoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
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
-3.628829, 0.03641913, -0.2760943, 0, 0, 1, 1, 1,
-3.4171, -3.797281, -2.837508, 1, 0, 0, 1, 1,
-3.171211, -0.1847636, -1.036545, 1, 0, 0, 1, 1,
-2.766117, -1.479357, -2.015302, 1, 0, 0, 1, 1,
-2.69862, 1.070263, -0.4190578, 1, 0, 0, 1, 1,
-2.628323, 1.400049, -2.748891, 1, 0, 0, 1, 1,
-2.625585, -0.6369865, -1.284411, 0, 0, 0, 1, 1,
-2.613399, 0.5571555, -1.8008, 0, 0, 0, 1, 1,
-2.404029, -0.6858509, -2.116394, 0, 0, 0, 1, 1,
-2.401719, 1.35131, -2.132308, 0, 0, 0, 1, 1,
-2.383438, -1.128487, -2.685595, 0, 0, 0, 1, 1,
-2.29408, 1.19653, -1.608266, 0, 0, 0, 1, 1,
-2.29006, 0.09572249, -2.524764, 0, 0, 0, 1, 1,
-2.235922, -0.6501244, -2.118023, 1, 1, 1, 1, 1,
-2.212507, -2.507117, -1.391244, 1, 1, 1, 1, 1,
-2.186506, 0.1843345, -0.6770838, 1, 1, 1, 1, 1,
-2.055854, -0.2512393, -0.8633242, 1, 1, 1, 1, 1,
-2.05512, 0.1479853, -2.043878, 1, 1, 1, 1, 1,
-2.035892, -2.078089, -1.027104, 1, 1, 1, 1, 1,
-2.03253, -0.3702724, -1.61974, 1, 1, 1, 1, 1,
-2.025936, 0.7851104, -1.191586, 1, 1, 1, 1, 1,
-2.024604, 0.7749627, -1.579283, 1, 1, 1, 1, 1,
-2.010546, -0.4093582, -1.361852, 1, 1, 1, 1, 1,
-1.996482, -0.395658, -2.557902, 1, 1, 1, 1, 1,
-1.976024, 1.626381, -0.3800102, 1, 1, 1, 1, 1,
-1.973187, -2.564879, -1.93392, 1, 1, 1, 1, 1,
-1.971603, -0.2262438, -1.257378, 1, 1, 1, 1, 1,
-1.967684, -1.181952, -2.566471, 1, 1, 1, 1, 1,
-1.918395, -0.3092213, -1.428094, 0, 0, 1, 1, 1,
-1.911492, 0.6600901, -2.622112, 1, 0, 0, 1, 1,
-1.909037, -0.6926879, -1.966888, 1, 0, 0, 1, 1,
-1.890839, 0.8057383, -1.860838, 1, 0, 0, 1, 1,
-1.876178, 0.6920584, -0.8064347, 1, 0, 0, 1, 1,
-1.865153, 0.1431063, -1.498928, 1, 0, 0, 1, 1,
-1.860793, -0.8594323, -1.036007, 0, 0, 0, 1, 1,
-1.848913, 1.003832, -0.9438097, 0, 0, 0, 1, 1,
-1.841712, 0.302142, -0.4691256, 0, 0, 0, 1, 1,
-1.826317, 0.5342357, -2.045343, 0, 0, 0, 1, 1,
-1.824463, -1.656652, -2.02086, 0, 0, 0, 1, 1,
-1.810098, -0.9812078, -2.532285, 0, 0, 0, 1, 1,
-1.800226, -0.8361265, -1.88436, 0, 0, 0, 1, 1,
-1.795391, -0.8088315, -3.02143, 1, 1, 1, 1, 1,
-1.756642, -1.242806, -0.7340837, 1, 1, 1, 1, 1,
-1.754892, -0.6555573, -0.9743243, 1, 1, 1, 1, 1,
-1.740094, -1.575802, -1.089034, 1, 1, 1, 1, 1,
-1.724639, 0.9621546, -1.684265, 1, 1, 1, 1, 1,
-1.722841, -2.342728, -1.996591, 1, 1, 1, 1, 1,
-1.721986, -1.328078, -1.558531, 1, 1, 1, 1, 1,
-1.721529, 0.4037985, -0.7424195, 1, 1, 1, 1, 1,
-1.711422, -1.380469, -1.883498, 1, 1, 1, 1, 1,
-1.708452, 0.4015897, 0.4898664, 1, 1, 1, 1, 1,
-1.708, -2.017677, -2.832589, 1, 1, 1, 1, 1,
-1.706165, 1.553468, -0.06838719, 1, 1, 1, 1, 1,
-1.702932, 0.4274678, -0.9497751, 1, 1, 1, 1, 1,
-1.68999, 0.005168837, -1.652027, 1, 1, 1, 1, 1,
-1.683684, 0.7215273, -1.065724, 1, 1, 1, 1, 1,
-1.682014, 0.3194883, 0.2956003, 0, 0, 1, 1, 1,
-1.672589, 1.714535, -2.229701, 1, 0, 0, 1, 1,
-1.667857, -0.4817336, -2.189603, 1, 0, 0, 1, 1,
-1.663782, -0.4843214, -1.181625, 1, 0, 0, 1, 1,
-1.654716, -0.1224127, -1.580975, 1, 0, 0, 1, 1,
-1.632568, -1.091709, -1.426765, 1, 0, 0, 1, 1,
-1.590925, 0.1247221, -0.6301779, 0, 0, 0, 1, 1,
-1.582572, -0.9273646, 0.1718009, 0, 0, 0, 1, 1,
-1.579207, -1.929088, -1.910412, 0, 0, 0, 1, 1,
-1.577578, -0.4560225, -2.289716, 0, 0, 0, 1, 1,
-1.552136, 1.755029, 0.2074589, 0, 0, 0, 1, 1,
-1.548206, 0.4166795, 0.2996365, 0, 0, 0, 1, 1,
-1.538393, -0.9378726, -2.563109, 0, 0, 0, 1, 1,
-1.534967, 0.4408758, -1.792639, 1, 1, 1, 1, 1,
-1.527809, -0.8735539, -2.273924, 1, 1, 1, 1, 1,
-1.513429, -0.8946596, -3.02634, 1, 1, 1, 1, 1,
-1.500593, 1.637559, -1.176926, 1, 1, 1, 1, 1,
-1.500231, 0.1910176, -2.97293, 1, 1, 1, 1, 1,
-1.481269, -0.5124345, -3.224563, 1, 1, 1, 1, 1,
-1.479978, -0.04675753, -2.480151, 1, 1, 1, 1, 1,
-1.478953, 0.2008328, -2.578079, 1, 1, 1, 1, 1,
-1.470201, 1.041927, -1.331782, 1, 1, 1, 1, 1,
-1.469021, -0.2514876, 0.1063651, 1, 1, 1, 1, 1,
-1.456163, 0.2871696, -1.272089, 1, 1, 1, 1, 1,
-1.450101, 0.7891721, -1.487871, 1, 1, 1, 1, 1,
-1.446543, -0.6392199, -1.350093, 1, 1, 1, 1, 1,
-1.441167, -0.8390393, -1.675141, 1, 1, 1, 1, 1,
-1.431173, 1.067016, -2.603448, 1, 1, 1, 1, 1,
-1.42977, 1.363679, -0.01942827, 0, 0, 1, 1, 1,
-1.429219, -0.9451353, -0.4725972, 1, 0, 0, 1, 1,
-1.424059, 1.364796, -1.177004, 1, 0, 0, 1, 1,
-1.402319, 1.018383, -3.304672, 1, 0, 0, 1, 1,
-1.398624, -0.9210361, -2.337893, 1, 0, 0, 1, 1,
-1.396884, 0.8372509, -0.6561166, 1, 0, 0, 1, 1,
-1.391043, 0.2865264, -2.656913, 0, 0, 0, 1, 1,
-1.390309, -0.7531857, -0.8133529, 0, 0, 0, 1, 1,
-1.378482, 0.07230546, -2.11361, 0, 0, 0, 1, 1,
-1.372203, 0.1042844, -1.446161, 0, 0, 0, 1, 1,
-1.371798, 0.2133346, -0.9958656, 0, 0, 0, 1, 1,
-1.351691, 1.239329, -2.128458, 0, 0, 0, 1, 1,
-1.348245, -1.201005, -2.839865, 0, 0, 0, 1, 1,
-1.332379, 0.9135112, -0.7998485, 1, 1, 1, 1, 1,
-1.330438, -1.317009, -3.60579, 1, 1, 1, 1, 1,
-1.302685, -1.99496, -0.1011602, 1, 1, 1, 1, 1,
-1.294828, -1.144414, -2.115669, 1, 1, 1, 1, 1,
-1.294499, -0.28725, -0.7922176, 1, 1, 1, 1, 1,
-1.294314, -0.2799812, -3.239715, 1, 1, 1, 1, 1,
-1.28688, 0.8865354, -3.144687, 1, 1, 1, 1, 1,
-1.28596, -1.537615, -1.391583, 1, 1, 1, 1, 1,
-1.280554, -0.5989801, -1.114371, 1, 1, 1, 1, 1,
-1.280299, 1.487818, -1.821437, 1, 1, 1, 1, 1,
-1.27512, -1.317669, -2.322993, 1, 1, 1, 1, 1,
-1.268192, 0.5277743, -1.799494, 1, 1, 1, 1, 1,
-1.25971, 1.675861, -1.297956, 1, 1, 1, 1, 1,
-1.251258, -0.6238584, -2.044038, 1, 1, 1, 1, 1,
-1.249933, 2.545716, 0.9981153, 1, 1, 1, 1, 1,
-1.2417, -0.5872476, -3.225161, 0, 0, 1, 1, 1,
-1.228123, 0.7526119, -0.5692558, 1, 0, 0, 1, 1,
-1.225918, 0.4642225, -0.1008455, 1, 0, 0, 1, 1,
-1.22302, -0.5358633, -0.2231674, 1, 0, 0, 1, 1,
-1.2218, -0.008217688, -1.28597, 1, 0, 0, 1, 1,
-1.213005, -0.2038141, -2.064995, 1, 0, 0, 1, 1,
-1.211845, -1.659243, -3.614171, 0, 0, 0, 1, 1,
-1.196484, 0.6178305, -1.676948, 0, 0, 0, 1, 1,
-1.186251, -0.8604795, -2.153126, 0, 0, 0, 1, 1,
-1.183029, -0.07325923, 0.368502, 0, 0, 0, 1, 1,
-1.181337, 0.003994395, -2.677155, 0, 0, 0, 1, 1,
-1.179559, 1.749395, 0.8932773, 0, 0, 0, 1, 1,
-1.173097, 1.073572, -1.97756, 0, 0, 0, 1, 1,
-1.171181, -0.1339237, -1.762751, 1, 1, 1, 1, 1,
-1.170037, -0.2793009, -0.7758453, 1, 1, 1, 1, 1,
-1.161425, -1.677873, -0.07660363, 1, 1, 1, 1, 1,
-1.158927, 0.9413607, -2.724522, 1, 1, 1, 1, 1,
-1.152246, -1.212023, -2.962642, 1, 1, 1, 1, 1,
-1.145831, 0.2926182, -0.5681928, 1, 1, 1, 1, 1,
-1.143967, -0.6544939, -1.51796, 1, 1, 1, 1, 1,
-1.140762, 0.2938053, -2.235857, 1, 1, 1, 1, 1,
-1.129403, 1.027814, 0.1058659, 1, 1, 1, 1, 1,
-1.115602, -1.498119, -3.761018, 1, 1, 1, 1, 1,
-1.113483, 0.4378889, -2.071848, 1, 1, 1, 1, 1,
-1.112817, 0.6958603, -1.080067, 1, 1, 1, 1, 1,
-1.110538, 0.9978117, -0.3739555, 1, 1, 1, 1, 1,
-1.110147, -1.150903, -2.460762, 1, 1, 1, 1, 1,
-1.099845, -0.5317593, -2.298645, 1, 1, 1, 1, 1,
-1.091245, -1.049751, -0.4916306, 0, 0, 1, 1, 1,
-1.088916, 0.5113059, -0.6250085, 1, 0, 0, 1, 1,
-1.086841, 1.266986, -0.8647737, 1, 0, 0, 1, 1,
-1.07721, -0.3049917, -1.758937, 1, 0, 0, 1, 1,
-1.074886, -0.3436469, -2.689591, 1, 0, 0, 1, 1,
-1.072857, 0.9781078, -0.5519583, 1, 0, 0, 1, 1,
-1.071498, -0.5084816, -3.84453, 0, 0, 0, 1, 1,
-1.070894, 0.5583977, -1.818085, 0, 0, 0, 1, 1,
-1.068555, -0.8862082, -2.110958, 0, 0, 0, 1, 1,
-1.064865, 0.724876, -2.987088, 0, 0, 0, 1, 1,
-1.062532, 0.8831398, -2.593151, 0, 0, 0, 1, 1,
-1.061237, 0.1247553, -0.4385162, 0, 0, 0, 1, 1,
-1.059467, -1.041667, -4.094465, 0, 0, 0, 1, 1,
-1.059126, -2.188305, -3.626277, 1, 1, 1, 1, 1,
-1.055318, -0.195, -0.9828242, 1, 1, 1, 1, 1,
-1.041923, 0.3795106, -0.3603496, 1, 1, 1, 1, 1,
-1.039944, -0.6484138, -2.689825, 1, 1, 1, 1, 1,
-1.032002, -2.394742, -1.535486, 1, 1, 1, 1, 1,
-1.030466, 1.17076, -0.4524606, 1, 1, 1, 1, 1,
-1.023997, 0.3237187, -0.4178396, 1, 1, 1, 1, 1,
-1.021981, -1.415561, -2.449325, 1, 1, 1, 1, 1,
-1.015123, 0.03133829, -1.701241, 1, 1, 1, 1, 1,
-1.012211, -0.6620254, -2.701917, 1, 1, 1, 1, 1,
-1.009861, 2.270748, -0.3685639, 1, 1, 1, 1, 1,
-1.006975, 0.7734839, -1.849471, 1, 1, 1, 1, 1,
-1.005684, -0.4990852, -4.103675, 1, 1, 1, 1, 1,
-0.9980456, -1.094342, -1.775666, 1, 1, 1, 1, 1,
-0.9965255, -0.3631631, -1.166676, 1, 1, 1, 1, 1,
-0.9960709, 0.5062924, -2.104564, 0, 0, 1, 1, 1,
-0.9950613, 0.4703492, -1.98919, 1, 0, 0, 1, 1,
-0.9919834, -0.7865736, -1.016743, 1, 0, 0, 1, 1,
-0.9858608, 0.4202963, -0.07156086, 1, 0, 0, 1, 1,
-0.9822081, -1.255683, -1.929535, 1, 0, 0, 1, 1,
-0.980114, -0.5465029, -2.024111, 1, 0, 0, 1, 1,
-0.9706717, 1.901788, -0.7374325, 0, 0, 0, 1, 1,
-0.968906, -1.421857, -1.435146, 0, 0, 0, 1, 1,
-0.9663292, 0.190098, -1.094802, 0, 0, 0, 1, 1,
-0.9644909, 1.47369, -1.226661, 0, 0, 0, 1, 1,
-0.9637496, 0.5075017, -1.267556, 0, 0, 0, 1, 1,
-0.9624278, 1.229997, -0.08814412, 0, 0, 0, 1, 1,
-0.959555, 1.632474, 0.3125021, 0, 0, 0, 1, 1,
-0.9581181, 1.444566, -0.4089022, 1, 1, 1, 1, 1,
-0.9575549, 0.3213173, 0.1471786, 1, 1, 1, 1, 1,
-0.9407998, -0.64741, -2.989279, 1, 1, 1, 1, 1,
-0.9345843, -0.3215361, -1.531793, 1, 1, 1, 1, 1,
-0.9218925, 0.4334993, -2.094001, 1, 1, 1, 1, 1,
-0.9181968, -1.620493, -2.810113, 1, 1, 1, 1, 1,
-0.9178435, 0.4278373, -1.461472, 1, 1, 1, 1, 1,
-0.907344, 0.2508241, -2.444512, 1, 1, 1, 1, 1,
-0.9057595, -0.04488813, -1.873272, 1, 1, 1, 1, 1,
-0.9055377, 0.9594178, -0.9517534, 1, 1, 1, 1, 1,
-0.9035303, -0.3467021, -3.261331, 1, 1, 1, 1, 1,
-0.8983141, -1.201779, -2.58993, 1, 1, 1, 1, 1,
-0.8942013, 1.341072, -0.1591918, 1, 1, 1, 1, 1,
-0.8871301, 0.2347972, -1.273414, 1, 1, 1, 1, 1,
-0.8839121, -0.2649475, -1.795435, 1, 1, 1, 1, 1,
-0.8762875, 1.42444, -1.836853, 0, 0, 1, 1, 1,
-0.8750389, 0.0307483, -1.939209, 1, 0, 0, 1, 1,
-0.8712004, 0.04190928, -2.607179, 1, 0, 0, 1, 1,
-0.870582, -1.281483, -3.839808, 1, 0, 0, 1, 1,
-0.869324, -1.22118, -2.994595, 1, 0, 0, 1, 1,
-0.8686321, 0.4855241, 0.2073775, 1, 0, 0, 1, 1,
-0.8645726, -0.6137425, -4.061569, 0, 0, 0, 1, 1,
-0.8634545, 0.7119432, -2.322173, 0, 0, 0, 1, 1,
-0.8590078, -0.2089054, -0.04664903, 0, 0, 0, 1, 1,
-0.8565547, -0.4498684, -1.072791, 0, 0, 0, 1, 1,
-0.8564504, -1.039285, -1.255519, 0, 0, 0, 1, 1,
-0.8536267, -0.875785, -3.825718, 0, 0, 0, 1, 1,
-0.8518589, 0.1530818, -1.811669, 0, 0, 0, 1, 1,
-0.831269, -1.725765, -2.893514, 1, 1, 1, 1, 1,
-0.8308676, 0.09006001, -1.909345, 1, 1, 1, 1, 1,
-0.8183681, -0.3201818, -1.917414, 1, 1, 1, 1, 1,
-0.818332, -1.808188, 0.2731206, 1, 1, 1, 1, 1,
-0.8149161, 1.016911, -1.041502, 1, 1, 1, 1, 1,
-0.8135408, -0.2003376, -1.830789, 1, 1, 1, 1, 1,
-0.8070615, -0.8988158, -2.488241, 1, 1, 1, 1, 1,
-0.8045499, -0.8860264, -2.419551, 1, 1, 1, 1, 1,
-0.8025414, -0.4648494, -0.6689622, 1, 1, 1, 1, 1,
-0.8004287, -1.432123, -3.48663, 1, 1, 1, 1, 1,
-0.7988076, -0.5005175, -3.283923, 1, 1, 1, 1, 1,
-0.7972564, 0.4397146, 0.4213703, 1, 1, 1, 1, 1,
-0.7971495, -0.7882737, -1.800094, 1, 1, 1, 1, 1,
-0.7959462, 0.3772275, 0.5887798, 1, 1, 1, 1, 1,
-0.7896932, -0.8151532, -2.538193, 1, 1, 1, 1, 1,
-0.7872385, -0.6785083, -2.302807, 0, 0, 1, 1, 1,
-0.7778078, -1.278402, -2.855253, 1, 0, 0, 1, 1,
-0.7754133, 0.8931901, 0.08410992, 1, 0, 0, 1, 1,
-0.7749305, -1.865451, -2.649504, 1, 0, 0, 1, 1,
-0.7728459, 1.873216, 0.2756232, 1, 0, 0, 1, 1,
-0.7696176, -1.077976, -3.711165, 1, 0, 0, 1, 1,
-0.7688187, 1.852735, -0.04252952, 0, 0, 0, 1, 1,
-0.7683128, 0.4189622, -1.902321, 0, 0, 0, 1, 1,
-0.7675695, -0.5036547, -2.453797, 0, 0, 0, 1, 1,
-0.7654727, -0.4318085, 0.5865127, 0, 0, 0, 1, 1,
-0.7652275, -0.06171403, -1.170822, 0, 0, 0, 1, 1,
-0.7612504, -1.257438, -4.499952, 0, 0, 0, 1, 1,
-0.7596332, 0.6402572, -0.7277893, 0, 0, 0, 1, 1,
-0.7595516, 0.2955873, -0.9997411, 1, 1, 1, 1, 1,
-0.7592552, 0.6280388, 0.1795981, 1, 1, 1, 1, 1,
-0.7574228, -0.9775878, -1.622822, 1, 1, 1, 1, 1,
-0.7566418, -1.774394, -5.006829, 1, 1, 1, 1, 1,
-0.7506118, -0.3460074, -0.8876041, 1, 1, 1, 1, 1,
-0.749455, 0.7506033, -1.529847, 1, 1, 1, 1, 1,
-0.7454659, 0.9224953, -1.461146, 1, 1, 1, 1, 1,
-0.7417388, 0.1180043, -0.00727532, 1, 1, 1, 1, 1,
-0.7401626, 2.25183, -0.8023824, 1, 1, 1, 1, 1,
-0.7378809, 0.4922564, -1.174605, 1, 1, 1, 1, 1,
-0.7342193, 0.03755909, -0.5629473, 1, 1, 1, 1, 1,
-0.7318959, -0.8784566, -1.07245, 1, 1, 1, 1, 1,
-0.7313555, -1.146431, -4.346331, 1, 1, 1, 1, 1,
-0.7308773, -1.843287, -3.127832, 1, 1, 1, 1, 1,
-0.7275988, -0.7877393, -2.346679, 1, 1, 1, 1, 1,
-0.7232079, -0.5603262, -0.8411287, 0, 0, 1, 1, 1,
-0.7231274, -0.01209799, -0.6676716, 1, 0, 0, 1, 1,
-0.7205832, -0.1435374, -2.511176, 1, 0, 0, 1, 1,
-0.7172911, 0.6058987, 0.4172978, 1, 0, 0, 1, 1,
-0.7150854, -1.147127, -2.961092, 1, 0, 0, 1, 1,
-0.7110283, -0.3403051, -0.882645, 1, 0, 0, 1, 1,
-0.7108648, 0.4284996, -0.7289733, 0, 0, 0, 1, 1,
-0.710079, 0.9321686, -1.454406, 0, 0, 0, 1, 1,
-0.7096643, 0.5106974, 0.5797999, 0, 0, 0, 1, 1,
-0.7096019, -0.5092191, -4.050564, 0, 0, 0, 1, 1,
-0.7077547, 0.7924054, 0.494737, 0, 0, 0, 1, 1,
-0.7032847, 0.1575288, 0.01503898, 0, 0, 0, 1, 1,
-0.7031704, -0.3309242, -1.305854, 0, 0, 0, 1, 1,
-0.7031703, -1.585222, -1.73039, 1, 1, 1, 1, 1,
-0.7013357, 0.4710605, -0.9421521, 1, 1, 1, 1, 1,
-0.6988456, 0.7709625, -0.9242421, 1, 1, 1, 1, 1,
-0.6931201, 0.05228081, -1.477647, 1, 1, 1, 1, 1,
-0.6901562, -0.3875313, -0.467467, 1, 1, 1, 1, 1,
-0.6884496, -0.612599, -2.044075, 1, 1, 1, 1, 1,
-0.6770633, 0.2231549, -2.838889, 1, 1, 1, 1, 1,
-0.6749303, -1.377218, -3.277997, 1, 1, 1, 1, 1,
-0.6719402, 0.4906236, 0.3296145, 1, 1, 1, 1, 1,
-0.671677, -0.8930289, -4.286812, 1, 1, 1, 1, 1,
-0.6706544, 2.242329, 0.6286502, 1, 1, 1, 1, 1,
-0.6648491, -0.3140407, -2.197537, 1, 1, 1, 1, 1,
-0.6620806, -0.3641193, -3.175983, 1, 1, 1, 1, 1,
-0.6613231, -1.283428, -4.528818, 1, 1, 1, 1, 1,
-0.6570129, 0.7808828, 0.6759259, 1, 1, 1, 1, 1,
-0.6553473, 0.8863016, -0.633867, 0, 0, 1, 1, 1,
-0.6539817, 0.7391368, -0.9043071, 1, 0, 0, 1, 1,
-0.6529469, 0.1998309, 0.5838984, 1, 0, 0, 1, 1,
-0.6444641, 0.06423476, -0.8150721, 1, 0, 0, 1, 1,
-0.6383787, 0.4089346, -0.1819757, 1, 0, 0, 1, 1,
-0.6288759, -0.643416, -0.6739951, 1, 0, 0, 1, 1,
-0.6212206, -1.470315, -4.079248, 0, 0, 0, 1, 1,
-0.619281, -0.8715795, -1.808963, 0, 0, 0, 1, 1,
-0.6191732, 1.022759, -0.977581, 0, 0, 0, 1, 1,
-0.6191576, 0.5798118, -1.420184, 0, 0, 0, 1, 1,
-0.6167315, 2.289323, -0.5405017, 0, 0, 0, 1, 1,
-0.6130659, -1.38533, -1.845313, 0, 0, 0, 1, 1,
-0.6126021, 0.3812678, -0.2512676, 0, 0, 0, 1, 1,
-0.6098212, -0.3825769, -2.496881, 1, 1, 1, 1, 1,
-0.6072347, 0.6612068, -1.02646, 1, 1, 1, 1, 1,
-0.6052619, 1.194445, -1.351343, 1, 1, 1, 1, 1,
-0.6046454, -1.644348, -3.478307, 1, 1, 1, 1, 1,
-0.6005633, -1.045008, -0.8266597, 1, 1, 1, 1, 1,
-0.59644, 0.8491623, -1.461981, 1, 1, 1, 1, 1,
-0.5918698, -1.299705, -3.848447, 1, 1, 1, 1, 1,
-0.5784375, 0.06619062, -2.093997, 1, 1, 1, 1, 1,
-0.5781376, -0.3350027, -0.9600704, 1, 1, 1, 1, 1,
-0.5731612, -0.3690773, -2.309648, 1, 1, 1, 1, 1,
-0.5673185, -0.7165795, -3.935621, 1, 1, 1, 1, 1,
-0.5622272, 0.5955456, -0.2762519, 1, 1, 1, 1, 1,
-0.5528979, -3.550557, -2.451998, 1, 1, 1, 1, 1,
-0.5514954, 0.02639396, -3.389396, 1, 1, 1, 1, 1,
-0.5463142, -0.03950637, -0.4826272, 1, 1, 1, 1, 1,
-0.5443224, 1.225998, 0.288318, 0, 0, 1, 1, 1,
-0.5382876, -0.06259815, -2.651143, 1, 0, 0, 1, 1,
-0.5355843, -0.7594132, -3.060297, 1, 0, 0, 1, 1,
-0.533662, 1.41699, 0.5314127, 1, 0, 0, 1, 1,
-0.5311018, -0.5716389, -1.344332, 1, 0, 0, 1, 1,
-0.5286701, 0.7031497, -1.330286, 1, 0, 0, 1, 1,
-0.5243509, 0.7841618, 1.090637, 0, 0, 0, 1, 1,
-0.5180666, -0.4043546, -1.742723, 0, 0, 0, 1, 1,
-0.5153168, -1.532367, -4.470751, 0, 0, 0, 1, 1,
-0.5140714, 0.6785387, -2.013777, 0, 0, 0, 1, 1,
-0.5114444, -2.868619, -1.119053, 0, 0, 0, 1, 1,
-0.510125, -0.3780421, -1.246718, 0, 0, 0, 1, 1,
-0.5098732, -1.762766, -1.777566, 0, 0, 0, 1, 1,
-0.5089846, -0.139695, -2.185451, 1, 1, 1, 1, 1,
-0.5084503, -1.604349, -4.219255, 1, 1, 1, 1, 1,
-0.5070039, -2.677454, -2.606683, 1, 1, 1, 1, 1,
-0.5036697, -1.002347, -3.509446, 1, 1, 1, 1, 1,
-0.4896833, 0.9557828, 2.847321, 1, 1, 1, 1, 1,
-0.4889771, 3.21964, 0.8785727, 1, 1, 1, 1, 1,
-0.4820393, 0.6907001, 0.1836215, 1, 1, 1, 1, 1,
-0.4753665, 0.9949645, 0.6731403, 1, 1, 1, 1, 1,
-0.4726297, -0.0918847, -2.335927, 1, 1, 1, 1, 1,
-0.4720823, -0.1717782, -0.8694878, 1, 1, 1, 1, 1,
-0.467032, -0.7174029, -3.32427, 1, 1, 1, 1, 1,
-0.4659627, -0.1057916, -2.571787, 1, 1, 1, 1, 1,
-0.4655394, 1.027599, 0.09600876, 1, 1, 1, 1, 1,
-0.4630311, -1.762748, -3.73512, 1, 1, 1, 1, 1,
-0.4573608, 0.2954899, -0.7523986, 1, 1, 1, 1, 1,
-0.4548336, -0.1508632, -1.755048, 0, 0, 1, 1, 1,
-0.4508512, -2.403417, -4.206032, 1, 0, 0, 1, 1,
-0.4502125, 1.200557, -1.058304, 1, 0, 0, 1, 1,
-0.4483603, -0.5879248, -1.461854, 1, 0, 0, 1, 1,
-0.4468006, 0.9021023, -0.4369187, 1, 0, 0, 1, 1,
-0.4451463, 0.03832165, -2.126331, 1, 0, 0, 1, 1,
-0.4426106, -1.612686, -2.601418, 0, 0, 0, 1, 1,
-0.4418124, 1.245613, -0.60096, 0, 0, 0, 1, 1,
-0.4412865, -0.5748365, -1.986609, 0, 0, 0, 1, 1,
-0.4411568, -2.271405, -2.454199, 0, 0, 0, 1, 1,
-0.4408285, -0.78132, -2.158518, 0, 0, 0, 1, 1,
-0.4386147, 0.461946, -1.416241, 0, 0, 0, 1, 1,
-0.4381951, 0.4209019, -1.135696, 0, 0, 0, 1, 1,
-0.4364446, -1.881417, -2.528244, 1, 1, 1, 1, 1,
-0.4355008, 0.006837423, -1.052737, 1, 1, 1, 1, 1,
-0.431386, 0.3013254, -0.9657368, 1, 1, 1, 1, 1,
-0.4235585, 1.082727, -1.591036, 1, 1, 1, 1, 1,
-0.4214597, 1.087921, -1.309993, 1, 1, 1, 1, 1,
-0.4189247, -0.3181701, -2.051531, 1, 1, 1, 1, 1,
-0.4168828, -0.4605808, -1.889375, 1, 1, 1, 1, 1,
-0.415499, 1.096354, -0.6862209, 1, 1, 1, 1, 1,
-0.4129827, -0.1592499, -2.011902, 1, 1, 1, 1, 1,
-0.4126356, 0.3413941, -1.356974, 1, 1, 1, 1, 1,
-0.4119773, -0.8985012, -2.091756, 1, 1, 1, 1, 1,
-0.4098373, 1.832932, -1.17792, 1, 1, 1, 1, 1,
-0.4061315, -2.563676, -2.490377, 1, 1, 1, 1, 1,
-0.4035161, 1.283222, -0.1366482, 1, 1, 1, 1, 1,
-0.3955049, -0.1018688, -1.737934, 1, 1, 1, 1, 1,
-0.3947739, 0.2493834, -2.724013, 0, 0, 1, 1, 1,
-0.3923414, 0.6854822, -1.611624, 1, 0, 0, 1, 1,
-0.3892469, -0.5388167, -2.536897, 1, 0, 0, 1, 1,
-0.3884085, 0.4485129, -1.225561, 1, 0, 0, 1, 1,
-0.3845979, 1.036389, -1.159767, 1, 0, 0, 1, 1,
-0.38322, 0.20609, -0.9865801, 1, 0, 0, 1, 1,
-0.3824362, 0.8445202, -0.03957686, 0, 0, 0, 1, 1,
-0.3800648, -0.4906144, -4.575088, 0, 0, 0, 1, 1,
-0.3794308, -1.914477, -1.548393, 0, 0, 0, 1, 1,
-0.3696941, -1.468435, -4.074606, 0, 0, 0, 1, 1,
-0.3615303, -0.3670214, -0.6825624, 0, 0, 0, 1, 1,
-0.3603202, 2.068636, 0.5168568, 0, 0, 0, 1, 1,
-0.3592197, -0.9342072, -2.262362, 0, 0, 0, 1, 1,
-0.3584153, -1.188582, -2.11241, 1, 1, 1, 1, 1,
-0.3583039, -1.017637, -2.21411, 1, 1, 1, 1, 1,
-0.3582488, -1.065417, -2.073325, 1, 1, 1, 1, 1,
-0.352902, 0.5483463, -0.847111, 1, 1, 1, 1, 1,
-0.3508299, -1.247619, -1.564571, 1, 1, 1, 1, 1,
-0.3489618, -0.4061514, -1.761713, 1, 1, 1, 1, 1,
-0.3366812, -0.8789915, -2.674619, 1, 1, 1, 1, 1,
-0.3357058, 1.053003, -0.4240052, 1, 1, 1, 1, 1,
-0.3354108, -0.3448788, -2.24315, 1, 1, 1, 1, 1,
-0.3346183, 1.443311, -0.1270972, 1, 1, 1, 1, 1,
-0.3345793, -0.7701314, -2.024194, 1, 1, 1, 1, 1,
-0.333591, -0.3808014, -3.075158, 1, 1, 1, 1, 1,
-0.3293719, -0.4200112, -2.274427, 1, 1, 1, 1, 1,
-0.3277056, 1.647642, -0.9596193, 1, 1, 1, 1, 1,
-0.3225599, -1.489209, -3.321358, 1, 1, 1, 1, 1,
-0.3204868, 0.8799879, -1.251403, 0, 0, 1, 1, 1,
-0.3200157, -0.4677612, -1.793947, 1, 0, 0, 1, 1,
-0.3195755, -0.3288078, -3.817795, 1, 0, 0, 1, 1,
-0.3193209, 0.03235228, -1.161057, 1, 0, 0, 1, 1,
-0.3179871, 0.2450056, -2.447385, 1, 0, 0, 1, 1,
-0.3085776, -0.9192879, -2.138684, 1, 0, 0, 1, 1,
-0.3072016, 0.1934631, -1.679118, 0, 0, 0, 1, 1,
-0.307151, 1.044134, 1.167683, 0, 0, 0, 1, 1,
-0.3065836, -0.07883913, -0.3409906, 0, 0, 0, 1, 1,
-0.305829, -0.7912151, -2.297711, 0, 0, 0, 1, 1,
-0.3016841, 0.9146245, 2.194142, 0, 0, 0, 1, 1,
-0.2987339, -1.295293, -1.413723, 0, 0, 0, 1, 1,
-0.292588, 0.5132148, 0.5876413, 0, 0, 0, 1, 1,
-0.2924621, 1.490662, -0.387262, 1, 1, 1, 1, 1,
-0.289316, 0.05948405, 0.4453343, 1, 1, 1, 1, 1,
-0.2882255, -0.9180601, -3.771531, 1, 1, 1, 1, 1,
-0.2869548, -0.7603347, -2.805076, 1, 1, 1, 1, 1,
-0.2844883, -0.05734108, -1.719193, 1, 1, 1, 1, 1,
-0.2796927, -0.4011172, -0.2253103, 1, 1, 1, 1, 1,
-0.2778939, 0.3588002, 0.3241404, 1, 1, 1, 1, 1,
-0.2729023, 0.06406379, -2.118351, 1, 1, 1, 1, 1,
-0.2673825, -0.2536363, -1.078399, 1, 1, 1, 1, 1,
-0.2668495, 0.6841012, 0.6519679, 1, 1, 1, 1, 1,
-0.2620212, -0.5852946, -1.986865, 1, 1, 1, 1, 1,
-0.2546165, -0.2505935, -2.864162, 1, 1, 1, 1, 1,
-0.250599, -2.126543, -3.094915, 1, 1, 1, 1, 1,
-0.2486114, -0.3548754, -4.400745, 1, 1, 1, 1, 1,
-0.2471733, 2.246708, 0.3906382, 1, 1, 1, 1, 1,
-0.2471219, -1.938465, -3.260606, 0, 0, 1, 1, 1,
-0.2443561, -2.383965, -1.428922, 1, 0, 0, 1, 1,
-0.2438545, 1.170086, 0.3682965, 1, 0, 0, 1, 1,
-0.2420529, -0.9546001, -1.935548, 1, 0, 0, 1, 1,
-0.2378699, 0.1918426, -0.6033635, 1, 0, 0, 1, 1,
-0.2341681, -0.4392424, -1.45663, 1, 0, 0, 1, 1,
-0.2339095, -0.2036979, -1.637275, 0, 0, 0, 1, 1,
-0.2274271, -0.9263943, -2.013429, 0, 0, 0, 1, 1,
-0.2265508, 0.516685, -0.5003434, 0, 0, 0, 1, 1,
-0.2259896, 1.239888, -0.2471105, 0, 0, 0, 1, 1,
-0.2252724, -0.03762536, -0.4814155, 0, 0, 0, 1, 1,
-0.2160201, 0.886534, -2.219188, 0, 0, 0, 1, 1,
-0.2143901, -1.871806, -2.996658, 0, 0, 0, 1, 1,
-0.2122186, 0.9406258, 0.2803362, 1, 1, 1, 1, 1,
-0.2112774, -0.09297404, -1.86064, 1, 1, 1, 1, 1,
-0.208707, -1.332186, -2.989874, 1, 1, 1, 1, 1,
-0.2069132, 0.1910363, 1.041148, 1, 1, 1, 1, 1,
-0.193708, -1.346901, -1.697097, 1, 1, 1, 1, 1,
-0.1924588, -0.3419235, -2.910362, 1, 1, 1, 1, 1,
-0.1904021, -0.4280897, -4.240856, 1, 1, 1, 1, 1,
-0.1885152, -1.055166, -3.597104, 1, 1, 1, 1, 1,
-0.1742461, 0.1748859, -1.307752, 1, 1, 1, 1, 1,
-0.1724447, 0.0242974, -1.28339, 1, 1, 1, 1, 1,
-0.1686276, -2.134724, -4.260554, 1, 1, 1, 1, 1,
-0.1567344, 0.7360355, 1.013443, 1, 1, 1, 1, 1,
-0.1527209, 0.4436029, -1.14989, 1, 1, 1, 1, 1,
-0.1520786, -0.9646748, -4.645947, 1, 1, 1, 1, 1,
-0.1515511, -0.3196859, -1.948339, 1, 1, 1, 1, 1,
-0.1474921, 0.3133811, -1.335007, 0, 0, 1, 1, 1,
-0.1457877, 0.8168861, 0.3413728, 1, 0, 0, 1, 1,
-0.1447866, 0.640237, -0.8046886, 1, 0, 0, 1, 1,
-0.1414881, -0.6547453, -2.456934, 1, 0, 0, 1, 1,
-0.1412452, 0.1431746, -0.2124572, 1, 0, 0, 1, 1,
-0.1347014, -0.2878799, -2.940165, 1, 0, 0, 1, 1,
-0.1272154, 1.303995, -0.4801524, 0, 0, 0, 1, 1,
-0.1260679, -1.613027, -3.803348, 0, 0, 0, 1, 1,
-0.1223902, 0.1651176, -1.383477, 0, 0, 0, 1, 1,
-0.1223663, 0.2604388, 0.7476136, 0, 0, 0, 1, 1,
-0.1210635, 1.81564, 0.406902, 0, 0, 0, 1, 1,
-0.1160508, -1.262149, -3.175902, 0, 0, 0, 1, 1,
-0.1145557, 1.571951, 0.2806836, 0, 0, 0, 1, 1,
-0.113033, 0.2925333, 0.8484858, 1, 1, 1, 1, 1,
-0.112769, 0.83699, -2.130038, 1, 1, 1, 1, 1,
-0.1107491, 0.6381876, -1.446978, 1, 1, 1, 1, 1,
-0.1086317, -0.09208626, -0.9143998, 1, 1, 1, 1, 1,
-0.1062678, 2.126576, 1.162151, 1, 1, 1, 1, 1,
-0.101321, 0.6356086, -1.882668, 1, 1, 1, 1, 1,
-0.09590437, 0.7484223, 0.4556108, 1, 1, 1, 1, 1,
-0.09383, -1.556029, -4.42081, 1, 1, 1, 1, 1,
-0.09297366, 0.2993295, 0.354873, 1, 1, 1, 1, 1,
-0.09248496, 0.6805356, -1.138088, 1, 1, 1, 1, 1,
-0.08851372, -0.1772097, -1.154521, 1, 1, 1, 1, 1,
-0.08681906, 0.128415, -1.156459, 1, 1, 1, 1, 1,
-0.0850247, -1.066242, -1.061459, 1, 1, 1, 1, 1,
-0.08242206, -1.579983, -4.08544, 1, 1, 1, 1, 1,
-0.08169293, -0.2315514, -2.318614, 1, 1, 1, 1, 1,
-0.08034281, 0.01369938, -1.800495, 0, 0, 1, 1, 1,
-0.07914715, 0.8946388, 0.7978569, 1, 0, 0, 1, 1,
-0.07904001, 0.2222307, -0.7968025, 1, 0, 0, 1, 1,
-0.07644799, 0.7482241, 0.2045284, 1, 0, 0, 1, 1,
-0.07214352, -1.791713, -1.248, 1, 0, 0, 1, 1,
-0.06999285, -0.1153257, -1.675167, 1, 0, 0, 1, 1,
-0.06715848, -0.4200409, -2.93002, 0, 0, 0, 1, 1,
-0.06640151, -0.5363104, -2.61438, 0, 0, 0, 1, 1,
-0.06383924, -1.547238, -3.298488, 0, 0, 0, 1, 1,
-0.05893115, -0.3176064, -2.373661, 0, 0, 0, 1, 1,
-0.0581162, 1.381021, -1.174004, 0, 0, 0, 1, 1,
-0.05637861, 0.6253499, -0.2645119, 0, 0, 0, 1, 1,
-0.05474558, -1.240056, -5.459253, 0, 0, 0, 1, 1,
-0.05135848, -1.662624, -4.212895, 1, 1, 1, 1, 1,
-0.04354292, -0.3097527, -3.962253, 1, 1, 1, 1, 1,
-0.04137485, 0.2702162, -1.007435, 1, 1, 1, 1, 1,
-0.03837009, -0.1606392, -4.481973, 1, 1, 1, 1, 1,
-0.03565755, 0.004646726, -1.953465, 1, 1, 1, 1, 1,
-0.03455547, 0.3249058, 0.3508815, 1, 1, 1, 1, 1,
-0.03402505, 0.49045, -1.47386, 1, 1, 1, 1, 1,
-0.03331963, 0.9744865, 0.2034863, 1, 1, 1, 1, 1,
-0.03314709, -1.583896, -2.095395, 1, 1, 1, 1, 1,
-0.03180402, 0.1080898, -0.1291418, 1, 1, 1, 1, 1,
-0.02913186, -0.7434142, -3.47362, 1, 1, 1, 1, 1,
-0.02890819, 0.04281216, -0.6753715, 1, 1, 1, 1, 1,
-0.02671463, 0.8247625, 1.340843, 1, 1, 1, 1, 1,
-0.02513334, 1.590498, 0.004460631, 1, 1, 1, 1, 1,
-0.02465339, 0.9348599, -1.321588, 1, 1, 1, 1, 1,
-0.01911844, -0.1665598, -3.159098, 0, 0, 1, 1, 1,
-0.01702866, -0.7690079, -1.614809, 1, 0, 0, 1, 1,
-0.009364096, -0.5088191, -2.663924, 1, 0, 0, 1, 1,
-0.009296955, 0.7766479, -0.985128, 1, 0, 0, 1, 1,
-0.005881563, 2.223732, -0.9168664, 1, 0, 0, 1, 1,
-0.005387542, -0.2659708, -4.077922, 1, 0, 0, 1, 1,
0.004947952, -1.575011, 3.363107, 0, 0, 0, 1, 1,
0.009636656, 0.1966805, 0.2693274, 0, 0, 0, 1, 1,
0.01261573, -1.193847, 4.676089, 0, 0, 0, 1, 1,
0.01539325, 0.8738528, 1.834528, 0, 0, 0, 1, 1,
0.01603108, 1.069319, -0.6769753, 0, 0, 0, 1, 1,
0.0182947, -0.6328608, 3.550704, 0, 0, 0, 1, 1,
0.01890868, 0.7718174, 0.4103682, 0, 0, 0, 1, 1,
0.02143118, 0.1428944, -0.2891563, 1, 1, 1, 1, 1,
0.02595378, -1.410169, 3.35862, 1, 1, 1, 1, 1,
0.02766426, -0.7400398, 4.226916, 1, 1, 1, 1, 1,
0.02873198, -0.9716764, 2.890148, 1, 1, 1, 1, 1,
0.03069079, -0.04419839, 4.72285, 1, 1, 1, 1, 1,
0.0437135, 1.218362, 0.2850428, 1, 1, 1, 1, 1,
0.04876111, -0.01972041, 0.6846911, 1, 1, 1, 1, 1,
0.05649686, 0.3914675, -0.3439037, 1, 1, 1, 1, 1,
0.05985436, 1.035966, 1.273046, 1, 1, 1, 1, 1,
0.06033032, 1.543525, 0.2540385, 1, 1, 1, 1, 1,
0.0636145, -0.02894715, 3.248647, 1, 1, 1, 1, 1,
0.06447908, 0.4085939, 0.4213001, 1, 1, 1, 1, 1,
0.06663506, -0.2139661, 2.065283, 1, 1, 1, 1, 1,
0.06700419, 2.049227, 1.190727, 1, 1, 1, 1, 1,
0.07018995, 0.7454004, 1.458205, 1, 1, 1, 1, 1,
0.07271743, -0.8295936, 2.662231, 0, 0, 1, 1, 1,
0.07668594, 0.9189836, 0.6019934, 1, 0, 0, 1, 1,
0.07669371, -0.004367511, 0.7120488, 1, 0, 0, 1, 1,
0.07848439, 0.891284, -0.01638739, 1, 0, 0, 1, 1,
0.08208685, 0.3305048, -0.6680817, 1, 0, 0, 1, 1,
0.08366771, -0.05523741, 0.8116367, 1, 0, 0, 1, 1,
0.08706414, 0.9373167, 1.126234, 0, 0, 0, 1, 1,
0.08800603, 0.23799, 1.319718, 0, 0, 0, 1, 1,
0.09044465, -1.055311, 1.138927, 0, 0, 0, 1, 1,
0.09128743, -1.199234, 2.034359, 0, 0, 0, 1, 1,
0.09899234, -0.8922266, 4.234725, 0, 0, 0, 1, 1,
0.1052297, -0.5487171, 3.421446, 0, 0, 0, 1, 1,
0.1078974, -0.4249981, 2.699202, 0, 0, 0, 1, 1,
0.1079331, 0.1361213, 0.9231862, 1, 1, 1, 1, 1,
0.1116459, -0.7979689, 4.631216, 1, 1, 1, 1, 1,
0.1129956, 1.239776, -0.5896281, 1, 1, 1, 1, 1,
0.1163579, -0.7305042, 1.230629, 1, 1, 1, 1, 1,
0.1195032, 0.06719543, 0.7524837, 1, 1, 1, 1, 1,
0.1200843, -0.7141755, 2.968621, 1, 1, 1, 1, 1,
0.1201011, 1.351042, 0.8041692, 1, 1, 1, 1, 1,
0.1207768, 0.6347032, 0.6447446, 1, 1, 1, 1, 1,
0.1220681, -1.442842, 3.283447, 1, 1, 1, 1, 1,
0.131061, 0.2384609, 0.5919099, 1, 1, 1, 1, 1,
0.1330441, -0.946658, 1.531992, 1, 1, 1, 1, 1,
0.1332739, -1.596063, 4.231304, 1, 1, 1, 1, 1,
0.1360395, -0.3380806, 1.531278, 1, 1, 1, 1, 1,
0.1408539, 1.166762, 1.435893, 1, 1, 1, 1, 1,
0.1540404, 1.239754, -0.5858236, 1, 1, 1, 1, 1,
0.1561726, -0.2373654, 4.154477, 0, 0, 1, 1, 1,
0.1590188, -1.152911, 2.412052, 1, 0, 0, 1, 1,
0.1612151, -0.1003559, 2.171048, 1, 0, 0, 1, 1,
0.1617665, -1.60157, 3.605841, 1, 0, 0, 1, 1,
0.1670904, -0.6314976, 2.038917, 1, 0, 0, 1, 1,
0.1685396, -0.4833411, 3.79727, 1, 0, 0, 1, 1,
0.1750293, 0.2732339, 0.548902, 0, 0, 0, 1, 1,
0.1755595, 0.3226188, 0.07492662, 0, 0, 0, 1, 1,
0.176297, -0.2247656, 2.282276, 0, 0, 0, 1, 1,
0.1768524, -1.142515, 1.014906, 0, 0, 0, 1, 1,
0.1786575, -0.2832629, 3.065711, 0, 0, 0, 1, 1,
0.1790355, 0.9305008, 0.7978577, 0, 0, 0, 1, 1,
0.179717, -0.1290995, 1.300924, 0, 0, 0, 1, 1,
0.1817512, 1.557679, 1.459188, 1, 1, 1, 1, 1,
0.1932399, -0.417326, 2.698833, 1, 1, 1, 1, 1,
0.1944173, -1.612772, 3.549989, 1, 1, 1, 1, 1,
0.1957542, 0.6419799, 1.374127, 1, 1, 1, 1, 1,
0.2011475, -1.405115, 1.60545, 1, 1, 1, 1, 1,
0.2058569, -0.1530669, 2.922893, 1, 1, 1, 1, 1,
0.2084258, 0.6056989, 0.548619, 1, 1, 1, 1, 1,
0.2137433, 1.077448, -0.7512277, 1, 1, 1, 1, 1,
0.2138999, -0.7835543, 2.194829, 1, 1, 1, 1, 1,
0.2165475, -0.4046152, 2.693669, 1, 1, 1, 1, 1,
0.2179336, 0.06434912, 1.944993, 1, 1, 1, 1, 1,
0.2191885, 0.170914, 0.5125561, 1, 1, 1, 1, 1,
0.2343568, -0.9253969, 2.515675, 1, 1, 1, 1, 1,
0.2361808, 0.6983531, -0.2011059, 1, 1, 1, 1, 1,
0.2389005, -2.357131, 3.017578, 1, 1, 1, 1, 1,
0.244084, 1.177708, 0.05527656, 0, 0, 1, 1, 1,
0.2449271, -1.087853, 3.927571, 1, 0, 0, 1, 1,
0.251314, 1.098635, -0.2237666, 1, 0, 0, 1, 1,
0.2535041, 0.2894465, -0.1561396, 1, 0, 0, 1, 1,
0.2555048, -0.6501754, 0.05457061, 1, 0, 0, 1, 1,
0.2581874, -0.6170074, 2.072489, 1, 0, 0, 1, 1,
0.2644259, -2.291773, 1.795027, 0, 0, 0, 1, 1,
0.2648669, 0.5537397, 0.3254811, 0, 0, 0, 1, 1,
0.2657036, 0.5470926, -0.1205079, 0, 0, 0, 1, 1,
0.2667904, -1.337526, 0.5009171, 0, 0, 0, 1, 1,
0.2668117, 1.080321, -1.235877, 0, 0, 0, 1, 1,
0.2691735, 0.5333108, 0.5656621, 0, 0, 0, 1, 1,
0.2693878, -0.06941155, 0.2929282, 0, 0, 0, 1, 1,
0.2764369, 0.3922453, -0.03857705, 1, 1, 1, 1, 1,
0.2779357, 0.271191, 1.137574, 1, 1, 1, 1, 1,
0.2794957, -0.8575236, 3.953556, 1, 1, 1, 1, 1,
0.280757, -0.8278996, 2.018898, 1, 1, 1, 1, 1,
0.281257, -0.3052283, 4.045129, 1, 1, 1, 1, 1,
0.2822204, 1.234634, -1.757679, 1, 1, 1, 1, 1,
0.2831274, -0.0537389, 2.016472, 1, 1, 1, 1, 1,
0.2832726, 1.058171, -0.9646835, 1, 1, 1, 1, 1,
0.2833, 1.495475, 0.6202281, 1, 1, 1, 1, 1,
0.2839401, 0.1158677, 1.587042, 1, 1, 1, 1, 1,
0.2844854, -0.7061232, 4.361878, 1, 1, 1, 1, 1,
0.2869106, -0.9617766, 1.853743, 1, 1, 1, 1, 1,
0.2881113, -2.793602, 4.810323, 1, 1, 1, 1, 1,
0.2915601, -1.201323, 3.151111, 1, 1, 1, 1, 1,
0.2920496, 0.961883, 1.686256, 1, 1, 1, 1, 1,
0.2921973, 0.4577905, 1.138371, 0, 0, 1, 1, 1,
0.2931299, 0.181263, 1.513238, 1, 0, 0, 1, 1,
0.2951216, -0.01411904, 2.610362, 1, 0, 0, 1, 1,
0.2954995, 1.368428, -0.956939, 1, 0, 0, 1, 1,
0.2964455, -1.311518, 2.678112, 1, 0, 0, 1, 1,
0.3006342, 1.251741, -0.4521034, 1, 0, 0, 1, 1,
0.3010334, 0.07844764, 1.663098, 0, 0, 0, 1, 1,
0.3023645, 0.2317969, 0.4547021, 0, 0, 0, 1, 1,
0.3099871, -0.0913357, 2.530406, 0, 0, 0, 1, 1,
0.311192, 0.326115, 0.2801525, 0, 0, 0, 1, 1,
0.3113727, -0.8625868, 2.09612, 0, 0, 0, 1, 1,
0.3140659, -0.5922434, 1.044876, 0, 0, 0, 1, 1,
0.3171818, -0.2845733, 2.274032, 0, 0, 0, 1, 1,
0.3173542, -0.03130798, -0.04616806, 1, 1, 1, 1, 1,
0.319314, -1.507921, 2.32594, 1, 1, 1, 1, 1,
0.3207475, 1.17738, 1.469867, 1, 1, 1, 1, 1,
0.3213798, 0.3451776, 0.6997247, 1, 1, 1, 1, 1,
0.3297002, 1.372357, 0.6583393, 1, 1, 1, 1, 1,
0.3338657, 1.222149, -0.367861, 1, 1, 1, 1, 1,
0.3340497, 1.307667, 0.142446, 1, 1, 1, 1, 1,
0.337503, -0.2833378, 3.990751, 1, 1, 1, 1, 1,
0.3410639, -1.384405, 4.408595, 1, 1, 1, 1, 1,
0.3433087, 0.5150943, 1.806894, 1, 1, 1, 1, 1,
0.3474844, 0.3624954, 0.1720444, 1, 1, 1, 1, 1,
0.348483, 0.4053083, 0.7001467, 1, 1, 1, 1, 1,
0.3581954, -0.8075261, 3.862923, 1, 1, 1, 1, 1,
0.359741, 0.1268099, 1.023729, 1, 1, 1, 1, 1,
0.3639899, -0.07359217, 1.554531, 1, 1, 1, 1, 1,
0.3668104, -0.1397153, 1.951833, 0, 0, 1, 1, 1,
0.3791526, -0.3818779, 2.420141, 1, 0, 0, 1, 1,
0.3823628, 0.5906475, 0.802789, 1, 0, 0, 1, 1,
0.3895269, 0.9550002, 1.372421, 1, 0, 0, 1, 1,
0.3900111, 0.5118848, -0.2650901, 1, 0, 0, 1, 1,
0.3938511, 1.603816, -0.2993039, 1, 0, 0, 1, 1,
0.3938566, -2.462422, 1.467903, 0, 0, 0, 1, 1,
0.3961599, 1.490208, 0.7030302, 0, 0, 0, 1, 1,
0.4109195, 0.1904167, 0.5973948, 0, 0, 0, 1, 1,
0.416455, 0.1241385, -0.03275707, 0, 0, 0, 1, 1,
0.4165746, -0.1470513, 0.3450114, 0, 0, 0, 1, 1,
0.4175282, -0.2535202, 1.846997, 0, 0, 0, 1, 1,
0.42137, -0.4051948, 2.998316, 0, 0, 0, 1, 1,
0.422441, -1.332439, 3.907168, 1, 1, 1, 1, 1,
0.4351323, -0.6585959, 2.245451, 1, 1, 1, 1, 1,
0.4438007, -1.463823, 3.556319, 1, 1, 1, 1, 1,
0.4462712, 0.292792, 0.9273445, 1, 1, 1, 1, 1,
0.4506361, -1.602177, 2.852553, 1, 1, 1, 1, 1,
0.4509548, 1.594437, 1.205712, 1, 1, 1, 1, 1,
0.4601735, -0.5413963, 1.735635, 1, 1, 1, 1, 1,
0.4607696, 0.9500463, 2.107641, 1, 1, 1, 1, 1,
0.4615526, 0.001710444, 2.185907, 1, 1, 1, 1, 1,
0.4623224, 1.87186, 0.5388646, 1, 1, 1, 1, 1,
0.4667121, 0.6199766, 1.800962, 1, 1, 1, 1, 1,
0.4669609, 0.1862433, 2.424004, 1, 1, 1, 1, 1,
0.470174, 0.7740838, -0.3844675, 1, 1, 1, 1, 1,
0.4704068, 0.1977317, 0.9612235, 1, 1, 1, 1, 1,
0.4740883, -1.802504, 3.0563, 1, 1, 1, 1, 1,
0.4758105, 1.353853, -1.067061, 0, 0, 1, 1, 1,
0.4792716, 0.9407566, -1.093364, 1, 0, 0, 1, 1,
0.4799918, -1.471506, 2.079237, 1, 0, 0, 1, 1,
0.4840287, 2.064258, 2.32142, 1, 0, 0, 1, 1,
0.4845838, 0.382964, 0.5226375, 1, 0, 0, 1, 1,
0.4865081, 0.4388326, 2.60031, 1, 0, 0, 1, 1,
0.4872692, -3.006478, 3.674312, 0, 0, 0, 1, 1,
0.4900813, -0.0707993, 4.051219, 0, 0, 0, 1, 1,
0.4931473, 0.6132092, 2.128298, 0, 0, 0, 1, 1,
0.494196, -0.379077, 2.948709, 0, 0, 0, 1, 1,
0.5021687, 1.607997, 0.677648, 0, 0, 0, 1, 1,
0.5075881, -1.738748, 2.461487, 0, 0, 0, 1, 1,
0.5080943, 0.1650708, 1.264583, 0, 0, 0, 1, 1,
0.5082101, -0.06600907, 1.917145, 1, 1, 1, 1, 1,
0.5138628, -1.028994, 1.505163, 1, 1, 1, 1, 1,
0.514438, 0.3382565, 0.04530172, 1, 1, 1, 1, 1,
0.5166715, -2.855422, 3.069124, 1, 1, 1, 1, 1,
0.5170251, 0.8887957, 0.8375254, 1, 1, 1, 1, 1,
0.5181968, 0.3843222, 0.9166038, 1, 1, 1, 1, 1,
0.5186737, -1.787602, 1.876737, 1, 1, 1, 1, 1,
0.5221398, 0.01195302, 3.127517, 1, 1, 1, 1, 1,
0.5234225, 0.02131927, -0.1907105, 1, 1, 1, 1, 1,
0.5252931, -0.9355984, 3.452401, 1, 1, 1, 1, 1,
0.5260462, -0.2377164, 1.290453, 1, 1, 1, 1, 1,
0.5262715, 0.2721099, 1.544056, 1, 1, 1, 1, 1,
0.5338521, 0.2984701, -0.3312982, 1, 1, 1, 1, 1,
0.5367296, -1.010339, 3.912542, 1, 1, 1, 1, 1,
0.5466934, -0.8063362, 0.9708129, 1, 1, 1, 1, 1,
0.5489762, -0.467704, 1.613856, 0, 0, 1, 1, 1,
0.5535496, 1.024993, -0.2039833, 1, 0, 0, 1, 1,
0.5573454, -0.7696925, 4.740203, 1, 0, 0, 1, 1,
0.5636507, -0.3077184, 2.428518, 1, 0, 0, 1, 1,
0.5649737, 1.015193, -0.1059091, 1, 0, 0, 1, 1,
0.5675132, -0.5130874, 2.417222, 1, 0, 0, 1, 1,
0.5679154, 0.08332496, 3.492939, 0, 0, 0, 1, 1,
0.5684443, -0.2795545, 2.53396, 0, 0, 0, 1, 1,
0.5832281, 0.4759459, 1.712307, 0, 0, 0, 1, 1,
0.5838622, -1.115263, 2.738341, 0, 0, 0, 1, 1,
0.5863331, 0.1575118, 1.203805, 0, 0, 0, 1, 1,
0.588353, 1.118125, 0.2460417, 0, 0, 0, 1, 1,
0.5933771, 1.604786, 1.42106, 0, 0, 0, 1, 1,
0.5960086, 1.4842, -1.192251, 1, 1, 1, 1, 1,
0.5961056, 0.9297915, 1.470782, 1, 1, 1, 1, 1,
0.5986628, 0.1596721, 0.1411975, 1, 1, 1, 1, 1,
0.6081523, -0.5666313, 2.080645, 1, 1, 1, 1, 1,
0.6131141, -0.7084451, 3.891941, 1, 1, 1, 1, 1,
0.6166078, -0.05027787, 2.475921, 1, 1, 1, 1, 1,
0.6174431, 0.4686265, 0.2524658, 1, 1, 1, 1, 1,
0.6176277, -0.8175275, 4.271161, 1, 1, 1, 1, 1,
0.6199813, 0.1679082, 2.908128, 1, 1, 1, 1, 1,
0.6256642, -0.9985871, 3.523687, 1, 1, 1, 1, 1,
0.631867, -1.749766, 4.450566, 1, 1, 1, 1, 1,
0.6335544, 0.07092886, 1.830708, 1, 1, 1, 1, 1,
0.6338965, 1.887825, -2.36294, 1, 1, 1, 1, 1,
0.6360174, 0.6178341, 0.2035504, 1, 1, 1, 1, 1,
0.6406966, -0.009452119, 0.6316653, 1, 1, 1, 1, 1,
0.6416362, 2.296672, 0.9032331, 0, 0, 1, 1, 1,
0.6419652, -0.9508814, 1.151132, 1, 0, 0, 1, 1,
0.6421183, -1.405441, 1.570493, 1, 0, 0, 1, 1,
0.6424316, 0.2704422, 1.318618, 1, 0, 0, 1, 1,
0.654356, 1.117058, 0.67007, 1, 0, 0, 1, 1,
0.6557956, 0.4075593, 0.3993816, 1, 0, 0, 1, 1,
0.6564625, 1.175389, 0.7142774, 0, 0, 0, 1, 1,
0.6583499, 0.9695327, 1.683437, 0, 0, 0, 1, 1,
0.6593863, 0.03587462, 2.097589, 0, 0, 0, 1, 1,
0.6596726, -0.5127487, 1.102497, 0, 0, 0, 1, 1,
0.6611496, 0.3493097, -0.4535764, 0, 0, 0, 1, 1,
0.6639621, -0.3067472, 1.245465, 0, 0, 0, 1, 1,
0.6656331, 0.3062077, 1.551942, 0, 0, 0, 1, 1,
0.6723263, 0.6715954, 2.351769, 1, 1, 1, 1, 1,
0.6751724, -0.2475704, 1.469429, 1, 1, 1, 1, 1,
0.6790155, -0.56696, 3.608887, 1, 1, 1, 1, 1,
0.681514, 1.194149, 0.1705689, 1, 1, 1, 1, 1,
0.6825233, -1.551123, 3.302536, 1, 1, 1, 1, 1,
0.6841385, 1.16758, 1.351193, 1, 1, 1, 1, 1,
0.6884236, 1.06893, 2.389375, 1, 1, 1, 1, 1,
0.6914658, -0.4938703, 2.008195, 1, 1, 1, 1, 1,
0.6927376, 0.2912869, -0.7402204, 1, 1, 1, 1, 1,
0.6929438, -0.5691828, 2.212228, 1, 1, 1, 1, 1,
0.693441, 0.04236998, 2.608899, 1, 1, 1, 1, 1,
0.6940761, 1.450659, -0.4171412, 1, 1, 1, 1, 1,
0.7014945, 2.440919, -0.5176054, 1, 1, 1, 1, 1,
0.7100344, 0.4661203, 1.925444, 1, 1, 1, 1, 1,
0.7103152, 1.099235, 2.029657, 1, 1, 1, 1, 1,
0.7107487, 0.8128918, 1.875411, 0, 0, 1, 1, 1,
0.7177352, -0.2939796, 0.4973725, 1, 0, 0, 1, 1,
0.7195437, -0.5037043, 1.570726, 1, 0, 0, 1, 1,
0.7234931, -0.7463257, 3.981516, 1, 0, 0, 1, 1,
0.7244952, -0.03458549, 2.228053, 1, 0, 0, 1, 1,
0.7273794, -0.2279969, 1.104381, 1, 0, 0, 1, 1,
0.7327487, 0.7989971, 0.5920886, 0, 0, 0, 1, 1,
0.7331713, -0.3651692, 1.59452, 0, 0, 0, 1, 1,
0.7348409, -0.08631143, 0.9625604, 0, 0, 0, 1, 1,
0.7371188, 0.8070934, 1.24866, 0, 0, 0, 1, 1,
0.7378985, 0.1794132, -0.438313, 0, 0, 0, 1, 1,
0.7403705, 0.3445897, 0.5386692, 0, 0, 0, 1, 1,
0.7590061, -0.538102, 1.780938, 0, 0, 0, 1, 1,
0.7598566, -2.896016, 4.801207, 1, 1, 1, 1, 1,
0.7621009, -0.1827424, 0.3173431, 1, 1, 1, 1, 1,
0.7660272, -0.3771914, 1.48576, 1, 1, 1, 1, 1,
0.7660524, 0.6404549, 1.981348, 1, 1, 1, 1, 1,
0.7673749, -1.596896, 3.464203, 1, 1, 1, 1, 1,
0.770999, -0.6278201, 0.8226042, 1, 1, 1, 1, 1,
0.7724606, -0.3802252, 1.280533, 1, 1, 1, 1, 1,
0.7737931, 0.5602103, 1.562807, 1, 1, 1, 1, 1,
0.774615, 1.242357, -0.02577684, 1, 1, 1, 1, 1,
0.7748109, -1.741131, 4.45912, 1, 1, 1, 1, 1,
0.7754292, 0.3145618, 3.70069, 1, 1, 1, 1, 1,
0.7851169, 1.009679, 0.8529725, 1, 1, 1, 1, 1,
0.7882513, 0.335302, 1.818419, 1, 1, 1, 1, 1,
0.789359, 0.8479139, 1.195144, 1, 1, 1, 1, 1,
0.791438, 0.1340168, 2.715466, 1, 1, 1, 1, 1,
0.7926757, 0.2759627, 1.15328, 0, 0, 1, 1, 1,
0.7995433, -0.521538, 2.652899, 1, 0, 0, 1, 1,
0.8007082, 0.2732667, -0.1879684, 1, 0, 0, 1, 1,
0.8012732, -0.5984525, 2.941624, 1, 0, 0, 1, 1,
0.804, 0.06750291, 0.1960782, 1, 0, 0, 1, 1,
0.8114047, 0.5853239, 0.9279774, 1, 0, 0, 1, 1,
0.8143039, -0.854697, 0.6123266, 0, 0, 0, 1, 1,
0.8144966, -0.4292279, 4.045477, 0, 0, 0, 1, 1,
0.8231522, -1.58145, 2.479271, 0, 0, 0, 1, 1,
0.8309703, -2.97208, 2.006072, 0, 0, 0, 1, 1,
0.8344168, 0.9121259, 2.413843, 0, 0, 0, 1, 1,
0.8362926, -1.179499, 3.023638, 0, 0, 0, 1, 1,
0.8371124, -1.494372, 3.936288, 0, 0, 0, 1, 1,
0.8401279, 0.1612596, 2.44803, 1, 1, 1, 1, 1,
0.8406187, 0.4599868, -0.2623149, 1, 1, 1, 1, 1,
0.843024, 0.7146278, 1.045224, 1, 1, 1, 1, 1,
0.8458453, -0.5279765, 1.570136, 1, 1, 1, 1, 1,
0.8471479, -1.584542, 3.185426, 1, 1, 1, 1, 1,
0.8481635, -0.9078133, 3.330865, 1, 1, 1, 1, 1,
0.8533936, -0.2303321, 2.302631, 1, 1, 1, 1, 1,
0.8555076, 0.2851242, 0.3502199, 1, 1, 1, 1, 1,
0.858871, 1.540911, -0.6342006, 1, 1, 1, 1, 1,
0.8644593, 2.398638, -2.410136, 1, 1, 1, 1, 1,
0.8669528, 1.081527, -0.7258873, 1, 1, 1, 1, 1,
0.8674191, 0.3567505, 1.267525, 1, 1, 1, 1, 1,
0.8792252, -0.680681, 1.768701, 1, 1, 1, 1, 1,
0.8823155, -1.110371, 2.279537, 1, 1, 1, 1, 1,
0.8930573, 0.6700484, 2.934808, 1, 1, 1, 1, 1,
0.8945302, 0.3841944, 0.5455264, 0, 0, 1, 1, 1,
0.8975331, -1.021929, 1.15545, 1, 0, 0, 1, 1,
0.899954, -0.7159817, 1.785225, 1, 0, 0, 1, 1,
0.9018796, 1.401108, 0.3198498, 1, 0, 0, 1, 1,
0.9021556, 1.485884, -0.5246131, 1, 0, 0, 1, 1,
0.9043469, -0.2061853, 1.88173, 1, 0, 0, 1, 1,
0.9069875, -1.249365, 3.809115, 0, 0, 0, 1, 1,
0.907604, 0.7486961, 2.223255, 0, 0, 0, 1, 1,
0.9089563, 0.2937026, 0.4982148, 0, 0, 0, 1, 1,
0.9140086, -1.350238, 1.035829, 0, 0, 0, 1, 1,
0.9211539, 0.2890714, 0.955721, 0, 0, 0, 1, 1,
0.924795, 0.5075143, 0.6298445, 0, 0, 0, 1, 1,
0.936393, 1.565261, 2.067583, 0, 0, 0, 1, 1,
0.9371968, -0.3914847, 2.910407, 1, 1, 1, 1, 1,
0.937676, 2.378134, -0.1761294, 1, 1, 1, 1, 1,
0.9428574, 1.419518, 0.4635065, 1, 1, 1, 1, 1,
0.946826, -0.9039729, 3.493207, 1, 1, 1, 1, 1,
0.9509771, 0.4082261, 1.210333, 1, 1, 1, 1, 1,
0.9587368, 1.090077, 2.358069, 1, 1, 1, 1, 1,
0.9729947, -0.9978162, 2.017373, 1, 1, 1, 1, 1,
0.9745452, -3.258143, 3.89288, 1, 1, 1, 1, 1,
0.9808448, 0.769366, 1.519045, 1, 1, 1, 1, 1,
0.9896404, -0.0607251, 1.417247, 1, 1, 1, 1, 1,
0.9998433, 1.286025, 1.596991, 1, 1, 1, 1, 1,
1.005213, -0.08152604, 1.281141, 1, 1, 1, 1, 1,
1.011844, -1.187048, 1.028901, 1, 1, 1, 1, 1,
1.025166, -1.690683, 2.842162, 1, 1, 1, 1, 1,
1.029097, 0.3043289, 2.256979, 1, 1, 1, 1, 1,
1.036264, -0.64982, 1.03652, 0, 0, 1, 1, 1,
1.039896, -1.369797, 1.790664, 1, 0, 0, 1, 1,
1.041346, -2.594055, 3.173779, 1, 0, 0, 1, 1,
1.044823, 0.6919995, 1.962605, 1, 0, 0, 1, 1,
1.055427, -0.3114698, 2.361613, 1, 0, 0, 1, 1,
1.063251, 0.343631, 2.470251, 1, 0, 0, 1, 1,
1.070895, 0.3194461, 2.064754, 0, 0, 0, 1, 1,
1.075071, -0.3654673, 0.2681645, 0, 0, 0, 1, 1,
1.079286, -1.387799, 2.096819, 0, 0, 0, 1, 1,
1.081913, 1.815456, -0.1684076, 0, 0, 0, 1, 1,
1.08909, 0.5673892, 2.551296, 0, 0, 0, 1, 1,
1.090667, -1.67436, 2.682953, 0, 0, 0, 1, 1,
1.095674, -0.8335449, 1.899621, 0, 0, 0, 1, 1,
1.095756, -1.00061, 1.229841, 1, 1, 1, 1, 1,
1.104331, -1.986326, 2.958045, 1, 1, 1, 1, 1,
1.10448, 0.6204897, 0.9317918, 1, 1, 1, 1, 1,
1.104799, -1.264303, 3.641098, 1, 1, 1, 1, 1,
1.111441, 0.02254893, -0.3302023, 1, 1, 1, 1, 1,
1.127191, 0.1677668, 2.123432, 1, 1, 1, 1, 1,
1.129719, 0.03094053, 0.3222162, 1, 1, 1, 1, 1,
1.131068, 0.70885, -1.553552, 1, 1, 1, 1, 1,
1.135188, 0.9504771, 0.2790046, 1, 1, 1, 1, 1,
1.135359, 0.9485668, -0.06063308, 1, 1, 1, 1, 1,
1.140109, 0.9275671, 1.065967, 1, 1, 1, 1, 1,
1.147425, 1.038637, 0.9726684, 1, 1, 1, 1, 1,
1.149309, -1.106899, 1.952156, 1, 1, 1, 1, 1,
1.151494, -1.164197, 1.704304, 1, 1, 1, 1, 1,
1.151974, 0.7255426, 0.5981204, 1, 1, 1, 1, 1,
1.15249, 0.9712701, 1.569353, 0, 0, 1, 1, 1,
1.161687, 0.7685736, 0.5789163, 1, 0, 0, 1, 1,
1.163895, -0.8130426, 2.572916, 1, 0, 0, 1, 1,
1.167582, -0.7832239, 2.482039, 1, 0, 0, 1, 1,
1.169653, 0.741223, 0.3669955, 1, 0, 0, 1, 1,
1.184806, 1.733602, -1.543143, 1, 0, 0, 1, 1,
1.199942, -1.736618, 1.714256, 0, 0, 0, 1, 1,
1.200847, -0.01060697, 1.406989, 0, 0, 0, 1, 1,
1.209104, 0.7682852, 1.879614, 0, 0, 0, 1, 1,
1.210921, 0.02302847, 1.143297, 0, 0, 0, 1, 1,
1.217556, 0.8484885, 1.493996, 0, 0, 0, 1, 1,
1.224391, 1.551217, 1.853607, 0, 0, 0, 1, 1,
1.224496, -0.1753568, 0.361881, 0, 0, 0, 1, 1,
1.226137, 0.7711951, 0.1664482, 1, 1, 1, 1, 1,
1.226428, 0.1213692, 1.989758, 1, 1, 1, 1, 1,
1.235364, -0.8547325, 3.66448, 1, 1, 1, 1, 1,
1.23831, 1.401024, 1.760222, 1, 1, 1, 1, 1,
1.239063, 1.22292, 1.555862, 1, 1, 1, 1, 1,
1.239182, 1.022642, -0.0945864, 1, 1, 1, 1, 1,
1.241496, -0.06305911, 1.769606, 1, 1, 1, 1, 1,
1.248238, -0.3761629, 2.020815, 1, 1, 1, 1, 1,
1.254256, -0.701107, 2.960394, 1, 1, 1, 1, 1,
1.2602, -1.518727, 3.430553, 1, 1, 1, 1, 1,
1.269649, -0.737212, 1.360359, 1, 1, 1, 1, 1,
1.273852, -0.0250001, 2.70573, 1, 1, 1, 1, 1,
1.27729, 2.099701, -0.2443024, 1, 1, 1, 1, 1,
1.289646, 0.2508911, 1.761614, 1, 1, 1, 1, 1,
1.296166, 1.396613, 1.466642, 1, 1, 1, 1, 1,
1.298656, 1.138022, 1.162206, 0, 0, 1, 1, 1,
1.307398, -0.2774959, 1.732278, 1, 0, 0, 1, 1,
1.310224, 0.6842496, 0.1970471, 1, 0, 0, 1, 1,
1.316029, 0.6294286, 0.9877474, 1, 0, 0, 1, 1,
1.318446, -0.5611584, 2.970499, 1, 0, 0, 1, 1,
1.321154, 0.2439297, 2.003273, 1, 0, 0, 1, 1,
1.327859, 0.2400771, 1.462657, 0, 0, 0, 1, 1,
1.329571, 1.993722, 2.993134, 0, 0, 0, 1, 1,
1.339164, 0.2690118, -0.1681808, 0, 0, 0, 1, 1,
1.351269, -0.598679, 3.592465, 0, 0, 0, 1, 1,
1.3515, 1.090736, 1.247161, 0, 0, 0, 1, 1,
1.352719, 0.5143416, 1.939064, 0, 0, 0, 1, 1,
1.370447, 0.3668243, 1.938606, 0, 0, 0, 1, 1,
1.379447, -1.241728, 2.054344, 1, 1, 1, 1, 1,
1.392107, -0.8602272, 1.239214, 1, 1, 1, 1, 1,
1.396123, -0.6871996, 0.8105637, 1, 1, 1, 1, 1,
1.403418, -0.4436825, 2.945238, 1, 1, 1, 1, 1,
1.410455, 0.054028, 0.4982116, 1, 1, 1, 1, 1,
1.421666, -2.486761, 2.195261, 1, 1, 1, 1, 1,
1.438053, -0.9275913, 1.570147, 1, 1, 1, 1, 1,
1.451172, -1.046053, 2.917459, 1, 1, 1, 1, 1,
1.453894, 1.1912, 0.8519083, 1, 1, 1, 1, 1,
1.464585, -1.439589, 2.161784, 1, 1, 1, 1, 1,
1.469376, 0.5263478, 0.03371703, 1, 1, 1, 1, 1,
1.469527, 0.2105591, 1.218301, 1, 1, 1, 1, 1,
1.479001, 0.7234873, 2.123889, 1, 1, 1, 1, 1,
1.492624, 1.043594, 0.000104208, 1, 1, 1, 1, 1,
1.492729, 0.3448288, 0.2056712, 1, 1, 1, 1, 1,
1.493328, 0.1442636, 1.126715, 0, 0, 1, 1, 1,
1.496115, 1.5609, 0.5396656, 1, 0, 0, 1, 1,
1.498569, -0.1940222, 0.9640309, 1, 0, 0, 1, 1,
1.503423, -0.985783, 2.660763, 1, 0, 0, 1, 1,
1.509145, -0.378298, 1.450973, 1, 0, 0, 1, 1,
1.512053, 1.432652, -0.3660639, 1, 0, 0, 1, 1,
1.545605, 1.213721, -0.3839748, 0, 0, 0, 1, 1,
1.59092, -0.3874812, 1.152318, 0, 0, 0, 1, 1,
1.593943, -1.517664, 3.027359, 0, 0, 0, 1, 1,
1.599267, -0.8929586, 3.883524, 0, 0, 0, 1, 1,
1.613452, -0.8180868, 2.418169, 0, 0, 0, 1, 1,
1.620152, -0.8708321, 0.330815, 0, 0, 0, 1, 1,
1.639689, -1.856169, 1.529982, 0, 0, 0, 1, 1,
1.65956, -0.0762524, 2.354413, 1, 1, 1, 1, 1,
1.661163, 0.1165734, 2.519901, 1, 1, 1, 1, 1,
1.661803, -0.6789523, 2.387703, 1, 1, 1, 1, 1,
1.668218, 0.01836454, 1.140037, 1, 1, 1, 1, 1,
1.672678, -1.061926, 0.97005, 1, 1, 1, 1, 1,
1.673051, 0.6249063, 0.3913661, 1, 1, 1, 1, 1,
1.693492, 0.3003063, 1.547956, 1, 1, 1, 1, 1,
1.711369, -0.1749993, 0.8297436, 1, 1, 1, 1, 1,
1.723668, 1.083866, 0.6642357, 1, 1, 1, 1, 1,
1.735469, -0.9140839, 1.909541, 1, 1, 1, 1, 1,
1.756075, -0.7458918, 1.701466, 1, 1, 1, 1, 1,
1.759728, 0.2946962, 2.171194, 1, 1, 1, 1, 1,
1.773898, -0.9695752, 2.281137, 1, 1, 1, 1, 1,
1.775283, -0.8434024, 2.962794, 1, 1, 1, 1, 1,
1.777159, 2.133494, 0.2863011, 1, 1, 1, 1, 1,
1.798487, -0.06223327, 2.292516, 0, 0, 1, 1, 1,
1.805154, -0.7444921, 2.559622, 1, 0, 0, 1, 1,
1.811551, 0.4869565, 1.777695, 1, 0, 0, 1, 1,
1.814025, -0.6550933, 4.262351, 1, 0, 0, 1, 1,
1.826212, 0.759087, 2.691913, 1, 0, 0, 1, 1,
1.830785, -0.2003154, 0.6380836, 1, 0, 0, 1, 1,
1.837396, -0.9440976, 1.395145, 0, 0, 0, 1, 1,
1.844273, -0.7222828, 2.079257, 0, 0, 0, 1, 1,
1.852503, 1.447132, 0.438248, 0, 0, 0, 1, 1,
1.886114, 2.047011, 0.4909037, 0, 0, 0, 1, 1,
1.893294, 0.5231533, 1.230727, 0, 0, 0, 1, 1,
1.913379, 0.498766, 1.073512, 0, 0, 0, 1, 1,
1.915464, -1.927815, 1.393122, 0, 0, 0, 1, 1,
1.946724, -0.5319383, 2.291571, 1, 1, 1, 1, 1,
1.949223, -0.4822132, 0.7851377, 1, 1, 1, 1, 1,
1.952349, 1.411886, 0.7725427, 1, 1, 1, 1, 1,
1.953002, 2.076492, -0.834365, 1, 1, 1, 1, 1,
1.968635, -0.4791081, 0.4332565, 1, 1, 1, 1, 1,
1.986021, 1.068496, 2.025629, 1, 1, 1, 1, 1,
2.009959, -0.4564653, 2.057081, 1, 1, 1, 1, 1,
2.023628, -0.8386176, 1.757071, 1, 1, 1, 1, 1,
2.028105, 0.5625021, -0.2188401, 1, 1, 1, 1, 1,
2.032361, 0.6567752, 1.782969, 1, 1, 1, 1, 1,
2.055409, 0.6031047, 1.315478, 1, 1, 1, 1, 1,
2.061368, 0.6571692, 1.653613, 1, 1, 1, 1, 1,
2.078285, 0.9523997, 2.698374, 1, 1, 1, 1, 1,
2.119857, -0.5806594, 1.219139, 1, 1, 1, 1, 1,
2.166697, -0.001343276, 0.8289496, 1, 1, 1, 1, 1,
2.186147, 1.005449, 0.3142547, 0, 0, 1, 1, 1,
2.197895, 0.8613998, 0.7113255, 1, 0, 0, 1, 1,
2.207001, -0.6130024, 2.40797, 1, 0, 0, 1, 1,
2.225111, -0.2817352, 2.155236, 1, 0, 0, 1, 1,
2.231288, 0.6620708, 1.51272, 1, 0, 0, 1, 1,
2.231987, 0.1703129, -0.4171185, 1, 0, 0, 1, 1,
2.240971, 0.8095072, 1.081655, 0, 0, 0, 1, 1,
2.262394, 0.4112802, 0.6260603, 0, 0, 0, 1, 1,
2.263045, -1.389431, 1.673428, 0, 0, 0, 1, 1,
2.354308, -0.276237, 2.614026, 0, 0, 0, 1, 1,
2.4129, -0.6514486, 2.408911, 0, 0, 0, 1, 1,
2.480539, 0.3740259, 0.6500977, 0, 0, 0, 1, 1,
2.521146, 0.1467268, -0.5684032, 0, 0, 0, 1, 1,
2.666375, -0.92361, 1.579911, 1, 1, 1, 1, 1,
2.682364, 0.1360733, 1.034643, 1, 1, 1, 1, 1,
2.758109, -0.05409893, 1.90516, 1, 1, 1, 1, 1,
2.93317, 1.116508, 0.5339872, 1, 1, 1, 1, 1,
2.947445, -0.02457992, -0.4623215, 1, 1, 1, 1, 1,
3.052891, 1.258359, 0.4536087, 1, 1, 1, 1, 1,
3.185848, -1.065203, 3.183755, 1, 1, 1, 1, 1
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
var radius = 9.676654;
var distance = 33.98883;
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
mvMatrix.translate( 0.2214909, 0.28882, 0.324465 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98883);
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
