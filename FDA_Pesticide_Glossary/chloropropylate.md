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
-3.071075, -0.3997489, -4.002775, 1, 0, 0, 1,
-2.762918, 0.5045852, -1.111673, 1, 0.007843138, 0, 1,
-2.630224, 0.03196049, -1.067377, 1, 0.01176471, 0, 1,
-2.58628, -2.122697, -1.383055, 1, 0.01960784, 0, 1,
-2.460126, 0.4422001, -1.973662, 1, 0.02352941, 0, 1,
-2.417616, 0.6591244, -1.682999, 1, 0.03137255, 0, 1,
-2.381684, 0.01678594, -3.572479, 1, 0.03529412, 0, 1,
-2.313506, -0.5511116, -0.9209186, 1, 0.04313726, 0, 1,
-2.301091, -1.12212, -1.220603, 1, 0.04705882, 0, 1,
-2.249699, 0.6049104, -0.9935592, 1, 0.05490196, 0, 1,
-2.159145, -0.04410474, -2.995476, 1, 0.05882353, 0, 1,
-2.145895, -0.6583943, -1.21207, 1, 0.06666667, 0, 1,
-2.099263, 1.965638, 0.6885565, 1, 0.07058824, 0, 1,
-2.079105, -1.224481, -0.8154339, 1, 0.07843138, 0, 1,
-2.043387, -1.262505, -1.974074, 1, 0.08235294, 0, 1,
-2.033879, 0.9436961, -0.5719536, 1, 0.09019608, 0, 1,
-2.010731, -1.707186, -3.4117, 1, 0.09411765, 0, 1,
-2.007341, 1.372968, -1.02771, 1, 0.1019608, 0, 1,
-1.996785, -0.7475182, -1.138856, 1, 0.1098039, 0, 1,
-1.989521, 0.7152367, 0.3368418, 1, 0.1137255, 0, 1,
-1.987129, 0.4502801, -1.351353, 1, 0.1215686, 0, 1,
-1.972733, -0.8407174, -2.964971, 1, 0.1254902, 0, 1,
-1.925732, -0.5695627, -1.84077, 1, 0.1333333, 0, 1,
-1.920412, 0.2951208, -0.2896866, 1, 0.1372549, 0, 1,
-1.914614, -0.8317852, -1.625023, 1, 0.145098, 0, 1,
-1.873243, 0.6973846, -1.956017, 1, 0.1490196, 0, 1,
-1.872754, -0.2231453, 0.08950391, 1, 0.1568628, 0, 1,
-1.841036, -0.8547042, -0.6534812, 1, 0.1607843, 0, 1,
-1.839447, 1.100925, -0.3019384, 1, 0.1686275, 0, 1,
-1.825843, -0.3790048, -2.126053, 1, 0.172549, 0, 1,
-1.801206, 0.9233386, -3.059613, 1, 0.1803922, 0, 1,
-1.794971, -0.2740309, -0.5229946, 1, 0.1843137, 0, 1,
-1.794105, 0.8229765, -0.3555373, 1, 0.1921569, 0, 1,
-1.793356, -0.6300173, -2.386281, 1, 0.1960784, 0, 1,
-1.791346, -1.211192, -2.747195, 1, 0.2039216, 0, 1,
-1.774412, 0.7716739, -0.8291548, 1, 0.2117647, 0, 1,
-1.769646, 0.3629329, -1.563269, 1, 0.2156863, 0, 1,
-1.76765, 0.6432356, 0.06033008, 1, 0.2235294, 0, 1,
-1.766878, 0.4007479, -2.534624, 1, 0.227451, 0, 1,
-1.745333, 0.60229, -2.436406, 1, 0.2352941, 0, 1,
-1.727416, -1.289436, -3.356614, 1, 0.2392157, 0, 1,
-1.722254, 1.272764, -0.6134166, 1, 0.2470588, 0, 1,
-1.714508, 0.2966147, -0.8769017, 1, 0.2509804, 0, 1,
-1.672558, -1.615922, -0.7237626, 1, 0.2588235, 0, 1,
-1.655794, 0.3929314, -0.8674998, 1, 0.2627451, 0, 1,
-1.646644, 0.1059232, -0.5313376, 1, 0.2705882, 0, 1,
-1.64627, 0.2901723, 0.4690944, 1, 0.2745098, 0, 1,
-1.64388, -0.6707093, 0.8616691, 1, 0.282353, 0, 1,
-1.635886, 0.8023083, -1.082451, 1, 0.2862745, 0, 1,
-1.629982, 0.4029422, -4.986938, 1, 0.2941177, 0, 1,
-1.618674, -0.8616722, -1.732167, 1, 0.3019608, 0, 1,
-1.61785, 0.7857384, -1.953343, 1, 0.3058824, 0, 1,
-1.614202, 0.4583965, -3.118095, 1, 0.3137255, 0, 1,
-1.610859, 1.147651, -1.326072, 1, 0.3176471, 0, 1,
-1.587371, 1.117153, -2.000135, 1, 0.3254902, 0, 1,
-1.58624, -1.013759, -2.029764, 1, 0.3294118, 0, 1,
-1.579768, 0.5880443, -0.7418235, 1, 0.3372549, 0, 1,
-1.579501, -0.9682397, -0.5284229, 1, 0.3411765, 0, 1,
-1.573473, -1.365472, -3.309875, 1, 0.3490196, 0, 1,
-1.550117, -0.2325143, -0.5972149, 1, 0.3529412, 0, 1,
-1.541355, 1.410159, 0.2122631, 1, 0.3607843, 0, 1,
-1.534993, -1.729534, -0.4075859, 1, 0.3647059, 0, 1,
-1.530183, -0.4592794, -2.990802, 1, 0.372549, 0, 1,
-1.529117, 0.1960979, -1.386518, 1, 0.3764706, 0, 1,
-1.505804, -2.192541, -5.454581, 1, 0.3843137, 0, 1,
-1.505465, 1.711176, -1.361483, 1, 0.3882353, 0, 1,
-1.501096, 0.4272794, -1.872958, 1, 0.3960784, 0, 1,
-1.485605, 1.055224, -1.342714, 1, 0.4039216, 0, 1,
-1.47472, 1.782874, -0.5567841, 1, 0.4078431, 0, 1,
-1.471916, -0.06020262, -1.906885, 1, 0.4156863, 0, 1,
-1.470901, -0.3281136, -2.861924, 1, 0.4196078, 0, 1,
-1.467328, -0.04271386, -0.6359103, 1, 0.427451, 0, 1,
-1.45577, 0.777382, -0.4352847, 1, 0.4313726, 0, 1,
-1.441492, -0.3567696, -0.9339198, 1, 0.4392157, 0, 1,
-1.434558, -0.02065952, -1.994347, 1, 0.4431373, 0, 1,
-1.411576, 1.22615, -1.473528, 1, 0.4509804, 0, 1,
-1.403117, 0.7573252, -1.090078, 1, 0.454902, 0, 1,
-1.394304, 0.7619383, 0.05138577, 1, 0.4627451, 0, 1,
-1.392371, 1.423015, -2.374584, 1, 0.4666667, 0, 1,
-1.368798, -0.5074131, -2.382303, 1, 0.4745098, 0, 1,
-1.366508, 0.450068, -1.30921, 1, 0.4784314, 0, 1,
-1.364884, 0.7413608, -2.003683, 1, 0.4862745, 0, 1,
-1.36323, 0.3751793, -1.713989, 1, 0.4901961, 0, 1,
-1.357699, 0.04143307, 0.5061111, 1, 0.4980392, 0, 1,
-1.348304, 1.546912, -1.577154, 1, 0.5058824, 0, 1,
-1.342388, 1.074914, -1.022709, 1, 0.509804, 0, 1,
-1.341543, -1.371764, -4.71744, 1, 0.5176471, 0, 1,
-1.335476, -0.2361043, -1.954215, 1, 0.5215687, 0, 1,
-1.33394, 0.543579, 0.392592, 1, 0.5294118, 0, 1,
-1.33282, -0.008512544, -1.385975, 1, 0.5333334, 0, 1,
-1.330712, 1.37596, 0.5113053, 1, 0.5411765, 0, 1,
-1.330216, 0.2177926, -0.5849054, 1, 0.5450981, 0, 1,
-1.321597, -1.572731, -2.40885, 1, 0.5529412, 0, 1,
-1.311424, -0.6512482, -3.804772, 1, 0.5568628, 0, 1,
-1.308908, -0.9696077, -2.2134, 1, 0.5647059, 0, 1,
-1.304918, -0.3768264, -2.659299, 1, 0.5686275, 0, 1,
-1.300833, -1.98175, -3.042949, 1, 0.5764706, 0, 1,
-1.291483, -0.07233148, -2.203651, 1, 0.5803922, 0, 1,
-1.284406, -0.7488356, -2.925928, 1, 0.5882353, 0, 1,
-1.279467, 0.4092102, -1.255992, 1, 0.5921569, 0, 1,
-1.279357, 1.01104, 0.01074534, 1, 0.6, 0, 1,
-1.278131, -0.2580456, -2.959072, 1, 0.6078432, 0, 1,
-1.270197, 1.090011, -1.008094, 1, 0.6117647, 0, 1,
-1.267952, 1.547202, -1.45885, 1, 0.6196079, 0, 1,
-1.263232, 0.943157, -0.6008781, 1, 0.6235294, 0, 1,
-1.259208, -0.2919606, -2.475065, 1, 0.6313726, 0, 1,
-1.257558, 0.8617352, 1.424148, 1, 0.6352941, 0, 1,
-1.246967, -0.575875, -0.4399011, 1, 0.6431373, 0, 1,
-1.241549, -0.4064201, -2.671492, 1, 0.6470588, 0, 1,
-1.241415, 1.884124, 0.6807789, 1, 0.654902, 0, 1,
-1.241363, -2.266275, -3.391145, 1, 0.6588235, 0, 1,
-1.233719, 1.685913, -2.549126, 1, 0.6666667, 0, 1,
-1.232579, -1.05039, -2.610472, 1, 0.6705883, 0, 1,
-1.22997, -0.1322934, -1.617699, 1, 0.6784314, 0, 1,
-1.22733, -2.141656, -3.549113, 1, 0.682353, 0, 1,
-1.221044, 0.2262175, -2.095517, 1, 0.6901961, 0, 1,
-1.206298, 1.016346, 0.09090941, 1, 0.6941177, 0, 1,
-1.198067, -0.9648097, -1.6714, 1, 0.7019608, 0, 1,
-1.185459, -0.6746167, -1.398827, 1, 0.7098039, 0, 1,
-1.184843, -1.894095, -3.068818, 1, 0.7137255, 0, 1,
-1.179547, -2.354576, -2.392492, 1, 0.7215686, 0, 1,
-1.17538, -0.02782487, -2.808646, 1, 0.7254902, 0, 1,
-1.173184, 0.6813117, 0.2598311, 1, 0.7333333, 0, 1,
-1.152706, 0.2357859, -1.198175, 1, 0.7372549, 0, 1,
-1.149674, -0.4035081, -1.114666, 1, 0.7450981, 0, 1,
-1.149403, 0.2338684, -2.404109, 1, 0.7490196, 0, 1,
-1.144521, -0.1757458, -2.285101, 1, 0.7568628, 0, 1,
-1.136062, -0.3089647, -3.686771, 1, 0.7607843, 0, 1,
-1.133657, 0.7566249, -0.1410781, 1, 0.7686275, 0, 1,
-1.124019, 0.4997245, -1.654024, 1, 0.772549, 0, 1,
-1.106806, 2.048059, 0.3925665, 1, 0.7803922, 0, 1,
-1.097068, 0.6001667, -2.193743, 1, 0.7843137, 0, 1,
-1.09119, 0.5174221, -0.7820569, 1, 0.7921569, 0, 1,
-1.088682, 0.04652575, -1.960183, 1, 0.7960784, 0, 1,
-1.085346, 1.108647, -0.6730165, 1, 0.8039216, 0, 1,
-1.08006, 1.182865, -0.1462633, 1, 0.8117647, 0, 1,
-1.079716, 0.5405743, -2.227338, 1, 0.8156863, 0, 1,
-1.078409, -0.8685737, -1.425566, 1, 0.8235294, 0, 1,
-1.073894, -0.3476219, -1.750155, 1, 0.827451, 0, 1,
-1.073758, 1.254945, -0.6924371, 1, 0.8352941, 0, 1,
-1.073117, 0.1519009, -1.517656, 1, 0.8392157, 0, 1,
-1.072669, -1.096413, -2.327678, 1, 0.8470588, 0, 1,
-1.069812, 0.3738278, -1.574051, 1, 0.8509804, 0, 1,
-1.06684, 0.05822976, -3.974855, 1, 0.8588235, 0, 1,
-1.065625, -1.991379, -3.805818, 1, 0.8627451, 0, 1,
-1.0652, -0.6378412, -0.7862448, 1, 0.8705882, 0, 1,
-1.063419, -2.130146, -2.841871, 1, 0.8745098, 0, 1,
-1.063038, -0.4785582, -2.318288, 1, 0.8823529, 0, 1,
-1.061978, 0.2379028, -1.470267, 1, 0.8862745, 0, 1,
-1.052107, -0.6562497, -2.775586, 1, 0.8941177, 0, 1,
-1.05149, -0.643643, -3.947291, 1, 0.8980392, 0, 1,
-1.050538, 1.612239, -1.153146, 1, 0.9058824, 0, 1,
-1.045143, 1.77337, 0.9300993, 1, 0.9137255, 0, 1,
-1.045072, 1.13172, -2.049382, 1, 0.9176471, 0, 1,
-1.044498, 1.189737, 0.421318, 1, 0.9254902, 0, 1,
-1.038574, -0.8490576, -1.347245, 1, 0.9294118, 0, 1,
-1.037889, 1.358417, -0.3126373, 1, 0.9372549, 0, 1,
-1.030604, 0.01248421, -1.698866, 1, 0.9411765, 0, 1,
-1.02809, -0.9073613, -2.302238, 1, 0.9490196, 0, 1,
-1.022767, 0.7725402, -0.6872472, 1, 0.9529412, 0, 1,
-1.017669, 1.117205, -0.130138, 1, 0.9607843, 0, 1,
-1.015851, -0.7120624, -2.655827, 1, 0.9647059, 0, 1,
-1.007878, -1.420422, -3.395588, 1, 0.972549, 0, 1,
-1.003412, -0.1353291, -2.064526, 1, 0.9764706, 0, 1,
-0.9996513, 0.5300526, -2.279593, 1, 0.9843137, 0, 1,
-0.995737, -0.06173119, -0.0602829, 1, 0.9882353, 0, 1,
-0.992138, 1.376085, -0.1288111, 1, 0.9960784, 0, 1,
-0.9899827, -0.9033533, -2.297031, 0.9960784, 1, 0, 1,
-0.9793233, 0.3643108, -0.9965741, 0.9921569, 1, 0, 1,
-0.9787953, -0.0510431, -1.19387, 0.9843137, 1, 0, 1,
-0.974457, 1.560583, -2.385438, 0.9803922, 1, 0, 1,
-0.968586, 1.764004, 0.07663395, 0.972549, 1, 0, 1,
-0.9665255, -1.244914, -1.42372, 0.9686275, 1, 0, 1,
-0.9661724, -0.7035483, -1.327474, 0.9607843, 1, 0, 1,
-0.9604183, 0.0226018, -3.109593, 0.9568627, 1, 0, 1,
-0.9468058, 0.375, 0.1975361, 0.9490196, 1, 0, 1,
-0.9439362, 0.7124059, -0.808059, 0.945098, 1, 0, 1,
-0.9431064, -0.7458887, -1.595702, 0.9372549, 1, 0, 1,
-0.9398034, 0.629897, -2.12148, 0.9333333, 1, 0, 1,
-0.9380183, -0.2707557, -2.61518, 0.9254902, 1, 0, 1,
-0.916817, -0.3094838, -0.9004205, 0.9215686, 1, 0, 1,
-0.9134203, -0.4035701, -2.588468, 0.9137255, 1, 0, 1,
-0.9108349, -0.2005558, -1.234963, 0.9098039, 1, 0, 1,
-0.9102077, -0.4922991, -0.7292344, 0.9019608, 1, 0, 1,
-0.9089733, 0.07850215, -2.046603, 0.8941177, 1, 0, 1,
-0.9083355, 2.139823, 1.629215, 0.8901961, 1, 0, 1,
-0.90674, -2.057117, -3.938482, 0.8823529, 1, 0, 1,
-0.9066668, -0.6965302, -2.376647, 0.8784314, 1, 0, 1,
-0.9043308, 0.3387184, -2.62897, 0.8705882, 1, 0, 1,
-0.8994449, -1.557141, -2.878884, 0.8666667, 1, 0, 1,
-0.89298, 0.138105, -2.319818, 0.8588235, 1, 0, 1,
-0.8907545, 0.9586569, -3.297595, 0.854902, 1, 0, 1,
-0.8807772, -0.1185604, -0.9523007, 0.8470588, 1, 0, 1,
-0.8748366, 0.27548, -1.304861, 0.8431373, 1, 0, 1,
-0.8724096, -1.831529, -3.17867, 0.8352941, 1, 0, 1,
-0.8714011, 0.7559949, -0.6181867, 0.8313726, 1, 0, 1,
-0.8683677, 1.315967, -0.8597434, 0.8235294, 1, 0, 1,
-0.8636087, 0.513851, -1.753312, 0.8196079, 1, 0, 1,
-0.8593298, -1.357, -2.051239, 0.8117647, 1, 0, 1,
-0.8544697, 0.1542243, -0.3134962, 0.8078431, 1, 0, 1,
-0.8542673, -1.835993, -2.37624, 0.8, 1, 0, 1,
-0.8495693, -0.5953709, -2.720179, 0.7921569, 1, 0, 1,
-0.8430311, 0.1932333, -1.169924, 0.7882353, 1, 0, 1,
-0.8424664, 0.1501396, -0.9707171, 0.7803922, 1, 0, 1,
-0.8286988, 0.1928152, -0.4826601, 0.7764706, 1, 0, 1,
-0.8274038, -0.3299154, -2.498153, 0.7686275, 1, 0, 1,
-0.8238363, 1.091278, 0.0534092, 0.7647059, 1, 0, 1,
-0.8235632, 0.7963316, -0.4004028, 0.7568628, 1, 0, 1,
-0.8226042, 0.4464599, -1.469725, 0.7529412, 1, 0, 1,
-0.8148904, -0.6230978, -1.669834, 0.7450981, 1, 0, 1,
-0.8133504, 1.302473, -1.165881, 0.7411765, 1, 0, 1,
-0.807247, 2.532303, -1.442138, 0.7333333, 1, 0, 1,
-0.8032746, 2.252108, 0.1552805, 0.7294118, 1, 0, 1,
-0.8026859, 0.9603435, 0.548209, 0.7215686, 1, 0, 1,
-0.7994502, 1.328122, 1.116751, 0.7176471, 1, 0, 1,
-0.7993278, 0.303166, -1.959138, 0.7098039, 1, 0, 1,
-0.7936864, -0.8808628, -2.20581, 0.7058824, 1, 0, 1,
-0.7926675, -1.049811, -1.674909, 0.6980392, 1, 0, 1,
-0.7911195, 1.165299, -1.294418, 0.6901961, 1, 0, 1,
-0.7865888, 1.231449, 0.07299223, 0.6862745, 1, 0, 1,
-0.7827458, 0.2553835, -0.7363408, 0.6784314, 1, 0, 1,
-0.7817243, -0.160023, -3.199216, 0.6745098, 1, 0, 1,
-0.7788119, 1.137197, 0.2575366, 0.6666667, 1, 0, 1,
-0.7777314, 0.8920217, -0.72375, 0.6627451, 1, 0, 1,
-0.777201, -1.234485, -1.976008, 0.654902, 1, 0, 1,
-0.7752531, 0.2658433, -2.293914, 0.6509804, 1, 0, 1,
-0.7750251, 1.075431, -1.382072, 0.6431373, 1, 0, 1,
-0.7675278, -0.5539923, -3.318718, 0.6392157, 1, 0, 1,
-0.7602847, -0.2847655, -1.434572, 0.6313726, 1, 0, 1,
-0.7593683, -0.2852829, -1.066464, 0.627451, 1, 0, 1,
-0.7577443, 1.418274, -0.9343894, 0.6196079, 1, 0, 1,
-0.7577084, -0.9117302, -1.243576, 0.6156863, 1, 0, 1,
-0.7546773, -1.416462, -3.38381, 0.6078432, 1, 0, 1,
-0.7545955, 0.6494515, 0.5464298, 0.6039216, 1, 0, 1,
-0.7453613, -0.364625, -1.169775, 0.5960785, 1, 0, 1,
-0.7447692, -0.6414593, -1.333347, 0.5882353, 1, 0, 1,
-0.7444423, -0.1793998, -1.904066, 0.5843138, 1, 0, 1,
-0.7409589, -0.2546696, -1.11223, 0.5764706, 1, 0, 1,
-0.7405741, 0.05704146, 0.08986428, 0.572549, 1, 0, 1,
-0.7364012, -0.2722612, -1.373034, 0.5647059, 1, 0, 1,
-0.735782, 0.05867311, -1.990237, 0.5607843, 1, 0, 1,
-0.7357673, -1.174765, -3.269276, 0.5529412, 1, 0, 1,
-0.7319813, -0.05555539, -0.4757631, 0.5490196, 1, 0, 1,
-0.7307107, 0.8164847, -1.938424, 0.5411765, 1, 0, 1,
-0.7304921, 0.4697761, -1.436647, 0.5372549, 1, 0, 1,
-0.7223684, -0.2586956, -3.754888, 0.5294118, 1, 0, 1,
-0.721311, -0.1725475, -1.981097, 0.5254902, 1, 0, 1,
-0.7199482, 0.7735057, -0.5992251, 0.5176471, 1, 0, 1,
-0.709461, -0.7057462, -2.468865, 0.5137255, 1, 0, 1,
-0.7032273, 0.5945915, -0.5270552, 0.5058824, 1, 0, 1,
-0.700621, -1.288475, -3.583152, 0.5019608, 1, 0, 1,
-0.7005696, -0.6574443, -2.569308, 0.4941176, 1, 0, 1,
-0.7005304, -1.568721, -2.194491, 0.4862745, 1, 0, 1,
-0.6990711, -0.1707912, -1.052549, 0.4823529, 1, 0, 1,
-0.6983999, 0.4494735, 0.6656114, 0.4745098, 1, 0, 1,
-0.6948138, -0.1343837, -1.936121, 0.4705882, 1, 0, 1,
-0.6939328, -1.909372, -2.002488, 0.4627451, 1, 0, 1,
-0.690007, 1.699872, -0.7974266, 0.4588235, 1, 0, 1,
-0.6796795, -0.8295996, -4.036091, 0.4509804, 1, 0, 1,
-0.6762823, -0.07599452, 0.3454069, 0.4470588, 1, 0, 1,
-0.6758391, -0.2112074, -1.652527, 0.4392157, 1, 0, 1,
-0.6714793, 1.208879, -1.004143, 0.4352941, 1, 0, 1,
-0.6691315, 0.4171897, -1.769345, 0.427451, 1, 0, 1,
-0.6628081, -0.7806211, -4.873239, 0.4235294, 1, 0, 1,
-0.6614685, 0.39781, 0.7963374, 0.4156863, 1, 0, 1,
-0.6576695, 0.2049723, -0.4862383, 0.4117647, 1, 0, 1,
-0.6567667, 0.4187397, -0.9558152, 0.4039216, 1, 0, 1,
-0.6511779, 2.003438, -1.743308, 0.3960784, 1, 0, 1,
-0.6461866, 1.475551, -0.5663015, 0.3921569, 1, 0, 1,
-0.6416902, -1.051306, -1.699022, 0.3843137, 1, 0, 1,
-0.6398233, -1.424338, -1.827092, 0.3803922, 1, 0, 1,
-0.6397545, -0.9302135, -1.401492, 0.372549, 1, 0, 1,
-0.6348172, 2.47173, -1.646233, 0.3686275, 1, 0, 1,
-0.6281905, -1.384001, -2.764458, 0.3607843, 1, 0, 1,
-0.6274977, -0.3227079, -2.952786, 0.3568628, 1, 0, 1,
-0.6272389, 0.6619983, -2.613395, 0.3490196, 1, 0, 1,
-0.6270908, 1.973135, -1.448205, 0.345098, 1, 0, 1,
-0.6262893, -0.08753393, -3.018894, 0.3372549, 1, 0, 1,
-0.6173862, -0.1400863, 0.5596821, 0.3333333, 1, 0, 1,
-0.6121353, 1.433338, -1.414977, 0.3254902, 1, 0, 1,
-0.6116455, -1.219317, -2.310366, 0.3215686, 1, 0, 1,
-0.608916, 1.420016, 0.6355165, 0.3137255, 1, 0, 1,
-0.6087981, -0.2803654, -1.073694, 0.3098039, 1, 0, 1,
-0.6046077, -0.8302028, -3.057166, 0.3019608, 1, 0, 1,
-0.6045828, -0.7990617, -2.665628, 0.2941177, 1, 0, 1,
-0.6006255, -0.4483015, -1.462275, 0.2901961, 1, 0, 1,
-0.6004298, 0.1871381, -1.28836, 0.282353, 1, 0, 1,
-0.5935716, -0.2070112, -2.194217, 0.2784314, 1, 0, 1,
-0.5928679, 0.5343812, -0.3027524, 0.2705882, 1, 0, 1,
-0.5906811, 0.9512578, -0.6478248, 0.2666667, 1, 0, 1,
-0.5891743, -0.4505231, -1.640613, 0.2588235, 1, 0, 1,
-0.5889331, -0.5057949, -2.915427, 0.254902, 1, 0, 1,
-0.5878008, 0.9231867, 0.3975344, 0.2470588, 1, 0, 1,
-0.5872408, 0.0817255, -2.108582, 0.2431373, 1, 0, 1,
-0.5866037, -1.901984, -3.742292, 0.2352941, 1, 0, 1,
-0.5817936, -0.09815461, -1.901479, 0.2313726, 1, 0, 1,
-0.572382, -1.460935, -1.452512, 0.2235294, 1, 0, 1,
-0.5721259, -0.05438494, -2.513309, 0.2196078, 1, 0, 1,
-0.571548, 0.3045822, -1.414617, 0.2117647, 1, 0, 1,
-0.5709727, -1.126976, -2.240967, 0.2078431, 1, 0, 1,
-0.5700715, -0.9062979, -1.479505, 0.2, 1, 0, 1,
-0.5644474, -0.7910639, -3.096849, 0.1921569, 1, 0, 1,
-0.5631297, 0.1992508, 0.8353637, 0.1882353, 1, 0, 1,
-0.5595234, -0.08607144, -1.584702, 0.1803922, 1, 0, 1,
-0.5584947, 0.06137741, -1.424, 0.1764706, 1, 0, 1,
-0.5575599, -0.9968477, -3.514693, 0.1686275, 1, 0, 1,
-0.5522648, 2.650814, 0.18943, 0.1647059, 1, 0, 1,
-0.5516564, 0.5595272, -1.702583, 0.1568628, 1, 0, 1,
-0.5492335, 1.908931, 0.2255828, 0.1529412, 1, 0, 1,
-0.5387566, 0.4886847, -0.3542291, 0.145098, 1, 0, 1,
-0.5362642, -0.9192067, -2.828832, 0.1411765, 1, 0, 1,
-0.5354087, 0.6905591, -0.5021726, 0.1333333, 1, 0, 1,
-0.5349282, -0.6476848, -3.677263, 0.1294118, 1, 0, 1,
-0.5331863, 0.9176947, -0.1444565, 0.1215686, 1, 0, 1,
-0.5327213, -1.177198, -3.307335, 0.1176471, 1, 0, 1,
-0.5267183, 0.3689115, -1.608786, 0.1098039, 1, 0, 1,
-0.5255473, 1.433574, -2.491715, 0.1058824, 1, 0, 1,
-0.5221917, 0.8085681, -0.6369298, 0.09803922, 1, 0, 1,
-0.5190124, -0.7046463, -3.13264, 0.09019608, 1, 0, 1,
-0.5181354, 1.695252, -0.5341139, 0.08627451, 1, 0, 1,
-0.5084306, -0.318901, -2.394785, 0.07843138, 1, 0, 1,
-0.5080835, -1.635889, -3.292874, 0.07450981, 1, 0, 1,
-0.5054354, 1.754417, 0.6503429, 0.06666667, 1, 0, 1,
-0.5044835, -0.8402963, -2.135226, 0.0627451, 1, 0, 1,
-0.5034331, -1.261257, -3.734371, 0.05490196, 1, 0, 1,
-0.501905, -1.653297, -3.822955, 0.05098039, 1, 0, 1,
-0.4866754, -1.240409, -3.764308, 0.04313726, 1, 0, 1,
-0.486038, -0.5019159, -2.503441, 0.03921569, 1, 0, 1,
-0.4853013, -0.07149175, -2.148334, 0.03137255, 1, 0, 1,
-0.4841671, 0.8825627, 0.3371993, 0.02745098, 1, 0, 1,
-0.4829358, -2.772052, -3.499076, 0.01960784, 1, 0, 1,
-0.4821427, 0.220636, -0.4548185, 0.01568628, 1, 0, 1,
-0.4775378, 0.3400096, -2.271464, 0.007843138, 1, 0, 1,
-0.475462, -0.5652946, -3.664318, 0.003921569, 1, 0, 1,
-0.474262, 0.3959661, -1.518791, 0, 1, 0.003921569, 1,
-0.4741391, 0.2469379, -1.210267, 0, 1, 0.01176471, 1,
-0.4654258, -1.263175, -2.490753, 0, 1, 0.01568628, 1,
-0.454493, -0.8986542, -1.695797, 0, 1, 0.02352941, 1,
-0.4539235, -1.823187, -2.774016, 0, 1, 0.02745098, 1,
-0.4519344, 0.9694019, -0.1599697, 0, 1, 0.03529412, 1,
-0.4454574, -0.04317066, -1.529487, 0, 1, 0.03921569, 1,
-0.443842, -0.9183161, -1.841275, 0, 1, 0.04705882, 1,
-0.4373746, -0.002249977, -1.454163, 0, 1, 0.05098039, 1,
-0.4364206, -0.5098755, -3.046661, 0, 1, 0.05882353, 1,
-0.4358693, 0.5288038, -1.007874, 0, 1, 0.0627451, 1,
-0.4353086, -1.099145, -2.358604, 0, 1, 0.07058824, 1,
-0.4331188, 0.632366, -2.171366, 0, 1, 0.07450981, 1,
-0.4315408, 1.286832, -0.2661818, 0, 1, 0.08235294, 1,
-0.4266887, 1.469272, -0.498683, 0, 1, 0.08627451, 1,
-0.4221659, -1.061972, -4.080595, 0, 1, 0.09411765, 1,
-0.4217732, -0.7032034, -2.761036, 0, 1, 0.1019608, 1,
-0.4159831, 0.7226926, -1.511677, 0, 1, 0.1058824, 1,
-0.4141974, 1.467795, -0.9420639, 0, 1, 0.1137255, 1,
-0.4114281, 0.2741605, -1.408788, 0, 1, 0.1176471, 1,
-0.4017942, -0.5515636, -1.21714, 0, 1, 0.1254902, 1,
-0.3973561, -1.151112, -4.010365, 0, 1, 0.1294118, 1,
-0.3947577, -1.660032, -3.203408, 0, 1, 0.1372549, 1,
-0.39455, 0.8332034, -1.036236, 0, 1, 0.1411765, 1,
-0.3938766, -1.192315, -1.152173, 0, 1, 0.1490196, 1,
-0.393856, -1.386269, -3.553845, 0, 1, 0.1529412, 1,
-0.3928402, -0.885006, -3.482374, 0, 1, 0.1607843, 1,
-0.3891376, -0.007894501, -0.7931469, 0, 1, 0.1647059, 1,
-0.3839357, -1.415709, -2.779141, 0, 1, 0.172549, 1,
-0.3835141, 1.301942, -0.9662135, 0, 1, 0.1764706, 1,
-0.380345, -0.4919114, -2.514566, 0, 1, 0.1843137, 1,
-0.3795241, 0.3778894, 0.2149943, 0, 1, 0.1882353, 1,
-0.3745306, -0.1377604, -3.32421, 0, 1, 0.1960784, 1,
-0.3738062, -1.371456, -1.965055, 0, 1, 0.2039216, 1,
-0.3737445, 1.97974, 0.9762757, 0, 1, 0.2078431, 1,
-0.3632601, 0.643579, -0.4471493, 0, 1, 0.2156863, 1,
-0.3606096, -1.223221, -2.131807, 0, 1, 0.2196078, 1,
-0.3581774, -0.2123219, -2.22607, 0, 1, 0.227451, 1,
-0.3566903, 1.244757, -0.7378086, 0, 1, 0.2313726, 1,
-0.3544842, -0.90165, -3.784192, 0, 1, 0.2392157, 1,
-0.3534308, 0.3182704, -2.117924, 0, 1, 0.2431373, 1,
-0.3530073, 0.5929194, 0.274024, 0, 1, 0.2509804, 1,
-0.3495436, -0.7995344, -3.397259, 0, 1, 0.254902, 1,
-0.3491535, 0.6302603, -0.3520466, 0, 1, 0.2627451, 1,
-0.3459511, -0.5031685, -2.849233, 0, 1, 0.2666667, 1,
-0.3417489, 1.323619, -0.1854246, 0, 1, 0.2745098, 1,
-0.3406659, -1.339397, -3.365698, 0, 1, 0.2784314, 1,
-0.3398763, 0.3406885, -1.559226, 0, 1, 0.2862745, 1,
-0.336283, -1.471209, -3.442029, 0, 1, 0.2901961, 1,
-0.334452, -0.1283431, -0.8145118, 0, 1, 0.2980392, 1,
-0.3331374, -1.023975, -2.32096, 0, 1, 0.3058824, 1,
-0.3311736, 2.67249, -0.02370602, 0, 1, 0.3098039, 1,
-0.3268463, 1.613594, -1.100712, 0, 1, 0.3176471, 1,
-0.3264193, -0.4134217, -0.2120559, 0, 1, 0.3215686, 1,
-0.3216783, 0.4136645, -1.22783, 0, 1, 0.3294118, 1,
-0.3205837, 1.324671, -0.1038938, 0, 1, 0.3333333, 1,
-0.3204972, 0.4289313, -3.591208, 0, 1, 0.3411765, 1,
-0.3199529, -0.5188777, -0.6810367, 0, 1, 0.345098, 1,
-0.3164309, 0.7204437, 0.618855, 0, 1, 0.3529412, 1,
-0.3074144, 1.527978, 1.753249, 0, 1, 0.3568628, 1,
-0.3068177, -0.8357352, -3.131468, 0, 1, 0.3647059, 1,
-0.3049919, -0.2970589, -1.922654, 0, 1, 0.3686275, 1,
-0.30361, -0.7202856, -3.962348, 0, 1, 0.3764706, 1,
-0.3034524, -1.459023, -4.264466, 0, 1, 0.3803922, 1,
-0.3022743, 0.1236687, -3.111979, 0, 1, 0.3882353, 1,
-0.3022317, -0.975163, -1.640258, 0, 1, 0.3921569, 1,
-0.2998748, 2.352778, -0.5380435, 0, 1, 0.4, 1,
-0.2994563, 0.06302351, -1.095197, 0, 1, 0.4078431, 1,
-0.2935271, -0.5446473, -3.387884, 0, 1, 0.4117647, 1,
-0.2934448, -0.9083956, -2.01457, 0, 1, 0.4196078, 1,
-0.2901578, -0.328483, -2.6495, 0, 1, 0.4235294, 1,
-0.2892933, 1.464408, -0.3464881, 0, 1, 0.4313726, 1,
-0.2869325, 0.2766244, -0.2764857, 0, 1, 0.4352941, 1,
-0.2832046, 1.169044, 1.444733, 0, 1, 0.4431373, 1,
-0.282287, 0.6631446, 0.5166533, 0, 1, 0.4470588, 1,
-0.2788331, 0.1587518, -0.8677947, 0, 1, 0.454902, 1,
-0.2761394, 0.2038323, -0.5494567, 0, 1, 0.4588235, 1,
-0.2728619, 1.028276, -1.21305, 0, 1, 0.4666667, 1,
-0.2703561, 0.653232, -0.00441525, 0, 1, 0.4705882, 1,
-0.2682503, -0.5889895, -3.132999, 0, 1, 0.4784314, 1,
-0.2671601, 0.548319, -2.275073, 0, 1, 0.4823529, 1,
-0.2649818, 0.362847, 0.6446181, 0, 1, 0.4901961, 1,
-0.2638852, 0.007671024, -2.121261, 0, 1, 0.4941176, 1,
-0.2617942, -0.6808356, -3.607257, 0, 1, 0.5019608, 1,
-0.2614628, -0.02377626, -1.667153, 0, 1, 0.509804, 1,
-0.2611159, -0.03323692, -2.669037, 0, 1, 0.5137255, 1,
-0.2609704, -0.3193031, -1.914952, 0, 1, 0.5215687, 1,
-0.2583459, 0.2262384, -2.160293, 0, 1, 0.5254902, 1,
-0.2576635, -1.634594, -1.148187, 0, 1, 0.5333334, 1,
-0.2561392, -1.460829, -3.999121, 0, 1, 0.5372549, 1,
-0.2535686, 0.5542267, -0.03634727, 0, 1, 0.5450981, 1,
-0.2530545, 1.332744, 0.155891, 0, 1, 0.5490196, 1,
-0.2469693, 0.9159748, 0.627436, 0, 1, 0.5568628, 1,
-0.242487, 0.2158935, -1.574477, 0, 1, 0.5607843, 1,
-0.2419866, -1.198467, -1.267141, 0, 1, 0.5686275, 1,
-0.2257814, 2.46734, 1.208686, 0, 1, 0.572549, 1,
-0.2224165, -0.6287355, -4.709096, 0, 1, 0.5803922, 1,
-0.2208965, 0.3880077, -2.13689, 0, 1, 0.5843138, 1,
-0.2205865, 0.3258199, -1.084518, 0, 1, 0.5921569, 1,
-0.2204358, -0.6044273, -1.022814, 0, 1, 0.5960785, 1,
-0.2105786, -1.570241, -1.974467, 0, 1, 0.6039216, 1,
-0.2098773, 2.068466, -2.181709, 0, 1, 0.6117647, 1,
-0.2082002, 1.557339, 0.683408, 0, 1, 0.6156863, 1,
-0.2073323, -1.166316, -3.96477, 0, 1, 0.6235294, 1,
-0.2027647, -1.332009, -3.222414, 0, 1, 0.627451, 1,
-0.198948, -0.0003407626, -2.181725, 0, 1, 0.6352941, 1,
-0.1975188, -0.6844467, -5.209018, 0, 1, 0.6392157, 1,
-0.195984, 0.7041733, -0.5624146, 0, 1, 0.6470588, 1,
-0.1929489, 1.813453, 0.0001083694, 0, 1, 0.6509804, 1,
-0.1926767, 0.4567427, 0.2959407, 0, 1, 0.6588235, 1,
-0.1922994, -0.03797793, -0.4643214, 0, 1, 0.6627451, 1,
-0.192035, -1.270245, -3.498766, 0, 1, 0.6705883, 1,
-0.1919657, -0.7090764, -2.549046, 0, 1, 0.6745098, 1,
-0.1906177, 1.358616, 1.383478, 0, 1, 0.682353, 1,
-0.1845646, -0.7094418, -2.041745, 0, 1, 0.6862745, 1,
-0.1824681, 0.8141469, -0.1122354, 0, 1, 0.6941177, 1,
-0.176687, 0.5870975, -1.502675, 0, 1, 0.7019608, 1,
-0.175837, -1.065469, -3.304606, 0, 1, 0.7058824, 1,
-0.1749133, 0.01737726, -2.847789, 0, 1, 0.7137255, 1,
-0.1735548, 0.05750005, 0.1635069, 0, 1, 0.7176471, 1,
-0.1727027, -0.5131621, -3.478576, 0, 1, 0.7254902, 1,
-0.1614946, 0.5577273, 0.6579428, 0, 1, 0.7294118, 1,
-0.1591887, -0.5588419, -2.498543, 0, 1, 0.7372549, 1,
-0.1519167, 0.9489523, 0.1111274, 0, 1, 0.7411765, 1,
-0.1481556, -0.5099136, -2.821444, 0, 1, 0.7490196, 1,
-0.1441312, 0.1986252, -1.035421, 0, 1, 0.7529412, 1,
-0.1420975, 0.54733, -0.7278004, 0, 1, 0.7607843, 1,
-0.1417185, 1.768731, -0.8313761, 0, 1, 0.7647059, 1,
-0.1378098, 0.8727149, 0.831938, 0, 1, 0.772549, 1,
-0.1370035, -0.1588711, -1.79808, 0, 1, 0.7764706, 1,
-0.1346647, 0.3923697, 1.331316, 0, 1, 0.7843137, 1,
-0.1331161, 1.265164, 0.5510784, 0, 1, 0.7882353, 1,
-0.132906, -0.4362135, -3.303528, 0, 1, 0.7960784, 1,
-0.1299938, -0.1318992, -2.436016, 0, 1, 0.8039216, 1,
-0.1279463, 0.0116606, -3.428874, 0, 1, 0.8078431, 1,
-0.1242148, 0.8033136, -0.603559, 0, 1, 0.8156863, 1,
-0.1206878, -0.5687559, -2.155191, 0, 1, 0.8196079, 1,
-0.1152555, -0.5413144, -0.9210103, 0, 1, 0.827451, 1,
-0.1150755, 0.007211233, -1.061832, 0, 1, 0.8313726, 1,
-0.1117149, -0.6589643, -4.407396, 0, 1, 0.8392157, 1,
-0.109584, 0.4873632, 0.663277, 0, 1, 0.8431373, 1,
-0.107059, 0.3758914, 0.8681912, 0, 1, 0.8509804, 1,
-0.1021644, -0.1537652, -2.736459, 0, 1, 0.854902, 1,
-0.1013558, -0.09021185, -3.214632, 0, 1, 0.8627451, 1,
-0.09904789, 1.19237, -0.5351723, 0, 1, 0.8666667, 1,
-0.09872524, -0.02369392, -1.457903, 0, 1, 0.8745098, 1,
-0.09104753, 0.5851846, -0.9410473, 0, 1, 0.8784314, 1,
-0.0884596, 0.6795886, 1.265235, 0, 1, 0.8862745, 1,
-0.08699864, -1.330871, -2.593065, 0, 1, 0.8901961, 1,
-0.08576636, 1.428189, 0.1697363, 0, 1, 0.8980392, 1,
-0.08258517, 0.02297289, -1.66849, 0, 1, 0.9058824, 1,
-0.08065773, -0.4991383, -3.430177, 0, 1, 0.9098039, 1,
-0.07704248, 0.4137689, -0.1584257, 0, 1, 0.9176471, 1,
-0.07469235, -0.4185567, -3.755369, 0, 1, 0.9215686, 1,
-0.07124564, 0.6915356, -0.3287424, 0, 1, 0.9294118, 1,
-0.06486226, 0.2989547, -1.383851, 0, 1, 0.9333333, 1,
-0.06304256, 0.3571325, 0.1491942, 0, 1, 0.9411765, 1,
-0.06271852, 0.4160246, 0.5570691, 0, 1, 0.945098, 1,
-0.06266849, 1.458308, -0.1164415, 0, 1, 0.9529412, 1,
-0.06204091, -1.779358, -3.963382, 0, 1, 0.9568627, 1,
-0.06081, 0.6722133, -0.007163868, 0, 1, 0.9647059, 1,
-0.060131, 1.105472, -0.1084978, 0, 1, 0.9686275, 1,
-0.05861203, 0.9650163, -2.38803, 0, 1, 0.9764706, 1,
-0.05128445, -0.807561, -2.613519, 0, 1, 0.9803922, 1,
-0.04811843, 0.5827272, 0.5106435, 0, 1, 0.9882353, 1,
-0.04755488, 0.3575198, -0.6490424, 0, 1, 0.9921569, 1,
-0.04685412, -2.390346, -2.652088, 0, 1, 1, 1,
-0.04523828, -0.9011258, -0.0970849, 0, 0.9921569, 1, 1,
-0.04406346, -0.007123146, -0.1085244, 0, 0.9882353, 1, 1,
-0.03993172, 0.9084016, -0.5766101, 0, 0.9803922, 1, 1,
-0.03959986, -0.3489054, -1.140471, 0, 0.9764706, 1, 1,
-0.03288095, 1.133332, -1.491377, 0, 0.9686275, 1, 1,
-0.03080542, -0.6194334, -1.712901, 0, 0.9647059, 1, 1,
-0.0281117, -0.005015781, -1.852401, 0, 0.9568627, 1, 1,
-0.02696883, 0.06955129, 0.15965, 0, 0.9529412, 1, 1,
-0.02643529, 0.4953264, -0.02578528, 0, 0.945098, 1, 1,
-0.02620103, 1.330152, 1.020041, 0, 0.9411765, 1, 1,
-0.02613297, 1.34997, -0.5753502, 0, 0.9333333, 1, 1,
-0.02356985, 1.056767, 0.01452769, 0, 0.9294118, 1, 1,
-0.01861192, -0.405405, -3.486119, 0, 0.9215686, 1, 1,
-0.01767742, 1.733199, -0.7640893, 0, 0.9176471, 1, 1,
-0.0165843, 0.5418551, -0.241178, 0, 0.9098039, 1, 1,
-0.016553, -0.1781167, -0.6957324, 0, 0.9058824, 1, 1,
-0.00912015, 0.4051776, 1.233109, 0, 0.8980392, 1, 1,
-0.003276705, 0.5313247, 0.5432479, 0, 0.8901961, 1, 1,
-0.003013964, -0.143261, -3.768072, 0, 0.8862745, 1, 1,
-0.00177885, -1.008421, -3.375358, 0, 0.8784314, 1, 1,
-0.00154249, -1.246765, -2.81133, 0, 0.8745098, 1, 1,
0.004333648, -0.5940678, 2.91888, 0, 0.8666667, 1, 1,
0.00946191, 1.027304, -0.7036511, 0, 0.8627451, 1, 1,
0.01105578, -0.2364438, 4.034603, 0, 0.854902, 1, 1,
0.01113169, 0.9436213, 0.1578185, 0, 0.8509804, 1, 1,
0.01420393, -0.9173818, 3.952912, 0, 0.8431373, 1, 1,
0.01794502, -0.8026779, 3.312714, 0, 0.8392157, 1, 1,
0.02011112, 0.2262192, 0.06557073, 0, 0.8313726, 1, 1,
0.0307048, 0.7606918, 0.7555886, 0, 0.827451, 1, 1,
0.03603994, -0.5403543, 3.273918, 0, 0.8196079, 1, 1,
0.03631743, 0.3503581, 2.00644, 0, 0.8156863, 1, 1,
0.03679096, -0.1384191, 2.399094, 0, 0.8078431, 1, 1,
0.03725304, -0.255959, 3.49564, 0, 0.8039216, 1, 1,
0.04259159, -1.924258, 3.125313, 0, 0.7960784, 1, 1,
0.05452031, 0.8966689, -0.7730275, 0, 0.7882353, 1, 1,
0.0594223, -0.3116692, 4.028393, 0, 0.7843137, 1, 1,
0.05989516, -1.19099, 3.36614, 0, 0.7764706, 1, 1,
0.06128399, -0.7351848, 4.468514, 0, 0.772549, 1, 1,
0.06344283, 0.4905856, 0.5245716, 0, 0.7647059, 1, 1,
0.06488881, -2.364653, 1.647231, 0, 0.7607843, 1, 1,
0.0672771, 2.197932, 0.9886177, 0, 0.7529412, 1, 1,
0.06874587, -0.1742923, 1.249051, 0, 0.7490196, 1, 1,
0.07256567, 0.298383, 0.4288072, 0, 0.7411765, 1, 1,
0.07360087, 0.3181897, 0.8954435, 0, 0.7372549, 1, 1,
0.07691193, -0.1072259, 3.059299, 0, 0.7294118, 1, 1,
0.07917795, -0.5948972, 2.845705, 0, 0.7254902, 1, 1,
0.07951064, -0.03052582, 1.284686, 0, 0.7176471, 1, 1,
0.08141597, -0.8188365, 3.456967, 0, 0.7137255, 1, 1,
0.08648808, -0.3739335, 1.847893, 0, 0.7058824, 1, 1,
0.08975605, -0.2919643, 1.07875, 0, 0.6980392, 1, 1,
0.09078928, -1.638804, 4.090422, 0, 0.6941177, 1, 1,
0.09318716, -0.7054955, 3.723769, 0, 0.6862745, 1, 1,
0.09552065, -0.07390585, 3.532473, 0, 0.682353, 1, 1,
0.09559983, 0.5008947, 1.931169, 0, 0.6745098, 1, 1,
0.1021332, 1.327393, 0.4048398, 0, 0.6705883, 1, 1,
0.1051458, -0.3016912, 2.611738, 0, 0.6627451, 1, 1,
0.1073216, 1.385634, 0.5683473, 0, 0.6588235, 1, 1,
0.1081705, -0.7260076, 2.984787, 0, 0.6509804, 1, 1,
0.109342, -2.327597, 2.001228, 0, 0.6470588, 1, 1,
0.1141499, -0.2903079, 2.054135, 0, 0.6392157, 1, 1,
0.1261931, 0.8265818, -0.7887397, 0, 0.6352941, 1, 1,
0.1278135, 0.2155787, -0.450878, 0, 0.627451, 1, 1,
0.1316438, -0.7822545, 4.122805, 0, 0.6235294, 1, 1,
0.1447189, 1.839667, -1.605519, 0, 0.6156863, 1, 1,
0.1493363, 0.3438783, -0.3355353, 0, 0.6117647, 1, 1,
0.1516756, -1.525509, 1.49469, 0, 0.6039216, 1, 1,
0.1520065, 1.349396, -0.6911696, 0, 0.5960785, 1, 1,
0.1558545, -1.209125, 1.282698, 0, 0.5921569, 1, 1,
0.1681138, -0.2547156, 3.81003, 0, 0.5843138, 1, 1,
0.1703891, -0.45743, 1.014733, 0, 0.5803922, 1, 1,
0.1704431, 0.4168436, 1.665634, 0, 0.572549, 1, 1,
0.1744958, -0.7378062, 1.886771, 0, 0.5686275, 1, 1,
0.1745926, 1.502139, -0.0709111, 0, 0.5607843, 1, 1,
0.1753712, -0.1189628, 1.405102, 0, 0.5568628, 1, 1,
0.1823217, -0.4141823, 1.780731, 0, 0.5490196, 1, 1,
0.1839173, 0.1953944, 1.213149, 0, 0.5450981, 1, 1,
0.1867767, 0.1243738, -0.223063, 0, 0.5372549, 1, 1,
0.1888581, -1.282333, 2.796568, 0, 0.5333334, 1, 1,
0.1892943, -1.588072, 1.91964, 0, 0.5254902, 1, 1,
0.193308, -0.26615, 3.139498, 0, 0.5215687, 1, 1,
0.1943761, 0.2677599, 0.2050364, 0, 0.5137255, 1, 1,
0.1988423, 0.805782, 1.491441, 0, 0.509804, 1, 1,
0.204506, -0.314384, 1.958282, 0, 0.5019608, 1, 1,
0.2071049, -0.6081421, 2.143892, 0, 0.4941176, 1, 1,
0.2075702, 1.288774, 0.2574007, 0, 0.4901961, 1, 1,
0.2094106, 1.214089, 1.508913, 0, 0.4823529, 1, 1,
0.2105487, -0.9983685, 2.448049, 0, 0.4784314, 1, 1,
0.2122596, 0.7754703, 0.3639919, 0, 0.4705882, 1, 1,
0.2129288, 0.5225077, 0.3300472, 0, 0.4666667, 1, 1,
0.217651, -0.6808343, 3.761469, 0, 0.4588235, 1, 1,
0.2206002, -0.2462341, 4.476596, 0, 0.454902, 1, 1,
0.223708, 0.002856092, 1.029855, 0, 0.4470588, 1, 1,
0.225628, 0.2528838, 1.832992, 0, 0.4431373, 1, 1,
0.2256642, -0.411981, 1.705977, 0, 0.4352941, 1, 1,
0.2312302, -0.09527258, 1.888311, 0, 0.4313726, 1, 1,
0.2340255, -0.5593408, 3.616683, 0, 0.4235294, 1, 1,
0.2340443, -0.9329246, 3.818203, 0, 0.4196078, 1, 1,
0.2403603, -0.977023, 3.844196, 0, 0.4117647, 1, 1,
0.2501508, -0.5686035, 2.551, 0, 0.4078431, 1, 1,
0.2508683, -0.5024759, 3.542072, 0, 0.4, 1, 1,
0.2525479, 0.5694077, 1.522086, 0, 0.3921569, 1, 1,
0.259198, 1.211105, 0.2490468, 0, 0.3882353, 1, 1,
0.2609016, 2.013059, 0.2277794, 0, 0.3803922, 1, 1,
0.2631422, -0.3682672, 1.579889, 0, 0.3764706, 1, 1,
0.2664112, -0.4271385, 2.275797, 0, 0.3686275, 1, 1,
0.2675735, -0.2470648, 2.6811, 0, 0.3647059, 1, 1,
0.2681834, -0.7962493, 3.229539, 0, 0.3568628, 1, 1,
0.2715347, 0.4745711, 1.328028, 0, 0.3529412, 1, 1,
0.2718695, 0.1554316, 1.084331, 0, 0.345098, 1, 1,
0.2770115, 0.3603202, 0.7460902, 0, 0.3411765, 1, 1,
0.2818318, -0.9495441, 2.428798, 0, 0.3333333, 1, 1,
0.2823671, 0.8411447, 0.9594654, 0, 0.3294118, 1, 1,
0.2842565, 0.1886562, 0.06026712, 0, 0.3215686, 1, 1,
0.287229, 0.1136303, 1.201973, 0, 0.3176471, 1, 1,
0.2885394, -0.2990325, 1.962198, 0, 0.3098039, 1, 1,
0.2949537, 0.9626069, 0.04722792, 0, 0.3058824, 1, 1,
0.2965934, 0.2806174, 0.3888172, 0, 0.2980392, 1, 1,
0.3006789, -0.07962689, 1.078795, 0, 0.2901961, 1, 1,
0.3035261, -1.962482, 2.370584, 0, 0.2862745, 1, 1,
0.3073453, 1.131245, -0.3568572, 0, 0.2784314, 1, 1,
0.3078614, 1.658526, -0.3291854, 0, 0.2745098, 1, 1,
0.3094416, 0.2067906, 0.7637222, 0, 0.2666667, 1, 1,
0.3133845, -1.881904, 3.793077, 0, 0.2627451, 1, 1,
0.3173443, 0.03399083, 1.539549, 0, 0.254902, 1, 1,
0.3192779, -0.2083967, 4.159248, 0, 0.2509804, 1, 1,
0.3215307, 1.341733, 0.8890561, 0, 0.2431373, 1, 1,
0.3238049, -1.183937, 2.028461, 0, 0.2392157, 1, 1,
0.3277564, -2.302017, 2.91478, 0, 0.2313726, 1, 1,
0.3297938, -2.16877, 3.574903, 0, 0.227451, 1, 1,
0.3335214, 0.1216526, 2.313519, 0, 0.2196078, 1, 1,
0.3367667, 0.2236984, -0.5247507, 0, 0.2156863, 1, 1,
0.337219, -0.3039071, 2.886681, 0, 0.2078431, 1, 1,
0.3412304, 0.288746, -0.1328637, 0, 0.2039216, 1, 1,
0.3413922, 0.7965022, -0.1554558, 0, 0.1960784, 1, 1,
0.3421124, -0.4820997, 2.094995, 0, 0.1882353, 1, 1,
0.3442789, 1.142688, -1.971248, 0, 0.1843137, 1, 1,
0.3494503, 0.7585158, 0.7230762, 0, 0.1764706, 1, 1,
0.3497124, -1.91357, 1.273693, 0, 0.172549, 1, 1,
0.3525114, -0.6547078, 0.5370912, 0, 0.1647059, 1, 1,
0.3541887, -0.5473123, 1.771397, 0, 0.1607843, 1, 1,
0.356087, 0.1972164, 1.309831, 0, 0.1529412, 1, 1,
0.3560925, -2.186808, 3.473473, 0, 0.1490196, 1, 1,
0.3567438, 1.049581, -2.246964, 0, 0.1411765, 1, 1,
0.3569224, 0.6355448, 0.5660246, 0, 0.1372549, 1, 1,
0.3590256, 0.590276, 0.2530276, 0, 0.1294118, 1, 1,
0.3595168, -1.750682, 4.284893, 0, 0.1254902, 1, 1,
0.360582, -0.007666335, 1.776041, 0, 0.1176471, 1, 1,
0.3667141, -0.3762248, 3.00498, 0, 0.1137255, 1, 1,
0.370209, -1.445333, 4.343926, 0, 0.1058824, 1, 1,
0.3752081, -1.298111, 5.193798, 0, 0.09803922, 1, 1,
0.379087, 0.2303012, 3.748123, 0, 0.09411765, 1, 1,
0.3888491, 0.5559815, -0.07193515, 0, 0.08627451, 1, 1,
0.3901949, 0.1805644, 0.3784148, 0, 0.08235294, 1, 1,
0.3913946, -0.8771847, 3.343817, 0, 0.07450981, 1, 1,
0.3928949, -1.077846, 2.2219, 0, 0.07058824, 1, 1,
0.3953214, 0.1667518, 1.32421, 0, 0.0627451, 1, 1,
0.3961056, -0.5961783, 1.381642, 0, 0.05882353, 1, 1,
0.3990494, 1.147228, 0.5653882, 0, 0.05098039, 1, 1,
0.3998573, -0.7688755, 3.374825, 0, 0.04705882, 1, 1,
0.4037573, 0.5711045, -0.214248, 0, 0.03921569, 1, 1,
0.4038041, -0.8779601, 2.852352, 0, 0.03529412, 1, 1,
0.4100119, 1.197226, 0.161184, 0, 0.02745098, 1, 1,
0.4106175, 0.4292113, 1.4195, 0, 0.02352941, 1, 1,
0.415021, 1.275846, -0.9897593, 0, 0.01568628, 1, 1,
0.4160296, -0.3256406, 2.180802, 0, 0.01176471, 1, 1,
0.4173436, 1.230911, -0.8349278, 0, 0.003921569, 1, 1,
0.4207556, -1.833677, 3.045446, 0.003921569, 0, 1, 1,
0.4224803, 1.352522, 0.4161673, 0.007843138, 0, 1, 1,
0.4243888, 1.175666, 2.556295, 0.01568628, 0, 1, 1,
0.4264279, -0.1505261, 2.279009, 0.01960784, 0, 1, 1,
0.4351845, 2.18981, 3.153849, 0.02745098, 0, 1, 1,
0.4356067, -0.05601647, 1.859822, 0.03137255, 0, 1, 1,
0.4414151, -1.319202, 3.419793, 0.03921569, 0, 1, 1,
0.4427618, 1.448093, 0.6626324, 0.04313726, 0, 1, 1,
0.4432176, 1.253526, 1.959057, 0.05098039, 0, 1, 1,
0.4480568, 0.6073779, 1.068874, 0.05490196, 0, 1, 1,
0.4503371, 2.422046, 0.3291423, 0.0627451, 0, 1, 1,
0.4508668, -0.130952, 2.368815, 0.06666667, 0, 1, 1,
0.4547469, 1.715341, 0.521177, 0.07450981, 0, 1, 1,
0.4552492, 1.391061, -0.2025412, 0.07843138, 0, 1, 1,
0.4577394, 0.1252432, 0.2983935, 0.08627451, 0, 1, 1,
0.4620696, -0.2464616, 0.8456272, 0.09019608, 0, 1, 1,
0.4637852, 0.5068032, 0.8573728, 0.09803922, 0, 1, 1,
0.4640496, 1.055206, -0.3275708, 0.1058824, 0, 1, 1,
0.4648151, 0.02470412, 1.713608, 0.1098039, 0, 1, 1,
0.4663268, -0.9507399, 2.84395, 0.1176471, 0, 1, 1,
0.4749103, -0.4602726, 3.467538, 0.1215686, 0, 1, 1,
0.4764791, -1.991778, 1.597703, 0.1294118, 0, 1, 1,
0.4780208, -1.089158, 1.22894, 0.1333333, 0, 1, 1,
0.4781856, 0.6154886, 0.7617432, 0.1411765, 0, 1, 1,
0.4802207, 0.2223399, 1.703987, 0.145098, 0, 1, 1,
0.4837635, -0.2921644, 3.292897, 0.1529412, 0, 1, 1,
0.4841927, 0.9289435, 1.312358, 0.1568628, 0, 1, 1,
0.4910386, 0.208692, 2.363888, 0.1647059, 0, 1, 1,
0.4926622, 0.2294257, 0.6970291, 0.1686275, 0, 1, 1,
0.4926869, -1.670622, 2.511159, 0.1764706, 0, 1, 1,
0.4981673, 0.07499863, 2.122934, 0.1803922, 0, 1, 1,
0.4982618, -0.2878184, 1.856579, 0.1882353, 0, 1, 1,
0.4998587, -0.6117579, 1.816943, 0.1921569, 0, 1, 1,
0.5019239, -1.890005, 1.88613, 0.2, 0, 1, 1,
0.504196, -1.351292, 2.689233, 0.2078431, 0, 1, 1,
0.5056902, 0.6137885, 1.950632, 0.2117647, 0, 1, 1,
0.5138389, -1.164854, 1.915866, 0.2196078, 0, 1, 1,
0.5141116, 2.218447, -0.08694226, 0.2235294, 0, 1, 1,
0.516831, 1.526519, 0.3860131, 0.2313726, 0, 1, 1,
0.519407, 0.6210257, 0.9009272, 0.2352941, 0, 1, 1,
0.522388, 1.05102, 0.280304, 0.2431373, 0, 1, 1,
0.5224584, -2.490184, 2.072153, 0.2470588, 0, 1, 1,
0.5265694, -0.2793646, 0.5333441, 0.254902, 0, 1, 1,
0.5266632, 1.817522, 2.356137, 0.2588235, 0, 1, 1,
0.5267239, -1.344498, 0.5776187, 0.2666667, 0, 1, 1,
0.5358879, 0.2844492, 2.869975, 0.2705882, 0, 1, 1,
0.5493993, -0.3153676, 2.250782, 0.2784314, 0, 1, 1,
0.5554771, -0.01074943, 1.714329, 0.282353, 0, 1, 1,
0.5611802, 1.454547, 2.077294, 0.2901961, 0, 1, 1,
0.562052, 0.4140308, -0.7830954, 0.2941177, 0, 1, 1,
0.5656137, 2.11381, 1.085195, 0.3019608, 0, 1, 1,
0.5664853, -0.7003207, 3.136208, 0.3098039, 0, 1, 1,
0.5819507, 0.05319093, 1.780532, 0.3137255, 0, 1, 1,
0.5842469, 0.3084896, 1.098843, 0.3215686, 0, 1, 1,
0.5850318, 1.277381, 0.3817827, 0.3254902, 0, 1, 1,
0.5871713, 1.78303, -0.8357353, 0.3333333, 0, 1, 1,
0.5900038, 0.9905452, 1.019025, 0.3372549, 0, 1, 1,
0.604652, -0.4508946, 2.209267, 0.345098, 0, 1, 1,
0.6060099, -0.02645566, 1.547532, 0.3490196, 0, 1, 1,
0.6100381, -1.061004, 2.489128, 0.3568628, 0, 1, 1,
0.6121076, 0.2936624, 0.9270339, 0.3607843, 0, 1, 1,
0.6187804, -1.620417, 1.684153, 0.3686275, 0, 1, 1,
0.6257597, 0.6276121, 1.931664, 0.372549, 0, 1, 1,
0.6277813, -1.510959, 1.822376, 0.3803922, 0, 1, 1,
0.6291298, -0.1951628, 1.061361, 0.3843137, 0, 1, 1,
0.6352747, 0.8347753, 1.570233, 0.3921569, 0, 1, 1,
0.6355643, -1.423939, 2.448018, 0.3960784, 0, 1, 1,
0.6374589, 0.6531858, -0.752948, 0.4039216, 0, 1, 1,
0.6389853, 0.6022113, -0.03453327, 0.4117647, 0, 1, 1,
0.6406582, 1.133039, 2.218113, 0.4156863, 0, 1, 1,
0.6422946, 1.305977, 2.008126, 0.4235294, 0, 1, 1,
0.6489601, -1.739059, 1.300504, 0.427451, 0, 1, 1,
0.648991, 0.4372916, 1.769034, 0.4352941, 0, 1, 1,
0.6500769, -0.7107363, 1.302575, 0.4392157, 0, 1, 1,
0.6572549, -0.5783073, 2.31601, 0.4470588, 0, 1, 1,
0.6605764, 0.6971675, 0.6439332, 0.4509804, 0, 1, 1,
0.668692, 0.4345687, -0.398845, 0.4588235, 0, 1, 1,
0.6691165, 0.1284996, 2.480803, 0.4627451, 0, 1, 1,
0.673694, -1.415744, 2.262497, 0.4705882, 0, 1, 1,
0.680202, 0.8914348, -0.3871857, 0.4745098, 0, 1, 1,
0.6871617, 0.1612225, 2.121866, 0.4823529, 0, 1, 1,
0.6888453, -1.48698, 1.163298, 0.4862745, 0, 1, 1,
0.6898229, -0.4138882, 1.661958, 0.4941176, 0, 1, 1,
0.7004283, -1.090203, 2.330741, 0.5019608, 0, 1, 1,
0.7045119, -0.4596256, 2.016488, 0.5058824, 0, 1, 1,
0.7054459, -0.6338148, 2.7749, 0.5137255, 0, 1, 1,
0.7079526, -0.7613708, 1.20244, 0.5176471, 0, 1, 1,
0.7139465, -2.226758, 3.550906, 0.5254902, 0, 1, 1,
0.7194223, -1.637086, 2.508659, 0.5294118, 0, 1, 1,
0.7212509, 2.001649, -0.3334413, 0.5372549, 0, 1, 1,
0.724488, 1.093623, -0.4392079, 0.5411765, 0, 1, 1,
0.7262161, -0.09880903, 0.8527783, 0.5490196, 0, 1, 1,
0.7283586, 0.4264727, 0.9218386, 0.5529412, 0, 1, 1,
0.7299697, -0.7084208, 3.290305, 0.5607843, 0, 1, 1,
0.7336726, 1.012967, 0.7606626, 0.5647059, 0, 1, 1,
0.7347, 0.2575616, 0.9357197, 0.572549, 0, 1, 1,
0.7373041, -1.24606, 1.894305, 0.5764706, 0, 1, 1,
0.7421072, -0.8650286, 2.203949, 0.5843138, 0, 1, 1,
0.74641, -1.322542, 2.531135, 0.5882353, 0, 1, 1,
0.7473463, 0.5241777, 0.4938624, 0.5960785, 0, 1, 1,
0.7485479, -0.0662876, 0.8708028, 0.6039216, 0, 1, 1,
0.7517894, 0.7659541, -0.4367191, 0.6078432, 0, 1, 1,
0.7546399, 0.4118905, 0.6215062, 0.6156863, 0, 1, 1,
0.7574964, 0.700321, 0.2803027, 0.6196079, 0, 1, 1,
0.7707248, 0.1937235, 1.257661, 0.627451, 0, 1, 1,
0.7714017, 0.5489192, 0.423198, 0.6313726, 0, 1, 1,
0.7736413, 0.6482729, -1.149222, 0.6392157, 0, 1, 1,
0.7779436, 0.1237815, 2.796875, 0.6431373, 0, 1, 1,
0.7804807, 0.9510031, 1.303794, 0.6509804, 0, 1, 1,
0.7864531, 1.499833, 0.1313012, 0.654902, 0, 1, 1,
0.786707, 0.9341551, -1.418788, 0.6627451, 0, 1, 1,
0.7924351, 1.277249, 1.117344, 0.6666667, 0, 1, 1,
0.7984324, -0.3961523, 1.466998, 0.6745098, 0, 1, 1,
0.8111123, -1.740386, 3.841421, 0.6784314, 0, 1, 1,
0.814279, -0.9667436, 1.74543, 0.6862745, 0, 1, 1,
0.8174703, -0.3817931, 0.7118575, 0.6901961, 0, 1, 1,
0.8179756, -0.7091221, 0.9928336, 0.6980392, 0, 1, 1,
0.8188241, -0.3748634, 3.389834, 0.7058824, 0, 1, 1,
0.8199117, -0.245252, 0.2792229, 0.7098039, 0, 1, 1,
0.8282434, -1.234835, 3.830944, 0.7176471, 0, 1, 1,
0.8333575, 0.08140132, 1.321949, 0.7215686, 0, 1, 1,
0.8379712, -0.8224694, 1.753771, 0.7294118, 0, 1, 1,
0.8385267, 1.090215, 0.8092827, 0.7333333, 0, 1, 1,
0.8465198, -0.2345784, 2.359465, 0.7411765, 0, 1, 1,
0.8535132, 0.39195, 2.238477, 0.7450981, 0, 1, 1,
0.8573319, -0.8200347, 2.551265, 0.7529412, 0, 1, 1,
0.8629795, 2.08923, 0.4744354, 0.7568628, 0, 1, 1,
0.8639882, -1.039056, 2.399938, 0.7647059, 0, 1, 1,
0.8653491, 1.675739, 0.8645423, 0.7686275, 0, 1, 1,
0.8654793, 1.574508, -0.6946058, 0.7764706, 0, 1, 1,
0.8681185, 0.06190689, 3.484504, 0.7803922, 0, 1, 1,
0.8757662, -0.2614034, 1.812952, 0.7882353, 0, 1, 1,
0.8787779, 0.306955, 1.114363, 0.7921569, 0, 1, 1,
0.8790935, -0.5416392, 2.154148, 0.8, 0, 1, 1,
0.8841413, 0.7271692, 1.415848, 0.8078431, 0, 1, 1,
0.8872237, 1.152481, 2.537376, 0.8117647, 0, 1, 1,
0.8890963, -0.5003449, 1.607505, 0.8196079, 0, 1, 1,
0.8954934, 1.25543, 0.5588976, 0.8235294, 0, 1, 1,
0.9044998, -0.8558162, 3.278821, 0.8313726, 0, 1, 1,
0.9045158, 0.2796368, 1.107896, 0.8352941, 0, 1, 1,
0.9085883, -1.54692, 3.290311, 0.8431373, 0, 1, 1,
0.9094483, 1.129154, 1.048893, 0.8470588, 0, 1, 1,
0.911629, 0.6963075, 0.5674837, 0.854902, 0, 1, 1,
0.9219019, 0.1354156, 1.324289, 0.8588235, 0, 1, 1,
0.9233662, 0.5910915, -0.7785951, 0.8666667, 0, 1, 1,
0.9239531, 1.023213, -0.5180463, 0.8705882, 0, 1, 1,
0.9280387, -1.223677, 3.362339, 0.8784314, 0, 1, 1,
0.9307951, -0.08053766, 2.226515, 0.8823529, 0, 1, 1,
0.9332871, 0.4130252, 1.661536, 0.8901961, 0, 1, 1,
0.9408871, 1.629883, 0.9369938, 0.8941177, 0, 1, 1,
0.948989, -0.7879156, 0.6143184, 0.9019608, 0, 1, 1,
0.9597482, -0.1891086, 1.421316, 0.9098039, 0, 1, 1,
0.9626499, -0.3363264, 1.660663, 0.9137255, 0, 1, 1,
0.9634672, 0.7427382, 0.7608333, 0.9215686, 0, 1, 1,
0.9687999, 0.9088119, 1.330266, 0.9254902, 0, 1, 1,
0.9697813, -1.276094, 2.476058, 0.9333333, 0, 1, 1,
0.9724753, 1.447509, 0.5189466, 0.9372549, 0, 1, 1,
0.9748887, 0.1704711, 2.723327, 0.945098, 0, 1, 1,
0.9762697, 1.111026, -1.096016, 0.9490196, 0, 1, 1,
0.9778957, -1.049935, 2.155048, 0.9568627, 0, 1, 1,
0.9902083, 0.00230864, 1.515378, 0.9607843, 0, 1, 1,
0.9944912, 0.7046847, 1.194612, 0.9686275, 0, 1, 1,
0.9948977, 0.5998151, -1.624544, 0.972549, 0, 1, 1,
1.007284, -0.1653385, 2.272388, 0.9803922, 0, 1, 1,
1.01192, -0.3047791, 1.877118, 0.9843137, 0, 1, 1,
1.038862, 0.8812177, -0.5931062, 0.9921569, 0, 1, 1,
1.040461, -0.3928545, 2.282764, 0.9960784, 0, 1, 1,
1.04159, 0.7800963, 1.273209, 1, 0, 0.9960784, 1,
1.045311, 0.573278, -0.3061832, 1, 0, 0.9882353, 1,
1.049697, 0.9084156, 1.352167, 1, 0, 0.9843137, 1,
1.051527, -1.056614, 2.403393, 1, 0, 0.9764706, 1,
1.05162, -0.7876722, 3.424893, 1, 0, 0.972549, 1,
1.057655, 1.179357, 0.453195, 1, 0, 0.9647059, 1,
1.063531, 0.05227331, 0.4954807, 1, 0, 0.9607843, 1,
1.066418, -0.327207, 2.843816, 1, 0, 0.9529412, 1,
1.084296, 0.1865676, 1.681391, 1, 0, 0.9490196, 1,
1.084679, 0.5280737, 1.991972, 1, 0, 0.9411765, 1,
1.087125, 0.2249344, 1.843071, 1, 0, 0.9372549, 1,
1.094347, 0.3764285, 2.32724, 1, 0, 0.9294118, 1,
1.094755, -0.2841275, 1.04985, 1, 0, 0.9254902, 1,
1.102015, -0.1235381, 1.862198, 1, 0, 0.9176471, 1,
1.106503, 0.5364336, 0.1710925, 1, 0, 0.9137255, 1,
1.108442, 0.5853761, 1.814429, 1, 0, 0.9058824, 1,
1.111898, 0.4858871, 1.832323, 1, 0, 0.9019608, 1,
1.11389, 1.96806, 1.044413, 1, 0, 0.8941177, 1,
1.114033, 0.3807272, -0.203475, 1, 0, 0.8862745, 1,
1.123262, 2.021803, 0.6973646, 1, 0, 0.8823529, 1,
1.12702, 0.5661857, 0.4560219, 1, 0, 0.8745098, 1,
1.131027, -0.4346689, 2.209442, 1, 0, 0.8705882, 1,
1.132714, 1.236026, 0.9764138, 1, 0, 0.8627451, 1,
1.13349, 1.121023, 0.8611636, 1, 0, 0.8588235, 1,
1.134199, -0.9099216, 1.023907, 1, 0, 0.8509804, 1,
1.134374, -1.055944, 2.832997, 1, 0, 0.8470588, 1,
1.137225, 1.288175, 2.138009, 1, 0, 0.8392157, 1,
1.160045, -1.524051, 2.562162, 1, 0, 0.8352941, 1,
1.160805, 0.2980996, -0.4872661, 1, 0, 0.827451, 1,
1.164719, -1.505117, 2.57975, 1, 0, 0.8235294, 1,
1.16864, -0.7204363, 2.396446, 1, 0, 0.8156863, 1,
1.170612, 0.1488815, 2.411692, 1, 0, 0.8117647, 1,
1.174425, -0.8663044, 1.419326, 1, 0, 0.8039216, 1,
1.185109, -0.4339276, 2.427408, 1, 0, 0.7960784, 1,
1.187227, -0.712693, 3.673324, 1, 0, 0.7921569, 1,
1.193018, 1.562201, 2.846845, 1, 0, 0.7843137, 1,
1.194416, -0.8767699, 1.57204, 1, 0, 0.7803922, 1,
1.195197, 2.310004, 0.2854494, 1, 0, 0.772549, 1,
1.195808, -1.503992, 1.573238, 1, 0, 0.7686275, 1,
1.209127, 0.8407508, 1.093299, 1, 0, 0.7607843, 1,
1.215758, 1.110296, 2.287408, 1, 0, 0.7568628, 1,
1.225493, -1.295353, 4.47291, 1, 0, 0.7490196, 1,
1.232911, 0.4930041, 0.2945504, 1, 0, 0.7450981, 1,
1.233514, 0.09455287, 0.8942311, 1, 0, 0.7372549, 1,
1.233976, -0.6559859, 2.357211, 1, 0, 0.7333333, 1,
1.235084, 1.028658, 0.4032492, 1, 0, 0.7254902, 1,
1.235388, -1.812239, 2.405045, 1, 0, 0.7215686, 1,
1.236351, 1.214915, -1.929328, 1, 0, 0.7137255, 1,
1.237596, -0.5100646, 1.882132, 1, 0, 0.7098039, 1,
1.246609, -0.1164584, 1.244136, 1, 0, 0.7019608, 1,
1.267491, 2.143633, -0.4615524, 1, 0, 0.6941177, 1,
1.269013, -1.213445, 2.056378, 1, 0, 0.6901961, 1,
1.269327, 0.1117595, 0.4798378, 1, 0, 0.682353, 1,
1.270858, 1.418367, 2.524053, 1, 0, 0.6784314, 1,
1.273142, 0.7912254, 1.228404, 1, 0, 0.6705883, 1,
1.275884, -0.1389109, 3.517701, 1, 0, 0.6666667, 1,
1.286102, -0.4957616, 1.201462, 1, 0, 0.6588235, 1,
1.288854, -0.554435, 2.086521, 1, 0, 0.654902, 1,
1.29878, -0.4696522, 1.868782, 1, 0, 0.6470588, 1,
1.29985, 1.220201, -0.4335606, 1, 0, 0.6431373, 1,
1.300889, -0.07744933, 3.052698, 1, 0, 0.6352941, 1,
1.309652, 1.102891, 1.496045, 1, 0, 0.6313726, 1,
1.315301, -1.097919, 2.611038, 1, 0, 0.6235294, 1,
1.340771, 0.66652, 1.211219, 1, 0, 0.6196079, 1,
1.349668, -1.087392, 2.153386, 1, 0, 0.6117647, 1,
1.353331, 1.400769, 2.458706, 1, 0, 0.6078432, 1,
1.362534, -0.8722831, 2.928907, 1, 0, 0.6, 1,
1.362991, -1.205964, 2.924806, 1, 0, 0.5921569, 1,
1.364055, -0.3790637, 1.940333, 1, 0, 0.5882353, 1,
1.367178, -0.01190901, 2.126022, 1, 0, 0.5803922, 1,
1.373809, -0.1235972, 0.9696137, 1, 0, 0.5764706, 1,
1.376121, 1.872254, 1.378181, 1, 0, 0.5686275, 1,
1.389929, 1.585273, 0.2989909, 1, 0, 0.5647059, 1,
1.392662, 1.14368, 1.90337, 1, 0, 0.5568628, 1,
1.407229, -0.3704419, 1.136974, 1, 0, 0.5529412, 1,
1.411542, 0.2982364, 1.113918, 1, 0, 0.5450981, 1,
1.421032, -0.3350604, 1.511399, 1, 0, 0.5411765, 1,
1.421093, 0.6639733, 0.1809399, 1, 0, 0.5333334, 1,
1.423033, -0.372315, 2.195552, 1, 0, 0.5294118, 1,
1.424512, -0.5224438, 3.129137, 1, 0, 0.5215687, 1,
1.42578, -1.105026, 1.345763, 1, 0, 0.5176471, 1,
1.428764, -1.853819, 3.249616, 1, 0, 0.509804, 1,
1.431249, -0.8360054, 1.986345, 1, 0, 0.5058824, 1,
1.432252, -1.556264, 2.120867, 1, 0, 0.4980392, 1,
1.439854, 0.6382048, -0.2927259, 1, 0, 0.4901961, 1,
1.443668, 0.4442997, 1.298048, 1, 0, 0.4862745, 1,
1.446495, -0.9726204, 3.076966, 1, 0, 0.4784314, 1,
1.461284, -0.7538453, 2.967934, 1, 0, 0.4745098, 1,
1.462623, 1.158562, 0.3220276, 1, 0, 0.4666667, 1,
1.478623, 1.966494, 0.8981128, 1, 0, 0.4627451, 1,
1.479441, 1.369518, 0.3942511, 1, 0, 0.454902, 1,
1.479858, -0.4471739, 3.147637, 1, 0, 0.4509804, 1,
1.494935, 1.875158, 0.383727, 1, 0, 0.4431373, 1,
1.502155, -1.167936, 3.054801, 1, 0, 0.4392157, 1,
1.506671, 0.2046773, 0.9764926, 1, 0, 0.4313726, 1,
1.509952, -0.5998042, 0.3009546, 1, 0, 0.427451, 1,
1.511164, -0.1581531, 1.416433, 1, 0, 0.4196078, 1,
1.516348, -0.2342539, 0.01907673, 1, 0, 0.4156863, 1,
1.521361, -2.698776, 1.656112, 1, 0, 0.4078431, 1,
1.54204, -0.1500122, 1.981966, 1, 0, 0.4039216, 1,
1.543746, -0.4620816, 1.216642, 1, 0, 0.3960784, 1,
1.554608, -0.2737469, 3.04003, 1, 0, 0.3882353, 1,
1.558927, -1.369729, 3.001514, 1, 0, 0.3843137, 1,
1.562585, -0.5382718, 2.682885, 1, 0, 0.3764706, 1,
1.56872, 0.6191, 0.4172051, 1, 0, 0.372549, 1,
1.582454, -0.5098666, 2.131891, 1, 0, 0.3647059, 1,
1.592854, 1.141116, 1.593822, 1, 0, 0.3607843, 1,
1.600638, -1.182968, 0.8833818, 1, 0, 0.3529412, 1,
1.617517, -1.069344, 3.060103, 1, 0, 0.3490196, 1,
1.641145, 0.007351612, 0.5825064, 1, 0, 0.3411765, 1,
1.646892, -1.75715, 1.729063, 1, 0, 0.3372549, 1,
1.649183, 1.751266, 0.2430151, 1, 0, 0.3294118, 1,
1.654865, -0.6831449, 1.730863, 1, 0, 0.3254902, 1,
1.656019, -0.9420823, 2.102644, 1, 0, 0.3176471, 1,
1.677982, -0.04495803, 0.6371432, 1, 0, 0.3137255, 1,
1.681083, 0.3991049, 2.058543, 1, 0, 0.3058824, 1,
1.682378, 1.068399, 2.919762, 1, 0, 0.2980392, 1,
1.692908, 0.5184047, 1.751984, 1, 0, 0.2941177, 1,
1.693367, -0.7854614, 3.285941, 1, 0, 0.2862745, 1,
1.699728, 1.216196, 0.07449075, 1, 0, 0.282353, 1,
1.702707, -0.666584, 0.6970108, 1, 0, 0.2745098, 1,
1.729753, 1.360163, -0.5301133, 1, 0, 0.2705882, 1,
1.745033, 0.3441011, 1.90679, 1, 0, 0.2627451, 1,
1.754566, 0.2314111, 1.249417, 1, 0, 0.2588235, 1,
1.75556, -2.104462, 1.577357, 1, 0, 0.2509804, 1,
1.807289, 1.85408, 1.113217, 1, 0, 0.2470588, 1,
1.811208, 0.01066325, 0.3156466, 1, 0, 0.2392157, 1,
1.812813, -1.064748, 1.90093, 1, 0, 0.2352941, 1,
1.834074, -0.02957843, 0.6640102, 1, 0, 0.227451, 1,
1.850476, 0.9602122, 0.3395338, 1, 0, 0.2235294, 1,
1.850924, -1.235979, 3.50681, 1, 0, 0.2156863, 1,
1.866846, 1.095459, 0.4962076, 1, 0, 0.2117647, 1,
1.880803, -1.507332, 2.960004, 1, 0, 0.2039216, 1,
1.897746, 3.472018, -0.2458435, 1, 0, 0.1960784, 1,
1.900919, -0.01285529, 0.8727351, 1, 0, 0.1921569, 1,
1.908129, 0.8890185, 0.4119176, 1, 0, 0.1843137, 1,
1.910534, 0.6661481, 1.084714, 1, 0, 0.1803922, 1,
1.910627, 1.062955, 2.216551, 1, 0, 0.172549, 1,
1.918804, 1.602848, 1.140416, 1, 0, 0.1686275, 1,
1.931823, 1.23497, 0.4905415, 1, 0, 0.1607843, 1,
1.932388, 0.2953909, 1.267215, 1, 0, 0.1568628, 1,
1.933508, 0.1968605, 1.093875, 1, 0, 0.1490196, 1,
1.942417, 0.4639895, 0.9884828, 1, 0, 0.145098, 1,
1.991286, -1.542744, 2.623159, 1, 0, 0.1372549, 1,
2.0165, 0.3017959, 0.6246951, 1, 0, 0.1333333, 1,
2.020647, 0.1758389, 1.233943, 1, 0, 0.1254902, 1,
2.050021, -0.52992, 4.10067, 1, 0, 0.1215686, 1,
2.108806, 1.767093, 1.930642, 1, 0, 0.1137255, 1,
2.116059, -0.0656344, 1.501952, 1, 0, 0.1098039, 1,
2.135623, 0.08501899, 0.5164148, 1, 0, 0.1019608, 1,
2.142083, -0.4962224, 3.383269, 1, 0, 0.09411765, 1,
2.210339, -1.030472, 1.398376, 1, 0, 0.09019608, 1,
2.214306, 1.322752, 0.3200769, 1, 0, 0.08235294, 1,
2.257234, -0.7256828, 1.992688, 1, 0, 0.07843138, 1,
2.300379, -0.001658623, 1.577393, 1, 0, 0.07058824, 1,
2.303058, 0.8335889, -0.4999822, 1, 0, 0.06666667, 1,
2.335227, 1.638757, 0.2586292, 1, 0, 0.05882353, 1,
2.336264, -0.5037426, 1.901148, 1, 0, 0.05490196, 1,
2.370358, -0.4019799, 4.396084, 1, 0, 0.04705882, 1,
2.613439, 2.189201, 1.943518, 1, 0, 0.04313726, 1,
2.775776, 0.8881719, -0.4414952, 1, 0, 0.03529412, 1,
2.857187, 1.353043, -0.6407716, 1, 0, 0.03137255, 1,
2.941033, 0.8079193, 2.841139, 1, 0, 0.02352941, 1,
3.063485, 0.6671745, 1.421144, 1, 0, 0.01960784, 1,
3.238507, -0.8940185, 3.415105, 1, 0, 0.01176471, 1,
3.26169, -0.1198556, 3.110967, 1, 0, 0.007843138, 1
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
0.09530771, -3.830422, -7.259481, 0, -0.5, 0.5, 0.5,
0.09530771, -3.830422, -7.259481, 1, -0.5, 0.5, 0.5,
0.09530771, -3.830422, -7.259481, 1, 1.5, 0.5, 0.5,
0.09530771, -3.830422, -7.259481, 0, 1.5, 0.5, 0.5
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
-4.144478, 0.3499831, -7.259481, 0, -0.5, 0.5, 0.5,
-4.144478, 0.3499831, -7.259481, 1, -0.5, 0.5, 0.5,
-4.144478, 0.3499831, -7.259481, 1, 1.5, 0.5, 0.5,
-4.144478, 0.3499831, -7.259481, 0, 1.5, 0.5, 0.5
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
-4.144478, -3.830422, -0.1303918, 0, -0.5, 0.5, 0.5,
-4.144478, -3.830422, -0.1303918, 1, -0.5, 0.5, 0.5,
-4.144478, -3.830422, -0.1303918, 1, 1.5, 0.5, 0.5,
-4.144478, -3.830422, -0.1303918, 0, 1.5, 0.5, 0.5
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
-3, -2.865713, -5.614307,
3, -2.865713, -5.614307,
-3, -2.865713, -5.614307,
-3, -3.026498, -5.888503,
-2, -2.865713, -5.614307,
-2, -3.026498, -5.888503,
-1, -2.865713, -5.614307,
-1, -3.026498, -5.888503,
0, -2.865713, -5.614307,
0, -3.026498, -5.888503,
1, -2.865713, -5.614307,
1, -3.026498, -5.888503,
2, -2.865713, -5.614307,
2, -3.026498, -5.888503,
3, -2.865713, -5.614307,
3, -3.026498, -5.888503
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
-3, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
-3, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
-3, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
-3, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5,
-2, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
-2, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
-2, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
-2, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5,
-1, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
-1, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
-1, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
-1, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5,
0, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
0, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
0, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
0, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5,
1, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
1, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
1, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
1, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5,
2, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
2, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
2, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
2, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5,
3, -3.348068, -6.436894, 0, -0.5, 0.5, 0.5,
3, -3.348068, -6.436894, 1, -0.5, 0.5, 0.5,
3, -3.348068, -6.436894, 1, 1.5, 0.5, 0.5,
3, -3.348068, -6.436894, 0, 1.5, 0.5, 0.5
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
-3.166066, -2, -5.614307,
-3.166066, 3, -5.614307,
-3.166066, -2, -5.614307,
-3.329135, -2, -5.888503,
-3.166066, -1, -5.614307,
-3.329135, -1, -5.888503,
-3.166066, 0, -5.614307,
-3.329135, 0, -5.888503,
-3.166066, 1, -5.614307,
-3.329135, 1, -5.888503,
-3.166066, 2, -5.614307,
-3.329135, 2, -5.888503,
-3.166066, 3, -5.614307,
-3.329135, 3, -5.888503
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
-3.655272, -2, -6.436894, 0, -0.5, 0.5, 0.5,
-3.655272, -2, -6.436894, 1, -0.5, 0.5, 0.5,
-3.655272, -2, -6.436894, 1, 1.5, 0.5, 0.5,
-3.655272, -2, -6.436894, 0, 1.5, 0.5, 0.5,
-3.655272, -1, -6.436894, 0, -0.5, 0.5, 0.5,
-3.655272, -1, -6.436894, 1, -0.5, 0.5, 0.5,
-3.655272, -1, -6.436894, 1, 1.5, 0.5, 0.5,
-3.655272, -1, -6.436894, 0, 1.5, 0.5, 0.5,
-3.655272, 0, -6.436894, 0, -0.5, 0.5, 0.5,
-3.655272, 0, -6.436894, 1, -0.5, 0.5, 0.5,
-3.655272, 0, -6.436894, 1, 1.5, 0.5, 0.5,
-3.655272, 0, -6.436894, 0, 1.5, 0.5, 0.5,
-3.655272, 1, -6.436894, 0, -0.5, 0.5, 0.5,
-3.655272, 1, -6.436894, 1, -0.5, 0.5, 0.5,
-3.655272, 1, -6.436894, 1, 1.5, 0.5, 0.5,
-3.655272, 1, -6.436894, 0, 1.5, 0.5, 0.5,
-3.655272, 2, -6.436894, 0, -0.5, 0.5, 0.5,
-3.655272, 2, -6.436894, 1, -0.5, 0.5, 0.5,
-3.655272, 2, -6.436894, 1, 1.5, 0.5, 0.5,
-3.655272, 2, -6.436894, 0, 1.5, 0.5, 0.5,
-3.655272, 3, -6.436894, 0, -0.5, 0.5, 0.5,
-3.655272, 3, -6.436894, 1, -0.5, 0.5, 0.5,
-3.655272, 3, -6.436894, 1, 1.5, 0.5, 0.5,
-3.655272, 3, -6.436894, 0, 1.5, 0.5, 0.5
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
-3.166066, -2.865713, -4,
-3.166066, -2.865713, 4,
-3.166066, -2.865713, -4,
-3.329135, -3.026498, -4,
-3.166066, -2.865713, -2,
-3.329135, -3.026498, -2,
-3.166066, -2.865713, 0,
-3.329135, -3.026498, 0,
-3.166066, -2.865713, 2,
-3.329135, -3.026498, 2,
-3.166066, -2.865713, 4,
-3.329135, -3.026498, 4
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
-3.655272, -3.348068, -4, 0, -0.5, 0.5, 0.5,
-3.655272, -3.348068, -4, 1, -0.5, 0.5, 0.5,
-3.655272, -3.348068, -4, 1, 1.5, 0.5, 0.5,
-3.655272, -3.348068, -4, 0, 1.5, 0.5, 0.5,
-3.655272, -3.348068, -2, 0, -0.5, 0.5, 0.5,
-3.655272, -3.348068, -2, 1, -0.5, 0.5, 0.5,
-3.655272, -3.348068, -2, 1, 1.5, 0.5, 0.5,
-3.655272, -3.348068, -2, 0, 1.5, 0.5, 0.5,
-3.655272, -3.348068, 0, 0, -0.5, 0.5, 0.5,
-3.655272, -3.348068, 0, 1, -0.5, 0.5, 0.5,
-3.655272, -3.348068, 0, 1, 1.5, 0.5, 0.5,
-3.655272, -3.348068, 0, 0, 1.5, 0.5, 0.5,
-3.655272, -3.348068, 2, 0, -0.5, 0.5, 0.5,
-3.655272, -3.348068, 2, 1, -0.5, 0.5, 0.5,
-3.655272, -3.348068, 2, 1, 1.5, 0.5, 0.5,
-3.655272, -3.348068, 2, 0, 1.5, 0.5, 0.5,
-3.655272, -3.348068, 4, 0, -0.5, 0.5, 0.5,
-3.655272, -3.348068, 4, 1, -0.5, 0.5, 0.5,
-3.655272, -3.348068, 4, 1, 1.5, 0.5, 0.5,
-3.655272, -3.348068, 4, 0, 1.5, 0.5, 0.5
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
-3.166066, -2.865713, -5.614307,
-3.166066, 3.565679, -5.614307,
-3.166066, -2.865713, 5.353523,
-3.166066, 3.565679, 5.353523,
-3.166066, -2.865713, -5.614307,
-3.166066, -2.865713, 5.353523,
-3.166066, 3.565679, -5.614307,
-3.166066, 3.565679, 5.353523,
-3.166066, -2.865713, -5.614307,
3.356682, -2.865713, -5.614307,
-3.166066, -2.865713, 5.353523,
3.356682, -2.865713, 5.353523,
-3.166066, 3.565679, -5.614307,
3.356682, 3.565679, -5.614307,
-3.166066, 3.565679, 5.353523,
3.356682, 3.565679, 5.353523,
3.356682, -2.865713, -5.614307,
3.356682, 3.565679, -5.614307,
3.356682, -2.865713, 5.353523,
3.356682, 3.565679, 5.353523,
3.356682, -2.865713, -5.614307,
3.356682, -2.865713, 5.353523,
3.356682, 3.565679, -5.614307,
3.356682, 3.565679, 5.353523
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
var radius = 7.63055;
var distance = 33.94918;
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
mvMatrix.translate( -0.09530771, -0.3499831, 0.1303918 );
mvMatrix.scale( 1.26485, 1.282817, 0.7522272 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94918);
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
chloropropylate<-read.table("chloropropylate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chloropropylate$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
```

```r
y<-chloropropylate$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
```

```r
z<-chloropropylate$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
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
-3.071075, -0.3997489, -4.002775, 0, 0, 1, 1, 1,
-2.762918, 0.5045852, -1.111673, 1, 0, 0, 1, 1,
-2.630224, 0.03196049, -1.067377, 1, 0, 0, 1, 1,
-2.58628, -2.122697, -1.383055, 1, 0, 0, 1, 1,
-2.460126, 0.4422001, -1.973662, 1, 0, 0, 1, 1,
-2.417616, 0.6591244, -1.682999, 1, 0, 0, 1, 1,
-2.381684, 0.01678594, -3.572479, 0, 0, 0, 1, 1,
-2.313506, -0.5511116, -0.9209186, 0, 0, 0, 1, 1,
-2.301091, -1.12212, -1.220603, 0, 0, 0, 1, 1,
-2.249699, 0.6049104, -0.9935592, 0, 0, 0, 1, 1,
-2.159145, -0.04410474, -2.995476, 0, 0, 0, 1, 1,
-2.145895, -0.6583943, -1.21207, 0, 0, 0, 1, 1,
-2.099263, 1.965638, 0.6885565, 0, 0, 0, 1, 1,
-2.079105, -1.224481, -0.8154339, 1, 1, 1, 1, 1,
-2.043387, -1.262505, -1.974074, 1, 1, 1, 1, 1,
-2.033879, 0.9436961, -0.5719536, 1, 1, 1, 1, 1,
-2.010731, -1.707186, -3.4117, 1, 1, 1, 1, 1,
-2.007341, 1.372968, -1.02771, 1, 1, 1, 1, 1,
-1.996785, -0.7475182, -1.138856, 1, 1, 1, 1, 1,
-1.989521, 0.7152367, 0.3368418, 1, 1, 1, 1, 1,
-1.987129, 0.4502801, -1.351353, 1, 1, 1, 1, 1,
-1.972733, -0.8407174, -2.964971, 1, 1, 1, 1, 1,
-1.925732, -0.5695627, -1.84077, 1, 1, 1, 1, 1,
-1.920412, 0.2951208, -0.2896866, 1, 1, 1, 1, 1,
-1.914614, -0.8317852, -1.625023, 1, 1, 1, 1, 1,
-1.873243, 0.6973846, -1.956017, 1, 1, 1, 1, 1,
-1.872754, -0.2231453, 0.08950391, 1, 1, 1, 1, 1,
-1.841036, -0.8547042, -0.6534812, 1, 1, 1, 1, 1,
-1.839447, 1.100925, -0.3019384, 0, 0, 1, 1, 1,
-1.825843, -0.3790048, -2.126053, 1, 0, 0, 1, 1,
-1.801206, 0.9233386, -3.059613, 1, 0, 0, 1, 1,
-1.794971, -0.2740309, -0.5229946, 1, 0, 0, 1, 1,
-1.794105, 0.8229765, -0.3555373, 1, 0, 0, 1, 1,
-1.793356, -0.6300173, -2.386281, 1, 0, 0, 1, 1,
-1.791346, -1.211192, -2.747195, 0, 0, 0, 1, 1,
-1.774412, 0.7716739, -0.8291548, 0, 0, 0, 1, 1,
-1.769646, 0.3629329, -1.563269, 0, 0, 0, 1, 1,
-1.76765, 0.6432356, 0.06033008, 0, 0, 0, 1, 1,
-1.766878, 0.4007479, -2.534624, 0, 0, 0, 1, 1,
-1.745333, 0.60229, -2.436406, 0, 0, 0, 1, 1,
-1.727416, -1.289436, -3.356614, 0, 0, 0, 1, 1,
-1.722254, 1.272764, -0.6134166, 1, 1, 1, 1, 1,
-1.714508, 0.2966147, -0.8769017, 1, 1, 1, 1, 1,
-1.672558, -1.615922, -0.7237626, 1, 1, 1, 1, 1,
-1.655794, 0.3929314, -0.8674998, 1, 1, 1, 1, 1,
-1.646644, 0.1059232, -0.5313376, 1, 1, 1, 1, 1,
-1.64627, 0.2901723, 0.4690944, 1, 1, 1, 1, 1,
-1.64388, -0.6707093, 0.8616691, 1, 1, 1, 1, 1,
-1.635886, 0.8023083, -1.082451, 1, 1, 1, 1, 1,
-1.629982, 0.4029422, -4.986938, 1, 1, 1, 1, 1,
-1.618674, -0.8616722, -1.732167, 1, 1, 1, 1, 1,
-1.61785, 0.7857384, -1.953343, 1, 1, 1, 1, 1,
-1.614202, 0.4583965, -3.118095, 1, 1, 1, 1, 1,
-1.610859, 1.147651, -1.326072, 1, 1, 1, 1, 1,
-1.587371, 1.117153, -2.000135, 1, 1, 1, 1, 1,
-1.58624, -1.013759, -2.029764, 1, 1, 1, 1, 1,
-1.579768, 0.5880443, -0.7418235, 0, 0, 1, 1, 1,
-1.579501, -0.9682397, -0.5284229, 1, 0, 0, 1, 1,
-1.573473, -1.365472, -3.309875, 1, 0, 0, 1, 1,
-1.550117, -0.2325143, -0.5972149, 1, 0, 0, 1, 1,
-1.541355, 1.410159, 0.2122631, 1, 0, 0, 1, 1,
-1.534993, -1.729534, -0.4075859, 1, 0, 0, 1, 1,
-1.530183, -0.4592794, -2.990802, 0, 0, 0, 1, 1,
-1.529117, 0.1960979, -1.386518, 0, 0, 0, 1, 1,
-1.505804, -2.192541, -5.454581, 0, 0, 0, 1, 1,
-1.505465, 1.711176, -1.361483, 0, 0, 0, 1, 1,
-1.501096, 0.4272794, -1.872958, 0, 0, 0, 1, 1,
-1.485605, 1.055224, -1.342714, 0, 0, 0, 1, 1,
-1.47472, 1.782874, -0.5567841, 0, 0, 0, 1, 1,
-1.471916, -0.06020262, -1.906885, 1, 1, 1, 1, 1,
-1.470901, -0.3281136, -2.861924, 1, 1, 1, 1, 1,
-1.467328, -0.04271386, -0.6359103, 1, 1, 1, 1, 1,
-1.45577, 0.777382, -0.4352847, 1, 1, 1, 1, 1,
-1.441492, -0.3567696, -0.9339198, 1, 1, 1, 1, 1,
-1.434558, -0.02065952, -1.994347, 1, 1, 1, 1, 1,
-1.411576, 1.22615, -1.473528, 1, 1, 1, 1, 1,
-1.403117, 0.7573252, -1.090078, 1, 1, 1, 1, 1,
-1.394304, 0.7619383, 0.05138577, 1, 1, 1, 1, 1,
-1.392371, 1.423015, -2.374584, 1, 1, 1, 1, 1,
-1.368798, -0.5074131, -2.382303, 1, 1, 1, 1, 1,
-1.366508, 0.450068, -1.30921, 1, 1, 1, 1, 1,
-1.364884, 0.7413608, -2.003683, 1, 1, 1, 1, 1,
-1.36323, 0.3751793, -1.713989, 1, 1, 1, 1, 1,
-1.357699, 0.04143307, 0.5061111, 1, 1, 1, 1, 1,
-1.348304, 1.546912, -1.577154, 0, 0, 1, 1, 1,
-1.342388, 1.074914, -1.022709, 1, 0, 0, 1, 1,
-1.341543, -1.371764, -4.71744, 1, 0, 0, 1, 1,
-1.335476, -0.2361043, -1.954215, 1, 0, 0, 1, 1,
-1.33394, 0.543579, 0.392592, 1, 0, 0, 1, 1,
-1.33282, -0.008512544, -1.385975, 1, 0, 0, 1, 1,
-1.330712, 1.37596, 0.5113053, 0, 0, 0, 1, 1,
-1.330216, 0.2177926, -0.5849054, 0, 0, 0, 1, 1,
-1.321597, -1.572731, -2.40885, 0, 0, 0, 1, 1,
-1.311424, -0.6512482, -3.804772, 0, 0, 0, 1, 1,
-1.308908, -0.9696077, -2.2134, 0, 0, 0, 1, 1,
-1.304918, -0.3768264, -2.659299, 0, 0, 0, 1, 1,
-1.300833, -1.98175, -3.042949, 0, 0, 0, 1, 1,
-1.291483, -0.07233148, -2.203651, 1, 1, 1, 1, 1,
-1.284406, -0.7488356, -2.925928, 1, 1, 1, 1, 1,
-1.279467, 0.4092102, -1.255992, 1, 1, 1, 1, 1,
-1.279357, 1.01104, 0.01074534, 1, 1, 1, 1, 1,
-1.278131, -0.2580456, -2.959072, 1, 1, 1, 1, 1,
-1.270197, 1.090011, -1.008094, 1, 1, 1, 1, 1,
-1.267952, 1.547202, -1.45885, 1, 1, 1, 1, 1,
-1.263232, 0.943157, -0.6008781, 1, 1, 1, 1, 1,
-1.259208, -0.2919606, -2.475065, 1, 1, 1, 1, 1,
-1.257558, 0.8617352, 1.424148, 1, 1, 1, 1, 1,
-1.246967, -0.575875, -0.4399011, 1, 1, 1, 1, 1,
-1.241549, -0.4064201, -2.671492, 1, 1, 1, 1, 1,
-1.241415, 1.884124, 0.6807789, 1, 1, 1, 1, 1,
-1.241363, -2.266275, -3.391145, 1, 1, 1, 1, 1,
-1.233719, 1.685913, -2.549126, 1, 1, 1, 1, 1,
-1.232579, -1.05039, -2.610472, 0, 0, 1, 1, 1,
-1.22997, -0.1322934, -1.617699, 1, 0, 0, 1, 1,
-1.22733, -2.141656, -3.549113, 1, 0, 0, 1, 1,
-1.221044, 0.2262175, -2.095517, 1, 0, 0, 1, 1,
-1.206298, 1.016346, 0.09090941, 1, 0, 0, 1, 1,
-1.198067, -0.9648097, -1.6714, 1, 0, 0, 1, 1,
-1.185459, -0.6746167, -1.398827, 0, 0, 0, 1, 1,
-1.184843, -1.894095, -3.068818, 0, 0, 0, 1, 1,
-1.179547, -2.354576, -2.392492, 0, 0, 0, 1, 1,
-1.17538, -0.02782487, -2.808646, 0, 0, 0, 1, 1,
-1.173184, 0.6813117, 0.2598311, 0, 0, 0, 1, 1,
-1.152706, 0.2357859, -1.198175, 0, 0, 0, 1, 1,
-1.149674, -0.4035081, -1.114666, 0, 0, 0, 1, 1,
-1.149403, 0.2338684, -2.404109, 1, 1, 1, 1, 1,
-1.144521, -0.1757458, -2.285101, 1, 1, 1, 1, 1,
-1.136062, -0.3089647, -3.686771, 1, 1, 1, 1, 1,
-1.133657, 0.7566249, -0.1410781, 1, 1, 1, 1, 1,
-1.124019, 0.4997245, -1.654024, 1, 1, 1, 1, 1,
-1.106806, 2.048059, 0.3925665, 1, 1, 1, 1, 1,
-1.097068, 0.6001667, -2.193743, 1, 1, 1, 1, 1,
-1.09119, 0.5174221, -0.7820569, 1, 1, 1, 1, 1,
-1.088682, 0.04652575, -1.960183, 1, 1, 1, 1, 1,
-1.085346, 1.108647, -0.6730165, 1, 1, 1, 1, 1,
-1.08006, 1.182865, -0.1462633, 1, 1, 1, 1, 1,
-1.079716, 0.5405743, -2.227338, 1, 1, 1, 1, 1,
-1.078409, -0.8685737, -1.425566, 1, 1, 1, 1, 1,
-1.073894, -0.3476219, -1.750155, 1, 1, 1, 1, 1,
-1.073758, 1.254945, -0.6924371, 1, 1, 1, 1, 1,
-1.073117, 0.1519009, -1.517656, 0, 0, 1, 1, 1,
-1.072669, -1.096413, -2.327678, 1, 0, 0, 1, 1,
-1.069812, 0.3738278, -1.574051, 1, 0, 0, 1, 1,
-1.06684, 0.05822976, -3.974855, 1, 0, 0, 1, 1,
-1.065625, -1.991379, -3.805818, 1, 0, 0, 1, 1,
-1.0652, -0.6378412, -0.7862448, 1, 0, 0, 1, 1,
-1.063419, -2.130146, -2.841871, 0, 0, 0, 1, 1,
-1.063038, -0.4785582, -2.318288, 0, 0, 0, 1, 1,
-1.061978, 0.2379028, -1.470267, 0, 0, 0, 1, 1,
-1.052107, -0.6562497, -2.775586, 0, 0, 0, 1, 1,
-1.05149, -0.643643, -3.947291, 0, 0, 0, 1, 1,
-1.050538, 1.612239, -1.153146, 0, 0, 0, 1, 1,
-1.045143, 1.77337, 0.9300993, 0, 0, 0, 1, 1,
-1.045072, 1.13172, -2.049382, 1, 1, 1, 1, 1,
-1.044498, 1.189737, 0.421318, 1, 1, 1, 1, 1,
-1.038574, -0.8490576, -1.347245, 1, 1, 1, 1, 1,
-1.037889, 1.358417, -0.3126373, 1, 1, 1, 1, 1,
-1.030604, 0.01248421, -1.698866, 1, 1, 1, 1, 1,
-1.02809, -0.9073613, -2.302238, 1, 1, 1, 1, 1,
-1.022767, 0.7725402, -0.6872472, 1, 1, 1, 1, 1,
-1.017669, 1.117205, -0.130138, 1, 1, 1, 1, 1,
-1.015851, -0.7120624, -2.655827, 1, 1, 1, 1, 1,
-1.007878, -1.420422, -3.395588, 1, 1, 1, 1, 1,
-1.003412, -0.1353291, -2.064526, 1, 1, 1, 1, 1,
-0.9996513, 0.5300526, -2.279593, 1, 1, 1, 1, 1,
-0.995737, -0.06173119, -0.0602829, 1, 1, 1, 1, 1,
-0.992138, 1.376085, -0.1288111, 1, 1, 1, 1, 1,
-0.9899827, -0.9033533, -2.297031, 1, 1, 1, 1, 1,
-0.9793233, 0.3643108, -0.9965741, 0, 0, 1, 1, 1,
-0.9787953, -0.0510431, -1.19387, 1, 0, 0, 1, 1,
-0.974457, 1.560583, -2.385438, 1, 0, 0, 1, 1,
-0.968586, 1.764004, 0.07663395, 1, 0, 0, 1, 1,
-0.9665255, -1.244914, -1.42372, 1, 0, 0, 1, 1,
-0.9661724, -0.7035483, -1.327474, 1, 0, 0, 1, 1,
-0.9604183, 0.0226018, -3.109593, 0, 0, 0, 1, 1,
-0.9468058, 0.375, 0.1975361, 0, 0, 0, 1, 1,
-0.9439362, 0.7124059, -0.808059, 0, 0, 0, 1, 1,
-0.9431064, -0.7458887, -1.595702, 0, 0, 0, 1, 1,
-0.9398034, 0.629897, -2.12148, 0, 0, 0, 1, 1,
-0.9380183, -0.2707557, -2.61518, 0, 0, 0, 1, 1,
-0.916817, -0.3094838, -0.9004205, 0, 0, 0, 1, 1,
-0.9134203, -0.4035701, -2.588468, 1, 1, 1, 1, 1,
-0.9108349, -0.2005558, -1.234963, 1, 1, 1, 1, 1,
-0.9102077, -0.4922991, -0.7292344, 1, 1, 1, 1, 1,
-0.9089733, 0.07850215, -2.046603, 1, 1, 1, 1, 1,
-0.9083355, 2.139823, 1.629215, 1, 1, 1, 1, 1,
-0.90674, -2.057117, -3.938482, 1, 1, 1, 1, 1,
-0.9066668, -0.6965302, -2.376647, 1, 1, 1, 1, 1,
-0.9043308, 0.3387184, -2.62897, 1, 1, 1, 1, 1,
-0.8994449, -1.557141, -2.878884, 1, 1, 1, 1, 1,
-0.89298, 0.138105, -2.319818, 1, 1, 1, 1, 1,
-0.8907545, 0.9586569, -3.297595, 1, 1, 1, 1, 1,
-0.8807772, -0.1185604, -0.9523007, 1, 1, 1, 1, 1,
-0.8748366, 0.27548, -1.304861, 1, 1, 1, 1, 1,
-0.8724096, -1.831529, -3.17867, 1, 1, 1, 1, 1,
-0.8714011, 0.7559949, -0.6181867, 1, 1, 1, 1, 1,
-0.8683677, 1.315967, -0.8597434, 0, 0, 1, 1, 1,
-0.8636087, 0.513851, -1.753312, 1, 0, 0, 1, 1,
-0.8593298, -1.357, -2.051239, 1, 0, 0, 1, 1,
-0.8544697, 0.1542243, -0.3134962, 1, 0, 0, 1, 1,
-0.8542673, -1.835993, -2.37624, 1, 0, 0, 1, 1,
-0.8495693, -0.5953709, -2.720179, 1, 0, 0, 1, 1,
-0.8430311, 0.1932333, -1.169924, 0, 0, 0, 1, 1,
-0.8424664, 0.1501396, -0.9707171, 0, 0, 0, 1, 1,
-0.8286988, 0.1928152, -0.4826601, 0, 0, 0, 1, 1,
-0.8274038, -0.3299154, -2.498153, 0, 0, 0, 1, 1,
-0.8238363, 1.091278, 0.0534092, 0, 0, 0, 1, 1,
-0.8235632, 0.7963316, -0.4004028, 0, 0, 0, 1, 1,
-0.8226042, 0.4464599, -1.469725, 0, 0, 0, 1, 1,
-0.8148904, -0.6230978, -1.669834, 1, 1, 1, 1, 1,
-0.8133504, 1.302473, -1.165881, 1, 1, 1, 1, 1,
-0.807247, 2.532303, -1.442138, 1, 1, 1, 1, 1,
-0.8032746, 2.252108, 0.1552805, 1, 1, 1, 1, 1,
-0.8026859, 0.9603435, 0.548209, 1, 1, 1, 1, 1,
-0.7994502, 1.328122, 1.116751, 1, 1, 1, 1, 1,
-0.7993278, 0.303166, -1.959138, 1, 1, 1, 1, 1,
-0.7936864, -0.8808628, -2.20581, 1, 1, 1, 1, 1,
-0.7926675, -1.049811, -1.674909, 1, 1, 1, 1, 1,
-0.7911195, 1.165299, -1.294418, 1, 1, 1, 1, 1,
-0.7865888, 1.231449, 0.07299223, 1, 1, 1, 1, 1,
-0.7827458, 0.2553835, -0.7363408, 1, 1, 1, 1, 1,
-0.7817243, -0.160023, -3.199216, 1, 1, 1, 1, 1,
-0.7788119, 1.137197, 0.2575366, 1, 1, 1, 1, 1,
-0.7777314, 0.8920217, -0.72375, 1, 1, 1, 1, 1,
-0.777201, -1.234485, -1.976008, 0, 0, 1, 1, 1,
-0.7752531, 0.2658433, -2.293914, 1, 0, 0, 1, 1,
-0.7750251, 1.075431, -1.382072, 1, 0, 0, 1, 1,
-0.7675278, -0.5539923, -3.318718, 1, 0, 0, 1, 1,
-0.7602847, -0.2847655, -1.434572, 1, 0, 0, 1, 1,
-0.7593683, -0.2852829, -1.066464, 1, 0, 0, 1, 1,
-0.7577443, 1.418274, -0.9343894, 0, 0, 0, 1, 1,
-0.7577084, -0.9117302, -1.243576, 0, 0, 0, 1, 1,
-0.7546773, -1.416462, -3.38381, 0, 0, 0, 1, 1,
-0.7545955, 0.6494515, 0.5464298, 0, 0, 0, 1, 1,
-0.7453613, -0.364625, -1.169775, 0, 0, 0, 1, 1,
-0.7447692, -0.6414593, -1.333347, 0, 0, 0, 1, 1,
-0.7444423, -0.1793998, -1.904066, 0, 0, 0, 1, 1,
-0.7409589, -0.2546696, -1.11223, 1, 1, 1, 1, 1,
-0.7405741, 0.05704146, 0.08986428, 1, 1, 1, 1, 1,
-0.7364012, -0.2722612, -1.373034, 1, 1, 1, 1, 1,
-0.735782, 0.05867311, -1.990237, 1, 1, 1, 1, 1,
-0.7357673, -1.174765, -3.269276, 1, 1, 1, 1, 1,
-0.7319813, -0.05555539, -0.4757631, 1, 1, 1, 1, 1,
-0.7307107, 0.8164847, -1.938424, 1, 1, 1, 1, 1,
-0.7304921, 0.4697761, -1.436647, 1, 1, 1, 1, 1,
-0.7223684, -0.2586956, -3.754888, 1, 1, 1, 1, 1,
-0.721311, -0.1725475, -1.981097, 1, 1, 1, 1, 1,
-0.7199482, 0.7735057, -0.5992251, 1, 1, 1, 1, 1,
-0.709461, -0.7057462, -2.468865, 1, 1, 1, 1, 1,
-0.7032273, 0.5945915, -0.5270552, 1, 1, 1, 1, 1,
-0.700621, -1.288475, -3.583152, 1, 1, 1, 1, 1,
-0.7005696, -0.6574443, -2.569308, 1, 1, 1, 1, 1,
-0.7005304, -1.568721, -2.194491, 0, 0, 1, 1, 1,
-0.6990711, -0.1707912, -1.052549, 1, 0, 0, 1, 1,
-0.6983999, 0.4494735, 0.6656114, 1, 0, 0, 1, 1,
-0.6948138, -0.1343837, -1.936121, 1, 0, 0, 1, 1,
-0.6939328, -1.909372, -2.002488, 1, 0, 0, 1, 1,
-0.690007, 1.699872, -0.7974266, 1, 0, 0, 1, 1,
-0.6796795, -0.8295996, -4.036091, 0, 0, 0, 1, 1,
-0.6762823, -0.07599452, 0.3454069, 0, 0, 0, 1, 1,
-0.6758391, -0.2112074, -1.652527, 0, 0, 0, 1, 1,
-0.6714793, 1.208879, -1.004143, 0, 0, 0, 1, 1,
-0.6691315, 0.4171897, -1.769345, 0, 0, 0, 1, 1,
-0.6628081, -0.7806211, -4.873239, 0, 0, 0, 1, 1,
-0.6614685, 0.39781, 0.7963374, 0, 0, 0, 1, 1,
-0.6576695, 0.2049723, -0.4862383, 1, 1, 1, 1, 1,
-0.6567667, 0.4187397, -0.9558152, 1, 1, 1, 1, 1,
-0.6511779, 2.003438, -1.743308, 1, 1, 1, 1, 1,
-0.6461866, 1.475551, -0.5663015, 1, 1, 1, 1, 1,
-0.6416902, -1.051306, -1.699022, 1, 1, 1, 1, 1,
-0.6398233, -1.424338, -1.827092, 1, 1, 1, 1, 1,
-0.6397545, -0.9302135, -1.401492, 1, 1, 1, 1, 1,
-0.6348172, 2.47173, -1.646233, 1, 1, 1, 1, 1,
-0.6281905, -1.384001, -2.764458, 1, 1, 1, 1, 1,
-0.6274977, -0.3227079, -2.952786, 1, 1, 1, 1, 1,
-0.6272389, 0.6619983, -2.613395, 1, 1, 1, 1, 1,
-0.6270908, 1.973135, -1.448205, 1, 1, 1, 1, 1,
-0.6262893, -0.08753393, -3.018894, 1, 1, 1, 1, 1,
-0.6173862, -0.1400863, 0.5596821, 1, 1, 1, 1, 1,
-0.6121353, 1.433338, -1.414977, 1, 1, 1, 1, 1,
-0.6116455, -1.219317, -2.310366, 0, 0, 1, 1, 1,
-0.608916, 1.420016, 0.6355165, 1, 0, 0, 1, 1,
-0.6087981, -0.2803654, -1.073694, 1, 0, 0, 1, 1,
-0.6046077, -0.8302028, -3.057166, 1, 0, 0, 1, 1,
-0.6045828, -0.7990617, -2.665628, 1, 0, 0, 1, 1,
-0.6006255, -0.4483015, -1.462275, 1, 0, 0, 1, 1,
-0.6004298, 0.1871381, -1.28836, 0, 0, 0, 1, 1,
-0.5935716, -0.2070112, -2.194217, 0, 0, 0, 1, 1,
-0.5928679, 0.5343812, -0.3027524, 0, 0, 0, 1, 1,
-0.5906811, 0.9512578, -0.6478248, 0, 0, 0, 1, 1,
-0.5891743, -0.4505231, -1.640613, 0, 0, 0, 1, 1,
-0.5889331, -0.5057949, -2.915427, 0, 0, 0, 1, 1,
-0.5878008, 0.9231867, 0.3975344, 0, 0, 0, 1, 1,
-0.5872408, 0.0817255, -2.108582, 1, 1, 1, 1, 1,
-0.5866037, -1.901984, -3.742292, 1, 1, 1, 1, 1,
-0.5817936, -0.09815461, -1.901479, 1, 1, 1, 1, 1,
-0.572382, -1.460935, -1.452512, 1, 1, 1, 1, 1,
-0.5721259, -0.05438494, -2.513309, 1, 1, 1, 1, 1,
-0.571548, 0.3045822, -1.414617, 1, 1, 1, 1, 1,
-0.5709727, -1.126976, -2.240967, 1, 1, 1, 1, 1,
-0.5700715, -0.9062979, -1.479505, 1, 1, 1, 1, 1,
-0.5644474, -0.7910639, -3.096849, 1, 1, 1, 1, 1,
-0.5631297, 0.1992508, 0.8353637, 1, 1, 1, 1, 1,
-0.5595234, -0.08607144, -1.584702, 1, 1, 1, 1, 1,
-0.5584947, 0.06137741, -1.424, 1, 1, 1, 1, 1,
-0.5575599, -0.9968477, -3.514693, 1, 1, 1, 1, 1,
-0.5522648, 2.650814, 0.18943, 1, 1, 1, 1, 1,
-0.5516564, 0.5595272, -1.702583, 1, 1, 1, 1, 1,
-0.5492335, 1.908931, 0.2255828, 0, 0, 1, 1, 1,
-0.5387566, 0.4886847, -0.3542291, 1, 0, 0, 1, 1,
-0.5362642, -0.9192067, -2.828832, 1, 0, 0, 1, 1,
-0.5354087, 0.6905591, -0.5021726, 1, 0, 0, 1, 1,
-0.5349282, -0.6476848, -3.677263, 1, 0, 0, 1, 1,
-0.5331863, 0.9176947, -0.1444565, 1, 0, 0, 1, 1,
-0.5327213, -1.177198, -3.307335, 0, 0, 0, 1, 1,
-0.5267183, 0.3689115, -1.608786, 0, 0, 0, 1, 1,
-0.5255473, 1.433574, -2.491715, 0, 0, 0, 1, 1,
-0.5221917, 0.8085681, -0.6369298, 0, 0, 0, 1, 1,
-0.5190124, -0.7046463, -3.13264, 0, 0, 0, 1, 1,
-0.5181354, 1.695252, -0.5341139, 0, 0, 0, 1, 1,
-0.5084306, -0.318901, -2.394785, 0, 0, 0, 1, 1,
-0.5080835, -1.635889, -3.292874, 1, 1, 1, 1, 1,
-0.5054354, 1.754417, 0.6503429, 1, 1, 1, 1, 1,
-0.5044835, -0.8402963, -2.135226, 1, 1, 1, 1, 1,
-0.5034331, -1.261257, -3.734371, 1, 1, 1, 1, 1,
-0.501905, -1.653297, -3.822955, 1, 1, 1, 1, 1,
-0.4866754, -1.240409, -3.764308, 1, 1, 1, 1, 1,
-0.486038, -0.5019159, -2.503441, 1, 1, 1, 1, 1,
-0.4853013, -0.07149175, -2.148334, 1, 1, 1, 1, 1,
-0.4841671, 0.8825627, 0.3371993, 1, 1, 1, 1, 1,
-0.4829358, -2.772052, -3.499076, 1, 1, 1, 1, 1,
-0.4821427, 0.220636, -0.4548185, 1, 1, 1, 1, 1,
-0.4775378, 0.3400096, -2.271464, 1, 1, 1, 1, 1,
-0.475462, -0.5652946, -3.664318, 1, 1, 1, 1, 1,
-0.474262, 0.3959661, -1.518791, 1, 1, 1, 1, 1,
-0.4741391, 0.2469379, -1.210267, 1, 1, 1, 1, 1,
-0.4654258, -1.263175, -2.490753, 0, 0, 1, 1, 1,
-0.454493, -0.8986542, -1.695797, 1, 0, 0, 1, 1,
-0.4539235, -1.823187, -2.774016, 1, 0, 0, 1, 1,
-0.4519344, 0.9694019, -0.1599697, 1, 0, 0, 1, 1,
-0.4454574, -0.04317066, -1.529487, 1, 0, 0, 1, 1,
-0.443842, -0.9183161, -1.841275, 1, 0, 0, 1, 1,
-0.4373746, -0.002249977, -1.454163, 0, 0, 0, 1, 1,
-0.4364206, -0.5098755, -3.046661, 0, 0, 0, 1, 1,
-0.4358693, 0.5288038, -1.007874, 0, 0, 0, 1, 1,
-0.4353086, -1.099145, -2.358604, 0, 0, 0, 1, 1,
-0.4331188, 0.632366, -2.171366, 0, 0, 0, 1, 1,
-0.4315408, 1.286832, -0.2661818, 0, 0, 0, 1, 1,
-0.4266887, 1.469272, -0.498683, 0, 0, 0, 1, 1,
-0.4221659, -1.061972, -4.080595, 1, 1, 1, 1, 1,
-0.4217732, -0.7032034, -2.761036, 1, 1, 1, 1, 1,
-0.4159831, 0.7226926, -1.511677, 1, 1, 1, 1, 1,
-0.4141974, 1.467795, -0.9420639, 1, 1, 1, 1, 1,
-0.4114281, 0.2741605, -1.408788, 1, 1, 1, 1, 1,
-0.4017942, -0.5515636, -1.21714, 1, 1, 1, 1, 1,
-0.3973561, -1.151112, -4.010365, 1, 1, 1, 1, 1,
-0.3947577, -1.660032, -3.203408, 1, 1, 1, 1, 1,
-0.39455, 0.8332034, -1.036236, 1, 1, 1, 1, 1,
-0.3938766, -1.192315, -1.152173, 1, 1, 1, 1, 1,
-0.393856, -1.386269, -3.553845, 1, 1, 1, 1, 1,
-0.3928402, -0.885006, -3.482374, 1, 1, 1, 1, 1,
-0.3891376, -0.007894501, -0.7931469, 1, 1, 1, 1, 1,
-0.3839357, -1.415709, -2.779141, 1, 1, 1, 1, 1,
-0.3835141, 1.301942, -0.9662135, 1, 1, 1, 1, 1,
-0.380345, -0.4919114, -2.514566, 0, 0, 1, 1, 1,
-0.3795241, 0.3778894, 0.2149943, 1, 0, 0, 1, 1,
-0.3745306, -0.1377604, -3.32421, 1, 0, 0, 1, 1,
-0.3738062, -1.371456, -1.965055, 1, 0, 0, 1, 1,
-0.3737445, 1.97974, 0.9762757, 1, 0, 0, 1, 1,
-0.3632601, 0.643579, -0.4471493, 1, 0, 0, 1, 1,
-0.3606096, -1.223221, -2.131807, 0, 0, 0, 1, 1,
-0.3581774, -0.2123219, -2.22607, 0, 0, 0, 1, 1,
-0.3566903, 1.244757, -0.7378086, 0, 0, 0, 1, 1,
-0.3544842, -0.90165, -3.784192, 0, 0, 0, 1, 1,
-0.3534308, 0.3182704, -2.117924, 0, 0, 0, 1, 1,
-0.3530073, 0.5929194, 0.274024, 0, 0, 0, 1, 1,
-0.3495436, -0.7995344, -3.397259, 0, 0, 0, 1, 1,
-0.3491535, 0.6302603, -0.3520466, 1, 1, 1, 1, 1,
-0.3459511, -0.5031685, -2.849233, 1, 1, 1, 1, 1,
-0.3417489, 1.323619, -0.1854246, 1, 1, 1, 1, 1,
-0.3406659, -1.339397, -3.365698, 1, 1, 1, 1, 1,
-0.3398763, 0.3406885, -1.559226, 1, 1, 1, 1, 1,
-0.336283, -1.471209, -3.442029, 1, 1, 1, 1, 1,
-0.334452, -0.1283431, -0.8145118, 1, 1, 1, 1, 1,
-0.3331374, -1.023975, -2.32096, 1, 1, 1, 1, 1,
-0.3311736, 2.67249, -0.02370602, 1, 1, 1, 1, 1,
-0.3268463, 1.613594, -1.100712, 1, 1, 1, 1, 1,
-0.3264193, -0.4134217, -0.2120559, 1, 1, 1, 1, 1,
-0.3216783, 0.4136645, -1.22783, 1, 1, 1, 1, 1,
-0.3205837, 1.324671, -0.1038938, 1, 1, 1, 1, 1,
-0.3204972, 0.4289313, -3.591208, 1, 1, 1, 1, 1,
-0.3199529, -0.5188777, -0.6810367, 1, 1, 1, 1, 1,
-0.3164309, 0.7204437, 0.618855, 0, 0, 1, 1, 1,
-0.3074144, 1.527978, 1.753249, 1, 0, 0, 1, 1,
-0.3068177, -0.8357352, -3.131468, 1, 0, 0, 1, 1,
-0.3049919, -0.2970589, -1.922654, 1, 0, 0, 1, 1,
-0.30361, -0.7202856, -3.962348, 1, 0, 0, 1, 1,
-0.3034524, -1.459023, -4.264466, 1, 0, 0, 1, 1,
-0.3022743, 0.1236687, -3.111979, 0, 0, 0, 1, 1,
-0.3022317, -0.975163, -1.640258, 0, 0, 0, 1, 1,
-0.2998748, 2.352778, -0.5380435, 0, 0, 0, 1, 1,
-0.2994563, 0.06302351, -1.095197, 0, 0, 0, 1, 1,
-0.2935271, -0.5446473, -3.387884, 0, 0, 0, 1, 1,
-0.2934448, -0.9083956, -2.01457, 0, 0, 0, 1, 1,
-0.2901578, -0.328483, -2.6495, 0, 0, 0, 1, 1,
-0.2892933, 1.464408, -0.3464881, 1, 1, 1, 1, 1,
-0.2869325, 0.2766244, -0.2764857, 1, 1, 1, 1, 1,
-0.2832046, 1.169044, 1.444733, 1, 1, 1, 1, 1,
-0.282287, 0.6631446, 0.5166533, 1, 1, 1, 1, 1,
-0.2788331, 0.1587518, -0.8677947, 1, 1, 1, 1, 1,
-0.2761394, 0.2038323, -0.5494567, 1, 1, 1, 1, 1,
-0.2728619, 1.028276, -1.21305, 1, 1, 1, 1, 1,
-0.2703561, 0.653232, -0.00441525, 1, 1, 1, 1, 1,
-0.2682503, -0.5889895, -3.132999, 1, 1, 1, 1, 1,
-0.2671601, 0.548319, -2.275073, 1, 1, 1, 1, 1,
-0.2649818, 0.362847, 0.6446181, 1, 1, 1, 1, 1,
-0.2638852, 0.007671024, -2.121261, 1, 1, 1, 1, 1,
-0.2617942, -0.6808356, -3.607257, 1, 1, 1, 1, 1,
-0.2614628, -0.02377626, -1.667153, 1, 1, 1, 1, 1,
-0.2611159, -0.03323692, -2.669037, 1, 1, 1, 1, 1,
-0.2609704, -0.3193031, -1.914952, 0, 0, 1, 1, 1,
-0.2583459, 0.2262384, -2.160293, 1, 0, 0, 1, 1,
-0.2576635, -1.634594, -1.148187, 1, 0, 0, 1, 1,
-0.2561392, -1.460829, -3.999121, 1, 0, 0, 1, 1,
-0.2535686, 0.5542267, -0.03634727, 1, 0, 0, 1, 1,
-0.2530545, 1.332744, 0.155891, 1, 0, 0, 1, 1,
-0.2469693, 0.9159748, 0.627436, 0, 0, 0, 1, 1,
-0.242487, 0.2158935, -1.574477, 0, 0, 0, 1, 1,
-0.2419866, -1.198467, -1.267141, 0, 0, 0, 1, 1,
-0.2257814, 2.46734, 1.208686, 0, 0, 0, 1, 1,
-0.2224165, -0.6287355, -4.709096, 0, 0, 0, 1, 1,
-0.2208965, 0.3880077, -2.13689, 0, 0, 0, 1, 1,
-0.2205865, 0.3258199, -1.084518, 0, 0, 0, 1, 1,
-0.2204358, -0.6044273, -1.022814, 1, 1, 1, 1, 1,
-0.2105786, -1.570241, -1.974467, 1, 1, 1, 1, 1,
-0.2098773, 2.068466, -2.181709, 1, 1, 1, 1, 1,
-0.2082002, 1.557339, 0.683408, 1, 1, 1, 1, 1,
-0.2073323, -1.166316, -3.96477, 1, 1, 1, 1, 1,
-0.2027647, -1.332009, -3.222414, 1, 1, 1, 1, 1,
-0.198948, -0.0003407626, -2.181725, 1, 1, 1, 1, 1,
-0.1975188, -0.6844467, -5.209018, 1, 1, 1, 1, 1,
-0.195984, 0.7041733, -0.5624146, 1, 1, 1, 1, 1,
-0.1929489, 1.813453, 0.0001083694, 1, 1, 1, 1, 1,
-0.1926767, 0.4567427, 0.2959407, 1, 1, 1, 1, 1,
-0.1922994, -0.03797793, -0.4643214, 1, 1, 1, 1, 1,
-0.192035, -1.270245, -3.498766, 1, 1, 1, 1, 1,
-0.1919657, -0.7090764, -2.549046, 1, 1, 1, 1, 1,
-0.1906177, 1.358616, 1.383478, 1, 1, 1, 1, 1,
-0.1845646, -0.7094418, -2.041745, 0, 0, 1, 1, 1,
-0.1824681, 0.8141469, -0.1122354, 1, 0, 0, 1, 1,
-0.176687, 0.5870975, -1.502675, 1, 0, 0, 1, 1,
-0.175837, -1.065469, -3.304606, 1, 0, 0, 1, 1,
-0.1749133, 0.01737726, -2.847789, 1, 0, 0, 1, 1,
-0.1735548, 0.05750005, 0.1635069, 1, 0, 0, 1, 1,
-0.1727027, -0.5131621, -3.478576, 0, 0, 0, 1, 1,
-0.1614946, 0.5577273, 0.6579428, 0, 0, 0, 1, 1,
-0.1591887, -0.5588419, -2.498543, 0, 0, 0, 1, 1,
-0.1519167, 0.9489523, 0.1111274, 0, 0, 0, 1, 1,
-0.1481556, -0.5099136, -2.821444, 0, 0, 0, 1, 1,
-0.1441312, 0.1986252, -1.035421, 0, 0, 0, 1, 1,
-0.1420975, 0.54733, -0.7278004, 0, 0, 0, 1, 1,
-0.1417185, 1.768731, -0.8313761, 1, 1, 1, 1, 1,
-0.1378098, 0.8727149, 0.831938, 1, 1, 1, 1, 1,
-0.1370035, -0.1588711, -1.79808, 1, 1, 1, 1, 1,
-0.1346647, 0.3923697, 1.331316, 1, 1, 1, 1, 1,
-0.1331161, 1.265164, 0.5510784, 1, 1, 1, 1, 1,
-0.132906, -0.4362135, -3.303528, 1, 1, 1, 1, 1,
-0.1299938, -0.1318992, -2.436016, 1, 1, 1, 1, 1,
-0.1279463, 0.0116606, -3.428874, 1, 1, 1, 1, 1,
-0.1242148, 0.8033136, -0.603559, 1, 1, 1, 1, 1,
-0.1206878, -0.5687559, -2.155191, 1, 1, 1, 1, 1,
-0.1152555, -0.5413144, -0.9210103, 1, 1, 1, 1, 1,
-0.1150755, 0.007211233, -1.061832, 1, 1, 1, 1, 1,
-0.1117149, -0.6589643, -4.407396, 1, 1, 1, 1, 1,
-0.109584, 0.4873632, 0.663277, 1, 1, 1, 1, 1,
-0.107059, 0.3758914, 0.8681912, 1, 1, 1, 1, 1,
-0.1021644, -0.1537652, -2.736459, 0, 0, 1, 1, 1,
-0.1013558, -0.09021185, -3.214632, 1, 0, 0, 1, 1,
-0.09904789, 1.19237, -0.5351723, 1, 0, 0, 1, 1,
-0.09872524, -0.02369392, -1.457903, 1, 0, 0, 1, 1,
-0.09104753, 0.5851846, -0.9410473, 1, 0, 0, 1, 1,
-0.0884596, 0.6795886, 1.265235, 1, 0, 0, 1, 1,
-0.08699864, -1.330871, -2.593065, 0, 0, 0, 1, 1,
-0.08576636, 1.428189, 0.1697363, 0, 0, 0, 1, 1,
-0.08258517, 0.02297289, -1.66849, 0, 0, 0, 1, 1,
-0.08065773, -0.4991383, -3.430177, 0, 0, 0, 1, 1,
-0.07704248, 0.4137689, -0.1584257, 0, 0, 0, 1, 1,
-0.07469235, -0.4185567, -3.755369, 0, 0, 0, 1, 1,
-0.07124564, 0.6915356, -0.3287424, 0, 0, 0, 1, 1,
-0.06486226, 0.2989547, -1.383851, 1, 1, 1, 1, 1,
-0.06304256, 0.3571325, 0.1491942, 1, 1, 1, 1, 1,
-0.06271852, 0.4160246, 0.5570691, 1, 1, 1, 1, 1,
-0.06266849, 1.458308, -0.1164415, 1, 1, 1, 1, 1,
-0.06204091, -1.779358, -3.963382, 1, 1, 1, 1, 1,
-0.06081, 0.6722133, -0.007163868, 1, 1, 1, 1, 1,
-0.060131, 1.105472, -0.1084978, 1, 1, 1, 1, 1,
-0.05861203, 0.9650163, -2.38803, 1, 1, 1, 1, 1,
-0.05128445, -0.807561, -2.613519, 1, 1, 1, 1, 1,
-0.04811843, 0.5827272, 0.5106435, 1, 1, 1, 1, 1,
-0.04755488, 0.3575198, -0.6490424, 1, 1, 1, 1, 1,
-0.04685412, -2.390346, -2.652088, 1, 1, 1, 1, 1,
-0.04523828, -0.9011258, -0.0970849, 1, 1, 1, 1, 1,
-0.04406346, -0.007123146, -0.1085244, 1, 1, 1, 1, 1,
-0.03993172, 0.9084016, -0.5766101, 1, 1, 1, 1, 1,
-0.03959986, -0.3489054, -1.140471, 0, 0, 1, 1, 1,
-0.03288095, 1.133332, -1.491377, 1, 0, 0, 1, 1,
-0.03080542, -0.6194334, -1.712901, 1, 0, 0, 1, 1,
-0.0281117, -0.005015781, -1.852401, 1, 0, 0, 1, 1,
-0.02696883, 0.06955129, 0.15965, 1, 0, 0, 1, 1,
-0.02643529, 0.4953264, -0.02578528, 1, 0, 0, 1, 1,
-0.02620103, 1.330152, 1.020041, 0, 0, 0, 1, 1,
-0.02613297, 1.34997, -0.5753502, 0, 0, 0, 1, 1,
-0.02356985, 1.056767, 0.01452769, 0, 0, 0, 1, 1,
-0.01861192, -0.405405, -3.486119, 0, 0, 0, 1, 1,
-0.01767742, 1.733199, -0.7640893, 0, 0, 0, 1, 1,
-0.0165843, 0.5418551, -0.241178, 0, 0, 0, 1, 1,
-0.016553, -0.1781167, -0.6957324, 0, 0, 0, 1, 1,
-0.00912015, 0.4051776, 1.233109, 1, 1, 1, 1, 1,
-0.003276705, 0.5313247, 0.5432479, 1, 1, 1, 1, 1,
-0.003013964, -0.143261, -3.768072, 1, 1, 1, 1, 1,
-0.00177885, -1.008421, -3.375358, 1, 1, 1, 1, 1,
-0.00154249, -1.246765, -2.81133, 1, 1, 1, 1, 1,
0.004333648, -0.5940678, 2.91888, 1, 1, 1, 1, 1,
0.00946191, 1.027304, -0.7036511, 1, 1, 1, 1, 1,
0.01105578, -0.2364438, 4.034603, 1, 1, 1, 1, 1,
0.01113169, 0.9436213, 0.1578185, 1, 1, 1, 1, 1,
0.01420393, -0.9173818, 3.952912, 1, 1, 1, 1, 1,
0.01794502, -0.8026779, 3.312714, 1, 1, 1, 1, 1,
0.02011112, 0.2262192, 0.06557073, 1, 1, 1, 1, 1,
0.0307048, 0.7606918, 0.7555886, 1, 1, 1, 1, 1,
0.03603994, -0.5403543, 3.273918, 1, 1, 1, 1, 1,
0.03631743, 0.3503581, 2.00644, 1, 1, 1, 1, 1,
0.03679096, -0.1384191, 2.399094, 0, 0, 1, 1, 1,
0.03725304, -0.255959, 3.49564, 1, 0, 0, 1, 1,
0.04259159, -1.924258, 3.125313, 1, 0, 0, 1, 1,
0.05452031, 0.8966689, -0.7730275, 1, 0, 0, 1, 1,
0.0594223, -0.3116692, 4.028393, 1, 0, 0, 1, 1,
0.05989516, -1.19099, 3.36614, 1, 0, 0, 1, 1,
0.06128399, -0.7351848, 4.468514, 0, 0, 0, 1, 1,
0.06344283, 0.4905856, 0.5245716, 0, 0, 0, 1, 1,
0.06488881, -2.364653, 1.647231, 0, 0, 0, 1, 1,
0.0672771, 2.197932, 0.9886177, 0, 0, 0, 1, 1,
0.06874587, -0.1742923, 1.249051, 0, 0, 0, 1, 1,
0.07256567, 0.298383, 0.4288072, 0, 0, 0, 1, 1,
0.07360087, 0.3181897, 0.8954435, 0, 0, 0, 1, 1,
0.07691193, -0.1072259, 3.059299, 1, 1, 1, 1, 1,
0.07917795, -0.5948972, 2.845705, 1, 1, 1, 1, 1,
0.07951064, -0.03052582, 1.284686, 1, 1, 1, 1, 1,
0.08141597, -0.8188365, 3.456967, 1, 1, 1, 1, 1,
0.08648808, -0.3739335, 1.847893, 1, 1, 1, 1, 1,
0.08975605, -0.2919643, 1.07875, 1, 1, 1, 1, 1,
0.09078928, -1.638804, 4.090422, 1, 1, 1, 1, 1,
0.09318716, -0.7054955, 3.723769, 1, 1, 1, 1, 1,
0.09552065, -0.07390585, 3.532473, 1, 1, 1, 1, 1,
0.09559983, 0.5008947, 1.931169, 1, 1, 1, 1, 1,
0.1021332, 1.327393, 0.4048398, 1, 1, 1, 1, 1,
0.1051458, -0.3016912, 2.611738, 1, 1, 1, 1, 1,
0.1073216, 1.385634, 0.5683473, 1, 1, 1, 1, 1,
0.1081705, -0.7260076, 2.984787, 1, 1, 1, 1, 1,
0.109342, -2.327597, 2.001228, 1, 1, 1, 1, 1,
0.1141499, -0.2903079, 2.054135, 0, 0, 1, 1, 1,
0.1261931, 0.8265818, -0.7887397, 1, 0, 0, 1, 1,
0.1278135, 0.2155787, -0.450878, 1, 0, 0, 1, 1,
0.1316438, -0.7822545, 4.122805, 1, 0, 0, 1, 1,
0.1447189, 1.839667, -1.605519, 1, 0, 0, 1, 1,
0.1493363, 0.3438783, -0.3355353, 1, 0, 0, 1, 1,
0.1516756, -1.525509, 1.49469, 0, 0, 0, 1, 1,
0.1520065, 1.349396, -0.6911696, 0, 0, 0, 1, 1,
0.1558545, -1.209125, 1.282698, 0, 0, 0, 1, 1,
0.1681138, -0.2547156, 3.81003, 0, 0, 0, 1, 1,
0.1703891, -0.45743, 1.014733, 0, 0, 0, 1, 1,
0.1704431, 0.4168436, 1.665634, 0, 0, 0, 1, 1,
0.1744958, -0.7378062, 1.886771, 0, 0, 0, 1, 1,
0.1745926, 1.502139, -0.0709111, 1, 1, 1, 1, 1,
0.1753712, -0.1189628, 1.405102, 1, 1, 1, 1, 1,
0.1823217, -0.4141823, 1.780731, 1, 1, 1, 1, 1,
0.1839173, 0.1953944, 1.213149, 1, 1, 1, 1, 1,
0.1867767, 0.1243738, -0.223063, 1, 1, 1, 1, 1,
0.1888581, -1.282333, 2.796568, 1, 1, 1, 1, 1,
0.1892943, -1.588072, 1.91964, 1, 1, 1, 1, 1,
0.193308, -0.26615, 3.139498, 1, 1, 1, 1, 1,
0.1943761, 0.2677599, 0.2050364, 1, 1, 1, 1, 1,
0.1988423, 0.805782, 1.491441, 1, 1, 1, 1, 1,
0.204506, -0.314384, 1.958282, 1, 1, 1, 1, 1,
0.2071049, -0.6081421, 2.143892, 1, 1, 1, 1, 1,
0.2075702, 1.288774, 0.2574007, 1, 1, 1, 1, 1,
0.2094106, 1.214089, 1.508913, 1, 1, 1, 1, 1,
0.2105487, -0.9983685, 2.448049, 1, 1, 1, 1, 1,
0.2122596, 0.7754703, 0.3639919, 0, 0, 1, 1, 1,
0.2129288, 0.5225077, 0.3300472, 1, 0, 0, 1, 1,
0.217651, -0.6808343, 3.761469, 1, 0, 0, 1, 1,
0.2206002, -0.2462341, 4.476596, 1, 0, 0, 1, 1,
0.223708, 0.002856092, 1.029855, 1, 0, 0, 1, 1,
0.225628, 0.2528838, 1.832992, 1, 0, 0, 1, 1,
0.2256642, -0.411981, 1.705977, 0, 0, 0, 1, 1,
0.2312302, -0.09527258, 1.888311, 0, 0, 0, 1, 1,
0.2340255, -0.5593408, 3.616683, 0, 0, 0, 1, 1,
0.2340443, -0.9329246, 3.818203, 0, 0, 0, 1, 1,
0.2403603, -0.977023, 3.844196, 0, 0, 0, 1, 1,
0.2501508, -0.5686035, 2.551, 0, 0, 0, 1, 1,
0.2508683, -0.5024759, 3.542072, 0, 0, 0, 1, 1,
0.2525479, 0.5694077, 1.522086, 1, 1, 1, 1, 1,
0.259198, 1.211105, 0.2490468, 1, 1, 1, 1, 1,
0.2609016, 2.013059, 0.2277794, 1, 1, 1, 1, 1,
0.2631422, -0.3682672, 1.579889, 1, 1, 1, 1, 1,
0.2664112, -0.4271385, 2.275797, 1, 1, 1, 1, 1,
0.2675735, -0.2470648, 2.6811, 1, 1, 1, 1, 1,
0.2681834, -0.7962493, 3.229539, 1, 1, 1, 1, 1,
0.2715347, 0.4745711, 1.328028, 1, 1, 1, 1, 1,
0.2718695, 0.1554316, 1.084331, 1, 1, 1, 1, 1,
0.2770115, 0.3603202, 0.7460902, 1, 1, 1, 1, 1,
0.2818318, -0.9495441, 2.428798, 1, 1, 1, 1, 1,
0.2823671, 0.8411447, 0.9594654, 1, 1, 1, 1, 1,
0.2842565, 0.1886562, 0.06026712, 1, 1, 1, 1, 1,
0.287229, 0.1136303, 1.201973, 1, 1, 1, 1, 1,
0.2885394, -0.2990325, 1.962198, 1, 1, 1, 1, 1,
0.2949537, 0.9626069, 0.04722792, 0, 0, 1, 1, 1,
0.2965934, 0.2806174, 0.3888172, 1, 0, 0, 1, 1,
0.3006789, -0.07962689, 1.078795, 1, 0, 0, 1, 1,
0.3035261, -1.962482, 2.370584, 1, 0, 0, 1, 1,
0.3073453, 1.131245, -0.3568572, 1, 0, 0, 1, 1,
0.3078614, 1.658526, -0.3291854, 1, 0, 0, 1, 1,
0.3094416, 0.2067906, 0.7637222, 0, 0, 0, 1, 1,
0.3133845, -1.881904, 3.793077, 0, 0, 0, 1, 1,
0.3173443, 0.03399083, 1.539549, 0, 0, 0, 1, 1,
0.3192779, -0.2083967, 4.159248, 0, 0, 0, 1, 1,
0.3215307, 1.341733, 0.8890561, 0, 0, 0, 1, 1,
0.3238049, -1.183937, 2.028461, 0, 0, 0, 1, 1,
0.3277564, -2.302017, 2.91478, 0, 0, 0, 1, 1,
0.3297938, -2.16877, 3.574903, 1, 1, 1, 1, 1,
0.3335214, 0.1216526, 2.313519, 1, 1, 1, 1, 1,
0.3367667, 0.2236984, -0.5247507, 1, 1, 1, 1, 1,
0.337219, -0.3039071, 2.886681, 1, 1, 1, 1, 1,
0.3412304, 0.288746, -0.1328637, 1, 1, 1, 1, 1,
0.3413922, 0.7965022, -0.1554558, 1, 1, 1, 1, 1,
0.3421124, -0.4820997, 2.094995, 1, 1, 1, 1, 1,
0.3442789, 1.142688, -1.971248, 1, 1, 1, 1, 1,
0.3494503, 0.7585158, 0.7230762, 1, 1, 1, 1, 1,
0.3497124, -1.91357, 1.273693, 1, 1, 1, 1, 1,
0.3525114, -0.6547078, 0.5370912, 1, 1, 1, 1, 1,
0.3541887, -0.5473123, 1.771397, 1, 1, 1, 1, 1,
0.356087, 0.1972164, 1.309831, 1, 1, 1, 1, 1,
0.3560925, -2.186808, 3.473473, 1, 1, 1, 1, 1,
0.3567438, 1.049581, -2.246964, 1, 1, 1, 1, 1,
0.3569224, 0.6355448, 0.5660246, 0, 0, 1, 1, 1,
0.3590256, 0.590276, 0.2530276, 1, 0, 0, 1, 1,
0.3595168, -1.750682, 4.284893, 1, 0, 0, 1, 1,
0.360582, -0.007666335, 1.776041, 1, 0, 0, 1, 1,
0.3667141, -0.3762248, 3.00498, 1, 0, 0, 1, 1,
0.370209, -1.445333, 4.343926, 1, 0, 0, 1, 1,
0.3752081, -1.298111, 5.193798, 0, 0, 0, 1, 1,
0.379087, 0.2303012, 3.748123, 0, 0, 0, 1, 1,
0.3888491, 0.5559815, -0.07193515, 0, 0, 0, 1, 1,
0.3901949, 0.1805644, 0.3784148, 0, 0, 0, 1, 1,
0.3913946, -0.8771847, 3.343817, 0, 0, 0, 1, 1,
0.3928949, -1.077846, 2.2219, 0, 0, 0, 1, 1,
0.3953214, 0.1667518, 1.32421, 0, 0, 0, 1, 1,
0.3961056, -0.5961783, 1.381642, 1, 1, 1, 1, 1,
0.3990494, 1.147228, 0.5653882, 1, 1, 1, 1, 1,
0.3998573, -0.7688755, 3.374825, 1, 1, 1, 1, 1,
0.4037573, 0.5711045, -0.214248, 1, 1, 1, 1, 1,
0.4038041, -0.8779601, 2.852352, 1, 1, 1, 1, 1,
0.4100119, 1.197226, 0.161184, 1, 1, 1, 1, 1,
0.4106175, 0.4292113, 1.4195, 1, 1, 1, 1, 1,
0.415021, 1.275846, -0.9897593, 1, 1, 1, 1, 1,
0.4160296, -0.3256406, 2.180802, 1, 1, 1, 1, 1,
0.4173436, 1.230911, -0.8349278, 1, 1, 1, 1, 1,
0.4207556, -1.833677, 3.045446, 1, 1, 1, 1, 1,
0.4224803, 1.352522, 0.4161673, 1, 1, 1, 1, 1,
0.4243888, 1.175666, 2.556295, 1, 1, 1, 1, 1,
0.4264279, -0.1505261, 2.279009, 1, 1, 1, 1, 1,
0.4351845, 2.18981, 3.153849, 1, 1, 1, 1, 1,
0.4356067, -0.05601647, 1.859822, 0, 0, 1, 1, 1,
0.4414151, -1.319202, 3.419793, 1, 0, 0, 1, 1,
0.4427618, 1.448093, 0.6626324, 1, 0, 0, 1, 1,
0.4432176, 1.253526, 1.959057, 1, 0, 0, 1, 1,
0.4480568, 0.6073779, 1.068874, 1, 0, 0, 1, 1,
0.4503371, 2.422046, 0.3291423, 1, 0, 0, 1, 1,
0.4508668, -0.130952, 2.368815, 0, 0, 0, 1, 1,
0.4547469, 1.715341, 0.521177, 0, 0, 0, 1, 1,
0.4552492, 1.391061, -0.2025412, 0, 0, 0, 1, 1,
0.4577394, 0.1252432, 0.2983935, 0, 0, 0, 1, 1,
0.4620696, -0.2464616, 0.8456272, 0, 0, 0, 1, 1,
0.4637852, 0.5068032, 0.8573728, 0, 0, 0, 1, 1,
0.4640496, 1.055206, -0.3275708, 0, 0, 0, 1, 1,
0.4648151, 0.02470412, 1.713608, 1, 1, 1, 1, 1,
0.4663268, -0.9507399, 2.84395, 1, 1, 1, 1, 1,
0.4749103, -0.4602726, 3.467538, 1, 1, 1, 1, 1,
0.4764791, -1.991778, 1.597703, 1, 1, 1, 1, 1,
0.4780208, -1.089158, 1.22894, 1, 1, 1, 1, 1,
0.4781856, 0.6154886, 0.7617432, 1, 1, 1, 1, 1,
0.4802207, 0.2223399, 1.703987, 1, 1, 1, 1, 1,
0.4837635, -0.2921644, 3.292897, 1, 1, 1, 1, 1,
0.4841927, 0.9289435, 1.312358, 1, 1, 1, 1, 1,
0.4910386, 0.208692, 2.363888, 1, 1, 1, 1, 1,
0.4926622, 0.2294257, 0.6970291, 1, 1, 1, 1, 1,
0.4926869, -1.670622, 2.511159, 1, 1, 1, 1, 1,
0.4981673, 0.07499863, 2.122934, 1, 1, 1, 1, 1,
0.4982618, -0.2878184, 1.856579, 1, 1, 1, 1, 1,
0.4998587, -0.6117579, 1.816943, 1, 1, 1, 1, 1,
0.5019239, -1.890005, 1.88613, 0, 0, 1, 1, 1,
0.504196, -1.351292, 2.689233, 1, 0, 0, 1, 1,
0.5056902, 0.6137885, 1.950632, 1, 0, 0, 1, 1,
0.5138389, -1.164854, 1.915866, 1, 0, 0, 1, 1,
0.5141116, 2.218447, -0.08694226, 1, 0, 0, 1, 1,
0.516831, 1.526519, 0.3860131, 1, 0, 0, 1, 1,
0.519407, 0.6210257, 0.9009272, 0, 0, 0, 1, 1,
0.522388, 1.05102, 0.280304, 0, 0, 0, 1, 1,
0.5224584, -2.490184, 2.072153, 0, 0, 0, 1, 1,
0.5265694, -0.2793646, 0.5333441, 0, 0, 0, 1, 1,
0.5266632, 1.817522, 2.356137, 0, 0, 0, 1, 1,
0.5267239, -1.344498, 0.5776187, 0, 0, 0, 1, 1,
0.5358879, 0.2844492, 2.869975, 0, 0, 0, 1, 1,
0.5493993, -0.3153676, 2.250782, 1, 1, 1, 1, 1,
0.5554771, -0.01074943, 1.714329, 1, 1, 1, 1, 1,
0.5611802, 1.454547, 2.077294, 1, 1, 1, 1, 1,
0.562052, 0.4140308, -0.7830954, 1, 1, 1, 1, 1,
0.5656137, 2.11381, 1.085195, 1, 1, 1, 1, 1,
0.5664853, -0.7003207, 3.136208, 1, 1, 1, 1, 1,
0.5819507, 0.05319093, 1.780532, 1, 1, 1, 1, 1,
0.5842469, 0.3084896, 1.098843, 1, 1, 1, 1, 1,
0.5850318, 1.277381, 0.3817827, 1, 1, 1, 1, 1,
0.5871713, 1.78303, -0.8357353, 1, 1, 1, 1, 1,
0.5900038, 0.9905452, 1.019025, 1, 1, 1, 1, 1,
0.604652, -0.4508946, 2.209267, 1, 1, 1, 1, 1,
0.6060099, -0.02645566, 1.547532, 1, 1, 1, 1, 1,
0.6100381, -1.061004, 2.489128, 1, 1, 1, 1, 1,
0.6121076, 0.2936624, 0.9270339, 1, 1, 1, 1, 1,
0.6187804, -1.620417, 1.684153, 0, 0, 1, 1, 1,
0.6257597, 0.6276121, 1.931664, 1, 0, 0, 1, 1,
0.6277813, -1.510959, 1.822376, 1, 0, 0, 1, 1,
0.6291298, -0.1951628, 1.061361, 1, 0, 0, 1, 1,
0.6352747, 0.8347753, 1.570233, 1, 0, 0, 1, 1,
0.6355643, -1.423939, 2.448018, 1, 0, 0, 1, 1,
0.6374589, 0.6531858, -0.752948, 0, 0, 0, 1, 1,
0.6389853, 0.6022113, -0.03453327, 0, 0, 0, 1, 1,
0.6406582, 1.133039, 2.218113, 0, 0, 0, 1, 1,
0.6422946, 1.305977, 2.008126, 0, 0, 0, 1, 1,
0.6489601, -1.739059, 1.300504, 0, 0, 0, 1, 1,
0.648991, 0.4372916, 1.769034, 0, 0, 0, 1, 1,
0.6500769, -0.7107363, 1.302575, 0, 0, 0, 1, 1,
0.6572549, -0.5783073, 2.31601, 1, 1, 1, 1, 1,
0.6605764, 0.6971675, 0.6439332, 1, 1, 1, 1, 1,
0.668692, 0.4345687, -0.398845, 1, 1, 1, 1, 1,
0.6691165, 0.1284996, 2.480803, 1, 1, 1, 1, 1,
0.673694, -1.415744, 2.262497, 1, 1, 1, 1, 1,
0.680202, 0.8914348, -0.3871857, 1, 1, 1, 1, 1,
0.6871617, 0.1612225, 2.121866, 1, 1, 1, 1, 1,
0.6888453, -1.48698, 1.163298, 1, 1, 1, 1, 1,
0.6898229, -0.4138882, 1.661958, 1, 1, 1, 1, 1,
0.7004283, -1.090203, 2.330741, 1, 1, 1, 1, 1,
0.7045119, -0.4596256, 2.016488, 1, 1, 1, 1, 1,
0.7054459, -0.6338148, 2.7749, 1, 1, 1, 1, 1,
0.7079526, -0.7613708, 1.20244, 1, 1, 1, 1, 1,
0.7139465, -2.226758, 3.550906, 1, 1, 1, 1, 1,
0.7194223, -1.637086, 2.508659, 1, 1, 1, 1, 1,
0.7212509, 2.001649, -0.3334413, 0, 0, 1, 1, 1,
0.724488, 1.093623, -0.4392079, 1, 0, 0, 1, 1,
0.7262161, -0.09880903, 0.8527783, 1, 0, 0, 1, 1,
0.7283586, 0.4264727, 0.9218386, 1, 0, 0, 1, 1,
0.7299697, -0.7084208, 3.290305, 1, 0, 0, 1, 1,
0.7336726, 1.012967, 0.7606626, 1, 0, 0, 1, 1,
0.7347, 0.2575616, 0.9357197, 0, 0, 0, 1, 1,
0.7373041, -1.24606, 1.894305, 0, 0, 0, 1, 1,
0.7421072, -0.8650286, 2.203949, 0, 0, 0, 1, 1,
0.74641, -1.322542, 2.531135, 0, 0, 0, 1, 1,
0.7473463, 0.5241777, 0.4938624, 0, 0, 0, 1, 1,
0.7485479, -0.0662876, 0.8708028, 0, 0, 0, 1, 1,
0.7517894, 0.7659541, -0.4367191, 0, 0, 0, 1, 1,
0.7546399, 0.4118905, 0.6215062, 1, 1, 1, 1, 1,
0.7574964, 0.700321, 0.2803027, 1, 1, 1, 1, 1,
0.7707248, 0.1937235, 1.257661, 1, 1, 1, 1, 1,
0.7714017, 0.5489192, 0.423198, 1, 1, 1, 1, 1,
0.7736413, 0.6482729, -1.149222, 1, 1, 1, 1, 1,
0.7779436, 0.1237815, 2.796875, 1, 1, 1, 1, 1,
0.7804807, 0.9510031, 1.303794, 1, 1, 1, 1, 1,
0.7864531, 1.499833, 0.1313012, 1, 1, 1, 1, 1,
0.786707, 0.9341551, -1.418788, 1, 1, 1, 1, 1,
0.7924351, 1.277249, 1.117344, 1, 1, 1, 1, 1,
0.7984324, -0.3961523, 1.466998, 1, 1, 1, 1, 1,
0.8111123, -1.740386, 3.841421, 1, 1, 1, 1, 1,
0.814279, -0.9667436, 1.74543, 1, 1, 1, 1, 1,
0.8174703, -0.3817931, 0.7118575, 1, 1, 1, 1, 1,
0.8179756, -0.7091221, 0.9928336, 1, 1, 1, 1, 1,
0.8188241, -0.3748634, 3.389834, 0, 0, 1, 1, 1,
0.8199117, -0.245252, 0.2792229, 1, 0, 0, 1, 1,
0.8282434, -1.234835, 3.830944, 1, 0, 0, 1, 1,
0.8333575, 0.08140132, 1.321949, 1, 0, 0, 1, 1,
0.8379712, -0.8224694, 1.753771, 1, 0, 0, 1, 1,
0.8385267, 1.090215, 0.8092827, 1, 0, 0, 1, 1,
0.8465198, -0.2345784, 2.359465, 0, 0, 0, 1, 1,
0.8535132, 0.39195, 2.238477, 0, 0, 0, 1, 1,
0.8573319, -0.8200347, 2.551265, 0, 0, 0, 1, 1,
0.8629795, 2.08923, 0.4744354, 0, 0, 0, 1, 1,
0.8639882, -1.039056, 2.399938, 0, 0, 0, 1, 1,
0.8653491, 1.675739, 0.8645423, 0, 0, 0, 1, 1,
0.8654793, 1.574508, -0.6946058, 0, 0, 0, 1, 1,
0.8681185, 0.06190689, 3.484504, 1, 1, 1, 1, 1,
0.8757662, -0.2614034, 1.812952, 1, 1, 1, 1, 1,
0.8787779, 0.306955, 1.114363, 1, 1, 1, 1, 1,
0.8790935, -0.5416392, 2.154148, 1, 1, 1, 1, 1,
0.8841413, 0.7271692, 1.415848, 1, 1, 1, 1, 1,
0.8872237, 1.152481, 2.537376, 1, 1, 1, 1, 1,
0.8890963, -0.5003449, 1.607505, 1, 1, 1, 1, 1,
0.8954934, 1.25543, 0.5588976, 1, 1, 1, 1, 1,
0.9044998, -0.8558162, 3.278821, 1, 1, 1, 1, 1,
0.9045158, 0.2796368, 1.107896, 1, 1, 1, 1, 1,
0.9085883, -1.54692, 3.290311, 1, 1, 1, 1, 1,
0.9094483, 1.129154, 1.048893, 1, 1, 1, 1, 1,
0.911629, 0.6963075, 0.5674837, 1, 1, 1, 1, 1,
0.9219019, 0.1354156, 1.324289, 1, 1, 1, 1, 1,
0.9233662, 0.5910915, -0.7785951, 1, 1, 1, 1, 1,
0.9239531, 1.023213, -0.5180463, 0, 0, 1, 1, 1,
0.9280387, -1.223677, 3.362339, 1, 0, 0, 1, 1,
0.9307951, -0.08053766, 2.226515, 1, 0, 0, 1, 1,
0.9332871, 0.4130252, 1.661536, 1, 0, 0, 1, 1,
0.9408871, 1.629883, 0.9369938, 1, 0, 0, 1, 1,
0.948989, -0.7879156, 0.6143184, 1, 0, 0, 1, 1,
0.9597482, -0.1891086, 1.421316, 0, 0, 0, 1, 1,
0.9626499, -0.3363264, 1.660663, 0, 0, 0, 1, 1,
0.9634672, 0.7427382, 0.7608333, 0, 0, 0, 1, 1,
0.9687999, 0.9088119, 1.330266, 0, 0, 0, 1, 1,
0.9697813, -1.276094, 2.476058, 0, 0, 0, 1, 1,
0.9724753, 1.447509, 0.5189466, 0, 0, 0, 1, 1,
0.9748887, 0.1704711, 2.723327, 0, 0, 0, 1, 1,
0.9762697, 1.111026, -1.096016, 1, 1, 1, 1, 1,
0.9778957, -1.049935, 2.155048, 1, 1, 1, 1, 1,
0.9902083, 0.00230864, 1.515378, 1, 1, 1, 1, 1,
0.9944912, 0.7046847, 1.194612, 1, 1, 1, 1, 1,
0.9948977, 0.5998151, -1.624544, 1, 1, 1, 1, 1,
1.007284, -0.1653385, 2.272388, 1, 1, 1, 1, 1,
1.01192, -0.3047791, 1.877118, 1, 1, 1, 1, 1,
1.038862, 0.8812177, -0.5931062, 1, 1, 1, 1, 1,
1.040461, -0.3928545, 2.282764, 1, 1, 1, 1, 1,
1.04159, 0.7800963, 1.273209, 1, 1, 1, 1, 1,
1.045311, 0.573278, -0.3061832, 1, 1, 1, 1, 1,
1.049697, 0.9084156, 1.352167, 1, 1, 1, 1, 1,
1.051527, -1.056614, 2.403393, 1, 1, 1, 1, 1,
1.05162, -0.7876722, 3.424893, 1, 1, 1, 1, 1,
1.057655, 1.179357, 0.453195, 1, 1, 1, 1, 1,
1.063531, 0.05227331, 0.4954807, 0, 0, 1, 1, 1,
1.066418, -0.327207, 2.843816, 1, 0, 0, 1, 1,
1.084296, 0.1865676, 1.681391, 1, 0, 0, 1, 1,
1.084679, 0.5280737, 1.991972, 1, 0, 0, 1, 1,
1.087125, 0.2249344, 1.843071, 1, 0, 0, 1, 1,
1.094347, 0.3764285, 2.32724, 1, 0, 0, 1, 1,
1.094755, -0.2841275, 1.04985, 0, 0, 0, 1, 1,
1.102015, -0.1235381, 1.862198, 0, 0, 0, 1, 1,
1.106503, 0.5364336, 0.1710925, 0, 0, 0, 1, 1,
1.108442, 0.5853761, 1.814429, 0, 0, 0, 1, 1,
1.111898, 0.4858871, 1.832323, 0, 0, 0, 1, 1,
1.11389, 1.96806, 1.044413, 0, 0, 0, 1, 1,
1.114033, 0.3807272, -0.203475, 0, 0, 0, 1, 1,
1.123262, 2.021803, 0.6973646, 1, 1, 1, 1, 1,
1.12702, 0.5661857, 0.4560219, 1, 1, 1, 1, 1,
1.131027, -0.4346689, 2.209442, 1, 1, 1, 1, 1,
1.132714, 1.236026, 0.9764138, 1, 1, 1, 1, 1,
1.13349, 1.121023, 0.8611636, 1, 1, 1, 1, 1,
1.134199, -0.9099216, 1.023907, 1, 1, 1, 1, 1,
1.134374, -1.055944, 2.832997, 1, 1, 1, 1, 1,
1.137225, 1.288175, 2.138009, 1, 1, 1, 1, 1,
1.160045, -1.524051, 2.562162, 1, 1, 1, 1, 1,
1.160805, 0.2980996, -0.4872661, 1, 1, 1, 1, 1,
1.164719, -1.505117, 2.57975, 1, 1, 1, 1, 1,
1.16864, -0.7204363, 2.396446, 1, 1, 1, 1, 1,
1.170612, 0.1488815, 2.411692, 1, 1, 1, 1, 1,
1.174425, -0.8663044, 1.419326, 1, 1, 1, 1, 1,
1.185109, -0.4339276, 2.427408, 1, 1, 1, 1, 1,
1.187227, -0.712693, 3.673324, 0, 0, 1, 1, 1,
1.193018, 1.562201, 2.846845, 1, 0, 0, 1, 1,
1.194416, -0.8767699, 1.57204, 1, 0, 0, 1, 1,
1.195197, 2.310004, 0.2854494, 1, 0, 0, 1, 1,
1.195808, -1.503992, 1.573238, 1, 0, 0, 1, 1,
1.209127, 0.8407508, 1.093299, 1, 0, 0, 1, 1,
1.215758, 1.110296, 2.287408, 0, 0, 0, 1, 1,
1.225493, -1.295353, 4.47291, 0, 0, 0, 1, 1,
1.232911, 0.4930041, 0.2945504, 0, 0, 0, 1, 1,
1.233514, 0.09455287, 0.8942311, 0, 0, 0, 1, 1,
1.233976, -0.6559859, 2.357211, 0, 0, 0, 1, 1,
1.235084, 1.028658, 0.4032492, 0, 0, 0, 1, 1,
1.235388, -1.812239, 2.405045, 0, 0, 0, 1, 1,
1.236351, 1.214915, -1.929328, 1, 1, 1, 1, 1,
1.237596, -0.5100646, 1.882132, 1, 1, 1, 1, 1,
1.246609, -0.1164584, 1.244136, 1, 1, 1, 1, 1,
1.267491, 2.143633, -0.4615524, 1, 1, 1, 1, 1,
1.269013, -1.213445, 2.056378, 1, 1, 1, 1, 1,
1.269327, 0.1117595, 0.4798378, 1, 1, 1, 1, 1,
1.270858, 1.418367, 2.524053, 1, 1, 1, 1, 1,
1.273142, 0.7912254, 1.228404, 1, 1, 1, 1, 1,
1.275884, -0.1389109, 3.517701, 1, 1, 1, 1, 1,
1.286102, -0.4957616, 1.201462, 1, 1, 1, 1, 1,
1.288854, -0.554435, 2.086521, 1, 1, 1, 1, 1,
1.29878, -0.4696522, 1.868782, 1, 1, 1, 1, 1,
1.29985, 1.220201, -0.4335606, 1, 1, 1, 1, 1,
1.300889, -0.07744933, 3.052698, 1, 1, 1, 1, 1,
1.309652, 1.102891, 1.496045, 1, 1, 1, 1, 1,
1.315301, -1.097919, 2.611038, 0, 0, 1, 1, 1,
1.340771, 0.66652, 1.211219, 1, 0, 0, 1, 1,
1.349668, -1.087392, 2.153386, 1, 0, 0, 1, 1,
1.353331, 1.400769, 2.458706, 1, 0, 0, 1, 1,
1.362534, -0.8722831, 2.928907, 1, 0, 0, 1, 1,
1.362991, -1.205964, 2.924806, 1, 0, 0, 1, 1,
1.364055, -0.3790637, 1.940333, 0, 0, 0, 1, 1,
1.367178, -0.01190901, 2.126022, 0, 0, 0, 1, 1,
1.373809, -0.1235972, 0.9696137, 0, 0, 0, 1, 1,
1.376121, 1.872254, 1.378181, 0, 0, 0, 1, 1,
1.389929, 1.585273, 0.2989909, 0, 0, 0, 1, 1,
1.392662, 1.14368, 1.90337, 0, 0, 0, 1, 1,
1.407229, -0.3704419, 1.136974, 0, 0, 0, 1, 1,
1.411542, 0.2982364, 1.113918, 1, 1, 1, 1, 1,
1.421032, -0.3350604, 1.511399, 1, 1, 1, 1, 1,
1.421093, 0.6639733, 0.1809399, 1, 1, 1, 1, 1,
1.423033, -0.372315, 2.195552, 1, 1, 1, 1, 1,
1.424512, -0.5224438, 3.129137, 1, 1, 1, 1, 1,
1.42578, -1.105026, 1.345763, 1, 1, 1, 1, 1,
1.428764, -1.853819, 3.249616, 1, 1, 1, 1, 1,
1.431249, -0.8360054, 1.986345, 1, 1, 1, 1, 1,
1.432252, -1.556264, 2.120867, 1, 1, 1, 1, 1,
1.439854, 0.6382048, -0.2927259, 1, 1, 1, 1, 1,
1.443668, 0.4442997, 1.298048, 1, 1, 1, 1, 1,
1.446495, -0.9726204, 3.076966, 1, 1, 1, 1, 1,
1.461284, -0.7538453, 2.967934, 1, 1, 1, 1, 1,
1.462623, 1.158562, 0.3220276, 1, 1, 1, 1, 1,
1.478623, 1.966494, 0.8981128, 1, 1, 1, 1, 1,
1.479441, 1.369518, 0.3942511, 0, 0, 1, 1, 1,
1.479858, -0.4471739, 3.147637, 1, 0, 0, 1, 1,
1.494935, 1.875158, 0.383727, 1, 0, 0, 1, 1,
1.502155, -1.167936, 3.054801, 1, 0, 0, 1, 1,
1.506671, 0.2046773, 0.9764926, 1, 0, 0, 1, 1,
1.509952, -0.5998042, 0.3009546, 1, 0, 0, 1, 1,
1.511164, -0.1581531, 1.416433, 0, 0, 0, 1, 1,
1.516348, -0.2342539, 0.01907673, 0, 0, 0, 1, 1,
1.521361, -2.698776, 1.656112, 0, 0, 0, 1, 1,
1.54204, -0.1500122, 1.981966, 0, 0, 0, 1, 1,
1.543746, -0.4620816, 1.216642, 0, 0, 0, 1, 1,
1.554608, -0.2737469, 3.04003, 0, 0, 0, 1, 1,
1.558927, -1.369729, 3.001514, 0, 0, 0, 1, 1,
1.562585, -0.5382718, 2.682885, 1, 1, 1, 1, 1,
1.56872, 0.6191, 0.4172051, 1, 1, 1, 1, 1,
1.582454, -0.5098666, 2.131891, 1, 1, 1, 1, 1,
1.592854, 1.141116, 1.593822, 1, 1, 1, 1, 1,
1.600638, -1.182968, 0.8833818, 1, 1, 1, 1, 1,
1.617517, -1.069344, 3.060103, 1, 1, 1, 1, 1,
1.641145, 0.007351612, 0.5825064, 1, 1, 1, 1, 1,
1.646892, -1.75715, 1.729063, 1, 1, 1, 1, 1,
1.649183, 1.751266, 0.2430151, 1, 1, 1, 1, 1,
1.654865, -0.6831449, 1.730863, 1, 1, 1, 1, 1,
1.656019, -0.9420823, 2.102644, 1, 1, 1, 1, 1,
1.677982, -0.04495803, 0.6371432, 1, 1, 1, 1, 1,
1.681083, 0.3991049, 2.058543, 1, 1, 1, 1, 1,
1.682378, 1.068399, 2.919762, 1, 1, 1, 1, 1,
1.692908, 0.5184047, 1.751984, 1, 1, 1, 1, 1,
1.693367, -0.7854614, 3.285941, 0, 0, 1, 1, 1,
1.699728, 1.216196, 0.07449075, 1, 0, 0, 1, 1,
1.702707, -0.666584, 0.6970108, 1, 0, 0, 1, 1,
1.729753, 1.360163, -0.5301133, 1, 0, 0, 1, 1,
1.745033, 0.3441011, 1.90679, 1, 0, 0, 1, 1,
1.754566, 0.2314111, 1.249417, 1, 0, 0, 1, 1,
1.75556, -2.104462, 1.577357, 0, 0, 0, 1, 1,
1.807289, 1.85408, 1.113217, 0, 0, 0, 1, 1,
1.811208, 0.01066325, 0.3156466, 0, 0, 0, 1, 1,
1.812813, -1.064748, 1.90093, 0, 0, 0, 1, 1,
1.834074, -0.02957843, 0.6640102, 0, 0, 0, 1, 1,
1.850476, 0.9602122, 0.3395338, 0, 0, 0, 1, 1,
1.850924, -1.235979, 3.50681, 0, 0, 0, 1, 1,
1.866846, 1.095459, 0.4962076, 1, 1, 1, 1, 1,
1.880803, -1.507332, 2.960004, 1, 1, 1, 1, 1,
1.897746, 3.472018, -0.2458435, 1, 1, 1, 1, 1,
1.900919, -0.01285529, 0.8727351, 1, 1, 1, 1, 1,
1.908129, 0.8890185, 0.4119176, 1, 1, 1, 1, 1,
1.910534, 0.6661481, 1.084714, 1, 1, 1, 1, 1,
1.910627, 1.062955, 2.216551, 1, 1, 1, 1, 1,
1.918804, 1.602848, 1.140416, 1, 1, 1, 1, 1,
1.931823, 1.23497, 0.4905415, 1, 1, 1, 1, 1,
1.932388, 0.2953909, 1.267215, 1, 1, 1, 1, 1,
1.933508, 0.1968605, 1.093875, 1, 1, 1, 1, 1,
1.942417, 0.4639895, 0.9884828, 1, 1, 1, 1, 1,
1.991286, -1.542744, 2.623159, 1, 1, 1, 1, 1,
2.0165, 0.3017959, 0.6246951, 1, 1, 1, 1, 1,
2.020647, 0.1758389, 1.233943, 1, 1, 1, 1, 1,
2.050021, -0.52992, 4.10067, 0, 0, 1, 1, 1,
2.108806, 1.767093, 1.930642, 1, 0, 0, 1, 1,
2.116059, -0.0656344, 1.501952, 1, 0, 0, 1, 1,
2.135623, 0.08501899, 0.5164148, 1, 0, 0, 1, 1,
2.142083, -0.4962224, 3.383269, 1, 0, 0, 1, 1,
2.210339, -1.030472, 1.398376, 1, 0, 0, 1, 1,
2.214306, 1.322752, 0.3200769, 0, 0, 0, 1, 1,
2.257234, -0.7256828, 1.992688, 0, 0, 0, 1, 1,
2.300379, -0.001658623, 1.577393, 0, 0, 0, 1, 1,
2.303058, 0.8335889, -0.4999822, 0, 0, 0, 1, 1,
2.335227, 1.638757, 0.2586292, 0, 0, 0, 1, 1,
2.336264, -0.5037426, 1.901148, 0, 0, 0, 1, 1,
2.370358, -0.4019799, 4.396084, 0, 0, 0, 1, 1,
2.613439, 2.189201, 1.943518, 1, 1, 1, 1, 1,
2.775776, 0.8881719, -0.4414952, 1, 1, 1, 1, 1,
2.857187, 1.353043, -0.6407716, 1, 1, 1, 1, 1,
2.941033, 0.8079193, 2.841139, 1, 1, 1, 1, 1,
3.063485, 0.6671745, 1.421144, 1, 1, 1, 1, 1,
3.238507, -0.8940185, 3.415105, 1, 1, 1, 1, 1,
3.26169, -0.1198556, 3.110967, 1, 1, 1, 1, 1
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
var radius = 9.484608;
var distance = 33.31428;
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
mvMatrix.translate( -0.09530783, -0.3499831, 0.1303918 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31428);
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
