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
-3.253264, -0.8252987, -0.3174466, 1, 0, 0, 1,
-3.018273, 0.576309, -1.92642, 1, 0.007843138, 0, 1,
-2.963316, 0.4870172, -1.931622, 1, 0.01176471, 0, 1,
-2.934197, -1.408019, -1.996271, 1, 0.01960784, 0, 1,
-2.932296, -1.032139, -3.163655, 1, 0.02352941, 0, 1,
-2.88767, -0.04977446, -1.414676, 1, 0.03137255, 0, 1,
-2.678122, 1.191845, -3.474822, 1, 0.03529412, 0, 1,
-2.589673, 0.6237175, -0.5697376, 1, 0.04313726, 0, 1,
-2.414485, -1.512318, -3.07954, 1, 0.04705882, 0, 1,
-2.34655, -0.5886405, -1.88413, 1, 0.05490196, 0, 1,
-2.324067, -0.5544741, -1.43293, 1, 0.05882353, 0, 1,
-2.293158, 2.359432, 0.4077487, 1, 0.06666667, 0, 1,
-2.253048, -0.04702946, -1.641785, 1, 0.07058824, 0, 1,
-2.245935, -0.6964152, -1.077775, 1, 0.07843138, 0, 1,
-2.207044, 0.3753192, -0.6875975, 1, 0.08235294, 0, 1,
-2.191107, -0.9668611, -0.1820167, 1, 0.09019608, 0, 1,
-2.186865, -1.128735, -2.641832, 1, 0.09411765, 0, 1,
-2.165297, 0.9603838, -1.75957, 1, 0.1019608, 0, 1,
-2.139532, 0.756645, -1.582711, 1, 0.1098039, 0, 1,
-2.0845, -0.429124, -1.302613, 1, 0.1137255, 0, 1,
-2.057736, -0.3241234, -0.6639811, 1, 0.1215686, 0, 1,
-2.014214, 1.034462, 0.1381481, 1, 0.1254902, 0, 1,
-1.996366, 0.9585027, -2.065217, 1, 0.1333333, 0, 1,
-1.980048, 0.2081892, -2.451109, 1, 0.1372549, 0, 1,
-1.942794, 0.1896902, -1.481918, 1, 0.145098, 0, 1,
-1.937682, -1.230039, -3.305641, 1, 0.1490196, 0, 1,
-1.906689, 0.2200649, -3.351152, 1, 0.1568628, 0, 1,
-1.9006, -0.4852493, -1.898254, 1, 0.1607843, 0, 1,
-1.893878, -0.2017618, -4.206206, 1, 0.1686275, 0, 1,
-1.893044, -0.4306812, -1.861305, 1, 0.172549, 0, 1,
-1.859693, -1.584216, -1.47172, 1, 0.1803922, 0, 1,
-1.840383, -1.114241, -0.04609572, 1, 0.1843137, 0, 1,
-1.83929, -1.199157, -3.990262, 1, 0.1921569, 0, 1,
-1.806282, -0.2351266, -3.207467, 1, 0.1960784, 0, 1,
-1.798333, 0.3737923, -1.301709, 1, 0.2039216, 0, 1,
-1.794921, -0.1418057, -0.3756298, 1, 0.2117647, 0, 1,
-1.790778, -0.5214043, -3.434, 1, 0.2156863, 0, 1,
-1.758528, -1.163279, -1.550603, 1, 0.2235294, 0, 1,
-1.752046, 0.3092403, -2.267778, 1, 0.227451, 0, 1,
-1.735252, -0.2367213, -3.685138, 1, 0.2352941, 0, 1,
-1.725653, -0.6787447, -1.137687, 1, 0.2392157, 0, 1,
-1.71093, -0.312612, -1.92046, 1, 0.2470588, 0, 1,
-1.707687, -0.7323189, -0.7670115, 1, 0.2509804, 0, 1,
-1.707152, -0.8379098, -2.178257, 1, 0.2588235, 0, 1,
-1.701818, 0.8859197, -1.606156, 1, 0.2627451, 0, 1,
-1.686053, -1.758494, -0.7213258, 1, 0.2705882, 0, 1,
-1.679929, 0.4442398, -1.543529, 1, 0.2745098, 0, 1,
-1.658907, 1.305858, -1.15635, 1, 0.282353, 0, 1,
-1.638129, 0.6785283, -1.726235, 1, 0.2862745, 0, 1,
-1.600872, 0.9493037, -1.373673, 1, 0.2941177, 0, 1,
-1.600361, -0.03770389, -0.4109848, 1, 0.3019608, 0, 1,
-1.600353, 1.050175, -3.147975, 1, 0.3058824, 0, 1,
-1.593044, -0.1825048, -2.038506, 1, 0.3137255, 0, 1,
-1.582458, -2.240517, -2.064651, 1, 0.3176471, 0, 1,
-1.572627, 1.58508, -0.9830957, 1, 0.3254902, 0, 1,
-1.571348, 1.950188, -0.09682532, 1, 0.3294118, 0, 1,
-1.562902, -0.4410008, -1.342167, 1, 0.3372549, 0, 1,
-1.551771, 2.752179, -0.4296778, 1, 0.3411765, 0, 1,
-1.536435, 0.381185, -2.301684, 1, 0.3490196, 0, 1,
-1.532995, -0.577714, -2.014864, 1, 0.3529412, 0, 1,
-1.522793, -0.8727568, -2.00405, 1, 0.3607843, 0, 1,
-1.520692, -2.307062, -2.341096, 1, 0.3647059, 0, 1,
-1.51597, -0.2741455, -0.4099692, 1, 0.372549, 0, 1,
-1.510458, 0.9668227, -1.378885, 1, 0.3764706, 0, 1,
-1.509221, -0.3712279, -2.833455, 1, 0.3843137, 0, 1,
-1.50601, -0.1356928, -1.862249, 1, 0.3882353, 0, 1,
-1.492831, -0.727514, -1.738296, 1, 0.3960784, 0, 1,
-1.488484, 0.04476046, -1.61643, 1, 0.4039216, 0, 1,
-1.482123, -0.09365548, -1.571398, 1, 0.4078431, 0, 1,
-1.479969, -0.7454639, -2.122519, 1, 0.4156863, 0, 1,
-1.46921, 0.3143598, -1.224137, 1, 0.4196078, 0, 1,
-1.461954, -0.2196926, -0.9964991, 1, 0.427451, 0, 1,
-1.458551, -1.809991, -1.209493, 1, 0.4313726, 0, 1,
-1.45122, 0.09265681, -0.7374446, 1, 0.4392157, 0, 1,
-1.450468, -0.1798928, -3.018172, 1, 0.4431373, 0, 1,
-1.449708, 0.3817922, -1.195534, 1, 0.4509804, 0, 1,
-1.449304, 2.351316, -2.089379, 1, 0.454902, 0, 1,
-1.435882, -0.6942109, -2.47831, 1, 0.4627451, 0, 1,
-1.424166, 0.1943941, -1.545578, 1, 0.4666667, 0, 1,
-1.416589, -0.3128297, 0.009999433, 1, 0.4745098, 0, 1,
-1.405023, 1.892445, -1.127531, 1, 0.4784314, 0, 1,
-1.400934, -0.5396361, -2.385118, 1, 0.4862745, 0, 1,
-1.399764, 2.619683, -0.008093131, 1, 0.4901961, 0, 1,
-1.393381, -0.1439898, -2.364489, 1, 0.4980392, 0, 1,
-1.392153, -0.5861664, 0.6510703, 1, 0.5058824, 0, 1,
-1.387542, -0.682146, -0.2084226, 1, 0.509804, 0, 1,
-1.385739, -0.7531612, -1.807286, 1, 0.5176471, 0, 1,
-1.382336, -0.5553421, -3.025902, 1, 0.5215687, 0, 1,
-1.379877, 2.121394, 0.6946606, 1, 0.5294118, 0, 1,
-1.377134, -1.157817, -2.755674, 1, 0.5333334, 0, 1,
-1.376954, -0.6311503, -2.627185, 1, 0.5411765, 0, 1,
-1.374133, -1.822535, -0.7399179, 1, 0.5450981, 0, 1,
-1.370658, 0.05819817, -0.9142574, 1, 0.5529412, 0, 1,
-1.35751, 0.7495188, 0.3612917, 1, 0.5568628, 0, 1,
-1.35032, 1.09545, -0.7825173, 1, 0.5647059, 0, 1,
-1.342632, 1.986219, -1.154636, 1, 0.5686275, 0, 1,
-1.339581, 1.448275, 0.2285561, 1, 0.5764706, 0, 1,
-1.338961, 0.5740314, 0.6763322, 1, 0.5803922, 0, 1,
-1.33742, -0.5838541, -2.466954, 1, 0.5882353, 0, 1,
-1.334815, -1.340595, -4.28999, 1, 0.5921569, 0, 1,
-1.328584, -1.031645, -1.115105, 1, 0.6, 0, 1,
-1.324111, 1.560606, -0.6545622, 1, 0.6078432, 0, 1,
-1.314738, 2.321019, -1.063829, 1, 0.6117647, 0, 1,
-1.310988, -0.5279722, -1.576341, 1, 0.6196079, 0, 1,
-1.30849, 0.8170481, -0.4884911, 1, 0.6235294, 0, 1,
-1.307666, 0.3280249, -4.64487, 1, 0.6313726, 0, 1,
-1.303564, -1.134453, -2.163186, 1, 0.6352941, 0, 1,
-1.300075, -1.684476, -2.412465, 1, 0.6431373, 0, 1,
-1.295012, 0.3749987, -0.666491, 1, 0.6470588, 0, 1,
-1.293462, -0.3698225, -2.948848, 1, 0.654902, 0, 1,
-1.27448, 2.186496, -0.9707663, 1, 0.6588235, 0, 1,
-1.258176, 0.9307714, -0.9745124, 1, 0.6666667, 0, 1,
-1.258111, -0.3045687, -2.095734, 1, 0.6705883, 0, 1,
-1.252598, -1.514376, -1.8421, 1, 0.6784314, 0, 1,
-1.251805, -0.9411933, -2.524647, 1, 0.682353, 0, 1,
-1.225886, 0.8912982, -0.2726305, 1, 0.6901961, 0, 1,
-1.219376, -0.8100129, -3.270591, 1, 0.6941177, 0, 1,
-1.216726, -0.6919076, -1.811494, 1, 0.7019608, 0, 1,
-1.202402, 1.04341, 0.6203534, 1, 0.7098039, 0, 1,
-1.20176, 0.04201204, -2.33267, 1, 0.7137255, 0, 1,
-1.200568, 1.067169, -0.6172735, 1, 0.7215686, 0, 1,
-1.17711, -1.76216, -1.900519, 1, 0.7254902, 0, 1,
-1.176872, -0.8221602, -2.709532, 1, 0.7333333, 0, 1,
-1.173703, -1.839246, -1.871686, 1, 0.7372549, 0, 1,
-1.172133, -0.2292149, -1.232811, 1, 0.7450981, 0, 1,
-1.169284, 1.744447, 0.6451095, 1, 0.7490196, 0, 1,
-1.168889, 2.284388, 0.5149231, 1, 0.7568628, 0, 1,
-1.165694, 0.5884606, 1.021512, 1, 0.7607843, 0, 1,
-1.158346, -0.105878, -0.2684239, 1, 0.7686275, 0, 1,
-1.156384, 2.210562, -1.433726, 1, 0.772549, 0, 1,
-1.148844, -1.325313, -1.128062, 1, 0.7803922, 0, 1,
-1.147335, 0.04051458, -2.297651, 1, 0.7843137, 0, 1,
-1.142753, -0.1877498, -3.47824, 1, 0.7921569, 0, 1,
-1.138549, -0.6504023, -1.233765, 1, 0.7960784, 0, 1,
-1.137125, 1.652356, -1.034791, 1, 0.8039216, 0, 1,
-1.12879, -1.179694, -1.824812, 1, 0.8117647, 0, 1,
-1.127745, -1.258041, -2.650249, 1, 0.8156863, 0, 1,
-1.127501, -0.9055771, -2.409139, 1, 0.8235294, 0, 1,
-1.118253, -1.08911, -2.022941, 1, 0.827451, 0, 1,
-1.115351, -0.34108, -2.115932, 1, 0.8352941, 0, 1,
-1.106252, -0.3646489, 0.1332482, 1, 0.8392157, 0, 1,
-1.105204, 0.7886623, -0.5728295, 1, 0.8470588, 0, 1,
-1.099257, -1.552688, -1.784599, 1, 0.8509804, 0, 1,
-1.097049, 1.119477, -1.127041, 1, 0.8588235, 0, 1,
-1.094922, -0.3495706, -2.00332, 1, 0.8627451, 0, 1,
-1.094626, 0.4285986, -0.2828393, 1, 0.8705882, 0, 1,
-1.093126, 0.1022074, -1.432863, 1, 0.8745098, 0, 1,
-1.084082, 1.426553, -1.006747, 1, 0.8823529, 0, 1,
-1.082365, -0.6664484, -1.426687, 1, 0.8862745, 0, 1,
-1.076681, 0.5514594, -1.188196, 1, 0.8941177, 0, 1,
-1.074133, 2.758342, -0.3800323, 1, 0.8980392, 0, 1,
-1.073942, 0.3358504, -0.286678, 1, 0.9058824, 0, 1,
-1.073926, -0.08288174, -2.027013, 1, 0.9137255, 0, 1,
-1.067912, -1.068034, -2.431735, 1, 0.9176471, 0, 1,
-1.066631, 0.1598157, -0.5312141, 1, 0.9254902, 0, 1,
-1.065714, 1.294547, -0.9573339, 1, 0.9294118, 0, 1,
-1.063424, 0.787896, -0.993054, 1, 0.9372549, 0, 1,
-1.062389, -0.01316635, -0.6824542, 1, 0.9411765, 0, 1,
-1.056176, -1.049404, -2.41112, 1, 0.9490196, 0, 1,
-1.05403, 1.684077, -1.963982, 1, 0.9529412, 0, 1,
-1.050396, -0.1331281, -0.1074152, 1, 0.9607843, 0, 1,
-1.039508, 1.236235, -1.313571, 1, 0.9647059, 0, 1,
-1.026446, 1.067968, -2.092321, 1, 0.972549, 0, 1,
-1.018263, 2.525292, 0.9928941, 1, 0.9764706, 0, 1,
-1.016597, -0.4801508, -3.333201, 1, 0.9843137, 0, 1,
-1.016468, 0.5120925, 0.1496322, 1, 0.9882353, 0, 1,
-1.011784, 0.4290403, -1.121879, 1, 0.9960784, 0, 1,
-1.005763, -0.005311452, -2.49757, 0.9960784, 1, 0, 1,
-0.9975188, -0.2932776, -1.984505, 0.9921569, 1, 0, 1,
-0.9936882, 2.668312, -0.7760673, 0.9843137, 1, 0, 1,
-0.9936755, 1.083956, -1.029582, 0.9803922, 1, 0, 1,
-0.9824455, -0.1099846, -2.614035, 0.972549, 1, 0, 1,
-0.9799535, 0.317895, -1.815683, 0.9686275, 1, 0, 1,
-0.9730975, -0.1573816, -3.437016, 0.9607843, 1, 0, 1,
-0.972966, -0.02196757, -2.253648, 0.9568627, 1, 0, 1,
-0.9673373, 1.260745, 0.6681278, 0.9490196, 1, 0, 1,
-0.9610888, -0.2398305, -0.9182087, 0.945098, 1, 0, 1,
-0.9602656, 0.2933573, -0.5625324, 0.9372549, 1, 0, 1,
-0.9535052, 0.1061054, -0.05234026, 0.9333333, 1, 0, 1,
-0.9484854, -0.6288766, -1.122499, 0.9254902, 1, 0, 1,
-0.9433029, -0.6934225, -2.022556, 0.9215686, 1, 0, 1,
-0.9407407, -0.4609581, -0.5010642, 0.9137255, 1, 0, 1,
-0.9325334, 0.8385584, -0.9248893, 0.9098039, 1, 0, 1,
-0.9286079, 0.2808442, -2.144242, 0.9019608, 1, 0, 1,
-0.9283481, 0.2673092, -0.9777091, 0.8941177, 1, 0, 1,
-0.9244919, 0.5701528, 0.03344827, 0.8901961, 1, 0, 1,
-0.9177269, -0.4929511, -1.475295, 0.8823529, 1, 0, 1,
-0.912018, -0.6216405, -4.04855, 0.8784314, 1, 0, 1,
-0.9070399, -0.4744802, -1.013595, 0.8705882, 1, 0, 1,
-0.9061394, -1.271034, -0.7929725, 0.8666667, 1, 0, 1,
-0.9046111, 0.1091925, -2.480435, 0.8588235, 1, 0, 1,
-0.9028891, 0.06194358, -1.452331, 0.854902, 1, 0, 1,
-0.900525, -0.6870309, -2.502554, 0.8470588, 1, 0, 1,
-0.8959756, -0.2118214, -1.539198, 0.8431373, 1, 0, 1,
-0.8895755, -0.06819408, -3.028568, 0.8352941, 1, 0, 1,
-0.8839545, 1.858098, -0.492034, 0.8313726, 1, 0, 1,
-0.8833793, 0.8627295, -1.980484, 0.8235294, 1, 0, 1,
-0.8796548, -0.1207678, -2.136461, 0.8196079, 1, 0, 1,
-0.8730565, -0.2020816, -2.39146, 0.8117647, 1, 0, 1,
-0.8684937, -0.7596777, -2.28555, 0.8078431, 1, 0, 1,
-0.8578773, -0.9109234, -2.819749, 0.8, 1, 0, 1,
-0.8575701, -0.2730405, -1.685495, 0.7921569, 1, 0, 1,
-0.8555848, -0.2784369, -1.33377, 0.7882353, 1, 0, 1,
-0.8495213, -0.9375898, -4.260146, 0.7803922, 1, 0, 1,
-0.848645, -0.277869, -0.447244, 0.7764706, 1, 0, 1,
-0.8438982, 2.544325, -0.3615761, 0.7686275, 1, 0, 1,
-0.838769, -0.7642871, -2.607464, 0.7647059, 1, 0, 1,
-0.8383144, 0.3765342, -2.630184, 0.7568628, 1, 0, 1,
-0.8376374, -0.1275436, -0.3695281, 0.7529412, 1, 0, 1,
-0.8306476, 0.5590479, -1.851418, 0.7450981, 1, 0, 1,
-0.8271424, 1.400697, -0.8448192, 0.7411765, 1, 0, 1,
-0.8260825, 0.02732009, -2.019221, 0.7333333, 1, 0, 1,
-0.8206864, 1.665891, -0.8994513, 0.7294118, 1, 0, 1,
-0.818856, 1.22666, -0.3534594, 0.7215686, 1, 0, 1,
-0.817714, 0.2530409, -2.728983, 0.7176471, 1, 0, 1,
-0.815705, 0.7036397, 0.73432, 0.7098039, 1, 0, 1,
-0.8133057, 0.2501228, -1.041779, 0.7058824, 1, 0, 1,
-0.808468, 1.655384, -0.1552841, 0.6980392, 1, 0, 1,
-0.8004405, 0.319548, -1.24225, 0.6901961, 1, 0, 1,
-0.7835398, 1.126849, 0.9464807, 0.6862745, 1, 0, 1,
-0.7832648, -0.9569198, -1.838066, 0.6784314, 1, 0, 1,
-0.782838, -1.253637, -2.719294, 0.6745098, 1, 0, 1,
-0.7792216, -0.4948341, -0.7392681, 0.6666667, 1, 0, 1,
-0.7753379, -0.4081827, -2.992299, 0.6627451, 1, 0, 1,
-0.7740914, 0.8630476, -0.5734729, 0.654902, 1, 0, 1,
-0.7710935, 0.7807335, -1.7793, 0.6509804, 1, 0, 1,
-0.7709347, -0.1087409, 0.2144183, 0.6431373, 1, 0, 1,
-0.7662297, 1.298123, 2.150628, 0.6392157, 1, 0, 1,
-0.7658404, 2.278119, -0.3722878, 0.6313726, 1, 0, 1,
-0.7654722, 1.297385, -1.823409, 0.627451, 1, 0, 1,
-0.7648804, 0.6288034, 0.3597428, 0.6196079, 1, 0, 1,
-0.7563214, 0.5662858, -1.615305, 0.6156863, 1, 0, 1,
-0.7555823, -0.1944367, -0.6620588, 0.6078432, 1, 0, 1,
-0.7547203, -0.9224698, -2.313212, 0.6039216, 1, 0, 1,
-0.7455348, 0.7154105, -1.75852, 0.5960785, 1, 0, 1,
-0.74479, -1.885596, -2.168075, 0.5882353, 1, 0, 1,
-0.7413651, 0.1325663, -0.4509473, 0.5843138, 1, 0, 1,
-0.7411388, 1.326247, 0.0439283, 0.5764706, 1, 0, 1,
-0.7402362, 0.5331964, -1.095197, 0.572549, 1, 0, 1,
-0.7329203, 0.4773597, -1.328731, 0.5647059, 1, 0, 1,
-0.7310811, 1.214247, 1.574615, 0.5607843, 1, 0, 1,
-0.7284015, 1.367924, -1.999536, 0.5529412, 1, 0, 1,
-0.7191983, -2.942582, -4.29777, 0.5490196, 1, 0, 1,
-0.7130098, -0.6769969, -3.266981, 0.5411765, 1, 0, 1,
-0.7044551, 0.7341329, -1.561506, 0.5372549, 1, 0, 1,
-0.7019553, -1.462249, -2.783435, 0.5294118, 1, 0, 1,
-0.6957709, -0.1744323, -1.179227, 0.5254902, 1, 0, 1,
-0.6954192, 0.6377464, -0.836862, 0.5176471, 1, 0, 1,
-0.6953964, -1.365222, -2.819141, 0.5137255, 1, 0, 1,
-0.6948649, -1.47798, -1.387403, 0.5058824, 1, 0, 1,
-0.6934435, 0.3143074, 1.395473, 0.5019608, 1, 0, 1,
-0.6933053, 0.9504564, -1.209478, 0.4941176, 1, 0, 1,
-0.693272, -1.391692, -4.45638, 0.4862745, 1, 0, 1,
-0.6891448, 0.9005079, -1.115163, 0.4823529, 1, 0, 1,
-0.6884345, 1.411859, 0.5030159, 0.4745098, 1, 0, 1,
-0.6879047, 0.1756495, -1.940715, 0.4705882, 1, 0, 1,
-0.6863537, 0.4883795, -1.811703, 0.4627451, 1, 0, 1,
-0.674683, 0.8037794, -1.992913, 0.4588235, 1, 0, 1,
-0.6732248, -0.2243911, -0.508512, 0.4509804, 1, 0, 1,
-0.6722425, -1.184759, -4.466665, 0.4470588, 1, 0, 1,
-0.6654684, -1.50583, -1.240241, 0.4392157, 1, 0, 1,
-0.6654236, -0.2121305, -1.754396, 0.4352941, 1, 0, 1,
-0.6648362, 0.1507835, -1.519239, 0.427451, 1, 0, 1,
-0.6618387, 0.2107204, -2.627184, 0.4235294, 1, 0, 1,
-0.6598987, 0.6650376, -2.005949, 0.4156863, 1, 0, 1,
-0.657583, 0.9656136, 1.321278, 0.4117647, 1, 0, 1,
-0.6567513, -0.36546, -1.588727, 0.4039216, 1, 0, 1,
-0.655534, 1.948791, -0.9706634, 0.3960784, 1, 0, 1,
-0.6538959, -0.7900282, -4.615465, 0.3921569, 1, 0, 1,
-0.6532552, 1.72453, -0.3128516, 0.3843137, 1, 0, 1,
-0.6493726, 0.8919995, -0.3553551, 0.3803922, 1, 0, 1,
-0.6472119, 0.3741824, -1.303471, 0.372549, 1, 0, 1,
-0.6384618, -1.163606, -1.47702, 0.3686275, 1, 0, 1,
-0.6304845, 0.5205426, -1.234871, 0.3607843, 1, 0, 1,
-0.6275756, -0.4547365, -3.254359, 0.3568628, 1, 0, 1,
-0.6212067, -1.060638, -1.599678, 0.3490196, 1, 0, 1,
-0.6209134, 1.369396, -0.06410951, 0.345098, 1, 0, 1,
-0.6180911, -0.7975466, -1.113331, 0.3372549, 1, 0, 1,
-0.6166319, 0.5056944, -2.887937, 0.3333333, 1, 0, 1,
-0.6152645, 0.2724884, -2.881308, 0.3254902, 1, 0, 1,
-0.6120623, -0.7684966, -2.062202, 0.3215686, 1, 0, 1,
-0.6086329, 0.9510119, -1.079306, 0.3137255, 1, 0, 1,
-0.6055967, 1.019304, 0.03085516, 0.3098039, 1, 0, 1,
-0.6050674, -0.3350391, -3.034553, 0.3019608, 1, 0, 1,
-0.6016284, -1.121526, -4.13132, 0.2941177, 1, 0, 1,
-0.5976552, -0.6026199, -2.953856, 0.2901961, 1, 0, 1,
-0.5946057, 0.2182751, -2.040896, 0.282353, 1, 0, 1,
-0.5909184, 0.3952196, 0.204891, 0.2784314, 1, 0, 1,
-0.5854631, -2.258154, -4.293077, 0.2705882, 1, 0, 1,
-0.5754003, -0.4894687, -2.029784, 0.2666667, 1, 0, 1,
-0.5685265, -0.02902392, -1.995759, 0.2588235, 1, 0, 1,
-0.5653839, -0.1587332, -2.954624, 0.254902, 1, 0, 1,
-0.5642937, 0.03592999, -1.520478, 0.2470588, 1, 0, 1,
-0.5638265, -0.4228508, -1.768064, 0.2431373, 1, 0, 1,
-0.5537681, -1.100607, -3.961923, 0.2352941, 1, 0, 1,
-0.5492544, -0.2663361, -2.131269, 0.2313726, 1, 0, 1,
-0.5483273, 0.5963523, -1.70546, 0.2235294, 1, 0, 1,
-0.5450022, -0.1281176, -3.675607, 0.2196078, 1, 0, 1,
-0.5394825, -0.1446003, -3.433451, 0.2117647, 1, 0, 1,
-0.5329621, 0.541047, -1.774749, 0.2078431, 1, 0, 1,
-0.5280715, 1.327693, 0.8031199, 0.2, 1, 0, 1,
-0.5278495, -0.3428523, -2.457177, 0.1921569, 1, 0, 1,
-0.5216867, -0.03044055, -1.014321, 0.1882353, 1, 0, 1,
-0.5196605, -1.479855, -2.490705, 0.1803922, 1, 0, 1,
-0.5189842, -0.08899937, -2.692371, 0.1764706, 1, 0, 1,
-0.5181721, -0.3024805, -2.270519, 0.1686275, 1, 0, 1,
-0.5180485, -0.0101301, -1.418928, 0.1647059, 1, 0, 1,
-0.5168667, 0.8854978, 0.5428602, 0.1568628, 1, 0, 1,
-0.5104529, -0.2613505, 0.3369894, 0.1529412, 1, 0, 1,
-0.5088515, 0.1713702, -2.125813, 0.145098, 1, 0, 1,
-0.5081604, 0.817232, 0.6744647, 0.1411765, 1, 0, 1,
-0.5073695, -0.3421413, -1.345149, 0.1333333, 1, 0, 1,
-0.5060723, -0.8976832, -1.14013, 0.1294118, 1, 0, 1,
-0.505979, -0.3345662, -2.73103, 0.1215686, 1, 0, 1,
-0.5044127, 0.09788974, -3.124351, 0.1176471, 1, 0, 1,
-0.5016425, -0.1328327, -0.2006999, 0.1098039, 1, 0, 1,
-0.5009758, -0.4810399, -2.465677, 0.1058824, 1, 0, 1,
-0.498661, 1.161679, 0.7933009, 0.09803922, 1, 0, 1,
-0.4961975, -2.231453, -2.953432, 0.09019608, 1, 0, 1,
-0.4959721, 0.5776761, -1.530423, 0.08627451, 1, 0, 1,
-0.4959392, 1.858286, -0.2729824, 0.07843138, 1, 0, 1,
-0.4946875, 1.711095, 1.227918, 0.07450981, 1, 0, 1,
-0.4926344, -0.6164111, -1.873304, 0.06666667, 1, 0, 1,
-0.4885372, 0.02289936, -1.607439, 0.0627451, 1, 0, 1,
-0.4884473, -0.7066348, -0.6725436, 0.05490196, 1, 0, 1,
-0.4871186, 0.4358149, 0.06568462, 0.05098039, 1, 0, 1,
-0.4839161, 1.402523, -0.6818119, 0.04313726, 1, 0, 1,
-0.4818754, 1.235146, 0.286799, 0.03921569, 1, 0, 1,
-0.4674697, 1.933308, -0.6496636, 0.03137255, 1, 0, 1,
-0.4665823, 1.27253, -0.04609136, 0.02745098, 1, 0, 1,
-0.4633261, 1.974091, 0.7576552, 0.01960784, 1, 0, 1,
-0.4593872, 0.9782159, 0.05721308, 0.01568628, 1, 0, 1,
-0.4526976, -0.8812398, -2.08126, 0.007843138, 1, 0, 1,
-0.4483259, 1.356104, 0.2318126, 0.003921569, 1, 0, 1,
-0.4337797, -0.2987708, -1.805532, 0, 1, 0.003921569, 1,
-0.4289308, 0.7170198, 0.4213686, 0, 1, 0.01176471, 1,
-0.4282246, -1.113628, -2.641638, 0, 1, 0.01568628, 1,
-0.425962, 0.9445034, -1.652263, 0, 1, 0.02352941, 1,
-0.4239604, -0.9858028, -3.17641, 0, 1, 0.02745098, 1,
-0.4235784, 0.2151057, -0.03322675, 0, 1, 0.03529412, 1,
-0.4193718, 0.4179523, 0.2860519, 0, 1, 0.03921569, 1,
-0.4155932, -0.3763609, -4.493514, 0, 1, 0.04705882, 1,
-0.4123441, -0.9565572, -2.261313, 0, 1, 0.05098039, 1,
-0.4110351, -0.474197, -3.636721, 0, 1, 0.05882353, 1,
-0.4103262, 0.1103065, -1.548809, 0, 1, 0.0627451, 1,
-0.409741, -1.299146, -2.832228, 0, 1, 0.07058824, 1,
-0.4064535, 0.2882708, -0.5922534, 0, 1, 0.07450981, 1,
-0.4056554, -1.531501, -3.360064, 0, 1, 0.08235294, 1,
-0.4052333, 0.01663875, -3.472303, 0, 1, 0.08627451, 1,
-0.3992016, 0.09495199, -0.7731405, 0, 1, 0.09411765, 1,
-0.3970737, -0.7618203, -4.014167, 0, 1, 0.1019608, 1,
-0.3948427, 0.08419632, -1.496042, 0, 1, 0.1058824, 1,
-0.3942704, -0.2124389, -1.227662, 0, 1, 0.1137255, 1,
-0.3934388, 2.008759, -0.7748553, 0, 1, 0.1176471, 1,
-0.386981, -0.7480318, -2.785095, 0, 1, 0.1254902, 1,
-0.38669, -0.4570486, -3.21316, 0, 1, 0.1294118, 1,
-0.3774261, -0.4767696, -1.443114, 0, 1, 0.1372549, 1,
-0.3730007, 0.6603612, -2.822734, 0, 1, 0.1411765, 1,
-0.3725498, -0.02571931, -2.945069, 0, 1, 0.1490196, 1,
-0.3703739, -0.09566232, -0.7560262, 0, 1, 0.1529412, 1,
-0.3676353, -0.7181658, -1.759381, 0, 1, 0.1607843, 1,
-0.3595506, -0.5732296, -2.733467, 0, 1, 0.1647059, 1,
-0.3594021, -1.33571, -4.839741, 0, 1, 0.172549, 1,
-0.3535663, 0.5697125, -0.06722148, 0, 1, 0.1764706, 1,
-0.3533634, -0.4069843, -4.210638, 0, 1, 0.1843137, 1,
-0.3482702, -0.9154209, -0.5953364, 0, 1, 0.1882353, 1,
-0.345422, -0.1245877, -0.9601055, 0, 1, 0.1960784, 1,
-0.3421939, -3.30527, -2.621607, 0, 1, 0.2039216, 1,
-0.3400213, -0.987306, -5.213245, 0, 1, 0.2078431, 1,
-0.3379359, 0.4906929, 1.398093, 0, 1, 0.2156863, 1,
-0.3371011, 0.6741698, -0.8870436, 0, 1, 0.2196078, 1,
-0.3319404, -0.05687575, -2.102371, 0, 1, 0.227451, 1,
-0.3317481, 0.1480766, -1.782804, 0, 1, 0.2313726, 1,
-0.3312663, 0.854575, 0.05740935, 0, 1, 0.2392157, 1,
-0.3278709, 0.8282959, -1.168299, 0, 1, 0.2431373, 1,
-0.3272543, -0.227035, -2.098866, 0, 1, 0.2509804, 1,
-0.3245746, -0.2734545, -2.326483, 0, 1, 0.254902, 1,
-0.3233294, 0.5996724, 0.1032396, 0, 1, 0.2627451, 1,
-0.3218021, -1.318492, -3.125191, 0, 1, 0.2666667, 1,
-0.3107731, 0.01348595, -1.459416, 0, 1, 0.2745098, 1,
-0.3068412, -0.4553636, -2.479604, 0, 1, 0.2784314, 1,
-0.2996536, 0.543295, 1.358324, 0, 1, 0.2862745, 1,
-0.299489, -0.2168014, -3.767203, 0, 1, 0.2901961, 1,
-0.2932268, -0.1952677, -1.106378, 0, 1, 0.2980392, 1,
-0.2862006, -0.306251, -3.218534, 0, 1, 0.3058824, 1,
-0.2845697, 0.8318022, -2.264315, 0, 1, 0.3098039, 1,
-0.2842035, -0.8657205, -6.070662, 0, 1, 0.3176471, 1,
-0.2837102, 0.593628, -0.8250793, 0, 1, 0.3215686, 1,
-0.2835262, 1.580967, -2.038715, 0, 1, 0.3294118, 1,
-0.2817841, -0.4619973, -1.742568, 0, 1, 0.3333333, 1,
-0.280081, 0.3817697, -1.654967, 0, 1, 0.3411765, 1,
-0.2777971, 0.6573563, -0.2543682, 0, 1, 0.345098, 1,
-0.2759566, -0.8662781, -2.187206, 0, 1, 0.3529412, 1,
-0.2756292, -0.2808, -1.542965, 0, 1, 0.3568628, 1,
-0.2746031, 0.902318, -0.8692287, 0, 1, 0.3647059, 1,
-0.2696276, 1.01564, 1.142634, 0, 1, 0.3686275, 1,
-0.2659268, 0.1084683, -1.193428, 0, 1, 0.3764706, 1,
-0.26415, 0.9654667, -1.471331, 0, 1, 0.3803922, 1,
-0.2607128, 0.01383433, -0.8052114, 0, 1, 0.3882353, 1,
-0.2588362, 0.2136433, -1.80334, 0, 1, 0.3921569, 1,
-0.2525339, 1.715945, 1.083445, 0, 1, 0.4, 1,
-0.2481967, 0.9206691, -0.3555378, 0, 1, 0.4078431, 1,
-0.2476561, -0.7423277, -3.224762, 0, 1, 0.4117647, 1,
-0.2471017, 0.3372141, -2.339228, 0, 1, 0.4196078, 1,
-0.245371, -0.3981452, -3.437479, 0, 1, 0.4235294, 1,
-0.2443467, -0.8164814, -2.253029, 0, 1, 0.4313726, 1,
-0.243832, -2.160027, -3.942121, 0, 1, 0.4352941, 1,
-0.2414238, 1.767957, -0.4366824, 0, 1, 0.4431373, 1,
-0.2412105, -0.487954, -1.620291, 0, 1, 0.4470588, 1,
-0.2410803, -0.4363754, -2.365956, 0, 1, 0.454902, 1,
-0.2378524, -0.2700376, -1.552512, 0, 1, 0.4588235, 1,
-0.2319417, 0.9740674, -1.31122, 0, 1, 0.4666667, 1,
-0.2290819, 2.633314, 0.4096677, 0, 1, 0.4705882, 1,
-0.228975, 0.188579, -0.6405756, 0, 1, 0.4784314, 1,
-0.2283862, -0.6289375, -2.465807, 0, 1, 0.4823529, 1,
-0.2269081, 0.8928463, -2.385527, 0, 1, 0.4901961, 1,
-0.2259682, 1.014157, 0.7828648, 0, 1, 0.4941176, 1,
-0.2230684, -0.4820688, -3.324429, 0, 1, 0.5019608, 1,
-0.2181126, 0.7285356, 0.5014596, 0, 1, 0.509804, 1,
-0.2171019, -0.3723443, -1.387144, 0, 1, 0.5137255, 1,
-0.2165009, -0.1391824, -1.479915, 0, 1, 0.5215687, 1,
-0.2109019, 0.7321403, 0.2610535, 0, 1, 0.5254902, 1,
-0.2091208, 0.7593843, 1.013297, 0, 1, 0.5333334, 1,
-0.205516, 0.07910295, -1.251769, 0, 1, 0.5372549, 1,
-0.2037621, 1.12696, 1.269331, 0, 1, 0.5450981, 1,
-0.2013388, -0.4158363, -3.648579, 0, 1, 0.5490196, 1,
-0.1961113, 0.4662514, -0.3269894, 0, 1, 0.5568628, 1,
-0.1949508, 0.02779861, -1.824359, 0, 1, 0.5607843, 1,
-0.1907129, -0.6488695, -3.525113, 0, 1, 0.5686275, 1,
-0.1901267, -0.8301628, -4.185313, 0, 1, 0.572549, 1,
-0.1867087, -0.8964118, -1.467734, 0, 1, 0.5803922, 1,
-0.1815187, -0.5670174, -0.9227486, 0, 1, 0.5843138, 1,
-0.1790452, 1.215273, 0.07715615, 0, 1, 0.5921569, 1,
-0.1753463, -0.5489941, -4.210474, 0, 1, 0.5960785, 1,
-0.1737308, 0.6757065, 0.03254663, 0, 1, 0.6039216, 1,
-0.1732536, -0.1215839, -2.837545, 0, 1, 0.6117647, 1,
-0.1721465, -0.21684, -5.041332, 0, 1, 0.6156863, 1,
-0.171114, 0.3303234, -1.503763, 0, 1, 0.6235294, 1,
-0.168927, -0.1756101, -3.575051, 0, 1, 0.627451, 1,
-0.1683533, -0.6200971, -2.208614, 0, 1, 0.6352941, 1,
-0.1651545, 0.1951787, 0.5115672, 0, 1, 0.6392157, 1,
-0.1617163, 2.280946, -0.4661312, 0, 1, 0.6470588, 1,
-0.1555642, -0.2366067, -2.536993, 0, 1, 0.6509804, 1,
-0.1485609, -0.526888, -0.6676484, 0, 1, 0.6588235, 1,
-0.1433646, -0.88489, -3.238837, 0, 1, 0.6627451, 1,
-0.1414753, -0.3115878, -2.733047, 0, 1, 0.6705883, 1,
-0.1342206, -0.8643694, -2.717906, 0, 1, 0.6745098, 1,
-0.1296427, -0.787442, -4.482683, 0, 1, 0.682353, 1,
-0.1186328, 0.9691518, 0.4358776, 0, 1, 0.6862745, 1,
-0.1166678, 1.545557, -0.2358794, 0, 1, 0.6941177, 1,
-0.114926, -0.7005979, -2.311987, 0, 1, 0.7019608, 1,
-0.1133764, 0.08283804, -1.511493, 0, 1, 0.7058824, 1,
-0.1082285, -0.7241698, -2.28841, 0, 1, 0.7137255, 1,
-0.1078427, 0.7970572, -0.02101328, 0, 1, 0.7176471, 1,
-0.106965, 1.29839, -0.1616779, 0, 1, 0.7254902, 1,
-0.1048718, 0.3005945, 0.3952216, 0, 1, 0.7294118, 1,
-0.08854152, -1.270241, -3.329299, 0, 1, 0.7372549, 1,
-0.07963815, 0.6599777, 0.2272086, 0, 1, 0.7411765, 1,
-0.07606632, -0.3315097, -1.740981, 0, 1, 0.7490196, 1,
-0.07480515, 0.2109792, -0.8001607, 0, 1, 0.7529412, 1,
-0.0669975, -0.2662933, -3.579411, 0, 1, 0.7607843, 1,
-0.0662612, -1.548849, -2.936014, 0, 1, 0.7647059, 1,
-0.06579193, 1.583762, 0.100293, 0, 1, 0.772549, 1,
-0.06312909, 1.375356, -0.6638852, 0, 1, 0.7764706, 1,
-0.06224256, 0.818307, -1.128522, 0, 1, 0.7843137, 1,
-0.05847257, -1.146024, -3.579816, 0, 1, 0.7882353, 1,
-0.05674627, 1.572405, 1.065347, 0, 1, 0.7960784, 1,
-0.05579061, -0.01374572, -1.337489, 0, 1, 0.8039216, 1,
-0.05416156, 0.5264279, 0.003171558, 0, 1, 0.8078431, 1,
-0.04985661, -0.8777696, -5.516664, 0, 1, 0.8156863, 1,
-0.04855857, -0.980727, 0.3378591, 0, 1, 0.8196079, 1,
-0.0482311, -1.124838, -2.248513, 0, 1, 0.827451, 1,
-0.04630572, -0.2594666, -3.21572, 0, 1, 0.8313726, 1,
-0.04573771, 0.2306469, 0.03531102, 0, 1, 0.8392157, 1,
-0.04119973, 0.4911005, 0.2710693, 0, 1, 0.8431373, 1,
-0.04098251, -1.049378, -3.991308, 0, 1, 0.8509804, 1,
-0.03194805, 0.7927094, -0.1938519, 0, 1, 0.854902, 1,
-0.02893235, -1.119569, -3.612561, 0, 1, 0.8627451, 1,
-0.02657847, 0.5001031, -0.2508477, 0, 1, 0.8666667, 1,
-0.02346634, -1.82361, -3.739552, 0, 1, 0.8745098, 1,
-0.02306885, -0.2940881, -2.361886, 0, 1, 0.8784314, 1,
-0.02157154, -0.2177511, -4.640837, 0, 1, 0.8862745, 1,
-0.01949402, -1.031594, -3.508087, 0, 1, 0.8901961, 1,
-0.01826387, -1.283664, -2.821834, 0, 1, 0.8980392, 1,
-0.01168737, 1.285387, -0.742851, 0, 1, 0.9058824, 1,
-0.01112975, -0.02197445, -2.584714, 0, 1, 0.9098039, 1,
-0.01049186, 1.628644, -0.8530989, 0, 1, 0.9176471, 1,
-0.006663176, -0.4928984, -4.522267, 0, 1, 0.9215686, 1,
-0.002502679, 0.8722023, -1.62756, 0, 1, 0.9294118, 1,
-0.001737824, 0.188058, -2.048024, 0, 1, 0.9333333, 1,
-0.001599876, -0.3182706, -3.131434, 0, 1, 0.9411765, 1,
0.0001326025, 0.1753228, -0.07484203, 0, 1, 0.945098, 1,
0.001564488, -0.2310433, 3.313286, 0, 1, 0.9529412, 1,
0.001675731, -0.9366103, 2.85164, 0, 1, 0.9568627, 1,
0.00212497, -0.8189426, 2.059088, 0, 1, 0.9647059, 1,
0.006563158, 0.2355841, -0.9331981, 0, 1, 0.9686275, 1,
0.008109291, -0.6590457, 3.702277, 0, 1, 0.9764706, 1,
0.01142176, -0.5368319, 2.128502, 0, 1, 0.9803922, 1,
0.0120325, 0.9783733, -0.02834588, 0, 1, 0.9882353, 1,
0.01314957, -0.8552042, 2.474465, 0, 1, 0.9921569, 1,
0.01447094, 0.1888276, -0.5056439, 0, 1, 1, 1,
0.01474031, 1.824584, -0.6437289, 0, 0.9921569, 1, 1,
0.01551297, 0.3668593, -1.312119, 0, 0.9882353, 1, 1,
0.01725655, -0.2766857, 2.348073, 0, 0.9803922, 1, 1,
0.02204835, -0.8341955, 3.628197, 0, 0.9764706, 1, 1,
0.0252805, -0.8343751, 2.991634, 0, 0.9686275, 1, 1,
0.0259129, -0.04203763, 1.89102, 0, 0.9647059, 1, 1,
0.02647664, 0.5361574, 0.2939932, 0, 0.9568627, 1, 1,
0.02828052, -1.258119, 2.130573, 0, 0.9529412, 1, 1,
0.0410713, -1.011055, 0.9170172, 0, 0.945098, 1, 1,
0.04261295, -0.2939251, 3.16385, 0, 0.9411765, 1, 1,
0.04457678, -1.754096, 3.367577, 0, 0.9333333, 1, 1,
0.04648174, 1.95489, -0.4300621, 0, 0.9294118, 1, 1,
0.046556, -1.619614, 3.033355, 0, 0.9215686, 1, 1,
0.04676727, -0.2349934, 2.442714, 0, 0.9176471, 1, 1,
0.04831385, 1.067782, -0.2751423, 0, 0.9098039, 1, 1,
0.05156892, -0.5111806, 2.159077, 0, 0.9058824, 1, 1,
0.05232876, -0.7675821, 4.25594, 0, 0.8980392, 1, 1,
0.0526753, -0.2397389, 1.867283, 0, 0.8901961, 1, 1,
0.05299345, 0.7418765, -0.6513596, 0, 0.8862745, 1, 1,
0.05553468, 1.098268, 0.3167505, 0, 0.8784314, 1, 1,
0.05982566, -0.303616, 3.734552, 0, 0.8745098, 1, 1,
0.05988564, 1.062997, -0.8151384, 0, 0.8666667, 1, 1,
0.06762441, 0.7376841, -0.5277903, 0, 0.8627451, 1, 1,
0.06772577, -0.6363413, 2.665925, 0, 0.854902, 1, 1,
0.06861155, -0.02419644, 2.755129, 0, 0.8509804, 1, 1,
0.06879459, -1.214923, 3.566096, 0, 0.8431373, 1, 1,
0.0692602, -0.1163314, 1.717372, 0, 0.8392157, 1, 1,
0.06944498, 0.8843489, 0.008464833, 0, 0.8313726, 1, 1,
0.07041052, -1.720046, 3.052607, 0, 0.827451, 1, 1,
0.07614392, -0.5654058, 3.819694, 0, 0.8196079, 1, 1,
0.07696982, -0.1597656, 1.209926, 0, 0.8156863, 1, 1,
0.08023522, -1.432212, 1.488014, 0, 0.8078431, 1, 1,
0.08189281, -0.7307822, 3.643689, 0, 0.8039216, 1, 1,
0.08379228, 0.3726997, -0.1733991, 0, 0.7960784, 1, 1,
0.08712906, -0.159716, 2.63227, 0, 0.7882353, 1, 1,
0.08917034, 0.03530524, -0.1836675, 0, 0.7843137, 1, 1,
0.09039313, 1.72683, -0.1676701, 0, 0.7764706, 1, 1,
0.09685162, -0.8949763, 3.279712, 0, 0.772549, 1, 1,
0.09951811, 1.272225, 0.2149239, 0, 0.7647059, 1, 1,
0.1022403, -0.6930256, 2.368526, 0, 0.7607843, 1, 1,
0.1044758, -1.210223, 1.617035, 0, 0.7529412, 1, 1,
0.1087821, -0.1928272, 2.996434, 0, 0.7490196, 1, 1,
0.112509, -0.09980533, 1.563028, 0, 0.7411765, 1, 1,
0.1138375, 0.05644422, 0.3933922, 0, 0.7372549, 1, 1,
0.114333, -0.4422072, 3.183393, 0, 0.7294118, 1, 1,
0.1148726, 0.8945186, 1.40375, 0, 0.7254902, 1, 1,
0.117062, -1.199272, 1.640893, 0, 0.7176471, 1, 1,
0.1177029, 1.424856, 0.7871568, 0, 0.7137255, 1, 1,
0.1231898, -1.070874, 4.262756, 0, 0.7058824, 1, 1,
0.1251133, 0.2728458, -0.7910905, 0, 0.6980392, 1, 1,
0.1270565, -0.8137931, 2.842058, 0, 0.6941177, 1, 1,
0.1293715, -1.196732, 3.644231, 0, 0.6862745, 1, 1,
0.1296822, -1.422569, 3.691732, 0, 0.682353, 1, 1,
0.1371018, -0.02789451, 2.260297, 0, 0.6745098, 1, 1,
0.1412199, 1.048944, -0.5558357, 0, 0.6705883, 1, 1,
0.1432641, -1.642132, 2.905927, 0, 0.6627451, 1, 1,
0.14395, 0.3300411, 0.7083972, 0, 0.6588235, 1, 1,
0.1441327, 0.1363917, 2.742843, 0, 0.6509804, 1, 1,
0.1445829, 0.1605216, 1.411589, 0, 0.6470588, 1, 1,
0.1505059, 0.08288024, 0.9860747, 0, 0.6392157, 1, 1,
0.1517681, -0.7042082, 1.909907, 0, 0.6352941, 1, 1,
0.1545346, 0.8793722, 1.671744, 0, 0.627451, 1, 1,
0.1550292, 0.3414963, 0.5990282, 0, 0.6235294, 1, 1,
0.157063, 0.7731237, 1.344279, 0, 0.6156863, 1, 1,
0.1609143, -0.9100203, 2.59454, 0, 0.6117647, 1, 1,
0.1631213, -0.5786259, 2.164495, 0, 0.6039216, 1, 1,
0.1667809, 1.875019, -0.8874749, 0, 0.5960785, 1, 1,
0.1711904, 0.07716364, 0.7658255, 0, 0.5921569, 1, 1,
0.172619, 1.088673, -0.6854734, 0, 0.5843138, 1, 1,
0.1732602, 1.429855, -0.3859048, 0, 0.5803922, 1, 1,
0.1745661, -0.9659369, 2.704546, 0, 0.572549, 1, 1,
0.1768316, -0.4085664, 2.379185, 0, 0.5686275, 1, 1,
0.1814317, 0.4881226, -1.342645, 0, 0.5607843, 1, 1,
0.1835558, -0.731609, 3.683521, 0, 0.5568628, 1, 1,
0.1837555, -0.7881861, 2.687373, 0, 0.5490196, 1, 1,
0.1902449, -0.3725297, 2.381785, 0, 0.5450981, 1, 1,
0.1909355, -0.008735555, 1.519299, 0, 0.5372549, 1, 1,
0.1974611, 0.832457, -0.6017717, 0, 0.5333334, 1, 1,
0.2029627, -2.128614, 1.573551, 0, 0.5254902, 1, 1,
0.2049674, 0.6935988, 0.9100682, 0, 0.5215687, 1, 1,
0.2150366, -0.494545, 3.250084, 0, 0.5137255, 1, 1,
0.2186113, -0.359214, 2.705234, 0, 0.509804, 1, 1,
0.2190327, -1.802294, 3.495015, 0, 0.5019608, 1, 1,
0.2194923, 0.07868488, 1.940084, 0, 0.4941176, 1, 1,
0.2198638, 2.122412, 0.6909407, 0, 0.4901961, 1, 1,
0.2206124, -0.4082717, 1.261084, 0, 0.4823529, 1, 1,
0.2208354, 0.4109071, -0.0284449, 0, 0.4784314, 1, 1,
0.2234091, 0.4393735, 0.00267654, 0, 0.4705882, 1, 1,
0.2273373, -2.355809, 2.334883, 0, 0.4666667, 1, 1,
0.228771, -0.6425849, 0.6489799, 0, 0.4588235, 1, 1,
0.2292666, 0.02480894, 1.247982, 0, 0.454902, 1, 1,
0.2334832, 1.313556, 2.555199, 0, 0.4470588, 1, 1,
0.2403867, -0.9728855, 2.296547, 0, 0.4431373, 1, 1,
0.2409204, -0.2920746, 2.222963, 0, 0.4352941, 1, 1,
0.2474846, -0.0196272, 1.645425, 0, 0.4313726, 1, 1,
0.2475431, 0.05926822, -0.03454672, 0, 0.4235294, 1, 1,
0.2475892, -0.08173187, 0.7815765, 0, 0.4196078, 1, 1,
0.2487027, 0.8809999, 1.768663, 0, 0.4117647, 1, 1,
0.252912, 0.641699, -0.3295855, 0, 0.4078431, 1, 1,
0.2561359, 0.1702565, 0.6560567, 0, 0.4, 1, 1,
0.2634947, -1.965921, 2.285136, 0, 0.3921569, 1, 1,
0.2686781, 1.26195, -0.7020823, 0, 0.3882353, 1, 1,
0.2690564, -1.337358, 3.149712, 0, 0.3803922, 1, 1,
0.2696726, -1.192767, 3.448809, 0, 0.3764706, 1, 1,
0.270524, -0.7629927, 4.078205, 0, 0.3686275, 1, 1,
0.2719988, 0.1539891, 1.538768, 0, 0.3647059, 1, 1,
0.2726893, -2.501092, 3.389304, 0, 0.3568628, 1, 1,
0.2778321, 1.131174, 0.5041857, 0, 0.3529412, 1, 1,
0.2868178, -0.8137668, 2.879104, 0, 0.345098, 1, 1,
0.2893805, 0.06847042, 0.9034891, 0, 0.3411765, 1, 1,
0.2978493, -0.3628743, 2.503547, 0, 0.3333333, 1, 1,
0.3000686, -1.373494, 2.309339, 0, 0.3294118, 1, 1,
0.3030742, -1.062699, 2.848805, 0, 0.3215686, 1, 1,
0.3047395, 0.7442358, 1.663449, 0, 0.3176471, 1, 1,
0.3078386, -0.1448305, 1.168644, 0, 0.3098039, 1, 1,
0.3086729, 0.9647093, 0.3895, 0, 0.3058824, 1, 1,
0.3095041, -0.7536463, 3.987274, 0, 0.2980392, 1, 1,
0.3104777, -0.2040554, 2.924574, 0, 0.2901961, 1, 1,
0.3113664, 0.5320703, -0.3239453, 0, 0.2862745, 1, 1,
0.3124009, -0.1130111, 1.411777, 0, 0.2784314, 1, 1,
0.3149692, 1.655302, -0.004720317, 0, 0.2745098, 1, 1,
0.3162743, 0.4489071, -0.6730845, 0, 0.2666667, 1, 1,
0.3185351, 0.2695279, 0.7641296, 0, 0.2627451, 1, 1,
0.3204891, -1.365035, 4.21484, 0, 0.254902, 1, 1,
0.321039, 0.7868242, -0.3782783, 0, 0.2509804, 1, 1,
0.322807, -1.723077, 2.252187, 0, 0.2431373, 1, 1,
0.3375207, 0.3997577, 2.224103, 0, 0.2392157, 1, 1,
0.3409285, -1.922755, 2.653368, 0, 0.2313726, 1, 1,
0.3473648, 0.04154303, 2.419152, 0, 0.227451, 1, 1,
0.3528963, -0.2195685, 4.16785, 0, 0.2196078, 1, 1,
0.3595433, 0.7510528, 0.1716657, 0, 0.2156863, 1, 1,
0.3595912, -0.742379, 1.881682, 0, 0.2078431, 1, 1,
0.3641954, -0.3845419, 2.378578, 0, 0.2039216, 1, 1,
0.369775, 1.414998, 1.450019, 0, 0.1960784, 1, 1,
0.3704952, -2.04991, 5.268947, 0, 0.1882353, 1, 1,
0.3772985, 0.8157601, 1.923628, 0, 0.1843137, 1, 1,
0.3789853, 0.01706138, -1.349853, 0, 0.1764706, 1, 1,
0.3792359, -0.3848916, 2.245248, 0, 0.172549, 1, 1,
0.3820232, -1.391529, 1.655367, 0, 0.1647059, 1, 1,
0.382031, -0.02134215, 1.723619, 0, 0.1607843, 1, 1,
0.3827814, 0.1532498, 0.4301151, 0, 0.1529412, 1, 1,
0.3836281, 2.102347, -1.120181, 0, 0.1490196, 1, 1,
0.383906, -0.557431, 2.91187, 0, 0.1411765, 1, 1,
0.3852848, -0.2253189, 3.382165, 0, 0.1372549, 1, 1,
0.3942258, -1.395505, 2.501089, 0, 0.1294118, 1, 1,
0.3984372, -0.03060806, 2.357806, 0, 0.1254902, 1, 1,
0.3999503, -1.248134, 4.017119, 0, 0.1176471, 1, 1,
0.4061839, -1.621358, 3.190492, 0, 0.1137255, 1, 1,
0.4067473, -0.7209223, 2.178837, 0, 0.1058824, 1, 1,
0.4082084, -1.829477, 3.150461, 0, 0.09803922, 1, 1,
0.4087685, 0.7600518, 1.277628, 0, 0.09411765, 1, 1,
0.4133749, 1.761515, -0.7340077, 0, 0.08627451, 1, 1,
0.4139943, 0.8928685, 1.860701, 0, 0.08235294, 1, 1,
0.4151104, 1.953163, 0.2510929, 0, 0.07450981, 1, 1,
0.4177383, -0.7149715, 1.920624, 0, 0.07058824, 1, 1,
0.4188384, -0.9309523, 3.068387, 0, 0.0627451, 1, 1,
0.4228709, 1.009654, -0.1495219, 0, 0.05882353, 1, 1,
0.4295063, -0.868578, 0.2013005, 0, 0.05098039, 1, 1,
0.429741, -0.7536231, 3.380832, 0, 0.04705882, 1, 1,
0.4334502, -1.508693, 3.041384, 0, 0.03921569, 1, 1,
0.4393168, 0.698905, 1.711041, 0, 0.03529412, 1, 1,
0.4418142, -1.16329, 2.785821, 0, 0.02745098, 1, 1,
0.4441171, 1.119115, 0.8344484, 0, 0.02352941, 1, 1,
0.4458531, -1.309237, 2.690435, 0, 0.01568628, 1, 1,
0.4472925, -0.9076048, 2.454115, 0, 0.01176471, 1, 1,
0.44971, -0.7100983, 0.9810561, 0, 0.003921569, 1, 1,
0.4547572, -0.09385235, 0.5446385, 0.003921569, 0, 1, 1,
0.4586754, -1.718673, 2.921269, 0.007843138, 0, 1, 1,
0.4613054, -0.5155906, 3.30835, 0.01568628, 0, 1, 1,
0.4654465, 0.3964604, 1.022421, 0.01960784, 0, 1, 1,
0.4695926, -2.390787, 3.078023, 0.02745098, 0, 1, 1,
0.4742268, 0.2902783, 0.4592811, 0.03137255, 0, 1, 1,
0.4769388, -0.3721933, 2.343125, 0.03921569, 0, 1, 1,
0.4819272, -0.6739715, 2.096725, 0.04313726, 0, 1, 1,
0.4846244, -0.7794893, 3.377662, 0.05098039, 0, 1, 1,
0.4862335, 3.411857, 0.557051, 0.05490196, 0, 1, 1,
0.4904284, 0.2585332, 2.274923, 0.0627451, 0, 1, 1,
0.4933506, -0.2032928, 4.223636, 0.06666667, 0, 1, 1,
0.4948069, 0.5984914, 3.444585, 0.07450981, 0, 1, 1,
0.495864, -0.6996374, 2.469616, 0.07843138, 0, 1, 1,
0.4985899, -0.1608776, 2.68003, 0.08627451, 0, 1, 1,
0.5040976, -0.2246729, 1.648475, 0.09019608, 0, 1, 1,
0.5053797, -0.3391406, 3.961976, 0.09803922, 0, 1, 1,
0.5165313, -0.1185169, 1.136023, 0.1058824, 0, 1, 1,
0.5191436, 0.1140245, 1.981088, 0.1098039, 0, 1, 1,
0.5212408, -0.5171663, 1.74162, 0.1176471, 0, 1, 1,
0.5219478, 0.3323495, 0.3035628, 0.1215686, 0, 1, 1,
0.5250248, -2.750685, 3.999099, 0.1294118, 0, 1, 1,
0.5303785, 0.7461903, -0.1465559, 0.1333333, 0, 1, 1,
0.5305163, 0.03083246, 2.181312, 0.1411765, 0, 1, 1,
0.5346754, 0.09078971, 2.72463, 0.145098, 0, 1, 1,
0.5353585, 1.506025, -0.6642524, 0.1529412, 0, 1, 1,
0.5410921, 0.09898082, 0.2889929, 0.1568628, 0, 1, 1,
0.5411442, -1.237615, 1.19405, 0.1647059, 0, 1, 1,
0.5462914, -1.045209, 2.632889, 0.1686275, 0, 1, 1,
0.5466397, -0.974058, 3.011465, 0.1764706, 0, 1, 1,
0.547271, 1.661007, 0.3324928, 0.1803922, 0, 1, 1,
0.547487, 0.377507, 1.305871, 0.1882353, 0, 1, 1,
0.5493927, 0.1207419, 0.1771313, 0.1921569, 0, 1, 1,
0.5496694, 1.038029, 0.6567844, 0.2, 0, 1, 1,
0.5514671, 1.146122, 0.8470431, 0.2078431, 0, 1, 1,
0.5515098, 3.128845, 0.8802744, 0.2117647, 0, 1, 1,
0.5517199, 0.2032553, 0.896245, 0.2196078, 0, 1, 1,
0.5525064, 0.4692807, 1.80323, 0.2235294, 0, 1, 1,
0.5564811, -1.709468, 3.380754, 0.2313726, 0, 1, 1,
0.5625598, 2.564868, 0.5128288, 0.2352941, 0, 1, 1,
0.5693943, -1.883881, 2.414509, 0.2431373, 0, 1, 1,
0.5713463, 0.1859303, 1.700416, 0.2470588, 0, 1, 1,
0.5749274, 2.175504, -0.7479845, 0.254902, 0, 1, 1,
0.5761842, -0.6131047, 2.33361, 0.2588235, 0, 1, 1,
0.5775182, 0.6067112, 2.059948, 0.2666667, 0, 1, 1,
0.5816522, -1.318294, 3.212986, 0.2705882, 0, 1, 1,
0.5861065, -0.7455011, 1.281623, 0.2784314, 0, 1, 1,
0.5951938, -1.972567, 2.662877, 0.282353, 0, 1, 1,
0.6002721, -0.3419198, 4.450263, 0.2901961, 0, 1, 1,
0.6025035, 0.4658443, 0.5121344, 0.2941177, 0, 1, 1,
0.6055441, -1.052909, 1.894443, 0.3019608, 0, 1, 1,
0.6066713, -1.301019, 3.37849, 0.3098039, 0, 1, 1,
0.6069849, 0.8287843, -0.08831386, 0.3137255, 0, 1, 1,
0.607703, -0.08179302, 2.008986, 0.3215686, 0, 1, 1,
0.6113289, 0.7595891, -1.100237, 0.3254902, 0, 1, 1,
0.6153818, 0.9930117, 0.9715881, 0.3333333, 0, 1, 1,
0.6212881, -0.2947859, 2.944971, 0.3372549, 0, 1, 1,
0.6288264, -0.2767709, 2.689996, 0.345098, 0, 1, 1,
0.6338673, -0.09935939, 2.615876, 0.3490196, 0, 1, 1,
0.6391312, 0.07539257, 1.284458, 0.3568628, 0, 1, 1,
0.6397979, 2.370079, 2.061451, 0.3607843, 0, 1, 1,
0.6436554, -0.3075241, 4.174242, 0.3686275, 0, 1, 1,
0.6499795, -1.237668, 1.491286, 0.372549, 0, 1, 1,
0.6503609, 0.08749141, 1.734767, 0.3803922, 0, 1, 1,
0.6569289, -1.32352, 2.791373, 0.3843137, 0, 1, 1,
0.6586125, 1.061209, -0.3103313, 0.3921569, 0, 1, 1,
0.6600325, 1.048444, 0.459013, 0.3960784, 0, 1, 1,
0.6652136, -1.031624, 4.096417, 0.4039216, 0, 1, 1,
0.6679525, 0.3502022, 1.172663, 0.4117647, 0, 1, 1,
0.6694434, -0.1051958, 0.06955563, 0.4156863, 0, 1, 1,
0.6708307, -0.2943076, 2.430805, 0.4235294, 0, 1, 1,
0.6718026, -0.06107628, 0.178698, 0.427451, 0, 1, 1,
0.6729404, -2.3501, 2.390663, 0.4352941, 0, 1, 1,
0.6831676, 0.1943123, -0.7870204, 0.4392157, 0, 1, 1,
0.6835146, -0.5921851, 0.5911631, 0.4470588, 0, 1, 1,
0.6836982, 0.3264978, 0.3365079, 0.4509804, 0, 1, 1,
0.6881424, -0.4680133, 2.785243, 0.4588235, 0, 1, 1,
0.6892624, 0.6879222, 0.7064728, 0.4627451, 0, 1, 1,
0.6911787, -0.4579784, 2.069208, 0.4705882, 0, 1, 1,
0.6956578, -1.60441, -0.1050528, 0.4745098, 0, 1, 1,
0.6961428, -0.2009478, 1.606714, 0.4823529, 0, 1, 1,
0.6987564, -1.87507, 2.963274, 0.4862745, 0, 1, 1,
0.7013939, 0.7843086, 1.773839, 0.4941176, 0, 1, 1,
0.7021459, -1.095786, 1.687128, 0.5019608, 0, 1, 1,
0.7051328, -0.08586848, 2.723468, 0.5058824, 0, 1, 1,
0.7078533, 0.8668664, 0.153265, 0.5137255, 0, 1, 1,
0.7082554, -0.07734297, 1.229112, 0.5176471, 0, 1, 1,
0.7130148, -1.359695, 1.853477, 0.5254902, 0, 1, 1,
0.7145631, 0.1274423, 2.6626, 0.5294118, 0, 1, 1,
0.7182029, -0.441687, 2.840876, 0.5372549, 0, 1, 1,
0.7197399, 1.790175, -1.317331, 0.5411765, 0, 1, 1,
0.7201413, -1.060218, 3.400146, 0.5490196, 0, 1, 1,
0.7221655, -0.2514919, 0.7171603, 0.5529412, 0, 1, 1,
0.7239251, 0.1151682, 1.745736, 0.5607843, 0, 1, 1,
0.7309188, 0.20729, 1.102589, 0.5647059, 0, 1, 1,
0.7312647, 0.7548872, -1.993, 0.572549, 0, 1, 1,
0.7318756, -0.8556472, 1.13048, 0.5764706, 0, 1, 1,
0.7392492, 0.6114633, 1.574274, 0.5843138, 0, 1, 1,
0.7422283, 0.2264948, 2.367335, 0.5882353, 0, 1, 1,
0.7443094, 0.7372237, 2.182814, 0.5960785, 0, 1, 1,
0.7489279, 2.209914, 1.531462, 0.6039216, 0, 1, 1,
0.7537936, -0.4686333, 3.15432, 0.6078432, 0, 1, 1,
0.7547691, 0.5482854, 2.183091, 0.6156863, 0, 1, 1,
0.7585463, 0.4812084, 1.631858, 0.6196079, 0, 1, 1,
0.7713307, 0.4284053, 0.5204673, 0.627451, 0, 1, 1,
0.7762104, -1.354651, 1.156607, 0.6313726, 0, 1, 1,
0.779707, -0.09941643, 1.737774, 0.6392157, 0, 1, 1,
0.7861148, 1.107137, 0.8184112, 0.6431373, 0, 1, 1,
0.7913074, -0.6481228, 1.177814, 0.6509804, 0, 1, 1,
0.7929662, -0.9815519, 4.008085, 0.654902, 0, 1, 1,
0.7931927, 0.1618197, 1.912585, 0.6627451, 0, 1, 1,
0.7934126, -1.022275, 3.747849, 0.6666667, 0, 1, 1,
0.7976572, 1.222751, 1.374425, 0.6745098, 0, 1, 1,
0.7981992, -0.4446421, 0.371982, 0.6784314, 0, 1, 1,
0.7991132, 0.792465, 2.064149, 0.6862745, 0, 1, 1,
0.802255, 0.89001, 1.915187, 0.6901961, 0, 1, 1,
0.8053403, -1.21642, 0.880645, 0.6980392, 0, 1, 1,
0.807825, 0.2097579, 1.685567, 0.7058824, 0, 1, 1,
0.80849, 0.0822592, 2.87133, 0.7098039, 0, 1, 1,
0.8131465, 0.2597464, 2.463516, 0.7176471, 0, 1, 1,
0.8149861, 0.9966424, 2.304353, 0.7215686, 0, 1, 1,
0.8182638, 0.4318152, 2.541873, 0.7294118, 0, 1, 1,
0.8196169, -0.04881142, 2.124615, 0.7333333, 0, 1, 1,
0.8197778, 0.932402, 0.6816643, 0.7411765, 0, 1, 1,
0.8216509, 0.8222567, 1.278193, 0.7450981, 0, 1, 1,
0.8237903, -0.05587655, 2.203614, 0.7529412, 0, 1, 1,
0.8278843, 0.1844749, 1.986082, 0.7568628, 0, 1, 1,
0.8299449, 1.200871, 1.141943, 0.7647059, 0, 1, 1,
0.8332654, 1.694054, 2.01564, 0.7686275, 0, 1, 1,
0.8385864, 0.5419874, -0.7249046, 0.7764706, 0, 1, 1,
0.8409785, 0.5614839, 1.419709, 0.7803922, 0, 1, 1,
0.8455965, -1.13052, 0.1990815, 0.7882353, 0, 1, 1,
0.8500149, -1.416036, 3.053626, 0.7921569, 0, 1, 1,
0.8511919, 0.297837, 1.439378, 0.8, 0, 1, 1,
0.8544388, -0.7445205, 2.935091, 0.8078431, 0, 1, 1,
0.8558658, 0.5010933, 0.6153707, 0.8117647, 0, 1, 1,
0.8561822, -2.025183, 1.811049, 0.8196079, 0, 1, 1,
0.8594404, -0.4690159, 1.226805, 0.8235294, 0, 1, 1,
0.8656229, -1.669684, 3.82897, 0.8313726, 0, 1, 1,
0.8895519, -0.469237, 0.5251769, 0.8352941, 0, 1, 1,
0.8907189, -0.2222486, 2.527289, 0.8431373, 0, 1, 1,
0.8922172, -0.7514353, 0.9362635, 0.8470588, 0, 1, 1,
0.9007246, 1.974386, 0.9050587, 0.854902, 0, 1, 1,
0.900833, 0.118211, 1.621479, 0.8588235, 0, 1, 1,
0.9053911, 1.077577, 0.073105, 0.8666667, 0, 1, 1,
0.9178292, 1.854034, -0.9487582, 0.8705882, 0, 1, 1,
0.9234686, -0.8512543, 0.9635097, 0.8784314, 0, 1, 1,
0.9247148, 0.3617271, 2.675152, 0.8823529, 0, 1, 1,
0.9263938, -1.503245, 2.005111, 0.8901961, 0, 1, 1,
0.9304529, -0.9378271, 3.026909, 0.8941177, 0, 1, 1,
0.9412452, -0.8793359, 3.729847, 0.9019608, 0, 1, 1,
0.9456314, -0.0573268, 0.6869566, 0.9098039, 0, 1, 1,
0.9469738, -1.076617, 3.289647, 0.9137255, 0, 1, 1,
0.9470411, 0.002143222, 1.609609, 0.9215686, 0, 1, 1,
0.9481175, -0.1284298, 1.865722, 0.9254902, 0, 1, 1,
0.9573467, 0.573236, 0.8591589, 0.9333333, 0, 1, 1,
0.9609542, -0.7242898, 2.671527, 0.9372549, 0, 1, 1,
0.9743344, 0.03020317, 1.639957, 0.945098, 0, 1, 1,
0.9781595, 0.8000876, 2.65468, 0.9490196, 0, 1, 1,
0.9818148, 0.6403688, 1.490785, 0.9568627, 0, 1, 1,
0.9823373, 0.2308845, 1.593813, 0.9607843, 0, 1, 1,
0.9874462, 0.5517362, 1.243381, 0.9686275, 0, 1, 1,
0.989713, 0.3626477, -0.9606439, 0.972549, 0, 1, 1,
0.9931041, 1.130047, 0.8537268, 0.9803922, 0, 1, 1,
0.994901, 1.102318, 1.631956, 0.9843137, 0, 1, 1,
0.9965647, 0.278464, 1.554348, 0.9921569, 0, 1, 1,
0.9974925, 0.8044931, -0.4056975, 0.9960784, 0, 1, 1,
0.999559, -0.1442656, 1.845245, 1, 0, 0.9960784, 1,
1.004953, 0.7484692, 1.32956, 1, 0, 0.9882353, 1,
1.006167, 1.096536, 1.720693, 1, 0, 0.9843137, 1,
1.013712, 2.300801, 3.315808, 1, 0, 0.9764706, 1,
1.016576, -1.063938, 4.327724, 1, 0, 0.972549, 1,
1.023324, -0.1207068, 2.63368, 1, 0, 0.9647059, 1,
1.030248, 0.6691503, -0.06031831, 1, 0, 0.9607843, 1,
1.0355, 0.5896397, 0.5641624, 1, 0, 0.9529412, 1,
1.037179, -0.477462, 2.639101, 1, 0, 0.9490196, 1,
1.037936, 1.445109, 2.636251, 1, 0, 0.9411765, 1,
1.037956, 1.026178, 0.03498038, 1, 0, 0.9372549, 1,
1.037999, 1.274736, 2.074688, 1, 0, 0.9294118, 1,
1.0439, 0.5452992, 1.954411, 1, 0, 0.9254902, 1,
1.051287, 0.1694598, 0.678537, 1, 0, 0.9176471, 1,
1.052775, 0.305015, 1.705136, 1, 0, 0.9137255, 1,
1.057124, 0.10713, 1.986304, 1, 0, 0.9058824, 1,
1.06658, 1.258708, 0.6099193, 1, 0, 0.9019608, 1,
1.070228, 1.073509, 0.3166625, 1, 0, 0.8941177, 1,
1.072978, 0.8775797, 0.832448, 1, 0, 0.8862745, 1,
1.082049, 1.333512, 2.009164, 1, 0, 0.8823529, 1,
1.089391, 2.185869, 0.3024648, 1, 0, 0.8745098, 1,
1.095199, -0.6024387, 2.896863, 1, 0, 0.8705882, 1,
1.10033, 1.619141, 2.922398, 1, 0, 0.8627451, 1,
1.102525, -0.7627725, 2.697982, 1, 0, 0.8588235, 1,
1.104893, -1.348064, 4.144139, 1, 0, 0.8509804, 1,
1.106184, -0.3817372, 2.230199, 1, 0, 0.8470588, 1,
1.111807, 1.184682, 0.4025615, 1, 0, 0.8392157, 1,
1.113114, -0.4581389, 0.0882435, 1, 0, 0.8352941, 1,
1.114613, 0.9269835, 1.468461, 1, 0, 0.827451, 1,
1.114929, -0.4987701, 2.39361, 1, 0, 0.8235294, 1,
1.121408, -1.053705, 0.9992628, 1, 0, 0.8156863, 1,
1.124239, -1.193443, 1.410958, 1, 0, 0.8117647, 1,
1.124942, 0.7128674, 0.9532664, 1, 0, 0.8039216, 1,
1.127845, 1.852374, -0.3202178, 1, 0, 0.7960784, 1,
1.133729, 0.9075248, 0.7694578, 1, 0, 0.7921569, 1,
1.136563, -1.656286, 1.023337, 1, 0, 0.7843137, 1,
1.137865, 0.9748121, 2.740286, 1, 0, 0.7803922, 1,
1.148332, -1.333631, 3.767709, 1, 0, 0.772549, 1,
1.151407, -0.6396781, 2.737891, 1, 0, 0.7686275, 1,
1.151507, 1.265819, -0.5734745, 1, 0, 0.7607843, 1,
1.157487, 0.5186738, 0.620975, 1, 0, 0.7568628, 1,
1.162113, -0.605527, 0.994898, 1, 0, 0.7490196, 1,
1.170864, -1.085064, 3.611485, 1, 0, 0.7450981, 1,
1.177484, 0.5516881, -0.7721133, 1, 0, 0.7372549, 1,
1.181558, -1.281307, 3.53414, 1, 0, 0.7333333, 1,
1.185472, -1.817822, 1.800626, 1, 0, 0.7254902, 1,
1.189798, -1.152904, 2.008307, 1, 0, 0.7215686, 1,
1.191734, -0.6564814, 1.298232, 1, 0, 0.7137255, 1,
1.199409, 0.2808271, 2.921265, 1, 0, 0.7098039, 1,
1.204835, -0.7836784, 1.121113, 1, 0, 0.7019608, 1,
1.208463, 1.362467, 0.8132831, 1, 0, 0.6941177, 1,
1.210629, -2.347547, 2.431361, 1, 0, 0.6901961, 1,
1.214403, -0.3551908, 1.070853, 1, 0, 0.682353, 1,
1.218494, 0.3907749, 0.1185846, 1, 0, 0.6784314, 1,
1.226582, 0.9311876, 0.6015446, 1, 0, 0.6705883, 1,
1.226864, -0.77968, 3.220016, 1, 0, 0.6666667, 1,
1.23006, 1.226795, 1.529524, 1, 0, 0.6588235, 1,
1.232192, 0.959092, -0.3544613, 1, 0, 0.654902, 1,
1.23358, 0.5761759, -0.5265229, 1, 0, 0.6470588, 1,
1.242766, -0.7419054, 2.468553, 1, 0, 0.6431373, 1,
1.250435, 0.6221083, 2.366136, 1, 0, 0.6352941, 1,
1.256393, 0.315817, 0.8113065, 1, 0, 0.6313726, 1,
1.261939, -1.503544, 3.467588, 1, 0, 0.6235294, 1,
1.264379, 0.9995495, 1.82394, 1, 0, 0.6196079, 1,
1.278946, 1.646213, 0.8288653, 1, 0, 0.6117647, 1,
1.280075, -0.7482756, 3.678198, 1, 0, 0.6078432, 1,
1.284785, 0.1474354, 0.7665715, 1, 0, 0.6, 1,
1.285372, 0.1968303, 0.8715004, 1, 0, 0.5921569, 1,
1.306541, -0.3180591, 2.10103, 1, 0, 0.5882353, 1,
1.310089, -1.219627, 2.105908, 1, 0, 0.5803922, 1,
1.319391, -0.1333013, 1.619617, 1, 0, 0.5764706, 1,
1.329746, -1.609785, 1.52413, 1, 0, 0.5686275, 1,
1.335725, 0.5165265, 0.2667362, 1, 0, 0.5647059, 1,
1.342141, -0.2256221, 0.2242474, 1, 0, 0.5568628, 1,
1.349563, -0.2377074, 1.848544, 1, 0, 0.5529412, 1,
1.349969, -1.788164, 1.620425, 1, 0, 0.5450981, 1,
1.36327, -1.265265, 1.655992, 1, 0, 0.5411765, 1,
1.366242, 0.5965095, 1.938566, 1, 0, 0.5333334, 1,
1.387823, -0.6930827, 0.8258797, 1, 0, 0.5294118, 1,
1.402878, -2.288115, 1.163905, 1, 0, 0.5215687, 1,
1.404361, 0.1362167, -0.06495895, 1, 0, 0.5176471, 1,
1.404693, 1.576969, 0.3852738, 1, 0, 0.509804, 1,
1.423537, 0.4372088, 0.9476821, 1, 0, 0.5058824, 1,
1.432173, -0.6399409, 0.253801, 1, 0, 0.4980392, 1,
1.433554, -0.3000477, 2.44793, 1, 0, 0.4901961, 1,
1.440292, 0.8883291, 0.2513493, 1, 0, 0.4862745, 1,
1.445462, 1.612547, 1.115206, 1, 0, 0.4784314, 1,
1.446509, 2.296319, 0.2500688, 1, 0, 0.4745098, 1,
1.449463, -0.2931453, 1.778338, 1, 0, 0.4666667, 1,
1.453123, 0.56875, 1.962384, 1, 0, 0.4627451, 1,
1.460631, 0.6312643, 2.095047, 1, 0, 0.454902, 1,
1.465266, 0.3164949, 1.017404, 1, 0, 0.4509804, 1,
1.493272, 1.361434, 0.3678623, 1, 0, 0.4431373, 1,
1.496162, -1.17569, 0.2650143, 1, 0, 0.4392157, 1,
1.523362, -0.81831, 3.303867, 1, 0, 0.4313726, 1,
1.536894, 0.1436149, 0.8114225, 1, 0, 0.427451, 1,
1.543149, 0.5864261, 0.3204628, 1, 0, 0.4196078, 1,
1.555059, 0.1117705, 0.05803703, 1, 0, 0.4156863, 1,
1.558502, -0.2777844, 3.608954, 1, 0, 0.4078431, 1,
1.564598, 0.3979388, 0.3273243, 1, 0, 0.4039216, 1,
1.574579, -0.7363118, 2.979772, 1, 0, 0.3960784, 1,
1.576266, -0.9033384, 1.401027, 1, 0, 0.3882353, 1,
1.576447, -0.9828321, 2.562235, 1, 0, 0.3843137, 1,
1.578392, 1.473695, 1.219273, 1, 0, 0.3764706, 1,
1.579128, 0.1583195, 0.2466556, 1, 0, 0.372549, 1,
1.586361, 1.037016, -0.1605553, 1, 0, 0.3647059, 1,
1.586712, -0.6336303, 2.269847, 1, 0, 0.3607843, 1,
1.589946, 0.7642976, 0.7568559, 1, 0, 0.3529412, 1,
1.595191, -0.4592843, 1.210607, 1, 0, 0.3490196, 1,
1.596009, -0.5030773, 1.979917, 1, 0, 0.3411765, 1,
1.614703, -0.5344742, 0.7655589, 1, 0, 0.3372549, 1,
1.615081, 0.1936748, 3.837178, 1, 0, 0.3294118, 1,
1.645897, 1.765877, 1.711879, 1, 0, 0.3254902, 1,
1.655014, 0.6596527, 1.688344, 1, 0, 0.3176471, 1,
1.655653, 0.7957728, 2.79302, 1, 0, 0.3137255, 1,
1.67635, -0.5623509, 2.15172, 1, 0, 0.3058824, 1,
1.688297, 0.292526, 0.6354575, 1, 0, 0.2980392, 1,
1.695253, 0.9266305, 1.238374, 1, 0, 0.2941177, 1,
1.700319, -1.478982, 3.291214, 1, 0, 0.2862745, 1,
1.703734, -0.7261268, 1.63512, 1, 0, 0.282353, 1,
1.713661, -0.7652602, 2.711395, 1, 0, 0.2745098, 1,
1.71527, -1.580075, 0.6669008, 1, 0, 0.2705882, 1,
1.720931, -1.417316, 3.317265, 1, 0, 0.2627451, 1,
1.733264, -1.20226, 3.602705, 1, 0, 0.2588235, 1,
1.745907, 1.061645, 0.4827609, 1, 0, 0.2509804, 1,
1.75123, 1.072301, -0.1449523, 1, 0, 0.2470588, 1,
1.765782, -0.6943101, 2.8439, 1, 0, 0.2392157, 1,
1.778627, -1.620988, 2.834357, 1, 0, 0.2352941, 1,
1.78416, -1.072758, 1.966643, 1, 0, 0.227451, 1,
1.785081, 0.4952431, 0.5444148, 1, 0, 0.2235294, 1,
1.801979, -1.776507, 2.908964, 1, 0, 0.2156863, 1,
1.807664, -0.664597, 1.952342, 1, 0, 0.2117647, 1,
1.811948, -0.421993, 2.994898, 1, 0, 0.2039216, 1,
1.830691, -0.572868, 1.363293, 1, 0, 0.1960784, 1,
1.842259, 0.3191144, 1.585435, 1, 0, 0.1921569, 1,
1.853439, -0.5959942, 1.881762, 1, 0, 0.1843137, 1,
1.879059, 1.844164, 1.290269, 1, 0, 0.1803922, 1,
1.889603, -0.4644887, 3.594309, 1, 0, 0.172549, 1,
1.890427, -0.338331, 3.625917, 1, 0, 0.1686275, 1,
1.892226, -0.00899049, 1.253183, 1, 0, 0.1607843, 1,
1.900657, -0.6419297, 0.7541075, 1, 0, 0.1568628, 1,
1.901174, 0.4346161, 1.072095, 1, 0, 0.1490196, 1,
1.915047, 1.833196, 0.6863956, 1, 0, 0.145098, 1,
1.917849, -1.53316, 2.140901, 1, 0, 0.1372549, 1,
1.951029, 0.01164397, 2.300761, 1, 0, 0.1333333, 1,
1.95675, -0.9861239, 1.516918, 1, 0, 0.1254902, 1,
1.966433, 1.342542, -0.4479679, 1, 0, 0.1215686, 1,
1.980269, -1.28648, 3.175602, 1, 0, 0.1137255, 1,
2.0014, 0.03662438, 2.535173, 1, 0, 0.1098039, 1,
2.005025, -0.1559786, 3.237672, 1, 0, 0.1019608, 1,
2.018699, 0.7286614, 0.6777584, 1, 0, 0.09411765, 1,
2.052073, 1.241935, 2.133179, 1, 0, 0.09019608, 1,
2.072581, -0.1602685, 0.7307571, 1, 0, 0.08235294, 1,
2.072791, -0.4206011, 0.1113133, 1, 0, 0.07843138, 1,
2.109116, 1.137195, 0.8240103, 1, 0, 0.07058824, 1,
2.151862, 0.2075912, 1.848915, 1, 0, 0.06666667, 1,
2.159986, 0.07987215, 1.004542, 1, 0, 0.05882353, 1,
2.160227, -1.433813, 2.06301, 1, 0, 0.05490196, 1,
2.252392, -0.7051899, 1.971386, 1, 0, 0.04705882, 1,
2.340364, -0.09144073, 2.934695, 1, 0, 0.04313726, 1,
2.387937, -2.434019, 4.610919, 1, 0, 0.03529412, 1,
2.67764, 0.02530272, 3.561178, 1, 0, 0.03137255, 1,
2.681948, 0.7483163, -1.194241, 1, 0, 0.02352941, 1,
2.729446, 0.7140316, -0.129391, 1, 0, 0.01960784, 1,
2.779278, -0.9252884, 2.926281, 1, 0, 0.01176471, 1,
3.113195, -0.7989666, 0.6950005, 1, 0, 0.007843138, 1
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
-0.07003438, -4.443823, -7.992726, 0, -0.5, 0.5, 0.5,
-0.07003438, -4.443823, -7.992726, 1, -0.5, 0.5, 0.5,
-0.07003438, -4.443823, -7.992726, 1, 1.5, 0.5, 0.5,
-0.07003438, -4.443823, -7.992726, 0, 1.5, 0.5, 0.5
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
-4.332379, 0.05329335, -7.992726, 0, -0.5, 0.5, 0.5,
-4.332379, 0.05329335, -7.992726, 1, -0.5, 0.5, 0.5,
-4.332379, 0.05329335, -7.992726, 1, 1.5, 0.5, 0.5,
-4.332379, 0.05329335, -7.992726, 0, 1.5, 0.5, 0.5
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
-4.332379, -4.443823, -0.4008574, 0, -0.5, 0.5, 0.5,
-4.332379, -4.443823, -0.4008574, 1, -0.5, 0.5, 0.5,
-4.332379, -4.443823, -0.4008574, 1, 1.5, 0.5, 0.5,
-4.332379, -4.443823, -0.4008574, 0, 1.5, 0.5, 0.5
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
-3, -3.406027, -6.240756,
3, -3.406027, -6.240756,
-3, -3.406027, -6.240756,
-3, -3.578993, -6.532751,
-2, -3.406027, -6.240756,
-2, -3.578993, -6.532751,
-1, -3.406027, -6.240756,
-1, -3.578993, -6.532751,
0, -3.406027, -6.240756,
0, -3.578993, -6.532751,
1, -3.406027, -6.240756,
1, -3.578993, -6.532751,
2, -3.406027, -6.240756,
2, -3.578993, -6.532751,
3, -3.406027, -6.240756,
3, -3.578993, -6.532751
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
-3, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
-3, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
-3, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
-3, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5,
-2, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
-2, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
-2, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
-2, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5,
-1, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
-1, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
-1, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
-1, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5,
0, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
0, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
0, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
0, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5,
1, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
1, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
1, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
1, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5,
2, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
2, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
2, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
2, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5,
3, -3.924926, -7.116741, 0, -0.5, 0.5, 0.5,
3, -3.924926, -7.116741, 1, -0.5, 0.5, 0.5,
3, -3.924926, -7.116741, 1, 1.5, 0.5, 0.5,
3, -3.924926, -7.116741, 0, 1.5, 0.5, 0.5
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
-3.348761, -3, -6.240756,
-3.348761, 3, -6.240756,
-3.348761, -3, -6.240756,
-3.512697, -3, -6.532751,
-3.348761, -2, -6.240756,
-3.512697, -2, -6.532751,
-3.348761, -1, -6.240756,
-3.512697, -1, -6.532751,
-3.348761, 0, -6.240756,
-3.512697, 0, -6.532751,
-3.348761, 1, -6.240756,
-3.512697, 1, -6.532751,
-3.348761, 2, -6.240756,
-3.512697, 2, -6.532751,
-3.348761, 3, -6.240756,
-3.512697, 3, -6.532751
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
-3.84057, -3, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, -3, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, -3, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, -3, -7.116741, 0, 1.5, 0.5, 0.5,
-3.84057, -2, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, -2, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, -2, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, -2, -7.116741, 0, 1.5, 0.5, 0.5,
-3.84057, -1, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, -1, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, -1, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, -1, -7.116741, 0, 1.5, 0.5, 0.5,
-3.84057, 0, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, 0, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, 0, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, 0, -7.116741, 0, 1.5, 0.5, 0.5,
-3.84057, 1, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, 1, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, 1, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, 1, -7.116741, 0, 1.5, 0.5, 0.5,
-3.84057, 2, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, 2, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, 2, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, 2, -7.116741, 0, 1.5, 0.5, 0.5,
-3.84057, 3, -7.116741, 0, -0.5, 0.5, 0.5,
-3.84057, 3, -7.116741, 1, -0.5, 0.5, 0.5,
-3.84057, 3, -7.116741, 1, 1.5, 0.5, 0.5,
-3.84057, 3, -7.116741, 0, 1.5, 0.5, 0.5
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
-3.348761, -3.406027, -6,
-3.348761, -3.406027, 4,
-3.348761, -3.406027, -6,
-3.512697, -3.578993, -6,
-3.348761, -3.406027, -4,
-3.512697, -3.578993, -4,
-3.348761, -3.406027, -2,
-3.512697, -3.578993, -2,
-3.348761, -3.406027, 0,
-3.512697, -3.578993, 0,
-3.348761, -3.406027, 2,
-3.512697, -3.578993, 2,
-3.348761, -3.406027, 4,
-3.512697, -3.578993, 4
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
-3.84057, -3.924926, -6, 0, -0.5, 0.5, 0.5,
-3.84057, -3.924926, -6, 1, -0.5, 0.5, 0.5,
-3.84057, -3.924926, -6, 1, 1.5, 0.5, 0.5,
-3.84057, -3.924926, -6, 0, 1.5, 0.5, 0.5,
-3.84057, -3.924926, -4, 0, -0.5, 0.5, 0.5,
-3.84057, -3.924926, -4, 1, -0.5, 0.5, 0.5,
-3.84057, -3.924926, -4, 1, 1.5, 0.5, 0.5,
-3.84057, -3.924926, -4, 0, 1.5, 0.5, 0.5,
-3.84057, -3.924926, -2, 0, -0.5, 0.5, 0.5,
-3.84057, -3.924926, -2, 1, -0.5, 0.5, 0.5,
-3.84057, -3.924926, -2, 1, 1.5, 0.5, 0.5,
-3.84057, -3.924926, -2, 0, 1.5, 0.5, 0.5,
-3.84057, -3.924926, 0, 0, -0.5, 0.5, 0.5,
-3.84057, -3.924926, 0, 1, -0.5, 0.5, 0.5,
-3.84057, -3.924926, 0, 1, 1.5, 0.5, 0.5,
-3.84057, -3.924926, 0, 0, 1.5, 0.5, 0.5,
-3.84057, -3.924926, 2, 0, -0.5, 0.5, 0.5,
-3.84057, -3.924926, 2, 1, -0.5, 0.5, 0.5,
-3.84057, -3.924926, 2, 1, 1.5, 0.5, 0.5,
-3.84057, -3.924926, 2, 0, 1.5, 0.5, 0.5,
-3.84057, -3.924926, 4, 0, -0.5, 0.5, 0.5,
-3.84057, -3.924926, 4, 1, -0.5, 0.5, 0.5,
-3.84057, -3.924926, 4, 1, 1.5, 0.5, 0.5,
-3.84057, -3.924926, 4, 0, 1.5, 0.5, 0.5
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
-3.348761, -3.406027, -6.240756,
-3.348761, 3.512614, -6.240756,
-3.348761, -3.406027, 5.439041,
-3.348761, 3.512614, 5.439041,
-3.348761, -3.406027, -6.240756,
-3.348761, -3.406027, 5.439041,
-3.348761, 3.512614, -6.240756,
-3.348761, 3.512614, 5.439041,
-3.348761, -3.406027, -6.240756,
3.208692, -3.406027, -6.240756,
-3.348761, -3.406027, 5.439041,
3.208692, -3.406027, 5.439041,
-3.348761, 3.512614, -6.240756,
3.208692, 3.512614, -6.240756,
-3.348761, 3.512614, 5.439041,
3.208692, 3.512614, 5.439041,
3.208692, -3.406027, -6.240756,
3.208692, 3.512614, -6.240756,
3.208692, -3.406027, 5.439041,
3.208692, 3.512614, 5.439041,
3.208692, -3.406027, -6.240756,
3.208692, -3.406027, 5.439041,
3.208692, 3.512614, -6.240756,
3.208692, 3.512614, 5.439041
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
var radius = 8.050286;
var distance = 35.81663;
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
mvMatrix.translate( 0.07003438, -0.05329335, 0.4008574 );
mvMatrix.scale( 1.327364, 1.258069, 0.7452292 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81663);
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
dichlofluanid<-read.table("dichlofluanid.xyz")
```

```
## Error in read.table("dichlofluanid.xyz"): no lines available in input
```

```r
x<-dichlofluanid$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichlofluanid' not found
```

```r
y<-dichlofluanid$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichlofluanid' not found
```

```r
z<-dichlofluanid$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichlofluanid' not found
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
-3.253264, -0.8252987, -0.3174466, 0, 0, 1, 1, 1,
-3.018273, 0.576309, -1.92642, 1, 0, 0, 1, 1,
-2.963316, 0.4870172, -1.931622, 1, 0, 0, 1, 1,
-2.934197, -1.408019, -1.996271, 1, 0, 0, 1, 1,
-2.932296, -1.032139, -3.163655, 1, 0, 0, 1, 1,
-2.88767, -0.04977446, -1.414676, 1, 0, 0, 1, 1,
-2.678122, 1.191845, -3.474822, 0, 0, 0, 1, 1,
-2.589673, 0.6237175, -0.5697376, 0, 0, 0, 1, 1,
-2.414485, -1.512318, -3.07954, 0, 0, 0, 1, 1,
-2.34655, -0.5886405, -1.88413, 0, 0, 0, 1, 1,
-2.324067, -0.5544741, -1.43293, 0, 0, 0, 1, 1,
-2.293158, 2.359432, 0.4077487, 0, 0, 0, 1, 1,
-2.253048, -0.04702946, -1.641785, 0, 0, 0, 1, 1,
-2.245935, -0.6964152, -1.077775, 1, 1, 1, 1, 1,
-2.207044, 0.3753192, -0.6875975, 1, 1, 1, 1, 1,
-2.191107, -0.9668611, -0.1820167, 1, 1, 1, 1, 1,
-2.186865, -1.128735, -2.641832, 1, 1, 1, 1, 1,
-2.165297, 0.9603838, -1.75957, 1, 1, 1, 1, 1,
-2.139532, 0.756645, -1.582711, 1, 1, 1, 1, 1,
-2.0845, -0.429124, -1.302613, 1, 1, 1, 1, 1,
-2.057736, -0.3241234, -0.6639811, 1, 1, 1, 1, 1,
-2.014214, 1.034462, 0.1381481, 1, 1, 1, 1, 1,
-1.996366, 0.9585027, -2.065217, 1, 1, 1, 1, 1,
-1.980048, 0.2081892, -2.451109, 1, 1, 1, 1, 1,
-1.942794, 0.1896902, -1.481918, 1, 1, 1, 1, 1,
-1.937682, -1.230039, -3.305641, 1, 1, 1, 1, 1,
-1.906689, 0.2200649, -3.351152, 1, 1, 1, 1, 1,
-1.9006, -0.4852493, -1.898254, 1, 1, 1, 1, 1,
-1.893878, -0.2017618, -4.206206, 0, 0, 1, 1, 1,
-1.893044, -0.4306812, -1.861305, 1, 0, 0, 1, 1,
-1.859693, -1.584216, -1.47172, 1, 0, 0, 1, 1,
-1.840383, -1.114241, -0.04609572, 1, 0, 0, 1, 1,
-1.83929, -1.199157, -3.990262, 1, 0, 0, 1, 1,
-1.806282, -0.2351266, -3.207467, 1, 0, 0, 1, 1,
-1.798333, 0.3737923, -1.301709, 0, 0, 0, 1, 1,
-1.794921, -0.1418057, -0.3756298, 0, 0, 0, 1, 1,
-1.790778, -0.5214043, -3.434, 0, 0, 0, 1, 1,
-1.758528, -1.163279, -1.550603, 0, 0, 0, 1, 1,
-1.752046, 0.3092403, -2.267778, 0, 0, 0, 1, 1,
-1.735252, -0.2367213, -3.685138, 0, 0, 0, 1, 1,
-1.725653, -0.6787447, -1.137687, 0, 0, 0, 1, 1,
-1.71093, -0.312612, -1.92046, 1, 1, 1, 1, 1,
-1.707687, -0.7323189, -0.7670115, 1, 1, 1, 1, 1,
-1.707152, -0.8379098, -2.178257, 1, 1, 1, 1, 1,
-1.701818, 0.8859197, -1.606156, 1, 1, 1, 1, 1,
-1.686053, -1.758494, -0.7213258, 1, 1, 1, 1, 1,
-1.679929, 0.4442398, -1.543529, 1, 1, 1, 1, 1,
-1.658907, 1.305858, -1.15635, 1, 1, 1, 1, 1,
-1.638129, 0.6785283, -1.726235, 1, 1, 1, 1, 1,
-1.600872, 0.9493037, -1.373673, 1, 1, 1, 1, 1,
-1.600361, -0.03770389, -0.4109848, 1, 1, 1, 1, 1,
-1.600353, 1.050175, -3.147975, 1, 1, 1, 1, 1,
-1.593044, -0.1825048, -2.038506, 1, 1, 1, 1, 1,
-1.582458, -2.240517, -2.064651, 1, 1, 1, 1, 1,
-1.572627, 1.58508, -0.9830957, 1, 1, 1, 1, 1,
-1.571348, 1.950188, -0.09682532, 1, 1, 1, 1, 1,
-1.562902, -0.4410008, -1.342167, 0, 0, 1, 1, 1,
-1.551771, 2.752179, -0.4296778, 1, 0, 0, 1, 1,
-1.536435, 0.381185, -2.301684, 1, 0, 0, 1, 1,
-1.532995, -0.577714, -2.014864, 1, 0, 0, 1, 1,
-1.522793, -0.8727568, -2.00405, 1, 0, 0, 1, 1,
-1.520692, -2.307062, -2.341096, 1, 0, 0, 1, 1,
-1.51597, -0.2741455, -0.4099692, 0, 0, 0, 1, 1,
-1.510458, 0.9668227, -1.378885, 0, 0, 0, 1, 1,
-1.509221, -0.3712279, -2.833455, 0, 0, 0, 1, 1,
-1.50601, -0.1356928, -1.862249, 0, 0, 0, 1, 1,
-1.492831, -0.727514, -1.738296, 0, 0, 0, 1, 1,
-1.488484, 0.04476046, -1.61643, 0, 0, 0, 1, 1,
-1.482123, -0.09365548, -1.571398, 0, 0, 0, 1, 1,
-1.479969, -0.7454639, -2.122519, 1, 1, 1, 1, 1,
-1.46921, 0.3143598, -1.224137, 1, 1, 1, 1, 1,
-1.461954, -0.2196926, -0.9964991, 1, 1, 1, 1, 1,
-1.458551, -1.809991, -1.209493, 1, 1, 1, 1, 1,
-1.45122, 0.09265681, -0.7374446, 1, 1, 1, 1, 1,
-1.450468, -0.1798928, -3.018172, 1, 1, 1, 1, 1,
-1.449708, 0.3817922, -1.195534, 1, 1, 1, 1, 1,
-1.449304, 2.351316, -2.089379, 1, 1, 1, 1, 1,
-1.435882, -0.6942109, -2.47831, 1, 1, 1, 1, 1,
-1.424166, 0.1943941, -1.545578, 1, 1, 1, 1, 1,
-1.416589, -0.3128297, 0.009999433, 1, 1, 1, 1, 1,
-1.405023, 1.892445, -1.127531, 1, 1, 1, 1, 1,
-1.400934, -0.5396361, -2.385118, 1, 1, 1, 1, 1,
-1.399764, 2.619683, -0.008093131, 1, 1, 1, 1, 1,
-1.393381, -0.1439898, -2.364489, 1, 1, 1, 1, 1,
-1.392153, -0.5861664, 0.6510703, 0, 0, 1, 1, 1,
-1.387542, -0.682146, -0.2084226, 1, 0, 0, 1, 1,
-1.385739, -0.7531612, -1.807286, 1, 0, 0, 1, 1,
-1.382336, -0.5553421, -3.025902, 1, 0, 0, 1, 1,
-1.379877, 2.121394, 0.6946606, 1, 0, 0, 1, 1,
-1.377134, -1.157817, -2.755674, 1, 0, 0, 1, 1,
-1.376954, -0.6311503, -2.627185, 0, 0, 0, 1, 1,
-1.374133, -1.822535, -0.7399179, 0, 0, 0, 1, 1,
-1.370658, 0.05819817, -0.9142574, 0, 0, 0, 1, 1,
-1.35751, 0.7495188, 0.3612917, 0, 0, 0, 1, 1,
-1.35032, 1.09545, -0.7825173, 0, 0, 0, 1, 1,
-1.342632, 1.986219, -1.154636, 0, 0, 0, 1, 1,
-1.339581, 1.448275, 0.2285561, 0, 0, 0, 1, 1,
-1.338961, 0.5740314, 0.6763322, 1, 1, 1, 1, 1,
-1.33742, -0.5838541, -2.466954, 1, 1, 1, 1, 1,
-1.334815, -1.340595, -4.28999, 1, 1, 1, 1, 1,
-1.328584, -1.031645, -1.115105, 1, 1, 1, 1, 1,
-1.324111, 1.560606, -0.6545622, 1, 1, 1, 1, 1,
-1.314738, 2.321019, -1.063829, 1, 1, 1, 1, 1,
-1.310988, -0.5279722, -1.576341, 1, 1, 1, 1, 1,
-1.30849, 0.8170481, -0.4884911, 1, 1, 1, 1, 1,
-1.307666, 0.3280249, -4.64487, 1, 1, 1, 1, 1,
-1.303564, -1.134453, -2.163186, 1, 1, 1, 1, 1,
-1.300075, -1.684476, -2.412465, 1, 1, 1, 1, 1,
-1.295012, 0.3749987, -0.666491, 1, 1, 1, 1, 1,
-1.293462, -0.3698225, -2.948848, 1, 1, 1, 1, 1,
-1.27448, 2.186496, -0.9707663, 1, 1, 1, 1, 1,
-1.258176, 0.9307714, -0.9745124, 1, 1, 1, 1, 1,
-1.258111, -0.3045687, -2.095734, 0, 0, 1, 1, 1,
-1.252598, -1.514376, -1.8421, 1, 0, 0, 1, 1,
-1.251805, -0.9411933, -2.524647, 1, 0, 0, 1, 1,
-1.225886, 0.8912982, -0.2726305, 1, 0, 0, 1, 1,
-1.219376, -0.8100129, -3.270591, 1, 0, 0, 1, 1,
-1.216726, -0.6919076, -1.811494, 1, 0, 0, 1, 1,
-1.202402, 1.04341, 0.6203534, 0, 0, 0, 1, 1,
-1.20176, 0.04201204, -2.33267, 0, 0, 0, 1, 1,
-1.200568, 1.067169, -0.6172735, 0, 0, 0, 1, 1,
-1.17711, -1.76216, -1.900519, 0, 0, 0, 1, 1,
-1.176872, -0.8221602, -2.709532, 0, 0, 0, 1, 1,
-1.173703, -1.839246, -1.871686, 0, 0, 0, 1, 1,
-1.172133, -0.2292149, -1.232811, 0, 0, 0, 1, 1,
-1.169284, 1.744447, 0.6451095, 1, 1, 1, 1, 1,
-1.168889, 2.284388, 0.5149231, 1, 1, 1, 1, 1,
-1.165694, 0.5884606, 1.021512, 1, 1, 1, 1, 1,
-1.158346, -0.105878, -0.2684239, 1, 1, 1, 1, 1,
-1.156384, 2.210562, -1.433726, 1, 1, 1, 1, 1,
-1.148844, -1.325313, -1.128062, 1, 1, 1, 1, 1,
-1.147335, 0.04051458, -2.297651, 1, 1, 1, 1, 1,
-1.142753, -0.1877498, -3.47824, 1, 1, 1, 1, 1,
-1.138549, -0.6504023, -1.233765, 1, 1, 1, 1, 1,
-1.137125, 1.652356, -1.034791, 1, 1, 1, 1, 1,
-1.12879, -1.179694, -1.824812, 1, 1, 1, 1, 1,
-1.127745, -1.258041, -2.650249, 1, 1, 1, 1, 1,
-1.127501, -0.9055771, -2.409139, 1, 1, 1, 1, 1,
-1.118253, -1.08911, -2.022941, 1, 1, 1, 1, 1,
-1.115351, -0.34108, -2.115932, 1, 1, 1, 1, 1,
-1.106252, -0.3646489, 0.1332482, 0, 0, 1, 1, 1,
-1.105204, 0.7886623, -0.5728295, 1, 0, 0, 1, 1,
-1.099257, -1.552688, -1.784599, 1, 0, 0, 1, 1,
-1.097049, 1.119477, -1.127041, 1, 0, 0, 1, 1,
-1.094922, -0.3495706, -2.00332, 1, 0, 0, 1, 1,
-1.094626, 0.4285986, -0.2828393, 1, 0, 0, 1, 1,
-1.093126, 0.1022074, -1.432863, 0, 0, 0, 1, 1,
-1.084082, 1.426553, -1.006747, 0, 0, 0, 1, 1,
-1.082365, -0.6664484, -1.426687, 0, 0, 0, 1, 1,
-1.076681, 0.5514594, -1.188196, 0, 0, 0, 1, 1,
-1.074133, 2.758342, -0.3800323, 0, 0, 0, 1, 1,
-1.073942, 0.3358504, -0.286678, 0, 0, 0, 1, 1,
-1.073926, -0.08288174, -2.027013, 0, 0, 0, 1, 1,
-1.067912, -1.068034, -2.431735, 1, 1, 1, 1, 1,
-1.066631, 0.1598157, -0.5312141, 1, 1, 1, 1, 1,
-1.065714, 1.294547, -0.9573339, 1, 1, 1, 1, 1,
-1.063424, 0.787896, -0.993054, 1, 1, 1, 1, 1,
-1.062389, -0.01316635, -0.6824542, 1, 1, 1, 1, 1,
-1.056176, -1.049404, -2.41112, 1, 1, 1, 1, 1,
-1.05403, 1.684077, -1.963982, 1, 1, 1, 1, 1,
-1.050396, -0.1331281, -0.1074152, 1, 1, 1, 1, 1,
-1.039508, 1.236235, -1.313571, 1, 1, 1, 1, 1,
-1.026446, 1.067968, -2.092321, 1, 1, 1, 1, 1,
-1.018263, 2.525292, 0.9928941, 1, 1, 1, 1, 1,
-1.016597, -0.4801508, -3.333201, 1, 1, 1, 1, 1,
-1.016468, 0.5120925, 0.1496322, 1, 1, 1, 1, 1,
-1.011784, 0.4290403, -1.121879, 1, 1, 1, 1, 1,
-1.005763, -0.005311452, -2.49757, 1, 1, 1, 1, 1,
-0.9975188, -0.2932776, -1.984505, 0, 0, 1, 1, 1,
-0.9936882, 2.668312, -0.7760673, 1, 0, 0, 1, 1,
-0.9936755, 1.083956, -1.029582, 1, 0, 0, 1, 1,
-0.9824455, -0.1099846, -2.614035, 1, 0, 0, 1, 1,
-0.9799535, 0.317895, -1.815683, 1, 0, 0, 1, 1,
-0.9730975, -0.1573816, -3.437016, 1, 0, 0, 1, 1,
-0.972966, -0.02196757, -2.253648, 0, 0, 0, 1, 1,
-0.9673373, 1.260745, 0.6681278, 0, 0, 0, 1, 1,
-0.9610888, -0.2398305, -0.9182087, 0, 0, 0, 1, 1,
-0.9602656, 0.2933573, -0.5625324, 0, 0, 0, 1, 1,
-0.9535052, 0.1061054, -0.05234026, 0, 0, 0, 1, 1,
-0.9484854, -0.6288766, -1.122499, 0, 0, 0, 1, 1,
-0.9433029, -0.6934225, -2.022556, 0, 0, 0, 1, 1,
-0.9407407, -0.4609581, -0.5010642, 1, 1, 1, 1, 1,
-0.9325334, 0.8385584, -0.9248893, 1, 1, 1, 1, 1,
-0.9286079, 0.2808442, -2.144242, 1, 1, 1, 1, 1,
-0.9283481, 0.2673092, -0.9777091, 1, 1, 1, 1, 1,
-0.9244919, 0.5701528, 0.03344827, 1, 1, 1, 1, 1,
-0.9177269, -0.4929511, -1.475295, 1, 1, 1, 1, 1,
-0.912018, -0.6216405, -4.04855, 1, 1, 1, 1, 1,
-0.9070399, -0.4744802, -1.013595, 1, 1, 1, 1, 1,
-0.9061394, -1.271034, -0.7929725, 1, 1, 1, 1, 1,
-0.9046111, 0.1091925, -2.480435, 1, 1, 1, 1, 1,
-0.9028891, 0.06194358, -1.452331, 1, 1, 1, 1, 1,
-0.900525, -0.6870309, -2.502554, 1, 1, 1, 1, 1,
-0.8959756, -0.2118214, -1.539198, 1, 1, 1, 1, 1,
-0.8895755, -0.06819408, -3.028568, 1, 1, 1, 1, 1,
-0.8839545, 1.858098, -0.492034, 1, 1, 1, 1, 1,
-0.8833793, 0.8627295, -1.980484, 0, 0, 1, 1, 1,
-0.8796548, -0.1207678, -2.136461, 1, 0, 0, 1, 1,
-0.8730565, -0.2020816, -2.39146, 1, 0, 0, 1, 1,
-0.8684937, -0.7596777, -2.28555, 1, 0, 0, 1, 1,
-0.8578773, -0.9109234, -2.819749, 1, 0, 0, 1, 1,
-0.8575701, -0.2730405, -1.685495, 1, 0, 0, 1, 1,
-0.8555848, -0.2784369, -1.33377, 0, 0, 0, 1, 1,
-0.8495213, -0.9375898, -4.260146, 0, 0, 0, 1, 1,
-0.848645, -0.277869, -0.447244, 0, 0, 0, 1, 1,
-0.8438982, 2.544325, -0.3615761, 0, 0, 0, 1, 1,
-0.838769, -0.7642871, -2.607464, 0, 0, 0, 1, 1,
-0.8383144, 0.3765342, -2.630184, 0, 0, 0, 1, 1,
-0.8376374, -0.1275436, -0.3695281, 0, 0, 0, 1, 1,
-0.8306476, 0.5590479, -1.851418, 1, 1, 1, 1, 1,
-0.8271424, 1.400697, -0.8448192, 1, 1, 1, 1, 1,
-0.8260825, 0.02732009, -2.019221, 1, 1, 1, 1, 1,
-0.8206864, 1.665891, -0.8994513, 1, 1, 1, 1, 1,
-0.818856, 1.22666, -0.3534594, 1, 1, 1, 1, 1,
-0.817714, 0.2530409, -2.728983, 1, 1, 1, 1, 1,
-0.815705, 0.7036397, 0.73432, 1, 1, 1, 1, 1,
-0.8133057, 0.2501228, -1.041779, 1, 1, 1, 1, 1,
-0.808468, 1.655384, -0.1552841, 1, 1, 1, 1, 1,
-0.8004405, 0.319548, -1.24225, 1, 1, 1, 1, 1,
-0.7835398, 1.126849, 0.9464807, 1, 1, 1, 1, 1,
-0.7832648, -0.9569198, -1.838066, 1, 1, 1, 1, 1,
-0.782838, -1.253637, -2.719294, 1, 1, 1, 1, 1,
-0.7792216, -0.4948341, -0.7392681, 1, 1, 1, 1, 1,
-0.7753379, -0.4081827, -2.992299, 1, 1, 1, 1, 1,
-0.7740914, 0.8630476, -0.5734729, 0, 0, 1, 1, 1,
-0.7710935, 0.7807335, -1.7793, 1, 0, 0, 1, 1,
-0.7709347, -0.1087409, 0.2144183, 1, 0, 0, 1, 1,
-0.7662297, 1.298123, 2.150628, 1, 0, 0, 1, 1,
-0.7658404, 2.278119, -0.3722878, 1, 0, 0, 1, 1,
-0.7654722, 1.297385, -1.823409, 1, 0, 0, 1, 1,
-0.7648804, 0.6288034, 0.3597428, 0, 0, 0, 1, 1,
-0.7563214, 0.5662858, -1.615305, 0, 0, 0, 1, 1,
-0.7555823, -0.1944367, -0.6620588, 0, 0, 0, 1, 1,
-0.7547203, -0.9224698, -2.313212, 0, 0, 0, 1, 1,
-0.7455348, 0.7154105, -1.75852, 0, 0, 0, 1, 1,
-0.74479, -1.885596, -2.168075, 0, 0, 0, 1, 1,
-0.7413651, 0.1325663, -0.4509473, 0, 0, 0, 1, 1,
-0.7411388, 1.326247, 0.0439283, 1, 1, 1, 1, 1,
-0.7402362, 0.5331964, -1.095197, 1, 1, 1, 1, 1,
-0.7329203, 0.4773597, -1.328731, 1, 1, 1, 1, 1,
-0.7310811, 1.214247, 1.574615, 1, 1, 1, 1, 1,
-0.7284015, 1.367924, -1.999536, 1, 1, 1, 1, 1,
-0.7191983, -2.942582, -4.29777, 1, 1, 1, 1, 1,
-0.7130098, -0.6769969, -3.266981, 1, 1, 1, 1, 1,
-0.7044551, 0.7341329, -1.561506, 1, 1, 1, 1, 1,
-0.7019553, -1.462249, -2.783435, 1, 1, 1, 1, 1,
-0.6957709, -0.1744323, -1.179227, 1, 1, 1, 1, 1,
-0.6954192, 0.6377464, -0.836862, 1, 1, 1, 1, 1,
-0.6953964, -1.365222, -2.819141, 1, 1, 1, 1, 1,
-0.6948649, -1.47798, -1.387403, 1, 1, 1, 1, 1,
-0.6934435, 0.3143074, 1.395473, 1, 1, 1, 1, 1,
-0.6933053, 0.9504564, -1.209478, 1, 1, 1, 1, 1,
-0.693272, -1.391692, -4.45638, 0, 0, 1, 1, 1,
-0.6891448, 0.9005079, -1.115163, 1, 0, 0, 1, 1,
-0.6884345, 1.411859, 0.5030159, 1, 0, 0, 1, 1,
-0.6879047, 0.1756495, -1.940715, 1, 0, 0, 1, 1,
-0.6863537, 0.4883795, -1.811703, 1, 0, 0, 1, 1,
-0.674683, 0.8037794, -1.992913, 1, 0, 0, 1, 1,
-0.6732248, -0.2243911, -0.508512, 0, 0, 0, 1, 1,
-0.6722425, -1.184759, -4.466665, 0, 0, 0, 1, 1,
-0.6654684, -1.50583, -1.240241, 0, 0, 0, 1, 1,
-0.6654236, -0.2121305, -1.754396, 0, 0, 0, 1, 1,
-0.6648362, 0.1507835, -1.519239, 0, 0, 0, 1, 1,
-0.6618387, 0.2107204, -2.627184, 0, 0, 0, 1, 1,
-0.6598987, 0.6650376, -2.005949, 0, 0, 0, 1, 1,
-0.657583, 0.9656136, 1.321278, 1, 1, 1, 1, 1,
-0.6567513, -0.36546, -1.588727, 1, 1, 1, 1, 1,
-0.655534, 1.948791, -0.9706634, 1, 1, 1, 1, 1,
-0.6538959, -0.7900282, -4.615465, 1, 1, 1, 1, 1,
-0.6532552, 1.72453, -0.3128516, 1, 1, 1, 1, 1,
-0.6493726, 0.8919995, -0.3553551, 1, 1, 1, 1, 1,
-0.6472119, 0.3741824, -1.303471, 1, 1, 1, 1, 1,
-0.6384618, -1.163606, -1.47702, 1, 1, 1, 1, 1,
-0.6304845, 0.5205426, -1.234871, 1, 1, 1, 1, 1,
-0.6275756, -0.4547365, -3.254359, 1, 1, 1, 1, 1,
-0.6212067, -1.060638, -1.599678, 1, 1, 1, 1, 1,
-0.6209134, 1.369396, -0.06410951, 1, 1, 1, 1, 1,
-0.6180911, -0.7975466, -1.113331, 1, 1, 1, 1, 1,
-0.6166319, 0.5056944, -2.887937, 1, 1, 1, 1, 1,
-0.6152645, 0.2724884, -2.881308, 1, 1, 1, 1, 1,
-0.6120623, -0.7684966, -2.062202, 0, 0, 1, 1, 1,
-0.6086329, 0.9510119, -1.079306, 1, 0, 0, 1, 1,
-0.6055967, 1.019304, 0.03085516, 1, 0, 0, 1, 1,
-0.6050674, -0.3350391, -3.034553, 1, 0, 0, 1, 1,
-0.6016284, -1.121526, -4.13132, 1, 0, 0, 1, 1,
-0.5976552, -0.6026199, -2.953856, 1, 0, 0, 1, 1,
-0.5946057, 0.2182751, -2.040896, 0, 0, 0, 1, 1,
-0.5909184, 0.3952196, 0.204891, 0, 0, 0, 1, 1,
-0.5854631, -2.258154, -4.293077, 0, 0, 0, 1, 1,
-0.5754003, -0.4894687, -2.029784, 0, 0, 0, 1, 1,
-0.5685265, -0.02902392, -1.995759, 0, 0, 0, 1, 1,
-0.5653839, -0.1587332, -2.954624, 0, 0, 0, 1, 1,
-0.5642937, 0.03592999, -1.520478, 0, 0, 0, 1, 1,
-0.5638265, -0.4228508, -1.768064, 1, 1, 1, 1, 1,
-0.5537681, -1.100607, -3.961923, 1, 1, 1, 1, 1,
-0.5492544, -0.2663361, -2.131269, 1, 1, 1, 1, 1,
-0.5483273, 0.5963523, -1.70546, 1, 1, 1, 1, 1,
-0.5450022, -0.1281176, -3.675607, 1, 1, 1, 1, 1,
-0.5394825, -0.1446003, -3.433451, 1, 1, 1, 1, 1,
-0.5329621, 0.541047, -1.774749, 1, 1, 1, 1, 1,
-0.5280715, 1.327693, 0.8031199, 1, 1, 1, 1, 1,
-0.5278495, -0.3428523, -2.457177, 1, 1, 1, 1, 1,
-0.5216867, -0.03044055, -1.014321, 1, 1, 1, 1, 1,
-0.5196605, -1.479855, -2.490705, 1, 1, 1, 1, 1,
-0.5189842, -0.08899937, -2.692371, 1, 1, 1, 1, 1,
-0.5181721, -0.3024805, -2.270519, 1, 1, 1, 1, 1,
-0.5180485, -0.0101301, -1.418928, 1, 1, 1, 1, 1,
-0.5168667, 0.8854978, 0.5428602, 1, 1, 1, 1, 1,
-0.5104529, -0.2613505, 0.3369894, 0, 0, 1, 1, 1,
-0.5088515, 0.1713702, -2.125813, 1, 0, 0, 1, 1,
-0.5081604, 0.817232, 0.6744647, 1, 0, 0, 1, 1,
-0.5073695, -0.3421413, -1.345149, 1, 0, 0, 1, 1,
-0.5060723, -0.8976832, -1.14013, 1, 0, 0, 1, 1,
-0.505979, -0.3345662, -2.73103, 1, 0, 0, 1, 1,
-0.5044127, 0.09788974, -3.124351, 0, 0, 0, 1, 1,
-0.5016425, -0.1328327, -0.2006999, 0, 0, 0, 1, 1,
-0.5009758, -0.4810399, -2.465677, 0, 0, 0, 1, 1,
-0.498661, 1.161679, 0.7933009, 0, 0, 0, 1, 1,
-0.4961975, -2.231453, -2.953432, 0, 0, 0, 1, 1,
-0.4959721, 0.5776761, -1.530423, 0, 0, 0, 1, 1,
-0.4959392, 1.858286, -0.2729824, 0, 0, 0, 1, 1,
-0.4946875, 1.711095, 1.227918, 1, 1, 1, 1, 1,
-0.4926344, -0.6164111, -1.873304, 1, 1, 1, 1, 1,
-0.4885372, 0.02289936, -1.607439, 1, 1, 1, 1, 1,
-0.4884473, -0.7066348, -0.6725436, 1, 1, 1, 1, 1,
-0.4871186, 0.4358149, 0.06568462, 1, 1, 1, 1, 1,
-0.4839161, 1.402523, -0.6818119, 1, 1, 1, 1, 1,
-0.4818754, 1.235146, 0.286799, 1, 1, 1, 1, 1,
-0.4674697, 1.933308, -0.6496636, 1, 1, 1, 1, 1,
-0.4665823, 1.27253, -0.04609136, 1, 1, 1, 1, 1,
-0.4633261, 1.974091, 0.7576552, 1, 1, 1, 1, 1,
-0.4593872, 0.9782159, 0.05721308, 1, 1, 1, 1, 1,
-0.4526976, -0.8812398, -2.08126, 1, 1, 1, 1, 1,
-0.4483259, 1.356104, 0.2318126, 1, 1, 1, 1, 1,
-0.4337797, -0.2987708, -1.805532, 1, 1, 1, 1, 1,
-0.4289308, 0.7170198, 0.4213686, 1, 1, 1, 1, 1,
-0.4282246, -1.113628, -2.641638, 0, 0, 1, 1, 1,
-0.425962, 0.9445034, -1.652263, 1, 0, 0, 1, 1,
-0.4239604, -0.9858028, -3.17641, 1, 0, 0, 1, 1,
-0.4235784, 0.2151057, -0.03322675, 1, 0, 0, 1, 1,
-0.4193718, 0.4179523, 0.2860519, 1, 0, 0, 1, 1,
-0.4155932, -0.3763609, -4.493514, 1, 0, 0, 1, 1,
-0.4123441, -0.9565572, -2.261313, 0, 0, 0, 1, 1,
-0.4110351, -0.474197, -3.636721, 0, 0, 0, 1, 1,
-0.4103262, 0.1103065, -1.548809, 0, 0, 0, 1, 1,
-0.409741, -1.299146, -2.832228, 0, 0, 0, 1, 1,
-0.4064535, 0.2882708, -0.5922534, 0, 0, 0, 1, 1,
-0.4056554, -1.531501, -3.360064, 0, 0, 0, 1, 1,
-0.4052333, 0.01663875, -3.472303, 0, 0, 0, 1, 1,
-0.3992016, 0.09495199, -0.7731405, 1, 1, 1, 1, 1,
-0.3970737, -0.7618203, -4.014167, 1, 1, 1, 1, 1,
-0.3948427, 0.08419632, -1.496042, 1, 1, 1, 1, 1,
-0.3942704, -0.2124389, -1.227662, 1, 1, 1, 1, 1,
-0.3934388, 2.008759, -0.7748553, 1, 1, 1, 1, 1,
-0.386981, -0.7480318, -2.785095, 1, 1, 1, 1, 1,
-0.38669, -0.4570486, -3.21316, 1, 1, 1, 1, 1,
-0.3774261, -0.4767696, -1.443114, 1, 1, 1, 1, 1,
-0.3730007, 0.6603612, -2.822734, 1, 1, 1, 1, 1,
-0.3725498, -0.02571931, -2.945069, 1, 1, 1, 1, 1,
-0.3703739, -0.09566232, -0.7560262, 1, 1, 1, 1, 1,
-0.3676353, -0.7181658, -1.759381, 1, 1, 1, 1, 1,
-0.3595506, -0.5732296, -2.733467, 1, 1, 1, 1, 1,
-0.3594021, -1.33571, -4.839741, 1, 1, 1, 1, 1,
-0.3535663, 0.5697125, -0.06722148, 1, 1, 1, 1, 1,
-0.3533634, -0.4069843, -4.210638, 0, 0, 1, 1, 1,
-0.3482702, -0.9154209, -0.5953364, 1, 0, 0, 1, 1,
-0.345422, -0.1245877, -0.9601055, 1, 0, 0, 1, 1,
-0.3421939, -3.30527, -2.621607, 1, 0, 0, 1, 1,
-0.3400213, -0.987306, -5.213245, 1, 0, 0, 1, 1,
-0.3379359, 0.4906929, 1.398093, 1, 0, 0, 1, 1,
-0.3371011, 0.6741698, -0.8870436, 0, 0, 0, 1, 1,
-0.3319404, -0.05687575, -2.102371, 0, 0, 0, 1, 1,
-0.3317481, 0.1480766, -1.782804, 0, 0, 0, 1, 1,
-0.3312663, 0.854575, 0.05740935, 0, 0, 0, 1, 1,
-0.3278709, 0.8282959, -1.168299, 0, 0, 0, 1, 1,
-0.3272543, -0.227035, -2.098866, 0, 0, 0, 1, 1,
-0.3245746, -0.2734545, -2.326483, 0, 0, 0, 1, 1,
-0.3233294, 0.5996724, 0.1032396, 1, 1, 1, 1, 1,
-0.3218021, -1.318492, -3.125191, 1, 1, 1, 1, 1,
-0.3107731, 0.01348595, -1.459416, 1, 1, 1, 1, 1,
-0.3068412, -0.4553636, -2.479604, 1, 1, 1, 1, 1,
-0.2996536, 0.543295, 1.358324, 1, 1, 1, 1, 1,
-0.299489, -0.2168014, -3.767203, 1, 1, 1, 1, 1,
-0.2932268, -0.1952677, -1.106378, 1, 1, 1, 1, 1,
-0.2862006, -0.306251, -3.218534, 1, 1, 1, 1, 1,
-0.2845697, 0.8318022, -2.264315, 1, 1, 1, 1, 1,
-0.2842035, -0.8657205, -6.070662, 1, 1, 1, 1, 1,
-0.2837102, 0.593628, -0.8250793, 1, 1, 1, 1, 1,
-0.2835262, 1.580967, -2.038715, 1, 1, 1, 1, 1,
-0.2817841, -0.4619973, -1.742568, 1, 1, 1, 1, 1,
-0.280081, 0.3817697, -1.654967, 1, 1, 1, 1, 1,
-0.2777971, 0.6573563, -0.2543682, 1, 1, 1, 1, 1,
-0.2759566, -0.8662781, -2.187206, 0, 0, 1, 1, 1,
-0.2756292, -0.2808, -1.542965, 1, 0, 0, 1, 1,
-0.2746031, 0.902318, -0.8692287, 1, 0, 0, 1, 1,
-0.2696276, 1.01564, 1.142634, 1, 0, 0, 1, 1,
-0.2659268, 0.1084683, -1.193428, 1, 0, 0, 1, 1,
-0.26415, 0.9654667, -1.471331, 1, 0, 0, 1, 1,
-0.2607128, 0.01383433, -0.8052114, 0, 0, 0, 1, 1,
-0.2588362, 0.2136433, -1.80334, 0, 0, 0, 1, 1,
-0.2525339, 1.715945, 1.083445, 0, 0, 0, 1, 1,
-0.2481967, 0.9206691, -0.3555378, 0, 0, 0, 1, 1,
-0.2476561, -0.7423277, -3.224762, 0, 0, 0, 1, 1,
-0.2471017, 0.3372141, -2.339228, 0, 0, 0, 1, 1,
-0.245371, -0.3981452, -3.437479, 0, 0, 0, 1, 1,
-0.2443467, -0.8164814, -2.253029, 1, 1, 1, 1, 1,
-0.243832, -2.160027, -3.942121, 1, 1, 1, 1, 1,
-0.2414238, 1.767957, -0.4366824, 1, 1, 1, 1, 1,
-0.2412105, -0.487954, -1.620291, 1, 1, 1, 1, 1,
-0.2410803, -0.4363754, -2.365956, 1, 1, 1, 1, 1,
-0.2378524, -0.2700376, -1.552512, 1, 1, 1, 1, 1,
-0.2319417, 0.9740674, -1.31122, 1, 1, 1, 1, 1,
-0.2290819, 2.633314, 0.4096677, 1, 1, 1, 1, 1,
-0.228975, 0.188579, -0.6405756, 1, 1, 1, 1, 1,
-0.2283862, -0.6289375, -2.465807, 1, 1, 1, 1, 1,
-0.2269081, 0.8928463, -2.385527, 1, 1, 1, 1, 1,
-0.2259682, 1.014157, 0.7828648, 1, 1, 1, 1, 1,
-0.2230684, -0.4820688, -3.324429, 1, 1, 1, 1, 1,
-0.2181126, 0.7285356, 0.5014596, 1, 1, 1, 1, 1,
-0.2171019, -0.3723443, -1.387144, 1, 1, 1, 1, 1,
-0.2165009, -0.1391824, -1.479915, 0, 0, 1, 1, 1,
-0.2109019, 0.7321403, 0.2610535, 1, 0, 0, 1, 1,
-0.2091208, 0.7593843, 1.013297, 1, 0, 0, 1, 1,
-0.205516, 0.07910295, -1.251769, 1, 0, 0, 1, 1,
-0.2037621, 1.12696, 1.269331, 1, 0, 0, 1, 1,
-0.2013388, -0.4158363, -3.648579, 1, 0, 0, 1, 1,
-0.1961113, 0.4662514, -0.3269894, 0, 0, 0, 1, 1,
-0.1949508, 0.02779861, -1.824359, 0, 0, 0, 1, 1,
-0.1907129, -0.6488695, -3.525113, 0, 0, 0, 1, 1,
-0.1901267, -0.8301628, -4.185313, 0, 0, 0, 1, 1,
-0.1867087, -0.8964118, -1.467734, 0, 0, 0, 1, 1,
-0.1815187, -0.5670174, -0.9227486, 0, 0, 0, 1, 1,
-0.1790452, 1.215273, 0.07715615, 0, 0, 0, 1, 1,
-0.1753463, -0.5489941, -4.210474, 1, 1, 1, 1, 1,
-0.1737308, 0.6757065, 0.03254663, 1, 1, 1, 1, 1,
-0.1732536, -0.1215839, -2.837545, 1, 1, 1, 1, 1,
-0.1721465, -0.21684, -5.041332, 1, 1, 1, 1, 1,
-0.171114, 0.3303234, -1.503763, 1, 1, 1, 1, 1,
-0.168927, -0.1756101, -3.575051, 1, 1, 1, 1, 1,
-0.1683533, -0.6200971, -2.208614, 1, 1, 1, 1, 1,
-0.1651545, 0.1951787, 0.5115672, 1, 1, 1, 1, 1,
-0.1617163, 2.280946, -0.4661312, 1, 1, 1, 1, 1,
-0.1555642, -0.2366067, -2.536993, 1, 1, 1, 1, 1,
-0.1485609, -0.526888, -0.6676484, 1, 1, 1, 1, 1,
-0.1433646, -0.88489, -3.238837, 1, 1, 1, 1, 1,
-0.1414753, -0.3115878, -2.733047, 1, 1, 1, 1, 1,
-0.1342206, -0.8643694, -2.717906, 1, 1, 1, 1, 1,
-0.1296427, -0.787442, -4.482683, 1, 1, 1, 1, 1,
-0.1186328, 0.9691518, 0.4358776, 0, 0, 1, 1, 1,
-0.1166678, 1.545557, -0.2358794, 1, 0, 0, 1, 1,
-0.114926, -0.7005979, -2.311987, 1, 0, 0, 1, 1,
-0.1133764, 0.08283804, -1.511493, 1, 0, 0, 1, 1,
-0.1082285, -0.7241698, -2.28841, 1, 0, 0, 1, 1,
-0.1078427, 0.7970572, -0.02101328, 1, 0, 0, 1, 1,
-0.106965, 1.29839, -0.1616779, 0, 0, 0, 1, 1,
-0.1048718, 0.3005945, 0.3952216, 0, 0, 0, 1, 1,
-0.08854152, -1.270241, -3.329299, 0, 0, 0, 1, 1,
-0.07963815, 0.6599777, 0.2272086, 0, 0, 0, 1, 1,
-0.07606632, -0.3315097, -1.740981, 0, 0, 0, 1, 1,
-0.07480515, 0.2109792, -0.8001607, 0, 0, 0, 1, 1,
-0.0669975, -0.2662933, -3.579411, 0, 0, 0, 1, 1,
-0.0662612, -1.548849, -2.936014, 1, 1, 1, 1, 1,
-0.06579193, 1.583762, 0.100293, 1, 1, 1, 1, 1,
-0.06312909, 1.375356, -0.6638852, 1, 1, 1, 1, 1,
-0.06224256, 0.818307, -1.128522, 1, 1, 1, 1, 1,
-0.05847257, -1.146024, -3.579816, 1, 1, 1, 1, 1,
-0.05674627, 1.572405, 1.065347, 1, 1, 1, 1, 1,
-0.05579061, -0.01374572, -1.337489, 1, 1, 1, 1, 1,
-0.05416156, 0.5264279, 0.003171558, 1, 1, 1, 1, 1,
-0.04985661, -0.8777696, -5.516664, 1, 1, 1, 1, 1,
-0.04855857, -0.980727, 0.3378591, 1, 1, 1, 1, 1,
-0.0482311, -1.124838, -2.248513, 1, 1, 1, 1, 1,
-0.04630572, -0.2594666, -3.21572, 1, 1, 1, 1, 1,
-0.04573771, 0.2306469, 0.03531102, 1, 1, 1, 1, 1,
-0.04119973, 0.4911005, 0.2710693, 1, 1, 1, 1, 1,
-0.04098251, -1.049378, -3.991308, 1, 1, 1, 1, 1,
-0.03194805, 0.7927094, -0.1938519, 0, 0, 1, 1, 1,
-0.02893235, -1.119569, -3.612561, 1, 0, 0, 1, 1,
-0.02657847, 0.5001031, -0.2508477, 1, 0, 0, 1, 1,
-0.02346634, -1.82361, -3.739552, 1, 0, 0, 1, 1,
-0.02306885, -0.2940881, -2.361886, 1, 0, 0, 1, 1,
-0.02157154, -0.2177511, -4.640837, 1, 0, 0, 1, 1,
-0.01949402, -1.031594, -3.508087, 0, 0, 0, 1, 1,
-0.01826387, -1.283664, -2.821834, 0, 0, 0, 1, 1,
-0.01168737, 1.285387, -0.742851, 0, 0, 0, 1, 1,
-0.01112975, -0.02197445, -2.584714, 0, 0, 0, 1, 1,
-0.01049186, 1.628644, -0.8530989, 0, 0, 0, 1, 1,
-0.006663176, -0.4928984, -4.522267, 0, 0, 0, 1, 1,
-0.002502679, 0.8722023, -1.62756, 0, 0, 0, 1, 1,
-0.001737824, 0.188058, -2.048024, 1, 1, 1, 1, 1,
-0.001599876, -0.3182706, -3.131434, 1, 1, 1, 1, 1,
0.0001326025, 0.1753228, -0.07484203, 1, 1, 1, 1, 1,
0.001564488, -0.2310433, 3.313286, 1, 1, 1, 1, 1,
0.001675731, -0.9366103, 2.85164, 1, 1, 1, 1, 1,
0.00212497, -0.8189426, 2.059088, 1, 1, 1, 1, 1,
0.006563158, 0.2355841, -0.9331981, 1, 1, 1, 1, 1,
0.008109291, -0.6590457, 3.702277, 1, 1, 1, 1, 1,
0.01142176, -0.5368319, 2.128502, 1, 1, 1, 1, 1,
0.0120325, 0.9783733, -0.02834588, 1, 1, 1, 1, 1,
0.01314957, -0.8552042, 2.474465, 1, 1, 1, 1, 1,
0.01447094, 0.1888276, -0.5056439, 1, 1, 1, 1, 1,
0.01474031, 1.824584, -0.6437289, 1, 1, 1, 1, 1,
0.01551297, 0.3668593, -1.312119, 1, 1, 1, 1, 1,
0.01725655, -0.2766857, 2.348073, 1, 1, 1, 1, 1,
0.02204835, -0.8341955, 3.628197, 0, 0, 1, 1, 1,
0.0252805, -0.8343751, 2.991634, 1, 0, 0, 1, 1,
0.0259129, -0.04203763, 1.89102, 1, 0, 0, 1, 1,
0.02647664, 0.5361574, 0.2939932, 1, 0, 0, 1, 1,
0.02828052, -1.258119, 2.130573, 1, 0, 0, 1, 1,
0.0410713, -1.011055, 0.9170172, 1, 0, 0, 1, 1,
0.04261295, -0.2939251, 3.16385, 0, 0, 0, 1, 1,
0.04457678, -1.754096, 3.367577, 0, 0, 0, 1, 1,
0.04648174, 1.95489, -0.4300621, 0, 0, 0, 1, 1,
0.046556, -1.619614, 3.033355, 0, 0, 0, 1, 1,
0.04676727, -0.2349934, 2.442714, 0, 0, 0, 1, 1,
0.04831385, 1.067782, -0.2751423, 0, 0, 0, 1, 1,
0.05156892, -0.5111806, 2.159077, 0, 0, 0, 1, 1,
0.05232876, -0.7675821, 4.25594, 1, 1, 1, 1, 1,
0.0526753, -0.2397389, 1.867283, 1, 1, 1, 1, 1,
0.05299345, 0.7418765, -0.6513596, 1, 1, 1, 1, 1,
0.05553468, 1.098268, 0.3167505, 1, 1, 1, 1, 1,
0.05982566, -0.303616, 3.734552, 1, 1, 1, 1, 1,
0.05988564, 1.062997, -0.8151384, 1, 1, 1, 1, 1,
0.06762441, 0.7376841, -0.5277903, 1, 1, 1, 1, 1,
0.06772577, -0.6363413, 2.665925, 1, 1, 1, 1, 1,
0.06861155, -0.02419644, 2.755129, 1, 1, 1, 1, 1,
0.06879459, -1.214923, 3.566096, 1, 1, 1, 1, 1,
0.0692602, -0.1163314, 1.717372, 1, 1, 1, 1, 1,
0.06944498, 0.8843489, 0.008464833, 1, 1, 1, 1, 1,
0.07041052, -1.720046, 3.052607, 1, 1, 1, 1, 1,
0.07614392, -0.5654058, 3.819694, 1, 1, 1, 1, 1,
0.07696982, -0.1597656, 1.209926, 1, 1, 1, 1, 1,
0.08023522, -1.432212, 1.488014, 0, 0, 1, 1, 1,
0.08189281, -0.7307822, 3.643689, 1, 0, 0, 1, 1,
0.08379228, 0.3726997, -0.1733991, 1, 0, 0, 1, 1,
0.08712906, -0.159716, 2.63227, 1, 0, 0, 1, 1,
0.08917034, 0.03530524, -0.1836675, 1, 0, 0, 1, 1,
0.09039313, 1.72683, -0.1676701, 1, 0, 0, 1, 1,
0.09685162, -0.8949763, 3.279712, 0, 0, 0, 1, 1,
0.09951811, 1.272225, 0.2149239, 0, 0, 0, 1, 1,
0.1022403, -0.6930256, 2.368526, 0, 0, 0, 1, 1,
0.1044758, -1.210223, 1.617035, 0, 0, 0, 1, 1,
0.1087821, -0.1928272, 2.996434, 0, 0, 0, 1, 1,
0.112509, -0.09980533, 1.563028, 0, 0, 0, 1, 1,
0.1138375, 0.05644422, 0.3933922, 0, 0, 0, 1, 1,
0.114333, -0.4422072, 3.183393, 1, 1, 1, 1, 1,
0.1148726, 0.8945186, 1.40375, 1, 1, 1, 1, 1,
0.117062, -1.199272, 1.640893, 1, 1, 1, 1, 1,
0.1177029, 1.424856, 0.7871568, 1, 1, 1, 1, 1,
0.1231898, -1.070874, 4.262756, 1, 1, 1, 1, 1,
0.1251133, 0.2728458, -0.7910905, 1, 1, 1, 1, 1,
0.1270565, -0.8137931, 2.842058, 1, 1, 1, 1, 1,
0.1293715, -1.196732, 3.644231, 1, 1, 1, 1, 1,
0.1296822, -1.422569, 3.691732, 1, 1, 1, 1, 1,
0.1371018, -0.02789451, 2.260297, 1, 1, 1, 1, 1,
0.1412199, 1.048944, -0.5558357, 1, 1, 1, 1, 1,
0.1432641, -1.642132, 2.905927, 1, 1, 1, 1, 1,
0.14395, 0.3300411, 0.7083972, 1, 1, 1, 1, 1,
0.1441327, 0.1363917, 2.742843, 1, 1, 1, 1, 1,
0.1445829, 0.1605216, 1.411589, 1, 1, 1, 1, 1,
0.1505059, 0.08288024, 0.9860747, 0, 0, 1, 1, 1,
0.1517681, -0.7042082, 1.909907, 1, 0, 0, 1, 1,
0.1545346, 0.8793722, 1.671744, 1, 0, 0, 1, 1,
0.1550292, 0.3414963, 0.5990282, 1, 0, 0, 1, 1,
0.157063, 0.7731237, 1.344279, 1, 0, 0, 1, 1,
0.1609143, -0.9100203, 2.59454, 1, 0, 0, 1, 1,
0.1631213, -0.5786259, 2.164495, 0, 0, 0, 1, 1,
0.1667809, 1.875019, -0.8874749, 0, 0, 0, 1, 1,
0.1711904, 0.07716364, 0.7658255, 0, 0, 0, 1, 1,
0.172619, 1.088673, -0.6854734, 0, 0, 0, 1, 1,
0.1732602, 1.429855, -0.3859048, 0, 0, 0, 1, 1,
0.1745661, -0.9659369, 2.704546, 0, 0, 0, 1, 1,
0.1768316, -0.4085664, 2.379185, 0, 0, 0, 1, 1,
0.1814317, 0.4881226, -1.342645, 1, 1, 1, 1, 1,
0.1835558, -0.731609, 3.683521, 1, 1, 1, 1, 1,
0.1837555, -0.7881861, 2.687373, 1, 1, 1, 1, 1,
0.1902449, -0.3725297, 2.381785, 1, 1, 1, 1, 1,
0.1909355, -0.008735555, 1.519299, 1, 1, 1, 1, 1,
0.1974611, 0.832457, -0.6017717, 1, 1, 1, 1, 1,
0.2029627, -2.128614, 1.573551, 1, 1, 1, 1, 1,
0.2049674, 0.6935988, 0.9100682, 1, 1, 1, 1, 1,
0.2150366, -0.494545, 3.250084, 1, 1, 1, 1, 1,
0.2186113, -0.359214, 2.705234, 1, 1, 1, 1, 1,
0.2190327, -1.802294, 3.495015, 1, 1, 1, 1, 1,
0.2194923, 0.07868488, 1.940084, 1, 1, 1, 1, 1,
0.2198638, 2.122412, 0.6909407, 1, 1, 1, 1, 1,
0.2206124, -0.4082717, 1.261084, 1, 1, 1, 1, 1,
0.2208354, 0.4109071, -0.0284449, 1, 1, 1, 1, 1,
0.2234091, 0.4393735, 0.00267654, 0, 0, 1, 1, 1,
0.2273373, -2.355809, 2.334883, 1, 0, 0, 1, 1,
0.228771, -0.6425849, 0.6489799, 1, 0, 0, 1, 1,
0.2292666, 0.02480894, 1.247982, 1, 0, 0, 1, 1,
0.2334832, 1.313556, 2.555199, 1, 0, 0, 1, 1,
0.2403867, -0.9728855, 2.296547, 1, 0, 0, 1, 1,
0.2409204, -0.2920746, 2.222963, 0, 0, 0, 1, 1,
0.2474846, -0.0196272, 1.645425, 0, 0, 0, 1, 1,
0.2475431, 0.05926822, -0.03454672, 0, 0, 0, 1, 1,
0.2475892, -0.08173187, 0.7815765, 0, 0, 0, 1, 1,
0.2487027, 0.8809999, 1.768663, 0, 0, 0, 1, 1,
0.252912, 0.641699, -0.3295855, 0, 0, 0, 1, 1,
0.2561359, 0.1702565, 0.6560567, 0, 0, 0, 1, 1,
0.2634947, -1.965921, 2.285136, 1, 1, 1, 1, 1,
0.2686781, 1.26195, -0.7020823, 1, 1, 1, 1, 1,
0.2690564, -1.337358, 3.149712, 1, 1, 1, 1, 1,
0.2696726, -1.192767, 3.448809, 1, 1, 1, 1, 1,
0.270524, -0.7629927, 4.078205, 1, 1, 1, 1, 1,
0.2719988, 0.1539891, 1.538768, 1, 1, 1, 1, 1,
0.2726893, -2.501092, 3.389304, 1, 1, 1, 1, 1,
0.2778321, 1.131174, 0.5041857, 1, 1, 1, 1, 1,
0.2868178, -0.8137668, 2.879104, 1, 1, 1, 1, 1,
0.2893805, 0.06847042, 0.9034891, 1, 1, 1, 1, 1,
0.2978493, -0.3628743, 2.503547, 1, 1, 1, 1, 1,
0.3000686, -1.373494, 2.309339, 1, 1, 1, 1, 1,
0.3030742, -1.062699, 2.848805, 1, 1, 1, 1, 1,
0.3047395, 0.7442358, 1.663449, 1, 1, 1, 1, 1,
0.3078386, -0.1448305, 1.168644, 1, 1, 1, 1, 1,
0.3086729, 0.9647093, 0.3895, 0, 0, 1, 1, 1,
0.3095041, -0.7536463, 3.987274, 1, 0, 0, 1, 1,
0.3104777, -0.2040554, 2.924574, 1, 0, 0, 1, 1,
0.3113664, 0.5320703, -0.3239453, 1, 0, 0, 1, 1,
0.3124009, -0.1130111, 1.411777, 1, 0, 0, 1, 1,
0.3149692, 1.655302, -0.004720317, 1, 0, 0, 1, 1,
0.3162743, 0.4489071, -0.6730845, 0, 0, 0, 1, 1,
0.3185351, 0.2695279, 0.7641296, 0, 0, 0, 1, 1,
0.3204891, -1.365035, 4.21484, 0, 0, 0, 1, 1,
0.321039, 0.7868242, -0.3782783, 0, 0, 0, 1, 1,
0.322807, -1.723077, 2.252187, 0, 0, 0, 1, 1,
0.3375207, 0.3997577, 2.224103, 0, 0, 0, 1, 1,
0.3409285, -1.922755, 2.653368, 0, 0, 0, 1, 1,
0.3473648, 0.04154303, 2.419152, 1, 1, 1, 1, 1,
0.3528963, -0.2195685, 4.16785, 1, 1, 1, 1, 1,
0.3595433, 0.7510528, 0.1716657, 1, 1, 1, 1, 1,
0.3595912, -0.742379, 1.881682, 1, 1, 1, 1, 1,
0.3641954, -0.3845419, 2.378578, 1, 1, 1, 1, 1,
0.369775, 1.414998, 1.450019, 1, 1, 1, 1, 1,
0.3704952, -2.04991, 5.268947, 1, 1, 1, 1, 1,
0.3772985, 0.8157601, 1.923628, 1, 1, 1, 1, 1,
0.3789853, 0.01706138, -1.349853, 1, 1, 1, 1, 1,
0.3792359, -0.3848916, 2.245248, 1, 1, 1, 1, 1,
0.3820232, -1.391529, 1.655367, 1, 1, 1, 1, 1,
0.382031, -0.02134215, 1.723619, 1, 1, 1, 1, 1,
0.3827814, 0.1532498, 0.4301151, 1, 1, 1, 1, 1,
0.3836281, 2.102347, -1.120181, 1, 1, 1, 1, 1,
0.383906, -0.557431, 2.91187, 1, 1, 1, 1, 1,
0.3852848, -0.2253189, 3.382165, 0, 0, 1, 1, 1,
0.3942258, -1.395505, 2.501089, 1, 0, 0, 1, 1,
0.3984372, -0.03060806, 2.357806, 1, 0, 0, 1, 1,
0.3999503, -1.248134, 4.017119, 1, 0, 0, 1, 1,
0.4061839, -1.621358, 3.190492, 1, 0, 0, 1, 1,
0.4067473, -0.7209223, 2.178837, 1, 0, 0, 1, 1,
0.4082084, -1.829477, 3.150461, 0, 0, 0, 1, 1,
0.4087685, 0.7600518, 1.277628, 0, 0, 0, 1, 1,
0.4133749, 1.761515, -0.7340077, 0, 0, 0, 1, 1,
0.4139943, 0.8928685, 1.860701, 0, 0, 0, 1, 1,
0.4151104, 1.953163, 0.2510929, 0, 0, 0, 1, 1,
0.4177383, -0.7149715, 1.920624, 0, 0, 0, 1, 1,
0.4188384, -0.9309523, 3.068387, 0, 0, 0, 1, 1,
0.4228709, 1.009654, -0.1495219, 1, 1, 1, 1, 1,
0.4295063, -0.868578, 0.2013005, 1, 1, 1, 1, 1,
0.429741, -0.7536231, 3.380832, 1, 1, 1, 1, 1,
0.4334502, -1.508693, 3.041384, 1, 1, 1, 1, 1,
0.4393168, 0.698905, 1.711041, 1, 1, 1, 1, 1,
0.4418142, -1.16329, 2.785821, 1, 1, 1, 1, 1,
0.4441171, 1.119115, 0.8344484, 1, 1, 1, 1, 1,
0.4458531, -1.309237, 2.690435, 1, 1, 1, 1, 1,
0.4472925, -0.9076048, 2.454115, 1, 1, 1, 1, 1,
0.44971, -0.7100983, 0.9810561, 1, 1, 1, 1, 1,
0.4547572, -0.09385235, 0.5446385, 1, 1, 1, 1, 1,
0.4586754, -1.718673, 2.921269, 1, 1, 1, 1, 1,
0.4613054, -0.5155906, 3.30835, 1, 1, 1, 1, 1,
0.4654465, 0.3964604, 1.022421, 1, 1, 1, 1, 1,
0.4695926, -2.390787, 3.078023, 1, 1, 1, 1, 1,
0.4742268, 0.2902783, 0.4592811, 0, 0, 1, 1, 1,
0.4769388, -0.3721933, 2.343125, 1, 0, 0, 1, 1,
0.4819272, -0.6739715, 2.096725, 1, 0, 0, 1, 1,
0.4846244, -0.7794893, 3.377662, 1, 0, 0, 1, 1,
0.4862335, 3.411857, 0.557051, 1, 0, 0, 1, 1,
0.4904284, 0.2585332, 2.274923, 1, 0, 0, 1, 1,
0.4933506, -0.2032928, 4.223636, 0, 0, 0, 1, 1,
0.4948069, 0.5984914, 3.444585, 0, 0, 0, 1, 1,
0.495864, -0.6996374, 2.469616, 0, 0, 0, 1, 1,
0.4985899, -0.1608776, 2.68003, 0, 0, 0, 1, 1,
0.5040976, -0.2246729, 1.648475, 0, 0, 0, 1, 1,
0.5053797, -0.3391406, 3.961976, 0, 0, 0, 1, 1,
0.5165313, -0.1185169, 1.136023, 0, 0, 0, 1, 1,
0.5191436, 0.1140245, 1.981088, 1, 1, 1, 1, 1,
0.5212408, -0.5171663, 1.74162, 1, 1, 1, 1, 1,
0.5219478, 0.3323495, 0.3035628, 1, 1, 1, 1, 1,
0.5250248, -2.750685, 3.999099, 1, 1, 1, 1, 1,
0.5303785, 0.7461903, -0.1465559, 1, 1, 1, 1, 1,
0.5305163, 0.03083246, 2.181312, 1, 1, 1, 1, 1,
0.5346754, 0.09078971, 2.72463, 1, 1, 1, 1, 1,
0.5353585, 1.506025, -0.6642524, 1, 1, 1, 1, 1,
0.5410921, 0.09898082, 0.2889929, 1, 1, 1, 1, 1,
0.5411442, -1.237615, 1.19405, 1, 1, 1, 1, 1,
0.5462914, -1.045209, 2.632889, 1, 1, 1, 1, 1,
0.5466397, -0.974058, 3.011465, 1, 1, 1, 1, 1,
0.547271, 1.661007, 0.3324928, 1, 1, 1, 1, 1,
0.547487, 0.377507, 1.305871, 1, 1, 1, 1, 1,
0.5493927, 0.1207419, 0.1771313, 1, 1, 1, 1, 1,
0.5496694, 1.038029, 0.6567844, 0, 0, 1, 1, 1,
0.5514671, 1.146122, 0.8470431, 1, 0, 0, 1, 1,
0.5515098, 3.128845, 0.8802744, 1, 0, 0, 1, 1,
0.5517199, 0.2032553, 0.896245, 1, 0, 0, 1, 1,
0.5525064, 0.4692807, 1.80323, 1, 0, 0, 1, 1,
0.5564811, -1.709468, 3.380754, 1, 0, 0, 1, 1,
0.5625598, 2.564868, 0.5128288, 0, 0, 0, 1, 1,
0.5693943, -1.883881, 2.414509, 0, 0, 0, 1, 1,
0.5713463, 0.1859303, 1.700416, 0, 0, 0, 1, 1,
0.5749274, 2.175504, -0.7479845, 0, 0, 0, 1, 1,
0.5761842, -0.6131047, 2.33361, 0, 0, 0, 1, 1,
0.5775182, 0.6067112, 2.059948, 0, 0, 0, 1, 1,
0.5816522, -1.318294, 3.212986, 0, 0, 0, 1, 1,
0.5861065, -0.7455011, 1.281623, 1, 1, 1, 1, 1,
0.5951938, -1.972567, 2.662877, 1, 1, 1, 1, 1,
0.6002721, -0.3419198, 4.450263, 1, 1, 1, 1, 1,
0.6025035, 0.4658443, 0.5121344, 1, 1, 1, 1, 1,
0.6055441, -1.052909, 1.894443, 1, 1, 1, 1, 1,
0.6066713, -1.301019, 3.37849, 1, 1, 1, 1, 1,
0.6069849, 0.8287843, -0.08831386, 1, 1, 1, 1, 1,
0.607703, -0.08179302, 2.008986, 1, 1, 1, 1, 1,
0.6113289, 0.7595891, -1.100237, 1, 1, 1, 1, 1,
0.6153818, 0.9930117, 0.9715881, 1, 1, 1, 1, 1,
0.6212881, -0.2947859, 2.944971, 1, 1, 1, 1, 1,
0.6288264, -0.2767709, 2.689996, 1, 1, 1, 1, 1,
0.6338673, -0.09935939, 2.615876, 1, 1, 1, 1, 1,
0.6391312, 0.07539257, 1.284458, 1, 1, 1, 1, 1,
0.6397979, 2.370079, 2.061451, 1, 1, 1, 1, 1,
0.6436554, -0.3075241, 4.174242, 0, 0, 1, 1, 1,
0.6499795, -1.237668, 1.491286, 1, 0, 0, 1, 1,
0.6503609, 0.08749141, 1.734767, 1, 0, 0, 1, 1,
0.6569289, -1.32352, 2.791373, 1, 0, 0, 1, 1,
0.6586125, 1.061209, -0.3103313, 1, 0, 0, 1, 1,
0.6600325, 1.048444, 0.459013, 1, 0, 0, 1, 1,
0.6652136, -1.031624, 4.096417, 0, 0, 0, 1, 1,
0.6679525, 0.3502022, 1.172663, 0, 0, 0, 1, 1,
0.6694434, -0.1051958, 0.06955563, 0, 0, 0, 1, 1,
0.6708307, -0.2943076, 2.430805, 0, 0, 0, 1, 1,
0.6718026, -0.06107628, 0.178698, 0, 0, 0, 1, 1,
0.6729404, -2.3501, 2.390663, 0, 0, 0, 1, 1,
0.6831676, 0.1943123, -0.7870204, 0, 0, 0, 1, 1,
0.6835146, -0.5921851, 0.5911631, 1, 1, 1, 1, 1,
0.6836982, 0.3264978, 0.3365079, 1, 1, 1, 1, 1,
0.6881424, -0.4680133, 2.785243, 1, 1, 1, 1, 1,
0.6892624, 0.6879222, 0.7064728, 1, 1, 1, 1, 1,
0.6911787, -0.4579784, 2.069208, 1, 1, 1, 1, 1,
0.6956578, -1.60441, -0.1050528, 1, 1, 1, 1, 1,
0.6961428, -0.2009478, 1.606714, 1, 1, 1, 1, 1,
0.6987564, -1.87507, 2.963274, 1, 1, 1, 1, 1,
0.7013939, 0.7843086, 1.773839, 1, 1, 1, 1, 1,
0.7021459, -1.095786, 1.687128, 1, 1, 1, 1, 1,
0.7051328, -0.08586848, 2.723468, 1, 1, 1, 1, 1,
0.7078533, 0.8668664, 0.153265, 1, 1, 1, 1, 1,
0.7082554, -0.07734297, 1.229112, 1, 1, 1, 1, 1,
0.7130148, -1.359695, 1.853477, 1, 1, 1, 1, 1,
0.7145631, 0.1274423, 2.6626, 1, 1, 1, 1, 1,
0.7182029, -0.441687, 2.840876, 0, 0, 1, 1, 1,
0.7197399, 1.790175, -1.317331, 1, 0, 0, 1, 1,
0.7201413, -1.060218, 3.400146, 1, 0, 0, 1, 1,
0.7221655, -0.2514919, 0.7171603, 1, 0, 0, 1, 1,
0.7239251, 0.1151682, 1.745736, 1, 0, 0, 1, 1,
0.7309188, 0.20729, 1.102589, 1, 0, 0, 1, 1,
0.7312647, 0.7548872, -1.993, 0, 0, 0, 1, 1,
0.7318756, -0.8556472, 1.13048, 0, 0, 0, 1, 1,
0.7392492, 0.6114633, 1.574274, 0, 0, 0, 1, 1,
0.7422283, 0.2264948, 2.367335, 0, 0, 0, 1, 1,
0.7443094, 0.7372237, 2.182814, 0, 0, 0, 1, 1,
0.7489279, 2.209914, 1.531462, 0, 0, 0, 1, 1,
0.7537936, -0.4686333, 3.15432, 0, 0, 0, 1, 1,
0.7547691, 0.5482854, 2.183091, 1, 1, 1, 1, 1,
0.7585463, 0.4812084, 1.631858, 1, 1, 1, 1, 1,
0.7713307, 0.4284053, 0.5204673, 1, 1, 1, 1, 1,
0.7762104, -1.354651, 1.156607, 1, 1, 1, 1, 1,
0.779707, -0.09941643, 1.737774, 1, 1, 1, 1, 1,
0.7861148, 1.107137, 0.8184112, 1, 1, 1, 1, 1,
0.7913074, -0.6481228, 1.177814, 1, 1, 1, 1, 1,
0.7929662, -0.9815519, 4.008085, 1, 1, 1, 1, 1,
0.7931927, 0.1618197, 1.912585, 1, 1, 1, 1, 1,
0.7934126, -1.022275, 3.747849, 1, 1, 1, 1, 1,
0.7976572, 1.222751, 1.374425, 1, 1, 1, 1, 1,
0.7981992, -0.4446421, 0.371982, 1, 1, 1, 1, 1,
0.7991132, 0.792465, 2.064149, 1, 1, 1, 1, 1,
0.802255, 0.89001, 1.915187, 1, 1, 1, 1, 1,
0.8053403, -1.21642, 0.880645, 1, 1, 1, 1, 1,
0.807825, 0.2097579, 1.685567, 0, 0, 1, 1, 1,
0.80849, 0.0822592, 2.87133, 1, 0, 0, 1, 1,
0.8131465, 0.2597464, 2.463516, 1, 0, 0, 1, 1,
0.8149861, 0.9966424, 2.304353, 1, 0, 0, 1, 1,
0.8182638, 0.4318152, 2.541873, 1, 0, 0, 1, 1,
0.8196169, -0.04881142, 2.124615, 1, 0, 0, 1, 1,
0.8197778, 0.932402, 0.6816643, 0, 0, 0, 1, 1,
0.8216509, 0.8222567, 1.278193, 0, 0, 0, 1, 1,
0.8237903, -0.05587655, 2.203614, 0, 0, 0, 1, 1,
0.8278843, 0.1844749, 1.986082, 0, 0, 0, 1, 1,
0.8299449, 1.200871, 1.141943, 0, 0, 0, 1, 1,
0.8332654, 1.694054, 2.01564, 0, 0, 0, 1, 1,
0.8385864, 0.5419874, -0.7249046, 0, 0, 0, 1, 1,
0.8409785, 0.5614839, 1.419709, 1, 1, 1, 1, 1,
0.8455965, -1.13052, 0.1990815, 1, 1, 1, 1, 1,
0.8500149, -1.416036, 3.053626, 1, 1, 1, 1, 1,
0.8511919, 0.297837, 1.439378, 1, 1, 1, 1, 1,
0.8544388, -0.7445205, 2.935091, 1, 1, 1, 1, 1,
0.8558658, 0.5010933, 0.6153707, 1, 1, 1, 1, 1,
0.8561822, -2.025183, 1.811049, 1, 1, 1, 1, 1,
0.8594404, -0.4690159, 1.226805, 1, 1, 1, 1, 1,
0.8656229, -1.669684, 3.82897, 1, 1, 1, 1, 1,
0.8895519, -0.469237, 0.5251769, 1, 1, 1, 1, 1,
0.8907189, -0.2222486, 2.527289, 1, 1, 1, 1, 1,
0.8922172, -0.7514353, 0.9362635, 1, 1, 1, 1, 1,
0.9007246, 1.974386, 0.9050587, 1, 1, 1, 1, 1,
0.900833, 0.118211, 1.621479, 1, 1, 1, 1, 1,
0.9053911, 1.077577, 0.073105, 1, 1, 1, 1, 1,
0.9178292, 1.854034, -0.9487582, 0, 0, 1, 1, 1,
0.9234686, -0.8512543, 0.9635097, 1, 0, 0, 1, 1,
0.9247148, 0.3617271, 2.675152, 1, 0, 0, 1, 1,
0.9263938, -1.503245, 2.005111, 1, 0, 0, 1, 1,
0.9304529, -0.9378271, 3.026909, 1, 0, 0, 1, 1,
0.9412452, -0.8793359, 3.729847, 1, 0, 0, 1, 1,
0.9456314, -0.0573268, 0.6869566, 0, 0, 0, 1, 1,
0.9469738, -1.076617, 3.289647, 0, 0, 0, 1, 1,
0.9470411, 0.002143222, 1.609609, 0, 0, 0, 1, 1,
0.9481175, -0.1284298, 1.865722, 0, 0, 0, 1, 1,
0.9573467, 0.573236, 0.8591589, 0, 0, 0, 1, 1,
0.9609542, -0.7242898, 2.671527, 0, 0, 0, 1, 1,
0.9743344, 0.03020317, 1.639957, 0, 0, 0, 1, 1,
0.9781595, 0.8000876, 2.65468, 1, 1, 1, 1, 1,
0.9818148, 0.6403688, 1.490785, 1, 1, 1, 1, 1,
0.9823373, 0.2308845, 1.593813, 1, 1, 1, 1, 1,
0.9874462, 0.5517362, 1.243381, 1, 1, 1, 1, 1,
0.989713, 0.3626477, -0.9606439, 1, 1, 1, 1, 1,
0.9931041, 1.130047, 0.8537268, 1, 1, 1, 1, 1,
0.994901, 1.102318, 1.631956, 1, 1, 1, 1, 1,
0.9965647, 0.278464, 1.554348, 1, 1, 1, 1, 1,
0.9974925, 0.8044931, -0.4056975, 1, 1, 1, 1, 1,
0.999559, -0.1442656, 1.845245, 1, 1, 1, 1, 1,
1.004953, 0.7484692, 1.32956, 1, 1, 1, 1, 1,
1.006167, 1.096536, 1.720693, 1, 1, 1, 1, 1,
1.013712, 2.300801, 3.315808, 1, 1, 1, 1, 1,
1.016576, -1.063938, 4.327724, 1, 1, 1, 1, 1,
1.023324, -0.1207068, 2.63368, 1, 1, 1, 1, 1,
1.030248, 0.6691503, -0.06031831, 0, 0, 1, 1, 1,
1.0355, 0.5896397, 0.5641624, 1, 0, 0, 1, 1,
1.037179, -0.477462, 2.639101, 1, 0, 0, 1, 1,
1.037936, 1.445109, 2.636251, 1, 0, 0, 1, 1,
1.037956, 1.026178, 0.03498038, 1, 0, 0, 1, 1,
1.037999, 1.274736, 2.074688, 1, 0, 0, 1, 1,
1.0439, 0.5452992, 1.954411, 0, 0, 0, 1, 1,
1.051287, 0.1694598, 0.678537, 0, 0, 0, 1, 1,
1.052775, 0.305015, 1.705136, 0, 0, 0, 1, 1,
1.057124, 0.10713, 1.986304, 0, 0, 0, 1, 1,
1.06658, 1.258708, 0.6099193, 0, 0, 0, 1, 1,
1.070228, 1.073509, 0.3166625, 0, 0, 0, 1, 1,
1.072978, 0.8775797, 0.832448, 0, 0, 0, 1, 1,
1.082049, 1.333512, 2.009164, 1, 1, 1, 1, 1,
1.089391, 2.185869, 0.3024648, 1, 1, 1, 1, 1,
1.095199, -0.6024387, 2.896863, 1, 1, 1, 1, 1,
1.10033, 1.619141, 2.922398, 1, 1, 1, 1, 1,
1.102525, -0.7627725, 2.697982, 1, 1, 1, 1, 1,
1.104893, -1.348064, 4.144139, 1, 1, 1, 1, 1,
1.106184, -0.3817372, 2.230199, 1, 1, 1, 1, 1,
1.111807, 1.184682, 0.4025615, 1, 1, 1, 1, 1,
1.113114, -0.4581389, 0.0882435, 1, 1, 1, 1, 1,
1.114613, 0.9269835, 1.468461, 1, 1, 1, 1, 1,
1.114929, -0.4987701, 2.39361, 1, 1, 1, 1, 1,
1.121408, -1.053705, 0.9992628, 1, 1, 1, 1, 1,
1.124239, -1.193443, 1.410958, 1, 1, 1, 1, 1,
1.124942, 0.7128674, 0.9532664, 1, 1, 1, 1, 1,
1.127845, 1.852374, -0.3202178, 1, 1, 1, 1, 1,
1.133729, 0.9075248, 0.7694578, 0, 0, 1, 1, 1,
1.136563, -1.656286, 1.023337, 1, 0, 0, 1, 1,
1.137865, 0.9748121, 2.740286, 1, 0, 0, 1, 1,
1.148332, -1.333631, 3.767709, 1, 0, 0, 1, 1,
1.151407, -0.6396781, 2.737891, 1, 0, 0, 1, 1,
1.151507, 1.265819, -0.5734745, 1, 0, 0, 1, 1,
1.157487, 0.5186738, 0.620975, 0, 0, 0, 1, 1,
1.162113, -0.605527, 0.994898, 0, 0, 0, 1, 1,
1.170864, -1.085064, 3.611485, 0, 0, 0, 1, 1,
1.177484, 0.5516881, -0.7721133, 0, 0, 0, 1, 1,
1.181558, -1.281307, 3.53414, 0, 0, 0, 1, 1,
1.185472, -1.817822, 1.800626, 0, 0, 0, 1, 1,
1.189798, -1.152904, 2.008307, 0, 0, 0, 1, 1,
1.191734, -0.6564814, 1.298232, 1, 1, 1, 1, 1,
1.199409, 0.2808271, 2.921265, 1, 1, 1, 1, 1,
1.204835, -0.7836784, 1.121113, 1, 1, 1, 1, 1,
1.208463, 1.362467, 0.8132831, 1, 1, 1, 1, 1,
1.210629, -2.347547, 2.431361, 1, 1, 1, 1, 1,
1.214403, -0.3551908, 1.070853, 1, 1, 1, 1, 1,
1.218494, 0.3907749, 0.1185846, 1, 1, 1, 1, 1,
1.226582, 0.9311876, 0.6015446, 1, 1, 1, 1, 1,
1.226864, -0.77968, 3.220016, 1, 1, 1, 1, 1,
1.23006, 1.226795, 1.529524, 1, 1, 1, 1, 1,
1.232192, 0.959092, -0.3544613, 1, 1, 1, 1, 1,
1.23358, 0.5761759, -0.5265229, 1, 1, 1, 1, 1,
1.242766, -0.7419054, 2.468553, 1, 1, 1, 1, 1,
1.250435, 0.6221083, 2.366136, 1, 1, 1, 1, 1,
1.256393, 0.315817, 0.8113065, 1, 1, 1, 1, 1,
1.261939, -1.503544, 3.467588, 0, 0, 1, 1, 1,
1.264379, 0.9995495, 1.82394, 1, 0, 0, 1, 1,
1.278946, 1.646213, 0.8288653, 1, 0, 0, 1, 1,
1.280075, -0.7482756, 3.678198, 1, 0, 0, 1, 1,
1.284785, 0.1474354, 0.7665715, 1, 0, 0, 1, 1,
1.285372, 0.1968303, 0.8715004, 1, 0, 0, 1, 1,
1.306541, -0.3180591, 2.10103, 0, 0, 0, 1, 1,
1.310089, -1.219627, 2.105908, 0, 0, 0, 1, 1,
1.319391, -0.1333013, 1.619617, 0, 0, 0, 1, 1,
1.329746, -1.609785, 1.52413, 0, 0, 0, 1, 1,
1.335725, 0.5165265, 0.2667362, 0, 0, 0, 1, 1,
1.342141, -0.2256221, 0.2242474, 0, 0, 0, 1, 1,
1.349563, -0.2377074, 1.848544, 0, 0, 0, 1, 1,
1.349969, -1.788164, 1.620425, 1, 1, 1, 1, 1,
1.36327, -1.265265, 1.655992, 1, 1, 1, 1, 1,
1.366242, 0.5965095, 1.938566, 1, 1, 1, 1, 1,
1.387823, -0.6930827, 0.8258797, 1, 1, 1, 1, 1,
1.402878, -2.288115, 1.163905, 1, 1, 1, 1, 1,
1.404361, 0.1362167, -0.06495895, 1, 1, 1, 1, 1,
1.404693, 1.576969, 0.3852738, 1, 1, 1, 1, 1,
1.423537, 0.4372088, 0.9476821, 1, 1, 1, 1, 1,
1.432173, -0.6399409, 0.253801, 1, 1, 1, 1, 1,
1.433554, -0.3000477, 2.44793, 1, 1, 1, 1, 1,
1.440292, 0.8883291, 0.2513493, 1, 1, 1, 1, 1,
1.445462, 1.612547, 1.115206, 1, 1, 1, 1, 1,
1.446509, 2.296319, 0.2500688, 1, 1, 1, 1, 1,
1.449463, -0.2931453, 1.778338, 1, 1, 1, 1, 1,
1.453123, 0.56875, 1.962384, 1, 1, 1, 1, 1,
1.460631, 0.6312643, 2.095047, 0, 0, 1, 1, 1,
1.465266, 0.3164949, 1.017404, 1, 0, 0, 1, 1,
1.493272, 1.361434, 0.3678623, 1, 0, 0, 1, 1,
1.496162, -1.17569, 0.2650143, 1, 0, 0, 1, 1,
1.523362, -0.81831, 3.303867, 1, 0, 0, 1, 1,
1.536894, 0.1436149, 0.8114225, 1, 0, 0, 1, 1,
1.543149, 0.5864261, 0.3204628, 0, 0, 0, 1, 1,
1.555059, 0.1117705, 0.05803703, 0, 0, 0, 1, 1,
1.558502, -0.2777844, 3.608954, 0, 0, 0, 1, 1,
1.564598, 0.3979388, 0.3273243, 0, 0, 0, 1, 1,
1.574579, -0.7363118, 2.979772, 0, 0, 0, 1, 1,
1.576266, -0.9033384, 1.401027, 0, 0, 0, 1, 1,
1.576447, -0.9828321, 2.562235, 0, 0, 0, 1, 1,
1.578392, 1.473695, 1.219273, 1, 1, 1, 1, 1,
1.579128, 0.1583195, 0.2466556, 1, 1, 1, 1, 1,
1.586361, 1.037016, -0.1605553, 1, 1, 1, 1, 1,
1.586712, -0.6336303, 2.269847, 1, 1, 1, 1, 1,
1.589946, 0.7642976, 0.7568559, 1, 1, 1, 1, 1,
1.595191, -0.4592843, 1.210607, 1, 1, 1, 1, 1,
1.596009, -0.5030773, 1.979917, 1, 1, 1, 1, 1,
1.614703, -0.5344742, 0.7655589, 1, 1, 1, 1, 1,
1.615081, 0.1936748, 3.837178, 1, 1, 1, 1, 1,
1.645897, 1.765877, 1.711879, 1, 1, 1, 1, 1,
1.655014, 0.6596527, 1.688344, 1, 1, 1, 1, 1,
1.655653, 0.7957728, 2.79302, 1, 1, 1, 1, 1,
1.67635, -0.5623509, 2.15172, 1, 1, 1, 1, 1,
1.688297, 0.292526, 0.6354575, 1, 1, 1, 1, 1,
1.695253, 0.9266305, 1.238374, 1, 1, 1, 1, 1,
1.700319, -1.478982, 3.291214, 0, 0, 1, 1, 1,
1.703734, -0.7261268, 1.63512, 1, 0, 0, 1, 1,
1.713661, -0.7652602, 2.711395, 1, 0, 0, 1, 1,
1.71527, -1.580075, 0.6669008, 1, 0, 0, 1, 1,
1.720931, -1.417316, 3.317265, 1, 0, 0, 1, 1,
1.733264, -1.20226, 3.602705, 1, 0, 0, 1, 1,
1.745907, 1.061645, 0.4827609, 0, 0, 0, 1, 1,
1.75123, 1.072301, -0.1449523, 0, 0, 0, 1, 1,
1.765782, -0.6943101, 2.8439, 0, 0, 0, 1, 1,
1.778627, -1.620988, 2.834357, 0, 0, 0, 1, 1,
1.78416, -1.072758, 1.966643, 0, 0, 0, 1, 1,
1.785081, 0.4952431, 0.5444148, 0, 0, 0, 1, 1,
1.801979, -1.776507, 2.908964, 0, 0, 0, 1, 1,
1.807664, -0.664597, 1.952342, 1, 1, 1, 1, 1,
1.811948, -0.421993, 2.994898, 1, 1, 1, 1, 1,
1.830691, -0.572868, 1.363293, 1, 1, 1, 1, 1,
1.842259, 0.3191144, 1.585435, 1, 1, 1, 1, 1,
1.853439, -0.5959942, 1.881762, 1, 1, 1, 1, 1,
1.879059, 1.844164, 1.290269, 1, 1, 1, 1, 1,
1.889603, -0.4644887, 3.594309, 1, 1, 1, 1, 1,
1.890427, -0.338331, 3.625917, 1, 1, 1, 1, 1,
1.892226, -0.00899049, 1.253183, 1, 1, 1, 1, 1,
1.900657, -0.6419297, 0.7541075, 1, 1, 1, 1, 1,
1.901174, 0.4346161, 1.072095, 1, 1, 1, 1, 1,
1.915047, 1.833196, 0.6863956, 1, 1, 1, 1, 1,
1.917849, -1.53316, 2.140901, 1, 1, 1, 1, 1,
1.951029, 0.01164397, 2.300761, 1, 1, 1, 1, 1,
1.95675, -0.9861239, 1.516918, 1, 1, 1, 1, 1,
1.966433, 1.342542, -0.4479679, 0, 0, 1, 1, 1,
1.980269, -1.28648, 3.175602, 1, 0, 0, 1, 1,
2.0014, 0.03662438, 2.535173, 1, 0, 0, 1, 1,
2.005025, -0.1559786, 3.237672, 1, 0, 0, 1, 1,
2.018699, 0.7286614, 0.6777584, 1, 0, 0, 1, 1,
2.052073, 1.241935, 2.133179, 1, 0, 0, 1, 1,
2.072581, -0.1602685, 0.7307571, 0, 0, 0, 1, 1,
2.072791, -0.4206011, 0.1113133, 0, 0, 0, 1, 1,
2.109116, 1.137195, 0.8240103, 0, 0, 0, 1, 1,
2.151862, 0.2075912, 1.848915, 0, 0, 0, 1, 1,
2.159986, 0.07987215, 1.004542, 0, 0, 0, 1, 1,
2.160227, -1.433813, 2.06301, 0, 0, 0, 1, 1,
2.252392, -0.7051899, 1.971386, 0, 0, 0, 1, 1,
2.340364, -0.09144073, 2.934695, 1, 1, 1, 1, 1,
2.387937, -2.434019, 4.610919, 1, 1, 1, 1, 1,
2.67764, 0.02530272, 3.561178, 1, 1, 1, 1, 1,
2.681948, 0.7483163, -1.194241, 1, 1, 1, 1, 1,
2.729446, 0.7140316, -0.129391, 1, 1, 1, 1, 1,
2.779278, -0.9252884, 2.926281, 1, 1, 1, 1, 1,
3.113195, -0.7989666, 0.6950005, 1, 1, 1, 1, 1
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
var radius = 9.898948;
var distance = 34.76963;
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
mvMatrix.translate( 0.0700345, -0.05329347, 0.4008574 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76963);
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
