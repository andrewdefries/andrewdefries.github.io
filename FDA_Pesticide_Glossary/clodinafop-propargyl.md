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
-2.79441, -0.5823007, -1.425119, 1, 0, 0, 1,
-2.735457, 0.2050092, -1.21206, 1, 0.007843138, 0, 1,
-2.714563, 0.3041261, -2.016242, 1, 0.01176471, 0, 1,
-2.665137, 0.7589078, 1.348412, 1, 0.01960784, 0, 1,
-2.535213, -1.151294, -2.812836, 1, 0.02352941, 0, 1,
-2.512314, 0.7721468, -0.6575344, 1, 0.03137255, 0, 1,
-2.470532, -0.341498, -1.139205, 1, 0.03529412, 0, 1,
-2.403079, -0.9254037, -2.753989, 1, 0.04313726, 0, 1,
-2.402415, -0.6387555, -2.54368, 1, 0.04705882, 0, 1,
-2.384099, -0.1239672, -1.897836, 1, 0.05490196, 0, 1,
-2.364015, -0.5221178, -1.893681, 1, 0.05882353, 0, 1,
-2.315923, 0.08883466, -1.671717, 1, 0.06666667, 0, 1,
-2.298267, 0.1617621, -1.55409, 1, 0.07058824, 0, 1,
-2.297405, -1.482234, -2.763376, 1, 0.07843138, 0, 1,
-2.187619, -0.6668512, -1.604583, 1, 0.08235294, 0, 1,
-2.162659, -1.055315, -0.6954086, 1, 0.09019608, 0, 1,
-2.153877, 0.3020939, -1.91093, 1, 0.09411765, 0, 1,
-2.14547, 0.6800832, -0.05882124, 1, 0.1019608, 0, 1,
-2.143382, 0.4614322, -0.258646, 1, 0.1098039, 0, 1,
-2.113762, -2.032302, -4.145812, 1, 0.1137255, 0, 1,
-2.108935, -0.5688541, -3.36991, 1, 0.1215686, 0, 1,
-2.04922, -1.275585, -1.567328, 1, 0.1254902, 0, 1,
-2.032378, -0.1373487, -4.127935, 1, 0.1333333, 0, 1,
-2.025553, -1.035251, -1.671763, 1, 0.1372549, 0, 1,
-2.022408, -0.6450641, -1.084512, 1, 0.145098, 0, 1,
-2.020234, 1.350358, -0.2822444, 1, 0.1490196, 0, 1,
-1.992094, 1.420254, -1.847213, 1, 0.1568628, 0, 1,
-1.929757, 0.7707236, -1.243597, 1, 0.1607843, 0, 1,
-1.910112, -0.4283792, -2.536917, 1, 0.1686275, 0, 1,
-1.867479, 0.0252197, 0.5581447, 1, 0.172549, 0, 1,
-1.867401, 0.3619727, -2.592918, 1, 0.1803922, 0, 1,
-1.866971, -0.09227969, -1.537432, 1, 0.1843137, 0, 1,
-1.857605, 0.4148673, -0.9342006, 1, 0.1921569, 0, 1,
-1.851623, 0.7173083, -2.902049, 1, 0.1960784, 0, 1,
-1.838011, 0.1866925, -0.8244942, 1, 0.2039216, 0, 1,
-1.821734, -0.5499685, -0.6497158, 1, 0.2117647, 0, 1,
-1.821147, 2.171224, -1.230563, 1, 0.2156863, 0, 1,
-1.793512, -0.8405114, -2.45385, 1, 0.2235294, 0, 1,
-1.790279, 1.423686, -0.7206302, 1, 0.227451, 0, 1,
-1.780836, -0.8954234, -2.805005, 1, 0.2352941, 0, 1,
-1.777503, 0.5282325, -1.324635, 1, 0.2392157, 0, 1,
-1.770216, 0.2399176, -2.755497, 1, 0.2470588, 0, 1,
-1.765123, -1.02591, -1.937779, 1, 0.2509804, 0, 1,
-1.761319, -1.13333, -2.007061, 1, 0.2588235, 0, 1,
-1.751527, 1.20208, 0.1099258, 1, 0.2627451, 0, 1,
-1.73597, 0.5102932, 1.004813, 1, 0.2705882, 0, 1,
-1.735946, -0.03294546, -0.4162306, 1, 0.2745098, 0, 1,
-1.730157, -0.5638016, -3.550109, 1, 0.282353, 0, 1,
-1.716496, 0.1632791, -1.436288, 1, 0.2862745, 0, 1,
-1.694189, -0.2766342, -2.16624, 1, 0.2941177, 0, 1,
-1.685006, -1.338637, -1.907573, 1, 0.3019608, 0, 1,
-1.682667, -0.2533531, -1.396821, 1, 0.3058824, 0, 1,
-1.671721, -0.6968029, -1.035291, 1, 0.3137255, 0, 1,
-1.671216, 1.036707, -1.198684, 1, 0.3176471, 0, 1,
-1.665865, -0.968772, -1.247452, 1, 0.3254902, 0, 1,
-1.65813, 0.6717693, -0.7966719, 1, 0.3294118, 0, 1,
-1.647236, 1.049467, 0.916936, 1, 0.3372549, 0, 1,
-1.6012, -0.2303957, -1.988083, 1, 0.3411765, 0, 1,
-1.590985, -0.4054997, -2.424546, 1, 0.3490196, 0, 1,
-1.586527, 0.4375728, -0.6785512, 1, 0.3529412, 0, 1,
-1.549594, -0.8527296, -1.368452, 1, 0.3607843, 0, 1,
-1.547036, -1.112049, -2.105564, 1, 0.3647059, 0, 1,
-1.540172, -2.033118, -2.262492, 1, 0.372549, 0, 1,
-1.530455, 0.8986109, -1.5483, 1, 0.3764706, 0, 1,
-1.518305, -0.3115999, -3.27302, 1, 0.3843137, 0, 1,
-1.509775, 0.9413062, 0.3637175, 1, 0.3882353, 0, 1,
-1.506461, -0.3525171, -2.80671, 1, 0.3960784, 0, 1,
-1.506389, 1.244655, -0.7953732, 1, 0.4039216, 0, 1,
-1.491132, 1.468647, -0.6530932, 1, 0.4078431, 0, 1,
-1.485513, 0.3649281, -0.9924635, 1, 0.4156863, 0, 1,
-1.483546, 1.00272, -0.2946758, 1, 0.4196078, 0, 1,
-1.483225, 1.075961, -0.2962599, 1, 0.427451, 0, 1,
-1.453816, -0.08717852, -1.812792, 1, 0.4313726, 0, 1,
-1.451536, -0.1343206, -1.976349, 1, 0.4392157, 0, 1,
-1.450207, 1.849459, -1.784087, 1, 0.4431373, 0, 1,
-1.420851, -0.9454859, -2.361065, 1, 0.4509804, 0, 1,
-1.418362, -0.3181334, -1.40417, 1, 0.454902, 0, 1,
-1.417926, 1.321409, 0.4017552, 1, 0.4627451, 0, 1,
-1.417581, -1.108942, -4.239641, 1, 0.4666667, 0, 1,
-1.405805, 1.336355, -0.813489, 1, 0.4745098, 0, 1,
-1.397509, -0.5594639, -1.819499, 1, 0.4784314, 0, 1,
-1.395464, 0.7541595, -1.495031, 1, 0.4862745, 0, 1,
-1.384447, 0.004234353, -2.165172, 1, 0.4901961, 0, 1,
-1.381307, 0.4435444, -2.089049, 1, 0.4980392, 0, 1,
-1.377478, -0.8677002, -1.946697, 1, 0.5058824, 0, 1,
-1.364275, -3.488637, -4.711481, 1, 0.509804, 0, 1,
-1.349824, 1.003771, -0.8140536, 1, 0.5176471, 0, 1,
-1.347973, -0.4276703, -3.91165, 1, 0.5215687, 0, 1,
-1.335223, 0.9614299, -0.1303999, 1, 0.5294118, 0, 1,
-1.331507, -0.2234038, -1.356079, 1, 0.5333334, 0, 1,
-1.315436, -0.8638003, -2.622672, 1, 0.5411765, 0, 1,
-1.299605, 1.189758, -0.7953256, 1, 0.5450981, 0, 1,
-1.286225, 0.7945833, -0.5037866, 1, 0.5529412, 0, 1,
-1.277337, -0.6162222, -2.085636, 1, 0.5568628, 0, 1,
-1.276214, 0.2880932, -1.533532, 1, 0.5647059, 0, 1,
-1.272083, 0.02351495, -0.6180936, 1, 0.5686275, 0, 1,
-1.271358, -0.08362904, -1.091988, 1, 0.5764706, 0, 1,
-1.270365, 0.04826118, -1.913709, 1, 0.5803922, 0, 1,
-1.268632, 0.9217857, -1.28973, 1, 0.5882353, 0, 1,
-1.265334, 0.7141488, 0.151783, 1, 0.5921569, 0, 1,
-1.251496, -0.4011034, -1.02817, 1, 0.6, 0, 1,
-1.236085, -1.502035, -2.004366, 1, 0.6078432, 0, 1,
-1.231966, -0.8001587, -1.821751, 1, 0.6117647, 0, 1,
-1.228118, -0.9524255, -2.894289, 1, 0.6196079, 0, 1,
-1.224533, 1.284706, -2.317244, 1, 0.6235294, 0, 1,
-1.215253, 0.6718365, -1.73839, 1, 0.6313726, 0, 1,
-1.213757, 0.1620924, -3.097394, 1, 0.6352941, 0, 1,
-1.200244, 0.1737546, -0.8382947, 1, 0.6431373, 0, 1,
-1.192047, -1.656506, -3.239551, 1, 0.6470588, 0, 1,
-1.188846, 0.7457473, 0.06698128, 1, 0.654902, 0, 1,
-1.188489, 1.244202, -1.457074, 1, 0.6588235, 0, 1,
-1.187687, -0.5610796, -2.417474, 1, 0.6666667, 0, 1,
-1.179972, -0.08052848, -2.066426, 1, 0.6705883, 0, 1,
-1.176871, -0.8105323, -2.112473, 1, 0.6784314, 0, 1,
-1.175852, -1.486426, -3.209305, 1, 0.682353, 0, 1,
-1.171361, -0.09489567, -1.764985, 1, 0.6901961, 0, 1,
-1.169553, 0.02600415, -0.9331038, 1, 0.6941177, 0, 1,
-1.16894, -0.1954746, -1.406447, 1, 0.7019608, 0, 1,
-1.163497, -0.01558238, -1.432379, 1, 0.7098039, 0, 1,
-1.16331, -0.01371957, -1.084042, 1, 0.7137255, 0, 1,
-1.153999, -2.963487, -2.269932, 1, 0.7215686, 0, 1,
-1.14298, -0.06368505, -0.9640742, 1, 0.7254902, 0, 1,
-1.133254, 2.360786, -1.56511, 1, 0.7333333, 0, 1,
-1.130004, -0.288804, -1.554593, 1, 0.7372549, 0, 1,
-1.114511, -1.57895, -4.199101, 1, 0.7450981, 0, 1,
-1.11054, -0.1801431, -3.37267, 1, 0.7490196, 0, 1,
-1.102256, -1.182611, -2.962976, 1, 0.7568628, 0, 1,
-1.102243, 1.242096, -0.5713391, 1, 0.7607843, 0, 1,
-1.077512, 1.186473, -0.7212689, 1, 0.7686275, 0, 1,
-1.074866, 0.3682587, -1.030064, 1, 0.772549, 0, 1,
-1.072834, -1.332512, -2.88629, 1, 0.7803922, 0, 1,
-1.071378, -1.401167, -2.345166, 1, 0.7843137, 0, 1,
-1.063902, -1.332785, -3.650635, 1, 0.7921569, 0, 1,
-1.063104, 0.280367, -0.5304171, 1, 0.7960784, 0, 1,
-1.051095, -2.25281, -2.483845, 1, 0.8039216, 0, 1,
-1.047777, -0.2643633, -2.228801, 1, 0.8117647, 0, 1,
-1.046045, -0.1840633, -2.577338, 1, 0.8156863, 0, 1,
-1.044442, 0.6709677, 0.1252041, 1, 0.8235294, 0, 1,
-1.03885, -0.2571826, -3.155768, 1, 0.827451, 0, 1,
-1.03688, -0.07825922, -1.468982, 1, 0.8352941, 0, 1,
-1.036657, -0.7076504, -4.5594, 1, 0.8392157, 0, 1,
-1.033324, 0.02870988, -1.33483, 1, 0.8470588, 0, 1,
-1.028016, -2.756215, -4.435814, 1, 0.8509804, 0, 1,
-1.024567, 1.247222, -2.437652, 1, 0.8588235, 0, 1,
-1.022768, -0.1677163, -2.145769, 1, 0.8627451, 0, 1,
-1.021146, 1.143905, 0.6018173, 1, 0.8705882, 0, 1,
-1.016551, -1.690721, -3.089349, 1, 0.8745098, 0, 1,
-1.012465, -0.2625739, -1.060389, 1, 0.8823529, 0, 1,
-1.00868, 0.6737154, -0.8522493, 1, 0.8862745, 0, 1,
-1.002859, 0.01626388, -1.244211, 1, 0.8941177, 0, 1,
-1.001919, 1.012963, 0.00228088, 1, 0.8980392, 0, 1,
-1.00052, 0.1831751, -2.082421, 1, 0.9058824, 0, 1,
-0.9923097, 1.648496, 0.1892712, 1, 0.9137255, 0, 1,
-0.9820041, -0.02830643, -0.3590957, 1, 0.9176471, 0, 1,
-0.9776667, -0.3402952, -3.765354, 1, 0.9254902, 0, 1,
-0.9697005, -1.541324, -2.328081, 1, 0.9294118, 0, 1,
-0.969371, 0.3955173, -1.061714, 1, 0.9372549, 0, 1,
-0.9535412, 0.7585461, -1.182073, 1, 0.9411765, 0, 1,
-0.9525209, 1.475919, 0.6470934, 1, 0.9490196, 0, 1,
-0.9518639, -0.655728, -1.716134, 1, 0.9529412, 0, 1,
-0.951267, 0.364364, -2.004785, 1, 0.9607843, 0, 1,
-0.9498031, -0.363479, -1.861879, 1, 0.9647059, 0, 1,
-0.9310814, 1.955959, -0.4777295, 1, 0.972549, 0, 1,
-0.9188823, -0.1635565, -0.8397401, 1, 0.9764706, 0, 1,
-0.9149193, 0.01004893, -2.93482, 1, 0.9843137, 0, 1,
-0.9131594, -0.6318614, -1.16905, 1, 0.9882353, 0, 1,
-0.9075492, -0.8676937, -3.233612, 1, 0.9960784, 0, 1,
-0.9048385, 0.5661488, -1.933016, 0.9960784, 1, 0, 1,
-0.9030773, -0.6141444, -3.476117, 0.9921569, 1, 0, 1,
-0.8946311, 0.8618132, -0.9662124, 0.9843137, 1, 0, 1,
-0.8932267, -1.696942, -3.088106, 0.9803922, 1, 0, 1,
-0.8931928, 0.3286412, -0.06922233, 0.972549, 1, 0, 1,
-0.892006, 1.433474, -1.02873, 0.9686275, 1, 0, 1,
-0.891344, 1.504878, -1.002662, 0.9607843, 1, 0, 1,
-0.8897148, -0.467457, -0.7659401, 0.9568627, 1, 0, 1,
-0.8896892, -0.6843228, -2.200267, 0.9490196, 1, 0, 1,
-0.8824574, -0.7777012, -2.19359, 0.945098, 1, 0, 1,
-0.8791326, -1.985868, -2.65489, 0.9372549, 1, 0, 1,
-0.8772618, 1.645409, 0.1154859, 0.9333333, 1, 0, 1,
-0.8749568, 1.156038, 0.408922, 0.9254902, 1, 0, 1,
-0.8737783, 1.06034, -0.1909153, 0.9215686, 1, 0, 1,
-0.8727026, 0.5063952, -0.08887138, 0.9137255, 1, 0, 1,
-0.8717947, -0.8258983, -0.7450193, 0.9098039, 1, 0, 1,
-0.8713812, -0.1742404, -1.690356, 0.9019608, 1, 0, 1,
-0.8696794, 0.3311632, -1.387249, 0.8941177, 1, 0, 1,
-0.8681145, 0.9429669, 0.6195447, 0.8901961, 1, 0, 1,
-0.8633344, 0.2615796, -0.6244513, 0.8823529, 1, 0, 1,
-0.8597676, -1.725273, -3.255177, 0.8784314, 1, 0, 1,
-0.8583604, 0.8281337, 0.3040015, 0.8705882, 1, 0, 1,
-0.8577651, 2.153274, -2.138398, 0.8666667, 1, 0, 1,
-0.856184, -0.2991021, -2.180329, 0.8588235, 1, 0, 1,
-0.8528883, 0.4249522, -3.287948, 0.854902, 1, 0, 1,
-0.8527005, 0.2104016, -1.916353, 0.8470588, 1, 0, 1,
-0.8515518, 0.5750837, -2.106969, 0.8431373, 1, 0, 1,
-0.8512912, -1.33956, -2.775075, 0.8352941, 1, 0, 1,
-0.8428249, 0.6937281, -0.5200223, 0.8313726, 1, 0, 1,
-0.8421967, -0.7248116, -2.468804, 0.8235294, 1, 0, 1,
-0.8405863, -0.4057997, -0.5350902, 0.8196079, 1, 0, 1,
-0.8379955, 0.4050414, -1.766354, 0.8117647, 1, 0, 1,
-0.8378102, -1.029631, -0.8933296, 0.8078431, 1, 0, 1,
-0.8361333, 0.09862367, -2.030962, 0.8, 1, 0, 1,
-0.8357183, -0.5803531, -3.361214, 0.7921569, 1, 0, 1,
-0.8244745, -1.704897, -4.822815, 0.7882353, 1, 0, 1,
-0.8232546, 0.0006526509, -2.73463, 0.7803922, 1, 0, 1,
-0.8227305, 1.100742, -1.564655, 0.7764706, 1, 0, 1,
-0.8189065, -0.04542456, -2.279604, 0.7686275, 1, 0, 1,
-0.8141343, -0.02511985, -1.986001, 0.7647059, 1, 0, 1,
-0.8135996, -0.6754999, -2.277442, 0.7568628, 1, 0, 1,
-0.8044192, -2.159714, -3.145681, 0.7529412, 1, 0, 1,
-0.8040851, -0.5002974, -2.07884, 0.7450981, 1, 0, 1,
-0.7992265, -0.8107032, -1.760254, 0.7411765, 1, 0, 1,
-0.7981015, 0.4777461, -2.074731, 0.7333333, 1, 0, 1,
-0.7964045, 0.4291562, -1.898164, 0.7294118, 1, 0, 1,
-0.7962451, 1.351681, 0.005836289, 0.7215686, 1, 0, 1,
-0.7901815, -0.2673008, -2.037736, 0.7176471, 1, 0, 1,
-0.789332, 1.215643, -1.561221, 0.7098039, 1, 0, 1,
-0.7887261, -0.5340562, -1.321908, 0.7058824, 1, 0, 1,
-0.7877309, -0.5524888, -3.587057, 0.6980392, 1, 0, 1,
-0.7865453, -0.2149191, -1.386166, 0.6901961, 1, 0, 1,
-0.775456, 0.315269, -1.021987, 0.6862745, 1, 0, 1,
-0.7746843, -0.2712981, -0.9552075, 0.6784314, 1, 0, 1,
-0.7727064, -0.6701003, -2.188487, 0.6745098, 1, 0, 1,
-0.7707697, -0.6871353, -1.171723, 0.6666667, 1, 0, 1,
-0.7694883, -0.5647115, -3.493224, 0.6627451, 1, 0, 1,
-0.766652, 1.158794, -0.6280292, 0.654902, 1, 0, 1,
-0.7650666, -1.213947, -1.927938, 0.6509804, 1, 0, 1,
-0.7640633, 0.5318899, -2.008314, 0.6431373, 1, 0, 1,
-0.7610169, 0.2004873, -1.735962, 0.6392157, 1, 0, 1,
-0.7592074, -0.5742692, -3.002979, 0.6313726, 1, 0, 1,
-0.7571635, 0.7902679, 0.5211151, 0.627451, 1, 0, 1,
-0.7561604, 0.495345, -2.48689, 0.6196079, 1, 0, 1,
-0.7547001, -1.017626, -4.094485, 0.6156863, 1, 0, 1,
-0.7493145, 0.7183431, -1.675949, 0.6078432, 1, 0, 1,
-0.7492055, 1.016735, -1.0212, 0.6039216, 1, 0, 1,
-0.7378287, -0.1461741, 0.07769807, 0.5960785, 1, 0, 1,
-0.7367218, -0.08416394, -2.725641, 0.5882353, 1, 0, 1,
-0.7302434, -0.6766267, -2.946262, 0.5843138, 1, 0, 1,
-0.7234511, -0.2106625, -1.78491, 0.5764706, 1, 0, 1,
-0.7207125, -1.028316, -1.973201, 0.572549, 1, 0, 1,
-0.7203559, 0.3400247, 0.7429075, 0.5647059, 1, 0, 1,
-0.7195376, 0.4913657, 0.773294, 0.5607843, 1, 0, 1,
-0.7171509, -0.985076, -2.295051, 0.5529412, 1, 0, 1,
-0.7040108, 0.362293, -0.2577377, 0.5490196, 1, 0, 1,
-0.7027357, -0.1371647, -3.595141, 0.5411765, 1, 0, 1,
-0.7013316, -0.06404855, -2.817841, 0.5372549, 1, 0, 1,
-0.6969969, 1.137618, -0.7851816, 0.5294118, 1, 0, 1,
-0.6922435, 0.2949374, -0.374434, 0.5254902, 1, 0, 1,
-0.687212, 0.6404976, -2.242841, 0.5176471, 1, 0, 1,
-0.6795771, 0.4188886, -0.8918764, 0.5137255, 1, 0, 1,
-0.6778835, -0.5318421, -2.544546, 0.5058824, 1, 0, 1,
-0.6761974, 1.771202, -2.109473, 0.5019608, 1, 0, 1,
-0.676169, -0.1382837, -2.524083, 0.4941176, 1, 0, 1,
-0.6752707, -0.1942639, -1.40626, 0.4862745, 1, 0, 1,
-0.6734198, -0.4151877, -2.90017, 0.4823529, 1, 0, 1,
-0.6727521, -0.257122, -3.109841, 0.4745098, 1, 0, 1,
-0.668965, -0.7015326, -1.527018, 0.4705882, 1, 0, 1,
-0.6687854, -0.9666849, -1.450203, 0.4627451, 1, 0, 1,
-0.6657631, 0.6913666, -1.959716, 0.4588235, 1, 0, 1,
-0.6596028, -0.4197432, -3.759088, 0.4509804, 1, 0, 1,
-0.6562593, -1.667966, -2.276866, 0.4470588, 1, 0, 1,
-0.6552559, 0.6047416, 0.2715358, 0.4392157, 1, 0, 1,
-0.6550484, 0.9742516, -3.409371, 0.4352941, 1, 0, 1,
-0.6509525, -1.39003, -2.243746, 0.427451, 1, 0, 1,
-0.6505452, -0.01987679, -2.337382, 0.4235294, 1, 0, 1,
-0.6478344, -1.243748, -1.400419, 0.4156863, 1, 0, 1,
-0.6396114, -0.1062492, -2.400541, 0.4117647, 1, 0, 1,
-0.6388857, 0.8197485, -1.644614, 0.4039216, 1, 0, 1,
-0.6387666, 2.483387, 0.8054661, 0.3960784, 1, 0, 1,
-0.6308331, -0.8679165, -4.625977, 0.3921569, 1, 0, 1,
-0.62541, 2.667296, -0.1055019, 0.3843137, 1, 0, 1,
-0.6232451, 1.990357, -0.7212504, 0.3803922, 1, 0, 1,
-0.6212325, -0.7334131, -2.912359, 0.372549, 1, 0, 1,
-0.6209633, -0.3853759, -1.561487, 0.3686275, 1, 0, 1,
-0.6194736, -0.3269661, -3.229776, 0.3607843, 1, 0, 1,
-0.6147884, -0.8818863, -3.324341, 0.3568628, 1, 0, 1,
-0.6144913, -0.5443802, -1.007149, 0.3490196, 1, 0, 1,
-0.6129026, -1.195139, -2.571945, 0.345098, 1, 0, 1,
-0.6106941, -0.01382365, -2.50535, 0.3372549, 1, 0, 1,
-0.6001165, -0.4665006, -1.774102, 0.3333333, 1, 0, 1,
-0.5986124, -0.5327974, -2.448378, 0.3254902, 1, 0, 1,
-0.5927978, 0.4072637, -1.06229, 0.3215686, 1, 0, 1,
-0.5824792, 1.082751, -1.608324, 0.3137255, 1, 0, 1,
-0.5781379, -0.5382283, -2.089472, 0.3098039, 1, 0, 1,
-0.5730601, -0.2339759, -1.597767, 0.3019608, 1, 0, 1,
-0.5713678, 0.2166695, -1.529519, 0.2941177, 1, 0, 1,
-0.5691398, -0.5447198, -3.308975, 0.2901961, 1, 0, 1,
-0.5665377, -1.604276, -3.788887, 0.282353, 1, 0, 1,
-0.5661453, 0.3284992, -2.171585, 0.2784314, 1, 0, 1,
-0.5657547, -0.1570724, -2.226738, 0.2705882, 1, 0, 1,
-0.561676, 0.8865753, 0.5002193, 0.2666667, 1, 0, 1,
-0.5616031, 0.6118581, 0.1074552, 0.2588235, 1, 0, 1,
-0.5575381, 0.8692013, -1.635921, 0.254902, 1, 0, 1,
-0.5531795, 0.07194492, -1.001867, 0.2470588, 1, 0, 1,
-0.5513036, -1.126892, -4.108964, 0.2431373, 1, 0, 1,
-0.550566, -0.6544915, -4.227316, 0.2352941, 1, 0, 1,
-0.5503837, 1.203541, -0.1129875, 0.2313726, 1, 0, 1,
-0.5499403, -0.6898912, -4.25989, 0.2235294, 1, 0, 1,
-0.5459886, -0.4229203, -1.503522, 0.2196078, 1, 0, 1,
-0.5446199, -1.169069, -3.701884, 0.2117647, 1, 0, 1,
-0.5440968, -0.8368732, -1.924438, 0.2078431, 1, 0, 1,
-0.543371, 0.3316897, -0.9635491, 0.2, 1, 0, 1,
-0.5423345, -1.048209, -1.46852, 0.1921569, 1, 0, 1,
-0.538996, 2.007743, -0.2566536, 0.1882353, 1, 0, 1,
-0.5272608, 1.179646, -1.017582, 0.1803922, 1, 0, 1,
-0.5217804, 0.01602726, -0.9858298, 0.1764706, 1, 0, 1,
-0.5200385, 0.2243388, -2.081837, 0.1686275, 1, 0, 1,
-0.5175284, -0.4989111, -2.698066, 0.1647059, 1, 0, 1,
-0.5122924, -0.02000958, 0.1251937, 0.1568628, 1, 0, 1,
-0.509849, -1.509135, -3.561872, 0.1529412, 1, 0, 1,
-0.5028304, -0.1145311, -3.142547, 0.145098, 1, 0, 1,
-0.4985723, -0.3481826, -2.65438, 0.1411765, 1, 0, 1,
-0.4867467, 0.7321146, -0.8110912, 0.1333333, 1, 0, 1,
-0.4805829, 0.02018866, -0.7071196, 0.1294118, 1, 0, 1,
-0.4750852, 1.454686, -0.9444603, 0.1215686, 1, 0, 1,
-0.4695627, 0.2663008, -0.8583844, 0.1176471, 1, 0, 1,
-0.4683589, 1.083449, -2.107893, 0.1098039, 1, 0, 1,
-0.4666084, 0.8643473, -0.05002117, 0.1058824, 1, 0, 1,
-0.4657845, -0.1921451, -2.166191, 0.09803922, 1, 0, 1,
-0.4644717, 0.00425323, -1.357175, 0.09019608, 1, 0, 1,
-0.4604857, 0.8376284, 0.05206426, 0.08627451, 1, 0, 1,
-0.4585505, 1.263784, -0.8543877, 0.07843138, 1, 0, 1,
-0.4567803, 0.6620132, -2.422431, 0.07450981, 1, 0, 1,
-0.4566821, -1.948067, -2.968878, 0.06666667, 1, 0, 1,
-0.4560349, 1.230288, -0.8576189, 0.0627451, 1, 0, 1,
-0.4545738, 1.944164, 0.7093535, 0.05490196, 1, 0, 1,
-0.4520819, 1.955009, -0.3465045, 0.05098039, 1, 0, 1,
-0.4504865, -0.7027708, -1.229096, 0.04313726, 1, 0, 1,
-0.4435987, -0.2304939, -0.4237483, 0.03921569, 1, 0, 1,
-0.4381588, 0.679589, -1.039357, 0.03137255, 1, 0, 1,
-0.4377267, 1.049924, -0.6941867, 0.02745098, 1, 0, 1,
-0.4270136, -0.222929, -2.718925, 0.01960784, 1, 0, 1,
-0.4259014, -2.002063e-05, -1.521612, 0.01568628, 1, 0, 1,
-0.4251282, -0.7755128, -0.8861711, 0.007843138, 1, 0, 1,
-0.4199577, -0.2876332, -3.433888, 0.003921569, 1, 0, 1,
-0.4173905, 0.02395239, -0.6527886, 0, 1, 0.003921569, 1,
-0.4172873, -1.345858, -3.536409, 0, 1, 0.01176471, 1,
-0.416333, 0.8764896, -0.7626201, 0, 1, 0.01568628, 1,
-0.4125724, 0.9095936, -0.6950858, 0, 1, 0.02352941, 1,
-0.4112837, -0.5232788, -4.419368, 0, 1, 0.02745098, 1,
-0.4091716, 0.8940694, -0.8785096, 0, 1, 0.03529412, 1,
-0.4088586, -0.3981096, -1.186359, 0, 1, 0.03921569, 1,
-0.4067714, -0.6422419, -3.342203, 0, 1, 0.04705882, 1,
-0.4052763, 0.9621844, -1.71625, 0, 1, 0.05098039, 1,
-0.4020953, 1.060835, -0.2382199, 0, 1, 0.05882353, 1,
-0.3973689, 1.026774, -0.6568421, 0, 1, 0.0627451, 1,
-0.3965641, -1.485747, -4.097123, 0, 1, 0.07058824, 1,
-0.3723965, -0.2362969, -2.834302, 0, 1, 0.07450981, 1,
-0.3662083, 1.961849, 0.107693, 0, 1, 0.08235294, 1,
-0.3658516, -0.2547961, -1.163857, 0, 1, 0.08627451, 1,
-0.363251, -0.4750721, -2.037943, 0, 1, 0.09411765, 1,
-0.3602009, 0.2553697, -2.331189, 0, 1, 0.1019608, 1,
-0.3601001, 1.233622, -0.3788468, 0, 1, 0.1058824, 1,
-0.356957, 0.1298728, -2.452466, 0, 1, 0.1137255, 1,
-0.3555688, 0.3275322, -1.310186, 0, 1, 0.1176471, 1,
-0.3542729, -1.600176, -3.759325, 0, 1, 0.1254902, 1,
-0.3528703, -1.495961, -1.933433, 0, 1, 0.1294118, 1,
-0.3474304, -0.21367, -0.7659966, 0, 1, 0.1372549, 1,
-0.3463205, 0.05141925, -2.693546, 0, 1, 0.1411765, 1,
-0.3446827, 2.314284, -0.3559992, 0, 1, 0.1490196, 1,
-0.3433075, 0.4859885, -1.212269, 0, 1, 0.1529412, 1,
-0.3428146, -0.869537, -2.357293, 0, 1, 0.1607843, 1,
-0.34204, 0.06351286, -2.142305, 0, 1, 0.1647059, 1,
-0.3369036, -0.6736215, -1.502913, 0, 1, 0.172549, 1,
-0.3326447, 0.4790664, -2.624988, 0, 1, 0.1764706, 1,
-0.3323408, -2.990934, -3.437559, 0, 1, 0.1843137, 1,
-0.3315535, -1.139941, -2.43676, 0, 1, 0.1882353, 1,
-0.3295789, -1.060348, -3.736306, 0, 1, 0.1960784, 1,
-0.326607, -0.7865523, -2.41859, 0, 1, 0.2039216, 1,
-0.3243563, -3.175704, -2.154345, 0, 1, 0.2078431, 1,
-0.31662, 0.5060453, 0.05350041, 0, 1, 0.2156863, 1,
-0.3088312, -0.1618422, -4.096798, 0, 1, 0.2196078, 1,
-0.305542, 1.47183, 0.09540251, 0, 1, 0.227451, 1,
-0.2991021, 3.596763, 0.3254983, 0, 1, 0.2313726, 1,
-0.2941685, -0.6553809, -1.27634, 0, 1, 0.2392157, 1,
-0.2917847, 0.1581481, -0.2948895, 0, 1, 0.2431373, 1,
-0.2903235, -0.1112008, -2.322696, 0, 1, 0.2509804, 1,
-0.2824471, -0.8794133, -1.856435, 0, 1, 0.254902, 1,
-0.2809799, -0.9953784, -3.560571, 0, 1, 0.2627451, 1,
-0.2806599, -0.08538419, -1.321601, 0, 1, 0.2666667, 1,
-0.2787723, -0.51115, -2.041642, 0, 1, 0.2745098, 1,
-0.2724764, -1.352005, -4.002371, 0, 1, 0.2784314, 1,
-0.2685101, -0.6454641, -2.645355, 0, 1, 0.2862745, 1,
-0.2683731, 1.10374, 0.6157231, 0, 1, 0.2901961, 1,
-0.261266, 1.52489, -0.1894965, 0, 1, 0.2980392, 1,
-0.2554314, -1.048597, -3.198908, 0, 1, 0.3058824, 1,
-0.254928, -0.5779173, -3.222316, 0, 1, 0.3098039, 1,
-0.2488368, 0.2150556, -0.9211709, 0, 1, 0.3176471, 1,
-0.2479467, -1.855888, -5.898599, 0, 1, 0.3215686, 1,
-0.242259, -0.3117758, -1.541209, 0, 1, 0.3294118, 1,
-0.2415295, -0.1460179, -2.718511, 0, 1, 0.3333333, 1,
-0.2396075, 0.2473562, 0.008730405, 0, 1, 0.3411765, 1,
-0.2322021, -0.05384357, -1.245842, 0, 1, 0.345098, 1,
-0.2308967, 0.6903674, 0.7512521, 0, 1, 0.3529412, 1,
-0.2304921, -1.50003, -3.237896, 0, 1, 0.3568628, 1,
-0.2293083, -0.6237713, -2.56174, 0, 1, 0.3647059, 1,
-0.2262042, -0.3101169, -1.98222, 0, 1, 0.3686275, 1,
-0.2240776, -0.4035489, -3.260798, 0, 1, 0.3764706, 1,
-0.2220202, 1.216613, -1.067019, 0, 1, 0.3803922, 1,
-0.2213589, 0.9309387, 1.430082, 0, 1, 0.3882353, 1,
-0.2199828, -0.85174, -3.282448, 0, 1, 0.3921569, 1,
-0.2199662, 1.708535, 1.256753, 0, 1, 0.4, 1,
-0.2188283, 0.7876889, -0.4283379, 0, 1, 0.4078431, 1,
-0.2147088, 2.031515, -0.1087929, 0, 1, 0.4117647, 1,
-0.2135081, -0.5302798, -3.096095, 0, 1, 0.4196078, 1,
-0.2127027, -0.4896413, -2.466449, 0, 1, 0.4235294, 1,
-0.2118623, 1.289897, 0.8314641, 0, 1, 0.4313726, 1,
-0.2103964, 1.714785, -0.7141389, 0, 1, 0.4352941, 1,
-0.2099243, -0.4486185, -2.347046, 0, 1, 0.4431373, 1,
-0.2068656, -0.8050504, -1.368939, 0, 1, 0.4470588, 1,
-0.2037002, -1.505372, -3.931294, 0, 1, 0.454902, 1,
-0.1986992, 0.3630106, -0.9244102, 0, 1, 0.4588235, 1,
-0.1983975, -1.328334, -2.195952, 0, 1, 0.4666667, 1,
-0.1983945, 2.999877, -0.3852316, 0, 1, 0.4705882, 1,
-0.1845487, 0.07488235, -2.65723, 0, 1, 0.4784314, 1,
-0.1844613, 0.1450707, -0.2538706, 0, 1, 0.4823529, 1,
-0.1822935, -0.4784915, -2.349271, 0, 1, 0.4901961, 1,
-0.1807329, 0.3044344, -2.120059, 0, 1, 0.4941176, 1,
-0.1800486, 0.09068162, -1.049013, 0, 1, 0.5019608, 1,
-0.1750655, -0.3976701, -3.149746, 0, 1, 0.509804, 1,
-0.1741004, -0.4917411, -2.673368, 0, 1, 0.5137255, 1,
-0.1610868, -0.3609812, -3.621309, 0, 1, 0.5215687, 1,
-0.1596421, -0.0382305, -1.208442, 0, 1, 0.5254902, 1,
-0.1586238, -1.160374, -2.509597, 0, 1, 0.5333334, 1,
-0.1571033, 2.144338, -0.6422204, 0, 1, 0.5372549, 1,
-0.1556552, -1.091383, -2.708099, 0, 1, 0.5450981, 1,
-0.1553948, -0.6629589, -3.843205, 0, 1, 0.5490196, 1,
-0.1547077, 1.2965, 1.581829, 0, 1, 0.5568628, 1,
-0.1527957, -1.072606, -4.360299, 0, 1, 0.5607843, 1,
-0.1520056, -0.7823126, -2.852371, 0, 1, 0.5686275, 1,
-0.1470565, 1.082345, 0.007147318, 0, 1, 0.572549, 1,
-0.1467444, -0.1028592, -2.377607, 0, 1, 0.5803922, 1,
-0.1459038, 0.1207343, 0.8633844, 0, 1, 0.5843138, 1,
-0.1453903, 1.940939, -0.473554, 0, 1, 0.5921569, 1,
-0.1445743, -0.2645145, -2.88479, 0, 1, 0.5960785, 1,
-0.144573, 1.427851, -1.166611, 0, 1, 0.6039216, 1,
-0.144311, -0.3466563, -5.106605, 0, 1, 0.6117647, 1,
-0.1424529, -0.05867739, -3.193046, 0, 1, 0.6156863, 1,
-0.1407588, 1.059753, -1.328176, 0, 1, 0.6235294, 1,
-0.1389672, -0.6060588, -3.164876, 0, 1, 0.627451, 1,
-0.135182, 0.3949252, 1.125191, 0, 1, 0.6352941, 1,
-0.1336117, -0.2684485, -2.821086, 0, 1, 0.6392157, 1,
-0.1270785, -0.686884, -3.972048, 0, 1, 0.6470588, 1,
-0.1264567, 0.3573011, -0.5970411, 0, 1, 0.6509804, 1,
-0.1220539, 0.9848418, -0.5363675, 0, 1, 0.6588235, 1,
-0.121267, 1.5926, -0.8038594, 0, 1, 0.6627451, 1,
-0.1202448, -0.4343789, -2.986824, 0, 1, 0.6705883, 1,
-0.1190035, 1.147261, 1.680382, 0, 1, 0.6745098, 1,
-0.1155964, -0.8906685, -3.983481, 0, 1, 0.682353, 1,
-0.1147006, 0.6591431, -0.2371599, 0, 1, 0.6862745, 1,
-0.1077621, 0.5610656, -1.185062, 0, 1, 0.6941177, 1,
-0.1077249, 1.5598, 1.043042, 0, 1, 0.7019608, 1,
-0.09497227, -0.7167969, -2.788836, 0, 1, 0.7058824, 1,
-0.09350834, 0.1034276, -0.1589169, 0, 1, 0.7137255, 1,
-0.09272805, -0.80551, -3.355427, 0, 1, 0.7176471, 1,
-0.09238619, 0.239463, -1.340872, 0, 1, 0.7254902, 1,
-0.09025638, -0.1852682, -3.958375, 0, 1, 0.7294118, 1,
-0.08794671, 0.6016089, 0.2990985, 0, 1, 0.7372549, 1,
-0.08510029, 0.01298991, -3.249926, 0, 1, 0.7411765, 1,
-0.08482996, 0.1961266, 1.244525, 0, 1, 0.7490196, 1,
-0.08250903, -1.405505, -4.631742, 0, 1, 0.7529412, 1,
-0.07372422, 0.3703593, 1.307906, 0, 1, 0.7607843, 1,
-0.0733441, 2.538649, 0.4862895, 0, 1, 0.7647059, 1,
-0.07147231, 0.2042997, -1.958405, 0, 1, 0.772549, 1,
-0.06879175, -1.156025, -2.35224, 0, 1, 0.7764706, 1,
-0.06552759, -0.7527956, -4.86083, 0, 1, 0.7843137, 1,
-0.06455424, -0.1715267, -0.08710115, 0, 1, 0.7882353, 1,
-0.06233626, 0.3644783, -0.1470458, 0, 1, 0.7960784, 1,
-0.06196397, -0.2584721, -1.774712, 0, 1, 0.8039216, 1,
-0.06185799, 0.0102789, -1.40825, 0, 1, 0.8078431, 1,
-0.06133451, -0.1771023, -1.038715, 0, 1, 0.8156863, 1,
-0.06093626, 0.08859258, -1.461, 0, 1, 0.8196079, 1,
-0.05453451, 0.48396, -0.1285369, 0, 1, 0.827451, 1,
-0.0515229, -1.900592, -4.098145, 0, 1, 0.8313726, 1,
-0.04635625, -0.1196247, -2.748786, 0, 1, 0.8392157, 1,
-0.04524259, -1.857863, -4.356558, 0, 1, 0.8431373, 1,
-0.04430562, -0.7629109, -2.695461, 0, 1, 0.8509804, 1,
-0.04403162, -0.2350987, -3.31549, 0, 1, 0.854902, 1,
-0.04000304, 0.003767539, -1.651094, 0, 1, 0.8627451, 1,
-0.03972197, -0.3386067, -2.260909, 0, 1, 0.8666667, 1,
-0.03967731, -0.003329464, -3.213466, 0, 1, 0.8745098, 1,
-0.03884035, 1.100496, -0.7575483, 0, 1, 0.8784314, 1,
-0.03421891, -1.55471, -4.140214, 0, 1, 0.8862745, 1,
-0.03392681, 0.02205887, 1.097537, 0, 1, 0.8901961, 1,
-0.03251183, -1.058276, -2.137517, 0, 1, 0.8980392, 1,
-0.03145501, 0.3162452, -0.6194562, 0, 1, 0.9058824, 1,
-0.02439268, -0.08788115, -2.831849, 0, 1, 0.9098039, 1,
-0.0154523, 0.1426961, 0.8973997, 0, 1, 0.9176471, 1,
-0.0132768, 1.3939, 0.6357962, 0, 1, 0.9215686, 1,
-0.01324682, 1.839596, 0.009319691, 0, 1, 0.9294118, 1,
-0.01151506, -0.07799147, -2.928143, 0, 1, 0.9333333, 1,
-0.00858249, -0.2033546, -1.363014, 0, 1, 0.9411765, 1,
-0.001175386, -0.4997134, -3.400983, 0, 1, 0.945098, 1,
-0.000673943, -0.9371709, -2.727862, 0, 1, 0.9529412, 1,
0.008054469, -0.4035463, 2.210874, 0, 1, 0.9568627, 1,
0.01241487, -1.722898, 1.652087, 0, 1, 0.9647059, 1,
0.02206764, 1.658166, 0.505645, 0, 1, 0.9686275, 1,
0.02233786, 1.317059, -0.674512, 0, 1, 0.9764706, 1,
0.0328531, 0.9682202, -0.4911338, 0, 1, 0.9803922, 1,
0.03307186, -0.3170103, 3.497015, 0, 1, 0.9882353, 1,
0.03469511, 1.453224, 0.06533648, 0, 1, 0.9921569, 1,
0.03580572, 0.332748, 0.9566171, 0, 1, 1, 1,
0.03783368, -2.298835, 2.459077, 0, 0.9921569, 1, 1,
0.03859925, 0.6312767, -1.073551, 0, 0.9882353, 1, 1,
0.03996036, -0.1397354, 4.979749, 0, 0.9803922, 1, 1,
0.04564605, 0.4231454, 0.1931314, 0, 0.9764706, 1, 1,
0.04907096, 0.2888239, -0.2814137, 0, 0.9686275, 1, 1,
0.0495139, 0.06629561, 0.05280199, 0, 0.9647059, 1, 1,
0.0504064, -1.422247, 3.611693, 0, 0.9568627, 1, 1,
0.05367979, -0.09277429, 2.754962, 0, 0.9529412, 1, 1,
0.05393728, 2.085515, -1.654472, 0, 0.945098, 1, 1,
0.05400202, -0.4946013, 2.771252, 0, 0.9411765, 1, 1,
0.05722161, -1.664274, 4.484015, 0, 0.9333333, 1, 1,
0.0596661, 0.4837952, -0.22312, 0, 0.9294118, 1, 1,
0.06089318, 0.5647557, -0.4789217, 0, 0.9215686, 1, 1,
0.06315187, -1.364075, 3.057389, 0, 0.9176471, 1, 1,
0.06505438, 0.1365222, 0.5317609, 0, 0.9098039, 1, 1,
0.07287022, 1.637108, 1.723486, 0, 0.9058824, 1, 1,
0.07533722, -0.6655859, 4.155841, 0, 0.8980392, 1, 1,
0.07613281, -0.7291786, 2.171306, 0, 0.8901961, 1, 1,
0.0796571, 0.4015242, -0.6582597, 0, 0.8862745, 1, 1,
0.08331902, -0.7791822, 2.930381, 0, 0.8784314, 1, 1,
0.08402257, -0.6884466, 3.682766, 0, 0.8745098, 1, 1,
0.08496281, -1.496571, 2.860389, 0, 0.8666667, 1, 1,
0.08807683, 0.3054936, -0.04938245, 0, 0.8627451, 1, 1,
0.09409425, -0.7471811, 3.773902, 0, 0.854902, 1, 1,
0.09796485, -2.230878, 3.669275, 0, 0.8509804, 1, 1,
0.1001073, -2.078046, 1.456094, 0, 0.8431373, 1, 1,
0.1001598, 0.1533578, 0.1437555, 0, 0.8392157, 1, 1,
0.1006569, 1.030621, -0.1003932, 0, 0.8313726, 1, 1,
0.1032317, 0.2891109, 2.841918, 0, 0.827451, 1, 1,
0.1032569, 0.3864474, -0.2654104, 0, 0.8196079, 1, 1,
0.1036316, -1.255125, 2.716587, 0, 0.8156863, 1, 1,
0.106366, 0.4044029, -0.7234218, 0, 0.8078431, 1, 1,
0.1115582, -0.09483279, 1.064979, 0, 0.8039216, 1, 1,
0.1122246, -1.560311, 4.415233, 0, 0.7960784, 1, 1,
0.1149517, -0.5069861, 2.098466, 0, 0.7882353, 1, 1,
0.1256421, 0.7075471, 0.8815662, 0, 0.7843137, 1, 1,
0.1284934, -1.61483, 3.26946, 0, 0.7764706, 1, 1,
0.1310254, 0.6640705, 0.05728175, 0, 0.772549, 1, 1,
0.1347255, 1.146218, 0.6205401, 0, 0.7647059, 1, 1,
0.1364325, -0.5524434, 3.211213, 0, 0.7607843, 1, 1,
0.1412458, 0.4597123, -0.05442741, 0, 0.7529412, 1, 1,
0.1442137, 0.7620087, 0.04120883, 0, 0.7490196, 1, 1,
0.1456985, 1.11427, 1.629448, 0, 0.7411765, 1, 1,
0.1482412, 0.1444924, 1.530692, 0, 0.7372549, 1, 1,
0.149481, -0.5632517, 1.473762, 0, 0.7294118, 1, 1,
0.1504057, 1.039735, 0.2626629, 0, 0.7254902, 1, 1,
0.1629774, 0.793862, 0.3160689, 0, 0.7176471, 1, 1,
0.1644751, -0.5055459, 3.341126, 0, 0.7137255, 1, 1,
0.1659319, -0.001081905, -0.7349349, 0, 0.7058824, 1, 1,
0.1702638, 1.63231, 0.3865493, 0, 0.6980392, 1, 1,
0.1733822, 0.1871911, 0.3323728, 0, 0.6941177, 1, 1,
0.1747571, -0.9995942, 3.103539, 0, 0.6862745, 1, 1,
0.1758756, 0.7312148, 1.631223, 0, 0.682353, 1, 1,
0.1795962, -1.284086, 2.049528, 0, 0.6745098, 1, 1,
0.1809672, 1.004223, 0.7801107, 0, 0.6705883, 1, 1,
0.1822429, -2.129353, 1.946885, 0, 0.6627451, 1, 1,
0.1832524, -2.141114, 3.190554, 0, 0.6588235, 1, 1,
0.1910793, 0.288452, 0.7963369, 0, 0.6509804, 1, 1,
0.1939928, 0.2117787, -0.6389644, 0, 0.6470588, 1, 1,
0.1953948, 0.1680681, 2.522534, 0, 0.6392157, 1, 1,
0.1969795, -0.05277701, 2.407576, 0, 0.6352941, 1, 1,
0.1988479, -0.1660215, 1.85473, 0, 0.627451, 1, 1,
0.2058418, -1.07369, 5.085171, 0, 0.6235294, 1, 1,
0.2086519, -1.194796, 3.096405, 0, 0.6156863, 1, 1,
0.211816, 0.9214392, 0.1852394, 0, 0.6117647, 1, 1,
0.2129059, 1.084302, 0.2128779, 0, 0.6039216, 1, 1,
0.2153248, 0.003780137, 0.7451407, 0, 0.5960785, 1, 1,
0.2181031, -0.326833, 1.301024, 0, 0.5921569, 1, 1,
0.2188564, 0.6923625, -2.41843, 0, 0.5843138, 1, 1,
0.2228876, 0.9049253, -0.627537, 0, 0.5803922, 1, 1,
0.2271392, -1.061524, 3.92042, 0, 0.572549, 1, 1,
0.2285748, -0.1663937, 2.305541, 0, 0.5686275, 1, 1,
0.2293596, 0.6600598, -0.8843104, 0, 0.5607843, 1, 1,
0.2295139, -0.9334594, 0.2967549, 0, 0.5568628, 1, 1,
0.2305434, 0.7747725, 0.9513454, 0, 0.5490196, 1, 1,
0.2326728, 1.386388, -1.905245, 0, 0.5450981, 1, 1,
0.2388528, -1.461577, 3.788419, 0, 0.5372549, 1, 1,
0.2393216, -0.3193491, 2.517866, 0, 0.5333334, 1, 1,
0.241716, -1.17682, 2.892905, 0, 0.5254902, 1, 1,
0.2427813, -0.2577782, 1.188373, 0, 0.5215687, 1, 1,
0.2444793, -0.6920201, 1.97045, 0, 0.5137255, 1, 1,
0.2478829, 0.2039598, -0.3932226, 0, 0.509804, 1, 1,
0.2482032, -0.4234511, 1.788984, 0, 0.5019608, 1, 1,
0.248264, -1.048239, 1.899711, 0, 0.4941176, 1, 1,
0.2499071, 1.514775, 0.4412257, 0, 0.4901961, 1, 1,
0.2533928, -0.7218618, 4.029785, 0, 0.4823529, 1, 1,
0.253988, 0.8058707, -0.4830283, 0, 0.4784314, 1, 1,
0.257364, -1.123299, 2.134184, 0, 0.4705882, 1, 1,
0.2593672, 0.03238798, 1.994288, 0, 0.4666667, 1, 1,
0.2600119, -0.6490235, 3.548617, 0, 0.4588235, 1, 1,
0.2607297, -1.293626, 5.238152, 0, 0.454902, 1, 1,
0.2618199, 0.4174294, -0.1131187, 0, 0.4470588, 1, 1,
0.2625982, -0.3896715, 3.279211, 0, 0.4431373, 1, 1,
0.2632254, 0.6669061, 0.2241766, 0, 0.4352941, 1, 1,
0.2718875, 0.7224455, -0.5168557, 0, 0.4313726, 1, 1,
0.2734405, 0.9913366, 1.520375, 0, 0.4235294, 1, 1,
0.2740822, -3.771945, 4.029591, 0, 0.4196078, 1, 1,
0.2769983, 0.7509514, 1.080231, 0, 0.4117647, 1, 1,
0.2774398, -2.164482, 3.33135, 0, 0.4078431, 1, 1,
0.2821286, 1.242213, -1.227062, 0, 0.4, 1, 1,
0.2852658, 2.607197, 0.2372589, 0, 0.3921569, 1, 1,
0.2888562, 0.09145339, 1.184366, 0, 0.3882353, 1, 1,
0.2891672, -0.9894184, 1.74117, 0, 0.3803922, 1, 1,
0.289625, -0.2373622, 3.135858, 0, 0.3764706, 1, 1,
0.2905768, 0.1752282, 2.982286, 0, 0.3686275, 1, 1,
0.2925533, 0.3238527, 0.7829601, 0, 0.3647059, 1, 1,
0.2928941, 0.5297446, -1.228312, 0, 0.3568628, 1, 1,
0.2938374, 0.2803719, 1.011243, 0, 0.3529412, 1, 1,
0.2941263, -0.2923872, -0.04404698, 0, 0.345098, 1, 1,
0.3063889, -1.395884, 3.241519, 0, 0.3411765, 1, 1,
0.3087679, 1.979053, -0.3008296, 0, 0.3333333, 1, 1,
0.3100016, 1.124277, -0.537077, 0, 0.3294118, 1, 1,
0.3161087, -0.2530813, 2.820823, 0, 0.3215686, 1, 1,
0.3231617, 0.1565735, 0.08312733, 0, 0.3176471, 1, 1,
0.3266236, 0.8922825, -0.09693204, 0, 0.3098039, 1, 1,
0.3282332, -0.5761012, 3.89912, 0, 0.3058824, 1, 1,
0.3321458, -1.318139, 1.618636, 0, 0.2980392, 1, 1,
0.3341216, -0.4170629, 1.903124, 0, 0.2901961, 1, 1,
0.3364891, 0.3739093, 0.3994811, 0, 0.2862745, 1, 1,
0.3414357, 1.202331, -0.5484853, 0, 0.2784314, 1, 1,
0.3481223, 0.08094586, 1.773806, 0, 0.2745098, 1, 1,
0.3485948, -1.15443, 2.804586, 0, 0.2666667, 1, 1,
0.3509323, -1.170166, 0.8950176, 0, 0.2627451, 1, 1,
0.353041, -0.7708569, 0.997824, 0, 0.254902, 1, 1,
0.3610186, 0.1645568, -1.509646, 0, 0.2509804, 1, 1,
0.364892, 0.5885128, -0.5722607, 0, 0.2431373, 1, 1,
0.3660076, 0.3764544, -0.0421179, 0, 0.2392157, 1, 1,
0.3693316, 0.9923112, 0.4111175, 0, 0.2313726, 1, 1,
0.3705548, -1.227764, 3.285246, 0, 0.227451, 1, 1,
0.3737069, 0.2416993, 1.202276, 0, 0.2196078, 1, 1,
0.3761165, -0.2973057, 1.784124, 0, 0.2156863, 1, 1,
0.3775995, 0.9731346, 0.737698, 0, 0.2078431, 1, 1,
0.3819736, -1.58717, 3.187438, 0, 0.2039216, 1, 1,
0.3857804, -1.273488, 3.122254, 0, 0.1960784, 1, 1,
0.3889711, 1.183995, -0.6882559, 0, 0.1882353, 1, 1,
0.3919984, -0.05633639, 1.034285, 0, 0.1843137, 1, 1,
0.3939323, 1.499269, -1.007194, 0, 0.1764706, 1, 1,
0.3952965, 1.280091, 0.785539, 0, 0.172549, 1, 1,
0.3969085, -0.8032403, 3.820695, 0, 0.1647059, 1, 1,
0.3973774, 0.8689335, 1.414517, 0, 0.1607843, 1, 1,
0.3989083, 2.809902, -0.1076136, 0, 0.1529412, 1, 1,
0.3996541, -0.0955953, 3.66448, 0, 0.1490196, 1, 1,
0.4027951, -1.18051, 2.684156, 0, 0.1411765, 1, 1,
0.4036722, -0.9880788, 2.098482, 0, 0.1372549, 1, 1,
0.4044509, 0.4731883, 1.774695, 0, 0.1294118, 1, 1,
0.4070767, -1.086785, 2.799497, 0, 0.1254902, 1, 1,
0.4081077, -0.2292695, 1.427513, 0, 0.1176471, 1, 1,
0.410018, 0.8004228, 1.054878, 0, 0.1137255, 1, 1,
0.410409, -0.8362871, 3.692968, 0, 0.1058824, 1, 1,
0.4143366, 0.07994863, 0.2339989, 0, 0.09803922, 1, 1,
0.4147168, 0.1783011, -0.004851989, 0, 0.09411765, 1, 1,
0.4152749, 1.409458, 0.5748165, 0, 0.08627451, 1, 1,
0.4210739, 0.3017911, 0.5550641, 0, 0.08235294, 1, 1,
0.4336385, -1.088849, 1.958944, 0, 0.07450981, 1, 1,
0.4342096, -0.3870608, 1.882354, 0, 0.07058824, 1, 1,
0.4358282, -1.071198, 3.843451, 0, 0.0627451, 1, 1,
0.4432522, 0.7775937, -0.4737241, 0, 0.05882353, 1, 1,
0.4443072, -1.031217, 4.32447, 0, 0.05098039, 1, 1,
0.447898, -1.483354, 3.110263, 0, 0.04705882, 1, 1,
0.4501613, 0.7081308, 0.7926078, 0, 0.03921569, 1, 1,
0.4559352, 0.8292177, -0.3121689, 0, 0.03529412, 1, 1,
0.4578274, -0.2409205, 3.759146, 0, 0.02745098, 1, 1,
0.4593362, 0.4531735, -1.149868, 0, 0.02352941, 1, 1,
0.4599701, 0.621024, -0.7920504, 0, 0.01568628, 1, 1,
0.4607943, 1.320278, -0.4897589, 0, 0.01176471, 1, 1,
0.4617466, 0.1728661, 1.842586, 0, 0.003921569, 1, 1,
0.4680088, 2.236773, 0.644734, 0.003921569, 0, 1, 1,
0.4692759, -0.9503931, 3.593685, 0.007843138, 0, 1, 1,
0.4706824, 1.927632, 0.3635622, 0.01568628, 0, 1, 1,
0.4744631, -0.948591, 2.59071, 0.01960784, 0, 1, 1,
0.4790544, 0.1786572, -0.1424059, 0.02745098, 0, 1, 1,
0.4848231, -0.3631715, 2.37228, 0.03137255, 0, 1, 1,
0.4854187, -1.240642, 2.021558, 0.03921569, 0, 1, 1,
0.4875823, 1.160178, 1.060755, 0.04313726, 0, 1, 1,
0.4890775, -0.3989452, 3.634638, 0.05098039, 0, 1, 1,
0.4948455, -0.1052137, 2.752389, 0.05490196, 0, 1, 1,
0.4960929, -0.5205672, 1.510596, 0.0627451, 0, 1, 1,
0.497021, -0.7417545, 2.370825, 0.06666667, 0, 1, 1,
0.4984446, 0.7762442, 0.3744045, 0.07450981, 0, 1, 1,
0.5019084, 0.02260646, 0.2350593, 0.07843138, 0, 1, 1,
0.5024472, -0.1469246, 2.487345, 0.08627451, 0, 1, 1,
0.5034341, -0.8636456, 1.461698, 0.09019608, 0, 1, 1,
0.5044913, -1.246604, 3.066736, 0.09803922, 0, 1, 1,
0.5098063, 0.1937588, 2.545848, 0.1058824, 0, 1, 1,
0.5100757, 0.3892474, 2.126549, 0.1098039, 0, 1, 1,
0.5107588, -0.8733035, 3.820767, 0.1176471, 0, 1, 1,
0.5119203, 0.1600684, 1.44971, 0.1215686, 0, 1, 1,
0.5169281, 0.3668822, 1.408756, 0.1294118, 0, 1, 1,
0.5199978, -2.504493, 2.718333, 0.1333333, 0, 1, 1,
0.520328, 0.9601703, 1.770411, 0.1411765, 0, 1, 1,
0.5228646, -1.671683, 3.822588, 0.145098, 0, 1, 1,
0.5258657, 0.3965948, 0.9088508, 0.1529412, 0, 1, 1,
0.5312383, 1.506269, -0.5740957, 0.1568628, 0, 1, 1,
0.5356609, 2.0738, 1.00329, 0.1647059, 0, 1, 1,
0.5470917, 0.1792297, 1.803617, 0.1686275, 0, 1, 1,
0.5500967, 1.390017, -0.08632025, 0.1764706, 0, 1, 1,
0.5516609, -0.2002195, 1.209648, 0.1803922, 0, 1, 1,
0.554562, 0.9214549, -1.46698, 0.1882353, 0, 1, 1,
0.5569129, -0.6764913, 1.920187, 0.1921569, 0, 1, 1,
0.5575043, -0.256651, 3.27579, 0.2, 0, 1, 1,
0.5609344, 0.06604671, 1.07303, 0.2078431, 0, 1, 1,
0.564878, -0.2160159, 0.8688191, 0.2117647, 0, 1, 1,
0.5652019, 0.06305958, 0.3336699, 0.2196078, 0, 1, 1,
0.5657893, 0.4394656, 1.88385, 0.2235294, 0, 1, 1,
0.5699004, 0.9222109, -0.2970984, 0.2313726, 0, 1, 1,
0.5725452, 0.3973238, 0.7610998, 0.2352941, 0, 1, 1,
0.5779276, -1.220297, 2.254081, 0.2431373, 0, 1, 1,
0.5793906, 0.1851768, 1.146138, 0.2470588, 0, 1, 1,
0.5852014, -0.7294956, 2.242036, 0.254902, 0, 1, 1,
0.5868793, 1.376199, 1.233941, 0.2588235, 0, 1, 1,
0.5869012, 0.6399133, 2.072499, 0.2666667, 0, 1, 1,
0.5907585, 0.3927176, 0.7579274, 0.2705882, 0, 1, 1,
0.5908663, -0.2862554, 0.9148735, 0.2784314, 0, 1, 1,
0.5975181, -0.3705921, 1.040229, 0.282353, 0, 1, 1,
0.6015655, 0.5789854, 0.6001791, 0.2901961, 0, 1, 1,
0.6066735, -0.186966, 0.6076599, 0.2941177, 0, 1, 1,
0.6069981, -0.7393786, 4.351639, 0.3019608, 0, 1, 1,
0.6070929, -0.0562915, 0.2925861, 0.3098039, 0, 1, 1,
0.6080126, 0.1712616, 1.332255, 0.3137255, 0, 1, 1,
0.6097724, -0.2408885, 3.184494, 0.3215686, 0, 1, 1,
0.6138435, 0.5904954, -0.2386725, 0.3254902, 0, 1, 1,
0.6148552, 1.758539, -0.4612061, 0.3333333, 0, 1, 1,
0.6257783, 0.7355561, -0.1176608, 0.3372549, 0, 1, 1,
0.6312375, -0.006655199, 2.790567, 0.345098, 0, 1, 1,
0.6327321, -0.1207288, 2.392969, 0.3490196, 0, 1, 1,
0.6343306, 0.326968, 1.030098, 0.3568628, 0, 1, 1,
0.6353631, -0.4061599, 3.29315, 0.3607843, 0, 1, 1,
0.6360781, 2.783765, 1.905301, 0.3686275, 0, 1, 1,
0.6371797, -1.041515, 3.007379, 0.372549, 0, 1, 1,
0.6395613, 0.1898237, 3.956602, 0.3803922, 0, 1, 1,
0.6436086, 0.8349941, 0.6077579, 0.3843137, 0, 1, 1,
0.645008, -0.618004, 1.857932, 0.3921569, 0, 1, 1,
0.6480635, 1.375601, 0.9565212, 0.3960784, 0, 1, 1,
0.6533167, 0.4456239, 0.4693891, 0.4039216, 0, 1, 1,
0.6541371, -1.01096, 2.001727, 0.4117647, 0, 1, 1,
0.6544672, 1.167438, -1.391212, 0.4156863, 0, 1, 1,
0.6549278, 0.6967596, -0.3029955, 0.4235294, 0, 1, 1,
0.6614254, 0.157138, 0.7794233, 0.427451, 0, 1, 1,
0.662253, 2.679297, 1.169434, 0.4352941, 0, 1, 1,
0.6679332, -0.5980855, 2.707392, 0.4392157, 0, 1, 1,
0.6756096, 0.7571974, 0.7501717, 0.4470588, 0, 1, 1,
0.6884307, 1.246926, 0.1949228, 0.4509804, 0, 1, 1,
0.6902779, -0.4400323, 2.989111, 0.4588235, 0, 1, 1,
0.6917896, 0.03212627, 1.101385, 0.4627451, 0, 1, 1,
0.6972301, -0.5102249, 2.837077, 0.4705882, 0, 1, 1,
0.6989813, 1.613302, -0.7419668, 0.4745098, 0, 1, 1,
0.7003611, -0.8743606, 3.043211, 0.4823529, 0, 1, 1,
0.7029289, -0.3886027, 3.336916, 0.4862745, 0, 1, 1,
0.7033016, -0.2386957, 1.971144, 0.4941176, 0, 1, 1,
0.7070382, 1.039567, -0.9718076, 0.5019608, 0, 1, 1,
0.7079661, 1.675328, 1.199685, 0.5058824, 0, 1, 1,
0.7096257, -0.1363781, 1.637544, 0.5137255, 0, 1, 1,
0.7158003, 0.2947752, 2.152562, 0.5176471, 0, 1, 1,
0.7244259, 0.1935796, 2.643904, 0.5254902, 0, 1, 1,
0.7270798, 0.6926034, 2.510941, 0.5294118, 0, 1, 1,
0.7280778, -1.275716, 0.5137241, 0.5372549, 0, 1, 1,
0.7329932, -1.210465, 1.76885, 0.5411765, 0, 1, 1,
0.7361974, 0.7701265, 2.564413, 0.5490196, 0, 1, 1,
0.7373298, 0.8158894, 0.5005628, 0.5529412, 0, 1, 1,
0.7433512, 1.985242, 1.193816, 0.5607843, 0, 1, 1,
0.7457134, -0.9309392, 2.223465, 0.5647059, 0, 1, 1,
0.7459095, -0.6658443, 2.33544, 0.572549, 0, 1, 1,
0.7476273, -0.6457824, 4.234993, 0.5764706, 0, 1, 1,
0.7476401, 0.6229551, 2.151682, 0.5843138, 0, 1, 1,
0.7502237, 0.3441962, -0.8748488, 0.5882353, 0, 1, 1,
0.7535639, -0.9418542, 0.9786664, 0.5960785, 0, 1, 1,
0.7542621, -0.6629554, 3.347652, 0.6039216, 0, 1, 1,
0.7609277, 1.46481, -1.253772, 0.6078432, 0, 1, 1,
0.7621498, 0.922902, 0.3848095, 0.6156863, 0, 1, 1,
0.7672583, 0.08317822, 3.04207, 0.6196079, 0, 1, 1,
0.7728522, -0.165763, 0.9541805, 0.627451, 0, 1, 1,
0.7750741, -2.900089, 3.976256, 0.6313726, 0, 1, 1,
0.7764749, -0.2450696, 2.624088, 0.6392157, 0, 1, 1,
0.7768964, 1.146378, 0.9735453, 0.6431373, 0, 1, 1,
0.7769464, 0.3599782, -0.5247714, 0.6509804, 0, 1, 1,
0.7777814, 0.194732, 1.89107, 0.654902, 0, 1, 1,
0.7779109, 0.2981896, 1.094811, 0.6627451, 0, 1, 1,
0.7786648, 1.798637, -0.2938314, 0.6666667, 0, 1, 1,
0.7794258, -1.068652, 0.913018, 0.6745098, 0, 1, 1,
0.7856517, 0.5579953, 3.534479, 0.6784314, 0, 1, 1,
0.7964451, 0.5966807, 1.327343, 0.6862745, 0, 1, 1,
0.79929, 0.7813401, -0.2774512, 0.6901961, 0, 1, 1,
0.7999113, 0.4360731, 1.224942, 0.6980392, 0, 1, 1,
0.8005081, 0.2735497, 2.185765, 0.7058824, 0, 1, 1,
0.8044037, -0.765561, 2.202491, 0.7098039, 0, 1, 1,
0.8044618, 0.2669289, 3.233949, 0.7176471, 0, 1, 1,
0.80545, -0.7159868, 4.328283, 0.7215686, 0, 1, 1,
0.8073695, 0.4378415, 2.03614, 0.7294118, 0, 1, 1,
0.820929, 1.981493, 1.298606, 0.7333333, 0, 1, 1,
0.8214665, 3.054163, 2.02687, 0.7411765, 0, 1, 1,
0.8238433, 0.8268254, 0.1996812, 0.7450981, 0, 1, 1,
0.8249314, -0.2591724, 1.007355, 0.7529412, 0, 1, 1,
0.8282226, 1.523212, 0.6380326, 0.7568628, 0, 1, 1,
0.8522938, 0.2031424, 1.882148, 0.7647059, 0, 1, 1,
0.8568066, -0.21073, 1.293826, 0.7686275, 0, 1, 1,
0.8581932, 0.4933415, 3.814228, 0.7764706, 0, 1, 1,
0.8583391, 0.01553712, 2.97431, 0.7803922, 0, 1, 1,
0.8589034, -0.4603801, 2.286076, 0.7882353, 0, 1, 1,
0.8618345, -0.2453807, 3.651591, 0.7921569, 0, 1, 1,
0.8653619, 0.7686996, 1.166435, 0.8, 0, 1, 1,
0.8802744, -0.4631895, 0.3109913, 0.8078431, 0, 1, 1,
0.8872978, -0.01589629, 1.188858, 0.8117647, 0, 1, 1,
0.90211, 0.2333675, 2.2081, 0.8196079, 0, 1, 1,
0.9062819, 0.6930003, 0.08721201, 0.8235294, 0, 1, 1,
0.9092762, -1.372019, 2.978004, 0.8313726, 0, 1, 1,
0.9137694, 2.16577, 0.9518624, 0.8352941, 0, 1, 1,
0.9255875, -1.913081, 3.484485, 0.8431373, 0, 1, 1,
0.9355402, -0.6899446, 1.433853, 0.8470588, 0, 1, 1,
0.9375394, 1.687539, 1.362144, 0.854902, 0, 1, 1,
0.9443312, 0.217529, 0.4004223, 0.8588235, 0, 1, 1,
0.9459383, 0.2677687, 2.578637, 0.8666667, 0, 1, 1,
0.9571227, -0.1559936, 1.638715, 0.8705882, 0, 1, 1,
0.9603421, -1.485471, 2.137339, 0.8784314, 0, 1, 1,
0.9641672, 0.3050228, 2.905653, 0.8823529, 0, 1, 1,
0.9650697, -0.5131971, 1.049839, 0.8901961, 0, 1, 1,
0.9666681, -0.3848805, 2.353729, 0.8941177, 0, 1, 1,
0.9681665, 1.263929, 1.165187, 0.9019608, 0, 1, 1,
0.9688236, -1.395111, 2.339157, 0.9098039, 0, 1, 1,
0.981591, 1.323222, 2.483117, 0.9137255, 0, 1, 1,
0.983274, -1.137723, 0.4838796, 0.9215686, 0, 1, 1,
0.9849853, -0.1460769, 2.056185, 0.9254902, 0, 1, 1,
0.9913315, 1.064278, 0.7798545, 0.9333333, 0, 1, 1,
1.000993, -0.6940871, 1.522436, 0.9372549, 0, 1, 1,
1.003602, -0.9058923, 3.119404, 0.945098, 0, 1, 1,
1.007672, -1.05741, 2.496278, 0.9490196, 0, 1, 1,
1.01936, -1.249627, 3.008425, 0.9568627, 0, 1, 1,
1.021916, -0.4811446, 3.696639, 0.9607843, 0, 1, 1,
1.022576, -0.8990653, 2.619776, 0.9686275, 0, 1, 1,
1.02948, -0.04385469, 1.959121, 0.972549, 0, 1, 1,
1.03074, 0.09402104, 1.822095, 0.9803922, 0, 1, 1,
1.033058, 0.5286664, 0.2422057, 0.9843137, 0, 1, 1,
1.033129, -0.5562972, 1.61119, 0.9921569, 0, 1, 1,
1.040854, 1.492861, 1.67593, 0.9960784, 0, 1, 1,
1.041578, 1.550021, 2.69651, 1, 0, 0.9960784, 1,
1.046356, 0.4096924, 2.368494, 1, 0, 0.9882353, 1,
1.049272, 0.8018649, 2.312829, 1, 0, 0.9843137, 1,
1.052336, 0.9210317, 1.594811, 1, 0, 0.9764706, 1,
1.061844, -1.615043, 1.127232, 1, 0, 0.972549, 1,
1.066451, 0.159798, 1.869846, 1, 0, 0.9647059, 1,
1.068226, -0.1101246, 1.352155, 1, 0, 0.9607843, 1,
1.071025, 1.656484, -2.834903, 1, 0, 0.9529412, 1,
1.073091, 1.44624, 1.110733, 1, 0, 0.9490196, 1,
1.076099, 0.5576489, 1.930696, 1, 0, 0.9411765, 1,
1.076657, -0.2779637, 1.553769, 1, 0, 0.9372549, 1,
1.079275, 0.5252326, 1.816802, 1, 0, 0.9294118, 1,
1.079491, -0.2045075, 3.226615, 1, 0, 0.9254902, 1,
1.085988, -0.1476058, 1.682822, 1, 0, 0.9176471, 1,
1.094771, -1.226811, 0.5476213, 1, 0, 0.9137255, 1,
1.101544, -0.6226617, 1.704075, 1, 0, 0.9058824, 1,
1.110818, -0.4396402, 2.510615, 1, 0, 0.9019608, 1,
1.111898, -1.500391, 2.506896, 1, 0, 0.8941177, 1,
1.112235, 0.5985112, -0.07154017, 1, 0, 0.8862745, 1,
1.136625, 0.3345956, 2.969604, 1, 0, 0.8823529, 1,
1.137472, -1.00978, 5.133346, 1, 0, 0.8745098, 1,
1.137607, 1.18938, 1.111692, 1, 0, 0.8705882, 1,
1.140453, -0.324318, 2.658849, 1, 0, 0.8627451, 1,
1.14605, -2.209819, 3.517975, 1, 0, 0.8588235, 1,
1.151798, -0.328969, 1.49158, 1, 0, 0.8509804, 1,
1.163929, -0.6239134, 2.669931, 1, 0, 0.8470588, 1,
1.165558, -0.2698032, 2.31305, 1, 0, 0.8392157, 1,
1.168997, 0.7931667, 1.786702, 1, 0, 0.8352941, 1,
1.175068, -0.4691226, 4.101254, 1, 0, 0.827451, 1,
1.175985, 0.6754016, 2.352427, 1, 0, 0.8235294, 1,
1.178423, -0.6189175, 2.180075, 1, 0, 0.8156863, 1,
1.179967, -0.2158999, 3.435661, 1, 0, 0.8117647, 1,
1.185264, 1.316218, 0.4114002, 1, 0, 0.8039216, 1,
1.192643, -0.2934904, 2.017658, 1, 0, 0.7960784, 1,
1.205375, -1.184847, 3.288812, 1, 0, 0.7921569, 1,
1.208111, -0.1961718, 1.45326, 1, 0, 0.7843137, 1,
1.21157, -0.6910943, 1.676814, 1, 0, 0.7803922, 1,
1.215611, 0.3338282, 2.231695, 1, 0, 0.772549, 1,
1.219574, -0.1471097, 1.180627, 1, 0, 0.7686275, 1,
1.228173, 1.292257, 0.02093172, 1, 0, 0.7607843, 1,
1.230434, -0.6694512, 2.637136, 1, 0, 0.7568628, 1,
1.236173, 0.08303447, 1.916664, 1, 0, 0.7490196, 1,
1.253613, 1.737697, 0.1342555, 1, 0, 0.7450981, 1,
1.259841, 0.3961405, 1.626952, 1, 0, 0.7372549, 1,
1.267706, 1.044853, 1.515948, 1, 0, 0.7333333, 1,
1.275053, 0.08528582, 1.195129, 1, 0, 0.7254902, 1,
1.27562, 1.320147, 1.345824, 1, 0, 0.7215686, 1,
1.276373, 1.442299, 0.003687954, 1, 0, 0.7137255, 1,
1.276536, -1.558146, 1.528156, 1, 0, 0.7098039, 1,
1.283571, -1.016004, 0.03656591, 1, 0, 0.7019608, 1,
1.283731, 0.4703254, 2.97053, 1, 0, 0.6941177, 1,
1.287298, 1.795636, -0.01489497, 1, 0, 0.6901961, 1,
1.289147, -0.9931375, 2.257487, 1, 0, 0.682353, 1,
1.306789, 0.610043, 2.401226, 1, 0, 0.6784314, 1,
1.308127, 0.1674166, 1.956425, 1, 0, 0.6705883, 1,
1.310237, 0.2311394, 1.592866, 1, 0, 0.6666667, 1,
1.314402, 0.01297814, 1.80813, 1, 0, 0.6588235, 1,
1.315954, -1.061145, 3.087372, 1, 0, 0.654902, 1,
1.320912, 0.3779303, 0.2633822, 1, 0, 0.6470588, 1,
1.324058, 1.057285, -0.2220565, 1, 0, 0.6431373, 1,
1.337931, 0.1635501, 1.494042, 1, 0, 0.6352941, 1,
1.351881, -0.2906907, 3.711728, 1, 0, 0.6313726, 1,
1.365254, -2.429889, 2.415224, 1, 0, 0.6235294, 1,
1.365876, 0.7025214, 2.010697, 1, 0, 0.6196079, 1,
1.372296, 0.1307359, 0.9030793, 1, 0, 0.6117647, 1,
1.381054, -0.916899, 2.475046, 1, 0, 0.6078432, 1,
1.381764, 0.2064791, 2.314806, 1, 0, 0.6, 1,
1.384293, 0.5003446, 1.653767, 1, 0, 0.5921569, 1,
1.386834, -0.01179727, 2.013339, 1, 0, 0.5882353, 1,
1.391971, 0.2438454, 0.9125513, 1, 0, 0.5803922, 1,
1.39358, 0.4997581, 2.210832, 1, 0, 0.5764706, 1,
1.419381, -1.599011, 2.086772, 1, 0, 0.5686275, 1,
1.422933, 0.7860098, 2.893193, 1, 0, 0.5647059, 1,
1.432026, 2.35002, 3.283299, 1, 0, 0.5568628, 1,
1.436975, -1.62393, 0.7182938, 1, 0, 0.5529412, 1,
1.438896, -0.6922033, 1.278502, 1, 0, 0.5450981, 1,
1.449239, -0.5569659, 2.264478, 1, 0, 0.5411765, 1,
1.452001, -0.3000041, 1.73531, 1, 0, 0.5333334, 1,
1.4525, -2.09527, 3.969661, 1, 0, 0.5294118, 1,
1.465395, 0.4680834, 1.746746, 1, 0, 0.5215687, 1,
1.473913, 1.371068, 0.6004018, 1, 0, 0.5176471, 1,
1.479069, -0.5209101, 3.350144, 1, 0, 0.509804, 1,
1.494977, 2.69674, 0.6709921, 1, 0, 0.5058824, 1,
1.502925, 0.9385019, 1.382038, 1, 0, 0.4980392, 1,
1.504989, 1.550008, -0.3369227, 1, 0, 0.4901961, 1,
1.506473, -0.1612038, 2.534349, 1, 0, 0.4862745, 1,
1.509786, -1.04494, 2.576415, 1, 0, 0.4784314, 1,
1.513922, -1.517289, 2.163968, 1, 0, 0.4745098, 1,
1.520676, -0.5057344, 1.370241, 1, 0, 0.4666667, 1,
1.525324, -1.389883, 1.986372, 1, 0, 0.4627451, 1,
1.528992, -0.06451271, 1.943108, 1, 0, 0.454902, 1,
1.533457, -1.575119, 1.327852, 1, 0, 0.4509804, 1,
1.545305, -0.7782355, 2.689726, 1, 0, 0.4431373, 1,
1.555991, -1.834886, 4.034374, 1, 0, 0.4392157, 1,
1.579969, -1.560574, 4.380721, 1, 0, 0.4313726, 1,
1.581736, 0.4843183, 1.850711, 1, 0, 0.427451, 1,
1.582346, 0.2512985, 1.775589, 1, 0, 0.4196078, 1,
1.582533, 1.681137, 1.036277, 1, 0, 0.4156863, 1,
1.584616, 0.172108, 0.5116385, 1, 0, 0.4078431, 1,
1.588852, -1.026165, 2.621289, 1, 0, 0.4039216, 1,
1.58978, -1.56821, 3.133846, 1, 0, 0.3960784, 1,
1.595321, 0.9079211, -0.2633056, 1, 0, 0.3882353, 1,
1.614991, -0.2329169, 1.565463, 1, 0, 0.3843137, 1,
1.619117, -2.19732, 3.235188, 1, 0, 0.3764706, 1,
1.620967, -0.07308545, 2.21159, 1, 0, 0.372549, 1,
1.621584, -0.6584345, 3.046098, 1, 0, 0.3647059, 1,
1.624265, 0.6506239, 3.131993, 1, 0, 0.3607843, 1,
1.629244, -0.6365848, 2.567437, 1, 0, 0.3529412, 1,
1.639113, 0.07980329, 1.48866, 1, 0, 0.3490196, 1,
1.656968, -2.550352, 1.454886, 1, 0, 0.3411765, 1,
1.667342, 1.193915, 1.827235, 1, 0, 0.3372549, 1,
1.68369, -1.343159, 2.12322, 1, 0, 0.3294118, 1,
1.687528, 0.1253516, 0.8693507, 1, 0, 0.3254902, 1,
1.691584, 1.725852, -0.4852278, 1, 0, 0.3176471, 1,
1.701367, 1.419217, 0.6212217, 1, 0, 0.3137255, 1,
1.705108, 0.2727706, 1.401179, 1, 0, 0.3058824, 1,
1.741007, 1.920091, 0.2194119, 1, 0, 0.2980392, 1,
1.742767, -0.1246153, 1.288964, 1, 0, 0.2941177, 1,
1.749119, 0.09717151, 2.275901, 1, 0, 0.2862745, 1,
1.752023, 1.807189, -0.2257964, 1, 0, 0.282353, 1,
1.775083, 0.848039, 0.3757098, 1, 0, 0.2745098, 1,
1.785737, 0.7155364, 0.1555079, 1, 0, 0.2705882, 1,
1.793115, 1.441508, 1.81572, 1, 0, 0.2627451, 1,
1.805233, 0.3215925, 3.090098, 1, 0, 0.2588235, 1,
1.823348, -0.3605895, 1.820404, 1, 0, 0.2509804, 1,
1.836859, -1.682299, 0.746204, 1, 0, 0.2470588, 1,
1.851123, 1.809065, 0.5758902, 1, 0, 0.2392157, 1,
1.852483, -0.1031349, 1.021207, 1, 0, 0.2352941, 1,
1.883316, 0.25141, 1.969445, 1, 0, 0.227451, 1,
1.887814, 0.4868446, 0.2733244, 1, 0, 0.2235294, 1,
1.93381, 2.455678, 0.5527591, 1, 0, 0.2156863, 1,
1.939744, -0.1433477, 1.313926, 1, 0, 0.2117647, 1,
1.941301, 0.9793948, 2.542268, 1, 0, 0.2039216, 1,
1.944702, -1.466869, 1.33611, 1, 0, 0.1960784, 1,
1.945439, 0.4661887, 1.010814, 1, 0, 0.1921569, 1,
1.992693, -0.9215795, 2.957544, 1, 0, 0.1843137, 1,
2.019476, -1.281694, 4.239461, 1, 0, 0.1803922, 1,
2.086343, -0.6055774, 1.447576, 1, 0, 0.172549, 1,
2.0977, 0.2396002, 0.7187114, 1, 0, 0.1686275, 1,
2.108945, -1.176093, 2.744148, 1, 0, 0.1607843, 1,
2.109718, 0.7660156, 2.156753, 1, 0, 0.1568628, 1,
2.136209, -2.324584, 4.567718, 1, 0, 0.1490196, 1,
2.148647, 0.7125367, 1.001765, 1, 0, 0.145098, 1,
2.164298, -1.736806, 2.557512, 1, 0, 0.1372549, 1,
2.170409, 0.1231729, 2.10412, 1, 0, 0.1333333, 1,
2.172033, -0.4501591, 0.7001495, 1, 0, 0.1254902, 1,
2.176975, -0.9872885, 2.143971, 1, 0, 0.1215686, 1,
2.180748, 0.03258865, 1.490437, 1, 0, 0.1137255, 1,
2.216629, 0.07112235, 1.789091, 1, 0, 0.1098039, 1,
2.217416, -2.129836, 2.447074, 1, 0, 0.1019608, 1,
2.259329, 1.296188, 0.2002473, 1, 0, 0.09411765, 1,
2.260882, -0.2086636, 2.188081, 1, 0, 0.09019608, 1,
2.363558, -0.9804938, 2.47201, 1, 0, 0.08235294, 1,
2.40183, -1.262521, 2.964307, 1, 0, 0.07843138, 1,
2.448489, 1.137451, 0.5262827, 1, 0, 0.07058824, 1,
2.529839, 0.04568623, 2.266028, 1, 0, 0.06666667, 1,
2.610679, 1.400106, 2.594374, 1, 0, 0.05882353, 1,
2.634174, 0.3384162, 1.30937, 1, 0, 0.05490196, 1,
2.635028, -0.07722755, 2.731059, 1, 0, 0.04705882, 1,
2.676574, -1.208238, 1.590735, 1, 0, 0.04313726, 1,
2.782873, -0.2885957, 2.482111, 1, 0, 0.03529412, 1,
2.783984, -0.3626356, 0.78317, 1, 0, 0.03137255, 1,
2.804931, -0.2637053, 1.212048, 1, 0, 0.02352941, 1,
2.990359, 0.3437751, 2.364799, 1, 0, 0.01960784, 1,
3.063291, 0.7166995, 2.10904, 1, 0, 0.01176471, 1,
3.08337, -1.17453, 2.933885, 1, 0, 0.007843138, 1
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
0.1444801, -5.02094, -7.786278, 0, -0.5, 0.5, 0.5,
0.1444801, -5.02094, -7.786278, 1, -0.5, 0.5, 0.5,
0.1444801, -5.02094, -7.786278, 1, 1.5, 0.5, 0.5,
0.1444801, -5.02094, -7.786278, 0, 1.5, 0.5, 0.5
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
-3.790694, -0.08759069, -7.786278, 0, -0.5, 0.5, 0.5,
-3.790694, -0.08759069, -7.786278, 1, -0.5, 0.5, 0.5,
-3.790694, -0.08759069, -7.786278, 1, 1.5, 0.5, 0.5,
-3.790694, -0.08759069, -7.786278, 0, 1.5, 0.5, 0.5
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
-3.790694, -5.02094, -0.3302233, 0, -0.5, 0.5, 0.5,
-3.790694, -5.02094, -0.3302233, 1, -0.5, 0.5, 0.5,
-3.790694, -5.02094, -0.3302233, 1, 1.5, 0.5, 0.5,
-3.790694, -5.02094, -0.3302233, 0, 1.5, 0.5, 0.5
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
-2, -3.882475, -6.06565,
3, -3.882475, -6.06565,
-2, -3.882475, -6.06565,
-2, -4.072219, -6.352421,
-1, -3.882475, -6.06565,
-1, -4.072219, -6.352421,
0, -3.882475, -6.06565,
0, -4.072219, -6.352421,
1, -3.882475, -6.06565,
1, -4.072219, -6.352421,
2, -3.882475, -6.06565,
2, -4.072219, -6.352421,
3, -3.882475, -6.06565,
3, -4.072219, -6.352421
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
-2, -4.451708, -6.925964, 0, -0.5, 0.5, 0.5,
-2, -4.451708, -6.925964, 1, -0.5, 0.5, 0.5,
-2, -4.451708, -6.925964, 1, 1.5, 0.5, 0.5,
-2, -4.451708, -6.925964, 0, 1.5, 0.5, 0.5,
-1, -4.451708, -6.925964, 0, -0.5, 0.5, 0.5,
-1, -4.451708, -6.925964, 1, -0.5, 0.5, 0.5,
-1, -4.451708, -6.925964, 1, 1.5, 0.5, 0.5,
-1, -4.451708, -6.925964, 0, 1.5, 0.5, 0.5,
0, -4.451708, -6.925964, 0, -0.5, 0.5, 0.5,
0, -4.451708, -6.925964, 1, -0.5, 0.5, 0.5,
0, -4.451708, -6.925964, 1, 1.5, 0.5, 0.5,
0, -4.451708, -6.925964, 0, 1.5, 0.5, 0.5,
1, -4.451708, -6.925964, 0, -0.5, 0.5, 0.5,
1, -4.451708, -6.925964, 1, -0.5, 0.5, 0.5,
1, -4.451708, -6.925964, 1, 1.5, 0.5, 0.5,
1, -4.451708, -6.925964, 0, 1.5, 0.5, 0.5,
2, -4.451708, -6.925964, 0, -0.5, 0.5, 0.5,
2, -4.451708, -6.925964, 1, -0.5, 0.5, 0.5,
2, -4.451708, -6.925964, 1, 1.5, 0.5, 0.5,
2, -4.451708, -6.925964, 0, 1.5, 0.5, 0.5,
3, -4.451708, -6.925964, 0, -0.5, 0.5, 0.5,
3, -4.451708, -6.925964, 1, -0.5, 0.5, 0.5,
3, -4.451708, -6.925964, 1, 1.5, 0.5, 0.5,
3, -4.451708, -6.925964, 0, 1.5, 0.5, 0.5
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
-2.882576, -2, -6.06565,
-2.882576, 2, -6.06565,
-2.882576, -2, -6.06565,
-3.033929, -2, -6.352421,
-2.882576, 0, -6.06565,
-3.033929, 0, -6.352421,
-2.882576, 2, -6.06565,
-3.033929, 2, -6.352421
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
-3.336635, -2, -6.925964, 0, -0.5, 0.5, 0.5,
-3.336635, -2, -6.925964, 1, -0.5, 0.5, 0.5,
-3.336635, -2, -6.925964, 1, 1.5, 0.5, 0.5,
-3.336635, -2, -6.925964, 0, 1.5, 0.5, 0.5,
-3.336635, 0, -6.925964, 0, -0.5, 0.5, 0.5,
-3.336635, 0, -6.925964, 1, -0.5, 0.5, 0.5,
-3.336635, 0, -6.925964, 1, 1.5, 0.5, 0.5,
-3.336635, 0, -6.925964, 0, 1.5, 0.5, 0.5,
-3.336635, 2, -6.925964, 0, -0.5, 0.5, 0.5,
-3.336635, 2, -6.925964, 1, -0.5, 0.5, 0.5,
-3.336635, 2, -6.925964, 1, 1.5, 0.5, 0.5,
-3.336635, 2, -6.925964, 0, 1.5, 0.5, 0.5
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
-2.882576, -3.882475, -4,
-2.882576, -3.882475, 4,
-2.882576, -3.882475, -4,
-3.033929, -4.072219, -4,
-2.882576, -3.882475, -2,
-3.033929, -4.072219, -2,
-2.882576, -3.882475, 0,
-3.033929, -4.072219, 0,
-2.882576, -3.882475, 2,
-3.033929, -4.072219, 2,
-2.882576, -3.882475, 4,
-3.033929, -4.072219, 4
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
-3.336635, -4.451708, -4, 0, -0.5, 0.5, 0.5,
-3.336635, -4.451708, -4, 1, -0.5, 0.5, 0.5,
-3.336635, -4.451708, -4, 1, 1.5, 0.5, 0.5,
-3.336635, -4.451708, -4, 0, 1.5, 0.5, 0.5,
-3.336635, -4.451708, -2, 0, -0.5, 0.5, 0.5,
-3.336635, -4.451708, -2, 1, -0.5, 0.5, 0.5,
-3.336635, -4.451708, -2, 1, 1.5, 0.5, 0.5,
-3.336635, -4.451708, -2, 0, 1.5, 0.5, 0.5,
-3.336635, -4.451708, 0, 0, -0.5, 0.5, 0.5,
-3.336635, -4.451708, 0, 1, -0.5, 0.5, 0.5,
-3.336635, -4.451708, 0, 1, 1.5, 0.5, 0.5,
-3.336635, -4.451708, 0, 0, 1.5, 0.5, 0.5,
-3.336635, -4.451708, 2, 0, -0.5, 0.5, 0.5,
-3.336635, -4.451708, 2, 1, -0.5, 0.5, 0.5,
-3.336635, -4.451708, 2, 1, 1.5, 0.5, 0.5,
-3.336635, -4.451708, 2, 0, 1.5, 0.5, 0.5,
-3.336635, -4.451708, 4, 0, -0.5, 0.5, 0.5,
-3.336635, -4.451708, 4, 1, -0.5, 0.5, 0.5,
-3.336635, -4.451708, 4, 1, 1.5, 0.5, 0.5,
-3.336635, -4.451708, 4, 0, 1.5, 0.5, 0.5
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
-2.882576, -3.882475, -6.06565,
-2.882576, 3.707294, -6.06565,
-2.882576, -3.882475, 5.405203,
-2.882576, 3.707294, 5.405203,
-2.882576, -3.882475, -6.06565,
-2.882576, -3.882475, 5.405203,
-2.882576, 3.707294, -6.06565,
-2.882576, 3.707294, 5.405203,
-2.882576, -3.882475, -6.06565,
3.171537, -3.882475, -6.06565,
-2.882576, -3.882475, 5.405203,
3.171537, -3.882475, 5.405203,
-2.882576, 3.707294, -6.06565,
3.171537, 3.707294, -6.06565,
-2.882576, 3.707294, 5.405203,
3.171537, 3.707294, 5.405203,
3.171537, -3.882475, -6.06565,
3.171537, 3.707294, -6.06565,
3.171537, -3.882475, 5.405203,
3.171537, 3.707294, 5.405203,
3.171537, -3.882475, -6.06565,
3.171537, -3.882475, 5.405203,
3.171537, 3.707294, -6.06565,
3.171537, 3.707294, 5.405203
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
var radius = 8.024599;
var distance = 35.70235;
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
mvMatrix.translate( -0.1444801, 0.08759069, 0.3302233 );
mvMatrix.scale( 1.433134, 1.143164, 0.7563826 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70235);
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
clodinafop-propargyl<-read.table("clodinafop-propargyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clodinafop-propargyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'clodinafop' not found
```

```r
y<-clodinafop-propargyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'clodinafop' not found
```

```r
z<-clodinafop-propargyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'clodinafop' not found
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
-2.79441, -0.5823007, -1.425119, 0, 0, 1, 1, 1,
-2.735457, 0.2050092, -1.21206, 1, 0, 0, 1, 1,
-2.714563, 0.3041261, -2.016242, 1, 0, 0, 1, 1,
-2.665137, 0.7589078, 1.348412, 1, 0, 0, 1, 1,
-2.535213, -1.151294, -2.812836, 1, 0, 0, 1, 1,
-2.512314, 0.7721468, -0.6575344, 1, 0, 0, 1, 1,
-2.470532, -0.341498, -1.139205, 0, 0, 0, 1, 1,
-2.403079, -0.9254037, -2.753989, 0, 0, 0, 1, 1,
-2.402415, -0.6387555, -2.54368, 0, 0, 0, 1, 1,
-2.384099, -0.1239672, -1.897836, 0, 0, 0, 1, 1,
-2.364015, -0.5221178, -1.893681, 0, 0, 0, 1, 1,
-2.315923, 0.08883466, -1.671717, 0, 0, 0, 1, 1,
-2.298267, 0.1617621, -1.55409, 0, 0, 0, 1, 1,
-2.297405, -1.482234, -2.763376, 1, 1, 1, 1, 1,
-2.187619, -0.6668512, -1.604583, 1, 1, 1, 1, 1,
-2.162659, -1.055315, -0.6954086, 1, 1, 1, 1, 1,
-2.153877, 0.3020939, -1.91093, 1, 1, 1, 1, 1,
-2.14547, 0.6800832, -0.05882124, 1, 1, 1, 1, 1,
-2.143382, 0.4614322, -0.258646, 1, 1, 1, 1, 1,
-2.113762, -2.032302, -4.145812, 1, 1, 1, 1, 1,
-2.108935, -0.5688541, -3.36991, 1, 1, 1, 1, 1,
-2.04922, -1.275585, -1.567328, 1, 1, 1, 1, 1,
-2.032378, -0.1373487, -4.127935, 1, 1, 1, 1, 1,
-2.025553, -1.035251, -1.671763, 1, 1, 1, 1, 1,
-2.022408, -0.6450641, -1.084512, 1, 1, 1, 1, 1,
-2.020234, 1.350358, -0.2822444, 1, 1, 1, 1, 1,
-1.992094, 1.420254, -1.847213, 1, 1, 1, 1, 1,
-1.929757, 0.7707236, -1.243597, 1, 1, 1, 1, 1,
-1.910112, -0.4283792, -2.536917, 0, 0, 1, 1, 1,
-1.867479, 0.0252197, 0.5581447, 1, 0, 0, 1, 1,
-1.867401, 0.3619727, -2.592918, 1, 0, 0, 1, 1,
-1.866971, -0.09227969, -1.537432, 1, 0, 0, 1, 1,
-1.857605, 0.4148673, -0.9342006, 1, 0, 0, 1, 1,
-1.851623, 0.7173083, -2.902049, 1, 0, 0, 1, 1,
-1.838011, 0.1866925, -0.8244942, 0, 0, 0, 1, 1,
-1.821734, -0.5499685, -0.6497158, 0, 0, 0, 1, 1,
-1.821147, 2.171224, -1.230563, 0, 0, 0, 1, 1,
-1.793512, -0.8405114, -2.45385, 0, 0, 0, 1, 1,
-1.790279, 1.423686, -0.7206302, 0, 0, 0, 1, 1,
-1.780836, -0.8954234, -2.805005, 0, 0, 0, 1, 1,
-1.777503, 0.5282325, -1.324635, 0, 0, 0, 1, 1,
-1.770216, 0.2399176, -2.755497, 1, 1, 1, 1, 1,
-1.765123, -1.02591, -1.937779, 1, 1, 1, 1, 1,
-1.761319, -1.13333, -2.007061, 1, 1, 1, 1, 1,
-1.751527, 1.20208, 0.1099258, 1, 1, 1, 1, 1,
-1.73597, 0.5102932, 1.004813, 1, 1, 1, 1, 1,
-1.735946, -0.03294546, -0.4162306, 1, 1, 1, 1, 1,
-1.730157, -0.5638016, -3.550109, 1, 1, 1, 1, 1,
-1.716496, 0.1632791, -1.436288, 1, 1, 1, 1, 1,
-1.694189, -0.2766342, -2.16624, 1, 1, 1, 1, 1,
-1.685006, -1.338637, -1.907573, 1, 1, 1, 1, 1,
-1.682667, -0.2533531, -1.396821, 1, 1, 1, 1, 1,
-1.671721, -0.6968029, -1.035291, 1, 1, 1, 1, 1,
-1.671216, 1.036707, -1.198684, 1, 1, 1, 1, 1,
-1.665865, -0.968772, -1.247452, 1, 1, 1, 1, 1,
-1.65813, 0.6717693, -0.7966719, 1, 1, 1, 1, 1,
-1.647236, 1.049467, 0.916936, 0, 0, 1, 1, 1,
-1.6012, -0.2303957, -1.988083, 1, 0, 0, 1, 1,
-1.590985, -0.4054997, -2.424546, 1, 0, 0, 1, 1,
-1.586527, 0.4375728, -0.6785512, 1, 0, 0, 1, 1,
-1.549594, -0.8527296, -1.368452, 1, 0, 0, 1, 1,
-1.547036, -1.112049, -2.105564, 1, 0, 0, 1, 1,
-1.540172, -2.033118, -2.262492, 0, 0, 0, 1, 1,
-1.530455, 0.8986109, -1.5483, 0, 0, 0, 1, 1,
-1.518305, -0.3115999, -3.27302, 0, 0, 0, 1, 1,
-1.509775, 0.9413062, 0.3637175, 0, 0, 0, 1, 1,
-1.506461, -0.3525171, -2.80671, 0, 0, 0, 1, 1,
-1.506389, 1.244655, -0.7953732, 0, 0, 0, 1, 1,
-1.491132, 1.468647, -0.6530932, 0, 0, 0, 1, 1,
-1.485513, 0.3649281, -0.9924635, 1, 1, 1, 1, 1,
-1.483546, 1.00272, -0.2946758, 1, 1, 1, 1, 1,
-1.483225, 1.075961, -0.2962599, 1, 1, 1, 1, 1,
-1.453816, -0.08717852, -1.812792, 1, 1, 1, 1, 1,
-1.451536, -0.1343206, -1.976349, 1, 1, 1, 1, 1,
-1.450207, 1.849459, -1.784087, 1, 1, 1, 1, 1,
-1.420851, -0.9454859, -2.361065, 1, 1, 1, 1, 1,
-1.418362, -0.3181334, -1.40417, 1, 1, 1, 1, 1,
-1.417926, 1.321409, 0.4017552, 1, 1, 1, 1, 1,
-1.417581, -1.108942, -4.239641, 1, 1, 1, 1, 1,
-1.405805, 1.336355, -0.813489, 1, 1, 1, 1, 1,
-1.397509, -0.5594639, -1.819499, 1, 1, 1, 1, 1,
-1.395464, 0.7541595, -1.495031, 1, 1, 1, 1, 1,
-1.384447, 0.004234353, -2.165172, 1, 1, 1, 1, 1,
-1.381307, 0.4435444, -2.089049, 1, 1, 1, 1, 1,
-1.377478, -0.8677002, -1.946697, 0, 0, 1, 1, 1,
-1.364275, -3.488637, -4.711481, 1, 0, 0, 1, 1,
-1.349824, 1.003771, -0.8140536, 1, 0, 0, 1, 1,
-1.347973, -0.4276703, -3.91165, 1, 0, 0, 1, 1,
-1.335223, 0.9614299, -0.1303999, 1, 0, 0, 1, 1,
-1.331507, -0.2234038, -1.356079, 1, 0, 0, 1, 1,
-1.315436, -0.8638003, -2.622672, 0, 0, 0, 1, 1,
-1.299605, 1.189758, -0.7953256, 0, 0, 0, 1, 1,
-1.286225, 0.7945833, -0.5037866, 0, 0, 0, 1, 1,
-1.277337, -0.6162222, -2.085636, 0, 0, 0, 1, 1,
-1.276214, 0.2880932, -1.533532, 0, 0, 0, 1, 1,
-1.272083, 0.02351495, -0.6180936, 0, 0, 0, 1, 1,
-1.271358, -0.08362904, -1.091988, 0, 0, 0, 1, 1,
-1.270365, 0.04826118, -1.913709, 1, 1, 1, 1, 1,
-1.268632, 0.9217857, -1.28973, 1, 1, 1, 1, 1,
-1.265334, 0.7141488, 0.151783, 1, 1, 1, 1, 1,
-1.251496, -0.4011034, -1.02817, 1, 1, 1, 1, 1,
-1.236085, -1.502035, -2.004366, 1, 1, 1, 1, 1,
-1.231966, -0.8001587, -1.821751, 1, 1, 1, 1, 1,
-1.228118, -0.9524255, -2.894289, 1, 1, 1, 1, 1,
-1.224533, 1.284706, -2.317244, 1, 1, 1, 1, 1,
-1.215253, 0.6718365, -1.73839, 1, 1, 1, 1, 1,
-1.213757, 0.1620924, -3.097394, 1, 1, 1, 1, 1,
-1.200244, 0.1737546, -0.8382947, 1, 1, 1, 1, 1,
-1.192047, -1.656506, -3.239551, 1, 1, 1, 1, 1,
-1.188846, 0.7457473, 0.06698128, 1, 1, 1, 1, 1,
-1.188489, 1.244202, -1.457074, 1, 1, 1, 1, 1,
-1.187687, -0.5610796, -2.417474, 1, 1, 1, 1, 1,
-1.179972, -0.08052848, -2.066426, 0, 0, 1, 1, 1,
-1.176871, -0.8105323, -2.112473, 1, 0, 0, 1, 1,
-1.175852, -1.486426, -3.209305, 1, 0, 0, 1, 1,
-1.171361, -0.09489567, -1.764985, 1, 0, 0, 1, 1,
-1.169553, 0.02600415, -0.9331038, 1, 0, 0, 1, 1,
-1.16894, -0.1954746, -1.406447, 1, 0, 0, 1, 1,
-1.163497, -0.01558238, -1.432379, 0, 0, 0, 1, 1,
-1.16331, -0.01371957, -1.084042, 0, 0, 0, 1, 1,
-1.153999, -2.963487, -2.269932, 0, 0, 0, 1, 1,
-1.14298, -0.06368505, -0.9640742, 0, 0, 0, 1, 1,
-1.133254, 2.360786, -1.56511, 0, 0, 0, 1, 1,
-1.130004, -0.288804, -1.554593, 0, 0, 0, 1, 1,
-1.114511, -1.57895, -4.199101, 0, 0, 0, 1, 1,
-1.11054, -0.1801431, -3.37267, 1, 1, 1, 1, 1,
-1.102256, -1.182611, -2.962976, 1, 1, 1, 1, 1,
-1.102243, 1.242096, -0.5713391, 1, 1, 1, 1, 1,
-1.077512, 1.186473, -0.7212689, 1, 1, 1, 1, 1,
-1.074866, 0.3682587, -1.030064, 1, 1, 1, 1, 1,
-1.072834, -1.332512, -2.88629, 1, 1, 1, 1, 1,
-1.071378, -1.401167, -2.345166, 1, 1, 1, 1, 1,
-1.063902, -1.332785, -3.650635, 1, 1, 1, 1, 1,
-1.063104, 0.280367, -0.5304171, 1, 1, 1, 1, 1,
-1.051095, -2.25281, -2.483845, 1, 1, 1, 1, 1,
-1.047777, -0.2643633, -2.228801, 1, 1, 1, 1, 1,
-1.046045, -0.1840633, -2.577338, 1, 1, 1, 1, 1,
-1.044442, 0.6709677, 0.1252041, 1, 1, 1, 1, 1,
-1.03885, -0.2571826, -3.155768, 1, 1, 1, 1, 1,
-1.03688, -0.07825922, -1.468982, 1, 1, 1, 1, 1,
-1.036657, -0.7076504, -4.5594, 0, 0, 1, 1, 1,
-1.033324, 0.02870988, -1.33483, 1, 0, 0, 1, 1,
-1.028016, -2.756215, -4.435814, 1, 0, 0, 1, 1,
-1.024567, 1.247222, -2.437652, 1, 0, 0, 1, 1,
-1.022768, -0.1677163, -2.145769, 1, 0, 0, 1, 1,
-1.021146, 1.143905, 0.6018173, 1, 0, 0, 1, 1,
-1.016551, -1.690721, -3.089349, 0, 0, 0, 1, 1,
-1.012465, -0.2625739, -1.060389, 0, 0, 0, 1, 1,
-1.00868, 0.6737154, -0.8522493, 0, 0, 0, 1, 1,
-1.002859, 0.01626388, -1.244211, 0, 0, 0, 1, 1,
-1.001919, 1.012963, 0.00228088, 0, 0, 0, 1, 1,
-1.00052, 0.1831751, -2.082421, 0, 0, 0, 1, 1,
-0.9923097, 1.648496, 0.1892712, 0, 0, 0, 1, 1,
-0.9820041, -0.02830643, -0.3590957, 1, 1, 1, 1, 1,
-0.9776667, -0.3402952, -3.765354, 1, 1, 1, 1, 1,
-0.9697005, -1.541324, -2.328081, 1, 1, 1, 1, 1,
-0.969371, 0.3955173, -1.061714, 1, 1, 1, 1, 1,
-0.9535412, 0.7585461, -1.182073, 1, 1, 1, 1, 1,
-0.9525209, 1.475919, 0.6470934, 1, 1, 1, 1, 1,
-0.9518639, -0.655728, -1.716134, 1, 1, 1, 1, 1,
-0.951267, 0.364364, -2.004785, 1, 1, 1, 1, 1,
-0.9498031, -0.363479, -1.861879, 1, 1, 1, 1, 1,
-0.9310814, 1.955959, -0.4777295, 1, 1, 1, 1, 1,
-0.9188823, -0.1635565, -0.8397401, 1, 1, 1, 1, 1,
-0.9149193, 0.01004893, -2.93482, 1, 1, 1, 1, 1,
-0.9131594, -0.6318614, -1.16905, 1, 1, 1, 1, 1,
-0.9075492, -0.8676937, -3.233612, 1, 1, 1, 1, 1,
-0.9048385, 0.5661488, -1.933016, 1, 1, 1, 1, 1,
-0.9030773, -0.6141444, -3.476117, 0, 0, 1, 1, 1,
-0.8946311, 0.8618132, -0.9662124, 1, 0, 0, 1, 1,
-0.8932267, -1.696942, -3.088106, 1, 0, 0, 1, 1,
-0.8931928, 0.3286412, -0.06922233, 1, 0, 0, 1, 1,
-0.892006, 1.433474, -1.02873, 1, 0, 0, 1, 1,
-0.891344, 1.504878, -1.002662, 1, 0, 0, 1, 1,
-0.8897148, -0.467457, -0.7659401, 0, 0, 0, 1, 1,
-0.8896892, -0.6843228, -2.200267, 0, 0, 0, 1, 1,
-0.8824574, -0.7777012, -2.19359, 0, 0, 0, 1, 1,
-0.8791326, -1.985868, -2.65489, 0, 0, 0, 1, 1,
-0.8772618, 1.645409, 0.1154859, 0, 0, 0, 1, 1,
-0.8749568, 1.156038, 0.408922, 0, 0, 0, 1, 1,
-0.8737783, 1.06034, -0.1909153, 0, 0, 0, 1, 1,
-0.8727026, 0.5063952, -0.08887138, 1, 1, 1, 1, 1,
-0.8717947, -0.8258983, -0.7450193, 1, 1, 1, 1, 1,
-0.8713812, -0.1742404, -1.690356, 1, 1, 1, 1, 1,
-0.8696794, 0.3311632, -1.387249, 1, 1, 1, 1, 1,
-0.8681145, 0.9429669, 0.6195447, 1, 1, 1, 1, 1,
-0.8633344, 0.2615796, -0.6244513, 1, 1, 1, 1, 1,
-0.8597676, -1.725273, -3.255177, 1, 1, 1, 1, 1,
-0.8583604, 0.8281337, 0.3040015, 1, 1, 1, 1, 1,
-0.8577651, 2.153274, -2.138398, 1, 1, 1, 1, 1,
-0.856184, -0.2991021, -2.180329, 1, 1, 1, 1, 1,
-0.8528883, 0.4249522, -3.287948, 1, 1, 1, 1, 1,
-0.8527005, 0.2104016, -1.916353, 1, 1, 1, 1, 1,
-0.8515518, 0.5750837, -2.106969, 1, 1, 1, 1, 1,
-0.8512912, -1.33956, -2.775075, 1, 1, 1, 1, 1,
-0.8428249, 0.6937281, -0.5200223, 1, 1, 1, 1, 1,
-0.8421967, -0.7248116, -2.468804, 0, 0, 1, 1, 1,
-0.8405863, -0.4057997, -0.5350902, 1, 0, 0, 1, 1,
-0.8379955, 0.4050414, -1.766354, 1, 0, 0, 1, 1,
-0.8378102, -1.029631, -0.8933296, 1, 0, 0, 1, 1,
-0.8361333, 0.09862367, -2.030962, 1, 0, 0, 1, 1,
-0.8357183, -0.5803531, -3.361214, 1, 0, 0, 1, 1,
-0.8244745, -1.704897, -4.822815, 0, 0, 0, 1, 1,
-0.8232546, 0.0006526509, -2.73463, 0, 0, 0, 1, 1,
-0.8227305, 1.100742, -1.564655, 0, 0, 0, 1, 1,
-0.8189065, -0.04542456, -2.279604, 0, 0, 0, 1, 1,
-0.8141343, -0.02511985, -1.986001, 0, 0, 0, 1, 1,
-0.8135996, -0.6754999, -2.277442, 0, 0, 0, 1, 1,
-0.8044192, -2.159714, -3.145681, 0, 0, 0, 1, 1,
-0.8040851, -0.5002974, -2.07884, 1, 1, 1, 1, 1,
-0.7992265, -0.8107032, -1.760254, 1, 1, 1, 1, 1,
-0.7981015, 0.4777461, -2.074731, 1, 1, 1, 1, 1,
-0.7964045, 0.4291562, -1.898164, 1, 1, 1, 1, 1,
-0.7962451, 1.351681, 0.005836289, 1, 1, 1, 1, 1,
-0.7901815, -0.2673008, -2.037736, 1, 1, 1, 1, 1,
-0.789332, 1.215643, -1.561221, 1, 1, 1, 1, 1,
-0.7887261, -0.5340562, -1.321908, 1, 1, 1, 1, 1,
-0.7877309, -0.5524888, -3.587057, 1, 1, 1, 1, 1,
-0.7865453, -0.2149191, -1.386166, 1, 1, 1, 1, 1,
-0.775456, 0.315269, -1.021987, 1, 1, 1, 1, 1,
-0.7746843, -0.2712981, -0.9552075, 1, 1, 1, 1, 1,
-0.7727064, -0.6701003, -2.188487, 1, 1, 1, 1, 1,
-0.7707697, -0.6871353, -1.171723, 1, 1, 1, 1, 1,
-0.7694883, -0.5647115, -3.493224, 1, 1, 1, 1, 1,
-0.766652, 1.158794, -0.6280292, 0, 0, 1, 1, 1,
-0.7650666, -1.213947, -1.927938, 1, 0, 0, 1, 1,
-0.7640633, 0.5318899, -2.008314, 1, 0, 0, 1, 1,
-0.7610169, 0.2004873, -1.735962, 1, 0, 0, 1, 1,
-0.7592074, -0.5742692, -3.002979, 1, 0, 0, 1, 1,
-0.7571635, 0.7902679, 0.5211151, 1, 0, 0, 1, 1,
-0.7561604, 0.495345, -2.48689, 0, 0, 0, 1, 1,
-0.7547001, -1.017626, -4.094485, 0, 0, 0, 1, 1,
-0.7493145, 0.7183431, -1.675949, 0, 0, 0, 1, 1,
-0.7492055, 1.016735, -1.0212, 0, 0, 0, 1, 1,
-0.7378287, -0.1461741, 0.07769807, 0, 0, 0, 1, 1,
-0.7367218, -0.08416394, -2.725641, 0, 0, 0, 1, 1,
-0.7302434, -0.6766267, -2.946262, 0, 0, 0, 1, 1,
-0.7234511, -0.2106625, -1.78491, 1, 1, 1, 1, 1,
-0.7207125, -1.028316, -1.973201, 1, 1, 1, 1, 1,
-0.7203559, 0.3400247, 0.7429075, 1, 1, 1, 1, 1,
-0.7195376, 0.4913657, 0.773294, 1, 1, 1, 1, 1,
-0.7171509, -0.985076, -2.295051, 1, 1, 1, 1, 1,
-0.7040108, 0.362293, -0.2577377, 1, 1, 1, 1, 1,
-0.7027357, -0.1371647, -3.595141, 1, 1, 1, 1, 1,
-0.7013316, -0.06404855, -2.817841, 1, 1, 1, 1, 1,
-0.6969969, 1.137618, -0.7851816, 1, 1, 1, 1, 1,
-0.6922435, 0.2949374, -0.374434, 1, 1, 1, 1, 1,
-0.687212, 0.6404976, -2.242841, 1, 1, 1, 1, 1,
-0.6795771, 0.4188886, -0.8918764, 1, 1, 1, 1, 1,
-0.6778835, -0.5318421, -2.544546, 1, 1, 1, 1, 1,
-0.6761974, 1.771202, -2.109473, 1, 1, 1, 1, 1,
-0.676169, -0.1382837, -2.524083, 1, 1, 1, 1, 1,
-0.6752707, -0.1942639, -1.40626, 0, 0, 1, 1, 1,
-0.6734198, -0.4151877, -2.90017, 1, 0, 0, 1, 1,
-0.6727521, -0.257122, -3.109841, 1, 0, 0, 1, 1,
-0.668965, -0.7015326, -1.527018, 1, 0, 0, 1, 1,
-0.6687854, -0.9666849, -1.450203, 1, 0, 0, 1, 1,
-0.6657631, 0.6913666, -1.959716, 1, 0, 0, 1, 1,
-0.6596028, -0.4197432, -3.759088, 0, 0, 0, 1, 1,
-0.6562593, -1.667966, -2.276866, 0, 0, 0, 1, 1,
-0.6552559, 0.6047416, 0.2715358, 0, 0, 0, 1, 1,
-0.6550484, 0.9742516, -3.409371, 0, 0, 0, 1, 1,
-0.6509525, -1.39003, -2.243746, 0, 0, 0, 1, 1,
-0.6505452, -0.01987679, -2.337382, 0, 0, 0, 1, 1,
-0.6478344, -1.243748, -1.400419, 0, 0, 0, 1, 1,
-0.6396114, -0.1062492, -2.400541, 1, 1, 1, 1, 1,
-0.6388857, 0.8197485, -1.644614, 1, 1, 1, 1, 1,
-0.6387666, 2.483387, 0.8054661, 1, 1, 1, 1, 1,
-0.6308331, -0.8679165, -4.625977, 1, 1, 1, 1, 1,
-0.62541, 2.667296, -0.1055019, 1, 1, 1, 1, 1,
-0.6232451, 1.990357, -0.7212504, 1, 1, 1, 1, 1,
-0.6212325, -0.7334131, -2.912359, 1, 1, 1, 1, 1,
-0.6209633, -0.3853759, -1.561487, 1, 1, 1, 1, 1,
-0.6194736, -0.3269661, -3.229776, 1, 1, 1, 1, 1,
-0.6147884, -0.8818863, -3.324341, 1, 1, 1, 1, 1,
-0.6144913, -0.5443802, -1.007149, 1, 1, 1, 1, 1,
-0.6129026, -1.195139, -2.571945, 1, 1, 1, 1, 1,
-0.6106941, -0.01382365, -2.50535, 1, 1, 1, 1, 1,
-0.6001165, -0.4665006, -1.774102, 1, 1, 1, 1, 1,
-0.5986124, -0.5327974, -2.448378, 1, 1, 1, 1, 1,
-0.5927978, 0.4072637, -1.06229, 0, 0, 1, 1, 1,
-0.5824792, 1.082751, -1.608324, 1, 0, 0, 1, 1,
-0.5781379, -0.5382283, -2.089472, 1, 0, 0, 1, 1,
-0.5730601, -0.2339759, -1.597767, 1, 0, 0, 1, 1,
-0.5713678, 0.2166695, -1.529519, 1, 0, 0, 1, 1,
-0.5691398, -0.5447198, -3.308975, 1, 0, 0, 1, 1,
-0.5665377, -1.604276, -3.788887, 0, 0, 0, 1, 1,
-0.5661453, 0.3284992, -2.171585, 0, 0, 0, 1, 1,
-0.5657547, -0.1570724, -2.226738, 0, 0, 0, 1, 1,
-0.561676, 0.8865753, 0.5002193, 0, 0, 0, 1, 1,
-0.5616031, 0.6118581, 0.1074552, 0, 0, 0, 1, 1,
-0.5575381, 0.8692013, -1.635921, 0, 0, 0, 1, 1,
-0.5531795, 0.07194492, -1.001867, 0, 0, 0, 1, 1,
-0.5513036, -1.126892, -4.108964, 1, 1, 1, 1, 1,
-0.550566, -0.6544915, -4.227316, 1, 1, 1, 1, 1,
-0.5503837, 1.203541, -0.1129875, 1, 1, 1, 1, 1,
-0.5499403, -0.6898912, -4.25989, 1, 1, 1, 1, 1,
-0.5459886, -0.4229203, -1.503522, 1, 1, 1, 1, 1,
-0.5446199, -1.169069, -3.701884, 1, 1, 1, 1, 1,
-0.5440968, -0.8368732, -1.924438, 1, 1, 1, 1, 1,
-0.543371, 0.3316897, -0.9635491, 1, 1, 1, 1, 1,
-0.5423345, -1.048209, -1.46852, 1, 1, 1, 1, 1,
-0.538996, 2.007743, -0.2566536, 1, 1, 1, 1, 1,
-0.5272608, 1.179646, -1.017582, 1, 1, 1, 1, 1,
-0.5217804, 0.01602726, -0.9858298, 1, 1, 1, 1, 1,
-0.5200385, 0.2243388, -2.081837, 1, 1, 1, 1, 1,
-0.5175284, -0.4989111, -2.698066, 1, 1, 1, 1, 1,
-0.5122924, -0.02000958, 0.1251937, 1, 1, 1, 1, 1,
-0.509849, -1.509135, -3.561872, 0, 0, 1, 1, 1,
-0.5028304, -0.1145311, -3.142547, 1, 0, 0, 1, 1,
-0.4985723, -0.3481826, -2.65438, 1, 0, 0, 1, 1,
-0.4867467, 0.7321146, -0.8110912, 1, 0, 0, 1, 1,
-0.4805829, 0.02018866, -0.7071196, 1, 0, 0, 1, 1,
-0.4750852, 1.454686, -0.9444603, 1, 0, 0, 1, 1,
-0.4695627, 0.2663008, -0.8583844, 0, 0, 0, 1, 1,
-0.4683589, 1.083449, -2.107893, 0, 0, 0, 1, 1,
-0.4666084, 0.8643473, -0.05002117, 0, 0, 0, 1, 1,
-0.4657845, -0.1921451, -2.166191, 0, 0, 0, 1, 1,
-0.4644717, 0.00425323, -1.357175, 0, 0, 0, 1, 1,
-0.4604857, 0.8376284, 0.05206426, 0, 0, 0, 1, 1,
-0.4585505, 1.263784, -0.8543877, 0, 0, 0, 1, 1,
-0.4567803, 0.6620132, -2.422431, 1, 1, 1, 1, 1,
-0.4566821, -1.948067, -2.968878, 1, 1, 1, 1, 1,
-0.4560349, 1.230288, -0.8576189, 1, 1, 1, 1, 1,
-0.4545738, 1.944164, 0.7093535, 1, 1, 1, 1, 1,
-0.4520819, 1.955009, -0.3465045, 1, 1, 1, 1, 1,
-0.4504865, -0.7027708, -1.229096, 1, 1, 1, 1, 1,
-0.4435987, -0.2304939, -0.4237483, 1, 1, 1, 1, 1,
-0.4381588, 0.679589, -1.039357, 1, 1, 1, 1, 1,
-0.4377267, 1.049924, -0.6941867, 1, 1, 1, 1, 1,
-0.4270136, -0.222929, -2.718925, 1, 1, 1, 1, 1,
-0.4259014, -2.002063e-05, -1.521612, 1, 1, 1, 1, 1,
-0.4251282, -0.7755128, -0.8861711, 1, 1, 1, 1, 1,
-0.4199577, -0.2876332, -3.433888, 1, 1, 1, 1, 1,
-0.4173905, 0.02395239, -0.6527886, 1, 1, 1, 1, 1,
-0.4172873, -1.345858, -3.536409, 1, 1, 1, 1, 1,
-0.416333, 0.8764896, -0.7626201, 0, 0, 1, 1, 1,
-0.4125724, 0.9095936, -0.6950858, 1, 0, 0, 1, 1,
-0.4112837, -0.5232788, -4.419368, 1, 0, 0, 1, 1,
-0.4091716, 0.8940694, -0.8785096, 1, 0, 0, 1, 1,
-0.4088586, -0.3981096, -1.186359, 1, 0, 0, 1, 1,
-0.4067714, -0.6422419, -3.342203, 1, 0, 0, 1, 1,
-0.4052763, 0.9621844, -1.71625, 0, 0, 0, 1, 1,
-0.4020953, 1.060835, -0.2382199, 0, 0, 0, 1, 1,
-0.3973689, 1.026774, -0.6568421, 0, 0, 0, 1, 1,
-0.3965641, -1.485747, -4.097123, 0, 0, 0, 1, 1,
-0.3723965, -0.2362969, -2.834302, 0, 0, 0, 1, 1,
-0.3662083, 1.961849, 0.107693, 0, 0, 0, 1, 1,
-0.3658516, -0.2547961, -1.163857, 0, 0, 0, 1, 1,
-0.363251, -0.4750721, -2.037943, 1, 1, 1, 1, 1,
-0.3602009, 0.2553697, -2.331189, 1, 1, 1, 1, 1,
-0.3601001, 1.233622, -0.3788468, 1, 1, 1, 1, 1,
-0.356957, 0.1298728, -2.452466, 1, 1, 1, 1, 1,
-0.3555688, 0.3275322, -1.310186, 1, 1, 1, 1, 1,
-0.3542729, -1.600176, -3.759325, 1, 1, 1, 1, 1,
-0.3528703, -1.495961, -1.933433, 1, 1, 1, 1, 1,
-0.3474304, -0.21367, -0.7659966, 1, 1, 1, 1, 1,
-0.3463205, 0.05141925, -2.693546, 1, 1, 1, 1, 1,
-0.3446827, 2.314284, -0.3559992, 1, 1, 1, 1, 1,
-0.3433075, 0.4859885, -1.212269, 1, 1, 1, 1, 1,
-0.3428146, -0.869537, -2.357293, 1, 1, 1, 1, 1,
-0.34204, 0.06351286, -2.142305, 1, 1, 1, 1, 1,
-0.3369036, -0.6736215, -1.502913, 1, 1, 1, 1, 1,
-0.3326447, 0.4790664, -2.624988, 1, 1, 1, 1, 1,
-0.3323408, -2.990934, -3.437559, 0, 0, 1, 1, 1,
-0.3315535, -1.139941, -2.43676, 1, 0, 0, 1, 1,
-0.3295789, -1.060348, -3.736306, 1, 0, 0, 1, 1,
-0.326607, -0.7865523, -2.41859, 1, 0, 0, 1, 1,
-0.3243563, -3.175704, -2.154345, 1, 0, 0, 1, 1,
-0.31662, 0.5060453, 0.05350041, 1, 0, 0, 1, 1,
-0.3088312, -0.1618422, -4.096798, 0, 0, 0, 1, 1,
-0.305542, 1.47183, 0.09540251, 0, 0, 0, 1, 1,
-0.2991021, 3.596763, 0.3254983, 0, 0, 0, 1, 1,
-0.2941685, -0.6553809, -1.27634, 0, 0, 0, 1, 1,
-0.2917847, 0.1581481, -0.2948895, 0, 0, 0, 1, 1,
-0.2903235, -0.1112008, -2.322696, 0, 0, 0, 1, 1,
-0.2824471, -0.8794133, -1.856435, 0, 0, 0, 1, 1,
-0.2809799, -0.9953784, -3.560571, 1, 1, 1, 1, 1,
-0.2806599, -0.08538419, -1.321601, 1, 1, 1, 1, 1,
-0.2787723, -0.51115, -2.041642, 1, 1, 1, 1, 1,
-0.2724764, -1.352005, -4.002371, 1, 1, 1, 1, 1,
-0.2685101, -0.6454641, -2.645355, 1, 1, 1, 1, 1,
-0.2683731, 1.10374, 0.6157231, 1, 1, 1, 1, 1,
-0.261266, 1.52489, -0.1894965, 1, 1, 1, 1, 1,
-0.2554314, -1.048597, -3.198908, 1, 1, 1, 1, 1,
-0.254928, -0.5779173, -3.222316, 1, 1, 1, 1, 1,
-0.2488368, 0.2150556, -0.9211709, 1, 1, 1, 1, 1,
-0.2479467, -1.855888, -5.898599, 1, 1, 1, 1, 1,
-0.242259, -0.3117758, -1.541209, 1, 1, 1, 1, 1,
-0.2415295, -0.1460179, -2.718511, 1, 1, 1, 1, 1,
-0.2396075, 0.2473562, 0.008730405, 1, 1, 1, 1, 1,
-0.2322021, -0.05384357, -1.245842, 1, 1, 1, 1, 1,
-0.2308967, 0.6903674, 0.7512521, 0, 0, 1, 1, 1,
-0.2304921, -1.50003, -3.237896, 1, 0, 0, 1, 1,
-0.2293083, -0.6237713, -2.56174, 1, 0, 0, 1, 1,
-0.2262042, -0.3101169, -1.98222, 1, 0, 0, 1, 1,
-0.2240776, -0.4035489, -3.260798, 1, 0, 0, 1, 1,
-0.2220202, 1.216613, -1.067019, 1, 0, 0, 1, 1,
-0.2213589, 0.9309387, 1.430082, 0, 0, 0, 1, 1,
-0.2199828, -0.85174, -3.282448, 0, 0, 0, 1, 1,
-0.2199662, 1.708535, 1.256753, 0, 0, 0, 1, 1,
-0.2188283, 0.7876889, -0.4283379, 0, 0, 0, 1, 1,
-0.2147088, 2.031515, -0.1087929, 0, 0, 0, 1, 1,
-0.2135081, -0.5302798, -3.096095, 0, 0, 0, 1, 1,
-0.2127027, -0.4896413, -2.466449, 0, 0, 0, 1, 1,
-0.2118623, 1.289897, 0.8314641, 1, 1, 1, 1, 1,
-0.2103964, 1.714785, -0.7141389, 1, 1, 1, 1, 1,
-0.2099243, -0.4486185, -2.347046, 1, 1, 1, 1, 1,
-0.2068656, -0.8050504, -1.368939, 1, 1, 1, 1, 1,
-0.2037002, -1.505372, -3.931294, 1, 1, 1, 1, 1,
-0.1986992, 0.3630106, -0.9244102, 1, 1, 1, 1, 1,
-0.1983975, -1.328334, -2.195952, 1, 1, 1, 1, 1,
-0.1983945, 2.999877, -0.3852316, 1, 1, 1, 1, 1,
-0.1845487, 0.07488235, -2.65723, 1, 1, 1, 1, 1,
-0.1844613, 0.1450707, -0.2538706, 1, 1, 1, 1, 1,
-0.1822935, -0.4784915, -2.349271, 1, 1, 1, 1, 1,
-0.1807329, 0.3044344, -2.120059, 1, 1, 1, 1, 1,
-0.1800486, 0.09068162, -1.049013, 1, 1, 1, 1, 1,
-0.1750655, -0.3976701, -3.149746, 1, 1, 1, 1, 1,
-0.1741004, -0.4917411, -2.673368, 1, 1, 1, 1, 1,
-0.1610868, -0.3609812, -3.621309, 0, 0, 1, 1, 1,
-0.1596421, -0.0382305, -1.208442, 1, 0, 0, 1, 1,
-0.1586238, -1.160374, -2.509597, 1, 0, 0, 1, 1,
-0.1571033, 2.144338, -0.6422204, 1, 0, 0, 1, 1,
-0.1556552, -1.091383, -2.708099, 1, 0, 0, 1, 1,
-0.1553948, -0.6629589, -3.843205, 1, 0, 0, 1, 1,
-0.1547077, 1.2965, 1.581829, 0, 0, 0, 1, 1,
-0.1527957, -1.072606, -4.360299, 0, 0, 0, 1, 1,
-0.1520056, -0.7823126, -2.852371, 0, 0, 0, 1, 1,
-0.1470565, 1.082345, 0.007147318, 0, 0, 0, 1, 1,
-0.1467444, -0.1028592, -2.377607, 0, 0, 0, 1, 1,
-0.1459038, 0.1207343, 0.8633844, 0, 0, 0, 1, 1,
-0.1453903, 1.940939, -0.473554, 0, 0, 0, 1, 1,
-0.1445743, -0.2645145, -2.88479, 1, 1, 1, 1, 1,
-0.144573, 1.427851, -1.166611, 1, 1, 1, 1, 1,
-0.144311, -0.3466563, -5.106605, 1, 1, 1, 1, 1,
-0.1424529, -0.05867739, -3.193046, 1, 1, 1, 1, 1,
-0.1407588, 1.059753, -1.328176, 1, 1, 1, 1, 1,
-0.1389672, -0.6060588, -3.164876, 1, 1, 1, 1, 1,
-0.135182, 0.3949252, 1.125191, 1, 1, 1, 1, 1,
-0.1336117, -0.2684485, -2.821086, 1, 1, 1, 1, 1,
-0.1270785, -0.686884, -3.972048, 1, 1, 1, 1, 1,
-0.1264567, 0.3573011, -0.5970411, 1, 1, 1, 1, 1,
-0.1220539, 0.9848418, -0.5363675, 1, 1, 1, 1, 1,
-0.121267, 1.5926, -0.8038594, 1, 1, 1, 1, 1,
-0.1202448, -0.4343789, -2.986824, 1, 1, 1, 1, 1,
-0.1190035, 1.147261, 1.680382, 1, 1, 1, 1, 1,
-0.1155964, -0.8906685, -3.983481, 1, 1, 1, 1, 1,
-0.1147006, 0.6591431, -0.2371599, 0, 0, 1, 1, 1,
-0.1077621, 0.5610656, -1.185062, 1, 0, 0, 1, 1,
-0.1077249, 1.5598, 1.043042, 1, 0, 0, 1, 1,
-0.09497227, -0.7167969, -2.788836, 1, 0, 0, 1, 1,
-0.09350834, 0.1034276, -0.1589169, 1, 0, 0, 1, 1,
-0.09272805, -0.80551, -3.355427, 1, 0, 0, 1, 1,
-0.09238619, 0.239463, -1.340872, 0, 0, 0, 1, 1,
-0.09025638, -0.1852682, -3.958375, 0, 0, 0, 1, 1,
-0.08794671, 0.6016089, 0.2990985, 0, 0, 0, 1, 1,
-0.08510029, 0.01298991, -3.249926, 0, 0, 0, 1, 1,
-0.08482996, 0.1961266, 1.244525, 0, 0, 0, 1, 1,
-0.08250903, -1.405505, -4.631742, 0, 0, 0, 1, 1,
-0.07372422, 0.3703593, 1.307906, 0, 0, 0, 1, 1,
-0.0733441, 2.538649, 0.4862895, 1, 1, 1, 1, 1,
-0.07147231, 0.2042997, -1.958405, 1, 1, 1, 1, 1,
-0.06879175, -1.156025, -2.35224, 1, 1, 1, 1, 1,
-0.06552759, -0.7527956, -4.86083, 1, 1, 1, 1, 1,
-0.06455424, -0.1715267, -0.08710115, 1, 1, 1, 1, 1,
-0.06233626, 0.3644783, -0.1470458, 1, 1, 1, 1, 1,
-0.06196397, -0.2584721, -1.774712, 1, 1, 1, 1, 1,
-0.06185799, 0.0102789, -1.40825, 1, 1, 1, 1, 1,
-0.06133451, -0.1771023, -1.038715, 1, 1, 1, 1, 1,
-0.06093626, 0.08859258, -1.461, 1, 1, 1, 1, 1,
-0.05453451, 0.48396, -0.1285369, 1, 1, 1, 1, 1,
-0.0515229, -1.900592, -4.098145, 1, 1, 1, 1, 1,
-0.04635625, -0.1196247, -2.748786, 1, 1, 1, 1, 1,
-0.04524259, -1.857863, -4.356558, 1, 1, 1, 1, 1,
-0.04430562, -0.7629109, -2.695461, 1, 1, 1, 1, 1,
-0.04403162, -0.2350987, -3.31549, 0, 0, 1, 1, 1,
-0.04000304, 0.003767539, -1.651094, 1, 0, 0, 1, 1,
-0.03972197, -0.3386067, -2.260909, 1, 0, 0, 1, 1,
-0.03967731, -0.003329464, -3.213466, 1, 0, 0, 1, 1,
-0.03884035, 1.100496, -0.7575483, 1, 0, 0, 1, 1,
-0.03421891, -1.55471, -4.140214, 1, 0, 0, 1, 1,
-0.03392681, 0.02205887, 1.097537, 0, 0, 0, 1, 1,
-0.03251183, -1.058276, -2.137517, 0, 0, 0, 1, 1,
-0.03145501, 0.3162452, -0.6194562, 0, 0, 0, 1, 1,
-0.02439268, -0.08788115, -2.831849, 0, 0, 0, 1, 1,
-0.0154523, 0.1426961, 0.8973997, 0, 0, 0, 1, 1,
-0.0132768, 1.3939, 0.6357962, 0, 0, 0, 1, 1,
-0.01324682, 1.839596, 0.009319691, 0, 0, 0, 1, 1,
-0.01151506, -0.07799147, -2.928143, 1, 1, 1, 1, 1,
-0.00858249, -0.2033546, -1.363014, 1, 1, 1, 1, 1,
-0.001175386, -0.4997134, -3.400983, 1, 1, 1, 1, 1,
-0.000673943, -0.9371709, -2.727862, 1, 1, 1, 1, 1,
0.008054469, -0.4035463, 2.210874, 1, 1, 1, 1, 1,
0.01241487, -1.722898, 1.652087, 1, 1, 1, 1, 1,
0.02206764, 1.658166, 0.505645, 1, 1, 1, 1, 1,
0.02233786, 1.317059, -0.674512, 1, 1, 1, 1, 1,
0.0328531, 0.9682202, -0.4911338, 1, 1, 1, 1, 1,
0.03307186, -0.3170103, 3.497015, 1, 1, 1, 1, 1,
0.03469511, 1.453224, 0.06533648, 1, 1, 1, 1, 1,
0.03580572, 0.332748, 0.9566171, 1, 1, 1, 1, 1,
0.03783368, -2.298835, 2.459077, 1, 1, 1, 1, 1,
0.03859925, 0.6312767, -1.073551, 1, 1, 1, 1, 1,
0.03996036, -0.1397354, 4.979749, 1, 1, 1, 1, 1,
0.04564605, 0.4231454, 0.1931314, 0, 0, 1, 1, 1,
0.04907096, 0.2888239, -0.2814137, 1, 0, 0, 1, 1,
0.0495139, 0.06629561, 0.05280199, 1, 0, 0, 1, 1,
0.0504064, -1.422247, 3.611693, 1, 0, 0, 1, 1,
0.05367979, -0.09277429, 2.754962, 1, 0, 0, 1, 1,
0.05393728, 2.085515, -1.654472, 1, 0, 0, 1, 1,
0.05400202, -0.4946013, 2.771252, 0, 0, 0, 1, 1,
0.05722161, -1.664274, 4.484015, 0, 0, 0, 1, 1,
0.0596661, 0.4837952, -0.22312, 0, 0, 0, 1, 1,
0.06089318, 0.5647557, -0.4789217, 0, 0, 0, 1, 1,
0.06315187, -1.364075, 3.057389, 0, 0, 0, 1, 1,
0.06505438, 0.1365222, 0.5317609, 0, 0, 0, 1, 1,
0.07287022, 1.637108, 1.723486, 0, 0, 0, 1, 1,
0.07533722, -0.6655859, 4.155841, 1, 1, 1, 1, 1,
0.07613281, -0.7291786, 2.171306, 1, 1, 1, 1, 1,
0.0796571, 0.4015242, -0.6582597, 1, 1, 1, 1, 1,
0.08331902, -0.7791822, 2.930381, 1, 1, 1, 1, 1,
0.08402257, -0.6884466, 3.682766, 1, 1, 1, 1, 1,
0.08496281, -1.496571, 2.860389, 1, 1, 1, 1, 1,
0.08807683, 0.3054936, -0.04938245, 1, 1, 1, 1, 1,
0.09409425, -0.7471811, 3.773902, 1, 1, 1, 1, 1,
0.09796485, -2.230878, 3.669275, 1, 1, 1, 1, 1,
0.1001073, -2.078046, 1.456094, 1, 1, 1, 1, 1,
0.1001598, 0.1533578, 0.1437555, 1, 1, 1, 1, 1,
0.1006569, 1.030621, -0.1003932, 1, 1, 1, 1, 1,
0.1032317, 0.2891109, 2.841918, 1, 1, 1, 1, 1,
0.1032569, 0.3864474, -0.2654104, 1, 1, 1, 1, 1,
0.1036316, -1.255125, 2.716587, 1, 1, 1, 1, 1,
0.106366, 0.4044029, -0.7234218, 0, 0, 1, 1, 1,
0.1115582, -0.09483279, 1.064979, 1, 0, 0, 1, 1,
0.1122246, -1.560311, 4.415233, 1, 0, 0, 1, 1,
0.1149517, -0.5069861, 2.098466, 1, 0, 0, 1, 1,
0.1256421, 0.7075471, 0.8815662, 1, 0, 0, 1, 1,
0.1284934, -1.61483, 3.26946, 1, 0, 0, 1, 1,
0.1310254, 0.6640705, 0.05728175, 0, 0, 0, 1, 1,
0.1347255, 1.146218, 0.6205401, 0, 0, 0, 1, 1,
0.1364325, -0.5524434, 3.211213, 0, 0, 0, 1, 1,
0.1412458, 0.4597123, -0.05442741, 0, 0, 0, 1, 1,
0.1442137, 0.7620087, 0.04120883, 0, 0, 0, 1, 1,
0.1456985, 1.11427, 1.629448, 0, 0, 0, 1, 1,
0.1482412, 0.1444924, 1.530692, 0, 0, 0, 1, 1,
0.149481, -0.5632517, 1.473762, 1, 1, 1, 1, 1,
0.1504057, 1.039735, 0.2626629, 1, 1, 1, 1, 1,
0.1629774, 0.793862, 0.3160689, 1, 1, 1, 1, 1,
0.1644751, -0.5055459, 3.341126, 1, 1, 1, 1, 1,
0.1659319, -0.001081905, -0.7349349, 1, 1, 1, 1, 1,
0.1702638, 1.63231, 0.3865493, 1, 1, 1, 1, 1,
0.1733822, 0.1871911, 0.3323728, 1, 1, 1, 1, 1,
0.1747571, -0.9995942, 3.103539, 1, 1, 1, 1, 1,
0.1758756, 0.7312148, 1.631223, 1, 1, 1, 1, 1,
0.1795962, -1.284086, 2.049528, 1, 1, 1, 1, 1,
0.1809672, 1.004223, 0.7801107, 1, 1, 1, 1, 1,
0.1822429, -2.129353, 1.946885, 1, 1, 1, 1, 1,
0.1832524, -2.141114, 3.190554, 1, 1, 1, 1, 1,
0.1910793, 0.288452, 0.7963369, 1, 1, 1, 1, 1,
0.1939928, 0.2117787, -0.6389644, 1, 1, 1, 1, 1,
0.1953948, 0.1680681, 2.522534, 0, 0, 1, 1, 1,
0.1969795, -0.05277701, 2.407576, 1, 0, 0, 1, 1,
0.1988479, -0.1660215, 1.85473, 1, 0, 0, 1, 1,
0.2058418, -1.07369, 5.085171, 1, 0, 0, 1, 1,
0.2086519, -1.194796, 3.096405, 1, 0, 0, 1, 1,
0.211816, 0.9214392, 0.1852394, 1, 0, 0, 1, 1,
0.2129059, 1.084302, 0.2128779, 0, 0, 0, 1, 1,
0.2153248, 0.003780137, 0.7451407, 0, 0, 0, 1, 1,
0.2181031, -0.326833, 1.301024, 0, 0, 0, 1, 1,
0.2188564, 0.6923625, -2.41843, 0, 0, 0, 1, 1,
0.2228876, 0.9049253, -0.627537, 0, 0, 0, 1, 1,
0.2271392, -1.061524, 3.92042, 0, 0, 0, 1, 1,
0.2285748, -0.1663937, 2.305541, 0, 0, 0, 1, 1,
0.2293596, 0.6600598, -0.8843104, 1, 1, 1, 1, 1,
0.2295139, -0.9334594, 0.2967549, 1, 1, 1, 1, 1,
0.2305434, 0.7747725, 0.9513454, 1, 1, 1, 1, 1,
0.2326728, 1.386388, -1.905245, 1, 1, 1, 1, 1,
0.2388528, -1.461577, 3.788419, 1, 1, 1, 1, 1,
0.2393216, -0.3193491, 2.517866, 1, 1, 1, 1, 1,
0.241716, -1.17682, 2.892905, 1, 1, 1, 1, 1,
0.2427813, -0.2577782, 1.188373, 1, 1, 1, 1, 1,
0.2444793, -0.6920201, 1.97045, 1, 1, 1, 1, 1,
0.2478829, 0.2039598, -0.3932226, 1, 1, 1, 1, 1,
0.2482032, -0.4234511, 1.788984, 1, 1, 1, 1, 1,
0.248264, -1.048239, 1.899711, 1, 1, 1, 1, 1,
0.2499071, 1.514775, 0.4412257, 1, 1, 1, 1, 1,
0.2533928, -0.7218618, 4.029785, 1, 1, 1, 1, 1,
0.253988, 0.8058707, -0.4830283, 1, 1, 1, 1, 1,
0.257364, -1.123299, 2.134184, 0, 0, 1, 1, 1,
0.2593672, 0.03238798, 1.994288, 1, 0, 0, 1, 1,
0.2600119, -0.6490235, 3.548617, 1, 0, 0, 1, 1,
0.2607297, -1.293626, 5.238152, 1, 0, 0, 1, 1,
0.2618199, 0.4174294, -0.1131187, 1, 0, 0, 1, 1,
0.2625982, -0.3896715, 3.279211, 1, 0, 0, 1, 1,
0.2632254, 0.6669061, 0.2241766, 0, 0, 0, 1, 1,
0.2718875, 0.7224455, -0.5168557, 0, 0, 0, 1, 1,
0.2734405, 0.9913366, 1.520375, 0, 0, 0, 1, 1,
0.2740822, -3.771945, 4.029591, 0, 0, 0, 1, 1,
0.2769983, 0.7509514, 1.080231, 0, 0, 0, 1, 1,
0.2774398, -2.164482, 3.33135, 0, 0, 0, 1, 1,
0.2821286, 1.242213, -1.227062, 0, 0, 0, 1, 1,
0.2852658, 2.607197, 0.2372589, 1, 1, 1, 1, 1,
0.2888562, 0.09145339, 1.184366, 1, 1, 1, 1, 1,
0.2891672, -0.9894184, 1.74117, 1, 1, 1, 1, 1,
0.289625, -0.2373622, 3.135858, 1, 1, 1, 1, 1,
0.2905768, 0.1752282, 2.982286, 1, 1, 1, 1, 1,
0.2925533, 0.3238527, 0.7829601, 1, 1, 1, 1, 1,
0.2928941, 0.5297446, -1.228312, 1, 1, 1, 1, 1,
0.2938374, 0.2803719, 1.011243, 1, 1, 1, 1, 1,
0.2941263, -0.2923872, -0.04404698, 1, 1, 1, 1, 1,
0.3063889, -1.395884, 3.241519, 1, 1, 1, 1, 1,
0.3087679, 1.979053, -0.3008296, 1, 1, 1, 1, 1,
0.3100016, 1.124277, -0.537077, 1, 1, 1, 1, 1,
0.3161087, -0.2530813, 2.820823, 1, 1, 1, 1, 1,
0.3231617, 0.1565735, 0.08312733, 1, 1, 1, 1, 1,
0.3266236, 0.8922825, -0.09693204, 1, 1, 1, 1, 1,
0.3282332, -0.5761012, 3.89912, 0, 0, 1, 1, 1,
0.3321458, -1.318139, 1.618636, 1, 0, 0, 1, 1,
0.3341216, -0.4170629, 1.903124, 1, 0, 0, 1, 1,
0.3364891, 0.3739093, 0.3994811, 1, 0, 0, 1, 1,
0.3414357, 1.202331, -0.5484853, 1, 0, 0, 1, 1,
0.3481223, 0.08094586, 1.773806, 1, 0, 0, 1, 1,
0.3485948, -1.15443, 2.804586, 0, 0, 0, 1, 1,
0.3509323, -1.170166, 0.8950176, 0, 0, 0, 1, 1,
0.353041, -0.7708569, 0.997824, 0, 0, 0, 1, 1,
0.3610186, 0.1645568, -1.509646, 0, 0, 0, 1, 1,
0.364892, 0.5885128, -0.5722607, 0, 0, 0, 1, 1,
0.3660076, 0.3764544, -0.0421179, 0, 0, 0, 1, 1,
0.3693316, 0.9923112, 0.4111175, 0, 0, 0, 1, 1,
0.3705548, -1.227764, 3.285246, 1, 1, 1, 1, 1,
0.3737069, 0.2416993, 1.202276, 1, 1, 1, 1, 1,
0.3761165, -0.2973057, 1.784124, 1, 1, 1, 1, 1,
0.3775995, 0.9731346, 0.737698, 1, 1, 1, 1, 1,
0.3819736, -1.58717, 3.187438, 1, 1, 1, 1, 1,
0.3857804, -1.273488, 3.122254, 1, 1, 1, 1, 1,
0.3889711, 1.183995, -0.6882559, 1, 1, 1, 1, 1,
0.3919984, -0.05633639, 1.034285, 1, 1, 1, 1, 1,
0.3939323, 1.499269, -1.007194, 1, 1, 1, 1, 1,
0.3952965, 1.280091, 0.785539, 1, 1, 1, 1, 1,
0.3969085, -0.8032403, 3.820695, 1, 1, 1, 1, 1,
0.3973774, 0.8689335, 1.414517, 1, 1, 1, 1, 1,
0.3989083, 2.809902, -0.1076136, 1, 1, 1, 1, 1,
0.3996541, -0.0955953, 3.66448, 1, 1, 1, 1, 1,
0.4027951, -1.18051, 2.684156, 1, 1, 1, 1, 1,
0.4036722, -0.9880788, 2.098482, 0, 0, 1, 1, 1,
0.4044509, 0.4731883, 1.774695, 1, 0, 0, 1, 1,
0.4070767, -1.086785, 2.799497, 1, 0, 0, 1, 1,
0.4081077, -0.2292695, 1.427513, 1, 0, 0, 1, 1,
0.410018, 0.8004228, 1.054878, 1, 0, 0, 1, 1,
0.410409, -0.8362871, 3.692968, 1, 0, 0, 1, 1,
0.4143366, 0.07994863, 0.2339989, 0, 0, 0, 1, 1,
0.4147168, 0.1783011, -0.004851989, 0, 0, 0, 1, 1,
0.4152749, 1.409458, 0.5748165, 0, 0, 0, 1, 1,
0.4210739, 0.3017911, 0.5550641, 0, 0, 0, 1, 1,
0.4336385, -1.088849, 1.958944, 0, 0, 0, 1, 1,
0.4342096, -0.3870608, 1.882354, 0, 0, 0, 1, 1,
0.4358282, -1.071198, 3.843451, 0, 0, 0, 1, 1,
0.4432522, 0.7775937, -0.4737241, 1, 1, 1, 1, 1,
0.4443072, -1.031217, 4.32447, 1, 1, 1, 1, 1,
0.447898, -1.483354, 3.110263, 1, 1, 1, 1, 1,
0.4501613, 0.7081308, 0.7926078, 1, 1, 1, 1, 1,
0.4559352, 0.8292177, -0.3121689, 1, 1, 1, 1, 1,
0.4578274, -0.2409205, 3.759146, 1, 1, 1, 1, 1,
0.4593362, 0.4531735, -1.149868, 1, 1, 1, 1, 1,
0.4599701, 0.621024, -0.7920504, 1, 1, 1, 1, 1,
0.4607943, 1.320278, -0.4897589, 1, 1, 1, 1, 1,
0.4617466, 0.1728661, 1.842586, 1, 1, 1, 1, 1,
0.4680088, 2.236773, 0.644734, 1, 1, 1, 1, 1,
0.4692759, -0.9503931, 3.593685, 1, 1, 1, 1, 1,
0.4706824, 1.927632, 0.3635622, 1, 1, 1, 1, 1,
0.4744631, -0.948591, 2.59071, 1, 1, 1, 1, 1,
0.4790544, 0.1786572, -0.1424059, 1, 1, 1, 1, 1,
0.4848231, -0.3631715, 2.37228, 0, 0, 1, 1, 1,
0.4854187, -1.240642, 2.021558, 1, 0, 0, 1, 1,
0.4875823, 1.160178, 1.060755, 1, 0, 0, 1, 1,
0.4890775, -0.3989452, 3.634638, 1, 0, 0, 1, 1,
0.4948455, -0.1052137, 2.752389, 1, 0, 0, 1, 1,
0.4960929, -0.5205672, 1.510596, 1, 0, 0, 1, 1,
0.497021, -0.7417545, 2.370825, 0, 0, 0, 1, 1,
0.4984446, 0.7762442, 0.3744045, 0, 0, 0, 1, 1,
0.5019084, 0.02260646, 0.2350593, 0, 0, 0, 1, 1,
0.5024472, -0.1469246, 2.487345, 0, 0, 0, 1, 1,
0.5034341, -0.8636456, 1.461698, 0, 0, 0, 1, 1,
0.5044913, -1.246604, 3.066736, 0, 0, 0, 1, 1,
0.5098063, 0.1937588, 2.545848, 0, 0, 0, 1, 1,
0.5100757, 0.3892474, 2.126549, 1, 1, 1, 1, 1,
0.5107588, -0.8733035, 3.820767, 1, 1, 1, 1, 1,
0.5119203, 0.1600684, 1.44971, 1, 1, 1, 1, 1,
0.5169281, 0.3668822, 1.408756, 1, 1, 1, 1, 1,
0.5199978, -2.504493, 2.718333, 1, 1, 1, 1, 1,
0.520328, 0.9601703, 1.770411, 1, 1, 1, 1, 1,
0.5228646, -1.671683, 3.822588, 1, 1, 1, 1, 1,
0.5258657, 0.3965948, 0.9088508, 1, 1, 1, 1, 1,
0.5312383, 1.506269, -0.5740957, 1, 1, 1, 1, 1,
0.5356609, 2.0738, 1.00329, 1, 1, 1, 1, 1,
0.5470917, 0.1792297, 1.803617, 1, 1, 1, 1, 1,
0.5500967, 1.390017, -0.08632025, 1, 1, 1, 1, 1,
0.5516609, -0.2002195, 1.209648, 1, 1, 1, 1, 1,
0.554562, 0.9214549, -1.46698, 1, 1, 1, 1, 1,
0.5569129, -0.6764913, 1.920187, 1, 1, 1, 1, 1,
0.5575043, -0.256651, 3.27579, 0, 0, 1, 1, 1,
0.5609344, 0.06604671, 1.07303, 1, 0, 0, 1, 1,
0.564878, -0.2160159, 0.8688191, 1, 0, 0, 1, 1,
0.5652019, 0.06305958, 0.3336699, 1, 0, 0, 1, 1,
0.5657893, 0.4394656, 1.88385, 1, 0, 0, 1, 1,
0.5699004, 0.9222109, -0.2970984, 1, 0, 0, 1, 1,
0.5725452, 0.3973238, 0.7610998, 0, 0, 0, 1, 1,
0.5779276, -1.220297, 2.254081, 0, 0, 0, 1, 1,
0.5793906, 0.1851768, 1.146138, 0, 0, 0, 1, 1,
0.5852014, -0.7294956, 2.242036, 0, 0, 0, 1, 1,
0.5868793, 1.376199, 1.233941, 0, 0, 0, 1, 1,
0.5869012, 0.6399133, 2.072499, 0, 0, 0, 1, 1,
0.5907585, 0.3927176, 0.7579274, 0, 0, 0, 1, 1,
0.5908663, -0.2862554, 0.9148735, 1, 1, 1, 1, 1,
0.5975181, -0.3705921, 1.040229, 1, 1, 1, 1, 1,
0.6015655, 0.5789854, 0.6001791, 1, 1, 1, 1, 1,
0.6066735, -0.186966, 0.6076599, 1, 1, 1, 1, 1,
0.6069981, -0.7393786, 4.351639, 1, 1, 1, 1, 1,
0.6070929, -0.0562915, 0.2925861, 1, 1, 1, 1, 1,
0.6080126, 0.1712616, 1.332255, 1, 1, 1, 1, 1,
0.6097724, -0.2408885, 3.184494, 1, 1, 1, 1, 1,
0.6138435, 0.5904954, -0.2386725, 1, 1, 1, 1, 1,
0.6148552, 1.758539, -0.4612061, 1, 1, 1, 1, 1,
0.6257783, 0.7355561, -0.1176608, 1, 1, 1, 1, 1,
0.6312375, -0.006655199, 2.790567, 1, 1, 1, 1, 1,
0.6327321, -0.1207288, 2.392969, 1, 1, 1, 1, 1,
0.6343306, 0.326968, 1.030098, 1, 1, 1, 1, 1,
0.6353631, -0.4061599, 3.29315, 1, 1, 1, 1, 1,
0.6360781, 2.783765, 1.905301, 0, 0, 1, 1, 1,
0.6371797, -1.041515, 3.007379, 1, 0, 0, 1, 1,
0.6395613, 0.1898237, 3.956602, 1, 0, 0, 1, 1,
0.6436086, 0.8349941, 0.6077579, 1, 0, 0, 1, 1,
0.645008, -0.618004, 1.857932, 1, 0, 0, 1, 1,
0.6480635, 1.375601, 0.9565212, 1, 0, 0, 1, 1,
0.6533167, 0.4456239, 0.4693891, 0, 0, 0, 1, 1,
0.6541371, -1.01096, 2.001727, 0, 0, 0, 1, 1,
0.6544672, 1.167438, -1.391212, 0, 0, 0, 1, 1,
0.6549278, 0.6967596, -0.3029955, 0, 0, 0, 1, 1,
0.6614254, 0.157138, 0.7794233, 0, 0, 0, 1, 1,
0.662253, 2.679297, 1.169434, 0, 0, 0, 1, 1,
0.6679332, -0.5980855, 2.707392, 0, 0, 0, 1, 1,
0.6756096, 0.7571974, 0.7501717, 1, 1, 1, 1, 1,
0.6884307, 1.246926, 0.1949228, 1, 1, 1, 1, 1,
0.6902779, -0.4400323, 2.989111, 1, 1, 1, 1, 1,
0.6917896, 0.03212627, 1.101385, 1, 1, 1, 1, 1,
0.6972301, -0.5102249, 2.837077, 1, 1, 1, 1, 1,
0.6989813, 1.613302, -0.7419668, 1, 1, 1, 1, 1,
0.7003611, -0.8743606, 3.043211, 1, 1, 1, 1, 1,
0.7029289, -0.3886027, 3.336916, 1, 1, 1, 1, 1,
0.7033016, -0.2386957, 1.971144, 1, 1, 1, 1, 1,
0.7070382, 1.039567, -0.9718076, 1, 1, 1, 1, 1,
0.7079661, 1.675328, 1.199685, 1, 1, 1, 1, 1,
0.7096257, -0.1363781, 1.637544, 1, 1, 1, 1, 1,
0.7158003, 0.2947752, 2.152562, 1, 1, 1, 1, 1,
0.7244259, 0.1935796, 2.643904, 1, 1, 1, 1, 1,
0.7270798, 0.6926034, 2.510941, 1, 1, 1, 1, 1,
0.7280778, -1.275716, 0.5137241, 0, 0, 1, 1, 1,
0.7329932, -1.210465, 1.76885, 1, 0, 0, 1, 1,
0.7361974, 0.7701265, 2.564413, 1, 0, 0, 1, 1,
0.7373298, 0.8158894, 0.5005628, 1, 0, 0, 1, 1,
0.7433512, 1.985242, 1.193816, 1, 0, 0, 1, 1,
0.7457134, -0.9309392, 2.223465, 1, 0, 0, 1, 1,
0.7459095, -0.6658443, 2.33544, 0, 0, 0, 1, 1,
0.7476273, -0.6457824, 4.234993, 0, 0, 0, 1, 1,
0.7476401, 0.6229551, 2.151682, 0, 0, 0, 1, 1,
0.7502237, 0.3441962, -0.8748488, 0, 0, 0, 1, 1,
0.7535639, -0.9418542, 0.9786664, 0, 0, 0, 1, 1,
0.7542621, -0.6629554, 3.347652, 0, 0, 0, 1, 1,
0.7609277, 1.46481, -1.253772, 0, 0, 0, 1, 1,
0.7621498, 0.922902, 0.3848095, 1, 1, 1, 1, 1,
0.7672583, 0.08317822, 3.04207, 1, 1, 1, 1, 1,
0.7728522, -0.165763, 0.9541805, 1, 1, 1, 1, 1,
0.7750741, -2.900089, 3.976256, 1, 1, 1, 1, 1,
0.7764749, -0.2450696, 2.624088, 1, 1, 1, 1, 1,
0.7768964, 1.146378, 0.9735453, 1, 1, 1, 1, 1,
0.7769464, 0.3599782, -0.5247714, 1, 1, 1, 1, 1,
0.7777814, 0.194732, 1.89107, 1, 1, 1, 1, 1,
0.7779109, 0.2981896, 1.094811, 1, 1, 1, 1, 1,
0.7786648, 1.798637, -0.2938314, 1, 1, 1, 1, 1,
0.7794258, -1.068652, 0.913018, 1, 1, 1, 1, 1,
0.7856517, 0.5579953, 3.534479, 1, 1, 1, 1, 1,
0.7964451, 0.5966807, 1.327343, 1, 1, 1, 1, 1,
0.79929, 0.7813401, -0.2774512, 1, 1, 1, 1, 1,
0.7999113, 0.4360731, 1.224942, 1, 1, 1, 1, 1,
0.8005081, 0.2735497, 2.185765, 0, 0, 1, 1, 1,
0.8044037, -0.765561, 2.202491, 1, 0, 0, 1, 1,
0.8044618, 0.2669289, 3.233949, 1, 0, 0, 1, 1,
0.80545, -0.7159868, 4.328283, 1, 0, 0, 1, 1,
0.8073695, 0.4378415, 2.03614, 1, 0, 0, 1, 1,
0.820929, 1.981493, 1.298606, 1, 0, 0, 1, 1,
0.8214665, 3.054163, 2.02687, 0, 0, 0, 1, 1,
0.8238433, 0.8268254, 0.1996812, 0, 0, 0, 1, 1,
0.8249314, -0.2591724, 1.007355, 0, 0, 0, 1, 1,
0.8282226, 1.523212, 0.6380326, 0, 0, 0, 1, 1,
0.8522938, 0.2031424, 1.882148, 0, 0, 0, 1, 1,
0.8568066, -0.21073, 1.293826, 0, 0, 0, 1, 1,
0.8581932, 0.4933415, 3.814228, 0, 0, 0, 1, 1,
0.8583391, 0.01553712, 2.97431, 1, 1, 1, 1, 1,
0.8589034, -0.4603801, 2.286076, 1, 1, 1, 1, 1,
0.8618345, -0.2453807, 3.651591, 1, 1, 1, 1, 1,
0.8653619, 0.7686996, 1.166435, 1, 1, 1, 1, 1,
0.8802744, -0.4631895, 0.3109913, 1, 1, 1, 1, 1,
0.8872978, -0.01589629, 1.188858, 1, 1, 1, 1, 1,
0.90211, 0.2333675, 2.2081, 1, 1, 1, 1, 1,
0.9062819, 0.6930003, 0.08721201, 1, 1, 1, 1, 1,
0.9092762, -1.372019, 2.978004, 1, 1, 1, 1, 1,
0.9137694, 2.16577, 0.9518624, 1, 1, 1, 1, 1,
0.9255875, -1.913081, 3.484485, 1, 1, 1, 1, 1,
0.9355402, -0.6899446, 1.433853, 1, 1, 1, 1, 1,
0.9375394, 1.687539, 1.362144, 1, 1, 1, 1, 1,
0.9443312, 0.217529, 0.4004223, 1, 1, 1, 1, 1,
0.9459383, 0.2677687, 2.578637, 1, 1, 1, 1, 1,
0.9571227, -0.1559936, 1.638715, 0, 0, 1, 1, 1,
0.9603421, -1.485471, 2.137339, 1, 0, 0, 1, 1,
0.9641672, 0.3050228, 2.905653, 1, 0, 0, 1, 1,
0.9650697, -0.5131971, 1.049839, 1, 0, 0, 1, 1,
0.9666681, -0.3848805, 2.353729, 1, 0, 0, 1, 1,
0.9681665, 1.263929, 1.165187, 1, 0, 0, 1, 1,
0.9688236, -1.395111, 2.339157, 0, 0, 0, 1, 1,
0.981591, 1.323222, 2.483117, 0, 0, 0, 1, 1,
0.983274, -1.137723, 0.4838796, 0, 0, 0, 1, 1,
0.9849853, -0.1460769, 2.056185, 0, 0, 0, 1, 1,
0.9913315, 1.064278, 0.7798545, 0, 0, 0, 1, 1,
1.000993, -0.6940871, 1.522436, 0, 0, 0, 1, 1,
1.003602, -0.9058923, 3.119404, 0, 0, 0, 1, 1,
1.007672, -1.05741, 2.496278, 1, 1, 1, 1, 1,
1.01936, -1.249627, 3.008425, 1, 1, 1, 1, 1,
1.021916, -0.4811446, 3.696639, 1, 1, 1, 1, 1,
1.022576, -0.8990653, 2.619776, 1, 1, 1, 1, 1,
1.02948, -0.04385469, 1.959121, 1, 1, 1, 1, 1,
1.03074, 0.09402104, 1.822095, 1, 1, 1, 1, 1,
1.033058, 0.5286664, 0.2422057, 1, 1, 1, 1, 1,
1.033129, -0.5562972, 1.61119, 1, 1, 1, 1, 1,
1.040854, 1.492861, 1.67593, 1, 1, 1, 1, 1,
1.041578, 1.550021, 2.69651, 1, 1, 1, 1, 1,
1.046356, 0.4096924, 2.368494, 1, 1, 1, 1, 1,
1.049272, 0.8018649, 2.312829, 1, 1, 1, 1, 1,
1.052336, 0.9210317, 1.594811, 1, 1, 1, 1, 1,
1.061844, -1.615043, 1.127232, 1, 1, 1, 1, 1,
1.066451, 0.159798, 1.869846, 1, 1, 1, 1, 1,
1.068226, -0.1101246, 1.352155, 0, 0, 1, 1, 1,
1.071025, 1.656484, -2.834903, 1, 0, 0, 1, 1,
1.073091, 1.44624, 1.110733, 1, 0, 0, 1, 1,
1.076099, 0.5576489, 1.930696, 1, 0, 0, 1, 1,
1.076657, -0.2779637, 1.553769, 1, 0, 0, 1, 1,
1.079275, 0.5252326, 1.816802, 1, 0, 0, 1, 1,
1.079491, -0.2045075, 3.226615, 0, 0, 0, 1, 1,
1.085988, -0.1476058, 1.682822, 0, 0, 0, 1, 1,
1.094771, -1.226811, 0.5476213, 0, 0, 0, 1, 1,
1.101544, -0.6226617, 1.704075, 0, 0, 0, 1, 1,
1.110818, -0.4396402, 2.510615, 0, 0, 0, 1, 1,
1.111898, -1.500391, 2.506896, 0, 0, 0, 1, 1,
1.112235, 0.5985112, -0.07154017, 0, 0, 0, 1, 1,
1.136625, 0.3345956, 2.969604, 1, 1, 1, 1, 1,
1.137472, -1.00978, 5.133346, 1, 1, 1, 1, 1,
1.137607, 1.18938, 1.111692, 1, 1, 1, 1, 1,
1.140453, -0.324318, 2.658849, 1, 1, 1, 1, 1,
1.14605, -2.209819, 3.517975, 1, 1, 1, 1, 1,
1.151798, -0.328969, 1.49158, 1, 1, 1, 1, 1,
1.163929, -0.6239134, 2.669931, 1, 1, 1, 1, 1,
1.165558, -0.2698032, 2.31305, 1, 1, 1, 1, 1,
1.168997, 0.7931667, 1.786702, 1, 1, 1, 1, 1,
1.175068, -0.4691226, 4.101254, 1, 1, 1, 1, 1,
1.175985, 0.6754016, 2.352427, 1, 1, 1, 1, 1,
1.178423, -0.6189175, 2.180075, 1, 1, 1, 1, 1,
1.179967, -0.2158999, 3.435661, 1, 1, 1, 1, 1,
1.185264, 1.316218, 0.4114002, 1, 1, 1, 1, 1,
1.192643, -0.2934904, 2.017658, 1, 1, 1, 1, 1,
1.205375, -1.184847, 3.288812, 0, 0, 1, 1, 1,
1.208111, -0.1961718, 1.45326, 1, 0, 0, 1, 1,
1.21157, -0.6910943, 1.676814, 1, 0, 0, 1, 1,
1.215611, 0.3338282, 2.231695, 1, 0, 0, 1, 1,
1.219574, -0.1471097, 1.180627, 1, 0, 0, 1, 1,
1.228173, 1.292257, 0.02093172, 1, 0, 0, 1, 1,
1.230434, -0.6694512, 2.637136, 0, 0, 0, 1, 1,
1.236173, 0.08303447, 1.916664, 0, 0, 0, 1, 1,
1.253613, 1.737697, 0.1342555, 0, 0, 0, 1, 1,
1.259841, 0.3961405, 1.626952, 0, 0, 0, 1, 1,
1.267706, 1.044853, 1.515948, 0, 0, 0, 1, 1,
1.275053, 0.08528582, 1.195129, 0, 0, 0, 1, 1,
1.27562, 1.320147, 1.345824, 0, 0, 0, 1, 1,
1.276373, 1.442299, 0.003687954, 1, 1, 1, 1, 1,
1.276536, -1.558146, 1.528156, 1, 1, 1, 1, 1,
1.283571, -1.016004, 0.03656591, 1, 1, 1, 1, 1,
1.283731, 0.4703254, 2.97053, 1, 1, 1, 1, 1,
1.287298, 1.795636, -0.01489497, 1, 1, 1, 1, 1,
1.289147, -0.9931375, 2.257487, 1, 1, 1, 1, 1,
1.306789, 0.610043, 2.401226, 1, 1, 1, 1, 1,
1.308127, 0.1674166, 1.956425, 1, 1, 1, 1, 1,
1.310237, 0.2311394, 1.592866, 1, 1, 1, 1, 1,
1.314402, 0.01297814, 1.80813, 1, 1, 1, 1, 1,
1.315954, -1.061145, 3.087372, 1, 1, 1, 1, 1,
1.320912, 0.3779303, 0.2633822, 1, 1, 1, 1, 1,
1.324058, 1.057285, -0.2220565, 1, 1, 1, 1, 1,
1.337931, 0.1635501, 1.494042, 1, 1, 1, 1, 1,
1.351881, -0.2906907, 3.711728, 1, 1, 1, 1, 1,
1.365254, -2.429889, 2.415224, 0, 0, 1, 1, 1,
1.365876, 0.7025214, 2.010697, 1, 0, 0, 1, 1,
1.372296, 0.1307359, 0.9030793, 1, 0, 0, 1, 1,
1.381054, -0.916899, 2.475046, 1, 0, 0, 1, 1,
1.381764, 0.2064791, 2.314806, 1, 0, 0, 1, 1,
1.384293, 0.5003446, 1.653767, 1, 0, 0, 1, 1,
1.386834, -0.01179727, 2.013339, 0, 0, 0, 1, 1,
1.391971, 0.2438454, 0.9125513, 0, 0, 0, 1, 1,
1.39358, 0.4997581, 2.210832, 0, 0, 0, 1, 1,
1.419381, -1.599011, 2.086772, 0, 0, 0, 1, 1,
1.422933, 0.7860098, 2.893193, 0, 0, 0, 1, 1,
1.432026, 2.35002, 3.283299, 0, 0, 0, 1, 1,
1.436975, -1.62393, 0.7182938, 0, 0, 0, 1, 1,
1.438896, -0.6922033, 1.278502, 1, 1, 1, 1, 1,
1.449239, -0.5569659, 2.264478, 1, 1, 1, 1, 1,
1.452001, -0.3000041, 1.73531, 1, 1, 1, 1, 1,
1.4525, -2.09527, 3.969661, 1, 1, 1, 1, 1,
1.465395, 0.4680834, 1.746746, 1, 1, 1, 1, 1,
1.473913, 1.371068, 0.6004018, 1, 1, 1, 1, 1,
1.479069, -0.5209101, 3.350144, 1, 1, 1, 1, 1,
1.494977, 2.69674, 0.6709921, 1, 1, 1, 1, 1,
1.502925, 0.9385019, 1.382038, 1, 1, 1, 1, 1,
1.504989, 1.550008, -0.3369227, 1, 1, 1, 1, 1,
1.506473, -0.1612038, 2.534349, 1, 1, 1, 1, 1,
1.509786, -1.04494, 2.576415, 1, 1, 1, 1, 1,
1.513922, -1.517289, 2.163968, 1, 1, 1, 1, 1,
1.520676, -0.5057344, 1.370241, 1, 1, 1, 1, 1,
1.525324, -1.389883, 1.986372, 1, 1, 1, 1, 1,
1.528992, -0.06451271, 1.943108, 0, 0, 1, 1, 1,
1.533457, -1.575119, 1.327852, 1, 0, 0, 1, 1,
1.545305, -0.7782355, 2.689726, 1, 0, 0, 1, 1,
1.555991, -1.834886, 4.034374, 1, 0, 0, 1, 1,
1.579969, -1.560574, 4.380721, 1, 0, 0, 1, 1,
1.581736, 0.4843183, 1.850711, 1, 0, 0, 1, 1,
1.582346, 0.2512985, 1.775589, 0, 0, 0, 1, 1,
1.582533, 1.681137, 1.036277, 0, 0, 0, 1, 1,
1.584616, 0.172108, 0.5116385, 0, 0, 0, 1, 1,
1.588852, -1.026165, 2.621289, 0, 0, 0, 1, 1,
1.58978, -1.56821, 3.133846, 0, 0, 0, 1, 1,
1.595321, 0.9079211, -0.2633056, 0, 0, 0, 1, 1,
1.614991, -0.2329169, 1.565463, 0, 0, 0, 1, 1,
1.619117, -2.19732, 3.235188, 1, 1, 1, 1, 1,
1.620967, -0.07308545, 2.21159, 1, 1, 1, 1, 1,
1.621584, -0.6584345, 3.046098, 1, 1, 1, 1, 1,
1.624265, 0.6506239, 3.131993, 1, 1, 1, 1, 1,
1.629244, -0.6365848, 2.567437, 1, 1, 1, 1, 1,
1.639113, 0.07980329, 1.48866, 1, 1, 1, 1, 1,
1.656968, -2.550352, 1.454886, 1, 1, 1, 1, 1,
1.667342, 1.193915, 1.827235, 1, 1, 1, 1, 1,
1.68369, -1.343159, 2.12322, 1, 1, 1, 1, 1,
1.687528, 0.1253516, 0.8693507, 1, 1, 1, 1, 1,
1.691584, 1.725852, -0.4852278, 1, 1, 1, 1, 1,
1.701367, 1.419217, 0.6212217, 1, 1, 1, 1, 1,
1.705108, 0.2727706, 1.401179, 1, 1, 1, 1, 1,
1.741007, 1.920091, 0.2194119, 1, 1, 1, 1, 1,
1.742767, -0.1246153, 1.288964, 1, 1, 1, 1, 1,
1.749119, 0.09717151, 2.275901, 0, 0, 1, 1, 1,
1.752023, 1.807189, -0.2257964, 1, 0, 0, 1, 1,
1.775083, 0.848039, 0.3757098, 1, 0, 0, 1, 1,
1.785737, 0.7155364, 0.1555079, 1, 0, 0, 1, 1,
1.793115, 1.441508, 1.81572, 1, 0, 0, 1, 1,
1.805233, 0.3215925, 3.090098, 1, 0, 0, 1, 1,
1.823348, -0.3605895, 1.820404, 0, 0, 0, 1, 1,
1.836859, -1.682299, 0.746204, 0, 0, 0, 1, 1,
1.851123, 1.809065, 0.5758902, 0, 0, 0, 1, 1,
1.852483, -0.1031349, 1.021207, 0, 0, 0, 1, 1,
1.883316, 0.25141, 1.969445, 0, 0, 0, 1, 1,
1.887814, 0.4868446, 0.2733244, 0, 0, 0, 1, 1,
1.93381, 2.455678, 0.5527591, 0, 0, 0, 1, 1,
1.939744, -0.1433477, 1.313926, 1, 1, 1, 1, 1,
1.941301, 0.9793948, 2.542268, 1, 1, 1, 1, 1,
1.944702, -1.466869, 1.33611, 1, 1, 1, 1, 1,
1.945439, 0.4661887, 1.010814, 1, 1, 1, 1, 1,
1.992693, -0.9215795, 2.957544, 1, 1, 1, 1, 1,
2.019476, -1.281694, 4.239461, 1, 1, 1, 1, 1,
2.086343, -0.6055774, 1.447576, 1, 1, 1, 1, 1,
2.0977, 0.2396002, 0.7187114, 1, 1, 1, 1, 1,
2.108945, -1.176093, 2.744148, 1, 1, 1, 1, 1,
2.109718, 0.7660156, 2.156753, 1, 1, 1, 1, 1,
2.136209, -2.324584, 4.567718, 1, 1, 1, 1, 1,
2.148647, 0.7125367, 1.001765, 1, 1, 1, 1, 1,
2.164298, -1.736806, 2.557512, 1, 1, 1, 1, 1,
2.170409, 0.1231729, 2.10412, 1, 1, 1, 1, 1,
2.172033, -0.4501591, 0.7001495, 1, 1, 1, 1, 1,
2.176975, -0.9872885, 2.143971, 0, 0, 1, 1, 1,
2.180748, 0.03258865, 1.490437, 1, 0, 0, 1, 1,
2.216629, 0.07112235, 1.789091, 1, 0, 0, 1, 1,
2.217416, -2.129836, 2.447074, 1, 0, 0, 1, 1,
2.259329, 1.296188, 0.2002473, 1, 0, 0, 1, 1,
2.260882, -0.2086636, 2.188081, 1, 0, 0, 1, 1,
2.363558, -0.9804938, 2.47201, 0, 0, 0, 1, 1,
2.40183, -1.262521, 2.964307, 0, 0, 0, 1, 1,
2.448489, 1.137451, 0.5262827, 0, 0, 0, 1, 1,
2.529839, 0.04568623, 2.266028, 0, 0, 0, 1, 1,
2.610679, 1.400106, 2.594374, 0, 0, 0, 1, 1,
2.634174, 0.3384162, 1.30937, 0, 0, 0, 1, 1,
2.635028, -0.07722755, 2.731059, 0, 0, 0, 1, 1,
2.676574, -1.208238, 1.590735, 1, 1, 1, 1, 1,
2.782873, -0.2885957, 2.482111, 1, 1, 1, 1, 1,
2.783984, -0.3626356, 0.78317, 1, 1, 1, 1, 1,
2.804931, -0.2637053, 1.212048, 1, 1, 1, 1, 1,
2.990359, 0.3437751, 2.364799, 1, 1, 1, 1, 1,
3.063291, 0.7166995, 2.10904, 1, 1, 1, 1, 1,
3.08337, -1.17453, 2.933885, 1, 1, 1, 1, 1
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
var radius = 9.875622;
var distance = 34.68771;
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
mvMatrix.translate( -0.1444802, 0.08759069, 0.3302233 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.68771);
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
