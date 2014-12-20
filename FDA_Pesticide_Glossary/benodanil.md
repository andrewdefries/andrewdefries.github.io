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
-3.178231, 1.527007, -2.024135, 1, 0, 0, 1,
-2.835016, -0.1565535, -1.546741, 1, 0.007843138, 0, 1,
-2.617687, -0.3099003, -2.348525, 1, 0.01176471, 0, 1,
-2.537423, 1.165559, -1.459572, 1, 0.01960784, 0, 1,
-2.528065, -0.644936, -3.274398, 1, 0.02352941, 0, 1,
-2.379862, 1.480479, -0.3909327, 1, 0.03137255, 0, 1,
-2.379678, -0.3677147, -0.4537796, 1, 0.03529412, 0, 1,
-2.308219, 0.4250357, -1.014202, 1, 0.04313726, 0, 1,
-2.265144, 0.2749572, -2.839821, 1, 0.04705882, 0, 1,
-2.240913, -0.2407561, -1.492063, 1, 0.05490196, 0, 1,
-2.21331, 1.889827, 0.06914565, 1, 0.05882353, 0, 1,
-2.194036, 1.244497, -2.461713, 1, 0.06666667, 0, 1,
-2.147597, -1.737589, -3.258507, 1, 0.07058824, 0, 1,
-2.1331, 0.8486603, -2.362499, 1, 0.07843138, 0, 1,
-2.132185, -0.7674634, -1.785649, 1, 0.08235294, 0, 1,
-2.130113, 0.2545758, -2.657897, 1, 0.09019608, 0, 1,
-2.095682, 1.272506, 1.902713, 1, 0.09411765, 0, 1,
-2.08546, 1.013496, 0.1375027, 1, 0.1019608, 0, 1,
-2.080261, -1.120638, -2.22157, 1, 0.1098039, 0, 1,
-2.024624, -0.2319568, -0.4594369, 1, 0.1137255, 0, 1,
-2.008042, 1.209738, -0.2918571, 1, 0.1215686, 0, 1,
-1.99104, 1.407211, -2.576417, 1, 0.1254902, 0, 1,
-1.956232, -0.4655814, -2.877067, 1, 0.1333333, 0, 1,
-1.945913, 0.01384769, -0.4688125, 1, 0.1372549, 0, 1,
-1.935336, -0.1648776, -2.062649, 1, 0.145098, 0, 1,
-1.924269, -1.546117, -1.29181, 1, 0.1490196, 0, 1,
-1.883331, -0.1670995, -2.426518, 1, 0.1568628, 0, 1,
-1.844304, 0.7115138, -2.450158, 1, 0.1607843, 0, 1,
-1.811496, 0.943976, -0.875897, 1, 0.1686275, 0, 1,
-1.803906, -1.147207, -3.083295, 1, 0.172549, 0, 1,
-1.788696, -0.06736068, -2.798663, 1, 0.1803922, 0, 1,
-1.770015, 0.6299749, -1.650363, 1, 0.1843137, 0, 1,
-1.766689, -0.9155791, -0.9433289, 1, 0.1921569, 0, 1,
-1.76472, 0.1739645, -2.07591, 1, 0.1960784, 0, 1,
-1.74389, -0.6860154, -2.209801, 1, 0.2039216, 0, 1,
-1.74131, 0.1573632, -0.4735958, 1, 0.2117647, 0, 1,
-1.736712, -1.543488, -1.534312, 1, 0.2156863, 0, 1,
-1.714538, -0.3288824, -2.207452, 1, 0.2235294, 0, 1,
-1.712239, 0.9586316, 0.03893348, 1, 0.227451, 0, 1,
-1.711668, -0.2946736, -3.044242, 1, 0.2352941, 0, 1,
-1.641747, -0.1069621, -1.173793, 1, 0.2392157, 0, 1,
-1.621186, 0.2786872, -1.335811, 1, 0.2470588, 0, 1,
-1.618677, -0.1336169, -0.532154, 1, 0.2509804, 0, 1,
-1.617009, 0.4570347, -1.154096, 1, 0.2588235, 0, 1,
-1.609406, -0.2080475, -2.04659, 1, 0.2627451, 0, 1,
-1.603096, 0.3230453, 0.1350311, 1, 0.2705882, 0, 1,
-1.598401, -0.3619103, -1.658274, 1, 0.2745098, 0, 1,
-1.595049, 0.08398218, -1.920699, 1, 0.282353, 0, 1,
-1.594956, 0.6026844, 0.926685, 1, 0.2862745, 0, 1,
-1.587944, 0.2587409, -2.844625, 1, 0.2941177, 0, 1,
-1.581532, 0.3877488, -0.9864379, 1, 0.3019608, 0, 1,
-1.570346, -0.3748626, -1.410195, 1, 0.3058824, 0, 1,
-1.553903, 0.9345372, -2.173933, 1, 0.3137255, 0, 1,
-1.545819, -1.030839, -1.417093, 1, 0.3176471, 0, 1,
-1.544902, -0.1825189, -0.7778974, 1, 0.3254902, 0, 1,
-1.535745, 0.2407894, -0.7259059, 1, 0.3294118, 0, 1,
-1.535439, 1.522099, -1.783144, 1, 0.3372549, 0, 1,
-1.533553, -0.7149319, -1.209925, 1, 0.3411765, 0, 1,
-1.522535, 1.043948, -0.8961443, 1, 0.3490196, 0, 1,
-1.51725, -0.01650696, -1.534106, 1, 0.3529412, 0, 1,
-1.496545, 1.358542, -1.345113, 1, 0.3607843, 0, 1,
-1.495482, -0.1112713, -1.353251, 1, 0.3647059, 0, 1,
-1.488963, 0.09322234, -2.776214, 1, 0.372549, 0, 1,
-1.488461, 0.2002491, -2.045523, 1, 0.3764706, 0, 1,
-1.476952, 1.103787, 0.4132531, 1, 0.3843137, 0, 1,
-1.460389, 2.165056, 0.1363032, 1, 0.3882353, 0, 1,
-1.458964, -0.07723124, -0.9378592, 1, 0.3960784, 0, 1,
-1.457164, 2.241822, -1.854551, 1, 0.4039216, 0, 1,
-1.451579, -0.8060808, -1.912448, 1, 0.4078431, 0, 1,
-1.445722, 1.366252, -2.466321, 1, 0.4156863, 0, 1,
-1.441303, 1.104769, -2.097217, 1, 0.4196078, 0, 1,
-1.41396, -1.586383, -1.856964, 1, 0.427451, 0, 1,
-1.409054, 0.08397054, -2.284574, 1, 0.4313726, 0, 1,
-1.407004, 1.740987, -1.034822, 1, 0.4392157, 0, 1,
-1.405219, 0.9035652, 0.04387039, 1, 0.4431373, 0, 1,
-1.39686, 1.304806, -1.440911, 1, 0.4509804, 0, 1,
-1.384395, 0.09400922, -1.122974, 1, 0.454902, 0, 1,
-1.374838, 1.098484, -1.209106, 1, 0.4627451, 0, 1,
-1.371186, 0.3146567, -2.345382, 1, 0.4666667, 0, 1,
-1.365295, -1.289363, -2.24709, 1, 0.4745098, 0, 1,
-1.352643, -1.930582, -2.601419, 1, 0.4784314, 0, 1,
-1.352013, 0.4875331, -1.771173, 1, 0.4862745, 0, 1,
-1.340507, 1.638978, -1.042948, 1, 0.4901961, 0, 1,
-1.337013, 0.1588842, -0.7564207, 1, 0.4980392, 0, 1,
-1.33555, -2.563244, -3.518471, 1, 0.5058824, 0, 1,
-1.333776, 0.2505019, -0.9910021, 1, 0.509804, 0, 1,
-1.323793, 0.03806012, -1.09868, 1, 0.5176471, 0, 1,
-1.322891, 1.143367, -1.852852, 1, 0.5215687, 0, 1,
-1.316708, 0.4707944, 0.4839296, 1, 0.5294118, 0, 1,
-1.313697, 0.6092433, 0.817335, 1, 0.5333334, 0, 1,
-1.310927, -0.00606018, -1.16508, 1, 0.5411765, 0, 1,
-1.299818, 1.077557, -1.498956, 1, 0.5450981, 0, 1,
-1.294946, -1.211354, -3.559327, 1, 0.5529412, 0, 1,
-1.291168, 0.2554224, -0.5947251, 1, 0.5568628, 0, 1,
-1.286659, 0.1528805, -3.032176, 1, 0.5647059, 0, 1,
-1.27542, -1.68518, -1.176781, 1, 0.5686275, 0, 1,
-1.26569, -0.6634986, -1.276662, 1, 0.5764706, 0, 1,
-1.250328, 0.4362426, -0.6202078, 1, 0.5803922, 0, 1,
-1.250174, 0.5743567, -1.478385, 1, 0.5882353, 0, 1,
-1.240801, -0.6546625, -1.741114, 1, 0.5921569, 0, 1,
-1.236076, -1.130625, -2.403531, 1, 0.6, 0, 1,
-1.22398, 1.054078, -1.385385, 1, 0.6078432, 0, 1,
-1.221761, 0.7335792, -1.618578, 1, 0.6117647, 0, 1,
-1.221323, 1.227215, -1.77732, 1, 0.6196079, 0, 1,
-1.214696, -0.3213428, -0.4876138, 1, 0.6235294, 0, 1,
-1.213066, 0.5084348, 2.330197, 1, 0.6313726, 0, 1,
-1.211653, -0.9983141, -3.142409, 1, 0.6352941, 0, 1,
-1.207907, -1.673483, -3.133585, 1, 0.6431373, 0, 1,
-1.203724, 0.6239257, 0.5832017, 1, 0.6470588, 0, 1,
-1.197049, -1.558187, 1.552259, 1, 0.654902, 0, 1,
-1.193612, -0.5504586, -2.95545, 1, 0.6588235, 0, 1,
-1.191801, -0.8771449, -2.260975, 1, 0.6666667, 0, 1,
-1.185932, 0.6382638, -0.5739415, 1, 0.6705883, 0, 1,
-1.177285, 1.005417, -0.6506678, 1, 0.6784314, 0, 1,
-1.176068, -1.116977, -3.526719, 1, 0.682353, 0, 1,
-1.174422, -0.5233339, -1.698262, 1, 0.6901961, 0, 1,
-1.170752, 0.7471452, -1.302675, 1, 0.6941177, 0, 1,
-1.168776, 1.753919, -0.9913373, 1, 0.7019608, 0, 1,
-1.167594, 1.490258, 0.1624848, 1, 0.7098039, 0, 1,
-1.165732, 0.6993845, -1.751699, 1, 0.7137255, 0, 1,
-1.164767, 0.2008412, -2.624091, 1, 0.7215686, 0, 1,
-1.160276, 0.7900994, 0.1495739, 1, 0.7254902, 0, 1,
-1.155009, -0.6152735, -0.803966, 1, 0.7333333, 0, 1,
-1.147827, 0.05268952, -1.145407, 1, 0.7372549, 0, 1,
-1.141699, 0.06972247, -0.6764903, 1, 0.7450981, 0, 1,
-1.137524, 0.3449953, -0.6832443, 1, 0.7490196, 0, 1,
-1.135193, -1.525332, -1.542467, 1, 0.7568628, 0, 1,
-1.133226, -1.667544, -3.294745, 1, 0.7607843, 0, 1,
-1.132039, 0.1536402, -3.17336, 1, 0.7686275, 0, 1,
-1.128244, -1.812219, -2.176092, 1, 0.772549, 0, 1,
-1.126214, -0.8337312, -2.116075, 1, 0.7803922, 0, 1,
-1.122438, 1.625813, 0.6211049, 1, 0.7843137, 0, 1,
-1.114835, -0.2091286, -1.517461, 1, 0.7921569, 0, 1,
-1.111329, 1.117457, -0.03943284, 1, 0.7960784, 0, 1,
-1.111245, -1.258916, -1.809454, 1, 0.8039216, 0, 1,
-1.104028, -0.2120454, -2.759234, 1, 0.8117647, 0, 1,
-1.10177, -1.895637, -1.779968, 1, 0.8156863, 0, 1,
-1.099523, -0.2533019, -2.209336, 1, 0.8235294, 0, 1,
-1.099486, -2.243935, -2.595412, 1, 0.827451, 0, 1,
-1.086346, 0.5474856, -1.506591, 1, 0.8352941, 0, 1,
-1.083446, 0.4109763, -2.585418, 1, 0.8392157, 0, 1,
-1.078939, -0.4298773, -3.062325, 1, 0.8470588, 0, 1,
-1.069458, 0.5128527, -1.46517, 1, 0.8509804, 0, 1,
-1.055733, -0.01396799, -3.115679, 1, 0.8588235, 0, 1,
-1.053069, 0.9812887, 0.7777666, 1, 0.8627451, 0, 1,
-1.045541, -0.5525403, -1.125324, 1, 0.8705882, 0, 1,
-1.044558, -0.4040394, -3.904597, 1, 0.8745098, 0, 1,
-1.041407, 0.471866, -1.048235, 1, 0.8823529, 0, 1,
-1.036666, -0.1439663, -2.748949, 1, 0.8862745, 0, 1,
-1.035734, -0.1304324, -4.781559, 1, 0.8941177, 0, 1,
-1.03024, -1.134866, -2.937536, 1, 0.8980392, 0, 1,
-1.023967, 0.04109425, -1.221441, 1, 0.9058824, 0, 1,
-1.018395, 0.7788902, -0.3352242, 1, 0.9137255, 0, 1,
-1.004627, -1.715051, -2.793955, 1, 0.9176471, 0, 1,
-0.9985185, 2.403778, -1.103984, 1, 0.9254902, 0, 1,
-0.9974698, -0.1852113, -1.432066, 1, 0.9294118, 0, 1,
-0.9903763, -0.6900526, -0.6354311, 1, 0.9372549, 0, 1,
-0.9900441, 0.6243226, -2.277449, 1, 0.9411765, 0, 1,
-0.9883807, -2.352045, -3.768294, 1, 0.9490196, 0, 1,
-0.9872144, 0.5212544, -1.712652, 1, 0.9529412, 0, 1,
-0.9821991, 1.089441, -0.2472322, 1, 0.9607843, 0, 1,
-0.9785399, 0.4344296, -2.451849, 1, 0.9647059, 0, 1,
-0.9784657, -0.5963492, -2.679577, 1, 0.972549, 0, 1,
-0.9745591, 2.135507, -0.5771817, 1, 0.9764706, 0, 1,
-0.9741575, 2.283398, -2.393597, 1, 0.9843137, 0, 1,
-0.9707503, 0.3874729, -0.9521072, 1, 0.9882353, 0, 1,
-0.9614152, 0.4830703, 0.004724011, 1, 0.9960784, 0, 1,
-0.9606653, -0.6238801, -3.095612, 0.9960784, 1, 0, 1,
-0.9582846, -0.1086662, -2.046721, 0.9921569, 1, 0, 1,
-0.9557149, -1.280563, -2.065993, 0.9843137, 1, 0, 1,
-0.9548752, -0.3666928, -3.207788, 0.9803922, 1, 0, 1,
-0.9521504, 0.8273627, 0.7302167, 0.972549, 1, 0, 1,
-0.949448, 1.234346, -0.01806032, 0.9686275, 1, 0, 1,
-0.9345259, 0.546009, 0.4203849, 0.9607843, 1, 0, 1,
-0.9317909, 1.131078, 0.7723755, 0.9568627, 1, 0, 1,
-0.9308141, 1.968861, -0.4372192, 0.9490196, 1, 0, 1,
-0.9305385, 1.371849, -0.243035, 0.945098, 1, 0, 1,
-0.9292156, 0.1386312, -1.213561, 0.9372549, 1, 0, 1,
-0.9273026, 1.92563, 0.1946765, 0.9333333, 1, 0, 1,
-0.9268333, 2.113195, -1.852461, 0.9254902, 1, 0, 1,
-0.9262537, 1.758915, 0.9203368, 0.9215686, 1, 0, 1,
-0.9092407, 0.1303945, -2.419585, 0.9137255, 1, 0, 1,
-0.9029089, 0.4911178, -1.875658, 0.9098039, 1, 0, 1,
-0.9001756, 2.06261, 1.024508, 0.9019608, 1, 0, 1,
-0.899882, 1.654064, 0.4172382, 0.8941177, 1, 0, 1,
-0.8997474, 1.58332, -1.254651, 0.8901961, 1, 0, 1,
-0.8947911, 1.760387, -0.2428688, 0.8823529, 1, 0, 1,
-0.8934224, 0.706426, -0.3579025, 0.8784314, 1, 0, 1,
-0.8912965, 0.8651173, -1.47569, 0.8705882, 1, 0, 1,
-0.881198, -0.1120419, -1.812924, 0.8666667, 1, 0, 1,
-0.8795103, 1.08863, 0.7317176, 0.8588235, 1, 0, 1,
-0.8761523, 1.26057, 0.351393, 0.854902, 1, 0, 1,
-0.8749214, 0.8224728, -1.354878, 0.8470588, 1, 0, 1,
-0.8696265, 0.4002081, -2.107499, 0.8431373, 1, 0, 1,
-0.857101, 0.2818711, -1.469294, 0.8352941, 1, 0, 1,
-0.8545838, -0.09490788, -0.9565269, 0.8313726, 1, 0, 1,
-0.853368, -0.3420838, -0.627526, 0.8235294, 1, 0, 1,
-0.8510479, -0.2813972, -2.59743, 0.8196079, 1, 0, 1,
-0.8476716, 1.278347, -2.543997, 0.8117647, 1, 0, 1,
-0.8449221, 0.9943101, -0.6184791, 0.8078431, 1, 0, 1,
-0.8419617, -0.2676765, 0.3489081, 0.8, 1, 0, 1,
-0.8392967, 0.1330596, 0.4071172, 0.7921569, 1, 0, 1,
-0.8329976, -1.277546, -2.545339, 0.7882353, 1, 0, 1,
-0.8292795, 0.2878065, -0.07252526, 0.7803922, 1, 0, 1,
-0.8234249, -0.224899, -0.5275014, 0.7764706, 1, 0, 1,
-0.8229055, 0.1728451, -3.787203, 0.7686275, 1, 0, 1,
-0.8196135, 1.376461, -0.002101633, 0.7647059, 1, 0, 1,
-0.8188559, 0.3591115, -2.871644, 0.7568628, 1, 0, 1,
-0.8155606, 0.6418039, -2.031987, 0.7529412, 1, 0, 1,
-0.8143576, 0.1193581, -1.467664, 0.7450981, 1, 0, 1,
-0.8107665, -0.9185098, -2.274309, 0.7411765, 1, 0, 1,
-0.8083467, 1.629223, -1.459633, 0.7333333, 1, 0, 1,
-0.8013079, 0.1706887, -0.9679583, 0.7294118, 1, 0, 1,
-0.7994721, -1.567542, -1.293016, 0.7215686, 1, 0, 1,
-0.7973398, -1.116082, -2.994279, 0.7176471, 1, 0, 1,
-0.7971247, 0.5448282, -0.3234465, 0.7098039, 1, 0, 1,
-0.7948858, 0.6667238, 0.5991884, 0.7058824, 1, 0, 1,
-0.7887237, 1.04841, -0.1785621, 0.6980392, 1, 0, 1,
-0.7873035, 0.05338389, -0.02451026, 0.6901961, 1, 0, 1,
-0.7838837, -1.029132, -1.674304, 0.6862745, 1, 0, 1,
-0.783285, -1.903169, -3.979715, 0.6784314, 1, 0, 1,
-0.782918, -0.4280585, -1.249025, 0.6745098, 1, 0, 1,
-0.7794701, 0.9475741, -1.566403, 0.6666667, 1, 0, 1,
-0.7663745, 1.134191, -0.8224183, 0.6627451, 1, 0, 1,
-0.7658517, -0.5045269, -3.392347, 0.654902, 1, 0, 1,
-0.7630668, -0.5040144, -1.620555, 0.6509804, 1, 0, 1,
-0.7623577, 1.333429, -0.8332856, 0.6431373, 1, 0, 1,
-0.7537914, 0.7186452, -2.248691, 0.6392157, 1, 0, 1,
-0.7423544, -0.9821448, -1.190534, 0.6313726, 1, 0, 1,
-0.74183, 0.6896493, -0.1080793, 0.627451, 1, 0, 1,
-0.7372653, -0.9540874, -3.562613, 0.6196079, 1, 0, 1,
-0.7369089, 0.6410024, 0.3908428, 0.6156863, 1, 0, 1,
-0.7328188, -2.324931, -3.80022, 0.6078432, 1, 0, 1,
-0.7293431, -0.3730497, -2.447056, 0.6039216, 1, 0, 1,
-0.7287932, 0.4552971, -0.8956486, 0.5960785, 1, 0, 1,
-0.7237599, -0.05764194, -2.11625, 0.5882353, 1, 0, 1,
-0.7210408, -0.5445355, -1.520173, 0.5843138, 1, 0, 1,
-0.7202135, 0.9120102, -1.846675, 0.5764706, 1, 0, 1,
-0.7164398, -0.2485381, -2.756784, 0.572549, 1, 0, 1,
-0.7163965, 0.1264046, -1.458108, 0.5647059, 1, 0, 1,
-0.713904, -0.4172512, -1.634992, 0.5607843, 1, 0, 1,
-0.7045745, -0.225202, -2.134938, 0.5529412, 1, 0, 1,
-0.7025335, 1.918384, 0.06550209, 0.5490196, 1, 0, 1,
-0.7021389, 0.6133206, -0.6972689, 0.5411765, 1, 0, 1,
-0.6940718, 3.160419, -1.418281, 0.5372549, 1, 0, 1,
-0.6764625, 0.4374158, -1.858647, 0.5294118, 1, 0, 1,
-0.6753632, -0.090153, -3.759933, 0.5254902, 1, 0, 1,
-0.6744247, -1.697403, -3.20036, 0.5176471, 1, 0, 1,
-0.6691266, 1.394369, -1.373343, 0.5137255, 1, 0, 1,
-0.6666431, 1.131639, -0.1741258, 0.5058824, 1, 0, 1,
-0.665029, -0.09792206, -3.332382, 0.5019608, 1, 0, 1,
-0.6611106, 0.3731461, -1.52681, 0.4941176, 1, 0, 1,
-0.6599284, 1.473309, -0.8368767, 0.4862745, 1, 0, 1,
-0.6588049, -0.3223135, -2.295871, 0.4823529, 1, 0, 1,
-0.6546817, -0.1868847, -2.799074, 0.4745098, 1, 0, 1,
-0.6544324, -0.5298605, -2.471829, 0.4705882, 1, 0, 1,
-0.6528493, 1.43005, 0.7453363, 0.4627451, 1, 0, 1,
-0.6513363, -0.2728087, -2.179297, 0.4588235, 1, 0, 1,
-0.6493661, 1.500517, -1.871837, 0.4509804, 1, 0, 1,
-0.6440901, 0.09577464, -2.065653, 0.4470588, 1, 0, 1,
-0.6431348, 0.1909919, -0.1056236, 0.4392157, 1, 0, 1,
-0.6385375, 0.05943611, -1.147646, 0.4352941, 1, 0, 1,
-0.6384871, -0.1736922, -0.4358883, 0.427451, 1, 0, 1,
-0.6367425, 2.245632, -0.4439651, 0.4235294, 1, 0, 1,
-0.6361486, -2.054049, -1.978255, 0.4156863, 1, 0, 1,
-0.6297156, -0.3093238, -2.699097, 0.4117647, 1, 0, 1,
-0.6280754, -0.2526748, -3.215939, 0.4039216, 1, 0, 1,
-0.6271089, -0.5124971, -2.31581, 0.3960784, 1, 0, 1,
-0.622239, 0.1186124, -0.4676027, 0.3921569, 1, 0, 1,
-0.6215407, -1.625861, -2.781349, 0.3843137, 1, 0, 1,
-0.6191982, -0.121149, -2.491991, 0.3803922, 1, 0, 1,
-0.6186892, 0.04875885, 0.2549625, 0.372549, 1, 0, 1,
-0.6113569, -3.408064, -2.936541, 0.3686275, 1, 0, 1,
-0.6047387, -0.340576, -0.3727774, 0.3607843, 1, 0, 1,
-0.6026134, 2.431143, 0.965802, 0.3568628, 1, 0, 1,
-0.6021871, 0.1572959, -1.838885, 0.3490196, 1, 0, 1,
-0.6007318, 0.6093988, -0.7814949, 0.345098, 1, 0, 1,
-0.5972342, 1.316432, 0.8499332, 0.3372549, 1, 0, 1,
-0.5953352, -0.5886668, -1.698858, 0.3333333, 1, 0, 1,
-0.5927663, -0.7831618, -2.17418, 0.3254902, 1, 0, 1,
-0.5826671, 0.9708992, -0.5905117, 0.3215686, 1, 0, 1,
-0.5783861, 0.8988863, -0.808746, 0.3137255, 1, 0, 1,
-0.5738457, -1.184252, -0.8843697, 0.3098039, 1, 0, 1,
-0.5708296, -0.6997233, -2.294033, 0.3019608, 1, 0, 1,
-0.567731, -0.2046834, -0.9825773, 0.2941177, 1, 0, 1,
-0.5620531, -0.03599294, -1.302272, 0.2901961, 1, 0, 1,
-0.5528347, -1.566616, -1.05259, 0.282353, 1, 0, 1,
-0.5508552, 2.307025, 0.3332785, 0.2784314, 1, 0, 1,
-0.5476967, -1.550996, -0.7117256, 0.2705882, 1, 0, 1,
-0.547027, 0.4393743, -1.388462, 0.2666667, 1, 0, 1,
-0.5423735, -0.4347498, -3.893376, 0.2588235, 1, 0, 1,
-0.5378936, -1.429178, -1.248865, 0.254902, 1, 0, 1,
-0.5370759, -0.2898673, -2.600066, 0.2470588, 1, 0, 1,
-0.5366721, -0.209754, -0.9898711, 0.2431373, 1, 0, 1,
-0.5258912, 1.116604, 0.1780413, 0.2352941, 1, 0, 1,
-0.5228264, -0.5606126, -2.008153, 0.2313726, 1, 0, 1,
-0.5204903, -0.1647025, -2.503089, 0.2235294, 1, 0, 1,
-0.5200948, -0.4968091, -2.898196, 0.2196078, 1, 0, 1,
-0.5200649, 2.921253, -0.379391, 0.2117647, 1, 0, 1,
-0.5192263, -0.04471467, -0.311551, 0.2078431, 1, 0, 1,
-0.5099104, 0.3344478, -0.849961, 0.2, 1, 0, 1,
-0.5077454, -1.1507, -3.241777, 0.1921569, 1, 0, 1,
-0.5061464, -0.5380642, -4.121394, 0.1882353, 1, 0, 1,
-0.5060661, -0.02183855, -0.5316281, 0.1803922, 1, 0, 1,
-0.5034588, 0.1518907, -1.178711, 0.1764706, 1, 0, 1,
-0.5032412, -1.621369, -2.685546, 0.1686275, 1, 0, 1,
-0.4990734, 0.06014525, -0.9397788, 0.1647059, 1, 0, 1,
-0.4863177, 0.6915953, -0.4121685, 0.1568628, 1, 0, 1,
-0.483688, -2.11206, -3.529183, 0.1529412, 1, 0, 1,
-0.4803068, -0.0199181, -0.7483563, 0.145098, 1, 0, 1,
-0.4779659, 0.9247177, -1.043015, 0.1411765, 1, 0, 1,
-0.477461, -0.01402306, -2.679447, 0.1333333, 1, 0, 1,
-0.4734097, 0.994315, -0.5902302, 0.1294118, 1, 0, 1,
-0.4697236, 0.8119424, -0.4505236, 0.1215686, 1, 0, 1,
-0.4635879, 0.6459076, -0.5487282, 0.1176471, 1, 0, 1,
-0.4634261, 0.6161719, 1.793233, 0.1098039, 1, 0, 1,
-0.4609697, -0.3390913, -1.558513, 0.1058824, 1, 0, 1,
-0.4590431, 0.2721215, -1.665964, 0.09803922, 1, 0, 1,
-0.4550296, -0.1260963, -1.930145, 0.09019608, 1, 0, 1,
-0.4539418, 0.1702501, -0.7188596, 0.08627451, 1, 0, 1,
-0.4503554, -0.74978, -0.1738817, 0.07843138, 1, 0, 1,
-0.4496697, 0.275155, -1.808682, 0.07450981, 1, 0, 1,
-0.446423, -1.031786, -2.067881, 0.06666667, 1, 0, 1,
-0.4463978, 0.969837, -1.213495, 0.0627451, 1, 0, 1,
-0.4457991, -1.025061, -1.366202, 0.05490196, 1, 0, 1,
-0.445132, -1.444408, -3.288857, 0.05098039, 1, 0, 1,
-0.4436077, -0.2375447, -3.944137, 0.04313726, 1, 0, 1,
-0.4420582, -1.454458, -4.933426, 0.03921569, 1, 0, 1,
-0.4352778, -0.6003965, -1.303769, 0.03137255, 1, 0, 1,
-0.4290591, 1.346521, -1.46444, 0.02745098, 1, 0, 1,
-0.4274355, 1.269307, 1.072807, 0.01960784, 1, 0, 1,
-0.4226729, 1.0877, -0.2044533, 0.01568628, 1, 0, 1,
-0.4220573, 0.1685712, -0.7870995, 0.007843138, 1, 0, 1,
-0.4209414, 0.01344649, -1.678703, 0.003921569, 1, 0, 1,
-0.4177608, -1.140423, -4.371081, 0, 1, 0.003921569, 1,
-0.4174585, -0.7358827, -3.079006, 0, 1, 0.01176471, 1,
-0.4173996, 1.01281, 0.007781694, 0, 1, 0.01568628, 1,
-0.4148886, 1.109372, 0.6050893, 0, 1, 0.02352941, 1,
-0.4072304, 0.2253758, 0.3899766, 0, 1, 0.02745098, 1,
-0.4005472, -0.2667013, -2.011811, 0, 1, 0.03529412, 1,
-0.4000503, 0.3648772, -0.4585699, 0, 1, 0.03921569, 1,
-0.3972177, -0.2588759, -2.921733, 0, 1, 0.04705882, 1,
-0.3947394, 0.4741741, 1.35883, 0, 1, 0.05098039, 1,
-0.393784, -0.4745559, -1.851543, 0, 1, 0.05882353, 1,
-0.3923382, 0.153218, -0.4660845, 0, 1, 0.0627451, 1,
-0.3900788, 1.264319, 1.195865, 0, 1, 0.07058824, 1,
-0.3893204, 0.6028559, -1.502293, 0, 1, 0.07450981, 1,
-0.3889255, 0.8394662, 0.1855549, 0, 1, 0.08235294, 1,
-0.3880154, 0.8323526, 0.2203244, 0, 1, 0.08627451, 1,
-0.387435, -0.9840693, -3.360285, 0, 1, 0.09411765, 1,
-0.384979, 0.1110252, -1.081473, 0, 1, 0.1019608, 1,
-0.3793754, -1.339298, -1.504034, 0, 1, 0.1058824, 1,
-0.3786082, 1.713472, 1.338806, 0, 1, 0.1137255, 1,
-0.3745641, 0.043399, -2.681893, 0, 1, 0.1176471, 1,
-0.3725009, 1.070858, 0.2177252, 0, 1, 0.1254902, 1,
-0.3723293, -0.8643709, -2.302877, 0, 1, 0.1294118, 1,
-0.3680751, 0.4946077, 0.06010071, 0, 1, 0.1372549, 1,
-0.3674209, 0.6378422, 0.5369927, 0, 1, 0.1411765, 1,
-0.3667745, -0.2187542, -2.710237, 0, 1, 0.1490196, 1,
-0.3644143, -0.2999514, -2.339329, 0, 1, 0.1529412, 1,
-0.3574299, -0.7433532, -1.78116, 0, 1, 0.1607843, 1,
-0.3572087, 0.4899268, 0.04311422, 0, 1, 0.1647059, 1,
-0.355731, 0.2822081, -0.6677259, 0, 1, 0.172549, 1,
-0.3507387, 0.3770742, -0.9324465, 0, 1, 0.1764706, 1,
-0.3479747, 0.1862101, -0.7480871, 0, 1, 0.1843137, 1,
-0.3461486, -1.964296, -2.018244, 0, 1, 0.1882353, 1,
-0.3456005, 0.1636495, 1.19459, 0, 1, 0.1960784, 1,
-0.3429185, -1.224, -1.75746, 0, 1, 0.2039216, 1,
-0.3416089, -0.2712537, -4.066709, 0, 1, 0.2078431, 1,
-0.3407762, -0.01369426, -0.2034187, 0, 1, 0.2156863, 1,
-0.3379362, -1.007922, -2.548006, 0, 1, 0.2196078, 1,
-0.3378536, -0.4355918, -2.326273, 0, 1, 0.227451, 1,
-0.3376037, 1.381363, -0.9799458, 0, 1, 0.2313726, 1,
-0.3369939, 0.7577346, -1.016122, 0, 1, 0.2392157, 1,
-0.3358954, -0.6338159, -2.213977, 0, 1, 0.2431373, 1,
-0.3351494, 1.357138, -1.691828, 0, 1, 0.2509804, 1,
-0.3343981, -2.50671, -2.37156, 0, 1, 0.254902, 1,
-0.3234471, 0.5186616, -1.266046, 0, 1, 0.2627451, 1,
-0.3180983, -0.8577797, -1.068595, 0, 1, 0.2666667, 1,
-0.3179798, 1.6901, -0.4151977, 0, 1, 0.2745098, 1,
-0.3178692, 0.4235954, -2.553387, 0, 1, 0.2784314, 1,
-0.3123845, -0.2887447, -1.37195, 0, 1, 0.2862745, 1,
-0.300148, -1.456954, -1.886828, 0, 1, 0.2901961, 1,
-0.2990543, 0.382153, -0.3995392, 0, 1, 0.2980392, 1,
-0.2975923, 1.104049, -0.1536198, 0, 1, 0.3058824, 1,
-0.2967938, -1.817821, -2.512288, 0, 1, 0.3098039, 1,
-0.2966363, 0.5644197, -0.5111377, 0, 1, 0.3176471, 1,
-0.2961472, 0.3985542, -0.1973664, 0, 1, 0.3215686, 1,
-0.2939404, 1.994441, 0.1875961, 0, 1, 0.3294118, 1,
-0.2934702, -1.783679, -4.785369, 0, 1, 0.3333333, 1,
-0.2910415, -0.8592334, -4.566196, 0, 1, 0.3411765, 1,
-0.2886583, -0.4984428, -2.852888, 0, 1, 0.345098, 1,
-0.2883432, -0.2699486, -2.174563, 0, 1, 0.3529412, 1,
-0.2847601, 0.6865644, 0.2021333, 0, 1, 0.3568628, 1,
-0.2839439, 1.020389, -0.6596414, 0, 1, 0.3647059, 1,
-0.2836334, -1.494691, -3.238285, 0, 1, 0.3686275, 1,
-0.2804754, 0.3672445, -0.3060157, 0, 1, 0.3764706, 1,
-0.2801344, 0.8812855, -0.9822434, 0, 1, 0.3803922, 1,
-0.2786664, -0.5777383, -1.950145, 0, 1, 0.3882353, 1,
-0.2751872, 0.7609211, 1.09602, 0, 1, 0.3921569, 1,
-0.2742892, 0.3936591, -0.4544755, 0, 1, 0.4, 1,
-0.2739734, 0.6390359, -1.223495, 0, 1, 0.4078431, 1,
-0.2691661, 1.073532, -0.5157242, 0, 1, 0.4117647, 1,
-0.2685395, 1.527676, -0.03495481, 0, 1, 0.4196078, 1,
-0.2583538, 2.666305, -0.05423545, 0, 1, 0.4235294, 1,
-0.2523713, -0.4361812, -0.541676, 0, 1, 0.4313726, 1,
-0.24876, 0.9152981, -0.8366529, 0, 1, 0.4352941, 1,
-0.239824, 1.290649, -0.4066643, 0, 1, 0.4431373, 1,
-0.2385138, 0.03742593, -1.719265, 0, 1, 0.4470588, 1,
-0.2374405, -0.4107808, -2.151122, 0, 1, 0.454902, 1,
-0.2347171, 0.5242376, 0.9088782, 0, 1, 0.4588235, 1,
-0.2342743, 0.1851743, -0.4992264, 0, 1, 0.4666667, 1,
-0.2337812, 0.7884389, -0.3026674, 0, 1, 0.4705882, 1,
-0.2336208, -0.9445476, -4.066679, 0, 1, 0.4784314, 1,
-0.2314343, 0.08141904, -2.196939, 0, 1, 0.4823529, 1,
-0.230857, -0.6962487, -1.233059, 0, 1, 0.4901961, 1,
-0.2266973, 0.0458052, -3.12507, 0, 1, 0.4941176, 1,
-0.2178603, -0.5346621, -2.407277, 0, 1, 0.5019608, 1,
-0.2177871, -1.908461, -3.511879, 0, 1, 0.509804, 1,
-0.2154573, -1.523586, -4.368701, 0, 1, 0.5137255, 1,
-0.2110901, -1.232638, -2.201953, 0, 1, 0.5215687, 1,
-0.2059356, 0.08002484, -0.2644925, 0, 1, 0.5254902, 1,
-0.2029933, -0.3099973, -1.59135, 0, 1, 0.5333334, 1,
-0.201933, -0.02680588, -2.936609, 0, 1, 0.5372549, 1,
-0.2010317, -1.610742, -2.171824, 0, 1, 0.5450981, 1,
-0.1984701, -0.2427613, -1.896994, 0, 1, 0.5490196, 1,
-0.1973759, 0.6981537, -0.6139338, 0, 1, 0.5568628, 1,
-0.1937972, 1.552407, 0.510178, 0, 1, 0.5607843, 1,
-0.1935471, 0.1756029, -2.945299, 0, 1, 0.5686275, 1,
-0.1934424, -0.7483009, -3.160434, 0, 1, 0.572549, 1,
-0.193057, -0.986765, -1.858127, 0, 1, 0.5803922, 1,
-0.1928622, 0.9843264, 1.050818, 0, 1, 0.5843138, 1,
-0.1855963, -0.600942, -2.627901, 0, 1, 0.5921569, 1,
-0.1837842, -0.6919472, -3.381277, 0, 1, 0.5960785, 1,
-0.1837708, 0.1817378, 0.2147566, 0, 1, 0.6039216, 1,
-0.1834641, 0.1818061, -1.051452, 0, 1, 0.6117647, 1,
-0.1811118, -0.1026724, -0.03073229, 0, 1, 0.6156863, 1,
-0.1789683, 1.531705, -1.809674, 0, 1, 0.6235294, 1,
-0.1785977, -0.1065106, -2.167186, 0, 1, 0.627451, 1,
-0.1692871, -1.882011, -2.177466, 0, 1, 0.6352941, 1,
-0.1657802, 1.57155, 0.6639887, 0, 1, 0.6392157, 1,
-0.1647609, 0.7421329, -2.74763, 0, 1, 0.6470588, 1,
-0.1622316, 1.398579, -0.8732321, 0, 1, 0.6509804, 1,
-0.1613521, 0.1122744, -1.021259, 0, 1, 0.6588235, 1,
-0.154881, -1.264274, -3.235069, 0, 1, 0.6627451, 1,
-0.149076, -0.7176216, -2.878059, 0, 1, 0.6705883, 1,
-0.1479558, -0.808027, -3.907166, 0, 1, 0.6745098, 1,
-0.1466148, 0.184891, -1.047343, 0, 1, 0.682353, 1,
-0.1447785, -0.7059808, -1.699844, 0, 1, 0.6862745, 1,
-0.1335029, 0.2030211, -0.02671249, 0, 1, 0.6941177, 1,
-0.1311199, -1.127526, -2.238746, 0, 1, 0.7019608, 1,
-0.1273075, -0.1357015, -2.560689, 0, 1, 0.7058824, 1,
-0.1238344, 0.6660866, 0.1296634, 0, 1, 0.7137255, 1,
-0.1196514, -0.6826094, -5.176414, 0, 1, 0.7176471, 1,
-0.1189428, 0.1990963, -0.5799651, 0, 1, 0.7254902, 1,
-0.1176943, -0.4692867, -3.13217, 0, 1, 0.7294118, 1,
-0.1123683, -0.2048993, -2.47784, 0, 1, 0.7372549, 1,
-0.1100135, 1.033101, -0.1697759, 0, 1, 0.7411765, 1,
-0.1085971, 0.7346199, -0.01748927, 0, 1, 0.7490196, 1,
-0.09663282, 0.05776644, -0.5151644, 0, 1, 0.7529412, 1,
-0.09572466, 0.9726447, 0.2544537, 0, 1, 0.7607843, 1,
-0.09121402, -0.6258083, -3.276576, 0, 1, 0.7647059, 1,
-0.08701528, -0.1567731, -3.325485, 0, 1, 0.772549, 1,
-0.08682721, 0.1438441, -0.3304306, 0, 1, 0.7764706, 1,
-0.08396727, 0.4161891, -0.2641484, 0, 1, 0.7843137, 1,
-0.08256698, 1.695668, -0.4804937, 0, 1, 0.7882353, 1,
-0.08090235, -0.385854, -3.472391, 0, 1, 0.7960784, 1,
-0.07864455, 0.9501674, 1.649988, 0, 1, 0.8039216, 1,
-0.06929918, -0.828211, -2.592476, 0, 1, 0.8078431, 1,
-0.06733828, -0.5912501, -4.411089, 0, 1, 0.8156863, 1,
-0.06499118, 1.197207, -0.4899153, 0, 1, 0.8196079, 1,
-0.05993243, -0.508244, -2.524775, 0, 1, 0.827451, 1,
-0.05739677, -2.203857, -2.435, 0, 1, 0.8313726, 1,
-0.05377038, -1.055342, -2.860949, 0, 1, 0.8392157, 1,
-0.05353086, 0.7050047, -0.9654592, 0, 1, 0.8431373, 1,
-0.0524087, 2.481571, -0.04185691, 0, 1, 0.8509804, 1,
-0.05146583, 0.8716539, -0.07588088, 0, 1, 0.854902, 1,
-0.05090954, -0.422579, -3.07385, 0, 1, 0.8627451, 1,
-0.04906275, -1.538665, -2.660968, 0, 1, 0.8666667, 1,
-0.04728849, -0.2497192, -2.875136, 0, 1, 0.8745098, 1,
-0.0469885, -1.475325, -2.861654, 0, 1, 0.8784314, 1,
-0.04679378, -0.7694713, -3.674308, 0, 1, 0.8862745, 1,
-0.04602619, 0.1625969, 0.25571, 0, 1, 0.8901961, 1,
-0.04458022, 0.2279716, -0.5945546, 0, 1, 0.8980392, 1,
-0.04354656, 0.3215333, 0.3027678, 0, 1, 0.9058824, 1,
-0.03486197, 0.2655939, -1.943758, 0, 1, 0.9098039, 1,
-0.03185178, -1.630378, -2.871281, 0, 1, 0.9176471, 1,
-0.03141404, -0.9877849, -1.926711, 0, 1, 0.9215686, 1,
-0.02394649, -0.07965066, -2.14836, 0, 1, 0.9294118, 1,
-0.022872, -1.090549, -2.216261, 0, 1, 0.9333333, 1,
-0.01964901, -1.232453, -2.418348, 0, 1, 0.9411765, 1,
-0.01473977, -0.7398003, -3.103705, 0, 1, 0.945098, 1,
-0.01148826, -0.2455493, -3.172059, 0, 1, 0.9529412, 1,
-0.004646886, 0.2603039, 1.477496, 0, 1, 0.9568627, 1,
0.00131269, 0.3699461, 1.173467, 0, 1, 0.9647059, 1,
0.002540982, -1.80166, 3.766688, 0, 1, 0.9686275, 1,
0.002702072, 0.1921553, 1.110695, 0, 1, 0.9764706, 1,
0.008249471, 1.651285, -0.7721816, 0, 1, 0.9803922, 1,
0.01104684, -1.161419, 4.624581, 0, 1, 0.9882353, 1,
0.02063023, 0.05007816, 1.880407, 0, 1, 0.9921569, 1,
0.02208805, 0.803559, -1.00935, 0, 1, 1, 1,
0.02282444, -0.2799271, 2.488781, 0, 0.9921569, 1, 1,
0.02340402, 0.07368017, 0.6837885, 0, 0.9882353, 1, 1,
0.02709754, 0.4533944, -1.01871, 0, 0.9803922, 1, 1,
0.03090891, -0.2569799, 0.997972, 0, 0.9764706, 1, 1,
0.03383356, -0.1974143, 3.41873, 0, 0.9686275, 1, 1,
0.04324312, -1.044551, 4.147593, 0, 0.9647059, 1, 1,
0.04326089, 1.23904, 1.944058, 0, 0.9568627, 1, 1,
0.04558759, -0.45165, 1.287142, 0, 0.9529412, 1, 1,
0.04818266, 0.627856, 0.4874949, 0, 0.945098, 1, 1,
0.05055606, 0.376293, -1.493478, 0, 0.9411765, 1, 1,
0.05395064, -0.9703119, 2.285779, 0, 0.9333333, 1, 1,
0.05619493, -0.4406812, 4.414917, 0, 0.9294118, 1, 1,
0.05828334, 0.6174549, -1.56607, 0, 0.9215686, 1, 1,
0.06354824, -0.925844, 2.14053, 0, 0.9176471, 1, 1,
0.0703944, 0.9902433, 0.336024, 0, 0.9098039, 1, 1,
0.07279348, 0.7932371, -0.780072, 0, 0.9058824, 1, 1,
0.07323294, -0.06958944, 2.079039, 0, 0.8980392, 1, 1,
0.07520822, -2.011461, 2.102441, 0, 0.8901961, 1, 1,
0.07531764, 0.4801056, -0.6721533, 0, 0.8862745, 1, 1,
0.0784335, 0.4199569, 0.2907809, 0, 0.8784314, 1, 1,
0.08203077, -0.4901739, 1.974395, 0, 0.8745098, 1, 1,
0.08240498, -0.3720326, 1.52653, 0, 0.8666667, 1, 1,
0.0828587, -1.621093, 4.876536, 0, 0.8627451, 1, 1,
0.08328844, 0.2649332, 2.758615, 0, 0.854902, 1, 1,
0.08743935, 0.01162606, 2.846195, 0, 0.8509804, 1, 1,
0.08912428, 0.329207, 0.2245402, 0, 0.8431373, 1, 1,
0.09469181, -2.113426, 2.995091, 0, 0.8392157, 1, 1,
0.09544308, 0.1756017, 2.172055, 0, 0.8313726, 1, 1,
0.0971662, -1.490972, 1.914023, 0, 0.827451, 1, 1,
0.09758884, 1.361756, -1.432801, 0, 0.8196079, 1, 1,
0.0984253, -0.3654856, 0.7979998, 0, 0.8156863, 1, 1,
0.09883884, -0.3409285, 4.033896, 0, 0.8078431, 1, 1,
0.1044394, -0.3881834, 2.375092, 0, 0.8039216, 1, 1,
0.1047725, 0.1047246, 0.517896, 0, 0.7960784, 1, 1,
0.1095903, -0.9297923, 4.744595, 0, 0.7882353, 1, 1,
0.1100104, 0.6437652, -0.6768766, 0, 0.7843137, 1, 1,
0.1127546, 0.6452109, -2.107593, 0, 0.7764706, 1, 1,
0.1159374, 1.394857, -1.041849, 0, 0.772549, 1, 1,
0.1171546, 0.7233003, 0.302044, 0, 0.7647059, 1, 1,
0.1183084, 0.5309922, 0.4681156, 0, 0.7607843, 1, 1,
0.1196634, -0.7562928, 3.748166, 0, 0.7529412, 1, 1,
0.1210696, 0.3640341, 0.2214931, 0, 0.7490196, 1, 1,
0.1218452, 1.020994, 1.648903, 0, 0.7411765, 1, 1,
0.1238603, -1.233195, 2.56513, 0, 0.7372549, 1, 1,
0.1241429, -1.423263, 2.869167, 0, 0.7294118, 1, 1,
0.1249791, -0.607472, 4.107449, 0, 0.7254902, 1, 1,
0.1314148, 1.64533, 0.9255155, 0, 0.7176471, 1, 1,
0.1315651, 0.5697262, -1.359893, 0, 0.7137255, 1, 1,
0.1318279, 0.7040418, -0.03316897, 0, 0.7058824, 1, 1,
0.1355608, 0.1918621, 0.8576167, 0, 0.6980392, 1, 1,
0.1361575, -1.047007, 2.441653, 0, 0.6941177, 1, 1,
0.1371293, 0.6154273, -0.8427763, 0, 0.6862745, 1, 1,
0.1410926, 1.472687, 1.232057, 0, 0.682353, 1, 1,
0.1417253, -1.426123, 3.639734, 0, 0.6745098, 1, 1,
0.1469259, 0.5289016, 0.3637411, 0, 0.6705883, 1, 1,
0.1474475, 1.517183, 0.3014834, 0, 0.6627451, 1, 1,
0.149357, -1.502874, 1.201075, 0, 0.6588235, 1, 1,
0.1498079, -1.438581, 4.109914, 0, 0.6509804, 1, 1,
0.1575397, 2.696957, -0.5032002, 0, 0.6470588, 1, 1,
0.1583494, -1.471863, 3.055396, 0, 0.6392157, 1, 1,
0.1589202, -1.538089, 1.805565, 0, 0.6352941, 1, 1,
0.1622023, 0.1179203, 1.525107, 0, 0.627451, 1, 1,
0.1726063, 1.125358, 1.553635, 0, 0.6235294, 1, 1,
0.1739781, 0.2940655, 0.204749, 0, 0.6156863, 1, 1,
0.1745387, 1.636757, -1.126159, 0, 0.6117647, 1, 1,
0.1798081, 1.636877, -0.533312, 0, 0.6039216, 1, 1,
0.1815201, -0.9767709, 2.503103, 0, 0.5960785, 1, 1,
0.1816269, -0.5095003, 3.688658, 0, 0.5921569, 1, 1,
0.1821844, -0.3304819, 1.902756, 0, 0.5843138, 1, 1,
0.1866129, 0.5462674, -0.03213123, 0, 0.5803922, 1, 1,
0.1933431, -1.811689, 1.148462, 0, 0.572549, 1, 1,
0.1950663, 0.4229704, 0.7220398, 0, 0.5686275, 1, 1,
0.1966432, -1.707536, 3.386003, 0, 0.5607843, 1, 1,
0.2009317, 0.652572, 0.06702158, 0, 0.5568628, 1, 1,
0.2026005, -0.8560137, 0.5021279, 0, 0.5490196, 1, 1,
0.2054682, -1.601364, 3.535635, 0, 0.5450981, 1, 1,
0.2054848, 1.216304, -1.536338, 0, 0.5372549, 1, 1,
0.2057896, 0.1804114, 0.4930483, 0, 0.5333334, 1, 1,
0.2155967, -1.409972, 3.36021, 0, 0.5254902, 1, 1,
0.218067, 1.607376, -1.123408, 0, 0.5215687, 1, 1,
0.2195069, 0.7979308, 2.570745, 0, 0.5137255, 1, 1,
0.2217721, 0.04998529, 1.642267, 0, 0.509804, 1, 1,
0.2241301, 2.374194, 0.02303362, 0, 0.5019608, 1, 1,
0.2253501, -2.710189, 2.088682, 0, 0.4941176, 1, 1,
0.2315626, -0.08907101, 0.2621315, 0, 0.4901961, 1, 1,
0.2391287, 1.110814, -0.6526399, 0, 0.4823529, 1, 1,
0.2428583, -0.5504912, 3.158196, 0, 0.4784314, 1, 1,
0.2430208, 0.8979518, 1.828056, 0, 0.4705882, 1, 1,
0.2463396, 0.09915069, 1.98253, 0, 0.4666667, 1, 1,
0.2473961, -1.287149, 2.414831, 0, 0.4588235, 1, 1,
0.2480299, 1.305729, -0.02629383, 0, 0.454902, 1, 1,
0.2508242, 0.2075575, 1.334853, 0, 0.4470588, 1, 1,
0.255052, 1.225709, -1.208499, 0, 0.4431373, 1, 1,
0.2597422, 1.440636, -0.316361, 0, 0.4352941, 1, 1,
0.260289, -1.90612, 2.219135, 0, 0.4313726, 1, 1,
0.261287, 0.61908, 0.5597579, 0, 0.4235294, 1, 1,
0.2636401, 0.5072283, -0.1926906, 0, 0.4196078, 1, 1,
0.2681931, 1.507498, -1.292318, 0, 0.4117647, 1, 1,
0.2683611, -1.400609, 3.380503, 0, 0.4078431, 1, 1,
0.2706292, 0.7623954, 1.903525, 0, 0.4, 1, 1,
0.2739237, 0.2304043, 0.861155, 0, 0.3921569, 1, 1,
0.2821847, -1.460181, 1.65593, 0, 0.3882353, 1, 1,
0.2832011, -2.052178, 2.554775, 0, 0.3803922, 1, 1,
0.2834663, 0.739962, -0.5858679, 0, 0.3764706, 1, 1,
0.2836275, -2.641125, 2.705527, 0, 0.3686275, 1, 1,
0.2858289, -0.2798106, 3.103126, 0, 0.3647059, 1, 1,
0.2875831, -1.041838, 2.685489, 0, 0.3568628, 1, 1,
0.2942745, 1.343242, 0.2035227, 0, 0.3529412, 1, 1,
0.2949077, 1.020129, 1.96679, 0, 0.345098, 1, 1,
0.2969291, 0.1027324, 1.886255, 0, 0.3411765, 1, 1,
0.2973546, -1.273025, 0.9793959, 0, 0.3333333, 1, 1,
0.3035482, 0.8550633, 0.6583127, 0, 0.3294118, 1, 1,
0.3040026, -2.557693, 3.891104, 0, 0.3215686, 1, 1,
0.3065808, 0.2652421, 1.542839, 0, 0.3176471, 1, 1,
0.3113266, -0.9905404, 2.126153, 0, 0.3098039, 1, 1,
0.3122368, 0.2363376, 0.4991833, 0, 0.3058824, 1, 1,
0.3138652, -0.1843754, 2.022171, 0, 0.2980392, 1, 1,
0.3142096, -0.3078101, 1.350709, 0, 0.2901961, 1, 1,
0.3146529, 1.499502, 0.7444049, 0, 0.2862745, 1, 1,
0.3159271, -0.4517644, 3.271518, 0, 0.2784314, 1, 1,
0.3167495, 0.6552525, 0.8051482, 0, 0.2745098, 1, 1,
0.3172621, -0.9166337, 4.461076, 0, 0.2666667, 1, 1,
0.3176874, -0.0215401, 1.804234, 0, 0.2627451, 1, 1,
0.32304, -0.2473602, 1.896402, 0, 0.254902, 1, 1,
0.3252581, 0.001155195, 1.552859, 0, 0.2509804, 1, 1,
0.3260186, -0.8933119, 2.61121, 0, 0.2431373, 1, 1,
0.326776, 0.1989955, -0.1871028, 0, 0.2392157, 1, 1,
0.3274789, -1.732729, 2.403067, 0, 0.2313726, 1, 1,
0.3296335, 0.01794225, 0.2497277, 0, 0.227451, 1, 1,
0.3402993, -0.7504395, 1.46212, 0, 0.2196078, 1, 1,
0.3423034, -1.558192, 4.371283, 0, 0.2156863, 1, 1,
0.3456755, -0.5380829, 1.772418, 0, 0.2078431, 1, 1,
0.3475313, 0.2107463, 1.11025, 0, 0.2039216, 1, 1,
0.3523726, 1.464092, 1.748817, 0, 0.1960784, 1, 1,
0.3537712, -0.3249765, -0.505048, 0, 0.1882353, 1, 1,
0.3576535, -1.317704, 3.847369, 0, 0.1843137, 1, 1,
0.3584088, -0.9640953, 3.692725, 0, 0.1764706, 1, 1,
0.3607807, -0.8473116, 4.394915, 0, 0.172549, 1, 1,
0.3624643, -1.013208, 2.759494, 0, 0.1647059, 1, 1,
0.3631218, 0.4657072, 1.391325, 0, 0.1607843, 1, 1,
0.3676848, -1.307139, 3.737327, 0, 0.1529412, 1, 1,
0.3764594, 2.087013, -0.01315488, 0, 0.1490196, 1, 1,
0.3888598, -0.02896773, 1.032053, 0, 0.1411765, 1, 1,
0.3934391, 0.5752833, -0.2249797, 0, 0.1372549, 1, 1,
0.3976809, -0.1356563, 3.334164, 0, 0.1294118, 1, 1,
0.402799, 1.154133, 1.392449, 0, 0.1254902, 1, 1,
0.4030061, 0.6387812, 1.37788, 0, 0.1176471, 1, 1,
0.4094869, 0.2435049, 1.132242, 0, 0.1137255, 1, 1,
0.4124024, 1.079426, -2.113823, 0, 0.1058824, 1, 1,
0.4154029, 0.06324136, 1.739127, 0, 0.09803922, 1, 1,
0.4199298, -2.332778, 3.72058, 0, 0.09411765, 1, 1,
0.4217804, 1.12379, 1.994383, 0, 0.08627451, 1, 1,
0.4226705, 0.2753208, 0.9114953, 0, 0.08235294, 1, 1,
0.4241506, 1.326407, -0.568417, 0, 0.07450981, 1, 1,
0.4293565, -1.042781, 4.504563, 0, 0.07058824, 1, 1,
0.4306248, 1.565677, -0.09531283, 0, 0.0627451, 1, 1,
0.4354108, -1.528092, 2.897881, 0, 0.05882353, 1, 1,
0.4354902, 0.05060887, 3.051909, 0, 0.05098039, 1, 1,
0.4380794, 1.805347, 0.2226641, 0, 0.04705882, 1, 1,
0.442421, 0.9193298, -1.42928, 0, 0.03921569, 1, 1,
0.4441056, -0.8381044, 3.478376, 0, 0.03529412, 1, 1,
0.4474255, 1.66307, -0.6476958, 0, 0.02745098, 1, 1,
0.4479403, -1.404554, 2.921029, 0, 0.02352941, 1, 1,
0.4490573, 1.001822, -0.6387297, 0, 0.01568628, 1, 1,
0.4501686, 0.4593015, 1.762449, 0, 0.01176471, 1, 1,
0.4561971, 0.7663873, 2.928705, 0, 0.003921569, 1, 1,
0.4611613, -1.064904, 3.13559, 0.003921569, 0, 1, 1,
0.4613751, 2.49529, -0.09436791, 0.007843138, 0, 1, 1,
0.4660238, -0.04266142, 1.354908, 0.01568628, 0, 1, 1,
0.4682865, -0.1925903, 1.99493, 0.01960784, 0, 1, 1,
0.4709819, -0.9355233, 2.11466, 0.02745098, 0, 1, 1,
0.4709862, -0.335173, 2.165306, 0.03137255, 0, 1, 1,
0.4740419, -0.4156057, 1.701342, 0.03921569, 0, 1, 1,
0.4748915, -1.786135, 2.829857, 0.04313726, 0, 1, 1,
0.475224, -0.7330613, 3.980576, 0.05098039, 0, 1, 1,
0.47987, 1.475912, 1.69869, 0.05490196, 0, 1, 1,
0.4801684, 0.6228693, -1.396933, 0.0627451, 0, 1, 1,
0.4839454, -0.003827374, 1.484821, 0.06666667, 0, 1, 1,
0.4841438, 0.00928851, 0.6561439, 0.07450981, 0, 1, 1,
0.4903927, -0.237722, 4.450681, 0.07843138, 0, 1, 1,
0.4906012, 1.434808, 0.2783627, 0.08627451, 0, 1, 1,
0.4914864, -0.2715431, 1.407877, 0.09019608, 0, 1, 1,
0.494033, -2.144599, 2.063225, 0.09803922, 0, 1, 1,
0.4962953, 0.2776687, -0.8046002, 0.1058824, 0, 1, 1,
0.5016266, -2.05849, 1.806802, 0.1098039, 0, 1, 1,
0.5027372, -1.633902, 2.682838, 0.1176471, 0, 1, 1,
0.5063683, -1.605867, 2.086513, 0.1215686, 0, 1, 1,
0.5121086, 0.5049087, 2.31428, 0.1294118, 0, 1, 1,
0.516354, -0.6757476, 2.15882, 0.1333333, 0, 1, 1,
0.5169261, 0.9781445, 1.644393, 0.1411765, 0, 1, 1,
0.5186711, 0.6981506, 0.7077723, 0.145098, 0, 1, 1,
0.5217509, 2.879606, 1.830759, 0.1529412, 0, 1, 1,
0.5226911, 1.319258, 1.117252, 0.1568628, 0, 1, 1,
0.5238518, 0.4728222, 1.18117, 0.1647059, 0, 1, 1,
0.5257443, 0.3458502, 1.353619, 0.1686275, 0, 1, 1,
0.5305694, -0.2421516, 1.750321, 0.1764706, 0, 1, 1,
0.5307047, -0.7216228, 0.7535161, 0.1803922, 0, 1, 1,
0.5342559, -0.2919999, 2.361855, 0.1882353, 0, 1, 1,
0.5369675, -1.961576, 4.384387, 0.1921569, 0, 1, 1,
0.537214, -0.4256533, 1.847048, 0.2, 0, 1, 1,
0.5432168, -0.2041151, 3.580886, 0.2078431, 0, 1, 1,
0.5476238, -0.6258499, 3.159787, 0.2117647, 0, 1, 1,
0.5480085, -0.2191962, 1.916495, 0.2196078, 0, 1, 1,
0.555074, 0.5155531, 0.7434835, 0.2235294, 0, 1, 1,
0.5591172, 0.1440164, 0.1924581, 0.2313726, 0, 1, 1,
0.5601747, -1.069896, 1.878255, 0.2352941, 0, 1, 1,
0.5634326, 0.01615529, 2.441812, 0.2431373, 0, 1, 1,
0.5654155, -0.1502119, 2.089679, 0.2470588, 0, 1, 1,
0.5712771, -0.1028896, 2.57879, 0.254902, 0, 1, 1,
0.5721383, 1.425076, 1.814216, 0.2588235, 0, 1, 1,
0.5757372, -0.7869136, 2.776867, 0.2666667, 0, 1, 1,
0.5771862, 0.6760795, -0.3618318, 0.2705882, 0, 1, 1,
0.5873175, -0.6038516, 0.9065967, 0.2784314, 0, 1, 1,
0.5905794, -0.6372386, 2.458498, 0.282353, 0, 1, 1,
0.5907348, 0.9272429, 1.028018, 0.2901961, 0, 1, 1,
0.5953081, 1.160982, -0.3137394, 0.2941177, 0, 1, 1,
0.5983571, -1.655216, 2.867064, 0.3019608, 0, 1, 1,
0.5995947, 1.605121, 1.323678, 0.3098039, 0, 1, 1,
0.6017046, 0.5638707, 0.7529042, 0.3137255, 0, 1, 1,
0.6067849, 0.3449991, 1.821243, 0.3215686, 0, 1, 1,
0.6077343, -0.9622307, 2.483903, 0.3254902, 0, 1, 1,
0.6096852, -1.100379, 2.344817, 0.3333333, 0, 1, 1,
0.6127535, 0.7680333, -0.6151733, 0.3372549, 0, 1, 1,
0.6138536, -0.1180019, 3.220325, 0.345098, 0, 1, 1,
0.6205798, -1.367016, 3.309245, 0.3490196, 0, 1, 1,
0.6230844, -0.5766201, 2.888086, 0.3568628, 0, 1, 1,
0.6260871, 2.193088, -0.6589584, 0.3607843, 0, 1, 1,
0.6278335, 1.565593, 0.2961775, 0.3686275, 0, 1, 1,
0.629135, -1.391556, 2.96068, 0.372549, 0, 1, 1,
0.6370804, -1.280644, 2.960634, 0.3803922, 0, 1, 1,
0.6386347, -0.1930979, 2.267175, 0.3843137, 0, 1, 1,
0.640627, 0.2622162, -1.914118, 0.3921569, 0, 1, 1,
0.6417444, 0.706175, 0.2556383, 0.3960784, 0, 1, 1,
0.6440647, 1.3683, -0.1334519, 0.4039216, 0, 1, 1,
0.6483753, -0.7563051, 4.095931, 0.4117647, 0, 1, 1,
0.6537275, -0.4427381, 2.169886, 0.4156863, 0, 1, 1,
0.6549628, -1.266685, 4.822792, 0.4235294, 0, 1, 1,
0.6550822, 0.1975486, 1.186679, 0.427451, 0, 1, 1,
0.6554989, -0.591813, 1.531053, 0.4352941, 0, 1, 1,
0.6631151, -0.7689645, 1.806312, 0.4392157, 0, 1, 1,
0.6642781, -0.4786648, 1.218261, 0.4470588, 0, 1, 1,
0.6665616, 0.103809, -0.2312893, 0.4509804, 0, 1, 1,
0.6693624, 0.6768684, -0.680121, 0.4588235, 0, 1, 1,
0.6696267, -0.3470167, 2.997037, 0.4627451, 0, 1, 1,
0.6720303, -0.4114206, 2.343549, 0.4705882, 0, 1, 1,
0.6721436, 0.5168382, 3.96145, 0.4745098, 0, 1, 1,
0.6746356, 1.054487, 0.1363971, 0.4823529, 0, 1, 1,
0.6752532, -0.5786976, 1.597943, 0.4862745, 0, 1, 1,
0.6801562, 1.211897, -1.561213, 0.4941176, 0, 1, 1,
0.6816655, 0.4149488, 1.16555, 0.5019608, 0, 1, 1,
0.6910585, -1.837758, 3.53278, 0.5058824, 0, 1, 1,
0.6934897, 0.4514257, 3.278345, 0.5137255, 0, 1, 1,
0.7007694, 0.9928543, 2.659343, 0.5176471, 0, 1, 1,
0.700869, 0.7003328, 1.532375, 0.5254902, 0, 1, 1,
0.7024246, -2.079726, 4.470263, 0.5294118, 0, 1, 1,
0.7027272, -1.215178, 2.83706, 0.5372549, 0, 1, 1,
0.7065992, 0.4204943, -0.06525842, 0.5411765, 0, 1, 1,
0.7085392, 0.7112154, 1.40548, 0.5490196, 0, 1, 1,
0.7189307, 0.5994862, 0.2681534, 0.5529412, 0, 1, 1,
0.7218933, -0.5092096, 0.7564484, 0.5607843, 0, 1, 1,
0.7324409, 0.1916865, 0.5363671, 0.5647059, 0, 1, 1,
0.7344046, -1.321725, 1.556231, 0.572549, 0, 1, 1,
0.7425057, -0.2374326, 1.874007, 0.5764706, 0, 1, 1,
0.745319, 0.1699945, 3.0909, 0.5843138, 0, 1, 1,
0.7464022, -0.2911615, 2.563367, 0.5882353, 0, 1, 1,
0.7476026, -1.449259, 2.938115, 0.5960785, 0, 1, 1,
0.7478268, 1.516676, -0.5363646, 0.6039216, 0, 1, 1,
0.7528597, -0.2377816, 2.654159, 0.6078432, 0, 1, 1,
0.7546477, -1.541482, 1.83434, 0.6156863, 0, 1, 1,
0.7693698, 1.615298, 0.331852, 0.6196079, 0, 1, 1,
0.7772912, 0.9221094, -0.485659, 0.627451, 0, 1, 1,
0.7779618, -0.1031085, 1.647907, 0.6313726, 0, 1, 1,
0.7796509, -1.02818, 3.421873, 0.6392157, 0, 1, 1,
0.7808558, 0.01669171, 2.528094, 0.6431373, 0, 1, 1,
0.7812761, 1.301986, 0.5749335, 0.6509804, 0, 1, 1,
0.7867585, -0.01959661, 1.461209, 0.654902, 0, 1, 1,
0.7914079, -0.1603597, 3.447603, 0.6627451, 0, 1, 1,
0.792799, -0.4373544, 0.5816441, 0.6666667, 0, 1, 1,
0.7961964, 1.2614, -0.2923525, 0.6745098, 0, 1, 1,
0.801301, 0.7866317, 1.122963, 0.6784314, 0, 1, 1,
0.8074316, 0.04763021, 0.6039371, 0.6862745, 0, 1, 1,
0.8109162, 1.625441, -0.8716578, 0.6901961, 0, 1, 1,
0.8214887, -0.49066, 3.238959, 0.6980392, 0, 1, 1,
0.8230614, -0.4630069, 2.065332, 0.7058824, 0, 1, 1,
0.824479, -0.8430907, 1.885879, 0.7098039, 0, 1, 1,
0.8262631, -2.336766, 0.7080534, 0.7176471, 0, 1, 1,
0.8272738, -0.3518029, 2.521006, 0.7215686, 0, 1, 1,
0.8280075, -0.9591056, 3.733202, 0.7294118, 0, 1, 1,
0.8285694, -0.2225709, 1.1732, 0.7333333, 0, 1, 1,
0.8329793, 0.7762703, -1.912412, 0.7411765, 0, 1, 1,
0.8340309, -0.6090636, 1.16562, 0.7450981, 0, 1, 1,
0.8367388, -0.9816799, 1.938249, 0.7529412, 0, 1, 1,
0.8400701, 0.105778, 2.543465, 0.7568628, 0, 1, 1,
0.843101, -0.8440108, 2.214811, 0.7647059, 0, 1, 1,
0.8443505, 0.4366823, 1.770454, 0.7686275, 0, 1, 1,
0.8457655, 0.2475739, 3.230695, 0.7764706, 0, 1, 1,
0.8510072, 0.5377944, 1.256516, 0.7803922, 0, 1, 1,
0.8538256, 0.2562487, 0.7838268, 0.7882353, 0, 1, 1,
0.855853, 0.9444614, 1.522757, 0.7921569, 0, 1, 1,
0.8560089, 0.8287697, 1.337894, 0.8, 0, 1, 1,
0.857976, 0.08948039, 2.212654, 0.8078431, 0, 1, 1,
0.8596615, -2.078431, 2.676723, 0.8117647, 0, 1, 1,
0.8613248, -1.018193, 1.52442, 0.8196079, 0, 1, 1,
0.870033, -0.8551264, 3.546042, 0.8235294, 0, 1, 1,
0.874375, -1.593325, 2.817606, 0.8313726, 0, 1, 1,
0.87488, 0.4936195, 1.047039, 0.8352941, 0, 1, 1,
0.8861231, 1.322224, 0.861838, 0.8431373, 0, 1, 1,
0.8877066, -0.5261115, 3.280902, 0.8470588, 0, 1, 1,
0.8900122, 0.06547921, 1.136157, 0.854902, 0, 1, 1,
0.8925941, -0.268326, 1.638554, 0.8588235, 0, 1, 1,
0.8951426, 0.3351723, 1.95198, 0.8666667, 0, 1, 1,
0.8959988, 0.3012862, 2.541657, 0.8705882, 0, 1, 1,
0.89896, 0.9719958, 1.832127, 0.8784314, 0, 1, 1,
0.9013768, -0.1653898, 2.729704, 0.8823529, 0, 1, 1,
0.9016049, 0.2115136, 0.6658629, 0.8901961, 0, 1, 1,
0.9026176, 1.552905, -0.008031788, 0.8941177, 0, 1, 1,
0.9026389, 0.735993, 1.35556, 0.9019608, 0, 1, 1,
0.9027183, -1.119268, 1.72636, 0.9098039, 0, 1, 1,
0.9098935, -0.5294038, 0.6201912, 0.9137255, 0, 1, 1,
0.9136699, 0.3780331, 1.037944, 0.9215686, 0, 1, 1,
0.9211872, 2.376489, 0.7148693, 0.9254902, 0, 1, 1,
0.9270266, 0.01435523, 0.8641961, 0.9333333, 0, 1, 1,
0.9285997, 0.5324981, 1.774271, 0.9372549, 0, 1, 1,
0.9437286, -0.4518152, 1.775203, 0.945098, 0, 1, 1,
0.9455163, -0.534266, 2.691357, 0.9490196, 0, 1, 1,
0.9535039, -1.61463, 2.631763, 0.9568627, 0, 1, 1,
0.9596003, -1.373944, 1.713484, 0.9607843, 0, 1, 1,
0.9602647, -0.4996759, 0.9283994, 0.9686275, 0, 1, 1,
0.9717111, -1.187053, 1.755577, 0.972549, 0, 1, 1,
0.9790889, 0.05991574, 0.9022176, 0.9803922, 0, 1, 1,
0.9827402, 0.8875759, 0.968365, 0.9843137, 0, 1, 1,
0.9838344, -1.571654, 2.533632, 0.9921569, 0, 1, 1,
0.9848318, 0.538379, 1.32214, 0.9960784, 0, 1, 1,
0.9855345, -0.9037325, 1.170829, 1, 0, 0.9960784, 1,
0.9856699, 0.6480726, 1.753178, 1, 0, 0.9882353, 1,
0.9871348, -0.9747609, 2.559957, 1, 0, 0.9843137, 1,
0.9918013, 0.003322988, 2.712388, 1, 0, 0.9764706, 1,
0.9928569, 0.6685733, -0.3233603, 1, 0, 0.972549, 1,
1.009566, -0.7364098, 4.526796, 1, 0, 0.9647059, 1,
1.011097, 1.887276, 0.4521386, 1, 0, 0.9607843, 1,
1.019083, -0.7256971, 2.692262, 1, 0, 0.9529412, 1,
1.019339, -0.3740396, 3.242115, 1, 0, 0.9490196, 1,
1.021382, 0.2199085, 0.6425004, 1, 0, 0.9411765, 1,
1.02969, 0.0536494, -0.05076185, 1, 0, 0.9372549, 1,
1.043031, 1.265759, 3.767819, 1, 0, 0.9294118, 1,
1.055987, -0.9371613, 2.590371, 1, 0, 0.9254902, 1,
1.063342, 0.5309905, 2.183492, 1, 0, 0.9176471, 1,
1.06674, -1.044208, 4.091137, 1, 0, 0.9137255, 1,
1.075711, -0.6772779, 2.353461, 1, 0, 0.9058824, 1,
1.075753, -0.9194514, 1.451982, 1, 0, 0.9019608, 1,
1.07629, 0.9553603, 2.65294, 1, 0, 0.8941177, 1,
1.077406, -0.2792274, 1.907821, 1, 0, 0.8862745, 1,
1.087748, -1.847639, 3.360007, 1, 0, 0.8823529, 1,
1.09041, 1.241048, 1.060529, 1, 0, 0.8745098, 1,
1.09489, -0.9835091, 1.969719, 1, 0, 0.8705882, 1,
1.09661, 0.6507453, 1.46989, 1, 0, 0.8627451, 1,
1.102715, -0.1597451, 1.542438, 1, 0, 0.8588235, 1,
1.106307, -0.8458551, 2.413966, 1, 0, 0.8509804, 1,
1.10711, -1.228259, 0.829736, 1, 0, 0.8470588, 1,
1.109863, 1.772985, -0.6648253, 1, 0, 0.8392157, 1,
1.110646, 0.2323718, 1.595478, 1, 0, 0.8352941, 1,
1.115198, 0.8995509, 0.7735133, 1, 0, 0.827451, 1,
1.127101, 0.9145935, 0.4406739, 1, 0, 0.8235294, 1,
1.134026, 0.1713198, 1.410558, 1, 0, 0.8156863, 1,
1.137119, 1.06511, -0.547468, 1, 0, 0.8117647, 1,
1.138414, 0.9234025, 0.7255998, 1, 0, 0.8039216, 1,
1.138802, -1.607522, 1.459819, 1, 0, 0.7960784, 1,
1.14027, -0.8208489, 1.985028, 1, 0, 0.7921569, 1,
1.141541, 0.3360327, 0.1106402, 1, 0, 0.7843137, 1,
1.142262, -2.02615, 2.538728, 1, 0, 0.7803922, 1,
1.146382, 0.3818467, -0.405566, 1, 0, 0.772549, 1,
1.148647, 0.5020438, 1.825636, 1, 0, 0.7686275, 1,
1.159994, 0.08789486, 1.53678, 1, 0, 0.7607843, 1,
1.164916, -0.7539691, 3.08085, 1, 0, 0.7568628, 1,
1.167479, -1.008534, 2.121696, 1, 0, 0.7490196, 1,
1.167907, -1.287935, 3.589787, 1, 0, 0.7450981, 1,
1.169068, -0.1399485, 0.4926094, 1, 0, 0.7372549, 1,
1.176407, -1.602629, 1.842347, 1, 0, 0.7333333, 1,
1.17835, 0.6803665, 0.1094159, 1, 0, 0.7254902, 1,
1.180704, 0.8287645, 1.92096, 1, 0, 0.7215686, 1,
1.18945, 0.7084506, 0.9421778, 1, 0, 0.7137255, 1,
1.190981, -1.31563, 1.961606, 1, 0, 0.7098039, 1,
1.192346, 0.5404105, 0.02355761, 1, 0, 0.7019608, 1,
1.192965, -1.721021, 2.207411, 1, 0, 0.6941177, 1,
1.201803, 0.825794, 0.3167953, 1, 0, 0.6901961, 1,
1.202731, -0.5272643, 0.3955833, 1, 0, 0.682353, 1,
1.211457, -1.966812, 1.408144, 1, 0, 0.6784314, 1,
1.213027, -0.8543099, 2.427234, 1, 0, 0.6705883, 1,
1.21332, -0.8765208, 1.48616, 1, 0, 0.6666667, 1,
1.215819, -1.761292, 4.806369, 1, 0, 0.6588235, 1,
1.22353, -0.803439, 1.272217, 1, 0, 0.654902, 1,
1.225572, 0.4240101, 1.855851, 1, 0, 0.6470588, 1,
1.233567, 0.4014827, 1.324618, 1, 0, 0.6431373, 1,
1.241165, 0.585486, 1.073584, 1, 0, 0.6352941, 1,
1.244135, 2.287881, 0.6108578, 1, 0, 0.6313726, 1,
1.245423, -0.4866954, 2.990483, 1, 0, 0.6235294, 1,
1.249646, -0.8674482, 0.8679645, 1, 0, 0.6196079, 1,
1.249992, -0.2977354, 2.811454, 1, 0, 0.6117647, 1,
1.252539, -0.3813658, 2.742342, 1, 0, 0.6078432, 1,
1.261269, 0.1335299, 0.9861632, 1, 0, 0.6, 1,
1.26281, -0.3269923, 1.064944, 1, 0, 0.5921569, 1,
1.289556, -0.2460891, 1.203946, 1, 0, 0.5882353, 1,
1.292219, -0.6244277, 2.137976, 1, 0, 0.5803922, 1,
1.296838, -0.1174442, 3.97016, 1, 0, 0.5764706, 1,
1.303268, -1.09958, 0.8914266, 1, 0, 0.5686275, 1,
1.304658, 0.9059064, 0.7060959, 1, 0, 0.5647059, 1,
1.308595, -0.4192533, 2.526867, 1, 0, 0.5568628, 1,
1.312647, -1.346564, 3.017298, 1, 0, 0.5529412, 1,
1.3138, 1.21112, 0.2143523, 1, 0, 0.5450981, 1,
1.315803, 1.436451, 1.60176, 1, 0, 0.5411765, 1,
1.329594, 0.3141771, 1.150317, 1, 0, 0.5333334, 1,
1.337376, 0.5584267, 0.7893323, 1, 0, 0.5294118, 1,
1.33776, 0.4998722, 0.4770343, 1, 0, 0.5215687, 1,
1.337973, 0.5308172, 2.790138, 1, 0, 0.5176471, 1,
1.346886, -0.2611831, 3.481297, 1, 0, 0.509804, 1,
1.350489, -0.1272692, 1.587275, 1, 0, 0.5058824, 1,
1.355245, 0.443214, 3.374901, 1, 0, 0.4980392, 1,
1.357637, -0.3735782, 0.7522775, 1, 0, 0.4901961, 1,
1.357696, 0.4740478, 2.495804, 1, 0, 0.4862745, 1,
1.379989, -2.169825, 2.098369, 1, 0, 0.4784314, 1,
1.393475, -1.301452, 3.014561, 1, 0, 0.4745098, 1,
1.4096, 1.30824, -0.09867478, 1, 0, 0.4666667, 1,
1.414825, 0.5791, 2.246922, 1, 0, 0.4627451, 1,
1.416198, 0.3529398, 0.5783284, 1, 0, 0.454902, 1,
1.425431, -0.3477557, 1.772495, 1, 0, 0.4509804, 1,
1.427509, -1.258075, 0.9433547, 1, 0, 0.4431373, 1,
1.434657, 0.2096571, 1.280251, 1, 0, 0.4392157, 1,
1.435634, 0.03770049, 1.530143, 1, 0, 0.4313726, 1,
1.43774, -1.630137, 4.857306, 1, 0, 0.427451, 1,
1.440804, -0.8925197, 2.599823, 1, 0, 0.4196078, 1,
1.444758, -0.4176399, 3.880238, 1, 0, 0.4156863, 1,
1.450337, 0.0503941, 1.394054, 1, 0, 0.4078431, 1,
1.452672, -0.3305689, 1.574786, 1, 0, 0.4039216, 1,
1.484243, -0.2840791, -0.4538678, 1, 0, 0.3960784, 1,
1.496291, -1.67522, 1.936795, 1, 0, 0.3882353, 1,
1.508721, 0.9704653, 3.123534, 1, 0, 0.3843137, 1,
1.511038, -0.6140124, 1.327592, 1, 0, 0.3764706, 1,
1.513121, -0.5551207, 0.8598441, 1, 0, 0.372549, 1,
1.521484, 1.687153, 0.510502, 1, 0, 0.3647059, 1,
1.526583, -0.8852039, 2.363871, 1, 0, 0.3607843, 1,
1.528559, 0.8460084, 1.782462, 1, 0, 0.3529412, 1,
1.537918, -1.118131, 1.778109, 1, 0, 0.3490196, 1,
1.548433, 0.1514826, 2.211511, 1, 0, 0.3411765, 1,
1.554116, 1.111111, 1.439966, 1, 0, 0.3372549, 1,
1.562973, 0.06048894, 1.323039, 1, 0, 0.3294118, 1,
1.565744, 0.408672, 0.8863432, 1, 0, 0.3254902, 1,
1.578614, 0.6163635, 1.31498, 1, 0, 0.3176471, 1,
1.580045, 0.207377, -0.390332, 1, 0, 0.3137255, 1,
1.581044, -1.546417, 1.500054, 1, 0, 0.3058824, 1,
1.593035, -1.005873, 2.38416, 1, 0, 0.2980392, 1,
1.610132, -0.2705174, -0.8018987, 1, 0, 0.2941177, 1,
1.61116, -0.7215415, 1.73013, 1, 0, 0.2862745, 1,
1.611179, 0.9796566, 0.4798246, 1, 0, 0.282353, 1,
1.646781, 0.0799279, -0.2390886, 1, 0, 0.2745098, 1,
1.649425, 0.3676348, 1.49775, 1, 0, 0.2705882, 1,
1.662542, -0.2502146, 0.5707449, 1, 0, 0.2627451, 1,
1.66654, 1.070424, 0.6608074, 1, 0, 0.2588235, 1,
1.682561, 0.3316788, 2.730799, 1, 0, 0.2509804, 1,
1.686588, -1.20273, 2.270412, 1, 0, 0.2470588, 1,
1.697507, 0.8742172, -0.1059265, 1, 0, 0.2392157, 1,
1.703035, 1.598146, 2.17544, 1, 0, 0.2352941, 1,
1.729002, -0.4707043, 3.443665, 1, 0, 0.227451, 1,
1.73352, 0.3018811, 1.554633, 1, 0, 0.2235294, 1,
1.73568, 0.2309581, 1.00448, 1, 0, 0.2156863, 1,
1.744586, -0.1170582, 1.831699, 1, 0, 0.2117647, 1,
1.765846, -0.5723508, 2.087645, 1, 0, 0.2039216, 1,
1.781676, -0.2989458, 0.4284704, 1, 0, 0.1960784, 1,
1.797767, -0.492264, 1.576887, 1, 0, 0.1921569, 1,
1.801218, 0.7643547, 1.464036, 1, 0, 0.1843137, 1,
1.808107, -0.7580765, 0.5985617, 1, 0, 0.1803922, 1,
1.8173, 1.418683, 1.019176, 1, 0, 0.172549, 1,
1.831195, -0.07218643, 0.07191198, 1, 0, 0.1686275, 1,
1.836578, 0.08031818, 1.749746, 1, 0, 0.1607843, 1,
1.886758, 0.8782256, 0.8612491, 1, 0, 0.1568628, 1,
1.904927, 0.9155927, 1.443813, 1, 0, 0.1490196, 1,
1.950982, 0.7441283, 2.088104, 1, 0, 0.145098, 1,
1.981386, -0.07380455, 1.191619, 1, 0, 0.1372549, 1,
1.985879, -0.07824824, 1.235659, 1, 0, 0.1333333, 1,
1.992504, -0.4592336, 4.154281, 1, 0, 0.1254902, 1,
2.039857, 1.26293, 1.629208, 1, 0, 0.1215686, 1,
2.040194, 0.8183599, 1.747871, 1, 0, 0.1137255, 1,
2.044405, 0.07592369, 1.868221, 1, 0, 0.1098039, 1,
2.134312, -0.5402481, 2.095022, 1, 0, 0.1019608, 1,
2.140205, 1.091452, 1.853569, 1, 0, 0.09411765, 1,
2.147386, -0.9271584, 0.3085529, 1, 0, 0.09019608, 1,
2.232706, 0.5684781, 0.3438372, 1, 0, 0.08235294, 1,
2.238153, 0.08142008, 2.054404, 1, 0, 0.07843138, 1,
2.241745, -0.4375638, 1.389323, 1, 0, 0.07058824, 1,
2.313255, 1.372584, 1.342084, 1, 0, 0.06666667, 1,
2.381136, -0.2388655, 2.799144, 1, 0, 0.05882353, 1,
2.493312, 0.905358, 3.076519, 1, 0, 0.05490196, 1,
2.506092, -0.8003283, 0.9422673, 1, 0, 0.04705882, 1,
2.625047, 0.1065449, -0.07515313, 1, 0, 0.04313726, 1,
2.697326, -0.7198343, 0.8094772, 1, 0, 0.03529412, 1,
2.714602, -0.8630679, 1.907598, 1, 0, 0.03137255, 1,
2.764902, 0.9653794, 0.4345745, 1, 0, 0.02352941, 1,
2.893241, 0.8565605, 0.6189553, 1, 0, 0.01960784, 1,
3.132473, -1.059486, 0.2963152, 1, 0, 0.01176471, 1,
3.359689, 1.266772, 1.373036, 1, 0, 0.007843138, 1
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
0.09072888, -4.521422, -6.88039, 0, -0.5, 0.5, 0.5,
0.09072888, -4.521422, -6.88039, 1, -0.5, 0.5, 0.5,
0.09072888, -4.521422, -6.88039, 1, 1.5, 0.5, 0.5,
0.09072888, -4.521422, -6.88039, 0, 1.5, 0.5, 0.5
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
-4.286409, -0.1238226, -6.88039, 0, -0.5, 0.5, 0.5,
-4.286409, -0.1238226, -6.88039, 1, -0.5, 0.5, 0.5,
-4.286409, -0.1238226, -6.88039, 1, 1.5, 0.5, 0.5,
-4.286409, -0.1238226, -6.88039, 0, 1.5, 0.5, 0.5
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
-4.286409, -4.521422, -0.1499393, 0, -0.5, 0.5, 0.5,
-4.286409, -4.521422, -0.1499393, 1, -0.5, 0.5, 0.5,
-4.286409, -4.521422, -0.1499393, 1, 1.5, 0.5, 0.5,
-4.286409, -4.521422, -0.1499393, 0, 1.5, 0.5, 0.5
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
-3, -3.506592, -5.327209,
3, -3.506592, -5.327209,
-3, -3.506592, -5.327209,
-3, -3.67573, -5.586072,
-2, -3.506592, -5.327209,
-2, -3.67573, -5.586072,
-1, -3.506592, -5.327209,
-1, -3.67573, -5.586072,
0, -3.506592, -5.327209,
0, -3.67573, -5.586072,
1, -3.506592, -5.327209,
1, -3.67573, -5.586072,
2, -3.506592, -5.327209,
2, -3.67573, -5.586072,
3, -3.506592, -5.327209,
3, -3.67573, -5.586072
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
-3, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
-3, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
-3, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
-3, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5,
-2, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
-2, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
-2, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
-2, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5,
-1, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
-1, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
-1, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
-1, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5,
0, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
0, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
0, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
0, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5,
1, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
1, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
1, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
1, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5,
2, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
2, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
2, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
2, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5,
3, -4.014007, -6.103799, 0, -0.5, 0.5, 0.5,
3, -4.014007, -6.103799, 1, -0.5, 0.5, 0.5,
3, -4.014007, -6.103799, 1, 1.5, 0.5, 0.5,
3, -4.014007, -6.103799, 0, 1.5, 0.5, 0.5
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
-3.2763, -3, -5.327209,
-3.2763, 3, -5.327209,
-3.2763, -3, -5.327209,
-3.444652, -3, -5.586072,
-3.2763, -2, -5.327209,
-3.444652, -2, -5.586072,
-3.2763, -1, -5.327209,
-3.444652, -1, -5.586072,
-3.2763, 0, -5.327209,
-3.444652, 0, -5.586072,
-3.2763, 1, -5.327209,
-3.444652, 1, -5.586072,
-3.2763, 2, -5.327209,
-3.444652, 2, -5.586072,
-3.2763, 3, -5.327209,
-3.444652, 3, -5.586072
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
-3.781354, -3, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, -3, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, -3, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, -3, -6.103799, 0, 1.5, 0.5, 0.5,
-3.781354, -2, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, -2, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, -2, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, -2, -6.103799, 0, 1.5, 0.5, 0.5,
-3.781354, -1, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, -1, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, -1, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, -1, -6.103799, 0, 1.5, 0.5, 0.5,
-3.781354, 0, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, 0, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, 0, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, 0, -6.103799, 0, 1.5, 0.5, 0.5,
-3.781354, 1, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, 1, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, 1, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, 1, -6.103799, 0, 1.5, 0.5, 0.5,
-3.781354, 2, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, 2, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, 2, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, 2, -6.103799, 0, 1.5, 0.5, 0.5,
-3.781354, 3, -6.103799, 0, -0.5, 0.5, 0.5,
-3.781354, 3, -6.103799, 1, -0.5, 0.5, 0.5,
-3.781354, 3, -6.103799, 1, 1.5, 0.5, 0.5,
-3.781354, 3, -6.103799, 0, 1.5, 0.5, 0.5
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
-3.2763, -3.506592, -4,
-3.2763, -3.506592, 4,
-3.2763, -3.506592, -4,
-3.444652, -3.67573, -4,
-3.2763, -3.506592, -2,
-3.444652, -3.67573, -2,
-3.2763, -3.506592, 0,
-3.444652, -3.67573, 0,
-3.2763, -3.506592, 2,
-3.444652, -3.67573, 2,
-3.2763, -3.506592, 4,
-3.444652, -3.67573, 4
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
-3.781354, -4.014007, -4, 0, -0.5, 0.5, 0.5,
-3.781354, -4.014007, -4, 1, -0.5, 0.5, 0.5,
-3.781354, -4.014007, -4, 1, 1.5, 0.5, 0.5,
-3.781354, -4.014007, -4, 0, 1.5, 0.5, 0.5,
-3.781354, -4.014007, -2, 0, -0.5, 0.5, 0.5,
-3.781354, -4.014007, -2, 1, -0.5, 0.5, 0.5,
-3.781354, -4.014007, -2, 1, 1.5, 0.5, 0.5,
-3.781354, -4.014007, -2, 0, 1.5, 0.5, 0.5,
-3.781354, -4.014007, 0, 0, -0.5, 0.5, 0.5,
-3.781354, -4.014007, 0, 1, -0.5, 0.5, 0.5,
-3.781354, -4.014007, 0, 1, 1.5, 0.5, 0.5,
-3.781354, -4.014007, 0, 0, 1.5, 0.5, 0.5,
-3.781354, -4.014007, 2, 0, -0.5, 0.5, 0.5,
-3.781354, -4.014007, 2, 1, -0.5, 0.5, 0.5,
-3.781354, -4.014007, 2, 1, 1.5, 0.5, 0.5,
-3.781354, -4.014007, 2, 0, 1.5, 0.5, 0.5,
-3.781354, -4.014007, 4, 0, -0.5, 0.5, 0.5,
-3.781354, -4.014007, 4, 1, -0.5, 0.5, 0.5,
-3.781354, -4.014007, 4, 1, 1.5, 0.5, 0.5,
-3.781354, -4.014007, 4, 0, 1.5, 0.5, 0.5
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
-3.2763, -3.506592, -5.327209,
-3.2763, 3.258946, -5.327209,
-3.2763, -3.506592, 5.02733,
-3.2763, 3.258946, 5.02733,
-3.2763, -3.506592, -5.327209,
-3.2763, -3.506592, 5.02733,
-3.2763, 3.258946, -5.327209,
-3.2763, 3.258946, 5.02733,
-3.2763, -3.506592, -5.327209,
3.457758, -3.506592, -5.327209,
-3.2763, -3.506592, 5.02733,
3.457758, -3.506592, 5.02733,
-3.2763, 3.258946, -5.327209,
3.457758, 3.258946, -5.327209,
-3.2763, 3.258946, 5.02733,
3.457758, 3.258946, 5.02733,
3.457758, -3.506592, -5.327209,
3.457758, 3.258946, -5.327209,
3.457758, -3.506592, 5.02733,
3.457758, 3.258946, 5.02733,
3.457758, -3.506592, -5.327209,
3.457758, -3.506592, 5.02733,
3.457758, 3.258946, -5.327209,
3.457758, 3.258946, 5.02733
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
var radius = 7.520155;
var distance = 33.45802;
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
mvMatrix.translate( -0.09072888, 0.1238226, 0.1499393 );
mvMatrix.scale( 1.207435, 1.201817, 0.7852536 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.45802);
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
benodanil<-read.table("benodanil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benodanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'benodanil' not found
```

```r
y<-benodanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'benodanil' not found
```

```r
z<-benodanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'benodanil' not found
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
-3.178231, 1.527007, -2.024135, 0, 0, 1, 1, 1,
-2.835016, -0.1565535, -1.546741, 1, 0, 0, 1, 1,
-2.617687, -0.3099003, -2.348525, 1, 0, 0, 1, 1,
-2.537423, 1.165559, -1.459572, 1, 0, 0, 1, 1,
-2.528065, -0.644936, -3.274398, 1, 0, 0, 1, 1,
-2.379862, 1.480479, -0.3909327, 1, 0, 0, 1, 1,
-2.379678, -0.3677147, -0.4537796, 0, 0, 0, 1, 1,
-2.308219, 0.4250357, -1.014202, 0, 0, 0, 1, 1,
-2.265144, 0.2749572, -2.839821, 0, 0, 0, 1, 1,
-2.240913, -0.2407561, -1.492063, 0, 0, 0, 1, 1,
-2.21331, 1.889827, 0.06914565, 0, 0, 0, 1, 1,
-2.194036, 1.244497, -2.461713, 0, 0, 0, 1, 1,
-2.147597, -1.737589, -3.258507, 0, 0, 0, 1, 1,
-2.1331, 0.8486603, -2.362499, 1, 1, 1, 1, 1,
-2.132185, -0.7674634, -1.785649, 1, 1, 1, 1, 1,
-2.130113, 0.2545758, -2.657897, 1, 1, 1, 1, 1,
-2.095682, 1.272506, 1.902713, 1, 1, 1, 1, 1,
-2.08546, 1.013496, 0.1375027, 1, 1, 1, 1, 1,
-2.080261, -1.120638, -2.22157, 1, 1, 1, 1, 1,
-2.024624, -0.2319568, -0.4594369, 1, 1, 1, 1, 1,
-2.008042, 1.209738, -0.2918571, 1, 1, 1, 1, 1,
-1.99104, 1.407211, -2.576417, 1, 1, 1, 1, 1,
-1.956232, -0.4655814, -2.877067, 1, 1, 1, 1, 1,
-1.945913, 0.01384769, -0.4688125, 1, 1, 1, 1, 1,
-1.935336, -0.1648776, -2.062649, 1, 1, 1, 1, 1,
-1.924269, -1.546117, -1.29181, 1, 1, 1, 1, 1,
-1.883331, -0.1670995, -2.426518, 1, 1, 1, 1, 1,
-1.844304, 0.7115138, -2.450158, 1, 1, 1, 1, 1,
-1.811496, 0.943976, -0.875897, 0, 0, 1, 1, 1,
-1.803906, -1.147207, -3.083295, 1, 0, 0, 1, 1,
-1.788696, -0.06736068, -2.798663, 1, 0, 0, 1, 1,
-1.770015, 0.6299749, -1.650363, 1, 0, 0, 1, 1,
-1.766689, -0.9155791, -0.9433289, 1, 0, 0, 1, 1,
-1.76472, 0.1739645, -2.07591, 1, 0, 0, 1, 1,
-1.74389, -0.6860154, -2.209801, 0, 0, 0, 1, 1,
-1.74131, 0.1573632, -0.4735958, 0, 0, 0, 1, 1,
-1.736712, -1.543488, -1.534312, 0, 0, 0, 1, 1,
-1.714538, -0.3288824, -2.207452, 0, 0, 0, 1, 1,
-1.712239, 0.9586316, 0.03893348, 0, 0, 0, 1, 1,
-1.711668, -0.2946736, -3.044242, 0, 0, 0, 1, 1,
-1.641747, -0.1069621, -1.173793, 0, 0, 0, 1, 1,
-1.621186, 0.2786872, -1.335811, 1, 1, 1, 1, 1,
-1.618677, -0.1336169, -0.532154, 1, 1, 1, 1, 1,
-1.617009, 0.4570347, -1.154096, 1, 1, 1, 1, 1,
-1.609406, -0.2080475, -2.04659, 1, 1, 1, 1, 1,
-1.603096, 0.3230453, 0.1350311, 1, 1, 1, 1, 1,
-1.598401, -0.3619103, -1.658274, 1, 1, 1, 1, 1,
-1.595049, 0.08398218, -1.920699, 1, 1, 1, 1, 1,
-1.594956, 0.6026844, 0.926685, 1, 1, 1, 1, 1,
-1.587944, 0.2587409, -2.844625, 1, 1, 1, 1, 1,
-1.581532, 0.3877488, -0.9864379, 1, 1, 1, 1, 1,
-1.570346, -0.3748626, -1.410195, 1, 1, 1, 1, 1,
-1.553903, 0.9345372, -2.173933, 1, 1, 1, 1, 1,
-1.545819, -1.030839, -1.417093, 1, 1, 1, 1, 1,
-1.544902, -0.1825189, -0.7778974, 1, 1, 1, 1, 1,
-1.535745, 0.2407894, -0.7259059, 1, 1, 1, 1, 1,
-1.535439, 1.522099, -1.783144, 0, 0, 1, 1, 1,
-1.533553, -0.7149319, -1.209925, 1, 0, 0, 1, 1,
-1.522535, 1.043948, -0.8961443, 1, 0, 0, 1, 1,
-1.51725, -0.01650696, -1.534106, 1, 0, 0, 1, 1,
-1.496545, 1.358542, -1.345113, 1, 0, 0, 1, 1,
-1.495482, -0.1112713, -1.353251, 1, 0, 0, 1, 1,
-1.488963, 0.09322234, -2.776214, 0, 0, 0, 1, 1,
-1.488461, 0.2002491, -2.045523, 0, 0, 0, 1, 1,
-1.476952, 1.103787, 0.4132531, 0, 0, 0, 1, 1,
-1.460389, 2.165056, 0.1363032, 0, 0, 0, 1, 1,
-1.458964, -0.07723124, -0.9378592, 0, 0, 0, 1, 1,
-1.457164, 2.241822, -1.854551, 0, 0, 0, 1, 1,
-1.451579, -0.8060808, -1.912448, 0, 0, 0, 1, 1,
-1.445722, 1.366252, -2.466321, 1, 1, 1, 1, 1,
-1.441303, 1.104769, -2.097217, 1, 1, 1, 1, 1,
-1.41396, -1.586383, -1.856964, 1, 1, 1, 1, 1,
-1.409054, 0.08397054, -2.284574, 1, 1, 1, 1, 1,
-1.407004, 1.740987, -1.034822, 1, 1, 1, 1, 1,
-1.405219, 0.9035652, 0.04387039, 1, 1, 1, 1, 1,
-1.39686, 1.304806, -1.440911, 1, 1, 1, 1, 1,
-1.384395, 0.09400922, -1.122974, 1, 1, 1, 1, 1,
-1.374838, 1.098484, -1.209106, 1, 1, 1, 1, 1,
-1.371186, 0.3146567, -2.345382, 1, 1, 1, 1, 1,
-1.365295, -1.289363, -2.24709, 1, 1, 1, 1, 1,
-1.352643, -1.930582, -2.601419, 1, 1, 1, 1, 1,
-1.352013, 0.4875331, -1.771173, 1, 1, 1, 1, 1,
-1.340507, 1.638978, -1.042948, 1, 1, 1, 1, 1,
-1.337013, 0.1588842, -0.7564207, 1, 1, 1, 1, 1,
-1.33555, -2.563244, -3.518471, 0, 0, 1, 1, 1,
-1.333776, 0.2505019, -0.9910021, 1, 0, 0, 1, 1,
-1.323793, 0.03806012, -1.09868, 1, 0, 0, 1, 1,
-1.322891, 1.143367, -1.852852, 1, 0, 0, 1, 1,
-1.316708, 0.4707944, 0.4839296, 1, 0, 0, 1, 1,
-1.313697, 0.6092433, 0.817335, 1, 0, 0, 1, 1,
-1.310927, -0.00606018, -1.16508, 0, 0, 0, 1, 1,
-1.299818, 1.077557, -1.498956, 0, 0, 0, 1, 1,
-1.294946, -1.211354, -3.559327, 0, 0, 0, 1, 1,
-1.291168, 0.2554224, -0.5947251, 0, 0, 0, 1, 1,
-1.286659, 0.1528805, -3.032176, 0, 0, 0, 1, 1,
-1.27542, -1.68518, -1.176781, 0, 0, 0, 1, 1,
-1.26569, -0.6634986, -1.276662, 0, 0, 0, 1, 1,
-1.250328, 0.4362426, -0.6202078, 1, 1, 1, 1, 1,
-1.250174, 0.5743567, -1.478385, 1, 1, 1, 1, 1,
-1.240801, -0.6546625, -1.741114, 1, 1, 1, 1, 1,
-1.236076, -1.130625, -2.403531, 1, 1, 1, 1, 1,
-1.22398, 1.054078, -1.385385, 1, 1, 1, 1, 1,
-1.221761, 0.7335792, -1.618578, 1, 1, 1, 1, 1,
-1.221323, 1.227215, -1.77732, 1, 1, 1, 1, 1,
-1.214696, -0.3213428, -0.4876138, 1, 1, 1, 1, 1,
-1.213066, 0.5084348, 2.330197, 1, 1, 1, 1, 1,
-1.211653, -0.9983141, -3.142409, 1, 1, 1, 1, 1,
-1.207907, -1.673483, -3.133585, 1, 1, 1, 1, 1,
-1.203724, 0.6239257, 0.5832017, 1, 1, 1, 1, 1,
-1.197049, -1.558187, 1.552259, 1, 1, 1, 1, 1,
-1.193612, -0.5504586, -2.95545, 1, 1, 1, 1, 1,
-1.191801, -0.8771449, -2.260975, 1, 1, 1, 1, 1,
-1.185932, 0.6382638, -0.5739415, 0, 0, 1, 1, 1,
-1.177285, 1.005417, -0.6506678, 1, 0, 0, 1, 1,
-1.176068, -1.116977, -3.526719, 1, 0, 0, 1, 1,
-1.174422, -0.5233339, -1.698262, 1, 0, 0, 1, 1,
-1.170752, 0.7471452, -1.302675, 1, 0, 0, 1, 1,
-1.168776, 1.753919, -0.9913373, 1, 0, 0, 1, 1,
-1.167594, 1.490258, 0.1624848, 0, 0, 0, 1, 1,
-1.165732, 0.6993845, -1.751699, 0, 0, 0, 1, 1,
-1.164767, 0.2008412, -2.624091, 0, 0, 0, 1, 1,
-1.160276, 0.7900994, 0.1495739, 0, 0, 0, 1, 1,
-1.155009, -0.6152735, -0.803966, 0, 0, 0, 1, 1,
-1.147827, 0.05268952, -1.145407, 0, 0, 0, 1, 1,
-1.141699, 0.06972247, -0.6764903, 0, 0, 0, 1, 1,
-1.137524, 0.3449953, -0.6832443, 1, 1, 1, 1, 1,
-1.135193, -1.525332, -1.542467, 1, 1, 1, 1, 1,
-1.133226, -1.667544, -3.294745, 1, 1, 1, 1, 1,
-1.132039, 0.1536402, -3.17336, 1, 1, 1, 1, 1,
-1.128244, -1.812219, -2.176092, 1, 1, 1, 1, 1,
-1.126214, -0.8337312, -2.116075, 1, 1, 1, 1, 1,
-1.122438, 1.625813, 0.6211049, 1, 1, 1, 1, 1,
-1.114835, -0.2091286, -1.517461, 1, 1, 1, 1, 1,
-1.111329, 1.117457, -0.03943284, 1, 1, 1, 1, 1,
-1.111245, -1.258916, -1.809454, 1, 1, 1, 1, 1,
-1.104028, -0.2120454, -2.759234, 1, 1, 1, 1, 1,
-1.10177, -1.895637, -1.779968, 1, 1, 1, 1, 1,
-1.099523, -0.2533019, -2.209336, 1, 1, 1, 1, 1,
-1.099486, -2.243935, -2.595412, 1, 1, 1, 1, 1,
-1.086346, 0.5474856, -1.506591, 1, 1, 1, 1, 1,
-1.083446, 0.4109763, -2.585418, 0, 0, 1, 1, 1,
-1.078939, -0.4298773, -3.062325, 1, 0, 0, 1, 1,
-1.069458, 0.5128527, -1.46517, 1, 0, 0, 1, 1,
-1.055733, -0.01396799, -3.115679, 1, 0, 0, 1, 1,
-1.053069, 0.9812887, 0.7777666, 1, 0, 0, 1, 1,
-1.045541, -0.5525403, -1.125324, 1, 0, 0, 1, 1,
-1.044558, -0.4040394, -3.904597, 0, 0, 0, 1, 1,
-1.041407, 0.471866, -1.048235, 0, 0, 0, 1, 1,
-1.036666, -0.1439663, -2.748949, 0, 0, 0, 1, 1,
-1.035734, -0.1304324, -4.781559, 0, 0, 0, 1, 1,
-1.03024, -1.134866, -2.937536, 0, 0, 0, 1, 1,
-1.023967, 0.04109425, -1.221441, 0, 0, 0, 1, 1,
-1.018395, 0.7788902, -0.3352242, 0, 0, 0, 1, 1,
-1.004627, -1.715051, -2.793955, 1, 1, 1, 1, 1,
-0.9985185, 2.403778, -1.103984, 1, 1, 1, 1, 1,
-0.9974698, -0.1852113, -1.432066, 1, 1, 1, 1, 1,
-0.9903763, -0.6900526, -0.6354311, 1, 1, 1, 1, 1,
-0.9900441, 0.6243226, -2.277449, 1, 1, 1, 1, 1,
-0.9883807, -2.352045, -3.768294, 1, 1, 1, 1, 1,
-0.9872144, 0.5212544, -1.712652, 1, 1, 1, 1, 1,
-0.9821991, 1.089441, -0.2472322, 1, 1, 1, 1, 1,
-0.9785399, 0.4344296, -2.451849, 1, 1, 1, 1, 1,
-0.9784657, -0.5963492, -2.679577, 1, 1, 1, 1, 1,
-0.9745591, 2.135507, -0.5771817, 1, 1, 1, 1, 1,
-0.9741575, 2.283398, -2.393597, 1, 1, 1, 1, 1,
-0.9707503, 0.3874729, -0.9521072, 1, 1, 1, 1, 1,
-0.9614152, 0.4830703, 0.004724011, 1, 1, 1, 1, 1,
-0.9606653, -0.6238801, -3.095612, 1, 1, 1, 1, 1,
-0.9582846, -0.1086662, -2.046721, 0, 0, 1, 1, 1,
-0.9557149, -1.280563, -2.065993, 1, 0, 0, 1, 1,
-0.9548752, -0.3666928, -3.207788, 1, 0, 0, 1, 1,
-0.9521504, 0.8273627, 0.7302167, 1, 0, 0, 1, 1,
-0.949448, 1.234346, -0.01806032, 1, 0, 0, 1, 1,
-0.9345259, 0.546009, 0.4203849, 1, 0, 0, 1, 1,
-0.9317909, 1.131078, 0.7723755, 0, 0, 0, 1, 1,
-0.9308141, 1.968861, -0.4372192, 0, 0, 0, 1, 1,
-0.9305385, 1.371849, -0.243035, 0, 0, 0, 1, 1,
-0.9292156, 0.1386312, -1.213561, 0, 0, 0, 1, 1,
-0.9273026, 1.92563, 0.1946765, 0, 0, 0, 1, 1,
-0.9268333, 2.113195, -1.852461, 0, 0, 0, 1, 1,
-0.9262537, 1.758915, 0.9203368, 0, 0, 0, 1, 1,
-0.9092407, 0.1303945, -2.419585, 1, 1, 1, 1, 1,
-0.9029089, 0.4911178, -1.875658, 1, 1, 1, 1, 1,
-0.9001756, 2.06261, 1.024508, 1, 1, 1, 1, 1,
-0.899882, 1.654064, 0.4172382, 1, 1, 1, 1, 1,
-0.8997474, 1.58332, -1.254651, 1, 1, 1, 1, 1,
-0.8947911, 1.760387, -0.2428688, 1, 1, 1, 1, 1,
-0.8934224, 0.706426, -0.3579025, 1, 1, 1, 1, 1,
-0.8912965, 0.8651173, -1.47569, 1, 1, 1, 1, 1,
-0.881198, -0.1120419, -1.812924, 1, 1, 1, 1, 1,
-0.8795103, 1.08863, 0.7317176, 1, 1, 1, 1, 1,
-0.8761523, 1.26057, 0.351393, 1, 1, 1, 1, 1,
-0.8749214, 0.8224728, -1.354878, 1, 1, 1, 1, 1,
-0.8696265, 0.4002081, -2.107499, 1, 1, 1, 1, 1,
-0.857101, 0.2818711, -1.469294, 1, 1, 1, 1, 1,
-0.8545838, -0.09490788, -0.9565269, 1, 1, 1, 1, 1,
-0.853368, -0.3420838, -0.627526, 0, 0, 1, 1, 1,
-0.8510479, -0.2813972, -2.59743, 1, 0, 0, 1, 1,
-0.8476716, 1.278347, -2.543997, 1, 0, 0, 1, 1,
-0.8449221, 0.9943101, -0.6184791, 1, 0, 0, 1, 1,
-0.8419617, -0.2676765, 0.3489081, 1, 0, 0, 1, 1,
-0.8392967, 0.1330596, 0.4071172, 1, 0, 0, 1, 1,
-0.8329976, -1.277546, -2.545339, 0, 0, 0, 1, 1,
-0.8292795, 0.2878065, -0.07252526, 0, 0, 0, 1, 1,
-0.8234249, -0.224899, -0.5275014, 0, 0, 0, 1, 1,
-0.8229055, 0.1728451, -3.787203, 0, 0, 0, 1, 1,
-0.8196135, 1.376461, -0.002101633, 0, 0, 0, 1, 1,
-0.8188559, 0.3591115, -2.871644, 0, 0, 0, 1, 1,
-0.8155606, 0.6418039, -2.031987, 0, 0, 0, 1, 1,
-0.8143576, 0.1193581, -1.467664, 1, 1, 1, 1, 1,
-0.8107665, -0.9185098, -2.274309, 1, 1, 1, 1, 1,
-0.8083467, 1.629223, -1.459633, 1, 1, 1, 1, 1,
-0.8013079, 0.1706887, -0.9679583, 1, 1, 1, 1, 1,
-0.7994721, -1.567542, -1.293016, 1, 1, 1, 1, 1,
-0.7973398, -1.116082, -2.994279, 1, 1, 1, 1, 1,
-0.7971247, 0.5448282, -0.3234465, 1, 1, 1, 1, 1,
-0.7948858, 0.6667238, 0.5991884, 1, 1, 1, 1, 1,
-0.7887237, 1.04841, -0.1785621, 1, 1, 1, 1, 1,
-0.7873035, 0.05338389, -0.02451026, 1, 1, 1, 1, 1,
-0.7838837, -1.029132, -1.674304, 1, 1, 1, 1, 1,
-0.783285, -1.903169, -3.979715, 1, 1, 1, 1, 1,
-0.782918, -0.4280585, -1.249025, 1, 1, 1, 1, 1,
-0.7794701, 0.9475741, -1.566403, 1, 1, 1, 1, 1,
-0.7663745, 1.134191, -0.8224183, 1, 1, 1, 1, 1,
-0.7658517, -0.5045269, -3.392347, 0, 0, 1, 1, 1,
-0.7630668, -0.5040144, -1.620555, 1, 0, 0, 1, 1,
-0.7623577, 1.333429, -0.8332856, 1, 0, 0, 1, 1,
-0.7537914, 0.7186452, -2.248691, 1, 0, 0, 1, 1,
-0.7423544, -0.9821448, -1.190534, 1, 0, 0, 1, 1,
-0.74183, 0.6896493, -0.1080793, 1, 0, 0, 1, 1,
-0.7372653, -0.9540874, -3.562613, 0, 0, 0, 1, 1,
-0.7369089, 0.6410024, 0.3908428, 0, 0, 0, 1, 1,
-0.7328188, -2.324931, -3.80022, 0, 0, 0, 1, 1,
-0.7293431, -0.3730497, -2.447056, 0, 0, 0, 1, 1,
-0.7287932, 0.4552971, -0.8956486, 0, 0, 0, 1, 1,
-0.7237599, -0.05764194, -2.11625, 0, 0, 0, 1, 1,
-0.7210408, -0.5445355, -1.520173, 0, 0, 0, 1, 1,
-0.7202135, 0.9120102, -1.846675, 1, 1, 1, 1, 1,
-0.7164398, -0.2485381, -2.756784, 1, 1, 1, 1, 1,
-0.7163965, 0.1264046, -1.458108, 1, 1, 1, 1, 1,
-0.713904, -0.4172512, -1.634992, 1, 1, 1, 1, 1,
-0.7045745, -0.225202, -2.134938, 1, 1, 1, 1, 1,
-0.7025335, 1.918384, 0.06550209, 1, 1, 1, 1, 1,
-0.7021389, 0.6133206, -0.6972689, 1, 1, 1, 1, 1,
-0.6940718, 3.160419, -1.418281, 1, 1, 1, 1, 1,
-0.6764625, 0.4374158, -1.858647, 1, 1, 1, 1, 1,
-0.6753632, -0.090153, -3.759933, 1, 1, 1, 1, 1,
-0.6744247, -1.697403, -3.20036, 1, 1, 1, 1, 1,
-0.6691266, 1.394369, -1.373343, 1, 1, 1, 1, 1,
-0.6666431, 1.131639, -0.1741258, 1, 1, 1, 1, 1,
-0.665029, -0.09792206, -3.332382, 1, 1, 1, 1, 1,
-0.6611106, 0.3731461, -1.52681, 1, 1, 1, 1, 1,
-0.6599284, 1.473309, -0.8368767, 0, 0, 1, 1, 1,
-0.6588049, -0.3223135, -2.295871, 1, 0, 0, 1, 1,
-0.6546817, -0.1868847, -2.799074, 1, 0, 0, 1, 1,
-0.6544324, -0.5298605, -2.471829, 1, 0, 0, 1, 1,
-0.6528493, 1.43005, 0.7453363, 1, 0, 0, 1, 1,
-0.6513363, -0.2728087, -2.179297, 1, 0, 0, 1, 1,
-0.6493661, 1.500517, -1.871837, 0, 0, 0, 1, 1,
-0.6440901, 0.09577464, -2.065653, 0, 0, 0, 1, 1,
-0.6431348, 0.1909919, -0.1056236, 0, 0, 0, 1, 1,
-0.6385375, 0.05943611, -1.147646, 0, 0, 0, 1, 1,
-0.6384871, -0.1736922, -0.4358883, 0, 0, 0, 1, 1,
-0.6367425, 2.245632, -0.4439651, 0, 0, 0, 1, 1,
-0.6361486, -2.054049, -1.978255, 0, 0, 0, 1, 1,
-0.6297156, -0.3093238, -2.699097, 1, 1, 1, 1, 1,
-0.6280754, -0.2526748, -3.215939, 1, 1, 1, 1, 1,
-0.6271089, -0.5124971, -2.31581, 1, 1, 1, 1, 1,
-0.622239, 0.1186124, -0.4676027, 1, 1, 1, 1, 1,
-0.6215407, -1.625861, -2.781349, 1, 1, 1, 1, 1,
-0.6191982, -0.121149, -2.491991, 1, 1, 1, 1, 1,
-0.6186892, 0.04875885, 0.2549625, 1, 1, 1, 1, 1,
-0.6113569, -3.408064, -2.936541, 1, 1, 1, 1, 1,
-0.6047387, -0.340576, -0.3727774, 1, 1, 1, 1, 1,
-0.6026134, 2.431143, 0.965802, 1, 1, 1, 1, 1,
-0.6021871, 0.1572959, -1.838885, 1, 1, 1, 1, 1,
-0.6007318, 0.6093988, -0.7814949, 1, 1, 1, 1, 1,
-0.5972342, 1.316432, 0.8499332, 1, 1, 1, 1, 1,
-0.5953352, -0.5886668, -1.698858, 1, 1, 1, 1, 1,
-0.5927663, -0.7831618, -2.17418, 1, 1, 1, 1, 1,
-0.5826671, 0.9708992, -0.5905117, 0, 0, 1, 1, 1,
-0.5783861, 0.8988863, -0.808746, 1, 0, 0, 1, 1,
-0.5738457, -1.184252, -0.8843697, 1, 0, 0, 1, 1,
-0.5708296, -0.6997233, -2.294033, 1, 0, 0, 1, 1,
-0.567731, -0.2046834, -0.9825773, 1, 0, 0, 1, 1,
-0.5620531, -0.03599294, -1.302272, 1, 0, 0, 1, 1,
-0.5528347, -1.566616, -1.05259, 0, 0, 0, 1, 1,
-0.5508552, 2.307025, 0.3332785, 0, 0, 0, 1, 1,
-0.5476967, -1.550996, -0.7117256, 0, 0, 0, 1, 1,
-0.547027, 0.4393743, -1.388462, 0, 0, 0, 1, 1,
-0.5423735, -0.4347498, -3.893376, 0, 0, 0, 1, 1,
-0.5378936, -1.429178, -1.248865, 0, 0, 0, 1, 1,
-0.5370759, -0.2898673, -2.600066, 0, 0, 0, 1, 1,
-0.5366721, -0.209754, -0.9898711, 1, 1, 1, 1, 1,
-0.5258912, 1.116604, 0.1780413, 1, 1, 1, 1, 1,
-0.5228264, -0.5606126, -2.008153, 1, 1, 1, 1, 1,
-0.5204903, -0.1647025, -2.503089, 1, 1, 1, 1, 1,
-0.5200948, -0.4968091, -2.898196, 1, 1, 1, 1, 1,
-0.5200649, 2.921253, -0.379391, 1, 1, 1, 1, 1,
-0.5192263, -0.04471467, -0.311551, 1, 1, 1, 1, 1,
-0.5099104, 0.3344478, -0.849961, 1, 1, 1, 1, 1,
-0.5077454, -1.1507, -3.241777, 1, 1, 1, 1, 1,
-0.5061464, -0.5380642, -4.121394, 1, 1, 1, 1, 1,
-0.5060661, -0.02183855, -0.5316281, 1, 1, 1, 1, 1,
-0.5034588, 0.1518907, -1.178711, 1, 1, 1, 1, 1,
-0.5032412, -1.621369, -2.685546, 1, 1, 1, 1, 1,
-0.4990734, 0.06014525, -0.9397788, 1, 1, 1, 1, 1,
-0.4863177, 0.6915953, -0.4121685, 1, 1, 1, 1, 1,
-0.483688, -2.11206, -3.529183, 0, 0, 1, 1, 1,
-0.4803068, -0.0199181, -0.7483563, 1, 0, 0, 1, 1,
-0.4779659, 0.9247177, -1.043015, 1, 0, 0, 1, 1,
-0.477461, -0.01402306, -2.679447, 1, 0, 0, 1, 1,
-0.4734097, 0.994315, -0.5902302, 1, 0, 0, 1, 1,
-0.4697236, 0.8119424, -0.4505236, 1, 0, 0, 1, 1,
-0.4635879, 0.6459076, -0.5487282, 0, 0, 0, 1, 1,
-0.4634261, 0.6161719, 1.793233, 0, 0, 0, 1, 1,
-0.4609697, -0.3390913, -1.558513, 0, 0, 0, 1, 1,
-0.4590431, 0.2721215, -1.665964, 0, 0, 0, 1, 1,
-0.4550296, -0.1260963, -1.930145, 0, 0, 0, 1, 1,
-0.4539418, 0.1702501, -0.7188596, 0, 0, 0, 1, 1,
-0.4503554, -0.74978, -0.1738817, 0, 0, 0, 1, 1,
-0.4496697, 0.275155, -1.808682, 1, 1, 1, 1, 1,
-0.446423, -1.031786, -2.067881, 1, 1, 1, 1, 1,
-0.4463978, 0.969837, -1.213495, 1, 1, 1, 1, 1,
-0.4457991, -1.025061, -1.366202, 1, 1, 1, 1, 1,
-0.445132, -1.444408, -3.288857, 1, 1, 1, 1, 1,
-0.4436077, -0.2375447, -3.944137, 1, 1, 1, 1, 1,
-0.4420582, -1.454458, -4.933426, 1, 1, 1, 1, 1,
-0.4352778, -0.6003965, -1.303769, 1, 1, 1, 1, 1,
-0.4290591, 1.346521, -1.46444, 1, 1, 1, 1, 1,
-0.4274355, 1.269307, 1.072807, 1, 1, 1, 1, 1,
-0.4226729, 1.0877, -0.2044533, 1, 1, 1, 1, 1,
-0.4220573, 0.1685712, -0.7870995, 1, 1, 1, 1, 1,
-0.4209414, 0.01344649, -1.678703, 1, 1, 1, 1, 1,
-0.4177608, -1.140423, -4.371081, 1, 1, 1, 1, 1,
-0.4174585, -0.7358827, -3.079006, 1, 1, 1, 1, 1,
-0.4173996, 1.01281, 0.007781694, 0, 0, 1, 1, 1,
-0.4148886, 1.109372, 0.6050893, 1, 0, 0, 1, 1,
-0.4072304, 0.2253758, 0.3899766, 1, 0, 0, 1, 1,
-0.4005472, -0.2667013, -2.011811, 1, 0, 0, 1, 1,
-0.4000503, 0.3648772, -0.4585699, 1, 0, 0, 1, 1,
-0.3972177, -0.2588759, -2.921733, 1, 0, 0, 1, 1,
-0.3947394, 0.4741741, 1.35883, 0, 0, 0, 1, 1,
-0.393784, -0.4745559, -1.851543, 0, 0, 0, 1, 1,
-0.3923382, 0.153218, -0.4660845, 0, 0, 0, 1, 1,
-0.3900788, 1.264319, 1.195865, 0, 0, 0, 1, 1,
-0.3893204, 0.6028559, -1.502293, 0, 0, 0, 1, 1,
-0.3889255, 0.8394662, 0.1855549, 0, 0, 0, 1, 1,
-0.3880154, 0.8323526, 0.2203244, 0, 0, 0, 1, 1,
-0.387435, -0.9840693, -3.360285, 1, 1, 1, 1, 1,
-0.384979, 0.1110252, -1.081473, 1, 1, 1, 1, 1,
-0.3793754, -1.339298, -1.504034, 1, 1, 1, 1, 1,
-0.3786082, 1.713472, 1.338806, 1, 1, 1, 1, 1,
-0.3745641, 0.043399, -2.681893, 1, 1, 1, 1, 1,
-0.3725009, 1.070858, 0.2177252, 1, 1, 1, 1, 1,
-0.3723293, -0.8643709, -2.302877, 1, 1, 1, 1, 1,
-0.3680751, 0.4946077, 0.06010071, 1, 1, 1, 1, 1,
-0.3674209, 0.6378422, 0.5369927, 1, 1, 1, 1, 1,
-0.3667745, -0.2187542, -2.710237, 1, 1, 1, 1, 1,
-0.3644143, -0.2999514, -2.339329, 1, 1, 1, 1, 1,
-0.3574299, -0.7433532, -1.78116, 1, 1, 1, 1, 1,
-0.3572087, 0.4899268, 0.04311422, 1, 1, 1, 1, 1,
-0.355731, 0.2822081, -0.6677259, 1, 1, 1, 1, 1,
-0.3507387, 0.3770742, -0.9324465, 1, 1, 1, 1, 1,
-0.3479747, 0.1862101, -0.7480871, 0, 0, 1, 1, 1,
-0.3461486, -1.964296, -2.018244, 1, 0, 0, 1, 1,
-0.3456005, 0.1636495, 1.19459, 1, 0, 0, 1, 1,
-0.3429185, -1.224, -1.75746, 1, 0, 0, 1, 1,
-0.3416089, -0.2712537, -4.066709, 1, 0, 0, 1, 1,
-0.3407762, -0.01369426, -0.2034187, 1, 0, 0, 1, 1,
-0.3379362, -1.007922, -2.548006, 0, 0, 0, 1, 1,
-0.3378536, -0.4355918, -2.326273, 0, 0, 0, 1, 1,
-0.3376037, 1.381363, -0.9799458, 0, 0, 0, 1, 1,
-0.3369939, 0.7577346, -1.016122, 0, 0, 0, 1, 1,
-0.3358954, -0.6338159, -2.213977, 0, 0, 0, 1, 1,
-0.3351494, 1.357138, -1.691828, 0, 0, 0, 1, 1,
-0.3343981, -2.50671, -2.37156, 0, 0, 0, 1, 1,
-0.3234471, 0.5186616, -1.266046, 1, 1, 1, 1, 1,
-0.3180983, -0.8577797, -1.068595, 1, 1, 1, 1, 1,
-0.3179798, 1.6901, -0.4151977, 1, 1, 1, 1, 1,
-0.3178692, 0.4235954, -2.553387, 1, 1, 1, 1, 1,
-0.3123845, -0.2887447, -1.37195, 1, 1, 1, 1, 1,
-0.300148, -1.456954, -1.886828, 1, 1, 1, 1, 1,
-0.2990543, 0.382153, -0.3995392, 1, 1, 1, 1, 1,
-0.2975923, 1.104049, -0.1536198, 1, 1, 1, 1, 1,
-0.2967938, -1.817821, -2.512288, 1, 1, 1, 1, 1,
-0.2966363, 0.5644197, -0.5111377, 1, 1, 1, 1, 1,
-0.2961472, 0.3985542, -0.1973664, 1, 1, 1, 1, 1,
-0.2939404, 1.994441, 0.1875961, 1, 1, 1, 1, 1,
-0.2934702, -1.783679, -4.785369, 1, 1, 1, 1, 1,
-0.2910415, -0.8592334, -4.566196, 1, 1, 1, 1, 1,
-0.2886583, -0.4984428, -2.852888, 1, 1, 1, 1, 1,
-0.2883432, -0.2699486, -2.174563, 0, 0, 1, 1, 1,
-0.2847601, 0.6865644, 0.2021333, 1, 0, 0, 1, 1,
-0.2839439, 1.020389, -0.6596414, 1, 0, 0, 1, 1,
-0.2836334, -1.494691, -3.238285, 1, 0, 0, 1, 1,
-0.2804754, 0.3672445, -0.3060157, 1, 0, 0, 1, 1,
-0.2801344, 0.8812855, -0.9822434, 1, 0, 0, 1, 1,
-0.2786664, -0.5777383, -1.950145, 0, 0, 0, 1, 1,
-0.2751872, 0.7609211, 1.09602, 0, 0, 0, 1, 1,
-0.2742892, 0.3936591, -0.4544755, 0, 0, 0, 1, 1,
-0.2739734, 0.6390359, -1.223495, 0, 0, 0, 1, 1,
-0.2691661, 1.073532, -0.5157242, 0, 0, 0, 1, 1,
-0.2685395, 1.527676, -0.03495481, 0, 0, 0, 1, 1,
-0.2583538, 2.666305, -0.05423545, 0, 0, 0, 1, 1,
-0.2523713, -0.4361812, -0.541676, 1, 1, 1, 1, 1,
-0.24876, 0.9152981, -0.8366529, 1, 1, 1, 1, 1,
-0.239824, 1.290649, -0.4066643, 1, 1, 1, 1, 1,
-0.2385138, 0.03742593, -1.719265, 1, 1, 1, 1, 1,
-0.2374405, -0.4107808, -2.151122, 1, 1, 1, 1, 1,
-0.2347171, 0.5242376, 0.9088782, 1, 1, 1, 1, 1,
-0.2342743, 0.1851743, -0.4992264, 1, 1, 1, 1, 1,
-0.2337812, 0.7884389, -0.3026674, 1, 1, 1, 1, 1,
-0.2336208, -0.9445476, -4.066679, 1, 1, 1, 1, 1,
-0.2314343, 0.08141904, -2.196939, 1, 1, 1, 1, 1,
-0.230857, -0.6962487, -1.233059, 1, 1, 1, 1, 1,
-0.2266973, 0.0458052, -3.12507, 1, 1, 1, 1, 1,
-0.2178603, -0.5346621, -2.407277, 1, 1, 1, 1, 1,
-0.2177871, -1.908461, -3.511879, 1, 1, 1, 1, 1,
-0.2154573, -1.523586, -4.368701, 1, 1, 1, 1, 1,
-0.2110901, -1.232638, -2.201953, 0, 0, 1, 1, 1,
-0.2059356, 0.08002484, -0.2644925, 1, 0, 0, 1, 1,
-0.2029933, -0.3099973, -1.59135, 1, 0, 0, 1, 1,
-0.201933, -0.02680588, -2.936609, 1, 0, 0, 1, 1,
-0.2010317, -1.610742, -2.171824, 1, 0, 0, 1, 1,
-0.1984701, -0.2427613, -1.896994, 1, 0, 0, 1, 1,
-0.1973759, 0.6981537, -0.6139338, 0, 0, 0, 1, 1,
-0.1937972, 1.552407, 0.510178, 0, 0, 0, 1, 1,
-0.1935471, 0.1756029, -2.945299, 0, 0, 0, 1, 1,
-0.1934424, -0.7483009, -3.160434, 0, 0, 0, 1, 1,
-0.193057, -0.986765, -1.858127, 0, 0, 0, 1, 1,
-0.1928622, 0.9843264, 1.050818, 0, 0, 0, 1, 1,
-0.1855963, -0.600942, -2.627901, 0, 0, 0, 1, 1,
-0.1837842, -0.6919472, -3.381277, 1, 1, 1, 1, 1,
-0.1837708, 0.1817378, 0.2147566, 1, 1, 1, 1, 1,
-0.1834641, 0.1818061, -1.051452, 1, 1, 1, 1, 1,
-0.1811118, -0.1026724, -0.03073229, 1, 1, 1, 1, 1,
-0.1789683, 1.531705, -1.809674, 1, 1, 1, 1, 1,
-0.1785977, -0.1065106, -2.167186, 1, 1, 1, 1, 1,
-0.1692871, -1.882011, -2.177466, 1, 1, 1, 1, 1,
-0.1657802, 1.57155, 0.6639887, 1, 1, 1, 1, 1,
-0.1647609, 0.7421329, -2.74763, 1, 1, 1, 1, 1,
-0.1622316, 1.398579, -0.8732321, 1, 1, 1, 1, 1,
-0.1613521, 0.1122744, -1.021259, 1, 1, 1, 1, 1,
-0.154881, -1.264274, -3.235069, 1, 1, 1, 1, 1,
-0.149076, -0.7176216, -2.878059, 1, 1, 1, 1, 1,
-0.1479558, -0.808027, -3.907166, 1, 1, 1, 1, 1,
-0.1466148, 0.184891, -1.047343, 1, 1, 1, 1, 1,
-0.1447785, -0.7059808, -1.699844, 0, 0, 1, 1, 1,
-0.1335029, 0.2030211, -0.02671249, 1, 0, 0, 1, 1,
-0.1311199, -1.127526, -2.238746, 1, 0, 0, 1, 1,
-0.1273075, -0.1357015, -2.560689, 1, 0, 0, 1, 1,
-0.1238344, 0.6660866, 0.1296634, 1, 0, 0, 1, 1,
-0.1196514, -0.6826094, -5.176414, 1, 0, 0, 1, 1,
-0.1189428, 0.1990963, -0.5799651, 0, 0, 0, 1, 1,
-0.1176943, -0.4692867, -3.13217, 0, 0, 0, 1, 1,
-0.1123683, -0.2048993, -2.47784, 0, 0, 0, 1, 1,
-0.1100135, 1.033101, -0.1697759, 0, 0, 0, 1, 1,
-0.1085971, 0.7346199, -0.01748927, 0, 0, 0, 1, 1,
-0.09663282, 0.05776644, -0.5151644, 0, 0, 0, 1, 1,
-0.09572466, 0.9726447, 0.2544537, 0, 0, 0, 1, 1,
-0.09121402, -0.6258083, -3.276576, 1, 1, 1, 1, 1,
-0.08701528, -0.1567731, -3.325485, 1, 1, 1, 1, 1,
-0.08682721, 0.1438441, -0.3304306, 1, 1, 1, 1, 1,
-0.08396727, 0.4161891, -0.2641484, 1, 1, 1, 1, 1,
-0.08256698, 1.695668, -0.4804937, 1, 1, 1, 1, 1,
-0.08090235, -0.385854, -3.472391, 1, 1, 1, 1, 1,
-0.07864455, 0.9501674, 1.649988, 1, 1, 1, 1, 1,
-0.06929918, -0.828211, -2.592476, 1, 1, 1, 1, 1,
-0.06733828, -0.5912501, -4.411089, 1, 1, 1, 1, 1,
-0.06499118, 1.197207, -0.4899153, 1, 1, 1, 1, 1,
-0.05993243, -0.508244, -2.524775, 1, 1, 1, 1, 1,
-0.05739677, -2.203857, -2.435, 1, 1, 1, 1, 1,
-0.05377038, -1.055342, -2.860949, 1, 1, 1, 1, 1,
-0.05353086, 0.7050047, -0.9654592, 1, 1, 1, 1, 1,
-0.0524087, 2.481571, -0.04185691, 1, 1, 1, 1, 1,
-0.05146583, 0.8716539, -0.07588088, 0, 0, 1, 1, 1,
-0.05090954, -0.422579, -3.07385, 1, 0, 0, 1, 1,
-0.04906275, -1.538665, -2.660968, 1, 0, 0, 1, 1,
-0.04728849, -0.2497192, -2.875136, 1, 0, 0, 1, 1,
-0.0469885, -1.475325, -2.861654, 1, 0, 0, 1, 1,
-0.04679378, -0.7694713, -3.674308, 1, 0, 0, 1, 1,
-0.04602619, 0.1625969, 0.25571, 0, 0, 0, 1, 1,
-0.04458022, 0.2279716, -0.5945546, 0, 0, 0, 1, 1,
-0.04354656, 0.3215333, 0.3027678, 0, 0, 0, 1, 1,
-0.03486197, 0.2655939, -1.943758, 0, 0, 0, 1, 1,
-0.03185178, -1.630378, -2.871281, 0, 0, 0, 1, 1,
-0.03141404, -0.9877849, -1.926711, 0, 0, 0, 1, 1,
-0.02394649, -0.07965066, -2.14836, 0, 0, 0, 1, 1,
-0.022872, -1.090549, -2.216261, 1, 1, 1, 1, 1,
-0.01964901, -1.232453, -2.418348, 1, 1, 1, 1, 1,
-0.01473977, -0.7398003, -3.103705, 1, 1, 1, 1, 1,
-0.01148826, -0.2455493, -3.172059, 1, 1, 1, 1, 1,
-0.004646886, 0.2603039, 1.477496, 1, 1, 1, 1, 1,
0.00131269, 0.3699461, 1.173467, 1, 1, 1, 1, 1,
0.002540982, -1.80166, 3.766688, 1, 1, 1, 1, 1,
0.002702072, 0.1921553, 1.110695, 1, 1, 1, 1, 1,
0.008249471, 1.651285, -0.7721816, 1, 1, 1, 1, 1,
0.01104684, -1.161419, 4.624581, 1, 1, 1, 1, 1,
0.02063023, 0.05007816, 1.880407, 1, 1, 1, 1, 1,
0.02208805, 0.803559, -1.00935, 1, 1, 1, 1, 1,
0.02282444, -0.2799271, 2.488781, 1, 1, 1, 1, 1,
0.02340402, 0.07368017, 0.6837885, 1, 1, 1, 1, 1,
0.02709754, 0.4533944, -1.01871, 1, 1, 1, 1, 1,
0.03090891, -0.2569799, 0.997972, 0, 0, 1, 1, 1,
0.03383356, -0.1974143, 3.41873, 1, 0, 0, 1, 1,
0.04324312, -1.044551, 4.147593, 1, 0, 0, 1, 1,
0.04326089, 1.23904, 1.944058, 1, 0, 0, 1, 1,
0.04558759, -0.45165, 1.287142, 1, 0, 0, 1, 1,
0.04818266, 0.627856, 0.4874949, 1, 0, 0, 1, 1,
0.05055606, 0.376293, -1.493478, 0, 0, 0, 1, 1,
0.05395064, -0.9703119, 2.285779, 0, 0, 0, 1, 1,
0.05619493, -0.4406812, 4.414917, 0, 0, 0, 1, 1,
0.05828334, 0.6174549, -1.56607, 0, 0, 0, 1, 1,
0.06354824, -0.925844, 2.14053, 0, 0, 0, 1, 1,
0.0703944, 0.9902433, 0.336024, 0, 0, 0, 1, 1,
0.07279348, 0.7932371, -0.780072, 0, 0, 0, 1, 1,
0.07323294, -0.06958944, 2.079039, 1, 1, 1, 1, 1,
0.07520822, -2.011461, 2.102441, 1, 1, 1, 1, 1,
0.07531764, 0.4801056, -0.6721533, 1, 1, 1, 1, 1,
0.0784335, 0.4199569, 0.2907809, 1, 1, 1, 1, 1,
0.08203077, -0.4901739, 1.974395, 1, 1, 1, 1, 1,
0.08240498, -0.3720326, 1.52653, 1, 1, 1, 1, 1,
0.0828587, -1.621093, 4.876536, 1, 1, 1, 1, 1,
0.08328844, 0.2649332, 2.758615, 1, 1, 1, 1, 1,
0.08743935, 0.01162606, 2.846195, 1, 1, 1, 1, 1,
0.08912428, 0.329207, 0.2245402, 1, 1, 1, 1, 1,
0.09469181, -2.113426, 2.995091, 1, 1, 1, 1, 1,
0.09544308, 0.1756017, 2.172055, 1, 1, 1, 1, 1,
0.0971662, -1.490972, 1.914023, 1, 1, 1, 1, 1,
0.09758884, 1.361756, -1.432801, 1, 1, 1, 1, 1,
0.0984253, -0.3654856, 0.7979998, 1, 1, 1, 1, 1,
0.09883884, -0.3409285, 4.033896, 0, 0, 1, 1, 1,
0.1044394, -0.3881834, 2.375092, 1, 0, 0, 1, 1,
0.1047725, 0.1047246, 0.517896, 1, 0, 0, 1, 1,
0.1095903, -0.9297923, 4.744595, 1, 0, 0, 1, 1,
0.1100104, 0.6437652, -0.6768766, 1, 0, 0, 1, 1,
0.1127546, 0.6452109, -2.107593, 1, 0, 0, 1, 1,
0.1159374, 1.394857, -1.041849, 0, 0, 0, 1, 1,
0.1171546, 0.7233003, 0.302044, 0, 0, 0, 1, 1,
0.1183084, 0.5309922, 0.4681156, 0, 0, 0, 1, 1,
0.1196634, -0.7562928, 3.748166, 0, 0, 0, 1, 1,
0.1210696, 0.3640341, 0.2214931, 0, 0, 0, 1, 1,
0.1218452, 1.020994, 1.648903, 0, 0, 0, 1, 1,
0.1238603, -1.233195, 2.56513, 0, 0, 0, 1, 1,
0.1241429, -1.423263, 2.869167, 1, 1, 1, 1, 1,
0.1249791, -0.607472, 4.107449, 1, 1, 1, 1, 1,
0.1314148, 1.64533, 0.9255155, 1, 1, 1, 1, 1,
0.1315651, 0.5697262, -1.359893, 1, 1, 1, 1, 1,
0.1318279, 0.7040418, -0.03316897, 1, 1, 1, 1, 1,
0.1355608, 0.1918621, 0.8576167, 1, 1, 1, 1, 1,
0.1361575, -1.047007, 2.441653, 1, 1, 1, 1, 1,
0.1371293, 0.6154273, -0.8427763, 1, 1, 1, 1, 1,
0.1410926, 1.472687, 1.232057, 1, 1, 1, 1, 1,
0.1417253, -1.426123, 3.639734, 1, 1, 1, 1, 1,
0.1469259, 0.5289016, 0.3637411, 1, 1, 1, 1, 1,
0.1474475, 1.517183, 0.3014834, 1, 1, 1, 1, 1,
0.149357, -1.502874, 1.201075, 1, 1, 1, 1, 1,
0.1498079, -1.438581, 4.109914, 1, 1, 1, 1, 1,
0.1575397, 2.696957, -0.5032002, 1, 1, 1, 1, 1,
0.1583494, -1.471863, 3.055396, 0, 0, 1, 1, 1,
0.1589202, -1.538089, 1.805565, 1, 0, 0, 1, 1,
0.1622023, 0.1179203, 1.525107, 1, 0, 0, 1, 1,
0.1726063, 1.125358, 1.553635, 1, 0, 0, 1, 1,
0.1739781, 0.2940655, 0.204749, 1, 0, 0, 1, 1,
0.1745387, 1.636757, -1.126159, 1, 0, 0, 1, 1,
0.1798081, 1.636877, -0.533312, 0, 0, 0, 1, 1,
0.1815201, -0.9767709, 2.503103, 0, 0, 0, 1, 1,
0.1816269, -0.5095003, 3.688658, 0, 0, 0, 1, 1,
0.1821844, -0.3304819, 1.902756, 0, 0, 0, 1, 1,
0.1866129, 0.5462674, -0.03213123, 0, 0, 0, 1, 1,
0.1933431, -1.811689, 1.148462, 0, 0, 0, 1, 1,
0.1950663, 0.4229704, 0.7220398, 0, 0, 0, 1, 1,
0.1966432, -1.707536, 3.386003, 1, 1, 1, 1, 1,
0.2009317, 0.652572, 0.06702158, 1, 1, 1, 1, 1,
0.2026005, -0.8560137, 0.5021279, 1, 1, 1, 1, 1,
0.2054682, -1.601364, 3.535635, 1, 1, 1, 1, 1,
0.2054848, 1.216304, -1.536338, 1, 1, 1, 1, 1,
0.2057896, 0.1804114, 0.4930483, 1, 1, 1, 1, 1,
0.2155967, -1.409972, 3.36021, 1, 1, 1, 1, 1,
0.218067, 1.607376, -1.123408, 1, 1, 1, 1, 1,
0.2195069, 0.7979308, 2.570745, 1, 1, 1, 1, 1,
0.2217721, 0.04998529, 1.642267, 1, 1, 1, 1, 1,
0.2241301, 2.374194, 0.02303362, 1, 1, 1, 1, 1,
0.2253501, -2.710189, 2.088682, 1, 1, 1, 1, 1,
0.2315626, -0.08907101, 0.2621315, 1, 1, 1, 1, 1,
0.2391287, 1.110814, -0.6526399, 1, 1, 1, 1, 1,
0.2428583, -0.5504912, 3.158196, 1, 1, 1, 1, 1,
0.2430208, 0.8979518, 1.828056, 0, 0, 1, 1, 1,
0.2463396, 0.09915069, 1.98253, 1, 0, 0, 1, 1,
0.2473961, -1.287149, 2.414831, 1, 0, 0, 1, 1,
0.2480299, 1.305729, -0.02629383, 1, 0, 0, 1, 1,
0.2508242, 0.2075575, 1.334853, 1, 0, 0, 1, 1,
0.255052, 1.225709, -1.208499, 1, 0, 0, 1, 1,
0.2597422, 1.440636, -0.316361, 0, 0, 0, 1, 1,
0.260289, -1.90612, 2.219135, 0, 0, 0, 1, 1,
0.261287, 0.61908, 0.5597579, 0, 0, 0, 1, 1,
0.2636401, 0.5072283, -0.1926906, 0, 0, 0, 1, 1,
0.2681931, 1.507498, -1.292318, 0, 0, 0, 1, 1,
0.2683611, -1.400609, 3.380503, 0, 0, 0, 1, 1,
0.2706292, 0.7623954, 1.903525, 0, 0, 0, 1, 1,
0.2739237, 0.2304043, 0.861155, 1, 1, 1, 1, 1,
0.2821847, -1.460181, 1.65593, 1, 1, 1, 1, 1,
0.2832011, -2.052178, 2.554775, 1, 1, 1, 1, 1,
0.2834663, 0.739962, -0.5858679, 1, 1, 1, 1, 1,
0.2836275, -2.641125, 2.705527, 1, 1, 1, 1, 1,
0.2858289, -0.2798106, 3.103126, 1, 1, 1, 1, 1,
0.2875831, -1.041838, 2.685489, 1, 1, 1, 1, 1,
0.2942745, 1.343242, 0.2035227, 1, 1, 1, 1, 1,
0.2949077, 1.020129, 1.96679, 1, 1, 1, 1, 1,
0.2969291, 0.1027324, 1.886255, 1, 1, 1, 1, 1,
0.2973546, -1.273025, 0.9793959, 1, 1, 1, 1, 1,
0.3035482, 0.8550633, 0.6583127, 1, 1, 1, 1, 1,
0.3040026, -2.557693, 3.891104, 1, 1, 1, 1, 1,
0.3065808, 0.2652421, 1.542839, 1, 1, 1, 1, 1,
0.3113266, -0.9905404, 2.126153, 1, 1, 1, 1, 1,
0.3122368, 0.2363376, 0.4991833, 0, 0, 1, 1, 1,
0.3138652, -0.1843754, 2.022171, 1, 0, 0, 1, 1,
0.3142096, -0.3078101, 1.350709, 1, 0, 0, 1, 1,
0.3146529, 1.499502, 0.7444049, 1, 0, 0, 1, 1,
0.3159271, -0.4517644, 3.271518, 1, 0, 0, 1, 1,
0.3167495, 0.6552525, 0.8051482, 1, 0, 0, 1, 1,
0.3172621, -0.9166337, 4.461076, 0, 0, 0, 1, 1,
0.3176874, -0.0215401, 1.804234, 0, 0, 0, 1, 1,
0.32304, -0.2473602, 1.896402, 0, 0, 0, 1, 1,
0.3252581, 0.001155195, 1.552859, 0, 0, 0, 1, 1,
0.3260186, -0.8933119, 2.61121, 0, 0, 0, 1, 1,
0.326776, 0.1989955, -0.1871028, 0, 0, 0, 1, 1,
0.3274789, -1.732729, 2.403067, 0, 0, 0, 1, 1,
0.3296335, 0.01794225, 0.2497277, 1, 1, 1, 1, 1,
0.3402993, -0.7504395, 1.46212, 1, 1, 1, 1, 1,
0.3423034, -1.558192, 4.371283, 1, 1, 1, 1, 1,
0.3456755, -0.5380829, 1.772418, 1, 1, 1, 1, 1,
0.3475313, 0.2107463, 1.11025, 1, 1, 1, 1, 1,
0.3523726, 1.464092, 1.748817, 1, 1, 1, 1, 1,
0.3537712, -0.3249765, -0.505048, 1, 1, 1, 1, 1,
0.3576535, -1.317704, 3.847369, 1, 1, 1, 1, 1,
0.3584088, -0.9640953, 3.692725, 1, 1, 1, 1, 1,
0.3607807, -0.8473116, 4.394915, 1, 1, 1, 1, 1,
0.3624643, -1.013208, 2.759494, 1, 1, 1, 1, 1,
0.3631218, 0.4657072, 1.391325, 1, 1, 1, 1, 1,
0.3676848, -1.307139, 3.737327, 1, 1, 1, 1, 1,
0.3764594, 2.087013, -0.01315488, 1, 1, 1, 1, 1,
0.3888598, -0.02896773, 1.032053, 1, 1, 1, 1, 1,
0.3934391, 0.5752833, -0.2249797, 0, 0, 1, 1, 1,
0.3976809, -0.1356563, 3.334164, 1, 0, 0, 1, 1,
0.402799, 1.154133, 1.392449, 1, 0, 0, 1, 1,
0.4030061, 0.6387812, 1.37788, 1, 0, 0, 1, 1,
0.4094869, 0.2435049, 1.132242, 1, 0, 0, 1, 1,
0.4124024, 1.079426, -2.113823, 1, 0, 0, 1, 1,
0.4154029, 0.06324136, 1.739127, 0, 0, 0, 1, 1,
0.4199298, -2.332778, 3.72058, 0, 0, 0, 1, 1,
0.4217804, 1.12379, 1.994383, 0, 0, 0, 1, 1,
0.4226705, 0.2753208, 0.9114953, 0, 0, 0, 1, 1,
0.4241506, 1.326407, -0.568417, 0, 0, 0, 1, 1,
0.4293565, -1.042781, 4.504563, 0, 0, 0, 1, 1,
0.4306248, 1.565677, -0.09531283, 0, 0, 0, 1, 1,
0.4354108, -1.528092, 2.897881, 1, 1, 1, 1, 1,
0.4354902, 0.05060887, 3.051909, 1, 1, 1, 1, 1,
0.4380794, 1.805347, 0.2226641, 1, 1, 1, 1, 1,
0.442421, 0.9193298, -1.42928, 1, 1, 1, 1, 1,
0.4441056, -0.8381044, 3.478376, 1, 1, 1, 1, 1,
0.4474255, 1.66307, -0.6476958, 1, 1, 1, 1, 1,
0.4479403, -1.404554, 2.921029, 1, 1, 1, 1, 1,
0.4490573, 1.001822, -0.6387297, 1, 1, 1, 1, 1,
0.4501686, 0.4593015, 1.762449, 1, 1, 1, 1, 1,
0.4561971, 0.7663873, 2.928705, 1, 1, 1, 1, 1,
0.4611613, -1.064904, 3.13559, 1, 1, 1, 1, 1,
0.4613751, 2.49529, -0.09436791, 1, 1, 1, 1, 1,
0.4660238, -0.04266142, 1.354908, 1, 1, 1, 1, 1,
0.4682865, -0.1925903, 1.99493, 1, 1, 1, 1, 1,
0.4709819, -0.9355233, 2.11466, 1, 1, 1, 1, 1,
0.4709862, -0.335173, 2.165306, 0, 0, 1, 1, 1,
0.4740419, -0.4156057, 1.701342, 1, 0, 0, 1, 1,
0.4748915, -1.786135, 2.829857, 1, 0, 0, 1, 1,
0.475224, -0.7330613, 3.980576, 1, 0, 0, 1, 1,
0.47987, 1.475912, 1.69869, 1, 0, 0, 1, 1,
0.4801684, 0.6228693, -1.396933, 1, 0, 0, 1, 1,
0.4839454, -0.003827374, 1.484821, 0, 0, 0, 1, 1,
0.4841438, 0.00928851, 0.6561439, 0, 0, 0, 1, 1,
0.4903927, -0.237722, 4.450681, 0, 0, 0, 1, 1,
0.4906012, 1.434808, 0.2783627, 0, 0, 0, 1, 1,
0.4914864, -0.2715431, 1.407877, 0, 0, 0, 1, 1,
0.494033, -2.144599, 2.063225, 0, 0, 0, 1, 1,
0.4962953, 0.2776687, -0.8046002, 0, 0, 0, 1, 1,
0.5016266, -2.05849, 1.806802, 1, 1, 1, 1, 1,
0.5027372, -1.633902, 2.682838, 1, 1, 1, 1, 1,
0.5063683, -1.605867, 2.086513, 1, 1, 1, 1, 1,
0.5121086, 0.5049087, 2.31428, 1, 1, 1, 1, 1,
0.516354, -0.6757476, 2.15882, 1, 1, 1, 1, 1,
0.5169261, 0.9781445, 1.644393, 1, 1, 1, 1, 1,
0.5186711, 0.6981506, 0.7077723, 1, 1, 1, 1, 1,
0.5217509, 2.879606, 1.830759, 1, 1, 1, 1, 1,
0.5226911, 1.319258, 1.117252, 1, 1, 1, 1, 1,
0.5238518, 0.4728222, 1.18117, 1, 1, 1, 1, 1,
0.5257443, 0.3458502, 1.353619, 1, 1, 1, 1, 1,
0.5305694, -0.2421516, 1.750321, 1, 1, 1, 1, 1,
0.5307047, -0.7216228, 0.7535161, 1, 1, 1, 1, 1,
0.5342559, -0.2919999, 2.361855, 1, 1, 1, 1, 1,
0.5369675, -1.961576, 4.384387, 1, 1, 1, 1, 1,
0.537214, -0.4256533, 1.847048, 0, 0, 1, 1, 1,
0.5432168, -0.2041151, 3.580886, 1, 0, 0, 1, 1,
0.5476238, -0.6258499, 3.159787, 1, 0, 0, 1, 1,
0.5480085, -0.2191962, 1.916495, 1, 0, 0, 1, 1,
0.555074, 0.5155531, 0.7434835, 1, 0, 0, 1, 1,
0.5591172, 0.1440164, 0.1924581, 1, 0, 0, 1, 1,
0.5601747, -1.069896, 1.878255, 0, 0, 0, 1, 1,
0.5634326, 0.01615529, 2.441812, 0, 0, 0, 1, 1,
0.5654155, -0.1502119, 2.089679, 0, 0, 0, 1, 1,
0.5712771, -0.1028896, 2.57879, 0, 0, 0, 1, 1,
0.5721383, 1.425076, 1.814216, 0, 0, 0, 1, 1,
0.5757372, -0.7869136, 2.776867, 0, 0, 0, 1, 1,
0.5771862, 0.6760795, -0.3618318, 0, 0, 0, 1, 1,
0.5873175, -0.6038516, 0.9065967, 1, 1, 1, 1, 1,
0.5905794, -0.6372386, 2.458498, 1, 1, 1, 1, 1,
0.5907348, 0.9272429, 1.028018, 1, 1, 1, 1, 1,
0.5953081, 1.160982, -0.3137394, 1, 1, 1, 1, 1,
0.5983571, -1.655216, 2.867064, 1, 1, 1, 1, 1,
0.5995947, 1.605121, 1.323678, 1, 1, 1, 1, 1,
0.6017046, 0.5638707, 0.7529042, 1, 1, 1, 1, 1,
0.6067849, 0.3449991, 1.821243, 1, 1, 1, 1, 1,
0.6077343, -0.9622307, 2.483903, 1, 1, 1, 1, 1,
0.6096852, -1.100379, 2.344817, 1, 1, 1, 1, 1,
0.6127535, 0.7680333, -0.6151733, 1, 1, 1, 1, 1,
0.6138536, -0.1180019, 3.220325, 1, 1, 1, 1, 1,
0.6205798, -1.367016, 3.309245, 1, 1, 1, 1, 1,
0.6230844, -0.5766201, 2.888086, 1, 1, 1, 1, 1,
0.6260871, 2.193088, -0.6589584, 1, 1, 1, 1, 1,
0.6278335, 1.565593, 0.2961775, 0, 0, 1, 1, 1,
0.629135, -1.391556, 2.96068, 1, 0, 0, 1, 1,
0.6370804, -1.280644, 2.960634, 1, 0, 0, 1, 1,
0.6386347, -0.1930979, 2.267175, 1, 0, 0, 1, 1,
0.640627, 0.2622162, -1.914118, 1, 0, 0, 1, 1,
0.6417444, 0.706175, 0.2556383, 1, 0, 0, 1, 1,
0.6440647, 1.3683, -0.1334519, 0, 0, 0, 1, 1,
0.6483753, -0.7563051, 4.095931, 0, 0, 0, 1, 1,
0.6537275, -0.4427381, 2.169886, 0, 0, 0, 1, 1,
0.6549628, -1.266685, 4.822792, 0, 0, 0, 1, 1,
0.6550822, 0.1975486, 1.186679, 0, 0, 0, 1, 1,
0.6554989, -0.591813, 1.531053, 0, 0, 0, 1, 1,
0.6631151, -0.7689645, 1.806312, 0, 0, 0, 1, 1,
0.6642781, -0.4786648, 1.218261, 1, 1, 1, 1, 1,
0.6665616, 0.103809, -0.2312893, 1, 1, 1, 1, 1,
0.6693624, 0.6768684, -0.680121, 1, 1, 1, 1, 1,
0.6696267, -0.3470167, 2.997037, 1, 1, 1, 1, 1,
0.6720303, -0.4114206, 2.343549, 1, 1, 1, 1, 1,
0.6721436, 0.5168382, 3.96145, 1, 1, 1, 1, 1,
0.6746356, 1.054487, 0.1363971, 1, 1, 1, 1, 1,
0.6752532, -0.5786976, 1.597943, 1, 1, 1, 1, 1,
0.6801562, 1.211897, -1.561213, 1, 1, 1, 1, 1,
0.6816655, 0.4149488, 1.16555, 1, 1, 1, 1, 1,
0.6910585, -1.837758, 3.53278, 1, 1, 1, 1, 1,
0.6934897, 0.4514257, 3.278345, 1, 1, 1, 1, 1,
0.7007694, 0.9928543, 2.659343, 1, 1, 1, 1, 1,
0.700869, 0.7003328, 1.532375, 1, 1, 1, 1, 1,
0.7024246, -2.079726, 4.470263, 1, 1, 1, 1, 1,
0.7027272, -1.215178, 2.83706, 0, 0, 1, 1, 1,
0.7065992, 0.4204943, -0.06525842, 1, 0, 0, 1, 1,
0.7085392, 0.7112154, 1.40548, 1, 0, 0, 1, 1,
0.7189307, 0.5994862, 0.2681534, 1, 0, 0, 1, 1,
0.7218933, -0.5092096, 0.7564484, 1, 0, 0, 1, 1,
0.7324409, 0.1916865, 0.5363671, 1, 0, 0, 1, 1,
0.7344046, -1.321725, 1.556231, 0, 0, 0, 1, 1,
0.7425057, -0.2374326, 1.874007, 0, 0, 0, 1, 1,
0.745319, 0.1699945, 3.0909, 0, 0, 0, 1, 1,
0.7464022, -0.2911615, 2.563367, 0, 0, 0, 1, 1,
0.7476026, -1.449259, 2.938115, 0, 0, 0, 1, 1,
0.7478268, 1.516676, -0.5363646, 0, 0, 0, 1, 1,
0.7528597, -0.2377816, 2.654159, 0, 0, 0, 1, 1,
0.7546477, -1.541482, 1.83434, 1, 1, 1, 1, 1,
0.7693698, 1.615298, 0.331852, 1, 1, 1, 1, 1,
0.7772912, 0.9221094, -0.485659, 1, 1, 1, 1, 1,
0.7779618, -0.1031085, 1.647907, 1, 1, 1, 1, 1,
0.7796509, -1.02818, 3.421873, 1, 1, 1, 1, 1,
0.7808558, 0.01669171, 2.528094, 1, 1, 1, 1, 1,
0.7812761, 1.301986, 0.5749335, 1, 1, 1, 1, 1,
0.7867585, -0.01959661, 1.461209, 1, 1, 1, 1, 1,
0.7914079, -0.1603597, 3.447603, 1, 1, 1, 1, 1,
0.792799, -0.4373544, 0.5816441, 1, 1, 1, 1, 1,
0.7961964, 1.2614, -0.2923525, 1, 1, 1, 1, 1,
0.801301, 0.7866317, 1.122963, 1, 1, 1, 1, 1,
0.8074316, 0.04763021, 0.6039371, 1, 1, 1, 1, 1,
0.8109162, 1.625441, -0.8716578, 1, 1, 1, 1, 1,
0.8214887, -0.49066, 3.238959, 1, 1, 1, 1, 1,
0.8230614, -0.4630069, 2.065332, 0, 0, 1, 1, 1,
0.824479, -0.8430907, 1.885879, 1, 0, 0, 1, 1,
0.8262631, -2.336766, 0.7080534, 1, 0, 0, 1, 1,
0.8272738, -0.3518029, 2.521006, 1, 0, 0, 1, 1,
0.8280075, -0.9591056, 3.733202, 1, 0, 0, 1, 1,
0.8285694, -0.2225709, 1.1732, 1, 0, 0, 1, 1,
0.8329793, 0.7762703, -1.912412, 0, 0, 0, 1, 1,
0.8340309, -0.6090636, 1.16562, 0, 0, 0, 1, 1,
0.8367388, -0.9816799, 1.938249, 0, 0, 0, 1, 1,
0.8400701, 0.105778, 2.543465, 0, 0, 0, 1, 1,
0.843101, -0.8440108, 2.214811, 0, 0, 0, 1, 1,
0.8443505, 0.4366823, 1.770454, 0, 0, 0, 1, 1,
0.8457655, 0.2475739, 3.230695, 0, 0, 0, 1, 1,
0.8510072, 0.5377944, 1.256516, 1, 1, 1, 1, 1,
0.8538256, 0.2562487, 0.7838268, 1, 1, 1, 1, 1,
0.855853, 0.9444614, 1.522757, 1, 1, 1, 1, 1,
0.8560089, 0.8287697, 1.337894, 1, 1, 1, 1, 1,
0.857976, 0.08948039, 2.212654, 1, 1, 1, 1, 1,
0.8596615, -2.078431, 2.676723, 1, 1, 1, 1, 1,
0.8613248, -1.018193, 1.52442, 1, 1, 1, 1, 1,
0.870033, -0.8551264, 3.546042, 1, 1, 1, 1, 1,
0.874375, -1.593325, 2.817606, 1, 1, 1, 1, 1,
0.87488, 0.4936195, 1.047039, 1, 1, 1, 1, 1,
0.8861231, 1.322224, 0.861838, 1, 1, 1, 1, 1,
0.8877066, -0.5261115, 3.280902, 1, 1, 1, 1, 1,
0.8900122, 0.06547921, 1.136157, 1, 1, 1, 1, 1,
0.8925941, -0.268326, 1.638554, 1, 1, 1, 1, 1,
0.8951426, 0.3351723, 1.95198, 1, 1, 1, 1, 1,
0.8959988, 0.3012862, 2.541657, 0, 0, 1, 1, 1,
0.89896, 0.9719958, 1.832127, 1, 0, 0, 1, 1,
0.9013768, -0.1653898, 2.729704, 1, 0, 0, 1, 1,
0.9016049, 0.2115136, 0.6658629, 1, 0, 0, 1, 1,
0.9026176, 1.552905, -0.008031788, 1, 0, 0, 1, 1,
0.9026389, 0.735993, 1.35556, 1, 0, 0, 1, 1,
0.9027183, -1.119268, 1.72636, 0, 0, 0, 1, 1,
0.9098935, -0.5294038, 0.6201912, 0, 0, 0, 1, 1,
0.9136699, 0.3780331, 1.037944, 0, 0, 0, 1, 1,
0.9211872, 2.376489, 0.7148693, 0, 0, 0, 1, 1,
0.9270266, 0.01435523, 0.8641961, 0, 0, 0, 1, 1,
0.9285997, 0.5324981, 1.774271, 0, 0, 0, 1, 1,
0.9437286, -0.4518152, 1.775203, 0, 0, 0, 1, 1,
0.9455163, -0.534266, 2.691357, 1, 1, 1, 1, 1,
0.9535039, -1.61463, 2.631763, 1, 1, 1, 1, 1,
0.9596003, -1.373944, 1.713484, 1, 1, 1, 1, 1,
0.9602647, -0.4996759, 0.9283994, 1, 1, 1, 1, 1,
0.9717111, -1.187053, 1.755577, 1, 1, 1, 1, 1,
0.9790889, 0.05991574, 0.9022176, 1, 1, 1, 1, 1,
0.9827402, 0.8875759, 0.968365, 1, 1, 1, 1, 1,
0.9838344, -1.571654, 2.533632, 1, 1, 1, 1, 1,
0.9848318, 0.538379, 1.32214, 1, 1, 1, 1, 1,
0.9855345, -0.9037325, 1.170829, 1, 1, 1, 1, 1,
0.9856699, 0.6480726, 1.753178, 1, 1, 1, 1, 1,
0.9871348, -0.9747609, 2.559957, 1, 1, 1, 1, 1,
0.9918013, 0.003322988, 2.712388, 1, 1, 1, 1, 1,
0.9928569, 0.6685733, -0.3233603, 1, 1, 1, 1, 1,
1.009566, -0.7364098, 4.526796, 1, 1, 1, 1, 1,
1.011097, 1.887276, 0.4521386, 0, 0, 1, 1, 1,
1.019083, -0.7256971, 2.692262, 1, 0, 0, 1, 1,
1.019339, -0.3740396, 3.242115, 1, 0, 0, 1, 1,
1.021382, 0.2199085, 0.6425004, 1, 0, 0, 1, 1,
1.02969, 0.0536494, -0.05076185, 1, 0, 0, 1, 1,
1.043031, 1.265759, 3.767819, 1, 0, 0, 1, 1,
1.055987, -0.9371613, 2.590371, 0, 0, 0, 1, 1,
1.063342, 0.5309905, 2.183492, 0, 0, 0, 1, 1,
1.06674, -1.044208, 4.091137, 0, 0, 0, 1, 1,
1.075711, -0.6772779, 2.353461, 0, 0, 0, 1, 1,
1.075753, -0.9194514, 1.451982, 0, 0, 0, 1, 1,
1.07629, 0.9553603, 2.65294, 0, 0, 0, 1, 1,
1.077406, -0.2792274, 1.907821, 0, 0, 0, 1, 1,
1.087748, -1.847639, 3.360007, 1, 1, 1, 1, 1,
1.09041, 1.241048, 1.060529, 1, 1, 1, 1, 1,
1.09489, -0.9835091, 1.969719, 1, 1, 1, 1, 1,
1.09661, 0.6507453, 1.46989, 1, 1, 1, 1, 1,
1.102715, -0.1597451, 1.542438, 1, 1, 1, 1, 1,
1.106307, -0.8458551, 2.413966, 1, 1, 1, 1, 1,
1.10711, -1.228259, 0.829736, 1, 1, 1, 1, 1,
1.109863, 1.772985, -0.6648253, 1, 1, 1, 1, 1,
1.110646, 0.2323718, 1.595478, 1, 1, 1, 1, 1,
1.115198, 0.8995509, 0.7735133, 1, 1, 1, 1, 1,
1.127101, 0.9145935, 0.4406739, 1, 1, 1, 1, 1,
1.134026, 0.1713198, 1.410558, 1, 1, 1, 1, 1,
1.137119, 1.06511, -0.547468, 1, 1, 1, 1, 1,
1.138414, 0.9234025, 0.7255998, 1, 1, 1, 1, 1,
1.138802, -1.607522, 1.459819, 1, 1, 1, 1, 1,
1.14027, -0.8208489, 1.985028, 0, 0, 1, 1, 1,
1.141541, 0.3360327, 0.1106402, 1, 0, 0, 1, 1,
1.142262, -2.02615, 2.538728, 1, 0, 0, 1, 1,
1.146382, 0.3818467, -0.405566, 1, 0, 0, 1, 1,
1.148647, 0.5020438, 1.825636, 1, 0, 0, 1, 1,
1.159994, 0.08789486, 1.53678, 1, 0, 0, 1, 1,
1.164916, -0.7539691, 3.08085, 0, 0, 0, 1, 1,
1.167479, -1.008534, 2.121696, 0, 0, 0, 1, 1,
1.167907, -1.287935, 3.589787, 0, 0, 0, 1, 1,
1.169068, -0.1399485, 0.4926094, 0, 0, 0, 1, 1,
1.176407, -1.602629, 1.842347, 0, 0, 0, 1, 1,
1.17835, 0.6803665, 0.1094159, 0, 0, 0, 1, 1,
1.180704, 0.8287645, 1.92096, 0, 0, 0, 1, 1,
1.18945, 0.7084506, 0.9421778, 1, 1, 1, 1, 1,
1.190981, -1.31563, 1.961606, 1, 1, 1, 1, 1,
1.192346, 0.5404105, 0.02355761, 1, 1, 1, 1, 1,
1.192965, -1.721021, 2.207411, 1, 1, 1, 1, 1,
1.201803, 0.825794, 0.3167953, 1, 1, 1, 1, 1,
1.202731, -0.5272643, 0.3955833, 1, 1, 1, 1, 1,
1.211457, -1.966812, 1.408144, 1, 1, 1, 1, 1,
1.213027, -0.8543099, 2.427234, 1, 1, 1, 1, 1,
1.21332, -0.8765208, 1.48616, 1, 1, 1, 1, 1,
1.215819, -1.761292, 4.806369, 1, 1, 1, 1, 1,
1.22353, -0.803439, 1.272217, 1, 1, 1, 1, 1,
1.225572, 0.4240101, 1.855851, 1, 1, 1, 1, 1,
1.233567, 0.4014827, 1.324618, 1, 1, 1, 1, 1,
1.241165, 0.585486, 1.073584, 1, 1, 1, 1, 1,
1.244135, 2.287881, 0.6108578, 1, 1, 1, 1, 1,
1.245423, -0.4866954, 2.990483, 0, 0, 1, 1, 1,
1.249646, -0.8674482, 0.8679645, 1, 0, 0, 1, 1,
1.249992, -0.2977354, 2.811454, 1, 0, 0, 1, 1,
1.252539, -0.3813658, 2.742342, 1, 0, 0, 1, 1,
1.261269, 0.1335299, 0.9861632, 1, 0, 0, 1, 1,
1.26281, -0.3269923, 1.064944, 1, 0, 0, 1, 1,
1.289556, -0.2460891, 1.203946, 0, 0, 0, 1, 1,
1.292219, -0.6244277, 2.137976, 0, 0, 0, 1, 1,
1.296838, -0.1174442, 3.97016, 0, 0, 0, 1, 1,
1.303268, -1.09958, 0.8914266, 0, 0, 0, 1, 1,
1.304658, 0.9059064, 0.7060959, 0, 0, 0, 1, 1,
1.308595, -0.4192533, 2.526867, 0, 0, 0, 1, 1,
1.312647, -1.346564, 3.017298, 0, 0, 0, 1, 1,
1.3138, 1.21112, 0.2143523, 1, 1, 1, 1, 1,
1.315803, 1.436451, 1.60176, 1, 1, 1, 1, 1,
1.329594, 0.3141771, 1.150317, 1, 1, 1, 1, 1,
1.337376, 0.5584267, 0.7893323, 1, 1, 1, 1, 1,
1.33776, 0.4998722, 0.4770343, 1, 1, 1, 1, 1,
1.337973, 0.5308172, 2.790138, 1, 1, 1, 1, 1,
1.346886, -0.2611831, 3.481297, 1, 1, 1, 1, 1,
1.350489, -0.1272692, 1.587275, 1, 1, 1, 1, 1,
1.355245, 0.443214, 3.374901, 1, 1, 1, 1, 1,
1.357637, -0.3735782, 0.7522775, 1, 1, 1, 1, 1,
1.357696, 0.4740478, 2.495804, 1, 1, 1, 1, 1,
1.379989, -2.169825, 2.098369, 1, 1, 1, 1, 1,
1.393475, -1.301452, 3.014561, 1, 1, 1, 1, 1,
1.4096, 1.30824, -0.09867478, 1, 1, 1, 1, 1,
1.414825, 0.5791, 2.246922, 1, 1, 1, 1, 1,
1.416198, 0.3529398, 0.5783284, 0, 0, 1, 1, 1,
1.425431, -0.3477557, 1.772495, 1, 0, 0, 1, 1,
1.427509, -1.258075, 0.9433547, 1, 0, 0, 1, 1,
1.434657, 0.2096571, 1.280251, 1, 0, 0, 1, 1,
1.435634, 0.03770049, 1.530143, 1, 0, 0, 1, 1,
1.43774, -1.630137, 4.857306, 1, 0, 0, 1, 1,
1.440804, -0.8925197, 2.599823, 0, 0, 0, 1, 1,
1.444758, -0.4176399, 3.880238, 0, 0, 0, 1, 1,
1.450337, 0.0503941, 1.394054, 0, 0, 0, 1, 1,
1.452672, -0.3305689, 1.574786, 0, 0, 0, 1, 1,
1.484243, -0.2840791, -0.4538678, 0, 0, 0, 1, 1,
1.496291, -1.67522, 1.936795, 0, 0, 0, 1, 1,
1.508721, 0.9704653, 3.123534, 0, 0, 0, 1, 1,
1.511038, -0.6140124, 1.327592, 1, 1, 1, 1, 1,
1.513121, -0.5551207, 0.8598441, 1, 1, 1, 1, 1,
1.521484, 1.687153, 0.510502, 1, 1, 1, 1, 1,
1.526583, -0.8852039, 2.363871, 1, 1, 1, 1, 1,
1.528559, 0.8460084, 1.782462, 1, 1, 1, 1, 1,
1.537918, -1.118131, 1.778109, 1, 1, 1, 1, 1,
1.548433, 0.1514826, 2.211511, 1, 1, 1, 1, 1,
1.554116, 1.111111, 1.439966, 1, 1, 1, 1, 1,
1.562973, 0.06048894, 1.323039, 1, 1, 1, 1, 1,
1.565744, 0.408672, 0.8863432, 1, 1, 1, 1, 1,
1.578614, 0.6163635, 1.31498, 1, 1, 1, 1, 1,
1.580045, 0.207377, -0.390332, 1, 1, 1, 1, 1,
1.581044, -1.546417, 1.500054, 1, 1, 1, 1, 1,
1.593035, -1.005873, 2.38416, 1, 1, 1, 1, 1,
1.610132, -0.2705174, -0.8018987, 1, 1, 1, 1, 1,
1.61116, -0.7215415, 1.73013, 0, 0, 1, 1, 1,
1.611179, 0.9796566, 0.4798246, 1, 0, 0, 1, 1,
1.646781, 0.0799279, -0.2390886, 1, 0, 0, 1, 1,
1.649425, 0.3676348, 1.49775, 1, 0, 0, 1, 1,
1.662542, -0.2502146, 0.5707449, 1, 0, 0, 1, 1,
1.66654, 1.070424, 0.6608074, 1, 0, 0, 1, 1,
1.682561, 0.3316788, 2.730799, 0, 0, 0, 1, 1,
1.686588, -1.20273, 2.270412, 0, 0, 0, 1, 1,
1.697507, 0.8742172, -0.1059265, 0, 0, 0, 1, 1,
1.703035, 1.598146, 2.17544, 0, 0, 0, 1, 1,
1.729002, -0.4707043, 3.443665, 0, 0, 0, 1, 1,
1.73352, 0.3018811, 1.554633, 0, 0, 0, 1, 1,
1.73568, 0.2309581, 1.00448, 0, 0, 0, 1, 1,
1.744586, -0.1170582, 1.831699, 1, 1, 1, 1, 1,
1.765846, -0.5723508, 2.087645, 1, 1, 1, 1, 1,
1.781676, -0.2989458, 0.4284704, 1, 1, 1, 1, 1,
1.797767, -0.492264, 1.576887, 1, 1, 1, 1, 1,
1.801218, 0.7643547, 1.464036, 1, 1, 1, 1, 1,
1.808107, -0.7580765, 0.5985617, 1, 1, 1, 1, 1,
1.8173, 1.418683, 1.019176, 1, 1, 1, 1, 1,
1.831195, -0.07218643, 0.07191198, 1, 1, 1, 1, 1,
1.836578, 0.08031818, 1.749746, 1, 1, 1, 1, 1,
1.886758, 0.8782256, 0.8612491, 1, 1, 1, 1, 1,
1.904927, 0.9155927, 1.443813, 1, 1, 1, 1, 1,
1.950982, 0.7441283, 2.088104, 1, 1, 1, 1, 1,
1.981386, -0.07380455, 1.191619, 1, 1, 1, 1, 1,
1.985879, -0.07824824, 1.235659, 1, 1, 1, 1, 1,
1.992504, -0.4592336, 4.154281, 1, 1, 1, 1, 1,
2.039857, 1.26293, 1.629208, 0, 0, 1, 1, 1,
2.040194, 0.8183599, 1.747871, 1, 0, 0, 1, 1,
2.044405, 0.07592369, 1.868221, 1, 0, 0, 1, 1,
2.134312, -0.5402481, 2.095022, 1, 0, 0, 1, 1,
2.140205, 1.091452, 1.853569, 1, 0, 0, 1, 1,
2.147386, -0.9271584, 0.3085529, 1, 0, 0, 1, 1,
2.232706, 0.5684781, 0.3438372, 0, 0, 0, 1, 1,
2.238153, 0.08142008, 2.054404, 0, 0, 0, 1, 1,
2.241745, -0.4375638, 1.389323, 0, 0, 0, 1, 1,
2.313255, 1.372584, 1.342084, 0, 0, 0, 1, 1,
2.381136, -0.2388655, 2.799144, 0, 0, 0, 1, 1,
2.493312, 0.905358, 3.076519, 0, 0, 0, 1, 1,
2.506092, -0.8003283, 0.9422673, 0, 0, 0, 1, 1,
2.625047, 0.1065449, -0.07515313, 1, 1, 1, 1, 1,
2.697326, -0.7198343, 0.8094772, 1, 1, 1, 1, 1,
2.714602, -0.8630679, 1.907598, 1, 1, 1, 1, 1,
2.764902, 0.9653794, 0.4345745, 1, 1, 1, 1, 1,
2.893241, 0.8565605, 0.6189553, 1, 1, 1, 1, 1,
3.132473, -1.059486, 0.2963152, 1, 1, 1, 1, 1,
3.359689, 1.266772, 1.373036, 1, 1, 1, 1, 1
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
var radius = 9.391781;
var distance = 32.98823;
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
mvMatrix.translate( -0.09072876, 0.1238225, 0.1499393 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.98823);
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
