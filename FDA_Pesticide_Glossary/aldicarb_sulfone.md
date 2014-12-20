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
-2.941767, 0.3053947, 0.003971446, 1, 0, 0, 1,
-2.901198, -0.3522505, -0.3748623, 1, 0.007843138, 0, 1,
-2.87783, 0.3581983, -1.782246, 1, 0.01176471, 0, 1,
-2.864105, -0.3315265, -2.268792, 1, 0.01960784, 0, 1,
-2.81716, -0.7925296, -1.150714, 1, 0.02352941, 0, 1,
-2.808228, -0.9624768, -2.434652, 1, 0.03137255, 0, 1,
-2.666256, 0.1937038, -1.188352, 1, 0.03529412, 0, 1,
-2.553337, 0.7332227, -0.7354817, 1, 0.04313726, 0, 1,
-2.551891, 1.067041, -0.09787569, 1, 0.04705882, 0, 1,
-2.515653, -0.9658557, -3.525437, 1, 0.05490196, 0, 1,
-2.380744, 0.554412, -1.461102, 1, 0.05882353, 0, 1,
-2.317958, -0.06244203, -1.794657, 1, 0.06666667, 0, 1,
-2.292471, -0.9374893, -0.9161363, 1, 0.07058824, 0, 1,
-2.281751, 1.902204, -0.6048757, 1, 0.07843138, 0, 1,
-2.267272, 0.2791965, -1.42245, 1, 0.08235294, 0, 1,
-2.230042, -1.470594, -1.534558, 1, 0.09019608, 0, 1,
-2.20504, -0.7199047, -0.8530005, 1, 0.09411765, 0, 1,
-2.159551, 0.01694256, -3.177289, 1, 0.1019608, 0, 1,
-2.158912, 0.2344656, -1.140488, 1, 0.1098039, 0, 1,
-2.155399, 0.8451462, -1.768428, 1, 0.1137255, 0, 1,
-2.152313, -0.3741015, -1.626138, 1, 0.1215686, 0, 1,
-2.136434, 0.01857379, -1.533548, 1, 0.1254902, 0, 1,
-2.134573, -1.422275, -1.948726, 1, 0.1333333, 0, 1,
-2.128447, -1.647198, -3.535172, 1, 0.1372549, 0, 1,
-2.126672, -0.4838037, -1.278972, 1, 0.145098, 0, 1,
-2.123157, 0.5582782, -0.3553223, 1, 0.1490196, 0, 1,
-2.114156, 1.993829, -0.8832949, 1, 0.1568628, 0, 1,
-2.101688, -1.851368, -1.881544, 1, 0.1607843, 0, 1,
-2.100143, -0.1262034, -0.2493964, 1, 0.1686275, 0, 1,
-2.076349, -0.7273025, -1.758331, 1, 0.172549, 0, 1,
-2.041449, 0.3695723, -2.103148, 1, 0.1803922, 0, 1,
-2.016517, -0.3998904, -1.590611, 1, 0.1843137, 0, 1,
-2.012394, 0.9887124, 0.8051099, 1, 0.1921569, 0, 1,
-1.946448, -0.5450518, -1.153586, 1, 0.1960784, 0, 1,
-1.935523, 0.2102058, -1.5782, 1, 0.2039216, 0, 1,
-1.885113, -0.05425165, -0.3880663, 1, 0.2117647, 0, 1,
-1.868459, -0.5542189, -2.247649, 1, 0.2156863, 0, 1,
-1.8649, 0.3188682, -1.35101, 1, 0.2235294, 0, 1,
-1.844572, 1.004453, -1.7887, 1, 0.227451, 0, 1,
-1.843171, -0.9347134, -2.12845, 1, 0.2352941, 0, 1,
-1.826387, -1.388458, -2.616636, 1, 0.2392157, 0, 1,
-1.813856, 0.6869041, 0.3133932, 1, 0.2470588, 0, 1,
-1.807566, -0.5016356, 0.6297013, 1, 0.2509804, 0, 1,
-1.79374, -2.216569, -3.607576, 1, 0.2588235, 0, 1,
-1.786262, 0.3914664, -1.148291, 1, 0.2627451, 0, 1,
-1.785822, 1.32827, 0.7393241, 1, 0.2705882, 0, 1,
-1.778709, 0.7701398, -2.063913, 1, 0.2745098, 0, 1,
-1.767771, -0.5730355, -2.798378, 1, 0.282353, 0, 1,
-1.755692, 1.110314, -0.06886766, 1, 0.2862745, 0, 1,
-1.750231, 0.5820834, -0.9046217, 1, 0.2941177, 0, 1,
-1.745377, 1.280696, -1.21581, 1, 0.3019608, 0, 1,
-1.741148, -0.8268741, -1.557232, 1, 0.3058824, 0, 1,
-1.739217, -0.3020289, -1.672417, 1, 0.3137255, 0, 1,
-1.723288, -0.5884985, -1.28054, 1, 0.3176471, 0, 1,
-1.675487, 2.265841, 0.5085593, 1, 0.3254902, 0, 1,
-1.671605, -0.607882, -1.340851, 1, 0.3294118, 0, 1,
-1.663446, -0.6802024, -3.526405, 1, 0.3372549, 0, 1,
-1.658213, 0.2510221, -0.001543615, 1, 0.3411765, 0, 1,
-1.639119, 0.4463958, -2.732244, 1, 0.3490196, 0, 1,
-1.638956, 0.9120638, -1.492441, 1, 0.3529412, 0, 1,
-1.627642, 1.036919, 0.5131431, 1, 0.3607843, 0, 1,
-1.624393, -1.143687, -1.585764, 1, 0.3647059, 0, 1,
-1.621249, 0.9139537, 0.1725554, 1, 0.372549, 0, 1,
-1.607065, 1.161909, -1.363756, 1, 0.3764706, 0, 1,
-1.604001, 0.6140724, -0.497417, 1, 0.3843137, 0, 1,
-1.594404, -0.7643563, -1.939915, 1, 0.3882353, 0, 1,
-1.580921, -0.3756176, -2.351624, 1, 0.3960784, 0, 1,
-1.579734, -0.4451557, -0.3122259, 1, 0.4039216, 0, 1,
-1.550282, 0.1025811, -4.269642, 1, 0.4078431, 0, 1,
-1.539724, -3.040788, -3.0006, 1, 0.4156863, 0, 1,
-1.523363, 1.57831, -1.582445, 1, 0.4196078, 0, 1,
-1.522416, 0.9809711, -1.157106, 1, 0.427451, 0, 1,
-1.516352, -0.2065945, -0.5995787, 1, 0.4313726, 0, 1,
-1.507842, 2.204088, -2.836226, 1, 0.4392157, 0, 1,
-1.505679, 0.4729944, -0.2402024, 1, 0.4431373, 0, 1,
-1.502714, -0.6114153, -2.945755, 1, 0.4509804, 0, 1,
-1.495569, 0.9410038, -1.121802, 1, 0.454902, 0, 1,
-1.47771, -0.8026037, -0.7443218, 1, 0.4627451, 0, 1,
-1.453807, 0.2755045, -1.813518, 1, 0.4666667, 0, 1,
-1.44989, 1.10965, -1.042467, 1, 0.4745098, 0, 1,
-1.441282, 2.421918, -2.327399, 1, 0.4784314, 0, 1,
-1.436897, -1.549836, -1.950569, 1, 0.4862745, 0, 1,
-1.42598, -0.2619725, -3.57779, 1, 0.4901961, 0, 1,
-1.424469, -0.7805523, -2.384755, 1, 0.4980392, 0, 1,
-1.420528, -1.385563, -3.030496, 1, 0.5058824, 0, 1,
-1.414384, -0.05808215, 0.4576361, 1, 0.509804, 0, 1,
-1.410396, 0.901186, -0.8791458, 1, 0.5176471, 0, 1,
-1.399637, 0.6918984, -2.512102, 1, 0.5215687, 0, 1,
-1.398037, 1.585393, 0.8509429, 1, 0.5294118, 0, 1,
-1.393286, -0.6657422, -2.635974, 1, 0.5333334, 0, 1,
-1.39155, -0.01980148, -2.601369, 1, 0.5411765, 0, 1,
-1.384372, 0.1910057, -0.8977203, 1, 0.5450981, 0, 1,
-1.377552, -1.235031, 0.02869521, 1, 0.5529412, 0, 1,
-1.377398, -0.8029358, -1.073517, 1, 0.5568628, 0, 1,
-1.376782, 0.7735236, -1.092241, 1, 0.5647059, 0, 1,
-1.374094, 0.4125987, 0.3113252, 1, 0.5686275, 0, 1,
-1.367951, -1.237573, -2.472889, 1, 0.5764706, 0, 1,
-1.359066, -1.349452, -2.199899, 1, 0.5803922, 0, 1,
-1.349669, 1.051931, 0.4249173, 1, 0.5882353, 0, 1,
-1.347853, 0.9578466, -2.226436, 1, 0.5921569, 0, 1,
-1.344052, 0.166246, -2.961228, 1, 0.6, 0, 1,
-1.343607, 0.2384911, -1.969068, 1, 0.6078432, 0, 1,
-1.333717, 1.052418, -1.385833, 1, 0.6117647, 0, 1,
-1.333451, -0.2826733, -3.393691, 1, 0.6196079, 0, 1,
-1.315943, 0.529758, -1.18956, 1, 0.6235294, 0, 1,
-1.313185, 0.8087598, -1.688324, 1, 0.6313726, 0, 1,
-1.306802, 0.462505, -0.4156615, 1, 0.6352941, 0, 1,
-1.303169, -1.056812, -4.037256, 1, 0.6431373, 0, 1,
-1.289978, 0.7037871, -1.15089, 1, 0.6470588, 0, 1,
-1.278376, 0.09691444, -1.940344, 1, 0.654902, 0, 1,
-1.27651, 1.739561, -0.3890286, 1, 0.6588235, 0, 1,
-1.272929, 0.03670578, -1.948035, 1, 0.6666667, 0, 1,
-1.269205, -1.057125, -3.302571, 1, 0.6705883, 0, 1,
-1.263408, 1.315682, -2.267856, 1, 0.6784314, 0, 1,
-1.261874, 0.5518095, 0.250821, 1, 0.682353, 0, 1,
-1.257375, 1.150271, -0.8080604, 1, 0.6901961, 0, 1,
-1.255088, -1.583797, -2.380878, 1, 0.6941177, 0, 1,
-1.241119, -1.504382, -2.917585, 1, 0.7019608, 0, 1,
-1.23982, -0.7026582, -2.943561, 1, 0.7098039, 0, 1,
-1.237574, 0.3774666, -3.119231, 1, 0.7137255, 0, 1,
-1.230765, 0.7074308, 0.413348, 1, 0.7215686, 0, 1,
-1.22608, -0.003102964, -1.276371, 1, 0.7254902, 0, 1,
-1.219608, 1.368808, -0.7179658, 1, 0.7333333, 0, 1,
-1.218347, -1.061319, -0.9542612, 1, 0.7372549, 0, 1,
-1.209226, -0.4574771, 0.4919624, 1, 0.7450981, 0, 1,
-1.20669, -1.804514, -1.654162, 1, 0.7490196, 0, 1,
-1.204979, -0.2027379, -2.21472, 1, 0.7568628, 0, 1,
-1.196289, 0.009431833, -3.238479, 1, 0.7607843, 0, 1,
-1.191756, 0.87817, -1.401859, 1, 0.7686275, 0, 1,
-1.189486, -0.657697, -2.293046, 1, 0.772549, 0, 1,
-1.187483, 0.327622, -1.862392, 1, 0.7803922, 0, 1,
-1.182008, 0.1575565, -1.010612, 1, 0.7843137, 0, 1,
-1.173536, 0.392664, -1.569907, 1, 0.7921569, 0, 1,
-1.173404, -0.2540679, -1.302223, 1, 0.7960784, 0, 1,
-1.169522, -2.03989, -1.309694, 1, 0.8039216, 0, 1,
-1.157663, -1.183853, -1.862571, 1, 0.8117647, 0, 1,
-1.147244, 0.1323519, -1.024573, 1, 0.8156863, 0, 1,
-1.144886, -0.1578638, -1.898672, 1, 0.8235294, 0, 1,
-1.142339, 1.867958, -1.178234, 1, 0.827451, 0, 1,
-1.128909, 1.274023, 0.0739568, 1, 0.8352941, 0, 1,
-1.124743, 1.621551, 1.271657, 1, 0.8392157, 0, 1,
-1.123196, -0.2265217, -0.9363073, 1, 0.8470588, 0, 1,
-1.120716, 0.5772561, -1.061265, 1, 0.8509804, 0, 1,
-1.117282, 0.5376568, -2.655352, 1, 0.8588235, 0, 1,
-1.111962, -1.808, -2.004575, 1, 0.8627451, 0, 1,
-1.10957, -0.2852865, -2.73865, 1, 0.8705882, 0, 1,
-1.10764, 0.7256244, -2.236364, 1, 0.8745098, 0, 1,
-1.104463, -1.179427, -2.585656, 1, 0.8823529, 0, 1,
-1.104446, 0.103259, -0.6438695, 1, 0.8862745, 0, 1,
-1.104392, -1.948766, -3.520913, 1, 0.8941177, 0, 1,
-1.103951, -0.9417163, -3.33693, 1, 0.8980392, 0, 1,
-1.086356, -1.311276, -2.265357, 1, 0.9058824, 0, 1,
-1.079118, 0.7105926, -1.709509, 1, 0.9137255, 0, 1,
-1.074018, -0.07704106, -0.1249626, 1, 0.9176471, 0, 1,
-1.061775, 0.9168546, -0.3299407, 1, 0.9254902, 0, 1,
-1.057397, 0.1162809, -0.1053847, 1, 0.9294118, 0, 1,
-1.054267, -0.1312811, -1.206145, 1, 0.9372549, 0, 1,
-1.051093, -0.8215644, -2.118967, 1, 0.9411765, 0, 1,
-1.046077, -2.217062, -3.040653, 1, 0.9490196, 0, 1,
-1.041916, 0.5095747, 0.2681566, 1, 0.9529412, 0, 1,
-1.037838, 0.7740514, -0.8661299, 1, 0.9607843, 0, 1,
-1.037239, -2.512126, -3.468965, 1, 0.9647059, 0, 1,
-1.025169, 1.481953, -0.4272517, 1, 0.972549, 0, 1,
-1.025118, 2.44033, 0.02526315, 1, 0.9764706, 0, 1,
-1.020754, -0.9302477, -1.256054, 1, 0.9843137, 0, 1,
-1.016667, -1.191233, -2.781044, 1, 0.9882353, 0, 1,
-1.015163, -0.1221663, -1.954366, 1, 0.9960784, 0, 1,
-1.013671, 0.3560817, 0.2881797, 0.9960784, 1, 0, 1,
-1.013179, -0.466339, -1.534494, 0.9921569, 1, 0, 1,
-1.012295, -0.1005705, -3.402379, 0.9843137, 1, 0, 1,
-1.004827, 0.6849769, -1.142813, 0.9803922, 1, 0, 1,
-1.001787, 1.059497, -1.261352, 0.972549, 1, 0, 1,
-0.9989759, -0.7841975, -0.4777403, 0.9686275, 1, 0, 1,
-0.9946571, 0.03141557, -0.8964983, 0.9607843, 1, 0, 1,
-0.988179, 1.329544, -1.877467, 0.9568627, 1, 0, 1,
-0.9832811, -0.632736, -2.892972, 0.9490196, 1, 0, 1,
-0.9825232, 0.9334819, -1.099583, 0.945098, 1, 0, 1,
-0.9811168, -2.532551, -1.98951, 0.9372549, 1, 0, 1,
-0.9802369, -0.7957163, -1.85227, 0.9333333, 1, 0, 1,
-0.9789324, 0.3555647, -1.460264, 0.9254902, 1, 0, 1,
-0.9743813, -0.260838, -2.935909, 0.9215686, 1, 0, 1,
-0.9734163, 0.9553093, -0.6700211, 0.9137255, 1, 0, 1,
-0.9678073, -1.111146, -2.049898, 0.9098039, 1, 0, 1,
-0.9625344, -1.089977, -2.463607, 0.9019608, 1, 0, 1,
-0.9596849, 0.04685672, -0.6195333, 0.8941177, 1, 0, 1,
-0.9482921, 0.7669488, -1.776367, 0.8901961, 1, 0, 1,
-0.9392574, 1.404307, -1.17224, 0.8823529, 1, 0, 1,
-0.9352093, 1.112743, -1.307779, 0.8784314, 1, 0, 1,
-0.9316557, 0.07706933, -0.3698916, 0.8705882, 1, 0, 1,
-0.9303127, 0.1553782, 0.6015315, 0.8666667, 1, 0, 1,
-0.9249802, -0.1905508, -0.8210067, 0.8588235, 1, 0, 1,
-0.9212708, -0.04461461, -1.244625, 0.854902, 1, 0, 1,
-0.9198374, -1.578297, -0.8409612, 0.8470588, 1, 0, 1,
-0.919741, -0.7329187, -2.930375, 0.8431373, 1, 0, 1,
-0.909099, -1.036642, -1.710895, 0.8352941, 1, 0, 1,
-0.8897348, -0.1998683, -1.861295, 0.8313726, 1, 0, 1,
-0.8883895, -0.1986929, -1.773012, 0.8235294, 1, 0, 1,
-0.8873059, -0.5215887, -3.328407, 0.8196079, 1, 0, 1,
-0.8791817, -0.1953648, -3.389491, 0.8117647, 1, 0, 1,
-0.8785169, 1.232895, -0.2137239, 0.8078431, 1, 0, 1,
-0.8727185, -0.363156, -0.06374746, 0.8, 1, 0, 1,
-0.8722816, -0.7965929, -2.604123, 0.7921569, 1, 0, 1,
-0.8633282, 0.8859373, 0.8059624, 0.7882353, 1, 0, 1,
-0.8557965, -0.2675323, -2.491634, 0.7803922, 1, 0, 1,
-0.8491733, 2.550862, -0.4996855, 0.7764706, 1, 0, 1,
-0.8479286, -1.480333, -4.167199, 0.7686275, 1, 0, 1,
-0.8427567, 1.303223, -0.4038011, 0.7647059, 1, 0, 1,
-0.8416639, -1.942767, -3.243454, 0.7568628, 1, 0, 1,
-0.8338039, -0.3250242, -1.979361, 0.7529412, 1, 0, 1,
-0.8317108, 0.3808918, -3.269969, 0.7450981, 1, 0, 1,
-0.8316913, 1.611516, -0.5435981, 0.7411765, 1, 0, 1,
-0.82267, -0.03579124, -1.616667, 0.7333333, 1, 0, 1,
-0.820679, -0.4756755, -1.467811, 0.7294118, 1, 0, 1,
-0.8186643, -0.4684182, -3.668199, 0.7215686, 1, 0, 1,
-0.8171129, 0.4095193, -0.5953295, 0.7176471, 1, 0, 1,
-0.8162113, -0.7016448, -3.149137, 0.7098039, 1, 0, 1,
-0.8136153, -0.0188563, -1.950335, 0.7058824, 1, 0, 1,
-0.8089151, -1.278828, -1.484784, 0.6980392, 1, 0, 1,
-0.7996482, -0.2477865, -0.184581, 0.6901961, 1, 0, 1,
-0.7904661, 0.2217808, -0.8766705, 0.6862745, 1, 0, 1,
-0.7903056, 0.214087, -0.3071896, 0.6784314, 1, 0, 1,
-0.7893412, 0.4114193, -2.001508, 0.6745098, 1, 0, 1,
-0.7869, 0.5809422, 0.05176597, 0.6666667, 1, 0, 1,
-0.785948, -0.8893875, -3.406731, 0.6627451, 1, 0, 1,
-0.7846558, -0.1797055, 0.07059423, 0.654902, 1, 0, 1,
-0.7837838, 0.6796968, 0.7599136, 0.6509804, 1, 0, 1,
-0.783367, 0.6035857, -0.5927629, 0.6431373, 1, 0, 1,
-0.7828523, -0.2289895, -2.07095, 0.6392157, 1, 0, 1,
-0.7825618, 0.72548, -0.9869316, 0.6313726, 1, 0, 1,
-0.7705199, -0.7339403, -3.831642, 0.627451, 1, 0, 1,
-0.7647308, -1.657563, -3.266105, 0.6196079, 1, 0, 1,
-0.7640935, -0.4485317, -0.1756955, 0.6156863, 1, 0, 1,
-0.755662, -0.5273532, -3.97714, 0.6078432, 1, 0, 1,
-0.7550882, 0.04965831, -2.107023, 0.6039216, 1, 0, 1,
-0.7512137, -0.7046988, -2.086209, 0.5960785, 1, 0, 1,
-0.7463233, 0.2436516, -0.6344674, 0.5882353, 1, 0, 1,
-0.7424901, -1.651579, -0.6668771, 0.5843138, 1, 0, 1,
-0.7352093, -1.182897, -3.892803, 0.5764706, 1, 0, 1,
-0.7280741, 0.04752846, -0.3729879, 0.572549, 1, 0, 1,
-0.7279724, -1.471732, -3.014769, 0.5647059, 1, 0, 1,
-0.7252959, -1.50389, -3.027591, 0.5607843, 1, 0, 1,
-0.7232315, 1.417462, 1.169528, 0.5529412, 1, 0, 1,
-0.7221359, -0.1843769, -1.598917, 0.5490196, 1, 0, 1,
-0.7191354, 0.371878, -1.499741, 0.5411765, 1, 0, 1,
-0.7174025, 0.4698462, -2.582916, 0.5372549, 1, 0, 1,
-0.7152638, -1.860195, -2.610915, 0.5294118, 1, 0, 1,
-0.7151434, 0.8233159, -2.194494, 0.5254902, 1, 0, 1,
-0.7081769, 0.6625946, -1.465297, 0.5176471, 1, 0, 1,
-0.7074549, -1.473444, -0.7919984, 0.5137255, 1, 0, 1,
-0.7019182, -1.846751, -3.655236, 0.5058824, 1, 0, 1,
-0.69889, -2.009574, -1.416473, 0.5019608, 1, 0, 1,
-0.6981033, 0.215484, -2.127608, 0.4941176, 1, 0, 1,
-0.6979333, -0.08931803, -1.721657, 0.4862745, 1, 0, 1,
-0.6876858, 0.6209257, -0.6729761, 0.4823529, 1, 0, 1,
-0.6838367, 0.9179773, 0.2340041, 0.4745098, 1, 0, 1,
-0.6823971, -0.05869861, -2.358459, 0.4705882, 1, 0, 1,
-0.672738, 1.350863, -0.2972493, 0.4627451, 1, 0, 1,
-0.669829, 2.338763, -1.236664, 0.4588235, 1, 0, 1,
-0.6611148, -0.572431, -3.002362, 0.4509804, 1, 0, 1,
-0.6527559, -0.4168313, -0.5825372, 0.4470588, 1, 0, 1,
-0.6508478, 0.483418, -1.316365, 0.4392157, 1, 0, 1,
-0.6457363, 0.46365, 1.422075, 0.4352941, 1, 0, 1,
-0.6453608, -0.41499, -1.299495, 0.427451, 1, 0, 1,
-0.6351188, -2.18697, -2.611474, 0.4235294, 1, 0, 1,
-0.6332352, 1.011055, 1.114248, 0.4156863, 1, 0, 1,
-0.6322234, 0.04968087, -1.885277, 0.4117647, 1, 0, 1,
-0.6316503, 0.9172981, -2.428382, 0.4039216, 1, 0, 1,
-0.6248688, -1.718266, -3.044504, 0.3960784, 1, 0, 1,
-0.6225661, -1.67328, -4.45678, 0.3921569, 1, 0, 1,
-0.6219178, -0.6494161, -1.845555, 0.3843137, 1, 0, 1,
-0.6207262, -1.564729, -1.863892, 0.3803922, 1, 0, 1,
-0.6078631, -0.3021627, -1.845801, 0.372549, 1, 0, 1,
-0.6038684, 0.324668, -1.289445, 0.3686275, 1, 0, 1,
-0.5996771, -0.2636089, -1.74152, 0.3607843, 1, 0, 1,
-0.5921402, 0.6043335, 0.7532514, 0.3568628, 1, 0, 1,
-0.5912226, 0.2876858, -2.429036, 0.3490196, 1, 0, 1,
-0.5883017, 0.2513007, -1.607121, 0.345098, 1, 0, 1,
-0.5875366, 0.4458632, -2.281829, 0.3372549, 1, 0, 1,
-0.5836709, -0.4039519, -2.14524, 0.3333333, 1, 0, 1,
-0.5821418, 0.2220332, -1.216316, 0.3254902, 1, 0, 1,
-0.5794733, 1.323155, -1.434139, 0.3215686, 1, 0, 1,
-0.5790383, 0.5241504, 0.6647268, 0.3137255, 1, 0, 1,
-0.5776237, -0.9382606, -2.233779, 0.3098039, 1, 0, 1,
-0.575409, -0.7379937, -2.17925, 0.3019608, 1, 0, 1,
-0.5726107, -0.355304, -1.395501, 0.2941177, 1, 0, 1,
-0.5632707, -0.2294773, -2.554695, 0.2901961, 1, 0, 1,
-0.5626906, -0.8227994, -1.685239, 0.282353, 1, 0, 1,
-0.562606, -1.086198, -2.731865, 0.2784314, 1, 0, 1,
-0.5618933, -0.9463576, -3.915322, 0.2705882, 1, 0, 1,
-0.5540907, 0.1534645, -1.077518, 0.2666667, 1, 0, 1,
-0.548631, -0.4949963, -2.499017, 0.2588235, 1, 0, 1,
-0.546732, 2.302776, -0.2142764, 0.254902, 1, 0, 1,
-0.5403824, -0.2341675, 0.01859293, 0.2470588, 1, 0, 1,
-0.5384911, -0.9811378, -3.977225, 0.2431373, 1, 0, 1,
-0.5374697, -2.023939, -3.659651, 0.2352941, 1, 0, 1,
-0.5304741, -1.080853, -3.332809, 0.2313726, 1, 0, 1,
-0.5256813, 1.458604, -0.7341402, 0.2235294, 1, 0, 1,
-0.524269, 0.8228288, -1.693161, 0.2196078, 1, 0, 1,
-0.5209091, -0.1018943, -2.196804, 0.2117647, 1, 0, 1,
-0.5161209, 0.5939521, -2.350636, 0.2078431, 1, 0, 1,
-0.5119454, -0.02864748, -1.529896, 0.2, 1, 0, 1,
-0.5094455, -0.3873583, -2.11507, 0.1921569, 1, 0, 1,
-0.4948945, 0.694828, -1.116747, 0.1882353, 1, 0, 1,
-0.4848442, -0.1709646, -0.8050762, 0.1803922, 1, 0, 1,
-0.4836842, 0.1645792, -1.481193, 0.1764706, 1, 0, 1,
-0.4834476, -1.368991, -2.506426, 0.1686275, 1, 0, 1,
-0.4830946, 0.2973641, -1.029896, 0.1647059, 1, 0, 1,
-0.483072, -2.26582, -4.217646, 0.1568628, 1, 0, 1,
-0.4812615, -0.5499249, -2.660527, 0.1529412, 1, 0, 1,
-0.4805995, -0.3630908, -0.339931, 0.145098, 1, 0, 1,
-0.4771565, 0.9523678, -0.9163048, 0.1411765, 1, 0, 1,
-0.4726794, -1.830486, -2.153948, 0.1333333, 1, 0, 1,
-0.4670236, -1.850079, -3.074371, 0.1294118, 1, 0, 1,
-0.4651932, -0.3289813, -2.023074, 0.1215686, 1, 0, 1,
-0.4550408, 0.2041993, 0.427112, 0.1176471, 1, 0, 1,
-0.4479649, -2.796553, -1.512774, 0.1098039, 1, 0, 1,
-0.4457421, 1.383746, -0.5725443, 0.1058824, 1, 0, 1,
-0.4452923, 1.810954, -0.5709546, 0.09803922, 1, 0, 1,
-0.4424799, 1.995764, -0.8862125, 0.09019608, 1, 0, 1,
-0.4411778, 0.1177044, -1.868966, 0.08627451, 1, 0, 1,
-0.4389139, 0.1529935, -1.434738, 0.07843138, 1, 0, 1,
-0.4351755, -0.2524527, -4.203937, 0.07450981, 1, 0, 1,
-0.4285165, -0.4320037, -1.031848, 0.06666667, 1, 0, 1,
-0.4267039, 1.357452, -0.1445393, 0.0627451, 1, 0, 1,
-0.4238687, 2.140963, -0.3297127, 0.05490196, 1, 0, 1,
-0.4218261, 0.6533981, -0.09149013, 0.05098039, 1, 0, 1,
-0.4170166, -0.1613805, -2.594548, 0.04313726, 1, 0, 1,
-0.4131647, -0.342136, -1.297826, 0.03921569, 1, 0, 1,
-0.4102916, -0.9718816, -4.366307, 0.03137255, 1, 0, 1,
-0.4048077, 0.2900541, 0.03051064, 0.02745098, 1, 0, 1,
-0.4047604, 1.030874, -0.8736841, 0.01960784, 1, 0, 1,
-0.4028282, 2.167919, -0.9299009, 0.01568628, 1, 0, 1,
-0.3973952, -0.03875708, -0.6658841, 0.007843138, 1, 0, 1,
-0.391817, 0.440927, -0.4144134, 0.003921569, 1, 0, 1,
-0.3916805, 0.5081952, -0.6913657, 0, 1, 0.003921569, 1,
-0.38792, 0.2195312, -0.5001597, 0, 1, 0.01176471, 1,
-0.3874787, -1.499349, -3.544047, 0, 1, 0.01568628, 1,
-0.3852086, 0.1511575, -0.906684, 0, 1, 0.02352941, 1,
-0.3802105, 0.729318, -0.8492798, 0, 1, 0.02745098, 1,
-0.3782679, -1.050124, -3.664594, 0, 1, 0.03529412, 1,
-0.3765437, -0.07397979, -3.214941, 0, 1, 0.03921569, 1,
-0.3677268, 1.871207, 0.2309734, 0, 1, 0.04705882, 1,
-0.3651518, -0.7686102, -1.846601, 0, 1, 0.05098039, 1,
-0.3598872, -0.2792106, -2.945321, 0, 1, 0.05882353, 1,
-0.3572191, -0.9204383, -2.286357, 0, 1, 0.0627451, 1,
-0.3489735, -0.6966886, -1.229015, 0, 1, 0.07058824, 1,
-0.3479342, -0.7267234, -2.592518, 0, 1, 0.07450981, 1,
-0.342283, 0.5834753, -0.5937586, 0, 1, 0.08235294, 1,
-0.3402857, 0.6872693, -0.8292464, 0, 1, 0.08627451, 1,
-0.3379163, 1.350311, 0.551416, 0, 1, 0.09411765, 1,
-0.3376699, -0.4646672, -3.054113, 0, 1, 0.1019608, 1,
-0.3349727, 0.8023857, -0.7467907, 0, 1, 0.1058824, 1,
-0.3319803, 0.2395512, -1.645911, 0, 1, 0.1137255, 1,
-0.3307841, -1.394393, -2.317026, 0, 1, 0.1176471, 1,
-0.3223136, 0.4615313, -1.738213, 0, 1, 0.1254902, 1,
-0.3214939, 0.4244735, 0.8940447, 0, 1, 0.1294118, 1,
-0.3183441, 0.4087797, -2.446382, 0, 1, 0.1372549, 1,
-0.3058416, 0.3094252, -0.1633672, 0, 1, 0.1411765, 1,
-0.3039585, -0.0007221102, -0.2082808, 0, 1, 0.1490196, 1,
-0.3015832, -1.049413, -4.061645, 0, 1, 0.1529412, 1,
-0.3014683, 0.08405695, -3.378551, 0, 1, 0.1607843, 1,
-0.2951732, 0.8924899, 0.7011498, 0, 1, 0.1647059, 1,
-0.2943251, 0.4782552, -1.619937, 0, 1, 0.172549, 1,
-0.2920906, 0.2822151, 0.4327056, 0, 1, 0.1764706, 1,
-0.2919953, 0.27649, -1.393728, 0, 1, 0.1843137, 1,
-0.2900046, -0.6619247, -2.976761, 0, 1, 0.1882353, 1,
-0.2876773, -0.6880261, -2.673999, 0, 1, 0.1960784, 1,
-0.2869804, -0.007111018, -0.1002428, 0, 1, 0.2039216, 1,
-0.2856407, -1.006956, -3.181723, 0, 1, 0.2078431, 1,
-0.2828417, -1.001619, -2.776511, 0, 1, 0.2156863, 1,
-0.2821918, 1.916225, 1.480452, 0, 1, 0.2196078, 1,
-0.2804201, 0.4619431, -0.6463996, 0, 1, 0.227451, 1,
-0.280071, -0.4912347, -2.914546, 0, 1, 0.2313726, 1,
-0.2785026, -0.0641278, -1.90516, 0, 1, 0.2392157, 1,
-0.2757248, 0.3916209, 0.04701611, 0, 1, 0.2431373, 1,
-0.2709395, -1.066862, -4.147766, 0, 1, 0.2509804, 1,
-0.2699352, 1.193904, 0.7012446, 0, 1, 0.254902, 1,
-0.2682596, -1.60543, -3.754862, 0, 1, 0.2627451, 1,
-0.2673893, -1.480295, -2.765315, 0, 1, 0.2666667, 1,
-0.2665085, 1.905526, 0.9162037, 0, 1, 0.2745098, 1,
-0.2642593, 0.2782335, 2.209414, 0, 1, 0.2784314, 1,
-0.2635905, 0.4921176, -1.14034, 0, 1, 0.2862745, 1,
-0.2626837, -0.02998385, -1.035493, 0, 1, 0.2901961, 1,
-0.2598942, 0.8031354, -0.6569322, 0, 1, 0.2980392, 1,
-0.2589217, 0.03337117, -0.7727621, 0, 1, 0.3058824, 1,
-0.2571962, 0.7980829, 1.187563, 0, 1, 0.3098039, 1,
-0.2536522, 0.5505855, -1.069228, 0, 1, 0.3176471, 1,
-0.2531298, -0.1862334, -2.738149, 0, 1, 0.3215686, 1,
-0.2524337, 1.760205, 3.099741, 0, 1, 0.3294118, 1,
-0.2450062, -0.2312318, -1.945729, 0, 1, 0.3333333, 1,
-0.2397719, -0.479275, -1.100798, 0, 1, 0.3411765, 1,
-0.2361887, 0.5193592, -2.066285, 0, 1, 0.345098, 1,
-0.2334556, 0.4191273, -0.2021942, 0, 1, 0.3529412, 1,
-0.2295772, -0.2876318, -4.456375, 0, 1, 0.3568628, 1,
-0.2249282, 1.705176, -1.813229, 0, 1, 0.3647059, 1,
-0.2230477, 2.365443, -1.727455, 0, 1, 0.3686275, 1,
-0.2226139, 0.8539864, 0.9908605, 0, 1, 0.3764706, 1,
-0.2223663, -0.6704503, -2.609734, 0, 1, 0.3803922, 1,
-0.2213176, 1.719145, 1.134763, 0, 1, 0.3882353, 1,
-0.2193655, -0.2178955, -2.035961, 0, 1, 0.3921569, 1,
-0.2188713, -0.3636029, -3.887806, 0, 1, 0.4, 1,
-0.2177427, 0.3265885, -0.9918292, 0, 1, 0.4078431, 1,
-0.2105404, 0.4124811, 0.3137792, 0, 1, 0.4117647, 1,
-0.2105345, 0.4614011, -1.29638, 0, 1, 0.4196078, 1,
-0.2090548, -0.6062883, -0.7371794, 0, 1, 0.4235294, 1,
-0.203339, -0.4854285, -1.327638, 0, 1, 0.4313726, 1,
-0.1979012, 0.4838875, -0.1149202, 0, 1, 0.4352941, 1,
-0.1958603, -0.5972546, -3.206666, 0, 1, 0.4431373, 1,
-0.1951266, -4.307721, -2.994583, 0, 1, 0.4470588, 1,
-0.1886106, 0.5693139, 0.4398868, 0, 1, 0.454902, 1,
-0.1859547, 1.037336, -1.272332, 0, 1, 0.4588235, 1,
-0.1830631, -2.206167, -0.9059248, 0, 1, 0.4666667, 1,
-0.1826864, -0.6645664, -2.815193, 0, 1, 0.4705882, 1,
-0.1823976, -0.9720724, -4.338157, 0, 1, 0.4784314, 1,
-0.1807032, -0.2002811, -1.388483, 0, 1, 0.4823529, 1,
-0.1802302, -1.444252, -4.894552, 0, 1, 0.4901961, 1,
-0.1792293, 1.923692, -0.1711943, 0, 1, 0.4941176, 1,
-0.1655475, -0.8064851, -3.575343, 0, 1, 0.5019608, 1,
-0.1561805, 1.37311, -1.084802, 0, 1, 0.509804, 1,
-0.1542036, 0.6237788, -0.2197163, 0, 1, 0.5137255, 1,
-0.152133, 1.409351, -0.3272358, 0, 1, 0.5215687, 1,
-0.149832, 0.7747371, 0.3618012, 0, 1, 0.5254902, 1,
-0.1431108, -0.5969639, -1.855957, 0, 1, 0.5333334, 1,
-0.141404, -1.584186, -2.77698, 0, 1, 0.5372549, 1,
-0.1411149, -0.9697773, -1.261903, 0, 1, 0.5450981, 1,
-0.1356111, -0.2765545, -3.576873, 0, 1, 0.5490196, 1,
-0.132878, -0.9691061, -2.357902, 0, 1, 0.5568628, 1,
-0.1326415, -1.301678, -3.377884, 0, 1, 0.5607843, 1,
-0.1316183, -0.3301897, -2.968256, 0, 1, 0.5686275, 1,
-0.1303265, -0.006249773, -1.869455, 0, 1, 0.572549, 1,
-0.1226117, -0.2816861, -1.588351, 0, 1, 0.5803922, 1,
-0.1221437, 0.6630065, -2.72145, 0, 1, 0.5843138, 1,
-0.1210422, -2.13167, -3.793695, 0, 1, 0.5921569, 1,
-0.1169438, 1.241393, -0.4947236, 0, 1, 0.5960785, 1,
-0.1156061, 1.974385, 0.5524099, 0, 1, 0.6039216, 1,
-0.112756, -2.251504, -1.560504, 0, 1, 0.6117647, 1,
-0.1120775, 0.8887548, -0.1762771, 0, 1, 0.6156863, 1,
-0.1067391, -0.7715927, -3.881775, 0, 1, 0.6235294, 1,
-0.1042786, -2.284997, -1.994465, 0, 1, 0.627451, 1,
-0.1023807, 0.3784223, -0.2823461, 0, 1, 0.6352941, 1,
-0.1012138, -0.2283535, -3.568626, 0, 1, 0.6392157, 1,
-0.1003596, -0.567997, -2.231672, 0, 1, 0.6470588, 1,
-0.09344419, 2.674025, 0.006949176, 0, 1, 0.6509804, 1,
-0.09274632, 0.6796099, -0.130311, 0, 1, 0.6588235, 1,
-0.08847674, 0.186979, -0.03663969, 0, 1, 0.6627451, 1,
-0.08840346, 0.9448824, 0.9746023, 0, 1, 0.6705883, 1,
-0.08699901, 0.1055132, 0.4730355, 0, 1, 0.6745098, 1,
-0.08510393, 0.1983688, -1.108683, 0, 1, 0.682353, 1,
-0.07067839, 0.8888277, 0.6822255, 0, 1, 0.6862745, 1,
-0.06904306, 0.02048817, -2.371954, 0, 1, 0.6941177, 1,
-0.0672258, -0.2286725, -3.145759, 0, 1, 0.7019608, 1,
-0.06460451, 0.424472, -0.1187797, 0, 1, 0.7058824, 1,
-0.05566861, -1.259732, -5.139151, 0, 1, 0.7137255, 1,
-0.05387835, 1.321763, 0.6250095, 0, 1, 0.7176471, 1,
-0.05304148, -0.7101038, -0.7814011, 0, 1, 0.7254902, 1,
-0.05018324, 0.3985973, 0.751631, 0, 1, 0.7294118, 1,
-0.04835164, -1.538414, -3.178466, 0, 1, 0.7372549, 1,
-0.04715218, -1.629081, -2.837374, 0, 1, 0.7411765, 1,
-0.04522504, -0.4400108, -2.649988, 0, 1, 0.7490196, 1,
-0.04269283, 0.5312647, 0.9018045, 0, 1, 0.7529412, 1,
-0.04084043, -0.2108551, -3.368886, 0, 1, 0.7607843, 1,
-0.04010951, 0.644976, 0.9776769, 0, 1, 0.7647059, 1,
-0.03844234, 0.8686808, 2.12579, 0, 1, 0.772549, 1,
-0.03545221, -0.5708215, -4.12955, 0, 1, 0.7764706, 1,
-0.03487194, -1.207811, -3.549442, 0, 1, 0.7843137, 1,
-0.03403749, 0.3955308, 1.480588, 0, 1, 0.7882353, 1,
-0.03321627, -0.8938846, -2.261782, 0, 1, 0.7960784, 1,
-0.03129868, -1.157604, -3.244708, 0, 1, 0.8039216, 1,
-0.02882983, -0.02737361, -3.06663, 0, 1, 0.8078431, 1,
-0.02555697, -0.9861345, -3.404836, 0, 1, 0.8156863, 1,
-0.02111407, -0.2583178, -2.698953, 0, 1, 0.8196079, 1,
-0.02043279, 0.3660438, -0.6194423, 0, 1, 0.827451, 1,
-0.009091341, 0.8516172, -0.8336442, 0, 1, 0.8313726, 1,
-0.007533785, 0.4803761, 1.611158, 0, 1, 0.8392157, 1,
-0.005006873, 1.695919, -2.678993, 0, 1, 0.8431373, 1,
0.001581582, 2.138045, 0.8173169, 0, 1, 0.8509804, 1,
0.002318698, -0.9019028, 4.953088, 0, 1, 0.854902, 1,
0.002345718, -0.1104023, 3.960403, 0, 1, 0.8627451, 1,
0.002807445, -0.997276, 5.045444, 0, 1, 0.8666667, 1,
0.003027991, -0.1501056, 3.338687, 0, 1, 0.8745098, 1,
0.006363637, -0.5914789, 3.420291, 0, 1, 0.8784314, 1,
0.007250709, -0.5404428, 1.970591, 0, 1, 0.8862745, 1,
0.00894226, -0.1870172, 3.754758, 0, 1, 0.8901961, 1,
0.01540866, -0.7954944, 4.235057, 0, 1, 0.8980392, 1,
0.02521484, 0.04525614, 0.5012102, 0, 1, 0.9058824, 1,
0.02940274, 0.01140897, 0.3829214, 0, 1, 0.9098039, 1,
0.03068452, 0.291995, -0.2875701, 0, 1, 0.9176471, 1,
0.0317053, -0.3864512, 3.924087, 0, 1, 0.9215686, 1,
0.03460008, -1.446233, 2.500529, 0, 1, 0.9294118, 1,
0.03899449, 2.249565, 1.464604, 0, 1, 0.9333333, 1,
0.04069996, 3.020964, 2.012509, 0, 1, 0.9411765, 1,
0.04189138, 0.8626931, -0.9159928, 0, 1, 0.945098, 1,
0.04283148, 1.278494, 1.224296, 0, 1, 0.9529412, 1,
0.0500783, 0.7314301, 0.3266388, 0, 1, 0.9568627, 1,
0.05416455, -1.314363, 2.444365, 0, 1, 0.9647059, 1,
0.05653566, -0.9393677, 5.00106, 0, 1, 0.9686275, 1,
0.05793045, 0.4757785, 0.4900652, 0, 1, 0.9764706, 1,
0.05860143, -0.693504, 4.332301, 0, 1, 0.9803922, 1,
0.06506044, -0.5130222, 3.030942, 0, 1, 0.9882353, 1,
0.06916351, 0.9023062, 0.2949821, 0, 1, 0.9921569, 1,
0.06990226, 1.675073, -0.5371438, 0, 1, 1, 1,
0.07022818, 0.9294149, -2.532127, 0, 0.9921569, 1, 1,
0.07261353, 0.1143727, 1.571304, 0, 0.9882353, 1, 1,
0.08069167, -0.7544166, 2.406331, 0, 0.9803922, 1, 1,
0.08551064, 0.1024071, -0.1659238, 0, 0.9764706, 1, 1,
0.08676879, 0.7594368, -1.598854, 0, 0.9686275, 1, 1,
0.08864049, 0.1121539, 0.9399269, 0, 0.9647059, 1, 1,
0.09113441, 0.1667846, 1.595701, 0, 0.9568627, 1, 1,
0.0936279, -0.7126648, 5.156349, 0, 0.9529412, 1, 1,
0.09511947, 0.0661142, 1.374385, 0, 0.945098, 1, 1,
0.09577631, 0.007777284, 0.2078515, 0, 0.9411765, 1, 1,
0.09660793, -0.3438593, 3.782638, 0, 0.9333333, 1, 1,
0.09772617, -0.6230558, 1.682942, 0, 0.9294118, 1, 1,
0.100183, 0.4644187, -0.1268696, 0, 0.9215686, 1, 1,
0.1036684, -0.3675425, 3.470909, 0, 0.9176471, 1, 1,
0.106011, -0.7875263, 1.143834, 0, 0.9098039, 1, 1,
0.1066521, 1.470437, 0.4995499, 0, 0.9058824, 1, 1,
0.1103333, -1.207188, 2.82829, 0, 0.8980392, 1, 1,
0.113277, -1.468648, 2.172568, 0, 0.8901961, 1, 1,
0.1166613, -0.7587082, 2.58206, 0, 0.8862745, 1, 1,
0.1226231, -0.2045241, 3.81025, 0, 0.8784314, 1, 1,
0.1234117, -0.7621907, 4.201335, 0, 0.8745098, 1, 1,
0.1243555, 0.90483, 1.121118, 0, 0.8666667, 1, 1,
0.1355448, 1.959963, -0.2750696, 0, 0.8627451, 1, 1,
0.1365121, -0.8303855, 3.582975, 0, 0.854902, 1, 1,
0.1365757, -0.2678523, 2.794434, 0, 0.8509804, 1, 1,
0.1384726, 0.04268676, 1.117072, 0, 0.8431373, 1, 1,
0.1388049, 1.140484, -1.397176, 0, 0.8392157, 1, 1,
0.1393125, 0.08001957, 1.373464, 0, 0.8313726, 1, 1,
0.1393736, -2.243372, 0.6017327, 0, 0.827451, 1, 1,
0.1468802, 0.1546552, -0.7161002, 0, 0.8196079, 1, 1,
0.1469362, 0.1664093, 1.639942, 0, 0.8156863, 1, 1,
0.1474618, -0.09561015, 1.203297, 0, 0.8078431, 1, 1,
0.1500363, -0.3855882, 2.503956, 0, 0.8039216, 1, 1,
0.1544835, -0.2061239, 1.44498, 0, 0.7960784, 1, 1,
0.155187, 2.473611, 0.5109798, 0, 0.7882353, 1, 1,
0.1575742, -1.30176, 2.934769, 0, 0.7843137, 1, 1,
0.1590658, -1.238572, 1.852238, 0, 0.7764706, 1, 1,
0.1608975, -0.7948793, 3.996374, 0, 0.772549, 1, 1,
0.1618206, -0.9424996, 2.299263, 0, 0.7647059, 1, 1,
0.1619452, 0.3971096, 1.302179, 0, 0.7607843, 1, 1,
0.1628027, 1.03203, 0.4604273, 0, 0.7529412, 1, 1,
0.1642855, 0.9150155, 1.112698, 0, 0.7490196, 1, 1,
0.1644211, 0.153345, 3.057852, 0, 0.7411765, 1, 1,
0.1680764, -0.9029557, 4.809043, 0, 0.7372549, 1, 1,
0.1722174, 1.5781, -2.752825, 0, 0.7294118, 1, 1,
0.173213, -2.38667, 3.111265, 0, 0.7254902, 1, 1,
0.1734385, 0.7543864, 0.4574336, 0, 0.7176471, 1, 1,
0.1765853, -0.01364467, 2.042559, 0, 0.7137255, 1, 1,
0.1804386, 0.8959716, -0.352662, 0, 0.7058824, 1, 1,
0.1804418, 0.9147903, -1.878096, 0, 0.6980392, 1, 1,
0.1808619, -0.8715708, 2.221766, 0, 0.6941177, 1, 1,
0.1811516, 0.2847441, 0.3737986, 0, 0.6862745, 1, 1,
0.1823723, 0.5032409, 1.123693, 0, 0.682353, 1, 1,
0.1835053, -1.424456, 3.757069, 0, 0.6745098, 1, 1,
0.1835733, -1.388036, 2.010662, 0, 0.6705883, 1, 1,
0.1880524, 0.7327276, 0.295786, 0, 0.6627451, 1, 1,
0.1882315, 0.6393938, 0.2389019, 0, 0.6588235, 1, 1,
0.1904689, -0.04411187, 4.019248, 0, 0.6509804, 1, 1,
0.194886, 0.9289638, -0.5741501, 0, 0.6470588, 1, 1,
0.1985261, -1.110162, 3.940742, 0, 0.6392157, 1, 1,
0.2128385, -0.08937396, 4.006439, 0, 0.6352941, 1, 1,
0.2144201, 2.92699, -1.15218, 0, 0.627451, 1, 1,
0.215483, 0.8747576, 1.457128, 0, 0.6235294, 1, 1,
0.2189243, -0.0856763, 1.449047, 0, 0.6156863, 1, 1,
0.2207722, -0.5031379, 2.931662, 0, 0.6117647, 1, 1,
0.2217584, -0.6262028, 1.5731, 0, 0.6039216, 1, 1,
0.2270199, -0.9214199, 1.75745, 0, 0.5960785, 1, 1,
0.2313733, -0.3790366, 1.547561, 0, 0.5921569, 1, 1,
0.2350745, -0.8032153, 4.040895, 0, 0.5843138, 1, 1,
0.2354168, -0.6038274, 2.608268, 0, 0.5803922, 1, 1,
0.2391021, -1.749964, 2.733493, 0, 0.572549, 1, 1,
0.2397857, -1.613109, 4.539683, 0, 0.5686275, 1, 1,
0.2426026, 0.5072458, 1.238744, 0, 0.5607843, 1, 1,
0.2462031, -0.1108243, 1.887864, 0, 0.5568628, 1, 1,
0.2468265, 0.00549318, 4.031687, 0, 0.5490196, 1, 1,
0.24826, -0.8719772, 1.367973, 0, 0.5450981, 1, 1,
0.2554753, -0.4000526, 2.657467, 0, 0.5372549, 1, 1,
0.2663149, 0.03350348, 0.9671804, 0, 0.5333334, 1, 1,
0.2664464, -0.149115, 2.451531, 0, 0.5254902, 1, 1,
0.2668581, 2.620718, 3.056556, 0, 0.5215687, 1, 1,
0.2678295, -0.5907806, 2.708302, 0, 0.5137255, 1, 1,
0.2723725, -1.808284, 3.766474, 0, 0.509804, 1, 1,
0.2774603, -1.360955, 2.786039, 0, 0.5019608, 1, 1,
0.2779511, 1.445217, 1.60641, 0, 0.4941176, 1, 1,
0.2787046, -0.6961918, 3.300525, 0, 0.4901961, 1, 1,
0.2910776, -0.03566182, 2.9988, 0, 0.4823529, 1, 1,
0.2945468, -1.509105, 1.088659, 0, 0.4784314, 1, 1,
0.2966275, -0.9607754, 3.994524, 0, 0.4705882, 1, 1,
0.2966517, -0.409151, 3.643613, 0, 0.4666667, 1, 1,
0.2972515, 2.051157, -0.4970564, 0, 0.4588235, 1, 1,
0.2988025, 0.7423576, -0.4276684, 0, 0.454902, 1, 1,
0.2997442, -1.083809, 2.886799, 0, 0.4470588, 1, 1,
0.2999793, -0.1862992, 0.7261279, 0, 0.4431373, 1, 1,
0.301005, 0.9765337, 0.6637505, 0, 0.4352941, 1, 1,
0.3038151, -1.313503, 3.345125, 0, 0.4313726, 1, 1,
0.3042927, -0.1392387, 3.247603, 0, 0.4235294, 1, 1,
0.3063859, -2.212945, 3.384071, 0, 0.4196078, 1, 1,
0.3092975, -0.266529, 0.9781773, 0, 0.4117647, 1, 1,
0.3103251, 2.761628, -0.6029112, 0, 0.4078431, 1, 1,
0.312483, 0.09136142, 0.7652208, 0, 0.4, 1, 1,
0.313975, -0.09578327, 1.553138, 0, 0.3921569, 1, 1,
0.3145582, 0.1725149, 0.4198068, 0, 0.3882353, 1, 1,
0.3153339, 1.13278, -0.7027134, 0, 0.3803922, 1, 1,
0.3165314, 0.1674157, 0.444411, 0, 0.3764706, 1, 1,
0.3171808, -0.6962983, 1.771268, 0, 0.3686275, 1, 1,
0.3197591, -0.3214818, 2.28002, 0, 0.3647059, 1, 1,
0.3210511, 0.1074813, 1.026669, 0, 0.3568628, 1, 1,
0.3214393, -0.7149058, 3.312006, 0, 0.3529412, 1, 1,
0.3225293, -0.2973065, 2.152902, 0, 0.345098, 1, 1,
0.3265107, -0.7337966, 1.311811, 0, 0.3411765, 1, 1,
0.3269851, -0.2629256, 2.799693, 0, 0.3333333, 1, 1,
0.3288257, -0.9132085, 2.954908, 0, 0.3294118, 1, 1,
0.3292218, 0.7913776, 1.151884, 0, 0.3215686, 1, 1,
0.3294419, -1.126846, 2.512609, 0, 0.3176471, 1, 1,
0.3319482, 0.9681435, -1.209852, 0, 0.3098039, 1, 1,
0.3331582, 1.97609, 0.9170557, 0, 0.3058824, 1, 1,
0.3365341, 0.508004, 0.6922382, 0, 0.2980392, 1, 1,
0.3396742, -0.2492497, 0.3505794, 0, 0.2901961, 1, 1,
0.3397106, -1.519811, 3.556608, 0, 0.2862745, 1, 1,
0.3407697, -1.025952, 2.714237, 0, 0.2784314, 1, 1,
0.3422798, -1.653664, 2.867195, 0, 0.2745098, 1, 1,
0.3423362, 0.4531792, 1.295519, 0, 0.2666667, 1, 1,
0.3444256, -0.7598409, 3.80095, 0, 0.2627451, 1, 1,
0.3480085, 0.32322, 1.487428, 0, 0.254902, 1, 1,
0.3485624, -0.9559529, 2.337502, 0, 0.2509804, 1, 1,
0.3493855, -0.08143307, 3.775808, 0, 0.2431373, 1, 1,
0.3500779, -0.8279488, 2.242013, 0, 0.2392157, 1, 1,
0.3521158, 0.1607256, 0.6730024, 0, 0.2313726, 1, 1,
0.3548746, -0.5222148, 1.695754, 0, 0.227451, 1, 1,
0.3554669, -0.7130671, 3.788516, 0, 0.2196078, 1, 1,
0.3577092, 0.7216564, -0.005971525, 0, 0.2156863, 1, 1,
0.3582342, -0.229599, 0.6162983, 0, 0.2078431, 1, 1,
0.3596782, 0.1826936, 1.35717, 0, 0.2039216, 1, 1,
0.3634954, 0.05927002, 1.549889, 0, 0.1960784, 1, 1,
0.3642306, 0.5827215, 0.03180235, 0, 0.1882353, 1, 1,
0.3642699, 1.822552, 1.288274, 0, 0.1843137, 1, 1,
0.3654986, -0.1195077, 3.125062, 0, 0.1764706, 1, 1,
0.368328, 1.41725, -0.6167597, 0, 0.172549, 1, 1,
0.3706304, 0.9911106, -1.356265, 0, 0.1647059, 1, 1,
0.3745937, 0.9057909, -0.8062308, 0, 0.1607843, 1, 1,
0.3763726, 0.5702606, 1.087633, 0, 0.1529412, 1, 1,
0.380522, -2.438241, 3.62996, 0, 0.1490196, 1, 1,
0.3823538, 0.6478314, -0.6937244, 0, 0.1411765, 1, 1,
0.3873522, 0.04801412, 0.6072358, 0, 0.1372549, 1, 1,
0.39087, 0.1130029, 1.281348, 0, 0.1294118, 1, 1,
0.3909684, -1.009652, 2.78339, 0, 0.1254902, 1, 1,
0.392554, 1.887368, 0.0007750945, 0, 0.1176471, 1, 1,
0.3946721, 0.5425667, 1.819656, 0, 0.1137255, 1, 1,
0.4003426, -0.5804058, 1.068484, 0, 0.1058824, 1, 1,
0.4014305, -0.1566992, 5.012222, 0, 0.09803922, 1, 1,
0.4043732, 0.3527142, 1.084337, 0, 0.09411765, 1, 1,
0.4076717, -0.7252112, 1.58935, 0, 0.08627451, 1, 1,
0.4088344, -0.7554507, 3.875774, 0, 0.08235294, 1, 1,
0.4110035, 0.2301788, 1.604777, 0, 0.07450981, 1, 1,
0.4113588, -1.477474, 1.878557, 0, 0.07058824, 1, 1,
0.411562, -1.697078, 1.571229, 0, 0.0627451, 1, 1,
0.4157344, 0.4066103, 0.3607431, 0, 0.05882353, 1, 1,
0.4202413, 0.4014376, 0.9015445, 0, 0.05098039, 1, 1,
0.4215488, 0.7271345, -0.6217709, 0, 0.04705882, 1, 1,
0.4236288, 1.02476, 1.79079, 0, 0.03921569, 1, 1,
0.4316475, 0.2420423, 2.007832, 0, 0.03529412, 1, 1,
0.4351109, 1.643716, -0.2471883, 0, 0.02745098, 1, 1,
0.4397545, -0.1179202, 1.654643, 0, 0.02352941, 1, 1,
0.4400995, 0.425634, -0.2741312, 0, 0.01568628, 1, 1,
0.4493266, -0.05829388, 1.403924, 0, 0.01176471, 1, 1,
0.4554425, 1.255282, -1.343891, 0, 0.003921569, 1, 1,
0.4581447, -0.8490722, 1.769369, 0.003921569, 0, 1, 1,
0.4610578, -0.5726854, 2.34635, 0.007843138, 0, 1, 1,
0.4671198, -2.442574, 2.332328, 0.01568628, 0, 1, 1,
0.4675956, -0.2034588, 1.095865, 0.01960784, 0, 1, 1,
0.4681519, 0.7145623, 0.1293683, 0.02745098, 0, 1, 1,
0.4728454, -0.6162081, 3.273929, 0.03137255, 0, 1, 1,
0.4743068, -0.6004898, 2.430296, 0.03921569, 0, 1, 1,
0.4749626, 0.8904166, -0.934163, 0.04313726, 0, 1, 1,
0.4771, -0.5088562, 3.497578, 0.05098039, 0, 1, 1,
0.4794589, -0.5644586, 3.960245, 0.05490196, 0, 1, 1,
0.481903, -0.01530893, 1.202753, 0.0627451, 0, 1, 1,
0.485455, 0.6228392, 1.366003, 0.06666667, 0, 1, 1,
0.4861594, 1.226684, 0.5220733, 0.07450981, 0, 1, 1,
0.4939959, 0.3613842, 1.276346, 0.07843138, 0, 1, 1,
0.4943028, -0.3144721, 2.797075, 0.08627451, 0, 1, 1,
0.495343, 0.5581662, -0.08780047, 0.09019608, 0, 1, 1,
0.4993897, -0.765143, 2.218739, 0.09803922, 0, 1, 1,
0.5013515, -1.955841, 3.825053, 0.1058824, 0, 1, 1,
0.5016543, 0.7608094, 1.593517, 0.1098039, 0, 1, 1,
0.5034125, -1.141481, 1.192906, 0.1176471, 0, 1, 1,
0.5043111, 0.4120393, 2.12244, 0.1215686, 0, 1, 1,
0.5058085, -1.351353, 4.780757, 0.1294118, 0, 1, 1,
0.5085817, -0.4193617, 3.302234, 0.1333333, 0, 1, 1,
0.5087574, -0.4365075, 0.01763503, 0.1411765, 0, 1, 1,
0.5138624, 1.059535, 2.227073, 0.145098, 0, 1, 1,
0.516751, 0.8533952, 0.1192097, 0.1529412, 0, 1, 1,
0.5194539, -0.5605174, 1.784314, 0.1568628, 0, 1, 1,
0.5233966, -2.487992, 2.945562, 0.1647059, 0, 1, 1,
0.5245246, 0.5971118, 1.408067, 0.1686275, 0, 1, 1,
0.5271982, -0.03500405, 0.8392633, 0.1764706, 0, 1, 1,
0.527515, 1.109339, 1.190093, 0.1803922, 0, 1, 1,
0.5300072, 0.4187192, 0.2459038, 0.1882353, 0, 1, 1,
0.5412202, 1.613146, 0.8536571, 0.1921569, 0, 1, 1,
0.5452524, -1.035659, 2.612602, 0.2, 0, 1, 1,
0.545256, 0.185722, -0.133735, 0.2078431, 0, 1, 1,
0.5468574, -0.8160863, 0.8125783, 0.2117647, 0, 1, 1,
0.5491396, 0.1644225, 0.5948516, 0.2196078, 0, 1, 1,
0.5517208, -2.343472, 3.275623, 0.2235294, 0, 1, 1,
0.5523749, -0.4854533, 3.211779, 0.2313726, 0, 1, 1,
0.5541953, -0.05902585, 3.347301, 0.2352941, 0, 1, 1,
0.5590571, -0.6714608, 3.234879, 0.2431373, 0, 1, 1,
0.5605676, 0.6630689, -0.295989, 0.2470588, 0, 1, 1,
0.5639064, -0.4468282, 3.272305, 0.254902, 0, 1, 1,
0.5659042, 0.04715561, 1.491789, 0.2588235, 0, 1, 1,
0.5676337, -0.8667668, 0.5323834, 0.2666667, 0, 1, 1,
0.5705897, -0.09555057, 0.5085858, 0.2705882, 0, 1, 1,
0.5714418, 0.04804064, 1.758572, 0.2784314, 0, 1, 1,
0.571874, -0.6884317, 1.622212, 0.282353, 0, 1, 1,
0.5751913, 0.4023453, 0.5512037, 0.2901961, 0, 1, 1,
0.5833014, 0.5584897, -1.628991, 0.2941177, 0, 1, 1,
0.5838439, -0.7340873, 1.469502, 0.3019608, 0, 1, 1,
0.5883092, 0.05274672, 2.04461, 0.3098039, 0, 1, 1,
0.5896176, -1.703614, 4.364576, 0.3137255, 0, 1, 1,
0.5906546, 0.5071632, 1.948902, 0.3215686, 0, 1, 1,
0.5917718, -1.60389, 3.159711, 0.3254902, 0, 1, 1,
0.5926319, -0.01404852, 1.76433, 0.3333333, 0, 1, 1,
0.6002831, -1.804525, 2.056052, 0.3372549, 0, 1, 1,
0.6031364, -0.03942732, 1.467992, 0.345098, 0, 1, 1,
0.6121421, 2.417089, 1.148967, 0.3490196, 0, 1, 1,
0.6177338, -0.9793921, 2.797573, 0.3568628, 0, 1, 1,
0.6188765, 0.4919356, 0.1791091, 0.3607843, 0, 1, 1,
0.626496, -0.05725582, 1.835559, 0.3686275, 0, 1, 1,
0.6277602, 0.1100777, 1.876585, 0.372549, 0, 1, 1,
0.6277909, -1.653704, 2.680062, 0.3803922, 0, 1, 1,
0.6287884, 0.4722089, 2.058974, 0.3843137, 0, 1, 1,
0.6305466, -0.8172832, 1.80998, 0.3921569, 0, 1, 1,
0.6321833, -0.8128052, 2.006169, 0.3960784, 0, 1, 1,
0.6333882, 0.5123356, 0.6715991, 0.4039216, 0, 1, 1,
0.640617, -0.9962676, 2.605825, 0.4117647, 0, 1, 1,
0.6407385, 0.6538909, 0.7049777, 0.4156863, 0, 1, 1,
0.6492898, -1.178109, 1.533486, 0.4235294, 0, 1, 1,
0.6507111, -1.236578, 2.839677, 0.427451, 0, 1, 1,
0.6545299, -0.002514181, 2.993505, 0.4352941, 0, 1, 1,
0.6547675, -1.383213, 0.5349198, 0.4392157, 0, 1, 1,
0.6624138, 0.6748879, 0.385436, 0.4470588, 0, 1, 1,
0.6644905, -0.203015, 1.295629, 0.4509804, 0, 1, 1,
0.6673627, -1.17109, 1.988531, 0.4588235, 0, 1, 1,
0.6696749, 1.759821, 0.0988215, 0.4627451, 0, 1, 1,
0.6708063, 0.4861264, 1.121724, 0.4705882, 0, 1, 1,
0.6720312, -0.6429083, 2.524893, 0.4745098, 0, 1, 1,
0.6755145, -0.2830862, 2.659896, 0.4823529, 0, 1, 1,
0.6757408, -0.327875, 2.567878, 0.4862745, 0, 1, 1,
0.6780832, 2.079849, -0.614775, 0.4941176, 0, 1, 1,
0.6838372, -0.4337525, 3.430141, 0.5019608, 0, 1, 1,
0.6866743, -0.2683006, 1.972646, 0.5058824, 0, 1, 1,
0.6891865, -1.670172, 3.857972, 0.5137255, 0, 1, 1,
0.6898575, -0.7429169, 2.331365, 0.5176471, 0, 1, 1,
0.6915779, -0.9550707, 1.167011, 0.5254902, 0, 1, 1,
0.6916377, 0.3762535, -0.3723177, 0.5294118, 0, 1, 1,
0.6928953, 0.3336837, 2.403482, 0.5372549, 0, 1, 1,
0.6946851, -1.532379, 2.215071, 0.5411765, 0, 1, 1,
0.697548, -0.5650826, 1.860024, 0.5490196, 0, 1, 1,
0.699387, 1.709122, -0.2048315, 0.5529412, 0, 1, 1,
0.7036417, 0.3729267, -0.05468344, 0.5607843, 0, 1, 1,
0.706861, -1.49966, 2.103628, 0.5647059, 0, 1, 1,
0.7173952, 0.2083794, 1.150272, 0.572549, 0, 1, 1,
0.7206812, -1.205652, 2.243388, 0.5764706, 0, 1, 1,
0.7243091, 0.3388923, 1.221562, 0.5843138, 0, 1, 1,
0.7307301, -0.6556413, 2.846739, 0.5882353, 0, 1, 1,
0.7307728, -0.9437798, 2.110678, 0.5960785, 0, 1, 1,
0.73168, -0.4088755, 2.147477, 0.6039216, 0, 1, 1,
0.7382392, 1.214036, 1.698611, 0.6078432, 0, 1, 1,
0.7391232, 1.334471, 2.747122, 0.6156863, 0, 1, 1,
0.74567, -0.4287174, 0.9885889, 0.6196079, 0, 1, 1,
0.7457538, -0.527115, 2.400699, 0.627451, 0, 1, 1,
0.749194, 0.3025779, -0.5897422, 0.6313726, 0, 1, 1,
0.7513561, 0.5786575, 0.9072455, 0.6392157, 0, 1, 1,
0.7520373, -1.938835, 1.221182, 0.6431373, 0, 1, 1,
0.7530789, -1.044248, 2.876391, 0.6509804, 0, 1, 1,
0.7531446, -0.4597978, 1.574072, 0.654902, 0, 1, 1,
0.755958, 0.8809631, 2.245748, 0.6627451, 0, 1, 1,
0.7569677, -0.2499388, 2.470492, 0.6666667, 0, 1, 1,
0.7586421, -1.678995, 2.774917, 0.6745098, 0, 1, 1,
0.7631582, 0.164475, 2.763526, 0.6784314, 0, 1, 1,
0.7633936, -2.234813, 3.12392, 0.6862745, 0, 1, 1,
0.7636194, 0.3416592, 1.293253, 0.6901961, 0, 1, 1,
0.7681332, 0.3031425, 2.001382, 0.6980392, 0, 1, 1,
0.7821999, 0.658943, 1.979348, 0.7058824, 0, 1, 1,
0.7910048, -0.4102516, 1.373361, 0.7098039, 0, 1, 1,
0.7939276, -0.6858617, 3.544321, 0.7176471, 0, 1, 1,
0.7954777, 0.9833305, 2.649188, 0.7215686, 0, 1, 1,
0.8070328, -0.363197, 3.00155, 0.7294118, 0, 1, 1,
0.816325, 0.6180201, 1.290608, 0.7333333, 0, 1, 1,
0.8175561, 0.2136599, 1.894205, 0.7411765, 0, 1, 1,
0.8231204, -0.4949096, 2.604593, 0.7450981, 0, 1, 1,
0.8238521, -0.4778732, 0.02562587, 0.7529412, 0, 1, 1,
0.8254967, -1.428789, 2.700104, 0.7568628, 0, 1, 1,
0.8261259, 0.08249568, 3.282681, 0.7647059, 0, 1, 1,
0.828169, -0.3007312, 2.507991, 0.7686275, 0, 1, 1,
0.8319639, -1.141978, 1.437481, 0.7764706, 0, 1, 1,
0.8376331, 0.4289662, 1.805373, 0.7803922, 0, 1, 1,
0.8428237, -0.2357883, 2.340577, 0.7882353, 0, 1, 1,
0.8430852, -0.5716457, 1.855922, 0.7921569, 0, 1, 1,
0.8442249, -0.442305, 0.2427067, 0.8, 0, 1, 1,
0.84714, 1.3196, -0.2285897, 0.8078431, 0, 1, 1,
0.8523055, -0.148942, 3.716841, 0.8117647, 0, 1, 1,
0.853857, 0.8998111, 1.074893, 0.8196079, 0, 1, 1,
0.8556294, 0.04451034, 3.14432, 0.8235294, 0, 1, 1,
0.8580254, -1.022328, 1.445523, 0.8313726, 0, 1, 1,
0.8603362, 1.610945, 0.00201125, 0.8352941, 0, 1, 1,
0.8625479, 0.3300115, 1.632459, 0.8431373, 0, 1, 1,
0.8637007, 1.826401, 0.5352924, 0.8470588, 0, 1, 1,
0.8748899, 0.4730381, 1.182426, 0.854902, 0, 1, 1,
0.8777708, -0.9088066, 1.20303, 0.8588235, 0, 1, 1,
0.8793728, 0.6462051, 1.186529, 0.8666667, 0, 1, 1,
0.8888775, 0.493488, -0.3257143, 0.8705882, 0, 1, 1,
0.8891725, 1.480834, 1.055794, 0.8784314, 0, 1, 1,
0.8949143, 1.66987, 0.9760333, 0.8823529, 0, 1, 1,
0.8992777, 2.214412, 0.1449814, 0.8901961, 0, 1, 1,
0.9002512, 0.8722267, 0.6284397, 0.8941177, 0, 1, 1,
0.9039376, 1.73777, 1.594504, 0.9019608, 0, 1, 1,
0.920615, -1.42859, 4.802474, 0.9098039, 0, 1, 1,
0.9242401, 0.3174834, 0.2016687, 0.9137255, 0, 1, 1,
0.9275591, -0.5561771, 2.590775, 0.9215686, 0, 1, 1,
0.9340526, -1.071584, 2.24763, 0.9254902, 0, 1, 1,
0.9341578, -0.338772, 1.3578, 0.9333333, 0, 1, 1,
0.9347796, 1.007657, -0.1468042, 0.9372549, 0, 1, 1,
0.9364375, -0.436794, 1.738424, 0.945098, 0, 1, 1,
0.9416852, -1.022838, 3.032811, 0.9490196, 0, 1, 1,
0.9440878, 0.1320304, 1.046913, 0.9568627, 0, 1, 1,
0.9443066, 0.374049, 2.517945, 0.9607843, 0, 1, 1,
0.9469225, -0.4908477, 1.879644, 0.9686275, 0, 1, 1,
0.9484358, 0.1969876, 1.326838, 0.972549, 0, 1, 1,
0.9486498, -0.7589789, 0.7758508, 0.9803922, 0, 1, 1,
0.9508582, 0.9920428, 2.847982, 0.9843137, 0, 1, 1,
0.9525347, 0.4065337, 1.33916, 0.9921569, 0, 1, 1,
0.9560426, 0.957417, 0.252598, 0.9960784, 0, 1, 1,
0.9691705, 0.3326417, 0.9126418, 1, 0, 0.9960784, 1,
0.9725014, -1.464124, 2.710332, 1, 0, 0.9882353, 1,
0.9727997, -0.1954569, 1.785565, 1, 0, 0.9843137, 1,
0.9782144, -0.1764064, 3.51381, 1, 0, 0.9764706, 1,
0.9848583, 0.3697471, 2.655695, 1, 0, 0.972549, 1,
0.9861356, 0.2305767, 3.822615, 1, 0, 0.9647059, 1,
0.9907315, 0.486855, 0.08474358, 1, 0, 0.9607843, 1,
0.9955416, 0.04512643, 2.565092, 1, 0, 0.9529412, 1,
0.9969248, 0.1434601, 2.07589, 1, 0, 0.9490196, 1,
0.9988101, 0.4530334, 1.966921, 1, 0, 0.9411765, 1,
1.000541, 0.9546853, 1.30498, 1, 0, 0.9372549, 1,
1.004815, -0.953669, 3.513227, 1, 0, 0.9294118, 1,
1.007149, 0.6602421, 1.650257, 1, 0, 0.9254902, 1,
1.0092, 1.704033, -0.421034, 1, 0, 0.9176471, 1,
1.011376, 0.4418927, 0.2222923, 1, 0, 0.9137255, 1,
1.011687, -0.5797039, 1.352515, 1, 0, 0.9058824, 1,
1.021306, 0.65452, 0.2858419, 1, 0, 0.9019608, 1,
1.026219, -0.9968829, 4.045943, 1, 0, 0.8941177, 1,
1.031537, 1.320205, -0.2518963, 1, 0, 0.8862745, 1,
1.036666, -1.314315, 2.415722, 1, 0, 0.8823529, 1,
1.036954, 0.9646369, 0.3970309, 1, 0, 0.8745098, 1,
1.0425, 0.564158, 2.640018, 1, 0, 0.8705882, 1,
1.044339, 0.2988597, 1.16738, 1, 0, 0.8627451, 1,
1.062957, -1.153732, 3.263164, 1, 0, 0.8588235, 1,
1.063267, -1.487121, 1.701867, 1, 0, 0.8509804, 1,
1.063796, -1.369706, 2.157512, 1, 0, 0.8470588, 1,
1.070987, -0.6541255, 0.8551388, 1, 0, 0.8392157, 1,
1.078815, -0.6683311, 0.8430697, 1, 0, 0.8352941, 1,
1.079478, 0.3704461, 1.301823, 1, 0, 0.827451, 1,
1.08266, -0.7317601, 0.6333746, 1, 0, 0.8235294, 1,
1.082809, -0.526795, 2.319705, 1, 0, 0.8156863, 1,
1.08558, -2.196217, 3.946311, 1, 0, 0.8117647, 1,
1.090857, -1.074532, 2.257046, 1, 0, 0.8039216, 1,
1.09328, 0.9425907, 0.7314836, 1, 0, 0.7960784, 1,
1.094351, -0.2667245, 2.662739, 1, 0, 0.7921569, 1,
1.09921, 0.8267037, 1.095638, 1, 0, 0.7843137, 1,
1.109071, 0.8971157, 2.916109, 1, 0, 0.7803922, 1,
1.112845, -0.4732012, 2.872415, 1, 0, 0.772549, 1,
1.116117, 1.073857, 2.045243, 1, 0, 0.7686275, 1,
1.119949, 1.401415, -0.3607223, 1, 0, 0.7607843, 1,
1.121176, 0.3429568, 2.594473, 1, 0, 0.7568628, 1,
1.138788, -0.6788068, 4.225723, 1, 0, 0.7490196, 1,
1.139316, 1.621394, 0.07756687, 1, 0, 0.7450981, 1,
1.141769, 0.6545616, 0.1939902, 1, 0, 0.7372549, 1,
1.145205, 0.004677668, 2.100745, 1, 0, 0.7333333, 1,
1.148218, -1.613042, 1.776933, 1, 0, 0.7254902, 1,
1.153664, 0.6683598, 0.7067307, 1, 0, 0.7215686, 1,
1.167419, -0.980513, 2.460804, 1, 0, 0.7137255, 1,
1.17189, 0.2463231, 1.688929, 1, 0, 0.7098039, 1,
1.17428, -0.3249794, 2.152879, 1, 0, 0.7019608, 1,
1.174917, 0.5044274, 1.869572, 1, 0, 0.6941177, 1,
1.175431, 1.070486, 1.71088, 1, 0, 0.6901961, 1,
1.18041, -0.1231968, 0.274442, 1, 0, 0.682353, 1,
1.18054, -0.5729516, -0.5895007, 1, 0, 0.6784314, 1,
1.209456, -0.1159954, 0.2175317, 1, 0, 0.6705883, 1,
1.215463, -2.265791, 2.088703, 1, 0, 0.6666667, 1,
1.220538, -1.900116, 3.175923, 1, 0, 0.6588235, 1,
1.222082, -0.6585206, 0.8008034, 1, 0, 0.654902, 1,
1.223215, 1.330449, 0.2962267, 1, 0, 0.6470588, 1,
1.223474, -0.8393841, 2.222774, 1, 0, 0.6431373, 1,
1.224662, 0.3378404, 0.8955038, 1, 0, 0.6352941, 1,
1.225343, -0.3069826, 1.52783, 1, 0, 0.6313726, 1,
1.226303, 0.4074947, 3.277716, 1, 0, 0.6235294, 1,
1.230902, 0.4004949, 0.9750274, 1, 0, 0.6196079, 1,
1.23295, 0.1870858, 0.8392506, 1, 0, 0.6117647, 1,
1.236456, 0.5912932, 1.415441, 1, 0, 0.6078432, 1,
1.244611, -0.1195301, 2.387407, 1, 0, 0.6, 1,
1.245422, -0.9269646, 3.292116, 1, 0, 0.5921569, 1,
1.247939, -0.6979233, 3.1596, 1, 0, 0.5882353, 1,
1.253088, 1.185197, 0.4061536, 1, 0, 0.5803922, 1,
1.255064, -1.75687, 4.207234, 1, 0, 0.5764706, 1,
1.256123, -0.01216912, 2.711776, 1, 0, 0.5686275, 1,
1.260987, 0.2077056, 0.5776169, 1, 0, 0.5647059, 1,
1.263131, 0.604571, 2.013867, 1, 0, 0.5568628, 1,
1.26917, 0.1941024, 1.138587, 1, 0, 0.5529412, 1,
1.274129, -1.193316, 1.907558, 1, 0, 0.5450981, 1,
1.277135, 0.1696872, 0.1477749, 1, 0, 0.5411765, 1,
1.28131, 0.3358989, -0.5973882, 1, 0, 0.5333334, 1,
1.283267, 2.089232, 2.672443, 1, 0, 0.5294118, 1,
1.289484, -2.220775, 2.230672, 1, 0, 0.5215687, 1,
1.294904, 1.698008, 1.823423, 1, 0, 0.5176471, 1,
1.299812, 0.08923852, -0.09512389, 1, 0, 0.509804, 1,
1.300067, 1.041995, 1.530498, 1, 0, 0.5058824, 1,
1.309882, -0.060426, 2.533358, 1, 0, 0.4980392, 1,
1.311313, 0.149199, 1.182393, 1, 0, 0.4901961, 1,
1.317635, -1.538792, 2.369928, 1, 0, 0.4862745, 1,
1.328756, 0.4283634, 2.810973, 1, 0, 0.4784314, 1,
1.33854, -0.7301899, 1.219416, 1, 0, 0.4745098, 1,
1.342408, 0.03090484, 1.844575, 1, 0, 0.4666667, 1,
1.344642, 1.935439, 2.919843, 1, 0, 0.4627451, 1,
1.346146, 0.4767072, 1.535281, 1, 0, 0.454902, 1,
1.358585, -0.2489289, 3.625036, 1, 0, 0.4509804, 1,
1.362838, 1.365874, 0.901414, 1, 0, 0.4431373, 1,
1.369381, -1.541915, 3.016674, 1, 0, 0.4392157, 1,
1.371735, 0.491296, 1.134752, 1, 0, 0.4313726, 1,
1.378503, -0.2021508, 0.04004313, 1, 0, 0.427451, 1,
1.378648, 1.151777, 1.794173, 1, 0, 0.4196078, 1,
1.389089, 2.016268, 2.484958, 1, 0, 0.4156863, 1,
1.39263, -0.891242, 1.21169, 1, 0, 0.4078431, 1,
1.402811, -0.9762671, 3.395533, 1, 0, 0.4039216, 1,
1.4032, 0.8698388, 0.7711248, 1, 0, 0.3960784, 1,
1.425087, -0.6540861, 3.356796, 1, 0, 0.3882353, 1,
1.428636, 0.302162, 2.538237, 1, 0, 0.3843137, 1,
1.430207, -0.6427187, 2.151402, 1, 0, 0.3764706, 1,
1.432833, -1.021434, 1.251811, 1, 0, 0.372549, 1,
1.442514, -0.690904, 1.946426, 1, 0, 0.3647059, 1,
1.443305, -0.7001547, 1.350909, 1, 0, 0.3607843, 1,
1.445324, -1.504293, 2.423234, 1, 0, 0.3529412, 1,
1.460188, 0.5431386, 0.5373566, 1, 0, 0.3490196, 1,
1.464149, 0.005804101, 0.4604305, 1, 0, 0.3411765, 1,
1.494327, 0.4392247, 2.013135, 1, 0, 0.3372549, 1,
1.502771, -0.3957204, 3.256142, 1, 0, 0.3294118, 1,
1.518231, 0.7033433, 0.7919128, 1, 0, 0.3254902, 1,
1.521876, -0.1691594, 3.553666, 1, 0, 0.3176471, 1,
1.544753, 1.713384, 1.843923, 1, 0, 0.3137255, 1,
1.563623, -0.02322365, 1.904827, 1, 0, 0.3058824, 1,
1.573459, 0.7440882, -0.2930519, 1, 0, 0.2980392, 1,
1.605415, -0.4850168, 2.93375, 1, 0, 0.2941177, 1,
1.606048, 0.2840265, 0.7738064, 1, 0, 0.2862745, 1,
1.607971, -1.411336, 1.79529, 1, 0, 0.282353, 1,
1.608185, 0.7207693, 1.699467, 1, 0, 0.2745098, 1,
1.608287, -0.3243228, -1.028957, 1, 0, 0.2705882, 1,
1.630282, -0.5065972, 1.760363, 1, 0, 0.2627451, 1,
1.632414, 0.2654885, 1.319833, 1, 0, 0.2588235, 1,
1.671212, 0.02875285, 1.07335, 1, 0, 0.2509804, 1,
1.674472, -0.8641977, 1.629641, 1, 0, 0.2470588, 1,
1.681907, -0.9981612, 2.183931, 1, 0, 0.2392157, 1,
1.703514, -0.3099082, 1.844197, 1, 0, 0.2352941, 1,
1.704258, 0.6897036, 0.2923432, 1, 0, 0.227451, 1,
1.735635, -0.262664, 1.878264, 1, 0, 0.2235294, 1,
1.737479, 1.929023, -0.11922, 1, 0, 0.2156863, 1,
1.748025, 0.2885675, 2.545714, 1, 0, 0.2117647, 1,
1.749148, -0.3074051, 3.214415, 1, 0, 0.2039216, 1,
1.753799, 0.9061043, 0.4327048, 1, 0, 0.1960784, 1,
1.774025, -0.4699304, 1.40965, 1, 0, 0.1921569, 1,
1.78096, 0.1356671, 1.261602, 1, 0, 0.1843137, 1,
1.79319, 0.1016308, 3.253852, 1, 0, 0.1803922, 1,
1.795818, 0.5385811, -0.9259657, 1, 0, 0.172549, 1,
1.803103, 0.2485418, 1.476173, 1, 0, 0.1686275, 1,
1.805082, 0.3025036, 1.62301, 1, 0, 0.1607843, 1,
1.808732, 0.4413998, -0.04304983, 1, 0, 0.1568628, 1,
1.837423, -0.2063645, 1.473432, 1, 0, 0.1490196, 1,
1.838319, 1.246887, 2.417006, 1, 0, 0.145098, 1,
1.870949, -0.06337488, 2.403712, 1, 0, 0.1372549, 1,
1.875226, 1.193726, 0.3329277, 1, 0, 0.1333333, 1,
1.902985, 1.707919, 0.1147487, 1, 0, 0.1254902, 1,
1.907883, 1.596712, 0.9249344, 1, 0, 0.1215686, 1,
1.911715, 1.026458, 0.214406, 1, 0, 0.1137255, 1,
1.917807, -0.6974399, 1.657284, 1, 0, 0.1098039, 1,
1.939263, -1.071734, -0.4739377, 1, 0, 0.1019608, 1,
1.940882, -0.416638, 2.132643, 1, 0, 0.09411765, 1,
1.960593, -0.9873627, 2.682528, 1, 0, 0.09019608, 1,
2.046571, 1.589747, -0.4477779, 1, 0, 0.08235294, 1,
2.080027, -0.2516544, 3.072129, 1, 0, 0.07843138, 1,
2.098841, 0.5526883, 2.376716, 1, 0, 0.07058824, 1,
2.139973, 0.1609412, 2.239442, 1, 0, 0.06666667, 1,
2.152261, 1.300963, 0.3374355, 1, 0, 0.05882353, 1,
2.169616, -0.1697355, 2.150236, 1, 0, 0.05490196, 1,
2.252728, 1.474413, 1.883818, 1, 0, 0.04705882, 1,
2.256208, -1.029429, 0.5963831, 1, 0, 0.04313726, 1,
2.259381, 0.6472059, 1.105926, 1, 0, 0.03529412, 1,
2.278581, 1.54011, 0.8052459, 1, 0, 0.03137255, 1,
2.34861, -0.1566482, 1.721861, 1, 0, 0.02352941, 1,
2.356915, -0.1537729, 1.733074, 1, 0, 0.01960784, 1,
2.596588, -0.5411273, 0.5082774, 1, 0, 0.01176471, 1,
2.919601, -1.455086, 1.857648, 1, 0, 0.007843138, 1
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
-0.01108301, -5.549933, -6.884238, 0, -0.5, 0.5, 0.5,
-0.01108301, -5.549933, -6.884238, 1, -0.5, 0.5, 0.5,
-0.01108301, -5.549933, -6.884238, 1, 1.5, 0.5, 0.5,
-0.01108301, -5.549933, -6.884238, 0, 1.5, 0.5, 0.5
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
-3.935269, -0.6433783, -6.884238, 0, -0.5, 0.5, 0.5,
-3.935269, -0.6433783, -6.884238, 1, -0.5, 0.5, 0.5,
-3.935269, -0.6433783, -6.884238, 1, 1.5, 0.5, 0.5,
-3.935269, -0.6433783, -6.884238, 0, 1.5, 0.5, 0.5
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
-3.935269, -5.549933, 0.008598804, 0, -0.5, 0.5, 0.5,
-3.935269, -5.549933, 0.008598804, 1, -0.5, 0.5, 0.5,
-3.935269, -5.549933, 0.008598804, 1, 1.5, 0.5, 0.5,
-3.935269, -5.549933, 0.008598804, 0, 1.5, 0.5, 0.5
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
-2, -4.417651, -5.293583,
2, -4.417651, -5.293583,
-2, -4.417651, -5.293583,
-2, -4.606365, -5.558693,
-1, -4.417651, -5.293583,
-1, -4.606365, -5.558693,
0, -4.417651, -5.293583,
0, -4.606365, -5.558693,
1, -4.417651, -5.293583,
1, -4.606365, -5.558693,
2, -4.417651, -5.293583,
2, -4.606365, -5.558693
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
-2, -4.983792, -6.088911, 0, -0.5, 0.5, 0.5,
-2, -4.983792, -6.088911, 1, -0.5, 0.5, 0.5,
-2, -4.983792, -6.088911, 1, 1.5, 0.5, 0.5,
-2, -4.983792, -6.088911, 0, 1.5, 0.5, 0.5,
-1, -4.983792, -6.088911, 0, -0.5, 0.5, 0.5,
-1, -4.983792, -6.088911, 1, -0.5, 0.5, 0.5,
-1, -4.983792, -6.088911, 1, 1.5, 0.5, 0.5,
-1, -4.983792, -6.088911, 0, 1.5, 0.5, 0.5,
0, -4.983792, -6.088911, 0, -0.5, 0.5, 0.5,
0, -4.983792, -6.088911, 1, -0.5, 0.5, 0.5,
0, -4.983792, -6.088911, 1, 1.5, 0.5, 0.5,
0, -4.983792, -6.088911, 0, 1.5, 0.5, 0.5,
1, -4.983792, -6.088911, 0, -0.5, 0.5, 0.5,
1, -4.983792, -6.088911, 1, -0.5, 0.5, 0.5,
1, -4.983792, -6.088911, 1, 1.5, 0.5, 0.5,
1, -4.983792, -6.088911, 0, 1.5, 0.5, 0.5,
2, -4.983792, -6.088911, 0, -0.5, 0.5, 0.5,
2, -4.983792, -6.088911, 1, -0.5, 0.5, 0.5,
2, -4.983792, -6.088911, 1, 1.5, 0.5, 0.5,
2, -4.983792, -6.088911, 0, 1.5, 0.5, 0.5
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
-3.029687, -4, -5.293583,
-3.029687, 2, -5.293583,
-3.029687, -4, -5.293583,
-3.180618, -4, -5.558693,
-3.029687, -2, -5.293583,
-3.180618, -2, -5.558693,
-3.029687, 0, -5.293583,
-3.180618, 0, -5.558693,
-3.029687, 2, -5.293583,
-3.180618, 2, -5.558693
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
"-4",
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
-3.482478, -4, -6.088911, 0, -0.5, 0.5, 0.5,
-3.482478, -4, -6.088911, 1, -0.5, 0.5, 0.5,
-3.482478, -4, -6.088911, 1, 1.5, 0.5, 0.5,
-3.482478, -4, -6.088911, 0, 1.5, 0.5, 0.5,
-3.482478, -2, -6.088911, 0, -0.5, 0.5, 0.5,
-3.482478, -2, -6.088911, 1, -0.5, 0.5, 0.5,
-3.482478, -2, -6.088911, 1, 1.5, 0.5, 0.5,
-3.482478, -2, -6.088911, 0, 1.5, 0.5, 0.5,
-3.482478, 0, -6.088911, 0, -0.5, 0.5, 0.5,
-3.482478, 0, -6.088911, 1, -0.5, 0.5, 0.5,
-3.482478, 0, -6.088911, 1, 1.5, 0.5, 0.5,
-3.482478, 0, -6.088911, 0, 1.5, 0.5, 0.5,
-3.482478, 2, -6.088911, 0, -0.5, 0.5, 0.5,
-3.482478, 2, -6.088911, 1, -0.5, 0.5, 0.5,
-3.482478, 2, -6.088911, 1, 1.5, 0.5, 0.5,
-3.482478, 2, -6.088911, 0, 1.5, 0.5, 0.5
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
-3.029687, -4.417651, -4,
-3.029687, -4.417651, 4,
-3.029687, -4.417651, -4,
-3.180618, -4.606365, -4,
-3.029687, -4.417651, -2,
-3.180618, -4.606365, -2,
-3.029687, -4.417651, 0,
-3.180618, -4.606365, 0,
-3.029687, -4.417651, 2,
-3.180618, -4.606365, 2,
-3.029687, -4.417651, 4,
-3.180618, -4.606365, 4
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
-3.482478, -4.983792, -4, 0, -0.5, 0.5, 0.5,
-3.482478, -4.983792, -4, 1, -0.5, 0.5, 0.5,
-3.482478, -4.983792, -4, 1, 1.5, 0.5, 0.5,
-3.482478, -4.983792, -4, 0, 1.5, 0.5, 0.5,
-3.482478, -4.983792, -2, 0, -0.5, 0.5, 0.5,
-3.482478, -4.983792, -2, 1, -0.5, 0.5, 0.5,
-3.482478, -4.983792, -2, 1, 1.5, 0.5, 0.5,
-3.482478, -4.983792, -2, 0, 1.5, 0.5, 0.5,
-3.482478, -4.983792, 0, 0, -0.5, 0.5, 0.5,
-3.482478, -4.983792, 0, 1, -0.5, 0.5, 0.5,
-3.482478, -4.983792, 0, 1, 1.5, 0.5, 0.5,
-3.482478, -4.983792, 0, 0, 1.5, 0.5, 0.5,
-3.482478, -4.983792, 2, 0, -0.5, 0.5, 0.5,
-3.482478, -4.983792, 2, 1, -0.5, 0.5, 0.5,
-3.482478, -4.983792, 2, 1, 1.5, 0.5, 0.5,
-3.482478, -4.983792, 2, 0, 1.5, 0.5, 0.5,
-3.482478, -4.983792, 4, 0, -0.5, 0.5, 0.5,
-3.482478, -4.983792, 4, 1, -0.5, 0.5, 0.5,
-3.482478, -4.983792, 4, 1, 1.5, 0.5, 0.5,
-3.482478, -4.983792, 4, 0, 1.5, 0.5, 0.5
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
-3.029687, -4.417651, -5.293583,
-3.029687, 3.130894, -5.293583,
-3.029687, -4.417651, 5.310781,
-3.029687, 3.130894, 5.310781,
-3.029687, -4.417651, -5.293583,
-3.029687, -4.417651, 5.310781,
-3.029687, 3.130894, -5.293583,
-3.029687, 3.130894, 5.310781,
-3.029687, -4.417651, -5.293583,
3.007521, -4.417651, -5.293583,
-3.029687, -4.417651, 5.310781,
3.007521, -4.417651, 5.310781,
-3.029687, 3.130894, -5.293583,
3.007521, 3.130894, -5.293583,
-3.029687, 3.130894, 5.310781,
3.007521, 3.130894, 5.310781,
3.007521, -4.417651, -5.293583,
3.007521, 3.130894, -5.293583,
3.007521, -4.417651, 5.310781,
3.007521, 3.130894, 5.310781,
3.007521, -4.417651, -5.293583,
3.007521, -4.417651, 5.310781,
3.007521, 3.130894, -5.293583,
3.007521, 3.130894, 5.310781
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
var radius = 7.661849;
var distance = 34.08843;
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
mvMatrix.translate( 0.01108301, 0.6433783, -0.008598804 );
mvMatrix.scale( 1.372181, 1.097449, 0.7812011 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.08843);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
aldicarb_sulfone<-read.table("aldicarb_sulfone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aldicarb_sulfone$V2
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
```

```r
y<-aldicarb_sulfone$V3
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
```

```r
z<-aldicarb_sulfone$V4
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
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
-2.941767, 0.3053947, 0.003971446, 0, 0, 1, 1, 1,
-2.901198, -0.3522505, -0.3748623, 1, 0, 0, 1, 1,
-2.87783, 0.3581983, -1.782246, 1, 0, 0, 1, 1,
-2.864105, -0.3315265, -2.268792, 1, 0, 0, 1, 1,
-2.81716, -0.7925296, -1.150714, 1, 0, 0, 1, 1,
-2.808228, -0.9624768, -2.434652, 1, 0, 0, 1, 1,
-2.666256, 0.1937038, -1.188352, 0, 0, 0, 1, 1,
-2.553337, 0.7332227, -0.7354817, 0, 0, 0, 1, 1,
-2.551891, 1.067041, -0.09787569, 0, 0, 0, 1, 1,
-2.515653, -0.9658557, -3.525437, 0, 0, 0, 1, 1,
-2.380744, 0.554412, -1.461102, 0, 0, 0, 1, 1,
-2.317958, -0.06244203, -1.794657, 0, 0, 0, 1, 1,
-2.292471, -0.9374893, -0.9161363, 0, 0, 0, 1, 1,
-2.281751, 1.902204, -0.6048757, 1, 1, 1, 1, 1,
-2.267272, 0.2791965, -1.42245, 1, 1, 1, 1, 1,
-2.230042, -1.470594, -1.534558, 1, 1, 1, 1, 1,
-2.20504, -0.7199047, -0.8530005, 1, 1, 1, 1, 1,
-2.159551, 0.01694256, -3.177289, 1, 1, 1, 1, 1,
-2.158912, 0.2344656, -1.140488, 1, 1, 1, 1, 1,
-2.155399, 0.8451462, -1.768428, 1, 1, 1, 1, 1,
-2.152313, -0.3741015, -1.626138, 1, 1, 1, 1, 1,
-2.136434, 0.01857379, -1.533548, 1, 1, 1, 1, 1,
-2.134573, -1.422275, -1.948726, 1, 1, 1, 1, 1,
-2.128447, -1.647198, -3.535172, 1, 1, 1, 1, 1,
-2.126672, -0.4838037, -1.278972, 1, 1, 1, 1, 1,
-2.123157, 0.5582782, -0.3553223, 1, 1, 1, 1, 1,
-2.114156, 1.993829, -0.8832949, 1, 1, 1, 1, 1,
-2.101688, -1.851368, -1.881544, 1, 1, 1, 1, 1,
-2.100143, -0.1262034, -0.2493964, 0, 0, 1, 1, 1,
-2.076349, -0.7273025, -1.758331, 1, 0, 0, 1, 1,
-2.041449, 0.3695723, -2.103148, 1, 0, 0, 1, 1,
-2.016517, -0.3998904, -1.590611, 1, 0, 0, 1, 1,
-2.012394, 0.9887124, 0.8051099, 1, 0, 0, 1, 1,
-1.946448, -0.5450518, -1.153586, 1, 0, 0, 1, 1,
-1.935523, 0.2102058, -1.5782, 0, 0, 0, 1, 1,
-1.885113, -0.05425165, -0.3880663, 0, 0, 0, 1, 1,
-1.868459, -0.5542189, -2.247649, 0, 0, 0, 1, 1,
-1.8649, 0.3188682, -1.35101, 0, 0, 0, 1, 1,
-1.844572, 1.004453, -1.7887, 0, 0, 0, 1, 1,
-1.843171, -0.9347134, -2.12845, 0, 0, 0, 1, 1,
-1.826387, -1.388458, -2.616636, 0, 0, 0, 1, 1,
-1.813856, 0.6869041, 0.3133932, 1, 1, 1, 1, 1,
-1.807566, -0.5016356, 0.6297013, 1, 1, 1, 1, 1,
-1.79374, -2.216569, -3.607576, 1, 1, 1, 1, 1,
-1.786262, 0.3914664, -1.148291, 1, 1, 1, 1, 1,
-1.785822, 1.32827, 0.7393241, 1, 1, 1, 1, 1,
-1.778709, 0.7701398, -2.063913, 1, 1, 1, 1, 1,
-1.767771, -0.5730355, -2.798378, 1, 1, 1, 1, 1,
-1.755692, 1.110314, -0.06886766, 1, 1, 1, 1, 1,
-1.750231, 0.5820834, -0.9046217, 1, 1, 1, 1, 1,
-1.745377, 1.280696, -1.21581, 1, 1, 1, 1, 1,
-1.741148, -0.8268741, -1.557232, 1, 1, 1, 1, 1,
-1.739217, -0.3020289, -1.672417, 1, 1, 1, 1, 1,
-1.723288, -0.5884985, -1.28054, 1, 1, 1, 1, 1,
-1.675487, 2.265841, 0.5085593, 1, 1, 1, 1, 1,
-1.671605, -0.607882, -1.340851, 1, 1, 1, 1, 1,
-1.663446, -0.6802024, -3.526405, 0, 0, 1, 1, 1,
-1.658213, 0.2510221, -0.001543615, 1, 0, 0, 1, 1,
-1.639119, 0.4463958, -2.732244, 1, 0, 0, 1, 1,
-1.638956, 0.9120638, -1.492441, 1, 0, 0, 1, 1,
-1.627642, 1.036919, 0.5131431, 1, 0, 0, 1, 1,
-1.624393, -1.143687, -1.585764, 1, 0, 0, 1, 1,
-1.621249, 0.9139537, 0.1725554, 0, 0, 0, 1, 1,
-1.607065, 1.161909, -1.363756, 0, 0, 0, 1, 1,
-1.604001, 0.6140724, -0.497417, 0, 0, 0, 1, 1,
-1.594404, -0.7643563, -1.939915, 0, 0, 0, 1, 1,
-1.580921, -0.3756176, -2.351624, 0, 0, 0, 1, 1,
-1.579734, -0.4451557, -0.3122259, 0, 0, 0, 1, 1,
-1.550282, 0.1025811, -4.269642, 0, 0, 0, 1, 1,
-1.539724, -3.040788, -3.0006, 1, 1, 1, 1, 1,
-1.523363, 1.57831, -1.582445, 1, 1, 1, 1, 1,
-1.522416, 0.9809711, -1.157106, 1, 1, 1, 1, 1,
-1.516352, -0.2065945, -0.5995787, 1, 1, 1, 1, 1,
-1.507842, 2.204088, -2.836226, 1, 1, 1, 1, 1,
-1.505679, 0.4729944, -0.2402024, 1, 1, 1, 1, 1,
-1.502714, -0.6114153, -2.945755, 1, 1, 1, 1, 1,
-1.495569, 0.9410038, -1.121802, 1, 1, 1, 1, 1,
-1.47771, -0.8026037, -0.7443218, 1, 1, 1, 1, 1,
-1.453807, 0.2755045, -1.813518, 1, 1, 1, 1, 1,
-1.44989, 1.10965, -1.042467, 1, 1, 1, 1, 1,
-1.441282, 2.421918, -2.327399, 1, 1, 1, 1, 1,
-1.436897, -1.549836, -1.950569, 1, 1, 1, 1, 1,
-1.42598, -0.2619725, -3.57779, 1, 1, 1, 1, 1,
-1.424469, -0.7805523, -2.384755, 1, 1, 1, 1, 1,
-1.420528, -1.385563, -3.030496, 0, 0, 1, 1, 1,
-1.414384, -0.05808215, 0.4576361, 1, 0, 0, 1, 1,
-1.410396, 0.901186, -0.8791458, 1, 0, 0, 1, 1,
-1.399637, 0.6918984, -2.512102, 1, 0, 0, 1, 1,
-1.398037, 1.585393, 0.8509429, 1, 0, 0, 1, 1,
-1.393286, -0.6657422, -2.635974, 1, 0, 0, 1, 1,
-1.39155, -0.01980148, -2.601369, 0, 0, 0, 1, 1,
-1.384372, 0.1910057, -0.8977203, 0, 0, 0, 1, 1,
-1.377552, -1.235031, 0.02869521, 0, 0, 0, 1, 1,
-1.377398, -0.8029358, -1.073517, 0, 0, 0, 1, 1,
-1.376782, 0.7735236, -1.092241, 0, 0, 0, 1, 1,
-1.374094, 0.4125987, 0.3113252, 0, 0, 0, 1, 1,
-1.367951, -1.237573, -2.472889, 0, 0, 0, 1, 1,
-1.359066, -1.349452, -2.199899, 1, 1, 1, 1, 1,
-1.349669, 1.051931, 0.4249173, 1, 1, 1, 1, 1,
-1.347853, 0.9578466, -2.226436, 1, 1, 1, 1, 1,
-1.344052, 0.166246, -2.961228, 1, 1, 1, 1, 1,
-1.343607, 0.2384911, -1.969068, 1, 1, 1, 1, 1,
-1.333717, 1.052418, -1.385833, 1, 1, 1, 1, 1,
-1.333451, -0.2826733, -3.393691, 1, 1, 1, 1, 1,
-1.315943, 0.529758, -1.18956, 1, 1, 1, 1, 1,
-1.313185, 0.8087598, -1.688324, 1, 1, 1, 1, 1,
-1.306802, 0.462505, -0.4156615, 1, 1, 1, 1, 1,
-1.303169, -1.056812, -4.037256, 1, 1, 1, 1, 1,
-1.289978, 0.7037871, -1.15089, 1, 1, 1, 1, 1,
-1.278376, 0.09691444, -1.940344, 1, 1, 1, 1, 1,
-1.27651, 1.739561, -0.3890286, 1, 1, 1, 1, 1,
-1.272929, 0.03670578, -1.948035, 1, 1, 1, 1, 1,
-1.269205, -1.057125, -3.302571, 0, 0, 1, 1, 1,
-1.263408, 1.315682, -2.267856, 1, 0, 0, 1, 1,
-1.261874, 0.5518095, 0.250821, 1, 0, 0, 1, 1,
-1.257375, 1.150271, -0.8080604, 1, 0, 0, 1, 1,
-1.255088, -1.583797, -2.380878, 1, 0, 0, 1, 1,
-1.241119, -1.504382, -2.917585, 1, 0, 0, 1, 1,
-1.23982, -0.7026582, -2.943561, 0, 0, 0, 1, 1,
-1.237574, 0.3774666, -3.119231, 0, 0, 0, 1, 1,
-1.230765, 0.7074308, 0.413348, 0, 0, 0, 1, 1,
-1.22608, -0.003102964, -1.276371, 0, 0, 0, 1, 1,
-1.219608, 1.368808, -0.7179658, 0, 0, 0, 1, 1,
-1.218347, -1.061319, -0.9542612, 0, 0, 0, 1, 1,
-1.209226, -0.4574771, 0.4919624, 0, 0, 0, 1, 1,
-1.20669, -1.804514, -1.654162, 1, 1, 1, 1, 1,
-1.204979, -0.2027379, -2.21472, 1, 1, 1, 1, 1,
-1.196289, 0.009431833, -3.238479, 1, 1, 1, 1, 1,
-1.191756, 0.87817, -1.401859, 1, 1, 1, 1, 1,
-1.189486, -0.657697, -2.293046, 1, 1, 1, 1, 1,
-1.187483, 0.327622, -1.862392, 1, 1, 1, 1, 1,
-1.182008, 0.1575565, -1.010612, 1, 1, 1, 1, 1,
-1.173536, 0.392664, -1.569907, 1, 1, 1, 1, 1,
-1.173404, -0.2540679, -1.302223, 1, 1, 1, 1, 1,
-1.169522, -2.03989, -1.309694, 1, 1, 1, 1, 1,
-1.157663, -1.183853, -1.862571, 1, 1, 1, 1, 1,
-1.147244, 0.1323519, -1.024573, 1, 1, 1, 1, 1,
-1.144886, -0.1578638, -1.898672, 1, 1, 1, 1, 1,
-1.142339, 1.867958, -1.178234, 1, 1, 1, 1, 1,
-1.128909, 1.274023, 0.0739568, 1, 1, 1, 1, 1,
-1.124743, 1.621551, 1.271657, 0, 0, 1, 1, 1,
-1.123196, -0.2265217, -0.9363073, 1, 0, 0, 1, 1,
-1.120716, 0.5772561, -1.061265, 1, 0, 0, 1, 1,
-1.117282, 0.5376568, -2.655352, 1, 0, 0, 1, 1,
-1.111962, -1.808, -2.004575, 1, 0, 0, 1, 1,
-1.10957, -0.2852865, -2.73865, 1, 0, 0, 1, 1,
-1.10764, 0.7256244, -2.236364, 0, 0, 0, 1, 1,
-1.104463, -1.179427, -2.585656, 0, 0, 0, 1, 1,
-1.104446, 0.103259, -0.6438695, 0, 0, 0, 1, 1,
-1.104392, -1.948766, -3.520913, 0, 0, 0, 1, 1,
-1.103951, -0.9417163, -3.33693, 0, 0, 0, 1, 1,
-1.086356, -1.311276, -2.265357, 0, 0, 0, 1, 1,
-1.079118, 0.7105926, -1.709509, 0, 0, 0, 1, 1,
-1.074018, -0.07704106, -0.1249626, 1, 1, 1, 1, 1,
-1.061775, 0.9168546, -0.3299407, 1, 1, 1, 1, 1,
-1.057397, 0.1162809, -0.1053847, 1, 1, 1, 1, 1,
-1.054267, -0.1312811, -1.206145, 1, 1, 1, 1, 1,
-1.051093, -0.8215644, -2.118967, 1, 1, 1, 1, 1,
-1.046077, -2.217062, -3.040653, 1, 1, 1, 1, 1,
-1.041916, 0.5095747, 0.2681566, 1, 1, 1, 1, 1,
-1.037838, 0.7740514, -0.8661299, 1, 1, 1, 1, 1,
-1.037239, -2.512126, -3.468965, 1, 1, 1, 1, 1,
-1.025169, 1.481953, -0.4272517, 1, 1, 1, 1, 1,
-1.025118, 2.44033, 0.02526315, 1, 1, 1, 1, 1,
-1.020754, -0.9302477, -1.256054, 1, 1, 1, 1, 1,
-1.016667, -1.191233, -2.781044, 1, 1, 1, 1, 1,
-1.015163, -0.1221663, -1.954366, 1, 1, 1, 1, 1,
-1.013671, 0.3560817, 0.2881797, 1, 1, 1, 1, 1,
-1.013179, -0.466339, -1.534494, 0, 0, 1, 1, 1,
-1.012295, -0.1005705, -3.402379, 1, 0, 0, 1, 1,
-1.004827, 0.6849769, -1.142813, 1, 0, 0, 1, 1,
-1.001787, 1.059497, -1.261352, 1, 0, 0, 1, 1,
-0.9989759, -0.7841975, -0.4777403, 1, 0, 0, 1, 1,
-0.9946571, 0.03141557, -0.8964983, 1, 0, 0, 1, 1,
-0.988179, 1.329544, -1.877467, 0, 0, 0, 1, 1,
-0.9832811, -0.632736, -2.892972, 0, 0, 0, 1, 1,
-0.9825232, 0.9334819, -1.099583, 0, 0, 0, 1, 1,
-0.9811168, -2.532551, -1.98951, 0, 0, 0, 1, 1,
-0.9802369, -0.7957163, -1.85227, 0, 0, 0, 1, 1,
-0.9789324, 0.3555647, -1.460264, 0, 0, 0, 1, 1,
-0.9743813, -0.260838, -2.935909, 0, 0, 0, 1, 1,
-0.9734163, 0.9553093, -0.6700211, 1, 1, 1, 1, 1,
-0.9678073, -1.111146, -2.049898, 1, 1, 1, 1, 1,
-0.9625344, -1.089977, -2.463607, 1, 1, 1, 1, 1,
-0.9596849, 0.04685672, -0.6195333, 1, 1, 1, 1, 1,
-0.9482921, 0.7669488, -1.776367, 1, 1, 1, 1, 1,
-0.9392574, 1.404307, -1.17224, 1, 1, 1, 1, 1,
-0.9352093, 1.112743, -1.307779, 1, 1, 1, 1, 1,
-0.9316557, 0.07706933, -0.3698916, 1, 1, 1, 1, 1,
-0.9303127, 0.1553782, 0.6015315, 1, 1, 1, 1, 1,
-0.9249802, -0.1905508, -0.8210067, 1, 1, 1, 1, 1,
-0.9212708, -0.04461461, -1.244625, 1, 1, 1, 1, 1,
-0.9198374, -1.578297, -0.8409612, 1, 1, 1, 1, 1,
-0.919741, -0.7329187, -2.930375, 1, 1, 1, 1, 1,
-0.909099, -1.036642, -1.710895, 1, 1, 1, 1, 1,
-0.8897348, -0.1998683, -1.861295, 1, 1, 1, 1, 1,
-0.8883895, -0.1986929, -1.773012, 0, 0, 1, 1, 1,
-0.8873059, -0.5215887, -3.328407, 1, 0, 0, 1, 1,
-0.8791817, -0.1953648, -3.389491, 1, 0, 0, 1, 1,
-0.8785169, 1.232895, -0.2137239, 1, 0, 0, 1, 1,
-0.8727185, -0.363156, -0.06374746, 1, 0, 0, 1, 1,
-0.8722816, -0.7965929, -2.604123, 1, 0, 0, 1, 1,
-0.8633282, 0.8859373, 0.8059624, 0, 0, 0, 1, 1,
-0.8557965, -0.2675323, -2.491634, 0, 0, 0, 1, 1,
-0.8491733, 2.550862, -0.4996855, 0, 0, 0, 1, 1,
-0.8479286, -1.480333, -4.167199, 0, 0, 0, 1, 1,
-0.8427567, 1.303223, -0.4038011, 0, 0, 0, 1, 1,
-0.8416639, -1.942767, -3.243454, 0, 0, 0, 1, 1,
-0.8338039, -0.3250242, -1.979361, 0, 0, 0, 1, 1,
-0.8317108, 0.3808918, -3.269969, 1, 1, 1, 1, 1,
-0.8316913, 1.611516, -0.5435981, 1, 1, 1, 1, 1,
-0.82267, -0.03579124, -1.616667, 1, 1, 1, 1, 1,
-0.820679, -0.4756755, -1.467811, 1, 1, 1, 1, 1,
-0.8186643, -0.4684182, -3.668199, 1, 1, 1, 1, 1,
-0.8171129, 0.4095193, -0.5953295, 1, 1, 1, 1, 1,
-0.8162113, -0.7016448, -3.149137, 1, 1, 1, 1, 1,
-0.8136153, -0.0188563, -1.950335, 1, 1, 1, 1, 1,
-0.8089151, -1.278828, -1.484784, 1, 1, 1, 1, 1,
-0.7996482, -0.2477865, -0.184581, 1, 1, 1, 1, 1,
-0.7904661, 0.2217808, -0.8766705, 1, 1, 1, 1, 1,
-0.7903056, 0.214087, -0.3071896, 1, 1, 1, 1, 1,
-0.7893412, 0.4114193, -2.001508, 1, 1, 1, 1, 1,
-0.7869, 0.5809422, 0.05176597, 1, 1, 1, 1, 1,
-0.785948, -0.8893875, -3.406731, 1, 1, 1, 1, 1,
-0.7846558, -0.1797055, 0.07059423, 0, 0, 1, 1, 1,
-0.7837838, 0.6796968, 0.7599136, 1, 0, 0, 1, 1,
-0.783367, 0.6035857, -0.5927629, 1, 0, 0, 1, 1,
-0.7828523, -0.2289895, -2.07095, 1, 0, 0, 1, 1,
-0.7825618, 0.72548, -0.9869316, 1, 0, 0, 1, 1,
-0.7705199, -0.7339403, -3.831642, 1, 0, 0, 1, 1,
-0.7647308, -1.657563, -3.266105, 0, 0, 0, 1, 1,
-0.7640935, -0.4485317, -0.1756955, 0, 0, 0, 1, 1,
-0.755662, -0.5273532, -3.97714, 0, 0, 0, 1, 1,
-0.7550882, 0.04965831, -2.107023, 0, 0, 0, 1, 1,
-0.7512137, -0.7046988, -2.086209, 0, 0, 0, 1, 1,
-0.7463233, 0.2436516, -0.6344674, 0, 0, 0, 1, 1,
-0.7424901, -1.651579, -0.6668771, 0, 0, 0, 1, 1,
-0.7352093, -1.182897, -3.892803, 1, 1, 1, 1, 1,
-0.7280741, 0.04752846, -0.3729879, 1, 1, 1, 1, 1,
-0.7279724, -1.471732, -3.014769, 1, 1, 1, 1, 1,
-0.7252959, -1.50389, -3.027591, 1, 1, 1, 1, 1,
-0.7232315, 1.417462, 1.169528, 1, 1, 1, 1, 1,
-0.7221359, -0.1843769, -1.598917, 1, 1, 1, 1, 1,
-0.7191354, 0.371878, -1.499741, 1, 1, 1, 1, 1,
-0.7174025, 0.4698462, -2.582916, 1, 1, 1, 1, 1,
-0.7152638, -1.860195, -2.610915, 1, 1, 1, 1, 1,
-0.7151434, 0.8233159, -2.194494, 1, 1, 1, 1, 1,
-0.7081769, 0.6625946, -1.465297, 1, 1, 1, 1, 1,
-0.7074549, -1.473444, -0.7919984, 1, 1, 1, 1, 1,
-0.7019182, -1.846751, -3.655236, 1, 1, 1, 1, 1,
-0.69889, -2.009574, -1.416473, 1, 1, 1, 1, 1,
-0.6981033, 0.215484, -2.127608, 1, 1, 1, 1, 1,
-0.6979333, -0.08931803, -1.721657, 0, 0, 1, 1, 1,
-0.6876858, 0.6209257, -0.6729761, 1, 0, 0, 1, 1,
-0.6838367, 0.9179773, 0.2340041, 1, 0, 0, 1, 1,
-0.6823971, -0.05869861, -2.358459, 1, 0, 0, 1, 1,
-0.672738, 1.350863, -0.2972493, 1, 0, 0, 1, 1,
-0.669829, 2.338763, -1.236664, 1, 0, 0, 1, 1,
-0.6611148, -0.572431, -3.002362, 0, 0, 0, 1, 1,
-0.6527559, -0.4168313, -0.5825372, 0, 0, 0, 1, 1,
-0.6508478, 0.483418, -1.316365, 0, 0, 0, 1, 1,
-0.6457363, 0.46365, 1.422075, 0, 0, 0, 1, 1,
-0.6453608, -0.41499, -1.299495, 0, 0, 0, 1, 1,
-0.6351188, -2.18697, -2.611474, 0, 0, 0, 1, 1,
-0.6332352, 1.011055, 1.114248, 0, 0, 0, 1, 1,
-0.6322234, 0.04968087, -1.885277, 1, 1, 1, 1, 1,
-0.6316503, 0.9172981, -2.428382, 1, 1, 1, 1, 1,
-0.6248688, -1.718266, -3.044504, 1, 1, 1, 1, 1,
-0.6225661, -1.67328, -4.45678, 1, 1, 1, 1, 1,
-0.6219178, -0.6494161, -1.845555, 1, 1, 1, 1, 1,
-0.6207262, -1.564729, -1.863892, 1, 1, 1, 1, 1,
-0.6078631, -0.3021627, -1.845801, 1, 1, 1, 1, 1,
-0.6038684, 0.324668, -1.289445, 1, 1, 1, 1, 1,
-0.5996771, -0.2636089, -1.74152, 1, 1, 1, 1, 1,
-0.5921402, 0.6043335, 0.7532514, 1, 1, 1, 1, 1,
-0.5912226, 0.2876858, -2.429036, 1, 1, 1, 1, 1,
-0.5883017, 0.2513007, -1.607121, 1, 1, 1, 1, 1,
-0.5875366, 0.4458632, -2.281829, 1, 1, 1, 1, 1,
-0.5836709, -0.4039519, -2.14524, 1, 1, 1, 1, 1,
-0.5821418, 0.2220332, -1.216316, 1, 1, 1, 1, 1,
-0.5794733, 1.323155, -1.434139, 0, 0, 1, 1, 1,
-0.5790383, 0.5241504, 0.6647268, 1, 0, 0, 1, 1,
-0.5776237, -0.9382606, -2.233779, 1, 0, 0, 1, 1,
-0.575409, -0.7379937, -2.17925, 1, 0, 0, 1, 1,
-0.5726107, -0.355304, -1.395501, 1, 0, 0, 1, 1,
-0.5632707, -0.2294773, -2.554695, 1, 0, 0, 1, 1,
-0.5626906, -0.8227994, -1.685239, 0, 0, 0, 1, 1,
-0.562606, -1.086198, -2.731865, 0, 0, 0, 1, 1,
-0.5618933, -0.9463576, -3.915322, 0, 0, 0, 1, 1,
-0.5540907, 0.1534645, -1.077518, 0, 0, 0, 1, 1,
-0.548631, -0.4949963, -2.499017, 0, 0, 0, 1, 1,
-0.546732, 2.302776, -0.2142764, 0, 0, 0, 1, 1,
-0.5403824, -0.2341675, 0.01859293, 0, 0, 0, 1, 1,
-0.5384911, -0.9811378, -3.977225, 1, 1, 1, 1, 1,
-0.5374697, -2.023939, -3.659651, 1, 1, 1, 1, 1,
-0.5304741, -1.080853, -3.332809, 1, 1, 1, 1, 1,
-0.5256813, 1.458604, -0.7341402, 1, 1, 1, 1, 1,
-0.524269, 0.8228288, -1.693161, 1, 1, 1, 1, 1,
-0.5209091, -0.1018943, -2.196804, 1, 1, 1, 1, 1,
-0.5161209, 0.5939521, -2.350636, 1, 1, 1, 1, 1,
-0.5119454, -0.02864748, -1.529896, 1, 1, 1, 1, 1,
-0.5094455, -0.3873583, -2.11507, 1, 1, 1, 1, 1,
-0.4948945, 0.694828, -1.116747, 1, 1, 1, 1, 1,
-0.4848442, -0.1709646, -0.8050762, 1, 1, 1, 1, 1,
-0.4836842, 0.1645792, -1.481193, 1, 1, 1, 1, 1,
-0.4834476, -1.368991, -2.506426, 1, 1, 1, 1, 1,
-0.4830946, 0.2973641, -1.029896, 1, 1, 1, 1, 1,
-0.483072, -2.26582, -4.217646, 1, 1, 1, 1, 1,
-0.4812615, -0.5499249, -2.660527, 0, 0, 1, 1, 1,
-0.4805995, -0.3630908, -0.339931, 1, 0, 0, 1, 1,
-0.4771565, 0.9523678, -0.9163048, 1, 0, 0, 1, 1,
-0.4726794, -1.830486, -2.153948, 1, 0, 0, 1, 1,
-0.4670236, -1.850079, -3.074371, 1, 0, 0, 1, 1,
-0.4651932, -0.3289813, -2.023074, 1, 0, 0, 1, 1,
-0.4550408, 0.2041993, 0.427112, 0, 0, 0, 1, 1,
-0.4479649, -2.796553, -1.512774, 0, 0, 0, 1, 1,
-0.4457421, 1.383746, -0.5725443, 0, 0, 0, 1, 1,
-0.4452923, 1.810954, -0.5709546, 0, 0, 0, 1, 1,
-0.4424799, 1.995764, -0.8862125, 0, 0, 0, 1, 1,
-0.4411778, 0.1177044, -1.868966, 0, 0, 0, 1, 1,
-0.4389139, 0.1529935, -1.434738, 0, 0, 0, 1, 1,
-0.4351755, -0.2524527, -4.203937, 1, 1, 1, 1, 1,
-0.4285165, -0.4320037, -1.031848, 1, 1, 1, 1, 1,
-0.4267039, 1.357452, -0.1445393, 1, 1, 1, 1, 1,
-0.4238687, 2.140963, -0.3297127, 1, 1, 1, 1, 1,
-0.4218261, 0.6533981, -0.09149013, 1, 1, 1, 1, 1,
-0.4170166, -0.1613805, -2.594548, 1, 1, 1, 1, 1,
-0.4131647, -0.342136, -1.297826, 1, 1, 1, 1, 1,
-0.4102916, -0.9718816, -4.366307, 1, 1, 1, 1, 1,
-0.4048077, 0.2900541, 0.03051064, 1, 1, 1, 1, 1,
-0.4047604, 1.030874, -0.8736841, 1, 1, 1, 1, 1,
-0.4028282, 2.167919, -0.9299009, 1, 1, 1, 1, 1,
-0.3973952, -0.03875708, -0.6658841, 1, 1, 1, 1, 1,
-0.391817, 0.440927, -0.4144134, 1, 1, 1, 1, 1,
-0.3916805, 0.5081952, -0.6913657, 1, 1, 1, 1, 1,
-0.38792, 0.2195312, -0.5001597, 1, 1, 1, 1, 1,
-0.3874787, -1.499349, -3.544047, 0, 0, 1, 1, 1,
-0.3852086, 0.1511575, -0.906684, 1, 0, 0, 1, 1,
-0.3802105, 0.729318, -0.8492798, 1, 0, 0, 1, 1,
-0.3782679, -1.050124, -3.664594, 1, 0, 0, 1, 1,
-0.3765437, -0.07397979, -3.214941, 1, 0, 0, 1, 1,
-0.3677268, 1.871207, 0.2309734, 1, 0, 0, 1, 1,
-0.3651518, -0.7686102, -1.846601, 0, 0, 0, 1, 1,
-0.3598872, -0.2792106, -2.945321, 0, 0, 0, 1, 1,
-0.3572191, -0.9204383, -2.286357, 0, 0, 0, 1, 1,
-0.3489735, -0.6966886, -1.229015, 0, 0, 0, 1, 1,
-0.3479342, -0.7267234, -2.592518, 0, 0, 0, 1, 1,
-0.342283, 0.5834753, -0.5937586, 0, 0, 0, 1, 1,
-0.3402857, 0.6872693, -0.8292464, 0, 0, 0, 1, 1,
-0.3379163, 1.350311, 0.551416, 1, 1, 1, 1, 1,
-0.3376699, -0.4646672, -3.054113, 1, 1, 1, 1, 1,
-0.3349727, 0.8023857, -0.7467907, 1, 1, 1, 1, 1,
-0.3319803, 0.2395512, -1.645911, 1, 1, 1, 1, 1,
-0.3307841, -1.394393, -2.317026, 1, 1, 1, 1, 1,
-0.3223136, 0.4615313, -1.738213, 1, 1, 1, 1, 1,
-0.3214939, 0.4244735, 0.8940447, 1, 1, 1, 1, 1,
-0.3183441, 0.4087797, -2.446382, 1, 1, 1, 1, 1,
-0.3058416, 0.3094252, -0.1633672, 1, 1, 1, 1, 1,
-0.3039585, -0.0007221102, -0.2082808, 1, 1, 1, 1, 1,
-0.3015832, -1.049413, -4.061645, 1, 1, 1, 1, 1,
-0.3014683, 0.08405695, -3.378551, 1, 1, 1, 1, 1,
-0.2951732, 0.8924899, 0.7011498, 1, 1, 1, 1, 1,
-0.2943251, 0.4782552, -1.619937, 1, 1, 1, 1, 1,
-0.2920906, 0.2822151, 0.4327056, 1, 1, 1, 1, 1,
-0.2919953, 0.27649, -1.393728, 0, 0, 1, 1, 1,
-0.2900046, -0.6619247, -2.976761, 1, 0, 0, 1, 1,
-0.2876773, -0.6880261, -2.673999, 1, 0, 0, 1, 1,
-0.2869804, -0.007111018, -0.1002428, 1, 0, 0, 1, 1,
-0.2856407, -1.006956, -3.181723, 1, 0, 0, 1, 1,
-0.2828417, -1.001619, -2.776511, 1, 0, 0, 1, 1,
-0.2821918, 1.916225, 1.480452, 0, 0, 0, 1, 1,
-0.2804201, 0.4619431, -0.6463996, 0, 0, 0, 1, 1,
-0.280071, -0.4912347, -2.914546, 0, 0, 0, 1, 1,
-0.2785026, -0.0641278, -1.90516, 0, 0, 0, 1, 1,
-0.2757248, 0.3916209, 0.04701611, 0, 0, 0, 1, 1,
-0.2709395, -1.066862, -4.147766, 0, 0, 0, 1, 1,
-0.2699352, 1.193904, 0.7012446, 0, 0, 0, 1, 1,
-0.2682596, -1.60543, -3.754862, 1, 1, 1, 1, 1,
-0.2673893, -1.480295, -2.765315, 1, 1, 1, 1, 1,
-0.2665085, 1.905526, 0.9162037, 1, 1, 1, 1, 1,
-0.2642593, 0.2782335, 2.209414, 1, 1, 1, 1, 1,
-0.2635905, 0.4921176, -1.14034, 1, 1, 1, 1, 1,
-0.2626837, -0.02998385, -1.035493, 1, 1, 1, 1, 1,
-0.2598942, 0.8031354, -0.6569322, 1, 1, 1, 1, 1,
-0.2589217, 0.03337117, -0.7727621, 1, 1, 1, 1, 1,
-0.2571962, 0.7980829, 1.187563, 1, 1, 1, 1, 1,
-0.2536522, 0.5505855, -1.069228, 1, 1, 1, 1, 1,
-0.2531298, -0.1862334, -2.738149, 1, 1, 1, 1, 1,
-0.2524337, 1.760205, 3.099741, 1, 1, 1, 1, 1,
-0.2450062, -0.2312318, -1.945729, 1, 1, 1, 1, 1,
-0.2397719, -0.479275, -1.100798, 1, 1, 1, 1, 1,
-0.2361887, 0.5193592, -2.066285, 1, 1, 1, 1, 1,
-0.2334556, 0.4191273, -0.2021942, 0, 0, 1, 1, 1,
-0.2295772, -0.2876318, -4.456375, 1, 0, 0, 1, 1,
-0.2249282, 1.705176, -1.813229, 1, 0, 0, 1, 1,
-0.2230477, 2.365443, -1.727455, 1, 0, 0, 1, 1,
-0.2226139, 0.8539864, 0.9908605, 1, 0, 0, 1, 1,
-0.2223663, -0.6704503, -2.609734, 1, 0, 0, 1, 1,
-0.2213176, 1.719145, 1.134763, 0, 0, 0, 1, 1,
-0.2193655, -0.2178955, -2.035961, 0, 0, 0, 1, 1,
-0.2188713, -0.3636029, -3.887806, 0, 0, 0, 1, 1,
-0.2177427, 0.3265885, -0.9918292, 0, 0, 0, 1, 1,
-0.2105404, 0.4124811, 0.3137792, 0, 0, 0, 1, 1,
-0.2105345, 0.4614011, -1.29638, 0, 0, 0, 1, 1,
-0.2090548, -0.6062883, -0.7371794, 0, 0, 0, 1, 1,
-0.203339, -0.4854285, -1.327638, 1, 1, 1, 1, 1,
-0.1979012, 0.4838875, -0.1149202, 1, 1, 1, 1, 1,
-0.1958603, -0.5972546, -3.206666, 1, 1, 1, 1, 1,
-0.1951266, -4.307721, -2.994583, 1, 1, 1, 1, 1,
-0.1886106, 0.5693139, 0.4398868, 1, 1, 1, 1, 1,
-0.1859547, 1.037336, -1.272332, 1, 1, 1, 1, 1,
-0.1830631, -2.206167, -0.9059248, 1, 1, 1, 1, 1,
-0.1826864, -0.6645664, -2.815193, 1, 1, 1, 1, 1,
-0.1823976, -0.9720724, -4.338157, 1, 1, 1, 1, 1,
-0.1807032, -0.2002811, -1.388483, 1, 1, 1, 1, 1,
-0.1802302, -1.444252, -4.894552, 1, 1, 1, 1, 1,
-0.1792293, 1.923692, -0.1711943, 1, 1, 1, 1, 1,
-0.1655475, -0.8064851, -3.575343, 1, 1, 1, 1, 1,
-0.1561805, 1.37311, -1.084802, 1, 1, 1, 1, 1,
-0.1542036, 0.6237788, -0.2197163, 1, 1, 1, 1, 1,
-0.152133, 1.409351, -0.3272358, 0, 0, 1, 1, 1,
-0.149832, 0.7747371, 0.3618012, 1, 0, 0, 1, 1,
-0.1431108, -0.5969639, -1.855957, 1, 0, 0, 1, 1,
-0.141404, -1.584186, -2.77698, 1, 0, 0, 1, 1,
-0.1411149, -0.9697773, -1.261903, 1, 0, 0, 1, 1,
-0.1356111, -0.2765545, -3.576873, 1, 0, 0, 1, 1,
-0.132878, -0.9691061, -2.357902, 0, 0, 0, 1, 1,
-0.1326415, -1.301678, -3.377884, 0, 0, 0, 1, 1,
-0.1316183, -0.3301897, -2.968256, 0, 0, 0, 1, 1,
-0.1303265, -0.006249773, -1.869455, 0, 0, 0, 1, 1,
-0.1226117, -0.2816861, -1.588351, 0, 0, 0, 1, 1,
-0.1221437, 0.6630065, -2.72145, 0, 0, 0, 1, 1,
-0.1210422, -2.13167, -3.793695, 0, 0, 0, 1, 1,
-0.1169438, 1.241393, -0.4947236, 1, 1, 1, 1, 1,
-0.1156061, 1.974385, 0.5524099, 1, 1, 1, 1, 1,
-0.112756, -2.251504, -1.560504, 1, 1, 1, 1, 1,
-0.1120775, 0.8887548, -0.1762771, 1, 1, 1, 1, 1,
-0.1067391, -0.7715927, -3.881775, 1, 1, 1, 1, 1,
-0.1042786, -2.284997, -1.994465, 1, 1, 1, 1, 1,
-0.1023807, 0.3784223, -0.2823461, 1, 1, 1, 1, 1,
-0.1012138, -0.2283535, -3.568626, 1, 1, 1, 1, 1,
-0.1003596, -0.567997, -2.231672, 1, 1, 1, 1, 1,
-0.09344419, 2.674025, 0.006949176, 1, 1, 1, 1, 1,
-0.09274632, 0.6796099, -0.130311, 1, 1, 1, 1, 1,
-0.08847674, 0.186979, -0.03663969, 1, 1, 1, 1, 1,
-0.08840346, 0.9448824, 0.9746023, 1, 1, 1, 1, 1,
-0.08699901, 0.1055132, 0.4730355, 1, 1, 1, 1, 1,
-0.08510393, 0.1983688, -1.108683, 1, 1, 1, 1, 1,
-0.07067839, 0.8888277, 0.6822255, 0, 0, 1, 1, 1,
-0.06904306, 0.02048817, -2.371954, 1, 0, 0, 1, 1,
-0.0672258, -0.2286725, -3.145759, 1, 0, 0, 1, 1,
-0.06460451, 0.424472, -0.1187797, 1, 0, 0, 1, 1,
-0.05566861, -1.259732, -5.139151, 1, 0, 0, 1, 1,
-0.05387835, 1.321763, 0.6250095, 1, 0, 0, 1, 1,
-0.05304148, -0.7101038, -0.7814011, 0, 0, 0, 1, 1,
-0.05018324, 0.3985973, 0.751631, 0, 0, 0, 1, 1,
-0.04835164, -1.538414, -3.178466, 0, 0, 0, 1, 1,
-0.04715218, -1.629081, -2.837374, 0, 0, 0, 1, 1,
-0.04522504, -0.4400108, -2.649988, 0, 0, 0, 1, 1,
-0.04269283, 0.5312647, 0.9018045, 0, 0, 0, 1, 1,
-0.04084043, -0.2108551, -3.368886, 0, 0, 0, 1, 1,
-0.04010951, 0.644976, 0.9776769, 1, 1, 1, 1, 1,
-0.03844234, 0.8686808, 2.12579, 1, 1, 1, 1, 1,
-0.03545221, -0.5708215, -4.12955, 1, 1, 1, 1, 1,
-0.03487194, -1.207811, -3.549442, 1, 1, 1, 1, 1,
-0.03403749, 0.3955308, 1.480588, 1, 1, 1, 1, 1,
-0.03321627, -0.8938846, -2.261782, 1, 1, 1, 1, 1,
-0.03129868, -1.157604, -3.244708, 1, 1, 1, 1, 1,
-0.02882983, -0.02737361, -3.06663, 1, 1, 1, 1, 1,
-0.02555697, -0.9861345, -3.404836, 1, 1, 1, 1, 1,
-0.02111407, -0.2583178, -2.698953, 1, 1, 1, 1, 1,
-0.02043279, 0.3660438, -0.6194423, 1, 1, 1, 1, 1,
-0.009091341, 0.8516172, -0.8336442, 1, 1, 1, 1, 1,
-0.007533785, 0.4803761, 1.611158, 1, 1, 1, 1, 1,
-0.005006873, 1.695919, -2.678993, 1, 1, 1, 1, 1,
0.001581582, 2.138045, 0.8173169, 1, 1, 1, 1, 1,
0.002318698, -0.9019028, 4.953088, 0, 0, 1, 1, 1,
0.002345718, -0.1104023, 3.960403, 1, 0, 0, 1, 1,
0.002807445, -0.997276, 5.045444, 1, 0, 0, 1, 1,
0.003027991, -0.1501056, 3.338687, 1, 0, 0, 1, 1,
0.006363637, -0.5914789, 3.420291, 1, 0, 0, 1, 1,
0.007250709, -0.5404428, 1.970591, 1, 0, 0, 1, 1,
0.00894226, -0.1870172, 3.754758, 0, 0, 0, 1, 1,
0.01540866, -0.7954944, 4.235057, 0, 0, 0, 1, 1,
0.02521484, 0.04525614, 0.5012102, 0, 0, 0, 1, 1,
0.02940274, 0.01140897, 0.3829214, 0, 0, 0, 1, 1,
0.03068452, 0.291995, -0.2875701, 0, 0, 0, 1, 1,
0.0317053, -0.3864512, 3.924087, 0, 0, 0, 1, 1,
0.03460008, -1.446233, 2.500529, 0, 0, 0, 1, 1,
0.03899449, 2.249565, 1.464604, 1, 1, 1, 1, 1,
0.04069996, 3.020964, 2.012509, 1, 1, 1, 1, 1,
0.04189138, 0.8626931, -0.9159928, 1, 1, 1, 1, 1,
0.04283148, 1.278494, 1.224296, 1, 1, 1, 1, 1,
0.0500783, 0.7314301, 0.3266388, 1, 1, 1, 1, 1,
0.05416455, -1.314363, 2.444365, 1, 1, 1, 1, 1,
0.05653566, -0.9393677, 5.00106, 1, 1, 1, 1, 1,
0.05793045, 0.4757785, 0.4900652, 1, 1, 1, 1, 1,
0.05860143, -0.693504, 4.332301, 1, 1, 1, 1, 1,
0.06506044, -0.5130222, 3.030942, 1, 1, 1, 1, 1,
0.06916351, 0.9023062, 0.2949821, 1, 1, 1, 1, 1,
0.06990226, 1.675073, -0.5371438, 1, 1, 1, 1, 1,
0.07022818, 0.9294149, -2.532127, 1, 1, 1, 1, 1,
0.07261353, 0.1143727, 1.571304, 1, 1, 1, 1, 1,
0.08069167, -0.7544166, 2.406331, 1, 1, 1, 1, 1,
0.08551064, 0.1024071, -0.1659238, 0, 0, 1, 1, 1,
0.08676879, 0.7594368, -1.598854, 1, 0, 0, 1, 1,
0.08864049, 0.1121539, 0.9399269, 1, 0, 0, 1, 1,
0.09113441, 0.1667846, 1.595701, 1, 0, 0, 1, 1,
0.0936279, -0.7126648, 5.156349, 1, 0, 0, 1, 1,
0.09511947, 0.0661142, 1.374385, 1, 0, 0, 1, 1,
0.09577631, 0.007777284, 0.2078515, 0, 0, 0, 1, 1,
0.09660793, -0.3438593, 3.782638, 0, 0, 0, 1, 1,
0.09772617, -0.6230558, 1.682942, 0, 0, 0, 1, 1,
0.100183, 0.4644187, -0.1268696, 0, 0, 0, 1, 1,
0.1036684, -0.3675425, 3.470909, 0, 0, 0, 1, 1,
0.106011, -0.7875263, 1.143834, 0, 0, 0, 1, 1,
0.1066521, 1.470437, 0.4995499, 0, 0, 0, 1, 1,
0.1103333, -1.207188, 2.82829, 1, 1, 1, 1, 1,
0.113277, -1.468648, 2.172568, 1, 1, 1, 1, 1,
0.1166613, -0.7587082, 2.58206, 1, 1, 1, 1, 1,
0.1226231, -0.2045241, 3.81025, 1, 1, 1, 1, 1,
0.1234117, -0.7621907, 4.201335, 1, 1, 1, 1, 1,
0.1243555, 0.90483, 1.121118, 1, 1, 1, 1, 1,
0.1355448, 1.959963, -0.2750696, 1, 1, 1, 1, 1,
0.1365121, -0.8303855, 3.582975, 1, 1, 1, 1, 1,
0.1365757, -0.2678523, 2.794434, 1, 1, 1, 1, 1,
0.1384726, 0.04268676, 1.117072, 1, 1, 1, 1, 1,
0.1388049, 1.140484, -1.397176, 1, 1, 1, 1, 1,
0.1393125, 0.08001957, 1.373464, 1, 1, 1, 1, 1,
0.1393736, -2.243372, 0.6017327, 1, 1, 1, 1, 1,
0.1468802, 0.1546552, -0.7161002, 1, 1, 1, 1, 1,
0.1469362, 0.1664093, 1.639942, 1, 1, 1, 1, 1,
0.1474618, -0.09561015, 1.203297, 0, 0, 1, 1, 1,
0.1500363, -0.3855882, 2.503956, 1, 0, 0, 1, 1,
0.1544835, -0.2061239, 1.44498, 1, 0, 0, 1, 1,
0.155187, 2.473611, 0.5109798, 1, 0, 0, 1, 1,
0.1575742, -1.30176, 2.934769, 1, 0, 0, 1, 1,
0.1590658, -1.238572, 1.852238, 1, 0, 0, 1, 1,
0.1608975, -0.7948793, 3.996374, 0, 0, 0, 1, 1,
0.1618206, -0.9424996, 2.299263, 0, 0, 0, 1, 1,
0.1619452, 0.3971096, 1.302179, 0, 0, 0, 1, 1,
0.1628027, 1.03203, 0.4604273, 0, 0, 0, 1, 1,
0.1642855, 0.9150155, 1.112698, 0, 0, 0, 1, 1,
0.1644211, 0.153345, 3.057852, 0, 0, 0, 1, 1,
0.1680764, -0.9029557, 4.809043, 0, 0, 0, 1, 1,
0.1722174, 1.5781, -2.752825, 1, 1, 1, 1, 1,
0.173213, -2.38667, 3.111265, 1, 1, 1, 1, 1,
0.1734385, 0.7543864, 0.4574336, 1, 1, 1, 1, 1,
0.1765853, -0.01364467, 2.042559, 1, 1, 1, 1, 1,
0.1804386, 0.8959716, -0.352662, 1, 1, 1, 1, 1,
0.1804418, 0.9147903, -1.878096, 1, 1, 1, 1, 1,
0.1808619, -0.8715708, 2.221766, 1, 1, 1, 1, 1,
0.1811516, 0.2847441, 0.3737986, 1, 1, 1, 1, 1,
0.1823723, 0.5032409, 1.123693, 1, 1, 1, 1, 1,
0.1835053, -1.424456, 3.757069, 1, 1, 1, 1, 1,
0.1835733, -1.388036, 2.010662, 1, 1, 1, 1, 1,
0.1880524, 0.7327276, 0.295786, 1, 1, 1, 1, 1,
0.1882315, 0.6393938, 0.2389019, 1, 1, 1, 1, 1,
0.1904689, -0.04411187, 4.019248, 1, 1, 1, 1, 1,
0.194886, 0.9289638, -0.5741501, 1, 1, 1, 1, 1,
0.1985261, -1.110162, 3.940742, 0, 0, 1, 1, 1,
0.2128385, -0.08937396, 4.006439, 1, 0, 0, 1, 1,
0.2144201, 2.92699, -1.15218, 1, 0, 0, 1, 1,
0.215483, 0.8747576, 1.457128, 1, 0, 0, 1, 1,
0.2189243, -0.0856763, 1.449047, 1, 0, 0, 1, 1,
0.2207722, -0.5031379, 2.931662, 1, 0, 0, 1, 1,
0.2217584, -0.6262028, 1.5731, 0, 0, 0, 1, 1,
0.2270199, -0.9214199, 1.75745, 0, 0, 0, 1, 1,
0.2313733, -0.3790366, 1.547561, 0, 0, 0, 1, 1,
0.2350745, -0.8032153, 4.040895, 0, 0, 0, 1, 1,
0.2354168, -0.6038274, 2.608268, 0, 0, 0, 1, 1,
0.2391021, -1.749964, 2.733493, 0, 0, 0, 1, 1,
0.2397857, -1.613109, 4.539683, 0, 0, 0, 1, 1,
0.2426026, 0.5072458, 1.238744, 1, 1, 1, 1, 1,
0.2462031, -0.1108243, 1.887864, 1, 1, 1, 1, 1,
0.2468265, 0.00549318, 4.031687, 1, 1, 1, 1, 1,
0.24826, -0.8719772, 1.367973, 1, 1, 1, 1, 1,
0.2554753, -0.4000526, 2.657467, 1, 1, 1, 1, 1,
0.2663149, 0.03350348, 0.9671804, 1, 1, 1, 1, 1,
0.2664464, -0.149115, 2.451531, 1, 1, 1, 1, 1,
0.2668581, 2.620718, 3.056556, 1, 1, 1, 1, 1,
0.2678295, -0.5907806, 2.708302, 1, 1, 1, 1, 1,
0.2723725, -1.808284, 3.766474, 1, 1, 1, 1, 1,
0.2774603, -1.360955, 2.786039, 1, 1, 1, 1, 1,
0.2779511, 1.445217, 1.60641, 1, 1, 1, 1, 1,
0.2787046, -0.6961918, 3.300525, 1, 1, 1, 1, 1,
0.2910776, -0.03566182, 2.9988, 1, 1, 1, 1, 1,
0.2945468, -1.509105, 1.088659, 1, 1, 1, 1, 1,
0.2966275, -0.9607754, 3.994524, 0, 0, 1, 1, 1,
0.2966517, -0.409151, 3.643613, 1, 0, 0, 1, 1,
0.2972515, 2.051157, -0.4970564, 1, 0, 0, 1, 1,
0.2988025, 0.7423576, -0.4276684, 1, 0, 0, 1, 1,
0.2997442, -1.083809, 2.886799, 1, 0, 0, 1, 1,
0.2999793, -0.1862992, 0.7261279, 1, 0, 0, 1, 1,
0.301005, 0.9765337, 0.6637505, 0, 0, 0, 1, 1,
0.3038151, -1.313503, 3.345125, 0, 0, 0, 1, 1,
0.3042927, -0.1392387, 3.247603, 0, 0, 0, 1, 1,
0.3063859, -2.212945, 3.384071, 0, 0, 0, 1, 1,
0.3092975, -0.266529, 0.9781773, 0, 0, 0, 1, 1,
0.3103251, 2.761628, -0.6029112, 0, 0, 0, 1, 1,
0.312483, 0.09136142, 0.7652208, 0, 0, 0, 1, 1,
0.313975, -0.09578327, 1.553138, 1, 1, 1, 1, 1,
0.3145582, 0.1725149, 0.4198068, 1, 1, 1, 1, 1,
0.3153339, 1.13278, -0.7027134, 1, 1, 1, 1, 1,
0.3165314, 0.1674157, 0.444411, 1, 1, 1, 1, 1,
0.3171808, -0.6962983, 1.771268, 1, 1, 1, 1, 1,
0.3197591, -0.3214818, 2.28002, 1, 1, 1, 1, 1,
0.3210511, 0.1074813, 1.026669, 1, 1, 1, 1, 1,
0.3214393, -0.7149058, 3.312006, 1, 1, 1, 1, 1,
0.3225293, -0.2973065, 2.152902, 1, 1, 1, 1, 1,
0.3265107, -0.7337966, 1.311811, 1, 1, 1, 1, 1,
0.3269851, -0.2629256, 2.799693, 1, 1, 1, 1, 1,
0.3288257, -0.9132085, 2.954908, 1, 1, 1, 1, 1,
0.3292218, 0.7913776, 1.151884, 1, 1, 1, 1, 1,
0.3294419, -1.126846, 2.512609, 1, 1, 1, 1, 1,
0.3319482, 0.9681435, -1.209852, 1, 1, 1, 1, 1,
0.3331582, 1.97609, 0.9170557, 0, 0, 1, 1, 1,
0.3365341, 0.508004, 0.6922382, 1, 0, 0, 1, 1,
0.3396742, -0.2492497, 0.3505794, 1, 0, 0, 1, 1,
0.3397106, -1.519811, 3.556608, 1, 0, 0, 1, 1,
0.3407697, -1.025952, 2.714237, 1, 0, 0, 1, 1,
0.3422798, -1.653664, 2.867195, 1, 0, 0, 1, 1,
0.3423362, 0.4531792, 1.295519, 0, 0, 0, 1, 1,
0.3444256, -0.7598409, 3.80095, 0, 0, 0, 1, 1,
0.3480085, 0.32322, 1.487428, 0, 0, 0, 1, 1,
0.3485624, -0.9559529, 2.337502, 0, 0, 0, 1, 1,
0.3493855, -0.08143307, 3.775808, 0, 0, 0, 1, 1,
0.3500779, -0.8279488, 2.242013, 0, 0, 0, 1, 1,
0.3521158, 0.1607256, 0.6730024, 0, 0, 0, 1, 1,
0.3548746, -0.5222148, 1.695754, 1, 1, 1, 1, 1,
0.3554669, -0.7130671, 3.788516, 1, 1, 1, 1, 1,
0.3577092, 0.7216564, -0.005971525, 1, 1, 1, 1, 1,
0.3582342, -0.229599, 0.6162983, 1, 1, 1, 1, 1,
0.3596782, 0.1826936, 1.35717, 1, 1, 1, 1, 1,
0.3634954, 0.05927002, 1.549889, 1, 1, 1, 1, 1,
0.3642306, 0.5827215, 0.03180235, 1, 1, 1, 1, 1,
0.3642699, 1.822552, 1.288274, 1, 1, 1, 1, 1,
0.3654986, -0.1195077, 3.125062, 1, 1, 1, 1, 1,
0.368328, 1.41725, -0.6167597, 1, 1, 1, 1, 1,
0.3706304, 0.9911106, -1.356265, 1, 1, 1, 1, 1,
0.3745937, 0.9057909, -0.8062308, 1, 1, 1, 1, 1,
0.3763726, 0.5702606, 1.087633, 1, 1, 1, 1, 1,
0.380522, -2.438241, 3.62996, 1, 1, 1, 1, 1,
0.3823538, 0.6478314, -0.6937244, 1, 1, 1, 1, 1,
0.3873522, 0.04801412, 0.6072358, 0, 0, 1, 1, 1,
0.39087, 0.1130029, 1.281348, 1, 0, 0, 1, 1,
0.3909684, -1.009652, 2.78339, 1, 0, 0, 1, 1,
0.392554, 1.887368, 0.0007750945, 1, 0, 0, 1, 1,
0.3946721, 0.5425667, 1.819656, 1, 0, 0, 1, 1,
0.4003426, -0.5804058, 1.068484, 1, 0, 0, 1, 1,
0.4014305, -0.1566992, 5.012222, 0, 0, 0, 1, 1,
0.4043732, 0.3527142, 1.084337, 0, 0, 0, 1, 1,
0.4076717, -0.7252112, 1.58935, 0, 0, 0, 1, 1,
0.4088344, -0.7554507, 3.875774, 0, 0, 0, 1, 1,
0.4110035, 0.2301788, 1.604777, 0, 0, 0, 1, 1,
0.4113588, -1.477474, 1.878557, 0, 0, 0, 1, 1,
0.411562, -1.697078, 1.571229, 0, 0, 0, 1, 1,
0.4157344, 0.4066103, 0.3607431, 1, 1, 1, 1, 1,
0.4202413, 0.4014376, 0.9015445, 1, 1, 1, 1, 1,
0.4215488, 0.7271345, -0.6217709, 1, 1, 1, 1, 1,
0.4236288, 1.02476, 1.79079, 1, 1, 1, 1, 1,
0.4316475, 0.2420423, 2.007832, 1, 1, 1, 1, 1,
0.4351109, 1.643716, -0.2471883, 1, 1, 1, 1, 1,
0.4397545, -0.1179202, 1.654643, 1, 1, 1, 1, 1,
0.4400995, 0.425634, -0.2741312, 1, 1, 1, 1, 1,
0.4493266, -0.05829388, 1.403924, 1, 1, 1, 1, 1,
0.4554425, 1.255282, -1.343891, 1, 1, 1, 1, 1,
0.4581447, -0.8490722, 1.769369, 1, 1, 1, 1, 1,
0.4610578, -0.5726854, 2.34635, 1, 1, 1, 1, 1,
0.4671198, -2.442574, 2.332328, 1, 1, 1, 1, 1,
0.4675956, -0.2034588, 1.095865, 1, 1, 1, 1, 1,
0.4681519, 0.7145623, 0.1293683, 1, 1, 1, 1, 1,
0.4728454, -0.6162081, 3.273929, 0, 0, 1, 1, 1,
0.4743068, -0.6004898, 2.430296, 1, 0, 0, 1, 1,
0.4749626, 0.8904166, -0.934163, 1, 0, 0, 1, 1,
0.4771, -0.5088562, 3.497578, 1, 0, 0, 1, 1,
0.4794589, -0.5644586, 3.960245, 1, 0, 0, 1, 1,
0.481903, -0.01530893, 1.202753, 1, 0, 0, 1, 1,
0.485455, 0.6228392, 1.366003, 0, 0, 0, 1, 1,
0.4861594, 1.226684, 0.5220733, 0, 0, 0, 1, 1,
0.4939959, 0.3613842, 1.276346, 0, 0, 0, 1, 1,
0.4943028, -0.3144721, 2.797075, 0, 0, 0, 1, 1,
0.495343, 0.5581662, -0.08780047, 0, 0, 0, 1, 1,
0.4993897, -0.765143, 2.218739, 0, 0, 0, 1, 1,
0.5013515, -1.955841, 3.825053, 0, 0, 0, 1, 1,
0.5016543, 0.7608094, 1.593517, 1, 1, 1, 1, 1,
0.5034125, -1.141481, 1.192906, 1, 1, 1, 1, 1,
0.5043111, 0.4120393, 2.12244, 1, 1, 1, 1, 1,
0.5058085, -1.351353, 4.780757, 1, 1, 1, 1, 1,
0.5085817, -0.4193617, 3.302234, 1, 1, 1, 1, 1,
0.5087574, -0.4365075, 0.01763503, 1, 1, 1, 1, 1,
0.5138624, 1.059535, 2.227073, 1, 1, 1, 1, 1,
0.516751, 0.8533952, 0.1192097, 1, 1, 1, 1, 1,
0.5194539, -0.5605174, 1.784314, 1, 1, 1, 1, 1,
0.5233966, -2.487992, 2.945562, 1, 1, 1, 1, 1,
0.5245246, 0.5971118, 1.408067, 1, 1, 1, 1, 1,
0.5271982, -0.03500405, 0.8392633, 1, 1, 1, 1, 1,
0.527515, 1.109339, 1.190093, 1, 1, 1, 1, 1,
0.5300072, 0.4187192, 0.2459038, 1, 1, 1, 1, 1,
0.5412202, 1.613146, 0.8536571, 1, 1, 1, 1, 1,
0.5452524, -1.035659, 2.612602, 0, 0, 1, 1, 1,
0.545256, 0.185722, -0.133735, 1, 0, 0, 1, 1,
0.5468574, -0.8160863, 0.8125783, 1, 0, 0, 1, 1,
0.5491396, 0.1644225, 0.5948516, 1, 0, 0, 1, 1,
0.5517208, -2.343472, 3.275623, 1, 0, 0, 1, 1,
0.5523749, -0.4854533, 3.211779, 1, 0, 0, 1, 1,
0.5541953, -0.05902585, 3.347301, 0, 0, 0, 1, 1,
0.5590571, -0.6714608, 3.234879, 0, 0, 0, 1, 1,
0.5605676, 0.6630689, -0.295989, 0, 0, 0, 1, 1,
0.5639064, -0.4468282, 3.272305, 0, 0, 0, 1, 1,
0.5659042, 0.04715561, 1.491789, 0, 0, 0, 1, 1,
0.5676337, -0.8667668, 0.5323834, 0, 0, 0, 1, 1,
0.5705897, -0.09555057, 0.5085858, 0, 0, 0, 1, 1,
0.5714418, 0.04804064, 1.758572, 1, 1, 1, 1, 1,
0.571874, -0.6884317, 1.622212, 1, 1, 1, 1, 1,
0.5751913, 0.4023453, 0.5512037, 1, 1, 1, 1, 1,
0.5833014, 0.5584897, -1.628991, 1, 1, 1, 1, 1,
0.5838439, -0.7340873, 1.469502, 1, 1, 1, 1, 1,
0.5883092, 0.05274672, 2.04461, 1, 1, 1, 1, 1,
0.5896176, -1.703614, 4.364576, 1, 1, 1, 1, 1,
0.5906546, 0.5071632, 1.948902, 1, 1, 1, 1, 1,
0.5917718, -1.60389, 3.159711, 1, 1, 1, 1, 1,
0.5926319, -0.01404852, 1.76433, 1, 1, 1, 1, 1,
0.6002831, -1.804525, 2.056052, 1, 1, 1, 1, 1,
0.6031364, -0.03942732, 1.467992, 1, 1, 1, 1, 1,
0.6121421, 2.417089, 1.148967, 1, 1, 1, 1, 1,
0.6177338, -0.9793921, 2.797573, 1, 1, 1, 1, 1,
0.6188765, 0.4919356, 0.1791091, 1, 1, 1, 1, 1,
0.626496, -0.05725582, 1.835559, 0, 0, 1, 1, 1,
0.6277602, 0.1100777, 1.876585, 1, 0, 0, 1, 1,
0.6277909, -1.653704, 2.680062, 1, 0, 0, 1, 1,
0.6287884, 0.4722089, 2.058974, 1, 0, 0, 1, 1,
0.6305466, -0.8172832, 1.80998, 1, 0, 0, 1, 1,
0.6321833, -0.8128052, 2.006169, 1, 0, 0, 1, 1,
0.6333882, 0.5123356, 0.6715991, 0, 0, 0, 1, 1,
0.640617, -0.9962676, 2.605825, 0, 0, 0, 1, 1,
0.6407385, 0.6538909, 0.7049777, 0, 0, 0, 1, 1,
0.6492898, -1.178109, 1.533486, 0, 0, 0, 1, 1,
0.6507111, -1.236578, 2.839677, 0, 0, 0, 1, 1,
0.6545299, -0.002514181, 2.993505, 0, 0, 0, 1, 1,
0.6547675, -1.383213, 0.5349198, 0, 0, 0, 1, 1,
0.6624138, 0.6748879, 0.385436, 1, 1, 1, 1, 1,
0.6644905, -0.203015, 1.295629, 1, 1, 1, 1, 1,
0.6673627, -1.17109, 1.988531, 1, 1, 1, 1, 1,
0.6696749, 1.759821, 0.0988215, 1, 1, 1, 1, 1,
0.6708063, 0.4861264, 1.121724, 1, 1, 1, 1, 1,
0.6720312, -0.6429083, 2.524893, 1, 1, 1, 1, 1,
0.6755145, -0.2830862, 2.659896, 1, 1, 1, 1, 1,
0.6757408, -0.327875, 2.567878, 1, 1, 1, 1, 1,
0.6780832, 2.079849, -0.614775, 1, 1, 1, 1, 1,
0.6838372, -0.4337525, 3.430141, 1, 1, 1, 1, 1,
0.6866743, -0.2683006, 1.972646, 1, 1, 1, 1, 1,
0.6891865, -1.670172, 3.857972, 1, 1, 1, 1, 1,
0.6898575, -0.7429169, 2.331365, 1, 1, 1, 1, 1,
0.6915779, -0.9550707, 1.167011, 1, 1, 1, 1, 1,
0.6916377, 0.3762535, -0.3723177, 1, 1, 1, 1, 1,
0.6928953, 0.3336837, 2.403482, 0, 0, 1, 1, 1,
0.6946851, -1.532379, 2.215071, 1, 0, 0, 1, 1,
0.697548, -0.5650826, 1.860024, 1, 0, 0, 1, 1,
0.699387, 1.709122, -0.2048315, 1, 0, 0, 1, 1,
0.7036417, 0.3729267, -0.05468344, 1, 0, 0, 1, 1,
0.706861, -1.49966, 2.103628, 1, 0, 0, 1, 1,
0.7173952, 0.2083794, 1.150272, 0, 0, 0, 1, 1,
0.7206812, -1.205652, 2.243388, 0, 0, 0, 1, 1,
0.7243091, 0.3388923, 1.221562, 0, 0, 0, 1, 1,
0.7307301, -0.6556413, 2.846739, 0, 0, 0, 1, 1,
0.7307728, -0.9437798, 2.110678, 0, 0, 0, 1, 1,
0.73168, -0.4088755, 2.147477, 0, 0, 0, 1, 1,
0.7382392, 1.214036, 1.698611, 0, 0, 0, 1, 1,
0.7391232, 1.334471, 2.747122, 1, 1, 1, 1, 1,
0.74567, -0.4287174, 0.9885889, 1, 1, 1, 1, 1,
0.7457538, -0.527115, 2.400699, 1, 1, 1, 1, 1,
0.749194, 0.3025779, -0.5897422, 1, 1, 1, 1, 1,
0.7513561, 0.5786575, 0.9072455, 1, 1, 1, 1, 1,
0.7520373, -1.938835, 1.221182, 1, 1, 1, 1, 1,
0.7530789, -1.044248, 2.876391, 1, 1, 1, 1, 1,
0.7531446, -0.4597978, 1.574072, 1, 1, 1, 1, 1,
0.755958, 0.8809631, 2.245748, 1, 1, 1, 1, 1,
0.7569677, -0.2499388, 2.470492, 1, 1, 1, 1, 1,
0.7586421, -1.678995, 2.774917, 1, 1, 1, 1, 1,
0.7631582, 0.164475, 2.763526, 1, 1, 1, 1, 1,
0.7633936, -2.234813, 3.12392, 1, 1, 1, 1, 1,
0.7636194, 0.3416592, 1.293253, 1, 1, 1, 1, 1,
0.7681332, 0.3031425, 2.001382, 1, 1, 1, 1, 1,
0.7821999, 0.658943, 1.979348, 0, 0, 1, 1, 1,
0.7910048, -0.4102516, 1.373361, 1, 0, 0, 1, 1,
0.7939276, -0.6858617, 3.544321, 1, 0, 0, 1, 1,
0.7954777, 0.9833305, 2.649188, 1, 0, 0, 1, 1,
0.8070328, -0.363197, 3.00155, 1, 0, 0, 1, 1,
0.816325, 0.6180201, 1.290608, 1, 0, 0, 1, 1,
0.8175561, 0.2136599, 1.894205, 0, 0, 0, 1, 1,
0.8231204, -0.4949096, 2.604593, 0, 0, 0, 1, 1,
0.8238521, -0.4778732, 0.02562587, 0, 0, 0, 1, 1,
0.8254967, -1.428789, 2.700104, 0, 0, 0, 1, 1,
0.8261259, 0.08249568, 3.282681, 0, 0, 0, 1, 1,
0.828169, -0.3007312, 2.507991, 0, 0, 0, 1, 1,
0.8319639, -1.141978, 1.437481, 0, 0, 0, 1, 1,
0.8376331, 0.4289662, 1.805373, 1, 1, 1, 1, 1,
0.8428237, -0.2357883, 2.340577, 1, 1, 1, 1, 1,
0.8430852, -0.5716457, 1.855922, 1, 1, 1, 1, 1,
0.8442249, -0.442305, 0.2427067, 1, 1, 1, 1, 1,
0.84714, 1.3196, -0.2285897, 1, 1, 1, 1, 1,
0.8523055, -0.148942, 3.716841, 1, 1, 1, 1, 1,
0.853857, 0.8998111, 1.074893, 1, 1, 1, 1, 1,
0.8556294, 0.04451034, 3.14432, 1, 1, 1, 1, 1,
0.8580254, -1.022328, 1.445523, 1, 1, 1, 1, 1,
0.8603362, 1.610945, 0.00201125, 1, 1, 1, 1, 1,
0.8625479, 0.3300115, 1.632459, 1, 1, 1, 1, 1,
0.8637007, 1.826401, 0.5352924, 1, 1, 1, 1, 1,
0.8748899, 0.4730381, 1.182426, 1, 1, 1, 1, 1,
0.8777708, -0.9088066, 1.20303, 1, 1, 1, 1, 1,
0.8793728, 0.6462051, 1.186529, 1, 1, 1, 1, 1,
0.8888775, 0.493488, -0.3257143, 0, 0, 1, 1, 1,
0.8891725, 1.480834, 1.055794, 1, 0, 0, 1, 1,
0.8949143, 1.66987, 0.9760333, 1, 0, 0, 1, 1,
0.8992777, 2.214412, 0.1449814, 1, 0, 0, 1, 1,
0.9002512, 0.8722267, 0.6284397, 1, 0, 0, 1, 1,
0.9039376, 1.73777, 1.594504, 1, 0, 0, 1, 1,
0.920615, -1.42859, 4.802474, 0, 0, 0, 1, 1,
0.9242401, 0.3174834, 0.2016687, 0, 0, 0, 1, 1,
0.9275591, -0.5561771, 2.590775, 0, 0, 0, 1, 1,
0.9340526, -1.071584, 2.24763, 0, 0, 0, 1, 1,
0.9341578, -0.338772, 1.3578, 0, 0, 0, 1, 1,
0.9347796, 1.007657, -0.1468042, 0, 0, 0, 1, 1,
0.9364375, -0.436794, 1.738424, 0, 0, 0, 1, 1,
0.9416852, -1.022838, 3.032811, 1, 1, 1, 1, 1,
0.9440878, 0.1320304, 1.046913, 1, 1, 1, 1, 1,
0.9443066, 0.374049, 2.517945, 1, 1, 1, 1, 1,
0.9469225, -0.4908477, 1.879644, 1, 1, 1, 1, 1,
0.9484358, 0.1969876, 1.326838, 1, 1, 1, 1, 1,
0.9486498, -0.7589789, 0.7758508, 1, 1, 1, 1, 1,
0.9508582, 0.9920428, 2.847982, 1, 1, 1, 1, 1,
0.9525347, 0.4065337, 1.33916, 1, 1, 1, 1, 1,
0.9560426, 0.957417, 0.252598, 1, 1, 1, 1, 1,
0.9691705, 0.3326417, 0.9126418, 1, 1, 1, 1, 1,
0.9725014, -1.464124, 2.710332, 1, 1, 1, 1, 1,
0.9727997, -0.1954569, 1.785565, 1, 1, 1, 1, 1,
0.9782144, -0.1764064, 3.51381, 1, 1, 1, 1, 1,
0.9848583, 0.3697471, 2.655695, 1, 1, 1, 1, 1,
0.9861356, 0.2305767, 3.822615, 1, 1, 1, 1, 1,
0.9907315, 0.486855, 0.08474358, 0, 0, 1, 1, 1,
0.9955416, 0.04512643, 2.565092, 1, 0, 0, 1, 1,
0.9969248, 0.1434601, 2.07589, 1, 0, 0, 1, 1,
0.9988101, 0.4530334, 1.966921, 1, 0, 0, 1, 1,
1.000541, 0.9546853, 1.30498, 1, 0, 0, 1, 1,
1.004815, -0.953669, 3.513227, 1, 0, 0, 1, 1,
1.007149, 0.6602421, 1.650257, 0, 0, 0, 1, 1,
1.0092, 1.704033, -0.421034, 0, 0, 0, 1, 1,
1.011376, 0.4418927, 0.2222923, 0, 0, 0, 1, 1,
1.011687, -0.5797039, 1.352515, 0, 0, 0, 1, 1,
1.021306, 0.65452, 0.2858419, 0, 0, 0, 1, 1,
1.026219, -0.9968829, 4.045943, 0, 0, 0, 1, 1,
1.031537, 1.320205, -0.2518963, 0, 0, 0, 1, 1,
1.036666, -1.314315, 2.415722, 1, 1, 1, 1, 1,
1.036954, 0.9646369, 0.3970309, 1, 1, 1, 1, 1,
1.0425, 0.564158, 2.640018, 1, 1, 1, 1, 1,
1.044339, 0.2988597, 1.16738, 1, 1, 1, 1, 1,
1.062957, -1.153732, 3.263164, 1, 1, 1, 1, 1,
1.063267, -1.487121, 1.701867, 1, 1, 1, 1, 1,
1.063796, -1.369706, 2.157512, 1, 1, 1, 1, 1,
1.070987, -0.6541255, 0.8551388, 1, 1, 1, 1, 1,
1.078815, -0.6683311, 0.8430697, 1, 1, 1, 1, 1,
1.079478, 0.3704461, 1.301823, 1, 1, 1, 1, 1,
1.08266, -0.7317601, 0.6333746, 1, 1, 1, 1, 1,
1.082809, -0.526795, 2.319705, 1, 1, 1, 1, 1,
1.08558, -2.196217, 3.946311, 1, 1, 1, 1, 1,
1.090857, -1.074532, 2.257046, 1, 1, 1, 1, 1,
1.09328, 0.9425907, 0.7314836, 1, 1, 1, 1, 1,
1.094351, -0.2667245, 2.662739, 0, 0, 1, 1, 1,
1.09921, 0.8267037, 1.095638, 1, 0, 0, 1, 1,
1.109071, 0.8971157, 2.916109, 1, 0, 0, 1, 1,
1.112845, -0.4732012, 2.872415, 1, 0, 0, 1, 1,
1.116117, 1.073857, 2.045243, 1, 0, 0, 1, 1,
1.119949, 1.401415, -0.3607223, 1, 0, 0, 1, 1,
1.121176, 0.3429568, 2.594473, 0, 0, 0, 1, 1,
1.138788, -0.6788068, 4.225723, 0, 0, 0, 1, 1,
1.139316, 1.621394, 0.07756687, 0, 0, 0, 1, 1,
1.141769, 0.6545616, 0.1939902, 0, 0, 0, 1, 1,
1.145205, 0.004677668, 2.100745, 0, 0, 0, 1, 1,
1.148218, -1.613042, 1.776933, 0, 0, 0, 1, 1,
1.153664, 0.6683598, 0.7067307, 0, 0, 0, 1, 1,
1.167419, -0.980513, 2.460804, 1, 1, 1, 1, 1,
1.17189, 0.2463231, 1.688929, 1, 1, 1, 1, 1,
1.17428, -0.3249794, 2.152879, 1, 1, 1, 1, 1,
1.174917, 0.5044274, 1.869572, 1, 1, 1, 1, 1,
1.175431, 1.070486, 1.71088, 1, 1, 1, 1, 1,
1.18041, -0.1231968, 0.274442, 1, 1, 1, 1, 1,
1.18054, -0.5729516, -0.5895007, 1, 1, 1, 1, 1,
1.209456, -0.1159954, 0.2175317, 1, 1, 1, 1, 1,
1.215463, -2.265791, 2.088703, 1, 1, 1, 1, 1,
1.220538, -1.900116, 3.175923, 1, 1, 1, 1, 1,
1.222082, -0.6585206, 0.8008034, 1, 1, 1, 1, 1,
1.223215, 1.330449, 0.2962267, 1, 1, 1, 1, 1,
1.223474, -0.8393841, 2.222774, 1, 1, 1, 1, 1,
1.224662, 0.3378404, 0.8955038, 1, 1, 1, 1, 1,
1.225343, -0.3069826, 1.52783, 1, 1, 1, 1, 1,
1.226303, 0.4074947, 3.277716, 0, 0, 1, 1, 1,
1.230902, 0.4004949, 0.9750274, 1, 0, 0, 1, 1,
1.23295, 0.1870858, 0.8392506, 1, 0, 0, 1, 1,
1.236456, 0.5912932, 1.415441, 1, 0, 0, 1, 1,
1.244611, -0.1195301, 2.387407, 1, 0, 0, 1, 1,
1.245422, -0.9269646, 3.292116, 1, 0, 0, 1, 1,
1.247939, -0.6979233, 3.1596, 0, 0, 0, 1, 1,
1.253088, 1.185197, 0.4061536, 0, 0, 0, 1, 1,
1.255064, -1.75687, 4.207234, 0, 0, 0, 1, 1,
1.256123, -0.01216912, 2.711776, 0, 0, 0, 1, 1,
1.260987, 0.2077056, 0.5776169, 0, 0, 0, 1, 1,
1.263131, 0.604571, 2.013867, 0, 0, 0, 1, 1,
1.26917, 0.1941024, 1.138587, 0, 0, 0, 1, 1,
1.274129, -1.193316, 1.907558, 1, 1, 1, 1, 1,
1.277135, 0.1696872, 0.1477749, 1, 1, 1, 1, 1,
1.28131, 0.3358989, -0.5973882, 1, 1, 1, 1, 1,
1.283267, 2.089232, 2.672443, 1, 1, 1, 1, 1,
1.289484, -2.220775, 2.230672, 1, 1, 1, 1, 1,
1.294904, 1.698008, 1.823423, 1, 1, 1, 1, 1,
1.299812, 0.08923852, -0.09512389, 1, 1, 1, 1, 1,
1.300067, 1.041995, 1.530498, 1, 1, 1, 1, 1,
1.309882, -0.060426, 2.533358, 1, 1, 1, 1, 1,
1.311313, 0.149199, 1.182393, 1, 1, 1, 1, 1,
1.317635, -1.538792, 2.369928, 1, 1, 1, 1, 1,
1.328756, 0.4283634, 2.810973, 1, 1, 1, 1, 1,
1.33854, -0.7301899, 1.219416, 1, 1, 1, 1, 1,
1.342408, 0.03090484, 1.844575, 1, 1, 1, 1, 1,
1.344642, 1.935439, 2.919843, 1, 1, 1, 1, 1,
1.346146, 0.4767072, 1.535281, 0, 0, 1, 1, 1,
1.358585, -0.2489289, 3.625036, 1, 0, 0, 1, 1,
1.362838, 1.365874, 0.901414, 1, 0, 0, 1, 1,
1.369381, -1.541915, 3.016674, 1, 0, 0, 1, 1,
1.371735, 0.491296, 1.134752, 1, 0, 0, 1, 1,
1.378503, -0.2021508, 0.04004313, 1, 0, 0, 1, 1,
1.378648, 1.151777, 1.794173, 0, 0, 0, 1, 1,
1.389089, 2.016268, 2.484958, 0, 0, 0, 1, 1,
1.39263, -0.891242, 1.21169, 0, 0, 0, 1, 1,
1.402811, -0.9762671, 3.395533, 0, 0, 0, 1, 1,
1.4032, 0.8698388, 0.7711248, 0, 0, 0, 1, 1,
1.425087, -0.6540861, 3.356796, 0, 0, 0, 1, 1,
1.428636, 0.302162, 2.538237, 0, 0, 0, 1, 1,
1.430207, -0.6427187, 2.151402, 1, 1, 1, 1, 1,
1.432833, -1.021434, 1.251811, 1, 1, 1, 1, 1,
1.442514, -0.690904, 1.946426, 1, 1, 1, 1, 1,
1.443305, -0.7001547, 1.350909, 1, 1, 1, 1, 1,
1.445324, -1.504293, 2.423234, 1, 1, 1, 1, 1,
1.460188, 0.5431386, 0.5373566, 1, 1, 1, 1, 1,
1.464149, 0.005804101, 0.4604305, 1, 1, 1, 1, 1,
1.494327, 0.4392247, 2.013135, 1, 1, 1, 1, 1,
1.502771, -0.3957204, 3.256142, 1, 1, 1, 1, 1,
1.518231, 0.7033433, 0.7919128, 1, 1, 1, 1, 1,
1.521876, -0.1691594, 3.553666, 1, 1, 1, 1, 1,
1.544753, 1.713384, 1.843923, 1, 1, 1, 1, 1,
1.563623, -0.02322365, 1.904827, 1, 1, 1, 1, 1,
1.573459, 0.7440882, -0.2930519, 1, 1, 1, 1, 1,
1.605415, -0.4850168, 2.93375, 1, 1, 1, 1, 1,
1.606048, 0.2840265, 0.7738064, 0, 0, 1, 1, 1,
1.607971, -1.411336, 1.79529, 1, 0, 0, 1, 1,
1.608185, 0.7207693, 1.699467, 1, 0, 0, 1, 1,
1.608287, -0.3243228, -1.028957, 1, 0, 0, 1, 1,
1.630282, -0.5065972, 1.760363, 1, 0, 0, 1, 1,
1.632414, 0.2654885, 1.319833, 1, 0, 0, 1, 1,
1.671212, 0.02875285, 1.07335, 0, 0, 0, 1, 1,
1.674472, -0.8641977, 1.629641, 0, 0, 0, 1, 1,
1.681907, -0.9981612, 2.183931, 0, 0, 0, 1, 1,
1.703514, -0.3099082, 1.844197, 0, 0, 0, 1, 1,
1.704258, 0.6897036, 0.2923432, 0, 0, 0, 1, 1,
1.735635, -0.262664, 1.878264, 0, 0, 0, 1, 1,
1.737479, 1.929023, -0.11922, 0, 0, 0, 1, 1,
1.748025, 0.2885675, 2.545714, 1, 1, 1, 1, 1,
1.749148, -0.3074051, 3.214415, 1, 1, 1, 1, 1,
1.753799, 0.9061043, 0.4327048, 1, 1, 1, 1, 1,
1.774025, -0.4699304, 1.40965, 1, 1, 1, 1, 1,
1.78096, 0.1356671, 1.261602, 1, 1, 1, 1, 1,
1.79319, 0.1016308, 3.253852, 1, 1, 1, 1, 1,
1.795818, 0.5385811, -0.9259657, 1, 1, 1, 1, 1,
1.803103, 0.2485418, 1.476173, 1, 1, 1, 1, 1,
1.805082, 0.3025036, 1.62301, 1, 1, 1, 1, 1,
1.808732, 0.4413998, -0.04304983, 1, 1, 1, 1, 1,
1.837423, -0.2063645, 1.473432, 1, 1, 1, 1, 1,
1.838319, 1.246887, 2.417006, 1, 1, 1, 1, 1,
1.870949, -0.06337488, 2.403712, 1, 1, 1, 1, 1,
1.875226, 1.193726, 0.3329277, 1, 1, 1, 1, 1,
1.902985, 1.707919, 0.1147487, 1, 1, 1, 1, 1,
1.907883, 1.596712, 0.9249344, 0, 0, 1, 1, 1,
1.911715, 1.026458, 0.214406, 1, 0, 0, 1, 1,
1.917807, -0.6974399, 1.657284, 1, 0, 0, 1, 1,
1.939263, -1.071734, -0.4739377, 1, 0, 0, 1, 1,
1.940882, -0.416638, 2.132643, 1, 0, 0, 1, 1,
1.960593, -0.9873627, 2.682528, 1, 0, 0, 1, 1,
2.046571, 1.589747, -0.4477779, 0, 0, 0, 1, 1,
2.080027, -0.2516544, 3.072129, 0, 0, 0, 1, 1,
2.098841, 0.5526883, 2.376716, 0, 0, 0, 1, 1,
2.139973, 0.1609412, 2.239442, 0, 0, 0, 1, 1,
2.152261, 1.300963, 0.3374355, 0, 0, 0, 1, 1,
2.169616, -0.1697355, 2.150236, 0, 0, 0, 1, 1,
2.252728, 1.474413, 1.883818, 0, 0, 0, 1, 1,
2.256208, -1.029429, 0.5963831, 1, 1, 1, 1, 1,
2.259381, 0.6472059, 1.105926, 1, 1, 1, 1, 1,
2.278581, 1.54011, 0.8052459, 1, 1, 1, 1, 1,
2.34861, -0.1566482, 1.721861, 1, 1, 1, 1, 1,
2.356915, -0.1537729, 1.733074, 1, 1, 1, 1, 1,
2.596588, -0.5411273, 0.5082774, 1, 1, 1, 1, 1,
2.919601, -1.455086, 1.857648, 1, 1, 1, 1, 1
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
var radius = 9.526355;
var distance = 33.46092;
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
mvMatrix.translate( 0.01108301, 0.6433783, -0.008598804 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46092);
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
