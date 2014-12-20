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
-3.675327, -1.395822, -0.7909606, 1, 0, 0, 1,
-3.240114, -0.2471763, -2.41652, 1, 0.007843138, 0, 1,
-3.086925, -0.2615886, 0.645158, 1, 0.01176471, 0, 1,
-3.02295, 0.2772311, -0.9820891, 1, 0.01960784, 0, 1,
-2.882648, -1.212077, -1.721904, 1, 0.02352941, 0, 1,
-2.845781, -1.063349, -1.395577, 1, 0.03137255, 0, 1,
-2.829515, 0.6762964, -2.530316, 1, 0.03529412, 0, 1,
-2.654237, -0.7406772, -1.316097, 1, 0.04313726, 0, 1,
-2.636881, -0.2032855, -2.147773, 1, 0.04705882, 0, 1,
-2.578108, -0.6302305, -3.070984, 1, 0.05490196, 0, 1,
-2.460585, 1.22427, -0.7452214, 1, 0.05882353, 0, 1,
-2.457775, -0.4495258, -0.8622022, 1, 0.06666667, 0, 1,
-2.388809, 1.299638, -0.2836865, 1, 0.07058824, 0, 1,
-2.371169, -1.525793, -1.531949, 1, 0.07843138, 0, 1,
-2.281656, -0.5935784, -2.470458, 1, 0.08235294, 0, 1,
-2.249344, -0.1507398, -1.038274, 1, 0.09019608, 0, 1,
-2.231047, -1.867952, -0.9540299, 1, 0.09411765, 0, 1,
-2.182799, 1.170516, -0.9575413, 1, 0.1019608, 0, 1,
-2.180642, 0.8956068, -2.248016, 1, 0.1098039, 0, 1,
-2.173129, -0.4460154, -1.56632, 1, 0.1137255, 0, 1,
-2.151127, 0.5626671, -2.044837, 1, 0.1215686, 0, 1,
-2.144121, 0.1248964, -0.813683, 1, 0.1254902, 0, 1,
-2.039271, -0.3369955, -2.358483, 1, 0.1333333, 0, 1,
-2.006588, 0.8915702, -0.8797948, 1, 0.1372549, 0, 1,
-2.000656, 0.1311665, -1.567045, 1, 0.145098, 0, 1,
-1.990875, -0.9040525, -2.335696, 1, 0.1490196, 0, 1,
-1.984158, 1.430361, -1.2079, 1, 0.1568628, 0, 1,
-1.982957, -0.774696, -1.995777, 1, 0.1607843, 0, 1,
-1.975392, -0.1714668, -1.631022, 1, 0.1686275, 0, 1,
-1.975327, 0.2652859, -1.585433, 1, 0.172549, 0, 1,
-1.95276, -0.3963374, -3.06278, 1, 0.1803922, 0, 1,
-1.949452, 1.366289, -0.8784252, 1, 0.1843137, 0, 1,
-1.93502, 1.145308, -1.78561, 1, 0.1921569, 0, 1,
-1.880356, -0.3960391, -0.8902053, 1, 0.1960784, 0, 1,
-1.877069, 0.9775589, -0.586417, 1, 0.2039216, 0, 1,
-1.868998, -1.52232, -2.751388, 1, 0.2117647, 0, 1,
-1.861901, 0.01281232, -1.579047, 1, 0.2156863, 0, 1,
-1.854549, -1.734158, -2.79163, 1, 0.2235294, 0, 1,
-1.843508, 0.1489429, -1.683982, 1, 0.227451, 0, 1,
-1.829016, -0.8950977, -1.701604, 1, 0.2352941, 0, 1,
-1.821489, 0.3986825, -2.542918, 1, 0.2392157, 0, 1,
-1.811773, -1.475569, -2.524642, 1, 0.2470588, 0, 1,
-1.808911, 0.5695682, -0.2811761, 1, 0.2509804, 0, 1,
-1.793477, -1.525647, -0.4493852, 1, 0.2588235, 0, 1,
-1.787008, -1.898662, -2.283558, 1, 0.2627451, 0, 1,
-1.783987, -1.690329, -2.679302, 1, 0.2705882, 0, 1,
-1.778566, 0.7283531, -1.040101, 1, 0.2745098, 0, 1,
-1.761462, -0.77273, -0.6603253, 1, 0.282353, 0, 1,
-1.756179, -0.5738282, -2.216094, 1, 0.2862745, 0, 1,
-1.747912, -1.206607, -3.015351, 1, 0.2941177, 0, 1,
-1.740498, -0.2571787, -1.211541, 1, 0.3019608, 0, 1,
-1.712576, -0.6975627, -1.788224, 1, 0.3058824, 0, 1,
-1.70273, -0.902588, -2.911685, 1, 0.3137255, 0, 1,
-1.696214, 0.4203108, -2.699059, 1, 0.3176471, 0, 1,
-1.68631, 0.2553066, -0.6565097, 1, 0.3254902, 0, 1,
-1.680686, -0.211128, -2.082657, 1, 0.3294118, 0, 1,
-1.679587, -0.3241464, -2.279208, 1, 0.3372549, 0, 1,
-1.678552, -0.5936841, -4.280747, 1, 0.3411765, 0, 1,
-1.670189, -1.351452, -1.534607, 1, 0.3490196, 0, 1,
-1.652178, 0.1987128, -0.8251166, 1, 0.3529412, 0, 1,
-1.64147, -0.02015019, -2.163429, 1, 0.3607843, 0, 1,
-1.634092, 0.7883828, -1.833561, 1, 0.3647059, 0, 1,
-1.632938, 0.1227491, -1.681951, 1, 0.372549, 0, 1,
-1.615389, -0.5132481, -2.079945, 1, 0.3764706, 0, 1,
-1.613511, -2.059478, -2.069594, 1, 0.3843137, 0, 1,
-1.609753, 0.9096003, -1.457659, 1, 0.3882353, 0, 1,
-1.600159, 0.2847411, -1.660987, 1, 0.3960784, 0, 1,
-1.595199, 0.6375944, -1.708708, 1, 0.4039216, 0, 1,
-1.590433, 0.1798879, -1.923077, 1, 0.4078431, 0, 1,
-1.588273, 0.2565905, -1.740551, 1, 0.4156863, 0, 1,
-1.586307, -1.394388, -1.869075, 1, 0.4196078, 0, 1,
-1.583601, 0.7888067, -1.938165, 1, 0.427451, 0, 1,
-1.566142, 0.3872662, -3.142417, 1, 0.4313726, 0, 1,
-1.556126, 0.1781854, -1.484254, 1, 0.4392157, 0, 1,
-1.536758, -0.6392776, -0.410377, 1, 0.4431373, 0, 1,
-1.535412, 1.180508, -1.689062, 1, 0.4509804, 0, 1,
-1.528228, -0.9773692, -1.625349, 1, 0.454902, 0, 1,
-1.521836, 0.7286736, 0.0391278, 1, 0.4627451, 0, 1,
-1.517605, 0.6154889, -1.105571, 1, 0.4666667, 0, 1,
-1.497525, -1.106926, -1.598348, 1, 0.4745098, 0, 1,
-1.493948, 1.306429, -2.64997, 1, 0.4784314, 0, 1,
-1.483187, 2.249605, 0.5775293, 1, 0.4862745, 0, 1,
-1.48271, 0.3835548, -0.9705433, 1, 0.4901961, 0, 1,
-1.476265, 0.4727381, -1.192473, 1, 0.4980392, 0, 1,
-1.463822, -0.7918343, -1.425482, 1, 0.5058824, 0, 1,
-1.452371, 1.00273, 0.003402384, 1, 0.509804, 0, 1,
-1.44814, -1.395353, -2.560969, 1, 0.5176471, 0, 1,
-1.447573, -0.3458922, -2.401364, 1, 0.5215687, 0, 1,
-1.43073, -0.355448, -2.502249, 1, 0.5294118, 0, 1,
-1.427741, 0.912922, 0.5630496, 1, 0.5333334, 0, 1,
-1.424845, 1.165788, -1.574146, 1, 0.5411765, 0, 1,
-1.41609, 1.40076, -0.5417004, 1, 0.5450981, 0, 1,
-1.414001, -0.6400729, -2.102283, 1, 0.5529412, 0, 1,
-1.408318, 1.174352, -0.3856686, 1, 0.5568628, 0, 1,
-1.405823, -0.3642725, -3.268593, 1, 0.5647059, 0, 1,
-1.39801, -0.8927541, -1.894027, 1, 0.5686275, 0, 1,
-1.392191, -0.4145099, -1.770909, 1, 0.5764706, 0, 1,
-1.390497, -0.3594505, -1.174082, 1, 0.5803922, 0, 1,
-1.389645, 0.937461, -0.3961366, 1, 0.5882353, 0, 1,
-1.386396, -0.7841958, -3.519007, 1, 0.5921569, 0, 1,
-1.373828, -0.2201105, -1.29284, 1, 0.6, 0, 1,
-1.373198, -0.4175642, -2.969636, 1, 0.6078432, 0, 1,
-1.370952, -1.322124, -2.734551, 1, 0.6117647, 0, 1,
-1.366073, 0.1395799, -1.950337, 1, 0.6196079, 0, 1,
-1.343197, 0.5401488, 0.0280384, 1, 0.6235294, 0, 1,
-1.328603, -1.315482, -0.3420663, 1, 0.6313726, 0, 1,
-1.327644, 0.1501961, -0.8835237, 1, 0.6352941, 0, 1,
-1.320795, 0.4196622, 0.5224898, 1, 0.6431373, 0, 1,
-1.320603, 1.443155, -1.001782, 1, 0.6470588, 0, 1,
-1.314128, -0.5240461, -2.013202, 1, 0.654902, 0, 1,
-1.312946, 0.1772432, -1.8917, 1, 0.6588235, 0, 1,
-1.302733, 0.2431593, -1.370762, 1, 0.6666667, 0, 1,
-1.302732, -0.04348881, -3.121835, 1, 0.6705883, 0, 1,
-1.298746, 0.3441011, -1.617952, 1, 0.6784314, 0, 1,
-1.289344, 1.804913, 1.591995, 1, 0.682353, 0, 1,
-1.285274, 0.4679343, -0.2536447, 1, 0.6901961, 0, 1,
-1.284502, 0.8564066, -0.7636354, 1, 0.6941177, 0, 1,
-1.280676, -0.5013997, -3.268704, 1, 0.7019608, 0, 1,
-1.275573, -1.268542, -1.844366, 1, 0.7098039, 0, 1,
-1.270615, 0.01060624, -0.8298776, 1, 0.7137255, 0, 1,
-1.267456, 0.5119452, -1.208878, 1, 0.7215686, 0, 1,
-1.266709, -0.3619387, -1.26429, 1, 0.7254902, 0, 1,
-1.264825, 0.2892655, -2.260477, 1, 0.7333333, 0, 1,
-1.253457, 0.597312, -0.9312383, 1, 0.7372549, 0, 1,
-1.253035, -0.1403077, -0.3561724, 1, 0.7450981, 0, 1,
-1.251997, -0.1297, -1.34966, 1, 0.7490196, 0, 1,
-1.249741, -0.900412, -2.410399, 1, 0.7568628, 0, 1,
-1.247155, 2.013431, 0.4233968, 1, 0.7607843, 0, 1,
-1.244635, 0.6247644, -2.013508, 1, 0.7686275, 0, 1,
-1.244604, -1.139535, -1.18145, 1, 0.772549, 0, 1,
-1.23713, 0.2510203, -1.526732, 1, 0.7803922, 0, 1,
-1.236923, 0.7427934, -2.480756, 1, 0.7843137, 0, 1,
-1.229916, 0.822358, 0.06960643, 1, 0.7921569, 0, 1,
-1.229031, 0.8639139, -2.999892, 1, 0.7960784, 0, 1,
-1.227539, -0.6320807, -3.068406, 1, 0.8039216, 0, 1,
-1.220263, 1.177292, -1.188095, 1, 0.8117647, 0, 1,
-1.219924, -0.8915368, -3.121045, 1, 0.8156863, 0, 1,
-1.211011, 1.585415, -0.1835535, 1, 0.8235294, 0, 1,
-1.204026, -0.08830978, -0.7363371, 1, 0.827451, 0, 1,
-1.203228, -0.04521281, -3.409986, 1, 0.8352941, 0, 1,
-1.1949, 0.1993647, -2.77502, 1, 0.8392157, 0, 1,
-1.192734, 1.297338, 0.3496137, 1, 0.8470588, 0, 1,
-1.184989, -0.6769841, -1.151741, 1, 0.8509804, 0, 1,
-1.171467, 0.1385815, -1.89758, 1, 0.8588235, 0, 1,
-1.16793, -0.5549827, -0.2182703, 1, 0.8627451, 0, 1,
-1.16406, -2.976187, -2.354147, 1, 0.8705882, 0, 1,
-1.155883, 0.4042396, -1.854837, 1, 0.8745098, 0, 1,
-1.154585, 1.022123, -0.03818325, 1, 0.8823529, 0, 1,
-1.138811, -0.9474064, -1.479101, 1, 0.8862745, 0, 1,
-1.137383, -0.584985, -1.769346, 1, 0.8941177, 0, 1,
-1.136002, 0.418443, -1.603249, 1, 0.8980392, 0, 1,
-1.13132, -0.988339, -1.592535, 1, 0.9058824, 0, 1,
-1.129146, 0.1170683, -2.15468, 1, 0.9137255, 0, 1,
-1.122371, 0.3057292, 0.1192822, 1, 0.9176471, 0, 1,
-1.122089, 0.5463764, -2.57005, 1, 0.9254902, 0, 1,
-1.116652, -0.139571, -0.1779517, 1, 0.9294118, 0, 1,
-1.114907, 0.9406424, -1.87701, 1, 0.9372549, 0, 1,
-1.114873, 2.039829, 2.175304, 1, 0.9411765, 0, 1,
-1.112182, 0.580934, -0.2353037, 1, 0.9490196, 0, 1,
-1.111205, -0.2281263, -3.108059, 1, 0.9529412, 0, 1,
-1.110542, 0.8092285, -1.221749, 1, 0.9607843, 0, 1,
-1.108227, -0.2646826, -2.026363, 1, 0.9647059, 0, 1,
-1.102222, -1.10453, -3.144159, 1, 0.972549, 0, 1,
-1.099046, -0.05614069, -1.262959, 1, 0.9764706, 0, 1,
-1.094186, 1.032963, -0.8505575, 1, 0.9843137, 0, 1,
-1.088449, 0.9952558, 2.167897, 1, 0.9882353, 0, 1,
-1.082615, -0.4262294, -3.704169, 1, 0.9960784, 0, 1,
-1.081344, 2.253065, -0.9893832, 0.9960784, 1, 0, 1,
-1.066977, -2.024359, -1.557893, 0.9921569, 1, 0, 1,
-1.062274, -0.294774, -2.912884, 0.9843137, 1, 0, 1,
-1.05281, -0.04276232, -3.32137, 0.9803922, 1, 0, 1,
-1.051646, -0.9557835, -2.347333, 0.972549, 1, 0, 1,
-1.051339, -0.6792583, -3.25863, 0.9686275, 1, 0, 1,
-1.045284, -0.50497, -1.383509, 0.9607843, 1, 0, 1,
-1.044745, 0.2234437, 0.05649067, 0.9568627, 1, 0, 1,
-1.044654, 0.09511343, -1.989401, 0.9490196, 1, 0, 1,
-1.040123, 0.6154473, -1.647112, 0.945098, 1, 0, 1,
-1.028473, -0.6981763, -4.453893, 0.9372549, 1, 0, 1,
-1.028269, -0.2422601, -2.282809, 0.9333333, 1, 0, 1,
-1.022083, -0.05611213, -2.465434, 0.9254902, 1, 0, 1,
-1.019661, 0.2621054, -1.323294, 0.9215686, 1, 0, 1,
-1.012277, -0.8533232, -1.661036, 0.9137255, 1, 0, 1,
-1.011591, -0.1260065, -0.1146653, 0.9098039, 1, 0, 1,
-1.011524, -0.06055299, -0.7712883, 0.9019608, 1, 0, 1,
-1.0078, -0.5629802, -2.607713, 0.8941177, 1, 0, 1,
-0.9973946, -0.4352531, -2.927617, 0.8901961, 1, 0, 1,
-0.9943656, 1.554041, -2.385638, 0.8823529, 1, 0, 1,
-0.9853155, -1.879723, -1.255774, 0.8784314, 1, 0, 1,
-0.9842075, 0.3248883, -1.002911, 0.8705882, 1, 0, 1,
-0.9768093, -1.671324, -2.771523, 0.8666667, 1, 0, 1,
-0.9640337, -0.6854965, -2.228724, 0.8588235, 1, 0, 1,
-0.9631663, -0.04646056, -2.030644, 0.854902, 1, 0, 1,
-0.9624868, 0.6826758, -2.694062, 0.8470588, 1, 0, 1,
-0.9614937, 0.9435408, -0.2284349, 0.8431373, 1, 0, 1,
-0.9596334, -2.486208, -3.955989, 0.8352941, 1, 0, 1,
-0.9588627, -0.1884422, -2.091994, 0.8313726, 1, 0, 1,
-0.9565215, -0.0420507, -0.2676176, 0.8235294, 1, 0, 1,
-0.9547344, -0.9360937, -2.802732, 0.8196079, 1, 0, 1,
-0.9545411, 1.303305, -0.9468442, 0.8117647, 1, 0, 1,
-0.9535514, 0.1741698, -0.9547373, 0.8078431, 1, 0, 1,
-0.9511275, 1.3282, 0.7182027, 0.8, 1, 0, 1,
-0.9502147, -0.7451653, -1.636215, 0.7921569, 1, 0, 1,
-0.9493868, -0.2601236, -1.203554, 0.7882353, 1, 0, 1,
-0.948525, -1.511839, -2.027063, 0.7803922, 1, 0, 1,
-0.9477764, -0.4551178, -1.985681, 0.7764706, 1, 0, 1,
-0.9462742, -0.7010694, -3.032104, 0.7686275, 1, 0, 1,
-0.9455687, -0.6986399, -2.471135, 0.7647059, 1, 0, 1,
-0.9409248, 1.011061, 0.7895536, 0.7568628, 1, 0, 1,
-0.9394256, 0.05919947, -2.061749, 0.7529412, 1, 0, 1,
-0.9360232, -0.9106541, -4.496719, 0.7450981, 1, 0, 1,
-0.9329599, 0.08049688, -1.817602, 0.7411765, 1, 0, 1,
-0.9309522, -1.214662, -2.088133, 0.7333333, 1, 0, 1,
-0.9235312, -0.5976589, -1.672809, 0.7294118, 1, 0, 1,
-0.9088559, -0.8402743, -2.153959, 0.7215686, 1, 0, 1,
-0.9016214, 1.01032, -1.191052, 0.7176471, 1, 0, 1,
-0.9010513, 0.4866948, -1.721024, 0.7098039, 1, 0, 1,
-0.8991771, -1.695923, -1.073216, 0.7058824, 1, 0, 1,
-0.8929202, 0.4471708, -1.835994, 0.6980392, 1, 0, 1,
-0.8922146, -0.8494506, -2.87978, 0.6901961, 1, 0, 1,
-0.8881477, 1.104303, -0.8869422, 0.6862745, 1, 0, 1,
-0.8879932, 1.632398, -1.024439, 0.6784314, 1, 0, 1,
-0.8852364, -0.2292958, -1.689333, 0.6745098, 1, 0, 1,
-0.8844634, 1.707716, 0.3476703, 0.6666667, 1, 0, 1,
-0.8799059, 1.582779, 0.8052368, 0.6627451, 1, 0, 1,
-0.8776745, -1.005713, -3.598694, 0.654902, 1, 0, 1,
-0.8771245, -0.1034508, -1.530297, 0.6509804, 1, 0, 1,
-0.8737686, -0.2831935, -2.574658, 0.6431373, 1, 0, 1,
-0.8717802, -0.07611987, -1.83272, 0.6392157, 1, 0, 1,
-0.8648588, 1.025511, -0.5390597, 0.6313726, 1, 0, 1,
-0.863774, -0.4859092, -1.565977, 0.627451, 1, 0, 1,
-0.8637529, 0.9601662, -2.095806, 0.6196079, 1, 0, 1,
-0.8615509, -0.8130165, -0.9783984, 0.6156863, 1, 0, 1,
-0.8595428, -0.2016875, -2.358337, 0.6078432, 1, 0, 1,
-0.8582903, 1.135543, -0.7118551, 0.6039216, 1, 0, 1,
-0.8425849, 0.4553661, -1.375349, 0.5960785, 1, 0, 1,
-0.8420768, 0.1611564, -4.199502, 0.5882353, 1, 0, 1,
-0.839758, -0.5574263, -2.556679, 0.5843138, 1, 0, 1,
-0.8377907, -0.7093524, -1.175769, 0.5764706, 1, 0, 1,
-0.8375723, -0.1470461, -4.476968, 0.572549, 1, 0, 1,
-0.836942, 0.2627207, -1.148176, 0.5647059, 1, 0, 1,
-0.8351103, -0.008736077, 0.6317514, 0.5607843, 1, 0, 1,
-0.8267183, -0.9042864, -1.981227, 0.5529412, 1, 0, 1,
-0.8250139, -1.152339, -2.2838, 0.5490196, 1, 0, 1,
-0.8230724, 0.1294956, -2.192332, 0.5411765, 1, 0, 1,
-0.8183483, 0.1967382, -1.72167, 0.5372549, 1, 0, 1,
-0.8154317, -0.9824784, -3.477133, 0.5294118, 1, 0, 1,
-0.8042282, 0.7492346, -2.940844, 0.5254902, 1, 0, 1,
-0.8041993, -1.366276, -1.61976, 0.5176471, 1, 0, 1,
-0.7932767, -0.9065815, -3.960964, 0.5137255, 1, 0, 1,
-0.7910764, 0.8428357, -0.3808278, 0.5058824, 1, 0, 1,
-0.7858782, -0.7956434, -1.476116, 0.5019608, 1, 0, 1,
-0.7827335, -0.1849843, -1.264028, 0.4941176, 1, 0, 1,
-0.778066, 2.177057, 0.1928831, 0.4862745, 1, 0, 1,
-0.7725446, 0.02482084, -1.947952, 0.4823529, 1, 0, 1,
-0.7697085, 1.138225, -2.608179, 0.4745098, 1, 0, 1,
-0.760302, -1.181371, -1.794484, 0.4705882, 1, 0, 1,
-0.7600227, 0.4155659, -1.429033, 0.4627451, 1, 0, 1,
-0.7458708, 0.3442816, -2.013762, 0.4588235, 1, 0, 1,
-0.7444215, 0.2651437, -0.4031782, 0.4509804, 1, 0, 1,
-0.7399873, -0.2479312, -3.707065, 0.4470588, 1, 0, 1,
-0.7377688, -1.881909, -3.787557, 0.4392157, 1, 0, 1,
-0.7326006, -1.124233, -1.22307, 0.4352941, 1, 0, 1,
-0.7180788, 1.42826, 1.394146, 0.427451, 1, 0, 1,
-0.7180364, -0.2857566, -1.069564, 0.4235294, 1, 0, 1,
-0.7180056, 0.3314259, 0.4718803, 0.4156863, 1, 0, 1,
-0.7154623, -0.6762379, -3.842548, 0.4117647, 1, 0, 1,
-0.7146582, -0.4392208, -2.048208, 0.4039216, 1, 0, 1,
-0.7086233, -0.7153128, -3.204229, 0.3960784, 1, 0, 1,
-0.708258, 1.47154, 0.3727037, 0.3921569, 1, 0, 1,
-0.7078608, 0.1450305, -1.882537, 0.3843137, 1, 0, 1,
-0.7074829, -0.8789333, -1.490147, 0.3803922, 1, 0, 1,
-0.7046729, -0.1003071, -2.827101, 0.372549, 1, 0, 1,
-0.7030503, -1.347229, -3.0879, 0.3686275, 1, 0, 1,
-0.7017553, 0.6461137, -0.08281789, 0.3607843, 1, 0, 1,
-0.7006258, 0.2562951, -2.332013, 0.3568628, 1, 0, 1,
-0.6879317, -0.09416953, -1.49764, 0.3490196, 1, 0, 1,
-0.6869364, 0.194555, -0.4649893, 0.345098, 1, 0, 1,
-0.686565, 0.244166, -2.606015, 0.3372549, 1, 0, 1,
-0.6758991, -0.5193405, -2.732016, 0.3333333, 1, 0, 1,
-0.6622722, -0.5125971, -3.505836, 0.3254902, 1, 0, 1,
-0.6579626, -1.69397, -2.895581, 0.3215686, 1, 0, 1,
-0.655476, 0.3112381, -1.451885, 0.3137255, 1, 0, 1,
-0.6498471, 0.2564133, -0.3273739, 0.3098039, 1, 0, 1,
-0.6445877, -0.9394926, -1.0169, 0.3019608, 1, 0, 1,
-0.643797, 0.05316821, -0.04467513, 0.2941177, 1, 0, 1,
-0.6386769, -1.503667, -2.308367, 0.2901961, 1, 0, 1,
-0.63811, -0.9268777, -2.269123, 0.282353, 1, 0, 1,
-0.6360949, -0.1649361, -2.611974, 0.2784314, 1, 0, 1,
-0.6347441, -0.04464416, -2.409676, 0.2705882, 1, 0, 1,
-0.6312385, 0.3307686, 0.7293438, 0.2666667, 1, 0, 1,
-0.62744, -1.077467, -2.627379, 0.2588235, 1, 0, 1,
-0.6273744, -1.41649, -2.616667, 0.254902, 1, 0, 1,
-0.6273137, -1.128652, -1.907274, 0.2470588, 1, 0, 1,
-0.6226238, -0.1256991, -0.8191834, 0.2431373, 1, 0, 1,
-0.6221355, 0.6940569, -0.1361753, 0.2352941, 1, 0, 1,
-0.6165633, 0.3288781, -1.957205, 0.2313726, 1, 0, 1,
-0.6126805, -0.9500688, -2.112903, 0.2235294, 1, 0, 1,
-0.6106143, 1.209128, -0.9601166, 0.2196078, 1, 0, 1,
-0.6058415, 2.361081, 0.1129046, 0.2117647, 1, 0, 1,
-0.6054189, 0.5517046, -1.211352, 0.2078431, 1, 0, 1,
-0.6019416, 0.2463182, -0.0485761, 0.2, 1, 0, 1,
-0.5998878, -0.5130476, -1.453358, 0.1921569, 1, 0, 1,
-0.599152, -0.4682961, -2.314467, 0.1882353, 1, 0, 1,
-0.594393, 0.1366721, -1.726863, 0.1803922, 1, 0, 1,
-0.5880839, -0.9189932, -3.794322, 0.1764706, 1, 0, 1,
-0.5876873, -0.392657, -1.684576, 0.1686275, 1, 0, 1,
-0.5830489, 0.2014269, -2.390694, 0.1647059, 1, 0, 1,
-0.5820432, -0.4915157, -0.8616518, 0.1568628, 1, 0, 1,
-0.580839, -1.20849, -2.510804, 0.1529412, 1, 0, 1,
-0.574465, -0.9009282, -2.784875, 0.145098, 1, 0, 1,
-0.5723773, -0.7987181, -3.042549, 0.1411765, 1, 0, 1,
-0.5722904, -0.211113, -3.090821, 0.1333333, 1, 0, 1,
-0.5650698, -0.03193891, -2.207581, 0.1294118, 1, 0, 1,
-0.5613526, 0.4396841, -1.199415, 0.1215686, 1, 0, 1,
-0.559918, 0.2750854, -0.05308031, 0.1176471, 1, 0, 1,
-0.5569216, 1.73491, -1.688187, 0.1098039, 1, 0, 1,
-0.5519749, 0.4833946, -0.7371655, 0.1058824, 1, 0, 1,
-0.5472813, 1.450115, -0.2585842, 0.09803922, 1, 0, 1,
-0.5453513, -1.755447, -4.049723, 0.09019608, 1, 0, 1,
-0.5401809, 0.6490877, -0.2243773, 0.08627451, 1, 0, 1,
-0.5391374, 0.220163, -1.15071, 0.07843138, 1, 0, 1,
-0.5364385, 0.2065173, 0.1787089, 0.07450981, 1, 0, 1,
-0.5333727, -0.9743986, -0.07675452, 0.06666667, 1, 0, 1,
-0.5320811, 0.6714392, -1.260463, 0.0627451, 1, 0, 1,
-0.5305262, 0.378081, -0.5763703, 0.05490196, 1, 0, 1,
-0.5284873, 0.302074, -0.8013812, 0.05098039, 1, 0, 1,
-0.5225608, -0.98876, -3.822912, 0.04313726, 1, 0, 1,
-0.5215515, 1.003724, 0.6365134, 0.03921569, 1, 0, 1,
-0.5169657, 1.483042, -1.818763, 0.03137255, 1, 0, 1,
-0.5135961, 0.6940549, -1.541402, 0.02745098, 1, 0, 1,
-0.5119382, -1.078708, -2.324055, 0.01960784, 1, 0, 1,
-0.5071809, 0.5395623, -0.2619418, 0.01568628, 1, 0, 1,
-0.506039, -0.7600955, -3.414344, 0.007843138, 1, 0, 1,
-0.5051698, 0.5162867, -1.648968, 0.003921569, 1, 0, 1,
-0.5027526, -1.473095, -2.749197, 0, 1, 0.003921569, 1,
-0.4988859, 0.3968302, -0.6416996, 0, 1, 0.01176471, 1,
-0.4937928, -1.064384, -1.626993, 0, 1, 0.01568628, 1,
-0.4917094, -0.08027251, -1.887613, 0, 1, 0.02352941, 1,
-0.4892187, -0.370102, -1.795342, 0, 1, 0.02745098, 1,
-0.4863788, 1.609314, -1.628735, 0, 1, 0.03529412, 1,
-0.485643, -0.5267431, -1.94304, 0, 1, 0.03921569, 1,
-0.4843781, 0.7025553, -0.3477058, 0, 1, 0.04705882, 1,
-0.4817197, -1.254171, -3.492753, 0, 1, 0.05098039, 1,
-0.4684163, 0.0001844203, -2.062915, 0, 1, 0.05882353, 1,
-0.4677642, 0.2653897, -2.177945, 0, 1, 0.0627451, 1,
-0.4671259, -0.7546342, -3.322471, 0, 1, 0.07058824, 1,
-0.465575, 0.147305, -0.211796, 0, 1, 0.07450981, 1,
-0.4639043, -0.1546741, -1.204636, 0, 1, 0.08235294, 1,
-0.4607008, -0.2114317, 0.3659595, 0, 1, 0.08627451, 1,
-0.459902, -1.718669, -3.062884, 0, 1, 0.09411765, 1,
-0.4552375, 0.2371732, -1.795229, 0, 1, 0.1019608, 1,
-0.4542493, 0.1815023, -0.6224409, 0, 1, 0.1058824, 1,
-0.453971, 0.5407419, -0.4599681, 0, 1, 0.1137255, 1,
-0.4535173, 0.1834674, -1.29231, 0, 1, 0.1176471, 1,
-0.4515119, -0.4364582, -1.792191, 0, 1, 0.1254902, 1,
-0.4494007, 1.564665, -0.1796787, 0, 1, 0.1294118, 1,
-0.4492545, -0.6844723, -2.863098, 0, 1, 0.1372549, 1,
-0.4446637, -0.2311853, -3.929823, 0, 1, 0.1411765, 1,
-0.4424749, 0.03310346, -0.8182898, 0, 1, 0.1490196, 1,
-0.4323427, 0.7517607, -0.8966675, 0, 1, 0.1529412, 1,
-0.4238703, 2.230838, -0.8123173, 0, 1, 0.1607843, 1,
-0.4234056, 0.02413827, -2.502093, 0, 1, 0.1647059, 1,
-0.4192275, 1.702424, -1.004956, 0, 1, 0.172549, 1,
-0.4180965, 1.236596, 0.03525616, 0, 1, 0.1764706, 1,
-0.4177354, -1.277934, -1.775833, 0, 1, 0.1843137, 1,
-0.4139346, -0.1065529, -1.031676, 0, 1, 0.1882353, 1,
-0.4120989, 0.1406164, -1.860094, 0, 1, 0.1960784, 1,
-0.4110689, 0.100635, -1.644137, 0, 1, 0.2039216, 1,
-0.4086611, -0.7022086, -2.253692, 0, 1, 0.2078431, 1,
-0.4035762, 1.949113, 1.130738, 0, 1, 0.2156863, 1,
-0.4023879, -0.5208224, -2.256729, 0, 1, 0.2196078, 1,
-0.3986676, -0.9698805, -2.726041, 0, 1, 0.227451, 1,
-0.3965636, 0.9246695, -0.1188577, 0, 1, 0.2313726, 1,
-0.3923661, 1.017973, -1.875489, 0, 1, 0.2392157, 1,
-0.3846728, 0.5665722, 0.2538513, 0, 1, 0.2431373, 1,
-0.3839653, -1.701311, -5.182809, 0, 1, 0.2509804, 1,
-0.3837561, -0.4406632, -4.759329, 0, 1, 0.254902, 1,
-0.3804956, 0.5715756, 1.016245, 0, 1, 0.2627451, 1,
-0.3801847, 2.567622, 0.4406083, 0, 1, 0.2666667, 1,
-0.3799235, 0.3438695, -0.2663273, 0, 1, 0.2745098, 1,
-0.3731646, 0.6342318, -0.8553396, 0, 1, 0.2784314, 1,
-0.3718567, -0.6471372, -2.815232, 0, 1, 0.2862745, 1,
-0.3695787, 0.0011723, -0.4671531, 0, 1, 0.2901961, 1,
-0.3677727, 0.3954858, -1.294218, 0, 1, 0.2980392, 1,
-0.3662274, 0.1337614, -1.533914, 0, 1, 0.3058824, 1,
-0.3632956, 0.6287513, -2.25086, 0, 1, 0.3098039, 1,
-0.3535095, 0.07517258, -0.4894627, 0, 1, 0.3176471, 1,
-0.3509332, 0.4394571, -0.7186172, 0, 1, 0.3215686, 1,
-0.3505663, -0.05291254, -1.928305, 0, 1, 0.3294118, 1,
-0.3495742, 0.6267883, -1.511955, 0, 1, 0.3333333, 1,
-0.345344, 0.2428638, 0.09653426, 0, 1, 0.3411765, 1,
-0.3442087, 0.7643825, -1.631036, 0, 1, 0.345098, 1,
-0.3421544, -1.927614, -0.9901543, 0, 1, 0.3529412, 1,
-0.3370438, -0.2184635, -3.053448, 0, 1, 0.3568628, 1,
-0.333969, 2.318162, -0.5186973, 0, 1, 0.3647059, 1,
-0.3332181, -0.1097904, -3.378716, 0, 1, 0.3686275, 1,
-0.3312699, -0.7730458, -3.301553, 0, 1, 0.3764706, 1,
-0.3268423, 0.1007782, -0.9193658, 0, 1, 0.3803922, 1,
-0.3267447, -0.3692532, -1.440284, 0, 1, 0.3882353, 1,
-0.3260109, -0.041394, -2.614359, 0, 1, 0.3921569, 1,
-0.3254449, -0.2108725, -1.931319, 0, 1, 0.4, 1,
-0.3249362, 0.461066, -0.9342291, 0, 1, 0.4078431, 1,
-0.3225714, 1.725941, 0.2740579, 0, 1, 0.4117647, 1,
-0.3222156, 0.2997597, 0.3021817, 0, 1, 0.4196078, 1,
-0.3197035, -1.220619, -2.331525, 0, 1, 0.4235294, 1,
-0.3196137, 0.8198981, -1.080906, 0, 1, 0.4313726, 1,
-0.3152402, -0.8300792, -1.519534, 0, 1, 0.4352941, 1,
-0.3131458, -0.7618654, -2.691454, 0, 1, 0.4431373, 1,
-0.3124634, -0.5197682, -4.528329, 0, 1, 0.4470588, 1,
-0.3077154, -0.4689735, -2.778288, 0, 1, 0.454902, 1,
-0.3074046, -1.682006, -2.549248, 0, 1, 0.4588235, 1,
-0.3012376, -0.02981227, -2.589827, 0, 1, 0.4666667, 1,
-0.2996971, -0.5811946, -2.573032, 0, 1, 0.4705882, 1,
-0.2996514, 0.3567185, -1.588856, 0, 1, 0.4784314, 1,
-0.2959072, 1.174538, -1.684603, 0, 1, 0.4823529, 1,
-0.2953313, 1.445897, -0.4315327, 0, 1, 0.4901961, 1,
-0.2880016, 0.6342297, 0.2440767, 0, 1, 0.4941176, 1,
-0.2865261, -0.7947705, -2.622278, 0, 1, 0.5019608, 1,
-0.2846693, -0.6746199, -1.838165, 0, 1, 0.509804, 1,
-0.2843809, 0.9260241, 0.5000273, 0, 1, 0.5137255, 1,
-0.2792175, -0.399747, -2.617372, 0, 1, 0.5215687, 1,
-0.2791774, 0.7671643, -1.661126, 0, 1, 0.5254902, 1,
-0.2733322, 0.471743, -1.030569, 0, 1, 0.5333334, 1,
-0.2702423, -0.177618, -2.264028, 0, 1, 0.5372549, 1,
-0.2690983, 0.9218222, -2.007678, 0, 1, 0.5450981, 1,
-0.2673023, 0.3055858, -0.282865, 0, 1, 0.5490196, 1,
-0.2615791, 0.3772412, -0.02297335, 0, 1, 0.5568628, 1,
-0.2608315, 1.000641, 1.850032, 0, 1, 0.5607843, 1,
-0.258843, -0.1805949, -1.596962, 0, 1, 0.5686275, 1,
-0.2570317, 0.2331725, -2.866526, 0, 1, 0.572549, 1,
-0.2549953, 0.8158658, -1.020108, 0, 1, 0.5803922, 1,
-0.2494841, 0.05521721, -2.110334, 0, 1, 0.5843138, 1,
-0.2466546, 0.8750077, -0.08218279, 0, 1, 0.5921569, 1,
-0.2406271, -0.0558802, -1.868003, 0, 1, 0.5960785, 1,
-0.2404482, -0.2790348, -2.050423, 0, 1, 0.6039216, 1,
-0.2362565, -0.4020573, -4.440443, 0, 1, 0.6117647, 1,
-0.2362276, 0.3901977, 0.0262484, 0, 1, 0.6156863, 1,
-0.236179, -0.8001723, -2.668413, 0, 1, 0.6235294, 1,
-0.2356636, -0.5382115, -3.763966, 0, 1, 0.627451, 1,
-0.2353183, -2.044994, -2.699691, 0, 1, 0.6352941, 1,
-0.2346434, -0.6012648, -1.689177, 0, 1, 0.6392157, 1,
-0.2345238, -0.8727215, -2.755374, 0, 1, 0.6470588, 1,
-0.2321609, -0.5549307, -1.363399, 0, 1, 0.6509804, 1,
-0.2287796, 1.480171, 0.08543298, 0, 1, 0.6588235, 1,
-0.2230217, 1.250434, -0.2593949, 0, 1, 0.6627451, 1,
-0.2223416, -0.685784, -3.559031, 0, 1, 0.6705883, 1,
-0.2181006, 0.5123874, -0.4886426, 0, 1, 0.6745098, 1,
-0.2164856, 2.657821, -0.2114775, 0, 1, 0.682353, 1,
-0.2117388, 0.3754727, -1.923597, 0, 1, 0.6862745, 1,
-0.207389, -0.7610219, -3.729947, 0, 1, 0.6941177, 1,
-0.1971803, -1.171866, -0.8178943, 0, 1, 0.7019608, 1,
-0.1858219, -0.7331412, -3.491806, 0, 1, 0.7058824, 1,
-0.1853715, 0.3089062, -2.146206, 0, 1, 0.7137255, 1,
-0.1833111, -1.35428, -3.76632, 0, 1, 0.7176471, 1,
-0.1784498, 0.8928927, 0.3760681, 0, 1, 0.7254902, 1,
-0.1748014, 1.64923, -0.4091136, 0, 1, 0.7294118, 1,
-0.1711855, 0.3858497, 0.8705958, 0, 1, 0.7372549, 1,
-0.1677258, 1.206346, 0.4340892, 0, 1, 0.7411765, 1,
-0.1670065, 0.6078889, 1.971742, 0, 1, 0.7490196, 1,
-0.1657111, 0.1585194, -0.5828652, 0, 1, 0.7529412, 1,
-0.1643787, 0.3177341, -0.5213185, 0, 1, 0.7607843, 1,
-0.1621011, -0.659846, -1.918113, 0, 1, 0.7647059, 1,
-0.1587085, -0.3208362, -4.350115, 0, 1, 0.772549, 1,
-0.1578537, 0.5939947, -1.739991, 0, 1, 0.7764706, 1,
-0.151155, -1.543874, -4.57904, 0, 1, 0.7843137, 1,
-0.1509795, 0.8014819, 0.1737963, 0, 1, 0.7882353, 1,
-0.1498951, -1.219389, -3.352072, 0, 1, 0.7960784, 1,
-0.1462767, 1.263445, 0.1591911, 0, 1, 0.8039216, 1,
-0.1399254, 0.2611864, -0.2476716, 0, 1, 0.8078431, 1,
-0.1314479, -0.1220882, -2.158759, 0, 1, 0.8156863, 1,
-0.1312139, -1.564993, -4.068649, 0, 1, 0.8196079, 1,
-0.1305416, 0.560593, 1.276244, 0, 1, 0.827451, 1,
-0.1288625, 0.2484463, -0.2701132, 0, 1, 0.8313726, 1,
-0.1287865, -0.01384658, -0.3884121, 0, 1, 0.8392157, 1,
-0.1287527, -1.598366, -2.781376, 0, 1, 0.8431373, 1,
-0.1257626, -1.104241, -2.012392, 0, 1, 0.8509804, 1,
-0.1242801, -1.453826, -3.739605, 0, 1, 0.854902, 1,
-0.1220895, 0.5419705, 0.9510677, 0, 1, 0.8627451, 1,
-0.1120478, 0.6436977, 0.6554837, 0, 1, 0.8666667, 1,
-0.1101417, -0.2530324, -3.32198, 0, 1, 0.8745098, 1,
-0.106694, 0.5021169, 0.9657787, 0, 1, 0.8784314, 1,
-0.1055081, -0.6392715, -3.671397, 0, 1, 0.8862745, 1,
-0.09689538, 1.35293, 0.4579843, 0, 1, 0.8901961, 1,
-0.09484462, 0.72972, -1.096827, 0, 1, 0.8980392, 1,
-0.09467997, -0.9483005, -3.190627, 0, 1, 0.9058824, 1,
-0.09372582, 1.4098, 2.866741, 0, 1, 0.9098039, 1,
-0.09347513, 0.1616323, -0.6002527, 0, 1, 0.9176471, 1,
-0.09154017, -1.253099, -1.99814, 0, 1, 0.9215686, 1,
-0.08580159, -0.1225892, -2.501311, 0, 1, 0.9294118, 1,
-0.07309909, 1.242486, -0.7076151, 0, 1, 0.9333333, 1,
-0.07150692, 1.6696, -2.016373, 0, 1, 0.9411765, 1,
-0.06534668, -0.004016373, -1.244722, 0, 1, 0.945098, 1,
-0.05659393, -0.2485477, -3.450037, 0, 1, 0.9529412, 1,
-0.05582898, -0.03026495, -2.948635, 0, 1, 0.9568627, 1,
-0.05110186, 0.3078871, -0.9601482, 0, 1, 0.9647059, 1,
-0.04576377, -0.8433216, -4.820847, 0, 1, 0.9686275, 1,
-0.04026104, -0.2243015, -2.612684, 0, 1, 0.9764706, 1,
-0.03351225, 1.453411, 2.506927, 0, 1, 0.9803922, 1,
-0.03341847, 0.1241867, -1.607885, 0, 1, 0.9882353, 1,
-0.03292776, 0.5072673, 0.8275405, 0, 1, 0.9921569, 1,
-0.0311674, 0.6071308, -0.1978616, 0, 1, 1, 1,
-0.02927043, 1.53269, -0.468541, 0, 0.9921569, 1, 1,
-0.02254806, -0.3977027, -4.195046, 0, 0.9882353, 1, 1,
-0.02052832, -0.1773924, -1.687102, 0, 0.9803922, 1, 1,
-0.02047167, 0.4149911, 0.1111077, 0, 0.9764706, 1, 1,
-0.01476233, -0.1665898, -2.301103, 0, 0.9686275, 1, 1,
-0.01452484, 0.1328777, 0.1572773, 0, 0.9647059, 1, 1,
-0.01047864, -0.7041771, -2.369323, 0, 0.9568627, 1, 1,
-0.006037973, 0.6507338, 0.9207302, 0, 0.9529412, 1, 1,
-0.001318519, -0.1414552, -4.36844, 0, 0.945098, 1, 1,
-0.001294574, 0.8116061, -0.17288, 0, 0.9411765, 1, 1,
0.000480506, 0.3920494, 0.9591492, 0, 0.9333333, 1, 1,
0.005391826, -0.7366048, 4.096744, 0, 0.9294118, 1, 1,
0.009719911, -1.590694, 2.123309, 0, 0.9215686, 1, 1,
0.01455207, -0.3654997, 2.954946, 0, 0.9176471, 1, 1,
0.01799528, -0.4334059, 3.437939, 0, 0.9098039, 1, 1,
0.02252423, -1.478815, 1.776552, 0, 0.9058824, 1, 1,
0.02316551, 0.5378654, -1.093692, 0, 0.8980392, 1, 1,
0.02915076, -2.754659, 3.156287, 0, 0.8901961, 1, 1,
0.03065833, -1.239482, 4.506741, 0, 0.8862745, 1, 1,
0.03169261, 0.1234929, 0.2090084, 0, 0.8784314, 1, 1,
0.03254577, -0.1871418, 3.143102, 0, 0.8745098, 1, 1,
0.03329252, -0.3814465, 3.776865, 0, 0.8666667, 1, 1,
0.03380869, -0.43107, 4.360267, 0, 0.8627451, 1, 1,
0.0455454, 0.02076147, 1.9875, 0, 0.854902, 1, 1,
0.05930437, -1.192357, 1.48994, 0, 0.8509804, 1, 1,
0.0602524, -0.2403997, 5.07962, 0, 0.8431373, 1, 1,
0.06921168, -0.6403422, -0.02262506, 0, 0.8392157, 1, 1,
0.07214676, -0.7204006, 3.613284, 0, 0.8313726, 1, 1,
0.07547472, 0.628162, 0.9371997, 0, 0.827451, 1, 1,
0.0757096, 1.657154, -0.6650846, 0, 0.8196079, 1, 1,
0.07837928, 0.8201017, 1.867976, 0, 0.8156863, 1, 1,
0.07936168, 3.40867, -1.74507, 0, 0.8078431, 1, 1,
0.08136567, -0.1495325, 3.13258, 0, 0.8039216, 1, 1,
0.08567892, 0.8084162, -0.8314501, 0, 0.7960784, 1, 1,
0.08568183, 0.5368046, -0.1372118, 0, 0.7882353, 1, 1,
0.0944054, -1.24826, 3.555308, 0, 0.7843137, 1, 1,
0.0948877, 2.080714, 0.796092, 0, 0.7764706, 1, 1,
0.09714083, 0.4905674, -1.859684, 0, 0.772549, 1, 1,
0.1000004, -0.4810087, 2.790121, 0, 0.7647059, 1, 1,
0.1003934, -1.075923, 4.061357, 0, 0.7607843, 1, 1,
0.103409, -0.166051, 1.90037, 0, 0.7529412, 1, 1,
0.1066563, -0.9062276, 3.50396, 0, 0.7490196, 1, 1,
0.1069777, 1.897811, -0.8277918, 0, 0.7411765, 1, 1,
0.1149858, 0.1647583, 0.2269132, 0, 0.7372549, 1, 1,
0.1185214, -1.290679, 2.111353, 0, 0.7294118, 1, 1,
0.1241437, -0.326474, 0.500447, 0, 0.7254902, 1, 1,
0.1268602, 0.6114786, -0.08387717, 0, 0.7176471, 1, 1,
0.1278874, -0.6742842, 3.574617, 0, 0.7137255, 1, 1,
0.1287784, 1.438222, -0.6921381, 0, 0.7058824, 1, 1,
0.1311287, 0.002188785, 0.4404618, 0, 0.6980392, 1, 1,
0.1340552, -1.75155, 0.9221382, 0, 0.6941177, 1, 1,
0.1352258, -0.9376725, 3.774916, 0, 0.6862745, 1, 1,
0.1410705, -0.8622901, 2.779134, 0, 0.682353, 1, 1,
0.1431491, 1.718525, 0.0989575, 0, 0.6745098, 1, 1,
0.14563, 2.308562, 0.3298302, 0, 0.6705883, 1, 1,
0.1458525, 1.087898, 0.525484, 0, 0.6627451, 1, 1,
0.1462833, -0.06380029, 2.561353, 0, 0.6588235, 1, 1,
0.1467638, 0.7414383, -1.471599, 0, 0.6509804, 1, 1,
0.1473525, -1.091515, 4.08502, 0, 0.6470588, 1, 1,
0.1480717, 0.5550414, 0.2375453, 0, 0.6392157, 1, 1,
0.1490234, -0.6239467, 2.817548, 0, 0.6352941, 1, 1,
0.1534779, -2.247661, 4.639687, 0, 0.627451, 1, 1,
0.1543774, -0.8025876, 3.720409, 0, 0.6235294, 1, 1,
0.1559569, -1.417406, 5.057271, 0, 0.6156863, 1, 1,
0.1564431, -0.9935793, 1.487741, 0, 0.6117647, 1, 1,
0.1592794, 1.616802, 1.409616, 0, 0.6039216, 1, 1,
0.1595916, -0.2546611, 2.091146, 0, 0.5960785, 1, 1,
0.1610365, 0.09435145, 0.9545164, 0, 0.5921569, 1, 1,
0.1696963, 0.385381, -0.2750895, 0, 0.5843138, 1, 1,
0.1738772, -0.8500864, 1.733626, 0, 0.5803922, 1, 1,
0.1740309, -0.1042323, 1.730657, 0, 0.572549, 1, 1,
0.1749159, 0.8007712, 1.256435, 0, 0.5686275, 1, 1,
0.1768361, 3.072178, -0.6962931, 0, 0.5607843, 1, 1,
0.1774361, -1.197702, 2.017132, 0, 0.5568628, 1, 1,
0.1783391, -0.1796825, 2.843512, 0, 0.5490196, 1, 1,
0.1818813, 0.9606668, 1.555174, 0, 0.5450981, 1, 1,
0.1860583, 0.5494915, -0.428235, 0, 0.5372549, 1, 1,
0.1925256, 1.13415, -0.5407631, 0, 0.5333334, 1, 1,
0.1950561, -1.368672, 1.577993, 0, 0.5254902, 1, 1,
0.195306, 0.2320735, 1.000954, 0, 0.5215687, 1, 1,
0.1953785, 0.7882943, 1.081002, 0, 0.5137255, 1, 1,
0.1982677, -2.061854, 2.355148, 0, 0.509804, 1, 1,
0.2038395, -0.07888654, 2.448054, 0, 0.5019608, 1, 1,
0.2070464, 0.6004334, 0.5780953, 0, 0.4941176, 1, 1,
0.2138885, 0.9619656, 0.4438448, 0, 0.4901961, 1, 1,
0.2146314, -0.8703781, 3.888674, 0, 0.4823529, 1, 1,
0.2203104, -0.4241171, 4.404159, 0, 0.4784314, 1, 1,
0.2253017, 1.293155, 0.194478, 0, 0.4705882, 1, 1,
0.225522, 1.195834, 0.1331822, 0, 0.4666667, 1, 1,
0.2256182, 0.9057029, -1.095284, 0, 0.4588235, 1, 1,
0.2274642, 2.019531, -0.6889967, 0, 0.454902, 1, 1,
0.230523, 0.3422036, 0.3339772, 0, 0.4470588, 1, 1,
0.2350443, -0.6812657, 1.231405, 0, 0.4431373, 1, 1,
0.2368313, 0.4253545, -0.4320374, 0, 0.4352941, 1, 1,
0.2370591, 0.8360553, 1.558901, 0, 0.4313726, 1, 1,
0.2410751, -0.4576432, 1.567487, 0, 0.4235294, 1, 1,
0.2461055, 0.8825907, 0.03959426, 0, 0.4196078, 1, 1,
0.2477264, 0.7252013, 0.3953853, 0, 0.4117647, 1, 1,
0.2480146, 1.19498, 0.1574614, 0, 0.4078431, 1, 1,
0.2506221, -0.2799515, 4.046906, 0, 0.4, 1, 1,
0.2516466, 0.6147232, -0.6577271, 0, 0.3921569, 1, 1,
0.2567385, 1.81982, -0.1547142, 0, 0.3882353, 1, 1,
0.2575182, -0.6531417, 2.89058, 0, 0.3803922, 1, 1,
0.2590002, 0.0463236, 2.16942, 0, 0.3764706, 1, 1,
0.2615179, 0.3302594, 0.3519923, 0, 0.3686275, 1, 1,
0.2617317, 0.6370245, 1.003348, 0, 0.3647059, 1, 1,
0.2619655, 1.729708, 0.009808566, 0, 0.3568628, 1, 1,
0.2635273, 1.7562, -1.564352, 0, 0.3529412, 1, 1,
0.2679191, 0.1271278, 1.771017, 0, 0.345098, 1, 1,
0.2692748, 0.6786249, 1.861696, 0, 0.3411765, 1, 1,
0.2707146, 0.2068276, 0.621456, 0, 0.3333333, 1, 1,
0.2714783, 0.4531371, 0.2031694, 0, 0.3294118, 1, 1,
0.2715807, 1.601376, 0.8517802, 0, 0.3215686, 1, 1,
0.2718132, 0.0407817, 1.34184, 0, 0.3176471, 1, 1,
0.2799135, 0.1371576, 1.601223, 0, 0.3098039, 1, 1,
0.2800256, -0.9519266, 4.753659, 0, 0.3058824, 1, 1,
0.2859353, -1.033088, 2.507712, 0, 0.2980392, 1, 1,
0.2934546, -0.8363965, 3.210856, 0, 0.2901961, 1, 1,
0.2993322, 0.1046358, 0.4679677, 0, 0.2862745, 1, 1,
0.3020267, -0.6782817, 2.343638, 0, 0.2784314, 1, 1,
0.3030644, 0.2144917, -0.5332454, 0, 0.2745098, 1, 1,
0.3037114, -0.2893096, 2.530119, 0, 0.2666667, 1, 1,
0.3048252, -1.239383, 2.649706, 0, 0.2627451, 1, 1,
0.304861, -1.331559, 2.676564, 0, 0.254902, 1, 1,
0.3054568, 0.6121712, -0.3994746, 0, 0.2509804, 1, 1,
0.3095813, -0.09206482, 2.544978, 0, 0.2431373, 1, 1,
0.3106389, 0.3393118, 1.490997, 0, 0.2392157, 1, 1,
0.3109666, 0.3364737, 0.5577952, 0, 0.2313726, 1, 1,
0.3169706, 1.346027, -0.6220975, 0, 0.227451, 1, 1,
0.3173392, 0.02251269, 2.283634, 0, 0.2196078, 1, 1,
0.3202139, -0.8429947, 2.515365, 0, 0.2156863, 1, 1,
0.3309133, -1.110768, 2.50444, 0, 0.2078431, 1, 1,
0.3319273, -0.7417724, 2.942827, 0, 0.2039216, 1, 1,
0.3341385, 0.9400858, 0.2053628, 0, 0.1960784, 1, 1,
0.3391993, -0.5827239, 2.646399, 0, 0.1882353, 1, 1,
0.3438047, 0.2171844, 3.669242, 0, 0.1843137, 1, 1,
0.3449625, 0.3242792, 1.712266, 0, 0.1764706, 1, 1,
0.3453014, -1.807467, 2.599484, 0, 0.172549, 1, 1,
0.3536601, -0.5585319, 2.242692, 0, 0.1647059, 1, 1,
0.3551806, -0.739751, 2.92102, 0, 0.1607843, 1, 1,
0.3617324, 0.6748585, 0.3237455, 0, 0.1529412, 1, 1,
0.3639321, 0.2706634, 2.037038, 0, 0.1490196, 1, 1,
0.3640124, 0.04418387, 1.302852, 0, 0.1411765, 1, 1,
0.3663568, -0.8271477, 3.235417, 0, 0.1372549, 1, 1,
0.3673013, -1.06162, 2.801144, 0, 0.1294118, 1, 1,
0.3707349, -0.4458511, 2.141439, 0, 0.1254902, 1, 1,
0.3720808, -0.5817343, 3.23825, 0, 0.1176471, 1, 1,
0.3752577, 0.1527279, 0.8285037, 0, 0.1137255, 1, 1,
0.3755566, -1.689844, 3.031341, 0, 0.1058824, 1, 1,
0.3784735, -1.522939, 3.186584, 0, 0.09803922, 1, 1,
0.3799641, 0.9571531, -0.6691196, 0, 0.09411765, 1, 1,
0.3820288, 0.3407048, 3.030616, 0, 0.08627451, 1, 1,
0.3858103, -1.598171, 2.972464, 0, 0.08235294, 1, 1,
0.386602, -0.9829639, 4.480418, 0, 0.07450981, 1, 1,
0.3892525, -0.1696597, 1.651639, 0, 0.07058824, 1, 1,
0.3941832, -0.2679707, 2.808328, 0, 0.0627451, 1, 1,
0.3947419, -0.08979654, 2.582873, 0, 0.05882353, 1, 1,
0.3953438, -1.204576, 2.792153, 0, 0.05098039, 1, 1,
0.4004758, -0.9891587, 2.4573, 0, 0.04705882, 1, 1,
0.4009906, 0.2027563, 1.628307, 0, 0.03921569, 1, 1,
0.4026726, 0.8086483, -0.507584, 0, 0.03529412, 1, 1,
0.4029876, -0.07276872, 2.67104, 0, 0.02745098, 1, 1,
0.4057756, -0.5072148, 2.060749, 0, 0.02352941, 1, 1,
0.4075369, 0.7949646, -0.1494206, 0, 0.01568628, 1, 1,
0.4186468, -0.4696307, 3.597482, 0, 0.01176471, 1, 1,
0.4189607, -0.3792774, 2.452548, 0, 0.003921569, 1, 1,
0.4206905, 0.08505416, 1.424718, 0.003921569, 0, 1, 1,
0.4214327, -0.255498, 3.777447, 0.007843138, 0, 1, 1,
0.4269912, -0.1988145, 0.1262353, 0.01568628, 0, 1, 1,
0.4269944, 0.3289311, -0.2605228, 0.01960784, 0, 1, 1,
0.434009, 0.130684, 1.743451, 0.02745098, 0, 1, 1,
0.4366452, -0.1714643, 1.908322, 0.03137255, 0, 1, 1,
0.4399631, 0.6446009, -0.6582051, 0.03921569, 0, 1, 1,
0.4433783, 0.1430489, 2.233772, 0.04313726, 0, 1, 1,
0.447134, -0.2598936, 2.365129, 0.05098039, 0, 1, 1,
0.4472828, 0.1432183, -0.9258039, 0.05490196, 0, 1, 1,
0.448082, -0.5036664, 0.8179793, 0.0627451, 0, 1, 1,
0.4502124, -0.5864981, 2.513303, 0.06666667, 0, 1, 1,
0.4518742, -0.7258627, 3.907471, 0.07450981, 0, 1, 1,
0.4522399, -0.06359506, 0.1184231, 0.07843138, 0, 1, 1,
0.4544769, -0.14444, 2.045233, 0.08627451, 0, 1, 1,
0.4556138, 0.2355872, 1.698326, 0.09019608, 0, 1, 1,
0.4601601, -1.949402, 2.166678, 0.09803922, 0, 1, 1,
0.461468, -1.706375, 3.761128, 0.1058824, 0, 1, 1,
0.4622887, 1.013543, 1.983461, 0.1098039, 0, 1, 1,
0.4640148, 0.2804166, 0.7718415, 0.1176471, 0, 1, 1,
0.4724901, -1.062587, 2.048758, 0.1215686, 0, 1, 1,
0.4753304, 0.7592693, 2.28396, 0.1294118, 0, 1, 1,
0.4755598, -0.2462347, 3.779664, 0.1333333, 0, 1, 1,
0.4756839, -1.246314, 3.073749, 0.1411765, 0, 1, 1,
0.4845789, 0.5651388, -0.6718898, 0.145098, 0, 1, 1,
0.4910629, -0.2772355, 2.371581, 0.1529412, 0, 1, 1,
0.4922292, -0.5627131, -0.6732981, 0.1568628, 0, 1, 1,
0.494706, 1.300343, 1.651002, 0.1647059, 0, 1, 1,
0.4971158, 1.906211, -1.36949, 0.1686275, 0, 1, 1,
0.5072303, -0.889705, 3.221226, 0.1764706, 0, 1, 1,
0.5118529, 0.3413107, -0.8848905, 0.1803922, 0, 1, 1,
0.515198, -0.8346793, 2.392974, 0.1882353, 0, 1, 1,
0.5158693, 0.06701587, 1.125445, 0.1921569, 0, 1, 1,
0.5234359, 0.1761371, 1.278015, 0.2, 0, 1, 1,
0.5272673, 0.5643832, 2.092271, 0.2078431, 0, 1, 1,
0.5328975, 0.8057406, 1.568102, 0.2117647, 0, 1, 1,
0.5355069, 0.06445211, 0.2552046, 0.2196078, 0, 1, 1,
0.5368223, 1.649947, 1.37318, 0.2235294, 0, 1, 1,
0.5390194, 0.9272957, 0.1434863, 0.2313726, 0, 1, 1,
0.5409456, -1.088755, 3.278523, 0.2352941, 0, 1, 1,
0.5458198, 0.4829745, 0.7757047, 0.2431373, 0, 1, 1,
0.5458218, 0.08302142, 1.693509, 0.2470588, 0, 1, 1,
0.5515152, -0.8648493, 2.404524, 0.254902, 0, 1, 1,
0.5716289, 2.039312, -0.8517768, 0.2588235, 0, 1, 1,
0.5756973, 1.385819, -0.8915402, 0.2666667, 0, 1, 1,
0.5781472, 0.6809995, 0.3530492, 0.2705882, 0, 1, 1,
0.5792132, 1.164325, -0.4763149, 0.2784314, 0, 1, 1,
0.5817714, 0.09542379, 0.1177477, 0.282353, 0, 1, 1,
0.584893, 0.4905429, 1.944885, 0.2901961, 0, 1, 1,
0.586683, -0.4450271, 3.241907, 0.2941177, 0, 1, 1,
0.5905144, -2.024228, 5.03821, 0.3019608, 0, 1, 1,
0.5915059, -1.00363, 2.794766, 0.3098039, 0, 1, 1,
0.5922565, -0.3989793, 2.103497, 0.3137255, 0, 1, 1,
0.5946695, 0.2329098, 1.100305, 0.3215686, 0, 1, 1,
0.6011328, 0.7313909, -1.584566, 0.3254902, 0, 1, 1,
0.6145175, 0.09412284, 0.5523832, 0.3333333, 0, 1, 1,
0.6171286, 0.3865716, 0.5511742, 0.3372549, 0, 1, 1,
0.6206479, -3.030148, 0.9432595, 0.345098, 0, 1, 1,
0.625897, -0.4077828, 1.995504, 0.3490196, 0, 1, 1,
0.6263065, 0.4473874, -0.2762368, 0.3568628, 0, 1, 1,
0.6313553, -1.217232, 2.316995, 0.3607843, 0, 1, 1,
0.6322677, 0.3119708, -1.505008, 0.3686275, 0, 1, 1,
0.634207, -1.939891, 2.630325, 0.372549, 0, 1, 1,
0.6359142, 0.1478483, 1.166088, 0.3803922, 0, 1, 1,
0.6442577, -0.03526065, 2.743989, 0.3843137, 0, 1, 1,
0.64689, 0.2086271, -0.3204234, 0.3921569, 0, 1, 1,
0.6492711, 2.446464, 0.9139863, 0.3960784, 0, 1, 1,
0.6511433, -0.6559274, 1.690688, 0.4039216, 0, 1, 1,
0.6522268, -0.431603, 2.194963, 0.4117647, 0, 1, 1,
0.6566643, -1.64291, 2.906551, 0.4156863, 0, 1, 1,
0.6639935, -0.3347814, 2.145726, 0.4235294, 0, 1, 1,
0.6674057, 1.054023, 1.530194, 0.427451, 0, 1, 1,
0.6711919, -0.2002898, 1.761958, 0.4352941, 0, 1, 1,
0.6714148, -0.7306973, 2.375725, 0.4392157, 0, 1, 1,
0.6721709, 0.2821623, 0.07715026, 0.4470588, 0, 1, 1,
0.675235, -1.405874, 2.395605, 0.4509804, 0, 1, 1,
0.6772869, -0.8895458, 0.6252393, 0.4588235, 0, 1, 1,
0.6776065, 0.5507106, 2.900647, 0.4627451, 0, 1, 1,
0.6791766, -0.3356085, 1.653434, 0.4705882, 0, 1, 1,
0.6847694, 0.8057418, 1.68223, 0.4745098, 0, 1, 1,
0.6855292, -1.10273, 2.551429, 0.4823529, 0, 1, 1,
0.6858307, 1.037206, 1.229877, 0.4862745, 0, 1, 1,
0.6870826, -1.012228, 2.316556, 0.4941176, 0, 1, 1,
0.6932713, -0.3819137, 2.093741, 0.5019608, 0, 1, 1,
0.6935525, -0.2911257, -0.2013779, 0.5058824, 0, 1, 1,
0.6968282, -2.19362, 2.202509, 0.5137255, 0, 1, 1,
0.7021118, 1.295486, -0.4911898, 0.5176471, 0, 1, 1,
0.7034683, -0.9077365, 3.153687, 0.5254902, 0, 1, 1,
0.7054417, -2.653314, 3.096268, 0.5294118, 0, 1, 1,
0.706942, -0.1564295, 2.371618, 0.5372549, 0, 1, 1,
0.7167602, -1.14504, 1.90086, 0.5411765, 0, 1, 1,
0.7273199, 1.776864, -0.91756, 0.5490196, 0, 1, 1,
0.7332873, 2.12555, 1.257743, 0.5529412, 0, 1, 1,
0.733865, -0.2998444, 3.313272, 0.5607843, 0, 1, 1,
0.739151, -0.9998735, 0.7447941, 0.5647059, 0, 1, 1,
0.7402321, 0.3755044, 2.721337, 0.572549, 0, 1, 1,
0.7408044, 0.3849991, 1.226464, 0.5764706, 0, 1, 1,
0.7462182, -0.6231975, 3.42221, 0.5843138, 0, 1, 1,
0.7575311, -1.330337, 3.326226, 0.5882353, 0, 1, 1,
0.7586947, 0.8785549, -0.3574152, 0.5960785, 0, 1, 1,
0.7609907, 0.4386597, 2.082013, 0.6039216, 0, 1, 1,
0.7620203, 0.5951152, 0.2363048, 0.6078432, 0, 1, 1,
0.7625338, 1.540776, 1.509915, 0.6156863, 0, 1, 1,
0.7643028, -0.3406822, 2.594498, 0.6196079, 0, 1, 1,
0.7648098, -0.2397254, 0.2691592, 0.627451, 0, 1, 1,
0.7675025, -0.1149294, 1.721322, 0.6313726, 0, 1, 1,
0.7683021, -0.8204521, 1.18722, 0.6392157, 0, 1, 1,
0.7788674, 0.439696, 2.981409, 0.6431373, 0, 1, 1,
0.783034, -0.1673025, 1.149353, 0.6509804, 0, 1, 1,
0.7854906, 1.754949, 1.793113, 0.654902, 0, 1, 1,
0.7958298, 0.4583493, 1.625562, 0.6627451, 0, 1, 1,
0.7960414, -1.244743, 3.103594, 0.6666667, 0, 1, 1,
0.7992741, -0.4499883, 3.140795, 0.6745098, 0, 1, 1,
0.8021857, -1.634947, 2.431965, 0.6784314, 0, 1, 1,
0.8039557, -0.2844144, 1.331947, 0.6862745, 0, 1, 1,
0.8055556, -0.09614364, 2.457387, 0.6901961, 0, 1, 1,
0.8063743, 1.309725, 0.2180753, 0.6980392, 0, 1, 1,
0.808123, 0.1057348, 2.090394, 0.7058824, 0, 1, 1,
0.8178204, -0.7795265, 2.015982, 0.7098039, 0, 1, 1,
0.820116, 0.146976, -0.2001015, 0.7176471, 0, 1, 1,
0.8238988, 1.023697, 1.590677, 0.7215686, 0, 1, 1,
0.8274996, -0.1061414, 2.281308, 0.7294118, 0, 1, 1,
0.8282831, -0.1664601, 0.8958129, 0.7333333, 0, 1, 1,
0.8306205, -0.7206492, 2.924586, 0.7411765, 0, 1, 1,
0.8317708, -1.210432, 2.976592, 0.7450981, 0, 1, 1,
0.8346279, -0.8198392, 2.387266, 0.7529412, 0, 1, 1,
0.8347553, 1.284037, -1.414773, 0.7568628, 0, 1, 1,
0.837871, 0.03170779, 1.492963, 0.7647059, 0, 1, 1,
0.8487728, 2.099079, 3.13133, 0.7686275, 0, 1, 1,
0.8496727, -1.281485, 3.894494, 0.7764706, 0, 1, 1,
0.8502182, 0.1605818, 0.5994534, 0.7803922, 0, 1, 1,
0.8580052, 0.5348159, 1.616585, 0.7882353, 0, 1, 1,
0.8581579, -0.2805295, 2.868364, 0.7921569, 0, 1, 1,
0.8654105, -0.6941221, 2.335781, 0.8, 0, 1, 1,
0.8706435, 1.7966, 1.652057, 0.8078431, 0, 1, 1,
0.8710831, -0.1606265, 2.639445, 0.8117647, 0, 1, 1,
0.8792645, 0.2952986, 3.34264, 0.8196079, 0, 1, 1,
0.8803087, -0.2854235, 1.232927, 0.8235294, 0, 1, 1,
0.8812581, -0.7808874, 2.988647, 0.8313726, 0, 1, 1,
0.8844295, 0.2372705, 1.451173, 0.8352941, 0, 1, 1,
0.8888749, 1.345774, -0.8236532, 0.8431373, 0, 1, 1,
0.8962821, -0.7269481, 0.8957446, 0.8470588, 0, 1, 1,
0.8999635, 0.3718475, 3.547261, 0.854902, 0, 1, 1,
0.903496, -0.951881, 2.668279, 0.8588235, 0, 1, 1,
0.9069273, -0.5545682, 2.391226, 0.8666667, 0, 1, 1,
0.9103734, -1.471342, 3.957086, 0.8705882, 0, 1, 1,
0.9185508, -0.07790928, 1.587678, 0.8784314, 0, 1, 1,
0.9187051, -1.443861, 3.306382, 0.8823529, 0, 1, 1,
0.9198434, 0.02579429, 0.8692451, 0.8901961, 0, 1, 1,
0.9218838, -0.4592078, 2.577193, 0.8941177, 0, 1, 1,
0.9237157, 0.8108225, 0.3706199, 0.9019608, 0, 1, 1,
0.9256747, -1.208156, 1.76798, 0.9098039, 0, 1, 1,
0.9317136, -0.8256426, 1.561211, 0.9137255, 0, 1, 1,
0.935567, -0.7159266, 3.001197, 0.9215686, 0, 1, 1,
0.9368235, -0.5506533, 2.765166, 0.9254902, 0, 1, 1,
0.949514, 0.1364828, 2.079504, 0.9333333, 0, 1, 1,
0.9532583, -0.1677193, 2.54071, 0.9372549, 0, 1, 1,
0.9533647, -0.4763923, 1.636457, 0.945098, 0, 1, 1,
0.9533899, 0.2853494, 1.376912, 0.9490196, 0, 1, 1,
0.9570282, 0.3290524, 0.3533035, 0.9568627, 0, 1, 1,
0.9592923, -0.04301444, 1.109083, 0.9607843, 0, 1, 1,
0.9610803, -0.08061606, -0.1494292, 0.9686275, 0, 1, 1,
0.9696524, -1.3946, 0.9058279, 0.972549, 0, 1, 1,
0.972283, 0.4173609, 0.8646724, 0.9803922, 0, 1, 1,
0.9734914, 1.915645, 0.7006118, 0.9843137, 0, 1, 1,
0.9785895, -0.0008417373, 2.652321, 0.9921569, 0, 1, 1,
0.9789712, -1.064746, 0.8649012, 0.9960784, 0, 1, 1,
0.9795141, 1.880523, -1.362704, 1, 0, 0.9960784, 1,
0.9864966, 0.8267214, 0.7074275, 1, 0, 0.9882353, 1,
0.9881617, -0.3122253, 0.01733244, 1, 0, 0.9843137, 1,
0.9893929, -2.451604, 2.973906, 1, 0, 0.9764706, 1,
0.9909584, 0.2327613, 1.223274, 1, 0, 0.972549, 1,
0.9914881, 0.4000275, 0.5206032, 1, 0, 0.9647059, 1,
0.9920314, 0.1403894, 1.185172, 1, 0, 0.9607843, 1,
0.9964132, 0.5489292, 0.9144872, 1, 0, 0.9529412, 1,
0.9983191, -0.1307244, 3.530649, 1, 0, 0.9490196, 1,
1.00986, 1.620311, 2.205662, 1, 0, 0.9411765, 1,
1.011768, 0.3186278, 1.99179, 1, 0, 0.9372549, 1,
1.020774, -0.06996691, 0.7040121, 1, 0, 0.9294118, 1,
1.021953, 0.3212483, 1.813318, 1, 0, 0.9254902, 1,
1.023618, -0.1367924, 2.168684, 1, 0, 0.9176471, 1,
1.024046, 0.2340529, 0.06287143, 1, 0, 0.9137255, 1,
1.03215, -1.31518, 2.335523, 1, 0, 0.9058824, 1,
1.032159, -0.04289966, 1.855883, 1, 0, 0.9019608, 1,
1.038351, -0.3434538, 1.341277, 1, 0, 0.8941177, 1,
1.055886, -1.859215, 2.679332, 1, 0, 0.8862745, 1,
1.058672, 0.7706797, 0.6066768, 1, 0, 0.8823529, 1,
1.07406, -1.260785, 2.460891, 1, 0, 0.8745098, 1,
1.078907, 0.6844816, 1.097644, 1, 0, 0.8705882, 1,
1.085064, -2.238693, 3.819094, 1, 0, 0.8627451, 1,
1.085468, 0.519327, -1.969419, 1, 0, 0.8588235, 1,
1.087073, 0.9480224, 1.262148, 1, 0, 0.8509804, 1,
1.090452, -0.5848857, 1.375518, 1, 0, 0.8470588, 1,
1.097545, 0.9700578, 0.1524675, 1, 0, 0.8392157, 1,
1.098855, -0.7038374, 3.011001, 1, 0, 0.8352941, 1,
1.099485, -0.9232813, 2.44178, 1, 0, 0.827451, 1,
1.111894, 1.366815, 1.951209, 1, 0, 0.8235294, 1,
1.112512, 0.2844627, 2.160698, 1, 0, 0.8156863, 1,
1.129289, 1.060357, 0.6694153, 1, 0, 0.8117647, 1,
1.129436, 0.6938729, 0.7535535, 1, 0, 0.8039216, 1,
1.141718, 0.8697134, 0.9834026, 1, 0, 0.7960784, 1,
1.152369, -0.2969554, 1.205812, 1, 0, 0.7921569, 1,
1.154615, -1.732239, 3.554383, 1, 0, 0.7843137, 1,
1.159101, -0.4195344, 3.419798, 1, 0, 0.7803922, 1,
1.167462, -0.3053457, 1.1641, 1, 0, 0.772549, 1,
1.181827, 1.969287, -0.3005809, 1, 0, 0.7686275, 1,
1.187532, -0.3361375, 1.753782, 1, 0, 0.7607843, 1,
1.20445, 1.075493, 0.4373127, 1, 0, 0.7568628, 1,
1.213057, 1.368598, 2.302235, 1, 0, 0.7490196, 1,
1.222311, 0.636677, 0.1344857, 1, 0, 0.7450981, 1,
1.223925, 1.668748, 0.1951214, 1, 0, 0.7372549, 1,
1.254887, 1.079546, -0.04911018, 1, 0, 0.7333333, 1,
1.257427, 2.624805, 0.1146906, 1, 0, 0.7254902, 1,
1.259109, -0.9425769, 1.495404, 1, 0, 0.7215686, 1,
1.259643, -0.1479686, 0.5654107, 1, 0, 0.7137255, 1,
1.265591, -0.4408423, 2.030082, 1, 0, 0.7098039, 1,
1.272621, -1.294683, 1.801623, 1, 0, 0.7019608, 1,
1.275202, -0.8384869, 2.375851, 1, 0, 0.6941177, 1,
1.282852, -0.5483081, 3.675044, 1, 0, 0.6901961, 1,
1.284315, 1.251627, 2.503303, 1, 0, 0.682353, 1,
1.291156, -1.065576, 1.762971, 1, 0, 0.6784314, 1,
1.294641, -1.112452, 1.330361, 1, 0, 0.6705883, 1,
1.298607, -0.3367632, 1.70918, 1, 0, 0.6666667, 1,
1.304223, -0.9639223, 2.452517, 1, 0, 0.6588235, 1,
1.304393, 1.008058, 0.07536802, 1, 0, 0.654902, 1,
1.306166, 0.4095541, 2.07585, 1, 0, 0.6470588, 1,
1.309494, 0.04427712, 1.016027, 1, 0, 0.6431373, 1,
1.321221, 1.077155, -0.9626754, 1, 0, 0.6352941, 1,
1.325549, -0.626052, 0.686569, 1, 0, 0.6313726, 1,
1.329021, 0.865745, 2.029064, 1, 0, 0.6235294, 1,
1.364091, 0.1821364, 1.759211, 1, 0, 0.6196079, 1,
1.367189, 0.1986969, 3.421477, 1, 0, 0.6117647, 1,
1.370847, 0.8600858, 1.494219, 1, 0, 0.6078432, 1,
1.374555, 1.854217, 0.09818103, 1, 0, 0.6, 1,
1.376115, -0.1904784, 1.889045, 1, 0, 0.5921569, 1,
1.376444, -1.874403, 3.796248, 1, 0, 0.5882353, 1,
1.385662, -0.5452945, 0.9426135, 1, 0, 0.5803922, 1,
1.387742, 0.7613109, 1.954381, 1, 0, 0.5764706, 1,
1.401912, 0.3665486, 2.901363, 1, 0, 0.5686275, 1,
1.405613, -0.1813689, 0.6829178, 1, 0, 0.5647059, 1,
1.410449, 1.32528, 0.2172049, 1, 0, 0.5568628, 1,
1.412185, 1.124499, 1.597796, 1, 0, 0.5529412, 1,
1.418875, -0.9380964, 2.682776, 1, 0, 0.5450981, 1,
1.421252, -0.9658133, 1.53121, 1, 0, 0.5411765, 1,
1.43182, 0.5054592, 0.2646768, 1, 0, 0.5333334, 1,
1.44122, 0.1121118, 3.215103, 1, 0, 0.5294118, 1,
1.446248, -0.3358591, 1.329507, 1, 0, 0.5215687, 1,
1.449471, 0.8551406, 1.772329, 1, 0, 0.5176471, 1,
1.457953, 0.8984049, 0.4678589, 1, 0, 0.509804, 1,
1.462899, 0.4977116, 2.255706, 1, 0, 0.5058824, 1,
1.465581, -0.5263682, 2.079097, 1, 0, 0.4980392, 1,
1.469261, -1.073522, 2.728886, 1, 0, 0.4901961, 1,
1.47464, -1.043496, 3.577904, 1, 0, 0.4862745, 1,
1.475866, 0.0495064, 1.15441, 1, 0, 0.4784314, 1,
1.482128, 0.732998, -0.4802063, 1, 0, 0.4745098, 1,
1.493459, 1.31303, 0.4627199, 1, 0, 0.4666667, 1,
1.494184, -0.1925115, 3.090326, 1, 0, 0.4627451, 1,
1.5042, -0.7114872, 1.493224, 1, 0, 0.454902, 1,
1.515056, -1.622477, 2.721057, 1, 0, 0.4509804, 1,
1.519018, -0.5079321, 1.759112, 1, 0, 0.4431373, 1,
1.521687, -1.056559, 1.405367, 1, 0, 0.4392157, 1,
1.523106, -0.5899156, 4.096817, 1, 0, 0.4313726, 1,
1.526246, 0.8402262, -0.9485154, 1, 0, 0.427451, 1,
1.532156, 0.3483789, 0.8177631, 1, 0, 0.4196078, 1,
1.542761, 0.7693751, -0.592113, 1, 0, 0.4156863, 1,
1.543332, -0.9962654, 1.095581, 1, 0, 0.4078431, 1,
1.564571, 1.108095, 0.947461, 1, 0, 0.4039216, 1,
1.569952, -0.6719809, 0.3110939, 1, 0, 0.3960784, 1,
1.571329, 1.308595, 1.42036, 1, 0, 0.3882353, 1,
1.572174, 0.6516238, 0.181637, 1, 0, 0.3843137, 1,
1.594065, -0.3182486, 0.422249, 1, 0, 0.3764706, 1,
1.596738, -0.54114, 3.340355, 1, 0, 0.372549, 1,
1.599745, 1.265869, 1.249477, 1, 0, 0.3647059, 1,
1.604289, 1.718414, 1.488854, 1, 0, 0.3607843, 1,
1.63205, -0.5724621, 3.061223, 1, 0, 0.3529412, 1,
1.642534, 0.03054328, 3.937199, 1, 0, 0.3490196, 1,
1.651638, 1.310035, 0.6800479, 1, 0, 0.3411765, 1,
1.661628, -0.1608407, 1.95381, 1, 0, 0.3372549, 1,
1.670562, 0.4857691, 1.288381, 1, 0, 0.3294118, 1,
1.671838, 1.107883, -0.2628346, 1, 0, 0.3254902, 1,
1.678216, -1.163313, 2.477228, 1, 0, 0.3176471, 1,
1.67854, 0.9709114, 2.502525, 1, 0, 0.3137255, 1,
1.681854, -0.6103375, 0.9320448, 1, 0, 0.3058824, 1,
1.695976, -0.9037408, 1.906619, 1, 0, 0.2980392, 1,
1.696122, -0.6667446, 1.456618, 1, 0, 0.2941177, 1,
1.710662, -0.2821452, 0.4772454, 1, 0, 0.2862745, 1,
1.739754, 0.7452846, 2.027579, 1, 0, 0.282353, 1,
1.740749, -1.14182, 3.621359, 1, 0, 0.2745098, 1,
1.752084, -0.5953441, 3.030098, 1, 0, 0.2705882, 1,
1.758381, -0.9745575, 3.317509, 1, 0, 0.2627451, 1,
1.769034, 0.5022662, 2.044616, 1, 0, 0.2588235, 1,
1.776433, -1.410717, 4.51336, 1, 0, 0.2509804, 1,
1.777804, 0.7528293, 1.832641, 1, 0, 0.2470588, 1,
1.782268, 0.286126, 2.340512, 1, 0, 0.2392157, 1,
1.795115, 0.1127562, 1.856276, 1, 0, 0.2352941, 1,
1.805075, -1.664393, 2.005047, 1, 0, 0.227451, 1,
1.808594, 0.3615735, 1.553634, 1, 0, 0.2235294, 1,
1.810483, -1.156896, 3.193209, 1, 0, 0.2156863, 1,
1.81052, 0.6312132, 2.573404, 1, 0, 0.2117647, 1,
1.822977, -0.3234269, 1.568795, 1, 0, 0.2039216, 1,
1.823673, 0.1580396, 1.211779, 1, 0, 0.1960784, 1,
1.838055, -0.8604648, 2.0469, 1, 0, 0.1921569, 1,
1.842192, -0.7349839, 2.486193, 1, 0, 0.1843137, 1,
1.89863, 0.5455233, 0.4339687, 1, 0, 0.1803922, 1,
1.905073, -0.3702915, 4.468027, 1, 0, 0.172549, 1,
1.916787, 0.2264513, 0.1011482, 1, 0, 0.1686275, 1,
1.939894, 1.702553, 2.903741, 1, 0, 0.1607843, 1,
1.953862, 1.428669, 1.069338, 1, 0, 0.1568628, 1,
1.983588, -0.03825251, 2.188497, 1, 0, 0.1490196, 1,
1.987705, -0.2386676, 1.546258, 1, 0, 0.145098, 1,
2.001724, 0.7255352, 1.384405, 1, 0, 0.1372549, 1,
2.01986, 1.003657, 2.09324, 1, 0, 0.1333333, 1,
2.034712, 1.542186, 1.217955, 1, 0, 0.1254902, 1,
2.069623, -0.7969671, 3.448949, 1, 0, 0.1215686, 1,
2.087046, -0.5763262, 2.476602, 1, 0, 0.1137255, 1,
2.14811, -0.3155646, 1.551996, 1, 0, 0.1098039, 1,
2.163695, 1.241502, 1.067578, 1, 0, 0.1019608, 1,
2.211471, -0.5576833, 1.057239, 1, 0, 0.09411765, 1,
2.223343, 0.8880138, 1.544843, 1, 0, 0.09019608, 1,
2.257956, -1.536915, 1.463805, 1, 0, 0.08235294, 1,
2.296644, 0.0619447, 1.274914, 1, 0, 0.07843138, 1,
2.29986, -1.080035, 2.246961, 1, 0, 0.07058824, 1,
2.390601, 0.2511381, 2.693811, 1, 0, 0.06666667, 1,
2.413143, -1.130127, 1.899344, 1, 0, 0.05882353, 1,
2.433295, 0.1948511, 0.3120593, 1, 0, 0.05490196, 1,
2.43898, -0.08525843, 0.7332767, 1, 0, 0.04705882, 1,
2.446235, -0.2387696, 2.147402, 1, 0, 0.04313726, 1,
2.518785, -0.3367538, 1.770422, 1, 0, 0.03529412, 1,
2.725273, -0.07731948, 0.3408295, 1, 0, 0.03137255, 1,
2.804857, 0.191728, 3.069173, 1, 0, 0.02352941, 1,
2.897489, 0.09100328, 2.891073, 1, 0, 0.01960784, 1,
3.155585, 0.2079283, 2.123781, 1, 0, 0.01176471, 1,
3.240908, 0.1406578, 1.598458, 1, 0, 0.007843138, 1
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
-0.2172095, -4.121527, -6.922291, 0, -0.5, 0.5, 0.5,
-0.2172095, -4.121527, -6.922291, 1, -0.5, 0.5, 0.5,
-0.2172095, -4.121527, -6.922291, 1, 1.5, 0.5, 0.5,
-0.2172095, -4.121527, -6.922291, 0, 1.5, 0.5, 0.5
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
-4.847629, 0.1892611, -6.922291, 0, -0.5, 0.5, 0.5,
-4.847629, 0.1892611, -6.922291, 1, -0.5, 0.5, 0.5,
-4.847629, 0.1892611, -6.922291, 1, 1.5, 0.5, 0.5,
-4.847629, 0.1892611, -6.922291, 0, 1.5, 0.5, 0.5
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
-4.847629, -4.121527, -0.0515945, 0, -0.5, 0.5, 0.5,
-4.847629, -4.121527, -0.0515945, 1, -0.5, 0.5, 0.5,
-4.847629, -4.121527, -0.0515945, 1, 1.5, 0.5, 0.5,
-4.847629, -4.121527, -0.0515945, 0, 1.5, 0.5, 0.5
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
-3, -3.12673, -5.336746,
3, -3.12673, -5.336746,
-3, -3.12673, -5.336746,
-3, -3.292529, -5.601003,
-2, -3.12673, -5.336746,
-2, -3.292529, -5.601003,
-1, -3.12673, -5.336746,
-1, -3.292529, -5.601003,
0, -3.12673, -5.336746,
0, -3.292529, -5.601003,
1, -3.12673, -5.336746,
1, -3.292529, -5.601003,
2, -3.12673, -5.336746,
2, -3.292529, -5.601003,
3, -3.12673, -5.336746,
3, -3.292529, -5.601003
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
-3, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
-3, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
-3, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
-3, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5,
-2, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
-2, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
-2, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
-2, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5,
-1, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
-1, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
-1, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
-1, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5,
0, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
0, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
0, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
0, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5,
1, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
1, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
1, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
1, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5,
2, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
2, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
2, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
2, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5,
3, -3.624128, -6.129519, 0, -0.5, 0.5, 0.5,
3, -3.624128, -6.129519, 1, -0.5, 0.5, 0.5,
3, -3.624128, -6.129519, 1, 1.5, 0.5, 0.5,
3, -3.624128, -6.129519, 0, 1.5, 0.5, 0.5
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
-3.779071, -3, -5.336746,
-3.779071, 3, -5.336746,
-3.779071, -3, -5.336746,
-3.957164, -3, -5.601003,
-3.779071, -2, -5.336746,
-3.957164, -2, -5.601003,
-3.779071, -1, -5.336746,
-3.957164, -1, -5.601003,
-3.779071, 0, -5.336746,
-3.957164, 0, -5.601003,
-3.779071, 1, -5.336746,
-3.957164, 1, -5.601003,
-3.779071, 2, -5.336746,
-3.957164, 2, -5.601003,
-3.779071, 3, -5.336746,
-3.957164, 3, -5.601003
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
-4.31335, -3, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, -3, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, -3, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, -3, -6.129519, 0, 1.5, 0.5, 0.5,
-4.31335, -2, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, -2, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, -2, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, -2, -6.129519, 0, 1.5, 0.5, 0.5,
-4.31335, -1, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, -1, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, -1, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, -1, -6.129519, 0, 1.5, 0.5, 0.5,
-4.31335, 0, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, 0, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, 0, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, 0, -6.129519, 0, 1.5, 0.5, 0.5,
-4.31335, 1, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, 1, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, 1, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, 1, -6.129519, 0, 1.5, 0.5, 0.5,
-4.31335, 2, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, 2, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, 2, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, 2, -6.129519, 0, 1.5, 0.5, 0.5,
-4.31335, 3, -6.129519, 0, -0.5, 0.5, 0.5,
-4.31335, 3, -6.129519, 1, -0.5, 0.5, 0.5,
-4.31335, 3, -6.129519, 1, 1.5, 0.5, 0.5,
-4.31335, 3, -6.129519, 0, 1.5, 0.5, 0.5
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
-3.779071, -3.12673, -4,
-3.779071, -3.12673, 4,
-3.779071, -3.12673, -4,
-3.957164, -3.292529, -4,
-3.779071, -3.12673, -2,
-3.957164, -3.292529, -2,
-3.779071, -3.12673, 0,
-3.957164, -3.292529, 0,
-3.779071, -3.12673, 2,
-3.957164, -3.292529, 2,
-3.779071, -3.12673, 4,
-3.957164, -3.292529, 4
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
-4.31335, -3.624128, -4, 0, -0.5, 0.5, 0.5,
-4.31335, -3.624128, -4, 1, -0.5, 0.5, 0.5,
-4.31335, -3.624128, -4, 1, 1.5, 0.5, 0.5,
-4.31335, -3.624128, -4, 0, 1.5, 0.5, 0.5,
-4.31335, -3.624128, -2, 0, -0.5, 0.5, 0.5,
-4.31335, -3.624128, -2, 1, -0.5, 0.5, 0.5,
-4.31335, -3.624128, -2, 1, 1.5, 0.5, 0.5,
-4.31335, -3.624128, -2, 0, 1.5, 0.5, 0.5,
-4.31335, -3.624128, 0, 0, -0.5, 0.5, 0.5,
-4.31335, -3.624128, 0, 1, -0.5, 0.5, 0.5,
-4.31335, -3.624128, 0, 1, 1.5, 0.5, 0.5,
-4.31335, -3.624128, 0, 0, 1.5, 0.5, 0.5,
-4.31335, -3.624128, 2, 0, -0.5, 0.5, 0.5,
-4.31335, -3.624128, 2, 1, -0.5, 0.5, 0.5,
-4.31335, -3.624128, 2, 1, 1.5, 0.5, 0.5,
-4.31335, -3.624128, 2, 0, 1.5, 0.5, 0.5,
-4.31335, -3.624128, 4, 0, -0.5, 0.5, 0.5,
-4.31335, -3.624128, 4, 1, -0.5, 0.5, 0.5,
-4.31335, -3.624128, 4, 1, 1.5, 0.5, 0.5,
-4.31335, -3.624128, 4, 0, 1.5, 0.5, 0.5
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
-3.779071, -3.12673, -5.336746,
-3.779071, 3.505252, -5.336746,
-3.779071, -3.12673, 5.233557,
-3.779071, 3.505252, 5.233557,
-3.779071, -3.12673, -5.336746,
-3.779071, -3.12673, 5.233557,
-3.779071, 3.505252, -5.336746,
-3.779071, 3.505252, 5.233557,
-3.779071, -3.12673, -5.336746,
3.344652, -3.12673, -5.336746,
-3.779071, -3.12673, 5.233557,
3.344652, -3.12673, 5.233557,
-3.779071, 3.505252, -5.336746,
3.344652, 3.505252, -5.336746,
-3.779071, 3.505252, 5.233557,
3.344652, 3.505252, 5.233557,
3.344652, -3.12673, -5.336746,
3.344652, 3.505252, -5.336746,
3.344652, -3.12673, 5.233557,
3.344652, 3.505252, 5.233557,
3.344652, -3.12673, -5.336746,
3.344652, -3.12673, 5.233557,
3.344652, 3.505252, -5.336746,
3.344652, 3.505252, 5.233557
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
var radius = 7.672651;
var distance = 34.13649;
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
mvMatrix.translate( 0.2172095, -0.1892611, 0.0515945 );
mvMatrix.scale( 1.164534, 1.250881, 0.7848234 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13649);
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
Telar<-read.table("Telar.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Telar$V2
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
```

```r
y<-Telar$V3
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
```

```r
z<-Telar$V4
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
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
-3.675327, -1.395822, -0.7909606, 0, 0, 1, 1, 1,
-3.240114, -0.2471763, -2.41652, 1, 0, 0, 1, 1,
-3.086925, -0.2615886, 0.645158, 1, 0, 0, 1, 1,
-3.02295, 0.2772311, -0.9820891, 1, 0, 0, 1, 1,
-2.882648, -1.212077, -1.721904, 1, 0, 0, 1, 1,
-2.845781, -1.063349, -1.395577, 1, 0, 0, 1, 1,
-2.829515, 0.6762964, -2.530316, 0, 0, 0, 1, 1,
-2.654237, -0.7406772, -1.316097, 0, 0, 0, 1, 1,
-2.636881, -0.2032855, -2.147773, 0, 0, 0, 1, 1,
-2.578108, -0.6302305, -3.070984, 0, 0, 0, 1, 1,
-2.460585, 1.22427, -0.7452214, 0, 0, 0, 1, 1,
-2.457775, -0.4495258, -0.8622022, 0, 0, 0, 1, 1,
-2.388809, 1.299638, -0.2836865, 0, 0, 0, 1, 1,
-2.371169, -1.525793, -1.531949, 1, 1, 1, 1, 1,
-2.281656, -0.5935784, -2.470458, 1, 1, 1, 1, 1,
-2.249344, -0.1507398, -1.038274, 1, 1, 1, 1, 1,
-2.231047, -1.867952, -0.9540299, 1, 1, 1, 1, 1,
-2.182799, 1.170516, -0.9575413, 1, 1, 1, 1, 1,
-2.180642, 0.8956068, -2.248016, 1, 1, 1, 1, 1,
-2.173129, -0.4460154, -1.56632, 1, 1, 1, 1, 1,
-2.151127, 0.5626671, -2.044837, 1, 1, 1, 1, 1,
-2.144121, 0.1248964, -0.813683, 1, 1, 1, 1, 1,
-2.039271, -0.3369955, -2.358483, 1, 1, 1, 1, 1,
-2.006588, 0.8915702, -0.8797948, 1, 1, 1, 1, 1,
-2.000656, 0.1311665, -1.567045, 1, 1, 1, 1, 1,
-1.990875, -0.9040525, -2.335696, 1, 1, 1, 1, 1,
-1.984158, 1.430361, -1.2079, 1, 1, 1, 1, 1,
-1.982957, -0.774696, -1.995777, 1, 1, 1, 1, 1,
-1.975392, -0.1714668, -1.631022, 0, 0, 1, 1, 1,
-1.975327, 0.2652859, -1.585433, 1, 0, 0, 1, 1,
-1.95276, -0.3963374, -3.06278, 1, 0, 0, 1, 1,
-1.949452, 1.366289, -0.8784252, 1, 0, 0, 1, 1,
-1.93502, 1.145308, -1.78561, 1, 0, 0, 1, 1,
-1.880356, -0.3960391, -0.8902053, 1, 0, 0, 1, 1,
-1.877069, 0.9775589, -0.586417, 0, 0, 0, 1, 1,
-1.868998, -1.52232, -2.751388, 0, 0, 0, 1, 1,
-1.861901, 0.01281232, -1.579047, 0, 0, 0, 1, 1,
-1.854549, -1.734158, -2.79163, 0, 0, 0, 1, 1,
-1.843508, 0.1489429, -1.683982, 0, 0, 0, 1, 1,
-1.829016, -0.8950977, -1.701604, 0, 0, 0, 1, 1,
-1.821489, 0.3986825, -2.542918, 0, 0, 0, 1, 1,
-1.811773, -1.475569, -2.524642, 1, 1, 1, 1, 1,
-1.808911, 0.5695682, -0.2811761, 1, 1, 1, 1, 1,
-1.793477, -1.525647, -0.4493852, 1, 1, 1, 1, 1,
-1.787008, -1.898662, -2.283558, 1, 1, 1, 1, 1,
-1.783987, -1.690329, -2.679302, 1, 1, 1, 1, 1,
-1.778566, 0.7283531, -1.040101, 1, 1, 1, 1, 1,
-1.761462, -0.77273, -0.6603253, 1, 1, 1, 1, 1,
-1.756179, -0.5738282, -2.216094, 1, 1, 1, 1, 1,
-1.747912, -1.206607, -3.015351, 1, 1, 1, 1, 1,
-1.740498, -0.2571787, -1.211541, 1, 1, 1, 1, 1,
-1.712576, -0.6975627, -1.788224, 1, 1, 1, 1, 1,
-1.70273, -0.902588, -2.911685, 1, 1, 1, 1, 1,
-1.696214, 0.4203108, -2.699059, 1, 1, 1, 1, 1,
-1.68631, 0.2553066, -0.6565097, 1, 1, 1, 1, 1,
-1.680686, -0.211128, -2.082657, 1, 1, 1, 1, 1,
-1.679587, -0.3241464, -2.279208, 0, 0, 1, 1, 1,
-1.678552, -0.5936841, -4.280747, 1, 0, 0, 1, 1,
-1.670189, -1.351452, -1.534607, 1, 0, 0, 1, 1,
-1.652178, 0.1987128, -0.8251166, 1, 0, 0, 1, 1,
-1.64147, -0.02015019, -2.163429, 1, 0, 0, 1, 1,
-1.634092, 0.7883828, -1.833561, 1, 0, 0, 1, 1,
-1.632938, 0.1227491, -1.681951, 0, 0, 0, 1, 1,
-1.615389, -0.5132481, -2.079945, 0, 0, 0, 1, 1,
-1.613511, -2.059478, -2.069594, 0, 0, 0, 1, 1,
-1.609753, 0.9096003, -1.457659, 0, 0, 0, 1, 1,
-1.600159, 0.2847411, -1.660987, 0, 0, 0, 1, 1,
-1.595199, 0.6375944, -1.708708, 0, 0, 0, 1, 1,
-1.590433, 0.1798879, -1.923077, 0, 0, 0, 1, 1,
-1.588273, 0.2565905, -1.740551, 1, 1, 1, 1, 1,
-1.586307, -1.394388, -1.869075, 1, 1, 1, 1, 1,
-1.583601, 0.7888067, -1.938165, 1, 1, 1, 1, 1,
-1.566142, 0.3872662, -3.142417, 1, 1, 1, 1, 1,
-1.556126, 0.1781854, -1.484254, 1, 1, 1, 1, 1,
-1.536758, -0.6392776, -0.410377, 1, 1, 1, 1, 1,
-1.535412, 1.180508, -1.689062, 1, 1, 1, 1, 1,
-1.528228, -0.9773692, -1.625349, 1, 1, 1, 1, 1,
-1.521836, 0.7286736, 0.0391278, 1, 1, 1, 1, 1,
-1.517605, 0.6154889, -1.105571, 1, 1, 1, 1, 1,
-1.497525, -1.106926, -1.598348, 1, 1, 1, 1, 1,
-1.493948, 1.306429, -2.64997, 1, 1, 1, 1, 1,
-1.483187, 2.249605, 0.5775293, 1, 1, 1, 1, 1,
-1.48271, 0.3835548, -0.9705433, 1, 1, 1, 1, 1,
-1.476265, 0.4727381, -1.192473, 1, 1, 1, 1, 1,
-1.463822, -0.7918343, -1.425482, 0, 0, 1, 1, 1,
-1.452371, 1.00273, 0.003402384, 1, 0, 0, 1, 1,
-1.44814, -1.395353, -2.560969, 1, 0, 0, 1, 1,
-1.447573, -0.3458922, -2.401364, 1, 0, 0, 1, 1,
-1.43073, -0.355448, -2.502249, 1, 0, 0, 1, 1,
-1.427741, 0.912922, 0.5630496, 1, 0, 0, 1, 1,
-1.424845, 1.165788, -1.574146, 0, 0, 0, 1, 1,
-1.41609, 1.40076, -0.5417004, 0, 0, 0, 1, 1,
-1.414001, -0.6400729, -2.102283, 0, 0, 0, 1, 1,
-1.408318, 1.174352, -0.3856686, 0, 0, 0, 1, 1,
-1.405823, -0.3642725, -3.268593, 0, 0, 0, 1, 1,
-1.39801, -0.8927541, -1.894027, 0, 0, 0, 1, 1,
-1.392191, -0.4145099, -1.770909, 0, 0, 0, 1, 1,
-1.390497, -0.3594505, -1.174082, 1, 1, 1, 1, 1,
-1.389645, 0.937461, -0.3961366, 1, 1, 1, 1, 1,
-1.386396, -0.7841958, -3.519007, 1, 1, 1, 1, 1,
-1.373828, -0.2201105, -1.29284, 1, 1, 1, 1, 1,
-1.373198, -0.4175642, -2.969636, 1, 1, 1, 1, 1,
-1.370952, -1.322124, -2.734551, 1, 1, 1, 1, 1,
-1.366073, 0.1395799, -1.950337, 1, 1, 1, 1, 1,
-1.343197, 0.5401488, 0.0280384, 1, 1, 1, 1, 1,
-1.328603, -1.315482, -0.3420663, 1, 1, 1, 1, 1,
-1.327644, 0.1501961, -0.8835237, 1, 1, 1, 1, 1,
-1.320795, 0.4196622, 0.5224898, 1, 1, 1, 1, 1,
-1.320603, 1.443155, -1.001782, 1, 1, 1, 1, 1,
-1.314128, -0.5240461, -2.013202, 1, 1, 1, 1, 1,
-1.312946, 0.1772432, -1.8917, 1, 1, 1, 1, 1,
-1.302733, 0.2431593, -1.370762, 1, 1, 1, 1, 1,
-1.302732, -0.04348881, -3.121835, 0, 0, 1, 1, 1,
-1.298746, 0.3441011, -1.617952, 1, 0, 0, 1, 1,
-1.289344, 1.804913, 1.591995, 1, 0, 0, 1, 1,
-1.285274, 0.4679343, -0.2536447, 1, 0, 0, 1, 1,
-1.284502, 0.8564066, -0.7636354, 1, 0, 0, 1, 1,
-1.280676, -0.5013997, -3.268704, 1, 0, 0, 1, 1,
-1.275573, -1.268542, -1.844366, 0, 0, 0, 1, 1,
-1.270615, 0.01060624, -0.8298776, 0, 0, 0, 1, 1,
-1.267456, 0.5119452, -1.208878, 0, 0, 0, 1, 1,
-1.266709, -0.3619387, -1.26429, 0, 0, 0, 1, 1,
-1.264825, 0.2892655, -2.260477, 0, 0, 0, 1, 1,
-1.253457, 0.597312, -0.9312383, 0, 0, 0, 1, 1,
-1.253035, -0.1403077, -0.3561724, 0, 0, 0, 1, 1,
-1.251997, -0.1297, -1.34966, 1, 1, 1, 1, 1,
-1.249741, -0.900412, -2.410399, 1, 1, 1, 1, 1,
-1.247155, 2.013431, 0.4233968, 1, 1, 1, 1, 1,
-1.244635, 0.6247644, -2.013508, 1, 1, 1, 1, 1,
-1.244604, -1.139535, -1.18145, 1, 1, 1, 1, 1,
-1.23713, 0.2510203, -1.526732, 1, 1, 1, 1, 1,
-1.236923, 0.7427934, -2.480756, 1, 1, 1, 1, 1,
-1.229916, 0.822358, 0.06960643, 1, 1, 1, 1, 1,
-1.229031, 0.8639139, -2.999892, 1, 1, 1, 1, 1,
-1.227539, -0.6320807, -3.068406, 1, 1, 1, 1, 1,
-1.220263, 1.177292, -1.188095, 1, 1, 1, 1, 1,
-1.219924, -0.8915368, -3.121045, 1, 1, 1, 1, 1,
-1.211011, 1.585415, -0.1835535, 1, 1, 1, 1, 1,
-1.204026, -0.08830978, -0.7363371, 1, 1, 1, 1, 1,
-1.203228, -0.04521281, -3.409986, 1, 1, 1, 1, 1,
-1.1949, 0.1993647, -2.77502, 0, 0, 1, 1, 1,
-1.192734, 1.297338, 0.3496137, 1, 0, 0, 1, 1,
-1.184989, -0.6769841, -1.151741, 1, 0, 0, 1, 1,
-1.171467, 0.1385815, -1.89758, 1, 0, 0, 1, 1,
-1.16793, -0.5549827, -0.2182703, 1, 0, 0, 1, 1,
-1.16406, -2.976187, -2.354147, 1, 0, 0, 1, 1,
-1.155883, 0.4042396, -1.854837, 0, 0, 0, 1, 1,
-1.154585, 1.022123, -0.03818325, 0, 0, 0, 1, 1,
-1.138811, -0.9474064, -1.479101, 0, 0, 0, 1, 1,
-1.137383, -0.584985, -1.769346, 0, 0, 0, 1, 1,
-1.136002, 0.418443, -1.603249, 0, 0, 0, 1, 1,
-1.13132, -0.988339, -1.592535, 0, 0, 0, 1, 1,
-1.129146, 0.1170683, -2.15468, 0, 0, 0, 1, 1,
-1.122371, 0.3057292, 0.1192822, 1, 1, 1, 1, 1,
-1.122089, 0.5463764, -2.57005, 1, 1, 1, 1, 1,
-1.116652, -0.139571, -0.1779517, 1, 1, 1, 1, 1,
-1.114907, 0.9406424, -1.87701, 1, 1, 1, 1, 1,
-1.114873, 2.039829, 2.175304, 1, 1, 1, 1, 1,
-1.112182, 0.580934, -0.2353037, 1, 1, 1, 1, 1,
-1.111205, -0.2281263, -3.108059, 1, 1, 1, 1, 1,
-1.110542, 0.8092285, -1.221749, 1, 1, 1, 1, 1,
-1.108227, -0.2646826, -2.026363, 1, 1, 1, 1, 1,
-1.102222, -1.10453, -3.144159, 1, 1, 1, 1, 1,
-1.099046, -0.05614069, -1.262959, 1, 1, 1, 1, 1,
-1.094186, 1.032963, -0.8505575, 1, 1, 1, 1, 1,
-1.088449, 0.9952558, 2.167897, 1, 1, 1, 1, 1,
-1.082615, -0.4262294, -3.704169, 1, 1, 1, 1, 1,
-1.081344, 2.253065, -0.9893832, 1, 1, 1, 1, 1,
-1.066977, -2.024359, -1.557893, 0, 0, 1, 1, 1,
-1.062274, -0.294774, -2.912884, 1, 0, 0, 1, 1,
-1.05281, -0.04276232, -3.32137, 1, 0, 0, 1, 1,
-1.051646, -0.9557835, -2.347333, 1, 0, 0, 1, 1,
-1.051339, -0.6792583, -3.25863, 1, 0, 0, 1, 1,
-1.045284, -0.50497, -1.383509, 1, 0, 0, 1, 1,
-1.044745, 0.2234437, 0.05649067, 0, 0, 0, 1, 1,
-1.044654, 0.09511343, -1.989401, 0, 0, 0, 1, 1,
-1.040123, 0.6154473, -1.647112, 0, 0, 0, 1, 1,
-1.028473, -0.6981763, -4.453893, 0, 0, 0, 1, 1,
-1.028269, -0.2422601, -2.282809, 0, 0, 0, 1, 1,
-1.022083, -0.05611213, -2.465434, 0, 0, 0, 1, 1,
-1.019661, 0.2621054, -1.323294, 0, 0, 0, 1, 1,
-1.012277, -0.8533232, -1.661036, 1, 1, 1, 1, 1,
-1.011591, -0.1260065, -0.1146653, 1, 1, 1, 1, 1,
-1.011524, -0.06055299, -0.7712883, 1, 1, 1, 1, 1,
-1.0078, -0.5629802, -2.607713, 1, 1, 1, 1, 1,
-0.9973946, -0.4352531, -2.927617, 1, 1, 1, 1, 1,
-0.9943656, 1.554041, -2.385638, 1, 1, 1, 1, 1,
-0.9853155, -1.879723, -1.255774, 1, 1, 1, 1, 1,
-0.9842075, 0.3248883, -1.002911, 1, 1, 1, 1, 1,
-0.9768093, -1.671324, -2.771523, 1, 1, 1, 1, 1,
-0.9640337, -0.6854965, -2.228724, 1, 1, 1, 1, 1,
-0.9631663, -0.04646056, -2.030644, 1, 1, 1, 1, 1,
-0.9624868, 0.6826758, -2.694062, 1, 1, 1, 1, 1,
-0.9614937, 0.9435408, -0.2284349, 1, 1, 1, 1, 1,
-0.9596334, -2.486208, -3.955989, 1, 1, 1, 1, 1,
-0.9588627, -0.1884422, -2.091994, 1, 1, 1, 1, 1,
-0.9565215, -0.0420507, -0.2676176, 0, 0, 1, 1, 1,
-0.9547344, -0.9360937, -2.802732, 1, 0, 0, 1, 1,
-0.9545411, 1.303305, -0.9468442, 1, 0, 0, 1, 1,
-0.9535514, 0.1741698, -0.9547373, 1, 0, 0, 1, 1,
-0.9511275, 1.3282, 0.7182027, 1, 0, 0, 1, 1,
-0.9502147, -0.7451653, -1.636215, 1, 0, 0, 1, 1,
-0.9493868, -0.2601236, -1.203554, 0, 0, 0, 1, 1,
-0.948525, -1.511839, -2.027063, 0, 0, 0, 1, 1,
-0.9477764, -0.4551178, -1.985681, 0, 0, 0, 1, 1,
-0.9462742, -0.7010694, -3.032104, 0, 0, 0, 1, 1,
-0.9455687, -0.6986399, -2.471135, 0, 0, 0, 1, 1,
-0.9409248, 1.011061, 0.7895536, 0, 0, 0, 1, 1,
-0.9394256, 0.05919947, -2.061749, 0, 0, 0, 1, 1,
-0.9360232, -0.9106541, -4.496719, 1, 1, 1, 1, 1,
-0.9329599, 0.08049688, -1.817602, 1, 1, 1, 1, 1,
-0.9309522, -1.214662, -2.088133, 1, 1, 1, 1, 1,
-0.9235312, -0.5976589, -1.672809, 1, 1, 1, 1, 1,
-0.9088559, -0.8402743, -2.153959, 1, 1, 1, 1, 1,
-0.9016214, 1.01032, -1.191052, 1, 1, 1, 1, 1,
-0.9010513, 0.4866948, -1.721024, 1, 1, 1, 1, 1,
-0.8991771, -1.695923, -1.073216, 1, 1, 1, 1, 1,
-0.8929202, 0.4471708, -1.835994, 1, 1, 1, 1, 1,
-0.8922146, -0.8494506, -2.87978, 1, 1, 1, 1, 1,
-0.8881477, 1.104303, -0.8869422, 1, 1, 1, 1, 1,
-0.8879932, 1.632398, -1.024439, 1, 1, 1, 1, 1,
-0.8852364, -0.2292958, -1.689333, 1, 1, 1, 1, 1,
-0.8844634, 1.707716, 0.3476703, 1, 1, 1, 1, 1,
-0.8799059, 1.582779, 0.8052368, 1, 1, 1, 1, 1,
-0.8776745, -1.005713, -3.598694, 0, 0, 1, 1, 1,
-0.8771245, -0.1034508, -1.530297, 1, 0, 0, 1, 1,
-0.8737686, -0.2831935, -2.574658, 1, 0, 0, 1, 1,
-0.8717802, -0.07611987, -1.83272, 1, 0, 0, 1, 1,
-0.8648588, 1.025511, -0.5390597, 1, 0, 0, 1, 1,
-0.863774, -0.4859092, -1.565977, 1, 0, 0, 1, 1,
-0.8637529, 0.9601662, -2.095806, 0, 0, 0, 1, 1,
-0.8615509, -0.8130165, -0.9783984, 0, 0, 0, 1, 1,
-0.8595428, -0.2016875, -2.358337, 0, 0, 0, 1, 1,
-0.8582903, 1.135543, -0.7118551, 0, 0, 0, 1, 1,
-0.8425849, 0.4553661, -1.375349, 0, 0, 0, 1, 1,
-0.8420768, 0.1611564, -4.199502, 0, 0, 0, 1, 1,
-0.839758, -0.5574263, -2.556679, 0, 0, 0, 1, 1,
-0.8377907, -0.7093524, -1.175769, 1, 1, 1, 1, 1,
-0.8375723, -0.1470461, -4.476968, 1, 1, 1, 1, 1,
-0.836942, 0.2627207, -1.148176, 1, 1, 1, 1, 1,
-0.8351103, -0.008736077, 0.6317514, 1, 1, 1, 1, 1,
-0.8267183, -0.9042864, -1.981227, 1, 1, 1, 1, 1,
-0.8250139, -1.152339, -2.2838, 1, 1, 1, 1, 1,
-0.8230724, 0.1294956, -2.192332, 1, 1, 1, 1, 1,
-0.8183483, 0.1967382, -1.72167, 1, 1, 1, 1, 1,
-0.8154317, -0.9824784, -3.477133, 1, 1, 1, 1, 1,
-0.8042282, 0.7492346, -2.940844, 1, 1, 1, 1, 1,
-0.8041993, -1.366276, -1.61976, 1, 1, 1, 1, 1,
-0.7932767, -0.9065815, -3.960964, 1, 1, 1, 1, 1,
-0.7910764, 0.8428357, -0.3808278, 1, 1, 1, 1, 1,
-0.7858782, -0.7956434, -1.476116, 1, 1, 1, 1, 1,
-0.7827335, -0.1849843, -1.264028, 1, 1, 1, 1, 1,
-0.778066, 2.177057, 0.1928831, 0, 0, 1, 1, 1,
-0.7725446, 0.02482084, -1.947952, 1, 0, 0, 1, 1,
-0.7697085, 1.138225, -2.608179, 1, 0, 0, 1, 1,
-0.760302, -1.181371, -1.794484, 1, 0, 0, 1, 1,
-0.7600227, 0.4155659, -1.429033, 1, 0, 0, 1, 1,
-0.7458708, 0.3442816, -2.013762, 1, 0, 0, 1, 1,
-0.7444215, 0.2651437, -0.4031782, 0, 0, 0, 1, 1,
-0.7399873, -0.2479312, -3.707065, 0, 0, 0, 1, 1,
-0.7377688, -1.881909, -3.787557, 0, 0, 0, 1, 1,
-0.7326006, -1.124233, -1.22307, 0, 0, 0, 1, 1,
-0.7180788, 1.42826, 1.394146, 0, 0, 0, 1, 1,
-0.7180364, -0.2857566, -1.069564, 0, 0, 0, 1, 1,
-0.7180056, 0.3314259, 0.4718803, 0, 0, 0, 1, 1,
-0.7154623, -0.6762379, -3.842548, 1, 1, 1, 1, 1,
-0.7146582, -0.4392208, -2.048208, 1, 1, 1, 1, 1,
-0.7086233, -0.7153128, -3.204229, 1, 1, 1, 1, 1,
-0.708258, 1.47154, 0.3727037, 1, 1, 1, 1, 1,
-0.7078608, 0.1450305, -1.882537, 1, 1, 1, 1, 1,
-0.7074829, -0.8789333, -1.490147, 1, 1, 1, 1, 1,
-0.7046729, -0.1003071, -2.827101, 1, 1, 1, 1, 1,
-0.7030503, -1.347229, -3.0879, 1, 1, 1, 1, 1,
-0.7017553, 0.6461137, -0.08281789, 1, 1, 1, 1, 1,
-0.7006258, 0.2562951, -2.332013, 1, 1, 1, 1, 1,
-0.6879317, -0.09416953, -1.49764, 1, 1, 1, 1, 1,
-0.6869364, 0.194555, -0.4649893, 1, 1, 1, 1, 1,
-0.686565, 0.244166, -2.606015, 1, 1, 1, 1, 1,
-0.6758991, -0.5193405, -2.732016, 1, 1, 1, 1, 1,
-0.6622722, -0.5125971, -3.505836, 1, 1, 1, 1, 1,
-0.6579626, -1.69397, -2.895581, 0, 0, 1, 1, 1,
-0.655476, 0.3112381, -1.451885, 1, 0, 0, 1, 1,
-0.6498471, 0.2564133, -0.3273739, 1, 0, 0, 1, 1,
-0.6445877, -0.9394926, -1.0169, 1, 0, 0, 1, 1,
-0.643797, 0.05316821, -0.04467513, 1, 0, 0, 1, 1,
-0.6386769, -1.503667, -2.308367, 1, 0, 0, 1, 1,
-0.63811, -0.9268777, -2.269123, 0, 0, 0, 1, 1,
-0.6360949, -0.1649361, -2.611974, 0, 0, 0, 1, 1,
-0.6347441, -0.04464416, -2.409676, 0, 0, 0, 1, 1,
-0.6312385, 0.3307686, 0.7293438, 0, 0, 0, 1, 1,
-0.62744, -1.077467, -2.627379, 0, 0, 0, 1, 1,
-0.6273744, -1.41649, -2.616667, 0, 0, 0, 1, 1,
-0.6273137, -1.128652, -1.907274, 0, 0, 0, 1, 1,
-0.6226238, -0.1256991, -0.8191834, 1, 1, 1, 1, 1,
-0.6221355, 0.6940569, -0.1361753, 1, 1, 1, 1, 1,
-0.6165633, 0.3288781, -1.957205, 1, 1, 1, 1, 1,
-0.6126805, -0.9500688, -2.112903, 1, 1, 1, 1, 1,
-0.6106143, 1.209128, -0.9601166, 1, 1, 1, 1, 1,
-0.6058415, 2.361081, 0.1129046, 1, 1, 1, 1, 1,
-0.6054189, 0.5517046, -1.211352, 1, 1, 1, 1, 1,
-0.6019416, 0.2463182, -0.0485761, 1, 1, 1, 1, 1,
-0.5998878, -0.5130476, -1.453358, 1, 1, 1, 1, 1,
-0.599152, -0.4682961, -2.314467, 1, 1, 1, 1, 1,
-0.594393, 0.1366721, -1.726863, 1, 1, 1, 1, 1,
-0.5880839, -0.9189932, -3.794322, 1, 1, 1, 1, 1,
-0.5876873, -0.392657, -1.684576, 1, 1, 1, 1, 1,
-0.5830489, 0.2014269, -2.390694, 1, 1, 1, 1, 1,
-0.5820432, -0.4915157, -0.8616518, 1, 1, 1, 1, 1,
-0.580839, -1.20849, -2.510804, 0, 0, 1, 1, 1,
-0.574465, -0.9009282, -2.784875, 1, 0, 0, 1, 1,
-0.5723773, -0.7987181, -3.042549, 1, 0, 0, 1, 1,
-0.5722904, -0.211113, -3.090821, 1, 0, 0, 1, 1,
-0.5650698, -0.03193891, -2.207581, 1, 0, 0, 1, 1,
-0.5613526, 0.4396841, -1.199415, 1, 0, 0, 1, 1,
-0.559918, 0.2750854, -0.05308031, 0, 0, 0, 1, 1,
-0.5569216, 1.73491, -1.688187, 0, 0, 0, 1, 1,
-0.5519749, 0.4833946, -0.7371655, 0, 0, 0, 1, 1,
-0.5472813, 1.450115, -0.2585842, 0, 0, 0, 1, 1,
-0.5453513, -1.755447, -4.049723, 0, 0, 0, 1, 1,
-0.5401809, 0.6490877, -0.2243773, 0, 0, 0, 1, 1,
-0.5391374, 0.220163, -1.15071, 0, 0, 0, 1, 1,
-0.5364385, 0.2065173, 0.1787089, 1, 1, 1, 1, 1,
-0.5333727, -0.9743986, -0.07675452, 1, 1, 1, 1, 1,
-0.5320811, 0.6714392, -1.260463, 1, 1, 1, 1, 1,
-0.5305262, 0.378081, -0.5763703, 1, 1, 1, 1, 1,
-0.5284873, 0.302074, -0.8013812, 1, 1, 1, 1, 1,
-0.5225608, -0.98876, -3.822912, 1, 1, 1, 1, 1,
-0.5215515, 1.003724, 0.6365134, 1, 1, 1, 1, 1,
-0.5169657, 1.483042, -1.818763, 1, 1, 1, 1, 1,
-0.5135961, 0.6940549, -1.541402, 1, 1, 1, 1, 1,
-0.5119382, -1.078708, -2.324055, 1, 1, 1, 1, 1,
-0.5071809, 0.5395623, -0.2619418, 1, 1, 1, 1, 1,
-0.506039, -0.7600955, -3.414344, 1, 1, 1, 1, 1,
-0.5051698, 0.5162867, -1.648968, 1, 1, 1, 1, 1,
-0.5027526, -1.473095, -2.749197, 1, 1, 1, 1, 1,
-0.4988859, 0.3968302, -0.6416996, 1, 1, 1, 1, 1,
-0.4937928, -1.064384, -1.626993, 0, 0, 1, 1, 1,
-0.4917094, -0.08027251, -1.887613, 1, 0, 0, 1, 1,
-0.4892187, -0.370102, -1.795342, 1, 0, 0, 1, 1,
-0.4863788, 1.609314, -1.628735, 1, 0, 0, 1, 1,
-0.485643, -0.5267431, -1.94304, 1, 0, 0, 1, 1,
-0.4843781, 0.7025553, -0.3477058, 1, 0, 0, 1, 1,
-0.4817197, -1.254171, -3.492753, 0, 0, 0, 1, 1,
-0.4684163, 0.0001844203, -2.062915, 0, 0, 0, 1, 1,
-0.4677642, 0.2653897, -2.177945, 0, 0, 0, 1, 1,
-0.4671259, -0.7546342, -3.322471, 0, 0, 0, 1, 1,
-0.465575, 0.147305, -0.211796, 0, 0, 0, 1, 1,
-0.4639043, -0.1546741, -1.204636, 0, 0, 0, 1, 1,
-0.4607008, -0.2114317, 0.3659595, 0, 0, 0, 1, 1,
-0.459902, -1.718669, -3.062884, 1, 1, 1, 1, 1,
-0.4552375, 0.2371732, -1.795229, 1, 1, 1, 1, 1,
-0.4542493, 0.1815023, -0.6224409, 1, 1, 1, 1, 1,
-0.453971, 0.5407419, -0.4599681, 1, 1, 1, 1, 1,
-0.4535173, 0.1834674, -1.29231, 1, 1, 1, 1, 1,
-0.4515119, -0.4364582, -1.792191, 1, 1, 1, 1, 1,
-0.4494007, 1.564665, -0.1796787, 1, 1, 1, 1, 1,
-0.4492545, -0.6844723, -2.863098, 1, 1, 1, 1, 1,
-0.4446637, -0.2311853, -3.929823, 1, 1, 1, 1, 1,
-0.4424749, 0.03310346, -0.8182898, 1, 1, 1, 1, 1,
-0.4323427, 0.7517607, -0.8966675, 1, 1, 1, 1, 1,
-0.4238703, 2.230838, -0.8123173, 1, 1, 1, 1, 1,
-0.4234056, 0.02413827, -2.502093, 1, 1, 1, 1, 1,
-0.4192275, 1.702424, -1.004956, 1, 1, 1, 1, 1,
-0.4180965, 1.236596, 0.03525616, 1, 1, 1, 1, 1,
-0.4177354, -1.277934, -1.775833, 0, 0, 1, 1, 1,
-0.4139346, -0.1065529, -1.031676, 1, 0, 0, 1, 1,
-0.4120989, 0.1406164, -1.860094, 1, 0, 0, 1, 1,
-0.4110689, 0.100635, -1.644137, 1, 0, 0, 1, 1,
-0.4086611, -0.7022086, -2.253692, 1, 0, 0, 1, 1,
-0.4035762, 1.949113, 1.130738, 1, 0, 0, 1, 1,
-0.4023879, -0.5208224, -2.256729, 0, 0, 0, 1, 1,
-0.3986676, -0.9698805, -2.726041, 0, 0, 0, 1, 1,
-0.3965636, 0.9246695, -0.1188577, 0, 0, 0, 1, 1,
-0.3923661, 1.017973, -1.875489, 0, 0, 0, 1, 1,
-0.3846728, 0.5665722, 0.2538513, 0, 0, 0, 1, 1,
-0.3839653, -1.701311, -5.182809, 0, 0, 0, 1, 1,
-0.3837561, -0.4406632, -4.759329, 0, 0, 0, 1, 1,
-0.3804956, 0.5715756, 1.016245, 1, 1, 1, 1, 1,
-0.3801847, 2.567622, 0.4406083, 1, 1, 1, 1, 1,
-0.3799235, 0.3438695, -0.2663273, 1, 1, 1, 1, 1,
-0.3731646, 0.6342318, -0.8553396, 1, 1, 1, 1, 1,
-0.3718567, -0.6471372, -2.815232, 1, 1, 1, 1, 1,
-0.3695787, 0.0011723, -0.4671531, 1, 1, 1, 1, 1,
-0.3677727, 0.3954858, -1.294218, 1, 1, 1, 1, 1,
-0.3662274, 0.1337614, -1.533914, 1, 1, 1, 1, 1,
-0.3632956, 0.6287513, -2.25086, 1, 1, 1, 1, 1,
-0.3535095, 0.07517258, -0.4894627, 1, 1, 1, 1, 1,
-0.3509332, 0.4394571, -0.7186172, 1, 1, 1, 1, 1,
-0.3505663, -0.05291254, -1.928305, 1, 1, 1, 1, 1,
-0.3495742, 0.6267883, -1.511955, 1, 1, 1, 1, 1,
-0.345344, 0.2428638, 0.09653426, 1, 1, 1, 1, 1,
-0.3442087, 0.7643825, -1.631036, 1, 1, 1, 1, 1,
-0.3421544, -1.927614, -0.9901543, 0, 0, 1, 1, 1,
-0.3370438, -0.2184635, -3.053448, 1, 0, 0, 1, 1,
-0.333969, 2.318162, -0.5186973, 1, 0, 0, 1, 1,
-0.3332181, -0.1097904, -3.378716, 1, 0, 0, 1, 1,
-0.3312699, -0.7730458, -3.301553, 1, 0, 0, 1, 1,
-0.3268423, 0.1007782, -0.9193658, 1, 0, 0, 1, 1,
-0.3267447, -0.3692532, -1.440284, 0, 0, 0, 1, 1,
-0.3260109, -0.041394, -2.614359, 0, 0, 0, 1, 1,
-0.3254449, -0.2108725, -1.931319, 0, 0, 0, 1, 1,
-0.3249362, 0.461066, -0.9342291, 0, 0, 0, 1, 1,
-0.3225714, 1.725941, 0.2740579, 0, 0, 0, 1, 1,
-0.3222156, 0.2997597, 0.3021817, 0, 0, 0, 1, 1,
-0.3197035, -1.220619, -2.331525, 0, 0, 0, 1, 1,
-0.3196137, 0.8198981, -1.080906, 1, 1, 1, 1, 1,
-0.3152402, -0.8300792, -1.519534, 1, 1, 1, 1, 1,
-0.3131458, -0.7618654, -2.691454, 1, 1, 1, 1, 1,
-0.3124634, -0.5197682, -4.528329, 1, 1, 1, 1, 1,
-0.3077154, -0.4689735, -2.778288, 1, 1, 1, 1, 1,
-0.3074046, -1.682006, -2.549248, 1, 1, 1, 1, 1,
-0.3012376, -0.02981227, -2.589827, 1, 1, 1, 1, 1,
-0.2996971, -0.5811946, -2.573032, 1, 1, 1, 1, 1,
-0.2996514, 0.3567185, -1.588856, 1, 1, 1, 1, 1,
-0.2959072, 1.174538, -1.684603, 1, 1, 1, 1, 1,
-0.2953313, 1.445897, -0.4315327, 1, 1, 1, 1, 1,
-0.2880016, 0.6342297, 0.2440767, 1, 1, 1, 1, 1,
-0.2865261, -0.7947705, -2.622278, 1, 1, 1, 1, 1,
-0.2846693, -0.6746199, -1.838165, 1, 1, 1, 1, 1,
-0.2843809, 0.9260241, 0.5000273, 1, 1, 1, 1, 1,
-0.2792175, -0.399747, -2.617372, 0, 0, 1, 1, 1,
-0.2791774, 0.7671643, -1.661126, 1, 0, 0, 1, 1,
-0.2733322, 0.471743, -1.030569, 1, 0, 0, 1, 1,
-0.2702423, -0.177618, -2.264028, 1, 0, 0, 1, 1,
-0.2690983, 0.9218222, -2.007678, 1, 0, 0, 1, 1,
-0.2673023, 0.3055858, -0.282865, 1, 0, 0, 1, 1,
-0.2615791, 0.3772412, -0.02297335, 0, 0, 0, 1, 1,
-0.2608315, 1.000641, 1.850032, 0, 0, 0, 1, 1,
-0.258843, -0.1805949, -1.596962, 0, 0, 0, 1, 1,
-0.2570317, 0.2331725, -2.866526, 0, 0, 0, 1, 1,
-0.2549953, 0.8158658, -1.020108, 0, 0, 0, 1, 1,
-0.2494841, 0.05521721, -2.110334, 0, 0, 0, 1, 1,
-0.2466546, 0.8750077, -0.08218279, 0, 0, 0, 1, 1,
-0.2406271, -0.0558802, -1.868003, 1, 1, 1, 1, 1,
-0.2404482, -0.2790348, -2.050423, 1, 1, 1, 1, 1,
-0.2362565, -0.4020573, -4.440443, 1, 1, 1, 1, 1,
-0.2362276, 0.3901977, 0.0262484, 1, 1, 1, 1, 1,
-0.236179, -0.8001723, -2.668413, 1, 1, 1, 1, 1,
-0.2356636, -0.5382115, -3.763966, 1, 1, 1, 1, 1,
-0.2353183, -2.044994, -2.699691, 1, 1, 1, 1, 1,
-0.2346434, -0.6012648, -1.689177, 1, 1, 1, 1, 1,
-0.2345238, -0.8727215, -2.755374, 1, 1, 1, 1, 1,
-0.2321609, -0.5549307, -1.363399, 1, 1, 1, 1, 1,
-0.2287796, 1.480171, 0.08543298, 1, 1, 1, 1, 1,
-0.2230217, 1.250434, -0.2593949, 1, 1, 1, 1, 1,
-0.2223416, -0.685784, -3.559031, 1, 1, 1, 1, 1,
-0.2181006, 0.5123874, -0.4886426, 1, 1, 1, 1, 1,
-0.2164856, 2.657821, -0.2114775, 1, 1, 1, 1, 1,
-0.2117388, 0.3754727, -1.923597, 0, 0, 1, 1, 1,
-0.207389, -0.7610219, -3.729947, 1, 0, 0, 1, 1,
-0.1971803, -1.171866, -0.8178943, 1, 0, 0, 1, 1,
-0.1858219, -0.7331412, -3.491806, 1, 0, 0, 1, 1,
-0.1853715, 0.3089062, -2.146206, 1, 0, 0, 1, 1,
-0.1833111, -1.35428, -3.76632, 1, 0, 0, 1, 1,
-0.1784498, 0.8928927, 0.3760681, 0, 0, 0, 1, 1,
-0.1748014, 1.64923, -0.4091136, 0, 0, 0, 1, 1,
-0.1711855, 0.3858497, 0.8705958, 0, 0, 0, 1, 1,
-0.1677258, 1.206346, 0.4340892, 0, 0, 0, 1, 1,
-0.1670065, 0.6078889, 1.971742, 0, 0, 0, 1, 1,
-0.1657111, 0.1585194, -0.5828652, 0, 0, 0, 1, 1,
-0.1643787, 0.3177341, -0.5213185, 0, 0, 0, 1, 1,
-0.1621011, -0.659846, -1.918113, 1, 1, 1, 1, 1,
-0.1587085, -0.3208362, -4.350115, 1, 1, 1, 1, 1,
-0.1578537, 0.5939947, -1.739991, 1, 1, 1, 1, 1,
-0.151155, -1.543874, -4.57904, 1, 1, 1, 1, 1,
-0.1509795, 0.8014819, 0.1737963, 1, 1, 1, 1, 1,
-0.1498951, -1.219389, -3.352072, 1, 1, 1, 1, 1,
-0.1462767, 1.263445, 0.1591911, 1, 1, 1, 1, 1,
-0.1399254, 0.2611864, -0.2476716, 1, 1, 1, 1, 1,
-0.1314479, -0.1220882, -2.158759, 1, 1, 1, 1, 1,
-0.1312139, -1.564993, -4.068649, 1, 1, 1, 1, 1,
-0.1305416, 0.560593, 1.276244, 1, 1, 1, 1, 1,
-0.1288625, 0.2484463, -0.2701132, 1, 1, 1, 1, 1,
-0.1287865, -0.01384658, -0.3884121, 1, 1, 1, 1, 1,
-0.1287527, -1.598366, -2.781376, 1, 1, 1, 1, 1,
-0.1257626, -1.104241, -2.012392, 1, 1, 1, 1, 1,
-0.1242801, -1.453826, -3.739605, 0, 0, 1, 1, 1,
-0.1220895, 0.5419705, 0.9510677, 1, 0, 0, 1, 1,
-0.1120478, 0.6436977, 0.6554837, 1, 0, 0, 1, 1,
-0.1101417, -0.2530324, -3.32198, 1, 0, 0, 1, 1,
-0.106694, 0.5021169, 0.9657787, 1, 0, 0, 1, 1,
-0.1055081, -0.6392715, -3.671397, 1, 0, 0, 1, 1,
-0.09689538, 1.35293, 0.4579843, 0, 0, 0, 1, 1,
-0.09484462, 0.72972, -1.096827, 0, 0, 0, 1, 1,
-0.09467997, -0.9483005, -3.190627, 0, 0, 0, 1, 1,
-0.09372582, 1.4098, 2.866741, 0, 0, 0, 1, 1,
-0.09347513, 0.1616323, -0.6002527, 0, 0, 0, 1, 1,
-0.09154017, -1.253099, -1.99814, 0, 0, 0, 1, 1,
-0.08580159, -0.1225892, -2.501311, 0, 0, 0, 1, 1,
-0.07309909, 1.242486, -0.7076151, 1, 1, 1, 1, 1,
-0.07150692, 1.6696, -2.016373, 1, 1, 1, 1, 1,
-0.06534668, -0.004016373, -1.244722, 1, 1, 1, 1, 1,
-0.05659393, -0.2485477, -3.450037, 1, 1, 1, 1, 1,
-0.05582898, -0.03026495, -2.948635, 1, 1, 1, 1, 1,
-0.05110186, 0.3078871, -0.9601482, 1, 1, 1, 1, 1,
-0.04576377, -0.8433216, -4.820847, 1, 1, 1, 1, 1,
-0.04026104, -0.2243015, -2.612684, 1, 1, 1, 1, 1,
-0.03351225, 1.453411, 2.506927, 1, 1, 1, 1, 1,
-0.03341847, 0.1241867, -1.607885, 1, 1, 1, 1, 1,
-0.03292776, 0.5072673, 0.8275405, 1, 1, 1, 1, 1,
-0.0311674, 0.6071308, -0.1978616, 1, 1, 1, 1, 1,
-0.02927043, 1.53269, -0.468541, 1, 1, 1, 1, 1,
-0.02254806, -0.3977027, -4.195046, 1, 1, 1, 1, 1,
-0.02052832, -0.1773924, -1.687102, 1, 1, 1, 1, 1,
-0.02047167, 0.4149911, 0.1111077, 0, 0, 1, 1, 1,
-0.01476233, -0.1665898, -2.301103, 1, 0, 0, 1, 1,
-0.01452484, 0.1328777, 0.1572773, 1, 0, 0, 1, 1,
-0.01047864, -0.7041771, -2.369323, 1, 0, 0, 1, 1,
-0.006037973, 0.6507338, 0.9207302, 1, 0, 0, 1, 1,
-0.001318519, -0.1414552, -4.36844, 1, 0, 0, 1, 1,
-0.001294574, 0.8116061, -0.17288, 0, 0, 0, 1, 1,
0.000480506, 0.3920494, 0.9591492, 0, 0, 0, 1, 1,
0.005391826, -0.7366048, 4.096744, 0, 0, 0, 1, 1,
0.009719911, -1.590694, 2.123309, 0, 0, 0, 1, 1,
0.01455207, -0.3654997, 2.954946, 0, 0, 0, 1, 1,
0.01799528, -0.4334059, 3.437939, 0, 0, 0, 1, 1,
0.02252423, -1.478815, 1.776552, 0, 0, 0, 1, 1,
0.02316551, 0.5378654, -1.093692, 1, 1, 1, 1, 1,
0.02915076, -2.754659, 3.156287, 1, 1, 1, 1, 1,
0.03065833, -1.239482, 4.506741, 1, 1, 1, 1, 1,
0.03169261, 0.1234929, 0.2090084, 1, 1, 1, 1, 1,
0.03254577, -0.1871418, 3.143102, 1, 1, 1, 1, 1,
0.03329252, -0.3814465, 3.776865, 1, 1, 1, 1, 1,
0.03380869, -0.43107, 4.360267, 1, 1, 1, 1, 1,
0.0455454, 0.02076147, 1.9875, 1, 1, 1, 1, 1,
0.05930437, -1.192357, 1.48994, 1, 1, 1, 1, 1,
0.0602524, -0.2403997, 5.07962, 1, 1, 1, 1, 1,
0.06921168, -0.6403422, -0.02262506, 1, 1, 1, 1, 1,
0.07214676, -0.7204006, 3.613284, 1, 1, 1, 1, 1,
0.07547472, 0.628162, 0.9371997, 1, 1, 1, 1, 1,
0.0757096, 1.657154, -0.6650846, 1, 1, 1, 1, 1,
0.07837928, 0.8201017, 1.867976, 1, 1, 1, 1, 1,
0.07936168, 3.40867, -1.74507, 0, 0, 1, 1, 1,
0.08136567, -0.1495325, 3.13258, 1, 0, 0, 1, 1,
0.08567892, 0.8084162, -0.8314501, 1, 0, 0, 1, 1,
0.08568183, 0.5368046, -0.1372118, 1, 0, 0, 1, 1,
0.0944054, -1.24826, 3.555308, 1, 0, 0, 1, 1,
0.0948877, 2.080714, 0.796092, 1, 0, 0, 1, 1,
0.09714083, 0.4905674, -1.859684, 0, 0, 0, 1, 1,
0.1000004, -0.4810087, 2.790121, 0, 0, 0, 1, 1,
0.1003934, -1.075923, 4.061357, 0, 0, 0, 1, 1,
0.103409, -0.166051, 1.90037, 0, 0, 0, 1, 1,
0.1066563, -0.9062276, 3.50396, 0, 0, 0, 1, 1,
0.1069777, 1.897811, -0.8277918, 0, 0, 0, 1, 1,
0.1149858, 0.1647583, 0.2269132, 0, 0, 0, 1, 1,
0.1185214, -1.290679, 2.111353, 1, 1, 1, 1, 1,
0.1241437, -0.326474, 0.500447, 1, 1, 1, 1, 1,
0.1268602, 0.6114786, -0.08387717, 1, 1, 1, 1, 1,
0.1278874, -0.6742842, 3.574617, 1, 1, 1, 1, 1,
0.1287784, 1.438222, -0.6921381, 1, 1, 1, 1, 1,
0.1311287, 0.002188785, 0.4404618, 1, 1, 1, 1, 1,
0.1340552, -1.75155, 0.9221382, 1, 1, 1, 1, 1,
0.1352258, -0.9376725, 3.774916, 1, 1, 1, 1, 1,
0.1410705, -0.8622901, 2.779134, 1, 1, 1, 1, 1,
0.1431491, 1.718525, 0.0989575, 1, 1, 1, 1, 1,
0.14563, 2.308562, 0.3298302, 1, 1, 1, 1, 1,
0.1458525, 1.087898, 0.525484, 1, 1, 1, 1, 1,
0.1462833, -0.06380029, 2.561353, 1, 1, 1, 1, 1,
0.1467638, 0.7414383, -1.471599, 1, 1, 1, 1, 1,
0.1473525, -1.091515, 4.08502, 1, 1, 1, 1, 1,
0.1480717, 0.5550414, 0.2375453, 0, 0, 1, 1, 1,
0.1490234, -0.6239467, 2.817548, 1, 0, 0, 1, 1,
0.1534779, -2.247661, 4.639687, 1, 0, 0, 1, 1,
0.1543774, -0.8025876, 3.720409, 1, 0, 0, 1, 1,
0.1559569, -1.417406, 5.057271, 1, 0, 0, 1, 1,
0.1564431, -0.9935793, 1.487741, 1, 0, 0, 1, 1,
0.1592794, 1.616802, 1.409616, 0, 0, 0, 1, 1,
0.1595916, -0.2546611, 2.091146, 0, 0, 0, 1, 1,
0.1610365, 0.09435145, 0.9545164, 0, 0, 0, 1, 1,
0.1696963, 0.385381, -0.2750895, 0, 0, 0, 1, 1,
0.1738772, -0.8500864, 1.733626, 0, 0, 0, 1, 1,
0.1740309, -0.1042323, 1.730657, 0, 0, 0, 1, 1,
0.1749159, 0.8007712, 1.256435, 0, 0, 0, 1, 1,
0.1768361, 3.072178, -0.6962931, 1, 1, 1, 1, 1,
0.1774361, -1.197702, 2.017132, 1, 1, 1, 1, 1,
0.1783391, -0.1796825, 2.843512, 1, 1, 1, 1, 1,
0.1818813, 0.9606668, 1.555174, 1, 1, 1, 1, 1,
0.1860583, 0.5494915, -0.428235, 1, 1, 1, 1, 1,
0.1925256, 1.13415, -0.5407631, 1, 1, 1, 1, 1,
0.1950561, -1.368672, 1.577993, 1, 1, 1, 1, 1,
0.195306, 0.2320735, 1.000954, 1, 1, 1, 1, 1,
0.1953785, 0.7882943, 1.081002, 1, 1, 1, 1, 1,
0.1982677, -2.061854, 2.355148, 1, 1, 1, 1, 1,
0.2038395, -0.07888654, 2.448054, 1, 1, 1, 1, 1,
0.2070464, 0.6004334, 0.5780953, 1, 1, 1, 1, 1,
0.2138885, 0.9619656, 0.4438448, 1, 1, 1, 1, 1,
0.2146314, -0.8703781, 3.888674, 1, 1, 1, 1, 1,
0.2203104, -0.4241171, 4.404159, 1, 1, 1, 1, 1,
0.2253017, 1.293155, 0.194478, 0, 0, 1, 1, 1,
0.225522, 1.195834, 0.1331822, 1, 0, 0, 1, 1,
0.2256182, 0.9057029, -1.095284, 1, 0, 0, 1, 1,
0.2274642, 2.019531, -0.6889967, 1, 0, 0, 1, 1,
0.230523, 0.3422036, 0.3339772, 1, 0, 0, 1, 1,
0.2350443, -0.6812657, 1.231405, 1, 0, 0, 1, 1,
0.2368313, 0.4253545, -0.4320374, 0, 0, 0, 1, 1,
0.2370591, 0.8360553, 1.558901, 0, 0, 0, 1, 1,
0.2410751, -0.4576432, 1.567487, 0, 0, 0, 1, 1,
0.2461055, 0.8825907, 0.03959426, 0, 0, 0, 1, 1,
0.2477264, 0.7252013, 0.3953853, 0, 0, 0, 1, 1,
0.2480146, 1.19498, 0.1574614, 0, 0, 0, 1, 1,
0.2506221, -0.2799515, 4.046906, 0, 0, 0, 1, 1,
0.2516466, 0.6147232, -0.6577271, 1, 1, 1, 1, 1,
0.2567385, 1.81982, -0.1547142, 1, 1, 1, 1, 1,
0.2575182, -0.6531417, 2.89058, 1, 1, 1, 1, 1,
0.2590002, 0.0463236, 2.16942, 1, 1, 1, 1, 1,
0.2615179, 0.3302594, 0.3519923, 1, 1, 1, 1, 1,
0.2617317, 0.6370245, 1.003348, 1, 1, 1, 1, 1,
0.2619655, 1.729708, 0.009808566, 1, 1, 1, 1, 1,
0.2635273, 1.7562, -1.564352, 1, 1, 1, 1, 1,
0.2679191, 0.1271278, 1.771017, 1, 1, 1, 1, 1,
0.2692748, 0.6786249, 1.861696, 1, 1, 1, 1, 1,
0.2707146, 0.2068276, 0.621456, 1, 1, 1, 1, 1,
0.2714783, 0.4531371, 0.2031694, 1, 1, 1, 1, 1,
0.2715807, 1.601376, 0.8517802, 1, 1, 1, 1, 1,
0.2718132, 0.0407817, 1.34184, 1, 1, 1, 1, 1,
0.2799135, 0.1371576, 1.601223, 1, 1, 1, 1, 1,
0.2800256, -0.9519266, 4.753659, 0, 0, 1, 1, 1,
0.2859353, -1.033088, 2.507712, 1, 0, 0, 1, 1,
0.2934546, -0.8363965, 3.210856, 1, 0, 0, 1, 1,
0.2993322, 0.1046358, 0.4679677, 1, 0, 0, 1, 1,
0.3020267, -0.6782817, 2.343638, 1, 0, 0, 1, 1,
0.3030644, 0.2144917, -0.5332454, 1, 0, 0, 1, 1,
0.3037114, -0.2893096, 2.530119, 0, 0, 0, 1, 1,
0.3048252, -1.239383, 2.649706, 0, 0, 0, 1, 1,
0.304861, -1.331559, 2.676564, 0, 0, 0, 1, 1,
0.3054568, 0.6121712, -0.3994746, 0, 0, 0, 1, 1,
0.3095813, -0.09206482, 2.544978, 0, 0, 0, 1, 1,
0.3106389, 0.3393118, 1.490997, 0, 0, 0, 1, 1,
0.3109666, 0.3364737, 0.5577952, 0, 0, 0, 1, 1,
0.3169706, 1.346027, -0.6220975, 1, 1, 1, 1, 1,
0.3173392, 0.02251269, 2.283634, 1, 1, 1, 1, 1,
0.3202139, -0.8429947, 2.515365, 1, 1, 1, 1, 1,
0.3309133, -1.110768, 2.50444, 1, 1, 1, 1, 1,
0.3319273, -0.7417724, 2.942827, 1, 1, 1, 1, 1,
0.3341385, 0.9400858, 0.2053628, 1, 1, 1, 1, 1,
0.3391993, -0.5827239, 2.646399, 1, 1, 1, 1, 1,
0.3438047, 0.2171844, 3.669242, 1, 1, 1, 1, 1,
0.3449625, 0.3242792, 1.712266, 1, 1, 1, 1, 1,
0.3453014, -1.807467, 2.599484, 1, 1, 1, 1, 1,
0.3536601, -0.5585319, 2.242692, 1, 1, 1, 1, 1,
0.3551806, -0.739751, 2.92102, 1, 1, 1, 1, 1,
0.3617324, 0.6748585, 0.3237455, 1, 1, 1, 1, 1,
0.3639321, 0.2706634, 2.037038, 1, 1, 1, 1, 1,
0.3640124, 0.04418387, 1.302852, 1, 1, 1, 1, 1,
0.3663568, -0.8271477, 3.235417, 0, 0, 1, 1, 1,
0.3673013, -1.06162, 2.801144, 1, 0, 0, 1, 1,
0.3707349, -0.4458511, 2.141439, 1, 0, 0, 1, 1,
0.3720808, -0.5817343, 3.23825, 1, 0, 0, 1, 1,
0.3752577, 0.1527279, 0.8285037, 1, 0, 0, 1, 1,
0.3755566, -1.689844, 3.031341, 1, 0, 0, 1, 1,
0.3784735, -1.522939, 3.186584, 0, 0, 0, 1, 1,
0.3799641, 0.9571531, -0.6691196, 0, 0, 0, 1, 1,
0.3820288, 0.3407048, 3.030616, 0, 0, 0, 1, 1,
0.3858103, -1.598171, 2.972464, 0, 0, 0, 1, 1,
0.386602, -0.9829639, 4.480418, 0, 0, 0, 1, 1,
0.3892525, -0.1696597, 1.651639, 0, 0, 0, 1, 1,
0.3941832, -0.2679707, 2.808328, 0, 0, 0, 1, 1,
0.3947419, -0.08979654, 2.582873, 1, 1, 1, 1, 1,
0.3953438, -1.204576, 2.792153, 1, 1, 1, 1, 1,
0.4004758, -0.9891587, 2.4573, 1, 1, 1, 1, 1,
0.4009906, 0.2027563, 1.628307, 1, 1, 1, 1, 1,
0.4026726, 0.8086483, -0.507584, 1, 1, 1, 1, 1,
0.4029876, -0.07276872, 2.67104, 1, 1, 1, 1, 1,
0.4057756, -0.5072148, 2.060749, 1, 1, 1, 1, 1,
0.4075369, 0.7949646, -0.1494206, 1, 1, 1, 1, 1,
0.4186468, -0.4696307, 3.597482, 1, 1, 1, 1, 1,
0.4189607, -0.3792774, 2.452548, 1, 1, 1, 1, 1,
0.4206905, 0.08505416, 1.424718, 1, 1, 1, 1, 1,
0.4214327, -0.255498, 3.777447, 1, 1, 1, 1, 1,
0.4269912, -0.1988145, 0.1262353, 1, 1, 1, 1, 1,
0.4269944, 0.3289311, -0.2605228, 1, 1, 1, 1, 1,
0.434009, 0.130684, 1.743451, 1, 1, 1, 1, 1,
0.4366452, -0.1714643, 1.908322, 0, 0, 1, 1, 1,
0.4399631, 0.6446009, -0.6582051, 1, 0, 0, 1, 1,
0.4433783, 0.1430489, 2.233772, 1, 0, 0, 1, 1,
0.447134, -0.2598936, 2.365129, 1, 0, 0, 1, 1,
0.4472828, 0.1432183, -0.9258039, 1, 0, 0, 1, 1,
0.448082, -0.5036664, 0.8179793, 1, 0, 0, 1, 1,
0.4502124, -0.5864981, 2.513303, 0, 0, 0, 1, 1,
0.4518742, -0.7258627, 3.907471, 0, 0, 0, 1, 1,
0.4522399, -0.06359506, 0.1184231, 0, 0, 0, 1, 1,
0.4544769, -0.14444, 2.045233, 0, 0, 0, 1, 1,
0.4556138, 0.2355872, 1.698326, 0, 0, 0, 1, 1,
0.4601601, -1.949402, 2.166678, 0, 0, 0, 1, 1,
0.461468, -1.706375, 3.761128, 0, 0, 0, 1, 1,
0.4622887, 1.013543, 1.983461, 1, 1, 1, 1, 1,
0.4640148, 0.2804166, 0.7718415, 1, 1, 1, 1, 1,
0.4724901, -1.062587, 2.048758, 1, 1, 1, 1, 1,
0.4753304, 0.7592693, 2.28396, 1, 1, 1, 1, 1,
0.4755598, -0.2462347, 3.779664, 1, 1, 1, 1, 1,
0.4756839, -1.246314, 3.073749, 1, 1, 1, 1, 1,
0.4845789, 0.5651388, -0.6718898, 1, 1, 1, 1, 1,
0.4910629, -0.2772355, 2.371581, 1, 1, 1, 1, 1,
0.4922292, -0.5627131, -0.6732981, 1, 1, 1, 1, 1,
0.494706, 1.300343, 1.651002, 1, 1, 1, 1, 1,
0.4971158, 1.906211, -1.36949, 1, 1, 1, 1, 1,
0.5072303, -0.889705, 3.221226, 1, 1, 1, 1, 1,
0.5118529, 0.3413107, -0.8848905, 1, 1, 1, 1, 1,
0.515198, -0.8346793, 2.392974, 1, 1, 1, 1, 1,
0.5158693, 0.06701587, 1.125445, 1, 1, 1, 1, 1,
0.5234359, 0.1761371, 1.278015, 0, 0, 1, 1, 1,
0.5272673, 0.5643832, 2.092271, 1, 0, 0, 1, 1,
0.5328975, 0.8057406, 1.568102, 1, 0, 0, 1, 1,
0.5355069, 0.06445211, 0.2552046, 1, 0, 0, 1, 1,
0.5368223, 1.649947, 1.37318, 1, 0, 0, 1, 1,
0.5390194, 0.9272957, 0.1434863, 1, 0, 0, 1, 1,
0.5409456, -1.088755, 3.278523, 0, 0, 0, 1, 1,
0.5458198, 0.4829745, 0.7757047, 0, 0, 0, 1, 1,
0.5458218, 0.08302142, 1.693509, 0, 0, 0, 1, 1,
0.5515152, -0.8648493, 2.404524, 0, 0, 0, 1, 1,
0.5716289, 2.039312, -0.8517768, 0, 0, 0, 1, 1,
0.5756973, 1.385819, -0.8915402, 0, 0, 0, 1, 1,
0.5781472, 0.6809995, 0.3530492, 0, 0, 0, 1, 1,
0.5792132, 1.164325, -0.4763149, 1, 1, 1, 1, 1,
0.5817714, 0.09542379, 0.1177477, 1, 1, 1, 1, 1,
0.584893, 0.4905429, 1.944885, 1, 1, 1, 1, 1,
0.586683, -0.4450271, 3.241907, 1, 1, 1, 1, 1,
0.5905144, -2.024228, 5.03821, 1, 1, 1, 1, 1,
0.5915059, -1.00363, 2.794766, 1, 1, 1, 1, 1,
0.5922565, -0.3989793, 2.103497, 1, 1, 1, 1, 1,
0.5946695, 0.2329098, 1.100305, 1, 1, 1, 1, 1,
0.6011328, 0.7313909, -1.584566, 1, 1, 1, 1, 1,
0.6145175, 0.09412284, 0.5523832, 1, 1, 1, 1, 1,
0.6171286, 0.3865716, 0.5511742, 1, 1, 1, 1, 1,
0.6206479, -3.030148, 0.9432595, 1, 1, 1, 1, 1,
0.625897, -0.4077828, 1.995504, 1, 1, 1, 1, 1,
0.6263065, 0.4473874, -0.2762368, 1, 1, 1, 1, 1,
0.6313553, -1.217232, 2.316995, 1, 1, 1, 1, 1,
0.6322677, 0.3119708, -1.505008, 0, 0, 1, 1, 1,
0.634207, -1.939891, 2.630325, 1, 0, 0, 1, 1,
0.6359142, 0.1478483, 1.166088, 1, 0, 0, 1, 1,
0.6442577, -0.03526065, 2.743989, 1, 0, 0, 1, 1,
0.64689, 0.2086271, -0.3204234, 1, 0, 0, 1, 1,
0.6492711, 2.446464, 0.9139863, 1, 0, 0, 1, 1,
0.6511433, -0.6559274, 1.690688, 0, 0, 0, 1, 1,
0.6522268, -0.431603, 2.194963, 0, 0, 0, 1, 1,
0.6566643, -1.64291, 2.906551, 0, 0, 0, 1, 1,
0.6639935, -0.3347814, 2.145726, 0, 0, 0, 1, 1,
0.6674057, 1.054023, 1.530194, 0, 0, 0, 1, 1,
0.6711919, -0.2002898, 1.761958, 0, 0, 0, 1, 1,
0.6714148, -0.7306973, 2.375725, 0, 0, 0, 1, 1,
0.6721709, 0.2821623, 0.07715026, 1, 1, 1, 1, 1,
0.675235, -1.405874, 2.395605, 1, 1, 1, 1, 1,
0.6772869, -0.8895458, 0.6252393, 1, 1, 1, 1, 1,
0.6776065, 0.5507106, 2.900647, 1, 1, 1, 1, 1,
0.6791766, -0.3356085, 1.653434, 1, 1, 1, 1, 1,
0.6847694, 0.8057418, 1.68223, 1, 1, 1, 1, 1,
0.6855292, -1.10273, 2.551429, 1, 1, 1, 1, 1,
0.6858307, 1.037206, 1.229877, 1, 1, 1, 1, 1,
0.6870826, -1.012228, 2.316556, 1, 1, 1, 1, 1,
0.6932713, -0.3819137, 2.093741, 1, 1, 1, 1, 1,
0.6935525, -0.2911257, -0.2013779, 1, 1, 1, 1, 1,
0.6968282, -2.19362, 2.202509, 1, 1, 1, 1, 1,
0.7021118, 1.295486, -0.4911898, 1, 1, 1, 1, 1,
0.7034683, -0.9077365, 3.153687, 1, 1, 1, 1, 1,
0.7054417, -2.653314, 3.096268, 1, 1, 1, 1, 1,
0.706942, -0.1564295, 2.371618, 0, 0, 1, 1, 1,
0.7167602, -1.14504, 1.90086, 1, 0, 0, 1, 1,
0.7273199, 1.776864, -0.91756, 1, 0, 0, 1, 1,
0.7332873, 2.12555, 1.257743, 1, 0, 0, 1, 1,
0.733865, -0.2998444, 3.313272, 1, 0, 0, 1, 1,
0.739151, -0.9998735, 0.7447941, 1, 0, 0, 1, 1,
0.7402321, 0.3755044, 2.721337, 0, 0, 0, 1, 1,
0.7408044, 0.3849991, 1.226464, 0, 0, 0, 1, 1,
0.7462182, -0.6231975, 3.42221, 0, 0, 0, 1, 1,
0.7575311, -1.330337, 3.326226, 0, 0, 0, 1, 1,
0.7586947, 0.8785549, -0.3574152, 0, 0, 0, 1, 1,
0.7609907, 0.4386597, 2.082013, 0, 0, 0, 1, 1,
0.7620203, 0.5951152, 0.2363048, 0, 0, 0, 1, 1,
0.7625338, 1.540776, 1.509915, 1, 1, 1, 1, 1,
0.7643028, -0.3406822, 2.594498, 1, 1, 1, 1, 1,
0.7648098, -0.2397254, 0.2691592, 1, 1, 1, 1, 1,
0.7675025, -0.1149294, 1.721322, 1, 1, 1, 1, 1,
0.7683021, -0.8204521, 1.18722, 1, 1, 1, 1, 1,
0.7788674, 0.439696, 2.981409, 1, 1, 1, 1, 1,
0.783034, -0.1673025, 1.149353, 1, 1, 1, 1, 1,
0.7854906, 1.754949, 1.793113, 1, 1, 1, 1, 1,
0.7958298, 0.4583493, 1.625562, 1, 1, 1, 1, 1,
0.7960414, -1.244743, 3.103594, 1, 1, 1, 1, 1,
0.7992741, -0.4499883, 3.140795, 1, 1, 1, 1, 1,
0.8021857, -1.634947, 2.431965, 1, 1, 1, 1, 1,
0.8039557, -0.2844144, 1.331947, 1, 1, 1, 1, 1,
0.8055556, -0.09614364, 2.457387, 1, 1, 1, 1, 1,
0.8063743, 1.309725, 0.2180753, 1, 1, 1, 1, 1,
0.808123, 0.1057348, 2.090394, 0, 0, 1, 1, 1,
0.8178204, -0.7795265, 2.015982, 1, 0, 0, 1, 1,
0.820116, 0.146976, -0.2001015, 1, 0, 0, 1, 1,
0.8238988, 1.023697, 1.590677, 1, 0, 0, 1, 1,
0.8274996, -0.1061414, 2.281308, 1, 0, 0, 1, 1,
0.8282831, -0.1664601, 0.8958129, 1, 0, 0, 1, 1,
0.8306205, -0.7206492, 2.924586, 0, 0, 0, 1, 1,
0.8317708, -1.210432, 2.976592, 0, 0, 0, 1, 1,
0.8346279, -0.8198392, 2.387266, 0, 0, 0, 1, 1,
0.8347553, 1.284037, -1.414773, 0, 0, 0, 1, 1,
0.837871, 0.03170779, 1.492963, 0, 0, 0, 1, 1,
0.8487728, 2.099079, 3.13133, 0, 0, 0, 1, 1,
0.8496727, -1.281485, 3.894494, 0, 0, 0, 1, 1,
0.8502182, 0.1605818, 0.5994534, 1, 1, 1, 1, 1,
0.8580052, 0.5348159, 1.616585, 1, 1, 1, 1, 1,
0.8581579, -0.2805295, 2.868364, 1, 1, 1, 1, 1,
0.8654105, -0.6941221, 2.335781, 1, 1, 1, 1, 1,
0.8706435, 1.7966, 1.652057, 1, 1, 1, 1, 1,
0.8710831, -0.1606265, 2.639445, 1, 1, 1, 1, 1,
0.8792645, 0.2952986, 3.34264, 1, 1, 1, 1, 1,
0.8803087, -0.2854235, 1.232927, 1, 1, 1, 1, 1,
0.8812581, -0.7808874, 2.988647, 1, 1, 1, 1, 1,
0.8844295, 0.2372705, 1.451173, 1, 1, 1, 1, 1,
0.8888749, 1.345774, -0.8236532, 1, 1, 1, 1, 1,
0.8962821, -0.7269481, 0.8957446, 1, 1, 1, 1, 1,
0.8999635, 0.3718475, 3.547261, 1, 1, 1, 1, 1,
0.903496, -0.951881, 2.668279, 1, 1, 1, 1, 1,
0.9069273, -0.5545682, 2.391226, 1, 1, 1, 1, 1,
0.9103734, -1.471342, 3.957086, 0, 0, 1, 1, 1,
0.9185508, -0.07790928, 1.587678, 1, 0, 0, 1, 1,
0.9187051, -1.443861, 3.306382, 1, 0, 0, 1, 1,
0.9198434, 0.02579429, 0.8692451, 1, 0, 0, 1, 1,
0.9218838, -0.4592078, 2.577193, 1, 0, 0, 1, 1,
0.9237157, 0.8108225, 0.3706199, 1, 0, 0, 1, 1,
0.9256747, -1.208156, 1.76798, 0, 0, 0, 1, 1,
0.9317136, -0.8256426, 1.561211, 0, 0, 0, 1, 1,
0.935567, -0.7159266, 3.001197, 0, 0, 0, 1, 1,
0.9368235, -0.5506533, 2.765166, 0, 0, 0, 1, 1,
0.949514, 0.1364828, 2.079504, 0, 0, 0, 1, 1,
0.9532583, -0.1677193, 2.54071, 0, 0, 0, 1, 1,
0.9533647, -0.4763923, 1.636457, 0, 0, 0, 1, 1,
0.9533899, 0.2853494, 1.376912, 1, 1, 1, 1, 1,
0.9570282, 0.3290524, 0.3533035, 1, 1, 1, 1, 1,
0.9592923, -0.04301444, 1.109083, 1, 1, 1, 1, 1,
0.9610803, -0.08061606, -0.1494292, 1, 1, 1, 1, 1,
0.9696524, -1.3946, 0.9058279, 1, 1, 1, 1, 1,
0.972283, 0.4173609, 0.8646724, 1, 1, 1, 1, 1,
0.9734914, 1.915645, 0.7006118, 1, 1, 1, 1, 1,
0.9785895, -0.0008417373, 2.652321, 1, 1, 1, 1, 1,
0.9789712, -1.064746, 0.8649012, 1, 1, 1, 1, 1,
0.9795141, 1.880523, -1.362704, 1, 1, 1, 1, 1,
0.9864966, 0.8267214, 0.7074275, 1, 1, 1, 1, 1,
0.9881617, -0.3122253, 0.01733244, 1, 1, 1, 1, 1,
0.9893929, -2.451604, 2.973906, 1, 1, 1, 1, 1,
0.9909584, 0.2327613, 1.223274, 1, 1, 1, 1, 1,
0.9914881, 0.4000275, 0.5206032, 1, 1, 1, 1, 1,
0.9920314, 0.1403894, 1.185172, 0, 0, 1, 1, 1,
0.9964132, 0.5489292, 0.9144872, 1, 0, 0, 1, 1,
0.9983191, -0.1307244, 3.530649, 1, 0, 0, 1, 1,
1.00986, 1.620311, 2.205662, 1, 0, 0, 1, 1,
1.011768, 0.3186278, 1.99179, 1, 0, 0, 1, 1,
1.020774, -0.06996691, 0.7040121, 1, 0, 0, 1, 1,
1.021953, 0.3212483, 1.813318, 0, 0, 0, 1, 1,
1.023618, -0.1367924, 2.168684, 0, 0, 0, 1, 1,
1.024046, 0.2340529, 0.06287143, 0, 0, 0, 1, 1,
1.03215, -1.31518, 2.335523, 0, 0, 0, 1, 1,
1.032159, -0.04289966, 1.855883, 0, 0, 0, 1, 1,
1.038351, -0.3434538, 1.341277, 0, 0, 0, 1, 1,
1.055886, -1.859215, 2.679332, 0, 0, 0, 1, 1,
1.058672, 0.7706797, 0.6066768, 1, 1, 1, 1, 1,
1.07406, -1.260785, 2.460891, 1, 1, 1, 1, 1,
1.078907, 0.6844816, 1.097644, 1, 1, 1, 1, 1,
1.085064, -2.238693, 3.819094, 1, 1, 1, 1, 1,
1.085468, 0.519327, -1.969419, 1, 1, 1, 1, 1,
1.087073, 0.9480224, 1.262148, 1, 1, 1, 1, 1,
1.090452, -0.5848857, 1.375518, 1, 1, 1, 1, 1,
1.097545, 0.9700578, 0.1524675, 1, 1, 1, 1, 1,
1.098855, -0.7038374, 3.011001, 1, 1, 1, 1, 1,
1.099485, -0.9232813, 2.44178, 1, 1, 1, 1, 1,
1.111894, 1.366815, 1.951209, 1, 1, 1, 1, 1,
1.112512, 0.2844627, 2.160698, 1, 1, 1, 1, 1,
1.129289, 1.060357, 0.6694153, 1, 1, 1, 1, 1,
1.129436, 0.6938729, 0.7535535, 1, 1, 1, 1, 1,
1.141718, 0.8697134, 0.9834026, 1, 1, 1, 1, 1,
1.152369, -0.2969554, 1.205812, 0, 0, 1, 1, 1,
1.154615, -1.732239, 3.554383, 1, 0, 0, 1, 1,
1.159101, -0.4195344, 3.419798, 1, 0, 0, 1, 1,
1.167462, -0.3053457, 1.1641, 1, 0, 0, 1, 1,
1.181827, 1.969287, -0.3005809, 1, 0, 0, 1, 1,
1.187532, -0.3361375, 1.753782, 1, 0, 0, 1, 1,
1.20445, 1.075493, 0.4373127, 0, 0, 0, 1, 1,
1.213057, 1.368598, 2.302235, 0, 0, 0, 1, 1,
1.222311, 0.636677, 0.1344857, 0, 0, 0, 1, 1,
1.223925, 1.668748, 0.1951214, 0, 0, 0, 1, 1,
1.254887, 1.079546, -0.04911018, 0, 0, 0, 1, 1,
1.257427, 2.624805, 0.1146906, 0, 0, 0, 1, 1,
1.259109, -0.9425769, 1.495404, 0, 0, 0, 1, 1,
1.259643, -0.1479686, 0.5654107, 1, 1, 1, 1, 1,
1.265591, -0.4408423, 2.030082, 1, 1, 1, 1, 1,
1.272621, -1.294683, 1.801623, 1, 1, 1, 1, 1,
1.275202, -0.8384869, 2.375851, 1, 1, 1, 1, 1,
1.282852, -0.5483081, 3.675044, 1, 1, 1, 1, 1,
1.284315, 1.251627, 2.503303, 1, 1, 1, 1, 1,
1.291156, -1.065576, 1.762971, 1, 1, 1, 1, 1,
1.294641, -1.112452, 1.330361, 1, 1, 1, 1, 1,
1.298607, -0.3367632, 1.70918, 1, 1, 1, 1, 1,
1.304223, -0.9639223, 2.452517, 1, 1, 1, 1, 1,
1.304393, 1.008058, 0.07536802, 1, 1, 1, 1, 1,
1.306166, 0.4095541, 2.07585, 1, 1, 1, 1, 1,
1.309494, 0.04427712, 1.016027, 1, 1, 1, 1, 1,
1.321221, 1.077155, -0.9626754, 1, 1, 1, 1, 1,
1.325549, -0.626052, 0.686569, 1, 1, 1, 1, 1,
1.329021, 0.865745, 2.029064, 0, 0, 1, 1, 1,
1.364091, 0.1821364, 1.759211, 1, 0, 0, 1, 1,
1.367189, 0.1986969, 3.421477, 1, 0, 0, 1, 1,
1.370847, 0.8600858, 1.494219, 1, 0, 0, 1, 1,
1.374555, 1.854217, 0.09818103, 1, 0, 0, 1, 1,
1.376115, -0.1904784, 1.889045, 1, 0, 0, 1, 1,
1.376444, -1.874403, 3.796248, 0, 0, 0, 1, 1,
1.385662, -0.5452945, 0.9426135, 0, 0, 0, 1, 1,
1.387742, 0.7613109, 1.954381, 0, 0, 0, 1, 1,
1.401912, 0.3665486, 2.901363, 0, 0, 0, 1, 1,
1.405613, -0.1813689, 0.6829178, 0, 0, 0, 1, 1,
1.410449, 1.32528, 0.2172049, 0, 0, 0, 1, 1,
1.412185, 1.124499, 1.597796, 0, 0, 0, 1, 1,
1.418875, -0.9380964, 2.682776, 1, 1, 1, 1, 1,
1.421252, -0.9658133, 1.53121, 1, 1, 1, 1, 1,
1.43182, 0.5054592, 0.2646768, 1, 1, 1, 1, 1,
1.44122, 0.1121118, 3.215103, 1, 1, 1, 1, 1,
1.446248, -0.3358591, 1.329507, 1, 1, 1, 1, 1,
1.449471, 0.8551406, 1.772329, 1, 1, 1, 1, 1,
1.457953, 0.8984049, 0.4678589, 1, 1, 1, 1, 1,
1.462899, 0.4977116, 2.255706, 1, 1, 1, 1, 1,
1.465581, -0.5263682, 2.079097, 1, 1, 1, 1, 1,
1.469261, -1.073522, 2.728886, 1, 1, 1, 1, 1,
1.47464, -1.043496, 3.577904, 1, 1, 1, 1, 1,
1.475866, 0.0495064, 1.15441, 1, 1, 1, 1, 1,
1.482128, 0.732998, -0.4802063, 1, 1, 1, 1, 1,
1.493459, 1.31303, 0.4627199, 1, 1, 1, 1, 1,
1.494184, -0.1925115, 3.090326, 1, 1, 1, 1, 1,
1.5042, -0.7114872, 1.493224, 0, 0, 1, 1, 1,
1.515056, -1.622477, 2.721057, 1, 0, 0, 1, 1,
1.519018, -0.5079321, 1.759112, 1, 0, 0, 1, 1,
1.521687, -1.056559, 1.405367, 1, 0, 0, 1, 1,
1.523106, -0.5899156, 4.096817, 1, 0, 0, 1, 1,
1.526246, 0.8402262, -0.9485154, 1, 0, 0, 1, 1,
1.532156, 0.3483789, 0.8177631, 0, 0, 0, 1, 1,
1.542761, 0.7693751, -0.592113, 0, 0, 0, 1, 1,
1.543332, -0.9962654, 1.095581, 0, 0, 0, 1, 1,
1.564571, 1.108095, 0.947461, 0, 0, 0, 1, 1,
1.569952, -0.6719809, 0.3110939, 0, 0, 0, 1, 1,
1.571329, 1.308595, 1.42036, 0, 0, 0, 1, 1,
1.572174, 0.6516238, 0.181637, 0, 0, 0, 1, 1,
1.594065, -0.3182486, 0.422249, 1, 1, 1, 1, 1,
1.596738, -0.54114, 3.340355, 1, 1, 1, 1, 1,
1.599745, 1.265869, 1.249477, 1, 1, 1, 1, 1,
1.604289, 1.718414, 1.488854, 1, 1, 1, 1, 1,
1.63205, -0.5724621, 3.061223, 1, 1, 1, 1, 1,
1.642534, 0.03054328, 3.937199, 1, 1, 1, 1, 1,
1.651638, 1.310035, 0.6800479, 1, 1, 1, 1, 1,
1.661628, -0.1608407, 1.95381, 1, 1, 1, 1, 1,
1.670562, 0.4857691, 1.288381, 1, 1, 1, 1, 1,
1.671838, 1.107883, -0.2628346, 1, 1, 1, 1, 1,
1.678216, -1.163313, 2.477228, 1, 1, 1, 1, 1,
1.67854, 0.9709114, 2.502525, 1, 1, 1, 1, 1,
1.681854, -0.6103375, 0.9320448, 1, 1, 1, 1, 1,
1.695976, -0.9037408, 1.906619, 1, 1, 1, 1, 1,
1.696122, -0.6667446, 1.456618, 1, 1, 1, 1, 1,
1.710662, -0.2821452, 0.4772454, 0, 0, 1, 1, 1,
1.739754, 0.7452846, 2.027579, 1, 0, 0, 1, 1,
1.740749, -1.14182, 3.621359, 1, 0, 0, 1, 1,
1.752084, -0.5953441, 3.030098, 1, 0, 0, 1, 1,
1.758381, -0.9745575, 3.317509, 1, 0, 0, 1, 1,
1.769034, 0.5022662, 2.044616, 1, 0, 0, 1, 1,
1.776433, -1.410717, 4.51336, 0, 0, 0, 1, 1,
1.777804, 0.7528293, 1.832641, 0, 0, 0, 1, 1,
1.782268, 0.286126, 2.340512, 0, 0, 0, 1, 1,
1.795115, 0.1127562, 1.856276, 0, 0, 0, 1, 1,
1.805075, -1.664393, 2.005047, 0, 0, 0, 1, 1,
1.808594, 0.3615735, 1.553634, 0, 0, 0, 1, 1,
1.810483, -1.156896, 3.193209, 0, 0, 0, 1, 1,
1.81052, 0.6312132, 2.573404, 1, 1, 1, 1, 1,
1.822977, -0.3234269, 1.568795, 1, 1, 1, 1, 1,
1.823673, 0.1580396, 1.211779, 1, 1, 1, 1, 1,
1.838055, -0.8604648, 2.0469, 1, 1, 1, 1, 1,
1.842192, -0.7349839, 2.486193, 1, 1, 1, 1, 1,
1.89863, 0.5455233, 0.4339687, 1, 1, 1, 1, 1,
1.905073, -0.3702915, 4.468027, 1, 1, 1, 1, 1,
1.916787, 0.2264513, 0.1011482, 1, 1, 1, 1, 1,
1.939894, 1.702553, 2.903741, 1, 1, 1, 1, 1,
1.953862, 1.428669, 1.069338, 1, 1, 1, 1, 1,
1.983588, -0.03825251, 2.188497, 1, 1, 1, 1, 1,
1.987705, -0.2386676, 1.546258, 1, 1, 1, 1, 1,
2.001724, 0.7255352, 1.384405, 1, 1, 1, 1, 1,
2.01986, 1.003657, 2.09324, 1, 1, 1, 1, 1,
2.034712, 1.542186, 1.217955, 1, 1, 1, 1, 1,
2.069623, -0.7969671, 3.448949, 0, 0, 1, 1, 1,
2.087046, -0.5763262, 2.476602, 1, 0, 0, 1, 1,
2.14811, -0.3155646, 1.551996, 1, 0, 0, 1, 1,
2.163695, 1.241502, 1.067578, 1, 0, 0, 1, 1,
2.211471, -0.5576833, 1.057239, 1, 0, 0, 1, 1,
2.223343, 0.8880138, 1.544843, 1, 0, 0, 1, 1,
2.257956, -1.536915, 1.463805, 0, 0, 0, 1, 1,
2.296644, 0.0619447, 1.274914, 0, 0, 0, 1, 1,
2.29986, -1.080035, 2.246961, 0, 0, 0, 1, 1,
2.390601, 0.2511381, 2.693811, 0, 0, 0, 1, 1,
2.413143, -1.130127, 1.899344, 0, 0, 0, 1, 1,
2.433295, 0.1948511, 0.3120593, 0, 0, 0, 1, 1,
2.43898, -0.08525843, 0.7332767, 0, 0, 0, 1, 1,
2.446235, -0.2387696, 2.147402, 1, 1, 1, 1, 1,
2.518785, -0.3367538, 1.770422, 1, 1, 1, 1, 1,
2.725273, -0.07731948, 0.3408295, 1, 1, 1, 1, 1,
2.804857, 0.191728, 3.069173, 1, 1, 1, 1, 1,
2.897489, 0.09100328, 2.891073, 1, 1, 1, 1, 1,
3.155585, 0.2079283, 2.123781, 1, 1, 1, 1, 1,
3.240908, 0.1406578, 1.598458, 1, 1, 1, 1, 1
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
var radius = 9.543412;
var distance = 33.52083;
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
mvMatrix.translate( 0.2172096, -0.189261, 0.0515945 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.52083);
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
