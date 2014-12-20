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
-2.743364, 0.5587582, -1.369968, 1, 0, 0, 1,
-2.709386, -1.709681, -3.431238, 1, 0.007843138, 0, 1,
-2.650758, -0.6123098, -2.067113, 1, 0.01176471, 0, 1,
-2.631338, 0.9133047, -0.7172404, 1, 0.01960784, 0, 1,
-2.526401, 0.2260972, -2.103014, 1, 0.02352941, 0, 1,
-2.431745, -1.022632, -2.473007, 1, 0.03137255, 0, 1,
-2.15018, -0.03798992, -2.521731, 1, 0.03529412, 0, 1,
-2.145677, -0.7073712, -1.816622, 1, 0.04313726, 0, 1,
-2.058684, -1.172941, -2.646114, 1, 0.04705882, 0, 1,
-2.056139, -0.8419949, -2.598315, 1, 0.05490196, 0, 1,
-2.050681, -0.7611616, -2.483448, 1, 0.05882353, 0, 1,
-2.045688, -0.03732261, -0.9590871, 1, 0.06666667, 0, 1,
-2.040302, 2.099845, -0.2184261, 1, 0.07058824, 0, 1,
-2.01365, 1.723179, -0.0008268107, 1, 0.07843138, 0, 1,
-1.967886, -0.409077, -2.182964, 1, 0.08235294, 0, 1,
-1.963539, 0.981329, 0.768989, 1, 0.09019608, 0, 1,
-1.952233, -0.7025822, -1.572303, 1, 0.09411765, 0, 1,
-1.906123, 0.7715575, -1.079385, 1, 0.1019608, 0, 1,
-1.905705, 1.00391, 0.4102326, 1, 0.1098039, 0, 1,
-1.895997, 0.2052177, -1.497499, 1, 0.1137255, 0, 1,
-1.879823, 0.584968, -1.891144, 1, 0.1215686, 0, 1,
-1.875153, -0.3242065, -2.976878, 1, 0.1254902, 0, 1,
-1.843454, 0.3098986, -1.896545, 1, 0.1333333, 0, 1,
-1.842667, -0.07891317, -1.459717, 1, 0.1372549, 0, 1,
-1.836063, 1.344585, -1.488527, 1, 0.145098, 0, 1,
-1.82262, 1.41769, -3.195335, 1, 0.1490196, 0, 1,
-1.804878, 0.9710579, -0.1968528, 1, 0.1568628, 0, 1,
-1.792886, -1.87145, -3.055347, 1, 0.1607843, 0, 1,
-1.780639, -1.96893, -3.714981, 1, 0.1686275, 0, 1,
-1.758253, 1.167877, 0.03720965, 1, 0.172549, 0, 1,
-1.757449, -0.1762217, -2.129392, 1, 0.1803922, 0, 1,
-1.747382, 1.534578, 0.8559785, 1, 0.1843137, 0, 1,
-1.733762, -0.5069054, -3.021277, 1, 0.1921569, 0, 1,
-1.724828, -0.7290136, -2.125534, 1, 0.1960784, 0, 1,
-1.72235, 0.1631711, -2.919212, 1, 0.2039216, 0, 1,
-1.708853, 0.06294991, -1.629869, 1, 0.2117647, 0, 1,
-1.707421, -0.08586554, -1.360221, 1, 0.2156863, 0, 1,
-1.703255, 0.8035691, 0.5306816, 1, 0.2235294, 0, 1,
-1.677061, -1.117609, -2.068882, 1, 0.227451, 0, 1,
-1.658622, 1.590295, -1.46882, 1, 0.2352941, 0, 1,
-1.656404, -1.321093, -2.09751, 1, 0.2392157, 0, 1,
-1.651827, -1.314418, -3.775359, 1, 0.2470588, 0, 1,
-1.651019, -1.280231, -3.535226, 1, 0.2509804, 0, 1,
-1.643744, -1.0688, -3.096019, 1, 0.2588235, 0, 1,
-1.640738, -0.07547472, -0.3398006, 1, 0.2627451, 0, 1,
-1.633439, -1.783591, -2.934363, 1, 0.2705882, 0, 1,
-1.633199, -0.4734585, -2.438323, 1, 0.2745098, 0, 1,
-1.629841, -0.2272558, -1.407267, 1, 0.282353, 0, 1,
-1.617842, -0.4218338, -1.109892, 1, 0.2862745, 0, 1,
-1.617766, 1.436922, 0.124108, 1, 0.2941177, 0, 1,
-1.616036, -1.013721, -1.830175, 1, 0.3019608, 0, 1,
-1.615348, -0.9776809, -3.138204, 1, 0.3058824, 0, 1,
-1.589027, -0.3453853, -0.1838221, 1, 0.3137255, 0, 1,
-1.56805, 0.4877316, -1.536499, 1, 0.3176471, 0, 1,
-1.521571, 0.8411897, -2.366711, 1, 0.3254902, 0, 1,
-1.518655, -0.7141874, -2.00543, 1, 0.3294118, 0, 1,
-1.509514, -0.07226854, 0.525269, 1, 0.3372549, 0, 1,
-1.509484, 0.3998738, -0.519576, 1, 0.3411765, 0, 1,
-1.508499, 1.77067, 0.2308971, 1, 0.3490196, 0, 1,
-1.505533, 1.015213, -3.403465, 1, 0.3529412, 0, 1,
-1.503484, -1.898544, -1.804429, 1, 0.3607843, 0, 1,
-1.494715, -0.3577515, -1.792516, 1, 0.3647059, 0, 1,
-1.488161, -0.2367931, -0.3183164, 1, 0.372549, 0, 1,
-1.48372, 0.6000577, -1.504512, 1, 0.3764706, 0, 1,
-1.477766, 1.703386, -0.929945, 1, 0.3843137, 0, 1,
-1.455534, -0.08690397, -2.45311, 1, 0.3882353, 0, 1,
-1.451883, -2.129464, -3.56046, 1, 0.3960784, 0, 1,
-1.44434, 0.6531983, -2.415624, 1, 0.4039216, 0, 1,
-1.439106, -0.3806948, -0.9776046, 1, 0.4078431, 0, 1,
-1.438559, -0.3669796, -1.220778, 1, 0.4156863, 0, 1,
-1.434981, -0.6158223, -1.854392, 1, 0.4196078, 0, 1,
-1.427639, 0.225492, 1.253701, 1, 0.427451, 0, 1,
-1.418182, 0.151027, -1.668406, 1, 0.4313726, 0, 1,
-1.400379, 1.483082, 0.07240833, 1, 0.4392157, 0, 1,
-1.399869, -0.6233225, -4.012629, 1, 0.4431373, 0, 1,
-1.399762, 0.6507729, 0.1695401, 1, 0.4509804, 0, 1,
-1.39937, 1.59626, -0.32251, 1, 0.454902, 0, 1,
-1.395872, -0.3945137, -2.214391, 1, 0.4627451, 0, 1,
-1.381541, 1.53906, -1.858924, 1, 0.4666667, 0, 1,
-1.376129, 1.709448, 0.2772987, 1, 0.4745098, 0, 1,
-1.371735, 3.011307, -0.1284904, 1, 0.4784314, 0, 1,
-1.371684, -0.08628499, -2.143503, 1, 0.4862745, 0, 1,
-1.359648, -0.7326953, -1.824785, 1, 0.4901961, 0, 1,
-1.358039, -0.7129391, -1.380371, 1, 0.4980392, 0, 1,
-1.355119, -0.6505482, -4.419499, 1, 0.5058824, 0, 1,
-1.344198, 0.9133559, -0.620092, 1, 0.509804, 0, 1,
-1.3389, -0.3929483, -1.292332, 1, 0.5176471, 0, 1,
-1.317394, -0.07076545, -0.8384453, 1, 0.5215687, 0, 1,
-1.312244, -0.01790041, -2.56093, 1, 0.5294118, 0, 1,
-1.288805, -0.07282317, -2.269135, 1, 0.5333334, 0, 1,
-1.267482, 1.181158, -2.171806, 1, 0.5411765, 0, 1,
-1.263814, 0.898653, -1.049028, 1, 0.5450981, 0, 1,
-1.262688, 0.9980636, 0.1434246, 1, 0.5529412, 0, 1,
-1.261186, -1.495098, -2.68255, 1, 0.5568628, 0, 1,
-1.260403, -1.209786, -2.646733, 1, 0.5647059, 0, 1,
-1.25524, 0.6486291, -0.08176693, 1, 0.5686275, 0, 1,
-1.254892, 0.7455233, -0.1230608, 1, 0.5764706, 0, 1,
-1.254075, -0.3870864, -2.923324, 1, 0.5803922, 0, 1,
-1.229635, -0.2456989, -2.364043, 1, 0.5882353, 0, 1,
-1.222456, 0.7822167, -0.27469, 1, 0.5921569, 0, 1,
-1.212788, -0.3072852, -3.068813, 1, 0.6, 0, 1,
-1.20968, 0.06090403, -2.916125, 1, 0.6078432, 0, 1,
-1.205283, -0.1754927, -1.311586, 1, 0.6117647, 0, 1,
-1.195107, -1.252581, -1.929812, 1, 0.6196079, 0, 1,
-1.190894, -0.196592, -0.7288607, 1, 0.6235294, 0, 1,
-1.183036, 0.02311631, -1.855666, 1, 0.6313726, 0, 1,
-1.179706, -0.6831741, -1.298676, 1, 0.6352941, 0, 1,
-1.176587, 0.6469307, -2.741313, 1, 0.6431373, 0, 1,
-1.174968, 0.4845959, -1.413035, 1, 0.6470588, 0, 1,
-1.173383, 0.822653, -2.660541, 1, 0.654902, 0, 1,
-1.167477, 0.9169625, -0.2023406, 1, 0.6588235, 0, 1,
-1.16173, 0.2895941, -2.242596, 1, 0.6666667, 0, 1,
-1.155231, 0.5331725, -2.191398, 1, 0.6705883, 0, 1,
-1.153921, -0.04708962, -1.499008, 1, 0.6784314, 0, 1,
-1.146542, -0.6793382, -3.061153, 1, 0.682353, 0, 1,
-1.146531, 0.3320661, -1.060354, 1, 0.6901961, 0, 1,
-1.140794, 0.6050261, -0.9253492, 1, 0.6941177, 0, 1,
-1.136772, -0.0781927, -1.682998, 1, 0.7019608, 0, 1,
-1.130817, 0.5433953, -0.1602333, 1, 0.7098039, 0, 1,
-1.121523, 1.091917, 0.7803456, 1, 0.7137255, 0, 1,
-1.119719, 1.198634, -0.2699916, 1, 0.7215686, 0, 1,
-1.118412, 0.2767887, -2.508933, 1, 0.7254902, 0, 1,
-1.110947, -0.3771047, -0.5702671, 1, 0.7333333, 0, 1,
-1.107913, 0.8042305, 0.3047518, 1, 0.7372549, 0, 1,
-1.104024, -1.268697, -2.056189, 1, 0.7450981, 0, 1,
-1.101276, -1.049926, -2.568727, 1, 0.7490196, 0, 1,
-1.097118, -0.1261373, -0.7609528, 1, 0.7568628, 0, 1,
-1.0942, -1.147355, -1.498036, 1, 0.7607843, 0, 1,
-1.090847, 1.239598, -0.4070785, 1, 0.7686275, 0, 1,
-1.090068, -1.462533, -2.899873, 1, 0.772549, 0, 1,
-1.086859, 0.1523367, -0.9708488, 1, 0.7803922, 0, 1,
-1.079141, -1.840371, -2.453906, 1, 0.7843137, 0, 1,
-1.078401, -0.2894435, 0.05003167, 1, 0.7921569, 0, 1,
-1.078183, -0.6093742, -2.245234, 1, 0.7960784, 0, 1,
-1.068371, -1.280593, -4.278023, 1, 0.8039216, 0, 1,
-1.067063, -1.524769, -2.146973, 1, 0.8117647, 0, 1,
-1.061609, 0.2599822, -1.177455, 1, 0.8156863, 0, 1,
-1.059208, 0.7960274, -1.109802, 1, 0.8235294, 0, 1,
-1.053882, -1.482545, -2.268432, 1, 0.827451, 0, 1,
-1.04696, 0.1435632, -2.78282, 1, 0.8352941, 0, 1,
-1.046527, -2.881475, -2.639556, 1, 0.8392157, 0, 1,
-1.046273, 0.05927134, -2.782745, 1, 0.8470588, 0, 1,
-1.042002, 0.3635337, -3.183856, 1, 0.8509804, 0, 1,
-1.04047, 1.211368, -0.6557086, 1, 0.8588235, 0, 1,
-1.038243, -1.054075, -1.13411, 1, 0.8627451, 0, 1,
-1.029377, -1.160387, -3.886593, 1, 0.8705882, 0, 1,
-1.024099, -0.9564623, -3.300117, 1, 0.8745098, 0, 1,
-1.01632, 0.4147181, -0.9355667, 1, 0.8823529, 0, 1,
-1.004499, -0.3484684, -3.510431, 1, 0.8862745, 0, 1,
-1.004385, 1.226721, -2.18113, 1, 0.8941177, 0, 1,
-1.002947, 1.885517, -3.951498, 1, 0.8980392, 0, 1,
-1.002257, 0.2877647, -0.5565201, 1, 0.9058824, 0, 1,
-0.9973576, 0.007923339, -1.53979, 1, 0.9137255, 0, 1,
-0.9833785, -0.7620157, -2.398066, 1, 0.9176471, 0, 1,
-0.9815826, 1.074678, 0.01602091, 1, 0.9254902, 0, 1,
-0.9773299, -0.6565927, -2.705635, 1, 0.9294118, 0, 1,
-0.9700394, -1.283819, -3.470087, 1, 0.9372549, 0, 1,
-0.9694415, -0.4336252, -1.716943, 1, 0.9411765, 0, 1,
-0.9676267, -2.50395, -2.737018, 1, 0.9490196, 0, 1,
-0.965494, 0.9162931, -2.316361, 1, 0.9529412, 0, 1,
-0.9567383, -0.9573002, -2.929175, 1, 0.9607843, 0, 1,
-0.9511319, 1.025024, -0.9078114, 1, 0.9647059, 0, 1,
-0.9509155, -1.280018, -3.707672, 1, 0.972549, 0, 1,
-0.9426831, -0.1094421, -2.518531, 1, 0.9764706, 0, 1,
-0.9404769, -0.5264868, -1.670672, 1, 0.9843137, 0, 1,
-0.9370055, 0.9062474, -1.588771, 1, 0.9882353, 0, 1,
-0.9319716, 0.9990274, 0.1083466, 1, 0.9960784, 0, 1,
-0.9281524, -1.773156, -2.47847, 0.9960784, 1, 0, 1,
-0.9160917, 0.4872177, -1.726478, 0.9921569, 1, 0, 1,
-0.9148082, -1.738557, -1.510779, 0.9843137, 1, 0, 1,
-0.9122555, -1.584966, -1.414794, 0.9803922, 1, 0, 1,
-0.9052952, -1.11562, -2.433491, 0.972549, 1, 0, 1,
-0.9046671, -0.2812653, -1.480878, 0.9686275, 1, 0, 1,
-0.8989861, -0.2570468, -1.93179, 0.9607843, 1, 0, 1,
-0.8989377, -0.899633, -5.064137, 0.9568627, 1, 0, 1,
-0.8985604, 0.1527644, -1.550775, 0.9490196, 1, 0, 1,
-0.8953022, -0.3685066, -0.7214425, 0.945098, 1, 0, 1,
-0.8947859, -1.666195, -2.567867, 0.9372549, 1, 0, 1,
-0.8945538, -0.1241705, -2.937575, 0.9333333, 1, 0, 1,
-0.8941882, -0.7047923, -1.457778, 0.9254902, 1, 0, 1,
-0.8919259, 0.1469181, -0.8867218, 0.9215686, 1, 0, 1,
-0.8917859, 0.08951332, -2.650687, 0.9137255, 1, 0, 1,
-0.8892757, 1.729798, -0.7833925, 0.9098039, 1, 0, 1,
-0.8879279, 0.1837294, -0.7866284, 0.9019608, 1, 0, 1,
-0.886868, -0.7974417, 0.1733123, 0.8941177, 1, 0, 1,
-0.8832076, -1.260535, 0.2618717, 0.8901961, 1, 0, 1,
-0.8799387, -0.1143922, -2.323173, 0.8823529, 1, 0, 1,
-0.8787728, -0.2594298, 0.0587262, 0.8784314, 1, 0, 1,
-0.878335, -0.3163379, -2.489034, 0.8705882, 1, 0, 1,
-0.8781968, 0.9705042, 0.724113, 0.8666667, 1, 0, 1,
-0.8721112, 1.435801, 0.06027998, 0.8588235, 1, 0, 1,
-0.8717852, 0.1874129, -2.203952, 0.854902, 1, 0, 1,
-0.8639461, 0.7543796, -0.03443541, 0.8470588, 1, 0, 1,
-0.8623368, 0.3385863, -2.732299, 0.8431373, 1, 0, 1,
-0.858898, -1.243858, -2.197875, 0.8352941, 1, 0, 1,
-0.8569037, 0.4973453, -2.097301, 0.8313726, 1, 0, 1,
-0.8481249, -1.264735, -2.500027, 0.8235294, 1, 0, 1,
-0.844802, 0.3485396, -1.749174, 0.8196079, 1, 0, 1,
-0.8420803, -0.1542368, 0.008242816, 0.8117647, 1, 0, 1,
-0.8414637, 0.7689402, -2.639222, 0.8078431, 1, 0, 1,
-0.8405311, -0.8301806, -1.258215, 0.8, 1, 0, 1,
-0.8345649, 1.441239, -0.654701, 0.7921569, 1, 0, 1,
-0.8313822, 0.1679472, -1.942182, 0.7882353, 1, 0, 1,
-0.8283397, 1.753223, -1.423134, 0.7803922, 1, 0, 1,
-0.8276895, -0.03031708, -1.225915, 0.7764706, 1, 0, 1,
-0.8238119, 0.4972293, -2.924235, 0.7686275, 1, 0, 1,
-0.8232583, 1.685529, -1.139358, 0.7647059, 1, 0, 1,
-0.8190292, 0.8255094, -1.185687, 0.7568628, 1, 0, 1,
-0.8161348, 2.077529, -0.5493566, 0.7529412, 1, 0, 1,
-0.8132468, 0.7333878, -1.824794, 0.7450981, 1, 0, 1,
-0.8086522, 0.2517175, -1.155015, 0.7411765, 1, 0, 1,
-0.8085601, 1.164533, 2.488531, 0.7333333, 1, 0, 1,
-0.8073605, -0.8302444, -2.226947, 0.7294118, 1, 0, 1,
-0.8050841, 0.9957238, 0.1922593, 0.7215686, 1, 0, 1,
-0.8048677, 0.7235962, -0.7425479, 0.7176471, 1, 0, 1,
-0.7968249, -0.2348389, -3.530277, 0.7098039, 1, 0, 1,
-0.7906886, -0.8841779, -0.7543531, 0.7058824, 1, 0, 1,
-0.7897634, 0.1188304, -1.08192, 0.6980392, 1, 0, 1,
-0.7795323, -0.6198895, -3.034092, 0.6901961, 1, 0, 1,
-0.7751166, -1.101098, -1.994472, 0.6862745, 1, 0, 1,
-0.7728841, -0.01267725, -3.165432, 0.6784314, 1, 0, 1,
-0.7668114, 0.8121216, -1.394907, 0.6745098, 1, 0, 1,
-0.7593499, -0.6423879, -2.125337, 0.6666667, 1, 0, 1,
-0.7585993, -1.002536, -1.667928, 0.6627451, 1, 0, 1,
-0.7545136, -0.4307885, -1.506474, 0.654902, 1, 0, 1,
-0.7530471, 0.3883734, -0.8782578, 0.6509804, 1, 0, 1,
-0.7508186, 0.8125728, 0.9382958, 0.6431373, 1, 0, 1,
-0.7504883, -0.4124062, -2.701963, 0.6392157, 1, 0, 1,
-0.748697, 1.225618, -1.667285, 0.6313726, 1, 0, 1,
-0.7468624, 0.432712, -1.345877, 0.627451, 1, 0, 1,
-0.7450198, -1.613659, -3.459229, 0.6196079, 1, 0, 1,
-0.7422872, -0.2901306, -1.133242, 0.6156863, 1, 0, 1,
-0.7418959, 0.6037022, -0.04721371, 0.6078432, 1, 0, 1,
-0.7328641, 0.2198364, -0.1535751, 0.6039216, 1, 0, 1,
-0.7326199, 1.192133, 0.1665288, 0.5960785, 1, 0, 1,
-0.731643, -1.495967, -1.164499, 0.5882353, 1, 0, 1,
-0.7306726, -0.3301874, -2.336508, 0.5843138, 1, 0, 1,
-0.7275715, 0.7667578, -0.5974537, 0.5764706, 1, 0, 1,
-0.7260818, -0.7387459, -4.160183, 0.572549, 1, 0, 1,
-0.7255272, 0.1665229, -0.3919278, 0.5647059, 1, 0, 1,
-0.7228326, -0.3887646, -1.059951, 0.5607843, 1, 0, 1,
-0.720777, -1.385289, -3.434599, 0.5529412, 1, 0, 1,
-0.7189289, 1.086107, 1.920919, 0.5490196, 1, 0, 1,
-0.7154689, 0.009316405, -2.401413, 0.5411765, 1, 0, 1,
-0.7123188, 0.01668083, -2.774787, 0.5372549, 1, 0, 1,
-0.712275, -0.6595327, -3.363889, 0.5294118, 1, 0, 1,
-0.7074728, 0.1203256, -0.9648769, 0.5254902, 1, 0, 1,
-0.7037423, -0.61685, -2.149938, 0.5176471, 1, 0, 1,
-0.7018884, -2.498063, -3.625318, 0.5137255, 1, 0, 1,
-0.696949, 1.595813, -1.700123, 0.5058824, 1, 0, 1,
-0.6934341, 0.7326784, -0.9588192, 0.5019608, 1, 0, 1,
-0.6912769, -0.427147, -2.834207, 0.4941176, 1, 0, 1,
-0.686452, -0.1931829, -1.216715, 0.4862745, 1, 0, 1,
-0.6861745, 0.3677376, -0.8346307, 0.4823529, 1, 0, 1,
-0.6817862, -1.017555, -2.975789, 0.4745098, 1, 0, 1,
-0.6815534, -1.00255, -3.378417, 0.4705882, 1, 0, 1,
-0.6749684, 1.454618, -1.231804, 0.4627451, 1, 0, 1,
-0.6670362, 1.187455, -1.949499, 0.4588235, 1, 0, 1,
-0.6656105, 0.5838757, 1.454458, 0.4509804, 1, 0, 1,
-0.6609775, 0.5004819, -2.257405, 0.4470588, 1, 0, 1,
-0.6538011, -2.076842, -2.499715, 0.4392157, 1, 0, 1,
-0.652949, -0.6004792, -2.624522, 0.4352941, 1, 0, 1,
-0.6482701, -1.046084, -3.097935, 0.427451, 1, 0, 1,
-0.6438159, 0.7860754, -0.3256751, 0.4235294, 1, 0, 1,
-0.6434791, -0.4708638, -1.177589, 0.4156863, 1, 0, 1,
-0.632786, -1.070573, -3.669281, 0.4117647, 1, 0, 1,
-0.6293738, 0.1155643, -0.4838172, 0.4039216, 1, 0, 1,
-0.624736, -0.9311081, -3.397828, 0.3960784, 1, 0, 1,
-0.6233174, 0.005256761, -1.234498, 0.3921569, 1, 0, 1,
-0.6193281, -0.2135413, -0.996234, 0.3843137, 1, 0, 1,
-0.6189607, 0.03056118, -1.07552, 0.3803922, 1, 0, 1,
-0.618798, 0.833212, -0.3614956, 0.372549, 1, 0, 1,
-0.618343, -0.5324527, -2.923891, 0.3686275, 1, 0, 1,
-0.614971, -0.03523618, -1.073733, 0.3607843, 1, 0, 1,
-0.6097959, 0.6011981, -0.3601727, 0.3568628, 1, 0, 1,
-0.5980172, -1.911729, -1.784338, 0.3490196, 1, 0, 1,
-0.595429, -0.1588166, -1.55295, 0.345098, 1, 0, 1,
-0.592802, 0.2117976, -0.5682728, 0.3372549, 1, 0, 1,
-0.5924394, -0.9629056, -1.020299, 0.3333333, 1, 0, 1,
-0.5916115, 1.059158, -1.269548, 0.3254902, 1, 0, 1,
-0.5827073, -0.9842513, -2.05031, 0.3215686, 1, 0, 1,
-0.5691557, -0.4839545, -3.273208, 0.3137255, 1, 0, 1,
-0.5617116, 0.2851472, -0.1552676, 0.3098039, 1, 0, 1,
-0.5604708, -1.255042, -2.23272, 0.3019608, 1, 0, 1,
-0.5576012, -0.8109005, -2.099329, 0.2941177, 1, 0, 1,
-0.5567924, -1.02433, -2.302431, 0.2901961, 1, 0, 1,
-0.5565462, 1.466273, -0.4051101, 0.282353, 1, 0, 1,
-0.5499163, -0.1161641, -1.880847, 0.2784314, 1, 0, 1,
-0.5442019, -1.849166, -2.26441, 0.2705882, 1, 0, 1,
-0.54301, -0.2642986, -2.168044, 0.2666667, 1, 0, 1,
-0.5417129, 1.758257, -1.898762, 0.2588235, 1, 0, 1,
-0.5406681, 0.1764826, -2.257555, 0.254902, 1, 0, 1,
-0.5315247, -0.6640309, -3.328057, 0.2470588, 1, 0, 1,
-0.5299289, -1.039881, -3.52015, 0.2431373, 1, 0, 1,
-0.5244438, 0.04039776, -1.394725, 0.2352941, 1, 0, 1,
-0.5186909, 1.476913, -1.209081, 0.2313726, 1, 0, 1,
-0.5138191, -0.7499934, -3.391959, 0.2235294, 1, 0, 1,
-0.5127782, 1.174524, 1.130945, 0.2196078, 1, 0, 1,
-0.506767, 0.4146062, 0.3639561, 0.2117647, 1, 0, 1,
-0.5066084, -0.2945048, -1.259288, 0.2078431, 1, 0, 1,
-0.5064386, -0.4490556, -1.891528, 0.2, 1, 0, 1,
-0.5044835, 2.041204, -0.1483714, 0.1921569, 1, 0, 1,
-0.5027815, 0.7498719, -0.8677311, 0.1882353, 1, 0, 1,
-0.500297, 1.695117, -0.5814956, 0.1803922, 1, 0, 1,
-0.4990297, -0.2809072, -0.6073392, 0.1764706, 1, 0, 1,
-0.497508, 1.597101, -0.1456369, 0.1686275, 1, 0, 1,
-0.4914365, 2.39015, -1.887688, 0.1647059, 1, 0, 1,
-0.4908292, -0.1197914, -1.637408, 0.1568628, 1, 0, 1,
-0.4899834, 0.5142511, -1.438745, 0.1529412, 1, 0, 1,
-0.474516, -0.6669573, -2.697412, 0.145098, 1, 0, 1,
-0.4704786, -1.088331, -3.947122, 0.1411765, 1, 0, 1,
-0.4657827, 0.1038355, -2.429127, 0.1333333, 1, 0, 1,
-0.4643285, -0.1172331, -1.455027, 0.1294118, 1, 0, 1,
-0.4566361, 0.3330973, -1.713404, 0.1215686, 1, 0, 1,
-0.4547303, -0.7934738, -2.848487, 0.1176471, 1, 0, 1,
-0.4547019, -1.560933, -3.679733, 0.1098039, 1, 0, 1,
-0.4530813, 0.2317016, -1.449419, 0.1058824, 1, 0, 1,
-0.4521034, 1.919989, 0.9732249, 0.09803922, 1, 0, 1,
-0.4504678, 1.229677, -1.945013, 0.09019608, 1, 0, 1,
-0.4484998, 0.2974862, -3.937296, 0.08627451, 1, 0, 1,
-0.4448444, 1.023558, -1.73823, 0.07843138, 1, 0, 1,
-0.4427657, -0.8451528, -2.12259, 0.07450981, 1, 0, 1,
-0.4420509, 1.383233, 1.027832, 0.06666667, 1, 0, 1,
-0.4415883, -0.5716001, -1.109149, 0.0627451, 1, 0, 1,
-0.4378961, 0.974521, -2.103414, 0.05490196, 1, 0, 1,
-0.4368576, 1.655496, 1.251861, 0.05098039, 1, 0, 1,
-0.4302466, -0.4595596, -1.596637, 0.04313726, 1, 0, 1,
-0.4195431, -0.1511554, -2.110348, 0.03921569, 1, 0, 1,
-0.4164413, -1.427159, -3.950692, 0.03137255, 1, 0, 1,
-0.4158273, -1.242401, -2.179523, 0.02745098, 1, 0, 1,
-0.413445, 1.58668, -0.3779507, 0.01960784, 1, 0, 1,
-0.4101954, 0.02180361, -1.555975, 0.01568628, 1, 0, 1,
-0.409658, -0.8409848, -4.734671, 0.007843138, 1, 0, 1,
-0.4042524, -1.583575, -2.303957, 0.003921569, 1, 0, 1,
-0.4038334, 1.384066, -0.4329309, 0, 1, 0.003921569, 1,
-0.3992119, -0.003699304, -0.6921542, 0, 1, 0.01176471, 1,
-0.3990898, 1.014385, -1.717303, 0, 1, 0.01568628, 1,
-0.398216, -0.5692058, -2.642136, 0, 1, 0.02352941, 1,
-0.3958898, 0.02331092, 0.9422358, 0, 1, 0.02745098, 1,
-0.3945474, -0.5916291, -2.091353, 0, 1, 0.03529412, 1,
-0.3901682, 0.1586743, -0.6698599, 0, 1, 0.03921569, 1,
-0.3879627, -0.5057428, -2.692993, 0, 1, 0.04705882, 1,
-0.3876843, 0.1633631, -1.05209, 0, 1, 0.05098039, 1,
-0.3836691, -0.6988828, -2.197223, 0, 1, 0.05882353, 1,
-0.3815249, -1.264624, -3.563051, 0, 1, 0.0627451, 1,
-0.3800585, -0.4874658, -2.611475, 0, 1, 0.07058824, 1,
-0.3696791, -0.5804445, -4.241475, 0, 1, 0.07450981, 1,
-0.3688427, 0.6165624, 0.6514154, 0, 1, 0.08235294, 1,
-0.3679141, -0.5460603, -2.828495, 0, 1, 0.08627451, 1,
-0.3665961, -0.9881793, -3.190099, 0, 1, 0.09411765, 1,
-0.3567711, 0.6236706, 0.9633073, 0, 1, 0.1019608, 1,
-0.3527829, -0.8431248, -3.33739, 0, 1, 0.1058824, 1,
-0.3519975, -0.09377437, -0.910173, 0, 1, 0.1137255, 1,
-0.3485552, 0.7736541, -0.8366952, 0, 1, 0.1176471, 1,
-0.34751, -0.9908007, -2.532406, 0, 1, 0.1254902, 1,
-0.3458761, -0.04237207, 0.1147368, 0, 1, 0.1294118, 1,
-0.3457359, -0.9661788, -3.890329, 0, 1, 0.1372549, 1,
-0.3383812, -0.6690084, -2.962196, 0, 1, 0.1411765, 1,
-0.334362, 0.8674666, -0.7716141, 0, 1, 0.1490196, 1,
-0.3330433, -0.2782984, -2.732688, 0, 1, 0.1529412, 1,
-0.3317426, 1.116885, 0.416224, 0, 1, 0.1607843, 1,
-0.3309441, 0.2280498, 0.5417403, 0, 1, 0.1647059, 1,
-0.3304133, 0.6068024, -0.3503724, 0, 1, 0.172549, 1,
-0.3247051, -1.12157, -2.792839, 0, 1, 0.1764706, 1,
-0.3224593, -1.677166, -2.840667, 0, 1, 0.1843137, 1,
-0.3220785, -0.1765336, -0.3350523, 0, 1, 0.1882353, 1,
-0.3161031, 0.3637653, 0.07184581, 0, 1, 0.1960784, 1,
-0.3130583, 1.282859, 0.831948, 0, 1, 0.2039216, 1,
-0.3106576, 2.499422, 0.1763851, 0, 1, 0.2078431, 1,
-0.3097576, -0.8847498, -3.579174, 0, 1, 0.2156863, 1,
-0.304574, -0.4377001, -1.437685, 0, 1, 0.2196078, 1,
-0.3043756, -0.3090273, -0.7464644, 0, 1, 0.227451, 1,
-0.297419, -0.4702141, -2.462763, 0, 1, 0.2313726, 1,
-0.2928486, 1.011411, -1.282065, 0, 1, 0.2392157, 1,
-0.2902139, -0.2709825, -2.705806, 0, 1, 0.2431373, 1,
-0.2871194, -0.5966101, -2.927852, 0, 1, 0.2509804, 1,
-0.2754044, -0.07847422, -1.76594, 0, 1, 0.254902, 1,
-0.2744324, -0.269122, -2.467489, 0, 1, 0.2627451, 1,
-0.2700981, 0.8793271, -0.4879987, 0, 1, 0.2666667, 1,
-0.2698191, -0.3320944, -1.832229, 0, 1, 0.2745098, 1,
-0.2680996, -0.297973, -2.633156, 0, 1, 0.2784314, 1,
-0.2615615, -0.4219241, -1.24512, 0, 1, 0.2862745, 1,
-0.2576291, -0.1495319, -2.911809, 0, 1, 0.2901961, 1,
-0.2551872, 0.1530253, -2.181105, 0, 1, 0.2980392, 1,
-0.253327, -2.091303, -3.178774, 0, 1, 0.3058824, 1,
-0.2528425, -0.6753658, -2.391708, 0, 1, 0.3098039, 1,
-0.2513195, -0.8306183, -5.150865, 0, 1, 0.3176471, 1,
-0.2489471, 0.3346875, -1.584653, 0, 1, 0.3215686, 1,
-0.2420405, 0.5221382, 0.6200058, 0, 1, 0.3294118, 1,
-0.2318114, -0.7713632, -3.055244, 0, 1, 0.3333333, 1,
-0.2241194, 0.2161451, -2.120124, 0, 1, 0.3411765, 1,
-0.2233733, 1.384576, -0.936201, 0, 1, 0.345098, 1,
-0.2209998, -0.8276914, -3.324082, 0, 1, 0.3529412, 1,
-0.2207858, -1.04816, -3.758502, 0, 1, 0.3568628, 1,
-0.2197442, 0.3056339, 0.5828898, 0, 1, 0.3647059, 1,
-0.2177273, -1.878361, -2.841478, 0, 1, 0.3686275, 1,
-0.2169814, 1.307104, 1.787836, 0, 1, 0.3764706, 1,
-0.2132541, 0.2931308, 1.210606, 0, 1, 0.3803922, 1,
-0.2122905, -0.2130532, -0.929911, 0, 1, 0.3882353, 1,
-0.2107798, 0.6757329, 0.5090338, 0, 1, 0.3921569, 1,
-0.2070221, -0.03540641, -3.354989, 0, 1, 0.4, 1,
-0.2000886, 1.151859, -1.453638, 0, 1, 0.4078431, 1,
-0.1983189, 1.06151, 0.9217578, 0, 1, 0.4117647, 1,
-0.194139, 0.09910391, -0.6678312, 0, 1, 0.4196078, 1,
-0.1904514, 0.6685814, -1.900085, 0, 1, 0.4235294, 1,
-0.1892672, -1.218033, -2.898803, 0, 1, 0.4313726, 1,
-0.1880588, -0.7390471, -2.155385, 0, 1, 0.4352941, 1,
-0.1864672, 0.9801577, -0.5918472, 0, 1, 0.4431373, 1,
-0.1855004, 0.09835541, -1.032123, 0, 1, 0.4470588, 1,
-0.1826337, 2.072474, -1.09059, 0, 1, 0.454902, 1,
-0.1802668, 0.8248557, 0.4722915, 0, 1, 0.4588235, 1,
-0.1796858, 0.2764993, -1.942951, 0, 1, 0.4666667, 1,
-0.1786518, -0.9850933, -1.716215, 0, 1, 0.4705882, 1,
-0.1622025, -0.3161084, -2.53655, 0, 1, 0.4784314, 1,
-0.1592764, -0.9828864, -3.157709, 0, 1, 0.4823529, 1,
-0.1575704, 0.7437603, -1.19372, 0, 1, 0.4901961, 1,
-0.157377, 0.5835007, -2.515366, 0, 1, 0.4941176, 1,
-0.1561215, 1.392566, -0.4884646, 0, 1, 0.5019608, 1,
-0.1559493, -0.004849007, -3.738134, 0, 1, 0.509804, 1,
-0.1545126, 0.8460445, 0.7797784, 0, 1, 0.5137255, 1,
-0.1527328, 1.350621, 0.5034891, 0, 1, 0.5215687, 1,
-0.1504039, 0.7712057, 0.1619374, 0, 1, 0.5254902, 1,
-0.1499053, 0.6643, 0.3604886, 0, 1, 0.5333334, 1,
-0.1468713, 1.154661, 1.198333, 0, 1, 0.5372549, 1,
-0.1419409, -1.489542, -3.928652, 0, 1, 0.5450981, 1,
-0.1398352, 1.357933, -0.5023776, 0, 1, 0.5490196, 1,
-0.1391971, -0.1300973, -2.845834, 0, 1, 0.5568628, 1,
-0.1391165, 1.440085, -0.7088767, 0, 1, 0.5607843, 1,
-0.1370319, 1.161696, -1.142483, 0, 1, 0.5686275, 1,
-0.1349248, -0.3313879, -3.583256, 0, 1, 0.572549, 1,
-0.1314108, 0.1027255, -0.02920885, 0, 1, 0.5803922, 1,
-0.1310407, -0.5061249, -2.266733, 0, 1, 0.5843138, 1,
-0.1269342, 1.109847, -1.803434, 0, 1, 0.5921569, 1,
-0.1257631, 0.1641115, -2.350148, 0, 1, 0.5960785, 1,
-0.1206815, -0.236229, -2.345844, 0, 1, 0.6039216, 1,
-0.1182343, 0.7295798, -1.252482, 0, 1, 0.6117647, 1,
-0.1085032, 0.772818, -1.806662, 0, 1, 0.6156863, 1,
-0.1040014, -0.7745211, -3.412615, 0, 1, 0.6235294, 1,
-0.1012315, -1.508703, -4.572816, 0, 1, 0.627451, 1,
-0.09915359, -0.4721521, -2.584892, 0, 1, 0.6352941, 1,
-0.09390248, -0.2002345, -3.933947, 0, 1, 0.6392157, 1,
-0.09209485, -1.306527, -3.964405, 0, 1, 0.6470588, 1,
-0.09057153, -1.671632, -2.495009, 0, 1, 0.6509804, 1,
-0.08581495, -0.04427583, -1.858059, 0, 1, 0.6588235, 1,
-0.08041729, 0.461558, -1.839034, 0, 1, 0.6627451, 1,
-0.07561755, 0.4954847, -2.383095, 0, 1, 0.6705883, 1,
-0.0751747, 1.57313, 1.1034, 0, 1, 0.6745098, 1,
-0.07398579, -0.5680532, -3.978981, 0, 1, 0.682353, 1,
-0.07379016, -1.007183, -3.224554, 0, 1, 0.6862745, 1,
-0.06995758, -0.7020296, -2.618655, 0, 1, 0.6941177, 1,
-0.06865604, -1.198442, -2.525565, 0, 1, 0.7019608, 1,
-0.06717596, 1.365931, -1.031195, 0, 1, 0.7058824, 1,
-0.06675072, -1.318489, -2.814126, 0, 1, 0.7137255, 1,
-0.06493363, -2.088775, -2.724353, 0, 1, 0.7176471, 1,
-0.06484979, -0.1159026, -5.088832, 0, 1, 0.7254902, 1,
-0.06300048, -0.7399154, -2.100614, 0, 1, 0.7294118, 1,
-0.05765789, -1.157391, -4.141387, 0, 1, 0.7372549, 1,
-0.05630333, -0.03181968, -2.406507, 0, 1, 0.7411765, 1,
-0.0487183, 0.7491228, 1.074682, 0, 1, 0.7490196, 1,
-0.04838555, 1.012983, 0.2756366, 0, 1, 0.7529412, 1,
-0.0468061, 0.3512112, -1.399036, 0, 1, 0.7607843, 1,
-0.04458197, 1.169947, -0.5722657, 0, 1, 0.7647059, 1,
-0.04115441, 1.410319, 2.013259, 0, 1, 0.772549, 1,
-0.04114576, -0.8675371, -4.26611, 0, 1, 0.7764706, 1,
-0.03606458, -1.040915, -2.772255, 0, 1, 0.7843137, 1,
-0.03464226, 0.7531489, 0.5448818, 0, 1, 0.7882353, 1,
-0.03053915, -0.3935026, -2.822764, 0, 1, 0.7960784, 1,
-0.02615308, -2.345244, -1.775087, 0, 1, 0.8039216, 1,
-0.02479039, 0.8944067, -0.9447075, 0, 1, 0.8078431, 1,
-0.02126462, -0.6394058, -4.870435, 0, 1, 0.8156863, 1,
-0.01994034, 1.033831, -0.3539879, 0, 1, 0.8196079, 1,
-0.01967691, -0.632494, -2.214612, 0, 1, 0.827451, 1,
-0.01926637, 0.2974489, -0.4284798, 0, 1, 0.8313726, 1,
-0.01918632, 0.2939154, -0.05408673, 0, 1, 0.8392157, 1,
-0.01859549, 0.1866542, -0.4224108, 0, 1, 0.8431373, 1,
-0.0174938, 0.6681468, 0.2507505, 0, 1, 0.8509804, 1,
-0.0148632, 1.095117, -1.275149, 0, 1, 0.854902, 1,
-0.01473977, 0.1411828, -0.1683587, 0, 1, 0.8627451, 1,
-0.01249469, -0.5627161, -3.644971, 0, 1, 0.8666667, 1,
-0.006115482, -0.3499372, -2.691355, 0, 1, 0.8745098, 1,
-0.0009670675, 0.08783108, -0.8854792, 0, 1, 0.8784314, 1,
-9.362803e-05, -0.2930556, -2.71196, 0, 1, 0.8862745, 1,
0.005057614, 0.2220479, 0.8910429, 0, 1, 0.8901961, 1,
0.006022343, 1.054098, 0.1779491, 0, 1, 0.8980392, 1,
0.00838275, -2.508969, 4.459454, 0, 1, 0.9058824, 1,
0.01136224, -0.7391623, 1.972791, 0, 1, 0.9098039, 1,
0.01180451, -1.029031, 2.901613, 0, 1, 0.9176471, 1,
0.01559146, -0.3208679, 2.515642, 0, 1, 0.9215686, 1,
0.01583853, -0.8915598, 1.419772, 0, 1, 0.9294118, 1,
0.01599892, 0.2575682, 1.469456, 0, 1, 0.9333333, 1,
0.01642901, 0.5878358, 0.6927631, 0, 1, 0.9411765, 1,
0.01819489, -0.1946435, 3.330941, 0, 1, 0.945098, 1,
0.02305085, 0.02570301, -0.669664, 0, 1, 0.9529412, 1,
0.02495375, 2.034634, -0.2278651, 0, 1, 0.9568627, 1,
0.02591767, 1.840856, 0.06365537, 0, 1, 0.9647059, 1,
0.03138146, -0.943484, 3.608227, 0, 1, 0.9686275, 1,
0.03139218, -0.2673779, 1.664552, 0, 1, 0.9764706, 1,
0.03283362, -0.02570406, 1.53349, 0, 1, 0.9803922, 1,
0.03336475, -1.027173, 2.895784, 0, 1, 0.9882353, 1,
0.03593901, 1.778959, -3.24982, 0, 1, 0.9921569, 1,
0.03594512, -0.3825252, 2.586831, 0, 1, 1, 1,
0.03605141, 0.9570963, 2.509769, 0, 0.9921569, 1, 1,
0.03670415, 0.5585681, 0.278125, 0, 0.9882353, 1, 1,
0.04742635, -0.04287175, 2.137717, 0, 0.9803922, 1, 1,
0.04879484, 0.6152616, 0.285694, 0, 0.9764706, 1, 1,
0.05071649, 0.2927421, -1.400294, 0, 0.9686275, 1, 1,
0.06241622, -0.987112, 4.278536, 0, 0.9647059, 1, 1,
0.06870323, -0.05310251, 3.082601, 0, 0.9568627, 1, 1,
0.07001781, -0.1328148, 2.041207, 0, 0.9529412, 1, 1,
0.07584581, 0.4598611, -1.811505, 0, 0.945098, 1, 1,
0.0767502, 0.1119488, 0.5919702, 0, 0.9411765, 1, 1,
0.07816918, 0.534568, -0.2952809, 0, 0.9333333, 1, 1,
0.07892174, -1.148049, 3.649551, 0, 0.9294118, 1, 1,
0.07929944, -1.535661, 3.949064, 0, 0.9215686, 1, 1,
0.08000331, 1.125872, 1.066397, 0, 0.9176471, 1, 1,
0.101873, 1.114347, 0.8115056, 0, 0.9098039, 1, 1,
0.102405, -0.7710051, 1.500004, 0, 0.9058824, 1, 1,
0.1078639, -1.776537, 3.70243, 0, 0.8980392, 1, 1,
0.1088323, 1.40227, 0.5896968, 0, 0.8901961, 1, 1,
0.1135891, -0.4620711, 4.296865, 0, 0.8862745, 1, 1,
0.1152255, 2.02535, 0.01804251, 0, 0.8784314, 1, 1,
0.1181509, -0.2288198, 2.456683, 0, 0.8745098, 1, 1,
0.1216121, 1.076621, -0.0001700742, 0, 0.8666667, 1, 1,
0.1265924, -0.4656606, 2.768517, 0, 0.8627451, 1, 1,
0.1302234, 0.1095057, 1.183102, 0, 0.854902, 1, 1,
0.1345429, -0.2420038, 3.383081, 0, 0.8509804, 1, 1,
0.1358716, 0.8676661, 0.7370815, 0, 0.8431373, 1, 1,
0.1408205, -0.6185349, 2.613986, 0, 0.8392157, 1, 1,
0.144315, 0.604545, -0.6135489, 0, 0.8313726, 1, 1,
0.1446991, 0.5361078, 0.7620591, 0, 0.827451, 1, 1,
0.1448801, 0.3043509, -0.3969709, 0, 0.8196079, 1, 1,
0.1463684, 0.7017825, -0.7116808, 0, 0.8156863, 1, 1,
0.1465808, 0.8191468, -0.1710075, 0, 0.8078431, 1, 1,
0.1533202, -0.9907932, 4.425279, 0, 0.8039216, 1, 1,
0.1562612, 0.4771064, 0.2493345, 0, 0.7960784, 1, 1,
0.1584298, -0.6037832, 1.959693, 0, 0.7882353, 1, 1,
0.1596566, -0.1476015, 1.10248, 0, 0.7843137, 1, 1,
0.1623111, -1.070197, 2.353867, 0, 0.7764706, 1, 1,
0.1633147, -0.2093528, 2.833251, 0, 0.772549, 1, 1,
0.1656287, 0.6825935, -0.4866638, 0, 0.7647059, 1, 1,
0.1666791, -0.3783341, 2.790167, 0, 0.7607843, 1, 1,
0.167788, -1.687101, 2.061475, 0, 0.7529412, 1, 1,
0.1682691, 0.1072155, 1.89864, 0, 0.7490196, 1, 1,
0.1702948, 0.6854615, -0.1925199, 0, 0.7411765, 1, 1,
0.1730657, -0.5645679, 3.1325, 0, 0.7372549, 1, 1,
0.1748283, 2.152577, 1.489468, 0, 0.7294118, 1, 1,
0.175378, 1.845366, -1.381751, 0, 0.7254902, 1, 1,
0.1764771, -1.048, 3.060035, 0, 0.7176471, 1, 1,
0.1775777, 0.6849006, 0.3662876, 0, 0.7137255, 1, 1,
0.1776903, 0.5751449, 0.9952273, 0, 0.7058824, 1, 1,
0.1837469, -0.3356847, 4.188478, 0, 0.6980392, 1, 1,
0.1863382, -3.149028, 3.429816, 0, 0.6941177, 1, 1,
0.1864244, -0.224552, 2.04807, 0, 0.6862745, 1, 1,
0.1895078, 1.417193, 2.02069, 0, 0.682353, 1, 1,
0.1898941, -0.2763287, 5.375039, 0, 0.6745098, 1, 1,
0.1916375, -1.861387, 3.14873, 0, 0.6705883, 1, 1,
0.1919691, -0.999747, 2.971977, 0, 0.6627451, 1, 1,
0.1945217, -0.5133694, 1.879454, 0, 0.6588235, 1, 1,
0.1967935, 0.4086575, -0.383839, 0, 0.6509804, 1, 1,
0.1975109, -0.3231257, 2.612138, 0, 0.6470588, 1, 1,
0.1983184, -0.4808103, 2.155755, 0, 0.6392157, 1, 1,
0.1995844, -0.6866179, 1.569879, 0, 0.6352941, 1, 1,
0.2006217, -0.5098929, 2.174252, 0, 0.627451, 1, 1,
0.2009757, -0.3862562, 3.714922, 0, 0.6235294, 1, 1,
0.2011012, 0.7793193, -2.042306, 0, 0.6156863, 1, 1,
0.2134902, 1.001312, -0.3896858, 0, 0.6117647, 1, 1,
0.2151013, -0.9090267, 4.40189, 0, 0.6039216, 1, 1,
0.2222326, 0.6644351, 0.05583811, 0, 0.5960785, 1, 1,
0.2225565, -0.1004386, 3.715839, 0, 0.5921569, 1, 1,
0.2271354, 2.814967, 1.572576, 0, 0.5843138, 1, 1,
0.2278661, 1.507964, 1.108051, 0, 0.5803922, 1, 1,
0.2307783, -0.9615615, 3.742289, 0, 0.572549, 1, 1,
0.2366206, -0.5655829, 4.720937, 0, 0.5686275, 1, 1,
0.2462609, -0.08860771, 4.015329, 0, 0.5607843, 1, 1,
0.2489232, 2.049646, -1.474718, 0, 0.5568628, 1, 1,
0.2498253, -3.070133, 1.94502, 0, 0.5490196, 1, 1,
0.2531617, -1.097873, 3.512331, 0, 0.5450981, 1, 1,
0.2534277, 0.1146025, 1.562525, 0, 0.5372549, 1, 1,
0.2606366, 0.7949661, -0.2130169, 0, 0.5333334, 1, 1,
0.2628401, -1.77849, 1.104579, 0, 0.5254902, 1, 1,
0.2640509, 0.7153348, 1.762324, 0, 0.5215687, 1, 1,
0.2666328, 1.983055, 1.440457, 0, 0.5137255, 1, 1,
0.2780315, -0.8510971, 2.465651, 0, 0.509804, 1, 1,
0.2809861, 0.2832132, 2.28976, 0, 0.5019608, 1, 1,
0.2830878, 0.9321853, -0.8524672, 0, 0.4941176, 1, 1,
0.2865328, 0.6936877, -0.5213734, 0, 0.4901961, 1, 1,
0.2963918, 0.6990867, 0.7256554, 0, 0.4823529, 1, 1,
0.2972112, -1.050489, 3.308482, 0, 0.4784314, 1, 1,
0.297219, 0.2085294, -0.8391742, 0, 0.4705882, 1, 1,
0.2990637, 1.044133, -1.374707, 0, 0.4666667, 1, 1,
0.3003611, 0.7713637, -1.846251, 0, 0.4588235, 1, 1,
0.3006332, -0.8765604, 2.928547, 0, 0.454902, 1, 1,
0.3053353, 3.218976, -0.01535625, 0, 0.4470588, 1, 1,
0.3073423, -0.07736045, 1.088869, 0, 0.4431373, 1, 1,
0.3097976, 1.060667, 1.605568, 0, 0.4352941, 1, 1,
0.312757, 0.2256187, 1.504378, 0, 0.4313726, 1, 1,
0.3162365, -1.122565, 1.639555, 0, 0.4235294, 1, 1,
0.3203595, 1.010559, 0.8441014, 0, 0.4196078, 1, 1,
0.3226689, 0.2414957, -0.3811583, 0, 0.4117647, 1, 1,
0.3277803, 0.3415926, 2.207386, 0, 0.4078431, 1, 1,
0.3283271, 1.425738, -0.3965774, 0, 0.4, 1, 1,
0.3298408, -0.4104899, 3.284883, 0, 0.3921569, 1, 1,
0.3309256, 1.391127, 0.9344172, 0, 0.3882353, 1, 1,
0.3314693, -0.164424, 2.718657, 0, 0.3803922, 1, 1,
0.3367726, 0.157656, 0.6343906, 0, 0.3764706, 1, 1,
0.3371056, -0.9446588, 3.579826, 0, 0.3686275, 1, 1,
0.347036, -0.7616988, 2.301134, 0, 0.3647059, 1, 1,
0.3475423, -0.008790223, 2.028298, 0, 0.3568628, 1, 1,
0.3479261, 0.4156016, 2.605008, 0, 0.3529412, 1, 1,
0.3486882, 0.09221643, 0.7948912, 0, 0.345098, 1, 1,
0.3492275, 0.5050542, -0.2689853, 0, 0.3411765, 1, 1,
0.3507878, 0.5143149, -0.3675666, 0, 0.3333333, 1, 1,
0.3512347, -0.244134, 2.353705, 0, 0.3294118, 1, 1,
0.3517909, -0.183667, 2.956093, 0, 0.3215686, 1, 1,
0.3518789, -0.3372236, 1.957605, 0, 0.3176471, 1, 1,
0.3545824, 0.6673442, -1.215913, 0, 0.3098039, 1, 1,
0.3575679, 0.6423929, -0.7994847, 0, 0.3058824, 1, 1,
0.3649161, 1.225833, -0.2182378, 0, 0.2980392, 1, 1,
0.3660751, 1.391757, 0.1478941, 0, 0.2901961, 1, 1,
0.3745357, 1.734181, -0.4777485, 0, 0.2862745, 1, 1,
0.3749509, 0.5612879, 2.202842, 0, 0.2784314, 1, 1,
0.375893, 0.4568696, 0.8806678, 0, 0.2745098, 1, 1,
0.3762804, -0.4512095, 3.14891, 0, 0.2666667, 1, 1,
0.3786819, 1.608197, 0.3321407, 0, 0.2627451, 1, 1,
0.3790135, 0.8346397, 0.03641221, 0, 0.254902, 1, 1,
0.381966, 1.084845, 2.429406, 0, 0.2509804, 1, 1,
0.3846472, -1.395795, 2.849729, 0, 0.2431373, 1, 1,
0.3883576, -0.1353046, 0.4004553, 0, 0.2392157, 1, 1,
0.3914902, -0.6449619, 2.099745, 0, 0.2313726, 1, 1,
0.3927727, -0.8310868, 3.572345, 0, 0.227451, 1, 1,
0.3948336, 1.485347, -0.1542319, 0, 0.2196078, 1, 1,
0.3979131, -0.6675769, 3.575943, 0, 0.2156863, 1, 1,
0.4002976, -0.7724378, 3.075519, 0, 0.2078431, 1, 1,
0.4004515, -0.5037024, 4.034986, 0, 0.2039216, 1, 1,
0.4014124, 0.4145708, 0.06360672, 0, 0.1960784, 1, 1,
0.4022002, -2.567913, 3.371443, 0, 0.1882353, 1, 1,
0.4099022, -0.2970039, 3.479826, 0, 0.1843137, 1, 1,
0.4141443, 1.16317, -0.954312, 0, 0.1764706, 1, 1,
0.4153901, -2.098592, 2.635663, 0, 0.172549, 1, 1,
0.4181673, 0.5935352, 2.17451, 0, 0.1647059, 1, 1,
0.4189712, -1.379297, 1.938499, 0, 0.1607843, 1, 1,
0.4190622, -0.6577746, 3.651738, 0, 0.1529412, 1, 1,
0.4193948, -0.8950133, 2.738104, 0, 0.1490196, 1, 1,
0.4226086, -0.4999618, 1.864001, 0, 0.1411765, 1, 1,
0.4286805, -0.2307881, 2.003542, 0, 0.1372549, 1, 1,
0.4300313, 0.7048524, 0.2957099, 0, 0.1294118, 1, 1,
0.4368287, -0.1418083, 1.31938, 0, 0.1254902, 1, 1,
0.4409141, 2.194456, 0.154615, 0, 0.1176471, 1, 1,
0.4436539, 0.6258444, 1.587807, 0, 0.1137255, 1, 1,
0.4493942, 0.5135602, 1.699827, 0, 0.1058824, 1, 1,
0.4530773, 0.08460345, 1.713863, 0, 0.09803922, 1, 1,
0.4553987, -0.9636096, 2.647615, 0, 0.09411765, 1, 1,
0.4565459, 0.8527193, 0.1296874, 0, 0.08627451, 1, 1,
0.4570406, 0.9599649, 0.6463088, 0, 0.08235294, 1, 1,
0.4628284, -1.46686, 4.547485, 0, 0.07450981, 1, 1,
0.4634546, 0.816966, 0.5559945, 0, 0.07058824, 1, 1,
0.4694054, -0.1797469, 0.3088302, 0, 0.0627451, 1, 1,
0.4701457, -1.207779, 4.269425, 0, 0.05882353, 1, 1,
0.4703637, -0.7158389, 4.19227, 0, 0.05098039, 1, 1,
0.4755255, 0.0044327, 0.9631078, 0, 0.04705882, 1, 1,
0.4807233, 1.238293, 1.497538, 0, 0.03921569, 1, 1,
0.4811868, 1.388626, -0.06287955, 0, 0.03529412, 1, 1,
0.4826508, -2.257973, 2.928683, 0, 0.02745098, 1, 1,
0.4835575, 1.141824, 0.2120499, 0, 0.02352941, 1, 1,
0.488359, -0.5121589, 3.005599, 0, 0.01568628, 1, 1,
0.4888149, 0.7127616, 1.436512, 0, 0.01176471, 1, 1,
0.4904305, -0.1790515, 2.408413, 0, 0.003921569, 1, 1,
0.4905069, 0.524178, -0.996736, 0.003921569, 0, 1, 1,
0.4910724, -0.9058052, 4.069223, 0.007843138, 0, 1, 1,
0.4935981, 1.41626, -0.01298745, 0.01568628, 0, 1, 1,
0.4972219, -0.7938559, 1.293095, 0.01960784, 0, 1, 1,
0.5050806, 0.3820057, -0.2912075, 0.02745098, 0, 1, 1,
0.5061352, -1.309498, 3.3605, 0.03137255, 0, 1, 1,
0.5087783, -0.09314222, 1.488639, 0.03921569, 0, 1, 1,
0.5120386, 0.476985, 0.5367498, 0.04313726, 0, 1, 1,
0.5123565, 1.645249, 0.3883939, 0.05098039, 0, 1, 1,
0.5125182, 0.5381615, 1.626294, 0.05490196, 0, 1, 1,
0.5145946, 0.6335857, 0.4817377, 0.0627451, 0, 1, 1,
0.5199687, -1.467938, 2.476954, 0.06666667, 0, 1, 1,
0.5229122, -0.9267418, 2.520523, 0.07450981, 0, 1, 1,
0.5234773, 2.276456, 0.9549493, 0.07843138, 0, 1, 1,
0.5278825, -1.812377, 3.393011, 0.08627451, 0, 1, 1,
0.5304658, -0.3569604, 0.728026, 0.09019608, 0, 1, 1,
0.5406443, 0.3886782, 0.572412, 0.09803922, 0, 1, 1,
0.5463915, -1.240259, 4.126902, 0.1058824, 0, 1, 1,
0.5467469, -0.06472948, 3.342496, 0.1098039, 0, 1, 1,
0.5504046, 0.9209048, -0.5946472, 0.1176471, 0, 1, 1,
0.5525473, 1.527889, 0.08346973, 0.1215686, 0, 1, 1,
0.5543547, 0.06363245, 2.229796, 0.1294118, 0, 1, 1,
0.5570881, 0.005416289, 2.091637, 0.1333333, 0, 1, 1,
0.5656813, -0.1163963, 1.503514, 0.1411765, 0, 1, 1,
0.5662667, 0.08327111, 2.59295, 0.145098, 0, 1, 1,
0.5737938, -1.591478, 2.94395, 0.1529412, 0, 1, 1,
0.5760462, 0.09430965, 3.029799, 0.1568628, 0, 1, 1,
0.5773738, -0.9097727, 3.773572, 0.1647059, 0, 1, 1,
0.5806251, 0.009649727, 1.847614, 0.1686275, 0, 1, 1,
0.5834457, -0.2052671, 0.9167868, 0.1764706, 0, 1, 1,
0.5899513, -1.114665, 3.78612, 0.1803922, 0, 1, 1,
0.5911016, 1.209871, 2.366573, 0.1882353, 0, 1, 1,
0.5926244, 0.2379262, 3.07289, 0.1921569, 0, 1, 1,
0.6083416, -0.5253356, 3.707608, 0.2, 0, 1, 1,
0.6265741, -0.6184523, 2.389888, 0.2078431, 0, 1, 1,
0.6267531, -1.347788, 3.411171, 0.2117647, 0, 1, 1,
0.6310798, 0.8745303, -0.1068769, 0.2196078, 0, 1, 1,
0.645172, 1.296851, 0.3458548, 0.2235294, 0, 1, 1,
0.6468449, -1.975641, 3.924789, 0.2313726, 0, 1, 1,
0.6489807, 0.4565774, 0.479814, 0.2352941, 0, 1, 1,
0.6498161, 0.5423062, -0.5418475, 0.2431373, 0, 1, 1,
0.651822, -0.2461265, 0.6860372, 0.2470588, 0, 1, 1,
0.6551524, -0.7967157, 2.305879, 0.254902, 0, 1, 1,
0.6589653, -0.0037912, 1.259477, 0.2588235, 0, 1, 1,
0.6590386, 0.3925207, 2.568177, 0.2666667, 0, 1, 1,
0.6593485, -0.1732411, 0.4377441, 0.2705882, 0, 1, 1,
0.6600325, -0.4060933, 1.904705, 0.2784314, 0, 1, 1,
0.661665, 0.1033536, 0.8358129, 0.282353, 0, 1, 1,
0.663246, -0.02128025, 0.7335231, 0.2901961, 0, 1, 1,
0.6662259, 0.8208379, 0.6149577, 0.2941177, 0, 1, 1,
0.6673535, -0.9024574, 1.864756, 0.3019608, 0, 1, 1,
0.6712711, 0.007963507, 1.045103, 0.3098039, 0, 1, 1,
0.6779315, -3.418782, 3.193907, 0.3137255, 0, 1, 1,
0.6815882, 0.01210627, 1.650854, 0.3215686, 0, 1, 1,
0.6857207, 0.2962036, 1.515916, 0.3254902, 0, 1, 1,
0.686725, -1.86933, 4.482216, 0.3333333, 0, 1, 1,
0.6891255, -0.06578796, 1.657487, 0.3372549, 0, 1, 1,
0.6941318, -0.1866861, 2.857063, 0.345098, 0, 1, 1,
0.6943932, 2.112798, 1.45537, 0.3490196, 0, 1, 1,
0.6951554, -1.280503, 1.541699, 0.3568628, 0, 1, 1,
0.6955125, 0.6531433, -0.4594181, 0.3607843, 0, 1, 1,
0.7057286, -1.177963, 4.130789, 0.3686275, 0, 1, 1,
0.7060034, 0.2963672, 0.6111652, 0.372549, 0, 1, 1,
0.7071946, -1.102747, 1.228357, 0.3803922, 0, 1, 1,
0.7121733, 0.8186343, 0.1805723, 0.3843137, 0, 1, 1,
0.7139923, 1.632718, -0.3500002, 0.3921569, 0, 1, 1,
0.716561, 1.125146, 0.3237505, 0.3960784, 0, 1, 1,
0.7169387, -0.5651818, 1.653844, 0.4039216, 0, 1, 1,
0.7189432, -0.1572104, 1.267204, 0.4117647, 0, 1, 1,
0.7205107, -0.1658447, 4.287464, 0.4156863, 0, 1, 1,
0.7210434, 0.6096112, 1.205536, 0.4235294, 0, 1, 1,
0.7218853, 0.2927679, 1.999925, 0.427451, 0, 1, 1,
0.7254282, -1.792157, 3.667022, 0.4352941, 0, 1, 1,
0.7267829, -1.07193, 3.927532, 0.4392157, 0, 1, 1,
0.7303202, 1.421226, 2.061676, 0.4470588, 0, 1, 1,
0.7317793, 0.04704316, -1.118317, 0.4509804, 0, 1, 1,
0.7333462, 0.6466952, -0.07500482, 0.4588235, 0, 1, 1,
0.7333717, -0.5794646, 2.224566, 0.4627451, 0, 1, 1,
0.7344041, 0.9404882, 1.161885, 0.4705882, 0, 1, 1,
0.7359535, 0.2784812, 0.6710442, 0.4745098, 0, 1, 1,
0.7424781, 1.239596, 0.06763383, 0.4823529, 0, 1, 1,
0.7426536, 0.9486156, 1.75032, 0.4862745, 0, 1, 1,
0.7496651, -0.6894276, 1.093842, 0.4941176, 0, 1, 1,
0.7525682, -1.904989, 3.329305, 0.5019608, 0, 1, 1,
0.7549265, -0.6963271, 2.102992, 0.5058824, 0, 1, 1,
0.7598793, -0.3799496, 1.559671, 0.5137255, 0, 1, 1,
0.7602576, -0.2779621, 1.448883, 0.5176471, 0, 1, 1,
0.7609591, -1.062217, 2.430349, 0.5254902, 0, 1, 1,
0.7621812, 0.2497241, 2.054152, 0.5294118, 0, 1, 1,
0.762862, 0.5556105, 1.645909, 0.5372549, 0, 1, 1,
0.7636042, 0.9884034, 1.443153, 0.5411765, 0, 1, 1,
0.7690856, -0.9952472, 3.217115, 0.5490196, 0, 1, 1,
0.7702449, -1.456193, 1.40983, 0.5529412, 0, 1, 1,
0.7724026, 0.4031602, 1.237702, 0.5607843, 0, 1, 1,
0.7742661, -0.7437785, 1.801384, 0.5647059, 0, 1, 1,
0.7763997, -0.3576001, 2.529798, 0.572549, 0, 1, 1,
0.7809278, -0.5174456, 1.269144, 0.5764706, 0, 1, 1,
0.7866316, -0.7670901, 4.109838, 0.5843138, 0, 1, 1,
0.7880274, 0.1614588, 2.494886, 0.5882353, 0, 1, 1,
0.7883134, -0.8841777, 2.046618, 0.5960785, 0, 1, 1,
0.7897858, -0.7262826, 3.140673, 0.6039216, 0, 1, 1,
0.7930506, 1.116659, 1.350871, 0.6078432, 0, 1, 1,
0.7955489, 1.423808, 3.011291, 0.6156863, 0, 1, 1,
0.7959567, -0.01685012, 0.9429619, 0.6196079, 0, 1, 1,
0.8011495, -2.241693, 5.270871, 0.627451, 0, 1, 1,
0.8028265, -0.2253184, 3.58638, 0.6313726, 0, 1, 1,
0.8063242, 0.5206174, 1.981951, 0.6392157, 0, 1, 1,
0.8087099, -1.055987, 3.490353, 0.6431373, 0, 1, 1,
0.8087191, 0.08377624, 1.674954, 0.6509804, 0, 1, 1,
0.8100059, -1.020841, 2.803975, 0.654902, 0, 1, 1,
0.8101441, 1.407416, -1.059065, 0.6627451, 0, 1, 1,
0.8109419, -0.2228179, 3.293998, 0.6666667, 0, 1, 1,
0.8140208, 2.525899, -0.2220176, 0.6745098, 0, 1, 1,
0.8246972, -0.2993475, 1.517413, 0.6784314, 0, 1, 1,
0.8294343, 0.7391359, 1.067269, 0.6862745, 0, 1, 1,
0.8307323, -1.383131, 2.030319, 0.6901961, 0, 1, 1,
0.8328436, -0.405737, 3.129641, 0.6980392, 0, 1, 1,
0.8336098, 2.448813, 1.497038, 0.7058824, 0, 1, 1,
0.8384708, -0.227658, 1.892227, 0.7098039, 0, 1, 1,
0.8422589, 1.341781, 1.430802, 0.7176471, 0, 1, 1,
0.8457066, -2.343359, 2.109089, 0.7215686, 0, 1, 1,
0.8506531, -0.5940797, 2.106367, 0.7294118, 0, 1, 1,
0.8528693, 0.715259, -0.3720411, 0.7333333, 0, 1, 1,
0.8561417, 0.7096153, -0.4205279, 0.7411765, 0, 1, 1,
0.8571396, -1.685974, 1.127657, 0.7450981, 0, 1, 1,
0.8622071, -0.9994258, 1.506465, 0.7529412, 0, 1, 1,
0.8639133, -0.3389888, 0.9523892, 0.7568628, 0, 1, 1,
0.8694369, 0.4679594, 3.079429, 0.7647059, 0, 1, 1,
0.8732163, -0.6898307, 1.407904, 0.7686275, 0, 1, 1,
0.8733299, 1.223168, -1.04223, 0.7764706, 0, 1, 1,
0.8757349, -0.6891497, 3.202798, 0.7803922, 0, 1, 1,
0.8766436, -0.1166011, 2.02119, 0.7882353, 0, 1, 1,
0.88295, 0.1965186, 1.86628, 0.7921569, 0, 1, 1,
0.8866695, 0.2453016, 1.832677, 0.8, 0, 1, 1,
0.905525, -0.8609817, 3.750421, 0.8078431, 0, 1, 1,
0.9119388, 2.270216, -1.151654, 0.8117647, 0, 1, 1,
0.9158954, 0.1190164, 1.97026, 0.8196079, 0, 1, 1,
0.919667, -0.1791999, 2.517162, 0.8235294, 0, 1, 1,
0.9296492, 1.745835, 2.486445, 0.8313726, 0, 1, 1,
0.9313232, 0.9700086, 0.8894756, 0.8352941, 0, 1, 1,
0.9384, 0.3821431, 0.8797631, 0.8431373, 0, 1, 1,
0.9388138, -1.177719, 3.237906, 0.8470588, 0, 1, 1,
0.9408361, -0.1656952, 2.669386, 0.854902, 0, 1, 1,
0.9451044, 0.5014512, 1.222364, 0.8588235, 0, 1, 1,
0.9463965, -0.3716338, 1.467519, 0.8666667, 0, 1, 1,
0.9493002, 1.220565, 2.546483, 0.8705882, 0, 1, 1,
0.9524113, -0.2695472, 2.47703, 0.8784314, 0, 1, 1,
0.9544141, -0.4493473, 2.388182, 0.8823529, 0, 1, 1,
0.9569255, -1.35864, 4.609158, 0.8901961, 0, 1, 1,
0.9589076, 0.2570101, 2.702474, 0.8941177, 0, 1, 1,
0.9620911, 0.2403135, 0.9948127, 0.9019608, 0, 1, 1,
0.9629728, 2.793066, 0.2537576, 0.9098039, 0, 1, 1,
0.9635412, 1.723539, 0.3410586, 0.9137255, 0, 1, 1,
0.9676552, -0.1731919, 2.912086, 0.9215686, 0, 1, 1,
0.9729136, -1.817722, 2.739098, 0.9254902, 0, 1, 1,
0.9783939, 0.6385633, 1.576338, 0.9333333, 0, 1, 1,
0.9810264, 0.6837857, 1.785435, 0.9372549, 0, 1, 1,
0.9841845, 0.3202437, 0.6261411, 0.945098, 0, 1, 1,
0.9899856, 0.7302581, 0.7293462, 0.9490196, 0, 1, 1,
0.9923108, 0.7996866, 1.043307, 0.9568627, 0, 1, 1,
1.001546, -0.518205, 2.700611, 0.9607843, 0, 1, 1,
1.004881, -1.610868, 3.712295, 0.9686275, 0, 1, 1,
1.008268, -0.1803856, 2.339054, 0.972549, 0, 1, 1,
1.022054, 0.8804653, 0.9795049, 0.9803922, 0, 1, 1,
1.028761, 1.065129, 0.4785827, 0.9843137, 0, 1, 1,
1.029562, -0.810266, 1.401747, 0.9921569, 0, 1, 1,
1.034404, 1.278642, 0.7445614, 0.9960784, 0, 1, 1,
1.042103, 0.5317439, 0.6017776, 1, 0, 0.9960784, 1,
1.04592, -0.6495245, 1.645399, 1, 0, 0.9882353, 1,
1.046026, 2.07884, 1.101978, 1, 0, 0.9843137, 1,
1.047906, -0.104724, 0.9309083, 1, 0, 0.9764706, 1,
1.053165, -1.229616, 3.066483, 1, 0, 0.972549, 1,
1.058186, 0.8643784, -0.1313323, 1, 0, 0.9647059, 1,
1.065779, -0.6691262, 0.4755772, 1, 0, 0.9607843, 1,
1.069098, -0.04201023, -0.3806796, 1, 0, 0.9529412, 1,
1.071272, 0.6778083, 0.1798562, 1, 0, 0.9490196, 1,
1.080093, 1.989666, 1.053683, 1, 0, 0.9411765, 1,
1.090271, 0.4514662, 1.292652, 1, 0, 0.9372549, 1,
1.095, 1.431708, -0.9639698, 1, 0, 0.9294118, 1,
1.095155, -0.06086158, 0.9687426, 1, 0, 0.9254902, 1,
1.103381, 0.908467, -0.1797362, 1, 0, 0.9176471, 1,
1.10447, -1.048203, 1.219672, 1, 0, 0.9137255, 1,
1.104693, -1.576995, 2.572309, 1, 0, 0.9058824, 1,
1.104811, -0.05340591, 1.824911, 1, 0, 0.9019608, 1,
1.105863, 0.5947943, 0.2139335, 1, 0, 0.8941177, 1,
1.108108, -0.4719762, 1.021866, 1, 0, 0.8862745, 1,
1.112347, 0.9178943, 0.3202497, 1, 0, 0.8823529, 1,
1.114842, 0.3381948, 1.555041, 1, 0, 0.8745098, 1,
1.119294, -0.277719, 2.877886, 1, 0, 0.8705882, 1,
1.12096, 0.2006019, 1.708448, 1, 0, 0.8627451, 1,
1.122586, -1.889173, 2.628925, 1, 0, 0.8588235, 1,
1.129306, 1.236534, 0.2289584, 1, 0, 0.8509804, 1,
1.132259, 0.03044631, 2.573334, 1, 0, 0.8470588, 1,
1.13705, -1.228908, 2.027545, 1, 0, 0.8392157, 1,
1.140053, 1.407434, 0.9237346, 1, 0, 0.8352941, 1,
1.144816, -0.9095508, 1.613351, 1, 0, 0.827451, 1,
1.147872, -1.445865, 2.984603, 1, 0, 0.8235294, 1,
1.149877, 1.663361, 1.629612, 1, 0, 0.8156863, 1,
1.150683, -0.333521, 0.7665406, 1, 0, 0.8117647, 1,
1.151277, -0.3841198, 3.743133, 1, 0, 0.8039216, 1,
1.155349, -0.3442949, 2.030406, 1, 0, 0.7960784, 1,
1.162788, 1.152552, -0.1817882, 1, 0, 0.7921569, 1,
1.17342, 1.073121, 1.436987, 1, 0, 0.7843137, 1,
1.174129, -0.5989463, 1.057156, 1, 0, 0.7803922, 1,
1.17437, -1.263428, 2.479412, 1, 0, 0.772549, 1,
1.176162, -2.795814, 2.25504, 1, 0, 0.7686275, 1,
1.181663, 0.9109024, -0.1907672, 1, 0, 0.7607843, 1,
1.183897, -0.3942072, 2.070977, 1, 0, 0.7568628, 1,
1.189852, -0.8347893, 3.445306, 1, 0, 0.7490196, 1,
1.195584, -1.212243, 2.202665, 1, 0, 0.7450981, 1,
1.203185, 2.461155, 0.4361905, 1, 0, 0.7372549, 1,
1.208739, -0.6935689, 2.26901, 1, 0, 0.7333333, 1,
1.211266, 0.3823884, 1.004899, 1, 0, 0.7254902, 1,
1.213636, -1.149551, 3.195358, 1, 0, 0.7215686, 1,
1.21439, -2.932286, 3.918966, 1, 0, 0.7137255, 1,
1.225532, 0.4014059, 2.07166, 1, 0, 0.7098039, 1,
1.229459, -1.476428, 3.57304, 1, 0, 0.7019608, 1,
1.230501, 0.4206491, -0.03097797, 1, 0, 0.6941177, 1,
1.23147, -0.07756163, 1.070606, 1, 0, 0.6901961, 1,
1.231635, 0.7163443, 1.898808, 1, 0, 0.682353, 1,
1.233962, 1.042315, 1.388081, 1, 0, 0.6784314, 1,
1.23424, 0.4975742, 0.1280071, 1, 0, 0.6705883, 1,
1.23661, 0.6252692, 1.510272, 1, 0, 0.6666667, 1,
1.253385, -2.412504, 1.163038, 1, 0, 0.6588235, 1,
1.259927, -1.310958, 3.819197, 1, 0, 0.654902, 1,
1.260734, -0.3026237, 1.88288, 1, 0, 0.6470588, 1,
1.271316, -0.08226311, 3.055827, 1, 0, 0.6431373, 1,
1.28026, -0.1188492, 1.592438, 1, 0, 0.6352941, 1,
1.303531, -0.1386364, 0.1214883, 1, 0, 0.6313726, 1,
1.311212, 0.3901584, 0.537453, 1, 0, 0.6235294, 1,
1.315743, -1.465955, 2.753865, 1, 0, 0.6196079, 1,
1.316085, -0.8693272, 2.561526, 1, 0, 0.6117647, 1,
1.320384, 0.3953284, 0.2367357, 1, 0, 0.6078432, 1,
1.320579, -0.4761643, 2.669821, 1, 0, 0.6, 1,
1.335619, 0.6053449, 2.74203, 1, 0, 0.5921569, 1,
1.336853, 0.9352684, 0.693745, 1, 0, 0.5882353, 1,
1.341695, -0.182836, 3.509266, 1, 0, 0.5803922, 1,
1.348662, -0.7497277, 2.441238, 1, 0, 0.5764706, 1,
1.360569, -0.3510006, 2.026936, 1, 0, 0.5686275, 1,
1.364163, -0.1714169, 1.516181, 1, 0, 0.5647059, 1,
1.38, -1.627268, 2.159398, 1, 0, 0.5568628, 1,
1.38073, -0.6638876, 3.204551, 1, 0, 0.5529412, 1,
1.385558, 0.07136545, 0.4423518, 1, 0, 0.5450981, 1,
1.386461, -0.3027319, 1.838374, 1, 0, 0.5411765, 1,
1.3893, 1.288601, 1.420033, 1, 0, 0.5333334, 1,
1.392361, 1.05287, 0.7866545, 1, 0, 0.5294118, 1,
1.398642, 1.537511, 2.674258, 1, 0, 0.5215687, 1,
1.407712, 0.9715798, 1.014124, 1, 0, 0.5176471, 1,
1.408338, -0.2932139, 2.512935, 1, 0, 0.509804, 1,
1.4102, 1.04741, 1.92198, 1, 0, 0.5058824, 1,
1.41491, -1.359489, 2.472872, 1, 0, 0.4980392, 1,
1.415671, 0.4295458, 1.656718, 1, 0, 0.4901961, 1,
1.417182, -0.3539581, 2.324799, 1, 0, 0.4862745, 1,
1.433317, 0.3704522, 2.553453, 1, 0, 0.4784314, 1,
1.450388, 1.660601, 2.88626, 1, 0, 0.4745098, 1,
1.473973, 1.394347, 2.94817, 1, 0, 0.4666667, 1,
1.492246, -1.617662, 3.545619, 1, 0, 0.4627451, 1,
1.492443, -0.675453, 1.726185, 1, 0, 0.454902, 1,
1.498715, -1.532844, 2.160945, 1, 0, 0.4509804, 1,
1.499149, 0.9538347, 1.344444, 1, 0, 0.4431373, 1,
1.499227, 0.7674845, 0.7355188, 1, 0, 0.4392157, 1,
1.499441, -0.4079334, 2.096641, 1, 0, 0.4313726, 1,
1.500558, 0.4461738, 3.030058, 1, 0, 0.427451, 1,
1.504728, 1.07433, 2.710903, 1, 0, 0.4196078, 1,
1.504889, 3.037741, 2.195417, 1, 0, 0.4156863, 1,
1.515911, -0.6164685, 0.603061, 1, 0, 0.4078431, 1,
1.51629, 1.113125, 0.423859, 1, 0, 0.4039216, 1,
1.516791, -0.1535415, 1.57691, 1, 0, 0.3960784, 1,
1.521436, 0.3511833, 1.538513, 1, 0, 0.3882353, 1,
1.530865, 0.08290139, 2.776004, 1, 0, 0.3843137, 1,
1.534239, 0.1793104, 2.136333, 1, 0, 0.3764706, 1,
1.540319, -0.4440292, 1.607754, 1, 0, 0.372549, 1,
1.54081, -0.1479089, -0.6829419, 1, 0, 0.3647059, 1,
1.554219, -0.08715462, -0.2391781, 1, 0, 0.3607843, 1,
1.56764, 0.1726102, 2.077856, 1, 0, 0.3529412, 1,
1.572564, 0.5284505, 1.74089, 1, 0, 0.3490196, 1,
1.596057, 0.6655535, 2.524178, 1, 0, 0.3411765, 1,
1.601761, -0.2679279, 2.102312, 1, 0, 0.3372549, 1,
1.618577, 0.2643877, 2.402005, 1, 0, 0.3294118, 1,
1.660969, -0.07970137, 1.656221, 1, 0, 0.3254902, 1,
1.666678, 0.4400598, 0.7846939, 1, 0, 0.3176471, 1,
1.678838, -0.6595196, 0.8221995, 1, 0, 0.3137255, 1,
1.686477, 0.317062, 1.038977, 1, 0, 0.3058824, 1,
1.695852, 1.293285, 0.9502599, 1, 0, 0.2980392, 1,
1.699532, 0.3123555, 1.347975, 1, 0, 0.2941177, 1,
1.700495, -0.4352525, -0.2992654, 1, 0, 0.2862745, 1,
1.713407, 0.3537157, 1.561069, 1, 0, 0.282353, 1,
1.727567, 1.045618, 0.844446, 1, 0, 0.2745098, 1,
1.733432, -0.5825663, 2.709722, 1, 0, 0.2705882, 1,
1.749232, -1.750741, 1.034829, 1, 0, 0.2627451, 1,
1.77344, 0.7029245, 0.4669544, 1, 0, 0.2588235, 1,
1.775455, -1.050733, 3.064481, 1, 0, 0.2509804, 1,
1.781056, 1.887669, 1.016221, 1, 0, 0.2470588, 1,
1.792787, -0.8857875, 0.7719793, 1, 0, 0.2392157, 1,
1.797611, 1.020011, 1.022047, 1, 0, 0.2352941, 1,
1.801315, 1.297889, 1.564683, 1, 0, 0.227451, 1,
1.807417, 0.8487742, 1.098746, 1, 0, 0.2235294, 1,
1.811352, 0.9430802, 0.6102959, 1, 0, 0.2156863, 1,
1.813314, 1.006077, 0.753439, 1, 0, 0.2117647, 1,
1.81917, -0.5500519, 2.935465, 1, 0, 0.2039216, 1,
1.83683, 0.6413345, 3.290859, 1, 0, 0.1960784, 1,
1.847199, -0.942071, 0.4230656, 1, 0, 0.1921569, 1,
1.853484, -0.2034129, 2.590875, 1, 0, 0.1843137, 1,
1.857623, -0.9581453, 1.212047, 1, 0, 0.1803922, 1,
1.87184, 0.886201, 0.139284, 1, 0, 0.172549, 1,
1.878514, 1.602985, 0.9184188, 1, 0, 0.1686275, 1,
1.892803, 1.235074, 1.77797, 1, 0, 0.1607843, 1,
1.920004, 0.06258512, 1.353551, 1, 0, 0.1568628, 1,
1.920148, 0.5354702, 0.2712087, 1, 0, 0.1490196, 1,
1.952478, -0.1933106, 2.636259, 1, 0, 0.145098, 1,
1.966186, -1.394816, 0.3896693, 1, 0, 0.1372549, 1,
2.001787, 0.2602927, 0.9471609, 1, 0, 0.1333333, 1,
2.018807, 0.3139125, 1.749069, 1, 0, 0.1254902, 1,
2.035129, -0.8483477, -0.07365382, 1, 0, 0.1215686, 1,
2.067345, 0.9823307, 0.988107, 1, 0, 0.1137255, 1,
2.088962, 0.971685, 1.147436, 1, 0, 0.1098039, 1,
2.107457, -0.241485, 2.000657, 1, 0, 0.1019608, 1,
2.113683, 0.8865191, 1.949239, 1, 0, 0.09411765, 1,
2.122174, 0.4459713, 0.9923871, 1, 0, 0.09019608, 1,
2.125418, -1.246751, 1.141469, 1, 0, 0.08235294, 1,
2.125818, 0.8929955, 1.047609, 1, 0, 0.07843138, 1,
2.150393, -0.6562769, 0.63878, 1, 0, 0.07058824, 1,
2.170084, 1.333198, 1.478929, 1, 0, 0.06666667, 1,
2.198669, -0.2201424, 2.398971, 1, 0, 0.05882353, 1,
2.253639, 1.139508, 0.5570136, 1, 0, 0.05490196, 1,
2.296478, 0.7238063, 0.7846974, 1, 0, 0.04705882, 1,
2.335299, -0.6955691, 1.692812, 1, 0, 0.04313726, 1,
2.378847, 0.09840012, -0.6976553, 1, 0, 0.03529412, 1,
2.458358, -0.5946277, 2.901883, 1, 0, 0.03137255, 1,
2.478156, 0.6779307, 2.123144, 1, 0, 0.02352941, 1,
2.778165, 1.194805, 1.078356, 1, 0, 0.01960784, 1,
3.256896, -0.1656324, 0.5356472, 1, 0, 0.01176471, 1,
3.297579, 1.390018, 1.353909, 1, 0, 0.007843138, 1
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
0.2771076, -4.543882, -6.935006, 0, -0.5, 0.5, 0.5,
0.2771076, -4.543882, -6.935006, 1, -0.5, 0.5, 0.5,
0.2771076, -4.543882, -6.935006, 1, 1.5, 0.5, 0.5,
0.2771076, -4.543882, -6.935006, 0, 1.5, 0.5, 0.5
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
-3.767304, -0.09990299, -6.935006, 0, -0.5, 0.5, 0.5,
-3.767304, -0.09990299, -6.935006, 1, -0.5, 0.5, 0.5,
-3.767304, -0.09990299, -6.935006, 1, 1.5, 0.5, 0.5,
-3.767304, -0.09990299, -6.935006, 0, 1.5, 0.5, 0.5
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
-3.767304, -4.543882, 0.1120868, 0, -0.5, 0.5, 0.5,
-3.767304, -4.543882, 0.1120868, 1, -0.5, 0.5, 0.5,
-3.767304, -4.543882, 0.1120868, 1, 1.5, 0.5, 0.5,
-3.767304, -4.543882, 0.1120868, 0, 1.5, 0.5, 0.5
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
-2, -3.518348, -5.308753,
3, -3.518348, -5.308753,
-2, -3.518348, -5.308753,
-2, -3.68927, -5.579796,
-1, -3.518348, -5.308753,
-1, -3.68927, -5.579796,
0, -3.518348, -5.308753,
0, -3.68927, -5.579796,
1, -3.518348, -5.308753,
1, -3.68927, -5.579796,
2, -3.518348, -5.308753,
2, -3.68927, -5.579796,
3, -3.518348, -5.308753,
3, -3.68927, -5.579796
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
-2, -4.031115, -6.12188, 0, -0.5, 0.5, 0.5,
-2, -4.031115, -6.12188, 1, -0.5, 0.5, 0.5,
-2, -4.031115, -6.12188, 1, 1.5, 0.5, 0.5,
-2, -4.031115, -6.12188, 0, 1.5, 0.5, 0.5,
-1, -4.031115, -6.12188, 0, -0.5, 0.5, 0.5,
-1, -4.031115, -6.12188, 1, -0.5, 0.5, 0.5,
-1, -4.031115, -6.12188, 1, 1.5, 0.5, 0.5,
-1, -4.031115, -6.12188, 0, 1.5, 0.5, 0.5,
0, -4.031115, -6.12188, 0, -0.5, 0.5, 0.5,
0, -4.031115, -6.12188, 1, -0.5, 0.5, 0.5,
0, -4.031115, -6.12188, 1, 1.5, 0.5, 0.5,
0, -4.031115, -6.12188, 0, 1.5, 0.5, 0.5,
1, -4.031115, -6.12188, 0, -0.5, 0.5, 0.5,
1, -4.031115, -6.12188, 1, -0.5, 0.5, 0.5,
1, -4.031115, -6.12188, 1, 1.5, 0.5, 0.5,
1, -4.031115, -6.12188, 0, 1.5, 0.5, 0.5,
2, -4.031115, -6.12188, 0, -0.5, 0.5, 0.5,
2, -4.031115, -6.12188, 1, -0.5, 0.5, 0.5,
2, -4.031115, -6.12188, 1, 1.5, 0.5, 0.5,
2, -4.031115, -6.12188, 0, 1.5, 0.5, 0.5,
3, -4.031115, -6.12188, 0, -0.5, 0.5, 0.5,
3, -4.031115, -6.12188, 1, -0.5, 0.5, 0.5,
3, -4.031115, -6.12188, 1, 1.5, 0.5, 0.5,
3, -4.031115, -6.12188, 0, 1.5, 0.5, 0.5
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
-2.833978, -3, -5.308753,
-2.833978, 3, -5.308753,
-2.833978, -3, -5.308753,
-2.989532, -3, -5.579796,
-2.833978, -2, -5.308753,
-2.989532, -2, -5.579796,
-2.833978, -1, -5.308753,
-2.989532, -1, -5.579796,
-2.833978, 0, -5.308753,
-2.989532, 0, -5.579796,
-2.833978, 1, -5.308753,
-2.989532, 1, -5.579796,
-2.833978, 2, -5.308753,
-2.989532, 2, -5.579796,
-2.833978, 3, -5.308753,
-2.989532, 3, -5.579796
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
-3.300641, -3, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, -3, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, -3, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, -3, -6.12188, 0, 1.5, 0.5, 0.5,
-3.300641, -2, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, -2, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, -2, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, -2, -6.12188, 0, 1.5, 0.5, 0.5,
-3.300641, -1, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, -1, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, -1, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, -1, -6.12188, 0, 1.5, 0.5, 0.5,
-3.300641, 0, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, 0, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, 0, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, 0, -6.12188, 0, 1.5, 0.5, 0.5,
-3.300641, 1, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, 1, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, 1, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, 1, -6.12188, 0, 1.5, 0.5, 0.5,
-3.300641, 2, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, 2, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, 2, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, 2, -6.12188, 0, 1.5, 0.5, 0.5,
-3.300641, 3, -6.12188, 0, -0.5, 0.5, 0.5,
-3.300641, 3, -6.12188, 1, -0.5, 0.5, 0.5,
-3.300641, 3, -6.12188, 1, 1.5, 0.5, 0.5,
-3.300641, 3, -6.12188, 0, 1.5, 0.5, 0.5
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
-2.833978, -3.518348, -4,
-2.833978, -3.518348, 4,
-2.833978, -3.518348, -4,
-2.989532, -3.68927, -4,
-2.833978, -3.518348, -2,
-2.989532, -3.68927, -2,
-2.833978, -3.518348, 0,
-2.989532, -3.68927, 0,
-2.833978, -3.518348, 2,
-2.989532, -3.68927, 2,
-2.833978, -3.518348, 4,
-2.989532, -3.68927, 4
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
-3.300641, -4.031115, -4, 0, -0.5, 0.5, 0.5,
-3.300641, -4.031115, -4, 1, -0.5, 0.5, 0.5,
-3.300641, -4.031115, -4, 1, 1.5, 0.5, 0.5,
-3.300641, -4.031115, -4, 0, 1.5, 0.5, 0.5,
-3.300641, -4.031115, -2, 0, -0.5, 0.5, 0.5,
-3.300641, -4.031115, -2, 1, -0.5, 0.5, 0.5,
-3.300641, -4.031115, -2, 1, 1.5, 0.5, 0.5,
-3.300641, -4.031115, -2, 0, 1.5, 0.5, 0.5,
-3.300641, -4.031115, 0, 0, -0.5, 0.5, 0.5,
-3.300641, -4.031115, 0, 1, -0.5, 0.5, 0.5,
-3.300641, -4.031115, 0, 1, 1.5, 0.5, 0.5,
-3.300641, -4.031115, 0, 0, 1.5, 0.5, 0.5,
-3.300641, -4.031115, 2, 0, -0.5, 0.5, 0.5,
-3.300641, -4.031115, 2, 1, -0.5, 0.5, 0.5,
-3.300641, -4.031115, 2, 1, 1.5, 0.5, 0.5,
-3.300641, -4.031115, 2, 0, 1.5, 0.5, 0.5,
-3.300641, -4.031115, 4, 0, -0.5, 0.5, 0.5,
-3.300641, -4.031115, 4, 1, -0.5, 0.5, 0.5,
-3.300641, -4.031115, 4, 1, 1.5, 0.5, 0.5,
-3.300641, -4.031115, 4, 0, 1.5, 0.5, 0.5
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
-2.833978, -3.518348, -5.308753,
-2.833978, 3.318542, -5.308753,
-2.833978, -3.518348, 5.532927,
-2.833978, 3.318542, 5.532927,
-2.833978, -3.518348, -5.308753,
-2.833978, -3.518348, 5.532927,
-2.833978, 3.318542, -5.308753,
-2.833978, 3.318542, 5.532927,
-2.833978, -3.518348, -5.308753,
3.388193, -3.518348, -5.308753,
-2.833978, -3.518348, 5.532927,
3.388193, -3.518348, 5.532927,
-2.833978, 3.318542, -5.308753,
3.388193, 3.318542, -5.308753,
-2.833978, 3.318542, 5.532927,
3.388193, 3.318542, 5.532927,
3.388193, -3.518348, -5.308753,
3.388193, 3.318542, -5.308753,
3.388193, -3.518348, 5.532927,
3.388193, 3.318542, 5.532927,
3.388193, -3.518348, -5.308753,
3.388193, -3.518348, 5.532927,
3.388193, 3.318542, -5.308753,
3.388193, 3.318542, 5.532927
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
var radius = 7.608062;
var distance = 33.84912;
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
mvMatrix.translate( -0.2771076, 0.09990299, -0.1120868 );
mvMatrix.scale( 1.322044, 1.203176, 0.7587371 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.84912);
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
difenoxuron<-read.table("difenoxuron.xyz")
```

```
## Error in read.table("difenoxuron.xyz"): no lines available in input
```

```r
x<-difenoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
```

```r
y<-difenoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
```

```r
z<-difenoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
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
-2.743364, 0.5587582, -1.369968, 0, 0, 1, 1, 1,
-2.709386, -1.709681, -3.431238, 1, 0, 0, 1, 1,
-2.650758, -0.6123098, -2.067113, 1, 0, 0, 1, 1,
-2.631338, 0.9133047, -0.7172404, 1, 0, 0, 1, 1,
-2.526401, 0.2260972, -2.103014, 1, 0, 0, 1, 1,
-2.431745, -1.022632, -2.473007, 1, 0, 0, 1, 1,
-2.15018, -0.03798992, -2.521731, 0, 0, 0, 1, 1,
-2.145677, -0.7073712, -1.816622, 0, 0, 0, 1, 1,
-2.058684, -1.172941, -2.646114, 0, 0, 0, 1, 1,
-2.056139, -0.8419949, -2.598315, 0, 0, 0, 1, 1,
-2.050681, -0.7611616, -2.483448, 0, 0, 0, 1, 1,
-2.045688, -0.03732261, -0.9590871, 0, 0, 0, 1, 1,
-2.040302, 2.099845, -0.2184261, 0, 0, 0, 1, 1,
-2.01365, 1.723179, -0.0008268107, 1, 1, 1, 1, 1,
-1.967886, -0.409077, -2.182964, 1, 1, 1, 1, 1,
-1.963539, 0.981329, 0.768989, 1, 1, 1, 1, 1,
-1.952233, -0.7025822, -1.572303, 1, 1, 1, 1, 1,
-1.906123, 0.7715575, -1.079385, 1, 1, 1, 1, 1,
-1.905705, 1.00391, 0.4102326, 1, 1, 1, 1, 1,
-1.895997, 0.2052177, -1.497499, 1, 1, 1, 1, 1,
-1.879823, 0.584968, -1.891144, 1, 1, 1, 1, 1,
-1.875153, -0.3242065, -2.976878, 1, 1, 1, 1, 1,
-1.843454, 0.3098986, -1.896545, 1, 1, 1, 1, 1,
-1.842667, -0.07891317, -1.459717, 1, 1, 1, 1, 1,
-1.836063, 1.344585, -1.488527, 1, 1, 1, 1, 1,
-1.82262, 1.41769, -3.195335, 1, 1, 1, 1, 1,
-1.804878, 0.9710579, -0.1968528, 1, 1, 1, 1, 1,
-1.792886, -1.87145, -3.055347, 1, 1, 1, 1, 1,
-1.780639, -1.96893, -3.714981, 0, 0, 1, 1, 1,
-1.758253, 1.167877, 0.03720965, 1, 0, 0, 1, 1,
-1.757449, -0.1762217, -2.129392, 1, 0, 0, 1, 1,
-1.747382, 1.534578, 0.8559785, 1, 0, 0, 1, 1,
-1.733762, -0.5069054, -3.021277, 1, 0, 0, 1, 1,
-1.724828, -0.7290136, -2.125534, 1, 0, 0, 1, 1,
-1.72235, 0.1631711, -2.919212, 0, 0, 0, 1, 1,
-1.708853, 0.06294991, -1.629869, 0, 0, 0, 1, 1,
-1.707421, -0.08586554, -1.360221, 0, 0, 0, 1, 1,
-1.703255, 0.8035691, 0.5306816, 0, 0, 0, 1, 1,
-1.677061, -1.117609, -2.068882, 0, 0, 0, 1, 1,
-1.658622, 1.590295, -1.46882, 0, 0, 0, 1, 1,
-1.656404, -1.321093, -2.09751, 0, 0, 0, 1, 1,
-1.651827, -1.314418, -3.775359, 1, 1, 1, 1, 1,
-1.651019, -1.280231, -3.535226, 1, 1, 1, 1, 1,
-1.643744, -1.0688, -3.096019, 1, 1, 1, 1, 1,
-1.640738, -0.07547472, -0.3398006, 1, 1, 1, 1, 1,
-1.633439, -1.783591, -2.934363, 1, 1, 1, 1, 1,
-1.633199, -0.4734585, -2.438323, 1, 1, 1, 1, 1,
-1.629841, -0.2272558, -1.407267, 1, 1, 1, 1, 1,
-1.617842, -0.4218338, -1.109892, 1, 1, 1, 1, 1,
-1.617766, 1.436922, 0.124108, 1, 1, 1, 1, 1,
-1.616036, -1.013721, -1.830175, 1, 1, 1, 1, 1,
-1.615348, -0.9776809, -3.138204, 1, 1, 1, 1, 1,
-1.589027, -0.3453853, -0.1838221, 1, 1, 1, 1, 1,
-1.56805, 0.4877316, -1.536499, 1, 1, 1, 1, 1,
-1.521571, 0.8411897, -2.366711, 1, 1, 1, 1, 1,
-1.518655, -0.7141874, -2.00543, 1, 1, 1, 1, 1,
-1.509514, -0.07226854, 0.525269, 0, 0, 1, 1, 1,
-1.509484, 0.3998738, -0.519576, 1, 0, 0, 1, 1,
-1.508499, 1.77067, 0.2308971, 1, 0, 0, 1, 1,
-1.505533, 1.015213, -3.403465, 1, 0, 0, 1, 1,
-1.503484, -1.898544, -1.804429, 1, 0, 0, 1, 1,
-1.494715, -0.3577515, -1.792516, 1, 0, 0, 1, 1,
-1.488161, -0.2367931, -0.3183164, 0, 0, 0, 1, 1,
-1.48372, 0.6000577, -1.504512, 0, 0, 0, 1, 1,
-1.477766, 1.703386, -0.929945, 0, 0, 0, 1, 1,
-1.455534, -0.08690397, -2.45311, 0, 0, 0, 1, 1,
-1.451883, -2.129464, -3.56046, 0, 0, 0, 1, 1,
-1.44434, 0.6531983, -2.415624, 0, 0, 0, 1, 1,
-1.439106, -0.3806948, -0.9776046, 0, 0, 0, 1, 1,
-1.438559, -0.3669796, -1.220778, 1, 1, 1, 1, 1,
-1.434981, -0.6158223, -1.854392, 1, 1, 1, 1, 1,
-1.427639, 0.225492, 1.253701, 1, 1, 1, 1, 1,
-1.418182, 0.151027, -1.668406, 1, 1, 1, 1, 1,
-1.400379, 1.483082, 0.07240833, 1, 1, 1, 1, 1,
-1.399869, -0.6233225, -4.012629, 1, 1, 1, 1, 1,
-1.399762, 0.6507729, 0.1695401, 1, 1, 1, 1, 1,
-1.39937, 1.59626, -0.32251, 1, 1, 1, 1, 1,
-1.395872, -0.3945137, -2.214391, 1, 1, 1, 1, 1,
-1.381541, 1.53906, -1.858924, 1, 1, 1, 1, 1,
-1.376129, 1.709448, 0.2772987, 1, 1, 1, 1, 1,
-1.371735, 3.011307, -0.1284904, 1, 1, 1, 1, 1,
-1.371684, -0.08628499, -2.143503, 1, 1, 1, 1, 1,
-1.359648, -0.7326953, -1.824785, 1, 1, 1, 1, 1,
-1.358039, -0.7129391, -1.380371, 1, 1, 1, 1, 1,
-1.355119, -0.6505482, -4.419499, 0, 0, 1, 1, 1,
-1.344198, 0.9133559, -0.620092, 1, 0, 0, 1, 1,
-1.3389, -0.3929483, -1.292332, 1, 0, 0, 1, 1,
-1.317394, -0.07076545, -0.8384453, 1, 0, 0, 1, 1,
-1.312244, -0.01790041, -2.56093, 1, 0, 0, 1, 1,
-1.288805, -0.07282317, -2.269135, 1, 0, 0, 1, 1,
-1.267482, 1.181158, -2.171806, 0, 0, 0, 1, 1,
-1.263814, 0.898653, -1.049028, 0, 0, 0, 1, 1,
-1.262688, 0.9980636, 0.1434246, 0, 0, 0, 1, 1,
-1.261186, -1.495098, -2.68255, 0, 0, 0, 1, 1,
-1.260403, -1.209786, -2.646733, 0, 0, 0, 1, 1,
-1.25524, 0.6486291, -0.08176693, 0, 0, 0, 1, 1,
-1.254892, 0.7455233, -0.1230608, 0, 0, 0, 1, 1,
-1.254075, -0.3870864, -2.923324, 1, 1, 1, 1, 1,
-1.229635, -0.2456989, -2.364043, 1, 1, 1, 1, 1,
-1.222456, 0.7822167, -0.27469, 1, 1, 1, 1, 1,
-1.212788, -0.3072852, -3.068813, 1, 1, 1, 1, 1,
-1.20968, 0.06090403, -2.916125, 1, 1, 1, 1, 1,
-1.205283, -0.1754927, -1.311586, 1, 1, 1, 1, 1,
-1.195107, -1.252581, -1.929812, 1, 1, 1, 1, 1,
-1.190894, -0.196592, -0.7288607, 1, 1, 1, 1, 1,
-1.183036, 0.02311631, -1.855666, 1, 1, 1, 1, 1,
-1.179706, -0.6831741, -1.298676, 1, 1, 1, 1, 1,
-1.176587, 0.6469307, -2.741313, 1, 1, 1, 1, 1,
-1.174968, 0.4845959, -1.413035, 1, 1, 1, 1, 1,
-1.173383, 0.822653, -2.660541, 1, 1, 1, 1, 1,
-1.167477, 0.9169625, -0.2023406, 1, 1, 1, 1, 1,
-1.16173, 0.2895941, -2.242596, 1, 1, 1, 1, 1,
-1.155231, 0.5331725, -2.191398, 0, 0, 1, 1, 1,
-1.153921, -0.04708962, -1.499008, 1, 0, 0, 1, 1,
-1.146542, -0.6793382, -3.061153, 1, 0, 0, 1, 1,
-1.146531, 0.3320661, -1.060354, 1, 0, 0, 1, 1,
-1.140794, 0.6050261, -0.9253492, 1, 0, 0, 1, 1,
-1.136772, -0.0781927, -1.682998, 1, 0, 0, 1, 1,
-1.130817, 0.5433953, -0.1602333, 0, 0, 0, 1, 1,
-1.121523, 1.091917, 0.7803456, 0, 0, 0, 1, 1,
-1.119719, 1.198634, -0.2699916, 0, 0, 0, 1, 1,
-1.118412, 0.2767887, -2.508933, 0, 0, 0, 1, 1,
-1.110947, -0.3771047, -0.5702671, 0, 0, 0, 1, 1,
-1.107913, 0.8042305, 0.3047518, 0, 0, 0, 1, 1,
-1.104024, -1.268697, -2.056189, 0, 0, 0, 1, 1,
-1.101276, -1.049926, -2.568727, 1, 1, 1, 1, 1,
-1.097118, -0.1261373, -0.7609528, 1, 1, 1, 1, 1,
-1.0942, -1.147355, -1.498036, 1, 1, 1, 1, 1,
-1.090847, 1.239598, -0.4070785, 1, 1, 1, 1, 1,
-1.090068, -1.462533, -2.899873, 1, 1, 1, 1, 1,
-1.086859, 0.1523367, -0.9708488, 1, 1, 1, 1, 1,
-1.079141, -1.840371, -2.453906, 1, 1, 1, 1, 1,
-1.078401, -0.2894435, 0.05003167, 1, 1, 1, 1, 1,
-1.078183, -0.6093742, -2.245234, 1, 1, 1, 1, 1,
-1.068371, -1.280593, -4.278023, 1, 1, 1, 1, 1,
-1.067063, -1.524769, -2.146973, 1, 1, 1, 1, 1,
-1.061609, 0.2599822, -1.177455, 1, 1, 1, 1, 1,
-1.059208, 0.7960274, -1.109802, 1, 1, 1, 1, 1,
-1.053882, -1.482545, -2.268432, 1, 1, 1, 1, 1,
-1.04696, 0.1435632, -2.78282, 1, 1, 1, 1, 1,
-1.046527, -2.881475, -2.639556, 0, 0, 1, 1, 1,
-1.046273, 0.05927134, -2.782745, 1, 0, 0, 1, 1,
-1.042002, 0.3635337, -3.183856, 1, 0, 0, 1, 1,
-1.04047, 1.211368, -0.6557086, 1, 0, 0, 1, 1,
-1.038243, -1.054075, -1.13411, 1, 0, 0, 1, 1,
-1.029377, -1.160387, -3.886593, 1, 0, 0, 1, 1,
-1.024099, -0.9564623, -3.300117, 0, 0, 0, 1, 1,
-1.01632, 0.4147181, -0.9355667, 0, 0, 0, 1, 1,
-1.004499, -0.3484684, -3.510431, 0, 0, 0, 1, 1,
-1.004385, 1.226721, -2.18113, 0, 0, 0, 1, 1,
-1.002947, 1.885517, -3.951498, 0, 0, 0, 1, 1,
-1.002257, 0.2877647, -0.5565201, 0, 0, 0, 1, 1,
-0.9973576, 0.007923339, -1.53979, 0, 0, 0, 1, 1,
-0.9833785, -0.7620157, -2.398066, 1, 1, 1, 1, 1,
-0.9815826, 1.074678, 0.01602091, 1, 1, 1, 1, 1,
-0.9773299, -0.6565927, -2.705635, 1, 1, 1, 1, 1,
-0.9700394, -1.283819, -3.470087, 1, 1, 1, 1, 1,
-0.9694415, -0.4336252, -1.716943, 1, 1, 1, 1, 1,
-0.9676267, -2.50395, -2.737018, 1, 1, 1, 1, 1,
-0.965494, 0.9162931, -2.316361, 1, 1, 1, 1, 1,
-0.9567383, -0.9573002, -2.929175, 1, 1, 1, 1, 1,
-0.9511319, 1.025024, -0.9078114, 1, 1, 1, 1, 1,
-0.9509155, -1.280018, -3.707672, 1, 1, 1, 1, 1,
-0.9426831, -0.1094421, -2.518531, 1, 1, 1, 1, 1,
-0.9404769, -0.5264868, -1.670672, 1, 1, 1, 1, 1,
-0.9370055, 0.9062474, -1.588771, 1, 1, 1, 1, 1,
-0.9319716, 0.9990274, 0.1083466, 1, 1, 1, 1, 1,
-0.9281524, -1.773156, -2.47847, 1, 1, 1, 1, 1,
-0.9160917, 0.4872177, -1.726478, 0, 0, 1, 1, 1,
-0.9148082, -1.738557, -1.510779, 1, 0, 0, 1, 1,
-0.9122555, -1.584966, -1.414794, 1, 0, 0, 1, 1,
-0.9052952, -1.11562, -2.433491, 1, 0, 0, 1, 1,
-0.9046671, -0.2812653, -1.480878, 1, 0, 0, 1, 1,
-0.8989861, -0.2570468, -1.93179, 1, 0, 0, 1, 1,
-0.8989377, -0.899633, -5.064137, 0, 0, 0, 1, 1,
-0.8985604, 0.1527644, -1.550775, 0, 0, 0, 1, 1,
-0.8953022, -0.3685066, -0.7214425, 0, 0, 0, 1, 1,
-0.8947859, -1.666195, -2.567867, 0, 0, 0, 1, 1,
-0.8945538, -0.1241705, -2.937575, 0, 0, 0, 1, 1,
-0.8941882, -0.7047923, -1.457778, 0, 0, 0, 1, 1,
-0.8919259, 0.1469181, -0.8867218, 0, 0, 0, 1, 1,
-0.8917859, 0.08951332, -2.650687, 1, 1, 1, 1, 1,
-0.8892757, 1.729798, -0.7833925, 1, 1, 1, 1, 1,
-0.8879279, 0.1837294, -0.7866284, 1, 1, 1, 1, 1,
-0.886868, -0.7974417, 0.1733123, 1, 1, 1, 1, 1,
-0.8832076, -1.260535, 0.2618717, 1, 1, 1, 1, 1,
-0.8799387, -0.1143922, -2.323173, 1, 1, 1, 1, 1,
-0.8787728, -0.2594298, 0.0587262, 1, 1, 1, 1, 1,
-0.878335, -0.3163379, -2.489034, 1, 1, 1, 1, 1,
-0.8781968, 0.9705042, 0.724113, 1, 1, 1, 1, 1,
-0.8721112, 1.435801, 0.06027998, 1, 1, 1, 1, 1,
-0.8717852, 0.1874129, -2.203952, 1, 1, 1, 1, 1,
-0.8639461, 0.7543796, -0.03443541, 1, 1, 1, 1, 1,
-0.8623368, 0.3385863, -2.732299, 1, 1, 1, 1, 1,
-0.858898, -1.243858, -2.197875, 1, 1, 1, 1, 1,
-0.8569037, 0.4973453, -2.097301, 1, 1, 1, 1, 1,
-0.8481249, -1.264735, -2.500027, 0, 0, 1, 1, 1,
-0.844802, 0.3485396, -1.749174, 1, 0, 0, 1, 1,
-0.8420803, -0.1542368, 0.008242816, 1, 0, 0, 1, 1,
-0.8414637, 0.7689402, -2.639222, 1, 0, 0, 1, 1,
-0.8405311, -0.8301806, -1.258215, 1, 0, 0, 1, 1,
-0.8345649, 1.441239, -0.654701, 1, 0, 0, 1, 1,
-0.8313822, 0.1679472, -1.942182, 0, 0, 0, 1, 1,
-0.8283397, 1.753223, -1.423134, 0, 0, 0, 1, 1,
-0.8276895, -0.03031708, -1.225915, 0, 0, 0, 1, 1,
-0.8238119, 0.4972293, -2.924235, 0, 0, 0, 1, 1,
-0.8232583, 1.685529, -1.139358, 0, 0, 0, 1, 1,
-0.8190292, 0.8255094, -1.185687, 0, 0, 0, 1, 1,
-0.8161348, 2.077529, -0.5493566, 0, 0, 0, 1, 1,
-0.8132468, 0.7333878, -1.824794, 1, 1, 1, 1, 1,
-0.8086522, 0.2517175, -1.155015, 1, 1, 1, 1, 1,
-0.8085601, 1.164533, 2.488531, 1, 1, 1, 1, 1,
-0.8073605, -0.8302444, -2.226947, 1, 1, 1, 1, 1,
-0.8050841, 0.9957238, 0.1922593, 1, 1, 1, 1, 1,
-0.8048677, 0.7235962, -0.7425479, 1, 1, 1, 1, 1,
-0.7968249, -0.2348389, -3.530277, 1, 1, 1, 1, 1,
-0.7906886, -0.8841779, -0.7543531, 1, 1, 1, 1, 1,
-0.7897634, 0.1188304, -1.08192, 1, 1, 1, 1, 1,
-0.7795323, -0.6198895, -3.034092, 1, 1, 1, 1, 1,
-0.7751166, -1.101098, -1.994472, 1, 1, 1, 1, 1,
-0.7728841, -0.01267725, -3.165432, 1, 1, 1, 1, 1,
-0.7668114, 0.8121216, -1.394907, 1, 1, 1, 1, 1,
-0.7593499, -0.6423879, -2.125337, 1, 1, 1, 1, 1,
-0.7585993, -1.002536, -1.667928, 1, 1, 1, 1, 1,
-0.7545136, -0.4307885, -1.506474, 0, 0, 1, 1, 1,
-0.7530471, 0.3883734, -0.8782578, 1, 0, 0, 1, 1,
-0.7508186, 0.8125728, 0.9382958, 1, 0, 0, 1, 1,
-0.7504883, -0.4124062, -2.701963, 1, 0, 0, 1, 1,
-0.748697, 1.225618, -1.667285, 1, 0, 0, 1, 1,
-0.7468624, 0.432712, -1.345877, 1, 0, 0, 1, 1,
-0.7450198, -1.613659, -3.459229, 0, 0, 0, 1, 1,
-0.7422872, -0.2901306, -1.133242, 0, 0, 0, 1, 1,
-0.7418959, 0.6037022, -0.04721371, 0, 0, 0, 1, 1,
-0.7328641, 0.2198364, -0.1535751, 0, 0, 0, 1, 1,
-0.7326199, 1.192133, 0.1665288, 0, 0, 0, 1, 1,
-0.731643, -1.495967, -1.164499, 0, 0, 0, 1, 1,
-0.7306726, -0.3301874, -2.336508, 0, 0, 0, 1, 1,
-0.7275715, 0.7667578, -0.5974537, 1, 1, 1, 1, 1,
-0.7260818, -0.7387459, -4.160183, 1, 1, 1, 1, 1,
-0.7255272, 0.1665229, -0.3919278, 1, 1, 1, 1, 1,
-0.7228326, -0.3887646, -1.059951, 1, 1, 1, 1, 1,
-0.720777, -1.385289, -3.434599, 1, 1, 1, 1, 1,
-0.7189289, 1.086107, 1.920919, 1, 1, 1, 1, 1,
-0.7154689, 0.009316405, -2.401413, 1, 1, 1, 1, 1,
-0.7123188, 0.01668083, -2.774787, 1, 1, 1, 1, 1,
-0.712275, -0.6595327, -3.363889, 1, 1, 1, 1, 1,
-0.7074728, 0.1203256, -0.9648769, 1, 1, 1, 1, 1,
-0.7037423, -0.61685, -2.149938, 1, 1, 1, 1, 1,
-0.7018884, -2.498063, -3.625318, 1, 1, 1, 1, 1,
-0.696949, 1.595813, -1.700123, 1, 1, 1, 1, 1,
-0.6934341, 0.7326784, -0.9588192, 1, 1, 1, 1, 1,
-0.6912769, -0.427147, -2.834207, 1, 1, 1, 1, 1,
-0.686452, -0.1931829, -1.216715, 0, 0, 1, 1, 1,
-0.6861745, 0.3677376, -0.8346307, 1, 0, 0, 1, 1,
-0.6817862, -1.017555, -2.975789, 1, 0, 0, 1, 1,
-0.6815534, -1.00255, -3.378417, 1, 0, 0, 1, 1,
-0.6749684, 1.454618, -1.231804, 1, 0, 0, 1, 1,
-0.6670362, 1.187455, -1.949499, 1, 0, 0, 1, 1,
-0.6656105, 0.5838757, 1.454458, 0, 0, 0, 1, 1,
-0.6609775, 0.5004819, -2.257405, 0, 0, 0, 1, 1,
-0.6538011, -2.076842, -2.499715, 0, 0, 0, 1, 1,
-0.652949, -0.6004792, -2.624522, 0, 0, 0, 1, 1,
-0.6482701, -1.046084, -3.097935, 0, 0, 0, 1, 1,
-0.6438159, 0.7860754, -0.3256751, 0, 0, 0, 1, 1,
-0.6434791, -0.4708638, -1.177589, 0, 0, 0, 1, 1,
-0.632786, -1.070573, -3.669281, 1, 1, 1, 1, 1,
-0.6293738, 0.1155643, -0.4838172, 1, 1, 1, 1, 1,
-0.624736, -0.9311081, -3.397828, 1, 1, 1, 1, 1,
-0.6233174, 0.005256761, -1.234498, 1, 1, 1, 1, 1,
-0.6193281, -0.2135413, -0.996234, 1, 1, 1, 1, 1,
-0.6189607, 0.03056118, -1.07552, 1, 1, 1, 1, 1,
-0.618798, 0.833212, -0.3614956, 1, 1, 1, 1, 1,
-0.618343, -0.5324527, -2.923891, 1, 1, 1, 1, 1,
-0.614971, -0.03523618, -1.073733, 1, 1, 1, 1, 1,
-0.6097959, 0.6011981, -0.3601727, 1, 1, 1, 1, 1,
-0.5980172, -1.911729, -1.784338, 1, 1, 1, 1, 1,
-0.595429, -0.1588166, -1.55295, 1, 1, 1, 1, 1,
-0.592802, 0.2117976, -0.5682728, 1, 1, 1, 1, 1,
-0.5924394, -0.9629056, -1.020299, 1, 1, 1, 1, 1,
-0.5916115, 1.059158, -1.269548, 1, 1, 1, 1, 1,
-0.5827073, -0.9842513, -2.05031, 0, 0, 1, 1, 1,
-0.5691557, -0.4839545, -3.273208, 1, 0, 0, 1, 1,
-0.5617116, 0.2851472, -0.1552676, 1, 0, 0, 1, 1,
-0.5604708, -1.255042, -2.23272, 1, 0, 0, 1, 1,
-0.5576012, -0.8109005, -2.099329, 1, 0, 0, 1, 1,
-0.5567924, -1.02433, -2.302431, 1, 0, 0, 1, 1,
-0.5565462, 1.466273, -0.4051101, 0, 0, 0, 1, 1,
-0.5499163, -0.1161641, -1.880847, 0, 0, 0, 1, 1,
-0.5442019, -1.849166, -2.26441, 0, 0, 0, 1, 1,
-0.54301, -0.2642986, -2.168044, 0, 0, 0, 1, 1,
-0.5417129, 1.758257, -1.898762, 0, 0, 0, 1, 1,
-0.5406681, 0.1764826, -2.257555, 0, 0, 0, 1, 1,
-0.5315247, -0.6640309, -3.328057, 0, 0, 0, 1, 1,
-0.5299289, -1.039881, -3.52015, 1, 1, 1, 1, 1,
-0.5244438, 0.04039776, -1.394725, 1, 1, 1, 1, 1,
-0.5186909, 1.476913, -1.209081, 1, 1, 1, 1, 1,
-0.5138191, -0.7499934, -3.391959, 1, 1, 1, 1, 1,
-0.5127782, 1.174524, 1.130945, 1, 1, 1, 1, 1,
-0.506767, 0.4146062, 0.3639561, 1, 1, 1, 1, 1,
-0.5066084, -0.2945048, -1.259288, 1, 1, 1, 1, 1,
-0.5064386, -0.4490556, -1.891528, 1, 1, 1, 1, 1,
-0.5044835, 2.041204, -0.1483714, 1, 1, 1, 1, 1,
-0.5027815, 0.7498719, -0.8677311, 1, 1, 1, 1, 1,
-0.500297, 1.695117, -0.5814956, 1, 1, 1, 1, 1,
-0.4990297, -0.2809072, -0.6073392, 1, 1, 1, 1, 1,
-0.497508, 1.597101, -0.1456369, 1, 1, 1, 1, 1,
-0.4914365, 2.39015, -1.887688, 1, 1, 1, 1, 1,
-0.4908292, -0.1197914, -1.637408, 1, 1, 1, 1, 1,
-0.4899834, 0.5142511, -1.438745, 0, 0, 1, 1, 1,
-0.474516, -0.6669573, -2.697412, 1, 0, 0, 1, 1,
-0.4704786, -1.088331, -3.947122, 1, 0, 0, 1, 1,
-0.4657827, 0.1038355, -2.429127, 1, 0, 0, 1, 1,
-0.4643285, -0.1172331, -1.455027, 1, 0, 0, 1, 1,
-0.4566361, 0.3330973, -1.713404, 1, 0, 0, 1, 1,
-0.4547303, -0.7934738, -2.848487, 0, 0, 0, 1, 1,
-0.4547019, -1.560933, -3.679733, 0, 0, 0, 1, 1,
-0.4530813, 0.2317016, -1.449419, 0, 0, 0, 1, 1,
-0.4521034, 1.919989, 0.9732249, 0, 0, 0, 1, 1,
-0.4504678, 1.229677, -1.945013, 0, 0, 0, 1, 1,
-0.4484998, 0.2974862, -3.937296, 0, 0, 0, 1, 1,
-0.4448444, 1.023558, -1.73823, 0, 0, 0, 1, 1,
-0.4427657, -0.8451528, -2.12259, 1, 1, 1, 1, 1,
-0.4420509, 1.383233, 1.027832, 1, 1, 1, 1, 1,
-0.4415883, -0.5716001, -1.109149, 1, 1, 1, 1, 1,
-0.4378961, 0.974521, -2.103414, 1, 1, 1, 1, 1,
-0.4368576, 1.655496, 1.251861, 1, 1, 1, 1, 1,
-0.4302466, -0.4595596, -1.596637, 1, 1, 1, 1, 1,
-0.4195431, -0.1511554, -2.110348, 1, 1, 1, 1, 1,
-0.4164413, -1.427159, -3.950692, 1, 1, 1, 1, 1,
-0.4158273, -1.242401, -2.179523, 1, 1, 1, 1, 1,
-0.413445, 1.58668, -0.3779507, 1, 1, 1, 1, 1,
-0.4101954, 0.02180361, -1.555975, 1, 1, 1, 1, 1,
-0.409658, -0.8409848, -4.734671, 1, 1, 1, 1, 1,
-0.4042524, -1.583575, -2.303957, 1, 1, 1, 1, 1,
-0.4038334, 1.384066, -0.4329309, 1, 1, 1, 1, 1,
-0.3992119, -0.003699304, -0.6921542, 1, 1, 1, 1, 1,
-0.3990898, 1.014385, -1.717303, 0, 0, 1, 1, 1,
-0.398216, -0.5692058, -2.642136, 1, 0, 0, 1, 1,
-0.3958898, 0.02331092, 0.9422358, 1, 0, 0, 1, 1,
-0.3945474, -0.5916291, -2.091353, 1, 0, 0, 1, 1,
-0.3901682, 0.1586743, -0.6698599, 1, 0, 0, 1, 1,
-0.3879627, -0.5057428, -2.692993, 1, 0, 0, 1, 1,
-0.3876843, 0.1633631, -1.05209, 0, 0, 0, 1, 1,
-0.3836691, -0.6988828, -2.197223, 0, 0, 0, 1, 1,
-0.3815249, -1.264624, -3.563051, 0, 0, 0, 1, 1,
-0.3800585, -0.4874658, -2.611475, 0, 0, 0, 1, 1,
-0.3696791, -0.5804445, -4.241475, 0, 0, 0, 1, 1,
-0.3688427, 0.6165624, 0.6514154, 0, 0, 0, 1, 1,
-0.3679141, -0.5460603, -2.828495, 0, 0, 0, 1, 1,
-0.3665961, -0.9881793, -3.190099, 1, 1, 1, 1, 1,
-0.3567711, 0.6236706, 0.9633073, 1, 1, 1, 1, 1,
-0.3527829, -0.8431248, -3.33739, 1, 1, 1, 1, 1,
-0.3519975, -0.09377437, -0.910173, 1, 1, 1, 1, 1,
-0.3485552, 0.7736541, -0.8366952, 1, 1, 1, 1, 1,
-0.34751, -0.9908007, -2.532406, 1, 1, 1, 1, 1,
-0.3458761, -0.04237207, 0.1147368, 1, 1, 1, 1, 1,
-0.3457359, -0.9661788, -3.890329, 1, 1, 1, 1, 1,
-0.3383812, -0.6690084, -2.962196, 1, 1, 1, 1, 1,
-0.334362, 0.8674666, -0.7716141, 1, 1, 1, 1, 1,
-0.3330433, -0.2782984, -2.732688, 1, 1, 1, 1, 1,
-0.3317426, 1.116885, 0.416224, 1, 1, 1, 1, 1,
-0.3309441, 0.2280498, 0.5417403, 1, 1, 1, 1, 1,
-0.3304133, 0.6068024, -0.3503724, 1, 1, 1, 1, 1,
-0.3247051, -1.12157, -2.792839, 1, 1, 1, 1, 1,
-0.3224593, -1.677166, -2.840667, 0, 0, 1, 1, 1,
-0.3220785, -0.1765336, -0.3350523, 1, 0, 0, 1, 1,
-0.3161031, 0.3637653, 0.07184581, 1, 0, 0, 1, 1,
-0.3130583, 1.282859, 0.831948, 1, 0, 0, 1, 1,
-0.3106576, 2.499422, 0.1763851, 1, 0, 0, 1, 1,
-0.3097576, -0.8847498, -3.579174, 1, 0, 0, 1, 1,
-0.304574, -0.4377001, -1.437685, 0, 0, 0, 1, 1,
-0.3043756, -0.3090273, -0.7464644, 0, 0, 0, 1, 1,
-0.297419, -0.4702141, -2.462763, 0, 0, 0, 1, 1,
-0.2928486, 1.011411, -1.282065, 0, 0, 0, 1, 1,
-0.2902139, -0.2709825, -2.705806, 0, 0, 0, 1, 1,
-0.2871194, -0.5966101, -2.927852, 0, 0, 0, 1, 1,
-0.2754044, -0.07847422, -1.76594, 0, 0, 0, 1, 1,
-0.2744324, -0.269122, -2.467489, 1, 1, 1, 1, 1,
-0.2700981, 0.8793271, -0.4879987, 1, 1, 1, 1, 1,
-0.2698191, -0.3320944, -1.832229, 1, 1, 1, 1, 1,
-0.2680996, -0.297973, -2.633156, 1, 1, 1, 1, 1,
-0.2615615, -0.4219241, -1.24512, 1, 1, 1, 1, 1,
-0.2576291, -0.1495319, -2.911809, 1, 1, 1, 1, 1,
-0.2551872, 0.1530253, -2.181105, 1, 1, 1, 1, 1,
-0.253327, -2.091303, -3.178774, 1, 1, 1, 1, 1,
-0.2528425, -0.6753658, -2.391708, 1, 1, 1, 1, 1,
-0.2513195, -0.8306183, -5.150865, 1, 1, 1, 1, 1,
-0.2489471, 0.3346875, -1.584653, 1, 1, 1, 1, 1,
-0.2420405, 0.5221382, 0.6200058, 1, 1, 1, 1, 1,
-0.2318114, -0.7713632, -3.055244, 1, 1, 1, 1, 1,
-0.2241194, 0.2161451, -2.120124, 1, 1, 1, 1, 1,
-0.2233733, 1.384576, -0.936201, 1, 1, 1, 1, 1,
-0.2209998, -0.8276914, -3.324082, 0, 0, 1, 1, 1,
-0.2207858, -1.04816, -3.758502, 1, 0, 0, 1, 1,
-0.2197442, 0.3056339, 0.5828898, 1, 0, 0, 1, 1,
-0.2177273, -1.878361, -2.841478, 1, 0, 0, 1, 1,
-0.2169814, 1.307104, 1.787836, 1, 0, 0, 1, 1,
-0.2132541, 0.2931308, 1.210606, 1, 0, 0, 1, 1,
-0.2122905, -0.2130532, -0.929911, 0, 0, 0, 1, 1,
-0.2107798, 0.6757329, 0.5090338, 0, 0, 0, 1, 1,
-0.2070221, -0.03540641, -3.354989, 0, 0, 0, 1, 1,
-0.2000886, 1.151859, -1.453638, 0, 0, 0, 1, 1,
-0.1983189, 1.06151, 0.9217578, 0, 0, 0, 1, 1,
-0.194139, 0.09910391, -0.6678312, 0, 0, 0, 1, 1,
-0.1904514, 0.6685814, -1.900085, 0, 0, 0, 1, 1,
-0.1892672, -1.218033, -2.898803, 1, 1, 1, 1, 1,
-0.1880588, -0.7390471, -2.155385, 1, 1, 1, 1, 1,
-0.1864672, 0.9801577, -0.5918472, 1, 1, 1, 1, 1,
-0.1855004, 0.09835541, -1.032123, 1, 1, 1, 1, 1,
-0.1826337, 2.072474, -1.09059, 1, 1, 1, 1, 1,
-0.1802668, 0.8248557, 0.4722915, 1, 1, 1, 1, 1,
-0.1796858, 0.2764993, -1.942951, 1, 1, 1, 1, 1,
-0.1786518, -0.9850933, -1.716215, 1, 1, 1, 1, 1,
-0.1622025, -0.3161084, -2.53655, 1, 1, 1, 1, 1,
-0.1592764, -0.9828864, -3.157709, 1, 1, 1, 1, 1,
-0.1575704, 0.7437603, -1.19372, 1, 1, 1, 1, 1,
-0.157377, 0.5835007, -2.515366, 1, 1, 1, 1, 1,
-0.1561215, 1.392566, -0.4884646, 1, 1, 1, 1, 1,
-0.1559493, -0.004849007, -3.738134, 1, 1, 1, 1, 1,
-0.1545126, 0.8460445, 0.7797784, 1, 1, 1, 1, 1,
-0.1527328, 1.350621, 0.5034891, 0, 0, 1, 1, 1,
-0.1504039, 0.7712057, 0.1619374, 1, 0, 0, 1, 1,
-0.1499053, 0.6643, 0.3604886, 1, 0, 0, 1, 1,
-0.1468713, 1.154661, 1.198333, 1, 0, 0, 1, 1,
-0.1419409, -1.489542, -3.928652, 1, 0, 0, 1, 1,
-0.1398352, 1.357933, -0.5023776, 1, 0, 0, 1, 1,
-0.1391971, -0.1300973, -2.845834, 0, 0, 0, 1, 1,
-0.1391165, 1.440085, -0.7088767, 0, 0, 0, 1, 1,
-0.1370319, 1.161696, -1.142483, 0, 0, 0, 1, 1,
-0.1349248, -0.3313879, -3.583256, 0, 0, 0, 1, 1,
-0.1314108, 0.1027255, -0.02920885, 0, 0, 0, 1, 1,
-0.1310407, -0.5061249, -2.266733, 0, 0, 0, 1, 1,
-0.1269342, 1.109847, -1.803434, 0, 0, 0, 1, 1,
-0.1257631, 0.1641115, -2.350148, 1, 1, 1, 1, 1,
-0.1206815, -0.236229, -2.345844, 1, 1, 1, 1, 1,
-0.1182343, 0.7295798, -1.252482, 1, 1, 1, 1, 1,
-0.1085032, 0.772818, -1.806662, 1, 1, 1, 1, 1,
-0.1040014, -0.7745211, -3.412615, 1, 1, 1, 1, 1,
-0.1012315, -1.508703, -4.572816, 1, 1, 1, 1, 1,
-0.09915359, -0.4721521, -2.584892, 1, 1, 1, 1, 1,
-0.09390248, -0.2002345, -3.933947, 1, 1, 1, 1, 1,
-0.09209485, -1.306527, -3.964405, 1, 1, 1, 1, 1,
-0.09057153, -1.671632, -2.495009, 1, 1, 1, 1, 1,
-0.08581495, -0.04427583, -1.858059, 1, 1, 1, 1, 1,
-0.08041729, 0.461558, -1.839034, 1, 1, 1, 1, 1,
-0.07561755, 0.4954847, -2.383095, 1, 1, 1, 1, 1,
-0.0751747, 1.57313, 1.1034, 1, 1, 1, 1, 1,
-0.07398579, -0.5680532, -3.978981, 1, 1, 1, 1, 1,
-0.07379016, -1.007183, -3.224554, 0, 0, 1, 1, 1,
-0.06995758, -0.7020296, -2.618655, 1, 0, 0, 1, 1,
-0.06865604, -1.198442, -2.525565, 1, 0, 0, 1, 1,
-0.06717596, 1.365931, -1.031195, 1, 0, 0, 1, 1,
-0.06675072, -1.318489, -2.814126, 1, 0, 0, 1, 1,
-0.06493363, -2.088775, -2.724353, 1, 0, 0, 1, 1,
-0.06484979, -0.1159026, -5.088832, 0, 0, 0, 1, 1,
-0.06300048, -0.7399154, -2.100614, 0, 0, 0, 1, 1,
-0.05765789, -1.157391, -4.141387, 0, 0, 0, 1, 1,
-0.05630333, -0.03181968, -2.406507, 0, 0, 0, 1, 1,
-0.0487183, 0.7491228, 1.074682, 0, 0, 0, 1, 1,
-0.04838555, 1.012983, 0.2756366, 0, 0, 0, 1, 1,
-0.0468061, 0.3512112, -1.399036, 0, 0, 0, 1, 1,
-0.04458197, 1.169947, -0.5722657, 1, 1, 1, 1, 1,
-0.04115441, 1.410319, 2.013259, 1, 1, 1, 1, 1,
-0.04114576, -0.8675371, -4.26611, 1, 1, 1, 1, 1,
-0.03606458, -1.040915, -2.772255, 1, 1, 1, 1, 1,
-0.03464226, 0.7531489, 0.5448818, 1, 1, 1, 1, 1,
-0.03053915, -0.3935026, -2.822764, 1, 1, 1, 1, 1,
-0.02615308, -2.345244, -1.775087, 1, 1, 1, 1, 1,
-0.02479039, 0.8944067, -0.9447075, 1, 1, 1, 1, 1,
-0.02126462, -0.6394058, -4.870435, 1, 1, 1, 1, 1,
-0.01994034, 1.033831, -0.3539879, 1, 1, 1, 1, 1,
-0.01967691, -0.632494, -2.214612, 1, 1, 1, 1, 1,
-0.01926637, 0.2974489, -0.4284798, 1, 1, 1, 1, 1,
-0.01918632, 0.2939154, -0.05408673, 1, 1, 1, 1, 1,
-0.01859549, 0.1866542, -0.4224108, 1, 1, 1, 1, 1,
-0.0174938, 0.6681468, 0.2507505, 1, 1, 1, 1, 1,
-0.0148632, 1.095117, -1.275149, 0, 0, 1, 1, 1,
-0.01473977, 0.1411828, -0.1683587, 1, 0, 0, 1, 1,
-0.01249469, -0.5627161, -3.644971, 1, 0, 0, 1, 1,
-0.006115482, -0.3499372, -2.691355, 1, 0, 0, 1, 1,
-0.0009670675, 0.08783108, -0.8854792, 1, 0, 0, 1, 1,
-9.362803e-05, -0.2930556, -2.71196, 1, 0, 0, 1, 1,
0.005057614, 0.2220479, 0.8910429, 0, 0, 0, 1, 1,
0.006022343, 1.054098, 0.1779491, 0, 0, 0, 1, 1,
0.00838275, -2.508969, 4.459454, 0, 0, 0, 1, 1,
0.01136224, -0.7391623, 1.972791, 0, 0, 0, 1, 1,
0.01180451, -1.029031, 2.901613, 0, 0, 0, 1, 1,
0.01559146, -0.3208679, 2.515642, 0, 0, 0, 1, 1,
0.01583853, -0.8915598, 1.419772, 0, 0, 0, 1, 1,
0.01599892, 0.2575682, 1.469456, 1, 1, 1, 1, 1,
0.01642901, 0.5878358, 0.6927631, 1, 1, 1, 1, 1,
0.01819489, -0.1946435, 3.330941, 1, 1, 1, 1, 1,
0.02305085, 0.02570301, -0.669664, 1, 1, 1, 1, 1,
0.02495375, 2.034634, -0.2278651, 1, 1, 1, 1, 1,
0.02591767, 1.840856, 0.06365537, 1, 1, 1, 1, 1,
0.03138146, -0.943484, 3.608227, 1, 1, 1, 1, 1,
0.03139218, -0.2673779, 1.664552, 1, 1, 1, 1, 1,
0.03283362, -0.02570406, 1.53349, 1, 1, 1, 1, 1,
0.03336475, -1.027173, 2.895784, 1, 1, 1, 1, 1,
0.03593901, 1.778959, -3.24982, 1, 1, 1, 1, 1,
0.03594512, -0.3825252, 2.586831, 1, 1, 1, 1, 1,
0.03605141, 0.9570963, 2.509769, 1, 1, 1, 1, 1,
0.03670415, 0.5585681, 0.278125, 1, 1, 1, 1, 1,
0.04742635, -0.04287175, 2.137717, 1, 1, 1, 1, 1,
0.04879484, 0.6152616, 0.285694, 0, 0, 1, 1, 1,
0.05071649, 0.2927421, -1.400294, 1, 0, 0, 1, 1,
0.06241622, -0.987112, 4.278536, 1, 0, 0, 1, 1,
0.06870323, -0.05310251, 3.082601, 1, 0, 0, 1, 1,
0.07001781, -0.1328148, 2.041207, 1, 0, 0, 1, 1,
0.07584581, 0.4598611, -1.811505, 1, 0, 0, 1, 1,
0.0767502, 0.1119488, 0.5919702, 0, 0, 0, 1, 1,
0.07816918, 0.534568, -0.2952809, 0, 0, 0, 1, 1,
0.07892174, -1.148049, 3.649551, 0, 0, 0, 1, 1,
0.07929944, -1.535661, 3.949064, 0, 0, 0, 1, 1,
0.08000331, 1.125872, 1.066397, 0, 0, 0, 1, 1,
0.101873, 1.114347, 0.8115056, 0, 0, 0, 1, 1,
0.102405, -0.7710051, 1.500004, 0, 0, 0, 1, 1,
0.1078639, -1.776537, 3.70243, 1, 1, 1, 1, 1,
0.1088323, 1.40227, 0.5896968, 1, 1, 1, 1, 1,
0.1135891, -0.4620711, 4.296865, 1, 1, 1, 1, 1,
0.1152255, 2.02535, 0.01804251, 1, 1, 1, 1, 1,
0.1181509, -0.2288198, 2.456683, 1, 1, 1, 1, 1,
0.1216121, 1.076621, -0.0001700742, 1, 1, 1, 1, 1,
0.1265924, -0.4656606, 2.768517, 1, 1, 1, 1, 1,
0.1302234, 0.1095057, 1.183102, 1, 1, 1, 1, 1,
0.1345429, -0.2420038, 3.383081, 1, 1, 1, 1, 1,
0.1358716, 0.8676661, 0.7370815, 1, 1, 1, 1, 1,
0.1408205, -0.6185349, 2.613986, 1, 1, 1, 1, 1,
0.144315, 0.604545, -0.6135489, 1, 1, 1, 1, 1,
0.1446991, 0.5361078, 0.7620591, 1, 1, 1, 1, 1,
0.1448801, 0.3043509, -0.3969709, 1, 1, 1, 1, 1,
0.1463684, 0.7017825, -0.7116808, 1, 1, 1, 1, 1,
0.1465808, 0.8191468, -0.1710075, 0, 0, 1, 1, 1,
0.1533202, -0.9907932, 4.425279, 1, 0, 0, 1, 1,
0.1562612, 0.4771064, 0.2493345, 1, 0, 0, 1, 1,
0.1584298, -0.6037832, 1.959693, 1, 0, 0, 1, 1,
0.1596566, -0.1476015, 1.10248, 1, 0, 0, 1, 1,
0.1623111, -1.070197, 2.353867, 1, 0, 0, 1, 1,
0.1633147, -0.2093528, 2.833251, 0, 0, 0, 1, 1,
0.1656287, 0.6825935, -0.4866638, 0, 0, 0, 1, 1,
0.1666791, -0.3783341, 2.790167, 0, 0, 0, 1, 1,
0.167788, -1.687101, 2.061475, 0, 0, 0, 1, 1,
0.1682691, 0.1072155, 1.89864, 0, 0, 0, 1, 1,
0.1702948, 0.6854615, -0.1925199, 0, 0, 0, 1, 1,
0.1730657, -0.5645679, 3.1325, 0, 0, 0, 1, 1,
0.1748283, 2.152577, 1.489468, 1, 1, 1, 1, 1,
0.175378, 1.845366, -1.381751, 1, 1, 1, 1, 1,
0.1764771, -1.048, 3.060035, 1, 1, 1, 1, 1,
0.1775777, 0.6849006, 0.3662876, 1, 1, 1, 1, 1,
0.1776903, 0.5751449, 0.9952273, 1, 1, 1, 1, 1,
0.1837469, -0.3356847, 4.188478, 1, 1, 1, 1, 1,
0.1863382, -3.149028, 3.429816, 1, 1, 1, 1, 1,
0.1864244, -0.224552, 2.04807, 1, 1, 1, 1, 1,
0.1895078, 1.417193, 2.02069, 1, 1, 1, 1, 1,
0.1898941, -0.2763287, 5.375039, 1, 1, 1, 1, 1,
0.1916375, -1.861387, 3.14873, 1, 1, 1, 1, 1,
0.1919691, -0.999747, 2.971977, 1, 1, 1, 1, 1,
0.1945217, -0.5133694, 1.879454, 1, 1, 1, 1, 1,
0.1967935, 0.4086575, -0.383839, 1, 1, 1, 1, 1,
0.1975109, -0.3231257, 2.612138, 1, 1, 1, 1, 1,
0.1983184, -0.4808103, 2.155755, 0, 0, 1, 1, 1,
0.1995844, -0.6866179, 1.569879, 1, 0, 0, 1, 1,
0.2006217, -0.5098929, 2.174252, 1, 0, 0, 1, 1,
0.2009757, -0.3862562, 3.714922, 1, 0, 0, 1, 1,
0.2011012, 0.7793193, -2.042306, 1, 0, 0, 1, 1,
0.2134902, 1.001312, -0.3896858, 1, 0, 0, 1, 1,
0.2151013, -0.9090267, 4.40189, 0, 0, 0, 1, 1,
0.2222326, 0.6644351, 0.05583811, 0, 0, 0, 1, 1,
0.2225565, -0.1004386, 3.715839, 0, 0, 0, 1, 1,
0.2271354, 2.814967, 1.572576, 0, 0, 0, 1, 1,
0.2278661, 1.507964, 1.108051, 0, 0, 0, 1, 1,
0.2307783, -0.9615615, 3.742289, 0, 0, 0, 1, 1,
0.2366206, -0.5655829, 4.720937, 0, 0, 0, 1, 1,
0.2462609, -0.08860771, 4.015329, 1, 1, 1, 1, 1,
0.2489232, 2.049646, -1.474718, 1, 1, 1, 1, 1,
0.2498253, -3.070133, 1.94502, 1, 1, 1, 1, 1,
0.2531617, -1.097873, 3.512331, 1, 1, 1, 1, 1,
0.2534277, 0.1146025, 1.562525, 1, 1, 1, 1, 1,
0.2606366, 0.7949661, -0.2130169, 1, 1, 1, 1, 1,
0.2628401, -1.77849, 1.104579, 1, 1, 1, 1, 1,
0.2640509, 0.7153348, 1.762324, 1, 1, 1, 1, 1,
0.2666328, 1.983055, 1.440457, 1, 1, 1, 1, 1,
0.2780315, -0.8510971, 2.465651, 1, 1, 1, 1, 1,
0.2809861, 0.2832132, 2.28976, 1, 1, 1, 1, 1,
0.2830878, 0.9321853, -0.8524672, 1, 1, 1, 1, 1,
0.2865328, 0.6936877, -0.5213734, 1, 1, 1, 1, 1,
0.2963918, 0.6990867, 0.7256554, 1, 1, 1, 1, 1,
0.2972112, -1.050489, 3.308482, 1, 1, 1, 1, 1,
0.297219, 0.2085294, -0.8391742, 0, 0, 1, 1, 1,
0.2990637, 1.044133, -1.374707, 1, 0, 0, 1, 1,
0.3003611, 0.7713637, -1.846251, 1, 0, 0, 1, 1,
0.3006332, -0.8765604, 2.928547, 1, 0, 0, 1, 1,
0.3053353, 3.218976, -0.01535625, 1, 0, 0, 1, 1,
0.3073423, -0.07736045, 1.088869, 1, 0, 0, 1, 1,
0.3097976, 1.060667, 1.605568, 0, 0, 0, 1, 1,
0.312757, 0.2256187, 1.504378, 0, 0, 0, 1, 1,
0.3162365, -1.122565, 1.639555, 0, 0, 0, 1, 1,
0.3203595, 1.010559, 0.8441014, 0, 0, 0, 1, 1,
0.3226689, 0.2414957, -0.3811583, 0, 0, 0, 1, 1,
0.3277803, 0.3415926, 2.207386, 0, 0, 0, 1, 1,
0.3283271, 1.425738, -0.3965774, 0, 0, 0, 1, 1,
0.3298408, -0.4104899, 3.284883, 1, 1, 1, 1, 1,
0.3309256, 1.391127, 0.9344172, 1, 1, 1, 1, 1,
0.3314693, -0.164424, 2.718657, 1, 1, 1, 1, 1,
0.3367726, 0.157656, 0.6343906, 1, 1, 1, 1, 1,
0.3371056, -0.9446588, 3.579826, 1, 1, 1, 1, 1,
0.347036, -0.7616988, 2.301134, 1, 1, 1, 1, 1,
0.3475423, -0.008790223, 2.028298, 1, 1, 1, 1, 1,
0.3479261, 0.4156016, 2.605008, 1, 1, 1, 1, 1,
0.3486882, 0.09221643, 0.7948912, 1, 1, 1, 1, 1,
0.3492275, 0.5050542, -0.2689853, 1, 1, 1, 1, 1,
0.3507878, 0.5143149, -0.3675666, 1, 1, 1, 1, 1,
0.3512347, -0.244134, 2.353705, 1, 1, 1, 1, 1,
0.3517909, -0.183667, 2.956093, 1, 1, 1, 1, 1,
0.3518789, -0.3372236, 1.957605, 1, 1, 1, 1, 1,
0.3545824, 0.6673442, -1.215913, 1, 1, 1, 1, 1,
0.3575679, 0.6423929, -0.7994847, 0, 0, 1, 1, 1,
0.3649161, 1.225833, -0.2182378, 1, 0, 0, 1, 1,
0.3660751, 1.391757, 0.1478941, 1, 0, 0, 1, 1,
0.3745357, 1.734181, -0.4777485, 1, 0, 0, 1, 1,
0.3749509, 0.5612879, 2.202842, 1, 0, 0, 1, 1,
0.375893, 0.4568696, 0.8806678, 1, 0, 0, 1, 1,
0.3762804, -0.4512095, 3.14891, 0, 0, 0, 1, 1,
0.3786819, 1.608197, 0.3321407, 0, 0, 0, 1, 1,
0.3790135, 0.8346397, 0.03641221, 0, 0, 0, 1, 1,
0.381966, 1.084845, 2.429406, 0, 0, 0, 1, 1,
0.3846472, -1.395795, 2.849729, 0, 0, 0, 1, 1,
0.3883576, -0.1353046, 0.4004553, 0, 0, 0, 1, 1,
0.3914902, -0.6449619, 2.099745, 0, 0, 0, 1, 1,
0.3927727, -0.8310868, 3.572345, 1, 1, 1, 1, 1,
0.3948336, 1.485347, -0.1542319, 1, 1, 1, 1, 1,
0.3979131, -0.6675769, 3.575943, 1, 1, 1, 1, 1,
0.4002976, -0.7724378, 3.075519, 1, 1, 1, 1, 1,
0.4004515, -0.5037024, 4.034986, 1, 1, 1, 1, 1,
0.4014124, 0.4145708, 0.06360672, 1, 1, 1, 1, 1,
0.4022002, -2.567913, 3.371443, 1, 1, 1, 1, 1,
0.4099022, -0.2970039, 3.479826, 1, 1, 1, 1, 1,
0.4141443, 1.16317, -0.954312, 1, 1, 1, 1, 1,
0.4153901, -2.098592, 2.635663, 1, 1, 1, 1, 1,
0.4181673, 0.5935352, 2.17451, 1, 1, 1, 1, 1,
0.4189712, -1.379297, 1.938499, 1, 1, 1, 1, 1,
0.4190622, -0.6577746, 3.651738, 1, 1, 1, 1, 1,
0.4193948, -0.8950133, 2.738104, 1, 1, 1, 1, 1,
0.4226086, -0.4999618, 1.864001, 1, 1, 1, 1, 1,
0.4286805, -0.2307881, 2.003542, 0, 0, 1, 1, 1,
0.4300313, 0.7048524, 0.2957099, 1, 0, 0, 1, 1,
0.4368287, -0.1418083, 1.31938, 1, 0, 0, 1, 1,
0.4409141, 2.194456, 0.154615, 1, 0, 0, 1, 1,
0.4436539, 0.6258444, 1.587807, 1, 0, 0, 1, 1,
0.4493942, 0.5135602, 1.699827, 1, 0, 0, 1, 1,
0.4530773, 0.08460345, 1.713863, 0, 0, 0, 1, 1,
0.4553987, -0.9636096, 2.647615, 0, 0, 0, 1, 1,
0.4565459, 0.8527193, 0.1296874, 0, 0, 0, 1, 1,
0.4570406, 0.9599649, 0.6463088, 0, 0, 0, 1, 1,
0.4628284, -1.46686, 4.547485, 0, 0, 0, 1, 1,
0.4634546, 0.816966, 0.5559945, 0, 0, 0, 1, 1,
0.4694054, -0.1797469, 0.3088302, 0, 0, 0, 1, 1,
0.4701457, -1.207779, 4.269425, 1, 1, 1, 1, 1,
0.4703637, -0.7158389, 4.19227, 1, 1, 1, 1, 1,
0.4755255, 0.0044327, 0.9631078, 1, 1, 1, 1, 1,
0.4807233, 1.238293, 1.497538, 1, 1, 1, 1, 1,
0.4811868, 1.388626, -0.06287955, 1, 1, 1, 1, 1,
0.4826508, -2.257973, 2.928683, 1, 1, 1, 1, 1,
0.4835575, 1.141824, 0.2120499, 1, 1, 1, 1, 1,
0.488359, -0.5121589, 3.005599, 1, 1, 1, 1, 1,
0.4888149, 0.7127616, 1.436512, 1, 1, 1, 1, 1,
0.4904305, -0.1790515, 2.408413, 1, 1, 1, 1, 1,
0.4905069, 0.524178, -0.996736, 1, 1, 1, 1, 1,
0.4910724, -0.9058052, 4.069223, 1, 1, 1, 1, 1,
0.4935981, 1.41626, -0.01298745, 1, 1, 1, 1, 1,
0.4972219, -0.7938559, 1.293095, 1, 1, 1, 1, 1,
0.5050806, 0.3820057, -0.2912075, 1, 1, 1, 1, 1,
0.5061352, -1.309498, 3.3605, 0, 0, 1, 1, 1,
0.5087783, -0.09314222, 1.488639, 1, 0, 0, 1, 1,
0.5120386, 0.476985, 0.5367498, 1, 0, 0, 1, 1,
0.5123565, 1.645249, 0.3883939, 1, 0, 0, 1, 1,
0.5125182, 0.5381615, 1.626294, 1, 0, 0, 1, 1,
0.5145946, 0.6335857, 0.4817377, 1, 0, 0, 1, 1,
0.5199687, -1.467938, 2.476954, 0, 0, 0, 1, 1,
0.5229122, -0.9267418, 2.520523, 0, 0, 0, 1, 1,
0.5234773, 2.276456, 0.9549493, 0, 0, 0, 1, 1,
0.5278825, -1.812377, 3.393011, 0, 0, 0, 1, 1,
0.5304658, -0.3569604, 0.728026, 0, 0, 0, 1, 1,
0.5406443, 0.3886782, 0.572412, 0, 0, 0, 1, 1,
0.5463915, -1.240259, 4.126902, 0, 0, 0, 1, 1,
0.5467469, -0.06472948, 3.342496, 1, 1, 1, 1, 1,
0.5504046, 0.9209048, -0.5946472, 1, 1, 1, 1, 1,
0.5525473, 1.527889, 0.08346973, 1, 1, 1, 1, 1,
0.5543547, 0.06363245, 2.229796, 1, 1, 1, 1, 1,
0.5570881, 0.005416289, 2.091637, 1, 1, 1, 1, 1,
0.5656813, -0.1163963, 1.503514, 1, 1, 1, 1, 1,
0.5662667, 0.08327111, 2.59295, 1, 1, 1, 1, 1,
0.5737938, -1.591478, 2.94395, 1, 1, 1, 1, 1,
0.5760462, 0.09430965, 3.029799, 1, 1, 1, 1, 1,
0.5773738, -0.9097727, 3.773572, 1, 1, 1, 1, 1,
0.5806251, 0.009649727, 1.847614, 1, 1, 1, 1, 1,
0.5834457, -0.2052671, 0.9167868, 1, 1, 1, 1, 1,
0.5899513, -1.114665, 3.78612, 1, 1, 1, 1, 1,
0.5911016, 1.209871, 2.366573, 1, 1, 1, 1, 1,
0.5926244, 0.2379262, 3.07289, 1, 1, 1, 1, 1,
0.6083416, -0.5253356, 3.707608, 0, 0, 1, 1, 1,
0.6265741, -0.6184523, 2.389888, 1, 0, 0, 1, 1,
0.6267531, -1.347788, 3.411171, 1, 0, 0, 1, 1,
0.6310798, 0.8745303, -0.1068769, 1, 0, 0, 1, 1,
0.645172, 1.296851, 0.3458548, 1, 0, 0, 1, 1,
0.6468449, -1.975641, 3.924789, 1, 0, 0, 1, 1,
0.6489807, 0.4565774, 0.479814, 0, 0, 0, 1, 1,
0.6498161, 0.5423062, -0.5418475, 0, 0, 0, 1, 1,
0.651822, -0.2461265, 0.6860372, 0, 0, 0, 1, 1,
0.6551524, -0.7967157, 2.305879, 0, 0, 0, 1, 1,
0.6589653, -0.0037912, 1.259477, 0, 0, 0, 1, 1,
0.6590386, 0.3925207, 2.568177, 0, 0, 0, 1, 1,
0.6593485, -0.1732411, 0.4377441, 0, 0, 0, 1, 1,
0.6600325, -0.4060933, 1.904705, 1, 1, 1, 1, 1,
0.661665, 0.1033536, 0.8358129, 1, 1, 1, 1, 1,
0.663246, -0.02128025, 0.7335231, 1, 1, 1, 1, 1,
0.6662259, 0.8208379, 0.6149577, 1, 1, 1, 1, 1,
0.6673535, -0.9024574, 1.864756, 1, 1, 1, 1, 1,
0.6712711, 0.007963507, 1.045103, 1, 1, 1, 1, 1,
0.6779315, -3.418782, 3.193907, 1, 1, 1, 1, 1,
0.6815882, 0.01210627, 1.650854, 1, 1, 1, 1, 1,
0.6857207, 0.2962036, 1.515916, 1, 1, 1, 1, 1,
0.686725, -1.86933, 4.482216, 1, 1, 1, 1, 1,
0.6891255, -0.06578796, 1.657487, 1, 1, 1, 1, 1,
0.6941318, -0.1866861, 2.857063, 1, 1, 1, 1, 1,
0.6943932, 2.112798, 1.45537, 1, 1, 1, 1, 1,
0.6951554, -1.280503, 1.541699, 1, 1, 1, 1, 1,
0.6955125, 0.6531433, -0.4594181, 1, 1, 1, 1, 1,
0.7057286, -1.177963, 4.130789, 0, 0, 1, 1, 1,
0.7060034, 0.2963672, 0.6111652, 1, 0, 0, 1, 1,
0.7071946, -1.102747, 1.228357, 1, 0, 0, 1, 1,
0.7121733, 0.8186343, 0.1805723, 1, 0, 0, 1, 1,
0.7139923, 1.632718, -0.3500002, 1, 0, 0, 1, 1,
0.716561, 1.125146, 0.3237505, 1, 0, 0, 1, 1,
0.7169387, -0.5651818, 1.653844, 0, 0, 0, 1, 1,
0.7189432, -0.1572104, 1.267204, 0, 0, 0, 1, 1,
0.7205107, -0.1658447, 4.287464, 0, 0, 0, 1, 1,
0.7210434, 0.6096112, 1.205536, 0, 0, 0, 1, 1,
0.7218853, 0.2927679, 1.999925, 0, 0, 0, 1, 1,
0.7254282, -1.792157, 3.667022, 0, 0, 0, 1, 1,
0.7267829, -1.07193, 3.927532, 0, 0, 0, 1, 1,
0.7303202, 1.421226, 2.061676, 1, 1, 1, 1, 1,
0.7317793, 0.04704316, -1.118317, 1, 1, 1, 1, 1,
0.7333462, 0.6466952, -0.07500482, 1, 1, 1, 1, 1,
0.7333717, -0.5794646, 2.224566, 1, 1, 1, 1, 1,
0.7344041, 0.9404882, 1.161885, 1, 1, 1, 1, 1,
0.7359535, 0.2784812, 0.6710442, 1, 1, 1, 1, 1,
0.7424781, 1.239596, 0.06763383, 1, 1, 1, 1, 1,
0.7426536, 0.9486156, 1.75032, 1, 1, 1, 1, 1,
0.7496651, -0.6894276, 1.093842, 1, 1, 1, 1, 1,
0.7525682, -1.904989, 3.329305, 1, 1, 1, 1, 1,
0.7549265, -0.6963271, 2.102992, 1, 1, 1, 1, 1,
0.7598793, -0.3799496, 1.559671, 1, 1, 1, 1, 1,
0.7602576, -0.2779621, 1.448883, 1, 1, 1, 1, 1,
0.7609591, -1.062217, 2.430349, 1, 1, 1, 1, 1,
0.7621812, 0.2497241, 2.054152, 1, 1, 1, 1, 1,
0.762862, 0.5556105, 1.645909, 0, 0, 1, 1, 1,
0.7636042, 0.9884034, 1.443153, 1, 0, 0, 1, 1,
0.7690856, -0.9952472, 3.217115, 1, 0, 0, 1, 1,
0.7702449, -1.456193, 1.40983, 1, 0, 0, 1, 1,
0.7724026, 0.4031602, 1.237702, 1, 0, 0, 1, 1,
0.7742661, -0.7437785, 1.801384, 1, 0, 0, 1, 1,
0.7763997, -0.3576001, 2.529798, 0, 0, 0, 1, 1,
0.7809278, -0.5174456, 1.269144, 0, 0, 0, 1, 1,
0.7866316, -0.7670901, 4.109838, 0, 0, 0, 1, 1,
0.7880274, 0.1614588, 2.494886, 0, 0, 0, 1, 1,
0.7883134, -0.8841777, 2.046618, 0, 0, 0, 1, 1,
0.7897858, -0.7262826, 3.140673, 0, 0, 0, 1, 1,
0.7930506, 1.116659, 1.350871, 0, 0, 0, 1, 1,
0.7955489, 1.423808, 3.011291, 1, 1, 1, 1, 1,
0.7959567, -0.01685012, 0.9429619, 1, 1, 1, 1, 1,
0.8011495, -2.241693, 5.270871, 1, 1, 1, 1, 1,
0.8028265, -0.2253184, 3.58638, 1, 1, 1, 1, 1,
0.8063242, 0.5206174, 1.981951, 1, 1, 1, 1, 1,
0.8087099, -1.055987, 3.490353, 1, 1, 1, 1, 1,
0.8087191, 0.08377624, 1.674954, 1, 1, 1, 1, 1,
0.8100059, -1.020841, 2.803975, 1, 1, 1, 1, 1,
0.8101441, 1.407416, -1.059065, 1, 1, 1, 1, 1,
0.8109419, -0.2228179, 3.293998, 1, 1, 1, 1, 1,
0.8140208, 2.525899, -0.2220176, 1, 1, 1, 1, 1,
0.8246972, -0.2993475, 1.517413, 1, 1, 1, 1, 1,
0.8294343, 0.7391359, 1.067269, 1, 1, 1, 1, 1,
0.8307323, -1.383131, 2.030319, 1, 1, 1, 1, 1,
0.8328436, -0.405737, 3.129641, 1, 1, 1, 1, 1,
0.8336098, 2.448813, 1.497038, 0, 0, 1, 1, 1,
0.8384708, -0.227658, 1.892227, 1, 0, 0, 1, 1,
0.8422589, 1.341781, 1.430802, 1, 0, 0, 1, 1,
0.8457066, -2.343359, 2.109089, 1, 0, 0, 1, 1,
0.8506531, -0.5940797, 2.106367, 1, 0, 0, 1, 1,
0.8528693, 0.715259, -0.3720411, 1, 0, 0, 1, 1,
0.8561417, 0.7096153, -0.4205279, 0, 0, 0, 1, 1,
0.8571396, -1.685974, 1.127657, 0, 0, 0, 1, 1,
0.8622071, -0.9994258, 1.506465, 0, 0, 0, 1, 1,
0.8639133, -0.3389888, 0.9523892, 0, 0, 0, 1, 1,
0.8694369, 0.4679594, 3.079429, 0, 0, 0, 1, 1,
0.8732163, -0.6898307, 1.407904, 0, 0, 0, 1, 1,
0.8733299, 1.223168, -1.04223, 0, 0, 0, 1, 1,
0.8757349, -0.6891497, 3.202798, 1, 1, 1, 1, 1,
0.8766436, -0.1166011, 2.02119, 1, 1, 1, 1, 1,
0.88295, 0.1965186, 1.86628, 1, 1, 1, 1, 1,
0.8866695, 0.2453016, 1.832677, 1, 1, 1, 1, 1,
0.905525, -0.8609817, 3.750421, 1, 1, 1, 1, 1,
0.9119388, 2.270216, -1.151654, 1, 1, 1, 1, 1,
0.9158954, 0.1190164, 1.97026, 1, 1, 1, 1, 1,
0.919667, -0.1791999, 2.517162, 1, 1, 1, 1, 1,
0.9296492, 1.745835, 2.486445, 1, 1, 1, 1, 1,
0.9313232, 0.9700086, 0.8894756, 1, 1, 1, 1, 1,
0.9384, 0.3821431, 0.8797631, 1, 1, 1, 1, 1,
0.9388138, -1.177719, 3.237906, 1, 1, 1, 1, 1,
0.9408361, -0.1656952, 2.669386, 1, 1, 1, 1, 1,
0.9451044, 0.5014512, 1.222364, 1, 1, 1, 1, 1,
0.9463965, -0.3716338, 1.467519, 1, 1, 1, 1, 1,
0.9493002, 1.220565, 2.546483, 0, 0, 1, 1, 1,
0.9524113, -0.2695472, 2.47703, 1, 0, 0, 1, 1,
0.9544141, -0.4493473, 2.388182, 1, 0, 0, 1, 1,
0.9569255, -1.35864, 4.609158, 1, 0, 0, 1, 1,
0.9589076, 0.2570101, 2.702474, 1, 0, 0, 1, 1,
0.9620911, 0.2403135, 0.9948127, 1, 0, 0, 1, 1,
0.9629728, 2.793066, 0.2537576, 0, 0, 0, 1, 1,
0.9635412, 1.723539, 0.3410586, 0, 0, 0, 1, 1,
0.9676552, -0.1731919, 2.912086, 0, 0, 0, 1, 1,
0.9729136, -1.817722, 2.739098, 0, 0, 0, 1, 1,
0.9783939, 0.6385633, 1.576338, 0, 0, 0, 1, 1,
0.9810264, 0.6837857, 1.785435, 0, 0, 0, 1, 1,
0.9841845, 0.3202437, 0.6261411, 0, 0, 0, 1, 1,
0.9899856, 0.7302581, 0.7293462, 1, 1, 1, 1, 1,
0.9923108, 0.7996866, 1.043307, 1, 1, 1, 1, 1,
1.001546, -0.518205, 2.700611, 1, 1, 1, 1, 1,
1.004881, -1.610868, 3.712295, 1, 1, 1, 1, 1,
1.008268, -0.1803856, 2.339054, 1, 1, 1, 1, 1,
1.022054, 0.8804653, 0.9795049, 1, 1, 1, 1, 1,
1.028761, 1.065129, 0.4785827, 1, 1, 1, 1, 1,
1.029562, -0.810266, 1.401747, 1, 1, 1, 1, 1,
1.034404, 1.278642, 0.7445614, 1, 1, 1, 1, 1,
1.042103, 0.5317439, 0.6017776, 1, 1, 1, 1, 1,
1.04592, -0.6495245, 1.645399, 1, 1, 1, 1, 1,
1.046026, 2.07884, 1.101978, 1, 1, 1, 1, 1,
1.047906, -0.104724, 0.9309083, 1, 1, 1, 1, 1,
1.053165, -1.229616, 3.066483, 1, 1, 1, 1, 1,
1.058186, 0.8643784, -0.1313323, 1, 1, 1, 1, 1,
1.065779, -0.6691262, 0.4755772, 0, 0, 1, 1, 1,
1.069098, -0.04201023, -0.3806796, 1, 0, 0, 1, 1,
1.071272, 0.6778083, 0.1798562, 1, 0, 0, 1, 1,
1.080093, 1.989666, 1.053683, 1, 0, 0, 1, 1,
1.090271, 0.4514662, 1.292652, 1, 0, 0, 1, 1,
1.095, 1.431708, -0.9639698, 1, 0, 0, 1, 1,
1.095155, -0.06086158, 0.9687426, 0, 0, 0, 1, 1,
1.103381, 0.908467, -0.1797362, 0, 0, 0, 1, 1,
1.10447, -1.048203, 1.219672, 0, 0, 0, 1, 1,
1.104693, -1.576995, 2.572309, 0, 0, 0, 1, 1,
1.104811, -0.05340591, 1.824911, 0, 0, 0, 1, 1,
1.105863, 0.5947943, 0.2139335, 0, 0, 0, 1, 1,
1.108108, -0.4719762, 1.021866, 0, 0, 0, 1, 1,
1.112347, 0.9178943, 0.3202497, 1, 1, 1, 1, 1,
1.114842, 0.3381948, 1.555041, 1, 1, 1, 1, 1,
1.119294, -0.277719, 2.877886, 1, 1, 1, 1, 1,
1.12096, 0.2006019, 1.708448, 1, 1, 1, 1, 1,
1.122586, -1.889173, 2.628925, 1, 1, 1, 1, 1,
1.129306, 1.236534, 0.2289584, 1, 1, 1, 1, 1,
1.132259, 0.03044631, 2.573334, 1, 1, 1, 1, 1,
1.13705, -1.228908, 2.027545, 1, 1, 1, 1, 1,
1.140053, 1.407434, 0.9237346, 1, 1, 1, 1, 1,
1.144816, -0.9095508, 1.613351, 1, 1, 1, 1, 1,
1.147872, -1.445865, 2.984603, 1, 1, 1, 1, 1,
1.149877, 1.663361, 1.629612, 1, 1, 1, 1, 1,
1.150683, -0.333521, 0.7665406, 1, 1, 1, 1, 1,
1.151277, -0.3841198, 3.743133, 1, 1, 1, 1, 1,
1.155349, -0.3442949, 2.030406, 1, 1, 1, 1, 1,
1.162788, 1.152552, -0.1817882, 0, 0, 1, 1, 1,
1.17342, 1.073121, 1.436987, 1, 0, 0, 1, 1,
1.174129, -0.5989463, 1.057156, 1, 0, 0, 1, 1,
1.17437, -1.263428, 2.479412, 1, 0, 0, 1, 1,
1.176162, -2.795814, 2.25504, 1, 0, 0, 1, 1,
1.181663, 0.9109024, -0.1907672, 1, 0, 0, 1, 1,
1.183897, -0.3942072, 2.070977, 0, 0, 0, 1, 1,
1.189852, -0.8347893, 3.445306, 0, 0, 0, 1, 1,
1.195584, -1.212243, 2.202665, 0, 0, 0, 1, 1,
1.203185, 2.461155, 0.4361905, 0, 0, 0, 1, 1,
1.208739, -0.6935689, 2.26901, 0, 0, 0, 1, 1,
1.211266, 0.3823884, 1.004899, 0, 0, 0, 1, 1,
1.213636, -1.149551, 3.195358, 0, 0, 0, 1, 1,
1.21439, -2.932286, 3.918966, 1, 1, 1, 1, 1,
1.225532, 0.4014059, 2.07166, 1, 1, 1, 1, 1,
1.229459, -1.476428, 3.57304, 1, 1, 1, 1, 1,
1.230501, 0.4206491, -0.03097797, 1, 1, 1, 1, 1,
1.23147, -0.07756163, 1.070606, 1, 1, 1, 1, 1,
1.231635, 0.7163443, 1.898808, 1, 1, 1, 1, 1,
1.233962, 1.042315, 1.388081, 1, 1, 1, 1, 1,
1.23424, 0.4975742, 0.1280071, 1, 1, 1, 1, 1,
1.23661, 0.6252692, 1.510272, 1, 1, 1, 1, 1,
1.253385, -2.412504, 1.163038, 1, 1, 1, 1, 1,
1.259927, -1.310958, 3.819197, 1, 1, 1, 1, 1,
1.260734, -0.3026237, 1.88288, 1, 1, 1, 1, 1,
1.271316, -0.08226311, 3.055827, 1, 1, 1, 1, 1,
1.28026, -0.1188492, 1.592438, 1, 1, 1, 1, 1,
1.303531, -0.1386364, 0.1214883, 1, 1, 1, 1, 1,
1.311212, 0.3901584, 0.537453, 0, 0, 1, 1, 1,
1.315743, -1.465955, 2.753865, 1, 0, 0, 1, 1,
1.316085, -0.8693272, 2.561526, 1, 0, 0, 1, 1,
1.320384, 0.3953284, 0.2367357, 1, 0, 0, 1, 1,
1.320579, -0.4761643, 2.669821, 1, 0, 0, 1, 1,
1.335619, 0.6053449, 2.74203, 1, 0, 0, 1, 1,
1.336853, 0.9352684, 0.693745, 0, 0, 0, 1, 1,
1.341695, -0.182836, 3.509266, 0, 0, 0, 1, 1,
1.348662, -0.7497277, 2.441238, 0, 0, 0, 1, 1,
1.360569, -0.3510006, 2.026936, 0, 0, 0, 1, 1,
1.364163, -0.1714169, 1.516181, 0, 0, 0, 1, 1,
1.38, -1.627268, 2.159398, 0, 0, 0, 1, 1,
1.38073, -0.6638876, 3.204551, 0, 0, 0, 1, 1,
1.385558, 0.07136545, 0.4423518, 1, 1, 1, 1, 1,
1.386461, -0.3027319, 1.838374, 1, 1, 1, 1, 1,
1.3893, 1.288601, 1.420033, 1, 1, 1, 1, 1,
1.392361, 1.05287, 0.7866545, 1, 1, 1, 1, 1,
1.398642, 1.537511, 2.674258, 1, 1, 1, 1, 1,
1.407712, 0.9715798, 1.014124, 1, 1, 1, 1, 1,
1.408338, -0.2932139, 2.512935, 1, 1, 1, 1, 1,
1.4102, 1.04741, 1.92198, 1, 1, 1, 1, 1,
1.41491, -1.359489, 2.472872, 1, 1, 1, 1, 1,
1.415671, 0.4295458, 1.656718, 1, 1, 1, 1, 1,
1.417182, -0.3539581, 2.324799, 1, 1, 1, 1, 1,
1.433317, 0.3704522, 2.553453, 1, 1, 1, 1, 1,
1.450388, 1.660601, 2.88626, 1, 1, 1, 1, 1,
1.473973, 1.394347, 2.94817, 1, 1, 1, 1, 1,
1.492246, -1.617662, 3.545619, 1, 1, 1, 1, 1,
1.492443, -0.675453, 1.726185, 0, 0, 1, 1, 1,
1.498715, -1.532844, 2.160945, 1, 0, 0, 1, 1,
1.499149, 0.9538347, 1.344444, 1, 0, 0, 1, 1,
1.499227, 0.7674845, 0.7355188, 1, 0, 0, 1, 1,
1.499441, -0.4079334, 2.096641, 1, 0, 0, 1, 1,
1.500558, 0.4461738, 3.030058, 1, 0, 0, 1, 1,
1.504728, 1.07433, 2.710903, 0, 0, 0, 1, 1,
1.504889, 3.037741, 2.195417, 0, 0, 0, 1, 1,
1.515911, -0.6164685, 0.603061, 0, 0, 0, 1, 1,
1.51629, 1.113125, 0.423859, 0, 0, 0, 1, 1,
1.516791, -0.1535415, 1.57691, 0, 0, 0, 1, 1,
1.521436, 0.3511833, 1.538513, 0, 0, 0, 1, 1,
1.530865, 0.08290139, 2.776004, 0, 0, 0, 1, 1,
1.534239, 0.1793104, 2.136333, 1, 1, 1, 1, 1,
1.540319, -0.4440292, 1.607754, 1, 1, 1, 1, 1,
1.54081, -0.1479089, -0.6829419, 1, 1, 1, 1, 1,
1.554219, -0.08715462, -0.2391781, 1, 1, 1, 1, 1,
1.56764, 0.1726102, 2.077856, 1, 1, 1, 1, 1,
1.572564, 0.5284505, 1.74089, 1, 1, 1, 1, 1,
1.596057, 0.6655535, 2.524178, 1, 1, 1, 1, 1,
1.601761, -0.2679279, 2.102312, 1, 1, 1, 1, 1,
1.618577, 0.2643877, 2.402005, 1, 1, 1, 1, 1,
1.660969, -0.07970137, 1.656221, 1, 1, 1, 1, 1,
1.666678, 0.4400598, 0.7846939, 1, 1, 1, 1, 1,
1.678838, -0.6595196, 0.8221995, 1, 1, 1, 1, 1,
1.686477, 0.317062, 1.038977, 1, 1, 1, 1, 1,
1.695852, 1.293285, 0.9502599, 1, 1, 1, 1, 1,
1.699532, 0.3123555, 1.347975, 1, 1, 1, 1, 1,
1.700495, -0.4352525, -0.2992654, 0, 0, 1, 1, 1,
1.713407, 0.3537157, 1.561069, 1, 0, 0, 1, 1,
1.727567, 1.045618, 0.844446, 1, 0, 0, 1, 1,
1.733432, -0.5825663, 2.709722, 1, 0, 0, 1, 1,
1.749232, -1.750741, 1.034829, 1, 0, 0, 1, 1,
1.77344, 0.7029245, 0.4669544, 1, 0, 0, 1, 1,
1.775455, -1.050733, 3.064481, 0, 0, 0, 1, 1,
1.781056, 1.887669, 1.016221, 0, 0, 0, 1, 1,
1.792787, -0.8857875, 0.7719793, 0, 0, 0, 1, 1,
1.797611, 1.020011, 1.022047, 0, 0, 0, 1, 1,
1.801315, 1.297889, 1.564683, 0, 0, 0, 1, 1,
1.807417, 0.8487742, 1.098746, 0, 0, 0, 1, 1,
1.811352, 0.9430802, 0.6102959, 0, 0, 0, 1, 1,
1.813314, 1.006077, 0.753439, 1, 1, 1, 1, 1,
1.81917, -0.5500519, 2.935465, 1, 1, 1, 1, 1,
1.83683, 0.6413345, 3.290859, 1, 1, 1, 1, 1,
1.847199, -0.942071, 0.4230656, 1, 1, 1, 1, 1,
1.853484, -0.2034129, 2.590875, 1, 1, 1, 1, 1,
1.857623, -0.9581453, 1.212047, 1, 1, 1, 1, 1,
1.87184, 0.886201, 0.139284, 1, 1, 1, 1, 1,
1.878514, 1.602985, 0.9184188, 1, 1, 1, 1, 1,
1.892803, 1.235074, 1.77797, 1, 1, 1, 1, 1,
1.920004, 0.06258512, 1.353551, 1, 1, 1, 1, 1,
1.920148, 0.5354702, 0.2712087, 1, 1, 1, 1, 1,
1.952478, -0.1933106, 2.636259, 1, 1, 1, 1, 1,
1.966186, -1.394816, 0.3896693, 1, 1, 1, 1, 1,
2.001787, 0.2602927, 0.9471609, 1, 1, 1, 1, 1,
2.018807, 0.3139125, 1.749069, 1, 1, 1, 1, 1,
2.035129, -0.8483477, -0.07365382, 0, 0, 1, 1, 1,
2.067345, 0.9823307, 0.988107, 1, 0, 0, 1, 1,
2.088962, 0.971685, 1.147436, 1, 0, 0, 1, 1,
2.107457, -0.241485, 2.000657, 1, 0, 0, 1, 1,
2.113683, 0.8865191, 1.949239, 1, 0, 0, 1, 1,
2.122174, 0.4459713, 0.9923871, 1, 0, 0, 1, 1,
2.125418, -1.246751, 1.141469, 0, 0, 0, 1, 1,
2.125818, 0.8929955, 1.047609, 0, 0, 0, 1, 1,
2.150393, -0.6562769, 0.63878, 0, 0, 0, 1, 1,
2.170084, 1.333198, 1.478929, 0, 0, 0, 1, 1,
2.198669, -0.2201424, 2.398971, 0, 0, 0, 1, 1,
2.253639, 1.139508, 0.5570136, 0, 0, 0, 1, 1,
2.296478, 0.7238063, 0.7846974, 0, 0, 0, 1, 1,
2.335299, -0.6955691, 1.692812, 1, 1, 1, 1, 1,
2.378847, 0.09840012, -0.6976553, 1, 1, 1, 1, 1,
2.458358, -0.5946277, 2.901883, 1, 1, 1, 1, 1,
2.478156, 0.6779307, 2.123144, 1, 1, 1, 1, 1,
2.778165, 1.194805, 1.078356, 1, 1, 1, 1, 1,
3.256896, -0.1656324, 0.5356472, 1, 1, 1, 1, 1,
3.297579, 1.390018, 1.353909, 1, 1, 1, 1, 1
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
var radius = 9.465209;
var distance = 33.24614;
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
mvMatrix.translate( -0.2771076, 0.09990287, -0.1120868 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.24614);
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
