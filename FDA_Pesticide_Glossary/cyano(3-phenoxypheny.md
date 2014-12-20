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
-2.922842, -0.5857424, -1.077167, 1, 0, 0, 1,
-2.79497, 1.014463, -1.319186, 1, 0.007843138, 0, 1,
-2.616116, -0.8028135, -2.350578, 1, 0.01176471, 0, 1,
-2.610991, -0.6571634, -1.388274, 1, 0.01960784, 0, 1,
-2.577993, 0.2789965, -0.9678544, 1, 0.02352941, 0, 1,
-2.546307, -0.2322651, 0.8906408, 1, 0.03137255, 0, 1,
-2.539338, 1.388513, -0.7166088, 1, 0.03529412, 0, 1,
-2.493731, -1.714737, -1.232568, 1, 0.04313726, 0, 1,
-2.425831, -0.9713351, -1.647576, 1, 0.04705882, 0, 1,
-2.359136, -0.31584, -2.812891, 1, 0.05490196, 0, 1,
-2.314027, -0.1035156, -2.898179, 1, 0.05882353, 0, 1,
-2.199848, -1.442942, -0.8875685, 1, 0.06666667, 0, 1,
-2.180104, 0.08109118, -1.277583, 1, 0.07058824, 0, 1,
-2.163604, 0.8714119, -0.4311477, 1, 0.07843138, 0, 1,
-2.144694, -0.5769773, -0.6565729, 1, 0.08235294, 0, 1,
-2.111923, -1.863044, -2.381175, 1, 0.09019608, 0, 1,
-2.1027, -0.4479935, -2.433718, 1, 0.09411765, 0, 1,
-2.085157, 1.586985, -0.7657222, 1, 0.1019608, 0, 1,
-2.046563, 2.393506, 0.458523, 1, 0.1098039, 0, 1,
-2.003198, 0.6798589, -1.595643, 1, 0.1137255, 0, 1,
-1.981897, 1.513972, -2.320424, 1, 0.1215686, 0, 1,
-1.922597, -0.9476009, -2.423486, 1, 0.1254902, 0, 1,
-1.910192, 0.856323, -1.951398, 1, 0.1333333, 0, 1,
-1.906622, -1.617898, -2.89777, 1, 0.1372549, 0, 1,
-1.895776, 0.703725, 0.7035897, 1, 0.145098, 0, 1,
-1.875215, 0.183075, -1.655265, 1, 0.1490196, 0, 1,
-1.874459, -0.192755, -1.375946, 1, 0.1568628, 0, 1,
-1.863823, -0.2888363, -1.790785, 1, 0.1607843, 0, 1,
-1.858746, -0.8538602, -2.743014, 1, 0.1686275, 0, 1,
-1.803954, 1.804207, 1.732418, 1, 0.172549, 0, 1,
-1.786493, -0.6500356, -2.903161, 1, 0.1803922, 0, 1,
-1.782965, -1.488424, -3.235096, 1, 0.1843137, 0, 1,
-1.781444, -0.06983001, -1.972504, 1, 0.1921569, 0, 1,
-1.776323, -0.06778134, -3.843462, 1, 0.1960784, 0, 1,
-1.760684, 1.375025, -0.9118994, 1, 0.2039216, 0, 1,
-1.724856, 1.238819, -1.774444, 1, 0.2117647, 0, 1,
-1.713253, 0.2110824, 0.1930722, 1, 0.2156863, 0, 1,
-1.70815, 0.8472273, -0.734295, 1, 0.2235294, 0, 1,
-1.689347, 0.965362, 0.1561023, 1, 0.227451, 0, 1,
-1.686481, -1.119755, -2.396773, 1, 0.2352941, 0, 1,
-1.683691, 0.7940509, -1.298198, 1, 0.2392157, 0, 1,
-1.65724, -0.1697051, -2.727853, 1, 0.2470588, 0, 1,
-1.644869, 0.5965409, -1.413666, 1, 0.2509804, 0, 1,
-1.633255, 0.362806, -1.814722, 1, 0.2588235, 0, 1,
-1.63075, 0.5637755, -0.5842883, 1, 0.2627451, 0, 1,
-1.626514, 0.9505383, -1.621276, 1, 0.2705882, 0, 1,
-1.62027, 0.4304621, -1.887814, 1, 0.2745098, 0, 1,
-1.617562, -0.1910338, -1.834164, 1, 0.282353, 0, 1,
-1.608559, -0.663756, -1.361568, 1, 0.2862745, 0, 1,
-1.607371, -0.6159644, -0.8366223, 1, 0.2941177, 0, 1,
-1.605314, 0.1681472, -0.8942933, 1, 0.3019608, 0, 1,
-1.594716, -0.1149909, -2.43258, 1, 0.3058824, 0, 1,
-1.593037, -1.765803, -2.980831, 1, 0.3137255, 0, 1,
-1.590926, -0.2984243, -1.611951, 1, 0.3176471, 0, 1,
-1.588835, 0.2858747, -1.70783, 1, 0.3254902, 0, 1,
-1.581586, -1.414689, -1.709832, 1, 0.3294118, 0, 1,
-1.580696, -0.231803, -0.5195827, 1, 0.3372549, 0, 1,
-1.575706, 0.388655, -1.3006, 1, 0.3411765, 0, 1,
-1.572244, 0.3241955, -1.594522, 1, 0.3490196, 0, 1,
-1.571996, 0.05154115, -1.302119, 1, 0.3529412, 0, 1,
-1.563834, -0.9067335, -2.94847, 1, 0.3607843, 0, 1,
-1.557429, -0.0953959, -2.384612, 1, 0.3647059, 0, 1,
-1.551382, 0.381856, -2.654582, 1, 0.372549, 0, 1,
-1.542552, 2.251947, 0.4891541, 1, 0.3764706, 0, 1,
-1.533838, 0.9373536, -1.090905, 1, 0.3843137, 0, 1,
-1.527771, 1.051623, -3.339555, 1, 0.3882353, 0, 1,
-1.527096, -2.351872, -2.62503, 1, 0.3960784, 0, 1,
-1.519979, 1.997126, -0.8154343, 1, 0.4039216, 0, 1,
-1.510267, -1.056412, -2.668303, 1, 0.4078431, 0, 1,
-1.509129, -0.8749381, -0.9940693, 1, 0.4156863, 0, 1,
-1.50907, 1.569582, -1.580729, 1, 0.4196078, 0, 1,
-1.506034, -0.2003284, -2.117408, 1, 0.427451, 0, 1,
-1.499959, -0.02632532, 0.4450834, 1, 0.4313726, 0, 1,
-1.492077, 0.185083, -0.8014636, 1, 0.4392157, 0, 1,
-1.4666, -0.2328247, -1.388504, 1, 0.4431373, 0, 1,
-1.463142, 0.3323931, -1.946222, 1, 0.4509804, 0, 1,
-1.45768, -0.518981, -5.03871, 1, 0.454902, 0, 1,
-1.448927, -0.1957756, -3.357976, 1, 0.4627451, 0, 1,
-1.440757, 1.826918, 0.2167688, 1, 0.4666667, 0, 1,
-1.440612, -0.6162345, -0.04297364, 1, 0.4745098, 0, 1,
-1.430006, -0.1668271, -0.5382589, 1, 0.4784314, 0, 1,
-1.426909, -0.7949578, -2.163646, 1, 0.4862745, 0, 1,
-1.42396, -0.632664, -2.478796, 1, 0.4901961, 0, 1,
-1.410241, -0.6603587, -1.844939, 1, 0.4980392, 0, 1,
-1.40096, 1.726014, -2.341943, 1, 0.5058824, 0, 1,
-1.399097, -0.308909, -0.7386185, 1, 0.509804, 0, 1,
-1.393793, 2.115053, -1.70346, 1, 0.5176471, 0, 1,
-1.38025, 0.3608161, -0.5967653, 1, 0.5215687, 0, 1,
-1.37762, 0.8005434, -1.589768, 1, 0.5294118, 0, 1,
-1.37706, 1.029618, -1.229352, 1, 0.5333334, 0, 1,
-1.370497, 1.21651, -1.394328, 1, 0.5411765, 0, 1,
-1.360112, 1.123503, -0.3307996, 1, 0.5450981, 0, 1,
-1.344847, 1.211968, -1.171696, 1, 0.5529412, 0, 1,
-1.342429, -0.5576724, -2.612467, 1, 0.5568628, 0, 1,
-1.33832, 0.5059018, -1.443615, 1, 0.5647059, 0, 1,
-1.332586, -0.2085918, -2.75986, 1, 0.5686275, 0, 1,
-1.320349, 0.3726094, -1.708705, 1, 0.5764706, 0, 1,
-1.316347, 1.770326, -1.05763, 1, 0.5803922, 0, 1,
-1.311909, -1.050374, -1.861956, 1, 0.5882353, 0, 1,
-1.302447, 0.1293163, -0.9441899, 1, 0.5921569, 0, 1,
-1.299938, -0.7532592, -2.499121, 1, 0.6, 0, 1,
-1.286763, 1.16303, -2.913739, 1, 0.6078432, 0, 1,
-1.285564, -1.359942, -3.099528, 1, 0.6117647, 0, 1,
-1.267983, -0.8783482, -3.579907, 1, 0.6196079, 0, 1,
-1.264587, -0.2232276, -2.766866, 1, 0.6235294, 0, 1,
-1.263928, 0.8245583, -1.007892, 1, 0.6313726, 0, 1,
-1.258232, -1.322969, -3.147117, 1, 0.6352941, 0, 1,
-1.246386, 0.01820439, -1.076457, 1, 0.6431373, 0, 1,
-1.245394, -0.4626961, -1.240927, 1, 0.6470588, 0, 1,
-1.235808, 0.6338316, -1.677647, 1, 0.654902, 0, 1,
-1.224852, -0.4171437, -3.11618, 1, 0.6588235, 0, 1,
-1.218861, 0.8170452, -3.208513, 1, 0.6666667, 0, 1,
-1.217624, 1.968787, -2.24996, 1, 0.6705883, 0, 1,
-1.215075, 2.825141, 0.667388, 1, 0.6784314, 0, 1,
-1.206894, -0.2722964, -0.7936974, 1, 0.682353, 0, 1,
-1.194203, -0.08444756, -1.575103, 1, 0.6901961, 0, 1,
-1.192605, -1.327066, -2.722875, 1, 0.6941177, 0, 1,
-1.186999, 0.3793945, -1.881346, 1, 0.7019608, 0, 1,
-1.181772, -0.6262646, -2.477135, 1, 0.7098039, 0, 1,
-1.178755, 0.9108359, 0.1318955, 1, 0.7137255, 0, 1,
-1.178687, 2.037716, -2.052575, 1, 0.7215686, 0, 1,
-1.17605, 1.720435, 0.2249905, 1, 0.7254902, 0, 1,
-1.169716, -0.2385112, -3.260778, 1, 0.7333333, 0, 1,
-1.165401, -0.8166779, -1.167856, 1, 0.7372549, 0, 1,
-1.162841, 1.799099, -1.063869, 1, 0.7450981, 0, 1,
-1.157497, 1.901693, -2.310272, 1, 0.7490196, 0, 1,
-1.156154, 0.1006356, -1.20624, 1, 0.7568628, 0, 1,
-1.144654, 1.116366, -2.056725, 1, 0.7607843, 0, 1,
-1.14248, 0.111378, -1.858025, 1, 0.7686275, 0, 1,
-1.125551, -0.5056607, -1.429735, 1, 0.772549, 0, 1,
-1.116778, -1.13925, -1.998782, 1, 0.7803922, 0, 1,
-1.115452, 0.05128244, -1.437833, 1, 0.7843137, 0, 1,
-1.105831, 0.1641902, 0.4553666, 1, 0.7921569, 0, 1,
-1.104306, 0.08128291, -0.6674285, 1, 0.7960784, 0, 1,
-1.100927, -0.1797031, -1.103001, 1, 0.8039216, 0, 1,
-1.097139, -0.2691095, -1.320526, 1, 0.8117647, 0, 1,
-1.097075, -1.532815, -4.13144, 1, 0.8156863, 0, 1,
-1.095256, 0.2970145, 0.1541443, 1, 0.8235294, 0, 1,
-1.089031, -2.047594, -2.425839, 1, 0.827451, 0, 1,
-1.083422, 2.046549, -0.0030704, 1, 0.8352941, 0, 1,
-1.07016, 1.344961, -0.7485906, 1, 0.8392157, 0, 1,
-1.068118, -0.2044742, -1.945495, 1, 0.8470588, 0, 1,
-1.065159, 0.5054913, -0.164886, 1, 0.8509804, 0, 1,
-1.061817, 1.428653, 0.003621519, 1, 0.8588235, 0, 1,
-1.059058, 0.3687979, -0.1708557, 1, 0.8627451, 0, 1,
-1.056046, -0.3459012, -1.751932, 1, 0.8705882, 0, 1,
-1.055515, 0.7865859, -1.011985, 1, 0.8745098, 0, 1,
-1.055192, -0.6895577, -2.25687, 1, 0.8823529, 0, 1,
-1.046386, -0.3726974, -3.351085, 1, 0.8862745, 0, 1,
-1.037166, 0.2748447, -0.7171386, 1, 0.8941177, 0, 1,
-1.031726, -1.512912, -1.34124, 1, 0.8980392, 0, 1,
-1.026133, 0.5518076, -0.1833358, 1, 0.9058824, 0, 1,
-1.025243, 0.682642, -0.2377578, 1, 0.9137255, 0, 1,
-1.023842, 0.7279882, -1.806177, 1, 0.9176471, 0, 1,
-1.023509, 0.7286919, -0.6467542, 1, 0.9254902, 0, 1,
-1.020354, 0.5306907, -1.327885, 1, 0.9294118, 0, 1,
-1.001037, -0.111766, -0.05212567, 1, 0.9372549, 0, 1,
-0.9948643, 0.2052687, -2.023391, 1, 0.9411765, 0, 1,
-0.9918343, -1.156, -3.137493, 1, 0.9490196, 0, 1,
-0.9825086, 0.4599147, -1.548662, 1, 0.9529412, 0, 1,
-0.9808462, 0.3096715, -1.81615, 1, 0.9607843, 0, 1,
-0.9764601, 0.1775588, -3.81319, 1, 0.9647059, 0, 1,
-0.9726931, -1.233398, -1.235338, 1, 0.972549, 0, 1,
-0.9674337, 0.6909029, -0.4384445, 1, 0.9764706, 0, 1,
-0.9673737, 0.5859139, -1.435516, 1, 0.9843137, 0, 1,
-0.9667007, -1.655822, -2.240386, 1, 0.9882353, 0, 1,
-0.9563134, 1.361281, -0.7255615, 1, 0.9960784, 0, 1,
-0.9484155, -1.246667, -3.876421, 0.9960784, 1, 0, 1,
-0.945234, 1.391727, -1.497901, 0.9921569, 1, 0, 1,
-0.9442885, 0.6462753, -0.2814093, 0.9843137, 1, 0, 1,
-0.939931, 1.152652, -0.8405502, 0.9803922, 1, 0, 1,
-0.9398535, 0.4955266, -3.237019, 0.972549, 1, 0, 1,
-0.9323584, 1.00549, 0.4761639, 0.9686275, 1, 0, 1,
-0.9293666, 1.416934, -0.6958137, 0.9607843, 1, 0, 1,
-0.9261073, 0.7476681, -2.609801, 0.9568627, 1, 0, 1,
-0.9212237, 0.2232923, 0.5361121, 0.9490196, 1, 0, 1,
-0.9174402, -0.327689, -0.1704473, 0.945098, 1, 0, 1,
-0.9144684, 1.012006, -2.662973, 0.9372549, 1, 0, 1,
-0.913223, 0.1793913, -2.03669, 0.9333333, 1, 0, 1,
-0.9090517, 0.707897, -1.745077, 0.9254902, 1, 0, 1,
-0.9040522, -0.5980177, -1.851744, 0.9215686, 1, 0, 1,
-0.8988291, 2.89424, 0.4659859, 0.9137255, 1, 0, 1,
-0.8890995, 0.2594305, -1.74911, 0.9098039, 1, 0, 1,
-0.8868459, -1.045584, -1.198461, 0.9019608, 1, 0, 1,
-0.8843237, -0.2620147, -2.235947, 0.8941177, 1, 0, 1,
-0.8826262, 1.073569, 1.099976, 0.8901961, 1, 0, 1,
-0.8780408, 0.3930701, -0.6814976, 0.8823529, 1, 0, 1,
-0.8748724, -0.282915, -2.21707, 0.8784314, 1, 0, 1,
-0.8508452, -0.5051249, -1.340664, 0.8705882, 1, 0, 1,
-0.8507068, -0.3793786, -0.8244234, 0.8666667, 1, 0, 1,
-0.8502071, -0.6290181, -2.43722, 0.8588235, 1, 0, 1,
-0.8492302, 1.352301, 0.2660882, 0.854902, 1, 0, 1,
-0.8397727, -0.3757857, -1.966481, 0.8470588, 1, 0, 1,
-0.8360599, -1.795842, -3.327951, 0.8431373, 1, 0, 1,
-0.8313682, 0.09743274, -0.7599091, 0.8352941, 1, 0, 1,
-0.8308008, -1.463117, -4.081083, 0.8313726, 1, 0, 1,
-0.829717, 1.07737, 0.5918742, 0.8235294, 1, 0, 1,
-0.8285224, -0.4774494, -2.544405, 0.8196079, 1, 0, 1,
-0.820864, 0.7719589, -0.3613227, 0.8117647, 1, 0, 1,
-0.8146947, -0.01364572, -1.763744, 0.8078431, 1, 0, 1,
-0.8087046, 0.4755139, -2.238442, 0.8, 1, 0, 1,
-0.8016366, 1.621114, -0.002453646, 0.7921569, 1, 0, 1,
-0.8001523, 0.02565004, -0.3709123, 0.7882353, 1, 0, 1,
-0.7943717, -0.2307506, -3.393278, 0.7803922, 1, 0, 1,
-0.7894704, -0.3000414, -2.074344, 0.7764706, 1, 0, 1,
-0.7869902, -1.026257, -3.70792, 0.7686275, 1, 0, 1,
-0.7820874, 1.543537, -0.5527887, 0.7647059, 1, 0, 1,
-0.7810073, -0.2694061, -2.350644, 0.7568628, 1, 0, 1,
-0.7721562, -0.05811855, -0.6071823, 0.7529412, 1, 0, 1,
-0.7720315, 0.5710812, -1.496653, 0.7450981, 1, 0, 1,
-0.7694595, 0.1229196, -3.406757, 0.7411765, 1, 0, 1,
-0.7616109, 0.4273945, 0.09698856, 0.7333333, 1, 0, 1,
-0.7604319, 0.403443, -0.4422429, 0.7294118, 1, 0, 1,
-0.7409527, -1.050199, -2.691106, 0.7215686, 1, 0, 1,
-0.7396885, 1.59493, 0.07999276, 0.7176471, 1, 0, 1,
-0.7321416, 0.7385924, -0.1072997, 0.7098039, 1, 0, 1,
-0.7301237, 0.9205984, -0.1824924, 0.7058824, 1, 0, 1,
-0.7291408, -1.697839, -4.377695, 0.6980392, 1, 0, 1,
-0.7238292, -0.2651652, -1.576463, 0.6901961, 1, 0, 1,
-0.7224247, 0.742865, -0.7913745, 0.6862745, 1, 0, 1,
-0.7212819, 1.101001, -1.252307, 0.6784314, 1, 0, 1,
-0.7205377, 2.75165, -0.2891707, 0.6745098, 1, 0, 1,
-0.7201787, 0.0946493, -0.882749, 0.6666667, 1, 0, 1,
-0.7170302, -0.2893859, -3.141818, 0.6627451, 1, 0, 1,
-0.7159376, 0.7005132, -1.156654, 0.654902, 1, 0, 1,
-0.715279, -0.8867903, -4.914294, 0.6509804, 1, 0, 1,
-0.7152658, -1.264822, -2.290848, 0.6431373, 1, 0, 1,
-0.7065574, 2.116251, 0.02282027, 0.6392157, 1, 0, 1,
-0.7024924, 0.9293783, -0.9807236, 0.6313726, 1, 0, 1,
-0.6931697, 0.9904147, -1.468592, 0.627451, 1, 0, 1,
-0.6924339, 1.081503, -1.342877, 0.6196079, 1, 0, 1,
-0.692312, 0.01690425, -2.740605, 0.6156863, 1, 0, 1,
-0.6887456, -0.6299545, -1.741721, 0.6078432, 1, 0, 1,
-0.6874651, 0.3992055, -2.430619, 0.6039216, 1, 0, 1,
-0.6860333, -0.2103592, -1.825749, 0.5960785, 1, 0, 1,
-0.685324, -0.5152571, -1.707319, 0.5882353, 1, 0, 1,
-0.6841939, 0.1520496, -2.812385, 0.5843138, 1, 0, 1,
-0.681958, 1.158862, -2.264616, 0.5764706, 1, 0, 1,
-0.6786156, 0.377263, -0.9812534, 0.572549, 1, 0, 1,
-0.6783401, -0.1570144, -1.785523, 0.5647059, 1, 0, 1,
-0.6781825, -0.4687788, -2.844034, 0.5607843, 1, 0, 1,
-0.6766009, 0.5056264, -1.809674, 0.5529412, 1, 0, 1,
-0.6750408, -0.1446515, -2.622591, 0.5490196, 1, 0, 1,
-0.6624331, -0.8488695, -3.110409, 0.5411765, 1, 0, 1,
-0.6601732, 0.1655162, -2.457839, 0.5372549, 1, 0, 1,
-0.6599096, -1.637589, -3.054502, 0.5294118, 1, 0, 1,
-0.6530385, 0.09851108, -1.02282, 0.5254902, 1, 0, 1,
-0.6415083, -0.9957445, -3.344948, 0.5176471, 1, 0, 1,
-0.6383755, -0.8678184, -2.924294, 0.5137255, 1, 0, 1,
-0.6362967, -1.578618, -1.900099, 0.5058824, 1, 0, 1,
-0.6315863, 0.1280946, -2.990061, 0.5019608, 1, 0, 1,
-0.6293291, -0.01439461, 1.330119, 0.4941176, 1, 0, 1,
-0.6174173, 0.7764341, -0.02754505, 0.4862745, 1, 0, 1,
-0.6136315, -0.9689459, -4.246843, 0.4823529, 1, 0, 1,
-0.6121755, -0.9351206, -4.684775, 0.4745098, 1, 0, 1,
-0.6084787, -1.339021, -1.500694, 0.4705882, 1, 0, 1,
-0.6064438, -1.002636, -2.603878, 0.4627451, 1, 0, 1,
-0.6022055, 0.3128062, -2.933841, 0.4588235, 1, 0, 1,
-0.6020834, 1.980192, -1.166626, 0.4509804, 1, 0, 1,
-0.5938463, 0.982379, -0.5650858, 0.4470588, 1, 0, 1,
-0.5918381, 0.6095756, -0.2973134, 0.4392157, 1, 0, 1,
-0.5806147, 0.3366779, -0.3382396, 0.4352941, 1, 0, 1,
-0.5731016, -0.2348683, -1.395246, 0.427451, 1, 0, 1,
-0.5724656, 0.4033357, 0.3192948, 0.4235294, 1, 0, 1,
-0.5721083, 0.02930826, -1.618986, 0.4156863, 1, 0, 1,
-0.5596086, -0.7659973, -2.28045, 0.4117647, 1, 0, 1,
-0.5567323, -1.215552, -1.924769, 0.4039216, 1, 0, 1,
-0.5551756, -0.155871, 0.4207416, 0.3960784, 1, 0, 1,
-0.5545233, 0.1077136, -1.204142, 0.3921569, 1, 0, 1,
-0.5538799, -1.595246, -2.936511, 0.3843137, 1, 0, 1,
-0.5536954, -0.001657688, -2.035924, 0.3803922, 1, 0, 1,
-0.550622, -0.5890313, -2.836767, 0.372549, 1, 0, 1,
-0.5504302, 1.14685, -0.7191021, 0.3686275, 1, 0, 1,
-0.5415701, 0.1332911, -2.002136, 0.3607843, 1, 0, 1,
-0.5399325, -0.438087, -1.593539, 0.3568628, 1, 0, 1,
-0.5396762, 0.2381901, -0.344893, 0.3490196, 1, 0, 1,
-0.5378445, 0.494652, -1.650655, 0.345098, 1, 0, 1,
-0.5373203, -0.02146262, -0.8349978, 0.3372549, 1, 0, 1,
-0.5263125, 0.4068923, -0.5893536, 0.3333333, 1, 0, 1,
-0.5258646, 0.137655, 0.1184711, 0.3254902, 1, 0, 1,
-0.5256981, 0.1692602, -2.031813, 0.3215686, 1, 0, 1,
-0.5224847, 0.1283489, -0.4775266, 0.3137255, 1, 0, 1,
-0.5173205, 0.03947065, -2.211901, 0.3098039, 1, 0, 1,
-0.5150504, 0.1661051, -1.659661, 0.3019608, 1, 0, 1,
-0.5139264, -0.06975416, 0.3367206, 0.2941177, 1, 0, 1,
-0.5095982, -1.354235, -2.904713, 0.2901961, 1, 0, 1,
-0.5095506, -0.8558765, -0.4049141, 0.282353, 1, 0, 1,
-0.5058964, 1.801534, -1.329312, 0.2784314, 1, 0, 1,
-0.4988472, -1.18234, -1.52133, 0.2705882, 1, 0, 1,
-0.4929112, 0.3152349, -1.261411, 0.2666667, 1, 0, 1,
-0.4874542, -0.7406319, -3.568253, 0.2588235, 1, 0, 1,
-0.4839187, -0.04300484, -1.959229, 0.254902, 1, 0, 1,
-0.4823024, 1.487593, -0.1557931, 0.2470588, 1, 0, 1,
-0.479972, 0.06247431, -2.263625, 0.2431373, 1, 0, 1,
-0.4776537, -0.5372767, -2.922279, 0.2352941, 1, 0, 1,
-0.4757014, 0.1366574, -0.1146941, 0.2313726, 1, 0, 1,
-0.4722865, -0.9130945, -3.551442, 0.2235294, 1, 0, 1,
-0.459935, 0.6179622, 0.0665317, 0.2196078, 1, 0, 1,
-0.458997, -0.3952529, -2.84465, 0.2117647, 1, 0, 1,
-0.4576442, 0.02407544, -0.3294518, 0.2078431, 1, 0, 1,
-0.4554296, 0.5421523, -0.7091038, 0.2, 1, 0, 1,
-0.4504463, 0.0802961, 1.014861, 0.1921569, 1, 0, 1,
-0.4460368, 0.537149, 0.2781354, 0.1882353, 1, 0, 1,
-0.4426481, -1.387857, -2.731456, 0.1803922, 1, 0, 1,
-0.4393629, -0.6491629, -2.101787, 0.1764706, 1, 0, 1,
-0.4375375, 0.3094759, 0.09958684, 0.1686275, 1, 0, 1,
-0.4374042, 1.209217, 0.479953, 0.1647059, 1, 0, 1,
-0.4367696, 1.187098, -0.06747744, 0.1568628, 1, 0, 1,
-0.4321238, -0.163036, -2.2718, 0.1529412, 1, 0, 1,
-0.4249845, -0.5452999, -3.839949, 0.145098, 1, 0, 1,
-0.4243791, -1.177105, -2.573537, 0.1411765, 1, 0, 1,
-0.4235801, -0.5641625, -2.342858, 0.1333333, 1, 0, 1,
-0.4235323, -0.0432093, -1.023229, 0.1294118, 1, 0, 1,
-0.4229214, 0.04137018, -1.975484, 0.1215686, 1, 0, 1,
-0.4214259, -1.509756, -3.125869, 0.1176471, 1, 0, 1,
-0.4189258, 0.1283801, -1.548397, 0.1098039, 1, 0, 1,
-0.416979, 0.8142128, -0.2371143, 0.1058824, 1, 0, 1,
-0.414427, -1.884683, -2.619478, 0.09803922, 1, 0, 1,
-0.405934, -1.140851, -2.740892, 0.09019608, 1, 0, 1,
-0.4040207, -1.794833, -2.207462, 0.08627451, 1, 0, 1,
-0.4006154, -0.6653394, -4.182955, 0.07843138, 1, 0, 1,
-0.4004799, 1.605512, -0.71997, 0.07450981, 1, 0, 1,
-0.3993804, -0.2851804, -3.270801, 0.06666667, 1, 0, 1,
-0.3949716, -0.3615711, -3.104658, 0.0627451, 1, 0, 1,
-0.3931145, 0.3199646, 0.1837392, 0.05490196, 1, 0, 1,
-0.3919794, -1.247459, -1.688745, 0.05098039, 1, 0, 1,
-0.3894223, -1.387952, -2.241206, 0.04313726, 1, 0, 1,
-0.3881554, -1.580478, -1.98812, 0.03921569, 1, 0, 1,
-0.3827948, -0.586657, -1.879809, 0.03137255, 1, 0, 1,
-0.3794146, 0.7459821, -1.883623, 0.02745098, 1, 0, 1,
-0.3769076, -0.2592905, -1.400905, 0.01960784, 1, 0, 1,
-0.3762185, 2.029182, 0.1711034, 0.01568628, 1, 0, 1,
-0.3753578, -1.134712, -2.723733, 0.007843138, 1, 0, 1,
-0.3731703, -0.6295927, -0.4991105, 0.003921569, 1, 0, 1,
-0.3726042, -1.111002, -3.148622, 0, 1, 0.003921569, 1,
-0.3688878, -2.017878, -2.872278, 0, 1, 0.01176471, 1,
-0.3676324, -1.021647, -1.699284, 0, 1, 0.01568628, 1,
-0.3653261, 0.04207701, 0.4103723, 0, 1, 0.02352941, 1,
-0.3637921, -0.8672757, -2.248485, 0, 1, 0.02745098, 1,
-0.3553356, 0.06416006, -0.8887246, 0, 1, 0.03529412, 1,
-0.3531605, -0.1571869, -3.15819, 0, 1, 0.03921569, 1,
-0.3492824, -0.7177868, -2.502292, 0, 1, 0.04705882, 1,
-0.3479145, 0.5507826, 1.094075, 0, 1, 0.05098039, 1,
-0.3451667, -0.208062, -1.998616, 0, 1, 0.05882353, 1,
-0.3435678, -0.7808833, -2.640541, 0, 1, 0.0627451, 1,
-0.3432622, 0.7780644, -0.0847001, 0, 1, 0.07058824, 1,
-0.3427249, -1.457386, -3.048885, 0, 1, 0.07450981, 1,
-0.3381366, 0.6120601, -0.1219771, 0, 1, 0.08235294, 1,
-0.3362647, 0.1261925, -0.6434797, 0, 1, 0.08627451, 1,
-0.332262, -0.5418186, -3.500374, 0, 1, 0.09411765, 1,
-0.3311314, -0.6316052, -3.551124, 0, 1, 0.1019608, 1,
-0.3290268, 0.1116974, -1.507539, 0, 1, 0.1058824, 1,
-0.327071, 0.4332973, -1.273015, 0, 1, 0.1137255, 1,
-0.3240604, -2.146421, -3.378002, 0, 1, 0.1176471, 1,
-0.3186139, -1.032324, -3.267699, 0, 1, 0.1254902, 1,
-0.318359, 1.222814, 1.186501, 0, 1, 0.1294118, 1,
-0.3116731, 0.8179922, 0.5235432, 0, 1, 0.1372549, 1,
-0.3113494, 0.3390396, -1.544723, 0, 1, 0.1411765, 1,
-0.3088849, -1.947054, -2.5432, 0, 1, 0.1490196, 1,
-0.3043233, -0.006639538, -0.2261196, 0, 1, 0.1529412, 1,
-0.3005058, -0.9411874, -2.740104, 0, 1, 0.1607843, 1,
-0.3004829, -0.5354837, -4.011555, 0, 1, 0.1647059, 1,
-0.2883163, -0.7680757, -2.676559, 0, 1, 0.172549, 1,
-0.2882282, -0.1998177, -1.221635, 0, 1, 0.1764706, 1,
-0.2881111, 0.2151378, 0.02103346, 0, 1, 0.1843137, 1,
-0.2877215, 0.7506898, -1.060735, 0, 1, 0.1882353, 1,
-0.2841588, 1.01886, -1.25243, 0, 1, 0.1960784, 1,
-0.2804602, 0.3456478, -1.314125, 0, 1, 0.2039216, 1,
-0.279035, 0.8861898, -0.1523239, 0, 1, 0.2078431, 1,
-0.276211, 0.9805207, 0.1698046, 0, 1, 0.2156863, 1,
-0.2750059, 2.425109, -2.598177, 0, 1, 0.2196078, 1,
-0.2697079, 2.239435, -0.3125913, 0, 1, 0.227451, 1,
-0.2671641, 1.513537, 0.7700977, 0, 1, 0.2313726, 1,
-0.2655361, 0.02382053, -2.000612, 0, 1, 0.2392157, 1,
-0.2636013, -0.3262519, -0.6577881, 0, 1, 0.2431373, 1,
-0.2618762, 0.03032542, -2.825402, 0, 1, 0.2509804, 1,
-0.2591233, -0.007906653, -1.291017, 0, 1, 0.254902, 1,
-0.2501336, 0.9777141, 0.3423007, 0, 1, 0.2627451, 1,
-0.2456744, -0.8077236, -2.821472, 0, 1, 0.2666667, 1,
-0.2436542, -0.9252526, -3.944001, 0, 1, 0.2745098, 1,
-0.2427946, 0.4345521, -0.05358133, 0, 1, 0.2784314, 1,
-0.2418935, 0.103041, -2.739157, 0, 1, 0.2862745, 1,
-0.2397372, -0.2428527, -4.688041, 0, 1, 0.2901961, 1,
-0.2377748, -0.4036189, -3.043033, 0, 1, 0.2980392, 1,
-0.2357654, -0.8357947, -3.884877, 0, 1, 0.3058824, 1,
-0.2306241, 0.4728929, -0.4816971, 0, 1, 0.3098039, 1,
-0.229162, 1.283914, 0.4310813, 0, 1, 0.3176471, 1,
-0.2290647, -0.4083285, -3.118426, 0, 1, 0.3215686, 1,
-0.2286832, -0.7381947, -2.964354, 0, 1, 0.3294118, 1,
-0.2281438, 0.03751108, 0.5818323, 0, 1, 0.3333333, 1,
-0.2201006, 0.3035188, -1.303606, 0, 1, 0.3411765, 1,
-0.2172969, -1.649141, -2.335281, 0, 1, 0.345098, 1,
-0.2151088, -1.705277, -2.953766, 0, 1, 0.3529412, 1,
-0.2125617, -2.058895, -3.581565, 0, 1, 0.3568628, 1,
-0.2083514, 0.5383321, -0.317194, 0, 1, 0.3647059, 1,
-0.2057369, 1.772612, -0.4954525, 0, 1, 0.3686275, 1,
-0.2044496, -0.6655415, -5.030538, 0, 1, 0.3764706, 1,
-0.1952556, -0.3217052, -1.76679, 0, 1, 0.3803922, 1,
-0.1947823, 1.418393, -1.393219, 0, 1, 0.3882353, 1,
-0.1946441, -0.09444104, -1.299396, 0, 1, 0.3921569, 1,
-0.1914027, -0.2275483, -4.170217, 0, 1, 0.4, 1,
-0.1901449, 0.9461582, 1.773582, 0, 1, 0.4078431, 1,
-0.1898448, -0.5177485, -2.605238, 0, 1, 0.4117647, 1,
-0.1889802, 1.478424, 0.8409348, 0, 1, 0.4196078, 1,
-0.1880529, 0.4742293, -1.630642, 0, 1, 0.4235294, 1,
-0.1877275, -0.9920164, -4.498567, 0, 1, 0.4313726, 1,
-0.1819764, -0.01496479, -1.348808, 0, 1, 0.4352941, 1,
-0.1788304, 0.7314332, -1.60915, 0, 1, 0.4431373, 1,
-0.1786937, 0.5462732, -0.06099908, 0, 1, 0.4470588, 1,
-0.1779778, 0.1081415, -4.402026, 0, 1, 0.454902, 1,
-0.1682966, -0.5941394, -1.640131, 0, 1, 0.4588235, 1,
-0.167543, -0.5955563, -3.649036, 0, 1, 0.4666667, 1,
-0.1674881, -0.1364565, -3.28342, 0, 1, 0.4705882, 1,
-0.1674285, 0.4939638, -1.680671, 0, 1, 0.4784314, 1,
-0.1667888, 2.12119, -0.3712743, 0, 1, 0.4823529, 1,
-0.1637457, 0.6318534, -2.33344, 0, 1, 0.4901961, 1,
-0.1634858, -0.8866435, -2.676671, 0, 1, 0.4941176, 1,
-0.155693, -1.634101, -2.74146, 0, 1, 0.5019608, 1,
-0.153127, -1.658899, -3.235424, 0, 1, 0.509804, 1,
-0.1507599, -1.643875, -2.968893, 0, 1, 0.5137255, 1,
-0.1507502, -0.4171478, -1.528635, 0, 1, 0.5215687, 1,
-0.1490303, -1.28833, -3.906917, 0, 1, 0.5254902, 1,
-0.1489453, 0.8932729, -1.004004, 0, 1, 0.5333334, 1,
-0.1470648, 0.1119502, 0.3381804, 0, 1, 0.5372549, 1,
-0.1468323, -0.1969396, -3.100901, 0, 1, 0.5450981, 1,
-0.1450865, -0.7054749, -3.961933, 0, 1, 0.5490196, 1,
-0.1438147, 0.6373295, -0.4308042, 0, 1, 0.5568628, 1,
-0.1376736, -1.704178, -2.988662, 0, 1, 0.5607843, 1,
-0.1374799, 0.6362729, -0.04131115, 0, 1, 0.5686275, 1,
-0.1370049, 0.338149, 0.2372518, 0, 1, 0.572549, 1,
-0.124654, 0.1822317, 0.5600652, 0, 1, 0.5803922, 1,
-0.1219072, 0.9303816, 1.13114, 0, 1, 0.5843138, 1,
-0.1191765, -0.05972292, -1.39088, 0, 1, 0.5921569, 1,
-0.1189821, 0.3727454, -2.23445, 0, 1, 0.5960785, 1,
-0.1188094, -0.278194, -2.181434, 0, 1, 0.6039216, 1,
-0.1162568, -1.282735, -2.066868, 0, 1, 0.6117647, 1,
-0.1142425, 1.55891, -2.970831, 0, 1, 0.6156863, 1,
-0.1135362, -1.077095, -3.026484, 0, 1, 0.6235294, 1,
-0.1111993, 1.265952, -0.3350108, 0, 1, 0.627451, 1,
-0.1003169, 1.498507, -0.2136233, 0, 1, 0.6352941, 1,
-0.09828363, -0.05308191, -3.190927, 0, 1, 0.6392157, 1,
-0.09759528, -0.497546, -1.915272, 0, 1, 0.6470588, 1,
-0.09627083, -0.3663193, -1.59234, 0, 1, 0.6509804, 1,
-0.08849797, 0.05974505, 0.0007712953, 0, 1, 0.6588235, 1,
-0.08222377, -0.5361164, -2.314952, 0, 1, 0.6627451, 1,
-0.08035962, 1.241045, -0.4671602, 0, 1, 0.6705883, 1,
-0.07818814, -1.583445, -2.842512, 0, 1, 0.6745098, 1,
-0.07509457, 0.3602327, -0.8482025, 0, 1, 0.682353, 1,
-0.07488259, 0.440812, 1.469261, 0, 1, 0.6862745, 1,
-0.07485458, 0.6978769, 0.3971487, 0, 1, 0.6941177, 1,
-0.07106892, 0.1401066, -1.759039, 0, 1, 0.7019608, 1,
-0.0707309, -1.037222, -3.885008, 0, 1, 0.7058824, 1,
-0.069247, 0.001988636, -2.328409, 0, 1, 0.7137255, 1,
-0.06530336, 0.04387045, -0.1470037, 0, 1, 0.7176471, 1,
-0.064635, -1.506179, -5.38091, 0, 1, 0.7254902, 1,
-0.062855, -1.673676, -3.067199, 0, 1, 0.7294118, 1,
-0.05800003, -0.003475653, -3.637209, 0, 1, 0.7372549, 1,
-0.05745706, 0.09143991, 0.7747028, 0, 1, 0.7411765, 1,
-0.04973971, 0.4773831, -1.990901, 0, 1, 0.7490196, 1,
-0.04925509, -0.1427595, -2.583081, 0, 1, 0.7529412, 1,
-0.04803902, 0.4105697, -1.302595, 0, 1, 0.7607843, 1,
-0.04708698, 1.404491, 0.9025096, 0, 1, 0.7647059, 1,
-0.04620539, -1.637348, -3.981933, 0, 1, 0.772549, 1,
-0.04575359, 0.2576341, 0.6752396, 0, 1, 0.7764706, 1,
-0.0438698, -1.179372, -2.476202, 0, 1, 0.7843137, 1,
-0.04352676, -0.01733215, -1.646593, 0, 1, 0.7882353, 1,
-0.04301346, -0.8747888, -3.411126, 0, 1, 0.7960784, 1,
-0.04291919, -0.7738596, -3.720288, 0, 1, 0.8039216, 1,
-0.03945462, 0.2229697, -1.380569, 0, 1, 0.8078431, 1,
-0.03850629, 0.2021869, 0.3845455, 0, 1, 0.8156863, 1,
-0.03794217, 0.9999071, 0.9723303, 0, 1, 0.8196079, 1,
-0.03693502, 1.253485, 1.230232, 0, 1, 0.827451, 1,
-0.03673935, -1.539059, -4.243265, 0, 1, 0.8313726, 1,
-0.03395997, -0.9336975, -4.284977, 0, 1, 0.8392157, 1,
-0.03223723, -0.3109875, -2.462547, 0, 1, 0.8431373, 1,
-0.03130181, 0.8318033, 0.7458091, 0, 1, 0.8509804, 1,
-0.02800402, -1.533534, -3.297519, 0, 1, 0.854902, 1,
-0.02756411, -0.3672829, -3.4856, 0, 1, 0.8627451, 1,
-0.02640421, -0.2478302, -4.432691, 0, 1, 0.8666667, 1,
-0.02559006, -1.036483, -2.855086, 0, 1, 0.8745098, 1,
-0.01939745, 0.2641084, 0.6745064, 0, 1, 0.8784314, 1,
-0.01894044, -0.0469484, -2.055772, 0, 1, 0.8862745, 1,
-0.01883872, 0.1231845, -1.00216, 0, 1, 0.8901961, 1,
-0.01763523, 1.14107, -0.5620326, 0, 1, 0.8980392, 1,
-0.006285092, -0.9154608, -4.207647, 0, 1, 0.9058824, 1,
-0.0008109694, -0.6482635, -3.169955, 0, 1, 0.9098039, 1,
0.002884989, -2.000042, 4.106408, 0, 1, 0.9176471, 1,
0.003067931, 0.8438587, -0.7045433, 0, 1, 0.9215686, 1,
0.003829186, 0.9523709, 0.1209871, 0, 1, 0.9294118, 1,
0.004171147, 1.621277, -1.244534, 0, 1, 0.9333333, 1,
0.004867726, 0.4577681, 0.4083797, 0, 1, 0.9411765, 1,
0.006885353, 0.2777261, 0.1606642, 0, 1, 0.945098, 1,
0.01281878, -1.214954, 2.341906, 0, 1, 0.9529412, 1,
0.01522176, 0.2467334, 0.6326888, 0, 1, 0.9568627, 1,
0.01682232, 0.3252299, 1.943025, 0, 1, 0.9647059, 1,
0.0217095, 1.180756, 0.2543407, 0, 1, 0.9686275, 1,
0.02196649, 1.068608, -0.2202424, 0, 1, 0.9764706, 1,
0.02817616, 0.5004147, -0.495218, 0, 1, 0.9803922, 1,
0.02847682, -0.7768306, 3.672553, 0, 1, 0.9882353, 1,
0.02865063, -0.2888458, 3.397805, 0, 1, 0.9921569, 1,
0.03381537, 2.070264, -2.442827, 0, 1, 1, 1,
0.03472885, -0.268042, 3.106292, 0, 0.9921569, 1, 1,
0.03802265, 1.740499, -0.7991707, 0, 0.9882353, 1, 1,
0.03918453, -1.67485, 4.945219, 0, 0.9803922, 1, 1,
0.04247846, -0.8074095, 4.463924, 0, 0.9764706, 1, 1,
0.04526906, -0.3038719, 2.21006, 0, 0.9686275, 1, 1,
0.04713056, 0.8565224, -0.06444411, 0, 0.9647059, 1, 1,
0.04803175, 0.785384, -0.01539712, 0, 0.9568627, 1, 1,
0.04875816, 0.6872127, -0.4271672, 0, 0.9529412, 1, 1,
0.04971154, 0.9019178, 0.7420515, 0, 0.945098, 1, 1,
0.05637396, 0.7769961, 0.8163446, 0, 0.9411765, 1, 1,
0.05683441, 0.1571621, 2.37323, 0, 0.9333333, 1, 1,
0.05724294, 0.4490484, 0.1720352, 0, 0.9294118, 1, 1,
0.06399253, 0.034856, 1.988258, 0, 0.9215686, 1, 1,
0.06622168, -2.02179, 2.537333, 0, 0.9176471, 1, 1,
0.06790467, -1.154227, 1.805641, 0, 0.9098039, 1, 1,
0.07053157, -0.5784062, 3.483563, 0, 0.9058824, 1, 1,
0.07564232, -0.8810393, 3.95402, 0, 0.8980392, 1, 1,
0.07603953, 0.5146365, -0.2701786, 0, 0.8901961, 1, 1,
0.08629415, -0.2023434, 2.529176, 0, 0.8862745, 1, 1,
0.08900635, 0.6640508, 0.1463049, 0, 0.8784314, 1, 1,
0.08939354, -0.678598, 4.361418, 0, 0.8745098, 1, 1,
0.09187149, 0.04584943, 1.953773, 0, 0.8666667, 1, 1,
0.09195004, -0.479839, 3.184662, 0, 0.8627451, 1, 1,
0.09936404, -2.553554, 3.426341, 0, 0.854902, 1, 1,
0.1039076, 0.5349043, 0.03229326, 0, 0.8509804, 1, 1,
0.1044966, 0.1596566, 0.101687, 0, 0.8431373, 1, 1,
0.1047252, 1.914142, 0.4049702, 0, 0.8392157, 1, 1,
0.1059031, 0.9126193, 1.317832, 0, 0.8313726, 1, 1,
0.1065123, 0.3266889, 0.153029, 0, 0.827451, 1, 1,
0.10912, 0.6601425, -0.8134958, 0, 0.8196079, 1, 1,
0.1134496, -0.9581101, 1.53111, 0, 0.8156863, 1, 1,
0.1139833, 1.285211, -1.940877, 0, 0.8078431, 1, 1,
0.1174439, 2.48997, 1.765041, 0, 0.8039216, 1, 1,
0.1178343, -0.4570144, 4.322361, 0, 0.7960784, 1, 1,
0.1180522, 1.352718, -0.3695654, 0, 0.7882353, 1, 1,
0.1208284, -1.230686, 0.9739056, 0, 0.7843137, 1, 1,
0.123312, -1.124908, 3.913402, 0, 0.7764706, 1, 1,
0.1251585, -0.01653948, 4.33293, 0, 0.772549, 1, 1,
0.1273424, 0.9761638, -0.7958757, 0, 0.7647059, 1, 1,
0.1286836, -0.1848986, 1.817484, 0, 0.7607843, 1, 1,
0.1300803, 2.7626, -0.2020866, 0, 0.7529412, 1, 1,
0.1341594, 0.6602227, 0.4302444, 0, 0.7490196, 1, 1,
0.1350135, -0.1549357, 4.017807, 0, 0.7411765, 1, 1,
0.1377034, -0.167167, 3.321223, 0, 0.7372549, 1, 1,
0.1415929, -0.5541332, 1.536205, 0, 0.7294118, 1, 1,
0.1504513, 0.3831319, 0.0171159, 0, 0.7254902, 1, 1,
0.1554027, 0.8196985, -1.509837, 0, 0.7176471, 1, 1,
0.1605495, 1.505388, -0.2806876, 0, 0.7137255, 1, 1,
0.1634189, 0.7327158, -0.01168093, 0, 0.7058824, 1, 1,
0.164264, 0.3874719, 0.2015566, 0, 0.6980392, 1, 1,
0.1643793, 0.7563845, 2.385482, 0, 0.6941177, 1, 1,
0.1698001, 2.588886, -0.6848078, 0, 0.6862745, 1, 1,
0.1723399, -1.490462, 2.544336, 0, 0.682353, 1, 1,
0.1735969, 0.3349369, 3.411416, 0, 0.6745098, 1, 1,
0.1740654, 0.8751155, -0.3472913, 0, 0.6705883, 1, 1,
0.1753954, -1.631589, 3.372506, 0, 0.6627451, 1, 1,
0.1813502, -0.7944881, 3.659992, 0, 0.6588235, 1, 1,
0.1833185, -0.6183644, 2.167835, 0, 0.6509804, 1, 1,
0.1880728, 0.03357117, 0.8345864, 0, 0.6470588, 1, 1,
0.1891067, 0.3561319, -0.4284172, 0, 0.6392157, 1, 1,
0.1906772, 0.3627252, -0.1083871, 0, 0.6352941, 1, 1,
0.1942332, -1.401405, 4.170927, 0, 0.627451, 1, 1,
0.1948819, 0.6430416, 0.8117709, 0, 0.6235294, 1, 1,
0.1966915, -0.8540609, 1.329118, 0, 0.6156863, 1, 1,
0.201342, -0.8385406, 0.7091625, 0, 0.6117647, 1, 1,
0.2052764, 1.365026, -1.361234, 0, 0.6039216, 1, 1,
0.2065798, 2.603598, -0.02549579, 0, 0.5960785, 1, 1,
0.2137605, 0.4855115, 1.389773, 0, 0.5921569, 1, 1,
0.2138391, -1.499984, 0.8901047, 0, 0.5843138, 1, 1,
0.2157895, -0.4233794, 3.15007, 0, 0.5803922, 1, 1,
0.2166198, 0.3348093, 2.023393, 0, 0.572549, 1, 1,
0.2241371, 1.739781, 1.908002, 0, 0.5686275, 1, 1,
0.2303916, -0.6628091, 2.356662, 0, 0.5607843, 1, 1,
0.2332393, 0.3490205, -0.2711569, 0, 0.5568628, 1, 1,
0.2387966, -0.6429857, 2.534824, 0, 0.5490196, 1, 1,
0.2420707, 0.2512648, 1.643994, 0, 0.5450981, 1, 1,
0.2449424, 1.310041, -0.5222911, 0, 0.5372549, 1, 1,
0.2453193, -1.30346, 3.361185, 0, 0.5333334, 1, 1,
0.2469868, -0.1177948, 4.506111, 0, 0.5254902, 1, 1,
0.2473469, 0.04277759, 2.13289, 0, 0.5215687, 1, 1,
0.2487421, -1.523625, 2.169996, 0, 0.5137255, 1, 1,
0.2489698, -0.5443441, 1.706518, 0, 0.509804, 1, 1,
0.249338, -0.1361236, 1.642597, 0, 0.5019608, 1, 1,
0.2493659, -0.7971087, 4.139312, 0, 0.4941176, 1, 1,
0.249945, 0.5294924, 1.776688, 0, 0.4901961, 1, 1,
0.2502429, 0.3835193, 2.021555, 0, 0.4823529, 1, 1,
0.2542065, 1.630528, 0.5032777, 0, 0.4784314, 1, 1,
0.2601002, -1.632261, 4.116864, 0, 0.4705882, 1, 1,
0.2687802, 0.4544172, 0.9790162, 0, 0.4666667, 1, 1,
0.2693807, -0.351995, 2.121563, 0, 0.4588235, 1, 1,
0.2695091, -0.4850192, 3.52022, 0, 0.454902, 1, 1,
0.2699943, 0.611271, -0.9900601, 0, 0.4470588, 1, 1,
0.2703435, 0.9345624, -0.6565462, 0, 0.4431373, 1, 1,
0.2729049, 0.3989701, 0.6545751, 0, 0.4352941, 1, 1,
0.277243, 0.5951736, 0.3610598, 0, 0.4313726, 1, 1,
0.2804317, 1.085161, 0.2669445, 0, 0.4235294, 1, 1,
0.2848905, -1.300344, 1.363159, 0, 0.4196078, 1, 1,
0.2859727, 0.2699414, 0.7134443, 0, 0.4117647, 1, 1,
0.2892486, -0.01273431, 1.025467, 0, 0.4078431, 1, 1,
0.2914313, 0.7525333, 0.8502611, 0, 0.4, 1, 1,
0.2935666, -1.282007, 3.256976, 0, 0.3921569, 1, 1,
0.2946681, -0.5069085, 3.365086, 0, 0.3882353, 1, 1,
0.2953946, -0.009943893, 4.004977, 0, 0.3803922, 1, 1,
0.2955714, -0.7893942, 3.510157, 0, 0.3764706, 1, 1,
0.2962851, -2.551987, 2.604015, 0, 0.3686275, 1, 1,
0.298314, 1.525766, 0.02737918, 0, 0.3647059, 1, 1,
0.3032639, 1.365338, 0.4846836, 0, 0.3568628, 1, 1,
0.3065526, -0.02029345, 1.56191, 0, 0.3529412, 1, 1,
0.3086703, -0.4340291, 4.107027, 0, 0.345098, 1, 1,
0.30885, -0.1820206, 2.735157, 0, 0.3411765, 1, 1,
0.3090652, -0.5633358, 3.32943, 0, 0.3333333, 1, 1,
0.3092002, 0.6334043, 0.1325239, 0, 0.3294118, 1, 1,
0.3110843, -0.6410251, 1.320166, 0, 0.3215686, 1, 1,
0.3132013, -1.619521, 3.352867, 0, 0.3176471, 1, 1,
0.3136638, -1.3762, 2.765563, 0, 0.3098039, 1, 1,
0.3190238, -0.3209936, 2.941895, 0, 0.3058824, 1, 1,
0.3205837, 1.653982, -0.2843468, 0, 0.2980392, 1, 1,
0.3284886, 1.750916, -2.614857, 0, 0.2901961, 1, 1,
0.3286891, -0.2163385, 4.120801, 0, 0.2862745, 1, 1,
0.3310229, 0.2691661, 1.205676, 0, 0.2784314, 1, 1,
0.3311153, -0.1018833, 1.279594, 0, 0.2745098, 1, 1,
0.3351946, -0.3915448, 0.8418363, 0, 0.2666667, 1, 1,
0.3362249, 0.8238621, 1.291717, 0, 0.2627451, 1, 1,
0.3372474, 0.1997177, 0.2707486, 0, 0.254902, 1, 1,
0.3381898, 1.278899, 0.6320268, 0, 0.2509804, 1, 1,
0.3463402, 1.428662, 0.5552527, 0, 0.2431373, 1, 1,
0.3491344, 0.6171508, 0.4132151, 0, 0.2392157, 1, 1,
0.3542672, 0.5765979, 2.24316, 0, 0.2313726, 1, 1,
0.3545002, -1.298184, 4.445025, 0, 0.227451, 1, 1,
0.3568094, -0.4428471, 3.064632, 0, 0.2196078, 1, 1,
0.3600172, -0.03694308, 2.418295, 0, 0.2156863, 1, 1,
0.3635944, -0.6817196, 3.149515, 0, 0.2078431, 1, 1,
0.3641441, -0.5036417, 1.315515, 0, 0.2039216, 1, 1,
0.373057, 0.960715, 0.4683325, 0, 0.1960784, 1, 1,
0.3734244, 0.4406476, -1.228298, 0, 0.1882353, 1, 1,
0.3790902, 2.027952, 0.3312277, 0, 0.1843137, 1, 1,
0.3814164, -0.3704298, 4.195725, 0, 0.1764706, 1, 1,
0.3827992, 0.6640866, 1.526856, 0, 0.172549, 1, 1,
0.385106, -0.2413315, 1.117748, 0, 0.1647059, 1, 1,
0.3917303, -0.7423198, 2.377981, 0, 0.1607843, 1, 1,
0.3923839, 2.114858, 0.7729006, 0, 0.1529412, 1, 1,
0.3944492, 0.2673903, 2.94147, 0, 0.1490196, 1, 1,
0.3976284, -0.6961411, 3.308453, 0, 0.1411765, 1, 1,
0.3977036, 1.242976, 0.7200444, 0, 0.1372549, 1, 1,
0.4022122, 0.1829387, 0.03809047, 0, 0.1294118, 1, 1,
0.4049275, 0.7974191, -0.02277737, 0, 0.1254902, 1, 1,
0.4052817, 0.03392764, 2.123556, 0, 0.1176471, 1, 1,
0.4063403, 0.7888623, -0.7863519, 0, 0.1137255, 1, 1,
0.4091938, 0.1242668, 0.5348322, 0, 0.1058824, 1, 1,
0.413507, -1.698541, 2.628938, 0, 0.09803922, 1, 1,
0.4139408, 0.9508081, 0.3030831, 0, 0.09411765, 1, 1,
0.4160759, 1.505958, 1.358076, 0, 0.08627451, 1, 1,
0.4222865, -0.8229141, 1.272338, 0, 0.08235294, 1, 1,
0.4223063, -0.8697235, 2.238977, 0, 0.07450981, 1, 1,
0.423693, -1.198588, 2.784234, 0, 0.07058824, 1, 1,
0.4243389, -0.1191084, 2.108395, 0, 0.0627451, 1, 1,
0.4277235, 0.2677326, -0.7101067, 0, 0.05882353, 1, 1,
0.4280211, -0.2905003, 2.093392, 0, 0.05098039, 1, 1,
0.4284745, 0.9273126, 0.9892558, 0, 0.04705882, 1, 1,
0.4290991, 1.253501, -1.01298, 0, 0.03921569, 1, 1,
0.4294719, 0.2231351, 1.060388, 0, 0.03529412, 1, 1,
0.4304247, -1.194659, 1.540624, 0, 0.02745098, 1, 1,
0.4312232, -0.7945015, 3.384989, 0, 0.02352941, 1, 1,
0.4320027, -1.134673, 2.289779, 0, 0.01568628, 1, 1,
0.4338548, 0.4595473, -0.9415312, 0, 0.01176471, 1, 1,
0.436498, 1.971674, -0.6741691, 0, 0.003921569, 1, 1,
0.440003, 0.237528, -0.6879675, 0.003921569, 0, 1, 1,
0.4412521, 0.6388827, -1.42671, 0.007843138, 0, 1, 1,
0.4412819, 0.01766798, 0.8657757, 0.01568628, 0, 1, 1,
0.4475698, -0.7633542, 1.076769, 0.01960784, 0, 1, 1,
0.4483485, 0.1464589, 1.129484, 0.02745098, 0, 1, 1,
0.4508966, 1.189948, -0.4614627, 0.03137255, 0, 1, 1,
0.451313, -0.2718535, 1.319377, 0.03921569, 0, 1, 1,
0.4544956, 1.467072, 0.3730589, 0.04313726, 0, 1, 1,
0.4548272, -0.4800772, 3.790386, 0.05098039, 0, 1, 1,
0.4555961, 2.268509, -0.1776389, 0.05490196, 0, 1, 1,
0.4633868, 0.1993033, 1.328928, 0.0627451, 0, 1, 1,
0.4634467, -0.4037587, 3.074224, 0.06666667, 0, 1, 1,
0.4743489, -0.2418642, 2.834104, 0.07450981, 0, 1, 1,
0.4923431, -0.1507487, 3.049369, 0.07843138, 0, 1, 1,
0.4939309, 0.2602738, 1.595065, 0.08627451, 0, 1, 1,
0.4952227, 0.4346697, 0.829231, 0.09019608, 0, 1, 1,
0.4963678, -0.08797532, 2.123744, 0.09803922, 0, 1, 1,
0.497452, 2.242477, 0.02619077, 0.1058824, 0, 1, 1,
0.4974655, -0.4725243, 2.60975, 0.1098039, 0, 1, 1,
0.5013025, 0.9094865, 1.254297, 0.1176471, 0, 1, 1,
0.5047837, 0.3691186, 1.530121, 0.1215686, 0, 1, 1,
0.5065684, 0.3435807, 1.027994, 0.1294118, 0, 1, 1,
0.5072364, -0.1187296, 1.588675, 0.1333333, 0, 1, 1,
0.5075457, -1.259865, 2.622343, 0.1411765, 0, 1, 1,
0.511798, -1.095812, 3.3463, 0.145098, 0, 1, 1,
0.5124608, -0.3455806, 2.693665, 0.1529412, 0, 1, 1,
0.5152931, -0.5831902, 2.596069, 0.1568628, 0, 1, 1,
0.5217097, -0.6236998, 3.552361, 0.1647059, 0, 1, 1,
0.5265865, -1.701524, 2.33775, 0.1686275, 0, 1, 1,
0.5322102, 0.4392889, 0.9671841, 0.1764706, 0, 1, 1,
0.5328553, 1.333404, -1.121728, 0.1803922, 0, 1, 1,
0.5331088, -0.4059347, 2.102958, 0.1882353, 0, 1, 1,
0.5357056, 1.377693, -1.063887, 0.1921569, 0, 1, 1,
0.5377583, 0.5956343, -0.06165329, 0.2, 0, 1, 1,
0.5429689, 1.053082, -0.20146, 0.2078431, 0, 1, 1,
0.5440772, 1.192085, 0.3191226, 0.2117647, 0, 1, 1,
0.5503368, -0.2985259, 1.936251, 0.2196078, 0, 1, 1,
0.554182, 0.5645658, -0.2804535, 0.2235294, 0, 1, 1,
0.5567878, 0.02273262, 1.68343, 0.2313726, 0, 1, 1,
0.5617738, -0.6651748, 2.654392, 0.2352941, 0, 1, 1,
0.5651956, 0.5876173, 1.143956, 0.2431373, 0, 1, 1,
0.5672344, 1.27425, 1.170427, 0.2470588, 0, 1, 1,
0.5712994, -0.9003462, 0.9049336, 0.254902, 0, 1, 1,
0.5732773, 0.8269404, 0.632279, 0.2588235, 0, 1, 1,
0.5735523, 0.6667538, 2.377764, 0.2666667, 0, 1, 1,
0.5784336, -0.1548153, 2.429157, 0.2705882, 0, 1, 1,
0.5865401, -0.7284495, 3.658996, 0.2784314, 0, 1, 1,
0.5912252, -0.4804885, 3.273089, 0.282353, 0, 1, 1,
0.5981619, -1.437165, 2.246319, 0.2901961, 0, 1, 1,
0.598347, -0.6577266, 2.227891, 0.2941177, 0, 1, 1,
0.59863, 0.1399104, 1.034544, 0.3019608, 0, 1, 1,
0.5989268, 2.012514, 1.312503, 0.3098039, 0, 1, 1,
0.5997439, 0.8905498, -0.4710833, 0.3137255, 0, 1, 1,
0.5999104, 0.4628049, 1.268673, 0.3215686, 0, 1, 1,
0.6002846, 0.9238572, 1.086057, 0.3254902, 0, 1, 1,
0.600894, -0.3574032, 1.336095, 0.3333333, 0, 1, 1,
0.6029576, 0.815504, 2.080552, 0.3372549, 0, 1, 1,
0.6031104, 1.455689, 0.9115063, 0.345098, 0, 1, 1,
0.6040261, 0.263982, 1.371722, 0.3490196, 0, 1, 1,
0.6041321, -1.351002, 3.972728, 0.3568628, 0, 1, 1,
0.606792, -0.4849639, 1.506826, 0.3607843, 0, 1, 1,
0.6085447, -1.428984, 3.277115, 0.3686275, 0, 1, 1,
0.6111212, -0.7975177, 0.7134899, 0.372549, 0, 1, 1,
0.6156374, -1.184027, 1.214169, 0.3803922, 0, 1, 1,
0.6216024, 1.021821, 0.2058375, 0.3843137, 0, 1, 1,
0.622499, 1.255059, 0.02563767, 0.3921569, 0, 1, 1,
0.6240518, -0.3514235, 1.384716, 0.3960784, 0, 1, 1,
0.6243072, -0.383612, 3.575964, 0.4039216, 0, 1, 1,
0.624834, -0.328477, 2.515097, 0.4117647, 0, 1, 1,
0.6279276, -0.389688, 0.9730715, 0.4156863, 0, 1, 1,
0.6324089, 1.555721, 0.3855736, 0.4235294, 0, 1, 1,
0.6336154, 0.4791461, 1.035168, 0.427451, 0, 1, 1,
0.6397777, -0.1122703, 0.5621472, 0.4352941, 0, 1, 1,
0.6442833, 0.8552346, -0.9504298, 0.4392157, 0, 1, 1,
0.6443511, -1.326166, 2.251878, 0.4470588, 0, 1, 1,
0.6514255, -0.9101216, 3.233335, 0.4509804, 0, 1, 1,
0.6523169, 0.3992388, 2.115406, 0.4588235, 0, 1, 1,
0.6534401, -0.264146, 2.576664, 0.4627451, 0, 1, 1,
0.6559449, -0.4300836, 2.038522, 0.4705882, 0, 1, 1,
0.656105, 0.3612046, 1.271674, 0.4745098, 0, 1, 1,
0.6622741, -0.3133715, 1.999365, 0.4823529, 0, 1, 1,
0.6651763, 1.529412, 1.091123, 0.4862745, 0, 1, 1,
0.6652639, 1.150322, -1.349343, 0.4941176, 0, 1, 1,
0.668177, 0.6667123, 0.3514763, 0.5019608, 0, 1, 1,
0.6730423, 0.4346355, 0.9694567, 0.5058824, 0, 1, 1,
0.680178, 0.5723961, 0.7292739, 0.5137255, 0, 1, 1,
0.6824268, 0.2135609, 0.07515622, 0.5176471, 0, 1, 1,
0.6846445, 0.4669256, -0.1725559, 0.5254902, 0, 1, 1,
0.6849889, 1.358446, 0.6749681, 0.5294118, 0, 1, 1,
0.689396, 0.8999439, -0.2109232, 0.5372549, 0, 1, 1,
0.6972201, 0.00856518, 1.983, 0.5411765, 0, 1, 1,
0.6996226, 0.7685432, 1.022464, 0.5490196, 0, 1, 1,
0.7011556, -0.5503216, 1.798416, 0.5529412, 0, 1, 1,
0.7036147, -1.303699, 0.8454199, 0.5607843, 0, 1, 1,
0.7085853, 0.5391507, 2.719178, 0.5647059, 0, 1, 1,
0.7097294, -0.5318037, 1.172676, 0.572549, 0, 1, 1,
0.7120971, 2.533992, 1.47984, 0.5764706, 0, 1, 1,
0.7131206, -1.256423, 3.569548, 0.5843138, 0, 1, 1,
0.7149917, 0.3052954, 0.903268, 0.5882353, 0, 1, 1,
0.715887, 0.5544922, 0.3200376, 0.5960785, 0, 1, 1,
0.7190753, -0.1092837, -1.638806, 0.6039216, 0, 1, 1,
0.7192928, -1.722329, 3.979774, 0.6078432, 0, 1, 1,
0.7301695, -1.944017, 2.892963, 0.6156863, 0, 1, 1,
0.7305663, -1.692971, 2.997241, 0.6196079, 0, 1, 1,
0.7361728, 1.046028, 0.08089763, 0.627451, 0, 1, 1,
0.7377458, -0.1780948, 3.263015, 0.6313726, 0, 1, 1,
0.7389492, -0.1366985, 1.447105, 0.6392157, 0, 1, 1,
0.7405075, -0.3195165, 2.923381, 0.6431373, 0, 1, 1,
0.7415354, 1.140223, 0.1333521, 0.6509804, 0, 1, 1,
0.7432812, -0.9947128, 4.008076, 0.654902, 0, 1, 1,
0.7449771, 1.250865, -0.03330214, 0.6627451, 0, 1, 1,
0.7474771, -0.1530398, 1.919907, 0.6666667, 0, 1, 1,
0.7483661, -1.881389, 2.158642, 0.6745098, 0, 1, 1,
0.7490806, -1.50686, 1.410574, 0.6784314, 0, 1, 1,
0.7515435, 0.6610684, 0.638567, 0.6862745, 0, 1, 1,
0.7547622, 0.556577, 1.259821, 0.6901961, 0, 1, 1,
0.7570824, -0.9830112, 0.1674311, 0.6980392, 0, 1, 1,
0.758328, 0.9843318, -0.4429975, 0.7058824, 0, 1, 1,
0.7602292, 2.811064, -0.06292897, 0.7098039, 0, 1, 1,
0.7609022, 2.366701, 0.4316475, 0.7176471, 0, 1, 1,
0.7692197, -0.6776768, 3.021048, 0.7215686, 0, 1, 1,
0.7698909, 1.110965, -0.4154544, 0.7294118, 0, 1, 1,
0.7757807, -0.8945549, 3.670706, 0.7333333, 0, 1, 1,
0.7782968, -0.5943545, 1.198355, 0.7411765, 0, 1, 1,
0.7809084, -0.98439, 2.272037, 0.7450981, 0, 1, 1,
0.7893606, 1.308146, 1.782047, 0.7529412, 0, 1, 1,
0.7910381, 0.08583417, 3.386927, 0.7568628, 0, 1, 1,
0.7940124, 0.9271423, 1.056237, 0.7647059, 0, 1, 1,
0.8074745, -0.8476639, 1.421498, 0.7686275, 0, 1, 1,
0.8123136, 2.249303, 0.8918026, 0.7764706, 0, 1, 1,
0.8127847, -0.6048194, 2.458667, 0.7803922, 0, 1, 1,
0.8194474, 0.2489204, -0.3178666, 0.7882353, 0, 1, 1,
0.8232852, 0.5194341, 0.8998236, 0.7921569, 0, 1, 1,
0.8263527, -2.120366, 1.416185, 0.8, 0, 1, 1,
0.8299166, -0.5326702, 1.579801, 0.8078431, 0, 1, 1,
0.830382, -0.5936918, 2.495426, 0.8117647, 0, 1, 1,
0.8376288, -0.6205472, 2.631751, 0.8196079, 0, 1, 1,
0.8412193, -2.19691, 3.841869, 0.8235294, 0, 1, 1,
0.8473303, 0.7333137, -0.7103721, 0.8313726, 0, 1, 1,
0.8554249, -0.7557366, 1.890783, 0.8352941, 0, 1, 1,
0.8606164, 0.2302165, 1.075049, 0.8431373, 0, 1, 1,
0.8694105, 0.2704622, -0.9814147, 0.8470588, 0, 1, 1,
0.870972, 0.4153763, 1.546915, 0.854902, 0, 1, 1,
0.8814366, 0.3923956, 2.591775, 0.8588235, 0, 1, 1,
0.8831166, -0.6024935, 2.246878, 0.8666667, 0, 1, 1,
0.8849747, -0.3607308, 1.007679, 0.8705882, 0, 1, 1,
0.8883446, 0.7237505, 1.195791, 0.8784314, 0, 1, 1,
0.8954494, 0.7470558, 0.1186952, 0.8823529, 0, 1, 1,
0.9033833, 0.2191699, 1.583733, 0.8901961, 0, 1, 1,
0.9045485, -0.1262811, 1.60706, 0.8941177, 0, 1, 1,
0.9063252, 1.379941, 1.349817, 0.9019608, 0, 1, 1,
0.9081729, -1.361279, 1.885891, 0.9098039, 0, 1, 1,
0.9081932, -0.01113709, 1.772778, 0.9137255, 0, 1, 1,
0.9154218, -1.840771, 2.184008, 0.9215686, 0, 1, 1,
0.9184031, 2.382447, -0.4115084, 0.9254902, 0, 1, 1,
0.9255191, -1.450523, 1.900308, 0.9333333, 0, 1, 1,
0.9285572, 0.7635925, -1.54804, 0.9372549, 0, 1, 1,
0.9293819, 0.5842083, 1.306661, 0.945098, 0, 1, 1,
0.93413, 0.2025887, 0.8193397, 0.9490196, 0, 1, 1,
0.9435483, 0.2525007, -0.7003188, 0.9568627, 0, 1, 1,
0.9476248, -0.5544661, 1.944287, 0.9607843, 0, 1, 1,
0.9487857, 0.7239092, 1.714221, 0.9686275, 0, 1, 1,
0.9498988, 1.161845, 1.840533, 0.972549, 0, 1, 1,
0.9531947, -1.864061, 1.951374, 0.9803922, 0, 1, 1,
0.9535128, 0.1792096, 0.7978289, 0.9843137, 0, 1, 1,
0.9536641, -0.6274572, 1.727142, 0.9921569, 0, 1, 1,
0.9538378, -0.1196885, 0.7758358, 0.9960784, 0, 1, 1,
0.9555342, -1.366259, 0.3611741, 1, 0, 0.9960784, 1,
0.9555852, -0.03972729, 0.2235623, 1, 0, 0.9882353, 1,
0.958892, 0.5164629, 1.551849, 1, 0, 0.9843137, 1,
0.961172, 0.1221966, 2.421361, 1, 0, 0.9764706, 1,
0.9641761, -0.05779748, 0.4930491, 1, 0, 0.972549, 1,
0.9667707, -0.2821811, 1.589191, 1, 0, 0.9647059, 1,
0.9717533, 0.3643229, 1.697372, 1, 0, 0.9607843, 1,
0.9848042, 0.05215161, 2.354964, 1, 0, 0.9529412, 1,
0.985194, -0.2066706, 2.998599, 1, 0, 0.9490196, 1,
0.9947086, -1.428587, 2.600572, 1, 0, 0.9411765, 1,
1.000742, 0.1628352, -0.8156092, 1, 0, 0.9372549, 1,
1.003507, -0.3144228, 1.930603, 1, 0, 0.9294118, 1,
1.004716, -0.02634859, 1.902462, 1, 0, 0.9254902, 1,
1.005076, -1.085139, 1.759041, 1, 0, 0.9176471, 1,
1.00661, -0.1054428, 2.646805, 1, 0, 0.9137255, 1,
1.006816, -1.305385, 1.099624, 1, 0, 0.9058824, 1,
1.008134, -0.1749884, 1.611009, 1, 0, 0.9019608, 1,
1.013664, -0.3686019, 3.278101, 1, 0, 0.8941177, 1,
1.015651, -0.6126344, 2.590446, 1, 0, 0.8862745, 1,
1.016222, -0.8346584, 3.617239, 1, 0, 0.8823529, 1,
1.023675, -1.43344, 2.890921, 1, 0, 0.8745098, 1,
1.02479, 0.3890238, 3.431455, 1, 0, 0.8705882, 1,
1.028788, 1.010474, 1.300969, 1, 0, 0.8627451, 1,
1.030068, 0.2136893, 0.5917358, 1, 0, 0.8588235, 1,
1.031287, 0.09889143, 1.9442, 1, 0, 0.8509804, 1,
1.032715, 1.841457, 1.954223, 1, 0, 0.8470588, 1,
1.038291, 0.2418453, -0.1927304, 1, 0, 0.8392157, 1,
1.038414, 1.500741, 1.394251, 1, 0, 0.8352941, 1,
1.046471, 1.678983, 1.771644, 1, 0, 0.827451, 1,
1.053844, 1.039697, -0.8669266, 1, 0, 0.8235294, 1,
1.054908, -0.7924969, 1.928782, 1, 0, 0.8156863, 1,
1.056464, 0.07234371, 1.431814, 1, 0, 0.8117647, 1,
1.064007, 0.7061012, -0.04200026, 1, 0, 0.8039216, 1,
1.072021, 1.844532, 0.9926215, 1, 0, 0.7960784, 1,
1.072275, 1.464761, 0.7876907, 1, 0, 0.7921569, 1,
1.074134, 0.08307773, 2.447639, 1, 0, 0.7843137, 1,
1.075903, -1.555568, 2.817235, 1, 0, 0.7803922, 1,
1.087252, 0.536809, 1.398006, 1, 0, 0.772549, 1,
1.094141, -1.909486, 4.299276, 1, 0, 0.7686275, 1,
1.109487, 0.5492703, 1.808269, 1, 0, 0.7607843, 1,
1.111013, -0.7248465, 1.111219, 1, 0, 0.7568628, 1,
1.111674, 0.4647214, 0.9667397, 1, 0, 0.7490196, 1,
1.117501, -0.9669074, 0.06861524, 1, 0, 0.7450981, 1,
1.120294, -0.5733023, 0.9075696, 1, 0, 0.7372549, 1,
1.121203, -0.05415317, 1.738435, 1, 0, 0.7333333, 1,
1.126257, -0.5769808, 2.530866, 1, 0, 0.7254902, 1,
1.131578, -0.1226008, 3.270338, 1, 0, 0.7215686, 1,
1.132702, -0.9221717, 1.711785, 1, 0, 0.7137255, 1,
1.137092, -0.3875833, 1.908574, 1, 0, 0.7098039, 1,
1.142802, -0.1174183, 0.6072227, 1, 0, 0.7019608, 1,
1.145384, -0.7377702, 0.9287882, 1, 0, 0.6941177, 1,
1.145785, 1.380865, -0.2948585, 1, 0, 0.6901961, 1,
1.1496, -0.3292316, 0.7177466, 1, 0, 0.682353, 1,
1.152264, 1.460147, 1.636475, 1, 0, 0.6784314, 1,
1.163775, 1.268438, 1.217699, 1, 0, 0.6705883, 1,
1.164933, -0.6230826, 2.511139, 1, 0, 0.6666667, 1,
1.17114, 1.408625, 1.047181, 1, 0, 0.6588235, 1,
1.179903, 0.3339741, 2.030121, 1, 0, 0.654902, 1,
1.182374, 0.9469222, 1.243776, 1, 0, 0.6470588, 1,
1.190171, 2.191283, 0.5180547, 1, 0, 0.6431373, 1,
1.196395, -0.05223088, 0.0428387, 1, 0, 0.6352941, 1,
1.218567, 1.472769, 1.457739, 1, 0, 0.6313726, 1,
1.220579, 0.6066519, 2.26763, 1, 0, 0.6235294, 1,
1.222798, -2.293703, 0.7894562, 1, 0, 0.6196079, 1,
1.228075, 0.7592698, 0.8646839, 1, 0, 0.6117647, 1,
1.230321, 2.182886, -0.8025981, 1, 0, 0.6078432, 1,
1.234641, 0.8873574, 0.1860384, 1, 0, 0.6, 1,
1.238387, -1.19958, 2.444712, 1, 0, 0.5921569, 1,
1.240433, -1.430164, 2.189528, 1, 0, 0.5882353, 1,
1.244366, -2.442933, 1.460381, 1, 0, 0.5803922, 1,
1.244954, 0.3928412, 3.344204, 1, 0, 0.5764706, 1,
1.246376, 0.1965799, 3.052527, 1, 0, 0.5686275, 1,
1.26303, -1.448177, 2.788034, 1, 0, 0.5647059, 1,
1.268922, 1.154979, 0.03494664, 1, 0, 0.5568628, 1,
1.273162, 1.612974, 1.118295, 1, 0, 0.5529412, 1,
1.276957, 1.207147, 0.6932165, 1, 0, 0.5450981, 1,
1.290896, -1.773285, 2.258691, 1, 0, 0.5411765, 1,
1.293097, -0.3233756, 2.135026, 1, 0, 0.5333334, 1,
1.304211, 0.3596885, 1.837019, 1, 0, 0.5294118, 1,
1.313803, -0.9993835, 2.272176, 1, 0, 0.5215687, 1,
1.314735, 0.6585403, 2.312568, 1, 0, 0.5176471, 1,
1.324899, 0.58982, -0.3814923, 1, 0, 0.509804, 1,
1.335716, 0.9319013, 0.4573992, 1, 0, 0.5058824, 1,
1.341337, -0.5949516, 1.842884, 1, 0, 0.4980392, 1,
1.344049, 0.2449247, 0.741978, 1, 0, 0.4901961, 1,
1.35895, 0.8510695, 2.732699, 1, 0, 0.4862745, 1,
1.368048, -0.4682084, 2.017437, 1, 0, 0.4784314, 1,
1.369371, -0.4334952, 2.793726, 1, 0, 0.4745098, 1,
1.371248, 1.169968, -0.6484084, 1, 0, 0.4666667, 1,
1.383078, -0.4025687, 1.196029, 1, 0, 0.4627451, 1,
1.385398, 0.5291342, 2.303559, 1, 0, 0.454902, 1,
1.387457, 1.214282, 2.410391, 1, 0, 0.4509804, 1,
1.397313, 1.528668, -0.1361253, 1, 0, 0.4431373, 1,
1.400349, -0.3136708, 1.577955, 1, 0, 0.4392157, 1,
1.40318, 1.044822, 1.442767, 1, 0, 0.4313726, 1,
1.411704, 1.183735, 1.206331, 1, 0, 0.427451, 1,
1.416489, -0.7997891, 1.591946, 1, 0, 0.4196078, 1,
1.425788, -1.135945, 2.511152, 1, 0, 0.4156863, 1,
1.426174, -1.010106, 2.884923, 1, 0, 0.4078431, 1,
1.430946, 0.5153875, 0.7986295, 1, 0, 0.4039216, 1,
1.433081, -0.03706715, 2.533734, 1, 0, 0.3960784, 1,
1.442827, 0.5269497, 0.214138, 1, 0, 0.3882353, 1,
1.475767, -0.798072, 1.86443, 1, 0, 0.3843137, 1,
1.475769, 0.4086142, 1.296122, 1, 0, 0.3764706, 1,
1.48159, -0.9984282, 2.529036, 1, 0, 0.372549, 1,
1.487167, -1.356361, 2.59726, 1, 0, 0.3647059, 1,
1.493272, 1.823126, 0.835688, 1, 0, 0.3607843, 1,
1.493654, 1.360581, 0.8570668, 1, 0, 0.3529412, 1,
1.495217, -0.7857587, 3.048362, 1, 0, 0.3490196, 1,
1.521836, 1.732919, 2.658475, 1, 0, 0.3411765, 1,
1.522342, -1.669033, 3.503783, 1, 0, 0.3372549, 1,
1.52431, -0.2116441, 2.32734, 1, 0, 0.3294118, 1,
1.543903, 0.6428217, 1.51891, 1, 0, 0.3254902, 1,
1.554827, -0.006474762, 2.118907, 1, 0, 0.3176471, 1,
1.557364, 0.4915341, 1.247532, 1, 0, 0.3137255, 1,
1.571761, 0.9064791, 0.7446874, 1, 0, 0.3058824, 1,
1.581298, 1.037723, 1.973999, 1, 0, 0.2980392, 1,
1.582211, 0.5021456, 0.8299102, 1, 0, 0.2941177, 1,
1.593326, 0.5789419, 0.4868436, 1, 0, 0.2862745, 1,
1.605314, -0.2786249, 0.6591272, 1, 0, 0.282353, 1,
1.608402, -1.047132, 2.545449, 1, 0, 0.2745098, 1,
1.620037, -0.2408045, 2.350012, 1, 0, 0.2705882, 1,
1.639235, 1.597417, 0.8124891, 1, 0, 0.2627451, 1,
1.650564, 0.7202671, 2.083726, 1, 0, 0.2588235, 1,
1.6556, 2.217984, -1.707157, 1, 0, 0.2509804, 1,
1.662104, -1.284423, 3.80788, 1, 0, 0.2470588, 1,
1.666561, 1.401008, 2.256845, 1, 0, 0.2392157, 1,
1.695916, 0.6319177, 0.6352094, 1, 0, 0.2352941, 1,
1.760555, 1.367713, 1.651293, 1, 0, 0.227451, 1,
1.765531, 0.6121914, 1.090989, 1, 0, 0.2235294, 1,
1.768064, -0.1525322, 2.834135, 1, 0, 0.2156863, 1,
1.782675, 0.1485497, 1.560257, 1, 0, 0.2117647, 1,
1.79112, 1.154842, 0.6480726, 1, 0, 0.2039216, 1,
1.812886, -0.4666589, 1.548549, 1, 0, 0.1960784, 1,
1.816621, 0.9373525, -0.6796206, 1, 0, 0.1921569, 1,
1.818103, -1.084776, 4.26055, 1, 0, 0.1843137, 1,
1.827072, 0.1000803, 1.42707, 1, 0, 0.1803922, 1,
1.862996, 1.067306, 2.477088, 1, 0, 0.172549, 1,
1.871284, -0.7157385, 2.011984, 1, 0, 0.1686275, 1,
1.887982, 0.3639074, 2.44458, 1, 0, 0.1607843, 1,
1.901597, 0.06904122, 1.988868, 1, 0, 0.1568628, 1,
1.909292, 1.49204, 1.653368, 1, 0, 0.1490196, 1,
1.956866, 1.07084, 2.134357, 1, 0, 0.145098, 1,
1.968556, -0.3673759, 2.892834, 1, 0, 0.1372549, 1,
1.982977, -1.089723, 2.545432, 1, 0, 0.1333333, 1,
2.005393, -0.4901874, 1.634147, 1, 0, 0.1254902, 1,
2.009505, -0.232048, 1.23212, 1, 0, 0.1215686, 1,
2.032524, 1.765069, 0.6636485, 1, 0, 0.1137255, 1,
2.040171, 0.986621, 0.05470108, 1, 0, 0.1098039, 1,
2.050826, -0.1881699, 1.851395, 1, 0, 0.1019608, 1,
2.063324, -0.9876835, 2.486264, 1, 0, 0.09411765, 1,
2.072905, -1.636019, 2.591305, 1, 0, 0.09019608, 1,
2.091618, -0.6993974, 3.560785, 1, 0, 0.08235294, 1,
2.160016, -0.4060223, 2.216886, 1, 0, 0.07843138, 1,
2.182688, -1.905459, 2.915108, 1, 0, 0.07058824, 1,
2.208678, 1.432472, 1.211317, 1, 0, 0.06666667, 1,
2.249793, 1.217664, 2.019423, 1, 0, 0.05882353, 1,
2.256323, -1.300816, 2.316646, 1, 0, 0.05490196, 1,
2.284093, -0.7980574, 2.366633, 1, 0, 0.04705882, 1,
2.349215, 1.081215, 0.7256532, 1, 0, 0.04313726, 1,
2.407167, -0.5661877, 3.019911, 1, 0, 0.03529412, 1,
2.40828, -1.130464, 0.06161889, 1, 0, 0.03137255, 1,
2.439405, 0.583227, 1.915434, 1, 0, 0.02352941, 1,
2.454159, 0.8092924, 0.03931655, 1, 0, 0.01960784, 1,
2.78671, 0.8922247, 2.595328, 1, 0, 0.01176471, 1,
3.044972, 1.430957, 1.331248, 1, 0, 0.007843138, 1
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
0.06106496, -3.476955, -7.131189, 0, -0.5, 0.5, 0.5,
0.06106496, -3.476955, -7.131189, 1, -0.5, 0.5, 0.5,
0.06106496, -3.476955, -7.131189, 1, 1.5, 0.5, 0.5,
0.06106496, -3.476955, -7.131189, 0, 1.5, 0.5, 0.5
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
-3.934386, 0.1703432, -7.131189, 0, -0.5, 0.5, 0.5,
-3.934386, 0.1703432, -7.131189, 1, -0.5, 0.5, 0.5,
-3.934386, 0.1703432, -7.131189, 1, 1.5, 0.5, 0.5,
-3.934386, 0.1703432, -7.131189, 0, 1.5, 0.5, 0.5
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
-3.934386, -3.476955, -0.2178459, 0, -0.5, 0.5, 0.5,
-3.934386, -3.476955, -0.2178459, 1, -0.5, 0.5, 0.5,
-3.934386, -3.476955, -0.2178459, 1, 1.5, 0.5, 0.5,
-3.934386, -3.476955, -0.2178459, 0, 1.5, 0.5, 0.5
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
-2, -2.635271, -5.535802,
3, -2.635271, -5.535802,
-2, -2.635271, -5.535802,
-2, -2.775552, -5.8017,
-1, -2.635271, -5.535802,
-1, -2.775552, -5.8017,
0, -2.635271, -5.535802,
0, -2.775552, -5.8017,
1, -2.635271, -5.535802,
1, -2.775552, -5.8017,
2, -2.635271, -5.535802,
2, -2.775552, -5.8017,
3, -2.635271, -5.535802,
3, -2.775552, -5.8017
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
-2, -3.056113, -6.333496, 0, -0.5, 0.5, 0.5,
-2, -3.056113, -6.333496, 1, -0.5, 0.5, 0.5,
-2, -3.056113, -6.333496, 1, 1.5, 0.5, 0.5,
-2, -3.056113, -6.333496, 0, 1.5, 0.5, 0.5,
-1, -3.056113, -6.333496, 0, -0.5, 0.5, 0.5,
-1, -3.056113, -6.333496, 1, -0.5, 0.5, 0.5,
-1, -3.056113, -6.333496, 1, 1.5, 0.5, 0.5,
-1, -3.056113, -6.333496, 0, 1.5, 0.5, 0.5,
0, -3.056113, -6.333496, 0, -0.5, 0.5, 0.5,
0, -3.056113, -6.333496, 1, -0.5, 0.5, 0.5,
0, -3.056113, -6.333496, 1, 1.5, 0.5, 0.5,
0, -3.056113, -6.333496, 0, 1.5, 0.5, 0.5,
1, -3.056113, -6.333496, 0, -0.5, 0.5, 0.5,
1, -3.056113, -6.333496, 1, -0.5, 0.5, 0.5,
1, -3.056113, -6.333496, 1, 1.5, 0.5, 0.5,
1, -3.056113, -6.333496, 0, 1.5, 0.5, 0.5,
2, -3.056113, -6.333496, 0, -0.5, 0.5, 0.5,
2, -3.056113, -6.333496, 1, -0.5, 0.5, 0.5,
2, -3.056113, -6.333496, 1, 1.5, 0.5, 0.5,
2, -3.056113, -6.333496, 0, 1.5, 0.5, 0.5,
3, -3.056113, -6.333496, 0, -0.5, 0.5, 0.5,
3, -3.056113, -6.333496, 1, -0.5, 0.5, 0.5,
3, -3.056113, -6.333496, 1, 1.5, 0.5, 0.5,
3, -3.056113, -6.333496, 0, 1.5, 0.5, 0.5
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
-3.012359, -2, -5.535802,
-3.012359, 2, -5.535802,
-3.012359, -2, -5.535802,
-3.16603, -2, -5.8017,
-3.012359, -1, -5.535802,
-3.16603, -1, -5.8017,
-3.012359, 0, -5.535802,
-3.16603, 0, -5.8017,
-3.012359, 1, -5.535802,
-3.16603, 1, -5.8017,
-3.012359, 2, -5.535802,
-3.16603, 2, -5.8017
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
-3.473373, -2, -6.333496, 0, -0.5, 0.5, 0.5,
-3.473373, -2, -6.333496, 1, -0.5, 0.5, 0.5,
-3.473373, -2, -6.333496, 1, 1.5, 0.5, 0.5,
-3.473373, -2, -6.333496, 0, 1.5, 0.5, 0.5,
-3.473373, -1, -6.333496, 0, -0.5, 0.5, 0.5,
-3.473373, -1, -6.333496, 1, -0.5, 0.5, 0.5,
-3.473373, -1, -6.333496, 1, 1.5, 0.5, 0.5,
-3.473373, -1, -6.333496, 0, 1.5, 0.5, 0.5,
-3.473373, 0, -6.333496, 0, -0.5, 0.5, 0.5,
-3.473373, 0, -6.333496, 1, -0.5, 0.5, 0.5,
-3.473373, 0, -6.333496, 1, 1.5, 0.5, 0.5,
-3.473373, 0, -6.333496, 0, 1.5, 0.5, 0.5,
-3.473373, 1, -6.333496, 0, -0.5, 0.5, 0.5,
-3.473373, 1, -6.333496, 1, -0.5, 0.5, 0.5,
-3.473373, 1, -6.333496, 1, 1.5, 0.5, 0.5,
-3.473373, 1, -6.333496, 0, 1.5, 0.5, 0.5,
-3.473373, 2, -6.333496, 0, -0.5, 0.5, 0.5,
-3.473373, 2, -6.333496, 1, -0.5, 0.5, 0.5,
-3.473373, 2, -6.333496, 1, 1.5, 0.5, 0.5,
-3.473373, 2, -6.333496, 0, 1.5, 0.5, 0.5
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
-3.012359, -2.635271, -4,
-3.012359, -2.635271, 4,
-3.012359, -2.635271, -4,
-3.16603, -2.775552, -4,
-3.012359, -2.635271, -2,
-3.16603, -2.775552, -2,
-3.012359, -2.635271, 0,
-3.16603, -2.775552, 0,
-3.012359, -2.635271, 2,
-3.16603, -2.775552, 2,
-3.012359, -2.635271, 4,
-3.16603, -2.775552, 4
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
-3.473373, -3.056113, -4, 0, -0.5, 0.5, 0.5,
-3.473373, -3.056113, -4, 1, -0.5, 0.5, 0.5,
-3.473373, -3.056113, -4, 1, 1.5, 0.5, 0.5,
-3.473373, -3.056113, -4, 0, 1.5, 0.5, 0.5,
-3.473373, -3.056113, -2, 0, -0.5, 0.5, 0.5,
-3.473373, -3.056113, -2, 1, -0.5, 0.5, 0.5,
-3.473373, -3.056113, -2, 1, 1.5, 0.5, 0.5,
-3.473373, -3.056113, -2, 0, 1.5, 0.5, 0.5,
-3.473373, -3.056113, 0, 0, -0.5, 0.5, 0.5,
-3.473373, -3.056113, 0, 1, -0.5, 0.5, 0.5,
-3.473373, -3.056113, 0, 1, 1.5, 0.5, 0.5,
-3.473373, -3.056113, 0, 0, 1.5, 0.5, 0.5,
-3.473373, -3.056113, 2, 0, -0.5, 0.5, 0.5,
-3.473373, -3.056113, 2, 1, -0.5, 0.5, 0.5,
-3.473373, -3.056113, 2, 1, 1.5, 0.5, 0.5,
-3.473373, -3.056113, 2, 0, 1.5, 0.5, 0.5,
-3.473373, -3.056113, 4, 0, -0.5, 0.5, 0.5,
-3.473373, -3.056113, 4, 1, -0.5, 0.5, 0.5,
-3.473373, -3.056113, 4, 1, 1.5, 0.5, 0.5,
-3.473373, -3.056113, 4, 0, 1.5, 0.5, 0.5
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
-3.012359, -2.635271, -5.535802,
-3.012359, 2.975957, -5.535802,
-3.012359, -2.635271, 5.100111,
-3.012359, 2.975957, 5.100111,
-3.012359, -2.635271, -5.535802,
-3.012359, -2.635271, 5.100111,
-3.012359, 2.975957, -5.535802,
-3.012359, 2.975957, 5.100111,
-3.012359, -2.635271, -5.535802,
3.134489, -2.635271, -5.535802,
-3.012359, -2.635271, 5.100111,
3.134489, -2.635271, 5.100111,
-3.012359, 2.975957, -5.535802,
3.134489, 2.975957, -5.535802,
-3.012359, 2.975957, 5.100111,
3.134489, 2.975957, 5.100111,
3.134489, -2.635271, -5.535802,
3.134489, 2.975957, -5.535802,
3.134489, -2.635271, 5.100111,
3.134489, 2.975957, 5.100111,
3.134489, -2.635271, -5.535802,
3.134489, -2.635271, 5.100111,
3.134489, 2.975957, -5.535802,
3.134489, 2.975957, 5.100111
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
var radius = 7.211551;
var distance = 32.08501;
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
mvMatrix.translate( -0.06106496, -0.1703432, 0.2178459 );
mvMatrix.scale( 1.268499, 1.389583, 0.7331077 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.08501);
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


