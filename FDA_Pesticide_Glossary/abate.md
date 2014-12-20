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
-3.256885, 1.858657, -1.305933, 1, 0, 0, 1,
-2.96154, 0.2834575, -2.047506, 1, 0.007843138, 0, 1,
-2.872662, 0.521373, -0.9703577, 1, 0.01176471, 0, 1,
-2.8155, -1.17432, -3.554223, 1, 0.01960784, 0, 1,
-2.782674, -0.5235039, -1.61668, 1, 0.02352941, 0, 1,
-2.636499, 0.1091585, -0.3351045, 1, 0.03137255, 0, 1,
-2.619264, -0.1314186, -2.636624, 1, 0.03529412, 0, 1,
-2.588447, -1.24803, -2.416424, 1, 0.04313726, 0, 1,
-2.565335, -1.082237, -0.3615071, 1, 0.04705882, 0, 1,
-2.49914, 2.346334, -0.9803683, 1, 0.05490196, 0, 1,
-2.494483, -1.439661, -0.8090022, 1, 0.05882353, 0, 1,
-2.483398, 0.5921355, -2.158584, 1, 0.06666667, 0, 1,
-2.444426, 2.3355, -0.7880877, 1, 0.07058824, 0, 1,
-2.439479, -0.4894134, -2.549061, 1, 0.07843138, 0, 1,
-2.389058, -0.8960536, -0.1121733, 1, 0.08235294, 0, 1,
-2.37924, -0.7217983, -0.853299, 1, 0.09019608, 0, 1,
-2.324714, 0.9672358, -3.243567, 1, 0.09411765, 0, 1,
-2.270058, 1.059584, -1.891009, 1, 0.1019608, 0, 1,
-2.236938, -0.6210268, -1.033405, 1, 0.1098039, 0, 1,
-2.230262, -0.45805, -1.752481, 1, 0.1137255, 0, 1,
-2.203207, 0.1106563, -2.322089, 1, 0.1215686, 0, 1,
-2.183048, -0.2950423, -1.325383, 1, 0.1254902, 0, 1,
-2.174478, 0.1786076, -0.2123425, 1, 0.1333333, 0, 1,
-2.168935, -0.4411612, -0.8261828, 1, 0.1372549, 0, 1,
-2.166175, -1.94445, -3.476717, 1, 0.145098, 0, 1,
-2.165378, -0.771746, -0.1447533, 1, 0.1490196, 0, 1,
-2.13754, 0.7624245, -0.430734, 1, 0.1568628, 0, 1,
-2.134258, 0.6689343, -2.176199, 1, 0.1607843, 0, 1,
-2.110525, 2.630862, -0.6590053, 1, 0.1686275, 0, 1,
-2.082771, -0.849552, -4.123544, 1, 0.172549, 0, 1,
-2.073733, 0.271945, -2.945428, 1, 0.1803922, 0, 1,
-2.072258, -1.077053, -2.738555, 1, 0.1843137, 0, 1,
-2.066543, -0.2985576, -2.17539, 1, 0.1921569, 0, 1,
-2.065622, 1.054706, -2.479074, 1, 0.1960784, 0, 1,
-2.03072, -0.5418796, -1.942999, 1, 0.2039216, 0, 1,
-2.026852, 0.4861586, -1.748441, 1, 0.2117647, 0, 1,
-2.006957, 0.00905635, -1.251882, 1, 0.2156863, 0, 1,
-1.997981, 0.04629634, -0.4802774, 1, 0.2235294, 0, 1,
-1.93773, -0.5839069, -1.323495, 1, 0.227451, 0, 1,
-1.928107, 0.1806285, -1.610401, 1, 0.2352941, 0, 1,
-1.918874, 0.1265655, -1.205226, 1, 0.2392157, 0, 1,
-1.889773, -2.245194, -3.427608, 1, 0.2470588, 0, 1,
-1.8792, 0.03431128, -2.845628, 1, 0.2509804, 0, 1,
-1.860871, 0.774636, -2.081046, 1, 0.2588235, 0, 1,
-1.843083, 0.05394045, -2.913447, 1, 0.2627451, 0, 1,
-1.841395, -0.4074339, -1.338549, 1, 0.2705882, 0, 1,
-1.8343, -0.7967719, -1.483646, 1, 0.2745098, 0, 1,
-1.796291, 0.1340498, -1.396913, 1, 0.282353, 0, 1,
-1.788751, -0.1611475, -1.615775, 1, 0.2862745, 0, 1,
-1.782257, 0.3584176, -3.220061, 1, 0.2941177, 0, 1,
-1.766724, -0.4789104, -1.68838, 1, 0.3019608, 0, 1,
-1.764056, -0.02845023, -2.42969, 1, 0.3058824, 0, 1,
-1.742388, -0.8336179, -0.8539646, 1, 0.3137255, 0, 1,
-1.725465, -0.6461667, -2.518604, 1, 0.3176471, 0, 1,
-1.723169, -0.08589018, -1.069868, 1, 0.3254902, 0, 1,
-1.719406, -0.05914337, -2.343998, 1, 0.3294118, 0, 1,
-1.707376, -0.437389, -0.5599943, 1, 0.3372549, 0, 1,
-1.678004, 0.4906878, -0.3533778, 1, 0.3411765, 0, 1,
-1.663869, -0.2715172, -1.259339, 1, 0.3490196, 0, 1,
-1.66084, -0.002741434, -0.3637812, 1, 0.3529412, 0, 1,
-1.656616, -0.365395, 0.04931543, 1, 0.3607843, 0, 1,
-1.639698, -1.614284, -2.828173, 1, 0.3647059, 0, 1,
-1.632475, -0.1021316, -0.8375132, 1, 0.372549, 0, 1,
-1.631345, 0.1190579, -3.727436, 1, 0.3764706, 0, 1,
-1.627305, -0.005193249, -2.132358, 1, 0.3843137, 0, 1,
-1.620519, -0.3261026, -3.176115, 1, 0.3882353, 0, 1,
-1.576804, -0.5986462, -2.351634, 1, 0.3960784, 0, 1,
-1.574988, 1.063208, -0.1744474, 1, 0.4039216, 0, 1,
-1.558914, -0.6772069, -0.8774895, 1, 0.4078431, 0, 1,
-1.557382, -1.030145, -2.736041, 1, 0.4156863, 0, 1,
-1.553634, -0.02479639, -0.8007067, 1, 0.4196078, 0, 1,
-1.543499, -0.1866581, -1.20597, 1, 0.427451, 0, 1,
-1.531862, 0.8310212, -2.739069, 1, 0.4313726, 0, 1,
-1.531329, -1.051248, -0.7037504, 1, 0.4392157, 0, 1,
-1.511297, 1.804208, -1.145846, 1, 0.4431373, 0, 1,
-1.504008, 0.4586819, -2.26613, 1, 0.4509804, 0, 1,
-1.498916, -2.03284, -3.361593, 1, 0.454902, 0, 1,
-1.497502, -1.402208, 0.1117366, 1, 0.4627451, 0, 1,
-1.475698, 0.08792905, -1.407257, 1, 0.4666667, 0, 1,
-1.47279, 0.8072928, -0.1066567, 1, 0.4745098, 0, 1,
-1.47279, 0.1917609, -1.878125, 1, 0.4784314, 0, 1,
-1.465762, -0.2466941, -4.003811, 1, 0.4862745, 0, 1,
-1.437033, -0.7631883, -1.222894, 1, 0.4901961, 0, 1,
-1.431338, 1.337206, 0.7500911, 1, 0.4980392, 0, 1,
-1.430921, 0.3709219, -1.04156, 1, 0.5058824, 0, 1,
-1.425923, -0.7407597, -2.420764, 1, 0.509804, 0, 1,
-1.424986, 0.6937656, -1.039656, 1, 0.5176471, 0, 1,
-1.424881, 0.2828369, -1.393807, 1, 0.5215687, 0, 1,
-1.423398, 0.6807162, -2.34859, 1, 0.5294118, 0, 1,
-1.422042, 0.6218485, -1.06769, 1, 0.5333334, 0, 1,
-1.416917, -1.034956, -2.17169, 1, 0.5411765, 0, 1,
-1.414572, -2.360562, -1.132087, 1, 0.5450981, 0, 1,
-1.407743, 2.199607, -0.3464667, 1, 0.5529412, 0, 1,
-1.403891, -1.15029, -5.626372, 1, 0.5568628, 0, 1,
-1.399504, 0.4835155, -0.4105524, 1, 0.5647059, 0, 1,
-1.382387, -0.1724278, -1.994671, 1, 0.5686275, 0, 1,
-1.378578, 0.3363128, -1.722758, 1, 0.5764706, 0, 1,
-1.378132, -1.189063, -3.237554, 1, 0.5803922, 0, 1,
-1.369653, -0.2408999, -1.217706, 1, 0.5882353, 0, 1,
-1.365463, 0.8701874, 0.2774195, 1, 0.5921569, 0, 1,
-1.3606, -1.599044, -2.525642, 1, 0.6, 0, 1,
-1.351547, 0.7117026, -1.913262, 1, 0.6078432, 0, 1,
-1.340133, -0.7302522, -1.745966, 1, 0.6117647, 0, 1,
-1.316909, 1.444639, 0.07907565, 1, 0.6196079, 0, 1,
-1.31591, 1.917099, 0.2777053, 1, 0.6235294, 0, 1,
-1.306744, 1.037858, -0.8912364, 1, 0.6313726, 0, 1,
-1.292076, -0.7051842, -2.040199, 1, 0.6352941, 0, 1,
-1.290654, -0.7913201, -2.144885, 1, 0.6431373, 0, 1,
-1.288412, -0.2104897, -0.3879945, 1, 0.6470588, 0, 1,
-1.280382, 0.7025043, -0.09881336, 1, 0.654902, 0, 1,
-1.270826, -1.291561, -0.6560357, 1, 0.6588235, 0, 1,
-1.267534, -0.02382402, -1.838001, 1, 0.6666667, 0, 1,
-1.255746, -1.301453, -2.297132, 1, 0.6705883, 0, 1,
-1.254563, -1.668213, -3.78667, 1, 0.6784314, 0, 1,
-1.248539, -0.7548101, -0.9064364, 1, 0.682353, 0, 1,
-1.246184, 0.06444471, -1.472978, 1, 0.6901961, 0, 1,
-1.236937, -1.620332, -2.690757, 1, 0.6941177, 0, 1,
-1.233555, 0.6547493, 1.049638, 1, 0.7019608, 0, 1,
-1.217683, -0.3150719, -2.267983, 1, 0.7098039, 0, 1,
-1.217167, 1.84577, -1.016655, 1, 0.7137255, 0, 1,
-1.206543, -0.2294973, -2.970454, 1, 0.7215686, 0, 1,
-1.20608, 1.354025, -0.3995681, 1, 0.7254902, 0, 1,
-1.20528, 1.176421, 0.8730881, 1, 0.7333333, 0, 1,
-1.181101, 0.4397132, -2.768197, 1, 0.7372549, 0, 1,
-1.179841, 0.2346684, -1.334589, 1, 0.7450981, 0, 1,
-1.175316, 1.246992, -0.5925052, 1, 0.7490196, 0, 1,
-1.174573, 0.2026296, -1.176795, 1, 0.7568628, 0, 1,
-1.166176, -1.161705, -2.399807, 1, 0.7607843, 0, 1,
-1.161783, -1.160983, -3.753928, 1, 0.7686275, 0, 1,
-1.156934, 1.050241, -0.8708432, 1, 0.772549, 0, 1,
-1.156615, 0.6025653, -1.851001, 1, 0.7803922, 0, 1,
-1.149285, -1.459814, -3.092642, 1, 0.7843137, 0, 1,
-1.14858, -1.104553, -3.682731, 1, 0.7921569, 0, 1,
-1.143958, 0.7623942, 0.572102, 1, 0.7960784, 0, 1,
-1.125903, -1.258093, -3.471754, 1, 0.8039216, 0, 1,
-1.121959, -1.409713, -1.965177, 1, 0.8117647, 0, 1,
-1.120958, 0.3951285, -1.343629, 1, 0.8156863, 0, 1,
-1.115493, -0.8503169, -0.8266777, 1, 0.8235294, 0, 1,
-1.11155, 1.499761, 0.5081917, 1, 0.827451, 0, 1,
-1.104941, -0.7694603, -2.644602, 1, 0.8352941, 0, 1,
-1.104725, -0.3632436, -4.124113, 1, 0.8392157, 0, 1,
-1.092376, 0.03868693, -1.588181, 1, 0.8470588, 0, 1,
-1.08803, -0.3871799, -2.609686, 1, 0.8509804, 0, 1,
-1.083855, 0.4544381, -2.673922, 1, 0.8588235, 0, 1,
-1.08055, -0.8020082, -1.688316, 1, 0.8627451, 0, 1,
-1.078134, -0.8224993, -1.206035, 1, 0.8705882, 0, 1,
-1.076323, 0.7777047, 1.070177, 1, 0.8745098, 0, 1,
-1.074596, 2.633289, -0.4116254, 1, 0.8823529, 0, 1,
-1.073454, -0.4266494, -3.036942, 1, 0.8862745, 0, 1,
-1.070887, 0.8677047, -1.614521, 1, 0.8941177, 0, 1,
-1.070797, 0.9688129, -0.4968143, 1, 0.8980392, 0, 1,
-1.068115, 1.428702, -0.6303282, 1, 0.9058824, 0, 1,
-1.061145, 0.8236312, -0.2407765, 1, 0.9137255, 0, 1,
-1.061098, -0.05305179, -2.423021, 1, 0.9176471, 0, 1,
-1.059569, -1.94286, -2.610568, 1, 0.9254902, 0, 1,
-1.058353, -1.083185, -2.813372, 1, 0.9294118, 0, 1,
-1.053325, 0.9213504, -0.4877411, 1, 0.9372549, 0, 1,
-1.052493, 0.2768905, -0.8421198, 1, 0.9411765, 0, 1,
-1.044981, 1.517824, 0.6385828, 1, 0.9490196, 0, 1,
-1.044488, -0.63756, -0.3842513, 1, 0.9529412, 0, 1,
-1.042321, -0.8570097, -3.082959, 1, 0.9607843, 0, 1,
-1.033182, 0.1297487, 0.2891687, 1, 0.9647059, 0, 1,
-1.025691, 0.1861951, -1.312131, 1, 0.972549, 0, 1,
-1.023574, 0.2548335, -1.691662, 1, 0.9764706, 0, 1,
-1.021781, 0.510829, -1.520337, 1, 0.9843137, 0, 1,
-1.021149, -0.203583, -4.052248, 1, 0.9882353, 0, 1,
-1.017166, 0.9848084, 1.067242, 1, 0.9960784, 0, 1,
-1.015984, 1.597303, -0.7852397, 0.9960784, 1, 0, 1,
-1.007211, 0.7668785, -1.157612, 0.9921569, 1, 0, 1,
-1.000991, 0.007708547, -1.679915, 0.9843137, 1, 0, 1,
-0.9954069, -1.001217, -2.182493, 0.9803922, 1, 0, 1,
-0.9821029, 0.8237689, -0.2522405, 0.972549, 1, 0, 1,
-0.9661834, 0.3072649, -1.455066, 0.9686275, 1, 0, 1,
-0.9615732, -0.4363045, -1.93033, 0.9607843, 1, 0, 1,
-0.9615493, 1.329495, -1.329419, 0.9568627, 1, 0, 1,
-0.9586323, 0.05775981, -1.291696, 0.9490196, 1, 0, 1,
-0.9563235, -0.5730441, -3.104695, 0.945098, 1, 0, 1,
-0.9562359, 1.96603, -1.212524, 0.9372549, 1, 0, 1,
-0.9521677, -0.5314088, -1.868881, 0.9333333, 1, 0, 1,
-0.9497413, 1.876636, -1.349073, 0.9254902, 1, 0, 1,
-0.9480016, 1.328184, 0.7202973, 0.9215686, 1, 0, 1,
-0.939189, -0.9834139, -2.099531, 0.9137255, 1, 0, 1,
-0.9390815, -0.2345233, -2.456885, 0.9098039, 1, 0, 1,
-0.932012, -0.1153292, 0.5338713, 0.9019608, 1, 0, 1,
-0.9315242, 0.2545362, -1.893882, 0.8941177, 1, 0, 1,
-0.9227118, 0.5924455, -0.8169199, 0.8901961, 1, 0, 1,
-0.9205024, -0.4946772, -1.10953, 0.8823529, 1, 0, 1,
-0.91501, -0.09981935, -1.935105, 0.8784314, 1, 0, 1,
-0.9099687, -0.3786146, -3.260116, 0.8705882, 1, 0, 1,
-0.9085886, 1.109782, -0.694639, 0.8666667, 1, 0, 1,
-0.9036387, 0.6943013, -1.03051, 0.8588235, 1, 0, 1,
-0.9019259, 0.2184421, -1.425688, 0.854902, 1, 0, 1,
-0.9005992, 0.2332763, -2.373214, 0.8470588, 1, 0, 1,
-0.8955107, -0.09341464, -3.877026, 0.8431373, 1, 0, 1,
-0.8922701, -1.00774, -1.649661, 0.8352941, 1, 0, 1,
-0.8918837, 0.3335728, -0.4433179, 0.8313726, 1, 0, 1,
-0.8909931, -0.8014272, -1.314992, 0.8235294, 1, 0, 1,
-0.8895525, 0.7798358, -0.2608892, 0.8196079, 1, 0, 1,
-0.886617, -0.1946772, -2.221185, 0.8117647, 1, 0, 1,
-0.8798685, 0.2702711, 0.7517794, 0.8078431, 1, 0, 1,
-0.8760842, -1.7861, -5.057994, 0.8, 1, 0, 1,
-0.8735462, 0.2077094, -2.26729, 0.7921569, 1, 0, 1,
-0.8733675, -0.4007881, -2.332235, 0.7882353, 1, 0, 1,
-0.8731446, -0.2950365, -2.458288, 0.7803922, 1, 0, 1,
-0.8724557, 0.5241879, -0.3203297, 0.7764706, 1, 0, 1,
-0.871408, 0.3583191, 0.1821195, 0.7686275, 1, 0, 1,
-0.8685538, 0.9175178, -0.4605401, 0.7647059, 1, 0, 1,
-0.8658535, 1.865446, 0.6367345, 0.7568628, 1, 0, 1,
-0.863342, -0.7454962, -0.1041342, 0.7529412, 1, 0, 1,
-0.8622324, 0.9383447, -0.06654961, 0.7450981, 1, 0, 1,
-0.8588155, -0.4001368, -3.192313, 0.7411765, 1, 0, 1,
-0.8580019, -0.2391247, -2.843422, 0.7333333, 1, 0, 1,
-0.8575335, 0.6877452, -0.483928, 0.7294118, 1, 0, 1,
-0.854504, 0.5835729, -2.097185, 0.7215686, 1, 0, 1,
-0.8497481, 1.32182, -1.158749, 0.7176471, 1, 0, 1,
-0.8452435, -0.6791264, -3.044262, 0.7098039, 1, 0, 1,
-0.8382918, -0.1595062, -2.713835, 0.7058824, 1, 0, 1,
-0.8371087, -0.5147169, -2.587657, 0.6980392, 1, 0, 1,
-0.8366965, 1.081232, -0.7663447, 0.6901961, 1, 0, 1,
-0.831353, 0.5202734, -0.4532256, 0.6862745, 1, 0, 1,
-0.8291675, 0.02427651, -3.345729, 0.6784314, 1, 0, 1,
-0.8234361, -0.329605, -1.892123, 0.6745098, 1, 0, 1,
-0.8197407, 0.4954292, 0.1103706, 0.6666667, 1, 0, 1,
-0.8122565, 1.044882, 1.013311, 0.6627451, 1, 0, 1,
-0.8113599, 0.6284094, -2.307978, 0.654902, 1, 0, 1,
-0.8106878, 1.446445, 0.9126781, 0.6509804, 1, 0, 1,
-0.8062661, 0.08221118, -1.910398, 0.6431373, 1, 0, 1,
-0.8061826, -0.2918717, -3.991199, 0.6392157, 1, 0, 1,
-0.8042477, 0.847501, -1.170108, 0.6313726, 1, 0, 1,
-0.8006218, 0.4816859, -0.1915405, 0.627451, 1, 0, 1,
-0.7911303, 0.2677679, -2.932204, 0.6196079, 1, 0, 1,
-0.7904307, -0.4364848, -2.619834, 0.6156863, 1, 0, 1,
-0.7830907, -0.7648748, -1.485961, 0.6078432, 1, 0, 1,
-0.7799917, -0.4373225, -2.682492, 0.6039216, 1, 0, 1,
-0.778818, 0.490603, 0.2122902, 0.5960785, 1, 0, 1,
-0.7778857, 0.1774131, -0.3826265, 0.5882353, 1, 0, 1,
-0.7742415, 2.932092, -2.788312, 0.5843138, 1, 0, 1,
-0.7727969, 0.4707801, -0.4802462, 0.5764706, 1, 0, 1,
-0.7590897, 1.711535, 0.03759075, 0.572549, 1, 0, 1,
-0.7559809, -1.16539, -3.187481, 0.5647059, 1, 0, 1,
-0.7542338, -0.3142629, -2.786213, 0.5607843, 1, 0, 1,
-0.7435699, -0.6758139, -1.992035, 0.5529412, 1, 0, 1,
-0.7365505, 0.3929217, -1.664419, 0.5490196, 1, 0, 1,
-0.7304661, 0.7306941, -1.05804, 0.5411765, 1, 0, 1,
-0.7264531, 1.560365, 0.1532844, 0.5372549, 1, 0, 1,
-0.7264014, -2.198499, -2.134672, 0.5294118, 1, 0, 1,
-0.7226271, -0.06768673, -2.159511, 0.5254902, 1, 0, 1,
-0.7139727, 0.2912903, -1.008894, 0.5176471, 1, 0, 1,
-0.7105268, 1.65667, 0.9155116, 0.5137255, 1, 0, 1,
-0.7094364, -0.08388665, -3.034835, 0.5058824, 1, 0, 1,
-0.7028735, 0.1339519, -2.215353, 0.5019608, 1, 0, 1,
-0.7020277, -1.082217, -2.619171, 0.4941176, 1, 0, 1,
-0.7019945, -0.03086463, -0.02592714, 0.4862745, 1, 0, 1,
-0.7009345, 0.644067, -1.290374, 0.4823529, 1, 0, 1,
-0.6970529, 1.06709, -1.844341, 0.4745098, 1, 0, 1,
-0.6920505, -0.2301001, -2.003866, 0.4705882, 1, 0, 1,
-0.6883502, 0.5356846, -2.038482, 0.4627451, 1, 0, 1,
-0.6865246, -1.585463, -2.865676, 0.4588235, 1, 0, 1,
-0.6858897, -0.5025626, -1.35858, 0.4509804, 1, 0, 1,
-0.685717, 0.6748068, -0.954562, 0.4470588, 1, 0, 1,
-0.6850022, 0.9077576, -1.735139, 0.4392157, 1, 0, 1,
-0.6832964, 2.177308, 0.6631995, 0.4352941, 1, 0, 1,
-0.6772361, -0.005895937, -0.8301462, 0.427451, 1, 0, 1,
-0.6697861, 0.8590422, -3.184422, 0.4235294, 1, 0, 1,
-0.6695649, 2.170654, 0.6758702, 0.4156863, 1, 0, 1,
-0.6661468, 1.085004, -0.7259023, 0.4117647, 1, 0, 1,
-0.6637825, 1.339607, -0.0393117, 0.4039216, 1, 0, 1,
-0.6598235, 0.1161492, -2.900758, 0.3960784, 1, 0, 1,
-0.659491, 0.7045883, -1.807805, 0.3921569, 1, 0, 1,
-0.6557123, -0.5474229, -1.517776, 0.3843137, 1, 0, 1,
-0.6546648, -0.8630311, -4.441431, 0.3803922, 1, 0, 1,
-0.646226, 0.1389465, 1.648748, 0.372549, 1, 0, 1,
-0.6460385, 1.370618, -2.038337, 0.3686275, 1, 0, 1,
-0.6446772, 1.263405, -1.479767, 0.3607843, 1, 0, 1,
-0.6443337, 0.5009547, -0.9610091, 0.3568628, 1, 0, 1,
-0.6409883, -1.333112, -1.075641, 0.3490196, 1, 0, 1,
-0.6383232, 2.107641, 0.1679729, 0.345098, 1, 0, 1,
-0.6382565, 0.2708192, -0.6441419, 0.3372549, 1, 0, 1,
-0.6358154, -1.067405, -2.427078, 0.3333333, 1, 0, 1,
-0.6346866, 0.1077192, -2.49037, 0.3254902, 1, 0, 1,
-0.6288446, 1.175139, -1.161256, 0.3215686, 1, 0, 1,
-0.626467, -2.024557, -2.072186, 0.3137255, 1, 0, 1,
-0.625903, -0.08597776, -0.2913976, 0.3098039, 1, 0, 1,
-0.6176902, -0.4798193, -2.187129, 0.3019608, 1, 0, 1,
-0.6154534, -0.4884127, -3.714763, 0.2941177, 1, 0, 1,
-0.6133419, 0.4433944, 0.4310087, 0.2901961, 1, 0, 1,
-0.6093778, 0.09695144, -1.340234, 0.282353, 1, 0, 1,
-0.6068618, 0.4805436, -1.281382, 0.2784314, 1, 0, 1,
-0.6030481, -1.013333, -2.766437, 0.2705882, 1, 0, 1,
-0.6004673, 1.14729, -1.07348, 0.2666667, 1, 0, 1,
-0.5972941, -0.9797706, -2.251347, 0.2588235, 1, 0, 1,
-0.5951737, -1.166827, -2.743767, 0.254902, 1, 0, 1,
-0.5885565, -0.3365836, -3.354215, 0.2470588, 1, 0, 1,
-0.5831794, -0.2036632, -3.075968, 0.2431373, 1, 0, 1,
-0.580998, 0.08694886, -1.099619, 0.2352941, 1, 0, 1,
-0.5808834, -0.6639078, -3.346046, 0.2313726, 1, 0, 1,
-0.5769929, 0.8327064, -1.598228, 0.2235294, 1, 0, 1,
-0.5739524, -0.08420538, -2.562659, 0.2196078, 1, 0, 1,
-0.5738808, -0.193399, -2.18057, 0.2117647, 1, 0, 1,
-0.5708353, 0.5554723, -2.010154, 0.2078431, 1, 0, 1,
-0.5645168, 0.4821063, -1.288058, 0.2, 1, 0, 1,
-0.5625815, 2.253045, -0.03085544, 0.1921569, 1, 0, 1,
-0.560987, 1.401127, 1.234948, 0.1882353, 1, 0, 1,
-0.5531766, -1.326432, -3.411136, 0.1803922, 1, 0, 1,
-0.5530409, -0.3475007, -1.138034, 0.1764706, 1, 0, 1,
-0.547163, -1.625097, -1.722064, 0.1686275, 1, 0, 1,
-0.5461318, 0.7646349, 0.6056937, 0.1647059, 1, 0, 1,
-0.5377719, 1.266052, 0.8769091, 0.1568628, 1, 0, 1,
-0.5331132, 2.905985, -0.04798732, 0.1529412, 1, 0, 1,
-0.5227833, -1.326853, -2.549229, 0.145098, 1, 0, 1,
-0.5148915, 0.5340712, -1.221098, 0.1411765, 1, 0, 1,
-0.513994, -0.9988719, -2.703776, 0.1333333, 1, 0, 1,
-0.511703, -0.1133451, -3.369279, 0.1294118, 1, 0, 1,
-0.5108843, 0.8068382, -0.7292708, 0.1215686, 1, 0, 1,
-0.5100308, -1.154442, -2.243552, 0.1176471, 1, 0, 1,
-0.5098511, -3.479418, -1.433118, 0.1098039, 1, 0, 1,
-0.5085167, 0.3902336, -0.8456948, 0.1058824, 1, 0, 1,
-0.5061637, -0.5871198, -2.875641, 0.09803922, 1, 0, 1,
-0.5044773, 0.5003092, -1.258377, 0.09019608, 1, 0, 1,
-0.5036808, -0.3915827, -2.541217, 0.08627451, 1, 0, 1,
-0.5026585, -2.374311, -3.819501, 0.07843138, 1, 0, 1,
-0.4969315, 1.43548, -1.311601, 0.07450981, 1, 0, 1,
-0.4951086, 0.2792708, -0.8138942, 0.06666667, 1, 0, 1,
-0.4948829, -1.435734, -4.175216, 0.0627451, 1, 0, 1,
-0.494212, 0.2268285, -2.87411, 0.05490196, 1, 0, 1,
-0.4843739, -1.178426, -3.421396, 0.05098039, 1, 0, 1,
-0.4828289, 1.474872, -0.3753629, 0.04313726, 1, 0, 1,
-0.4816594, 0.6396059, -1.976981, 0.03921569, 1, 0, 1,
-0.4815, -0.7556726, -1.182925, 0.03137255, 1, 0, 1,
-0.4801928, -0.6291459, -2.056854, 0.02745098, 1, 0, 1,
-0.479671, 0.2123393, -0.7615104, 0.01960784, 1, 0, 1,
-0.4766622, -0.3249785, -1.825239, 0.01568628, 1, 0, 1,
-0.4672677, 0.2000483, -2.108979, 0.007843138, 1, 0, 1,
-0.4663678, -0.1891651, -0.7563766, 0.003921569, 1, 0, 1,
-0.461174, 0.4671441, 0.6452768, 0, 1, 0.003921569, 1,
-0.4604225, -1.939502, -4.680203, 0, 1, 0.01176471, 1,
-0.4602631, -1.023538, -2.295202, 0, 1, 0.01568628, 1,
-0.4589943, 0.3607126, -0.3309772, 0, 1, 0.02352941, 1,
-0.4582169, -0.6087305, -1.537226, 0, 1, 0.02745098, 1,
-0.456757, 0.02507334, -1.064526, 0, 1, 0.03529412, 1,
-0.4536423, -1.111619, -1.537482, 0, 1, 0.03921569, 1,
-0.4525365, -1.082554, -0.9834034, 0, 1, 0.04705882, 1,
-0.4500223, -0.4080674, -3.781232, 0, 1, 0.05098039, 1,
-0.447613, -0.50751, -2.451478, 0, 1, 0.05882353, 1,
-0.4473326, 0.1759558, -1.51873, 0, 1, 0.0627451, 1,
-0.4466167, -1.239282, -4.087316, 0, 1, 0.07058824, 1,
-0.4459696, -0.1969927, -0.31196, 0, 1, 0.07450981, 1,
-0.4419688, -0.6842171, -4.034375, 0, 1, 0.08235294, 1,
-0.4361281, 0.7770296, -1.590851, 0, 1, 0.08627451, 1,
-0.4339444, -0.5712983, -1.719391, 0, 1, 0.09411765, 1,
-0.4298882, -0.1147896, -2.437894, 0, 1, 0.1019608, 1,
-0.4288971, 0.03387925, -1.669003, 0, 1, 0.1058824, 1,
-0.4284775, 1.577205, -2.014576, 0, 1, 0.1137255, 1,
-0.4256635, -1.612695, -2.389886, 0, 1, 0.1176471, 1,
-0.4211491, -0.8249975, -2.962075, 0, 1, 0.1254902, 1,
-0.4195843, 0.4256725, -0.5216085, 0, 1, 0.1294118, 1,
-0.4146242, 0.4801039, -0.6984975, 0, 1, 0.1372549, 1,
-0.4091849, 0.9968554, -2.047075, 0, 1, 0.1411765, 1,
-0.4087349, -0.9127133, -1.966463, 0, 1, 0.1490196, 1,
-0.403299, -0.8935658, -2.948629, 0, 1, 0.1529412, 1,
-0.4005204, -1.384219, -1.764457, 0, 1, 0.1607843, 1,
-0.3991326, 0.235057, 0.3933724, 0, 1, 0.1647059, 1,
-0.3980581, -0.177596, -4.25707, 0, 1, 0.172549, 1,
-0.3918579, 0.2253259, -0.2180729, 0, 1, 0.1764706, 1,
-0.3891237, 0.3144636, -1.923802, 0, 1, 0.1843137, 1,
-0.3876908, 0.4254741, 1.19434, 0, 1, 0.1882353, 1,
-0.385248, 0.2450593, -0.9127197, 0, 1, 0.1960784, 1,
-0.3847714, 2.254387, -0.07965902, 0, 1, 0.2039216, 1,
-0.3831728, -0.7298495, -4.291622, 0, 1, 0.2078431, 1,
-0.3812556, 0.06748737, -1.820639, 0, 1, 0.2156863, 1,
-0.3758917, 1.536131, 0.6431812, 0, 1, 0.2196078, 1,
-0.3730817, 0.1352212, -1.429852, 0, 1, 0.227451, 1,
-0.369902, -0.3278274, -1.877481, 0, 1, 0.2313726, 1,
-0.3646762, -0.1174651, -0.3228886, 0, 1, 0.2392157, 1,
-0.3623191, -0.7180746, -4.20507, 0, 1, 0.2431373, 1,
-0.3614832, -0.7867317, -1.887982, 0, 1, 0.2509804, 1,
-0.3559237, -0.323798, -1.470477, 0, 1, 0.254902, 1,
-0.3536485, -0.6418549, -2.02931, 0, 1, 0.2627451, 1,
-0.3522047, -0.4378478, -1.708758, 0, 1, 0.2666667, 1,
-0.3477798, 0.7189594, -1.728079, 0, 1, 0.2745098, 1,
-0.3457128, -0.9875442, -2.409317, 0, 1, 0.2784314, 1,
-0.3444578, 0.1345017, -1.102804, 0, 1, 0.2862745, 1,
-0.3439222, 1.015005, 1.337787, 0, 1, 0.2901961, 1,
-0.341082, -0.356356, -2.471277, 0, 1, 0.2980392, 1,
-0.3395251, 0.6319574, -1.77918, 0, 1, 0.3058824, 1,
-0.3371931, -0.7131042, -2.835912, 0, 1, 0.3098039, 1,
-0.3370647, 1.131019, -0.2660861, 0, 1, 0.3176471, 1,
-0.3326926, -1.588025, -4.790566, 0, 1, 0.3215686, 1,
-0.3296817, 0.03405364, -0.8260234, 0, 1, 0.3294118, 1,
-0.3159366, 1.152346, 0.3249053, 0, 1, 0.3333333, 1,
-0.3076524, -0.1031577, -0.1430972, 0, 1, 0.3411765, 1,
-0.3066089, 0.1414495, -0.455579, 0, 1, 0.345098, 1,
-0.3059018, -2.054286, -2.675485, 0, 1, 0.3529412, 1,
-0.3047023, -1.903305, -2.140819, 0, 1, 0.3568628, 1,
-0.3011224, -0.5866337, -3.677362, 0, 1, 0.3647059, 1,
-0.2983214, -0.5319926, -1.202286, 0, 1, 0.3686275, 1,
-0.2962797, -0.4734054, -1.608766, 0, 1, 0.3764706, 1,
-0.2944164, -0.01412903, -1.61625, 0, 1, 0.3803922, 1,
-0.2928126, -1.712948, -2.825073, 0, 1, 0.3882353, 1,
-0.2908201, -0.9454488, -1.76514, 0, 1, 0.3921569, 1,
-0.288311, -0.4115634, -2.763933, 0, 1, 0.4, 1,
-0.283042, 0.380579, -1.29987, 0, 1, 0.4078431, 1,
-0.281774, -0.797206, -5.278379, 0, 1, 0.4117647, 1,
-0.2724784, 1.099126, -0.9359409, 0, 1, 0.4196078, 1,
-0.2719665, 0.002679468, -0.9285206, 0, 1, 0.4235294, 1,
-0.2706072, -1.174767, -3.279182, 0, 1, 0.4313726, 1,
-0.2591691, 1.144809, -0.9524571, 0, 1, 0.4352941, 1,
-0.2573485, -0.08770697, -1.728496, 0, 1, 0.4431373, 1,
-0.2556538, 0.2613018, -1.766462, 0, 1, 0.4470588, 1,
-0.2550269, 2.046161, -0.5737677, 0, 1, 0.454902, 1,
-0.2546495, -0.1651503, -3.483277, 0, 1, 0.4588235, 1,
-0.2543307, -0.3473212, -1.798902, 0, 1, 0.4666667, 1,
-0.2463208, 0.180737, -0.4803528, 0, 1, 0.4705882, 1,
-0.246035, -0.5824558, -2.211024, 0, 1, 0.4784314, 1,
-0.2459519, 0.08380159, -1.036646, 0, 1, 0.4823529, 1,
-0.2449976, 1.683533, -0.3697108, 0, 1, 0.4901961, 1,
-0.2417821, -0.5660305, -2.149261, 0, 1, 0.4941176, 1,
-0.2385458, -1.949677, -3.010605, 0, 1, 0.5019608, 1,
-0.2385027, -0.7684905, -3.905355, 0, 1, 0.509804, 1,
-0.2359914, 0.1331162, -0.423228, 0, 1, 0.5137255, 1,
-0.2321483, -0.8098047, -4.762597, 0, 1, 0.5215687, 1,
-0.2305375, 0.4978647, -0.4526633, 0, 1, 0.5254902, 1,
-0.2300023, -0.8522336, -0.8440502, 0, 1, 0.5333334, 1,
-0.2175795, -0.1829029, -2.24655, 0, 1, 0.5372549, 1,
-0.2167609, -1.01363, -2.619291, 0, 1, 0.5450981, 1,
-0.2163535, -0.6674073, -2.631016, 0, 1, 0.5490196, 1,
-0.2132963, -0.2324746, -1.295094, 0, 1, 0.5568628, 1,
-0.2123344, 1.272013, -0.07815247, 0, 1, 0.5607843, 1,
-0.210032, 1.941675, -0.2765133, 0, 1, 0.5686275, 1,
-0.2082522, -0.5120177, -2.355654, 0, 1, 0.572549, 1,
-0.2062556, -1.574967, -3.296525, 0, 1, 0.5803922, 1,
-0.2058023, -1.196647, -2.903047, 0, 1, 0.5843138, 1,
-0.2013029, 0.5618824, 0.4877973, 0, 1, 0.5921569, 1,
-0.1964178, 1.691531, 0.4356643, 0, 1, 0.5960785, 1,
-0.1963703, -1.55169, -3.293918, 0, 1, 0.6039216, 1,
-0.1948192, 1.508521, -1.43133, 0, 1, 0.6117647, 1,
-0.1943863, 1.446472, 0.1028911, 0, 1, 0.6156863, 1,
-0.1918949, -0.5132023, -3.146108, 0, 1, 0.6235294, 1,
-0.1913521, 0.6848685, -0.6659202, 0, 1, 0.627451, 1,
-0.189386, -0.1423211, -2.980172, 0, 1, 0.6352941, 1,
-0.1853027, -0.9742334, -3.463352, 0, 1, 0.6392157, 1,
-0.1848524, -0.3925513, -1.327932, 0, 1, 0.6470588, 1,
-0.1843462, -0.9134921, -1.790432, 0, 1, 0.6509804, 1,
-0.183704, 0.4630133, -1.442216, 0, 1, 0.6588235, 1,
-0.1785332, 1.796291, 0.8573206, 0, 1, 0.6627451, 1,
-0.1784609, -0.5560807, -3.293067, 0, 1, 0.6705883, 1,
-0.1747259, 0.1639102, -0.7631519, 0, 1, 0.6745098, 1,
-0.1715901, -0.6445275, -3.645195, 0, 1, 0.682353, 1,
-0.1703054, 0.5203109, 0.3059723, 0, 1, 0.6862745, 1,
-0.1686854, -0.5954418, -3.138017, 0, 1, 0.6941177, 1,
-0.1664907, -0.8219793, -2.905871, 0, 1, 0.7019608, 1,
-0.1634967, 1.043966, -2.260739, 0, 1, 0.7058824, 1,
-0.1595453, -0.1773262, -0.953427, 0, 1, 0.7137255, 1,
-0.1575848, -0.2818434, -1.705975, 0, 1, 0.7176471, 1,
-0.1556059, 0.0531195, -1.902102, 0, 1, 0.7254902, 1,
-0.1555032, -1.046976, -4.42543, 0, 1, 0.7294118, 1,
-0.1529769, 0.02438504, -0.2474551, 0, 1, 0.7372549, 1,
-0.1499402, 0.1632886, -2.222068, 0, 1, 0.7411765, 1,
-0.1429539, -0.6278399, -4.75244, 0, 1, 0.7490196, 1,
-0.1425511, -0.1158255, -1.163431, 0, 1, 0.7529412, 1,
-0.1401952, -0.07996675, -1.869285, 0, 1, 0.7607843, 1,
-0.133736, 0.7703124, 0.7831578, 0, 1, 0.7647059, 1,
-0.1269969, 0.6333284, -0.1576758, 0, 1, 0.772549, 1,
-0.1263818, -0.9502547, -1.942245, 0, 1, 0.7764706, 1,
-0.126307, 0.5819693, -0.8563591, 0, 1, 0.7843137, 1,
-0.1243168, 1.416059, -0.4871528, 0, 1, 0.7882353, 1,
-0.1225919, 1.202925, -0.05006021, 0, 1, 0.7960784, 1,
-0.120953, -1.296022, -2.329025, 0, 1, 0.8039216, 1,
-0.1201514, -0.5576063, -2.385163, 0, 1, 0.8078431, 1,
-0.1194216, -0.0439479, -2.489362, 0, 1, 0.8156863, 1,
-0.1172047, -0.5064474, -0.9888212, 0, 1, 0.8196079, 1,
-0.1106451, 1.537357, 0.2340859, 0, 1, 0.827451, 1,
-0.103856, -1.370747, -2.009878, 0, 1, 0.8313726, 1,
-0.1018946, 0.5393886, -0.136908, 0, 1, 0.8392157, 1,
-0.1015121, -0.9362286, -2.789121, 0, 1, 0.8431373, 1,
-0.09723759, -0.7586225, -2.00517, 0, 1, 0.8509804, 1,
-0.09679201, 0.04909103, -2.117821, 0, 1, 0.854902, 1,
-0.09440654, 1.255569, -0.4648158, 0, 1, 0.8627451, 1,
-0.09247318, -0.3309224, -1.866659, 0, 1, 0.8666667, 1,
-0.08521001, 0.05852924, -0.2473626, 0, 1, 0.8745098, 1,
-0.07783814, -1.369156, -4.384269, 0, 1, 0.8784314, 1,
-0.07579786, 1.094677, -0.425775, 0, 1, 0.8862745, 1,
-0.07577204, -0.8889692, -5.365479, 0, 1, 0.8901961, 1,
-0.06578743, -2.287971, -3.574044, 0, 1, 0.8980392, 1,
-0.06446967, 0.5796461, 0.2093387, 0, 1, 0.9058824, 1,
-0.06252505, 0.5531163, -0.152966, 0, 1, 0.9098039, 1,
-0.06178368, 2.194739, 0.988601, 0, 1, 0.9176471, 1,
-0.05666313, 1.902492, 0.5625516, 0, 1, 0.9215686, 1,
-0.05580178, -0.4944811, -4.851973, 0, 1, 0.9294118, 1,
-0.05317675, -0.2799816, -3.330266, 0, 1, 0.9333333, 1,
-0.05059114, -0.4161578, -1.63989, 0, 1, 0.9411765, 1,
-0.04973582, 0.1181568, -0.7898703, 0, 1, 0.945098, 1,
-0.0393314, -0.04443716, -3.428792, 0, 1, 0.9529412, 1,
-0.03469792, -1.467824, -3.463439, 0, 1, 0.9568627, 1,
-0.03194768, 0.02234801, -1.694794, 0, 1, 0.9647059, 1,
-0.02964812, 0.7593321, 0.205484, 0, 1, 0.9686275, 1,
-0.02909678, -0.2633105, -2.818256, 0, 1, 0.9764706, 1,
-0.02648243, 0.08226158, -1.154246, 0, 1, 0.9803922, 1,
-0.02629786, -1.60745, -3.046894, 0, 1, 0.9882353, 1,
-0.02244909, 1.42651, -0.4003852, 0, 1, 0.9921569, 1,
-0.02073068, 0.4931806, -0.03587035, 0, 1, 1, 1,
-0.01953506, -0.7523776, -2.933979, 0, 0.9921569, 1, 1,
-0.01943748, -0.6898754, -1.145285, 0, 0.9882353, 1, 1,
-0.01753723, 0.009679937, -0.7712823, 0, 0.9803922, 1, 1,
-0.01667364, 0.1788322, 1.300428, 0, 0.9764706, 1, 1,
-0.01654889, -0.3234704, -4.94946, 0, 0.9686275, 1, 1,
-0.01531348, -0.605554, -5.635303, 0, 0.9647059, 1, 1,
-0.01241553, 1.08295, -2.086741, 0, 0.9568627, 1, 1,
-0.01189097, 0.6796909, -1.368193, 0, 0.9529412, 1, 1,
-0.00100182, 1.068317, 1.38107, 0, 0.945098, 1, 1,
-0.0005360513, 1.018451, 1.39305, 0, 0.9411765, 1, 1,
0.003696309, 0.7242458, -0.9941967, 0, 0.9333333, 1, 1,
0.008774293, 1.066919, 0.1349641, 0, 0.9294118, 1, 1,
0.01541956, 0.9643943, -0.5967273, 0, 0.9215686, 1, 1,
0.01636144, -1.111912, 3.666648, 0, 0.9176471, 1, 1,
0.01778824, -0.1528822, 2.248862, 0, 0.9098039, 1, 1,
0.02049125, -0.252029, 2.939984, 0, 0.9058824, 1, 1,
0.02086601, -1.136172, 2.79834, 0, 0.8980392, 1, 1,
0.02174211, 0.2938812, 0.7646267, 0, 0.8901961, 1, 1,
0.02255051, -0.7413543, 3.964787, 0, 0.8862745, 1, 1,
0.02670425, -2.149589, 3.003757, 0, 0.8784314, 1, 1,
0.02690502, -0.7411484, 3.554559, 0, 0.8745098, 1, 1,
0.0295363, 0.1794478, 1.670493, 0, 0.8666667, 1, 1,
0.02967267, 2.183247, -1.507084, 0, 0.8627451, 1, 1,
0.03242096, 0.624684, 0.7350044, 0, 0.854902, 1, 1,
0.03302401, 1.05817, -0.2065987, 0, 0.8509804, 1, 1,
0.03919337, -0.1331463, 2.644614, 0, 0.8431373, 1, 1,
0.04151605, 0.5781698, -0.2525254, 0, 0.8392157, 1, 1,
0.04152394, 0.9470622, 0.4273866, 0, 0.8313726, 1, 1,
0.04557125, -1.921682, 2.148966, 0, 0.827451, 1, 1,
0.04562705, -0.6100653, 2.694904, 0, 0.8196079, 1, 1,
0.04607577, 1.153251, 0.7636223, 0, 0.8156863, 1, 1,
0.0491211, 0.5227305, 0.2486441, 0, 0.8078431, 1, 1,
0.04922126, -0.5916492, 6.390853, 0, 0.8039216, 1, 1,
0.05098674, 1.102818, -0.05913495, 0, 0.7960784, 1, 1,
0.05124435, -1.103686, 3.436155, 0, 0.7882353, 1, 1,
0.05270341, 0.3020259, 0.4239733, 0, 0.7843137, 1, 1,
0.06258854, -0.4384938, 2.614949, 0, 0.7764706, 1, 1,
0.06302851, 0.2895163, 1.429151, 0, 0.772549, 1, 1,
0.06724211, 0.08448634, 0.1184765, 0, 0.7647059, 1, 1,
0.07448731, 2.19839, -0.8249022, 0, 0.7607843, 1, 1,
0.07511689, -0.3612027, 2.837962, 0, 0.7529412, 1, 1,
0.07887089, -0.3613328, 2.39615, 0, 0.7490196, 1, 1,
0.07974975, -1.013932, 2.617003, 0, 0.7411765, 1, 1,
0.08091076, -1.689954, 4.529451, 0, 0.7372549, 1, 1,
0.09023627, -1.193493, 2.537111, 0, 0.7294118, 1, 1,
0.0909489, 0.2066454, 0.2856892, 0, 0.7254902, 1, 1,
0.09121714, 0.7222228, -1.280641, 0, 0.7176471, 1, 1,
0.09657915, 0.09273952, 1.45313, 0, 0.7137255, 1, 1,
0.09707859, 0.1074555, 0.4773131, 0, 0.7058824, 1, 1,
0.09739609, -0.6976228, 2.474265, 0, 0.6980392, 1, 1,
0.1000342, 1.148816, 1.314716, 0, 0.6941177, 1, 1,
0.1001391, 0.5518854, -1.292255, 0, 0.6862745, 1, 1,
0.1010073, -1.605618, 2.018017, 0, 0.682353, 1, 1,
0.1033743, -1.477399, 3.758217, 0, 0.6745098, 1, 1,
0.1041568, -0.354614, 4.19783, 0, 0.6705883, 1, 1,
0.1057787, -0.3785815, 4.131893, 0, 0.6627451, 1, 1,
0.1072839, 0.9355327, -0.1658064, 0, 0.6588235, 1, 1,
0.111967, -1.060474, 2.909458, 0, 0.6509804, 1, 1,
0.1167411, 1.34961, 0.09525076, 0, 0.6470588, 1, 1,
0.1185723, 0.1982087, 0.1094226, 0, 0.6392157, 1, 1,
0.1253865, 0.768937, -1.82308, 0, 0.6352941, 1, 1,
0.1281428, 0.1264776, 1.739054, 0, 0.627451, 1, 1,
0.1307968, -0.1681483, 2.873258, 0, 0.6235294, 1, 1,
0.1313168, -1.774692, 4.876456, 0, 0.6156863, 1, 1,
0.131679, 0.8931353, 1.171651, 0, 0.6117647, 1, 1,
0.1361154, -1.528242, 2.563146, 0, 0.6039216, 1, 1,
0.1406182, -0.6814582, 3.049659, 0, 0.5960785, 1, 1,
0.1426234, -1.280189, 3.204355, 0, 0.5921569, 1, 1,
0.1545222, 3.28053, -1.403996, 0, 0.5843138, 1, 1,
0.1587616, 1.535279, -0.2609776, 0, 0.5803922, 1, 1,
0.1589324, -0.2424019, 2.871838, 0, 0.572549, 1, 1,
0.1613487, 0.494316, 0.1372014, 0, 0.5686275, 1, 1,
0.1650263, 0.3271778, -2.758804, 0, 0.5607843, 1, 1,
0.1674443, 0.1477782, -0.7745944, 0, 0.5568628, 1, 1,
0.1767538, 1.401317, 1.540946, 0, 0.5490196, 1, 1,
0.1780476, -2.032754, 0.7785401, 0, 0.5450981, 1, 1,
0.180715, 1.239496, 0.3585658, 0, 0.5372549, 1, 1,
0.1816116, 0.1546564, 0.4705351, 0, 0.5333334, 1, 1,
0.1817318, 2.57007, -0.1140105, 0, 0.5254902, 1, 1,
0.1834034, -0.5562291, 2.459384, 0, 0.5215687, 1, 1,
0.183675, -1.391123, 2.481229, 0, 0.5137255, 1, 1,
0.1839902, -1.597382, 3.455156, 0, 0.509804, 1, 1,
0.1871374, 2.173564, 0.8510289, 0, 0.5019608, 1, 1,
0.1873833, -0.2263188, 1.774531, 0, 0.4941176, 1, 1,
0.1912725, 1.923778, 0.8478668, 0, 0.4901961, 1, 1,
0.1913734, -0.5957121, 2.127163, 0, 0.4823529, 1, 1,
0.1923694, -0.3204129, 2.190452, 0, 0.4784314, 1, 1,
0.1993903, 0.4489582, 1.040127, 0, 0.4705882, 1, 1,
0.2044742, -0.8088619, 2.978045, 0, 0.4666667, 1, 1,
0.2045468, 0.1713434, 0.4414109, 0, 0.4588235, 1, 1,
0.2050767, 1.762502, 1.036217, 0, 0.454902, 1, 1,
0.2101051, -0.634127, 2.651655, 0, 0.4470588, 1, 1,
0.2106977, -0.08277529, 3.417969, 0, 0.4431373, 1, 1,
0.2145451, 1.637877, -0.5785974, 0, 0.4352941, 1, 1,
0.215117, -1.713024, 2.964462, 0, 0.4313726, 1, 1,
0.2181988, -1.578205, 2.26593, 0, 0.4235294, 1, 1,
0.220204, -0.6531261, 1.815554, 0, 0.4196078, 1, 1,
0.2227235, -1.03238, 1.687574, 0, 0.4117647, 1, 1,
0.2263826, 0.126217, 0.8311632, 0, 0.4078431, 1, 1,
0.2266241, -0.2677891, 3.522931, 0, 0.4, 1, 1,
0.2375872, -0.8429763, 3.121148, 0, 0.3921569, 1, 1,
0.2408297, -0.6493755, 3.792818, 0, 0.3882353, 1, 1,
0.2446204, -1.495168, 5.510552, 0, 0.3803922, 1, 1,
0.2455704, -0.2849587, 2.897784, 0, 0.3764706, 1, 1,
0.2461132, 0.6709576, 0.07523514, 0, 0.3686275, 1, 1,
0.2473547, -0.14322, 4.645306, 0, 0.3647059, 1, 1,
0.2609631, 0.2198918, -0.5176257, 0, 0.3568628, 1, 1,
0.2702154, 0.1045257, -0.8309786, 0, 0.3529412, 1, 1,
0.2723828, -0.4391054, 1.712344, 0, 0.345098, 1, 1,
0.2756006, 0.8492693, 0.1770246, 0, 0.3411765, 1, 1,
0.2809937, 0.7199022, 0.1044548, 0, 0.3333333, 1, 1,
0.2811285, 0.7493021, -0.0970532, 0, 0.3294118, 1, 1,
0.291055, 0.7023094, 0.6039741, 0, 0.3215686, 1, 1,
0.2921132, 0.4528058, 0.6087059, 0, 0.3176471, 1, 1,
0.2945073, -0.1041107, 1.410437, 0, 0.3098039, 1, 1,
0.2991402, -1.757186, 3.102934, 0, 0.3058824, 1, 1,
0.2992629, 0.1558237, 2.156727, 0, 0.2980392, 1, 1,
0.2998355, -0.1136141, 2.075827, 0, 0.2901961, 1, 1,
0.3028867, 0.1158229, 0.3757659, 0, 0.2862745, 1, 1,
0.3036659, -0.5811317, 1.074909, 0, 0.2784314, 1, 1,
0.3088974, 0.2068294, -0.3812898, 0, 0.2745098, 1, 1,
0.3106171, 0.5450222, 1.354183, 0, 0.2666667, 1, 1,
0.3120831, 0.5560044, 0.6130672, 0, 0.2627451, 1, 1,
0.3124783, -0.230746, 1.127745, 0, 0.254902, 1, 1,
0.3151217, -1.031326, 3.29742, 0, 0.2509804, 1, 1,
0.3215726, 0.9722776, 0.8970102, 0, 0.2431373, 1, 1,
0.3225797, -0.8534901, 2.711918, 0, 0.2392157, 1, 1,
0.3232231, -1.924873, 2.046138, 0, 0.2313726, 1, 1,
0.3239987, 0.04297813, 0.7998466, 0, 0.227451, 1, 1,
0.32479, 0.1189489, 1.995852, 0, 0.2196078, 1, 1,
0.3251163, -0.4451431, 1.366157, 0, 0.2156863, 1, 1,
0.3267344, 0.2082803, -0.1551007, 0, 0.2078431, 1, 1,
0.3278812, -1.310724, 4.478312, 0, 0.2039216, 1, 1,
0.3284582, -0.2840722, 1.824328, 0, 0.1960784, 1, 1,
0.3328197, -0.8234729, 2.96644, 0, 0.1882353, 1, 1,
0.3387628, -0.3822077, 2.547119, 0, 0.1843137, 1, 1,
0.3462476, -0.2004342, 3.899905, 0, 0.1764706, 1, 1,
0.3464818, 0.475397, -1.046685, 0, 0.172549, 1, 1,
0.3510625, -0.9600272, 3.527691, 0, 0.1647059, 1, 1,
0.3554906, 0.4479254, 0.942482, 0, 0.1607843, 1, 1,
0.3589162, -0.418518, 1.607259, 0, 0.1529412, 1, 1,
0.3625871, 0.6100292, -0.4752669, 0, 0.1490196, 1, 1,
0.3656841, -0.2754808, 2.609137, 0, 0.1411765, 1, 1,
0.3672833, -0.5021055, 3.244582, 0, 0.1372549, 1, 1,
0.3686959, -0.1447712, 2.086932, 0, 0.1294118, 1, 1,
0.3734867, 0.2474657, 1.388496, 0, 0.1254902, 1, 1,
0.3761096, 0.7721109, 0.5752162, 0, 0.1176471, 1, 1,
0.377234, -0.7749755, 4.182578, 0, 0.1137255, 1, 1,
0.3883429, -1.641778, 2.800053, 0, 0.1058824, 1, 1,
0.3932188, -1.292629, 2.194371, 0, 0.09803922, 1, 1,
0.4000688, -1.945772, 2.670383, 0, 0.09411765, 1, 1,
0.4025079, -1.184751, 3.99312, 0, 0.08627451, 1, 1,
0.4038357, 0.2023583, 1.268737, 0, 0.08235294, 1, 1,
0.4054457, -1.628678, 2.057491, 0, 0.07450981, 1, 1,
0.4062473, -0.7870622, 3.061043, 0, 0.07058824, 1, 1,
0.4118734, -0.6457707, -0.04406372, 0, 0.0627451, 1, 1,
0.4132328, -0.5389663, 2.07134, 0, 0.05882353, 1, 1,
0.4155659, 0.5428838, -0.1144864, 0, 0.05098039, 1, 1,
0.4167721, 0.07911373, 2.264659, 0, 0.04705882, 1, 1,
0.426695, 0.5681856, 0.9196208, 0, 0.03921569, 1, 1,
0.427115, 1.750557, 0.7274606, 0, 0.03529412, 1, 1,
0.435114, -0.7225347, 2.987583, 0, 0.02745098, 1, 1,
0.4383274, 1.866066, -0.1727757, 0, 0.02352941, 1, 1,
0.440933, 0.1023301, 1.817549, 0, 0.01568628, 1, 1,
0.4485272, 0.7693639, 0.615512, 0, 0.01176471, 1, 1,
0.4505554, 0.5875633, 1.768487, 0, 0.003921569, 1, 1,
0.4531632, -1.110386, 2.698838, 0.003921569, 0, 1, 1,
0.4540754, 2.075485, -0.6160178, 0.007843138, 0, 1, 1,
0.4554837, 1.683579, 0.2658279, 0.01568628, 0, 1, 1,
0.4561135, -0.8661316, 3.545109, 0.01960784, 0, 1, 1,
0.4586569, -0.3920025, 0.4177445, 0.02745098, 0, 1, 1,
0.4639593, -0.7822768, 1.707247, 0.03137255, 0, 1, 1,
0.4641857, 0.3644938, 2.181559, 0.03921569, 0, 1, 1,
0.4655747, -0.161557, 1.498535, 0.04313726, 0, 1, 1,
0.465827, 1.588606, 0.4848483, 0.05098039, 0, 1, 1,
0.4700456, -2.211293, 3.821222, 0.05490196, 0, 1, 1,
0.4708397, 0.6170154, 2.351761, 0.0627451, 0, 1, 1,
0.4720078, 1.000133, 1.235771, 0.06666667, 0, 1, 1,
0.4747405, 1.723271, -0.5693391, 0.07450981, 0, 1, 1,
0.4763617, 1.23846, 0.5979714, 0.07843138, 0, 1, 1,
0.480066, 1.553182, 2.723019, 0.08627451, 0, 1, 1,
0.4927746, 0.2739069, 1.73196, 0.09019608, 0, 1, 1,
0.4948767, 0.9102813, 2.218957, 0.09803922, 0, 1, 1,
0.4966035, 0.1691103, 0.02793568, 0.1058824, 0, 1, 1,
0.4973396, 0.4527532, 1.245273, 0.1098039, 0, 1, 1,
0.501265, 0.9070539, -1.106602, 0.1176471, 0, 1, 1,
0.5036351, -0.8946705, 2.7913, 0.1215686, 0, 1, 1,
0.5039314, 0.07638485, 2.833656, 0.1294118, 0, 1, 1,
0.5063479, -1.74151, 3.338117, 0.1333333, 0, 1, 1,
0.5120785, 0.3848191, 1.181424, 0.1411765, 0, 1, 1,
0.5151404, -0.295653, 2.011574, 0.145098, 0, 1, 1,
0.5174032, -0.7280062, 2.090701, 0.1529412, 0, 1, 1,
0.5175309, -0.3504587, 2.37738, 0.1568628, 0, 1, 1,
0.5176548, -0.1858259, 1.21764, 0.1647059, 0, 1, 1,
0.526495, -0.04911058, 0.2900378, 0.1686275, 0, 1, 1,
0.5274469, -0.2127159, 0.5025673, 0.1764706, 0, 1, 1,
0.52946, 2.051018, 0.5208824, 0.1803922, 0, 1, 1,
0.5300418, 1.352707, -0.7455952, 0.1882353, 0, 1, 1,
0.5350079, -1.106535, 1.826121, 0.1921569, 0, 1, 1,
0.5353121, -0.8062327, 3.166584, 0.2, 0, 1, 1,
0.5353165, -0.610548, 3.183661, 0.2078431, 0, 1, 1,
0.5376413, -0.8297281, 1.970552, 0.2117647, 0, 1, 1,
0.539947, 0.6621956, -0.03031103, 0.2196078, 0, 1, 1,
0.542549, 0.1312864, 0.5853357, 0.2235294, 0, 1, 1,
0.5442596, 0.5208611, 1.546287, 0.2313726, 0, 1, 1,
0.5444611, 0.3735003, 1.887785, 0.2352941, 0, 1, 1,
0.5496818, -0.2959722, 0.4281932, 0.2431373, 0, 1, 1,
0.5510927, 1.358176, -0.1813426, 0.2470588, 0, 1, 1,
0.5560837, -0.6451801, 1.505389, 0.254902, 0, 1, 1,
0.5575048, 0.4321619, 0.2655076, 0.2588235, 0, 1, 1,
0.5589152, -0.3045205, 2.312877, 0.2666667, 0, 1, 1,
0.5594549, 0.02629589, 0.4385064, 0.2705882, 0, 1, 1,
0.5633326, 0.5493744, 0.3997552, 0.2784314, 0, 1, 1,
0.5636414, -0.3760035, 3.719269, 0.282353, 0, 1, 1,
0.5662324, 0.10841, 2.79122, 0.2901961, 0, 1, 1,
0.5697172, 0.5173677, -1.44541, 0.2941177, 0, 1, 1,
0.5756713, 0.4599506, 1.43344, 0.3019608, 0, 1, 1,
0.5760984, -0.7442766, 3.969933, 0.3098039, 0, 1, 1,
0.5787387, -1.360348, 3.90268, 0.3137255, 0, 1, 1,
0.5799929, -0.1549836, 1.580969, 0.3215686, 0, 1, 1,
0.594492, -0.10228, 2.826032, 0.3254902, 0, 1, 1,
0.5961821, 0.04606499, 2.025301, 0.3333333, 0, 1, 1,
0.5976796, 0.3720354, 3.342052, 0.3372549, 0, 1, 1,
0.6055111, -0.3571142, 2.056577, 0.345098, 0, 1, 1,
0.6057744, -2.384577, 2.133912, 0.3490196, 0, 1, 1,
0.6095755, -1.453411, 2.41451, 0.3568628, 0, 1, 1,
0.6119707, -0.7900669, 0.6453758, 0.3607843, 0, 1, 1,
0.6130764, 0.1569102, -0.1151726, 0.3686275, 0, 1, 1,
0.6191665, -0.3412305, 0.9751663, 0.372549, 0, 1, 1,
0.6205664, -0.6242962, 2.823872, 0.3803922, 0, 1, 1,
0.6219751, 0.7511974, 0.2420878, 0.3843137, 0, 1, 1,
0.6314601, -2.209318, 2.036155, 0.3921569, 0, 1, 1,
0.6335436, -0.3804968, 3.09054, 0.3960784, 0, 1, 1,
0.6409164, -0.3973632, 2.462581, 0.4039216, 0, 1, 1,
0.6428239, -0.4759303, 3.860171, 0.4117647, 0, 1, 1,
0.6461321, 1.551045, -1.020695, 0.4156863, 0, 1, 1,
0.6481652, -0.0641968, 1.792492, 0.4235294, 0, 1, 1,
0.6483806, -0.09693394, 0.4603633, 0.427451, 0, 1, 1,
0.6488195, 0.4251003, 2.809269, 0.4352941, 0, 1, 1,
0.6493114, 0.2511786, 2.015246, 0.4392157, 0, 1, 1,
0.6546085, -1.187151, 2.8028, 0.4470588, 0, 1, 1,
0.6557798, -0.6842041, 1.887476, 0.4509804, 0, 1, 1,
0.657464, 2.911588, -0.1584444, 0.4588235, 0, 1, 1,
0.6615695, -0.2983852, 0.5039617, 0.4627451, 0, 1, 1,
0.6664483, -0.6519973, 2.1515, 0.4705882, 0, 1, 1,
0.6671154, -1.31331, 4.141807, 0.4745098, 0, 1, 1,
0.6686633, 1.611164, 1.511918, 0.4823529, 0, 1, 1,
0.6698407, 0.3822666, 0.186439, 0.4862745, 0, 1, 1,
0.6705556, 0.06110682, 3.212792, 0.4941176, 0, 1, 1,
0.6719612, -0.9891603, 4.271305, 0.5019608, 0, 1, 1,
0.6762403, -0.6262289, 2.575477, 0.5058824, 0, 1, 1,
0.6805326, 1.039956, 1.046069, 0.5137255, 0, 1, 1,
0.6874973, 0.2248277, 1.630861, 0.5176471, 0, 1, 1,
0.689786, 0.5253168, 2.210449, 0.5254902, 0, 1, 1,
0.6946041, -0.9479584, 3.032104, 0.5294118, 0, 1, 1,
0.6971468, 0.7449942, 1.493819, 0.5372549, 0, 1, 1,
0.7014469, -1.886709, 1.674072, 0.5411765, 0, 1, 1,
0.7032763, -1.179826, 2.133031, 0.5490196, 0, 1, 1,
0.7036845, 0.8748679, 1.39247, 0.5529412, 0, 1, 1,
0.7121097, -0.691186, 3.829174, 0.5607843, 0, 1, 1,
0.7176325, 0.2953165, 1.961237, 0.5647059, 0, 1, 1,
0.7279865, -1.245034, 0.9311792, 0.572549, 0, 1, 1,
0.7286829, -0.4710294, 2.709162, 0.5764706, 0, 1, 1,
0.7372406, 0.2501035, 0.7988879, 0.5843138, 0, 1, 1,
0.7421982, 0.872861, 2.220174, 0.5882353, 0, 1, 1,
0.7446796, -1.060731, 3.972842, 0.5960785, 0, 1, 1,
0.7505782, 2.021961, -0.887943, 0.6039216, 0, 1, 1,
0.7522615, 1.109855, 1.271554, 0.6078432, 0, 1, 1,
0.753454, 1.366991, 1.632861, 0.6156863, 0, 1, 1,
0.7562714, -1.477543, 3.624509, 0.6196079, 0, 1, 1,
0.7603443, -0.7763205, 2.804513, 0.627451, 0, 1, 1,
0.7636492, -1.232358, 1.345462, 0.6313726, 0, 1, 1,
0.7678646, -0.3301439, 2.391745, 0.6392157, 0, 1, 1,
0.7684093, 1.346344, 0.2014739, 0.6431373, 0, 1, 1,
0.7694724, 0.4552622, 2.740086, 0.6509804, 0, 1, 1,
0.7701995, 0.4862946, -0.1942722, 0.654902, 0, 1, 1,
0.7717551, 0.344, 1.40531, 0.6627451, 0, 1, 1,
0.7733884, -0.7198272, 2.146708, 0.6666667, 0, 1, 1,
0.7737619, 0.5802807, 1.879757, 0.6745098, 0, 1, 1,
0.7893124, 1.480609, 0.598435, 0.6784314, 0, 1, 1,
0.7895085, -0.5382697, 2.128339, 0.6862745, 0, 1, 1,
0.794278, -0.2487569, 1.223073, 0.6901961, 0, 1, 1,
0.8018178, -1.05902, 1.934863, 0.6980392, 0, 1, 1,
0.8062158, 0.2146156, 0.7110392, 0.7058824, 0, 1, 1,
0.8066727, -0.4441656, 2.037407, 0.7098039, 0, 1, 1,
0.8072789, -0.3484271, -1.263557, 0.7176471, 0, 1, 1,
0.8077151, 0.7892329, -0.3271969, 0.7215686, 0, 1, 1,
0.8109681, 0.5080236, 0.6928337, 0.7294118, 0, 1, 1,
0.8114341, -0.5008166, 0.63885, 0.7333333, 0, 1, 1,
0.8119429, 1.888804, -0.1232659, 0.7411765, 0, 1, 1,
0.8335868, -0.1276157, 2.322096, 0.7450981, 0, 1, 1,
0.8360193, 1.147086, 0.5063757, 0.7529412, 0, 1, 1,
0.8362716, 0.1795379, 1.750802, 0.7568628, 0, 1, 1,
0.8368886, -0.7369112, 2.768408, 0.7647059, 0, 1, 1,
0.8370637, 0.1202455, 0.04788337, 0.7686275, 0, 1, 1,
0.8393695, -0.2405364, 2.198865, 0.7764706, 0, 1, 1,
0.8425819, 1.523883, 0.8408359, 0.7803922, 0, 1, 1,
0.8428159, 0.5328827, 1.282977, 0.7882353, 0, 1, 1,
0.8429434, -0.3474758, 1.584059, 0.7921569, 0, 1, 1,
0.8438634, 1.101842, 1.571749, 0.8, 0, 1, 1,
0.8443493, 0.9868971, -0.3462565, 0.8078431, 0, 1, 1,
0.8490688, 0.5856671, 1.055987, 0.8117647, 0, 1, 1,
0.8501557, 1.622605, -0.9883256, 0.8196079, 0, 1, 1,
0.85356, -0.06006318, 1.654848, 0.8235294, 0, 1, 1,
0.8560006, 1.138672, 1.685406, 0.8313726, 0, 1, 1,
0.8565335, 2.664161, 0.8070467, 0.8352941, 0, 1, 1,
0.8597587, -0.1495597, 1.254984, 0.8431373, 0, 1, 1,
0.8621042, 1.660557, 1.983617, 0.8470588, 0, 1, 1,
0.8694005, 0.2826173, 1.185917, 0.854902, 0, 1, 1,
0.8746948, 0.981444, 1.653508, 0.8588235, 0, 1, 1,
0.8760146, 0.214935, 1.196111, 0.8666667, 0, 1, 1,
0.8788142, -0.07167523, 0.9410381, 0.8705882, 0, 1, 1,
0.8812547, -0.5401016, 4.173315, 0.8784314, 0, 1, 1,
0.8815256, 0.8635549, 2.542492, 0.8823529, 0, 1, 1,
0.9001991, 0.157331, 1.946901, 0.8901961, 0, 1, 1,
0.9099703, -0.5765513, 1.593315, 0.8941177, 0, 1, 1,
0.9151521, -0.01045118, 1.206698, 0.9019608, 0, 1, 1,
0.9202223, 1.922166, 0.4898969, 0.9098039, 0, 1, 1,
0.9304063, 0.6993492, 0.9656073, 0.9137255, 0, 1, 1,
0.9317647, -0.3055592, 1.681848, 0.9215686, 0, 1, 1,
0.9354455, -0.3901539, 1.843415, 0.9254902, 0, 1, 1,
0.9367314, -0.7928658, 0.9113002, 0.9333333, 0, 1, 1,
0.9408383, 0.4950593, -0.6389373, 0.9372549, 0, 1, 1,
0.9482154, 0.3105056, 0.1810944, 0.945098, 0, 1, 1,
0.9488331, 1.065636, 0.9577274, 0.9490196, 0, 1, 1,
0.9493813, -0.6415179, 1.136664, 0.9568627, 0, 1, 1,
0.9512485, -0.09635629, 3.235699, 0.9607843, 0, 1, 1,
0.9539043, 0.4098333, 1.334641, 0.9686275, 0, 1, 1,
0.956111, 0.2657601, 1.298217, 0.972549, 0, 1, 1,
0.9562846, -1.181279, 0.81568, 0.9803922, 0, 1, 1,
0.9595272, -0.5850561, 1.947238, 0.9843137, 0, 1, 1,
0.9599143, -0.270786, 2.254229, 0.9921569, 0, 1, 1,
0.9680833, 2.233015, -1.867836, 0.9960784, 0, 1, 1,
0.9683505, 0.1252946, 0.7511334, 1, 0, 0.9960784, 1,
0.9701875, -1.870305, 1.732425, 1, 0, 0.9882353, 1,
0.9729136, -1.542041, 2.140144, 1, 0, 0.9843137, 1,
0.9786778, 0.7675893, 1.092554, 1, 0, 0.9764706, 1,
0.982008, 0.3323488, -0.5296151, 1, 0, 0.972549, 1,
0.9846149, 0.1315682, 1.002509, 1, 0, 0.9647059, 1,
0.999061, 0.7386791, 0.2104714, 1, 0, 0.9607843, 1,
1.002909, -0.3017315, 2.464468, 1, 0, 0.9529412, 1,
1.022791, 0.2461432, 1.478748, 1, 0, 0.9490196, 1,
1.029019, 0.02972865, 1.056205, 1, 0, 0.9411765, 1,
1.031526, 0.8159379, 2.447968, 1, 0, 0.9372549, 1,
1.034708, -0.4807474, 1.619557, 1, 0, 0.9294118, 1,
1.036796, 0.2815842, 0.008949527, 1, 0, 0.9254902, 1,
1.039952, -1.079432, 0.9904277, 1, 0, 0.9176471, 1,
1.044078, -0.2835065, 3.851144, 1, 0, 0.9137255, 1,
1.05099, -1.786054, 1.863127, 1, 0, 0.9058824, 1,
1.051337, 0.8353254, 1.583436, 1, 0, 0.9019608, 1,
1.055621, -0.8243441, 1.18481, 1, 0, 0.8941177, 1,
1.061079, 0.8476866, 0.8701007, 1, 0, 0.8862745, 1,
1.063052, -0.7150198, 2.238461, 1, 0, 0.8823529, 1,
1.074277, -2.110069, 4.715372, 1, 0, 0.8745098, 1,
1.074338, 1.054893, 2.411929, 1, 0, 0.8705882, 1,
1.077472, -0.6708598, 2.959136, 1, 0, 0.8627451, 1,
1.083407, 3.395735, -0.0803269, 1, 0, 0.8588235, 1,
1.086718, 0.08829667, 1.404254, 1, 0, 0.8509804, 1,
1.088344, -0.721848, 2.830482, 1, 0, 0.8470588, 1,
1.093892, -1.198159, 1.780699, 1, 0, 0.8392157, 1,
1.0945, 2.440814, 2.746282, 1, 0, 0.8352941, 1,
1.096052, 1.201895, 0.6253346, 1, 0, 0.827451, 1,
1.101841, -0.007410204, 1.169508, 1, 0, 0.8235294, 1,
1.112697, -1.876715, 3.036164, 1, 0, 0.8156863, 1,
1.118088, 1.169895, 0.5305321, 1, 0, 0.8117647, 1,
1.132135, -1.405412, 3.650751, 1, 0, 0.8039216, 1,
1.132591, -0.02256433, 1.248705, 1, 0, 0.7960784, 1,
1.134535, 0.01452925, 0.4489584, 1, 0, 0.7921569, 1,
1.138179, -0.6097006, 2.239761, 1, 0, 0.7843137, 1,
1.14842, 0.4416324, 1.392687, 1, 0, 0.7803922, 1,
1.149767, 0.6560442, -0.08011514, 1, 0, 0.772549, 1,
1.15765, 0.8325607, 0.964766, 1, 0, 0.7686275, 1,
1.161688, -0.2917777, 0.8919618, 1, 0, 0.7607843, 1,
1.16422, -0.5826488, 1.089292, 1, 0, 0.7568628, 1,
1.168937, 0.07218096, 3.441004, 1, 0, 0.7490196, 1,
1.178574, -0.1077701, 2.612512, 1, 0, 0.7450981, 1,
1.195227, -1.114639, 1.232481, 1, 0, 0.7372549, 1,
1.197529, -2.082917, 2.691603, 1, 0, 0.7333333, 1,
1.218456, 3.378198, 0.9154693, 1, 0, 0.7254902, 1,
1.223062, 1.362542, 0.534848, 1, 0, 0.7215686, 1,
1.228437, 1.106267, 0.6351844, 1, 0, 0.7137255, 1,
1.239256, 0.2258317, 1.926521, 1, 0, 0.7098039, 1,
1.252568, 0.07799646, 1.698189, 1, 0, 0.7019608, 1,
1.258027, 0.1472074, 1.047676, 1, 0, 0.6941177, 1,
1.259012, -0.841939, 1.097686, 1, 0, 0.6901961, 1,
1.266529, 0.2285197, 0.2799727, 1, 0, 0.682353, 1,
1.275228, -1.158795, 3.819318, 1, 0, 0.6784314, 1,
1.281251, -0.1575535, -0.7125102, 1, 0, 0.6705883, 1,
1.283265, -0.5580152, 0.8675303, 1, 0, 0.6666667, 1,
1.28505, -0.6447029, 2.790973, 1, 0, 0.6588235, 1,
1.288738, -1.219424, 2.658588, 1, 0, 0.654902, 1,
1.30516, 0.9486263, 0.1932554, 1, 0, 0.6470588, 1,
1.314845, -0.4134624, 1.848702, 1, 0, 0.6431373, 1,
1.324749, -1.666848, 2.607773, 1, 0, 0.6352941, 1,
1.326208, 0.6405385, 1.895905, 1, 0, 0.6313726, 1,
1.331878, -1.301167, 3.131666, 1, 0, 0.6235294, 1,
1.333597, 0.0274149, 3.173992, 1, 0, 0.6196079, 1,
1.338245, -0.7689294, 0.9467785, 1, 0, 0.6117647, 1,
1.345045, 0.8468605, 0.1066357, 1, 0, 0.6078432, 1,
1.347038, -0.6524053, 1.087419, 1, 0, 0.6, 1,
1.367888, -0.3648758, 2.47857, 1, 0, 0.5921569, 1,
1.368565, -0.2260796, 1.115397, 1, 0, 0.5882353, 1,
1.372133, 0.8914334, 1.59543, 1, 0, 0.5803922, 1,
1.374168, 1.594086, 1.167586, 1, 0, 0.5764706, 1,
1.374766, 1.603714, 0.6791629, 1, 0, 0.5686275, 1,
1.376737, 0.8369905, 1.388449, 1, 0, 0.5647059, 1,
1.382909, -1.196702, 1.490294, 1, 0, 0.5568628, 1,
1.387282, -0.2521998, 1.750648, 1, 0, 0.5529412, 1,
1.387612, 0.4362441, -0.1518252, 1, 0, 0.5450981, 1,
1.394961, -0.08556096, 1.154256, 1, 0, 0.5411765, 1,
1.396947, -0.5126017, 2.00833, 1, 0, 0.5333334, 1,
1.398661, -0.4762619, 2.201249, 1, 0, 0.5294118, 1,
1.404951, -0.6345505, 0.468612, 1, 0, 0.5215687, 1,
1.408585, -0.2951526, 2.116093, 1, 0, 0.5176471, 1,
1.42274, 1.729076, -0.5962508, 1, 0, 0.509804, 1,
1.424462, 0.2117822, 0.03053069, 1, 0, 0.5058824, 1,
1.431874, 0.3753947, 0.4345292, 1, 0, 0.4980392, 1,
1.433188, 0.1550708, 1.153882, 1, 0, 0.4901961, 1,
1.434028, -0.2494672, 1.241158, 1, 0, 0.4862745, 1,
1.437652, -0.7524013, -0.08902691, 1, 0, 0.4784314, 1,
1.449951, -0.4555575, 1.028688, 1, 0, 0.4745098, 1,
1.469678, 0.8899652, 1.277881, 1, 0, 0.4666667, 1,
1.472123, -0.04894675, 2.28381, 1, 0, 0.4627451, 1,
1.472505, -0.629747, 3.971164, 1, 0, 0.454902, 1,
1.472616, 1.821029, -1.683137, 1, 0, 0.4509804, 1,
1.475623, -0.855709, 2.550359, 1, 0, 0.4431373, 1,
1.475837, -0.1737793, 0.9244974, 1, 0, 0.4392157, 1,
1.495493, 0.0762479, 1.888457, 1, 0, 0.4313726, 1,
1.496487, -0.4448158, 0.4962794, 1, 0, 0.427451, 1,
1.509157, 2.901066, -0.2077626, 1, 0, 0.4196078, 1,
1.512741, -0.1412854, 2.933567, 1, 0, 0.4156863, 1,
1.536519, -0.2532347, 4.16657, 1, 0, 0.4078431, 1,
1.543808, 0.1981588, 1.647435, 1, 0, 0.4039216, 1,
1.557838, 1.734843, 1.908801, 1, 0, 0.3960784, 1,
1.569149, 0.7846105, 2.842545, 1, 0, 0.3882353, 1,
1.572215, -0.2098584, 1.505269, 1, 0, 0.3843137, 1,
1.575002, -0.6250037, 0.9327851, 1, 0, 0.3764706, 1,
1.580713, -1.327507, 3.353938, 1, 0, 0.372549, 1,
1.595036, -0.9732056, 2.941761, 1, 0, 0.3647059, 1,
1.604623, 0.9324394, 2.540764, 1, 0, 0.3607843, 1,
1.63678, -0.09937645, 2.412459, 1, 0, 0.3529412, 1,
1.644653, 1.548505, 1.952211, 1, 0, 0.3490196, 1,
1.658464, -0.8363159, 1.443748, 1, 0, 0.3411765, 1,
1.665947, -0.08333667, 0.43923, 1, 0, 0.3372549, 1,
1.667408, 0.1263427, 2.379981, 1, 0, 0.3294118, 1,
1.667857, -0.2120544, 1.317072, 1, 0, 0.3254902, 1,
1.673624, -0.3836485, 3.222394, 1, 0, 0.3176471, 1,
1.676008, 0.2998184, 2.02604, 1, 0, 0.3137255, 1,
1.679446, -2.011112, 1.71901, 1, 0, 0.3058824, 1,
1.691921, 0.4955114, 2.618499, 1, 0, 0.2980392, 1,
1.70957, -1.325977, 2.358459, 1, 0, 0.2941177, 1,
1.713953, 2.299411, 0.1451553, 1, 0, 0.2862745, 1,
1.729999, -0.6820977, 1.714936, 1, 0, 0.282353, 1,
1.737482, -0.6594363, 1.783489, 1, 0, 0.2745098, 1,
1.743054, -0.2509054, 0.3880364, 1, 0, 0.2705882, 1,
1.7609, 1.026947, -0.7457929, 1, 0, 0.2627451, 1,
1.772933, -3.157809, 3.459676, 1, 0, 0.2588235, 1,
1.786252, 0.6030346, 2.223071, 1, 0, 0.2509804, 1,
1.789585, 0.7039875, 1.867537, 1, 0, 0.2470588, 1,
1.8056, -0.4971197, 3.031952, 1, 0, 0.2392157, 1,
1.818686, 0.3591511, 2.141268, 1, 0, 0.2352941, 1,
1.864614, 0.8798863, 1.741565, 1, 0, 0.227451, 1,
1.871691, -0.101906, 4.114443, 1, 0, 0.2235294, 1,
1.873377, -1.627942, 1.53755, 1, 0, 0.2156863, 1,
1.891525, 0.2400556, 1.66489, 1, 0, 0.2117647, 1,
1.901758, -0.8889434, 3.40648, 1, 0, 0.2039216, 1,
1.909667, -1.79716, 3.46532, 1, 0, 0.1960784, 1,
1.916926, -0.7583523, 0.753089, 1, 0, 0.1921569, 1,
1.922085, 0.04888211, 2.829227, 1, 0, 0.1843137, 1,
1.932769, 0.9720802, -0.7289904, 1, 0, 0.1803922, 1,
1.933101, -0.4963933, 1.121785, 1, 0, 0.172549, 1,
1.955182, -0.08734155, -0.2808714, 1, 0, 0.1686275, 1,
1.957384, 0.980947, 1.25244, 1, 0, 0.1607843, 1,
2.000476, 0.1422411, 0.1018803, 1, 0, 0.1568628, 1,
2.001372, -0.7373818, 1.74847, 1, 0, 0.1490196, 1,
2.003347, -0.09950782, 2.780547, 1, 0, 0.145098, 1,
2.012046, -0.6257744, 1.725136, 1, 0, 0.1372549, 1,
2.026507, -0.02954581, 0.5093001, 1, 0, 0.1333333, 1,
2.035489, 0.079564, 0.7121664, 1, 0, 0.1254902, 1,
2.042495, 1.723942, 1.684028, 1, 0, 0.1215686, 1,
2.058706, -0.6248436, 2.048099, 1, 0, 0.1137255, 1,
2.071074, -0.3723457, 0.8423384, 1, 0, 0.1098039, 1,
2.11496, 2.677256, 0.1271243, 1, 0, 0.1019608, 1,
2.120833, 0.417524, 1.04299, 1, 0, 0.09411765, 1,
2.127692, -0.1352236, 2.82232, 1, 0, 0.09019608, 1,
2.136504, 1.3931, 1.442037, 1, 0, 0.08235294, 1,
2.142463, 0.7367479, -0.235282, 1, 0, 0.07843138, 1,
2.161921, -1.511124, 2.534007, 1, 0, 0.07058824, 1,
2.264621, -0.1553035, 1.387112, 1, 0, 0.06666667, 1,
2.280228, 0.8686357, 1.487078, 1, 0, 0.05882353, 1,
2.293151, 0.6614888, 0.5427181, 1, 0, 0.05490196, 1,
2.298635, -1.449015, 2.630021, 1, 0, 0.04705882, 1,
2.335058, 2.261986, 1.392874, 1, 0, 0.04313726, 1,
2.522675, -1.209372, 1.7259, 1, 0, 0.03529412, 1,
2.625244, -0.6725783, 2.622263, 1, 0, 0.03137255, 1,
2.65763, 0.9611419, 0.6030943, 1, 0, 0.02352941, 1,
2.777364, -1.32016, 2.949456, 1, 0, 0.01960784, 1,
2.980752, 1.752055, -0.04390149, 1, 0, 0.01176471, 1,
2.984877, 0.2857413, -0.3831174, 1, 0, 0.007843138, 1
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
-0.1360039, -4.644757, -7.673737, 0, -0.5, 0.5, 0.5,
-0.1360039, -4.644757, -7.673737, 1, -0.5, 0.5, 0.5,
-0.1360039, -4.644757, -7.673737, 1, 1.5, 0.5, 0.5,
-0.1360039, -4.644757, -7.673737, 0, 1.5, 0.5, 0.5
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
-4.314864, -0.04184151, -7.673737, 0, -0.5, 0.5, 0.5,
-4.314864, -0.04184151, -7.673737, 1, -0.5, 0.5, 0.5,
-4.314864, -0.04184151, -7.673737, 1, 1.5, 0.5, 0.5,
-4.314864, -0.04184151, -7.673737, 0, 1.5, 0.5, 0.5
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
-4.314864, -4.644757, 0.3777752, 0, -0.5, 0.5, 0.5,
-4.314864, -4.644757, 0.3777752, 1, -0.5, 0.5, 0.5,
-4.314864, -4.644757, 0.3777752, 1, 1.5, 0.5, 0.5,
-4.314864, -4.644757, 0.3777752, 0, 1.5, 0.5, 0.5
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
-3, -3.582546, -5.815695,
2, -3.582546, -5.815695,
-3, -3.582546, -5.815695,
-3, -3.759581, -6.125369,
-2, -3.582546, -5.815695,
-2, -3.759581, -6.125369,
-1, -3.582546, -5.815695,
-1, -3.759581, -6.125369,
0, -3.582546, -5.815695,
0, -3.759581, -6.125369,
1, -3.582546, -5.815695,
1, -3.759581, -6.125369,
2, -3.582546, -5.815695,
2, -3.759581, -6.125369
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
-3, -4.113651, -6.744716, 0, -0.5, 0.5, 0.5,
-3, -4.113651, -6.744716, 1, -0.5, 0.5, 0.5,
-3, -4.113651, -6.744716, 1, 1.5, 0.5, 0.5,
-3, -4.113651, -6.744716, 0, 1.5, 0.5, 0.5,
-2, -4.113651, -6.744716, 0, -0.5, 0.5, 0.5,
-2, -4.113651, -6.744716, 1, -0.5, 0.5, 0.5,
-2, -4.113651, -6.744716, 1, 1.5, 0.5, 0.5,
-2, -4.113651, -6.744716, 0, 1.5, 0.5, 0.5,
-1, -4.113651, -6.744716, 0, -0.5, 0.5, 0.5,
-1, -4.113651, -6.744716, 1, -0.5, 0.5, 0.5,
-1, -4.113651, -6.744716, 1, 1.5, 0.5, 0.5,
-1, -4.113651, -6.744716, 0, 1.5, 0.5, 0.5,
0, -4.113651, -6.744716, 0, -0.5, 0.5, 0.5,
0, -4.113651, -6.744716, 1, -0.5, 0.5, 0.5,
0, -4.113651, -6.744716, 1, 1.5, 0.5, 0.5,
0, -4.113651, -6.744716, 0, 1.5, 0.5, 0.5,
1, -4.113651, -6.744716, 0, -0.5, 0.5, 0.5,
1, -4.113651, -6.744716, 1, -0.5, 0.5, 0.5,
1, -4.113651, -6.744716, 1, 1.5, 0.5, 0.5,
1, -4.113651, -6.744716, 0, 1.5, 0.5, 0.5,
2, -4.113651, -6.744716, 0, -0.5, 0.5, 0.5,
2, -4.113651, -6.744716, 1, -0.5, 0.5, 0.5,
2, -4.113651, -6.744716, 1, 1.5, 0.5, 0.5,
2, -4.113651, -6.744716, 0, 1.5, 0.5, 0.5
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
-3.350512, -3, -5.815695,
-3.350512, 3, -5.815695,
-3.350512, -3, -5.815695,
-3.511237, -3, -6.125369,
-3.350512, -2, -5.815695,
-3.511237, -2, -6.125369,
-3.350512, -1, -5.815695,
-3.511237, -1, -6.125369,
-3.350512, 0, -5.815695,
-3.511237, 0, -6.125369,
-3.350512, 1, -5.815695,
-3.511237, 1, -6.125369,
-3.350512, 2, -5.815695,
-3.511237, 2, -6.125369,
-3.350512, 3, -5.815695,
-3.511237, 3, -6.125369
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
-3.832688, -3, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, -3, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, -3, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, -3, -6.744716, 0, 1.5, 0.5, 0.5,
-3.832688, -2, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, -2, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, -2, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, -2, -6.744716, 0, 1.5, 0.5, 0.5,
-3.832688, -1, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, -1, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, -1, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, -1, -6.744716, 0, 1.5, 0.5, 0.5,
-3.832688, 0, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, 0, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, 0, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, 0, -6.744716, 0, 1.5, 0.5, 0.5,
-3.832688, 1, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, 1, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, 1, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, 1, -6.744716, 0, 1.5, 0.5, 0.5,
-3.832688, 2, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, 2, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, 2, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, 2, -6.744716, 0, 1.5, 0.5, 0.5,
-3.832688, 3, -6.744716, 0, -0.5, 0.5, 0.5,
-3.832688, 3, -6.744716, 1, -0.5, 0.5, 0.5,
-3.832688, 3, -6.744716, 1, 1.5, 0.5, 0.5,
-3.832688, 3, -6.744716, 0, 1.5, 0.5, 0.5
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
-3.350512, -3.582546, -4,
-3.350512, -3.582546, 6,
-3.350512, -3.582546, -4,
-3.511237, -3.759581, -4,
-3.350512, -3.582546, -2,
-3.511237, -3.759581, -2,
-3.350512, -3.582546, 0,
-3.511237, -3.759581, 0,
-3.350512, -3.582546, 2,
-3.511237, -3.759581, 2,
-3.350512, -3.582546, 4,
-3.511237, -3.759581, 4,
-3.350512, -3.582546, 6,
-3.511237, -3.759581, 6
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
"4",
"6"
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
-3.832688, -4.113651, -4, 0, -0.5, 0.5, 0.5,
-3.832688, -4.113651, -4, 1, -0.5, 0.5, 0.5,
-3.832688, -4.113651, -4, 1, 1.5, 0.5, 0.5,
-3.832688, -4.113651, -4, 0, 1.5, 0.5, 0.5,
-3.832688, -4.113651, -2, 0, -0.5, 0.5, 0.5,
-3.832688, -4.113651, -2, 1, -0.5, 0.5, 0.5,
-3.832688, -4.113651, -2, 1, 1.5, 0.5, 0.5,
-3.832688, -4.113651, -2, 0, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 0, 0, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 0, 1, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 0, 1, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 0, 0, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 2, 0, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 2, 1, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 2, 1, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 2, 0, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 4, 0, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 4, 1, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 4, 1, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 4, 0, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 6, 0, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 6, 1, -0.5, 0.5, 0.5,
-3.832688, -4.113651, 6, 1, 1.5, 0.5, 0.5,
-3.832688, -4.113651, 6, 0, 1.5, 0.5, 0.5
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
-3.350512, -3.582546, -5.815695,
-3.350512, 3.498863, -5.815695,
-3.350512, -3.582546, 6.571246,
-3.350512, 3.498863, 6.571246,
-3.350512, -3.582546, -5.815695,
-3.350512, -3.582546, 6.571246,
-3.350512, 3.498863, -5.815695,
-3.350512, 3.498863, 6.571246,
-3.350512, -3.582546, -5.815695,
3.078504, -3.582546, -5.815695,
-3.350512, -3.582546, 6.571246,
3.078504, -3.582546, 6.571246,
-3.350512, 3.498863, -5.815695,
3.078504, 3.498863, -5.815695,
-3.350512, 3.498863, 6.571246,
3.078504, 3.498863, 6.571246,
3.078504, -3.582546, -5.815695,
3.078504, 3.498863, -5.815695,
3.078504, -3.582546, 6.571246,
3.078504, 3.498863, 6.571246,
3.078504, -3.582546, -5.815695,
3.078504, -3.582546, 6.571246,
3.078504, 3.498863, -5.815695,
3.078504, 3.498863, 6.571246
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
var radius = 8.356666;
var distance = 37.17975;
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
mvMatrix.translate( 0.1360039, 0.04184151, -0.3777752 );
mvMatrix.scale( 1.405408, 1.275931, 0.7294288 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.17975);
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
abate<-read.table("abate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-abate$V2
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
```

```r
y<-abate$V3
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
```

```r
z<-abate$V4
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
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
-3.256885, 1.858657, -1.305933, 0, 0, 1, 1, 1,
-2.96154, 0.2834575, -2.047506, 1, 0, 0, 1, 1,
-2.872662, 0.521373, -0.9703577, 1, 0, 0, 1, 1,
-2.8155, -1.17432, -3.554223, 1, 0, 0, 1, 1,
-2.782674, -0.5235039, -1.61668, 1, 0, 0, 1, 1,
-2.636499, 0.1091585, -0.3351045, 1, 0, 0, 1, 1,
-2.619264, -0.1314186, -2.636624, 0, 0, 0, 1, 1,
-2.588447, -1.24803, -2.416424, 0, 0, 0, 1, 1,
-2.565335, -1.082237, -0.3615071, 0, 0, 0, 1, 1,
-2.49914, 2.346334, -0.9803683, 0, 0, 0, 1, 1,
-2.494483, -1.439661, -0.8090022, 0, 0, 0, 1, 1,
-2.483398, 0.5921355, -2.158584, 0, 0, 0, 1, 1,
-2.444426, 2.3355, -0.7880877, 0, 0, 0, 1, 1,
-2.439479, -0.4894134, -2.549061, 1, 1, 1, 1, 1,
-2.389058, -0.8960536, -0.1121733, 1, 1, 1, 1, 1,
-2.37924, -0.7217983, -0.853299, 1, 1, 1, 1, 1,
-2.324714, 0.9672358, -3.243567, 1, 1, 1, 1, 1,
-2.270058, 1.059584, -1.891009, 1, 1, 1, 1, 1,
-2.236938, -0.6210268, -1.033405, 1, 1, 1, 1, 1,
-2.230262, -0.45805, -1.752481, 1, 1, 1, 1, 1,
-2.203207, 0.1106563, -2.322089, 1, 1, 1, 1, 1,
-2.183048, -0.2950423, -1.325383, 1, 1, 1, 1, 1,
-2.174478, 0.1786076, -0.2123425, 1, 1, 1, 1, 1,
-2.168935, -0.4411612, -0.8261828, 1, 1, 1, 1, 1,
-2.166175, -1.94445, -3.476717, 1, 1, 1, 1, 1,
-2.165378, -0.771746, -0.1447533, 1, 1, 1, 1, 1,
-2.13754, 0.7624245, -0.430734, 1, 1, 1, 1, 1,
-2.134258, 0.6689343, -2.176199, 1, 1, 1, 1, 1,
-2.110525, 2.630862, -0.6590053, 0, 0, 1, 1, 1,
-2.082771, -0.849552, -4.123544, 1, 0, 0, 1, 1,
-2.073733, 0.271945, -2.945428, 1, 0, 0, 1, 1,
-2.072258, -1.077053, -2.738555, 1, 0, 0, 1, 1,
-2.066543, -0.2985576, -2.17539, 1, 0, 0, 1, 1,
-2.065622, 1.054706, -2.479074, 1, 0, 0, 1, 1,
-2.03072, -0.5418796, -1.942999, 0, 0, 0, 1, 1,
-2.026852, 0.4861586, -1.748441, 0, 0, 0, 1, 1,
-2.006957, 0.00905635, -1.251882, 0, 0, 0, 1, 1,
-1.997981, 0.04629634, -0.4802774, 0, 0, 0, 1, 1,
-1.93773, -0.5839069, -1.323495, 0, 0, 0, 1, 1,
-1.928107, 0.1806285, -1.610401, 0, 0, 0, 1, 1,
-1.918874, 0.1265655, -1.205226, 0, 0, 0, 1, 1,
-1.889773, -2.245194, -3.427608, 1, 1, 1, 1, 1,
-1.8792, 0.03431128, -2.845628, 1, 1, 1, 1, 1,
-1.860871, 0.774636, -2.081046, 1, 1, 1, 1, 1,
-1.843083, 0.05394045, -2.913447, 1, 1, 1, 1, 1,
-1.841395, -0.4074339, -1.338549, 1, 1, 1, 1, 1,
-1.8343, -0.7967719, -1.483646, 1, 1, 1, 1, 1,
-1.796291, 0.1340498, -1.396913, 1, 1, 1, 1, 1,
-1.788751, -0.1611475, -1.615775, 1, 1, 1, 1, 1,
-1.782257, 0.3584176, -3.220061, 1, 1, 1, 1, 1,
-1.766724, -0.4789104, -1.68838, 1, 1, 1, 1, 1,
-1.764056, -0.02845023, -2.42969, 1, 1, 1, 1, 1,
-1.742388, -0.8336179, -0.8539646, 1, 1, 1, 1, 1,
-1.725465, -0.6461667, -2.518604, 1, 1, 1, 1, 1,
-1.723169, -0.08589018, -1.069868, 1, 1, 1, 1, 1,
-1.719406, -0.05914337, -2.343998, 1, 1, 1, 1, 1,
-1.707376, -0.437389, -0.5599943, 0, 0, 1, 1, 1,
-1.678004, 0.4906878, -0.3533778, 1, 0, 0, 1, 1,
-1.663869, -0.2715172, -1.259339, 1, 0, 0, 1, 1,
-1.66084, -0.002741434, -0.3637812, 1, 0, 0, 1, 1,
-1.656616, -0.365395, 0.04931543, 1, 0, 0, 1, 1,
-1.639698, -1.614284, -2.828173, 1, 0, 0, 1, 1,
-1.632475, -0.1021316, -0.8375132, 0, 0, 0, 1, 1,
-1.631345, 0.1190579, -3.727436, 0, 0, 0, 1, 1,
-1.627305, -0.005193249, -2.132358, 0, 0, 0, 1, 1,
-1.620519, -0.3261026, -3.176115, 0, 0, 0, 1, 1,
-1.576804, -0.5986462, -2.351634, 0, 0, 0, 1, 1,
-1.574988, 1.063208, -0.1744474, 0, 0, 0, 1, 1,
-1.558914, -0.6772069, -0.8774895, 0, 0, 0, 1, 1,
-1.557382, -1.030145, -2.736041, 1, 1, 1, 1, 1,
-1.553634, -0.02479639, -0.8007067, 1, 1, 1, 1, 1,
-1.543499, -0.1866581, -1.20597, 1, 1, 1, 1, 1,
-1.531862, 0.8310212, -2.739069, 1, 1, 1, 1, 1,
-1.531329, -1.051248, -0.7037504, 1, 1, 1, 1, 1,
-1.511297, 1.804208, -1.145846, 1, 1, 1, 1, 1,
-1.504008, 0.4586819, -2.26613, 1, 1, 1, 1, 1,
-1.498916, -2.03284, -3.361593, 1, 1, 1, 1, 1,
-1.497502, -1.402208, 0.1117366, 1, 1, 1, 1, 1,
-1.475698, 0.08792905, -1.407257, 1, 1, 1, 1, 1,
-1.47279, 0.8072928, -0.1066567, 1, 1, 1, 1, 1,
-1.47279, 0.1917609, -1.878125, 1, 1, 1, 1, 1,
-1.465762, -0.2466941, -4.003811, 1, 1, 1, 1, 1,
-1.437033, -0.7631883, -1.222894, 1, 1, 1, 1, 1,
-1.431338, 1.337206, 0.7500911, 1, 1, 1, 1, 1,
-1.430921, 0.3709219, -1.04156, 0, 0, 1, 1, 1,
-1.425923, -0.7407597, -2.420764, 1, 0, 0, 1, 1,
-1.424986, 0.6937656, -1.039656, 1, 0, 0, 1, 1,
-1.424881, 0.2828369, -1.393807, 1, 0, 0, 1, 1,
-1.423398, 0.6807162, -2.34859, 1, 0, 0, 1, 1,
-1.422042, 0.6218485, -1.06769, 1, 0, 0, 1, 1,
-1.416917, -1.034956, -2.17169, 0, 0, 0, 1, 1,
-1.414572, -2.360562, -1.132087, 0, 0, 0, 1, 1,
-1.407743, 2.199607, -0.3464667, 0, 0, 0, 1, 1,
-1.403891, -1.15029, -5.626372, 0, 0, 0, 1, 1,
-1.399504, 0.4835155, -0.4105524, 0, 0, 0, 1, 1,
-1.382387, -0.1724278, -1.994671, 0, 0, 0, 1, 1,
-1.378578, 0.3363128, -1.722758, 0, 0, 0, 1, 1,
-1.378132, -1.189063, -3.237554, 1, 1, 1, 1, 1,
-1.369653, -0.2408999, -1.217706, 1, 1, 1, 1, 1,
-1.365463, 0.8701874, 0.2774195, 1, 1, 1, 1, 1,
-1.3606, -1.599044, -2.525642, 1, 1, 1, 1, 1,
-1.351547, 0.7117026, -1.913262, 1, 1, 1, 1, 1,
-1.340133, -0.7302522, -1.745966, 1, 1, 1, 1, 1,
-1.316909, 1.444639, 0.07907565, 1, 1, 1, 1, 1,
-1.31591, 1.917099, 0.2777053, 1, 1, 1, 1, 1,
-1.306744, 1.037858, -0.8912364, 1, 1, 1, 1, 1,
-1.292076, -0.7051842, -2.040199, 1, 1, 1, 1, 1,
-1.290654, -0.7913201, -2.144885, 1, 1, 1, 1, 1,
-1.288412, -0.2104897, -0.3879945, 1, 1, 1, 1, 1,
-1.280382, 0.7025043, -0.09881336, 1, 1, 1, 1, 1,
-1.270826, -1.291561, -0.6560357, 1, 1, 1, 1, 1,
-1.267534, -0.02382402, -1.838001, 1, 1, 1, 1, 1,
-1.255746, -1.301453, -2.297132, 0, 0, 1, 1, 1,
-1.254563, -1.668213, -3.78667, 1, 0, 0, 1, 1,
-1.248539, -0.7548101, -0.9064364, 1, 0, 0, 1, 1,
-1.246184, 0.06444471, -1.472978, 1, 0, 0, 1, 1,
-1.236937, -1.620332, -2.690757, 1, 0, 0, 1, 1,
-1.233555, 0.6547493, 1.049638, 1, 0, 0, 1, 1,
-1.217683, -0.3150719, -2.267983, 0, 0, 0, 1, 1,
-1.217167, 1.84577, -1.016655, 0, 0, 0, 1, 1,
-1.206543, -0.2294973, -2.970454, 0, 0, 0, 1, 1,
-1.20608, 1.354025, -0.3995681, 0, 0, 0, 1, 1,
-1.20528, 1.176421, 0.8730881, 0, 0, 0, 1, 1,
-1.181101, 0.4397132, -2.768197, 0, 0, 0, 1, 1,
-1.179841, 0.2346684, -1.334589, 0, 0, 0, 1, 1,
-1.175316, 1.246992, -0.5925052, 1, 1, 1, 1, 1,
-1.174573, 0.2026296, -1.176795, 1, 1, 1, 1, 1,
-1.166176, -1.161705, -2.399807, 1, 1, 1, 1, 1,
-1.161783, -1.160983, -3.753928, 1, 1, 1, 1, 1,
-1.156934, 1.050241, -0.8708432, 1, 1, 1, 1, 1,
-1.156615, 0.6025653, -1.851001, 1, 1, 1, 1, 1,
-1.149285, -1.459814, -3.092642, 1, 1, 1, 1, 1,
-1.14858, -1.104553, -3.682731, 1, 1, 1, 1, 1,
-1.143958, 0.7623942, 0.572102, 1, 1, 1, 1, 1,
-1.125903, -1.258093, -3.471754, 1, 1, 1, 1, 1,
-1.121959, -1.409713, -1.965177, 1, 1, 1, 1, 1,
-1.120958, 0.3951285, -1.343629, 1, 1, 1, 1, 1,
-1.115493, -0.8503169, -0.8266777, 1, 1, 1, 1, 1,
-1.11155, 1.499761, 0.5081917, 1, 1, 1, 1, 1,
-1.104941, -0.7694603, -2.644602, 1, 1, 1, 1, 1,
-1.104725, -0.3632436, -4.124113, 0, 0, 1, 1, 1,
-1.092376, 0.03868693, -1.588181, 1, 0, 0, 1, 1,
-1.08803, -0.3871799, -2.609686, 1, 0, 0, 1, 1,
-1.083855, 0.4544381, -2.673922, 1, 0, 0, 1, 1,
-1.08055, -0.8020082, -1.688316, 1, 0, 0, 1, 1,
-1.078134, -0.8224993, -1.206035, 1, 0, 0, 1, 1,
-1.076323, 0.7777047, 1.070177, 0, 0, 0, 1, 1,
-1.074596, 2.633289, -0.4116254, 0, 0, 0, 1, 1,
-1.073454, -0.4266494, -3.036942, 0, 0, 0, 1, 1,
-1.070887, 0.8677047, -1.614521, 0, 0, 0, 1, 1,
-1.070797, 0.9688129, -0.4968143, 0, 0, 0, 1, 1,
-1.068115, 1.428702, -0.6303282, 0, 0, 0, 1, 1,
-1.061145, 0.8236312, -0.2407765, 0, 0, 0, 1, 1,
-1.061098, -0.05305179, -2.423021, 1, 1, 1, 1, 1,
-1.059569, -1.94286, -2.610568, 1, 1, 1, 1, 1,
-1.058353, -1.083185, -2.813372, 1, 1, 1, 1, 1,
-1.053325, 0.9213504, -0.4877411, 1, 1, 1, 1, 1,
-1.052493, 0.2768905, -0.8421198, 1, 1, 1, 1, 1,
-1.044981, 1.517824, 0.6385828, 1, 1, 1, 1, 1,
-1.044488, -0.63756, -0.3842513, 1, 1, 1, 1, 1,
-1.042321, -0.8570097, -3.082959, 1, 1, 1, 1, 1,
-1.033182, 0.1297487, 0.2891687, 1, 1, 1, 1, 1,
-1.025691, 0.1861951, -1.312131, 1, 1, 1, 1, 1,
-1.023574, 0.2548335, -1.691662, 1, 1, 1, 1, 1,
-1.021781, 0.510829, -1.520337, 1, 1, 1, 1, 1,
-1.021149, -0.203583, -4.052248, 1, 1, 1, 1, 1,
-1.017166, 0.9848084, 1.067242, 1, 1, 1, 1, 1,
-1.015984, 1.597303, -0.7852397, 1, 1, 1, 1, 1,
-1.007211, 0.7668785, -1.157612, 0, 0, 1, 1, 1,
-1.000991, 0.007708547, -1.679915, 1, 0, 0, 1, 1,
-0.9954069, -1.001217, -2.182493, 1, 0, 0, 1, 1,
-0.9821029, 0.8237689, -0.2522405, 1, 0, 0, 1, 1,
-0.9661834, 0.3072649, -1.455066, 1, 0, 0, 1, 1,
-0.9615732, -0.4363045, -1.93033, 1, 0, 0, 1, 1,
-0.9615493, 1.329495, -1.329419, 0, 0, 0, 1, 1,
-0.9586323, 0.05775981, -1.291696, 0, 0, 0, 1, 1,
-0.9563235, -0.5730441, -3.104695, 0, 0, 0, 1, 1,
-0.9562359, 1.96603, -1.212524, 0, 0, 0, 1, 1,
-0.9521677, -0.5314088, -1.868881, 0, 0, 0, 1, 1,
-0.9497413, 1.876636, -1.349073, 0, 0, 0, 1, 1,
-0.9480016, 1.328184, 0.7202973, 0, 0, 0, 1, 1,
-0.939189, -0.9834139, -2.099531, 1, 1, 1, 1, 1,
-0.9390815, -0.2345233, -2.456885, 1, 1, 1, 1, 1,
-0.932012, -0.1153292, 0.5338713, 1, 1, 1, 1, 1,
-0.9315242, 0.2545362, -1.893882, 1, 1, 1, 1, 1,
-0.9227118, 0.5924455, -0.8169199, 1, 1, 1, 1, 1,
-0.9205024, -0.4946772, -1.10953, 1, 1, 1, 1, 1,
-0.91501, -0.09981935, -1.935105, 1, 1, 1, 1, 1,
-0.9099687, -0.3786146, -3.260116, 1, 1, 1, 1, 1,
-0.9085886, 1.109782, -0.694639, 1, 1, 1, 1, 1,
-0.9036387, 0.6943013, -1.03051, 1, 1, 1, 1, 1,
-0.9019259, 0.2184421, -1.425688, 1, 1, 1, 1, 1,
-0.9005992, 0.2332763, -2.373214, 1, 1, 1, 1, 1,
-0.8955107, -0.09341464, -3.877026, 1, 1, 1, 1, 1,
-0.8922701, -1.00774, -1.649661, 1, 1, 1, 1, 1,
-0.8918837, 0.3335728, -0.4433179, 1, 1, 1, 1, 1,
-0.8909931, -0.8014272, -1.314992, 0, 0, 1, 1, 1,
-0.8895525, 0.7798358, -0.2608892, 1, 0, 0, 1, 1,
-0.886617, -0.1946772, -2.221185, 1, 0, 0, 1, 1,
-0.8798685, 0.2702711, 0.7517794, 1, 0, 0, 1, 1,
-0.8760842, -1.7861, -5.057994, 1, 0, 0, 1, 1,
-0.8735462, 0.2077094, -2.26729, 1, 0, 0, 1, 1,
-0.8733675, -0.4007881, -2.332235, 0, 0, 0, 1, 1,
-0.8731446, -0.2950365, -2.458288, 0, 0, 0, 1, 1,
-0.8724557, 0.5241879, -0.3203297, 0, 0, 0, 1, 1,
-0.871408, 0.3583191, 0.1821195, 0, 0, 0, 1, 1,
-0.8685538, 0.9175178, -0.4605401, 0, 0, 0, 1, 1,
-0.8658535, 1.865446, 0.6367345, 0, 0, 0, 1, 1,
-0.863342, -0.7454962, -0.1041342, 0, 0, 0, 1, 1,
-0.8622324, 0.9383447, -0.06654961, 1, 1, 1, 1, 1,
-0.8588155, -0.4001368, -3.192313, 1, 1, 1, 1, 1,
-0.8580019, -0.2391247, -2.843422, 1, 1, 1, 1, 1,
-0.8575335, 0.6877452, -0.483928, 1, 1, 1, 1, 1,
-0.854504, 0.5835729, -2.097185, 1, 1, 1, 1, 1,
-0.8497481, 1.32182, -1.158749, 1, 1, 1, 1, 1,
-0.8452435, -0.6791264, -3.044262, 1, 1, 1, 1, 1,
-0.8382918, -0.1595062, -2.713835, 1, 1, 1, 1, 1,
-0.8371087, -0.5147169, -2.587657, 1, 1, 1, 1, 1,
-0.8366965, 1.081232, -0.7663447, 1, 1, 1, 1, 1,
-0.831353, 0.5202734, -0.4532256, 1, 1, 1, 1, 1,
-0.8291675, 0.02427651, -3.345729, 1, 1, 1, 1, 1,
-0.8234361, -0.329605, -1.892123, 1, 1, 1, 1, 1,
-0.8197407, 0.4954292, 0.1103706, 1, 1, 1, 1, 1,
-0.8122565, 1.044882, 1.013311, 1, 1, 1, 1, 1,
-0.8113599, 0.6284094, -2.307978, 0, 0, 1, 1, 1,
-0.8106878, 1.446445, 0.9126781, 1, 0, 0, 1, 1,
-0.8062661, 0.08221118, -1.910398, 1, 0, 0, 1, 1,
-0.8061826, -0.2918717, -3.991199, 1, 0, 0, 1, 1,
-0.8042477, 0.847501, -1.170108, 1, 0, 0, 1, 1,
-0.8006218, 0.4816859, -0.1915405, 1, 0, 0, 1, 1,
-0.7911303, 0.2677679, -2.932204, 0, 0, 0, 1, 1,
-0.7904307, -0.4364848, -2.619834, 0, 0, 0, 1, 1,
-0.7830907, -0.7648748, -1.485961, 0, 0, 0, 1, 1,
-0.7799917, -0.4373225, -2.682492, 0, 0, 0, 1, 1,
-0.778818, 0.490603, 0.2122902, 0, 0, 0, 1, 1,
-0.7778857, 0.1774131, -0.3826265, 0, 0, 0, 1, 1,
-0.7742415, 2.932092, -2.788312, 0, 0, 0, 1, 1,
-0.7727969, 0.4707801, -0.4802462, 1, 1, 1, 1, 1,
-0.7590897, 1.711535, 0.03759075, 1, 1, 1, 1, 1,
-0.7559809, -1.16539, -3.187481, 1, 1, 1, 1, 1,
-0.7542338, -0.3142629, -2.786213, 1, 1, 1, 1, 1,
-0.7435699, -0.6758139, -1.992035, 1, 1, 1, 1, 1,
-0.7365505, 0.3929217, -1.664419, 1, 1, 1, 1, 1,
-0.7304661, 0.7306941, -1.05804, 1, 1, 1, 1, 1,
-0.7264531, 1.560365, 0.1532844, 1, 1, 1, 1, 1,
-0.7264014, -2.198499, -2.134672, 1, 1, 1, 1, 1,
-0.7226271, -0.06768673, -2.159511, 1, 1, 1, 1, 1,
-0.7139727, 0.2912903, -1.008894, 1, 1, 1, 1, 1,
-0.7105268, 1.65667, 0.9155116, 1, 1, 1, 1, 1,
-0.7094364, -0.08388665, -3.034835, 1, 1, 1, 1, 1,
-0.7028735, 0.1339519, -2.215353, 1, 1, 1, 1, 1,
-0.7020277, -1.082217, -2.619171, 1, 1, 1, 1, 1,
-0.7019945, -0.03086463, -0.02592714, 0, 0, 1, 1, 1,
-0.7009345, 0.644067, -1.290374, 1, 0, 0, 1, 1,
-0.6970529, 1.06709, -1.844341, 1, 0, 0, 1, 1,
-0.6920505, -0.2301001, -2.003866, 1, 0, 0, 1, 1,
-0.6883502, 0.5356846, -2.038482, 1, 0, 0, 1, 1,
-0.6865246, -1.585463, -2.865676, 1, 0, 0, 1, 1,
-0.6858897, -0.5025626, -1.35858, 0, 0, 0, 1, 1,
-0.685717, 0.6748068, -0.954562, 0, 0, 0, 1, 1,
-0.6850022, 0.9077576, -1.735139, 0, 0, 0, 1, 1,
-0.6832964, 2.177308, 0.6631995, 0, 0, 0, 1, 1,
-0.6772361, -0.005895937, -0.8301462, 0, 0, 0, 1, 1,
-0.6697861, 0.8590422, -3.184422, 0, 0, 0, 1, 1,
-0.6695649, 2.170654, 0.6758702, 0, 0, 0, 1, 1,
-0.6661468, 1.085004, -0.7259023, 1, 1, 1, 1, 1,
-0.6637825, 1.339607, -0.0393117, 1, 1, 1, 1, 1,
-0.6598235, 0.1161492, -2.900758, 1, 1, 1, 1, 1,
-0.659491, 0.7045883, -1.807805, 1, 1, 1, 1, 1,
-0.6557123, -0.5474229, -1.517776, 1, 1, 1, 1, 1,
-0.6546648, -0.8630311, -4.441431, 1, 1, 1, 1, 1,
-0.646226, 0.1389465, 1.648748, 1, 1, 1, 1, 1,
-0.6460385, 1.370618, -2.038337, 1, 1, 1, 1, 1,
-0.6446772, 1.263405, -1.479767, 1, 1, 1, 1, 1,
-0.6443337, 0.5009547, -0.9610091, 1, 1, 1, 1, 1,
-0.6409883, -1.333112, -1.075641, 1, 1, 1, 1, 1,
-0.6383232, 2.107641, 0.1679729, 1, 1, 1, 1, 1,
-0.6382565, 0.2708192, -0.6441419, 1, 1, 1, 1, 1,
-0.6358154, -1.067405, -2.427078, 1, 1, 1, 1, 1,
-0.6346866, 0.1077192, -2.49037, 1, 1, 1, 1, 1,
-0.6288446, 1.175139, -1.161256, 0, 0, 1, 1, 1,
-0.626467, -2.024557, -2.072186, 1, 0, 0, 1, 1,
-0.625903, -0.08597776, -0.2913976, 1, 0, 0, 1, 1,
-0.6176902, -0.4798193, -2.187129, 1, 0, 0, 1, 1,
-0.6154534, -0.4884127, -3.714763, 1, 0, 0, 1, 1,
-0.6133419, 0.4433944, 0.4310087, 1, 0, 0, 1, 1,
-0.6093778, 0.09695144, -1.340234, 0, 0, 0, 1, 1,
-0.6068618, 0.4805436, -1.281382, 0, 0, 0, 1, 1,
-0.6030481, -1.013333, -2.766437, 0, 0, 0, 1, 1,
-0.6004673, 1.14729, -1.07348, 0, 0, 0, 1, 1,
-0.5972941, -0.9797706, -2.251347, 0, 0, 0, 1, 1,
-0.5951737, -1.166827, -2.743767, 0, 0, 0, 1, 1,
-0.5885565, -0.3365836, -3.354215, 0, 0, 0, 1, 1,
-0.5831794, -0.2036632, -3.075968, 1, 1, 1, 1, 1,
-0.580998, 0.08694886, -1.099619, 1, 1, 1, 1, 1,
-0.5808834, -0.6639078, -3.346046, 1, 1, 1, 1, 1,
-0.5769929, 0.8327064, -1.598228, 1, 1, 1, 1, 1,
-0.5739524, -0.08420538, -2.562659, 1, 1, 1, 1, 1,
-0.5738808, -0.193399, -2.18057, 1, 1, 1, 1, 1,
-0.5708353, 0.5554723, -2.010154, 1, 1, 1, 1, 1,
-0.5645168, 0.4821063, -1.288058, 1, 1, 1, 1, 1,
-0.5625815, 2.253045, -0.03085544, 1, 1, 1, 1, 1,
-0.560987, 1.401127, 1.234948, 1, 1, 1, 1, 1,
-0.5531766, -1.326432, -3.411136, 1, 1, 1, 1, 1,
-0.5530409, -0.3475007, -1.138034, 1, 1, 1, 1, 1,
-0.547163, -1.625097, -1.722064, 1, 1, 1, 1, 1,
-0.5461318, 0.7646349, 0.6056937, 1, 1, 1, 1, 1,
-0.5377719, 1.266052, 0.8769091, 1, 1, 1, 1, 1,
-0.5331132, 2.905985, -0.04798732, 0, 0, 1, 1, 1,
-0.5227833, -1.326853, -2.549229, 1, 0, 0, 1, 1,
-0.5148915, 0.5340712, -1.221098, 1, 0, 0, 1, 1,
-0.513994, -0.9988719, -2.703776, 1, 0, 0, 1, 1,
-0.511703, -0.1133451, -3.369279, 1, 0, 0, 1, 1,
-0.5108843, 0.8068382, -0.7292708, 1, 0, 0, 1, 1,
-0.5100308, -1.154442, -2.243552, 0, 0, 0, 1, 1,
-0.5098511, -3.479418, -1.433118, 0, 0, 0, 1, 1,
-0.5085167, 0.3902336, -0.8456948, 0, 0, 0, 1, 1,
-0.5061637, -0.5871198, -2.875641, 0, 0, 0, 1, 1,
-0.5044773, 0.5003092, -1.258377, 0, 0, 0, 1, 1,
-0.5036808, -0.3915827, -2.541217, 0, 0, 0, 1, 1,
-0.5026585, -2.374311, -3.819501, 0, 0, 0, 1, 1,
-0.4969315, 1.43548, -1.311601, 1, 1, 1, 1, 1,
-0.4951086, 0.2792708, -0.8138942, 1, 1, 1, 1, 1,
-0.4948829, -1.435734, -4.175216, 1, 1, 1, 1, 1,
-0.494212, 0.2268285, -2.87411, 1, 1, 1, 1, 1,
-0.4843739, -1.178426, -3.421396, 1, 1, 1, 1, 1,
-0.4828289, 1.474872, -0.3753629, 1, 1, 1, 1, 1,
-0.4816594, 0.6396059, -1.976981, 1, 1, 1, 1, 1,
-0.4815, -0.7556726, -1.182925, 1, 1, 1, 1, 1,
-0.4801928, -0.6291459, -2.056854, 1, 1, 1, 1, 1,
-0.479671, 0.2123393, -0.7615104, 1, 1, 1, 1, 1,
-0.4766622, -0.3249785, -1.825239, 1, 1, 1, 1, 1,
-0.4672677, 0.2000483, -2.108979, 1, 1, 1, 1, 1,
-0.4663678, -0.1891651, -0.7563766, 1, 1, 1, 1, 1,
-0.461174, 0.4671441, 0.6452768, 1, 1, 1, 1, 1,
-0.4604225, -1.939502, -4.680203, 1, 1, 1, 1, 1,
-0.4602631, -1.023538, -2.295202, 0, 0, 1, 1, 1,
-0.4589943, 0.3607126, -0.3309772, 1, 0, 0, 1, 1,
-0.4582169, -0.6087305, -1.537226, 1, 0, 0, 1, 1,
-0.456757, 0.02507334, -1.064526, 1, 0, 0, 1, 1,
-0.4536423, -1.111619, -1.537482, 1, 0, 0, 1, 1,
-0.4525365, -1.082554, -0.9834034, 1, 0, 0, 1, 1,
-0.4500223, -0.4080674, -3.781232, 0, 0, 0, 1, 1,
-0.447613, -0.50751, -2.451478, 0, 0, 0, 1, 1,
-0.4473326, 0.1759558, -1.51873, 0, 0, 0, 1, 1,
-0.4466167, -1.239282, -4.087316, 0, 0, 0, 1, 1,
-0.4459696, -0.1969927, -0.31196, 0, 0, 0, 1, 1,
-0.4419688, -0.6842171, -4.034375, 0, 0, 0, 1, 1,
-0.4361281, 0.7770296, -1.590851, 0, 0, 0, 1, 1,
-0.4339444, -0.5712983, -1.719391, 1, 1, 1, 1, 1,
-0.4298882, -0.1147896, -2.437894, 1, 1, 1, 1, 1,
-0.4288971, 0.03387925, -1.669003, 1, 1, 1, 1, 1,
-0.4284775, 1.577205, -2.014576, 1, 1, 1, 1, 1,
-0.4256635, -1.612695, -2.389886, 1, 1, 1, 1, 1,
-0.4211491, -0.8249975, -2.962075, 1, 1, 1, 1, 1,
-0.4195843, 0.4256725, -0.5216085, 1, 1, 1, 1, 1,
-0.4146242, 0.4801039, -0.6984975, 1, 1, 1, 1, 1,
-0.4091849, 0.9968554, -2.047075, 1, 1, 1, 1, 1,
-0.4087349, -0.9127133, -1.966463, 1, 1, 1, 1, 1,
-0.403299, -0.8935658, -2.948629, 1, 1, 1, 1, 1,
-0.4005204, -1.384219, -1.764457, 1, 1, 1, 1, 1,
-0.3991326, 0.235057, 0.3933724, 1, 1, 1, 1, 1,
-0.3980581, -0.177596, -4.25707, 1, 1, 1, 1, 1,
-0.3918579, 0.2253259, -0.2180729, 1, 1, 1, 1, 1,
-0.3891237, 0.3144636, -1.923802, 0, 0, 1, 1, 1,
-0.3876908, 0.4254741, 1.19434, 1, 0, 0, 1, 1,
-0.385248, 0.2450593, -0.9127197, 1, 0, 0, 1, 1,
-0.3847714, 2.254387, -0.07965902, 1, 0, 0, 1, 1,
-0.3831728, -0.7298495, -4.291622, 1, 0, 0, 1, 1,
-0.3812556, 0.06748737, -1.820639, 1, 0, 0, 1, 1,
-0.3758917, 1.536131, 0.6431812, 0, 0, 0, 1, 1,
-0.3730817, 0.1352212, -1.429852, 0, 0, 0, 1, 1,
-0.369902, -0.3278274, -1.877481, 0, 0, 0, 1, 1,
-0.3646762, -0.1174651, -0.3228886, 0, 0, 0, 1, 1,
-0.3623191, -0.7180746, -4.20507, 0, 0, 0, 1, 1,
-0.3614832, -0.7867317, -1.887982, 0, 0, 0, 1, 1,
-0.3559237, -0.323798, -1.470477, 0, 0, 0, 1, 1,
-0.3536485, -0.6418549, -2.02931, 1, 1, 1, 1, 1,
-0.3522047, -0.4378478, -1.708758, 1, 1, 1, 1, 1,
-0.3477798, 0.7189594, -1.728079, 1, 1, 1, 1, 1,
-0.3457128, -0.9875442, -2.409317, 1, 1, 1, 1, 1,
-0.3444578, 0.1345017, -1.102804, 1, 1, 1, 1, 1,
-0.3439222, 1.015005, 1.337787, 1, 1, 1, 1, 1,
-0.341082, -0.356356, -2.471277, 1, 1, 1, 1, 1,
-0.3395251, 0.6319574, -1.77918, 1, 1, 1, 1, 1,
-0.3371931, -0.7131042, -2.835912, 1, 1, 1, 1, 1,
-0.3370647, 1.131019, -0.2660861, 1, 1, 1, 1, 1,
-0.3326926, -1.588025, -4.790566, 1, 1, 1, 1, 1,
-0.3296817, 0.03405364, -0.8260234, 1, 1, 1, 1, 1,
-0.3159366, 1.152346, 0.3249053, 1, 1, 1, 1, 1,
-0.3076524, -0.1031577, -0.1430972, 1, 1, 1, 1, 1,
-0.3066089, 0.1414495, -0.455579, 1, 1, 1, 1, 1,
-0.3059018, -2.054286, -2.675485, 0, 0, 1, 1, 1,
-0.3047023, -1.903305, -2.140819, 1, 0, 0, 1, 1,
-0.3011224, -0.5866337, -3.677362, 1, 0, 0, 1, 1,
-0.2983214, -0.5319926, -1.202286, 1, 0, 0, 1, 1,
-0.2962797, -0.4734054, -1.608766, 1, 0, 0, 1, 1,
-0.2944164, -0.01412903, -1.61625, 1, 0, 0, 1, 1,
-0.2928126, -1.712948, -2.825073, 0, 0, 0, 1, 1,
-0.2908201, -0.9454488, -1.76514, 0, 0, 0, 1, 1,
-0.288311, -0.4115634, -2.763933, 0, 0, 0, 1, 1,
-0.283042, 0.380579, -1.29987, 0, 0, 0, 1, 1,
-0.281774, -0.797206, -5.278379, 0, 0, 0, 1, 1,
-0.2724784, 1.099126, -0.9359409, 0, 0, 0, 1, 1,
-0.2719665, 0.002679468, -0.9285206, 0, 0, 0, 1, 1,
-0.2706072, -1.174767, -3.279182, 1, 1, 1, 1, 1,
-0.2591691, 1.144809, -0.9524571, 1, 1, 1, 1, 1,
-0.2573485, -0.08770697, -1.728496, 1, 1, 1, 1, 1,
-0.2556538, 0.2613018, -1.766462, 1, 1, 1, 1, 1,
-0.2550269, 2.046161, -0.5737677, 1, 1, 1, 1, 1,
-0.2546495, -0.1651503, -3.483277, 1, 1, 1, 1, 1,
-0.2543307, -0.3473212, -1.798902, 1, 1, 1, 1, 1,
-0.2463208, 0.180737, -0.4803528, 1, 1, 1, 1, 1,
-0.246035, -0.5824558, -2.211024, 1, 1, 1, 1, 1,
-0.2459519, 0.08380159, -1.036646, 1, 1, 1, 1, 1,
-0.2449976, 1.683533, -0.3697108, 1, 1, 1, 1, 1,
-0.2417821, -0.5660305, -2.149261, 1, 1, 1, 1, 1,
-0.2385458, -1.949677, -3.010605, 1, 1, 1, 1, 1,
-0.2385027, -0.7684905, -3.905355, 1, 1, 1, 1, 1,
-0.2359914, 0.1331162, -0.423228, 1, 1, 1, 1, 1,
-0.2321483, -0.8098047, -4.762597, 0, 0, 1, 1, 1,
-0.2305375, 0.4978647, -0.4526633, 1, 0, 0, 1, 1,
-0.2300023, -0.8522336, -0.8440502, 1, 0, 0, 1, 1,
-0.2175795, -0.1829029, -2.24655, 1, 0, 0, 1, 1,
-0.2167609, -1.01363, -2.619291, 1, 0, 0, 1, 1,
-0.2163535, -0.6674073, -2.631016, 1, 0, 0, 1, 1,
-0.2132963, -0.2324746, -1.295094, 0, 0, 0, 1, 1,
-0.2123344, 1.272013, -0.07815247, 0, 0, 0, 1, 1,
-0.210032, 1.941675, -0.2765133, 0, 0, 0, 1, 1,
-0.2082522, -0.5120177, -2.355654, 0, 0, 0, 1, 1,
-0.2062556, -1.574967, -3.296525, 0, 0, 0, 1, 1,
-0.2058023, -1.196647, -2.903047, 0, 0, 0, 1, 1,
-0.2013029, 0.5618824, 0.4877973, 0, 0, 0, 1, 1,
-0.1964178, 1.691531, 0.4356643, 1, 1, 1, 1, 1,
-0.1963703, -1.55169, -3.293918, 1, 1, 1, 1, 1,
-0.1948192, 1.508521, -1.43133, 1, 1, 1, 1, 1,
-0.1943863, 1.446472, 0.1028911, 1, 1, 1, 1, 1,
-0.1918949, -0.5132023, -3.146108, 1, 1, 1, 1, 1,
-0.1913521, 0.6848685, -0.6659202, 1, 1, 1, 1, 1,
-0.189386, -0.1423211, -2.980172, 1, 1, 1, 1, 1,
-0.1853027, -0.9742334, -3.463352, 1, 1, 1, 1, 1,
-0.1848524, -0.3925513, -1.327932, 1, 1, 1, 1, 1,
-0.1843462, -0.9134921, -1.790432, 1, 1, 1, 1, 1,
-0.183704, 0.4630133, -1.442216, 1, 1, 1, 1, 1,
-0.1785332, 1.796291, 0.8573206, 1, 1, 1, 1, 1,
-0.1784609, -0.5560807, -3.293067, 1, 1, 1, 1, 1,
-0.1747259, 0.1639102, -0.7631519, 1, 1, 1, 1, 1,
-0.1715901, -0.6445275, -3.645195, 1, 1, 1, 1, 1,
-0.1703054, 0.5203109, 0.3059723, 0, 0, 1, 1, 1,
-0.1686854, -0.5954418, -3.138017, 1, 0, 0, 1, 1,
-0.1664907, -0.8219793, -2.905871, 1, 0, 0, 1, 1,
-0.1634967, 1.043966, -2.260739, 1, 0, 0, 1, 1,
-0.1595453, -0.1773262, -0.953427, 1, 0, 0, 1, 1,
-0.1575848, -0.2818434, -1.705975, 1, 0, 0, 1, 1,
-0.1556059, 0.0531195, -1.902102, 0, 0, 0, 1, 1,
-0.1555032, -1.046976, -4.42543, 0, 0, 0, 1, 1,
-0.1529769, 0.02438504, -0.2474551, 0, 0, 0, 1, 1,
-0.1499402, 0.1632886, -2.222068, 0, 0, 0, 1, 1,
-0.1429539, -0.6278399, -4.75244, 0, 0, 0, 1, 1,
-0.1425511, -0.1158255, -1.163431, 0, 0, 0, 1, 1,
-0.1401952, -0.07996675, -1.869285, 0, 0, 0, 1, 1,
-0.133736, 0.7703124, 0.7831578, 1, 1, 1, 1, 1,
-0.1269969, 0.6333284, -0.1576758, 1, 1, 1, 1, 1,
-0.1263818, -0.9502547, -1.942245, 1, 1, 1, 1, 1,
-0.126307, 0.5819693, -0.8563591, 1, 1, 1, 1, 1,
-0.1243168, 1.416059, -0.4871528, 1, 1, 1, 1, 1,
-0.1225919, 1.202925, -0.05006021, 1, 1, 1, 1, 1,
-0.120953, -1.296022, -2.329025, 1, 1, 1, 1, 1,
-0.1201514, -0.5576063, -2.385163, 1, 1, 1, 1, 1,
-0.1194216, -0.0439479, -2.489362, 1, 1, 1, 1, 1,
-0.1172047, -0.5064474, -0.9888212, 1, 1, 1, 1, 1,
-0.1106451, 1.537357, 0.2340859, 1, 1, 1, 1, 1,
-0.103856, -1.370747, -2.009878, 1, 1, 1, 1, 1,
-0.1018946, 0.5393886, -0.136908, 1, 1, 1, 1, 1,
-0.1015121, -0.9362286, -2.789121, 1, 1, 1, 1, 1,
-0.09723759, -0.7586225, -2.00517, 1, 1, 1, 1, 1,
-0.09679201, 0.04909103, -2.117821, 0, 0, 1, 1, 1,
-0.09440654, 1.255569, -0.4648158, 1, 0, 0, 1, 1,
-0.09247318, -0.3309224, -1.866659, 1, 0, 0, 1, 1,
-0.08521001, 0.05852924, -0.2473626, 1, 0, 0, 1, 1,
-0.07783814, -1.369156, -4.384269, 1, 0, 0, 1, 1,
-0.07579786, 1.094677, -0.425775, 1, 0, 0, 1, 1,
-0.07577204, -0.8889692, -5.365479, 0, 0, 0, 1, 1,
-0.06578743, -2.287971, -3.574044, 0, 0, 0, 1, 1,
-0.06446967, 0.5796461, 0.2093387, 0, 0, 0, 1, 1,
-0.06252505, 0.5531163, -0.152966, 0, 0, 0, 1, 1,
-0.06178368, 2.194739, 0.988601, 0, 0, 0, 1, 1,
-0.05666313, 1.902492, 0.5625516, 0, 0, 0, 1, 1,
-0.05580178, -0.4944811, -4.851973, 0, 0, 0, 1, 1,
-0.05317675, -0.2799816, -3.330266, 1, 1, 1, 1, 1,
-0.05059114, -0.4161578, -1.63989, 1, 1, 1, 1, 1,
-0.04973582, 0.1181568, -0.7898703, 1, 1, 1, 1, 1,
-0.0393314, -0.04443716, -3.428792, 1, 1, 1, 1, 1,
-0.03469792, -1.467824, -3.463439, 1, 1, 1, 1, 1,
-0.03194768, 0.02234801, -1.694794, 1, 1, 1, 1, 1,
-0.02964812, 0.7593321, 0.205484, 1, 1, 1, 1, 1,
-0.02909678, -0.2633105, -2.818256, 1, 1, 1, 1, 1,
-0.02648243, 0.08226158, -1.154246, 1, 1, 1, 1, 1,
-0.02629786, -1.60745, -3.046894, 1, 1, 1, 1, 1,
-0.02244909, 1.42651, -0.4003852, 1, 1, 1, 1, 1,
-0.02073068, 0.4931806, -0.03587035, 1, 1, 1, 1, 1,
-0.01953506, -0.7523776, -2.933979, 1, 1, 1, 1, 1,
-0.01943748, -0.6898754, -1.145285, 1, 1, 1, 1, 1,
-0.01753723, 0.009679937, -0.7712823, 1, 1, 1, 1, 1,
-0.01667364, 0.1788322, 1.300428, 0, 0, 1, 1, 1,
-0.01654889, -0.3234704, -4.94946, 1, 0, 0, 1, 1,
-0.01531348, -0.605554, -5.635303, 1, 0, 0, 1, 1,
-0.01241553, 1.08295, -2.086741, 1, 0, 0, 1, 1,
-0.01189097, 0.6796909, -1.368193, 1, 0, 0, 1, 1,
-0.00100182, 1.068317, 1.38107, 1, 0, 0, 1, 1,
-0.0005360513, 1.018451, 1.39305, 0, 0, 0, 1, 1,
0.003696309, 0.7242458, -0.9941967, 0, 0, 0, 1, 1,
0.008774293, 1.066919, 0.1349641, 0, 0, 0, 1, 1,
0.01541956, 0.9643943, -0.5967273, 0, 0, 0, 1, 1,
0.01636144, -1.111912, 3.666648, 0, 0, 0, 1, 1,
0.01778824, -0.1528822, 2.248862, 0, 0, 0, 1, 1,
0.02049125, -0.252029, 2.939984, 0, 0, 0, 1, 1,
0.02086601, -1.136172, 2.79834, 1, 1, 1, 1, 1,
0.02174211, 0.2938812, 0.7646267, 1, 1, 1, 1, 1,
0.02255051, -0.7413543, 3.964787, 1, 1, 1, 1, 1,
0.02670425, -2.149589, 3.003757, 1, 1, 1, 1, 1,
0.02690502, -0.7411484, 3.554559, 1, 1, 1, 1, 1,
0.0295363, 0.1794478, 1.670493, 1, 1, 1, 1, 1,
0.02967267, 2.183247, -1.507084, 1, 1, 1, 1, 1,
0.03242096, 0.624684, 0.7350044, 1, 1, 1, 1, 1,
0.03302401, 1.05817, -0.2065987, 1, 1, 1, 1, 1,
0.03919337, -0.1331463, 2.644614, 1, 1, 1, 1, 1,
0.04151605, 0.5781698, -0.2525254, 1, 1, 1, 1, 1,
0.04152394, 0.9470622, 0.4273866, 1, 1, 1, 1, 1,
0.04557125, -1.921682, 2.148966, 1, 1, 1, 1, 1,
0.04562705, -0.6100653, 2.694904, 1, 1, 1, 1, 1,
0.04607577, 1.153251, 0.7636223, 1, 1, 1, 1, 1,
0.0491211, 0.5227305, 0.2486441, 0, 0, 1, 1, 1,
0.04922126, -0.5916492, 6.390853, 1, 0, 0, 1, 1,
0.05098674, 1.102818, -0.05913495, 1, 0, 0, 1, 1,
0.05124435, -1.103686, 3.436155, 1, 0, 0, 1, 1,
0.05270341, 0.3020259, 0.4239733, 1, 0, 0, 1, 1,
0.06258854, -0.4384938, 2.614949, 1, 0, 0, 1, 1,
0.06302851, 0.2895163, 1.429151, 0, 0, 0, 1, 1,
0.06724211, 0.08448634, 0.1184765, 0, 0, 0, 1, 1,
0.07448731, 2.19839, -0.8249022, 0, 0, 0, 1, 1,
0.07511689, -0.3612027, 2.837962, 0, 0, 0, 1, 1,
0.07887089, -0.3613328, 2.39615, 0, 0, 0, 1, 1,
0.07974975, -1.013932, 2.617003, 0, 0, 0, 1, 1,
0.08091076, -1.689954, 4.529451, 0, 0, 0, 1, 1,
0.09023627, -1.193493, 2.537111, 1, 1, 1, 1, 1,
0.0909489, 0.2066454, 0.2856892, 1, 1, 1, 1, 1,
0.09121714, 0.7222228, -1.280641, 1, 1, 1, 1, 1,
0.09657915, 0.09273952, 1.45313, 1, 1, 1, 1, 1,
0.09707859, 0.1074555, 0.4773131, 1, 1, 1, 1, 1,
0.09739609, -0.6976228, 2.474265, 1, 1, 1, 1, 1,
0.1000342, 1.148816, 1.314716, 1, 1, 1, 1, 1,
0.1001391, 0.5518854, -1.292255, 1, 1, 1, 1, 1,
0.1010073, -1.605618, 2.018017, 1, 1, 1, 1, 1,
0.1033743, -1.477399, 3.758217, 1, 1, 1, 1, 1,
0.1041568, -0.354614, 4.19783, 1, 1, 1, 1, 1,
0.1057787, -0.3785815, 4.131893, 1, 1, 1, 1, 1,
0.1072839, 0.9355327, -0.1658064, 1, 1, 1, 1, 1,
0.111967, -1.060474, 2.909458, 1, 1, 1, 1, 1,
0.1167411, 1.34961, 0.09525076, 1, 1, 1, 1, 1,
0.1185723, 0.1982087, 0.1094226, 0, 0, 1, 1, 1,
0.1253865, 0.768937, -1.82308, 1, 0, 0, 1, 1,
0.1281428, 0.1264776, 1.739054, 1, 0, 0, 1, 1,
0.1307968, -0.1681483, 2.873258, 1, 0, 0, 1, 1,
0.1313168, -1.774692, 4.876456, 1, 0, 0, 1, 1,
0.131679, 0.8931353, 1.171651, 1, 0, 0, 1, 1,
0.1361154, -1.528242, 2.563146, 0, 0, 0, 1, 1,
0.1406182, -0.6814582, 3.049659, 0, 0, 0, 1, 1,
0.1426234, -1.280189, 3.204355, 0, 0, 0, 1, 1,
0.1545222, 3.28053, -1.403996, 0, 0, 0, 1, 1,
0.1587616, 1.535279, -0.2609776, 0, 0, 0, 1, 1,
0.1589324, -0.2424019, 2.871838, 0, 0, 0, 1, 1,
0.1613487, 0.494316, 0.1372014, 0, 0, 0, 1, 1,
0.1650263, 0.3271778, -2.758804, 1, 1, 1, 1, 1,
0.1674443, 0.1477782, -0.7745944, 1, 1, 1, 1, 1,
0.1767538, 1.401317, 1.540946, 1, 1, 1, 1, 1,
0.1780476, -2.032754, 0.7785401, 1, 1, 1, 1, 1,
0.180715, 1.239496, 0.3585658, 1, 1, 1, 1, 1,
0.1816116, 0.1546564, 0.4705351, 1, 1, 1, 1, 1,
0.1817318, 2.57007, -0.1140105, 1, 1, 1, 1, 1,
0.1834034, -0.5562291, 2.459384, 1, 1, 1, 1, 1,
0.183675, -1.391123, 2.481229, 1, 1, 1, 1, 1,
0.1839902, -1.597382, 3.455156, 1, 1, 1, 1, 1,
0.1871374, 2.173564, 0.8510289, 1, 1, 1, 1, 1,
0.1873833, -0.2263188, 1.774531, 1, 1, 1, 1, 1,
0.1912725, 1.923778, 0.8478668, 1, 1, 1, 1, 1,
0.1913734, -0.5957121, 2.127163, 1, 1, 1, 1, 1,
0.1923694, -0.3204129, 2.190452, 1, 1, 1, 1, 1,
0.1993903, 0.4489582, 1.040127, 0, 0, 1, 1, 1,
0.2044742, -0.8088619, 2.978045, 1, 0, 0, 1, 1,
0.2045468, 0.1713434, 0.4414109, 1, 0, 0, 1, 1,
0.2050767, 1.762502, 1.036217, 1, 0, 0, 1, 1,
0.2101051, -0.634127, 2.651655, 1, 0, 0, 1, 1,
0.2106977, -0.08277529, 3.417969, 1, 0, 0, 1, 1,
0.2145451, 1.637877, -0.5785974, 0, 0, 0, 1, 1,
0.215117, -1.713024, 2.964462, 0, 0, 0, 1, 1,
0.2181988, -1.578205, 2.26593, 0, 0, 0, 1, 1,
0.220204, -0.6531261, 1.815554, 0, 0, 0, 1, 1,
0.2227235, -1.03238, 1.687574, 0, 0, 0, 1, 1,
0.2263826, 0.126217, 0.8311632, 0, 0, 0, 1, 1,
0.2266241, -0.2677891, 3.522931, 0, 0, 0, 1, 1,
0.2375872, -0.8429763, 3.121148, 1, 1, 1, 1, 1,
0.2408297, -0.6493755, 3.792818, 1, 1, 1, 1, 1,
0.2446204, -1.495168, 5.510552, 1, 1, 1, 1, 1,
0.2455704, -0.2849587, 2.897784, 1, 1, 1, 1, 1,
0.2461132, 0.6709576, 0.07523514, 1, 1, 1, 1, 1,
0.2473547, -0.14322, 4.645306, 1, 1, 1, 1, 1,
0.2609631, 0.2198918, -0.5176257, 1, 1, 1, 1, 1,
0.2702154, 0.1045257, -0.8309786, 1, 1, 1, 1, 1,
0.2723828, -0.4391054, 1.712344, 1, 1, 1, 1, 1,
0.2756006, 0.8492693, 0.1770246, 1, 1, 1, 1, 1,
0.2809937, 0.7199022, 0.1044548, 1, 1, 1, 1, 1,
0.2811285, 0.7493021, -0.0970532, 1, 1, 1, 1, 1,
0.291055, 0.7023094, 0.6039741, 1, 1, 1, 1, 1,
0.2921132, 0.4528058, 0.6087059, 1, 1, 1, 1, 1,
0.2945073, -0.1041107, 1.410437, 1, 1, 1, 1, 1,
0.2991402, -1.757186, 3.102934, 0, 0, 1, 1, 1,
0.2992629, 0.1558237, 2.156727, 1, 0, 0, 1, 1,
0.2998355, -0.1136141, 2.075827, 1, 0, 0, 1, 1,
0.3028867, 0.1158229, 0.3757659, 1, 0, 0, 1, 1,
0.3036659, -0.5811317, 1.074909, 1, 0, 0, 1, 1,
0.3088974, 0.2068294, -0.3812898, 1, 0, 0, 1, 1,
0.3106171, 0.5450222, 1.354183, 0, 0, 0, 1, 1,
0.3120831, 0.5560044, 0.6130672, 0, 0, 0, 1, 1,
0.3124783, -0.230746, 1.127745, 0, 0, 0, 1, 1,
0.3151217, -1.031326, 3.29742, 0, 0, 0, 1, 1,
0.3215726, 0.9722776, 0.8970102, 0, 0, 0, 1, 1,
0.3225797, -0.8534901, 2.711918, 0, 0, 0, 1, 1,
0.3232231, -1.924873, 2.046138, 0, 0, 0, 1, 1,
0.3239987, 0.04297813, 0.7998466, 1, 1, 1, 1, 1,
0.32479, 0.1189489, 1.995852, 1, 1, 1, 1, 1,
0.3251163, -0.4451431, 1.366157, 1, 1, 1, 1, 1,
0.3267344, 0.2082803, -0.1551007, 1, 1, 1, 1, 1,
0.3278812, -1.310724, 4.478312, 1, 1, 1, 1, 1,
0.3284582, -0.2840722, 1.824328, 1, 1, 1, 1, 1,
0.3328197, -0.8234729, 2.96644, 1, 1, 1, 1, 1,
0.3387628, -0.3822077, 2.547119, 1, 1, 1, 1, 1,
0.3462476, -0.2004342, 3.899905, 1, 1, 1, 1, 1,
0.3464818, 0.475397, -1.046685, 1, 1, 1, 1, 1,
0.3510625, -0.9600272, 3.527691, 1, 1, 1, 1, 1,
0.3554906, 0.4479254, 0.942482, 1, 1, 1, 1, 1,
0.3589162, -0.418518, 1.607259, 1, 1, 1, 1, 1,
0.3625871, 0.6100292, -0.4752669, 1, 1, 1, 1, 1,
0.3656841, -0.2754808, 2.609137, 1, 1, 1, 1, 1,
0.3672833, -0.5021055, 3.244582, 0, 0, 1, 1, 1,
0.3686959, -0.1447712, 2.086932, 1, 0, 0, 1, 1,
0.3734867, 0.2474657, 1.388496, 1, 0, 0, 1, 1,
0.3761096, 0.7721109, 0.5752162, 1, 0, 0, 1, 1,
0.377234, -0.7749755, 4.182578, 1, 0, 0, 1, 1,
0.3883429, -1.641778, 2.800053, 1, 0, 0, 1, 1,
0.3932188, -1.292629, 2.194371, 0, 0, 0, 1, 1,
0.4000688, -1.945772, 2.670383, 0, 0, 0, 1, 1,
0.4025079, -1.184751, 3.99312, 0, 0, 0, 1, 1,
0.4038357, 0.2023583, 1.268737, 0, 0, 0, 1, 1,
0.4054457, -1.628678, 2.057491, 0, 0, 0, 1, 1,
0.4062473, -0.7870622, 3.061043, 0, 0, 0, 1, 1,
0.4118734, -0.6457707, -0.04406372, 0, 0, 0, 1, 1,
0.4132328, -0.5389663, 2.07134, 1, 1, 1, 1, 1,
0.4155659, 0.5428838, -0.1144864, 1, 1, 1, 1, 1,
0.4167721, 0.07911373, 2.264659, 1, 1, 1, 1, 1,
0.426695, 0.5681856, 0.9196208, 1, 1, 1, 1, 1,
0.427115, 1.750557, 0.7274606, 1, 1, 1, 1, 1,
0.435114, -0.7225347, 2.987583, 1, 1, 1, 1, 1,
0.4383274, 1.866066, -0.1727757, 1, 1, 1, 1, 1,
0.440933, 0.1023301, 1.817549, 1, 1, 1, 1, 1,
0.4485272, 0.7693639, 0.615512, 1, 1, 1, 1, 1,
0.4505554, 0.5875633, 1.768487, 1, 1, 1, 1, 1,
0.4531632, -1.110386, 2.698838, 1, 1, 1, 1, 1,
0.4540754, 2.075485, -0.6160178, 1, 1, 1, 1, 1,
0.4554837, 1.683579, 0.2658279, 1, 1, 1, 1, 1,
0.4561135, -0.8661316, 3.545109, 1, 1, 1, 1, 1,
0.4586569, -0.3920025, 0.4177445, 1, 1, 1, 1, 1,
0.4639593, -0.7822768, 1.707247, 0, 0, 1, 1, 1,
0.4641857, 0.3644938, 2.181559, 1, 0, 0, 1, 1,
0.4655747, -0.161557, 1.498535, 1, 0, 0, 1, 1,
0.465827, 1.588606, 0.4848483, 1, 0, 0, 1, 1,
0.4700456, -2.211293, 3.821222, 1, 0, 0, 1, 1,
0.4708397, 0.6170154, 2.351761, 1, 0, 0, 1, 1,
0.4720078, 1.000133, 1.235771, 0, 0, 0, 1, 1,
0.4747405, 1.723271, -0.5693391, 0, 0, 0, 1, 1,
0.4763617, 1.23846, 0.5979714, 0, 0, 0, 1, 1,
0.480066, 1.553182, 2.723019, 0, 0, 0, 1, 1,
0.4927746, 0.2739069, 1.73196, 0, 0, 0, 1, 1,
0.4948767, 0.9102813, 2.218957, 0, 0, 0, 1, 1,
0.4966035, 0.1691103, 0.02793568, 0, 0, 0, 1, 1,
0.4973396, 0.4527532, 1.245273, 1, 1, 1, 1, 1,
0.501265, 0.9070539, -1.106602, 1, 1, 1, 1, 1,
0.5036351, -0.8946705, 2.7913, 1, 1, 1, 1, 1,
0.5039314, 0.07638485, 2.833656, 1, 1, 1, 1, 1,
0.5063479, -1.74151, 3.338117, 1, 1, 1, 1, 1,
0.5120785, 0.3848191, 1.181424, 1, 1, 1, 1, 1,
0.5151404, -0.295653, 2.011574, 1, 1, 1, 1, 1,
0.5174032, -0.7280062, 2.090701, 1, 1, 1, 1, 1,
0.5175309, -0.3504587, 2.37738, 1, 1, 1, 1, 1,
0.5176548, -0.1858259, 1.21764, 1, 1, 1, 1, 1,
0.526495, -0.04911058, 0.2900378, 1, 1, 1, 1, 1,
0.5274469, -0.2127159, 0.5025673, 1, 1, 1, 1, 1,
0.52946, 2.051018, 0.5208824, 1, 1, 1, 1, 1,
0.5300418, 1.352707, -0.7455952, 1, 1, 1, 1, 1,
0.5350079, -1.106535, 1.826121, 1, 1, 1, 1, 1,
0.5353121, -0.8062327, 3.166584, 0, 0, 1, 1, 1,
0.5353165, -0.610548, 3.183661, 1, 0, 0, 1, 1,
0.5376413, -0.8297281, 1.970552, 1, 0, 0, 1, 1,
0.539947, 0.6621956, -0.03031103, 1, 0, 0, 1, 1,
0.542549, 0.1312864, 0.5853357, 1, 0, 0, 1, 1,
0.5442596, 0.5208611, 1.546287, 1, 0, 0, 1, 1,
0.5444611, 0.3735003, 1.887785, 0, 0, 0, 1, 1,
0.5496818, -0.2959722, 0.4281932, 0, 0, 0, 1, 1,
0.5510927, 1.358176, -0.1813426, 0, 0, 0, 1, 1,
0.5560837, -0.6451801, 1.505389, 0, 0, 0, 1, 1,
0.5575048, 0.4321619, 0.2655076, 0, 0, 0, 1, 1,
0.5589152, -0.3045205, 2.312877, 0, 0, 0, 1, 1,
0.5594549, 0.02629589, 0.4385064, 0, 0, 0, 1, 1,
0.5633326, 0.5493744, 0.3997552, 1, 1, 1, 1, 1,
0.5636414, -0.3760035, 3.719269, 1, 1, 1, 1, 1,
0.5662324, 0.10841, 2.79122, 1, 1, 1, 1, 1,
0.5697172, 0.5173677, -1.44541, 1, 1, 1, 1, 1,
0.5756713, 0.4599506, 1.43344, 1, 1, 1, 1, 1,
0.5760984, -0.7442766, 3.969933, 1, 1, 1, 1, 1,
0.5787387, -1.360348, 3.90268, 1, 1, 1, 1, 1,
0.5799929, -0.1549836, 1.580969, 1, 1, 1, 1, 1,
0.594492, -0.10228, 2.826032, 1, 1, 1, 1, 1,
0.5961821, 0.04606499, 2.025301, 1, 1, 1, 1, 1,
0.5976796, 0.3720354, 3.342052, 1, 1, 1, 1, 1,
0.6055111, -0.3571142, 2.056577, 1, 1, 1, 1, 1,
0.6057744, -2.384577, 2.133912, 1, 1, 1, 1, 1,
0.6095755, -1.453411, 2.41451, 1, 1, 1, 1, 1,
0.6119707, -0.7900669, 0.6453758, 1, 1, 1, 1, 1,
0.6130764, 0.1569102, -0.1151726, 0, 0, 1, 1, 1,
0.6191665, -0.3412305, 0.9751663, 1, 0, 0, 1, 1,
0.6205664, -0.6242962, 2.823872, 1, 0, 0, 1, 1,
0.6219751, 0.7511974, 0.2420878, 1, 0, 0, 1, 1,
0.6314601, -2.209318, 2.036155, 1, 0, 0, 1, 1,
0.6335436, -0.3804968, 3.09054, 1, 0, 0, 1, 1,
0.6409164, -0.3973632, 2.462581, 0, 0, 0, 1, 1,
0.6428239, -0.4759303, 3.860171, 0, 0, 0, 1, 1,
0.6461321, 1.551045, -1.020695, 0, 0, 0, 1, 1,
0.6481652, -0.0641968, 1.792492, 0, 0, 0, 1, 1,
0.6483806, -0.09693394, 0.4603633, 0, 0, 0, 1, 1,
0.6488195, 0.4251003, 2.809269, 0, 0, 0, 1, 1,
0.6493114, 0.2511786, 2.015246, 0, 0, 0, 1, 1,
0.6546085, -1.187151, 2.8028, 1, 1, 1, 1, 1,
0.6557798, -0.6842041, 1.887476, 1, 1, 1, 1, 1,
0.657464, 2.911588, -0.1584444, 1, 1, 1, 1, 1,
0.6615695, -0.2983852, 0.5039617, 1, 1, 1, 1, 1,
0.6664483, -0.6519973, 2.1515, 1, 1, 1, 1, 1,
0.6671154, -1.31331, 4.141807, 1, 1, 1, 1, 1,
0.6686633, 1.611164, 1.511918, 1, 1, 1, 1, 1,
0.6698407, 0.3822666, 0.186439, 1, 1, 1, 1, 1,
0.6705556, 0.06110682, 3.212792, 1, 1, 1, 1, 1,
0.6719612, -0.9891603, 4.271305, 1, 1, 1, 1, 1,
0.6762403, -0.6262289, 2.575477, 1, 1, 1, 1, 1,
0.6805326, 1.039956, 1.046069, 1, 1, 1, 1, 1,
0.6874973, 0.2248277, 1.630861, 1, 1, 1, 1, 1,
0.689786, 0.5253168, 2.210449, 1, 1, 1, 1, 1,
0.6946041, -0.9479584, 3.032104, 1, 1, 1, 1, 1,
0.6971468, 0.7449942, 1.493819, 0, 0, 1, 1, 1,
0.7014469, -1.886709, 1.674072, 1, 0, 0, 1, 1,
0.7032763, -1.179826, 2.133031, 1, 0, 0, 1, 1,
0.7036845, 0.8748679, 1.39247, 1, 0, 0, 1, 1,
0.7121097, -0.691186, 3.829174, 1, 0, 0, 1, 1,
0.7176325, 0.2953165, 1.961237, 1, 0, 0, 1, 1,
0.7279865, -1.245034, 0.9311792, 0, 0, 0, 1, 1,
0.7286829, -0.4710294, 2.709162, 0, 0, 0, 1, 1,
0.7372406, 0.2501035, 0.7988879, 0, 0, 0, 1, 1,
0.7421982, 0.872861, 2.220174, 0, 0, 0, 1, 1,
0.7446796, -1.060731, 3.972842, 0, 0, 0, 1, 1,
0.7505782, 2.021961, -0.887943, 0, 0, 0, 1, 1,
0.7522615, 1.109855, 1.271554, 0, 0, 0, 1, 1,
0.753454, 1.366991, 1.632861, 1, 1, 1, 1, 1,
0.7562714, -1.477543, 3.624509, 1, 1, 1, 1, 1,
0.7603443, -0.7763205, 2.804513, 1, 1, 1, 1, 1,
0.7636492, -1.232358, 1.345462, 1, 1, 1, 1, 1,
0.7678646, -0.3301439, 2.391745, 1, 1, 1, 1, 1,
0.7684093, 1.346344, 0.2014739, 1, 1, 1, 1, 1,
0.7694724, 0.4552622, 2.740086, 1, 1, 1, 1, 1,
0.7701995, 0.4862946, -0.1942722, 1, 1, 1, 1, 1,
0.7717551, 0.344, 1.40531, 1, 1, 1, 1, 1,
0.7733884, -0.7198272, 2.146708, 1, 1, 1, 1, 1,
0.7737619, 0.5802807, 1.879757, 1, 1, 1, 1, 1,
0.7893124, 1.480609, 0.598435, 1, 1, 1, 1, 1,
0.7895085, -0.5382697, 2.128339, 1, 1, 1, 1, 1,
0.794278, -0.2487569, 1.223073, 1, 1, 1, 1, 1,
0.8018178, -1.05902, 1.934863, 1, 1, 1, 1, 1,
0.8062158, 0.2146156, 0.7110392, 0, 0, 1, 1, 1,
0.8066727, -0.4441656, 2.037407, 1, 0, 0, 1, 1,
0.8072789, -0.3484271, -1.263557, 1, 0, 0, 1, 1,
0.8077151, 0.7892329, -0.3271969, 1, 0, 0, 1, 1,
0.8109681, 0.5080236, 0.6928337, 1, 0, 0, 1, 1,
0.8114341, -0.5008166, 0.63885, 1, 0, 0, 1, 1,
0.8119429, 1.888804, -0.1232659, 0, 0, 0, 1, 1,
0.8335868, -0.1276157, 2.322096, 0, 0, 0, 1, 1,
0.8360193, 1.147086, 0.5063757, 0, 0, 0, 1, 1,
0.8362716, 0.1795379, 1.750802, 0, 0, 0, 1, 1,
0.8368886, -0.7369112, 2.768408, 0, 0, 0, 1, 1,
0.8370637, 0.1202455, 0.04788337, 0, 0, 0, 1, 1,
0.8393695, -0.2405364, 2.198865, 0, 0, 0, 1, 1,
0.8425819, 1.523883, 0.8408359, 1, 1, 1, 1, 1,
0.8428159, 0.5328827, 1.282977, 1, 1, 1, 1, 1,
0.8429434, -0.3474758, 1.584059, 1, 1, 1, 1, 1,
0.8438634, 1.101842, 1.571749, 1, 1, 1, 1, 1,
0.8443493, 0.9868971, -0.3462565, 1, 1, 1, 1, 1,
0.8490688, 0.5856671, 1.055987, 1, 1, 1, 1, 1,
0.8501557, 1.622605, -0.9883256, 1, 1, 1, 1, 1,
0.85356, -0.06006318, 1.654848, 1, 1, 1, 1, 1,
0.8560006, 1.138672, 1.685406, 1, 1, 1, 1, 1,
0.8565335, 2.664161, 0.8070467, 1, 1, 1, 1, 1,
0.8597587, -0.1495597, 1.254984, 1, 1, 1, 1, 1,
0.8621042, 1.660557, 1.983617, 1, 1, 1, 1, 1,
0.8694005, 0.2826173, 1.185917, 1, 1, 1, 1, 1,
0.8746948, 0.981444, 1.653508, 1, 1, 1, 1, 1,
0.8760146, 0.214935, 1.196111, 1, 1, 1, 1, 1,
0.8788142, -0.07167523, 0.9410381, 0, 0, 1, 1, 1,
0.8812547, -0.5401016, 4.173315, 1, 0, 0, 1, 1,
0.8815256, 0.8635549, 2.542492, 1, 0, 0, 1, 1,
0.9001991, 0.157331, 1.946901, 1, 0, 0, 1, 1,
0.9099703, -0.5765513, 1.593315, 1, 0, 0, 1, 1,
0.9151521, -0.01045118, 1.206698, 1, 0, 0, 1, 1,
0.9202223, 1.922166, 0.4898969, 0, 0, 0, 1, 1,
0.9304063, 0.6993492, 0.9656073, 0, 0, 0, 1, 1,
0.9317647, -0.3055592, 1.681848, 0, 0, 0, 1, 1,
0.9354455, -0.3901539, 1.843415, 0, 0, 0, 1, 1,
0.9367314, -0.7928658, 0.9113002, 0, 0, 0, 1, 1,
0.9408383, 0.4950593, -0.6389373, 0, 0, 0, 1, 1,
0.9482154, 0.3105056, 0.1810944, 0, 0, 0, 1, 1,
0.9488331, 1.065636, 0.9577274, 1, 1, 1, 1, 1,
0.9493813, -0.6415179, 1.136664, 1, 1, 1, 1, 1,
0.9512485, -0.09635629, 3.235699, 1, 1, 1, 1, 1,
0.9539043, 0.4098333, 1.334641, 1, 1, 1, 1, 1,
0.956111, 0.2657601, 1.298217, 1, 1, 1, 1, 1,
0.9562846, -1.181279, 0.81568, 1, 1, 1, 1, 1,
0.9595272, -0.5850561, 1.947238, 1, 1, 1, 1, 1,
0.9599143, -0.270786, 2.254229, 1, 1, 1, 1, 1,
0.9680833, 2.233015, -1.867836, 1, 1, 1, 1, 1,
0.9683505, 0.1252946, 0.7511334, 1, 1, 1, 1, 1,
0.9701875, -1.870305, 1.732425, 1, 1, 1, 1, 1,
0.9729136, -1.542041, 2.140144, 1, 1, 1, 1, 1,
0.9786778, 0.7675893, 1.092554, 1, 1, 1, 1, 1,
0.982008, 0.3323488, -0.5296151, 1, 1, 1, 1, 1,
0.9846149, 0.1315682, 1.002509, 1, 1, 1, 1, 1,
0.999061, 0.7386791, 0.2104714, 0, 0, 1, 1, 1,
1.002909, -0.3017315, 2.464468, 1, 0, 0, 1, 1,
1.022791, 0.2461432, 1.478748, 1, 0, 0, 1, 1,
1.029019, 0.02972865, 1.056205, 1, 0, 0, 1, 1,
1.031526, 0.8159379, 2.447968, 1, 0, 0, 1, 1,
1.034708, -0.4807474, 1.619557, 1, 0, 0, 1, 1,
1.036796, 0.2815842, 0.008949527, 0, 0, 0, 1, 1,
1.039952, -1.079432, 0.9904277, 0, 0, 0, 1, 1,
1.044078, -0.2835065, 3.851144, 0, 0, 0, 1, 1,
1.05099, -1.786054, 1.863127, 0, 0, 0, 1, 1,
1.051337, 0.8353254, 1.583436, 0, 0, 0, 1, 1,
1.055621, -0.8243441, 1.18481, 0, 0, 0, 1, 1,
1.061079, 0.8476866, 0.8701007, 0, 0, 0, 1, 1,
1.063052, -0.7150198, 2.238461, 1, 1, 1, 1, 1,
1.074277, -2.110069, 4.715372, 1, 1, 1, 1, 1,
1.074338, 1.054893, 2.411929, 1, 1, 1, 1, 1,
1.077472, -0.6708598, 2.959136, 1, 1, 1, 1, 1,
1.083407, 3.395735, -0.0803269, 1, 1, 1, 1, 1,
1.086718, 0.08829667, 1.404254, 1, 1, 1, 1, 1,
1.088344, -0.721848, 2.830482, 1, 1, 1, 1, 1,
1.093892, -1.198159, 1.780699, 1, 1, 1, 1, 1,
1.0945, 2.440814, 2.746282, 1, 1, 1, 1, 1,
1.096052, 1.201895, 0.6253346, 1, 1, 1, 1, 1,
1.101841, -0.007410204, 1.169508, 1, 1, 1, 1, 1,
1.112697, -1.876715, 3.036164, 1, 1, 1, 1, 1,
1.118088, 1.169895, 0.5305321, 1, 1, 1, 1, 1,
1.132135, -1.405412, 3.650751, 1, 1, 1, 1, 1,
1.132591, -0.02256433, 1.248705, 1, 1, 1, 1, 1,
1.134535, 0.01452925, 0.4489584, 0, 0, 1, 1, 1,
1.138179, -0.6097006, 2.239761, 1, 0, 0, 1, 1,
1.14842, 0.4416324, 1.392687, 1, 0, 0, 1, 1,
1.149767, 0.6560442, -0.08011514, 1, 0, 0, 1, 1,
1.15765, 0.8325607, 0.964766, 1, 0, 0, 1, 1,
1.161688, -0.2917777, 0.8919618, 1, 0, 0, 1, 1,
1.16422, -0.5826488, 1.089292, 0, 0, 0, 1, 1,
1.168937, 0.07218096, 3.441004, 0, 0, 0, 1, 1,
1.178574, -0.1077701, 2.612512, 0, 0, 0, 1, 1,
1.195227, -1.114639, 1.232481, 0, 0, 0, 1, 1,
1.197529, -2.082917, 2.691603, 0, 0, 0, 1, 1,
1.218456, 3.378198, 0.9154693, 0, 0, 0, 1, 1,
1.223062, 1.362542, 0.534848, 0, 0, 0, 1, 1,
1.228437, 1.106267, 0.6351844, 1, 1, 1, 1, 1,
1.239256, 0.2258317, 1.926521, 1, 1, 1, 1, 1,
1.252568, 0.07799646, 1.698189, 1, 1, 1, 1, 1,
1.258027, 0.1472074, 1.047676, 1, 1, 1, 1, 1,
1.259012, -0.841939, 1.097686, 1, 1, 1, 1, 1,
1.266529, 0.2285197, 0.2799727, 1, 1, 1, 1, 1,
1.275228, -1.158795, 3.819318, 1, 1, 1, 1, 1,
1.281251, -0.1575535, -0.7125102, 1, 1, 1, 1, 1,
1.283265, -0.5580152, 0.8675303, 1, 1, 1, 1, 1,
1.28505, -0.6447029, 2.790973, 1, 1, 1, 1, 1,
1.288738, -1.219424, 2.658588, 1, 1, 1, 1, 1,
1.30516, 0.9486263, 0.1932554, 1, 1, 1, 1, 1,
1.314845, -0.4134624, 1.848702, 1, 1, 1, 1, 1,
1.324749, -1.666848, 2.607773, 1, 1, 1, 1, 1,
1.326208, 0.6405385, 1.895905, 1, 1, 1, 1, 1,
1.331878, -1.301167, 3.131666, 0, 0, 1, 1, 1,
1.333597, 0.0274149, 3.173992, 1, 0, 0, 1, 1,
1.338245, -0.7689294, 0.9467785, 1, 0, 0, 1, 1,
1.345045, 0.8468605, 0.1066357, 1, 0, 0, 1, 1,
1.347038, -0.6524053, 1.087419, 1, 0, 0, 1, 1,
1.367888, -0.3648758, 2.47857, 1, 0, 0, 1, 1,
1.368565, -0.2260796, 1.115397, 0, 0, 0, 1, 1,
1.372133, 0.8914334, 1.59543, 0, 0, 0, 1, 1,
1.374168, 1.594086, 1.167586, 0, 0, 0, 1, 1,
1.374766, 1.603714, 0.6791629, 0, 0, 0, 1, 1,
1.376737, 0.8369905, 1.388449, 0, 0, 0, 1, 1,
1.382909, -1.196702, 1.490294, 0, 0, 0, 1, 1,
1.387282, -0.2521998, 1.750648, 0, 0, 0, 1, 1,
1.387612, 0.4362441, -0.1518252, 1, 1, 1, 1, 1,
1.394961, -0.08556096, 1.154256, 1, 1, 1, 1, 1,
1.396947, -0.5126017, 2.00833, 1, 1, 1, 1, 1,
1.398661, -0.4762619, 2.201249, 1, 1, 1, 1, 1,
1.404951, -0.6345505, 0.468612, 1, 1, 1, 1, 1,
1.408585, -0.2951526, 2.116093, 1, 1, 1, 1, 1,
1.42274, 1.729076, -0.5962508, 1, 1, 1, 1, 1,
1.424462, 0.2117822, 0.03053069, 1, 1, 1, 1, 1,
1.431874, 0.3753947, 0.4345292, 1, 1, 1, 1, 1,
1.433188, 0.1550708, 1.153882, 1, 1, 1, 1, 1,
1.434028, -0.2494672, 1.241158, 1, 1, 1, 1, 1,
1.437652, -0.7524013, -0.08902691, 1, 1, 1, 1, 1,
1.449951, -0.4555575, 1.028688, 1, 1, 1, 1, 1,
1.469678, 0.8899652, 1.277881, 1, 1, 1, 1, 1,
1.472123, -0.04894675, 2.28381, 1, 1, 1, 1, 1,
1.472505, -0.629747, 3.971164, 0, 0, 1, 1, 1,
1.472616, 1.821029, -1.683137, 1, 0, 0, 1, 1,
1.475623, -0.855709, 2.550359, 1, 0, 0, 1, 1,
1.475837, -0.1737793, 0.9244974, 1, 0, 0, 1, 1,
1.495493, 0.0762479, 1.888457, 1, 0, 0, 1, 1,
1.496487, -0.4448158, 0.4962794, 1, 0, 0, 1, 1,
1.509157, 2.901066, -0.2077626, 0, 0, 0, 1, 1,
1.512741, -0.1412854, 2.933567, 0, 0, 0, 1, 1,
1.536519, -0.2532347, 4.16657, 0, 0, 0, 1, 1,
1.543808, 0.1981588, 1.647435, 0, 0, 0, 1, 1,
1.557838, 1.734843, 1.908801, 0, 0, 0, 1, 1,
1.569149, 0.7846105, 2.842545, 0, 0, 0, 1, 1,
1.572215, -0.2098584, 1.505269, 0, 0, 0, 1, 1,
1.575002, -0.6250037, 0.9327851, 1, 1, 1, 1, 1,
1.580713, -1.327507, 3.353938, 1, 1, 1, 1, 1,
1.595036, -0.9732056, 2.941761, 1, 1, 1, 1, 1,
1.604623, 0.9324394, 2.540764, 1, 1, 1, 1, 1,
1.63678, -0.09937645, 2.412459, 1, 1, 1, 1, 1,
1.644653, 1.548505, 1.952211, 1, 1, 1, 1, 1,
1.658464, -0.8363159, 1.443748, 1, 1, 1, 1, 1,
1.665947, -0.08333667, 0.43923, 1, 1, 1, 1, 1,
1.667408, 0.1263427, 2.379981, 1, 1, 1, 1, 1,
1.667857, -0.2120544, 1.317072, 1, 1, 1, 1, 1,
1.673624, -0.3836485, 3.222394, 1, 1, 1, 1, 1,
1.676008, 0.2998184, 2.02604, 1, 1, 1, 1, 1,
1.679446, -2.011112, 1.71901, 1, 1, 1, 1, 1,
1.691921, 0.4955114, 2.618499, 1, 1, 1, 1, 1,
1.70957, -1.325977, 2.358459, 1, 1, 1, 1, 1,
1.713953, 2.299411, 0.1451553, 0, 0, 1, 1, 1,
1.729999, -0.6820977, 1.714936, 1, 0, 0, 1, 1,
1.737482, -0.6594363, 1.783489, 1, 0, 0, 1, 1,
1.743054, -0.2509054, 0.3880364, 1, 0, 0, 1, 1,
1.7609, 1.026947, -0.7457929, 1, 0, 0, 1, 1,
1.772933, -3.157809, 3.459676, 1, 0, 0, 1, 1,
1.786252, 0.6030346, 2.223071, 0, 0, 0, 1, 1,
1.789585, 0.7039875, 1.867537, 0, 0, 0, 1, 1,
1.8056, -0.4971197, 3.031952, 0, 0, 0, 1, 1,
1.818686, 0.3591511, 2.141268, 0, 0, 0, 1, 1,
1.864614, 0.8798863, 1.741565, 0, 0, 0, 1, 1,
1.871691, -0.101906, 4.114443, 0, 0, 0, 1, 1,
1.873377, -1.627942, 1.53755, 0, 0, 0, 1, 1,
1.891525, 0.2400556, 1.66489, 1, 1, 1, 1, 1,
1.901758, -0.8889434, 3.40648, 1, 1, 1, 1, 1,
1.909667, -1.79716, 3.46532, 1, 1, 1, 1, 1,
1.916926, -0.7583523, 0.753089, 1, 1, 1, 1, 1,
1.922085, 0.04888211, 2.829227, 1, 1, 1, 1, 1,
1.932769, 0.9720802, -0.7289904, 1, 1, 1, 1, 1,
1.933101, -0.4963933, 1.121785, 1, 1, 1, 1, 1,
1.955182, -0.08734155, -0.2808714, 1, 1, 1, 1, 1,
1.957384, 0.980947, 1.25244, 1, 1, 1, 1, 1,
2.000476, 0.1422411, 0.1018803, 1, 1, 1, 1, 1,
2.001372, -0.7373818, 1.74847, 1, 1, 1, 1, 1,
2.003347, -0.09950782, 2.780547, 1, 1, 1, 1, 1,
2.012046, -0.6257744, 1.725136, 1, 1, 1, 1, 1,
2.026507, -0.02954581, 0.5093001, 1, 1, 1, 1, 1,
2.035489, 0.079564, 0.7121664, 1, 1, 1, 1, 1,
2.042495, 1.723942, 1.684028, 0, 0, 1, 1, 1,
2.058706, -0.6248436, 2.048099, 1, 0, 0, 1, 1,
2.071074, -0.3723457, 0.8423384, 1, 0, 0, 1, 1,
2.11496, 2.677256, 0.1271243, 1, 0, 0, 1, 1,
2.120833, 0.417524, 1.04299, 1, 0, 0, 1, 1,
2.127692, -0.1352236, 2.82232, 1, 0, 0, 1, 1,
2.136504, 1.3931, 1.442037, 0, 0, 0, 1, 1,
2.142463, 0.7367479, -0.235282, 0, 0, 0, 1, 1,
2.161921, -1.511124, 2.534007, 0, 0, 0, 1, 1,
2.264621, -0.1553035, 1.387112, 0, 0, 0, 1, 1,
2.280228, 0.8686357, 1.487078, 0, 0, 0, 1, 1,
2.293151, 0.6614888, 0.5427181, 0, 0, 0, 1, 1,
2.298635, -1.449015, 2.630021, 0, 0, 0, 1, 1,
2.335058, 2.261986, 1.392874, 1, 1, 1, 1, 1,
2.522675, -1.209372, 1.7259, 1, 1, 1, 1, 1,
2.625244, -0.6725783, 2.622263, 1, 1, 1, 1, 1,
2.65763, 0.9611419, 0.6030943, 1, 1, 1, 1, 1,
2.777364, -1.32016, 2.949456, 1, 1, 1, 1, 1,
2.980752, 1.752055, -0.04390149, 1, 1, 1, 1, 1,
2.984877, 0.2857413, -0.3831174, 1, 1, 1, 1, 1
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
var radius = 10.1925;
var distance = 35.80071;
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
mvMatrix.translate( 0.1360039, 0.04184151, -0.3777752 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.80071);
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
