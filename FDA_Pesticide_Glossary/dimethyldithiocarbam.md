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
-3.189295, -1.897727, -2.700118, 1, 0, 0, 1,
-3.047022, 0.8379191, 0.3134737, 1, 0.007843138, 0, 1,
-2.960393, 0.3262526, -1.896968, 1, 0.01176471, 0, 1,
-2.942861, -0.1625341, -1.496763, 1, 0.01960784, 0, 1,
-2.829937, 1.579837, 1.902197, 1, 0.02352941, 0, 1,
-2.765149, 0.875072, -0.5447837, 1, 0.03137255, 0, 1,
-2.534856, 0.3946061, -1.84306, 1, 0.03529412, 0, 1,
-2.491907, -0.08841471, -1.935956, 1, 0.04313726, 0, 1,
-2.469171, 0.6061152, -1.498904, 1, 0.04705882, 0, 1,
-2.343438, 1.045678, -0.458843, 1, 0.05490196, 0, 1,
-2.322387, 0.006730601, -1.724775, 1, 0.05882353, 0, 1,
-2.313299, 1.757603, -2.207249, 1, 0.06666667, 0, 1,
-2.226191, -1.953301, -2.315876, 1, 0.07058824, 0, 1,
-2.168602, 0.3107173, -2.50237, 1, 0.07843138, 0, 1,
-2.138901, -0.3051141, -1.325194, 1, 0.08235294, 0, 1,
-2.130008, 1.079995, -0.4145436, 1, 0.09019608, 0, 1,
-2.085817, -0.2163749, -1.752144, 1, 0.09411765, 0, 1,
-2.074793, 2.13117, -1.094797, 1, 0.1019608, 0, 1,
-2.068962, 1.047019, -1.721399, 1, 0.1098039, 0, 1,
-2.053157, 0.8882208, -2.564696, 1, 0.1137255, 0, 1,
-2.052792, -0.2170836, -3.819925, 1, 0.1215686, 0, 1,
-2.039077, -0.02507837, -1.501341, 1, 0.1254902, 0, 1,
-1.934807, 1.542858, -3.038113, 1, 0.1333333, 0, 1,
-1.911552, 0.5879667, -1.478044, 1, 0.1372549, 0, 1,
-1.901123, -0.2349023, -3.795576, 1, 0.145098, 0, 1,
-1.899439, -0.6403214, -2.952742, 1, 0.1490196, 0, 1,
-1.897827, 1.126056, -2.777535, 1, 0.1568628, 0, 1,
-1.882649, -0.04579915, -2.239487, 1, 0.1607843, 0, 1,
-1.876451, 0.9762714, -1.530595, 1, 0.1686275, 0, 1,
-1.840404, 0.02279325, -1.873649, 1, 0.172549, 0, 1,
-1.838945, 0.2048982, 0.1221409, 1, 0.1803922, 0, 1,
-1.8315, 0.7226261, -3.350467, 1, 0.1843137, 0, 1,
-1.827482, -0.04613449, -1.980376, 1, 0.1921569, 0, 1,
-1.801711, 0.361584, -0.4835647, 1, 0.1960784, 0, 1,
-1.784384, 0.6393642, -1.074135, 1, 0.2039216, 0, 1,
-1.778209, -1.525527, -2.273, 1, 0.2117647, 0, 1,
-1.777835, 1.093264, -1.376088, 1, 0.2156863, 0, 1,
-1.744529, -0.3813523, -1.904433, 1, 0.2235294, 0, 1,
-1.739167, -1.293807, -4.168098, 1, 0.227451, 0, 1,
-1.723828, -0.8749129, -1.86455, 1, 0.2352941, 0, 1,
-1.721326, -1.220761, -2.790948, 1, 0.2392157, 0, 1,
-1.717286, -2.139543, -3.603046, 1, 0.2470588, 0, 1,
-1.708772, -1.030345, -1.039508, 1, 0.2509804, 0, 1,
-1.705226, -1.164468, -2.436494, 1, 0.2588235, 0, 1,
-1.696616, 0.9566545, -1.291233, 1, 0.2627451, 0, 1,
-1.68716, 0.06657004, -2.234462, 1, 0.2705882, 0, 1,
-1.686866, 1.4802, -4.033154, 1, 0.2745098, 0, 1,
-1.683048, 1.300417, -1.026888, 1, 0.282353, 0, 1,
-1.664543, 0.4051568, -2.253052, 1, 0.2862745, 0, 1,
-1.649906, 0.7293895, 0.1079346, 1, 0.2941177, 0, 1,
-1.647875, 1.821687, -1.845987, 1, 0.3019608, 0, 1,
-1.64343, 2.226506, -2.017952, 1, 0.3058824, 0, 1,
-1.641044, -0.3939209, -1.827847, 1, 0.3137255, 0, 1,
-1.628494, -0.2545668, -3.550005, 1, 0.3176471, 0, 1,
-1.624651, -0.03456237, -2.498126, 1, 0.3254902, 0, 1,
-1.617836, -1.15615, -3.079508, 1, 0.3294118, 0, 1,
-1.613285, -0.002548442, -1.456883, 1, 0.3372549, 0, 1,
-1.608432, 0.8294411, -0.896961, 1, 0.3411765, 0, 1,
-1.54807, -0.353675, -2.658103, 1, 0.3490196, 0, 1,
-1.54111, 1.151579, -2.508859, 1, 0.3529412, 0, 1,
-1.5388, 1.210158, 1.201139, 1, 0.3607843, 0, 1,
-1.532435, 0.6829951, 0.7591251, 1, 0.3647059, 0, 1,
-1.530313, 0.7985116, -0.05151226, 1, 0.372549, 0, 1,
-1.528873, -0.03935847, -1.433065, 1, 0.3764706, 0, 1,
-1.522969, -0.2108618, -1.074823, 1, 0.3843137, 0, 1,
-1.509016, -1.331202, -3.230646, 1, 0.3882353, 0, 1,
-1.50702, 0.5408146, -0.3970205, 1, 0.3960784, 0, 1,
-1.503778, 0.3157131, -0.5896601, 1, 0.4039216, 0, 1,
-1.495684, 0.05680612, -0.6412619, 1, 0.4078431, 0, 1,
-1.49424, -0.124286, -2.473494, 1, 0.4156863, 0, 1,
-1.491035, 0.3575891, -2.342398, 1, 0.4196078, 0, 1,
-1.483552, 0.1682004, -2.57949, 1, 0.427451, 0, 1,
-1.482903, 0.2157856, -0.4707538, 1, 0.4313726, 0, 1,
-1.481746, 0.9066864, -1.834339, 1, 0.4392157, 0, 1,
-1.478814, -0.5687347, 0.2131288, 1, 0.4431373, 0, 1,
-1.478125, 0.479344, -1.896401, 1, 0.4509804, 0, 1,
-1.477539, -1.934178, -2.424684, 1, 0.454902, 0, 1,
-1.47602, 1.580006, -0.6116431, 1, 0.4627451, 0, 1,
-1.47076, -0.1646862, -2.649882, 1, 0.4666667, 0, 1,
-1.469863, 1.130233, -0.9189259, 1, 0.4745098, 0, 1,
-1.469424, -0.383271, -1.238446, 1, 0.4784314, 0, 1,
-1.456732, 1.53879, 0.3650101, 1, 0.4862745, 0, 1,
-1.451146, 0.5652977, 0.4873305, 1, 0.4901961, 0, 1,
-1.447712, -1.298278, -1.660169, 1, 0.4980392, 0, 1,
-1.436593, 0.4131043, -1.948162, 1, 0.5058824, 0, 1,
-1.423076, -1.02939, -1.266239, 1, 0.509804, 0, 1,
-1.411459, 0.08074003, -1.216265, 1, 0.5176471, 0, 1,
-1.399335, 0.6276923, -0.8006088, 1, 0.5215687, 0, 1,
-1.39415, -1.401972, -2.670582, 1, 0.5294118, 0, 1,
-1.391295, -1.77882, -3.107579, 1, 0.5333334, 0, 1,
-1.385547, 0.09009229, -0.688972, 1, 0.5411765, 0, 1,
-1.382756, -2.038895, -3.873368, 1, 0.5450981, 0, 1,
-1.376381, 0.7400779, -0.3970971, 1, 0.5529412, 0, 1,
-1.375714, -0.6706854, -2.76047, 1, 0.5568628, 0, 1,
-1.363052, 0.03113955, -1.960858, 1, 0.5647059, 0, 1,
-1.358188, -0.4480377, -2.338223, 1, 0.5686275, 0, 1,
-1.333303, -0.3916179, -1.627495, 1, 0.5764706, 0, 1,
-1.329035, 0.8161348, -1.589064, 1, 0.5803922, 0, 1,
-1.321558, 1.062739, 0.7341369, 1, 0.5882353, 0, 1,
-1.312348, -0.1532947, -3.055228, 1, 0.5921569, 0, 1,
-1.311736, 0.1053734, -1.636403, 1, 0.6, 0, 1,
-1.307169, -1.244136, -2.6221, 1, 0.6078432, 0, 1,
-1.294253, -0.6956804, -0.5706036, 1, 0.6117647, 0, 1,
-1.292652, 1.007361, 0.3475968, 1, 0.6196079, 0, 1,
-1.279946, -0.7251438, -1.385309, 1, 0.6235294, 0, 1,
-1.278104, 2.515429, -1.240051, 1, 0.6313726, 0, 1,
-1.276687, 0.1408852, -1.685516, 1, 0.6352941, 0, 1,
-1.272319, -0.7142834, -2.423553, 1, 0.6431373, 0, 1,
-1.269151, 0.3982286, -2.668268, 1, 0.6470588, 0, 1,
-1.250222, -1.096449, -1.912379, 1, 0.654902, 0, 1,
-1.246146, 0.5183355, -0.06918555, 1, 0.6588235, 0, 1,
-1.23287, -0.8654804, -2.62326, 1, 0.6666667, 0, 1,
-1.221202, -0.08943392, -0.9433855, 1, 0.6705883, 0, 1,
-1.217136, 0.2109963, -1.591356, 1, 0.6784314, 0, 1,
-1.217092, 0.7780718, -1.377584, 1, 0.682353, 0, 1,
-1.214255, 1.236945, -1.356116, 1, 0.6901961, 0, 1,
-1.213184, 0.4560134, -1.532499, 1, 0.6941177, 0, 1,
-1.207449, 1.047915, -2.616315, 1, 0.7019608, 0, 1,
-1.203801, 0.4410921, 0.3393429, 1, 0.7098039, 0, 1,
-1.18503, -1.04042, -2.607615, 1, 0.7137255, 0, 1,
-1.184534, 1.066543, -1.398181, 1, 0.7215686, 0, 1,
-1.184018, 0.7506249, 0.2405349, 1, 0.7254902, 0, 1,
-1.174395, -1.05986, -2.04089, 1, 0.7333333, 0, 1,
-1.169843, 0.3330059, -0.1142189, 1, 0.7372549, 0, 1,
-1.167714, 1.679747, 1.936678, 1, 0.7450981, 0, 1,
-1.163118, -1.02381, -4.670936, 1, 0.7490196, 0, 1,
-1.155727, 1.348188, -0.7020292, 1, 0.7568628, 0, 1,
-1.149448, 0.2710566, -1.030793, 1, 0.7607843, 0, 1,
-1.148934, 0.7331561, -2.243458, 1, 0.7686275, 0, 1,
-1.147205, 0.4702244, 0.6504808, 1, 0.772549, 0, 1,
-1.147005, 0.4240681, 0.2740855, 1, 0.7803922, 0, 1,
-1.146656, -2.375891, -3.45222, 1, 0.7843137, 0, 1,
-1.137652, 0.002826023, 0.5260983, 1, 0.7921569, 0, 1,
-1.107042, -0.007169178, -1.891857, 1, 0.7960784, 0, 1,
-1.100673, 0.2806839, -1.265897, 1, 0.8039216, 0, 1,
-1.099657, 0.3422929, -0.8241286, 1, 0.8117647, 0, 1,
-1.096922, -0.795653, -2.390373, 1, 0.8156863, 0, 1,
-1.07192, 0.696866, -2.724724, 1, 0.8235294, 0, 1,
-1.051937, -0.9418581, -1.573128, 1, 0.827451, 0, 1,
-1.04094, -0.1419626, -1.133889, 1, 0.8352941, 0, 1,
-1.035214, -1.594058, -2.094635, 1, 0.8392157, 0, 1,
-1.034842, -1.008685, -1.419611, 1, 0.8470588, 0, 1,
-1.028077, 0.8645971, -2.279976, 1, 0.8509804, 0, 1,
-1.024066, 0.169645, -2.846702, 1, 0.8588235, 0, 1,
-1.013085, 0.1867723, -3.338981, 1, 0.8627451, 0, 1,
-1.011686, 1.367315, 1.385857, 1, 0.8705882, 0, 1,
-1.010696, 0.9478465, -1.340316, 1, 0.8745098, 0, 1,
-0.9988858, -1.185392, -1.239551, 1, 0.8823529, 0, 1,
-0.9957345, -0.4467243, -1.869124, 1, 0.8862745, 0, 1,
-0.9939098, -1.060874, -2.646071, 1, 0.8941177, 0, 1,
-0.9926782, 1.177188, -2.854845, 1, 0.8980392, 0, 1,
-0.9897761, -0.4223847, -2.802346, 1, 0.9058824, 0, 1,
-0.9893063, 0.008352335, -2.455251, 1, 0.9137255, 0, 1,
-0.9866089, -0.5485256, -1.006327, 1, 0.9176471, 0, 1,
-0.9847369, -1.96888, -3.768841, 1, 0.9254902, 0, 1,
-0.9784302, 2.355924, 0.0175833, 1, 0.9294118, 0, 1,
-0.9705239, 1.085978, 0.9363248, 1, 0.9372549, 0, 1,
-0.9688262, -0.7249869, -0.8744765, 1, 0.9411765, 0, 1,
-0.9672448, -0.5750162, -1.175046, 1, 0.9490196, 0, 1,
-0.9644713, 1.318745, 0.2974042, 1, 0.9529412, 0, 1,
-0.9572732, 0.3139105, 1.189974, 1, 0.9607843, 0, 1,
-0.9540356, -0.05719944, -2.091003, 1, 0.9647059, 0, 1,
-0.9531118, 0.4520746, -1.684897, 1, 0.972549, 0, 1,
-0.9526568, -1.040851, -1.730089, 1, 0.9764706, 0, 1,
-0.9509521, -2.358615, -3.519572, 1, 0.9843137, 0, 1,
-0.9494359, 0.274165, -1.621762, 1, 0.9882353, 0, 1,
-0.9459102, 1.521883, -0.9680664, 1, 0.9960784, 0, 1,
-0.9425108, 0.2525927, -2.271234, 0.9960784, 1, 0, 1,
-0.9344413, -0.5579662, -2.827351, 0.9921569, 1, 0, 1,
-0.9322407, -1.032569, -5.017568, 0.9843137, 1, 0, 1,
-0.9300503, -0.5610742, -1.736817, 0.9803922, 1, 0, 1,
-0.9289112, -0.4289894, -2.239367, 0.972549, 1, 0, 1,
-0.928026, 0.3047408, -1.111326, 0.9686275, 1, 0, 1,
-0.9211793, 1.153336, -1.044485, 0.9607843, 1, 0, 1,
-0.9201398, 0.8281814, -2.468214, 0.9568627, 1, 0, 1,
-0.9194455, -0.3222695, -2.267904, 0.9490196, 1, 0, 1,
-0.9128332, 2.087055, -0.131023, 0.945098, 1, 0, 1,
-0.8962787, 0.1036017, -1.742723, 0.9372549, 1, 0, 1,
-0.8960676, -0.3311975, -2.229237, 0.9333333, 1, 0, 1,
-0.8924652, -0.0221474, -1.235812, 0.9254902, 1, 0, 1,
-0.8918836, -0.6898091, -1.523782, 0.9215686, 1, 0, 1,
-0.8873942, 0.0231568, 0.01618212, 0.9137255, 1, 0, 1,
-0.8860824, 0.1871643, -2.482363, 0.9098039, 1, 0, 1,
-0.8842786, -0.7767475, -0.08883262, 0.9019608, 1, 0, 1,
-0.8822798, -0.6893245, -0.8252219, 0.8941177, 1, 0, 1,
-0.8805889, -1.346034, -1.337592, 0.8901961, 1, 0, 1,
-0.8764564, -0.6183501, -3.170269, 0.8823529, 1, 0, 1,
-0.8716624, 0.6465821, 0.6253881, 0.8784314, 1, 0, 1,
-0.869428, -0.239503, -1.901717, 0.8705882, 1, 0, 1,
-0.858251, 0.5611274, -0.7398732, 0.8666667, 1, 0, 1,
-0.8565097, 0.5616795, -2.389359, 0.8588235, 1, 0, 1,
-0.8551664, 0.8523507, -0.4368321, 0.854902, 1, 0, 1,
-0.8516718, -0.6815473, -1.843469, 0.8470588, 1, 0, 1,
-0.8513941, 0.7182024, -1.823248, 0.8431373, 1, 0, 1,
-0.8488977, 1.285732, 0.5586784, 0.8352941, 1, 0, 1,
-0.8467023, 0.05613165, -1.48819, 0.8313726, 1, 0, 1,
-0.8445787, -0.3394113, -3.197726, 0.8235294, 1, 0, 1,
-0.8339317, -0.5079346, -1.243296, 0.8196079, 1, 0, 1,
-0.8337136, -2.423891, -3.514821, 0.8117647, 1, 0, 1,
-0.8279342, -0.4128566, -2.379087, 0.8078431, 1, 0, 1,
-0.8262573, 1.552838, -1.637992, 0.8, 1, 0, 1,
-0.8239871, 0.8489351, -0.461421, 0.7921569, 1, 0, 1,
-0.81272, 1.015738, 0.1547079, 0.7882353, 1, 0, 1,
-0.8119711, 0.4361827, -1.65035, 0.7803922, 1, 0, 1,
-0.8109516, -0.06500334, -1.866566, 0.7764706, 1, 0, 1,
-0.8093171, 3.52963, -0.7848241, 0.7686275, 1, 0, 1,
-0.8083138, 0.009712002, -1.41168, 0.7647059, 1, 0, 1,
-0.80753, -1.306176, -3.127225, 0.7568628, 1, 0, 1,
-0.803863, 0.4853179, -0.3359691, 0.7529412, 1, 0, 1,
-0.7933475, -0.328159, -4.041606, 0.7450981, 1, 0, 1,
-0.7911536, 1.136492, -0.2083416, 0.7411765, 1, 0, 1,
-0.7900935, -0.2305556, -1.533303, 0.7333333, 1, 0, 1,
-0.7884664, -1.715759, 0.1858647, 0.7294118, 1, 0, 1,
-0.7853857, 1.67629, 0.7227651, 0.7215686, 1, 0, 1,
-0.782214, -0.7627147, -1.391612, 0.7176471, 1, 0, 1,
-0.7773312, -0.5485643, -1.470715, 0.7098039, 1, 0, 1,
-0.7717218, 0.1266293, -2.758301, 0.7058824, 1, 0, 1,
-0.7701896, 0.02348392, -1.823818, 0.6980392, 1, 0, 1,
-0.7697061, 1.437344, -1.009752, 0.6901961, 1, 0, 1,
-0.768468, -1.331004, -1.721441, 0.6862745, 1, 0, 1,
-0.7630221, 0.2317043, -2.910892, 0.6784314, 1, 0, 1,
-0.7609975, 1.554668, -0.1914309, 0.6745098, 1, 0, 1,
-0.7594596, 0.5819428, -3.359052, 0.6666667, 1, 0, 1,
-0.759059, -0.4170297, -1.843725, 0.6627451, 1, 0, 1,
-0.7578208, 0.2246032, -1.237, 0.654902, 1, 0, 1,
-0.7468923, 0.4011174, -1.846401, 0.6509804, 1, 0, 1,
-0.7395653, 1.074853, -0.1658242, 0.6431373, 1, 0, 1,
-0.7366086, 0.8345674, -0.5185318, 0.6392157, 1, 0, 1,
-0.7283988, 0.4863124, -1.516898, 0.6313726, 1, 0, 1,
-0.7236517, 0.8193871, -0.7895973, 0.627451, 1, 0, 1,
-0.7150909, 0.9977268, -1.873458, 0.6196079, 1, 0, 1,
-0.7147316, 0.6169763, -1.940967, 0.6156863, 1, 0, 1,
-0.7091427, 0.8185562, -0.7374673, 0.6078432, 1, 0, 1,
-0.7075172, 1.426374, 0.3578669, 0.6039216, 1, 0, 1,
-0.7055947, 0.9891759, -1.292753, 0.5960785, 1, 0, 1,
-0.7053372, 0.0690907, -1.686308, 0.5882353, 1, 0, 1,
-0.7041378, -0.8717092, -3.015647, 0.5843138, 1, 0, 1,
-0.7040378, 0.8615626, -0.1357782, 0.5764706, 1, 0, 1,
-0.7039473, 0.1812651, -0.6629812, 0.572549, 1, 0, 1,
-0.7010658, 0.8571466, -0.2486648, 0.5647059, 1, 0, 1,
-0.7001501, -1.736075, -1.805473, 0.5607843, 1, 0, 1,
-0.6998526, 1.445631, -1.813797, 0.5529412, 1, 0, 1,
-0.6955256, 0.2096511, -1.986584, 0.5490196, 1, 0, 1,
-0.6950739, -1.552671, -1.992219, 0.5411765, 1, 0, 1,
-0.6925938, 1.006981, -2.157034, 0.5372549, 1, 0, 1,
-0.6897739, -0.06765115, -1.293781, 0.5294118, 1, 0, 1,
-0.6894572, 0.843191, -1.165466, 0.5254902, 1, 0, 1,
-0.6891613, 0.3533085, -1.558375, 0.5176471, 1, 0, 1,
-0.6781546, 1.180026, 1.391389, 0.5137255, 1, 0, 1,
-0.6766165, -0.8651826, -1.81396, 0.5058824, 1, 0, 1,
-0.6762201, -0.9500849, -1.153285, 0.5019608, 1, 0, 1,
-0.6760893, 0.677753, -2.782485, 0.4941176, 1, 0, 1,
-0.6734492, -0.1120486, -1.651923, 0.4862745, 1, 0, 1,
-0.6717009, -1.398571, -2.606562, 0.4823529, 1, 0, 1,
-0.6694753, 0.3440437, 0.3409622, 0.4745098, 1, 0, 1,
-0.6664956, 0.3207438, 0.08217137, 0.4705882, 1, 0, 1,
-0.6481844, -1.325403, -2.438765, 0.4627451, 1, 0, 1,
-0.6438747, -0.6463799, -3.990045, 0.4588235, 1, 0, 1,
-0.6436635, -1.238244, -2.30349, 0.4509804, 1, 0, 1,
-0.6387383, 1.10018, -1.231594, 0.4470588, 1, 0, 1,
-0.6272531, -0.1257028, -1.782025, 0.4392157, 1, 0, 1,
-0.6228397, -0.3426704, -2.202843, 0.4352941, 1, 0, 1,
-0.6191623, -0.7411413, -3.699356, 0.427451, 1, 0, 1,
-0.6175782, 1.557719, 0.150115, 0.4235294, 1, 0, 1,
-0.617555, 1.199914, 0.3806725, 0.4156863, 1, 0, 1,
-0.6147745, 0.3246211, -1.674745, 0.4117647, 1, 0, 1,
-0.6102077, 0.01228397, -1.600843, 0.4039216, 1, 0, 1,
-0.6037787, -1.759435, -2.237998, 0.3960784, 1, 0, 1,
-0.6032056, 0.01280332, -2.459243, 0.3921569, 1, 0, 1,
-0.601206, -0.1616912, -1.112213, 0.3843137, 1, 0, 1,
-0.595655, 0.4109637, 0.789414, 0.3803922, 1, 0, 1,
-0.5935982, 1.576478, -0.2214579, 0.372549, 1, 0, 1,
-0.5934356, -1.792473, -2.436332, 0.3686275, 1, 0, 1,
-0.5900879, 0.3598708, -0.7076876, 0.3607843, 1, 0, 1,
-0.589231, -0.7339063, -3.71591, 0.3568628, 1, 0, 1,
-0.5881435, -0.06529527, -1.169583, 0.3490196, 1, 0, 1,
-0.5879142, -1.955491, -2.995646, 0.345098, 1, 0, 1,
-0.5859704, -0.2665345, -1.526555, 0.3372549, 1, 0, 1,
-0.5699305, -0.3901194, -3.175643, 0.3333333, 1, 0, 1,
-0.5694442, 0.5670783, -0.2436202, 0.3254902, 1, 0, 1,
-0.5662863, -2.490074, -3.0306, 0.3215686, 1, 0, 1,
-0.5620348, 0.5531077, -0.2576344, 0.3137255, 1, 0, 1,
-0.5617085, -0.2343596, -2.875556, 0.3098039, 1, 0, 1,
-0.5609882, -0.8078547, -3.42238, 0.3019608, 1, 0, 1,
-0.5572038, 0.2032719, -1.661978, 0.2941177, 1, 0, 1,
-0.5568985, 1.396074, -0.2416408, 0.2901961, 1, 0, 1,
-0.5548777, -0.8519748, -4.710902, 0.282353, 1, 0, 1,
-0.5533053, -0.4309165, -2.556683, 0.2784314, 1, 0, 1,
-0.5526711, -1.127596, -1.510725, 0.2705882, 1, 0, 1,
-0.5476936, -0.687042, -0.9864582, 0.2666667, 1, 0, 1,
-0.5458189, -0.5413672, -2.204166, 0.2588235, 1, 0, 1,
-0.5328357, 1.645741, -0.1916826, 0.254902, 1, 0, 1,
-0.5321833, 0.2311784, -2.883702, 0.2470588, 1, 0, 1,
-0.5315353, 0.5791139, -0.6527265, 0.2431373, 1, 0, 1,
-0.5261223, -1.385925, -4.391062, 0.2352941, 1, 0, 1,
-0.5218703, -0.5146995, -1.787486, 0.2313726, 1, 0, 1,
-0.5208241, -0.03641242, -2.004706, 0.2235294, 1, 0, 1,
-0.5204907, -1.872319, -3.872041, 0.2196078, 1, 0, 1,
-0.5188009, 0.6983385, -1.979826, 0.2117647, 1, 0, 1,
-0.5181804, 0.9472222, 0.2989907, 0.2078431, 1, 0, 1,
-0.513498, 0.940245, -0.2207392, 0.2, 1, 0, 1,
-0.5064872, 0.5481365, 0.05457691, 0.1921569, 1, 0, 1,
-0.4962521, 1.589008, -1.241488, 0.1882353, 1, 0, 1,
-0.4960204, -0.7958534, -3.202538, 0.1803922, 1, 0, 1,
-0.495888, 1.878394, -0.1647546, 0.1764706, 1, 0, 1,
-0.4932893, -0.04317627, -2.683583, 0.1686275, 1, 0, 1,
-0.4887712, 1.272592, 0.4530094, 0.1647059, 1, 0, 1,
-0.4847355, -0.3079475, -2.021716, 0.1568628, 1, 0, 1,
-0.4815944, 0.714213, -1.559611, 0.1529412, 1, 0, 1,
-0.4779232, 0.1116094, 0.4722684, 0.145098, 1, 0, 1,
-0.4777206, -1.444899, -3.296446, 0.1411765, 1, 0, 1,
-0.475574, -1.548824, -0.4811136, 0.1333333, 1, 0, 1,
-0.4693391, 0.1902879, -0.220272, 0.1294118, 1, 0, 1,
-0.4684533, -1.084507, -1.913029, 0.1215686, 1, 0, 1,
-0.463167, -1.772353, -2.499836, 0.1176471, 1, 0, 1,
-0.4623968, 1.190493, 0.1897524, 0.1098039, 1, 0, 1,
-0.4611349, 1.343642, 0.6020323, 0.1058824, 1, 0, 1,
-0.4562979, 0.3897171, -1.434611, 0.09803922, 1, 0, 1,
-0.4553713, 1.007429, -0.4391702, 0.09019608, 1, 0, 1,
-0.4508395, 0.63155, -1.48208, 0.08627451, 1, 0, 1,
-0.4504905, 0.7764505, 0.6900591, 0.07843138, 1, 0, 1,
-0.4490268, 1.138028, 0.2851881, 0.07450981, 1, 0, 1,
-0.4481145, -1.500402, -3.700969, 0.06666667, 1, 0, 1,
-0.4432473, 0.1715206, -0.6808373, 0.0627451, 1, 0, 1,
-0.4428463, -2.16536, -2.260652, 0.05490196, 1, 0, 1,
-0.4405285, 0.9944874, 0.4437401, 0.05098039, 1, 0, 1,
-0.4360265, 1.526441, -2.228415, 0.04313726, 1, 0, 1,
-0.4347846, 0.8037398, 1.090289, 0.03921569, 1, 0, 1,
-0.4346184, -0.7378727, -5.227961, 0.03137255, 1, 0, 1,
-0.4276284, 2.278755, -1.684629, 0.02745098, 1, 0, 1,
-0.4252684, -2.00618, -2.713417, 0.01960784, 1, 0, 1,
-0.4246097, -1.208561, -2.9168, 0.01568628, 1, 0, 1,
-0.4206305, -1.123468, -5.33566, 0.007843138, 1, 0, 1,
-0.4193713, 1.826662, -0.8652229, 0.003921569, 1, 0, 1,
-0.41752, 0.7373289, -1.543777, 0, 1, 0.003921569, 1,
-0.4154955, 0.4657072, -0.7124649, 0, 1, 0.01176471, 1,
-0.4136266, 0.4793123, 0.1180258, 0, 1, 0.01568628, 1,
-0.4131363, -0.3467819, -0.5783257, 0, 1, 0.02352941, 1,
-0.4110202, -0.4045669, -1.148458, 0, 1, 0.02745098, 1,
-0.4107238, -1.246431, -2.538632, 0, 1, 0.03529412, 1,
-0.4102699, 0.6075468, -1.556596, 0, 1, 0.03921569, 1,
-0.3987974, -0.1382312, -1.101952, 0, 1, 0.04705882, 1,
-0.3792374, -1.868947, -3.382093, 0, 1, 0.05098039, 1,
-0.3787422, -1.734909, -2.871021, 0, 1, 0.05882353, 1,
-0.3786762, 0.8749695, 1.29872, 0, 1, 0.0627451, 1,
-0.3784342, -0.4173044, -1.413533, 0, 1, 0.07058824, 1,
-0.377044, 1.329796, -0.03430503, 0, 1, 0.07450981, 1,
-0.3763348, 0.1938296, -1.959962, 0, 1, 0.08235294, 1,
-0.3641498, 0.3174576, 1.174531, 0, 1, 0.08627451, 1,
-0.3543125, 0.2334418, -1.690527, 0, 1, 0.09411765, 1,
-0.3531637, 1.686003, -0.1247567, 0, 1, 0.1019608, 1,
-0.3429887, -0.480359, -1.678214, 0, 1, 0.1058824, 1,
-0.3353257, -0.4019352, -2.20883, 0, 1, 0.1137255, 1,
-0.33233, -1.273813, -2.517528, 0, 1, 0.1176471, 1,
-0.3281146, -1.398227, -3.255732, 0, 1, 0.1254902, 1,
-0.3221405, 0.7185832, -1.873958, 0, 1, 0.1294118, 1,
-0.3188764, -0.6636943, -2.657074, 0, 1, 0.1372549, 1,
-0.3172063, -0.2046686, -0.284669, 0, 1, 0.1411765, 1,
-0.314071, -0.5076184, -1.2355, 0, 1, 0.1490196, 1,
-0.3122338, -0.3402188, -0.8997459, 0, 1, 0.1529412, 1,
-0.3072627, 0.4220323, -0.9716635, 0, 1, 0.1607843, 1,
-0.2982722, -0.05867563, -2.006232, 0, 1, 0.1647059, 1,
-0.2933106, -0.5545452, -1.646002, 0, 1, 0.172549, 1,
-0.292823, 0.4035172, 1.664468, 0, 1, 0.1764706, 1,
-0.2902824, 1.267097, -0.1186968, 0, 1, 0.1843137, 1,
-0.2882001, -0.0116776, -1.72118, 0, 1, 0.1882353, 1,
-0.2881151, 1.104466, -1.457265, 0, 1, 0.1960784, 1,
-0.2821299, -0.5005813, -3.660434, 0, 1, 0.2039216, 1,
-0.27891, -1.285011, -1.571547, 0, 1, 0.2078431, 1,
-0.2782815, -1.107377, -4.842875, 0, 1, 0.2156863, 1,
-0.2762452, -1.5636, -3.914889, 0, 1, 0.2196078, 1,
-0.2734541, 0.07589119, -1.158602, 0, 1, 0.227451, 1,
-0.2725984, -0.5973694, -2.85257, 0, 1, 0.2313726, 1,
-0.2706874, -0.07004178, -2.452717, 0, 1, 0.2392157, 1,
-0.2699301, 1.586174, 1.549733, 0, 1, 0.2431373, 1,
-0.2661079, 0.2509321, -0.2877626, 0, 1, 0.2509804, 1,
-0.2647197, 0.9394907, -1.140272, 0, 1, 0.254902, 1,
-0.2627017, -0.3033637, -2.214581, 0, 1, 0.2627451, 1,
-0.2614997, 1.705389, 0.08204372, 0, 1, 0.2666667, 1,
-0.2613742, -2.232102, -3.569914, 0, 1, 0.2745098, 1,
-0.2519936, 0.3684819, -0.9031097, 0, 1, 0.2784314, 1,
-0.2501467, -0.1172946, -1.702705, 0, 1, 0.2862745, 1,
-0.2492891, -1.736918, -3.403106, 0, 1, 0.2901961, 1,
-0.2492173, 1.346616, 0.04658116, 0, 1, 0.2980392, 1,
-0.2491721, -0.4957068, -3.371317, 0, 1, 0.3058824, 1,
-0.2457188, 1.821424, -1.452703, 0, 1, 0.3098039, 1,
-0.245563, -0.8868808, -4.237903, 0, 1, 0.3176471, 1,
-0.2441389, -1.032797, -3.476786, 0, 1, 0.3215686, 1,
-0.242917, -0.5784935, -3.424607, 0, 1, 0.3294118, 1,
-0.2425336, -0.791551, -3.615749, 0, 1, 0.3333333, 1,
-0.2381174, -1.514444, -1.817296, 0, 1, 0.3411765, 1,
-0.2374399, 0.8388661, 0.7482991, 0, 1, 0.345098, 1,
-0.2357182, 1.079375, 1.130871, 0, 1, 0.3529412, 1,
-0.2310174, 2.134615, -1.268157, 0, 1, 0.3568628, 1,
-0.2290955, -0.6530571, -3.185197, 0, 1, 0.3647059, 1,
-0.228995, -0.2517153, -0.8793103, 0, 1, 0.3686275, 1,
-0.2270736, 0.5731522, -0.7664889, 0, 1, 0.3764706, 1,
-0.2176354, 0.7564641, 0.2318124, 0, 1, 0.3803922, 1,
-0.2160654, 1.043732, 1.43183, 0, 1, 0.3882353, 1,
-0.2139353, -1.86535, -1.275208, 0, 1, 0.3921569, 1,
-0.2091714, 0.9656274, -1.42336, 0, 1, 0.4, 1,
-0.2050518, 1.115959, -1.002107, 0, 1, 0.4078431, 1,
-0.2046338, -0.9207772, -1.565447, 0, 1, 0.4117647, 1,
-0.1993844, -0.8872445, -5.06526, 0, 1, 0.4196078, 1,
-0.1992016, 0.3533052, 1.007391, 0, 1, 0.4235294, 1,
-0.1985919, 0.7400317, 1.099281, 0, 1, 0.4313726, 1,
-0.1938629, -0.3030426, -2.68556, 0, 1, 0.4352941, 1,
-0.1922275, 0.5244032, -0.5682507, 0, 1, 0.4431373, 1,
-0.1908009, -1.067315, -3.357433, 0, 1, 0.4470588, 1,
-0.1856521, 1.265817, -0.967332, 0, 1, 0.454902, 1,
-0.1848133, 0.2801631, 0.1179826, 0, 1, 0.4588235, 1,
-0.175457, -1.648335, -4.012444, 0, 1, 0.4666667, 1,
-0.17191, 0.7980747, 0.132992, 0, 1, 0.4705882, 1,
-0.1718248, -1.066968, -4.037889, 0, 1, 0.4784314, 1,
-0.1710442, -0.1231028, -1.39953, 0, 1, 0.4823529, 1,
-0.1627281, 0.6812054, 1.22875, 0, 1, 0.4901961, 1,
-0.162251, 0.9050663, 0.9635288, 0, 1, 0.4941176, 1,
-0.1604658, 0.1663577, -1.774125, 0, 1, 0.5019608, 1,
-0.1593246, 0.9275688, 1.569029, 0, 1, 0.509804, 1,
-0.1546467, 0.676196, -0.2428688, 0, 1, 0.5137255, 1,
-0.1542786, 0.5138097, -1.515236, 0, 1, 0.5215687, 1,
-0.1531274, -0.4516738, -3.375856, 0, 1, 0.5254902, 1,
-0.1521151, 0.2769949, -0.9307542, 0, 1, 0.5333334, 1,
-0.1505659, 0.6942245, 1.224668, 0, 1, 0.5372549, 1,
-0.1502968, 0.02409716, 0.4746672, 0, 1, 0.5450981, 1,
-0.1465199, -0.06381927, -2.338567, 0, 1, 0.5490196, 1,
-0.1454434, 2.872115, 1.224384, 0, 1, 0.5568628, 1,
-0.1412167, -1.966441, -2.472762, 0, 1, 0.5607843, 1,
-0.1373312, 1.72444, 1.454318, 0, 1, 0.5686275, 1,
-0.1357878, -2.17578, -2.671911, 0, 1, 0.572549, 1,
-0.1344483, -1.371367, -4.385649, 0, 1, 0.5803922, 1,
-0.1300075, -0.7313844, -4.495333, 0, 1, 0.5843138, 1,
-0.1268773, -1.310799, -2.399584, 0, 1, 0.5921569, 1,
-0.1256193, 2.500585, 1.409077, 0, 1, 0.5960785, 1,
-0.1252255, -0.4607292, -3.372695, 0, 1, 0.6039216, 1,
-0.1230877, 0.186789, -1.36073, 0, 1, 0.6117647, 1,
-0.1188123, -1.297658, -4.053574, 0, 1, 0.6156863, 1,
-0.1187354, 0.1199061, -0.8980075, 0, 1, 0.6235294, 1,
-0.1162216, 0.1564542, -0.1676804, 0, 1, 0.627451, 1,
-0.1158836, -0.8127434, -3.740745, 0, 1, 0.6352941, 1,
-0.1115503, -0.2508435, -2.733548, 0, 1, 0.6392157, 1,
-0.1084856, -0.6934921, -3.22256, 0, 1, 0.6470588, 1,
-0.1075961, -0.3024804, -2.890642, 0, 1, 0.6509804, 1,
-0.1037797, 0.01474575, 0.6682837, 0, 1, 0.6588235, 1,
-0.09989281, -1.047368, -4.073444, 0, 1, 0.6627451, 1,
-0.09769735, -0.6520013, -2.770913, 0, 1, 0.6705883, 1,
-0.0951438, -1.946531, -3.508641, 0, 1, 0.6745098, 1,
-0.0949213, 0.4220239, 1.448067, 0, 1, 0.682353, 1,
-0.08832977, -0.8605219, -2.934199, 0, 1, 0.6862745, 1,
-0.0834103, 0.795725, -1.560025, 0, 1, 0.6941177, 1,
-0.08193954, 0.1312242, -1.664505, 0, 1, 0.7019608, 1,
-0.0789917, -0.6514037, -3.324083, 0, 1, 0.7058824, 1,
-0.0752579, -1.366785, -0.8911427, 0, 1, 0.7137255, 1,
-0.07460155, 0.6412696, -0.3365595, 0, 1, 0.7176471, 1,
-0.07422706, -0.2198102, -3.962577, 0, 1, 0.7254902, 1,
-0.07415731, 0.3619341, 0.3084872, 0, 1, 0.7294118, 1,
-0.07279872, 1.168008, -0.234382, 0, 1, 0.7372549, 1,
-0.07152888, -0.5238371, -3.360084, 0, 1, 0.7411765, 1,
-0.07056744, -0.418708, -1.970213, 0, 1, 0.7490196, 1,
-0.06707722, 2.033818, 1.151278, 0, 1, 0.7529412, 1,
-0.06636844, -0.7703472, -2.916738, 0, 1, 0.7607843, 1,
-0.06608529, -1.002518, -3.895645, 0, 1, 0.7647059, 1,
-0.06286118, 1.707135, 1.997689, 0, 1, 0.772549, 1,
-0.05589681, -0.6754141, -3.592667, 0, 1, 0.7764706, 1,
-0.04406974, 0.07848038, 0.6104103, 0, 1, 0.7843137, 1,
-0.03830261, 0.6813288, 0.4450009, 0, 1, 0.7882353, 1,
-0.03629993, -1.752126, -3.290455, 0, 1, 0.7960784, 1,
-0.03561354, -0.7058803, -3.331201, 0, 1, 0.8039216, 1,
-0.03558766, 1.216966, 1.932799, 0, 1, 0.8078431, 1,
-0.03139681, -0.8675578, -1.895275, 0, 1, 0.8156863, 1,
-0.02354434, 1.437454, -1.121908, 0, 1, 0.8196079, 1,
-0.02247583, 1.21545, -0.02659269, 0, 1, 0.827451, 1,
-0.02047825, 0.9635706, 0.1074685, 0, 1, 0.8313726, 1,
-0.01642224, 0.2002524, 0.267571, 0, 1, 0.8392157, 1,
-0.01512404, 0.3059521, -0.2596091, 0, 1, 0.8431373, 1,
-0.01443466, -0.6887085, -3.58301, 0, 1, 0.8509804, 1,
-0.01278061, 0.4854985, 1.686664, 0, 1, 0.854902, 1,
-0.008516874, 0.1064718, -0.004880885, 0, 1, 0.8627451, 1,
-0.007581838, -0.4036919, -3.830002, 0, 1, 0.8666667, 1,
-0.00678262, 0.7859514, 1.650322, 0, 1, 0.8745098, 1,
0.0008128316, -0.162812, 2.991948, 0, 1, 0.8784314, 1,
0.001421971, 2.264955, 0.8918132, 0, 1, 0.8862745, 1,
0.00463271, -1.194291, 4.991203, 0, 1, 0.8901961, 1,
0.005296247, -0.2021527, 2.720278, 0, 1, 0.8980392, 1,
0.005864488, 0.8089457, 0.2464978, 0, 1, 0.9058824, 1,
0.007406279, -0.03395705, 2.197008, 0, 1, 0.9098039, 1,
0.01288537, 0.300529, -0.3692376, 0, 1, 0.9176471, 1,
0.01626024, 1.262272, -0.433934, 0, 1, 0.9215686, 1,
0.01842424, 0.4566266, -0.2069204, 0, 1, 0.9294118, 1,
0.01946454, -0.3239711, 2.654731, 0, 1, 0.9333333, 1,
0.02214359, -0.4648728, 1.693627, 0, 1, 0.9411765, 1,
0.02239643, -0.8481716, 2.745121, 0, 1, 0.945098, 1,
0.03345878, -0.2463247, 3.133245, 0, 1, 0.9529412, 1,
0.03447613, -0.3548216, 2.466163, 0, 1, 0.9568627, 1,
0.0346501, 0.05737228, -1.31268, 0, 1, 0.9647059, 1,
0.03840603, -1.858965, 5.055505, 0, 1, 0.9686275, 1,
0.04031167, -0.4754664, 3.992134, 0, 1, 0.9764706, 1,
0.04038525, -0.5816993, 2.532514, 0, 1, 0.9803922, 1,
0.04081955, -0.09099111, 3.683073, 0, 1, 0.9882353, 1,
0.04134941, 0.4647902, 1.518814, 0, 1, 0.9921569, 1,
0.04169349, -1.98451, 1.985437, 0, 1, 1, 1,
0.04307926, 0.04971858, 0.05230444, 0, 0.9921569, 1, 1,
0.04349638, -0.1915877, 1.184751, 0, 0.9882353, 1, 1,
0.04455319, -0.7091841, 0.9876184, 0, 0.9803922, 1, 1,
0.04481267, -0.4964222, 1.29906, 0, 0.9764706, 1, 1,
0.05083917, 1.668662, -0.6060084, 0, 0.9686275, 1, 1,
0.05695437, 0.1086116, 1.293138, 0, 0.9647059, 1, 1,
0.06795026, -0.286543, 2.509929, 0, 0.9568627, 1, 1,
0.06920566, -0.4441709, 3.219849, 0, 0.9529412, 1, 1,
0.07054527, -0.09146846, 1.959737, 0, 0.945098, 1, 1,
0.07265197, -1.083214, 1.542312, 0, 0.9411765, 1, 1,
0.0744181, 1.151637, 0.405336, 0, 0.9333333, 1, 1,
0.07609388, 1.673373, 0.6304961, 0, 0.9294118, 1, 1,
0.08027206, -0.8690935, 3.8388, 0, 0.9215686, 1, 1,
0.08341522, 1.372454, -0.4928308, 0, 0.9176471, 1, 1,
0.08683246, -0.1389448, 3.685651, 0, 0.9098039, 1, 1,
0.08774307, 0.03117603, 1.210534, 0, 0.9058824, 1, 1,
0.09229028, -0.9152167, 4.607095, 0, 0.8980392, 1, 1,
0.1008489, -0.9471079, 2.353714, 0, 0.8901961, 1, 1,
0.10093, 1.175854, 0.2223046, 0, 0.8862745, 1, 1,
0.1082849, 0.2328929, 1.156979, 0, 0.8784314, 1, 1,
0.1103084, -0.1816713, 1.974077, 0, 0.8745098, 1, 1,
0.1146201, -0.9890942, 3.002573, 0, 0.8666667, 1, 1,
0.1177127, 0.2623663, -0.3808364, 0, 0.8627451, 1, 1,
0.1178567, 1.670195, -1.157654, 0, 0.854902, 1, 1,
0.1216222, 0.2720392, -0.2253271, 0, 0.8509804, 1, 1,
0.1224629, -0.339982, 4.985382, 0, 0.8431373, 1, 1,
0.1228544, 0.2027195, 0.1468657, 0, 0.8392157, 1, 1,
0.1243844, 1.398076, 0.2764463, 0, 0.8313726, 1, 1,
0.1311122, -0.3289862, 3.490121, 0, 0.827451, 1, 1,
0.131298, -1.027186, 5.67206, 0, 0.8196079, 1, 1,
0.133185, 0.8206092, -2.171054, 0, 0.8156863, 1, 1,
0.1372986, 1.784361, 0.782436, 0, 0.8078431, 1, 1,
0.1406574, -1.48163, 4.632002, 0, 0.8039216, 1, 1,
0.1413899, -1.588201, 4.011523, 0, 0.7960784, 1, 1,
0.144575, -0.2881819, 3.574672, 0, 0.7882353, 1, 1,
0.1490433, 2.14876, 1.195592, 0, 0.7843137, 1, 1,
0.1509029, 1.194845, 0.152991, 0, 0.7764706, 1, 1,
0.1511267, -0.3215457, 2.552675, 0, 0.772549, 1, 1,
0.1563421, 0.7433302, 0.02737515, 0, 0.7647059, 1, 1,
0.1565885, -1.966725, 3.435113, 0, 0.7607843, 1, 1,
0.1653429, 0.7505844, 0.2814542, 0, 0.7529412, 1, 1,
0.1696678, 0.8447816, -0.6917507, 0, 0.7490196, 1, 1,
0.1715596, 1.490443, -0.1471687, 0, 0.7411765, 1, 1,
0.1727692, -0.2527031, 0.8065704, 0, 0.7372549, 1, 1,
0.1775652, -0.3744777, 2.173387, 0, 0.7294118, 1, 1,
0.1801438, 0.5929199, -1.724613, 0, 0.7254902, 1, 1,
0.1810116, 2.078331, -0.6444225, 0, 0.7176471, 1, 1,
0.1848896, -0.675514, 3.244623, 0, 0.7137255, 1, 1,
0.1873138, 1.651671, 0.357278, 0, 0.7058824, 1, 1,
0.1892133, 0.3148994, 1.381423, 0, 0.6980392, 1, 1,
0.1903855, -0.09544206, 1.389331, 0, 0.6941177, 1, 1,
0.1906392, -1.556229, 3.3225, 0, 0.6862745, 1, 1,
0.1913999, -0.5211128, 4.351357, 0, 0.682353, 1, 1,
0.1928931, 0.2119381, 1.875705, 0, 0.6745098, 1, 1,
0.1937048, 0.6391626, -0.4085326, 0, 0.6705883, 1, 1,
0.1956125, -1.417909, 1.790783, 0, 0.6627451, 1, 1,
0.1960493, 0.5590991, -0.5436611, 0, 0.6588235, 1, 1,
0.1994961, -2.849674, 3.214865, 0, 0.6509804, 1, 1,
0.2023984, 1.686936, -1.787682, 0, 0.6470588, 1, 1,
0.210476, -0.4348309, 3.225683, 0, 0.6392157, 1, 1,
0.2114182, -0.5764065, 4.069032, 0, 0.6352941, 1, 1,
0.2126526, 0.5615264, -0.3805894, 0, 0.627451, 1, 1,
0.2217178, -1.490877, 1.797429, 0, 0.6235294, 1, 1,
0.2260002, -1.347407, 3.660846, 0, 0.6156863, 1, 1,
0.2265423, 1.104749, 0.2068963, 0, 0.6117647, 1, 1,
0.2272207, -1.299856, 2.235218, 0, 0.6039216, 1, 1,
0.2280891, -1.926172, 4.45159, 0, 0.5960785, 1, 1,
0.2340121, 0.6648486, 0.8948725, 0, 0.5921569, 1, 1,
0.2341687, 0.3616879, 0.8485664, 0, 0.5843138, 1, 1,
0.2352642, -0.2647194, 2.365933, 0, 0.5803922, 1, 1,
0.2383396, 0.7734197, 0.1797749, 0, 0.572549, 1, 1,
0.2406994, 0.3557687, 2.128673, 0, 0.5686275, 1, 1,
0.2446866, 0.149565, 0.9582525, 0, 0.5607843, 1, 1,
0.2461494, -0.2681738, 1.713951, 0, 0.5568628, 1, 1,
0.2465446, 0.107227, 1.966198, 0, 0.5490196, 1, 1,
0.2469271, 0.7388381, 0.9368269, 0, 0.5450981, 1, 1,
0.246994, 0.8045467, -0.2990795, 0, 0.5372549, 1, 1,
0.2489745, -1.379272, 3.694163, 0, 0.5333334, 1, 1,
0.2492908, 1.689974, -0.2115012, 0, 0.5254902, 1, 1,
0.2496469, 0.1786716, 0.9937934, 0, 0.5215687, 1, 1,
0.2509438, 1.901641, -0.5681159, 0, 0.5137255, 1, 1,
0.2522519, 0.5957422, 1.816989, 0, 0.509804, 1, 1,
0.2533402, -0.1309718, 1.446074, 0, 0.5019608, 1, 1,
0.2539472, -0.7746894, 2.691876, 0, 0.4941176, 1, 1,
0.2556482, 1.712987, 2.074078, 0, 0.4901961, 1, 1,
0.2611341, 0.9594495, 0.07607014, 0, 0.4823529, 1, 1,
0.2622642, -1.2627, 3.085368, 0, 0.4784314, 1, 1,
0.2628663, -2.17661, 3.171394, 0, 0.4705882, 1, 1,
0.2633296, 1.455567, 0.3188235, 0, 0.4666667, 1, 1,
0.264657, -0.2551752, 1.904481, 0, 0.4588235, 1, 1,
0.2657551, 1.563049, 0.5635905, 0, 0.454902, 1, 1,
0.2673221, -0.956745, 3.900792, 0, 0.4470588, 1, 1,
0.270445, 0.2776578, -0.573025, 0, 0.4431373, 1, 1,
0.2721453, -1.216033, 4.625508, 0, 0.4352941, 1, 1,
0.2730702, -0.8036658, 2.950768, 0, 0.4313726, 1, 1,
0.2789426, -0.2614395, 0.737891, 0, 0.4235294, 1, 1,
0.2834697, -0.9419236, 3.161041, 0, 0.4196078, 1, 1,
0.2970029, 1.319434, -1.026531, 0, 0.4117647, 1, 1,
0.3015184, -0.3285835, 3.64246, 0, 0.4078431, 1, 1,
0.3037716, -0.8547, 3.739374, 0, 0.4, 1, 1,
0.3088251, 0.6711081, 0.4791678, 0, 0.3921569, 1, 1,
0.3096427, 0.3552419, 0.6547694, 0, 0.3882353, 1, 1,
0.3105874, -1.585572, 3.310097, 0, 0.3803922, 1, 1,
0.3106405, 1.210274, -1.504747, 0, 0.3764706, 1, 1,
0.3120668, -0.7907638, 3.72862, 0, 0.3686275, 1, 1,
0.3176022, -0.8404315, 2.589526, 0, 0.3647059, 1, 1,
0.3193074, 1.258793, 0.9598356, 0, 0.3568628, 1, 1,
0.320441, 1.358376, -0.2597847, 0, 0.3529412, 1, 1,
0.3283059, -0.7276685, 4.268614, 0, 0.345098, 1, 1,
0.3349787, -0.08201283, 1.904781, 0, 0.3411765, 1, 1,
0.338281, -0.5496377, 1.480376, 0, 0.3333333, 1, 1,
0.3388172, 1.77223, 0.9140954, 0, 0.3294118, 1, 1,
0.3405907, -1.967114, 1.712517, 0, 0.3215686, 1, 1,
0.3411236, -0.4696317, 2.315995, 0, 0.3176471, 1, 1,
0.3423367, 1.969431, -0.05286332, 0, 0.3098039, 1, 1,
0.3447219, 0.02749681, 0.3568183, 0, 0.3058824, 1, 1,
0.3457827, -0.8304976, 2.333251, 0, 0.2980392, 1, 1,
0.3500173, 1.254954, 0.8468448, 0, 0.2901961, 1, 1,
0.3503885, -1.149814, 3.860323, 0, 0.2862745, 1, 1,
0.3537188, -0.02608459, 1.412839, 0, 0.2784314, 1, 1,
0.3537399, -1.937631, 3.623425, 0, 0.2745098, 1, 1,
0.3600028, 1.936753, 1.535163, 0, 0.2666667, 1, 1,
0.3668297, 0.4387072, -0.2300996, 0, 0.2627451, 1, 1,
0.3690181, 0.5497628, 1.252947, 0, 0.254902, 1, 1,
0.3702097, 0.7536943, 0.1087182, 0, 0.2509804, 1, 1,
0.3703423, 2.022563, 1.221111, 0, 0.2431373, 1, 1,
0.3707248, 0.7232357, 0.7810354, 0, 0.2392157, 1, 1,
0.371145, 0.414658, 2.019243, 0, 0.2313726, 1, 1,
0.3735327, -0.5700797, 2.465329, 0, 0.227451, 1, 1,
0.3736051, -0.5260817, 2.582692, 0, 0.2196078, 1, 1,
0.3774831, -0.9708819, 2.416224, 0, 0.2156863, 1, 1,
0.3820789, -0.4643343, 3.310326, 0, 0.2078431, 1, 1,
0.3835647, 0.4180221, 1.074003, 0, 0.2039216, 1, 1,
0.3850358, 0.04173445, 0.6781052, 0, 0.1960784, 1, 1,
0.385951, 0.1953611, 0.8500559, 0, 0.1882353, 1, 1,
0.3888767, -1.55542, 3.526406, 0, 0.1843137, 1, 1,
0.39316, -0.08114078, 1.944017, 0, 0.1764706, 1, 1,
0.3943457, -0.375979, 2.072546, 0, 0.172549, 1, 1,
0.3953739, -0.1658909, 2.605962, 0, 0.1647059, 1, 1,
0.396874, -0.01509908, 3.078862, 0, 0.1607843, 1, 1,
0.3974557, 0.1477577, 0.3174444, 0, 0.1529412, 1, 1,
0.3981962, -0.2075114, 0.9328682, 0, 0.1490196, 1, 1,
0.3987875, 0.6932148, -0.4204585, 0, 0.1411765, 1, 1,
0.4001335, 1.913815, -0.7088693, 0, 0.1372549, 1, 1,
0.4060332, 0.8815117, 0.9512383, 0, 0.1294118, 1, 1,
0.4072241, 0.2181621, 1.752937, 0, 0.1254902, 1, 1,
0.408583, 0.4969012, 0.6715088, 0, 0.1176471, 1, 1,
0.4094571, 0.03360365, 2.53232, 0, 0.1137255, 1, 1,
0.4147743, 0.8466974, -0.4654792, 0, 0.1058824, 1, 1,
0.4181547, 0.6843796, 1.104568, 0, 0.09803922, 1, 1,
0.4182706, 0.3639525, 0.3358212, 0, 0.09411765, 1, 1,
0.4198431, 0.6215476, -1.078558, 0, 0.08627451, 1, 1,
0.4224543, 0.2936406, 1.404336, 0, 0.08235294, 1, 1,
0.4226815, 0.378526, 3.111913, 0, 0.07450981, 1, 1,
0.4238257, -0.07302284, 0.3482048, 0, 0.07058824, 1, 1,
0.424554, 0.3637557, 0.2052431, 0, 0.0627451, 1, 1,
0.4263259, -0.4427589, 2.564406, 0, 0.05882353, 1, 1,
0.428461, 0.5031654, -1.447481, 0, 0.05098039, 1, 1,
0.4293354, -0.9538782, 2.028114, 0, 0.04705882, 1, 1,
0.4293939, 0.4036743, 2.828118, 0, 0.03921569, 1, 1,
0.429881, 0.7790076, 1.062775, 0, 0.03529412, 1, 1,
0.433496, 0.7426959, 0.9100755, 0, 0.02745098, 1, 1,
0.4339073, -1.00792, 2.366093, 0, 0.02352941, 1, 1,
0.434615, -0.5633785, 3.584591, 0, 0.01568628, 1, 1,
0.4370764, -0.5819887, 2.315897, 0, 0.01176471, 1, 1,
0.4404182, 1.767523, 0.5335605, 0, 0.003921569, 1, 1,
0.4430654, 0.01019097, 1.842553, 0.003921569, 0, 1, 1,
0.4452473, 0.2826711, -0.2637419, 0.007843138, 0, 1, 1,
0.4503512, -0.12246, 2.478072, 0.01568628, 0, 1, 1,
0.4509553, 1.144157, 1.004074, 0.01960784, 0, 1, 1,
0.4535245, -0.430846, 3.579914, 0.02745098, 0, 1, 1,
0.4549683, 0.5218176, -0.6353331, 0.03137255, 0, 1, 1,
0.4570054, -1.469783, 2.2585, 0.03921569, 0, 1, 1,
0.4570918, 0.7949766, -0.7475738, 0.04313726, 0, 1, 1,
0.4580041, -1.373217, 2.309221, 0.05098039, 0, 1, 1,
0.4617642, 1.402212, 0.8175707, 0.05490196, 0, 1, 1,
0.465497, 1.46785, -1.3347, 0.0627451, 0, 1, 1,
0.4658561, -0.2707888, 2.175416, 0.06666667, 0, 1, 1,
0.467349, -0.2187308, 1.807858, 0.07450981, 0, 1, 1,
0.4678218, 1.271365, -0.05910364, 0.07843138, 0, 1, 1,
0.4752839, -1.063525, 2.271267, 0.08627451, 0, 1, 1,
0.4761598, -0.3089001, 2.591874, 0.09019608, 0, 1, 1,
0.4761719, -0.3089092, 2.780629, 0.09803922, 0, 1, 1,
0.4774387, -1.384817, 2.817804, 0.1058824, 0, 1, 1,
0.4781266, -1.134423, 3.624185, 0.1098039, 0, 1, 1,
0.4823434, 1.629724, 0.6302391, 0.1176471, 0, 1, 1,
0.4824894, 0.2793639, 1.871042, 0.1215686, 0, 1, 1,
0.4885069, -0.1100744, 2.113543, 0.1294118, 0, 1, 1,
0.4895273, -1.64991, 1.967395, 0.1333333, 0, 1, 1,
0.4901589, -1.240207, 1.202082, 0.1411765, 0, 1, 1,
0.4916764, 0.5047263, 1.254899, 0.145098, 0, 1, 1,
0.4933057, 2.527849, -1.019967, 0.1529412, 0, 1, 1,
0.4965778, -1.503737, 2.975882, 0.1568628, 0, 1, 1,
0.4975483, 2.295977, -0.4819573, 0.1647059, 0, 1, 1,
0.4995919, 0.7554761, 0.4038416, 0.1686275, 0, 1, 1,
0.4998336, 0.9617277, 1.086491, 0.1764706, 0, 1, 1,
0.4999775, 0.5539725, 1.801097, 0.1803922, 0, 1, 1,
0.5042022, 0.7194228, 0.3956735, 0.1882353, 0, 1, 1,
0.5053603, -1.720496, 2.805498, 0.1921569, 0, 1, 1,
0.5055892, 1.943494, 0.6259211, 0.2, 0, 1, 1,
0.5057418, -1.008505, 2.71214, 0.2078431, 0, 1, 1,
0.5086443, 0.768275, 0.3852135, 0.2117647, 0, 1, 1,
0.5125096, 0.2610899, 0.895331, 0.2196078, 0, 1, 1,
0.5179581, 1.473778, -0.5829743, 0.2235294, 0, 1, 1,
0.5217253, 0.5130028, 0.2649485, 0.2313726, 0, 1, 1,
0.5228127, 1.422925, 0.5039948, 0.2352941, 0, 1, 1,
0.5277841, -0.07065951, 1.421282, 0.2431373, 0, 1, 1,
0.536171, -1.149066, 1.893971, 0.2470588, 0, 1, 1,
0.5398445, 0.5335568, 1.716624, 0.254902, 0, 1, 1,
0.5422683, 0.563239, 0.1702859, 0.2588235, 0, 1, 1,
0.5450423, 0.6219188, 2.187192, 0.2666667, 0, 1, 1,
0.5452271, -0.2780379, 1.665078, 0.2705882, 0, 1, 1,
0.547747, -0.2863936, 1.71636, 0.2784314, 0, 1, 1,
0.5479718, 0.8060031, 0.7974864, 0.282353, 0, 1, 1,
0.5481872, 0.07285082, 1.001843, 0.2901961, 0, 1, 1,
0.5488559, -2.298506, 4.125116, 0.2941177, 0, 1, 1,
0.5504009, 1.037945, 1.398983, 0.3019608, 0, 1, 1,
0.554507, -0.2389126, 2.699883, 0.3098039, 0, 1, 1,
0.5628157, 0.8955013, 1.900885, 0.3137255, 0, 1, 1,
0.5664778, -0.3621246, 2.955161, 0.3215686, 0, 1, 1,
0.5702614, 0.5344968, 0.5665386, 0.3254902, 0, 1, 1,
0.578722, -1.020603, 2.866147, 0.3333333, 0, 1, 1,
0.6018172, -1.024464, 3.572885, 0.3372549, 0, 1, 1,
0.6066906, -0.9780011, 1.066119, 0.345098, 0, 1, 1,
0.6130294, 1.180454, -0.9033622, 0.3490196, 0, 1, 1,
0.6189313, -0.5678133, 2.472811, 0.3568628, 0, 1, 1,
0.6242403, 0.3765426, 1.246488, 0.3607843, 0, 1, 1,
0.6268935, 1.722609, -0.7953, 0.3686275, 0, 1, 1,
0.6271826, 0.2040495, 1.972613, 0.372549, 0, 1, 1,
0.6279685, 0.5912722, 2.025104, 0.3803922, 0, 1, 1,
0.6327262, 1.230813, 1.058271, 0.3843137, 0, 1, 1,
0.6410687, 1.593103, -0.2291039, 0.3921569, 0, 1, 1,
0.641822, -0.09622594, 3.306134, 0.3960784, 0, 1, 1,
0.6476308, -1.244494, 2.782725, 0.4039216, 0, 1, 1,
0.6493555, -0.1939008, -0.3522195, 0.4117647, 0, 1, 1,
0.6508504, -1.610089, 2.131403, 0.4156863, 0, 1, 1,
0.651598, 0.9054793, -1.144329, 0.4235294, 0, 1, 1,
0.653531, -0.8780676, 3.089505, 0.427451, 0, 1, 1,
0.656139, -0.01324641, 0.400175, 0.4352941, 0, 1, 1,
0.6622778, 1.195235, 0.6515887, 0.4392157, 0, 1, 1,
0.6642045, 1.093232, -0.4578029, 0.4470588, 0, 1, 1,
0.6706736, -1.153366, 0.7191291, 0.4509804, 0, 1, 1,
0.6720245, 0.7905949, -0.06758504, 0.4588235, 0, 1, 1,
0.6731581, 1.912573, -0.8436728, 0.4627451, 0, 1, 1,
0.6739656, 1.578094, -0.529635, 0.4705882, 0, 1, 1,
0.6810292, 1.036483, 1.465847, 0.4745098, 0, 1, 1,
0.6888097, 0.5404989, 0.8036738, 0.4823529, 0, 1, 1,
0.6927111, 1.182515, 0.2121781, 0.4862745, 0, 1, 1,
0.6938966, 1.747271, -0.2657354, 0.4941176, 0, 1, 1,
0.6956419, 0.0282022, 0.8553373, 0.5019608, 0, 1, 1,
0.6971906, 0.8751629, 0.3173661, 0.5058824, 0, 1, 1,
0.7008291, 0.7758715, 1.760225, 0.5137255, 0, 1, 1,
0.7020537, -0.8264941, 1.790164, 0.5176471, 0, 1, 1,
0.7132568, -1.73156, 0.8002861, 0.5254902, 0, 1, 1,
0.7202899, -0.05006021, 1.735934, 0.5294118, 0, 1, 1,
0.7215921, 0.313846, 2.451933, 0.5372549, 0, 1, 1,
0.7221464, -0.344218, 3.06462, 0.5411765, 0, 1, 1,
0.7229525, 1.602403, 0.5567645, 0.5490196, 0, 1, 1,
0.7239565, -0.7487491, 2.412081, 0.5529412, 0, 1, 1,
0.7269323, 0.9422057, 0.2093607, 0.5607843, 0, 1, 1,
0.736451, 0.6893461, 1.604426, 0.5647059, 0, 1, 1,
0.7398851, 0.401574, 0.8734303, 0.572549, 0, 1, 1,
0.7464353, -1.648705, 3.083823, 0.5764706, 0, 1, 1,
0.7504918, -2.526921, 2.899629, 0.5843138, 0, 1, 1,
0.7524344, 0.06404004, -0.4026443, 0.5882353, 0, 1, 1,
0.7538902, -0.7802705, 1.677176, 0.5960785, 0, 1, 1,
0.755632, 0.879414, 0.08614098, 0.6039216, 0, 1, 1,
0.7633127, -1.04369, 1.965004, 0.6078432, 0, 1, 1,
0.7638901, 0.6149052, 0.5618865, 0.6156863, 0, 1, 1,
0.7674451, 1.494918, 0.5956303, 0.6196079, 0, 1, 1,
0.7689757, 2.426373, 0.6259728, 0.627451, 0, 1, 1,
0.7693968, -0.2796707, 1.555866, 0.6313726, 0, 1, 1,
0.7770643, 0.8524408, 0.9813961, 0.6392157, 0, 1, 1,
0.7771018, -0.4077223, 1.407685, 0.6431373, 0, 1, 1,
0.7847786, -1.650749, 4.196478, 0.6509804, 0, 1, 1,
0.7918466, 0.1149756, 1.704238, 0.654902, 0, 1, 1,
0.7964329, 1.864026, 1.780724, 0.6627451, 0, 1, 1,
0.7970547, 1.274156, 1.443797, 0.6666667, 0, 1, 1,
0.7975015, -0.4831463, 1.422822, 0.6745098, 0, 1, 1,
0.7984936, 1.341855, -0.4871965, 0.6784314, 0, 1, 1,
0.8016744, 0.6309872, 0.4547289, 0.6862745, 0, 1, 1,
0.8034053, 0.6294412, 1.548469, 0.6901961, 0, 1, 1,
0.8036163, -1.351838, 3.461136, 0.6980392, 0, 1, 1,
0.8063072, 0.1953481, 0.8038675, 0.7058824, 0, 1, 1,
0.8071006, 0.832669, 0.03193131, 0.7098039, 0, 1, 1,
0.808048, 0.9275545, 2.032428, 0.7176471, 0, 1, 1,
0.809479, -0.3741949, 1.191586, 0.7215686, 0, 1, 1,
0.8112533, 2.544723, 1.184707, 0.7294118, 0, 1, 1,
0.8123355, -0.2634611, 2.366273, 0.7333333, 0, 1, 1,
0.8161937, -1.434006, 2.816325, 0.7411765, 0, 1, 1,
0.8164002, -1.194348, 4.394547, 0.7450981, 0, 1, 1,
0.817449, 1.050679, 0.7357147, 0.7529412, 0, 1, 1,
0.820812, 0.4823102, 0.07730699, 0.7568628, 0, 1, 1,
0.8212336, -0.9825318, 3.659219, 0.7647059, 0, 1, 1,
0.8243908, -0.3856004, 3.233727, 0.7686275, 0, 1, 1,
0.8355446, 0.2935968, 3.047766, 0.7764706, 0, 1, 1,
0.8401804, 1.638849, 1.203219, 0.7803922, 0, 1, 1,
0.8478334, -0.3789526, 2.020447, 0.7882353, 0, 1, 1,
0.8499318, -2.506375, 2.759352, 0.7921569, 0, 1, 1,
0.8593611, -1.656471, 1.602161, 0.8, 0, 1, 1,
0.8677061, -0.4747595, 1.608844, 0.8078431, 0, 1, 1,
0.8709885, 0.4215693, 1.052426, 0.8117647, 0, 1, 1,
0.8771184, 0.0125424, 1.888993, 0.8196079, 0, 1, 1,
0.8789608, -1.414436, 2.43843, 0.8235294, 0, 1, 1,
0.88244, -1.418159, 2.458515, 0.8313726, 0, 1, 1,
0.8912352, 1.265228, -0.6360785, 0.8352941, 0, 1, 1,
0.8955808, 0.3440459, 1.895227, 0.8431373, 0, 1, 1,
0.898118, 1.939427, 0.472758, 0.8470588, 0, 1, 1,
0.9002947, -1.211717, 3.945357, 0.854902, 0, 1, 1,
0.9019623, -0.2461911, 1.412149, 0.8588235, 0, 1, 1,
0.9097821, -0.2695932, 0.9792032, 0.8666667, 0, 1, 1,
0.9105722, -0.4524448, 2.391314, 0.8705882, 0, 1, 1,
0.9112163, -0.5307595, 2.396171, 0.8784314, 0, 1, 1,
0.9303598, 0.1813508, 0.7416929, 0.8823529, 0, 1, 1,
0.9316248, 0.466967, 0.29854, 0.8901961, 0, 1, 1,
0.9342688, -0.756804, 1.755996, 0.8941177, 0, 1, 1,
0.9389089, 1.13844, 0.6117669, 0.9019608, 0, 1, 1,
0.944959, -1.064143, 2.011817, 0.9098039, 0, 1, 1,
0.9488642, 0.2609003, 2.494152, 0.9137255, 0, 1, 1,
0.950668, -0.2929724, 1.029865, 0.9215686, 0, 1, 1,
0.9520805, 1.777796, 1.269423, 0.9254902, 0, 1, 1,
0.9525723, -1.045527, 2.723768, 0.9333333, 0, 1, 1,
0.9561366, 1.27095, 1.363527, 0.9372549, 0, 1, 1,
0.9617565, 1.719418, 0.9133963, 0.945098, 0, 1, 1,
0.9631988, -0.2127808, 0.5050598, 0.9490196, 0, 1, 1,
0.9644515, -0.532234, 3.849224, 0.9568627, 0, 1, 1,
0.9655356, -0.8973172, 3.244664, 0.9607843, 0, 1, 1,
0.9692879, 1.003055, 2.270379, 0.9686275, 0, 1, 1,
0.9733595, 0.6052788, 2.041061, 0.972549, 0, 1, 1,
0.9769213, -1.026103, 3.268091, 0.9803922, 0, 1, 1,
0.9794627, -0.886157, 3.376457, 0.9843137, 0, 1, 1,
0.9858818, -0.4444408, 1.738762, 0.9921569, 0, 1, 1,
0.9862456, 0.4086146, 2.419119, 0.9960784, 0, 1, 1,
0.9894704, -0.4541045, 2.546236, 1, 0, 0.9960784, 1,
0.9927952, 1.67487, 1.372179, 1, 0, 0.9882353, 1,
0.9933859, 0.3078954, 1.762664, 1, 0, 0.9843137, 1,
0.9956889, 0.6655239, 1.231139, 1, 0, 0.9764706, 1,
0.9970561, -0.02349822, 1.882545, 1, 0, 0.972549, 1,
1.002874, 0.07886739, 0.8978944, 1, 0, 0.9647059, 1,
1.017989, -0.6530551, 2.611291, 1, 0, 0.9607843, 1,
1.022546, -1.740198, 2.205756, 1, 0, 0.9529412, 1,
1.02274, -0.2570245, 2.138768, 1, 0, 0.9490196, 1,
1.026514, -0.1470679, 3.010768, 1, 0, 0.9411765, 1,
1.032259, 0.3663423, 1.760541, 1, 0, 0.9372549, 1,
1.047422, 0.655076, 0.1538067, 1, 0, 0.9294118, 1,
1.048859, 1.46488, 2.594251, 1, 0, 0.9254902, 1,
1.057203, -0.4544585, 2.130608, 1, 0, 0.9176471, 1,
1.064332, 1.762407, -0.6845557, 1, 0, 0.9137255, 1,
1.067536, -1.374279, 2.401875, 1, 0, 0.9058824, 1,
1.068242, 1.294896, 0.2081217, 1, 0, 0.9019608, 1,
1.068288, 0.1149224, 2.680725, 1, 0, 0.8941177, 1,
1.070713, -1.768939, 2.31592, 1, 0, 0.8862745, 1,
1.075936, 0.5576332, -0.04718163, 1, 0, 0.8823529, 1,
1.080777, -0.01914892, 1.112206, 1, 0, 0.8745098, 1,
1.08176, -1.093249, 2.454331, 1, 0, 0.8705882, 1,
1.08238, -0.4140946, 0.6422738, 1, 0, 0.8627451, 1,
1.090025, -0.08095643, 1.371027, 1, 0, 0.8588235, 1,
1.099727, 0.2872859, 1.513904, 1, 0, 0.8509804, 1,
1.10468, -0.2725395, 1.476413, 1, 0, 0.8470588, 1,
1.1084, 0.3308519, 1.262821, 1, 0, 0.8392157, 1,
1.108803, 0.4759436, 1.493372, 1, 0, 0.8352941, 1,
1.122804, -0.6803627, 2.682728, 1, 0, 0.827451, 1,
1.125255, 0.4491073, 0.9129676, 1, 0, 0.8235294, 1,
1.144102, -0.6048968, 2.354535, 1, 0, 0.8156863, 1,
1.146897, 1.952981, -1.120185, 1, 0, 0.8117647, 1,
1.148119, 0.4115927, 0.9617812, 1, 0, 0.8039216, 1,
1.157053, -0.7813545, 2.45453, 1, 0, 0.7960784, 1,
1.162918, 1.873534, 1.829387, 1, 0, 0.7921569, 1,
1.163197, -0.4404378, 1.841729, 1, 0, 0.7843137, 1,
1.163197, 0.06215796, 1.136901, 1, 0, 0.7803922, 1,
1.163612, -0.9823066, 0.1647227, 1, 0, 0.772549, 1,
1.165478, -0.4239566, 3.197836, 1, 0, 0.7686275, 1,
1.173143, -0.6037958, 2.776228, 1, 0, 0.7607843, 1,
1.18155, 0.9087744, 1.485627, 1, 0, 0.7568628, 1,
1.185545, 0.6800383, 3.455973, 1, 0, 0.7490196, 1,
1.19778, 0.08633757, 1.992172, 1, 0, 0.7450981, 1,
1.202863, 0.07892676, 2.456621, 1, 0, 0.7372549, 1,
1.203053, 2.070427, 0.326481, 1, 0, 0.7333333, 1,
1.20569, 1.307109, 1.409738, 1, 0, 0.7254902, 1,
1.207022, 0.1734876, 2.851555, 1, 0, 0.7215686, 1,
1.207696, 1.391476, 0.326615, 1, 0, 0.7137255, 1,
1.213062, -1.603473, 3.469228, 1, 0, 0.7098039, 1,
1.221021, -0.19341, 2.358562, 1, 0, 0.7019608, 1,
1.231151, -0.4414372, 3.454997, 1, 0, 0.6941177, 1,
1.242746, -0.6350725, 0.1845047, 1, 0, 0.6901961, 1,
1.24313, -0.8968931, 0.8809557, 1, 0, 0.682353, 1,
1.245695, 1.031804, 0.4073464, 1, 0, 0.6784314, 1,
1.249382, 0.6848291, 0.3192073, 1, 0, 0.6705883, 1,
1.258457, -0.5566702, 1.975581, 1, 0, 0.6666667, 1,
1.259939, 1.183069, 0.1563466, 1, 0, 0.6588235, 1,
1.266997, -1.509475, 2.681524, 1, 0, 0.654902, 1,
1.271156, -0.8807436, 3.485833, 1, 0, 0.6470588, 1,
1.271215, 0.6044783, 1.405373, 1, 0, 0.6431373, 1,
1.274128, 0.7657889, 1.582539, 1, 0, 0.6352941, 1,
1.275139, -0.2674805, 2.530104, 1, 0, 0.6313726, 1,
1.286518, -0.977442, 1.073807, 1, 0, 0.6235294, 1,
1.311888, 0.512418, 1.078622, 1, 0, 0.6196079, 1,
1.316245, -1.273895, 1.570202, 1, 0, 0.6117647, 1,
1.32415, 0.5263236, 0.15093, 1, 0, 0.6078432, 1,
1.330796, 0.6756025, -0.05382539, 1, 0, 0.6, 1,
1.34023, 0.4684085, 1.787007, 1, 0, 0.5921569, 1,
1.36413, 1.896665, -0.7830995, 1, 0, 0.5882353, 1,
1.364138, 0.1491479, 1.760704, 1, 0, 0.5803922, 1,
1.373549, 0.8235508, 0.8936878, 1, 0, 0.5764706, 1,
1.381068, 0.5555294, 3.435326, 1, 0, 0.5686275, 1,
1.400197, 1.564644, 1.967857, 1, 0, 0.5647059, 1,
1.409102, -2.497074, 1.219348, 1, 0, 0.5568628, 1,
1.413032, 0.6192707, 0.8520545, 1, 0, 0.5529412, 1,
1.413584, -1.298418, 0.317025, 1, 0, 0.5450981, 1,
1.414245, -0.4330564, -0.1548615, 1, 0, 0.5411765, 1,
1.414776, 1.06547, 1.428384, 1, 0, 0.5333334, 1,
1.418218, 1.320115, -0.5738507, 1, 0, 0.5294118, 1,
1.419979, -0.240699, 1.692961, 1, 0, 0.5215687, 1,
1.423629, -0.7267463, 3.476432, 1, 0, 0.5176471, 1,
1.436471, 0.5915235, 0.4429888, 1, 0, 0.509804, 1,
1.438191, -0.2618684, 3.179016, 1, 0, 0.5058824, 1,
1.447629, -0.3403255, 2.100719, 1, 0, 0.4980392, 1,
1.453955, -0.4537323, 1.736678, 1, 0, 0.4901961, 1,
1.458363, 0.7507847, 1.806322, 1, 0, 0.4862745, 1,
1.47732, -0.5021287, 2.517324, 1, 0, 0.4784314, 1,
1.477448, 0.3147696, 0.2819675, 1, 0, 0.4745098, 1,
1.481414, 0.4839656, 2.180378, 1, 0, 0.4666667, 1,
1.508106, 0.3676228, 1.198836, 1, 0, 0.4627451, 1,
1.527337, 3.013065, 0.7152222, 1, 0, 0.454902, 1,
1.5299, -0.5255202, 2.5037, 1, 0, 0.4509804, 1,
1.533061, -0.3580329, 2.761446, 1, 0, 0.4431373, 1,
1.545296, -0.9582763, 2.824571, 1, 0, 0.4392157, 1,
1.56699, 0.4822618, 1.015244, 1, 0, 0.4313726, 1,
1.574216, -0.2628839, 1.786302, 1, 0, 0.427451, 1,
1.587308, -1.078077, 3.0704, 1, 0, 0.4196078, 1,
1.594797, -1.379793, 3.058029, 1, 0, 0.4156863, 1,
1.596595, 0.1251238, 3.335712, 1, 0, 0.4078431, 1,
1.597802, -0.8506598, 2.317379, 1, 0, 0.4039216, 1,
1.608295, 1.330326, -1.041867, 1, 0, 0.3960784, 1,
1.615986, 1.839945, -0.2327914, 1, 0, 0.3882353, 1,
1.631174, 0.01541602, 1.451883, 1, 0, 0.3843137, 1,
1.642068, 0.8341351, 0.7473281, 1, 0, 0.3764706, 1,
1.64914, 1.281887, 0.6691597, 1, 0, 0.372549, 1,
1.656886, 1.101292, -0.5036367, 1, 0, 0.3647059, 1,
1.667676, 0.3806001, 2.335755, 1, 0, 0.3607843, 1,
1.685529, 0.628542, 0.9716372, 1, 0, 0.3529412, 1,
1.68667, 0.4453264, 1.98266, 1, 0, 0.3490196, 1,
1.689594, -1.259853, 2.156768, 1, 0, 0.3411765, 1,
1.690193, -0.3538322, 1.974103, 1, 0, 0.3372549, 1,
1.694324, 0.0450935, 1.341973, 1, 0, 0.3294118, 1,
1.698414, 1.520095, 1.216889, 1, 0, 0.3254902, 1,
1.706973, -0.4896151, 1.638596, 1, 0, 0.3176471, 1,
1.709869, -0.2108166, -0.2285236, 1, 0, 0.3137255, 1,
1.711542, -0.8299103, 1.146298, 1, 0, 0.3058824, 1,
1.713529, -1.229036, 1.149168, 1, 0, 0.2980392, 1,
1.719692, -0.6804478, 2.349499, 1, 0, 0.2941177, 1,
1.723045, 0.1467354, 1.801113, 1, 0, 0.2862745, 1,
1.768679, 0.1407846, 2.603421, 1, 0, 0.282353, 1,
1.814134, -0.07803955, 1.309209, 1, 0, 0.2745098, 1,
1.830169, -0.06328851, 0.9500268, 1, 0, 0.2705882, 1,
1.835825, -0.006145926, 0.7005869, 1, 0, 0.2627451, 1,
1.842322, 0.5147594, 1.813201, 1, 0, 0.2588235, 1,
1.857454, -0.5756909, 3.714564, 1, 0, 0.2509804, 1,
1.862297, -0.8590882, 2.716196, 1, 0, 0.2470588, 1,
1.866195, 1.560889, 0.7639349, 1, 0, 0.2392157, 1,
1.880241, -0.6758237, 2.165971, 1, 0, 0.2352941, 1,
1.891771, 0.67383, 1.835483, 1, 0, 0.227451, 1,
1.900581, 0.1683597, 2.208226, 1, 0, 0.2235294, 1,
1.901037, 0.2828995, 1.521118, 1, 0, 0.2156863, 1,
1.905571, -3.285536, 2.614776, 1, 0, 0.2117647, 1,
1.943181, -0.7001747, 3.037603, 1, 0, 0.2039216, 1,
1.967616, 1.165637, 0.07640798, 1, 0, 0.1960784, 1,
1.981287, -1.082587, 2.279933, 1, 0, 0.1921569, 1,
1.996691, -1.508767, 2.487959, 1, 0, 0.1843137, 1,
2.006732, 2.506433, 2.187739, 1, 0, 0.1803922, 1,
2.041567, 0.4999953, -0.03272647, 1, 0, 0.172549, 1,
2.05118, -0.07965232, 0.7952915, 1, 0, 0.1686275, 1,
2.056299, 0.6833544, 2.228747, 1, 0, 0.1607843, 1,
2.073368, 0.5086405, 2.420984, 1, 0, 0.1568628, 1,
2.075196, -1.874698, 1.831173, 1, 0, 0.1490196, 1,
2.075954, -0.7863072, 2.650498, 1, 0, 0.145098, 1,
2.115226, -1.306518, 1.498675, 1, 0, 0.1372549, 1,
2.140732, 0.1757974, 0.9624861, 1, 0, 0.1333333, 1,
2.148268, 0.3845801, 1.76466, 1, 0, 0.1254902, 1,
2.211506, 0.3608088, 0.8527499, 1, 0, 0.1215686, 1,
2.220424, -0.08602098, -1.299459, 1, 0, 0.1137255, 1,
2.31425, -0.8961509, 2.674791, 1, 0, 0.1098039, 1,
2.317112, -0.2394065, -0.06390628, 1, 0, 0.1019608, 1,
2.344056, 0.9415071, 0.3241982, 1, 0, 0.09411765, 1,
2.375164, 1.329102, 0.4100996, 1, 0, 0.09019608, 1,
2.404564, 0.6233158, 2.00912, 1, 0, 0.08235294, 1,
2.415233, -0.215966, 1.333451, 1, 0, 0.07843138, 1,
2.430285, -1.65345, 3.275224, 1, 0, 0.07058824, 1,
2.433271, 0.3762364, 1.419176, 1, 0, 0.06666667, 1,
2.443516, -0.7978405, 1.691435, 1, 0, 0.05882353, 1,
2.460055, -0.1430007, -0.1805532, 1, 0, 0.05490196, 1,
2.505029, -0.7050458, 2.435449, 1, 0, 0.04705882, 1,
2.595228, -0.971893, 2.746722, 1, 0, 0.04313726, 1,
2.645904, -0.1568816, 1.770318, 1, 0, 0.03529412, 1,
2.694514, 0.8767713, 0.7354678, 1, 0, 0.03137255, 1,
2.802405, 0.2491926, 2.002787, 1, 0, 0.02352941, 1,
2.813025, 1.622338, 0.4014671, 1, 0, 0.01960784, 1,
3.04959, -0.3543735, 1.499484, 1, 0, 0.01176471, 1,
3.148122, -0.3856518, 0.09535116, 1, 0, 0.007843138, 1
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
-0.02058625, -4.440707, -7.201468, 0, -0.5, 0.5, 0.5,
-0.02058625, -4.440707, -7.201468, 1, -0.5, 0.5, 0.5,
-0.02058625, -4.440707, -7.201468, 1, 1.5, 0.5, 0.5,
-0.02058625, -4.440707, -7.201468, 0, 1.5, 0.5, 0.5
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
-4.263487, 0.1220468, -7.201468, 0, -0.5, 0.5, 0.5,
-4.263487, 0.1220468, -7.201468, 1, -0.5, 0.5, 0.5,
-4.263487, 0.1220468, -7.201468, 1, 1.5, 0.5, 0.5,
-4.263487, 0.1220468, -7.201468, 0, 1.5, 0.5, 0.5
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
-4.263487, -4.440707, 0.1681998, 0, -0.5, 0.5, 0.5,
-4.263487, -4.440707, 0.1681998, 1, -0.5, 0.5, 0.5,
-4.263487, -4.440707, 0.1681998, 1, 1.5, 0.5, 0.5,
-4.263487, -4.440707, 0.1681998, 0, 1.5, 0.5, 0.5
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
-3, -3.387764, -5.500776,
3, -3.387764, -5.500776,
-3, -3.387764, -5.500776,
-3, -3.563254, -5.784225,
-2, -3.387764, -5.500776,
-2, -3.563254, -5.784225,
-1, -3.387764, -5.500776,
-1, -3.563254, -5.784225,
0, -3.387764, -5.500776,
0, -3.563254, -5.784225,
1, -3.387764, -5.500776,
1, -3.563254, -5.784225,
2, -3.387764, -5.500776,
2, -3.563254, -5.784225,
3, -3.387764, -5.500776,
3, -3.563254, -5.784225
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
-3, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
-3, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
-3, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
-3, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5,
-2, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
-2, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
-2, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
-2, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5,
-1, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
-1, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
-1, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
-1, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5,
0, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
0, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
0, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
0, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5,
1, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
1, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
1, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
1, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5,
2, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
2, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
2, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
2, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5,
3, -3.914235, -6.351122, 0, -0.5, 0.5, 0.5,
3, -3.914235, -6.351122, 1, -0.5, 0.5, 0.5,
3, -3.914235, -6.351122, 1, 1.5, 0.5, 0.5,
3, -3.914235, -6.351122, 0, 1.5, 0.5, 0.5
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
-3.284356, -3, -5.500776,
-3.284356, 3, -5.500776,
-3.284356, -3, -5.500776,
-3.447545, -3, -5.784225,
-3.284356, -2, -5.500776,
-3.447545, -2, -5.784225,
-3.284356, -1, -5.500776,
-3.447545, -1, -5.784225,
-3.284356, 0, -5.500776,
-3.447545, 0, -5.784225,
-3.284356, 1, -5.500776,
-3.447545, 1, -5.784225,
-3.284356, 2, -5.500776,
-3.447545, 2, -5.784225,
-3.284356, 3, -5.500776,
-3.447545, 3, -5.784225
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
-3.773921, -3, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, -3, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, -3, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, -3, -6.351122, 0, 1.5, 0.5, 0.5,
-3.773921, -2, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, -2, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, -2, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, -2, -6.351122, 0, 1.5, 0.5, 0.5,
-3.773921, -1, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, -1, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, -1, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, -1, -6.351122, 0, 1.5, 0.5, 0.5,
-3.773921, 0, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, 0, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, 0, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, 0, -6.351122, 0, 1.5, 0.5, 0.5,
-3.773921, 1, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, 1, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, 1, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, 1, -6.351122, 0, 1.5, 0.5, 0.5,
-3.773921, 2, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, 2, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, 2, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, 2, -6.351122, 0, 1.5, 0.5, 0.5,
-3.773921, 3, -6.351122, 0, -0.5, 0.5, 0.5,
-3.773921, 3, -6.351122, 1, -0.5, 0.5, 0.5,
-3.773921, 3, -6.351122, 1, 1.5, 0.5, 0.5,
-3.773921, 3, -6.351122, 0, 1.5, 0.5, 0.5
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
-3.284356, -3.387764, -4,
-3.284356, -3.387764, 4,
-3.284356, -3.387764, -4,
-3.447545, -3.563254, -4,
-3.284356, -3.387764, -2,
-3.447545, -3.563254, -2,
-3.284356, -3.387764, 0,
-3.447545, -3.563254, 0,
-3.284356, -3.387764, 2,
-3.447545, -3.563254, 2,
-3.284356, -3.387764, 4,
-3.447545, -3.563254, 4
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
-3.773921, -3.914235, -4, 0, -0.5, 0.5, 0.5,
-3.773921, -3.914235, -4, 1, -0.5, 0.5, 0.5,
-3.773921, -3.914235, -4, 1, 1.5, 0.5, 0.5,
-3.773921, -3.914235, -4, 0, 1.5, 0.5, 0.5,
-3.773921, -3.914235, -2, 0, -0.5, 0.5, 0.5,
-3.773921, -3.914235, -2, 1, -0.5, 0.5, 0.5,
-3.773921, -3.914235, -2, 1, 1.5, 0.5, 0.5,
-3.773921, -3.914235, -2, 0, 1.5, 0.5, 0.5,
-3.773921, -3.914235, 0, 0, -0.5, 0.5, 0.5,
-3.773921, -3.914235, 0, 1, -0.5, 0.5, 0.5,
-3.773921, -3.914235, 0, 1, 1.5, 0.5, 0.5,
-3.773921, -3.914235, 0, 0, 1.5, 0.5, 0.5,
-3.773921, -3.914235, 2, 0, -0.5, 0.5, 0.5,
-3.773921, -3.914235, 2, 1, -0.5, 0.5, 0.5,
-3.773921, -3.914235, 2, 1, 1.5, 0.5, 0.5,
-3.773921, -3.914235, 2, 0, 1.5, 0.5, 0.5,
-3.773921, -3.914235, 4, 0, -0.5, 0.5, 0.5,
-3.773921, -3.914235, 4, 1, -0.5, 0.5, 0.5,
-3.773921, -3.914235, 4, 1, 1.5, 0.5, 0.5,
-3.773921, -3.914235, 4, 0, 1.5, 0.5, 0.5
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
-3.284356, -3.387764, -5.500776,
-3.284356, 3.631857, -5.500776,
-3.284356, -3.387764, 5.837175,
-3.284356, 3.631857, 5.837175,
-3.284356, -3.387764, -5.500776,
-3.284356, -3.387764, 5.837175,
-3.284356, 3.631857, -5.500776,
-3.284356, 3.631857, 5.837175,
-3.284356, -3.387764, -5.500776,
3.243184, -3.387764, -5.500776,
-3.284356, -3.387764, 5.837175,
3.243184, -3.387764, 5.837175,
-3.284356, 3.631857, -5.500776,
3.243184, 3.631857, -5.500776,
-3.284356, 3.631857, 5.837175,
3.243184, 3.631857, 5.837175,
3.243184, -3.387764, -5.500776,
3.243184, 3.631857, -5.500776,
3.243184, -3.387764, 5.837175,
3.243184, 3.631857, 5.837175,
3.243184, -3.387764, -5.500776,
3.243184, -3.387764, 5.837175,
3.243184, 3.631857, -5.500776,
3.243184, 3.631857, 5.837175
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
var radius = 7.928002;
var distance = 35.27258;
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
mvMatrix.translate( 0.02058625, -0.1220468, -0.1681998 );
mvMatrix.scale( 1.313192, 1.221136, 0.7560371 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.27258);
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
dimethyldithiocarbam<-read.table("dimethyldithiocarbam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethyldithiocarbam$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethyldithiocarbam' not found
```

```r
y<-dimethyldithiocarbam$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethyldithiocarbam' not found
```

```r
z<-dimethyldithiocarbam$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethyldithiocarbam' not found
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
-3.189295, -1.897727, -2.700118, 0, 0, 1, 1, 1,
-3.047022, 0.8379191, 0.3134737, 1, 0, 0, 1, 1,
-2.960393, 0.3262526, -1.896968, 1, 0, 0, 1, 1,
-2.942861, -0.1625341, -1.496763, 1, 0, 0, 1, 1,
-2.829937, 1.579837, 1.902197, 1, 0, 0, 1, 1,
-2.765149, 0.875072, -0.5447837, 1, 0, 0, 1, 1,
-2.534856, 0.3946061, -1.84306, 0, 0, 0, 1, 1,
-2.491907, -0.08841471, -1.935956, 0, 0, 0, 1, 1,
-2.469171, 0.6061152, -1.498904, 0, 0, 0, 1, 1,
-2.343438, 1.045678, -0.458843, 0, 0, 0, 1, 1,
-2.322387, 0.006730601, -1.724775, 0, 0, 0, 1, 1,
-2.313299, 1.757603, -2.207249, 0, 0, 0, 1, 1,
-2.226191, -1.953301, -2.315876, 0, 0, 0, 1, 1,
-2.168602, 0.3107173, -2.50237, 1, 1, 1, 1, 1,
-2.138901, -0.3051141, -1.325194, 1, 1, 1, 1, 1,
-2.130008, 1.079995, -0.4145436, 1, 1, 1, 1, 1,
-2.085817, -0.2163749, -1.752144, 1, 1, 1, 1, 1,
-2.074793, 2.13117, -1.094797, 1, 1, 1, 1, 1,
-2.068962, 1.047019, -1.721399, 1, 1, 1, 1, 1,
-2.053157, 0.8882208, -2.564696, 1, 1, 1, 1, 1,
-2.052792, -0.2170836, -3.819925, 1, 1, 1, 1, 1,
-2.039077, -0.02507837, -1.501341, 1, 1, 1, 1, 1,
-1.934807, 1.542858, -3.038113, 1, 1, 1, 1, 1,
-1.911552, 0.5879667, -1.478044, 1, 1, 1, 1, 1,
-1.901123, -0.2349023, -3.795576, 1, 1, 1, 1, 1,
-1.899439, -0.6403214, -2.952742, 1, 1, 1, 1, 1,
-1.897827, 1.126056, -2.777535, 1, 1, 1, 1, 1,
-1.882649, -0.04579915, -2.239487, 1, 1, 1, 1, 1,
-1.876451, 0.9762714, -1.530595, 0, 0, 1, 1, 1,
-1.840404, 0.02279325, -1.873649, 1, 0, 0, 1, 1,
-1.838945, 0.2048982, 0.1221409, 1, 0, 0, 1, 1,
-1.8315, 0.7226261, -3.350467, 1, 0, 0, 1, 1,
-1.827482, -0.04613449, -1.980376, 1, 0, 0, 1, 1,
-1.801711, 0.361584, -0.4835647, 1, 0, 0, 1, 1,
-1.784384, 0.6393642, -1.074135, 0, 0, 0, 1, 1,
-1.778209, -1.525527, -2.273, 0, 0, 0, 1, 1,
-1.777835, 1.093264, -1.376088, 0, 0, 0, 1, 1,
-1.744529, -0.3813523, -1.904433, 0, 0, 0, 1, 1,
-1.739167, -1.293807, -4.168098, 0, 0, 0, 1, 1,
-1.723828, -0.8749129, -1.86455, 0, 0, 0, 1, 1,
-1.721326, -1.220761, -2.790948, 0, 0, 0, 1, 1,
-1.717286, -2.139543, -3.603046, 1, 1, 1, 1, 1,
-1.708772, -1.030345, -1.039508, 1, 1, 1, 1, 1,
-1.705226, -1.164468, -2.436494, 1, 1, 1, 1, 1,
-1.696616, 0.9566545, -1.291233, 1, 1, 1, 1, 1,
-1.68716, 0.06657004, -2.234462, 1, 1, 1, 1, 1,
-1.686866, 1.4802, -4.033154, 1, 1, 1, 1, 1,
-1.683048, 1.300417, -1.026888, 1, 1, 1, 1, 1,
-1.664543, 0.4051568, -2.253052, 1, 1, 1, 1, 1,
-1.649906, 0.7293895, 0.1079346, 1, 1, 1, 1, 1,
-1.647875, 1.821687, -1.845987, 1, 1, 1, 1, 1,
-1.64343, 2.226506, -2.017952, 1, 1, 1, 1, 1,
-1.641044, -0.3939209, -1.827847, 1, 1, 1, 1, 1,
-1.628494, -0.2545668, -3.550005, 1, 1, 1, 1, 1,
-1.624651, -0.03456237, -2.498126, 1, 1, 1, 1, 1,
-1.617836, -1.15615, -3.079508, 1, 1, 1, 1, 1,
-1.613285, -0.002548442, -1.456883, 0, 0, 1, 1, 1,
-1.608432, 0.8294411, -0.896961, 1, 0, 0, 1, 1,
-1.54807, -0.353675, -2.658103, 1, 0, 0, 1, 1,
-1.54111, 1.151579, -2.508859, 1, 0, 0, 1, 1,
-1.5388, 1.210158, 1.201139, 1, 0, 0, 1, 1,
-1.532435, 0.6829951, 0.7591251, 1, 0, 0, 1, 1,
-1.530313, 0.7985116, -0.05151226, 0, 0, 0, 1, 1,
-1.528873, -0.03935847, -1.433065, 0, 0, 0, 1, 1,
-1.522969, -0.2108618, -1.074823, 0, 0, 0, 1, 1,
-1.509016, -1.331202, -3.230646, 0, 0, 0, 1, 1,
-1.50702, 0.5408146, -0.3970205, 0, 0, 0, 1, 1,
-1.503778, 0.3157131, -0.5896601, 0, 0, 0, 1, 1,
-1.495684, 0.05680612, -0.6412619, 0, 0, 0, 1, 1,
-1.49424, -0.124286, -2.473494, 1, 1, 1, 1, 1,
-1.491035, 0.3575891, -2.342398, 1, 1, 1, 1, 1,
-1.483552, 0.1682004, -2.57949, 1, 1, 1, 1, 1,
-1.482903, 0.2157856, -0.4707538, 1, 1, 1, 1, 1,
-1.481746, 0.9066864, -1.834339, 1, 1, 1, 1, 1,
-1.478814, -0.5687347, 0.2131288, 1, 1, 1, 1, 1,
-1.478125, 0.479344, -1.896401, 1, 1, 1, 1, 1,
-1.477539, -1.934178, -2.424684, 1, 1, 1, 1, 1,
-1.47602, 1.580006, -0.6116431, 1, 1, 1, 1, 1,
-1.47076, -0.1646862, -2.649882, 1, 1, 1, 1, 1,
-1.469863, 1.130233, -0.9189259, 1, 1, 1, 1, 1,
-1.469424, -0.383271, -1.238446, 1, 1, 1, 1, 1,
-1.456732, 1.53879, 0.3650101, 1, 1, 1, 1, 1,
-1.451146, 0.5652977, 0.4873305, 1, 1, 1, 1, 1,
-1.447712, -1.298278, -1.660169, 1, 1, 1, 1, 1,
-1.436593, 0.4131043, -1.948162, 0, 0, 1, 1, 1,
-1.423076, -1.02939, -1.266239, 1, 0, 0, 1, 1,
-1.411459, 0.08074003, -1.216265, 1, 0, 0, 1, 1,
-1.399335, 0.6276923, -0.8006088, 1, 0, 0, 1, 1,
-1.39415, -1.401972, -2.670582, 1, 0, 0, 1, 1,
-1.391295, -1.77882, -3.107579, 1, 0, 0, 1, 1,
-1.385547, 0.09009229, -0.688972, 0, 0, 0, 1, 1,
-1.382756, -2.038895, -3.873368, 0, 0, 0, 1, 1,
-1.376381, 0.7400779, -0.3970971, 0, 0, 0, 1, 1,
-1.375714, -0.6706854, -2.76047, 0, 0, 0, 1, 1,
-1.363052, 0.03113955, -1.960858, 0, 0, 0, 1, 1,
-1.358188, -0.4480377, -2.338223, 0, 0, 0, 1, 1,
-1.333303, -0.3916179, -1.627495, 0, 0, 0, 1, 1,
-1.329035, 0.8161348, -1.589064, 1, 1, 1, 1, 1,
-1.321558, 1.062739, 0.7341369, 1, 1, 1, 1, 1,
-1.312348, -0.1532947, -3.055228, 1, 1, 1, 1, 1,
-1.311736, 0.1053734, -1.636403, 1, 1, 1, 1, 1,
-1.307169, -1.244136, -2.6221, 1, 1, 1, 1, 1,
-1.294253, -0.6956804, -0.5706036, 1, 1, 1, 1, 1,
-1.292652, 1.007361, 0.3475968, 1, 1, 1, 1, 1,
-1.279946, -0.7251438, -1.385309, 1, 1, 1, 1, 1,
-1.278104, 2.515429, -1.240051, 1, 1, 1, 1, 1,
-1.276687, 0.1408852, -1.685516, 1, 1, 1, 1, 1,
-1.272319, -0.7142834, -2.423553, 1, 1, 1, 1, 1,
-1.269151, 0.3982286, -2.668268, 1, 1, 1, 1, 1,
-1.250222, -1.096449, -1.912379, 1, 1, 1, 1, 1,
-1.246146, 0.5183355, -0.06918555, 1, 1, 1, 1, 1,
-1.23287, -0.8654804, -2.62326, 1, 1, 1, 1, 1,
-1.221202, -0.08943392, -0.9433855, 0, 0, 1, 1, 1,
-1.217136, 0.2109963, -1.591356, 1, 0, 0, 1, 1,
-1.217092, 0.7780718, -1.377584, 1, 0, 0, 1, 1,
-1.214255, 1.236945, -1.356116, 1, 0, 0, 1, 1,
-1.213184, 0.4560134, -1.532499, 1, 0, 0, 1, 1,
-1.207449, 1.047915, -2.616315, 1, 0, 0, 1, 1,
-1.203801, 0.4410921, 0.3393429, 0, 0, 0, 1, 1,
-1.18503, -1.04042, -2.607615, 0, 0, 0, 1, 1,
-1.184534, 1.066543, -1.398181, 0, 0, 0, 1, 1,
-1.184018, 0.7506249, 0.2405349, 0, 0, 0, 1, 1,
-1.174395, -1.05986, -2.04089, 0, 0, 0, 1, 1,
-1.169843, 0.3330059, -0.1142189, 0, 0, 0, 1, 1,
-1.167714, 1.679747, 1.936678, 0, 0, 0, 1, 1,
-1.163118, -1.02381, -4.670936, 1, 1, 1, 1, 1,
-1.155727, 1.348188, -0.7020292, 1, 1, 1, 1, 1,
-1.149448, 0.2710566, -1.030793, 1, 1, 1, 1, 1,
-1.148934, 0.7331561, -2.243458, 1, 1, 1, 1, 1,
-1.147205, 0.4702244, 0.6504808, 1, 1, 1, 1, 1,
-1.147005, 0.4240681, 0.2740855, 1, 1, 1, 1, 1,
-1.146656, -2.375891, -3.45222, 1, 1, 1, 1, 1,
-1.137652, 0.002826023, 0.5260983, 1, 1, 1, 1, 1,
-1.107042, -0.007169178, -1.891857, 1, 1, 1, 1, 1,
-1.100673, 0.2806839, -1.265897, 1, 1, 1, 1, 1,
-1.099657, 0.3422929, -0.8241286, 1, 1, 1, 1, 1,
-1.096922, -0.795653, -2.390373, 1, 1, 1, 1, 1,
-1.07192, 0.696866, -2.724724, 1, 1, 1, 1, 1,
-1.051937, -0.9418581, -1.573128, 1, 1, 1, 1, 1,
-1.04094, -0.1419626, -1.133889, 1, 1, 1, 1, 1,
-1.035214, -1.594058, -2.094635, 0, 0, 1, 1, 1,
-1.034842, -1.008685, -1.419611, 1, 0, 0, 1, 1,
-1.028077, 0.8645971, -2.279976, 1, 0, 0, 1, 1,
-1.024066, 0.169645, -2.846702, 1, 0, 0, 1, 1,
-1.013085, 0.1867723, -3.338981, 1, 0, 0, 1, 1,
-1.011686, 1.367315, 1.385857, 1, 0, 0, 1, 1,
-1.010696, 0.9478465, -1.340316, 0, 0, 0, 1, 1,
-0.9988858, -1.185392, -1.239551, 0, 0, 0, 1, 1,
-0.9957345, -0.4467243, -1.869124, 0, 0, 0, 1, 1,
-0.9939098, -1.060874, -2.646071, 0, 0, 0, 1, 1,
-0.9926782, 1.177188, -2.854845, 0, 0, 0, 1, 1,
-0.9897761, -0.4223847, -2.802346, 0, 0, 0, 1, 1,
-0.9893063, 0.008352335, -2.455251, 0, 0, 0, 1, 1,
-0.9866089, -0.5485256, -1.006327, 1, 1, 1, 1, 1,
-0.9847369, -1.96888, -3.768841, 1, 1, 1, 1, 1,
-0.9784302, 2.355924, 0.0175833, 1, 1, 1, 1, 1,
-0.9705239, 1.085978, 0.9363248, 1, 1, 1, 1, 1,
-0.9688262, -0.7249869, -0.8744765, 1, 1, 1, 1, 1,
-0.9672448, -0.5750162, -1.175046, 1, 1, 1, 1, 1,
-0.9644713, 1.318745, 0.2974042, 1, 1, 1, 1, 1,
-0.9572732, 0.3139105, 1.189974, 1, 1, 1, 1, 1,
-0.9540356, -0.05719944, -2.091003, 1, 1, 1, 1, 1,
-0.9531118, 0.4520746, -1.684897, 1, 1, 1, 1, 1,
-0.9526568, -1.040851, -1.730089, 1, 1, 1, 1, 1,
-0.9509521, -2.358615, -3.519572, 1, 1, 1, 1, 1,
-0.9494359, 0.274165, -1.621762, 1, 1, 1, 1, 1,
-0.9459102, 1.521883, -0.9680664, 1, 1, 1, 1, 1,
-0.9425108, 0.2525927, -2.271234, 1, 1, 1, 1, 1,
-0.9344413, -0.5579662, -2.827351, 0, 0, 1, 1, 1,
-0.9322407, -1.032569, -5.017568, 1, 0, 0, 1, 1,
-0.9300503, -0.5610742, -1.736817, 1, 0, 0, 1, 1,
-0.9289112, -0.4289894, -2.239367, 1, 0, 0, 1, 1,
-0.928026, 0.3047408, -1.111326, 1, 0, 0, 1, 1,
-0.9211793, 1.153336, -1.044485, 1, 0, 0, 1, 1,
-0.9201398, 0.8281814, -2.468214, 0, 0, 0, 1, 1,
-0.9194455, -0.3222695, -2.267904, 0, 0, 0, 1, 1,
-0.9128332, 2.087055, -0.131023, 0, 0, 0, 1, 1,
-0.8962787, 0.1036017, -1.742723, 0, 0, 0, 1, 1,
-0.8960676, -0.3311975, -2.229237, 0, 0, 0, 1, 1,
-0.8924652, -0.0221474, -1.235812, 0, 0, 0, 1, 1,
-0.8918836, -0.6898091, -1.523782, 0, 0, 0, 1, 1,
-0.8873942, 0.0231568, 0.01618212, 1, 1, 1, 1, 1,
-0.8860824, 0.1871643, -2.482363, 1, 1, 1, 1, 1,
-0.8842786, -0.7767475, -0.08883262, 1, 1, 1, 1, 1,
-0.8822798, -0.6893245, -0.8252219, 1, 1, 1, 1, 1,
-0.8805889, -1.346034, -1.337592, 1, 1, 1, 1, 1,
-0.8764564, -0.6183501, -3.170269, 1, 1, 1, 1, 1,
-0.8716624, 0.6465821, 0.6253881, 1, 1, 1, 1, 1,
-0.869428, -0.239503, -1.901717, 1, 1, 1, 1, 1,
-0.858251, 0.5611274, -0.7398732, 1, 1, 1, 1, 1,
-0.8565097, 0.5616795, -2.389359, 1, 1, 1, 1, 1,
-0.8551664, 0.8523507, -0.4368321, 1, 1, 1, 1, 1,
-0.8516718, -0.6815473, -1.843469, 1, 1, 1, 1, 1,
-0.8513941, 0.7182024, -1.823248, 1, 1, 1, 1, 1,
-0.8488977, 1.285732, 0.5586784, 1, 1, 1, 1, 1,
-0.8467023, 0.05613165, -1.48819, 1, 1, 1, 1, 1,
-0.8445787, -0.3394113, -3.197726, 0, 0, 1, 1, 1,
-0.8339317, -0.5079346, -1.243296, 1, 0, 0, 1, 1,
-0.8337136, -2.423891, -3.514821, 1, 0, 0, 1, 1,
-0.8279342, -0.4128566, -2.379087, 1, 0, 0, 1, 1,
-0.8262573, 1.552838, -1.637992, 1, 0, 0, 1, 1,
-0.8239871, 0.8489351, -0.461421, 1, 0, 0, 1, 1,
-0.81272, 1.015738, 0.1547079, 0, 0, 0, 1, 1,
-0.8119711, 0.4361827, -1.65035, 0, 0, 0, 1, 1,
-0.8109516, -0.06500334, -1.866566, 0, 0, 0, 1, 1,
-0.8093171, 3.52963, -0.7848241, 0, 0, 0, 1, 1,
-0.8083138, 0.009712002, -1.41168, 0, 0, 0, 1, 1,
-0.80753, -1.306176, -3.127225, 0, 0, 0, 1, 1,
-0.803863, 0.4853179, -0.3359691, 0, 0, 0, 1, 1,
-0.7933475, -0.328159, -4.041606, 1, 1, 1, 1, 1,
-0.7911536, 1.136492, -0.2083416, 1, 1, 1, 1, 1,
-0.7900935, -0.2305556, -1.533303, 1, 1, 1, 1, 1,
-0.7884664, -1.715759, 0.1858647, 1, 1, 1, 1, 1,
-0.7853857, 1.67629, 0.7227651, 1, 1, 1, 1, 1,
-0.782214, -0.7627147, -1.391612, 1, 1, 1, 1, 1,
-0.7773312, -0.5485643, -1.470715, 1, 1, 1, 1, 1,
-0.7717218, 0.1266293, -2.758301, 1, 1, 1, 1, 1,
-0.7701896, 0.02348392, -1.823818, 1, 1, 1, 1, 1,
-0.7697061, 1.437344, -1.009752, 1, 1, 1, 1, 1,
-0.768468, -1.331004, -1.721441, 1, 1, 1, 1, 1,
-0.7630221, 0.2317043, -2.910892, 1, 1, 1, 1, 1,
-0.7609975, 1.554668, -0.1914309, 1, 1, 1, 1, 1,
-0.7594596, 0.5819428, -3.359052, 1, 1, 1, 1, 1,
-0.759059, -0.4170297, -1.843725, 1, 1, 1, 1, 1,
-0.7578208, 0.2246032, -1.237, 0, 0, 1, 1, 1,
-0.7468923, 0.4011174, -1.846401, 1, 0, 0, 1, 1,
-0.7395653, 1.074853, -0.1658242, 1, 0, 0, 1, 1,
-0.7366086, 0.8345674, -0.5185318, 1, 0, 0, 1, 1,
-0.7283988, 0.4863124, -1.516898, 1, 0, 0, 1, 1,
-0.7236517, 0.8193871, -0.7895973, 1, 0, 0, 1, 1,
-0.7150909, 0.9977268, -1.873458, 0, 0, 0, 1, 1,
-0.7147316, 0.6169763, -1.940967, 0, 0, 0, 1, 1,
-0.7091427, 0.8185562, -0.7374673, 0, 0, 0, 1, 1,
-0.7075172, 1.426374, 0.3578669, 0, 0, 0, 1, 1,
-0.7055947, 0.9891759, -1.292753, 0, 0, 0, 1, 1,
-0.7053372, 0.0690907, -1.686308, 0, 0, 0, 1, 1,
-0.7041378, -0.8717092, -3.015647, 0, 0, 0, 1, 1,
-0.7040378, 0.8615626, -0.1357782, 1, 1, 1, 1, 1,
-0.7039473, 0.1812651, -0.6629812, 1, 1, 1, 1, 1,
-0.7010658, 0.8571466, -0.2486648, 1, 1, 1, 1, 1,
-0.7001501, -1.736075, -1.805473, 1, 1, 1, 1, 1,
-0.6998526, 1.445631, -1.813797, 1, 1, 1, 1, 1,
-0.6955256, 0.2096511, -1.986584, 1, 1, 1, 1, 1,
-0.6950739, -1.552671, -1.992219, 1, 1, 1, 1, 1,
-0.6925938, 1.006981, -2.157034, 1, 1, 1, 1, 1,
-0.6897739, -0.06765115, -1.293781, 1, 1, 1, 1, 1,
-0.6894572, 0.843191, -1.165466, 1, 1, 1, 1, 1,
-0.6891613, 0.3533085, -1.558375, 1, 1, 1, 1, 1,
-0.6781546, 1.180026, 1.391389, 1, 1, 1, 1, 1,
-0.6766165, -0.8651826, -1.81396, 1, 1, 1, 1, 1,
-0.6762201, -0.9500849, -1.153285, 1, 1, 1, 1, 1,
-0.6760893, 0.677753, -2.782485, 1, 1, 1, 1, 1,
-0.6734492, -0.1120486, -1.651923, 0, 0, 1, 1, 1,
-0.6717009, -1.398571, -2.606562, 1, 0, 0, 1, 1,
-0.6694753, 0.3440437, 0.3409622, 1, 0, 0, 1, 1,
-0.6664956, 0.3207438, 0.08217137, 1, 0, 0, 1, 1,
-0.6481844, -1.325403, -2.438765, 1, 0, 0, 1, 1,
-0.6438747, -0.6463799, -3.990045, 1, 0, 0, 1, 1,
-0.6436635, -1.238244, -2.30349, 0, 0, 0, 1, 1,
-0.6387383, 1.10018, -1.231594, 0, 0, 0, 1, 1,
-0.6272531, -0.1257028, -1.782025, 0, 0, 0, 1, 1,
-0.6228397, -0.3426704, -2.202843, 0, 0, 0, 1, 1,
-0.6191623, -0.7411413, -3.699356, 0, 0, 0, 1, 1,
-0.6175782, 1.557719, 0.150115, 0, 0, 0, 1, 1,
-0.617555, 1.199914, 0.3806725, 0, 0, 0, 1, 1,
-0.6147745, 0.3246211, -1.674745, 1, 1, 1, 1, 1,
-0.6102077, 0.01228397, -1.600843, 1, 1, 1, 1, 1,
-0.6037787, -1.759435, -2.237998, 1, 1, 1, 1, 1,
-0.6032056, 0.01280332, -2.459243, 1, 1, 1, 1, 1,
-0.601206, -0.1616912, -1.112213, 1, 1, 1, 1, 1,
-0.595655, 0.4109637, 0.789414, 1, 1, 1, 1, 1,
-0.5935982, 1.576478, -0.2214579, 1, 1, 1, 1, 1,
-0.5934356, -1.792473, -2.436332, 1, 1, 1, 1, 1,
-0.5900879, 0.3598708, -0.7076876, 1, 1, 1, 1, 1,
-0.589231, -0.7339063, -3.71591, 1, 1, 1, 1, 1,
-0.5881435, -0.06529527, -1.169583, 1, 1, 1, 1, 1,
-0.5879142, -1.955491, -2.995646, 1, 1, 1, 1, 1,
-0.5859704, -0.2665345, -1.526555, 1, 1, 1, 1, 1,
-0.5699305, -0.3901194, -3.175643, 1, 1, 1, 1, 1,
-0.5694442, 0.5670783, -0.2436202, 1, 1, 1, 1, 1,
-0.5662863, -2.490074, -3.0306, 0, 0, 1, 1, 1,
-0.5620348, 0.5531077, -0.2576344, 1, 0, 0, 1, 1,
-0.5617085, -0.2343596, -2.875556, 1, 0, 0, 1, 1,
-0.5609882, -0.8078547, -3.42238, 1, 0, 0, 1, 1,
-0.5572038, 0.2032719, -1.661978, 1, 0, 0, 1, 1,
-0.5568985, 1.396074, -0.2416408, 1, 0, 0, 1, 1,
-0.5548777, -0.8519748, -4.710902, 0, 0, 0, 1, 1,
-0.5533053, -0.4309165, -2.556683, 0, 0, 0, 1, 1,
-0.5526711, -1.127596, -1.510725, 0, 0, 0, 1, 1,
-0.5476936, -0.687042, -0.9864582, 0, 0, 0, 1, 1,
-0.5458189, -0.5413672, -2.204166, 0, 0, 0, 1, 1,
-0.5328357, 1.645741, -0.1916826, 0, 0, 0, 1, 1,
-0.5321833, 0.2311784, -2.883702, 0, 0, 0, 1, 1,
-0.5315353, 0.5791139, -0.6527265, 1, 1, 1, 1, 1,
-0.5261223, -1.385925, -4.391062, 1, 1, 1, 1, 1,
-0.5218703, -0.5146995, -1.787486, 1, 1, 1, 1, 1,
-0.5208241, -0.03641242, -2.004706, 1, 1, 1, 1, 1,
-0.5204907, -1.872319, -3.872041, 1, 1, 1, 1, 1,
-0.5188009, 0.6983385, -1.979826, 1, 1, 1, 1, 1,
-0.5181804, 0.9472222, 0.2989907, 1, 1, 1, 1, 1,
-0.513498, 0.940245, -0.2207392, 1, 1, 1, 1, 1,
-0.5064872, 0.5481365, 0.05457691, 1, 1, 1, 1, 1,
-0.4962521, 1.589008, -1.241488, 1, 1, 1, 1, 1,
-0.4960204, -0.7958534, -3.202538, 1, 1, 1, 1, 1,
-0.495888, 1.878394, -0.1647546, 1, 1, 1, 1, 1,
-0.4932893, -0.04317627, -2.683583, 1, 1, 1, 1, 1,
-0.4887712, 1.272592, 0.4530094, 1, 1, 1, 1, 1,
-0.4847355, -0.3079475, -2.021716, 1, 1, 1, 1, 1,
-0.4815944, 0.714213, -1.559611, 0, 0, 1, 1, 1,
-0.4779232, 0.1116094, 0.4722684, 1, 0, 0, 1, 1,
-0.4777206, -1.444899, -3.296446, 1, 0, 0, 1, 1,
-0.475574, -1.548824, -0.4811136, 1, 0, 0, 1, 1,
-0.4693391, 0.1902879, -0.220272, 1, 0, 0, 1, 1,
-0.4684533, -1.084507, -1.913029, 1, 0, 0, 1, 1,
-0.463167, -1.772353, -2.499836, 0, 0, 0, 1, 1,
-0.4623968, 1.190493, 0.1897524, 0, 0, 0, 1, 1,
-0.4611349, 1.343642, 0.6020323, 0, 0, 0, 1, 1,
-0.4562979, 0.3897171, -1.434611, 0, 0, 0, 1, 1,
-0.4553713, 1.007429, -0.4391702, 0, 0, 0, 1, 1,
-0.4508395, 0.63155, -1.48208, 0, 0, 0, 1, 1,
-0.4504905, 0.7764505, 0.6900591, 0, 0, 0, 1, 1,
-0.4490268, 1.138028, 0.2851881, 1, 1, 1, 1, 1,
-0.4481145, -1.500402, -3.700969, 1, 1, 1, 1, 1,
-0.4432473, 0.1715206, -0.6808373, 1, 1, 1, 1, 1,
-0.4428463, -2.16536, -2.260652, 1, 1, 1, 1, 1,
-0.4405285, 0.9944874, 0.4437401, 1, 1, 1, 1, 1,
-0.4360265, 1.526441, -2.228415, 1, 1, 1, 1, 1,
-0.4347846, 0.8037398, 1.090289, 1, 1, 1, 1, 1,
-0.4346184, -0.7378727, -5.227961, 1, 1, 1, 1, 1,
-0.4276284, 2.278755, -1.684629, 1, 1, 1, 1, 1,
-0.4252684, -2.00618, -2.713417, 1, 1, 1, 1, 1,
-0.4246097, -1.208561, -2.9168, 1, 1, 1, 1, 1,
-0.4206305, -1.123468, -5.33566, 1, 1, 1, 1, 1,
-0.4193713, 1.826662, -0.8652229, 1, 1, 1, 1, 1,
-0.41752, 0.7373289, -1.543777, 1, 1, 1, 1, 1,
-0.4154955, 0.4657072, -0.7124649, 1, 1, 1, 1, 1,
-0.4136266, 0.4793123, 0.1180258, 0, 0, 1, 1, 1,
-0.4131363, -0.3467819, -0.5783257, 1, 0, 0, 1, 1,
-0.4110202, -0.4045669, -1.148458, 1, 0, 0, 1, 1,
-0.4107238, -1.246431, -2.538632, 1, 0, 0, 1, 1,
-0.4102699, 0.6075468, -1.556596, 1, 0, 0, 1, 1,
-0.3987974, -0.1382312, -1.101952, 1, 0, 0, 1, 1,
-0.3792374, -1.868947, -3.382093, 0, 0, 0, 1, 1,
-0.3787422, -1.734909, -2.871021, 0, 0, 0, 1, 1,
-0.3786762, 0.8749695, 1.29872, 0, 0, 0, 1, 1,
-0.3784342, -0.4173044, -1.413533, 0, 0, 0, 1, 1,
-0.377044, 1.329796, -0.03430503, 0, 0, 0, 1, 1,
-0.3763348, 0.1938296, -1.959962, 0, 0, 0, 1, 1,
-0.3641498, 0.3174576, 1.174531, 0, 0, 0, 1, 1,
-0.3543125, 0.2334418, -1.690527, 1, 1, 1, 1, 1,
-0.3531637, 1.686003, -0.1247567, 1, 1, 1, 1, 1,
-0.3429887, -0.480359, -1.678214, 1, 1, 1, 1, 1,
-0.3353257, -0.4019352, -2.20883, 1, 1, 1, 1, 1,
-0.33233, -1.273813, -2.517528, 1, 1, 1, 1, 1,
-0.3281146, -1.398227, -3.255732, 1, 1, 1, 1, 1,
-0.3221405, 0.7185832, -1.873958, 1, 1, 1, 1, 1,
-0.3188764, -0.6636943, -2.657074, 1, 1, 1, 1, 1,
-0.3172063, -0.2046686, -0.284669, 1, 1, 1, 1, 1,
-0.314071, -0.5076184, -1.2355, 1, 1, 1, 1, 1,
-0.3122338, -0.3402188, -0.8997459, 1, 1, 1, 1, 1,
-0.3072627, 0.4220323, -0.9716635, 1, 1, 1, 1, 1,
-0.2982722, -0.05867563, -2.006232, 1, 1, 1, 1, 1,
-0.2933106, -0.5545452, -1.646002, 1, 1, 1, 1, 1,
-0.292823, 0.4035172, 1.664468, 1, 1, 1, 1, 1,
-0.2902824, 1.267097, -0.1186968, 0, 0, 1, 1, 1,
-0.2882001, -0.0116776, -1.72118, 1, 0, 0, 1, 1,
-0.2881151, 1.104466, -1.457265, 1, 0, 0, 1, 1,
-0.2821299, -0.5005813, -3.660434, 1, 0, 0, 1, 1,
-0.27891, -1.285011, -1.571547, 1, 0, 0, 1, 1,
-0.2782815, -1.107377, -4.842875, 1, 0, 0, 1, 1,
-0.2762452, -1.5636, -3.914889, 0, 0, 0, 1, 1,
-0.2734541, 0.07589119, -1.158602, 0, 0, 0, 1, 1,
-0.2725984, -0.5973694, -2.85257, 0, 0, 0, 1, 1,
-0.2706874, -0.07004178, -2.452717, 0, 0, 0, 1, 1,
-0.2699301, 1.586174, 1.549733, 0, 0, 0, 1, 1,
-0.2661079, 0.2509321, -0.2877626, 0, 0, 0, 1, 1,
-0.2647197, 0.9394907, -1.140272, 0, 0, 0, 1, 1,
-0.2627017, -0.3033637, -2.214581, 1, 1, 1, 1, 1,
-0.2614997, 1.705389, 0.08204372, 1, 1, 1, 1, 1,
-0.2613742, -2.232102, -3.569914, 1, 1, 1, 1, 1,
-0.2519936, 0.3684819, -0.9031097, 1, 1, 1, 1, 1,
-0.2501467, -0.1172946, -1.702705, 1, 1, 1, 1, 1,
-0.2492891, -1.736918, -3.403106, 1, 1, 1, 1, 1,
-0.2492173, 1.346616, 0.04658116, 1, 1, 1, 1, 1,
-0.2491721, -0.4957068, -3.371317, 1, 1, 1, 1, 1,
-0.2457188, 1.821424, -1.452703, 1, 1, 1, 1, 1,
-0.245563, -0.8868808, -4.237903, 1, 1, 1, 1, 1,
-0.2441389, -1.032797, -3.476786, 1, 1, 1, 1, 1,
-0.242917, -0.5784935, -3.424607, 1, 1, 1, 1, 1,
-0.2425336, -0.791551, -3.615749, 1, 1, 1, 1, 1,
-0.2381174, -1.514444, -1.817296, 1, 1, 1, 1, 1,
-0.2374399, 0.8388661, 0.7482991, 1, 1, 1, 1, 1,
-0.2357182, 1.079375, 1.130871, 0, 0, 1, 1, 1,
-0.2310174, 2.134615, -1.268157, 1, 0, 0, 1, 1,
-0.2290955, -0.6530571, -3.185197, 1, 0, 0, 1, 1,
-0.228995, -0.2517153, -0.8793103, 1, 0, 0, 1, 1,
-0.2270736, 0.5731522, -0.7664889, 1, 0, 0, 1, 1,
-0.2176354, 0.7564641, 0.2318124, 1, 0, 0, 1, 1,
-0.2160654, 1.043732, 1.43183, 0, 0, 0, 1, 1,
-0.2139353, -1.86535, -1.275208, 0, 0, 0, 1, 1,
-0.2091714, 0.9656274, -1.42336, 0, 0, 0, 1, 1,
-0.2050518, 1.115959, -1.002107, 0, 0, 0, 1, 1,
-0.2046338, -0.9207772, -1.565447, 0, 0, 0, 1, 1,
-0.1993844, -0.8872445, -5.06526, 0, 0, 0, 1, 1,
-0.1992016, 0.3533052, 1.007391, 0, 0, 0, 1, 1,
-0.1985919, 0.7400317, 1.099281, 1, 1, 1, 1, 1,
-0.1938629, -0.3030426, -2.68556, 1, 1, 1, 1, 1,
-0.1922275, 0.5244032, -0.5682507, 1, 1, 1, 1, 1,
-0.1908009, -1.067315, -3.357433, 1, 1, 1, 1, 1,
-0.1856521, 1.265817, -0.967332, 1, 1, 1, 1, 1,
-0.1848133, 0.2801631, 0.1179826, 1, 1, 1, 1, 1,
-0.175457, -1.648335, -4.012444, 1, 1, 1, 1, 1,
-0.17191, 0.7980747, 0.132992, 1, 1, 1, 1, 1,
-0.1718248, -1.066968, -4.037889, 1, 1, 1, 1, 1,
-0.1710442, -0.1231028, -1.39953, 1, 1, 1, 1, 1,
-0.1627281, 0.6812054, 1.22875, 1, 1, 1, 1, 1,
-0.162251, 0.9050663, 0.9635288, 1, 1, 1, 1, 1,
-0.1604658, 0.1663577, -1.774125, 1, 1, 1, 1, 1,
-0.1593246, 0.9275688, 1.569029, 1, 1, 1, 1, 1,
-0.1546467, 0.676196, -0.2428688, 1, 1, 1, 1, 1,
-0.1542786, 0.5138097, -1.515236, 0, 0, 1, 1, 1,
-0.1531274, -0.4516738, -3.375856, 1, 0, 0, 1, 1,
-0.1521151, 0.2769949, -0.9307542, 1, 0, 0, 1, 1,
-0.1505659, 0.6942245, 1.224668, 1, 0, 0, 1, 1,
-0.1502968, 0.02409716, 0.4746672, 1, 0, 0, 1, 1,
-0.1465199, -0.06381927, -2.338567, 1, 0, 0, 1, 1,
-0.1454434, 2.872115, 1.224384, 0, 0, 0, 1, 1,
-0.1412167, -1.966441, -2.472762, 0, 0, 0, 1, 1,
-0.1373312, 1.72444, 1.454318, 0, 0, 0, 1, 1,
-0.1357878, -2.17578, -2.671911, 0, 0, 0, 1, 1,
-0.1344483, -1.371367, -4.385649, 0, 0, 0, 1, 1,
-0.1300075, -0.7313844, -4.495333, 0, 0, 0, 1, 1,
-0.1268773, -1.310799, -2.399584, 0, 0, 0, 1, 1,
-0.1256193, 2.500585, 1.409077, 1, 1, 1, 1, 1,
-0.1252255, -0.4607292, -3.372695, 1, 1, 1, 1, 1,
-0.1230877, 0.186789, -1.36073, 1, 1, 1, 1, 1,
-0.1188123, -1.297658, -4.053574, 1, 1, 1, 1, 1,
-0.1187354, 0.1199061, -0.8980075, 1, 1, 1, 1, 1,
-0.1162216, 0.1564542, -0.1676804, 1, 1, 1, 1, 1,
-0.1158836, -0.8127434, -3.740745, 1, 1, 1, 1, 1,
-0.1115503, -0.2508435, -2.733548, 1, 1, 1, 1, 1,
-0.1084856, -0.6934921, -3.22256, 1, 1, 1, 1, 1,
-0.1075961, -0.3024804, -2.890642, 1, 1, 1, 1, 1,
-0.1037797, 0.01474575, 0.6682837, 1, 1, 1, 1, 1,
-0.09989281, -1.047368, -4.073444, 1, 1, 1, 1, 1,
-0.09769735, -0.6520013, -2.770913, 1, 1, 1, 1, 1,
-0.0951438, -1.946531, -3.508641, 1, 1, 1, 1, 1,
-0.0949213, 0.4220239, 1.448067, 1, 1, 1, 1, 1,
-0.08832977, -0.8605219, -2.934199, 0, 0, 1, 1, 1,
-0.0834103, 0.795725, -1.560025, 1, 0, 0, 1, 1,
-0.08193954, 0.1312242, -1.664505, 1, 0, 0, 1, 1,
-0.0789917, -0.6514037, -3.324083, 1, 0, 0, 1, 1,
-0.0752579, -1.366785, -0.8911427, 1, 0, 0, 1, 1,
-0.07460155, 0.6412696, -0.3365595, 1, 0, 0, 1, 1,
-0.07422706, -0.2198102, -3.962577, 0, 0, 0, 1, 1,
-0.07415731, 0.3619341, 0.3084872, 0, 0, 0, 1, 1,
-0.07279872, 1.168008, -0.234382, 0, 0, 0, 1, 1,
-0.07152888, -0.5238371, -3.360084, 0, 0, 0, 1, 1,
-0.07056744, -0.418708, -1.970213, 0, 0, 0, 1, 1,
-0.06707722, 2.033818, 1.151278, 0, 0, 0, 1, 1,
-0.06636844, -0.7703472, -2.916738, 0, 0, 0, 1, 1,
-0.06608529, -1.002518, -3.895645, 1, 1, 1, 1, 1,
-0.06286118, 1.707135, 1.997689, 1, 1, 1, 1, 1,
-0.05589681, -0.6754141, -3.592667, 1, 1, 1, 1, 1,
-0.04406974, 0.07848038, 0.6104103, 1, 1, 1, 1, 1,
-0.03830261, 0.6813288, 0.4450009, 1, 1, 1, 1, 1,
-0.03629993, -1.752126, -3.290455, 1, 1, 1, 1, 1,
-0.03561354, -0.7058803, -3.331201, 1, 1, 1, 1, 1,
-0.03558766, 1.216966, 1.932799, 1, 1, 1, 1, 1,
-0.03139681, -0.8675578, -1.895275, 1, 1, 1, 1, 1,
-0.02354434, 1.437454, -1.121908, 1, 1, 1, 1, 1,
-0.02247583, 1.21545, -0.02659269, 1, 1, 1, 1, 1,
-0.02047825, 0.9635706, 0.1074685, 1, 1, 1, 1, 1,
-0.01642224, 0.2002524, 0.267571, 1, 1, 1, 1, 1,
-0.01512404, 0.3059521, -0.2596091, 1, 1, 1, 1, 1,
-0.01443466, -0.6887085, -3.58301, 1, 1, 1, 1, 1,
-0.01278061, 0.4854985, 1.686664, 0, 0, 1, 1, 1,
-0.008516874, 0.1064718, -0.004880885, 1, 0, 0, 1, 1,
-0.007581838, -0.4036919, -3.830002, 1, 0, 0, 1, 1,
-0.00678262, 0.7859514, 1.650322, 1, 0, 0, 1, 1,
0.0008128316, -0.162812, 2.991948, 1, 0, 0, 1, 1,
0.001421971, 2.264955, 0.8918132, 1, 0, 0, 1, 1,
0.00463271, -1.194291, 4.991203, 0, 0, 0, 1, 1,
0.005296247, -0.2021527, 2.720278, 0, 0, 0, 1, 1,
0.005864488, 0.8089457, 0.2464978, 0, 0, 0, 1, 1,
0.007406279, -0.03395705, 2.197008, 0, 0, 0, 1, 1,
0.01288537, 0.300529, -0.3692376, 0, 0, 0, 1, 1,
0.01626024, 1.262272, -0.433934, 0, 0, 0, 1, 1,
0.01842424, 0.4566266, -0.2069204, 0, 0, 0, 1, 1,
0.01946454, -0.3239711, 2.654731, 1, 1, 1, 1, 1,
0.02214359, -0.4648728, 1.693627, 1, 1, 1, 1, 1,
0.02239643, -0.8481716, 2.745121, 1, 1, 1, 1, 1,
0.03345878, -0.2463247, 3.133245, 1, 1, 1, 1, 1,
0.03447613, -0.3548216, 2.466163, 1, 1, 1, 1, 1,
0.0346501, 0.05737228, -1.31268, 1, 1, 1, 1, 1,
0.03840603, -1.858965, 5.055505, 1, 1, 1, 1, 1,
0.04031167, -0.4754664, 3.992134, 1, 1, 1, 1, 1,
0.04038525, -0.5816993, 2.532514, 1, 1, 1, 1, 1,
0.04081955, -0.09099111, 3.683073, 1, 1, 1, 1, 1,
0.04134941, 0.4647902, 1.518814, 1, 1, 1, 1, 1,
0.04169349, -1.98451, 1.985437, 1, 1, 1, 1, 1,
0.04307926, 0.04971858, 0.05230444, 1, 1, 1, 1, 1,
0.04349638, -0.1915877, 1.184751, 1, 1, 1, 1, 1,
0.04455319, -0.7091841, 0.9876184, 1, 1, 1, 1, 1,
0.04481267, -0.4964222, 1.29906, 0, 0, 1, 1, 1,
0.05083917, 1.668662, -0.6060084, 1, 0, 0, 1, 1,
0.05695437, 0.1086116, 1.293138, 1, 0, 0, 1, 1,
0.06795026, -0.286543, 2.509929, 1, 0, 0, 1, 1,
0.06920566, -0.4441709, 3.219849, 1, 0, 0, 1, 1,
0.07054527, -0.09146846, 1.959737, 1, 0, 0, 1, 1,
0.07265197, -1.083214, 1.542312, 0, 0, 0, 1, 1,
0.0744181, 1.151637, 0.405336, 0, 0, 0, 1, 1,
0.07609388, 1.673373, 0.6304961, 0, 0, 0, 1, 1,
0.08027206, -0.8690935, 3.8388, 0, 0, 0, 1, 1,
0.08341522, 1.372454, -0.4928308, 0, 0, 0, 1, 1,
0.08683246, -0.1389448, 3.685651, 0, 0, 0, 1, 1,
0.08774307, 0.03117603, 1.210534, 0, 0, 0, 1, 1,
0.09229028, -0.9152167, 4.607095, 1, 1, 1, 1, 1,
0.1008489, -0.9471079, 2.353714, 1, 1, 1, 1, 1,
0.10093, 1.175854, 0.2223046, 1, 1, 1, 1, 1,
0.1082849, 0.2328929, 1.156979, 1, 1, 1, 1, 1,
0.1103084, -0.1816713, 1.974077, 1, 1, 1, 1, 1,
0.1146201, -0.9890942, 3.002573, 1, 1, 1, 1, 1,
0.1177127, 0.2623663, -0.3808364, 1, 1, 1, 1, 1,
0.1178567, 1.670195, -1.157654, 1, 1, 1, 1, 1,
0.1216222, 0.2720392, -0.2253271, 1, 1, 1, 1, 1,
0.1224629, -0.339982, 4.985382, 1, 1, 1, 1, 1,
0.1228544, 0.2027195, 0.1468657, 1, 1, 1, 1, 1,
0.1243844, 1.398076, 0.2764463, 1, 1, 1, 1, 1,
0.1311122, -0.3289862, 3.490121, 1, 1, 1, 1, 1,
0.131298, -1.027186, 5.67206, 1, 1, 1, 1, 1,
0.133185, 0.8206092, -2.171054, 1, 1, 1, 1, 1,
0.1372986, 1.784361, 0.782436, 0, 0, 1, 1, 1,
0.1406574, -1.48163, 4.632002, 1, 0, 0, 1, 1,
0.1413899, -1.588201, 4.011523, 1, 0, 0, 1, 1,
0.144575, -0.2881819, 3.574672, 1, 0, 0, 1, 1,
0.1490433, 2.14876, 1.195592, 1, 0, 0, 1, 1,
0.1509029, 1.194845, 0.152991, 1, 0, 0, 1, 1,
0.1511267, -0.3215457, 2.552675, 0, 0, 0, 1, 1,
0.1563421, 0.7433302, 0.02737515, 0, 0, 0, 1, 1,
0.1565885, -1.966725, 3.435113, 0, 0, 0, 1, 1,
0.1653429, 0.7505844, 0.2814542, 0, 0, 0, 1, 1,
0.1696678, 0.8447816, -0.6917507, 0, 0, 0, 1, 1,
0.1715596, 1.490443, -0.1471687, 0, 0, 0, 1, 1,
0.1727692, -0.2527031, 0.8065704, 0, 0, 0, 1, 1,
0.1775652, -0.3744777, 2.173387, 1, 1, 1, 1, 1,
0.1801438, 0.5929199, -1.724613, 1, 1, 1, 1, 1,
0.1810116, 2.078331, -0.6444225, 1, 1, 1, 1, 1,
0.1848896, -0.675514, 3.244623, 1, 1, 1, 1, 1,
0.1873138, 1.651671, 0.357278, 1, 1, 1, 1, 1,
0.1892133, 0.3148994, 1.381423, 1, 1, 1, 1, 1,
0.1903855, -0.09544206, 1.389331, 1, 1, 1, 1, 1,
0.1906392, -1.556229, 3.3225, 1, 1, 1, 1, 1,
0.1913999, -0.5211128, 4.351357, 1, 1, 1, 1, 1,
0.1928931, 0.2119381, 1.875705, 1, 1, 1, 1, 1,
0.1937048, 0.6391626, -0.4085326, 1, 1, 1, 1, 1,
0.1956125, -1.417909, 1.790783, 1, 1, 1, 1, 1,
0.1960493, 0.5590991, -0.5436611, 1, 1, 1, 1, 1,
0.1994961, -2.849674, 3.214865, 1, 1, 1, 1, 1,
0.2023984, 1.686936, -1.787682, 1, 1, 1, 1, 1,
0.210476, -0.4348309, 3.225683, 0, 0, 1, 1, 1,
0.2114182, -0.5764065, 4.069032, 1, 0, 0, 1, 1,
0.2126526, 0.5615264, -0.3805894, 1, 0, 0, 1, 1,
0.2217178, -1.490877, 1.797429, 1, 0, 0, 1, 1,
0.2260002, -1.347407, 3.660846, 1, 0, 0, 1, 1,
0.2265423, 1.104749, 0.2068963, 1, 0, 0, 1, 1,
0.2272207, -1.299856, 2.235218, 0, 0, 0, 1, 1,
0.2280891, -1.926172, 4.45159, 0, 0, 0, 1, 1,
0.2340121, 0.6648486, 0.8948725, 0, 0, 0, 1, 1,
0.2341687, 0.3616879, 0.8485664, 0, 0, 0, 1, 1,
0.2352642, -0.2647194, 2.365933, 0, 0, 0, 1, 1,
0.2383396, 0.7734197, 0.1797749, 0, 0, 0, 1, 1,
0.2406994, 0.3557687, 2.128673, 0, 0, 0, 1, 1,
0.2446866, 0.149565, 0.9582525, 1, 1, 1, 1, 1,
0.2461494, -0.2681738, 1.713951, 1, 1, 1, 1, 1,
0.2465446, 0.107227, 1.966198, 1, 1, 1, 1, 1,
0.2469271, 0.7388381, 0.9368269, 1, 1, 1, 1, 1,
0.246994, 0.8045467, -0.2990795, 1, 1, 1, 1, 1,
0.2489745, -1.379272, 3.694163, 1, 1, 1, 1, 1,
0.2492908, 1.689974, -0.2115012, 1, 1, 1, 1, 1,
0.2496469, 0.1786716, 0.9937934, 1, 1, 1, 1, 1,
0.2509438, 1.901641, -0.5681159, 1, 1, 1, 1, 1,
0.2522519, 0.5957422, 1.816989, 1, 1, 1, 1, 1,
0.2533402, -0.1309718, 1.446074, 1, 1, 1, 1, 1,
0.2539472, -0.7746894, 2.691876, 1, 1, 1, 1, 1,
0.2556482, 1.712987, 2.074078, 1, 1, 1, 1, 1,
0.2611341, 0.9594495, 0.07607014, 1, 1, 1, 1, 1,
0.2622642, -1.2627, 3.085368, 1, 1, 1, 1, 1,
0.2628663, -2.17661, 3.171394, 0, 0, 1, 1, 1,
0.2633296, 1.455567, 0.3188235, 1, 0, 0, 1, 1,
0.264657, -0.2551752, 1.904481, 1, 0, 0, 1, 1,
0.2657551, 1.563049, 0.5635905, 1, 0, 0, 1, 1,
0.2673221, -0.956745, 3.900792, 1, 0, 0, 1, 1,
0.270445, 0.2776578, -0.573025, 1, 0, 0, 1, 1,
0.2721453, -1.216033, 4.625508, 0, 0, 0, 1, 1,
0.2730702, -0.8036658, 2.950768, 0, 0, 0, 1, 1,
0.2789426, -0.2614395, 0.737891, 0, 0, 0, 1, 1,
0.2834697, -0.9419236, 3.161041, 0, 0, 0, 1, 1,
0.2970029, 1.319434, -1.026531, 0, 0, 0, 1, 1,
0.3015184, -0.3285835, 3.64246, 0, 0, 0, 1, 1,
0.3037716, -0.8547, 3.739374, 0, 0, 0, 1, 1,
0.3088251, 0.6711081, 0.4791678, 1, 1, 1, 1, 1,
0.3096427, 0.3552419, 0.6547694, 1, 1, 1, 1, 1,
0.3105874, -1.585572, 3.310097, 1, 1, 1, 1, 1,
0.3106405, 1.210274, -1.504747, 1, 1, 1, 1, 1,
0.3120668, -0.7907638, 3.72862, 1, 1, 1, 1, 1,
0.3176022, -0.8404315, 2.589526, 1, 1, 1, 1, 1,
0.3193074, 1.258793, 0.9598356, 1, 1, 1, 1, 1,
0.320441, 1.358376, -0.2597847, 1, 1, 1, 1, 1,
0.3283059, -0.7276685, 4.268614, 1, 1, 1, 1, 1,
0.3349787, -0.08201283, 1.904781, 1, 1, 1, 1, 1,
0.338281, -0.5496377, 1.480376, 1, 1, 1, 1, 1,
0.3388172, 1.77223, 0.9140954, 1, 1, 1, 1, 1,
0.3405907, -1.967114, 1.712517, 1, 1, 1, 1, 1,
0.3411236, -0.4696317, 2.315995, 1, 1, 1, 1, 1,
0.3423367, 1.969431, -0.05286332, 1, 1, 1, 1, 1,
0.3447219, 0.02749681, 0.3568183, 0, 0, 1, 1, 1,
0.3457827, -0.8304976, 2.333251, 1, 0, 0, 1, 1,
0.3500173, 1.254954, 0.8468448, 1, 0, 0, 1, 1,
0.3503885, -1.149814, 3.860323, 1, 0, 0, 1, 1,
0.3537188, -0.02608459, 1.412839, 1, 0, 0, 1, 1,
0.3537399, -1.937631, 3.623425, 1, 0, 0, 1, 1,
0.3600028, 1.936753, 1.535163, 0, 0, 0, 1, 1,
0.3668297, 0.4387072, -0.2300996, 0, 0, 0, 1, 1,
0.3690181, 0.5497628, 1.252947, 0, 0, 0, 1, 1,
0.3702097, 0.7536943, 0.1087182, 0, 0, 0, 1, 1,
0.3703423, 2.022563, 1.221111, 0, 0, 0, 1, 1,
0.3707248, 0.7232357, 0.7810354, 0, 0, 0, 1, 1,
0.371145, 0.414658, 2.019243, 0, 0, 0, 1, 1,
0.3735327, -0.5700797, 2.465329, 1, 1, 1, 1, 1,
0.3736051, -0.5260817, 2.582692, 1, 1, 1, 1, 1,
0.3774831, -0.9708819, 2.416224, 1, 1, 1, 1, 1,
0.3820789, -0.4643343, 3.310326, 1, 1, 1, 1, 1,
0.3835647, 0.4180221, 1.074003, 1, 1, 1, 1, 1,
0.3850358, 0.04173445, 0.6781052, 1, 1, 1, 1, 1,
0.385951, 0.1953611, 0.8500559, 1, 1, 1, 1, 1,
0.3888767, -1.55542, 3.526406, 1, 1, 1, 1, 1,
0.39316, -0.08114078, 1.944017, 1, 1, 1, 1, 1,
0.3943457, -0.375979, 2.072546, 1, 1, 1, 1, 1,
0.3953739, -0.1658909, 2.605962, 1, 1, 1, 1, 1,
0.396874, -0.01509908, 3.078862, 1, 1, 1, 1, 1,
0.3974557, 0.1477577, 0.3174444, 1, 1, 1, 1, 1,
0.3981962, -0.2075114, 0.9328682, 1, 1, 1, 1, 1,
0.3987875, 0.6932148, -0.4204585, 1, 1, 1, 1, 1,
0.4001335, 1.913815, -0.7088693, 0, 0, 1, 1, 1,
0.4060332, 0.8815117, 0.9512383, 1, 0, 0, 1, 1,
0.4072241, 0.2181621, 1.752937, 1, 0, 0, 1, 1,
0.408583, 0.4969012, 0.6715088, 1, 0, 0, 1, 1,
0.4094571, 0.03360365, 2.53232, 1, 0, 0, 1, 1,
0.4147743, 0.8466974, -0.4654792, 1, 0, 0, 1, 1,
0.4181547, 0.6843796, 1.104568, 0, 0, 0, 1, 1,
0.4182706, 0.3639525, 0.3358212, 0, 0, 0, 1, 1,
0.4198431, 0.6215476, -1.078558, 0, 0, 0, 1, 1,
0.4224543, 0.2936406, 1.404336, 0, 0, 0, 1, 1,
0.4226815, 0.378526, 3.111913, 0, 0, 0, 1, 1,
0.4238257, -0.07302284, 0.3482048, 0, 0, 0, 1, 1,
0.424554, 0.3637557, 0.2052431, 0, 0, 0, 1, 1,
0.4263259, -0.4427589, 2.564406, 1, 1, 1, 1, 1,
0.428461, 0.5031654, -1.447481, 1, 1, 1, 1, 1,
0.4293354, -0.9538782, 2.028114, 1, 1, 1, 1, 1,
0.4293939, 0.4036743, 2.828118, 1, 1, 1, 1, 1,
0.429881, 0.7790076, 1.062775, 1, 1, 1, 1, 1,
0.433496, 0.7426959, 0.9100755, 1, 1, 1, 1, 1,
0.4339073, -1.00792, 2.366093, 1, 1, 1, 1, 1,
0.434615, -0.5633785, 3.584591, 1, 1, 1, 1, 1,
0.4370764, -0.5819887, 2.315897, 1, 1, 1, 1, 1,
0.4404182, 1.767523, 0.5335605, 1, 1, 1, 1, 1,
0.4430654, 0.01019097, 1.842553, 1, 1, 1, 1, 1,
0.4452473, 0.2826711, -0.2637419, 1, 1, 1, 1, 1,
0.4503512, -0.12246, 2.478072, 1, 1, 1, 1, 1,
0.4509553, 1.144157, 1.004074, 1, 1, 1, 1, 1,
0.4535245, -0.430846, 3.579914, 1, 1, 1, 1, 1,
0.4549683, 0.5218176, -0.6353331, 0, 0, 1, 1, 1,
0.4570054, -1.469783, 2.2585, 1, 0, 0, 1, 1,
0.4570918, 0.7949766, -0.7475738, 1, 0, 0, 1, 1,
0.4580041, -1.373217, 2.309221, 1, 0, 0, 1, 1,
0.4617642, 1.402212, 0.8175707, 1, 0, 0, 1, 1,
0.465497, 1.46785, -1.3347, 1, 0, 0, 1, 1,
0.4658561, -0.2707888, 2.175416, 0, 0, 0, 1, 1,
0.467349, -0.2187308, 1.807858, 0, 0, 0, 1, 1,
0.4678218, 1.271365, -0.05910364, 0, 0, 0, 1, 1,
0.4752839, -1.063525, 2.271267, 0, 0, 0, 1, 1,
0.4761598, -0.3089001, 2.591874, 0, 0, 0, 1, 1,
0.4761719, -0.3089092, 2.780629, 0, 0, 0, 1, 1,
0.4774387, -1.384817, 2.817804, 0, 0, 0, 1, 1,
0.4781266, -1.134423, 3.624185, 1, 1, 1, 1, 1,
0.4823434, 1.629724, 0.6302391, 1, 1, 1, 1, 1,
0.4824894, 0.2793639, 1.871042, 1, 1, 1, 1, 1,
0.4885069, -0.1100744, 2.113543, 1, 1, 1, 1, 1,
0.4895273, -1.64991, 1.967395, 1, 1, 1, 1, 1,
0.4901589, -1.240207, 1.202082, 1, 1, 1, 1, 1,
0.4916764, 0.5047263, 1.254899, 1, 1, 1, 1, 1,
0.4933057, 2.527849, -1.019967, 1, 1, 1, 1, 1,
0.4965778, -1.503737, 2.975882, 1, 1, 1, 1, 1,
0.4975483, 2.295977, -0.4819573, 1, 1, 1, 1, 1,
0.4995919, 0.7554761, 0.4038416, 1, 1, 1, 1, 1,
0.4998336, 0.9617277, 1.086491, 1, 1, 1, 1, 1,
0.4999775, 0.5539725, 1.801097, 1, 1, 1, 1, 1,
0.5042022, 0.7194228, 0.3956735, 1, 1, 1, 1, 1,
0.5053603, -1.720496, 2.805498, 1, 1, 1, 1, 1,
0.5055892, 1.943494, 0.6259211, 0, 0, 1, 1, 1,
0.5057418, -1.008505, 2.71214, 1, 0, 0, 1, 1,
0.5086443, 0.768275, 0.3852135, 1, 0, 0, 1, 1,
0.5125096, 0.2610899, 0.895331, 1, 0, 0, 1, 1,
0.5179581, 1.473778, -0.5829743, 1, 0, 0, 1, 1,
0.5217253, 0.5130028, 0.2649485, 1, 0, 0, 1, 1,
0.5228127, 1.422925, 0.5039948, 0, 0, 0, 1, 1,
0.5277841, -0.07065951, 1.421282, 0, 0, 0, 1, 1,
0.536171, -1.149066, 1.893971, 0, 0, 0, 1, 1,
0.5398445, 0.5335568, 1.716624, 0, 0, 0, 1, 1,
0.5422683, 0.563239, 0.1702859, 0, 0, 0, 1, 1,
0.5450423, 0.6219188, 2.187192, 0, 0, 0, 1, 1,
0.5452271, -0.2780379, 1.665078, 0, 0, 0, 1, 1,
0.547747, -0.2863936, 1.71636, 1, 1, 1, 1, 1,
0.5479718, 0.8060031, 0.7974864, 1, 1, 1, 1, 1,
0.5481872, 0.07285082, 1.001843, 1, 1, 1, 1, 1,
0.5488559, -2.298506, 4.125116, 1, 1, 1, 1, 1,
0.5504009, 1.037945, 1.398983, 1, 1, 1, 1, 1,
0.554507, -0.2389126, 2.699883, 1, 1, 1, 1, 1,
0.5628157, 0.8955013, 1.900885, 1, 1, 1, 1, 1,
0.5664778, -0.3621246, 2.955161, 1, 1, 1, 1, 1,
0.5702614, 0.5344968, 0.5665386, 1, 1, 1, 1, 1,
0.578722, -1.020603, 2.866147, 1, 1, 1, 1, 1,
0.6018172, -1.024464, 3.572885, 1, 1, 1, 1, 1,
0.6066906, -0.9780011, 1.066119, 1, 1, 1, 1, 1,
0.6130294, 1.180454, -0.9033622, 1, 1, 1, 1, 1,
0.6189313, -0.5678133, 2.472811, 1, 1, 1, 1, 1,
0.6242403, 0.3765426, 1.246488, 1, 1, 1, 1, 1,
0.6268935, 1.722609, -0.7953, 0, 0, 1, 1, 1,
0.6271826, 0.2040495, 1.972613, 1, 0, 0, 1, 1,
0.6279685, 0.5912722, 2.025104, 1, 0, 0, 1, 1,
0.6327262, 1.230813, 1.058271, 1, 0, 0, 1, 1,
0.6410687, 1.593103, -0.2291039, 1, 0, 0, 1, 1,
0.641822, -0.09622594, 3.306134, 1, 0, 0, 1, 1,
0.6476308, -1.244494, 2.782725, 0, 0, 0, 1, 1,
0.6493555, -0.1939008, -0.3522195, 0, 0, 0, 1, 1,
0.6508504, -1.610089, 2.131403, 0, 0, 0, 1, 1,
0.651598, 0.9054793, -1.144329, 0, 0, 0, 1, 1,
0.653531, -0.8780676, 3.089505, 0, 0, 0, 1, 1,
0.656139, -0.01324641, 0.400175, 0, 0, 0, 1, 1,
0.6622778, 1.195235, 0.6515887, 0, 0, 0, 1, 1,
0.6642045, 1.093232, -0.4578029, 1, 1, 1, 1, 1,
0.6706736, -1.153366, 0.7191291, 1, 1, 1, 1, 1,
0.6720245, 0.7905949, -0.06758504, 1, 1, 1, 1, 1,
0.6731581, 1.912573, -0.8436728, 1, 1, 1, 1, 1,
0.6739656, 1.578094, -0.529635, 1, 1, 1, 1, 1,
0.6810292, 1.036483, 1.465847, 1, 1, 1, 1, 1,
0.6888097, 0.5404989, 0.8036738, 1, 1, 1, 1, 1,
0.6927111, 1.182515, 0.2121781, 1, 1, 1, 1, 1,
0.6938966, 1.747271, -0.2657354, 1, 1, 1, 1, 1,
0.6956419, 0.0282022, 0.8553373, 1, 1, 1, 1, 1,
0.6971906, 0.8751629, 0.3173661, 1, 1, 1, 1, 1,
0.7008291, 0.7758715, 1.760225, 1, 1, 1, 1, 1,
0.7020537, -0.8264941, 1.790164, 1, 1, 1, 1, 1,
0.7132568, -1.73156, 0.8002861, 1, 1, 1, 1, 1,
0.7202899, -0.05006021, 1.735934, 1, 1, 1, 1, 1,
0.7215921, 0.313846, 2.451933, 0, 0, 1, 1, 1,
0.7221464, -0.344218, 3.06462, 1, 0, 0, 1, 1,
0.7229525, 1.602403, 0.5567645, 1, 0, 0, 1, 1,
0.7239565, -0.7487491, 2.412081, 1, 0, 0, 1, 1,
0.7269323, 0.9422057, 0.2093607, 1, 0, 0, 1, 1,
0.736451, 0.6893461, 1.604426, 1, 0, 0, 1, 1,
0.7398851, 0.401574, 0.8734303, 0, 0, 0, 1, 1,
0.7464353, -1.648705, 3.083823, 0, 0, 0, 1, 1,
0.7504918, -2.526921, 2.899629, 0, 0, 0, 1, 1,
0.7524344, 0.06404004, -0.4026443, 0, 0, 0, 1, 1,
0.7538902, -0.7802705, 1.677176, 0, 0, 0, 1, 1,
0.755632, 0.879414, 0.08614098, 0, 0, 0, 1, 1,
0.7633127, -1.04369, 1.965004, 0, 0, 0, 1, 1,
0.7638901, 0.6149052, 0.5618865, 1, 1, 1, 1, 1,
0.7674451, 1.494918, 0.5956303, 1, 1, 1, 1, 1,
0.7689757, 2.426373, 0.6259728, 1, 1, 1, 1, 1,
0.7693968, -0.2796707, 1.555866, 1, 1, 1, 1, 1,
0.7770643, 0.8524408, 0.9813961, 1, 1, 1, 1, 1,
0.7771018, -0.4077223, 1.407685, 1, 1, 1, 1, 1,
0.7847786, -1.650749, 4.196478, 1, 1, 1, 1, 1,
0.7918466, 0.1149756, 1.704238, 1, 1, 1, 1, 1,
0.7964329, 1.864026, 1.780724, 1, 1, 1, 1, 1,
0.7970547, 1.274156, 1.443797, 1, 1, 1, 1, 1,
0.7975015, -0.4831463, 1.422822, 1, 1, 1, 1, 1,
0.7984936, 1.341855, -0.4871965, 1, 1, 1, 1, 1,
0.8016744, 0.6309872, 0.4547289, 1, 1, 1, 1, 1,
0.8034053, 0.6294412, 1.548469, 1, 1, 1, 1, 1,
0.8036163, -1.351838, 3.461136, 1, 1, 1, 1, 1,
0.8063072, 0.1953481, 0.8038675, 0, 0, 1, 1, 1,
0.8071006, 0.832669, 0.03193131, 1, 0, 0, 1, 1,
0.808048, 0.9275545, 2.032428, 1, 0, 0, 1, 1,
0.809479, -0.3741949, 1.191586, 1, 0, 0, 1, 1,
0.8112533, 2.544723, 1.184707, 1, 0, 0, 1, 1,
0.8123355, -0.2634611, 2.366273, 1, 0, 0, 1, 1,
0.8161937, -1.434006, 2.816325, 0, 0, 0, 1, 1,
0.8164002, -1.194348, 4.394547, 0, 0, 0, 1, 1,
0.817449, 1.050679, 0.7357147, 0, 0, 0, 1, 1,
0.820812, 0.4823102, 0.07730699, 0, 0, 0, 1, 1,
0.8212336, -0.9825318, 3.659219, 0, 0, 0, 1, 1,
0.8243908, -0.3856004, 3.233727, 0, 0, 0, 1, 1,
0.8355446, 0.2935968, 3.047766, 0, 0, 0, 1, 1,
0.8401804, 1.638849, 1.203219, 1, 1, 1, 1, 1,
0.8478334, -0.3789526, 2.020447, 1, 1, 1, 1, 1,
0.8499318, -2.506375, 2.759352, 1, 1, 1, 1, 1,
0.8593611, -1.656471, 1.602161, 1, 1, 1, 1, 1,
0.8677061, -0.4747595, 1.608844, 1, 1, 1, 1, 1,
0.8709885, 0.4215693, 1.052426, 1, 1, 1, 1, 1,
0.8771184, 0.0125424, 1.888993, 1, 1, 1, 1, 1,
0.8789608, -1.414436, 2.43843, 1, 1, 1, 1, 1,
0.88244, -1.418159, 2.458515, 1, 1, 1, 1, 1,
0.8912352, 1.265228, -0.6360785, 1, 1, 1, 1, 1,
0.8955808, 0.3440459, 1.895227, 1, 1, 1, 1, 1,
0.898118, 1.939427, 0.472758, 1, 1, 1, 1, 1,
0.9002947, -1.211717, 3.945357, 1, 1, 1, 1, 1,
0.9019623, -0.2461911, 1.412149, 1, 1, 1, 1, 1,
0.9097821, -0.2695932, 0.9792032, 1, 1, 1, 1, 1,
0.9105722, -0.4524448, 2.391314, 0, 0, 1, 1, 1,
0.9112163, -0.5307595, 2.396171, 1, 0, 0, 1, 1,
0.9303598, 0.1813508, 0.7416929, 1, 0, 0, 1, 1,
0.9316248, 0.466967, 0.29854, 1, 0, 0, 1, 1,
0.9342688, -0.756804, 1.755996, 1, 0, 0, 1, 1,
0.9389089, 1.13844, 0.6117669, 1, 0, 0, 1, 1,
0.944959, -1.064143, 2.011817, 0, 0, 0, 1, 1,
0.9488642, 0.2609003, 2.494152, 0, 0, 0, 1, 1,
0.950668, -0.2929724, 1.029865, 0, 0, 0, 1, 1,
0.9520805, 1.777796, 1.269423, 0, 0, 0, 1, 1,
0.9525723, -1.045527, 2.723768, 0, 0, 0, 1, 1,
0.9561366, 1.27095, 1.363527, 0, 0, 0, 1, 1,
0.9617565, 1.719418, 0.9133963, 0, 0, 0, 1, 1,
0.9631988, -0.2127808, 0.5050598, 1, 1, 1, 1, 1,
0.9644515, -0.532234, 3.849224, 1, 1, 1, 1, 1,
0.9655356, -0.8973172, 3.244664, 1, 1, 1, 1, 1,
0.9692879, 1.003055, 2.270379, 1, 1, 1, 1, 1,
0.9733595, 0.6052788, 2.041061, 1, 1, 1, 1, 1,
0.9769213, -1.026103, 3.268091, 1, 1, 1, 1, 1,
0.9794627, -0.886157, 3.376457, 1, 1, 1, 1, 1,
0.9858818, -0.4444408, 1.738762, 1, 1, 1, 1, 1,
0.9862456, 0.4086146, 2.419119, 1, 1, 1, 1, 1,
0.9894704, -0.4541045, 2.546236, 1, 1, 1, 1, 1,
0.9927952, 1.67487, 1.372179, 1, 1, 1, 1, 1,
0.9933859, 0.3078954, 1.762664, 1, 1, 1, 1, 1,
0.9956889, 0.6655239, 1.231139, 1, 1, 1, 1, 1,
0.9970561, -0.02349822, 1.882545, 1, 1, 1, 1, 1,
1.002874, 0.07886739, 0.8978944, 1, 1, 1, 1, 1,
1.017989, -0.6530551, 2.611291, 0, 0, 1, 1, 1,
1.022546, -1.740198, 2.205756, 1, 0, 0, 1, 1,
1.02274, -0.2570245, 2.138768, 1, 0, 0, 1, 1,
1.026514, -0.1470679, 3.010768, 1, 0, 0, 1, 1,
1.032259, 0.3663423, 1.760541, 1, 0, 0, 1, 1,
1.047422, 0.655076, 0.1538067, 1, 0, 0, 1, 1,
1.048859, 1.46488, 2.594251, 0, 0, 0, 1, 1,
1.057203, -0.4544585, 2.130608, 0, 0, 0, 1, 1,
1.064332, 1.762407, -0.6845557, 0, 0, 0, 1, 1,
1.067536, -1.374279, 2.401875, 0, 0, 0, 1, 1,
1.068242, 1.294896, 0.2081217, 0, 0, 0, 1, 1,
1.068288, 0.1149224, 2.680725, 0, 0, 0, 1, 1,
1.070713, -1.768939, 2.31592, 0, 0, 0, 1, 1,
1.075936, 0.5576332, -0.04718163, 1, 1, 1, 1, 1,
1.080777, -0.01914892, 1.112206, 1, 1, 1, 1, 1,
1.08176, -1.093249, 2.454331, 1, 1, 1, 1, 1,
1.08238, -0.4140946, 0.6422738, 1, 1, 1, 1, 1,
1.090025, -0.08095643, 1.371027, 1, 1, 1, 1, 1,
1.099727, 0.2872859, 1.513904, 1, 1, 1, 1, 1,
1.10468, -0.2725395, 1.476413, 1, 1, 1, 1, 1,
1.1084, 0.3308519, 1.262821, 1, 1, 1, 1, 1,
1.108803, 0.4759436, 1.493372, 1, 1, 1, 1, 1,
1.122804, -0.6803627, 2.682728, 1, 1, 1, 1, 1,
1.125255, 0.4491073, 0.9129676, 1, 1, 1, 1, 1,
1.144102, -0.6048968, 2.354535, 1, 1, 1, 1, 1,
1.146897, 1.952981, -1.120185, 1, 1, 1, 1, 1,
1.148119, 0.4115927, 0.9617812, 1, 1, 1, 1, 1,
1.157053, -0.7813545, 2.45453, 1, 1, 1, 1, 1,
1.162918, 1.873534, 1.829387, 0, 0, 1, 1, 1,
1.163197, -0.4404378, 1.841729, 1, 0, 0, 1, 1,
1.163197, 0.06215796, 1.136901, 1, 0, 0, 1, 1,
1.163612, -0.9823066, 0.1647227, 1, 0, 0, 1, 1,
1.165478, -0.4239566, 3.197836, 1, 0, 0, 1, 1,
1.173143, -0.6037958, 2.776228, 1, 0, 0, 1, 1,
1.18155, 0.9087744, 1.485627, 0, 0, 0, 1, 1,
1.185545, 0.6800383, 3.455973, 0, 0, 0, 1, 1,
1.19778, 0.08633757, 1.992172, 0, 0, 0, 1, 1,
1.202863, 0.07892676, 2.456621, 0, 0, 0, 1, 1,
1.203053, 2.070427, 0.326481, 0, 0, 0, 1, 1,
1.20569, 1.307109, 1.409738, 0, 0, 0, 1, 1,
1.207022, 0.1734876, 2.851555, 0, 0, 0, 1, 1,
1.207696, 1.391476, 0.326615, 1, 1, 1, 1, 1,
1.213062, -1.603473, 3.469228, 1, 1, 1, 1, 1,
1.221021, -0.19341, 2.358562, 1, 1, 1, 1, 1,
1.231151, -0.4414372, 3.454997, 1, 1, 1, 1, 1,
1.242746, -0.6350725, 0.1845047, 1, 1, 1, 1, 1,
1.24313, -0.8968931, 0.8809557, 1, 1, 1, 1, 1,
1.245695, 1.031804, 0.4073464, 1, 1, 1, 1, 1,
1.249382, 0.6848291, 0.3192073, 1, 1, 1, 1, 1,
1.258457, -0.5566702, 1.975581, 1, 1, 1, 1, 1,
1.259939, 1.183069, 0.1563466, 1, 1, 1, 1, 1,
1.266997, -1.509475, 2.681524, 1, 1, 1, 1, 1,
1.271156, -0.8807436, 3.485833, 1, 1, 1, 1, 1,
1.271215, 0.6044783, 1.405373, 1, 1, 1, 1, 1,
1.274128, 0.7657889, 1.582539, 1, 1, 1, 1, 1,
1.275139, -0.2674805, 2.530104, 1, 1, 1, 1, 1,
1.286518, -0.977442, 1.073807, 0, 0, 1, 1, 1,
1.311888, 0.512418, 1.078622, 1, 0, 0, 1, 1,
1.316245, -1.273895, 1.570202, 1, 0, 0, 1, 1,
1.32415, 0.5263236, 0.15093, 1, 0, 0, 1, 1,
1.330796, 0.6756025, -0.05382539, 1, 0, 0, 1, 1,
1.34023, 0.4684085, 1.787007, 1, 0, 0, 1, 1,
1.36413, 1.896665, -0.7830995, 0, 0, 0, 1, 1,
1.364138, 0.1491479, 1.760704, 0, 0, 0, 1, 1,
1.373549, 0.8235508, 0.8936878, 0, 0, 0, 1, 1,
1.381068, 0.5555294, 3.435326, 0, 0, 0, 1, 1,
1.400197, 1.564644, 1.967857, 0, 0, 0, 1, 1,
1.409102, -2.497074, 1.219348, 0, 0, 0, 1, 1,
1.413032, 0.6192707, 0.8520545, 0, 0, 0, 1, 1,
1.413584, -1.298418, 0.317025, 1, 1, 1, 1, 1,
1.414245, -0.4330564, -0.1548615, 1, 1, 1, 1, 1,
1.414776, 1.06547, 1.428384, 1, 1, 1, 1, 1,
1.418218, 1.320115, -0.5738507, 1, 1, 1, 1, 1,
1.419979, -0.240699, 1.692961, 1, 1, 1, 1, 1,
1.423629, -0.7267463, 3.476432, 1, 1, 1, 1, 1,
1.436471, 0.5915235, 0.4429888, 1, 1, 1, 1, 1,
1.438191, -0.2618684, 3.179016, 1, 1, 1, 1, 1,
1.447629, -0.3403255, 2.100719, 1, 1, 1, 1, 1,
1.453955, -0.4537323, 1.736678, 1, 1, 1, 1, 1,
1.458363, 0.7507847, 1.806322, 1, 1, 1, 1, 1,
1.47732, -0.5021287, 2.517324, 1, 1, 1, 1, 1,
1.477448, 0.3147696, 0.2819675, 1, 1, 1, 1, 1,
1.481414, 0.4839656, 2.180378, 1, 1, 1, 1, 1,
1.508106, 0.3676228, 1.198836, 1, 1, 1, 1, 1,
1.527337, 3.013065, 0.7152222, 0, 0, 1, 1, 1,
1.5299, -0.5255202, 2.5037, 1, 0, 0, 1, 1,
1.533061, -0.3580329, 2.761446, 1, 0, 0, 1, 1,
1.545296, -0.9582763, 2.824571, 1, 0, 0, 1, 1,
1.56699, 0.4822618, 1.015244, 1, 0, 0, 1, 1,
1.574216, -0.2628839, 1.786302, 1, 0, 0, 1, 1,
1.587308, -1.078077, 3.0704, 0, 0, 0, 1, 1,
1.594797, -1.379793, 3.058029, 0, 0, 0, 1, 1,
1.596595, 0.1251238, 3.335712, 0, 0, 0, 1, 1,
1.597802, -0.8506598, 2.317379, 0, 0, 0, 1, 1,
1.608295, 1.330326, -1.041867, 0, 0, 0, 1, 1,
1.615986, 1.839945, -0.2327914, 0, 0, 0, 1, 1,
1.631174, 0.01541602, 1.451883, 0, 0, 0, 1, 1,
1.642068, 0.8341351, 0.7473281, 1, 1, 1, 1, 1,
1.64914, 1.281887, 0.6691597, 1, 1, 1, 1, 1,
1.656886, 1.101292, -0.5036367, 1, 1, 1, 1, 1,
1.667676, 0.3806001, 2.335755, 1, 1, 1, 1, 1,
1.685529, 0.628542, 0.9716372, 1, 1, 1, 1, 1,
1.68667, 0.4453264, 1.98266, 1, 1, 1, 1, 1,
1.689594, -1.259853, 2.156768, 1, 1, 1, 1, 1,
1.690193, -0.3538322, 1.974103, 1, 1, 1, 1, 1,
1.694324, 0.0450935, 1.341973, 1, 1, 1, 1, 1,
1.698414, 1.520095, 1.216889, 1, 1, 1, 1, 1,
1.706973, -0.4896151, 1.638596, 1, 1, 1, 1, 1,
1.709869, -0.2108166, -0.2285236, 1, 1, 1, 1, 1,
1.711542, -0.8299103, 1.146298, 1, 1, 1, 1, 1,
1.713529, -1.229036, 1.149168, 1, 1, 1, 1, 1,
1.719692, -0.6804478, 2.349499, 1, 1, 1, 1, 1,
1.723045, 0.1467354, 1.801113, 0, 0, 1, 1, 1,
1.768679, 0.1407846, 2.603421, 1, 0, 0, 1, 1,
1.814134, -0.07803955, 1.309209, 1, 0, 0, 1, 1,
1.830169, -0.06328851, 0.9500268, 1, 0, 0, 1, 1,
1.835825, -0.006145926, 0.7005869, 1, 0, 0, 1, 1,
1.842322, 0.5147594, 1.813201, 1, 0, 0, 1, 1,
1.857454, -0.5756909, 3.714564, 0, 0, 0, 1, 1,
1.862297, -0.8590882, 2.716196, 0, 0, 0, 1, 1,
1.866195, 1.560889, 0.7639349, 0, 0, 0, 1, 1,
1.880241, -0.6758237, 2.165971, 0, 0, 0, 1, 1,
1.891771, 0.67383, 1.835483, 0, 0, 0, 1, 1,
1.900581, 0.1683597, 2.208226, 0, 0, 0, 1, 1,
1.901037, 0.2828995, 1.521118, 0, 0, 0, 1, 1,
1.905571, -3.285536, 2.614776, 1, 1, 1, 1, 1,
1.943181, -0.7001747, 3.037603, 1, 1, 1, 1, 1,
1.967616, 1.165637, 0.07640798, 1, 1, 1, 1, 1,
1.981287, -1.082587, 2.279933, 1, 1, 1, 1, 1,
1.996691, -1.508767, 2.487959, 1, 1, 1, 1, 1,
2.006732, 2.506433, 2.187739, 1, 1, 1, 1, 1,
2.041567, 0.4999953, -0.03272647, 1, 1, 1, 1, 1,
2.05118, -0.07965232, 0.7952915, 1, 1, 1, 1, 1,
2.056299, 0.6833544, 2.228747, 1, 1, 1, 1, 1,
2.073368, 0.5086405, 2.420984, 1, 1, 1, 1, 1,
2.075196, -1.874698, 1.831173, 1, 1, 1, 1, 1,
2.075954, -0.7863072, 2.650498, 1, 1, 1, 1, 1,
2.115226, -1.306518, 1.498675, 1, 1, 1, 1, 1,
2.140732, 0.1757974, 0.9624861, 1, 1, 1, 1, 1,
2.148268, 0.3845801, 1.76466, 1, 1, 1, 1, 1,
2.211506, 0.3608088, 0.8527499, 0, 0, 1, 1, 1,
2.220424, -0.08602098, -1.299459, 1, 0, 0, 1, 1,
2.31425, -0.8961509, 2.674791, 1, 0, 0, 1, 1,
2.317112, -0.2394065, -0.06390628, 1, 0, 0, 1, 1,
2.344056, 0.9415071, 0.3241982, 1, 0, 0, 1, 1,
2.375164, 1.329102, 0.4100996, 1, 0, 0, 1, 1,
2.404564, 0.6233158, 2.00912, 0, 0, 0, 1, 1,
2.415233, -0.215966, 1.333451, 0, 0, 0, 1, 1,
2.430285, -1.65345, 3.275224, 0, 0, 0, 1, 1,
2.433271, 0.3762364, 1.419176, 0, 0, 0, 1, 1,
2.443516, -0.7978405, 1.691435, 0, 0, 0, 1, 1,
2.460055, -0.1430007, -0.1805532, 0, 0, 0, 1, 1,
2.505029, -0.7050458, 2.435449, 0, 0, 0, 1, 1,
2.595228, -0.971893, 2.746722, 1, 1, 1, 1, 1,
2.645904, -0.1568816, 1.770318, 1, 1, 1, 1, 1,
2.694514, 0.8767713, 0.7354678, 1, 1, 1, 1, 1,
2.802405, 0.2491926, 2.002787, 1, 1, 1, 1, 1,
2.813025, 1.622338, 0.4014671, 1, 1, 1, 1, 1,
3.04959, -0.3543735, 1.499484, 1, 1, 1, 1, 1,
3.148122, -0.3856518, 0.09535116, 1, 1, 1, 1, 1
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
var radius = 9.783516;
var distance = 34.36419;
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
mvMatrix.translate( 0.02058625, -0.1220467, -0.1681998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.36419);
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
