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
-3.132397, -0.395856, -2.18968, 1, 0, 0, 1,
-3.116323, 0.515121, -1.286254, 1, 0.007843138, 0, 1,
-2.722587, 0.2138055, -1.600147, 1, 0.01176471, 0, 1,
-2.555324, 0.3777436, -2.049686, 1, 0.01960784, 0, 1,
-2.489963, 0.6440502, -1.285531, 1, 0.02352941, 0, 1,
-2.410777, -1.360424, -3.158362, 1, 0.03137255, 0, 1,
-2.397831, 0.8308436, 0.3713034, 1, 0.03529412, 0, 1,
-2.371286, 1.053468, -1.785028, 1, 0.04313726, 0, 1,
-2.369, -0.6780346, -0.6851989, 1, 0.04705882, 0, 1,
-2.331217, -1.057381, -2.723934, 1, 0.05490196, 0, 1,
-2.32898, -0.8568212, -1.498842, 1, 0.05882353, 0, 1,
-2.299204, -0.2192793, -2.130235, 1, 0.06666667, 0, 1,
-2.27123, 0.438139, -2.508558, 1, 0.07058824, 0, 1,
-2.257422, 0.1266042, -0.5576505, 1, 0.07843138, 0, 1,
-2.234521, -0.8302758, -0.6186775, 1, 0.08235294, 0, 1,
-2.219459, -0.8726941, -2.856874, 1, 0.09019608, 0, 1,
-2.190151, 1.099703, -0.4905081, 1, 0.09411765, 0, 1,
-2.179549, -1.535975, -1.754674, 1, 0.1019608, 0, 1,
-2.133192, 0.2337352, 0.1729522, 1, 0.1098039, 0, 1,
-2.109052, -0.2160389, -2.218878, 1, 0.1137255, 0, 1,
-2.097599, -1.031699, -2.214147, 1, 0.1215686, 0, 1,
-2.03196, -1.102259, 1.681389, 1, 0.1254902, 0, 1,
-2.020833, 0.7378651, -2.556475, 1, 0.1333333, 0, 1,
-1.996733, 0.8422484, -0.2324388, 1, 0.1372549, 0, 1,
-1.957599, 0.2854075, -1.136453, 1, 0.145098, 0, 1,
-1.952877, -0.1054073, -0.7436446, 1, 0.1490196, 0, 1,
-1.948696, 0.306954, -0.879612, 1, 0.1568628, 0, 1,
-1.945871, -0.1831041, -0.9181559, 1, 0.1607843, 0, 1,
-1.94234, 2.776388, -0.1196966, 1, 0.1686275, 0, 1,
-1.933148, 0.6286782, 0.9925609, 1, 0.172549, 0, 1,
-1.919534, 1.370083, -0.5064833, 1, 0.1803922, 0, 1,
-1.905486, -1.489463, -2.317215, 1, 0.1843137, 0, 1,
-1.899313, -0.5319384, -3.4271, 1, 0.1921569, 0, 1,
-1.899109, -0.3465086, -0.3059689, 1, 0.1960784, 0, 1,
-1.870454, 0.5040623, -0.7314043, 1, 0.2039216, 0, 1,
-1.811766, -0.3212545, -1.499858, 1, 0.2117647, 0, 1,
-1.809334, 0.4536263, -1.190801, 1, 0.2156863, 0, 1,
-1.794564, -1.146122, -3.64814, 1, 0.2235294, 0, 1,
-1.787584, -0.3274606, -2.079077, 1, 0.227451, 0, 1,
-1.78713, -1.143527, -1.21879, 1, 0.2352941, 0, 1,
-1.779794, -0.8237358, -3.387102, 1, 0.2392157, 0, 1,
-1.776718, -1.14721, -1.520014, 1, 0.2470588, 0, 1,
-1.776549, 0.9925042, -0.8522571, 1, 0.2509804, 0, 1,
-1.766838, 0.1044679, -1.319371, 1, 0.2588235, 0, 1,
-1.760532, -0.885217, -3.154499, 1, 0.2627451, 0, 1,
-1.754663, -0.8203655, -1.414328, 1, 0.2705882, 0, 1,
-1.748088, 0.774588, -1.568144, 1, 0.2745098, 0, 1,
-1.729879, -2.599069, -3.111276, 1, 0.282353, 0, 1,
-1.726891, -1.170283, -2.137325, 1, 0.2862745, 0, 1,
-1.726804, 0.8220105, -1.121859, 1, 0.2941177, 0, 1,
-1.717485, -0.8470098, -0.7311088, 1, 0.3019608, 0, 1,
-1.707228, -0.2271692, -1.522674, 1, 0.3058824, 0, 1,
-1.695967, -0.3798258, -2.26292, 1, 0.3137255, 0, 1,
-1.694356, 0.8990043, -1.078937, 1, 0.3176471, 0, 1,
-1.651904, 0.1890758, 0.4943319, 1, 0.3254902, 0, 1,
-1.648096, -1.289914, -1.830243, 1, 0.3294118, 0, 1,
-1.6228, -1.14864, -0.8208767, 1, 0.3372549, 0, 1,
-1.620997, 0.8038485, -0.9711691, 1, 0.3411765, 0, 1,
-1.602946, -0.1031574, -1.849642, 1, 0.3490196, 0, 1,
-1.59238, 0.9940087, -0.6791584, 1, 0.3529412, 0, 1,
-1.526456, -0.05467947, -0.2879556, 1, 0.3607843, 0, 1,
-1.521934, -0.09641796, -3.382076, 1, 0.3647059, 0, 1,
-1.519818, 0.3815252, -1.932703, 1, 0.372549, 0, 1,
-1.519522, 1.087527, 0.002438251, 1, 0.3764706, 0, 1,
-1.513091, 0.7679371, -0.4758252, 1, 0.3843137, 0, 1,
-1.508263, 1.298719, -1.452373, 1, 0.3882353, 0, 1,
-1.505508, -0.6909943, -2.802748, 1, 0.3960784, 0, 1,
-1.487561, -0.67641, -0.6631032, 1, 0.4039216, 0, 1,
-1.479854, 1.193015, -1.568395, 1, 0.4078431, 0, 1,
-1.474236, 0.9201966, -2.042394, 1, 0.4156863, 0, 1,
-1.46563, 0.2590223, -2.100577, 1, 0.4196078, 0, 1,
-1.45687, 1.018366, -0.5346205, 1, 0.427451, 0, 1,
-1.456415, -3.25142, -3.173138, 1, 0.4313726, 0, 1,
-1.45428, -0.0143169, -3.227171, 1, 0.4392157, 0, 1,
-1.453416, 0.4941503, -1.150409, 1, 0.4431373, 0, 1,
-1.448674, -0.7381569, -2.109692, 1, 0.4509804, 0, 1,
-1.445573, -1.509277, -2.25549, 1, 0.454902, 0, 1,
-1.437762, -0.6178621, -2.376216, 1, 0.4627451, 0, 1,
-1.43745, 0.2920711, -2.120043, 1, 0.4666667, 0, 1,
-1.433137, 0.2391411, -2.663251, 1, 0.4745098, 0, 1,
-1.432165, 0.4333954, -1.33776, 1, 0.4784314, 0, 1,
-1.425256, -0.7742177, -1.055488, 1, 0.4862745, 0, 1,
-1.418689, -0.140606, -0.3239858, 1, 0.4901961, 0, 1,
-1.414602, -0.8975008, -2.646995, 1, 0.4980392, 0, 1,
-1.412157, 0.9468186, -2.203039, 1, 0.5058824, 0, 1,
-1.398897, -0.7799734, -2.57957, 1, 0.509804, 0, 1,
-1.393013, 0.9512267, -3.369264, 1, 0.5176471, 0, 1,
-1.384994, 0.6385999, -0.6878863, 1, 0.5215687, 0, 1,
-1.382295, -0.9414659, -4.85974, 1, 0.5294118, 0, 1,
-1.372342, -0.5469673, -1.654802, 1, 0.5333334, 0, 1,
-1.367166, -0.1032169, -1.388397, 1, 0.5411765, 0, 1,
-1.36135, 0.1306405, -2.245929, 1, 0.5450981, 0, 1,
-1.35873, -0.1299686, -3.152388, 1, 0.5529412, 0, 1,
-1.352624, -0.7797696, -3.223682, 1, 0.5568628, 0, 1,
-1.347008, -0.1341564, -2.387886, 1, 0.5647059, 0, 1,
-1.343531, 0.4530285, -1.87713, 1, 0.5686275, 0, 1,
-1.335503, 0.07732956, -1.823143, 1, 0.5764706, 0, 1,
-1.333322, 0.1345745, -0.9846866, 1, 0.5803922, 0, 1,
-1.33064, 1.831444, 0.4319749, 1, 0.5882353, 0, 1,
-1.311721, -0.2063483, -2.813222, 1, 0.5921569, 0, 1,
-1.294083, -0.4510356, -3.541774, 1, 0.6, 0, 1,
-1.286873, -0.3848847, 0.8740256, 1, 0.6078432, 0, 1,
-1.283867, -0.7856178, -1.28446, 1, 0.6117647, 0, 1,
-1.278219, -1.635225, -0.4280894, 1, 0.6196079, 0, 1,
-1.276285, 0.07966452, -1.818719, 1, 0.6235294, 0, 1,
-1.275216, 0.05673648, -1.864681, 1, 0.6313726, 0, 1,
-1.275201, -0.9379168, -2.555238, 1, 0.6352941, 0, 1,
-1.274426, -0.149975, -1.081729, 1, 0.6431373, 0, 1,
-1.262388, 0.370537, -3.17891, 1, 0.6470588, 0, 1,
-1.256614, 1.500683, -2.148191, 1, 0.654902, 0, 1,
-1.255443, 0.0589509, -2.161057, 1, 0.6588235, 0, 1,
-1.246113, -0.8661636, -2.643918, 1, 0.6666667, 0, 1,
-1.244041, 0.09109201, -1.517797, 1, 0.6705883, 0, 1,
-1.239671, -0.5827019, -2.567579, 1, 0.6784314, 0, 1,
-1.236359, 1.571166, -0.04866581, 1, 0.682353, 0, 1,
-1.235237, -1.702713, -1.125118, 1, 0.6901961, 0, 1,
-1.213263, 0.3695626, -0.5753996, 1, 0.6941177, 0, 1,
-1.212183, 0.1848851, -1.98269, 1, 0.7019608, 0, 1,
-1.207365, -0.0748475, -1.398995, 1, 0.7098039, 0, 1,
-1.201325, -0.06642251, -0.8910624, 1, 0.7137255, 0, 1,
-1.197863, 1.703395, -1.69032, 1, 0.7215686, 0, 1,
-1.19056, -0.5065429, -2.601362, 1, 0.7254902, 0, 1,
-1.18869, -0.8643221, -4.495821, 1, 0.7333333, 0, 1,
-1.184126, -0.9252405, -2.390948, 1, 0.7372549, 0, 1,
-1.176785, 1.267181, -1.328732, 1, 0.7450981, 0, 1,
-1.166225, -0.09199513, -2.487497, 1, 0.7490196, 0, 1,
-1.165904, 0.3432612, -2.234868, 1, 0.7568628, 0, 1,
-1.164796, 0.464869, -0.1808738, 1, 0.7607843, 0, 1,
-1.163315, -1.009825, -2.713115, 1, 0.7686275, 0, 1,
-1.159632, 2.379306, 0.3649998, 1, 0.772549, 0, 1,
-1.150506, -2.106085, -2.891042, 1, 0.7803922, 0, 1,
-1.149738, 0.7621824, -0.376789, 1, 0.7843137, 0, 1,
-1.146034, -0.185308, -0.5157982, 1, 0.7921569, 0, 1,
-1.144559, 1.292431, -0.3444738, 1, 0.7960784, 0, 1,
-1.140197, 1.093088, -0.3070026, 1, 0.8039216, 0, 1,
-1.135424, -0.5511207, -2.255477, 1, 0.8117647, 0, 1,
-1.133181, -1.093057, -2.869623, 1, 0.8156863, 0, 1,
-1.128581, 0.3168203, -1.398124, 1, 0.8235294, 0, 1,
-1.125039, 0.3245232, -1.958186, 1, 0.827451, 0, 1,
-1.117218, 0.9374474, -0.01083972, 1, 0.8352941, 0, 1,
-1.113775, -0.6829242, -2.128442, 1, 0.8392157, 0, 1,
-1.109935, -0.9445168, -3.199138, 1, 0.8470588, 0, 1,
-1.108461, -0.2223958, -3.280612, 1, 0.8509804, 0, 1,
-1.104505, -0.2182414, -1.387724, 1, 0.8588235, 0, 1,
-1.104419, -2.128638, -1.854011, 1, 0.8627451, 0, 1,
-1.104277, -0.3020271, -4.167821, 1, 0.8705882, 0, 1,
-1.096285, -0.5268394, -3.150712, 1, 0.8745098, 0, 1,
-1.09621, -0.03329397, -1.764901, 1, 0.8823529, 0, 1,
-1.092857, -1.576341, -0.05718122, 1, 0.8862745, 0, 1,
-1.092427, 0.2045767, -1.637967, 1, 0.8941177, 0, 1,
-1.089811, 0.4204804, -1.350632, 1, 0.8980392, 0, 1,
-1.089764, -0.3201001, -3.297257, 1, 0.9058824, 0, 1,
-1.065322, 0.765312, -0.3962228, 1, 0.9137255, 0, 1,
-1.064, -1.536683, -2.650769, 1, 0.9176471, 0, 1,
-1.063402, 1.074164, -0.5061602, 1, 0.9254902, 0, 1,
-1.055774, 1.303272, -0.5146266, 1, 0.9294118, 0, 1,
-1.045095, -1.184001, -0.9779794, 1, 0.9372549, 0, 1,
-1.04106, 0.596274, -1.929562, 1, 0.9411765, 0, 1,
-1.040306, 0.9579538, 0.3184339, 1, 0.9490196, 0, 1,
-1.034151, -0.531795, -1.683796, 1, 0.9529412, 0, 1,
-1.032759, -0.4370914, -0.5636957, 1, 0.9607843, 0, 1,
-1.026396, 0.9673154, 0.776189, 1, 0.9647059, 0, 1,
-1.026393, 0.7874962, -1.120414, 1, 0.972549, 0, 1,
-1.0224, -1.553243, -3.21219, 1, 0.9764706, 0, 1,
-1.013296, 0.2016197, -1.003709, 1, 0.9843137, 0, 1,
-1.010539, 1.536555, -0.8141474, 1, 0.9882353, 0, 1,
-1.009341, 0.06355684, -1.698788, 1, 0.9960784, 0, 1,
-1.008655, -0.7441838, -1.442102, 0.9960784, 1, 0, 1,
-1.003147, 0.2017654, -1.843672, 0.9921569, 1, 0, 1,
-1.001639, -0.2761841, -2.669684, 0.9843137, 1, 0, 1,
-0.9974722, -1.031143, -3.455895, 0.9803922, 1, 0, 1,
-0.993245, -0.7905841, -1.231045, 0.972549, 1, 0, 1,
-0.9929699, -0.06101575, -1.922196, 0.9686275, 1, 0, 1,
-0.9912595, 0.05980087, -2.164657, 0.9607843, 1, 0, 1,
-0.98905, -0.4071614, -0.6446298, 0.9568627, 1, 0, 1,
-0.9877212, -0.107426, -1.111489, 0.9490196, 1, 0, 1,
-0.9840848, 1.696785, -0.2203695, 0.945098, 1, 0, 1,
-0.9811351, -0.02334155, -1.750188, 0.9372549, 1, 0, 1,
-0.9802635, 0.1918883, -0.8137828, 0.9333333, 1, 0, 1,
-0.9757783, 0.2419225, -0.8466492, 0.9254902, 1, 0, 1,
-0.9751241, -0.7058755, -1.806655, 0.9215686, 1, 0, 1,
-0.9710156, 0.3540173, -0.7374222, 0.9137255, 1, 0, 1,
-0.9709743, -0.2765221, -1.175591, 0.9098039, 1, 0, 1,
-0.9667338, -0.9505078, -3.129528, 0.9019608, 1, 0, 1,
-0.9650759, 0.9392728, 0.4830014, 0.8941177, 1, 0, 1,
-0.964616, 0.08577077, -0.3935558, 0.8901961, 1, 0, 1,
-0.9617046, -2.310314, -3.269801, 0.8823529, 1, 0, 1,
-0.9601812, -0.7582918, -2.232821, 0.8784314, 1, 0, 1,
-0.9581367, 0.3401489, -0.826961, 0.8705882, 1, 0, 1,
-0.945986, 1.218932, -2.115152, 0.8666667, 1, 0, 1,
-0.9446779, -0.6163157, -2.405566, 0.8588235, 1, 0, 1,
-0.9394038, -0.1837298, -3.050103, 0.854902, 1, 0, 1,
-0.9358146, 1.432036, 0.1647317, 0.8470588, 1, 0, 1,
-0.930755, 0.1436665, -0.8258295, 0.8431373, 1, 0, 1,
-0.9279226, 0.1123128, -1.194524, 0.8352941, 1, 0, 1,
-0.922646, -0.9741314, -1.764707, 0.8313726, 1, 0, 1,
-0.9224357, 0.6358348, -1.374461, 0.8235294, 1, 0, 1,
-0.9180259, 0.1563117, -2.12677, 0.8196079, 1, 0, 1,
-0.9101298, -1.682269, -1.919009, 0.8117647, 1, 0, 1,
-0.9048145, 1.148885, -1.260533, 0.8078431, 1, 0, 1,
-0.9003425, 1.802851, -0.7005375, 0.8, 1, 0, 1,
-0.8992947, 0.4333316, -0.7094271, 0.7921569, 1, 0, 1,
-0.8931282, -0.3279645, -1.955641, 0.7882353, 1, 0, 1,
-0.8928347, -0.4317254, -2.737627, 0.7803922, 1, 0, 1,
-0.8890215, -0.596103, -1.733537, 0.7764706, 1, 0, 1,
-0.8819191, -0.6752892, -3.075639, 0.7686275, 1, 0, 1,
-0.8799987, 0.3166549, -1.665092, 0.7647059, 1, 0, 1,
-0.8780045, 0.691114, -2.456914, 0.7568628, 1, 0, 1,
-0.8772618, 1.07652, -0.07073146, 0.7529412, 1, 0, 1,
-0.8765476, -0.7731084, -1.024067, 0.7450981, 1, 0, 1,
-0.8667255, 0.3149477, 0.2262538, 0.7411765, 1, 0, 1,
-0.8661866, -0.4382529, -2.441908, 0.7333333, 1, 0, 1,
-0.8648695, -0.1888685, -4.011942, 0.7294118, 1, 0, 1,
-0.8645737, -1.950922, -1.646265, 0.7215686, 1, 0, 1,
-0.8576639, 0.03893271, -1.237178, 0.7176471, 1, 0, 1,
-0.8536159, -1.202998, -2.750653, 0.7098039, 1, 0, 1,
-0.8520564, 0.5578663, 0.1362527, 0.7058824, 1, 0, 1,
-0.8484756, 0.07079574, -0.7937448, 0.6980392, 1, 0, 1,
-0.8468702, -1.084021, -2.526564, 0.6901961, 1, 0, 1,
-0.8465945, 1.637399, -0.04363904, 0.6862745, 1, 0, 1,
-0.8429049, -0.4470269, -2.193093, 0.6784314, 1, 0, 1,
-0.8334414, 1.645391, -1.195808, 0.6745098, 1, 0, 1,
-0.8275775, 0.6367269, -1.814602, 0.6666667, 1, 0, 1,
-0.8270298, -2.097224, -3.19258, 0.6627451, 1, 0, 1,
-0.8219455, 0.6403792, -0.707463, 0.654902, 1, 0, 1,
-0.8198344, -0.4598718, -2.031261, 0.6509804, 1, 0, 1,
-0.8165929, -1.442758, -3.086271, 0.6431373, 1, 0, 1,
-0.8084025, 0.7009287, -1.800018, 0.6392157, 1, 0, 1,
-0.8034196, -0.08533582, -3.048595, 0.6313726, 1, 0, 1,
-0.8021231, -0.6744117, -3.016855, 0.627451, 1, 0, 1,
-0.8013059, -0.2362926, -1.607931, 0.6196079, 1, 0, 1,
-0.7991545, -1.116647, -2.029805, 0.6156863, 1, 0, 1,
-0.798034, 1.349761, -1.086372, 0.6078432, 1, 0, 1,
-0.7836257, 0.2983298, 0.9631578, 0.6039216, 1, 0, 1,
-0.7820671, -0.302939, -0.4688723, 0.5960785, 1, 0, 1,
-0.7780474, 0.6650389, 0.6567464, 0.5882353, 1, 0, 1,
-0.777558, -0.4670407, -0.9498569, 0.5843138, 1, 0, 1,
-0.7762192, -0.1945426, -1.345244, 0.5764706, 1, 0, 1,
-0.7754997, -0.13953, 0.2789642, 0.572549, 1, 0, 1,
-0.7721974, 0.8278652, -0.8161836, 0.5647059, 1, 0, 1,
-0.7694803, -0.3146805, -2.57939, 0.5607843, 1, 0, 1,
-0.7660872, 1.084822, -3.02161, 0.5529412, 1, 0, 1,
-0.7596893, 1.567149, -1.395442, 0.5490196, 1, 0, 1,
-0.7584918, 0.3437683, -0.05572786, 0.5411765, 1, 0, 1,
-0.7562554, -0.452857, -3.00047, 0.5372549, 1, 0, 1,
-0.7557436, 0.2224439, -0.5614921, 0.5294118, 1, 0, 1,
-0.7519346, -3.329437, -2.780899, 0.5254902, 1, 0, 1,
-0.7489272, 0.152292, -0.2645928, 0.5176471, 1, 0, 1,
-0.7441517, 0.5116431, -1.369365, 0.5137255, 1, 0, 1,
-0.7369597, -1.073632, -1.446133, 0.5058824, 1, 0, 1,
-0.7360681, -0.9411187, -3.609339, 0.5019608, 1, 0, 1,
-0.7339825, -1.865413, -2.700598, 0.4941176, 1, 0, 1,
-0.7315397, 0.1475511, -1.056393, 0.4862745, 1, 0, 1,
-0.7307502, 1.171131, -0.27851, 0.4823529, 1, 0, 1,
-0.7298461, 1.277338, -1.648045, 0.4745098, 1, 0, 1,
-0.7221831, -0.3015247, -3.403589, 0.4705882, 1, 0, 1,
-0.716252, 0.1827418, -1.728465, 0.4627451, 1, 0, 1,
-0.7141693, 0.3862339, -0.4585105, 0.4588235, 1, 0, 1,
-0.7102485, -0.7248989, -1.556167, 0.4509804, 1, 0, 1,
-0.7069409, -0.9390938, -2.650225, 0.4470588, 1, 0, 1,
-0.7056012, 1.334135, -1.038919, 0.4392157, 1, 0, 1,
-0.7047501, -0.253658, -2.344855, 0.4352941, 1, 0, 1,
-0.7041029, -0.5190791, -3.820949, 0.427451, 1, 0, 1,
-0.6961015, -0.04119023, -0.6067223, 0.4235294, 1, 0, 1,
-0.6960001, -0.9509364, -3.311865, 0.4156863, 1, 0, 1,
-0.6902533, 1.49732, -1.064767, 0.4117647, 1, 0, 1,
-0.6878029, 0.4264014, -0.5901408, 0.4039216, 1, 0, 1,
-0.6817303, -0.6499638, -1.397832, 0.3960784, 1, 0, 1,
-0.6816911, -0.3814435, -3.918874, 0.3921569, 1, 0, 1,
-0.6805142, 0.7157331, 0.1599488, 0.3843137, 1, 0, 1,
-0.6800186, -0.6377237, -4.142502, 0.3803922, 1, 0, 1,
-0.6776268, 1.052339, -1.972265, 0.372549, 1, 0, 1,
-0.6747072, -0.7427704, -2.283963, 0.3686275, 1, 0, 1,
-0.6740458, 0.6406656, -0.4322305, 0.3607843, 1, 0, 1,
-0.6696522, 0.03701021, -2.179194, 0.3568628, 1, 0, 1,
-0.6694324, 1.20822, 1.397625, 0.3490196, 1, 0, 1,
-0.6651307, 0.5831293, -0.336781, 0.345098, 1, 0, 1,
-0.6587214, 1.825916, -1.355248, 0.3372549, 1, 0, 1,
-0.6583893, -0.157701, -1.422523, 0.3333333, 1, 0, 1,
-0.657519, 0.01664362, 0.07267166, 0.3254902, 1, 0, 1,
-0.6550761, -0.3424636, -1.977381, 0.3215686, 1, 0, 1,
-0.65311, -0.1365079, -2.086958, 0.3137255, 1, 0, 1,
-0.6513854, -0.2359428, -1.744251, 0.3098039, 1, 0, 1,
-0.6446277, 0.8819171, -1.133166, 0.3019608, 1, 0, 1,
-0.6400858, -0.5860513, -1.966771, 0.2941177, 1, 0, 1,
-0.6376041, -0.7186782, -2.626822, 0.2901961, 1, 0, 1,
-0.6357672, 0.7413624, -2.430942, 0.282353, 1, 0, 1,
-0.6328073, -0.3242788, -4.400524, 0.2784314, 1, 0, 1,
-0.6312582, 0.3088873, 0.3097231, 0.2705882, 1, 0, 1,
-0.6310227, 0.6116728, -0.7622161, 0.2666667, 1, 0, 1,
-0.6299261, -0.8679228, -3.699575, 0.2588235, 1, 0, 1,
-0.628369, -1.27903, -3.5727, 0.254902, 1, 0, 1,
-0.6181863, -0.3933769, -1.080849, 0.2470588, 1, 0, 1,
-0.616738, 0.9223907, -1.056561, 0.2431373, 1, 0, 1,
-0.6152942, -1.393252, -2.52463, 0.2352941, 1, 0, 1,
-0.6094831, -1.428164, -2.029014, 0.2313726, 1, 0, 1,
-0.6072241, 0.7167788, -0.3791032, 0.2235294, 1, 0, 1,
-0.6003762, 0.4725037, 0.4529178, 0.2196078, 1, 0, 1,
-0.5993835, -0.3166239, -1.433842, 0.2117647, 1, 0, 1,
-0.5934235, 0.6200637, -0.7311354, 0.2078431, 1, 0, 1,
-0.5923342, -0.8447498, -2.993183, 0.2, 1, 0, 1,
-0.5870236, -0.6226057, -1.537443, 0.1921569, 1, 0, 1,
-0.5837657, 0.749059, 0.4889114, 0.1882353, 1, 0, 1,
-0.5787497, -1.299516, -2.691449, 0.1803922, 1, 0, 1,
-0.5694095, -1.669768, -0.7953263, 0.1764706, 1, 0, 1,
-0.5684087, -0.9004733, -2.127402, 0.1686275, 1, 0, 1,
-0.5569928, 0.5266364, -2.086539, 0.1647059, 1, 0, 1,
-0.5548816, -0.7573529, -1.489788, 0.1568628, 1, 0, 1,
-0.5439948, -0.2708308, -3.247817, 0.1529412, 1, 0, 1,
-0.5350686, -0.1099109, -2.286999, 0.145098, 1, 0, 1,
-0.5288222, -1.152686, -3.184215, 0.1411765, 1, 0, 1,
-0.5275017, 0.5150698, -1.474138, 0.1333333, 1, 0, 1,
-0.526741, 0.6428765, -1.273932, 0.1294118, 1, 0, 1,
-0.5218281, -0.3587328, -2.699193, 0.1215686, 1, 0, 1,
-0.5058661, 0.2306754, 0.3783885, 0.1176471, 1, 0, 1,
-0.5057844, 1.396144, -1.102739, 0.1098039, 1, 0, 1,
-0.5046155, -0.4005152, -1.727549, 0.1058824, 1, 0, 1,
-0.5003678, -1.353815, -3.512503, 0.09803922, 1, 0, 1,
-0.4991468, 0.02154562, -1.224572, 0.09019608, 1, 0, 1,
-0.4979415, -0.5942357, -2.53459, 0.08627451, 1, 0, 1,
-0.4943697, 1.685821, -0.5263648, 0.07843138, 1, 0, 1,
-0.4914218, 0.2541884, -0.3646432, 0.07450981, 1, 0, 1,
-0.4839397, 1.124354, -1.150748, 0.06666667, 1, 0, 1,
-0.4832068, -0.1114536, -2.589585, 0.0627451, 1, 0, 1,
-0.4810309, 0.3893291, -1.152483, 0.05490196, 1, 0, 1,
-0.4803872, 1.134918, -1.13454, 0.05098039, 1, 0, 1,
-0.4792668, 1.340666, -3.308838, 0.04313726, 1, 0, 1,
-0.478088, -2.465083, -4.556689, 0.03921569, 1, 0, 1,
-0.4726063, 0.9999339, -1.383514, 0.03137255, 1, 0, 1,
-0.470113, -0.3406019, -3.370378, 0.02745098, 1, 0, 1,
-0.4693906, 0.2454868, -0.3254687, 0.01960784, 1, 0, 1,
-0.4688398, -0.48555, -1.984423, 0.01568628, 1, 0, 1,
-0.4671486, 0.2538675, -1.381155, 0.007843138, 1, 0, 1,
-0.467132, -1.000292, -1.262048, 0.003921569, 1, 0, 1,
-0.4642733, 0.7350968, -1.308521, 0, 1, 0.003921569, 1,
-0.4602821, -0.4896354, -3.287061, 0, 1, 0.01176471, 1,
-0.4585738, 0.1113118, -1.225383, 0, 1, 0.01568628, 1,
-0.4573316, -2.651694, -4.593492, 0, 1, 0.02352941, 1,
-0.4546792, -1.344949, -3.507581, 0, 1, 0.02745098, 1,
-0.4493525, -0.3473443, -2.858609, 0, 1, 0.03529412, 1,
-0.4438094, -0.6081966, -2.586704, 0, 1, 0.03921569, 1,
-0.4388446, 0.5274793, 1.45545, 0, 1, 0.04705882, 1,
-0.4342069, -0.7781675, -1.441877, 0, 1, 0.05098039, 1,
-0.4327734, -0.34894, -1.961013, 0, 1, 0.05882353, 1,
-0.4301641, 0.6718471, -1.000025, 0, 1, 0.0627451, 1,
-0.4287332, 0.2683977, -2.39997, 0, 1, 0.07058824, 1,
-0.4266596, 0.4699499, -2.249243, 0, 1, 0.07450981, 1,
-0.4244534, 0.6149755, -2.193567, 0, 1, 0.08235294, 1,
-0.4186776, -1.787811, -2.740665, 0, 1, 0.08627451, 1,
-0.4132506, 1.153752, -0.3097531, 0, 1, 0.09411765, 1,
-0.4100692, 0.6748461, -0.5896404, 0, 1, 0.1019608, 1,
-0.408279, 0.557561, -0.6581748, 0, 1, 0.1058824, 1,
-0.407203, 1.728519, -0.2001277, 0, 1, 0.1137255, 1,
-0.4001251, -0.3958213, -2.306263, 0, 1, 0.1176471, 1,
-0.3999848, 2.144033, -0.4380207, 0, 1, 0.1254902, 1,
-0.3961681, -1.188911, -2.672327, 0, 1, 0.1294118, 1,
-0.3931128, 0.7453148, -0.2786645, 0, 1, 0.1372549, 1,
-0.3911474, 0.9796038, -0.6008089, 0, 1, 0.1411765, 1,
-0.3910683, 0.1660016, -0.1635004, 0, 1, 0.1490196, 1,
-0.3909191, -0.9046649, -3.071892, 0, 1, 0.1529412, 1,
-0.3902809, 0.6508614, -2.152212, 0, 1, 0.1607843, 1,
-0.3894323, -1.39886, -3.663477, 0, 1, 0.1647059, 1,
-0.3879333, -1.925961, -4.045879, 0, 1, 0.172549, 1,
-0.3854237, 0.8311396, -1.839983, 0, 1, 0.1764706, 1,
-0.3853763, 0.6890815, -0.04806142, 0, 1, 0.1843137, 1,
-0.3840999, 0.3064038, -0.0676252, 0, 1, 0.1882353, 1,
-0.3838776, -0.1033296, -0.9829978, 0, 1, 0.1960784, 1,
-0.3768929, -0.5370729, -1.267386, 0, 1, 0.2039216, 1,
-0.3726671, 0.6611888, -1.883157, 0, 1, 0.2078431, 1,
-0.367958, -1.227118, -3.230382, 0, 1, 0.2156863, 1,
-0.3675064, 0.7375277, 1.427428, 0, 1, 0.2196078, 1,
-0.3642091, -0.2381178, -1.606816, 0, 1, 0.227451, 1,
-0.3639532, -0.3646298, -2.338851, 0, 1, 0.2313726, 1,
-0.3623037, 0.7512281, -1.475501, 0, 1, 0.2392157, 1,
-0.3597961, -1.714115, -1.678595, 0, 1, 0.2431373, 1,
-0.3560332, -0.1485103, -3.654725, 0, 1, 0.2509804, 1,
-0.3543816, 0.2768683, -1.106582, 0, 1, 0.254902, 1,
-0.3496757, -0.6848799, -4.274839, 0, 1, 0.2627451, 1,
-0.3470423, -2.434391, -1.779157, 0, 1, 0.2666667, 1,
-0.34536, -1.132305, -3.077369, 0, 1, 0.2745098, 1,
-0.3438568, -1.128117, -2.346758, 0, 1, 0.2784314, 1,
-0.3395891, 0.3791619, 1.104511, 0, 1, 0.2862745, 1,
-0.3366591, 1.248927, 0.5853519, 0, 1, 0.2901961, 1,
-0.3335494, -0.8555422, -4.064649, 0, 1, 0.2980392, 1,
-0.3314638, 0.3457694, -0.5418202, 0, 1, 0.3058824, 1,
-0.3293457, 0.6986663, -1.714134, 0, 1, 0.3098039, 1,
-0.3224654, -0.4885698, -2.363712, 0, 1, 0.3176471, 1,
-0.3201707, 1.660001, 2.16215, 0, 1, 0.3215686, 1,
-0.3185029, -1.540813, -3.11381, 0, 1, 0.3294118, 1,
-0.3174041, 0.6192116, 0.4354767, 0, 1, 0.3333333, 1,
-0.317113, 1.051596, 1.213677, 0, 1, 0.3411765, 1,
-0.314218, 0.8734547, 1.018344, 0, 1, 0.345098, 1,
-0.313061, 0.1435383, -2.355099, 0, 1, 0.3529412, 1,
-0.3126231, 0.988898, -0.5292244, 0, 1, 0.3568628, 1,
-0.3097414, 0.9618765, -2.048761, 0, 1, 0.3647059, 1,
-0.3080626, 0.697606, -1.086323, 0, 1, 0.3686275, 1,
-0.3061448, -0.5015188, -1.894957, 0, 1, 0.3764706, 1,
-0.3028509, 0.2031693, -1.685209, 0, 1, 0.3803922, 1,
-0.2986065, 0.07122166, -2.531528, 0, 1, 0.3882353, 1,
-0.2967456, 0.7400939, -0.0479681, 0, 1, 0.3921569, 1,
-0.2883203, 0.6335356, -3.282458, 0, 1, 0.4, 1,
-0.2865471, -0.3383555, -4.3424, 0, 1, 0.4078431, 1,
-0.2844727, 0.3717587, -0.6996208, 0, 1, 0.4117647, 1,
-0.281091, 0.4667621, -2.61359, 0, 1, 0.4196078, 1,
-0.2805563, 1.277207, -0.3992035, 0, 1, 0.4235294, 1,
-0.2804952, 1.20941, -1.778458, 0, 1, 0.4313726, 1,
-0.2756384, 0.6390933, -0.3151228, 0, 1, 0.4352941, 1,
-0.2730085, 0.1809056, -0.4838112, 0, 1, 0.4431373, 1,
-0.270129, 0.2519682, -1.159511, 0, 1, 0.4470588, 1,
-0.2668287, -0.3528629, -2.683145, 0, 1, 0.454902, 1,
-0.266199, -0.9960673, -2.627987, 0, 1, 0.4588235, 1,
-0.2656035, -0.6232899, -1.433595, 0, 1, 0.4666667, 1,
-0.2618152, 0.06760346, -0.6460392, 0, 1, 0.4705882, 1,
-0.258078, 0.3888503, -3.436189, 0, 1, 0.4784314, 1,
-0.2532512, 2.083368, -0.303537, 0, 1, 0.4823529, 1,
-0.2439579, -0.006339559, -2.104413, 0, 1, 0.4901961, 1,
-0.2389661, -1.665854, -2.635968, 0, 1, 0.4941176, 1,
-0.2335347, -0.8720734, -1.949072, 0, 1, 0.5019608, 1,
-0.2302371, 1.320624, 0.7341897, 0, 1, 0.509804, 1,
-0.2269232, 1.05309, -1.267797, 0, 1, 0.5137255, 1,
-0.2247609, -0.5061007, -2.574454, 0, 1, 0.5215687, 1,
-0.2229213, 0.2927513, -0.4519769, 0, 1, 0.5254902, 1,
-0.2215175, 0.1610627, -1.092421, 0, 1, 0.5333334, 1,
-0.2208421, -0.4972729, -3.236542, 0, 1, 0.5372549, 1,
-0.2173266, 0.2019664, -0.804565, 0, 1, 0.5450981, 1,
-0.2152765, -0.4308402, -1.89168, 0, 1, 0.5490196, 1,
-0.2079394, 1.003256, 0.4062904, 0, 1, 0.5568628, 1,
-0.2070305, 0.6485484, 0.3639539, 0, 1, 0.5607843, 1,
-0.2062621, 0.1234402, -1.08317, 0, 1, 0.5686275, 1,
-0.1993227, 0.7685826, -0.6691418, 0, 1, 0.572549, 1,
-0.1985448, 0.2178682, -0.06632921, 0, 1, 0.5803922, 1,
-0.1955629, 0.9547668, -1.818597, 0, 1, 0.5843138, 1,
-0.1914756, 0.7919902, 0.373824, 0, 1, 0.5921569, 1,
-0.191398, 0.5375553, -0.903475, 0, 1, 0.5960785, 1,
-0.1905818, -1.081753, -3.540406, 0, 1, 0.6039216, 1,
-0.1850641, -0.9094687, -4.103664, 0, 1, 0.6117647, 1,
-0.184844, -1.510837, -3.378525, 0, 1, 0.6156863, 1,
-0.1758095, 0.3786115, -1.108378, 0, 1, 0.6235294, 1,
-0.170083, -0.109097, -3.269812, 0, 1, 0.627451, 1,
-0.1663119, 0.9627557, -0.142397, 0, 1, 0.6352941, 1,
-0.1655226, -2.509421, -1.01662, 0, 1, 0.6392157, 1,
-0.1641077, -1.097897, -2.707373, 0, 1, 0.6470588, 1,
-0.1634451, 1.41285, -0.2903947, 0, 1, 0.6509804, 1,
-0.158239, -1.150724, -1.640818, 0, 1, 0.6588235, 1,
-0.1537865, 1.804686, 0.0264665, 0, 1, 0.6627451, 1,
-0.1466004, -0.6972785, -3.822978, 0, 1, 0.6705883, 1,
-0.1458228, 0.7654331, -0.3091259, 0, 1, 0.6745098, 1,
-0.136893, -0.1695749, -2.38874, 0, 1, 0.682353, 1,
-0.1323965, -0.8997868, -2.03811, 0, 1, 0.6862745, 1,
-0.1323328, -0.3272061, -3.168212, 0, 1, 0.6941177, 1,
-0.1294672, -0.2677637, -2.480966, 0, 1, 0.7019608, 1,
-0.1253349, 2.311831, -2.080091, 0, 1, 0.7058824, 1,
-0.1208416, 0.386018, 1.172486, 0, 1, 0.7137255, 1,
-0.119549, 1.084643, 0.1815652, 0, 1, 0.7176471, 1,
-0.1178395, 1.179676, -1.253637, 0, 1, 0.7254902, 1,
-0.1067026, -2.0725, -4.724662, 0, 1, 0.7294118, 1,
-0.105649, -0.02637888, -2.461627, 0, 1, 0.7372549, 1,
-0.1045296, 1.141703, -0.848448, 0, 1, 0.7411765, 1,
-0.1004385, -0.9580566, -4.783748, 0, 1, 0.7490196, 1,
-0.09852327, -1.718127, -3.558255, 0, 1, 0.7529412, 1,
-0.09589428, -2.177857, -3.351921, 0, 1, 0.7607843, 1,
-0.0911727, 1.611019, 0.5651315, 0, 1, 0.7647059, 1,
-0.08835457, -0.03760002, -2.966255, 0, 1, 0.772549, 1,
-0.0785908, -1.396106, -2.758214, 0, 1, 0.7764706, 1,
-0.07811026, 1.152417, -0.3419274, 0, 1, 0.7843137, 1,
-0.0760714, -0.4897998, -4.801039, 0, 1, 0.7882353, 1,
-0.0713002, -0.2449806, -2.599962, 0, 1, 0.7960784, 1,
-0.06904507, 0.1066322, 0.6058403, 0, 1, 0.8039216, 1,
-0.06805051, -1.797261, -4.616469, 0, 1, 0.8078431, 1,
-0.06691827, -1.186972, -1.815821, 0, 1, 0.8156863, 1,
-0.06551973, -1.271341, -2.451532, 0, 1, 0.8196079, 1,
-0.05905349, -1.474297, -3.720657, 0, 1, 0.827451, 1,
-0.0562964, 0.1129585, -2.77352, 0, 1, 0.8313726, 1,
-0.04954971, 0.02865234, -3.318116, 0, 1, 0.8392157, 1,
-0.0441242, -1.645702, -3.324645, 0, 1, 0.8431373, 1,
-0.04266011, -1.008002, -2.444162, 0, 1, 0.8509804, 1,
-0.04118745, 0.1525442, 0.2737584, 0, 1, 0.854902, 1,
-0.04049304, -1.224266, -3.793252, 0, 1, 0.8627451, 1,
-0.03860327, -0.04631244, -3.700388, 0, 1, 0.8666667, 1,
-0.03790816, 1.528107, -2.26905, 0, 1, 0.8745098, 1,
-0.03594961, -0.7390184, -4.043449, 0, 1, 0.8784314, 1,
-0.03555123, -1.026626, -1.829858, 0, 1, 0.8862745, 1,
-0.03485324, 0.3496479, -0.6521604, 0, 1, 0.8901961, 1,
-0.03462584, -1.248028, -3.10801, 0, 1, 0.8980392, 1,
-0.03383816, -0.03043982, -2.68818, 0, 1, 0.9058824, 1,
-0.03246142, -0.3230329, -3.459838, 0, 1, 0.9098039, 1,
-0.02807984, 0.4448105, -0.8462568, 0, 1, 0.9176471, 1,
-0.01267108, -0.426515, -3.943155, 0, 1, 0.9215686, 1,
-0.01045799, -1.957873, -2.945992, 0, 1, 0.9294118, 1,
-0.00546167, -1.718335, -3.50367, 0, 1, 0.9333333, 1,
-0.005181124, 0.05194113, -1.15853, 0, 1, 0.9411765, 1,
-0.004575197, -1.149879, -3.168226, 0, 1, 0.945098, 1,
-0.003654586, 0.8376085, 3.231617, 0, 1, 0.9529412, 1,
-0.003242561, -0.4888536, -1.405861, 0, 1, 0.9568627, 1,
-0.001652889, -0.01462428, -5.104479, 0, 1, 0.9647059, 1,
-0.0009060798, 0.3922183, -0.3865134, 0, 1, 0.9686275, 1,
0.0008942427, 0.646831, -1.079124, 0, 1, 0.9764706, 1,
0.003899187, 1.127338, 0.8165829, 0, 1, 0.9803922, 1,
0.00566352, 1.13195, 0.2933105, 0, 1, 0.9882353, 1,
0.007553441, 0.648596, -0.4195689, 0, 1, 0.9921569, 1,
0.009543316, -1.062729, 3.843739, 0, 1, 1, 1,
0.01322797, -1.797099, 2.63996, 0, 0.9921569, 1, 1,
0.01416923, -2.382306, 4.162588, 0, 0.9882353, 1, 1,
0.02002527, 1.26063, 0.6797708, 0, 0.9803922, 1, 1,
0.02061283, 1.776705, 1.387427, 0, 0.9764706, 1, 1,
0.02188515, -0.7829171, 3.495247, 0, 0.9686275, 1, 1,
0.02275149, -1.186093, 3.604089, 0, 0.9647059, 1, 1,
0.02619207, -0.3045388, 3.334017, 0, 0.9568627, 1, 1,
0.02748769, -0.05566749, 3.926036, 0, 0.9529412, 1, 1,
0.02920714, 1.163846, -0.280439, 0, 0.945098, 1, 1,
0.03245615, -1.466791, 2.325079, 0, 0.9411765, 1, 1,
0.04219783, -2.442905, 0.3069906, 0, 0.9333333, 1, 1,
0.04659956, 0.04088061, 1.264891, 0, 0.9294118, 1, 1,
0.04830324, -0.6772282, 3.016229, 0, 0.9215686, 1, 1,
0.05211833, -0.2240222, 2.443371, 0, 0.9176471, 1, 1,
0.05224482, -0.3231213, 4.195021, 0, 0.9098039, 1, 1,
0.05606455, -0.1012092, 2.670504, 0, 0.9058824, 1, 1,
0.05721922, 1.257912, 1.167417, 0, 0.8980392, 1, 1,
0.05800802, -1.090055, 2.878501, 0, 0.8901961, 1, 1,
0.05934777, 0.3109612, 1.08597, 0, 0.8862745, 1, 1,
0.06223488, 1.808381, 0.4626116, 0, 0.8784314, 1, 1,
0.06313299, -0.8213685, 2.973558, 0, 0.8745098, 1, 1,
0.06388772, 0.05235993, 1.102724, 0, 0.8666667, 1, 1,
0.06599086, -0.3843923, 2.653638, 0, 0.8627451, 1, 1,
0.06903069, -0.5269557, 2.996344, 0, 0.854902, 1, 1,
0.06961372, -0.5141909, 4.351189, 0, 0.8509804, 1, 1,
0.07557635, -0.3745623, 2.679784, 0, 0.8431373, 1, 1,
0.07936109, -0.3347792, 3.651135, 0, 0.8392157, 1, 1,
0.08928324, -2.019636, 1.00163, 0, 0.8313726, 1, 1,
0.09154782, 1.976038, -1.054051, 0, 0.827451, 1, 1,
0.09486454, -0.2377697, 3.596764, 0, 0.8196079, 1, 1,
0.09588615, 0.3635673, 0.4267764, 0, 0.8156863, 1, 1,
0.09652635, 0.2546697, 0.8191387, 0, 0.8078431, 1, 1,
0.1007706, 1.669618, 0.9878412, 0, 0.8039216, 1, 1,
0.1040617, -0.4903707, 4.269839, 0, 0.7960784, 1, 1,
0.1087622, 1.388749, -0.4505627, 0, 0.7882353, 1, 1,
0.1107918, -0.8358131, 3.08977, 0, 0.7843137, 1, 1,
0.1142704, -0.36073, 2.383103, 0, 0.7764706, 1, 1,
0.1205033, -1.36567, 3.080533, 0, 0.772549, 1, 1,
0.1217693, 0.9733649, -0.05064427, 0, 0.7647059, 1, 1,
0.1268042, 0.5589023, 0.447266, 0, 0.7607843, 1, 1,
0.1298833, 1.001046, -1.239503, 0, 0.7529412, 1, 1,
0.1327338, -1.130302, 1.534154, 0, 0.7490196, 1, 1,
0.1333682, -1.335342, 2.071599, 0, 0.7411765, 1, 1,
0.1335106, -0.4946251, 2.371301, 0, 0.7372549, 1, 1,
0.1369484, 0.8286725, 0.4359204, 0, 0.7294118, 1, 1,
0.1384437, -0.9824656, 3.089062, 0, 0.7254902, 1, 1,
0.1416797, -0.4117019, 2.393186, 0, 0.7176471, 1, 1,
0.1498353, 1.244336, 1.346195, 0, 0.7137255, 1, 1,
0.1507526, 0.422479, 0.6422731, 0, 0.7058824, 1, 1,
0.1532763, -1.411175, 3.863043, 0, 0.6980392, 1, 1,
0.1560782, -0.3199137, 3.205306, 0, 0.6941177, 1, 1,
0.1561316, 0.08655148, 3.331285, 0, 0.6862745, 1, 1,
0.1610866, 0.03411534, 1.857725, 0, 0.682353, 1, 1,
0.1624072, -1.286205, 3.025933, 0, 0.6745098, 1, 1,
0.1625524, 1.303296, -0.6470875, 0, 0.6705883, 1, 1,
0.1698621, 0.5048865, 0.7441115, 0, 0.6627451, 1, 1,
0.1710899, -0.7222651, 1.961713, 0, 0.6588235, 1, 1,
0.1721943, -0.3857994, 1.786186, 0, 0.6509804, 1, 1,
0.1750751, -0.1102071, 2.1782, 0, 0.6470588, 1, 1,
0.1755938, 1.087234, 2.590657, 0, 0.6392157, 1, 1,
0.1799164, 0.04234657, 0.1567141, 0, 0.6352941, 1, 1,
0.1840144, -1.078534, 3.925666, 0, 0.627451, 1, 1,
0.1867848, -0.6805437, 3.148309, 0, 0.6235294, 1, 1,
0.1880565, -0.2877591, 2.07796, 0, 0.6156863, 1, 1,
0.1885496, 0.3933431, 0.9000082, 0, 0.6117647, 1, 1,
0.1890233, -0.3795339, 3.99495, 0, 0.6039216, 1, 1,
0.1927833, -1.395468, 2.642468, 0, 0.5960785, 1, 1,
0.1984885, -1.473339, 3.846465, 0, 0.5921569, 1, 1,
0.1986794, 1.716449, 0.3249631, 0, 0.5843138, 1, 1,
0.2038319, 0.3779641, -0.4111756, 0, 0.5803922, 1, 1,
0.2050635, -1.240783, 3.063033, 0, 0.572549, 1, 1,
0.2055446, 0.1419292, 2.328849, 0, 0.5686275, 1, 1,
0.2073319, 0.9933575, -1.072336, 0, 0.5607843, 1, 1,
0.2104381, -1.157274, 3.803895, 0, 0.5568628, 1, 1,
0.2129048, -0.2884898, 2.877143, 0, 0.5490196, 1, 1,
0.21877, -0.4904073, 0.5509086, 0, 0.5450981, 1, 1,
0.2226937, 1.981021, 0.9316041, 0, 0.5372549, 1, 1,
0.2245189, 0.521177, 0.4878823, 0, 0.5333334, 1, 1,
0.2248992, 1.79641, 0.5406201, 0, 0.5254902, 1, 1,
0.2250616, -0.9521018, 2.459564, 0, 0.5215687, 1, 1,
0.2291106, -0.6848343, 1.64256, 0, 0.5137255, 1, 1,
0.2391223, -0.3180569, 3.169615, 0, 0.509804, 1, 1,
0.2493493, 0.180236, 2.479813, 0, 0.5019608, 1, 1,
0.2523596, 1.821824, 0.4490103, 0, 0.4941176, 1, 1,
0.2533978, 0.8197702, 1.795594, 0, 0.4901961, 1, 1,
0.2539849, -0.2725576, 4.768812, 0, 0.4823529, 1, 1,
0.2598843, 0.9189464, 0.04115212, 0, 0.4784314, 1, 1,
0.2605805, 1.087873, 1.16791, 0, 0.4705882, 1, 1,
0.2606061, 0.7188172, 2.481596, 0, 0.4666667, 1, 1,
0.2631835, -1.278163, 3.326566, 0, 0.4588235, 1, 1,
0.2648443, -1.300987, 1.321338, 0, 0.454902, 1, 1,
0.2650811, -0.7685995, 1.87081, 0, 0.4470588, 1, 1,
0.2691563, -0.6757605, 2.810581, 0, 0.4431373, 1, 1,
0.2722073, 0.08730594, 2.310074, 0, 0.4352941, 1, 1,
0.2722826, 0.9833044, 0.7370669, 0, 0.4313726, 1, 1,
0.2802548, -1.442481, 2.48006, 0, 0.4235294, 1, 1,
0.2851847, -1.667496, 3.601738, 0, 0.4196078, 1, 1,
0.288873, -0.2075526, 3.004321, 0, 0.4117647, 1, 1,
0.2896188, 1.791574, 1.494369, 0, 0.4078431, 1, 1,
0.291208, 0.8579094, 0.2239164, 0, 0.4, 1, 1,
0.2920192, -0.01409953, 2.71039, 0, 0.3921569, 1, 1,
0.2942375, 2.473502, -0.7431145, 0, 0.3882353, 1, 1,
0.2944848, 0.7617427, -1.467925, 0, 0.3803922, 1, 1,
0.298617, 0.7737051, -1.069332, 0, 0.3764706, 1, 1,
0.2993428, -1.138055, 3.763684, 0, 0.3686275, 1, 1,
0.2994288, 0.4215957, -0.3363464, 0, 0.3647059, 1, 1,
0.299868, -1.196734, 0.306032, 0, 0.3568628, 1, 1,
0.3017259, -0.4522173, 2.096637, 0, 0.3529412, 1, 1,
0.3050506, -0.9257153, 0.9382684, 0, 0.345098, 1, 1,
0.3060871, 0.2747619, 2.837689, 0, 0.3411765, 1, 1,
0.3109517, 0.1421774, -0.9072033, 0, 0.3333333, 1, 1,
0.3155252, -0.4498998, 2.649008, 0, 0.3294118, 1, 1,
0.3158449, -0.3413163, 2.712538, 0, 0.3215686, 1, 1,
0.3159771, 1.220623, -0.4410638, 0, 0.3176471, 1, 1,
0.3163919, 0.2504007, 0.8248635, 0, 0.3098039, 1, 1,
0.3193349, 0.5937191, 2.160744, 0, 0.3058824, 1, 1,
0.3254018, -0.08797038, 2.01834, 0, 0.2980392, 1, 1,
0.3303111, 1.252855, 0.6904829, 0, 0.2901961, 1, 1,
0.3305798, 0.355498, 1.15965, 0, 0.2862745, 1, 1,
0.3307034, 0.7997203, 0.2731365, 0, 0.2784314, 1, 1,
0.3309936, 0.4724944, 2.170963, 0, 0.2745098, 1, 1,
0.3318277, -0.477617, 3.37918, 0, 0.2666667, 1, 1,
0.332884, 0.6591999, 1.395373, 0, 0.2627451, 1, 1,
0.337537, -0.3334173, 2.390421, 0, 0.254902, 1, 1,
0.3395425, 0.5001649, 1.524104, 0, 0.2509804, 1, 1,
0.3401978, 0.06873927, 1.133573, 0, 0.2431373, 1, 1,
0.3421655, -0.4282395, 3.558008, 0, 0.2392157, 1, 1,
0.3524496, -0.3576041, 0.8547949, 0, 0.2313726, 1, 1,
0.3573459, 1.730759, 1.170377, 0, 0.227451, 1, 1,
0.3585244, 0.3851587, 1.829272, 0, 0.2196078, 1, 1,
0.3596509, 1.262623, -1.675213, 0, 0.2156863, 1, 1,
0.3613865, 0.9502413, -0.2837666, 0, 0.2078431, 1, 1,
0.3632948, 0.2205906, 1.339544, 0, 0.2039216, 1, 1,
0.3655666, -0.04976995, -0.2990144, 0, 0.1960784, 1, 1,
0.3658934, 1.386201, 0.5695605, 0, 0.1882353, 1, 1,
0.3695258, -0.3948165, 2.263671, 0, 0.1843137, 1, 1,
0.371425, -1.035373, 2.028271, 0, 0.1764706, 1, 1,
0.3721075, 0.5166565, 0.4203468, 0, 0.172549, 1, 1,
0.3751756, 1.301538, 0.4782678, 0, 0.1647059, 1, 1,
0.3768246, -0.5512152, 1.838514, 0, 0.1607843, 1, 1,
0.3819188, 0.3550682, 0.1654665, 0, 0.1529412, 1, 1,
0.3830455, -0.3416696, 1.293904, 0, 0.1490196, 1, 1,
0.3835222, -0.847865, 4.753456, 0, 0.1411765, 1, 1,
0.3843123, -1.709788, 4.357139, 0, 0.1372549, 1, 1,
0.3846824, -0.6347191, 3.0019, 0, 0.1294118, 1, 1,
0.3848615, 0.2967017, -0.2781639, 0, 0.1254902, 1, 1,
0.3858134, 0.08513854, 1.757595, 0, 0.1176471, 1, 1,
0.3868623, -0.215308, -0.06004197, 0, 0.1137255, 1, 1,
0.3925889, -0.2861724, 3.725926, 0, 0.1058824, 1, 1,
0.3936613, 0.4629867, 0.2451438, 0, 0.09803922, 1, 1,
0.3936655, 1.215326, -1.609799, 0, 0.09411765, 1, 1,
0.3953407, -1.130967, 2.724839, 0, 0.08627451, 1, 1,
0.399499, -0.2012653, 1.941472, 0, 0.08235294, 1, 1,
0.399809, 1.053432, -0.6561193, 0, 0.07450981, 1, 1,
0.4016848, -1.192194, 3.828575, 0, 0.07058824, 1, 1,
0.40175, 0.6018675, 0.4045005, 0, 0.0627451, 1, 1,
0.402575, 1.034413, 0.8730984, 0, 0.05882353, 1, 1,
0.4038079, -0.1597895, 1.868273, 0, 0.05098039, 1, 1,
0.4060486, 0.07962619, 1.06507, 0, 0.04705882, 1, 1,
0.4068981, 1.453983, 1.072879, 0, 0.03921569, 1, 1,
0.4095801, 0.9021571, 1.722757, 0, 0.03529412, 1, 1,
0.4096086, 0.5942202, -0.187639, 0, 0.02745098, 1, 1,
0.4096254, -1.400054, 4.048238, 0, 0.02352941, 1, 1,
0.4117177, -0.4591087, 1.600651, 0, 0.01568628, 1, 1,
0.4121086, -1.433373, 1.788986, 0, 0.01176471, 1, 1,
0.4156283, -0.807924, 2.432684, 0, 0.003921569, 1, 1,
0.4161007, 0.004847867, 1.954211, 0.003921569, 0, 1, 1,
0.419604, -0.2352488, 1.668193, 0.007843138, 0, 1, 1,
0.4198043, -0.509835, 3.401622, 0.01568628, 0, 1, 1,
0.4216935, -1.284467, 3.619214, 0.01960784, 0, 1, 1,
0.4250279, 0.1172365, 1.597017, 0.02745098, 0, 1, 1,
0.4287064, 0.2948222, 1.024316, 0.03137255, 0, 1, 1,
0.4292141, 1.357958, 2.392595, 0.03921569, 0, 1, 1,
0.4292917, -0.9436247, 3.984869, 0.04313726, 0, 1, 1,
0.4351272, 0.02633259, 1.723177, 0.05098039, 0, 1, 1,
0.4369831, 1.098048, 1.307252, 0.05490196, 0, 1, 1,
0.4394157, -1.955428, 0.6268744, 0.0627451, 0, 1, 1,
0.4395382, 0.477128, 1.415384, 0.06666667, 0, 1, 1,
0.4409446, 0.259423, 1.710529, 0.07450981, 0, 1, 1,
0.4450433, -1.344738, 1.920041, 0.07843138, 0, 1, 1,
0.4538288, -0.3584704, 3.217406, 0.08627451, 0, 1, 1,
0.4541022, 0.03677062, 2.829721, 0.09019608, 0, 1, 1,
0.455234, 0.4708074, 0.1034741, 0.09803922, 0, 1, 1,
0.4616328, -1.108507, 1.766769, 0.1058824, 0, 1, 1,
0.4630575, -1.114677, 2.519214, 0.1098039, 0, 1, 1,
0.4656677, 1.076608, 1.904878, 0.1176471, 0, 1, 1,
0.4674349, -1.417284, 5.147713, 0.1215686, 0, 1, 1,
0.4676284, -0.1267366, 2.56406, 0.1294118, 0, 1, 1,
0.476142, -1.313107, 2.93098, 0.1333333, 0, 1, 1,
0.476544, -0.5447407, 2.131258, 0.1411765, 0, 1, 1,
0.4769906, -0.826546, 3.30401, 0.145098, 0, 1, 1,
0.4789319, 0.929419, 1.0065, 0.1529412, 0, 1, 1,
0.4790758, 0.789902, 1.203223, 0.1568628, 0, 1, 1,
0.4839366, -0.2520736, 3.050045, 0.1647059, 0, 1, 1,
0.4895647, 0.4951741, 1.15863, 0.1686275, 0, 1, 1,
0.4932631, -0.02536135, 2.362597, 0.1764706, 0, 1, 1,
0.4937941, 0.7941788, 2.09702, 0.1803922, 0, 1, 1,
0.5030406, -0.3384813, 3.296311, 0.1882353, 0, 1, 1,
0.5076461, -0.351891, 1.419765, 0.1921569, 0, 1, 1,
0.5112439, -0.3539774, 3.552257, 0.2, 0, 1, 1,
0.5127997, -1.878272, 5.045677, 0.2078431, 0, 1, 1,
0.5158626, 1.983254, 1.387146, 0.2117647, 0, 1, 1,
0.5171073, 1.798756, -0.8700796, 0.2196078, 0, 1, 1,
0.5189298, -1.029825, 3.811707, 0.2235294, 0, 1, 1,
0.5223954, -0.662228, 2.960886, 0.2313726, 0, 1, 1,
0.5230109, 0.9742995, 0.4460039, 0.2352941, 0, 1, 1,
0.5243156, 0.2234662, 1.87183, 0.2431373, 0, 1, 1,
0.5246603, -0.1213234, 3.433557, 0.2470588, 0, 1, 1,
0.5258422, -0.542725, 2.167666, 0.254902, 0, 1, 1,
0.5265585, 1.32313, 1.453954, 0.2588235, 0, 1, 1,
0.5271716, 0.596324, -1.059963, 0.2666667, 0, 1, 1,
0.528045, 1.182192, 1.411528, 0.2705882, 0, 1, 1,
0.5310656, -0.02890633, 3.47122, 0.2784314, 0, 1, 1,
0.532805, -0.6161162, 2.980552, 0.282353, 0, 1, 1,
0.5373689, -0.2356969, 1.504646, 0.2901961, 0, 1, 1,
0.5400514, 0.6278376, 0.8436443, 0.2941177, 0, 1, 1,
0.5416425, 0.1514282, 0.3971686, 0.3019608, 0, 1, 1,
0.5423747, 0.8823781, 2.87842, 0.3098039, 0, 1, 1,
0.5498296, 0.71775, -0.1723891, 0.3137255, 0, 1, 1,
0.5604503, -0.2309186, 1.216286, 0.3215686, 0, 1, 1,
0.5610251, 0.1723753, 0.7000178, 0.3254902, 0, 1, 1,
0.5658044, 0.6101309, -0.1966812, 0.3333333, 0, 1, 1,
0.5672909, -0.6499556, 2.205836, 0.3372549, 0, 1, 1,
0.5707673, -1.303446, 4.278709, 0.345098, 0, 1, 1,
0.5750586, 0.1001804, -0.368709, 0.3490196, 0, 1, 1,
0.5770398, -0.2780923, 2.170229, 0.3568628, 0, 1, 1,
0.580287, 0.5654398, -0.1666903, 0.3607843, 0, 1, 1,
0.5817943, -1.363377, 3.440021, 0.3686275, 0, 1, 1,
0.5848776, 0.9980885, 1.968587, 0.372549, 0, 1, 1,
0.5854331, 1.438015, 1.554594, 0.3803922, 0, 1, 1,
0.5857229, 1.628303, 0.8393816, 0.3843137, 0, 1, 1,
0.5863353, -0.8763773, 1.728586, 0.3921569, 0, 1, 1,
0.5894405, 0.2511351, 2.310731, 0.3960784, 0, 1, 1,
0.5914954, -1.831049, 3.645918, 0.4039216, 0, 1, 1,
0.5991043, -1.441009, 1.518508, 0.4117647, 0, 1, 1,
0.6027101, 0.08144981, 2.198184, 0.4156863, 0, 1, 1,
0.6129659, -0.3471628, 2.101565, 0.4235294, 0, 1, 1,
0.6134424, -1.275298, 3.247981, 0.427451, 0, 1, 1,
0.6172477, 0.02903273, 0.7665738, 0.4352941, 0, 1, 1,
0.6222513, -0.5303314, 2.787817, 0.4392157, 0, 1, 1,
0.6244775, -1.856175, 2.598974, 0.4470588, 0, 1, 1,
0.6263409, -1.308377, 3.531246, 0.4509804, 0, 1, 1,
0.6305183, -1.241973, 2.326279, 0.4588235, 0, 1, 1,
0.6309834, -1.226816, 3.098908, 0.4627451, 0, 1, 1,
0.6334231, -0.3611135, 1.751642, 0.4705882, 0, 1, 1,
0.633786, -0.6871348, 4.533535, 0.4745098, 0, 1, 1,
0.6353646, -1.015748, 3.980659, 0.4823529, 0, 1, 1,
0.6381602, 0.09118606, 2.717067, 0.4862745, 0, 1, 1,
0.6409889, 0.3893691, 0.3319788, 0.4941176, 0, 1, 1,
0.6425731, -0.01189743, 0.6767434, 0.5019608, 0, 1, 1,
0.645867, -0.0238892, 1.635941, 0.5058824, 0, 1, 1,
0.6475385, 1.064828, 1.390617, 0.5137255, 0, 1, 1,
0.6583692, -0.06171042, 2.516682, 0.5176471, 0, 1, 1,
0.66091, 0.3556958, 1.335759, 0.5254902, 0, 1, 1,
0.6653482, -0.1401908, 1.444181, 0.5294118, 0, 1, 1,
0.6700612, -0.4978392, 1.113019, 0.5372549, 0, 1, 1,
0.6719444, -1.261713, 2.268017, 0.5411765, 0, 1, 1,
0.6724073, 1.089122, 2.035126, 0.5490196, 0, 1, 1,
0.6761845, -0.8392303, 2.343698, 0.5529412, 0, 1, 1,
0.6835831, 0.6231595, -2.045434, 0.5607843, 0, 1, 1,
0.6844988, 2.015753, 0.645418, 0.5647059, 0, 1, 1,
0.6879014, -0.55293, 3.233392, 0.572549, 0, 1, 1,
0.6904349, 1.811636, 0.4051215, 0.5764706, 0, 1, 1,
0.6922953, 0.08372921, 1.938506, 0.5843138, 0, 1, 1,
0.6948202, 0.6734835, 1.248177, 0.5882353, 0, 1, 1,
0.6982259, 1.163344, -0.2396403, 0.5960785, 0, 1, 1,
0.7019131, 0.0931766, 0.6063259, 0.6039216, 0, 1, 1,
0.7046218, 0.5041922, 0.482948, 0.6078432, 0, 1, 1,
0.7050176, -0.004627814, 1.29167, 0.6156863, 0, 1, 1,
0.705974, 0.6295747, -0.1022968, 0.6196079, 0, 1, 1,
0.7152492, -1.672054, 3.875431, 0.627451, 0, 1, 1,
0.7228314, 0.9939929, -0.6710185, 0.6313726, 0, 1, 1,
0.7271627, -0.2056354, 1.34586, 0.6392157, 0, 1, 1,
0.7307282, -0.06805988, 0.09056936, 0.6431373, 0, 1, 1,
0.7364713, -1.636064, 2.308512, 0.6509804, 0, 1, 1,
0.736659, -0.5771796, 1.326222, 0.654902, 0, 1, 1,
0.7371803, 0.1585071, 2.307037, 0.6627451, 0, 1, 1,
0.7376292, -0.1430759, 1.442728, 0.6666667, 0, 1, 1,
0.749116, -0.117305, 2.006281, 0.6745098, 0, 1, 1,
0.7564951, 0.8598455, -0.2585186, 0.6784314, 0, 1, 1,
0.7572361, -0.7804205, 0.902964, 0.6862745, 0, 1, 1,
0.7615684, 0.9482645, -0.6438983, 0.6901961, 0, 1, 1,
0.7631733, 0.8484647, 0.3377642, 0.6980392, 0, 1, 1,
0.7647692, -1.221856, 2.818085, 0.7058824, 0, 1, 1,
0.7647747, -0.09740421, 0.2484333, 0.7098039, 0, 1, 1,
0.7684848, 0.6408176, 2.615801, 0.7176471, 0, 1, 1,
0.7737011, 0.1463458, 2.073284, 0.7215686, 0, 1, 1,
0.7753285, 1.27607, 0.285694, 0.7294118, 0, 1, 1,
0.7775439, -0.4616013, 2.772329, 0.7333333, 0, 1, 1,
0.7801501, 0.00151166, 1.819607, 0.7411765, 0, 1, 1,
0.7851659, 0.2510573, 0.390066, 0.7450981, 0, 1, 1,
0.7882445, -1.409402, 1.575431, 0.7529412, 0, 1, 1,
0.7885168, 0.957033, 1.278799, 0.7568628, 0, 1, 1,
0.7947289, -2.228192, 2.862734, 0.7647059, 0, 1, 1,
0.7956656, 0.01917134, 1.564922, 0.7686275, 0, 1, 1,
0.8119003, 1.399374, 2.10288, 0.7764706, 0, 1, 1,
0.8140388, -0.05490392, 1.766236, 0.7803922, 0, 1, 1,
0.8188751, -0.4576229, 1.365495, 0.7882353, 0, 1, 1,
0.8205507, 0.5838709, -1.172156, 0.7921569, 0, 1, 1,
0.8233938, -1.287723, 3.312397, 0.8, 0, 1, 1,
0.823908, -0.5201334, 3.552047, 0.8078431, 0, 1, 1,
0.8258859, 0.5316015, 1.739709, 0.8117647, 0, 1, 1,
0.8259876, 1.027263, 1.711545, 0.8196079, 0, 1, 1,
0.8292787, 0.4775818, 0.4393643, 0.8235294, 0, 1, 1,
0.8347878, 0.2355965, 1.298657, 0.8313726, 0, 1, 1,
0.8400771, -0.03970397, 1.191991, 0.8352941, 0, 1, 1,
0.8443299, -1.043501, 0.9534758, 0.8431373, 0, 1, 1,
0.8445427, 0.4617392, 1.597606, 0.8470588, 0, 1, 1,
0.8449455, -1.152852, 1.188471, 0.854902, 0, 1, 1,
0.8488181, -1.58187, 2.91895, 0.8588235, 0, 1, 1,
0.8502069, -0.6650999, 2.23964, 0.8666667, 0, 1, 1,
0.8527614, -0.8697136, 3.282013, 0.8705882, 0, 1, 1,
0.8606009, -0.6304156, 2.12826, 0.8784314, 0, 1, 1,
0.8629453, -0.9050661, 3.860782, 0.8823529, 0, 1, 1,
0.8670744, 2.147034, 0.7933718, 0.8901961, 0, 1, 1,
0.86739, -0.9747514, 2.05516, 0.8941177, 0, 1, 1,
0.8673912, -0.6926819, 1.919025, 0.9019608, 0, 1, 1,
0.8701365, 0.01948747, 1.487771, 0.9098039, 0, 1, 1,
0.879677, -2.300731, 3.642171, 0.9137255, 0, 1, 1,
0.888824, -0.4133229, 1.606952, 0.9215686, 0, 1, 1,
0.8931809, -1.553425, 3.642513, 0.9254902, 0, 1, 1,
0.8932154, -0.793398, 3.654188, 0.9333333, 0, 1, 1,
0.8945812, 1.199263, -0.9226935, 0.9372549, 0, 1, 1,
0.898568, 0.7614632, 1.229743, 0.945098, 0, 1, 1,
0.8991504, -0.4446069, 2.658722, 0.9490196, 0, 1, 1,
0.9061489, 2.544335, 2.669213, 0.9568627, 0, 1, 1,
0.9087034, -0.3471398, 1.361918, 0.9607843, 0, 1, 1,
0.9106153, 0.6035654, 1.864775, 0.9686275, 0, 1, 1,
0.9151658, 0.7694566, 2.086841, 0.972549, 0, 1, 1,
0.9176702, -0.3293494, 0.9173499, 0.9803922, 0, 1, 1,
0.9206797, -0.2824998, 0.8119479, 0.9843137, 0, 1, 1,
0.9294397, 0.1141954, 0.313667, 0.9921569, 0, 1, 1,
0.9296222, 0.1664811, -0.7981428, 0.9960784, 0, 1, 1,
0.9445941, -0.3720915, 2.865556, 1, 0, 0.9960784, 1,
0.9499511, -0.6420849, 1.695261, 1, 0, 0.9882353, 1,
0.9527542, 0.4547131, -0.07580082, 1, 0, 0.9843137, 1,
0.9599528, 1.86811, -0.01282522, 1, 0, 0.9764706, 1,
0.9615861, 1.098589, 0.9268601, 1, 0, 0.972549, 1,
0.9617534, -1.92412, 2.554772, 1, 0, 0.9647059, 1,
0.9665391, 1.041114, 2.481084, 1, 0, 0.9607843, 1,
0.9746445, -0.596995, 3.374573, 1, 0, 0.9529412, 1,
0.9759964, 0.8931931, -0.7275999, 1, 0, 0.9490196, 1,
0.9760003, 1.379763, 0.9886116, 1, 0, 0.9411765, 1,
0.9817421, -0.7097234, 2.094465, 1, 0, 0.9372549, 1,
0.9824967, 0.9093025, 1.422285, 1, 0, 0.9294118, 1,
0.9914361, 0.1370433, 1.804789, 1, 0, 0.9254902, 1,
0.9927612, 0.01178846, 3.027216, 1, 0, 0.9176471, 1,
0.9950648, -1.294397, 2.177006, 1, 0, 0.9137255, 1,
0.9966066, -2.346169, 2.412529, 1, 0, 0.9058824, 1,
0.9972929, 0.5829633, 0.8961411, 1, 0, 0.9019608, 1,
0.9976473, 0.7446352, 1.052414, 1, 0, 0.8941177, 1,
1.003312, 0.9762199, 2.313133, 1, 0, 0.8862745, 1,
1.007639, 0.8039566, 0.06076387, 1, 0, 0.8823529, 1,
1.009421, 1.551494, 2.613936, 1, 0, 0.8745098, 1,
1.01946, -0.6578304, 3.818052, 1, 0, 0.8705882, 1,
1.020211, 0.5810072, 1.07004, 1, 0, 0.8627451, 1,
1.026285, -1.247985, 1.320812, 1, 0, 0.8588235, 1,
1.02873, -0.2158422, 3.525642, 1, 0, 0.8509804, 1,
1.034987, 0.5105303, -0.3498071, 1, 0, 0.8470588, 1,
1.043284, -0.693572, -0.270652, 1, 0, 0.8392157, 1,
1.053897, 1.230004, 2.014238, 1, 0, 0.8352941, 1,
1.056919, -0.4549432, 2.453633, 1, 0, 0.827451, 1,
1.069958, -2.396019, 4.709599, 1, 0, 0.8235294, 1,
1.069967, -0.8469244, 1.518252, 1, 0, 0.8156863, 1,
1.070597, 0.4332743, 1.603252, 1, 0, 0.8117647, 1,
1.070901, -0.1205237, 2.177677, 1, 0, 0.8039216, 1,
1.071121, -0.1107777, 3.077173, 1, 0, 0.7960784, 1,
1.071225, -1.015955, 0.6341342, 1, 0, 0.7921569, 1,
1.082819, -0.08387207, 2.540202, 1, 0, 0.7843137, 1,
1.087646, -1.3283, 2.145432, 1, 0, 0.7803922, 1,
1.090724, 0.2164739, 0.142197, 1, 0, 0.772549, 1,
1.096933, -1.2342, 2.864427, 1, 0, 0.7686275, 1,
1.105709, -1.469857, 3.885734, 1, 0, 0.7607843, 1,
1.109426, 0.04379418, 1.710563, 1, 0, 0.7568628, 1,
1.126456, 1.853731, 3.509132, 1, 0, 0.7490196, 1,
1.145243, -1.565792, 1.627257, 1, 0, 0.7450981, 1,
1.147212, 0.5591777, 1.523756, 1, 0, 0.7372549, 1,
1.149012, 0.6370403, 0.7122848, 1, 0, 0.7333333, 1,
1.151605, 1.50983, 2.131719, 1, 0, 0.7254902, 1,
1.153031, -0.7081115, 1.562272, 1, 0, 0.7215686, 1,
1.155604, 0.7195385, 1.783136, 1, 0, 0.7137255, 1,
1.164646, -0.8882163, 1.979518, 1, 0, 0.7098039, 1,
1.170759, 1.646739, 1.320363, 1, 0, 0.7019608, 1,
1.172613, 1.764753, 0.868294, 1, 0, 0.6941177, 1,
1.174175, 0.4816468, 1.357539, 1, 0, 0.6901961, 1,
1.196343, 1.148048, 0.01469515, 1, 0, 0.682353, 1,
1.199618, 0.5342921, 0.8413049, 1, 0, 0.6784314, 1,
1.199888, -0.5714209, 1.378639, 1, 0, 0.6705883, 1,
1.202044, 0.02747554, 4.111008, 1, 0, 0.6666667, 1,
1.204086, -1.045113, 3.46, 1, 0, 0.6588235, 1,
1.211981, 0.9126921, 0.8253932, 1, 0, 0.654902, 1,
1.213879, 0.8798718, 1.101328, 1, 0, 0.6470588, 1,
1.218646, 1.338153, 1.33945, 1, 0, 0.6431373, 1,
1.219782, -0.2667373, 1.20859, 1, 0, 0.6352941, 1,
1.224236, -1.499593, 2.99086, 1, 0, 0.6313726, 1,
1.232291, -0.3313197, 1.84299, 1, 0, 0.6235294, 1,
1.234636, 0.78272, -0.08080582, 1, 0, 0.6196079, 1,
1.24068, 0.9936163, 0.6723311, 1, 0, 0.6117647, 1,
1.2416, 0.9190724, 1.003948, 1, 0, 0.6078432, 1,
1.260059, 0.7889167, 1.622534, 1, 0, 0.6, 1,
1.263738, 0.3727404, 0.1932362, 1, 0, 0.5921569, 1,
1.268424, 0.07442982, 1.242427, 1, 0, 0.5882353, 1,
1.271489, -0.1549612, 2.907284, 1, 0, 0.5803922, 1,
1.272058, -0.2644065, 2.912559, 1, 0, 0.5764706, 1,
1.274843, -1.36644, 2.941936, 1, 0, 0.5686275, 1,
1.276937, 1.559216, 0.6022868, 1, 0, 0.5647059, 1,
1.286556, -0.1403265, -1.48859, 1, 0, 0.5568628, 1,
1.321187, -0.296291, 1.59491, 1, 0, 0.5529412, 1,
1.331281, -0.04919873, 1.853881, 1, 0, 0.5450981, 1,
1.349445, -0.1051064, -1.216282, 1, 0, 0.5411765, 1,
1.357847, 1.066376, 1.497684, 1, 0, 0.5333334, 1,
1.374698, -0.1455465, 1.246334, 1, 0, 0.5294118, 1,
1.385656, -1.673608, 3.057083, 1, 0, 0.5215687, 1,
1.39053, 0.3905094, -0.375057, 1, 0, 0.5176471, 1,
1.392906, 1.402767, 1.710802, 1, 0, 0.509804, 1,
1.393632, 0.1114834, -0.2325426, 1, 0, 0.5058824, 1,
1.396178, -0.3212492, 3.63454, 1, 0, 0.4980392, 1,
1.398228, -1.219821, 1.754326, 1, 0, 0.4901961, 1,
1.405273, 0.1782919, 1.129425, 1, 0, 0.4862745, 1,
1.422906, 0.1959247, 0.6358773, 1, 0, 0.4784314, 1,
1.424973, -0.01945329, 1.007699, 1, 0, 0.4745098, 1,
1.430903, 0.04920398, 1.840395, 1, 0, 0.4666667, 1,
1.431879, 1.37794, 1.572083, 1, 0, 0.4627451, 1,
1.433676, -1.762852, 1.525405, 1, 0, 0.454902, 1,
1.434885, -0.6422344, 1.568979, 1, 0, 0.4509804, 1,
1.440952, -0.09250425, 2.502205, 1, 0, 0.4431373, 1,
1.469793, 0.7309521, 2.360559, 1, 0, 0.4392157, 1,
1.472878, -0.1961921, 2.818512, 1, 0, 0.4313726, 1,
1.489085, 1.408463, -0.6464451, 1, 0, 0.427451, 1,
1.501906, -1.049751, 2.750403, 1, 0, 0.4196078, 1,
1.505376, -1.373578, 3.393409, 1, 0, 0.4156863, 1,
1.511242, -1.132176, 1.606972, 1, 0, 0.4078431, 1,
1.516619, 1.735552, 1.710703, 1, 0, 0.4039216, 1,
1.520374, -0.5713065, 0.4619877, 1, 0, 0.3960784, 1,
1.521015, -0.5788962, 2.459203, 1, 0, 0.3882353, 1,
1.542665, 0.1969219, 2.307984, 1, 0, 0.3843137, 1,
1.544708, 0.3879861, 1.069827, 1, 0, 0.3764706, 1,
1.545122, 1.204059, 0.4569857, 1, 0, 0.372549, 1,
1.572954, -0.4624204, 3.257189, 1, 0, 0.3647059, 1,
1.577102, -0.7905492, 1.549482, 1, 0, 0.3607843, 1,
1.581416, -0.3531909, 3.919118, 1, 0, 0.3529412, 1,
1.587507, -0.5616745, 2.248025, 1, 0, 0.3490196, 1,
1.588036, -0.9988037, 2.982069, 1, 0, 0.3411765, 1,
1.58985, 0.577253, -0.3080697, 1, 0, 0.3372549, 1,
1.589996, 0.145256, 2.625901, 1, 0, 0.3294118, 1,
1.59482, 1.406516, 1.765062, 1, 0, 0.3254902, 1,
1.611153, -0.1581382, 0.7253547, 1, 0, 0.3176471, 1,
1.611928, 0.6373642, 3.452927, 1, 0, 0.3137255, 1,
1.615628, 2.028906, -0.6796451, 1, 0, 0.3058824, 1,
1.619558, 0.2011154, -0.3536666, 1, 0, 0.2980392, 1,
1.620124, -0.3950227, 2.105252, 1, 0, 0.2941177, 1,
1.640598, -1.187023, 1.233693, 1, 0, 0.2862745, 1,
1.641124, 0.8259497, 1.097518, 1, 0, 0.282353, 1,
1.653375, -0.6757717, 2.45696, 1, 0, 0.2745098, 1,
1.661031, -0.05957785, 1.468219, 1, 0, 0.2705882, 1,
1.671675, -1.536441, 2.661251, 1, 0, 0.2627451, 1,
1.678716, -0.3777268, 3.162571, 1, 0, 0.2588235, 1,
1.719249, -0.1555709, 1.625237, 1, 0, 0.2509804, 1,
1.74675, -0.9193829, 3.283526, 1, 0, 0.2470588, 1,
1.752348, 3.150067, 0.1100649, 1, 0, 0.2392157, 1,
1.77005, -0.1393803, 2.184232, 1, 0, 0.2352941, 1,
1.79239, -1.181787, 1.604771, 1, 0, 0.227451, 1,
1.797779, -0.06723677, 1.67505, 1, 0, 0.2235294, 1,
1.80062, 0.4470958, 3.000291, 1, 0, 0.2156863, 1,
1.821767, -1.338361, 4.58359, 1, 0, 0.2117647, 1,
1.822244, -0.2666484, 3.651068, 1, 0, 0.2039216, 1,
1.823789, 1.335468, 0.06829377, 1, 0, 0.1960784, 1,
1.850141, 1.703829, 0.9273814, 1, 0, 0.1921569, 1,
1.878343, -0.01134947, 2.525222, 1, 0, 0.1843137, 1,
1.904109, 0.06755445, 1.181029, 1, 0, 0.1803922, 1,
1.90619, -0.9010389, 3.258603, 1, 0, 0.172549, 1,
1.906643, 0.2471071, 0.06407363, 1, 0, 0.1686275, 1,
1.952917, 2.138551, 1.236979, 1, 0, 0.1607843, 1,
1.977853, -0.1721272, 0.9939283, 1, 0, 0.1568628, 1,
1.989946, -1.362483, 2.002743, 1, 0, 0.1490196, 1,
2.015465, -0.5143356, 1.757231, 1, 0, 0.145098, 1,
2.01563, 0.6287808, 0.8637822, 1, 0, 0.1372549, 1,
2.018293, 0.8691918, 1.754723, 1, 0, 0.1333333, 1,
2.020805, 1.478454, 0.6114115, 1, 0, 0.1254902, 1,
2.024946, -0.6812656, 3.226115, 1, 0, 0.1215686, 1,
2.047376, -0.008484332, 0.7592619, 1, 0, 0.1137255, 1,
2.128578, -0.1113348, 1.408099, 1, 0, 0.1098039, 1,
2.131524, 0.6841758, 1.51379, 1, 0, 0.1019608, 1,
2.142181, 1.562071, 0.9722447, 1, 0, 0.09411765, 1,
2.149868, -1.409481, 3.373743, 1, 0, 0.09019608, 1,
2.155653, -0.5793607, 3.405843, 1, 0, 0.08235294, 1,
2.17506, -0.344046, 1.039675, 1, 0, 0.07843138, 1,
2.205365, -0.450835, 2.115893, 1, 0, 0.07058824, 1,
2.261921, 0.6286405, 2.181576, 1, 0, 0.06666667, 1,
2.311848, 0.6953357, 2.707052, 1, 0, 0.05882353, 1,
2.325635, -0.835443, 0.3750234, 1, 0, 0.05490196, 1,
2.421962, 0.827152, 1.36797, 1, 0, 0.04705882, 1,
2.45367, -1.498041, 1.427303, 1, 0, 0.04313726, 1,
2.505562, -1.936823, 0.1760847, 1, 0, 0.03529412, 1,
2.512436, 1.313488, 0.448763, 1, 0, 0.03137255, 1,
2.515569, -1.922024, 3.215087, 1, 0, 0.02352941, 1,
2.579907, 1.421646, -1.480379, 1, 0, 0.01960784, 1,
3.063722, -1.04134, 1.139437, 1, 0, 0.01176471, 1,
3.230138, 0.7973923, 1.52713, 1, 0, 0.007843138, 1
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
0.0488708, -4.427713, -6.842226, 0, -0.5, 0.5, 0.5,
0.0488708, -4.427713, -6.842226, 1, -0.5, 0.5, 0.5,
0.0488708, -4.427713, -6.842226, 1, 1.5, 0.5, 0.5,
0.0488708, -4.427713, -6.842226, 0, 1.5, 0.5, 0.5
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
-4.210846, -0.08968508, -6.842226, 0, -0.5, 0.5, 0.5,
-4.210846, -0.08968508, -6.842226, 1, -0.5, 0.5, 0.5,
-4.210846, -0.08968508, -6.842226, 1, 1.5, 0.5, 0.5,
-4.210846, -0.08968508, -6.842226, 0, 1.5, 0.5, 0.5
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
-4.210846, -4.427713, 0.0216167, 0, -0.5, 0.5, 0.5,
-4.210846, -4.427713, 0.0216167, 1, -0.5, 0.5, 0.5,
-4.210846, -4.427713, 0.0216167, 1, 1.5, 0.5, 0.5,
-4.210846, -4.427713, 0.0216167, 0, 1.5, 0.5, 0.5
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
-3, -3.42663, -5.258262,
3, -3.42663, -5.258262,
-3, -3.42663, -5.258262,
-3, -3.593477, -5.522256,
-2, -3.42663, -5.258262,
-2, -3.593477, -5.522256,
-1, -3.42663, -5.258262,
-1, -3.593477, -5.522256,
0, -3.42663, -5.258262,
0, -3.593477, -5.522256,
1, -3.42663, -5.258262,
1, -3.593477, -5.522256,
2, -3.42663, -5.258262,
2, -3.593477, -5.522256,
3, -3.42663, -5.258262,
3, -3.593477, -5.522256
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
-3, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
-3, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
-3, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
-3, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5,
-2, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
-2, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
-2, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
-2, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5,
-1, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
-1, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
-1, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
-1, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5,
0, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
0, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
0, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
0, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5,
1, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
1, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
1, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
1, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5,
2, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
2, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
2, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
2, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5,
3, -3.927171, -6.050244, 0, -0.5, 0.5, 0.5,
3, -3.927171, -6.050244, 1, -0.5, 0.5, 0.5,
3, -3.927171, -6.050244, 1, 1.5, 0.5, 0.5,
3, -3.927171, -6.050244, 0, 1.5, 0.5, 0.5
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
-3.227835, -3, -5.258262,
-3.227835, 3, -5.258262,
-3.227835, -3, -5.258262,
-3.39167, -3, -5.522256,
-3.227835, -2, -5.258262,
-3.39167, -2, -5.522256,
-3.227835, -1, -5.258262,
-3.39167, -1, -5.522256,
-3.227835, 0, -5.258262,
-3.39167, 0, -5.522256,
-3.227835, 1, -5.258262,
-3.39167, 1, -5.522256,
-3.227835, 2, -5.258262,
-3.39167, 2, -5.522256,
-3.227835, 3, -5.258262,
-3.39167, 3, -5.522256
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
-3.719341, -3, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, -3, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, -3, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, -3, -6.050244, 0, 1.5, 0.5, 0.5,
-3.719341, -2, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, -2, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, -2, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, -2, -6.050244, 0, 1.5, 0.5, 0.5,
-3.719341, -1, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, -1, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, -1, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, -1, -6.050244, 0, 1.5, 0.5, 0.5,
-3.719341, 0, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, 0, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, 0, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, 0, -6.050244, 0, 1.5, 0.5, 0.5,
-3.719341, 1, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, 1, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, 1, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, 1, -6.050244, 0, 1.5, 0.5, 0.5,
-3.719341, 2, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, 2, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, 2, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, 2, -6.050244, 0, 1.5, 0.5, 0.5,
-3.719341, 3, -6.050244, 0, -0.5, 0.5, 0.5,
-3.719341, 3, -6.050244, 1, -0.5, 0.5, 0.5,
-3.719341, 3, -6.050244, 1, 1.5, 0.5, 0.5,
-3.719341, 3, -6.050244, 0, 1.5, 0.5, 0.5
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
-3.227835, -3.42663, -4,
-3.227835, -3.42663, 4,
-3.227835, -3.42663, -4,
-3.39167, -3.593477, -4,
-3.227835, -3.42663, -2,
-3.39167, -3.593477, -2,
-3.227835, -3.42663, 0,
-3.39167, -3.593477, 0,
-3.227835, -3.42663, 2,
-3.39167, -3.593477, 2,
-3.227835, -3.42663, 4,
-3.39167, -3.593477, 4
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
-3.719341, -3.927171, -4, 0, -0.5, 0.5, 0.5,
-3.719341, -3.927171, -4, 1, -0.5, 0.5, 0.5,
-3.719341, -3.927171, -4, 1, 1.5, 0.5, 0.5,
-3.719341, -3.927171, -4, 0, 1.5, 0.5, 0.5,
-3.719341, -3.927171, -2, 0, -0.5, 0.5, 0.5,
-3.719341, -3.927171, -2, 1, -0.5, 0.5, 0.5,
-3.719341, -3.927171, -2, 1, 1.5, 0.5, 0.5,
-3.719341, -3.927171, -2, 0, 1.5, 0.5, 0.5,
-3.719341, -3.927171, 0, 0, -0.5, 0.5, 0.5,
-3.719341, -3.927171, 0, 1, -0.5, 0.5, 0.5,
-3.719341, -3.927171, 0, 1, 1.5, 0.5, 0.5,
-3.719341, -3.927171, 0, 0, 1.5, 0.5, 0.5,
-3.719341, -3.927171, 2, 0, -0.5, 0.5, 0.5,
-3.719341, -3.927171, 2, 1, -0.5, 0.5, 0.5,
-3.719341, -3.927171, 2, 1, 1.5, 0.5, 0.5,
-3.719341, -3.927171, 2, 0, 1.5, 0.5, 0.5,
-3.719341, -3.927171, 4, 0, -0.5, 0.5, 0.5,
-3.719341, -3.927171, 4, 1, -0.5, 0.5, 0.5,
-3.719341, -3.927171, 4, 1, 1.5, 0.5, 0.5,
-3.719341, -3.927171, 4, 0, 1.5, 0.5, 0.5
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
-3.227835, -3.42663, -5.258262,
-3.227835, 3.247259, -5.258262,
-3.227835, -3.42663, 5.301496,
-3.227835, 3.247259, 5.301496,
-3.227835, -3.42663, -5.258262,
-3.227835, -3.42663, 5.301496,
-3.227835, 3.247259, -5.258262,
-3.227835, 3.247259, 5.301496,
-3.227835, -3.42663, -5.258262,
3.325576, -3.42663, -5.258262,
-3.227835, -3.42663, 5.301496,
3.325576, -3.42663, 5.301496,
-3.227835, 3.247259, -5.258262,
3.325576, 3.247259, -5.258262,
-3.227835, 3.247259, 5.301496,
3.325576, 3.247259, 5.301496,
3.325576, -3.42663, -5.258262,
3.325576, 3.247259, -5.258262,
3.325576, -3.42663, 5.301496,
3.325576, 3.247259, 5.301496,
3.325576, -3.42663, -5.258262,
3.325576, -3.42663, 5.301496,
3.325576, 3.247259, -5.258262,
3.325576, 3.247259, 5.301496
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
var radius = 7.532656;
var distance = 33.51364;
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
mvMatrix.translate( -0.0488708, 0.08968508, -0.0216167 );
mvMatrix.scale( 1.242781, 1.220346, 0.771273 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.51364);
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
dodemorph<-read.table("dodemorph.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dodemorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
```

```r
y<-dodemorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
```

```r
z<-dodemorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
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
-3.132397, -0.395856, -2.18968, 0, 0, 1, 1, 1,
-3.116323, 0.515121, -1.286254, 1, 0, 0, 1, 1,
-2.722587, 0.2138055, -1.600147, 1, 0, 0, 1, 1,
-2.555324, 0.3777436, -2.049686, 1, 0, 0, 1, 1,
-2.489963, 0.6440502, -1.285531, 1, 0, 0, 1, 1,
-2.410777, -1.360424, -3.158362, 1, 0, 0, 1, 1,
-2.397831, 0.8308436, 0.3713034, 0, 0, 0, 1, 1,
-2.371286, 1.053468, -1.785028, 0, 0, 0, 1, 1,
-2.369, -0.6780346, -0.6851989, 0, 0, 0, 1, 1,
-2.331217, -1.057381, -2.723934, 0, 0, 0, 1, 1,
-2.32898, -0.8568212, -1.498842, 0, 0, 0, 1, 1,
-2.299204, -0.2192793, -2.130235, 0, 0, 0, 1, 1,
-2.27123, 0.438139, -2.508558, 0, 0, 0, 1, 1,
-2.257422, 0.1266042, -0.5576505, 1, 1, 1, 1, 1,
-2.234521, -0.8302758, -0.6186775, 1, 1, 1, 1, 1,
-2.219459, -0.8726941, -2.856874, 1, 1, 1, 1, 1,
-2.190151, 1.099703, -0.4905081, 1, 1, 1, 1, 1,
-2.179549, -1.535975, -1.754674, 1, 1, 1, 1, 1,
-2.133192, 0.2337352, 0.1729522, 1, 1, 1, 1, 1,
-2.109052, -0.2160389, -2.218878, 1, 1, 1, 1, 1,
-2.097599, -1.031699, -2.214147, 1, 1, 1, 1, 1,
-2.03196, -1.102259, 1.681389, 1, 1, 1, 1, 1,
-2.020833, 0.7378651, -2.556475, 1, 1, 1, 1, 1,
-1.996733, 0.8422484, -0.2324388, 1, 1, 1, 1, 1,
-1.957599, 0.2854075, -1.136453, 1, 1, 1, 1, 1,
-1.952877, -0.1054073, -0.7436446, 1, 1, 1, 1, 1,
-1.948696, 0.306954, -0.879612, 1, 1, 1, 1, 1,
-1.945871, -0.1831041, -0.9181559, 1, 1, 1, 1, 1,
-1.94234, 2.776388, -0.1196966, 0, 0, 1, 1, 1,
-1.933148, 0.6286782, 0.9925609, 1, 0, 0, 1, 1,
-1.919534, 1.370083, -0.5064833, 1, 0, 0, 1, 1,
-1.905486, -1.489463, -2.317215, 1, 0, 0, 1, 1,
-1.899313, -0.5319384, -3.4271, 1, 0, 0, 1, 1,
-1.899109, -0.3465086, -0.3059689, 1, 0, 0, 1, 1,
-1.870454, 0.5040623, -0.7314043, 0, 0, 0, 1, 1,
-1.811766, -0.3212545, -1.499858, 0, 0, 0, 1, 1,
-1.809334, 0.4536263, -1.190801, 0, 0, 0, 1, 1,
-1.794564, -1.146122, -3.64814, 0, 0, 0, 1, 1,
-1.787584, -0.3274606, -2.079077, 0, 0, 0, 1, 1,
-1.78713, -1.143527, -1.21879, 0, 0, 0, 1, 1,
-1.779794, -0.8237358, -3.387102, 0, 0, 0, 1, 1,
-1.776718, -1.14721, -1.520014, 1, 1, 1, 1, 1,
-1.776549, 0.9925042, -0.8522571, 1, 1, 1, 1, 1,
-1.766838, 0.1044679, -1.319371, 1, 1, 1, 1, 1,
-1.760532, -0.885217, -3.154499, 1, 1, 1, 1, 1,
-1.754663, -0.8203655, -1.414328, 1, 1, 1, 1, 1,
-1.748088, 0.774588, -1.568144, 1, 1, 1, 1, 1,
-1.729879, -2.599069, -3.111276, 1, 1, 1, 1, 1,
-1.726891, -1.170283, -2.137325, 1, 1, 1, 1, 1,
-1.726804, 0.8220105, -1.121859, 1, 1, 1, 1, 1,
-1.717485, -0.8470098, -0.7311088, 1, 1, 1, 1, 1,
-1.707228, -0.2271692, -1.522674, 1, 1, 1, 1, 1,
-1.695967, -0.3798258, -2.26292, 1, 1, 1, 1, 1,
-1.694356, 0.8990043, -1.078937, 1, 1, 1, 1, 1,
-1.651904, 0.1890758, 0.4943319, 1, 1, 1, 1, 1,
-1.648096, -1.289914, -1.830243, 1, 1, 1, 1, 1,
-1.6228, -1.14864, -0.8208767, 0, 0, 1, 1, 1,
-1.620997, 0.8038485, -0.9711691, 1, 0, 0, 1, 1,
-1.602946, -0.1031574, -1.849642, 1, 0, 0, 1, 1,
-1.59238, 0.9940087, -0.6791584, 1, 0, 0, 1, 1,
-1.526456, -0.05467947, -0.2879556, 1, 0, 0, 1, 1,
-1.521934, -0.09641796, -3.382076, 1, 0, 0, 1, 1,
-1.519818, 0.3815252, -1.932703, 0, 0, 0, 1, 1,
-1.519522, 1.087527, 0.002438251, 0, 0, 0, 1, 1,
-1.513091, 0.7679371, -0.4758252, 0, 0, 0, 1, 1,
-1.508263, 1.298719, -1.452373, 0, 0, 0, 1, 1,
-1.505508, -0.6909943, -2.802748, 0, 0, 0, 1, 1,
-1.487561, -0.67641, -0.6631032, 0, 0, 0, 1, 1,
-1.479854, 1.193015, -1.568395, 0, 0, 0, 1, 1,
-1.474236, 0.9201966, -2.042394, 1, 1, 1, 1, 1,
-1.46563, 0.2590223, -2.100577, 1, 1, 1, 1, 1,
-1.45687, 1.018366, -0.5346205, 1, 1, 1, 1, 1,
-1.456415, -3.25142, -3.173138, 1, 1, 1, 1, 1,
-1.45428, -0.0143169, -3.227171, 1, 1, 1, 1, 1,
-1.453416, 0.4941503, -1.150409, 1, 1, 1, 1, 1,
-1.448674, -0.7381569, -2.109692, 1, 1, 1, 1, 1,
-1.445573, -1.509277, -2.25549, 1, 1, 1, 1, 1,
-1.437762, -0.6178621, -2.376216, 1, 1, 1, 1, 1,
-1.43745, 0.2920711, -2.120043, 1, 1, 1, 1, 1,
-1.433137, 0.2391411, -2.663251, 1, 1, 1, 1, 1,
-1.432165, 0.4333954, -1.33776, 1, 1, 1, 1, 1,
-1.425256, -0.7742177, -1.055488, 1, 1, 1, 1, 1,
-1.418689, -0.140606, -0.3239858, 1, 1, 1, 1, 1,
-1.414602, -0.8975008, -2.646995, 1, 1, 1, 1, 1,
-1.412157, 0.9468186, -2.203039, 0, 0, 1, 1, 1,
-1.398897, -0.7799734, -2.57957, 1, 0, 0, 1, 1,
-1.393013, 0.9512267, -3.369264, 1, 0, 0, 1, 1,
-1.384994, 0.6385999, -0.6878863, 1, 0, 0, 1, 1,
-1.382295, -0.9414659, -4.85974, 1, 0, 0, 1, 1,
-1.372342, -0.5469673, -1.654802, 1, 0, 0, 1, 1,
-1.367166, -0.1032169, -1.388397, 0, 0, 0, 1, 1,
-1.36135, 0.1306405, -2.245929, 0, 0, 0, 1, 1,
-1.35873, -0.1299686, -3.152388, 0, 0, 0, 1, 1,
-1.352624, -0.7797696, -3.223682, 0, 0, 0, 1, 1,
-1.347008, -0.1341564, -2.387886, 0, 0, 0, 1, 1,
-1.343531, 0.4530285, -1.87713, 0, 0, 0, 1, 1,
-1.335503, 0.07732956, -1.823143, 0, 0, 0, 1, 1,
-1.333322, 0.1345745, -0.9846866, 1, 1, 1, 1, 1,
-1.33064, 1.831444, 0.4319749, 1, 1, 1, 1, 1,
-1.311721, -0.2063483, -2.813222, 1, 1, 1, 1, 1,
-1.294083, -0.4510356, -3.541774, 1, 1, 1, 1, 1,
-1.286873, -0.3848847, 0.8740256, 1, 1, 1, 1, 1,
-1.283867, -0.7856178, -1.28446, 1, 1, 1, 1, 1,
-1.278219, -1.635225, -0.4280894, 1, 1, 1, 1, 1,
-1.276285, 0.07966452, -1.818719, 1, 1, 1, 1, 1,
-1.275216, 0.05673648, -1.864681, 1, 1, 1, 1, 1,
-1.275201, -0.9379168, -2.555238, 1, 1, 1, 1, 1,
-1.274426, -0.149975, -1.081729, 1, 1, 1, 1, 1,
-1.262388, 0.370537, -3.17891, 1, 1, 1, 1, 1,
-1.256614, 1.500683, -2.148191, 1, 1, 1, 1, 1,
-1.255443, 0.0589509, -2.161057, 1, 1, 1, 1, 1,
-1.246113, -0.8661636, -2.643918, 1, 1, 1, 1, 1,
-1.244041, 0.09109201, -1.517797, 0, 0, 1, 1, 1,
-1.239671, -0.5827019, -2.567579, 1, 0, 0, 1, 1,
-1.236359, 1.571166, -0.04866581, 1, 0, 0, 1, 1,
-1.235237, -1.702713, -1.125118, 1, 0, 0, 1, 1,
-1.213263, 0.3695626, -0.5753996, 1, 0, 0, 1, 1,
-1.212183, 0.1848851, -1.98269, 1, 0, 0, 1, 1,
-1.207365, -0.0748475, -1.398995, 0, 0, 0, 1, 1,
-1.201325, -0.06642251, -0.8910624, 0, 0, 0, 1, 1,
-1.197863, 1.703395, -1.69032, 0, 0, 0, 1, 1,
-1.19056, -0.5065429, -2.601362, 0, 0, 0, 1, 1,
-1.18869, -0.8643221, -4.495821, 0, 0, 0, 1, 1,
-1.184126, -0.9252405, -2.390948, 0, 0, 0, 1, 1,
-1.176785, 1.267181, -1.328732, 0, 0, 0, 1, 1,
-1.166225, -0.09199513, -2.487497, 1, 1, 1, 1, 1,
-1.165904, 0.3432612, -2.234868, 1, 1, 1, 1, 1,
-1.164796, 0.464869, -0.1808738, 1, 1, 1, 1, 1,
-1.163315, -1.009825, -2.713115, 1, 1, 1, 1, 1,
-1.159632, 2.379306, 0.3649998, 1, 1, 1, 1, 1,
-1.150506, -2.106085, -2.891042, 1, 1, 1, 1, 1,
-1.149738, 0.7621824, -0.376789, 1, 1, 1, 1, 1,
-1.146034, -0.185308, -0.5157982, 1, 1, 1, 1, 1,
-1.144559, 1.292431, -0.3444738, 1, 1, 1, 1, 1,
-1.140197, 1.093088, -0.3070026, 1, 1, 1, 1, 1,
-1.135424, -0.5511207, -2.255477, 1, 1, 1, 1, 1,
-1.133181, -1.093057, -2.869623, 1, 1, 1, 1, 1,
-1.128581, 0.3168203, -1.398124, 1, 1, 1, 1, 1,
-1.125039, 0.3245232, -1.958186, 1, 1, 1, 1, 1,
-1.117218, 0.9374474, -0.01083972, 1, 1, 1, 1, 1,
-1.113775, -0.6829242, -2.128442, 0, 0, 1, 1, 1,
-1.109935, -0.9445168, -3.199138, 1, 0, 0, 1, 1,
-1.108461, -0.2223958, -3.280612, 1, 0, 0, 1, 1,
-1.104505, -0.2182414, -1.387724, 1, 0, 0, 1, 1,
-1.104419, -2.128638, -1.854011, 1, 0, 0, 1, 1,
-1.104277, -0.3020271, -4.167821, 1, 0, 0, 1, 1,
-1.096285, -0.5268394, -3.150712, 0, 0, 0, 1, 1,
-1.09621, -0.03329397, -1.764901, 0, 0, 0, 1, 1,
-1.092857, -1.576341, -0.05718122, 0, 0, 0, 1, 1,
-1.092427, 0.2045767, -1.637967, 0, 0, 0, 1, 1,
-1.089811, 0.4204804, -1.350632, 0, 0, 0, 1, 1,
-1.089764, -0.3201001, -3.297257, 0, 0, 0, 1, 1,
-1.065322, 0.765312, -0.3962228, 0, 0, 0, 1, 1,
-1.064, -1.536683, -2.650769, 1, 1, 1, 1, 1,
-1.063402, 1.074164, -0.5061602, 1, 1, 1, 1, 1,
-1.055774, 1.303272, -0.5146266, 1, 1, 1, 1, 1,
-1.045095, -1.184001, -0.9779794, 1, 1, 1, 1, 1,
-1.04106, 0.596274, -1.929562, 1, 1, 1, 1, 1,
-1.040306, 0.9579538, 0.3184339, 1, 1, 1, 1, 1,
-1.034151, -0.531795, -1.683796, 1, 1, 1, 1, 1,
-1.032759, -0.4370914, -0.5636957, 1, 1, 1, 1, 1,
-1.026396, 0.9673154, 0.776189, 1, 1, 1, 1, 1,
-1.026393, 0.7874962, -1.120414, 1, 1, 1, 1, 1,
-1.0224, -1.553243, -3.21219, 1, 1, 1, 1, 1,
-1.013296, 0.2016197, -1.003709, 1, 1, 1, 1, 1,
-1.010539, 1.536555, -0.8141474, 1, 1, 1, 1, 1,
-1.009341, 0.06355684, -1.698788, 1, 1, 1, 1, 1,
-1.008655, -0.7441838, -1.442102, 1, 1, 1, 1, 1,
-1.003147, 0.2017654, -1.843672, 0, 0, 1, 1, 1,
-1.001639, -0.2761841, -2.669684, 1, 0, 0, 1, 1,
-0.9974722, -1.031143, -3.455895, 1, 0, 0, 1, 1,
-0.993245, -0.7905841, -1.231045, 1, 0, 0, 1, 1,
-0.9929699, -0.06101575, -1.922196, 1, 0, 0, 1, 1,
-0.9912595, 0.05980087, -2.164657, 1, 0, 0, 1, 1,
-0.98905, -0.4071614, -0.6446298, 0, 0, 0, 1, 1,
-0.9877212, -0.107426, -1.111489, 0, 0, 0, 1, 1,
-0.9840848, 1.696785, -0.2203695, 0, 0, 0, 1, 1,
-0.9811351, -0.02334155, -1.750188, 0, 0, 0, 1, 1,
-0.9802635, 0.1918883, -0.8137828, 0, 0, 0, 1, 1,
-0.9757783, 0.2419225, -0.8466492, 0, 0, 0, 1, 1,
-0.9751241, -0.7058755, -1.806655, 0, 0, 0, 1, 1,
-0.9710156, 0.3540173, -0.7374222, 1, 1, 1, 1, 1,
-0.9709743, -0.2765221, -1.175591, 1, 1, 1, 1, 1,
-0.9667338, -0.9505078, -3.129528, 1, 1, 1, 1, 1,
-0.9650759, 0.9392728, 0.4830014, 1, 1, 1, 1, 1,
-0.964616, 0.08577077, -0.3935558, 1, 1, 1, 1, 1,
-0.9617046, -2.310314, -3.269801, 1, 1, 1, 1, 1,
-0.9601812, -0.7582918, -2.232821, 1, 1, 1, 1, 1,
-0.9581367, 0.3401489, -0.826961, 1, 1, 1, 1, 1,
-0.945986, 1.218932, -2.115152, 1, 1, 1, 1, 1,
-0.9446779, -0.6163157, -2.405566, 1, 1, 1, 1, 1,
-0.9394038, -0.1837298, -3.050103, 1, 1, 1, 1, 1,
-0.9358146, 1.432036, 0.1647317, 1, 1, 1, 1, 1,
-0.930755, 0.1436665, -0.8258295, 1, 1, 1, 1, 1,
-0.9279226, 0.1123128, -1.194524, 1, 1, 1, 1, 1,
-0.922646, -0.9741314, -1.764707, 1, 1, 1, 1, 1,
-0.9224357, 0.6358348, -1.374461, 0, 0, 1, 1, 1,
-0.9180259, 0.1563117, -2.12677, 1, 0, 0, 1, 1,
-0.9101298, -1.682269, -1.919009, 1, 0, 0, 1, 1,
-0.9048145, 1.148885, -1.260533, 1, 0, 0, 1, 1,
-0.9003425, 1.802851, -0.7005375, 1, 0, 0, 1, 1,
-0.8992947, 0.4333316, -0.7094271, 1, 0, 0, 1, 1,
-0.8931282, -0.3279645, -1.955641, 0, 0, 0, 1, 1,
-0.8928347, -0.4317254, -2.737627, 0, 0, 0, 1, 1,
-0.8890215, -0.596103, -1.733537, 0, 0, 0, 1, 1,
-0.8819191, -0.6752892, -3.075639, 0, 0, 0, 1, 1,
-0.8799987, 0.3166549, -1.665092, 0, 0, 0, 1, 1,
-0.8780045, 0.691114, -2.456914, 0, 0, 0, 1, 1,
-0.8772618, 1.07652, -0.07073146, 0, 0, 0, 1, 1,
-0.8765476, -0.7731084, -1.024067, 1, 1, 1, 1, 1,
-0.8667255, 0.3149477, 0.2262538, 1, 1, 1, 1, 1,
-0.8661866, -0.4382529, -2.441908, 1, 1, 1, 1, 1,
-0.8648695, -0.1888685, -4.011942, 1, 1, 1, 1, 1,
-0.8645737, -1.950922, -1.646265, 1, 1, 1, 1, 1,
-0.8576639, 0.03893271, -1.237178, 1, 1, 1, 1, 1,
-0.8536159, -1.202998, -2.750653, 1, 1, 1, 1, 1,
-0.8520564, 0.5578663, 0.1362527, 1, 1, 1, 1, 1,
-0.8484756, 0.07079574, -0.7937448, 1, 1, 1, 1, 1,
-0.8468702, -1.084021, -2.526564, 1, 1, 1, 1, 1,
-0.8465945, 1.637399, -0.04363904, 1, 1, 1, 1, 1,
-0.8429049, -0.4470269, -2.193093, 1, 1, 1, 1, 1,
-0.8334414, 1.645391, -1.195808, 1, 1, 1, 1, 1,
-0.8275775, 0.6367269, -1.814602, 1, 1, 1, 1, 1,
-0.8270298, -2.097224, -3.19258, 1, 1, 1, 1, 1,
-0.8219455, 0.6403792, -0.707463, 0, 0, 1, 1, 1,
-0.8198344, -0.4598718, -2.031261, 1, 0, 0, 1, 1,
-0.8165929, -1.442758, -3.086271, 1, 0, 0, 1, 1,
-0.8084025, 0.7009287, -1.800018, 1, 0, 0, 1, 1,
-0.8034196, -0.08533582, -3.048595, 1, 0, 0, 1, 1,
-0.8021231, -0.6744117, -3.016855, 1, 0, 0, 1, 1,
-0.8013059, -0.2362926, -1.607931, 0, 0, 0, 1, 1,
-0.7991545, -1.116647, -2.029805, 0, 0, 0, 1, 1,
-0.798034, 1.349761, -1.086372, 0, 0, 0, 1, 1,
-0.7836257, 0.2983298, 0.9631578, 0, 0, 0, 1, 1,
-0.7820671, -0.302939, -0.4688723, 0, 0, 0, 1, 1,
-0.7780474, 0.6650389, 0.6567464, 0, 0, 0, 1, 1,
-0.777558, -0.4670407, -0.9498569, 0, 0, 0, 1, 1,
-0.7762192, -0.1945426, -1.345244, 1, 1, 1, 1, 1,
-0.7754997, -0.13953, 0.2789642, 1, 1, 1, 1, 1,
-0.7721974, 0.8278652, -0.8161836, 1, 1, 1, 1, 1,
-0.7694803, -0.3146805, -2.57939, 1, 1, 1, 1, 1,
-0.7660872, 1.084822, -3.02161, 1, 1, 1, 1, 1,
-0.7596893, 1.567149, -1.395442, 1, 1, 1, 1, 1,
-0.7584918, 0.3437683, -0.05572786, 1, 1, 1, 1, 1,
-0.7562554, -0.452857, -3.00047, 1, 1, 1, 1, 1,
-0.7557436, 0.2224439, -0.5614921, 1, 1, 1, 1, 1,
-0.7519346, -3.329437, -2.780899, 1, 1, 1, 1, 1,
-0.7489272, 0.152292, -0.2645928, 1, 1, 1, 1, 1,
-0.7441517, 0.5116431, -1.369365, 1, 1, 1, 1, 1,
-0.7369597, -1.073632, -1.446133, 1, 1, 1, 1, 1,
-0.7360681, -0.9411187, -3.609339, 1, 1, 1, 1, 1,
-0.7339825, -1.865413, -2.700598, 1, 1, 1, 1, 1,
-0.7315397, 0.1475511, -1.056393, 0, 0, 1, 1, 1,
-0.7307502, 1.171131, -0.27851, 1, 0, 0, 1, 1,
-0.7298461, 1.277338, -1.648045, 1, 0, 0, 1, 1,
-0.7221831, -0.3015247, -3.403589, 1, 0, 0, 1, 1,
-0.716252, 0.1827418, -1.728465, 1, 0, 0, 1, 1,
-0.7141693, 0.3862339, -0.4585105, 1, 0, 0, 1, 1,
-0.7102485, -0.7248989, -1.556167, 0, 0, 0, 1, 1,
-0.7069409, -0.9390938, -2.650225, 0, 0, 0, 1, 1,
-0.7056012, 1.334135, -1.038919, 0, 0, 0, 1, 1,
-0.7047501, -0.253658, -2.344855, 0, 0, 0, 1, 1,
-0.7041029, -0.5190791, -3.820949, 0, 0, 0, 1, 1,
-0.6961015, -0.04119023, -0.6067223, 0, 0, 0, 1, 1,
-0.6960001, -0.9509364, -3.311865, 0, 0, 0, 1, 1,
-0.6902533, 1.49732, -1.064767, 1, 1, 1, 1, 1,
-0.6878029, 0.4264014, -0.5901408, 1, 1, 1, 1, 1,
-0.6817303, -0.6499638, -1.397832, 1, 1, 1, 1, 1,
-0.6816911, -0.3814435, -3.918874, 1, 1, 1, 1, 1,
-0.6805142, 0.7157331, 0.1599488, 1, 1, 1, 1, 1,
-0.6800186, -0.6377237, -4.142502, 1, 1, 1, 1, 1,
-0.6776268, 1.052339, -1.972265, 1, 1, 1, 1, 1,
-0.6747072, -0.7427704, -2.283963, 1, 1, 1, 1, 1,
-0.6740458, 0.6406656, -0.4322305, 1, 1, 1, 1, 1,
-0.6696522, 0.03701021, -2.179194, 1, 1, 1, 1, 1,
-0.6694324, 1.20822, 1.397625, 1, 1, 1, 1, 1,
-0.6651307, 0.5831293, -0.336781, 1, 1, 1, 1, 1,
-0.6587214, 1.825916, -1.355248, 1, 1, 1, 1, 1,
-0.6583893, -0.157701, -1.422523, 1, 1, 1, 1, 1,
-0.657519, 0.01664362, 0.07267166, 1, 1, 1, 1, 1,
-0.6550761, -0.3424636, -1.977381, 0, 0, 1, 1, 1,
-0.65311, -0.1365079, -2.086958, 1, 0, 0, 1, 1,
-0.6513854, -0.2359428, -1.744251, 1, 0, 0, 1, 1,
-0.6446277, 0.8819171, -1.133166, 1, 0, 0, 1, 1,
-0.6400858, -0.5860513, -1.966771, 1, 0, 0, 1, 1,
-0.6376041, -0.7186782, -2.626822, 1, 0, 0, 1, 1,
-0.6357672, 0.7413624, -2.430942, 0, 0, 0, 1, 1,
-0.6328073, -0.3242788, -4.400524, 0, 0, 0, 1, 1,
-0.6312582, 0.3088873, 0.3097231, 0, 0, 0, 1, 1,
-0.6310227, 0.6116728, -0.7622161, 0, 0, 0, 1, 1,
-0.6299261, -0.8679228, -3.699575, 0, 0, 0, 1, 1,
-0.628369, -1.27903, -3.5727, 0, 0, 0, 1, 1,
-0.6181863, -0.3933769, -1.080849, 0, 0, 0, 1, 1,
-0.616738, 0.9223907, -1.056561, 1, 1, 1, 1, 1,
-0.6152942, -1.393252, -2.52463, 1, 1, 1, 1, 1,
-0.6094831, -1.428164, -2.029014, 1, 1, 1, 1, 1,
-0.6072241, 0.7167788, -0.3791032, 1, 1, 1, 1, 1,
-0.6003762, 0.4725037, 0.4529178, 1, 1, 1, 1, 1,
-0.5993835, -0.3166239, -1.433842, 1, 1, 1, 1, 1,
-0.5934235, 0.6200637, -0.7311354, 1, 1, 1, 1, 1,
-0.5923342, -0.8447498, -2.993183, 1, 1, 1, 1, 1,
-0.5870236, -0.6226057, -1.537443, 1, 1, 1, 1, 1,
-0.5837657, 0.749059, 0.4889114, 1, 1, 1, 1, 1,
-0.5787497, -1.299516, -2.691449, 1, 1, 1, 1, 1,
-0.5694095, -1.669768, -0.7953263, 1, 1, 1, 1, 1,
-0.5684087, -0.9004733, -2.127402, 1, 1, 1, 1, 1,
-0.5569928, 0.5266364, -2.086539, 1, 1, 1, 1, 1,
-0.5548816, -0.7573529, -1.489788, 1, 1, 1, 1, 1,
-0.5439948, -0.2708308, -3.247817, 0, 0, 1, 1, 1,
-0.5350686, -0.1099109, -2.286999, 1, 0, 0, 1, 1,
-0.5288222, -1.152686, -3.184215, 1, 0, 0, 1, 1,
-0.5275017, 0.5150698, -1.474138, 1, 0, 0, 1, 1,
-0.526741, 0.6428765, -1.273932, 1, 0, 0, 1, 1,
-0.5218281, -0.3587328, -2.699193, 1, 0, 0, 1, 1,
-0.5058661, 0.2306754, 0.3783885, 0, 0, 0, 1, 1,
-0.5057844, 1.396144, -1.102739, 0, 0, 0, 1, 1,
-0.5046155, -0.4005152, -1.727549, 0, 0, 0, 1, 1,
-0.5003678, -1.353815, -3.512503, 0, 0, 0, 1, 1,
-0.4991468, 0.02154562, -1.224572, 0, 0, 0, 1, 1,
-0.4979415, -0.5942357, -2.53459, 0, 0, 0, 1, 1,
-0.4943697, 1.685821, -0.5263648, 0, 0, 0, 1, 1,
-0.4914218, 0.2541884, -0.3646432, 1, 1, 1, 1, 1,
-0.4839397, 1.124354, -1.150748, 1, 1, 1, 1, 1,
-0.4832068, -0.1114536, -2.589585, 1, 1, 1, 1, 1,
-0.4810309, 0.3893291, -1.152483, 1, 1, 1, 1, 1,
-0.4803872, 1.134918, -1.13454, 1, 1, 1, 1, 1,
-0.4792668, 1.340666, -3.308838, 1, 1, 1, 1, 1,
-0.478088, -2.465083, -4.556689, 1, 1, 1, 1, 1,
-0.4726063, 0.9999339, -1.383514, 1, 1, 1, 1, 1,
-0.470113, -0.3406019, -3.370378, 1, 1, 1, 1, 1,
-0.4693906, 0.2454868, -0.3254687, 1, 1, 1, 1, 1,
-0.4688398, -0.48555, -1.984423, 1, 1, 1, 1, 1,
-0.4671486, 0.2538675, -1.381155, 1, 1, 1, 1, 1,
-0.467132, -1.000292, -1.262048, 1, 1, 1, 1, 1,
-0.4642733, 0.7350968, -1.308521, 1, 1, 1, 1, 1,
-0.4602821, -0.4896354, -3.287061, 1, 1, 1, 1, 1,
-0.4585738, 0.1113118, -1.225383, 0, 0, 1, 1, 1,
-0.4573316, -2.651694, -4.593492, 1, 0, 0, 1, 1,
-0.4546792, -1.344949, -3.507581, 1, 0, 0, 1, 1,
-0.4493525, -0.3473443, -2.858609, 1, 0, 0, 1, 1,
-0.4438094, -0.6081966, -2.586704, 1, 0, 0, 1, 1,
-0.4388446, 0.5274793, 1.45545, 1, 0, 0, 1, 1,
-0.4342069, -0.7781675, -1.441877, 0, 0, 0, 1, 1,
-0.4327734, -0.34894, -1.961013, 0, 0, 0, 1, 1,
-0.4301641, 0.6718471, -1.000025, 0, 0, 0, 1, 1,
-0.4287332, 0.2683977, -2.39997, 0, 0, 0, 1, 1,
-0.4266596, 0.4699499, -2.249243, 0, 0, 0, 1, 1,
-0.4244534, 0.6149755, -2.193567, 0, 0, 0, 1, 1,
-0.4186776, -1.787811, -2.740665, 0, 0, 0, 1, 1,
-0.4132506, 1.153752, -0.3097531, 1, 1, 1, 1, 1,
-0.4100692, 0.6748461, -0.5896404, 1, 1, 1, 1, 1,
-0.408279, 0.557561, -0.6581748, 1, 1, 1, 1, 1,
-0.407203, 1.728519, -0.2001277, 1, 1, 1, 1, 1,
-0.4001251, -0.3958213, -2.306263, 1, 1, 1, 1, 1,
-0.3999848, 2.144033, -0.4380207, 1, 1, 1, 1, 1,
-0.3961681, -1.188911, -2.672327, 1, 1, 1, 1, 1,
-0.3931128, 0.7453148, -0.2786645, 1, 1, 1, 1, 1,
-0.3911474, 0.9796038, -0.6008089, 1, 1, 1, 1, 1,
-0.3910683, 0.1660016, -0.1635004, 1, 1, 1, 1, 1,
-0.3909191, -0.9046649, -3.071892, 1, 1, 1, 1, 1,
-0.3902809, 0.6508614, -2.152212, 1, 1, 1, 1, 1,
-0.3894323, -1.39886, -3.663477, 1, 1, 1, 1, 1,
-0.3879333, -1.925961, -4.045879, 1, 1, 1, 1, 1,
-0.3854237, 0.8311396, -1.839983, 1, 1, 1, 1, 1,
-0.3853763, 0.6890815, -0.04806142, 0, 0, 1, 1, 1,
-0.3840999, 0.3064038, -0.0676252, 1, 0, 0, 1, 1,
-0.3838776, -0.1033296, -0.9829978, 1, 0, 0, 1, 1,
-0.3768929, -0.5370729, -1.267386, 1, 0, 0, 1, 1,
-0.3726671, 0.6611888, -1.883157, 1, 0, 0, 1, 1,
-0.367958, -1.227118, -3.230382, 1, 0, 0, 1, 1,
-0.3675064, 0.7375277, 1.427428, 0, 0, 0, 1, 1,
-0.3642091, -0.2381178, -1.606816, 0, 0, 0, 1, 1,
-0.3639532, -0.3646298, -2.338851, 0, 0, 0, 1, 1,
-0.3623037, 0.7512281, -1.475501, 0, 0, 0, 1, 1,
-0.3597961, -1.714115, -1.678595, 0, 0, 0, 1, 1,
-0.3560332, -0.1485103, -3.654725, 0, 0, 0, 1, 1,
-0.3543816, 0.2768683, -1.106582, 0, 0, 0, 1, 1,
-0.3496757, -0.6848799, -4.274839, 1, 1, 1, 1, 1,
-0.3470423, -2.434391, -1.779157, 1, 1, 1, 1, 1,
-0.34536, -1.132305, -3.077369, 1, 1, 1, 1, 1,
-0.3438568, -1.128117, -2.346758, 1, 1, 1, 1, 1,
-0.3395891, 0.3791619, 1.104511, 1, 1, 1, 1, 1,
-0.3366591, 1.248927, 0.5853519, 1, 1, 1, 1, 1,
-0.3335494, -0.8555422, -4.064649, 1, 1, 1, 1, 1,
-0.3314638, 0.3457694, -0.5418202, 1, 1, 1, 1, 1,
-0.3293457, 0.6986663, -1.714134, 1, 1, 1, 1, 1,
-0.3224654, -0.4885698, -2.363712, 1, 1, 1, 1, 1,
-0.3201707, 1.660001, 2.16215, 1, 1, 1, 1, 1,
-0.3185029, -1.540813, -3.11381, 1, 1, 1, 1, 1,
-0.3174041, 0.6192116, 0.4354767, 1, 1, 1, 1, 1,
-0.317113, 1.051596, 1.213677, 1, 1, 1, 1, 1,
-0.314218, 0.8734547, 1.018344, 1, 1, 1, 1, 1,
-0.313061, 0.1435383, -2.355099, 0, 0, 1, 1, 1,
-0.3126231, 0.988898, -0.5292244, 1, 0, 0, 1, 1,
-0.3097414, 0.9618765, -2.048761, 1, 0, 0, 1, 1,
-0.3080626, 0.697606, -1.086323, 1, 0, 0, 1, 1,
-0.3061448, -0.5015188, -1.894957, 1, 0, 0, 1, 1,
-0.3028509, 0.2031693, -1.685209, 1, 0, 0, 1, 1,
-0.2986065, 0.07122166, -2.531528, 0, 0, 0, 1, 1,
-0.2967456, 0.7400939, -0.0479681, 0, 0, 0, 1, 1,
-0.2883203, 0.6335356, -3.282458, 0, 0, 0, 1, 1,
-0.2865471, -0.3383555, -4.3424, 0, 0, 0, 1, 1,
-0.2844727, 0.3717587, -0.6996208, 0, 0, 0, 1, 1,
-0.281091, 0.4667621, -2.61359, 0, 0, 0, 1, 1,
-0.2805563, 1.277207, -0.3992035, 0, 0, 0, 1, 1,
-0.2804952, 1.20941, -1.778458, 1, 1, 1, 1, 1,
-0.2756384, 0.6390933, -0.3151228, 1, 1, 1, 1, 1,
-0.2730085, 0.1809056, -0.4838112, 1, 1, 1, 1, 1,
-0.270129, 0.2519682, -1.159511, 1, 1, 1, 1, 1,
-0.2668287, -0.3528629, -2.683145, 1, 1, 1, 1, 1,
-0.266199, -0.9960673, -2.627987, 1, 1, 1, 1, 1,
-0.2656035, -0.6232899, -1.433595, 1, 1, 1, 1, 1,
-0.2618152, 0.06760346, -0.6460392, 1, 1, 1, 1, 1,
-0.258078, 0.3888503, -3.436189, 1, 1, 1, 1, 1,
-0.2532512, 2.083368, -0.303537, 1, 1, 1, 1, 1,
-0.2439579, -0.006339559, -2.104413, 1, 1, 1, 1, 1,
-0.2389661, -1.665854, -2.635968, 1, 1, 1, 1, 1,
-0.2335347, -0.8720734, -1.949072, 1, 1, 1, 1, 1,
-0.2302371, 1.320624, 0.7341897, 1, 1, 1, 1, 1,
-0.2269232, 1.05309, -1.267797, 1, 1, 1, 1, 1,
-0.2247609, -0.5061007, -2.574454, 0, 0, 1, 1, 1,
-0.2229213, 0.2927513, -0.4519769, 1, 0, 0, 1, 1,
-0.2215175, 0.1610627, -1.092421, 1, 0, 0, 1, 1,
-0.2208421, -0.4972729, -3.236542, 1, 0, 0, 1, 1,
-0.2173266, 0.2019664, -0.804565, 1, 0, 0, 1, 1,
-0.2152765, -0.4308402, -1.89168, 1, 0, 0, 1, 1,
-0.2079394, 1.003256, 0.4062904, 0, 0, 0, 1, 1,
-0.2070305, 0.6485484, 0.3639539, 0, 0, 0, 1, 1,
-0.2062621, 0.1234402, -1.08317, 0, 0, 0, 1, 1,
-0.1993227, 0.7685826, -0.6691418, 0, 0, 0, 1, 1,
-0.1985448, 0.2178682, -0.06632921, 0, 0, 0, 1, 1,
-0.1955629, 0.9547668, -1.818597, 0, 0, 0, 1, 1,
-0.1914756, 0.7919902, 0.373824, 0, 0, 0, 1, 1,
-0.191398, 0.5375553, -0.903475, 1, 1, 1, 1, 1,
-0.1905818, -1.081753, -3.540406, 1, 1, 1, 1, 1,
-0.1850641, -0.9094687, -4.103664, 1, 1, 1, 1, 1,
-0.184844, -1.510837, -3.378525, 1, 1, 1, 1, 1,
-0.1758095, 0.3786115, -1.108378, 1, 1, 1, 1, 1,
-0.170083, -0.109097, -3.269812, 1, 1, 1, 1, 1,
-0.1663119, 0.9627557, -0.142397, 1, 1, 1, 1, 1,
-0.1655226, -2.509421, -1.01662, 1, 1, 1, 1, 1,
-0.1641077, -1.097897, -2.707373, 1, 1, 1, 1, 1,
-0.1634451, 1.41285, -0.2903947, 1, 1, 1, 1, 1,
-0.158239, -1.150724, -1.640818, 1, 1, 1, 1, 1,
-0.1537865, 1.804686, 0.0264665, 1, 1, 1, 1, 1,
-0.1466004, -0.6972785, -3.822978, 1, 1, 1, 1, 1,
-0.1458228, 0.7654331, -0.3091259, 1, 1, 1, 1, 1,
-0.136893, -0.1695749, -2.38874, 1, 1, 1, 1, 1,
-0.1323965, -0.8997868, -2.03811, 0, 0, 1, 1, 1,
-0.1323328, -0.3272061, -3.168212, 1, 0, 0, 1, 1,
-0.1294672, -0.2677637, -2.480966, 1, 0, 0, 1, 1,
-0.1253349, 2.311831, -2.080091, 1, 0, 0, 1, 1,
-0.1208416, 0.386018, 1.172486, 1, 0, 0, 1, 1,
-0.119549, 1.084643, 0.1815652, 1, 0, 0, 1, 1,
-0.1178395, 1.179676, -1.253637, 0, 0, 0, 1, 1,
-0.1067026, -2.0725, -4.724662, 0, 0, 0, 1, 1,
-0.105649, -0.02637888, -2.461627, 0, 0, 0, 1, 1,
-0.1045296, 1.141703, -0.848448, 0, 0, 0, 1, 1,
-0.1004385, -0.9580566, -4.783748, 0, 0, 0, 1, 1,
-0.09852327, -1.718127, -3.558255, 0, 0, 0, 1, 1,
-0.09589428, -2.177857, -3.351921, 0, 0, 0, 1, 1,
-0.0911727, 1.611019, 0.5651315, 1, 1, 1, 1, 1,
-0.08835457, -0.03760002, -2.966255, 1, 1, 1, 1, 1,
-0.0785908, -1.396106, -2.758214, 1, 1, 1, 1, 1,
-0.07811026, 1.152417, -0.3419274, 1, 1, 1, 1, 1,
-0.0760714, -0.4897998, -4.801039, 1, 1, 1, 1, 1,
-0.0713002, -0.2449806, -2.599962, 1, 1, 1, 1, 1,
-0.06904507, 0.1066322, 0.6058403, 1, 1, 1, 1, 1,
-0.06805051, -1.797261, -4.616469, 1, 1, 1, 1, 1,
-0.06691827, -1.186972, -1.815821, 1, 1, 1, 1, 1,
-0.06551973, -1.271341, -2.451532, 1, 1, 1, 1, 1,
-0.05905349, -1.474297, -3.720657, 1, 1, 1, 1, 1,
-0.0562964, 0.1129585, -2.77352, 1, 1, 1, 1, 1,
-0.04954971, 0.02865234, -3.318116, 1, 1, 1, 1, 1,
-0.0441242, -1.645702, -3.324645, 1, 1, 1, 1, 1,
-0.04266011, -1.008002, -2.444162, 1, 1, 1, 1, 1,
-0.04118745, 0.1525442, 0.2737584, 0, 0, 1, 1, 1,
-0.04049304, -1.224266, -3.793252, 1, 0, 0, 1, 1,
-0.03860327, -0.04631244, -3.700388, 1, 0, 0, 1, 1,
-0.03790816, 1.528107, -2.26905, 1, 0, 0, 1, 1,
-0.03594961, -0.7390184, -4.043449, 1, 0, 0, 1, 1,
-0.03555123, -1.026626, -1.829858, 1, 0, 0, 1, 1,
-0.03485324, 0.3496479, -0.6521604, 0, 0, 0, 1, 1,
-0.03462584, -1.248028, -3.10801, 0, 0, 0, 1, 1,
-0.03383816, -0.03043982, -2.68818, 0, 0, 0, 1, 1,
-0.03246142, -0.3230329, -3.459838, 0, 0, 0, 1, 1,
-0.02807984, 0.4448105, -0.8462568, 0, 0, 0, 1, 1,
-0.01267108, -0.426515, -3.943155, 0, 0, 0, 1, 1,
-0.01045799, -1.957873, -2.945992, 0, 0, 0, 1, 1,
-0.00546167, -1.718335, -3.50367, 1, 1, 1, 1, 1,
-0.005181124, 0.05194113, -1.15853, 1, 1, 1, 1, 1,
-0.004575197, -1.149879, -3.168226, 1, 1, 1, 1, 1,
-0.003654586, 0.8376085, 3.231617, 1, 1, 1, 1, 1,
-0.003242561, -0.4888536, -1.405861, 1, 1, 1, 1, 1,
-0.001652889, -0.01462428, -5.104479, 1, 1, 1, 1, 1,
-0.0009060798, 0.3922183, -0.3865134, 1, 1, 1, 1, 1,
0.0008942427, 0.646831, -1.079124, 1, 1, 1, 1, 1,
0.003899187, 1.127338, 0.8165829, 1, 1, 1, 1, 1,
0.00566352, 1.13195, 0.2933105, 1, 1, 1, 1, 1,
0.007553441, 0.648596, -0.4195689, 1, 1, 1, 1, 1,
0.009543316, -1.062729, 3.843739, 1, 1, 1, 1, 1,
0.01322797, -1.797099, 2.63996, 1, 1, 1, 1, 1,
0.01416923, -2.382306, 4.162588, 1, 1, 1, 1, 1,
0.02002527, 1.26063, 0.6797708, 1, 1, 1, 1, 1,
0.02061283, 1.776705, 1.387427, 0, 0, 1, 1, 1,
0.02188515, -0.7829171, 3.495247, 1, 0, 0, 1, 1,
0.02275149, -1.186093, 3.604089, 1, 0, 0, 1, 1,
0.02619207, -0.3045388, 3.334017, 1, 0, 0, 1, 1,
0.02748769, -0.05566749, 3.926036, 1, 0, 0, 1, 1,
0.02920714, 1.163846, -0.280439, 1, 0, 0, 1, 1,
0.03245615, -1.466791, 2.325079, 0, 0, 0, 1, 1,
0.04219783, -2.442905, 0.3069906, 0, 0, 0, 1, 1,
0.04659956, 0.04088061, 1.264891, 0, 0, 0, 1, 1,
0.04830324, -0.6772282, 3.016229, 0, 0, 0, 1, 1,
0.05211833, -0.2240222, 2.443371, 0, 0, 0, 1, 1,
0.05224482, -0.3231213, 4.195021, 0, 0, 0, 1, 1,
0.05606455, -0.1012092, 2.670504, 0, 0, 0, 1, 1,
0.05721922, 1.257912, 1.167417, 1, 1, 1, 1, 1,
0.05800802, -1.090055, 2.878501, 1, 1, 1, 1, 1,
0.05934777, 0.3109612, 1.08597, 1, 1, 1, 1, 1,
0.06223488, 1.808381, 0.4626116, 1, 1, 1, 1, 1,
0.06313299, -0.8213685, 2.973558, 1, 1, 1, 1, 1,
0.06388772, 0.05235993, 1.102724, 1, 1, 1, 1, 1,
0.06599086, -0.3843923, 2.653638, 1, 1, 1, 1, 1,
0.06903069, -0.5269557, 2.996344, 1, 1, 1, 1, 1,
0.06961372, -0.5141909, 4.351189, 1, 1, 1, 1, 1,
0.07557635, -0.3745623, 2.679784, 1, 1, 1, 1, 1,
0.07936109, -0.3347792, 3.651135, 1, 1, 1, 1, 1,
0.08928324, -2.019636, 1.00163, 1, 1, 1, 1, 1,
0.09154782, 1.976038, -1.054051, 1, 1, 1, 1, 1,
0.09486454, -0.2377697, 3.596764, 1, 1, 1, 1, 1,
0.09588615, 0.3635673, 0.4267764, 1, 1, 1, 1, 1,
0.09652635, 0.2546697, 0.8191387, 0, 0, 1, 1, 1,
0.1007706, 1.669618, 0.9878412, 1, 0, 0, 1, 1,
0.1040617, -0.4903707, 4.269839, 1, 0, 0, 1, 1,
0.1087622, 1.388749, -0.4505627, 1, 0, 0, 1, 1,
0.1107918, -0.8358131, 3.08977, 1, 0, 0, 1, 1,
0.1142704, -0.36073, 2.383103, 1, 0, 0, 1, 1,
0.1205033, -1.36567, 3.080533, 0, 0, 0, 1, 1,
0.1217693, 0.9733649, -0.05064427, 0, 0, 0, 1, 1,
0.1268042, 0.5589023, 0.447266, 0, 0, 0, 1, 1,
0.1298833, 1.001046, -1.239503, 0, 0, 0, 1, 1,
0.1327338, -1.130302, 1.534154, 0, 0, 0, 1, 1,
0.1333682, -1.335342, 2.071599, 0, 0, 0, 1, 1,
0.1335106, -0.4946251, 2.371301, 0, 0, 0, 1, 1,
0.1369484, 0.8286725, 0.4359204, 1, 1, 1, 1, 1,
0.1384437, -0.9824656, 3.089062, 1, 1, 1, 1, 1,
0.1416797, -0.4117019, 2.393186, 1, 1, 1, 1, 1,
0.1498353, 1.244336, 1.346195, 1, 1, 1, 1, 1,
0.1507526, 0.422479, 0.6422731, 1, 1, 1, 1, 1,
0.1532763, -1.411175, 3.863043, 1, 1, 1, 1, 1,
0.1560782, -0.3199137, 3.205306, 1, 1, 1, 1, 1,
0.1561316, 0.08655148, 3.331285, 1, 1, 1, 1, 1,
0.1610866, 0.03411534, 1.857725, 1, 1, 1, 1, 1,
0.1624072, -1.286205, 3.025933, 1, 1, 1, 1, 1,
0.1625524, 1.303296, -0.6470875, 1, 1, 1, 1, 1,
0.1698621, 0.5048865, 0.7441115, 1, 1, 1, 1, 1,
0.1710899, -0.7222651, 1.961713, 1, 1, 1, 1, 1,
0.1721943, -0.3857994, 1.786186, 1, 1, 1, 1, 1,
0.1750751, -0.1102071, 2.1782, 1, 1, 1, 1, 1,
0.1755938, 1.087234, 2.590657, 0, 0, 1, 1, 1,
0.1799164, 0.04234657, 0.1567141, 1, 0, 0, 1, 1,
0.1840144, -1.078534, 3.925666, 1, 0, 0, 1, 1,
0.1867848, -0.6805437, 3.148309, 1, 0, 0, 1, 1,
0.1880565, -0.2877591, 2.07796, 1, 0, 0, 1, 1,
0.1885496, 0.3933431, 0.9000082, 1, 0, 0, 1, 1,
0.1890233, -0.3795339, 3.99495, 0, 0, 0, 1, 1,
0.1927833, -1.395468, 2.642468, 0, 0, 0, 1, 1,
0.1984885, -1.473339, 3.846465, 0, 0, 0, 1, 1,
0.1986794, 1.716449, 0.3249631, 0, 0, 0, 1, 1,
0.2038319, 0.3779641, -0.4111756, 0, 0, 0, 1, 1,
0.2050635, -1.240783, 3.063033, 0, 0, 0, 1, 1,
0.2055446, 0.1419292, 2.328849, 0, 0, 0, 1, 1,
0.2073319, 0.9933575, -1.072336, 1, 1, 1, 1, 1,
0.2104381, -1.157274, 3.803895, 1, 1, 1, 1, 1,
0.2129048, -0.2884898, 2.877143, 1, 1, 1, 1, 1,
0.21877, -0.4904073, 0.5509086, 1, 1, 1, 1, 1,
0.2226937, 1.981021, 0.9316041, 1, 1, 1, 1, 1,
0.2245189, 0.521177, 0.4878823, 1, 1, 1, 1, 1,
0.2248992, 1.79641, 0.5406201, 1, 1, 1, 1, 1,
0.2250616, -0.9521018, 2.459564, 1, 1, 1, 1, 1,
0.2291106, -0.6848343, 1.64256, 1, 1, 1, 1, 1,
0.2391223, -0.3180569, 3.169615, 1, 1, 1, 1, 1,
0.2493493, 0.180236, 2.479813, 1, 1, 1, 1, 1,
0.2523596, 1.821824, 0.4490103, 1, 1, 1, 1, 1,
0.2533978, 0.8197702, 1.795594, 1, 1, 1, 1, 1,
0.2539849, -0.2725576, 4.768812, 1, 1, 1, 1, 1,
0.2598843, 0.9189464, 0.04115212, 1, 1, 1, 1, 1,
0.2605805, 1.087873, 1.16791, 0, 0, 1, 1, 1,
0.2606061, 0.7188172, 2.481596, 1, 0, 0, 1, 1,
0.2631835, -1.278163, 3.326566, 1, 0, 0, 1, 1,
0.2648443, -1.300987, 1.321338, 1, 0, 0, 1, 1,
0.2650811, -0.7685995, 1.87081, 1, 0, 0, 1, 1,
0.2691563, -0.6757605, 2.810581, 1, 0, 0, 1, 1,
0.2722073, 0.08730594, 2.310074, 0, 0, 0, 1, 1,
0.2722826, 0.9833044, 0.7370669, 0, 0, 0, 1, 1,
0.2802548, -1.442481, 2.48006, 0, 0, 0, 1, 1,
0.2851847, -1.667496, 3.601738, 0, 0, 0, 1, 1,
0.288873, -0.2075526, 3.004321, 0, 0, 0, 1, 1,
0.2896188, 1.791574, 1.494369, 0, 0, 0, 1, 1,
0.291208, 0.8579094, 0.2239164, 0, 0, 0, 1, 1,
0.2920192, -0.01409953, 2.71039, 1, 1, 1, 1, 1,
0.2942375, 2.473502, -0.7431145, 1, 1, 1, 1, 1,
0.2944848, 0.7617427, -1.467925, 1, 1, 1, 1, 1,
0.298617, 0.7737051, -1.069332, 1, 1, 1, 1, 1,
0.2993428, -1.138055, 3.763684, 1, 1, 1, 1, 1,
0.2994288, 0.4215957, -0.3363464, 1, 1, 1, 1, 1,
0.299868, -1.196734, 0.306032, 1, 1, 1, 1, 1,
0.3017259, -0.4522173, 2.096637, 1, 1, 1, 1, 1,
0.3050506, -0.9257153, 0.9382684, 1, 1, 1, 1, 1,
0.3060871, 0.2747619, 2.837689, 1, 1, 1, 1, 1,
0.3109517, 0.1421774, -0.9072033, 1, 1, 1, 1, 1,
0.3155252, -0.4498998, 2.649008, 1, 1, 1, 1, 1,
0.3158449, -0.3413163, 2.712538, 1, 1, 1, 1, 1,
0.3159771, 1.220623, -0.4410638, 1, 1, 1, 1, 1,
0.3163919, 0.2504007, 0.8248635, 1, 1, 1, 1, 1,
0.3193349, 0.5937191, 2.160744, 0, 0, 1, 1, 1,
0.3254018, -0.08797038, 2.01834, 1, 0, 0, 1, 1,
0.3303111, 1.252855, 0.6904829, 1, 0, 0, 1, 1,
0.3305798, 0.355498, 1.15965, 1, 0, 0, 1, 1,
0.3307034, 0.7997203, 0.2731365, 1, 0, 0, 1, 1,
0.3309936, 0.4724944, 2.170963, 1, 0, 0, 1, 1,
0.3318277, -0.477617, 3.37918, 0, 0, 0, 1, 1,
0.332884, 0.6591999, 1.395373, 0, 0, 0, 1, 1,
0.337537, -0.3334173, 2.390421, 0, 0, 0, 1, 1,
0.3395425, 0.5001649, 1.524104, 0, 0, 0, 1, 1,
0.3401978, 0.06873927, 1.133573, 0, 0, 0, 1, 1,
0.3421655, -0.4282395, 3.558008, 0, 0, 0, 1, 1,
0.3524496, -0.3576041, 0.8547949, 0, 0, 0, 1, 1,
0.3573459, 1.730759, 1.170377, 1, 1, 1, 1, 1,
0.3585244, 0.3851587, 1.829272, 1, 1, 1, 1, 1,
0.3596509, 1.262623, -1.675213, 1, 1, 1, 1, 1,
0.3613865, 0.9502413, -0.2837666, 1, 1, 1, 1, 1,
0.3632948, 0.2205906, 1.339544, 1, 1, 1, 1, 1,
0.3655666, -0.04976995, -0.2990144, 1, 1, 1, 1, 1,
0.3658934, 1.386201, 0.5695605, 1, 1, 1, 1, 1,
0.3695258, -0.3948165, 2.263671, 1, 1, 1, 1, 1,
0.371425, -1.035373, 2.028271, 1, 1, 1, 1, 1,
0.3721075, 0.5166565, 0.4203468, 1, 1, 1, 1, 1,
0.3751756, 1.301538, 0.4782678, 1, 1, 1, 1, 1,
0.3768246, -0.5512152, 1.838514, 1, 1, 1, 1, 1,
0.3819188, 0.3550682, 0.1654665, 1, 1, 1, 1, 1,
0.3830455, -0.3416696, 1.293904, 1, 1, 1, 1, 1,
0.3835222, -0.847865, 4.753456, 1, 1, 1, 1, 1,
0.3843123, -1.709788, 4.357139, 0, 0, 1, 1, 1,
0.3846824, -0.6347191, 3.0019, 1, 0, 0, 1, 1,
0.3848615, 0.2967017, -0.2781639, 1, 0, 0, 1, 1,
0.3858134, 0.08513854, 1.757595, 1, 0, 0, 1, 1,
0.3868623, -0.215308, -0.06004197, 1, 0, 0, 1, 1,
0.3925889, -0.2861724, 3.725926, 1, 0, 0, 1, 1,
0.3936613, 0.4629867, 0.2451438, 0, 0, 0, 1, 1,
0.3936655, 1.215326, -1.609799, 0, 0, 0, 1, 1,
0.3953407, -1.130967, 2.724839, 0, 0, 0, 1, 1,
0.399499, -0.2012653, 1.941472, 0, 0, 0, 1, 1,
0.399809, 1.053432, -0.6561193, 0, 0, 0, 1, 1,
0.4016848, -1.192194, 3.828575, 0, 0, 0, 1, 1,
0.40175, 0.6018675, 0.4045005, 0, 0, 0, 1, 1,
0.402575, 1.034413, 0.8730984, 1, 1, 1, 1, 1,
0.4038079, -0.1597895, 1.868273, 1, 1, 1, 1, 1,
0.4060486, 0.07962619, 1.06507, 1, 1, 1, 1, 1,
0.4068981, 1.453983, 1.072879, 1, 1, 1, 1, 1,
0.4095801, 0.9021571, 1.722757, 1, 1, 1, 1, 1,
0.4096086, 0.5942202, -0.187639, 1, 1, 1, 1, 1,
0.4096254, -1.400054, 4.048238, 1, 1, 1, 1, 1,
0.4117177, -0.4591087, 1.600651, 1, 1, 1, 1, 1,
0.4121086, -1.433373, 1.788986, 1, 1, 1, 1, 1,
0.4156283, -0.807924, 2.432684, 1, 1, 1, 1, 1,
0.4161007, 0.004847867, 1.954211, 1, 1, 1, 1, 1,
0.419604, -0.2352488, 1.668193, 1, 1, 1, 1, 1,
0.4198043, -0.509835, 3.401622, 1, 1, 1, 1, 1,
0.4216935, -1.284467, 3.619214, 1, 1, 1, 1, 1,
0.4250279, 0.1172365, 1.597017, 1, 1, 1, 1, 1,
0.4287064, 0.2948222, 1.024316, 0, 0, 1, 1, 1,
0.4292141, 1.357958, 2.392595, 1, 0, 0, 1, 1,
0.4292917, -0.9436247, 3.984869, 1, 0, 0, 1, 1,
0.4351272, 0.02633259, 1.723177, 1, 0, 0, 1, 1,
0.4369831, 1.098048, 1.307252, 1, 0, 0, 1, 1,
0.4394157, -1.955428, 0.6268744, 1, 0, 0, 1, 1,
0.4395382, 0.477128, 1.415384, 0, 0, 0, 1, 1,
0.4409446, 0.259423, 1.710529, 0, 0, 0, 1, 1,
0.4450433, -1.344738, 1.920041, 0, 0, 0, 1, 1,
0.4538288, -0.3584704, 3.217406, 0, 0, 0, 1, 1,
0.4541022, 0.03677062, 2.829721, 0, 0, 0, 1, 1,
0.455234, 0.4708074, 0.1034741, 0, 0, 0, 1, 1,
0.4616328, -1.108507, 1.766769, 0, 0, 0, 1, 1,
0.4630575, -1.114677, 2.519214, 1, 1, 1, 1, 1,
0.4656677, 1.076608, 1.904878, 1, 1, 1, 1, 1,
0.4674349, -1.417284, 5.147713, 1, 1, 1, 1, 1,
0.4676284, -0.1267366, 2.56406, 1, 1, 1, 1, 1,
0.476142, -1.313107, 2.93098, 1, 1, 1, 1, 1,
0.476544, -0.5447407, 2.131258, 1, 1, 1, 1, 1,
0.4769906, -0.826546, 3.30401, 1, 1, 1, 1, 1,
0.4789319, 0.929419, 1.0065, 1, 1, 1, 1, 1,
0.4790758, 0.789902, 1.203223, 1, 1, 1, 1, 1,
0.4839366, -0.2520736, 3.050045, 1, 1, 1, 1, 1,
0.4895647, 0.4951741, 1.15863, 1, 1, 1, 1, 1,
0.4932631, -0.02536135, 2.362597, 1, 1, 1, 1, 1,
0.4937941, 0.7941788, 2.09702, 1, 1, 1, 1, 1,
0.5030406, -0.3384813, 3.296311, 1, 1, 1, 1, 1,
0.5076461, -0.351891, 1.419765, 1, 1, 1, 1, 1,
0.5112439, -0.3539774, 3.552257, 0, 0, 1, 1, 1,
0.5127997, -1.878272, 5.045677, 1, 0, 0, 1, 1,
0.5158626, 1.983254, 1.387146, 1, 0, 0, 1, 1,
0.5171073, 1.798756, -0.8700796, 1, 0, 0, 1, 1,
0.5189298, -1.029825, 3.811707, 1, 0, 0, 1, 1,
0.5223954, -0.662228, 2.960886, 1, 0, 0, 1, 1,
0.5230109, 0.9742995, 0.4460039, 0, 0, 0, 1, 1,
0.5243156, 0.2234662, 1.87183, 0, 0, 0, 1, 1,
0.5246603, -0.1213234, 3.433557, 0, 0, 0, 1, 1,
0.5258422, -0.542725, 2.167666, 0, 0, 0, 1, 1,
0.5265585, 1.32313, 1.453954, 0, 0, 0, 1, 1,
0.5271716, 0.596324, -1.059963, 0, 0, 0, 1, 1,
0.528045, 1.182192, 1.411528, 0, 0, 0, 1, 1,
0.5310656, -0.02890633, 3.47122, 1, 1, 1, 1, 1,
0.532805, -0.6161162, 2.980552, 1, 1, 1, 1, 1,
0.5373689, -0.2356969, 1.504646, 1, 1, 1, 1, 1,
0.5400514, 0.6278376, 0.8436443, 1, 1, 1, 1, 1,
0.5416425, 0.1514282, 0.3971686, 1, 1, 1, 1, 1,
0.5423747, 0.8823781, 2.87842, 1, 1, 1, 1, 1,
0.5498296, 0.71775, -0.1723891, 1, 1, 1, 1, 1,
0.5604503, -0.2309186, 1.216286, 1, 1, 1, 1, 1,
0.5610251, 0.1723753, 0.7000178, 1, 1, 1, 1, 1,
0.5658044, 0.6101309, -0.1966812, 1, 1, 1, 1, 1,
0.5672909, -0.6499556, 2.205836, 1, 1, 1, 1, 1,
0.5707673, -1.303446, 4.278709, 1, 1, 1, 1, 1,
0.5750586, 0.1001804, -0.368709, 1, 1, 1, 1, 1,
0.5770398, -0.2780923, 2.170229, 1, 1, 1, 1, 1,
0.580287, 0.5654398, -0.1666903, 1, 1, 1, 1, 1,
0.5817943, -1.363377, 3.440021, 0, 0, 1, 1, 1,
0.5848776, 0.9980885, 1.968587, 1, 0, 0, 1, 1,
0.5854331, 1.438015, 1.554594, 1, 0, 0, 1, 1,
0.5857229, 1.628303, 0.8393816, 1, 0, 0, 1, 1,
0.5863353, -0.8763773, 1.728586, 1, 0, 0, 1, 1,
0.5894405, 0.2511351, 2.310731, 1, 0, 0, 1, 1,
0.5914954, -1.831049, 3.645918, 0, 0, 0, 1, 1,
0.5991043, -1.441009, 1.518508, 0, 0, 0, 1, 1,
0.6027101, 0.08144981, 2.198184, 0, 0, 0, 1, 1,
0.6129659, -0.3471628, 2.101565, 0, 0, 0, 1, 1,
0.6134424, -1.275298, 3.247981, 0, 0, 0, 1, 1,
0.6172477, 0.02903273, 0.7665738, 0, 0, 0, 1, 1,
0.6222513, -0.5303314, 2.787817, 0, 0, 0, 1, 1,
0.6244775, -1.856175, 2.598974, 1, 1, 1, 1, 1,
0.6263409, -1.308377, 3.531246, 1, 1, 1, 1, 1,
0.6305183, -1.241973, 2.326279, 1, 1, 1, 1, 1,
0.6309834, -1.226816, 3.098908, 1, 1, 1, 1, 1,
0.6334231, -0.3611135, 1.751642, 1, 1, 1, 1, 1,
0.633786, -0.6871348, 4.533535, 1, 1, 1, 1, 1,
0.6353646, -1.015748, 3.980659, 1, 1, 1, 1, 1,
0.6381602, 0.09118606, 2.717067, 1, 1, 1, 1, 1,
0.6409889, 0.3893691, 0.3319788, 1, 1, 1, 1, 1,
0.6425731, -0.01189743, 0.6767434, 1, 1, 1, 1, 1,
0.645867, -0.0238892, 1.635941, 1, 1, 1, 1, 1,
0.6475385, 1.064828, 1.390617, 1, 1, 1, 1, 1,
0.6583692, -0.06171042, 2.516682, 1, 1, 1, 1, 1,
0.66091, 0.3556958, 1.335759, 1, 1, 1, 1, 1,
0.6653482, -0.1401908, 1.444181, 1, 1, 1, 1, 1,
0.6700612, -0.4978392, 1.113019, 0, 0, 1, 1, 1,
0.6719444, -1.261713, 2.268017, 1, 0, 0, 1, 1,
0.6724073, 1.089122, 2.035126, 1, 0, 0, 1, 1,
0.6761845, -0.8392303, 2.343698, 1, 0, 0, 1, 1,
0.6835831, 0.6231595, -2.045434, 1, 0, 0, 1, 1,
0.6844988, 2.015753, 0.645418, 1, 0, 0, 1, 1,
0.6879014, -0.55293, 3.233392, 0, 0, 0, 1, 1,
0.6904349, 1.811636, 0.4051215, 0, 0, 0, 1, 1,
0.6922953, 0.08372921, 1.938506, 0, 0, 0, 1, 1,
0.6948202, 0.6734835, 1.248177, 0, 0, 0, 1, 1,
0.6982259, 1.163344, -0.2396403, 0, 0, 0, 1, 1,
0.7019131, 0.0931766, 0.6063259, 0, 0, 0, 1, 1,
0.7046218, 0.5041922, 0.482948, 0, 0, 0, 1, 1,
0.7050176, -0.004627814, 1.29167, 1, 1, 1, 1, 1,
0.705974, 0.6295747, -0.1022968, 1, 1, 1, 1, 1,
0.7152492, -1.672054, 3.875431, 1, 1, 1, 1, 1,
0.7228314, 0.9939929, -0.6710185, 1, 1, 1, 1, 1,
0.7271627, -0.2056354, 1.34586, 1, 1, 1, 1, 1,
0.7307282, -0.06805988, 0.09056936, 1, 1, 1, 1, 1,
0.7364713, -1.636064, 2.308512, 1, 1, 1, 1, 1,
0.736659, -0.5771796, 1.326222, 1, 1, 1, 1, 1,
0.7371803, 0.1585071, 2.307037, 1, 1, 1, 1, 1,
0.7376292, -0.1430759, 1.442728, 1, 1, 1, 1, 1,
0.749116, -0.117305, 2.006281, 1, 1, 1, 1, 1,
0.7564951, 0.8598455, -0.2585186, 1, 1, 1, 1, 1,
0.7572361, -0.7804205, 0.902964, 1, 1, 1, 1, 1,
0.7615684, 0.9482645, -0.6438983, 1, 1, 1, 1, 1,
0.7631733, 0.8484647, 0.3377642, 1, 1, 1, 1, 1,
0.7647692, -1.221856, 2.818085, 0, 0, 1, 1, 1,
0.7647747, -0.09740421, 0.2484333, 1, 0, 0, 1, 1,
0.7684848, 0.6408176, 2.615801, 1, 0, 0, 1, 1,
0.7737011, 0.1463458, 2.073284, 1, 0, 0, 1, 1,
0.7753285, 1.27607, 0.285694, 1, 0, 0, 1, 1,
0.7775439, -0.4616013, 2.772329, 1, 0, 0, 1, 1,
0.7801501, 0.00151166, 1.819607, 0, 0, 0, 1, 1,
0.7851659, 0.2510573, 0.390066, 0, 0, 0, 1, 1,
0.7882445, -1.409402, 1.575431, 0, 0, 0, 1, 1,
0.7885168, 0.957033, 1.278799, 0, 0, 0, 1, 1,
0.7947289, -2.228192, 2.862734, 0, 0, 0, 1, 1,
0.7956656, 0.01917134, 1.564922, 0, 0, 0, 1, 1,
0.8119003, 1.399374, 2.10288, 0, 0, 0, 1, 1,
0.8140388, -0.05490392, 1.766236, 1, 1, 1, 1, 1,
0.8188751, -0.4576229, 1.365495, 1, 1, 1, 1, 1,
0.8205507, 0.5838709, -1.172156, 1, 1, 1, 1, 1,
0.8233938, -1.287723, 3.312397, 1, 1, 1, 1, 1,
0.823908, -0.5201334, 3.552047, 1, 1, 1, 1, 1,
0.8258859, 0.5316015, 1.739709, 1, 1, 1, 1, 1,
0.8259876, 1.027263, 1.711545, 1, 1, 1, 1, 1,
0.8292787, 0.4775818, 0.4393643, 1, 1, 1, 1, 1,
0.8347878, 0.2355965, 1.298657, 1, 1, 1, 1, 1,
0.8400771, -0.03970397, 1.191991, 1, 1, 1, 1, 1,
0.8443299, -1.043501, 0.9534758, 1, 1, 1, 1, 1,
0.8445427, 0.4617392, 1.597606, 1, 1, 1, 1, 1,
0.8449455, -1.152852, 1.188471, 1, 1, 1, 1, 1,
0.8488181, -1.58187, 2.91895, 1, 1, 1, 1, 1,
0.8502069, -0.6650999, 2.23964, 1, 1, 1, 1, 1,
0.8527614, -0.8697136, 3.282013, 0, 0, 1, 1, 1,
0.8606009, -0.6304156, 2.12826, 1, 0, 0, 1, 1,
0.8629453, -0.9050661, 3.860782, 1, 0, 0, 1, 1,
0.8670744, 2.147034, 0.7933718, 1, 0, 0, 1, 1,
0.86739, -0.9747514, 2.05516, 1, 0, 0, 1, 1,
0.8673912, -0.6926819, 1.919025, 1, 0, 0, 1, 1,
0.8701365, 0.01948747, 1.487771, 0, 0, 0, 1, 1,
0.879677, -2.300731, 3.642171, 0, 0, 0, 1, 1,
0.888824, -0.4133229, 1.606952, 0, 0, 0, 1, 1,
0.8931809, -1.553425, 3.642513, 0, 0, 0, 1, 1,
0.8932154, -0.793398, 3.654188, 0, 0, 0, 1, 1,
0.8945812, 1.199263, -0.9226935, 0, 0, 0, 1, 1,
0.898568, 0.7614632, 1.229743, 0, 0, 0, 1, 1,
0.8991504, -0.4446069, 2.658722, 1, 1, 1, 1, 1,
0.9061489, 2.544335, 2.669213, 1, 1, 1, 1, 1,
0.9087034, -0.3471398, 1.361918, 1, 1, 1, 1, 1,
0.9106153, 0.6035654, 1.864775, 1, 1, 1, 1, 1,
0.9151658, 0.7694566, 2.086841, 1, 1, 1, 1, 1,
0.9176702, -0.3293494, 0.9173499, 1, 1, 1, 1, 1,
0.9206797, -0.2824998, 0.8119479, 1, 1, 1, 1, 1,
0.9294397, 0.1141954, 0.313667, 1, 1, 1, 1, 1,
0.9296222, 0.1664811, -0.7981428, 1, 1, 1, 1, 1,
0.9445941, -0.3720915, 2.865556, 1, 1, 1, 1, 1,
0.9499511, -0.6420849, 1.695261, 1, 1, 1, 1, 1,
0.9527542, 0.4547131, -0.07580082, 1, 1, 1, 1, 1,
0.9599528, 1.86811, -0.01282522, 1, 1, 1, 1, 1,
0.9615861, 1.098589, 0.9268601, 1, 1, 1, 1, 1,
0.9617534, -1.92412, 2.554772, 1, 1, 1, 1, 1,
0.9665391, 1.041114, 2.481084, 0, 0, 1, 1, 1,
0.9746445, -0.596995, 3.374573, 1, 0, 0, 1, 1,
0.9759964, 0.8931931, -0.7275999, 1, 0, 0, 1, 1,
0.9760003, 1.379763, 0.9886116, 1, 0, 0, 1, 1,
0.9817421, -0.7097234, 2.094465, 1, 0, 0, 1, 1,
0.9824967, 0.9093025, 1.422285, 1, 0, 0, 1, 1,
0.9914361, 0.1370433, 1.804789, 0, 0, 0, 1, 1,
0.9927612, 0.01178846, 3.027216, 0, 0, 0, 1, 1,
0.9950648, -1.294397, 2.177006, 0, 0, 0, 1, 1,
0.9966066, -2.346169, 2.412529, 0, 0, 0, 1, 1,
0.9972929, 0.5829633, 0.8961411, 0, 0, 0, 1, 1,
0.9976473, 0.7446352, 1.052414, 0, 0, 0, 1, 1,
1.003312, 0.9762199, 2.313133, 0, 0, 0, 1, 1,
1.007639, 0.8039566, 0.06076387, 1, 1, 1, 1, 1,
1.009421, 1.551494, 2.613936, 1, 1, 1, 1, 1,
1.01946, -0.6578304, 3.818052, 1, 1, 1, 1, 1,
1.020211, 0.5810072, 1.07004, 1, 1, 1, 1, 1,
1.026285, -1.247985, 1.320812, 1, 1, 1, 1, 1,
1.02873, -0.2158422, 3.525642, 1, 1, 1, 1, 1,
1.034987, 0.5105303, -0.3498071, 1, 1, 1, 1, 1,
1.043284, -0.693572, -0.270652, 1, 1, 1, 1, 1,
1.053897, 1.230004, 2.014238, 1, 1, 1, 1, 1,
1.056919, -0.4549432, 2.453633, 1, 1, 1, 1, 1,
1.069958, -2.396019, 4.709599, 1, 1, 1, 1, 1,
1.069967, -0.8469244, 1.518252, 1, 1, 1, 1, 1,
1.070597, 0.4332743, 1.603252, 1, 1, 1, 1, 1,
1.070901, -0.1205237, 2.177677, 1, 1, 1, 1, 1,
1.071121, -0.1107777, 3.077173, 1, 1, 1, 1, 1,
1.071225, -1.015955, 0.6341342, 0, 0, 1, 1, 1,
1.082819, -0.08387207, 2.540202, 1, 0, 0, 1, 1,
1.087646, -1.3283, 2.145432, 1, 0, 0, 1, 1,
1.090724, 0.2164739, 0.142197, 1, 0, 0, 1, 1,
1.096933, -1.2342, 2.864427, 1, 0, 0, 1, 1,
1.105709, -1.469857, 3.885734, 1, 0, 0, 1, 1,
1.109426, 0.04379418, 1.710563, 0, 0, 0, 1, 1,
1.126456, 1.853731, 3.509132, 0, 0, 0, 1, 1,
1.145243, -1.565792, 1.627257, 0, 0, 0, 1, 1,
1.147212, 0.5591777, 1.523756, 0, 0, 0, 1, 1,
1.149012, 0.6370403, 0.7122848, 0, 0, 0, 1, 1,
1.151605, 1.50983, 2.131719, 0, 0, 0, 1, 1,
1.153031, -0.7081115, 1.562272, 0, 0, 0, 1, 1,
1.155604, 0.7195385, 1.783136, 1, 1, 1, 1, 1,
1.164646, -0.8882163, 1.979518, 1, 1, 1, 1, 1,
1.170759, 1.646739, 1.320363, 1, 1, 1, 1, 1,
1.172613, 1.764753, 0.868294, 1, 1, 1, 1, 1,
1.174175, 0.4816468, 1.357539, 1, 1, 1, 1, 1,
1.196343, 1.148048, 0.01469515, 1, 1, 1, 1, 1,
1.199618, 0.5342921, 0.8413049, 1, 1, 1, 1, 1,
1.199888, -0.5714209, 1.378639, 1, 1, 1, 1, 1,
1.202044, 0.02747554, 4.111008, 1, 1, 1, 1, 1,
1.204086, -1.045113, 3.46, 1, 1, 1, 1, 1,
1.211981, 0.9126921, 0.8253932, 1, 1, 1, 1, 1,
1.213879, 0.8798718, 1.101328, 1, 1, 1, 1, 1,
1.218646, 1.338153, 1.33945, 1, 1, 1, 1, 1,
1.219782, -0.2667373, 1.20859, 1, 1, 1, 1, 1,
1.224236, -1.499593, 2.99086, 1, 1, 1, 1, 1,
1.232291, -0.3313197, 1.84299, 0, 0, 1, 1, 1,
1.234636, 0.78272, -0.08080582, 1, 0, 0, 1, 1,
1.24068, 0.9936163, 0.6723311, 1, 0, 0, 1, 1,
1.2416, 0.9190724, 1.003948, 1, 0, 0, 1, 1,
1.260059, 0.7889167, 1.622534, 1, 0, 0, 1, 1,
1.263738, 0.3727404, 0.1932362, 1, 0, 0, 1, 1,
1.268424, 0.07442982, 1.242427, 0, 0, 0, 1, 1,
1.271489, -0.1549612, 2.907284, 0, 0, 0, 1, 1,
1.272058, -0.2644065, 2.912559, 0, 0, 0, 1, 1,
1.274843, -1.36644, 2.941936, 0, 0, 0, 1, 1,
1.276937, 1.559216, 0.6022868, 0, 0, 0, 1, 1,
1.286556, -0.1403265, -1.48859, 0, 0, 0, 1, 1,
1.321187, -0.296291, 1.59491, 0, 0, 0, 1, 1,
1.331281, -0.04919873, 1.853881, 1, 1, 1, 1, 1,
1.349445, -0.1051064, -1.216282, 1, 1, 1, 1, 1,
1.357847, 1.066376, 1.497684, 1, 1, 1, 1, 1,
1.374698, -0.1455465, 1.246334, 1, 1, 1, 1, 1,
1.385656, -1.673608, 3.057083, 1, 1, 1, 1, 1,
1.39053, 0.3905094, -0.375057, 1, 1, 1, 1, 1,
1.392906, 1.402767, 1.710802, 1, 1, 1, 1, 1,
1.393632, 0.1114834, -0.2325426, 1, 1, 1, 1, 1,
1.396178, -0.3212492, 3.63454, 1, 1, 1, 1, 1,
1.398228, -1.219821, 1.754326, 1, 1, 1, 1, 1,
1.405273, 0.1782919, 1.129425, 1, 1, 1, 1, 1,
1.422906, 0.1959247, 0.6358773, 1, 1, 1, 1, 1,
1.424973, -0.01945329, 1.007699, 1, 1, 1, 1, 1,
1.430903, 0.04920398, 1.840395, 1, 1, 1, 1, 1,
1.431879, 1.37794, 1.572083, 1, 1, 1, 1, 1,
1.433676, -1.762852, 1.525405, 0, 0, 1, 1, 1,
1.434885, -0.6422344, 1.568979, 1, 0, 0, 1, 1,
1.440952, -0.09250425, 2.502205, 1, 0, 0, 1, 1,
1.469793, 0.7309521, 2.360559, 1, 0, 0, 1, 1,
1.472878, -0.1961921, 2.818512, 1, 0, 0, 1, 1,
1.489085, 1.408463, -0.6464451, 1, 0, 0, 1, 1,
1.501906, -1.049751, 2.750403, 0, 0, 0, 1, 1,
1.505376, -1.373578, 3.393409, 0, 0, 0, 1, 1,
1.511242, -1.132176, 1.606972, 0, 0, 0, 1, 1,
1.516619, 1.735552, 1.710703, 0, 0, 0, 1, 1,
1.520374, -0.5713065, 0.4619877, 0, 0, 0, 1, 1,
1.521015, -0.5788962, 2.459203, 0, 0, 0, 1, 1,
1.542665, 0.1969219, 2.307984, 0, 0, 0, 1, 1,
1.544708, 0.3879861, 1.069827, 1, 1, 1, 1, 1,
1.545122, 1.204059, 0.4569857, 1, 1, 1, 1, 1,
1.572954, -0.4624204, 3.257189, 1, 1, 1, 1, 1,
1.577102, -0.7905492, 1.549482, 1, 1, 1, 1, 1,
1.581416, -0.3531909, 3.919118, 1, 1, 1, 1, 1,
1.587507, -0.5616745, 2.248025, 1, 1, 1, 1, 1,
1.588036, -0.9988037, 2.982069, 1, 1, 1, 1, 1,
1.58985, 0.577253, -0.3080697, 1, 1, 1, 1, 1,
1.589996, 0.145256, 2.625901, 1, 1, 1, 1, 1,
1.59482, 1.406516, 1.765062, 1, 1, 1, 1, 1,
1.611153, -0.1581382, 0.7253547, 1, 1, 1, 1, 1,
1.611928, 0.6373642, 3.452927, 1, 1, 1, 1, 1,
1.615628, 2.028906, -0.6796451, 1, 1, 1, 1, 1,
1.619558, 0.2011154, -0.3536666, 1, 1, 1, 1, 1,
1.620124, -0.3950227, 2.105252, 1, 1, 1, 1, 1,
1.640598, -1.187023, 1.233693, 0, 0, 1, 1, 1,
1.641124, 0.8259497, 1.097518, 1, 0, 0, 1, 1,
1.653375, -0.6757717, 2.45696, 1, 0, 0, 1, 1,
1.661031, -0.05957785, 1.468219, 1, 0, 0, 1, 1,
1.671675, -1.536441, 2.661251, 1, 0, 0, 1, 1,
1.678716, -0.3777268, 3.162571, 1, 0, 0, 1, 1,
1.719249, -0.1555709, 1.625237, 0, 0, 0, 1, 1,
1.74675, -0.9193829, 3.283526, 0, 0, 0, 1, 1,
1.752348, 3.150067, 0.1100649, 0, 0, 0, 1, 1,
1.77005, -0.1393803, 2.184232, 0, 0, 0, 1, 1,
1.79239, -1.181787, 1.604771, 0, 0, 0, 1, 1,
1.797779, -0.06723677, 1.67505, 0, 0, 0, 1, 1,
1.80062, 0.4470958, 3.000291, 0, 0, 0, 1, 1,
1.821767, -1.338361, 4.58359, 1, 1, 1, 1, 1,
1.822244, -0.2666484, 3.651068, 1, 1, 1, 1, 1,
1.823789, 1.335468, 0.06829377, 1, 1, 1, 1, 1,
1.850141, 1.703829, 0.9273814, 1, 1, 1, 1, 1,
1.878343, -0.01134947, 2.525222, 1, 1, 1, 1, 1,
1.904109, 0.06755445, 1.181029, 1, 1, 1, 1, 1,
1.90619, -0.9010389, 3.258603, 1, 1, 1, 1, 1,
1.906643, 0.2471071, 0.06407363, 1, 1, 1, 1, 1,
1.952917, 2.138551, 1.236979, 1, 1, 1, 1, 1,
1.977853, -0.1721272, 0.9939283, 1, 1, 1, 1, 1,
1.989946, -1.362483, 2.002743, 1, 1, 1, 1, 1,
2.015465, -0.5143356, 1.757231, 1, 1, 1, 1, 1,
2.01563, 0.6287808, 0.8637822, 1, 1, 1, 1, 1,
2.018293, 0.8691918, 1.754723, 1, 1, 1, 1, 1,
2.020805, 1.478454, 0.6114115, 1, 1, 1, 1, 1,
2.024946, -0.6812656, 3.226115, 0, 0, 1, 1, 1,
2.047376, -0.008484332, 0.7592619, 1, 0, 0, 1, 1,
2.128578, -0.1113348, 1.408099, 1, 0, 0, 1, 1,
2.131524, 0.6841758, 1.51379, 1, 0, 0, 1, 1,
2.142181, 1.562071, 0.9722447, 1, 0, 0, 1, 1,
2.149868, -1.409481, 3.373743, 1, 0, 0, 1, 1,
2.155653, -0.5793607, 3.405843, 0, 0, 0, 1, 1,
2.17506, -0.344046, 1.039675, 0, 0, 0, 1, 1,
2.205365, -0.450835, 2.115893, 0, 0, 0, 1, 1,
2.261921, 0.6286405, 2.181576, 0, 0, 0, 1, 1,
2.311848, 0.6953357, 2.707052, 0, 0, 0, 1, 1,
2.325635, -0.835443, 0.3750234, 0, 0, 0, 1, 1,
2.421962, 0.827152, 1.36797, 0, 0, 0, 1, 1,
2.45367, -1.498041, 1.427303, 1, 1, 1, 1, 1,
2.505562, -1.936823, 0.1760847, 1, 1, 1, 1, 1,
2.512436, 1.313488, 0.448763, 1, 1, 1, 1, 1,
2.515569, -1.922024, 3.215087, 1, 1, 1, 1, 1,
2.579907, 1.421646, -1.480379, 1, 1, 1, 1, 1,
3.063722, -1.04134, 1.139437, 1, 1, 1, 1, 1,
3.230138, 0.7973923, 1.52713, 1, 1, 1, 1, 1
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
var radius = 9.397602;
var distance = 33.00868;
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
mvMatrix.translate( -0.0488708, 0.0896852, -0.0216167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.00868);
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
