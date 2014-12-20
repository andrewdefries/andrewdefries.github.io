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
-3.128226, -1.772712, -0.8351478, 1, 0, 0, 1,
-2.981102, -1.672545, -2.552658, 1, 0.007843138, 0, 1,
-2.702689, -1.700152, -2.147337, 1, 0.01176471, 0, 1,
-2.684914, 0.37557, -2.660236, 1, 0.01960784, 0, 1,
-2.50612, -1.084273, -2.214544, 1, 0.02352941, 0, 1,
-2.487699, -0.9485941, 0.04249003, 1, 0.03137255, 0, 1,
-2.480083, 0.06230159, -1.269204, 1, 0.03529412, 0, 1,
-2.460135, 0.1094917, -2.332586, 1, 0.04313726, 0, 1,
-2.427964, -1.233279, -3.02011, 1, 0.04705882, 0, 1,
-2.410428, 0.2627596, 0.4046265, 1, 0.05490196, 0, 1,
-2.393904, 0.6958672, -1.609338, 1, 0.05882353, 0, 1,
-2.361388, -1.495584, -1.799024, 1, 0.06666667, 0, 1,
-2.34851, 0.6546913, -1.623962, 1, 0.07058824, 0, 1,
-2.344893, -0.8231927, -3.088782, 1, 0.07843138, 0, 1,
-2.343984, -0.2521142, -1.691785, 1, 0.08235294, 0, 1,
-2.308247, 0.93721, -0.2417696, 1, 0.09019608, 0, 1,
-2.275063, -1.098163, -1.542839, 1, 0.09411765, 0, 1,
-2.250917, -1.085832, -2.454389, 1, 0.1019608, 0, 1,
-2.210803, 0.1265587, -0.5997979, 1, 0.1098039, 0, 1,
-2.208791, 0.6921426, 0.3036419, 1, 0.1137255, 0, 1,
-2.0784, -0.6896031, -2.530241, 1, 0.1215686, 0, 1,
-2.07329, 0.8204548, -1.140308, 1, 0.1254902, 0, 1,
-2.06492, -0.7986515, -2.526311, 1, 0.1333333, 0, 1,
-2.007828, 1.247439, -1.115043, 1, 0.1372549, 0, 1,
-1.997959, 1.294678, -0.1525313, 1, 0.145098, 0, 1,
-1.956775, 1.787104, -0.5082278, 1, 0.1490196, 0, 1,
-1.946133, -1.927029, -3.310856, 1, 0.1568628, 0, 1,
-1.934922, 1.967864, -1.740761, 1, 0.1607843, 0, 1,
-1.903913, 0.6803717, -1.199814, 1, 0.1686275, 0, 1,
-1.881873, -1.669789, -2.191602, 1, 0.172549, 0, 1,
-1.878692, -0.9339434, -1.774508, 1, 0.1803922, 0, 1,
-1.86289, -1.323789, -1.655133, 1, 0.1843137, 0, 1,
-1.859871, 0.2053519, -0.7424664, 1, 0.1921569, 0, 1,
-1.845035, 1.603377, -0.963313, 1, 0.1960784, 0, 1,
-1.835604, -0.6590701, -1.124751, 1, 0.2039216, 0, 1,
-1.834627, -0.2540171, -0.5653512, 1, 0.2117647, 0, 1,
-1.823889, 0.5160758, -2.464771, 1, 0.2156863, 0, 1,
-1.823275, 1.496315, -1.603329, 1, 0.2235294, 0, 1,
-1.808833, -0.4071727, -3.33708, 1, 0.227451, 0, 1,
-1.807397, 0.3243862, -0.8173065, 1, 0.2352941, 0, 1,
-1.803163, -1.488081, -2.722855, 1, 0.2392157, 0, 1,
-1.77521, -1.79274, -2.015973, 1, 0.2470588, 0, 1,
-1.771158, -0.1290409, -3.123196, 1, 0.2509804, 0, 1,
-1.770735, -0.8266597, -1.216747, 1, 0.2588235, 0, 1,
-1.765431, 0.04366017, -2.185842, 1, 0.2627451, 0, 1,
-1.761294, 0.6651613, 0.535651, 1, 0.2705882, 0, 1,
-1.741004, -1.305027, -3.070256, 1, 0.2745098, 0, 1,
-1.739877, 1.200408, -2.386733, 1, 0.282353, 0, 1,
-1.734037, -0.4621943, -2.637289, 1, 0.2862745, 0, 1,
-1.718627, -0.5968614, -1.460583, 1, 0.2941177, 0, 1,
-1.711699, 0.9338635, 0.9399927, 1, 0.3019608, 0, 1,
-1.704133, 0.4913493, -0.709999, 1, 0.3058824, 0, 1,
-1.691553, -0.9739175, -2.773846, 1, 0.3137255, 0, 1,
-1.678354, 1.076765, -1.365291, 1, 0.3176471, 0, 1,
-1.666003, -0.3553019, -1.437704, 1, 0.3254902, 0, 1,
-1.638489, 0.2055711, -0.202769, 1, 0.3294118, 0, 1,
-1.63653, -1.759541, -4.422855, 1, 0.3372549, 0, 1,
-1.632575, 0.2493881, -2.291836, 1, 0.3411765, 0, 1,
-1.627746, -1.22887, -2.718491, 1, 0.3490196, 0, 1,
-1.624772, 1.498796, -1.197744, 1, 0.3529412, 0, 1,
-1.610227, -0.07333953, -2.766174, 1, 0.3607843, 0, 1,
-1.602286, 1.237135, -0.4159955, 1, 0.3647059, 0, 1,
-1.59668, -1.186272, -2.32085, 1, 0.372549, 0, 1,
-1.590148, 0.5665658, -2.377121, 1, 0.3764706, 0, 1,
-1.580528, 0.5710779, -0.2749357, 1, 0.3843137, 0, 1,
-1.557698, -0.2794927, 0.06325759, 1, 0.3882353, 0, 1,
-1.551875, -1.438463, -1.302474, 1, 0.3960784, 0, 1,
-1.540437, 0.4399859, -1.86252, 1, 0.4039216, 0, 1,
-1.529401, 1.504725, -0.9109467, 1, 0.4078431, 0, 1,
-1.518179, 0.03531012, -1.273971, 1, 0.4156863, 0, 1,
-1.513877, -1.382979, -1.896584, 1, 0.4196078, 0, 1,
-1.509945, -0.7312562, -0.5680845, 1, 0.427451, 0, 1,
-1.494826, 0.4802935, -1.194328, 1, 0.4313726, 0, 1,
-1.489729, -0.9922032, -3.501292, 1, 0.4392157, 0, 1,
-1.48277, -0.8105896, -2.386816, 1, 0.4431373, 0, 1,
-1.473867, 0.07522884, -0.02747664, 1, 0.4509804, 0, 1,
-1.473472, -0.7317927, -1.393642, 1, 0.454902, 0, 1,
-1.466489, 1.533228, -1.450478, 1, 0.4627451, 0, 1,
-1.454681, -1.597369, -0.4067145, 1, 0.4666667, 0, 1,
-1.453852, 1.011195, -0.02825307, 1, 0.4745098, 0, 1,
-1.452985, 0.1405343, -2.442246, 1, 0.4784314, 0, 1,
-1.449491, 0.5036238, 0.01671241, 1, 0.4862745, 0, 1,
-1.444801, -1.637364, -2.424635, 1, 0.4901961, 0, 1,
-1.441965, 1.031617, -1.682404, 1, 0.4980392, 0, 1,
-1.440259, -0.5471718, -2.291945, 1, 0.5058824, 0, 1,
-1.415243, -0.7487959, -2.767828, 1, 0.509804, 0, 1,
-1.413194, 1.028987, 0.004697226, 1, 0.5176471, 0, 1,
-1.40439, -1.681617, -1.371739, 1, 0.5215687, 0, 1,
-1.400687, -0.1999447, 0.1194299, 1, 0.5294118, 0, 1,
-1.39702, 1.152925, 0.7024279, 1, 0.5333334, 0, 1,
-1.383764, 2.456563, -0.1707418, 1, 0.5411765, 0, 1,
-1.3715, 0.7417327, -0.254822, 1, 0.5450981, 0, 1,
-1.366994, -0.8494063, -2.342516, 1, 0.5529412, 0, 1,
-1.360731, 2.880454, -0.5991927, 1, 0.5568628, 0, 1,
-1.358269, 0.7419896, -2.204005, 1, 0.5647059, 0, 1,
-1.355839, 0.5180269, -2.325998, 1, 0.5686275, 0, 1,
-1.354362, 1.751669, -1.735081, 1, 0.5764706, 0, 1,
-1.348543, -0.3703057, -3.024063, 1, 0.5803922, 0, 1,
-1.343489, -0.6346657, -3.577705, 1, 0.5882353, 0, 1,
-1.342087, 0.01037329, -2.420326, 1, 0.5921569, 0, 1,
-1.337845, 0.07286453, -2.696381, 1, 0.6, 0, 1,
-1.33621, -3.702879, -2.737381, 1, 0.6078432, 0, 1,
-1.335488, -0.1980686, -0.106016, 1, 0.6117647, 0, 1,
-1.32349, 1.522604, -0.2093617, 1, 0.6196079, 0, 1,
-1.321286, 0.08412917, -0.6891791, 1, 0.6235294, 0, 1,
-1.319862, 0.5593601, -0.4247421, 1, 0.6313726, 0, 1,
-1.319095, 0.09122504, -2.597439, 1, 0.6352941, 0, 1,
-1.318311, -0.8544609, -2.241227, 1, 0.6431373, 0, 1,
-1.313637, -0.4140667, -2.142731, 1, 0.6470588, 0, 1,
-1.312237, 0.2732634, -0.3532101, 1, 0.654902, 0, 1,
-1.306451, -0.1843416, 1.098226, 1, 0.6588235, 0, 1,
-1.305064, 0.3144591, -2.822534, 1, 0.6666667, 0, 1,
-1.298577, -1.699292, -3.918012, 1, 0.6705883, 0, 1,
-1.294637, -1.139814, -1.753525, 1, 0.6784314, 0, 1,
-1.283642, 0.05458608, -2.517552, 1, 0.682353, 0, 1,
-1.27028, -0.8655525, -2.187577, 1, 0.6901961, 0, 1,
-1.262993, 1.419911, -0.8034063, 1, 0.6941177, 0, 1,
-1.252883, -0.6388296, -0.3600522, 1, 0.7019608, 0, 1,
-1.249292, 1.434917, -1.336983, 1, 0.7098039, 0, 1,
-1.247389, 1.081979, -0.8873523, 1, 0.7137255, 0, 1,
-1.244859, 0.6450821, -0.9295149, 1, 0.7215686, 0, 1,
-1.244641, -0.988538, 0.1089983, 1, 0.7254902, 0, 1,
-1.244461, 0.5236888, -0.8703095, 1, 0.7333333, 0, 1,
-1.233688, -0.8301195, -0.959989, 1, 0.7372549, 0, 1,
-1.226169, -0.2459896, -3.130573, 1, 0.7450981, 0, 1,
-1.225376, 0.8214794, -1.145042, 1, 0.7490196, 0, 1,
-1.224509, 0.5210481, 0.2657159, 1, 0.7568628, 0, 1,
-1.221458, 2.184971, -1.205072, 1, 0.7607843, 0, 1,
-1.215395, 0.09601981, -2.093171, 1, 0.7686275, 0, 1,
-1.212784, -0.6319716, -0.8215595, 1, 0.772549, 0, 1,
-1.211643, -1.686158, -3.796388, 1, 0.7803922, 0, 1,
-1.207955, 1.881101, 0.2111872, 1, 0.7843137, 0, 1,
-1.206677, -0.4011107, -1.467494, 1, 0.7921569, 0, 1,
-1.186539, -0.4787861, -1.375185, 1, 0.7960784, 0, 1,
-1.185079, -0.577321, -0.9862881, 1, 0.8039216, 0, 1,
-1.184354, 0.6283398, -0.3280822, 1, 0.8117647, 0, 1,
-1.174694, -0.4254426, -1.25142, 1, 0.8156863, 0, 1,
-1.172817, -0.3222251, -1.480301, 1, 0.8235294, 0, 1,
-1.170084, 0.5950704, -2.155093, 1, 0.827451, 0, 1,
-1.161834, -0.1744265, -0.6884617, 1, 0.8352941, 0, 1,
-1.15517, -0.9461009, -2.70247, 1, 0.8392157, 0, 1,
-1.149336, 0.1408269, -2.516934, 1, 0.8470588, 0, 1,
-1.146589, -1.225878, -3.905726, 1, 0.8509804, 0, 1,
-1.136901, 0.5695226, 1.616652, 1, 0.8588235, 0, 1,
-1.134576, 0.9357111, 0.9169818, 1, 0.8627451, 0, 1,
-1.134331, -0.1965852, -1.166664, 1, 0.8705882, 0, 1,
-1.129845, 0.4697888, -1.886608, 1, 0.8745098, 0, 1,
-1.128081, -0.3920147, -1.764508, 1, 0.8823529, 0, 1,
-1.125577, 0.8981825, -0.4942073, 1, 0.8862745, 0, 1,
-1.119067, 1.290405, 1.555339, 1, 0.8941177, 0, 1,
-1.118485, -0.160419, -2.660755, 1, 0.8980392, 0, 1,
-1.116724, -1.338274, -3.2957, 1, 0.9058824, 0, 1,
-1.113504, -0.2921494, -1.893964, 1, 0.9137255, 0, 1,
-1.105462, -0.3543036, -1.415349, 1, 0.9176471, 0, 1,
-1.103646, -1.47043, -3.775161, 1, 0.9254902, 0, 1,
-1.100531, -0.08736412, 0.8010657, 1, 0.9294118, 0, 1,
-1.098161, 0.1246824, -1.44727, 1, 0.9372549, 0, 1,
-1.097387, -0.7174165, -1.197701, 1, 0.9411765, 0, 1,
-1.096254, 0.1356288, -1.407485, 1, 0.9490196, 0, 1,
-1.095203, -0.0764675, -0.6989913, 1, 0.9529412, 0, 1,
-1.092231, -0.9855838, -2.514877, 1, 0.9607843, 0, 1,
-1.090319, -0.4747339, -0.5007548, 1, 0.9647059, 0, 1,
-1.087382, 0.2713593, 0.6811578, 1, 0.972549, 0, 1,
-1.085329, 0.2307475, 0.3813157, 1, 0.9764706, 0, 1,
-1.079953, -0.3591209, 0.2298228, 1, 0.9843137, 0, 1,
-1.072317, -1.732358, -2.646102, 1, 0.9882353, 0, 1,
-1.065504, 0.1771932, -2.378677, 1, 0.9960784, 0, 1,
-1.058031, 0.3671964, -2.266173, 0.9960784, 1, 0, 1,
-1.054242, -1.66398, -1.906116, 0.9921569, 1, 0, 1,
-1.034565, -0.5520338, -1.649704, 0.9843137, 1, 0, 1,
-1.034489, 0.2102256, -2.284681, 0.9803922, 1, 0, 1,
-1.031854, -1.336135, -1.859354, 0.972549, 1, 0, 1,
-1.026296, 0.2123134, -1.373787, 0.9686275, 1, 0, 1,
-1.019928, 0.5547122, -0.7228038, 0.9607843, 1, 0, 1,
-1.015972, -1.221689, -1.653352, 0.9568627, 1, 0, 1,
-1.014246, -0.8087821, -2.33553, 0.9490196, 1, 0, 1,
-1.004425, 0.3396143, 0.1411129, 0.945098, 1, 0, 1,
-1.000151, -1.444467, -2.673471, 0.9372549, 1, 0, 1,
-0.9948239, -0.002225074, -0.5788939, 0.9333333, 1, 0, 1,
-0.9929439, 1.447903, -1.581342, 0.9254902, 1, 0, 1,
-0.992586, -0.6280456, -4.481036, 0.9215686, 1, 0, 1,
-0.9754887, 0.1216919, -0.6247512, 0.9137255, 1, 0, 1,
-0.9679999, -0.8119854, -2.634954, 0.9098039, 1, 0, 1,
-0.9659509, 0.2994239, -1.258305, 0.9019608, 1, 0, 1,
-0.961894, 2.287776, -0.570479, 0.8941177, 1, 0, 1,
-0.9472162, -0.04534807, -1.793238, 0.8901961, 1, 0, 1,
-0.9415475, 0.7156304, -0.1701283, 0.8823529, 1, 0, 1,
-0.9396572, -0.7535164, -2.444103, 0.8784314, 1, 0, 1,
-0.9366822, -0.2748634, -1.165159, 0.8705882, 1, 0, 1,
-0.9330013, 0.5008656, -1.445784, 0.8666667, 1, 0, 1,
-0.9277908, -0.3801265, -2.46661, 0.8588235, 1, 0, 1,
-0.927253, 0.3376962, -0.03701901, 0.854902, 1, 0, 1,
-0.9258428, 0.5812123, 0.30464, 0.8470588, 1, 0, 1,
-0.9185722, 0.4720706, -0.4635933, 0.8431373, 1, 0, 1,
-0.9177878, 0.2015544, -2.208153, 0.8352941, 1, 0, 1,
-0.9143063, -0.1492824, -2.368936, 0.8313726, 1, 0, 1,
-0.913117, -0.1666259, -1.201768, 0.8235294, 1, 0, 1,
-0.9108428, -0.1409764, -1.098918, 0.8196079, 1, 0, 1,
-0.9103733, 0.4624833, -1.501035, 0.8117647, 1, 0, 1,
-0.9098701, 1.028675, 0.2866577, 0.8078431, 1, 0, 1,
-0.9030416, 2.938317, -1.307107, 0.8, 1, 0, 1,
-0.8969333, 2.491691, -0.3724742, 0.7921569, 1, 0, 1,
-0.8953325, 1.086216, -1.146738, 0.7882353, 1, 0, 1,
-0.8935127, -0.03115152, -1.587707, 0.7803922, 1, 0, 1,
-0.888097, -0.5032431, -1.916306, 0.7764706, 1, 0, 1,
-0.882691, 0.158915, -2.173124, 0.7686275, 1, 0, 1,
-0.8815567, 0.9876841, -1.502203, 0.7647059, 1, 0, 1,
-0.8735042, -0.1216033, -0.06480393, 0.7568628, 1, 0, 1,
-0.8694108, -0.9298188, -4.001617, 0.7529412, 1, 0, 1,
-0.8692393, -0.5096861, -0.4487176, 0.7450981, 1, 0, 1,
-0.866356, 1.00228, 0.003779144, 0.7411765, 1, 0, 1,
-0.8652384, -0.272859, -2.410823, 0.7333333, 1, 0, 1,
-0.8555021, -0.142616, -3.318312, 0.7294118, 1, 0, 1,
-0.8518721, -0.6050843, -2.585012, 0.7215686, 1, 0, 1,
-0.8501267, 0.8612544, -0.02971989, 0.7176471, 1, 0, 1,
-0.8491501, 1.207491, -1.24689, 0.7098039, 1, 0, 1,
-0.8474599, -0.1188215, -4.038406, 0.7058824, 1, 0, 1,
-0.8351582, -0.7525685, -2.05543, 0.6980392, 1, 0, 1,
-0.8349695, 0.2940722, -2.210246, 0.6901961, 1, 0, 1,
-0.8200179, 2.067677, 0.8698831, 0.6862745, 1, 0, 1,
-0.8181354, 1.429825, -1.279942, 0.6784314, 1, 0, 1,
-0.8168533, 1.56087, -2.134617, 0.6745098, 1, 0, 1,
-0.8135542, 0.5376185, -1.106817, 0.6666667, 1, 0, 1,
-0.8027775, -0.6880857, -2.811282, 0.6627451, 1, 0, 1,
-0.8002058, 0.1235, -1.181236, 0.654902, 1, 0, 1,
-0.795063, -1.220924, -2.917168, 0.6509804, 1, 0, 1,
-0.7913489, 0.6041518, 0.4082221, 0.6431373, 1, 0, 1,
-0.7909369, 0.3409579, -1.300587, 0.6392157, 1, 0, 1,
-0.7903581, -1.148367, -2.157909, 0.6313726, 1, 0, 1,
-0.7808123, 1.130756, -0.864206, 0.627451, 1, 0, 1,
-0.774196, -1.838866, -4.287665, 0.6196079, 1, 0, 1,
-0.7690253, 0.7112659, -0.8599053, 0.6156863, 1, 0, 1,
-0.7654285, -0.1905768, -0.4335676, 0.6078432, 1, 0, 1,
-0.7533316, -0.6450335, -3.500773, 0.6039216, 1, 0, 1,
-0.7531918, -0.1261152, -2.423952, 0.5960785, 1, 0, 1,
-0.7521657, -0.6366118, -3.026998, 0.5882353, 1, 0, 1,
-0.7457305, 0.698348, -0.209808, 0.5843138, 1, 0, 1,
-0.7450345, -0.2425773, -1.135535, 0.5764706, 1, 0, 1,
-0.7411326, -0.7578888, -2.142156, 0.572549, 1, 0, 1,
-0.7366478, 0.6596438, 1.412734, 0.5647059, 1, 0, 1,
-0.7363373, -0.2154357, -3.030581, 0.5607843, 1, 0, 1,
-0.735672, -0.9964322, -1.847587, 0.5529412, 1, 0, 1,
-0.7284799, 0.01808286, -1.907084, 0.5490196, 1, 0, 1,
-0.7274512, -0.05357701, -2.273376, 0.5411765, 1, 0, 1,
-0.7250915, 2.363501, 0.5904254, 0.5372549, 1, 0, 1,
-0.723749, 1.787314, -0.5847936, 0.5294118, 1, 0, 1,
-0.7227549, -0.3361575, -1.285406, 0.5254902, 1, 0, 1,
-0.7222412, -0.08407651, -0.8244408, 0.5176471, 1, 0, 1,
-0.7217152, -1.429678, -3.247219, 0.5137255, 1, 0, 1,
-0.7174103, 0.9327334, -2.514702, 0.5058824, 1, 0, 1,
-0.7170992, -1.22381, -2.147426, 0.5019608, 1, 0, 1,
-0.7063521, -0.5169828, -2.930857, 0.4941176, 1, 0, 1,
-0.7055862, 1.37001, 0.1863379, 0.4862745, 1, 0, 1,
-0.7021734, 0.3548754, -0.8721182, 0.4823529, 1, 0, 1,
-0.7015579, -1.563062, -1.345678, 0.4745098, 1, 0, 1,
-0.6998312, 0.009477891, -2.477763, 0.4705882, 1, 0, 1,
-0.6975414, -0.7043926, -2.814857, 0.4627451, 1, 0, 1,
-0.6974275, -1.824878, -0.1721574, 0.4588235, 1, 0, 1,
-0.6947086, 0.05595934, -0.8904287, 0.4509804, 1, 0, 1,
-0.6885272, -1.444878, -3.749857, 0.4470588, 1, 0, 1,
-0.6875891, 0.01427581, -1.636641, 0.4392157, 1, 0, 1,
-0.6851637, 0.03120553, -2.73447, 0.4352941, 1, 0, 1,
-0.6688393, 0.97308, 0.4696158, 0.427451, 1, 0, 1,
-0.6674582, -1.208373, -0.7419897, 0.4235294, 1, 0, 1,
-0.6641696, 0.9417385, -0.1214708, 0.4156863, 1, 0, 1,
-0.6619606, -0.131135, -1.304706, 0.4117647, 1, 0, 1,
-0.6543008, -0.1476841, 0.1654541, 0.4039216, 1, 0, 1,
-0.6452838, -0.09295554, -2.875275, 0.3960784, 1, 0, 1,
-0.637543, 0.01391794, -0.178464, 0.3921569, 1, 0, 1,
-0.6245383, 0.8877593, -2.110645, 0.3843137, 1, 0, 1,
-0.6199784, -0.3679406, -0.1317443, 0.3803922, 1, 0, 1,
-0.6163644, -0.2547127, -1.582203, 0.372549, 1, 0, 1,
-0.6145026, -0.02348094, -1.703012, 0.3686275, 1, 0, 1,
-0.6076288, 1.482366, -2.340318, 0.3607843, 1, 0, 1,
-0.6052942, 0.1378102, -1.310905, 0.3568628, 1, 0, 1,
-0.6046959, 0.03541084, -0.9779382, 0.3490196, 1, 0, 1,
-0.6022847, 0.1704885, -0.8362634, 0.345098, 1, 0, 1,
-0.5983313, -0.6101687, -2.827438, 0.3372549, 1, 0, 1,
-0.5941926, -1.248945, -3.647444, 0.3333333, 1, 0, 1,
-0.5939206, -0.5785301, -2.27036, 0.3254902, 1, 0, 1,
-0.5918441, 0.3510119, -0.01977522, 0.3215686, 1, 0, 1,
-0.5843536, -0.3457008, -0.9852554, 0.3137255, 1, 0, 1,
-0.5776064, -1.0612, -4.551191, 0.3098039, 1, 0, 1,
-0.5745253, 2.051761, -0.9406716, 0.3019608, 1, 0, 1,
-0.5741769, 0.3142323, -2.367599, 0.2941177, 1, 0, 1,
-0.5732983, 1.683043, 0.452727, 0.2901961, 1, 0, 1,
-0.5730649, -0.2172945, -2.023605, 0.282353, 1, 0, 1,
-0.5712793, -0.6152093, -1.81546, 0.2784314, 1, 0, 1,
-0.5692618, -0.386582, -3.694267, 0.2705882, 1, 0, 1,
-0.565349, 0.2150153, -1.403113, 0.2666667, 1, 0, 1,
-0.5647724, 0.7193553, -0.570832, 0.2588235, 1, 0, 1,
-0.5595202, -0.3598233, -1.599169, 0.254902, 1, 0, 1,
-0.5587407, -0.9695387, -2.932058, 0.2470588, 1, 0, 1,
-0.558325, 1.587162, -1.635034, 0.2431373, 1, 0, 1,
-0.5579262, -0.3110143, -1.368925, 0.2352941, 1, 0, 1,
-0.55114, 0.428212, -0.7203797, 0.2313726, 1, 0, 1,
-0.5486128, 1.069345, -0.4531846, 0.2235294, 1, 0, 1,
-0.5427339, -0.7320961, -4.082115, 0.2196078, 1, 0, 1,
-0.5420936, 0.1798595, -1.591395, 0.2117647, 1, 0, 1,
-0.5405375, 0.5616689, -4.135961, 0.2078431, 1, 0, 1,
-0.5340488, -0.2359363, -3.044386, 0.2, 1, 0, 1,
-0.5317619, -0.6201899, -2.049639, 0.1921569, 1, 0, 1,
-0.527158, -1.715664, -1.698203, 0.1882353, 1, 0, 1,
-0.525227, 0.4969902, -0.7109092, 0.1803922, 1, 0, 1,
-0.5238281, 2.147436, 0.7212428, 0.1764706, 1, 0, 1,
-0.5225697, -0.2037877, -2.917958, 0.1686275, 1, 0, 1,
-0.5223024, 0.9899951, -0.06753813, 0.1647059, 1, 0, 1,
-0.516823, -0.1598163, -1.68149, 0.1568628, 1, 0, 1,
-0.5144004, 0.3225546, -1.643409, 0.1529412, 1, 0, 1,
-0.513481, 0.227694, -2.703207, 0.145098, 1, 0, 1,
-0.5120065, 2.13529, -0.4419312, 0.1411765, 1, 0, 1,
-0.5090365, -0.513634, -1.229489, 0.1333333, 1, 0, 1,
-0.5064522, 0.563278, 0.4616416, 0.1294118, 1, 0, 1,
-0.504287, 2.112668, 0.8181093, 0.1215686, 1, 0, 1,
-0.4926677, -0.3331199, -2.027948, 0.1176471, 1, 0, 1,
-0.4892508, 1.505681, 2.740504, 0.1098039, 1, 0, 1,
-0.4814111, -2.127187, -2.465195, 0.1058824, 1, 0, 1,
-0.4814093, 0.360492, -1.672226, 0.09803922, 1, 0, 1,
-0.4806666, 0.3819525, 0.146881, 0.09019608, 1, 0, 1,
-0.4800186, -0.06731331, -0.08666328, 0.08627451, 1, 0, 1,
-0.4728684, -0.5887748, -1.49606, 0.07843138, 1, 0, 1,
-0.4722093, -0.8259931, -4.059618, 0.07450981, 1, 0, 1,
-0.4717637, -1.076271, -2.453876, 0.06666667, 1, 0, 1,
-0.471615, -0.1875495, -0.8247335, 0.0627451, 1, 0, 1,
-0.4703536, -0.7116603, -2.115305, 0.05490196, 1, 0, 1,
-0.4677846, -1.309868, -2.008787, 0.05098039, 1, 0, 1,
-0.4666499, 1.210657, -0.8821335, 0.04313726, 1, 0, 1,
-0.4657366, 0.6394972, -1.230752, 0.03921569, 1, 0, 1,
-0.4652587, 1.065717, 0.09160854, 0.03137255, 1, 0, 1,
-0.4635223, -0.004090178, -1.327843, 0.02745098, 1, 0, 1,
-0.4611946, 0.159192, -2.465237, 0.01960784, 1, 0, 1,
-0.4560242, 1.294659, -0.1713334, 0.01568628, 1, 0, 1,
-0.4541483, 1.081767, 0.1675918, 0.007843138, 1, 0, 1,
-0.4539014, 1.049953, -0.4847444, 0.003921569, 1, 0, 1,
-0.4509251, -0.8597516, -3.268954, 0, 1, 0.003921569, 1,
-0.4505009, -0.7452326, -2.348876, 0, 1, 0.01176471, 1,
-0.4503217, -2.428843, -3.093583, 0, 1, 0.01568628, 1,
-0.4402064, 0.04603941, 0.1882229, 0, 1, 0.02352941, 1,
-0.4400809, -0.8854192, -2.507298, 0, 1, 0.02745098, 1,
-0.4389058, -0.2165357, -3.265694, 0, 1, 0.03529412, 1,
-0.4382588, -0.9143229, -2.113322, 0, 1, 0.03921569, 1,
-0.4380824, -2.336598, -1.2068, 0, 1, 0.04705882, 1,
-0.4350755, -1.327373, -3.135033, 0, 1, 0.05098039, 1,
-0.4333042, 1.21607, 0.3213657, 0, 1, 0.05882353, 1,
-0.4332954, 2.49698, -1.116701, 0, 1, 0.0627451, 1,
-0.4329479, -0.4516816, -2.326315, 0, 1, 0.07058824, 1,
-0.432555, 0.09470721, -0.7174779, 0, 1, 0.07450981, 1,
-0.4323104, 0.1510852, -1.060497, 0, 1, 0.08235294, 1,
-0.4311103, 0.8534271, -1.00577, 0, 1, 0.08627451, 1,
-0.4277804, -1.478915, -2.405577, 0, 1, 0.09411765, 1,
-0.4264009, 0.3631017, -2.754866, 0, 1, 0.1019608, 1,
-0.4225141, 0.5445616, -1.349841, 0, 1, 0.1058824, 1,
-0.4219333, 0.4476505, 0.1793943, 0, 1, 0.1137255, 1,
-0.4219142, -2.347983, -1.424405, 0, 1, 0.1176471, 1,
-0.4183728, 0.5302197, -0.3950236, 0, 1, 0.1254902, 1,
-0.4137301, 0.2613971, -1.481847, 0, 1, 0.1294118, 1,
-0.4087178, -0.05169475, -2.346108, 0, 1, 0.1372549, 1,
-0.4069342, -0.6418219, -1.049221, 0, 1, 0.1411765, 1,
-0.4068908, -0.7541285, -2.394703, 0, 1, 0.1490196, 1,
-0.4027333, 0.3745927, -1.30545, 0, 1, 0.1529412, 1,
-0.4026042, -0.4951223, -1.556199, 0, 1, 0.1607843, 1,
-0.4006135, -0.8221073, -2.423982, 0, 1, 0.1647059, 1,
-0.3986078, -1.094226, -3.121621, 0, 1, 0.172549, 1,
-0.397393, -0.1343563, -0.7617728, 0, 1, 0.1764706, 1,
-0.397255, -0.8250792, -2.01035, 0, 1, 0.1843137, 1,
-0.3951002, -1.92024, -2.142928, 0, 1, 0.1882353, 1,
-0.3879665, 0.3122256, -1.040222, 0, 1, 0.1960784, 1,
-0.3793711, 1.570764, 1.168263, 0, 1, 0.2039216, 1,
-0.3776691, -1.572264, -3.472235, 0, 1, 0.2078431, 1,
-0.3730325, -0.8977343, -2.598954, 0, 1, 0.2156863, 1,
-0.3700808, 3.105656, -1.140294, 0, 1, 0.2196078, 1,
-0.370079, -0.1636075, -0.4939551, 0, 1, 0.227451, 1,
-0.3664248, -1.660152, -2.842132, 0, 1, 0.2313726, 1,
-0.3646359, 0.9757137, -1.474437, 0, 1, 0.2392157, 1,
-0.3601309, 0.2661102, -1.870511, 0, 1, 0.2431373, 1,
-0.3591934, 0.2904466, -0.1571977, 0, 1, 0.2509804, 1,
-0.3541908, 0.06237711, -0.365711, 0, 1, 0.254902, 1,
-0.3538654, -0.4796624, -2.69955, 0, 1, 0.2627451, 1,
-0.3534153, 0.8688844, -0.8563163, 0, 1, 0.2666667, 1,
-0.3480804, -0.6278245, -0.5782348, 0, 1, 0.2745098, 1,
-0.3420253, 1.020686, -0.6905664, 0, 1, 0.2784314, 1,
-0.3376371, -2.330782, -2.75358, 0, 1, 0.2862745, 1,
-0.3342438, -0.9434435, -1.868882, 0, 1, 0.2901961, 1,
-0.3310924, -0.09952356, -3.344241, 0, 1, 0.2980392, 1,
-0.3243922, 0.5978925, 2.021442, 0, 1, 0.3058824, 1,
-0.3224353, -1.686108, -3.218777, 0, 1, 0.3098039, 1,
-0.3174908, -0.3379811, -3.255403, 0, 1, 0.3176471, 1,
-0.315602, -0.02003382, -1.386494, 0, 1, 0.3215686, 1,
-0.3127299, 0.4814173, 0.2708998, 0, 1, 0.3294118, 1,
-0.3123423, -0.06222245, -1.581184, 0, 1, 0.3333333, 1,
-0.3114785, 0.6355728, -0.03058676, 0, 1, 0.3411765, 1,
-0.3109565, -0.675492, -2.37124, 0, 1, 0.345098, 1,
-0.3103706, 0.12384, -0.1795197, 0, 1, 0.3529412, 1,
-0.3085614, -1.000104, -3.24374, 0, 1, 0.3568628, 1,
-0.3066883, -1.626115, -4.835295, 0, 1, 0.3647059, 1,
-0.3061856, 1.066195, 1.054324, 0, 1, 0.3686275, 1,
-0.2966581, 0.2314727, -0.5660821, 0, 1, 0.3764706, 1,
-0.2959439, -0.9109935, -2.751011, 0, 1, 0.3803922, 1,
-0.2933288, 1.01845, -0.3301792, 0, 1, 0.3882353, 1,
-0.2893746, 0.3645401, -0.159532, 0, 1, 0.3921569, 1,
-0.2876949, -1.25628, -1.834072, 0, 1, 0.4, 1,
-0.2849476, -0.6765897, -2.199292, 0, 1, 0.4078431, 1,
-0.2833389, -0.3102396, -2.747348, 0, 1, 0.4117647, 1,
-0.2810062, -0.7676924, -2.012664, 0, 1, 0.4196078, 1,
-0.2807455, 0.4793889, -1.606511, 0, 1, 0.4235294, 1,
-0.27511, -0.3134222, -4.586562, 0, 1, 0.4313726, 1,
-0.2692384, -2.030269, -3.490266, 0, 1, 0.4352941, 1,
-0.2657697, -0.7060016, -3.119713, 0, 1, 0.4431373, 1,
-0.2655947, 1.285267, -0.08689408, 0, 1, 0.4470588, 1,
-0.2630198, -0.4324448, -4.131985, 0, 1, 0.454902, 1,
-0.2593771, 0.08713914, -1.478587, 0, 1, 0.4588235, 1,
-0.2555517, -0.998184, -2.392689, 0, 1, 0.4666667, 1,
-0.2543445, -0.5365558, -3.783942, 0, 1, 0.4705882, 1,
-0.2529149, -0.929976, -2.827237, 0, 1, 0.4784314, 1,
-0.2512223, 0.8021959, -0.5752434, 0, 1, 0.4823529, 1,
-0.2498, 1.335243, 1.540695, 0, 1, 0.4901961, 1,
-0.2457731, -0.8641211, -1.516453, 0, 1, 0.4941176, 1,
-0.2442309, -1.834514, -1.195207, 0, 1, 0.5019608, 1,
-0.2438266, 2.078523, 1.609825, 0, 1, 0.509804, 1,
-0.2381147, -1.627389, -3.135796, 0, 1, 0.5137255, 1,
-0.236256, 0.4947072, 1.987114, 0, 1, 0.5215687, 1,
-0.2340275, 0.9437517, -0.3401192, 0, 1, 0.5254902, 1,
-0.2275186, 0.1865532, -0.3430925, 0, 1, 0.5333334, 1,
-0.226224, -0.5295599, -1.74707, 0, 1, 0.5372549, 1,
-0.2226683, 1.390287, 0.8109064, 0, 1, 0.5450981, 1,
-0.2214202, 0.4299762, -0.3498507, 0, 1, 0.5490196, 1,
-0.2197078, 0.4964873, 0.2468398, 0, 1, 0.5568628, 1,
-0.2187993, 0.43927, 0.9469686, 0, 1, 0.5607843, 1,
-0.2168756, -0.3451223, -2.906136, 0, 1, 0.5686275, 1,
-0.2162722, -0.4380488, -2.101774, 0, 1, 0.572549, 1,
-0.2126218, 1.089163, 0.1165694, 0, 1, 0.5803922, 1,
-0.2100441, 0.3501149, -0.7849824, 0, 1, 0.5843138, 1,
-0.2064928, 0.4301071, 0.3112614, 0, 1, 0.5921569, 1,
-0.2030472, 0.3086786, -1.612648, 0, 1, 0.5960785, 1,
-0.2023609, -0.864586, -2.518296, 0, 1, 0.6039216, 1,
-0.1976663, 0.1382633, -1.280924, 0, 1, 0.6117647, 1,
-0.1928992, 1.44833, -0.4615957, 0, 1, 0.6156863, 1,
-0.1899396, 0.6518407, -1.645745, 0, 1, 0.6235294, 1,
-0.1871515, 1.676965, -0.6050562, 0, 1, 0.627451, 1,
-0.1863724, 0.7445467, 0.4691601, 0, 1, 0.6352941, 1,
-0.1857197, 0.5258488, 0.07440283, 0, 1, 0.6392157, 1,
-0.179615, 1.899418, 0.601249, 0, 1, 0.6470588, 1,
-0.1788556, -1.347006, -1.288172, 0, 1, 0.6509804, 1,
-0.1733901, 0.4310167, -0.01830688, 0, 1, 0.6588235, 1,
-0.1727557, -0.5878422, -3.60891, 0, 1, 0.6627451, 1,
-0.1698408, 1.061372, 1.934428, 0, 1, 0.6705883, 1,
-0.1690771, -1.627066, -3.991928, 0, 1, 0.6745098, 1,
-0.1672972, 0.6052073, -1.009488, 0, 1, 0.682353, 1,
-0.1644132, -1.014845, -2.262865, 0, 1, 0.6862745, 1,
-0.1642442, 0.807152, -0.711607, 0, 1, 0.6941177, 1,
-0.1600938, 0.2663755, -0.3468298, 0, 1, 0.7019608, 1,
-0.1557062, 0.103387, -1.678639, 0, 1, 0.7058824, 1,
-0.1547139, -0.3919555, -3.847408, 0, 1, 0.7137255, 1,
-0.153175, -1.176207, -2.035986, 0, 1, 0.7176471, 1,
-0.1524995, -0.9244233, -3.312617, 0, 1, 0.7254902, 1,
-0.150683, -0.9877039, -3.038162, 0, 1, 0.7294118, 1,
-0.1498597, -1.726962, -3.099636, 0, 1, 0.7372549, 1,
-0.1471353, 0.8343858, 1.902937, 0, 1, 0.7411765, 1,
-0.143593, 0.5422943, -0.2980855, 0, 1, 0.7490196, 1,
-0.1404367, 0.5258912, -1.390674, 0, 1, 0.7529412, 1,
-0.1396943, -0.8098343, -2.696835, 0, 1, 0.7607843, 1,
-0.1382858, 0.1982426, 0.129697, 0, 1, 0.7647059, 1,
-0.1376968, 0.6163626, 1.226103, 0, 1, 0.772549, 1,
-0.1366807, -0.9353411, -2.265079, 0, 1, 0.7764706, 1,
-0.1346299, 0.9576575, 0.1385258, 0, 1, 0.7843137, 1,
-0.1328112, -0.2941158, -3.600106, 0, 1, 0.7882353, 1,
-0.1327841, 1.011448, -0.4239425, 0, 1, 0.7960784, 1,
-0.1267827, 1.00286, -0.4329759, 0, 1, 0.8039216, 1,
-0.1230367, 0.958023, 0.7897226, 0, 1, 0.8078431, 1,
-0.1191927, -0.925628, -2.681161, 0, 1, 0.8156863, 1,
-0.1174206, 1.064277, -1.278111, 0, 1, 0.8196079, 1,
-0.1165056, -2.15507, -3.612957, 0, 1, 0.827451, 1,
-0.1158159, -0.2216843, -1.251473, 0, 1, 0.8313726, 1,
-0.1049159, -1.532501, -2.200059, 0, 1, 0.8392157, 1,
-0.1032089, -0.1984116, -3.471657, 0, 1, 0.8431373, 1,
-0.09771962, -0.5077726, -2.829613, 0, 1, 0.8509804, 1,
-0.09613562, 0.5130438, -0.4877435, 0, 1, 0.854902, 1,
-0.0942331, 0.08147515, 1.670802, 0, 1, 0.8627451, 1,
-0.0937475, -0.8310381, -4.121057, 0, 1, 0.8666667, 1,
-0.08182684, -1.687057, -2.978017, 0, 1, 0.8745098, 1,
-0.07817819, -0.8051824, -2.833807, 0, 1, 0.8784314, 1,
-0.0775542, 1.552695, 1.121835, 0, 1, 0.8862745, 1,
-0.07404816, 0.5905129, 1.411356, 0, 1, 0.8901961, 1,
-0.07330461, -0.3843016, -1.968741, 0, 1, 0.8980392, 1,
-0.06849702, 0.2405676, -0.4097482, 0, 1, 0.9058824, 1,
-0.06796279, 0.591538, -0.2255263, 0, 1, 0.9098039, 1,
-0.06471667, 1.295064, -0.7845162, 0, 1, 0.9176471, 1,
-0.06397087, 1.789115, 0.1631837, 0, 1, 0.9215686, 1,
-0.05889839, 0.2940782, -0.9117359, 0, 1, 0.9294118, 1,
-0.05538647, -0.4339571, -3.077313, 0, 1, 0.9333333, 1,
-0.05396651, -0.003059185, -1.418635, 0, 1, 0.9411765, 1,
-0.05306206, -0.1473844, -3.930285, 0, 1, 0.945098, 1,
-0.05299167, -2.062271, -2.614587, 0, 1, 0.9529412, 1,
-0.05195509, -0.522991, -2.258508, 0, 1, 0.9568627, 1,
-0.05068786, -0.2207826, -2.067906, 0, 1, 0.9647059, 1,
-0.04260331, 0.1777298, 0.08905562, 0, 1, 0.9686275, 1,
-0.04245589, 0.6104722, 0.1745709, 0, 1, 0.9764706, 1,
-0.04143573, -1.353188, -2.727379, 0, 1, 0.9803922, 1,
-0.04126181, -1.635413, -2.559164, 0, 1, 0.9882353, 1,
-0.0393712, 0.8390353, -1.908569, 0, 1, 0.9921569, 1,
-0.03782403, -1.517407, -4.381987, 0, 1, 1, 1,
-0.03593774, -0.855472, -3.435419, 0, 0.9921569, 1, 1,
-0.03536545, -0.7895473, -3.213594, 0, 0.9882353, 1, 1,
-0.03527979, 0.9044481, 2.037042, 0, 0.9803922, 1, 1,
-0.03335616, -1.117536, -1.40528, 0, 0.9764706, 1, 1,
-0.02729448, -0.6122799, -2.898117, 0, 0.9686275, 1, 1,
-0.01898072, 1.904326, 0.9286864, 0, 0.9647059, 1, 1,
-0.01769036, -0.7320988, -3.129946, 0, 0.9568627, 1, 1,
-0.017215, -0.4622574, -2.690832, 0, 0.9529412, 1, 1,
-0.01680451, -0.2232897, -2.009582, 0, 0.945098, 1, 1,
-0.01608782, -1.314276, -2.544788, 0, 0.9411765, 1, 1,
-0.004304151, -0.4266964, -1.886267, 0, 0.9333333, 1, 1,
-0.002610929, 1.11481, -0.8383065, 0, 0.9294118, 1, 1,
0.002007205, -0.6325983, 2.438014, 0, 0.9215686, 1, 1,
0.002652849, -0.9842306, 2.775919, 0, 0.9176471, 1, 1,
0.003719374, -0.3048976, 3.164672, 0, 0.9098039, 1, 1,
0.008060647, 0.483164, 0.5395865, 0, 0.9058824, 1, 1,
0.008328057, -0.2834591, 2.822057, 0, 0.8980392, 1, 1,
0.008434718, -0.07599604, 1.704459, 0, 0.8901961, 1, 1,
0.008961444, 0.2790492, 0.4688195, 0, 0.8862745, 1, 1,
0.01064819, 0.5967373, 0.3380133, 0, 0.8784314, 1, 1,
0.01131592, 1.228317, 1.490302, 0, 0.8745098, 1, 1,
0.01522255, 0.06395577, -1.495544, 0, 0.8666667, 1, 1,
0.02448953, -0.07196998, 2.405635, 0, 0.8627451, 1, 1,
0.02545648, -0.9810953, 3.124461, 0, 0.854902, 1, 1,
0.02548224, -0.2212173, 2.872397, 0, 0.8509804, 1, 1,
0.02879812, -1.444785, 3.814473, 0, 0.8431373, 1, 1,
0.02982395, -0.8237104, 2.321106, 0, 0.8392157, 1, 1,
0.03077308, -0.03716437, 2.764737, 0, 0.8313726, 1, 1,
0.03170425, -0.9368931, 3.375618, 0, 0.827451, 1, 1,
0.03326032, 1.140961, -0.7140532, 0, 0.8196079, 1, 1,
0.03518268, 2.110615, 2.351254, 0, 0.8156863, 1, 1,
0.03558017, -0.5417002, 5.498172, 0, 0.8078431, 1, 1,
0.03635569, 0.02182324, 1.218882, 0, 0.8039216, 1, 1,
0.03759914, 0.8386065, -0.7557839, 0, 0.7960784, 1, 1,
0.03886133, -0.3511772, 3.703239, 0, 0.7882353, 1, 1,
0.0406814, 0.5548635, 0.4339428, 0, 0.7843137, 1, 1,
0.04348018, -0.115466, 4.586574, 0, 0.7764706, 1, 1,
0.0442853, -0.01636078, 1.706254, 0, 0.772549, 1, 1,
0.04851082, 0.1516206, 0.05467271, 0, 0.7647059, 1, 1,
0.0503209, -1.592976, 1.789115, 0, 0.7607843, 1, 1,
0.05120488, 0.4338555, -1.130717, 0, 0.7529412, 1, 1,
0.05214344, -0.1356315, 3.225145, 0, 0.7490196, 1, 1,
0.05282789, 0.5252827, 0.7800607, 0, 0.7411765, 1, 1,
0.05325033, -1.137496, 1.958421, 0, 0.7372549, 1, 1,
0.05825236, 1.079524, -0.8839331, 0, 0.7294118, 1, 1,
0.05851471, -0.6026501, 2.99893, 0, 0.7254902, 1, 1,
0.07223712, 1.055373, 0.5170676, 0, 0.7176471, 1, 1,
0.07229456, 0.8413199, 0.3382454, 0, 0.7137255, 1, 1,
0.07383483, 0.4341428, 0.8359394, 0, 0.7058824, 1, 1,
0.07514229, -0.399091, 1.088818, 0, 0.6980392, 1, 1,
0.08004516, 0.6777564, 0.6620425, 0, 0.6941177, 1, 1,
0.0839428, -0.2941054, 3.122118, 0, 0.6862745, 1, 1,
0.08418618, -1.722659, 2.932136, 0, 0.682353, 1, 1,
0.08464783, -0.6532343, 4.563572, 0, 0.6745098, 1, 1,
0.08545867, 0.9809665, 0.5062981, 0, 0.6705883, 1, 1,
0.08569221, 0.4072104, -0.1570191, 0, 0.6627451, 1, 1,
0.08667336, -0.6951604, 3.069912, 0, 0.6588235, 1, 1,
0.08821431, -1.353773, 1.525955, 0, 0.6509804, 1, 1,
0.09041694, -0.8445738, 4.537059, 0, 0.6470588, 1, 1,
0.09359795, -1.123455, 2.771273, 0, 0.6392157, 1, 1,
0.09653354, 1.044873, 1.017317, 0, 0.6352941, 1, 1,
0.09797353, -0.4480057, 3.542129, 0, 0.627451, 1, 1,
0.09839255, 1.086865, 2.098239, 0, 0.6235294, 1, 1,
0.1023246, -0.9810621, 4.086661, 0, 0.6156863, 1, 1,
0.1064146, -0.1670687, 2.357584, 0, 0.6117647, 1, 1,
0.1072861, 0.74018, 0.9340113, 0, 0.6039216, 1, 1,
0.1101338, -0.0106036, 2.047678, 0, 0.5960785, 1, 1,
0.1112611, -0.7793931, 3.075865, 0, 0.5921569, 1, 1,
0.116877, -0.091301, 2.555964, 0, 0.5843138, 1, 1,
0.1170892, -0.1809686, 2.683966, 0, 0.5803922, 1, 1,
0.1235177, 1.711589, -0.4381497, 0, 0.572549, 1, 1,
0.1288212, -0.2139999, 4.350745, 0, 0.5686275, 1, 1,
0.1290098, -0.2573038, 2.884345, 0, 0.5607843, 1, 1,
0.1307177, 1.271946, -0.8896953, 0, 0.5568628, 1, 1,
0.1315301, -2.064898, 1.990901, 0, 0.5490196, 1, 1,
0.1323508, -1.830532, 1.866084, 0, 0.5450981, 1, 1,
0.1375121, 1.627689, 1.328506, 0, 0.5372549, 1, 1,
0.1378376, 1.249799, 0.06421562, 0, 0.5333334, 1, 1,
0.140862, -1.650092, 2.787565, 0, 0.5254902, 1, 1,
0.1409955, 0.7169208, 0.2964983, 0, 0.5215687, 1, 1,
0.1413887, 0.3406015, 0.721171, 0, 0.5137255, 1, 1,
0.1416575, -1.224226, 3.708787, 0, 0.509804, 1, 1,
0.1439006, 0.5617444, 0.08690462, 0, 0.5019608, 1, 1,
0.1497131, 0.6787244, 0.8099952, 0, 0.4941176, 1, 1,
0.1514731, -0.1729335, 2.693406, 0, 0.4901961, 1, 1,
0.1616195, -0.2249833, 2.536767, 0, 0.4823529, 1, 1,
0.1731768, 0.7026293, 0.8299999, 0, 0.4784314, 1, 1,
0.1733103, -0.3022155, 3.250672, 0, 0.4705882, 1, 1,
0.1775947, 1.013936, 2.696018, 0, 0.4666667, 1, 1,
0.1782212, -0.3136279, 2.638672, 0, 0.4588235, 1, 1,
0.1789779, -0.5333347, 6.443837, 0, 0.454902, 1, 1,
0.1825131, -1.518607, 3.684899, 0, 0.4470588, 1, 1,
0.1825224, 2.141124, 0.1818546, 0, 0.4431373, 1, 1,
0.1830013, 0.3542342, -1.116539, 0, 0.4352941, 1, 1,
0.1852069, -1.120573, 3.284863, 0, 0.4313726, 1, 1,
0.185656, -1.18691, 3.876822, 0, 0.4235294, 1, 1,
0.1869939, 0.4592947, -0.3627883, 0, 0.4196078, 1, 1,
0.1959597, -0.7040399, 4.752955, 0, 0.4117647, 1, 1,
0.1975026, -0.04671119, 2.57669, 0, 0.4078431, 1, 1,
0.1979545, -0.0746832, 0.9590912, 0, 0.4, 1, 1,
0.1991714, 0.1327242, 1.412783, 0, 0.3921569, 1, 1,
0.1993874, -0.4033591, 2.90009, 0, 0.3882353, 1, 1,
0.2014688, 0.2529914, 1.220496, 0, 0.3803922, 1, 1,
0.2032168, -0.2938108, 2.784176, 0, 0.3764706, 1, 1,
0.2059952, 0.4618923, 0.1864626, 0, 0.3686275, 1, 1,
0.2087017, -0.3315074, 3.577029, 0, 0.3647059, 1, 1,
0.2094778, 0.3658957, 1.055261, 0, 0.3568628, 1, 1,
0.210067, -1.09075, 3.512, 0, 0.3529412, 1, 1,
0.2172992, 0.09283635, 1.473504, 0, 0.345098, 1, 1,
0.2182928, -0.5123028, 1.993932, 0, 0.3411765, 1, 1,
0.220543, 0.2630316, 0.3914632, 0, 0.3333333, 1, 1,
0.2242654, -0.773774, 3.861082, 0, 0.3294118, 1, 1,
0.2266219, -0.7992835, 3.345448, 0, 0.3215686, 1, 1,
0.2274165, -0.9824564, 2.904335, 0, 0.3176471, 1, 1,
0.2284643, 0.3809514, -0.01503032, 0, 0.3098039, 1, 1,
0.2308066, 0.1340982, 0.6336472, 0, 0.3058824, 1, 1,
0.2324759, 0.07331929, -0.8888466, 0, 0.2980392, 1, 1,
0.2337141, -0.7375239, 3.959958, 0, 0.2901961, 1, 1,
0.2346134, -0.7940834, 1.281724, 0, 0.2862745, 1, 1,
0.2351018, 0.2340044, -1.053742, 0, 0.2784314, 1, 1,
0.2366401, -0.9955317, 1.986573, 0, 0.2745098, 1, 1,
0.2406423, 1.434217, 0.5440717, 0, 0.2666667, 1, 1,
0.2414959, 0.2381895, 0.3618151, 0, 0.2627451, 1, 1,
0.2429913, -0.8649901, 3.215252, 0, 0.254902, 1, 1,
0.2434138, 0.3100337, 0.2006609, 0, 0.2509804, 1, 1,
0.2436868, -1.020347, 2.144809, 0, 0.2431373, 1, 1,
0.2497151, -0.7568495, 3.400603, 0, 0.2392157, 1, 1,
0.2592683, 1.499358, 0.1520765, 0, 0.2313726, 1, 1,
0.2641281, -0.7317221, 2.520082, 0, 0.227451, 1, 1,
0.2643361, -0.6672048, 3.349854, 0, 0.2196078, 1, 1,
0.2659934, 0.4385583, 0.5472834, 0, 0.2156863, 1, 1,
0.2706043, 0.3791263, -0.1010327, 0, 0.2078431, 1, 1,
0.271127, 1.371876, -1.897754, 0, 0.2039216, 1, 1,
0.2800893, 0.6651013, 0.2422851, 0, 0.1960784, 1, 1,
0.2805008, -0.09900373, 3.265388, 0, 0.1882353, 1, 1,
0.2891971, 0.8801802, 0.04581074, 0, 0.1843137, 1, 1,
0.2908432, -0.6844084, 1.862247, 0, 0.1764706, 1, 1,
0.2916727, -0.1482604, 2.532515, 0, 0.172549, 1, 1,
0.2959535, -1.141195, 0.58926, 0, 0.1647059, 1, 1,
0.2995291, 0.2387028, 0.9138268, 0, 0.1607843, 1, 1,
0.2995604, 0.3375597, -0.9534066, 0, 0.1529412, 1, 1,
0.3005465, 0.8387688, 1.378662, 0, 0.1490196, 1, 1,
0.302875, -1.081437, 3.241588, 0, 0.1411765, 1, 1,
0.303599, -1.048399, 2.870439, 0, 0.1372549, 1, 1,
0.3129613, 2.690629, 1.12305, 0, 0.1294118, 1, 1,
0.3185236, 0.2876499, -0.3009249, 0, 0.1254902, 1, 1,
0.3195154, 0.134192, 2.114658, 0, 0.1176471, 1, 1,
0.3216357, -1.496968, 3.083252, 0, 0.1137255, 1, 1,
0.3235768, 0.7399414, 0.2256863, 0, 0.1058824, 1, 1,
0.3271853, 0.8018892, -0.3164646, 0, 0.09803922, 1, 1,
0.3274749, 0.7013763, 0.5280188, 0, 0.09411765, 1, 1,
0.329899, -0.7393708, 3.157808, 0, 0.08627451, 1, 1,
0.3303334, 1.711976, 0.4191248, 0, 0.08235294, 1, 1,
0.3325511, -0.7589673, 1.609496, 0, 0.07450981, 1, 1,
0.3329686, -0.1394767, 2.878951, 0, 0.07058824, 1, 1,
0.3339924, 0.299865, 0.2842153, 0, 0.0627451, 1, 1,
0.3360179, -0.8807387, 3.150615, 0, 0.05882353, 1, 1,
0.3364951, -1.328241, 2.418471, 0, 0.05098039, 1, 1,
0.3374754, 1.685501, 0.1183753, 0, 0.04705882, 1, 1,
0.3383371, -1.643836, 4.474345, 0, 0.03921569, 1, 1,
0.3397314, -0.6849516, 2.38694, 0, 0.03529412, 1, 1,
0.3399342, 0.551658, 1.18948, 0, 0.02745098, 1, 1,
0.3552615, -1.89575, 2.849705, 0, 0.02352941, 1, 1,
0.3644808, -0.3584287, 1.672075, 0, 0.01568628, 1, 1,
0.3665283, 1.694248, 0.01854481, 0, 0.01176471, 1, 1,
0.3692992, -0.05977853, 0.01404648, 0, 0.003921569, 1, 1,
0.3704598, 1.139275, 0.5942611, 0.003921569, 0, 1, 1,
0.3707883, -0.09146414, 1.177767, 0.007843138, 0, 1, 1,
0.3758887, 0.2432829, 0.5447963, 0.01568628, 0, 1, 1,
0.3761176, -0.2178963, 3.210859, 0.01960784, 0, 1, 1,
0.3769201, -0.8049388, 1.786869, 0.02745098, 0, 1, 1,
0.3792892, 0.8870713, -1.103553, 0.03137255, 0, 1, 1,
0.3847852, 0.2053834, -0.2450223, 0.03921569, 0, 1, 1,
0.385115, -0.3966131, 1.471996, 0.04313726, 0, 1, 1,
0.3923038, -0.1750686, 1.655103, 0.05098039, 0, 1, 1,
0.3923806, 0.1106049, 1.625674, 0.05490196, 0, 1, 1,
0.3932045, 0.6279922, 0.8078861, 0.0627451, 0, 1, 1,
0.3941616, -0.8362535, 1.660964, 0.06666667, 0, 1, 1,
0.3979146, 1.167356, 0.4631103, 0.07450981, 0, 1, 1,
0.4108778, -1.759945, 3.924511, 0.07843138, 0, 1, 1,
0.4165169, 0.8227818, 2.220483, 0.08627451, 0, 1, 1,
0.4177445, 1.554466, 0.01913154, 0.09019608, 0, 1, 1,
0.4195454, 0.3985758, 1.152308, 0.09803922, 0, 1, 1,
0.4212876, 0.7751706, 1.785586, 0.1058824, 0, 1, 1,
0.4263231, 0.6936424, 0.8098635, 0.1098039, 0, 1, 1,
0.436646, 0.06672236, 0.8896121, 0.1176471, 0, 1, 1,
0.4369817, 0.4768262, 0.3085668, 0.1215686, 0, 1, 1,
0.4396731, 0.8251063, 0.8965092, 0.1294118, 0, 1, 1,
0.4567033, -0.09076314, 0.5485011, 0.1333333, 0, 1, 1,
0.4584422, -2.412294, 4.51738, 0.1411765, 0, 1, 1,
0.4663546, 2.48198, -0.5232751, 0.145098, 0, 1, 1,
0.4666824, -0.3682444, 2.114907, 0.1529412, 0, 1, 1,
0.4685131, 0.7264518, -0.9826137, 0.1568628, 0, 1, 1,
0.4688044, -1.622567, 1.043431, 0.1647059, 0, 1, 1,
0.469667, -0.3215805, 1.431986, 0.1686275, 0, 1, 1,
0.4699452, 1.409731, 1.683192, 0.1764706, 0, 1, 1,
0.4705581, 0.7644744, 2.373284, 0.1803922, 0, 1, 1,
0.4786251, -0.5812954, 2.248291, 0.1882353, 0, 1, 1,
0.4816918, -1.124355, 3.101053, 0.1921569, 0, 1, 1,
0.4940903, 0.8084032, -0.5660611, 0.2, 0, 1, 1,
0.4955876, 0.2034289, 1.159443, 0.2078431, 0, 1, 1,
0.4968742, -1.395005, 2.211362, 0.2117647, 0, 1, 1,
0.5019564, 1.845082, -1.646916, 0.2196078, 0, 1, 1,
0.5088153, 0.5906506, -0.699939, 0.2235294, 0, 1, 1,
0.512958, -1.211423, 2.595268, 0.2313726, 0, 1, 1,
0.5153279, 0.1248135, 1.695622, 0.2352941, 0, 1, 1,
0.5167216, 0.2155157, 0.7508577, 0.2431373, 0, 1, 1,
0.5188724, -1.497684, 2.734399, 0.2470588, 0, 1, 1,
0.5237071, -0.7748119, 2.448346, 0.254902, 0, 1, 1,
0.5295705, 1.02182, 0.5612062, 0.2588235, 0, 1, 1,
0.5302504, 2.006411, -0.5796413, 0.2666667, 0, 1, 1,
0.5323073, -1.854072, 4.167379, 0.2705882, 0, 1, 1,
0.5366073, 0.0636389, 2.741962, 0.2784314, 0, 1, 1,
0.5379643, 2.212156, 1.183473, 0.282353, 0, 1, 1,
0.5443618, 0.1593047, 0.1992886, 0.2901961, 0, 1, 1,
0.5457932, -0.6248145, 1.775929, 0.2941177, 0, 1, 1,
0.5461414, -0.9226961, 2.353439, 0.3019608, 0, 1, 1,
0.5461595, 0.09980458, 0.3959782, 0.3098039, 0, 1, 1,
0.5466574, 1.612841, -1.587219, 0.3137255, 0, 1, 1,
0.5551755, -1.463326, 3.763588, 0.3215686, 0, 1, 1,
0.5573391, 0.02267427, 2.278254, 0.3254902, 0, 1, 1,
0.575027, 0.6748359, -0.6003047, 0.3333333, 0, 1, 1,
0.5779245, -2.065064, 2.754037, 0.3372549, 0, 1, 1,
0.5864246, -0.3985826, 0.9568434, 0.345098, 0, 1, 1,
0.5888284, 0.826521, 0.8190511, 0.3490196, 0, 1, 1,
0.5961231, -0.01791506, 0.02123552, 0.3568628, 0, 1, 1,
0.5989233, -0.06508622, 2.28388, 0.3607843, 0, 1, 1,
0.6020533, -0.4763882, 2.29569, 0.3686275, 0, 1, 1,
0.6032991, -0.2201425, 0.6479267, 0.372549, 0, 1, 1,
0.6118314, -1.705851, 3.414331, 0.3803922, 0, 1, 1,
0.6147365, -0.9551429, 2.150509, 0.3843137, 0, 1, 1,
0.6162837, -0.8029011, 3.951546, 0.3921569, 0, 1, 1,
0.6173385, -0.2028425, 1.538061, 0.3960784, 0, 1, 1,
0.6196513, -0.46311, 1.146465, 0.4039216, 0, 1, 1,
0.6241319, 0.4069736, 0.2483666, 0.4117647, 0, 1, 1,
0.6260359, -0.6229706, 3.837476, 0.4156863, 0, 1, 1,
0.6290932, 0.7981215, 2.224241, 0.4235294, 0, 1, 1,
0.6328797, -1.182459, 2.342434, 0.427451, 0, 1, 1,
0.6392032, 1.336278, 0.6520742, 0.4352941, 0, 1, 1,
0.6422986, 0.7003326, 2.276679, 0.4392157, 0, 1, 1,
0.6435564, -0.995455, 2.298248, 0.4470588, 0, 1, 1,
0.6449622, -0.899762, 3.7395, 0.4509804, 0, 1, 1,
0.652549, -0.0729255, 0.3647483, 0.4588235, 0, 1, 1,
0.6657543, -1.860748, 1.923361, 0.4627451, 0, 1, 1,
0.6682788, 0.7351347, 1.259122, 0.4705882, 0, 1, 1,
0.6701463, 1.085611, -1.843841, 0.4745098, 0, 1, 1,
0.6704043, 1.472123, -1.385215, 0.4823529, 0, 1, 1,
0.6716568, 0.5934169, 1.997918, 0.4862745, 0, 1, 1,
0.6751758, 0.202085, 3.506472, 0.4941176, 0, 1, 1,
0.675697, -0.2210094, 3.813447, 0.5019608, 0, 1, 1,
0.6798945, -0.6149485, 1.435147, 0.5058824, 0, 1, 1,
0.6826624, 2.351133, -0.01193999, 0.5137255, 0, 1, 1,
0.6829883, -3.209668, 3.56458, 0.5176471, 0, 1, 1,
0.6833176, 1.132773, 0.07363507, 0.5254902, 0, 1, 1,
0.6837589, -1.011356, 0.6074387, 0.5294118, 0, 1, 1,
0.6911, -0.05961986, 0.8885911, 0.5372549, 0, 1, 1,
0.6912102, -0.1953983, 0.8001498, 0.5411765, 0, 1, 1,
0.6912391, -0.6979035, 2.712612, 0.5490196, 0, 1, 1,
0.6973913, 0.5317821, 2.098741, 0.5529412, 0, 1, 1,
0.6985895, 1.037323, 0.08885499, 0.5607843, 0, 1, 1,
0.7092435, -0.03394663, 3.03188, 0.5647059, 0, 1, 1,
0.7196484, -0.3019529, 1.460074, 0.572549, 0, 1, 1,
0.7208417, 0.4316537, -0.5881375, 0.5764706, 0, 1, 1,
0.7244244, 1.737294, -0.2662404, 0.5843138, 0, 1, 1,
0.725959, -1.090236, 2.316082, 0.5882353, 0, 1, 1,
0.7280063, 2.103169, -0.03115186, 0.5960785, 0, 1, 1,
0.7330742, 0.3039988, 2.560292, 0.6039216, 0, 1, 1,
0.7349432, 0.1043918, 0.1231881, 0.6078432, 0, 1, 1,
0.736408, -0.09530922, 1.143162, 0.6156863, 0, 1, 1,
0.7434728, -0.6290683, 2.193409, 0.6196079, 0, 1, 1,
0.7464147, -1.506144, 2.232927, 0.627451, 0, 1, 1,
0.7669145, 1.749916, 1.110052, 0.6313726, 0, 1, 1,
0.7678767, -1.572454, 1.566985, 0.6392157, 0, 1, 1,
0.7718468, -0.1381412, 1.976134, 0.6431373, 0, 1, 1,
0.7747238, -1.723874, 2.403228, 0.6509804, 0, 1, 1,
0.7768803, -0.1407022, 0.1160784, 0.654902, 0, 1, 1,
0.7807758, 0.4415795, 0.1207343, 0.6627451, 0, 1, 1,
0.7829, 0.01656324, 0.1198882, 0.6666667, 0, 1, 1,
0.7847495, 1.114804, 0.6975551, 0.6745098, 0, 1, 1,
0.784756, -0.04486426, 1.374041, 0.6784314, 0, 1, 1,
0.7917512, -1.965117, 2.197943, 0.6862745, 0, 1, 1,
0.7959343, 0.8317153, 1.583242, 0.6901961, 0, 1, 1,
0.7990902, 0.9407725, -0.2456298, 0.6980392, 0, 1, 1,
0.799994, -1.476883, 4.93644, 0.7058824, 0, 1, 1,
0.8001536, 1.079594, 2.522786, 0.7098039, 0, 1, 1,
0.8082672, 0.2803378, -0.6044959, 0.7176471, 0, 1, 1,
0.8096228, 0.1604657, 1.975712, 0.7215686, 0, 1, 1,
0.8149685, 0.467762, 1.142328, 0.7294118, 0, 1, 1,
0.8164709, 0.09581042, 2.507401, 0.7333333, 0, 1, 1,
0.821285, -1.137908, 1.235115, 0.7411765, 0, 1, 1,
0.8215022, 1.552816, -0.01393094, 0.7450981, 0, 1, 1,
0.8269165, -0.4505154, 2.545526, 0.7529412, 0, 1, 1,
0.8298788, -0.6398255, 2.929111, 0.7568628, 0, 1, 1,
0.8309981, 0.3444516, 1.190303, 0.7647059, 0, 1, 1,
0.8311573, 0.4380152, -0.4840698, 0.7686275, 0, 1, 1,
0.8332379, -1.00232, 2.227092, 0.7764706, 0, 1, 1,
0.836043, 2.80786, 0.3223487, 0.7803922, 0, 1, 1,
0.8476374, 0.2284516, 2.462001, 0.7882353, 0, 1, 1,
0.8540481, 0.2479645, 1.92223, 0.7921569, 0, 1, 1,
0.8617309, -1.199864, 1.819586, 0.8, 0, 1, 1,
0.8632905, 0.3372082, 0.8166627, 0.8078431, 0, 1, 1,
0.8671591, 0.05068959, 4.059123, 0.8117647, 0, 1, 1,
0.8709024, 2.366392, -1.068579, 0.8196079, 0, 1, 1,
0.8730806, 1.364399, 0.08002261, 0.8235294, 0, 1, 1,
0.8733761, -0.6390768, 2.08635, 0.8313726, 0, 1, 1,
0.874163, -2.142232, 3.490921, 0.8352941, 0, 1, 1,
0.8810373, 0.649229, 1.32805, 0.8431373, 0, 1, 1,
0.8940576, -2.395366, 1.890522, 0.8470588, 0, 1, 1,
0.8985836, 2.088299, 0.7796723, 0.854902, 0, 1, 1,
0.8987497, 1.202654, 0.06411059, 0.8588235, 0, 1, 1,
0.8990683, -0.4815495, 1.792012, 0.8666667, 0, 1, 1,
0.9078975, 0.2619566, 1.040366, 0.8705882, 0, 1, 1,
0.9089348, 0.2351998, 0.5407072, 0.8784314, 0, 1, 1,
0.9104258, -0.2191619, 2.099488, 0.8823529, 0, 1, 1,
0.9115748, 0.7092789, -1.160143, 0.8901961, 0, 1, 1,
0.9164225, -0.3624775, 1.731509, 0.8941177, 0, 1, 1,
0.9200544, -0.1455119, 2.864387, 0.9019608, 0, 1, 1,
0.9247216, -0.2610832, 1.146289, 0.9098039, 0, 1, 1,
0.9262379, 0.9605721, 0.193209, 0.9137255, 0, 1, 1,
0.9373341, -0.6322001, 2.092215, 0.9215686, 0, 1, 1,
0.9413209, 0.1803425, 2.295005, 0.9254902, 0, 1, 1,
0.9419513, -1.839982, 2.267232, 0.9333333, 0, 1, 1,
0.9430503, 0.2956874, 2.427928, 0.9372549, 0, 1, 1,
0.9430527, -0.01618593, 0.7099383, 0.945098, 0, 1, 1,
0.9487607, 1.667525, 1.861921, 0.9490196, 0, 1, 1,
0.9546592, 0.6700028, 0.8963581, 0.9568627, 0, 1, 1,
0.9650781, 0.9088636, 3.497252, 0.9607843, 0, 1, 1,
0.9652532, -0.227996, 1.52853, 0.9686275, 0, 1, 1,
0.9707747, 0.9023202, 0.3740598, 0.972549, 0, 1, 1,
0.9756699, 0.5037171, 0.9672132, 0.9803922, 0, 1, 1,
0.9789866, 0.40513, 0.37998, 0.9843137, 0, 1, 1,
0.9790608, 0.4793461, 2.637017, 0.9921569, 0, 1, 1,
0.9843539, 0.8700048, 2.374496, 0.9960784, 0, 1, 1,
0.994854, -0.3806018, 1.32241, 1, 0, 0.9960784, 1,
1.002372, 0.9534332, 1.442095, 1, 0, 0.9882353, 1,
1.005815, -0.176297, 1.541652, 1, 0, 0.9843137, 1,
1.006402, 1.03955, 0.9809273, 1, 0, 0.9764706, 1,
1.007994, -0.9039211, 2.107674, 1, 0, 0.972549, 1,
1.015461, 2.504852, 0.5352131, 1, 0, 0.9647059, 1,
1.018092, 1.701095, -0.6053385, 1, 0, 0.9607843, 1,
1.022007, 0.07939749, 2.425103, 1, 0, 0.9529412, 1,
1.022187, 0.1859843, 1.804106, 1, 0, 0.9490196, 1,
1.028185, 0.6797943, 0.2377278, 1, 0, 0.9411765, 1,
1.03053, -0.1004157, 2.07972, 1, 0, 0.9372549, 1,
1.037904, 0.6381553, -0.8236836, 1, 0, 0.9294118, 1,
1.040125, 0.7350492, 0.1776305, 1, 0, 0.9254902, 1,
1.041644, -1.375157, 2.73436, 1, 0, 0.9176471, 1,
1.042887, -0.004393605, 1.68824, 1, 0, 0.9137255, 1,
1.044639, 0.5792499, 1.868583, 1, 0, 0.9058824, 1,
1.047768, -0.3519851, 2.714646, 1, 0, 0.9019608, 1,
1.047794, 1.196365, 0.2845523, 1, 0, 0.8941177, 1,
1.050414, -1.471148, 3.037688, 1, 0, 0.8862745, 1,
1.058745, 0.3455006, -0.3654664, 1, 0, 0.8823529, 1,
1.063355, 1.023443, 1.142407, 1, 0, 0.8745098, 1,
1.065301, -0.1822927, 1.935332, 1, 0, 0.8705882, 1,
1.069884, -0.5884889, 1.598887, 1, 0, 0.8627451, 1,
1.07349, -1.140559, 2.432036, 1, 0, 0.8588235, 1,
1.081724, 1.599674, 1.071761, 1, 0, 0.8509804, 1,
1.085324, -0.3433859, 1.37307, 1, 0, 0.8470588, 1,
1.092527, -0.8278174, 1.983943, 1, 0, 0.8392157, 1,
1.093578, -2.005616, 3.042788, 1, 0, 0.8352941, 1,
1.098518, -0.1504388, 1.362019, 1, 0, 0.827451, 1,
1.098823, 1.021899, 1.161725, 1, 0, 0.8235294, 1,
1.100601, -2.267779, 2.599051, 1, 0, 0.8156863, 1,
1.106151, 0.4595428, 1.333268, 1, 0, 0.8117647, 1,
1.107347, 0.3487316, 1.184122, 1, 0, 0.8039216, 1,
1.129395, 0.1600821, 0.4628668, 1, 0, 0.7960784, 1,
1.138746, 0.1822549, -0.113546, 1, 0, 0.7921569, 1,
1.147383, 0.6680632, -0.4777909, 1, 0, 0.7843137, 1,
1.15654, -0.4427261, 1.687556, 1, 0, 0.7803922, 1,
1.158242, -1.747514, 1.722277, 1, 0, 0.772549, 1,
1.1652, -0.9285061, 1.58384, 1, 0, 0.7686275, 1,
1.167265, 0.6331914, 1.674623, 1, 0, 0.7607843, 1,
1.169158, 1.609599, 1.123462, 1, 0, 0.7568628, 1,
1.16967, -2.061096, 2.722465, 1, 0, 0.7490196, 1,
1.176449, 0.4858045, 2.96808, 1, 0, 0.7450981, 1,
1.178398, 0.7148184, 1.521282, 1, 0, 0.7372549, 1,
1.181347, -0.484209, 2.41803, 1, 0, 0.7333333, 1,
1.181366, 0.7020947, 0.7880656, 1, 0, 0.7254902, 1,
1.191375, 0.9744525, 2.451257, 1, 0, 0.7215686, 1,
1.19192, 0.675231, 1.421858, 1, 0, 0.7137255, 1,
1.195298, -0.2083807, 1.795939, 1, 0, 0.7098039, 1,
1.199857, 0.581238, 2.112932, 1, 0, 0.7019608, 1,
1.20179, -1.314331, 1.770879, 1, 0, 0.6941177, 1,
1.213405, -0.3176551, 1.095747, 1, 0, 0.6901961, 1,
1.215507, 0.2986404, 0.5377318, 1, 0, 0.682353, 1,
1.222056, 0.1698366, 1.788521, 1, 0, 0.6784314, 1,
1.231165, -0.5950041, 0.2051352, 1, 0, 0.6705883, 1,
1.235076, 1.377518, -0.3531087, 1, 0, 0.6666667, 1,
1.238853, -0.8486959, 2.11826, 1, 0, 0.6588235, 1,
1.25073, -1.305778, 2.047354, 1, 0, 0.654902, 1,
1.252659, -1.522696, 2.588653, 1, 0, 0.6470588, 1,
1.26184, 0.06952506, -0.04757736, 1, 0, 0.6431373, 1,
1.271332, 2.18738, 1.570329, 1, 0, 0.6352941, 1,
1.273539, 0.3274271, 2.783002, 1, 0, 0.6313726, 1,
1.275636, -1.464075, 2.937365, 1, 0, 0.6235294, 1,
1.277839, 0.3702805, 1.118795, 1, 0, 0.6196079, 1,
1.280214, -0.2731752, 2.462576, 1, 0, 0.6117647, 1,
1.293573, 0.7278129, 0.6191516, 1, 0, 0.6078432, 1,
1.294972, -0.8681736, 2.952678, 1, 0, 0.6, 1,
1.296425, 0.6578251, 1.276846, 1, 0, 0.5921569, 1,
1.300269, 0.2593179, 1.898957, 1, 0, 0.5882353, 1,
1.317428, -2.409449, 2.757993, 1, 0, 0.5803922, 1,
1.330819, -1.470376, 2.548362, 1, 0, 0.5764706, 1,
1.341721, 1.39063, 1.274796, 1, 0, 0.5686275, 1,
1.349645, 0.422868, 0.1609844, 1, 0, 0.5647059, 1,
1.354543, 0.1779661, 0.8428955, 1, 0, 0.5568628, 1,
1.35536, 1.075957, -0.8090696, 1, 0, 0.5529412, 1,
1.356736, -0.571614, 2.092717, 1, 0, 0.5450981, 1,
1.35689, -1.254699, 1.88597, 1, 0, 0.5411765, 1,
1.360259, 0.1626728, 1.102828, 1, 0, 0.5333334, 1,
1.365281, 1.076609, 0.06967521, 1, 0, 0.5294118, 1,
1.376402, -0.02260643, 2.56597, 1, 0, 0.5215687, 1,
1.385261, -0.01555078, 0.4065058, 1, 0, 0.5176471, 1,
1.387834, 0.8187501, 1.753976, 1, 0, 0.509804, 1,
1.393561, 0.01959397, 0.171335, 1, 0, 0.5058824, 1,
1.396861, 1.272238, 0.6157337, 1, 0, 0.4980392, 1,
1.399882, 0.3612088, 0.7815564, 1, 0, 0.4901961, 1,
1.40084, 0.5889062, 0.9851065, 1, 0, 0.4862745, 1,
1.405666, -0.03181073, 3.673673, 1, 0, 0.4784314, 1,
1.410193, -0.2115829, 0.7604373, 1, 0, 0.4745098, 1,
1.422816, -0.0477419, 1.444164, 1, 0, 0.4666667, 1,
1.423641, 0.8141035, 2.632053, 1, 0, 0.4627451, 1,
1.423724, -0.6416043, 1.225982, 1, 0, 0.454902, 1,
1.427029, -1.109651, 1.162206, 1, 0, 0.4509804, 1,
1.429491, 1.297351, -0.1176491, 1, 0, 0.4431373, 1,
1.433076, -0.494565, 2.338102, 1, 0, 0.4392157, 1,
1.43332, -0.2843888, 2.628052, 1, 0, 0.4313726, 1,
1.439493, -0.6987543, 2.017436, 1, 0, 0.427451, 1,
1.440195, 1.333226, -0.5235024, 1, 0, 0.4196078, 1,
1.445824, -0.252723, 1.244895, 1, 0, 0.4156863, 1,
1.454604, 0.2401986, 0.642179, 1, 0, 0.4078431, 1,
1.45478, -0.5629945, 2.099201, 1, 0, 0.4039216, 1,
1.463659, 0.304564, 2.894471, 1, 0, 0.3960784, 1,
1.467062, 0.08616223, 1.922602, 1, 0, 0.3882353, 1,
1.467161, -1.432803, 2.480504, 1, 0, 0.3843137, 1,
1.476184, -1.983761, 2.485718, 1, 0, 0.3764706, 1,
1.476487, 0.8419572, 1.29352, 1, 0, 0.372549, 1,
1.477856, -0.6280784, 3.877533, 1, 0, 0.3647059, 1,
1.48095, 0.2710425, 3.222135, 1, 0, 0.3607843, 1,
1.48216, -0.9006673, 2.624203, 1, 0, 0.3529412, 1,
1.499582, -1.912799, 3.109682, 1, 0, 0.3490196, 1,
1.52065, -0.4850785, 1.626957, 1, 0, 0.3411765, 1,
1.534159, 0.8997765, 0.8769936, 1, 0, 0.3372549, 1,
1.54891, -0.05783724, 1.434599, 1, 0, 0.3294118, 1,
1.55072, 0.1274621, 1.996489, 1, 0, 0.3254902, 1,
1.573407, -0.7774409, 2.661867, 1, 0, 0.3176471, 1,
1.613631, -0.3728679, 1.897793, 1, 0, 0.3137255, 1,
1.62972, 0.5162075, 0.3218383, 1, 0, 0.3058824, 1,
1.63484, 0.8525382, 3.135393, 1, 0, 0.2980392, 1,
1.636407, -0.2877364, 1.168224, 1, 0, 0.2941177, 1,
1.639457, -1.039852, 2.008585, 1, 0, 0.2862745, 1,
1.651219, 2.270198, 1.000894, 1, 0, 0.282353, 1,
1.662425, -1.929917, 2.075191, 1, 0, 0.2745098, 1,
1.663181, 0.01261979, 1.143122, 1, 0, 0.2705882, 1,
1.669539, -0.4973863, 2.207303, 1, 0, 0.2627451, 1,
1.669908, -1.142325, 3.823757, 1, 0, 0.2588235, 1,
1.679425, -0.6958638, 4.213026, 1, 0, 0.2509804, 1,
1.686861, 0.0001437431, 1.071487, 1, 0, 0.2470588, 1,
1.719797, 0.06103313, 1.405013, 1, 0, 0.2392157, 1,
1.725227, -0.6240196, 1.695376, 1, 0, 0.2352941, 1,
1.73679, -2.287765, 2.875925, 1, 0, 0.227451, 1,
1.747587, 1.089363, 0.8452657, 1, 0, 0.2235294, 1,
1.748848, 0.1583401, 1.580916, 1, 0, 0.2156863, 1,
1.749732, -0.6096475, 1.879633, 1, 0, 0.2117647, 1,
1.775445, 1.79225, 0.1073575, 1, 0, 0.2039216, 1,
1.786922, 1.153402, -1.201537, 1, 0, 0.1960784, 1,
1.798391, 0.9103265, 2.397585, 1, 0, 0.1921569, 1,
1.798801, -0.2930191, 1.916562, 1, 0, 0.1843137, 1,
1.801726, 1.141827, 2.61048, 1, 0, 0.1803922, 1,
1.845467, -0.8885374, 3.084329, 1, 0, 0.172549, 1,
1.85334, -1.764636, 1.172357, 1, 0, 0.1686275, 1,
1.861757, -0.6504957, 1.450658, 1, 0, 0.1607843, 1,
1.961269, -1.043249, 2.889095, 1, 0, 0.1568628, 1,
2.050525, 1.399086, 0.5636997, 1, 0, 0.1490196, 1,
2.054139, 0.3249025, 3.023954, 1, 0, 0.145098, 1,
2.055519, 0.1454121, 2.387676, 1, 0, 0.1372549, 1,
2.07011, -1.963954, 0.2377788, 1, 0, 0.1333333, 1,
2.103018, 0.3782137, 0.3658859, 1, 0, 0.1254902, 1,
2.122836, -0.9824312, 2.703935, 1, 0, 0.1215686, 1,
2.129399, 0.5745479, 1.371052, 1, 0, 0.1137255, 1,
2.152705, -2.015408, 3.609146, 1, 0, 0.1098039, 1,
2.209353, -1.956793, 2.430438, 1, 0, 0.1019608, 1,
2.218658, -1.7088, 3.277122, 1, 0, 0.09411765, 1,
2.253571, -0.5869564, 1.061685, 1, 0, 0.09019608, 1,
2.307176, -0.4789573, 1.884415, 1, 0, 0.08235294, 1,
2.335269, -0.5521917, 0.7763018, 1, 0, 0.07843138, 1,
2.385167, 0.3220998, 0.05524066, 1, 0, 0.07058824, 1,
2.477278, 0.5881206, -0.2516217, 1, 0, 0.06666667, 1,
2.552445, 0.4270813, 1.674385, 1, 0, 0.05882353, 1,
2.635468, -0.3391314, 1.960166, 1, 0, 0.05490196, 1,
2.640851, 1.670365, 1.470581, 1, 0, 0.04705882, 1,
2.745585, 1.777253, 1.886274, 1, 0, 0.04313726, 1,
2.853198, 0.1017737, 3.908803, 1, 0, 0.03529412, 1,
2.90189, 0.7848782, 1.286622, 1, 0, 0.03137255, 1,
2.924249, 0.9469552, 0.1973619, 1, 0, 0.02352941, 1,
3.0508, -0.01651712, 2.383313, 1, 0, 0.01960784, 1,
3.205187, -0.5467487, 1.784302, 1, 0, 0.01176471, 1,
3.265546, 0.7898733, 1.764349, 1, 0, 0.007843138, 1
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
0.0686599, -4.856925, -6.747108, 0, -0.5, 0.5, 0.5,
0.0686599, -4.856925, -6.747108, 1, -0.5, 0.5, 0.5,
0.0686599, -4.856925, -6.747108, 1, 1.5, 0.5, 0.5,
0.0686599, -4.856925, -6.747108, 0, 1.5, 0.5, 0.5
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
-4.21197, -0.2986115, -6.747108, 0, -0.5, 0.5, 0.5,
-4.21197, -0.2986115, -6.747108, 1, -0.5, 0.5, 0.5,
-4.21197, -0.2986115, -6.747108, 1, 1.5, 0.5, 0.5,
-4.21197, -0.2986115, -6.747108, 0, 1.5, 0.5, 0.5
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
-4.21197, -4.856925, 0.8042707, 0, -0.5, 0.5, 0.5,
-4.21197, -4.856925, 0.8042707, 1, -0.5, 0.5, 0.5,
-4.21197, -4.856925, 0.8042707, 1, 1.5, 0.5, 0.5,
-4.21197, -4.856925, 0.8042707, 0, 1.5, 0.5, 0.5
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
-3, -3.805007, -5.004482,
3, -3.805007, -5.004482,
-3, -3.805007, -5.004482,
-3, -3.980326, -5.29492,
-2, -3.805007, -5.004482,
-2, -3.980326, -5.29492,
-1, -3.805007, -5.004482,
-1, -3.980326, -5.29492,
0, -3.805007, -5.004482,
0, -3.980326, -5.29492,
1, -3.805007, -5.004482,
1, -3.980326, -5.29492,
2, -3.805007, -5.004482,
2, -3.980326, -5.29492,
3, -3.805007, -5.004482,
3, -3.980326, -5.29492
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
-3, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
-3, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
-3, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
-3, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5,
-2, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
-2, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
-2, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
-2, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5,
-1, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
-1, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
-1, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
-1, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5,
0, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
0, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
0, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
0, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5,
1, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
1, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
1, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
1, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5,
2, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
2, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
2, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
2, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5,
3, -4.330966, -5.875795, 0, -0.5, 0.5, 0.5,
3, -4.330966, -5.875795, 1, -0.5, 0.5, 0.5,
3, -4.330966, -5.875795, 1, 1.5, 0.5, 0.5,
3, -4.330966, -5.875795, 0, 1.5, 0.5, 0.5
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
-3.224132, -3, -5.004482,
-3.224132, 3, -5.004482,
-3.224132, -3, -5.004482,
-3.388772, -3, -5.29492,
-3.224132, -2, -5.004482,
-3.388772, -2, -5.29492,
-3.224132, -1, -5.004482,
-3.388772, -1, -5.29492,
-3.224132, 0, -5.004482,
-3.388772, 0, -5.29492,
-3.224132, 1, -5.004482,
-3.388772, 1, -5.29492,
-3.224132, 2, -5.004482,
-3.388772, 2, -5.29492,
-3.224132, 3, -5.004482,
-3.388772, 3, -5.29492
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
-3.718051, -3, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, -3, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, -3, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, -3, -5.875795, 0, 1.5, 0.5, 0.5,
-3.718051, -2, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, -2, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, -2, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, -2, -5.875795, 0, 1.5, 0.5, 0.5,
-3.718051, -1, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, -1, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, -1, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, -1, -5.875795, 0, 1.5, 0.5, 0.5,
-3.718051, 0, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, 0, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, 0, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, 0, -5.875795, 0, 1.5, 0.5, 0.5,
-3.718051, 1, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, 1, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, 1, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, 1, -5.875795, 0, 1.5, 0.5, 0.5,
-3.718051, 2, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, 2, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, 2, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, 2, -5.875795, 0, 1.5, 0.5, 0.5,
-3.718051, 3, -5.875795, 0, -0.5, 0.5, 0.5,
-3.718051, 3, -5.875795, 1, -0.5, 0.5, 0.5,
-3.718051, 3, -5.875795, 1, 1.5, 0.5, 0.5,
-3.718051, 3, -5.875795, 0, 1.5, 0.5, 0.5
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
-3.224132, -3.805007, -4,
-3.224132, -3.805007, 6,
-3.224132, -3.805007, -4,
-3.388772, -3.980326, -4,
-3.224132, -3.805007, -2,
-3.388772, -3.980326, -2,
-3.224132, -3.805007, 0,
-3.388772, -3.980326, 0,
-3.224132, -3.805007, 2,
-3.388772, -3.980326, 2,
-3.224132, -3.805007, 4,
-3.388772, -3.980326, 4,
-3.224132, -3.805007, 6,
-3.388772, -3.980326, 6
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
-3.718051, -4.330966, -4, 0, -0.5, 0.5, 0.5,
-3.718051, -4.330966, -4, 1, -0.5, 0.5, 0.5,
-3.718051, -4.330966, -4, 1, 1.5, 0.5, 0.5,
-3.718051, -4.330966, -4, 0, 1.5, 0.5, 0.5,
-3.718051, -4.330966, -2, 0, -0.5, 0.5, 0.5,
-3.718051, -4.330966, -2, 1, -0.5, 0.5, 0.5,
-3.718051, -4.330966, -2, 1, 1.5, 0.5, 0.5,
-3.718051, -4.330966, -2, 0, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 0, 0, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 0, 1, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 0, 1, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 0, 0, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 2, 0, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 2, 1, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 2, 1, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 2, 0, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 4, 0, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 4, 1, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 4, 1, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 4, 0, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 6, 0, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 6, 1, -0.5, 0.5, 0.5,
-3.718051, -4.330966, 6, 1, 1.5, 0.5, 0.5,
-3.718051, -4.330966, 6, 0, 1.5, 0.5, 0.5
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
-3.224132, -3.805007, -5.004482,
-3.224132, 3.207784, -5.004482,
-3.224132, -3.805007, 6.613024,
-3.224132, 3.207784, 6.613024,
-3.224132, -3.805007, -5.004482,
-3.224132, -3.805007, 6.613024,
-3.224132, 3.207784, -5.004482,
-3.224132, 3.207784, 6.613024,
-3.224132, -3.805007, -5.004482,
3.361452, -3.805007, -5.004482,
-3.224132, -3.805007, 6.613024,
3.361452, -3.805007, 6.613024,
-3.224132, 3.207784, -5.004482,
3.361452, 3.207784, -5.004482,
-3.224132, 3.207784, 6.613024,
3.361452, 3.207784, 6.613024,
3.361452, -3.805007, -5.004482,
3.361452, 3.207784, -5.004482,
3.361452, -3.805007, 6.613024,
3.361452, 3.207784, 6.613024,
3.361452, -3.805007, -5.004482,
3.361452, -3.805007, 6.613024,
3.361452, 3.207784, -5.004482,
3.361452, 3.207784, 6.613024
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
var radius = 8.05436;
var distance = 35.83476;
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
mvMatrix.translate( -0.0686599, 0.2986115, -0.8042707 );
mvMatrix.scale( 1.322363, 1.241807, 0.7496043 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83476);
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
cyhalothrin<-read.table("cyhalothrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyhalothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyhalothrin' not found
```

```r
y<-cyhalothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyhalothrin' not found
```

```r
z<-cyhalothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyhalothrin' not found
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
-3.128226, -1.772712, -0.8351478, 0, 0, 1, 1, 1,
-2.981102, -1.672545, -2.552658, 1, 0, 0, 1, 1,
-2.702689, -1.700152, -2.147337, 1, 0, 0, 1, 1,
-2.684914, 0.37557, -2.660236, 1, 0, 0, 1, 1,
-2.50612, -1.084273, -2.214544, 1, 0, 0, 1, 1,
-2.487699, -0.9485941, 0.04249003, 1, 0, 0, 1, 1,
-2.480083, 0.06230159, -1.269204, 0, 0, 0, 1, 1,
-2.460135, 0.1094917, -2.332586, 0, 0, 0, 1, 1,
-2.427964, -1.233279, -3.02011, 0, 0, 0, 1, 1,
-2.410428, 0.2627596, 0.4046265, 0, 0, 0, 1, 1,
-2.393904, 0.6958672, -1.609338, 0, 0, 0, 1, 1,
-2.361388, -1.495584, -1.799024, 0, 0, 0, 1, 1,
-2.34851, 0.6546913, -1.623962, 0, 0, 0, 1, 1,
-2.344893, -0.8231927, -3.088782, 1, 1, 1, 1, 1,
-2.343984, -0.2521142, -1.691785, 1, 1, 1, 1, 1,
-2.308247, 0.93721, -0.2417696, 1, 1, 1, 1, 1,
-2.275063, -1.098163, -1.542839, 1, 1, 1, 1, 1,
-2.250917, -1.085832, -2.454389, 1, 1, 1, 1, 1,
-2.210803, 0.1265587, -0.5997979, 1, 1, 1, 1, 1,
-2.208791, 0.6921426, 0.3036419, 1, 1, 1, 1, 1,
-2.0784, -0.6896031, -2.530241, 1, 1, 1, 1, 1,
-2.07329, 0.8204548, -1.140308, 1, 1, 1, 1, 1,
-2.06492, -0.7986515, -2.526311, 1, 1, 1, 1, 1,
-2.007828, 1.247439, -1.115043, 1, 1, 1, 1, 1,
-1.997959, 1.294678, -0.1525313, 1, 1, 1, 1, 1,
-1.956775, 1.787104, -0.5082278, 1, 1, 1, 1, 1,
-1.946133, -1.927029, -3.310856, 1, 1, 1, 1, 1,
-1.934922, 1.967864, -1.740761, 1, 1, 1, 1, 1,
-1.903913, 0.6803717, -1.199814, 0, 0, 1, 1, 1,
-1.881873, -1.669789, -2.191602, 1, 0, 0, 1, 1,
-1.878692, -0.9339434, -1.774508, 1, 0, 0, 1, 1,
-1.86289, -1.323789, -1.655133, 1, 0, 0, 1, 1,
-1.859871, 0.2053519, -0.7424664, 1, 0, 0, 1, 1,
-1.845035, 1.603377, -0.963313, 1, 0, 0, 1, 1,
-1.835604, -0.6590701, -1.124751, 0, 0, 0, 1, 1,
-1.834627, -0.2540171, -0.5653512, 0, 0, 0, 1, 1,
-1.823889, 0.5160758, -2.464771, 0, 0, 0, 1, 1,
-1.823275, 1.496315, -1.603329, 0, 0, 0, 1, 1,
-1.808833, -0.4071727, -3.33708, 0, 0, 0, 1, 1,
-1.807397, 0.3243862, -0.8173065, 0, 0, 0, 1, 1,
-1.803163, -1.488081, -2.722855, 0, 0, 0, 1, 1,
-1.77521, -1.79274, -2.015973, 1, 1, 1, 1, 1,
-1.771158, -0.1290409, -3.123196, 1, 1, 1, 1, 1,
-1.770735, -0.8266597, -1.216747, 1, 1, 1, 1, 1,
-1.765431, 0.04366017, -2.185842, 1, 1, 1, 1, 1,
-1.761294, 0.6651613, 0.535651, 1, 1, 1, 1, 1,
-1.741004, -1.305027, -3.070256, 1, 1, 1, 1, 1,
-1.739877, 1.200408, -2.386733, 1, 1, 1, 1, 1,
-1.734037, -0.4621943, -2.637289, 1, 1, 1, 1, 1,
-1.718627, -0.5968614, -1.460583, 1, 1, 1, 1, 1,
-1.711699, 0.9338635, 0.9399927, 1, 1, 1, 1, 1,
-1.704133, 0.4913493, -0.709999, 1, 1, 1, 1, 1,
-1.691553, -0.9739175, -2.773846, 1, 1, 1, 1, 1,
-1.678354, 1.076765, -1.365291, 1, 1, 1, 1, 1,
-1.666003, -0.3553019, -1.437704, 1, 1, 1, 1, 1,
-1.638489, 0.2055711, -0.202769, 1, 1, 1, 1, 1,
-1.63653, -1.759541, -4.422855, 0, 0, 1, 1, 1,
-1.632575, 0.2493881, -2.291836, 1, 0, 0, 1, 1,
-1.627746, -1.22887, -2.718491, 1, 0, 0, 1, 1,
-1.624772, 1.498796, -1.197744, 1, 0, 0, 1, 1,
-1.610227, -0.07333953, -2.766174, 1, 0, 0, 1, 1,
-1.602286, 1.237135, -0.4159955, 1, 0, 0, 1, 1,
-1.59668, -1.186272, -2.32085, 0, 0, 0, 1, 1,
-1.590148, 0.5665658, -2.377121, 0, 0, 0, 1, 1,
-1.580528, 0.5710779, -0.2749357, 0, 0, 0, 1, 1,
-1.557698, -0.2794927, 0.06325759, 0, 0, 0, 1, 1,
-1.551875, -1.438463, -1.302474, 0, 0, 0, 1, 1,
-1.540437, 0.4399859, -1.86252, 0, 0, 0, 1, 1,
-1.529401, 1.504725, -0.9109467, 0, 0, 0, 1, 1,
-1.518179, 0.03531012, -1.273971, 1, 1, 1, 1, 1,
-1.513877, -1.382979, -1.896584, 1, 1, 1, 1, 1,
-1.509945, -0.7312562, -0.5680845, 1, 1, 1, 1, 1,
-1.494826, 0.4802935, -1.194328, 1, 1, 1, 1, 1,
-1.489729, -0.9922032, -3.501292, 1, 1, 1, 1, 1,
-1.48277, -0.8105896, -2.386816, 1, 1, 1, 1, 1,
-1.473867, 0.07522884, -0.02747664, 1, 1, 1, 1, 1,
-1.473472, -0.7317927, -1.393642, 1, 1, 1, 1, 1,
-1.466489, 1.533228, -1.450478, 1, 1, 1, 1, 1,
-1.454681, -1.597369, -0.4067145, 1, 1, 1, 1, 1,
-1.453852, 1.011195, -0.02825307, 1, 1, 1, 1, 1,
-1.452985, 0.1405343, -2.442246, 1, 1, 1, 1, 1,
-1.449491, 0.5036238, 0.01671241, 1, 1, 1, 1, 1,
-1.444801, -1.637364, -2.424635, 1, 1, 1, 1, 1,
-1.441965, 1.031617, -1.682404, 1, 1, 1, 1, 1,
-1.440259, -0.5471718, -2.291945, 0, 0, 1, 1, 1,
-1.415243, -0.7487959, -2.767828, 1, 0, 0, 1, 1,
-1.413194, 1.028987, 0.004697226, 1, 0, 0, 1, 1,
-1.40439, -1.681617, -1.371739, 1, 0, 0, 1, 1,
-1.400687, -0.1999447, 0.1194299, 1, 0, 0, 1, 1,
-1.39702, 1.152925, 0.7024279, 1, 0, 0, 1, 1,
-1.383764, 2.456563, -0.1707418, 0, 0, 0, 1, 1,
-1.3715, 0.7417327, -0.254822, 0, 0, 0, 1, 1,
-1.366994, -0.8494063, -2.342516, 0, 0, 0, 1, 1,
-1.360731, 2.880454, -0.5991927, 0, 0, 0, 1, 1,
-1.358269, 0.7419896, -2.204005, 0, 0, 0, 1, 1,
-1.355839, 0.5180269, -2.325998, 0, 0, 0, 1, 1,
-1.354362, 1.751669, -1.735081, 0, 0, 0, 1, 1,
-1.348543, -0.3703057, -3.024063, 1, 1, 1, 1, 1,
-1.343489, -0.6346657, -3.577705, 1, 1, 1, 1, 1,
-1.342087, 0.01037329, -2.420326, 1, 1, 1, 1, 1,
-1.337845, 0.07286453, -2.696381, 1, 1, 1, 1, 1,
-1.33621, -3.702879, -2.737381, 1, 1, 1, 1, 1,
-1.335488, -0.1980686, -0.106016, 1, 1, 1, 1, 1,
-1.32349, 1.522604, -0.2093617, 1, 1, 1, 1, 1,
-1.321286, 0.08412917, -0.6891791, 1, 1, 1, 1, 1,
-1.319862, 0.5593601, -0.4247421, 1, 1, 1, 1, 1,
-1.319095, 0.09122504, -2.597439, 1, 1, 1, 1, 1,
-1.318311, -0.8544609, -2.241227, 1, 1, 1, 1, 1,
-1.313637, -0.4140667, -2.142731, 1, 1, 1, 1, 1,
-1.312237, 0.2732634, -0.3532101, 1, 1, 1, 1, 1,
-1.306451, -0.1843416, 1.098226, 1, 1, 1, 1, 1,
-1.305064, 0.3144591, -2.822534, 1, 1, 1, 1, 1,
-1.298577, -1.699292, -3.918012, 0, 0, 1, 1, 1,
-1.294637, -1.139814, -1.753525, 1, 0, 0, 1, 1,
-1.283642, 0.05458608, -2.517552, 1, 0, 0, 1, 1,
-1.27028, -0.8655525, -2.187577, 1, 0, 0, 1, 1,
-1.262993, 1.419911, -0.8034063, 1, 0, 0, 1, 1,
-1.252883, -0.6388296, -0.3600522, 1, 0, 0, 1, 1,
-1.249292, 1.434917, -1.336983, 0, 0, 0, 1, 1,
-1.247389, 1.081979, -0.8873523, 0, 0, 0, 1, 1,
-1.244859, 0.6450821, -0.9295149, 0, 0, 0, 1, 1,
-1.244641, -0.988538, 0.1089983, 0, 0, 0, 1, 1,
-1.244461, 0.5236888, -0.8703095, 0, 0, 0, 1, 1,
-1.233688, -0.8301195, -0.959989, 0, 0, 0, 1, 1,
-1.226169, -0.2459896, -3.130573, 0, 0, 0, 1, 1,
-1.225376, 0.8214794, -1.145042, 1, 1, 1, 1, 1,
-1.224509, 0.5210481, 0.2657159, 1, 1, 1, 1, 1,
-1.221458, 2.184971, -1.205072, 1, 1, 1, 1, 1,
-1.215395, 0.09601981, -2.093171, 1, 1, 1, 1, 1,
-1.212784, -0.6319716, -0.8215595, 1, 1, 1, 1, 1,
-1.211643, -1.686158, -3.796388, 1, 1, 1, 1, 1,
-1.207955, 1.881101, 0.2111872, 1, 1, 1, 1, 1,
-1.206677, -0.4011107, -1.467494, 1, 1, 1, 1, 1,
-1.186539, -0.4787861, -1.375185, 1, 1, 1, 1, 1,
-1.185079, -0.577321, -0.9862881, 1, 1, 1, 1, 1,
-1.184354, 0.6283398, -0.3280822, 1, 1, 1, 1, 1,
-1.174694, -0.4254426, -1.25142, 1, 1, 1, 1, 1,
-1.172817, -0.3222251, -1.480301, 1, 1, 1, 1, 1,
-1.170084, 0.5950704, -2.155093, 1, 1, 1, 1, 1,
-1.161834, -0.1744265, -0.6884617, 1, 1, 1, 1, 1,
-1.15517, -0.9461009, -2.70247, 0, 0, 1, 1, 1,
-1.149336, 0.1408269, -2.516934, 1, 0, 0, 1, 1,
-1.146589, -1.225878, -3.905726, 1, 0, 0, 1, 1,
-1.136901, 0.5695226, 1.616652, 1, 0, 0, 1, 1,
-1.134576, 0.9357111, 0.9169818, 1, 0, 0, 1, 1,
-1.134331, -0.1965852, -1.166664, 1, 0, 0, 1, 1,
-1.129845, 0.4697888, -1.886608, 0, 0, 0, 1, 1,
-1.128081, -0.3920147, -1.764508, 0, 0, 0, 1, 1,
-1.125577, 0.8981825, -0.4942073, 0, 0, 0, 1, 1,
-1.119067, 1.290405, 1.555339, 0, 0, 0, 1, 1,
-1.118485, -0.160419, -2.660755, 0, 0, 0, 1, 1,
-1.116724, -1.338274, -3.2957, 0, 0, 0, 1, 1,
-1.113504, -0.2921494, -1.893964, 0, 0, 0, 1, 1,
-1.105462, -0.3543036, -1.415349, 1, 1, 1, 1, 1,
-1.103646, -1.47043, -3.775161, 1, 1, 1, 1, 1,
-1.100531, -0.08736412, 0.8010657, 1, 1, 1, 1, 1,
-1.098161, 0.1246824, -1.44727, 1, 1, 1, 1, 1,
-1.097387, -0.7174165, -1.197701, 1, 1, 1, 1, 1,
-1.096254, 0.1356288, -1.407485, 1, 1, 1, 1, 1,
-1.095203, -0.0764675, -0.6989913, 1, 1, 1, 1, 1,
-1.092231, -0.9855838, -2.514877, 1, 1, 1, 1, 1,
-1.090319, -0.4747339, -0.5007548, 1, 1, 1, 1, 1,
-1.087382, 0.2713593, 0.6811578, 1, 1, 1, 1, 1,
-1.085329, 0.2307475, 0.3813157, 1, 1, 1, 1, 1,
-1.079953, -0.3591209, 0.2298228, 1, 1, 1, 1, 1,
-1.072317, -1.732358, -2.646102, 1, 1, 1, 1, 1,
-1.065504, 0.1771932, -2.378677, 1, 1, 1, 1, 1,
-1.058031, 0.3671964, -2.266173, 1, 1, 1, 1, 1,
-1.054242, -1.66398, -1.906116, 0, 0, 1, 1, 1,
-1.034565, -0.5520338, -1.649704, 1, 0, 0, 1, 1,
-1.034489, 0.2102256, -2.284681, 1, 0, 0, 1, 1,
-1.031854, -1.336135, -1.859354, 1, 0, 0, 1, 1,
-1.026296, 0.2123134, -1.373787, 1, 0, 0, 1, 1,
-1.019928, 0.5547122, -0.7228038, 1, 0, 0, 1, 1,
-1.015972, -1.221689, -1.653352, 0, 0, 0, 1, 1,
-1.014246, -0.8087821, -2.33553, 0, 0, 0, 1, 1,
-1.004425, 0.3396143, 0.1411129, 0, 0, 0, 1, 1,
-1.000151, -1.444467, -2.673471, 0, 0, 0, 1, 1,
-0.9948239, -0.002225074, -0.5788939, 0, 0, 0, 1, 1,
-0.9929439, 1.447903, -1.581342, 0, 0, 0, 1, 1,
-0.992586, -0.6280456, -4.481036, 0, 0, 0, 1, 1,
-0.9754887, 0.1216919, -0.6247512, 1, 1, 1, 1, 1,
-0.9679999, -0.8119854, -2.634954, 1, 1, 1, 1, 1,
-0.9659509, 0.2994239, -1.258305, 1, 1, 1, 1, 1,
-0.961894, 2.287776, -0.570479, 1, 1, 1, 1, 1,
-0.9472162, -0.04534807, -1.793238, 1, 1, 1, 1, 1,
-0.9415475, 0.7156304, -0.1701283, 1, 1, 1, 1, 1,
-0.9396572, -0.7535164, -2.444103, 1, 1, 1, 1, 1,
-0.9366822, -0.2748634, -1.165159, 1, 1, 1, 1, 1,
-0.9330013, 0.5008656, -1.445784, 1, 1, 1, 1, 1,
-0.9277908, -0.3801265, -2.46661, 1, 1, 1, 1, 1,
-0.927253, 0.3376962, -0.03701901, 1, 1, 1, 1, 1,
-0.9258428, 0.5812123, 0.30464, 1, 1, 1, 1, 1,
-0.9185722, 0.4720706, -0.4635933, 1, 1, 1, 1, 1,
-0.9177878, 0.2015544, -2.208153, 1, 1, 1, 1, 1,
-0.9143063, -0.1492824, -2.368936, 1, 1, 1, 1, 1,
-0.913117, -0.1666259, -1.201768, 0, 0, 1, 1, 1,
-0.9108428, -0.1409764, -1.098918, 1, 0, 0, 1, 1,
-0.9103733, 0.4624833, -1.501035, 1, 0, 0, 1, 1,
-0.9098701, 1.028675, 0.2866577, 1, 0, 0, 1, 1,
-0.9030416, 2.938317, -1.307107, 1, 0, 0, 1, 1,
-0.8969333, 2.491691, -0.3724742, 1, 0, 0, 1, 1,
-0.8953325, 1.086216, -1.146738, 0, 0, 0, 1, 1,
-0.8935127, -0.03115152, -1.587707, 0, 0, 0, 1, 1,
-0.888097, -0.5032431, -1.916306, 0, 0, 0, 1, 1,
-0.882691, 0.158915, -2.173124, 0, 0, 0, 1, 1,
-0.8815567, 0.9876841, -1.502203, 0, 0, 0, 1, 1,
-0.8735042, -0.1216033, -0.06480393, 0, 0, 0, 1, 1,
-0.8694108, -0.9298188, -4.001617, 0, 0, 0, 1, 1,
-0.8692393, -0.5096861, -0.4487176, 1, 1, 1, 1, 1,
-0.866356, 1.00228, 0.003779144, 1, 1, 1, 1, 1,
-0.8652384, -0.272859, -2.410823, 1, 1, 1, 1, 1,
-0.8555021, -0.142616, -3.318312, 1, 1, 1, 1, 1,
-0.8518721, -0.6050843, -2.585012, 1, 1, 1, 1, 1,
-0.8501267, 0.8612544, -0.02971989, 1, 1, 1, 1, 1,
-0.8491501, 1.207491, -1.24689, 1, 1, 1, 1, 1,
-0.8474599, -0.1188215, -4.038406, 1, 1, 1, 1, 1,
-0.8351582, -0.7525685, -2.05543, 1, 1, 1, 1, 1,
-0.8349695, 0.2940722, -2.210246, 1, 1, 1, 1, 1,
-0.8200179, 2.067677, 0.8698831, 1, 1, 1, 1, 1,
-0.8181354, 1.429825, -1.279942, 1, 1, 1, 1, 1,
-0.8168533, 1.56087, -2.134617, 1, 1, 1, 1, 1,
-0.8135542, 0.5376185, -1.106817, 1, 1, 1, 1, 1,
-0.8027775, -0.6880857, -2.811282, 1, 1, 1, 1, 1,
-0.8002058, 0.1235, -1.181236, 0, 0, 1, 1, 1,
-0.795063, -1.220924, -2.917168, 1, 0, 0, 1, 1,
-0.7913489, 0.6041518, 0.4082221, 1, 0, 0, 1, 1,
-0.7909369, 0.3409579, -1.300587, 1, 0, 0, 1, 1,
-0.7903581, -1.148367, -2.157909, 1, 0, 0, 1, 1,
-0.7808123, 1.130756, -0.864206, 1, 0, 0, 1, 1,
-0.774196, -1.838866, -4.287665, 0, 0, 0, 1, 1,
-0.7690253, 0.7112659, -0.8599053, 0, 0, 0, 1, 1,
-0.7654285, -0.1905768, -0.4335676, 0, 0, 0, 1, 1,
-0.7533316, -0.6450335, -3.500773, 0, 0, 0, 1, 1,
-0.7531918, -0.1261152, -2.423952, 0, 0, 0, 1, 1,
-0.7521657, -0.6366118, -3.026998, 0, 0, 0, 1, 1,
-0.7457305, 0.698348, -0.209808, 0, 0, 0, 1, 1,
-0.7450345, -0.2425773, -1.135535, 1, 1, 1, 1, 1,
-0.7411326, -0.7578888, -2.142156, 1, 1, 1, 1, 1,
-0.7366478, 0.6596438, 1.412734, 1, 1, 1, 1, 1,
-0.7363373, -0.2154357, -3.030581, 1, 1, 1, 1, 1,
-0.735672, -0.9964322, -1.847587, 1, 1, 1, 1, 1,
-0.7284799, 0.01808286, -1.907084, 1, 1, 1, 1, 1,
-0.7274512, -0.05357701, -2.273376, 1, 1, 1, 1, 1,
-0.7250915, 2.363501, 0.5904254, 1, 1, 1, 1, 1,
-0.723749, 1.787314, -0.5847936, 1, 1, 1, 1, 1,
-0.7227549, -0.3361575, -1.285406, 1, 1, 1, 1, 1,
-0.7222412, -0.08407651, -0.8244408, 1, 1, 1, 1, 1,
-0.7217152, -1.429678, -3.247219, 1, 1, 1, 1, 1,
-0.7174103, 0.9327334, -2.514702, 1, 1, 1, 1, 1,
-0.7170992, -1.22381, -2.147426, 1, 1, 1, 1, 1,
-0.7063521, -0.5169828, -2.930857, 1, 1, 1, 1, 1,
-0.7055862, 1.37001, 0.1863379, 0, 0, 1, 1, 1,
-0.7021734, 0.3548754, -0.8721182, 1, 0, 0, 1, 1,
-0.7015579, -1.563062, -1.345678, 1, 0, 0, 1, 1,
-0.6998312, 0.009477891, -2.477763, 1, 0, 0, 1, 1,
-0.6975414, -0.7043926, -2.814857, 1, 0, 0, 1, 1,
-0.6974275, -1.824878, -0.1721574, 1, 0, 0, 1, 1,
-0.6947086, 0.05595934, -0.8904287, 0, 0, 0, 1, 1,
-0.6885272, -1.444878, -3.749857, 0, 0, 0, 1, 1,
-0.6875891, 0.01427581, -1.636641, 0, 0, 0, 1, 1,
-0.6851637, 0.03120553, -2.73447, 0, 0, 0, 1, 1,
-0.6688393, 0.97308, 0.4696158, 0, 0, 0, 1, 1,
-0.6674582, -1.208373, -0.7419897, 0, 0, 0, 1, 1,
-0.6641696, 0.9417385, -0.1214708, 0, 0, 0, 1, 1,
-0.6619606, -0.131135, -1.304706, 1, 1, 1, 1, 1,
-0.6543008, -0.1476841, 0.1654541, 1, 1, 1, 1, 1,
-0.6452838, -0.09295554, -2.875275, 1, 1, 1, 1, 1,
-0.637543, 0.01391794, -0.178464, 1, 1, 1, 1, 1,
-0.6245383, 0.8877593, -2.110645, 1, 1, 1, 1, 1,
-0.6199784, -0.3679406, -0.1317443, 1, 1, 1, 1, 1,
-0.6163644, -0.2547127, -1.582203, 1, 1, 1, 1, 1,
-0.6145026, -0.02348094, -1.703012, 1, 1, 1, 1, 1,
-0.6076288, 1.482366, -2.340318, 1, 1, 1, 1, 1,
-0.6052942, 0.1378102, -1.310905, 1, 1, 1, 1, 1,
-0.6046959, 0.03541084, -0.9779382, 1, 1, 1, 1, 1,
-0.6022847, 0.1704885, -0.8362634, 1, 1, 1, 1, 1,
-0.5983313, -0.6101687, -2.827438, 1, 1, 1, 1, 1,
-0.5941926, -1.248945, -3.647444, 1, 1, 1, 1, 1,
-0.5939206, -0.5785301, -2.27036, 1, 1, 1, 1, 1,
-0.5918441, 0.3510119, -0.01977522, 0, 0, 1, 1, 1,
-0.5843536, -0.3457008, -0.9852554, 1, 0, 0, 1, 1,
-0.5776064, -1.0612, -4.551191, 1, 0, 0, 1, 1,
-0.5745253, 2.051761, -0.9406716, 1, 0, 0, 1, 1,
-0.5741769, 0.3142323, -2.367599, 1, 0, 0, 1, 1,
-0.5732983, 1.683043, 0.452727, 1, 0, 0, 1, 1,
-0.5730649, -0.2172945, -2.023605, 0, 0, 0, 1, 1,
-0.5712793, -0.6152093, -1.81546, 0, 0, 0, 1, 1,
-0.5692618, -0.386582, -3.694267, 0, 0, 0, 1, 1,
-0.565349, 0.2150153, -1.403113, 0, 0, 0, 1, 1,
-0.5647724, 0.7193553, -0.570832, 0, 0, 0, 1, 1,
-0.5595202, -0.3598233, -1.599169, 0, 0, 0, 1, 1,
-0.5587407, -0.9695387, -2.932058, 0, 0, 0, 1, 1,
-0.558325, 1.587162, -1.635034, 1, 1, 1, 1, 1,
-0.5579262, -0.3110143, -1.368925, 1, 1, 1, 1, 1,
-0.55114, 0.428212, -0.7203797, 1, 1, 1, 1, 1,
-0.5486128, 1.069345, -0.4531846, 1, 1, 1, 1, 1,
-0.5427339, -0.7320961, -4.082115, 1, 1, 1, 1, 1,
-0.5420936, 0.1798595, -1.591395, 1, 1, 1, 1, 1,
-0.5405375, 0.5616689, -4.135961, 1, 1, 1, 1, 1,
-0.5340488, -0.2359363, -3.044386, 1, 1, 1, 1, 1,
-0.5317619, -0.6201899, -2.049639, 1, 1, 1, 1, 1,
-0.527158, -1.715664, -1.698203, 1, 1, 1, 1, 1,
-0.525227, 0.4969902, -0.7109092, 1, 1, 1, 1, 1,
-0.5238281, 2.147436, 0.7212428, 1, 1, 1, 1, 1,
-0.5225697, -0.2037877, -2.917958, 1, 1, 1, 1, 1,
-0.5223024, 0.9899951, -0.06753813, 1, 1, 1, 1, 1,
-0.516823, -0.1598163, -1.68149, 1, 1, 1, 1, 1,
-0.5144004, 0.3225546, -1.643409, 0, 0, 1, 1, 1,
-0.513481, 0.227694, -2.703207, 1, 0, 0, 1, 1,
-0.5120065, 2.13529, -0.4419312, 1, 0, 0, 1, 1,
-0.5090365, -0.513634, -1.229489, 1, 0, 0, 1, 1,
-0.5064522, 0.563278, 0.4616416, 1, 0, 0, 1, 1,
-0.504287, 2.112668, 0.8181093, 1, 0, 0, 1, 1,
-0.4926677, -0.3331199, -2.027948, 0, 0, 0, 1, 1,
-0.4892508, 1.505681, 2.740504, 0, 0, 0, 1, 1,
-0.4814111, -2.127187, -2.465195, 0, 0, 0, 1, 1,
-0.4814093, 0.360492, -1.672226, 0, 0, 0, 1, 1,
-0.4806666, 0.3819525, 0.146881, 0, 0, 0, 1, 1,
-0.4800186, -0.06731331, -0.08666328, 0, 0, 0, 1, 1,
-0.4728684, -0.5887748, -1.49606, 0, 0, 0, 1, 1,
-0.4722093, -0.8259931, -4.059618, 1, 1, 1, 1, 1,
-0.4717637, -1.076271, -2.453876, 1, 1, 1, 1, 1,
-0.471615, -0.1875495, -0.8247335, 1, 1, 1, 1, 1,
-0.4703536, -0.7116603, -2.115305, 1, 1, 1, 1, 1,
-0.4677846, -1.309868, -2.008787, 1, 1, 1, 1, 1,
-0.4666499, 1.210657, -0.8821335, 1, 1, 1, 1, 1,
-0.4657366, 0.6394972, -1.230752, 1, 1, 1, 1, 1,
-0.4652587, 1.065717, 0.09160854, 1, 1, 1, 1, 1,
-0.4635223, -0.004090178, -1.327843, 1, 1, 1, 1, 1,
-0.4611946, 0.159192, -2.465237, 1, 1, 1, 1, 1,
-0.4560242, 1.294659, -0.1713334, 1, 1, 1, 1, 1,
-0.4541483, 1.081767, 0.1675918, 1, 1, 1, 1, 1,
-0.4539014, 1.049953, -0.4847444, 1, 1, 1, 1, 1,
-0.4509251, -0.8597516, -3.268954, 1, 1, 1, 1, 1,
-0.4505009, -0.7452326, -2.348876, 1, 1, 1, 1, 1,
-0.4503217, -2.428843, -3.093583, 0, 0, 1, 1, 1,
-0.4402064, 0.04603941, 0.1882229, 1, 0, 0, 1, 1,
-0.4400809, -0.8854192, -2.507298, 1, 0, 0, 1, 1,
-0.4389058, -0.2165357, -3.265694, 1, 0, 0, 1, 1,
-0.4382588, -0.9143229, -2.113322, 1, 0, 0, 1, 1,
-0.4380824, -2.336598, -1.2068, 1, 0, 0, 1, 1,
-0.4350755, -1.327373, -3.135033, 0, 0, 0, 1, 1,
-0.4333042, 1.21607, 0.3213657, 0, 0, 0, 1, 1,
-0.4332954, 2.49698, -1.116701, 0, 0, 0, 1, 1,
-0.4329479, -0.4516816, -2.326315, 0, 0, 0, 1, 1,
-0.432555, 0.09470721, -0.7174779, 0, 0, 0, 1, 1,
-0.4323104, 0.1510852, -1.060497, 0, 0, 0, 1, 1,
-0.4311103, 0.8534271, -1.00577, 0, 0, 0, 1, 1,
-0.4277804, -1.478915, -2.405577, 1, 1, 1, 1, 1,
-0.4264009, 0.3631017, -2.754866, 1, 1, 1, 1, 1,
-0.4225141, 0.5445616, -1.349841, 1, 1, 1, 1, 1,
-0.4219333, 0.4476505, 0.1793943, 1, 1, 1, 1, 1,
-0.4219142, -2.347983, -1.424405, 1, 1, 1, 1, 1,
-0.4183728, 0.5302197, -0.3950236, 1, 1, 1, 1, 1,
-0.4137301, 0.2613971, -1.481847, 1, 1, 1, 1, 1,
-0.4087178, -0.05169475, -2.346108, 1, 1, 1, 1, 1,
-0.4069342, -0.6418219, -1.049221, 1, 1, 1, 1, 1,
-0.4068908, -0.7541285, -2.394703, 1, 1, 1, 1, 1,
-0.4027333, 0.3745927, -1.30545, 1, 1, 1, 1, 1,
-0.4026042, -0.4951223, -1.556199, 1, 1, 1, 1, 1,
-0.4006135, -0.8221073, -2.423982, 1, 1, 1, 1, 1,
-0.3986078, -1.094226, -3.121621, 1, 1, 1, 1, 1,
-0.397393, -0.1343563, -0.7617728, 1, 1, 1, 1, 1,
-0.397255, -0.8250792, -2.01035, 0, 0, 1, 1, 1,
-0.3951002, -1.92024, -2.142928, 1, 0, 0, 1, 1,
-0.3879665, 0.3122256, -1.040222, 1, 0, 0, 1, 1,
-0.3793711, 1.570764, 1.168263, 1, 0, 0, 1, 1,
-0.3776691, -1.572264, -3.472235, 1, 0, 0, 1, 1,
-0.3730325, -0.8977343, -2.598954, 1, 0, 0, 1, 1,
-0.3700808, 3.105656, -1.140294, 0, 0, 0, 1, 1,
-0.370079, -0.1636075, -0.4939551, 0, 0, 0, 1, 1,
-0.3664248, -1.660152, -2.842132, 0, 0, 0, 1, 1,
-0.3646359, 0.9757137, -1.474437, 0, 0, 0, 1, 1,
-0.3601309, 0.2661102, -1.870511, 0, 0, 0, 1, 1,
-0.3591934, 0.2904466, -0.1571977, 0, 0, 0, 1, 1,
-0.3541908, 0.06237711, -0.365711, 0, 0, 0, 1, 1,
-0.3538654, -0.4796624, -2.69955, 1, 1, 1, 1, 1,
-0.3534153, 0.8688844, -0.8563163, 1, 1, 1, 1, 1,
-0.3480804, -0.6278245, -0.5782348, 1, 1, 1, 1, 1,
-0.3420253, 1.020686, -0.6905664, 1, 1, 1, 1, 1,
-0.3376371, -2.330782, -2.75358, 1, 1, 1, 1, 1,
-0.3342438, -0.9434435, -1.868882, 1, 1, 1, 1, 1,
-0.3310924, -0.09952356, -3.344241, 1, 1, 1, 1, 1,
-0.3243922, 0.5978925, 2.021442, 1, 1, 1, 1, 1,
-0.3224353, -1.686108, -3.218777, 1, 1, 1, 1, 1,
-0.3174908, -0.3379811, -3.255403, 1, 1, 1, 1, 1,
-0.315602, -0.02003382, -1.386494, 1, 1, 1, 1, 1,
-0.3127299, 0.4814173, 0.2708998, 1, 1, 1, 1, 1,
-0.3123423, -0.06222245, -1.581184, 1, 1, 1, 1, 1,
-0.3114785, 0.6355728, -0.03058676, 1, 1, 1, 1, 1,
-0.3109565, -0.675492, -2.37124, 1, 1, 1, 1, 1,
-0.3103706, 0.12384, -0.1795197, 0, 0, 1, 1, 1,
-0.3085614, -1.000104, -3.24374, 1, 0, 0, 1, 1,
-0.3066883, -1.626115, -4.835295, 1, 0, 0, 1, 1,
-0.3061856, 1.066195, 1.054324, 1, 0, 0, 1, 1,
-0.2966581, 0.2314727, -0.5660821, 1, 0, 0, 1, 1,
-0.2959439, -0.9109935, -2.751011, 1, 0, 0, 1, 1,
-0.2933288, 1.01845, -0.3301792, 0, 0, 0, 1, 1,
-0.2893746, 0.3645401, -0.159532, 0, 0, 0, 1, 1,
-0.2876949, -1.25628, -1.834072, 0, 0, 0, 1, 1,
-0.2849476, -0.6765897, -2.199292, 0, 0, 0, 1, 1,
-0.2833389, -0.3102396, -2.747348, 0, 0, 0, 1, 1,
-0.2810062, -0.7676924, -2.012664, 0, 0, 0, 1, 1,
-0.2807455, 0.4793889, -1.606511, 0, 0, 0, 1, 1,
-0.27511, -0.3134222, -4.586562, 1, 1, 1, 1, 1,
-0.2692384, -2.030269, -3.490266, 1, 1, 1, 1, 1,
-0.2657697, -0.7060016, -3.119713, 1, 1, 1, 1, 1,
-0.2655947, 1.285267, -0.08689408, 1, 1, 1, 1, 1,
-0.2630198, -0.4324448, -4.131985, 1, 1, 1, 1, 1,
-0.2593771, 0.08713914, -1.478587, 1, 1, 1, 1, 1,
-0.2555517, -0.998184, -2.392689, 1, 1, 1, 1, 1,
-0.2543445, -0.5365558, -3.783942, 1, 1, 1, 1, 1,
-0.2529149, -0.929976, -2.827237, 1, 1, 1, 1, 1,
-0.2512223, 0.8021959, -0.5752434, 1, 1, 1, 1, 1,
-0.2498, 1.335243, 1.540695, 1, 1, 1, 1, 1,
-0.2457731, -0.8641211, -1.516453, 1, 1, 1, 1, 1,
-0.2442309, -1.834514, -1.195207, 1, 1, 1, 1, 1,
-0.2438266, 2.078523, 1.609825, 1, 1, 1, 1, 1,
-0.2381147, -1.627389, -3.135796, 1, 1, 1, 1, 1,
-0.236256, 0.4947072, 1.987114, 0, 0, 1, 1, 1,
-0.2340275, 0.9437517, -0.3401192, 1, 0, 0, 1, 1,
-0.2275186, 0.1865532, -0.3430925, 1, 0, 0, 1, 1,
-0.226224, -0.5295599, -1.74707, 1, 0, 0, 1, 1,
-0.2226683, 1.390287, 0.8109064, 1, 0, 0, 1, 1,
-0.2214202, 0.4299762, -0.3498507, 1, 0, 0, 1, 1,
-0.2197078, 0.4964873, 0.2468398, 0, 0, 0, 1, 1,
-0.2187993, 0.43927, 0.9469686, 0, 0, 0, 1, 1,
-0.2168756, -0.3451223, -2.906136, 0, 0, 0, 1, 1,
-0.2162722, -0.4380488, -2.101774, 0, 0, 0, 1, 1,
-0.2126218, 1.089163, 0.1165694, 0, 0, 0, 1, 1,
-0.2100441, 0.3501149, -0.7849824, 0, 0, 0, 1, 1,
-0.2064928, 0.4301071, 0.3112614, 0, 0, 0, 1, 1,
-0.2030472, 0.3086786, -1.612648, 1, 1, 1, 1, 1,
-0.2023609, -0.864586, -2.518296, 1, 1, 1, 1, 1,
-0.1976663, 0.1382633, -1.280924, 1, 1, 1, 1, 1,
-0.1928992, 1.44833, -0.4615957, 1, 1, 1, 1, 1,
-0.1899396, 0.6518407, -1.645745, 1, 1, 1, 1, 1,
-0.1871515, 1.676965, -0.6050562, 1, 1, 1, 1, 1,
-0.1863724, 0.7445467, 0.4691601, 1, 1, 1, 1, 1,
-0.1857197, 0.5258488, 0.07440283, 1, 1, 1, 1, 1,
-0.179615, 1.899418, 0.601249, 1, 1, 1, 1, 1,
-0.1788556, -1.347006, -1.288172, 1, 1, 1, 1, 1,
-0.1733901, 0.4310167, -0.01830688, 1, 1, 1, 1, 1,
-0.1727557, -0.5878422, -3.60891, 1, 1, 1, 1, 1,
-0.1698408, 1.061372, 1.934428, 1, 1, 1, 1, 1,
-0.1690771, -1.627066, -3.991928, 1, 1, 1, 1, 1,
-0.1672972, 0.6052073, -1.009488, 1, 1, 1, 1, 1,
-0.1644132, -1.014845, -2.262865, 0, 0, 1, 1, 1,
-0.1642442, 0.807152, -0.711607, 1, 0, 0, 1, 1,
-0.1600938, 0.2663755, -0.3468298, 1, 0, 0, 1, 1,
-0.1557062, 0.103387, -1.678639, 1, 0, 0, 1, 1,
-0.1547139, -0.3919555, -3.847408, 1, 0, 0, 1, 1,
-0.153175, -1.176207, -2.035986, 1, 0, 0, 1, 1,
-0.1524995, -0.9244233, -3.312617, 0, 0, 0, 1, 1,
-0.150683, -0.9877039, -3.038162, 0, 0, 0, 1, 1,
-0.1498597, -1.726962, -3.099636, 0, 0, 0, 1, 1,
-0.1471353, 0.8343858, 1.902937, 0, 0, 0, 1, 1,
-0.143593, 0.5422943, -0.2980855, 0, 0, 0, 1, 1,
-0.1404367, 0.5258912, -1.390674, 0, 0, 0, 1, 1,
-0.1396943, -0.8098343, -2.696835, 0, 0, 0, 1, 1,
-0.1382858, 0.1982426, 0.129697, 1, 1, 1, 1, 1,
-0.1376968, 0.6163626, 1.226103, 1, 1, 1, 1, 1,
-0.1366807, -0.9353411, -2.265079, 1, 1, 1, 1, 1,
-0.1346299, 0.9576575, 0.1385258, 1, 1, 1, 1, 1,
-0.1328112, -0.2941158, -3.600106, 1, 1, 1, 1, 1,
-0.1327841, 1.011448, -0.4239425, 1, 1, 1, 1, 1,
-0.1267827, 1.00286, -0.4329759, 1, 1, 1, 1, 1,
-0.1230367, 0.958023, 0.7897226, 1, 1, 1, 1, 1,
-0.1191927, -0.925628, -2.681161, 1, 1, 1, 1, 1,
-0.1174206, 1.064277, -1.278111, 1, 1, 1, 1, 1,
-0.1165056, -2.15507, -3.612957, 1, 1, 1, 1, 1,
-0.1158159, -0.2216843, -1.251473, 1, 1, 1, 1, 1,
-0.1049159, -1.532501, -2.200059, 1, 1, 1, 1, 1,
-0.1032089, -0.1984116, -3.471657, 1, 1, 1, 1, 1,
-0.09771962, -0.5077726, -2.829613, 1, 1, 1, 1, 1,
-0.09613562, 0.5130438, -0.4877435, 0, 0, 1, 1, 1,
-0.0942331, 0.08147515, 1.670802, 1, 0, 0, 1, 1,
-0.0937475, -0.8310381, -4.121057, 1, 0, 0, 1, 1,
-0.08182684, -1.687057, -2.978017, 1, 0, 0, 1, 1,
-0.07817819, -0.8051824, -2.833807, 1, 0, 0, 1, 1,
-0.0775542, 1.552695, 1.121835, 1, 0, 0, 1, 1,
-0.07404816, 0.5905129, 1.411356, 0, 0, 0, 1, 1,
-0.07330461, -0.3843016, -1.968741, 0, 0, 0, 1, 1,
-0.06849702, 0.2405676, -0.4097482, 0, 0, 0, 1, 1,
-0.06796279, 0.591538, -0.2255263, 0, 0, 0, 1, 1,
-0.06471667, 1.295064, -0.7845162, 0, 0, 0, 1, 1,
-0.06397087, 1.789115, 0.1631837, 0, 0, 0, 1, 1,
-0.05889839, 0.2940782, -0.9117359, 0, 0, 0, 1, 1,
-0.05538647, -0.4339571, -3.077313, 1, 1, 1, 1, 1,
-0.05396651, -0.003059185, -1.418635, 1, 1, 1, 1, 1,
-0.05306206, -0.1473844, -3.930285, 1, 1, 1, 1, 1,
-0.05299167, -2.062271, -2.614587, 1, 1, 1, 1, 1,
-0.05195509, -0.522991, -2.258508, 1, 1, 1, 1, 1,
-0.05068786, -0.2207826, -2.067906, 1, 1, 1, 1, 1,
-0.04260331, 0.1777298, 0.08905562, 1, 1, 1, 1, 1,
-0.04245589, 0.6104722, 0.1745709, 1, 1, 1, 1, 1,
-0.04143573, -1.353188, -2.727379, 1, 1, 1, 1, 1,
-0.04126181, -1.635413, -2.559164, 1, 1, 1, 1, 1,
-0.0393712, 0.8390353, -1.908569, 1, 1, 1, 1, 1,
-0.03782403, -1.517407, -4.381987, 1, 1, 1, 1, 1,
-0.03593774, -0.855472, -3.435419, 1, 1, 1, 1, 1,
-0.03536545, -0.7895473, -3.213594, 1, 1, 1, 1, 1,
-0.03527979, 0.9044481, 2.037042, 1, 1, 1, 1, 1,
-0.03335616, -1.117536, -1.40528, 0, 0, 1, 1, 1,
-0.02729448, -0.6122799, -2.898117, 1, 0, 0, 1, 1,
-0.01898072, 1.904326, 0.9286864, 1, 0, 0, 1, 1,
-0.01769036, -0.7320988, -3.129946, 1, 0, 0, 1, 1,
-0.017215, -0.4622574, -2.690832, 1, 0, 0, 1, 1,
-0.01680451, -0.2232897, -2.009582, 1, 0, 0, 1, 1,
-0.01608782, -1.314276, -2.544788, 0, 0, 0, 1, 1,
-0.004304151, -0.4266964, -1.886267, 0, 0, 0, 1, 1,
-0.002610929, 1.11481, -0.8383065, 0, 0, 0, 1, 1,
0.002007205, -0.6325983, 2.438014, 0, 0, 0, 1, 1,
0.002652849, -0.9842306, 2.775919, 0, 0, 0, 1, 1,
0.003719374, -0.3048976, 3.164672, 0, 0, 0, 1, 1,
0.008060647, 0.483164, 0.5395865, 0, 0, 0, 1, 1,
0.008328057, -0.2834591, 2.822057, 1, 1, 1, 1, 1,
0.008434718, -0.07599604, 1.704459, 1, 1, 1, 1, 1,
0.008961444, 0.2790492, 0.4688195, 1, 1, 1, 1, 1,
0.01064819, 0.5967373, 0.3380133, 1, 1, 1, 1, 1,
0.01131592, 1.228317, 1.490302, 1, 1, 1, 1, 1,
0.01522255, 0.06395577, -1.495544, 1, 1, 1, 1, 1,
0.02448953, -0.07196998, 2.405635, 1, 1, 1, 1, 1,
0.02545648, -0.9810953, 3.124461, 1, 1, 1, 1, 1,
0.02548224, -0.2212173, 2.872397, 1, 1, 1, 1, 1,
0.02879812, -1.444785, 3.814473, 1, 1, 1, 1, 1,
0.02982395, -0.8237104, 2.321106, 1, 1, 1, 1, 1,
0.03077308, -0.03716437, 2.764737, 1, 1, 1, 1, 1,
0.03170425, -0.9368931, 3.375618, 1, 1, 1, 1, 1,
0.03326032, 1.140961, -0.7140532, 1, 1, 1, 1, 1,
0.03518268, 2.110615, 2.351254, 1, 1, 1, 1, 1,
0.03558017, -0.5417002, 5.498172, 0, 0, 1, 1, 1,
0.03635569, 0.02182324, 1.218882, 1, 0, 0, 1, 1,
0.03759914, 0.8386065, -0.7557839, 1, 0, 0, 1, 1,
0.03886133, -0.3511772, 3.703239, 1, 0, 0, 1, 1,
0.0406814, 0.5548635, 0.4339428, 1, 0, 0, 1, 1,
0.04348018, -0.115466, 4.586574, 1, 0, 0, 1, 1,
0.0442853, -0.01636078, 1.706254, 0, 0, 0, 1, 1,
0.04851082, 0.1516206, 0.05467271, 0, 0, 0, 1, 1,
0.0503209, -1.592976, 1.789115, 0, 0, 0, 1, 1,
0.05120488, 0.4338555, -1.130717, 0, 0, 0, 1, 1,
0.05214344, -0.1356315, 3.225145, 0, 0, 0, 1, 1,
0.05282789, 0.5252827, 0.7800607, 0, 0, 0, 1, 1,
0.05325033, -1.137496, 1.958421, 0, 0, 0, 1, 1,
0.05825236, 1.079524, -0.8839331, 1, 1, 1, 1, 1,
0.05851471, -0.6026501, 2.99893, 1, 1, 1, 1, 1,
0.07223712, 1.055373, 0.5170676, 1, 1, 1, 1, 1,
0.07229456, 0.8413199, 0.3382454, 1, 1, 1, 1, 1,
0.07383483, 0.4341428, 0.8359394, 1, 1, 1, 1, 1,
0.07514229, -0.399091, 1.088818, 1, 1, 1, 1, 1,
0.08004516, 0.6777564, 0.6620425, 1, 1, 1, 1, 1,
0.0839428, -0.2941054, 3.122118, 1, 1, 1, 1, 1,
0.08418618, -1.722659, 2.932136, 1, 1, 1, 1, 1,
0.08464783, -0.6532343, 4.563572, 1, 1, 1, 1, 1,
0.08545867, 0.9809665, 0.5062981, 1, 1, 1, 1, 1,
0.08569221, 0.4072104, -0.1570191, 1, 1, 1, 1, 1,
0.08667336, -0.6951604, 3.069912, 1, 1, 1, 1, 1,
0.08821431, -1.353773, 1.525955, 1, 1, 1, 1, 1,
0.09041694, -0.8445738, 4.537059, 1, 1, 1, 1, 1,
0.09359795, -1.123455, 2.771273, 0, 0, 1, 1, 1,
0.09653354, 1.044873, 1.017317, 1, 0, 0, 1, 1,
0.09797353, -0.4480057, 3.542129, 1, 0, 0, 1, 1,
0.09839255, 1.086865, 2.098239, 1, 0, 0, 1, 1,
0.1023246, -0.9810621, 4.086661, 1, 0, 0, 1, 1,
0.1064146, -0.1670687, 2.357584, 1, 0, 0, 1, 1,
0.1072861, 0.74018, 0.9340113, 0, 0, 0, 1, 1,
0.1101338, -0.0106036, 2.047678, 0, 0, 0, 1, 1,
0.1112611, -0.7793931, 3.075865, 0, 0, 0, 1, 1,
0.116877, -0.091301, 2.555964, 0, 0, 0, 1, 1,
0.1170892, -0.1809686, 2.683966, 0, 0, 0, 1, 1,
0.1235177, 1.711589, -0.4381497, 0, 0, 0, 1, 1,
0.1288212, -0.2139999, 4.350745, 0, 0, 0, 1, 1,
0.1290098, -0.2573038, 2.884345, 1, 1, 1, 1, 1,
0.1307177, 1.271946, -0.8896953, 1, 1, 1, 1, 1,
0.1315301, -2.064898, 1.990901, 1, 1, 1, 1, 1,
0.1323508, -1.830532, 1.866084, 1, 1, 1, 1, 1,
0.1375121, 1.627689, 1.328506, 1, 1, 1, 1, 1,
0.1378376, 1.249799, 0.06421562, 1, 1, 1, 1, 1,
0.140862, -1.650092, 2.787565, 1, 1, 1, 1, 1,
0.1409955, 0.7169208, 0.2964983, 1, 1, 1, 1, 1,
0.1413887, 0.3406015, 0.721171, 1, 1, 1, 1, 1,
0.1416575, -1.224226, 3.708787, 1, 1, 1, 1, 1,
0.1439006, 0.5617444, 0.08690462, 1, 1, 1, 1, 1,
0.1497131, 0.6787244, 0.8099952, 1, 1, 1, 1, 1,
0.1514731, -0.1729335, 2.693406, 1, 1, 1, 1, 1,
0.1616195, -0.2249833, 2.536767, 1, 1, 1, 1, 1,
0.1731768, 0.7026293, 0.8299999, 1, 1, 1, 1, 1,
0.1733103, -0.3022155, 3.250672, 0, 0, 1, 1, 1,
0.1775947, 1.013936, 2.696018, 1, 0, 0, 1, 1,
0.1782212, -0.3136279, 2.638672, 1, 0, 0, 1, 1,
0.1789779, -0.5333347, 6.443837, 1, 0, 0, 1, 1,
0.1825131, -1.518607, 3.684899, 1, 0, 0, 1, 1,
0.1825224, 2.141124, 0.1818546, 1, 0, 0, 1, 1,
0.1830013, 0.3542342, -1.116539, 0, 0, 0, 1, 1,
0.1852069, -1.120573, 3.284863, 0, 0, 0, 1, 1,
0.185656, -1.18691, 3.876822, 0, 0, 0, 1, 1,
0.1869939, 0.4592947, -0.3627883, 0, 0, 0, 1, 1,
0.1959597, -0.7040399, 4.752955, 0, 0, 0, 1, 1,
0.1975026, -0.04671119, 2.57669, 0, 0, 0, 1, 1,
0.1979545, -0.0746832, 0.9590912, 0, 0, 0, 1, 1,
0.1991714, 0.1327242, 1.412783, 1, 1, 1, 1, 1,
0.1993874, -0.4033591, 2.90009, 1, 1, 1, 1, 1,
0.2014688, 0.2529914, 1.220496, 1, 1, 1, 1, 1,
0.2032168, -0.2938108, 2.784176, 1, 1, 1, 1, 1,
0.2059952, 0.4618923, 0.1864626, 1, 1, 1, 1, 1,
0.2087017, -0.3315074, 3.577029, 1, 1, 1, 1, 1,
0.2094778, 0.3658957, 1.055261, 1, 1, 1, 1, 1,
0.210067, -1.09075, 3.512, 1, 1, 1, 1, 1,
0.2172992, 0.09283635, 1.473504, 1, 1, 1, 1, 1,
0.2182928, -0.5123028, 1.993932, 1, 1, 1, 1, 1,
0.220543, 0.2630316, 0.3914632, 1, 1, 1, 1, 1,
0.2242654, -0.773774, 3.861082, 1, 1, 1, 1, 1,
0.2266219, -0.7992835, 3.345448, 1, 1, 1, 1, 1,
0.2274165, -0.9824564, 2.904335, 1, 1, 1, 1, 1,
0.2284643, 0.3809514, -0.01503032, 1, 1, 1, 1, 1,
0.2308066, 0.1340982, 0.6336472, 0, 0, 1, 1, 1,
0.2324759, 0.07331929, -0.8888466, 1, 0, 0, 1, 1,
0.2337141, -0.7375239, 3.959958, 1, 0, 0, 1, 1,
0.2346134, -0.7940834, 1.281724, 1, 0, 0, 1, 1,
0.2351018, 0.2340044, -1.053742, 1, 0, 0, 1, 1,
0.2366401, -0.9955317, 1.986573, 1, 0, 0, 1, 1,
0.2406423, 1.434217, 0.5440717, 0, 0, 0, 1, 1,
0.2414959, 0.2381895, 0.3618151, 0, 0, 0, 1, 1,
0.2429913, -0.8649901, 3.215252, 0, 0, 0, 1, 1,
0.2434138, 0.3100337, 0.2006609, 0, 0, 0, 1, 1,
0.2436868, -1.020347, 2.144809, 0, 0, 0, 1, 1,
0.2497151, -0.7568495, 3.400603, 0, 0, 0, 1, 1,
0.2592683, 1.499358, 0.1520765, 0, 0, 0, 1, 1,
0.2641281, -0.7317221, 2.520082, 1, 1, 1, 1, 1,
0.2643361, -0.6672048, 3.349854, 1, 1, 1, 1, 1,
0.2659934, 0.4385583, 0.5472834, 1, 1, 1, 1, 1,
0.2706043, 0.3791263, -0.1010327, 1, 1, 1, 1, 1,
0.271127, 1.371876, -1.897754, 1, 1, 1, 1, 1,
0.2800893, 0.6651013, 0.2422851, 1, 1, 1, 1, 1,
0.2805008, -0.09900373, 3.265388, 1, 1, 1, 1, 1,
0.2891971, 0.8801802, 0.04581074, 1, 1, 1, 1, 1,
0.2908432, -0.6844084, 1.862247, 1, 1, 1, 1, 1,
0.2916727, -0.1482604, 2.532515, 1, 1, 1, 1, 1,
0.2959535, -1.141195, 0.58926, 1, 1, 1, 1, 1,
0.2995291, 0.2387028, 0.9138268, 1, 1, 1, 1, 1,
0.2995604, 0.3375597, -0.9534066, 1, 1, 1, 1, 1,
0.3005465, 0.8387688, 1.378662, 1, 1, 1, 1, 1,
0.302875, -1.081437, 3.241588, 1, 1, 1, 1, 1,
0.303599, -1.048399, 2.870439, 0, 0, 1, 1, 1,
0.3129613, 2.690629, 1.12305, 1, 0, 0, 1, 1,
0.3185236, 0.2876499, -0.3009249, 1, 0, 0, 1, 1,
0.3195154, 0.134192, 2.114658, 1, 0, 0, 1, 1,
0.3216357, -1.496968, 3.083252, 1, 0, 0, 1, 1,
0.3235768, 0.7399414, 0.2256863, 1, 0, 0, 1, 1,
0.3271853, 0.8018892, -0.3164646, 0, 0, 0, 1, 1,
0.3274749, 0.7013763, 0.5280188, 0, 0, 0, 1, 1,
0.329899, -0.7393708, 3.157808, 0, 0, 0, 1, 1,
0.3303334, 1.711976, 0.4191248, 0, 0, 0, 1, 1,
0.3325511, -0.7589673, 1.609496, 0, 0, 0, 1, 1,
0.3329686, -0.1394767, 2.878951, 0, 0, 0, 1, 1,
0.3339924, 0.299865, 0.2842153, 0, 0, 0, 1, 1,
0.3360179, -0.8807387, 3.150615, 1, 1, 1, 1, 1,
0.3364951, -1.328241, 2.418471, 1, 1, 1, 1, 1,
0.3374754, 1.685501, 0.1183753, 1, 1, 1, 1, 1,
0.3383371, -1.643836, 4.474345, 1, 1, 1, 1, 1,
0.3397314, -0.6849516, 2.38694, 1, 1, 1, 1, 1,
0.3399342, 0.551658, 1.18948, 1, 1, 1, 1, 1,
0.3552615, -1.89575, 2.849705, 1, 1, 1, 1, 1,
0.3644808, -0.3584287, 1.672075, 1, 1, 1, 1, 1,
0.3665283, 1.694248, 0.01854481, 1, 1, 1, 1, 1,
0.3692992, -0.05977853, 0.01404648, 1, 1, 1, 1, 1,
0.3704598, 1.139275, 0.5942611, 1, 1, 1, 1, 1,
0.3707883, -0.09146414, 1.177767, 1, 1, 1, 1, 1,
0.3758887, 0.2432829, 0.5447963, 1, 1, 1, 1, 1,
0.3761176, -0.2178963, 3.210859, 1, 1, 1, 1, 1,
0.3769201, -0.8049388, 1.786869, 1, 1, 1, 1, 1,
0.3792892, 0.8870713, -1.103553, 0, 0, 1, 1, 1,
0.3847852, 0.2053834, -0.2450223, 1, 0, 0, 1, 1,
0.385115, -0.3966131, 1.471996, 1, 0, 0, 1, 1,
0.3923038, -0.1750686, 1.655103, 1, 0, 0, 1, 1,
0.3923806, 0.1106049, 1.625674, 1, 0, 0, 1, 1,
0.3932045, 0.6279922, 0.8078861, 1, 0, 0, 1, 1,
0.3941616, -0.8362535, 1.660964, 0, 0, 0, 1, 1,
0.3979146, 1.167356, 0.4631103, 0, 0, 0, 1, 1,
0.4108778, -1.759945, 3.924511, 0, 0, 0, 1, 1,
0.4165169, 0.8227818, 2.220483, 0, 0, 0, 1, 1,
0.4177445, 1.554466, 0.01913154, 0, 0, 0, 1, 1,
0.4195454, 0.3985758, 1.152308, 0, 0, 0, 1, 1,
0.4212876, 0.7751706, 1.785586, 0, 0, 0, 1, 1,
0.4263231, 0.6936424, 0.8098635, 1, 1, 1, 1, 1,
0.436646, 0.06672236, 0.8896121, 1, 1, 1, 1, 1,
0.4369817, 0.4768262, 0.3085668, 1, 1, 1, 1, 1,
0.4396731, 0.8251063, 0.8965092, 1, 1, 1, 1, 1,
0.4567033, -0.09076314, 0.5485011, 1, 1, 1, 1, 1,
0.4584422, -2.412294, 4.51738, 1, 1, 1, 1, 1,
0.4663546, 2.48198, -0.5232751, 1, 1, 1, 1, 1,
0.4666824, -0.3682444, 2.114907, 1, 1, 1, 1, 1,
0.4685131, 0.7264518, -0.9826137, 1, 1, 1, 1, 1,
0.4688044, -1.622567, 1.043431, 1, 1, 1, 1, 1,
0.469667, -0.3215805, 1.431986, 1, 1, 1, 1, 1,
0.4699452, 1.409731, 1.683192, 1, 1, 1, 1, 1,
0.4705581, 0.7644744, 2.373284, 1, 1, 1, 1, 1,
0.4786251, -0.5812954, 2.248291, 1, 1, 1, 1, 1,
0.4816918, -1.124355, 3.101053, 1, 1, 1, 1, 1,
0.4940903, 0.8084032, -0.5660611, 0, 0, 1, 1, 1,
0.4955876, 0.2034289, 1.159443, 1, 0, 0, 1, 1,
0.4968742, -1.395005, 2.211362, 1, 0, 0, 1, 1,
0.5019564, 1.845082, -1.646916, 1, 0, 0, 1, 1,
0.5088153, 0.5906506, -0.699939, 1, 0, 0, 1, 1,
0.512958, -1.211423, 2.595268, 1, 0, 0, 1, 1,
0.5153279, 0.1248135, 1.695622, 0, 0, 0, 1, 1,
0.5167216, 0.2155157, 0.7508577, 0, 0, 0, 1, 1,
0.5188724, -1.497684, 2.734399, 0, 0, 0, 1, 1,
0.5237071, -0.7748119, 2.448346, 0, 0, 0, 1, 1,
0.5295705, 1.02182, 0.5612062, 0, 0, 0, 1, 1,
0.5302504, 2.006411, -0.5796413, 0, 0, 0, 1, 1,
0.5323073, -1.854072, 4.167379, 0, 0, 0, 1, 1,
0.5366073, 0.0636389, 2.741962, 1, 1, 1, 1, 1,
0.5379643, 2.212156, 1.183473, 1, 1, 1, 1, 1,
0.5443618, 0.1593047, 0.1992886, 1, 1, 1, 1, 1,
0.5457932, -0.6248145, 1.775929, 1, 1, 1, 1, 1,
0.5461414, -0.9226961, 2.353439, 1, 1, 1, 1, 1,
0.5461595, 0.09980458, 0.3959782, 1, 1, 1, 1, 1,
0.5466574, 1.612841, -1.587219, 1, 1, 1, 1, 1,
0.5551755, -1.463326, 3.763588, 1, 1, 1, 1, 1,
0.5573391, 0.02267427, 2.278254, 1, 1, 1, 1, 1,
0.575027, 0.6748359, -0.6003047, 1, 1, 1, 1, 1,
0.5779245, -2.065064, 2.754037, 1, 1, 1, 1, 1,
0.5864246, -0.3985826, 0.9568434, 1, 1, 1, 1, 1,
0.5888284, 0.826521, 0.8190511, 1, 1, 1, 1, 1,
0.5961231, -0.01791506, 0.02123552, 1, 1, 1, 1, 1,
0.5989233, -0.06508622, 2.28388, 1, 1, 1, 1, 1,
0.6020533, -0.4763882, 2.29569, 0, 0, 1, 1, 1,
0.6032991, -0.2201425, 0.6479267, 1, 0, 0, 1, 1,
0.6118314, -1.705851, 3.414331, 1, 0, 0, 1, 1,
0.6147365, -0.9551429, 2.150509, 1, 0, 0, 1, 1,
0.6162837, -0.8029011, 3.951546, 1, 0, 0, 1, 1,
0.6173385, -0.2028425, 1.538061, 1, 0, 0, 1, 1,
0.6196513, -0.46311, 1.146465, 0, 0, 0, 1, 1,
0.6241319, 0.4069736, 0.2483666, 0, 0, 0, 1, 1,
0.6260359, -0.6229706, 3.837476, 0, 0, 0, 1, 1,
0.6290932, 0.7981215, 2.224241, 0, 0, 0, 1, 1,
0.6328797, -1.182459, 2.342434, 0, 0, 0, 1, 1,
0.6392032, 1.336278, 0.6520742, 0, 0, 0, 1, 1,
0.6422986, 0.7003326, 2.276679, 0, 0, 0, 1, 1,
0.6435564, -0.995455, 2.298248, 1, 1, 1, 1, 1,
0.6449622, -0.899762, 3.7395, 1, 1, 1, 1, 1,
0.652549, -0.0729255, 0.3647483, 1, 1, 1, 1, 1,
0.6657543, -1.860748, 1.923361, 1, 1, 1, 1, 1,
0.6682788, 0.7351347, 1.259122, 1, 1, 1, 1, 1,
0.6701463, 1.085611, -1.843841, 1, 1, 1, 1, 1,
0.6704043, 1.472123, -1.385215, 1, 1, 1, 1, 1,
0.6716568, 0.5934169, 1.997918, 1, 1, 1, 1, 1,
0.6751758, 0.202085, 3.506472, 1, 1, 1, 1, 1,
0.675697, -0.2210094, 3.813447, 1, 1, 1, 1, 1,
0.6798945, -0.6149485, 1.435147, 1, 1, 1, 1, 1,
0.6826624, 2.351133, -0.01193999, 1, 1, 1, 1, 1,
0.6829883, -3.209668, 3.56458, 1, 1, 1, 1, 1,
0.6833176, 1.132773, 0.07363507, 1, 1, 1, 1, 1,
0.6837589, -1.011356, 0.6074387, 1, 1, 1, 1, 1,
0.6911, -0.05961986, 0.8885911, 0, 0, 1, 1, 1,
0.6912102, -0.1953983, 0.8001498, 1, 0, 0, 1, 1,
0.6912391, -0.6979035, 2.712612, 1, 0, 0, 1, 1,
0.6973913, 0.5317821, 2.098741, 1, 0, 0, 1, 1,
0.6985895, 1.037323, 0.08885499, 1, 0, 0, 1, 1,
0.7092435, -0.03394663, 3.03188, 1, 0, 0, 1, 1,
0.7196484, -0.3019529, 1.460074, 0, 0, 0, 1, 1,
0.7208417, 0.4316537, -0.5881375, 0, 0, 0, 1, 1,
0.7244244, 1.737294, -0.2662404, 0, 0, 0, 1, 1,
0.725959, -1.090236, 2.316082, 0, 0, 0, 1, 1,
0.7280063, 2.103169, -0.03115186, 0, 0, 0, 1, 1,
0.7330742, 0.3039988, 2.560292, 0, 0, 0, 1, 1,
0.7349432, 0.1043918, 0.1231881, 0, 0, 0, 1, 1,
0.736408, -0.09530922, 1.143162, 1, 1, 1, 1, 1,
0.7434728, -0.6290683, 2.193409, 1, 1, 1, 1, 1,
0.7464147, -1.506144, 2.232927, 1, 1, 1, 1, 1,
0.7669145, 1.749916, 1.110052, 1, 1, 1, 1, 1,
0.7678767, -1.572454, 1.566985, 1, 1, 1, 1, 1,
0.7718468, -0.1381412, 1.976134, 1, 1, 1, 1, 1,
0.7747238, -1.723874, 2.403228, 1, 1, 1, 1, 1,
0.7768803, -0.1407022, 0.1160784, 1, 1, 1, 1, 1,
0.7807758, 0.4415795, 0.1207343, 1, 1, 1, 1, 1,
0.7829, 0.01656324, 0.1198882, 1, 1, 1, 1, 1,
0.7847495, 1.114804, 0.6975551, 1, 1, 1, 1, 1,
0.784756, -0.04486426, 1.374041, 1, 1, 1, 1, 1,
0.7917512, -1.965117, 2.197943, 1, 1, 1, 1, 1,
0.7959343, 0.8317153, 1.583242, 1, 1, 1, 1, 1,
0.7990902, 0.9407725, -0.2456298, 1, 1, 1, 1, 1,
0.799994, -1.476883, 4.93644, 0, 0, 1, 1, 1,
0.8001536, 1.079594, 2.522786, 1, 0, 0, 1, 1,
0.8082672, 0.2803378, -0.6044959, 1, 0, 0, 1, 1,
0.8096228, 0.1604657, 1.975712, 1, 0, 0, 1, 1,
0.8149685, 0.467762, 1.142328, 1, 0, 0, 1, 1,
0.8164709, 0.09581042, 2.507401, 1, 0, 0, 1, 1,
0.821285, -1.137908, 1.235115, 0, 0, 0, 1, 1,
0.8215022, 1.552816, -0.01393094, 0, 0, 0, 1, 1,
0.8269165, -0.4505154, 2.545526, 0, 0, 0, 1, 1,
0.8298788, -0.6398255, 2.929111, 0, 0, 0, 1, 1,
0.8309981, 0.3444516, 1.190303, 0, 0, 0, 1, 1,
0.8311573, 0.4380152, -0.4840698, 0, 0, 0, 1, 1,
0.8332379, -1.00232, 2.227092, 0, 0, 0, 1, 1,
0.836043, 2.80786, 0.3223487, 1, 1, 1, 1, 1,
0.8476374, 0.2284516, 2.462001, 1, 1, 1, 1, 1,
0.8540481, 0.2479645, 1.92223, 1, 1, 1, 1, 1,
0.8617309, -1.199864, 1.819586, 1, 1, 1, 1, 1,
0.8632905, 0.3372082, 0.8166627, 1, 1, 1, 1, 1,
0.8671591, 0.05068959, 4.059123, 1, 1, 1, 1, 1,
0.8709024, 2.366392, -1.068579, 1, 1, 1, 1, 1,
0.8730806, 1.364399, 0.08002261, 1, 1, 1, 1, 1,
0.8733761, -0.6390768, 2.08635, 1, 1, 1, 1, 1,
0.874163, -2.142232, 3.490921, 1, 1, 1, 1, 1,
0.8810373, 0.649229, 1.32805, 1, 1, 1, 1, 1,
0.8940576, -2.395366, 1.890522, 1, 1, 1, 1, 1,
0.8985836, 2.088299, 0.7796723, 1, 1, 1, 1, 1,
0.8987497, 1.202654, 0.06411059, 1, 1, 1, 1, 1,
0.8990683, -0.4815495, 1.792012, 1, 1, 1, 1, 1,
0.9078975, 0.2619566, 1.040366, 0, 0, 1, 1, 1,
0.9089348, 0.2351998, 0.5407072, 1, 0, 0, 1, 1,
0.9104258, -0.2191619, 2.099488, 1, 0, 0, 1, 1,
0.9115748, 0.7092789, -1.160143, 1, 0, 0, 1, 1,
0.9164225, -0.3624775, 1.731509, 1, 0, 0, 1, 1,
0.9200544, -0.1455119, 2.864387, 1, 0, 0, 1, 1,
0.9247216, -0.2610832, 1.146289, 0, 0, 0, 1, 1,
0.9262379, 0.9605721, 0.193209, 0, 0, 0, 1, 1,
0.9373341, -0.6322001, 2.092215, 0, 0, 0, 1, 1,
0.9413209, 0.1803425, 2.295005, 0, 0, 0, 1, 1,
0.9419513, -1.839982, 2.267232, 0, 0, 0, 1, 1,
0.9430503, 0.2956874, 2.427928, 0, 0, 0, 1, 1,
0.9430527, -0.01618593, 0.7099383, 0, 0, 0, 1, 1,
0.9487607, 1.667525, 1.861921, 1, 1, 1, 1, 1,
0.9546592, 0.6700028, 0.8963581, 1, 1, 1, 1, 1,
0.9650781, 0.9088636, 3.497252, 1, 1, 1, 1, 1,
0.9652532, -0.227996, 1.52853, 1, 1, 1, 1, 1,
0.9707747, 0.9023202, 0.3740598, 1, 1, 1, 1, 1,
0.9756699, 0.5037171, 0.9672132, 1, 1, 1, 1, 1,
0.9789866, 0.40513, 0.37998, 1, 1, 1, 1, 1,
0.9790608, 0.4793461, 2.637017, 1, 1, 1, 1, 1,
0.9843539, 0.8700048, 2.374496, 1, 1, 1, 1, 1,
0.994854, -0.3806018, 1.32241, 1, 1, 1, 1, 1,
1.002372, 0.9534332, 1.442095, 1, 1, 1, 1, 1,
1.005815, -0.176297, 1.541652, 1, 1, 1, 1, 1,
1.006402, 1.03955, 0.9809273, 1, 1, 1, 1, 1,
1.007994, -0.9039211, 2.107674, 1, 1, 1, 1, 1,
1.015461, 2.504852, 0.5352131, 1, 1, 1, 1, 1,
1.018092, 1.701095, -0.6053385, 0, 0, 1, 1, 1,
1.022007, 0.07939749, 2.425103, 1, 0, 0, 1, 1,
1.022187, 0.1859843, 1.804106, 1, 0, 0, 1, 1,
1.028185, 0.6797943, 0.2377278, 1, 0, 0, 1, 1,
1.03053, -0.1004157, 2.07972, 1, 0, 0, 1, 1,
1.037904, 0.6381553, -0.8236836, 1, 0, 0, 1, 1,
1.040125, 0.7350492, 0.1776305, 0, 0, 0, 1, 1,
1.041644, -1.375157, 2.73436, 0, 0, 0, 1, 1,
1.042887, -0.004393605, 1.68824, 0, 0, 0, 1, 1,
1.044639, 0.5792499, 1.868583, 0, 0, 0, 1, 1,
1.047768, -0.3519851, 2.714646, 0, 0, 0, 1, 1,
1.047794, 1.196365, 0.2845523, 0, 0, 0, 1, 1,
1.050414, -1.471148, 3.037688, 0, 0, 0, 1, 1,
1.058745, 0.3455006, -0.3654664, 1, 1, 1, 1, 1,
1.063355, 1.023443, 1.142407, 1, 1, 1, 1, 1,
1.065301, -0.1822927, 1.935332, 1, 1, 1, 1, 1,
1.069884, -0.5884889, 1.598887, 1, 1, 1, 1, 1,
1.07349, -1.140559, 2.432036, 1, 1, 1, 1, 1,
1.081724, 1.599674, 1.071761, 1, 1, 1, 1, 1,
1.085324, -0.3433859, 1.37307, 1, 1, 1, 1, 1,
1.092527, -0.8278174, 1.983943, 1, 1, 1, 1, 1,
1.093578, -2.005616, 3.042788, 1, 1, 1, 1, 1,
1.098518, -0.1504388, 1.362019, 1, 1, 1, 1, 1,
1.098823, 1.021899, 1.161725, 1, 1, 1, 1, 1,
1.100601, -2.267779, 2.599051, 1, 1, 1, 1, 1,
1.106151, 0.4595428, 1.333268, 1, 1, 1, 1, 1,
1.107347, 0.3487316, 1.184122, 1, 1, 1, 1, 1,
1.129395, 0.1600821, 0.4628668, 1, 1, 1, 1, 1,
1.138746, 0.1822549, -0.113546, 0, 0, 1, 1, 1,
1.147383, 0.6680632, -0.4777909, 1, 0, 0, 1, 1,
1.15654, -0.4427261, 1.687556, 1, 0, 0, 1, 1,
1.158242, -1.747514, 1.722277, 1, 0, 0, 1, 1,
1.1652, -0.9285061, 1.58384, 1, 0, 0, 1, 1,
1.167265, 0.6331914, 1.674623, 1, 0, 0, 1, 1,
1.169158, 1.609599, 1.123462, 0, 0, 0, 1, 1,
1.16967, -2.061096, 2.722465, 0, 0, 0, 1, 1,
1.176449, 0.4858045, 2.96808, 0, 0, 0, 1, 1,
1.178398, 0.7148184, 1.521282, 0, 0, 0, 1, 1,
1.181347, -0.484209, 2.41803, 0, 0, 0, 1, 1,
1.181366, 0.7020947, 0.7880656, 0, 0, 0, 1, 1,
1.191375, 0.9744525, 2.451257, 0, 0, 0, 1, 1,
1.19192, 0.675231, 1.421858, 1, 1, 1, 1, 1,
1.195298, -0.2083807, 1.795939, 1, 1, 1, 1, 1,
1.199857, 0.581238, 2.112932, 1, 1, 1, 1, 1,
1.20179, -1.314331, 1.770879, 1, 1, 1, 1, 1,
1.213405, -0.3176551, 1.095747, 1, 1, 1, 1, 1,
1.215507, 0.2986404, 0.5377318, 1, 1, 1, 1, 1,
1.222056, 0.1698366, 1.788521, 1, 1, 1, 1, 1,
1.231165, -0.5950041, 0.2051352, 1, 1, 1, 1, 1,
1.235076, 1.377518, -0.3531087, 1, 1, 1, 1, 1,
1.238853, -0.8486959, 2.11826, 1, 1, 1, 1, 1,
1.25073, -1.305778, 2.047354, 1, 1, 1, 1, 1,
1.252659, -1.522696, 2.588653, 1, 1, 1, 1, 1,
1.26184, 0.06952506, -0.04757736, 1, 1, 1, 1, 1,
1.271332, 2.18738, 1.570329, 1, 1, 1, 1, 1,
1.273539, 0.3274271, 2.783002, 1, 1, 1, 1, 1,
1.275636, -1.464075, 2.937365, 0, 0, 1, 1, 1,
1.277839, 0.3702805, 1.118795, 1, 0, 0, 1, 1,
1.280214, -0.2731752, 2.462576, 1, 0, 0, 1, 1,
1.293573, 0.7278129, 0.6191516, 1, 0, 0, 1, 1,
1.294972, -0.8681736, 2.952678, 1, 0, 0, 1, 1,
1.296425, 0.6578251, 1.276846, 1, 0, 0, 1, 1,
1.300269, 0.2593179, 1.898957, 0, 0, 0, 1, 1,
1.317428, -2.409449, 2.757993, 0, 0, 0, 1, 1,
1.330819, -1.470376, 2.548362, 0, 0, 0, 1, 1,
1.341721, 1.39063, 1.274796, 0, 0, 0, 1, 1,
1.349645, 0.422868, 0.1609844, 0, 0, 0, 1, 1,
1.354543, 0.1779661, 0.8428955, 0, 0, 0, 1, 1,
1.35536, 1.075957, -0.8090696, 0, 0, 0, 1, 1,
1.356736, -0.571614, 2.092717, 1, 1, 1, 1, 1,
1.35689, -1.254699, 1.88597, 1, 1, 1, 1, 1,
1.360259, 0.1626728, 1.102828, 1, 1, 1, 1, 1,
1.365281, 1.076609, 0.06967521, 1, 1, 1, 1, 1,
1.376402, -0.02260643, 2.56597, 1, 1, 1, 1, 1,
1.385261, -0.01555078, 0.4065058, 1, 1, 1, 1, 1,
1.387834, 0.8187501, 1.753976, 1, 1, 1, 1, 1,
1.393561, 0.01959397, 0.171335, 1, 1, 1, 1, 1,
1.396861, 1.272238, 0.6157337, 1, 1, 1, 1, 1,
1.399882, 0.3612088, 0.7815564, 1, 1, 1, 1, 1,
1.40084, 0.5889062, 0.9851065, 1, 1, 1, 1, 1,
1.405666, -0.03181073, 3.673673, 1, 1, 1, 1, 1,
1.410193, -0.2115829, 0.7604373, 1, 1, 1, 1, 1,
1.422816, -0.0477419, 1.444164, 1, 1, 1, 1, 1,
1.423641, 0.8141035, 2.632053, 1, 1, 1, 1, 1,
1.423724, -0.6416043, 1.225982, 0, 0, 1, 1, 1,
1.427029, -1.109651, 1.162206, 1, 0, 0, 1, 1,
1.429491, 1.297351, -0.1176491, 1, 0, 0, 1, 1,
1.433076, -0.494565, 2.338102, 1, 0, 0, 1, 1,
1.43332, -0.2843888, 2.628052, 1, 0, 0, 1, 1,
1.439493, -0.6987543, 2.017436, 1, 0, 0, 1, 1,
1.440195, 1.333226, -0.5235024, 0, 0, 0, 1, 1,
1.445824, -0.252723, 1.244895, 0, 0, 0, 1, 1,
1.454604, 0.2401986, 0.642179, 0, 0, 0, 1, 1,
1.45478, -0.5629945, 2.099201, 0, 0, 0, 1, 1,
1.463659, 0.304564, 2.894471, 0, 0, 0, 1, 1,
1.467062, 0.08616223, 1.922602, 0, 0, 0, 1, 1,
1.467161, -1.432803, 2.480504, 0, 0, 0, 1, 1,
1.476184, -1.983761, 2.485718, 1, 1, 1, 1, 1,
1.476487, 0.8419572, 1.29352, 1, 1, 1, 1, 1,
1.477856, -0.6280784, 3.877533, 1, 1, 1, 1, 1,
1.48095, 0.2710425, 3.222135, 1, 1, 1, 1, 1,
1.48216, -0.9006673, 2.624203, 1, 1, 1, 1, 1,
1.499582, -1.912799, 3.109682, 1, 1, 1, 1, 1,
1.52065, -0.4850785, 1.626957, 1, 1, 1, 1, 1,
1.534159, 0.8997765, 0.8769936, 1, 1, 1, 1, 1,
1.54891, -0.05783724, 1.434599, 1, 1, 1, 1, 1,
1.55072, 0.1274621, 1.996489, 1, 1, 1, 1, 1,
1.573407, -0.7774409, 2.661867, 1, 1, 1, 1, 1,
1.613631, -0.3728679, 1.897793, 1, 1, 1, 1, 1,
1.62972, 0.5162075, 0.3218383, 1, 1, 1, 1, 1,
1.63484, 0.8525382, 3.135393, 1, 1, 1, 1, 1,
1.636407, -0.2877364, 1.168224, 1, 1, 1, 1, 1,
1.639457, -1.039852, 2.008585, 0, 0, 1, 1, 1,
1.651219, 2.270198, 1.000894, 1, 0, 0, 1, 1,
1.662425, -1.929917, 2.075191, 1, 0, 0, 1, 1,
1.663181, 0.01261979, 1.143122, 1, 0, 0, 1, 1,
1.669539, -0.4973863, 2.207303, 1, 0, 0, 1, 1,
1.669908, -1.142325, 3.823757, 1, 0, 0, 1, 1,
1.679425, -0.6958638, 4.213026, 0, 0, 0, 1, 1,
1.686861, 0.0001437431, 1.071487, 0, 0, 0, 1, 1,
1.719797, 0.06103313, 1.405013, 0, 0, 0, 1, 1,
1.725227, -0.6240196, 1.695376, 0, 0, 0, 1, 1,
1.73679, -2.287765, 2.875925, 0, 0, 0, 1, 1,
1.747587, 1.089363, 0.8452657, 0, 0, 0, 1, 1,
1.748848, 0.1583401, 1.580916, 0, 0, 0, 1, 1,
1.749732, -0.6096475, 1.879633, 1, 1, 1, 1, 1,
1.775445, 1.79225, 0.1073575, 1, 1, 1, 1, 1,
1.786922, 1.153402, -1.201537, 1, 1, 1, 1, 1,
1.798391, 0.9103265, 2.397585, 1, 1, 1, 1, 1,
1.798801, -0.2930191, 1.916562, 1, 1, 1, 1, 1,
1.801726, 1.141827, 2.61048, 1, 1, 1, 1, 1,
1.845467, -0.8885374, 3.084329, 1, 1, 1, 1, 1,
1.85334, -1.764636, 1.172357, 1, 1, 1, 1, 1,
1.861757, -0.6504957, 1.450658, 1, 1, 1, 1, 1,
1.961269, -1.043249, 2.889095, 1, 1, 1, 1, 1,
2.050525, 1.399086, 0.5636997, 1, 1, 1, 1, 1,
2.054139, 0.3249025, 3.023954, 1, 1, 1, 1, 1,
2.055519, 0.1454121, 2.387676, 1, 1, 1, 1, 1,
2.07011, -1.963954, 0.2377788, 1, 1, 1, 1, 1,
2.103018, 0.3782137, 0.3658859, 1, 1, 1, 1, 1,
2.122836, -0.9824312, 2.703935, 0, 0, 1, 1, 1,
2.129399, 0.5745479, 1.371052, 1, 0, 0, 1, 1,
2.152705, -2.015408, 3.609146, 1, 0, 0, 1, 1,
2.209353, -1.956793, 2.430438, 1, 0, 0, 1, 1,
2.218658, -1.7088, 3.277122, 1, 0, 0, 1, 1,
2.253571, -0.5869564, 1.061685, 1, 0, 0, 1, 1,
2.307176, -0.4789573, 1.884415, 0, 0, 0, 1, 1,
2.335269, -0.5521917, 0.7763018, 0, 0, 0, 1, 1,
2.385167, 0.3220998, 0.05524066, 0, 0, 0, 1, 1,
2.477278, 0.5881206, -0.2516217, 0, 0, 0, 1, 1,
2.552445, 0.4270813, 1.674385, 0, 0, 0, 1, 1,
2.635468, -0.3391314, 1.960166, 0, 0, 0, 1, 1,
2.640851, 1.670365, 1.470581, 0, 0, 0, 1, 1,
2.745585, 1.777253, 1.886274, 1, 1, 1, 1, 1,
2.853198, 0.1017737, 3.908803, 1, 1, 1, 1, 1,
2.90189, 0.7848782, 1.286622, 1, 1, 1, 1, 1,
2.924249, 0.9469552, 0.1973619, 1, 1, 1, 1, 1,
3.0508, -0.01651712, 2.383313, 1, 1, 1, 1, 1,
3.205187, -0.5467487, 1.784302, 1, 1, 1, 1, 1,
3.265546, 0.7898733, 1.764349, 1, 1, 1, 1, 1
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
var radius = 9.90582;
var distance = 34.79377;
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
mvMatrix.translate( -0.06866002, 0.2986116, -0.8042707 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79377);
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
