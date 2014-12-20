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
-3.241411, 0.5079346, -1.124036, 1, 0, 0, 1,
-3.041891, -0.2924085, -1.590421, 1, 0.007843138, 0, 1,
-2.854932, -0.6056688, -0.6481364, 1, 0.01176471, 0, 1,
-2.819102, 0.5677001, -1.643142, 1, 0.01960784, 0, 1,
-2.666526, -0.5481454, -3.309514, 1, 0.02352941, 0, 1,
-2.655908, -2.37575, -2.876889, 1, 0.03137255, 0, 1,
-2.595181, 1.749554, -3.715029, 1, 0.03529412, 0, 1,
-2.556098, -0.303113, -3.160714, 1, 0.04313726, 0, 1,
-2.531935, -0.7927666, -1.174887, 1, 0.04705882, 0, 1,
-2.477933, -1.569461, -0.9045547, 1, 0.05490196, 0, 1,
-2.422685, -0.5129477, -2.640658, 1, 0.05882353, 0, 1,
-2.406776, 0.04205985, -0.2521177, 1, 0.06666667, 0, 1,
-2.406775, 1.682189, -1.236052, 1, 0.07058824, 0, 1,
-2.343127, 0.7199422, -0.2978214, 1, 0.07843138, 0, 1,
-2.333263, 0.3537025, -3.242226, 1, 0.08235294, 0, 1,
-2.295452, -0.6969606, -1.216177, 1, 0.09019608, 0, 1,
-2.292742, 0.7169981, -0.1340574, 1, 0.09411765, 0, 1,
-2.181037, -0.3662154, -2.559914, 1, 0.1019608, 0, 1,
-2.131521, -0.445134, -0.3219092, 1, 0.1098039, 0, 1,
-2.124676, 0.0233122, -1.553459, 1, 0.1137255, 0, 1,
-2.105437, 1.089766, 1.630826, 1, 0.1215686, 0, 1,
-2.092269, 0.4376358, 0.4208108, 1, 0.1254902, 0, 1,
-2.078722, 0.3759954, -1.07747, 1, 0.1333333, 0, 1,
-2.05797, -0.05969336, -2.490465, 1, 0.1372549, 0, 1,
-2.03669, 0.3699464, -0.1647991, 1, 0.145098, 0, 1,
-2.025102, 1.401821, -1.956922, 1, 0.1490196, 0, 1,
-1.991364, -0.1325823, -2.05076, 1, 0.1568628, 0, 1,
-1.985105, -1.043501, -1.071253, 1, 0.1607843, 0, 1,
-1.984304, 1.732576, -1.381152, 1, 0.1686275, 0, 1,
-1.953938, 0.6268602, 0.6315939, 1, 0.172549, 0, 1,
-1.923149, -1.408197, -1.536523, 1, 0.1803922, 0, 1,
-1.879875, 0.449248, -2.201972, 1, 0.1843137, 0, 1,
-1.862463, 0.3203909, -1.967835, 1, 0.1921569, 0, 1,
-1.840963, -0.5463277, -1.309608, 1, 0.1960784, 0, 1,
-1.835097, 1.737073, -1.287219, 1, 0.2039216, 0, 1,
-1.826269, -1.019654, -2.72372, 1, 0.2117647, 0, 1,
-1.804532, 2.641688, -1.476855, 1, 0.2156863, 0, 1,
-1.79545, -0.5420712, -1.368463, 1, 0.2235294, 0, 1,
-1.776715, -0.7776886, -4.459974, 1, 0.227451, 0, 1,
-1.760516, 0.6867784, -1.750891, 1, 0.2352941, 0, 1,
-1.736835, 0.819912, -2.705558, 1, 0.2392157, 0, 1,
-1.728333, -0.6727093, -1.839669, 1, 0.2470588, 0, 1,
-1.71738, 1.473048, -1.088714, 1, 0.2509804, 0, 1,
-1.715582, -0.8148381, -1.014553, 1, 0.2588235, 0, 1,
-1.674865, -1.116886, -2.958972, 1, 0.2627451, 0, 1,
-1.673089, -0.1304985, -1.444416, 1, 0.2705882, 0, 1,
-1.665786, 1.274938, -1.655214, 1, 0.2745098, 0, 1,
-1.663784, -1.776168, -2.422519, 1, 0.282353, 0, 1,
-1.645376, 0.03368473, -0.9012931, 1, 0.2862745, 0, 1,
-1.608166, 0.304189, -0.4848891, 1, 0.2941177, 0, 1,
-1.595039, 0.6054949, 0.1775551, 1, 0.3019608, 0, 1,
-1.590478, 2.1394, 0.7260311, 1, 0.3058824, 0, 1,
-1.580472, 0.5357376, -3.765253, 1, 0.3137255, 0, 1,
-1.567777, -1.549579, -3.7156, 1, 0.3176471, 0, 1,
-1.565123, -0.7478154, -1.814171, 1, 0.3254902, 0, 1,
-1.554903, -0.9921833, -2.829547, 1, 0.3294118, 0, 1,
-1.551203, -0.03313111, -1.782127, 1, 0.3372549, 0, 1,
-1.549791, -0.00277217, -0.7984097, 1, 0.3411765, 0, 1,
-1.539833, 0.397864, -1.140356, 1, 0.3490196, 0, 1,
-1.537197, -1.319067, -2.47897, 1, 0.3529412, 0, 1,
-1.530718, 0.1581898, -3.160979, 1, 0.3607843, 0, 1,
-1.496665, 0.451686, -1.630499, 1, 0.3647059, 0, 1,
-1.496095, -0.7021635, -1.399033, 1, 0.372549, 0, 1,
-1.495143, -0.7934225, -2.314386, 1, 0.3764706, 0, 1,
-1.490837, -0.1852781, -2.178669, 1, 0.3843137, 0, 1,
-1.489911, 0.2421251, 0.01921802, 1, 0.3882353, 0, 1,
-1.477051, 0.3578474, -0.008651661, 1, 0.3960784, 0, 1,
-1.458905, 0.1916667, -1.106471, 1, 0.4039216, 0, 1,
-1.457252, 1.000199, -0.7154072, 1, 0.4078431, 0, 1,
-1.452545, -0.4701264, -1.554767, 1, 0.4156863, 0, 1,
-1.43574, 0.4891813, -1.705651, 1, 0.4196078, 0, 1,
-1.433944, 1.026765, -0.9215951, 1, 0.427451, 0, 1,
-1.432955, -0.2065877, -0.3066028, 1, 0.4313726, 0, 1,
-1.432699, -0.1040071, -1.249143, 1, 0.4392157, 0, 1,
-1.430058, -0.2847236, -1.432315, 1, 0.4431373, 0, 1,
-1.417767, 0.7083794, -0.1925778, 1, 0.4509804, 0, 1,
-1.41147, 1.560012, 0.3250223, 1, 0.454902, 0, 1,
-1.411168, 0.2345102, -1.230059, 1, 0.4627451, 0, 1,
-1.39927, -0.7023818, -1.233725, 1, 0.4666667, 0, 1,
-1.399012, -0.1826051, -1.471607, 1, 0.4745098, 0, 1,
-1.378949, 0.6737023, -1.059731, 1, 0.4784314, 0, 1,
-1.375133, 0.4936537, -1.001828, 1, 0.4862745, 0, 1,
-1.366686, -0.2980402, 0.02908497, 1, 0.4901961, 0, 1,
-1.356341, 1.190298, -1.465668, 1, 0.4980392, 0, 1,
-1.356013, -0.02343046, -2.430453, 1, 0.5058824, 0, 1,
-1.334275, 1.293421, 2.133342, 1, 0.509804, 0, 1,
-1.332153, -1.832985, -1.783383, 1, 0.5176471, 0, 1,
-1.327919, 0.972145, -1.979579, 1, 0.5215687, 0, 1,
-1.32358, 1.542012, -1.094172, 1, 0.5294118, 0, 1,
-1.30625, -1.821251, -2.547427, 1, 0.5333334, 0, 1,
-1.29043, -1.125394, -2.805016, 1, 0.5411765, 0, 1,
-1.280345, 1.804309, -0.2318493, 1, 0.5450981, 0, 1,
-1.278127, 0.4067193, -1.970123, 1, 0.5529412, 0, 1,
-1.265945, -0.4607801, -1.423734, 1, 0.5568628, 0, 1,
-1.264453, -0.4186211, -1.379165, 1, 0.5647059, 0, 1,
-1.263308, -1.538583, -1.547608, 1, 0.5686275, 0, 1,
-1.252337, -1.483732, -2.463597, 1, 0.5764706, 0, 1,
-1.250022, -0.6995466, -2.017234, 1, 0.5803922, 0, 1,
-1.247383, -0.9308921, -2.691955, 1, 0.5882353, 0, 1,
-1.240457, 0.3442884, -1.103011, 1, 0.5921569, 0, 1,
-1.2398, -0.4955825, -1.661823, 1, 0.6, 0, 1,
-1.23979, -0.03324997, -4.099959, 1, 0.6078432, 0, 1,
-1.222054, 0.5873806, -0.6553978, 1, 0.6117647, 0, 1,
-1.221137, -0.771185, -1.935004, 1, 0.6196079, 0, 1,
-1.217483, -0.2221377, -2.78531, 1, 0.6235294, 0, 1,
-1.213586, 0.3573041, -0.5196693, 1, 0.6313726, 0, 1,
-1.209588, -1.075359, -2.303209, 1, 0.6352941, 0, 1,
-1.202089, -1.485588, -1.87536, 1, 0.6431373, 0, 1,
-1.186144, -1.584918, -3.527077, 1, 0.6470588, 0, 1,
-1.18303, -1.446002, -3.385309, 1, 0.654902, 0, 1,
-1.182632, 0.7056258, -0.98975, 1, 0.6588235, 0, 1,
-1.17759, 0.2033583, -2.202999, 1, 0.6666667, 0, 1,
-1.174357, -0.03832371, -0.3897264, 1, 0.6705883, 0, 1,
-1.173386, -0.7726264, -2.199298, 1, 0.6784314, 0, 1,
-1.157987, -0.4056793, -0.5067979, 1, 0.682353, 0, 1,
-1.145973, 0.2152276, 0.3440761, 1, 0.6901961, 0, 1,
-1.13602, 1.697662, 0.8005393, 1, 0.6941177, 0, 1,
-1.128008, 0.2275883, -0.1837247, 1, 0.7019608, 0, 1,
-1.119651, 1.755604, -0.1393185, 1, 0.7098039, 0, 1,
-1.109427, -0.5811787, -2.019455, 1, 0.7137255, 0, 1,
-1.104081, 0.1272147, -0.6315065, 1, 0.7215686, 0, 1,
-1.099238, 0.4900181, 0.2365808, 1, 0.7254902, 0, 1,
-1.094751, 0.4594275, 0.5702596, 1, 0.7333333, 0, 1,
-1.094129, -0.404082, -1.32786, 1, 0.7372549, 0, 1,
-1.093978, -0.1809922, -2.53584, 1, 0.7450981, 0, 1,
-1.086016, -0.3163139, -2.802131, 1, 0.7490196, 0, 1,
-1.078808, -0.7299768, -2.89576, 1, 0.7568628, 0, 1,
-1.073317, -0.4432004, -2.726313, 1, 0.7607843, 0, 1,
-1.052918, 0.6174866, -2.798628, 1, 0.7686275, 0, 1,
-1.052811, 0.4799212, -0.8087344, 1, 0.772549, 0, 1,
-1.051748, 1.885693, 0.6885632, 1, 0.7803922, 0, 1,
-1.05014, -1.567383, -3.403394, 1, 0.7843137, 0, 1,
-1.04701, -0.2662499, -0.9455664, 1, 0.7921569, 0, 1,
-1.040557, -0.9631513, -1.110569, 1, 0.7960784, 0, 1,
-1.033151, 0.1822495, -2.928797, 1, 0.8039216, 0, 1,
-1.027564, 1.764121, -2.044051, 1, 0.8117647, 0, 1,
-1.017206, -0.07416058, -2.367059, 1, 0.8156863, 0, 1,
-1.00447, 0.1604276, -1.815764, 1, 0.8235294, 0, 1,
-0.9909098, -0.4395892, -1.848832, 1, 0.827451, 0, 1,
-0.9898131, -0.6298855, -2.127838, 1, 0.8352941, 0, 1,
-0.9885437, -0.3268139, -2.575592, 1, 0.8392157, 0, 1,
-0.9835033, -0.1217627, -0.9695331, 1, 0.8470588, 0, 1,
-0.9793233, 0.5608032, -2.462894, 1, 0.8509804, 0, 1,
-0.9786089, -1.815996, -3.168716, 1, 0.8588235, 0, 1,
-0.9778967, 0.5431542, -1.165834, 1, 0.8627451, 0, 1,
-0.9760932, 1.223817, -0.6478966, 1, 0.8705882, 0, 1,
-0.9754489, -0.5263532, -0.549893, 1, 0.8745098, 0, 1,
-0.9751248, -0.7708344, -2.033712, 1, 0.8823529, 0, 1,
-0.970914, -0.1328786, -2.471089, 1, 0.8862745, 0, 1,
-0.9667868, -1.113628, -4.299936, 1, 0.8941177, 0, 1,
-0.9604907, -0.5883861, -2.872006, 1, 0.8980392, 0, 1,
-0.9579287, -0.2231531, -1.812633, 1, 0.9058824, 0, 1,
-0.9477256, -1.587047, -2.003495, 1, 0.9137255, 0, 1,
-0.934394, -0.7417642, -3.521149, 1, 0.9176471, 0, 1,
-0.9340916, -0.8813552, -2.585085, 1, 0.9254902, 0, 1,
-0.9272603, 0.3116637, -0.8208165, 1, 0.9294118, 0, 1,
-0.925132, -0.1324289, -1.691758, 1, 0.9372549, 0, 1,
-0.919086, 0.05957522, -1.746814, 1, 0.9411765, 0, 1,
-0.9145699, 0.7870073, 0.2902867, 1, 0.9490196, 0, 1,
-0.9106389, -0.8844525, -2.036772, 1, 0.9529412, 0, 1,
-0.9047881, 1.453199, -1.256028, 1, 0.9607843, 0, 1,
-0.9010018, 0.7533665, 0.2042911, 1, 0.9647059, 0, 1,
-0.8964358, -0.7049911, -4.128306, 1, 0.972549, 0, 1,
-0.8944296, 1.06435, 0.1427334, 1, 0.9764706, 0, 1,
-0.8907973, -1.53514, -3.244447, 1, 0.9843137, 0, 1,
-0.8881234, -0.7109897, -1.366888, 1, 0.9882353, 0, 1,
-0.8851254, 1.755414, 0.4285369, 1, 0.9960784, 0, 1,
-0.8818893, 0.8977637, -0.8567525, 0.9960784, 1, 0, 1,
-0.875524, 0.2966502, -1.87992, 0.9921569, 1, 0, 1,
-0.874788, 0.4099831, 0.1438534, 0.9843137, 1, 0, 1,
-0.8709638, 1.388915, -0.6040359, 0.9803922, 1, 0, 1,
-0.8709017, 1.160146, -1.476741, 0.972549, 1, 0, 1,
-0.8703374, -0.7493018, -2.81792, 0.9686275, 1, 0, 1,
-0.8697792, 0.6329578, -0.6259248, 0.9607843, 1, 0, 1,
-0.8668616, 0.4830363, -2.106688, 0.9568627, 1, 0, 1,
-0.8626696, -1.802965, -3.509595, 0.9490196, 1, 0, 1,
-0.8611225, 1.332702, -1.664227, 0.945098, 1, 0, 1,
-0.8599349, -1.431416, -2.950158, 0.9372549, 1, 0, 1,
-0.8575494, 1.527068, -1.736724, 0.9333333, 1, 0, 1,
-0.85687, 0.6192521, -1.495569, 0.9254902, 1, 0, 1,
-0.8567625, 0.6523527, -2.359518, 0.9215686, 1, 0, 1,
-0.8543848, 1.87166, 0.4920384, 0.9137255, 1, 0, 1,
-0.8516175, -1.096707, -1.29437, 0.9098039, 1, 0, 1,
-0.8507788, 0.198882, -1.581106, 0.9019608, 1, 0, 1,
-0.849803, -0.881781, -1.290239, 0.8941177, 1, 0, 1,
-0.8467209, -1.606081, -1.051345, 0.8901961, 1, 0, 1,
-0.839335, -0.4522772, -1.886666, 0.8823529, 1, 0, 1,
-0.8318945, 0.9753109, 0.2526043, 0.8784314, 1, 0, 1,
-0.8160781, -0.001810724, -1.41795, 0.8705882, 1, 0, 1,
-0.8140665, 1.491408, 0.2713224, 0.8666667, 1, 0, 1,
-0.8102248, 1.104249, -0.5745389, 0.8588235, 1, 0, 1,
-0.8092482, -0.0350181, -0.2693899, 0.854902, 1, 0, 1,
-0.8054017, -0.3875464, -0.4784066, 0.8470588, 1, 0, 1,
-0.8023923, 0.2489271, -1.195973, 0.8431373, 1, 0, 1,
-0.7993308, -0.758642, -1.985796, 0.8352941, 1, 0, 1,
-0.7949862, 0.1806549, -1.923895, 0.8313726, 1, 0, 1,
-0.7911174, -1.673883, -2.086926, 0.8235294, 1, 0, 1,
-0.7898605, 2.601207, -0.1930411, 0.8196079, 1, 0, 1,
-0.7807965, 0.2054817, -2.309778, 0.8117647, 1, 0, 1,
-0.7805126, -1.305615, -2.320779, 0.8078431, 1, 0, 1,
-0.7792037, 2.028141, 0.09921427, 0.8, 1, 0, 1,
-0.7791885, 0.4467975, -1.942278, 0.7921569, 1, 0, 1,
-0.7690119, 0.7659896, -2.707355, 0.7882353, 1, 0, 1,
-0.7529163, -0.3893294, -1.753636, 0.7803922, 1, 0, 1,
-0.75227, 0.1084396, -3.274018, 0.7764706, 1, 0, 1,
-0.7518479, -0.6672089, -0.2282169, 0.7686275, 1, 0, 1,
-0.7511673, 0.6296682, 0.4470526, 0.7647059, 1, 0, 1,
-0.7504743, 0.848608, -2.529609, 0.7568628, 1, 0, 1,
-0.7475351, 0.5272912, 0.3580295, 0.7529412, 1, 0, 1,
-0.7454913, -2.100097, -2.194759, 0.7450981, 1, 0, 1,
-0.7438792, -0.8439101, -1.589501, 0.7411765, 1, 0, 1,
-0.7357825, 0.3976216, -0.8953629, 0.7333333, 1, 0, 1,
-0.7336558, 0.1971546, -2.121241, 0.7294118, 1, 0, 1,
-0.7294022, -2.384583, -2.401843, 0.7215686, 1, 0, 1,
-0.7250802, 0.7461563, -0.6664671, 0.7176471, 1, 0, 1,
-0.7165513, -0.6695062, -2.315873, 0.7098039, 1, 0, 1,
-0.7156217, 0.7691861, 0.354731, 0.7058824, 1, 0, 1,
-0.7123342, -0.1199038, -1.129811, 0.6980392, 1, 0, 1,
-0.7098506, -0.4781069, -1.927792, 0.6901961, 1, 0, 1,
-0.7071524, 0.4865915, -1.921222, 0.6862745, 1, 0, 1,
-0.7058286, -1.192962, -3.078371, 0.6784314, 1, 0, 1,
-0.7030271, -1.442198, -3.188523, 0.6745098, 1, 0, 1,
-0.702224, 1.00695, -0.3654867, 0.6666667, 1, 0, 1,
-0.695952, 0.4280633, -1.016191, 0.6627451, 1, 0, 1,
-0.6936508, -1.102139, -2.148141, 0.654902, 1, 0, 1,
-0.6869943, 0.699725, -2.09503, 0.6509804, 1, 0, 1,
-0.6839134, -0.03238732, -1.689181, 0.6431373, 1, 0, 1,
-0.6816605, 0.495434, -1.784926, 0.6392157, 1, 0, 1,
-0.6807527, -0.4946733, -2.518208, 0.6313726, 1, 0, 1,
-0.6804067, -0.2650216, -2.343314, 0.627451, 1, 0, 1,
-0.6753124, 0.5132015, -2.586281, 0.6196079, 1, 0, 1,
-0.6711497, -0.7203867, -1.560215, 0.6156863, 1, 0, 1,
-0.6707314, -0.6639557, -2.026119, 0.6078432, 1, 0, 1,
-0.6638298, 0.09577323, -2.119212, 0.6039216, 1, 0, 1,
-0.6574171, -0.3129801, -3.47078, 0.5960785, 1, 0, 1,
-0.6570758, 1.064617, -0.8438595, 0.5882353, 1, 0, 1,
-0.6519175, 0.3451253, -1.719048, 0.5843138, 1, 0, 1,
-0.6518815, -1.717102, -3.168849, 0.5764706, 1, 0, 1,
-0.6506335, 0.3136005, -0.9951298, 0.572549, 1, 0, 1,
-0.6475856, -0.8036333, -3.881794, 0.5647059, 1, 0, 1,
-0.6360908, -1.113411, -3.542988, 0.5607843, 1, 0, 1,
-0.6354153, 2.380641, -1.448361, 0.5529412, 1, 0, 1,
-0.6301993, 1.621279, 1.256237, 0.5490196, 1, 0, 1,
-0.6294498, -0.9052116, -4.207777, 0.5411765, 1, 0, 1,
-0.6259457, 0.919044, -1.296504, 0.5372549, 1, 0, 1,
-0.6223941, 0.06376347, -1.48489, 0.5294118, 1, 0, 1,
-0.6208647, 1.165117, -0.940627, 0.5254902, 1, 0, 1,
-0.6204394, 0.9427904, -1.141324, 0.5176471, 1, 0, 1,
-0.6202049, -0.4223685, -1.33593, 0.5137255, 1, 0, 1,
-0.6198778, -0.6341541, -1.589004, 0.5058824, 1, 0, 1,
-0.6180907, -0.4634389, -2.604802, 0.5019608, 1, 0, 1,
-0.6168049, -0.008305438, -0.7284747, 0.4941176, 1, 0, 1,
-0.6151463, 0.4267692, -0.520292, 0.4862745, 1, 0, 1,
-0.6066967, 1.355822, -1.293177, 0.4823529, 1, 0, 1,
-0.5978347, -0.2650015, -1.844452, 0.4745098, 1, 0, 1,
-0.5951657, 1.431552, -0.1676076, 0.4705882, 1, 0, 1,
-0.5943655, -0.2773949, -1.384692, 0.4627451, 1, 0, 1,
-0.5941131, -0.985006, -3.167091, 0.4588235, 1, 0, 1,
-0.5912061, 0.521615, -1.316954, 0.4509804, 1, 0, 1,
-0.5891616, 0.1389453, -0.8471748, 0.4470588, 1, 0, 1,
-0.5889416, 1.410921, 0.7749527, 0.4392157, 1, 0, 1,
-0.5864986, 0.100595, -2.285251, 0.4352941, 1, 0, 1,
-0.5816217, 1.133917, 0.3462615, 0.427451, 1, 0, 1,
-0.5805212, -1.290833, -4.313375, 0.4235294, 1, 0, 1,
-0.5736654, -0.3868814, -3.236207, 0.4156863, 1, 0, 1,
-0.5721933, -0.01436406, -1.530336, 0.4117647, 1, 0, 1,
-0.5713342, -1.26997, -1.638769, 0.4039216, 1, 0, 1,
-0.5712321, 2.897815, -1.062174, 0.3960784, 1, 0, 1,
-0.5682365, 2.017223, 0.7730659, 0.3921569, 1, 0, 1,
-0.557282, 0.624533, 0.2629386, 0.3843137, 1, 0, 1,
-0.5520202, 1.036012, -2.809549, 0.3803922, 1, 0, 1,
-0.5466287, 0.934857, -0.4541005, 0.372549, 1, 0, 1,
-0.5439404, -0.3713423, -2.410904, 0.3686275, 1, 0, 1,
-0.5432372, 0.6813093, 0.695967, 0.3607843, 1, 0, 1,
-0.5400077, -1.385611, -2.073873, 0.3568628, 1, 0, 1,
-0.5393559, -1.823117, -3.705887, 0.3490196, 1, 0, 1,
-0.5379102, -0.0698231, -0.5208833, 0.345098, 1, 0, 1,
-0.5326083, -0.801362, -1.9333, 0.3372549, 1, 0, 1,
-0.5290523, -1.529229, -2.322448, 0.3333333, 1, 0, 1,
-0.528346, 1.048425, 2.567373, 0.3254902, 1, 0, 1,
-0.5272394, 0.05931647, -1.856603, 0.3215686, 1, 0, 1,
-0.5269835, -0.4476778, -1.33232, 0.3137255, 1, 0, 1,
-0.5250367, -0.6677479, -2.460575, 0.3098039, 1, 0, 1,
-0.5145566, 0.4241054, 0.1654249, 0.3019608, 1, 0, 1,
-0.5109978, 0.2977394, -0.7543101, 0.2941177, 1, 0, 1,
-0.4990272, -0.6501131, -2.661741, 0.2901961, 1, 0, 1,
-0.4983474, -1.702495, -2.726168, 0.282353, 1, 0, 1,
-0.4960938, 0.3373348, 2.551368, 0.2784314, 1, 0, 1,
-0.4904925, 1.389969, -2.213372, 0.2705882, 1, 0, 1,
-0.4844759, -0.6383914, -1.225541, 0.2666667, 1, 0, 1,
-0.4817249, 0.6772855, -0.9469911, 0.2588235, 1, 0, 1,
-0.4733934, -0.2265001, -2.590982, 0.254902, 1, 0, 1,
-0.4703234, -0.01535482, -2.270839, 0.2470588, 1, 0, 1,
-0.4608759, 1.317582, -1.551419, 0.2431373, 1, 0, 1,
-0.4546354, -0.759984, -2.727025, 0.2352941, 1, 0, 1,
-0.4468964, -0.4307691, -1.257262, 0.2313726, 1, 0, 1,
-0.4444115, 0.04263898, 0.3662263, 0.2235294, 1, 0, 1,
-0.4427254, 0.8925239, 1.202671, 0.2196078, 1, 0, 1,
-0.4404022, -1.953232, -1.572258, 0.2117647, 1, 0, 1,
-0.4344856, -0.3131844, -1.334003, 0.2078431, 1, 0, 1,
-0.432164, 0.8022285, -2.601941, 0.2, 1, 0, 1,
-0.4253305, -0.3172849, -3.940325, 0.1921569, 1, 0, 1,
-0.4247028, 0.7923386, 0.4267841, 0.1882353, 1, 0, 1,
-0.4236163, 0.5090371, -1.860335, 0.1803922, 1, 0, 1,
-0.4199488, -1.633661, -1.284075, 0.1764706, 1, 0, 1,
-0.4199049, -0.0972288, -0.4464168, 0.1686275, 1, 0, 1,
-0.4190729, -0.5701483, -1.448765, 0.1647059, 1, 0, 1,
-0.4183975, -1.483046, -2.162859, 0.1568628, 1, 0, 1,
-0.4171785, 0.07967994, 0.6948906, 0.1529412, 1, 0, 1,
-0.4166058, -0.21342, -2.387016, 0.145098, 1, 0, 1,
-0.4162506, -0.5807096, -1.87963, 0.1411765, 1, 0, 1,
-0.4150998, 0.1284582, -1.46969, 0.1333333, 1, 0, 1,
-0.4140412, -0.02869403, -0.8337839, 0.1294118, 1, 0, 1,
-0.4089449, -1.265758, -1.137541, 0.1215686, 1, 0, 1,
-0.4085568, 0.196713, -0.8849178, 0.1176471, 1, 0, 1,
-0.4084643, -0.7323784, -2.893086, 0.1098039, 1, 0, 1,
-0.4083948, -1.813969, -2.062515, 0.1058824, 1, 0, 1,
-0.4062955, -0.5157658, -2.254654, 0.09803922, 1, 0, 1,
-0.4048231, 0.09852284, -1.847711, 0.09019608, 1, 0, 1,
-0.4045433, -0.3228692, -2.87225, 0.08627451, 1, 0, 1,
-0.402284, -0.158173, -2.956115, 0.07843138, 1, 0, 1,
-0.4006513, 0.1670122, -0.8599994, 0.07450981, 1, 0, 1,
-0.4000798, 1.334354, -0.4693855, 0.06666667, 1, 0, 1,
-0.3985389, 1.550747, -1.54275, 0.0627451, 1, 0, 1,
-0.3955853, -1.455826, -2.905816, 0.05490196, 1, 0, 1,
-0.3945719, 1.183767, -0.7701501, 0.05098039, 1, 0, 1,
-0.3945105, -0.3129852, -0.7600369, 0.04313726, 1, 0, 1,
-0.3884188, 0.1784653, -0.7228834, 0.03921569, 1, 0, 1,
-0.3866237, -2.146509, -2.325783, 0.03137255, 1, 0, 1,
-0.3822931, 0.4612284, -0.9215243, 0.02745098, 1, 0, 1,
-0.3822658, -1.022074, -3.588408, 0.01960784, 1, 0, 1,
-0.381627, -0.3531413, -3.011492, 0.01568628, 1, 0, 1,
-0.3809387, -1.750495, -2.674809, 0.007843138, 1, 0, 1,
-0.3804382, 0.7491104, -1.251095, 0.003921569, 1, 0, 1,
-0.3741682, 0.316559, 1.422724, 0, 1, 0.003921569, 1,
-0.3735279, 0.9737761, 1.96161, 0, 1, 0.01176471, 1,
-0.3679897, 0.4493174, -0.2689664, 0, 1, 0.01568628, 1,
-0.3668034, -0.4874813, -4.296911, 0, 1, 0.02352941, 1,
-0.3660298, 0.7763113, 0.8639472, 0, 1, 0.02745098, 1,
-0.3657916, 1.956747, -0.730462, 0, 1, 0.03529412, 1,
-0.3656473, -2.032655, -1.492339, 0, 1, 0.03921569, 1,
-0.3652956, -1.850021, -2.638718, 0, 1, 0.04705882, 1,
-0.3636172, -0.3644568, -1.090173, 0, 1, 0.05098039, 1,
-0.3635248, -0.3454234, -2.243496, 0, 1, 0.05882353, 1,
-0.3597909, 1.334848, -0.8600978, 0, 1, 0.0627451, 1,
-0.3590626, 0.9215768, -0.6378356, 0, 1, 0.07058824, 1,
-0.3588875, 0.8472115, -0.5474371, 0, 1, 0.07450981, 1,
-0.3550864, 0.6511564, 1.608878, 0, 1, 0.08235294, 1,
-0.3546216, -0.01040666, -2.662398, 0, 1, 0.08627451, 1,
-0.3535964, -1.198737, -1.743854, 0, 1, 0.09411765, 1,
-0.3509167, 1.334194, -0.5969061, 0, 1, 0.1019608, 1,
-0.3454572, -0.7566276, -1.603316, 0, 1, 0.1058824, 1,
-0.3445539, -1.216345, -1.723287, 0, 1, 0.1137255, 1,
-0.3434882, -1.070369, -1.473603, 0, 1, 0.1176471, 1,
-0.3402479, -0.266876, -3.376512, 0, 1, 0.1254902, 1,
-0.3394286, -1.975777, -2.380769, 0, 1, 0.1294118, 1,
-0.3354117, -0.7899812, -1.664126, 0, 1, 0.1372549, 1,
-0.3298649, 0.7456996, -1.704759, 0, 1, 0.1411765, 1,
-0.3272458, -0.7681597, -3.581771, 0, 1, 0.1490196, 1,
-0.3256933, 1.133037, 1.205948, 0, 1, 0.1529412, 1,
-0.3215911, -0.9354576, -1.630861, 0, 1, 0.1607843, 1,
-0.3215443, -0.1314445, 0.3515492, 0, 1, 0.1647059, 1,
-0.3211602, 0.3082306, -0.9149801, 0, 1, 0.172549, 1,
-0.3206155, 0.90994, -0.1221725, 0, 1, 0.1764706, 1,
-0.3176337, -0.4138279, -3.202769, 0, 1, 0.1843137, 1,
-0.3175235, 1.286339, 0.9010709, 0, 1, 0.1882353, 1,
-0.3169665, 2.403989, 1.027134, 0, 1, 0.1960784, 1,
-0.3144895, 0.7327729, -0.01119209, 0, 1, 0.2039216, 1,
-0.3134035, -0.9976332, -2.525751, 0, 1, 0.2078431, 1,
-0.3121426, -0.5111507, -2.124745, 0, 1, 0.2156863, 1,
-0.3095549, -0.3081452, -1.691398, 0, 1, 0.2196078, 1,
-0.3064398, 0.7953736, -1.861997, 0, 1, 0.227451, 1,
-0.3045672, 1.466423, -2.039998, 0, 1, 0.2313726, 1,
-0.3030078, 0.004465546, -2.764982, 0, 1, 0.2392157, 1,
-0.297135, 1.166716, 0.3471192, 0, 1, 0.2431373, 1,
-0.2930417, 0.1278971, -1.568947, 0, 1, 0.2509804, 1,
-0.2918399, -0.4241886, -1.166958, 0, 1, 0.254902, 1,
-0.2915635, -0.3703385, -1.963326, 0, 1, 0.2627451, 1,
-0.2904932, -0.1848326, -3.105709, 0, 1, 0.2666667, 1,
-0.2901303, 0.223245, 0.672471, 0, 1, 0.2745098, 1,
-0.2880862, -0.5412847, -3.066954, 0, 1, 0.2784314, 1,
-0.2865743, -1.309562, -3.028519, 0, 1, 0.2862745, 1,
-0.2864018, 0.2615224, -2.266826, 0, 1, 0.2901961, 1,
-0.2775743, 1.206939, -2.083473, 0, 1, 0.2980392, 1,
-0.2772695, -0.8205572, -1.633773, 0, 1, 0.3058824, 1,
-0.2760772, -0.6958688, -2.588801, 0, 1, 0.3098039, 1,
-0.2760398, -0.2372984, -1.626177, 0, 1, 0.3176471, 1,
-0.2738397, -1.363919, -4.784713, 0, 1, 0.3215686, 1,
-0.273177, -0.9369546, -1.62113, 0, 1, 0.3294118, 1,
-0.2719962, -0.1549279, -1.545929, 0, 1, 0.3333333, 1,
-0.2715737, -1.414548, -2.105108, 0, 1, 0.3411765, 1,
-0.2666202, 0.8092486, -1.197837, 0, 1, 0.345098, 1,
-0.2665923, -0.5153444, -1.774284, 0, 1, 0.3529412, 1,
-0.266457, 0.6390178, -0.3489019, 0, 1, 0.3568628, 1,
-0.2660264, 0.783978, -0.9253554, 0, 1, 0.3647059, 1,
-0.2652328, 0.7059247, 0.0184733, 0, 1, 0.3686275, 1,
-0.2633424, 0.2126701, -1.514542, 0, 1, 0.3764706, 1,
-0.2625686, 1.042795, -0.6653641, 0, 1, 0.3803922, 1,
-0.261457, -1.236402, -2.376637, 0, 1, 0.3882353, 1,
-0.2505868, 1.271563, -0.08357644, 0, 1, 0.3921569, 1,
-0.249919, 1.013083, -1.363816, 0, 1, 0.4, 1,
-0.2481743, -0.05916249, -1.737904, 0, 1, 0.4078431, 1,
-0.2433061, -0.2871842, -2.218498, 0, 1, 0.4117647, 1,
-0.2408294, -0.3700903, -2.314456, 0, 1, 0.4196078, 1,
-0.2397131, 1.057292, 0.1207987, 0, 1, 0.4235294, 1,
-0.2381986, -0.9617281, -3.830149, 0, 1, 0.4313726, 1,
-0.2365263, -0.5790341, -2.184573, 0, 1, 0.4352941, 1,
-0.2336825, 0.5101125, -1.912791, 0, 1, 0.4431373, 1,
-0.2333696, -0.3736586, -3.408165, 0, 1, 0.4470588, 1,
-0.2326728, -0.1059165, -1.154446, 0, 1, 0.454902, 1,
-0.2320909, -0.5352487, -2.406241, 0, 1, 0.4588235, 1,
-0.2274735, -1.141464, -3.71502, 0, 1, 0.4666667, 1,
-0.2240558, 0.2751407, -1.777754, 0, 1, 0.4705882, 1,
-0.2236712, -0.1103653, -1.829726, 0, 1, 0.4784314, 1,
-0.2230766, -1.948115, -3.680794, 0, 1, 0.4823529, 1,
-0.2210473, -0.8021658, -2.82303, 0, 1, 0.4901961, 1,
-0.2065652, 0.7574959, -1.292572, 0, 1, 0.4941176, 1,
-0.2051709, -0.2029613, -1.608205, 0, 1, 0.5019608, 1,
-0.2050361, -2.013091, -2.496544, 0, 1, 0.509804, 1,
-0.1979792, 0.6776385, 0.1624984, 0, 1, 0.5137255, 1,
-0.1961494, 0.8183824, -0.1155648, 0, 1, 0.5215687, 1,
-0.1952087, -0.8554366, -3.075483, 0, 1, 0.5254902, 1,
-0.1857997, 1.238753, -0.5861062, 0, 1, 0.5333334, 1,
-0.1843885, 0.0746669, -0.8929288, 0, 1, 0.5372549, 1,
-0.1836873, 1.861613, -1.166952, 0, 1, 0.5450981, 1,
-0.1826383, -1.317284, -2.005973, 0, 1, 0.5490196, 1,
-0.1739264, -0.1741378, -1.812281, 0, 1, 0.5568628, 1,
-0.1730688, 0.1865401, 0.5120272, 0, 1, 0.5607843, 1,
-0.1728891, 0.007065451, -0.8394195, 0, 1, 0.5686275, 1,
-0.1699157, -1.502802, -2.990705, 0, 1, 0.572549, 1,
-0.1649486, -0.2653636, -3.701631, 0, 1, 0.5803922, 1,
-0.164761, 1.350969, 0.3782032, 0, 1, 0.5843138, 1,
-0.162005, -0.8343704, -4.008107, 0, 1, 0.5921569, 1,
-0.1588073, -1.543984, -5.751369, 0, 1, 0.5960785, 1,
-0.1531966, 0.5182587, -2.107085, 0, 1, 0.6039216, 1,
-0.1453167, -0.1957714, -2.466812, 0, 1, 0.6117647, 1,
-0.1393729, -0.1151799, -1.917852, 0, 1, 0.6156863, 1,
-0.1385457, 1.336064, 0.7515531, 0, 1, 0.6235294, 1,
-0.135563, -0.2420344, -2.442415, 0, 1, 0.627451, 1,
-0.1321111, 0.7082589, -1.657223, 0, 1, 0.6352941, 1,
-0.1276426, -0.1045377, -1.926143, 0, 1, 0.6392157, 1,
-0.1233, -0.1813912, -1.518144, 0, 1, 0.6470588, 1,
-0.116763, 0.6497988, -0.8004849, 0, 1, 0.6509804, 1,
-0.1151288, 1.050304, -1.060374, 0, 1, 0.6588235, 1,
-0.1109712, 0.4065936, -0.6822159, 0, 1, 0.6627451, 1,
-0.1098786, 1.911984, 0.160501, 0, 1, 0.6705883, 1,
-0.109658, 0.907752, -0.905274, 0, 1, 0.6745098, 1,
-0.1084573, -0.6244386, -2.338179, 0, 1, 0.682353, 1,
-0.1057564, -1.995947, -5.021435, 0, 1, 0.6862745, 1,
-0.1055365, -0.9967251, -3.876801, 0, 1, 0.6941177, 1,
-0.1053385, 0.0557801, -1.559239, 0, 1, 0.7019608, 1,
-0.1051793, -0.1447303, -4.287877, 0, 1, 0.7058824, 1,
-0.1048899, 0.1326591, -0.5710365, 0, 1, 0.7137255, 1,
-0.1033506, -2.380276, -2.175776, 0, 1, 0.7176471, 1,
-0.1029618, -0.5774056, -2.985724, 0, 1, 0.7254902, 1,
-0.1017509, -2.306764, -4.742206, 0, 1, 0.7294118, 1,
-0.09693525, -1.005643, -3.894982, 0, 1, 0.7372549, 1,
-0.09251199, 1.16918, -0.7365769, 0, 1, 0.7411765, 1,
-0.08986226, -0.5682364, -4.049893, 0, 1, 0.7490196, 1,
-0.0861026, -0.1315258, -2.89205, 0, 1, 0.7529412, 1,
-0.083474, 1.042224, -0.276805, 0, 1, 0.7607843, 1,
-0.08216664, -0.2895359, -1.509763, 0, 1, 0.7647059, 1,
-0.08119731, 1.334337, -0.4101114, 0, 1, 0.772549, 1,
-0.07617629, 0.9606513, 0.6280285, 0, 1, 0.7764706, 1,
-0.07435491, -0.7036555, -3.459402, 0, 1, 0.7843137, 1,
-0.07259764, 1.456625, -0.771346, 0, 1, 0.7882353, 1,
-0.07231452, -0.2719398, -2.752687, 0, 1, 0.7960784, 1,
-0.06962481, 0.1465526, 0.1140834, 0, 1, 0.8039216, 1,
-0.06884234, 0.1222247, -0.5713821, 0, 1, 0.8078431, 1,
-0.06777867, -0.09400448, -3.421569, 0, 1, 0.8156863, 1,
-0.06763408, 1.754528, -1.080341, 0, 1, 0.8196079, 1,
-0.06592125, 0.1593835, -0.5464405, 0, 1, 0.827451, 1,
-0.06360439, -0.4730087, -1.651875, 0, 1, 0.8313726, 1,
-0.06260329, -0.1659741, -3.06691, 0, 1, 0.8392157, 1,
-0.06036891, -0.4995227, -1.96479, 0, 1, 0.8431373, 1,
-0.05836958, 0.3048639, -0.9143777, 0, 1, 0.8509804, 1,
-0.05777792, 0.05463973, 1.022971, 0, 1, 0.854902, 1,
-0.05341069, -0.3291219, -2.693392, 0, 1, 0.8627451, 1,
-0.05037466, 0.5035462, 1.884647, 0, 1, 0.8666667, 1,
-0.04469153, -0.5842296, -4.361883, 0, 1, 0.8745098, 1,
-0.04186473, -0.8274543, -2.100343, 0, 1, 0.8784314, 1,
-0.03963569, 0.4208165, -0.05865246, 0, 1, 0.8862745, 1,
-0.03605082, 0.2617089, 0.1846455, 0, 1, 0.8901961, 1,
-0.03415722, 0.784795, -1.063787, 0, 1, 0.8980392, 1,
-0.02993733, 0.758712, -0.705944, 0, 1, 0.9058824, 1,
-0.02987355, -0.03889115, -3.345658, 0, 1, 0.9098039, 1,
-0.02442253, -0.1618983, -4.599504, 0, 1, 0.9176471, 1,
-0.02420887, 0.3289953, 0.5984952, 0, 1, 0.9215686, 1,
-0.01669753, -0.7523884, -3.571434, 0, 1, 0.9294118, 1,
-0.0067, -1.037456, -2.397554, 0, 1, 0.9333333, 1,
-0.004111031, 0.5257837, 1.147083, 0, 1, 0.9411765, 1,
3.956586e-05, -0.6492811, 4.69746, 0, 1, 0.945098, 1,
0.0002436719, 0.2861949, -0.6955422, 0, 1, 0.9529412, 1,
0.008417072, -0.01053918, 3.39752, 0, 1, 0.9568627, 1,
0.008816015, 0.09372509, 1.910498, 0, 1, 0.9647059, 1,
0.008945297, -2.041768, 4.4207, 0, 1, 0.9686275, 1,
0.0107415, 1.918897, 1.896109, 0, 1, 0.9764706, 1,
0.01860902, -0.3876953, 3.064393, 0, 1, 0.9803922, 1,
0.01909534, -0.669075, 2.449007, 0, 1, 0.9882353, 1,
0.02007675, 0.9295477, 0.8273697, 0, 1, 0.9921569, 1,
0.02126539, 0.8093567, -0.2258678, 0, 1, 1, 1,
0.02676148, 0.4711509, -0.7265201, 0, 0.9921569, 1, 1,
0.02949793, -0.3763705, 1.781776, 0, 0.9882353, 1, 1,
0.02991309, -0.2930775, 1.463495, 0, 0.9803922, 1, 1,
0.04594128, -1.628269, 3.641757, 0, 0.9764706, 1, 1,
0.04727452, 1.383258, -0.05008097, 0, 0.9686275, 1, 1,
0.04774769, 1.676045, -0.506044, 0, 0.9647059, 1, 1,
0.05641, -0.3314432, 1.495686, 0, 0.9568627, 1, 1,
0.06916284, 1.167701, -1.758208, 0, 0.9529412, 1, 1,
0.06961782, -0.007752037, -0.5674388, 0, 0.945098, 1, 1,
0.07042535, -1.077505, 4.219683, 0, 0.9411765, 1, 1,
0.0706612, -0.5642506, 2.027079, 0, 0.9333333, 1, 1,
0.07095534, -0.5655695, 2.33366, 0, 0.9294118, 1, 1,
0.07229397, 0.3248369, -1.703351, 0, 0.9215686, 1, 1,
0.07273928, -0.3383837, 2.940558, 0, 0.9176471, 1, 1,
0.07446006, 1.371814, -0.2668296, 0, 0.9098039, 1, 1,
0.07473698, 0.8599092, -0.1643663, 0, 0.9058824, 1, 1,
0.07519928, 0.7267082, 0.6173118, 0, 0.8980392, 1, 1,
0.0765062, -1.053948, 2.720054, 0, 0.8901961, 1, 1,
0.07808374, -0.2725626, 2.032126, 0, 0.8862745, 1, 1,
0.07889955, -0.5285709, 3.252958, 0, 0.8784314, 1, 1,
0.07896675, -0.3574089, 4.694246, 0, 0.8745098, 1, 1,
0.08084421, 0.05169076, -0.00193383, 0, 0.8666667, 1, 1,
0.08600672, 0.8216675, 1.682814, 0, 0.8627451, 1, 1,
0.08773738, 0.6784151, -0.9300533, 0, 0.854902, 1, 1,
0.09306602, -1.554416, 3.986449, 0, 0.8509804, 1, 1,
0.09635547, 0.7367568, 1.677844, 0, 0.8431373, 1, 1,
0.09689992, -0.5988718, 3.183949, 0, 0.8392157, 1, 1,
0.0972117, 0.1962778, 2.743582, 0, 0.8313726, 1, 1,
0.09799016, 0.2034894, -0.001017094, 0, 0.827451, 1, 1,
0.09959994, -1.151585, 1.751063, 0, 0.8196079, 1, 1,
0.1027123, -0.5589988, 2.752583, 0, 0.8156863, 1, 1,
0.1036473, -0.9145527, 2.093005, 0, 0.8078431, 1, 1,
0.1047918, 0.7359723, 0.617534, 0, 0.8039216, 1, 1,
0.1071272, 0.8334116, 0.663745, 0, 0.7960784, 1, 1,
0.1088645, -0.752402, 4.577086, 0, 0.7882353, 1, 1,
0.1130821, 0.7824216, 0.201916, 0, 0.7843137, 1, 1,
0.113579, 0.1048153, 2.103788, 0, 0.7764706, 1, 1,
0.1153184, 0.1865341, 0.4286546, 0, 0.772549, 1, 1,
0.1223619, -1.21094, 3.148237, 0, 0.7647059, 1, 1,
0.1244905, 0.7664675, -0.2924017, 0, 0.7607843, 1, 1,
0.1337424, -0.1906775, 3.734703, 0, 0.7529412, 1, 1,
0.1456345, -0.01464238, -0.6165826, 0, 0.7490196, 1, 1,
0.1556965, -2.461358, 2.339472, 0, 0.7411765, 1, 1,
0.1660987, 0.9151424, 0.3082785, 0, 0.7372549, 1, 1,
0.1687731, 0.5405276, -0.9255049, 0, 0.7294118, 1, 1,
0.1773423, -0.8655533, 0.9356772, 0, 0.7254902, 1, 1,
0.178121, -0.0408537, 3.593284, 0, 0.7176471, 1, 1,
0.179693, -1.715917, 2.405059, 0, 0.7137255, 1, 1,
0.1810928, -2.401706, 2.737351, 0, 0.7058824, 1, 1,
0.1841156, 0.4899896, -0.3862652, 0, 0.6980392, 1, 1,
0.1852192, 0.9622468, -0.8781916, 0, 0.6941177, 1, 1,
0.1857328, 0.4122455, 1.518723, 0, 0.6862745, 1, 1,
0.186568, -0.3197531, 1.614156, 0, 0.682353, 1, 1,
0.1876988, -1.134325, 2.787121, 0, 0.6745098, 1, 1,
0.1896088, 0.3998876, 0.6591454, 0, 0.6705883, 1, 1,
0.195548, 0.357119, 0.2349141, 0, 0.6627451, 1, 1,
0.1998026, -0.5776588, 3.316157, 0, 0.6588235, 1, 1,
0.2010814, 0.04105722, 1.093183, 0, 0.6509804, 1, 1,
0.2051716, -0.359099, 1.658762, 0, 0.6470588, 1, 1,
0.2071679, 0.1804341, -0.2376341, 0, 0.6392157, 1, 1,
0.2090024, -0.4618483, 5.073352, 0, 0.6352941, 1, 1,
0.2098683, 1.182651, -1.722412, 0, 0.627451, 1, 1,
0.2113484, -0.0456709, 1.167271, 0, 0.6235294, 1, 1,
0.2169067, -1.724984, 2.63196, 0, 0.6156863, 1, 1,
0.2202473, -1.553645, 5.141945, 0, 0.6117647, 1, 1,
0.22283, -0.1430799, 2.33899, 0, 0.6039216, 1, 1,
0.2274153, -1.268712, 3.351726, 0, 0.5960785, 1, 1,
0.2280389, 0.02969602, 3.012374, 0, 0.5921569, 1, 1,
0.2290628, 0.1711931, 1.809639, 0, 0.5843138, 1, 1,
0.2356738, -0.6217343, 3.06742, 0, 0.5803922, 1, 1,
0.2363581, -1.128306, 3.5929, 0, 0.572549, 1, 1,
0.2374338, 1.730286, -0.6901911, 0, 0.5686275, 1, 1,
0.2410528, 0.4684242, -0.33183, 0, 0.5607843, 1, 1,
0.2423252, 0.9904542, 1.910153, 0, 0.5568628, 1, 1,
0.2429101, 0.1699913, 1.085489, 0, 0.5490196, 1, 1,
0.2508842, -0.08797485, 1.827668, 0, 0.5450981, 1, 1,
0.2560029, 0.1270277, 0.7822361, 0, 0.5372549, 1, 1,
0.2572734, -0.5220892, 4.167881, 0, 0.5333334, 1, 1,
0.2583284, 0.1839966, 0.9060292, 0, 0.5254902, 1, 1,
0.2603818, -1.021862, 2.688851, 0, 0.5215687, 1, 1,
0.2624818, -0.425754, 2.383962, 0, 0.5137255, 1, 1,
0.2635317, 1.9159, -0.08770349, 0, 0.509804, 1, 1,
0.2645756, -0.6491154, 1.846477, 0, 0.5019608, 1, 1,
0.2657888, 0.9811401, 0.5759057, 0, 0.4941176, 1, 1,
0.2696754, -1.174251, 3.175505, 0, 0.4901961, 1, 1,
0.2735372, 0.6771419, 1.235904, 0, 0.4823529, 1, 1,
0.2757149, -0.8601615, 4.817072, 0, 0.4784314, 1, 1,
0.2786192, -1.3459, 3.898556, 0, 0.4705882, 1, 1,
0.2786861, -0.7530374, 2.887568, 0, 0.4666667, 1, 1,
0.2788925, -0.03630503, 2.754121, 0, 0.4588235, 1, 1,
0.2793686, 2.614626, 1.60662, 0, 0.454902, 1, 1,
0.280183, 2.051413, 2.510662, 0, 0.4470588, 1, 1,
0.2824829, -1.041269, 3.061117, 0, 0.4431373, 1, 1,
0.2828206, 0.1631551, 3.076982, 0, 0.4352941, 1, 1,
0.2899363, -1.578892, 2.723921, 0, 0.4313726, 1, 1,
0.2919556, -1.697988, 2.017742, 0, 0.4235294, 1, 1,
0.2923852, 0.6458637, -0.740902, 0, 0.4196078, 1, 1,
0.2931747, 0.1728369, 1.852234, 0, 0.4117647, 1, 1,
0.2957988, -0.7756063, 4.262262, 0, 0.4078431, 1, 1,
0.296692, -1.496439, 3.66597, 0, 0.4, 1, 1,
0.3013137, -0.0331261, -1.069257, 0, 0.3921569, 1, 1,
0.3045239, -0.5233318, 2.887841, 0, 0.3882353, 1, 1,
0.3047833, 2.125749, -2.047892, 0, 0.3803922, 1, 1,
0.304851, 0.01373353, 3.754168, 0, 0.3764706, 1, 1,
0.3067257, -1.52834, 2.59317, 0, 0.3686275, 1, 1,
0.3067355, -0.8671877, 0.90405, 0, 0.3647059, 1, 1,
0.3077756, -0.8950461, 2.979102, 0, 0.3568628, 1, 1,
0.3092994, 1.602117, 0.7707523, 0, 0.3529412, 1, 1,
0.314427, -0.9351438, 1.750308, 0, 0.345098, 1, 1,
0.3153873, -0.3621996, 1.979271, 0, 0.3411765, 1, 1,
0.3156435, 0.4635677, 0.906609, 0, 0.3333333, 1, 1,
0.321336, -0.7272353, 3.266935, 0, 0.3294118, 1, 1,
0.325322, 1.19049, 0.09458178, 0, 0.3215686, 1, 1,
0.3261038, -0.7587379, 2.429756, 0, 0.3176471, 1, 1,
0.3327446, 0.3559066, 1.803189, 0, 0.3098039, 1, 1,
0.3335136, 0.3009483, -0.6372272, 0, 0.3058824, 1, 1,
0.3348758, 0.6972488, 1.34964, 0, 0.2980392, 1, 1,
0.33598, 1.233811, -0.1329164, 0, 0.2901961, 1, 1,
0.3362242, -0.1258449, 4.017207, 0, 0.2862745, 1, 1,
0.3389972, 0.5217144, 2.360122, 0, 0.2784314, 1, 1,
0.3417454, 0.6318148, 0.8481311, 0, 0.2745098, 1, 1,
0.3433799, 0.9945627, 0.6452674, 0, 0.2666667, 1, 1,
0.3448014, -0.2922169, 1.424558, 0, 0.2627451, 1, 1,
0.3452294, 2.726677, -0.727838, 0, 0.254902, 1, 1,
0.3462289, -0.7236695, 3.683634, 0, 0.2509804, 1, 1,
0.3463186, 1.804758, 0.839718, 0, 0.2431373, 1, 1,
0.3463482, -0.05514209, 1.228647, 0, 0.2392157, 1, 1,
0.3556561, -0.4759225, 1.316457, 0, 0.2313726, 1, 1,
0.3578651, -0.578367, 1.950133, 0, 0.227451, 1, 1,
0.3681248, -0.9259776, 2.541527, 0, 0.2196078, 1, 1,
0.3691377, -0.9198539, 2.399211, 0, 0.2156863, 1, 1,
0.3712761, 0.8746662, 0.742614, 0, 0.2078431, 1, 1,
0.3802152, -0.6896071, 3.735972, 0, 0.2039216, 1, 1,
0.3807244, 0.09927987, 1.918858, 0, 0.1960784, 1, 1,
0.3814859, 0.5499766, -0.0907562, 0, 0.1882353, 1, 1,
0.3822178, -1.067116, 2.893701, 0, 0.1843137, 1, 1,
0.3833351, -1.467901, 3.52186, 0, 0.1764706, 1, 1,
0.3856885, 0.3412156, 0.8188049, 0, 0.172549, 1, 1,
0.3886093, 1.371387, -0.3905886, 0, 0.1647059, 1, 1,
0.3910837, 1.011119, 0.08172418, 0, 0.1607843, 1, 1,
0.3925222, -0.1895667, 1.288001, 0, 0.1529412, 1, 1,
0.3929318, 0.1608929, -0.8729662, 0, 0.1490196, 1, 1,
0.3980296, 0.3737548, -0.0228473, 0, 0.1411765, 1, 1,
0.3981417, -0.9760901, 4.449552, 0, 0.1372549, 1, 1,
0.3981797, 0.8943808, -1.065436, 0, 0.1294118, 1, 1,
0.4013519, -1.766619, 2.381416, 0, 0.1254902, 1, 1,
0.4078761, 0.1877688, 0.6050149, 0, 0.1176471, 1, 1,
0.4145975, -0.148469, 0.7398149, 0, 0.1137255, 1, 1,
0.4205481, -2.584465, 2.071941, 0, 0.1058824, 1, 1,
0.4274694, -1.663439, 3.120934, 0, 0.09803922, 1, 1,
0.4280842, 0.9168, -0.8482683, 0, 0.09411765, 1, 1,
0.4318669, 0.07924091, 2.037092, 0, 0.08627451, 1, 1,
0.4319992, -0.02168629, -0.1024418, 0, 0.08235294, 1, 1,
0.4349932, -0.4545439, 3.258459, 0, 0.07450981, 1, 1,
0.442598, 2.619566, 1.108919, 0, 0.07058824, 1, 1,
0.4444798, -0.990571, 2.487865, 0, 0.0627451, 1, 1,
0.4473906, 2.07066, 0.8012787, 0, 0.05882353, 1, 1,
0.4570183, -0.9943128, 3.203457, 0, 0.05098039, 1, 1,
0.4592318, -0.9281264, 1.731289, 0, 0.04705882, 1, 1,
0.4596173, 0.1576276, 0.5497048, 0, 0.03921569, 1, 1,
0.4654602, -0.7560908, 3.146789, 0, 0.03529412, 1, 1,
0.4671681, -2.156242, 3.833034, 0, 0.02745098, 1, 1,
0.4695705, 1.05287, 0.2620551, 0, 0.02352941, 1, 1,
0.4695895, 1.116375, 1.00768, 0, 0.01568628, 1, 1,
0.4698365, 0.7452641, 1.851472, 0, 0.01176471, 1, 1,
0.4771445, -0.2760069, 0.6480098, 0, 0.003921569, 1, 1,
0.4784911, 0.5312901, 1.32279, 0.003921569, 0, 1, 1,
0.4801259, 0.7007072, 0.2156954, 0.007843138, 0, 1, 1,
0.4823427, -1.398651, 4.167363, 0.01568628, 0, 1, 1,
0.4848854, -0.2452242, 2.418809, 0.01960784, 0, 1, 1,
0.4873294, 0.737242, 1.866142, 0.02745098, 0, 1, 1,
0.4912516, -0.509896, 1.856003, 0.03137255, 0, 1, 1,
0.4915792, 1.373359, 0.6605258, 0.03921569, 0, 1, 1,
0.4973223, 0.5487227, 0.2625321, 0.04313726, 0, 1, 1,
0.4977381, 0.586987, -0.08015287, 0.05098039, 0, 1, 1,
0.497949, -0.4382508, 3.026744, 0.05490196, 0, 1, 1,
0.5025343, -1.476086, 2.891694, 0.0627451, 0, 1, 1,
0.5041756, -0.03508281, 2.655232, 0.06666667, 0, 1, 1,
0.5086179, 0.8042166, 1.122225, 0.07450981, 0, 1, 1,
0.5098805, -1.663445, 4.210124, 0.07843138, 0, 1, 1,
0.5105733, -0.3526968, 1.434952, 0.08627451, 0, 1, 1,
0.5118471, -1.743409, 2.568172, 0.09019608, 0, 1, 1,
0.5125499, 0.4860295, -0.2281367, 0.09803922, 0, 1, 1,
0.5150567, -0.2964988, 2.552607, 0.1058824, 0, 1, 1,
0.5174916, 1.016159, 0.9696105, 0.1098039, 0, 1, 1,
0.5175252, -1.458793, 1.338755, 0.1176471, 0, 1, 1,
0.5197801, 0.538393, -0.3600027, 0.1215686, 0, 1, 1,
0.5216544, 0.4484104, 1.016502, 0.1294118, 0, 1, 1,
0.5297084, -0.4896162, 3.660362, 0.1333333, 0, 1, 1,
0.5376291, 0.1443961, 1.261115, 0.1411765, 0, 1, 1,
0.5378526, 0.6476878, 0.7008788, 0.145098, 0, 1, 1,
0.5387717, -0.367366, 1.971422, 0.1529412, 0, 1, 1,
0.543338, -0.01026863, 3.626643, 0.1568628, 0, 1, 1,
0.5474648, 1.08494, 1.203152, 0.1647059, 0, 1, 1,
0.5499699, 0.8750682, -0.6341721, 0.1686275, 0, 1, 1,
0.5528577, 0.5414128, 1.12275, 0.1764706, 0, 1, 1,
0.5540886, 2.070625, -0.1629721, 0.1803922, 0, 1, 1,
0.5548829, -0.4995565, 1.049731, 0.1882353, 0, 1, 1,
0.5550967, 1.014678, 0.1229701, 0.1921569, 0, 1, 1,
0.5552322, 0.02421145, 3.859919, 0.2, 0, 1, 1,
0.5562135, 0.09788208, 1.548086, 0.2078431, 0, 1, 1,
0.5582323, 1.393367, 1.415049, 0.2117647, 0, 1, 1,
0.5651684, 0.08455182, 1.272994, 0.2196078, 0, 1, 1,
0.5662687, -1.907573, 1.963873, 0.2235294, 0, 1, 1,
0.5665183, -0.164016, 1.603914, 0.2313726, 0, 1, 1,
0.5727757, -1.309284, 1.907115, 0.2352941, 0, 1, 1,
0.5738467, 2.280989, 0.6340805, 0.2431373, 0, 1, 1,
0.576727, 1.25571, 1.306644, 0.2470588, 0, 1, 1,
0.5785751, 0.260156, 2.558291, 0.254902, 0, 1, 1,
0.5833036, -0.3177706, 1.442649, 0.2588235, 0, 1, 1,
0.5838506, 0.68976, 2.868798, 0.2666667, 0, 1, 1,
0.5848079, -0.4226941, 2.24578, 0.2705882, 0, 1, 1,
0.5864522, 0.9819797, -0.5122397, 0.2784314, 0, 1, 1,
0.5877966, -1.205965, 2.349441, 0.282353, 0, 1, 1,
0.5899295, -0.1791989, 2.854419, 0.2901961, 0, 1, 1,
0.5906985, -1.249886, -0.202546, 0.2941177, 0, 1, 1,
0.5939627, -1.152395, 1.666986, 0.3019608, 0, 1, 1,
0.5960444, -0.5812523, 1.33514, 0.3098039, 0, 1, 1,
0.606366, 1.763566, -0.8934083, 0.3137255, 0, 1, 1,
0.6073405, 0.4804915, 2.675296, 0.3215686, 0, 1, 1,
0.6148387, 0.7775495, 1.035805, 0.3254902, 0, 1, 1,
0.6179365, 2.016422, -0.5442992, 0.3333333, 0, 1, 1,
0.6187333, 0.1336247, 0.1488298, 0.3372549, 0, 1, 1,
0.6206902, -0.9145299, 1.973741, 0.345098, 0, 1, 1,
0.6258359, -0.5224707, 3.817955, 0.3490196, 0, 1, 1,
0.6266665, -0.7860158, 2.008666, 0.3568628, 0, 1, 1,
0.626899, -0.2816341, -0.4284781, 0.3607843, 0, 1, 1,
0.6360577, -2.973346, 1.262043, 0.3686275, 0, 1, 1,
0.6373476, -0.8254932, 2.957031, 0.372549, 0, 1, 1,
0.6384503, 0.5513464, 1.781609, 0.3803922, 0, 1, 1,
0.642129, 0.2325068, 3.249963, 0.3843137, 0, 1, 1,
0.6444229, 0.0450367, 1.191369, 0.3921569, 0, 1, 1,
0.6461049, 1.410321, 0.9965356, 0.3960784, 0, 1, 1,
0.6465021, 1.168517, 0.4208933, 0.4039216, 0, 1, 1,
0.6473784, 0.6772903, 1.883422, 0.4117647, 0, 1, 1,
0.6494624, 0.4723574, -0.1249258, 0.4156863, 0, 1, 1,
0.6513712, 1.030442, 0.8705515, 0.4235294, 0, 1, 1,
0.6525756, 0.2203288, 0.9593468, 0.427451, 0, 1, 1,
0.6549726, -2.386127, 3.772142, 0.4352941, 0, 1, 1,
0.6575052, 0.3609913, 0.03235688, 0.4392157, 0, 1, 1,
0.6628302, 0.6610746, -0.3307309, 0.4470588, 0, 1, 1,
0.6673338, 0.7813597, 1.121186, 0.4509804, 0, 1, 1,
0.6719889, 1.568526, 0.5933223, 0.4588235, 0, 1, 1,
0.6808489, -0.9332163, 2.008982, 0.4627451, 0, 1, 1,
0.6951967, 0.09411538, 0.7912305, 0.4705882, 0, 1, 1,
0.6969683, -2.483589, 2.811995, 0.4745098, 0, 1, 1,
0.6977164, -0.1103741, 2.902081, 0.4823529, 0, 1, 1,
0.7120352, 0.4974771, -0.2819794, 0.4862745, 0, 1, 1,
0.7140801, 1.087187, 2.053293, 0.4941176, 0, 1, 1,
0.7154319, -1.620999, 3.34398, 0.5019608, 0, 1, 1,
0.7160014, -0.5348953, 0.6932893, 0.5058824, 0, 1, 1,
0.7280426, -0.1819825, 0.199934, 0.5137255, 0, 1, 1,
0.7319883, 0.2196705, 0.8715389, 0.5176471, 0, 1, 1,
0.7362652, -0.8133192, 1.696538, 0.5254902, 0, 1, 1,
0.755224, 0.5789266, 1.264844, 0.5294118, 0, 1, 1,
0.7555797, 0.7256897, 2.629474, 0.5372549, 0, 1, 1,
0.756826, -1.132306, 4.700524, 0.5411765, 0, 1, 1,
0.7568274, -1.299875, 1.85105, 0.5490196, 0, 1, 1,
0.7627661, -0.03231417, 0.6767852, 0.5529412, 0, 1, 1,
0.7658927, -0.4286845, 3.182669, 0.5607843, 0, 1, 1,
0.7664608, 0.2077109, 2.818175, 0.5647059, 0, 1, 1,
0.7668898, -1.976713, 2.60209, 0.572549, 0, 1, 1,
0.7687768, 0.8666589, 0.5467833, 0.5764706, 0, 1, 1,
0.7719573, -0.3268065, 2.265076, 0.5843138, 0, 1, 1,
0.777344, -0.166104, 2.813927, 0.5882353, 0, 1, 1,
0.778724, -0.06326707, 2.064173, 0.5960785, 0, 1, 1,
0.7902079, 0.2187293, 2.835701, 0.6039216, 0, 1, 1,
0.79083, 1.088348, 0.9485421, 0.6078432, 0, 1, 1,
0.7910378, 0.114681, 0.6491764, 0.6156863, 0, 1, 1,
0.7912943, 0.1205219, 0.1733947, 0.6196079, 0, 1, 1,
0.7957179, 2.108394, -0.1522057, 0.627451, 0, 1, 1,
0.7966838, 2.325971, 0.06757616, 0.6313726, 0, 1, 1,
0.801169, 0.08081211, 2.926012, 0.6392157, 0, 1, 1,
0.8020381, -0.5051118, 1.846559, 0.6431373, 0, 1, 1,
0.8080538, -0.1930047, 0.7199521, 0.6509804, 0, 1, 1,
0.8135012, -0.6046794, 1.418746, 0.654902, 0, 1, 1,
0.8139011, -0.3720603, 1.010411, 0.6627451, 0, 1, 1,
0.8169845, 0.5013991, 0.5710359, 0.6666667, 0, 1, 1,
0.8179736, -0.4866172, 2.744653, 0.6745098, 0, 1, 1,
0.8181393, 0.5645104, 1.280178, 0.6784314, 0, 1, 1,
0.8186284, -0.1597862, 1.896106, 0.6862745, 0, 1, 1,
0.8323057, 1.237285, 1.238752, 0.6901961, 0, 1, 1,
0.8330756, 0.2214056, 1.284327, 0.6980392, 0, 1, 1,
0.8411112, -0.8122043, 2.765123, 0.7058824, 0, 1, 1,
0.8424122, -0.3077423, 1.764324, 0.7098039, 0, 1, 1,
0.8534001, -0.8737292, 1.070581, 0.7176471, 0, 1, 1,
0.8591059, 0.08831906, 2.655861, 0.7215686, 0, 1, 1,
0.8593417, -0.2337868, 1.508877, 0.7294118, 0, 1, 1,
0.8615565, 0.4630713, -0.09461693, 0.7333333, 0, 1, 1,
0.8638152, 1.08592, -0.9667339, 0.7411765, 0, 1, 1,
0.8647012, 1.159905, 0.4460173, 0.7450981, 0, 1, 1,
0.8661177, 0.000413262, 2.934509, 0.7529412, 0, 1, 1,
0.8662296, 0.4601574, 0.4023986, 0.7568628, 0, 1, 1,
0.8701343, 0.4489126, -1.44758, 0.7647059, 0, 1, 1,
0.8768256, 0.05990512, 0.3498245, 0.7686275, 0, 1, 1,
0.8773, -0.4955273, 2.033623, 0.7764706, 0, 1, 1,
0.8794978, -0.6199299, 1.794412, 0.7803922, 0, 1, 1,
0.895881, -0.358978, 0.9971607, 0.7882353, 0, 1, 1,
0.9007488, -0.09591048, -0.4329157, 0.7921569, 0, 1, 1,
0.9010237, 0.01658375, 1.461172, 0.8, 0, 1, 1,
0.9015326, -0.09966413, 0.5043541, 0.8078431, 0, 1, 1,
0.9084792, -0.6457866, 2.751701, 0.8117647, 0, 1, 1,
0.9147393, -0.5840622, 2.454577, 0.8196079, 0, 1, 1,
0.92305, 0.4290041, 0.6857712, 0.8235294, 0, 1, 1,
0.9230589, 1.244083, 0.8797442, 0.8313726, 0, 1, 1,
0.9244006, -2.29184, 2.429473, 0.8352941, 0, 1, 1,
0.9278081, -0.3901259, 2.472478, 0.8431373, 0, 1, 1,
0.9390092, -1.359557, 3.660195, 0.8470588, 0, 1, 1,
0.9413661, 0.7305651, -0.364401, 0.854902, 0, 1, 1,
0.9423814, -0.3050692, 1.169762, 0.8588235, 0, 1, 1,
0.943417, 1.319593, 0.8646308, 0.8666667, 0, 1, 1,
0.9438251, 0.1946367, 0.5007365, 0.8705882, 0, 1, 1,
0.94589, -0.9912387, 4.053678, 0.8784314, 0, 1, 1,
0.9507419, 0.4281359, 1.746029, 0.8823529, 0, 1, 1,
0.9712663, -0.4428758, 2.517596, 0.8901961, 0, 1, 1,
0.973478, 0.1993423, 2.255069, 0.8941177, 0, 1, 1,
0.981441, -0.765007, 1.993524, 0.9019608, 0, 1, 1,
0.9820364, 0.9006768, 1.129263, 0.9098039, 0, 1, 1,
0.9907891, -0.4719754, 0.7972076, 0.9137255, 0, 1, 1,
0.991318, 0.6949859, 2.50128, 0.9215686, 0, 1, 1,
0.9945412, -0.2833386, 0.4787531, 0.9254902, 0, 1, 1,
0.9946142, -1.486132, 4.433923, 0.9333333, 0, 1, 1,
0.9951704, 0.4619049, -0.7849417, 0.9372549, 0, 1, 1,
0.9981554, -0.1333144, -0.3987264, 0.945098, 0, 1, 1,
0.9990754, -0.8749887, 0.8976178, 0.9490196, 0, 1, 1,
1.005368, -0.5570266, 2.198548, 0.9568627, 0, 1, 1,
1.008167, 0.7448926, 1.599232, 0.9607843, 0, 1, 1,
1.020179, 1.251305, 1.251426, 0.9686275, 0, 1, 1,
1.022437, 0.651032, 1.242836, 0.972549, 0, 1, 1,
1.023419, 0.7860495, 1.571505, 0.9803922, 0, 1, 1,
1.023936, -0.7612639, 1.617438, 0.9843137, 0, 1, 1,
1.028769, 1.393547, -1.221661, 0.9921569, 0, 1, 1,
1.029354, 1.09841, 1.093676, 0.9960784, 0, 1, 1,
1.030838, -0.8567739, 2.803495, 1, 0, 0.9960784, 1,
1.032367, -0.6408377, 2.936826, 1, 0, 0.9882353, 1,
1.033202, 0.2956851, 2.57097, 1, 0, 0.9843137, 1,
1.036149, -0.1916441, 1.983516, 1, 0, 0.9764706, 1,
1.040251, 0.692239, 0.9152088, 1, 0, 0.972549, 1,
1.043236, 0.679918, 1.298257, 1, 0, 0.9647059, 1,
1.048646, -0.06798013, 1.745509, 1, 0, 0.9607843, 1,
1.052464, 0.3774638, 1.541638, 1, 0, 0.9529412, 1,
1.061094, -0.149841, 2.006903, 1, 0, 0.9490196, 1,
1.061541, 1.148827, 0.06376696, 1, 0, 0.9411765, 1,
1.063946, -0.5513741, 1.328876, 1, 0, 0.9372549, 1,
1.069191, 1.721116, 0.2159929, 1, 0, 0.9294118, 1,
1.073649, -0.3467463, 1.532744, 1, 0, 0.9254902, 1,
1.083908, 0.3039791, 0.8593268, 1, 0, 0.9176471, 1,
1.086617, -0.127531, 1.09166, 1, 0, 0.9137255, 1,
1.088078, -0.366164, 1.065302, 1, 0, 0.9058824, 1,
1.095538, -0.8866304, 2.285396, 1, 0, 0.9019608, 1,
1.096972, 0.3414417, 2.527009, 1, 0, 0.8941177, 1,
1.099036, 0.6203876, 0.5048486, 1, 0, 0.8862745, 1,
1.108463, 1.240095, 1.54827, 1, 0, 0.8823529, 1,
1.112182, 1.113545, 1.182062, 1, 0, 0.8745098, 1,
1.115253, -0.6824826, 1.743936, 1, 0, 0.8705882, 1,
1.116188, -1.22301, 0.7470141, 1, 0, 0.8627451, 1,
1.117231, 1.003356, 0.9159802, 1, 0, 0.8588235, 1,
1.117902, -0.01785129, 1.285627, 1, 0, 0.8509804, 1,
1.119738, 0.2225809, 0.7173749, 1, 0, 0.8470588, 1,
1.127218, 1.709776, -0.6925173, 1, 0, 0.8392157, 1,
1.127289, 0.1874761, 1.265901, 1, 0, 0.8352941, 1,
1.135001, -0.06412872, 3.061983, 1, 0, 0.827451, 1,
1.137634, 0.8060687, 1.800479, 1, 0, 0.8235294, 1,
1.138407, -0.2763438, 2.181684, 1, 0, 0.8156863, 1,
1.138722, 1.129317, 0.2142769, 1, 0, 0.8117647, 1,
1.144306, 0.4546061, 1.502048, 1, 0, 0.8039216, 1,
1.14718, 0.4136223, 0.8665248, 1, 0, 0.7960784, 1,
1.150761, 0.06108486, 0.7964784, 1, 0, 0.7921569, 1,
1.151561, -0.952879, 0.290821, 1, 0, 0.7843137, 1,
1.156015, -1.04486, 2.674838, 1, 0, 0.7803922, 1,
1.165646, -0.7025524, 0.9343082, 1, 0, 0.772549, 1,
1.16616, -0.6291211, 3.048355, 1, 0, 0.7686275, 1,
1.166897, 0.3819926, 0.4571082, 1, 0, 0.7607843, 1,
1.168109, 0.2101017, -0.2575386, 1, 0, 0.7568628, 1,
1.179987, 0.545799, 1.181115, 1, 0, 0.7490196, 1,
1.188114, -0.1506015, 1.879071, 1, 0, 0.7450981, 1,
1.194096, 0.6820244, 1.867298, 1, 0, 0.7372549, 1,
1.208489, 0.2625348, 3.215149, 1, 0, 0.7333333, 1,
1.218577, 0.3874987, 1.476271, 1, 0, 0.7254902, 1,
1.223624, 1.773709, 0.0936537, 1, 0, 0.7215686, 1,
1.230236, -0.8254926, 3.873553, 1, 0, 0.7137255, 1,
1.241966, -1.140805, 1.022857, 1, 0, 0.7098039, 1,
1.249339, -0.8819039, 1.2686, 1, 0, 0.7019608, 1,
1.250206, 0.3054146, 0.670999, 1, 0, 0.6941177, 1,
1.253174, -1.032539, 2.570983, 1, 0, 0.6901961, 1,
1.25516, -1.825192, 2.225978, 1, 0, 0.682353, 1,
1.260198, -0.9622995, 1.011175, 1, 0, 0.6784314, 1,
1.265794, -0.6329162, 0.4774346, 1, 0, 0.6705883, 1,
1.266947, 1.233916, 1.107278, 1, 0, 0.6666667, 1,
1.272806, 0.7259811, 1.546641, 1, 0, 0.6588235, 1,
1.273221, -0.02592854, 0.2614022, 1, 0, 0.654902, 1,
1.276475, 1.235935, -0.8996442, 1, 0, 0.6470588, 1,
1.277656, -0.8702188, 2.510829, 1, 0, 0.6431373, 1,
1.286259, 0.5507145, 0.32993, 1, 0, 0.6352941, 1,
1.29292, -0.04996684, 2.014236, 1, 0, 0.6313726, 1,
1.297447, -0.001125323, 2.238005, 1, 0, 0.6235294, 1,
1.298051, 0.112975, 1.509222, 1, 0, 0.6196079, 1,
1.313304, 0.3287055, 0.4004189, 1, 0, 0.6117647, 1,
1.330495, 0.2917338, -0.009965595, 1, 0, 0.6078432, 1,
1.334068, 0.2569866, 0.7833706, 1, 0, 0.6, 1,
1.334474, 1.318398, 1.003941, 1, 0, 0.5921569, 1,
1.338308, -1.143681, 4.368195, 1, 0, 0.5882353, 1,
1.351806, 0.1510527, 1.075473, 1, 0, 0.5803922, 1,
1.353498, 0.8761705, 1.79138, 1, 0, 0.5764706, 1,
1.358027, 0.6735967, 1.617913, 1, 0, 0.5686275, 1,
1.358638, 0.5034944, 0.4544973, 1, 0, 0.5647059, 1,
1.359577, -0.7361013, 3.205104, 1, 0, 0.5568628, 1,
1.359984, -1.451621, 1.958909, 1, 0, 0.5529412, 1,
1.368165, -1.045808, 2.744463, 1, 0, 0.5450981, 1,
1.389251, -0.8091763, 3.178578, 1, 0, 0.5411765, 1,
1.390817, 0.0973955, 2.541379, 1, 0, 0.5333334, 1,
1.39459, 0.9504837, -0.6267192, 1, 0, 0.5294118, 1,
1.395302, 0.1638924, 2.49416, 1, 0, 0.5215687, 1,
1.39558, 0.4945822, 1.239395, 1, 0, 0.5176471, 1,
1.395638, 1.781393, -1.725746, 1, 0, 0.509804, 1,
1.396963, -1.329655, 2.419563, 1, 0, 0.5058824, 1,
1.399724, -0.03904616, 1.965816, 1, 0, 0.4980392, 1,
1.417686, 0.6104253, 1.985873, 1, 0, 0.4901961, 1,
1.426317, -0.6700475, 2.016182, 1, 0, 0.4862745, 1,
1.430052, 1.025578, 0.0962287, 1, 0, 0.4784314, 1,
1.47185, -1.908839, 5.154808, 1, 0, 0.4745098, 1,
1.477626, 0.8890988, 0.2671634, 1, 0, 0.4666667, 1,
1.49411, 0.4980042, 1.903229, 1, 0, 0.4627451, 1,
1.502032, 0.9214188, 1.552661, 1, 0, 0.454902, 1,
1.503032, -0.1413853, 2.181676, 1, 0, 0.4509804, 1,
1.503675, 1.506319, 0.3899662, 1, 0, 0.4431373, 1,
1.517974, -0.9239685, 0.7226898, 1, 0, 0.4392157, 1,
1.522571, -2.285424, 3.95064, 1, 0, 0.4313726, 1,
1.525043, 0.2213958, 1.256446, 1, 0, 0.427451, 1,
1.526474, -0.6510223, 3.461246, 1, 0, 0.4196078, 1,
1.539748, -0.5109567, 1.720497, 1, 0, 0.4156863, 1,
1.539856, 0.9795705, 1.028519, 1, 0, 0.4078431, 1,
1.542743, -0.2116636, 2.156087, 1, 0, 0.4039216, 1,
1.543995, 1.447089, 1.1107, 1, 0, 0.3960784, 1,
1.550322, 1.358715, 1.895481, 1, 0, 0.3882353, 1,
1.55486, -1.154965, 1.894761, 1, 0, 0.3843137, 1,
1.584421, -0.5400122, 2.724447, 1, 0, 0.3764706, 1,
1.585335, -0.03574343, 3.146282, 1, 0, 0.372549, 1,
1.587559, 1.080674, -0.355737, 1, 0, 0.3647059, 1,
1.593475, 1.103245, 0.525839, 1, 0, 0.3607843, 1,
1.611616, 0.3441371, 2.376182, 1, 0, 0.3529412, 1,
1.612436, -0.45191, 2.047926, 1, 0, 0.3490196, 1,
1.61377, 2.010192, 1.63742, 1, 0, 0.3411765, 1,
1.617047, 0.2055411, 2.103197, 1, 0, 0.3372549, 1,
1.642757, -1.751524, 2.576225, 1, 0, 0.3294118, 1,
1.644368, 0.9458797, 0.8948253, 1, 0, 0.3254902, 1,
1.648915, 0.900811, 1.887635, 1, 0, 0.3176471, 1,
1.655439, -1.865395, 3.437376, 1, 0, 0.3137255, 1,
1.68351, -0.7961196, 1.324965, 1, 0, 0.3058824, 1,
1.687659, -0.512755, 1.43372, 1, 0, 0.2980392, 1,
1.693124, 0.9936703, -0.1650084, 1, 0, 0.2941177, 1,
1.693168, 1.540955, 2.507058, 1, 0, 0.2862745, 1,
1.707191, -1.863022, 3.631685, 1, 0, 0.282353, 1,
1.715532, 0.1858275, 3.589427, 1, 0, 0.2745098, 1,
1.73631, -2.218766, 1.544157, 1, 0, 0.2705882, 1,
1.780843, -0.5728899, 1.61206, 1, 0, 0.2627451, 1,
1.781151, 0.267939, 1.724569, 1, 0, 0.2588235, 1,
1.781656, 0.3132531, 0.5905782, 1, 0, 0.2509804, 1,
1.790175, 1.525665, 0.6725688, 1, 0, 0.2470588, 1,
1.815732, 1.741506, 1.037848, 1, 0, 0.2392157, 1,
1.823744, 0.987795, 1.345076, 1, 0, 0.2352941, 1,
1.826146, 0.3333954, 0.1101106, 1, 0, 0.227451, 1,
1.856904, 0.2306673, 0.8482893, 1, 0, 0.2235294, 1,
1.870493, 0.734511, 1.276945, 1, 0, 0.2156863, 1,
1.870844, -1.318686, 4.118821, 1, 0, 0.2117647, 1,
1.87184, 0.168794, 0.1368301, 1, 0, 0.2039216, 1,
1.89295, -1.295856, 0.9592525, 1, 0, 0.1960784, 1,
1.899668, -1.540992, 3.893674, 1, 0, 0.1921569, 1,
1.914271, -0.7829016, -0.910859, 1, 0, 0.1843137, 1,
1.921989, -0.2422702, 1.635283, 1, 0, 0.1803922, 1,
1.972598, -1.083901, 1.615065, 1, 0, 0.172549, 1,
1.975173, -0.682459, 1.970219, 1, 0, 0.1686275, 1,
1.984704, 0.2065552, 1.119143, 1, 0, 0.1607843, 1,
2.003498, 0.1490417, 0.6860549, 1, 0, 0.1568628, 1,
2.018579, -0.05791005, 1.928053, 1, 0, 0.1490196, 1,
2.020495, -1.461066, 2.139787, 1, 0, 0.145098, 1,
2.02518, 1.916847, -0.05142457, 1, 0, 0.1372549, 1,
2.056035, 0.3031467, 2.379235, 1, 0, 0.1333333, 1,
2.072832, -0.3438263, 1.727569, 1, 0, 0.1254902, 1,
2.080045, -0.4030389, 1.321836, 1, 0, 0.1215686, 1,
2.089444, 0.05632439, 2.409826, 1, 0, 0.1137255, 1,
2.133681, 0.5884838, 0.8096941, 1, 0, 0.1098039, 1,
2.192601, 0.5892229, 1.002236, 1, 0, 0.1019608, 1,
2.202702, -0.1734912, 1.235167, 1, 0, 0.09411765, 1,
2.210036, -1.052599, 2.690865, 1, 0, 0.09019608, 1,
2.21442, 0.2647279, 2.574208, 1, 0, 0.08235294, 1,
2.214468, -0.6634463, 1.772095, 1, 0, 0.07843138, 1,
2.259757, 2.418869, 1.871466, 1, 0, 0.07058824, 1,
2.304731, -0.06958555, 2.100979, 1, 0, 0.06666667, 1,
2.305934, -1.387335, 2.604656, 1, 0, 0.05882353, 1,
2.330558, -0.3454521, 0.8283023, 1, 0, 0.05490196, 1,
2.41019, 0.3658606, 2.777211, 1, 0, 0.04705882, 1,
2.418866, -0.4553841, 1.799403, 1, 0, 0.04313726, 1,
2.495851, -0.6857468, -0.6977691, 1, 0, 0.03529412, 1,
2.620863, -1.637233, 0.3174667, 1, 0, 0.03137255, 1,
2.632481, 0.1541416, 2.374045, 1, 0, 0.02352941, 1,
2.855724, 0.01129372, 3.310183, 1, 0, 0.01960784, 1,
2.953146, 0.4215303, 2.434355, 1, 0, 0.01176471, 1,
3.090149, 0.8188493, 2.351036, 1, 0, 0.007843138, 1
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
-0.07563126, -3.968507, -7.599967, 0, -0.5, 0.5, 0.5,
-0.07563126, -3.968507, -7.599967, 1, -0.5, 0.5, 0.5,
-0.07563126, -3.968507, -7.599967, 1, 1.5, 0.5, 0.5,
-0.07563126, -3.968507, -7.599967, 0, 1.5, 0.5, 0.5
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
-4.314611, -0.03776526, -7.599967, 0, -0.5, 0.5, 0.5,
-4.314611, -0.03776526, -7.599967, 1, -0.5, 0.5, 0.5,
-4.314611, -0.03776526, -7.599967, 1, 1.5, 0.5, 0.5,
-4.314611, -0.03776526, -7.599967, 0, 1.5, 0.5, 0.5
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
-4.314611, -3.968507, -0.298281, 0, -0.5, 0.5, 0.5,
-4.314611, -3.968507, -0.298281, 1, -0.5, 0.5, 0.5,
-4.314611, -3.968507, -0.298281, 1, 1.5, 0.5, 0.5,
-4.314611, -3.968507, -0.298281, 0, 1.5, 0.5, 0.5
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
-3, -3.061413, -5.914962,
3, -3.061413, -5.914962,
-3, -3.061413, -5.914962,
-3, -3.212595, -6.195796,
-2, -3.061413, -5.914962,
-2, -3.212595, -6.195796,
-1, -3.061413, -5.914962,
-1, -3.212595, -6.195796,
0, -3.061413, -5.914962,
0, -3.212595, -6.195796,
1, -3.061413, -5.914962,
1, -3.212595, -6.195796,
2, -3.061413, -5.914962,
2, -3.212595, -6.195796,
3, -3.061413, -5.914962,
3, -3.212595, -6.195796
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
-3, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
-3, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
-3, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
-3, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5,
-2, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
-2, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
-2, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
-2, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5,
-1, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
-1, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
-1, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
-1, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5,
0, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
0, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
0, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
0, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5,
1, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
1, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
1, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
1, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5,
2, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
2, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
2, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
2, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5,
3, -3.51496, -6.757464, 0, -0.5, 0.5, 0.5,
3, -3.51496, -6.757464, 1, -0.5, 0.5, 0.5,
3, -3.51496, -6.757464, 1, 1.5, 0.5, 0.5,
3, -3.51496, -6.757464, 0, 1.5, 0.5, 0.5
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
-3.336385, -2, -5.914962,
-3.336385, 2, -5.914962,
-3.336385, -2, -5.914962,
-3.499423, -2, -6.195796,
-3.336385, -1, -5.914962,
-3.499423, -1, -6.195796,
-3.336385, 0, -5.914962,
-3.499423, 0, -6.195796,
-3.336385, 1, -5.914962,
-3.499423, 1, -6.195796,
-3.336385, 2, -5.914962,
-3.499423, 2, -6.195796
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
-3.825498, -2, -6.757464, 0, -0.5, 0.5, 0.5,
-3.825498, -2, -6.757464, 1, -0.5, 0.5, 0.5,
-3.825498, -2, -6.757464, 1, 1.5, 0.5, 0.5,
-3.825498, -2, -6.757464, 0, 1.5, 0.5, 0.5,
-3.825498, -1, -6.757464, 0, -0.5, 0.5, 0.5,
-3.825498, -1, -6.757464, 1, -0.5, 0.5, 0.5,
-3.825498, -1, -6.757464, 1, 1.5, 0.5, 0.5,
-3.825498, -1, -6.757464, 0, 1.5, 0.5, 0.5,
-3.825498, 0, -6.757464, 0, -0.5, 0.5, 0.5,
-3.825498, 0, -6.757464, 1, -0.5, 0.5, 0.5,
-3.825498, 0, -6.757464, 1, 1.5, 0.5, 0.5,
-3.825498, 0, -6.757464, 0, 1.5, 0.5, 0.5,
-3.825498, 1, -6.757464, 0, -0.5, 0.5, 0.5,
-3.825498, 1, -6.757464, 1, -0.5, 0.5, 0.5,
-3.825498, 1, -6.757464, 1, 1.5, 0.5, 0.5,
-3.825498, 1, -6.757464, 0, 1.5, 0.5, 0.5,
-3.825498, 2, -6.757464, 0, -0.5, 0.5, 0.5,
-3.825498, 2, -6.757464, 1, -0.5, 0.5, 0.5,
-3.825498, 2, -6.757464, 1, 1.5, 0.5, 0.5,
-3.825498, 2, -6.757464, 0, 1.5, 0.5, 0.5
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
-3.336385, -3.061413, -4,
-3.336385, -3.061413, 4,
-3.336385, -3.061413, -4,
-3.499423, -3.212595, -4,
-3.336385, -3.061413, -2,
-3.499423, -3.212595, -2,
-3.336385, -3.061413, 0,
-3.499423, -3.212595, 0,
-3.336385, -3.061413, 2,
-3.499423, -3.212595, 2,
-3.336385, -3.061413, 4,
-3.499423, -3.212595, 4
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
-3.825498, -3.51496, -4, 0, -0.5, 0.5, 0.5,
-3.825498, -3.51496, -4, 1, -0.5, 0.5, 0.5,
-3.825498, -3.51496, -4, 1, 1.5, 0.5, 0.5,
-3.825498, -3.51496, -4, 0, 1.5, 0.5, 0.5,
-3.825498, -3.51496, -2, 0, -0.5, 0.5, 0.5,
-3.825498, -3.51496, -2, 1, -0.5, 0.5, 0.5,
-3.825498, -3.51496, -2, 1, 1.5, 0.5, 0.5,
-3.825498, -3.51496, -2, 0, 1.5, 0.5, 0.5,
-3.825498, -3.51496, 0, 0, -0.5, 0.5, 0.5,
-3.825498, -3.51496, 0, 1, -0.5, 0.5, 0.5,
-3.825498, -3.51496, 0, 1, 1.5, 0.5, 0.5,
-3.825498, -3.51496, 0, 0, 1.5, 0.5, 0.5,
-3.825498, -3.51496, 2, 0, -0.5, 0.5, 0.5,
-3.825498, -3.51496, 2, 1, -0.5, 0.5, 0.5,
-3.825498, -3.51496, 2, 1, 1.5, 0.5, 0.5,
-3.825498, -3.51496, 2, 0, 1.5, 0.5, 0.5,
-3.825498, -3.51496, 4, 0, -0.5, 0.5, 0.5,
-3.825498, -3.51496, 4, 1, -0.5, 0.5, 0.5,
-3.825498, -3.51496, 4, 1, 1.5, 0.5, 0.5,
-3.825498, -3.51496, 4, 0, 1.5, 0.5, 0.5
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
-3.336385, -3.061413, -5.914962,
-3.336385, 2.985882, -5.914962,
-3.336385, -3.061413, 5.3184,
-3.336385, 2.985882, 5.3184,
-3.336385, -3.061413, -5.914962,
-3.336385, -3.061413, 5.3184,
-3.336385, 2.985882, -5.914962,
-3.336385, 2.985882, 5.3184,
-3.336385, -3.061413, -5.914962,
3.185122, -3.061413, -5.914962,
-3.336385, -3.061413, 5.3184,
3.185122, -3.061413, 5.3184,
-3.336385, 2.985882, -5.914962,
3.185122, 2.985882, -5.914962,
-3.336385, 2.985882, 5.3184,
3.185122, 2.985882, 5.3184,
3.185122, -3.061413, -5.914962,
3.185122, 2.985882, -5.914962,
3.185122, -3.061413, 5.3184,
3.185122, 2.985882, 5.3184,
3.185122, -3.061413, -5.914962,
3.185122, -3.061413, 5.3184,
3.185122, 2.985882, -5.914962,
3.185122, 2.985882, 5.3184
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
var radius = 7.650812;
var distance = 34.03933;
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
mvMatrix.translate( 0.07563126, 0.03776526, 0.298281 );
mvMatrix.scale( 1.26845, 1.367919, 0.7363964 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03933);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
carbanilate_phenothi<-read.table("carbanilate_phenothi.xyz")
```

```
## Error in read.table("carbanilate_phenothi.xyz"): no lines available in input
```

```r
x<-carbanilate_phenothi$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbanilate_phenothi' not found
```

```r
y<-carbanilate_phenothi$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbanilate_phenothi' not found
```

```r
z<-carbanilate_phenothi$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbanilate_phenothi' not found
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
-3.241411, 0.5079346, -1.124036, 0, 0, 1, 1, 1,
-3.041891, -0.2924085, -1.590421, 1, 0, 0, 1, 1,
-2.854932, -0.6056688, -0.6481364, 1, 0, 0, 1, 1,
-2.819102, 0.5677001, -1.643142, 1, 0, 0, 1, 1,
-2.666526, -0.5481454, -3.309514, 1, 0, 0, 1, 1,
-2.655908, -2.37575, -2.876889, 1, 0, 0, 1, 1,
-2.595181, 1.749554, -3.715029, 0, 0, 0, 1, 1,
-2.556098, -0.303113, -3.160714, 0, 0, 0, 1, 1,
-2.531935, -0.7927666, -1.174887, 0, 0, 0, 1, 1,
-2.477933, -1.569461, -0.9045547, 0, 0, 0, 1, 1,
-2.422685, -0.5129477, -2.640658, 0, 0, 0, 1, 1,
-2.406776, 0.04205985, -0.2521177, 0, 0, 0, 1, 1,
-2.406775, 1.682189, -1.236052, 0, 0, 0, 1, 1,
-2.343127, 0.7199422, -0.2978214, 1, 1, 1, 1, 1,
-2.333263, 0.3537025, -3.242226, 1, 1, 1, 1, 1,
-2.295452, -0.6969606, -1.216177, 1, 1, 1, 1, 1,
-2.292742, 0.7169981, -0.1340574, 1, 1, 1, 1, 1,
-2.181037, -0.3662154, -2.559914, 1, 1, 1, 1, 1,
-2.131521, -0.445134, -0.3219092, 1, 1, 1, 1, 1,
-2.124676, 0.0233122, -1.553459, 1, 1, 1, 1, 1,
-2.105437, 1.089766, 1.630826, 1, 1, 1, 1, 1,
-2.092269, 0.4376358, 0.4208108, 1, 1, 1, 1, 1,
-2.078722, 0.3759954, -1.07747, 1, 1, 1, 1, 1,
-2.05797, -0.05969336, -2.490465, 1, 1, 1, 1, 1,
-2.03669, 0.3699464, -0.1647991, 1, 1, 1, 1, 1,
-2.025102, 1.401821, -1.956922, 1, 1, 1, 1, 1,
-1.991364, -0.1325823, -2.05076, 1, 1, 1, 1, 1,
-1.985105, -1.043501, -1.071253, 1, 1, 1, 1, 1,
-1.984304, 1.732576, -1.381152, 0, 0, 1, 1, 1,
-1.953938, 0.6268602, 0.6315939, 1, 0, 0, 1, 1,
-1.923149, -1.408197, -1.536523, 1, 0, 0, 1, 1,
-1.879875, 0.449248, -2.201972, 1, 0, 0, 1, 1,
-1.862463, 0.3203909, -1.967835, 1, 0, 0, 1, 1,
-1.840963, -0.5463277, -1.309608, 1, 0, 0, 1, 1,
-1.835097, 1.737073, -1.287219, 0, 0, 0, 1, 1,
-1.826269, -1.019654, -2.72372, 0, 0, 0, 1, 1,
-1.804532, 2.641688, -1.476855, 0, 0, 0, 1, 1,
-1.79545, -0.5420712, -1.368463, 0, 0, 0, 1, 1,
-1.776715, -0.7776886, -4.459974, 0, 0, 0, 1, 1,
-1.760516, 0.6867784, -1.750891, 0, 0, 0, 1, 1,
-1.736835, 0.819912, -2.705558, 0, 0, 0, 1, 1,
-1.728333, -0.6727093, -1.839669, 1, 1, 1, 1, 1,
-1.71738, 1.473048, -1.088714, 1, 1, 1, 1, 1,
-1.715582, -0.8148381, -1.014553, 1, 1, 1, 1, 1,
-1.674865, -1.116886, -2.958972, 1, 1, 1, 1, 1,
-1.673089, -0.1304985, -1.444416, 1, 1, 1, 1, 1,
-1.665786, 1.274938, -1.655214, 1, 1, 1, 1, 1,
-1.663784, -1.776168, -2.422519, 1, 1, 1, 1, 1,
-1.645376, 0.03368473, -0.9012931, 1, 1, 1, 1, 1,
-1.608166, 0.304189, -0.4848891, 1, 1, 1, 1, 1,
-1.595039, 0.6054949, 0.1775551, 1, 1, 1, 1, 1,
-1.590478, 2.1394, 0.7260311, 1, 1, 1, 1, 1,
-1.580472, 0.5357376, -3.765253, 1, 1, 1, 1, 1,
-1.567777, -1.549579, -3.7156, 1, 1, 1, 1, 1,
-1.565123, -0.7478154, -1.814171, 1, 1, 1, 1, 1,
-1.554903, -0.9921833, -2.829547, 1, 1, 1, 1, 1,
-1.551203, -0.03313111, -1.782127, 0, 0, 1, 1, 1,
-1.549791, -0.00277217, -0.7984097, 1, 0, 0, 1, 1,
-1.539833, 0.397864, -1.140356, 1, 0, 0, 1, 1,
-1.537197, -1.319067, -2.47897, 1, 0, 0, 1, 1,
-1.530718, 0.1581898, -3.160979, 1, 0, 0, 1, 1,
-1.496665, 0.451686, -1.630499, 1, 0, 0, 1, 1,
-1.496095, -0.7021635, -1.399033, 0, 0, 0, 1, 1,
-1.495143, -0.7934225, -2.314386, 0, 0, 0, 1, 1,
-1.490837, -0.1852781, -2.178669, 0, 0, 0, 1, 1,
-1.489911, 0.2421251, 0.01921802, 0, 0, 0, 1, 1,
-1.477051, 0.3578474, -0.008651661, 0, 0, 0, 1, 1,
-1.458905, 0.1916667, -1.106471, 0, 0, 0, 1, 1,
-1.457252, 1.000199, -0.7154072, 0, 0, 0, 1, 1,
-1.452545, -0.4701264, -1.554767, 1, 1, 1, 1, 1,
-1.43574, 0.4891813, -1.705651, 1, 1, 1, 1, 1,
-1.433944, 1.026765, -0.9215951, 1, 1, 1, 1, 1,
-1.432955, -0.2065877, -0.3066028, 1, 1, 1, 1, 1,
-1.432699, -0.1040071, -1.249143, 1, 1, 1, 1, 1,
-1.430058, -0.2847236, -1.432315, 1, 1, 1, 1, 1,
-1.417767, 0.7083794, -0.1925778, 1, 1, 1, 1, 1,
-1.41147, 1.560012, 0.3250223, 1, 1, 1, 1, 1,
-1.411168, 0.2345102, -1.230059, 1, 1, 1, 1, 1,
-1.39927, -0.7023818, -1.233725, 1, 1, 1, 1, 1,
-1.399012, -0.1826051, -1.471607, 1, 1, 1, 1, 1,
-1.378949, 0.6737023, -1.059731, 1, 1, 1, 1, 1,
-1.375133, 0.4936537, -1.001828, 1, 1, 1, 1, 1,
-1.366686, -0.2980402, 0.02908497, 1, 1, 1, 1, 1,
-1.356341, 1.190298, -1.465668, 1, 1, 1, 1, 1,
-1.356013, -0.02343046, -2.430453, 0, 0, 1, 1, 1,
-1.334275, 1.293421, 2.133342, 1, 0, 0, 1, 1,
-1.332153, -1.832985, -1.783383, 1, 0, 0, 1, 1,
-1.327919, 0.972145, -1.979579, 1, 0, 0, 1, 1,
-1.32358, 1.542012, -1.094172, 1, 0, 0, 1, 1,
-1.30625, -1.821251, -2.547427, 1, 0, 0, 1, 1,
-1.29043, -1.125394, -2.805016, 0, 0, 0, 1, 1,
-1.280345, 1.804309, -0.2318493, 0, 0, 0, 1, 1,
-1.278127, 0.4067193, -1.970123, 0, 0, 0, 1, 1,
-1.265945, -0.4607801, -1.423734, 0, 0, 0, 1, 1,
-1.264453, -0.4186211, -1.379165, 0, 0, 0, 1, 1,
-1.263308, -1.538583, -1.547608, 0, 0, 0, 1, 1,
-1.252337, -1.483732, -2.463597, 0, 0, 0, 1, 1,
-1.250022, -0.6995466, -2.017234, 1, 1, 1, 1, 1,
-1.247383, -0.9308921, -2.691955, 1, 1, 1, 1, 1,
-1.240457, 0.3442884, -1.103011, 1, 1, 1, 1, 1,
-1.2398, -0.4955825, -1.661823, 1, 1, 1, 1, 1,
-1.23979, -0.03324997, -4.099959, 1, 1, 1, 1, 1,
-1.222054, 0.5873806, -0.6553978, 1, 1, 1, 1, 1,
-1.221137, -0.771185, -1.935004, 1, 1, 1, 1, 1,
-1.217483, -0.2221377, -2.78531, 1, 1, 1, 1, 1,
-1.213586, 0.3573041, -0.5196693, 1, 1, 1, 1, 1,
-1.209588, -1.075359, -2.303209, 1, 1, 1, 1, 1,
-1.202089, -1.485588, -1.87536, 1, 1, 1, 1, 1,
-1.186144, -1.584918, -3.527077, 1, 1, 1, 1, 1,
-1.18303, -1.446002, -3.385309, 1, 1, 1, 1, 1,
-1.182632, 0.7056258, -0.98975, 1, 1, 1, 1, 1,
-1.17759, 0.2033583, -2.202999, 1, 1, 1, 1, 1,
-1.174357, -0.03832371, -0.3897264, 0, 0, 1, 1, 1,
-1.173386, -0.7726264, -2.199298, 1, 0, 0, 1, 1,
-1.157987, -0.4056793, -0.5067979, 1, 0, 0, 1, 1,
-1.145973, 0.2152276, 0.3440761, 1, 0, 0, 1, 1,
-1.13602, 1.697662, 0.8005393, 1, 0, 0, 1, 1,
-1.128008, 0.2275883, -0.1837247, 1, 0, 0, 1, 1,
-1.119651, 1.755604, -0.1393185, 0, 0, 0, 1, 1,
-1.109427, -0.5811787, -2.019455, 0, 0, 0, 1, 1,
-1.104081, 0.1272147, -0.6315065, 0, 0, 0, 1, 1,
-1.099238, 0.4900181, 0.2365808, 0, 0, 0, 1, 1,
-1.094751, 0.4594275, 0.5702596, 0, 0, 0, 1, 1,
-1.094129, -0.404082, -1.32786, 0, 0, 0, 1, 1,
-1.093978, -0.1809922, -2.53584, 0, 0, 0, 1, 1,
-1.086016, -0.3163139, -2.802131, 1, 1, 1, 1, 1,
-1.078808, -0.7299768, -2.89576, 1, 1, 1, 1, 1,
-1.073317, -0.4432004, -2.726313, 1, 1, 1, 1, 1,
-1.052918, 0.6174866, -2.798628, 1, 1, 1, 1, 1,
-1.052811, 0.4799212, -0.8087344, 1, 1, 1, 1, 1,
-1.051748, 1.885693, 0.6885632, 1, 1, 1, 1, 1,
-1.05014, -1.567383, -3.403394, 1, 1, 1, 1, 1,
-1.04701, -0.2662499, -0.9455664, 1, 1, 1, 1, 1,
-1.040557, -0.9631513, -1.110569, 1, 1, 1, 1, 1,
-1.033151, 0.1822495, -2.928797, 1, 1, 1, 1, 1,
-1.027564, 1.764121, -2.044051, 1, 1, 1, 1, 1,
-1.017206, -0.07416058, -2.367059, 1, 1, 1, 1, 1,
-1.00447, 0.1604276, -1.815764, 1, 1, 1, 1, 1,
-0.9909098, -0.4395892, -1.848832, 1, 1, 1, 1, 1,
-0.9898131, -0.6298855, -2.127838, 1, 1, 1, 1, 1,
-0.9885437, -0.3268139, -2.575592, 0, 0, 1, 1, 1,
-0.9835033, -0.1217627, -0.9695331, 1, 0, 0, 1, 1,
-0.9793233, 0.5608032, -2.462894, 1, 0, 0, 1, 1,
-0.9786089, -1.815996, -3.168716, 1, 0, 0, 1, 1,
-0.9778967, 0.5431542, -1.165834, 1, 0, 0, 1, 1,
-0.9760932, 1.223817, -0.6478966, 1, 0, 0, 1, 1,
-0.9754489, -0.5263532, -0.549893, 0, 0, 0, 1, 1,
-0.9751248, -0.7708344, -2.033712, 0, 0, 0, 1, 1,
-0.970914, -0.1328786, -2.471089, 0, 0, 0, 1, 1,
-0.9667868, -1.113628, -4.299936, 0, 0, 0, 1, 1,
-0.9604907, -0.5883861, -2.872006, 0, 0, 0, 1, 1,
-0.9579287, -0.2231531, -1.812633, 0, 0, 0, 1, 1,
-0.9477256, -1.587047, -2.003495, 0, 0, 0, 1, 1,
-0.934394, -0.7417642, -3.521149, 1, 1, 1, 1, 1,
-0.9340916, -0.8813552, -2.585085, 1, 1, 1, 1, 1,
-0.9272603, 0.3116637, -0.8208165, 1, 1, 1, 1, 1,
-0.925132, -0.1324289, -1.691758, 1, 1, 1, 1, 1,
-0.919086, 0.05957522, -1.746814, 1, 1, 1, 1, 1,
-0.9145699, 0.7870073, 0.2902867, 1, 1, 1, 1, 1,
-0.9106389, -0.8844525, -2.036772, 1, 1, 1, 1, 1,
-0.9047881, 1.453199, -1.256028, 1, 1, 1, 1, 1,
-0.9010018, 0.7533665, 0.2042911, 1, 1, 1, 1, 1,
-0.8964358, -0.7049911, -4.128306, 1, 1, 1, 1, 1,
-0.8944296, 1.06435, 0.1427334, 1, 1, 1, 1, 1,
-0.8907973, -1.53514, -3.244447, 1, 1, 1, 1, 1,
-0.8881234, -0.7109897, -1.366888, 1, 1, 1, 1, 1,
-0.8851254, 1.755414, 0.4285369, 1, 1, 1, 1, 1,
-0.8818893, 0.8977637, -0.8567525, 1, 1, 1, 1, 1,
-0.875524, 0.2966502, -1.87992, 0, 0, 1, 1, 1,
-0.874788, 0.4099831, 0.1438534, 1, 0, 0, 1, 1,
-0.8709638, 1.388915, -0.6040359, 1, 0, 0, 1, 1,
-0.8709017, 1.160146, -1.476741, 1, 0, 0, 1, 1,
-0.8703374, -0.7493018, -2.81792, 1, 0, 0, 1, 1,
-0.8697792, 0.6329578, -0.6259248, 1, 0, 0, 1, 1,
-0.8668616, 0.4830363, -2.106688, 0, 0, 0, 1, 1,
-0.8626696, -1.802965, -3.509595, 0, 0, 0, 1, 1,
-0.8611225, 1.332702, -1.664227, 0, 0, 0, 1, 1,
-0.8599349, -1.431416, -2.950158, 0, 0, 0, 1, 1,
-0.8575494, 1.527068, -1.736724, 0, 0, 0, 1, 1,
-0.85687, 0.6192521, -1.495569, 0, 0, 0, 1, 1,
-0.8567625, 0.6523527, -2.359518, 0, 0, 0, 1, 1,
-0.8543848, 1.87166, 0.4920384, 1, 1, 1, 1, 1,
-0.8516175, -1.096707, -1.29437, 1, 1, 1, 1, 1,
-0.8507788, 0.198882, -1.581106, 1, 1, 1, 1, 1,
-0.849803, -0.881781, -1.290239, 1, 1, 1, 1, 1,
-0.8467209, -1.606081, -1.051345, 1, 1, 1, 1, 1,
-0.839335, -0.4522772, -1.886666, 1, 1, 1, 1, 1,
-0.8318945, 0.9753109, 0.2526043, 1, 1, 1, 1, 1,
-0.8160781, -0.001810724, -1.41795, 1, 1, 1, 1, 1,
-0.8140665, 1.491408, 0.2713224, 1, 1, 1, 1, 1,
-0.8102248, 1.104249, -0.5745389, 1, 1, 1, 1, 1,
-0.8092482, -0.0350181, -0.2693899, 1, 1, 1, 1, 1,
-0.8054017, -0.3875464, -0.4784066, 1, 1, 1, 1, 1,
-0.8023923, 0.2489271, -1.195973, 1, 1, 1, 1, 1,
-0.7993308, -0.758642, -1.985796, 1, 1, 1, 1, 1,
-0.7949862, 0.1806549, -1.923895, 1, 1, 1, 1, 1,
-0.7911174, -1.673883, -2.086926, 0, 0, 1, 1, 1,
-0.7898605, 2.601207, -0.1930411, 1, 0, 0, 1, 1,
-0.7807965, 0.2054817, -2.309778, 1, 0, 0, 1, 1,
-0.7805126, -1.305615, -2.320779, 1, 0, 0, 1, 1,
-0.7792037, 2.028141, 0.09921427, 1, 0, 0, 1, 1,
-0.7791885, 0.4467975, -1.942278, 1, 0, 0, 1, 1,
-0.7690119, 0.7659896, -2.707355, 0, 0, 0, 1, 1,
-0.7529163, -0.3893294, -1.753636, 0, 0, 0, 1, 1,
-0.75227, 0.1084396, -3.274018, 0, 0, 0, 1, 1,
-0.7518479, -0.6672089, -0.2282169, 0, 0, 0, 1, 1,
-0.7511673, 0.6296682, 0.4470526, 0, 0, 0, 1, 1,
-0.7504743, 0.848608, -2.529609, 0, 0, 0, 1, 1,
-0.7475351, 0.5272912, 0.3580295, 0, 0, 0, 1, 1,
-0.7454913, -2.100097, -2.194759, 1, 1, 1, 1, 1,
-0.7438792, -0.8439101, -1.589501, 1, 1, 1, 1, 1,
-0.7357825, 0.3976216, -0.8953629, 1, 1, 1, 1, 1,
-0.7336558, 0.1971546, -2.121241, 1, 1, 1, 1, 1,
-0.7294022, -2.384583, -2.401843, 1, 1, 1, 1, 1,
-0.7250802, 0.7461563, -0.6664671, 1, 1, 1, 1, 1,
-0.7165513, -0.6695062, -2.315873, 1, 1, 1, 1, 1,
-0.7156217, 0.7691861, 0.354731, 1, 1, 1, 1, 1,
-0.7123342, -0.1199038, -1.129811, 1, 1, 1, 1, 1,
-0.7098506, -0.4781069, -1.927792, 1, 1, 1, 1, 1,
-0.7071524, 0.4865915, -1.921222, 1, 1, 1, 1, 1,
-0.7058286, -1.192962, -3.078371, 1, 1, 1, 1, 1,
-0.7030271, -1.442198, -3.188523, 1, 1, 1, 1, 1,
-0.702224, 1.00695, -0.3654867, 1, 1, 1, 1, 1,
-0.695952, 0.4280633, -1.016191, 1, 1, 1, 1, 1,
-0.6936508, -1.102139, -2.148141, 0, 0, 1, 1, 1,
-0.6869943, 0.699725, -2.09503, 1, 0, 0, 1, 1,
-0.6839134, -0.03238732, -1.689181, 1, 0, 0, 1, 1,
-0.6816605, 0.495434, -1.784926, 1, 0, 0, 1, 1,
-0.6807527, -0.4946733, -2.518208, 1, 0, 0, 1, 1,
-0.6804067, -0.2650216, -2.343314, 1, 0, 0, 1, 1,
-0.6753124, 0.5132015, -2.586281, 0, 0, 0, 1, 1,
-0.6711497, -0.7203867, -1.560215, 0, 0, 0, 1, 1,
-0.6707314, -0.6639557, -2.026119, 0, 0, 0, 1, 1,
-0.6638298, 0.09577323, -2.119212, 0, 0, 0, 1, 1,
-0.6574171, -0.3129801, -3.47078, 0, 0, 0, 1, 1,
-0.6570758, 1.064617, -0.8438595, 0, 0, 0, 1, 1,
-0.6519175, 0.3451253, -1.719048, 0, 0, 0, 1, 1,
-0.6518815, -1.717102, -3.168849, 1, 1, 1, 1, 1,
-0.6506335, 0.3136005, -0.9951298, 1, 1, 1, 1, 1,
-0.6475856, -0.8036333, -3.881794, 1, 1, 1, 1, 1,
-0.6360908, -1.113411, -3.542988, 1, 1, 1, 1, 1,
-0.6354153, 2.380641, -1.448361, 1, 1, 1, 1, 1,
-0.6301993, 1.621279, 1.256237, 1, 1, 1, 1, 1,
-0.6294498, -0.9052116, -4.207777, 1, 1, 1, 1, 1,
-0.6259457, 0.919044, -1.296504, 1, 1, 1, 1, 1,
-0.6223941, 0.06376347, -1.48489, 1, 1, 1, 1, 1,
-0.6208647, 1.165117, -0.940627, 1, 1, 1, 1, 1,
-0.6204394, 0.9427904, -1.141324, 1, 1, 1, 1, 1,
-0.6202049, -0.4223685, -1.33593, 1, 1, 1, 1, 1,
-0.6198778, -0.6341541, -1.589004, 1, 1, 1, 1, 1,
-0.6180907, -0.4634389, -2.604802, 1, 1, 1, 1, 1,
-0.6168049, -0.008305438, -0.7284747, 1, 1, 1, 1, 1,
-0.6151463, 0.4267692, -0.520292, 0, 0, 1, 1, 1,
-0.6066967, 1.355822, -1.293177, 1, 0, 0, 1, 1,
-0.5978347, -0.2650015, -1.844452, 1, 0, 0, 1, 1,
-0.5951657, 1.431552, -0.1676076, 1, 0, 0, 1, 1,
-0.5943655, -0.2773949, -1.384692, 1, 0, 0, 1, 1,
-0.5941131, -0.985006, -3.167091, 1, 0, 0, 1, 1,
-0.5912061, 0.521615, -1.316954, 0, 0, 0, 1, 1,
-0.5891616, 0.1389453, -0.8471748, 0, 0, 0, 1, 1,
-0.5889416, 1.410921, 0.7749527, 0, 0, 0, 1, 1,
-0.5864986, 0.100595, -2.285251, 0, 0, 0, 1, 1,
-0.5816217, 1.133917, 0.3462615, 0, 0, 0, 1, 1,
-0.5805212, -1.290833, -4.313375, 0, 0, 0, 1, 1,
-0.5736654, -0.3868814, -3.236207, 0, 0, 0, 1, 1,
-0.5721933, -0.01436406, -1.530336, 1, 1, 1, 1, 1,
-0.5713342, -1.26997, -1.638769, 1, 1, 1, 1, 1,
-0.5712321, 2.897815, -1.062174, 1, 1, 1, 1, 1,
-0.5682365, 2.017223, 0.7730659, 1, 1, 1, 1, 1,
-0.557282, 0.624533, 0.2629386, 1, 1, 1, 1, 1,
-0.5520202, 1.036012, -2.809549, 1, 1, 1, 1, 1,
-0.5466287, 0.934857, -0.4541005, 1, 1, 1, 1, 1,
-0.5439404, -0.3713423, -2.410904, 1, 1, 1, 1, 1,
-0.5432372, 0.6813093, 0.695967, 1, 1, 1, 1, 1,
-0.5400077, -1.385611, -2.073873, 1, 1, 1, 1, 1,
-0.5393559, -1.823117, -3.705887, 1, 1, 1, 1, 1,
-0.5379102, -0.0698231, -0.5208833, 1, 1, 1, 1, 1,
-0.5326083, -0.801362, -1.9333, 1, 1, 1, 1, 1,
-0.5290523, -1.529229, -2.322448, 1, 1, 1, 1, 1,
-0.528346, 1.048425, 2.567373, 1, 1, 1, 1, 1,
-0.5272394, 0.05931647, -1.856603, 0, 0, 1, 1, 1,
-0.5269835, -0.4476778, -1.33232, 1, 0, 0, 1, 1,
-0.5250367, -0.6677479, -2.460575, 1, 0, 0, 1, 1,
-0.5145566, 0.4241054, 0.1654249, 1, 0, 0, 1, 1,
-0.5109978, 0.2977394, -0.7543101, 1, 0, 0, 1, 1,
-0.4990272, -0.6501131, -2.661741, 1, 0, 0, 1, 1,
-0.4983474, -1.702495, -2.726168, 0, 0, 0, 1, 1,
-0.4960938, 0.3373348, 2.551368, 0, 0, 0, 1, 1,
-0.4904925, 1.389969, -2.213372, 0, 0, 0, 1, 1,
-0.4844759, -0.6383914, -1.225541, 0, 0, 0, 1, 1,
-0.4817249, 0.6772855, -0.9469911, 0, 0, 0, 1, 1,
-0.4733934, -0.2265001, -2.590982, 0, 0, 0, 1, 1,
-0.4703234, -0.01535482, -2.270839, 0, 0, 0, 1, 1,
-0.4608759, 1.317582, -1.551419, 1, 1, 1, 1, 1,
-0.4546354, -0.759984, -2.727025, 1, 1, 1, 1, 1,
-0.4468964, -0.4307691, -1.257262, 1, 1, 1, 1, 1,
-0.4444115, 0.04263898, 0.3662263, 1, 1, 1, 1, 1,
-0.4427254, 0.8925239, 1.202671, 1, 1, 1, 1, 1,
-0.4404022, -1.953232, -1.572258, 1, 1, 1, 1, 1,
-0.4344856, -0.3131844, -1.334003, 1, 1, 1, 1, 1,
-0.432164, 0.8022285, -2.601941, 1, 1, 1, 1, 1,
-0.4253305, -0.3172849, -3.940325, 1, 1, 1, 1, 1,
-0.4247028, 0.7923386, 0.4267841, 1, 1, 1, 1, 1,
-0.4236163, 0.5090371, -1.860335, 1, 1, 1, 1, 1,
-0.4199488, -1.633661, -1.284075, 1, 1, 1, 1, 1,
-0.4199049, -0.0972288, -0.4464168, 1, 1, 1, 1, 1,
-0.4190729, -0.5701483, -1.448765, 1, 1, 1, 1, 1,
-0.4183975, -1.483046, -2.162859, 1, 1, 1, 1, 1,
-0.4171785, 0.07967994, 0.6948906, 0, 0, 1, 1, 1,
-0.4166058, -0.21342, -2.387016, 1, 0, 0, 1, 1,
-0.4162506, -0.5807096, -1.87963, 1, 0, 0, 1, 1,
-0.4150998, 0.1284582, -1.46969, 1, 0, 0, 1, 1,
-0.4140412, -0.02869403, -0.8337839, 1, 0, 0, 1, 1,
-0.4089449, -1.265758, -1.137541, 1, 0, 0, 1, 1,
-0.4085568, 0.196713, -0.8849178, 0, 0, 0, 1, 1,
-0.4084643, -0.7323784, -2.893086, 0, 0, 0, 1, 1,
-0.4083948, -1.813969, -2.062515, 0, 0, 0, 1, 1,
-0.4062955, -0.5157658, -2.254654, 0, 0, 0, 1, 1,
-0.4048231, 0.09852284, -1.847711, 0, 0, 0, 1, 1,
-0.4045433, -0.3228692, -2.87225, 0, 0, 0, 1, 1,
-0.402284, -0.158173, -2.956115, 0, 0, 0, 1, 1,
-0.4006513, 0.1670122, -0.8599994, 1, 1, 1, 1, 1,
-0.4000798, 1.334354, -0.4693855, 1, 1, 1, 1, 1,
-0.3985389, 1.550747, -1.54275, 1, 1, 1, 1, 1,
-0.3955853, -1.455826, -2.905816, 1, 1, 1, 1, 1,
-0.3945719, 1.183767, -0.7701501, 1, 1, 1, 1, 1,
-0.3945105, -0.3129852, -0.7600369, 1, 1, 1, 1, 1,
-0.3884188, 0.1784653, -0.7228834, 1, 1, 1, 1, 1,
-0.3866237, -2.146509, -2.325783, 1, 1, 1, 1, 1,
-0.3822931, 0.4612284, -0.9215243, 1, 1, 1, 1, 1,
-0.3822658, -1.022074, -3.588408, 1, 1, 1, 1, 1,
-0.381627, -0.3531413, -3.011492, 1, 1, 1, 1, 1,
-0.3809387, -1.750495, -2.674809, 1, 1, 1, 1, 1,
-0.3804382, 0.7491104, -1.251095, 1, 1, 1, 1, 1,
-0.3741682, 0.316559, 1.422724, 1, 1, 1, 1, 1,
-0.3735279, 0.9737761, 1.96161, 1, 1, 1, 1, 1,
-0.3679897, 0.4493174, -0.2689664, 0, 0, 1, 1, 1,
-0.3668034, -0.4874813, -4.296911, 1, 0, 0, 1, 1,
-0.3660298, 0.7763113, 0.8639472, 1, 0, 0, 1, 1,
-0.3657916, 1.956747, -0.730462, 1, 0, 0, 1, 1,
-0.3656473, -2.032655, -1.492339, 1, 0, 0, 1, 1,
-0.3652956, -1.850021, -2.638718, 1, 0, 0, 1, 1,
-0.3636172, -0.3644568, -1.090173, 0, 0, 0, 1, 1,
-0.3635248, -0.3454234, -2.243496, 0, 0, 0, 1, 1,
-0.3597909, 1.334848, -0.8600978, 0, 0, 0, 1, 1,
-0.3590626, 0.9215768, -0.6378356, 0, 0, 0, 1, 1,
-0.3588875, 0.8472115, -0.5474371, 0, 0, 0, 1, 1,
-0.3550864, 0.6511564, 1.608878, 0, 0, 0, 1, 1,
-0.3546216, -0.01040666, -2.662398, 0, 0, 0, 1, 1,
-0.3535964, -1.198737, -1.743854, 1, 1, 1, 1, 1,
-0.3509167, 1.334194, -0.5969061, 1, 1, 1, 1, 1,
-0.3454572, -0.7566276, -1.603316, 1, 1, 1, 1, 1,
-0.3445539, -1.216345, -1.723287, 1, 1, 1, 1, 1,
-0.3434882, -1.070369, -1.473603, 1, 1, 1, 1, 1,
-0.3402479, -0.266876, -3.376512, 1, 1, 1, 1, 1,
-0.3394286, -1.975777, -2.380769, 1, 1, 1, 1, 1,
-0.3354117, -0.7899812, -1.664126, 1, 1, 1, 1, 1,
-0.3298649, 0.7456996, -1.704759, 1, 1, 1, 1, 1,
-0.3272458, -0.7681597, -3.581771, 1, 1, 1, 1, 1,
-0.3256933, 1.133037, 1.205948, 1, 1, 1, 1, 1,
-0.3215911, -0.9354576, -1.630861, 1, 1, 1, 1, 1,
-0.3215443, -0.1314445, 0.3515492, 1, 1, 1, 1, 1,
-0.3211602, 0.3082306, -0.9149801, 1, 1, 1, 1, 1,
-0.3206155, 0.90994, -0.1221725, 1, 1, 1, 1, 1,
-0.3176337, -0.4138279, -3.202769, 0, 0, 1, 1, 1,
-0.3175235, 1.286339, 0.9010709, 1, 0, 0, 1, 1,
-0.3169665, 2.403989, 1.027134, 1, 0, 0, 1, 1,
-0.3144895, 0.7327729, -0.01119209, 1, 0, 0, 1, 1,
-0.3134035, -0.9976332, -2.525751, 1, 0, 0, 1, 1,
-0.3121426, -0.5111507, -2.124745, 1, 0, 0, 1, 1,
-0.3095549, -0.3081452, -1.691398, 0, 0, 0, 1, 1,
-0.3064398, 0.7953736, -1.861997, 0, 0, 0, 1, 1,
-0.3045672, 1.466423, -2.039998, 0, 0, 0, 1, 1,
-0.3030078, 0.004465546, -2.764982, 0, 0, 0, 1, 1,
-0.297135, 1.166716, 0.3471192, 0, 0, 0, 1, 1,
-0.2930417, 0.1278971, -1.568947, 0, 0, 0, 1, 1,
-0.2918399, -0.4241886, -1.166958, 0, 0, 0, 1, 1,
-0.2915635, -0.3703385, -1.963326, 1, 1, 1, 1, 1,
-0.2904932, -0.1848326, -3.105709, 1, 1, 1, 1, 1,
-0.2901303, 0.223245, 0.672471, 1, 1, 1, 1, 1,
-0.2880862, -0.5412847, -3.066954, 1, 1, 1, 1, 1,
-0.2865743, -1.309562, -3.028519, 1, 1, 1, 1, 1,
-0.2864018, 0.2615224, -2.266826, 1, 1, 1, 1, 1,
-0.2775743, 1.206939, -2.083473, 1, 1, 1, 1, 1,
-0.2772695, -0.8205572, -1.633773, 1, 1, 1, 1, 1,
-0.2760772, -0.6958688, -2.588801, 1, 1, 1, 1, 1,
-0.2760398, -0.2372984, -1.626177, 1, 1, 1, 1, 1,
-0.2738397, -1.363919, -4.784713, 1, 1, 1, 1, 1,
-0.273177, -0.9369546, -1.62113, 1, 1, 1, 1, 1,
-0.2719962, -0.1549279, -1.545929, 1, 1, 1, 1, 1,
-0.2715737, -1.414548, -2.105108, 1, 1, 1, 1, 1,
-0.2666202, 0.8092486, -1.197837, 1, 1, 1, 1, 1,
-0.2665923, -0.5153444, -1.774284, 0, 0, 1, 1, 1,
-0.266457, 0.6390178, -0.3489019, 1, 0, 0, 1, 1,
-0.2660264, 0.783978, -0.9253554, 1, 0, 0, 1, 1,
-0.2652328, 0.7059247, 0.0184733, 1, 0, 0, 1, 1,
-0.2633424, 0.2126701, -1.514542, 1, 0, 0, 1, 1,
-0.2625686, 1.042795, -0.6653641, 1, 0, 0, 1, 1,
-0.261457, -1.236402, -2.376637, 0, 0, 0, 1, 1,
-0.2505868, 1.271563, -0.08357644, 0, 0, 0, 1, 1,
-0.249919, 1.013083, -1.363816, 0, 0, 0, 1, 1,
-0.2481743, -0.05916249, -1.737904, 0, 0, 0, 1, 1,
-0.2433061, -0.2871842, -2.218498, 0, 0, 0, 1, 1,
-0.2408294, -0.3700903, -2.314456, 0, 0, 0, 1, 1,
-0.2397131, 1.057292, 0.1207987, 0, 0, 0, 1, 1,
-0.2381986, -0.9617281, -3.830149, 1, 1, 1, 1, 1,
-0.2365263, -0.5790341, -2.184573, 1, 1, 1, 1, 1,
-0.2336825, 0.5101125, -1.912791, 1, 1, 1, 1, 1,
-0.2333696, -0.3736586, -3.408165, 1, 1, 1, 1, 1,
-0.2326728, -0.1059165, -1.154446, 1, 1, 1, 1, 1,
-0.2320909, -0.5352487, -2.406241, 1, 1, 1, 1, 1,
-0.2274735, -1.141464, -3.71502, 1, 1, 1, 1, 1,
-0.2240558, 0.2751407, -1.777754, 1, 1, 1, 1, 1,
-0.2236712, -0.1103653, -1.829726, 1, 1, 1, 1, 1,
-0.2230766, -1.948115, -3.680794, 1, 1, 1, 1, 1,
-0.2210473, -0.8021658, -2.82303, 1, 1, 1, 1, 1,
-0.2065652, 0.7574959, -1.292572, 1, 1, 1, 1, 1,
-0.2051709, -0.2029613, -1.608205, 1, 1, 1, 1, 1,
-0.2050361, -2.013091, -2.496544, 1, 1, 1, 1, 1,
-0.1979792, 0.6776385, 0.1624984, 1, 1, 1, 1, 1,
-0.1961494, 0.8183824, -0.1155648, 0, 0, 1, 1, 1,
-0.1952087, -0.8554366, -3.075483, 1, 0, 0, 1, 1,
-0.1857997, 1.238753, -0.5861062, 1, 0, 0, 1, 1,
-0.1843885, 0.0746669, -0.8929288, 1, 0, 0, 1, 1,
-0.1836873, 1.861613, -1.166952, 1, 0, 0, 1, 1,
-0.1826383, -1.317284, -2.005973, 1, 0, 0, 1, 1,
-0.1739264, -0.1741378, -1.812281, 0, 0, 0, 1, 1,
-0.1730688, 0.1865401, 0.5120272, 0, 0, 0, 1, 1,
-0.1728891, 0.007065451, -0.8394195, 0, 0, 0, 1, 1,
-0.1699157, -1.502802, -2.990705, 0, 0, 0, 1, 1,
-0.1649486, -0.2653636, -3.701631, 0, 0, 0, 1, 1,
-0.164761, 1.350969, 0.3782032, 0, 0, 0, 1, 1,
-0.162005, -0.8343704, -4.008107, 0, 0, 0, 1, 1,
-0.1588073, -1.543984, -5.751369, 1, 1, 1, 1, 1,
-0.1531966, 0.5182587, -2.107085, 1, 1, 1, 1, 1,
-0.1453167, -0.1957714, -2.466812, 1, 1, 1, 1, 1,
-0.1393729, -0.1151799, -1.917852, 1, 1, 1, 1, 1,
-0.1385457, 1.336064, 0.7515531, 1, 1, 1, 1, 1,
-0.135563, -0.2420344, -2.442415, 1, 1, 1, 1, 1,
-0.1321111, 0.7082589, -1.657223, 1, 1, 1, 1, 1,
-0.1276426, -0.1045377, -1.926143, 1, 1, 1, 1, 1,
-0.1233, -0.1813912, -1.518144, 1, 1, 1, 1, 1,
-0.116763, 0.6497988, -0.8004849, 1, 1, 1, 1, 1,
-0.1151288, 1.050304, -1.060374, 1, 1, 1, 1, 1,
-0.1109712, 0.4065936, -0.6822159, 1, 1, 1, 1, 1,
-0.1098786, 1.911984, 0.160501, 1, 1, 1, 1, 1,
-0.109658, 0.907752, -0.905274, 1, 1, 1, 1, 1,
-0.1084573, -0.6244386, -2.338179, 1, 1, 1, 1, 1,
-0.1057564, -1.995947, -5.021435, 0, 0, 1, 1, 1,
-0.1055365, -0.9967251, -3.876801, 1, 0, 0, 1, 1,
-0.1053385, 0.0557801, -1.559239, 1, 0, 0, 1, 1,
-0.1051793, -0.1447303, -4.287877, 1, 0, 0, 1, 1,
-0.1048899, 0.1326591, -0.5710365, 1, 0, 0, 1, 1,
-0.1033506, -2.380276, -2.175776, 1, 0, 0, 1, 1,
-0.1029618, -0.5774056, -2.985724, 0, 0, 0, 1, 1,
-0.1017509, -2.306764, -4.742206, 0, 0, 0, 1, 1,
-0.09693525, -1.005643, -3.894982, 0, 0, 0, 1, 1,
-0.09251199, 1.16918, -0.7365769, 0, 0, 0, 1, 1,
-0.08986226, -0.5682364, -4.049893, 0, 0, 0, 1, 1,
-0.0861026, -0.1315258, -2.89205, 0, 0, 0, 1, 1,
-0.083474, 1.042224, -0.276805, 0, 0, 0, 1, 1,
-0.08216664, -0.2895359, -1.509763, 1, 1, 1, 1, 1,
-0.08119731, 1.334337, -0.4101114, 1, 1, 1, 1, 1,
-0.07617629, 0.9606513, 0.6280285, 1, 1, 1, 1, 1,
-0.07435491, -0.7036555, -3.459402, 1, 1, 1, 1, 1,
-0.07259764, 1.456625, -0.771346, 1, 1, 1, 1, 1,
-0.07231452, -0.2719398, -2.752687, 1, 1, 1, 1, 1,
-0.06962481, 0.1465526, 0.1140834, 1, 1, 1, 1, 1,
-0.06884234, 0.1222247, -0.5713821, 1, 1, 1, 1, 1,
-0.06777867, -0.09400448, -3.421569, 1, 1, 1, 1, 1,
-0.06763408, 1.754528, -1.080341, 1, 1, 1, 1, 1,
-0.06592125, 0.1593835, -0.5464405, 1, 1, 1, 1, 1,
-0.06360439, -0.4730087, -1.651875, 1, 1, 1, 1, 1,
-0.06260329, -0.1659741, -3.06691, 1, 1, 1, 1, 1,
-0.06036891, -0.4995227, -1.96479, 1, 1, 1, 1, 1,
-0.05836958, 0.3048639, -0.9143777, 1, 1, 1, 1, 1,
-0.05777792, 0.05463973, 1.022971, 0, 0, 1, 1, 1,
-0.05341069, -0.3291219, -2.693392, 1, 0, 0, 1, 1,
-0.05037466, 0.5035462, 1.884647, 1, 0, 0, 1, 1,
-0.04469153, -0.5842296, -4.361883, 1, 0, 0, 1, 1,
-0.04186473, -0.8274543, -2.100343, 1, 0, 0, 1, 1,
-0.03963569, 0.4208165, -0.05865246, 1, 0, 0, 1, 1,
-0.03605082, 0.2617089, 0.1846455, 0, 0, 0, 1, 1,
-0.03415722, 0.784795, -1.063787, 0, 0, 0, 1, 1,
-0.02993733, 0.758712, -0.705944, 0, 0, 0, 1, 1,
-0.02987355, -0.03889115, -3.345658, 0, 0, 0, 1, 1,
-0.02442253, -0.1618983, -4.599504, 0, 0, 0, 1, 1,
-0.02420887, 0.3289953, 0.5984952, 0, 0, 0, 1, 1,
-0.01669753, -0.7523884, -3.571434, 0, 0, 0, 1, 1,
-0.0067, -1.037456, -2.397554, 1, 1, 1, 1, 1,
-0.004111031, 0.5257837, 1.147083, 1, 1, 1, 1, 1,
3.956586e-05, -0.6492811, 4.69746, 1, 1, 1, 1, 1,
0.0002436719, 0.2861949, -0.6955422, 1, 1, 1, 1, 1,
0.008417072, -0.01053918, 3.39752, 1, 1, 1, 1, 1,
0.008816015, 0.09372509, 1.910498, 1, 1, 1, 1, 1,
0.008945297, -2.041768, 4.4207, 1, 1, 1, 1, 1,
0.0107415, 1.918897, 1.896109, 1, 1, 1, 1, 1,
0.01860902, -0.3876953, 3.064393, 1, 1, 1, 1, 1,
0.01909534, -0.669075, 2.449007, 1, 1, 1, 1, 1,
0.02007675, 0.9295477, 0.8273697, 1, 1, 1, 1, 1,
0.02126539, 0.8093567, -0.2258678, 1, 1, 1, 1, 1,
0.02676148, 0.4711509, -0.7265201, 1, 1, 1, 1, 1,
0.02949793, -0.3763705, 1.781776, 1, 1, 1, 1, 1,
0.02991309, -0.2930775, 1.463495, 1, 1, 1, 1, 1,
0.04594128, -1.628269, 3.641757, 0, 0, 1, 1, 1,
0.04727452, 1.383258, -0.05008097, 1, 0, 0, 1, 1,
0.04774769, 1.676045, -0.506044, 1, 0, 0, 1, 1,
0.05641, -0.3314432, 1.495686, 1, 0, 0, 1, 1,
0.06916284, 1.167701, -1.758208, 1, 0, 0, 1, 1,
0.06961782, -0.007752037, -0.5674388, 1, 0, 0, 1, 1,
0.07042535, -1.077505, 4.219683, 0, 0, 0, 1, 1,
0.0706612, -0.5642506, 2.027079, 0, 0, 0, 1, 1,
0.07095534, -0.5655695, 2.33366, 0, 0, 0, 1, 1,
0.07229397, 0.3248369, -1.703351, 0, 0, 0, 1, 1,
0.07273928, -0.3383837, 2.940558, 0, 0, 0, 1, 1,
0.07446006, 1.371814, -0.2668296, 0, 0, 0, 1, 1,
0.07473698, 0.8599092, -0.1643663, 0, 0, 0, 1, 1,
0.07519928, 0.7267082, 0.6173118, 1, 1, 1, 1, 1,
0.0765062, -1.053948, 2.720054, 1, 1, 1, 1, 1,
0.07808374, -0.2725626, 2.032126, 1, 1, 1, 1, 1,
0.07889955, -0.5285709, 3.252958, 1, 1, 1, 1, 1,
0.07896675, -0.3574089, 4.694246, 1, 1, 1, 1, 1,
0.08084421, 0.05169076, -0.00193383, 1, 1, 1, 1, 1,
0.08600672, 0.8216675, 1.682814, 1, 1, 1, 1, 1,
0.08773738, 0.6784151, -0.9300533, 1, 1, 1, 1, 1,
0.09306602, -1.554416, 3.986449, 1, 1, 1, 1, 1,
0.09635547, 0.7367568, 1.677844, 1, 1, 1, 1, 1,
0.09689992, -0.5988718, 3.183949, 1, 1, 1, 1, 1,
0.0972117, 0.1962778, 2.743582, 1, 1, 1, 1, 1,
0.09799016, 0.2034894, -0.001017094, 1, 1, 1, 1, 1,
0.09959994, -1.151585, 1.751063, 1, 1, 1, 1, 1,
0.1027123, -0.5589988, 2.752583, 1, 1, 1, 1, 1,
0.1036473, -0.9145527, 2.093005, 0, 0, 1, 1, 1,
0.1047918, 0.7359723, 0.617534, 1, 0, 0, 1, 1,
0.1071272, 0.8334116, 0.663745, 1, 0, 0, 1, 1,
0.1088645, -0.752402, 4.577086, 1, 0, 0, 1, 1,
0.1130821, 0.7824216, 0.201916, 1, 0, 0, 1, 1,
0.113579, 0.1048153, 2.103788, 1, 0, 0, 1, 1,
0.1153184, 0.1865341, 0.4286546, 0, 0, 0, 1, 1,
0.1223619, -1.21094, 3.148237, 0, 0, 0, 1, 1,
0.1244905, 0.7664675, -0.2924017, 0, 0, 0, 1, 1,
0.1337424, -0.1906775, 3.734703, 0, 0, 0, 1, 1,
0.1456345, -0.01464238, -0.6165826, 0, 0, 0, 1, 1,
0.1556965, -2.461358, 2.339472, 0, 0, 0, 1, 1,
0.1660987, 0.9151424, 0.3082785, 0, 0, 0, 1, 1,
0.1687731, 0.5405276, -0.9255049, 1, 1, 1, 1, 1,
0.1773423, -0.8655533, 0.9356772, 1, 1, 1, 1, 1,
0.178121, -0.0408537, 3.593284, 1, 1, 1, 1, 1,
0.179693, -1.715917, 2.405059, 1, 1, 1, 1, 1,
0.1810928, -2.401706, 2.737351, 1, 1, 1, 1, 1,
0.1841156, 0.4899896, -0.3862652, 1, 1, 1, 1, 1,
0.1852192, 0.9622468, -0.8781916, 1, 1, 1, 1, 1,
0.1857328, 0.4122455, 1.518723, 1, 1, 1, 1, 1,
0.186568, -0.3197531, 1.614156, 1, 1, 1, 1, 1,
0.1876988, -1.134325, 2.787121, 1, 1, 1, 1, 1,
0.1896088, 0.3998876, 0.6591454, 1, 1, 1, 1, 1,
0.195548, 0.357119, 0.2349141, 1, 1, 1, 1, 1,
0.1998026, -0.5776588, 3.316157, 1, 1, 1, 1, 1,
0.2010814, 0.04105722, 1.093183, 1, 1, 1, 1, 1,
0.2051716, -0.359099, 1.658762, 1, 1, 1, 1, 1,
0.2071679, 0.1804341, -0.2376341, 0, 0, 1, 1, 1,
0.2090024, -0.4618483, 5.073352, 1, 0, 0, 1, 1,
0.2098683, 1.182651, -1.722412, 1, 0, 0, 1, 1,
0.2113484, -0.0456709, 1.167271, 1, 0, 0, 1, 1,
0.2169067, -1.724984, 2.63196, 1, 0, 0, 1, 1,
0.2202473, -1.553645, 5.141945, 1, 0, 0, 1, 1,
0.22283, -0.1430799, 2.33899, 0, 0, 0, 1, 1,
0.2274153, -1.268712, 3.351726, 0, 0, 0, 1, 1,
0.2280389, 0.02969602, 3.012374, 0, 0, 0, 1, 1,
0.2290628, 0.1711931, 1.809639, 0, 0, 0, 1, 1,
0.2356738, -0.6217343, 3.06742, 0, 0, 0, 1, 1,
0.2363581, -1.128306, 3.5929, 0, 0, 0, 1, 1,
0.2374338, 1.730286, -0.6901911, 0, 0, 0, 1, 1,
0.2410528, 0.4684242, -0.33183, 1, 1, 1, 1, 1,
0.2423252, 0.9904542, 1.910153, 1, 1, 1, 1, 1,
0.2429101, 0.1699913, 1.085489, 1, 1, 1, 1, 1,
0.2508842, -0.08797485, 1.827668, 1, 1, 1, 1, 1,
0.2560029, 0.1270277, 0.7822361, 1, 1, 1, 1, 1,
0.2572734, -0.5220892, 4.167881, 1, 1, 1, 1, 1,
0.2583284, 0.1839966, 0.9060292, 1, 1, 1, 1, 1,
0.2603818, -1.021862, 2.688851, 1, 1, 1, 1, 1,
0.2624818, -0.425754, 2.383962, 1, 1, 1, 1, 1,
0.2635317, 1.9159, -0.08770349, 1, 1, 1, 1, 1,
0.2645756, -0.6491154, 1.846477, 1, 1, 1, 1, 1,
0.2657888, 0.9811401, 0.5759057, 1, 1, 1, 1, 1,
0.2696754, -1.174251, 3.175505, 1, 1, 1, 1, 1,
0.2735372, 0.6771419, 1.235904, 1, 1, 1, 1, 1,
0.2757149, -0.8601615, 4.817072, 1, 1, 1, 1, 1,
0.2786192, -1.3459, 3.898556, 0, 0, 1, 1, 1,
0.2786861, -0.7530374, 2.887568, 1, 0, 0, 1, 1,
0.2788925, -0.03630503, 2.754121, 1, 0, 0, 1, 1,
0.2793686, 2.614626, 1.60662, 1, 0, 0, 1, 1,
0.280183, 2.051413, 2.510662, 1, 0, 0, 1, 1,
0.2824829, -1.041269, 3.061117, 1, 0, 0, 1, 1,
0.2828206, 0.1631551, 3.076982, 0, 0, 0, 1, 1,
0.2899363, -1.578892, 2.723921, 0, 0, 0, 1, 1,
0.2919556, -1.697988, 2.017742, 0, 0, 0, 1, 1,
0.2923852, 0.6458637, -0.740902, 0, 0, 0, 1, 1,
0.2931747, 0.1728369, 1.852234, 0, 0, 0, 1, 1,
0.2957988, -0.7756063, 4.262262, 0, 0, 0, 1, 1,
0.296692, -1.496439, 3.66597, 0, 0, 0, 1, 1,
0.3013137, -0.0331261, -1.069257, 1, 1, 1, 1, 1,
0.3045239, -0.5233318, 2.887841, 1, 1, 1, 1, 1,
0.3047833, 2.125749, -2.047892, 1, 1, 1, 1, 1,
0.304851, 0.01373353, 3.754168, 1, 1, 1, 1, 1,
0.3067257, -1.52834, 2.59317, 1, 1, 1, 1, 1,
0.3067355, -0.8671877, 0.90405, 1, 1, 1, 1, 1,
0.3077756, -0.8950461, 2.979102, 1, 1, 1, 1, 1,
0.3092994, 1.602117, 0.7707523, 1, 1, 1, 1, 1,
0.314427, -0.9351438, 1.750308, 1, 1, 1, 1, 1,
0.3153873, -0.3621996, 1.979271, 1, 1, 1, 1, 1,
0.3156435, 0.4635677, 0.906609, 1, 1, 1, 1, 1,
0.321336, -0.7272353, 3.266935, 1, 1, 1, 1, 1,
0.325322, 1.19049, 0.09458178, 1, 1, 1, 1, 1,
0.3261038, -0.7587379, 2.429756, 1, 1, 1, 1, 1,
0.3327446, 0.3559066, 1.803189, 1, 1, 1, 1, 1,
0.3335136, 0.3009483, -0.6372272, 0, 0, 1, 1, 1,
0.3348758, 0.6972488, 1.34964, 1, 0, 0, 1, 1,
0.33598, 1.233811, -0.1329164, 1, 0, 0, 1, 1,
0.3362242, -0.1258449, 4.017207, 1, 0, 0, 1, 1,
0.3389972, 0.5217144, 2.360122, 1, 0, 0, 1, 1,
0.3417454, 0.6318148, 0.8481311, 1, 0, 0, 1, 1,
0.3433799, 0.9945627, 0.6452674, 0, 0, 0, 1, 1,
0.3448014, -0.2922169, 1.424558, 0, 0, 0, 1, 1,
0.3452294, 2.726677, -0.727838, 0, 0, 0, 1, 1,
0.3462289, -0.7236695, 3.683634, 0, 0, 0, 1, 1,
0.3463186, 1.804758, 0.839718, 0, 0, 0, 1, 1,
0.3463482, -0.05514209, 1.228647, 0, 0, 0, 1, 1,
0.3556561, -0.4759225, 1.316457, 0, 0, 0, 1, 1,
0.3578651, -0.578367, 1.950133, 1, 1, 1, 1, 1,
0.3681248, -0.9259776, 2.541527, 1, 1, 1, 1, 1,
0.3691377, -0.9198539, 2.399211, 1, 1, 1, 1, 1,
0.3712761, 0.8746662, 0.742614, 1, 1, 1, 1, 1,
0.3802152, -0.6896071, 3.735972, 1, 1, 1, 1, 1,
0.3807244, 0.09927987, 1.918858, 1, 1, 1, 1, 1,
0.3814859, 0.5499766, -0.0907562, 1, 1, 1, 1, 1,
0.3822178, -1.067116, 2.893701, 1, 1, 1, 1, 1,
0.3833351, -1.467901, 3.52186, 1, 1, 1, 1, 1,
0.3856885, 0.3412156, 0.8188049, 1, 1, 1, 1, 1,
0.3886093, 1.371387, -0.3905886, 1, 1, 1, 1, 1,
0.3910837, 1.011119, 0.08172418, 1, 1, 1, 1, 1,
0.3925222, -0.1895667, 1.288001, 1, 1, 1, 1, 1,
0.3929318, 0.1608929, -0.8729662, 1, 1, 1, 1, 1,
0.3980296, 0.3737548, -0.0228473, 1, 1, 1, 1, 1,
0.3981417, -0.9760901, 4.449552, 0, 0, 1, 1, 1,
0.3981797, 0.8943808, -1.065436, 1, 0, 0, 1, 1,
0.4013519, -1.766619, 2.381416, 1, 0, 0, 1, 1,
0.4078761, 0.1877688, 0.6050149, 1, 0, 0, 1, 1,
0.4145975, -0.148469, 0.7398149, 1, 0, 0, 1, 1,
0.4205481, -2.584465, 2.071941, 1, 0, 0, 1, 1,
0.4274694, -1.663439, 3.120934, 0, 0, 0, 1, 1,
0.4280842, 0.9168, -0.8482683, 0, 0, 0, 1, 1,
0.4318669, 0.07924091, 2.037092, 0, 0, 0, 1, 1,
0.4319992, -0.02168629, -0.1024418, 0, 0, 0, 1, 1,
0.4349932, -0.4545439, 3.258459, 0, 0, 0, 1, 1,
0.442598, 2.619566, 1.108919, 0, 0, 0, 1, 1,
0.4444798, -0.990571, 2.487865, 0, 0, 0, 1, 1,
0.4473906, 2.07066, 0.8012787, 1, 1, 1, 1, 1,
0.4570183, -0.9943128, 3.203457, 1, 1, 1, 1, 1,
0.4592318, -0.9281264, 1.731289, 1, 1, 1, 1, 1,
0.4596173, 0.1576276, 0.5497048, 1, 1, 1, 1, 1,
0.4654602, -0.7560908, 3.146789, 1, 1, 1, 1, 1,
0.4671681, -2.156242, 3.833034, 1, 1, 1, 1, 1,
0.4695705, 1.05287, 0.2620551, 1, 1, 1, 1, 1,
0.4695895, 1.116375, 1.00768, 1, 1, 1, 1, 1,
0.4698365, 0.7452641, 1.851472, 1, 1, 1, 1, 1,
0.4771445, -0.2760069, 0.6480098, 1, 1, 1, 1, 1,
0.4784911, 0.5312901, 1.32279, 1, 1, 1, 1, 1,
0.4801259, 0.7007072, 0.2156954, 1, 1, 1, 1, 1,
0.4823427, -1.398651, 4.167363, 1, 1, 1, 1, 1,
0.4848854, -0.2452242, 2.418809, 1, 1, 1, 1, 1,
0.4873294, 0.737242, 1.866142, 1, 1, 1, 1, 1,
0.4912516, -0.509896, 1.856003, 0, 0, 1, 1, 1,
0.4915792, 1.373359, 0.6605258, 1, 0, 0, 1, 1,
0.4973223, 0.5487227, 0.2625321, 1, 0, 0, 1, 1,
0.4977381, 0.586987, -0.08015287, 1, 0, 0, 1, 1,
0.497949, -0.4382508, 3.026744, 1, 0, 0, 1, 1,
0.5025343, -1.476086, 2.891694, 1, 0, 0, 1, 1,
0.5041756, -0.03508281, 2.655232, 0, 0, 0, 1, 1,
0.5086179, 0.8042166, 1.122225, 0, 0, 0, 1, 1,
0.5098805, -1.663445, 4.210124, 0, 0, 0, 1, 1,
0.5105733, -0.3526968, 1.434952, 0, 0, 0, 1, 1,
0.5118471, -1.743409, 2.568172, 0, 0, 0, 1, 1,
0.5125499, 0.4860295, -0.2281367, 0, 0, 0, 1, 1,
0.5150567, -0.2964988, 2.552607, 0, 0, 0, 1, 1,
0.5174916, 1.016159, 0.9696105, 1, 1, 1, 1, 1,
0.5175252, -1.458793, 1.338755, 1, 1, 1, 1, 1,
0.5197801, 0.538393, -0.3600027, 1, 1, 1, 1, 1,
0.5216544, 0.4484104, 1.016502, 1, 1, 1, 1, 1,
0.5297084, -0.4896162, 3.660362, 1, 1, 1, 1, 1,
0.5376291, 0.1443961, 1.261115, 1, 1, 1, 1, 1,
0.5378526, 0.6476878, 0.7008788, 1, 1, 1, 1, 1,
0.5387717, -0.367366, 1.971422, 1, 1, 1, 1, 1,
0.543338, -0.01026863, 3.626643, 1, 1, 1, 1, 1,
0.5474648, 1.08494, 1.203152, 1, 1, 1, 1, 1,
0.5499699, 0.8750682, -0.6341721, 1, 1, 1, 1, 1,
0.5528577, 0.5414128, 1.12275, 1, 1, 1, 1, 1,
0.5540886, 2.070625, -0.1629721, 1, 1, 1, 1, 1,
0.5548829, -0.4995565, 1.049731, 1, 1, 1, 1, 1,
0.5550967, 1.014678, 0.1229701, 1, 1, 1, 1, 1,
0.5552322, 0.02421145, 3.859919, 0, 0, 1, 1, 1,
0.5562135, 0.09788208, 1.548086, 1, 0, 0, 1, 1,
0.5582323, 1.393367, 1.415049, 1, 0, 0, 1, 1,
0.5651684, 0.08455182, 1.272994, 1, 0, 0, 1, 1,
0.5662687, -1.907573, 1.963873, 1, 0, 0, 1, 1,
0.5665183, -0.164016, 1.603914, 1, 0, 0, 1, 1,
0.5727757, -1.309284, 1.907115, 0, 0, 0, 1, 1,
0.5738467, 2.280989, 0.6340805, 0, 0, 0, 1, 1,
0.576727, 1.25571, 1.306644, 0, 0, 0, 1, 1,
0.5785751, 0.260156, 2.558291, 0, 0, 0, 1, 1,
0.5833036, -0.3177706, 1.442649, 0, 0, 0, 1, 1,
0.5838506, 0.68976, 2.868798, 0, 0, 0, 1, 1,
0.5848079, -0.4226941, 2.24578, 0, 0, 0, 1, 1,
0.5864522, 0.9819797, -0.5122397, 1, 1, 1, 1, 1,
0.5877966, -1.205965, 2.349441, 1, 1, 1, 1, 1,
0.5899295, -0.1791989, 2.854419, 1, 1, 1, 1, 1,
0.5906985, -1.249886, -0.202546, 1, 1, 1, 1, 1,
0.5939627, -1.152395, 1.666986, 1, 1, 1, 1, 1,
0.5960444, -0.5812523, 1.33514, 1, 1, 1, 1, 1,
0.606366, 1.763566, -0.8934083, 1, 1, 1, 1, 1,
0.6073405, 0.4804915, 2.675296, 1, 1, 1, 1, 1,
0.6148387, 0.7775495, 1.035805, 1, 1, 1, 1, 1,
0.6179365, 2.016422, -0.5442992, 1, 1, 1, 1, 1,
0.6187333, 0.1336247, 0.1488298, 1, 1, 1, 1, 1,
0.6206902, -0.9145299, 1.973741, 1, 1, 1, 1, 1,
0.6258359, -0.5224707, 3.817955, 1, 1, 1, 1, 1,
0.6266665, -0.7860158, 2.008666, 1, 1, 1, 1, 1,
0.626899, -0.2816341, -0.4284781, 1, 1, 1, 1, 1,
0.6360577, -2.973346, 1.262043, 0, 0, 1, 1, 1,
0.6373476, -0.8254932, 2.957031, 1, 0, 0, 1, 1,
0.6384503, 0.5513464, 1.781609, 1, 0, 0, 1, 1,
0.642129, 0.2325068, 3.249963, 1, 0, 0, 1, 1,
0.6444229, 0.0450367, 1.191369, 1, 0, 0, 1, 1,
0.6461049, 1.410321, 0.9965356, 1, 0, 0, 1, 1,
0.6465021, 1.168517, 0.4208933, 0, 0, 0, 1, 1,
0.6473784, 0.6772903, 1.883422, 0, 0, 0, 1, 1,
0.6494624, 0.4723574, -0.1249258, 0, 0, 0, 1, 1,
0.6513712, 1.030442, 0.8705515, 0, 0, 0, 1, 1,
0.6525756, 0.2203288, 0.9593468, 0, 0, 0, 1, 1,
0.6549726, -2.386127, 3.772142, 0, 0, 0, 1, 1,
0.6575052, 0.3609913, 0.03235688, 0, 0, 0, 1, 1,
0.6628302, 0.6610746, -0.3307309, 1, 1, 1, 1, 1,
0.6673338, 0.7813597, 1.121186, 1, 1, 1, 1, 1,
0.6719889, 1.568526, 0.5933223, 1, 1, 1, 1, 1,
0.6808489, -0.9332163, 2.008982, 1, 1, 1, 1, 1,
0.6951967, 0.09411538, 0.7912305, 1, 1, 1, 1, 1,
0.6969683, -2.483589, 2.811995, 1, 1, 1, 1, 1,
0.6977164, -0.1103741, 2.902081, 1, 1, 1, 1, 1,
0.7120352, 0.4974771, -0.2819794, 1, 1, 1, 1, 1,
0.7140801, 1.087187, 2.053293, 1, 1, 1, 1, 1,
0.7154319, -1.620999, 3.34398, 1, 1, 1, 1, 1,
0.7160014, -0.5348953, 0.6932893, 1, 1, 1, 1, 1,
0.7280426, -0.1819825, 0.199934, 1, 1, 1, 1, 1,
0.7319883, 0.2196705, 0.8715389, 1, 1, 1, 1, 1,
0.7362652, -0.8133192, 1.696538, 1, 1, 1, 1, 1,
0.755224, 0.5789266, 1.264844, 1, 1, 1, 1, 1,
0.7555797, 0.7256897, 2.629474, 0, 0, 1, 1, 1,
0.756826, -1.132306, 4.700524, 1, 0, 0, 1, 1,
0.7568274, -1.299875, 1.85105, 1, 0, 0, 1, 1,
0.7627661, -0.03231417, 0.6767852, 1, 0, 0, 1, 1,
0.7658927, -0.4286845, 3.182669, 1, 0, 0, 1, 1,
0.7664608, 0.2077109, 2.818175, 1, 0, 0, 1, 1,
0.7668898, -1.976713, 2.60209, 0, 0, 0, 1, 1,
0.7687768, 0.8666589, 0.5467833, 0, 0, 0, 1, 1,
0.7719573, -0.3268065, 2.265076, 0, 0, 0, 1, 1,
0.777344, -0.166104, 2.813927, 0, 0, 0, 1, 1,
0.778724, -0.06326707, 2.064173, 0, 0, 0, 1, 1,
0.7902079, 0.2187293, 2.835701, 0, 0, 0, 1, 1,
0.79083, 1.088348, 0.9485421, 0, 0, 0, 1, 1,
0.7910378, 0.114681, 0.6491764, 1, 1, 1, 1, 1,
0.7912943, 0.1205219, 0.1733947, 1, 1, 1, 1, 1,
0.7957179, 2.108394, -0.1522057, 1, 1, 1, 1, 1,
0.7966838, 2.325971, 0.06757616, 1, 1, 1, 1, 1,
0.801169, 0.08081211, 2.926012, 1, 1, 1, 1, 1,
0.8020381, -0.5051118, 1.846559, 1, 1, 1, 1, 1,
0.8080538, -0.1930047, 0.7199521, 1, 1, 1, 1, 1,
0.8135012, -0.6046794, 1.418746, 1, 1, 1, 1, 1,
0.8139011, -0.3720603, 1.010411, 1, 1, 1, 1, 1,
0.8169845, 0.5013991, 0.5710359, 1, 1, 1, 1, 1,
0.8179736, -0.4866172, 2.744653, 1, 1, 1, 1, 1,
0.8181393, 0.5645104, 1.280178, 1, 1, 1, 1, 1,
0.8186284, -0.1597862, 1.896106, 1, 1, 1, 1, 1,
0.8323057, 1.237285, 1.238752, 1, 1, 1, 1, 1,
0.8330756, 0.2214056, 1.284327, 1, 1, 1, 1, 1,
0.8411112, -0.8122043, 2.765123, 0, 0, 1, 1, 1,
0.8424122, -0.3077423, 1.764324, 1, 0, 0, 1, 1,
0.8534001, -0.8737292, 1.070581, 1, 0, 0, 1, 1,
0.8591059, 0.08831906, 2.655861, 1, 0, 0, 1, 1,
0.8593417, -0.2337868, 1.508877, 1, 0, 0, 1, 1,
0.8615565, 0.4630713, -0.09461693, 1, 0, 0, 1, 1,
0.8638152, 1.08592, -0.9667339, 0, 0, 0, 1, 1,
0.8647012, 1.159905, 0.4460173, 0, 0, 0, 1, 1,
0.8661177, 0.000413262, 2.934509, 0, 0, 0, 1, 1,
0.8662296, 0.4601574, 0.4023986, 0, 0, 0, 1, 1,
0.8701343, 0.4489126, -1.44758, 0, 0, 0, 1, 1,
0.8768256, 0.05990512, 0.3498245, 0, 0, 0, 1, 1,
0.8773, -0.4955273, 2.033623, 0, 0, 0, 1, 1,
0.8794978, -0.6199299, 1.794412, 1, 1, 1, 1, 1,
0.895881, -0.358978, 0.9971607, 1, 1, 1, 1, 1,
0.9007488, -0.09591048, -0.4329157, 1, 1, 1, 1, 1,
0.9010237, 0.01658375, 1.461172, 1, 1, 1, 1, 1,
0.9015326, -0.09966413, 0.5043541, 1, 1, 1, 1, 1,
0.9084792, -0.6457866, 2.751701, 1, 1, 1, 1, 1,
0.9147393, -0.5840622, 2.454577, 1, 1, 1, 1, 1,
0.92305, 0.4290041, 0.6857712, 1, 1, 1, 1, 1,
0.9230589, 1.244083, 0.8797442, 1, 1, 1, 1, 1,
0.9244006, -2.29184, 2.429473, 1, 1, 1, 1, 1,
0.9278081, -0.3901259, 2.472478, 1, 1, 1, 1, 1,
0.9390092, -1.359557, 3.660195, 1, 1, 1, 1, 1,
0.9413661, 0.7305651, -0.364401, 1, 1, 1, 1, 1,
0.9423814, -0.3050692, 1.169762, 1, 1, 1, 1, 1,
0.943417, 1.319593, 0.8646308, 1, 1, 1, 1, 1,
0.9438251, 0.1946367, 0.5007365, 0, 0, 1, 1, 1,
0.94589, -0.9912387, 4.053678, 1, 0, 0, 1, 1,
0.9507419, 0.4281359, 1.746029, 1, 0, 0, 1, 1,
0.9712663, -0.4428758, 2.517596, 1, 0, 0, 1, 1,
0.973478, 0.1993423, 2.255069, 1, 0, 0, 1, 1,
0.981441, -0.765007, 1.993524, 1, 0, 0, 1, 1,
0.9820364, 0.9006768, 1.129263, 0, 0, 0, 1, 1,
0.9907891, -0.4719754, 0.7972076, 0, 0, 0, 1, 1,
0.991318, 0.6949859, 2.50128, 0, 0, 0, 1, 1,
0.9945412, -0.2833386, 0.4787531, 0, 0, 0, 1, 1,
0.9946142, -1.486132, 4.433923, 0, 0, 0, 1, 1,
0.9951704, 0.4619049, -0.7849417, 0, 0, 0, 1, 1,
0.9981554, -0.1333144, -0.3987264, 0, 0, 0, 1, 1,
0.9990754, -0.8749887, 0.8976178, 1, 1, 1, 1, 1,
1.005368, -0.5570266, 2.198548, 1, 1, 1, 1, 1,
1.008167, 0.7448926, 1.599232, 1, 1, 1, 1, 1,
1.020179, 1.251305, 1.251426, 1, 1, 1, 1, 1,
1.022437, 0.651032, 1.242836, 1, 1, 1, 1, 1,
1.023419, 0.7860495, 1.571505, 1, 1, 1, 1, 1,
1.023936, -0.7612639, 1.617438, 1, 1, 1, 1, 1,
1.028769, 1.393547, -1.221661, 1, 1, 1, 1, 1,
1.029354, 1.09841, 1.093676, 1, 1, 1, 1, 1,
1.030838, -0.8567739, 2.803495, 1, 1, 1, 1, 1,
1.032367, -0.6408377, 2.936826, 1, 1, 1, 1, 1,
1.033202, 0.2956851, 2.57097, 1, 1, 1, 1, 1,
1.036149, -0.1916441, 1.983516, 1, 1, 1, 1, 1,
1.040251, 0.692239, 0.9152088, 1, 1, 1, 1, 1,
1.043236, 0.679918, 1.298257, 1, 1, 1, 1, 1,
1.048646, -0.06798013, 1.745509, 0, 0, 1, 1, 1,
1.052464, 0.3774638, 1.541638, 1, 0, 0, 1, 1,
1.061094, -0.149841, 2.006903, 1, 0, 0, 1, 1,
1.061541, 1.148827, 0.06376696, 1, 0, 0, 1, 1,
1.063946, -0.5513741, 1.328876, 1, 0, 0, 1, 1,
1.069191, 1.721116, 0.2159929, 1, 0, 0, 1, 1,
1.073649, -0.3467463, 1.532744, 0, 0, 0, 1, 1,
1.083908, 0.3039791, 0.8593268, 0, 0, 0, 1, 1,
1.086617, -0.127531, 1.09166, 0, 0, 0, 1, 1,
1.088078, -0.366164, 1.065302, 0, 0, 0, 1, 1,
1.095538, -0.8866304, 2.285396, 0, 0, 0, 1, 1,
1.096972, 0.3414417, 2.527009, 0, 0, 0, 1, 1,
1.099036, 0.6203876, 0.5048486, 0, 0, 0, 1, 1,
1.108463, 1.240095, 1.54827, 1, 1, 1, 1, 1,
1.112182, 1.113545, 1.182062, 1, 1, 1, 1, 1,
1.115253, -0.6824826, 1.743936, 1, 1, 1, 1, 1,
1.116188, -1.22301, 0.7470141, 1, 1, 1, 1, 1,
1.117231, 1.003356, 0.9159802, 1, 1, 1, 1, 1,
1.117902, -0.01785129, 1.285627, 1, 1, 1, 1, 1,
1.119738, 0.2225809, 0.7173749, 1, 1, 1, 1, 1,
1.127218, 1.709776, -0.6925173, 1, 1, 1, 1, 1,
1.127289, 0.1874761, 1.265901, 1, 1, 1, 1, 1,
1.135001, -0.06412872, 3.061983, 1, 1, 1, 1, 1,
1.137634, 0.8060687, 1.800479, 1, 1, 1, 1, 1,
1.138407, -0.2763438, 2.181684, 1, 1, 1, 1, 1,
1.138722, 1.129317, 0.2142769, 1, 1, 1, 1, 1,
1.144306, 0.4546061, 1.502048, 1, 1, 1, 1, 1,
1.14718, 0.4136223, 0.8665248, 1, 1, 1, 1, 1,
1.150761, 0.06108486, 0.7964784, 0, 0, 1, 1, 1,
1.151561, -0.952879, 0.290821, 1, 0, 0, 1, 1,
1.156015, -1.04486, 2.674838, 1, 0, 0, 1, 1,
1.165646, -0.7025524, 0.9343082, 1, 0, 0, 1, 1,
1.16616, -0.6291211, 3.048355, 1, 0, 0, 1, 1,
1.166897, 0.3819926, 0.4571082, 1, 0, 0, 1, 1,
1.168109, 0.2101017, -0.2575386, 0, 0, 0, 1, 1,
1.179987, 0.545799, 1.181115, 0, 0, 0, 1, 1,
1.188114, -0.1506015, 1.879071, 0, 0, 0, 1, 1,
1.194096, 0.6820244, 1.867298, 0, 0, 0, 1, 1,
1.208489, 0.2625348, 3.215149, 0, 0, 0, 1, 1,
1.218577, 0.3874987, 1.476271, 0, 0, 0, 1, 1,
1.223624, 1.773709, 0.0936537, 0, 0, 0, 1, 1,
1.230236, -0.8254926, 3.873553, 1, 1, 1, 1, 1,
1.241966, -1.140805, 1.022857, 1, 1, 1, 1, 1,
1.249339, -0.8819039, 1.2686, 1, 1, 1, 1, 1,
1.250206, 0.3054146, 0.670999, 1, 1, 1, 1, 1,
1.253174, -1.032539, 2.570983, 1, 1, 1, 1, 1,
1.25516, -1.825192, 2.225978, 1, 1, 1, 1, 1,
1.260198, -0.9622995, 1.011175, 1, 1, 1, 1, 1,
1.265794, -0.6329162, 0.4774346, 1, 1, 1, 1, 1,
1.266947, 1.233916, 1.107278, 1, 1, 1, 1, 1,
1.272806, 0.7259811, 1.546641, 1, 1, 1, 1, 1,
1.273221, -0.02592854, 0.2614022, 1, 1, 1, 1, 1,
1.276475, 1.235935, -0.8996442, 1, 1, 1, 1, 1,
1.277656, -0.8702188, 2.510829, 1, 1, 1, 1, 1,
1.286259, 0.5507145, 0.32993, 1, 1, 1, 1, 1,
1.29292, -0.04996684, 2.014236, 1, 1, 1, 1, 1,
1.297447, -0.001125323, 2.238005, 0, 0, 1, 1, 1,
1.298051, 0.112975, 1.509222, 1, 0, 0, 1, 1,
1.313304, 0.3287055, 0.4004189, 1, 0, 0, 1, 1,
1.330495, 0.2917338, -0.009965595, 1, 0, 0, 1, 1,
1.334068, 0.2569866, 0.7833706, 1, 0, 0, 1, 1,
1.334474, 1.318398, 1.003941, 1, 0, 0, 1, 1,
1.338308, -1.143681, 4.368195, 0, 0, 0, 1, 1,
1.351806, 0.1510527, 1.075473, 0, 0, 0, 1, 1,
1.353498, 0.8761705, 1.79138, 0, 0, 0, 1, 1,
1.358027, 0.6735967, 1.617913, 0, 0, 0, 1, 1,
1.358638, 0.5034944, 0.4544973, 0, 0, 0, 1, 1,
1.359577, -0.7361013, 3.205104, 0, 0, 0, 1, 1,
1.359984, -1.451621, 1.958909, 0, 0, 0, 1, 1,
1.368165, -1.045808, 2.744463, 1, 1, 1, 1, 1,
1.389251, -0.8091763, 3.178578, 1, 1, 1, 1, 1,
1.390817, 0.0973955, 2.541379, 1, 1, 1, 1, 1,
1.39459, 0.9504837, -0.6267192, 1, 1, 1, 1, 1,
1.395302, 0.1638924, 2.49416, 1, 1, 1, 1, 1,
1.39558, 0.4945822, 1.239395, 1, 1, 1, 1, 1,
1.395638, 1.781393, -1.725746, 1, 1, 1, 1, 1,
1.396963, -1.329655, 2.419563, 1, 1, 1, 1, 1,
1.399724, -0.03904616, 1.965816, 1, 1, 1, 1, 1,
1.417686, 0.6104253, 1.985873, 1, 1, 1, 1, 1,
1.426317, -0.6700475, 2.016182, 1, 1, 1, 1, 1,
1.430052, 1.025578, 0.0962287, 1, 1, 1, 1, 1,
1.47185, -1.908839, 5.154808, 1, 1, 1, 1, 1,
1.477626, 0.8890988, 0.2671634, 1, 1, 1, 1, 1,
1.49411, 0.4980042, 1.903229, 1, 1, 1, 1, 1,
1.502032, 0.9214188, 1.552661, 0, 0, 1, 1, 1,
1.503032, -0.1413853, 2.181676, 1, 0, 0, 1, 1,
1.503675, 1.506319, 0.3899662, 1, 0, 0, 1, 1,
1.517974, -0.9239685, 0.7226898, 1, 0, 0, 1, 1,
1.522571, -2.285424, 3.95064, 1, 0, 0, 1, 1,
1.525043, 0.2213958, 1.256446, 1, 0, 0, 1, 1,
1.526474, -0.6510223, 3.461246, 0, 0, 0, 1, 1,
1.539748, -0.5109567, 1.720497, 0, 0, 0, 1, 1,
1.539856, 0.9795705, 1.028519, 0, 0, 0, 1, 1,
1.542743, -0.2116636, 2.156087, 0, 0, 0, 1, 1,
1.543995, 1.447089, 1.1107, 0, 0, 0, 1, 1,
1.550322, 1.358715, 1.895481, 0, 0, 0, 1, 1,
1.55486, -1.154965, 1.894761, 0, 0, 0, 1, 1,
1.584421, -0.5400122, 2.724447, 1, 1, 1, 1, 1,
1.585335, -0.03574343, 3.146282, 1, 1, 1, 1, 1,
1.587559, 1.080674, -0.355737, 1, 1, 1, 1, 1,
1.593475, 1.103245, 0.525839, 1, 1, 1, 1, 1,
1.611616, 0.3441371, 2.376182, 1, 1, 1, 1, 1,
1.612436, -0.45191, 2.047926, 1, 1, 1, 1, 1,
1.61377, 2.010192, 1.63742, 1, 1, 1, 1, 1,
1.617047, 0.2055411, 2.103197, 1, 1, 1, 1, 1,
1.642757, -1.751524, 2.576225, 1, 1, 1, 1, 1,
1.644368, 0.9458797, 0.8948253, 1, 1, 1, 1, 1,
1.648915, 0.900811, 1.887635, 1, 1, 1, 1, 1,
1.655439, -1.865395, 3.437376, 1, 1, 1, 1, 1,
1.68351, -0.7961196, 1.324965, 1, 1, 1, 1, 1,
1.687659, -0.512755, 1.43372, 1, 1, 1, 1, 1,
1.693124, 0.9936703, -0.1650084, 1, 1, 1, 1, 1,
1.693168, 1.540955, 2.507058, 0, 0, 1, 1, 1,
1.707191, -1.863022, 3.631685, 1, 0, 0, 1, 1,
1.715532, 0.1858275, 3.589427, 1, 0, 0, 1, 1,
1.73631, -2.218766, 1.544157, 1, 0, 0, 1, 1,
1.780843, -0.5728899, 1.61206, 1, 0, 0, 1, 1,
1.781151, 0.267939, 1.724569, 1, 0, 0, 1, 1,
1.781656, 0.3132531, 0.5905782, 0, 0, 0, 1, 1,
1.790175, 1.525665, 0.6725688, 0, 0, 0, 1, 1,
1.815732, 1.741506, 1.037848, 0, 0, 0, 1, 1,
1.823744, 0.987795, 1.345076, 0, 0, 0, 1, 1,
1.826146, 0.3333954, 0.1101106, 0, 0, 0, 1, 1,
1.856904, 0.2306673, 0.8482893, 0, 0, 0, 1, 1,
1.870493, 0.734511, 1.276945, 0, 0, 0, 1, 1,
1.870844, -1.318686, 4.118821, 1, 1, 1, 1, 1,
1.87184, 0.168794, 0.1368301, 1, 1, 1, 1, 1,
1.89295, -1.295856, 0.9592525, 1, 1, 1, 1, 1,
1.899668, -1.540992, 3.893674, 1, 1, 1, 1, 1,
1.914271, -0.7829016, -0.910859, 1, 1, 1, 1, 1,
1.921989, -0.2422702, 1.635283, 1, 1, 1, 1, 1,
1.972598, -1.083901, 1.615065, 1, 1, 1, 1, 1,
1.975173, -0.682459, 1.970219, 1, 1, 1, 1, 1,
1.984704, 0.2065552, 1.119143, 1, 1, 1, 1, 1,
2.003498, 0.1490417, 0.6860549, 1, 1, 1, 1, 1,
2.018579, -0.05791005, 1.928053, 1, 1, 1, 1, 1,
2.020495, -1.461066, 2.139787, 1, 1, 1, 1, 1,
2.02518, 1.916847, -0.05142457, 1, 1, 1, 1, 1,
2.056035, 0.3031467, 2.379235, 1, 1, 1, 1, 1,
2.072832, -0.3438263, 1.727569, 1, 1, 1, 1, 1,
2.080045, -0.4030389, 1.321836, 0, 0, 1, 1, 1,
2.089444, 0.05632439, 2.409826, 1, 0, 0, 1, 1,
2.133681, 0.5884838, 0.8096941, 1, 0, 0, 1, 1,
2.192601, 0.5892229, 1.002236, 1, 0, 0, 1, 1,
2.202702, -0.1734912, 1.235167, 1, 0, 0, 1, 1,
2.210036, -1.052599, 2.690865, 1, 0, 0, 1, 1,
2.21442, 0.2647279, 2.574208, 0, 0, 0, 1, 1,
2.214468, -0.6634463, 1.772095, 0, 0, 0, 1, 1,
2.259757, 2.418869, 1.871466, 0, 0, 0, 1, 1,
2.304731, -0.06958555, 2.100979, 0, 0, 0, 1, 1,
2.305934, -1.387335, 2.604656, 0, 0, 0, 1, 1,
2.330558, -0.3454521, 0.8283023, 0, 0, 0, 1, 1,
2.41019, 0.3658606, 2.777211, 0, 0, 0, 1, 1,
2.418866, -0.4553841, 1.799403, 1, 1, 1, 1, 1,
2.495851, -0.6857468, -0.6977691, 1, 1, 1, 1, 1,
2.620863, -1.637233, 0.3174667, 1, 1, 1, 1, 1,
2.632481, 0.1541416, 2.374045, 1, 1, 1, 1, 1,
2.855724, 0.01129372, 3.310183, 1, 1, 1, 1, 1,
2.953146, 0.4215303, 2.434355, 1, 1, 1, 1, 1,
3.090149, 0.8188493, 2.351036, 1, 1, 1, 1, 1
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
var radius = 9.493508;
var distance = 33.34554;
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
mvMatrix.translate( 0.07563114, 0.03776526, 0.298281 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.34554);
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
