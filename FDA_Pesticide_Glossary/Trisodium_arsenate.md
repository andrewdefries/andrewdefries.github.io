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
-3.237232, -0.5539513, -1.922797, 1, 0, 0, 1,
-2.947008, -0.9364924, -1.293383, 1, 0.007843138, 0, 1,
-2.827823, 0.05357012, -3.002387, 1, 0.01176471, 0, 1,
-2.759181, -0.6010821, -2.388124, 1, 0.01960784, 0, 1,
-2.66813, -0.4963134, -1.383113, 1, 0.02352941, 0, 1,
-2.616327, 1.409253, 0.3490131, 1, 0.03137255, 0, 1,
-2.453766, -1.795407, -1.153088, 1, 0.03529412, 0, 1,
-2.426822, -2.693939, -1.706679, 1, 0.04313726, 0, 1,
-2.233237, 1.510624, 0.7862377, 1, 0.04705882, 0, 1,
-2.0742, 1.138831, -1.298841, 1, 0.05490196, 0, 1,
-2.05662, 0.3754731, -2.684098, 1, 0.05882353, 0, 1,
-2.0332, -0.8235798, -0.8822929, 1, 0.06666667, 0, 1,
-2.024266, 1.941961, -1.637691, 1, 0.07058824, 0, 1,
-2.013287, 0.8180514, -0.02638404, 1, 0.07843138, 0, 1,
-2.004169, -1.039822, -2.425338, 1, 0.08235294, 0, 1,
-1.975117, 1.039402, -3.068039, 1, 0.09019608, 0, 1,
-1.955185, -0.655118, -2.645081, 1, 0.09411765, 0, 1,
-1.952761, -0.1395991, -1.723183, 1, 0.1019608, 0, 1,
-1.946034, -0.5290428, -2.636476, 1, 0.1098039, 0, 1,
-1.888617, 0.1561638, -2.155611, 1, 0.1137255, 0, 1,
-1.880182, -1.067268, -1.613525, 1, 0.1215686, 0, 1,
-1.824394, 0.3304861, -0.2498688, 1, 0.1254902, 0, 1,
-1.818413, 0.1765727, -0.6309186, 1, 0.1333333, 0, 1,
-1.815357, 0.1207383, -1.636721, 1, 0.1372549, 0, 1,
-1.798194, 0.2613673, -0.4366226, 1, 0.145098, 0, 1,
-1.788718, 0.1673337, 0.1661361, 1, 0.1490196, 0, 1,
-1.765886, 0.3097807, -1.830952, 1, 0.1568628, 0, 1,
-1.737388, 2.38003, -0.2024212, 1, 0.1607843, 0, 1,
-1.731226, -0.2952267, -1.193639, 1, 0.1686275, 0, 1,
-1.725799, -0.8043141, -2.815051, 1, 0.172549, 0, 1,
-1.715824, -0.2317673, -1.232756, 1, 0.1803922, 0, 1,
-1.712526, 0.5899991, -1.019386, 1, 0.1843137, 0, 1,
-1.69086, -1.45219, -1.533556, 1, 0.1921569, 0, 1,
-1.68539, 0.4912589, -1.591615, 1, 0.1960784, 0, 1,
-1.683185, -0.08777501, -3.260009, 1, 0.2039216, 0, 1,
-1.681693, -0.2240512, -2.082672, 1, 0.2117647, 0, 1,
-1.660339, 1.807166, -0.7119824, 1, 0.2156863, 0, 1,
-1.639741, -0.1077327, -1.768233, 1, 0.2235294, 0, 1,
-1.618815, 0.6099762, -1.974445, 1, 0.227451, 0, 1,
-1.59819, -1.630522, -2.632701, 1, 0.2352941, 0, 1,
-1.589242, 0.6544151, -2.882388, 1, 0.2392157, 0, 1,
-1.577426, 0.4947006, -1.83222, 1, 0.2470588, 0, 1,
-1.565779, -0.1689781, -1.332746, 1, 0.2509804, 0, 1,
-1.563256, 0.05892282, -1.345912, 1, 0.2588235, 0, 1,
-1.55352, 0.1445759, -1.431127, 1, 0.2627451, 0, 1,
-1.551241, 0.4863864, -0.3149586, 1, 0.2705882, 0, 1,
-1.548182, -1.295072, -2.584958, 1, 0.2745098, 0, 1,
-1.535304, 0.7675617, -0.7674413, 1, 0.282353, 0, 1,
-1.527935, -0.1811456, -1.783748, 1, 0.2862745, 0, 1,
-1.508612, 0.2875055, -1.681958, 1, 0.2941177, 0, 1,
-1.505412, 0.008808985, -1.757851, 1, 0.3019608, 0, 1,
-1.492636, 0.519188, -2.555379, 1, 0.3058824, 0, 1,
-1.483946, 0.317663, -1.939486, 1, 0.3137255, 0, 1,
-1.473527, 0.5800121, -0.8571188, 1, 0.3176471, 0, 1,
-1.473145, -0.545478, -1.675794, 1, 0.3254902, 0, 1,
-1.467404, -1.422117, -3.11968, 1, 0.3294118, 0, 1,
-1.462502, 0.02259676, -2.150056, 1, 0.3372549, 0, 1,
-1.461257, -2.081873, -3.006946, 1, 0.3411765, 0, 1,
-1.45947, -0.6813653, -0.2329092, 1, 0.3490196, 0, 1,
-1.459416, -1.343228, -2.752971, 1, 0.3529412, 0, 1,
-1.455615, -0.117493, -0.8389242, 1, 0.3607843, 0, 1,
-1.446286, -0.79835, -3.161273, 1, 0.3647059, 0, 1,
-1.432335, -0.08078392, -2.184597, 1, 0.372549, 0, 1,
-1.425901, -0.4833494, -1.716912, 1, 0.3764706, 0, 1,
-1.424402, 0.7505428, -3.110618, 1, 0.3843137, 0, 1,
-1.420274, 0.5330533, -1.692822, 1, 0.3882353, 0, 1,
-1.420163, -0.1836288, -2.579087, 1, 0.3960784, 0, 1,
-1.416766, -2.041168, -2.266861, 1, 0.4039216, 0, 1,
-1.413869, 0.2076341, -0.864525, 1, 0.4078431, 0, 1,
-1.393998, -0.02313753, -4.001607, 1, 0.4156863, 0, 1,
-1.392548, 0.43459, 0.2285579, 1, 0.4196078, 0, 1,
-1.389258, -0.09259518, -1.085035, 1, 0.427451, 0, 1,
-1.381635, 0.3471781, -1.172223, 1, 0.4313726, 0, 1,
-1.373762, -1.688866, -2.836314, 1, 0.4392157, 0, 1,
-1.372913, -0.7644866, -1.054287, 1, 0.4431373, 0, 1,
-1.347156, 1.093456, -2.049011, 1, 0.4509804, 0, 1,
-1.342935, -0.1789471, -1.219235, 1, 0.454902, 0, 1,
-1.342787, 0.09425823, -2.067417, 1, 0.4627451, 0, 1,
-1.342697, -0.6828262, -2.55344, 1, 0.4666667, 0, 1,
-1.337789, 0.3178383, -2.854004, 1, 0.4745098, 0, 1,
-1.337327, 0.05583264, -1.962871, 1, 0.4784314, 0, 1,
-1.333427, 0.3656899, -2.953301, 1, 0.4862745, 0, 1,
-1.330846, -1.448604, -3.093442, 1, 0.4901961, 0, 1,
-1.330772, 0.1254922, -1.877859, 1, 0.4980392, 0, 1,
-1.327511, 0.1763175, -0.5703797, 1, 0.5058824, 0, 1,
-1.322825, 0.8019183, -0.4602108, 1, 0.509804, 0, 1,
-1.314366, 0.7520702, -1.994721, 1, 0.5176471, 0, 1,
-1.292642, 1.66945, -0.4424641, 1, 0.5215687, 0, 1,
-1.274865, -0.1157629, -2.243145, 1, 0.5294118, 0, 1,
-1.274859, 0.2613956, 0.05007562, 1, 0.5333334, 0, 1,
-1.267143, 0.08917479, -0.05530827, 1, 0.5411765, 0, 1,
-1.257599, -0.4565875, -2.813443, 1, 0.5450981, 0, 1,
-1.256227, -0.4989623, -1.815788, 1, 0.5529412, 0, 1,
-1.255002, -2.340324, -3.056587, 1, 0.5568628, 0, 1,
-1.253807, 0.5933784, -3.005478, 1, 0.5647059, 0, 1,
-1.240776, 1.099078, -0.5223927, 1, 0.5686275, 0, 1,
-1.239508, -0.5068438, -1.454326, 1, 0.5764706, 0, 1,
-1.233023, 1.748227, -1.662528, 1, 0.5803922, 0, 1,
-1.225594, -0.6987018, -1.479813, 1, 0.5882353, 0, 1,
-1.22398, 0.5709778, -3.529505, 1, 0.5921569, 0, 1,
-1.219949, 0.2822752, -1.014889, 1, 0.6, 0, 1,
-1.213731, -0.2558496, -2.119159, 1, 0.6078432, 0, 1,
-1.208433, -0.0394153, -0.6513994, 1, 0.6117647, 0, 1,
-1.200789, -1.374911, -3.252652, 1, 0.6196079, 0, 1,
-1.198761, 0.8991158, -0.5213951, 1, 0.6235294, 0, 1,
-1.197584, -0.7676511, -0.240444, 1, 0.6313726, 0, 1,
-1.191792, 0.8611121, -2.723132, 1, 0.6352941, 0, 1,
-1.186466, -1.774224, -1.307932, 1, 0.6431373, 0, 1,
-1.184611, -0.2688942, -1.259352, 1, 0.6470588, 0, 1,
-1.170991, 0.7420576, -2.991693, 1, 0.654902, 0, 1,
-1.162274, 0.1425559, -1.575226, 1, 0.6588235, 0, 1,
-1.162274, -0.7171044, -2.050052, 1, 0.6666667, 0, 1,
-1.149964, -0.3582422, -2.112852, 1, 0.6705883, 0, 1,
-1.147443, -1.449475, -1.672204, 1, 0.6784314, 0, 1,
-1.139743, 0.092718, -3.612464, 1, 0.682353, 0, 1,
-1.1384, 0.3550837, -2.364399, 1, 0.6901961, 0, 1,
-1.137239, -0.638173, -0.5643821, 1, 0.6941177, 0, 1,
-1.13539, 0.4275614, -0.8849345, 1, 0.7019608, 0, 1,
-1.132106, -0.8286533, -1.99436, 1, 0.7098039, 0, 1,
-1.130537, 1.453578, -0.322496, 1, 0.7137255, 0, 1,
-1.124088, -0.3947767, -1.994054, 1, 0.7215686, 0, 1,
-1.115909, -1.185857, -1.772449, 1, 0.7254902, 0, 1,
-1.104724, 0.2874204, -2.972451, 1, 0.7333333, 0, 1,
-1.099062, -0.5783895, -3.190243, 1, 0.7372549, 0, 1,
-1.090276, -0.6377014, -3.083345, 1, 0.7450981, 0, 1,
-1.083134, 1.185173, -0.4574254, 1, 0.7490196, 0, 1,
-1.079702, 0.3776548, -0.8033522, 1, 0.7568628, 0, 1,
-1.066993, -1.323372, -1.165855, 1, 0.7607843, 0, 1,
-1.066829, 0.6812378, -1.682959, 1, 0.7686275, 0, 1,
-1.063236, 0.5970448, -2.05387, 1, 0.772549, 0, 1,
-1.060305, 0.7250611, 2.242626, 1, 0.7803922, 0, 1,
-1.059432, 0.2711606, -2.718156, 1, 0.7843137, 0, 1,
-1.05342, -0.4367694, -0.8909977, 1, 0.7921569, 0, 1,
-1.033203, -0.3402387, -1.933117, 1, 0.7960784, 0, 1,
-1.024423, -0.9438209, -2.05689, 1, 0.8039216, 0, 1,
-1.022552, -0.6258541, -2.925756, 1, 0.8117647, 0, 1,
-1.012234, 0.7134922, -2.105986, 1, 0.8156863, 0, 1,
-1.004861, -0.9002565, -1.939738, 1, 0.8235294, 0, 1,
-1.004272, -0.5897468, -3.803262, 1, 0.827451, 0, 1,
-0.9953217, -0.09436734, -1.338504, 1, 0.8352941, 0, 1,
-0.9876336, 0.9192016, -1.367127, 1, 0.8392157, 0, 1,
-0.9869356, -0.9067206, -3.171528, 1, 0.8470588, 0, 1,
-0.9822064, -0.8299079, -3.493546, 1, 0.8509804, 0, 1,
-0.9816358, -0.1253443, -2.645635, 1, 0.8588235, 0, 1,
-0.9718811, -1.739427, -3.665351, 1, 0.8627451, 0, 1,
-0.9693984, -1.346494, -0.2376509, 1, 0.8705882, 0, 1,
-0.9689892, -0.1291298, -1.671049, 1, 0.8745098, 0, 1,
-0.9623315, -0.228871, -1.139866, 1, 0.8823529, 0, 1,
-0.9586028, 1.540986, 0.4815882, 1, 0.8862745, 0, 1,
-0.9559157, -2.386486, -1.626572, 1, 0.8941177, 0, 1,
-0.9547646, -0.2774946, -1.346534, 1, 0.8980392, 0, 1,
-0.9547167, -1.315127, -4.288271, 1, 0.9058824, 0, 1,
-0.9493916, 0.4073884, -1.584952, 1, 0.9137255, 0, 1,
-0.9488875, 0.9834203, -2.231659, 1, 0.9176471, 0, 1,
-0.9482759, 0.9991905, -1.479203, 1, 0.9254902, 0, 1,
-0.9354573, -0.01166272, -0.3254893, 1, 0.9294118, 0, 1,
-0.9292988, -0.1539687, -2.983743, 1, 0.9372549, 0, 1,
-0.9285886, 1.106371, -0.5968885, 1, 0.9411765, 0, 1,
-0.9236318, 0.4121978, -1.443657, 1, 0.9490196, 0, 1,
-0.9214455, -0.435735, -2.956582, 1, 0.9529412, 0, 1,
-0.9166024, -0.9093969, -2.123538, 1, 0.9607843, 0, 1,
-0.9140505, 0.8346157, 0.0748924, 1, 0.9647059, 0, 1,
-0.9108906, 1.614294, -1.734303, 1, 0.972549, 0, 1,
-0.9063175, -0.5622886, -1.86894, 1, 0.9764706, 0, 1,
-0.9020775, -1.202386, -2.188466, 1, 0.9843137, 0, 1,
-0.8968008, -1.087956, -2.970387, 1, 0.9882353, 0, 1,
-0.89389, 0.8324553, -1.701092, 1, 0.9960784, 0, 1,
-0.8809987, 0.1993296, 0.2035675, 0.9960784, 1, 0, 1,
-0.8741975, -2.108397, -3.319111, 0.9921569, 1, 0, 1,
-0.8711215, -0.1431294, -2.726193, 0.9843137, 1, 0, 1,
-0.8656341, 0.5989643, -0.2598833, 0.9803922, 1, 0, 1,
-0.8546661, 1.268368, -1.027942, 0.972549, 1, 0, 1,
-0.8544145, 0.8973886, -0.4218166, 0.9686275, 1, 0, 1,
-0.8524228, 0.01643434, -3.512849, 0.9607843, 1, 0, 1,
-0.8353243, 0.6476591, -1.763707, 0.9568627, 1, 0, 1,
-0.8316789, 0.3763716, -0.5472346, 0.9490196, 1, 0, 1,
-0.8316696, -0.1391014, -2.088446, 0.945098, 1, 0, 1,
-0.8293815, 0.4489573, -2.526084, 0.9372549, 1, 0, 1,
-0.82769, -0.7508505, -0.8813349, 0.9333333, 1, 0, 1,
-0.8221064, -1.236084, -2.113198, 0.9254902, 1, 0, 1,
-0.8178651, -0.3315022, -1.878094, 0.9215686, 1, 0, 1,
-0.8131452, 1.57244, -1.342391, 0.9137255, 1, 0, 1,
-0.810624, -0.9719923, -4.060553, 0.9098039, 1, 0, 1,
-0.8038162, -0.2279142, -1.232891, 0.9019608, 1, 0, 1,
-0.8033742, -0.9253079, -2.216333, 0.8941177, 1, 0, 1,
-0.7916175, -0.7947138, -3.010929, 0.8901961, 1, 0, 1,
-0.7897057, 0.6432844, 0.7389072, 0.8823529, 1, 0, 1,
-0.7895533, 0.7010843, 1.54939, 0.8784314, 1, 0, 1,
-0.7877697, -0.4662583, -2.126454, 0.8705882, 1, 0, 1,
-0.7861061, -0.0520503, -1.696415, 0.8666667, 1, 0, 1,
-0.784429, 1.111689, -0.4765653, 0.8588235, 1, 0, 1,
-0.7793013, -1.609219, -2.034037, 0.854902, 1, 0, 1,
-0.7770677, 0.4123084, -2.859785, 0.8470588, 1, 0, 1,
-0.7763836, 0.3735361, -1.98417, 0.8431373, 1, 0, 1,
-0.7757035, 1.491182, 0.5699915, 0.8352941, 1, 0, 1,
-0.7752243, 2.258504, -0.8086241, 0.8313726, 1, 0, 1,
-0.7738292, -0.24263, -2.955396, 0.8235294, 1, 0, 1,
-0.7720262, -0.5916994, -2.515625, 0.8196079, 1, 0, 1,
-0.7694312, 0.01267879, -0.3198791, 0.8117647, 1, 0, 1,
-0.7694095, -0.4092652, -2.579371, 0.8078431, 1, 0, 1,
-0.7674632, 1.082805, -1.233015, 0.8, 1, 0, 1,
-0.7594951, -2.18162, -2.930481, 0.7921569, 1, 0, 1,
-0.7586872, -0.2671102, -2.629327, 0.7882353, 1, 0, 1,
-0.7494587, -0.2776656, -3.000713, 0.7803922, 1, 0, 1,
-0.7346816, -0.3691529, -4.075598, 0.7764706, 1, 0, 1,
-0.7317345, -1.348383, -2.734205, 0.7686275, 1, 0, 1,
-0.730416, 1.68723, 0.5609334, 0.7647059, 1, 0, 1,
-0.7215518, 0.8042163, -0.8908078, 0.7568628, 1, 0, 1,
-0.7203771, -0.3406873, -1.345017, 0.7529412, 1, 0, 1,
-0.7184575, -2.017259, -3.68195, 0.7450981, 1, 0, 1,
-0.7085598, 0.3746873, 0.0220784, 0.7411765, 1, 0, 1,
-0.7047265, -0.3746892, -2.804743, 0.7333333, 1, 0, 1,
-0.7036133, 0.6974457, -0.1798174, 0.7294118, 1, 0, 1,
-0.702306, 0.2536519, -1.13879, 0.7215686, 1, 0, 1,
-0.701173, 2.111819, -2.252939, 0.7176471, 1, 0, 1,
-0.6970583, -1.430072, -5.430909, 0.7098039, 1, 0, 1,
-0.6915128, -0.2191114, -1.542814, 0.7058824, 1, 0, 1,
-0.6892129, -0.4412836, -1.6998, 0.6980392, 1, 0, 1,
-0.6883735, -0.9615325, -1.790686, 0.6901961, 1, 0, 1,
-0.6850315, -1.31626, -3.65886, 0.6862745, 1, 0, 1,
-0.681821, -2.299583, -1.406716, 0.6784314, 1, 0, 1,
-0.6808268, 0.2978534, -1.204852, 0.6745098, 1, 0, 1,
-0.6780567, 2.094683, 0.1160367, 0.6666667, 1, 0, 1,
-0.6708159, -1.307553, -3.884435, 0.6627451, 1, 0, 1,
-0.6670342, -1.973907, -3.181023, 0.654902, 1, 0, 1,
-0.6628231, 1.827319, -0.9508132, 0.6509804, 1, 0, 1,
-0.6608447, -0.708018, -2.360813, 0.6431373, 1, 0, 1,
-0.6601037, -0.8610801, -3.175449, 0.6392157, 1, 0, 1,
-0.6600968, -0.03460607, -1.438338, 0.6313726, 1, 0, 1,
-0.6567819, -0.2920426, -2.74915, 0.627451, 1, 0, 1,
-0.6549792, 0.6184435, -2.062191, 0.6196079, 1, 0, 1,
-0.6530734, -1.818309, -2.414644, 0.6156863, 1, 0, 1,
-0.6524247, -1.647735, -3.638653, 0.6078432, 1, 0, 1,
-0.6505947, 0.4136866, -0.6290724, 0.6039216, 1, 0, 1,
-0.6492503, -1.439605, -1.921816, 0.5960785, 1, 0, 1,
-0.6436794, 0.9295149, -1.224148, 0.5882353, 1, 0, 1,
-0.6371974, -0.9308106, -2.52968, 0.5843138, 1, 0, 1,
-0.6337139, 0.659728, -0.2933438, 0.5764706, 1, 0, 1,
-0.6158243, -0.1558758, -1.900444, 0.572549, 1, 0, 1,
-0.6150131, 0.8458572, -1.966351, 0.5647059, 1, 0, 1,
-0.6119244, 0.4178244, -1.160234, 0.5607843, 1, 0, 1,
-0.6079676, 1.038105, -0.3449478, 0.5529412, 1, 0, 1,
-0.6056201, 0.6211228, -1.820791, 0.5490196, 1, 0, 1,
-0.6039127, -0.8641264, -1.898839, 0.5411765, 1, 0, 1,
-0.5950344, -0.4765407, -1.148801, 0.5372549, 1, 0, 1,
-0.5825285, -0.7264134, -2.274957, 0.5294118, 1, 0, 1,
-0.5812798, -1.503793, -2.450094, 0.5254902, 1, 0, 1,
-0.578384, 0.7534217, -2.011014, 0.5176471, 1, 0, 1,
-0.5779911, -1.189289, -2.218827, 0.5137255, 1, 0, 1,
-0.5757827, 1.366345, -2.645186, 0.5058824, 1, 0, 1,
-0.5733576, 0.4146929, -1.723056, 0.5019608, 1, 0, 1,
-0.5729254, -0.1059684, -0.311766, 0.4941176, 1, 0, 1,
-0.5708444, -1.205541, -3.337285, 0.4862745, 1, 0, 1,
-0.5693887, -0.5821409, -1.235923, 0.4823529, 1, 0, 1,
-0.5691876, 0.6840477, 0.9285106, 0.4745098, 1, 0, 1,
-0.5656877, -2.933913, -2.839673, 0.4705882, 1, 0, 1,
-0.5654685, -0.05550379, -0.5573344, 0.4627451, 1, 0, 1,
-0.5647378, -0.4300454, -1.590419, 0.4588235, 1, 0, 1,
-0.5641688, -0.2067523, -0.5248314, 0.4509804, 1, 0, 1,
-0.5626368, 0.6444451, -1.289389, 0.4470588, 1, 0, 1,
-0.5611044, 1.000311, -1.439252, 0.4392157, 1, 0, 1,
-0.5604715, -0.5024928, -0.2497871, 0.4352941, 1, 0, 1,
-0.5573522, -1.017231, -1.889754, 0.427451, 1, 0, 1,
-0.5454638, -0.3952158, 0.06501989, 0.4235294, 1, 0, 1,
-0.5424056, 0.1043807, -0.742416, 0.4156863, 1, 0, 1,
-0.5389255, -0.8171456, -2.470953, 0.4117647, 1, 0, 1,
-0.5335343, 0.53912, -1.960559, 0.4039216, 1, 0, 1,
-0.5322978, -0.3053027, -2.571877, 0.3960784, 1, 0, 1,
-0.5287761, -0.9510916, -0.7014213, 0.3921569, 1, 0, 1,
-0.5263379, -0.06890987, -1.021464, 0.3843137, 1, 0, 1,
-0.525096, 2.758759, -0.2424101, 0.3803922, 1, 0, 1,
-0.5230983, 0.04958895, -1.191463, 0.372549, 1, 0, 1,
-0.5167203, -0.8220557, -1.101718, 0.3686275, 1, 0, 1,
-0.5162464, -1.611904, -3.979084, 0.3607843, 1, 0, 1,
-0.512659, 0.5031456, -2.273299, 0.3568628, 1, 0, 1,
-0.508664, -0.8035986, -3.70434, 0.3490196, 1, 0, 1,
-0.507634, -1.382832, -3.81459, 0.345098, 1, 0, 1,
-0.5054447, -3.440884, -4.27503, 0.3372549, 1, 0, 1,
-0.5036767, -0.469771, -2.026907, 0.3333333, 1, 0, 1,
-0.5005773, -0.6292549, -1.095136, 0.3254902, 1, 0, 1,
-0.4899853, -0.5517677, -3.241996, 0.3215686, 1, 0, 1,
-0.4884973, 0.1462658, -0.3902436, 0.3137255, 1, 0, 1,
-0.4859065, -0.9020137, -1.497369, 0.3098039, 1, 0, 1,
-0.4852779, -0.08641268, -1.036755, 0.3019608, 1, 0, 1,
-0.4778597, -0.2140467, -1.335966, 0.2941177, 1, 0, 1,
-0.4766671, -0.4132376, -2.294865, 0.2901961, 1, 0, 1,
-0.4762329, 1.248044, -1.364335, 0.282353, 1, 0, 1,
-0.4729952, -2.050971, -1.278769, 0.2784314, 1, 0, 1,
-0.4709551, -0.4168987, -3.052727, 0.2705882, 1, 0, 1,
-0.4688992, 1.933335, 0.04141922, 0.2666667, 1, 0, 1,
-0.4675564, 0.1358137, -1.342806, 0.2588235, 1, 0, 1,
-0.4675482, 0.1946161, -1.164144, 0.254902, 1, 0, 1,
-0.4649621, -0.2821633, -1.1304, 0.2470588, 1, 0, 1,
-0.4646775, 0.02871845, -0.08960961, 0.2431373, 1, 0, 1,
-0.4639872, 0.117874, -0.08955922, 0.2352941, 1, 0, 1,
-0.4619492, -2.384547, -1.203703, 0.2313726, 1, 0, 1,
-0.4596973, -2.44881, -2.275647, 0.2235294, 1, 0, 1,
-0.4509211, -1.030768, -1.66596, 0.2196078, 1, 0, 1,
-0.4478419, 1.064121, 0.1644388, 0.2117647, 1, 0, 1,
-0.4414716, 0.4243636, -0.9104165, 0.2078431, 1, 0, 1,
-0.4387892, 0.1843176, -0.8686004, 0.2, 1, 0, 1,
-0.4381083, -1.054406, -1.971689, 0.1921569, 1, 0, 1,
-0.4358575, -0.4548614, -3.066579, 0.1882353, 1, 0, 1,
-0.4325858, 2.064226, -0.2729398, 0.1803922, 1, 0, 1,
-0.4309945, -0.1746792, -0.7469885, 0.1764706, 1, 0, 1,
-0.4292641, 0.03285726, -1.551502, 0.1686275, 1, 0, 1,
-0.4234954, 1.139681, -0.7744368, 0.1647059, 1, 0, 1,
-0.4165433, 1.76394, -0.9959041, 0.1568628, 1, 0, 1,
-0.4158638, 1.435335, -0.3243141, 0.1529412, 1, 0, 1,
-0.4143794, 0.3236121, -0.7415422, 0.145098, 1, 0, 1,
-0.4142572, -0.5108689, -3.819869, 0.1411765, 1, 0, 1,
-0.4135453, -1.754741, -3.392622, 0.1333333, 1, 0, 1,
-0.4130635, 0.2005792, -2.489492, 0.1294118, 1, 0, 1,
-0.4127232, 0.248463, 1.247587, 0.1215686, 1, 0, 1,
-0.4103895, 0.4281335, 0.3274734, 0.1176471, 1, 0, 1,
-0.4055716, -0.4192172, -2.221821, 0.1098039, 1, 0, 1,
-0.3999812, -1.140934, -1.972662, 0.1058824, 1, 0, 1,
-0.3994886, -0.1258862, -0.6124897, 0.09803922, 1, 0, 1,
-0.3982072, -0.7811287, -2.599458, 0.09019608, 1, 0, 1,
-0.3966404, -0.08755454, -1.896456, 0.08627451, 1, 0, 1,
-0.3963927, -1.359327, -1.629176, 0.07843138, 1, 0, 1,
-0.3962322, 0.07066223, -1.840825, 0.07450981, 1, 0, 1,
-0.3930775, -0.4633814, -3.873972, 0.06666667, 1, 0, 1,
-0.3929299, 0.2630865, -1.52424, 0.0627451, 1, 0, 1,
-0.3905423, -0.4123631, -3.394536, 0.05490196, 1, 0, 1,
-0.3892151, 0.06540039, -2.180816, 0.05098039, 1, 0, 1,
-0.3853182, -0.0008200416, -1.374092, 0.04313726, 1, 0, 1,
-0.3826407, 0.5482771, -1.902616, 0.03921569, 1, 0, 1,
-0.3808973, 1.072358, 0.6552536, 0.03137255, 1, 0, 1,
-0.3802853, -0.3466589, -2.469608, 0.02745098, 1, 0, 1,
-0.3766466, 1.115802, 0.6678906, 0.01960784, 1, 0, 1,
-0.3746257, 1.659389, 0.8254142, 0.01568628, 1, 0, 1,
-0.3709856, -1.295668, -2.444731, 0.007843138, 1, 0, 1,
-0.3707106, 0.1923985, -1.840575, 0.003921569, 1, 0, 1,
-0.3704194, 0.5685806, -1.300357, 0, 1, 0.003921569, 1,
-0.3641856, -3.135938, -1.119734, 0, 1, 0.01176471, 1,
-0.3641723, 0.1697763, 0.286641, 0, 1, 0.01568628, 1,
-0.362761, 0.3900996, -0.7557859, 0, 1, 0.02352941, 1,
-0.357409, -1.019645, -4.143871, 0, 1, 0.02745098, 1,
-0.3546692, 0.5989293, -3.112318, 0, 1, 0.03529412, 1,
-0.3516708, 2.338014, -0.5002802, 0, 1, 0.03921569, 1,
-0.3477428, 0.7016443, 0.091678, 0, 1, 0.04705882, 1,
-0.3464574, 0.3012608, -0.5277436, 0, 1, 0.05098039, 1,
-0.3458382, -0.4085231, -1.034723, 0, 1, 0.05882353, 1,
-0.3452265, 2.175364, -1.699664, 0, 1, 0.0627451, 1,
-0.3380148, -0.6310127, -3.062394, 0, 1, 0.07058824, 1,
-0.337499, 0.4154783, -1.903045, 0, 1, 0.07450981, 1,
-0.3337735, -2.131805, -1.730734, 0, 1, 0.08235294, 1,
-0.3301677, 0.6993324, -1.460472, 0, 1, 0.08627451, 1,
-0.3288622, -0.3784055, -3.655459, 0, 1, 0.09411765, 1,
-0.3258397, -0.163804, -1.590557, 0, 1, 0.1019608, 1,
-0.3246659, -1.124625, -4.661606, 0, 1, 0.1058824, 1,
-0.3203506, 0.08890927, -1.002697, 0, 1, 0.1137255, 1,
-0.317426, 0.3783328, -0.2808117, 0, 1, 0.1176471, 1,
-0.3075, -1.30536, -3.69871, 0, 1, 0.1254902, 1,
-0.3072021, -0.1408757, -2.415081, 0, 1, 0.1294118, 1,
-0.304098, 0.4523889, -1.333484, 0, 1, 0.1372549, 1,
-0.3033934, -0.2783894, -2.910218, 0, 1, 0.1411765, 1,
-0.3012211, -2.571144, -2.681172, 0, 1, 0.1490196, 1,
-0.3011355, 1.130843, -0.144403, 0, 1, 0.1529412, 1,
-0.2997231, -1.645771, -3.352637, 0, 1, 0.1607843, 1,
-0.2971062, -0.3189741, -1.780479, 0, 1, 0.1647059, 1,
-0.2958445, -0.3260023, -2.372355, 0, 1, 0.172549, 1,
-0.2946777, 0.08468816, -1.135919, 0, 1, 0.1764706, 1,
-0.2944759, 1.314488, 0.6987446, 0, 1, 0.1843137, 1,
-0.2920657, 0.1179745, -0.6384903, 0, 1, 0.1882353, 1,
-0.2889855, 1.460655, -0.128823, 0, 1, 0.1960784, 1,
-0.288378, 0.9821017, 0.2148745, 0, 1, 0.2039216, 1,
-0.2818889, 1.661932, -1.077356, 0, 1, 0.2078431, 1,
-0.2756212, 0.5226722, -1.113922, 0, 1, 0.2156863, 1,
-0.2738498, -1.269139, -2.371754, 0, 1, 0.2196078, 1,
-0.2723088, 1.622306, 0.728896, 0, 1, 0.227451, 1,
-0.2713271, 0.4624519, -0.9577269, 0, 1, 0.2313726, 1,
-0.2694228, 1.542758, 0.3087895, 0, 1, 0.2392157, 1,
-0.2649798, -0.1855105, -0.541994, 0, 1, 0.2431373, 1,
-0.2599131, -0.194772, -1.924272, 0, 1, 0.2509804, 1,
-0.2593031, 0.1501656, -2.810181, 0, 1, 0.254902, 1,
-0.2571336, 1.377571, -0.6862147, 0, 1, 0.2627451, 1,
-0.2503188, 1.157737, 0.7373862, 0, 1, 0.2666667, 1,
-0.2471365, -1.257707, -2.379573, 0, 1, 0.2745098, 1,
-0.2465786, 0.9531222, 0.170189, 0, 1, 0.2784314, 1,
-0.2463587, -0.4263864, -2.404006, 0, 1, 0.2862745, 1,
-0.2453337, -0.4374781, -2.972075, 0, 1, 0.2901961, 1,
-0.2451351, 0.8676806, -0.8384749, 0, 1, 0.2980392, 1,
-0.2439741, -0.4388513, -2.774755, 0, 1, 0.3058824, 1,
-0.2437201, 0.9591783, -0.3635127, 0, 1, 0.3098039, 1,
-0.2404466, -0.3480633, -4.114768, 0, 1, 0.3176471, 1,
-0.2363459, -0.2502378, -2.758479, 0, 1, 0.3215686, 1,
-0.2363358, 0.7462921, -1.267971, 0, 1, 0.3294118, 1,
-0.2352463, 0.7802032, -0.3523762, 0, 1, 0.3333333, 1,
-0.2349682, -1.305, -4.446795, 0, 1, 0.3411765, 1,
-0.2338998, -2.133343, -2.554241, 0, 1, 0.345098, 1,
-0.2318085, -0.1263115, -1.736795, 0, 1, 0.3529412, 1,
-0.2294971, 0.9379554, -0.192863, 0, 1, 0.3568628, 1,
-0.2289391, -0.5809237, -2.058133, 0, 1, 0.3647059, 1,
-0.2277812, 1.161733, -0.1094799, 0, 1, 0.3686275, 1,
-0.2269867, 0.2300188, -0.3698832, 0, 1, 0.3764706, 1,
-0.2260655, 1.55924, 1.281536, 0, 1, 0.3803922, 1,
-0.2183414, -0.5207456, -1.862076, 0, 1, 0.3882353, 1,
-0.213438, -2.308451, -4.268618, 0, 1, 0.3921569, 1,
-0.2133987, -1.076153, -2.978066, 0, 1, 0.4, 1,
-0.2121679, 0.05010308, -1.656447, 0, 1, 0.4078431, 1,
-0.2085951, -1.021731, -3.104278, 0, 1, 0.4117647, 1,
-0.2063469, 0.1721003, -1.31028, 0, 1, 0.4196078, 1,
-0.2054555, 2.00036, 0.9708586, 0, 1, 0.4235294, 1,
-0.2040718, -1.851272, -1.763037, 0, 1, 0.4313726, 1,
-0.2021256, -1.760759, -1.770643, 0, 1, 0.4352941, 1,
-0.2017746, -0.7507116, -2.924233, 0, 1, 0.4431373, 1,
-0.1998706, -0.1428919, -2.318005, 0, 1, 0.4470588, 1,
-0.1989145, -2.399209, -4.52825, 0, 1, 0.454902, 1,
-0.1988069, 0.632043, -0.240386, 0, 1, 0.4588235, 1,
-0.1983729, 0.96253, -0.1181448, 0, 1, 0.4666667, 1,
-0.1973406, 0.1432931, -0.9360664, 0, 1, 0.4705882, 1,
-0.1940409, -0.479708, -1.836427, 0, 1, 0.4784314, 1,
-0.1910134, 0.4002356, -1.120942, 0, 1, 0.4823529, 1,
-0.1906094, -0.5004861, -2.418831, 0, 1, 0.4901961, 1,
-0.1892419, 0.2558187, -0.8681192, 0, 1, 0.4941176, 1,
-0.1872191, 0.4056656, 0.3106066, 0, 1, 0.5019608, 1,
-0.1820051, 0.3349627, -0.04789152, 0, 1, 0.509804, 1,
-0.1783531, 1.248187, -1.848567, 0, 1, 0.5137255, 1,
-0.1778006, 0.6170367, -0.484822, 0, 1, 0.5215687, 1,
-0.1754856, 0.006252805, -1.335762, 0, 1, 0.5254902, 1,
-0.173953, -0.8688697, -4.617652, 0, 1, 0.5333334, 1,
-0.168377, -0.3263083, -1.99544, 0, 1, 0.5372549, 1,
-0.1657262, -0.6167357, -2.319188, 0, 1, 0.5450981, 1,
-0.1652923, 0.6916887, -1.422118, 0, 1, 0.5490196, 1,
-0.1631173, -0.8906531, -2.625313, 0, 1, 0.5568628, 1,
-0.1615959, -0.9439321, -4.561926, 0, 1, 0.5607843, 1,
-0.1592845, 1.241751, 0.374846, 0, 1, 0.5686275, 1,
-0.1591794, -0.5279552, -2.603277, 0, 1, 0.572549, 1,
-0.1562397, -1.968633, -0.686482, 0, 1, 0.5803922, 1,
-0.1547759, 0.9937313, 0.682281, 0, 1, 0.5843138, 1,
-0.154461, -0.7071862, -3.098203, 0, 1, 0.5921569, 1,
-0.1533228, 1.121679, -0.5570849, 0, 1, 0.5960785, 1,
-0.1515523, 0.7411131, -0.3522764, 0, 1, 0.6039216, 1,
-0.1513228, -1.496364, -3.923338, 0, 1, 0.6117647, 1,
-0.1420289, -0.2938374, -2.493229, 0, 1, 0.6156863, 1,
-0.1388781, -1.213652, -1.800432, 0, 1, 0.6235294, 1,
-0.1364601, 0.8474011, -0.7623032, 0, 1, 0.627451, 1,
-0.1315457, -1.946472, -2.594115, 0, 1, 0.6352941, 1,
-0.1275965, -1.621123, -4.001978, 0, 1, 0.6392157, 1,
-0.1266311, 0.02991979, -2.404823, 0, 1, 0.6470588, 1,
-0.1242249, -0.3588418, -2.079203, 0, 1, 0.6509804, 1,
-0.1227811, 0.8791281, -0.7226756, 0, 1, 0.6588235, 1,
-0.1189432, -1.094189, -3.417284, 0, 1, 0.6627451, 1,
-0.1078322, 0.08040318, -1.47741, 0, 1, 0.6705883, 1,
-0.1038831, -0.6092901, -2.201016, 0, 1, 0.6745098, 1,
-0.09989148, 1.264816, 0.8567584, 0, 1, 0.682353, 1,
-0.09829149, 0.6831626, -0.5764587, 0, 1, 0.6862745, 1,
-0.09214572, 0.1705373, -0.9531649, 0, 1, 0.6941177, 1,
-0.07097761, -0.4679556, -3.65892, 0, 1, 0.7019608, 1,
-0.07010647, 0.62283, 1.658408, 0, 1, 0.7058824, 1,
-0.06219008, -0.435286, -2.78845, 0, 1, 0.7137255, 1,
-0.05253011, -1.038542, -2.636672, 0, 1, 0.7176471, 1,
-0.05076248, 0.3454635, 0.7344059, 0, 1, 0.7254902, 1,
-0.04912884, 0.4574887, -1.567207, 0, 1, 0.7294118, 1,
-0.03916815, -0.2895935, -2.040979, 0, 1, 0.7372549, 1,
-0.03902734, -0.1184441, -2.505489, 0, 1, 0.7411765, 1,
-0.03872152, -0.5895568, -2.233475, 0, 1, 0.7490196, 1,
-0.03080621, 0.9537817, 1.01635, 0, 1, 0.7529412, 1,
-0.03002405, 0.6656134, 1.349827, 0, 1, 0.7607843, 1,
-0.02609641, 0.4518402, 1.495361, 0, 1, 0.7647059, 1,
-0.02352027, 0.3627903, -1.391973, 0, 1, 0.772549, 1,
-0.02212976, -0.14037, -2.395087, 0, 1, 0.7764706, 1,
-0.01806687, -0.7360402, -2.536737, 0, 1, 0.7843137, 1,
-0.01771136, 0.8880936, 0.9874623, 0, 1, 0.7882353, 1,
-0.01624134, 0.3745305, 1.922231, 0, 1, 0.7960784, 1,
-0.016208, 0.5782703, -1.599465, 0, 1, 0.8039216, 1,
-0.01356484, -1.576091, -3.566406, 0, 1, 0.8078431, 1,
-0.00761683, -1.255029, -2.183251, 0, 1, 0.8156863, 1,
0.001567562, 0.521998, 1.316324, 0, 1, 0.8196079, 1,
0.002008657, -2.078112, 2.918207, 0, 1, 0.827451, 1,
0.009247475, -0.4215298, 2.837465, 0, 1, 0.8313726, 1,
0.01307284, -0.5612087, 4.781298, 0, 1, 0.8392157, 1,
0.02031328, 0.7176853, -0.2278558, 0, 1, 0.8431373, 1,
0.02037613, -0.1019514, 4.343105, 0, 1, 0.8509804, 1,
0.02066077, -0.4169125, 2.499229, 0, 1, 0.854902, 1,
0.0284396, 1.478099, 1.3866, 0, 1, 0.8627451, 1,
0.02894584, -1.529213, 3.561835, 0, 1, 0.8666667, 1,
0.03308725, 1.187647, -2.039005, 0, 1, 0.8745098, 1,
0.03427812, 1.375544, 0.791288, 0, 1, 0.8784314, 1,
0.0346483, 0.1083726, -0.9399521, 0, 1, 0.8862745, 1,
0.03587943, -0.352166, 1.904713, 0, 1, 0.8901961, 1,
0.04366765, -0.2196544, 3.213972, 0, 1, 0.8980392, 1,
0.04386537, -1.890985, 1.976432, 0, 1, 0.9058824, 1,
0.04530457, -2.32748, 2.270075, 0, 1, 0.9098039, 1,
0.04722439, -0.4863921, 4.283242, 0, 1, 0.9176471, 1,
0.04921047, -0.4156058, 3.878319, 0, 1, 0.9215686, 1,
0.04922767, -0.0829227, 1.226552, 0, 1, 0.9294118, 1,
0.05102177, 1.010984, -1.081869, 0, 1, 0.9333333, 1,
0.05177271, 3.834527, 1.617378, 0, 1, 0.9411765, 1,
0.05194879, -1.689533, 3.86646, 0, 1, 0.945098, 1,
0.05577263, 0.4699483, 0.4115424, 0, 1, 0.9529412, 1,
0.05835372, -1.264052, 2.745237, 0, 1, 0.9568627, 1,
0.05861225, 1.059049, -0.3705648, 0, 1, 0.9647059, 1,
0.06045082, 0.7264512, 0.795139, 0, 1, 0.9686275, 1,
0.06089072, -0.4461544, 2.68575, 0, 1, 0.9764706, 1,
0.06561964, 0.2941723, 0.2801259, 0, 1, 0.9803922, 1,
0.06797352, -1.221806, 2.446573, 0, 1, 0.9882353, 1,
0.07095759, -0.8290397, 2.422327, 0, 1, 0.9921569, 1,
0.0715569, -0.7054872, 3.70338, 0, 1, 1, 1,
0.07220466, -0.5826387, 2.662349, 0, 0.9921569, 1, 1,
0.0758623, 0.3804306, 0.3943197, 0, 0.9882353, 1, 1,
0.07619014, 0.6810959, 1.656456, 0, 0.9803922, 1, 1,
0.08040266, -0.3017405, 3.414927, 0, 0.9764706, 1, 1,
0.08064841, -0.6080328, 4.440405, 0, 0.9686275, 1, 1,
0.08099794, -0.121435, 2.738534, 0, 0.9647059, 1, 1,
0.08103683, 0.05936247, 0.2919327, 0, 0.9568627, 1, 1,
0.08405135, -1.307604, 2.976447, 0, 0.9529412, 1, 1,
0.08499167, -1.035439, 2.01438, 0, 0.945098, 1, 1,
0.08884757, -0.9354571, 3.298424, 0, 0.9411765, 1, 1,
0.09156408, -0.6923621, 3.153642, 0, 0.9333333, 1, 1,
0.09375365, -1.344446, 3.464694, 0, 0.9294118, 1, 1,
0.09568308, -1.820675, 3.510805, 0, 0.9215686, 1, 1,
0.1058983, -1.502625, 3.634313, 0, 0.9176471, 1, 1,
0.1097683, -1.094846, 2.86339, 0, 0.9098039, 1, 1,
0.1139788, -0.1934151, 3.344556, 0, 0.9058824, 1, 1,
0.1165632, -0.4943201, 2.893213, 0, 0.8980392, 1, 1,
0.1249847, -0.03463891, 3.693177, 0, 0.8901961, 1, 1,
0.1259361, 0.500421, -0.6973823, 0, 0.8862745, 1, 1,
0.1272419, 0.8175027, -0.6479846, 0, 0.8784314, 1, 1,
0.1296333, 0.7063321, -0.2530988, 0, 0.8745098, 1, 1,
0.141776, 0.1676416, -0.6992666, 0, 0.8666667, 1, 1,
0.1428059, 0.0736871, 1.255138, 0, 0.8627451, 1, 1,
0.1442465, -0.3447584, 3.041049, 0, 0.854902, 1, 1,
0.144446, -0.08411468, 3.049847, 0, 0.8509804, 1, 1,
0.1463294, -0.2308589, 3.515509, 0, 0.8431373, 1, 1,
0.1482678, 2.010614, -0.5885145, 0, 0.8392157, 1, 1,
0.1500557, -1.015966, 3.863672, 0, 0.8313726, 1, 1,
0.1515699, 1.598457, 0.6027731, 0, 0.827451, 1, 1,
0.1556948, -0.4226696, 3.919563, 0, 0.8196079, 1, 1,
0.1579873, 0.2872351, 1.971791, 0, 0.8156863, 1, 1,
0.1613204, -0.1882588, 1.602411, 0, 0.8078431, 1, 1,
0.1625236, 0.3353523, -0.2413278, 0, 0.8039216, 1, 1,
0.1628697, -1.359268, 3.723541, 0, 0.7960784, 1, 1,
0.1648628, 1.775638, 1.342533, 0, 0.7882353, 1, 1,
0.1658795, -0.5336421, 1.993119, 0, 0.7843137, 1, 1,
0.1677748, -2.3387, 4.452515, 0, 0.7764706, 1, 1,
0.1694498, -0.5624731, 2.570641, 0, 0.772549, 1, 1,
0.1723048, -0.2766358, 3.977689, 0, 0.7647059, 1, 1,
0.1729829, 0.6092643, 0.2097631, 0, 0.7607843, 1, 1,
0.1731766, 0.295611, 0.8486685, 0, 0.7529412, 1, 1,
0.1739433, 2.323936, -1.01509, 0, 0.7490196, 1, 1,
0.1751773, -1.339542, 2.031468, 0, 0.7411765, 1, 1,
0.1779341, -1.662438, 2.449811, 0, 0.7372549, 1, 1,
0.181531, 0.2965761, 1.782305, 0, 0.7294118, 1, 1,
0.1818319, 0.5421225, 0.7923765, 0, 0.7254902, 1, 1,
0.1847352, 2.366006, 1.332633, 0, 0.7176471, 1, 1,
0.1864429, 0.3586197, 0.8110369, 0, 0.7137255, 1, 1,
0.1871044, -1.700176, 4.104032, 0, 0.7058824, 1, 1,
0.1899352, 0.4497031, 1.191334, 0, 0.6980392, 1, 1,
0.1906475, -0.6182708, 2.718485, 0, 0.6941177, 1, 1,
0.1944364, 0.6639495, 0.6947905, 0, 0.6862745, 1, 1,
0.1947971, 1.436423, 0.0277202, 0, 0.682353, 1, 1,
0.1982214, 0.4076323, 0.1809983, 0, 0.6745098, 1, 1,
0.2025978, 0.3380724, 0.534062, 0, 0.6705883, 1, 1,
0.2055217, -0.2142339, 3.422694, 0, 0.6627451, 1, 1,
0.205788, 1.609195, -0.299365, 0, 0.6588235, 1, 1,
0.208555, 1.138916, 0.4258337, 0, 0.6509804, 1, 1,
0.2099881, -0.06541459, 1.734703, 0, 0.6470588, 1, 1,
0.2116697, -0.4394185, 2.488421, 0, 0.6392157, 1, 1,
0.2177019, 0.7517481, 0.301073, 0, 0.6352941, 1, 1,
0.2194298, 0.5325674, 0.7166788, 0, 0.627451, 1, 1,
0.2195856, 0.4739915, 0.2638785, 0, 0.6235294, 1, 1,
0.2246445, 1.888233, -1.928688, 0, 0.6156863, 1, 1,
0.2281187, 0.2408667, 1.152825, 0, 0.6117647, 1, 1,
0.2289249, 0.1545648, 0.9531375, 0, 0.6039216, 1, 1,
0.2314245, 2.205209, 0.2102646, 0, 0.5960785, 1, 1,
0.2327186, 0.5330863, 0.1096164, 0, 0.5921569, 1, 1,
0.2363246, 0.3818608, 1.848438, 0, 0.5843138, 1, 1,
0.2425608, 0.7869875, -1.465584, 0, 0.5803922, 1, 1,
0.2495747, 0.9471717, 1.80852, 0, 0.572549, 1, 1,
0.2497347, 0.08232942, 2.914322, 0, 0.5686275, 1, 1,
0.251277, -1.010449, 4.5916, 0, 0.5607843, 1, 1,
0.256927, -1.108564, 3.579858, 0, 0.5568628, 1, 1,
0.2576204, -0.7683687, 2.309265, 0, 0.5490196, 1, 1,
0.2578193, 0.2470112, 0.07684581, 0, 0.5450981, 1, 1,
0.2592537, 0.110046, 1.451934, 0, 0.5372549, 1, 1,
0.2597656, 0.0942519, 1.563695, 0, 0.5333334, 1, 1,
0.2618039, 0.390987, -1.005889, 0, 0.5254902, 1, 1,
0.262453, 0.83506, 1.941553, 0, 0.5215687, 1, 1,
0.263005, -2.689044, 1.987556, 0, 0.5137255, 1, 1,
0.263452, 1.104883, 1.907198, 0, 0.509804, 1, 1,
0.2680834, -0.1887651, 2.465007, 0, 0.5019608, 1, 1,
0.2751692, -0.1345907, 2.58144, 0, 0.4941176, 1, 1,
0.2772991, 1.829181, -0.5008414, 0, 0.4901961, 1, 1,
0.2784789, 1.456086, 0.01875129, 0, 0.4823529, 1, 1,
0.281123, -0.2499238, 1.617725, 0, 0.4784314, 1, 1,
0.2861075, 0.5701274, -0.4572802, 0, 0.4705882, 1, 1,
0.2870724, 1.131412, -0.2971083, 0, 0.4666667, 1, 1,
0.2934597, -0.0608455, 2.763009, 0, 0.4588235, 1, 1,
0.2936829, -1.901425, 4.991825, 0, 0.454902, 1, 1,
0.2945029, 0.8356429, -0.8711665, 0, 0.4470588, 1, 1,
0.2955393, -0.31207, 3.266812, 0, 0.4431373, 1, 1,
0.2964872, -1.541194, 3.402185, 0, 0.4352941, 1, 1,
0.2969837, 1.15854, -0.6521346, 0, 0.4313726, 1, 1,
0.2986564, 0.3708445, 1.051467, 0, 0.4235294, 1, 1,
0.2987802, 0.4073976, 1.389022, 0, 0.4196078, 1, 1,
0.2990446, -0.3242027, 3.531984, 0, 0.4117647, 1, 1,
0.2994028, -0.9222397, 2.603746, 0, 0.4078431, 1, 1,
0.3014664, 0.8505669, 0.006326295, 0, 0.4, 1, 1,
0.302693, -1.914004, 4.278988, 0, 0.3921569, 1, 1,
0.3054373, -0.1992493, 1.193184, 0, 0.3882353, 1, 1,
0.3055805, 0.001613388, 0.7847267, 0, 0.3803922, 1, 1,
0.3091083, -0.2468794, 1.794549, 0, 0.3764706, 1, 1,
0.3097413, 2.630309, 0.1622473, 0, 0.3686275, 1, 1,
0.3140027, 1.533594, -0.2444394, 0, 0.3647059, 1, 1,
0.3170723, 0.2446005, 0.9334916, 0, 0.3568628, 1, 1,
0.3207531, -1.892794, 2.848683, 0, 0.3529412, 1, 1,
0.323195, -0.7452233, 3.189293, 0, 0.345098, 1, 1,
0.3254851, 1.959407, 0.6589301, 0, 0.3411765, 1, 1,
0.3272212, -0.03864779, 2.538182, 0, 0.3333333, 1, 1,
0.3331806, -1.156763, 3.722588, 0, 0.3294118, 1, 1,
0.3352011, 0.8508905, 0.7528487, 0, 0.3215686, 1, 1,
0.3416409, 0.3784252, 1.413223, 0, 0.3176471, 1, 1,
0.3434702, -0.3041283, 2.622577, 0, 0.3098039, 1, 1,
0.3472, -1.941601, 2.380372, 0, 0.3058824, 1, 1,
0.3476453, -1.22753, 4.191746, 0, 0.2980392, 1, 1,
0.353172, -2.126215, 1.751789, 0, 0.2901961, 1, 1,
0.3542212, 0.7471406, 0.8403069, 0, 0.2862745, 1, 1,
0.3543357, 0.5695314, -0.09494337, 0, 0.2784314, 1, 1,
0.3593909, -0.1783846, 1.698254, 0, 0.2745098, 1, 1,
0.3603139, -0.6436528, 1.101082, 0, 0.2666667, 1, 1,
0.3608381, -0.8910661, 1.806867, 0, 0.2627451, 1, 1,
0.3618848, 0.1817915, 1.101091, 0, 0.254902, 1, 1,
0.361975, 0.426359, -1.324114, 0, 0.2509804, 1, 1,
0.3638717, 0.3894813, 0.7965709, 0, 0.2431373, 1, 1,
0.3684823, 1.439646, 0.8263091, 0, 0.2392157, 1, 1,
0.3697726, -0.8247072, 1.476889, 0, 0.2313726, 1, 1,
0.3714586, 0.09642282, 0.8681192, 0, 0.227451, 1, 1,
0.3723291, -2.496001, 2.951889, 0, 0.2196078, 1, 1,
0.3730506, 0.07760941, 0.9370194, 0, 0.2156863, 1, 1,
0.3731245, -0.2109287, 0.4042894, 0, 0.2078431, 1, 1,
0.3793166, 0.3772254, 0.5322386, 0, 0.2039216, 1, 1,
0.39023, -0.6352787, 3.168184, 0, 0.1960784, 1, 1,
0.3910513, -0.6140074, 0.5888851, 0, 0.1882353, 1, 1,
0.3985586, 0.8307968, 0.7342718, 0, 0.1843137, 1, 1,
0.4120781, 1.052111, 0.7476581, 0, 0.1764706, 1, 1,
0.4126593, -0.1492659, 2.230235, 0, 0.172549, 1, 1,
0.4130321, -0.8183914, 2.847538, 0, 0.1647059, 1, 1,
0.4132307, 1.101691, 0.9130569, 0, 0.1607843, 1, 1,
0.41384, -0.4088593, 3.010113, 0, 0.1529412, 1, 1,
0.4149491, -1.03637, 2.549653, 0, 0.1490196, 1, 1,
0.4188697, 1.627577, -0.2167012, 0, 0.1411765, 1, 1,
0.4207152, 1.117932, -0.4640307, 0, 0.1372549, 1, 1,
0.4216288, -0.7764845, 3.772244, 0, 0.1294118, 1, 1,
0.4222013, -0.214236, 2.172277, 0, 0.1254902, 1, 1,
0.4259775, 0.1909699, 0.1976182, 0, 0.1176471, 1, 1,
0.4339302, -0.3630626, 2.87102, 0, 0.1137255, 1, 1,
0.4353976, 0.9631724, 1.112668, 0, 0.1058824, 1, 1,
0.4369048, -0.8762935, 3.073106, 0, 0.09803922, 1, 1,
0.4438171, -0.2563774, 2.209649, 0, 0.09411765, 1, 1,
0.4466698, -1.245222, 2.920336, 0, 0.08627451, 1, 1,
0.4497283, -0.5058457, 2.378871, 0, 0.08235294, 1, 1,
0.450833, 0.6151904, 2.267173, 0, 0.07450981, 1, 1,
0.4524633, 0.7560751, 0.901382, 0, 0.07058824, 1, 1,
0.4539452, 1.392694, 0.8064995, 0, 0.0627451, 1, 1,
0.4559178, 0.5732413, 0.7265602, 0, 0.05882353, 1, 1,
0.4573849, -1.371135, 4.147998, 0, 0.05098039, 1, 1,
0.4605307, -1.96482, 3.25966, 0, 0.04705882, 1, 1,
0.4661528, 0.6017137, 1.533315, 0, 0.03921569, 1, 1,
0.4661681, -2.53039, 3.188552, 0, 0.03529412, 1, 1,
0.4698243, -1.242809, 1.087251, 0, 0.02745098, 1, 1,
0.4717087, 0.4951148, 1.949534, 0, 0.02352941, 1, 1,
0.4808337, 0.288813, 0.3582033, 0, 0.01568628, 1, 1,
0.4827764, 0.876523, -0.2905649, 0, 0.01176471, 1, 1,
0.4844629, 1.037843, -0.1683754, 0, 0.003921569, 1, 1,
0.4864224, -1.593313, 3.209152, 0.003921569, 0, 1, 1,
0.4873364, -0.3542696, 2.054682, 0.007843138, 0, 1, 1,
0.4879743, -0.9533831, 3.363825, 0.01568628, 0, 1, 1,
0.4891899, 1.708413, 0.1821948, 0.01960784, 0, 1, 1,
0.4909211, 1.132296, 1.236304, 0.02745098, 0, 1, 1,
0.4965105, -1.798845, 1.308359, 0.03137255, 0, 1, 1,
0.4977554, -0.1847146, 1.892355, 0.03921569, 0, 1, 1,
0.4989449, 0.1582814, 1.528377, 0.04313726, 0, 1, 1,
0.4991198, 1.570149, 0.400065, 0.05098039, 0, 1, 1,
0.5000986, 1.377271, 1.154356, 0.05490196, 0, 1, 1,
0.5053199, -0.2813052, 1.663784, 0.0627451, 0, 1, 1,
0.5060099, 0.07922897, 2.595226, 0.06666667, 0, 1, 1,
0.5089405, -1.185068, 1.550654, 0.07450981, 0, 1, 1,
0.5120839, 1.090267, -0.2907452, 0.07843138, 0, 1, 1,
0.5128432, -0.2264949, 2.821786, 0.08627451, 0, 1, 1,
0.5144776, 0.1425829, 1.44596, 0.09019608, 0, 1, 1,
0.5167131, -0.6347737, 3.371449, 0.09803922, 0, 1, 1,
0.5181593, -0.3517331, 2.01361, 0.1058824, 0, 1, 1,
0.5242186, 0.1123126, -0.3274108, 0.1098039, 0, 1, 1,
0.5282301, 1.096264, -0.8211243, 0.1176471, 0, 1, 1,
0.5285586, -1.587555, 0.9401501, 0.1215686, 0, 1, 1,
0.5293906, 1.366284, -1.870854, 0.1294118, 0, 1, 1,
0.5413999, -2.212181, 3.707519, 0.1333333, 0, 1, 1,
0.5423626, -0.6029974, 2.323542, 0.1411765, 0, 1, 1,
0.5439379, -0.1309322, 1.795328, 0.145098, 0, 1, 1,
0.544184, -0.6036832, 4.451408, 0.1529412, 0, 1, 1,
0.5478678, -0.9302416, 4.126083, 0.1568628, 0, 1, 1,
0.5492073, 0.110988, 2.593123, 0.1647059, 0, 1, 1,
0.5521385, 0.2333654, 0.7508522, 0.1686275, 0, 1, 1,
0.5523841, 0.9517677, -1.02344, 0.1764706, 0, 1, 1,
0.5565495, -0.2580465, 3.277923, 0.1803922, 0, 1, 1,
0.5573963, -0.3166935, 2.033188, 0.1882353, 0, 1, 1,
0.5577206, -0.6604418, 3.336491, 0.1921569, 0, 1, 1,
0.5588633, -0.611847, 4.320328, 0.2, 0, 1, 1,
0.5601928, 1.406951, -0.4854403, 0.2078431, 0, 1, 1,
0.5623471, 0.6384491, -0.5357523, 0.2117647, 0, 1, 1,
0.5710121, -0.3507578, 2.364173, 0.2196078, 0, 1, 1,
0.5738556, 0.6453433, 0.4255484, 0.2235294, 0, 1, 1,
0.5747758, -1.017754, 2.25487, 0.2313726, 0, 1, 1,
0.5749043, -1.443685, 3.626428, 0.2352941, 0, 1, 1,
0.5766339, -1.835867, 1.151794, 0.2431373, 0, 1, 1,
0.5813962, 1.164042, -0.3796881, 0.2470588, 0, 1, 1,
0.5852086, 1.600932, 0.01682746, 0.254902, 0, 1, 1,
0.5869972, -0.3391834, 2.323664, 0.2588235, 0, 1, 1,
0.5883755, -0.4979538, 2.151192, 0.2666667, 0, 1, 1,
0.5888656, -2.138801, 2.529084, 0.2705882, 0, 1, 1,
0.5914443, -0.6880631, 3.074393, 0.2784314, 0, 1, 1,
0.5939076, 2.037268, 0.08915416, 0.282353, 0, 1, 1,
0.598082, 0.5847437, 1.052158, 0.2901961, 0, 1, 1,
0.6009215, -1.098097, 1.725056, 0.2941177, 0, 1, 1,
0.601414, -0.2385732, 2.103889, 0.3019608, 0, 1, 1,
0.608505, -1.253272, 4.348396, 0.3098039, 0, 1, 1,
0.6092167, -2.532845, 2.495577, 0.3137255, 0, 1, 1,
0.6141678, 0.7204876, 1.35617, 0.3215686, 0, 1, 1,
0.6163433, 0.9061857, 0.1748982, 0.3254902, 0, 1, 1,
0.6189504, 0.6113002, 0.6456865, 0.3333333, 0, 1, 1,
0.6191975, -0.7277792, 4.727212, 0.3372549, 0, 1, 1,
0.619863, 1.607955, 0.3326956, 0.345098, 0, 1, 1,
0.6200876, -1.150761, 0.2741573, 0.3490196, 0, 1, 1,
0.6306573, 0.7371607, 1.129513, 0.3568628, 0, 1, 1,
0.635685, 1.161386, 0.8860515, 0.3607843, 0, 1, 1,
0.6429864, -1.290386, 3.977536, 0.3686275, 0, 1, 1,
0.6430078, -1.279001, 3.276689, 0.372549, 0, 1, 1,
0.6432773, 0.3668646, -0.943216, 0.3803922, 0, 1, 1,
0.6469762, 1.111071, 1.583431, 0.3843137, 0, 1, 1,
0.649626, -2.315487, 3.242824, 0.3921569, 0, 1, 1,
0.6504959, 0.3642557, -0.0856917, 0.3960784, 0, 1, 1,
0.6508772, -0.9445918, 3.936256, 0.4039216, 0, 1, 1,
0.6554945, -0.4677536, 1.669684, 0.4117647, 0, 1, 1,
0.6609061, 0.6132755, -0.1689106, 0.4156863, 0, 1, 1,
0.661756, -0.2404685, 2.125872, 0.4235294, 0, 1, 1,
0.666824, -1.236025, 3.28257, 0.427451, 0, 1, 1,
0.6675748, -0.3555214, 3.301654, 0.4352941, 0, 1, 1,
0.6722111, 0.4168302, 1.496264, 0.4392157, 0, 1, 1,
0.6734514, 0.02045025, 1.911757, 0.4470588, 0, 1, 1,
0.6742521, 0.4768446, 1.787395, 0.4509804, 0, 1, 1,
0.6754893, -1.562937, 4.154584, 0.4588235, 0, 1, 1,
0.6782759, -0.830381, 2.893236, 0.4627451, 0, 1, 1,
0.6839136, -2.785531, 3.836593, 0.4705882, 0, 1, 1,
0.6843821, 1.235987, -0.3382484, 0.4745098, 0, 1, 1,
0.6863073, 1.032833, -0.1618516, 0.4823529, 0, 1, 1,
0.6876969, -0.2943627, 2.120198, 0.4862745, 0, 1, 1,
0.6879234, 0.03012806, 0.9728558, 0.4941176, 0, 1, 1,
0.6884332, 0.6837403, 2.964225, 0.5019608, 0, 1, 1,
0.6987178, -0.2447541, 1.005853, 0.5058824, 0, 1, 1,
0.7001032, 0.6442202, 2.639632, 0.5137255, 0, 1, 1,
0.7021702, -0.3128313, 3.228873, 0.5176471, 0, 1, 1,
0.7021823, 0.2277419, 1.362123, 0.5254902, 0, 1, 1,
0.7109401, -1.070755, 2.795154, 0.5294118, 0, 1, 1,
0.711332, 0.2914413, 1.399833, 0.5372549, 0, 1, 1,
0.713869, -0.7774027, 2.387434, 0.5411765, 0, 1, 1,
0.7160608, -0.576153, 2.559816, 0.5490196, 0, 1, 1,
0.7229043, 0.3007625, 1.461733, 0.5529412, 0, 1, 1,
0.7313841, -0.1262845, 1.863892, 0.5607843, 0, 1, 1,
0.7333989, -0.2062157, 0.3103016, 0.5647059, 0, 1, 1,
0.7348722, 3.31713, -0.6790094, 0.572549, 0, 1, 1,
0.7401901, -0.5817254, 2.120508, 0.5764706, 0, 1, 1,
0.7429606, -0.6584685, 2.522021, 0.5843138, 0, 1, 1,
0.7456337, 0.6207774, 1.314383, 0.5882353, 0, 1, 1,
0.7470739, 1.246839, -0.5466501, 0.5960785, 0, 1, 1,
0.7506238, -0.3552764, 2.087655, 0.6039216, 0, 1, 1,
0.7515586, 2.335931, 0.3354827, 0.6078432, 0, 1, 1,
0.7526134, -1.831704, 2.205532, 0.6156863, 0, 1, 1,
0.7530491, 1.365837, -1.000927, 0.6196079, 0, 1, 1,
0.7588251, -0.7485869, 2.849172, 0.627451, 0, 1, 1,
0.7652947, 0.1712107, 2.309096, 0.6313726, 0, 1, 1,
0.7696747, -1.18905, 3.179366, 0.6392157, 0, 1, 1,
0.7869967, -0.1697409, 2.798482, 0.6431373, 0, 1, 1,
0.792262, 1.325372, 0.08620551, 0.6509804, 0, 1, 1,
0.7958804, 0.9755497, 2.531316, 0.654902, 0, 1, 1,
0.8004251, 0.1116972, 3.315455, 0.6627451, 0, 1, 1,
0.801899, -0.07824384, 1.779294, 0.6666667, 0, 1, 1,
0.804076, -1.053011, 2.749299, 0.6745098, 0, 1, 1,
0.8066872, 0.7221309, 3.062607, 0.6784314, 0, 1, 1,
0.8105417, -0.1162168, 2.500527, 0.6862745, 0, 1, 1,
0.8142424, -0.3180318, 1.934587, 0.6901961, 0, 1, 1,
0.8164137, -0.9452712, 2.921804, 0.6980392, 0, 1, 1,
0.8189998, -1.131665, 3.765765, 0.7058824, 0, 1, 1,
0.819913, -0.8777568, 0.9691389, 0.7098039, 0, 1, 1,
0.8231132, -0.8654336, 1.684112, 0.7176471, 0, 1, 1,
0.8251266, -0.1150471, 1.455295, 0.7215686, 0, 1, 1,
0.8308772, -0.554882, 1.788344, 0.7294118, 0, 1, 1,
0.8311709, -1.18507, 3.582664, 0.7333333, 0, 1, 1,
0.8384801, 1.705102, -0.4125714, 0.7411765, 0, 1, 1,
0.8421567, -0.2798448, 2.676524, 0.7450981, 0, 1, 1,
0.8449774, 0.2752047, 1.777953, 0.7529412, 0, 1, 1,
0.8455726, -0.8225985, 2.745963, 0.7568628, 0, 1, 1,
0.8478763, -1.452477, 2.199915, 0.7647059, 0, 1, 1,
0.8493018, -0.2688763, 2.561724, 0.7686275, 0, 1, 1,
0.8546538, -0.7546143, 3.019836, 0.7764706, 0, 1, 1,
0.8551204, 0.5769293, 0.05031047, 0.7803922, 0, 1, 1,
0.8576271, 0.1353776, 2.521232, 0.7882353, 0, 1, 1,
0.8646119, -1.473207, 1.917441, 0.7921569, 0, 1, 1,
0.8659384, 0.6409994, 1.752136, 0.8, 0, 1, 1,
0.8666077, -0.3379616, 1.940125, 0.8078431, 0, 1, 1,
0.8672476, -0.07152516, 1.331907, 0.8117647, 0, 1, 1,
0.8696616, -0.2840092, 1.953156, 0.8196079, 0, 1, 1,
0.873084, -0.2463164, 0.6372421, 0.8235294, 0, 1, 1,
0.8807456, -0.1264396, 2.599743, 0.8313726, 0, 1, 1,
0.8864422, 0.04253837, 1.977389, 0.8352941, 0, 1, 1,
0.8916516, -0.09563521, 1.667203, 0.8431373, 0, 1, 1,
0.9085905, -1.72067, 2.54499, 0.8470588, 0, 1, 1,
0.9177034, -0.5294805, 1.628078, 0.854902, 0, 1, 1,
0.9204016, 1.107812, -0.57775, 0.8588235, 0, 1, 1,
0.9237568, -0.2011864, 0.8190331, 0.8666667, 0, 1, 1,
0.9243772, 0.1646197, 2.98106, 0.8705882, 0, 1, 1,
0.9278896, -1.660595, 0.4962561, 0.8784314, 0, 1, 1,
0.9312031, 0.7756892, 0.4170261, 0.8823529, 0, 1, 1,
0.9327378, -0.4475659, 2.613038, 0.8901961, 0, 1, 1,
0.9418088, 2.130098, -0.06366406, 0.8941177, 0, 1, 1,
0.9436979, -0.0589269, 2.614553, 0.9019608, 0, 1, 1,
0.9472118, 0.5213652, 1.201143, 0.9098039, 0, 1, 1,
0.951053, 0.4908623, -1.820755, 0.9137255, 0, 1, 1,
0.9559558, -0.5393215, 2.247701, 0.9215686, 0, 1, 1,
0.9566125, 0.203214, 3.080367, 0.9254902, 0, 1, 1,
0.9683715, 1.447379, 3.018027, 0.9333333, 0, 1, 1,
0.9749159, -0.6999109, 1.806519, 0.9372549, 0, 1, 1,
0.9788045, 0.3549334, 0.9338072, 0.945098, 0, 1, 1,
0.9907212, -1.809228, 1.447343, 0.9490196, 0, 1, 1,
0.990744, 0.1465426, 0.9918244, 0.9568627, 0, 1, 1,
0.9935673, -0.3017577, 2.951911, 0.9607843, 0, 1, 1,
1.000048, 1.054109, 1.073638, 0.9686275, 0, 1, 1,
1.001232, 1.298057, 0.02310544, 0.972549, 0, 1, 1,
1.002199, 0.8198442, 0.9339715, 0.9803922, 0, 1, 1,
1.007162, 0.06263224, 0.7253342, 0.9843137, 0, 1, 1,
1.014533, -0.1593156, 0.1909584, 0.9921569, 0, 1, 1,
1.020041, -0.7038647, -0.1223681, 0.9960784, 0, 1, 1,
1.025952, -0.620073, 0.8123012, 1, 0, 0.9960784, 1,
1.035905, 0.4656958, 1.045219, 1, 0, 0.9882353, 1,
1.039198, 0.06851074, 1.910676, 1, 0, 0.9843137, 1,
1.041622, 0.9046943, 1.647955, 1, 0, 0.9764706, 1,
1.044813, -0.02438835, 1.680255, 1, 0, 0.972549, 1,
1.045863, -0.8126788, 3.040246, 1, 0, 0.9647059, 1,
1.046594, 0.8028921, -0.587016, 1, 0, 0.9607843, 1,
1.050313, 0.1086111, 0.6124138, 1, 0, 0.9529412, 1,
1.075825, -0.777354, 1.182806, 1, 0, 0.9490196, 1,
1.081449, 0.6061692, 0.8328925, 1, 0, 0.9411765, 1,
1.08932, -0.3474994, 2.894564, 1, 0, 0.9372549, 1,
1.09199, 1.690882, -0.06627786, 1, 0, 0.9294118, 1,
1.1064, -0.3825406, 3.187657, 1, 0, 0.9254902, 1,
1.107841, -0.03188586, 1.827248, 1, 0, 0.9176471, 1,
1.107994, 0.198545, 2.301255, 1, 0, 0.9137255, 1,
1.110809, -1.129591, 1.843044, 1, 0, 0.9058824, 1,
1.111743, 0.1816542, 2.53536, 1, 0, 0.9019608, 1,
1.115448, -0.3120539, 3.190996, 1, 0, 0.8941177, 1,
1.116447, 1.614496, 1.356016, 1, 0, 0.8862745, 1,
1.116593, 0.472688, 1.853745, 1, 0, 0.8823529, 1,
1.116734, -2.014896, 4.46704, 1, 0, 0.8745098, 1,
1.117697, -0.6949722, 2.543277, 1, 0, 0.8705882, 1,
1.117998, -0.7547771, 3.084085, 1, 0, 0.8627451, 1,
1.123855, -0.2714553, 2.471811, 1, 0, 0.8588235, 1,
1.124303, -1.103197, 4.566013, 1, 0, 0.8509804, 1,
1.125688, -2.207714, 4.103291, 1, 0, 0.8470588, 1,
1.134034, -0.2476612, 0.3798612, 1, 0, 0.8392157, 1,
1.137165, 0.08903162, 1.150181, 1, 0, 0.8352941, 1,
1.141053, 1.293379, 0.04879607, 1, 0, 0.827451, 1,
1.144795, -1.083603, 2.546203, 1, 0, 0.8235294, 1,
1.149435, 0.1783229, 1.528545, 1, 0, 0.8156863, 1,
1.15258, -0.2415158, 3.22201, 1, 0, 0.8117647, 1,
1.158542, 0.5346082, 0.2996446, 1, 0, 0.8039216, 1,
1.161435, -0.778981, 1.596124, 1, 0, 0.7960784, 1,
1.163151, -0.931549, 2.345144, 1, 0, 0.7921569, 1,
1.166637, 0.1468515, 2.055907, 1, 0, 0.7843137, 1,
1.16696, 0.2329576, 1.223424, 1, 0, 0.7803922, 1,
1.170865, -1.409371, 2.427042, 1, 0, 0.772549, 1,
1.176011, 1.653789, 0.907053, 1, 0, 0.7686275, 1,
1.178007, 0.8744453, 1.068225, 1, 0, 0.7607843, 1,
1.181479, -0.8682465, 3.545167, 1, 0, 0.7568628, 1,
1.191179, 1.017242, 0.006392607, 1, 0, 0.7490196, 1,
1.193899, 1.137611, -0.06560209, 1, 0, 0.7450981, 1,
1.194808, 1.532747, 0.5227124, 1, 0, 0.7372549, 1,
1.203947, -0.6161327, 2.222355, 1, 0, 0.7333333, 1,
1.205107, 0.5171935, 1.99503, 1, 0, 0.7254902, 1,
1.205612, 0.7141463, 0.743986, 1, 0, 0.7215686, 1,
1.210579, 0.6912438, 0.431233, 1, 0, 0.7137255, 1,
1.216545, -0.9919239, 2.882492, 1, 0, 0.7098039, 1,
1.243689, -1.609111, 4.516419, 1, 0, 0.7019608, 1,
1.244511, -0.4066671, 1.158646, 1, 0, 0.6941177, 1,
1.246706, -0.2228056, -1.191073, 1, 0, 0.6901961, 1,
1.246915, -0.2268266, 2.767948, 1, 0, 0.682353, 1,
1.24917, -1.997628, 0.5449706, 1, 0, 0.6784314, 1,
1.253257, -1.206845, 2.286126, 1, 0, 0.6705883, 1,
1.256937, -0.2750369, 0.9865893, 1, 0, 0.6666667, 1,
1.264658, -0.0677417, 0.5083562, 1, 0, 0.6588235, 1,
1.273446, -0.596639, 2.50529, 1, 0, 0.654902, 1,
1.273754, 0.4868188, 3.009728, 1, 0, 0.6470588, 1,
1.275545, 1.112342, 2.380802, 1, 0, 0.6431373, 1,
1.276415, 0.8544814, 0.6763014, 1, 0, 0.6352941, 1,
1.277985, 1.167856, 0.3407089, 1, 0, 0.6313726, 1,
1.283647, 0.4475492, -0.3650266, 1, 0, 0.6235294, 1,
1.290638, -0.2910532, 0.3749937, 1, 0, 0.6196079, 1,
1.29452, -0.3201996, 1.887171, 1, 0, 0.6117647, 1,
1.303701, -1.450874, 2.112551, 1, 0, 0.6078432, 1,
1.308861, -0.6298435, 1.205124, 1, 0, 0.6, 1,
1.310632, -0.4805582, 0.7220101, 1, 0, 0.5921569, 1,
1.324235, -1.15699, 1.478969, 1, 0, 0.5882353, 1,
1.326891, 1.278224, 0.7985536, 1, 0, 0.5803922, 1,
1.333425, -0.8262537, 2.972673, 1, 0, 0.5764706, 1,
1.336805, -0.1454641, 1.739307, 1, 0, 0.5686275, 1,
1.341795, -1.300258, 2.071968, 1, 0, 0.5647059, 1,
1.343337, 0.2398815, 3.711946, 1, 0, 0.5568628, 1,
1.349877, 1.150523, 2.300344, 1, 0, 0.5529412, 1,
1.350634, 0.8795809, 0.9518304, 1, 0, 0.5450981, 1,
1.357536, 0.01740608, 3.528513, 1, 0, 0.5411765, 1,
1.367841, -0.4982858, 3.760337, 1, 0, 0.5333334, 1,
1.373735, 0.1057492, -0.6455407, 1, 0, 0.5294118, 1,
1.381291, 0.2884466, 0.4808879, 1, 0, 0.5215687, 1,
1.384846, -0.0850343, 0.6110345, 1, 0, 0.5176471, 1,
1.38541, -0.9842212, 2.299349, 1, 0, 0.509804, 1,
1.390502, 0.360106, -0.425202, 1, 0, 0.5058824, 1,
1.408154, -1.134994, 0.8797048, 1, 0, 0.4980392, 1,
1.417807, 0.3970889, 1.908863, 1, 0, 0.4901961, 1,
1.424203, -1.155163, 2.554566, 1, 0, 0.4862745, 1,
1.431378, 0.8382998, 0.8634496, 1, 0, 0.4784314, 1,
1.435997, 0.8021547, -0.303834, 1, 0, 0.4745098, 1,
1.442541, 1.241079, 1.877692, 1, 0, 0.4666667, 1,
1.446242, -1.276873, 3.149632, 1, 0, 0.4627451, 1,
1.449814, 1.179142, 0.8264505, 1, 0, 0.454902, 1,
1.459867, 1.71139, 2.307207, 1, 0, 0.4509804, 1,
1.461073, -1.545479, 2.023853, 1, 0, 0.4431373, 1,
1.462148, -0.1344836, 1.35668, 1, 0, 0.4392157, 1,
1.46512, 0.53805, 2.155106, 1, 0, 0.4313726, 1,
1.469343, -0.2961506, 2.534093, 1, 0, 0.427451, 1,
1.477009, -0.07907863, 2.539536, 1, 0, 0.4196078, 1,
1.488311, -0.04635407, 0.5028079, 1, 0, 0.4156863, 1,
1.504596, -0.8515457, 1.613294, 1, 0, 0.4078431, 1,
1.510746, 0.7858472, 0.7276447, 1, 0, 0.4039216, 1,
1.511845, -0.6739038, 0.707336, 1, 0, 0.3960784, 1,
1.522191, 0.4349027, 1.276988, 1, 0, 0.3882353, 1,
1.53691, -0.001932479, 2.626919, 1, 0, 0.3843137, 1,
1.542305, 0.8126028, -1.768071, 1, 0, 0.3764706, 1,
1.553679, 0.4686163, 1.809828, 1, 0, 0.372549, 1,
1.558978, -1.333527, 2.384981, 1, 0, 0.3647059, 1,
1.559478, -1.00059, 0.9907676, 1, 0, 0.3607843, 1,
1.570885, -0.9922823, 2.68988, 1, 0, 0.3529412, 1,
1.573755, 1.872895, 1.929474, 1, 0, 0.3490196, 1,
1.577478, -1.154995, 2.773639, 1, 0, 0.3411765, 1,
1.58432, -2.067862, 2.657269, 1, 0, 0.3372549, 1,
1.589866, -1.21413, 2.337617, 1, 0, 0.3294118, 1,
1.608693, 0.7273492, -0.2578156, 1, 0, 0.3254902, 1,
1.643961, 1.066496, 0.3109731, 1, 0, 0.3176471, 1,
1.646991, -0.5681705, 1.549154, 1, 0, 0.3137255, 1,
1.6535, -1.156159, 2.224216, 1, 0, 0.3058824, 1,
1.65804, -0.3555719, 1.90515, 1, 0, 0.2980392, 1,
1.661721, 0.02199061, 2.022094, 1, 0, 0.2941177, 1,
1.667886, -0.4501469, 2.343861, 1, 0, 0.2862745, 1,
1.707383, 1.674552, 0.9323096, 1, 0, 0.282353, 1,
1.708712, -0.3329872, 2.767951, 1, 0, 0.2745098, 1,
1.716373, 0.6619434, 1.277382, 1, 0, 0.2705882, 1,
1.727724, -1.37207, 1.318023, 1, 0, 0.2627451, 1,
1.728328, -2.064334, 3.442087, 1, 0, 0.2588235, 1,
1.728727, 0.3020756, -0.7534666, 1, 0, 0.2509804, 1,
1.739237, 1.484384, 1.624153, 1, 0, 0.2470588, 1,
1.744965, 0.8550379, 2.04717, 1, 0, 0.2392157, 1,
1.746391, -0.3802062, 1.640841, 1, 0, 0.2352941, 1,
1.746689, -0.5330955, 0.5350236, 1, 0, 0.227451, 1,
1.753462, 1.513506, -0.7451605, 1, 0, 0.2235294, 1,
1.777272, 0.4690007, -0.08496501, 1, 0, 0.2156863, 1,
1.7807, 0.2326513, 0.4740281, 1, 0, 0.2117647, 1,
1.78481, -0.8126227, 1.684096, 1, 0, 0.2039216, 1,
1.792593, 0.005973225, 2.491474, 1, 0, 0.1960784, 1,
1.80699, 0.0909077, 0.3341381, 1, 0, 0.1921569, 1,
1.810896, 0.5804262, 3.067305, 1, 0, 0.1843137, 1,
1.828591, -1.155304, 2.242355, 1, 0, 0.1803922, 1,
1.860347, -0.06537496, 1.740251, 1, 0, 0.172549, 1,
1.86211, 2.53863, 1.610803, 1, 0, 0.1686275, 1,
1.883817, 0.1379091, 1.378604, 1, 0, 0.1607843, 1,
1.918468, 0.2298695, 0.9241729, 1, 0, 0.1568628, 1,
1.94719, -1.79729, 4.032586, 1, 0, 0.1490196, 1,
1.989109, -1.572286, 1.438918, 1, 0, 0.145098, 1,
2.030421, 0.2212749, 1.626841, 1, 0, 0.1372549, 1,
2.051495, 0.4547531, 0.5773793, 1, 0, 0.1333333, 1,
2.054008, 0.08690161, 2.323994, 1, 0, 0.1254902, 1,
2.086362, 0.7188734, 1.134045, 1, 0, 0.1215686, 1,
2.110586, -1.889869, 3.915135, 1, 0, 0.1137255, 1,
2.134154, -1.19769, 0.4154357, 1, 0, 0.1098039, 1,
2.174828, 0.02596482, 1.969321, 1, 0, 0.1019608, 1,
2.180217, -1.167781, 0.09684075, 1, 0, 0.09411765, 1,
2.208721, 1.137061, 1.744376, 1, 0, 0.09019608, 1,
2.246404, 0.5761029, 2.32611, 1, 0, 0.08235294, 1,
2.350161, 0.4740113, 0.6754635, 1, 0, 0.07843138, 1,
2.449052, -0.357877, 0.9962392, 1, 0, 0.07058824, 1,
2.467012, -0.2696818, 0.9308785, 1, 0, 0.06666667, 1,
2.468184, -0.2059534, 2.091084, 1, 0, 0.05882353, 1,
2.484251, 0.3430533, -0.6328222, 1, 0, 0.05490196, 1,
2.511844, -0.3406493, 2.497876, 1, 0, 0.04705882, 1,
2.523166, -0.1127967, 2.89486, 1, 0, 0.04313726, 1,
2.527558, 0.820523, 0.9435669, 1, 0, 0.03529412, 1,
2.587013, -0.2072543, 2.433821, 1, 0, 0.03137255, 1,
2.740938, 0.1768952, 1.855816, 1, 0, 0.02352941, 1,
2.898029, 0.1930544, 1.062147, 1, 0, 0.01960784, 1,
2.978769, -0.739324, 2.932243, 1, 0, 0.01176471, 1,
3.52181, 1.506291, -0.1860411, 1, 0, 0.007843138, 1
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
0.1422892, -4.674067, -7.197562, 0, -0.5, 0.5, 0.5,
0.1422892, -4.674067, -7.197562, 1, -0.5, 0.5, 0.5,
0.1422892, -4.674067, -7.197562, 1, 1.5, 0.5, 0.5,
0.1422892, -4.674067, -7.197562, 0, 1.5, 0.5, 0.5
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
-4.38289, 0.1968216, -7.197562, 0, -0.5, 0.5, 0.5,
-4.38289, 0.1968216, -7.197562, 1, -0.5, 0.5, 0.5,
-4.38289, 0.1968216, -7.197562, 1, 1.5, 0.5, 0.5,
-4.38289, 0.1968216, -7.197562, 0, 1.5, 0.5, 0.5
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
-4.38289, -4.674067, -0.2195418, 0, -0.5, 0.5, 0.5,
-4.38289, -4.674067, -0.2195418, 1, -0.5, 0.5, 0.5,
-4.38289, -4.674067, -0.2195418, 1, 1.5, 0.5, 0.5,
-4.38289, -4.674067, -0.2195418, 0, 1.5, 0.5, 0.5
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
-3, -3.550015, -5.58725,
3, -3.550015, -5.58725,
-3, -3.550015, -5.58725,
-3, -3.737357, -5.855635,
-2, -3.550015, -5.58725,
-2, -3.737357, -5.855635,
-1, -3.550015, -5.58725,
-1, -3.737357, -5.855635,
0, -3.550015, -5.58725,
0, -3.737357, -5.855635,
1, -3.550015, -5.58725,
1, -3.737357, -5.855635,
2, -3.550015, -5.58725,
2, -3.737357, -5.855635,
3, -3.550015, -5.58725,
3, -3.737357, -5.855635
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
-3, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
-3, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
-3, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
-3, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5,
-2, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
-2, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
-2, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
-2, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5,
-1, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
-1, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
-1, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
-1, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5,
0, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
0, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
0, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
0, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5,
1, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
1, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
1, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
1, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5,
2, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
2, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
2, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
2, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5,
3, -4.112041, -6.392406, 0, -0.5, 0.5, 0.5,
3, -4.112041, -6.392406, 1, -0.5, 0.5, 0.5,
3, -4.112041, -6.392406, 1, 1.5, 0.5, 0.5,
3, -4.112041, -6.392406, 0, 1.5, 0.5, 0.5
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
-3.338618, -2, -5.58725,
-3.338618, 2, -5.58725,
-3.338618, -2, -5.58725,
-3.512663, -2, -5.855635,
-3.338618, 0, -5.58725,
-3.512663, 0, -5.855635,
-3.338618, 2, -5.58725,
-3.512663, 2, -5.855635
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
-3.860754, -2, -6.392406, 0, -0.5, 0.5, 0.5,
-3.860754, -2, -6.392406, 1, -0.5, 0.5, 0.5,
-3.860754, -2, -6.392406, 1, 1.5, 0.5, 0.5,
-3.860754, -2, -6.392406, 0, 1.5, 0.5, 0.5,
-3.860754, 0, -6.392406, 0, -0.5, 0.5, 0.5,
-3.860754, 0, -6.392406, 1, -0.5, 0.5, 0.5,
-3.860754, 0, -6.392406, 1, 1.5, 0.5, 0.5,
-3.860754, 0, -6.392406, 0, 1.5, 0.5, 0.5,
-3.860754, 2, -6.392406, 0, -0.5, 0.5, 0.5,
-3.860754, 2, -6.392406, 1, -0.5, 0.5, 0.5,
-3.860754, 2, -6.392406, 1, 1.5, 0.5, 0.5,
-3.860754, 2, -6.392406, 0, 1.5, 0.5, 0.5
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
-3.338618, -3.550015, -4,
-3.338618, -3.550015, 4,
-3.338618, -3.550015, -4,
-3.512663, -3.737357, -4,
-3.338618, -3.550015, -2,
-3.512663, -3.737357, -2,
-3.338618, -3.550015, 0,
-3.512663, -3.737357, 0,
-3.338618, -3.550015, 2,
-3.512663, -3.737357, 2,
-3.338618, -3.550015, 4,
-3.512663, -3.737357, 4
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
-3.860754, -4.112041, -4, 0, -0.5, 0.5, 0.5,
-3.860754, -4.112041, -4, 1, -0.5, 0.5, 0.5,
-3.860754, -4.112041, -4, 1, 1.5, 0.5, 0.5,
-3.860754, -4.112041, -4, 0, 1.5, 0.5, 0.5,
-3.860754, -4.112041, -2, 0, -0.5, 0.5, 0.5,
-3.860754, -4.112041, -2, 1, -0.5, 0.5, 0.5,
-3.860754, -4.112041, -2, 1, 1.5, 0.5, 0.5,
-3.860754, -4.112041, -2, 0, 1.5, 0.5, 0.5,
-3.860754, -4.112041, 0, 0, -0.5, 0.5, 0.5,
-3.860754, -4.112041, 0, 1, -0.5, 0.5, 0.5,
-3.860754, -4.112041, 0, 1, 1.5, 0.5, 0.5,
-3.860754, -4.112041, 0, 0, 1.5, 0.5, 0.5,
-3.860754, -4.112041, 2, 0, -0.5, 0.5, 0.5,
-3.860754, -4.112041, 2, 1, -0.5, 0.5, 0.5,
-3.860754, -4.112041, 2, 1, 1.5, 0.5, 0.5,
-3.860754, -4.112041, 2, 0, 1.5, 0.5, 0.5,
-3.860754, -4.112041, 4, 0, -0.5, 0.5, 0.5,
-3.860754, -4.112041, 4, 1, -0.5, 0.5, 0.5,
-3.860754, -4.112041, 4, 1, 1.5, 0.5, 0.5,
-3.860754, -4.112041, 4, 0, 1.5, 0.5, 0.5
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
-3.338618, -3.550015, -5.58725,
-3.338618, 3.943658, -5.58725,
-3.338618, -3.550015, 5.148166,
-3.338618, 3.943658, 5.148166,
-3.338618, -3.550015, -5.58725,
-3.338618, -3.550015, 5.148166,
-3.338618, 3.943658, -5.58725,
-3.338618, 3.943658, 5.148166,
-3.338618, -3.550015, -5.58725,
3.623196, -3.550015, -5.58725,
-3.338618, -3.550015, 5.148166,
3.623196, -3.550015, 5.148166,
-3.338618, 3.943658, -5.58725,
3.623196, 3.943658, -5.58725,
-3.338618, 3.943658, 5.148166,
3.623196, 3.943658, 5.148166,
3.623196, -3.550015, -5.58725,
3.623196, 3.943658, -5.58725,
3.623196, -3.550015, 5.148166,
3.623196, 3.943658, 5.148166,
3.623196, -3.550015, -5.58725,
3.623196, -3.550015, 5.148166,
3.623196, 3.943658, -5.58725,
3.623196, 3.943658, 5.148166
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
var radius = 7.917892;
var distance = 35.2276;
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
mvMatrix.translate( -0.1422892, -0.1968216, 0.2195418 );
mvMatrix.scale( 1.229705, 1.142428, 0.7974522 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.2276);
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
Trisodium_arsenate<-read.table("Trisodium_arsenate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Trisodium_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Trisodium_arsenate' not found
```

```r
y<-Trisodium_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Trisodium_arsenate' not found
```

```r
z<-Trisodium_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Trisodium_arsenate' not found
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
-3.237232, -0.5539513, -1.922797, 0, 0, 1, 1, 1,
-2.947008, -0.9364924, -1.293383, 1, 0, 0, 1, 1,
-2.827823, 0.05357012, -3.002387, 1, 0, 0, 1, 1,
-2.759181, -0.6010821, -2.388124, 1, 0, 0, 1, 1,
-2.66813, -0.4963134, -1.383113, 1, 0, 0, 1, 1,
-2.616327, 1.409253, 0.3490131, 1, 0, 0, 1, 1,
-2.453766, -1.795407, -1.153088, 0, 0, 0, 1, 1,
-2.426822, -2.693939, -1.706679, 0, 0, 0, 1, 1,
-2.233237, 1.510624, 0.7862377, 0, 0, 0, 1, 1,
-2.0742, 1.138831, -1.298841, 0, 0, 0, 1, 1,
-2.05662, 0.3754731, -2.684098, 0, 0, 0, 1, 1,
-2.0332, -0.8235798, -0.8822929, 0, 0, 0, 1, 1,
-2.024266, 1.941961, -1.637691, 0, 0, 0, 1, 1,
-2.013287, 0.8180514, -0.02638404, 1, 1, 1, 1, 1,
-2.004169, -1.039822, -2.425338, 1, 1, 1, 1, 1,
-1.975117, 1.039402, -3.068039, 1, 1, 1, 1, 1,
-1.955185, -0.655118, -2.645081, 1, 1, 1, 1, 1,
-1.952761, -0.1395991, -1.723183, 1, 1, 1, 1, 1,
-1.946034, -0.5290428, -2.636476, 1, 1, 1, 1, 1,
-1.888617, 0.1561638, -2.155611, 1, 1, 1, 1, 1,
-1.880182, -1.067268, -1.613525, 1, 1, 1, 1, 1,
-1.824394, 0.3304861, -0.2498688, 1, 1, 1, 1, 1,
-1.818413, 0.1765727, -0.6309186, 1, 1, 1, 1, 1,
-1.815357, 0.1207383, -1.636721, 1, 1, 1, 1, 1,
-1.798194, 0.2613673, -0.4366226, 1, 1, 1, 1, 1,
-1.788718, 0.1673337, 0.1661361, 1, 1, 1, 1, 1,
-1.765886, 0.3097807, -1.830952, 1, 1, 1, 1, 1,
-1.737388, 2.38003, -0.2024212, 1, 1, 1, 1, 1,
-1.731226, -0.2952267, -1.193639, 0, 0, 1, 1, 1,
-1.725799, -0.8043141, -2.815051, 1, 0, 0, 1, 1,
-1.715824, -0.2317673, -1.232756, 1, 0, 0, 1, 1,
-1.712526, 0.5899991, -1.019386, 1, 0, 0, 1, 1,
-1.69086, -1.45219, -1.533556, 1, 0, 0, 1, 1,
-1.68539, 0.4912589, -1.591615, 1, 0, 0, 1, 1,
-1.683185, -0.08777501, -3.260009, 0, 0, 0, 1, 1,
-1.681693, -0.2240512, -2.082672, 0, 0, 0, 1, 1,
-1.660339, 1.807166, -0.7119824, 0, 0, 0, 1, 1,
-1.639741, -0.1077327, -1.768233, 0, 0, 0, 1, 1,
-1.618815, 0.6099762, -1.974445, 0, 0, 0, 1, 1,
-1.59819, -1.630522, -2.632701, 0, 0, 0, 1, 1,
-1.589242, 0.6544151, -2.882388, 0, 0, 0, 1, 1,
-1.577426, 0.4947006, -1.83222, 1, 1, 1, 1, 1,
-1.565779, -0.1689781, -1.332746, 1, 1, 1, 1, 1,
-1.563256, 0.05892282, -1.345912, 1, 1, 1, 1, 1,
-1.55352, 0.1445759, -1.431127, 1, 1, 1, 1, 1,
-1.551241, 0.4863864, -0.3149586, 1, 1, 1, 1, 1,
-1.548182, -1.295072, -2.584958, 1, 1, 1, 1, 1,
-1.535304, 0.7675617, -0.7674413, 1, 1, 1, 1, 1,
-1.527935, -0.1811456, -1.783748, 1, 1, 1, 1, 1,
-1.508612, 0.2875055, -1.681958, 1, 1, 1, 1, 1,
-1.505412, 0.008808985, -1.757851, 1, 1, 1, 1, 1,
-1.492636, 0.519188, -2.555379, 1, 1, 1, 1, 1,
-1.483946, 0.317663, -1.939486, 1, 1, 1, 1, 1,
-1.473527, 0.5800121, -0.8571188, 1, 1, 1, 1, 1,
-1.473145, -0.545478, -1.675794, 1, 1, 1, 1, 1,
-1.467404, -1.422117, -3.11968, 1, 1, 1, 1, 1,
-1.462502, 0.02259676, -2.150056, 0, 0, 1, 1, 1,
-1.461257, -2.081873, -3.006946, 1, 0, 0, 1, 1,
-1.45947, -0.6813653, -0.2329092, 1, 0, 0, 1, 1,
-1.459416, -1.343228, -2.752971, 1, 0, 0, 1, 1,
-1.455615, -0.117493, -0.8389242, 1, 0, 0, 1, 1,
-1.446286, -0.79835, -3.161273, 1, 0, 0, 1, 1,
-1.432335, -0.08078392, -2.184597, 0, 0, 0, 1, 1,
-1.425901, -0.4833494, -1.716912, 0, 0, 0, 1, 1,
-1.424402, 0.7505428, -3.110618, 0, 0, 0, 1, 1,
-1.420274, 0.5330533, -1.692822, 0, 0, 0, 1, 1,
-1.420163, -0.1836288, -2.579087, 0, 0, 0, 1, 1,
-1.416766, -2.041168, -2.266861, 0, 0, 0, 1, 1,
-1.413869, 0.2076341, -0.864525, 0, 0, 0, 1, 1,
-1.393998, -0.02313753, -4.001607, 1, 1, 1, 1, 1,
-1.392548, 0.43459, 0.2285579, 1, 1, 1, 1, 1,
-1.389258, -0.09259518, -1.085035, 1, 1, 1, 1, 1,
-1.381635, 0.3471781, -1.172223, 1, 1, 1, 1, 1,
-1.373762, -1.688866, -2.836314, 1, 1, 1, 1, 1,
-1.372913, -0.7644866, -1.054287, 1, 1, 1, 1, 1,
-1.347156, 1.093456, -2.049011, 1, 1, 1, 1, 1,
-1.342935, -0.1789471, -1.219235, 1, 1, 1, 1, 1,
-1.342787, 0.09425823, -2.067417, 1, 1, 1, 1, 1,
-1.342697, -0.6828262, -2.55344, 1, 1, 1, 1, 1,
-1.337789, 0.3178383, -2.854004, 1, 1, 1, 1, 1,
-1.337327, 0.05583264, -1.962871, 1, 1, 1, 1, 1,
-1.333427, 0.3656899, -2.953301, 1, 1, 1, 1, 1,
-1.330846, -1.448604, -3.093442, 1, 1, 1, 1, 1,
-1.330772, 0.1254922, -1.877859, 1, 1, 1, 1, 1,
-1.327511, 0.1763175, -0.5703797, 0, 0, 1, 1, 1,
-1.322825, 0.8019183, -0.4602108, 1, 0, 0, 1, 1,
-1.314366, 0.7520702, -1.994721, 1, 0, 0, 1, 1,
-1.292642, 1.66945, -0.4424641, 1, 0, 0, 1, 1,
-1.274865, -0.1157629, -2.243145, 1, 0, 0, 1, 1,
-1.274859, 0.2613956, 0.05007562, 1, 0, 0, 1, 1,
-1.267143, 0.08917479, -0.05530827, 0, 0, 0, 1, 1,
-1.257599, -0.4565875, -2.813443, 0, 0, 0, 1, 1,
-1.256227, -0.4989623, -1.815788, 0, 0, 0, 1, 1,
-1.255002, -2.340324, -3.056587, 0, 0, 0, 1, 1,
-1.253807, 0.5933784, -3.005478, 0, 0, 0, 1, 1,
-1.240776, 1.099078, -0.5223927, 0, 0, 0, 1, 1,
-1.239508, -0.5068438, -1.454326, 0, 0, 0, 1, 1,
-1.233023, 1.748227, -1.662528, 1, 1, 1, 1, 1,
-1.225594, -0.6987018, -1.479813, 1, 1, 1, 1, 1,
-1.22398, 0.5709778, -3.529505, 1, 1, 1, 1, 1,
-1.219949, 0.2822752, -1.014889, 1, 1, 1, 1, 1,
-1.213731, -0.2558496, -2.119159, 1, 1, 1, 1, 1,
-1.208433, -0.0394153, -0.6513994, 1, 1, 1, 1, 1,
-1.200789, -1.374911, -3.252652, 1, 1, 1, 1, 1,
-1.198761, 0.8991158, -0.5213951, 1, 1, 1, 1, 1,
-1.197584, -0.7676511, -0.240444, 1, 1, 1, 1, 1,
-1.191792, 0.8611121, -2.723132, 1, 1, 1, 1, 1,
-1.186466, -1.774224, -1.307932, 1, 1, 1, 1, 1,
-1.184611, -0.2688942, -1.259352, 1, 1, 1, 1, 1,
-1.170991, 0.7420576, -2.991693, 1, 1, 1, 1, 1,
-1.162274, 0.1425559, -1.575226, 1, 1, 1, 1, 1,
-1.162274, -0.7171044, -2.050052, 1, 1, 1, 1, 1,
-1.149964, -0.3582422, -2.112852, 0, 0, 1, 1, 1,
-1.147443, -1.449475, -1.672204, 1, 0, 0, 1, 1,
-1.139743, 0.092718, -3.612464, 1, 0, 0, 1, 1,
-1.1384, 0.3550837, -2.364399, 1, 0, 0, 1, 1,
-1.137239, -0.638173, -0.5643821, 1, 0, 0, 1, 1,
-1.13539, 0.4275614, -0.8849345, 1, 0, 0, 1, 1,
-1.132106, -0.8286533, -1.99436, 0, 0, 0, 1, 1,
-1.130537, 1.453578, -0.322496, 0, 0, 0, 1, 1,
-1.124088, -0.3947767, -1.994054, 0, 0, 0, 1, 1,
-1.115909, -1.185857, -1.772449, 0, 0, 0, 1, 1,
-1.104724, 0.2874204, -2.972451, 0, 0, 0, 1, 1,
-1.099062, -0.5783895, -3.190243, 0, 0, 0, 1, 1,
-1.090276, -0.6377014, -3.083345, 0, 0, 0, 1, 1,
-1.083134, 1.185173, -0.4574254, 1, 1, 1, 1, 1,
-1.079702, 0.3776548, -0.8033522, 1, 1, 1, 1, 1,
-1.066993, -1.323372, -1.165855, 1, 1, 1, 1, 1,
-1.066829, 0.6812378, -1.682959, 1, 1, 1, 1, 1,
-1.063236, 0.5970448, -2.05387, 1, 1, 1, 1, 1,
-1.060305, 0.7250611, 2.242626, 1, 1, 1, 1, 1,
-1.059432, 0.2711606, -2.718156, 1, 1, 1, 1, 1,
-1.05342, -0.4367694, -0.8909977, 1, 1, 1, 1, 1,
-1.033203, -0.3402387, -1.933117, 1, 1, 1, 1, 1,
-1.024423, -0.9438209, -2.05689, 1, 1, 1, 1, 1,
-1.022552, -0.6258541, -2.925756, 1, 1, 1, 1, 1,
-1.012234, 0.7134922, -2.105986, 1, 1, 1, 1, 1,
-1.004861, -0.9002565, -1.939738, 1, 1, 1, 1, 1,
-1.004272, -0.5897468, -3.803262, 1, 1, 1, 1, 1,
-0.9953217, -0.09436734, -1.338504, 1, 1, 1, 1, 1,
-0.9876336, 0.9192016, -1.367127, 0, 0, 1, 1, 1,
-0.9869356, -0.9067206, -3.171528, 1, 0, 0, 1, 1,
-0.9822064, -0.8299079, -3.493546, 1, 0, 0, 1, 1,
-0.9816358, -0.1253443, -2.645635, 1, 0, 0, 1, 1,
-0.9718811, -1.739427, -3.665351, 1, 0, 0, 1, 1,
-0.9693984, -1.346494, -0.2376509, 1, 0, 0, 1, 1,
-0.9689892, -0.1291298, -1.671049, 0, 0, 0, 1, 1,
-0.9623315, -0.228871, -1.139866, 0, 0, 0, 1, 1,
-0.9586028, 1.540986, 0.4815882, 0, 0, 0, 1, 1,
-0.9559157, -2.386486, -1.626572, 0, 0, 0, 1, 1,
-0.9547646, -0.2774946, -1.346534, 0, 0, 0, 1, 1,
-0.9547167, -1.315127, -4.288271, 0, 0, 0, 1, 1,
-0.9493916, 0.4073884, -1.584952, 0, 0, 0, 1, 1,
-0.9488875, 0.9834203, -2.231659, 1, 1, 1, 1, 1,
-0.9482759, 0.9991905, -1.479203, 1, 1, 1, 1, 1,
-0.9354573, -0.01166272, -0.3254893, 1, 1, 1, 1, 1,
-0.9292988, -0.1539687, -2.983743, 1, 1, 1, 1, 1,
-0.9285886, 1.106371, -0.5968885, 1, 1, 1, 1, 1,
-0.9236318, 0.4121978, -1.443657, 1, 1, 1, 1, 1,
-0.9214455, -0.435735, -2.956582, 1, 1, 1, 1, 1,
-0.9166024, -0.9093969, -2.123538, 1, 1, 1, 1, 1,
-0.9140505, 0.8346157, 0.0748924, 1, 1, 1, 1, 1,
-0.9108906, 1.614294, -1.734303, 1, 1, 1, 1, 1,
-0.9063175, -0.5622886, -1.86894, 1, 1, 1, 1, 1,
-0.9020775, -1.202386, -2.188466, 1, 1, 1, 1, 1,
-0.8968008, -1.087956, -2.970387, 1, 1, 1, 1, 1,
-0.89389, 0.8324553, -1.701092, 1, 1, 1, 1, 1,
-0.8809987, 0.1993296, 0.2035675, 1, 1, 1, 1, 1,
-0.8741975, -2.108397, -3.319111, 0, 0, 1, 1, 1,
-0.8711215, -0.1431294, -2.726193, 1, 0, 0, 1, 1,
-0.8656341, 0.5989643, -0.2598833, 1, 0, 0, 1, 1,
-0.8546661, 1.268368, -1.027942, 1, 0, 0, 1, 1,
-0.8544145, 0.8973886, -0.4218166, 1, 0, 0, 1, 1,
-0.8524228, 0.01643434, -3.512849, 1, 0, 0, 1, 1,
-0.8353243, 0.6476591, -1.763707, 0, 0, 0, 1, 1,
-0.8316789, 0.3763716, -0.5472346, 0, 0, 0, 1, 1,
-0.8316696, -0.1391014, -2.088446, 0, 0, 0, 1, 1,
-0.8293815, 0.4489573, -2.526084, 0, 0, 0, 1, 1,
-0.82769, -0.7508505, -0.8813349, 0, 0, 0, 1, 1,
-0.8221064, -1.236084, -2.113198, 0, 0, 0, 1, 1,
-0.8178651, -0.3315022, -1.878094, 0, 0, 0, 1, 1,
-0.8131452, 1.57244, -1.342391, 1, 1, 1, 1, 1,
-0.810624, -0.9719923, -4.060553, 1, 1, 1, 1, 1,
-0.8038162, -0.2279142, -1.232891, 1, 1, 1, 1, 1,
-0.8033742, -0.9253079, -2.216333, 1, 1, 1, 1, 1,
-0.7916175, -0.7947138, -3.010929, 1, 1, 1, 1, 1,
-0.7897057, 0.6432844, 0.7389072, 1, 1, 1, 1, 1,
-0.7895533, 0.7010843, 1.54939, 1, 1, 1, 1, 1,
-0.7877697, -0.4662583, -2.126454, 1, 1, 1, 1, 1,
-0.7861061, -0.0520503, -1.696415, 1, 1, 1, 1, 1,
-0.784429, 1.111689, -0.4765653, 1, 1, 1, 1, 1,
-0.7793013, -1.609219, -2.034037, 1, 1, 1, 1, 1,
-0.7770677, 0.4123084, -2.859785, 1, 1, 1, 1, 1,
-0.7763836, 0.3735361, -1.98417, 1, 1, 1, 1, 1,
-0.7757035, 1.491182, 0.5699915, 1, 1, 1, 1, 1,
-0.7752243, 2.258504, -0.8086241, 1, 1, 1, 1, 1,
-0.7738292, -0.24263, -2.955396, 0, 0, 1, 1, 1,
-0.7720262, -0.5916994, -2.515625, 1, 0, 0, 1, 1,
-0.7694312, 0.01267879, -0.3198791, 1, 0, 0, 1, 1,
-0.7694095, -0.4092652, -2.579371, 1, 0, 0, 1, 1,
-0.7674632, 1.082805, -1.233015, 1, 0, 0, 1, 1,
-0.7594951, -2.18162, -2.930481, 1, 0, 0, 1, 1,
-0.7586872, -0.2671102, -2.629327, 0, 0, 0, 1, 1,
-0.7494587, -0.2776656, -3.000713, 0, 0, 0, 1, 1,
-0.7346816, -0.3691529, -4.075598, 0, 0, 0, 1, 1,
-0.7317345, -1.348383, -2.734205, 0, 0, 0, 1, 1,
-0.730416, 1.68723, 0.5609334, 0, 0, 0, 1, 1,
-0.7215518, 0.8042163, -0.8908078, 0, 0, 0, 1, 1,
-0.7203771, -0.3406873, -1.345017, 0, 0, 0, 1, 1,
-0.7184575, -2.017259, -3.68195, 1, 1, 1, 1, 1,
-0.7085598, 0.3746873, 0.0220784, 1, 1, 1, 1, 1,
-0.7047265, -0.3746892, -2.804743, 1, 1, 1, 1, 1,
-0.7036133, 0.6974457, -0.1798174, 1, 1, 1, 1, 1,
-0.702306, 0.2536519, -1.13879, 1, 1, 1, 1, 1,
-0.701173, 2.111819, -2.252939, 1, 1, 1, 1, 1,
-0.6970583, -1.430072, -5.430909, 1, 1, 1, 1, 1,
-0.6915128, -0.2191114, -1.542814, 1, 1, 1, 1, 1,
-0.6892129, -0.4412836, -1.6998, 1, 1, 1, 1, 1,
-0.6883735, -0.9615325, -1.790686, 1, 1, 1, 1, 1,
-0.6850315, -1.31626, -3.65886, 1, 1, 1, 1, 1,
-0.681821, -2.299583, -1.406716, 1, 1, 1, 1, 1,
-0.6808268, 0.2978534, -1.204852, 1, 1, 1, 1, 1,
-0.6780567, 2.094683, 0.1160367, 1, 1, 1, 1, 1,
-0.6708159, -1.307553, -3.884435, 1, 1, 1, 1, 1,
-0.6670342, -1.973907, -3.181023, 0, 0, 1, 1, 1,
-0.6628231, 1.827319, -0.9508132, 1, 0, 0, 1, 1,
-0.6608447, -0.708018, -2.360813, 1, 0, 0, 1, 1,
-0.6601037, -0.8610801, -3.175449, 1, 0, 0, 1, 1,
-0.6600968, -0.03460607, -1.438338, 1, 0, 0, 1, 1,
-0.6567819, -0.2920426, -2.74915, 1, 0, 0, 1, 1,
-0.6549792, 0.6184435, -2.062191, 0, 0, 0, 1, 1,
-0.6530734, -1.818309, -2.414644, 0, 0, 0, 1, 1,
-0.6524247, -1.647735, -3.638653, 0, 0, 0, 1, 1,
-0.6505947, 0.4136866, -0.6290724, 0, 0, 0, 1, 1,
-0.6492503, -1.439605, -1.921816, 0, 0, 0, 1, 1,
-0.6436794, 0.9295149, -1.224148, 0, 0, 0, 1, 1,
-0.6371974, -0.9308106, -2.52968, 0, 0, 0, 1, 1,
-0.6337139, 0.659728, -0.2933438, 1, 1, 1, 1, 1,
-0.6158243, -0.1558758, -1.900444, 1, 1, 1, 1, 1,
-0.6150131, 0.8458572, -1.966351, 1, 1, 1, 1, 1,
-0.6119244, 0.4178244, -1.160234, 1, 1, 1, 1, 1,
-0.6079676, 1.038105, -0.3449478, 1, 1, 1, 1, 1,
-0.6056201, 0.6211228, -1.820791, 1, 1, 1, 1, 1,
-0.6039127, -0.8641264, -1.898839, 1, 1, 1, 1, 1,
-0.5950344, -0.4765407, -1.148801, 1, 1, 1, 1, 1,
-0.5825285, -0.7264134, -2.274957, 1, 1, 1, 1, 1,
-0.5812798, -1.503793, -2.450094, 1, 1, 1, 1, 1,
-0.578384, 0.7534217, -2.011014, 1, 1, 1, 1, 1,
-0.5779911, -1.189289, -2.218827, 1, 1, 1, 1, 1,
-0.5757827, 1.366345, -2.645186, 1, 1, 1, 1, 1,
-0.5733576, 0.4146929, -1.723056, 1, 1, 1, 1, 1,
-0.5729254, -0.1059684, -0.311766, 1, 1, 1, 1, 1,
-0.5708444, -1.205541, -3.337285, 0, 0, 1, 1, 1,
-0.5693887, -0.5821409, -1.235923, 1, 0, 0, 1, 1,
-0.5691876, 0.6840477, 0.9285106, 1, 0, 0, 1, 1,
-0.5656877, -2.933913, -2.839673, 1, 0, 0, 1, 1,
-0.5654685, -0.05550379, -0.5573344, 1, 0, 0, 1, 1,
-0.5647378, -0.4300454, -1.590419, 1, 0, 0, 1, 1,
-0.5641688, -0.2067523, -0.5248314, 0, 0, 0, 1, 1,
-0.5626368, 0.6444451, -1.289389, 0, 0, 0, 1, 1,
-0.5611044, 1.000311, -1.439252, 0, 0, 0, 1, 1,
-0.5604715, -0.5024928, -0.2497871, 0, 0, 0, 1, 1,
-0.5573522, -1.017231, -1.889754, 0, 0, 0, 1, 1,
-0.5454638, -0.3952158, 0.06501989, 0, 0, 0, 1, 1,
-0.5424056, 0.1043807, -0.742416, 0, 0, 0, 1, 1,
-0.5389255, -0.8171456, -2.470953, 1, 1, 1, 1, 1,
-0.5335343, 0.53912, -1.960559, 1, 1, 1, 1, 1,
-0.5322978, -0.3053027, -2.571877, 1, 1, 1, 1, 1,
-0.5287761, -0.9510916, -0.7014213, 1, 1, 1, 1, 1,
-0.5263379, -0.06890987, -1.021464, 1, 1, 1, 1, 1,
-0.525096, 2.758759, -0.2424101, 1, 1, 1, 1, 1,
-0.5230983, 0.04958895, -1.191463, 1, 1, 1, 1, 1,
-0.5167203, -0.8220557, -1.101718, 1, 1, 1, 1, 1,
-0.5162464, -1.611904, -3.979084, 1, 1, 1, 1, 1,
-0.512659, 0.5031456, -2.273299, 1, 1, 1, 1, 1,
-0.508664, -0.8035986, -3.70434, 1, 1, 1, 1, 1,
-0.507634, -1.382832, -3.81459, 1, 1, 1, 1, 1,
-0.5054447, -3.440884, -4.27503, 1, 1, 1, 1, 1,
-0.5036767, -0.469771, -2.026907, 1, 1, 1, 1, 1,
-0.5005773, -0.6292549, -1.095136, 1, 1, 1, 1, 1,
-0.4899853, -0.5517677, -3.241996, 0, 0, 1, 1, 1,
-0.4884973, 0.1462658, -0.3902436, 1, 0, 0, 1, 1,
-0.4859065, -0.9020137, -1.497369, 1, 0, 0, 1, 1,
-0.4852779, -0.08641268, -1.036755, 1, 0, 0, 1, 1,
-0.4778597, -0.2140467, -1.335966, 1, 0, 0, 1, 1,
-0.4766671, -0.4132376, -2.294865, 1, 0, 0, 1, 1,
-0.4762329, 1.248044, -1.364335, 0, 0, 0, 1, 1,
-0.4729952, -2.050971, -1.278769, 0, 0, 0, 1, 1,
-0.4709551, -0.4168987, -3.052727, 0, 0, 0, 1, 1,
-0.4688992, 1.933335, 0.04141922, 0, 0, 0, 1, 1,
-0.4675564, 0.1358137, -1.342806, 0, 0, 0, 1, 1,
-0.4675482, 0.1946161, -1.164144, 0, 0, 0, 1, 1,
-0.4649621, -0.2821633, -1.1304, 0, 0, 0, 1, 1,
-0.4646775, 0.02871845, -0.08960961, 1, 1, 1, 1, 1,
-0.4639872, 0.117874, -0.08955922, 1, 1, 1, 1, 1,
-0.4619492, -2.384547, -1.203703, 1, 1, 1, 1, 1,
-0.4596973, -2.44881, -2.275647, 1, 1, 1, 1, 1,
-0.4509211, -1.030768, -1.66596, 1, 1, 1, 1, 1,
-0.4478419, 1.064121, 0.1644388, 1, 1, 1, 1, 1,
-0.4414716, 0.4243636, -0.9104165, 1, 1, 1, 1, 1,
-0.4387892, 0.1843176, -0.8686004, 1, 1, 1, 1, 1,
-0.4381083, -1.054406, -1.971689, 1, 1, 1, 1, 1,
-0.4358575, -0.4548614, -3.066579, 1, 1, 1, 1, 1,
-0.4325858, 2.064226, -0.2729398, 1, 1, 1, 1, 1,
-0.4309945, -0.1746792, -0.7469885, 1, 1, 1, 1, 1,
-0.4292641, 0.03285726, -1.551502, 1, 1, 1, 1, 1,
-0.4234954, 1.139681, -0.7744368, 1, 1, 1, 1, 1,
-0.4165433, 1.76394, -0.9959041, 1, 1, 1, 1, 1,
-0.4158638, 1.435335, -0.3243141, 0, 0, 1, 1, 1,
-0.4143794, 0.3236121, -0.7415422, 1, 0, 0, 1, 1,
-0.4142572, -0.5108689, -3.819869, 1, 0, 0, 1, 1,
-0.4135453, -1.754741, -3.392622, 1, 0, 0, 1, 1,
-0.4130635, 0.2005792, -2.489492, 1, 0, 0, 1, 1,
-0.4127232, 0.248463, 1.247587, 1, 0, 0, 1, 1,
-0.4103895, 0.4281335, 0.3274734, 0, 0, 0, 1, 1,
-0.4055716, -0.4192172, -2.221821, 0, 0, 0, 1, 1,
-0.3999812, -1.140934, -1.972662, 0, 0, 0, 1, 1,
-0.3994886, -0.1258862, -0.6124897, 0, 0, 0, 1, 1,
-0.3982072, -0.7811287, -2.599458, 0, 0, 0, 1, 1,
-0.3966404, -0.08755454, -1.896456, 0, 0, 0, 1, 1,
-0.3963927, -1.359327, -1.629176, 0, 0, 0, 1, 1,
-0.3962322, 0.07066223, -1.840825, 1, 1, 1, 1, 1,
-0.3930775, -0.4633814, -3.873972, 1, 1, 1, 1, 1,
-0.3929299, 0.2630865, -1.52424, 1, 1, 1, 1, 1,
-0.3905423, -0.4123631, -3.394536, 1, 1, 1, 1, 1,
-0.3892151, 0.06540039, -2.180816, 1, 1, 1, 1, 1,
-0.3853182, -0.0008200416, -1.374092, 1, 1, 1, 1, 1,
-0.3826407, 0.5482771, -1.902616, 1, 1, 1, 1, 1,
-0.3808973, 1.072358, 0.6552536, 1, 1, 1, 1, 1,
-0.3802853, -0.3466589, -2.469608, 1, 1, 1, 1, 1,
-0.3766466, 1.115802, 0.6678906, 1, 1, 1, 1, 1,
-0.3746257, 1.659389, 0.8254142, 1, 1, 1, 1, 1,
-0.3709856, -1.295668, -2.444731, 1, 1, 1, 1, 1,
-0.3707106, 0.1923985, -1.840575, 1, 1, 1, 1, 1,
-0.3704194, 0.5685806, -1.300357, 1, 1, 1, 1, 1,
-0.3641856, -3.135938, -1.119734, 1, 1, 1, 1, 1,
-0.3641723, 0.1697763, 0.286641, 0, 0, 1, 1, 1,
-0.362761, 0.3900996, -0.7557859, 1, 0, 0, 1, 1,
-0.357409, -1.019645, -4.143871, 1, 0, 0, 1, 1,
-0.3546692, 0.5989293, -3.112318, 1, 0, 0, 1, 1,
-0.3516708, 2.338014, -0.5002802, 1, 0, 0, 1, 1,
-0.3477428, 0.7016443, 0.091678, 1, 0, 0, 1, 1,
-0.3464574, 0.3012608, -0.5277436, 0, 0, 0, 1, 1,
-0.3458382, -0.4085231, -1.034723, 0, 0, 0, 1, 1,
-0.3452265, 2.175364, -1.699664, 0, 0, 0, 1, 1,
-0.3380148, -0.6310127, -3.062394, 0, 0, 0, 1, 1,
-0.337499, 0.4154783, -1.903045, 0, 0, 0, 1, 1,
-0.3337735, -2.131805, -1.730734, 0, 0, 0, 1, 1,
-0.3301677, 0.6993324, -1.460472, 0, 0, 0, 1, 1,
-0.3288622, -0.3784055, -3.655459, 1, 1, 1, 1, 1,
-0.3258397, -0.163804, -1.590557, 1, 1, 1, 1, 1,
-0.3246659, -1.124625, -4.661606, 1, 1, 1, 1, 1,
-0.3203506, 0.08890927, -1.002697, 1, 1, 1, 1, 1,
-0.317426, 0.3783328, -0.2808117, 1, 1, 1, 1, 1,
-0.3075, -1.30536, -3.69871, 1, 1, 1, 1, 1,
-0.3072021, -0.1408757, -2.415081, 1, 1, 1, 1, 1,
-0.304098, 0.4523889, -1.333484, 1, 1, 1, 1, 1,
-0.3033934, -0.2783894, -2.910218, 1, 1, 1, 1, 1,
-0.3012211, -2.571144, -2.681172, 1, 1, 1, 1, 1,
-0.3011355, 1.130843, -0.144403, 1, 1, 1, 1, 1,
-0.2997231, -1.645771, -3.352637, 1, 1, 1, 1, 1,
-0.2971062, -0.3189741, -1.780479, 1, 1, 1, 1, 1,
-0.2958445, -0.3260023, -2.372355, 1, 1, 1, 1, 1,
-0.2946777, 0.08468816, -1.135919, 1, 1, 1, 1, 1,
-0.2944759, 1.314488, 0.6987446, 0, 0, 1, 1, 1,
-0.2920657, 0.1179745, -0.6384903, 1, 0, 0, 1, 1,
-0.2889855, 1.460655, -0.128823, 1, 0, 0, 1, 1,
-0.288378, 0.9821017, 0.2148745, 1, 0, 0, 1, 1,
-0.2818889, 1.661932, -1.077356, 1, 0, 0, 1, 1,
-0.2756212, 0.5226722, -1.113922, 1, 0, 0, 1, 1,
-0.2738498, -1.269139, -2.371754, 0, 0, 0, 1, 1,
-0.2723088, 1.622306, 0.728896, 0, 0, 0, 1, 1,
-0.2713271, 0.4624519, -0.9577269, 0, 0, 0, 1, 1,
-0.2694228, 1.542758, 0.3087895, 0, 0, 0, 1, 1,
-0.2649798, -0.1855105, -0.541994, 0, 0, 0, 1, 1,
-0.2599131, -0.194772, -1.924272, 0, 0, 0, 1, 1,
-0.2593031, 0.1501656, -2.810181, 0, 0, 0, 1, 1,
-0.2571336, 1.377571, -0.6862147, 1, 1, 1, 1, 1,
-0.2503188, 1.157737, 0.7373862, 1, 1, 1, 1, 1,
-0.2471365, -1.257707, -2.379573, 1, 1, 1, 1, 1,
-0.2465786, 0.9531222, 0.170189, 1, 1, 1, 1, 1,
-0.2463587, -0.4263864, -2.404006, 1, 1, 1, 1, 1,
-0.2453337, -0.4374781, -2.972075, 1, 1, 1, 1, 1,
-0.2451351, 0.8676806, -0.8384749, 1, 1, 1, 1, 1,
-0.2439741, -0.4388513, -2.774755, 1, 1, 1, 1, 1,
-0.2437201, 0.9591783, -0.3635127, 1, 1, 1, 1, 1,
-0.2404466, -0.3480633, -4.114768, 1, 1, 1, 1, 1,
-0.2363459, -0.2502378, -2.758479, 1, 1, 1, 1, 1,
-0.2363358, 0.7462921, -1.267971, 1, 1, 1, 1, 1,
-0.2352463, 0.7802032, -0.3523762, 1, 1, 1, 1, 1,
-0.2349682, -1.305, -4.446795, 1, 1, 1, 1, 1,
-0.2338998, -2.133343, -2.554241, 1, 1, 1, 1, 1,
-0.2318085, -0.1263115, -1.736795, 0, 0, 1, 1, 1,
-0.2294971, 0.9379554, -0.192863, 1, 0, 0, 1, 1,
-0.2289391, -0.5809237, -2.058133, 1, 0, 0, 1, 1,
-0.2277812, 1.161733, -0.1094799, 1, 0, 0, 1, 1,
-0.2269867, 0.2300188, -0.3698832, 1, 0, 0, 1, 1,
-0.2260655, 1.55924, 1.281536, 1, 0, 0, 1, 1,
-0.2183414, -0.5207456, -1.862076, 0, 0, 0, 1, 1,
-0.213438, -2.308451, -4.268618, 0, 0, 0, 1, 1,
-0.2133987, -1.076153, -2.978066, 0, 0, 0, 1, 1,
-0.2121679, 0.05010308, -1.656447, 0, 0, 0, 1, 1,
-0.2085951, -1.021731, -3.104278, 0, 0, 0, 1, 1,
-0.2063469, 0.1721003, -1.31028, 0, 0, 0, 1, 1,
-0.2054555, 2.00036, 0.9708586, 0, 0, 0, 1, 1,
-0.2040718, -1.851272, -1.763037, 1, 1, 1, 1, 1,
-0.2021256, -1.760759, -1.770643, 1, 1, 1, 1, 1,
-0.2017746, -0.7507116, -2.924233, 1, 1, 1, 1, 1,
-0.1998706, -0.1428919, -2.318005, 1, 1, 1, 1, 1,
-0.1989145, -2.399209, -4.52825, 1, 1, 1, 1, 1,
-0.1988069, 0.632043, -0.240386, 1, 1, 1, 1, 1,
-0.1983729, 0.96253, -0.1181448, 1, 1, 1, 1, 1,
-0.1973406, 0.1432931, -0.9360664, 1, 1, 1, 1, 1,
-0.1940409, -0.479708, -1.836427, 1, 1, 1, 1, 1,
-0.1910134, 0.4002356, -1.120942, 1, 1, 1, 1, 1,
-0.1906094, -0.5004861, -2.418831, 1, 1, 1, 1, 1,
-0.1892419, 0.2558187, -0.8681192, 1, 1, 1, 1, 1,
-0.1872191, 0.4056656, 0.3106066, 1, 1, 1, 1, 1,
-0.1820051, 0.3349627, -0.04789152, 1, 1, 1, 1, 1,
-0.1783531, 1.248187, -1.848567, 1, 1, 1, 1, 1,
-0.1778006, 0.6170367, -0.484822, 0, 0, 1, 1, 1,
-0.1754856, 0.006252805, -1.335762, 1, 0, 0, 1, 1,
-0.173953, -0.8688697, -4.617652, 1, 0, 0, 1, 1,
-0.168377, -0.3263083, -1.99544, 1, 0, 0, 1, 1,
-0.1657262, -0.6167357, -2.319188, 1, 0, 0, 1, 1,
-0.1652923, 0.6916887, -1.422118, 1, 0, 0, 1, 1,
-0.1631173, -0.8906531, -2.625313, 0, 0, 0, 1, 1,
-0.1615959, -0.9439321, -4.561926, 0, 0, 0, 1, 1,
-0.1592845, 1.241751, 0.374846, 0, 0, 0, 1, 1,
-0.1591794, -0.5279552, -2.603277, 0, 0, 0, 1, 1,
-0.1562397, -1.968633, -0.686482, 0, 0, 0, 1, 1,
-0.1547759, 0.9937313, 0.682281, 0, 0, 0, 1, 1,
-0.154461, -0.7071862, -3.098203, 0, 0, 0, 1, 1,
-0.1533228, 1.121679, -0.5570849, 1, 1, 1, 1, 1,
-0.1515523, 0.7411131, -0.3522764, 1, 1, 1, 1, 1,
-0.1513228, -1.496364, -3.923338, 1, 1, 1, 1, 1,
-0.1420289, -0.2938374, -2.493229, 1, 1, 1, 1, 1,
-0.1388781, -1.213652, -1.800432, 1, 1, 1, 1, 1,
-0.1364601, 0.8474011, -0.7623032, 1, 1, 1, 1, 1,
-0.1315457, -1.946472, -2.594115, 1, 1, 1, 1, 1,
-0.1275965, -1.621123, -4.001978, 1, 1, 1, 1, 1,
-0.1266311, 0.02991979, -2.404823, 1, 1, 1, 1, 1,
-0.1242249, -0.3588418, -2.079203, 1, 1, 1, 1, 1,
-0.1227811, 0.8791281, -0.7226756, 1, 1, 1, 1, 1,
-0.1189432, -1.094189, -3.417284, 1, 1, 1, 1, 1,
-0.1078322, 0.08040318, -1.47741, 1, 1, 1, 1, 1,
-0.1038831, -0.6092901, -2.201016, 1, 1, 1, 1, 1,
-0.09989148, 1.264816, 0.8567584, 1, 1, 1, 1, 1,
-0.09829149, 0.6831626, -0.5764587, 0, 0, 1, 1, 1,
-0.09214572, 0.1705373, -0.9531649, 1, 0, 0, 1, 1,
-0.07097761, -0.4679556, -3.65892, 1, 0, 0, 1, 1,
-0.07010647, 0.62283, 1.658408, 1, 0, 0, 1, 1,
-0.06219008, -0.435286, -2.78845, 1, 0, 0, 1, 1,
-0.05253011, -1.038542, -2.636672, 1, 0, 0, 1, 1,
-0.05076248, 0.3454635, 0.7344059, 0, 0, 0, 1, 1,
-0.04912884, 0.4574887, -1.567207, 0, 0, 0, 1, 1,
-0.03916815, -0.2895935, -2.040979, 0, 0, 0, 1, 1,
-0.03902734, -0.1184441, -2.505489, 0, 0, 0, 1, 1,
-0.03872152, -0.5895568, -2.233475, 0, 0, 0, 1, 1,
-0.03080621, 0.9537817, 1.01635, 0, 0, 0, 1, 1,
-0.03002405, 0.6656134, 1.349827, 0, 0, 0, 1, 1,
-0.02609641, 0.4518402, 1.495361, 1, 1, 1, 1, 1,
-0.02352027, 0.3627903, -1.391973, 1, 1, 1, 1, 1,
-0.02212976, -0.14037, -2.395087, 1, 1, 1, 1, 1,
-0.01806687, -0.7360402, -2.536737, 1, 1, 1, 1, 1,
-0.01771136, 0.8880936, 0.9874623, 1, 1, 1, 1, 1,
-0.01624134, 0.3745305, 1.922231, 1, 1, 1, 1, 1,
-0.016208, 0.5782703, -1.599465, 1, 1, 1, 1, 1,
-0.01356484, -1.576091, -3.566406, 1, 1, 1, 1, 1,
-0.00761683, -1.255029, -2.183251, 1, 1, 1, 1, 1,
0.001567562, 0.521998, 1.316324, 1, 1, 1, 1, 1,
0.002008657, -2.078112, 2.918207, 1, 1, 1, 1, 1,
0.009247475, -0.4215298, 2.837465, 1, 1, 1, 1, 1,
0.01307284, -0.5612087, 4.781298, 1, 1, 1, 1, 1,
0.02031328, 0.7176853, -0.2278558, 1, 1, 1, 1, 1,
0.02037613, -0.1019514, 4.343105, 1, 1, 1, 1, 1,
0.02066077, -0.4169125, 2.499229, 0, 0, 1, 1, 1,
0.0284396, 1.478099, 1.3866, 1, 0, 0, 1, 1,
0.02894584, -1.529213, 3.561835, 1, 0, 0, 1, 1,
0.03308725, 1.187647, -2.039005, 1, 0, 0, 1, 1,
0.03427812, 1.375544, 0.791288, 1, 0, 0, 1, 1,
0.0346483, 0.1083726, -0.9399521, 1, 0, 0, 1, 1,
0.03587943, -0.352166, 1.904713, 0, 0, 0, 1, 1,
0.04366765, -0.2196544, 3.213972, 0, 0, 0, 1, 1,
0.04386537, -1.890985, 1.976432, 0, 0, 0, 1, 1,
0.04530457, -2.32748, 2.270075, 0, 0, 0, 1, 1,
0.04722439, -0.4863921, 4.283242, 0, 0, 0, 1, 1,
0.04921047, -0.4156058, 3.878319, 0, 0, 0, 1, 1,
0.04922767, -0.0829227, 1.226552, 0, 0, 0, 1, 1,
0.05102177, 1.010984, -1.081869, 1, 1, 1, 1, 1,
0.05177271, 3.834527, 1.617378, 1, 1, 1, 1, 1,
0.05194879, -1.689533, 3.86646, 1, 1, 1, 1, 1,
0.05577263, 0.4699483, 0.4115424, 1, 1, 1, 1, 1,
0.05835372, -1.264052, 2.745237, 1, 1, 1, 1, 1,
0.05861225, 1.059049, -0.3705648, 1, 1, 1, 1, 1,
0.06045082, 0.7264512, 0.795139, 1, 1, 1, 1, 1,
0.06089072, -0.4461544, 2.68575, 1, 1, 1, 1, 1,
0.06561964, 0.2941723, 0.2801259, 1, 1, 1, 1, 1,
0.06797352, -1.221806, 2.446573, 1, 1, 1, 1, 1,
0.07095759, -0.8290397, 2.422327, 1, 1, 1, 1, 1,
0.0715569, -0.7054872, 3.70338, 1, 1, 1, 1, 1,
0.07220466, -0.5826387, 2.662349, 1, 1, 1, 1, 1,
0.0758623, 0.3804306, 0.3943197, 1, 1, 1, 1, 1,
0.07619014, 0.6810959, 1.656456, 1, 1, 1, 1, 1,
0.08040266, -0.3017405, 3.414927, 0, 0, 1, 1, 1,
0.08064841, -0.6080328, 4.440405, 1, 0, 0, 1, 1,
0.08099794, -0.121435, 2.738534, 1, 0, 0, 1, 1,
0.08103683, 0.05936247, 0.2919327, 1, 0, 0, 1, 1,
0.08405135, -1.307604, 2.976447, 1, 0, 0, 1, 1,
0.08499167, -1.035439, 2.01438, 1, 0, 0, 1, 1,
0.08884757, -0.9354571, 3.298424, 0, 0, 0, 1, 1,
0.09156408, -0.6923621, 3.153642, 0, 0, 0, 1, 1,
0.09375365, -1.344446, 3.464694, 0, 0, 0, 1, 1,
0.09568308, -1.820675, 3.510805, 0, 0, 0, 1, 1,
0.1058983, -1.502625, 3.634313, 0, 0, 0, 1, 1,
0.1097683, -1.094846, 2.86339, 0, 0, 0, 1, 1,
0.1139788, -0.1934151, 3.344556, 0, 0, 0, 1, 1,
0.1165632, -0.4943201, 2.893213, 1, 1, 1, 1, 1,
0.1249847, -0.03463891, 3.693177, 1, 1, 1, 1, 1,
0.1259361, 0.500421, -0.6973823, 1, 1, 1, 1, 1,
0.1272419, 0.8175027, -0.6479846, 1, 1, 1, 1, 1,
0.1296333, 0.7063321, -0.2530988, 1, 1, 1, 1, 1,
0.141776, 0.1676416, -0.6992666, 1, 1, 1, 1, 1,
0.1428059, 0.0736871, 1.255138, 1, 1, 1, 1, 1,
0.1442465, -0.3447584, 3.041049, 1, 1, 1, 1, 1,
0.144446, -0.08411468, 3.049847, 1, 1, 1, 1, 1,
0.1463294, -0.2308589, 3.515509, 1, 1, 1, 1, 1,
0.1482678, 2.010614, -0.5885145, 1, 1, 1, 1, 1,
0.1500557, -1.015966, 3.863672, 1, 1, 1, 1, 1,
0.1515699, 1.598457, 0.6027731, 1, 1, 1, 1, 1,
0.1556948, -0.4226696, 3.919563, 1, 1, 1, 1, 1,
0.1579873, 0.2872351, 1.971791, 1, 1, 1, 1, 1,
0.1613204, -0.1882588, 1.602411, 0, 0, 1, 1, 1,
0.1625236, 0.3353523, -0.2413278, 1, 0, 0, 1, 1,
0.1628697, -1.359268, 3.723541, 1, 0, 0, 1, 1,
0.1648628, 1.775638, 1.342533, 1, 0, 0, 1, 1,
0.1658795, -0.5336421, 1.993119, 1, 0, 0, 1, 1,
0.1677748, -2.3387, 4.452515, 1, 0, 0, 1, 1,
0.1694498, -0.5624731, 2.570641, 0, 0, 0, 1, 1,
0.1723048, -0.2766358, 3.977689, 0, 0, 0, 1, 1,
0.1729829, 0.6092643, 0.2097631, 0, 0, 0, 1, 1,
0.1731766, 0.295611, 0.8486685, 0, 0, 0, 1, 1,
0.1739433, 2.323936, -1.01509, 0, 0, 0, 1, 1,
0.1751773, -1.339542, 2.031468, 0, 0, 0, 1, 1,
0.1779341, -1.662438, 2.449811, 0, 0, 0, 1, 1,
0.181531, 0.2965761, 1.782305, 1, 1, 1, 1, 1,
0.1818319, 0.5421225, 0.7923765, 1, 1, 1, 1, 1,
0.1847352, 2.366006, 1.332633, 1, 1, 1, 1, 1,
0.1864429, 0.3586197, 0.8110369, 1, 1, 1, 1, 1,
0.1871044, -1.700176, 4.104032, 1, 1, 1, 1, 1,
0.1899352, 0.4497031, 1.191334, 1, 1, 1, 1, 1,
0.1906475, -0.6182708, 2.718485, 1, 1, 1, 1, 1,
0.1944364, 0.6639495, 0.6947905, 1, 1, 1, 1, 1,
0.1947971, 1.436423, 0.0277202, 1, 1, 1, 1, 1,
0.1982214, 0.4076323, 0.1809983, 1, 1, 1, 1, 1,
0.2025978, 0.3380724, 0.534062, 1, 1, 1, 1, 1,
0.2055217, -0.2142339, 3.422694, 1, 1, 1, 1, 1,
0.205788, 1.609195, -0.299365, 1, 1, 1, 1, 1,
0.208555, 1.138916, 0.4258337, 1, 1, 1, 1, 1,
0.2099881, -0.06541459, 1.734703, 1, 1, 1, 1, 1,
0.2116697, -0.4394185, 2.488421, 0, 0, 1, 1, 1,
0.2177019, 0.7517481, 0.301073, 1, 0, 0, 1, 1,
0.2194298, 0.5325674, 0.7166788, 1, 0, 0, 1, 1,
0.2195856, 0.4739915, 0.2638785, 1, 0, 0, 1, 1,
0.2246445, 1.888233, -1.928688, 1, 0, 0, 1, 1,
0.2281187, 0.2408667, 1.152825, 1, 0, 0, 1, 1,
0.2289249, 0.1545648, 0.9531375, 0, 0, 0, 1, 1,
0.2314245, 2.205209, 0.2102646, 0, 0, 0, 1, 1,
0.2327186, 0.5330863, 0.1096164, 0, 0, 0, 1, 1,
0.2363246, 0.3818608, 1.848438, 0, 0, 0, 1, 1,
0.2425608, 0.7869875, -1.465584, 0, 0, 0, 1, 1,
0.2495747, 0.9471717, 1.80852, 0, 0, 0, 1, 1,
0.2497347, 0.08232942, 2.914322, 0, 0, 0, 1, 1,
0.251277, -1.010449, 4.5916, 1, 1, 1, 1, 1,
0.256927, -1.108564, 3.579858, 1, 1, 1, 1, 1,
0.2576204, -0.7683687, 2.309265, 1, 1, 1, 1, 1,
0.2578193, 0.2470112, 0.07684581, 1, 1, 1, 1, 1,
0.2592537, 0.110046, 1.451934, 1, 1, 1, 1, 1,
0.2597656, 0.0942519, 1.563695, 1, 1, 1, 1, 1,
0.2618039, 0.390987, -1.005889, 1, 1, 1, 1, 1,
0.262453, 0.83506, 1.941553, 1, 1, 1, 1, 1,
0.263005, -2.689044, 1.987556, 1, 1, 1, 1, 1,
0.263452, 1.104883, 1.907198, 1, 1, 1, 1, 1,
0.2680834, -0.1887651, 2.465007, 1, 1, 1, 1, 1,
0.2751692, -0.1345907, 2.58144, 1, 1, 1, 1, 1,
0.2772991, 1.829181, -0.5008414, 1, 1, 1, 1, 1,
0.2784789, 1.456086, 0.01875129, 1, 1, 1, 1, 1,
0.281123, -0.2499238, 1.617725, 1, 1, 1, 1, 1,
0.2861075, 0.5701274, -0.4572802, 0, 0, 1, 1, 1,
0.2870724, 1.131412, -0.2971083, 1, 0, 0, 1, 1,
0.2934597, -0.0608455, 2.763009, 1, 0, 0, 1, 1,
0.2936829, -1.901425, 4.991825, 1, 0, 0, 1, 1,
0.2945029, 0.8356429, -0.8711665, 1, 0, 0, 1, 1,
0.2955393, -0.31207, 3.266812, 1, 0, 0, 1, 1,
0.2964872, -1.541194, 3.402185, 0, 0, 0, 1, 1,
0.2969837, 1.15854, -0.6521346, 0, 0, 0, 1, 1,
0.2986564, 0.3708445, 1.051467, 0, 0, 0, 1, 1,
0.2987802, 0.4073976, 1.389022, 0, 0, 0, 1, 1,
0.2990446, -0.3242027, 3.531984, 0, 0, 0, 1, 1,
0.2994028, -0.9222397, 2.603746, 0, 0, 0, 1, 1,
0.3014664, 0.8505669, 0.006326295, 0, 0, 0, 1, 1,
0.302693, -1.914004, 4.278988, 1, 1, 1, 1, 1,
0.3054373, -0.1992493, 1.193184, 1, 1, 1, 1, 1,
0.3055805, 0.001613388, 0.7847267, 1, 1, 1, 1, 1,
0.3091083, -0.2468794, 1.794549, 1, 1, 1, 1, 1,
0.3097413, 2.630309, 0.1622473, 1, 1, 1, 1, 1,
0.3140027, 1.533594, -0.2444394, 1, 1, 1, 1, 1,
0.3170723, 0.2446005, 0.9334916, 1, 1, 1, 1, 1,
0.3207531, -1.892794, 2.848683, 1, 1, 1, 1, 1,
0.323195, -0.7452233, 3.189293, 1, 1, 1, 1, 1,
0.3254851, 1.959407, 0.6589301, 1, 1, 1, 1, 1,
0.3272212, -0.03864779, 2.538182, 1, 1, 1, 1, 1,
0.3331806, -1.156763, 3.722588, 1, 1, 1, 1, 1,
0.3352011, 0.8508905, 0.7528487, 1, 1, 1, 1, 1,
0.3416409, 0.3784252, 1.413223, 1, 1, 1, 1, 1,
0.3434702, -0.3041283, 2.622577, 1, 1, 1, 1, 1,
0.3472, -1.941601, 2.380372, 0, 0, 1, 1, 1,
0.3476453, -1.22753, 4.191746, 1, 0, 0, 1, 1,
0.353172, -2.126215, 1.751789, 1, 0, 0, 1, 1,
0.3542212, 0.7471406, 0.8403069, 1, 0, 0, 1, 1,
0.3543357, 0.5695314, -0.09494337, 1, 0, 0, 1, 1,
0.3593909, -0.1783846, 1.698254, 1, 0, 0, 1, 1,
0.3603139, -0.6436528, 1.101082, 0, 0, 0, 1, 1,
0.3608381, -0.8910661, 1.806867, 0, 0, 0, 1, 1,
0.3618848, 0.1817915, 1.101091, 0, 0, 0, 1, 1,
0.361975, 0.426359, -1.324114, 0, 0, 0, 1, 1,
0.3638717, 0.3894813, 0.7965709, 0, 0, 0, 1, 1,
0.3684823, 1.439646, 0.8263091, 0, 0, 0, 1, 1,
0.3697726, -0.8247072, 1.476889, 0, 0, 0, 1, 1,
0.3714586, 0.09642282, 0.8681192, 1, 1, 1, 1, 1,
0.3723291, -2.496001, 2.951889, 1, 1, 1, 1, 1,
0.3730506, 0.07760941, 0.9370194, 1, 1, 1, 1, 1,
0.3731245, -0.2109287, 0.4042894, 1, 1, 1, 1, 1,
0.3793166, 0.3772254, 0.5322386, 1, 1, 1, 1, 1,
0.39023, -0.6352787, 3.168184, 1, 1, 1, 1, 1,
0.3910513, -0.6140074, 0.5888851, 1, 1, 1, 1, 1,
0.3985586, 0.8307968, 0.7342718, 1, 1, 1, 1, 1,
0.4120781, 1.052111, 0.7476581, 1, 1, 1, 1, 1,
0.4126593, -0.1492659, 2.230235, 1, 1, 1, 1, 1,
0.4130321, -0.8183914, 2.847538, 1, 1, 1, 1, 1,
0.4132307, 1.101691, 0.9130569, 1, 1, 1, 1, 1,
0.41384, -0.4088593, 3.010113, 1, 1, 1, 1, 1,
0.4149491, -1.03637, 2.549653, 1, 1, 1, 1, 1,
0.4188697, 1.627577, -0.2167012, 1, 1, 1, 1, 1,
0.4207152, 1.117932, -0.4640307, 0, 0, 1, 1, 1,
0.4216288, -0.7764845, 3.772244, 1, 0, 0, 1, 1,
0.4222013, -0.214236, 2.172277, 1, 0, 0, 1, 1,
0.4259775, 0.1909699, 0.1976182, 1, 0, 0, 1, 1,
0.4339302, -0.3630626, 2.87102, 1, 0, 0, 1, 1,
0.4353976, 0.9631724, 1.112668, 1, 0, 0, 1, 1,
0.4369048, -0.8762935, 3.073106, 0, 0, 0, 1, 1,
0.4438171, -0.2563774, 2.209649, 0, 0, 0, 1, 1,
0.4466698, -1.245222, 2.920336, 0, 0, 0, 1, 1,
0.4497283, -0.5058457, 2.378871, 0, 0, 0, 1, 1,
0.450833, 0.6151904, 2.267173, 0, 0, 0, 1, 1,
0.4524633, 0.7560751, 0.901382, 0, 0, 0, 1, 1,
0.4539452, 1.392694, 0.8064995, 0, 0, 0, 1, 1,
0.4559178, 0.5732413, 0.7265602, 1, 1, 1, 1, 1,
0.4573849, -1.371135, 4.147998, 1, 1, 1, 1, 1,
0.4605307, -1.96482, 3.25966, 1, 1, 1, 1, 1,
0.4661528, 0.6017137, 1.533315, 1, 1, 1, 1, 1,
0.4661681, -2.53039, 3.188552, 1, 1, 1, 1, 1,
0.4698243, -1.242809, 1.087251, 1, 1, 1, 1, 1,
0.4717087, 0.4951148, 1.949534, 1, 1, 1, 1, 1,
0.4808337, 0.288813, 0.3582033, 1, 1, 1, 1, 1,
0.4827764, 0.876523, -0.2905649, 1, 1, 1, 1, 1,
0.4844629, 1.037843, -0.1683754, 1, 1, 1, 1, 1,
0.4864224, -1.593313, 3.209152, 1, 1, 1, 1, 1,
0.4873364, -0.3542696, 2.054682, 1, 1, 1, 1, 1,
0.4879743, -0.9533831, 3.363825, 1, 1, 1, 1, 1,
0.4891899, 1.708413, 0.1821948, 1, 1, 1, 1, 1,
0.4909211, 1.132296, 1.236304, 1, 1, 1, 1, 1,
0.4965105, -1.798845, 1.308359, 0, 0, 1, 1, 1,
0.4977554, -0.1847146, 1.892355, 1, 0, 0, 1, 1,
0.4989449, 0.1582814, 1.528377, 1, 0, 0, 1, 1,
0.4991198, 1.570149, 0.400065, 1, 0, 0, 1, 1,
0.5000986, 1.377271, 1.154356, 1, 0, 0, 1, 1,
0.5053199, -0.2813052, 1.663784, 1, 0, 0, 1, 1,
0.5060099, 0.07922897, 2.595226, 0, 0, 0, 1, 1,
0.5089405, -1.185068, 1.550654, 0, 0, 0, 1, 1,
0.5120839, 1.090267, -0.2907452, 0, 0, 0, 1, 1,
0.5128432, -0.2264949, 2.821786, 0, 0, 0, 1, 1,
0.5144776, 0.1425829, 1.44596, 0, 0, 0, 1, 1,
0.5167131, -0.6347737, 3.371449, 0, 0, 0, 1, 1,
0.5181593, -0.3517331, 2.01361, 0, 0, 0, 1, 1,
0.5242186, 0.1123126, -0.3274108, 1, 1, 1, 1, 1,
0.5282301, 1.096264, -0.8211243, 1, 1, 1, 1, 1,
0.5285586, -1.587555, 0.9401501, 1, 1, 1, 1, 1,
0.5293906, 1.366284, -1.870854, 1, 1, 1, 1, 1,
0.5413999, -2.212181, 3.707519, 1, 1, 1, 1, 1,
0.5423626, -0.6029974, 2.323542, 1, 1, 1, 1, 1,
0.5439379, -0.1309322, 1.795328, 1, 1, 1, 1, 1,
0.544184, -0.6036832, 4.451408, 1, 1, 1, 1, 1,
0.5478678, -0.9302416, 4.126083, 1, 1, 1, 1, 1,
0.5492073, 0.110988, 2.593123, 1, 1, 1, 1, 1,
0.5521385, 0.2333654, 0.7508522, 1, 1, 1, 1, 1,
0.5523841, 0.9517677, -1.02344, 1, 1, 1, 1, 1,
0.5565495, -0.2580465, 3.277923, 1, 1, 1, 1, 1,
0.5573963, -0.3166935, 2.033188, 1, 1, 1, 1, 1,
0.5577206, -0.6604418, 3.336491, 1, 1, 1, 1, 1,
0.5588633, -0.611847, 4.320328, 0, 0, 1, 1, 1,
0.5601928, 1.406951, -0.4854403, 1, 0, 0, 1, 1,
0.5623471, 0.6384491, -0.5357523, 1, 0, 0, 1, 1,
0.5710121, -0.3507578, 2.364173, 1, 0, 0, 1, 1,
0.5738556, 0.6453433, 0.4255484, 1, 0, 0, 1, 1,
0.5747758, -1.017754, 2.25487, 1, 0, 0, 1, 1,
0.5749043, -1.443685, 3.626428, 0, 0, 0, 1, 1,
0.5766339, -1.835867, 1.151794, 0, 0, 0, 1, 1,
0.5813962, 1.164042, -0.3796881, 0, 0, 0, 1, 1,
0.5852086, 1.600932, 0.01682746, 0, 0, 0, 1, 1,
0.5869972, -0.3391834, 2.323664, 0, 0, 0, 1, 1,
0.5883755, -0.4979538, 2.151192, 0, 0, 0, 1, 1,
0.5888656, -2.138801, 2.529084, 0, 0, 0, 1, 1,
0.5914443, -0.6880631, 3.074393, 1, 1, 1, 1, 1,
0.5939076, 2.037268, 0.08915416, 1, 1, 1, 1, 1,
0.598082, 0.5847437, 1.052158, 1, 1, 1, 1, 1,
0.6009215, -1.098097, 1.725056, 1, 1, 1, 1, 1,
0.601414, -0.2385732, 2.103889, 1, 1, 1, 1, 1,
0.608505, -1.253272, 4.348396, 1, 1, 1, 1, 1,
0.6092167, -2.532845, 2.495577, 1, 1, 1, 1, 1,
0.6141678, 0.7204876, 1.35617, 1, 1, 1, 1, 1,
0.6163433, 0.9061857, 0.1748982, 1, 1, 1, 1, 1,
0.6189504, 0.6113002, 0.6456865, 1, 1, 1, 1, 1,
0.6191975, -0.7277792, 4.727212, 1, 1, 1, 1, 1,
0.619863, 1.607955, 0.3326956, 1, 1, 1, 1, 1,
0.6200876, -1.150761, 0.2741573, 1, 1, 1, 1, 1,
0.6306573, 0.7371607, 1.129513, 1, 1, 1, 1, 1,
0.635685, 1.161386, 0.8860515, 1, 1, 1, 1, 1,
0.6429864, -1.290386, 3.977536, 0, 0, 1, 1, 1,
0.6430078, -1.279001, 3.276689, 1, 0, 0, 1, 1,
0.6432773, 0.3668646, -0.943216, 1, 0, 0, 1, 1,
0.6469762, 1.111071, 1.583431, 1, 0, 0, 1, 1,
0.649626, -2.315487, 3.242824, 1, 0, 0, 1, 1,
0.6504959, 0.3642557, -0.0856917, 1, 0, 0, 1, 1,
0.6508772, -0.9445918, 3.936256, 0, 0, 0, 1, 1,
0.6554945, -0.4677536, 1.669684, 0, 0, 0, 1, 1,
0.6609061, 0.6132755, -0.1689106, 0, 0, 0, 1, 1,
0.661756, -0.2404685, 2.125872, 0, 0, 0, 1, 1,
0.666824, -1.236025, 3.28257, 0, 0, 0, 1, 1,
0.6675748, -0.3555214, 3.301654, 0, 0, 0, 1, 1,
0.6722111, 0.4168302, 1.496264, 0, 0, 0, 1, 1,
0.6734514, 0.02045025, 1.911757, 1, 1, 1, 1, 1,
0.6742521, 0.4768446, 1.787395, 1, 1, 1, 1, 1,
0.6754893, -1.562937, 4.154584, 1, 1, 1, 1, 1,
0.6782759, -0.830381, 2.893236, 1, 1, 1, 1, 1,
0.6839136, -2.785531, 3.836593, 1, 1, 1, 1, 1,
0.6843821, 1.235987, -0.3382484, 1, 1, 1, 1, 1,
0.6863073, 1.032833, -0.1618516, 1, 1, 1, 1, 1,
0.6876969, -0.2943627, 2.120198, 1, 1, 1, 1, 1,
0.6879234, 0.03012806, 0.9728558, 1, 1, 1, 1, 1,
0.6884332, 0.6837403, 2.964225, 1, 1, 1, 1, 1,
0.6987178, -0.2447541, 1.005853, 1, 1, 1, 1, 1,
0.7001032, 0.6442202, 2.639632, 1, 1, 1, 1, 1,
0.7021702, -0.3128313, 3.228873, 1, 1, 1, 1, 1,
0.7021823, 0.2277419, 1.362123, 1, 1, 1, 1, 1,
0.7109401, -1.070755, 2.795154, 1, 1, 1, 1, 1,
0.711332, 0.2914413, 1.399833, 0, 0, 1, 1, 1,
0.713869, -0.7774027, 2.387434, 1, 0, 0, 1, 1,
0.7160608, -0.576153, 2.559816, 1, 0, 0, 1, 1,
0.7229043, 0.3007625, 1.461733, 1, 0, 0, 1, 1,
0.7313841, -0.1262845, 1.863892, 1, 0, 0, 1, 1,
0.7333989, -0.2062157, 0.3103016, 1, 0, 0, 1, 1,
0.7348722, 3.31713, -0.6790094, 0, 0, 0, 1, 1,
0.7401901, -0.5817254, 2.120508, 0, 0, 0, 1, 1,
0.7429606, -0.6584685, 2.522021, 0, 0, 0, 1, 1,
0.7456337, 0.6207774, 1.314383, 0, 0, 0, 1, 1,
0.7470739, 1.246839, -0.5466501, 0, 0, 0, 1, 1,
0.7506238, -0.3552764, 2.087655, 0, 0, 0, 1, 1,
0.7515586, 2.335931, 0.3354827, 0, 0, 0, 1, 1,
0.7526134, -1.831704, 2.205532, 1, 1, 1, 1, 1,
0.7530491, 1.365837, -1.000927, 1, 1, 1, 1, 1,
0.7588251, -0.7485869, 2.849172, 1, 1, 1, 1, 1,
0.7652947, 0.1712107, 2.309096, 1, 1, 1, 1, 1,
0.7696747, -1.18905, 3.179366, 1, 1, 1, 1, 1,
0.7869967, -0.1697409, 2.798482, 1, 1, 1, 1, 1,
0.792262, 1.325372, 0.08620551, 1, 1, 1, 1, 1,
0.7958804, 0.9755497, 2.531316, 1, 1, 1, 1, 1,
0.8004251, 0.1116972, 3.315455, 1, 1, 1, 1, 1,
0.801899, -0.07824384, 1.779294, 1, 1, 1, 1, 1,
0.804076, -1.053011, 2.749299, 1, 1, 1, 1, 1,
0.8066872, 0.7221309, 3.062607, 1, 1, 1, 1, 1,
0.8105417, -0.1162168, 2.500527, 1, 1, 1, 1, 1,
0.8142424, -0.3180318, 1.934587, 1, 1, 1, 1, 1,
0.8164137, -0.9452712, 2.921804, 1, 1, 1, 1, 1,
0.8189998, -1.131665, 3.765765, 0, 0, 1, 1, 1,
0.819913, -0.8777568, 0.9691389, 1, 0, 0, 1, 1,
0.8231132, -0.8654336, 1.684112, 1, 0, 0, 1, 1,
0.8251266, -0.1150471, 1.455295, 1, 0, 0, 1, 1,
0.8308772, -0.554882, 1.788344, 1, 0, 0, 1, 1,
0.8311709, -1.18507, 3.582664, 1, 0, 0, 1, 1,
0.8384801, 1.705102, -0.4125714, 0, 0, 0, 1, 1,
0.8421567, -0.2798448, 2.676524, 0, 0, 0, 1, 1,
0.8449774, 0.2752047, 1.777953, 0, 0, 0, 1, 1,
0.8455726, -0.8225985, 2.745963, 0, 0, 0, 1, 1,
0.8478763, -1.452477, 2.199915, 0, 0, 0, 1, 1,
0.8493018, -0.2688763, 2.561724, 0, 0, 0, 1, 1,
0.8546538, -0.7546143, 3.019836, 0, 0, 0, 1, 1,
0.8551204, 0.5769293, 0.05031047, 1, 1, 1, 1, 1,
0.8576271, 0.1353776, 2.521232, 1, 1, 1, 1, 1,
0.8646119, -1.473207, 1.917441, 1, 1, 1, 1, 1,
0.8659384, 0.6409994, 1.752136, 1, 1, 1, 1, 1,
0.8666077, -0.3379616, 1.940125, 1, 1, 1, 1, 1,
0.8672476, -0.07152516, 1.331907, 1, 1, 1, 1, 1,
0.8696616, -0.2840092, 1.953156, 1, 1, 1, 1, 1,
0.873084, -0.2463164, 0.6372421, 1, 1, 1, 1, 1,
0.8807456, -0.1264396, 2.599743, 1, 1, 1, 1, 1,
0.8864422, 0.04253837, 1.977389, 1, 1, 1, 1, 1,
0.8916516, -0.09563521, 1.667203, 1, 1, 1, 1, 1,
0.9085905, -1.72067, 2.54499, 1, 1, 1, 1, 1,
0.9177034, -0.5294805, 1.628078, 1, 1, 1, 1, 1,
0.9204016, 1.107812, -0.57775, 1, 1, 1, 1, 1,
0.9237568, -0.2011864, 0.8190331, 1, 1, 1, 1, 1,
0.9243772, 0.1646197, 2.98106, 0, 0, 1, 1, 1,
0.9278896, -1.660595, 0.4962561, 1, 0, 0, 1, 1,
0.9312031, 0.7756892, 0.4170261, 1, 0, 0, 1, 1,
0.9327378, -0.4475659, 2.613038, 1, 0, 0, 1, 1,
0.9418088, 2.130098, -0.06366406, 1, 0, 0, 1, 1,
0.9436979, -0.0589269, 2.614553, 1, 0, 0, 1, 1,
0.9472118, 0.5213652, 1.201143, 0, 0, 0, 1, 1,
0.951053, 0.4908623, -1.820755, 0, 0, 0, 1, 1,
0.9559558, -0.5393215, 2.247701, 0, 0, 0, 1, 1,
0.9566125, 0.203214, 3.080367, 0, 0, 0, 1, 1,
0.9683715, 1.447379, 3.018027, 0, 0, 0, 1, 1,
0.9749159, -0.6999109, 1.806519, 0, 0, 0, 1, 1,
0.9788045, 0.3549334, 0.9338072, 0, 0, 0, 1, 1,
0.9907212, -1.809228, 1.447343, 1, 1, 1, 1, 1,
0.990744, 0.1465426, 0.9918244, 1, 1, 1, 1, 1,
0.9935673, -0.3017577, 2.951911, 1, 1, 1, 1, 1,
1.000048, 1.054109, 1.073638, 1, 1, 1, 1, 1,
1.001232, 1.298057, 0.02310544, 1, 1, 1, 1, 1,
1.002199, 0.8198442, 0.9339715, 1, 1, 1, 1, 1,
1.007162, 0.06263224, 0.7253342, 1, 1, 1, 1, 1,
1.014533, -0.1593156, 0.1909584, 1, 1, 1, 1, 1,
1.020041, -0.7038647, -0.1223681, 1, 1, 1, 1, 1,
1.025952, -0.620073, 0.8123012, 1, 1, 1, 1, 1,
1.035905, 0.4656958, 1.045219, 1, 1, 1, 1, 1,
1.039198, 0.06851074, 1.910676, 1, 1, 1, 1, 1,
1.041622, 0.9046943, 1.647955, 1, 1, 1, 1, 1,
1.044813, -0.02438835, 1.680255, 1, 1, 1, 1, 1,
1.045863, -0.8126788, 3.040246, 1, 1, 1, 1, 1,
1.046594, 0.8028921, -0.587016, 0, 0, 1, 1, 1,
1.050313, 0.1086111, 0.6124138, 1, 0, 0, 1, 1,
1.075825, -0.777354, 1.182806, 1, 0, 0, 1, 1,
1.081449, 0.6061692, 0.8328925, 1, 0, 0, 1, 1,
1.08932, -0.3474994, 2.894564, 1, 0, 0, 1, 1,
1.09199, 1.690882, -0.06627786, 1, 0, 0, 1, 1,
1.1064, -0.3825406, 3.187657, 0, 0, 0, 1, 1,
1.107841, -0.03188586, 1.827248, 0, 0, 0, 1, 1,
1.107994, 0.198545, 2.301255, 0, 0, 0, 1, 1,
1.110809, -1.129591, 1.843044, 0, 0, 0, 1, 1,
1.111743, 0.1816542, 2.53536, 0, 0, 0, 1, 1,
1.115448, -0.3120539, 3.190996, 0, 0, 0, 1, 1,
1.116447, 1.614496, 1.356016, 0, 0, 0, 1, 1,
1.116593, 0.472688, 1.853745, 1, 1, 1, 1, 1,
1.116734, -2.014896, 4.46704, 1, 1, 1, 1, 1,
1.117697, -0.6949722, 2.543277, 1, 1, 1, 1, 1,
1.117998, -0.7547771, 3.084085, 1, 1, 1, 1, 1,
1.123855, -0.2714553, 2.471811, 1, 1, 1, 1, 1,
1.124303, -1.103197, 4.566013, 1, 1, 1, 1, 1,
1.125688, -2.207714, 4.103291, 1, 1, 1, 1, 1,
1.134034, -0.2476612, 0.3798612, 1, 1, 1, 1, 1,
1.137165, 0.08903162, 1.150181, 1, 1, 1, 1, 1,
1.141053, 1.293379, 0.04879607, 1, 1, 1, 1, 1,
1.144795, -1.083603, 2.546203, 1, 1, 1, 1, 1,
1.149435, 0.1783229, 1.528545, 1, 1, 1, 1, 1,
1.15258, -0.2415158, 3.22201, 1, 1, 1, 1, 1,
1.158542, 0.5346082, 0.2996446, 1, 1, 1, 1, 1,
1.161435, -0.778981, 1.596124, 1, 1, 1, 1, 1,
1.163151, -0.931549, 2.345144, 0, 0, 1, 1, 1,
1.166637, 0.1468515, 2.055907, 1, 0, 0, 1, 1,
1.16696, 0.2329576, 1.223424, 1, 0, 0, 1, 1,
1.170865, -1.409371, 2.427042, 1, 0, 0, 1, 1,
1.176011, 1.653789, 0.907053, 1, 0, 0, 1, 1,
1.178007, 0.8744453, 1.068225, 1, 0, 0, 1, 1,
1.181479, -0.8682465, 3.545167, 0, 0, 0, 1, 1,
1.191179, 1.017242, 0.006392607, 0, 0, 0, 1, 1,
1.193899, 1.137611, -0.06560209, 0, 0, 0, 1, 1,
1.194808, 1.532747, 0.5227124, 0, 0, 0, 1, 1,
1.203947, -0.6161327, 2.222355, 0, 0, 0, 1, 1,
1.205107, 0.5171935, 1.99503, 0, 0, 0, 1, 1,
1.205612, 0.7141463, 0.743986, 0, 0, 0, 1, 1,
1.210579, 0.6912438, 0.431233, 1, 1, 1, 1, 1,
1.216545, -0.9919239, 2.882492, 1, 1, 1, 1, 1,
1.243689, -1.609111, 4.516419, 1, 1, 1, 1, 1,
1.244511, -0.4066671, 1.158646, 1, 1, 1, 1, 1,
1.246706, -0.2228056, -1.191073, 1, 1, 1, 1, 1,
1.246915, -0.2268266, 2.767948, 1, 1, 1, 1, 1,
1.24917, -1.997628, 0.5449706, 1, 1, 1, 1, 1,
1.253257, -1.206845, 2.286126, 1, 1, 1, 1, 1,
1.256937, -0.2750369, 0.9865893, 1, 1, 1, 1, 1,
1.264658, -0.0677417, 0.5083562, 1, 1, 1, 1, 1,
1.273446, -0.596639, 2.50529, 1, 1, 1, 1, 1,
1.273754, 0.4868188, 3.009728, 1, 1, 1, 1, 1,
1.275545, 1.112342, 2.380802, 1, 1, 1, 1, 1,
1.276415, 0.8544814, 0.6763014, 1, 1, 1, 1, 1,
1.277985, 1.167856, 0.3407089, 1, 1, 1, 1, 1,
1.283647, 0.4475492, -0.3650266, 0, 0, 1, 1, 1,
1.290638, -0.2910532, 0.3749937, 1, 0, 0, 1, 1,
1.29452, -0.3201996, 1.887171, 1, 0, 0, 1, 1,
1.303701, -1.450874, 2.112551, 1, 0, 0, 1, 1,
1.308861, -0.6298435, 1.205124, 1, 0, 0, 1, 1,
1.310632, -0.4805582, 0.7220101, 1, 0, 0, 1, 1,
1.324235, -1.15699, 1.478969, 0, 0, 0, 1, 1,
1.326891, 1.278224, 0.7985536, 0, 0, 0, 1, 1,
1.333425, -0.8262537, 2.972673, 0, 0, 0, 1, 1,
1.336805, -0.1454641, 1.739307, 0, 0, 0, 1, 1,
1.341795, -1.300258, 2.071968, 0, 0, 0, 1, 1,
1.343337, 0.2398815, 3.711946, 0, 0, 0, 1, 1,
1.349877, 1.150523, 2.300344, 0, 0, 0, 1, 1,
1.350634, 0.8795809, 0.9518304, 1, 1, 1, 1, 1,
1.357536, 0.01740608, 3.528513, 1, 1, 1, 1, 1,
1.367841, -0.4982858, 3.760337, 1, 1, 1, 1, 1,
1.373735, 0.1057492, -0.6455407, 1, 1, 1, 1, 1,
1.381291, 0.2884466, 0.4808879, 1, 1, 1, 1, 1,
1.384846, -0.0850343, 0.6110345, 1, 1, 1, 1, 1,
1.38541, -0.9842212, 2.299349, 1, 1, 1, 1, 1,
1.390502, 0.360106, -0.425202, 1, 1, 1, 1, 1,
1.408154, -1.134994, 0.8797048, 1, 1, 1, 1, 1,
1.417807, 0.3970889, 1.908863, 1, 1, 1, 1, 1,
1.424203, -1.155163, 2.554566, 1, 1, 1, 1, 1,
1.431378, 0.8382998, 0.8634496, 1, 1, 1, 1, 1,
1.435997, 0.8021547, -0.303834, 1, 1, 1, 1, 1,
1.442541, 1.241079, 1.877692, 1, 1, 1, 1, 1,
1.446242, -1.276873, 3.149632, 1, 1, 1, 1, 1,
1.449814, 1.179142, 0.8264505, 0, 0, 1, 1, 1,
1.459867, 1.71139, 2.307207, 1, 0, 0, 1, 1,
1.461073, -1.545479, 2.023853, 1, 0, 0, 1, 1,
1.462148, -0.1344836, 1.35668, 1, 0, 0, 1, 1,
1.46512, 0.53805, 2.155106, 1, 0, 0, 1, 1,
1.469343, -0.2961506, 2.534093, 1, 0, 0, 1, 1,
1.477009, -0.07907863, 2.539536, 0, 0, 0, 1, 1,
1.488311, -0.04635407, 0.5028079, 0, 0, 0, 1, 1,
1.504596, -0.8515457, 1.613294, 0, 0, 0, 1, 1,
1.510746, 0.7858472, 0.7276447, 0, 0, 0, 1, 1,
1.511845, -0.6739038, 0.707336, 0, 0, 0, 1, 1,
1.522191, 0.4349027, 1.276988, 0, 0, 0, 1, 1,
1.53691, -0.001932479, 2.626919, 0, 0, 0, 1, 1,
1.542305, 0.8126028, -1.768071, 1, 1, 1, 1, 1,
1.553679, 0.4686163, 1.809828, 1, 1, 1, 1, 1,
1.558978, -1.333527, 2.384981, 1, 1, 1, 1, 1,
1.559478, -1.00059, 0.9907676, 1, 1, 1, 1, 1,
1.570885, -0.9922823, 2.68988, 1, 1, 1, 1, 1,
1.573755, 1.872895, 1.929474, 1, 1, 1, 1, 1,
1.577478, -1.154995, 2.773639, 1, 1, 1, 1, 1,
1.58432, -2.067862, 2.657269, 1, 1, 1, 1, 1,
1.589866, -1.21413, 2.337617, 1, 1, 1, 1, 1,
1.608693, 0.7273492, -0.2578156, 1, 1, 1, 1, 1,
1.643961, 1.066496, 0.3109731, 1, 1, 1, 1, 1,
1.646991, -0.5681705, 1.549154, 1, 1, 1, 1, 1,
1.6535, -1.156159, 2.224216, 1, 1, 1, 1, 1,
1.65804, -0.3555719, 1.90515, 1, 1, 1, 1, 1,
1.661721, 0.02199061, 2.022094, 1, 1, 1, 1, 1,
1.667886, -0.4501469, 2.343861, 0, 0, 1, 1, 1,
1.707383, 1.674552, 0.9323096, 1, 0, 0, 1, 1,
1.708712, -0.3329872, 2.767951, 1, 0, 0, 1, 1,
1.716373, 0.6619434, 1.277382, 1, 0, 0, 1, 1,
1.727724, -1.37207, 1.318023, 1, 0, 0, 1, 1,
1.728328, -2.064334, 3.442087, 1, 0, 0, 1, 1,
1.728727, 0.3020756, -0.7534666, 0, 0, 0, 1, 1,
1.739237, 1.484384, 1.624153, 0, 0, 0, 1, 1,
1.744965, 0.8550379, 2.04717, 0, 0, 0, 1, 1,
1.746391, -0.3802062, 1.640841, 0, 0, 0, 1, 1,
1.746689, -0.5330955, 0.5350236, 0, 0, 0, 1, 1,
1.753462, 1.513506, -0.7451605, 0, 0, 0, 1, 1,
1.777272, 0.4690007, -0.08496501, 0, 0, 0, 1, 1,
1.7807, 0.2326513, 0.4740281, 1, 1, 1, 1, 1,
1.78481, -0.8126227, 1.684096, 1, 1, 1, 1, 1,
1.792593, 0.005973225, 2.491474, 1, 1, 1, 1, 1,
1.80699, 0.0909077, 0.3341381, 1, 1, 1, 1, 1,
1.810896, 0.5804262, 3.067305, 1, 1, 1, 1, 1,
1.828591, -1.155304, 2.242355, 1, 1, 1, 1, 1,
1.860347, -0.06537496, 1.740251, 1, 1, 1, 1, 1,
1.86211, 2.53863, 1.610803, 1, 1, 1, 1, 1,
1.883817, 0.1379091, 1.378604, 1, 1, 1, 1, 1,
1.918468, 0.2298695, 0.9241729, 1, 1, 1, 1, 1,
1.94719, -1.79729, 4.032586, 1, 1, 1, 1, 1,
1.989109, -1.572286, 1.438918, 1, 1, 1, 1, 1,
2.030421, 0.2212749, 1.626841, 1, 1, 1, 1, 1,
2.051495, 0.4547531, 0.5773793, 1, 1, 1, 1, 1,
2.054008, 0.08690161, 2.323994, 1, 1, 1, 1, 1,
2.086362, 0.7188734, 1.134045, 0, 0, 1, 1, 1,
2.110586, -1.889869, 3.915135, 1, 0, 0, 1, 1,
2.134154, -1.19769, 0.4154357, 1, 0, 0, 1, 1,
2.174828, 0.02596482, 1.969321, 1, 0, 0, 1, 1,
2.180217, -1.167781, 0.09684075, 1, 0, 0, 1, 1,
2.208721, 1.137061, 1.744376, 1, 0, 0, 1, 1,
2.246404, 0.5761029, 2.32611, 0, 0, 0, 1, 1,
2.350161, 0.4740113, 0.6754635, 0, 0, 0, 1, 1,
2.449052, -0.357877, 0.9962392, 0, 0, 0, 1, 1,
2.467012, -0.2696818, 0.9308785, 0, 0, 0, 1, 1,
2.468184, -0.2059534, 2.091084, 0, 0, 0, 1, 1,
2.484251, 0.3430533, -0.6328222, 0, 0, 0, 1, 1,
2.511844, -0.3406493, 2.497876, 0, 0, 0, 1, 1,
2.523166, -0.1127967, 2.89486, 1, 1, 1, 1, 1,
2.527558, 0.820523, 0.9435669, 1, 1, 1, 1, 1,
2.587013, -0.2072543, 2.433821, 1, 1, 1, 1, 1,
2.740938, 0.1768952, 1.855816, 1, 1, 1, 1, 1,
2.898029, 0.1930544, 1.062147, 1, 1, 1, 1, 1,
2.978769, -0.739324, 2.932243, 1, 1, 1, 1, 1,
3.52181, 1.506291, -0.1860411, 1, 1, 1, 1, 1
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
var radius = 9.793682;
var distance = 34.39989;
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
mvMatrix.translate( -0.1422892, -0.1968215, 0.2195418 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39989);
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
