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
-3.231945, -1.444384, -1.454392, 1, 0, 0, 1,
-3.002448, -1.490185, -0.4323187, 1, 0.007843138, 0, 1,
-2.949475, -0.09332074, -2.418932, 1, 0.01176471, 0, 1,
-2.823262, -1.490941, -0.9931664, 1, 0.01960784, 0, 1,
-2.729794, -0.8872092, -0.047151, 1, 0.02352941, 0, 1,
-2.590663, -0.2613871, -2.110286, 1, 0.03137255, 0, 1,
-2.546296, 0.2642544, -2.871871, 1, 0.03529412, 0, 1,
-2.51782, -0.2602206, 0.05117102, 1, 0.04313726, 0, 1,
-2.499534, 0.2236919, 0.45882, 1, 0.04705882, 0, 1,
-2.495748, 0.4457655, -1.408902, 1, 0.05490196, 0, 1,
-2.433084, 0.153213, -1.572189, 1, 0.05882353, 0, 1,
-2.405167, -0.4370252, 0.01402094, 1, 0.06666667, 0, 1,
-2.38409, 0.7332664, -0.8145936, 1, 0.07058824, 0, 1,
-2.377676, 0.1729013, -1.664028, 1, 0.07843138, 0, 1,
-2.339562, 0.3983479, -1.763563, 1, 0.08235294, 0, 1,
-2.307669, -0.205662, -1.227321, 1, 0.09019608, 0, 1,
-2.28875, -0.6088877, -1.875908, 1, 0.09411765, 0, 1,
-2.283269, 1.771017, -1.067926, 1, 0.1019608, 0, 1,
-2.265466, -0.1561528, -0.9053848, 1, 0.1098039, 0, 1,
-2.248917, 1.117481, -0.7939931, 1, 0.1137255, 0, 1,
-2.201089, 0.9488282, -0.8523882, 1, 0.1215686, 0, 1,
-2.174621, 1.228086, -1.791188, 1, 0.1254902, 0, 1,
-2.167948, -1.674345, -3.29965, 1, 0.1333333, 0, 1,
-2.128157, 1.22471, -2.036488, 1, 0.1372549, 0, 1,
-2.120621, 1.685893, -1.629467, 1, 0.145098, 0, 1,
-2.120586, 0.300382, -1.1903, 1, 0.1490196, 0, 1,
-2.087467, -0.3632689, -2.771107, 1, 0.1568628, 0, 1,
-2.054238, 1.124291, -1.093402, 1, 0.1607843, 0, 1,
-2.048463, 0.5391043, -2.371046, 1, 0.1686275, 0, 1,
-2.031537, -0.7699202, -0.5028567, 1, 0.172549, 0, 1,
-2.006882, 0.6810434, -0.7602994, 1, 0.1803922, 0, 1,
-2.001597, -1.157346, -2.12027, 1, 0.1843137, 0, 1,
-1.974293, -1.097356, -0.9649003, 1, 0.1921569, 0, 1,
-1.940514, -0.8759701, -0.3254612, 1, 0.1960784, 0, 1,
-1.931086, 0.5821519, -1.175948, 1, 0.2039216, 0, 1,
-1.914973, -0.4058018, -3.310663, 1, 0.2117647, 0, 1,
-1.888755, 0.46816, -0.7438127, 1, 0.2156863, 0, 1,
-1.879707, 0.1974524, -1.804168, 1, 0.2235294, 0, 1,
-1.878302, -0.3771767, -2.646006, 1, 0.227451, 0, 1,
-1.859395, 0.3908314, -1.696485, 1, 0.2352941, 0, 1,
-1.85771, 0.1063638, -0.7083337, 1, 0.2392157, 0, 1,
-1.849464, 0.8520142, -0.07078892, 1, 0.2470588, 0, 1,
-1.847781, -0.9688707, -1.528377, 1, 0.2509804, 0, 1,
-1.807879, 2.032229, -1.268334, 1, 0.2588235, 0, 1,
-1.80082, 1.41167, -3.813153, 1, 0.2627451, 0, 1,
-1.794442, -1.60683, -2.251074, 1, 0.2705882, 0, 1,
-1.764732, -0.4527558, -1.991403, 1, 0.2745098, 0, 1,
-1.764506, 0.3216517, -1.655311, 1, 0.282353, 0, 1,
-1.747523, 0.6935716, -0.6429639, 1, 0.2862745, 0, 1,
-1.733909, -3.414023, -6.040494, 1, 0.2941177, 0, 1,
-1.723024, -0.2247747, -0.458783, 1, 0.3019608, 0, 1,
-1.706038, 0.3268239, -2.167419, 1, 0.3058824, 0, 1,
-1.706033, 0.8764489, 0.4974185, 1, 0.3137255, 0, 1,
-1.692598, -0.3963805, -2.168553, 1, 0.3176471, 0, 1,
-1.689595, 2.352836, -0.1633701, 1, 0.3254902, 0, 1,
-1.675024, -0.571005, -1.164517, 1, 0.3294118, 0, 1,
-1.655189, -0.8129147, -2.770448, 1, 0.3372549, 0, 1,
-1.651756, -0.9203296, -1.350105, 1, 0.3411765, 0, 1,
-1.648069, 2.228769, -0.980827, 1, 0.3490196, 0, 1,
-1.641833, 0.3918076, -0.3663757, 1, 0.3529412, 0, 1,
-1.631001, 0.04459112, -2.023566, 1, 0.3607843, 0, 1,
-1.628669, -0.9230559, -1.967427, 1, 0.3647059, 0, 1,
-1.62269, -0.5548108, -2.720938, 1, 0.372549, 0, 1,
-1.612788, -0.1188312, -1.268161, 1, 0.3764706, 0, 1,
-1.609169, 1.159263, -1.118627, 1, 0.3843137, 0, 1,
-1.601478, -0.4679824, -2.698354, 1, 0.3882353, 0, 1,
-1.579837, -0.3940286, -1.27717, 1, 0.3960784, 0, 1,
-1.575146, -1.180357, -3.028708, 1, 0.4039216, 0, 1,
-1.575111, 0.4455715, -1.039813, 1, 0.4078431, 0, 1,
-1.554772, 1.00738, 1.18013, 1, 0.4156863, 0, 1,
-1.551632, 0.08896838, -0.640236, 1, 0.4196078, 0, 1,
-1.551576, -1.276409, -1.206773, 1, 0.427451, 0, 1,
-1.546077, -1.35966, -1.964885, 1, 0.4313726, 0, 1,
-1.545549, 0.474446, -0.6279054, 1, 0.4392157, 0, 1,
-1.535091, 0.198269, -1.685565, 1, 0.4431373, 0, 1,
-1.526374, 0.1770623, -3.119711, 1, 0.4509804, 0, 1,
-1.52344, 1.595879, -0.3776153, 1, 0.454902, 0, 1,
-1.510329, -1.730004, -3.400907, 1, 0.4627451, 0, 1,
-1.508794, 0.3151495, -0.9498622, 1, 0.4666667, 0, 1,
-1.503781, 0.5236269, -1.317246, 1, 0.4745098, 0, 1,
-1.503445, -0.0830556, -0.1530512, 1, 0.4784314, 0, 1,
-1.503119, 1.247677, -1.147372, 1, 0.4862745, 0, 1,
-1.49501, 0.1596025, -1.188556, 1, 0.4901961, 0, 1,
-1.492769, -0.7596143, -1.870147, 1, 0.4980392, 0, 1,
-1.488917, 0.7015647, -1.003536, 1, 0.5058824, 0, 1,
-1.478223, -0.450799, 0.4836024, 1, 0.509804, 0, 1,
-1.466005, 0.008262135, -1.786109, 1, 0.5176471, 0, 1,
-1.464074, -0.5819021, -0.7780189, 1, 0.5215687, 0, 1,
-1.463532, -0.7970444, -2.306025, 1, 0.5294118, 0, 1,
-1.458922, -1.388013, -0.9015263, 1, 0.5333334, 0, 1,
-1.446094, 0.5796227, -2.117409, 1, 0.5411765, 0, 1,
-1.445332, -1.000797, -4.823737, 1, 0.5450981, 0, 1,
-1.440345, -0.9457874, -1.949277, 1, 0.5529412, 0, 1,
-1.43835, -0.4133556, -3.273148, 1, 0.5568628, 0, 1,
-1.418658, -0.8268937, -0.9829412, 1, 0.5647059, 0, 1,
-1.416869, 0.4991589, -0.6392581, 1, 0.5686275, 0, 1,
-1.413402, -0.208478, -2.507703, 1, 0.5764706, 0, 1,
-1.408699, 0.6575522, -1.65792, 1, 0.5803922, 0, 1,
-1.393765, -1.09991, -1.998876, 1, 0.5882353, 0, 1,
-1.38207, -0.5663266, -3.033351, 1, 0.5921569, 0, 1,
-1.374373, -0.865024, -1.626264, 1, 0.6, 0, 1,
-1.366765, 2.433558, -0.1249756, 1, 0.6078432, 0, 1,
-1.365854, -0.5273213, -1.861202, 1, 0.6117647, 0, 1,
-1.359893, 0.6359912, -4.737651, 1, 0.6196079, 0, 1,
-1.353957, 0.4244629, -2.077507, 1, 0.6235294, 0, 1,
-1.346761, -0.6079684, -2.608495, 1, 0.6313726, 0, 1,
-1.341606, 0.7014061, -1.00761, 1, 0.6352941, 0, 1,
-1.337696, -0.07291873, -2.176172, 1, 0.6431373, 0, 1,
-1.330434, 0.8253169, 0.3582882, 1, 0.6470588, 0, 1,
-1.32938, 0.2246472, 0.6266657, 1, 0.654902, 0, 1,
-1.328558, -0.4433534, -2.623521, 1, 0.6588235, 0, 1,
-1.325233, 0.0715532, -2.019023, 1, 0.6666667, 0, 1,
-1.321887, -0.5560545, -1.887742, 1, 0.6705883, 0, 1,
-1.318002, -0.4388781, -2.363964, 1, 0.6784314, 0, 1,
-1.310382, -2.102876, -1.107038, 1, 0.682353, 0, 1,
-1.308837, 0.8077843, -2.67502, 1, 0.6901961, 0, 1,
-1.30671, -0.8838329, -2.904016, 1, 0.6941177, 0, 1,
-1.305401, -0.1630597, -1.677273, 1, 0.7019608, 0, 1,
-1.303128, -0.06963768, -1.503458, 1, 0.7098039, 0, 1,
-1.290241, -0.938009, -1.009762, 1, 0.7137255, 0, 1,
-1.275646, 1.455474, 0.8382849, 1, 0.7215686, 0, 1,
-1.273704, -0.8271164, -0.568163, 1, 0.7254902, 0, 1,
-1.271576, 0.9759511, 1.657031, 1, 0.7333333, 0, 1,
-1.271395, 1.615519, 0.2137159, 1, 0.7372549, 0, 1,
-1.270752, -0.328705, -1.248352, 1, 0.7450981, 0, 1,
-1.263381, -0.04825527, -3.405807, 1, 0.7490196, 0, 1,
-1.25928, -0.6861447, -0.9658943, 1, 0.7568628, 0, 1,
-1.255578, 0.3604999, -2.244258, 1, 0.7607843, 0, 1,
-1.253319, 0.2327978, -2.935455, 1, 0.7686275, 0, 1,
-1.252739, -0.9526711, -1.580721, 1, 0.772549, 0, 1,
-1.252443, 0.05694798, -3.433304, 1, 0.7803922, 0, 1,
-1.247122, -1.120462, -2.120256, 1, 0.7843137, 0, 1,
-1.241502, -1.113336, -1.776657, 1, 0.7921569, 0, 1,
-1.226724, 0.584194, -1.836663, 1, 0.7960784, 0, 1,
-1.21723, 0.9747775, -0.966597, 1, 0.8039216, 0, 1,
-1.213856, -1.393109, -1.892616, 1, 0.8117647, 0, 1,
-1.213163, -1.513677, -2.107241, 1, 0.8156863, 0, 1,
-1.212062, -1.846678, -3.486699, 1, 0.8235294, 0, 1,
-1.201669, 1.65622, -1.198022, 1, 0.827451, 0, 1,
-1.194346, 0.6260829, -1.42654, 1, 0.8352941, 0, 1,
-1.185088, 0.07638887, -2.141021, 1, 0.8392157, 0, 1,
-1.169925, 1.095273, -1.522214, 1, 0.8470588, 0, 1,
-1.162618, -0.3400292, -2.056044, 1, 0.8509804, 0, 1,
-1.160982, -0.4474429, -1.985516, 1, 0.8588235, 0, 1,
-1.159541, 2.305574, 0.09067973, 1, 0.8627451, 0, 1,
-1.158172, -0.9673443, -4.772833, 1, 0.8705882, 0, 1,
-1.156406, 0.2310146, -3.76807, 1, 0.8745098, 0, 1,
-1.152858, 0.7925654, -0.7903882, 1, 0.8823529, 0, 1,
-1.151487, -0.977942, -1.550399, 1, 0.8862745, 0, 1,
-1.142129, -1.979889, -1.594385, 1, 0.8941177, 0, 1,
-1.136492, -1.502552, -2.005494, 1, 0.8980392, 0, 1,
-1.135931, -0.2413082, -1.662127, 1, 0.9058824, 0, 1,
-1.135109, 1.070556, 0.1418829, 1, 0.9137255, 0, 1,
-1.128125, -0.2951242, -1.090951, 1, 0.9176471, 0, 1,
-1.120073, -0.2704743, -3.087821, 1, 0.9254902, 0, 1,
-1.113019, -0.318307, -3.204038, 1, 0.9294118, 0, 1,
-1.109034, -1.139423, -1.714988, 1, 0.9372549, 0, 1,
-1.103613, 0.157843, -2.549536, 1, 0.9411765, 0, 1,
-1.09766, 0.3640472, -2.323894, 1, 0.9490196, 0, 1,
-1.092764, -1.864066, -4.351115, 1, 0.9529412, 0, 1,
-1.086303, -0.5854158, -3.283157, 1, 0.9607843, 0, 1,
-1.084995, 1.226455, -1.593043, 1, 0.9647059, 0, 1,
-1.080746, 0.9411952, -1.141063, 1, 0.972549, 0, 1,
-1.078192, 0.1386859, -2.107739, 1, 0.9764706, 0, 1,
-1.077685, -0.4224109, -1.33496, 1, 0.9843137, 0, 1,
-1.075911, -1.001815, -3.120301, 1, 0.9882353, 0, 1,
-1.072374, 0.3185332, 0.3531808, 1, 0.9960784, 0, 1,
-1.067324, 0.7366301, -0.9548019, 0.9960784, 1, 0, 1,
-1.066143, -0.06886683, -1.119243, 0.9921569, 1, 0, 1,
-1.064666, 0.1151787, -1.896978, 0.9843137, 1, 0, 1,
-1.054352, 1.260904, -0.9934284, 0.9803922, 1, 0, 1,
-1.052915, -0.2332121, -3.80497, 0.972549, 1, 0, 1,
-1.047294, -0.09896134, -0.8103593, 0.9686275, 1, 0, 1,
-1.04147, -0.8931071, -4.302654, 0.9607843, 1, 0, 1,
-1.037585, 1.060251, 0.1507518, 0.9568627, 1, 0, 1,
-1.034171, 1.325125, -2.600559, 0.9490196, 1, 0, 1,
-1.033845, 0.07499421, -0.638421, 0.945098, 1, 0, 1,
-1.025808, -0.07318198, -1.948274, 0.9372549, 1, 0, 1,
-1.022959, -0.2612995, -1.729543, 0.9333333, 1, 0, 1,
-1.014696, -0.7985181, -2.295053, 0.9254902, 1, 0, 1,
-1.014118, 1.723109, 3.211248, 0.9215686, 1, 0, 1,
-1.010641, 0.09534502, -2.345556, 0.9137255, 1, 0, 1,
-1.008021, -0.7468398, -2.763233, 0.9098039, 1, 0, 1,
-1.004946, 0.8484961, 0.5294732, 0.9019608, 1, 0, 1,
-1.003489, 0.1571202, -0.8014911, 0.8941177, 1, 0, 1,
-1.001097, 0.5484015, -1.569275, 0.8901961, 1, 0, 1,
-0.9952053, -0.1261812, -1.703819, 0.8823529, 1, 0, 1,
-0.9830412, -1.261535, -1.694244, 0.8784314, 1, 0, 1,
-0.9744972, -0.1815165, -3.189691, 0.8705882, 1, 0, 1,
-0.9742419, -0.334283, -2.068578, 0.8666667, 1, 0, 1,
-0.9690218, -1.025564, -1.301759, 0.8588235, 1, 0, 1,
-0.9664607, -0.5190358, -2.435725, 0.854902, 1, 0, 1,
-0.957177, -0.5872472, -2.509252, 0.8470588, 1, 0, 1,
-0.9565111, 0.5274348, -0.06460913, 0.8431373, 1, 0, 1,
-0.954777, 0.7646356, -1.505457, 0.8352941, 1, 0, 1,
-0.9312292, -0.9337701, -2.310134, 0.8313726, 1, 0, 1,
-0.9263238, -0.2891007, -2.628813, 0.8235294, 1, 0, 1,
-0.9215564, 0.6863656, -0.8051128, 0.8196079, 1, 0, 1,
-0.9211393, 0.911339, -1.228342, 0.8117647, 1, 0, 1,
-0.9113765, -1.238646, -2.28286, 0.8078431, 1, 0, 1,
-0.9095054, -1.25994, -2.28722, 0.8, 1, 0, 1,
-0.9093392, 1.374319, 1.933206, 0.7921569, 1, 0, 1,
-0.9077007, 2.028015, -1.632084, 0.7882353, 1, 0, 1,
-0.8949443, 1.479496, -1.498062, 0.7803922, 1, 0, 1,
-0.8928418, 1.930117, -0.2181225, 0.7764706, 1, 0, 1,
-0.8905549, 0.5368599, -0.3367411, 0.7686275, 1, 0, 1,
-0.8900442, -0.5096665, -2.497266, 0.7647059, 1, 0, 1,
-0.8895151, -0.2062245, -1.431168, 0.7568628, 1, 0, 1,
-0.8851261, -0.1102099, -2.796238, 0.7529412, 1, 0, 1,
-0.8814172, 0.04923927, -2.535965, 0.7450981, 1, 0, 1,
-0.8764404, -0.4952582, -2.269248, 0.7411765, 1, 0, 1,
-0.8762792, 0.670186, -2.080873, 0.7333333, 1, 0, 1,
-0.8700043, -0.3892418, -1.676392, 0.7294118, 1, 0, 1,
-0.8608722, 0.5328599, -0.2509203, 0.7215686, 1, 0, 1,
-0.8604263, -0.2763874, -1.220244, 0.7176471, 1, 0, 1,
-0.8584183, 1.330468, -0.3086323, 0.7098039, 1, 0, 1,
-0.8574274, -0.1611871, -1.70524, 0.7058824, 1, 0, 1,
-0.8518937, -0.1834969, -2.305668, 0.6980392, 1, 0, 1,
-0.8500124, 0.243791, -0.2116103, 0.6901961, 1, 0, 1,
-0.8399858, 0.8050231, 1.600163, 0.6862745, 1, 0, 1,
-0.8369589, -0.400995, -2.164118, 0.6784314, 1, 0, 1,
-0.8337848, -0.1703656, -1.870566, 0.6745098, 1, 0, 1,
-0.8280211, 0.447909, -1.157669, 0.6666667, 1, 0, 1,
-0.8274919, -0.9474948, -1.322789, 0.6627451, 1, 0, 1,
-0.8182531, 0.7789584, -0.5543441, 0.654902, 1, 0, 1,
-0.8104472, 2.127531, 0.7461914, 0.6509804, 1, 0, 1,
-0.8052379, -2.132553, -4.134898, 0.6431373, 1, 0, 1,
-0.8043872, 1.702482, -0.4761654, 0.6392157, 1, 0, 1,
-0.7993411, -1.20655, -1.136494, 0.6313726, 1, 0, 1,
-0.7987494, 0.07439031, -0.6820189, 0.627451, 1, 0, 1,
-0.7985569, -1.078651, -2.763315, 0.6196079, 1, 0, 1,
-0.795319, -0.4773878, -1.522252, 0.6156863, 1, 0, 1,
-0.7877118, -0.9356483, -2.068013, 0.6078432, 1, 0, 1,
-0.7860413, 1.136121, 0.5022619, 0.6039216, 1, 0, 1,
-0.7804365, 0.01082831, -0.2157352, 0.5960785, 1, 0, 1,
-0.7787683, 1.738066, 0.2905012, 0.5882353, 1, 0, 1,
-0.7771564, 0.1174723, -1.335809, 0.5843138, 1, 0, 1,
-0.7757074, -1.23501, -3.17477, 0.5764706, 1, 0, 1,
-0.7725042, 0.7899352, -1.638052, 0.572549, 1, 0, 1,
-0.7712644, -0.1714486, -0.9374532, 0.5647059, 1, 0, 1,
-0.7709753, -1.994571, -3.867396, 0.5607843, 1, 0, 1,
-0.7687121, -2.949902, -0.8283139, 0.5529412, 1, 0, 1,
-0.7510076, -0.1867758, -1.052094, 0.5490196, 1, 0, 1,
-0.7475196, -0.6074961, -3.0719, 0.5411765, 1, 0, 1,
-0.7427259, 0.264105, 0.0917353, 0.5372549, 1, 0, 1,
-0.7420147, -1.394221, -2.562445, 0.5294118, 1, 0, 1,
-0.7405871, -0.1464341, -2.082387, 0.5254902, 1, 0, 1,
-0.7355905, 0.3091582, 0.6268898, 0.5176471, 1, 0, 1,
-0.7233976, -1.265859, -3.748114, 0.5137255, 1, 0, 1,
-0.7230374, -0.7969505, -1.252795, 0.5058824, 1, 0, 1,
-0.7186019, -0.2831668, -0.6972398, 0.5019608, 1, 0, 1,
-0.7177403, -0.5559177, -1.207358, 0.4941176, 1, 0, 1,
-0.7112623, -1.988035, -1.971016, 0.4862745, 1, 0, 1,
-0.7099738, 0.2452929, -0.1657787, 0.4823529, 1, 0, 1,
-0.7068847, 1.816396, 1.322897, 0.4745098, 1, 0, 1,
-0.7058215, 0.4524161, -1.045487, 0.4705882, 1, 0, 1,
-0.7008619, -0.7758752, -3.263895, 0.4627451, 1, 0, 1,
-0.6972833, 0.7601791, -1.020791, 0.4588235, 1, 0, 1,
-0.6953576, -1.485745, -1.328765, 0.4509804, 1, 0, 1,
-0.6803171, -0.7653197, -2.414768, 0.4470588, 1, 0, 1,
-0.6781431, 2.429324, -1.180546, 0.4392157, 1, 0, 1,
-0.6758518, -1.381303, -2.024739, 0.4352941, 1, 0, 1,
-0.6755114, -0.730635, -3.47142, 0.427451, 1, 0, 1,
-0.6750917, 0.1912417, -2.397434, 0.4235294, 1, 0, 1,
-0.6727732, 1.450902, -0.2682501, 0.4156863, 1, 0, 1,
-0.672727, -0.1550551, -0.7506874, 0.4117647, 1, 0, 1,
-0.662852, -0.8465206, -3.581327, 0.4039216, 1, 0, 1,
-0.6611897, 0.690873, -0.2890442, 0.3960784, 1, 0, 1,
-0.661022, 0.3840313, -2.715781, 0.3921569, 1, 0, 1,
-0.6562495, -0.5055784, -3.749571, 0.3843137, 1, 0, 1,
-0.6541089, -0.3176492, -3.426275, 0.3803922, 1, 0, 1,
-0.6474799, -1.96888, -1.625038, 0.372549, 1, 0, 1,
-0.6434633, -1.796037, -1.488729, 0.3686275, 1, 0, 1,
-0.6374526, 0.02378714, -2.662219, 0.3607843, 1, 0, 1,
-0.6360402, -0.01463066, -2.450517, 0.3568628, 1, 0, 1,
-0.6324262, -0.374296, -0.5278913, 0.3490196, 1, 0, 1,
-0.6266008, -0.1228593, -0.4055493, 0.345098, 1, 0, 1,
-0.6217418, 1.624718, 0.7215157, 0.3372549, 1, 0, 1,
-0.6035099, 0.7629479, -1.325821, 0.3333333, 1, 0, 1,
-0.599828, -1.350441, -0.6397325, 0.3254902, 1, 0, 1,
-0.5948974, -1.25475, -1.862992, 0.3215686, 1, 0, 1,
-0.5940397, -0.2566443, -1.471387, 0.3137255, 1, 0, 1,
-0.5917412, 0.02028867, -3.119197, 0.3098039, 1, 0, 1,
-0.5905567, -0.7846506, -2.668869, 0.3019608, 1, 0, 1,
-0.5885772, 0.6540591, -0.8783149, 0.2941177, 1, 0, 1,
-0.5860017, 0.2570965, -0.2934015, 0.2901961, 1, 0, 1,
-0.5797239, 1.555002, -0.4542087, 0.282353, 1, 0, 1,
-0.5793002, 0.9627305, -0.3704137, 0.2784314, 1, 0, 1,
-0.5774246, -0.5674471, -2.229901, 0.2705882, 1, 0, 1,
-0.5765761, -0.8495725, -1.970093, 0.2666667, 1, 0, 1,
-0.5746359, 0.2908072, -1.414136, 0.2588235, 1, 0, 1,
-0.5721186, 1.422562, -0.23336, 0.254902, 1, 0, 1,
-0.5720393, -0.6394781, -2.351303, 0.2470588, 1, 0, 1,
-0.5640354, 1.262677, -1.5242, 0.2431373, 1, 0, 1,
-0.5623011, 0.4387902, -0.08620928, 0.2352941, 1, 0, 1,
-0.5586714, 0.03844107, -1.190767, 0.2313726, 1, 0, 1,
-0.5574597, -1.40788, -3.368037, 0.2235294, 1, 0, 1,
-0.5566499, -0.2714033, -3.018637, 0.2196078, 1, 0, 1,
-0.5503128, -1.046671, -2.15559, 0.2117647, 1, 0, 1,
-0.5499752, -1.742208, -1.883386, 0.2078431, 1, 0, 1,
-0.5437252, -1.32906, -2.529285, 0.2, 1, 0, 1,
-0.540767, 0.3353961, -0.6939421, 0.1921569, 1, 0, 1,
-0.5376432, -1.724138, -2.524673, 0.1882353, 1, 0, 1,
-0.5261375, 1.903693, -3.655859, 0.1803922, 1, 0, 1,
-0.5251634, 1.167082, -1.036455, 0.1764706, 1, 0, 1,
-0.5246727, -0.6571343, -1.911009, 0.1686275, 1, 0, 1,
-0.5246621, 0.4520057, -4.286745, 0.1647059, 1, 0, 1,
-0.5150807, -0.8017283, -3.138324, 0.1568628, 1, 0, 1,
-0.5120075, 0.7639905, 0.852807, 0.1529412, 1, 0, 1,
-0.5059735, 1.116296, 0.8688682, 0.145098, 1, 0, 1,
-0.5047878, -0.3431063, -1.573434, 0.1411765, 1, 0, 1,
-0.5032931, 0.9992713, -1.571362, 0.1333333, 1, 0, 1,
-0.5025642, -0.1985733, -2.797826, 0.1294118, 1, 0, 1,
-0.4982973, -0.7502783, -2.930698, 0.1215686, 1, 0, 1,
-0.49826, -0.8295367, -3.411908, 0.1176471, 1, 0, 1,
-0.496767, 0.7663593, -2.139338, 0.1098039, 1, 0, 1,
-0.4954788, 1.005399, -1.623723, 0.1058824, 1, 0, 1,
-0.4931525, -1.072562, -3.966502, 0.09803922, 1, 0, 1,
-0.4894682, 1.312242, -1.146554, 0.09019608, 1, 0, 1,
-0.4889682, 2.078467, -1.545378, 0.08627451, 1, 0, 1,
-0.4867533, 1.136311, 1.107565, 0.07843138, 1, 0, 1,
-0.4824207, -0.1609592, -2.558853, 0.07450981, 1, 0, 1,
-0.4807095, -1.372374, -2.991693, 0.06666667, 1, 0, 1,
-0.4797218, 0.5536498, -1.059164, 0.0627451, 1, 0, 1,
-0.4786318, -0.5914361, -2.754585, 0.05490196, 1, 0, 1,
-0.4751067, -0.2139624, -2.902595, 0.05098039, 1, 0, 1,
-0.4750364, -1.000536, -2.525343, 0.04313726, 1, 0, 1,
-0.4717284, 1.312445, -0.8215333, 0.03921569, 1, 0, 1,
-0.4683525, -0.7385361, -4.077941, 0.03137255, 1, 0, 1,
-0.4645883, -0.3936958, -2.284491, 0.02745098, 1, 0, 1,
-0.4638437, -1.425782, -3.924717, 0.01960784, 1, 0, 1,
-0.4631433, -1.245789, -3.936937, 0.01568628, 1, 0, 1,
-0.4581189, 2.001626, -1.141556, 0.007843138, 1, 0, 1,
-0.4558264, 0.5973018, -0.4709353, 0.003921569, 1, 0, 1,
-0.4547713, 1.068931, 0.7252732, 0, 1, 0.003921569, 1,
-0.45371, 0.2831276, -0.3223854, 0, 1, 0.01176471, 1,
-0.44966, 0.4230687, -2.334375, 0, 1, 0.01568628, 1,
-0.4471577, 2.333238, -0.8145778, 0, 1, 0.02352941, 1,
-0.4447137, 1.103062, -1.00202, 0, 1, 0.02745098, 1,
-0.4442506, -1.111246, -3.825468, 0, 1, 0.03529412, 1,
-0.4370845, -0.03482655, 0.2080845, 0, 1, 0.03921569, 1,
-0.4348971, 0.7396153, -1.475684, 0, 1, 0.04705882, 1,
-0.4321012, -0.6646572, -3.902871, 0, 1, 0.05098039, 1,
-0.4319223, 1.422157, 0.2770426, 0, 1, 0.05882353, 1,
-0.4318418, -1.448409, -2.891781, 0, 1, 0.0627451, 1,
-0.4280066, 1.416936, -0.6463672, 0, 1, 0.07058824, 1,
-0.4270585, -0.4505, -2.680718, 0, 1, 0.07450981, 1,
-0.425331, -1.282305, -2.223155, 0, 1, 0.08235294, 1,
-0.4235092, 0.06096077, -1.760031, 0, 1, 0.08627451, 1,
-0.4230944, -0.2615629, -0.7296463, 0, 1, 0.09411765, 1,
-0.4186797, 0.7652174, 0.3319786, 0, 1, 0.1019608, 1,
-0.4148304, 2.451273, 0.5356018, 0, 1, 0.1058824, 1,
-0.4096903, -0.3647791, -0.9974331, 0, 1, 0.1137255, 1,
-0.4050199, 1.284037, 1.31073, 0, 1, 0.1176471, 1,
-0.400947, -0.4962909, -2.130973, 0, 1, 0.1254902, 1,
-0.4006025, 1.792643, 0.7838275, 0, 1, 0.1294118, 1,
-0.3994242, -2.147339, -3.10381, 0, 1, 0.1372549, 1,
-0.3983067, 0.6602052, 0.6710184, 0, 1, 0.1411765, 1,
-0.3978604, 0.8934774, 0.6462497, 0, 1, 0.1490196, 1,
-0.3969255, -1.217545, -4.591968, 0, 1, 0.1529412, 1,
-0.3959313, -1.073866, -1.495644, 0, 1, 0.1607843, 1,
-0.3953535, 0.5173404, -0.3846667, 0, 1, 0.1647059, 1,
-0.3935061, 0.5174949, -1.933428, 0, 1, 0.172549, 1,
-0.3892451, 0.6447377, 0.8261271, 0, 1, 0.1764706, 1,
-0.3735061, 0.8496642, -1.538673, 0, 1, 0.1843137, 1,
-0.3713334, 1.121246, -0.0480147, 0, 1, 0.1882353, 1,
-0.3704904, 1.003907, 0.8190892, 0, 1, 0.1960784, 1,
-0.3677346, -1.563506, -1.985556, 0, 1, 0.2039216, 1,
-0.366934, -0.8955941, -0.9481514, 0, 1, 0.2078431, 1,
-0.362028, -0.1260554, -3.196511, 0, 1, 0.2156863, 1,
-0.3579175, -0.8881628, -2.138406, 0, 1, 0.2196078, 1,
-0.3565873, 0.7505972, -1.01856, 0, 1, 0.227451, 1,
-0.3531612, 1.447324, -0.4716581, 0, 1, 0.2313726, 1,
-0.3513995, 0.6184934, -0.03605934, 0, 1, 0.2392157, 1,
-0.3513187, -1.75, -1.618749, 0, 1, 0.2431373, 1,
-0.3478429, -0.9152984, -3.30843, 0, 1, 0.2509804, 1,
-0.3444182, 0.4805817, -0.4619903, 0, 1, 0.254902, 1,
-0.3422158, 0.9358546, -1.176451, 0, 1, 0.2627451, 1,
-0.3402741, -0.175608, -2.019754, 0, 1, 0.2666667, 1,
-0.3379417, 1.095872, -2.032255, 0, 1, 0.2745098, 1,
-0.3378588, 0.02692468, -2.877187, 0, 1, 0.2784314, 1,
-0.3376506, 0.7052387, -1.581805, 0, 1, 0.2862745, 1,
-0.3337213, 0.4232125, -1.368954, 0, 1, 0.2901961, 1,
-0.3291057, -1.277819, -3.42379, 0, 1, 0.2980392, 1,
-0.3287921, 1.918807, -1.499076, 0, 1, 0.3058824, 1,
-0.3235429, -0.3790631, -2.535016, 0, 1, 0.3098039, 1,
-0.3182143, -1.196051, -3.68569, 0, 1, 0.3176471, 1,
-0.3165886, 0.07748909, -1.136839, 0, 1, 0.3215686, 1,
-0.3164575, 0.9024231, 0.956032, 0, 1, 0.3294118, 1,
-0.3111971, -0.1008165, -0.1040151, 0, 1, 0.3333333, 1,
-0.3073924, -0.3115591, -2.30124, 0, 1, 0.3411765, 1,
-0.3003281, 1.344225, 1.701414, 0, 1, 0.345098, 1,
-0.2962397, -1.554437, -2.364021, 0, 1, 0.3529412, 1,
-0.289295, 0.08853797, 0.0440008, 0, 1, 0.3568628, 1,
-0.2890131, 0.4115842, 0.4482648, 0, 1, 0.3647059, 1,
-0.2853207, -1.015905, -1.88501, 0, 1, 0.3686275, 1,
-0.2793362, -0.4824266, -3.820482, 0, 1, 0.3764706, 1,
-0.2768284, 0.6602787, 0.7123152, 0, 1, 0.3803922, 1,
-0.2756207, -1.805985, -3.330263, 0, 1, 0.3882353, 1,
-0.2660258, 1.607481, 0.9884413, 0, 1, 0.3921569, 1,
-0.2623359, 1.063192, 0.1680573, 0, 1, 0.4, 1,
-0.2605937, 1.194256, -1.441174, 0, 1, 0.4078431, 1,
-0.2551632, -1.02856, -2.115843, 0, 1, 0.4117647, 1,
-0.2549196, -1.329359, -4.230171, 0, 1, 0.4196078, 1,
-0.2533862, -0.87542, -2.794708, 0, 1, 0.4235294, 1,
-0.2510007, 1.229344, -0.5789956, 0, 1, 0.4313726, 1,
-0.2507025, 0.01063395, -1.357415, 0, 1, 0.4352941, 1,
-0.2469933, 0.9923709, 0.8894901, 0, 1, 0.4431373, 1,
-0.2420573, -1.396074, -3.102045, 0, 1, 0.4470588, 1,
-0.2396272, -2.347178, -3.918545, 0, 1, 0.454902, 1,
-0.2377763, -0.4622042, -3.370217, 0, 1, 0.4588235, 1,
-0.2372603, 0.5697422, 0.443772, 0, 1, 0.4666667, 1,
-0.2356034, -0.6263895, -2.430707, 0, 1, 0.4705882, 1,
-0.2337376, 1.597643, -0.2748538, 0, 1, 0.4784314, 1,
-0.2279491, -1.081787, -2.85816, 0, 1, 0.4823529, 1,
-0.2267027, 0.1157183, -3.45926, 0, 1, 0.4901961, 1,
-0.2266542, -0.7765019, -4.046893, 0, 1, 0.4941176, 1,
-0.2250868, 0.258341, -1.136525, 0, 1, 0.5019608, 1,
-0.2245093, 0.1649495, -0.6203768, 0, 1, 0.509804, 1,
-0.2241039, 0.6609567, 0.4897071, 0, 1, 0.5137255, 1,
-0.2240176, -1.247548, -2.27771, 0, 1, 0.5215687, 1,
-0.2233762, 0.3085116, -2.864735, 0, 1, 0.5254902, 1,
-0.2172579, -1.081501, -2.944083, 0, 1, 0.5333334, 1,
-0.217057, 1.285792, -0.1454257, 0, 1, 0.5372549, 1,
-0.2167682, -0.159271, -3.494527, 0, 1, 0.5450981, 1,
-0.2149224, 0.01714484, -0.9456422, 0, 1, 0.5490196, 1,
-0.213837, -1.265054, -4.242407, 0, 1, 0.5568628, 1,
-0.2137542, 0.03113869, -2.902327, 0, 1, 0.5607843, 1,
-0.2121934, 0.7437913, -1.668981, 0, 1, 0.5686275, 1,
-0.2121678, -0.258788, -2.031898, 0, 1, 0.572549, 1,
-0.211644, 1.446056, -0.8244121, 0, 1, 0.5803922, 1,
-0.2094291, -1.449072, -4.963183, 0, 1, 0.5843138, 1,
-0.20863, 1.24731, -1.318741, 0, 1, 0.5921569, 1,
-0.2073338, 2.231597, 1.966361, 0, 1, 0.5960785, 1,
-0.2053693, -0.6534033, -2.831164, 0, 1, 0.6039216, 1,
-0.2004748, -1.956167, -5.321271, 0, 1, 0.6117647, 1,
-0.1967818, -0.810535, -1.170262, 0, 1, 0.6156863, 1,
-0.1965914, -1.012143, -3.475366, 0, 1, 0.6235294, 1,
-0.194658, 0.05807564, -1.8381, 0, 1, 0.627451, 1,
-0.1866465, 0.2681238, -1.594758, 0, 1, 0.6352941, 1,
-0.1865589, 2.156622, 0.9531988, 0, 1, 0.6392157, 1,
-0.1855158, 0.5271426, 1.19968, 0, 1, 0.6470588, 1,
-0.1819068, 0.999993, -1.598031, 0, 1, 0.6509804, 1,
-0.18149, -1.649261, -2.866895, 0, 1, 0.6588235, 1,
-0.1786611, 1.557434, -0.7942249, 0, 1, 0.6627451, 1,
-0.1744982, 0.2094342, -1.413173, 0, 1, 0.6705883, 1,
-0.1733813, -0.6945529, -4.262753, 0, 1, 0.6745098, 1,
-0.1701359, 0.6112207, 1.954102, 0, 1, 0.682353, 1,
-0.1676283, -2.402085, -2.657177, 0, 1, 0.6862745, 1,
-0.1667266, 0.09574505, 0.1650152, 0, 1, 0.6941177, 1,
-0.165517, -0.4547065, -1.249024, 0, 1, 0.7019608, 1,
-0.1623774, 1.543473, 0.2715107, 0, 1, 0.7058824, 1,
-0.1600531, 0.7972172, 1.546255, 0, 1, 0.7137255, 1,
-0.158826, -0.9386941, -3.107673, 0, 1, 0.7176471, 1,
-0.1585748, 1.16608, -1.429877, 0, 1, 0.7254902, 1,
-0.1573552, 0.7431172, 0.7040656, 0, 1, 0.7294118, 1,
-0.1560499, -0.08097581, -0.5699166, 0, 1, 0.7372549, 1,
-0.1502001, 1.20807, -2.312039, 0, 1, 0.7411765, 1,
-0.148692, 1.566685, 1.001829, 0, 1, 0.7490196, 1,
-0.1460448, 0.8937701, -0.3252259, 0, 1, 0.7529412, 1,
-0.1436805, 0.6504232, 0.06878352, 0, 1, 0.7607843, 1,
-0.1435683, -2.61202, -3.157896, 0, 1, 0.7647059, 1,
-0.142178, -0.7366561, -2.13242, 0, 1, 0.772549, 1,
-0.1388448, 0.9798894, 0.5478016, 0, 1, 0.7764706, 1,
-0.1358127, -0.6471202, -2.735301, 0, 1, 0.7843137, 1,
-0.1341729, -1.316659, -4.488901, 0, 1, 0.7882353, 1,
-0.1308921, -0.4862967, -3.548085, 0, 1, 0.7960784, 1,
-0.1234941, -1.389241, -2.613966, 0, 1, 0.8039216, 1,
-0.1198579, -0.2695744, -1.730599, 0, 1, 0.8078431, 1,
-0.1176919, 0.9336605, -0.8915893, 0, 1, 0.8156863, 1,
-0.1166578, 0.03185695, -1.715002, 0, 1, 0.8196079, 1,
-0.1134313, 0.113286, -1.733266, 0, 1, 0.827451, 1,
-0.1126429, -1.505703, -4.508287, 0, 1, 0.8313726, 1,
-0.1089934, 0.4762681, -1.643774, 0, 1, 0.8392157, 1,
-0.1058931, -0.2698585, -2.027883, 0, 1, 0.8431373, 1,
-0.1054886, -0.5767322, -3.520192, 0, 1, 0.8509804, 1,
-0.1052134, 0.1169294, -0.7042635, 0, 1, 0.854902, 1,
-0.102484, 0.7506093, -0.1971303, 0, 1, 0.8627451, 1,
-0.1008011, -2.419719, -3.477681, 0, 1, 0.8666667, 1,
-0.1001656, -0.5227292, -4.531497, 0, 1, 0.8745098, 1,
-0.08202478, -2.92405, -2.494715, 0, 1, 0.8784314, 1,
-0.08200433, -0.08941292, -2.232416, 0, 1, 0.8862745, 1,
-0.0809304, -0.1183864, -0.8508103, 0, 1, 0.8901961, 1,
-0.08057847, 1.989436, -2.650311, 0, 1, 0.8980392, 1,
-0.07109507, -0.5339837, -2.818164, 0, 1, 0.9058824, 1,
-0.06650171, -0.8253191, -3.783399, 0, 1, 0.9098039, 1,
-0.0628608, 0.8006229, 1.190361, 0, 1, 0.9176471, 1,
-0.0619958, 0.171474, 0.9155676, 0, 1, 0.9215686, 1,
-0.06089144, 2.265267, -1.735213, 0, 1, 0.9294118, 1,
-0.05772351, 0.5826907, 0.4196637, 0, 1, 0.9333333, 1,
-0.05289127, 0.04365899, -3.247732, 0, 1, 0.9411765, 1,
-0.05227486, -0.3403394, -3.82798, 0, 1, 0.945098, 1,
-0.04850222, -0.5898281, -1.898795, 0, 1, 0.9529412, 1,
-0.0446187, -0.4833779, -3.493509, 0, 1, 0.9568627, 1,
-0.04392097, 0.771634, 0.8838183, 0, 1, 0.9647059, 1,
-0.04255345, 1.256245, 0.1936706, 0, 1, 0.9686275, 1,
-0.03943938, -0.1344167, -2.768017, 0, 1, 0.9764706, 1,
-0.03855035, -1.166264, -1.356265, 0, 1, 0.9803922, 1,
-0.03539998, 2.106285, -1.20229, 0, 1, 0.9882353, 1,
-0.03530737, -0.02534748, -1.277327, 0, 1, 0.9921569, 1,
-0.03512419, -0.01321044, -2.444306, 0, 1, 1, 1,
-0.0340002, 1.09777, -0.3030338, 0, 0.9921569, 1, 1,
-0.03309539, 0.2001121, 1.836618, 0, 0.9882353, 1, 1,
-0.03170291, -1.971798, -1.950008, 0, 0.9803922, 1, 1,
-0.03164309, 0.413285, -2.337212, 0, 0.9764706, 1, 1,
-0.02911606, 1.068062, 0.1544697, 0, 0.9686275, 1, 1,
-0.02516502, -0.514486, -2.154198, 0, 0.9647059, 1, 1,
-0.0206817, 0.8473563, -0.60037, 0, 0.9568627, 1, 1,
-0.01460311, 0.3517658, 0.2744848, 0, 0.9529412, 1, 1,
-0.007926023, -0.5085528, -2.536708, 0, 0.945098, 1, 1,
-0.007306695, 2.169859, 1.289135, 0, 0.9411765, 1, 1,
-0.006429036, 0.1439833, -0.2575817, 0, 0.9333333, 1, 1,
-0.005993171, -1.156351, -4.536589, 0, 0.9294118, 1, 1,
-0.004082674, -1.72727, -1.705194, 0, 0.9215686, 1, 1,
-0.00395509, 0.3866257, -1.134234, 0, 0.9176471, 1, 1,
-0.001916888, -0.1328737, -2.535429, 0, 0.9098039, 1, 1,
0.0003713921, -1.3322, 2.403718, 0, 0.9058824, 1, 1,
0.002390387, -0.4920125, 3.701117, 0, 0.8980392, 1, 1,
0.005184573, -1.877913, 4.500745, 0, 0.8901961, 1, 1,
0.008128365, 0.456721, 0.01737463, 0, 0.8862745, 1, 1,
0.009623478, 0.08732954, 0.7755222, 0, 0.8784314, 1, 1,
0.010307, 0.3266161, 1.073831, 0, 0.8745098, 1, 1,
0.0107609, -0.3315499, 3.596294, 0, 0.8666667, 1, 1,
0.01262843, -0.01170998, 2.605539, 0, 0.8627451, 1, 1,
0.01272831, 0.5612532, -0.4458742, 0, 0.854902, 1, 1,
0.01932331, -0.0934597, 3.011007, 0, 0.8509804, 1, 1,
0.02071103, 0.2905755, 0.2058205, 0, 0.8431373, 1, 1,
0.02603604, -0.8684813, 1.595777, 0, 0.8392157, 1, 1,
0.02678548, 0.2227567, -0.4180005, 0, 0.8313726, 1, 1,
0.02798449, 1.215656, 1.186505, 0, 0.827451, 1, 1,
0.02829914, 0.86858, 1.196227, 0, 0.8196079, 1, 1,
0.02848332, 1.034485, -0.8704596, 0, 0.8156863, 1, 1,
0.03669664, 0.631977, 0.0304079, 0, 0.8078431, 1, 1,
0.03788439, 1.530061, 0.7308368, 0, 0.8039216, 1, 1,
0.04001382, 0.7397851, 1.200664, 0, 0.7960784, 1, 1,
0.04092472, 0.2239415, -0.4739703, 0, 0.7882353, 1, 1,
0.04124837, -0.2972436, 1.770903, 0, 0.7843137, 1, 1,
0.04150078, -0.3082284, 1.279526, 0, 0.7764706, 1, 1,
0.04344441, 2.952915, 1.371289, 0, 0.772549, 1, 1,
0.04403269, -0.5467216, 1.578027, 0, 0.7647059, 1, 1,
0.04501853, 1.678352, 0.9201166, 0, 0.7607843, 1, 1,
0.04523709, -0.5430643, 4.716676, 0, 0.7529412, 1, 1,
0.04658259, -0.8205044, 2.820857, 0, 0.7490196, 1, 1,
0.04678079, -0.3151052, 2.424247, 0, 0.7411765, 1, 1,
0.04760988, -0.5144283, 2.960112, 0, 0.7372549, 1, 1,
0.04979125, -1.089916, 1.833182, 0, 0.7294118, 1, 1,
0.05017095, -0.398766, 3.000306, 0, 0.7254902, 1, 1,
0.05030612, 0.7431028, -0.7079759, 0, 0.7176471, 1, 1,
0.0535327, -1.169668, 5.505786, 0, 0.7137255, 1, 1,
0.05783922, -0.5759397, 3.76225, 0, 0.7058824, 1, 1,
0.06217331, 0.5758309, 0.7451878, 0, 0.6980392, 1, 1,
0.06483466, -0.935105, 4.246274, 0, 0.6941177, 1, 1,
0.06896649, 1.59573, 1.784951, 0, 0.6862745, 1, 1,
0.06953695, -0.3442725, 3.688352, 0, 0.682353, 1, 1,
0.07103498, 0.9204062, 0.5482636, 0, 0.6745098, 1, 1,
0.07396017, 0.5665056, 0.8766469, 0, 0.6705883, 1, 1,
0.07454664, -0.8200569, 4.601104, 0, 0.6627451, 1, 1,
0.0757821, -0.5234166, 2.611382, 0, 0.6588235, 1, 1,
0.08024449, 0.8247094, -0.7271661, 0, 0.6509804, 1, 1,
0.08143967, 0.9650309, -1.03657, 0, 0.6470588, 1, 1,
0.08427995, -1.175156, 2.056754, 0, 0.6392157, 1, 1,
0.08717085, 0.1706569, 0.5099394, 0, 0.6352941, 1, 1,
0.09194459, -0.4291788, 4.14166, 0, 0.627451, 1, 1,
0.09457798, 0.2536865, -1.300061, 0, 0.6235294, 1, 1,
0.1001006, 1.33431, 1.086587, 0, 0.6156863, 1, 1,
0.100673, -0.2151748, 3.647772, 0, 0.6117647, 1, 1,
0.1020497, 0.2400984, 0.8389742, 0, 0.6039216, 1, 1,
0.1035197, -0.4479939, 2.64261, 0, 0.5960785, 1, 1,
0.104367, 0.5033445, -0.8721765, 0, 0.5921569, 1, 1,
0.1051239, 1.336394, 1.385002, 0, 0.5843138, 1, 1,
0.1056881, -0.07241908, 3.18189, 0, 0.5803922, 1, 1,
0.1066186, 0.4290628, -0.01947934, 0, 0.572549, 1, 1,
0.1156361, 0.4761295, -1.299727, 0, 0.5686275, 1, 1,
0.1166297, -0.3346956, 3.948213, 0, 0.5607843, 1, 1,
0.1179596, 0.9246471, 0.9335257, 0, 0.5568628, 1, 1,
0.1190658, -1.457125, 3.1042, 0, 0.5490196, 1, 1,
0.1192892, -0.8322006, 1.792537, 0, 0.5450981, 1, 1,
0.1211407, -0.3582946, 2.355529, 0, 0.5372549, 1, 1,
0.1229917, 0.09017152, 0.0151296, 0, 0.5333334, 1, 1,
0.125256, -0.4507367, 3.040982, 0, 0.5254902, 1, 1,
0.1315281, -0.8351284, 3.315279, 0, 0.5215687, 1, 1,
0.1418768, 0.006231063, 1.131508, 0, 0.5137255, 1, 1,
0.1455238, 0.139313, 0.8542776, 0, 0.509804, 1, 1,
0.1455549, -0.06716482, 1.543676, 0, 0.5019608, 1, 1,
0.1457432, 0.6394044, 0.4172408, 0, 0.4941176, 1, 1,
0.1469695, -0.2869104, 2.283458, 0, 0.4901961, 1, 1,
0.1482715, -0.2519247, 2.272989, 0, 0.4823529, 1, 1,
0.155585, -0.3749658, 3.035901, 0, 0.4784314, 1, 1,
0.1569467, 2.194299, -1.630557, 0, 0.4705882, 1, 1,
0.1584954, 0.2469772, -0.02282917, 0, 0.4666667, 1, 1,
0.1593333, -0.1072279, 1.809764, 0, 0.4588235, 1, 1,
0.1605332, 1.59181, -0.3563624, 0, 0.454902, 1, 1,
0.1617886, -0.6204241, 2.581088, 0, 0.4470588, 1, 1,
0.1641618, -0.4984235, 2.599901, 0, 0.4431373, 1, 1,
0.1784406, -0.9502521, 2.291609, 0, 0.4352941, 1, 1,
0.1803733, 0.7180221, -1.212916, 0, 0.4313726, 1, 1,
0.1814254, 0.4768493, -0.3649331, 0, 0.4235294, 1, 1,
0.1846805, 0.8481053, 0.3029679, 0, 0.4196078, 1, 1,
0.187064, -0.5127107, 4.453264, 0, 0.4117647, 1, 1,
0.1874764, 0.4496131, 0.08460358, 0, 0.4078431, 1, 1,
0.1911139, -0.6614455, 3.575113, 0, 0.4, 1, 1,
0.1915206, 0.424895, -0.5397764, 0, 0.3921569, 1, 1,
0.1941932, -0.5408536, 3.203742, 0, 0.3882353, 1, 1,
0.1954307, 0.3142751, -0.05849151, 0, 0.3803922, 1, 1,
0.1964111, -2.535804, 3.204956, 0, 0.3764706, 1, 1,
0.2000705, 1.191509, 0.1709141, 0, 0.3686275, 1, 1,
0.2003005, 0.07449695, 2.155323, 0, 0.3647059, 1, 1,
0.2072975, 0.5456863, 0.3841968, 0, 0.3568628, 1, 1,
0.2082597, -1.613956, 2.575838, 0, 0.3529412, 1, 1,
0.2104753, -0.9611155, 2.081056, 0, 0.345098, 1, 1,
0.2136867, -0.8646125, 1.780797, 0, 0.3411765, 1, 1,
0.2187286, 0.8164449, 0.6388416, 0, 0.3333333, 1, 1,
0.2221671, -2.325248, 4.111109, 0, 0.3294118, 1, 1,
0.2248052, 0.3279516, -0.4695982, 0, 0.3215686, 1, 1,
0.2289907, 0.6640094, 0.03629992, 0, 0.3176471, 1, 1,
0.2327521, 2.223404, 0.412208, 0, 0.3098039, 1, 1,
0.23357, -0.3853703, 2.783294, 0, 0.3058824, 1, 1,
0.2396277, 0.6390627, 1.414979, 0, 0.2980392, 1, 1,
0.2441093, -0.4653354, 3.516946, 0, 0.2901961, 1, 1,
0.2448374, -0.9085786, 3.075708, 0, 0.2862745, 1, 1,
0.2451085, -1.408259, 4.861715, 0, 0.2784314, 1, 1,
0.2465066, 1.023351, -0.53831, 0, 0.2745098, 1, 1,
0.2527325, -0.8891307, 1.894804, 0, 0.2666667, 1, 1,
0.2589987, 0.382173, 0.8129674, 0, 0.2627451, 1, 1,
0.2607404, 0.5209922, 0.211046, 0, 0.254902, 1, 1,
0.2627677, 1.266828, 0.5860696, 0, 0.2509804, 1, 1,
0.2628394, -1.238524, 2.857907, 0, 0.2431373, 1, 1,
0.2649219, 0.9416699, 0.9971292, 0, 0.2392157, 1, 1,
0.2675285, 0.175332, 0.6231862, 0, 0.2313726, 1, 1,
0.2678311, 0.4833134, 0.1323505, 0, 0.227451, 1, 1,
0.2689982, 0.08827303, 0.5511745, 0, 0.2196078, 1, 1,
0.2690872, -0.2975869, 3.692373, 0, 0.2156863, 1, 1,
0.2698448, 1.246803, -0.4324381, 0, 0.2078431, 1, 1,
0.2796702, -0.6803841, 4.109292, 0, 0.2039216, 1, 1,
0.2822172, -0.1507553, 1.967671, 0, 0.1960784, 1, 1,
0.2824948, -0.2231774, 2.81082, 0, 0.1882353, 1, 1,
0.2828853, 2.367993, 1.653858, 0, 0.1843137, 1, 1,
0.2834518, 0.8993008, 1.405827, 0, 0.1764706, 1, 1,
0.2905586, -0.1329959, 3.201198, 0, 0.172549, 1, 1,
0.2965832, 0.9974788, -0.7403678, 0, 0.1647059, 1, 1,
0.2984151, -0.3822471, 2.674119, 0, 0.1607843, 1, 1,
0.3058181, -0.7239991, 3.925545, 0, 0.1529412, 1, 1,
0.3059033, 1.348351, -0.3481088, 0, 0.1490196, 1, 1,
0.3090687, 0.7191825, 1.069625, 0, 0.1411765, 1, 1,
0.3111967, -0.2541319, 3.113434, 0, 0.1372549, 1, 1,
0.3120802, 1.013832, -0.6510847, 0, 0.1294118, 1, 1,
0.3127469, 0.4593534, -0.5542113, 0, 0.1254902, 1, 1,
0.3163476, 0.3789662, 1.287227, 0, 0.1176471, 1, 1,
0.3186062, 0.8140076, -0.3767356, 0, 0.1137255, 1, 1,
0.3208905, -0.393532, 2.108504, 0, 0.1058824, 1, 1,
0.3230679, 0.5702942, 1.250005, 0, 0.09803922, 1, 1,
0.3237587, 0.420416, 0.6875771, 0, 0.09411765, 1, 1,
0.3238947, 0.2367578, -0.04091164, 0, 0.08627451, 1, 1,
0.3252209, 1.4107, -0.08084055, 0, 0.08235294, 1, 1,
0.3285109, -0.5180535, 2.348454, 0, 0.07450981, 1, 1,
0.3318363, -0.07575758, 1.53579, 0, 0.07058824, 1, 1,
0.3372255, -1.374206, 3.542026, 0, 0.0627451, 1, 1,
0.3423949, -2.059442, 3.766584, 0, 0.05882353, 1, 1,
0.3438094, -1.921884, 1.897751, 0, 0.05098039, 1, 1,
0.3456368, -1.00884, 3.048471, 0, 0.04705882, 1, 1,
0.348377, 2.367132, 0.4841449, 0, 0.03921569, 1, 1,
0.3547696, 0.3845383, -1.403397, 0, 0.03529412, 1, 1,
0.3558834, 0.1251236, 0.5128416, 0, 0.02745098, 1, 1,
0.3607517, 1.726565, 0.2572975, 0, 0.02352941, 1, 1,
0.3610771, -1.364115, 3.188222, 0, 0.01568628, 1, 1,
0.3624704, -0.6717974, 3.1821, 0, 0.01176471, 1, 1,
0.3677815, -1.057971, 4.85541, 0, 0.003921569, 1, 1,
0.3691439, -0.443609, 2.75599, 0.003921569, 0, 1, 1,
0.3781937, 1.136697, 1.881958, 0.007843138, 0, 1, 1,
0.3836673, -0.9603399, 3.466104, 0.01568628, 0, 1, 1,
0.3857885, 0.821225, 0.9961698, 0.01960784, 0, 1, 1,
0.3870413, -0.1827741, 1.298042, 0.02745098, 0, 1, 1,
0.3880364, 0.6848429, 1.400301, 0.03137255, 0, 1, 1,
0.3996517, -0.6363543, 2.776249, 0.03921569, 0, 1, 1,
0.4021999, 0.384578, 0.2553361, 0.04313726, 0, 1, 1,
0.4064641, 0.8621185, 2.181332, 0.05098039, 0, 1, 1,
0.4084659, 0.09618133, 2.742474, 0.05490196, 0, 1, 1,
0.4100864, -1.734339, 2.405405, 0.0627451, 0, 1, 1,
0.4108415, 0.225929, 1.867022, 0.06666667, 0, 1, 1,
0.4108992, 1.912864, -2.082292, 0.07450981, 0, 1, 1,
0.4184784, -0.5320312, 3.366165, 0.07843138, 0, 1, 1,
0.4192145, 0.5325132, 0.5256249, 0.08627451, 0, 1, 1,
0.4250673, -2.607903, 2.654998, 0.09019608, 0, 1, 1,
0.4271586, -0.878409, 3.06808, 0.09803922, 0, 1, 1,
0.428474, 0.01593615, 2.36878, 0.1058824, 0, 1, 1,
0.429424, -0.4290719, 0.2687015, 0.1098039, 0, 1, 1,
0.4324831, 0.6404668, 1.08294, 0.1176471, 0, 1, 1,
0.4326952, -0.04658965, 1.682775, 0.1215686, 0, 1, 1,
0.4497238, 0.6916211, -0.9974968, 0.1294118, 0, 1, 1,
0.4551759, 0.3086425, 0.4733366, 0.1333333, 0, 1, 1,
0.4563489, -0.2802098, 0.6430628, 0.1411765, 0, 1, 1,
0.4573154, 1.585263, 1.020713, 0.145098, 0, 1, 1,
0.4603875, 0.1645107, 2.003122, 0.1529412, 0, 1, 1,
0.4640499, 1.148289, 2.379749, 0.1568628, 0, 1, 1,
0.4704914, 0.5118203, 2.539216, 0.1647059, 0, 1, 1,
0.4733146, -1.77454, 4.263826, 0.1686275, 0, 1, 1,
0.4761195, 0.5776458, -0.2206557, 0.1764706, 0, 1, 1,
0.4800669, 0.7880505, 1.295745, 0.1803922, 0, 1, 1,
0.4829524, -0.5757486, 2.958966, 0.1882353, 0, 1, 1,
0.4862849, 0.1643853, 0.6138618, 0.1921569, 0, 1, 1,
0.4885855, -1.219948, 2.564455, 0.2, 0, 1, 1,
0.4902242, -0.9156142, 2.485018, 0.2078431, 0, 1, 1,
0.4918154, -1.272597, 4.181985, 0.2117647, 0, 1, 1,
0.4960678, -0.4527161, 0.6545756, 0.2196078, 0, 1, 1,
0.4973234, 0.975578, 0.01654296, 0.2235294, 0, 1, 1,
0.4980139, 0.06682464, -0.3485803, 0.2313726, 0, 1, 1,
0.5015009, -0.4066102, 3.235294, 0.2352941, 0, 1, 1,
0.5041933, -0.1084031, 3.197931, 0.2431373, 0, 1, 1,
0.506293, 1.91858, 1.048573, 0.2470588, 0, 1, 1,
0.5072498, 0.2786483, -0.600609, 0.254902, 0, 1, 1,
0.507786, -0.1070266, 1.081003, 0.2588235, 0, 1, 1,
0.5116911, -0.8392644, 3.206833, 0.2666667, 0, 1, 1,
0.5166984, -0.9667394, 0.681007, 0.2705882, 0, 1, 1,
0.5169396, 0.5649666, 0.09868244, 0.2784314, 0, 1, 1,
0.522728, -1.794723, 3.879683, 0.282353, 0, 1, 1,
0.5277558, 0.694061, 2.060507, 0.2901961, 0, 1, 1,
0.5326164, -0.05600215, 2.286568, 0.2941177, 0, 1, 1,
0.5350007, -0.4893914, 3.794331, 0.3019608, 0, 1, 1,
0.5405971, 0.08310764, 1.547709, 0.3098039, 0, 1, 1,
0.5406004, 0.7030376, 1.986289, 0.3137255, 0, 1, 1,
0.5452847, -2.071503, 2.716143, 0.3215686, 0, 1, 1,
0.5496931, 0.03177824, 2.969226, 0.3254902, 0, 1, 1,
0.5605924, -1.392756, 2.048794, 0.3333333, 0, 1, 1,
0.5628495, 0.947535, 0.2400019, 0.3372549, 0, 1, 1,
0.5641687, 0.2406805, 0.7473486, 0.345098, 0, 1, 1,
0.564506, -1.331369, 1.89606, 0.3490196, 0, 1, 1,
0.5645435, -0.9343275, 3.861624, 0.3568628, 0, 1, 1,
0.5680545, 0.7505667, 0.853367, 0.3607843, 0, 1, 1,
0.5699512, 0.1154083, 1.781105, 0.3686275, 0, 1, 1,
0.5706655, 1.671075, 0.3546875, 0.372549, 0, 1, 1,
0.5814015, 0.6871597, 1.543058, 0.3803922, 0, 1, 1,
0.5880045, -1.127616, 0.4644469, 0.3843137, 0, 1, 1,
0.589568, 0.9532169, -0.3672458, 0.3921569, 0, 1, 1,
0.5911993, 0.3493837, 1.303267, 0.3960784, 0, 1, 1,
0.5972021, -1.76785, 4.275067, 0.4039216, 0, 1, 1,
0.5982934, -0.1990249, 3.485299, 0.4117647, 0, 1, 1,
0.5989772, 1.187369, 0.7783386, 0.4156863, 0, 1, 1,
0.6030347, -1.651502, 2.117818, 0.4235294, 0, 1, 1,
0.6035928, -1.38834, 2.34966, 0.427451, 0, 1, 1,
0.6045275, -0.02721931, 2.370445, 0.4352941, 0, 1, 1,
0.6056199, -0.9999074, 1.997889, 0.4392157, 0, 1, 1,
0.618995, 0.8021117, 0.624836, 0.4470588, 0, 1, 1,
0.619752, 0.2100051, 2.178865, 0.4509804, 0, 1, 1,
0.6225837, 0.05234421, 0.6886961, 0.4588235, 0, 1, 1,
0.6229125, 0.4348764, 1.078516, 0.4627451, 0, 1, 1,
0.6232548, -0.01672877, 2.832002, 0.4705882, 0, 1, 1,
0.6237732, 1.73235, 0.834915, 0.4745098, 0, 1, 1,
0.624299, 1.090889, 2.763811, 0.4823529, 0, 1, 1,
0.6309192, -0.3457521, 2.054384, 0.4862745, 0, 1, 1,
0.6395776, -1.49337, 3.946881, 0.4941176, 0, 1, 1,
0.6410979, 0.5226475, 1.578891, 0.5019608, 0, 1, 1,
0.6420994, -0.4442768, 0.5398014, 0.5058824, 0, 1, 1,
0.6429945, -1.158601, 1.710579, 0.5137255, 0, 1, 1,
0.6474649, 0.002229299, 1.760745, 0.5176471, 0, 1, 1,
0.6499987, -0.9009113, 2.205633, 0.5254902, 0, 1, 1,
0.650026, -0.1024316, 2.785874, 0.5294118, 0, 1, 1,
0.6533826, -1.015857, 1.410397, 0.5372549, 0, 1, 1,
0.6547368, 1.343677, 0.1123229, 0.5411765, 0, 1, 1,
0.6574872, -0.174746, 0.02448545, 0.5490196, 0, 1, 1,
0.6607914, 0.3985634, 1.216907, 0.5529412, 0, 1, 1,
0.6684935, 0.9965301, -0.2473009, 0.5607843, 0, 1, 1,
0.671262, 0.4788757, 1.498447, 0.5647059, 0, 1, 1,
0.6756099, 1.527866, 1.582588, 0.572549, 0, 1, 1,
0.6850716, -1.583363, 3.453124, 0.5764706, 0, 1, 1,
0.6882825, 0.07937325, 1.707094, 0.5843138, 0, 1, 1,
0.6900169, -0.5636584, 1.286126, 0.5882353, 0, 1, 1,
0.6921051, 0.42333, 0.8853279, 0.5960785, 0, 1, 1,
0.7000972, -1.192908, 3.200266, 0.6039216, 0, 1, 1,
0.7038771, -0.4582296, 1.965173, 0.6078432, 0, 1, 1,
0.7056479, 1.064605, -0.3050047, 0.6156863, 0, 1, 1,
0.7127984, 1.14365, 0.3071076, 0.6196079, 0, 1, 1,
0.7128548, 1.054355, 0.2849715, 0.627451, 0, 1, 1,
0.7139561, 0.6330976, -0.8621122, 0.6313726, 0, 1, 1,
0.7140554, 1.343422, -0.1081585, 0.6392157, 0, 1, 1,
0.7176516, 0.1235089, 3.213252, 0.6431373, 0, 1, 1,
0.7278478, 0.2991166, 0.2122566, 0.6509804, 0, 1, 1,
0.7308145, -1.020215, 3.597961, 0.654902, 0, 1, 1,
0.732872, -0.3278607, 2.123783, 0.6627451, 0, 1, 1,
0.7357482, -1.384691, 2.396425, 0.6666667, 0, 1, 1,
0.7396473, 0.4488187, 0.8276372, 0.6745098, 0, 1, 1,
0.7462804, -0.7711561, 1.846813, 0.6784314, 0, 1, 1,
0.7471347, 0.6715587, 0.2664236, 0.6862745, 0, 1, 1,
0.7491691, 0.6886096, 1.005349, 0.6901961, 0, 1, 1,
0.7514512, 2.038565, 2.358624, 0.6980392, 0, 1, 1,
0.7525153, 0.3117885, 0.1702153, 0.7058824, 0, 1, 1,
0.753218, 0.07533573, 0.9357659, 0.7098039, 0, 1, 1,
0.7594349, -0.3079903, 2.198539, 0.7176471, 0, 1, 1,
0.7639555, 0.1040926, 0.5305781, 0.7215686, 0, 1, 1,
0.7644355, -1.4584, 1.771509, 0.7294118, 0, 1, 1,
0.7649229, 0.5372874, -0.6096253, 0.7333333, 0, 1, 1,
0.7652804, 0.4519803, -0.601286, 0.7411765, 0, 1, 1,
0.7686512, 0.8120303, 2.084921, 0.7450981, 0, 1, 1,
0.7691239, 0.7699537, 0.1166527, 0.7529412, 0, 1, 1,
0.7817007, 0.2990516, 2.216701, 0.7568628, 0, 1, 1,
0.7835041, -0.416517, 2.11885, 0.7647059, 0, 1, 1,
0.7863941, -0.6742684, 1.879391, 0.7686275, 0, 1, 1,
0.7881359, 0.2496315, 1.885012, 0.7764706, 0, 1, 1,
0.7906784, -1.112217, 2.190942, 0.7803922, 0, 1, 1,
0.7939911, -0.5504678, 1.805431, 0.7882353, 0, 1, 1,
0.7961866, -2.702187, 2.793985, 0.7921569, 0, 1, 1,
0.8104738, 0.5771263, -2.08731, 0.8, 0, 1, 1,
0.8112295, 0.4756685, 1.548104, 0.8078431, 0, 1, 1,
0.8165838, -0.6052107, 2.128911, 0.8117647, 0, 1, 1,
0.8194777, 0.6733059, 0.9128063, 0.8196079, 0, 1, 1,
0.821629, -0.1852874, 3.116466, 0.8235294, 0, 1, 1,
0.8237131, 1.031268, 0.04849919, 0.8313726, 0, 1, 1,
0.8257662, -0.8428738, 0.856441, 0.8352941, 0, 1, 1,
0.8278417, 0.005195076, 1.188144, 0.8431373, 0, 1, 1,
0.8307399, -0.7386768, 0.9272785, 0.8470588, 0, 1, 1,
0.8312373, -1.248732, 3.764828, 0.854902, 0, 1, 1,
0.8317107, -0.7681372, 1.701502, 0.8588235, 0, 1, 1,
0.8367654, -1.749803, 0.770496, 0.8666667, 0, 1, 1,
0.8397223, 0.696097, 1.619534, 0.8705882, 0, 1, 1,
0.8424408, -1.424837, 2.246687, 0.8784314, 0, 1, 1,
0.8534217, 1.189573, 2.573143, 0.8823529, 0, 1, 1,
0.8561903, 1.37574, 3.212008, 0.8901961, 0, 1, 1,
0.8575588, -0.6831289, 3.978221, 0.8941177, 0, 1, 1,
0.8622035, -0.1264376, 0.8118492, 0.9019608, 0, 1, 1,
0.864256, 0.9938208, -0.1952891, 0.9098039, 0, 1, 1,
0.8677094, -0.811041, 2.078837, 0.9137255, 0, 1, 1,
0.8695695, -0.7949542, 4.498616, 0.9215686, 0, 1, 1,
0.8820416, 0.358452, -0.1297022, 0.9254902, 0, 1, 1,
0.8828474, 0.4224576, 1.47561, 0.9333333, 0, 1, 1,
0.8891565, -0.331497, 3.051164, 0.9372549, 0, 1, 1,
0.8909805, 0.0232865, 1.906367, 0.945098, 0, 1, 1,
0.8927382, 0.2307063, 1.445522, 0.9490196, 0, 1, 1,
0.8939362, -1.483357, 3.044685, 0.9568627, 0, 1, 1,
0.8960177, -0.4999733, 1.815403, 0.9607843, 0, 1, 1,
0.8963148, -1.264304, 2.967782, 0.9686275, 0, 1, 1,
0.9109274, -0.2773756, 2.141744, 0.972549, 0, 1, 1,
0.918736, -1.002895, 0.8025099, 0.9803922, 0, 1, 1,
0.923945, -0.9503796, 2.239898, 0.9843137, 0, 1, 1,
0.9243106, 0.3480361, 0.8241447, 0.9921569, 0, 1, 1,
0.9245021, -0.4936211, 1.005736, 0.9960784, 0, 1, 1,
0.9279151, 1.516667, -0.4473766, 1, 0, 0.9960784, 1,
0.9332498, -1.865166, 4.592627, 1, 0, 0.9882353, 1,
0.9336221, 0.3994058, 2.065687, 1, 0, 0.9843137, 1,
0.9511797, -0.6823831, 1.531255, 1, 0, 0.9764706, 1,
0.9534554, -0.4079705, 1.08328, 1, 0, 0.972549, 1,
0.9535173, -1.661187, 0.5200127, 1, 0, 0.9647059, 1,
0.9579165, 1.828096, 0.2988646, 1, 0, 0.9607843, 1,
0.9593547, -0.3504626, 2.39235, 1, 0, 0.9529412, 1,
0.9607398, 0.8712722, 0.4169084, 1, 0, 0.9490196, 1,
0.9634233, 1.52132, 0.04907853, 1, 0, 0.9411765, 1,
0.9653677, -0.7191906, 1.970338, 1, 0, 0.9372549, 1,
0.9687182, -0.2043379, 2.147686, 1, 0, 0.9294118, 1,
0.9707459, 0.1263023, 1.221204, 1, 0, 0.9254902, 1,
0.9750294, -0.3504791, 3.77789, 1, 0, 0.9176471, 1,
0.9781635, -0.3361749, 0.1410246, 1, 0, 0.9137255, 1,
0.9789926, 1.374487, 1.357372, 1, 0, 0.9058824, 1,
0.9791523, -0.3358903, 1.874514, 1, 0, 0.9019608, 1,
0.9839783, 1.614539, -0.1002531, 1, 0, 0.8941177, 1,
0.9850054, -0.9717234, 1.970364, 1, 0, 0.8862745, 1,
0.99299, -0.7757783, 3.902017, 1, 0, 0.8823529, 1,
1.001049, 0.1826361, 1.020465, 1, 0, 0.8745098, 1,
1.005246, -0.7472953, 0.9590116, 1, 0, 0.8705882, 1,
1.007267, -1.016701, 3.374356, 1, 0, 0.8627451, 1,
1.010735, 1.339317, 1.268757, 1, 0, 0.8588235, 1,
1.014918, 0.07449374, 0.2713039, 1, 0, 0.8509804, 1,
1.028505, -0.937682, 1.868593, 1, 0, 0.8470588, 1,
1.043103, 0.4533635, 1.88472, 1, 0, 0.8392157, 1,
1.049073, 0.8389828, -1.187909, 1, 0, 0.8352941, 1,
1.050407, 0.3736072, 1.346954, 1, 0, 0.827451, 1,
1.059, -0.109961, 2.10903, 1, 0, 0.8235294, 1,
1.060202, 1.354112, 1.623261, 1, 0, 0.8156863, 1,
1.065144, 0.8214232, -0.6055363, 1, 0, 0.8117647, 1,
1.067196, 0.5741644, 1.57748, 1, 0, 0.8039216, 1,
1.067976, 1.885761, 0.3088739, 1, 0, 0.7960784, 1,
1.077348, -0.2910514, 1.521111, 1, 0, 0.7921569, 1,
1.07934, -2.410488, 2.378616, 1, 0, 0.7843137, 1,
1.083196, -0.2448737, 2.377243, 1, 0, 0.7803922, 1,
1.083779, -0.05733782, 0.7806236, 1, 0, 0.772549, 1,
1.084054, 0.1401738, 1.9076, 1, 0, 0.7686275, 1,
1.089265, 2.195187, 1.709139, 1, 0, 0.7607843, 1,
1.092721, 0.1598383, 1.503091, 1, 0, 0.7568628, 1,
1.093649, -1.566229, 0.7053078, 1, 0, 0.7490196, 1,
1.094564, 0.2776086, 1.206116, 1, 0, 0.7450981, 1,
1.102951, 0.2493917, 2.422017, 1, 0, 0.7372549, 1,
1.115203, -0.02692974, 1.026645, 1, 0, 0.7333333, 1,
1.115622, 0.7616818, 1.844831, 1, 0, 0.7254902, 1,
1.116643, 0.7508643, 0.6633133, 1, 0, 0.7215686, 1,
1.117963, 0.365814, 2.246426, 1, 0, 0.7137255, 1,
1.124591, 0.1372094, 1.658247, 1, 0, 0.7098039, 1,
1.126595, 1.85243, 1.014554, 1, 0, 0.7019608, 1,
1.135398, 0.2222361, 2.075555, 1, 0, 0.6941177, 1,
1.138024, -1.682116, 0.987802, 1, 0, 0.6901961, 1,
1.139281, 0.2814296, -0.1772103, 1, 0, 0.682353, 1,
1.141323, -1.545174, 2.161957, 1, 0, 0.6784314, 1,
1.153812, -0.01126358, 1.540144, 1, 0, 0.6705883, 1,
1.15447, -0.1795131, 2.678849, 1, 0, 0.6666667, 1,
1.158693, 0.3649784, 0.409622, 1, 0, 0.6588235, 1,
1.164502, -1.160242, 1.948504, 1, 0, 0.654902, 1,
1.174397, 0.008093694, 2.151245, 1, 0, 0.6470588, 1,
1.177684, 0.2092885, 1.094889, 1, 0, 0.6431373, 1,
1.178778, -0.9685721, 2.668745, 1, 0, 0.6352941, 1,
1.182668, 2.086686, 0.5687111, 1, 0, 0.6313726, 1,
1.188735, 1.013342, 1.22234, 1, 0, 0.6235294, 1,
1.1985, 0.6310439, 0.420065, 1, 0, 0.6196079, 1,
1.20251, -0.7758203, 0.9220241, 1, 0, 0.6117647, 1,
1.212299, -1.076489, 1.683582, 1, 0, 0.6078432, 1,
1.224785, 0.3664877, 1.427496, 1, 0, 0.6, 1,
1.226731, 1.441713, 0.8125955, 1, 0, 0.5921569, 1,
1.231565, 0.3122476, -0.2857199, 1, 0, 0.5882353, 1,
1.232225, -0.03163762, 2.040118, 1, 0, 0.5803922, 1,
1.240302, -1.132612, -0.3008361, 1, 0, 0.5764706, 1,
1.250525, -2.648756, 1.154295, 1, 0, 0.5686275, 1,
1.251472, 0.733491, 1.278136, 1, 0, 0.5647059, 1,
1.254015, -1.190563, 2.661159, 1, 0, 0.5568628, 1,
1.254549, 1.758186, -1.257882, 1, 0, 0.5529412, 1,
1.261044, 0.6655644, 2.173223, 1, 0, 0.5450981, 1,
1.278591, -1.09817, 1.395178, 1, 0, 0.5411765, 1,
1.290905, -0.2419926, 1.518225, 1, 0, 0.5333334, 1,
1.291313, -1.806084, 4.797718, 1, 0, 0.5294118, 1,
1.295999, 2.353835, 2.443117, 1, 0, 0.5215687, 1,
1.299465, 0.3770573, -0.5530297, 1, 0, 0.5176471, 1,
1.302929, -0.9278949, 2.647436, 1, 0, 0.509804, 1,
1.304638, 0.7942168, 0.5556388, 1, 0, 0.5058824, 1,
1.310272, 0.4686745, -0.1467175, 1, 0, 0.4980392, 1,
1.318094, 0.1985288, 2.132596, 1, 0, 0.4901961, 1,
1.320062, 1.283209, 1.451136, 1, 0, 0.4862745, 1,
1.320941, 0.3538791, 2.241962, 1, 0, 0.4784314, 1,
1.328116, -0.7826243, 2.561878, 1, 0, 0.4745098, 1,
1.332385, 0.2416737, 0.8412237, 1, 0, 0.4666667, 1,
1.333762, -0.6925424, 3.266769, 1, 0, 0.4627451, 1,
1.33839, -0.9851844, 0.4155691, 1, 0, 0.454902, 1,
1.372106, -0.1403307, 3.123202, 1, 0, 0.4509804, 1,
1.392599, 0.3083534, 2.771379, 1, 0, 0.4431373, 1,
1.399735, 1.204017, -0.05264949, 1, 0, 0.4392157, 1,
1.410444, 0.6905051, 1.2499, 1, 0, 0.4313726, 1,
1.414088, -0.2109773, 1.037051, 1, 0, 0.427451, 1,
1.429721, 2.258255, 0.7082044, 1, 0, 0.4196078, 1,
1.429786, 0.1883535, 1.068801, 1, 0, 0.4156863, 1,
1.439498, 1.749611, 0.9894081, 1, 0, 0.4078431, 1,
1.440352, 0.2947491, 2.647563, 1, 0, 0.4039216, 1,
1.4419, -0.2282232, 0.7139602, 1, 0, 0.3960784, 1,
1.454954, 0.4357027, 1.780951, 1, 0, 0.3882353, 1,
1.463831, -1.039582, 2.494374, 1, 0, 0.3843137, 1,
1.464764, -0.4904673, 3.444421, 1, 0, 0.3764706, 1,
1.464986, -2.087895, 3.470337, 1, 0, 0.372549, 1,
1.468602, -0.7108342, 2.974323, 1, 0, 0.3647059, 1,
1.476556, 0.4782928, 0.1953325, 1, 0, 0.3607843, 1,
1.481393, 0.3642784, 0.3872471, 1, 0, 0.3529412, 1,
1.493966, -0.2246359, 2.722557, 1, 0, 0.3490196, 1,
1.496384, 1.39489, 2.055308, 1, 0, 0.3411765, 1,
1.507618, -0.2829483, 0.909265, 1, 0, 0.3372549, 1,
1.526093, -0.9375254, 1.423371, 1, 0, 0.3294118, 1,
1.529493, 0.8900552, 0.5698212, 1, 0, 0.3254902, 1,
1.530613, -1.264905, 1.525623, 1, 0, 0.3176471, 1,
1.536087, -1.212, 2.058545, 1, 0, 0.3137255, 1,
1.538303, -0.4664416, 2.279617, 1, 0, 0.3058824, 1,
1.549725, 0.5823882, 2.165079, 1, 0, 0.2980392, 1,
1.564295, 0.8100914, 0.5285215, 1, 0, 0.2941177, 1,
1.581872, 0.5087802, 0.7382399, 1, 0, 0.2862745, 1,
1.585927, -1.222709, 4.508693, 1, 0, 0.282353, 1,
1.598256, 0.2460022, -0.04170407, 1, 0, 0.2745098, 1,
1.636958, 0.5026178, 2.35942, 1, 0, 0.2705882, 1,
1.668853, 1.269807, 2.351835, 1, 0, 0.2627451, 1,
1.702962, -0.03826174, 2.101749, 1, 0, 0.2588235, 1,
1.714015, 0.925717, 1.40005, 1, 0, 0.2509804, 1,
1.720477, -0.07835806, 3.067701, 1, 0, 0.2470588, 1,
1.722756, -0.5562956, 2.093162, 1, 0, 0.2392157, 1,
1.742223, 0.7405269, 1.501658, 1, 0, 0.2352941, 1,
1.795404, 1.062052, 1.703961, 1, 0, 0.227451, 1,
1.809825, -0.5052381, 1.472134, 1, 0, 0.2235294, 1,
1.815182, 0.1541124, 1.480758, 1, 0, 0.2156863, 1,
1.822591, -0.9598994, 2.644871, 1, 0, 0.2117647, 1,
1.835377, 2.477033, -0.1975884, 1, 0, 0.2039216, 1,
1.838673, -0.1322801, 0.5575061, 1, 0, 0.1960784, 1,
1.839396, 0.167769, 1.650898, 1, 0, 0.1921569, 1,
1.866186, -1.076566, 1.763535, 1, 0, 0.1843137, 1,
1.879875, -0.3194157, 1.119684, 1, 0, 0.1803922, 1,
1.898075, 0.009629969, 2.825312, 1, 0, 0.172549, 1,
1.905557, 0.1324658, 1.532402, 1, 0, 0.1686275, 1,
1.910687, 0.750195, 1.475325, 1, 0, 0.1607843, 1,
1.926615, -0.7236686, 1.098316, 1, 0, 0.1568628, 1,
1.962839, -1.319134, 2.60529, 1, 0, 0.1490196, 1,
1.976637, -0.6607032, 0.228868, 1, 0, 0.145098, 1,
1.977047, -0.6186628, 2.326231, 1, 0, 0.1372549, 1,
2.028111, 0.09294932, 1.494414, 1, 0, 0.1333333, 1,
2.046761, -1.852195, 0.1267426, 1, 0, 0.1254902, 1,
2.051836, 1.702111, 1.158958, 1, 0, 0.1215686, 1,
2.059105, 1.690901, 0.8422273, 1, 0, 0.1137255, 1,
2.103791, -0.09921127, 1.698811, 1, 0, 0.1098039, 1,
2.114139, -1.684045, 2.363328, 1, 0, 0.1019608, 1,
2.126138, -0.8073257, 1.363023, 1, 0, 0.09411765, 1,
2.145193, -0.1658838, 0.5191525, 1, 0, 0.09019608, 1,
2.237836, -0.3165482, 2.740602, 1, 0, 0.08235294, 1,
2.242173, 0.8755143, 2.006529, 1, 0, 0.07843138, 1,
2.254927, -0.9278819, 1.510588, 1, 0, 0.07058824, 1,
2.275801, 0.5687175, 1.527154, 1, 0, 0.06666667, 1,
2.302819, -0.5792812, 1.02956, 1, 0, 0.05882353, 1,
2.381364, -0.7723659, 1.257559, 1, 0, 0.05490196, 1,
2.383148, 0.01825192, 3.649228, 1, 0, 0.04705882, 1,
2.39292, 1.401353, 1.511888, 1, 0, 0.04313726, 1,
2.400175, -0.09340626, 2.569923, 1, 0, 0.03529412, 1,
2.52235, 0.224186, 0.9852561, 1, 0, 0.03137255, 1,
2.545053, -0.5337107, 2.288996, 1, 0, 0.02352941, 1,
2.627831, 0.9794943, 2.333158, 1, 0, 0.01960784, 1,
2.721373, -3.514073, 2.013441, 1, 0, 0.01176471, 1,
2.760732, 0.673098, 1.082282, 1, 0, 0.007843138, 1
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
-0.2356068, -4.610228, -7.997589, 0, -0.5, 0.5, 0.5,
-0.2356068, -4.610228, -7.997589, 1, -0.5, 0.5, 0.5,
-0.2356068, -4.610228, -7.997589, 1, 1.5, 0.5, 0.5,
-0.2356068, -4.610228, -7.997589, 0, 1.5, 0.5, 0.5
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
-4.247704, -0.280579, -7.997589, 0, -0.5, 0.5, 0.5,
-4.247704, -0.280579, -7.997589, 1, -0.5, 0.5, 0.5,
-4.247704, -0.280579, -7.997589, 1, 1.5, 0.5, 0.5,
-4.247704, -0.280579, -7.997589, 0, 1.5, 0.5, 0.5
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
-4.247704, -4.610228, -0.267354, 0, -0.5, 0.5, 0.5,
-4.247704, -4.610228, -0.267354, 1, -0.5, 0.5, 0.5,
-4.247704, -4.610228, -0.267354, 1, 1.5, 0.5, 0.5,
-4.247704, -4.610228, -0.267354, 0, 1.5, 0.5, 0.5
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
-3, -3.611078, -6.213688,
2, -3.611078, -6.213688,
-3, -3.611078, -6.213688,
-3, -3.777603, -6.511005,
-2, -3.611078, -6.213688,
-2, -3.777603, -6.511005,
-1, -3.611078, -6.213688,
-1, -3.777603, -6.511005,
0, -3.611078, -6.213688,
0, -3.777603, -6.511005,
1, -3.611078, -6.213688,
1, -3.777603, -6.511005,
2, -3.611078, -6.213688,
2, -3.777603, -6.511005
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
-3, -4.110653, -7.105639, 0, -0.5, 0.5, 0.5,
-3, -4.110653, -7.105639, 1, -0.5, 0.5, 0.5,
-3, -4.110653, -7.105639, 1, 1.5, 0.5, 0.5,
-3, -4.110653, -7.105639, 0, 1.5, 0.5, 0.5,
-2, -4.110653, -7.105639, 0, -0.5, 0.5, 0.5,
-2, -4.110653, -7.105639, 1, -0.5, 0.5, 0.5,
-2, -4.110653, -7.105639, 1, 1.5, 0.5, 0.5,
-2, -4.110653, -7.105639, 0, 1.5, 0.5, 0.5,
-1, -4.110653, -7.105639, 0, -0.5, 0.5, 0.5,
-1, -4.110653, -7.105639, 1, -0.5, 0.5, 0.5,
-1, -4.110653, -7.105639, 1, 1.5, 0.5, 0.5,
-1, -4.110653, -7.105639, 0, 1.5, 0.5, 0.5,
0, -4.110653, -7.105639, 0, -0.5, 0.5, 0.5,
0, -4.110653, -7.105639, 1, -0.5, 0.5, 0.5,
0, -4.110653, -7.105639, 1, 1.5, 0.5, 0.5,
0, -4.110653, -7.105639, 0, 1.5, 0.5, 0.5,
1, -4.110653, -7.105639, 0, -0.5, 0.5, 0.5,
1, -4.110653, -7.105639, 1, -0.5, 0.5, 0.5,
1, -4.110653, -7.105639, 1, 1.5, 0.5, 0.5,
1, -4.110653, -7.105639, 0, 1.5, 0.5, 0.5,
2, -4.110653, -7.105639, 0, -0.5, 0.5, 0.5,
2, -4.110653, -7.105639, 1, -0.5, 0.5, 0.5,
2, -4.110653, -7.105639, 1, 1.5, 0.5, 0.5,
2, -4.110653, -7.105639, 0, 1.5, 0.5, 0.5
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
-3.321836, -3, -6.213688,
-3.321836, 2, -6.213688,
-3.321836, -3, -6.213688,
-3.476147, -3, -6.511005,
-3.321836, -2, -6.213688,
-3.476147, -2, -6.511005,
-3.321836, -1, -6.213688,
-3.476147, -1, -6.511005,
-3.321836, 0, -6.213688,
-3.476147, 0, -6.511005,
-3.321836, 1, -6.213688,
-3.476147, 1, -6.511005,
-3.321836, 2, -6.213688,
-3.476147, 2, -6.511005
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
-3.78477, -3, -7.105639, 0, -0.5, 0.5, 0.5,
-3.78477, -3, -7.105639, 1, -0.5, 0.5, 0.5,
-3.78477, -3, -7.105639, 1, 1.5, 0.5, 0.5,
-3.78477, -3, -7.105639, 0, 1.5, 0.5, 0.5,
-3.78477, -2, -7.105639, 0, -0.5, 0.5, 0.5,
-3.78477, -2, -7.105639, 1, -0.5, 0.5, 0.5,
-3.78477, -2, -7.105639, 1, 1.5, 0.5, 0.5,
-3.78477, -2, -7.105639, 0, 1.5, 0.5, 0.5,
-3.78477, -1, -7.105639, 0, -0.5, 0.5, 0.5,
-3.78477, -1, -7.105639, 1, -0.5, 0.5, 0.5,
-3.78477, -1, -7.105639, 1, 1.5, 0.5, 0.5,
-3.78477, -1, -7.105639, 0, 1.5, 0.5, 0.5,
-3.78477, 0, -7.105639, 0, -0.5, 0.5, 0.5,
-3.78477, 0, -7.105639, 1, -0.5, 0.5, 0.5,
-3.78477, 0, -7.105639, 1, 1.5, 0.5, 0.5,
-3.78477, 0, -7.105639, 0, 1.5, 0.5, 0.5,
-3.78477, 1, -7.105639, 0, -0.5, 0.5, 0.5,
-3.78477, 1, -7.105639, 1, -0.5, 0.5, 0.5,
-3.78477, 1, -7.105639, 1, 1.5, 0.5, 0.5,
-3.78477, 1, -7.105639, 0, 1.5, 0.5, 0.5,
-3.78477, 2, -7.105639, 0, -0.5, 0.5, 0.5,
-3.78477, 2, -7.105639, 1, -0.5, 0.5, 0.5,
-3.78477, 2, -7.105639, 1, 1.5, 0.5, 0.5,
-3.78477, 2, -7.105639, 0, 1.5, 0.5, 0.5
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
-3.321836, -3.611078, -6,
-3.321836, -3.611078, 4,
-3.321836, -3.611078, -6,
-3.476147, -3.777603, -6,
-3.321836, -3.611078, -4,
-3.476147, -3.777603, -4,
-3.321836, -3.611078, -2,
-3.476147, -3.777603, -2,
-3.321836, -3.611078, 0,
-3.476147, -3.777603, 0,
-3.321836, -3.611078, 2,
-3.476147, -3.777603, 2,
-3.321836, -3.611078, 4,
-3.476147, -3.777603, 4
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
-3.78477, -4.110653, -6, 0, -0.5, 0.5, 0.5,
-3.78477, -4.110653, -6, 1, -0.5, 0.5, 0.5,
-3.78477, -4.110653, -6, 1, 1.5, 0.5, 0.5,
-3.78477, -4.110653, -6, 0, 1.5, 0.5, 0.5,
-3.78477, -4.110653, -4, 0, -0.5, 0.5, 0.5,
-3.78477, -4.110653, -4, 1, -0.5, 0.5, 0.5,
-3.78477, -4.110653, -4, 1, 1.5, 0.5, 0.5,
-3.78477, -4.110653, -4, 0, 1.5, 0.5, 0.5,
-3.78477, -4.110653, -2, 0, -0.5, 0.5, 0.5,
-3.78477, -4.110653, -2, 1, -0.5, 0.5, 0.5,
-3.78477, -4.110653, -2, 1, 1.5, 0.5, 0.5,
-3.78477, -4.110653, -2, 0, 1.5, 0.5, 0.5,
-3.78477, -4.110653, 0, 0, -0.5, 0.5, 0.5,
-3.78477, -4.110653, 0, 1, -0.5, 0.5, 0.5,
-3.78477, -4.110653, 0, 1, 1.5, 0.5, 0.5,
-3.78477, -4.110653, 0, 0, 1.5, 0.5, 0.5,
-3.78477, -4.110653, 2, 0, -0.5, 0.5, 0.5,
-3.78477, -4.110653, 2, 1, -0.5, 0.5, 0.5,
-3.78477, -4.110653, 2, 1, 1.5, 0.5, 0.5,
-3.78477, -4.110653, 2, 0, 1.5, 0.5, 0.5,
-3.78477, -4.110653, 4, 0, -0.5, 0.5, 0.5,
-3.78477, -4.110653, 4, 1, -0.5, 0.5, 0.5,
-3.78477, -4.110653, 4, 1, 1.5, 0.5, 0.5,
-3.78477, -4.110653, 4, 0, 1.5, 0.5, 0.5
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
-3.321836, -3.611078, -6.213688,
-3.321836, 3.04992, -6.213688,
-3.321836, -3.611078, 5.67898,
-3.321836, 3.04992, 5.67898,
-3.321836, -3.611078, -6.213688,
-3.321836, -3.611078, 5.67898,
-3.321836, 3.04992, -6.213688,
-3.321836, 3.04992, 5.67898,
-3.321836, -3.611078, -6.213688,
2.850622, -3.611078, -6.213688,
-3.321836, -3.611078, 5.67898,
2.850622, -3.611078, 5.67898,
-3.321836, 3.04992, -6.213688,
2.850622, 3.04992, -6.213688,
-3.321836, 3.04992, 5.67898,
2.850622, 3.04992, 5.67898,
2.850622, -3.611078, -6.213688,
2.850622, 3.04992, -6.213688,
2.850622, -3.611078, 5.67898,
2.850622, 3.04992, 5.67898,
2.850622, -3.611078, -6.213688,
2.850622, -3.611078, 5.67898,
2.850622, 3.04992, -6.213688,
2.850622, 3.04992, 5.67898
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
var radius = 7.990171;
var distance = 35.54918;
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
mvMatrix.translate( 0.2356068, 0.280579, 0.267354 );
mvMatrix.scale( 1.399626, 1.296972, 0.7264248 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54918);
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
antimony_potassium_t<-read.table("antimony_potassium_t.xyz", skip=1)
x<-antimony_potassium_t$V2
y<-antimony_potassium_t$V3
z<-antimony_potassium_t$V4
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
10, 10, 2, 0, 0, 1, 1, 1,
6, 2, 1, 1, 0, 0, 1, 1,
4, 5, 1, 1, 0, 0, 1, 1,
4, 8, 1, 1, 0, 0, 1, 1,
2, 2, 1, 1, 0, 0, 1, 1,
2, 6, 1, 1, 0, 0, 1, 1,
3, 5, 1, 0, 0, 0, 1, 1,
3, 8, 1, 0, 0, 0, 1, 1,
5, 4, 1, 0, 0, 0, 1, 1,
7, 3, 1, 0, 0, 0, 1, 1,
5, 7, 1, 0, 0, 0, 1, 1,
9, 1, 1, 0, 0, 0, 1, 1,
1, 9, 1, 0, 0, 0, 1, 1,
8, 9, 1, 1, 1, 1, 1, 1
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
var radius = 8.713639;
var distance = 30.60629;
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
mvMatrix.translate( -5.5, -5.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -30.60629);
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
for (var i = 0; i < 14; i++) {
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
