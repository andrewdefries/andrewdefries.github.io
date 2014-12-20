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
-3.97893, 0.5529541, 0.2343756, 1, 0, 0, 1,
-3.288657, 0.1386264, -1.169517, 1, 0.007843138, 0, 1,
-2.936508, 0.07967114, -0.7558338, 1, 0.01176471, 0, 1,
-2.761412, 0.2841128, -1.007374, 1, 0.01960784, 0, 1,
-2.682642, -1.043043, -2.229509, 1, 0.02352941, 0, 1,
-2.576431, -1.507192, -1.787366, 1, 0.03137255, 0, 1,
-2.479205, -0.427601, -2.68619, 1, 0.03529412, 0, 1,
-2.410364, 0.7463674, -1.880848, 1, 0.04313726, 0, 1,
-2.378175, -1.110227, -0.7525033, 1, 0.04705882, 0, 1,
-2.296389, 0.6224203, -4.168327, 1, 0.05490196, 0, 1,
-2.239308, 0.3240224, -0.1325408, 1, 0.05882353, 0, 1,
-2.228163, 0.1498163, -2.76902, 1, 0.06666667, 0, 1,
-2.21239, 0.5952902, -0.3388483, 1, 0.07058824, 0, 1,
-2.196338, -0.9676144, -3.404005, 1, 0.07843138, 0, 1,
-2.185028, 0.9066003, -1.089301, 1, 0.08235294, 0, 1,
-2.17867, 1.879172, -0.9449407, 1, 0.09019608, 0, 1,
-2.167185, 0.2746733, -1.704823, 1, 0.09411765, 0, 1,
-2.16143, 0.3290856, -3.586262, 1, 0.1019608, 0, 1,
-2.128932, -0.3695887, -4.506402, 1, 0.1098039, 0, 1,
-2.126633, 0.09178358, -1.290072, 1, 0.1137255, 0, 1,
-2.109876, 0.04227656, -2.44563, 1, 0.1215686, 0, 1,
-2.102354, 0.3300999, -0.7772073, 1, 0.1254902, 0, 1,
-2.091059, -1.470069, -2.776198, 1, 0.1333333, 0, 1,
-2.02566, -0.1154645, -1.267186, 1, 0.1372549, 0, 1,
-2.016041, -0.4962615, -1.734032, 1, 0.145098, 0, 1,
-2.002625, -2.817918, -2.812457, 1, 0.1490196, 0, 1,
-1.988243, 0.01982579, -1.243604, 1, 0.1568628, 0, 1,
-1.986499, 0.0645332, -1.939344, 1, 0.1607843, 0, 1,
-1.979648, 2.385506, -1.27327, 1, 0.1686275, 0, 1,
-1.958158, 0.5623634, -1.102949, 1, 0.172549, 0, 1,
-1.927601, 1.311792, -0.5820935, 1, 0.1803922, 0, 1,
-1.926597, -0.04848559, -2.439595, 1, 0.1843137, 0, 1,
-1.916716, 0.6282924, -1.218323, 1, 0.1921569, 0, 1,
-1.898894, 0.5347224, -1.668537, 1, 0.1960784, 0, 1,
-1.889522, -1.900989, -3.184397, 1, 0.2039216, 0, 1,
-1.857191, -0.05473628, -2.352035, 1, 0.2117647, 0, 1,
-1.845062, 0.580615, -1.423474, 1, 0.2156863, 0, 1,
-1.838341, 0.7155927, 0.4822118, 1, 0.2235294, 0, 1,
-1.837778, 0.5327756, -1.386131, 1, 0.227451, 0, 1,
-1.836875, -0.5696481, -1.338742, 1, 0.2352941, 0, 1,
-1.804975, 1.02177, -1.613429, 1, 0.2392157, 0, 1,
-1.800617, -0.02341696, -0.74366, 1, 0.2470588, 0, 1,
-1.799635, 0.4863254, -2.399231, 1, 0.2509804, 0, 1,
-1.783999, 0.9552031, -0.6643854, 1, 0.2588235, 0, 1,
-1.774474, 0.4081881, -1.568637, 1, 0.2627451, 0, 1,
-1.741505, -1.225756, -1.572659, 1, 0.2705882, 0, 1,
-1.734605, -2.073211, -1.554153, 1, 0.2745098, 0, 1,
-1.719764, -1.454048, -1.665205, 1, 0.282353, 0, 1,
-1.705536, -0.9158421, -2.89065, 1, 0.2862745, 0, 1,
-1.675824, 1.496157, -0.5765573, 1, 0.2941177, 0, 1,
-1.639988, 0.7579705, -3.089551, 1, 0.3019608, 0, 1,
-1.619195, -2.280524, -1.4421, 1, 0.3058824, 0, 1,
-1.612088, 1.453205, -2.287099, 1, 0.3137255, 0, 1,
-1.610357, 1.158589, -0.6113974, 1, 0.3176471, 0, 1,
-1.605695, -1.24698, -1.214661, 1, 0.3254902, 0, 1,
-1.603401, -0.2513852, -0.4287725, 1, 0.3294118, 0, 1,
-1.602656, 0.168927, -1.395607, 1, 0.3372549, 0, 1,
-1.602242, 1.095711, -1.224788, 1, 0.3411765, 0, 1,
-1.600556, -0.1848399, -2.068602, 1, 0.3490196, 0, 1,
-1.583036, 0.2781994, -0.1297504, 1, 0.3529412, 0, 1,
-1.57123, 0.7609416, 0.5305991, 1, 0.3607843, 0, 1,
-1.564971, -0.1379902, -0.1935537, 1, 0.3647059, 0, 1,
-1.563872, -0.3373137, -2.608512, 1, 0.372549, 0, 1,
-1.559905, 1.701745, -2.088474, 1, 0.3764706, 0, 1,
-1.557394, -0.05877431, -1.158253, 1, 0.3843137, 0, 1,
-1.553128, -1.075082, -1.336466, 1, 0.3882353, 0, 1,
-1.542838, 0.8981267, -1.497833, 1, 0.3960784, 0, 1,
-1.536737, -0.5236316, -2.301838, 1, 0.4039216, 0, 1,
-1.524542, 0.6927114, -0.522931, 1, 0.4078431, 0, 1,
-1.521894, -0.6172027, -0.9277276, 1, 0.4156863, 0, 1,
-1.517737, 1.407195, 0.6452205, 1, 0.4196078, 0, 1,
-1.517223, 0.001883537, -1.92837, 1, 0.427451, 0, 1,
-1.505307, 0.7830731, -0.2415161, 1, 0.4313726, 0, 1,
-1.501033, -0.4658805, -2.4118, 1, 0.4392157, 0, 1,
-1.490786, 0.06155503, -4.027536, 1, 0.4431373, 0, 1,
-1.48667, 1.606315, 1.797588, 1, 0.4509804, 0, 1,
-1.484993, 0.241262, 0.2464435, 1, 0.454902, 0, 1,
-1.464706, -1.324898, -2.958349, 1, 0.4627451, 0, 1,
-1.451669, 0.04345747, -1.735155, 1, 0.4666667, 0, 1,
-1.450771, 1.985305, -0.2835553, 1, 0.4745098, 0, 1,
-1.448819, 2.551686, 0.1572528, 1, 0.4784314, 0, 1,
-1.442742, 0.7181844, -0.5387817, 1, 0.4862745, 0, 1,
-1.437764, 0.4237461, -1.673612, 1, 0.4901961, 0, 1,
-1.425177, 0.8487993, 0.01878111, 1, 0.4980392, 0, 1,
-1.422878, -2.271473, -2.326964, 1, 0.5058824, 0, 1,
-1.420191, 0.2784397, -2.742069, 1, 0.509804, 0, 1,
-1.411665, -1.308655, -0.06909596, 1, 0.5176471, 0, 1,
-1.407068, 2.581422, 1.078219, 1, 0.5215687, 0, 1,
-1.384875, -0.05468747, -2.232621, 1, 0.5294118, 0, 1,
-1.382617, -0.3082073, -1.141001, 1, 0.5333334, 0, 1,
-1.364093, -0.1719011, -0.7611377, 1, 0.5411765, 0, 1,
-1.357255, -0.8970069, -0.4556011, 1, 0.5450981, 0, 1,
-1.349939, -0.4763343, -3.63771, 1, 0.5529412, 0, 1,
-1.345685, 1.78815, -1.61998, 1, 0.5568628, 0, 1,
-1.328446, -3.130419, -2.720845, 1, 0.5647059, 0, 1,
-1.309418, 0.7058405, -0.9740161, 1, 0.5686275, 0, 1,
-1.298415, 0.240837, -2.611681, 1, 0.5764706, 0, 1,
-1.298004, 1.274713, 0.5685013, 1, 0.5803922, 0, 1,
-1.28501, -2.60866, -3.774528, 1, 0.5882353, 0, 1,
-1.282243, -0.6436458, -0.3735366, 1, 0.5921569, 0, 1,
-1.275689, 0.8629208, -1.892255, 1, 0.6, 0, 1,
-1.271816, -1.067013, -1.716354, 1, 0.6078432, 0, 1,
-1.271543, 0.3673497, -1.960696, 1, 0.6117647, 0, 1,
-1.270858, 2.995678, -1.604698, 1, 0.6196079, 0, 1,
-1.270417, -0.9798743, -0.1081789, 1, 0.6235294, 0, 1,
-1.268772, 0.6581266, -0.618162, 1, 0.6313726, 0, 1,
-1.263662, -0.1862661, -3.660882, 1, 0.6352941, 0, 1,
-1.26147, 2.923887, -2.882345, 1, 0.6431373, 0, 1,
-1.257574, 0.02654744, -0.9292006, 1, 0.6470588, 0, 1,
-1.252681, 0.9727786, -1.727013, 1, 0.654902, 0, 1,
-1.248897, 0.04303338, -2.866191, 1, 0.6588235, 0, 1,
-1.238188, 1.937736, 0.5143886, 1, 0.6666667, 0, 1,
-1.23562, 0.7860247, 0.8377782, 1, 0.6705883, 0, 1,
-1.227506, 0.7388331, 0.6822973, 1, 0.6784314, 0, 1,
-1.223125, 0.216455, -0.9736873, 1, 0.682353, 0, 1,
-1.217783, 0.5290313, -0.5370004, 1, 0.6901961, 0, 1,
-1.216537, -0.326517, -3.291866, 1, 0.6941177, 0, 1,
-1.213337, -0.6769381, -2.100912, 1, 0.7019608, 0, 1,
-1.205546, 2.152371, -0.5104754, 1, 0.7098039, 0, 1,
-1.204868, 1.450331, -1.888571, 1, 0.7137255, 0, 1,
-1.204394, -2.050643, -1.050248, 1, 0.7215686, 0, 1,
-1.203249, 1.113845, -1.069742, 1, 0.7254902, 0, 1,
-1.195373, 0.07570714, -0.5822616, 1, 0.7333333, 0, 1,
-1.191307, 0.4153723, -1.990713, 1, 0.7372549, 0, 1,
-1.173542, -0.3738583, -2.877459, 1, 0.7450981, 0, 1,
-1.166716, -0.7839648, -1.684629, 1, 0.7490196, 0, 1,
-1.166219, -0.4274136, -1.400631, 1, 0.7568628, 0, 1,
-1.165444, 0.9710799, -2.706038, 1, 0.7607843, 0, 1,
-1.162509, -0.005438625, -0.6187368, 1, 0.7686275, 0, 1,
-1.160512, -0.5124914, -1.746201, 1, 0.772549, 0, 1,
-1.155355, 1.424111, -2.120821, 1, 0.7803922, 0, 1,
-1.149601, 2.463866, -1.065527, 1, 0.7843137, 0, 1,
-1.142316, -0.5310098, -0.9122607, 1, 0.7921569, 0, 1,
-1.136623, 0.2370757, -2.830626, 1, 0.7960784, 0, 1,
-1.135291, 0.3893909, -0.6151722, 1, 0.8039216, 0, 1,
-1.133546, -1.46827, -2.141955, 1, 0.8117647, 0, 1,
-1.132018, 0.677483, -1.156334, 1, 0.8156863, 0, 1,
-1.122589, -0.06750493, -1.521548, 1, 0.8235294, 0, 1,
-1.121571, -2.382733, -3.489192, 1, 0.827451, 0, 1,
-1.11363, -1.426987, -2.49941, 1, 0.8352941, 0, 1,
-1.112476, 2.016559, -1.066167, 1, 0.8392157, 0, 1,
-1.108707, 0.5653918, 0.00758167, 1, 0.8470588, 0, 1,
-1.108527, 0.9856343, -1.685939, 1, 0.8509804, 0, 1,
-1.101511, 0.4269101, -1.537221, 1, 0.8588235, 0, 1,
-1.098004, -0.2574244, -0.4110545, 1, 0.8627451, 0, 1,
-1.097435, 0.08029205, -2.454764, 1, 0.8705882, 0, 1,
-1.097414, 0.08889892, -0.8647852, 1, 0.8745098, 0, 1,
-1.091067, 2.19689, -1.578186, 1, 0.8823529, 0, 1,
-1.086866, -1.01613, -2.030688, 1, 0.8862745, 0, 1,
-1.085859, -0.5694721, -0.921435, 1, 0.8941177, 0, 1,
-1.078258, 0.04542443, -1.06021, 1, 0.8980392, 0, 1,
-1.076872, 2.273004, 0.1857842, 1, 0.9058824, 0, 1,
-1.070236, -0.06356849, -1.29214, 1, 0.9137255, 0, 1,
-1.068539, -1.356043, -1.719737, 1, 0.9176471, 0, 1,
-1.064446, -0.3271675, -0.7231492, 1, 0.9254902, 0, 1,
-1.060276, 0.09372291, -2.837632, 1, 0.9294118, 0, 1,
-1.049247, 1.553998, -0.442384, 1, 0.9372549, 0, 1,
-1.048317, 1.422575, -0.9734401, 1, 0.9411765, 0, 1,
-1.044235, -0.09781444, -1.824552, 1, 0.9490196, 0, 1,
-1.043774, 0.5820518, -0.5721886, 1, 0.9529412, 0, 1,
-1.040306, 0.1407532, -2.850313, 1, 0.9607843, 0, 1,
-1.038101, -0.1260814, 0.1154722, 1, 0.9647059, 0, 1,
-1.034012, 0.01158555, -1.66488, 1, 0.972549, 0, 1,
-1.031928, -1.609401, -2.403969, 1, 0.9764706, 0, 1,
-1.024088, -1.229281, -3.228379, 1, 0.9843137, 0, 1,
-1.022889, -0.4675629, -2.951282, 1, 0.9882353, 0, 1,
-1.022175, 1.523484, 0.3785273, 1, 0.9960784, 0, 1,
-1.020531, -0.9918316, -2.071562, 0.9960784, 1, 0, 1,
-1.001447, -1.155093, -2.935088, 0.9921569, 1, 0, 1,
-0.9976507, 1.697779, 0.6393409, 0.9843137, 1, 0, 1,
-0.9888916, 1.576257, -0.6380985, 0.9803922, 1, 0, 1,
-0.9840973, 0.2539101, -1.24273, 0.972549, 1, 0, 1,
-0.981793, 1.140636, -1.328343, 0.9686275, 1, 0, 1,
-0.979123, 0.004887315, -2.778343, 0.9607843, 1, 0, 1,
-0.9782856, -0.2616047, -0.9689233, 0.9568627, 1, 0, 1,
-0.9729208, -0.491556, -2.939419, 0.9490196, 1, 0, 1,
-0.9680315, 0.3252052, -0.9185094, 0.945098, 1, 0, 1,
-0.9635207, -0.03288291, -2.310514, 0.9372549, 1, 0, 1,
-0.9633622, 2.289052, -0.3695115, 0.9333333, 1, 0, 1,
-0.9527274, -1.002012, -2.049709, 0.9254902, 1, 0, 1,
-0.9521059, -1.300583, -2.664976, 0.9215686, 1, 0, 1,
-0.9515116, -0.2613998, -2.342683, 0.9137255, 1, 0, 1,
-0.9500309, -2.460969, -1.784871, 0.9098039, 1, 0, 1,
-0.9494217, -0.5397568, -1.44964, 0.9019608, 1, 0, 1,
-0.9493763, 0.4834878, -2.122175, 0.8941177, 1, 0, 1,
-0.9463003, -1.071517, 0.05622593, 0.8901961, 1, 0, 1,
-0.9449599, -0.4738667, -2.701072, 0.8823529, 1, 0, 1,
-0.9435784, -0.8898159, -0.7561694, 0.8784314, 1, 0, 1,
-0.9424149, 0.2181462, 0.368547, 0.8705882, 1, 0, 1,
-0.9401982, -0.006176075, -1.839543, 0.8666667, 1, 0, 1,
-0.9373943, 0.3760545, -0.6124051, 0.8588235, 1, 0, 1,
-0.9280788, 0.09687291, -2.060119, 0.854902, 1, 0, 1,
-0.927232, 2.370997, -1.138646, 0.8470588, 1, 0, 1,
-0.9253342, -0.3608078, -1.961953, 0.8431373, 1, 0, 1,
-0.9237759, -0.9797539, -0.8302649, 0.8352941, 1, 0, 1,
-0.9127133, 0.9391649, -1.012234, 0.8313726, 1, 0, 1,
-0.9115389, 0.3179026, -0.2836668, 0.8235294, 1, 0, 1,
-0.9090871, 0.006664846, 0.1013812, 0.8196079, 1, 0, 1,
-0.9058143, -1.103823, -4.19287, 0.8117647, 1, 0, 1,
-0.9047626, 0.4996755, -2.756637, 0.8078431, 1, 0, 1,
-0.9027613, -0.9447723, -2.694003, 0.8, 1, 0, 1,
-0.9004078, 1.467811, -0.5248092, 0.7921569, 1, 0, 1,
-0.9000949, 0.7561322, -1.254389, 0.7882353, 1, 0, 1,
-0.8957612, -0.4375807, -3.080895, 0.7803922, 1, 0, 1,
-0.8937938, -1.278975, -3.822629, 0.7764706, 1, 0, 1,
-0.8930178, -0.5380803, -3.257637, 0.7686275, 1, 0, 1,
-0.8888398, -0.5173934, -4.609866, 0.7647059, 1, 0, 1,
-0.8886316, -0.4185377, -2.078196, 0.7568628, 1, 0, 1,
-0.8853028, 0.617855, -1.912326, 0.7529412, 1, 0, 1,
-0.882022, 1.396344, -2.333172, 0.7450981, 1, 0, 1,
-0.8793764, -0.07770443, -0.08949926, 0.7411765, 1, 0, 1,
-0.8776694, 0.1048658, -1.400423, 0.7333333, 1, 0, 1,
-0.8770607, 1.412241, -0.5940038, 0.7294118, 1, 0, 1,
-0.8766919, 1.134231, -0.5282532, 0.7215686, 1, 0, 1,
-0.8749077, 0.6196784, -1.016194, 0.7176471, 1, 0, 1,
-0.8645627, 0.7078434, -1.869217, 0.7098039, 1, 0, 1,
-0.8635567, 1.586443, -0.1376916, 0.7058824, 1, 0, 1,
-0.855513, 2.10053, 0.2975162, 0.6980392, 1, 0, 1,
-0.8470212, 0.6584075, -0.8521922, 0.6901961, 1, 0, 1,
-0.8457426, -0.03220048, -1.056853, 0.6862745, 1, 0, 1,
-0.8423266, -0.4868754, -3.097131, 0.6784314, 1, 0, 1,
-0.8376909, -0.3571, -0.4816039, 0.6745098, 1, 0, 1,
-0.8327441, 0.6292488, -1.662873, 0.6666667, 1, 0, 1,
-0.827942, 0.3378861, -0.7929846, 0.6627451, 1, 0, 1,
-0.8272772, -1.229922, -1.464301, 0.654902, 1, 0, 1,
-0.823079, 0.03020032, -1.104972, 0.6509804, 1, 0, 1,
-0.8136791, -0.4623962, -3.360353, 0.6431373, 1, 0, 1,
-0.8107222, -1.064115, -2.577186, 0.6392157, 1, 0, 1,
-0.8103417, 0.0480111, -0.4055456, 0.6313726, 1, 0, 1,
-0.8074958, -0.4255864, -3.268414, 0.627451, 1, 0, 1,
-0.8045824, 0.5846343, 0.2457045, 0.6196079, 1, 0, 1,
-0.8042136, 1.174103, 0.5565465, 0.6156863, 1, 0, 1,
-0.7998561, 0.2903869, -0.7101146, 0.6078432, 1, 0, 1,
-0.7931798, 0.862588, -0.004250235, 0.6039216, 1, 0, 1,
-0.7906702, 1.267732, -1.460176, 0.5960785, 1, 0, 1,
-0.7906068, -0.3457548, -2.636017, 0.5882353, 1, 0, 1,
-0.7873259, -0.2814189, -1.959117, 0.5843138, 1, 0, 1,
-0.787312, 0.2103115, -1.051079, 0.5764706, 1, 0, 1,
-0.7803024, 0.2962534, -1.32312, 0.572549, 1, 0, 1,
-0.7764837, -1.039187, -1.876419, 0.5647059, 1, 0, 1,
-0.7732533, -0.8654132, -1.492477, 0.5607843, 1, 0, 1,
-0.7649561, 0.6406751, -0.6198611, 0.5529412, 1, 0, 1,
-0.759618, 0.7004097, -2.334069, 0.5490196, 1, 0, 1,
-0.7582635, -1.172382, -1.856863, 0.5411765, 1, 0, 1,
-0.7555652, 1.552211, -0.8240396, 0.5372549, 1, 0, 1,
-0.7543094, -0.5897654, -3.138456, 0.5294118, 1, 0, 1,
-0.7531854, -1.326573, -3.025574, 0.5254902, 1, 0, 1,
-0.7525799, -0.9060043, -2.551639, 0.5176471, 1, 0, 1,
-0.7525392, -0.9068602, -3.444989, 0.5137255, 1, 0, 1,
-0.7493109, -1.202114, -2.054996, 0.5058824, 1, 0, 1,
-0.735649, 0.07433698, -2.224629, 0.5019608, 1, 0, 1,
-0.7322732, -2.459956, -4.179062, 0.4941176, 1, 0, 1,
-0.7296069, -0.7239774, -3.100269, 0.4862745, 1, 0, 1,
-0.728851, -2.293872, -1.525996, 0.4823529, 1, 0, 1,
-0.7238048, -0.7333649, -1.359114, 0.4745098, 1, 0, 1,
-0.7232125, 0.2254823, -1.463366, 0.4705882, 1, 0, 1,
-0.7187996, 0.01764945, 0.1004293, 0.4627451, 1, 0, 1,
-0.7097521, -0.4412923, -3.128135, 0.4588235, 1, 0, 1,
-0.7033318, -1.050688, -2.670113, 0.4509804, 1, 0, 1,
-0.7017025, -0.1100329, -0.8424221, 0.4470588, 1, 0, 1,
-0.7010108, -0.7085927, -0.9202177, 0.4392157, 1, 0, 1,
-0.6988031, -0.1557447, -2.421557, 0.4352941, 1, 0, 1,
-0.6969321, 0.7060608, 0.8906475, 0.427451, 1, 0, 1,
-0.6941702, -2.77075, -4.112145, 0.4235294, 1, 0, 1,
-0.6871487, 0.3128661, -0.491118, 0.4156863, 1, 0, 1,
-0.68694, 1.444205, -0.05896299, 0.4117647, 1, 0, 1,
-0.6859155, -2.886122, -2.652435, 0.4039216, 1, 0, 1,
-0.6820825, -0.09075095, -0.6462917, 0.3960784, 1, 0, 1,
-0.6638807, 0.3695548, -2.415395, 0.3921569, 1, 0, 1,
-0.6630011, -0.4733118, -1.57157, 0.3843137, 1, 0, 1,
-0.6620678, 0.6475931, -1.156603, 0.3803922, 1, 0, 1,
-0.661118, -0.7886335, -3.88609, 0.372549, 1, 0, 1,
-0.6603886, -0.09635385, -0.4831144, 0.3686275, 1, 0, 1,
-0.6517535, 0.3982019, -0.2344566, 0.3607843, 1, 0, 1,
-0.6487736, -0.7219176, -3.690948, 0.3568628, 1, 0, 1,
-0.6467072, 0.03775035, 0.08231591, 0.3490196, 1, 0, 1,
-0.6466711, 0.8529791, -1.635756, 0.345098, 1, 0, 1,
-0.6456836, -1.39694, -1.286727, 0.3372549, 1, 0, 1,
-0.6434894, 1.36687, -1.74691, 0.3333333, 1, 0, 1,
-0.6366963, -0.2756486, -0.644249, 0.3254902, 1, 0, 1,
-0.6339276, 0.6313541, -0.6319891, 0.3215686, 1, 0, 1,
-0.6336984, -2.113766, -2.941256, 0.3137255, 1, 0, 1,
-0.632757, -0.3281907, -2.300059, 0.3098039, 1, 0, 1,
-0.6305109, -0.8807454, -3.186507, 0.3019608, 1, 0, 1,
-0.6281513, -0.3504189, -2.175456, 0.2941177, 1, 0, 1,
-0.6269977, 1.303448, 1.359343, 0.2901961, 1, 0, 1,
-0.6259317, -0.0007113041, -2.958299, 0.282353, 1, 0, 1,
-0.6254081, -0.1660992, -1.512274, 0.2784314, 1, 0, 1,
-0.6222233, 0.4753456, -1.04744, 0.2705882, 1, 0, 1,
-0.6207854, 0.4581216, -2.775672, 0.2666667, 1, 0, 1,
-0.6149997, 1.010205, 0.2532792, 0.2588235, 1, 0, 1,
-0.6120435, 1.004958, -0.9908528, 0.254902, 1, 0, 1,
-0.6119633, 2.434408, -0.8311116, 0.2470588, 1, 0, 1,
-0.6048535, -0.2800849, -3.103355, 0.2431373, 1, 0, 1,
-0.6001047, 1.45302, -1.152779, 0.2352941, 1, 0, 1,
-0.5997298, -0.8621312, -2.82469, 0.2313726, 1, 0, 1,
-0.5891125, 1.478469, -1.209022, 0.2235294, 1, 0, 1,
-0.5843392, 0.2008345, -2.58054, 0.2196078, 1, 0, 1,
-0.5747602, -0.9928198, -3.73138, 0.2117647, 1, 0, 1,
-0.5647842, 0.5181583, -0.9179402, 0.2078431, 1, 0, 1,
-0.5642634, 1.927204, 1.87907, 0.2, 1, 0, 1,
-0.5582653, 0.2526416, -0.02761062, 0.1921569, 1, 0, 1,
-0.5523469, 0.8546463, -2.106237, 0.1882353, 1, 0, 1,
-0.5472205, -0.5530677, -2.070111, 0.1803922, 1, 0, 1,
-0.5464849, -0.2369974, -3.312171, 0.1764706, 1, 0, 1,
-0.5460952, -0.06552902, -1.650199, 0.1686275, 1, 0, 1,
-0.5456958, -0.2955523, -3.185483, 0.1647059, 1, 0, 1,
-0.5452006, 0.6984842, -0.5695528, 0.1568628, 1, 0, 1,
-0.5435233, 0.9475735, -0.2947519, 0.1529412, 1, 0, 1,
-0.5405987, -1.490526, -4.380435, 0.145098, 1, 0, 1,
-0.5387992, 0.3574376, -1.753937, 0.1411765, 1, 0, 1,
-0.5378587, -0.1868775, -1.642694, 0.1333333, 1, 0, 1,
-0.5297519, -0.3424404, -2.953052, 0.1294118, 1, 0, 1,
-0.5280832, 0.105395, -1.304693, 0.1215686, 1, 0, 1,
-0.5264673, 0.4452922, -2.923397, 0.1176471, 1, 0, 1,
-0.5225027, -0.2439072, -1.454697, 0.1098039, 1, 0, 1,
-0.5203635, 0.1829862, -0.1064165, 0.1058824, 1, 0, 1,
-0.516807, -1.829597, -2.776197, 0.09803922, 1, 0, 1,
-0.5155255, -0.6077178, -3.02334, 0.09019608, 1, 0, 1,
-0.5101857, -1.304894, -3.981253, 0.08627451, 1, 0, 1,
-0.5056562, -0.1490968, -1.357951, 0.07843138, 1, 0, 1,
-0.5044398, 0.7638451, 0.7681669, 0.07450981, 1, 0, 1,
-0.5001677, 0.224446, -3.126528, 0.06666667, 1, 0, 1,
-0.4989329, 0.005045179, 0.592327, 0.0627451, 1, 0, 1,
-0.4968943, 1.01168, -0.5682443, 0.05490196, 1, 0, 1,
-0.493921, 1.564192, -2.075964, 0.05098039, 1, 0, 1,
-0.493445, 0.9515167, -0.4593661, 0.04313726, 1, 0, 1,
-0.4896656, -1.400971, -2.953748, 0.03921569, 1, 0, 1,
-0.4889377, -1.753661, -1.92239, 0.03137255, 1, 0, 1,
-0.48414, 0.8143415, -0.8690609, 0.02745098, 1, 0, 1,
-0.48304, -1.813964, -3.492425, 0.01960784, 1, 0, 1,
-0.480879, 1.405684, -2.334714, 0.01568628, 1, 0, 1,
-0.4796403, 1.312002, -0.1272271, 0.007843138, 1, 0, 1,
-0.4776007, 0.5809906, 0.6357852, 0.003921569, 1, 0, 1,
-0.4773099, -0.7977089, -2.198457, 0, 1, 0.003921569, 1,
-0.4743618, 0.213991, -2.325044, 0, 1, 0.01176471, 1,
-0.4721533, -0.2642655, -1.415549, 0, 1, 0.01568628, 1,
-0.4718869, 0.4163148, 1.598544, 0, 1, 0.02352941, 1,
-0.4713171, -0.7978406, -4.280569, 0, 1, 0.02745098, 1,
-0.4670413, -0.9070413, -3.454311, 0, 1, 0.03529412, 1,
-0.4642326, 0.5885306, 0.2872191, 0, 1, 0.03921569, 1,
-0.4639228, 0.5600101, 1.415678, 0, 1, 0.04705882, 1,
-0.4629679, -0.8889696, -1.703288, 0, 1, 0.05098039, 1,
-0.4615304, 1.428465, 0.1106395, 0, 1, 0.05882353, 1,
-0.4612386, 1.830237, -2.752833, 0, 1, 0.0627451, 1,
-0.4584053, 0.4307544, -1.087201, 0, 1, 0.07058824, 1,
-0.4556497, 1.509025, -0.8553053, 0, 1, 0.07450981, 1,
-0.4554103, -0.7611341, -4.125492, 0, 1, 0.08235294, 1,
-0.4535632, 1.146114, -1.284656, 0, 1, 0.08627451, 1,
-0.4514205, 1.444342, -1.325858, 0, 1, 0.09411765, 1,
-0.4493452, 1.770798, -0.6609839, 0, 1, 0.1019608, 1,
-0.4475413, 0.3054239, 0.04492455, 0, 1, 0.1058824, 1,
-0.4468617, 0.5899161, 1.577957, 0, 1, 0.1137255, 1,
-0.4450693, -0.3119833, -0.331159, 0, 1, 0.1176471, 1,
-0.4442798, 0.5904109, 0.6948769, 0, 1, 0.1254902, 1,
-0.4343734, -1.458628, -2.176808, 0, 1, 0.1294118, 1,
-0.431378, 0.1660484, -1.153473, 0, 1, 0.1372549, 1,
-0.4310171, -0.4499011, -2.377357, 0, 1, 0.1411765, 1,
-0.4308024, 0.568287, 0.9574811, 0, 1, 0.1490196, 1,
-0.4304825, 0.6794163, -0.1986745, 0, 1, 0.1529412, 1,
-0.4296236, 0.5571976, -1.640496, 0, 1, 0.1607843, 1,
-0.4279351, 1.359545, -1.71399, 0, 1, 0.1647059, 1,
-0.4228037, 0.7910197, -0.6139942, 0, 1, 0.172549, 1,
-0.4224115, 0.5611481, -2.262445, 0, 1, 0.1764706, 1,
-0.4218776, -0.482294, -2.88001, 0, 1, 0.1843137, 1,
-0.4129587, -0.2949116, -1.297381, 0, 1, 0.1882353, 1,
-0.4102101, -0.226639, -1.507542, 0, 1, 0.1960784, 1,
-0.406841, -0.8851989, -2.927468, 0, 1, 0.2039216, 1,
-0.4050566, 0.1675516, -1.615357, 0, 1, 0.2078431, 1,
-0.4044138, 0.3252966, -1.821968, 0, 1, 0.2156863, 1,
-0.3998705, 1.742141, 2.081009, 0, 1, 0.2196078, 1,
-0.39614, 0.3615273, 0.4392419, 0, 1, 0.227451, 1,
-0.3960015, -0.6691142, -0.5220085, 0, 1, 0.2313726, 1,
-0.3930188, -0.9111119, -2.845611, 0, 1, 0.2392157, 1,
-0.3922065, -0.4031534, -3.415803, 0, 1, 0.2431373, 1,
-0.3847603, -1.791517, -4.427651, 0, 1, 0.2509804, 1,
-0.3835104, -1.766891, -0.8909804, 0, 1, 0.254902, 1,
-0.3783092, -1.539165, -4.477984, 0, 1, 0.2627451, 1,
-0.3695338, 0.3598703, -0.6308498, 0, 1, 0.2666667, 1,
-0.3669506, 0.8092588, -1.217009, 0, 1, 0.2745098, 1,
-0.3565651, 0.275496, -0.2406164, 0, 1, 0.2784314, 1,
-0.3548506, 0.6486681, -1.895354, 0, 1, 0.2862745, 1,
-0.3526658, -0.1636944, -1.925461, 0, 1, 0.2901961, 1,
-0.3449747, 0.5930478, -1.170214, 0, 1, 0.2980392, 1,
-0.3444787, 0.3817788, 0.4008994, 0, 1, 0.3058824, 1,
-0.341987, 1.059739, -0.4891015, 0, 1, 0.3098039, 1,
-0.3376152, 1.740848, -0.5480352, 0, 1, 0.3176471, 1,
-0.3361725, -0.2279122, -0.6103593, 0, 1, 0.3215686, 1,
-0.3358499, -0.2620032, -3.5599, 0, 1, 0.3294118, 1,
-0.3357568, -0.1171309, -0.7674192, 0, 1, 0.3333333, 1,
-0.3340467, 1.136372, -0.2894425, 0, 1, 0.3411765, 1,
-0.332545, -0.8545303, -3.307168, 0, 1, 0.345098, 1,
-0.3321093, -0.6916552, -3.889002, 0, 1, 0.3529412, 1,
-0.3289188, -0.03645582, -1.353438, 0, 1, 0.3568628, 1,
-0.3288317, 0.278753, 0.1539878, 0, 1, 0.3647059, 1,
-0.3279377, 1.598062, -0.1958028, 0, 1, 0.3686275, 1,
-0.3254129, 0.0510686, 0.8529429, 0, 1, 0.3764706, 1,
-0.3205177, 0.3815314, -0.5444222, 0, 1, 0.3803922, 1,
-0.3180735, 0.6217723, -0.6288368, 0, 1, 0.3882353, 1,
-0.317521, 1.657267, -0.1007134, 0, 1, 0.3921569, 1,
-0.3159452, -0.1603876, -2.039855, 0, 1, 0.4, 1,
-0.3091539, -0.6612787, -2.726564, 0, 1, 0.4078431, 1,
-0.3041455, -0.1614572, -3.661309, 0, 1, 0.4117647, 1,
-0.3030944, 0.5780823, -1.783547, 0, 1, 0.4196078, 1,
-0.3022746, -0.8389894, -3.225061, 0, 1, 0.4235294, 1,
-0.2996736, -1.281431, -2.105944, 0, 1, 0.4313726, 1,
-0.2970932, -1.35779, -3.18295, 0, 1, 0.4352941, 1,
-0.2916556, -0.06402922, 0.3356712, 0, 1, 0.4431373, 1,
-0.2874562, 0.5731955, -1.164153, 0, 1, 0.4470588, 1,
-0.2784287, -1.949598, -2.931902, 0, 1, 0.454902, 1,
-0.2692491, 1.159017, -0.5991637, 0, 1, 0.4588235, 1,
-0.2661349, -0.34449, -3.399647, 0, 1, 0.4666667, 1,
-0.2655765, 0.1114528, -1.659475, 0, 1, 0.4705882, 1,
-0.2589936, -0.6474718, -3.038906, 0, 1, 0.4784314, 1,
-0.2584322, -0.5235946, -4.288889, 0, 1, 0.4823529, 1,
-0.2576889, 1.030749, -0.5098073, 0, 1, 0.4901961, 1,
-0.2558301, 1.405888, -0.3885105, 0, 1, 0.4941176, 1,
-0.2544345, -0.1316167, -3.101884, 0, 1, 0.5019608, 1,
-0.2532522, -0.2983126, -3.427175, 0, 1, 0.509804, 1,
-0.2530581, -0.3938327, -2.96748, 0, 1, 0.5137255, 1,
-0.2527083, 1.607506, 0.6664531, 0, 1, 0.5215687, 1,
-0.2519318, -0.2951501, -1.041158, 0, 1, 0.5254902, 1,
-0.2503053, 0.2510999, -1.002505, 0, 1, 0.5333334, 1,
-0.2500985, -0.3078268, -1.559673, 0, 1, 0.5372549, 1,
-0.2470064, -0.265869, -1.499091, 0, 1, 0.5450981, 1,
-0.246903, 0.8297828, -0.2976349, 0, 1, 0.5490196, 1,
-0.2402086, -1.557827, -1.419064, 0, 1, 0.5568628, 1,
-0.2389548, -0.4232844, -2.979945, 0, 1, 0.5607843, 1,
-0.2388306, 1.069957, -0.9417388, 0, 1, 0.5686275, 1,
-0.2342461, 0.26359, -1.168922, 0, 1, 0.572549, 1,
-0.2314873, -0.56758, -2.924554, 0, 1, 0.5803922, 1,
-0.2313997, 0.6099038, -1.256559, 0, 1, 0.5843138, 1,
-0.2281011, -0.08476899, -3.238587, 0, 1, 0.5921569, 1,
-0.2273143, 0.6717849, 1.976106, 0, 1, 0.5960785, 1,
-0.2216201, 0.162223, -1.381262, 0, 1, 0.6039216, 1,
-0.2169617, 2.583561, -1.618264, 0, 1, 0.6117647, 1,
-0.2075618, -0.7259995, -1.676912, 0, 1, 0.6156863, 1,
-0.2060329, -0.4839842, -2.361046, 0, 1, 0.6235294, 1,
-0.1968743, -1.077328, -3.175274, 0, 1, 0.627451, 1,
-0.19353, -0.0562462, -2.519186, 0, 1, 0.6352941, 1,
-0.1934698, 0.3071553, 0.7750189, 0, 1, 0.6392157, 1,
-0.1924394, 0.2352253, -0.2411986, 0, 1, 0.6470588, 1,
-0.1916317, 0.6624025, -0.4369367, 0, 1, 0.6509804, 1,
-0.1895856, -0.5994609, -1.124659, 0, 1, 0.6588235, 1,
-0.186076, 0.357437, -0.5135697, 0, 1, 0.6627451, 1,
-0.1850308, -0.367721, -1.936161, 0, 1, 0.6705883, 1,
-0.1839714, -0.6511835, -1.360192, 0, 1, 0.6745098, 1,
-0.1821687, -1.539599, -3.984046, 0, 1, 0.682353, 1,
-0.1812774, 1.155353, 0.4874771, 0, 1, 0.6862745, 1,
-0.1806025, -0.02293801, -3.048853, 0, 1, 0.6941177, 1,
-0.1788934, -2.285371, -1.496864, 0, 1, 0.7019608, 1,
-0.1719554, -0.748715, -2.498733, 0, 1, 0.7058824, 1,
-0.165844, 1.022809, -0.8865454, 0, 1, 0.7137255, 1,
-0.1644641, -0.5990353, -2.449255, 0, 1, 0.7176471, 1,
-0.158135, 0.008613493, -2.238011, 0, 1, 0.7254902, 1,
-0.1522703, -0.8270519, -2.93615, 0, 1, 0.7294118, 1,
-0.1490118, -0.1361968, -1.700446, 0, 1, 0.7372549, 1,
-0.147018, 1.058467, -0.8332571, 0, 1, 0.7411765, 1,
-0.1466807, -0.2484282, -3.213613, 0, 1, 0.7490196, 1,
-0.1387874, -0.9740613, -2.901649, 0, 1, 0.7529412, 1,
-0.1368324, -0.101455, -2.145706, 0, 1, 0.7607843, 1,
-0.1343673, -1.417416, -2.431954, 0, 1, 0.7647059, 1,
-0.1322047, -0.8387778, -3.805852, 0, 1, 0.772549, 1,
-0.1295666, -0.4911989, -2.472836, 0, 1, 0.7764706, 1,
-0.1244966, 0.4911344, 1.243441, 0, 1, 0.7843137, 1,
-0.1224712, 1.267955, -0.08623295, 0, 1, 0.7882353, 1,
-0.1216719, -0.5368125, -2.410171, 0, 1, 0.7960784, 1,
-0.1215394, -0.9822451, -3.726398, 0, 1, 0.8039216, 1,
-0.116868, 0.3854303, -0.2344857, 0, 1, 0.8078431, 1,
-0.1160537, -0.06785942, -2.451984, 0, 1, 0.8156863, 1,
-0.1142672, -1.253963, -2.900052, 0, 1, 0.8196079, 1,
-0.1114674, -0.5075166, -3.826918, 0, 1, 0.827451, 1,
-0.1097193, 1.0788, -0.9506204, 0, 1, 0.8313726, 1,
-0.1090505, -0.5543833, -3.626138, 0, 1, 0.8392157, 1,
-0.1009487, -1.596054, -2.922972, 0, 1, 0.8431373, 1,
-0.09925576, 1.373949, 0.4822142, 0, 1, 0.8509804, 1,
-0.09217762, -0.08226849, -2.254677, 0, 1, 0.854902, 1,
-0.09207241, -0.1527466, -2.526533, 0, 1, 0.8627451, 1,
-0.09062564, -1.412741, -3.678286, 0, 1, 0.8666667, 1,
-0.08123644, 1.259782, 0.8259357, 0, 1, 0.8745098, 1,
-0.08059864, 0.2763872, -2.258552, 0, 1, 0.8784314, 1,
-0.07503588, 0.8212577, -1.420677, 0, 1, 0.8862745, 1,
-0.06929018, 1.00028, 1.911125, 0, 1, 0.8901961, 1,
-0.06746434, 0.6732714, -0.32, 0, 1, 0.8980392, 1,
-0.06611735, 1.595725, 0.6859764, 0, 1, 0.9058824, 1,
-0.06017961, -0.9201631, -3.796628, 0, 1, 0.9098039, 1,
-0.05717656, -0.3814932, -2.537527, 0, 1, 0.9176471, 1,
-0.05199148, 1.807941, 1.513551, 0, 1, 0.9215686, 1,
-0.05160611, -0.2687165, -2.743946, 0, 1, 0.9294118, 1,
-0.05140376, -0.9381318, -2.841915, 0, 1, 0.9333333, 1,
-0.05136351, 1.576405, -1.145509, 0, 1, 0.9411765, 1,
-0.05025059, -1.137401, -2.215633, 0, 1, 0.945098, 1,
-0.04962404, -0.759432, -3.732633, 0, 1, 0.9529412, 1,
-0.04369416, 0.6839771, -1.292814, 0, 1, 0.9568627, 1,
-0.03815203, -2.212813, -3.72052, 0, 1, 0.9647059, 1,
-0.03791306, -1.424978, -2.85244, 0, 1, 0.9686275, 1,
-0.03412489, 0.5774956, -0.5312544, 0, 1, 0.9764706, 1,
-0.03151354, -0.3777954, -4.363774, 0, 1, 0.9803922, 1,
-0.0314209, -1.127037, -1.34537, 0, 1, 0.9882353, 1,
-0.02745382, 1.00929, 0.9451448, 0, 1, 0.9921569, 1,
-0.02577413, -0.608551, -3.803735, 0, 1, 1, 1,
-0.02044346, -0.6886649, -1.62442, 0, 0.9921569, 1, 1,
-0.01954723, -0.04407634, -1.957108, 0, 0.9882353, 1, 1,
-0.01788838, -0.0324376, -2.655808, 0, 0.9803922, 1, 1,
-0.01327859, 0.8653032, 0.01939555, 0, 0.9764706, 1, 1,
-0.01320607, 1.280047, -1.35126, 0, 0.9686275, 1, 1,
-0.01287977, 0.255608, -0.7160968, 0, 0.9647059, 1, 1,
-0.01182451, -0.3820676, -2.466989, 0, 0.9568627, 1, 1,
-0.01145406, -1.066653, -3.914021, 0, 0.9529412, 1, 1,
-0.01145232, -0.3668737, -2.670166, 0, 0.945098, 1, 1,
-0.009386998, 0.8668375, 0.2110422, 0, 0.9411765, 1, 1,
-0.004827119, -1.107325, -3.800548, 0, 0.9333333, 1, 1,
0.005254119, 0.00329041, 0.4083891, 0, 0.9294118, 1, 1,
0.006103917, 0.3819596, -0.3349516, 0, 0.9215686, 1, 1,
0.006520742, -1.32418, 3.974452, 0, 0.9176471, 1, 1,
0.009634891, 0.5504323, 0.6596654, 0, 0.9098039, 1, 1,
0.01067071, 0.1742188, -0.1298552, 0, 0.9058824, 1, 1,
0.01518058, -0.7798105, 4.3023, 0, 0.8980392, 1, 1,
0.01741149, 0.7393839, -0.3665027, 0, 0.8901961, 1, 1,
0.02738075, 0.9600225, 0.5827869, 0, 0.8862745, 1, 1,
0.03096399, -0.4141198, 0.8964981, 0, 0.8784314, 1, 1,
0.03460122, -0.4269664, 2.390408, 0, 0.8745098, 1, 1,
0.0390319, -1.186567, 3.497076, 0, 0.8666667, 1, 1,
0.04098247, 0.152492, -0.339722, 0, 0.8627451, 1, 1,
0.04348795, -0.1939935, 2.319948, 0, 0.854902, 1, 1,
0.04407172, -0.3269189, 4.33726, 0, 0.8509804, 1, 1,
0.04717001, 0.8759259, -1.027351, 0, 0.8431373, 1, 1,
0.04763584, 0.1436656, -0.8942658, 0, 0.8392157, 1, 1,
0.04819879, -1.080009, 1.798104, 0, 0.8313726, 1, 1,
0.05083794, -0.2779741, 2.288114, 0, 0.827451, 1, 1,
0.05157915, 1.425697, -0.6145387, 0, 0.8196079, 1, 1,
0.0526057, 1.495136, -0.7504174, 0, 0.8156863, 1, 1,
0.05313154, 0.4546623, 0.4462959, 0, 0.8078431, 1, 1,
0.0532489, -1.712672, 2.663307, 0, 0.8039216, 1, 1,
0.05615598, -1.862726, 1.609938, 0, 0.7960784, 1, 1,
0.05761667, -0.2101978, 3.001472, 0, 0.7882353, 1, 1,
0.05825968, -0.002713945, 1.62715, 0, 0.7843137, 1, 1,
0.05940209, -0.7327446, 2.274155, 0, 0.7764706, 1, 1,
0.05964953, 0.7936852, -0.2445971, 0, 0.772549, 1, 1,
0.05989615, -1.539097, 4.125134, 0, 0.7647059, 1, 1,
0.05994463, 0.0986919, 0.4725316, 0, 0.7607843, 1, 1,
0.06060106, -0.05129969, 2.133523, 0, 0.7529412, 1, 1,
0.06353582, 1.018698, 1.067268, 0, 0.7490196, 1, 1,
0.06376515, -0.01272281, 1.7973, 0, 0.7411765, 1, 1,
0.06709719, 0.7239224, 2.772754, 0, 0.7372549, 1, 1,
0.06735849, -0.08617919, 2.442041, 0, 0.7294118, 1, 1,
0.06777176, 0.6781914, 0.6367537, 0, 0.7254902, 1, 1,
0.07001853, 1.340371, -0.32517, 0, 0.7176471, 1, 1,
0.07586227, -0.1428919, 2.731999, 0, 0.7137255, 1, 1,
0.08179762, 1.245987, 0.4543498, 0, 0.7058824, 1, 1,
0.08349968, -0.3116561, 3.496389, 0, 0.6980392, 1, 1,
0.08569799, -0.7134657, 1.652124, 0, 0.6941177, 1, 1,
0.08631581, 0.8555385, -0.8928074, 0, 0.6862745, 1, 1,
0.08848408, -1.058182, 3.934072, 0, 0.682353, 1, 1,
0.08898231, 1.172875, 0.4052723, 0, 0.6745098, 1, 1,
0.0911311, 0.8296901, 2.647491, 0, 0.6705883, 1, 1,
0.09382235, -0.338638, 3.283463, 0, 0.6627451, 1, 1,
0.09843808, -0.2351267, 2.962055, 0, 0.6588235, 1, 1,
0.1024957, 0.2334882, 1.842348, 0, 0.6509804, 1, 1,
0.1029029, 0.2462734, -0.09894989, 0, 0.6470588, 1, 1,
0.106391, 1.401869, -1.177342, 0, 0.6392157, 1, 1,
0.1065863, -0.1238227, 2.370655, 0, 0.6352941, 1, 1,
0.1074866, 1.802311, 0.9451003, 0, 0.627451, 1, 1,
0.1078281, 0.4313272, -0.7288272, 0, 0.6235294, 1, 1,
0.1078957, -0.4842394, 0.9851285, 0, 0.6156863, 1, 1,
0.1125401, -0.5227972, 3.821296, 0, 0.6117647, 1, 1,
0.1151544, -1.750911, 4.210891, 0, 0.6039216, 1, 1,
0.1193886, -1.089471, 1.882322, 0, 0.5960785, 1, 1,
0.1205359, -0.7197595, 3.475457, 0, 0.5921569, 1, 1,
0.1242662, 0.9181046, -0.2592426, 0, 0.5843138, 1, 1,
0.1261045, -0.8719203, 4.526467, 0, 0.5803922, 1, 1,
0.126462, 1.237168, 1.411504, 0, 0.572549, 1, 1,
0.1286404, -1.2872, 3.1458, 0, 0.5686275, 1, 1,
0.1306512, -0.548008, 3.609877, 0, 0.5607843, 1, 1,
0.1328765, 1.320416, 0.2953112, 0, 0.5568628, 1, 1,
0.1381837, -0.3958651, 2.854414, 0, 0.5490196, 1, 1,
0.1403309, 0.1358728, 2.493914, 0, 0.5450981, 1, 1,
0.1445296, -0.380058, 3.661812, 0, 0.5372549, 1, 1,
0.1458315, 0.4337223, -1.802879, 0, 0.5333334, 1, 1,
0.1473671, 1.422415, -1.269219, 0, 0.5254902, 1, 1,
0.1503572, -1.27512, 2.606204, 0, 0.5215687, 1, 1,
0.1539667, 1.837605, 0.2030037, 0, 0.5137255, 1, 1,
0.1555948, -1.406197, 1.980914, 0, 0.509804, 1, 1,
0.1614113, -0.3963682, 2.817411, 0, 0.5019608, 1, 1,
0.1630178, 0.9147018, 1.666899, 0, 0.4941176, 1, 1,
0.1666433, -1.650038, 4.36838, 0, 0.4901961, 1, 1,
0.1708616, 1.49781, -0.2043128, 0, 0.4823529, 1, 1,
0.1744974, 0.6535822, -1.261309, 0, 0.4784314, 1, 1,
0.1764449, 0.5034144, 0.2688288, 0, 0.4705882, 1, 1,
0.1779376, -0.3526639, 2.698821, 0, 0.4666667, 1, 1,
0.1788988, 0.2301732, 0.6477178, 0, 0.4588235, 1, 1,
0.1859449, 2.14519, 0.06038829, 0, 0.454902, 1, 1,
0.1869465, 0.9584236, -0.4946467, 0, 0.4470588, 1, 1,
0.1893409, 0.2521036, 0.9507824, 0, 0.4431373, 1, 1,
0.1906542, 0.955586, 0.2400802, 0, 0.4352941, 1, 1,
0.1963422, 1.243526, -1.639134, 0, 0.4313726, 1, 1,
0.2171683, 1.084906, 0.3568918, 0, 0.4235294, 1, 1,
0.2226162, -2.103072, 2.800362, 0, 0.4196078, 1, 1,
0.2249401, 1.865792, 0.4425166, 0, 0.4117647, 1, 1,
0.2302541, -0.01278668, 1.394037, 0, 0.4078431, 1, 1,
0.2344034, -0.3461456, 3.428377, 0, 0.4, 1, 1,
0.237457, -0.4474506, 0.4957602, 0, 0.3921569, 1, 1,
0.242723, 0.5951349, 0.1669673, 0, 0.3882353, 1, 1,
0.2427245, 0.5019505, 0.9177315, 0, 0.3803922, 1, 1,
0.2430348, -0.3800271, 2.09129, 0, 0.3764706, 1, 1,
0.2448588, -1.156755, 1.887498, 0, 0.3686275, 1, 1,
0.2457204, -0.3244265, 2.334128, 0, 0.3647059, 1, 1,
0.2496284, -0.0276525, 1.067175, 0, 0.3568628, 1, 1,
0.2505085, -2.001492, 4.26546, 0, 0.3529412, 1, 1,
0.2639003, 0.3471162, 0.5988178, 0, 0.345098, 1, 1,
0.2643382, 0.5426148, 0.1470348, 0, 0.3411765, 1, 1,
0.2645132, -0.2775933, 2.394845, 0, 0.3333333, 1, 1,
0.2651558, 1.777616, 0.3945238, 0, 0.3294118, 1, 1,
0.2703476, -1.049659, 2.904667, 0, 0.3215686, 1, 1,
0.2726671, 0.2830367, 2.321159, 0, 0.3176471, 1, 1,
0.2731396, 0.1501915, 0.562989, 0, 0.3098039, 1, 1,
0.2732051, -1.517917, 1.756729, 0, 0.3058824, 1, 1,
0.2747058, 0.9212011, 0.6565164, 0, 0.2980392, 1, 1,
0.2753397, 0.3393966, 1.206965, 0, 0.2901961, 1, 1,
0.2754901, 0.1381627, 1.769759, 0, 0.2862745, 1, 1,
0.280576, 1.506339, 0.2232343, 0, 0.2784314, 1, 1,
0.281609, -0.7542139, 3.362343, 0, 0.2745098, 1, 1,
0.2862332, -0.03422932, 1.959269, 0, 0.2666667, 1, 1,
0.286299, 1.046937, 1.399809, 0, 0.2627451, 1, 1,
0.2902946, 0.6302075, 0.1461082, 0, 0.254902, 1, 1,
0.2973163, -2.915933, 2.381203, 0, 0.2509804, 1, 1,
0.3011513, -0.0269987, 1.99977, 0, 0.2431373, 1, 1,
0.3056169, 0.4743268, 0.2888088, 0, 0.2392157, 1, 1,
0.3057975, 1.377135, 0.5173956, 0, 0.2313726, 1, 1,
0.310851, -0.8668903, 1.531021, 0, 0.227451, 1, 1,
0.3130724, -0.1420501, 2.821202, 0, 0.2196078, 1, 1,
0.3150019, 1.963412, -0.1958381, 0, 0.2156863, 1, 1,
0.3213486, 0.5584885, 0.6704823, 0, 0.2078431, 1, 1,
0.3275888, -1.443484, 3.34339, 0, 0.2039216, 1, 1,
0.333945, 0.2150672, 1.363657, 0, 0.1960784, 1, 1,
0.3353192, -0.4030961, 1.554397, 0, 0.1882353, 1, 1,
0.3435069, -1.074176, 3.140012, 0, 0.1843137, 1, 1,
0.3458204, -0.4454046, 3.203106, 0, 0.1764706, 1, 1,
0.3488262, 0.002793357, 3.622058, 0, 0.172549, 1, 1,
0.3492443, 1.079116, -0.5785753, 0, 0.1647059, 1, 1,
0.3495191, 2.698065, -0.1291941, 0, 0.1607843, 1, 1,
0.3514045, -0.3957338, 1.09465, 0, 0.1529412, 1, 1,
0.3529219, 2.918874, 1.08483, 0, 0.1490196, 1, 1,
0.3532514, 1.428076, 0.2156786, 0, 0.1411765, 1, 1,
0.3541518, 1.152983, 2.469393, 0, 0.1372549, 1, 1,
0.3665244, -0.50766, 2.41151, 0, 0.1294118, 1, 1,
0.3720348, -1.143063, 2.572874, 0, 0.1254902, 1, 1,
0.3766553, 0.6076664, 0.8937137, 0, 0.1176471, 1, 1,
0.3789627, -0.313452, 2.201209, 0, 0.1137255, 1, 1,
0.3836725, 1.56171, -0.1649899, 0, 0.1058824, 1, 1,
0.3851482, 1.480337, -2.081059, 0, 0.09803922, 1, 1,
0.3875025, 1.869972, 1.018205, 0, 0.09411765, 1, 1,
0.3938513, 0.6327139, 0.8055724, 0, 0.08627451, 1, 1,
0.3974906, -0.3618003, 3.011946, 0, 0.08235294, 1, 1,
0.3975864, 0.4964811, -0.3230594, 0, 0.07450981, 1, 1,
0.4016781, -0.1463786, 0.5026579, 0, 0.07058824, 1, 1,
0.4036554, 0.5064676, 0.2465174, 0, 0.0627451, 1, 1,
0.4057038, 0.4389939, 0.6117739, 0, 0.05882353, 1, 1,
0.406938, -1.170125, 2.562159, 0, 0.05098039, 1, 1,
0.4069383, 0.6530058, -0.2557047, 0, 0.04705882, 1, 1,
0.4081115, 0.1079494, 1.417235, 0, 0.03921569, 1, 1,
0.4124891, -1.312827, 2.191584, 0, 0.03529412, 1, 1,
0.4177282, -0.2324473, 0.7950957, 0, 0.02745098, 1, 1,
0.4217249, -1.445609, 1.835079, 0, 0.02352941, 1, 1,
0.4221551, 0.5612245, 0.8926709, 0, 0.01568628, 1, 1,
0.4232202, -0.6848946, 3.479452, 0, 0.01176471, 1, 1,
0.423373, -0.6756338, 3.364799, 0, 0.003921569, 1, 1,
0.426373, -0.156004, 0.623378, 0.003921569, 0, 1, 1,
0.4264508, 0.6677681, 2.568501, 0.007843138, 0, 1, 1,
0.4264635, 0.4711346, 0.7325057, 0.01568628, 0, 1, 1,
0.4304845, 0.3159024, 1.223954, 0.01960784, 0, 1, 1,
0.4305669, 1.057014, -0.3402477, 0.02745098, 0, 1, 1,
0.4308971, -0.7503954, 4.213368, 0.03137255, 0, 1, 1,
0.4326761, 0.9022954, 2.811518, 0.03921569, 0, 1, 1,
0.4373671, -0.5828, 1.530582, 0.04313726, 0, 1, 1,
0.4420223, 0.5527629, 1.703469, 0.05098039, 0, 1, 1,
0.4426137, 0.4192403, 0.4881223, 0.05490196, 0, 1, 1,
0.4499684, -0.1131405, 0.583143, 0.0627451, 0, 1, 1,
0.4509356, -1.627891, 3.0342, 0.06666667, 0, 1, 1,
0.4536746, -0.4838501, 1.547362, 0.07450981, 0, 1, 1,
0.4552945, -0.1798939, -0.008966643, 0.07843138, 0, 1, 1,
0.4613939, -0.8447905, 1.423699, 0.08627451, 0, 1, 1,
0.4642667, -0.3486317, 2.478663, 0.09019608, 0, 1, 1,
0.4659409, -0.2568032, 1.823314, 0.09803922, 0, 1, 1,
0.4662814, -1.251725, 0.7759267, 0.1058824, 0, 1, 1,
0.4674647, -0.895281, 3.583587, 0.1098039, 0, 1, 1,
0.4703189, -0.2617602, 3.126607, 0.1176471, 0, 1, 1,
0.471756, -0.04487325, 1.030784, 0.1215686, 0, 1, 1,
0.4753804, 0.2014867, 0.9749693, 0.1294118, 0, 1, 1,
0.4771336, 1.42414, 0.3352369, 0.1333333, 0, 1, 1,
0.4774067, 1.148497, 1.491773, 0.1411765, 0, 1, 1,
0.4793455, 0.7436627, 1.054681, 0.145098, 0, 1, 1,
0.4824892, -0.3542315, 3.861893, 0.1529412, 0, 1, 1,
0.4867096, -0.002417314, 0.9554076, 0.1568628, 0, 1, 1,
0.4926232, 2.344861, 0.9235541, 0.1647059, 0, 1, 1,
0.494994, 1.147574, -0.9731105, 0.1686275, 0, 1, 1,
0.4963546, -0.09905559, 2.192853, 0.1764706, 0, 1, 1,
0.496942, 0.5435974, 1.285501, 0.1803922, 0, 1, 1,
0.500871, 0.7617341, -0.3029708, 0.1882353, 0, 1, 1,
0.5035986, -2.461996, 2.372718, 0.1921569, 0, 1, 1,
0.5044919, 1.604637, 2.75685, 0.2, 0, 1, 1,
0.5076222, 1.350908, -0.2491939, 0.2078431, 0, 1, 1,
0.5083994, -1.59261, 3.760684, 0.2117647, 0, 1, 1,
0.5157061, -0.8543453, 3.301126, 0.2196078, 0, 1, 1,
0.5191391, 2.403605, -0.4021643, 0.2235294, 0, 1, 1,
0.5193442, -1.169991, 3.823333, 0.2313726, 0, 1, 1,
0.5221815, 1.619236, -0.196143, 0.2352941, 0, 1, 1,
0.5256081, -0.9375634, 2.388563, 0.2431373, 0, 1, 1,
0.5370318, -0.1078142, 0.005283481, 0.2470588, 0, 1, 1,
0.5410945, 1.079097, -1.432572, 0.254902, 0, 1, 1,
0.544995, -1.334357, 2.762002, 0.2588235, 0, 1, 1,
0.546275, 0.8281016, 0.3282306, 0.2666667, 0, 1, 1,
0.5467681, 1.265529, 0.2579142, 0.2705882, 0, 1, 1,
0.5519891, -0.1042529, 0.3032902, 0.2784314, 0, 1, 1,
0.5524715, 0.2965109, 1.557629, 0.282353, 0, 1, 1,
0.5534551, -0.2876947, 2.309008, 0.2901961, 0, 1, 1,
0.5559529, 0.1491422, 0.5128214, 0.2941177, 0, 1, 1,
0.5575531, 0.3763673, 0.126413, 0.3019608, 0, 1, 1,
0.5633733, -0.7346955, 4.494546, 0.3098039, 0, 1, 1,
0.5695096, -0.2268166, 0.819694, 0.3137255, 0, 1, 1,
0.5753391, 0.2637716, 1.428495, 0.3215686, 0, 1, 1,
0.5764078, -0.2280975, 2.129367, 0.3254902, 0, 1, 1,
0.5764255, -0.571309, 1.259035, 0.3333333, 0, 1, 1,
0.5851542, 0.1058594, 1.030793, 0.3372549, 0, 1, 1,
0.5884754, -0.8628475, 2.944456, 0.345098, 0, 1, 1,
0.5887535, 0.05153286, 0.8713526, 0.3490196, 0, 1, 1,
0.5928803, 0.1586019, 0.9617718, 0.3568628, 0, 1, 1,
0.5939885, 0.3160621, -0.3016941, 0.3607843, 0, 1, 1,
0.6034393, 0.3558487, 1.33226, 0.3686275, 0, 1, 1,
0.609679, 0.9427657, 0.9069595, 0.372549, 0, 1, 1,
0.6137529, 0.4346377, -0.3088436, 0.3803922, 0, 1, 1,
0.6142005, -0.022146, 2.305586, 0.3843137, 0, 1, 1,
0.6209674, -0.8243656, 2.657686, 0.3921569, 0, 1, 1,
0.6233874, 1.340959, 2.941222, 0.3960784, 0, 1, 1,
0.6317111, 2.511541, 1.751472, 0.4039216, 0, 1, 1,
0.634896, -1.470384, 2.868757, 0.4117647, 0, 1, 1,
0.6371646, 0.2849656, 1.527818, 0.4156863, 0, 1, 1,
0.6386626, 0.6711357, 1.336027, 0.4235294, 0, 1, 1,
0.6393918, -0.5100297, 2.344687, 0.427451, 0, 1, 1,
0.6406966, 1.981566, -0.6093372, 0.4352941, 0, 1, 1,
0.6444873, -0.1423332, 2.215621, 0.4392157, 0, 1, 1,
0.645748, -0.9729409, 1.838133, 0.4470588, 0, 1, 1,
0.6468729, -0.04109429, 1.619131, 0.4509804, 0, 1, 1,
0.6484092, -0.04264813, 2.879465, 0.4588235, 0, 1, 1,
0.6500629, 0.464413, -0.1084561, 0.4627451, 0, 1, 1,
0.6525719, 1.873957, -2.22189, 0.4705882, 0, 1, 1,
0.6528242, 0.2088066, 2.183915, 0.4745098, 0, 1, 1,
0.6550065, 0.9261369, -1.396419, 0.4823529, 0, 1, 1,
0.6599938, -0.4451939, 0.8689966, 0.4862745, 0, 1, 1,
0.6620574, -0.151483, 0.9213227, 0.4941176, 0, 1, 1,
0.6622804, 0.4102996, 1.4813, 0.5019608, 0, 1, 1,
0.6662067, 0.5886194, 1.332319, 0.5058824, 0, 1, 1,
0.6676668, -0.2545555, 3.432773, 0.5137255, 0, 1, 1,
0.6896951, 0.2526057, 2.132852, 0.5176471, 0, 1, 1,
0.6934317, -1.432067, 2.908156, 0.5254902, 0, 1, 1,
0.6961178, -1.120715, 3.187669, 0.5294118, 0, 1, 1,
0.6972299, 0.6176888, 1.544192, 0.5372549, 0, 1, 1,
0.7003903, 1.555172, -0.6474571, 0.5411765, 0, 1, 1,
0.7004042, 0.6828942, -1.094205, 0.5490196, 0, 1, 1,
0.7009421, 0.2617487, 2.174104, 0.5529412, 0, 1, 1,
0.7021553, -1.125315, 3.291482, 0.5607843, 0, 1, 1,
0.7048433, 1.43276, 0.8675937, 0.5647059, 0, 1, 1,
0.7048531, 0.333284, 1.180294, 0.572549, 0, 1, 1,
0.7123252, -0.007334783, 0.4800485, 0.5764706, 0, 1, 1,
0.7130241, 0.7482036, 1.297492, 0.5843138, 0, 1, 1,
0.7184384, -0.9817826, 1.762262, 0.5882353, 0, 1, 1,
0.7187567, -0.1117763, 4.173496, 0.5960785, 0, 1, 1,
0.7197316, -0.756687, -0.007030461, 0.6039216, 0, 1, 1,
0.7224746, -2.595904, 3.064439, 0.6078432, 0, 1, 1,
0.7281203, 0.3915973, 0.957189, 0.6156863, 0, 1, 1,
0.728847, -0.8187613, 3.674757, 0.6196079, 0, 1, 1,
0.7318885, -1.070802, 1.888582, 0.627451, 0, 1, 1,
0.7347546, -1.122802, 3.054394, 0.6313726, 0, 1, 1,
0.7368677, 0.3999066, 1.748379, 0.6392157, 0, 1, 1,
0.7370391, -1.037437, 4.021283, 0.6431373, 0, 1, 1,
0.7377942, 1.194799, -0.9893641, 0.6509804, 0, 1, 1,
0.7436841, -2.150254, 1.682914, 0.654902, 0, 1, 1,
0.7439922, 0.4218233, 0.1268965, 0.6627451, 0, 1, 1,
0.7442123, 0.1672547, 0.6255414, 0.6666667, 0, 1, 1,
0.7451852, -1.230534, 4.683663, 0.6745098, 0, 1, 1,
0.7466938, -0.7476888, 1.214082, 0.6784314, 0, 1, 1,
0.749288, -0.7526798, 2.099658, 0.6862745, 0, 1, 1,
0.7535015, 1.258011, -0.7577187, 0.6901961, 0, 1, 1,
0.755209, -1.316093, 1.488357, 0.6980392, 0, 1, 1,
0.7590287, -0.6203622, 2.32997, 0.7058824, 0, 1, 1,
0.7678404, 0.3629536, 0.02155723, 0.7098039, 0, 1, 1,
0.7682341, 0.07067667, 3.529952, 0.7176471, 0, 1, 1,
0.7700266, -0.006954251, 2.821185, 0.7215686, 0, 1, 1,
0.772948, -0.5934732, 2.549349, 0.7294118, 0, 1, 1,
0.7781419, -0.3512508, 1.632472, 0.7333333, 0, 1, 1,
0.7823371, -1.282651, 4.19799, 0.7411765, 0, 1, 1,
0.7827439, 0.3423043, 0.9978575, 0.7450981, 0, 1, 1,
0.7838091, 1.788288, -1.28889, 0.7529412, 0, 1, 1,
0.7845384, 0.8104277, 0.5706144, 0.7568628, 0, 1, 1,
0.7876792, 0.9363033, 2.097398, 0.7647059, 0, 1, 1,
0.7882189, -1.030099, 3.007628, 0.7686275, 0, 1, 1,
0.7919138, 2.156166, 0.3399363, 0.7764706, 0, 1, 1,
0.8008011, -0.5486062, 2.053811, 0.7803922, 0, 1, 1,
0.8081884, -0.5518314, 2.405692, 0.7882353, 0, 1, 1,
0.808383, 0.5822378, 1.061002, 0.7921569, 0, 1, 1,
0.8087353, -0.8397032, 3.716119, 0.8, 0, 1, 1,
0.8122709, 0.08998318, 2.657584, 0.8078431, 0, 1, 1,
0.8175225, -1.654466, 2.807472, 0.8117647, 0, 1, 1,
0.8179229, 0.121403, 1.50832, 0.8196079, 0, 1, 1,
0.818899, -1.878955, 1.999927, 0.8235294, 0, 1, 1,
0.8205164, 0.5110082, 0.4026973, 0.8313726, 0, 1, 1,
0.8248699, -0.6607863, 1.193528, 0.8352941, 0, 1, 1,
0.8255892, 1.081301, -0.153442, 0.8431373, 0, 1, 1,
0.826758, -0.5702028, 2.259888, 0.8470588, 0, 1, 1,
0.835701, -0.009897086, 2.632978, 0.854902, 0, 1, 1,
0.8383718, -0.01503129, 0.8322569, 0.8588235, 0, 1, 1,
0.8385584, 0.425906, 3.665334, 0.8666667, 0, 1, 1,
0.8427957, 0.2509019, 1.944523, 0.8705882, 0, 1, 1,
0.8496645, -0.1730931, 2.670037, 0.8784314, 0, 1, 1,
0.8518359, 0.04773059, 3.078452, 0.8823529, 0, 1, 1,
0.8556147, -0.1570216, 0.2585918, 0.8901961, 0, 1, 1,
0.8656996, -0.06643017, 0.7706088, 0.8941177, 0, 1, 1,
0.8669161, 0.6431513, -0.4425997, 0.9019608, 0, 1, 1,
0.8678648, 0.1767183, 2.266155, 0.9098039, 0, 1, 1,
0.869294, 1.220394, 0.2452684, 0.9137255, 0, 1, 1,
0.8705373, -1.779899, 0.4871627, 0.9215686, 0, 1, 1,
0.8709418, 0.9546147, 0.9430009, 0.9254902, 0, 1, 1,
0.872328, 0.9275714, 1.188317, 0.9333333, 0, 1, 1,
0.8757415, 0.8062548, 0.3437607, 0.9372549, 0, 1, 1,
0.876845, 1.991626, 0.3500962, 0.945098, 0, 1, 1,
0.8838006, -2.557764, 3.031594, 0.9490196, 0, 1, 1,
0.8947198, -0.8025135, 0.9939442, 0.9568627, 0, 1, 1,
0.9028895, 0.6448551, 1.370805, 0.9607843, 0, 1, 1,
0.9049975, -1.331271, 1.491475, 0.9686275, 0, 1, 1,
0.921092, -0.6013868, 1.8575, 0.972549, 0, 1, 1,
0.9217888, -2.984996, 3.949757, 0.9803922, 0, 1, 1,
0.9319932, 0.8610333, -1.844003, 0.9843137, 0, 1, 1,
0.9418815, -0.5595064, 1.075452, 0.9921569, 0, 1, 1,
0.9425576, -0.6414084, 2.041938, 0.9960784, 0, 1, 1,
0.944438, 0.6039461, 1.634747, 1, 0, 0.9960784, 1,
0.9451655, 2.211922, -1.138002, 1, 0, 0.9882353, 1,
0.9501198, 0.5668398, 0.5899256, 1, 0, 0.9843137, 1,
0.9507303, 0.5379905, 0.7936494, 1, 0, 0.9764706, 1,
0.9529893, 0.7106691, 3.794044, 1, 0, 0.972549, 1,
0.9536035, 1.436791, -0.8308119, 1, 0, 0.9647059, 1,
0.9540779, 0.9304391, 0.06514919, 1, 0, 0.9607843, 1,
0.9583445, 0.3474136, 0.5670345, 1, 0, 0.9529412, 1,
0.9641258, 0.04412592, 2.768958, 1, 0, 0.9490196, 1,
0.9773554, -1.119372, 3.296693, 1, 0, 0.9411765, 1,
0.9798084, 0.2556447, 1.928465, 1, 0, 0.9372549, 1,
0.9799451, 0.09617733, -1.116685, 1, 0, 0.9294118, 1,
0.9817167, -0.4480321, 0.9285365, 1, 0, 0.9254902, 1,
0.9824221, -0.3346769, 2.890392, 1, 0, 0.9176471, 1,
0.9853663, 0.4114995, -0.09162032, 1, 0, 0.9137255, 1,
0.9910774, 0.2120481, 0.7621362, 1, 0, 0.9058824, 1,
0.9923036, -0.5474027, 1.893255, 1, 0, 0.9019608, 1,
1.003549, 0.3437526, 2.131353, 1, 0, 0.8941177, 1,
1.00471, 1.614118, 1.272128, 1, 0, 0.8862745, 1,
1.0157, 0.4050629, -0.4974909, 1, 0, 0.8823529, 1,
1.022908, 1.17199, 0.9624781, 1, 0, 0.8745098, 1,
1.028092, 0.2651291, 0.6634057, 1, 0, 0.8705882, 1,
1.028385, 0.2251376, 3.940191, 1, 0, 0.8627451, 1,
1.030649, -0.6975821, 1.277882, 1, 0, 0.8588235, 1,
1.033439, 0.5232633, -0.2234967, 1, 0, 0.8509804, 1,
1.034387, 1.165563, 2.127741, 1, 0, 0.8470588, 1,
1.040843, -0.1824607, 1.471634, 1, 0, 0.8392157, 1,
1.043891, -1.267945, 3.071394, 1, 0, 0.8352941, 1,
1.045377, -0.3273614, 2.327596, 1, 0, 0.827451, 1,
1.048318, -0.1410123, 3.5851, 1, 0, 0.8235294, 1,
1.051717, -0.3553279, 1.701886, 1, 0, 0.8156863, 1,
1.060839, 1.506292, 1.881364, 1, 0, 0.8117647, 1,
1.064252, -0.5935119, 2.644357, 1, 0, 0.8039216, 1,
1.068239, 1.596221, 0.6017675, 1, 0, 0.7960784, 1,
1.081295, -0.2914843, 1.796541, 1, 0, 0.7921569, 1,
1.087867, -0.3717886, 2.508285, 1, 0, 0.7843137, 1,
1.101117, -0.736158, 1.934888, 1, 0, 0.7803922, 1,
1.107881, 0.3482681, -0.007114436, 1, 0, 0.772549, 1,
1.109241, -0.2369967, 2.623501, 1, 0, 0.7686275, 1,
1.122861, 0.6709378, 1.666556, 1, 0, 0.7607843, 1,
1.128955, 1.633435, 0.3254467, 1, 0, 0.7568628, 1,
1.129886, 0.3952353, 2.145484, 1, 0, 0.7490196, 1,
1.129923, 0.1464939, 1.748202, 1, 0, 0.7450981, 1,
1.130377, 0.3011413, 1.124757, 1, 0, 0.7372549, 1,
1.136344, 0.3123107, 1.716744, 1, 0, 0.7333333, 1,
1.148572, 0.6653157, 1.225786, 1, 0, 0.7254902, 1,
1.14908, 0.1575409, 0.372035, 1, 0, 0.7215686, 1,
1.155344, 1.717508, 0.462767, 1, 0, 0.7137255, 1,
1.155346, 0.1296624, 1.760447, 1, 0, 0.7098039, 1,
1.159899, -0.9981019, 2.584103, 1, 0, 0.7019608, 1,
1.163481, -0.8830352, 1.150896, 1, 0, 0.6941177, 1,
1.165682, -2.190737, 1.473524, 1, 0, 0.6901961, 1,
1.176085, 0.633049, 2.628085, 1, 0, 0.682353, 1,
1.17722, -0.7008385, 1.321, 1, 0, 0.6784314, 1,
1.185455, 1.501117, 1.344517, 1, 0, 0.6705883, 1,
1.185542, 0.7106584, 0.678814, 1, 0, 0.6666667, 1,
1.19547, 0.1321226, 1.879417, 1, 0, 0.6588235, 1,
1.238346, 0.5083052, -0.766691, 1, 0, 0.654902, 1,
1.241451, -0.1967828, 1.854874, 1, 0, 0.6470588, 1,
1.243696, -0.8471841, 2.606938, 1, 0, 0.6431373, 1,
1.24497, -0.09586772, 1.543581, 1, 0, 0.6352941, 1,
1.2507, -2.40206, 2.298451, 1, 0, 0.6313726, 1,
1.255291, -0.9987295, 1.702462, 1, 0, 0.6235294, 1,
1.259318, -0.2093848, 2.55728, 1, 0, 0.6196079, 1,
1.262402, -0.6347458, 0.1020469, 1, 0, 0.6117647, 1,
1.269011, 0.02940924, 0.9905134, 1, 0, 0.6078432, 1,
1.269522, 0.809757, 1.830289, 1, 0, 0.6, 1,
1.270198, 1.709619, 0.2740032, 1, 0, 0.5921569, 1,
1.292548, -0.5251627, 2.510545, 1, 0, 0.5882353, 1,
1.294728, 0.6163079, 0.4768686, 1, 0, 0.5803922, 1,
1.294889, 0.1145919, 1.988533, 1, 0, 0.5764706, 1,
1.29833, -0.9674909, 2.647384, 1, 0, 0.5686275, 1,
1.303105, 0.9378585, 0.3040251, 1, 0, 0.5647059, 1,
1.333614, -0.8302834, 2.028629, 1, 0, 0.5568628, 1,
1.347493, 0.7043308, 1.494595, 1, 0, 0.5529412, 1,
1.347872, 0.2178901, 0.5199698, 1, 0, 0.5450981, 1,
1.359735, -0.2600456, 2.81792, 1, 0, 0.5411765, 1,
1.385063, 0.6293619, 0.9792862, 1, 0, 0.5333334, 1,
1.390211, 0.7709167, 1.377184, 1, 0, 0.5294118, 1,
1.395496, -0.8699797, -0.2146382, 1, 0, 0.5215687, 1,
1.409732, -0.2390768, 3.26363, 1, 0, 0.5176471, 1,
1.413139, -1.416252, 2.682613, 1, 0, 0.509804, 1,
1.413921, 0.02810877, 1.256883, 1, 0, 0.5058824, 1,
1.429152, 0.334556, 0.07065514, 1, 0, 0.4980392, 1,
1.430473, -0.7182629, 1.336489, 1, 0, 0.4901961, 1,
1.45118, -0.6142341, 1.054683, 1, 0, 0.4862745, 1,
1.459566, 0.1832678, 0.4316865, 1, 0, 0.4784314, 1,
1.473153, 1.748183, 1.840726, 1, 0, 0.4745098, 1,
1.484815, 0.1252642, 1.00519, 1, 0, 0.4666667, 1,
1.490166, 1.414779, 0.9143065, 1, 0, 0.4627451, 1,
1.491008, -1.07292, 3.271217, 1, 0, 0.454902, 1,
1.495399, -2.203887, 1.35116, 1, 0, 0.4509804, 1,
1.496211, 1.851519, -1.374182, 1, 0, 0.4431373, 1,
1.511988, -0.534945, 3.418838, 1, 0, 0.4392157, 1,
1.512943, -1.283837, 3.279784, 1, 0, 0.4313726, 1,
1.516595, -0.005766637, 0.2288608, 1, 0, 0.427451, 1,
1.52777, 1.559776, 0.5024813, 1, 0, 0.4196078, 1,
1.534377, 0.01696573, 2.842234, 1, 0, 0.4156863, 1,
1.540958, -0.4273198, 3.313396, 1, 0, 0.4078431, 1,
1.546218, 0.1840278, 1.052345, 1, 0, 0.4039216, 1,
1.548299, 1.421444, 0.8158083, 1, 0, 0.3960784, 1,
1.566819, -0.9530531, 3.532357, 1, 0, 0.3882353, 1,
1.586781, -0.2849547, 1.861285, 1, 0, 0.3843137, 1,
1.606476, 0.4005555, 1.616958, 1, 0, 0.3764706, 1,
1.621326, -0.1195279, 2.262459, 1, 0, 0.372549, 1,
1.623309, 1.465317, 1.024548, 1, 0, 0.3647059, 1,
1.626548, 0.2996799, 2.450018, 1, 0, 0.3607843, 1,
1.636854, -1.187321, 1.332656, 1, 0, 0.3529412, 1,
1.642382, -0.8320689, 2.045711, 1, 0, 0.3490196, 1,
1.64367, 0.241665, 0.8306846, 1, 0, 0.3411765, 1,
1.648249, 0.1601994, 0.1596583, 1, 0, 0.3372549, 1,
1.668747, -0.6467372, 2.001758, 1, 0, 0.3294118, 1,
1.705091, -0.4950685, 4.656032, 1, 0, 0.3254902, 1,
1.728807, 1.01691, 0.9607184, 1, 0, 0.3176471, 1,
1.74191, -0.2284855, 0.9097602, 1, 0, 0.3137255, 1,
1.746597, -2.179903, 3.267152, 1, 0, 0.3058824, 1,
1.753926, 1.404979, 0.6864845, 1, 0, 0.2980392, 1,
1.758508, 0.3875463, 3.320203, 1, 0, 0.2941177, 1,
1.769284, -0.9078758, 1.422114, 1, 0, 0.2862745, 1,
1.777487, 0.4920134, 2.176437, 1, 0, 0.282353, 1,
1.789289, -0.7163188, 0.8195469, 1, 0, 0.2745098, 1,
1.807159, 2.10514, 0.3273358, 1, 0, 0.2705882, 1,
1.834627, 1.513223, 2.766393, 1, 0, 0.2627451, 1,
1.854109, -1.776099, 3.427201, 1, 0, 0.2588235, 1,
1.859924, -0.3542076, 2.819652, 1, 0, 0.2509804, 1,
1.889738, 0.2557487, 1.453559, 1, 0, 0.2470588, 1,
1.892157, 1.314371, 0.04481741, 1, 0, 0.2392157, 1,
1.894924, -2.171232, 2.935619, 1, 0, 0.2352941, 1,
1.924136, -1.088032, 0.683652, 1, 0, 0.227451, 1,
1.929895, -1.456583, 1.396182, 1, 0, 0.2235294, 1,
1.939141, -0.1538336, -1.055442, 1, 0, 0.2156863, 1,
1.953203, -0.5187494, 0.671673, 1, 0, 0.2117647, 1,
1.958184, 0.4853338, 1.705059, 1, 0, 0.2039216, 1,
1.970399, -1.453595, 3.316773, 1, 0, 0.1960784, 1,
1.979358, 0.7657447, 2.205915, 1, 0, 0.1921569, 1,
1.989266, -0.8110912, 2.048493, 1, 0, 0.1843137, 1,
2.002651, -1.25997, 2.320229, 1, 0, 0.1803922, 1,
2.025755, -0.7084225, 1.793301, 1, 0, 0.172549, 1,
2.034608, 1.276918, 1.20782, 1, 0, 0.1686275, 1,
2.038172, 0.4093566, 0.9640175, 1, 0, 0.1607843, 1,
2.096995, 0.2976099, 2.572935, 1, 0, 0.1568628, 1,
2.122944, 0.7360338, -0.48506, 1, 0, 0.1490196, 1,
2.189027, -0.8758425, 1.187088, 1, 0, 0.145098, 1,
2.191522, 1.57248, 0.7863456, 1, 0, 0.1372549, 1,
2.192097, -0.4351906, 0.6252751, 1, 0, 0.1333333, 1,
2.198253, -0.1160453, -0.2661549, 1, 0, 0.1254902, 1,
2.203087, 0.1516621, 1.082984, 1, 0, 0.1215686, 1,
2.206333, 1.499224, 1.442292, 1, 0, 0.1137255, 1,
2.20805, -0.2769947, 1.501264, 1, 0, 0.1098039, 1,
2.240239, -0.02013306, 0.2030954, 1, 0, 0.1019608, 1,
2.274088, 0.9461958, 1.044163, 1, 0, 0.09411765, 1,
2.277188, -0.1176917, 2.040574, 1, 0, 0.09019608, 1,
2.327065, -2.173794, 3.298133, 1, 0, 0.08235294, 1,
2.332655, -0.2818916, 1.642846, 1, 0, 0.07843138, 1,
2.349827, -0.6634766, 0.6751938, 1, 0, 0.07058824, 1,
2.380603, 0.8521398, 2.995184, 1, 0, 0.06666667, 1,
2.395692, -2.151872, 3.065373, 1, 0, 0.05882353, 1,
2.39868, 0.8788066, 1.850464, 1, 0, 0.05490196, 1,
2.412119, 2.281851, 2.014376, 1, 0, 0.04705882, 1,
2.452858, -0.2290139, -1.560233, 1, 0, 0.04313726, 1,
2.503079, 0.5803867, 1.877232, 1, 0, 0.03529412, 1,
2.544882, -1.561334, 0.1168522, 1, 0, 0.03137255, 1,
2.603596, 0.6209484, -0.1758842, 1, 0, 0.02352941, 1,
2.631684, -0.08844192, 1.731883, 1, 0, 0.01960784, 1,
2.651928, 0.9726415, 2.103382, 1, 0, 0.01176471, 1,
3.123431, -1.278144, 1.662933, 1, 0, 0.007843138, 1
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
-0.4277496, -4.168793, -6.18512, 0, -0.5, 0.5, 0.5,
-0.4277496, -4.168793, -6.18512, 1, -0.5, 0.5, 0.5,
-0.4277496, -4.168793, -6.18512, 1, 1.5, 0.5, 0.5,
-0.4277496, -4.168793, -6.18512, 0, 1.5, 0.5, 0.5
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
-5.18278, -0.06737041, -6.18512, 0, -0.5, 0.5, 0.5,
-5.18278, -0.06737041, -6.18512, 1, -0.5, 0.5, 0.5,
-5.18278, -0.06737041, -6.18512, 1, 1.5, 0.5, 0.5,
-5.18278, -0.06737041, -6.18512, 0, 1.5, 0.5, 0.5
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
-5.18278, -4.168793, 0.03689861, 0, -0.5, 0.5, 0.5,
-5.18278, -4.168793, 0.03689861, 1, -0.5, 0.5, 0.5,
-5.18278, -4.168793, 0.03689861, 1, 1.5, 0.5, 0.5,
-5.18278, -4.168793, 0.03689861, 0, 1.5, 0.5, 0.5
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
-2, -3.222311, -4.749269,
2, -3.222311, -4.749269,
-2, -3.222311, -4.749269,
-2, -3.380058, -4.988577,
0, -3.222311, -4.749269,
0, -3.380058, -4.988577,
2, -3.222311, -4.749269,
2, -3.380058, -4.988577
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
-2, -3.695551, -5.467194, 0, -0.5, 0.5, 0.5,
-2, -3.695551, -5.467194, 1, -0.5, 0.5, 0.5,
-2, -3.695551, -5.467194, 1, 1.5, 0.5, 0.5,
-2, -3.695551, -5.467194, 0, 1.5, 0.5, 0.5,
0, -3.695551, -5.467194, 0, -0.5, 0.5, 0.5,
0, -3.695551, -5.467194, 1, -0.5, 0.5, 0.5,
0, -3.695551, -5.467194, 1, 1.5, 0.5, 0.5,
0, -3.695551, -5.467194, 0, 1.5, 0.5, 0.5,
2, -3.695551, -5.467194, 0, -0.5, 0.5, 0.5,
2, -3.695551, -5.467194, 1, -0.5, 0.5, 0.5,
2, -3.695551, -5.467194, 1, 1.5, 0.5, 0.5,
2, -3.695551, -5.467194, 0, 1.5, 0.5, 0.5
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
-4.085465, -3, -4.749269,
-4.085465, 2, -4.749269,
-4.085465, -3, -4.749269,
-4.268351, -3, -4.988577,
-4.085465, -2, -4.749269,
-4.268351, -2, -4.988577,
-4.085465, -1, -4.749269,
-4.268351, -1, -4.988577,
-4.085465, 0, -4.749269,
-4.268351, 0, -4.988577,
-4.085465, 1, -4.749269,
-4.268351, 1, -4.988577,
-4.085465, 2, -4.749269,
-4.268351, 2, -4.988577
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
-4.634123, -3, -5.467194, 0, -0.5, 0.5, 0.5,
-4.634123, -3, -5.467194, 1, -0.5, 0.5, 0.5,
-4.634123, -3, -5.467194, 1, 1.5, 0.5, 0.5,
-4.634123, -3, -5.467194, 0, 1.5, 0.5, 0.5,
-4.634123, -2, -5.467194, 0, -0.5, 0.5, 0.5,
-4.634123, -2, -5.467194, 1, -0.5, 0.5, 0.5,
-4.634123, -2, -5.467194, 1, 1.5, 0.5, 0.5,
-4.634123, -2, -5.467194, 0, 1.5, 0.5, 0.5,
-4.634123, -1, -5.467194, 0, -0.5, 0.5, 0.5,
-4.634123, -1, -5.467194, 1, -0.5, 0.5, 0.5,
-4.634123, -1, -5.467194, 1, 1.5, 0.5, 0.5,
-4.634123, -1, -5.467194, 0, 1.5, 0.5, 0.5,
-4.634123, 0, -5.467194, 0, -0.5, 0.5, 0.5,
-4.634123, 0, -5.467194, 1, -0.5, 0.5, 0.5,
-4.634123, 0, -5.467194, 1, 1.5, 0.5, 0.5,
-4.634123, 0, -5.467194, 0, 1.5, 0.5, 0.5,
-4.634123, 1, -5.467194, 0, -0.5, 0.5, 0.5,
-4.634123, 1, -5.467194, 1, -0.5, 0.5, 0.5,
-4.634123, 1, -5.467194, 1, 1.5, 0.5, 0.5,
-4.634123, 1, -5.467194, 0, 1.5, 0.5, 0.5,
-4.634123, 2, -5.467194, 0, -0.5, 0.5, 0.5,
-4.634123, 2, -5.467194, 1, -0.5, 0.5, 0.5,
-4.634123, 2, -5.467194, 1, 1.5, 0.5, 0.5,
-4.634123, 2, -5.467194, 0, 1.5, 0.5, 0.5
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
-4.085465, -3.222311, -4,
-4.085465, -3.222311, 4,
-4.085465, -3.222311, -4,
-4.268351, -3.380058, -4,
-4.085465, -3.222311, -2,
-4.268351, -3.380058, -2,
-4.085465, -3.222311, 0,
-4.268351, -3.380058, 0,
-4.085465, -3.222311, 2,
-4.268351, -3.380058, 2,
-4.085465, -3.222311, 4,
-4.268351, -3.380058, 4
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
-4.634123, -3.695551, -4, 0, -0.5, 0.5, 0.5,
-4.634123, -3.695551, -4, 1, -0.5, 0.5, 0.5,
-4.634123, -3.695551, -4, 1, 1.5, 0.5, 0.5,
-4.634123, -3.695551, -4, 0, 1.5, 0.5, 0.5,
-4.634123, -3.695551, -2, 0, -0.5, 0.5, 0.5,
-4.634123, -3.695551, -2, 1, -0.5, 0.5, 0.5,
-4.634123, -3.695551, -2, 1, 1.5, 0.5, 0.5,
-4.634123, -3.695551, -2, 0, 1.5, 0.5, 0.5,
-4.634123, -3.695551, 0, 0, -0.5, 0.5, 0.5,
-4.634123, -3.695551, 0, 1, -0.5, 0.5, 0.5,
-4.634123, -3.695551, 0, 1, 1.5, 0.5, 0.5,
-4.634123, -3.695551, 0, 0, 1.5, 0.5, 0.5,
-4.634123, -3.695551, 2, 0, -0.5, 0.5, 0.5,
-4.634123, -3.695551, 2, 1, -0.5, 0.5, 0.5,
-4.634123, -3.695551, 2, 1, 1.5, 0.5, 0.5,
-4.634123, -3.695551, 2, 0, 1.5, 0.5, 0.5,
-4.634123, -3.695551, 4, 0, -0.5, 0.5, 0.5,
-4.634123, -3.695551, 4, 1, -0.5, 0.5, 0.5,
-4.634123, -3.695551, 4, 1, 1.5, 0.5, 0.5,
-4.634123, -3.695551, 4, 0, 1.5, 0.5, 0.5
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
-4.085465, -3.222311, -4.749269,
-4.085465, 3.08757, -4.749269,
-4.085465, -3.222311, 4.823066,
-4.085465, 3.08757, 4.823066,
-4.085465, -3.222311, -4.749269,
-4.085465, -3.222311, 4.823066,
-4.085465, 3.08757, -4.749269,
-4.085465, 3.08757, 4.823066,
-4.085465, -3.222311, -4.749269,
3.229966, -3.222311, -4.749269,
-4.085465, -3.222311, 4.823066,
3.229966, -3.222311, 4.823066,
-4.085465, 3.08757, -4.749269,
3.229966, 3.08757, -4.749269,
-4.085465, 3.08757, 4.823066,
3.229966, 3.08757, 4.823066,
3.229966, -3.222311, -4.749269,
3.229966, 3.08757, -4.749269,
3.229966, -3.222311, 4.823066,
3.229966, 3.08757, 4.823066,
3.229966, -3.222311, -4.749269,
3.229966, -3.222311, 4.823066,
3.229966, 3.08757, -4.749269,
3.229966, 3.08757, 4.823066
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
var radius = 7.262131;
var distance = 32.31004;
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
mvMatrix.translate( 0.4277496, 0.06737041, -0.03689861 );
mvMatrix.scale( 1.073342, 1.244391, 0.8202761 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.31004);
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
bialaphos<-read.table("bialaphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bialaphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'bialaphos' not found
```

```r
y<-bialaphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'bialaphos' not found
```

```r
z<-bialaphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'bialaphos' not found
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
-3.97893, 0.5529541, 0.2343756, 0, 0, 1, 1, 1,
-3.288657, 0.1386264, -1.169517, 1, 0, 0, 1, 1,
-2.936508, 0.07967114, -0.7558338, 1, 0, 0, 1, 1,
-2.761412, 0.2841128, -1.007374, 1, 0, 0, 1, 1,
-2.682642, -1.043043, -2.229509, 1, 0, 0, 1, 1,
-2.576431, -1.507192, -1.787366, 1, 0, 0, 1, 1,
-2.479205, -0.427601, -2.68619, 0, 0, 0, 1, 1,
-2.410364, 0.7463674, -1.880848, 0, 0, 0, 1, 1,
-2.378175, -1.110227, -0.7525033, 0, 0, 0, 1, 1,
-2.296389, 0.6224203, -4.168327, 0, 0, 0, 1, 1,
-2.239308, 0.3240224, -0.1325408, 0, 0, 0, 1, 1,
-2.228163, 0.1498163, -2.76902, 0, 0, 0, 1, 1,
-2.21239, 0.5952902, -0.3388483, 0, 0, 0, 1, 1,
-2.196338, -0.9676144, -3.404005, 1, 1, 1, 1, 1,
-2.185028, 0.9066003, -1.089301, 1, 1, 1, 1, 1,
-2.17867, 1.879172, -0.9449407, 1, 1, 1, 1, 1,
-2.167185, 0.2746733, -1.704823, 1, 1, 1, 1, 1,
-2.16143, 0.3290856, -3.586262, 1, 1, 1, 1, 1,
-2.128932, -0.3695887, -4.506402, 1, 1, 1, 1, 1,
-2.126633, 0.09178358, -1.290072, 1, 1, 1, 1, 1,
-2.109876, 0.04227656, -2.44563, 1, 1, 1, 1, 1,
-2.102354, 0.3300999, -0.7772073, 1, 1, 1, 1, 1,
-2.091059, -1.470069, -2.776198, 1, 1, 1, 1, 1,
-2.02566, -0.1154645, -1.267186, 1, 1, 1, 1, 1,
-2.016041, -0.4962615, -1.734032, 1, 1, 1, 1, 1,
-2.002625, -2.817918, -2.812457, 1, 1, 1, 1, 1,
-1.988243, 0.01982579, -1.243604, 1, 1, 1, 1, 1,
-1.986499, 0.0645332, -1.939344, 1, 1, 1, 1, 1,
-1.979648, 2.385506, -1.27327, 0, 0, 1, 1, 1,
-1.958158, 0.5623634, -1.102949, 1, 0, 0, 1, 1,
-1.927601, 1.311792, -0.5820935, 1, 0, 0, 1, 1,
-1.926597, -0.04848559, -2.439595, 1, 0, 0, 1, 1,
-1.916716, 0.6282924, -1.218323, 1, 0, 0, 1, 1,
-1.898894, 0.5347224, -1.668537, 1, 0, 0, 1, 1,
-1.889522, -1.900989, -3.184397, 0, 0, 0, 1, 1,
-1.857191, -0.05473628, -2.352035, 0, 0, 0, 1, 1,
-1.845062, 0.580615, -1.423474, 0, 0, 0, 1, 1,
-1.838341, 0.7155927, 0.4822118, 0, 0, 0, 1, 1,
-1.837778, 0.5327756, -1.386131, 0, 0, 0, 1, 1,
-1.836875, -0.5696481, -1.338742, 0, 0, 0, 1, 1,
-1.804975, 1.02177, -1.613429, 0, 0, 0, 1, 1,
-1.800617, -0.02341696, -0.74366, 1, 1, 1, 1, 1,
-1.799635, 0.4863254, -2.399231, 1, 1, 1, 1, 1,
-1.783999, 0.9552031, -0.6643854, 1, 1, 1, 1, 1,
-1.774474, 0.4081881, -1.568637, 1, 1, 1, 1, 1,
-1.741505, -1.225756, -1.572659, 1, 1, 1, 1, 1,
-1.734605, -2.073211, -1.554153, 1, 1, 1, 1, 1,
-1.719764, -1.454048, -1.665205, 1, 1, 1, 1, 1,
-1.705536, -0.9158421, -2.89065, 1, 1, 1, 1, 1,
-1.675824, 1.496157, -0.5765573, 1, 1, 1, 1, 1,
-1.639988, 0.7579705, -3.089551, 1, 1, 1, 1, 1,
-1.619195, -2.280524, -1.4421, 1, 1, 1, 1, 1,
-1.612088, 1.453205, -2.287099, 1, 1, 1, 1, 1,
-1.610357, 1.158589, -0.6113974, 1, 1, 1, 1, 1,
-1.605695, -1.24698, -1.214661, 1, 1, 1, 1, 1,
-1.603401, -0.2513852, -0.4287725, 1, 1, 1, 1, 1,
-1.602656, 0.168927, -1.395607, 0, 0, 1, 1, 1,
-1.602242, 1.095711, -1.224788, 1, 0, 0, 1, 1,
-1.600556, -0.1848399, -2.068602, 1, 0, 0, 1, 1,
-1.583036, 0.2781994, -0.1297504, 1, 0, 0, 1, 1,
-1.57123, 0.7609416, 0.5305991, 1, 0, 0, 1, 1,
-1.564971, -0.1379902, -0.1935537, 1, 0, 0, 1, 1,
-1.563872, -0.3373137, -2.608512, 0, 0, 0, 1, 1,
-1.559905, 1.701745, -2.088474, 0, 0, 0, 1, 1,
-1.557394, -0.05877431, -1.158253, 0, 0, 0, 1, 1,
-1.553128, -1.075082, -1.336466, 0, 0, 0, 1, 1,
-1.542838, 0.8981267, -1.497833, 0, 0, 0, 1, 1,
-1.536737, -0.5236316, -2.301838, 0, 0, 0, 1, 1,
-1.524542, 0.6927114, -0.522931, 0, 0, 0, 1, 1,
-1.521894, -0.6172027, -0.9277276, 1, 1, 1, 1, 1,
-1.517737, 1.407195, 0.6452205, 1, 1, 1, 1, 1,
-1.517223, 0.001883537, -1.92837, 1, 1, 1, 1, 1,
-1.505307, 0.7830731, -0.2415161, 1, 1, 1, 1, 1,
-1.501033, -0.4658805, -2.4118, 1, 1, 1, 1, 1,
-1.490786, 0.06155503, -4.027536, 1, 1, 1, 1, 1,
-1.48667, 1.606315, 1.797588, 1, 1, 1, 1, 1,
-1.484993, 0.241262, 0.2464435, 1, 1, 1, 1, 1,
-1.464706, -1.324898, -2.958349, 1, 1, 1, 1, 1,
-1.451669, 0.04345747, -1.735155, 1, 1, 1, 1, 1,
-1.450771, 1.985305, -0.2835553, 1, 1, 1, 1, 1,
-1.448819, 2.551686, 0.1572528, 1, 1, 1, 1, 1,
-1.442742, 0.7181844, -0.5387817, 1, 1, 1, 1, 1,
-1.437764, 0.4237461, -1.673612, 1, 1, 1, 1, 1,
-1.425177, 0.8487993, 0.01878111, 1, 1, 1, 1, 1,
-1.422878, -2.271473, -2.326964, 0, 0, 1, 1, 1,
-1.420191, 0.2784397, -2.742069, 1, 0, 0, 1, 1,
-1.411665, -1.308655, -0.06909596, 1, 0, 0, 1, 1,
-1.407068, 2.581422, 1.078219, 1, 0, 0, 1, 1,
-1.384875, -0.05468747, -2.232621, 1, 0, 0, 1, 1,
-1.382617, -0.3082073, -1.141001, 1, 0, 0, 1, 1,
-1.364093, -0.1719011, -0.7611377, 0, 0, 0, 1, 1,
-1.357255, -0.8970069, -0.4556011, 0, 0, 0, 1, 1,
-1.349939, -0.4763343, -3.63771, 0, 0, 0, 1, 1,
-1.345685, 1.78815, -1.61998, 0, 0, 0, 1, 1,
-1.328446, -3.130419, -2.720845, 0, 0, 0, 1, 1,
-1.309418, 0.7058405, -0.9740161, 0, 0, 0, 1, 1,
-1.298415, 0.240837, -2.611681, 0, 0, 0, 1, 1,
-1.298004, 1.274713, 0.5685013, 1, 1, 1, 1, 1,
-1.28501, -2.60866, -3.774528, 1, 1, 1, 1, 1,
-1.282243, -0.6436458, -0.3735366, 1, 1, 1, 1, 1,
-1.275689, 0.8629208, -1.892255, 1, 1, 1, 1, 1,
-1.271816, -1.067013, -1.716354, 1, 1, 1, 1, 1,
-1.271543, 0.3673497, -1.960696, 1, 1, 1, 1, 1,
-1.270858, 2.995678, -1.604698, 1, 1, 1, 1, 1,
-1.270417, -0.9798743, -0.1081789, 1, 1, 1, 1, 1,
-1.268772, 0.6581266, -0.618162, 1, 1, 1, 1, 1,
-1.263662, -0.1862661, -3.660882, 1, 1, 1, 1, 1,
-1.26147, 2.923887, -2.882345, 1, 1, 1, 1, 1,
-1.257574, 0.02654744, -0.9292006, 1, 1, 1, 1, 1,
-1.252681, 0.9727786, -1.727013, 1, 1, 1, 1, 1,
-1.248897, 0.04303338, -2.866191, 1, 1, 1, 1, 1,
-1.238188, 1.937736, 0.5143886, 1, 1, 1, 1, 1,
-1.23562, 0.7860247, 0.8377782, 0, 0, 1, 1, 1,
-1.227506, 0.7388331, 0.6822973, 1, 0, 0, 1, 1,
-1.223125, 0.216455, -0.9736873, 1, 0, 0, 1, 1,
-1.217783, 0.5290313, -0.5370004, 1, 0, 0, 1, 1,
-1.216537, -0.326517, -3.291866, 1, 0, 0, 1, 1,
-1.213337, -0.6769381, -2.100912, 1, 0, 0, 1, 1,
-1.205546, 2.152371, -0.5104754, 0, 0, 0, 1, 1,
-1.204868, 1.450331, -1.888571, 0, 0, 0, 1, 1,
-1.204394, -2.050643, -1.050248, 0, 0, 0, 1, 1,
-1.203249, 1.113845, -1.069742, 0, 0, 0, 1, 1,
-1.195373, 0.07570714, -0.5822616, 0, 0, 0, 1, 1,
-1.191307, 0.4153723, -1.990713, 0, 0, 0, 1, 1,
-1.173542, -0.3738583, -2.877459, 0, 0, 0, 1, 1,
-1.166716, -0.7839648, -1.684629, 1, 1, 1, 1, 1,
-1.166219, -0.4274136, -1.400631, 1, 1, 1, 1, 1,
-1.165444, 0.9710799, -2.706038, 1, 1, 1, 1, 1,
-1.162509, -0.005438625, -0.6187368, 1, 1, 1, 1, 1,
-1.160512, -0.5124914, -1.746201, 1, 1, 1, 1, 1,
-1.155355, 1.424111, -2.120821, 1, 1, 1, 1, 1,
-1.149601, 2.463866, -1.065527, 1, 1, 1, 1, 1,
-1.142316, -0.5310098, -0.9122607, 1, 1, 1, 1, 1,
-1.136623, 0.2370757, -2.830626, 1, 1, 1, 1, 1,
-1.135291, 0.3893909, -0.6151722, 1, 1, 1, 1, 1,
-1.133546, -1.46827, -2.141955, 1, 1, 1, 1, 1,
-1.132018, 0.677483, -1.156334, 1, 1, 1, 1, 1,
-1.122589, -0.06750493, -1.521548, 1, 1, 1, 1, 1,
-1.121571, -2.382733, -3.489192, 1, 1, 1, 1, 1,
-1.11363, -1.426987, -2.49941, 1, 1, 1, 1, 1,
-1.112476, 2.016559, -1.066167, 0, 0, 1, 1, 1,
-1.108707, 0.5653918, 0.00758167, 1, 0, 0, 1, 1,
-1.108527, 0.9856343, -1.685939, 1, 0, 0, 1, 1,
-1.101511, 0.4269101, -1.537221, 1, 0, 0, 1, 1,
-1.098004, -0.2574244, -0.4110545, 1, 0, 0, 1, 1,
-1.097435, 0.08029205, -2.454764, 1, 0, 0, 1, 1,
-1.097414, 0.08889892, -0.8647852, 0, 0, 0, 1, 1,
-1.091067, 2.19689, -1.578186, 0, 0, 0, 1, 1,
-1.086866, -1.01613, -2.030688, 0, 0, 0, 1, 1,
-1.085859, -0.5694721, -0.921435, 0, 0, 0, 1, 1,
-1.078258, 0.04542443, -1.06021, 0, 0, 0, 1, 1,
-1.076872, 2.273004, 0.1857842, 0, 0, 0, 1, 1,
-1.070236, -0.06356849, -1.29214, 0, 0, 0, 1, 1,
-1.068539, -1.356043, -1.719737, 1, 1, 1, 1, 1,
-1.064446, -0.3271675, -0.7231492, 1, 1, 1, 1, 1,
-1.060276, 0.09372291, -2.837632, 1, 1, 1, 1, 1,
-1.049247, 1.553998, -0.442384, 1, 1, 1, 1, 1,
-1.048317, 1.422575, -0.9734401, 1, 1, 1, 1, 1,
-1.044235, -0.09781444, -1.824552, 1, 1, 1, 1, 1,
-1.043774, 0.5820518, -0.5721886, 1, 1, 1, 1, 1,
-1.040306, 0.1407532, -2.850313, 1, 1, 1, 1, 1,
-1.038101, -0.1260814, 0.1154722, 1, 1, 1, 1, 1,
-1.034012, 0.01158555, -1.66488, 1, 1, 1, 1, 1,
-1.031928, -1.609401, -2.403969, 1, 1, 1, 1, 1,
-1.024088, -1.229281, -3.228379, 1, 1, 1, 1, 1,
-1.022889, -0.4675629, -2.951282, 1, 1, 1, 1, 1,
-1.022175, 1.523484, 0.3785273, 1, 1, 1, 1, 1,
-1.020531, -0.9918316, -2.071562, 1, 1, 1, 1, 1,
-1.001447, -1.155093, -2.935088, 0, 0, 1, 1, 1,
-0.9976507, 1.697779, 0.6393409, 1, 0, 0, 1, 1,
-0.9888916, 1.576257, -0.6380985, 1, 0, 0, 1, 1,
-0.9840973, 0.2539101, -1.24273, 1, 0, 0, 1, 1,
-0.981793, 1.140636, -1.328343, 1, 0, 0, 1, 1,
-0.979123, 0.004887315, -2.778343, 1, 0, 0, 1, 1,
-0.9782856, -0.2616047, -0.9689233, 0, 0, 0, 1, 1,
-0.9729208, -0.491556, -2.939419, 0, 0, 0, 1, 1,
-0.9680315, 0.3252052, -0.9185094, 0, 0, 0, 1, 1,
-0.9635207, -0.03288291, -2.310514, 0, 0, 0, 1, 1,
-0.9633622, 2.289052, -0.3695115, 0, 0, 0, 1, 1,
-0.9527274, -1.002012, -2.049709, 0, 0, 0, 1, 1,
-0.9521059, -1.300583, -2.664976, 0, 0, 0, 1, 1,
-0.9515116, -0.2613998, -2.342683, 1, 1, 1, 1, 1,
-0.9500309, -2.460969, -1.784871, 1, 1, 1, 1, 1,
-0.9494217, -0.5397568, -1.44964, 1, 1, 1, 1, 1,
-0.9493763, 0.4834878, -2.122175, 1, 1, 1, 1, 1,
-0.9463003, -1.071517, 0.05622593, 1, 1, 1, 1, 1,
-0.9449599, -0.4738667, -2.701072, 1, 1, 1, 1, 1,
-0.9435784, -0.8898159, -0.7561694, 1, 1, 1, 1, 1,
-0.9424149, 0.2181462, 0.368547, 1, 1, 1, 1, 1,
-0.9401982, -0.006176075, -1.839543, 1, 1, 1, 1, 1,
-0.9373943, 0.3760545, -0.6124051, 1, 1, 1, 1, 1,
-0.9280788, 0.09687291, -2.060119, 1, 1, 1, 1, 1,
-0.927232, 2.370997, -1.138646, 1, 1, 1, 1, 1,
-0.9253342, -0.3608078, -1.961953, 1, 1, 1, 1, 1,
-0.9237759, -0.9797539, -0.8302649, 1, 1, 1, 1, 1,
-0.9127133, 0.9391649, -1.012234, 1, 1, 1, 1, 1,
-0.9115389, 0.3179026, -0.2836668, 0, 0, 1, 1, 1,
-0.9090871, 0.006664846, 0.1013812, 1, 0, 0, 1, 1,
-0.9058143, -1.103823, -4.19287, 1, 0, 0, 1, 1,
-0.9047626, 0.4996755, -2.756637, 1, 0, 0, 1, 1,
-0.9027613, -0.9447723, -2.694003, 1, 0, 0, 1, 1,
-0.9004078, 1.467811, -0.5248092, 1, 0, 0, 1, 1,
-0.9000949, 0.7561322, -1.254389, 0, 0, 0, 1, 1,
-0.8957612, -0.4375807, -3.080895, 0, 0, 0, 1, 1,
-0.8937938, -1.278975, -3.822629, 0, 0, 0, 1, 1,
-0.8930178, -0.5380803, -3.257637, 0, 0, 0, 1, 1,
-0.8888398, -0.5173934, -4.609866, 0, 0, 0, 1, 1,
-0.8886316, -0.4185377, -2.078196, 0, 0, 0, 1, 1,
-0.8853028, 0.617855, -1.912326, 0, 0, 0, 1, 1,
-0.882022, 1.396344, -2.333172, 1, 1, 1, 1, 1,
-0.8793764, -0.07770443, -0.08949926, 1, 1, 1, 1, 1,
-0.8776694, 0.1048658, -1.400423, 1, 1, 1, 1, 1,
-0.8770607, 1.412241, -0.5940038, 1, 1, 1, 1, 1,
-0.8766919, 1.134231, -0.5282532, 1, 1, 1, 1, 1,
-0.8749077, 0.6196784, -1.016194, 1, 1, 1, 1, 1,
-0.8645627, 0.7078434, -1.869217, 1, 1, 1, 1, 1,
-0.8635567, 1.586443, -0.1376916, 1, 1, 1, 1, 1,
-0.855513, 2.10053, 0.2975162, 1, 1, 1, 1, 1,
-0.8470212, 0.6584075, -0.8521922, 1, 1, 1, 1, 1,
-0.8457426, -0.03220048, -1.056853, 1, 1, 1, 1, 1,
-0.8423266, -0.4868754, -3.097131, 1, 1, 1, 1, 1,
-0.8376909, -0.3571, -0.4816039, 1, 1, 1, 1, 1,
-0.8327441, 0.6292488, -1.662873, 1, 1, 1, 1, 1,
-0.827942, 0.3378861, -0.7929846, 1, 1, 1, 1, 1,
-0.8272772, -1.229922, -1.464301, 0, 0, 1, 1, 1,
-0.823079, 0.03020032, -1.104972, 1, 0, 0, 1, 1,
-0.8136791, -0.4623962, -3.360353, 1, 0, 0, 1, 1,
-0.8107222, -1.064115, -2.577186, 1, 0, 0, 1, 1,
-0.8103417, 0.0480111, -0.4055456, 1, 0, 0, 1, 1,
-0.8074958, -0.4255864, -3.268414, 1, 0, 0, 1, 1,
-0.8045824, 0.5846343, 0.2457045, 0, 0, 0, 1, 1,
-0.8042136, 1.174103, 0.5565465, 0, 0, 0, 1, 1,
-0.7998561, 0.2903869, -0.7101146, 0, 0, 0, 1, 1,
-0.7931798, 0.862588, -0.004250235, 0, 0, 0, 1, 1,
-0.7906702, 1.267732, -1.460176, 0, 0, 0, 1, 1,
-0.7906068, -0.3457548, -2.636017, 0, 0, 0, 1, 1,
-0.7873259, -0.2814189, -1.959117, 0, 0, 0, 1, 1,
-0.787312, 0.2103115, -1.051079, 1, 1, 1, 1, 1,
-0.7803024, 0.2962534, -1.32312, 1, 1, 1, 1, 1,
-0.7764837, -1.039187, -1.876419, 1, 1, 1, 1, 1,
-0.7732533, -0.8654132, -1.492477, 1, 1, 1, 1, 1,
-0.7649561, 0.6406751, -0.6198611, 1, 1, 1, 1, 1,
-0.759618, 0.7004097, -2.334069, 1, 1, 1, 1, 1,
-0.7582635, -1.172382, -1.856863, 1, 1, 1, 1, 1,
-0.7555652, 1.552211, -0.8240396, 1, 1, 1, 1, 1,
-0.7543094, -0.5897654, -3.138456, 1, 1, 1, 1, 1,
-0.7531854, -1.326573, -3.025574, 1, 1, 1, 1, 1,
-0.7525799, -0.9060043, -2.551639, 1, 1, 1, 1, 1,
-0.7525392, -0.9068602, -3.444989, 1, 1, 1, 1, 1,
-0.7493109, -1.202114, -2.054996, 1, 1, 1, 1, 1,
-0.735649, 0.07433698, -2.224629, 1, 1, 1, 1, 1,
-0.7322732, -2.459956, -4.179062, 1, 1, 1, 1, 1,
-0.7296069, -0.7239774, -3.100269, 0, 0, 1, 1, 1,
-0.728851, -2.293872, -1.525996, 1, 0, 0, 1, 1,
-0.7238048, -0.7333649, -1.359114, 1, 0, 0, 1, 1,
-0.7232125, 0.2254823, -1.463366, 1, 0, 0, 1, 1,
-0.7187996, 0.01764945, 0.1004293, 1, 0, 0, 1, 1,
-0.7097521, -0.4412923, -3.128135, 1, 0, 0, 1, 1,
-0.7033318, -1.050688, -2.670113, 0, 0, 0, 1, 1,
-0.7017025, -0.1100329, -0.8424221, 0, 0, 0, 1, 1,
-0.7010108, -0.7085927, -0.9202177, 0, 0, 0, 1, 1,
-0.6988031, -0.1557447, -2.421557, 0, 0, 0, 1, 1,
-0.6969321, 0.7060608, 0.8906475, 0, 0, 0, 1, 1,
-0.6941702, -2.77075, -4.112145, 0, 0, 0, 1, 1,
-0.6871487, 0.3128661, -0.491118, 0, 0, 0, 1, 1,
-0.68694, 1.444205, -0.05896299, 1, 1, 1, 1, 1,
-0.6859155, -2.886122, -2.652435, 1, 1, 1, 1, 1,
-0.6820825, -0.09075095, -0.6462917, 1, 1, 1, 1, 1,
-0.6638807, 0.3695548, -2.415395, 1, 1, 1, 1, 1,
-0.6630011, -0.4733118, -1.57157, 1, 1, 1, 1, 1,
-0.6620678, 0.6475931, -1.156603, 1, 1, 1, 1, 1,
-0.661118, -0.7886335, -3.88609, 1, 1, 1, 1, 1,
-0.6603886, -0.09635385, -0.4831144, 1, 1, 1, 1, 1,
-0.6517535, 0.3982019, -0.2344566, 1, 1, 1, 1, 1,
-0.6487736, -0.7219176, -3.690948, 1, 1, 1, 1, 1,
-0.6467072, 0.03775035, 0.08231591, 1, 1, 1, 1, 1,
-0.6466711, 0.8529791, -1.635756, 1, 1, 1, 1, 1,
-0.6456836, -1.39694, -1.286727, 1, 1, 1, 1, 1,
-0.6434894, 1.36687, -1.74691, 1, 1, 1, 1, 1,
-0.6366963, -0.2756486, -0.644249, 1, 1, 1, 1, 1,
-0.6339276, 0.6313541, -0.6319891, 0, 0, 1, 1, 1,
-0.6336984, -2.113766, -2.941256, 1, 0, 0, 1, 1,
-0.632757, -0.3281907, -2.300059, 1, 0, 0, 1, 1,
-0.6305109, -0.8807454, -3.186507, 1, 0, 0, 1, 1,
-0.6281513, -0.3504189, -2.175456, 1, 0, 0, 1, 1,
-0.6269977, 1.303448, 1.359343, 1, 0, 0, 1, 1,
-0.6259317, -0.0007113041, -2.958299, 0, 0, 0, 1, 1,
-0.6254081, -0.1660992, -1.512274, 0, 0, 0, 1, 1,
-0.6222233, 0.4753456, -1.04744, 0, 0, 0, 1, 1,
-0.6207854, 0.4581216, -2.775672, 0, 0, 0, 1, 1,
-0.6149997, 1.010205, 0.2532792, 0, 0, 0, 1, 1,
-0.6120435, 1.004958, -0.9908528, 0, 0, 0, 1, 1,
-0.6119633, 2.434408, -0.8311116, 0, 0, 0, 1, 1,
-0.6048535, -0.2800849, -3.103355, 1, 1, 1, 1, 1,
-0.6001047, 1.45302, -1.152779, 1, 1, 1, 1, 1,
-0.5997298, -0.8621312, -2.82469, 1, 1, 1, 1, 1,
-0.5891125, 1.478469, -1.209022, 1, 1, 1, 1, 1,
-0.5843392, 0.2008345, -2.58054, 1, 1, 1, 1, 1,
-0.5747602, -0.9928198, -3.73138, 1, 1, 1, 1, 1,
-0.5647842, 0.5181583, -0.9179402, 1, 1, 1, 1, 1,
-0.5642634, 1.927204, 1.87907, 1, 1, 1, 1, 1,
-0.5582653, 0.2526416, -0.02761062, 1, 1, 1, 1, 1,
-0.5523469, 0.8546463, -2.106237, 1, 1, 1, 1, 1,
-0.5472205, -0.5530677, -2.070111, 1, 1, 1, 1, 1,
-0.5464849, -0.2369974, -3.312171, 1, 1, 1, 1, 1,
-0.5460952, -0.06552902, -1.650199, 1, 1, 1, 1, 1,
-0.5456958, -0.2955523, -3.185483, 1, 1, 1, 1, 1,
-0.5452006, 0.6984842, -0.5695528, 1, 1, 1, 1, 1,
-0.5435233, 0.9475735, -0.2947519, 0, 0, 1, 1, 1,
-0.5405987, -1.490526, -4.380435, 1, 0, 0, 1, 1,
-0.5387992, 0.3574376, -1.753937, 1, 0, 0, 1, 1,
-0.5378587, -0.1868775, -1.642694, 1, 0, 0, 1, 1,
-0.5297519, -0.3424404, -2.953052, 1, 0, 0, 1, 1,
-0.5280832, 0.105395, -1.304693, 1, 0, 0, 1, 1,
-0.5264673, 0.4452922, -2.923397, 0, 0, 0, 1, 1,
-0.5225027, -0.2439072, -1.454697, 0, 0, 0, 1, 1,
-0.5203635, 0.1829862, -0.1064165, 0, 0, 0, 1, 1,
-0.516807, -1.829597, -2.776197, 0, 0, 0, 1, 1,
-0.5155255, -0.6077178, -3.02334, 0, 0, 0, 1, 1,
-0.5101857, -1.304894, -3.981253, 0, 0, 0, 1, 1,
-0.5056562, -0.1490968, -1.357951, 0, 0, 0, 1, 1,
-0.5044398, 0.7638451, 0.7681669, 1, 1, 1, 1, 1,
-0.5001677, 0.224446, -3.126528, 1, 1, 1, 1, 1,
-0.4989329, 0.005045179, 0.592327, 1, 1, 1, 1, 1,
-0.4968943, 1.01168, -0.5682443, 1, 1, 1, 1, 1,
-0.493921, 1.564192, -2.075964, 1, 1, 1, 1, 1,
-0.493445, 0.9515167, -0.4593661, 1, 1, 1, 1, 1,
-0.4896656, -1.400971, -2.953748, 1, 1, 1, 1, 1,
-0.4889377, -1.753661, -1.92239, 1, 1, 1, 1, 1,
-0.48414, 0.8143415, -0.8690609, 1, 1, 1, 1, 1,
-0.48304, -1.813964, -3.492425, 1, 1, 1, 1, 1,
-0.480879, 1.405684, -2.334714, 1, 1, 1, 1, 1,
-0.4796403, 1.312002, -0.1272271, 1, 1, 1, 1, 1,
-0.4776007, 0.5809906, 0.6357852, 1, 1, 1, 1, 1,
-0.4773099, -0.7977089, -2.198457, 1, 1, 1, 1, 1,
-0.4743618, 0.213991, -2.325044, 1, 1, 1, 1, 1,
-0.4721533, -0.2642655, -1.415549, 0, 0, 1, 1, 1,
-0.4718869, 0.4163148, 1.598544, 1, 0, 0, 1, 1,
-0.4713171, -0.7978406, -4.280569, 1, 0, 0, 1, 1,
-0.4670413, -0.9070413, -3.454311, 1, 0, 0, 1, 1,
-0.4642326, 0.5885306, 0.2872191, 1, 0, 0, 1, 1,
-0.4639228, 0.5600101, 1.415678, 1, 0, 0, 1, 1,
-0.4629679, -0.8889696, -1.703288, 0, 0, 0, 1, 1,
-0.4615304, 1.428465, 0.1106395, 0, 0, 0, 1, 1,
-0.4612386, 1.830237, -2.752833, 0, 0, 0, 1, 1,
-0.4584053, 0.4307544, -1.087201, 0, 0, 0, 1, 1,
-0.4556497, 1.509025, -0.8553053, 0, 0, 0, 1, 1,
-0.4554103, -0.7611341, -4.125492, 0, 0, 0, 1, 1,
-0.4535632, 1.146114, -1.284656, 0, 0, 0, 1, 1,
-0.4514205, 1.444342, -1.325858, 1, 1, 1, 1, 1,
-0.4493452, 1.770798, -0.6609839, 1, 1, 1, 1, 1,
-0.4475413, 0.3054239, 0.04492455, 1, 1, 1, 1, 1,
-0.4468617, 0.5899161, 1.577957, 1, 1, 1, 1, 1,
-0.4450693, -0.3119833, -0.331159, 1, 1, 1, 1, 1,
-0.4442798, 0.5904109, 0.6948769, 1, 1, 1, 1, 1,
-0.4343734, -1.458628, -2.176808, 1, 1, 1, 1, 1,
-0.431378, 0.1660484, -1.153473, 1, 1, 1, 1, 1,
-0.4310171, -0.4499011, -2.377357, 1, 1, 1, 1, 1,
-0.4308024, 0.568287, 0.9574811, 1, 1, 1, 1, 1,
-0.4304825, 0.6794163, -0.1986745, 1, 1, 1, 1, 1,
-0.4296236, 0.5571976, -1.640496, 1, 1, 1, 1, 1,
-0.4279351, 1.359545, -1.71399, 1, 1, 1, 1, 1,
-0.4228037, 0.7910197, -0.6139942, 1, 1, 1, 1, 1,
-0.4224115, 0.5611481, -2.262445, 1, 1, 1, 1, 1,
-0.4218776, -0.482294, -2.88001, 0, 0, 1, 1, 1,
-0.4129587, -0.2949116, -1.297381, 1, 0, 0, 1, 1,
-0.4102101, -0.226639, -1.507542, 1, 0, 0, 1, 1,
-0.406841, -0.8851989, -2.927468, 1, 0, 0, 1, 1,
-0.4050566, 0.1675516, -1.615357, 1, 0, 0, 1, 1,
-0.4044138, 0.3252966, -1.821968, 1, 0, 0, 1, 1,
-0.3998705, 1.742141, 2.081009, 0, 0, 0, 1, 1,
-0.39614, 0.3615273, 0.4392419, 0, 0, 0, 1, 1,
-0.3960015, -0.6691142, -0.5220085, 0, 0, 0, 1, 1,
-0.3930188, -0.9111119, -2.845611, 0, 0, 0, 1, 1,
-0.3922065, -0.4031534, -3.415803, 0, 0, 0, 1, 1,
-0.3847603, -1.791517, -4.427651, 0, 0, 0, 1, 1,
-0.3835104, -1.766891, -0.8909804, 0, 0, 0, 1, 1,
-0.3783092, -1.539165, -4.477984, 1, 1, 1, 1, 1,
-0.3695338, 0.3598703, -0.6308498, 1, 1, 1, 1, 1,
-0.3669506, 0.8092588, -1.217009, 1, 1, 1, 1, 1,
-0.3565651, 0.275496, -0.2406164, 1, 1, 1, 1, 1,
-0.3548506, 0.6486681, -1.895354, 1, 1, 1, 1, 1,
-0.3526658, -0.1636944, -1.925461, 1, 1, 1, 1, 1,
-0.3449747, 0.5930478, -1.170214, 1, 1, 1, 1, 1,
-0.3444787, 0.3817788, 0.4008994, 1, 1, 1, 1, 1,
-0.341987, 1.059739, -0.4891015, 1, 1, 1, 1, 1,
-0.3376152, 1.740848, -0.5480352, 1, 1, 1, 1, 1,
-0.3361725, -0.2279122, -0.6103593, 1, 1, 1, 1, 1,
-0.3358499, -0.2620032, -3.5599, 1, 1, 1, 1, 1,
-0.3357568, -0.1171309, -0.7674192, 1, 1, 1, 1, 1,
-0.3340467, 1.136372, -0.2894425, 1, 1, 1, 1, 1,
-0.332545, -0.8545303, -3.307168, 1, 1, 1, 1, 1,
-0.3321093, -0.6916552, -3.889002, 0, 0, 1, 1, 1,
-0.3289188, -0.03645582, -1.353438, 1, 0, 0, 1, 1,
-0.3288317, 0.278753, 0.1539878, 1, 0, 0, 1, 1,
-0.3279377, 1.598062, -0.1958028, 1, 0, 0, 1, 1,
-0.3254129, 0.0510686, 0.8529429, 1, 0, 0, 1, 1,
-0.3205177, 0.3815314, -0.5444222, 1, 0, 0, 1, 1,
-0.3180735, 0.6217723, -0.6288368, 0, 0, 0, 1, 1,
-0.317521, 1.657267, -0.1007134, 0, 0, 0, 1, 1,
-0.3159452, -0.1603876, -2.039855, 0, 0, 0, 1, 1,
-0.3091539, -0.6612787, -2.726564, 0, 0, 0, 1, 1,
-0.3041455, -0.1614572, -3.661309, 0, 0, 0, 1, 1,
-0.3030944, 0.5780823, -1.783547, 0, 0, 0, 1, 1,
-0.3022746, -0.8389894, -3.225061, 0, 0, 0, 1, 1,
-0.2996736, -1.281431, -2.105944, 1, 1, 1, 1, 1,
-0.2970932, -1.35779, -3.18295, 1, 1, 1, 1, 1,
-0.2916556, -0.06402922, 0.3356712, 1, 1, 1, 1, 1,
-0.2874562, 0.5731955, -1.164153, 1, 1, 1, 1, 1,
-0.2784287, -1.949598, -2.931902, 1, 1, 1, 1, 1,
-0.2692491, 1.159017, -0.5991637, 1, 1, 1, 1, 1,
-0.2661349, -0.34449, -3.399647, 1, 1, 1, 1, 1,
-0.2655765, 0.1114528, -1.659475, 1, 1, 1, 1, 1,
-0.2589936, -0.6474718, -3.038906, 1, 1, 1, 1, 1,
-0.2584322, -0.5235946, -4.288889, 1, 1, 1, 1, 1,
-0.2576889, 1.030749, -0.5098073, 1, 1, 1, 1, 1,
-0.2558301, 1.405888, -0.3885105, 1, 1, 1, 1, 1,
-0.2544345, -0.1316167, -3.101884, 1, 1, 1, 1, 1,
-0.2532522, -0.2983126, -3.427175, 1, 1, 1, 1, 1,
-0.2530581, -0.3938327, -2.96748, 1, 1, 1, 1, 1,
-0.2527083, 1.607506, 0.6664531, 0, 0, 1, 1, 1,
-0.2519318, -0.2951501, -1.041158, 1, 0, 0, 1, 1,
-0.2503053, 0.2510999, -1.002505, 1, 0, 0, 1, 1,
-0.2500985, -0.3078268, -1.559673, 1, 0, 0, 1, 1,
-0.2470064, -0.265869, -1.499091, 1, 0, 0, 1, 1,
-0.246903, 0.8297828, -0.2976349, 1, 0, 0, 1, 1,
-0.2402086, -1.557827, -1.419064, 0, 0, 0, 1, 1,
-0.2389548, -0.4232844, -2.979945, 0, 0, 0, 1, 1,
-0.2388306, 1.069957, -0.9417388, 0, 0, 0, 1, 1,
-0.2342461, 0.26359, -1.168922, 0, 0, 0, 1, 1,
-0.2314873, -0.56758, -2.924554, 0, 0, 0, 1, 1,
-0.2313997, 0.6099038, -1.256559, 0, 0, 0, 1, 1,
-0.2281011, -0.08476899, -3.238587, 0, 0, 0, 1, 1,
-0.2273143, 0.6717849, 1.976106, 1, 1, 1, 1, 1,
-0.2216201, 0.162223, -1.381262, 1, 1, 1, 1, 1,
-0.2169617, 2.583561, -1.618264, 1, 1, 1, 1, 1,
-0.2075618, -0.7259995, -1.676912, 1, 1, 1, 1, 1,
-0.2060329, -0.4839842, -2.361046, 1, 1, 1, 1, 1,
-0.1968743, -1.077328, -3.175274, 1, 1, 1, 1, 1,
-0.19353, -0.0562462, -2.519186, 1, 1, 1, 1, 1,
-0.1934698, 0.3071553, 0.7750189, 1, 1, 1, 1, 1,
-0.1924394, 0.2352253, -0.2411986, 1, 1, 1, 1, 1,
-0.1916317, 0.6624025, -0.4369367, 1, 1, 1, 1, 1,
-0.1895856, -0.5994609, -1.124659, 1, 1, 1, 1, 1,
-0.186076, 0.357437, -0.5135697, 1, 1, 1, 1, 1,
-0.1850308, -0.367721, -1.936161, 1, 1, 1, 1, 1,
-0.1839714, -0.6511835, -1.360192, 1, 1, 1, 1, 1,
-0.1821687, -1.539599, -3.984046, 1, 1, 1, 1, 1,
-0.1812774, 1.155353, 0.4874771, 0, 0, 1, 1, 1,
-0.1806025, -0.02293801, -3.048853, 1, 0, 0, 1, 1,
-0.1788934, -2.285371, -1.496864, 1, 0, 0, 1, 1,
-0.1719554, -0.748715, -2.498733, 1, 0, 0, 1, 1,
-0.165844, 1.022809, -0.8865454, 1, 0, 0, 1, 1,
-0.1644641, -0.5990353, -2.449255, 1, 0, 0, 1, 1,
-0.158135, 0.008613493, -2.238011, 0, 0, 0, 1, 1,
-0.1522703, -0.8270519, -2.93615, 0, 0, 0, 1, 1,
-0.1490118, -0.1361968, -1.700446, 0, 0, 0, 1, 1,
-0.147018, 1.058467, -0.8332571, 0, 0, 0, 1, 1,
-0.1466807, -0.2484282, -3.213613, 0, 0, 0, 1, 1,
-0.1387874, -0.9740613, -2.901649, 0, 0, 0, 1, 1,
-0.1368324, -0.101455, -2.145706, 0, 0, 0, 1, 1,
-0.1343673, -1.417416, -2.431954, 1, 1, 1, 1, 1,
-0.1322047, -0.8387778, -3.805852, 1, 1, 1, 1, 1,
-0.1295666, -0.4911989, -2.472836, 1, 1, 1, 1, 1,
-0.1244966, 0.4911344, 1.243441, 1, 1, 1, 1, 1,
-0.1224712, 1.267955, -0.08623295, 1, 1, 1, 1, 1,
-0.1216719, -0.5368125, -2.410171, 1, 1, 1, 1, 1,
-0.1215394, -0.9822451, -3.726398, 1, 1, 1, 1, 1,
-0.116868, 0.3854303, -0.2344857, 1, 1, 1, 1, 1,
-0.1160537, -0.06785942, -2.451984, 1, 1, 1, 1, 1,
-0.1142672, -1.253963, -2.900052, 1, 1, 1, 1, 1,
-0.1114674, -0.5075166, -3.826918, 1, 1, 1, 1, 1,
-0.1097193, 1.0788, -0.9506204, 1, 1, 1, 1, 1,
-0.1090505, -0.5543833, -3.626138, 1, 1, 1, 1, 1,
-0.1009487, -1.596054, -2.922972, 1, 1, 1, 1, 1,
-0.09925576, 1.373949, 0.4822142, 1, 1, 1, 1, 1,
-0.09217762, -0.08226849, -2.254677, 0, 0, 1, 1, 1,
-0.09207241, -0.1527466, -2.526533, 1, 0, 0, 1, 1,
-0.09062564, -1.412741, -3.678286, 1, 0, 0, 1, 1,
-0.08123644, 1.259782, 0.8259357, 1, 0, 0, 1, 1,
-0.08059864, 0.2763872, -2.258552, 1, 0, 0, 1, 1,
-0.07503588, 0.8212577, -1.420677, 1, 0, 0, 1, 1,
-0.06929018, 1.00028, 1.911125, 0, 0, 0, 1, 1,
-0.06746434, 0.6732714, -0.32, 0, 0, 0, 1, 1,
-0.06611735, 1.595725, 0.6859764, 0, 0, 0, 1, 1,
-0.06017961, -0.9201631, -3.796628, 0, 0, 0, 1, 1,
-0.05717656, -0.3814932, -2.537527, 0, 0, 0, 1, 1,
-0.05199148, 1.807941, 1.513551, 0, 0, 0, 1, 1,
-0.05160611, -0.2687165, -2.743946, 0, 0, 0, 1, 1,
-0.05140376, -0.9381318, -2.841915, 1, 1, 1, 1, 1,
-0.05136351, 1.576405, -1.145509, 1, 1, 1, 1, 1,
-0.05025059, -1.137401, -2.215633, 1, 1, 1, 1, 1,
-0.04962404, -0.759432, -3.732633, 1, 1, 1, 1, 1,
-0.04369416, 0.6839771, -1.292814, 1, 1, 1, 1, 1,
-0.03815203, -2.212813, -3.72052, 1, 1, 1, 1, 1,
-0.03791306, -1.424978, -2.85244, 1, 1, 1, 1, 1,
-0.03412489, 0.5774956, -0.5312544, 1, 1, 1, 1, 1,
-0.03151354, -0.3777954, -4.363774, 1, 1, 1, 1, 1,
-0.0314209, -1.127037, -1.34537, 1, 1, 1, 1, 1,
-0.02745382, 1.00929, 0.9451448, 1, 1, 1, 1, 1,
-0.02577413, -0.608551, -3.803735, 1, 1, 1, 1, 1,
-0.02044346, -0.6886649, -1.62442, 1, 1, 1, 1, 1,
-0.01954723, -0.04407634, -1.957108, 1, 1, 1, 1, 1,
-0.01788838, -0.0324376, -2.655808, 1, 1, 1, 1, 1,
-0.01327859, 0.8653032, 0.01939555, 0, 0, 1, 1, 1,
-0.01320607, 1.280047, -1.35126, 1, 0, 0, 1, 1,
-0.01287977, 0.255608, -0.7160968, 1, 0, 0, 1, 1,
-0.01182451, -0.3820676, -2.466989, 1, 0, 0, 1, 1,
-0.01145406, -1.066653, -3.914021, 1, 0, 0, 1, 1,
-0.01145232, -0.3668737, -2.670166, 1, 0, 0, 1, 1,
-0.009386998, 0.8668375, 0.2110422, 0, 0, 0, 1, 1,
-0.004827119, -1.107325, -3.800548, 0, 0, 0, 1, 1,
0.005254119, 0.00329041, 0.4083891, 0, 0, 0, 1, 1,
0.006103917, 0.3819596, -0.3349516, 0, 0, 0, 1, 1,
0.006520742, -1.32418, 3.974452, 0, 0, 0, 1, 1,
0.009634891, 0.5504323, 0.6596654, 0, 0, 0, 1, 1,
0.01067071, 0.1742188, -0.1298552, 0, 0, 0, 1, 1,
0.01518058, -0.7798105, 4.3023, 1, 1, 1, 1, 1,
0.01741149, 0.7393839, -0.3665027, 1, 1, 1, 1, 1,
0.02738075, 0.9600225, 0.5827869, 1, 1, 1, 1, 1,
0.03096399, -0.4141198, 0.8964981, 1, 1, 1, 1, 1,
0.03460122, -0.4269664, 2.390408, 1, 1, 1, 1, 1,
0.0390319, -1.186567, 3.497076, 1, 1, 1, 1, 1,
0.04098247, 0.152492, -0.339722, 1, 1, 1, 1, 1,
0.04348795, -0.1939935, 2.319948, 1, 1, 1, 1, 1,
0.04407172, -0.3269189, 4.33726, 1, 1, 1, 1, 1,
0.04717001, 0.8759259, -1.027351, 1, 1, 1, 1, 1,
0.04763584, 0.1436656, -0.8942658, 1, 1, 1, 1, 1,
0.04819879, -1.080009, 1.798104, 1, 1, 1, 1, 1,
0.05083794, -0.2779741, 2.288114, 1, 1, 1, 1, 1,
0.05157915, 1.425697, -0.6145387, 1, 1, 1, 1, 1,
0.0526057, 1.495136, -0.7504174, 1, 1, 1, 1, 1,
0.05313154, 0.4546623, 0.4462959, 0, 0, 1, 1, 1,
0.0532489, -1.712672, 2.663307, 1, 0, 0, 1, 1,
0.05615598, -1.862726, 1.609938, 1, 0, 0, 1, 1,
0.05761667, -0.2101978, 3.001472, 1, 0, 0, 1, 1,
0.05825968, -0.002713945, 1.62715, 1, 0, 0, 1, 1,
0.05940209, -0.7327446, 2.274155, 1, 0, 0, 1, 1,
0.05964953, 0.7936852, -0.2445971, 0, 0, 0, 1, 1,
0.05989615, -1.539097, 4.125134, 0, 0, 0, 1, 1,
0.05994463, 0.0986919, 0.4725316, 0, 0, 0, 1, 1,
0.06060106, -0.05129969, 2.133523, 0, 0, 0, 1, 1,
0.06353582, 1.018698, 1.067268, 0, 0, 0, 1, 1,
0.06376515, -0.01272281, 1.7973, 0, 0, 0, 1, 1,
0.06709719, 0.7239224, 2.772754, 0, 0, 0, 1, 1,
0.06735849, -0.08617919, 2.442041, 1, 1, 1, 1, 1,
0.06777176, 0.6781914, 0.6367537, 1, 1, 1, 1, 1,
0.07001853, 1.340371, -0.32517, 1, 1, 1, 1, 1,
0.07586227, -0.1428919, 2.731999, 1, 1, 1, 1, 1,
0.08179762, 1.245987, 0.4543498, 1, 1, 1, 1, 1,
0.08349968, -0.3116561, 3.496389, 1, 1, 1, 1, 1,
0.08569799, -0.7134657, 1.652124, 1, 1, 1, 1, 1,
0.08631581, 0.8555385, -0.8928074, 1, 1, 1, 1, 1,
0.08848408, -1.058182, 3.934072, 1, 1, 1, 1, 1,
0.08898231, 1.172875, 0.4052723, 1, 1, 1, 1, 1,
0.0911311, 0.8296901, 2.647491, 1, 1, 1, 1, 1,
0.09382235, -0.338638, 3.283463, 1, 1, 1, 1, 1,
0.09843808, -0.2351267, 2.962055, 1, 1, 1, 1, 1,
0.1024957, 0.2334882, 1.842348, 1, 1, 1, 1, 1,
0.1029029, 0.2462734, -0.09894989, 1, 1, 1, 1, 1,
0.106391, 1.401869, -1.177342, 0, 0, 1, 1, 1,
0.1065863, -0.1238227, 2.370655, 1, 0, 0, 1, 1,
0.1074866, 1.802311, 0.9451003, 1, 0, 0, 1, 1,
0.1078281, 0.4313272, -0.7288272, 1, 0, 0, 1, 1,
0.1078957, -0.4842394, 0.9851285, 1, 0, 0, 1, 1,
0.1125401, -0.5227972, 3.821296, 1, 0, 0, 1, 1,
0.1151544, -1.750911, 4.210891, 0, 0, 0, 1, 1,
0.1193886, -1.089471, 1.882322, 0, 0, 0, 1, 1,
0.1205359, -0.7197595, 3.475457, 0, 0, 0, 1, 1,
0.1242662, 0.9181046, -0.2592426, 0, 0, 0, 1, 1,
0.1261045, -0.8719203, 4.526467, 0, 0, 0, 1, 1,
0.126462, 1.237168, 1.411504, 0, 0, 0, 1, 1,
0.1286404, -1.2872, 3.1458, 0, 0, 0, 1, 1,
0.1306512, -0.548008, 3.609877, 1, 1, 1, 1, 1,
0.1328765, 1.320416, 0.2953112, 1, 1, 1, 1, 1,
0.1381837, -0.3958651, 2.854414, 1, 1, 1, 1, 1,
0.1403309, 0.1358728, 2.493914, 1, 1, 1, 1, 1,
0.1445296, -0.380058, 3.661812, 1, 1, 1, 1, 1,
0.1458315, 0.4337223, -1.802879, 1, 1, 1, 1, 1,
0.1473671, 1.422415, -1.269219, 1, 1, 1, 1, 1,
0.1503572, -1.27512, 2.606204, 1, 1, 1, 1, 1,
0.1539667, 1.837605, 0.2030037, 1, 1, 1, 1, 1,
0.1555948, -1.406197, 1.980914, 1, 1, 1, 1, 1,
0.1614113, -0.3963682, 2.817411, 1, 1, 1, 1, 1,
0.1630178, 0.9147018, 1.666899, 1, 1, 1, 1, 1,
0.1666433, -1.650038, 4.36838, 1, 1, 1, 1, 1,
0.1708616, 1.49781, -0.2043128, 1, 1, 1, 1, 1,
0.1744974, 0.6535822, -1.261309, 1, 1, 1, 1, 1,
0.1764449, 0.5034144, 0.2688288, 0, 0, 1, 1, 1,
0.1779376, -0.3526639, 2.698821, 1, 0, 0, 1, 1,
0.1788988, 0.2301732, 0.6477178, 1, 0, 0, 1, 1,
0.1859449, 2.14519, 0.06038829, 1, 0, 0, 1, 1,
0.1869465, 0.9584236, -0.4946467, 1, 0, 0, 1, 1,
0.1893409, 0.2521036, 0.9507824, 1, 0, 0, 1, 1,
0.1906542, 0.955586, 0.2400802, 0, 0, 0, 1, 1,
0.1963422, 1.243526, -1.639134, 0, 0, 0, 1, 1,
0.2171683, 1.084906, 0.3568918, 0, 0, 0, 1, 1,
0.2226162, -2.103072, 2.800362, 0, 0, 0, 1, 1,
0.2249401, 1.865792, 0.4425166, 0, 0, 0, 1, 1,
0.2302541, -0.01278668, 1.394037, 0, 0, 0, 1, 1,
0.2344034, -0.3461456, 3.428377, 0, 0, 0, 1, 1,
0.237457, -0.4474506, 0.4957602, 1, 1, 1, 1, 1,
0.242723, 0.5951349, 0.1669673, 1, 1, 1, 1, 1,
0.2427245, 0.5019505, 0.9177315, 1, 1, 1, 1, 1,
0.2430348, -0.3800271, 2.09129, 1, 1, 1, 1, 1,
0.2448588, -1.156755, 1.887498, 1, 1, 1, 1, 1,
0.2457204, -0.3244265, 2.334128, 1, 1, 1, 1, 1,
0.2496284, -0.0276525, 1.067175, 1, 1, 1, 1, 1,
0.2505085, -2.001492, 4.26546, 1, 1, 1, 1, 1,
0.2639003, 0.3471162, 0.5988178, 1, 1, 1, 1, 1,
0.2643382, 0.5426148, 0.1470348, 1, 1, 1, 1, 1,
0.2645132, -0.2775933, 2.394845, 1, 1, 1, 1, 1,
0.2651558, 1.777616, 0.3945238, 1, 1, 1, 1, 1,
0.2703476, -1.049659, 2.904667, 1, 1, 1, 1, 1,
0.2726671, 0.2830367, 2.321159, 1, 1, 1, 1, 1,
0.2731396, 0.1501915, 0.562989, 1, 1, 1, 1, 1,
0.2732051, -1.517917, 1.756729, 0, 0, 1, 1, 1,
0.2747058, 0.9212011, 0.6565164, 1, 0, 0, 1, 1,
0.2753397, 0.3393966, 1.206965, 1, 0, 0, 1, 1,
0.2754901, 0.1381627, 1.769759, 1, 0, 0, 1, 1,
0.280576, 1.506339, 0.2232343, 1, 0, 0, 1, 1,
0.281609, -0.7542139, 3.362343, 1, 0, 0, 1, 1,
0.2862332, -0.03422932, 1.959269, 0, 0, 0, 1, 1,
0.286299, 1.046937, 1.399809, 0, 0, 0, 1, 1,
0.2902946, 0.6302075, 0.1461082, 0, 0, 0, 1, 1,
0.2973163, -2.915933, 2.381203, 0, 0, 0, 1, 1,
0.3011513, -0.0269987, 1.99977, 0, 0, 0, 1, 1,
0.3056169, 0.4743268, 0.2888088, 0, 0, 0, 1, 1,
0.3057975, 1.377135, 0.5173956, 0, 0, 0, 1, 1,
0.310851, -0.8668903, 1.531021, 1, 1, 1, 1, 1,
0.3130724, -0.1420501, 2.821202, 1, 1, 1, 1, 1,
0.3150019, 1.963412, -0.1958381, 1, 1, 1, 1, 1,
0.3213486, 0.5584885, 0.6704823, 1, 1, 1, 1, 1,
0.3275888, -1.443484, 3.34339, 1, 1, 1, 1, 1,
0.333945, 0.2150672, 1.363657, 1, 1, 1, 1, 1,
0.3353192, -0.4030961, 1.554397, 1, 1, 1, 1, 1,
0.3435069, -1.074176, 3.140012, 1, 1, 1, 1, 1,
0.3458204, -0.4454046, 3.203106, 1, 1, 1, 1, 1,
0.3488262, 0.002793357, 3.622058, 1, 1, 1, 1, 1,
0.3492443, 1.079116, -0.5785753, 1, 1, 1, 1, 1,
0.3495191, 2.698065, -0.1291941, 1, 1, 1, 1, 1,
0.3514045, -0.3957338, 1.09465, 1, 1, 1, 1, 1,
0.3529219, 2.918874, 1.08483, 1, 1, 1, 1, 1,
0.3532514, 1.428076, 0.2156786, 1, 1, 1, 1, 1,
0.3541518, 1.152983, 2.469393, 0, 0, 1, 1, 1,
0.3665244, -0.50766, 2.41151, 1, 0, 0, 1, 1,
0.3720348, -1.143063, 2.572874, 1, 0, 0, 1, 1,
0.3766553, 0.6076664, 0.8937137, 1, 0, 0, 1, 1,
0.3789627, -0.313452, 2.201209, 1, 0, 0, 1, 1,
0.3836725, 1.56171, -0.1649899, 1, 0, 0, 1, 1,
0.3851482, 1.480337, -2.081059, 0, 0, 0, 1, 1,
0.3875025, 1.869972, 1.018205, 0, 0, 0, 1, 1,
0.3938513, 0.6327139, 0.8055724, 0, 0, 0, 1, 1,
0.3974906, -0.3618003, 3.011946, 0, 0, 0, 1, 1,
0.3975864, 0.4964811, -0.3230594, 0, 0, 0, 1, 1,
0.4016781, -0.1463786, 0.5026579, 0, 0, 0, 1, 1,
0.4036554, 0.5064676, 0.2465174, 0, 0, 0, 1, 1,
0.4057038, 0.4389939, 0.6117739, 1, 1, 1, 1, 1,
0.406938, -1.170125, 2.562159, 1, 1, 1, 1, 1,
0.4069383, 0.6530058, -0.2557047, 1, 1, 1, 1, 1,
0.4081115, 0.1079494, 1.417235, 1, 1, 1, 1, 1,
0.4124891, -1.312827, 2.191584, 1, 1, 1, 1, 1,
0.4177282, -0.2324473, 0.7950957, 1, 1, 1, 1, 1,
0.4217249, -1.445609, 1.835079, 1, 1, 1, 1, 1,
0.4221551, 0.5612245, 0.8926709, 1, 1, 1, 1, 1,
0.4232202, -0.6848946, 3.479452, 1, 1, 1, 1, 1,
0.423373, -0.6756338, 3.364799, 1, 1, 1, 1, 1,
0.426373, -0.156004, 0.623378, 1, 1, 1, 1, 1,
0.4264508, 0.6677681, 2.568501, 1, 1, 1, 1, 1,
0.4264635, 0.4711346, 0.7325057, 1, 1, 1, 1, 1,
0.4304845, 0.3159024, 1.223954, 1, 1, 1, 1, 1,
0.4305669, 1.057014, -0.3402477, 1, 1, 1, 1, 1,
0.4308971, -0.7503954, 4.213368, 0, 0, 1, 1, 1,
0.4326761, 0.9022954, 2.811518, 1, 0, 0, 1, 1,
0.4373671, -0.5828, 1.530582, 1, 0, 0, 1, 1,
0.4420223, 0.5527629, 1.703469, 1, 0, 0, 1, 1,
0.4426137, 0.4192403, 0.4881223, 1, 0, 0, 1, 1,
0.4499684, -0.1131405, 0.583143, 1, 0, 0, 1, 1,
0.4509356, -1.627891, 3.0342, 0, 0, 0, 1, 1,
0.4536746, -0.4838501, 1.547362, 0, 0, 0, 1, 1,
0.4552945, -0.1798939, -0.008966643, 0, 0, 0, 1, 1,
0.4613939, -0.8447905, 1.423699, 0, 0, 0, 1, 1,
0.4642667, -0.3486317, 2.478663, 0, 0, 0, 1, 1,
0.4659409, -0.2568032, 1.823314, 0, 0, 0, 1, 1,
0.4662814, -1.251725, 0.7759267, 0, 0, 0, 1, 1,
0.4674647, -0.895281, 3.583587, 1, 1, 1, 1, 1,
0.4703189, -0.2617602, 3.126607, 1, 1, 1, 1, 1,
0.471756, -0.04487325, 1.030784, 1, 1, 1, 1, 1,
0.4753804, 0.2014867, 0.9749693, 1, 1, 1, 1, 1,
0.4771336, 1.42414, 0.3352369, 1, 1, 1, 1, 1,
0.4774067, 1.148497, 1.491773, 1, 1, 1, 1, 1,
0.4793455, 0.7436627, 1.054681, 1, 1, 1, 1, 1,
0.4824892, -0.3542315, 3.861893, 1, 1, 1, 1, 1,
0.4867096, -0.002417314, 0.9554076, 1, 1, 1, 1, 1,
0.4926232, 2.344861, 0.9235541, 1, 1, 1, 1, 1,
0.494994, 1.147574, -0.9731105, 1, 1, 1, 1, 1,
0.4963546, -0.09905559, 2.192853, 1, 1, 1, 1, 1,
0.496942, 0.5435974, 1.285501, 1, 1, 1, 1, 1,
0.500871, 0.7617341, -0.3029708, 1, 1, 1, 1, 1,
0.5035986, -2.461996, 2.372718, 1, 1, 1, 1, 1,
0.5044919, 1.604637, 2.75685, 0, 0, 1, 1, 1,
0.5076222, 1.350908, -0.2491939, 1, 0, 0, 1, 1,
0.5083994, -1.59261, 3.760684, 1, 0, 0, 1, 1,
0.5157061, -0.8543453, 3.301126, 1, 0, 0, 1, 1,
0.5191391, 2.403605, -0.4021643, 1, 0, 0, 1, 1,
0.5193442, -1.169991, 3.823333, 1, 0, 0, 1, 1,
0.5221815, 1.619236, -0.196143, 0, 0, 0, 1, 1,
0.5256081, -0.9375634, 2.388563, 0, 0, 0, 1, 1,
0.5370318, -0.1078142, 0.005283481, 0, 0, 0, 1, 1,
0.5410945, 1.079097, -1.432572, 0, 0, 0, 1, 1,
0.544995, -1.334357, 2.762002, 0, 0, 0, 1, 1,
0.546275, 0.8281016, 0.3282306, 0, 0, 0, 1, 1,
0.5467681, 1.265529, 0.2579142, 0, 0, 0, 1, 1,
0.5519891, -0.1042529, 0.3032902, 1, 1, 1, 1, 1,
0.5524715, 0.2965109, 1.557629, 1, 1, 1, 1, 1,
0.5534551, -0.2876947, 2.309008, 1, 1, 1, 1, 1,
0.5559529, 0.1491422, 0.5128214, 1, 1, 1, 1, 1,
0.5575531, 0.3763673, 0.126413, 1, 1, 1, 1, 1,
0.5633733, -0.7346955, 4.494546, 1, 1, 1, 1, 1,
0.5695096, -0.2268166, 0.819694, 1, 1, 1, 1, 1,
0.5753391, 0.2637716, 1.428495, 1, 1, 1, 1, 1,
0.5764078, -0.2280975, 2.129367, 1, 1, 1, 1, 1,
0.5764255, -0.571309, 1.259035, 1, 1, 1, 1, 1,
0.5851542, 0.1058594, 1.030793, 1, 1, 1, 1, 1,
0.5884754, -0.8628475, 2.944456, 1, 1, 1, 1, 1,
0.5887535, 0.05153286, 0.8713526, 1, 1, 1, 1, 1,
0.5928803, 0.1586019, 0.9617718, 1, 1, 1, 1, 1,
0.5939885, 0.3160621, -0.3016941, 1, 1, 1, 1, 1,
0.6034393, 0.3558487, 1.33226, 0, 0, 1, 1, 1,
0.609679, 0.9427657, 0.9069595, 1, 0, 0, 1, 1,
0.6137529, 0.4346377, -0.3088436, 1, 0, 0, 1, 1,
0.6142005, -0.022146, 2.305586, 1, 0, 0, 1, 1,
0.6209674, -0.8243656, 2.657686, 1, 0, 0, 1, 1,
0.6233874, 1.340959, 2.941222, 1, 0, 0, 1, 1,
0.6317111, 2.511541, 1.751472, 0, 0, 0, 1, 1,
0.634896, -1.470384, 2.868757, 0, 0, 0, 1, 1,
0.6371646, 0.2849656, 1.527818, 0, 0, 0, 1, 1,
0.6386626, 0.6711357, 1.336027, 0, 0, 0, 1, 1,
0.6393918, -0.5100297, 2.344687, 0, 0, 0, 1, 1,
0.6406966, 1.981566, -0.6093372, 0, 0, 0, 1, 1,
0.6444873, -0.1423332, 2.215621, 0, 0, 0, 1, 1,
0.645748, -0.9729409, 1.838133, 1, 1, 1, 1, 1,
0.6468729, -0.04109429, 1.619131, 1, 1, 1, 1, 1,
0.6484092, -0.04264813, 2.879465, 1, 1, 1, 1, 1,
0.6500629, 0.464413, -0.1084561, 1, 1, 1, 1, 1,
0.6525719, 1.873957, -2.22189, 1, 1, 1, 1, 1,
0.6528242, 0.2088066, 2.183915, 1, 1, 1, 1, 1,
0.6550065, 0.9261369, -1.396419, 1, 1, 1, 1, 1,
0.6599938, -0.4451939, 0.8689966, 1, 1, 1, 1, 1,
0.6620574, -0.151483, 0.9213227, 1, 1, 1, 1, 1,
0.6622804, 0.4102996, 1.4813, 1, 1, 1, 1, 1,
0.6662067, 0.5886194, 1.332319, 1, 1, 1, 1, 1,
0.6676668, -0.2545555, 3.432773, 1, 1, 1, 1, 1,
0.6896951, 0.2526057, 2.132852, 1, 1, 1, 1, 1,
0.6934317, -1.432067, 2.908156, 1, 1, 1, 1, 1,
0.6961178, -1.120715, 3.187669, 1, 1, 1, 1, 1,
0.6972299, 0.6176888, 1.544192, 0, 0, 1, 1, 1,
0.7003903, 1.555172, -0.6474571, 1, 0, 0, 1, 1,
0.7004042, 0.6828942, -1.094205, 1, 0, 0, 1, 1,
0.7009421, 0.2617487, 2.174104, 1, 0, 0, 1, 1,
0.7021553, -1.125315, 3.291482, 1, 0, 0, 1, 1,
0.7048433, 1.43276, 0.8675937, 1, 0, 0, 1, 1,
0.7048531, 0.333284, 1.180294, 0, 0, 0, 1, 1,
0.7123252, -0.007334783, 0.4800485, 0, 0, 0, 1, 1,
0.7130241, 0.7482036, 1.297492, 0, 0, 0, 1, 1,
0.7184384, -0.9817826, 1.762262, 0, 0, 0, 1, 1,
0.7187567, -0.1117763, 4.173496, 0, 0, 0, 1, 1,
0.7197316, -0.756687, -0.007030461, 0, 0, 0, 1, 1,
0.7224746, -2.595904, 3.064439, 0, 0, 0, 1, 1,
0.7281203, 0.3915973, 0.957189, 1, 1, 1, 1, 1,
0.728847, -0.8187613, 3.674757, 1, 1, 1, 1, 1,
0.7318885, -1.070802, 1.888582, 1, 1, 1, 1, 1,
0.7347546, -1.122802, 3.054394, 1, 1, 1, 1, 1,
0.7368677, 0.3999066, 1.748379, 1, 1, 1, 1, 1,
0.7370391, -1.037437, 4.021283, 1, 1, 1, 1, 1,
0.7377942, 1.194799, -0.9893641, 1, 1, 1, 1, 1,
0.7436841, -2.150254, 1.682914, 1, 1, 1, 1, 1,
0.7439922, 0.4218233, 0.1268965, 1, 1, 1, 1, 1,
0.7442123, 0.1672547, 0.6255414, 1, 1, 1, 1, 1,
0.7451852, -1.230534, 4.683663, 1, 1, 1, 1, 1,
0.7466938, -0.7476888, 1.214082, 1, 1, 1, 1, 1,
0.749288, -0.7526798, 2.099658, 1, 1, 1, 1, 1,
0.7535015, 1.258011, -0.7577187, 1, 1, 1, 1, 1,
0.755209, -1.316093, 1.488357, 1, 1, 1, 1, 1,
0.7590287, -0.6203622, 2.32997, 0, 0, 1, 1, 1,
0.7678404, 0.3629536, 0.02155723, 1, 0, 0, 1, 1,
0.7682341, 0.07067667, 3.529952, 1, 0, 0, 1, 1,
0.7700266, -0.006954251, 2.821185, 1, 0, 0, 1, 1,
0.772948, -0.5934732, 2.549349, 1, 0, 0, 1, 1,
0.7781419, -0.3512508, 1.632472, 1, 0, 0, 1, 1,
0.7823371, -1.282651, 4.19799, 0, 0, 0, 1, 1,
0.7827439, 0.3423043, 0.9978575, 0, 0, 0, 1, 1,
0.7838091, 1.788288, -1.28889, 0, 0, 0, 1, 1,
0.7845384, 0.8104277, 0.5706144, 0, 0, 0, 1, 1,
0.7876792, 0.9363033, 2.097398, 0, 0, 0, 1, 1,
0.7882189, -1.030099, 3.007628, 0, 0, 0, 1, 1,
0.7919138, 2.156166, 0.3399363, 0, 0, 0, 1, 1,
0.8008011, -0.5486062, 2.053811, 1, 1, 1, 1, 1,
0.8081884, -0.5518314, 2.405692, 1, 1, 1, 1, 1,
0.808383, 0.5822378, 1.061002, 1, 1, 1, 1, 1,
0.8087353, -0.8397032, 3.716119, 1, 1, 1, 1, 1,
0.8122709, 0.08998318, 2.657584, 1, 1, 1, 1, 1,
0.8175225, -1.654466, 2.807472, 1, 1, 1, 1, 1,
0.8179229, 0.121403, 1.50832, 1, 1, 1, 1, 1,
0.818899, -1.878955, 1.999927, 1, 1, 1, 1, 1,
0.8205164, 0.5110082, 0.4026973, 1, 1, 1, 1, 1,
0.8248699, -0.6607863, 1.193528, 1, 1, 1, 1, 1,
0.8255892, 1.081301, -0.153442, 1, 1, 1, 1, 1,
0.826758, -0.5702028, 2.259888, 1, 1, 1, 1, 1,
0.835701, -0.009897086, 2.632978, 1, 1, 1, 1, 1,
0.8383718, -0.01503129, 0.8322569, 1, 1, 1, 1, 1,
0.8385584, 0.425906, 3.665334, 1, 1, 1, 1, 1,
0.8427957, 0.2509019, 1.944523, 0, 0, 1, 1, 1,
0.8496645, -0.1730931, 2.670037, 1, 0, 0, 1, 1,
0.8518359, 0.04773059, 3.078452, 1, 0, 0, 1, 1,
0.8556147, -0.1570216, 0.2585918, 1, 0, 0, 1, 1,
0.8656996, -0.06643017, 0.7706088, 1, 0, 0, 1, 1,
0.8669161, 0.6431513, -0.4425997, 1, 0, 0, 1, 1,
0.8678648, 0.1767183, 2.266155, 0, 0, 0, 1, 1,
0.869294, 1.220394, 0.2452684, 0, 0, 0, 1, 1,
0.8705373, -1.779899, 0.4871627, 0, 0, 0, 1, 1,
0.8709418, 0.9546147, 0.9430009, 0, 0, 0, 1, 1,
0.872328, 0.9275714, 1.188317, 0, 0, 0, 1, 1,
0.8757415, 0.8062548, 0.3437607, 0, 0, 0, 1, 1,
0.876845, 1.991626, 0.3500962, 0, 0, 0, 1, 1,
0.8838006, -2.557764, 3.031594, 1, 1, 1, 1, 1,
0.8947198, -0.8025135, 0.9939442, 1, 1, 1, 1, 1,
0.9028895, 0.6448551, 1.370805, 1, 1, 1, 1, 1,
0.9049975, -1.331271, 1.491475, 1, 1, 1, 1, 1,
0.921092, -0.6013868, 1.8575, 1, 1, 1, 1, 1,
0.9217888, -2.984996, 3.949757, 1, 1, 1, 1, 1,
0.9319932, 0.8610333, -1.844003, 1, 1, 1, 1, 1,
0.9418815, -0.5595064, 1.075452, 1, 1, 1, 1, 1,
0.9425576, -0.6414084, 2.041938, 1, 1, 1, 1, 1,
0.944438, 0.6039461, 1.634747, 1, 1, 1, 1, 1,
0.9451655, 2.211922, -1.138002, 1, 1, 1, 1, 1,
0.9501198, 0.5668398, 0.5899256, 1, 1, 1, 1, 1,
0.9507303, 0.5379905, 0.7936494, 1, 1, 1, 1, 1,
0.9529893, 0.7106691, 3.794044, 1, 1, 1, 1, 1,
0.9536035, 1.436791, -0.8308119, 1, 1, 1, 1, 1,
0.9540779, 0.9304391, 0.06514919, 0, 0, 1, 1, 1,
0.9583445, 0.3474136, 0.5670345, 1, 0, 0, 1, 1,
0.9641258, 0.04412592, 2.768958, 1, 0, 0, 1, 1,
0.9773554, -1.119372, 3.296693, 1, 0, 0, 1, 1,
0.9798084, 0.2556447, 1.928465, 1, 0, 0, 1, 1,
0.9799451, 0.09617733, -1.116685, 1, 0, 0, 1, 1,
0.9817167, -0.4480321, 0.9285365, 0, 0, 0, 1, 1,
0.9824221, -0.3346769, 2.890392, 0, 0, 0, 1, 1,
0.9853663, 0.4114995, -0.09162032, 0, 0, 0, 1, 1,
0.9910774, 0.2120481, 0.7621362, 0, 0, 0, 1, 1,
0.9923036, -0.5474027, 1.893255, 0, 0, 0, 1, 1,
1.003549, 0.3437526, 2.131353, 0, 0, 0, 1, 1,
1.00471, 1.614118, 1.272128, 0, 0, 0, 1, 1,
1.0157, 0.4050629, -0.4974909, 1, 1, 1, 1, 1,
1.022908, 1.17199, 0.9624781, 1, 1, 1, 1, 1,
1.028092, 0.2651291, 0.6634057, 1, 1, 1, 1, 1,
1.028385, 0.2251376, 3.940191, 1, 1, 1, 1, 1,
1.030649, -0.6975821, 1.277882, 1, 1, 1, 1, 1,
1.033439, 0.5232633, -0.2234967, 1, 1, 1, 1, 1,
1.034387, 1.165563, 2.127741, 1, 1, 1, 1, 1,
1.040843, -0.1824607, 1.471634, 1, 1, 1, 1, 1,
1.043891, -1.267945, 3.071394, 1, 1, 1, 1, 1,
1.045377, -0.3273614, 2.327596, 1, 1, 1, 1, 1,
1.048318, -0.1410123, 3.5851, 1, 1, 1, 1, 1,
1.051717, -0.3553279, 1.701886, 1, 1, 1, 1, 1,
1.060839, 1.506292, 1.881364, 1, 1, 1, 1, 1,
1.064252, -0.5935119, 2.644357, 1, 1, 1, 1, 1,
1.068239, 1.596221, 0.6017675, 1, 1, 1, 1, 1,
1.081295, -0.2914843, 1.796541, 0, 0, 1, 1, 1,
1.087867, -0.3717886, 2.508285, 1, 0, 0, 1, 1,
1.101117, -0.736158, 1.934888, 1, 0, 0, 1, 1,
1.107881, 0.3482681, -0.007114436, 1, 0, 0, 1, 1,
1.109241, -0.2369967, 2.623501, 1, 0, 0, 1, 1,
1.122861, 0.6709378, 1.666556, 1, 0, 0, 1, 1,
1.128955, 1.633435, 0.3254467, 0, 0, 0, 1, 1,
1.129886, 0.3952353, 2.145484, 0, 0, 0, 1, 1,
1.129923, 0.1464939, 1.748202, 0, 0, 0, 1, 1,
1.130377, 0.3011413, 1.124757, 0, 0, 0, 1, 1,
1.136344, 0.3123107, 1.716744, 0, 0, 0, 1, 1,
1.148572, 0.6653157, 1.225786, 0, 0, 0, 1, 1,
1.14908, 0.1575409, 0.372035, 0, 0, 0, 1, 1,
1.155344, 1.717508, 0.462767, 1, 1, 1, 1, 1,
1.155346, 0.1296624, 1.760447, 1, 1, 1, 1, 1,
1.159899, -0.9981019, 2.584103, 1, 1, 1, 1, 1,
1.163481, -0.8830352, 1.150896, 1, 1, 1, 1, 1,
1.165682, -2.190737, 1.473524, 1, 1, 1, 1, 1,
1.176085, 0.633049, 2.628085, 1, 1, 1, 1, 1,
1.17722, -0.7008385, 1.321, 1, 1, 1, 1, 1,
1.185455, 1.501117, 1.344517, 1, 1, 1, 1, 1,
1.185542, 0.7106584, 0.678814, 1, 1, 1, 1, 1,
1.19547, 0.1321226, 1.879417, 1, 1, 1, 1, 1,
1.238346, 0.5083052, -0.766691, 1, 1, 1, 1, 1,
1.241451, -0.1967828, 1.854874, 1, 1, 1, 1, 1,
1.243696, -0.8471841, 2.606938, 1, 1, 1, 1, 1,
1.24497, -0.09586772, 1.543581, 1, 1, 1, 1, 1,
1.2507, -2.40206, 2.298451, 1, 1, 1, 1, 1,
1.255291, -0.9987295, 1.702462, 0, 0, 1, 1, 1,
1.259318, -0.2093848, 2.55728, 1, 0, 0, 1, 1,
1.262402, -0.6347458, 0.1020469, 1, 0, 0, 1, 1,
1.269011, 0.02940924, 0.9905134, 1, 0, 0, 1, 1,
1.269522, 0.809757, 1.830289, 1, 0, 0, 1, 1,
1.270198, 1.709619, 0.2740032, 1, 0, 0, 1, 1,
1.292548, -0.5251627, 2.510545, 0, 0, 0, 1, 1,
1.294728, 0.6163079, 0.4768686, 0, 0, 0, 1, 1,
1.294889, 0.1145919, 1.988533, 0, 0, 0, 1, 1,
1.29833, -0.9674909, 2.647384, 0, 0, 0, 1, 1,
1.303105, 0.9378585, 0.3040251, 0, 0, 0, 1, 1,
1.333614, -0.8302834, 2.028629, 0, 0, 0, 1, 1,
1.347493, 0.7043308, 1.494595, 0, 0, 0, 1, 1,
1.347872, 0.2178901, 0.5199698, 1, 1, 1, 1, 1,
1.359735, -0.2600456, 2.81792, 1, 1, 1, 1, 1,
1.385063, 0.6293619, 0.9792862, 1, 1, 1, 1, 1,
1.390211, 0.7709167, 1.377184, 1, 1, 1, 1, 1,
1.395496, -0.8699797, -0.2146382, 1, 1, 1, 1, 1,
1.409732, -0.2390768, 3.26363, 1, 1, 1, 1, 1,
1.413139, -1.416252, 2.682613, 1, 1, 1, 1, 1,
1.413921, 0.02810877, 1.256883, 1, 1, 1, 1, 1,
1.429152, 0.334556, 0.07065514, 1, 1, 1, 1, 1,
1.430473, -0.7182629, 1.336489, 1, 1, 1, 1, 1,
1.45118, -0.6142341, 1.054683, 1, 1, 1, 1, 1,
1.459566, 0.1832678, 0.4316865, 1, 1, 1, 1, 1,
1.473153, 1.748183, 1.840726, 1, 1, 1, 1, 1,
1.484815, 0.1252642, 1.00519, 1, 1, 1, 1, 1,
1.490166, 1.414779, 0.9143065, 1, 1, 1, 1, 1,
1.491008, -1.07292, 3.271217, 0, 0, 1, 1, 1,
1.495399, -2.203887, 1.35116, 1, 0, 0, 1, 1,
1.496211, 1.851519, -1.374182, 1, 0, 0, 1, 1,
1.511988, -0.534945, 3.418838, 1, 0, 0, 1, 1,
1.512943, -1.283837, 3.279784, 1, 0, 0, 1, 1,
1.516595, -0.005766637, 0.2288608, 1, 0, 0, 1, 1,
1.52777, 1.559776, 0.5024813, 0, 0, 0, 1, 1,
1.534377, 0.01696573, 2.842234, 0, 0, 0, 1, 1,
1.540958, -0.4273198, 3.313396, 0, 0, 0, 1, 1,
1.546218, 0.1840278, 1.052345, 0, 0, 0, 1, 1,
1.548299, 1.421444, 0.8158083, 0, 0, 0, 1, 1,
1.566819, -0.9530531, 3.532357, 0, 0, 0, 1, 1,
1.586781, -0.2849547, 1.861285, 0, 0, 0, 1, 1,
1.606476, 0.4005555, 1.616958, 1, 1, 1, 1, 1,
1.621326, -0.1195279, 2.262459, 1, 1, 1, 1, 1,
1.623309, 1.465317, 1.024548, 1, 1, 1, 1, 1,
1.626548, 0.2996799, 2.450018, 1, 1, 1, 1, 1,
1.636854, -1.187321, 1.332656, 1, 1, 1, 1, 1,
1.642382, -0.8320689, 2.045711, 1, 1, 1, 1, 1,
1.64367, 0.241665, 0.8306846, 1, 1, 1, 1, 1,
1.648249, 0.1601994, 0.1596583, 1, 1, 1, 1, 1,
1.668747, -0.6467372, 2.001758, 1, 1, 1, 1, 1,
1.705091, -0.4950685, 4.656032, 1, 1, 1, 1, 1,
1.728807, 1.01691, 0.9607184, 1, 1, 1, 1, 1,
1.74191, -0.2284855, 0.9097602, 1, 1, 1, 1, 1,
1.746597, -2.179903, 3.267152, 1, 1, 1, 1, 1,
1.753926, 1.404979, 0.6864845, 1, 1, 1, 1, 1,
1.758508, 0.3875463, 3.320203, 1, 1, 1, 1, 1,
1.769284, -0.9078758, 1.422114, 0, 0, 1, 1, 1,
1.777487, 0.4920134, 2.176437, 1, 0, 0, 1, 1,
1.789289, -0.7163188, 0.8195469, 1, 0, 0, 1, 1,
1.807159, 2.10514, 0.3273358, 1, 0, 0, 1, 1,
1.834627, 1.513223, 2.766393, 1, 0, 0, 1, 1,
1.854109, -1.776099, 3.427201, 1, 0, 0, 1, 1,
1.859924, -0.3542076, 2.819652, 0, 0, 0, 1, 1,
1.889738, 0.2557487, 1.453559, 0, 0, 0, 1, 1,
1.892157, 1.314371, 0.04481741, 0, 0, 0, 1, 1,
1.894924, -2.171232, 2.935619, 0, 0, 0, 1, 1,
1.924136, -1.088032, 0.683652, 0, 0, 0, 1, 1,
1.929895, -1.456583, 1.396182, 0, 0, 0, 1, 1,
1.939141, -0.1538336, -1.055442, 0, 0, 0, 1, 1,
1.953203, -0.5187494, 0.671673, 1, 1, 1, 1, 1,
1.958184, 0.4853338, 1.705059, 1, 1, 1, 1, 1,
1.970399, -1.453595, 3.316773, 1, 1, 1, 1, 1,
1.979358, 0.7657447, 2.205915, 1, 1, 1, 1, 1,
1.989266, -0.8110912, 2.048493, 1, 1, 1, 1, 1,
2.002651, -1.25997, 2.320229, 1, 1, 1, 1, 1,
2.025755, -0.7084225, 1.793301, 1, 1, 1, 1, 1,
2.034608, 1.276918, 1.20782, 1, 1, 1, 1, 1,
2.038172, 0.4093566, 0.9640175, 1, 1, 1, 1, 1,
2.096995, 0.2976099, 2.572935, 1, 1, 1, 1, 1,
2.122944, 0.7360338, -0.48506, 1, 1, 1, 1, 1,
2.189027, -0.8758425, 1.187088, 1, 1, 1, 1, 1,
2.191522, 1.57248, 0.7863456, 1, 1, 1, 1, 1,
2.192097, -0.4351906, 0.6252751, 1, 1, 1, 1, 1,
2.198253, -0.1160453, -0.2661549, 1, 1, 1, 1, 1,
2.203087, 0.1516621, 1.082984, 0, 0, 1, 1, 1,
2.206333, 1.499224, 1.442292, 1, 0, 0, 1, 1,
2.20805, -0.2769947, 1.501264, 1, 0, 0, 1, 1,
2.240239, -0.02013306, 0.2030954, 1, 0, 0, 1, 1,
2.274088, 0.9461958, 1.044163, 1, 0, 0, 1, 1,
2.277188, -0.1176917, 2.040574, 1, 0, 0, 1, 1,
2.327065, -2.173794, 3.298133, 0, 0, 0, 1, 1,
2.332655, -0.2818916, 1.642846, 0, 0, 0, 1, 1,
2.349827, -0.6634766, 0.6751938, 0, 0, 0, 1, 1,
2.380603, 0.8521398, 2.995184, 0, 0, 0, 1, 1,
2.395692, -2.151872, 3.065373, 0, 0, 0, 1, 1,
2.39868, 0.8788066, 1.850464, 0, 0, 0, 1, 1,
2.412119, 2.281851, 2.014376, 0, 0, 0, 1, 1,
2.452858, -0.2290139, -1.560233, 1, 1, 1, 1, 1,
2.503079, 0.5803867, 1.877232, 1, 1, 1, 1, 1,
2.544882, -1.561334, 0.1168522, 1, 1, 1, 1, 1,
2.603596, 0.6209484, -0.1758842, 1, 1, 1, 1, 1,
2.631684, -0.08844192, 1.731883, 1, 1, 1, 1, 1,
2.651928, 0.9726415, 2.103382, 1, 1, 1, 1, 1,
3.123431, -1.278144, 1.662933, 1, 1, 1, 1, 1
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
var radius = 9.144405;
var distance = 32.11934;
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
mvMatrix.translate( 0.4277496, 0.0673703, -0.03689861 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.11934);
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
