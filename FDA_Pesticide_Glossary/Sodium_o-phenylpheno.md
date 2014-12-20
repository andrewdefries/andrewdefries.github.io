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
-3.057651, 1.06713, -1.972656, 1, 0, 0, 1,
-2.981076, 0.409141, -0.2489928, 1, 0.007843138, 0, 1,
-2.894006, -1.381324, -2.849816, 1, 0.01176471, 0, 1,
-2.828932, -0.3138993, -3.264166, 1, 0.01960784, 0, 1,
-2.803538, -2.22568, -3.059826, 1, 0.02352941, 0, 1,
-2.768228, -0.6687357, -1.526227, 1, 0.03137255, 0, 1,
-2.717944, 0.1596155, -0.8288198, 1, 0.03529412, 0, 1,
-2.557822, -0.6120589, -2.81425, 1, 0.04313726, 0, 1,
-2.539158, 0.177673, -0.6615105, 1, 0.04705882, 0, 1,
-2.426351, 2.079482, -1.47621, 1, 0.05490196, 0, 1,
-2.364568, 0.1914524, -2.490755, 1, 0.05882353, 0, 1,
-2.359165, 2.470893, -1.628535, 1, 0.06666667, 0, 1,
-2.308409, 0.4410293, -0.976872, 1, 0.07058824, 0, 1,
-2.262546, 0.5269147, -2.688236, 1, 0.07843138, 0, 1,
-2.252369, 2.074387, -1.774607, 1, 0.08235294, 0, 1,
-2.251988, -0.5205873, -1.298325, 1, 0.09019608, 0, 1,
-2.243121, -1.127005, -2.714934, 1, 0.09411765, 0, 1,
-2.194316, -1.11027, -2.959733, 1, 0.1019608, 0, 1,
-2.104245, -0.05167341, -0.09514742, 1, 0.1098039, 0, 1,
-2.081904, -0.9936994, -1.795863, 1, 0.1137255, 0, 1,
-2.021231, -0.8858382, -2.397663, 1, 0.1215686, 0, 1,
-2.018024, 0.4812268, -2.300589, 1, 0.1254902, 0, 1,
-2.006229, 0.0804437, -2.07928, 1, 0.1333333, 0, 1,
-1.993156, 0.9420352, 0.3438371, 1, 0.1372549, 0, 1,
-1.971428, 0.03207835, -1.701241, 1, 0.145098, 0, 1,
-1.970771, -0.532816, -2.279077, 1, 0.1490196, 0, 1,
-1.923543, -0.9650236, -1.357892, 1, 0.1568628, 0, 1,
-1.900643, 0.2742417, -2.993134, 1, 0.1607843, 0, 1,
-1.894027, -1.381182, -3.84535, 1, 0.1686275, 0, 1,
-1.885459, 0.2176527, -3.561737, 1, 0.172549, 0, 1,
-1.884813, 2.016115, -2.278316, 1, 0.1803922, 0, 1,
-1.884321, -0.1267698, -2.012856, 1, 0.1843137, 0, 1,
-1.876942, -0.9127148, -1.895068, 1, 0.1921569, 0, 1,
-1.856389, 0.4108208, -1.366263, 1, 0.1960784, 0, 1,
-1.847282, -1.360738, -3.86599, 1, 0.2039216, 0, 1,
-1.839622, 1.845239, -0.1108397, 1, 0.2117647, 0, 1,
-1.821444, -1.135622, -3.69467, 1, 0.2156863, 0, 1,
-1.80896, 0.1954218, -1.913756, 1, 0.2235294, 0, 1,
-1.799723, 0.4822777, -2.13169, 1, 0.227451, 0, 1,
-1.798302, 0.6276789, -0.02082483, 1, 0.2352941, 0, 1,
-1.780218, 0.5201244, -1.386208, 1, 0.2392157, 0, 1,
-1.772385, 0.3144752, -1.838018, 1, 0.2470588, 0, 1,
-1.70936, 0.2176841, -2.241018, 1, 0.2509804, 0, 1,
-1.688305, -0.1266638, 0.4845588, 1, 0.2588235, 0, 1,
-1.682369, -1.533715, -1.057376, 1, 0.2627451, 0, 1,
-1.674912, 1.544609, -0.7750294, 1, 0.2705882, 0, 1,
-1.646796, 0.119658, 0.06892945, 1, 0.2745098, 0, 1,
-1.646411, 0.5973238, -3.317543, 1, 0.282353, 0, 1,
-1.644264, -0.01357183, -2.082434, 1, 0.2862745, 0, 1,
-1.631491, -0.8541197, -1.080779, 1, 0.2941177, 0, 1,
-1.631324, 0.5370713, -0.824518, 1, 0.3019608, 0, 1,
-1.59442, 0.4787878, -0.5703214, 1, 0.3058824, 0, 1,
-1.589159, 0.3547924, 0.2344075, 1, 0.3137255, 0, 1,
-1.587773, -0.6113318, -3.454994, 1, 0.3176471, 0, 1,
-1.583213, -1.136929, -0.778539, 1, 0.3254902, 0, 1,
-1.582067, 0.7742567, -2.990192, 1, 0.3294118, 0, 1,
-1.56012, -0.4675465, -1.078531, 1, 0.3372549, 0, 1,
-1.559386, -0.09174644, -1.239877, 1, 0.3411765, 0, 1,
-1.557626, -1.800399, -2.459519, 1, 0.3490196, 0, 1,
-1.555266, 0.8922747, -2.613203, 1, 0.3529412, 0, 1,
-1.553674, 0.0004467868, -3.717917, 1, 0.3607843, 0, 1,
-1.553655, -1.510207, -1.604464, 1, 0.3647059, 0, 1,
-1.536073, -0.3920781, -1.466299, 1, 0.372549, 0, 1,
-1.534904, -0.6376038, -0.7378044, 1, 0.3764706, 0, 1,
-1.523985, -1.900447, -2.968819, 1, 0.3843137, 0, 1,
-1.51999, 0.8274193, -0.3502852, 1, 0.3882353, 0, 1,
-1.517025, 0.1907616, -0.496448, 1, 0.3960784, 0, 1,
-1.517018, 0.2162891, -1.38639, 1, 0.4039216, 0, 1,
-1.507515, -0.1543064, -2.927383, 1, 0.4078431, 0, 1,
-1.487895, 0.266238, 1.052508, 1, 0.4156863, 0, 1,
-1.47774, -0.9305257, -1.233522, 1, 0.4196078, 0, 1,
-1.47478, 1.847764, 0.2791506, 1, 0.427451, 0, 1,
-1.470083, 1.162245, 0.9382279, 1, 0.4313726, 0, 1,
-1.458934, 0.2370958, -1.288535, 1, 0.4392157, 0, 1,
-1.457075, 0.334236, -1.892369, 1, 0.4431373, 0, 1,
-1.454826, 0.3830765, -2.356297, 1, 0.4509804, 0, 1,
-1.45302, -0.8002223, -1.877649, 1, 0.454902, 0, 1,
-1.448858, -1.474463, -2.873263, 1, 0.4627451, 0, 1,
-1.43736, -0.9882653, -2.576162, 1, 0.4666667, 0, 1,
-1.435551, -0.1603833, -0.682133, 1, 0.4745098, 0, 1,
-1.42425, -1.000301, -1.694923, 1, 0.4784314, 0, 1,
-1.41415, 0.9156798, -0.0235961, 1, 0.4862745, 0, 1,
-1.408536, -0.6898955, -2.304708, 1, 0.4901961, 0, 1,
-1.398039, 1.944699, -0.5367258, 1, 0.4980392, 0, 1,
-1.380572, 0.8054273, -2.767066, 1, 0.5058824, 0, 1,
-1.373263, 0.4674496, -2.011151, 1, 0.509804, 0, 1,
-1.369014, 1.471552, -1.177357, 1, 0.5176471, 0, 1,
-1.367848, 0.3170048, -1.76841, 1, 0.5215687, 0, 1,
-1.365475, 1.143225, -2.574628, 1, 0.5294118, 0, 1,
-1.364454, -0.6008328, -1.961003, 1, 0.5333334, 0, 1,
-1.36427, -0.2716943, -1.849767, 1, 0.5411765, 0, 1,
-1.361208, 0.4851349, -2.193282, 1, 0.5450981, 0, 1,
-1.355839, 0.925933, -0.3970218, 1, 0.5529412, 0, 1,
-1.354566, 1.701997, -4.026052, 1, 0.5568628, 0, 1,
-1.353418, -0.03496252, -0.765772, 1, 0.5647059, 0, 1,
-1.345631, -0.3284786, -0.2837127, 1, 0.5686275, 0, 1,
-1.342213, -1.461137, -2.652348, 1, 0.5764706, 0, 1,
-1.341467, -0.8409311, -2.14336, 1, 0.5803922, 0, 1,
-1.340314, 1.212216, -0.5186989, 1, 0.5882353, 0, 1,
-1.293963, 2.20201, -0.6824647, 1, 0.5921569, 0, 1,
-1.291596, -0.38116, -1.753659, 1, 0.6, 0, 1,
-1.290697, -0.4456279, -1.962096, 1, 0.6078432, 0, 1,
-1.290667, -0.8458979, -2.288199, 1, 0.6117647, 0, 1,
-1.28767, -2.493333, -3.045043, 1, 0.6196079, 0, 1,
-1.270183, -1.788407, -2.217984, 1, 0.6235294, 0, 1,
-1.266301, 0.2307445, -0.6408242, 1, 0.6313726, 0, 1,
-1.260644, -1.061674, -0.461408, 1, 0.6352941, 0, 1,
-1.259719, -0.9608392, -2.536913, 1, 0.6431373, 0, 1,
-1.249759, -0.6902889, -2.98328, 1, 0.6470588, 0, 1,
-1.202034, -0.1881277, -1.552535, 1, 0.654902, 0, 1,
-1.195258, -0.2758444, -2.688202, 1, 0.6588235, 0, 1,
-1.192906, -0.5112948, -2.214754, 1, 0.6666667, 0, 1,
-1.188992, -1.884194, -4.065401, 1, 0.6705883, 0, 1,
-1.18443, -0.4569314, -0.9810176, 1, 0.6784314, 0, 1,
-1.183803, 0.3617507, -1.340207, 1, 0.682353, 0, 1,
-1.181959, 0.715414, -0.2492605, 1, 0.6901961, 0, 1,
-1.180562, -0.05463685, -0.1820793, 1, 0.6941177, 0, 1,
-1.177675, 0.2647537, 0.4514326, 1, 0.7019608, 0, 1,
-1.175474, -0.6752274, -3.781672, 1, 0.7098039, 0, 1,
-1.169207, 2.061961, 0.8695519, 1, 0.7137255, 0, 1,
-1.165316, 0.5397737, 1.80746, 1, 0.7215686, 0, 1,
-1.152511, -0.2103413, -2.671597, 1, 0.7254902, 0, 1,
-1.150969, 0.4138453, -0.4851748, 1, 0.7333333, 0, 1,
-1.148535, 0.3062756, -1.777611, 1, 0.7372549, 0, 1,
-1.14317, 1.96281, 1.379398, 1, 0.7450981, 0, 1,
-1.137886, -0.6491483, -3.350244, 1, 0.7490196, 0, 1,
-1.133245, -0.1897071, -2.668086, 1, 0.7568628, 0, 1,
-1.123721, 1.480411, -1.017798, 1, 0.7607843, 0, 1,
-1.120842, 1.424237, -0.3239315, 1, 0.7686275, 0, 1,
-1.119409, -0.1114055, -1.665518, 1, 0.772549, 0, 1,
-1.119331, 0.167277, -2.573468, 1, 0.7803922, 0, 1,
-1.114635, 0.631321, -2.208644, 1, 0.7843137, 0, 1,
-1.113042, -1.457559, -2.817254, 1, 0.7921569, 0, 1,
-1.097635, 1.133567, 0.1606284, 1, 0.7960784, 0, 1,
-1.09352, -0.1387693, -1.19913, 1, 0.8039216, 0, 1,
-1.092822, -1.263007, -3.193816, 1, 0.8117647, 0, 1,
-1.08629, 0.3311445, 0.8026876, 1, 0.8156863, 0, 1,
-1.076884, 1.005445, -1.263804, 1, 0.8235294, 0, 1,
-1.076696, 1.114347, 0.2518, 1, 0.827451, 0, 1,
-1.076415, -0.2536748, -2.66709, 1, 0.8352941, 0, 1,
-1.071024, -0.1264864, -2.161761, 1, 0.8392157, 0, 1,
-1.070225, -1.003635, -0.8911053, 1, 0.8470588, 0, 1,
-1.069145, 0.3718911, -0.330025, 1, 0.8509804, 0, 1,
-1.06862, 0.6438406, -2.426593, 1, 0.8588235, 0, 1,
-1.052197, -0.8931207, -2.881746, 1, 0.8627451, 0, 1,
-1.048705, -0.7750136, -2.960675, 1, 0.8705882, 0, 1,
-1.047805, 0.600763, -0.2958047, 1, 0.8745098, 0, 1,
-1.04125, 0.5411058, -1.528322, 1, 0.8823529, 0, 1,
-1.024172, 0.7610889, 0.08848256, 1, 0.8862745, 0, 1,
-1.019021, -0.1999006, -1.46968, 1, 0.8941177, 0, 1,
-1.01727, 0.8232519, 0.2471958, 1, 0.8980392, 0, 1,
-1.013114, 0.08407789, 0.8118691, 1, 0.9058824, 0, 1,
-1.010278, -0.4853652, -1.707964, 1, 0.9137255, 0, 1,
-1.009549, 0.6661302, -0.6445856, 1, 0.9176471, 0, 1,
-1.004182, -0.3534696, -1.879514, 1, 0.9254902, 0, 1,
-1.0004, -0.05256653, -2.149873, 1, 0.9294118, 0, 1,
-1.000188, -0.5082059, -1.717131, 1, 0.9372549, 0, 1,
-0.9960506, -0.2893419, -1.587983, 1, 0.9411765, 0, 1,
-0.991071, -0.1184041, -2.515281, 1, 0.9490196, 0, 1,
-0.9876233, -1.388993, -2.65261, 1, 0.9529412, 0, 1,
-0.9871325, -1.496357, -3.443581, 1, 0.9607843, 0, 1,
-0.9759933, 1.823734, -0.2062009, 1, 0.9647059, 0, 1,
-0.973403, 0.1069886, -2.405753, 1, 0.972549, 0, 1,
-0.9695825, -1.169368, -3.105783, 1, 0.9764706, 0, 1,
-0.9629952, 0.4051289, -0.9904658, 1, 0.9843137, 0, 1,
-0.9549277, -0.2454138, -3.281706, 1, 0.9882353, 0, 1,
-0.9461063, 0.9882993, -0.2210112, 1, 0.9960784, 0, 1,
-0.9457236, -0.3421368, -0.7041205, 0.9960784, 1, 0, 1,
-0.9447265, -1.941481, -3.275871, 0.9921569, 1, 0, 1,
-0.9435428, 0.1047082, -0.8821319, 0.9843137, 1, 0, 1,
-0.9420732, -0.7009971, -1.19321, 0.9803922, 1, 0, 1,
-0.9392071, 0.1528021, 1.189522, 0.972549, 1, 0, 1,
-0.9328378, 2.509453, -0.9002998, 0.9686275, 1, 0, 1,
-0.9249073, -0.6522565, -0.9951432, 0.9607843, 1, 0, 1,
-0.9190353, 1.538865, -1.288839, 0.9568627, 1, 0, 1,
-0.9055958, -0.1880313, -2.826656, 0.9490196, 1, 0, 1,
-0.9044882, 0.399884, 0.2195061, 0.945098, 1, 0, 1,
-0.9041291, -1.20544, -2.558864, 0.9372549, 1, 0, 1,
-0.9022556, -1.29815, -2.83322, 0.9333333, 1, 0, 1,
-0.9021074, -1.565762, -2.63382, 0.9254902, 1, 0, 1,
-0.9019719, -0.8701001, -1.404176, 0.9215686, 1, 0, 1,
-0.900795, 1.831173, -1.381557, 0.9137255, 1, 0, 1,
-0.8981366, -0.4136496, -1.37709, 0.9098039, 1, 0, 1,
-0.8940963, 1.336379, -0.5474049, 0.9019608, 1, 0, 1,
-0.8937027, 0.4122773, -1.986829, 0.8941177, 1, 0, 1,
-0.8852067, 0.7811666, -0.258953, 0.8901961, 1, 0, 1,
-0.8808931, -0.7397308, -2.802984, 0.8823529, 1, 0, 1,
-0.880722, -2.93739, -1.898095, 0.8784314, 1, 0, 1,
-0.8789479, -0.7244665, 0.6239029, 0.8705882, 1, 0, 1,
-0.8663701, -0.734795, -3.534919, 0.8666667, 1, 0, 1,
-0.8590862, 0.7816684, -0.04185582, 0.8588235, 1, 0, 1,
-0.8585392, 0.2562394, -0.1376722, 0.854902, 1, 0, 1,
-0.8581917, -1.815985, -4.210499, 0.8470588, 1, 0, 1,
-0.8523893, -0.7892409, -2.035415, 0.8431373, 1, 0, 1,
-0.8510596, 0.4446557, -1.335776, 0.8352941, 1, 0, 1,
-0.8459709, 0.3078723, -0.7438086, 0.8313726, 1, 0, 1,
-0.8423331, 0.2787947, 0.4692385, 0.8235294, 1, 0, 1,
-0.841464, -0.2947083, -2.692518, 0.8196079, 1, 0, 1,
-0.8372008, -0.09892491, -4.400408, 0.8117647, 1, 0, 1,
-0.834969, -1.788994, -1.018595, 0.8078431, 1, 0, 1,
-0.832719, 0.4935729, 1.13064, 0.8, 1, 0, 1,
-0.8273129, 0.8730368, 0.2525915, 0.7921569, 1, 0, 1,
-0.8183911, -0.1646725, -3.007276, 0.7882353, 1, 0, 1,
-0.8135223, 0.440014, -1.055136, 0.7803922, 1, 0, 1,
-0.8119581, 0.8663771, -0.4196024, 0.7764706, 1, 0, 1,
-0.8095317, -0.5014793, -5.372539, 0.7686275, 1, 0, 1,
-0.8025241, 1.562724, 1.444597, 0.7647059, 1, 0, 1,
-0.7983693, -1.651155, -2.712284, 0.7568628, 1, 0, 1,
-0.7960678, 1.12004, -1.061061, 0.7529412, 1, 0, 1,
-0.7955407, -1.155321, -1.641082, 0.7450981, 1, 0, 1,
-0.7943771, -1.606788, -1.673245, 0.7411765, 1, 0, 1,
-0.7909692, 1.532862, -0.2365093, 0.7333333, 1, 0, 1,
-0.7863261, -0.2101314, -1.195885, 0.7294118, 1, 0, 1,
-0.7833043, -1.494993, -1.68202, 0.7215686, 1, 0, 1,
-0.7814464, -2.410477, -2.316809, 0.7176471, 1, 0, 1,
-0.7800719, 0.2111234, -2.249967, 0.7098039, 1, 0, 1,
-0.7783422, 0.5264927, -0.8511305, 0.7058824, 1, 0, 1,
-0.7765039, 0.4560472, -1.031119, 0.6980392, 1, 0, 1,
-0.7622606, -1.711606, -2.523453, 0.6901961, 1, 0, 1,
-0.754723, -1.74513, -4.681605, 0.6862745, 1, 0, 1,
-0.7484255, -0.8845508, -1.41999, 0.6784314, 1, 0, 1,
-0.7445102, 0.4174292, -2.253234, 0.6745098, 1, 0, 1,
-0.740735, 0.3731647, -1.226939, 0.6666667, 1, 0, 1,
-0.7401291, 1.038585, -1.427657, 0.6627451, 1, 0, 1,
-0.7361558, -0.3290021, -3.300371, 0.654902, 1, 0, 1,
-0.734664, 0.09434548, -0.933136, 0.6509804, 1, 0, 1,
-0.7309657, -0.8995255, -4.61411, 0.6431373, 1, 0, 1,
-0.7304122, 0.2444556, -0.4205319, 0.6392157, 1, 0, 1,
-0.7285216, 0.2382366, -1.941105, 0.6313726, 1, 0, 1,
-0.7251198, 1.111569, 0.2826885, 0.627451, 1, 0, 1,
-0.72438, -1.059389, -3.518816, 0.6196079, 1, 0, 1,
-0.721437, -0.6876563, -2.519511, 0.6156863, 1, 0, 1,
-0.7147105, 2.267655, -0.4007015, 0.6078432, 1, 0, 1,
-0.7112003, -0.8675687, -3.545332, 0.6039216, 1, 0, 1,
-0.7095476, -1.060599, -1.922652, 0.5960785, 1, 0, 1,
-0.7094889, 2.341262, -0.8628785, 0.5882353, 1, 0, 1,
-0.706468, -0.4841056, -3.064634, 0.5843138, 1, 0, 1,
-0.7009281, 0.06398107, -2.181021, 0.5764706, 1, 0, 1,
-0.6979983, 0.6968516, -1.184306, 0.572549, 1, 0, 1,
-0.6949626, 1.639404, -0.9209893, 0.5647059, 1, 0, 1,
-0.6948191, 0.1446538, -0.08315113, 0.5607843, 1, 0, 1,
-0.6874403, -0.2818989, -2.908697, 0.5529412, 1, 0, 1,
-0.6836731, -0.4757301, -2.764438, 0.5490196, 1, 0, 1,
-0.6825902, -1.255427, -2.277203, 0.5411765, 1, 0, 1,
-0.6806964, -0.4364902, -0.8632118, 0.5372549, 1, 0, 1,
-0.6770946, -0.3297757, -2.074358, 0.5294118, 1, 0, 1,
-0.6715346, -0.09909488, -3.024597, 0.5254902, 1, 0, 1,
-0.6653289, 0.6540846, -1.858708, 0.5176471, 1, 0, 1,
-0.6651319, 0.874773, 0.4212281, 0.5137255, 1, 0, 1,
-0.6634767, 0.1112385, -1.893055, 0.5058824, 1, 0, 1,
-0.6600315, 0.08091903, -1.482074, 0.5019608, 1, 0, 1,
-0.6526261, -0.4959482, -0.5531872, 0.4941176, 1, 0, 1,
-0.6512529, -1.739268, -1.403684, 0.4862745, 1, 0, 1,
-0.6508172, 2.712943, -0.9179019, 0.4823529, 1, 0, 1,
-0.650489, -0.3336767, -1.966397, 0.4745098, 1, 0, 1,
-0.6495724, 0.4499384, -1.101865, 0.4705882, 1, 0, 1,
-0.6471725, -0.3719099, -0.8517216, 0.4627451, 1, 0, 1,
-0.641533, -1.150421, -3.264882, 0.4588235, 1, 0, 1,
-0.6412072, 1.495574, 0.9181767, 0.4509804, 1, 0, 1,
-0.6380783, -0.6303685, -3.241452, 0.4470588, 1, 0, 1,
-0.6367925, 0.4969606, 0.1383311, 0.4392157, 1, 0, 1,
-0.6345493, 0.8196809, -0.09516399, 0.4352941, 1, 0, 1,
-0.6331984, 0.585395, -1.620116, 0.427451, 1, 0, 1,
-0.6331714, -0.3817478, -1.910799, 0.4235294, 1, 0, 1,
-0.6307939, -0.624927, -3.76094, 0.4156863, 1, 0, 1,
-0.6231527, -1.246079, -2.385156, 0.4117647, 1, 0, 1,
-0.6224858, -0.7963982, -2.55272, 0.4039216, 1, 0, 1,
-0.6212729, 1.582347, -0.3664933, 0.3960784, 1, 0, 1,
-0.6191114, -1.562435, -2.937483, 0.3921569, 1, 0, 1,
-0.6169136, -1.961258, -2.140348, 0.3843137, 1, 0, 1,
-0.6167403, 0.1916441, -2.461216, 0.3803922, 1, 0, 1,
-0.6162403, 0.05814914, -1.694255, 0.372549, 1, 0, 1,
-0.6144525, -0.89367, -2.692059, 0.3686275, 1, 0, 1,
-0.6093185, 0.2820762, -1.913157, 0.3607843, 1, 0, 1,
-0.6032945, 2.723673, 0.6953613, 0.3568628, 1, 0, 1,
-0.6023427, 2.703907, -1.095645, 0.3490196, 1, 0, 1,
-0.602147, -2.004416, -3.527887, 0.345098, 1, 0, 1,
-0.6012446, 1.241488, -0.3038774, 0.3372549, 1, 0, 1,
-0.6001154, -0.7758886, -2.683033, 0.3333333, 1, 0, 1,
-0.5989567, -1.206112, -2.624774, 0.3254902, 1, 0, 1,
-0.5955569, 1.641348, 0.28831, 0.3215686, 1, 0, 1,
-0.5941486, -1.016147, -0.5899754, 0.3137255, 1, 0, 1,
-0.5854197, -1.51971, -2.391131, 0.3098039, 1, 0, 1,
-0.5824051, 0.8498846, -1.587495, 0.3019608, 1, 0, 1,
-0.5797372, 0.5958419, -0.8360726, 0.2941177, 1, 0, 1,
-0.5738372, -1.466537, -1.902874, 0.2901961, 1, 0, 1,
-0.5704178, -0.2658519, -3.278551, 0.282353, 1, 0, 1,
-0.5662991, 0.4938303, -0.6659409, 0.2784314, 1, 0, 1,
-0.5652301, 0.5277404, -0.5685696, 0.2705882, 1, 0, 1,
-0.5613529, 1.009858, -1.407119, 0.2666667, 1, 0, 1,
-0.5606042, -0.5186154, -3.336849, 0.2588235, 1, 0, 1,
-0.5599498, 0.2825824, 1.466836, 0.254902, 1, 0, 1,
-0.5561327, 0.3789563, 0.6823795, 0.2470588, 1, 0, 1,
-0.5553454, 0.4018498, -3.057342, 0.2431373, 1, 0, 1,
-0.5471896, 0.3936825, -0.3719935, 0.2352941, 1, 0, 1,
-0.5444215, -0.4638507, -3.671636, 0.2313726, 1, 0, 1,
-0.5410743, -0.298695, -2.917771, 0.2235294, 1, 0, 1,
-0.5410331, -0.7272716, -1.379089, 0.2196078, 1, 0, 1,
-0.5400856, -1.755931, -2.244663, 0.2117647, 1, 0, 1,
-0.5323143, 0.8346395, 0.749177, 0.2078431, 1, 0, 1,
-0.5262807, -0.1244981, -2.010391, 0.2, 1, 0, 1,
-0.5195195, 0.8860569, -0.5685206, 0.1921569, 1, 0, 1,
-0.5178875, -0.1057988, -2.679141, 0.1882353, 1, 0, 1,
-0.5096174, -0.3268622, -1.769727, 0.1803922, 1, 0, 1,
-0.506384, 0.2672102, -1.805145, 0.1764706, 1, 0, 1,
-0.5038626, -0.2809193, -0.7225049, 0.1686275, 1, 0, 1,
-0.5038074, 1.022894, 0.3507223, 0.1647059, 1, 0, 1,
-0.4994721, 1.111377, 0.5228365, 0.1568628, 1, 0, 1,
-0.4992866, -0.5799573, -1.396412, 0.1529412, 1, 0, 1,
-0.4932972, 0.2016145, -1.154235, 0.145098, 1, 0, 1,
-0.4932871, 2.43406, -0.6319861, 0.1411765, 1, 0, 1,
-0.4870731, -0.1210367, -0.804032, 0.1333333, 1, 0, 1,
-0.4849334, 0.4082372, -1.607462, 0.1294118, 1, 0, 1,
-0.4793679, 0.07819075, 0.2445256, 0.1215686, 1, 0, 1,
-0.4729387, -0.2174749, -1.96557, 0.1176471, 1, 0, 1,
-0.46847, 0.9667825, -0.6515737, 0.1098039, 1, 0, 1,
-0.4667329, 0.2877162, -0.4817019, 0.1058824, 1, 0, 1,
-0.457482, -0.2982456, -1.18507, 0.09803922, 1, 0, 1,
-0.4534566, -1.267432, -3.157355, 0.09019608, 1, 0, 1,
-0.4531425, -0.6413798, -3.059557, 0.08627451, 1, 0, 1,
-0.4518611, -0.8231535, -2.394457, 0.07843138, 1, 0, 1,
-0.4467002, 0.426877, -0.3045971, 0.07450981, 1, 0, 1,
-0.4423106, 0.5336306, -1.197639, 0.06666667, 1, 0, 1,
-0.4385646, 0.6550253, 0.6118336, 0.0627451, 1, 0, 1,
-0.4338517, -1.561698, -3.322988, 0.05490196, 1, 0, 1,
-0.4309666, -0.7119879, -2.279322, 0.05098039, 1, 0, 1,
-0.4302895, 0.01034613, -1.034558, 0.04313726, 1, 0, 1,
-0.42905, -0.4736201, -2.833122, 0.03921569, 1, 0, 1,
-0.4273629, 0.3080329, -0.6548833, 0.03137255, 1, 0, 1,
-0.4272865, -0.8678156, -3.45981, 0.02745098, 1, 0, 1,
-0.4229531, -1.570722, -2.897689, 0.01960784, 1, 0, 1,
-0.4108015, -1.354008, -5.832453, 0.01568628, 1, 0, 1,
-0.4044193, 0.3965796, 0.0653255, 0.007843138, 1, 0, 1,
-0.4018329, -1.559696, -3.246454, 0.003921569, 1, 0, 1,
-0.4005884, -0.1244543, 0.2231189, 0, 1, 0.003921569, 1,
-0.3974858, -0.2117396, -0.8417448, 0, 1, 0.01176471, 1,
-0.3964121, -0.8350238, -3.015056, 0, 1, 0.01568628, 1,
-0.3922696, -0.3475163, -0.03590684, 0, 1, 0.02352941, 1,
-0.3915915, 0.6116552, -1.37676, 0, 1, 0.02745098, 1,
-0.3905285, -0.3417083, -1.886853, 0, 1, 0.03529412, 1,
-0.3892633, 1.082273, 1.213289, 0, 1, 0.03921569, 1,
-0.3879504, -1.569574, -2.49599, 0, 1, 0.04705882, 1,
-0.3866749, -0.3334077, -1.54175, 0, 1, 0.05098039, 1,
-0.3826983, 0.8095802, -0.9623054, 0, 1, 0.05882353, 1,
-0.3818478, 0.1403951, -0.6633751, 0, 1, 0.0627451, 1,
-0.3812858, -1.15279, -2.096193, 0, 1, 0.07058824, 1,
-0.3798307, 0.2064631, -3.333454, 0, 1, 0.07450981, 1,
-0.3757076, 0.5755703, 0.4702688, 0, 1, 0.08235294, 1,
-0.3756767, 0.3729385, -1.894006, 0, 1, 0.08627451, 1,
-0.3744323, 1.622965, -1.350804, 0, 1, 0.09411765, 1,
-0.3742585, 1.395316, -0.06017745, 0, 1, 0.1019608, 1,
-0.3720781, 0.8249324, -1.530883, 0, 1, 0.1058824, 1,
-0.3718708, -1.536979, -1.522353, 0, 1, 0.1137255, 1,
-0.3716986, 0.04449001, -1.274405, 0, 1, 0.1176471, 1,
-0.3686657, 0.146695, -2.848955, 0, 1, 0.1254902, 1,
-0.3677251, 0.7211075, -0.5437599, 0, 1, 0.1294118, 1,
-0.3652236, 1.125667, -0.7039772, 0, 1, 0.1372549, 1,
-0.3637519, 0.3347607, -0.5941623, 0, 1, 0.1411765, 1,
-0.3632496, -2.424128, -3.708163, 0, 1, 0.1490196, 1,
-0.3587983, 0.4151827, -1.102137, 0, 1, 0.1529412, 1,
-0.3586204, -1.591599, -4.165855, 0, 1, 0.1607843, 1,
-0.3585855, 1.644312, -2.050589, 0, 1, 0.1647059, 1,
-0.3549294, -1.14594, -2.412627, 0, 1, 0.172549, 1,
-0.3537735, 1.019542, 1.469557, 0, 1, 0.1764706, 1,
-0.3515927, -0.9016608, -4.640707, 0, 1, 0.1843137, 1,
-0.3503096, 0.5997171, -1.120811, 0, 1, 0.1882353, 1,
-0.3485564, 1.680902, 0.5860801, 0, 1, 0.1960784, 1,
-0.3401106, 0.7026049, 0.3790247, 0, 1, 0.2039216, 1,
-0.3385525, 1.283762, 1.247423, 0, 1, 0.2078431, 1,
-0.3372688, -0.2528589, -2.277101, 0, 1, 0.2156863, 1,
-0.3218284, -0.06955046, -0.2899271, 0, 1, 0.2196078, 1,
-0.3211036, 1.288639, 0.1086227, 0, 1, 0.227451, 1,
-0.3210238, -1.226856, -2.132667, 0, 1, 0.2313726, 1,
-0.320858, -0.5146379, -2.85604, 0, 1, 0.2392157, 1,
-0.3171766, 1.077127, -1.060513, 0, 1, 0.2431373, 1,
-0.316436, -0.2788976, -0.8464363, 0, 1, 0.2509804, 1,
-0.31589, -0.6504678, -1.375833, 0, 1, 0.254902, 1,
-0.3143265, 1.658923, -1.583521, 0, 1, 0.2627451, 1,
-0.3132402, -1.609373, -4.203969, 0, 1, 0.2666667, 1,
-0.3127576, -2.148247, -2.130971, 0, 1, 0.2745098, 1,
-0.3110195, -0.5484217, -2.842365, 0, 1, 0.2784314, 1,
-0.3023642, -0.2661129, -1.851015, 0, 1, 0.2862745, 1,
-0.2974189, -0.1573811, -0.9882954, 0, 1, 0.2901961, 1,
-0.2915622, 0.6395741, 0.3799412, 0, 1, 0.2980392, 1,
-0.289755, -0.004728983, -2.932594, 0, 1, 0.3058824, 1,
-0.2888454, 0.809127, 0.1690232, 0, 1, 0.3098039, 1,
-0.2875344, -0.02872309, -0.8014527, 0, 1, 0.3176471, 1,
-0.2868794, 0.1585265, -2.351459, 0, 1, 0.3215686, 1,
-0.2846949, -0.9677817, -3.258884, 0, 1, 0.3294118, 1,
-0.2804237, 1.322733, 0.9516124, 0, 1, 0.3333333, 1,
-0.2768258, -0.7301686, -1.188094, 0, 1, 0.3411765, 1,
-0.2749091, 0.983085, 0.9575423, 0, 1, 0.345098, 1,
-0.274584, 0.3600925, -0.985761, 0, 1, 0.3529412, 1,
-0.2717048, 0.1186641, -1.730471, 0, 1, 0.3568628, 1,
-0.2693439, 0.799248, -0.5364782, 0, 1, 0.3647059, 1,
-0.2618627, -0.06472998, -2.974201, 0, 1, 0.3686275, 1,
-0.2601026, -1.316996, -2.713106, 0, 1, 0.3764706, 1,
-0.2576368, 0.8957846, -0.04895493, 0, 1, 0.3803922, 1,
-0.2569012, 1.234977, -1.528966, 0, 1, 0.3882353, 1,
-0.2525937, -2.766626, -1.912228, 0, 1, 0.3921569, 1,
-0.2490572, 1.476922, -2.424423, 0, 1, 0.4, 1,
-0.2484773, 1.928082, 0.755723, 0, 1, 0.4078431, 1,
-0.2475449, -1.040317, -3.968343, 0, 1, 0.4117647, 1,
-0.2467931, -1.234939, -2.91146, 0, 1, 0.4196078, 1,
-0.2458501, -0.6892312, -0.9761116, 0, 1, 0.4235294, 1,
-0.245789, 1.046253, 0.1024118, 0, 1, 0.4313726, 1,
-0.2437542, -0.3607075, -3.046493, 0, 1, 0.4352941, 1,
-0.2367082, 0.9809636, -0.2769566, 0, 1, 0.4431373, 1,
-0.2329221, -1.001139, -2.451147, 0, 1, 0.4470588, 1,
-0.2313105, 0.1466345, -1.75192, 0, 1, 0.454902, 1,
-0.2311388, -0.6547062, -4.681484, 0, 1, 0.4588235, 1,
-0.2301455, -0.5988806, -3.500824, 0, 1, 0.4666667, 1,
-0.2289175, 1.175992, 0.01385409, 0, 1, 0.4705882, 1,
-0.226541, 0.9378256, -0.2916468, 0, 1, 0.4784314, 1,
-0.2211938, 0.7073997, -1.277142, 0, 1, 0.4823529, 1,
-0.2169846, 0.6651909, -1.069621, 0, 1, 0.4901961, 1,
-0.2152655, 0.316323, -0.9809502, 0, 1, 0.4941176, 1,
-0.2135627, -1.713995, -1.719139, 0, 1, 0.5019608, 1,
-0.2105644, 1.398411, -0.7079946, 0, 1, 0.509804, 1,
-0.2076728, 1.011326, -0.3140953, 0, 1, 0.5137255, 1,
-0.2073993, 1.44356, 0.4345949, 0, 1, 0.5215687, 1,
-0.202837, 2.755015, -1.555085, 0, 1, 0.5254902, 1,
-0.197246, 0.1484886, -0.3811056, 0, 1, 0.5333334, 1,
-0.1966134, 0.3021788, -1.93953, 0, 1, 0.5372549, 1,
-0.194763, 0.2690774, -0.5494868, 0, 1, 0.5450981, 1,
-0.1911619, -0.2972584, -1.518382, 0, 1, 0.5490196, 1,
-0.1907731, -2.039223, -3.19075, 0, 1, 0.5568628, 1,
-0.1859533, 1.298253, -2.452207, 0, 1, 0.5607843, 1,
-0.1818561, -1.829045, -2.167547, 0, 1, 0.5686275, 1,
-0.1784572, 2.168635, 0.6029701, 0, 1, 0.572549, 1,
-0.1773784, -0.9019662, -2.286817, 0, 1, 0.5803922, 1,
-0.1754972, -0.07060015, -3.205294, 0, 1, 0.5843138, 1,
-0.1751362, -0.8409492, -3.528837, 0, 1, 0.5921569, 1,
-0.1746748, 0.6708072, -0.5251885, 0, 1, 0.5960785, 1,
-0.1739886, 0.08514693, -1.469603, 0, 1, 0.6039216, 1,
-0.1736148, -1.100142, -2.972445, 0, 1, 0.6117647, 1,
-0.1720682, 1.298945, -0.5674828, 0, 1, 0.6156863, 1,
-0.1708919, 0.638627, 1.164803, 0, 1, 0.6235294, 1,
-0.1700736, -0.1949513, -1.867129, 0, 1, 0.627451, 1,
-0.168692, 0.7430957, 1.050405, 0, 1, 0.6352941, 1,
-0.1682305, -0.6602978, -2.315569, 0, 1, 0.6392157, 1,
-0.1678674, -2.271574, -4.673073, 0, 1, 0.6470588, 1,
-0.1623964, 0.1259203, -0.3386534, 0, 1, 0.6509804, 1,
-0.1621529, 0.5024269, -1.931487, 0, 1, 0.6588235, 1,
-0.1618696, -1.030201, -2.364329, 0, 1, 0.6627451, 1,
-0.1610699, 0.5436171, 0.2599408, 0, 1, 0.6705883, 1,
-0.1562453, 0.5346997, -0.1756698, 0, 1, 0.6745098, 1,
-0.1508506, -0.07432757, -1.357029, 0, 1, 0.682353, 1,
-0.1461641, 1.070947, 0.1885655, 0, 1, 0.6862745, 1,
-0.1442009, -1.321923, -3.29432, 0, 1, 0.6941177, 1,
-0.1422477, 0.2241789, 1.454328, 0, 1, 0.7019608, 1,
-0.1415802, -1.742391, -1.694378, 0, 1, 0.7058824, 1,
-0.1405334, -1.750954, -1.512476, 0, 1, 0.7137255, 1,
-0.1379359, -0.7768025, -2.117779, 0, 1, 0.7176471, 1,
-0.1371732, -0.7851644, -1.336589, 0, 1, 0.7254902, 1,
-0.1360734, -0.3966214, -4.011463, 0, 1, 0.7294118, 1,
-0.1235514, 0.3603252, 0.1871345, 0, 1, 0.7372549, 1,
-0.1234651, -0.7082199, -1.888466, 0, 1, 0.7411765, 1,
-0.1225265, 1.622589, -0.03242678, 0, 1, 0.7490196, 1,
-0.1223766, -0.995415, -4.034026, 0, 1, 0.7529412, 1,
-0.1213014, -0.715005, -2.583287, 0, 1, 0.7607843, 1,
-0.1130134, 0.8543997, 0.2851017, 0, 1, 0.7647059, 1,
-0.1128216, -2.125867, -2.52455, 0, 1, 0.772549, 1,
-0.1110778, -0.2716106, -3.948349, 0, 1, 0.7764706, 1,
-0.1104344, 1.364012, -1.253087, 0, 1, 0.7843137, 1,
-0.1078758, -1.068351, -3.503668, 0, 1, 0.7882353, 1,
-0.1063985, 2.331834, 1.741472, 0, 1, 0.7960784, 1,
-0.1019212, 2.825598, 0.4017579, 0, 1, 0.8039216, 1,
-0.1007469, -0.715594, -3.814321, 0, 1, 0.8078431, 1,
-0.09967001, -0.783741, -3.883461, 0, 1, 0.8156863, 1,
-0.09913062, -0.8403423, -2.939442, 0, 1, 0.8196079, 1,
-0.09806577, -0.3658839, -1.779856, 0, 1, 0.827451, 1,
-0.09790641, 0.2065336, -0.03265446, 0, 1, 0.8313726, 1,
-0.09160245, 1.609135, 0.1709457, 0, 1, 0.8392157, 1,
-0.09073843, -0.8031799, -1.271402, 0, 1, 0.8431373, 1,
-0.08861817, -0.02297865, -1.256669, 0, 1, 0.8509804, 1,
-0.08679878, -0.61844, -3.052259, 0, 1, 0.854902, 1,
-0.08466832, 1.054975, 0.3058925, 0, 1, 0.8627451, 1,
-0.08203021, -1.431572, -1.837995, 0, 1, 0.8666667, 1,
-0.08176742, -1.393556, -3.052314, 0, 1, 0.8745098, 1,
-0.08146058, -1.281739, -4.064567, 0, 1, 0.8784314, 1,
-0.08106473, 0.9209954, 0.9916921, 0, 1, 0.8862745, 1,
-0.07857782, -0.1108425, -4.219485, 0, 1, 0.8901961, 1,
-0.07552325, -1.399049, -2.655013, 0, 1, 0.8980392, 1,
-0.0733961, -0.7598425, -2.785027, 0, 1, 0.9058824, 1,
-0.07298734, -1.16034, -1.537801, 0, 1, 0.9098039, 1,
-0.07068992, 0.9433517, 0.9824763, 0, 1, 0.9176471, 1,
-0.0661989, 0.2405537, 0.1879699, 0, 1, 0.9215686, 1,
-0.06575139, 1.485996, 0.6009185, 0, 1, 0.9294118, 1,
-0.06447493, 0.3316594, 0.6297149, 0, 1, 0.9333333, 1,
-0.0620545, 0.5339684, -0.7920395, 0, 1, 0.9411765, 1,
-0.05996399, -0.08150989, -3.011579, 0, 1, 0.945098, 1,
-0.05457096, 0.5316606, 0.9986924, 0, 1, 0.9529412, 1,
-0.05392172, 0.8588755, -0.625309, 0, 1, 0.9568627, 1,
-0.05285769, 1.310046, 0.7168829, 0, 1, 0.9647059, 1,
-0.05127034, -0.522661, -2.809362, 0, 1, 0.9686275, 1,
-0.04912883, 0.505838, -0.3852057, 0, 1, 0.9764706, 1,
-0.04847998, 0.994648, 2.120747, 0, 1, 0.9803922, 1,
-0.04845887, -0.2674472, -2.726118, 0, 1, 0.9882353, 1,
-0.04268425, -2.157391, -3.049324, 0, 1, 0.9921569, 1,
-0.03777018, -0.06309561, -2.247417, 0, 1, 1, 1,
-0.03334561, -0.5956443, -3.899548, 0, 0.9921569, 1, 1,
-0.02892411, 0.3337797, 0.7798216, 0, 0.9882353, 1, 1,
-0.02886952, 0.6834313, 2.369413, 0, 0.9803922, 1, 1,
-0.02338761, -0.1457529, -4.029549, 0, 0.9764706, 1, 1,
-0.02173764, 0.1977814, 0.1186313, 0, 0.9686275, 1, 1,
-0.02030182, -1.967838, -1.919055, 0, 0.9647059, 1, 1,
-0.01882301, -0.4747858, -4.513704, 0, 0.9568627, 1, 1,
-0.01853191, -0.1822665, -2.918681, 0, 0.9529412, 1, 1,
-0.01734555, -0.2221082, -4.149264, 0, 0.945098, 1, 1,
-0.01524583, -1.78558, -2.68865, 0, 0.9411765, 1, 1,
-0.01205518, 0.8673232, 0.3870646, 0, 0.9333333, 1, 1,
-0.01149492, 1.292673, 0.3367496, 0, 0.9294118, 1, 1,
-0.008025439, -0.2376619, -4.782115, 0, 0.9215686, 1, 1,
-0.004757393, -0.3425867, -2.988156, 0, 0.9176471, 1, 1,
-0.003854049, -1.681901, -4.431766, 0, 0.9098039, 1, 1,
-0.003715686, -0.001927605, -2.57861, 0, 0.9058824, 1, 1,
0.002560374, 0.4961276, -3.31708, 0, 0.8980392, 1, 1,
0.002641859, -0.7720058, 4.399941, 0, 0.8901961, 1, 1,
0.003768491, -0.7144501, 1.676754, 0, 0.8862745, 1, 1,
0.006352427, 0.9671921, 0.3695315, 0, 0.8784314, 1, 1,
0.006693194, -0.07396006, 4.359904, 0, 0.8745098, 1, 1,
0.00793867, -1.072361, 2.970044, 0, 0.8666667, 1, 1,
0.008876825, -0.4777818, 3.489508, 0, 0.8627451, 1, 1,
0.009883572, -1.427384, 4.55533, 0, 0.854902, 1, 1,
0.01040033, 0.8486419, 0.05110265, 0, 0.8509804, 1, 1,
0.01425265, 0.2302059, 0.3375324, 0, 0.8431373, 1, 1,
0.01433702, 0.09019441, -0.5682697, 0, 0.8392157, 1, 1,
0.01538294, 0.8224129, -0.3447271, 0, 0.8313726, 1, 1,
0.02253907, -0.5819382, 3.098722, 0, 0.827451, 1, 1,
0.02388073, -0.2082248, 2.679769, 0, 0.8196079, 1, 1,
0.02942866, 1.367134, -0.01572437, 0, 0.8156863, 1, 1,
0.031103, 0.4287646, 1.118697, 0, 0.8078431, 1, 1,
0.03664353, 1.252478, 0.1421259, 0, 0.8039216, 1, 1,
0.04059348, 0.7771587, -0.2735572, 0, 0.7960784, 1, 1,
0.04432541, -0.300773, 3.194983, 0, 0.7882353, 1, 1,
0.04996661, 0.5493221, -0.6997449, 0, 0.7843137, 1, 1,
0.05078611, -1.479833, 2.306782, 0, 0.7764706, 1, 1,
0.05099619, -0.721613, 4.240206, 0, 0.772549, 1, 1,
0.05171494, 0.3788909, 0.6008894, 0, 0.7647059, 1, 1,
0.06423248, -0.9858989, 3.677654, 0, 0.7607843, 1, 1,
0.067521, -0.2022719, 0.2984162, 0, 0.7529412, 1, 1,
0.07069968, -1.578414, 3.315194, 0, 0.7490196, 1, 1,
0.07425923, -0.4355515, 2.814072, 0, 0.7411765, 1, 1,
0.07458954, 0.442778, 1.561314, 0, 0.7372549, 1, 1,
0.0755365, -0.9386877, 3.398062, 0, 0.7294118, 1, 1,
0.07995902, 1.398096, 0.2936213, 0, 0.7254902, 1, 1,
0.08270223, -0.4272681, 2.271284, 0, 0.7176471, 1, 1,
0.08832008, 0.4061376, -0.562958, 0, 0.7137255, 1, 1,
0.08947584, -0.4932835, 1.481557, 0, 0.7058824, 1, 1,
0.0901923, 0.109687, -1.756147, 0, 0.6980392, 1, 1,
0.09091725, 0.8638485, -1.484934, 0, 0.6941177, 1, 1,
0.09212372, -0.3329723, 1.107076, 0, 0.6862745, 1, 1,
0.09216999, -0.2322792, 2.507139, 0, 0.682353, 1, 1,
0.09409039, -1.019737, 1.95778, 0, 0.6745098, 1, 1,
0.09726193, 0.8479313, -0.9872201, 0, 0.6705883, 1, 1,
0.09911729, 0.2771088, 0.7321014, 0, 0.6627451, 1, 1,
0.1020917, 1.736686, 1.468289, 0, 0.6588235, 1, 1,
0.1115649, -0.2878728, 3.431061, 0, 0.6509804, 1, 1,
0.113429, -1.042326, 4.252354, 0, 0.6470588, 1, 1,
0.1135728, 1.925575, -0.1524704, 0, 0.6392157, 1, 1,
0.1143548, 0.819016, 1.388998, 0, 0.6352941, 1, 1,
0.1207715, 0.07872105, 0.1759415, 0, 0.627451, 1, 1,
0.1267972, -0.03550622, 1.568004, 0, 0.6235294, 1, 1,
0.1276356, -0.3526537, 2.583218, 0, 0.6156863, 1, 1,
0.1280732, 1.316918, -2.435308, 0, 0.6117647, 1, 1,
0.1352974, 2.520649, 0.9309078, 0, 0.6039216, 1, 1,
0.1391741, 0.4369946, 0.1235794, 0, 0.5960785, 1, 1,
0.1422071, 1.29034, 0.8179242, 0, 0.5921569, 1, 1,
0.143283, 0.09211668, 0.3862584, 0, 0.5843138, 1, 1,
0.1459985, -0.7690406, 2.647122, 0, 0.5803922, 1, 1,
0.1483523, -0.5629526, 0.8224387, 0, 0.572549, 1, 1,
0.1499044, 1.609449, -0.9261551, 0, 0.5686275, 1, 1,
0.1510218, 0.2454728, 1.108176, 0, 0.5607843, 1, 1,
0.1554643, 0.2452707, 1.239645, 0, 0.5568628, 1, 1,
0.1606054, 1.337842, 2.67524, 0, 0.5490196, 1, 1,
0.1626251, 0.06881245, 1.513733, 0, 0.5450981, 1, 1,
0.1634828, -0.3605564, 2.715161, 0, 0.5372549, 1, 1,
0.16434, -0.4722076, 3.443596, 0, 0.5333334, 1, 1,
0.1649932, 0.6806672, -0.6281795, 0, 0.5254902, 1, 1,
0.165096, -0.9685251, 3.236743, 0, 0.5215687, 1, 1,
0.1679099, 0.6953641, -0.4522715, 0, 0.5137255, 1, 1,
0.1703138, -0.7181923, 3.63872, 0, 0.509804, 1, 1,
0.1720543, 0.08734453, 1.985119, 0, 0.5019608, 1, 1,
0.1770408, 0.6340125, 0.8174503, 0, 0.4941176, 1, 1,
0.1770836, 0.3606716, -0.2183182, 0, 0.4901961, 1, 1,
0.1776621, 1.908969, 1.310065, 0, 0.4823529, 1, 1,
0.1790096, -0.7280975, 3.820061, 0, 0.4784314, 1, 1,
0.1801921, -0.6628577, 3.367099, 0, 0.4705882, 1, 1,
0.1814406, 0.9776928, -1.486049, 0, 0.4666667, 1, 1,
0.1847143, -1.302789, 2.735546, 0, 0.4588235, 1, 1,
0.1914298, -0.4106303, 4.766158, 0, 0.454902, 1, 1,
0.1940134, -0.4584616, 2.82154, 0, 0.4470588, 1, 1,
0.1958781, 1.893857, 0.0780897, 0, 0.4431373, 1, 1,
0.2026711, -1.035367, 4.17618, 0, 0.4352941, 1, 1,
0.2035808, -0.6981435, 3.432889, 0, 0.4313726, 1, 1,
0.2036192, 1.192926, 1.011766, 0, 0.4235294, 1, 1,
0.2068355, 0.9490489, -0.5199096, 0, 0.4196078, 1, 1,
0.2107307, 0.6212786, -0.791344, 0, 0.4117647, 1, 1,
0.2107562, -1.426927, 1.774853, 0, 0.4078431, 1, 1,
0.2131883, -0.9864461, 2.891711, 0, 0.4, 1, 1,
0.2155385, -0.6206851, 1.093653, 0, 0.3921569, 1, 1,
0.2209937, 0.04115294, 3.141992, 0, 0.3882353, 1, 1,
0.2212452, 0.6000464, 1.395706, 0, 0.3803922, 1, 1,
0.2240206, -0.1594581, 3.020235, 0, 0.3764706, 1, 1,
0.2252043, -0.8018868, 1.816817, 0, 0.3686275, 1, 1,
0.2254687, 2.071828, -0.4942189, 0, 0.3647059, 1, 1,
0.2321336, 0.001262516, 1.006312, 0, 0.3568628, 1, 1,
0.2360334, 0.7379882, -0.3096542, 0, 0.3529412, 1, 1,
0.2365336, 1.627022, 0.012079, 0, 0.345098, 1, 1,
0.2443849, -1.046548, 3.72516, 0, 0.3411765, 1, 1,
0.2447456, -0.1448988, 1.889007, 0, 0.3333333, 1, 1,
0.2554452, 0.2788652, 1.462502, 0, 0.3294118, 1, 1,
0.2623325, -1.283521, 4.725612, 0, 0.3215686, 1, 1,
0.2635775, 0.2203332, -1.442987, 0, 0.3176471, 1, 1,
0.2659968, 0.7590296, -2.534269, 0, 0.3098039, 1, 1,
0.269956, 2.30684, 0.424099, 0, 0.3058824, 1, 1,
0.2722017, 1.009582, 0.01125988, 0, 0.2980392, 1, 1,
0.2764761, 0.3627611, 1.882971, 0, 0.2901961, 1, 1,
0.2785423, 0.6710241, 0.2796005, 0, 0.2862745, 1, 1,
0.2843795, 0.9123297, 1.698376, 0, 0.2784314, 1, 1,
0.2864272, -0.3103534, 1.341726, 0, 0.2745098, 1, 1,
0.28803, 0.5146184, 1.256456, 0, 0.2666667, 1, 1,
0.2888503, 0.3689939, -0.4249414, 0, 0.2627451, 1, 1,
0.2953203, -1.074579, 3.443484, 0, 0.254902, 1, 1,
0.3018716, -1.618019, 0.4491707, 0, 0.2509804, 1, 1,
0.3036934, -0.7216259, 1.721742, 0, 0.2431373, 1, 1,
0.3089994, 0.3081811, 2.102641, 0, 0.2392157, 1, 1,
0.31155, -0.1051587, 2.21116, 0, 0.2313726, 1, 1,
0.311855, 0.1846497, -0.4242148, 0, 0.227451, 1, 1,
0.3181632, -0.3222383, 4.421167, 0, 0.2196078, 1, 1,
0.3209095, -1.32495, 3.090333, 0, 0.2156863, 1, 1,
0.3231637, 0.3183494, 1.973333, 0, 0.2078431, 1, 1,
0.3241264, 0.1836111, 2.165749, 0, 0.2039216, 1, 1,
0.334445, -1.13764, 2.992954, 0, 0.1960784, 1, 1,
0.3369527, -0.3772229, 3.170981, 0, 0.1882353, 1, 1,
0.3370018, 0.7440219, 0.6040172, 0, 0.1843137, 1, 1,
0.3385305, -0.6841505, 1.670138, 0, 0.1764706, 1, 1,
0.3391763, -0.9512057, 3.51219, 0, 0.172549, 1, 1,
0.3392718, -0.4289188, 2.113964, 0, 0.1647059, 1, 1,
0.344913, 0.3976099, 2.826763, 0, 0.1607843, 1, 1,
0.3449233, -0.5206048, 1.885847, 0, 0.1529412, 1, 1,
0.3468643, -0.6772537, 3.396963, 0, 0.1490196, 1, 1,
0.3495147, -1.447413, 2.578489, 0, 0.1411765, 1, 1,
0.3503006, -1.029523, 2.941544, 0, 0.1372549, 1, 1,
0.3504713, 0.1219326, 0.6674207, 0, 0.1294118, 1, 1,
0.353406, -0.1124667, 3.246312, 0, 0.1254902, 1, 1,
0.3569762, 1.202432, 0.3560888, 0, 0.1176471, 1, 1,
0.3574891, -0.1276349, 0.7420916, 0, 0.1137255, 1, 1,
0.3575099, -0.5899639, 3.059765, 0, 0.1058824, 1, 1,
0.3655783, 0.3506166, 1.079807, 0, 0.09803922, 1, 1,
0.3670393, -1.224114, 3.853238, 0, 0.09411765, 1, 1,
0.3677346, 0.9237265, 0.09588153, 0, 0.08627451, 1, 1,
0.3806162, 1.120738, -0.8223429, 0, 0.08235294, 1, 1,
0.3812649, -0.01546204, 2.350853, 0, 0.07450981, 1, 1,
0.3815186, -2.605231, 3.523775, 0, 0.07058824, 1, 1,
0.3920312, -1.079593, 3.755594, 0, 0.0627451, 1, 1,
0.3991743, -0.545231, 1.199541, 0, 0.05882353, 1, 1,
0.4001904, 0.325637, 1.280296, 0, 0.05098039, 1, 1,
0.4008968, -1.806485, 3.169579, 0, 0.04705882, 1, 1,
0.401047, -0.7232278, 3.521248, 0, 0.03921569, 1, 1,
0.4054731, 0.6936331, 1.49685, 0, 0.03529412, 1, 1,
0.4061996, 1.707696, 1.002867, 0, 0.02745098, 1, 1,
0.4067106, 0.3439451, 0.09123404, 0, 0.02352941, 1, 1,
0.4140173, 1.210631, 1.941595, 0, 0.01568628, 1, 1,
0.4155397, -0.1935635, 1.887968, 0, 0.01176471, 1, 1,
0.4156055, 0.001442661, 1.267723, 0, 0.003921569, 1, 1,
0.4158987, -0.918468, 3.530528, 0.003921569, 0, 1, 1,
0.420441, -0.3745564, 3.917399, 0.007843138, 0, 1, 1,
0.4205443, 1.406961, -0.5252591, 0.01568628, 0, 1, 1,
0.4214118, 0.7604024, 0.5875955, 0.01960784, 0, 1, 1,
0.4278125, -0.04480657, 2.908884, 0.02745098, 0, 1, 1,
0.4278549, 3.111534, 0.3402833, 0.03137255, 0, 1, 1,
0.4288763, -0.6875283, 3.884021, 0.03921569, 0, 1, 1,
0.4328464, -0.3631578, 0.2040217, 0.04313726, 0, 1, 1,
0.434225, -0.9737597, 3.229725, 0.05098039, 0, 1, 1,
0.4386046, -0.5175323, 1.822423, 0.05490196, 0, 1, 1,
0.4387945, -1.444681, 1.464098, 0.0627451, 0, 1, 1,
0.444509, -0.8807926, 4.003039, 0.06666667, 0, 1, 1,
0.4452309, -0.09302138, 1.597425, 0.07450981, 0, 1, 1,
0.4467079, -0.6254075, 3.968573, 0.07843138, 0, 1, 1,
0.44966, 0.1451524, 3.329298, 0.08627451, 0, 1, 1,
0.4530616, -1.548463, 0.4249472, 0.09019608, 0, 1, 1,
0.4565476, -0.8235738, 1.596343, 0.09803922, 0, 1, 1,
0.4615928, 0.9694137, -0.6118661, 0.1058824, 0, 1, 1,
0.4640322, 0.7241192, -1.277133, 0.1098039, 0, 1, 1,
0.4708459, 0.9124641, 0.4816942, 0.1176471, 0, 1, 1,
0.4738677, 0.4299033, 0.05405657, 0.1215686, 0, 1, 1,
0.4746529, 1.804129, 0.344921, 0.1294118, 0, 1, 1,
0.475935, -0.4919059, 3.767503, 0.1333333, 0, 1, 1,
0.4761916, -0.02056891, 2.838774, 0.1411765, 0, 1, 1,
0.480266, 0.2557447, 1.133006, 0.145098, 0, 1, 1,
0.4806954, 0.7046478, 2.337126, 0.1529412, 0, 1, 1,
0.488067, 0.1513118, 0.7276627, 0.1568628, 0, 1, 1,
0.4913919, 0.3106373, 1.924136, 0.1647059, 0, 1, 1,
0.4914535, -0.5301961, 3.674991, 0.1686275, 0, 1, 1,
0.4921291, -1.704407, 2.411392, 0.1764706, 0, 1, 1,
0.4936024, 0.8568224, 1.254413, 0.1803922, 0, 1, 1,
0.4960081, -1.303112, 3.287964, 0.1882353, 0, 1, 1,
0.4973025, 0.355197, 2.118223, 0.1921569, 0, 1, 1,
0.4976047, 1.216366, -0.7300351, 0.2, 0, 1, 1,
0.5080239, -0.9490599, 3.151982, 0.2078431, 0, 1, 1,
0.5083226, -0.1164639, 1.999703, 0.2117647, 0, 1, 1,
0.5105988, -1.342205, 3.515618, 0.2196078, 0, 1, 1,
0.5113447, 1.130546, 0.5111399, 0.2235294, 0, 1, 1,
0.5121297, 0.9381735, 0.4684546, 0.2313726, 0, 1, 1,
0.5131441, 0.3900257, 0.6994393, 0.2352941, 0, 1, 1,
0.5169095, 2.458019, 0.6603627, 0.2431373, 0, 1, 1,
0.5284135, -0.5583447, 1.362648, 0.2470588, 0, 1, 1,
0.528956, 0.3131654, 1.358673, 0.254902, 0, 1, 1,
0.5307317, -0.6460896, 2.741412, 0.2588235, 0, 1, 1,
0.5314188, 0.7902389, -0.9781254, 0.2666667, 0, 1, 1,
0.5322931, 1.272878, 0.6400465, 0.2705882, 0, 1, 1,
0.534956, -0.1514158, 2.507816, 0.2784314, 0, 1, 1,
0.5416191, -0.069771, 2.064671, 0.282353, 0, 1, 1,
0.5417615, -1.364513, 2.176974, 0.2901961, 0, 1, 1,
0.5417644, 0.6044608, 1.160644, 0.2941177, 0, 1, 1,
0.5428604, 0.6719686, -2.006169, 0.3019608, 0, 1, 1,
0.5445209, -0.9609808, 4.309649, 0.3098039, 0, 1, 1,
0.5460973, -0.212955, 1.540568, 0.3137255, 0, 1, 1,
0.5501511, -0.3657856, 0.4006254, 0.3215686, 0, 1, 1,
0.5531814, -0.8191772, 2.517741, 0.3254902, 0, 1, 1,
0.5549974, 0.9233646, 1.495788, 0.3333333, 0, 1, 1,
0.5617293, 0.6525196, 0.8595923, 0.3372549, 0, 1, 1,
0.5626261, 1.131055, 0.9545164, 0.345098, 0, 1, 1,
0.5630298, -0.429486, 2.297119, 0.3490196, 0, 1, 1,
0.5637062, -0.2820655, 2.770824, 0.3568628, 0, 1, 1,
0.5659806, 1.04999, 1.736726, 0.3607843, 0, 1, 1,
0.5680229, -0.4370733, 2.218406, 0.3686275, 0, 1, 1,
0.5730243, -0.949325, 0.9061186, 0.372549, 0, 1, 1,
0.574778, -0.755219, 4.036416, 0.3803922, 0, 1, 1,
0.5776471, 0.1616965, 1.162776, 0.3843137, 0, 1, 1,
0.5778952, -1.656621, 1.510955, 0.3921569, 0, 1, 1,
0.5785794, -1.771557, 3.02776, 0.3960784, 0, 1, 1,
0.5791021, -1.499123, 2.345503, 0.4039216, 0, 1, 1,
0.5815281, 0.1599043, 1.330118, 0.4117647, 0, 1, 1,
0.5849645, 1.105061, 0.2681355, 0.4156863, 0, 1, 1,
0.5852863, 1.091496, 0.2736643, 0.4235294, 0, 1, 1,
0.5916855, 0.6590514, 1.755533, 0.427451, 0, 1, 1,
0.5924093, 0.275541, 1.569164, 0.4352941, 0, 1, 1,
0.596387, -1.778445, 2.572321, 0.4392157, 0, 1, 1,
0.598919, 0.3107009, 1.536679, 0.4470588, 0, 1, 1,
0.6006567, -0.4016734, 2.957309, 0.4509804, 0, 1, 1,
0.6055491, -0.9883404, 2.8473, 0.4588235, 0, 1, 1,
0.6098086, 0.1425807, 1.322628, 0.4627451, 0, 1, 1,
0.610593, -0.9196759, 2.495749, 0.4705882, 0, 1, 1,
0.6247271, -1.840927, 2.377399, 0.4745098, 0, 1, 1,
0.6247484, 0.3278995, 0.8261604, 0.4823529, 0, 1, 1,
0.6247652, 0.6081089, 0.05689793, 0.4862745, 0, 1, 1,
0.6251246, -1.188656, 2.205943, 0.4941176, 0, 1, 1,
0.6255448, -1.150986, 2.780294, 0.5019608, 0, 1, 1,
0.6281289, 1.1523, 1.078149, 0.5058824, 0, 1, 1,
0.6307209, -0.2407807, 1.102634, 0.5137255, 0, 1, 1,
0.6317456, 1.087999, 0.4555943, 0.5176471, 0, 1, 1,
0.6332151, -0.09073142, 2.996144, 0.5254902, 0, 1, 1,
0.6350958, 0.6520915, 1.463284, 0.5294118, 0, 1, 1,
0.6357844, 2.038835, -0.7878568, 0.5372549, 0, 1, 1,
0.6364946, -0.5782726, 2.073884, 0.5411765, 0, 1, 1,
0.639674, 0.4942074, 1.443049, 0.5490196, 0, 1, 1,
0.6412077, 1.518689, 0.4835903, 0.5529412, 0, 1, 1,
0.6431662, 0.5120762, 1.816124, 0.5607843, 0, 1, 1,
0.6442054, 0.1882776, 2.083459, 0.5647059, 0, 1, 1,
0.6453658, 0.8966891, 1.583537, 0.572549, 0, 1, 1,
0.6476883, 0.319926, 2.058354, 0.5764706, 0, 1, 1,
0.6486101, -0.1355527, 1.530804, 0.5843138, 0, 1, 1,
0.6486921, 1.109357, -0.8018098, 0.5882353, 0, 1, 1,
0.657973, 1.651402, 0.1360397, 0.5960785, 0, 1, 1,
0.6624153, -0.6144891, 2.805341, 0.6039216, 0, 1, 1,
0.6661345, -0.7593184, 3.105564, 0.6078432, 0, 1, 1,
0.6691223, 0.4846141, 2.052564, 0.6156863, 0, 1, 1,
0.670072, -0.2550165, 0.2147757, 0.6196079, 0, 1, 1,
0.6735471, -0.07853384, 1.443427, 0.627451, 0, 1, 1,
0.6759915, -0.5931916, 3.0917, 0.6313726, 0, 1, 1,
0.6765236, -1.49338, 1.363381, 0.6392157, 0, 1, 1,
0.6820896, 1.087932, -1.801631, 0.6431373, 0, 1, 1,
0.6848215, -0.4299914, 4.015666, 0.6509804, 0, 1, 1,
0.6859395, 1.421753, 0.2983311, 0.654902, 0, 1, 1,
0.6931253, 1.376587, 2.243796, 0.6627451, 0, 1, 1,
0.6974558, -0.01717458, 1.453272, 0.6666667, 0, 1, 1,
0.6977993, -0.05933172, 2.338575, 0.6745098, 0, 1, 1,
0.7027012, 1.168763, 0.8949069, 0.6784314, 0, 1, 1,
0.7075363, 1.618253, 1.216314, 0.6862745, 0, 1, 1,
0.7138698, 0.6835263, -0.4991795, 0.6901961, 0, 1, 1,
0.7161943, 0.3438245, 0.9245611, 0.6980392, 0, 1, 1,
0.7165539, 0.6017743, 1.780135, 0.7058824, 0, 1, 1,
0.7195829, 0.6135616, 2.220102, 0.7098039, 0, 1, 1,
0.7200716, -1.122092, 1.74904, 0.7176471, 0, 1, 1,
0.722868, -2.087708, 1.513237, 0.7215686, 0, 1, 1,
0.7329505, -0.6857823, 1.10628, 0.7294118, 0, 1, 1,
0.7339416, -1.347873, 2.378523, 0.7333333, 0, 1, 1,
0.740352, -0.07754236, 0.9353441, 0.7411765, 0, 1, 1,
0.7542246, -0.06259585, 1.298104, 0.7450981, 0, 1, 1,
0.7576123, 0.4601029, -0.1405972, 0.7529412, 0, 1, 1,
0.7597043, -0.6300287, 2.838485, 0.7568628, 0, 1, 1,
0.7628794, -1.781262, 1.733389, 0.7647059, 0, 1, 1,
0.7660128, 1.269611, 2.016344, 0.7686275, 0, 1, 1,
0.7689822, 0.6938348, -0.2207112, 0.7764706, 0, 1, 1,
0.778518, -0.7405865, 1.988295, 0.7803922, 0, 1, 1,
0.7800912, -0.3554038, 3.437643, 0.7882353, 0, 1, 1,
0.78677, 1.116645, 0.8847638, 0.7921569, 0, 1, 1,
0.7964152, 1.165514, 1.538272, 0.8, 0, 1, 1,
0.7975458, -0.35076, 3.99224, 0.8078431, 0, 1, 1,
0.8039496, 0.003011111, 1.536278, 0.8117647, 0, 1, 1,
0.8050881, 0.01215402, 1.950226, 0.8196079, 0, 1, 1,
0.8128168, -0.6719323, 2.706316, 0.8235294, 0, 1, 1,
0.8160691, -0.1284923, 1.880471, 0.8313726, 0, 1, 1,
0.8184664, 0.5302902, 1.999346, 0.8352941, 0, 1, 1,
0.8188388, -1.159698, 3.025266, 0.8431373, 0, 1, 1,
0.8197981, -1.601539, 3.161518, 0.8470588, 0, 1, 1,
0.8210682, 1.520122, 1.683132, 0.854902, 0, 1, 1,
0.8239335, -0.1766825, 1.74436, 0.8588235, 0, 1, 1,
0.8309343, 0.2758749, 1.21113, 0.8666667, 0, 1, 1,
0.8371099, -0.3261863, 2.047702, 0.8705882, 0, 1, 1,
0.838587, 0.8555861, 2.057661, 0.8784314, 0, 1, 1,
0.848949, 1.454742, 0.7590275, 0.8823529, 0, 1, 1,
0.8515196, 1.130207, 1.506214, 0.8901961, 0, 1, 1,
0.8522159, 1.063553, 1.614499, 0.8941177, 0, 1, 1,
0.8569199, -0.2223755, 1.528044, 0.9019608, 0, 1, 1,
0.8581309, 0.4618624, 1.850146, 0.9098039, 0, 1, 1,
0.8584582, 0.2262862, 0.6792086, 0.9137255, 0, 1, 1,
0.8614607, 0.7104399, -0.09615782, 0.9215686, 0, 1, 1,
0.8623863, 0.07116941, 1.314946, 0.9254902, 0, 1, 1,
0.8723162, -0.7459849, 2.853989, 0.9333333, 0, 1, 1,
0.8728882, 1.264996, -0.1158078, 0.9372549, 0, 1, 1,
0.8734362, -0.9267282, 5.626584, 0.945098, 0, 1, 1,
0.8891577, 0.348023, 3.138763, 0.9490196, 0, 1, 1,
0.8903637, 0.2355078, 1.528464, 0.9568627, 0, 1, 1,
0.8918744, 1.365231, -1.181619, 0.9607843, 0, 1, 1,
0.9025851, -1.093262, 1.76589, 0.9686275, 0, 1, 1,
0.9072359, 1.829642, -0.7349764, 0.972549, 0, 1, 1,
0.9117894, -0.5884112, 1.292026, 0.9803922, 0, 1, 1,
0.9182889, -0.3340412, 3.834989, 0.9843137, 0, 1, 1,
0.9279452, -0.2601092, 3.167146, 0.9921569, 0, 1, 1,
0.9282132, 0.03319662, 1.031092, 0.9960784, 0, 1, 1,
0.9303024, -1.382727, 3.106938, 1, 0, 0.9960784, 1,
0.93308, 0.9499995, 1.207471, 1, 0, 0.9882353, 1,
0.9524058, -0.7129034, 3.328625, 1, 0, 0.9843137, 1,
0.9544948, -0.008877375, 1.997135, 1, 0, 0.9764706, 1,
0.9562434, 2.514091, 2.507817, 1, 0, 0.972549, 1,
0.957233, 0.2638726, 1.066174, 1, 0, 0.9647059, 1,
0.959905, -0.5973287, 3.809059, 1, 0, 0.9607843, 1,
0.9735985, 0.0823134, 1.77749, 1, 0, 0.9529412, 1,
0.9794684, 0.5734594, 0.5580835, 1, 0, 0.9490196, 1,
0.983255, 0.09930055, 2.59579, 1, 0, 0.9411765, 1,
0.9847963, 0.4777701, -0.3835528, 1, 0, 0.9372549, 1,
0.9893244, 0.1229924, 0.9903025, 1, 0, 0.9294118, 1,
0.9908342, 0.1430943, 0.6763434, 1, 0, 0.9254902, 1,
0.9936532, -0.5303853, 1.679155, 1, 0, 0.9176471, 1,
0.9988584, -1.38425, 1.463153, 1, 0, 0.9137255, 1,
1.005506, -0.3763913, 2.67693, 1, 0, 0.9058824, 1,
1.009278, 0.3717595, 1.376041, 1, 0, 0.9019608, 1,
1.019257, -0.8317398, 2.107951, 1, 0, 0.8941177, 1,
1.025521, 0.4953935, -0.4992599, 1, 0, 0.8862745, 1,
1.040416, 1.463765, 0.8744093, 1, 0, 0.8823529, 1,
1.04071, 0.551495, 0.362256, 1, 0, 0.8745098, 1,
1.053108, 0.2057985, 1.024997, 1, 0, 0.8705882, 1,
1.056478, 0.3715555, 1.991589, 1, 0, 0.8627451, 1,
1.056679, -0.5752277, 1.064311, 1, 0, 0.8588235, 1,
1.061461, 0.5157451, 1.094795, 1, 0, 0.8509804, 1,
1.076285, -1.199357, 3.544923, 1, 0, 0.8470588, 1,
1.081884, -0.4329487, 0.1925791, 1, 0, 0.8392157, 1,
1.082339, -1.025789, 2.780788, 1, 0, 0.8352941, 1,
1.085972, -0.9910778, 3.862316, 1, 0, 0.827451, 1,
1.098183, -1.29801, 2.070575, 1, 0, 0.8235294, 1,
1.099971, -0.7400323, 2.56088, 1, 0, 0.8156863, 1,
1.108721, 0.9530633, 1.612289, 1, 0, 0.8117647, 1,
1.113735, -0.7892453, 2.313132, 1, 0, 0.8039216, 1,
1.114879, 0.004476588, 1.50829, 1, 0, 0.7960784, 1,
1.122929, 0.3260784, 0.5103142, 1, 0, 0.7921569, 1,
1.123521, 0.9411688, -1.690426, 1, 0, 0.7843137, 1,
1.134558, -0.32725, 0.4858244, 1, 0, 0.7803922, 1,
1.138855, -1.240198, 1.835965, 1, 0, 0.772549, 1,
1.1414, -1.776587, 0.8868343, 1, 0, 0.7686275, 1,
1.152345, -0.02939075, 1.798892, 1, 0, 0.7607843, 1,
1.152821, 1.393484, -0.2396408, 1, 0, 0.7568628, 1,
1.16741, 0.917042, 0.2445749, 1, 0, 0.7490196, 1,
1.168531, 1.20427, 0.05998847, 1, 0, 0.7450981, 1,
1.17197, 0.8520022, 2.817798, 1, 0, 0.7372549, 1,
1.174423, -0.2347171, 1.39551, 1, 0, 0.7333333, 1,
1.17495, 0.73408, 0.6136864, 1, 0, 0.7254902, 1,
1.178191, 0.05988428, 1.608973, 1, 0, 0.7215686, 1,
1.198271, 1.098915, 0.6170703, 1, 0, 0.7137255, 1,
1.201561, -0.9625826, 1.915487, 1, 0, 0.7098039, 1,
1.211714, 2.107857, 0.1037678, 1, 0, 0.7019608, 1,
1.227271, -0.1443538, 2.054005, 1, 0, 0.6941177, 1,
1.227701, -0.7513043, 2.154799, 1, 0, 0.6901961, 1,
1.230858, 0.9828441, -0.3800634, 1, 0, 0.682353, 1,
1.234348, -0.9244067, 3.698665, 1, 0, 0.6784314, 1,
1.235428, -1.147844, 0.9948358, 1, 0, 0.6705883, 1,
1.236774, -1.263839, 1.934314, 1, 0, 0.6666667, 1,
1.240266, -0.5900778, 0.404652, 1, 0, 0.6588235, 1,
1.242993, 0.7356502, 2.613875, 1, 0, 0.654902, 1,
1.245376, 0.4758133, 1.929353, 1, 0, 0.6470588, 1,
1.260342, 0.4732831, 2.727938, 1, 0, 0.6431373, 1,
1.266085, 1.517866, 0.8054522, 1, 0, 0.6352941, 1,
1.274063, -0.1970235, 0.9618503, 1, 0, 0.6313726, 1,
1.283971, 0.002945516, 2.537466, 1, 0, 0.6235294, 1,
1.291365, -0.530212, 0.7858877, 1, 0, 0.6196079, 1,
1.295052, -0.8651112, -0.6123515, 1, 0, 0.6117647, 1,
1.297457, 0.8716943, -1.000203, 1, 0, 0.6078432, 1,
1.298623, 1.63698, -0.8736389, 1, 0, 0.6, 1,
1.299213, -0.7022017, -0.003240583, 1, 0, 0.5921569, 1,
1.302944, -1.21406, 0.5131353, 1, 0, 0.5882353, 1,
1.308405, -0.5017761, 2.275568, 1, 0, 0.5803922, 1,
1.312797, -0.7849049, 0.7589029, 1, 0, 0.5764706, 1,
1.315298, -0.1890336, 0.6092824, 1, 0, 0.5686275, 1,
1.321499, -1.117374, 0.1996984, 1, 0, 0.5647059, 1,
1.331378, -0.02310408, 0.5144368, 1, 0, 0.5568628, 1,
1.333528, -1.363201, 2.860244, 1, 0, 0.5529412, 1,
1.349311, -0.6937788, 0.9529709, 1, 0, 0.5450981, 1,
1.359705, -0.4549645, -0.6044762, 1, 0, 0.5411765, 1,
1.364121, 1.607064, 1.03499, 1, 0, 0.5333334, 1,
1.373408, -2.111299, 0.5060268, 1, 0, 0.5294118, 1,
1.393893, -0.1292027, 1.042977, 1, 0, 0.5215687, 1,
1.419797, -0.4883559, 2.813374, 1, 0, 0.5176471, 1,
1.421613, 0.2215515, 2.409775, 1, 0, 0.509804, 1,
1.437313, 0.1364754, 3.242898, 1, 0, 0.5058824, 1,
1.439149, -0.9888122, 1.429142, 1, 0, 0.4980392, 1,
1.447551, -1.469591, 2.444285, 1, 0, 0.4901961, 1,
1.449688, 1.159395, 0.6675448, 1, 0, 0.4862745, 1,
1.453514, -1.316338, 2.375598, 1, 0, 0.4784314, 1,
1.457094, -1.030363, 3.026088, 1, 0, 0.4745098, 1,
1.461866, 0.7339209, 0.9343377, 1, 0, 0.4666667, 1,
1.467842, -0.8651043, 4.157939, 1, 0, 0.4627451, 1,
1.476269, 1.269913, 0.0881339, 1, 0, 0.454902, 1,
1.477297, 0.7437676, 2.674508, 1, 0, 0.4509804, 1,
1.479359, 0.8443017, -0.9732231, 1, 0, 0.4431373, 1,
1.487077, 0.6446894, 0.7919494, 1, 0, 0.4392157, 1,
1.49771, -0.7609897, 2.302103, 1, 0, 0.4313726, 1,
1.510777, 0.1469437, 0.8388461, 1, 0, 0.427451, 1,
1.513318, -0.4119175, 1.076336, 1, 0, 0.4196078, 1,
1.516521, 1.419487, -1.247501, 1, 0, 0.4156863, 1,
1.52413, 0.3044174, 2.840023, 1, 0, 0.4078431, 1,
1.545278, 0.1628759, 0.4918107, 1, 0, 0.4039216, 1,
1.571164, 1.213294, 0.3635845, 1, 0, 0.3960784, 1,
1.573198, -0.196363, 2.669822, 1, 0, 0.3882353, 1,
1.573225, 0.8201532, 1.440381, 1, 0, 0.3843137, 1,
1.579848, -0.05654201, 1.568445, 1, 0, 0.3764706, 1,
1.597625, -0.8484772, 2.618472, 1, 0, 0.372549, 1,
1.615842, 0.1689282, 2.501006, 1, 0, 0.3647059, 1,
1.617095, -0.03432972, 0.6534094, 1, 0, 0.3607843, 1,
1.629777, -0.3483295, 3.062493, 1, 0, 0.3529412, 1,
1.63789, 1.056169, 1.256862, 1, 0, 0.3490196, 1,
1.663401, -0.1546874, 0.7029705, 1, 0, 0.3411765, 1,
1.664016, 0.07504016, 1.667242, 1, 0, 0.3372549, 1,
1.67488, 1.432112, 0.3882467, 1, 0, 0.3294118, 1,
1.687724, 0.6448956, 1.634358, 1, 0, 0.3254902, 1,
1.69085, -0.3044656, 1.985158, 1, 0, 0.3176471, 1,
1.695304, -1.187265, 1.980793, 1, 0, 0.3137255, 1,
1.704907, -0.3350859, 1.991438, 1, 0, 0.3058824, 1,
1.709433, -1.397852, 1.831271, 1, 0, 0.2980392, 1,
1.725009, 0.8834901, 1.012042, 1, 0, 0.2941177, 1,
1.736721, -1.707024, 3.517376, 1, 0, 0.2862745, 1,
1.736976, 0.2156956, 1.772131, 1, 0, 0.282353, 1,
1.754444, 0.788475, 0.9528049, 1, 0, 0.2745098, 1,
1.775569, 1.017771, 1.683065, 1, 0, 0.2705882, 1,
1.777822, -0.2596097, 0.9617541, 1, 0, 0.2627451, 1,
1.786711, 1.208577, 0.7571625, 1, 0, 0.2588235, 1,
1.817718, 1.576116, 0.2576514, 1, 0, 0.2509804, 1,
1.817835, 2.170152, 0.3275602, 1, 0, 0.2470588, 1,
1.829315, -0.616263, 2.792201, 1, 0, 0.2392157, 1,
1.842909, -1.879938, 0.4419752, 1, 0, 0.2352941, 1,
1.845662, -0.3682761, 1.616736, 1, 0, 0.227451, 1,
1.859093, 0.2935375, 1.640751, 1, 0, 0.2235294, 1,
1.875983, -0.9541962, 1.77365, 1, 0, 0.2156863, 1,
1.878654, 0.3751039, 0.9726582, 1, 0, 0.2117647, 1,
1.912982, 0.6146666, 1.819532, 1, 0, 0.2039216, 1,
1.939522, -1.54993, 3.904068, 1, 0, 0.1960784, 1,
1.952802, 0.5522964, 0.7658368, 1, 0, 0.1921569, 1,
1.958695, 0.2053501, 2.196939, 1, 0, 0.1843137, 1,
1.988096, 1.640649, 0.760304, 1, 0, 0.1803922, 1,
1.996998, -1.653686, 3.123202, 1, 0, 0.172549, 1,
2.015058, 0.2444947, 0.618121, 1, 0, 0.1686275, 1,
2.023769, -0.01277712, 2.046786, 1, 0, 0.1607843, 1,
2.025201, -0.4581975, 2.325769, 1, 0, 0.1568628, 1,
2.029935, 0.5813119, 1.237589, 1, 0, 0.1490196, 1,
2.035584, -0.09562495, 0.6294421, 1, 0, 0.145098, 1,
2.06093, 1.375476, 1.355096, 1, 0, 0.1372549, 1,
2.120827, -0.05498146, 1.671505, 1, 0, 0.1333333, 1,
2.158702, 0.009809244, 0.7157844, 1, 0, 0.1254902, 1,
2.177841, -0.1537585, 3.730879, 1, 0, 0.1215686, 1,
2.198354, 0.9613779, 1.333597, 1, 0, 0.1137255, 1,
2.200937, 0.1663734, -0.7924505, 1, 0, 0.1098039, 1,
2.212339, 0.03976193, 1.395015, 1, 0, 0.1019608, 1,
2.229109, 1.415142, 1.036658, 1, 0, 0.09411765, 1,
2.235403, 0.08036539, 2.188998, 1, 0, 0.09019608, 1,
2.313228, -1.038995, 3.471185, 1, 0, 0.08235294, 1,
2.364802, 0.9650115, 0.6320365, 1, 0, 0.07843138, 1,
2.508588, 1.163145, 2.282472, 1, 0, 0.07058824, 1,
2.530435, 1.122678, 0.5134227, 1, 0, 0.06666667, 1,
2.556611, -1.710683, 2.321289, 1, 0, 0.05882353, 1,
2.593488, 0.1888516, 1.33633, 1, 0, 0.05490196, 1,
2.594041, 0.1698043, 0.8255759, 1, 0, 0.04705882, 1,
2.627756, -0.08909075, 1.641074, 1, 0, 0.04313726, 1,
2.636592, -0.6933804, 0.1249518, 1, 0, 0.03529412, 1,
2.705243, -0.1464477, -1.243939, 1, 0, 0.03137255, 1,
2.827395, -1.643334, 1.706979, 1, 0, 0.02352941, 1,
2.912508, 0.9524562, 0.5208871, 1, 0, 0.01960784, 1,
3.089957, -0.6855796, 3.345514, 1, 0, 0.01176471, 1,
3.976237, -0.2039486, 1.30251, 1, 0, 0.007843138, 1
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
0.4592929, -3.962683, -7.774759, 0, -0.5, 0.5, 0.5,
0.4592929, -3.962683, -7.774759, 1, -0.5, 0.5, 0.5,
0.4592929, -3.962683, -7.774759, 1, 1.5, 0.5, 0.5,
0.4592929, -3.962683, -7.774759, 0, 1.5, 0.5, 0.5
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
-4.249896, 0.08707201, -7.774759, 0, -0.5, 0.5, 0.5,
-4.249896, 0.08707201, -7.774759, 1, -0.5, 0.5, 0.5,
-4.249896, 0.08707201, -7.774759, 1, 1.5, 0.5, 0.5,
-4.249896, 0.08707201, -7.774759, 0, 1.5, 0.5, 0.5
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
-4.249896, -3.962683, -0.1029346, 0, -0.5, 0.5, 0.5,
-4.249896, -3.962683, -0.1029346, 1, -0.5, 0.5, 0.5,
-4.249896, -3.962683, -0.1029346, 1, 1.5, 0.5, 0.5,
-4.249896, -3.962683, -0.1029346, 0, 1.5, 0.5, 0.5
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
-2, -3.028124, -6.004338,
2, -3.028124, -6.004338,
-2, -3.028124, -6.004338,
-2, -3.183884, -6.299408,
0, -3.028124, -6.004338,
0, -3.183884, -6.299408,
2, -3.028124, -6.004338,
2, -3.183884, -6.299408
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
-2, -3.495403, -6.889549, 0, -0.5, 0.5, 0.5,
-2, -3.495403, -6.889549, 1, -0.5, 0.5, 0.5,
-2, -3.495403, -6.889549, 1, 1.5, 0.5, 0.5,
-2, -3.495403, -6.889549, 0, 1.5, 0.5, 0.5,
0, -3.495403, -6.889549, 0, -0.5, 0.5, 0.5,
0, -3.495403, -6.889549, 1, -0.5, 0.5, 0.5,
0, -3.495403, -6.889549, 1, 1.5, 0.5, 0.5,
0, -3.495403, -6.889549, 0, 1.5, 0.5, 0.5,
2, -3.495403, -6.889549, 0, -0.5, 0.5, 0.5,
2, -3.495403, -6.889549, 1, -0.5, 0.5, 0.5,
2, -3.495403, -6.889549, 1, 1.5, 0.5, 0.5,
2, -3.495403, -6.889549, 0, 1.5, 0.5, 0.5
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
-3.16316, -2, -6.004338,
-3.16316, 3, -6.004338,
-3.16316, -2, -6.004338,
-3.344282, -2, -6.299408,
-3.16316, -1, -6.004338,
-3.344282, -1, -6.299408,
-3.16316, 0, -6.004338,
-3.344282, 0, -6.299408,
-3.16316, 1, -6.004338,
-3.344282, 1, -6.299408,
-3.16316, 2, -6.004338,
-3.344282, 2, -6.299408,
-3.16316, 3, -6.004338,
-3.344282, 3, -6.299408
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
-3.706527, -2, -6.889549, 0, -0.5, 0.5, 0.5,
-3.706527, -2, -6.889549, 1, -0.5, 0.5, 0.5,
-3.706527, -2, -6.889549, 1, 1.5, 0.5, 0.5,
-3.706527, -2, -6.889549, 0, 1.5, 0.5, 0.5,
-3.706527, -1, -6.889549, 0, -0.5, 0.5, 0.5,
-3.706527, -1, -6.889549, 1, -0.5, 0.5, 0.5,
-3.706527, -1, -6.889549, 1, 1.5, 0.5, 0.5,
-3.706527, -1, -6.889549, 0, 1.5, 0.5, 0.5,
-3.706527, 0, -6.889549, 0, -0.5, 0.5, 0.5,
-3.706527, 0, -6.889549, 1, -0.5, 0.5, 0.5,
-3.706527, 0, -6.889549, 1, 1.5, 0.5, 0.5,
-3.706527, 0, -6.889549, 0, 1.5, 0.5, 0.5,
-3.706527, 1, -6.889549, 0, -0.5, 0.5, 0.5,
-3.706527, 1, -6.889549, 1, -0.5, 0.5, 0.5,
-3.706527, 1, -6.889549, 1, 1.5, 0.5, 0.5,
-3.706527, 1, -6.889549, 0, 1.5, 0.5, 0.5,
-3.706527, 2, -6.889549, 0, -0.5, 0.5, 0.5,
-3.706527, 2, -6.889549, 1, -0.5, 0.5, 0.5,
-3.706527, 2, -6.889549, 1, 1.5, 0.5, 0.5,
-3.706527, 2, -6.889549, 0, 1.5, 0.5, 0.5,
-3.706527, 3, -6.889549, 0, -0.5, 0.5, 0.5,
-3.706527, 3, -6.889549, 1, -0.5, 0.5, 0.5,
-3.706527, 3, -6.889549, 1, 1.5, 0.5, 0.5,
-3.706527, 3, -6.889549, 0, 1.5, 0.5, 0.5
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
-3.16316, -3.028124, -4,
-3.16316, -3.028124, 4,
-3.16316, -3.028124, -4,
-3.344282, -3.183884, -4,
-3.16316, -3.028124, -2,
-3.344282, -3.183884, -2,
-3.16316, -3.028124, 0,
-3.344282, -3.183884, 0,
-3.16316, -3.028124, 2,
-3.344282, -3.183884, 2,
-3.16316, -3.028124, 4,
-3.344282, -3.183884, 4
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
-3.706527, -3.495403, -4, 0, -0.5, 0.5, 0.5,
-3.706527, -3.495403, -4, 1, -0.5, 0.5, 0.5,
-3.706527, -3.495403, -4, 1, 1.5, 0.5, 0.5,
-3.706527, -3.495403, -4, 0, 1.5, 0.5, 0.5,
-3.706527, -3.495403, -2, 0, -0.5, 0.5, 0.5,
-3.706527, -3.495403, -2, 1, -0.5, 0.5, 0.5,
-3.706527, -3.495403, -2, 1, 1.5, 0.5, 0.5,
-3.706527, -3.495403, -2, 0, 1.5, 0.5, 0.5,
-3.706527, -3.495403, 0, 0, -0.5, 0.5, 0.5,
-3.706527, -3.495403, 0, 1, -0.5, 0.5, 0.5,
-3.706527, -3.495403, 0, 1, 1.5, 0.5, 0.5,
-3.706527, -3.495403, 0, 0, 1.5, 0.5, 0.5,
-3.706527, -3.495403, 2, 0, -0.5, 0.5, 0.5,
-3.706527, -3.495403, 2, 1, -0.5, 0.5, 0.5,
-3.706527, -3.495403, 2, 1, 1.5, 0.5, 0.5,
-3.706527, -3.495403, 2, 0, 1.5, 0.5, 0.5,
-3.706527, -3.495403, 4, 0, -0.5, 0.5, 0.5,
-3.706527, -3.495403, 4, 1, -0.5, 0.5, 0.5,
-3.706527, -3.495403, 4, 1, 1.5, 0.5, 0.5,
-3.706527, -3.495403, 4, 0, 1.5, 0.5, 0.5
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
-3.16316, -3.028124, -6.004338,
-3.16316, 3.202268, -6.004338,
-3.16316, -3.028124, 5.798469,
-3.16316, 3.202268, 5.798469,
-3.16316, -3.028124, -6.004338,
-3.16316, -3.028124, 5.798469,
-3.16316, 3.202268, -6.004338,
-3.16316, 3.202268, 5.798469,
-3.16316, -3.028124, -6.004338,
4.081745, -3.028124, -6.004338,
-3.16316, -3.028124, 5.798469,
4.081745, -3.028124, 5.798469,
-3.16316, 3.202268, -6.004338,
4.081745, 3.202268, -6.004338,
-3.16316, 3.202268, 5.798469,
4.081745, 3.202268, 5.798469,
4.081745, -3.028124, -6.004338,
4.081745, 3.202268, -6.004338,
4.081745, -3.028124, 5.798469,
4.081745, 3.202268, 5.798469,
4.081745, -3.028124, -6.004338,
4.081745, -3.028124, 5.798469,
4.081745, 3.202268, -6.004338,
4.081745, 3.202268, 5.798469
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
var radius = 8.108996;
var distance = 36.07784;
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
mvMatrix.translate( -0.4592929, -0.08707201, 0.1029346 );
mvMatrix.scale( 1.210175, 1.407232, 0.7428406 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.07784);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Sodium_o-phenylpheno<-read.table("Sodium_o-phenylpheno.xyz")
```

```
## Error in read.table("Sodium_o-phenylpheno.xyz"): no lines available in input
```

```r
x<-Sodium_o-phenylpheno$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
```

```r
y<-Sodium_o-phenylpheno$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
```

```r
z<-Sodium_o-phenylpheno$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
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
-3.057651, 1.06713, -1.972656, 0, 0, 1, 1, 1,
-2.981076, 0.409141, -0.2489928, 1, 0, 0, 1, 1,
-2.894006, -1.381324, -2.849816, 1, 0, 0, 1, 1,
-2.828932, -0.3138993, -3.264166, 1, 0, 0, 1, 1,
-2.803538, -2.22568, -3.059826, 1, 0, 0, 1, 1,
-2.768228, -0.6687357, -1.526227, 1, 0, 0, 1, 1,
-2.717944, 0.1596155, -0.8288198, 0, 0, 0, 1, 1,
-2.557822, -0.6120589, -2.81425, 0, 0, 0, 1, 1,
-2.539158, 0.177673, -0.6615105, 0, 0, 0, 1, 1,
-2.426351, 2.079482, -1.47621, 0, 0, 0, 1, 1,
-2.364568, 0.1914524, -2.490755, 0, 0, 0, 1, 1,
-2.359165, 2.470893, -1.628535, 0, 0, 0, 1, 1,
-2.308409, 0.4410293, -0.976872, 0, 0, 0, 1, 1,
-2.262546, 0.5269147, -2.688236, 1, 1, 1, 1, 1,
-2.252369, 2.074387, -1.774607, 1, 1, 1, 1, 1,
-2.251988, -0.5205873, -1.298325, 1, 1, 1, 1, 1,
-2.243121, -1.127005, -2.714934, 1, 1, 1, 1, 1,
-2.194316, -1.11027, -2.959733, 1, 1, 1, 1, 1,
-2.104245, -0.05167341, -0.09514742, 1, 1, 1, 1, 1,
-2.081904, -0.9936994, -1.795863, 1, 1, 1, 1, 1,
-2.021231, -0.8858382, -2.397663, 1, 1, 1, 1, 1,
-2.018024, 0.4812268, -2.300589, 1, 1, 1, 1, 1,
-2.006229, 0.0804437, -2.07928, 1, 1, 1, 1, 1,
-1.993156, 0.9420352, 0.3438371, 1, 1, 1, 1, 1,
-1.971428, 0.03207835, -1.701241, 1, 1, 1, 1, 1,
-1.970771, -0.532816, -2.279077, 1, 1, 1, 1, 1,
-1.923543, -0.9650236, -1.357892, 1, 1, 1, 1, 1,
-1.900643, 0.2742417, -2.993134, 1, 1, 1, 1, 1,
-1.894027, -1.381182, -3.84535, 0, 0, 1, 1, 1,
-1.885459, 0.2176527, -3.561737, 1, 0, 0, 1, 1,
-1.884813, 2.016115, -2.278316, 1, 0, 0, 1, 1,
-1.884321, -0.1267698, -2.012856, 1, 0, 0, 1, 1,
-1.876942, -0.9127148, -1.895068, 1, 0, 0, 1, 1,
-1.856389, 0.4108208, -1.366263, 1, 0, 0, 1, 1,
-1.847282, -1.360738, -3.86599, 0, 0, 0, 1, 1,
-1.839622, 1.845239, -0.1108397, 0, 0, 0, 1, 1,
-1.821444, -1.135622, -3.69467, 0, 0, 0, 1, 1,
-1.80896, 0.1954218, -1.913756, 0, 0, 0, 1, 1,
-1.799723, 0.4822777, -2.13169, 0, 0, 0, 1, 1,
-1.798302, 0.6276789, -0.02082483, 0, 0, 0, 1, 1,
-1.780218, 0.5201244, -1.386208, 0, 0, 0, 1, 1,
-1.772385, 0.3144752, -1.838018, 1, 1, 1, 1, 1,
-1.70936, 0.2176841, -2.241018, 1, 1, 1, 1, 1,
-1.688305, -0.1266638, 0.4845588, 1, 1, 1, 1, 1,
-1.682369, -1.533715, -1.057376, 1, 1, 1, 1, 1,
-1.674912, 1.544609, -0.7750294, 1, 1, 1, 1, 1,
-1.646796, 0.119658, 0.06892945, 1, 1, 1, 1, 1,
-1.646411, 0.5973238, -3.317543, 1, 1, 1, 1, 1,
-1.644264, -0.01357183, -2.082434, 1, 1, 1, 1, 1,
-1.631491, -0.8541197, -1.080779, 1, 1, 1, 1, 1,
-1.631324, 0.5370713, -0.824518, 1, 1, 1, 1, 1,
-1.59442, 0.4787878, -0.5703214, 1, 1, 1, 1, 1,
-1.589159, 0.3547924, 0.2344075, 1, 1, 1, 1, 1,
-1.587773, -0.6113318, -3.454994, 1, 1, 1, 1, 1,
-1.583213, -1.136929, -0.778539, 1, 1, 1, 1, 1,
-1.582067, 0.7742567, -2.990192, 1, 1, 1, 1, 1,
-1.56012, -0.4675465, -1.078531, 0, 0, 1, 1, 1,
-1.559386, -0.09174644, -1.239877, 1, 0, 0, 1, 1,
-1.557626, -1.800399, -2.459519, 1, 0, 0, 1, 1,
-1.555266, 0.8922747, -2.613203, 1, 0, 0, 1, 1,
-1.553674, 0.0004467868, -3.717917, 1, 0, 0, 1, 1,
-1.553655, -1.510207, -1.604464, 1, 0, 0, 1, 1,
-1.536073, -0.3920781, -1.466299, 0, 0, 0, 1, 1,
-1.534904, -0.6376038, -0.7378044, 0, 0, 0, 1, 1,
-1.523985, -1.900447, -2.968819, 0, 0, 0, 1, 1,
-1.51999, 0.8274193, -0.3502852, 0, 0, 0, 1, 1,
-1.517025, 0.1907616, -0.496448, 0, 0, 0, 1, 1,
-1.517018, 0.2162891, -1.38639, 0, 0, 0, 1, 1,
-1.507515, -0.1543064, -2.927383, 0, 0, 0, 1, 1,
-1.487895, 0.266238, 1.052508, 1, 1, 1, 1, 1,
-1.47774, -0.9305257, -1.233522, 1, 1, 1, 1, 1,
-1.47478, 1.847764, 0.2791506, 1, 1, 1, 1, 1,
-1.470083, 1.162245, 0.9382279, 1, 1, 1, 1, 1,
-1.458934, 0.2370958, -1.288535, 1, 1, 1, 1, 1,
-1.457075, 0.334236, -1.892369, 1, 1, 1, 1, 1,
-1.454826, 0.3830765, -2.356297, 1, 1, 1, 1, 1,
-1.45302, -0.8002223, -1.877649, 1, 1, 1, 1, 1,
-1.448858, -1.474463, -2.873263, 1, 1, 1, 1, 1,
-1.43736, -0.9882653, -2.576162, 1, 1, 1, 1, 1,
-1.435551, -0.1603833, -0.682133, 1, 1, 1, 1, 1,
-1.42425, -1.000301, -1.694923, 1, 1, 1, 1, 1,
-1.41415, 0.9156798, -0.0235961, 1, 1, 1, 1, 1,
-1.408536, -0.6898955, -2.304708, 1, 1, 1, 1, 1,
-1.398039, 1.944699, -0.5367258, 1, 1, 1, 1, 1,
-1.380572, 0.8054273, -2.767066, 0, 0, 1, 1, 1,
-1.373263, 0.4674496, -2.011151, 1, 0, 0, 1, 1,
-1.369014, 1.471552, -1.177357, 1, 0, 0, 1, 1,
-1.367848, 0.3170048, -1.76841, 1, 0, 0, 1, 1,
-1.365475, 1.143225, -2.574628, 1, 0, 0, 1, 1,
-1.364454, -0.6008328, -1.961003, 1, 0, 0, 1, 1,
-1.36427, -0.2716943, -1.849767, 0, 0, 0, 1, 1,
-1.361208, 0.4851349, -2.193282, 0, 0, 0, 1, 1,
-1.355839, 0.925933, -0.3970218, 0, 0, 0, 1, 1,
-1.354566, 1.701997, -4.026052, 0, 0, 0, 1, 1,
-1.353418, -0.03496252, -0.765772, 0, 0, 0, 1, 1,
-1.345631, -0.3284786, -0.2837127, 0, 0, 0, 1, 1,
-1.342213, -1.461137, -2.652348, 0, 0, 0, 1, 1,
-1.341467, -0.8409311, -2.14336, 1, 1, 1, 1, 1,
-1.340314, 1.212216, -0.5186989, 1, 1, 1, 1, 1,
-1.293963, 2.20201, -0.6824647, 1, 1, 1, 1, 1,
-1.291596, -0.38116, -1.753659, 1, 1, 1, 1, 1,
-1.290697, -0.4456279, -1.962096, 1, 1, 1, 1, 1,
-1.290667, -0.8458979, -2.288199, 1, 1, 1, 1, 1,
-1.28767, -2.493333, -3.045043, 1, 1, 1, 1, 1,
-1.270183, -1.788407, -2.217984, 1, 1, 1, 1, 1,
-1.266301, 0.2307445, -0.6408242, 1, 1, 1, 1, 1,
-1.260644, -1.061674, -0.461408, 1, 1, 1, 1, 1,
-1.259719, -0.9608392, -2.536913, 1, 1, 1, 1, 1,
-1.249759, -0.6902889, -2.98328, 1, 1, 1, 1, 1,
-1.202034, -0.1881277, -1.552535, 1, 1, 1, 1, 1,
-1.195258, -0.2758444, -2.688202, 1, 1, 1, 1, 1,
-1.192906, -0.5112948, -2.214754, 1, 1, 1, 1, 1,
-1.188992, -1.884194, -4.065401, 0, 0, 1, 1, 1,
-1.18443, -0.4569314, -0.9810176, 1, 0, 0, 1, 1,
-1.183803, 0.3617507, -1.340207, 1, 0, 0, 1, 1,
-1.181959, 0.715414, -0.2492605, 1, 0, 0, 1, 1,
-1.180562, -0.05463685, -0.1820793, 1, 0, 0, 1, 1,
-1.177675, 0.2647537, 0.4514326, 1, 0, 0, 1, 1,
-1.175474, -0.6752274, -3.781672, 0, 0, 0, 1, 1,
-1.169207, 2.061961, 0.8695519, 0, 0, 0, 1, 1,
-1.165316, 0.5397737, 1.80746, 0, 0, 0, 1, 1,
-1.152511, -0.2103413, -2.671597, 0, 0, 0, 1, 1,
-1.150969, 0.4138453, -0.4851748, 0, 0, 0, 1, 1,
-1.148535, 0.3062756, -1.777611, 0, 0, 0, 1, 1,
-1.14317, 1.96281, 1.379398, 0, 0, 0, 1, 1,
-1.137886, -0.6491483, -3.350244, 1, 1, 1, 1, 1,
-1.133245, -0.1897071, -2.668086, 1, 1, 1, 1, 1,
-1.123721, 1.480411, -1.017798, 1, 1, 1, 1, 1,
-1.120842, 1.424237, -0.3239315, 1, 1, 1, 1, 1,
-1.119409, -0.1114055, -1.665518, 1, 1, 1, 1, 1,
-1.119331, 0.167277, -2.573468, 1, 1, 1, 1, 1,
-1.114635, 0.631321, -2.208644, 1, 1, 1, 1, 1,
-1.113042, -1.457559, -2.817254, 1, 1, 1, 1, 1,
-1.097635, 1.133567, 0.1606284, 1, 1, 1, 1, 1,
-1.09352, -0.1387693, -1.19913, 1, 1, 1, 1, 1,
-1.092822, -1.263007, -3.193816, 1, 1, 1, 1, 1,
-1.08629, 0.3311445, 0.8026876, 1, 1, 1, 1, 1,
-1.076884, 1.005445, -1.263804, 1, 1, 1, 1, 1,
-1.076696, 1.114347, 0.2518, 1, 1, 1, 1, 1,
-1.076415, -0.2536748, -2.66709, 1, 1, 1, 1, 1,
-1.071024, -0.1264864, -2.161761, 0, 0, 1, 1, 1,
-1.070225, -1.003635, -0.8911053, 1, 0, 0, 1, 1,
-1.069145, 0.3718911, -0.330025, 1, 0, 0, 1, 1,
-1.06862, 0.6438406, -2.426593, 1, 0, 0, 1, 1,
-1.052197, -0.8931207, -2.881746, 1, 0, 0, 1, 1,
-1.048705, -0.7750136, -2.960675, 1, 0, 0, 1, 1,
-1.047805, 0.600763, -0.2958047, 0, 0, 0, 1, 1,
-1.04125, 0.5411058, -1.528322, 0, 0, 0, 1, 1,
-1.024172, 0.7610889, 0.08848256, 0, 0, 0, 1, 1,
-1.019021, -0.1999006, -1.46968, 0, 0, 0, 1, 1,
-1.01727, 0.8232519, 0.2471958, 0, 0, 0, 1, 1,
-1.013114, 0.08407789, 0.8118691, 0, 0, 0, 1, 1,
-1.010278, -0.4853652, -1.707964, 0, 0, 0, 1, 1,
-1.009549, 0.6661302, -0.6445856, 1, 1, 1, 1, 1,
-1.004182, -0.3534696, -1.879514, 1, 1, 1, 1, 1,
-1.0004, -0.05256653, -2.149873, 1, 1, 1, 1, 1,
-1.000188, -0.5082059, -1.717131, 1, 1, 1, 1, 1,
-0.9960506, -0.2893419, -1.587983, 1, 1, 1, 1, 1,
-0.991071, -0.1184041, -2.515281, 1, 1, 1, 1, 1,
-0.9876233, -1.388993, -2.65261, 1, 1, 1, 1, 1,
-0.9871325, -1.496357, -3.443581, 1, 1, 1, 1, 1,
-0.9759933, 1.823734, -0.2062009, 1, 1, 1, 1, 1,
-0.973403, 0.1069886, -2.405753, 1, 1, 1, 1, 1,
-0.9695825, -1.169368, -3.105783, 1, 1, 1, 1, 1,
-0.9629952, 0.4051289, -0.9904658, 1, 1, 1, 1, 1,
-0.9549277, -0.2454138, -3.281706, 1, 1, 1, 1, 1,
-0.9461063, 0.9882993, -0.2210112, 1, 1, 1, 1, 1,
-0.9457236, -0.3421368, -0.7041205, 1, 1, 1, 1, 1,
-0.9447265, -1.941481, -3.275871, 0, 0, 1, 1, 1,
-0.9435428, 0.1047082, -0.8821319, 1, 0, 0, 1, 1,
-0.9420732, -0.7009971, -1.19321, 1, 0, 0, 1, 1,
-0.9392071, 0.1528021, 1.189522, 1, 0, 0, 1, 1,
-0.9328378, 2.509453, -0.9002998, 1, 0, 0, 1, 1,
-0.9249073, -0.6522565, -0.9951432, 1, 0, 0, 1, 1,
-0.9190353, 1.538865, -1.288839, 0, 0, 0, 1, 1,
-0.9055958, -0.1880313, -2.826656, 0, 0, 0, 1, 1,
-0.9044882, 0.399884, 0.2195061, 0, 0, 0, 1, 1,
-0.9041291, -1.20544, -2.558864, 0, 0, 0, 1, 1,
-0.9022556, -1.29815, -2.83322, 0, 0, 0, 1, 1,
-0.9021074, -1.565762, -2.63382, 0, 0, 0, 1, 1,
-0.9019719, -0.8701001, -1.404176, 0, 0, 0, 1, 1,
-0.900795, 1.831173, -1.381557, 1, 1, 1, 1, 1,
-0.8981366, -0.4136496, -1.37709, 1, 1, 1, 1, 1,
-0.8940963, 1.336379, -0.5474049, 1, 1, 1, 1, 1,
-0.8937027, 0.4122773, -1.986829, 1, 1, 1, 1, 1,
-0.8852067, 0.7811666, -0.258953, 1, 1, 1, 1, 1,
-0.8808931, -0.7397308, -2.802984, 1, 1, 1, 1, 1,
-0.880722, -2.93739, -1.898095, 1, 1, 1, 1, 1,
-0.8789479, -0.7244665, 0.6239029, 1, 1, 1, 1, 1,
-0.8663701, -0.734795, -3.534919, 1, 1, 1, 1, 1,
-0.8590862, 0.7816684, -0.04185582, 1, 1, 1, 1, 1,
-0.8585392, 0.2562394, -0.1376722, 1, 1, 1, 1, 1,
-0.8581917, -1.815985, -4.210499, 1, 1, 1, 1, 1,
-0.8523893, -0.7892409, -2.035415, 1, 1, 1, 1, 1,
-0.8510596, 0.4446557, -1.335776, 1, 1, 1, 1, 1,
-0.8459709, 0.3078723, -0.7438086, 1, 1, 1, 1, 1,
-0.8423331, 0.2787947, 0.4692385, 0, 0, 1, 1, 1,
-0.841464, -0.2947083, -2.692518, 1, 0, 0, 1, 1,
-0.8372008, -0.09892491, -4.400408, 1, 0, 0, 1, 1,
-0.834969, -1.788994, -1.018595, 1, 0, 0, 1, 1,
-0.832719, 0.4935729, 1.13064, 1, 0, 0, 1, 1,
-0.8273129, 0.8730368, 0.2525915, 1, 0, 0, 1, 1,
-0.8183911, -0.1646725, -3.007276, 0, 0, 0, 1, 1,
-0.8135223, 0.440014, -1.055136, 0, 0, 0, 1, 1,
-0.8119581, 0.8663771, -0.4196024, 0, 0, 0, 1, 1,
-0.8095317, -0.5014793, -5.372539, 0, 0, 0, 1, 1,
-0.8025241, 1.562724, 1.444597, 0, 0, 0, 1, 1,
-0.7983693, -1.651155, -2.712284, 0, 0, 0, 1, 1,
-0.7960678, 1.12004, -1.061061, 0, 0, 0, 1, 1,
-0.7955407, -1.155321, -1.641082, 1, 1, 1, 1, 1,
-0.7943771, -1.606788, -1.673245, 1, 1, 1, 1, 1,
-0.7909692, 1.532862, -0.2365093, 1, 1, 1, 1, 1,
-0.7863261, -0.2101314, -1.195885, 1, 1, 1, 1, 1,
-0.7833043, -1.494993, -1.68202, 1, 1, 1, 1, 1,
-0.7814464, -2.410477, -2.316809, 1, 1, 1, 1, 1,
-0.7800719, 0.2111234, -2.249967, 1, 1, 1, 1, 1,
-0.7783422, 0.5264927, -0.8511305, 1, 1, 1, 1, 1,
-0.7765039, 0.4560472, -1.031119, 1, 1, 1, 1, 1,
-0.7622606, -1.711606, -2.523453, 1, 1, 1, 1, 1,
-0.754723, -1.74513, -4.681605, 1, 1, 1, 1, 1,
-0.7484255, -0.8845508, -1.41999, 1, 1, 1, 1, 1,
-0.7445102, 0.4174292, -2.253234, 1, 1, 1, 1, 1,
-0.740735, 0.3731647, -1.226939, 1, 1, 1, 1, 1,
-0.7401291, 1.038585, -1.427657, 1, 1, 1, 1, 1,
-0.7361558, -0.3290021, -3.300371, 0, 0, 1, 1, 1,
-0.734664, 0.09434548, -0.933136, 1, 0, 0, 1, 1,
-0.7309657, -0.8995255, -4.61411, 1, 0, 0, 1, 1,
-0.7304122, 0.2444556, -0.4205319, 1, 0, 0, 1, 1,
-0.7285216, 0.2382366, -1.941105, 1, 0, 0, 1, 1,
-0.7251198, 1.111569, 0.2826885, 1, 0, 0, 1, 1,
-0.72438, -1.059389, -3.518816, 0, 0, 0, 1, 1,
-0.721437, -0.6876563, -2.519511, 0, 0, 0, 1, 1,
-0.7147105, 2.267655, -0.4007015, 0, 0, 0, 1, 1,
-0.7112003, -0.8675687, -3.545332, 0, 0, 0, 1, 1,
-0.7095476, -1.060599, -1.922652, 0, 0, 0, 1, 1,
-0.7094889, 2.341262, -0.8628785, 0, 0, 0, 1, 1,
-0.706468, -0.4841056, -3.064634, 0, 0, 0, 1, 1,
-0.7009281, 0.06398107, -2.181021, 1, 1, 1, 1, 1,
-0.6979983, 0.6968516, -1.184306, 1, 1, 1, 1, 1,
-0.6949626, 1.639404, -0.9209893, 1, 1, 1, 1, 1,
-0.6948191, 0.1446538, -0.08315113, 1, 1, 1, 1, 1,
-0.6874403, -0.2818989, -2.908697, 1, 1, 1, 1, 1,
-0.6836731, -0.4757301, -2.764438, 1, 1, 1, 1, 1,
-0.6825902, -1.255427, -2.277203, 1, 1, 1, 1, 1,
-0.6806964, -0.4364902, -0.8632118, 1, 1, 1, 1, 1,
-0.6770946, -0.3297757, -2.074358, 1, 1, 1, 1, 1,
-0.6715346, -0.09909488, -3.024597, 1, 1, 1, 1, 1,
-0.6653289, 0.6540846, -1.858708, 1, 1, 1, 1, 1,
-0.6651319, 0.874773, 0.4212281, 1, 1, 1, 1, 1,
-0.6634767, 0.1112385, -1.893055, 1, 1, 1, 1, 1,
-0.6600315, 0.08091903, -1.482074, 1, 1, 1, 1, 1,
-0.6526261, -0.4959482, -0.5531872, 1, 1, 1, 1, 1,
-0.6512529, -1.739268, -1.403684, 0, 0, 1, 1, 1,
-0.6508172, 2.712943, -0.9179019, 1, 0, 0, 1, 1,
-0.650489, -0.3336767, -1.966397, 1, 0, 0, 1, 1,
-0.6495724, 0.4499384, -1.101865, 1, 0, 0, 1, 1,
-0.6471725, -0.3719099, -0.8517216, 1, 0, 0, 1, 1,
-0.641533, -1.150421, -3.264882, 1, 0, 0, 1, 1,
-0.6412072, 1.495574, 0.9181767, 0, 0, 0, 1, 1,
-0.6380783, -0.6303685, -3.241452, 0, 0, 0, 1, 1,
-0.6367925, 0.4969606, 0.1383311, 0, 0, 0, 1, 1,
-0.6345493, 0.8196809, -0.09516399, 0, 0, 0, 1, 1,
-0.6331984, 0.585395, -1.620116, 0, 0, 0, 1, 1,
-0.6331714, -0.3817478, -1.910799, 0, 0, 0, 1, 1,
-0.6307939, -0.624927, -3.76094, 0, 0, 0, 1, 1,
-0.6231527, -1.246079, -2.385156, 1, 1, 1, 1, 1,
-0.6224858, -0.7963982, -2.55272, 1, 1, 1, 1, 1,
-0.6212729, 1.582347, -0.3664933, 1, 1, 1, 1, 1,
-0.6191114, -1.562435, -2.937483, 1, 1, 1, 1, 1,
-0.6169136, -1.961258, -2.140348, 1, 1, 1, 1, 1,
-0.6167403, 0.1916441, -2.461216, 1, 1, 1, 1, 1,
-0.6162403, 0.05814914, -1.694255, 1, 1, 1, 1, 1,
-0.6144525, -0.89367, -2.692059, 1, 1, 1, 1, 1,
-0.6093185, 0.2820762, -1.913157, 1, 1, 1, 1, 1,
-0.6032945, 2.723673, 0.6953613, 1, 1, 1, 1, 1,
-0.6023427, 2.703907, -1.095645, 1, 1, 1, 1, 1,
-0.602147, -2.004416, -3.527887, 1, 1, 1, 1, 1,
-0.6012446, 1.241488, -0.3038774, 1, 1, 1, 1, 1,
-0.6001154, -0.7758886, -2.683033, 1, 1, 1, 1, 1,
-0.5989567, -1.206112, -2.624774, 1, 1, 1, 1, 1,
-0.5955569, 1.641348, 0.28831, 0, 0, 1, 1, 1,
-0.5941486, -1.016147, -0.5899754, 1, 0, 0, 1, 1,
-0.5854197, -1.51971, -2.391131, 1, 0, 0, 1, 1,
-0.5824051, 0.8498846, -1.587495, 1, 0, 0, 1, 1,
-0.5797372, 0.5958419, -0.8360726, 1, 0, 0, 1, 1,
-0.5738372, -1.466537, -1.902874, 1, 0, 0, 1, 1,
-0.5704178, -0.2658519, -3.278551, 0, 0, 0, 1, 1,
-0.5662991, 0.4938303, -0.6659409, 0, 0, 0, 1, 1,
-0.5652301, 0.5277404, -0.5685696, 0, 0, 0, 1, 1,
-0.5613529, 1.009858, -1.407119, 0, 0, 0, 1, 1,
-0.5606042, -0.5186154, -3.336849, 0, 0, 0, 1, 1,
-0.5599498, 0.2825824, 1.466836, 0, 0, 0, 1, 1,
-0.5561327, 0.3789563, 0.6823795, 0, 0, 0, 1, 1,
-0.5553454, 0.4018498, -3.057342, 1, 1, 1, 1, 1,
-0.5471896, 0.3936825, -0.3719935, 1, 1, 1, 1, 1,
-0.5444215, -0.4638507, -3.671636, 1, 1, 1, 1, 1,
-0.5410743, -0.298695, -2.917771, 1, 1, 1, 1, 1,
-0.5410331, -0.7272716, -1.379089, 1, 1, 1, 1, 1,
-0.5400856, -1.755931, -2.244663, 1, 1, 1, 1, 1,
-0.5323143, 0.8346395, 0.749177, 1, 1, 1, 1, 1,
-0.5262807, -0.1244981, -2.010391, 1, 1, 1, 1, 1,
-0.5195195, 0.8860569, -0.5685206, 1, 1, 1, 1, 1,
-0.5178875, -0.1057988, -2.679141, 1, 1, 1, 1, 1,
-0.5096174, -0.3268622, -1.769727, 1, 1, 1, 1, 1,
-0.506384, 0.2672102, -1.805145, 1, 1, 1, 1, 1,
-0.5038626, -0.2809193, -0.7225049, 1, 1, 1, 1, 1,
-0.5038074, 1.022894, 0.3507223, 1, 1, 1, 1, 1,
-0.4994721, 1.111377, 0.5228365, 1, 1, 1, 1, 1,
-0.4992866, -0.5799573, -1.396412, 0, 0, 1, 1, 1,
-0.4932972, 0.2016145, -1.154235, 1, 0, 0, 1, 1,
-0.4932871, 2.43406, -0.6319861, 1, 0, 0, 1, 1,
-0.4870731, -0.1210367, -0.804032, 1, 0, 0, 1, 1,
-0.4849334, 0.4082372, -1.607462, 1, 0, 0, 1, 1,
-0.4793679, 0.07819075, 0.2445256, 1, 0, 0, 1, 1,
-0.4729387, -0.2174749, -1.96557, 0, 0, 0, 1, 1,
-0.46847, 0.9667825, -0.6515737, 0, 0, 0, 1, 1,
-0.4667329, 0.2877162, -0.4817019, 0, 0, 0, 1, 1,
-0.457482, -0.2982456, -1.18507, 0, 0, 0, 1, 1,
-0.4534566, -1.267432, -3.157355, 0, 0, 0, 1, 1,
-0.4531425, -0.6413798, -3.059557, 0, 0, 0, 1, 1,
-0.4518611, -0.8231535, -2.394457, 0, 0, 0, 1, 1,
-0.4467002, 0.426877, -0.3045971, 1, 1, 1, 1, 1,
-0.4423106, 0.5336306, -1.197639, 1, 1, 1, 1, 1,
-0.4385646, 0.6550253, 0.6118336, 1, 1, 1, 1, 1,
-0.4338517, -1.561698, -3.322988, 1, 1, 1, 1, 1,
-0.4309666, -0.7119879, -2.279322, 1, 1, 1, 1, 1,
-0.4302895, 0.01034613, -1.034558, 1, 1, 1, 1, 1,
-0.42905, -0.4736201, -2.833122, 1, 1, 1, 1, 1,
-0.4273629, 0.3080329, -0.6548833, 1, 1, 1, 1, 1,
-0.4272865, -0.8678156, -3.45981, 1, 1, 1, 1, 1,
-0.4229531, -1.570722, -2.897689, 1, 1, 1, 1, 1,
-0.4108015, -1.354008, -5.832453, 1, 1, 1, 1, 1,
-0.4044193, 0.3965796, 0.0653255, 1, 1, 1, 1, 1,
-0.4018329, -1.559696, -3.246454, 1, 1, 1, 1, 1,
-0.4005884, -0.1244543, 0.2231189, 1, 1, 1, 1, 1,
-0.3974858, -0.2117396, -0.8417448, 1, 1, 1, 1, 1,
-0.3964121, -0.8350238, -3.015056, 0, 0, 1, 1, 1,
-0.3922696, -0.3475163, -0.03590684, 1, 0, 0, 1, 1,
-0.3915915, 0.6116552, -1.37676, 1, 0, 0, 1, 1,
-0.3905285, -0.3417083, -1.886853, 1, 0, 0, 1, 1,
-0.3892633, 1.082273, 1.213289, 1, 0, 0, 1, 1,
-0.3879504, -1.569574, -2.49599, 1, 0, 0, 1, 1,
-0.3866749, -0.3334077, -1.54175, 0, 0, 0, 1, 1,
-0.3826983, 0.8095802, -0.9623054, 0, 0, 0, 1, 1,
-0.3818478, 0.1403951, -0.6633751, 0, 0, 0, 1, 1,
-0.3812858, -1.15279, -2.096193, 0, 0, 0, 1, 1,
-0.3798307, 0.2064631, -3.333454, 0, 0, 0, 1, 1,
-0.3757076, 0.5755703, 0.4702688, 0, 0, 0, 1, 1,
-0.3756767, 0.3729385, -1.894006, 0, 0, 0, 1, 1,
-0.3744323, 1.622965, -1.350804, 1, 1, 1, 1, 1,
-0.3742585, 1.395316, -0.06017745, 1, 1, 1, 1, 1,
-0.3720781, 0.8249324, -1.530883, 1, 1, 1, 1, 1,
-0.3718708, -1.536979, -1.522353, 1, 1, 1, 1, 1,
-0.3716986, 0.04449001, -1.274405, 1, 1, 1, 1, 1,
-0.3686657, 0.146695, -2.848955, 1, 1, 1, 1, 1,
-0.3677251, 0.7211075, -0.5437599, 1, 1, 1, 1, 1,
-0.3652236, 1.125667, -0.7039772, 1, 1, 1, 1, 1,
-0.3637519, 0.3347607, -0.5941623, 1, 1, 1, 1, 1,
-0.3632496, -2.424128, -3.708163, 1, 1, 1, 1, 1,
-0.3587983, 0.4151827, -1.102137, 1, 1, 1, 1, 1,
-0.3586204, -1.591599, -4.165855, 1, 1, 1, 1, 1,
-0.3585855, 1.644312, -2.050589, 1, 1, 1, 1, 1,
-0.3549294, -1.14594, -2.412627, 1, 1, 1, 1, 1,
-0.3537735, 1.019542, 1.469557, 1, 1, 1, 1, 1,
-0.3515927, -0.9016608, -4.640707, 0, 0, 1, 1, 1,
-0.3503096, 0.5997171, -1.120811, 1, 0, 0, 1, 1,
-0.3485564, 1.680902, 0.5860801, 1, 0, 0, 1, 1,
-0.3401106, 0.7026049, 0.3790247, 1, 0, 0, 1, 1,
-0.3385525, 1.283762, 1.247423, 1, 0, 0, 1, 1,
-0.3372688, -0.2528589, -2.277101, 1, 0, 0, 1, 1,
-0.3218284, -0.06955046, -0.2899271, 0, 0, 0, 1, 1,
-0.3211036, 1.288639, 0.1086227, 0, 0, 0, 1, 1,
-0.3210238, -1.226856, -2.132667, 0, 0, 0, 1, 1,
-0.320858, -0.5146379, -2.85604, 0, 0, 0, 1, 1,
-0.3171766, 1.077127, -1.060513, 0, 0, 0, 1, 1,
-0.316436, -0.2788976, -0.8464363, 0, 0, 0, 1, 1,
-0.31589, -0.6504678, -1.375833, 0, 0, 0, 1, 1,
-0.3143265, 1.658923, -1.583521, 1, 1, 1, 1, 1,
-0.3132402, -1.609373, -4.203969, 1, 1, 1, 1, 1,
-0.3127576, -2.148247, -2.130971, 1, 1, 1, 1, 1,
-0.3110195, -0.5484217, -2.842365, 1, 1, 1, 1, 1,
-0.3023642, -0.2661129, -1.851015, 1, 1, 1, 1, 1,
-0.2974189, -0.1573811, -0.9882954, 1, 1, 1, 1, 1,
-0.2915622, 0.6395741, 0.3799412, 1, 1, 1, 1, 1,
-0.289755, -0.004728983, -2.932594, 1, 1, 1, 1, 1,
-0.2888454, 0.809127, 0.1690232, 1, 1, 1, 1, 1,
-0.2875344, -0.02872309, -0.8014527, 1, 1, 1, 1, 1,
-0.2868794, 0.1585265, -2.351459, 1, 1, 1, 1, 1,
-0.2846949, -0.9677817, -3.258884, 1, 1, 1, 1, 1,
-0.2804237, 1.322733, 0.9516124, 1, 1, 1, 1, 1,
-0.2768258, -0.7301686, -1.188094, 1, 1, 1, 1, 1,
-0.2749091, 0.983085, 0.9575423, 1, 1, 1, 1, 1,
-0.274584, 0.3600925, -0.985761, 0, 0, 1, 1, 1,
-0.2717048, 0.1186641, -1.730471, 1, 0, 0, 1, 1,
-0.2693439, 0.799248, -0.5364782, 1, 0, 0, 1, 1,
-0.2618627, -0.06472998, -2.974201, 1, 0, 0, 1, 1,
-0.2601026, -1.316996, -2.713106, 1, 0, 0, 1, 1,
-0.2576368, 0.8957846, -0.04895493, 1, 0, 0, 1, 1,
-0.2569012, 1.234977, -1.528966, 0, 0, 0, 1, 1,
-0.2525937, -2.766626, -1.912228, 0, 0, 0, 1, 1,
-0.2490572, 1.476922, -2.424423, 0, 0, 0, 1, 1,
-0.2484773, 1.928082, 0.755723, 0, 0, 0, 1, 1,
-0.2475449, -1.040317, -3.968343, 0, 0, 0, 1, 1,
-0.2467931, -1.234939, -2.91146, 0, 0, 0, 1, 1,
-0.2458501, -0.6892312, -0.9761116, 0, 0, 0, 1, 1,
-0.245789, 1.046253, 0.1024118, 1, 1, 1, 1, 1,
-0.2437542, -0.3607075, -3.046493, 1, 1, 1, 1, 1,
-0.2367082, 0.9809636, -0.2769566, 1, 1, 1, 1, 1,
-0.2329221, -1.001139, -2.451147, 1, 1, 1, 1, 1,
-0.2313105, 0.1466345, -1.75192, 1, 1, 1, 1, 1,
-0.2311388, -0.6547062, -4.681484, 1, 1, 1, 1, 1,
-0.2301455, -0.5988806, -3.500824, 1, 1, 1, 1, 1,
-0.2289175, 1.175992, 0.01385409, 1, 1, 1, 1, 1,
-0.226541, 0.9378256, -0.2916468, 1, 1, 1, 1, 1,
-0.2211938, 0.7073997, -1.277142, 1, 1, 1, 1, 1,
-0.2169846, 0.6651909, -1.069621, 1, 1, 1, 1, 1,
-0.2152655, 0.316323, -0.9809502, 1, 1, 1, 1, 1,
-0.2135627, -1.713995, -1.719139, 1, 1, 1, 1, 1,
-0.2105644, 1.398411, -0.7079946, 1, 1, 1, 1, 1,
-0.2076728, 1.011326, -0.3140953, 1, 1, 1, 1, 1,
-0.2073993, 1.44356, 0.4345949, 0, 0, 1, 1, 1,
-0.202837, 2.755015, -1.555085, 1, 0, 0, 1, 1,
-0.197246, 0.1484886, -0.3811056, 1, 0, 0, 1, 1,
-0.1966134, 0.3021788, -1.93953, 1, 0, 0, 1, 1,
-0.194763, 0.2690774, -0.5494868, 1, 0, 0, 1, 1,
-0.1911619, -0.2972584, -1.518382, 1, 0, 0, 1, 1,
-0.1907731, -2.039223, -3.19075, 0, 0, 0, 1, 1,
-0.1859533, 1.298253, -2.452207, 0, 0, 0, 1, 1,
-0.1818561, -1.829045, -2.167547, 0, 0, 0, 1, 1,
-0.1784572, 2.168635, 0.6029701, 0, 0, 0, 1, 1,
-0.1773784, -0.9019662, -2.286817, 0, 0, 0, 1, 1,
-0.1754972, -0.07060015, -3.205294, 0, 0, 0, 1, 1,
-0.1751362, -0.8409492, -3.528837, 0, 0, 0, 1, 1,
-0.1746748, 0.6708072, -0.5251885, 1, 1, 1, 1, 1,
-0.1739886, 0.08514693, -1.469603, 1, 1, 1, 1, 1,
-0.1736148, -1.100142, -2.972445, 1, 1, 1, 1, 1,
-0.1720682, 1.298945, -0.5674828, 1, 1, 1, 1, 1,
-0.1708919, 0.638627, 1.164803, 1, 1, 1, 1, 1,
-0.1700736, -0.1949513, -1.867129, 1, 1, 1, 1, 1,
-0.168692, 0.7430957, 1.050405, 1, 1, 1, 1, 1,
-0.1682305, -0.6602978, -2.315569, 1, 1, 1, 1, 1,
-0.1678674, -2.271574, -4.673073, 1, 1, 1, 1, 1,
-0.1623964, 0.1259203, -0.3386534, 1, 1, 1, 1, 1,
-0.1621529, 0.5024269, -1.931487, 1, 1, 1, 1, 1,
-0.1618696, -1.030201, -2.364329, 1, 1, 1, 1, 1,
-0.1610699, 0.5436171, 0.2599408, 1, 1, 1, 1, 1,
-0.1562453, 0.5346997, -0.1756698, 1, 1, 1, 1, 1,
-0.1508506, -0.07432757, -1.357029, 1, 1, 1, 1, 1,
-0.1461641, 1.070947, 0.1885655, 0, 0, 1, 1, 1,
-0.1442009, -1.321923, -3.29432, 1, 0, 0, 1, 1,
-0.1422477, 0.2241789, 1.454328, 1, 0, 0, 1, 1,
-0.1415802, -1.742391, -1.694378, 1, 0, 0, 1, 1,
-0.1405334, -1.750954, -1.512476, 1, 0, 0, 1, 1,
-0.1379359, -0.7768025, -2.117779, 1, 0, 0, 1, 1,
-0.1371732, -0.7851644, -1.336589, 0, 0, 0, 1, 1,
-0.1360734, -0.3966214, -4.011463, 0, 0, 0, 1, 1,
-0.1235514, 0.3603252, 0.1871345, 0, 0, 0, 1, 1,
-0.1234651, -0.7082199, -1.888466, 0, 0, 0, 1, 1,
-0.1225265, 1.622589, -0.03242678, 0, 0, 0, 1, 1,
-0.1223766, -0.995415, -4.034026, 0, 0, 0, 1, 1,
-0.1213014, -0.715005, -2.583287, 0, 0, 0, 1, 1,
-0.1130134, 0.8543997, 0.2851017, 1, 1, 1, 1, 1,
-0.1128216, -2.125867, -2.52455, 1, 1, 1, 1, 1,
-0.1110778, -0.2716106, -3.948349, 1, 1, 1, 1, 1,
-0.1104344, 1.364012, -1.253087, 1, 1, 1, 1, 1,
-0.1078758, -1.068351, -3.503668, 1, 1, 1, 1, 1,
-0.1063985, 2.331834, 1.741472, 1, 1, 1, 1, 1,
-0.1019212, 2.825598, 0.4017579, 1, 1, 1, 1, 1,
-0.1007469, -0.715594, -3.814321, 1, 1, 1, 1, 1,
-0.09967001, -0.783741, -3.883461, 1, 1, 1, 1, 1,
-0.09913062, -0.8403423, -2.939442, 1, 1, 1, 1, 1,
-0.09806577, -0.3658839, -1.779856, 1, 1, 1, 1, 1,
-0.09790641, 0.2065336, -0.03265446, 1, 1, 1, 1, 1,
-0.09160245, 1.609135, 0.1709457, 1, 1, 1, 1, 1,
-0.09073843, -0.8031799, -1.271402, 1, 1, 1, 1, 1,
-0.08861817, -0.02297865, -1.256669, 1, 1, 1, 1, 1,
-0.08679878, -0.61844, -3.052259, 0, 0, 1, 1, 1,
-0.08466832, 1.054975, 0.3058925, 1, 0, 0, 1, 1,
-0.08203021, -1.431572, -1.837995, 1, 0, 0, 1, 1,
-0.08176742, -1.393556, -3.052314, 1, 0, 0, 1, 1,
-0.08146058, -1.281739, -4.064567, 1, 0, 0, 1, 1,
-0.08106473, 0.9209954, 0.9916921, 1, 0, 0, 1, 1,
-0.07857782, -0.1108425, -4.219485, 0, 0, 0, 1, 1,
-0.07552325, -1.399049, -2.655013, 0, 0, 0, 1, 1,
-0.0733961, -0.7598425, -2.785027, 0, 0, 0, 1, 1,
-0.07298734, -1.16034, -1.537801, 0, 0, 0, 1, 1,
-0.07068992, 0.9433517, 0.9824763, 0, 0, 0, 1, 1,
-0.0661989, 0.2405537, 0.1879699, 0, 0, 0, 1, 1,
-0.06575139, 1.485996, 0.6009185, 0, 0, 0, 1, 1,
-0.06447493, 0.3316594, 0.6297149, 1, 1, 1, 1, 1,
-0.0620545, 0.5339684, -0.7920395, 1, 1, 1, 1, 1,
-0.05996399, -0.08150989, -3.011579, 1, 1, 1, 1, 1,
-0.05457096, 0.5316606, 0.9986924, 1, 1, 1, 1, 1,
-0.05392172, 0.8588755, -0.625309, 1, 1, 1, 1, 1,
-0.05285769, 1.310046, 0.7168829, 1, 1, 1, 1, 1,
-0.05127034, -0.522661, -2.809362, 1, 1, 1, 1, 1,
-0.04912883, 0.505838, -0.3852057, 1, 1, 1, 1, 1,
-0.04847998, 0.994648, 2.120747, 1, 1, 1, 1, 1,
-0.04845887, -0.2674472, -2.726118, 1, 1, 1, 1, 1,
-0.04268425, -2.157391, -3.049324, 1, 1, 1, 1, 1,
-0.03777018, -0.06309561, -2.247417, 1, 1, 1, 1, 1,
-0.03334561, -0.5956443, -3.899548, 1, 1, 1, 1, 1,
-0.02892411, 0.3337797, 0.7798216, 1, 1, 1, 1, 1,
-0.02886952, 0.6834313, 2.369413, 1, 1, 1, 1, 1,
-0.02338761, -0.1457529, -4.029549, 0, 0, 1, 1, 1,
-0.02173764, 0.1977814, 0.1186313, 1, 0, 0, 1, 1,
-0.02030182, -1.967838, -1.919055, 1, 0, 0, 1, 1,
-0.01882301, -0.4747858, -4.513704, 1, 0, 0, 1, 1,
-0.01853191, -0.1822665, -2.918681, 1, 0, 0, 1, 1,
-0.01734555, -0.2221082, -4.149264, 1, 0, 0, 1, 1,
-0.01524583, -1.78558, -2.68865, 0, 0, 0, 1, 1,
-0.01205518, 0.8673232, 0.3870646, 0, 0, 0, 1, 1,
-0.01149492, 1.292673, 0.3367496, 0, 0, 0, 1, 1,
-0.008025439, -0.2376619, -4.782115, 0, 0, 0, 1, 1,
-0.004757393, -0.3425867, -2.988156, 0, 0, 0, 1, 1,
-0.003854049, -1.681901, -4.431766, 0, 0, 0, 1, 1,
-0.003715686, -0.001927605, -2.57861, 0, 0, 0, 1, 1,
0.002560374, 0.4961276, -3.31708, 1, 1, 1, 1, 1,
0.002641859, -0.7720058, 4.399941, 1, 1, 1, 1, 1,
0.003768491, -0.7144501, 1.676754, 1, 1, 1, 1, 1,
0.006352427, 0.9671921, 0.3695315, 1, 1, 1, 1, 1,
0.006693194, -0.07396006, 4.359904, 1, 1, 1, 1, 1,
0.00793867, -1.072361, 2.970044, 1, 1, 1, 1, 1,
0.008876825, -0.4777818, 3.489508, 1, 1, 1, 1, 1,
0.009883572, -1.427384, 4.55533, 1, 1, 1, 1, 1,
0.01040033, 0.8486419, 0.05110265, 1, 1, 1, 1, 1,
0.01425265, 0.2302059, 0.3375324, 1, 1, 1, 1, 1,
0.01433702, 0.09019441, -0.5682697, 1, 1, 1, 1, 1,
0.01538294, 0.8224129, -0.3447271, 1, 1, 1, 1, 1,
0.02253907, -0.5819382, 3.098722, 1, 1, 1, 1, 1,
0.02388073, -0.2082248, 2.679769, 1, 1, 1, 1, 1,
0.02942866, 1.367134, -0.01572437, 1, 1, 1, 1, 1,
0.031103, 0.4287646, 1.118697, 0, 0, 1, 1, 1,
0.03664353, 1.252478, 0.1421259, 1, 0, 0, 1, 1,
0.04059348, 0.7771587, -0.2735572, 1, 0, 0, 1, 1,
0.04432541, -0.300773, 3.194983, 1, 0, 0, 1, 1,
0.04996661, 0.5493221, -0.6997449, 1, 0, 0, 1, 1,
0.05078611, -1.479833, 2.306782, 1, 0, 0, 1, 1,
0.05099619, -0.721613, 4.240206, 0, 0, 0, 1, 1,
0.05171494, 0.3788909, 0.6008894, 0, 0, 0, 1, 1,
0.06423248, -0.9858989, 3.677654, 0, 0, 0, 1, 1,
0.067521, -0.2022719, 0.2984162, 0, 0, 0, 1, 1,
0.07069968, -1.578414, 3.315194, 0, 0, 0, 1, 1,
0.07425923, -0.4355515, 2.814072, 0, 0, 0, 1, 1,
0.07458954, 0.442778, 1.561314, 0, 0, 0, 1, 1,
0.0755365, -0.9386877, 3.398062, 1, 1, 1, 1, 1,
0.07995902, 1.398096, 0.2936213, 1, 1, 1, 1, 1,
0.08270223, -0.4272681, 2.271284, 1, 1, 1, 1, 1,
0.08832008, 0.4061376, -0.562958, 1, 1, 1, 1, 1,
0.08947584, -0.4932835, 1.481557, 1, 1, 1, 1, 1,
0.0901923, 0.109687, -1.756147, 1, 1, 1, 1, 1,
0.09091725, 0.8638485, -1.484934, 1, 1, 1, 1, 1,
0.09212372, -0.3329723, 1.107076, 1, 1, 1, 1, 1,
0.09216999, -0.2322792, 2.507139, 1, 1, 1, 1, 1,
0.09409039, -1.019737, 1.95778, 1, 1, 1, 1, 1,
0.09726193, 0.8479313, -0.9872201, 1, 1, 1, 1, 1,
0.09911729, 0.2771088, 0.7321014, 1, 1, 1, 1, 1,
0.1020917, 1.736686, 1.468289, 1, 1, 1, 1, 1,
0.1115649, -0.2878728, 3.431061, 1, 1, 1, 1, 1,
0.113429, -1.042326, 4.252354, 1, 1, 1, 1, 1,
0.1135728, 1.925575, -0.1524704, 0, 0, 1, 1, 1,
0.1143548, 0.819016, 1.388998, 1, 0, 0, 1, 1,
0.1207715, 0.07872105, 0.1759415, 1, 0, 0, 1, 1,
0.1267972, -0.03550622, 1.568004, 1, 0, 0, 1, 1,
0.1276356, -0.3526537, 2.583218, 1, 0, 0, 1, 1,
0.1280732, 1.316918, -2.435308, 1, 0, 0, 1, 1,
0.1352974, 2.520649, 0.9309078, 0, 0, 0, 1, 1,
0.1391741, 0.4369946, 0.1235794, 0, 0, 0, 1, 1,
0.1422071, 1.29034, 0.8179242, 0, 0, 0, 1, 1,
0.143283, 0.09211668, 0.3862584, 0, 0, 0, 1, 1,
0.1459985, -0.7690406, 2.647122, 0, 0, 0, 1, 1,
0.1483523, -0.5629526, 0.8224387, 0, 0, 0, 1, 1,
0.1499044, 1.609449, -0.9261551, 0, 0, 0, 1, 1,
0.1510218, 0.2454728, 1.108176, 1, 1, 1, 1, 1,
0.1554643, 0.2452707, 1.239645, 1, 1, 1, 1, 1,
0.1606054, 1.337842, 2.67524, 1, 1, 1, 1, 1,
0.1626251, 0.06881245, 1.513733, 1, 1, 1, 1, 1,
0.1634828, -0.3605564, 2.715161, 1, 1, 1, 1, 1,
0.16434, -0.4722076, 3.443596, 1, 1, 1, 1, 1,
0.1649932, 0.6806672, -0.6281795, 1, 1, 1, 1, 1,
0.165096, -0.9685251, 3.236743, 1, 1, 1, 1, 1,
0.1679099, 0.6953641, -0.4522715, 1, 1, 1, 1, 1,
0.1703138, -0.7181923, 3.63872, 1, 1, 1, 1, 1,
0.1720543, 0.08734453, 1.985119, 1, 1, 1, 1, 1,
0.1770408, 0.6340125, 0.8174503, 1, 1, 1, 1, 1,
0.1770836, 0.3606716, -0.2183182, 1, 1, 1, 1, 1,
0.1776621, 1.908969, 1.310065, 1, 1, 1, 1, 1,
0.1790096, -0.7280975, 3.820061, 1, 1, 1, 1, 1,
0.1801921, -0.6628577, 3.367099, 0, 0, 1, 1, 1,
0.1814406, 0.9776928, -1.486049, 1, 0, 0, 1, 1,
0.1847143, -1.302789, 2.735546, 1, 0, 0, 1, 1,
0.1914298, -0.4106303, 4.766158, 1, 0, 0, 1, 1,
0.1940134, -0.4584616, 2.82154, 1, 0, 0, 1, 1,
0.1958781, 1.893857, 0.0780897, 1, 0, 0, 1, 1,
0.2026711, -1.035367, 4.17618, 0, 0, 0, 1, 1,
0.2035808, -0.6981435, 3.432889, 0, 0, 0, 1, 1,
0.2036192, 1.192926, 1.011766, 0, 0, 0, 1, 1,
0.2068355, 0.9490489, -0.5199096, 0, 0, 0, 1, 1,
0.2107307, 0.6212786, -0.791344, 0, 0, 0, 1, 1,
0.2107562, -1.426927, 1.774853, 0, 0, 0, 1, 1,
0.2131883, -0.9864461, 2.891711, 0, 0, 0, 1, 1,
0.2155385, -0.6206851, 1.093653, 1, 1, 1, 1, 1,
0.2209937, 0.04115294, 3.141992, 1, 1, 1, 1, 1,
0.2212452, 0.6000464, 1.395706, 1, 1, 1, 1, 1,
0.2240206, -0.1594581, 3.020235, 1, 1, 1, 1, 1,
0.2252043, -0.8018868, 1.816817, 1, 1, 1, 1, 1,
0.2254687, 2.071828, -0.4942189, 1, 1, 1, 1, 1,
0.2321336, 0.001262516, 1.006312, 1, 1, 1, 1, 1,
0.2360334, 0.7379882, -0.3096542, 1, 1, 1, 1, 1,
0.2365336, 1.627022, 0.012079, 1, 1, 1, 1, 1,
0.2443849, -1.046548, 3.72516, 1, 1, 1, 1, 1,
0.2447456, -0.1448988, 1.889007, 1, 1, 1, 1, 1,
0.2554452, 0.2788652, 1.462502, 1, 1, 1, 1, 1,
0.2623325, -1.283521, 4.725612, 1, 1, 1, 1, 1,
0.2635775, 0.2203332, -1.442987, 1, 1, 1, 1, 1,
0.2659968, 0.7590296, -2.534269, 1, 1, 1, 1, 1,
0.269956, 2.30684, 0.424099, 0, 0, 1, 1, 1,
0.2722017, 1.009582, 0.01125988, 1, 0, 0, 1, 1,
0.2764761, 0.3627611, 1.882971, 1, 0, 0, 1, 1,
0.2785423, 0.6710241, 0.2796005, 1, 0, 0, 1, 1,
0.2843795, 0.9123297, 1.698376, 1, 0, 0, 1, 1,
0.2864272, -0.3103534, 1.341726, 1, 0, 0, 1, 1,
0.28803, 0.5146184, 1.256456, 0, 0, 0, 1, 1,
0.2888503, 0.3689939, -0.4249414, 0, 0, 0, 1, 1,
0.2953203, -1.074579, 3.443484, 0, 0, 0, 1, 1,
0.3018716, -1.618019, 0.4491707, 0, 0, 0, 1, 1,
0.3036934, -0.7216259, 1.721742, 0, 0, 0, 1, 1,
0.3089994, 0.3081811, 2.102641, 0, 0, 0, 1, 1,
0.31155, -0.1051587, 2.21116, 0, 0, 0, 1, 1,
0.311855, 0.1846497, -0.4242148, 1, 1, 1, 1, 1,
0.3181632, -0.3222383, 4.421167, 1, 1, 1, 1, 1,
0.3209095, -1.32495, 3.090333, 1, 1, 1, 1, 1,
0.3231637, 0.3183494, 1.973333, 1, 1, 1, 1, 1,
0.3241264, 0.1836111, 2.165749, 1, 1, 1, 1, 1,
0.334445, -1.13764, 2.992954, 1, 1, 1, 1, 1,
0.3369527, -0.3772229, 3.170981, 1, 1, 1, 1, 1,
0.3370018, 0.7440219, 0.6040172, 1, 1, 1, 1, 1,
0.3385305, -0.6841505, 1.670138, 1, 1, 1, 1, 1,
0.3391763, -0.9512057, 3.51219, 1, 1, 1, 1, 1,
0.3392718, -0.4289188, 2.113964, 1, 1, 1, 1, 1,
0.344913, 0.3976099, 2.826763, 1, 1, 1, 1, 1,
0.3449233, -0.5206048, 1.885847, 1, 1, 1, 1, 1,
0.3468643, -0.6772537, 3.396963, 1, 1, 1, 1, 1,
0.3495147, -1.447413, 2.578489, 1, 1, 1, 1, 1,
0.3503006, -1.029523, 2.941544, 0, 0, 1, 1, 1,
0.3504713, 0.1219326, 0.6674207, 1, 0, 0, 1, 1,
0.353406, -0.1124667, 3.246312, 1, 0, 0, 1, 1,
0.3569762, 1.202432, 0.3560888, 1, 0, 0, 1, 1,
0.3574891, -0.1276349, 0.7420916, 1, 0, 0, 1, 1,
0.3575099, -0.5899639, 3.059765, 1, 0, 0, 1, 1,
0.3655783, 0.3506166, 1.079807, 0, 0, 0, 1, 1,
0.3670393, -1.224114, 3.853238, 0, 0, 0, 1, 1,
0.3677346, 0.9237265, 0.09588153, 0, 0, 0, 1, 1,
0.3806162, 1.120738, -0.8223429, 0, 0, 0, 1, 1,
0.3812649, -0.01546204, 2.350853, 0, 0, 0, 1, 1,
0.3815186, -2.605231, 3.523775, 0, 0, 0, 1, 1,
0.3920312, -1.079593, 3.755594, 0, 0, 0, 1, 1,
0.3991743, -0.545231, 1.199541, 1, 1, 1, 1, 1,
0.4001904, 0.325637, 1.280296, 1, 1, 1, 1, 1,
0.4008968, -1.806485, 3.169579, 1, 1, 1, 1, 1,
0.401047, -0.7232278, 3.521248, 1, 1, 1, 1, 1,
0.4054731, 0.6936331, 1.49685, 1, 1, 1, 1, 1,
0.4061996, 1.707696, 1.002867, 1, 1, 1, 1, 1,
0.4067106, 0.3439451, 0.09123404, 1, 1, 1, 1, 1,
0.4140173, 1.210631, 1.941595, 1, 1, 1, 1, 1,
0.4155397, -0.1935635, 1.887968, 1, 1, 1, 1, 1,
0.4156055, 0.001442661, 1.267723, 1, 1, 1, 1, 1,
0.4158987, -0.918468, 3.530528, 1, 1, 1, 1, 1,
0.420441, -0.3745564, 3.917399, 1, 1, 1, 1, 1,
0.4205443, 1.406961, -0.5252591, 1, 1, 1, 1, 1,
0.4214118, 0.7604024, 0.5875955, 1, 1, 1, 1, 1,
0.4278125, -0.04480657, 2.908884, 1, 1, 1, 1, 1,
0.4278549, 3.111534, 0.3402833, 0, 0, 1, 1, 1,
0.4288763, -0.6875283, 3.884021, 1, 0, 0, 1, 1,
0.4328464, -0.3631578, 0.2040217, 1, 0, 0, 1, 1,
0.434225, -0.9737597, 3.229725, 1, 0, 0, 1, 1,
0.4386046, -0.5175323, 1.822423, 1, 0, 0, 1, 1,
0.4387945, -1.444681, 1.464098, 1, 0, 0, 1, 1,
0.444509, -0.8807926, 4.003039, 0, 0, 0, 1, 1,
0.4452309, -0.09302138, 1.597425, 0, 0, 0, 1, 1,
0.4467079, -0.6254075, 3.968573, 0, 0, 0, 1, 1,
0.44966, 0.1451524, 3.329298, 0, 0, 0, 1, 1,
0.4530616, -1.548463, 0.4249472, 0, 0, 0, 1, 1,
0.4565476, -0.8235738, 1.596343, 0, 0, 0, 1, 1,
0.4615928, 0.9694137, -0.6118661, 0, 0, 0, 1, 1,
0.4640322, 0.7241192, -1.277133, 1, 1, 1, 1, 1,
0.4708459, 0.9124641, 0.4816942, 1, 1, 1, 1, 1,
0.4738677, 0.4299033, 0.05405657, 1, 1, 1, 1, 1,
0.4746529, 1.804129, 0.344921, 1, 1, 1, 1, 1,
0.475935, -0.4919059, 3.767503, 1, 1, 1, 1, 1,
0.4761916, -0.02056891, 2.838774, 1, 1, 1, 1, 1,
0.480266, 0.2557447, 1.133006, 1, 1, 1, 1, 1,
0.4806954, 0.7046478, 2.337126, 1, 1, 1, 1, 1,
0.488067, 0.1513118, 0.7276627, 1, 1, 1, 1, 1,
0.4913919, 0.3106373, 1.924136, 1, 1, 1, 1, 1,
0.4914535, -0.5301961, 3.674991, 1, 1, 1, 1, 1,
0.4921291, -1.704407, 2.411392, 1, 1, 1, 1, 1,
0.4936024, 0.8568224, 1.254413, 1, 1, 1, 1, 1,
0.4960081, -1.303112, 3.287964, 1, 1, 1, 1, 1,
0.4973025, 0.355197, 2.118223, 1, 1, 1, 1, 1,
0.4976047, 1.216366, -0.7300351, 0, 0, 1, 1, 1,
0.5080239, -0.9490599, 3.151982, 1, 0, 0, 1, 1,
0.5083226, -0.1164639, 1.999703, 1, 0, 0, 1, 1,
0.5105988, -1.342205, 3.515618, 1, 0, 0, 1, 1,
0.5113447, 1.130546, 0.5111399, 1, 0, 0, 1, 1,
0.5121297, 0.9381735, 0.4684546, 1, 0, 0, 1, 1,
0.5131441, 0.3900257, 0.6994393, 0, 0, 0, 1, 1,
0.5169095, 2.458019, 0.6603627, 0, 0, 0, 1, 1,
0.5284135, -0.5583447, 1.362648, 0, 0, 0, 1, 1,
0.528956, 0.3131654, 1.358673, 0, 0, 0, 1, 1,
0.5307317, -0.6460896, 2.741412, 0, 0, 0, 1, 1,
0.5314188, 0.7902389, -0.9781254, 0, 0, 0, 1, 1,
0.5322931, 1.272878, 0.6400465, 0, 0, 0, 1, 1,
0.534956, -0.1514158, 2.507816, 1, 1, 1, 1, 1,
0.5416191, -0.069771, 2.064671, 1, 1, 1, 1, 1,
0.5417615, -1.364513, 2.176974, 1, 1, 1, 1, 1,
0.5417644, 0.6044608, 1.160644, 1, 1, 1, 1, 1,
0.5428604, 0.6719686, -2.006169, 1, 1, 1, 1, 1,
0.5445209, -0.9609808, 4.309649, 1, 1, 1, 1, 1,
0.5460973, -0.212955, 1.540568, 1, 1, 1, 1, 1,
0.5501511, -0.3657856, 0.4006254, 1, 1, 1, 1, 1,
0.5531814, -0.8191772, 2.517741, 1, 1, 1, 1, 1,
0.5549974, 0.9233646, 1.495788, 1, 1, 1, 1, 1,
0.5617293, 0.6525196, 0.8595923, 1, 1, 1, 1, 1,
0.5626261, 1.131055, 0.9545164, 1, 1, 1, 1, 1,
0.5630298, -0.429486, 2.297119, 1, 1, 1, 1, 1,
0.5637062, -0.2820655, 2.770824, 1, 1, 1, 1, 1,
0.5659806, 1.04999, 1.736726, 1, 1, 1, 1, 1,
0.5680229, -0.4370733, 2.218406, 0, 0, 1, 1, 1,
0.5730243, -0.949325, 0.9061186, 1, 0, 0, 1, 1,
0.574778, -0.755219, 4.036416, 1, 0, 0, 1, 1,
0.5776471, 0.1616965, 1.162776, 1, 0, 0, 1, 1,
0.5778952, -1.656621, 1.510955, 1, 0, 0, 1, 1,
0.5785794, -1.771557, 3.02776, 1, 0, 0, 1, 1,
0.5791021, -1.499123, 2.345503, 0, 0, 0, 1, 1,
0.5815281, 0.1599043, 1.330118, 0, 0, 0, 1, 1,
0.5849645, 1.105061, 0.2681355, 0, 0, 0, 1, 1,
0.5852863, 1.091496, 0.2736643, 0, 0, 0, 1, 1,
0.5916855, 0.6590514, 1.755533, 0, 0, 0, 1, 1,
0.5924093, 0.275541, 1.569164, 0, 0, 0, 1, 1,
0.596387, -1.778445, 2.572321, 0, 0, 0, 1, 1,
0.598919, 0.3107009, 1.536679, 1, 1, 1, 1, 1,
0.6006567, -0.4016734, 2.957309, 1, 1, 1, 1, 1,
0.6055491, -0.9883404, 2.8473, 1, 1, 1, 1, 1,
0.6098086, 0.1425807, 1.322628, 1, 1, 1, 1, 1,
0.610593, -0.9196759, 2.495749, 1, 1, 1, 1, 1,
0.6247271, -1.840927, 2.377399, 1, 1, 1, 1, 1,
0.6247484, 0.3278995, 0.8261604, 1, 1, 1, 1, 1,
0.6247652, 0.6081089, 0.05689793, 1, 1, 1, 1, 1,
0.6251246, -1.188656, 2.205943, 1, 1, 1, 1, 1,
0.6255448, -1.150986, 2.780294, 1, 1, 1, 1, 1,
0.6281289, 1.1523, 1.078149, 1, 1, 1, 1, 1,
0.6307209, -0.2407807, 1.102634, 1, 1, 1, 1, 1,
0.6317456, 1.087999, 0.4555943, 1, 1, 1, 1, 1,
0.6332151, -0.09073142, 2.996144, 1, 1, 1, 1, 1,
0.6350958, 0.6520915, 1.463284, 1, 1, 1, 1, 1,
0.6357844, 2.038835, -0.7878568, 0, 0, 1, 1, 1,
0.6364946, -0.5782726, 2.073884, 1, 0, 0, 1, 1,
0.639674, 0.4942074, 1.443049, 1, 0, 0, 1, 1,
0.6412077, 1.518689, 0.4835903, 1, 0, 0, 1, 1,
0.6431662, 0.5120762, 1.816124, 1, 0, 0, 1, 1,
0.6442054, 0.1882776, 2.083459, 1, 0, 0, 1, 1,
0.6453658, 0.8966891, 1.583537, 0, 0, 0, 1, 1,
0.6476883, 0.319926, 2.058354, 0, 0, 0, 1, 1,
0.6486101, -0.1355527, 1.530804, 0, 0, 0, 1, 1,
0.6486921, 1.109357, -0.8018098, 0, 0, 0, 1, 1,
0.657973, 1.651402, 0.1360397, 0, 0, 0, 1, 1,
0.6624153, -0.6144891, 2.805341, 0, 0, 0, 1, 1,
0.6661345, -0.7593184, 3.105564, 0, 0, 0, 1, 1,
0.6691223, 0.4846141, 2.052564, 1, 1, 1, 1, 1,
0.670072, -0.2550165, 0.2147757, 1, 1, 1, 1, 1,
0.6735471, -0.07853384, 1.443427, 1, 1, 1, 1, 1,
0.6759915, -0.5931916, 3.0917, 1, 1, 1, 1, 1,
0.6765236, -1.49338, 1.363381, 1, 1, 1, 1, 1,
0.6820896, 1.087932, -1.801631, 1, 1, 1, 1, 1,
0.6848215, -0.4299914, 4.015666, 1, 1, 1, 1, 1,
0.6859395, 1.421753, 0.2983311, 1, 1, 1, 1, 1,
0.6931253, 1.376587, 2.243796, 1, 1, 1, 1, 1,
0.6974558, -0.01717458, 1.453272, 1, 1, 1, 1, 1,
0.6977993, -0.05933172, 2.338575, 1, 1, 1, 1, 1,
0.7027012, 1.168763, 0.8949069, 1, 1, 1, 1, 1,
0.7075363, 1.618253, 1.216314, 1, 1, 1, 1, 1,
0.7138698, 0.6835263, -0.4991795, 1, 1, 1, 1, 1,
0.7161943, 0.3438245, 0.9245611, 1, 1, 1, 1, 1,
0.7165539, 0.6017743, 1.780135, 0, 0, 1, 1, 1,
0.7195829, 0.6135616, 2.220102, 1, 0, 0, 1, 1,
0.7200716, -1.122092, 1.74904, 1, 0, 0, 1, 1,
0.722868, -2.087708, 1.513237, 1, 0, 0, 1, 1,
0.7329505, -0.6857823, 1.10628, 1, 0, 0, 1, 1,
0.7339416, -1.347873, 2.378523, 1, 0, 0, 1, 1,
0.740352, -0.07754236, 0.9353441, 0, 0, 0, 1, 1,
0.7542246, -0.06259585, 1.298104, 0, 0, 0, 1, 1,
0.7576123, 0.4601029, -0.1405972, 0, 0, 0, 1, 1,
0.7597043, -0.6300287, 2.838485, 0, 0, 0, 1, 1,
0.7628794, -1.781262, 1.733389, 0, 0, 0, 1, 1,
0.7660128, 1.269611, 2.016344, 0, 0, 0, 1, 1,
0.7689822, 0.6938348, -0.2207112, 0, 0, 0, 1, 1,
0.778518, -0.7405865, 1.988295, 1, 1, 1, 1, 1,
0.7800912, -0.3554038, 3.437643, 1, 1, 1, 1, 1,
0.78677, 1.116645, 0.8847638, 1, 1, 1, 1, 1,
0.7964152, 1.165514, 1.538272, 1, 1, 1, 1, 1,
0.7975458, -0.35076, 3.99224, 1, 1, 1, 1, 1,
0.8039496, 0.003011111, 1.536278, 1, 1, 1, 1, 1,
0.8050881, 0.01215402, 1.950226, 1, 1, 1, 1, 1,
0.8128168, -0.6719323, 2.706316, 1, 1, 1, 1, 1,
0.8160691, -0.1284923, 1.880471, 1, 1, 1, 1, 1,
0.8184664, 0.5302902, 1.999346, 1, 1, 1, 1, 1,
0.8188388, -1.159698, 3.025266, 1, 1, 1, 1, 1,
0.8197981, -1.601539, 3.161518, 1, 1, 1, 1, 1,
0.8210682, 1.520122, 1.683132, 1, 1, 1, 1, 1,
0.8239335, -0.1766825, 1.74436, 1, 1, 1, 1, 1,
0.8309343, 0.2758749, 1.21113, 1, 1, 1, 1, 1,
0.8371099, -0.3261863, 2.047702, 0, 0, 1, 1, 1,
0.838587, 0.8555861, 2.057661, 1, 0, 0, 1, 1,
0.848949, 1.454742, 0.7590275, 1, 0, 0, 1, 1,
0.8515196, 1.130207, 1.506214, 1, 0, 0, 1, 1,
0.8522159, 1.063553, 1.614499, 1, 0, 0, 1, 1,
0.8569199, -0.2223755, 1.528044, 1, 0, 0, 1, 1,
0.8581309, 0.4618624, 1.850146, 0, 0, 0, 1, 1,
0.8584582, 0.2262862, 0.6792086, 0, 0, 0, 1, 1,
0.8614607, 0.7104399, -0.09615782, 0, 0, 0, 1, 1,
0.8623863, 0.07116941, 1.314946, 0, 0, 0, 1, 1,
0.8723162, -0.7459849, 2.853989, 0, 0, 0, 1, 1,
0.8728882, 1.264996, -0.1158078, 0, 0, 0, 1, 1,
0.8734362, -0.9267282, 5.626584, 0, 0, 0, 1, 1,
0.8891577, 0.348023, 3.138763, 1, 1, 1, 1, 1,
0.8903637, 0.2355078, 1.528464, 1, 1, 1, 1, 1,
0.8918744, 1.365231, -1.181619, 1, 1, 1, 1, 1,
0.9025851, -1.093262, 1.76589, 1, 1, 1, 1, 1,
0.9072359, 1.829642, -0.7349764, 1, 1, 1, 1, 1,
0.9117894, -0.5884112, 1.292026, 1, 1, 1, 1, 1,
0.9182889, -0.3340412, 3.834989, 1, 1, 1, 1, 1,
0.9279452, -0.2601092, 3.167146, 1, 1, 1, 1, 1,
0.9282132, 0.03319662, 1.031092, 1, 1, 1, 1, 1,
0.9303024, -1.382727, 3.106938, 1, 1, 1, 1, 1,
0.93308, 0.9499995, 1.207471, 1, 1, 1, 1, 1,
0.9524058, -0.7129034, 3.328625, 1, 1, 1, 1, 1,
0.9544948, -0.008877375, 1.997135, 1, 1, 1, 1, 1,
0.9562434, 2.514091, 2.507817, 1, 1, 1, 1, 1,
0.957233, 0.2638726, 1.066174, 1, 1, 1, 1, 1,
0.959905, -0.5973287, 3.809059, 0, 0, 1, 1, 1,
0.9735985, 0.0823134, 1.77749, 1, 0, 0, 1, 1,
0.9794684, 0.5734594, 0.5580835, 1, 0, 0, 1, 1,
0.983255, 0.09930055, 2.59579, 1, 0, 0, 1, 1,
0.9847963, 0.4777701, -0.3835528, 1, 0, 0, 1, 1,
0.9893244, 0.1229924, 0.9903025, 1, 0, 0, 1, 1,
0.9908342, 0.1430943, 0.6763434, 0, 0, 0, 1, 1,
0.9936532, -0.5303853, 1.679155, 0, 0, 0, 1, 1,
0.9988584, -1.38425, 1.463153, 0, 0, 0, 1, 1,
1.005506, -0.3763913, 2.67693, 0, 0, 0, 1, 1,
1.009278, 0.3717595, 1.376041, 0, 0, 0, 1, 1,
1.019257, -0.8317398, 2.107951, 0, 0, 0, 1, 1,
1.025521, 0.4953935, -0.4992599, 0, 0, 0, 1, 1,
1.040416, 1.463765, 0.8744093, 1, 1, 1, 1, 1,
1.04071, 0.551495, 0.362256, 1, 1, 1, 1, 1,
1.053108, 0.2057985, 1.024997, 1, 1, 1, 1, 1,
1.056478, 0.3715555, 1.991589, 1, 1, 1, 1, 1,
1.056679, -0.5752277, 1.064311, 1, 1, 1, 1, 1,
1.061461, 0.5157451, 1.094795, 1, 1, 1, 1, 1,
1.076285, -1.199357, 3.544923, 1, 1, 1, 1, 1,
1.081884, -0.4329487, 0.1925791, 1, 1, 1, 1, 1,
1.082339, -1.025789, 2.780788, 1, 1, 1, 1, 1,
1.085972, -0.9910778, 3.862316, 1, 1, 1, 1, 1,
1.098183, -1.29801, 2.070575, 1, 1, 1, 1, 1,
1.099971, -0.7400323, 2.56088, 1, 1, 1, 1, 1,
1.108721, 0.9530633, 1.612289, 1, 1, 1, 1, 1,
1.113735, -0.7892453, 2.313132, 1, 1, 1, 1, 1,
1.114879, 0.004476588, 1.50829, 1, 1, 1, 1, 1,
1.122929, 0.3260784, 0.5103142, 0, 0, 1, 1, 1,
1.123521, 0.9411688, -1.690426, 1, 0, 0, 1, 1,
1.134558, -0.32725, 0.4858244, 1, 0, 0, 1, 1,
1.138855, -1.240198, 1.835965, 1, 0, 0, 1, 1,
1.1414, -1.776587, 0.8868343, 1, 0, 0, 1, 1,
1.152345, -0.02939075, 1.798892, 1, 0, 0, 1, 1,
1.152821, 1.393484, -0.2396408, 0, 0, 0, 1, 1,
1.16741, 0.917042, 0.2445749, 0, 0, 0, 1, 1,
1.168531, 1.20427, 0.05998847, 0, 0, 0, 1, 1,
1.17197, 0.8520022, 2.817798, 0, 0, 0, 1, 1,
1.174423, -0.2347171, 1.39551, 0, 0, 0, 1, 1,
1.17495, 0.73408, 0.6136864, 0, 0, 0, 1, 1,
1.178191, 0.05988428, 1.608973, 0, 0, 0, 1, 1,
1.198271, 1.098915, 0.6170703, 1, 1, 1, 1, 1,
1.201561, -0.9625826, 1.915487, 1, 1, 1, 1, 1,
1.211714, 2.107857, 0.1037678, 1, 1, 1, 1, 1,
1.227271, -0.1443538, 2.054005, 1, 1, 1, 1, 1,
1.227701, -0.7513043, 2.154799, 1, 1, 1, 1, 1,
1.230858, 0.9828441, -0.3800634, 1, 1, 1, 1, 1,
1.234348, -0.9244067, 3.698665, 1, 1, 1, 1, 1,
1.235428, -1.147844, 0.9948358, 1, 1, 1, 1, 1,
1.236774, -1.263839, 1.934314, 1, 1, 1, 1, 1,
1.240266, -0.5900778, 0.404652, 1, 1, 1, 1, 1,
1.242993, 0.7356502, 2.613875, 1, 1, 1, 1, 1,
1.245376, 0.4758133, 1.929353, 1, 1, 1, 1, 1,
1.260342, 0.4732831, 2.727938, 1, 1, 1, 1, 1,
1.266085, 1.517866, 0.8054522, 1, 1, 1, 1, 1,
1.274063, -0.1970235, 0.9618503, 1, 1, 1, 1, 1,
1.283971, 0.002945516, 2.537466, 0, 0, 1, 1, 1,
1.291365, -0.530212, 0.7858877, 1, 0, 0, 1, 1,
1.295052, -0.8651112, -0.6123515, 1, 0, 0, 1, 1,
1.297457, 0.8716943, -1.000203, 1, 0, 0, 1, 1,
1.298623, 1.63698, -0.8736389, 1, 0, 0, 1, 1,
1.299213, -0.7022017, -0.003240583, 1, 0, 0, 1, 1,
1.302944, -1.21406, 0.5131353, 0, 0, 0, 1, 1,
1.308405, -0.5017761, 2.275568, 0, 0, 0, 1, 1,
1.312797, -0.7849049, 0.7589029, 0, 0, 0, 1, 1,
1.315298, -0.1890336, 0.6092824, 0, 0, 0, 1, 1,
1.321499, -1.117374, 0.1996984, 0, 0, 0, 1, 1,
1.331378, -0.02310408, 0.5144368, 0, 0, 0, 1, 1,
1.333528, -1.363201, 2.860244, 0, 0, 0, 1, 1,
1.349311, -0.6937788, 0.9529709, 1, 1, 1, 1, 1,
1.359705, -0.4549645, -0.6044762, 1, 1, 1, 1, 1,
1.364121, 1.607064, 1.03499, 1, 1, 1, 1, 1,
1.373408, -2.111299, 0.5060268, 1, 1, 1, 1, 1,
1.393893, -0.1292027, 1.042977, 1, 1, 1, 1, 1,
1.419797, -0.4883559, 2.813374, 1, 1, 1, 1, 1,
1.421613, 0.2215515, 2.409775, 1, 1, 1, 1, 1,
1.437313, 0.1364754, 3.242898, 1, 1, 1, 1, 1,
1.439149, -0.9888122, 1.429142, 1, 1, 1, 1, 1,
1.447551, -1.469591, 2.444285, 1, 1, 1, 1, 1,
1.449688, 1.159395, 0.6675448, 1, 1, 1, 1, 1,
1.453514, -1.316338, 2.375598, 1, 1, 1, 1, 1,
1.457094, -1.030363, 3.026088, 1, 1, 1, 1, 1,
1.461866, 0.7339209, 0.9343377, 1, 1, 1, 1, 1,
1.467842, -0.8651043, 4.157939, 1, 1, 1, 1, 1,
1.476269, 1.269913, 0.0881339, 0, 0, 1, 1, 1,
1.477297, 0.7437676, 2.674508, 1, 0, 0, 1, 1,
1.479359, 0.8443017, -0.9732231, 1, 0, 0, 1, 1,
1.487077, 0.6446894, 0.7919494, 1, 0, 0, 1, 1,
1.49771, -0.7609897, 2.302103, 1, 0, 0, 1, 1,
1.510777, 0.1469437, 0.8388461, 1, 0, 0, 1, 1,
1.513318, -0.4119175, 1.076336, 0, 0, 0, 1, 1,
1.516521, 1.419487, -1.247501, 0, 0, 0, 1, 1,
1.52413, 0.3044174, 2.840023, 0, 0, 0, 1, 1,
1.545278, 0.1628759, 0.4918107, 0, 0, 0, 1, 1,
1.571164, 1.213294, 0.3635845, 0, 0, 0, 1, 1,
1.573198, -0.196363, 2.669822, 0, 0, 0, 1, 1,
1.573225, 0.8201532, 1.440381, 0, 0, 0, 1, 1,
1.579848, -0.05654201, 1.568445, 1, 1, 1, 1, 1,
1.597625, -0.8484772, 2.618472, 1, 1, 1, 1, 1,
1.615842, 0.1689282, 2.501006, 1, 1, 1, 1, 1,
1.617095, -0.03432972, 0.6534094, 1, 1, 1, 1, 1,
1.629777, -0.3483295, 3.062493, 1, 1, 1, 1, 1,
1.63789, 1.056169, 1.256862, 1, 1, 1, 1, 1,
1.663401, -0.1546874, 0.7029705, 1, 1, 1, 1, 1,
1.664016, 0.07504016, 1.667242, 1, 1, 1, 1, 1,
1.67488, 1.432112, 0.3882467, 1, 1, 1, 1, 1,
1.687724, 0.6448956, 1.634358, 1, 1, 1, 1, 1,
1.69085, -0.3044656, 1.985158, 1, 1, 1, 1, 1,
1.695304, -1.187265, 1.980793, 1, 1, 1, 1, 1,
1.704907, -0.3350859, 1.991438, 1, 1, 1, 1, 1,
1.709433, -1.397852, 1.831271, 1, 1, 1, 1, 1,
1.725009, 0.8834901, 1.012042, 1, 1, 1, 1, 1,
1.736721, -1.707024, 3.517376, 0, 0, 1, 1, 1,
1.736976, 0.2156956, 1.772131, 1, 0, 0, 1, 1,
1.754444, 0.788475, 0.9528049, 1, 0, 0, 1, 1,
1.775569, 1.017771, 1.683065, 1, 0, 0, 1, 1,
1.777822, -0.2596097, 0.9617541, 1, 0, 0, 1, 1,
1.786711, 1.208577, 0.7571625, 1, 0, 0, 1, 1,
1.817718, 1.576116, 0.2576514, 0, 0, 0, 1, 1,
1.817835, 2.170152, 0.3275602, 0, 0, 0, 1, 1,
1.829315, -0.616263, 2.792201, 0, 0, 0, 1, 1,
1.842909, -1.879938, 0.4419752, 0, 0, 0, 1, 1,
1.845662, -0.3682761, 1.616736, 0, 0, 0, 1, 1,
1.859093, 0.2935375, 1.640751, 0, 0, 0, 1, 1,
1.875983, -0.9541962, 1.77365, 0, 0, 0, 1, 1,
1.878654, 0.3751039, 0.9726582, 1, 1, 1, 1, 1,
1.912982, 0.6146666, 1.819532, 1, 1, 1, 1, 1,
1.939522, -1.54993, 3.904068, 1, 1, 1, 1, 1,
1.952802, 0.5522964, 0.7658368, 1, 1, 1, 1, 1,
1.958695, 0.2053501, 2.196939, 1, 1, 1, 1, 1,
1.988096, 1.640649, 0.760304, 1, 1, 1, 1, 1,
1.996998, -1.653686, 3.123202, 1, 1, 1, 1, 1,
2.015058, 0.2444947, 0.618121, 1, 1, 1, 1, 1,
2.023769, -0.01277712, 2.046786, 1, 1, 1, 1, 1,
2.025201, -0.4581975, 2.325769, 1, 1, 1, 1, 1,
2.029935, 0.5813119, 1.237589, 1, 1, 1, 1, 1,
2.035584, -0.09562495, 0.6294421, 1, 1, 1, 1, 1,
2.06093, 1.375476, 1.355096, 1, 1, 1, 1, 1,
2.120827, -0.05498146, 1.671505, 1, 1, 1, 1, 1,
2.158702, 0.009809244, 0.7157844, 1, 1, 1, 1, 1,
2.177841, -0.1537585, 3.730879, 0, 0, 1, 1, 1,
2.198354, 0.9613779, 1.333597, 1, 0, 0, 1, 1,
2.200937, 0.1663734, -0.7924505, 1, 0, 0, 1, 1,
2.212339, 0.03976193, 1.395015, 1, 0, 0, 1, 1,
2.229109, 1.415142, 1.036658, 1, 0, 0, 1, 1,
2.235403, 0.08036539, 2.188998, 1, 0, 0, 1, 1,
2.313228, -1.038995, 3.471185, 0, 0, 0, 1, 1,
2.364802, 0.9650115, 0.6320365, 0, 0, 0, 1, 1,
2.508588, 1.163145, 2.282472, 0, 0, 0, 1, 1,
2.530435, 1.122678, 0.5134227, 0, 0, 0, 1, 1,
2.556611, -1.710683, 2.321289, 0, 0, 0, 1, 1,
2.593488, 0.1888516, 1.33633, 0, 0, 0, 1, 1,
2.594041, 0.1698043, 0.8255759, 0, 0, 0, 1, 1,
2.627756, -0.08909075, 1.641074, 1, 1, 1, 1, 1,
2.636592, -0.6933804, 0.1249518, 1, 1, 1, 1, 1,
2.705243, -0.1464477, -1.243939, 1, 1, 1, 1, 1,
2.827395, -1.643334, 1.706979, 1, 1, 1, 1, 1,
2.912508, 0.9524562, 0.5208871, 1, 1, 1, 1, 1,
3.089957, -0.6855796, 3.345514, 1, 1, 1, 1, 1,
3.976237, -0.2039486, 1.30251, 1, 1, 1, 1, 1
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
var radius = 9.953967;
var distance = 34.96289;
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
mvMatrix.translate( -0.4592929, -0.08707201, 0.1029346 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.96289);
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
