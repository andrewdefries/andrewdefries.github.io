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
-2.692554, 0.5545725, -3.37682, 1, 0, 0, 1,
-2.642788, 0.3679363, -0.9483202, 1, 0.007843138, 0, 1,
-2.343107, -0.2922462, -1.200711, 1, 0.01176471, 0, 1,
-2.342368, 0.02907003, -3.181235, 1, 0.01960784, 0, 1,
-2.323472, 0.1297023, -1.805305, 1, 0.02352941, 0, 1,
-2.300124, 1.314203, -0.4939399, 1, 0.03137255, 0, 1,
-2.2877, -0.1390084, -1.911106, 1, 0.03529412, 0, 1,
-2.214015, 0.08359489, -0.9854307, 1, 0.04313726, 0, 1,
-2.198581, -1.027973, -2.031422, 1, 0.04705882, 0, 1,
-2.177418, 1.890329, 0.44063, 1, 0.05490196, 0, 1,
-2.149846, 0.2927003, 0.09463751, 1, 0.05882353, 0, 1,
-2.146981, -1.758494, -2.658349, 1, 0.06666667, 0, 1,
-2.113799, -0.8528967, -2.984129, 1, 0.07058824, 0, 1,
-2.102709, -1.420926, -3.017272, 1, 0.07843138, 0, 1,
-2.068008, 1.48208, -1.283669, 1, 0.08235294, 0, 1,
-2.002068, -1.843979, -0.5529732, 1, 0.09019608, 0, 1,
-1.995792, 1.217162, -1.346959, 1, 0.09411765, 0, 1,
-1.896304, 2.434839, -0.5687157, 1, 0.1019608, 0, 1,
-1.891404, 0.6650012, -2.232527, 1, 0.1098039, 0, 1,
-1.844139, 0.1634379, 1.091099, 1, 0.1137255, 0, 1,
-1.843093, -0.4060118, -2.027227, 1, 0.1215686, 0, 1,
-1.834011, 1.628736, -1.156334, 1, 0.1254902, 0, 1,
-1.83327, 1.365668, -0.3315008, 1, 0.1333333, 0, 1,
-1.828975, 0.1367354, -1.120347, 1, 0.1372549, 0, 1,
-1.820617, 0.5961437, -0.01358523, 1, 0.145098, 0, 1,
-1.807263, 2.0974, 0.3718354, 1, 0.1490196, 0, 1,
-1.799905, 0.04655801, -3.424803, 1, 0.1568628, 0, 1,
-1.783557, 2.324225, -1.013265, 1, 0.1607843, 0, 1,
-1.782479, -0.5629668, -2.13256, 1, 0.1686275, 0, 1,
-1.748727, 1.650242, -0.1597971, 1, 0.172549, 0, 1,
-1.741689, -1.702221, -1.640432, 1, 0.1803922, 0, 1,
-1.733539, -2.59025, -1.656767, 1, 0.1843137, 0, 1,
-1.728839, 0.297674, -0.7947605, 1, 0.1921569, 0, 1,
-1.726011, 1.114594, -1.41381, 1, 0.1960784, 0, 1,
-1.68958, -1.430401, -4.163429, 1, 0.2039216, 0, 1,
-1.688804, 0.4463727, -0.1417341, 1, 0.2117647, 0, 1,
-1.656396, 0.5958608, -1.605293, 1, 0.2156863, 0, 1,
-1.648838, -0.6488954, -2.350816, 1, 0.2235294, 0, 1,
-1.626922, 0.4174633, -0.6922937, 1, 0.227451, 0, 1,
-1.598403, 0.2452935, -1.042163, 1, 0.2352941, 0, 1,
-1.590084, 0.4436956, -1.241012, 1, 0.2392157, 0, 1,
-1.574121, 1.672253, -1.349172, 1, 0.2470588, 0, 1,
-1.568661, -0.04860834, -1.360885, 1, 0.2509804, 0, 1,
-1.528728, -0.8823327, -1.700783, 1, 0.2588235, 0, 1,
-1.521924, -1.557563, -2.52857, 1, 0.2627451, 0, 1,
-1.518235, 0.7927147, -1.346876, 1, 0.2705882, 0, 1,
-1.51458, -2.16447, -4.048375, 1, 0.2745098, 0, 1,
-1.513376, -1.328274, -1.952686, 1, 0.282353, 0, 1,
-1.499367, 0.4272888, -1.612208, 1, 0.2862745, 0, 1,
-1.484719, 0.4003569, -1.797199, 1, 0.2941177, 0, 1,
-1.477775, -0.4247588, -0.4463772, 1, 0.3019608, 0, 1,
-1.468126, 1.464216, -0.839412, 1, 0.3058824, 0, 1,
-1.462693, -1.170464, -2.62143, 1, 0.3137255, 0, 1,
-1.445422, 0.3916951, 0.3436663, 1, 0.3176471, 0, 1,
-1.443107, -0.2226577, -1.925716, 1, 0.3254902, 0, 1,
-1.433214, -1.12426, -1.780184, 1, 0.3294118, 0, 1,
-1.423481, 0.8768215, 1.947759, 1, 0.3372549, 0, 1,
-1.422543, 0.475382, -1.58511, 1, 0.3411765, 0, 1,
-1.417201, -1.503541, -2.080322, 1, 0.3490196, 0, 1,
-1.412237, 1.400693, 0.8857453, 1, 0.3529412, 0, 1,
-1.412234, -1.264981, -1.224108, 1, 0.3607843, 0, 1,
-1.410422, -0.1244655, -0.5842355, 1, 0.3647059, 0, 1,
-1.409991, 0.9283217, 0.7455425, 1, 0.372549, 0, 1,
-1.399735, 0.222309, -1.020569, 1, 0.3764706, 0, 1,
-1.391043, -0.8043242, -0.9971598, 1, 0.3843137, 0, 1,
-1.390446, 1.689398, -0.9865642, 1, 0.3882353, 0, 1,
-1.377515, -0.8060153, -0.9047772, 1, 0.3960784, 0, 1,
-1.372617, 1.083595, -1.166057, 1, 0.4039216, 0, 1,
-1.35607, 0.8696865, 0.2779683, 1, 0.4078431, 0, 1,
-1.354878, 0.6807418, -1.371675, 1, 0.4156863, 0, 1,
-1.348814, 0.25949, -2.433417, 1, 0.4196078, 0, 1,
-1.345719, -0.3184454, -2.19068, 1, 0.427451, 0, 1,
-1.33913, -0.3722517, -1.756016, 1, 0.4313726, 0, 1,
-1.329274, -0.5049888, -1.005803, 1, 0.4392157, 0, 1,
-1.328551, -1.942486, -3.460682, 1, 0.4431373, 0, 1,
-1.32054, -1.562014, -2.123465, 1, 0.4509804, 0, 1,
-1.320209, 0.3306813, -2.174251, 1, 0.454902, 0, 1,
-1.314666, -0.3446597, -0.9836152, 1, 0.4627451, 0, 1,
-1.308969, -1.43633, -1.922877, 1, 0.4666667, 0, 1,
-1.294633, -1.896134, -2.025662, 1, 0.4745098, 0, 1,
-1.283258, -1.281618, -2.826043, 1, 0.4784314, 0, 1,
-1.280653, -1.977715, -2.675909, 1, 0.4862745, 0, 1,
-1.268772, -0.1001138, -2.596547, 1, 0.4901961, 0, 1,
-1.267883, 1.226425, -0.7135765, 1, 0.4980392, 0, 1,
-1.258106, -1.368734, -1.691477, 1, 0.5058824, 0, 1,
-1.256669, 0.6028881, -1.497311, 1, 0.509804, 0, 1,
-1.254427, 0.5912381, 0.00413652, 1, 0.5176471, 0, 1,
-1.239939, -0.1412097, 0.6814845, 1, 0.5215687, 0, 1,
-1.237518, 0.05800007, -2.625924, 1, 0.5294118, 0, 1,
-1.234534, 0.5540766, -0.667611, 1, 0.5333334, 0, 1,
-1.231167, -0.507276, -0.6754189, 1, 0.5411765, 0, 1,
-1.225036, -0.5297031, -0.3464656, 1, 0.5450981, 0, 1,
-1.221672, 0.1727819, -2.204112, 1, 0.5529412, 0, 1,
-1.216944, -0.04331569, -2.023917, 1, 0.5568628, 0, 1,
-1.216439, -1.350573, -2.56408, 1, 0.5647059, 0, 1,
-1.216204, -0.6367271, -3.176259, 1, 0.5686275, 0, 1,
-1.214319, -0.003660945, -1.620966, 1, 0.5764706, 0, 1,
-1.21402, 0.2313878, -1.312604, 1, 0.5803922, 0, 1,
-1.21023, -0.0102141, -0.481382, 1, 0.5882353, 0, 1,
-1.19798, -0.3110131, -0.7804618, 1, 0.5921569, 0, 1,
-1.196204, -0.4354306, -1.263704, 1, 0.6, 0, 1,
-1.187998, -0.6485609, -0.9885556, 1, 0.6078432, 0, 1,
-1.182589, -1.188436, -1.873819, 1, 0.6117647, 0, 1,
-1.176646, -0.3463893, -0.7827675, 1, 0.6196079, 0, 1,
-1.176426, 0.07084797, -1.913171, 1, 0.6235294, 0, 1,
-1.16507, 0.7501002, 0.5858916, 1, 0.6313726, 0, 1,
-1.164492, 0.763595, -0.3246342, 1, 0.6352941, 0, 1,
-1.163342, -0.2572484, -0.8691165, 1, 0.6431373, 0, 1,
-1.149219, -0.8481877, -2.345906, 1, 0.6470588, 0, 1,
-1.139169, -0.5323787, -3.152417, 1, 0.654902, 0, 1,
-1.134646, -1.025104, -2.335801, 1, 0.6588235, 0, 1,
-1.124848, 0.309229, -0.3282801, 1, 0.6666667, 0, 1,
-1.119448, 0.8788692, -0.2727537, 1, 0.6705883, 0, 1,
-1.112231, 1.533582, -0.320874, 1, 0.6784314, 0, 1,
-1.104729, -1.094092, -0.8364869, 1, 0.682353, 0, 1,
-1.098505, -0.09066635, -3.280495, 1, 0.6901961, 0, 1,
-1.091395, 0.5396552, -1.059714, 1, 0.6941177, 0, 1,
-1.088368, -0.3918164, -4.352285, 1, 0.7019608, 0, 1,
-1.087186, 0.1612913, -2.130983, 1, 0.7098039, 0, 1,
-1.085596, 0.05691854, -2.333268, 1, 0.7137255, 0, 1,
-1.084572, 0.4150769, -0.3079935, 1, 0.7215686, 0, 1,
-1.083382, -0.02206329, -0.5079502, 1, 0.7254902, 0, 1,
-1.078362, 0.5133392, -1.300277, 1, 0.7333333, 0, 1,
-1.078308, 0.4978056, -1.184584, 1, 0.7372549, 0, 1,
-1.076807, -1.547634, -2.701657, 1, 0.7450981, 0, 1,
-1.071459, 0.2567837, -0.06364754, 1, 0.7490196, 0, 1,
-1.069654, 2.165874, 0.3381507, 1, 0.7568628, 0, 1,
-1.066925, 1.36425, -1.904916, 1, 0.7607843, 0, 1,
-1.060403, -0.7861198, -2.104565, 1, 0.7686275, 0, 1,
-1.060392, 1.514234, -1.387736, 1, 0.772549, 0, 1,
-1.0575, 1.422703, 0.07443603, 1, 0.7803922, 0, 1,
-1.055309, 0.7263087, -0.9434094, 1, 0.7843137, 0, 1,
-1.052576, 0.7873668, -1.037002, 1, 0.7921569, 0, 1,
-1.045059, 0.1548305, -2.560863, 1, 0.7960784, 0, 1,
-1.041711, 1.462906, 0.3395568, 1, 0.8039216, 0, 1,
-1.028596, 0.9621409, -1.824596, 1, 0.8117647, 0, 1,
-1.028391, -0.3282456, -1.989965, 1, 0.8156863, 0, 1,
-1.023131, -0.9991698, -3.050305, 1, 0.8235294, 0, 1,
-1.02228, -1.462015, -2.357966, 1, 0.827451, 0, 1,
-1.018443, 0.5346881, -1.758453, 1, 0.8352941, 0, 1,
-1.016715, -1.566716, -3.097136, 1, 0.8392157, 0, 1,
-1.012542, 0.3042368, -1.241682, 1, 0.8470588, 0, 1,
-1.012157, 0.3539925, -2.984672, 1, 0.8509804, 0, 1,
-0.9913058, -2.064764, -1.768566, 1, 0.8588235, 0, 1,
-0.9906404, 0.1524203, -1.137442, 1, 0.8627451, 0, 1,
-0.989669, 0.426259, -0.7376458, 1, 0.8705882, 0, 1,
-0.9876959, 2.18252, -0.6065956, 1, 0.8745098, 0, 1,
-0.9845505, 0.4749401, -0.9582074, 1, 0.8823529, 0, 1,
-0.9801455, 1.696214, -1.157963, 1, 0.8862745, 0, 1,
-0.9794179, 0.2484761, -1.416128, 1, 0.8941177, 0, 1,
-0.9788336, 2.039289, 0.3926244, 1, 0.8980392, 0, 1,
-0.9787235, -1.757794, -3.314865, 1, 0.9058824, 0, 1,
-0.9587706, 0.7126676, -2.039115, 1, 0.9137255, 0, 1,
-0.9564788, -0.9297726, -2.56556, 1, 0.9176471, 0, 1,
-0.9513201, 0.6716662, 0.6227711, 1, 0.9254902, 0, 1,
-0.9436746, -1.851508, -2.78782, 1, 0.9294118, 0, 1,
-0.9420927, -0.1818001, -2.933691, 1, 0.9372549, 0, 1,
-0.9407535, -0.5949792, -3.208293, 1, 0.9411765, 0, 1,
-0.9406433, 0.5930985, 0.1275746, 1, 0.9490196, 0, 1,
-0.9355099, 3.40886, 0.155197, 1, 0.9529412, 0, 1,
-0.9298139, -1.021012, -2.133312, 1, 0.9607843, 0, 1,
-0.9257572, -0.5643936, -3.239866, 1, 0.9647059, 0, 1,
-0.9214891, 0.4859885, -0.4299403, 1, 0.972549, 0, 1,
-0.9207692, 0.2707286, -1.694079, 1, 0.9764706, 0, 1,
-0.918772, 0.2367439, -1.733417, 1, 0.9843137, 0, 1,
-0.9154029, -0.5606204, -1.24797, 1, 0.9882353, 0, 1,
-0.9089682, 0.3850742, -1.595853, 1, 0.9960784, 0, 1,
-0.9069179, -1.251781, -3.78408, 0.9960784, 1, 0, 1,
-0.906545, -0.1410448, -1.509103, 0.9921569, 1, 0, 1,
-0.9064198, -1.724892, -2.823817, 0.9843137, 1, 0, 1,
-0.9024689, 0.3855239, -3.106768, 0.9803922, 1, 0, 1,
-0.9006752, -1.294397, -3.004245, 0.972549, 1, 0, 1,
-0.8987514, 0.5959673, -1.191941, 0.9686275, 1, 0, 1,
-0.8927553, 0.6237261, -0.8518391, 0.9607843, 1, 0, 1,
-0.8884696, -0.8989792, -2.416776, 0.9568627, 1, 0, 1,
-0.8880141, 1.382365, -0.1111821, 0.9490196, 1, 0, 1,
-0.8877445, 1.26409, -0.1725039, 0.945098, 1, 0, 1,
-0.8866481, -0.2038584, -2.938951, 0.9372549, 1, 0, 1,
-0.8842514, -0.738245, -1.063729, 0.9333333, 1, 0, 1,
-0.8832284, -1.974559, -1.924464, 0.9254902, 1, 0, 1,
-0.8809656, 0.5621405, -1.872119, 0.9215686, 1, 0, 1,
-0.8726756, -1.16827, -2.839184, 0.9137255, 1, 0, 1,
-0.8726391, 0.3130227, 0.5885765, 0.9098039, 1, 0, 1,
-0.8725665, 1.023785, 1.552351, 0.9019608, 1, 0, 1,
-0.8644735, 1.710927, 0.172123, 0.8941177, 1, 0, 1,
-0.8643374, -0.7257304, -1.921221, 0.8901961, 1, 0, 1,
-0.8633099, -0.2380718, -1.464527, 0.8823529, 1, 0, 1,
-0.8575931, -0.9578024, -2.289775, 0.8784314, 1, 0, 1,
-0.855333, 1.017468, -1.296313, 0.8705882, 1, 0, 1,
-0.8521375, -1.64778, -2.416132, 0.8666667, 1, 0, 1,
-0.8513654, -1.421027, -1.918966, 0.8588235, 1, 0, 1,
-0.8426024, -0.04386426, -2.249751, 0.854902, 1, 0, 1,
-0.8422436, -1.071003, -1.143521, 0.8470588, 1, 0, 1,
-0.8403053, -0.6272346, -1.182672, 0.8431373, 1, 0, 1,
-0.8350119, 0.9381623, -0.7563837, 0.8352941, 1, 0, 1,
-0.834879, 1.200163, 0.8346233, 0.8313726, 1, 0, 1,
-0.8337166, -0.8185303, -1.788943, 0.8235294, 1, 0, 1,
-0.8302681, -0.2458489, -2.760825, 0.8196079, 1, 0, 1,
-0.8271298, 1.001406, -1.249064, 0.8117647, 1, 0, 1,
-0.8262106, 0.7194472, -1.511133, 0.8078431, 1, 0, 1,
-0.8248507, -1.272577, -2.898004, 0.8, 1, 0, 1,
-0.8231068, -0.3570128, -1.253788, 0.7921569, 1, 0, 1,
-0.8215949, 0.03984626, -0.8431582, 0.7882353, 1, 0, 1,
-0.820759, -0.1677963, -0.6485338, 0.7803922, 1, 0, 1,
-0.8169751, 1.461043, 0.0903779, 0.7764706, 1, 0, 1,
-0.8145936, -0.877596, -2.869173, 0.7686275, 1, 0, 1,
-0.8133496, 0.5608896, -1.820312, 0.7647059, 1, 0, 1,
-0.8121513, 0.00934254, -2.093351, 0.7568628, 1, 0, 1,
-0.8099399, 1.803038, -3.614058, 0.7529412, 1, 0, 1,
-0.805464, 0.1049539, -3.343856, 0.7450981, 1, 0, 1,
-0.8035423, -0.4338991, -1.778907, 0.7411765, 1, 0, 1,
-0.8029598, 0.8999776, -0.01603294, 0.7333333, 1, 0, 1,
-0.8027899, -0.1732576, -1.273601, 0.7294118, 1, 0, 1,
-0.8004279, -0.211399, -2.166962, 0.7215686, 1, 0, 1,
-0.7953182, -0.28723, 0.1201631, 0.7176471, 1, 0, 1,
-0.7920408, -0.4420266, -2.965986, 0.7098039, 1, 0, 1,
-0.7902364, 1.03906, 1.233689, 0.7058824, 1, 0, 1,
-0.7881696, 0.6764916, -0.8179873, 0.6980392, 1, 0, 1,
-0.7877734, -1.065944, -0.2041385, 0.6901961, 1, 0, 1,
-0.7818069, 0.8637234, 0.1689611, 0.6862745, 1, 0, 1,
-0.7752592, -0.07890598, -1.668413, 0.6784314, 1, 0, 1,
-0.774491, -0.7182764, -2.146891, 0.6745098, 1, 0, 1,
-0.7654337, 0.5129872, -1.327843, 0.6666667, 1, 0, 1,
-0.7603127, -1.932805, -1.562119, 0.6627451, 1, 0, 1,
-0.7593511, 1.073722, -1.200363, 0.654902, 1, 0, 1,
-0.7570705, 0.07651638, -3.298582, 0.6509804, 1, 0, 1,
-0.74927, 0.4201843, -2.24305, 0.6431373, 1, 0, 1,
-0.7491843, -0.7467563, -3.047306, 0.6392157, 1, 0, 1,
-0.74017, 0.3093259, -1.331898, 0.6313726, 1, 0, 1,
-0.7401208, 0.5841414, 0.7816579, 0.627451, 1, 0, 1,
-0.7366744, -1.481423, -2.189113, 0.6196079, 1, 0, 1,
-0.736385, 0.7851691, -2.152725, 0.6156863, 1, 0, 1,
-0.7307799, 3.533229, 1.259094, 0.6078432, 1, 0, 1,
-0.7270635, -0.4527944, -2.130249, 0.6039216, 1, 0, 1,
-0.7269108, 1.141788, 0.6755937, 0.5960785, 1, 0, 1,
-0.7200063, 0.3506565, 1.351034, 0.5882353, 1, 0, 1,
-0.7167816, -0.7434714, -2.19251, 0.5843138, 1, 0, 1,
-0.7164105, 2.15902, -0.2259842, 0.5764706, 1, 0, 1,
-0.7100542, -1.634894, -3.401376, 0.572549, 1, 0, 1,
-0.7090072, 2.108875, -0.4335938, 0.5647059, 1, 0, 1,
-0.7049674, -0.2014075, -1.17024, 0.5607843, 1, 0, 1,
-0.7044865, 0.1780209, -2.68931, 0.5529412, 1, 0, 1,
-0.7009668, 0.8168284, -0.7727993, 0.5490196, 1, 0, 1,
-0.7008044, -0.6470625, -2.726824, 0.5411765, 1, 0, 1,
-0.7000768, -1.279847, -3.502224, 0.5372549, 1, 0, 1,
-0.6997081, 0.1713974, -1.328681, 0.5294118, 1, 0, 1,
-0.6975479, -0.2287267, -1.701045, 0.5254902, 1, 0, 1,
-0.6964107, 0.1642057, -1.740424, 0.5176471, 1, 0, 1,
-0.6963681, -0.4225385, -2.476508, 0.5137255, 1, 0, 1,
-0.6961274, -1.360473, -2.661562, 0.5058824, 1, 0, 1,
-0.6945601, -0.970056, -2.332306, 0.5019608, 1, 0, 1,
-0.690892, 0.183565, -2.523176, 0.4941176, 1, 0, 1,
-0.6889306, -1.272515, -2.15349, 0.4862745, 1, 0, 1,
-0.6848516, -1.088323, -1.664171, 0.4823529, 1, 0, 1,
-0.679245, -1.892068, -3.872504, 0.4745098, 1, 0, 1,
-0.6765033, 1.497083, 0.9368628, 0.4705882, 1, 0, 1,
-0.6748955, 0.0132355, -0.6870614, 0.4627451, 1, 0, 1,
-0.6729885, 0.7169157, -1.758707, 0.4588235, 1, 0, 1,
-0.6712071, 1.269034, -2.431862, 0.4509804, 1, 0, 1,
-0.6701142, -0.1570124, -1.06834, 0.4470588, 1, 0, 1,
-0.6698607, -1.213566, -3.588452, 0.4392157, 1, 0, 1,
-0.6653373, 1.247666, 0.5345331, 0.4352941, 1, 0, 1,
-0.6567987, -0.2555161, -2.450649, 0.427451, 1, 0, 1,
-0.6557137, 0.3716005, 0.3949735, 0.4235294, 1, 0, 1,
-0.6513599, 0.3055846, -1.906164, 0.4156863, 1, 0, 1,
-0.6479758, 1.874824, -1.316304, 0.4117647, 1, 0, 1,
-0.6468077, 1.588814, -3.469354, 0.4039216, 1, 0, 1,
-0.645594, 0.4385777, -0.5856453, 0.3960784, 1, 0, 1,
-0.6444089, -0.3317488, -3.791064, 0.3921569, 1, 0, 1,
-0.6417187, 0.09274577, -1.40023, 0.3843137, 1, 0, 1,
-0.6411569, -0.2660711, -3.32113, 0.3803922, 1, 0, 1,
-0.6389406, -0.6647186, -1.280795, 0.372549, 1, 0, 1,
-0.6362044, 0.2966397, -1.839159, 0.3686275, 1, 0, 1,
-0.6276822, -1.234124, -0.87231, 0.3607843, 1, 0, 1,
-0.6252156, -0.2422496, -1.261111, 0.3568628, 1, 0, 1,
-0.6232247, -0.01179767, -3.568564, 0.3490196, 1, 0, 1,
-0.6175293, -0.17409, -2.245256, 0.345098, 1, 0, 1,
-0.6155334, -0.04973862, -1.44281, 0.3372549, 1, 0, 1,
-0.6103095, -0.4929815, -3.497697, 0.3333333, 1, 0, 1,
-0.6099592, 0.9083944, -1.762667, 0.3254902, 1, 0, 1,
-0.6059933, -2.265632, -3.698489, 0.3215686, 1, 0, 1,
-0.604407, 2.46033, -1.2839, 0.3137255, 1, 0, 1,
-0.6035984, -1.207583, -4.687008, 0.3098039, 1, 0, 1,
-0.5984648, -1.566889, -2.847624, 0.3019608, 1, 0, 1,
-0.5938843, -1.005312, -2.942307, 0.2941177, 1, 0, 1,
-0.5908492, 0.6247728, -1.468934, 0.2901961, 1, 0, 1,
-0.5873738, -1.477739, -3.626988, 0.282353, 1, 0, 1,
-0.5868987, -1.913934, -2.710104, 0.2784314, 1, 0, 1,
-0.5792426, 0.560639, -0.5314441, 0.2705882, 1, 0, 1,
-0.5754657, 0.5497067, 0.4405141, 0.2666667, 1, 0, 1,
-0.5751536, -0.9214895, -2.135816, 0.2588235, 1, 0, 1,
-0.5748281, -1.169296, -2.899386, 0.254902, 1, 0, 1,
-0.5733721, 0.1986384, -1.721227, 0.2470588, 1, 0, 1,
-0.5700068, -0.6284606, -1.704698, 0.2431373, 1, 0, 1,
-0.5667802, 1.398769, -0.1914638, 0.2352941, 1, 0, 1,
-0.565841, 0.2431113, -2.500825, 0.2313726, 1, 0, 1,
-0.5638849, 0.9126607, -0.8326505, 0.2235294, 1, 0, 1,
-0.561326, 0.5511855, -0.457429, 0.2196078, 1, 0, 1,
-0.5597546, -0.4783198, -0.9877857, 0.2117647, 1, 0, 1,
-0.5455253, 0.3964757, -0.6075032, 0.2078431, 1, 0, 1,
-0.5421091, 0.715527, 0.7460662, 0.2, 1, 0, 1,
-0.5405699, -0.292646, -0.3813884, 0.1921569, 1, 0, 1,
-0.5401521, -0.003372438, -2.087158, 0.1882353, 1, 0, 1,
-0.538559, -1.342131, -3.56311, 0.1803922, 1, 0, 1,
-0.5271355, -0.2289677, -2.265418, 0.1764706, 1, 0, 1,
-0.5266499, 1.444011, -1.006631, 0.1686275, 1, 0, 1,
-0.5253898, 0.3714762, -0.4291107, 0.1647059, 1, 0, 1,
-0.5211431, -0.8831477, -2.433781, 0.1568628, 1, 0, 1,
-0.5210509, -1.119562, -2.086245, 0.1529412, 1, 0, 1,
-0.5172536, -0.396559, -3.991923, 0.145098, 1, 0, 1,
-0.5164258, 0.7478122, -0.1765437, 0.1411765, 1, 0, 1,
-0.5157216, -0.8763163, -3.352073, 0.1333333, 1, 0, 1,
-0.5146592, -0.4475516, -2.760066, 0.1294118, 1, 0, 1,
-0.513704, 0.4483908, -0.3169875, 0.1215686, 1, 0, 1,
-0.5124859, -0.3098481, -3.123393, 0.1176471, 1, 0, 1,
-0.5071994, -0.7909151, -3.082856, 0.1098039, 1, 0, 1,
-0.5017129, -0.3536679, -1.308058, 0.1058824, 1, 0, 1,
-0.5015845, 0.6199358, -0.3612486, 0.09803922, 1, 0, 1,
-0.4975059, 1.181764, -1.042216, 0.09019608, 1, 0, 1,
-0.4963819, 0.5612261, 0.0237039, 0.08627451, 1, 0, 1,
-0.4961817, 1.522333, -0.7087992, 0.07843138, 1, 0, 1,
-0.4918363, -0.3240564, -2.030723, 0.07450981, 1, 0, 1,
-0.489795, -1.154018, -3.064579, 0.06666667, 1, 0, 1,
-0.4820907, 0.0501132, -0.158376, 0.0627451, 1, 0, 1,
-0.4812045, -0.6726788, -2.435744, 0.05490196, 1, 0, 1,
-0.4753451, -0.6742319, -3.187904, 0.05098039, 1, 0, 1,
-0.4739267, 0.1623565, -1.004832, 0.04313726, 1, 0, 1,
-0.4708487, -0.7596121, -0.1679285, 0.03921569, 1, 0, 1,
-0.4673852, 2.055964, 0.9155712, 0.03137255, 1, 0, 1,
-0.4664055, -0.9320244, -1.006853, 0.02745098, 1, 0, 1,
-0.4651223, 0.8427761, -1.256624, 0.01960784, 1, 0, 1,
-0.4645983, -0.7667947, -3.960513, 0.01568628, 1, 0, 1,
-0.4633785, -1.359864, -2.896307, 0.007843138, 1, 0, 1,
-0.4617061, -0.5326416, -1.890142, 0.003921569, 1, 0, 1,
-0.4595663, 0.06926163, -1.810209, 0, 1, 0.003921569, 1,
-0.4557396, -0.6417186, -1.828731, 0, 1, 0.01176471, 1,
-0.4553109, 2.089085, 0.07080863, 0, 1, 0.01568628, 1,
-0.4549357, -0.4802473, -1.405384, 0, 1, 0.02352941, 1,
-0.4501167, 1.294047, -1.184546, 0, 1, 0.02745098, 1,
-0.4456742, -2.262636, -3.714357, 0, 1, 0.03529412, 1,
-0.4411142, -0.4356434, -3.214178, 0, 1, 0.03921569, 1,
-0.4390664, -0.1971224, -3.438777, 0, 1, 0.04705882, 1,
-0.4370784, -0.1715696, -1.96856, 0, 1, 0.05098039, 1,
-0.4343761, -0.2129107, -2.378807, 0, 1, 0.05882353, 1,
-0.4300407, 0.2250216, -0.09740035, 0, 1, 0.0627451, 1,
-0.4300177, -1.399499, -3.219269, 0, 1, 0.07058824, 1,
-0.4299664, 0.2110717, -3.208837, 0, 1, 0.07450981, 1,
-0.4280553, -1.532914, -4.022602, 0, 1, 0.08235294, 1,
-0.4260148, 1.896876, -1.224173, 0, 1, 0.08627451, 1,
-0.4146854, -0.1981304, -1.016609, 0, 1, 0.09411765, 1,
-0.414079, -1.617641, -4.621398, 0, 1, 0.1019608, 1,
-0.4129842, 0.8263859, 1.390985, 0, 1, 0.1058824, 1,
-0.4089146, 1.083336, 0.08304825, 0, 1, 0.1137255, 1,
-0.4068957, 2.189972, -0.4281039, 0, 1, 0.1176471, 1,
-0.4015019, -0.6766667, -0.6233482, 0, 1, 0.1254902, 1,
-0.3999965, 0.5347471, -0.4600161, 0, 1, 0.1294118, 1,
-0.3977154, -1.139487, -1.848159, 0, 1, 0.1372549, 1,
-0.3960775, 0.9136554, -1.954847, 0, 1, 0.1411765, 1,
-0.3916667, 2.027041, -0.7571499, 0, 1, 0.1490196, 1,
-0.3907456, 0.09495398, 0.2651953, 0, 1, 0.1529412, 1,
-0.3900939, 2.235485, -0.3544613, 0, 1, 0.1607843, 1,
-0.3864516, 0.3033755, -1.394488, 0, 1, 0.1647059, 1,
-0.3854174, 0.5415671, -2.040932, 0, 1, 0.172549, 1,
-0.384024, 0.05038973, -0.3308066, 0, 1, 0.1764706, 1,
-0.3806848, 1.928655, 0.5775908, 0, 1, 0.1843137, 1,
-0.3732076, -0.850415, -1.349391, 0, 1, 0.1882353, 1,
-0.3687174, -0.008432854, -0.2725631, 0, 1, 0.1960784, 1,
-0.3678927, -0.7010726, -3.224267, 0, 1, 0.2039216, 1,
-0.3673457, -1.881307, -2.369997, 0, 1, 0.2078431, 1,
-0.365024, 0.4545011, -1.34719, 0, 1, 0.2156863, 1,
-0.3607097, 1.531337, -1.300238, 0, 1, 0.2196078, 1,
-0.356487, -1.283038, -3.363997, 0, 1, 0.227451, 1,
-0.3535798, -0.8812071, -2.946331, 0, 1, 0.2313726, 1,
-0.349847, -0.07512359, -2.957353, 0, 1, 0.2392157, 1,
-0.3471664, -2.287986, -3.106466, 0, 1, 0.2431373, 1,
-0.345312, -0.7907899, -3.740191, 0, 1, 0.2509804, 1,
-0.3428794, -0.3100237, -2.202434, 0, 1, 0.254902, 1,
-0.3428279, 0.680185, 0.1296073, 0, 1, 0.2627451, 1,
-0.3391176, 1.069065, -0.636835, 0, 1, 0.2666667, 1,
-0.3376444, -0.4312751, -2.362429, 0, 1, 0.2745098, 1,
-0.3339153, 0.06987204, -0.569685, 0, 1, 0.2784314, 1,
-0.3219075, 1.701818, -1.007996, 0, 1, 0.2862745, 1,
-0.3153929, 0.03044958, -2.651084, 0, 1, 0.2901961, 1,
-0.314895, -0.186727, -2.657266, 0, 1, 0.2980392, 1,
-0.3144517, 0.05130421, -1.886584, 0, 1, 0.3058824, 1,
-0.3135226, 2.18187, -1.426674, 0, 1, 0.3098039, 1,
-0.3122907, 0.7830203, 0.770696, 0, 1, 0.3176471, 1,
-0.30663, 0.07993338, -0.8056518, 0, 1, 0.3215686, 1,
-0.2919744, 1.229356, -0.8426405, 0, 1, 0.3294118, 1,
-0.2914787, 0.4968791, -0.3682552, 0, 1, 0.3333333, 1,
-0.291376, -0.7353242, -2.133663, 0, 1, 0.3411765, 1,
-0.2901032, 0.3273231, -0.001094902, 0, 1, 0.345098, 1,
-0.2894258, -0.2728296, -1.237946, 0, 1, 0.3529412, 1,
-0.2889126, -0.6790948, -2.709879, 0, 1, 0.3568628, 1,
-0.2888365, -1.316916, -3.816045, 0, 1, 0.3647059, 1,
-0.2887597, 0.7157427, 0.4243563, 0, 1, 0.3686275, 1,
-0.28703, -0.1116984, -1.113695, 0, 1, 0.3764706, 1,
-0.2853035, -2.221879, -5.269181, 0, 1, 0.3803922, 1,
-0.2836846, 0.6191816, -0.3176953, 0, 1, 0.3882353, 1,
-0.2822148, -0.1260669, -2.140011, 0, 1, 0.3921569, 1,
-0.2812867, 0.5877674, -1.063882, 0, 1, 0.4, 1,
-0.270121, -0.842048, -3.830903, 0, 1, 0.4078431, 1,
-0.2656856, 0.05458746, -2.06818, 0, 1, 0.4117647, 1,
-0.2655436, -1.121988, -1.569118, 0, 1, 0.4196078, 1,
-0.2622075, 0.5028138, -0.9206414, 0, 1, 0.4235294, 1,
-0.2589324, -0.06351608, -1.628569, 0, 1, 0.4313726, 1,
-0.2543519, 0.4852753, 1.259632, 0, 1, 0.4352941, 1,
-0.2522374, -1.684286, -2.795753, 0, 1, 0.4431373, 1,
-0.2515497, -0.7958027, -0.8442306, 0, 1, 0.4470588, 1,
-0.249962, 0.1235482, -3.212265, 0, 1, 0.454902, 1,
-0.2411232, -0.4037818, -2.524259, 0, 1, 0.4588235, 1,
-0.2380611, 1.697372, 0.01032696, 0, 1, 0.4666667, 1,
-0.2368076, 0.4883827, -0.04843386, 0, 1, 0.4705882, 1,
-0.2354764, 1.139681, 0.7044539, 0, 1, 0.4784314, 1,
-0.2350106, 0.3947558, -2.751836, 0, 1, 0.4823529, 1,
-0.23229, 1.118623, -1.446251, 0, 1, 0.4901961, 1,
-0.2298852, -0.6713783, -2.759302, 0, 1, 0.4941176, 1,
-0.2236307, 0.08156985, 0.03156897, 0, 1, 0.5019608, 1,
-0.2092545, 0.1176751, -0.721406, 0, 1, 0.509804, 1,
-0.2038435, -0.06347312, -1.457234, 0, 1, 0.5137255, 1,
-0.203148, 0.6098322, -0.1641139, 0, 1, 0.5215687, 1,
-0.2025088, 0.1240362, 0.6638405, 0, 1, 0.5254902, 1,
-0.2022278, -0.6593462, -2.358801, 0, 1, 0.5333334, 1,
-0.201664, 0.6228914, 0.2031892, 0, 1, 0.5372549, 1,
-0.2005108, 1.281622, -0.2796076, 0, 1, 0.5450981, 1,
-0.2003804, 0.009005424, 0.1159343, 0, 1, 0.5490196, 1,
-0.1911498, -2.382588, -3.010273, 0, 1, 0.5568628, 1,
-0.1877285, 0.9447883, 0.3423177, 0, 1, 0.5607843, 1,
-0.1873858, 0.03154001, -1.617384, 0, 1, 0.5686275, 1,
-0.1855367, 0.6548159, -0.5212379, 0, 1, 0.572549, 1,
-0.1848345, 0.674226, -0.9034873, 0, 1, 0.5803922, 1,
-0.1845114, 0.1603205, -0.6489557, 0, 1, 0.5843138, 1,
-0.1832511, 0.4917969, 0.2263092, 0, 1, 0.5921569, 1,
-0.1825937, -0.1199864, -1.741751, 0, 1, 0.5960785, 1,
-0.1811519, 1.007302, 0.4234248, 0, 1, 0.6039216, 1,
-0.1805687, 1.913899, -0.2362656, 0, 1, 0.6117647, 1,
-0.1783091, -0.9261695, -3.707236, 0, 1, 0.6156863, 1,
-0.1781337, -0.6840214, -3.056903, 0, 1, 0.6235294, 1,
-0.1757899, -0.8608028, -1.72587, 0, 1, 0.627451, 1,
-0.1738354, 0.9583213, 2.667686, 0, 1, 0.6352941, 1,
-0.1734234, 1.79063, 0.9046648, 0, 1, 0.6392157, 1,
-0.1724966, -0.2458269, -3.023333, 0, 1, 0.6470588, 1,
-0.1622008, -0.9366218, -3.020412, 0, 1, 0.6509804, 1,
-0.1616021, -0.5053345, -2.980346, 0, 1, 0.6588235, 1,
-0.1602544, -0.4051573, -1.357679, 0, 1, 0.6627451, 1,
-0.1599638, -0.685826, -2.049154, 0, 1, 0.6705883, 1,
-0.1592572, -1.334234, -4.200396, 0, 1, 0.6745098, 1,
-0.1540583, 0.03241669, -0.7367882, 0, 1, 0.682353, 1,
-0.1491749, -0.4504616, -2.225197, 0, 1, 0.6862745, 1,
-0.1472612, 0.1229738, -2.494285, 0, 1, 0.6941177, 1,
-0.146576, -0.6127527, -3.710949, 0, 1, 0.7019608, 1,
-0.1446345, -0.09563972, -1.630979, 0, 1, 0.7058824, 1,
-0.1421045, 0.4688759, -0.3782916, 0, 1, 0.7137255, 1,
-0.1364156, 0.5674383, -0.5285421, 0, 1, 0.7176471, 1,
-0.135429, -0.1828851, -1.854396, 0, 1, 0.7254902, 1,
-0.1328057, 1.33221, 0.7322196, 0, 1, 0.7294118, 1,
-0.1299623, 0.5200595, -0.5496136, 0, 1, 0.7372549, 1,
-0.1286694, -1.71995, -2.136812, 0, 1, 0.7411765, 1,
-0.1247061, 0.1836733, -1.97899, 0, 1, 0.7490196, 1,
-0.122334, -1.170288, -3.948028, 0, 1, 0.7529412, 1,
-0.1222008, 1.469064, -1.857231, 0, 1, 0.7607843, 1,
-0.1151679, 1.787356, -1.254509, 0, 1, 0.7647059, 1,
-0.1147408, 0.1348341, -0.07105783, 0, 1, 0.772549, 1,
-0.1115955, 0.6911618, -0.6960645, 0, 1, 0.7764706, 1,
-0.1091754, -0.5441403, -2.742222, 0, 1, 0.7843137, 1,
-0.1087487, -0.4864739, -2.434019, 0, 1, 0.7882353, 1,
-0.1075553, -1.63364, -3.8997, 0, 1, 0.7960784, 1,
-0.104688, -0.3927642, -2.925168, 0, 1, 0.8039216, 1,
-0.1012739, -0.995653, -2.781587, 0, 1, 0.8078431, 1,
-0.1012156, -0.487244, -3.380722, 0, 1, 0.8156863, 1,
-0.1010514, -1.578732, -2.641513, 0, 1, 0.8196079, 1,
-0.09745055, 0.1942865, -0.7785751, 0, 1, 0.827451, 1,
-0.09072971, 0.08670566, -0.5171752, 0, 1, 0.8313726, 1,
-0.0874377, -0.8318876, -3.121403, 0, 1, 0.8392157, 1,
-0.08709737, -1.200522, -1.527777, 0, 1, 0.8431373, 1,
-0.07911152, 0.2943542, -1.886446, 0, 1, 0.8509804, 1,
-0.07575184, -0.7724037, -3.215188, 0, 1, 0.854902, 1,
-0.0708088, 0.5782709, 0.8960601, 0, 1, 0.8627451, 1,
-0.07054608, -0.6748554, -3.100759, 0, 1, 0.8666667, 1,
-0.07020392, -0.2349083, -5.078216, 0, 1, 0.8745098, 1,
-0.0692523, -0.5765937, -2.592599, 0, 1, 0.8784314, 1,
-0.06913404, -0.3625658, -2.617888, 0, 1, 0.8862745, 1,
-0.05982918, -1.033951, -3.977991, 0, 1, 0.8901961, 1,
-0.05808385, 0.1813933, 0.1840093, 0, 1, 0.8980392, 1,
-0.05688755, 0.5331123, -1.502258, 0, 1, 0.9058824, 1,
-0.05410621, 1.356202, 1.070216, 0, 1, 0.9098039, 1,
-0.05261129, -0.5041661, -1.409784, 0, 1, 0.9176471, 1,
-0.05226558, 0.9722184, 0.4184443, 0, 1, 0.9215686, 1,
-0.0497959, 1.446922, -1.937727, 0, 1, 0.9294118, 1,
-0.04406104, -0.2137706, -1.788468, 0, 1, 0.9333333, 1,
-0.04028653, 1.071556, 1.097856, 0, 1, 0.9411765, 1,
-0.03090313, 1.526855, 0.4599029, 0, 1, 0.945098, 1,
-0.02723673, 1.130122, -0.2925398, 0, 1, 0.9529412, 1,
-0.02570578, 0.9982004, 0.1485437, 0, 1, 0.9568627, 1,
-0.02564424, -1.819602, -1.905142, 0, 1, 0.9647059, 1,
-0.02505708, 1.918099, 0.889458, 0, 1, 0.9686275, 1,
-0.0215177, 0.05648223, -1.103126, 0, 1, 0.9764706, 1,
-0.02144098, -1.677143, -3.313528, 0, 1, 0.9803922, 1,
-0.01761125, -0.02560728, -2.272491, 0, 1, 0.9882353, 1,
-0.009693325, 1.141094, -0.5592697, 0, 1, 0.9921569, 1,
-0.00443293, 1.080296, -0.687222, 0, 1, 1, 1,
-0.002534815, -0.9161507, -3.601957, 0, 0.9921569, 1, 1,
-0.002232238, -0.3542437, -3.437197, 0, 0.9882353, 1, 1,
0.003366672, -0.7656147, 2.587895, 0, 0.9803922, 1, 1,
0.006154774, 1.357567, -0.4461712, 0, 0.9764706, 1, 1,
0.006758441, -1.033532, 4.961763, 0, 0.9686275, 1, 1,
0.007444658, -0.2896808, 3.374423, 0, 0.9647059, 1, 1,
0.01020103, -2.08518, 3.606314, 0, 0.9568627, 1, 1,
0.01361148, -2.258714, 3.716048, 0, 0.9529412, 1, 1,
0.01422503, -0.2243827, 2.211593, 0, 0.945098, 1, 1,
0.01982387, -1.069464, 2.616985, 0, 0.9411765, 1, 1,
0.02008372, -0.02024751, 3.065495, 0, 0.9333333, 1, 1,
0.02403888, -0.1655214, 3.718, 0, 0.9294118, 1, 1,
0.04068014, -1.014393, 4.773835, 0, 0.9215686, 1, 1,
0.04439314, -0.2891032, 3.560882, 0, 0.9176471, 1, 1,
0.05048191, -0.6047759, 2.563483, 0, 0.9098039, 1, 1,
0.05190013, -0.2073935, 3.923228, 0, 0.9058824, 1, 1,
0.05318575, 1.694952, 0.3130031, 0, 0.8980392, 1, 1,
0.06473732, -0.1354006, 2.856793, 0, 0.8901961, 1, 1,
0.06637962, 2.001287, -0.6498721, 0, 0.8862745, 1, 1,
0.06982952, 0.1535881, -0.4499563, 0, 0.8784314, 1, 1,
0.07001754, 1.178958, -0.5554503, 0, 0.8745098, 1, 1,
0.07286283, -1.29687, 3.815952, 0, 0.8666667, 1, 1,
0.07298774, -1.2278, 2.09587, 0, 0.8627451, 1, 1,
0.07585999, 0.06650542, 0.479656, 0, 0.854902, 1, 1,
0.07696062, -0.8288381, 2.695673, 0, 0.8509804, 1, 1,
0.08167021, 0.9379371, 0.3300249, 0, 0.8431373, 1, 1,
0.08215231, 0.9472643, 2.166734, 0, 0.8392157, 1, 1,
0.08725371, -0.4769199, 1.81748, 0, 0.8313726, 1, 1,
0.08865532, -2.248099, 2.240572, 0, 0.827451, 1, 1,
0.08933827, -0.07873358, 2.254287, 0, 0.8196079, 1, 1,
0.0945425, 0.8618922, 2.147908, 0, 0.8156863, 1, 1,
0.1021516, 0.7530243, 1.693724, 0, 0.8078431, 1, 1,
0.1045723, -0.4744943, 1.859461, 0, 0.8039216, 1, 1,
0.1064095, -0.9067039, 1.631152, 0, 0.7960784, 1, 1,
0.1093165, 0.5223915, -0.3772998, 0, 0.7882353, 1, 1,
0.111089, -0.1601214, 2.203148, 0, 0.7843137, 1, 1,
0.1122721, -0.05107073, 2.253807, 0, 0.7764706, 1, 1,
0.1147031, 1.474405, -0.05648946, 0, 0.772549, 1, 1,
0.1190712, 0.8563392, -0.9728802, 0, 0.7647059, 1, 1,
0.1226174, 0.5091904, -0.0601837, 0, 0.7607843, 1, 1,
0.1254048, -0.3035388, 3.764535, 0, 0.7529412, 1, 1,
0.130248, -1.527503, 4.959146, 0, 0.7490196, 1, 1,
0.1313894, -0.2169783, 3.476596, 0, 0.7411765, 1, 1,
0.1316364, 0.6913587, -0.5525317, 0, 0.7372549, 1, 1,
0.1317733, 1.245816, -0.7930808, 0, 0.7294118, 1, 1,
0.1334355, 1.30766, -0.6861327, 0, 0.7254902, 1, 1,
0.1355349, 0.4365949, 0.1029336, 0, 0.7176471, 1, 1,
0.13587, 0.3464629, 0.6521047, 0, 0.7137255, 1, 1,
0.1414728, 0.1434271, -0.5089008, 0, 0.7058824, 1, 1,
0.1428962, -2.258856, 3.720269, 0, 0.6980392, 1, 1,
0.1456132, -0.1972416, 1.989008, 0, 0.6941177, 1, 1,
0.1466896, -1.904895, 2.438243, 0, 0.6862745, 1, 1,
0.1500424, -1.312231, 2.426804, 0, 0.682353, 1, 1,
0.1505178, 0.5338458, -0.3530415, 0, 0.6745098, 1, 1,
0.1531188, 1.615675, -0.8892639, 0, 0.6705883, 1, 1,
0.1538929, 1.516027, 0.3806117, 0, 0.6627451, 1, 1,
0.1542849, 0.1707426, 1.850847, 0, 0.6588235, 1, 1,
0.1619627, 1.2273, -0.7185603, 0, 0.6509804, 1, 1,
0.1622958, 0.7330554, -0.02491513, 0, 0.6470588, 1, 1,
0.1624803, -0.1918669, 1.34189, 0, 0.6392157, 1, 1,
0.1634491, 1.088869, 1.364851, 0, 0.6352941, 1, 1,
0.1640141, 1.437366, 0.2830161, 0, 0.627451, 1, 1,
0.1654055, -0.8024885, 1.224681, 0, 0.6235294, 1, 1,
0.1673606, 0.4705886, 1.409575, 0, 0.6156863, 1, 1,
0.1708583, -0.9794645, 4.828788, 0, 0.6117647, 1, 1,
0.1709732, -1.548407, 4.185308, 0, 0.6039216, 1, 1,
0.1710546, 0.2626843, 0.5976292, 0, 0.5960785, 1, 1,
0.1839075, 0.6541519, 1.817138, 0, 0.5921569, 1, 1,
0.1859399, 1.428955, 0.5966572, 0, 0.5843138, 1, 1,
0.1900122, -0.3695764, 1.358864, 0, 0.5803922, 1, 1,
0.192272, 0.2997878, 2.133222, 0, 0.572549, 1, 1,
0.1945858, 0.5160483, -0.7391807, 0, 0.5686275, 1, 1,
0.1967367, -1.332885, 3.269189, 0, 0.5607843, 1, 1,
0.1988252, 0.5975094, 1.501155, 0, 0.5568628, 1, 1,
0.1997012, -0.3634149, 3.250008, 0, 0.5490196, 1, 1,
0.1997557, 1.029, -0.2353869, 0, 0.5450981, 1, 1,
0.2023978, -0.3533867, 3.17122, 0, 0.5372549, 1, 1,
0.2100269, -0.3835302, 2.252121, 0, 0.5333334, 1, 1,
0.2143677, 0.5435621, -0.6610457, 0, 0.5254902, 1, 1,
0.2176891, 1.881331, -0.9134042, 0, 0.5215687, 1, 1,
0.2238824, 0.4436346, 1.033363, 0, 0.5137255, 1, 1,
0.2239244, 0.01938488, 0.02716063, 0, 0.509804, 1, 1,
0.2245137, -2.064443, 1.069017, 0, 0.5019608, 1, 1,
0.2248551, -0.06661581, 1.052707, 0, 0.4941176, 1, 1,
0.2291836, 0.5250057, 0.02301264, 0, 0.4901961, 1, 1,
0.2299443, -0.9322122, 3.848574, 0, 0.4823529, 1, 1,
0.2302565, -0.4855809, 1.636599, 0, 0.4784314, 1, 1,
0.2304365, 1.064313, -1.751884, 0, 0.4705882, 1, 1,
0.2308542, -0.15001, 3.377144, 0, 0.4666667, 1, 1,
0.2364136, 0.9870457, 0.6639364, 0, 0.4588235, 1, 1,
0.2401714, -1.023245, 3.663489, 0, 0.454902, 1, 1,
0.2405514, -0.8795023, 4.363287, 0, 0.4470588, 1, 1,
0.2436481, 0.6748381, 2.320247, 0, 0.4431373, 1, 1,
0.2454632, 0.2557931, -0.6310621, 0, 0.4352941, 1, 1,
0.2475197, 1.030747, 1.11452, 0, 0.4313726, 1, 1,
0.2528167, 0.01133437, 2.455628, 0, 0.4235294, 1, 1,
0.2528791, 0.5436558, 0.4851351, 0, 0.4196078, 1, 1,
0.254179, 0.1823869, 0.5638898, 0, 0.4117647, 1, 1,
0.254461, -0.01315797, 1.623332, 0, 0.4078431, 1, 1,
0.2564043, 1.491058, -1.135545, 0, 0.4, 1, 1,
0.256787, -0.464034, 2.292974, 0, 0.3921569, 1, 1,
0.2620356, 0.05078421, 1.921126, 0, 0.3882353, 1, 1,
0.2626353, 0.1250204, 3.306638, 0, 0.3803922, 1, 1,
0.2660426, -1.313522, 3.442071, 0, 0.3764706, 1, 1,
0.2673962, 0.1333189, 2.695418, 0, 0.3686275, 1, 1,
0.2683366, 0.1768404, 0.3820602, 0, 0.3647059, 1, 1,
0.2683818, -1.482491, 1.713069, 0, 0.3568628, 1, 1,
0.2688754, -0.6987327, 2.07181, 0, 0.3529412, 1, 1,
0.2762204, -0.2190627, 1.913649, 0, 0.345098, 1, 1,
0.284286, -0.423592, 3.099154, 0, 0.3411765, 1, 1,
0.2860344, -0.1338303, 2.03584, 0, 0.3333333, 1, 1,
0.2862746, -0.7035922, 3.470566, 0, 0.3294118, 1, 1,
0.2867685, 0.6791337, 0.02010724, 0, 0.3215686, 1, 1,
0.2886813, 1.798537, -1.976935, 0, 0.3176471, 1, 1,
0.2895487, 0.2805395, -0.9867811, 0, 0.3098039, 1, 1,
0.2908729, -0.05894734, 1.713582, 0, 0.3058824, 1, 1,
0.2953483, 0.2064261, -0.09294734, 0, 0.2980392, 1, 1,
0.2965942, -0.3263846, 2.478553, 0, 0.2901961, 1, 1,
0.3003711, -0.9262912, 3.720834, 0, 0.2862745, 1, 1,
0.3013507, -0.8291723, 2.645235, 0, 0.2784314, 1, 1,
0.3015191, -2.013976, 1.698241, 0, 0.2745098, 1, 1,
0.3038288, -0.4176556, 3.077527, 0, 0.2666667, 1, 1,
0.3039646, -0.1910975, 2.558064, 0, 0.2627451, 1, 1,
0.3084401, -1.926155, 2.955591, 0, 0.254902, 1, 1,
0.3087483, -0.4010162, 3.139914, 0, 0.2509804, 1, 1,
0.3131053, 0.5083725, 1.668598, 0, 0.2431373, 1, 1,
0.3163886, -0.3579378, 4.052379, 0, 0.2392157, 1, 1,
0.3258083, -1.274654, 2.606287, 0, 0.2313726, 1, 1,
0.3263212, 0.2133638, 2.781402, 0, 0.227451, 1, 1,
0.3287147, -1.976623, 2.653659, 0, 0.2196078, 1, 1,
0.329044, 0.3111346, 0.07379951, 0, 0.2156863, 1, 1,
0.3293651, 0.558071, 0.9628409, 0, 0.2078431, 1, 1,
0.3307454, 1.288417, -0.2446754, 0, 0.2039216, 1, 1,
0.333725, -1.500154, 0.7700691, 0, 0.1960784, 1, 1,
0.3349755, -0.2795394, 2.051389, 0, 0.1882353, 1, 1,
0.3405246, -0.8457612, 2.440103, 0, 0.1843137, 1, 1,
0.3433116, 0.8544978, 0.7132135, 0, 0.1764706, 1, 1,
0.3449033, -0.2235, 2.072586, 0, 0.172549, 1, 1,
0.3465862, -1.185789, 2.256405, 0, 0.1647059, 1, 1,
0.3490129, -0.3168117, 2.933721, 0, 0.1607843, 1, 1,
0.3499011, -0.4251525, 1.590953, 0, 0.1529412, 1, 1,
0.3512828, -0.1119733, 1.827322, 0, 0.1490196, 1, 1,
0.3520923, -0.5964068, 1.288192, 0, 0.1411765, 1, 1,
0.3527253, 1.221862, 1.347366, 0, 0.1372549, 1, 1,
0.3535865, 1.277601, -0.5699578, 0, 0.1294118, 1, 1,
0.3547821, -0.3742681, 0.3933886, 0, 0.1254902, 1, 1,
0.3584115, 1.175334, 0.4812922, 0, 0.1176471, 1, 1,
0.3588701, -0.9356584, 3.592262, 0, 0.1137255, 1, 1,
0.3622929, 0.9501783, 1.058447, 0, 0.1058824, 1, 1,
0.3644429, -1.827231, 2.64767, 0, 0.09803922, 1, 1,
0.3655831, 0.7459894, 0.9083365, 0, 0.09411765, 1, 1,
0.3676493, -0.2488329, 3.316381, 0, 0.08627451, 1, 1,
0.3715324, -0.9194315, 1.954098, 0, 0.08235294, 1, 1,
0.3722288, 0.8557307, 2.392874, 0, 0.07450981, 1, 1,
0.3722655, 0.3993466, 1.125468, 0, 0.07058824, 1, 1,
0.3755727, 0.8958326, -0.5456938, 0, 0.0627451, 1, 1,
0.3760991, -0.1372447, 3.301682, 0, 0.05882353, 1, 1,
0.3810687, -0.973754, 3.340673, 0, 0.05098039, 1, 1,
0.3836938, 1.277925, -1.246694, 0, 0.04705882, 1, 1,
0.3850439, 0.3698286, 1.23745, 0, 0.03921569, 1, 1,
0.3860283, 0.8338972, -0.3606177, 0, 0.03529412, 1, 1,
0.3861693, -0.2270486, 0.6141327, 0, 0.02745098, 1, 1,
0.391246, -0.1108433, 2.724899, 0, 0.02352941, 1, 1,
0.3992505, -0.9405153, 1.753831, 0, 0.01568628, 1, 1,
0.4043905, 1.593896, 0.5353851, 0, 0.01176471, 1, 1,
0.4055885, -1.338383, 3.575407, 0, 0.003921569, 1, 1,
0.407872, 1.48988, 0.03332927, 0.003921569, 0, 1, 1,
0.4080532, -1.033881, 2.044759, 0.007843138, 0, 1, 1,
0.40973, -0.1753247, 1.291204, 0.01568628, 0, 1, 1,
0.4151796, -2.713027, 1.609905, 0.01960784, 0, 1, 1,
0.4153848, -0.6139078, 1.873924, 0.02745098, 0, 1, 1,
0.4176163, -0.04240925, 1.022092, 0.03137255, 0, 1, 1,
0.4260665, -1.723425, 2.5173, 0.03921569, 0, 1, 1,
0.4282065, 0.3224967, 0.1778982, 0.04313726, 0, 1, 1,
0.432115, -0.1065328, 3.204866, 0.05098039, 0, 1, 1,
0.4354814, -1.873334, 1.794603, 0.05490196, 0, 1, 1,
0.4367192, -1.796427, 0.770469, 0.0627451, 0, 1, 1,
0.4380339, 0.3488954, 1.694863, 0.06666667, 0, 1, 1,
0.438552, 1.895325, -1.254264, 0.07450981, 0, 1, 1,
0.4434905, 0.1053681, 0.541742, 0.07843138, 0, 1, 1,
0.4457914, 0.1877511, 2.645344, 0.08627451, 0, 1, 1,
0.4476438, -1.277836, 2.169019, 0.09019608, 0, 1, 1,
0.4502841, -0.8803313, 4.548455, 0.09803922, 0, 1, 1,
0.4512981, 0.2821883, 0.8720223, 0.1058824, 0, 1, 1,
0.4520551, 0.1821496, 1.054536, 0.1098039, 0, 1, 1,
0.4527169, -0.3044265, 1.900873, 0.1176471, 0, 1, 1,
0.456218, 0.1647475, 1.060719, 0.1215686, 0, 1, 1,
0.4564832, -0.9086289, 3.928605, 0.1294118, 0, 1, 1,
0.4588101, 0.1220684, 0.17536, 0.1333333, 0, 1, 1,
0.4596101, 0.1389179, 2.098666, 0.1411765, 0, 1, 1,
0.4698811, -1.229825, 3.452462, 0.145098, 0, 1, 1,
0.4711249, -0.3076297, 2.955126, 0.1529412, 0, 1, 1,
0.4741643, 0.5405864, 1.140895, 0.1568628, 0, 1, 1,
0.477828, 0.4758824, -0.1724073, 0.1647059, 0, 1, 1,
0.4859722, 1.540501, 0.7090937, 0.1686275, 0, 1, 1,
0.4897534, 1.551503, 0.7441152, 0.1764706, 0, 1, 1,
0.489968, 0.2601736, 0.4951242, 0.1803922, 0, 1, 1,
0.491388, -0.6071305, 3.081406, 0.1882353, 0, 1, 1,
0.4933336, 1.492638, 1.266254, 0.1921569, 0, 1, 1,
0.4987143, -1.309715, 4.674842, 0.2, 0, 1, 1,
0.5005205, -1.03904, 2.366102, 0.2078431, 0, 1, 1,
0.5013946, 0.474232, -0.2055101, 0.2117647, 0, 1, 1,
0.5030558, -0.0624252, 0.9788601, 0.2196078, 0, 1, 1,
0.5061643, -1.824663, 1.875983, 0.2235294, 0, 1, 1,
0.5072689, -1.285845, 2.798982, 0.2313726, 0, 1, 1,
0.5177772, 0.02283942, 2.700682, 0.2352941, 0, 1, 1,
0.5208162, 0.2900956, -0.4898698, 0.2431373, 0, 1, 1,
0.5219283, 0.8025582, 0.3870842, 0.2470588, 0, 1, 1,
0.5340168, 0.03385173, 1.437774, 0.254902, 0, 1, 1,
0.5357859, 0.1754487, 2.390507, 0.2588235, 0, 1, 1,
0.5499725, 1.183574, 1.495067, 0.2666667, 0, 1, 1,
0.5511037, -0.1278915, 2.650591, 0.2705882, 0, 1, 1,
0.5546336, 0.3620303, 1.821116, 0.2784314, 0, 1, 1,
0.5559263, 0.2954128, 1.729842, 0.282353, 0, 1, 1,
0.5563357, -0.9075597, 2.603587, 0.2901961, 0, 1, 1,
0.5570914, 1.363791, 0.5639734, 0.2941177, 0, 1, 1,
0.5618577, 1.213448, 1.454051, 0.3019608, 0, 1, 1,
0.5705682, -1.991035, 2.786747, 0.3098039, 0, 1, 1,
0.5712735, -0.3184055, 2.165591, 0.3137255, 0, 1, 1,
0.5743964, -0.3105225, 1.411386, 0.3215686, 0, 1, 1,
0.5771163, -0.1308658, 1.794138, 0.3254902, 0, 1, 1,
0.5772656, -0.1304469, 2.49105, 0.3333333, 0, 1, 1,
0.5888338, 0.1910353, -0.1657043, 0.3372549, 0, 1, 1,
0.5905353, 1.325665, 1.636264, 0.345098, 0, 1, 1,
0.5910176, -0.8680847, 1.477734, 0.3490196, 0, 1, 1,
0.5952296, 0.3025459, -0.8775873, 0.3568628, 0, 1, 1,
0.5953532, -0.2935654, 0.2083051, 0.3607843, 0, 1, 1,
0.595748, -1.250272, 3.681661, 0.3686275, 0, 1, 1,
0.5959982, 0.1910436, 0.3767116, 0.372549, 0, 1, 1,
0.5975543, -0.9028836, 4.466817, 0.3803922, 0, 1, 1,
0.6039762, 0.4001555, -0.3736508, 0.3843137, 0, 1, 1,
0.6065745, 0.9977681, -0.9088072, 0.3921569, 0, 1, 1,
0.616672, -0.5493473, 1.907233, 0.3960784, 0, 1, 1,
0.6238036, -0.1719925, 2.85818, 0.4039216, 0, 1, 1,
0.625334, -2.136418, 3.123186, 0.4117647, 0, 1, 1,
0.6259843, 0.3601844, 0.01832048, 0.4156863, 0, 1, 1,
0.6266801, 0.3064438, 1.959023, 0.4235294, 0, 1, 1,
0.6290178, 0.1921467, 2.682305, 0.427451, 0, 1, 1,
0.6303825, -0.6418411, 2.285197, 0.4352941, 0, 1, 1,
0.632063, 0.6735122, 0.5637498, 0.4392157, 0, 1, 1,
0.6353462, 1.362015, -1.348967, 0.4470588, 0, 1, 1,
0.639348, -0.8339579, 3.548371, 0.4509804, 0, 1, 1,
0.6401528, 1.802466, -0.9560342, 0.4588235, 0, 1, 1,
0.6403845, -0.2902149, 1.810526, 0.4627451, 0, 1, 1,
0.6428961, -0.06033667, 3.099496, 0.4705882, 0, 1, 1,
0.6449972, -0.7935222, 3.465052, 0.4745098, 0, 1, 1,
0.6466923, 0.705992, 0.1937373, 0.4823529, 0, 1, 1,
0.6493195, -1.141859, 3.068245, 0.4862745, 0, 1, 1,
0.6497725, 0.3904095, 0.420913, 0.4941176, 0, 1, 1,
0.6520635, 0.50753, 0.9620966, 0.5019608, 0, 1, 1,
0.6529067, -1.771366, 4.304887, 0.5058824, 0, 1, 1,
0.6562096, 0.260687, 0.4725122, 0.5137255, 0, 1, 1,
0.6584277, -0.1728811, 0.1595563, 0.5176471, 0, 1, 1,
0.6675197, -2.1385, 5.226735, 0.5254902, 0, 1, 1,
0.6717195, 1.348918, -0.6561467, 0.5294118, 0, 1, 1,
0.6723703, 0.7284755, 3.662707, 0.5372549, 0, 1, 1,
0.6803986, 1.313159, 0.7804432, 0.5411765, 0, 1, 1,
0.6855889, -0.95492, 2.864161, 0.5490196, 0, 1, 1,
0.6891601, -0.2016405, 0.8200503, 0.5529412, 0, 1, 1,
0.692042, 0.4954079, -0.05088241, 0.5607843, 0, 1, 1,
0.6944714, -0.8271174, 2.763222, 0.5647059, 0, 1, 1,
0.6953881, 0.8340157, 2.915953, 0.572549, 0, 1, 1,
0.6970105, -1.75178, 3.807787, 0.5764706, 0, 1, 1,
0.6984934, -1.51598, 4.164728, 0.5843138, 0, 1, 1,
0.6987152, 0.7013654, 0.5332341, 0.5882353, 0, 1, 1,
0.7007644, 0.4154808, 0.3988259, 0.5960785, 0, 1, 1,
0.7047752, 0.9070534, -0.5222635, 0.6039216, 0, 1, 1,
0.7092305, 0.753989, 0.4098997, 0.6078432, 0, 1, 1,
0.7129625, -0.02958553, 3.918432, 0.6156863, 0, 1, 1,
0.7145444, -2.148967, 3.415276, 0.6196079, 0, 1, 1,
0.7213995, 0.1202111, -0.5633139, 0.627451, 0, 1, 1,
0.7236275, -0.3896015, 3.293401, 0.6313726, 0, 1, 1,
0.7293144, 0.06969025, 1.229516, 0.6392157, 0, 1, 1,
0.7310239, 0.09061552, 1.865118, 0.6431373, 0, 1, 1,
0.7343844, -0.06730928, 2.407369, 0.6509804, 0, 1, 1,
0.7357534, -3.323467, 1.969852, 0.654902, 0, 1, 1,
0.7362683, -0.09592292, 1.604493, 0.6627451, 0, 1, 1,
0.7424853, -0.5098059, 2.390446, 0.6666667, 0, 1, 1,
0.7535848, -0.5632406, 3.219698, 0.6745098, 0, 1, 1,
0.7548735, 0.1101476, 1.478453, 0.6784314, 0, 1, 1,
0.7568862, 0.351848, 0.6797032, 0.6862745, 0, 1, 1,
0.7577648, 0.6235588, 0.4468475, 0.6901961, 0, 1, 1,
0.7628324, 0.2950695, 2.194836, 0.6980392, 0, 1, 1,
0.764153, -0.03664904, 1.310551, 0.7058824, 0, 1, 1,
0.7652701, -1.161678, 2.2399, 0.7098039, 0, 1, 1,
0.7669669, -0.6002883, 3.043503, 0.7176471, 0, 1, 1,
0.7761274, 0.9032699, 0.06789795, 0.7215686, 0, 1, 1,
0.7774909, 0.5851815, 0.0928054, 0.7294118, 0, 1, 1,
0.7812014, 0.5443417, 1.608229, 0.7333333, 0, 1, 1,
0.7824486, 1.165597, 2.640938, 0.7411765, 0, 1, 1,
0.7869538, 1.435555, -2.246841, 0.7450981, 0, 1, 1,
0.7905367, 1.726223, -0.1992076, 0.7529412, 0, 1, 1,
0.7946846, -0.7347422, 1.649355, 0.7568628, 0, 1, 1,
0.7972009, -0.7434157, 2.566266, 0.7647059, 0, 1, 1,
0.8006396, 0.0239116, 4.174727, 0.7686275, 0, 1, 1,
0.8045114, 0.08645456, 0.8564922, 0.7764706, 0, 1, 1,
0.8054423, -0.1906791, 0.1757818, 0.7803922, 0, 1, 1,
0.8083908, -0.6636386, 3.693675, 0.7882353, 0, 1, 1,
0.8124056, -0.6169783, 2.435389, 0.7921569, 0, 1, 1,
0.8133532, -0.1005199, 0.9237798, 0.8, 0, 1, 1,
0.8143842, -0.1551061, 3.025296, 0.8078431, 0, 1, 1,
0.8157768, 0.7207887, 1.839239, 0.8117647, 0, 1, 1,
0.816539, -0.4195293, 2.30435, 0.8196079, 0, 1, 1,
0.8221333, -0.3507141, 0.2940406, 0.8235294, 0, 1, 1,
0.8253793, 1.587127, 1.59499, 0.8313726, 0, 1, 1,
0.8264658, -0.8873652, 4.253945, 0.8352941, 0, 1, 1,
0.827362, -0.6251, 2.455811, 0.8431373, 0, 1, 1,
0.8335108, -1.363822, 1.845958, 0.8470588, 0, 1, 1,
0.8344267, 0.06523569, 1.236871, 0.854902, 0, 1, 1,
0.8450271, 1.108208, 1.792906, 0.8588235, 0, 1, 1,
0.8460899, -0.02341173, 0.5128946, 0.8666667, 0, 1, 1,
0.847917, 0.1127134, 2.274666, 0.8705882, 0, 1, 1,
0.8575898, -1.480083, 3.446621, 0.8784314, 0, 1, 1,
0.8580539, -0.2884592, 1.257573, 0.8823529, 0, 1, 1,
0.8609492, -0.8209682, 3.393754, 0.8901961, 0, 1, 1,
0.8623701, -1.009843, 1.760902, 0.8941177, 0, 1, 1,
0.8661364, -0.6186836, 1.312698, 0.9019608, 0, 1, 1,
0.8666795, 1.576294, -0.1824325, 0.9098039, 0, 1, 1,
0.8676106, -0.7740591, 3.750163, 0.9137255, 0, 1, 1,
0.8681175, 0.03303688, -0.03002974, 0.9215686, 0, 1, 1,
0.8876656, -0.6977427, 1.763199, 0.9254902, 0, 1, 1,
0.8968657, -1.113254, 2.205757, 0.9333333, 0, 1, 1,
0.8978823, 0.4890709, 1.205063, 0.9372549, 0, 1, 1,
0.901934, -0.2898043, 2.310782, 0.945098, 0, 1, 1,
0.9025411, 0.9663519, 1.364517, 0.9490196, 0, 1, 1,
0.9026207, 0.6933869, 2.040897, 0.9568627, 0, 1, 1,
0.9027067, -1.174138, 2.658461, 0.9607843, 0, 1, 1,
0.9109343, 1.0165, 0.1890869, 0.9686275, 0, 1, 1,
0.9109855, -0.7053424, 1.861267, 0.972549, 0, 1, 1,
0.9371163, 1.464902, 0.4463199, 0.9803922, 0, 1, 1,
0.9405955, 1.183443, 0.5169252, 0.9843137, 0, 1, 1,
0.9782158, 0.8848327, 0.7138366, 0.9921569, 0, 1, 1,
0.9784618, 0.7082208, 1.324736, 0.9960784, 0, 1, 1,
0.9791172, 1.242167, 0.1447189, 1, 0, 0.9960784, 1,
0.9858107, 0.724964, 1.605118, 1, 0, 0.9882353, 1,
0.9932697, 0.08917894, 1.449675, 1, 0, 0.9843137, 1,
0.994167, 0.6845112, 0.72491, 1, 0, 0.9764706, 1,
0.9961047, -0.2566576, 1.257509, 1, 0, 0.972549, 1,
1.000044, 0.6833997, 0.5863816, 1, 0, 0.9647059, 1,
1.000531, 0.8762008, -0.3730825, 1, 0, 0.9607843, 1,
1.001192, 0.662639, 0.8192266, 1, 0, 0.9529412, 1,
1.00489, 0.5163813, 0.8292006, 1, 0, 0.9490196, 1,
1.00552, 0.2141831, -0.7861145, 1, 0, 0.9411765, 1,
1.00959, -1.367592, 2.594702, 1, 0, 0.9372549, 1,
1.012311, -0.3544209, 0.8664657, 1, 0, 0.9294118, 1,
1.016388, -2.060457, 1.456184, 1, 0, 0.9254902, 1,
1.019831, -1.372786, 1.862518, 1, 0, 0.9176471, 1,
1.024449, 0.5634797, 3.023571, 1, 0, 0.9137255, 1,
1.027396, 0.9369616, -0.2565131, 1, 0, 0.9058824, 1,
1.034338, -0.7661396, 2.610247, 1, 0, 0.9019608, 1,
1.035629, -0.7278467, 2.909116, 1, 0, 0.8941177, 1,
1.04628, -1.618834, -0.0617089, 1, 0, 0.8862745, 1,
1.048979, 0.3852515, 1.259651, 1, 0, 0.8823529, 1,
1.051213, -0.9722337, 2.8521, 1, 0, 0.8745098, 1,
1.072997, -0.8040877, 3.513402, 1, 0, 0.8705882, 1,
1.073765, 2.866295, -0.6402672, 1, 0, 0.8627451, 1,
1.078208, -0.5993668, 3.418131, 1, 0, 0.8588235, 1,
1.090697, 1.038819, 0.7413161, 1, 0, 0.8509804, 1,
1.091252, -1.741809, 4.290457, 1, 0, 0.8470588, 1,
1.092422, 0.6884957, 0.3101891, 1, 0, 0.8392157, 1,
1.10776, 1.253265, 1.14554, 1, 0, 0.8352941, 1,
1.116869, -0.3133989, 2.197401, 1, 0, 0.827451, 1,
1.118755, 0.6204027, 1.128266, 1, 0, 0.8235294, 1,
1.119885, 0.7606671, 1.150027, 1, 0, 0.8156863, 1,
1.12047, -0.1921662, 1.437804, 1, 0, 0.8117647, 1,
1.127687, 0.1305648, 0.8693497, 1, 0, 0.8039216, 1,
1.134276, -0.07497153, 3.00357, 1, 0, 0.7960784, 1,
1.141142, 1.704523, -0.3931381, 1, 0, 0.7921569, 1,
1.148184, -0.001760875, 2.219413, 1, 0, 0.7843137, 1,
1.148889, -0.2348758, 2.474982, 1, 0, 0.7803922, 1,
1.149995, -1.091222, 1.910953, 1, 0, 0.772549, 1,
1.156557, 0.9482059, 1.233334, 1, 0, 0.7686275, 1,
1.168517, -0.6151091, 3.086004, 1, 0, 0.7607843, 1,
1.180575, -0.2849773, 2.626268, 1, 0, 0.7568628, 1,
1.191506, -0.3066638, 2.352496, 1, 0, 0.7490196, 1,
1.192015, -0.5298116, 1.285371, 1, 0, 0.7450981, 1,
1.1996, 0.6444116, 0.8019184, 1, 0, 0.7372549, 1,
1.206978, 0.5426207, 0.1385354, 1, 0, 0.7333333, 1,
1.208854, 1.644401, -0.6669894, 1, 0, 0.7254902, 1,
1.210463, 0.8073856, 2.224204, 1, 0, 0.7215686, 1,
1.214537, 0.4176092, 0.1613623, 1, 0, 0.7137255, 1,
1.216795, -0.4315832, 0.843709, 1, 0, 0.7098039, 1,
1.217278, 1.183318, 1.791846, 1, 0, 0.7019608, 1,
1.217936, -0.03632788, 0.6159875, 1, 0, 0.6941177, 1,
1.233066, -0.3331363, 1.31471, 1, 0, 0.6901961, 1,
1.235431, -0.6918917, 2.682714, 1, 0, 0.682353, 1,
1.236051, 0.502717, 1.574988, 1, 0, 0.6784314, 1,
1.241942, -0.8607317, 1.487627, 1, 0, 0.6705883, 1,
1.246132, -0.5060528, 1.51002, 1, 0, 0.6666667, 1,
1.246516, -0.6097929, 1.870662, 1, 0, 0.6588235, 1,
1.247771, 0.3061662, 2.330644, 1, 0, 0.654902, 1,
1.252311, -1.047337, 2.992777, 1, 0, 0.6470588, 1,
1.27331, 1.448761, 2.089863, 1, 0, 0.6431373, 1,
1.275618, -0.93081, 2.832682, 1, 0, 0.6352941, 1,
1.278865, -0.3357794, 1.22422, 1, 0, 0.6313726, 1,
1.285849, 0.7034874, 1.473875, 1, 0, 0.6235294, 1,
1.287494, 0.8930822, 2.586572, 1, 0, 0.6196079, 1,
1.292518, 0.5468993, 0.2979439, 1, 0, 0.6117647, 1,
1.305672, -1.653052, 4.150219, 1, 0, 0.6078432, 1,
1.309316, 0.6291937, 1.021894, 1, 0, 0.6, 1,
1.314922, 0.4811465, 0.0454345, 1, 0, 0.5921569, 1,
1.31633, 0.5738041, -0.2160317, 1, 0, 0.5882353, 1,
1.319713, 0.5779755, 1.155438, 1, 0, 0.5803922, 1,
1.321546, -0.4473464, 4.286067, 1, 0, 0.5764706, 1,
1.324003, -0.2036231, 2.848263, 1, 0, 0.5686275, 1,
1.327371, 1.040477, 1.34156, 1, 0, 0.5647059, 1,
1.327425, -0.1474425, 3.191679, 1, 0, 0.5568628, 1,
1.328842, -1.642551, 0.6456475, 1, 0, 0.5529412, 1,
1.329836, -0.09587353, 0.4449532, 1, 0, 0.5450981, 1,
1.344391, 0.801791, -0.01896432, 1, 0, 0.5411765, 1,
1.351061, 0.9178509, 1.665668, 1, 0, 0.5333334, 1,
1.362386, -1.082551, 2.806317, 1, 0, 0.5294118, 1,
1.363272, -0.7544168, 1.350753, 1, 0, 0.5215687, 1,
1.36836, 2.757248, -0.06125949, 1, 0, 0.5176471, 1,
1.382805, 0.4824115, 0.3206472, 1, 0, 0.509804, 1,
1.399893, 0.6133012, 1.161664, 1, 0, 0.5058824, 1,
1.400047, -0.2839083, 2.215826, 1, 0, 0.4980392, 1,
1.40161, 0.3339198, -1.670418, 1, 0, 0.4901961, 1,
1.406523, 0.9251236, 0.5217638, 1, 0, 0.4862745, 1,
1.412013, -1.067504, 1.64694, 1, 0, 0.4784314, 1,
1.419132, 0.816348, 0.6258086, 1, 0, 0.4745098, 1,
1.424102, -2.219305, 1.550804, 1, 0, 0.4666667, 1,
1.426272, -0.218511, 2.183603, 1, 0, 0.4627451, 1,
1.429984, -1.816305, 1.371832, 1, 0, 0.454902, 1,
1.433469, 0.0005365625, 1.41064, 1, 0, 0.4509804, 1,
1.441288, 0.8482088, 0.9453338, 1, 0, 0.4431373, 1,
1.451512, 0.3982627, 0.0200605, 1, 0, 0.4392157, 1,
1.452083, 0.6707745, 0.4540258, 1, 0, 0.4313726, 1,
1.456547, -1.14079, 2.302857, 1, 0, 0.427451, 1,
1.4654, 1.444555, 0.9235112, 1, 0, 0.4196078, 1,
1.466296, 1.039405, 1.120721, 1, 0, 0.4156863, 1,
1.492595, -0.5173052, 2.655432, 1, 0, 0.4078431, 1,
1.500625, -1.299502, 1.258594, 1, 0, 0.4039216, 1,
1.501949, -0.7241528, 1.147954, 1, 0, 0.3960784, 1,
1.503737, -1.265084, 0.1513877, 1, 0, 0.3882353, 1,
1.508913, -0.9354954, 0.8025462, 1, 0, 0.3843137, 1,
1.51034, -0.8097973, 3.44603, 1, 0, 0.3764706, 1,
1.516761, 0.006425142, 1.398079, 1, 0, 0.372549, 1,
1.531913, 1.570261, 1.774169, 1, 0, 0.3647059, 1,
1.535272, 0.4809189, -0.2298034, 1, 0, 0.3607843, 1,
1.559436, 1.45959, -0.9469092, 1, 0, 0.3529412, 1,
1.563419, -1.820687, 2.684719, 1, 0, 0.3490196, 1,
1.576358, -0.5364518, 1.921053, 1, 0, 0.3411765, 1,
1.581618, -0.6128041, 1.588391, 1, 0, 0.3372549, 1,
1.600286, 1.683841, 1.113098, 1, 0, 0.3294118, 1,
1.604625, 0.5979982, 2.53001, 1, 0, 0.3254902, 1,
1.650838, -0.08044208, 1.877316, 1, 0, 0.3176471, 1,
1.652678, 1.57134, 2.861438, 1, 0, 0.3137255, 1,
1.661093, -2.035625, 3.313435, 1, 0, 0.3058824, 1,
1.67326, 1.219291, 0.148551, 1, 0, 0.2980392, 1,
1.67473, -1.37891, 0.5122511, 1, 0, 0.2941177, 1,
1.681808, -0.03188191, 1.795519, 1, 0, 0.2862745, 1,
1.685813, 0.2004735, 1.10682, 1, 0, 0.282353, 1,
1.720532, 0.6304007, -0.01203825, 1, 0, 0.2745098, 1,
1.727508, 1.113669, -1.156629, 1, 0, 0.2705882, 1,
1.740885, -0.1345077, 0.2979153, 1, 0, 0.2627451, 1,
1.744757, 0.6565304, 0.005519466, 1, 0, 0.2588235, 1,
1.746523, -2.543946, 3.759966, 1, 0, 0.2509804, 1,
1.749787, -0.2088376, 2.102272, 1, 0, 0.2470588, 1,
1.760451, -2.313384, 3.429345, 1, 0, 0.2392157, 1,
1.783671, -0.1398305, 0.3506961, 1, 0, 0.2352941, 1,
1.785877, 2.112881, 0.9891568, 1, 0, 0.227451, 1,
1.80661, 0.244686, 0.2676382, 1, 0, 0.2235294, 1,
1.809247, -0.2651123, 1.671364, 1, 0, 0.2156863, 1,
1.830728, 2.588605, 0.2575185, 1, 0, 0.2117647, 1,
1.843444, -0.775695, 1.858413, 1, 0, 0.2039216, 1,
1.859631, 1.269527, 0.8528658, 1, 0, 0.1960784, 1,
1.867556, 0.3342445, 1.049176, 1, 0, 0.1921569, 1,
1.872271, 1.265383, 1.622092, 1, 0, 0.1843137, 1,
1.873553, 0.8359947, 1.94141, 1, 0, 0.1803922, 1,
1.894917, 0.1129053, 2.146267, 1, 0, 0.172549, 1,
1.914366, -0.4398524, 1.968401, 1, 0, 0.1686275, 1,
1.939159, 0.04142066, 3.241333, 1, 0, 0.1607843, 1,
1.983621, 0.1409134, 1.024302, 1, 0, 0.1568628, 1,
1.989824, -0.9755324, 1.013801, 1, 0, 0.1490196, 1,
2.010837, -0.2778099, 1.217565, 1, 0, 0.145098, 1,
2.045758, -0.9297467, 4.192809, 1, 0, 0.1372549, 1,
2.051165, 1.013154, 1.503015, 1, 0, 0.1333333, 1,
2.051722, -0.6685257, 0.810798, 1, 0, 0.1254902, 1,
2.065874, 0.168427, 1.869472, 1, 0, 0.1215686, 1,
2.108059, 0.2367614, 1.219313, 1, 0, 0.1137255, 1,
2.114691, 0.07192373, 1.032683, 1, 0, 0.1098039, 1,
2.133006, 0.334798, 0.5952118, 1, 0, 0.1019608, 1,
2.152015, -0.9430574, 2.853013, 1, 0, 0.09411765, 1,
2.176775, 0.3046899, 0.7464619, 1, 0, 0.09019608, 1,
2.207281, 0.2491692, 1.810679, 1, 0, 0.08235294, 1,
2.223429, 0.780808, 1.656084, 1, 0, 0.07843138, 1,
2.347469, -1.265477, 0.5805073, 1, 0, 0.07058824, 1,
2.451927, -2.459575, 2.375092, 1, 0, 0.06666667, 1,
2.534588, -0.3176721, 3.623322, 1, 0, 0.05882353, 1,
2.663326, 1.091011, 2.506052, 1, 0, 0.05490196, 1,
2.680034, -0.3571236, 1.521245, 1, 0, 0.04705882, 1,
2.694133, 1.056499, 0.8715017, 1, 0, 0.04313726, 1,
2.707694, -0.2883652, 0.3140275, 1, 0, 0.03529412, 1,
2.863357, -0.6638831, 0.3925517, 1, 0, 0.03137255, 1,
3.021389, -1.056421, 1.240048, 1, 0, 0.02352941, 1,
3.063317, -0.1614669, 1.93487, 1, 0, 0.01960784, 1,
3.164305, 0.05465765, 0.8718765, 1, 0, 0.01176471, 1,
3.419501, 0.04262048, 0.02646029, 1, 0, 0.007843138, 1
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
0.3634731, -4.485678, -7.048238, 0, -0.5, 0.5, 0.5,
0.3634731, -4.485678, -7.048238, 1, -0.5, 0.5, 0.5,
0.3634731, -4.485678, -7.048238, 1, 1.5, 0.5, 0.5,
0.3634731, -4.485678, -7.048238, 0, 1.5, 0.5, 0.5
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
-3.728548, 0.1048807, -7.048238, 0, -0.5, 0.5, 0.5,
-3.728548, 0.1048807, -7.048238, 1, -0.5, 0.5, 0.5,
-3.728548, 0.1048807, -7.048238, 1, 1.5, 0.5, 0.5,
-3.728548, 0.1048807, -7.048238, 0, 1.5, 0.5, 0.5
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
-3.728548, -4.485678, -0.02122307, 0, -0.5, 0.5, 0.5,
-3.728548, -4.485678, -0.02122307, 1, -0.5, 0.5, 0.5,
-3.728548, -4.485678, -0.02122307, 1, 1.5, 0.5, 0.5,
-3.728548, -4.485678, -0.02122307, 0, 1.5, 0.5, 0.5
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
-2, -3.426318, -5.42662,
3, -3.426318, -5.42662,
-2, -3.426318, -5.42662,
-2, -3.602878, -5.696889,
-1, -3.426318, -5.42662,
-1, -3.602878, -5.696889,
0, -3.426318, -5.42662,
0, -3.602878, -5.696889,
1, -3.426318, -5.42662,
1, -3.602878, -5.696889,
2, -3.426318, -5.42662,
2, -3.602878, -5.696889,
3, -3.426318, -5.42662,
3, -3.602878, -5.696889
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
-2, -3.955998, -6.237429, 0, -0.5, 0.5, 0.5,
-2, -3.955998, -6.237429, 1, -0.5, 0.5, 0.5,
-2, -3.955998, -6.237429, 1, 1.5, 0.5, 0.5,
-2, -3.955998, -6.237429, 0, 1.5, 0.5, 0.5,
-1, -3.955998, -6.237429, 0, -0.5, 0.5, 0.5,
-1, -3.955998, -6.237429, 1, -0.5, 0.5, 0.5,
-1, -3.955998, -6.237429, 1, 1.5, 0.5, 0.5,
-1, -3.955998, -6.237429, 0, 1.5, 0.5, 0.5,
0, -3.955998, -6.237429, 0, -0.5, 0.5, 0.5,
0, -3.955998, -6.237429, 1, -0.5, 0.5, 0.5,
0, -3.955998, -6.237429, 1, 1.5, 0.5, 0.5,
0, -3.955998, -6.237429, 0, 1.5, 0.5, 0.5,
1, -3.955998, -6.237429, 0, -0.5, 0.5, 0.5,
1, -3.955998, -6.237429, 1, -0.5, 0.5, 0.5,
1, -3.955998, -6.237429, 1, 1.5, 0.5, 0.5,
1, -3.955998, -6.237429, 0, 1.5, 0.5, 0.5,
2, -3.955998, -6.237429, 0, -0.5, 0.5, 0.5,
2, -3.955998, -6.237429, 1, -0.5, 0.5, 0.5,
2, -3.955998, -6.237429, 1, 1.5, 0.5, 0.5,
2, -3.955998, -6.237429, 0, 1.5, 0.5, 0.5,
3, -3.955998, -6.237429, 0, -0.5, 0.5, 0.5,
3, -3.955998, -6.237429, 1, -0.5, 0.5, 0.5,
3, -3.955998, -6.237429, 1, 1.5, 0.5, 0.5,
3, -3.955998, -6.237429, 0, 1.5, 0.5, 0.5
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
-2.784235, -3, -5.42662,
-2.784235, 3, -5.42662,
-2.784235, -3, -5.42662,
-2.941621, -3, -5.696889,
-2.784235, -2, -5.42662,
-2.941621, -2, -5.696889,
-2.784235, -1, -5.42662,
-2.941621, -1, -5.696889,
-2.784235, 0, -5.42662,
-2.941621, 0, -5.696889,
-2.784235, 1, -5.42662,
-2.941621, 1, -5.696889,
-2.784235, 2, -5.42662,
-2.941621, 2, -5.696889,
-2.784235, 3, -5.42662,
-2.941621, 3, -5.696889
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
-3.256392, -3, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, -3, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, -3, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, -3, -6.237429, 0, 1.5, 0.5, 0.5,
-3.256392, -2, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, -2, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, -2, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, -2, -6.237429, 0, 1.5, 0.5, 0.5,
-3.256392, -1, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, -1, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, -1, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, -1, -6.237429, 0, 1.5, 0.5, 0.5,
-3.256392, 0, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, 0, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, 0, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, 0, -6.237429, 0, 1.5, 0.5, 0.5,
-3.256392, 1, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, 1, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, 1, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, 1, -6.237429, 0, 1.5, 0.5, 0.5,
-3.256392, 2, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, 2, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, 2, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, 2, -6.237429, 0, 1.5, 0.5, 0.5,
-3.256392, 3, -6.237429, 0, -0.5, 0.5, 0.5,
-3.256392, 3, -6.237429, 1, -0.5, 0.5, 0.5,
-3.256392, 3, -6.237429, 1, 1.5, 0.5, 0.5,
-3.256392, 3, -6.237429, 0, 1.5, 0.5, 0.5
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
-2.784235, -3.426318, -4,
-2.784235, -3.426318, 4,
-2.784235, -3.426318, -4,
-2.941621, -3.602878, -4,
-2.784235, -3.426318, -2,
-2.941621, -3.602878, -2,
-2.784235, -3.426318, 0,
-2.941621, -3.602878, 0,
-2.784235, -3.426318, 2,
-2.941621, -3.602878, 2,
-2.784235, -3.426318, 4,
-2.941621, -3.602878, 4
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
-3.256392, -3.955998, -4, 0, -0.5, 0.5, 0.5,
-3.256392, -3.955998, -4, 1, -0.5, 0.5, 0.5,
-3.256392, -3.955998, -4, 1, 1.5, 0.5, 0.5,
-3.256392, -3.955998, -4, 0, 1.5, 0.5, 0.5,
-3.256392, -3.955998, -2, 0, -0.5, 0.5, 0.5,
-3.256392, -3.955998, -2, 1, -0.5, 0.5, 0.5,
-3.256392, -3.955998, -2, 1, 1.5, 0.5, 0.5,
-3.256392, -3.955998, -2, 0, 1.5, 0.5, 0.5,
-3.256392, -3.955998, 0, 0, -0.5, 0.5, 0.5,
-3.256392, -3.955998, 0, 1, -0.5, 0.5, 0.5,
-3.256392, -3.955998, 0, 1, 1.5, 0.5, 0.5,
-3.256392, -3.955998, 0, 0, 1.5, 0.5, 0.5,
-3.256392, -3.955998, 2, 0, -0.5, 0.5, 0.5,
-3.256392, -3.955998, 2, 1, -0.5, 0.5, 0.5,
-3.256392, -3.955998, 2, 1, 1.5, 0.5, 0.5,
-3.256392, -3.955998, 2, 0, 1.5, 0.5, 0.5,
-3.256392, -3.955998, 4, 0, -0.5, 0.5, 0.5,
-3.256392, -3.955998, 4, 1, -0.5, 0.5, 0.5,
-3.256392, -3.955998, 4, 1, 1.5, 0.5, 0.5,
-3.256392, -3.955998, 4, 0, 1.5, 0.5, 0.5
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
-2.784235, -3.426318, -5.42662,
-2.784235, 3.636079, -5.42662,
-2.784235, -3.426318, 5.384173,
-2.784235, 3.636079, 5.384173,
-2.784235, -3.426318, -5.42662,
-2.784235, -3.426318, 5.384173,
-2.784235, 3.636079, -5.42662,
-2.784235, 3.636079, 5.384173,
-2.784235, -3.426318, -5.42662,
3.511181, -3.426318, -5.42662,
-2.784235, -3.426318, 5.384173,
3.511181, -3.426318, 5.384173,
-2.784235, 3.636079, -5.42662,
3.511181, 3.636079, -5.42662,
-2.784235, 3.636079, 5.384173,
3.511181, 3.636079, 5.384173,
3.511181, -3.426318, -5.42662,
3.511181, 3.636079, -5.42662,
3.511181, -3.426318, 5.384173,
3.511181, 3.636079, 5.384173,
3.511181, -3.426318, -5.42662,
3.511181, -3.426318, 5.384173,
3.511181, 3.636079, -5.42662,
3.511181, 3.636079, 5.384173
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
var radius = 7.671184;
var distance = 34.12996;
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
mvMatrix.translate( -0.3634731, -0.1048807, 0.02122307 );
mvMatrix.scale( 1.317504, 1.174422, 0.7672179 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12996);
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
bulan<-read.table("bulan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bulan$V2
```

```
## Error in eval(expr, envir, enclos): object 'bulan' not found
```

```r
y<-bulan$V3
```

```
## Error in eval(expr, envir, enclos): object 'bulan' not found
```

```r
z<-bulan$V4
```

```
## Error in eval(expr, envir, enclos): object 'bulan' not found
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
-2.692554, 0.5545725, -3.37682, 0, 0, 1, 1, 1,
-2.642788, 0.3679363, -0.9483202, 1, 0, 0, 1, 1,
-2.343107, -0.2922462, -1.200711, 1, 0, 0, 1, 1,
-2.342368, 0.02907003, -3.181235, 1, 0, 0, 1, 1,
-2.323472, 0.1297023, -1.805305, 1, 0, 0, 1, 1,
-2.300124, 1.314203, -0.4939399, 1, 0, 0, 1, 1,
-2.2877, -0.1390084, -1.911106, 0, 0, 0, 1, 1,
-2.214015, 0.08359489, -0.9854307, 0, 0, 0, 1, 1,
-2.198581, -1.027973, -2.031422, 0, 0, 0, 1, 1,
-2.177418, 1.890329, 0.44063, 0, 0, 0, 1, 1,
-2.149846, 0.2927003, 0.09463751, 0, 0, 0, 1, 1,
-2.146981, -1.758494, -2.658349, 0, 0, 0, 1, 1,
-2.113799, -0.8528967, -2.984129, 0, 0, 0, 1, 1,
-2.102709, -1.420926, -3.017272, 1, 1, 1, 1, 1,
-2.068008, 1.48208, -1.283669, 1, 1, 1, 1, 1,
-2.002068, -1.843979, -0.5529732, 1, 1, 1, 1, 1,
-1.995792, 1.217162, -1.346959, 1, 1, 1, 1, 1,
-1.896304, 2.434839, -0.5687157, 1, 1, 1, 1, 1,
-1.891404, 0.6650012, -2.232527, 1, 1, 1, 1, 1,
-1.844139, 0.1634379, 1.091099, 1, 1, 1, 1, 1,
-1.843093, -0.4060118, -2.027227, 1, 1, 1, 1, 1,
-1.834011, 1.628736, -1.156334, 1, 1, 1, 1, 1,
-1.83327, 1.365668, -0.3315008, 1, 1, 1, 1, 1,
-1.828975, 0.1367354, -1.120347, 1, 1, 1, 1, 1,
-1.820617, 0.5961437, -0.01358523, 1, 1, 1, 1, 1,
-1.807263, 2.0974, 0.3718354, 1, 1, 1, 1, 1,
-1.799905, 0.04655801, -3.424803, 1, 1, 1, 1, 1,
-1.783557, 2.324225, -1.013265, 1, 1, 1, 1, 1,
-1.782479, -0.5629668, -2.13256, 0, 0, 1, 1, 1,
-1.748727, 1.650242, -0.1597971, 1, 0, 0, 1, 1,
-1.741689, -1.702221, -1.640432, 1, 0, 0, 1, 1,
-1.733539, -2.59025, -1.656767, 1, 0, 0, 1, 1,
-1.728839, 0.297674, -0.7947605, 1, 0, 0, 1, 1,
-1.726011, 1.114594, -1.41381, 1, 0, 0, 1, 1,
-1.68958, -1.430401, -4.163429, 0, 0, 0, 1, 1,
-1.688804, 0.4463727, -0.1417341, 0, 0, 0, 1, 1,
-1.656396, 0.5958608, -1.605293, 0, 0, 0, 1, 1,
-1.648838, -0.6488954, -2.350816, 0, 0, 0, 1, 1,
-1.626922, 0.4174633, -0.6922937, 0, 0, 0, 1, 1,
-1.598403, 0.2452935, -1.042163, 0, 0, 0, 1, 1,
-1.590084, 0.4436956, -1.241012, 0, 0, 0, 1, 1,
-1.574121, 1.672253, -1.349172, 1, 1, 1, 1, 1,
-1.568661, -0.04860834, -1.360885, 1, 1, 1, 1, 1,
-1.528728, -0.8823327, -1.700783, 1, 1, 1, 1, 1,
-1.521924, -1.557563, -2.52857, 1, 1, 1, 1, 1,
-1.518235, 0.7927147, -1.346876, 1, 1, 1, 1, 1,
-1.51458, -2.16447, -4.048375, 1, 1, 1, 1, 1,
-1.513376, -1.328274, -1.952686, 1, 1, 1, 1, 1,
-1.499367, 0.4272888, -1.612208, 1, 1, 1, 1, 1,
-1.484719, 0.4003569, -1.797199, 1, 1, 1, 1, 1,
-1.477775, -0.4247588, -0.4463772, 1, 1, 1, 1, 1,
-1.468126, 1.464216, -0.839412, 1, 1, 1, 1, 1,
-1.462693, -1.170464, -2.62143, 1, 1, 1, 1, 1,
-1.445422, 0.3916951, 0.3436663, 1, 1, 1, 1, 1,
-1.443107, -0.2226577, -1.925716, 1, 1, 1, 1, 1,
-1.433214, -1.12426, -1.780184, 1, 1, 1, 1, 1,
-1.423481, 0.8768215, 1.947759, 0, 0, 1, 1, 1,
-1.422543, 0.475382, -1.58511, 1, 0, 0, 1, 1,
-1.417201, -1.503541, -2.080322, 1, 0, 0, 1, 1,
-1.412237, 1.400693, 0.8857453, 1, 0, 0, 1, 1,
-1.412234, -1.264981, -1.224108, 1, 0, 0, 1, 1,
-1.410422, -0.1244655, -0.5842355, 1, 0, 0, 1, 1,
-1.409991, 0.9283217, 0.7455425, 0, 0, 0, 1, 1,
-1.399735, 0.222309, -1.020569, 0, 0, 0, 1, 1,
-1.391043, -0.8043242, -0.9971598, 0, 0, 0, 1, 1,
-1.390446, 1.689398, -0.9865642, 0, 0, 0, 1, 1,
-1.377515, -0.8060153, -0.9047772, 0, 0, 0, 1, 1,
-1.372617, 1.083595, -1.166057, 0, 0, 0, 1, 1,
-1.35607, 0.8696865, 0.2779683, 0, 0, 0, 1, 1,
-1.354878, 0.6807418, -1.371675, 1, 1, 1, 1, 1,
-1.348814, 0.25949, -2.433417, 1, 1, 1, 1, 1,
-1.345719, -0.3184454, -2.19068, 1, 1, 1, 1, 1,
-1.33913, -0.3722517, -1.756016, 1, 1, 1, 1, 1,
-1.329274, -0.5049888, -1.005803, 1, 1, 1, 1, 1,
-1.328551, -1.942486, -3.460682, 1, 1, 1, 1, 1,
-1.32054, -1.562014, -2.123465, 1, 1, 1, 1, 1,
-1.320209, 0.3306813, -2.174251, 1, 1, 1, 1, 1,
-1.314666, -0.3446597, -0.9836152, 1, 1, 1, 1, 1,
-1.308969, -1.43633, -1.922877, 1, 1, 1, 1, 1,
-1.294633, -1.896134, -2.025662, 1, 1, 1, 1, 1,
-1.283258, -1.281618, -2.826043, 1, 1, 1, 1, 1,
-1.280653, -1.977715, -2.675909, 1, 1, 1, 1, 1,
-1.268772, -0.1001138, -2.596547, 1, 1, 1, 1, 1,
-1.267883, 1.226425, -0.7135765, 1, 1, 1, 1, 1,
-1.258106, -1.368734, -1.691477, 0, 0, 1, 1, 1,
-1.256669, 0.6028881, -1.497311, 1, 0, 0, 1, 1,
-1.254427, 0.5912381, 0.00413652, 1, 0, 0, 1, 1,
-1.239939, -0.1412097, 0.6814845, 1, 0, 0, 1, 1,
-1.237518, 0.05800007, -2.625924, 1, 0, 0, 1, 1,
-1.234534, 0.5540766, -0.667611, 1, 0, 0, 1, 1,
-1.231167, -0.507276, -0.6754189, 0, 0, 0, 1, 1,
-1.225036, -0.5297031, -0.3464656, 0, 0, 0, 1, 1,
-1.221672, 0.1727819, -2.204112, 0, 0, 0, 1, 1,
-1.216944, -0.04331569, -2.023917, 0, 0, 0, 1, 1,
-1.216439, -1.350573, -2.56408, 0, 0, 0, 1, 1,
-1.216204, -0.6367271, -3.176259, 0, 0, 0, 1, 1,
-1.214319, -0.003660945, -1.620966, 0, 0, 0, 1, 1,
-1.21402, 0.2313878, -1.312604, 1, 1, 1, 1, 1,
-1.21023, -0.0102141, -0.481382, 1, 1, 1, 1, 1,
-1.19798, -0.3110131, -0.7804618, 1, 1, 1, 1, 1,
-1.196204, -0.4354306, -1.263704, 1, 1, 1, 1, 1,
-1.187998, -0.6485609, -0.9885556, 1, 1, 1, 1, 1,
-1.182589, -1.188436, -1.873819, 1, 1, 1, 1, 1,
-1.176646, -0.3463893, -0.7827675, 1, 1, 1, 1, 1,
-1.176426, 0.07084797, -1.913171, 1, 1, 1, 1, 1,
-1.16507, 0.7501002, 0.5858916, 1, 1, 1, 1, 1,
-1.164492, 0.763595, -0.3246342, 1, 1, 1, 1, 1,
-1.163342, -0.2572484, -0.8691165, 1, 1, 1, 1, 1,
-1.149219, -0.8481877, -2.345906, 1, 1, 1, 1, 1,
-1.139169, -0.5323787, -3.152417, 1, 1, 1, 1, 1,
-1.134646, -1.025104, -2.335801, 1, 1, 1, 1, 1,
-1.124848, 0.309229, -0.3282801, 1, 1, 1, 1, 1,
-1.119448, 0.8788692, -0.2727537, 0, 0, 1, 1, 1,
-1.112231, 1.533582, -0.320874, 1, 0, 0, 1, 1,
-1.104729, -1.094092, -0.8364869, 1, 0, 0, 1, 1,
-1.098505, -0.09066635, -3.280495, 1, 0, 0, 1, 1,
-1.091395, 0.5396552, -1.059714, 1, 0, 0, 1, 1,
-1.088368, -0.3918164, -4.352285, 1, 0, 0, 1, 1,
-1.087186, 0.1612913, -2.130983, 0, 0, 0, 1, 1,
-1.085596, 0.05691854, -2.333268, 0, 0, 0, 1, 1,
-1.084572, 0.4150769, -0.3079935, 0, 0, 0, 1, 1,
-1.083382, -0.02206329, -0.5079502, 0, 0, 0, 1, 1,
-1.078362, 0.5133392, -1.300277, 0, 0, 0, 1, 1,
-1.078308, 0.4978056, -1.184584, 0, 0, 0, 1, 1,
-1.076807, -1.547634, -2.701657, 0, 0, 0, 1, 1,
-1.071459, 0.2567837, -0.06364754, 1, 1, 1, 1, 1,
-1.069654, 2.165874, 0.3381507, 1, 1, 1, 1, 1,
-1.066925, 1.36425, -1.904916, 1, 1, 1, 1, 1,
-1.060403, -0.7861198, -2.104565, 1, 1, 1, 1, 1,
-1.060392, 1.514234, -1.387736, 1, 1, 1, 1, 1,
-1.0575, 1.422703, 0.07443603, 1, 1, 1, 1, 1,
-1.055309, 0.7263087, -0.9434094, 1, 1, 1, 1, 1,
-1.052576, 0.7873668, -1.037002, 1, 1, 1, 1, 1,
-1.045059, 0.1548305, -2.560863, 1, 1, 1, 1, 1,
-1.041711, 1.462906, 0.3395568, 1, 1, 1, 1, 1,
-1.028596, 0.9621409, -1.824596, 1, 1, 1, 1, 1,
-1.028391, -0.3282456, -1.989965, 1, 1, 1, 1, 1,
-1.023131, -0.9991698, -3.050305, 1, 1, 1, 1, 1,
-1.02228, -1.462015, -2.357966, 1, 1, 1, 1, 1,
-1.018443, 0.5346881, -1.758453, 1, 1, 1, 1, 1,
-1.016715, -1.566716, -3.097136, 0, 0, 1, 1, 1,
-1.012542, 0.3042368, -1.241682, 1, 0, 0, 1, 1,
-1.012157, 0.3539925, -2.984672, 1, 0, 0, 1, 1,
-0.9913058, -2.064764, -1.768566, 1, 0, 0, 1, 1,
-0.9906404, 0.1524203, -1.137442, 1, 0, 0, 1, 1,
-0.989669, 0.426259, -0.7376458, 1, 0, 0, 1, 1,
-0.9876959, 2.18252, -0.6065956, 0, 0, 0, 1, 1,
-0.9845505, 0.4749401, -0.9582074, 0, 0, 0, 1, 1,
-0.9801455, 1.696214, -1.157963, 0, 0, 0, 1, 1,
-0.9794179, 0.2484761, -1.416128, 0, 0, 0, 1, 1,
-0.9788336, 2.039289, 0.3926244, 0, 0, 0, 1, 1,
-0.9787235, -1.757794, -3.314865, 0, 0, 0, 1, 1,
-0.9587706, 0.7126676, -2.039115, 0, 0, 0, 1, 1,
-0.9564788, -0.9297726, -2.56556, 1, 1, 1, 1, 1,
-0.9513201, 0.6716662, 0.6227711, 1, 1, 1, 1, 1,
-0.9436746, -1.851508, -2.78782, 1, 1, 1, 1, 1,
-0.9420927, -0.1818001, -2.933691, 1, 1, 1, 1, 1,
-0.9407535, -0.5949792, -3.208293, 1, 1, 1, 1, 1,
-0.9406433, 0.5930985, 0.1275746, 1, 1, 1, 1, 1,
-0.9355099, 3.40886, 0.155197, 1, 1, 1, 1, 1,
-0.9298139, -1.021012, -2.133312, 1, 1, 1, 1, 1,
-0.9257572, -0.5643936, -3.239866, 1, 1, 1, 1, 1,
-0.9214891, 0.4859885, -0.4299403, 1, 1, 1, 1, 1,
-0.9207692, 0.2707286, -1.694079, 1, 1, 1, 1, 1,
-0.918772, 0.2367439, -1.733417, 1, 1, 1, 1, 1,
-0.9154029, -0.5606204, -1.24797, 1, 1, 1, 1, 1,
-0.9089682, 0.3850742, -1.595853, 1, 1, 1, 1, 1,
-0.9069179, -1.251781, -3.78408, 1, 1, 1, 1, 1,
-0.906545, -0.1410448, -1.509103, 0, 0, 1, 1, 1,
-0.9064198, -1.724892, -2.823817, 1, 0, 0, 1, 1,
-0.9024689, 0.3855239, -3.106768, 1, 0, 0, 1, 1,
-0.9006752, -1.294397, -3.004245, 1, 0, 0, 1, 1,
-0.8987514, 0.5959673, -1.191941, 1, 0, 0, 1, 1,
-0.8927553, 0.6237261, -0.8518391, 1, 0, 0, 1, 1,
-0.8884696, -0.8989792, -2.416776, 0, 0, 0, 1, 1,
-0.8880141, 1.382365, -0.1111821, 0, 0, 0, 1, 1,
-0.8877445, 1.26409, -0.1725039, 0, 0, 0, 1, 1,
-0.8866481, -0.2038584, -2.938951, 0, 0, 0, 1, 1,
-0.8842514, -0.738245, -1.063729, 0, 0, 0, 1, 1,
-0.8832284, -1.974559, -1.924464, 0, 0, 0, 1, 1,
-0.8809656, 0.5621405, -1.872119, 0, 0, 0, 1, 1,
-0.8726756, -1.16827, -2.839184, 1, 1, 1, 1, 1,
-0.8726391, 0.3130227, 0.5885765, 1, 1, 1, 1, 1,
-0.8725665, 1.023785, 1.552351, 1, 1, 1, 1, 1,
-0.8644735, 1.710927, 0.172123, 1, 1, 1, 1, 1,
-0.8643374, -0.7257304, -1.921221, 1, 1, 1, 1, 1,
-0.8633099, -0.2380718, -1.464527, 1, 1, 1, 1, 1,
-0.8575931, -0.9578024, -2.289775, 1, 1, 1, 1, 1,
-0.855333, 1.017468, -1.296313, 1, 1, 1, 1, 1,
-0.8521375, -1.64778, -2.416132, 1, 1, 1, 1, 1,
-0.8513654, -1.421027, -1.918966, 1, 1, 1, 1, 1,
-0.8426024, -0.04386426, -2.249751, 1, 1, 1, 1, 1,
-0.8422436, -1.071003, -1.143521, 1, 1, 1, 1, 1,
-0.8403053, -0.6272346, -1.182672, 1, 1, 1, 1, 1,
-0.8350119, 0.9381623, -0.7563837, 1, 1, 1, 1, 1,
-0.834879, 1.200163, 0.8346233, 1, 1, 1, 1, 1,
-0.8337166, -0.8185303, -1.788943, 0, 0, 1, 1, 1,
-0.8302681, -0.2458489, -2.760825, 1, 0, 0, 1, 1,
-0.8271298, 1.001406, -1.249064, 1, 0, 0, 1, 1,
-0.8262106, 0.7194472, -1.511133, 1, 0, 0, 1, 1,
-0.8248507, -1.272577, -2.898004, 1, 0, 0, 1, 1,
-0.8231068, -0.3570128, -1.253788, 1, 0, 0, 1, 1,
-0.8215949, 0.03984626, -0.8431582, 0, 0, 0, 1, 1,
-0.820759, -0.1677963, -0.6485338, 0, 0, 0, 1, 1,
-0.8169751, 1.461043, 0.0903779, 0, 0, 0, 1, 1,
-0.8145936, -0.877596, -2.869173, 0, 0, 0, 1, 1,
-0.8133496, 0.5608896, -1.820312, 0, 0, 0, 1, 1,
-0.8121513, 0.00934254, -2.093351, 0, 0, 0, 1, 1,
-0.8099399, 1.803038, -3.614058, 0, 0, 0, 1, 1,
-0.805464, 0.1049539, -3.343856, 1, 1, 1, 1, 1,
-0.8035423, -0.4338991, -1.778907, 1, 1, 1, 1, 1,
-0.8029598, 0.8999776, -0.01603294, 1, 1, 1, 1, 1,
-0.8027899, -0.1732576, -1.273601, 1, 1, 1, 1, 1,
-0.8004279, -0.211399, -2.166962, 1, 1, 1, 1, 1,
-0.7953182, -0.28723, 0.1201631, 1, 1, 1, 1, 1,
-0.7920408, -0.4420266, -2.965986, 1, 1, 1, 1, 1,
-0.7902364, 1.03906, 1.233689, 1, 1, 1, 1, 1,
-0.7881696, 0.6764916, -0.8179873, 1, 1, 1, 1, 1,
-0.7877734, -1.065944, -0.2041385, 1, 1, 1, 1, 1,
-0.7818069, 0.8637234, 0.1689611, 1, 1, 1, 1, 1,
-0.7752592, -0.07890598, -1.668413, 1, 1, 1, 1, 1,
-0.774491, -0.7182764, -2.146891, 1, 1, 1, 1, 1,
-0.7654337, 0.5129872, -1.327843, 1, 1, 1, 1, 1,
-0.7603127, -1.932805, -1.562119, 1, 1, 1, 1, 1,
-0.7593511, 1.073722, -1.200363, 0, 0, 1, 1, 1,
-0.7570705, 0.07651638, -3.298582, 1, 0, 0, 1, 1,
-0.74927, 0.4201843, -2.24305, 1, 0, 0, 1, 1,
-0.7491843, -0.7467563, -3.047306, 1, 0, 0, 1, 1,
-0.74017, 0.3093259, -1.331898, 1, 0, 0, 1, 1,
-0.7401208, 0.5841414, 0.7816579, 1, 0, 0, 1, 1,
-0.7366744, -1.481423, -2.189113, 0, 0, 0, 1, 1,
-0.736385, 0.7851691, -2.152725, 0, 0, 0, 1, 1,
-0.7307799, 3.533229, 1.259094, 0, 0, 0, 1, 1,
-0.7270635, -0.4527944, -2.130249, 0, 0, 0, 1, 1,
-0.7269108, 1.141788, 0.6755937, 0, 0, 0, 1, 1,
-0.7200063, 0.3506565, 1.351034, 0, 0, 0, 1, 1,
-0.7167816, -0.7434714, -2.19251, 0, 0, 0, 1, 1,
-0.7164105, 2.15902, -0.2259842, 1, 1, 1, 1, 1,
-0.7100542, -1.634894, -3.401376, 1, 1, 1, 1, 1,
-0.7090072, 2.108875, -0.4335938, 1, 1, 1, 1, 1,
-0.7049674, -0.2014075, -1.17024, 1, 1, 1, 1, 1,
-0.7044865, 0.1780209, -2.68931, 1, 1, 1, 1, 1,
-0.7009668, 0.8168284, -0.7727993, 1, 1, 1, 1, 1,
-0.7008044, -0.6470625, -2.726824, 1, 1, 1, 1, 1,
-0.7000768, -1.279847, -3.502224, 1, 1, 1, 1, 1,
-0.6997081, 0.1713974, -1.328681, 1, 1, 1, 1, 1,
-0.6975479, -0.2287267, -1.701045, 1, 1, 1, 1, 1,
-0.6964107, 0.1642057, -1.740424, 1, 1, 1, 1, 1,
-0.6963681, -0.4225385, -2.476508, 1, 1, 1, 1, 1,
-0.6961274, -1.360473, -2.661562, 1, 1, 1, 1, 1,
-0.6945601, -0.970056, -2.332306, 1, 1, 1, 1, 1,
-0.690892, 0.183565, -2.523176, 1, 1, 1, 1, 1,
-0.6889306, -1.272515, -2.15349, 0, 0, 1, 1, 1,
-0.6848516, -1.088323, -1.664171, 1, 0, 0, 1, 1,
-0.679245, -1.892068, -3.872504, 1, 0, 0, 1, 1,
-0.6765033, 1.497083, 0.9368628, 1, 0, 0, 1, 1,
-0.6748955, 0.0132355, -0.6870614, 1, 0, 0, 1, 1,
-0.6729885, 0.7169157, -1.758707, 1, 0, 0, 1, 1,
-0.6712071, 1.269034, -2.431862, 0, 0, 0, 1, 1,
-0.6701142, -0.1570124, -1.06834, 0, 0, 0, 1, 1,
-0.6698607, -1.213566, -3.588452, 0, 0, 0, 1, 1,
-0.6653373, 1.247666, 0.5345331, 0, 0, 0, 1, 1,
-0.6567987, -0.2555161, -2.450649, 0, 0, 0, 1, 1,
-0.6557137, 0.3716005, 0.3949735, 0, 0, 0, 1, 1,
-0.6513599, 0.3055846, -1.906164, 0, 0, 0, 1, 1,
-0.6479758, 1.874824, -1.316304, 1, 1, 1, 1, 1,
-0.6468077, 1.588814, -3.469354, 1, 1, 1, 1, 1,
-0.645594, 0.4385777, -0.5856453, 1, 1, 1, 1, 1,
-0.6444089, -0.3317488, -3.791064, 1, 1, 1, 1, 1,
-0.6417187, 0.09274577, -1.40023, 1, 1, 1, 1, 1,
-0.6411569, -0.2660711, -3.32113, 1, 1, 1, 1, 1,
-0.6389406, -0.6647186, -1.280795, 1, 1, 1, 1, 1,
-0.6362044, 0.2966397, -1.839159, 1, 1, 1, 1, 1,
-0.6276822, -1.234124, -0.87231, 1, 1, 1, 1, 1,
-0.6252156, -0.2422496, -1.261111, 1, 1, 1, 1, 1,
-0.6232247, -0.01179767, -3.568564, 1, 1, 1, 1, 1,
-0.6175293, -0.17409, -2.245256, 1, 1, 1, 1, 1,
-0.6155334, -0.04973862, -1.44281, 1, 1, 1, 1, 1,
-0.6103095, -0.4929815, -3.497697, 1, 1, 1, 1, 1,
-0.6099592, 0.9083944, -1.762667, 1, 1, 1, 1, 1,
-0.6059933, -2.265632, -3.698489, 0, 0, 1, 1, 1,
-0.604407, 2.46033, -1.2839, 1, 0, 0, 1, 1,
-0.6035984, -1.207583, -4.687008, 1, 0, 0, 1, 1,
-0.5984648, -1.566889, -2.847624, 1, 0, 0, 1, 1,
-0.5938843, -1.005312, -2.942307, 1, 0, 0, 1, 1,
-0.5908492, 0.6247728, -1.468934, 1, 0, 0, 1, 1,
-0.5873738, -1.477739, -3.626988, 0, 0, 0, 1, 1,
-0.5868987, -1.913934, -2.710104, 0, 0, 0, 1, 1,
-0.5792426, 0.560639, -0.5314441, 0, 0, 0, 1, 1,
-0.5754657, 0.5497067, 0.4405141, 0, 0, 0, 1, 1,
-0.5751536, -0.9214895, -2.135816, 0, 0, 0, 1, 1,
-0.5748281, -1.169296, -2.899386, 0, 0, 0, 1, 1,
-0.5733721, 0.1986384, -1.721227, 0, 0, 0, 1, 1,
-0.5700068, -0.6284606, -1.704698, 1, 1, 1, 1, 1,
-0.5667802, 1.398769, -0.1914638, 1, 1, 1, 1, 1,
-0.565841, 0.2431113, -2.500825, 1, 1, 1, 1, 1,
-0.5638849, 0.9126607, -0.8326505, 1, 1, 1, 1, 1,
-0.561326, 0.5511855, -0.457429, 1, 1, 1, 1, 1,
-0.5597546, -0.4783198, -0.9877857, 1, 1, 1, 1, 1,
-0.5455253, 0.3964757, -0.6075032, 1, 1, 1, 1, 1,
-0.5421091, 0.715527, 0.7460662, 1, 1, 1, 1, 1,
-0.5405699, -0.292646, -0.3813884, 1, 1, 1, 1, 1,
-0.5401521, -0.003372438, -2.087158, 1, 1, 1, 1, 1,
-0.538559, -1.342131, -3.56311, 1, 1, 1, 1, 1,
-0.5271355, -0.2289677, -2.265418, 1, 1, 1, 1, 1,
-0.5266499, 1.444011, -1.006631, 1, 1, 1, 1, 1,
-0.5253898, 0.3714762, -0.4291107, 1, 1, 1, 1, 1,
-0.5211431, -0.8831477, -2.433781, 1, 1, 1, 1, 1,
-0.5210509, -1.119562, -2.086245, 0, 0, 1, 1, 1,
-0.5172536, -0.396559, -3.991923, 1, 0, 0, 1, 1,
-0.5164258, 0.7478122, -0.1765437, 1, 0, 0, 1, 1,
-0.5157216, -0.8763163, -3.352073, 1, 0, 0, 1, 1,
-0.5146592, -0.4475516, -2.760066, 1, 0, 0, 1, 1,
-0.513704, 0.4483908, -0.3169875, 1, 0, 0, 1, 1,
-0.5124859, -0.3098481, -3.123393, 0, 0, 0, 1, 1,
-0.5071994, -0.7909151, -3.082856, 0, 0, 0, 1, 1,
-0.5017129, -0.3536679, -1.308058, 0, 0, 0, 1, 1,
-0.5015845, 0.6199358, -0.3612486, 0, 0, 0, 1, 1,
-0.4975059, 1.181764, -1.042216, 0, 0, 0, 1, 1,
-0.4963819, 0.5612261, 0.0237039, 0, 0, 0, 1, 1,
-0.4961817, 1.522333, -0.7087992, 0, 0, 0, 1, 1,
-0.4918363, -0.3240564, -2.030723, 1, 1, 1, 1, 1,
-0.489795, -1.154018, -3.064579, 1, 1, 1, 1, 1,
-0.4820907, 0.0501132, -0.158376, 1, 1, 1, 1, 1,
-0.4812045, -0.6726788, -2.435744, 1, 1, 1, 1, 1,
-0.4753451, -0.6742319, -3.187904, 1, 1, 1, 1, 1,
-0.4739267, 0.1623565, -1.004832, 1, 1, 1, 1, 1,
-0.4708487, -0.7596121, -0.1679285, 1, 1, 1, 1, 1,
-0.4673852, 2.055964, 0.9155712, 1, 1, 1, 1, 1,
-0.4664055, -0.9320244, -1.006853, 1, 1, 1, 1, 1,
-0.4651223, 0.8427761, -1.256624, 1, 1, 1, 1, 1,
-0.4645983, -0.7667947, -3.960513, 1, 1, 1, 1, 1,
-0.4633785, -1.359864, -2.896307, 1, 1, 1, 1, 1,
-0.4617061, -0.5326416, -1.890142, 1, 1, 1, 1, 1,
-0.4595663, 0.06926163, -1.810209, 1, 1, 1, 1, 1,
-0.4557396, -0.6417186, -1.828731, 1, 1, 1, 1, 1,
-0.4553109, 2.089085, 0.07080863, 0, 0, 1, 1, 1,
-0.4549357, -0.4802473, -1.405384, 1, 0, 0, 1, 1,
-0.4501167, 1.294047, -1.184546, 1, 0, 0, 1, 1,
-0.4456742, -2.262636, -3.714357, 1, 0, 0, 1, 1,
-0.4411142, -0.4356434, -3.214178, 1, 0, 0, 1, 1,
-0.4390664, -0.1971224, -3.438777, 1, 0, 0, 1, 1,
-0.4370784, -0.1715696, -1.96856, 0, 0, 0, 1, 1,
-0.4343761, -0.2129107, -2.378807, 0, 0, 0, 1, 1,
-0.4300407, 0.2250216, -0.09740035, 0, 0, 0, 1, 1,
-0.4300177, -1.399499, -3.219269, 0, 0, 0, 1, 1,
-0.4299664, 0.2110717, -3.208837, 0, 0, 0, 1, 1,
-0.4280553, -1.532914, -4.022602, 0, 0, 0, 1, 1,
-0.4260148, 1.896876, -1.224173, 0, 0, 0, 1, 1,
-0.4146854, -0.1981304, -1.016609, 1, 1, 1, 1, 1,
-0.414079, -1.617641, -4.621398, 1, 1, 1, 1, 1,
-0.4129842, 0.8263859, 1.390985, 1, 1, 1, 1, 1,
-0.4089146, 1.083336, 0.08304825, 1, 1, 1, 1, 1,
-0.4068957, 2.189972, -0.4281039, 1, 1, 1, 1, 1,
-0.4015019, -0.6766667, -0.6233482, 1, 1, 1, 1, 1,
-0.3999965, 0.5347471, -0.4600161, 1, 1, 1, 1, 1,
-0.3977154, -1.139487, -1.848159, 1, 1, 1, 1, 1,
-0.3960775, 0.9136554, -1.954847, 1, 1, 1, 1, 1,
-0.3916667, 2.027041, -0.7571499, 1, 1, 1, 1, 1,
-0.3907456, 0.09495398, 0.2651953, 1, 1, 1, 1, 1,
-0.3900939, 2.235485, -0.3544613, 1, 1, 1, 1, 1,
-0.3864516, 0.3033755, -1.394488, 1, 1, 1, 1, 1,
-0.3854174, 0.5415671, -2.040932, 1, 1, 1, 1, 1,
-0.384024, 0.05038973, -0.3308066, 1, 1, 1, 1, 1,
-0.3806848, 1.928655, 0.5775908, 0, 0, 1, 1, 1,
-0.3732076, -0.850415, -1.349391, 1, 0, 0, 1, 1,
-0.3687174, -0.008432854, -0.2725631, 1, 0, 0, 1, 1,
-0.3678927, -0.7010726, -3.224267, 1, 0, 0, 1, 1,
-0.3673457, -1.881307, -2.369997, 1, 0, 0, 1, 1,
-0.365024, 0.4545011, -1.34719, 1, 0, 0, 1, 1,
-0.3607097, 1.531337, -1.300238, 0, 0, 0, 1, 1,
-0.356487, -1.283038, -3.363997, 0, 0, 0, 1, 1,
-0.3535798, -0.8812071, -2.946331, 0, 0, 0, 1, 1,
-0.349847, -0.07512359, -2.957353, 0, 0, 0, 1, 1,
-0.3471664, -2.287986, -3.106466, 0, 0, 0, 1, 1,
-0.345312, -0.7907899, -3.740191, 0, 0, 0, 1, 1,
-0.3428794, -0.3100237, -2.202434, 0, 0, 0, 1, 1,
-0.3428279, 0.680185, 0.1296073, 1, 1, 1, 1, 1,
-0.3391176, 1.069065, -0.636835, 1, 1, 1, 1, 1,
-0.3376444, -0.4312751, -2.362429, 1, 1, 1, 1, 1,
-0.3339153, 0.06987204, -0.569685, 1, 1, 1, 1, 1,
-0.3219075, 1.701818, -1.007996, 1, 1, 1, 1, 1,
-0.3153929, 0.03044958, -2.651084, 1, 1, 1, 1, 1,
-0.314895, -0.186727, -2.657266, 1, 1, 1, 1, 1,
-0.3144517, 0.05130421, -1.886584, 1, 1, 1, 1, 1,
-0.3135226, 2.18187, -1.426674, 1, 1, 1, 1, 1,
-0.3122907, 0.7830203, 0.770696, 1, 1, 1, 1, 1,
-0.30663, 0.07993338, -0.8056518, 1, 1, 1, 1, 1,
-0.2919744, 1.229356, -0.8426405, 1, 1, 1, 1, 1,
-0.2914787, 0.4968791, -0.3682552, 1, 1, 1, 1, 1,
-0.291376, -0.7353242, -2.133663, 1, 1, 1, 1, 1,
-0.2901032, 0.3273231, -0.001094902, 1, 1, 1, 1, 1,
-0.2894258, -0.2728296, -1.237946, 0, 0, 1, 1, 1,
-0.2889126, -0.6790948, -2.709879, 1, 0, 0, 1, 1,
-0.2888365, -1.316916, -3.816045, 1, 0, 0, 1, 1,
-0.2887597, 0.7157427, 0.4243563, 1, 0, 0, 1, 1,
-0.28703, -0.1116984, -1.113695, 1, 0, 0, 1, 1,
-0.2853035, -2.221879, -5.269181, 1, 0, 0, 1, 1,
-0.2836846, 0.6191816, -0.3176953, 0, 0, 0, 1, 1,
-0.2822148, -0.1260669, -2.140011, 0, 0, 0, 1, 1,
-0.2812867, 0.5877674, -1.063882, 0, 0, 0, 1, 1,
-0.270121, -0.842048, -3.830903, 0, 0, 0, 1, 1,
-0.2656856, 0.05458746, -2.06818, 0, 0, 0, 1, 1,
-0.2655436, -1.121988, -1.569118, 0, 0, 0, 1, 1,
-0.2622075, 0.5028138, -0.9206414, 0, 0, 0, 1, 1,
-0.2589324, -0.06351608, -1.628569, 1, 1, 1, 1, 1,
-0.2543519, 0.4852753, 1.259632, 1, 1, 1, 1, 1,
-0.2522374, -1.684286, -2.795753, 1, 1, 1, 1, 1,
-0.2515497, -0.7958027, -0.8442306, 1, 1, 1, 1, 1,
-0.249962, 0.1235482, -3.212265, 1, 1, 1, 1, 1,
-0.2411232, -0.4037818, -2.524259, 1, 1, 1, 1, 1,
-0.2380611, 1.697372, 0.01032696, 1, 1, 1, 1, 1,
-0.2368076, 0.4883827, -0.04843386, 1, 1, 1, 1, 1,
-0.2354764, 1.139681, 0.7044539, 1, 1, 1, 1, 1,
-0.2350106, 0.3947558, -2.751836, 1, 1, 1, 1, 1,
-0.23229, 1.118623, -1.446251, 1, 1, 1, 1, 1,
-0.2298852, -0.6713783, -2.759302, 1, 1, 1, 1, 1,
-0.2236307, 0.08156985, 0.03156897, 1, 1, 1, 1, 1,
-0.2092545, 0.1176751, -0.721406, 1, 1, 1, 1, 1,
-0.2038435, -0.06347312, -1.457234, 1, 1, 1, 1, 1,
-0.203148, 0.6098322, -0.1641139, 0, 0, 1, 1, 1,
-0.2025088, 0.1240362, 0.6638405, 1, 0, 0, 1, 1,
-0.2022278, -0.6593462, -2.358801, 1, 0, 0, 1, 1,
-0.201664, 0.6228914, 0.2031892, 1, 0, 0, 1, 1,
-0.2005108, 1.281622, -0.2796076, 1, 0, 0, 1, 1,
-0.2003804, 0.009005424, 0.1159343, 1, 0, 0, 1, 1,
-0.1911498, -2.382588, -3.010273, 0, 0, 0, 1, 1,
-0.1877285, 0.9447883, 0.3423177, 0, 0, 0, 1, 1,
-0.1873858, 0.03154001, -1.617384, 0, 0, 0, 1, 1,
-0.1855367, 0.6548159, -0.5212379, 0, 0, 0, 1, 1,
-0.1848345, 0.674226, -0.9034873, 0, 0, 0, 1, 1,
-0.1845114, 0.1603205, -0.6489557, 0, 0, 0, 1, 1,
-0.1832511, 0.4917969, 0.2263092, 0, 0, 0, 1, 1,
-0.1825937, -0.1199864, -1.741751, 1, 1, 1, 1, 1,
-0.1811519, 1.007302, 0.4234248, 1, 1, 1, 1, 1,
-0.1805687, 1.913899, -0.2362656, 1, 1, 1, 1, 1,
-0.1783091, -0.9261695, -3.707236, 1, 1, 1, 1, 1,
-0.1781337, -0.6840214, -3.056903, 1, 1, 1, 1, 1,
-0.1757899, -0.8608028, -1.72587, 1, 1, 1, 1, 1,
-0.1738354, 0.9583213, 2.667686, 1, 1, 1, 1, 1,
-0.1734234, 1.79063, 0.9046648, 1, 1, 1, 1, 1,
-0.1724966, -0.2458269, -3.023333, 1, 1, 1, 1, 1,
-0.1622008, -0.9366218, -3.020412, 1, 1, 1, 1, 1,
-0.1616021, -0.5053345, -2.980346, 1, 1, 1, 1, 1,
-0.1602544, -0.4051573, -1.357679, 1, 1, 1, 1, 1,
-0.1599638, -0.685826, -2.049154, 1, 1, 1, 1, 1,
-0.1592572, -1.334234, -4.200396, 1, 1, 1, 1, 1,
-0.1540583, 0.03241669, -0.7367882, 1, 1, 1, 1, 1,
-0.1491749, -0.4504616, -2.225197, 0, 0, 1, 1, 1,
-0.1472612, 0.1229738, -2.494285, 1, 0, 0, 1, 1,
-0.146576, -0.6127527, -3.710949, 1, 0, 0, 1, 1,
-0.1446345, -0.09563972, -1.630979, 1, 0, 0, 1, 1,
-0.1421045, 0.4688759, -0.3782916, 1, 0, 0, 1, 1,
-0.1364156, 0.5674383, -0.5285421, 1, 0, 0, 1, 1,
-0.135429, -0.1828851, -1.854396, 0, 0, 0, 1, 1,
-0.1328057, 1.33221, 0.7322196, 0, 0, 0, 1, 1,
-0.1299623, 0.5200595, -0.5496136, 0, 0, 0, 1, 1,
-0.1286694, -1.71995, -2.136812, 0, 0, 0, 1, 1,
-0.1247061, 0.1836733, -1.97899, 0, 0, 0, 1, 1,
-0.122334, -1.170288, -3.948028, 0, 0, 0, 1, 1,
-0.1222008, 1.469064, -1.857231, 0, 0, 0, 1, 1,
-0.1151679, 1.787356, -1.254509, 1, 1, 1, 1, 1,
-0.1147408, 0.1348341, -0.07105783, 1, 1, 1, 1, 1,
-0.1115955, 0.6911618, -0.6960645, 1, 1, 1, 1, 1,
-0.1091754, -0.5441403, -2.742222, 1, 1, 1, 1, 1,
-0.1087487, -0.4864739, -2.434019, 1, 1, 1, 1, 1,
-0.1075553, -1.63364, -3.8997, 1, 1, 1, 1, 1,
-0.104688, -0.3927642, -2.925168, 1, 1, 1, 1, 1,
-0.1012739, -0.995653, -2.781587, 1, 1, 1, 1, 1,
-0.1012156, -0.487244, -3.380722, 1, 1, 1, 1, 1,
-0.1010514, -1.578732, -2.641513, 1, 1, 1, 1, 1,
-0.09745055, 0.1942865, -0.7785751, 1, 1, 1, 1, 1,
-0.09072971, 0.08670566, -0.5171752, 1, 1, 1, 1, 1,
-0.0874377, -0.8318876, -3.121403, 1, 1, 1, 1, 1,
-0.08709737, -1.200522, -1.527777, 1, 1, 1, 1, 1,
-0.07911152, 0.2943542, -1.886446, 1, 1, 1, 1, 1,
-0.07575184, -0.7724037, -3.215188, 0, 0, 1, 1, 1,
-0.0708088, 0.5782709, 0.8960601, 1, 0, 0, 1, 1,
-0.07054608, -0.6748554, -3.100759, 1, 0, 0, 1, 1,
-0.07020392, -0.2349083, -5.078216, 1, 0, 0, 1, 1,
-0.0692523, -0.5765937, -2.592599, 1, 0, 0, 1, 1,
-0.06913404, -0.3625658, -2.617888, 1, 0, 0, 1, 1,
-0.05982918, -1.033951, -3.977991, 0, 0, 0, 1, 1,
-0.05808385, 0.1813933, 0.1840093, 0, 0, 0, 1, 1,
-0.05688755, 0.5331123, -1.502258, 0, 0, 0, 1, 1,
-0.05410621, 1.356202, 1.070216, 0, 0, 0, 1, 1,
-0.05261129, -0.5041661, -1.409784, 0, 0, 0, 1, 1,
-0.05226558, 0.9722184, 0.4184443, 0, 0, 0, 1, 1,
-0.0497959, 1.446922, -1.937727, 0, 0, 0, 1, 1,
-0.04406104, -0.2137706, -1.788468, 1, 1, 1, 1, 1,
-0.04028653, 1.071556, 1.097856, 1, 1, 1, 1, 1,
-0.03090313, 1.526855, 0.4599029, 1, 1, 1, 1, 1,
-0.02723673, 1.130122, -0.2925398, 1, 1, 1, 1, 1,
-0.02570578, 0.9982004, 0.1485437, 1, 1, 1, 1, 1,
-0.02564424, -1.819602, -1.905142, 1, 1, 1, 1, 1,
-0.02505708, 1.918099, 0.889458, 1, 1, 1, 1, 1,
-0.0215177, 0.05648223, -1.103126, 1, 1, 1, 1, 1,
-0.02144098, -1.677143, -3.313528, 1, 1, 1, 1, 1,
-0.01761125, -0.02560728, -2.272491, 1, 1, 1, 1, 1,
-0.009693325, 1.141094, -0.5592697, 1, 1, 1, 1, 1,
-0.00443293, 1.080296, -0.687222, 1, 1, 1, 1, 1,
-0.002534815, -0.9161507, -3.601957, 1, 1, 1, 1, 1,
-0.002232238, -0.3542437, -3.437197, 1, 1, 1, 1, 1,
0.003366672, -0.7656147, 2.587895, 1, 1, 1, 1, 1,
0.006154774, 1.357567, -0.4461712, 0, 0, 1, 1, 1,
0.006758441, -1.033532, 4.961763, 1, 0, 0, 1, 1,
0.007444658, -0.2896808, 3.374423, 1, 0, 0, 1, 1,
0.01020103, -2.08518, 3.606314, 1, 0, 0, 1, 1,
0.01361148, -2.258714, 3.716048, 1, 0, 0, 1, 1,
0.01422503, -0.2243827, 2.211593, 1, 0, 0, 1, 1,
0.01982387, -1.069464, 2.616985, 0, 0, 0, 1, 1,
0.02008372, -0.02024751, 3.065495, 0, 0, 0, 1, 1,
0.02403888, -0.1655214, 3.718, 0, 0, 0, 1, 1,
0.04068014, -1.014393, 4.773835, 0, 0, 0, 1, 1,
0.04439314, -0.2891032, 3.560882, 0, 0, 0, 1, 1,
0.05048191, -0.6047759, 2.563483, 0, 0, 0, 1, 1,
0.05190013, -0.2073935, 3.923228, 0, 0, 0, 1, 1,
0.05318575, 1.694952, 0.3130031, 1, 1, 1, 1, 1,
0.06473732, -0.1354006, 2.856793, 1, 1, 1, 1, 1,
0.06637962, 2.001287, -0.6498721, 1, 1, 1, 1, 1,
0.06982952, 0.1535881, -0.4499563, 1, 1, 1, 1, 1,
0.07001754, 1.178958, -0.5554503, 1, 1, 1, 1, 1,
0.07286283, -1.29687, 3.815952, 1, 1, 1, 1, 1,
0.07298774, -1.2278, 2.09587, 1, 1, 1, 1, 1,
0.07585999, 0.06650542, 0.479656, 1, 1, 1, 1, 1,
0.07696062, -0.8288381, 2.695673, 1, 1, 1, 1, 1,
0.08167021, 0.9379371, 0.3300249, 1, 1, 1, 1, 1,
0.08215231, 0.9472643, 2.166734, 1, 1, 1, 1, 1,
0.08725371, -0.4769199, 1.81748, 1, 1, 1, 1, 1,
0.08865532, -2.248099, 2.240572, 1, 1, 1, 1, 1,
0.08933827, -0.07873358, 2.254287, 1, 1, 1, 1, 1,
0.0945425, 0.8618922, 2.147908, 1, 1, 1, 1, 1,
0.1021516, 0.7530243, 1.693724, 0, 0, 1, 1, 1,
0.1045723, -0.4744943, 1.859461, 1, 0, 0, 1, 1,
0.1064095, -0.9067039, 1.631152, 1, 0, 0, 1, 1,
0.1093165, 0.5223915, -0.3772998, 1, 0, 0, 1, 1,
0.111089, -0.1601214, 2.203148, 1, 0, 0, 1, 1,
0.1122721, -0.05107073, 2.253807, 1, 0, 0, 1, 1,
0.1147031, 1.474405, -0.05648946, 0, 0, 0, 1, 1,
0.1190712, 0.8563392, -0.9728802, 0, 0, 0, 1, 1,
0.1226174, 0.5091904, -0.0601837, 0, 0, 0, 1, 1,
0.1254048, -0.3035388, 3.764535, 0, 0, 0, 1, 1,
0.130248, -1.527503, 4.959146, 0, 0, 0, 1, 1,
0.1313894, -0.2169783, 3.476596, 0, 0, 0, 1, 1,
0.1316364, 0.6913587, -0.5525317, 0, 0, 0, 1, 1,
0.1317733, 1.245816, -0.7930808, 1, 1, 1, 1, 1,
0.1334355, 1.30766, -0.6861327, 1, 1, 1, 1, 1,
0.1355349, 0.4365949, 0.1029336, 1, 1, 1, 1, 1,
0.13587, 0.3464629, 0.6521047, 1, 1, 1, 1, 1,
0.1414728, 0.1434271, -0.5089008, 1, 1, 1, 1, 1,
0.1428962, -2.258856, 3.720269, 1, 1, 1, 1, 1,
0.1456132, -0.1972416, 1.989008, 1, 1, 1, 1, 1,
0.1466896, -1.904895, 2.438243, 1, 1, 1, 1, 1,
0.1500424, -1.312231, 2.426804, 1, 1, 1, 1, 1,
0.1505178, 0.5338458, -0.3530415, 1, 1, 1, 1, 1,
0.1531188, 1.615675, -0.8892639, 1, 1, 1, 1, 1,
0.1538929, 1.516027, 0.3806117, 1, 1, 1, 1, 1,
0.1542849, 0.1707426, 1.850847, 1, 1, 1, 1, 1,
0.1619627, 1.2273, -0.7185603, 1, 1, 1, 1, 1,
0.1622958, 0.7330554, -0.02491513, 1, 1, 1, 1, 1,
0.1624803, -0.1918669, 1.34189, 0, 0, 1, 1, 1,
0.1634491, 1.088869, 1.364851, 1, 0, 0, 1, 1,
0.1640141, 1.437366, 0.2830161, 1, 0, 0, 1, 1,
0.1654055, -0.8024885, 1.224681, 1, 0, 0, 1, 1,
0.1673606, 0.4705886, 1.409575, 1, 0, 0, 1, 1,
0.1708583, -0.9794645, 4.828788, 1, 0, 0, 1, 1,
0.1709732, -1.548407, 4.185308, 0, 0, 0, 1, 1,
0.1710546, 0.2626843, 0.5976292, 0, 0, 0, 1, 1,
0.1839075, 0.6541519, 1.817138, 0, 0, 0, 1, 1,
0.1859399, 1.428955, 0.5966572, 0, 0, 0, 1, 1,
0.1900122, -0.3695764, 1.358864, 0, 0, 0, 1, 1,
0.192272, 0.2997878, 2.133222, 0, 0, 0, 1, 1,
0.1945858, 0.5160483, -0.7391807, 0, 0, 0, 1, 1,
0.1967367, -1.332885, 3.269189, 1, 1, 1, 1, 1,
0.1988252, 0.5975094, 1.501155, 1, 1, 1, 1, 1,
0.1997012, -0.3634149, 3.250008, 1, 1, 1, 1, 1,
0.1997557, 1.029, -0.2353869, 1, 1, 1, 1, 1,
0.2023978, -0.3533867, 3.17122, 1, 1, 1, 1, 1,
0.2100269, -0.3835302, 2.252121, 1, 1, 1, 1, 1,
0.2143677, 0.5435621, -0.6610457, 1, 1, 1, 1, 1,
0.2176891, 1.881331, -0.9134042, 1, 1, 1, 1, 1,
0.2238824, 0.4436346, 1.033363, 1, 1, 1, 1, 1,
0.2239244, 0.01938488, 0.02716063, 1, 1, 1, 1, 1,
0.2245137, -2.064443, 1.069017, 1, 1, 1, 1, 1,
0.2248551, -0.06661581, 1.052707, 1, 1, 1, 1, 1,
0.2291836, 0.5250057, 0.02301264, 1, 1, 1, 1, 1,
0.2299443, -0.9322122, 3.848574, 1, 1, 1, 1, 1,
0.2302565, -0.4855809, 1.636599, 1, 1, 1, 1, 1,
0.2304365, 1.064313, -1.751884, 0, 0, 1, 1, 1,
0.2308542, -0.15001, 3.377144, 1, 0, 0, 1, 1,
0.2364136, 0.9870457, 0.6639364, 1, 0, 0, 1, 1,
0.2401714, -1.023245, 3.663489, 1, 0, 0, 1, 1,
0.2405514, -0.8795023, 4.363287, 1, 0, 0, 1, 1,
0.2436481, 0.6748381, 2.320247, 1, 0, 0, 1, 1,
0.2454632, 0.2557931, -0.6310621, 0, 0, 0, 1, 1,
0.2475197, 1.030747, 1.11452, 0, 0, 0, 1, 1,
0.2528167, 0.01133437, 2.455628, 0, 0, 0, 1, 1,
0.2528791, 0.5436558, 0.4851351, 0, 0, 0, 1, 1,
0.254179, 0.1823869, 0.5638898, 0, 0, 0, 1, 1,
0.254461, -0.01315797, 1.623332, 0, 0, 0, 1, 1,
0.2564043, 1.491058, -1.135545, 0, 0, 0, 1, 1,
0.256787, -0.464034, 2.292974, 1, 1, 1, 1, 1,
0.2620356, 0.05078421, 1.921126, 1, 1, 1, 1, 1,
0.2626353, 0.1250204, 3.306638, 1, 1, 1, 1, 1,
0.2660426, -1.313522, 3.442071, 1, 1, 1, 1, 1,
0.2673962, 0.1333189, 2.695418, 1, 1, 1, 1, 1,
0.2683366, 0.1768404, 0.3820602, 1, 1, 1, 1, 1,
0.2683818, -1.482491, 1.713069, 1, 1, 1, 1, 1,
0.2688754, -0.6987327, 2.07181, 1, 1, 1, 1, 1,
0.2762204, -0.2190627, 1.913649, 1, 1, 1, 1, 1,
0.284286, -0.423592, 3.099154, 1, 1, 1, 1, 1,
0.2860344, -0.1338303, 2.03584, 1, 1, 1, 1, 1,
0.2862746, -0.7035922, 3.470566, 1, 1, 1, 1, 1,
0.2867685, 0.6791337, 0.02010724, 1, 1, 1, 1, 1,
0.2886813, 1.798537, -1.976935, 1, 1, 1, 1, 1,
0.2895487, 0.2805395, -0.9867811, 1, 1, 1, 1, 1,
0.2908729, -0.05894734, 1.713582, 0, 0, 1, 1, 1,
0.2953483, 0.2064261, -0.09294734, 1, 0, 0, 1, 1,
0.2965942, -0.3263846, 2.478553, 1, 0, 0, 1, 1,
0.3003711, -0.9262912, 3.720834, 1, 0, 0, 1, 1,
0.3013507, -0.8291723, 2.645235, 1, 0, 0, 1, 1,
0.3015191, -2.013976, 1.698241, 1, 0, 0, 1, 1,
0.3038288, -0.4176556, 3.077527, 0, 0, 0, 1, 1,
0.3039646, -0.1910975, 2.558064, 0, 0, 0, 1, 1,
0.3084401, -1.926155, 2.955591, 0, 0, 0, 1, 1,
0.3087483, -0.4010162, 3.139914, 0, 0, 0, 1, 1,
0.3131053, 0.5083725, 1.668598, 0, 0, 0, 1, 1,
0.3163886, -0.3579378, 4.052379, 0, 0, 0, 1, 1,
0.3258083, -1.274654, 2.606287, 0, 0, 0, 1, 1,
0.3263212, 0.2133638, 2.781402, 1, 1, 1, 1, 1,
0.3287147, -1.976623, 2.653659, 1, 1, 1, 1, 1,
0.329044, 0.3111346, 0.07379951, 1, 1, 1, 1, 1,
0.3293651, 0.558071, 0.9628409, 1, 1, 1, 1, 1,
0.3307454, 1.288417, -0.2446754, 1, 1, 1, 1, 1,
0.333725, -1.500154, 0.7700691, 1, 1, 1, 1, 1,
0.3349755, -0.2795394, 2.051389, 1, 1, 1, 1, 1,
0.3405246, -0.8457612, 2.440103, 1, 1, 1, 1, 1,
0.3433116, 0.8544978, 0.7132135, 1, 1, 1, 1, 1,
0.3449033, -0.2235, 2.072586, 1, 1, 1, 1, 1,
0.3465862, -1.185789, 2.256405, 1, 1, 1, 1, 1,
0.3490129, -0.3168117, 2.933721, 1, 1, 1, 1, 1,
0.3499011, -0.4251525, 1.590953, 1, 1, 1, 1, 1,
0.3512828, -0.1119733, 1.827322, 1, 1, 1, 1, 1,
0.3520923, -0.5964068, 1.288192, 1, 1, 1, 1, 1,
0.3527253, 1.221862, 1.347366, 0, 0, 1, 1, 1,
0.3535865, 1.277601, -0.5699578, 1, 0, 0, 1, 1,
0.3547821, -0.3742681, 0.3933886, 1, 0, 0, 1, 1,
0.3584115, 1.175334, 0.4812922, 1, 0, 0, 1, 1,
0.3588701, -0.9356584, 3.592262, 1, 0, 0, 1, 1,
0.3622929, 0.9501783, 1.058447, 1, 0, 0, 1, 1,
0.3644429, -1.827231, 2.64767, 0, 0, 0, 1, 1,
0.3655831, 0.7459894, 0.9083365, 0, 0, 0, 1, 1,
0.3676493, -0.2488329, 3.316381, 0, 0, 0, 1, 1,
0.3715324, -0.9194315, 1.954098, 0, 0, 0, 1, 1,
0.3722288, 0.8557307, 2.392874, 0, 0, 0, 1, 1,
0.3722655, 0.3993466, 1.125468, 0, 0, 0, 1, 1,
0.3755727, 0.8958326, -0.5456938, 0, 0, 0, 1, 1,
0.3760991, -0.1372447, 3.301682, 1, 1, 1, 1, 1,
0.3810687, -0.973754, 3.340673, 1, 1, 1, 1, 1,
0.3836938, 1.277925, -1.246694, 1, 1, 1, 1, 1,
0.3850439, 0.3698286, 1.23745, 1, 1, 1, 1, 1,
0.3860283, 0.8338972, -0.3606177, 1, 1, 1, 1, 1,
0.3861693, -0.2270486, 0.6141327, 1, 1, 1, 1, 1,
0.391246, -0.1108433, 2.724899, 1, 1, 1, 1, 1,
0.3992505, -0.9405153, 1.753831, 1, 1, 1, 1, 1,
0.4043905, 1.593896, 0.5353851, 1, 1, 1, 1, 1,
0.4055885, -1.338383, 3.575407, 1, 1, 1, 1, 1,
0.407872, 1.48988, 0.03332927, 1, 1, 1, 1, 1,
0.4080532, -1.033881, 2.044759, 1, 1, 1, 1, 1,
0.40973, -0.1753247, 1.291204, 1, 1, 1, 1, 1,
0.4151796, -2.713027, 1.609905, 1, 1, 1, 1, 1,
0.4153848, -0.6139078, 1.873924, 1, 1, 1, 1, 1,
0.4176163, -0.04240925, 1.022092, 0, 0, 1, 1, 1,
0.4260665, -1.723425, 2.5173, 1, 0, 0, 1, 1,
0.4282065, 0.3224967, 0.1778982, 1, 0, 0, 1, 1,
0.432115, -0.1065328, 3.204866, 1, 0, 0, 1, 1,
0.4354814, -1.873334, 1.794603, 1, 0, 0, 1, 1,
0.4367192, -1.796427, 0.770469, 1, 0, 0, 1, 1,
0.4380339, 0.3488954, 1.694863, 0, 0, 0, 1, 1,
0.438552, 1.895325, -1.254264, 0, 0, 0, 1, 1,
0.4434905, 0.1053681, 0.541742, 0, 0, 0, 1, 1,
0.4457914, 0.1877511, 2.645344, 0, 0, 0, 1, 1,
0.4476438, -1.277836, 2.169019, 0, 0, 0, 1, 1,
0.4502841, -0.8803313, 4.548455, 0, 0, 0, 1, 1,
0.4512981, 0.2821883, 0.8720223, 0, 0, 0, 1, 1,
0.4520551, 0.1821496, 1.054536, 1, 1, 1, 1, 1,
0.4527169, -0.3044265, 1.900873, 1, 1, 1, 1, 1,
0.456218, 0.1647475, 1.060719, 1, 1, 1, 1, 1,
0.4564832, -0.9086289, 3.928605, 1, 1, 1, 1, 1,
0.4588101, 0.1220684, 0.17536, 1, 1, 1, 1, 1,
0.4596101, 0.1389179, 2.098666, 1, 1, 1, 1, 1,
0.4698811, -1.229825, 3.452462, 1, 1, 1, 1, 1,
0.4711249, -0.3076297, 2.955126, 1, 1, 1, 1, 1,
0.4741643, 0.5405864, 1.140895, 1, 1, 1, 1, 1,
0.477828, 0.4758824, -0.1724073, 1, 1, 1, 1, 1,
0.4859722, 1.540501, 0.7090937, 1, 1, 1, 1, 1,
0.4897534, 1.551503, 0.7441152, 1, 1, 1, 1, 1,
0.489968, 0.2601736, 0.4951242, 1, 1, 1, 1, 1,
0.491388, -0.6071305, 3.081406, 1, 1, 1, 1, 1,
0.4933336, 1.492638, 1.266254, 1, 1, 1, 1, 1,
0.4987143, -1.309715, 4.674842, 0, 0, 1, 1, 1,
0.5005205, -1.03904, 2.366102, 1, 0, 0, 1, 1,
0.5013946, 0.474232, -0.2055101, 1, 0, 0, 1, 1,
0.5030558, -0.0624252, 0.9788601, 1, 0, 0, 1, 1,
0.5061643, -1.824663, 1.875983, 1, 0, 0, 1, 1,
0.5072689, -1.285845, 2.798982, 1, 0, 0, 1, 1,
0.5177772, 0.02283942, 2.700682, 0, 0, 0, 1, 1,
0.5208162, 0.2900956, -0.4898698, 0, 0, 0, 1, 1,
0.5219283, 0.8025582, 0.3870842, 0, 0, 0, 1, 1,
0.5340168, 0.03385173, 1.437774, 0, 0, 0, 1, 1,
0.5357859, 0.1754487, 2.390507, 0, 0, 0, 1, 1,
0.5499725, 1.183574, 1.495067, 0, 0, 0, 1, 1,
0.5511037, -0.1278915, 2.650591, 0, 0, 0, 1, 1,
0.5546336, 0.3620303, 1.821116, 1, 1, 1, 1, 1,
0.5559263, 0.2954128, 1.729842, 1, 1, 1, 1, 1,
0.5563357, -0.9075597, 2.603587, 1, 1, 1, 1, 1,
0.5570914, 1.363791, 0.5639734, 1, 1, 1, 1, 1,
0.5618577, 1.213448, 1.454051, 1, 1, 1, 1, 1,
0.5705682, -1.991035, 2.786747, 1, 1, 1, 1, 1,
0.5712735, -0.3184055, 2.165591, 1, 1, 1, 1, 1,
0.5743964, -0.3105225, 1.411386, 1, 1, 1, 1, 1,
0.5771163, -0.1308658, 1.794138, 1, 1, 1, 1, 1,
0.5772656, -0.1304469, 2.49105, 1, 1, 1, 1, 1,
0.5888338, 0.1910353, -0.1657043, 1, 1, 1, 1, 1,
0.5905353, 1.325665, 1.636264, 1, 1, 1, 1, 1,
0.5910176, -0.8680847, 1.477734, 1, 1, 1, 1, 1,
0.5952296, 0.3025459, -0.8775873, 1, 1, 1, 1, 1,
0.5953532, -0.2935654, 0.2083051, 1, 1, 1, 1, 1,
0.595748, -1.250272, 3.681661, 0, 0, 1, 1, 1,
0.5959982, 0.1910436, 0.3767116, 1, 0, 0, 1, 1,
0.5975543, -0.9028836, 4.466817, 1, 0, 0, 1, 1,
0.6039762, 0.4001555, -0.3736508, 1, 0, 0, 1, 1,
0.6065745, 0.9977681, -0.9088072, 1, 0, 0, 1, 1,
0.616672, -0.5493473, 1.907233, 1, 0, 0, 1, 1,
0.6238036, -0.1719925, 2.85818, 0, 0, 0, 1, 1,
0.625334, -2.136418, 3.123186, 0, 0, 0, 1, 1,
0.6259843, 0.3601844, 0.01832048, 0, 0, 0, 1, 1,
0.6266801, 0.3064438, 1.959023, 0, 0, 0, 1, 1,
0.6290178, 0.1921467, 2.682305, 0, 0, 0, 1, 1,
0.6303825, -0.6418411, 2.285197, 0, 0, 0, 1, 1,
0.632063, 0.6735122, 0.5637498, 0, 0, 0, 1, 1,
0.6353462, 1.362015, -1.348967, 1, 1, 1, 1, 1,
0.639348, -0.8339579, 3.548371, 1, 1, 1, 1, 1,
0.6401528, 1.802466, -0.9560342, 1, 1, 1, 1, 1,
0.6403845, -0.2902149, 1.810526, 1, 1, 1, 1, 1,
0.6428961, -0.06033667, 3.099496, 1, 1, 1, 1, 1,
0.6449972, -0.7935222, 3.465052, 1, 1, 1, 1, 1,
0.6466923, 0.705992, 0.1937373, 1, 1, 1, 1, 1,
0.6493195, -1.141859, 3.068245, 1, 1, 1, 1, 1,
0.6497725, 0.3904095, 0.420913, 1, 1, 1, 1, 1,
0.6520635, 0.50753, 0.9620966, 1, 1, 1, 1, 1,
0.6529067, -1.771366, 4.304887, 1, 1, 1, 1, 1,
0.6562096, 0.260687, 0.4725122, 1, 1, 1, 1, 1,
0.6584277, -0.1728811, 0.1595563, 1, 1, 1, 1, 1,
0.6675197, -2.1385, 5.226735, 1, 1, 1, 1, 1,
0.6717195, 1.348918, -0.6561467, 1, 1, 1, 1, 1,
0.6723703, 0.7284755, 3.662707, 0, 0, 1, 1, 1,
0.6803986, 1.313159, 0.7804432, 1, 0, 0, 1, 1,
0.6855889, -0.95492, 2.864161, 1, 0, 0, 1, 1,
0.6891601, -0.2016405, 0.8200503, 1, 0, 0, 1, 1,
0.692042, 0.4954079, -0.05088241, 1, 0, 0, 1, 1,
0.6944714, -0.8271174, 2.763222, 1, 0, 0, 1, 1,
0.6953881, 0.8340157, 2.915953, 0, 0, 0, 1, 1,
0.6970105, -1.75178, 3.807787, 0, 0, 0, 1, 1,
0.6984934, -1.51598, 4.164728, 0, 0, 0, 1, 1,
0.6987152, 0.7013654, 0.5332341, 0, 0, 0, 1, 1,
0.7007644, 0.4154808, 0.3988259, 0, 0, 0, 1, 1,
0.7047752, 0.9070534, -0.5222635, 0, 0, 0, 1, 1,
0.7092305, 0.753989, 0.4098997, 0, 0, 0, 1, 1,
0.7129625, -0.02958553, 3.918432, 1, 1, 1, 1, 1,
0.7145444, -2.148967, 3.415276, 1, 1, 1, 1, 1,
0.7213995, 0.1202111, -0.5633139, 1, 1, 1, 1, 1,
0.7236275, -0.3896015, 3.293401, 1, 1, 1, 1, 1,
0.7293144, 0.06969025, 1.229516, 1, 1, 1, 1, 1,
0.7310239, 0.09061552, 1.865118, 1, 1, 1, 1, 1,
0.7343844, -0.06730928, 2.407369, 1, 1, 1, 1, 1,
0.7357534, -3.323467, 1.969852, 1, 1, 1, 1, 1,
0.7362683, -0.09592292, 1.604493, 1, 1, 1, 1, 1,
0.7424853, -0.5098059, 2.390446, 1, 1, 1, 1, 1,
0.7535848, -0.5632406, 3.219698, 1, 1, 1, 1, 1,
0.7548735, 0.1101476, 1.478453, 1, 1, 1, 1, 1,
0.7568862, 0.351848, 0.6797032, 1, 1, 1, 1, 1,
0.7577648, 0.6235588, 0.4468475, 1, 1, 1, 1, 1,
0.7628324, 0.2950695, 2.194836, 1, 1, 1, 1, 1,
0.764153, -0.03664904, 1.310551, 0, 0, 1, 1, 1,
0.7652701, -1.161678, 2.2399, 1, 0, 0, 1, 1,
0.7669669, -0.6002883, 3.043503, 1, 0, 0, 1, 1,
0.7761274, 0.9032699, 0.06789795, 1, 0, 0, 1, 1,
0.7774909, 0.5851815, 0.0928054, 1, 0, 0, 1, 1,
0.7812014, 0.5443417, 1.608229, 1, 0, 0, 1, 1,
0.7824486, 1.165597, 2.640938, 0, 0, 0, 1, 1,
0.7869538, 1.435555, -2.246841, 0, 0, 0, 1, 1,
0.7905367, 1.726223, -0.1992076, 0, 0, 0, 1, 1,
0.7946846, -0.7347422, 1.649355, 0, 0, 0, 1, 1,
0.7972009, -0.7434157, 2.566266, 0, 0, 0, 1, 1,
0.8006396, 0.0239116, 4.174727, 0, 0, 0, 1, 1,
0.8045114, 0.08645456, 0.8564922, 0, 0, 0, 1, 1,
0.8054423, -0.1906791, 0.1757818, 1, 1, 1, 1, 1,
0.8083908, -0.6636386, 3.693675, 1, 1, 1, 1, 1,
0.8124056, -0.6169783, 2.435389, 1, 1, 1, 1, 1,
0.8133532, -0.1005199, 0.9237798, 1, 1, 1, 1, 1,
0.8143842, -0.1551061, 3.025296, 1, 1, 1, 1, 1,
0.8157768, 0.7207887, 1.839239, 1, 1, 1, 1, 1,
0.816539, -0.4195293, 2.30435, 1, 1, 1, 1, 1,
0.8221333, -0.3507141, 0.2940406, 1, 1, 1, 1, 1,
0.8253793, 1.587127, 1.59499, 1, 1, 1, 1, 1,
0.8264658, -0.8873652, 4.253945, 1, 1, 1, 1, 1,
0.827362, -0.6251, 2.455811, 1, 1, 1, 1, 1,
0.8335108, -1.363822, 1.845958, 1, 1, 1, 1, 1,
0.8344267, 0.06523569, 1.236871, 1, 1, 1, 1, 1,
0.8450271, 1.108208, 1.792906, 1, 1, 1, 1, 1,
0.8460899, -0.02341173, 0.5128946, 1, 1, 1, 1, 1,
0.847917, 0.1127134, 2.274666, 0, 0, 1, 1, 1,
0.8575898, -1.480083, 3.446621, 1, 0, 0, 1, 1,
0.8580539, -0.2884592, 1.257573, 1, 0, 0, 1, 1,
0.8609492, -0.8209682, 3.393754, 1, 0, 0, 1, 1,
0.8623701, -1.009843, 1.760902, 1, 0, 0, 1, 1,
0.8661364, -0.6186836, 1.312698, 1, 0, 0, 1, 1,
0.8666795, 1.576294, -0.1824325, 0, 0, 0, 1, 1,
0.8676106, -0.7740591, 3.750163, 0, 0, 0, 1, 1,
0.8681175, 0.03303688, -0.03002974, 0, 0, 0, 1, 1,
0.8876656, -0.6977427, 1.763199, 0, 0, 0, 1, 1,
0.8968657, -1.113254, 2.205757, 0, 0, 0, 1, 1,
0.8978823, 0.4890709, 1.205063, 0, 0, 0, 1, 1,
0.901934, -0.2898043, 2.310782, 0, 0, 0, 1, 1,
0.9025411, 0.9663519, 1.364517, 1, 1, 1, 1, 1,
0.9026207, 0.6933869, 2.040897, 1, 1, 1, 1, 1,
0.9027067, -1.174138, 2.658461, 1, 1, 1, 1, 1,
0.9109343, 1.0165, 0.1890869, 1, 1, 1, 1, 1,
0.9109855, -0.7053424, 1.861267, 1, 1, 1, 1, 1,
0.9371163, 1.464902, 0.4463199, 1, 1, 1, 1, 1,
0.9405955, 1.183443, 0.5169252, 1, 1, 1, 1, 1,
0.9782158, 0.8848327, 0.7138366, 1, 1, 1, 1, 1,
0.9784618, 0.7082208, 1.324736, 1, 1, 1, 1, 1,
0.9791172, 1.242167, 0.1447189, 1, 1, 1, 1, 1,
0.9858107, 0.724964, 1.605118, 1, 1, 1, 1, 1,
0.9932697, 0.08917894, 1.449675, 1, 1, 1, 1, 1,
0.994167, 0.6845112, 0.72491, 1, 1, 1, 1, 1,
0.9961047, -0.2566576, 1.257509, 1, 1, 1, 1, 1,
1.000044, 0.6833997, 0.5863816, 1, 1, 1, 1, 1,
1.000531, 0.8762008, -0.3730825, 0, 0, 1, 1, 1,
1.001192, 0.662639, 0.8192266, 1, 0, 0, 1, 1,
1.00489, 0.5163813, 0.8292006, 1, 0, 0, 1, 1,
1.00552, 0.2141831, -0.7861145, 1, 0, 0, 1, 1,
1.00959, -1.367592, 2.594702, 1, 0, 0, 1, 1,
1.012311, -0.3544209, 0.8664657, 1, 0, 0, 1, 1,
1.016388, -2.060457, 1.456184, 0, 0, 0, 1, 1,
1.019831, -1.372786, 1.862518, 0, 0, 0, 1, 1,
1.024449, 0.5634797, 3.023571, 0, 0, 0, 1, 1,
1.027396, 0.9369616, -0.2565131, 0, 0, 0, 1, 1,
1.034338, -0.7661396, 2.610247, 0, 0, 0, 1, 1,
1.035629, -0.7278467, 2.909116, 0, 0, 0, 1, 1,
1.04628, -1.618834, -0.0617089, 0, 0, 0, 1, 1,
1.048979, 0.3852515, 1.259651, 1, 1, 1, 1, 1,
1.051213, -0.9722337, 2.8521, 1, 1, 1, 1, 1,
1.072997, -0.8040877, 3.513402, 1, 1, 1, 1, 1,
1.073765, 2.866295, -0.6402672, 1, 1, 1, 1, 1,
1.078208, -0.5993668, 3.418131, 1, 1, 1, 1, 1,
1.090697, 1.038819, 0.7413161, 1, 1, 1, 1, 1,
1.091252, -1.741809, 4.290457, 1, 1, 1, 1, 1,
1.092422, 0.6884957, 0.3101891, 1, 1, 1, 1, 1,
1.10776, 1.253265, 1.14554, 1, 1, 1, 1, 1,
1.116869, -0.3133989, 2.197401, 1, 1, 1, 1, 1,
1.118755, 0.6204027, 1.128266, 1, 1, 1, 1, 1,
1.119885, 0.7606671, 1.150027, 1, 1, 1, 1, 1,
1.12047, -0.1921662, 1.437804, 1, 1, 1, 1, 1,
1.127687, 0.1305648, 0.8693497, 1, 1, 1, 1, 1,
1.134276, -0.07497153, 3.00357, 1, 1, 1, 1, 1,
1.141142, 1.704523, -0.3931381, 0, 0, 1, 1, 1,
1.148184, -0.001760875, 2.219413, 1, 0, 0, 1, 1,
1.148889, -0.2348758, 2.474982, 1, 0, 0, 1, 1,
1.149995, -1.091222, 1.910953, 1, 0, 0, 1, 1,
1.156557, 0.9482059, 1.233334, 1, 0, 0, 1, 1,
1.168517, -0.6151091, 3.086004, 1, 0, 0, 1, 1,
1.180575, -0.2849773, 2.626268, 0, 0, 0, 1, 1,
1.191506, -0.3066638, 2.352496, 0, 0, 0, 1, 1,
1.192015, -0.5298116, 1.285371, 0, 0, 0, 1, 1,
1.1996, 0.6444116, 0.8019184, 0, 0, 0, 1, 1,
1.206978, 0.5426207, 0.1385354, 0, 0, 0, 1, 1,
1.208854, 1.644401, -0.6669894, 0, 0, 0, 1, 1,
1.210463, 0.8073856, 2.224204, 0, 0, 0, 1, 1,
1.214537, 0.4176092, 0.1613623, 1, 1, 1, 1, 1,
1.216795, -0.4315832, 0.843709, 1, 1, 1, 1, 1,
1.217278, 1.183318, 1.791846, 1, 1, 1, 1, 1,
1.217936, -0.03632788, 0.6159875, 1, 1, 1, 1, 1,
1.233066, -0.3331363, 1.31471, 1, 1, 1, 1, 1,
1.235431, -0.6918917, 2.682714, 1, 1, 1, 1, 1,
1.236051, 0.502717, 1.574988, 1, 1, 1, 1, 1,
1.241942, -0.8607317, 1.487627, 1, 1, 1, 1, 1,
1.246132, -0.5060528, 1.51002, 1, 1, 1, 1, 1,
1.246516, -0.6097929, 1.870662, 1, 1, 1, 1, 1,
1.247771, 0.3061662, 2.330644, 1, 1, 1, 1, 1,
1.252311, -1.047337, 2.992777, 1, 1, 1, 1, 1,
1.27331, 1.448761, 2.089863, 1, 1, 1, 1, 1,
1.275618, -0.93081, 2.832682, 1, 1, 1, 1, 1,
1.278865, -0.3357794, 1.22422, 1, 1, 1, 1, 1,
1.285849, 0.7034874, 1.473875, 0, 0, 1, 1, 1,
1.287494, 0.8930822, 2.586572, 1, 0, 0, 1, 1,
1.292518, 0.5468993, 0.2979439, 1, 0, 0, 1, 1,
1.305672, -1.653052, 4.150219, 1, 0, 0, 1, 1,
1.309316, 0.6291937, 1.021894, 1, 0, 0, 1, 1,
1.314922, 0.4811465, 0.0454345, 1, 0, 0, 1, 1,
1.31633, 0.5738041, -0.2160317, 0, 0, 0, 1, 1,
1.319713, 0.5779755, 1.155438, 0, 0, 0, 1, 1,
1.321546, -0.4473464, 4.286067, 0, 0, 0, 1, 1,
1.324003, -0.2036231, 2.848263, 0, 0, 0, 1, 1,
1.327371, 1.040477, 1.34156, 0, 0, 0, 1, 1,
1.327425, -0.1474425, 3.191679, 0, 0, 0, 1, 1,
1.328842, -1.642551, 0.6456475, 0, 0, 0, 1, 1,
1.329836, -0.09587353, 0.4449532, 1, 1, 1, 1, 1,
1.344391, 0.801791, -0.01896432, 1, 1, 1, 1, 1,
1.351061, 0.9178509, 1.665668, 1, 1, 1, 1, 1,
1.362386, -1.082551, 2.806317, 1, 1, 1, 1, 1,
1.363272, -0.7544168, 1.350753, 1, 1, 1, 1, 1,
1.36836, 2.757248, -0.06125949, 1, 1, 1, 1, 1,
1.382805, 0.4824115, 0.3206472, 1, 1, 1, 1, 1,
1.399893, 0.6133012, 1.161664, 1, 1, 1, 1, 1,
1.400047, -0.2839083, 2.215826, 1, 1, 1, 1, 1,
1.40161, 0.3339198, -1.670418, 1, 1, 1, 1, 1,
1.406523, 0.9251236, 0.5217638, 1, 1, 1, 1, 1,
1.412013, -1.067504, 1.64694, 1, 1, 1, 1, 1,
1.419132, 0.816348, 0.6258086, 1, 1, 1, 1, 1,
1.424102, -2.219305, 1.550804, 1, 1, 1, 1, 1,
1.426272, -0.218511, 2.183603, 1, 1, 1, 1, 1,
1.429984, -1.816305, 1.371832, 0, 0, 1, 1, 1,
1.433469, 0.0005365625, 1.41064, 1, 0, 0, 1, 1,
1.441288, 0.8482088, 0.9453338, 1, 0, 0, 1, 1,
1.451512, 0.3982627, 0.0200605, 1, 0, 0, 1, 1,
1.452083, 0.6707745, 0.4540258, 1, 0, 0, 1, 1,
1.456547, -1.14079, 2.302857, 1, 0, 0, 1, 1,
1.4654, 1.444555, 0.9235112, 0, 0, 0, 1, 1,
1.466296, 1.039405, 1.120721, 0, 0, 0, 1, 1,
1.492595, -0.5173052, 2.655432, 0, 0, 0, 1, 1,
1.500625, -1.299502, 1.258594, 0, 0, 0, 1, 1,
1.501949, -0.7241528, 1.147954, 0, 0, 0, 1, 1,
1.503737, -1.265084, 0.1513877, 0, 0, 0, 1, 1,
1.508913, -0.9354954, 0.8025462, 0, 0, 0, 1, 1,
1.51034, -0.8097973, 3.44603, 1, 1, 1, 1, 1,
1.516761, 0.006425142, 1.398079, 1, 1, 1, 1, 1,
1.531913, 1.570261, 1.774169, 1, 1, 1, 1, 1,
1.535272, 0.4809189, -0.2298034, 1, 1, 1, 1, 1,
1.559436, 1.45959, -0.9469092, 1, 1, 1, 1, 1,
1.563419, -1.820687, 2.684719, 1, 1, 1, 1, 1,
1.576358, -0.5364518, 1.921053, 1, 1, 1, 1, 1,
1.581618, -0.6128041, 1.588391, 1, 1, 1, 1, 1,
1.600286, 1.683841, 1.113098, 1, 1, 1, 1, 1,
1.604625, 0.5979982, 2.53001, 1, 1, 1, 1, 1,
1.650838, -0.08044208, 1.877316, 1, 1, 1, 1, 1,
1.652678, 1.57134, 2.861438, 1, 1, 1, 1, 1,
1.661093, -2.035625, 3.313435, 1, 1, 1, 1, 1,
1.67326, 1.219291, 0.148551, 1, 1, 1, 1, 1,
1.67473, -1.37891, 0.5122511, 1, 1, 1, 1, 1,
1.681808, -0.03188191, 1.795519, 0, 0, 1, 1, 1,
1.685813, 0.2004735, 1.10682, 1, 0, 0, 1, 1,
1.720532, 0.6304007, -0.01203825, 1, 0, 0, 1, 1,
1.727508, 1.113669, -1.156629, 1, 0, 0, 1, 1,
1.740885, -0.1345077, 0.2979153, 1, 0, 0, 1, 1,
1.744757, 0.6565304, 0.005519466, 1, 0, 0, 1, 1,
1.746523, -2.543946, 3.759966, 0, 0, 0, 1, 1,
1.749787, -0.2088376, 2.102272, 0, 0, 0, 1, 1,
1.760451, -2.313384, 3.429345, 0, 0, 0, 1, 1,
1.783671, -0.1398305, 0.3506961, 0, 0, 0, 1, 1,
1.785877, 2.112881, 0.9891568, 0, 0, 0, 1, 1,
1.80661, 0.244686, 0.2676382, 0, 0, 0, 1, 1,
1.809247, -0.2651123, 1.671364, 0, 0, 0, 1, 1,
1.830728, 2.588605, 0.2575185, 1, 1, 1, 1, 1,
1.843444, -0.775695, 1.858413, 1, 1, 1, 1, 1,
1.859631, 1.269527, 0.8528658, 1, 1, 1, 1, 1,
1.867556, 0.3342445, 1.049176, 1, 1, 1, 1, 1,
1.872271, 1.265383, 1.622092, 1, 1, 1, 1, 1,
1.873553, 0.8359947, 1.94141, 1, 1, 1, 1, 1,
1.894917, 0.1129053, 2.146267, 1, 1, 1, 1, 1,
1.914366, -0.4398524, 1.968401, 1, 1, 1, 1, 1,
1.939159, 0.04142066, 3.241333, 1, 1, 1, 1, 1,
1.983621, 0.1409134, 1.024302, 1, 1, 1, 1, 1,
1.989824, -0.9755324, 1.013801, 1, 1, 1, 1, 1,
2.010837, -0.2778099, 1.217565, 1, 1, 1, 1, 1,
2.045758, -0.9297467, 4.192809, 1, 1, 1, 1, 1,
2.051165, 1.013154, 1.503015, 1, 1, 1, 1, 1,
2.051722, -0.6685257, 0.810798, 1, 1, 1, 1, 1,
2.065874, 0.168427, 1.869472, 0, 0, 1, 1, 1,
2.108059, 0.2367614, 1.219313, 1, 0, 0, 1, 1,
2.114691, 0.07192373, 1.032683, 1, 0, 0, 1, 1,
2.133006, 0.334798, 0.5952118, 1, 0, 0, 1, 1,
2.152015, -0.9430574, 2.853013, 1, 0, 0, 1, 1,
2.176775, 0.3046899, 0.7464619, 1, 0, 0, 1, 1,
2.207281, 0.2491692, 1.810679, 0, 0, 0, 1, 1,
2.223429, 0.780808, 1.656084, 0, 0, 0, 1, 1,
2.347469, -1.265477, 0.5805073, 0, 0, 0, 1, 1,
2.451927, -2.459575, 2.375092, 0, 0, 0, 1, 1,
2.534588, -0.3176721, 3.623322, 0, 0, 0, 1, 1,
2.663326, 1.091011, 2.506052, 0, 0, 0, 1, 1,
2.680034, -0.3571236, 1.521245, 0, 0, 0, 1, 1,
2.694133, 1.056499, 0.8715017, 1, 1, 1, 1, 1,
2.707694, -0.2883652, 0.3140275, 1, 1, 1, 1, 1,
2.863357, -0.6638831, 0.3925517, 1, 1, 1, 1, 1,
3.021389, -1.056421, 1.240048, 1, 1, 1, 1, 1,
3.063317, -0.1614669, 1.93487, 1, 1, 1, 1, 1,
3.164305, 0.05465765, 0.8718765, 1, 1, 1, 1, 1,
3.419501, 0.04262048, 0.02646029, 1, 1, 1, 1, 1
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
var radius = 9.532539;
var distance = 33.48264;
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
mvMatrix.translate( -0.3634729, -0.1048808, 0.02122307 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48264);
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
