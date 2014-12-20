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
-3.062354, -0.03650774, -2.069159, 1, 0, 0, 1,
-3.030702, -1.228548, -2.565963, 1, 0.007843138, 0, 1,
-2.867796, 0.3673241, -0.4435723, 1, 0.01176471, 0, 1,
-2.634307, 1.842369, -1.629653, 1, 0.01960784, 0, 1,
-2.556391, 0.4602329, -3.77561, 1, 0.02352941, 0, 1,
-2.521635, -0.9488115, -3.804556, 1, 0.03137255, 0, 1,
-2.477999, -0.1844274, -3.807764, 1, 0.03529412, 0, 1,
-2.455319, 0.1060304, -1.647459, 1, 0.04313726, 0, 1,
-2.322343, -2.125641, -2.994469, 1, 0.04705882, 0, 1,
-2.227141, 1.25097, -0.04925902, 1, 0.05490196, 0, 1,
-2.14463, -0.8721958, -1.42267, 1, 0.05882353, 0, 1,
-2.106083, -1.054421, -3.685562, 1, 0.06666667, 0, 1,
-2.094847, 0.537694, -1.723903, 1, 0.07058824, 0, 1,
-2.052987, 1.164253, -1.806479, 1, 0.07843138, 0, 1,
-2.048803, -0.204482, -1.025322, 1, 0.08235294, 0, 1,
-2.04545, -0.4669877, -3.121806, 1, 0.09019608, 0, 1,
-1.988911, 0.9690895, 0.5063565, 1, 0.09411765, 0, 1,
-1.987753, 1.324079, -0.7328775, 1, 0.1019608, 0, 1,
-1.960582, 0.05247721, -0.1277022, 1, 0.1098039, 0, 1,
-1.930948, 0.8293952, -2.150147, 1, 0.1137255, 0, 1,
-1.907061, -1.180139, -1.72668, 1, 0.1215686, 0, 1,
-1.901986, -0.08409236, -2.793977, 1, 0.1254902, 0, 1,
-1.880022, -0.5925665, 0.04476864, 1, 0.1333333, 0, 1,
-1.862677, -0.9420527, -3.224298, 1, 0.1372549, 0, 1,
-1.859077, 0.7001505, -1.518927, 1, 0.145098, 0, 1,
-1.833688, 2.036941, 0.5202502, 1, 0.1490196, 0, 1,
-1.828355, 1.115189, -0.6872098, 1, 0.1568628, 0, 1,
-1.825955, -1.892175, -2.788156, 1, 0.1607843, 0, 1,
-1.80633, -1.018094, -2.311396, 1, 0.1686275, 0, 1,
-1.797129, 0.4324147, -2.375601, 1, 0.172549, 0, 1,
-1.794636, 0.1801101, -2.507746, 1, 0.1803922, 0, 1,
-1.787606, -0.2843086, -0.7987807, 1, 0.1843137, 0, 1,
-1.78064, -0.06134874, -2.393567, 1, 0.1921569, 0, 1,
-1.779275, -0.8039523, -3.767087, 1, 0.1960784, 0, 1,
-1.777775, -0.419812, -3.479485, 1, 0.2039216, 0, 1,
-1.777698, 0.6182568, -1.861527, 1, 0.2117647, 0, 1,
-1.769689, -0.603974, -2.31651, 1, 0.2156863, 0, 1,
-1.764048, 0.5514665, -2.011618, 1, 0.2235294, 0, 1,
-1.749927, -2.112211, -2.518261, 1, 0.227451, 0, 1,
-1.735643, 0.07482085, -1.286937, 1, 0.2352941, 0, 1,
-1.728497, -1.715701, -1.580535, 1, 0.2392157, 0, 1,
-1.72771, -0.7002674, -2.721259, 1, 0.2470588, 0, 1,
-1.711829, 0.02205255, -1.944711, 1, 0.2509804, 0, 1,
-1.684399, 1.146632, 0.1456039, 1, 0.2588235, 0, 1,
-1.682303, -0.5305256, -2.13275, 1, 0.2627451, 0, 1,
-1.677215, 0.2005869, -1.608477, 1, 0.2705882, 0, 1,
-1.652993, 0.4647219, -2.056462, 1, 0.2745098, 0, 1,
-1.642011, 0.5355388, -0.8492743, 1, 0.282353, 0, 1,
-1.638335, -0.8373799, -2.88694, 1, 0.2862745, 0, 1,
-1.637967, 1.152656, -1.596119, 1, 0.2941177, 0, 1,
-1.627953, -0.8461118, -1.947192, 1, 0.3019608, 0, 1,
-1.627813, 0.489878, -0.3981304, 1, 0.3058824, 0, 1,
-1.615789, 0.4217128, -3.070382, 1, 0.3137255, 0, 1,
-1.609574, -0.5281369, -1.662343, 1, 0.3176471, 0, 1,
-1.59983, 0.7245872, -1.775668, 1, 0.3254902, 0, 1,
-1.57759, -0.06042403, -1.963148, 1, 0.3294118, 0, 1,
-1.568557, -0.2788341, 0.9135503, 1, 0.3372549, 0, 1,
-1.556605, 0.6137535, -2.287248, 1, 0.3411765, 0, 1,
-1.555265, -0.2313137, -1.353726, 1, 0.3490196, 0, 1,
-1.537544, -0.2952075, -2.080124, 1, 0.3529412, 0, 1,
-1.537279, -1.401148, -1.94416, 1, 0.3607843, 0, 1,
-1.527937, 0.7118921, -0.9459785, 1, 0.3647059, 0, 1,
-1.519747, 0.1032986, -1.179118, 1, 0.372549, 0, 1,
-1.503178, -0.1865219, -2.879516, 1, 0.3764706, 0, 1,
-1.495494, 1.257314, -2.403143, 1, 0.3843137, 0, 1,
-1.481519, -0.9640274, -1.602746, 1, 0.3882353, 0, 1,
-1.469839, 1.68346, -1.26135, 1, 0.3960784, 0, 1,
-1.460513, 0.6969175, -1.302836, 1, 0.4039216, 0, 1,
-1.456334, 2.21959, -2.213342, 1, 0.4078431, 0, 1,
-1.44438, 0.4644752, -1.994099, 1, 0.4156863, 0, 1,
-1.439243, -0.9496993, -1.845294, 1, 0.4196078, 0, 1,
-1.427724, 0.3140097, -1.356682, 1, 0.427451, 0, 1,
-1.420804, -0.1288457, -1.56631, 1, 0.4313726, 0, 1,
-1.417469, 0.3376924, -0.7838688, 1, 0.4392157, 0, 1,
-1.417023, 0.1742339, -0.3259905, 1, 0.4431373, 0, 1,
-1.403174, 1.304639, -1.347205, 1, 0.4509804, 0, 1,
-1.395053, -0.868553, -0.5043145, 1, 0.454902, 0, 1,
-1.381854, 0.2974135, -1.371477, 1, 0.4627451, 0, 1,
-1.371818, 0.5796332, -1.580889, 1, 0.4666667, 0, 1,
-1.367102, 1.184324, -0.3120025, 1, 0.4745098, 0, 1,
-1.349487, -2.247738, -3.001281, 1, 0.4784314, 0, 1,
-1.347633, 1.713478, -1.634231, 1, 0.4862745, 0, 1,
-1.347391, -0.2348614, -0.980705, 1, 0.4901961, 0, 1,
-1.33382, -0.9118308, -3.977638, 1, 0.4980392, 0, 1,
-1.329729, 0.08619939, -1.980932, 1, 0.5058824, 0, 1,
-1.329357, 0.6021368, -0.6651865, 1, 0.509804, 0, 1,
-1.324317, -1.139959, -1.616105, 1, 0.5176471, 0, 1,
-1.322102, -1.359435, -2.297266, 1, 0.5215687, 0, 1,
-1.305218, 0.3904342, -1.897574, 1, 0.5294118, 0, 1,
-1.293876, -0.7108235, -2.27487, 1, 0.5333334, 0, 1,
-1.292636, 0.5445955, -1.462803, 1, 0.5411765, 0, 1,
-1.292379, -1.344211, -1.091184, 1, 0.5450981, 0, 1,
-1.289795, 0.2784297, -1.969995, 1, 0.5529412, 0, 1,
-1.261406, -0.7038301, -1.547824, 1, 0.5568628, 0, 1,
-1.25803, -0.5717594, 0.3301429, 1, 0.5647059, 0, 1,
-1.25642, 1.629888, -0.1316596, 1, 0.5686275, 0, 1,
-1.24094, 0.2183644, -2.816942, 1, 0.5764706, 0, 1,
-1.230154, 0.861061, -2.344079, 1, 0.5803922, 0, 1,
-1.228468, 0.2759115, -0.8421391, 1, 0.5882353, 0, 1,
-1.227781, -0.9988413, -1.241426, 1, 0.5921569, 0, 1,
-1.22592, -1.292969, -0.007345775, 1, 0.6, 0, 1,
-1.221723, -1.186511, -3.218291, 1, 0.6078432, 0, 1,
-1.218656, -2.523438, -3.33086, 1, 0.6117647, 0, 1,
-1.218604, 1.013785, -1.104392, 1, 0.6196079, 0, 1,
-1.215827, 0.230495, -0.8453819, 1, 0.6235294, 0, 1,
-1.214344, 0.9788755, -2.776855, 1, 0.6313726, 0, 1,
-1.212157, -0.2762208, -1.133612, 1, 0.6352941, 0, 1,
-1.211899, 1.527646, -0.08675232, 1, 0.6431373, 0, 1,
-1.209937, 0.4031136, -0.336783, 1, 0.6470588, 0, 1,
-1.209243, -1.04759, -0.9587629, 1, 0.654902, 0, 1,
-1.207229, 0.5734366, -1.797804, 1, 0.6588235, 0, 1,
-1.205502, 0.3275885, -1.025592, 1, 0.6666667, 0, 1,
-1.204548, 0.02808061, -0.7939652, 1, 0.6705883, 0, 1,
-1.195801, -1.145324, -1.484434, 1, 0.6784314, 0, 1,
-1.187943, -0.8478785, -1.35705, 1, 0.682353, 0, 1,
-1.186809, -0.1842329, -0.2837148, 1, 0.6901961, 0, 1,
-1.185904, 0.3332687, -1.438897, 1, 0.6941177, 0, 1,
-1.18534, -0.1351885, -1.890644, 1, 0.7019608, 0, 1,
-1.179961, -0.7785546, -1.716084, 1, 0.7098039, 0, 1,
-1.174197, 0.5321805, -0.2425383, 1, 0.7137255, 0, 1,
-1.170912, 0.1184724, -1.386288, 1, 0.7215686, 0, 1,
-1.161917, -1.884088, -1.556705, 1, 0.7254902, 0, 1,
-1.155942, -1.618199, -3.179909, 1, 0.7333333, 0, 1,
-1.14477, -1.162211, -1.671802, 1, 0.7372549, 0, 1,
-1.144614, -0.7739914, -0.9483767, 1, 0.7450981, 0, 1,
-1.12885, 0.6780114, -1.445401, 1, 0.7490196, 0, 1,
-1.123316, 0.7848882, -2.196984, 1, 0.7568628, 0, 1,
-1.122626, -1.951242, -2.725843, 1, 0.7607843, 0, 1,
-1.12071, -0.4876029, -1.436359, 1, 0.7686275, 0, 1,
-1.118993, -0.1800662, -1.130203, 1, 0.772549, 0, 1,
-1.116982, 0.8105564, -2.389624, 1, 0.7803922, 0, 1,
-1.114404, -0.3436232, -0.2072939, 1, 0.7843137, 0, 1,
-1.113684, -0.5193299, -1.164003, 1, 0.7921569, 0, 1,
-1.113518, -1.590087, -4.257552, 1, 0.7960784, 0, 1,
-1.110121, 0.6270142, -1.612843, 1, 0.8039216, 0, 1,
-1.098079, 0.3986095, 1.020257, 1, 0.8117647, 0, 1,
-1.087851, 0.7043316, -1.408367, 1, 0.8156863, 0, 1,
-1.063813, -0.04751494, -1.345294, 1, 0.8235294, 0, 1,
-1.061613, 1.450547, 0.4515314, 1, 0.827451, 0, 1,
-1.053146, 1.199681, -0.7939094, 1, 0.8352941, 0, 1,
-1.049839, -2.235599, -0.5927393, 1, 0.8392157, 0, 1,
-1.046917, 0.5389388, -1.445441, 1, 0.8470588, 0, 1,
-1.042961, 0.5080139, -1.204247, 1, 0.8509804, 0, 1,
-1.036897, -0.4994319, -2.393023, 1, 0.8588235, 0, 1,
-1.027755, 0.1359468, -0.2498397, 1, 0.8627451, 0, 1,
-1.026561, -0.5826163, -2.718829, 1, 0.8705882, 0, 1,
-1.023548, -0.2895749, -2.963845, 1, 0.8745098, 0, 1,
-1.022507, 0.1909008, -1.120494, 1, 0.8823529, 0, 1,
-1.018826, 0.6606408, -0.8202134, 1, 0.8862745, 0, 1,
-1.017488, 0.5210003, -0.4366904, 1, 0.8941177, 0, 1,
-1.014214, 1.382718, -0.6410077, 1, 0.8980392, 0, 1,
-1.013075, 0.3758781, -1.509806, 1, 0.9058824, 0, 1,
-1.011302, 0.8823841, -0.8815358, 1, 0.9137255, 0, 1,
-1.001482, -0.1522121, -1.12122, 1, 0.9176471, 0, 1,
-0.9966969, 1.85053, -1.556875, 1, 0.9254902, 0, 1,
-0.994463, -0.01929446, 0.1348014, 1, 0.9294118, 0, 1,
-0.9888188, 0.3699488, -2.639672, 1, 0.9372549, 0, 1,
-0.9841406, -1.420802, -4.199516, 1, 0.9411765, 0, 1,
-0.9797421, 0.6707999, -1.242276, 1, 0.9490196, 0, 1,
-0.9793736, 0.5139573, -0.9411085, 1, 0.9529412, 0, 1,
-0.9737258, 0.5401516, -1.246034, 1, 0.9607843, 0, 1,
-0.9717724, 0.08534661, -2.227003, 1, 0.9647059, 0, 1,
-0.9603974, 1.916801, -0.4935758, 1, 0.972549, 0, 1,
-0.9590496, 1.06414, -0.181402, 1, 0.9764706, 0, 1,
-0.9563595, 0.6945, -2.099057, 1, 0.9843137, 0, 1,
-0.9542475, 0.3036531, -2.083117, 1, 0.9882353, 0, 1,
-0.9527925, -1.419111, -5.04192, 1, 0.9960784, 0, 1,
-0.9522267, 1.507527, -0.5294825, 0.9960784, 1, 0, 1,
-0.9496059, 1.814209, -0.8821971, 0.9921569, 1, 0, 1,
-0.9472685, -0.9923785, -1.829421, 0.9843137, 1, 0, 1,
-0.9401439, 0.9971278, 0.3352938, 0.9803922, 1, 0, 1,
-0.9373977, 0.1416479, -1.417059, 0.972549, 1, 0, 1,
-0.9323882, 0.4602712, 0.9721672, 0.9686275, 1, 0, 1,
-0.9286145, -0.5338266, -3.773414, 0.9607843, 1, 0, 1,
-0.9236709, -0.04324108, -1.478335, 0.9568627, 1, 0, 1,
-0.9230713, -1.420485, -1.136462, 0.9490196, 1, 0, 1,
-0.9220074, 0.4023589, 1.10273, 0.945098, 1, 0, 1,
-0.913807, 0.5297692, 0.1670853, 0.9372549, 1, 0, 1,
-0.9083403, 1.401247, -1.372512, 0.9333333, 1, 0, 1,
-0.9079365, 1.352976, -1.818484, 0.9254902, 1, 0, 1,
-0.8943039, 0.6818281, 0.009458709, 0.9215686, 1, 0, 1,
-0.8931776, -1.656968, -2.442482, 0.9137255, 1, 0, 1,
-0.8866867, 1.663175, 1.670213, 0.9098039, 1, 0, 1,
-0.8831739, -0.5067536, -2.417504, 0.9019608, 1, 0, 1,
-0.8773308, 0.1562269, -2.078797, 0.8941177, 1, 0, 1,
-0.8757873, -1.041945, -2.054396, 0.8901961, 1, 0, 1,
-0.8713375, 0.3348495, -1.187174, 0.8823529, 1, 0, 1,
-0.8600597, -0.2489836, -2.493551, 0.8784314, 1, 0, 1,
-0.860028, -2.262863, -1.562907, 0.8705882, 1, 0, 1,
-0.8597726, -0.1351349, -0.3628773, 0.8666667, 1, 0, 1,
-0.8579761, -0.4167586, -2.392775, 0.8588235, 1, 0, 1,
-0.8577623, 0.7559872, -1.555722, 0.854902, 1, 0, 1,
-0.8485781, 0.6130528, -0.5069776, 0.8470588, 1, 0, 1,
-0.848287, -2.219995, -2.523365, 0.8431373, 1, 0, 1,
-0.847267, 0.1621101, -2.051795, 0.8352941, 1, 0, 1,
-0.8416975, 1.186988, -0.5747144, 0.8313726, 1, 0, 1,
-0.8388733, 1.306888, -1.031916, 0.8235294, 1, 0, 1,
-0.8324556, -1.54733, -2.677277, 0.8196079, 1, 0, 1,
-0.8321874, 0.4051963, 0.3984494, 0.8117647, 1, 0, 1,
-0.8291076, 0.7463748, -0.4105087, 0.8078431, 1, 0, 1,
-0.8276584, -0.4573328, -2.877299, 0.8, 1, 0, 1,
-0.8269435, -0.6969698, -3.394859, 0.7921569, 1, 0, 1,
-0.8264374, -0.8079199, -3.092952, 0.7882353, 1, 0, 1,
-0.8227455, -1.053226, -2.895482, 0.7803922, 1, 0, 1,
-0.8175451, 1.22669, 0.8624743, 0.7764706, 1, 0, 1,
-0.8156207, 2.243438, 0.518698, 0.7686275, 1, 0, 1,
-0.8127127, -0.2703064, -3.043139, 0.7647059, 1, 0, 1,
-0.8093613, 0.1749103, -0.4990282, 0.7568628, 1, 0, 1,
-0.8083802, -1.058925, -2.123773, 0.7529412, 1, 0, 1,
-0.8058802, 1.128221, -1.444886, 0.7450981, 1, 0, 1,
-0.8021417, -0.5738293, -2.127322, 0.7411765, 1, 0, 1,
-0.7953077, 1.105997, -0.786875, 0.7333333, 1, 0, 1,
-0.7943609, 1.229164, -1.970622, 0.7294118, 1, 0, 1,
-0.7876074, -0.3589468, -1.598621, 0.7215686, 1, 0, 1,
-0.7853867, -1.285326, -3.248353, 0.7176471, 1, 0, 1,
-0.785384, 0.0564087, 0.244479, 0.7098039, 1, 0, 1,
-0.7849478, 0.713333, 1.360096, 0.7058824, 1, 0, 1,
-0.7830361, -1.690535, -2.955929, 0.6980392, 1, 0, 1,
-0.7774993, -1.111241, -3.07946, 0.6901961, 1, 0, 1,
-0.7745798, 1.599859, -0.6077192, 0.6862745, 1, 0, 1,
-0.766587, 1.836146, -0.9833587, 0.6784314, 1, 0, 1,
-0.7646658, 0.001523297, 0.9914472, 0.6745098, 1, 0, 1,
-0.7631273, 0.3109207, -1.443103, 0.6666667, 1, 0, 1,
-0.7529703, -1.14549, -2.767917, 0.6627451, 1, 0, 1,
-0.7492816, 0.4025032, -1.346166, 0.654902, 1, 0, 1,
-0.7487207, 0.522947, -0.3669934, 0.6509804, 1, 0, 1,
-0.7471436, 0.3104376, -0.06947052, 0.6431373, 1, 0, 1,
-0.7455122, -0.7182146, -2.406938, 0.6392157, 1, 0, 1,
-0.7431037, 0.2543544, 1.57382, 0.6313726, 1, 0, 1,
-0.7420301, 0.7912874, -0.7635024, 0.627451, 1, 0, 1,
-0.7418831, 0.5601488, -0.03786441, 0.6196079, 1, 0, 1,
-0.7411941, 0.2966279, -0.9507262, 0.6156863, 1, 0, 1,
-0.7376772, -1.049985, -1.436413, 0.6078432, 1, 0, 1,
-0.737397, -0.5023315, -2.091783, 0.6039216, 1, 0, 1,
-0.7259086, 0.02358761, -2.032726, 0.5960785, 1, 0, 1,
-0.7240063, -0.008848641, -2.644763, 0.5882353, 1, 0, 1,
-0.7179126, 1.128348, -1.284377, 0.5843138, 1, 0, 1,
-0.7175314, 0.2972606, -3.846203, 0.5764706, 1, 0, 1,
-0.7131239, 0.0396742, -2.429806, 0.572549, 1, 0, 1,
-0.7128039, -0.5061578, -4.381588, 0.5647059, 1, 0, 1,
-0.7112976, 0.3878759, -0.1620948, 0.5607843, 1, 0, 1,
-0.6961343, 1.469568, -0.2412308, 0.5529412, 1, 0, 1,
-0.6955485, -0.3742853, -4.514192, 0.5490196, 1, 0, 1,
-0.6913779, -1.558087, -4.953445, 0.5411765, 1, 0, 1,
-0.6897134, 2.592354, -0.6397625, 0.5372549, 1, 0, 1,
-0.6822472, -1.175613, -3.40119, 0.5294118, 1, 0, 1,
-0.6811885, -0.2062115, -3.662518, 0.5254902, 1, 0, 1,
-0.6798733, 1.28943, -1.338976, 0.5176471, 1, 0, 1,
-0.6766148, -0.5364109, -2.84145, 0.5137255, 1, 0, 1,
-0.6755525, 2.298604, -0.9899924, 0.5058824, 1, 0, 1,
-0.668615, 1.723394, -1.039051, 0.5019608, 1, 0, 1,
-0.6670759, -0.6538149, -3.853156, 0.4941176, 1, 0, 1,
-0.6644548, 0.8748828, -1.598852, 0.4862745, 1, 0, 1,
-0.6612727, -0.6685394, -0.6636508, 0.4823529, 1, 0, 1,
-0.6577656, -0.7558123, -2.278664, 0.4745098, 1, 0, 1,
-0.6530685, -0.6490023, -1.555275, 0.4705882, 1, 0, 1,
-0.6510533, 1.430601, -0.447304, 0.4627451, 1, 0, 1,
-0.6505067, -0.3984601, -2.84741, 0.4588235, 1, 0, 1,
-0.6461898, -1.223615, -1.687041, 0.4509804, 1, 0, 1,
-0.645193, 0.07132953, -1.256744, 0.4470588, 1, 0, 1,
-0.6328517, 0.4073429, -0.05413675, 0.4392157, 1, 0, 1,
-0.6210689, 1.576072, -0.9087729, 0.4352941, 1, 0, 1,
-0.615511, 0.1454162, -1.365282, 0.427451, 1, 0, 1,
-0.6133633, -0.2758337, -2.520223, 0.4235294, 1, 0, 1,
-0.6106633, -1.088551, -3.558942, 0.4156863, 1, 0, 1,
-0.6056617, 0.6069247, -0.8416722, 0.4117647, 1, 0, 1,
-0.6025191, -0.1398456, -2.192854, 0.4039216, 1, 0, 1,
-0.6024717, 0.1557996, -0.4746588, 0.3960784, 1, 0, 1,
-0.6008819, -0.7471926, -0.9393769, 0.3921569, 1, 0, 1,
-0.5981633, 1.094352, -1.076961, 0.3843137, 1, 0, 1,
-0.5976744, -0.7195936, -2.838135, 0.3803922, 1, 0, 1,
-0.5943903, 0.2198739, -1.772404, 0.372549, 1, 0, 1,
-0.5927035, -1.386544, -3.706469, 0.3686275, 1, 0, 1,
-0.5801067, 1.290378, -0.5053955, 0.3607843, 1, 0, 1,
-0.5788328, -1.687979, -2.64304, 0.3568628, 1, 0, 1,
-0.5776299, -0.5237178, -4.56285, 0.3490196, 1, 0, 1,
-0.5739855, 0.01491901, -0.817628, 0.345098, 1, 0, 1,
-0.5697061, 0.01832683, -2.632874, 0.3372549, 1, 0, 1,
-0.5669299, -0.7711071, -4.283454, 0.3333333, 1, 0, 1,
-0.5650258, -1.37798, -3.366965, 0.3254902, 1, 0, 1,
-0.5640856, 0.620876, -0.6831053, 0.3215686, 1, 0, 1,
-0.5638167, 0.8522151, -0.1437251, 0.3137255, 1, 0, 1,
-0.5605178, 0.3871275, -1.026196, 0.3098039, 1, 0, 1,
-0.5596512, -1.031647, -1.234455, 0.3019608, 1, 0, 1,
-0.5583966, 0.7317656, 0.2053244, 0.2941177, 1, 0, 1,
-0.5569195, -2.200313, -3.350589, 0.2901961, 1, 0, 1,
-0.5556925, -2.954345, -1.728774, 0.282353, 1, 0, 1,
-0.5544488, -0.05058985, -2.997511, 0.2784314, 1, 0, 1,
-0.5541597, -1.705084, -3.006773, 0.2705882, 1, 0, 1,
-0.551505, -0.9786355, -2.856126, 0.2666667, 1, 0, 1,
-0.5441353, 0.5189292, -1.17867, 0.2588235, 1, 0, 1,
-0.5436631, -1.452979, -2.810071, 0.254902, 1, 0, 1,
-0.5429674, 0.673183, -0.3976424, 0.2470588, 1, 0, 1,
-0.5413908, 0.8492225, 0.145806, 0.2431373, 1, 0, 1,
-0.5368186, 2.141573, 0.7082437, 0.2352941, 1, 0, 1,
-0.5352694, -1.069467, -1.748961, 0.2313726, 1, 0, 1,
-0.5349803, 1.427263, -0.5256198, 0.2235294, 1, 0, 1,
-0.5329782, -0.3639902, -1.354163, 0.2196078, 1, 0, 1,
-0.5322651, -0.176975, -2.597619, 0.2117647, 1, 0, 1,
-0.5304097, -0.6857534, -1.138478, 0.2078431, 1, 0, 1,
-0.5296561, -1.291365, -4.874784, 0.2, 1, 0, 1,
-0.5276932, 1.04422, -1.652648, 0.1921569, 1, 0, 1,
-0.5256057, -1.707747, -2.404693, 0.1882353, 1, 0, 1,
-0.5244727, 0.03383286, -1.350506, 0.1803922, 1, 0, 1,
-0.5233307, 1.195319, 0.08904076, 0.1764706, 1, 0, 1,
-0.522015, 1.180358, -0.2429158, 0.1686275, 1, 0, 1,
-0.5173525, 0.1289565, -0.7002717, 0.1647059, 1, 0, 1,
-0.5082594, -0.1121663, -1.506101, 0.1568628, 1, 0, 1,
-0.5075634, 0.2027134, -0.847099, 0.1529412, 1, 0, 1,
-0.5065567, -0.9874201, -1.441633, 0.145098, 1, 0, 1,
-0.5052496, -1.096901, -1.508022, 0.1411765, 1, 0, 1,
-0.4995444, 0.9602662, -0.4008549, 0.1333333, 1, 0, 1,
-0.4956603, 0.6185456, -0.7971578, 0.1294118, 1, 0, 1,
-0.4952653, -0.7240344, -2.41421, 0.1215686, 1, 0, 1,
-0.4825452, 0.6937226, 1.150774, 0.1176471, 1, 0, 1,
-0.4774585, -0.0331709, -1.934406, 0.1098039, 1, 0, 1,
-0.4712151, -1.367699, -3.122841, 0.1058824, 1, 0, 1,
-0.4652303, -0.2627485, -1.323823, 0.09803922, 1, 0, 1,
-0.4652166, -1.676523, -1.498253, 0.09019608, 1, 0, 1,
-0.4597594, -0.8395284, -3.778088, 0.08627451, 1, 0, 1,
-0.4558999, -1.712904, -3.834369, 0.07843138, 1, 0, 1,
-0.4555413, 0.6988256, 0.7325952, 0.07450981, 1, 0, 1,
-0.4543072, 0.3320595, -0.3146148, 0.06666667, 1, 0, 1,
-0.4538066, -2.168736, -2.117152, 0.0627451, 1, 0, 1,
-0.4523677, 0.2599271, -0.5219846, 0.05490196, 1, 0, 1,
-0.4507891, 0.04372312, -0.3794924, 0.05098039, 1, 0, 1,
-0.4493734, 0.08171878, -1.138284, 0.04313726, 1, 0, 1,
-0.4483825, -0.2615252, -1.211032, 0.03921569, 1, 0, 1,
-0.4480307, -0.171572, -1.545538, 0.03137255, 1, 0, 1,
-0.4474829, -0.7647183, -4.108809, 0.02745098, 1, 0, 1,
-0.4446087, 0.128079, -2.117461, 0.01960784, 1, 0, 1,
-0.4438432, 1.461839, 0.487494, 0.01568628, 1, 0, 1,
-0.4419582, -1.172404, -1.254887, 0.007843138, 1, 0, 1,
-0.4401342, -1.224621, -2.588077, 0.003921569, 1, 0, 1,
-0.4387316, 1.259189, 0.6172312, 0, 1, 0.003921569, 1,
-0.4294287, 0.8428972, -0.2986673, 0, 1, 0.01176471, 1,
-0.4226811, -1.058977, -4.275411, 0, 1, 0.01568628, 1,
-0.4225478, 0.4991018, -0.5276859, 0, 1, 0.02352941, 1,
-0.4171736, 0.09407338, -1.337155, 0, 1, 0.02745098, 1,
-0.4088356, -1.148029, -3.65039, 0, 1, 0.03529412, 1,
-0.4067421, -0.3118187, -1.649678, 0, 1, 0.03921569, 1,
-0.4009524, -0.7178489, -0.02688026, 0, 1, 0.04705882, 1,
-0.4004291, -0.7113499, -3.088691, 0, 1, 0.05098039, 1,
-0.3979349, -0.2335062, -3.507872, 0, 1, 0.05882353, 1,
-0.3956289, 0.2330006, -0.1024326, 0, 1, 0.0627451, 1,
-0.3934955, -0.3755444, -0.1843864, 0, 1, 0.07058824, 1,
-0.3926078, -0.1295028, -0.7410729, 0, 1, 0.07450981, 1,
-0.3921515, 0.7085686, 0.5491989, 0, 1, 0.08235294, 1,
-0.387538, -1.157091, -2.135256, 0, 1, 0.08627451, 1,
-0.3870884, 0.7458193, -1.46332, 0, 1, 0.09411765, 1,
-0.3808809, 0.7967396, -2.617365, 0, 1, 0.1019608, 1,
-0.3786869, -1.611823, -3.329065, 0, 1, 0.1058824, 1,
-0.377934, -0.109987, -1.774282, 0, 1, 0.1137255, 1,
-0.3713921, 0.8449839, -0.7294067, 0, 1, 0.1176471, 1,
-0.3683262, -0.241123, -1.857362, 0, 1, 0.1254902, 1,
-0.3675871, 0.7121097, -0.3522668, 0, 1, 0.1294118, 1,
-0.3661849, 0.7415925, -0.2376454, 0, 1, 0.1372549, 1,
-0.3658598, -1.03696, -4.391637, 0, 1, 0.1411765, 1,
-0.3643686, -0.4759511, -1.463799, 0, 1, 0.1490196, 1,
-0.3603774, -0.09773186, -2.258751, 0, 1, 0.1529412, 1,
-0.3588888, 1.145193, -0.7988613, 0, 1, 0.1607843, 1,
-0.3577881, 0.02002498, -3.114866, 0, 1, 0.1647059, 1,
-0.3540404, 0.9157475, -0.4383242, 0, 1, 0.172549, 1,
-0.3526284, 0.6179872, -0.2682651, 0, 1, 0.1764706, 1,
-0.3513087, 0.8873876, -1.366809, 0, 1, 0.1843137, 1,
-0.3481406, 0.5488391, -0.2079684, 0, 1, 0.1882353, 1,
-0.3459527, 1.659434, -1.594452, 0, 1, 0.1960784, 1,
-0.338722, -0.1057171, -2.100732, 0, 1, 0.2039216, 1,
-0.3268094, 0.5048012, -0.1465313, 0, 1, 0.2078431, 1,
-0.3228919, -0.668909, -2.769971, 0, 1, 0.2156863, 1,
-0.3228171, -1.236713, -5.205958, 0, 1, 0.2196078, 1,
-0.3226494, -0.2322761, -0.3733393, 0, 1, 0.227451, 1,
-0.3205654, 0.623391, 1.554621, 0, 1, 0.2313726, 1,
-0.3142913, -2.548865, -3.626601, 0, 1, 0.2392157, 1,
-0.3128873, 0.08904583, -2.129401, 0, 1, 0.2431373, 1,
-0.3115154, -1.528902, -2.282447, 0, 1, 0.2509804, 1,
-0.310266, -1.86122, -2.04986, 0, 1, 0.254902, 1,
-0.3066365, -0.4721822, -2.239383, 0, 1, 0.2627451, 1,
-0.2989831, -0.8198866, -3.214552, 0, 1, 0.2666667, 1,
-0.2984136, 1.387338, -0.6335438, 0, 1, 0.2745098, 1,
-0.2939599, 0.5779, -1.115558, 0, 1, 0.2784314, 1,
-0.2871853, -1.093949, -3.619124, 0, 1, 0.2862745, 1,
-0.2844606, 0.6449314, 0.8159772, 0, 1, 0.2901961, 1,
-0.2803202, 1.132761, 1.149369, 0, 1, 0.2980392, 1,
-0.2802166, -1.191142, -1.184255, 0, 1, 0.3058824, 1,
-0.2795601, 1.265977, -0.09862871, 0, 1, 0.3098039, 1,
-0.2779483, -1.221271, -2.931769, 0, 1, 0.3176471, 1,
-0.2762986, -1.425287, -2.141673, 0, 1, 0.3215686, 1,
-0.2719569, -0.9452207, -4.251879, 0, 1, 0.3294118, 1,
-0.2685085, 1.35586, 0.622845, 0, 1, 0.3333333, 1,
-0.2665271, -1.138626, -2.516924, 0, 1, 0.3411765, 1,
-0.2656222, 1.38865, -0.4068572, 0, 1, 0.345098, 1,
-0.2650889, -1.052168, -1.848731, 0, 1, 0.3529412, 1,
-0.2625301, -0.04408394, -3.151034, 0, 1, 0.3568628, 1,
-0.2574581, -0.03056815, -3.459862, 0, 1, 0.3647059, 1,
-0.2540431, -1.151857, -3.667026, 0, 1, 0.3686275, 1,
-0.2526237, 0.550835, -1.916792, 0, 1, 0.3764706, 1,
-0.2498171, 1.291592, 0.4603146, 0, 1, 0.3803922, 1,
-0.2393428, -0.334362, -2.799259, 0, 1, 0.3882353, 1,
-0.2383193, 0.8778476, -1.479326, 0, 1, 0.3921569, 1,
-0.236946, 0.5030513, -0.6691084, 0, 1, 0.4, 1,
-0.2358265, -0.8594909, -3.707709, 0, 1, 0.4078431, 1,
-0.231178, -0.1195033, -3.318364, 0, 1, 0.4117647, 1,
-0.2295249, 0.9412135, -0.2928968, 0, 1, 0.4196078, 1,
-0.2290018, -0.5212686, -3.732104, 0, 1, 0.4235294, 1,
-0.2277548, 0.6966648, -0.1236023, 0, 1, 0.4313726, 1,
-0.2265371, -0.2229495, -2.852621, 0, 1, 0.4352941, 1,
-0.2258623, -1.197489, -2.965746, 0, 1, 0.4431373, 1,
-0.225712, 1.639519, -0.9987304, 0, 1, 0.4470588, 1,
-0.2220128, -1.632045, -4.380834, 0, 1, 0.454902, 1,
-0.2212116, 1.300459, -1.796379, 0, 1, 0.4588235, 1,
-0.2174079, -1.008051, -3.455184, 0, 1, 0.4666667, 1,
-0.2173803, -0.4839963, -2.402634, 0, 1, 0.4705882, 1,
-0.2118564, 1.219734, -0.1139484, 0, 1, 0.4784314, 1,
-0.2083303, 0.02180359, -0.7301974, 0, 1, 0.4823529, 1,
-0.2049558, 0.807026, 0.2075271, 0, 1, 0.4901961, 1,
-0.1934164, 1.24904, -0.2522059, 0, 1, 0.4941176, 1,
-0.193383, 1.105191, -0.8403506, 0, 1, 0.5019608, 1,
-0.1920356, 1.395505, 0.001008422, 0, 1, 0.509804, 1,
-0.191848, 0.7822813, -1.22901, 0, 1, 0.5137255, 1,
-0.1915905, -0.004585816, -0.2076522, 0, 1, 0.5215687, 1,
-0.1819131, 1.903388, -0.20203, 0, 1, 0.5254902, 1,
-0.1815351, -0.258622, -2.189415, 0, 1, 0.5333334, 1,
-0.1783868, 1.282685, 3.121325, 0, 1, 0.5372549, 1,
-0.1781963, -0.03414046, -2.410823, 0, 1, 0.5450981, 1,
-0.1780319, -1.136591, -4.0018, 0, 1, 0.5490196, 1,
-0.171478, -1.265438, -3.905464, 0, 1, 0.5568628, 1,
-0.1696495, 0.05192144, 0.3184575, 0, 1, 0.5607843, 1,
-0.1637917, -2.001181, -3.363743, 0, 1, 0.5686275, 1,
-0.1626497, -1.757197, -2.611453, 0, 1, 0.572549, 1,
-0.1570036, -0.2671513, -2.309322, 0, 1, 0.5803922, 1,
-0.1546221, 0.4144378, -1.174502, 0, 1, 0.5843138, 1,
-0.1519016, -1.059117, -3.911764, 0, 1, 0.5921569, 1,
-0.1518048, -0.6388565, -2.641093, 0, 1, 0.5960785, 1,
-0.1446031, -1.830246, -3.204677, 0, 1, 0.6039216, 1,
-0.1421954, -1.241756, -2.461033, 0, 1, 0.6117647, 1,
-0.1419632, -1.847648, -3.420426, 0, 1, 0.6156863, 1,
-0.1400509, 0.2096685, -2.218762, 0, 1, 0.6235294, 1,
-0.1396968, 1.770491, 0.06767549, 0, 1, 0.627451, 1,
-0.1343881, 0.7215928, 1.649921, 0, 1, 0.6352941, 1,
-0.1257012, 0.7107797, -0.09032189, 0, 1, 0.6392157, 1,
-0.1233032, 1.727315, 1.410977, 0, 1, 0.6470588, 1,
-0.1222854, 0.08124909, -1.861472, 0, 1, 0.6509804, 1,
-0.1203956, -0.2165688, -2.15888, 0, 1, 0.6588235, 1,
-0.1153569, 0.3760623, -2.529073, 0, 1, 0.6627451, 1,
-0.1141118, 0.3305217, -0.7736448, 0, 1, 0.6705883, 1,
-0.1126962, -0.3560119, -1.439261, 0, 1, 0.6745098, 1,
-0.1121352, -0.2629887, -2.799232, 0, 1, 0.682353, 1,
-0.1116655, 0.7145066, 0.500567, 0, 1, 0.6862745, 1,
-0.1074788, -1.189486, -3.511253, 0, 1, 0.6941177, 1,
-0.1050663, -0.466166, -3.495059, 0, 1, 0.7019608, 1,
-0.1026749, -0.611746, -3.979147, 0, 1, 0.7058824, 1,
-0.1021715, 0.08499598, -1.977388, 0, 1, 0.7137255, 1,
-0.09118497, -0.3045855, -2.675517, 0, 1, 0.7176471, 1,
-0.09042211, -2.708564, -2.749205, 0, 1, 0.7254902, 1,
-0.08949439, 0.5937217, -0.9561922, 0, 1, 0.7294118, 1,
-0.08917674, 0.5924518, -0.5711058, 0, 1, 0.7372549, 1,
-0.08248299, 0.3828671, -0.3583908, 0, 1, 0.7411765, 1,
-0.08041536, 1.037415, -0.1561151, 0, 1, 0.7490196, 1,
-0.07667895, 0.5196778, -0.1832653, 0, 1, 0.7529412, 1,
-0.07184201, 1.56673, 1.354988, 0, 1, 0.7607843, 1,
-0.0718317, 0.1542298, 1.412788, 0, 1, 0.7647059, 1,
-0.07041175, 1.364709, -0.4255997, 0, 1, 0.772549, 1,
-0.06469712, 0.7267556, -0.6783742, 0, 1, 0.7764706, 1,
-0.05881408, 0.1080781, -0.1090412, 0, 1, 0.7843137, 1,
-0.05767941, 0.2819434, -1.494609, 0, 1, 0.7882353, 1,
-0.05741959, 0.6786387, -0.3813363, 0, 1, 0.7960784, 1,
-0.05630714, -0.5013693, -3.126834, 0, 1, 0.8039216, 1,
-0.05520933, 0.6241308, 1.527816, 0, 1, 0.8078431, 1,
-0.05339246, -0.6814902, -2.180219, 0, 1, 0.8156863, 1,
-0.05063804, 1.447597, -0.7527598, 0, 1, 0.8196079, 1,
-0.04834914, -1.404173, -1.65152, 0, 1, 0.827451, 1,
-0.04604832, -0.2119016, -4.208034, 0, 1, 0.8313726, 1,
-0.04440158, -0.4301811, -2.14421, 0, 1, 0.8392157, 1,
-0.04419781, -0.2355683, -3.348052, 0, 1, 0.8431373, 1,
-0.04309959, -1.139836, -3.345761, 0, 1, 0.8509804, 1,
-0.03455403, 2.414501, -0.2210548, 0, 1, 0.854902, 1,
-0.03201154, 1.418758, -0.06383126, 0, 1, 0.8627451, 1,
-0.03165259, -0.5908388, -3.043763, 0, 1, 0.8666667, 1,
-0.0308331, 0.3713895, -0.7381526, 0, 1, 0.8745098, 1,
-0.02943969, -0.3375649, -2.722091, 0, 1, 0.8784314, 1,
-0.02809136, 0.8750687, -0.148476, 0, 1, 0.8862745, 1,
-0.02581693, 0.594999, 1.241224, 0, 1, 0.8901961, 1,
-0.02069424, 1.101182, 1.161134, 0, 1, 0.8980392, 1,
-0.01957008, -0.04109152, -1.419675, 0, 1, 0.9058824, 1,
-0.01924616, -0.5629101, -3.914127, 0, 1, 0.9098039, 1,
-0.01489731, 1.401258, -0.07833291, 0, 1, 0.9176471, 1,
-0.01469867, -0.7063255, -4.90597, 0, 1, 0.9215686, 1,
-0.01304682, 1.41229, -1.127887, 0, 1, 0.9294118, 1,
-0.007748998, -1.528375, -5.047451, 0, 1, 0.9333333, 1,
-0.005898672, -1.249477, -3.284938, 0, 1, 0.9411765, 1,
-0.001595793, 0.07183058, 1.472059, 0, 1, 0.945098, 1,
0.0009689605, -0.7843165, 4.085987, 0, 1, 0.9529412, 1,
0.002963881, -0.658353, 3.719915, 0, 1, 0.9568627, 1,
0.004212548, 0.4279548, -0.5561447, 0, 1, 0.9647059, 1,
0.01105331, 0.9987814, -0.08286233, 0, 1, 0.9686275, 1,
0.01393957, 0.7094537, -0.4332994, 0, 1, 0.9764706, 1,
0.02041672, -0.3816299, 2.49788, 0, 1, 0.9803922, 1,
0.02499709, -0.5772552, 2.99666, 0, 1, 0.9882353, 1,
0.02810111, -0.8562978, 3.741593, 0, 1, 0.9921569, 1,
0.02900055, -0.8212921, 4.533709, 0, 1, 1, 1,
0.03709188, -0.4677788, 2.607484, 0, 0.9921569, 1, 1,
0.03852984, 0.6174476, -1.657004, 0, 0.9882353, 1, 1,
0.03999071, 0.3485554, 1.263482, 0, 0.9803922, 1, 1,
0.04003384, -1.726352, 3.367932, 0, 0.9764706, 1, 1,
0.04173146, -0.1691074, 3.37965, 0, 0.9686275, 1, 1,
0.04316231, 0.5462192, 1.415598, 0, 0.9647059, 1, 1,
0.04588027, 0.7261845, 1.230398, 0, 0.9568627, 1, 1,
0.04744137, -0.3443083, 3.809667, 0, 0.9529412, 1, 1,
0.04856468, -0.4373535, 1.762693, 0, 0.945098, 1, 1,
0.04919001, 0.2068407, -1.531146, 0, 0.9411765, 1, 1,
0.0510506, -0.3474194, 3.06794, 0, 0.9333333, 1, 1,
0.05111257, -0.2195369, 2.848846, 0, 0.9294118, 1, 1,
0.05285407, -0.007367508, 3.75242, 0, 0.9215686, 1, 1,
0.0560181, 0.6180488, -1.023265, 0, 0.9176471, 1, 1,
0.05651263, -1.486576, 3.457244, 0, 0.9098039, 1, 1,
0.05654978, -0.2044438, 3.509806, 0, 0.9058824, 1, 1,
0.05809634, 0.4477722, -0.5826867, 0, 0.8980392, 1, 1,
0.06177283, -1.039566, 3.34752, 0, 0.8901961, 1, 1,
0.06299597, -1.264729, 1.219851, 0, 0.8862745, 1, 1,
0.06396729, -0.06288963, 1.857549, 0, 0.8784314, 1, 1,
0.06411842, -1.012603, 3.331925, 0, 0.8745098, 1, 1,
0.06767543, -0.8334398, 3.703276, 0, 0.8666667, 1, 1,
0.06967782, 2.020009, 1.668182, 0, 0.8627451, 1, 1,
0.07078431, -0.4322777, 2.381747, 0, 0.854902, 1, 1,
0.07460566, 1.115998, -0.6425382, 0, 0.8509804, 1, 1,
0.07517932, -0.7962496, 4.262857, 0, 0.8431373, 1, 1,
0.07677901, 0.3319933, 0.5306446, 0, 0.8392157, 1, 1,
0.08161919, 0.6627454, 0.03347354, 0, 0.8313726, 1, 1,
0.08191143, 1.620488, -0.9026937, 0, 0.827451, 1, 1,
0.08535041, 1.072008, 0.2709005, 0, 0.8196079, 1, 1,
0.08961843, -0.6491021, 2.669362, 0, 0.8156863, 1, 1,
0.09286101, 0.6470259, 1.440102, 0, 0.8078431, 1, 1,
0.09331208, -0.7800638, 2.305541, 0, 0.8039216, 1, 1,
0.09383556, -2.164069, 1.384274, 0, 0.7960784, 1, 1,
0.09679577, -0.8542807, 1.641863, 0, 0.7882353, 1, 1,
0.1032981, -1.193891, 2.195387, 0, 0.7843137, 1, 1,
0.1058118, -0.6151338, 4.005511, 0, 0.7764706, 1, 1,
0.1083718, -0.679999, 3.172056, 0, 0.772549, 1, 1,
0.1132609, -0.4954537, 2.443438, 0, 0.7647059, 1, 1,
0.1143777, 0.2183505, 0.4152795, 0, 0.7607843, 1, 1,
0.1144077, 1.192333, 0.5494798, 0, 0.7529412, 1, 1,
0.1178155, -0.351061, 4.376646, 0, 0.7490196, 1, 1,
0.1189506, 0.9598882, -1.708474, 0, 0.7411765, 1, 1,
0.1235257, 1.522139, 0.1044652, 0, 0.7372549, 1, 1,
0.1256666, 1.002284, -0.2416919, 0, 0.7294118, 1, 1,
0.1268547, 0.5682474, -0.03028671, 0, 0.7254902, 1, 1,
0.1283995, 0.01675294, 2.55916, 0, 0.7176471, 1, 1,
0.1328594, -2.021159, 1.972409, 0, 0.7137255, 1, 1,
0.1335355, -1.053709, 3.237159, 0, 0.7058824, 1, 1,
0.1455702, -0.2536045, 2.692133, 0, 0.6980392, 1, 1,
0.1505785, -1.355541, 2.416482, 0, 0.6941177, 1, 1,
0.154801, -1.689632, 3.539144, 0, 0.6862745, 1, 1,
0.1553932, 1.701778, 0.752699, 0, 0.682353, 1, 1,
0.1577098, 0.4423275, 0.3665684, 0, 0.6745098, 1, 1,
0.1583109, 1.824386, 1.521629, 0, 0.6705883, 1, 1,
0.1605098, -0.5834656, 2.894693, 0, 0.6627451, 1, 1,
0.1623198, -0.0715056, 0.3205336, 0, 0.6588235, 1, 1,
0.1631915, -0.07656733, 1.510563, 0, 0.6509804, 1, 1,
0.1662236, 0.5225246, 1.326202, 0, 0.6470588, 1, 1,
0.1666798, 0.4520781, -0.02977207, 0, 0.6392157, 1, 1,
0.1670859, 0.01708522, 2.750315, 0, 0.6352941, 1, 1,
0.1686063, -0.3220651, 2.215258, 0, 0.627451, 1, 1,
0.1695459, 0.9831673, 1.109883, 0, 0.6235294, 1, 1,
0.1773292, -0.3338432, 2.777364, 0, 0.6156863, 1, 1,
0.1809493, -0.9974666, 3.594179, 0, 0.6117647, 1, 1,
0.1811948, -0.09188585, 0.5173156, 0, 0.6039216, 1, 1,
0.1856362, 2.375844, -0.1981768, 0, 0.5960785, 1, 1,
0.1893692, -0.05609992, 1.812376, 0, 0.5921569, 1, 1,
0.1926367, 0.1340666, 0.3655939, 0, 0.5843138, 1, 1,
0.1932936, -0.230947, 1.298458, 0, 0.5803922, 1, 1,
0.1970603, -1.365291, 4.415651, 0, 0.572549, 1, 1,
0.1989793, -1.071417, 3.335903, 0, 0.5686275, 1, 1,
0.201566, 0.7257501, -3.574244, 0, 0.5607843, 1, 1,
0.2039775, 0.2817707, 1.192607, 0, 0.5568628, 1, 1,
0.2046854, -0.162471, 1.970614, 0, 0.5490196, 1, 1,
0.2068675, 1.442569, -0.2041663, 0, 0.5450981, 1, 1,
0.2129872, -0.0522651, 1.062337, 0, 0.5372549, 1, 1,
0.215349, -0.9019895, 2.230062, 0, 0.5333334, 1, 1,
0.2162233, -0.7342215, 1.16399, 0, 0.5254902, 1, 1,
0.2172964, 1.198891, 0.3675537, 0, 0.5215687, 1, 1,
0.2229245, -0.6834719, 3.633675, 0, 0.5137255, 1, 1,
0.2247377, -0.6726713, 2.750659, 0, 0.509804, 1, 1,
0.2261228, -1.93833, 3.769648, 0, 0.5019608, 1, 1,
0.2298456, -0.5187799, 2.789721, 0, 0.4941176, 1, 1,
0.2298879, -1.458857, 2.681903, 0, 0.4901961, 1, 1,
0.2300875, 1.114853, 1.405442, 0, 0.4823529, 1, 1,
0.2316386, -0.05876059, 1.701729, 0, 0.4784314, 1, 1,
0.2337359, 1.421977, 0.2140865, 0, 0.4705882, 1, 1,
0.2343654, -0.560493, 4.684621, 0, 0.4666667, 1, 1,
0.2343657, 0.6393849, -0.955005, 0, 0.4588235, 1, 1,
0.2376725, 1.677335, -0.775013, 0, 0.454902, 1, 1,
0.2412566, -0.08842266, 2.854726, 0, 0.4470588, 1, 1,
0.2433999, 0.4840171, 2.175294, 0, 0.4431373, 1, 1,
0.2475328, 0.3092874, -0.3733566, 0, 0.4352941, 1, 1,
0.2502198, -0.8226056, 1.734776, 0, 0.4313726, 1, 1,
0.2515883, -0.4871361, 2.035551, 0, 0.4235294, 1, 1,
0.2563249, -0.4139241, 2.720359, 0, 0.4196078, 1, 1,
0.2591463, -0.8815775, 1.336551, 0, 0.4117647, 1, 1,
0.266534, 0.08018602, 1.562383, 0, 0.4078431, 1, 1,
0.2673644, 0.8754395, 0.7720547, 0, 0.4, 1, 1,
0.2726771, -1.040081, 2.373526, 0, 0.3921569, 1, 1,
0.2727152, -2.849855, 3.330789, 0, 0.3882353, 1, 1,
0.2794836, -0.8963466, 1.489372, 0, 0.3803922, 1, 1,
0.2799937, -0.4921827, 2.972757, 0, 0.3764706, 1, 1,
0.2838659, -2.502891, 1.688919, 0, 0.3686275, 1, 1,
0.2842588, 0.3460108, 0.4495906, 0, 0.3647059, 1, 1,
0.2868824, 0.3967402, 0.2714339, 0, 0.3568628, 1, 1,
0.2920718, -0.9052286, 1.951605, 0, 0.3529412, 1, 1,
0.2929984, 1.083426, 0.344912, 0, 0.345098, 1, 1,
0.2962256, 2.616519, -0.5807223, 0, 0.3411765, 1, 1,
0.2984664, 0.1762692, 0.6963663, 0, 0.3333333, 1, 1,
0.3001786, 0.2714428, 2.692497, 0, 0.3294118, 1, 1,
0.3029388, 0.9521296, -0.1413881, 0, 0.3215686, 1, 1,
0.3029587, -1.359911, 2.847856, 0, 0.3176471, 1, 1,
0.3033816, -0.3872176, 2.342647, 0, 0.3098039, 1, 1,
0.3053065, 0.3584148, 0.4935436, 0, 0.3058824, 1, 1,
0.3067987, -0.2242725, 1.580453, 0, 0.2980392, 1, 1,
0.3125679, -0.6190662, 2.752704, 0, 0.2901961, 1, 1,
0.3195483, -0.8424066, 3.364796, 0, 0.2862745, 1, 1,
0.3219539, -1.393936, 3.178577, 0, 0.2784314, 1, 1,
0.3231964, -0.6519839, 2.902966, 0, 0.2745098, 1, 1,
0.3259916, 0.5708496, 0.9587108, 0, 0.2666667, 1, 1,
0.3271593, -0.8156548, 5.460583, 0, 0.2627451, 1, 1,
0.327714, 0.06798681, 1.909983, 0, 0.254902, 1, 1,
0.3329105, -0.05461516, 1.304659, 0, 0.2509804, 1, 1,
0.336419, -0.4518661, 3.39551, 0, 0.2431373, 1, 1,
0.3369698, 0.598488, 0.8680522, 0, 0.2392157, 1, 1,
0.3386821, -0.2320688, 2.244323, 0, 0.2313726, 1, 1,
0.3396246, 1.644285, 0.05678936, 0, 0.227451, 1, 1,
0.3399443, 0.02860141, 2.093523, 0, 0.2196078, 1, 1,
0.3522627, -0.7922827, 2.174486, 0, 0.2156863, 1, 1,
0.352761, -1.531111, 3.599121, 0, 0.2078431, 1, 1,
0.3557451, -0.1826848, 1.604135, 0, 0.2039216, 1, 1,
0.3575472, 0.0632794, 1.901963, 0, 0.1960784, 1, 1,
0.3580999, 0.1479726, 1.782549, 0, 0.1882353, 1, 1,
0.3590533, -1.13836, 1.209801, 0, 0.1843137, 1, 1,
0.3591264, 0.02386328, 2.33653, 0, 0.1764706, 1, 1,
0.3598205, 1.968047, 1.50502, 0, 0.172549, 1, 1,
0.3641199, 0.3668936, 2.111796, 0, 0.1647059, 1, 1,
0.3647904, 0.7098212, 0.6658084, 0, 0.1607843, 1, 1,
0.3713996, -0.3573358, 2.441336, 0, 0.1529412, 1, 1,
0.3741518, -0.5571864, 1.951107, 0, 0.1490196, 1, 1,
0.3746935, 0.551991, -0.2631865, 0, 0.1411765, 1, 1,
0.3748326, -0.1275235, 0.2679488, 0, 0.1372549, 1, 1,
0.3825859, -1.237393, 1.710649, 0, 0.1294118, 1, 1,
0.3837353, -1.947453, 4.883165, 0, 0.1254902, 1, 1,
0.3907046, -0.1580284, 2.062068, 0, 0.1176471, 1, 1,
0.3942183, 0.009210154, 0.1721526, 0, 0.1137255, 1, 1,
0.3945338, 0.1898521, 0.3194629, 0, 0.1058824, 1, 1,
0.3947931, -0.7786792, 3.164176, 0, 0.09803922, 1, 1,
0.3951125, -0.6095343, 2.422035, 0, 0.09411765, 1, 1,
0.4000438, 1.355784, -0.03922732, 0, 0.08627451, 1, 1,
0.4039766, 0.95529, 0.5707754, 0, 0.08235294, 1, 1,
0.4058712, 0.9157885, 0.463755, 0, 0.07450981, 1, 1,
0.4091879, -0.9753022, 2.69136, 0, 0.07058824, 1, 1,
0.4096848, -1.972525, 3.130647, 0, 0.0627451, 1, 1,
0.416587, 1.40732, -0.1766762, 0, 0.05882353, 1, 1,
0.4204151, 1.013563, -0.4690883, 0, 0.05098039, 1, 1,
0.4212666, 1.175322, 0.8340035, 0, 0.04705882, 1, 1,
0.4224274, -0.8449184, 2.594063, 0, 0.03921569, 1, 1,
0.4229915, -0.7603037, 2.693724, 0, 0.03529412, 1, 1,
0.4231542, -0.9729821, 3.017622, 0, 0.02745098, 1, 1,
0.4231681, 0.1857292, 3.526788, 0, 0.02352941, 1, 1,
0.4232899, 0.3310306, 2.769633, 0, 0.01568628, 1, 1,
0.4321618, -0.1464, -0.1683125, 0, 0.01176471, 1, 1,
0.4346832, 0.7653923, 1.212257, 0, 0.003921569, 1, 1,
0.4370621, -0.6226107, 1.395742, 0.003921569, 0, 1, 1,
0.4376994, 0.118348, 1.716432, 0.007843138, 0, 1, 1,
0.4448, 0.2531762, 0.3552456, 0.01568628, 0, 1, 1,
0.4460185, 0.5200308, 3.751409, 0.01960784, 0, 1, 1,
0.447821, -0.1980854, 2.09066, 0.02745098, 0, 1, 1,
0.4522876, -0.380589, 1.101288, 0.03137255, 0, 1, 1,
0.4536936, -0.2496769, 2.633724, 0.03921569, 0, 1, 1,
0.4556793, -0.507279, 0.6432005, 0.04313726, 0, 1, 1,
0.4562673, -0.9094083, 3.05153, 0.05098039, 0, 1, 1,
0.4586787, 0.1236761, 1.583798, 0.05490196, 0, 1, 1,
0.4602564, 0.00750728, 3.041483, 0.0627451, 0, 1, 1,
0.4635623, -0.1624216, 2.733767, 0.06666667, 0, 1, 1,
0.4704953, 0.06652725, 2.487532, 0.07450981, 0, 1, 1,
0.4718829, 0.3814796, -0.4268588, 0.07843138, 0, 1, 1,
0.4726125, 0.08810255, 0.8291117, 0.08627451, 0, 1, 1,
0.475574, 0.2810461, 1.704166, 0.09019608, 0, 1, 1,
0.4769543, 0.4810024, 1.202273, 0.09803922, 0, 1, 1,
0.4872799, -0.5018893, 1.875956, 0.1058824, 0, 1, 1,
0.48838, 0.5641339, 2.268492, 0.1098039, 0, 1, 1,
0.4896285, 0.83969, 0.3530309, 0.1176471, 0, 1, 1,
0.4900876, 1.591687, 1.056141, 0.1215686, 0, 1, 1,
0.4951988, 1.426207, -0.7123665, 0.1294118, 0, 1, 1,
0.497033, 0.3873622, -0.2792851, 0.1333333, 0, 1, 1,
0.5039953, -0.007639441, 2.419361, 0.1411765, 0, 1, 1,
0.5042839, 0.879388, 0.4471086, 0.145098, 0, 1, 1,
0.509186, 0.4599602, 2.299615, 0.1529412, 0, 1, 1,
0.5100565, -0.7217469, 2.043092, 0.1568628, 0, 1, 1,
0.5129182, 0.7091809, 1.660828, 0.1647059, 0, 1, 1,
0.5188113, -0.04993831, 0.6535538, 0.1686275, 0, 1, 1,
0.5279016, -0.08665033, 0.8954453, 0.1764706, 0, 1, 1,
0.529882, 0.3738721, 1.26785, 0.1803922, 0, 1, 1,
0.5300793, -0.4483522, 1.128998, 0.1882353, 0, 1, 1,
0.5327305, 1.647931, 0.2742585, 0.1921569, 0, 1, 1,
0.5334482, 1.017878, 1.751858, 0.2, 0, 1, 1,
0.5371367, -0.09057655, 2.213672, 0.2078431, 0, 1, 1,
0.5390728, -0.9641422, 2.935078, 0.2117647, 0, 1, 1,
0.5396422, 0.006602059, 0.09089713, 0.2196078, 0, 1, 1,
0.5450435, -0.2160964, 2.415006, 0.2235294, 0, 1, 1,
0.5555817, -0.8831428, 2.535891, 0.2313726, 0, 1, 1,
0.555911, -0.9782754, 2.354247, 0.2352941, 0, 1, 1,
0.5586706, -0.2778468, 1.538232, 0.2431373, 0, 1, 1,
0.5586712, 0.692041, -0.844542, 0.2470588, 0, 1, 1,
0.5641525, 0.4576198, 2.031332, 0.254902, 0, 1, 1,
0.5645885, 1.905416, -0.1923924, 0.2588235, 0, 1, 1,
0.566061, -0.3579379, 3.064277, 0.2666667, 0, 1, 1,
0.569512, -0.7108817, 2.177061, 0.2705882, 0, 1, 1,
0.5715647, 0.1227563, 0.6524164, 0.2784314, 0, 1, 1,
0.573307, 1.556203, 0.9954771, 0.282353, 0, 1, 1,
0.5747494, -1.093258, 1.899323, 0.2901961, 0, 1, 1,
0.5785533, 0.9294219, 0.5723391, 0.2941177, 0, 1, 1,
0.5816963, -0.7790074, 2.620565, 0.3019608, 0, 1, 1,
0.5841973, -1.163333, 2.024263, 0.3098039, 0, 1, 1,
0.5866214, 0.2535487, 1.256675, 0.3137255, 0, 1, 1,
0.5875389, -2.057593, 2.822931, 0.3215686, 0, 1, 1,
0.5876312, -1.327022, 1.748747, 0.3254902, 0, 1, 1,
0.5877945, -1.821843, 6.685811, 0.3333333, 0, 1, 1,
0.5882543, 0.8115129, -0.4552448, 0.3372549, 0, 1, 1,
0.590397, -1.265758, 4.696309, 0.345098, 0, 1, 1,
0.5909565, 0.3467081, 1.219956, 0.3490196, 0, 1, 1,
0.5943328, 0.0653245, 0.9263046, 0.3568628, 0, 1, 1,
0.5946754, 1.447182, 0.1743075, 0.3607843, 0, 1, 1,
0.5998844, -0.8250901, 3.184643, 0.3686275, 0, 1, 1,
0.600562, -0.7187524, 2.523981, 0.372549, 0, 1, 1,
0.6019862, -0.06196955, 1.310656, 0.3803922, 0, 1, 1,
0.6041858, 1.20465, 0.4460751, 0.3843137, 0, 1, 1,
0.6048195, -0.7591115, 1.773083, 0.3921569, 0, 1, 1,
0.6064018, -0.1955813, 2.164634, 0.3960784, 0, 1, 1,
0.6108544, 0.6690503, 1.138247, 0.4039216, 0, 1, 1,
0.6193433, 0.6323689, -0.5244069, 0.4117647, 0, 1, 1,
0.6212775, 0.4971321, 1.886629, 0.4156863, 0, 1, 1,
0.6225769, -0.6465168, 4.229003, 0.4235294, 0, 1, 1,
0.624325, -0.7055402, 3.096811, 0.427451, 0, 1, 1,
0.6265282, 0.2174646, 0.5664929, 0.4352941, 0, 1, 1,
0.6267355, -2.067821, 3.478427, 0.4392157, 0, 1, 1,
0.6272452, 2.025568, 1.37944, 0.4470588, 0, 1, 1,
0.6277141, 0.4778753, 1.820081, 0.4509804, 0, 1, 1,
0.6281646, -1.921462, 3.23497, 0.4588235, 0, 1, 1,
0.6303771, 0.3606307, 2.262932, 0.4627451, 0, 1, 1,
0.6333858, 0.5401287, 0.4620338, 0.4705882, 0, 1, 1,
0.6364623, -0.2164521, 1.610702, 0.4745098, 0, 1, 1,
0.6381382, -0.03415204, 1.17793, 0.4823529, 0, 1, 1,
0.6415827, 1.456102, 0.09088568, 0.4862745, 0, 1, 1,
0.6482098, -1.273601, 2.175257, 0.4941176, 0, 1, 1,
0.6484504, -0.6141352, 3.290843, 0.5019608, 0, 1, 1,
0.6505902, 2.271027, -1.851511, 0.5058824, 0, 1, 1,
0.6557212, 0.2099363, 0.2447713, 0.5137255, 0, 1, 1,
0.6595906, 0.4127137, 0.7317827, 0.5176471, 0, 1, 1,
0.6649944, 1.12425, -0.05789854, 0.5254902, 0, 1, 1,
0.666396, 0.7564961, 1.004767, 0.5294118, 0, 1, 1,
0.6711725, 0.9302242, 1.128066, 0.5372549, 0, 1, 1,
0.6748041, -1.501605, 3.325911, 0.5411765, 0, 1, 1,
0.6795814, 0.4944898, 2.798985, 0.5490196, 0, 1, 1,
0.6796189, -0.2878633, 1.777462, 0.5529412, 0, 1, 1,
0.6815472, -0.1017076, 2.341737, 0.5607843, 0, 1, 1,
0.6892395, 0.9391392, 1.837861, 0.5647059, 0, 1, 1,
0.6902379, 0.3323097, 1.312536, 0.572549, 0, 1, 1,
0.6938956, 0.4743211, 2.128464, 0.5764706, 0, 1, 1,
0.6961421, -1.514992, 2.230404, 0.5843138, 0, 1, 1,
0.6965128, -0.436618, 1.526667, 0.5882353, 0, 1, 1,
0.6971674, -0.9895768, 3.92552, 0.5960785, 0, 1, 1,
0.6974322, 0.02039088, 2.91938, 0.6039216, 0, 1, 1,
0.6996168, -0.3486377, 0.969816, 0.6078432, 0, 1, 1,
0.7006804, -0.3560731, 0.5782006, 0.6156863, 0, 1, 1,
0.7041914, 0.7194747, 1.440979, 0.6196079, 0, 1, 1,
0.7072695, -2.055481, 2.459992, 0.627451, 0, 1, 1,
0.7079592, -0.4899271, 2.233756, 0.6313726, 0, 1, 1,
0.7083136, -0.2475, 2.165342, 0.6392157, 0, 1, 1,
0.7097831, -0.8510579, 2.590028, 0.6431373, 0, 1, 1,
0.7105138, 0.1603887, 1.16572, 0.6509804, 0, 1, 1,
0.7116599, 2.67827, 0.3405009, 0.654902, 0, 1, 1,
0.7177591, 0.4034983, 0.1348372, 0.6627451, 0, 1, 1,
0.7340298, -0.8158258, 3.997612, 0.6666667, 0, 1, 1,
0.7341659, -0.7737343, 2.993569, 0.6745098, 0, 1, 1,
0.7365322, -0.8863713, 2.175765, 0.6784314, 0, 1, 1,
0.7470102, -2.894141, 2.960571, 0.6862745, 0, 1, 1,
0.7508992, -0.4400564, 1.083962, 0.6901961, 0, 1, 1,
0.751953, -1.961801, 3.541002, 0.6980392, 0, 1, 1,
0.754106, -2.281888, 2.953672, 0.7058824, 0, 1, 1,
0.7583305, -0.4617732, 1.67621, 0.7098039, 0, 1, 1,
0.770492, -0.175162, 1.969215, 0.7176471, 0, 1, 1,
0.7748426, 0.8468874, -0.3628871, 0.7215686, 0, 1, 1,
0.7786228, -0.1451441, 2.070179, 0.7294118, 0, 1, 1,
0.7790167, -1.971178, 3.81315, 0.7333333, 0, 1, 1,
0.7791892, 1.831603, 1.942459, 0.7411765, 0, 1, 1,
0.78104, 0.9335897, 0.689393, 0.7450981, 0, 1, 1,
0.7813741, 1.235587, 0.5447696, 0.7529412, 0, 1, 1,
0.783181, -0.4705833, 1.700156, 0.7568628, 0, 1, 1,
0.7833857, -0.8980144, 2.912642, 0.7647059, 0, 1, 1,
0.7857653, -0.1810526, 1.909949, 0.7686275, 0, 1, 1,
0.78859, -2.034003, 2.497278, 0.7764706, 0, 1, 1,
0.7890089, 0.7435558, 0.2563081, 0.7803922, 0, 1, 1,
0.794638, 0.889492, 1.002353, 0.7882353, 0, 1, 1,
0.7954902, 0.3970437, 2.091917, 0.7921569, 0, 1, 1,
0.7955464, 0.2835531, 0.7858469, 0.8, 0, 1, 1,
0.7989621, -0.4074669, 0.1446814, 0.8078431, 0, 1, 1,
0.7994986, 1.210757, -0.6980267, 0.8117647, 0, 1, 1,
0.8023704, -1.37653, 2.540706, 0.8196079, 0, 1, 1,
0.8044025, 1.398921, -0.7080472, 0.8235294, 0, 1, 1,
0.8081988, -0.1071279, 1.122625, 0.8313726, 0, 1, 1,
0.8210477, 0.5857243, 1.257595, 0.8352941, 0, 1, 1,
0.8213438, 0.8305619, 0.6210319, 0.8431373, 0, 1, 1,
0.8349685, -0.9643498, 2.993116, 0.8470588, 0, 1, 1,
0.8447513, 0.1193349, 0.4802953, 0.854902, 0, 1, 1,
0.8484473, 0.7026618, 0.7028121, 0.8588235, 0, 1, 1,
0.8498703, -0.04486478, 0.8961558, 0.8666667, 0, 1, 1,
0.8524013, -1.549875, 2.270153, 0.8705882, 0, 1, 1,
0.8578597, -1.830155, 1.683937, 0.8784314, 0, 1, 1,
0.8584796, -0.3058816, 2.238905, 0.8823529, 0, 1, 1,
0.8658833, 0.9193478, -0.02519445, 0.8901961, 0, 1, 1,
0.8698657, 2.079888, 2.387174, 0.8941177, 0, 1, 1,
0.8713737, -0.002550961, 1.553329, 0.9019608, 0, 1, 1,
0.8747672, 0.2828626, 1.578898, 0.9098039, 0, 1, 1,
0.8777192, 0.09281076, 1.931579, 0.9137255, 0, 1, 1,
0.8783801, -0.4514742, 1.708427, 0.9215686, 0, 1, 1,
0.8961995, -0.359747, 2.27161, 0.9254902, 0, 1, 1,
0.8998991, 0.01782607, 0.5609666, 0.9333333, 0, 1, 1,
0.905724, -0.2275334, 1.353211, 0.9372549, 0, 1, 1,
0.9068362, -1.297284, 2.504882, 0.945098, 0, 1, 1,
0.9094377, 2.469024, 1.245568, 0.9490196, 0, 1, 1,
0.9146297, -0.8599749, 2.348686, 0.9568627, 0, 1, 1,
0.9169278, -0.003657632, 2.577248, 0.9607843, 0, 1, 1,
0.9183671, 2.379523, 0.7271007, 0.9686275, 0, 1, 1,
0.9217041, 0.7291498, 0.1902814, 0.972549, 0, 1, 1,
0.925641, -0.6557584, 3.414824, 0.9803922, 0, 1, 1,
0.9318891, -0.7548365, 1.84057, 0.9843137, 0, 1, 1,
0.9351322, -0.4552509, 1.548046, 0.9921569, 0, 1, 1,
0.9398293, 0.1296774, 2.704329, 0.9960784, 0, 1, 1,
0.9400877, 0.6772975, -0.8102722, 1, 0, 0.9960784, 1,
0.9418268, 0.3580862, 0.5065554, 1, 0, 0.9882353, 1,
0.9456185, -1.157984, 4.875242, 1, 0, 0.9843137, 1,
0.9463698, 0.645418, 0.8732007, 1, 0, 0.9764706, 1,
0.949319, -0.08562879, 1.808585, 1, 0, 0.972549, 1,
0.9526328, -0.9914459, 2.654329, 1, 0, 0.9647059, 1,
0.9555094, 0.06116909, 2.183591, 1, 0, 0.9607843, 1,
0.9575773, -0.767711, 2.964581, 1, 0, 0.9529412, 1,
0.9579429, 0.5297459, 2.091654, 1, 0, 0.9490196, 1,
0.9601709, 0.0294544, 2.806623, 1, 0, 0.9411765, 1,
0.9608346, 0.6069005, -0.7877333, 1, 0, 0.9372549, 1,
0.9613651, 0.06736536, 1.490997, 1, 0, 0.9294118, 1,
0.965637, -0.007184112, 1.418906, 1, 0, 0.9254902, 1,
0.9669712, -0.6928554, 3.01202, 1, 0, 0.9176471, 1,
0.9670171, 0.1300104, 1.264726, 1, 0, 0.9137255, 1,
0.9858369, -2.189789, 3.057264, 1, 0, 0.9058824, 1,
0.9868229, -1.240545, 2.92304, 1, 0, 0.9019608, 1,
0.9888996, 0.3939792, -0.1359002, 1, 0, 0.8941177, 1,
0.9918694, -0.6327907, 1.490995, 1, 0, 0.8862745, 1,
0.9930685, 0.4153597, 1.500996, 1, 0, 0.8823529, 1,
0.993189, 0.2194503, 2.630008, 1, 0, 0.8745098, 1,
0.9968454, -0.3040086, 1.855247, 1, 0, 0.8705882, 1,
1.003837, 0.4528467, 1.140716, 1, 0, 0.8627451, 1,
1.017116, -1.075078, 2.527035, 1, 0, 0.8588235, 1,
1.021381, -0.2592447, 2.121191, 1, 0, 0.8509804, 1,
1.030564, 0.7917362, 1.209219, 1, 0, 0.8470588, 1,
1.035593, -0.1051454, 1.5195, 1, 0, 0.8392157, 1,
1.048787, 0.2566752, 2.604133, 1, 0, 0.8352941, 1,
1.048913, 0.6477188, 1.429119, 1, 0, 0.827451, 1,
1.054957, 0.2677731, 1.848553, 1, 0, 0.8235294, 1,
1.06155, 0.1501532, 2.100981, 1, 0, 0.8156863, 1,
1.064341, 0.9572245, 1.583641, 1, 0, 0.8117647, 1,
1.064724, 0.355289, 0.8157291, 1, 0, 0.8039216, 1,
1.067909, -1.785851, 1.770483, 1, 0, 0.7960784, 1,
1.09187, 0.2477106, 0.5344409, 1, 0, 0.7921569, 1,
1.094865, 1.896794, 1.989284, 1, 0, 0.7843137, 1,
1.094895, -0.05582311, -0.05722079, 1, 0, 0.7803922, 1,
1.096013, -0.4313707, 3.098196, 1, 0, 0.772549, 1,
1.096345, 0.9511307, 2.037116, 1, 0, 0.7686275, 1,
1.098155, 0.7427955, 1.29064, 1, 0, 0.7607843, 1,
1.10094, -0.4374083, 2.382557, 1, 0, 0.7568628, 1,
1.101653, -1.148702, 1.487087, 1, 0, 0.7490196, 1,
1.102306, -0.02713088, 1.650351, 1, 0, 0.7450981, 1,
1.11889, 0.8472395, 1.745542, 1, 0, 0.7372549, 1,
1.130975, 0.01737062, 0.6100747, 1, 0, 0.7333333, 1,
1.144116, -0.8311478, 0.9709547, 1, 0, 0.7254902, 1,
1.150395, 2.297513, -0.3436886, 1, 0, 0.7215686, 1,
1.153921, 0.0790246, 1.222426, 1, 0, 0.7137255, 1,
1.159554, 1.056373, 0.6418259, 1, 0, 0.7098039, 1,
1.170946, 0.1496757, 2.096759, 1, 0, 0.7019608, 1,
1.177076, 0.09243002, 3.252991, 1, 0, 0.6941177, 1,
1.180614, 1.652758, 1.308923, 1, 0, 0.6901961, 1,
1.185103, -1.033061, 1.312275, 1, 0, 0.682353, 1,
1.188781, 0.4734206, 0.9523321, 1, 0, 0.6784314, 1,
1.190967, 1.071709, 0.9886872, 1, 0, 0.6705883, 1,
1.193407, 1.019723, -0.4294953, 1, 0, 0.6666667, 1,
1.194174, -0.7835899, 2.090216, 1, 0, 0.6588235, 1,
1.208481, 0.7572626, -1.872872, 1, 0, 0.654902, 1,
1.210137, 0.5894884, 0.2885861, 1, 0, 0.6470588, 1,
1.210992, -1.061042, 1.244341, 1, 0, 0.6431373, 1,
1.218497, 0.5126675, -0.02274603, 1, 0, 0.6352941, 1,
1.219915, 0.1770522, 0.9009516, 1, 0, 0.6313726, 1,
1.224645, -0.8993445, 2.378676, 1, 0, 0.6235294, 1,
1.226934, 0.8873928, 1.119703, 1, 0, 0.6196079, 1,
1.231703, 0.5244828, 0.6323592, 1, 0, 0.6117647, 1,
1.235855, -1.076112, 0.08982241, 1, 0, 0.6078432, 1,
1.236104, -0.7793193, 2.861426, 1, 0, 0.6, 1,
1.23823, 0.6413793, 2.029295, 1, 0, 0.5921569, 1,
1.240059, -0.4423066, 2.578467, 1, 0, 0.5882353, 1,
1.241291, 1.879002, -1.417902, 1, 0, 0.5803922, 1,
1.243819, -1.723802, 2.310868, 1, 0, 0.5764706, 1,
1.255365, 0.1705364, 1.587712, 1, 0, 0.5686275, 1,
1.262076, -0.379521, 1.93147, 1, 0, 0.5647059, 1,
1.282477, 0.1962921, 2.207734, 1, 0, 0.5568628, 1,
1.283125, 1.312598, 1.23603, 1, 0, 0.5529412, 1,
1.283984, 1.180202, -0.863673, 1, 0, 0.5450981, 1,
1.286684, 0.6495323, 1.640905, 1, 0, 0.5411765, 1,
1.29321, -0.2873832, 4.4453, 1, 0, 0.5333334, 1,
1.297039, -1.427364, 2.96954, 1, 0, 0.5294118, 1,
1.302619, 0.6439744, -0.9116513, 1, 0, 0.5215687, 1,
1.303518, 0.07579336, 2.18807, 1, 0, 0.5176471, 1,
1.304719, -0.1295202, 1.373152, 1, 0, 0.509804, 1,
1.307834, -1.041499, 3.582342, 1, 0, 0.5058824, 1,
1.325459, -0.2295419, 2.356191, 1, 0, 0.4980392, 1,
1.332623, -0.05822373, 1.642977, 1, 0, 0.4901961, 1,
1.338448, -0.5759417, 0.7828898, 1, 0, 0.4862745, 1,
1.352346, 0.8144493, 1.09587, 1, 0, 0.4784314, 1,
1.355441, 0.340036, 2.414062, 1, 0, 0.4745098, 1,
1.356413, 0.1777358, 0.9298099, 1, 0, 0.4666667, 1,
1.36287, -0.04207313, 1.941728, 1, 0, 0.4627451, 1,
1.363742, -0.7738864, 0.4870613, 1, 0, 0.454902, 1,
1.371914, -2.00893, 1.487074, 1, 0, 0.4509804, 1,
1.374915, 0.07389238, 0.637457, 1, 0, 0.4431373, 1,
1.376699, 0.7784671, -1.435776, 1, 0, 0.4392157, 1,
1.378279, 1.010746, 0.182392, 1, 0, 0.4313726, 1,
1.382261, 0.3137657, 0.8649994, 1, 0, 0.427451, 1,
1.398156, -0.815631, 0.9891443, 1, 0, 0.4196078, 1,
1.420172, -0.03354313, 0.3083787, 1, 0, 0.4156863, 1,
1.439306, -0.8520755, 0.4834406, 1, 0, 0.4078431, 1,
1.442657, 0.2179514, 1.394592, 1, 0, 0.4039216, 1,
1.484331, -1.484899, 2.820823, 1, 0, 0.3960784, 1,
1.488045, -1.34786, 2.674897, 1, 0, 0.3882353, 1,
1.494969, 1.441372, -0.7089272, 1, 0, 0.3843137, 1,
1.497502, -1.381521, 2.448636, 1, 0, 0.3764706, 1,
1.499816, -0.0093576, 1.556171, 1, 0, 0.372549, 1,
1.502843, 1.666396, 1.570173, 1, 0, 0.3647059, 1,
1.511002, 0.5903301, 0.8439675, 1, 0, 0.3607843, 1,
1.5435, 0.3412438, 2.248938, 1, 0, 0.3529412, 1,
1.553499, 1.172829, -0.2811624, 1, 0, 0.3490196, 1,
1.553752, -0.8364816, 2.647668, 1, 0, 0.3411765, 1,
1.555078, -0.6214206, 1.607249, 1, 0, 0.3372549, 1,
1.56616, 0.5440439, 2.13138, 1, 0, 0.3294118, 1,
1.569345, -0.8370477, 3.307612, 1, 0, 0.3254902, 1,
1.58221, -0.04346865, 0.7896129, 1, 0, 0.3176471, 1,
1.606365, 1.065403, 1.823621, 1, 0, 0.3137255, 1,
1.60984, 1.481455, 0.4226349, 1, 0, 0.3058824, 1,
1.626424, 1.599922, 0.147427, 1, 0, 0.2980392, 1,
1.628368, 0.9236469, 1.081108, 1, 0, 0.2941177, 1,
1.638715, 1.229889, 1.448221, 1, 0, 0.2862745, 1,
1.646515, 0.6634674, 0.8738443, 1, 0, 0.282353, 1,
1.655413, 1.346148, 0.1858763, 1, 0, 0.2745098, 1,
1.656713, -1.80434, 2.905743, 1, 0, 0.2705882, 1,
1.687142, 0.4031278, -0.783508, 1, 0, 0.2627451, 1,
1.711091, 0.2543204, 1.242933, 1, 0, 0.2588235, 1,
1.720818, -1.369062, 2.863873, 1, 0, 0.2509804, 1,
1.724712, -1.361318, 1.428649, 1, 0, 0.2470588, 1,
1.726043, -1.817168, 2.0367, 1, 0, 0.2392157, 1,
1.728539, 0.2206219, 0.9665844, 1, 0, 0.2352941, 1,
1.750556, 0.8370289, 3.384467, 1, 0, 0.227451, 1,
1.765382, 0.7100593, 2.700326, 1, 0, 0.2235294, 1,
1.775954, -1.023129, 2.171121, 1, 0, 0.2156863, 1,
1.825753, 1.004334, 0.7411028, 1, 0, 0.2117647, 1,
1.835333, -1.893371, 1.302628, 1, 0, 0.2039216, 1,
1.851794, -0.4065368, 0.6076301, 1, 0, 0.1960784, 1,
1.873865, 0.4953484, 1.655529, 1, 0, 0.1921569, 1,
1.87801, -1.857188, 3.777835, 1, 0, 0.1843137, 1,
1.88237, -0.472309, 1.929702, 1, 0, 0.1803922, 1,
1.901445, 1.718738, 1.329611, 1, 0, 0.172549, 1,
1.930291, -0.5288101, -0.2747445, 1, 0, 0.1686275, 1,
1.950506, 1.006883, -0.402554, 1, 0, 0.1607843, 1,
2.009404, -0.1618286, 2.699746, 1, 0, 0.1568628, 1,
2.012136, 0.1486001, 0.7141774, 1, 0, 0.1490196, 1,
2.014359, 0.7829494, 0.7000967, 1, 0, 0.145098, 1,
2.014929, 1.195665, 1.764408, 1, 0, 0.1372549, 1,
2.032804, 0.7004982, 1.12971, 1, 0, 0.1333333, 1,
2.103116, -1.371127, 2.71274, 1, 0, 0.1254902, 1,
2.112175, 0.7210025, 0.9187682, 1, 0, 0.1215686, 1,
2.14128, 0.1914406, 2.549829, 1, 0, 0.1137255, 1,
2.175464, 0.006178925, 0.0691435, 1, 0, 0.1098039, 1,
2.214463, -0.4285337, 2.013717, 1, 0, 0.1019608, 1,
2.220236, 2.394387, -0.01949826, 1, 0, 0.09411765, 1,
2.256851, -1.177788, 2.418192, 1, 0, 0.09019608, 1,
2.261333, -0.7710719, 1.928723, 1, 0, 0.08235294, 1,
2.272588, -0.2774048, 0.8802342, 1, 0, 0.07843138, 1,
2.290849, -0.7119387, 2.172836, 1, 0, 0.07058824, 1,
2.303175, 0.1147183, 0.29425, 1, 0, 0.06666667, 1,
2.304359, -0.0172844, 1.665125, 1, 0, 0.05882353, 1,
2.324418, -1.703981, 2.406229, 1, 0, 0.05490196, 1,
2.33778, 0.3243707, 1.777807, 1, 0, 0.04705882, 1,
2.393282, 0.3897323, 0.7554261, 1, 0, 0.04313726, 1,
2.43856, -0.4073488, 1.104172, 1, 0, 0.03529412, 1,
2.574728, -0.6220201, 3.496342, 1, 0, 0.03137255, 1,
2.579298, -0.7323366, 2.06924, 1, 0, 0.02352941, 1,
2.626843, -0.2578348, 0.2770889, 1, 0, 0.01960784, 1,
2.922293, -0.6414491, 1.386313, 1, 0, 0.01176471, 1,
3.033546, 1.449707, -0.6860517, 1, 0, 0.007843138, 1
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
-0.01440406, -3.909074, -7.221613, 0, -0.5, 0.5, 0.5,
-0.01440406, -3.909074, -7.221613, 1, -0.5, 0.5, 0.5,
-0.01440406, -3.909074, -7.221613, 1, 1.5, 0.5, 0.5,
-0.01440406, -3.909074, -7.221613, 0, 1.5, 0.5, 0.5
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
-4.095609, -0.1380374, -7.221613, 0, -0.5, 0.5, 0.5,
-4.095609, -0.1380374, -7.221613, 1, -0.5, 0.5, 0.5,
-4.095609, -0.1380374, -7.221613, 1, 1.5, 0.5, 0.5,
-4.095609, -0.1380374, -7.221613, 0, 1.5, 0.5, 0.5
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
-4.095609, -3.909074, 0.7399261, 0, -0.5, 0.5, 0.5,
-4.095609, -3.909074, 0.7399261, 1, -0.5, 0.5, 0.5,
-4.095609, -3.909074, 0.7399261, 1, 1.5, 0.5, 0.5,
-4.095609, -3.909074, 0.7399261, 0, 1.5, 0.5, 0.5
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
-3, -3.038835, -5.384335,
3, -3.038835, -5.384335,
-3, -3.038835, -5.384335,
-3, -3.183874, -5.690548,
-2, -3.038835, -5.384335,
-2, -3.183874, -5.690548,
-1, -3.038835, -5.384335,
-1, -3.183874, -5.690548,
0, -3.038835, -5.384335,
0, -3.183874, -5.690548,
1, -3.038835, -5.384335,
1, -3.183874, -5.690548,
2, -3.038835, -5.384335,
2, -3.183874, -5.690548,
3, -3.038835, -5.384335,
3, -3.183874, -5.690548
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
-3, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
-3, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
-3, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
-3, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5,
-2, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
-2, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
-2, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
-2, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5,
-1, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
-1, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
-1, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
-1, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5,
0, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
0, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
0, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
0, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5,
1, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
1, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
1, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
1, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5,
2, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
2, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
2, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
2, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5,
3, -3.473954, -6.302974, 0, -0.5, 0.5, 0.5,
3, -3.473954, -6.302974, 1, -0.5, 0.5, 0.5,
3, -3.473954, -6.302974, 1, 1.5, 0.5, 0.5,
3, -3.473954, -6.302974, 0, 1.5, 0.5, 0.5
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
-3.153792, -2, -5.384335,
-3.153792, 2, -5.384335,
-3.153792, -2, -5.384335,
-3.310762, -2, -5.690548,
-3.153792, -1, -5.384335,
-3.310762, -1, -5.690548,
-3.153792, 0, -5.384335,
-3.310762, 0, -5.690548,
-3.153792, 1, -5.384335,
-3.310762, 1, -5.690548,
-3.153792, 2, -5.384335,
-3.310762, 2, -5.690548
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
-3.624701, -2, -6.302974, 0, -0.5, 0.5, 0.5,
-3.624701, -2, -6.302974, 1, -0.5, 0.5, 0.5,
-3.624701, -2, -6.302974, 1, 1.5, 0.5, 0.5,
-3.624701, -2, -6.302974, 0, 1.5, 0.5, 0.5,
-3.624701, -1, -6.302974, 0, -0.5, 0.5, 0.5,
-3.624701, -1, -6.302974, 1, -0.5, 0.5, 0.5,
-3.624701, -1, -6.302974, 1, 1.5, 0.5, 0.5,
-3.624701, -1, -6.302974, 0, 1.5, 0.5, 0.5,
-3.624701, 0, -6.302974, 0, -0.5, 0.5, 0.5,
-3.624701, 0, -6.302974, 1, -0.5, 0.5, 0.5,
-3.624701, 0, -6.302974, 1, 1.5, 0.5, 0.5,
-3.624701, 0, -6.302974, 0, 1.5, 0.5, 0.5,
-3.624701, 1, -6.302974, 0, -0.5, 0.5, 0.5,
-3.624701, 1, -6.302974, 1, -0.5, 0.5, 0.5,
-3.624701, 1, -6.302974, 1, 1.5, 0.5, 0.5,
-3.624701, 1, -6.302974, 0, 1.5, 0.5, 0.5,
-3.624701, 2, -6.302974, 0, -0.5, 0.5, 0.5,
-3.624701, 2, -6.302974, 1, -0.5, 0.5, 0.5,
-3.624701, 2, -6.302974, 1, 1.5, 0.5, 0.5,
-3.624701, 2, -6.302974, 0, 1.5, 0.5, 0.5
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
-3.153792, -3.038835, -4,
-3.153792, -3.038835, 6,
-3.153792, -3.038835, -4,
-3.310762, -3.183874, -4,
-3.153792, -3.038835, -2,
-3.310762, -3.183874, -2,
-3.153792, -3.038835, 0,
-3.310762, -3.183874, 0,
-3.153792, -3.038835, 2,
-3.310762, -3.183874, 2,
-3.153792, -3.038835, 4,
-3.310762, -3.183874, 4,
-3.153792, -3.038835, 6,
-3.310762, -3.183874, 6
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
-3.624701, -3.473954, -4, 0, -0.5, 0.5, 0.5,
-3.624701, -3.473954, -4, 1, -0.5, 0.5, 0.5,
-3.624701, -3.473954, -4, 1, 1.5, 0.5, 0.5,
-3.624701, -3.473954, -4, 0, 1.5, 0.5, 0.5,
-3.624701, -3.473954, -2, 0, -0.5, 0.5, 0.5,
-3.624701, -3.473954, -2, 1, -0.5, 0.5, 0.5,
-3.624701, -3.473954, -2, 1, 1.5, 0.5, 0.5,
-3.624701, -3.473954, -2, 0, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 0, 0, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 0, 1, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 0, 1, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 0, 0, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 2, 0, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 2, 1, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 2, 1, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 2, 0, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 4, 0, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 4, 1, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 4, 1, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 4, 0, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 6, 0, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 6, 1, -0.5, 0.5, 0.5,
-3.624701, -3.473954, 6, 1, 1.5, 0.5, 0.5,
-3.624701, -3.473954, 6, 0, 1.5, 0.5, 0.5
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
-3.153792, -3.038835, -5.384335,
-3.153792, 2.76276, -5.384335,
-3.153792, -3.038835, 6.864187,
-3.153792, 2.76276, 6.864187,
-3.153792, -3.038835, -5.384335,
-3.153792, -3.038835, 6.864187,
-3.153792, 2.76276, -5.384335,
-3.153792, 2.76276, 6.864187,
-3.153792, -3.038835, -5.384335,
3.124984, -3.038835, -5.384335,
-3.153792, -3.038835, 6.864187,
3.124984, -3.038835, 6.864187,
-3.153792, 2.76276, -5.384335,
3.124984, 2.76276, -5.384335,
-3.153792, 2.76276, 6.864187,
3.124984, 2.76276, 6.864187,
3.124984, -3.038835, -5.384335,
3.124984, 2.76276, -5.384335,
3.124984, -3.038835, 6.864187,
3.124984, 2.76276, 6.864187,
3.124984, -3.038835, -5.384335,
3.124984, -3.038835, 6.864187,
3.124984, 2.76276, -5.384335,
3.124984, 2.76276, 6.864187
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
var radius = 7.975958;
var distance = 35.48594;
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
mvMatrix.translate( 0.01440406, 0.1380374, -0.7399261 );
mvMatrix.scale( 1.373478, 1.486447, 0.7040655 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.48594);
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
ethoxyquin<-read.table("ethoxyquin.xyz")
```

```
## Error in read.table("ethoxyquin.xyz"): no lines available in input
```

```r
x<-ethoxyquin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
```

```r
y<-ethoxyquin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
```

```r
z<-ethoxyquin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
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
-3.062354, -0.03650774, -2.069159, 0, 0, 1, 1, 1,
-3.030702, -1.228548, -2.565963, 1, 0, 0, 1, 1,
-2.867796, 0.3673241, -0.4435723, 1, 0, 0, 1, 1,
-2.634307, 1.842369, -1.629653, 1, 0, 0, 1, 1,
-2.556391, 0.4602329, -3.77561, 1, 0, 0, 1, 1,
-2.521635, -0.9488115, -3.804556, 1, 0, 0, 1, 1,
-2.477999, -0.1844274, -3.807764, 0, 0, 0, 1, 1,
-2.455319, 0.1060304, -1.647459, 0, 0, 0, 1, 1,
-2.322343, -2.125641, -2.994469, 0, 0, 0, 1, 1,
-2.227141, 1.25097, -0.04925902, 0, 0, 0, 1, 1,
-2.14463, -0.8721958, -1.42267, 0, 0, 0, 1, 1,
-2.106083, -1.054421, -3.685562, 0, 0, 0, 1, 1,
-2.094847, 0.537694, -1.723903, 0, 0, 0, 1, 1,
-2.052987, 1.164253, -1.806479, 1, 1, 1, 1, 1,
-2.048803, -0.204482, -1.025322, 1, 1, 1, 1, 1,
-2.04545, -0.4669877, -3.121806, 1, 1, 1, 1, 1,
-1.988911, 0.9690895, 0.5063565, 1, 1, 1, 1, 1,
-1.987753, 1.324079, -0.7328775, 1, 1, 1, 1, 1,
-1.960582, 0.05247721, -0.1277022, 1, 1, 1, 1, 1,
-1.930948, 0.8293952, -2.150147, 1, 1, 1, 1, 1,
-1.907061, -1.180139, -1.72668, 1, 1, 1, 1, 1,
-1.901986, -0.08409236, -2.793977, 1, 1, 1, 1, 1,
-1.880022, -0.5925665, 0.04476864, 1, 1, 1, 1, 1,
-1.862677, -0.9420527, -3.224298, 1, 1, 1, 1, 1,
-1.859077, 0.7001505, -1.518927, 1, 1, 1, 1, 1,
-1.833688, 2.036941, 0.5202502, 1, 1, 1, 1, 1,
-1.828355, 1.115189, -0.6872098, 1, 1, 1, 1, 1,
-1.825955, -1.892175, -2.788156, 1, 1, 1, 1, 1,
-1.80633, -1.018094, -2.311396, 0, 0, 1, 1, 1,
-1.797129, 0.4324147, -2.375601, 1, 0, 0, 1, 1,
-1.794636, 0.1801101, -2.507746, 1, 0, 0, 1, 1,
-1.787606, -0.2843086, -0.7987807, 1, 0, 0, 1, 1,
-1.78064, -0.06134874, -2.393567, 1, 0, 0, 1, 1,
-1.779275, -0.8039523, -3.767087, 1, 0, 0, 1, 1,
-1.777775, -0.419812, -3.479485, 0, 0, 0, 1, 1,
-1.777698, 0.6182568, -1.861527, 0, 0, 0, 1, 1,
-1.769689, -0.603974, -2.31651, 0, 0, 0, 1, 1,
-1.764048, 0.5514665, -2.011618, 0, 0, 0, 1, 1,
-1.749927, -2.112211, -2.518261, 0, 0, 0, 1, 1,
-1.735643, 0.07482085, -1.286937, 0, 0, 0, 1, 1,
-1.728497, -1.715701, -1.580535, 0, 0, 0, 1, 1,
-1.72771, -0.7002674, -2.721259, 1, 1, 1, 1, 1,
-1.711829, 0.02205255, -1.944711, 1, 1, 1, 1, 1,
-1.684399, 1.146632, 0.1456039, 1, 1, 1, 1, 1,
-1.682303, -0.5305256, -2.13275, 1, 1, 1, 1, 1,
-1.677215, 0.2005869, -1.608477, 1, 1, 1, 1, 1,
-1.652993, 0.4647219, -2.056462, 1, 1, 1, 1, 1,
-1.642011, 0.5355388, -0.8492743, 1, 1, 1, 1, 1,
-1.638335, -0.8373799, -2.88694, 1, 1, 1, 1, 1,
-1.637967, 1.152656, -1.596119, 1, 1, 1, 1, 1,
-1.627953, -0.8461118, -1.947192, 1, 1, 1, 1, 1,
-1.627813, 0.489878, -0.3981304, 1, 1, 1, 1, 1,
-1.615789, 0.4217128, -3.070382, 1, 1, 1, 1, 1,
-1.609574, -0.5281369, -1.662343, 1, 1, 1, 1, 1,
-1.59983, 0.7245872, -1.775668, 1, 1, 1, 1, 1,
-1.57759, -0.06042403, -1.963148, 1, 1, 1, 1, 1,
-1.568557, -0.2788341, 0.9135503, 0, 0, 1, 1, 1,
-1.556605, 0.6137535, -2.287248, 1, 0, 0, 1, 1,
-1.555265, -0.2313137, -1.353726, 1, 0, 0, 1, 1,
-1.537544, -0.2952075, -2.080124, 1, 0, 0, 1, 1,
-1.537279, -1.401148, -1.94416, 1, 0, 0, 1, 1,
-1.527937, 0.7118921, -0.9459785, 1, 0, 0, 1, 1,
-1.519747, 0.1032986, -1.179118, 0, 0, 0, 1, 1,
-1.503178, -0.1865219, -2.879516, 0, 0, 0, 1, 1,
-1.495494, 1.257314, -2.403143, 0, 0, 0, 1, 1,
-1.481519, -0.9640274, -1.602746, 0, 0, 0, 1, 1,
-1.469839, 1.68346, -1.26135, 0, 0, 0, 1, 1,
-1.460513, 0.6969175, -1.302836, 0, 0, 0, 1, 1,
-1.456334, 2.21959, -2.213342, 0, 0, 0, 1, 1,
-1.44438, 0.4644752, -1.994099, 1, 1, 1, 1, 1,
-1.439243, -0.9496993, -1.845294, 1, 1, 1, 1, 1,
-1.427724, 0.3140097, -1.356682, 1, 1, 1, 1, 1,
-1.420804, -0.1288457, -1.56631, 1, 1, 1, 1, 1,
-1.417469, 0.3376924, -0.7838688, 1, 1, 1, 1, 1,
-1.417023, 0.1742339, -0.3259905, 1, 1, 1, 1, 1,
-1.403174, 1.304639, -1.347205, 1, 1, 1, 1, 1,
-1.395053, -0.868553, -0.5043145, 1, 1, 1, 1, 1,
-1.381854, 0.2974135, -1.371477, 1, 1, 1, 1, 1,
-1.371818, 0.5796332, -1.580889, 1, 1, 1, 1, 1,
-1.367102, 1.184324, -0.3120025, 1, 1, 1, 1, 1,
-1.349487, -2.247738, -3.001281, 1, 1, 1, 1, 1,
-1.347633, 1.713478, -1.634231, 1, 1, 1, 1, 1,
-1.347391, -0.2348614, -0.980705, 1, 1, 1, 1, 1,
-1.33382, -0.9118308, -3.977638, 1, 1, 1, 1, 1,
-1.329729, 0.08619939, -1.980932, 0, 0, 1, 1, 1,
-1.329357, 0.6021368, -0.6651865, 1, 0, 0, 1, 1,
-1.324317, -1.139959, -1.616105, 1, 0, 0, 1, 1,
-1.322102, -1.359435, -2.297266, 1, 0, 0, 1, 1,
-1.305218, 0.3904342, -1.897574, 1, 0, 0, 1, 1,
-1.293876, -0.7108235, -2.27487, 1, 0, 0, 1, 1,
-1.292636, 0.5445955, -1.462803, 0, 0, 0, 1, 1,
-1.292379, -1.344211, -1.091184, 0, 0, 0, 1, 1,
-1.289795, 0.2784297, -1.969995, 0, 0, 0, 1, 1,
-1.261406, -0.7038301, -1.547824, 0, 0, 0, 1, 1,
-1.25803, -0.5717594, 0.3301429, 0, 0, 0, 1, 1,
-1.25642, 1.629888, -0.1316596, 0, 0, 0, 1, 1,
-1.24094, 0.2183644, -2.816942, 0, 0, 0, 1, 1,
-1.230154, 0.861061, -2.344079, 1, 1, 1, 1, 1,
-1.228468, 0.2759115, -0.8421391, 1, 1, 1, 1, 1,
-1.227781, -0.9988413, -1.241426, 1, 1, 1, 1, 1,
-1.22592, -1.292969, -0.007345775, 1, 1, 1, 1, 1,
-1.221723, -1.186511, -3.218291, 1, 1, 1, 1, 1,
-1.218656, -2.523438, -3.33086, 1, 1, 1, 1, 1,
-1.218604, 1.013785, -1.104392, 1, 1, 1, 1, 1,
-1.215827, 0.230495, -0.8453819, 1, 1, 1, 1, 1,
-1.214344, 0.9788755, -2.776855, 1, 1, 1, 1, 1,
-1.212157, -0.2762208, -1.133612, 1, 1, 1, 1, 1,
-1.211899, 1.527646, -0.08675232, 1, 1, 1, 1, 1,
-1.209937, 0.4031136, -0.336783, 1, 1, 1, 1, 1,
-1.209243, -1.04759, -0.9587629, 1, 1, 1, 1, 1,
-1.207229, 0.5734366, -1.797804, 1, 1, 1, 1, 1,
-1.205502, 0.3275885, -1.025592, 1, 1, 1, 1, 1,
-1.204548, 0.02808061, -0.7939652, 0, 0, 1, 1, 1,
-1.195801, -1.145324, -1.484434, 1, 0, 0, 1, 1,
-1.187943, -0.8478785, -1.35705, 1, 0, 0, 1, 1,
-1.186809, -0.1842329, -0.2837148, 1, 0, 0, 1, 1,
-1.185904, 0.3332687, -1.438897, 1, 0, 0, 1, 1,
-1.18534, -0.1351885, -1.890644, 1, 0, 0, 1, 1,
-1.179961, -0.7785546, -1.716084, 0, 0, 0, 1, 1,
-1.174197, 0.5321805, -0.2425383, 0, 0, 0, 1, 1,
-1.170912, 0.1184724, -1.386288, 0, 0, 0, 1, 1,
-1.161917, -1.884088, -1.556705, 0, 0, 0, 1, 1,
-1.155942, -1.618199, -3.179909, 0, 0, 0, 1, 1,
-1.14477, -1.162211, -1.671802, 0, 0, 0, 1, 1,
-1.144614, -0.7739914, -0.9483767, 0, 0, 0, 1, 1,
-1.12885, 0.6780114, -1.445401, 1, 1, 1, 1, 1,
-1.123316, 0.7848882, -2.196984, 1, 1, 1, 1, 1,
-1.122626, -1.951242, -2.725843, 1, 1, 1, 1, 1,
-1.12071, -0.4876029, -1.436359, 1, 1, 1, 1, 1,
-1.118993, -0.1800662, -1.130203, 1, 1, 1, 1, 1,
-1.116982, 0.8105564, -2.389624, 1, 1, 1, 1, 1,
-1.114404, -0.3436232, -0.2072939, 1, 1, 1, 1, 1,
-1.113684, -0.5193299, -1.164003, 1, 1, 1, 1, 1,
-1.113518, -1.590087, -4.257552, 1, 1, 1, 1, 1,
-1.110121, 0.6270142, -1.612843, 1, 1, 1, 1, 1,
-1.098079, 0.3986095, 1.020257, 1, 1, 1, 1, 1,
-1.087851, 0.7043316, -1.408367, 1, 1, 1, 1, 1,
-1.063813, -0.04751494, -1.345294, 1, 1, 1, 1, 1,
-1.061613, 1.450547, 0.4515314, 1, 1, 1, 1, 1,
-1.053146, 1.199681, -0.7939094, 1, 1, 1, 1, 1,
-1.049839, -2.235599, -0.5927393, 0, 0, 1, 1, 1,
-1.046917, 0.5389388, -1.445441, 1, 0, 0, 1, 1,
-1.042961, 0.5080139, -1.204247, 1, 0, 0, 1, 1,
-1.036897, -0.4994319, -2.393023, 1, 0, 0, 1, 1,
-1.027755, 0.1359468, -0.2498397, 1, 0, 0, 1, 1,
-1.026561, -0.5826163, -2.718829, 1, 0, 0, 1, 1,
-1.023548, -0.2895749, -2.963845, 0, 0, 0, 1, 1,
-1.022507, 0.1909008, -1.120494, 0, 0, 0, 1, 1,
-1.018826, 0.6606408, -0.8202134, 0, 0, 0, 1, 1,
-1.017488, 0.5210003, -0.4366904, 0, 0, 0, 1, 1,
-1.014214, 1.382718, -0.6410077, 0, 0, 0, 1, 1,
-1.013075, 0.3758781, -1.509806, 0, 0, 0, 1, 1,
-1.011302, 0.8823841, -0.8815358, 0, 0, 0, 1, 1,
-1.001482, -0.1522121, -1.12122, 1, 1, 1, 1, 1,
-0.9966969, 1.85053, -1.556875, 1, 1, 1, 1, 1,
-0.994463, -0.01929446, 0.1348014, 1, 1, 1, 1, 1,
-0.9888188, 0.3699488, -2.639672, 1, 1, 1, 1, 1,
-0.9841406, -1.420802, -4.199516, 1, 1, 1, 1, 1,
-0.9797421, 0.6707999, -1.242276, 1, 1, 1, 1, 1,
-0.9793736, 0.5139573, -0.9411085, 1, 1, 1, 1, 1,
-0.9737258, 0.5401516, -1.246034, 1, 1, 1, 1, 1,
-0.9717724, 0.08534661, -2.227003, 1, 1, 1, 1, 1,
-0.9603974, 1.916801, -0.4935758, 1, 1, 1, 1, 1,
-0.9590496, 1.06414, -0.181402, 1, 1, 1, 1, 1,
-0.9563595, 0.6945, -2.099057, 1, 1, 1, 1, 1,
-0.9542475, 0.3036531, -2.083117, 1, 1, 1, 1, 1,
-0.9527925, -1.419111, -5.04192, 1, 1, 1, 1, 1,
-0.9522267, 1.507527, -0.5294825, 1, 1, 1, 1, 1,
-0.9496059, 1.814209, -0.8821971, 0, 0, 1, 1, 1,
-0.9472685, -0.9923785, -1.829421, 1, 0, 0, 1, 1,
-0.9401439, 0.9971278, 0.3352938, 1, 0, 0, 1, 1,
-0.9373977, 0.1416479, -1.417059, 1, 0, 0, 1, 1,
-0.9323882, 0.4602712, 0.9721672, 1, 0, 0, 1, 1,
-0.9286145, -0.5338266, -3.773414, 1, 0, 0, 1, 1,
-0.9236709, -0.04324108, -1.478335, 0, 0, 0, 1, 1,
-0.9230713, -1.420485, -1.136462, 0, 0, 0, 1, 1,
-0.9220074, 0.4023589, 1.10273, 0, 0, 0, 1, 1,
-0.913807, 0.5297692, 0.1670853, 0, 0, 0, 1, 1,
-0.9083403, 1.401247, -1.372512, 0, 0, 0, 1, 1,
-0.9079365, 1.352976, -1.818484, 0, 0, 0, 1, 1,
-0.8943039, 0.6818281, 0.009458709, 0, 0, 0, 1, 1,
-0.8931776, -1.656968, -2.442482, 1, 1, 1, 1, 1,
-0.8866867, 1.663175, 1.670213, 1, 1, 1, 1, 1,
-0.8831739, -0.5067536, -2.417504, 1, 1, 1, 1, 1,
-0.8773308, 0.1562269, -2.078797, 1, 1, 1, 1, 1,
-0.8757873, -1.041945, -2.054396, 1, 1, 1, 1, 1,
-0.8713375, 0.3348495, -1.187174, 1, 1, 1, 1, 1,
-0.8600597, -0.2489836, -2.493551, 1, 1, 1, 1, 1,
-0.860028, -2.262863, -1.562907, 1, 1, 1, 1, 1,
-0.8597726, -0.1351349, -0.3628773, 1, 1, 1, 1, 1,
-0.8579761, -0.4167586, -2.392775, 1, 1, 1, 1, 1,
-0.8577623, 0.7559872, -1.555722, 1, 1, 1, 1, 1,
-0.8485781, 0.6130528, -0.5069776, 1, 1, 1, 1, 1,
-0.848287, -2.219995, -2.523365, 1, 1, 1, 1, 1,
-0.847267, 0.1621101, -2.051795, 1, 1, 1, 1, 1,
-0.8416975, 1.186988, -0.5747144, 1, 1, 1, 1, 1,
-0.8388733, 1.306888, -1.031916, 0, 0, 1, 1, 1,
-0.8324556, -1.54733, -2.677277, 1, 0, 0, 1, 1,
-0.8321874, 0.4051963, 0.3984494, 1, 0, 0, 1, 1,
-0.8291076, 0.7463748, -0.4105087, 1, 0, 0, 1, 1,
-0.8276584, -0.4573328, -2.877299, 1, 0, 0, 1, 1,
-0.8269435, -0.6969698, -3.394859, 1, 0, 0, 1, 1,
-0.8264374, -0.8079199, -3.092952, 0, 0, 0, 1, 1,
-0.8227455, -1.053226, -2.895482, 0, 0, 0, 1, 1,
-0.8175451, 1.22669, 0.8624743, 0, 0, 0, 1, 1,
-0.8156207, 2.243438, 0.518698, 0, 0, 0, 1, 1,
-0.8127127, -0.2703064, -3.043139, 0, 0, 0, 1, 1,
-0.8093613, 0.1749103, -0.4990282, 0, 0, 0, 1, 1,
-0.8083802, -1.058925, -2.123773, 0, 0, 0, 1, 1,
-0.8058802, 1.128221, -1.444886, 1, 1, 1, 1, 1,
-0.8021417, -0.5738293, -2.127322, 1, 1, 1, 1, 1,
-0.7953077, 1.105997, -0.786875, 1, 1, 1, 1, 1,
-0.7943609, 1.229164, -1.970622, 1, 1, 1, 1, 1,
-0.7876074, -0.3589468, -1.598621, 1, 1, 1, 1, 1,
-0.7853867, -1.285326, -3.248353, 1, 1, 1, 1, 1,
-0.785384, 0.0564087, 0.244479, 1, 1, 1, 1, 1,
-0.7849478, 0.713333, 1.360096, 1, 1, 1, 1, 1,
-0.7830361, -1.690535, -2.955929, 1, 1, 1, 1, 1,
-0.7774993, -1.111241, -3.07946, 1, 1, 1, 1, 1,
-0.7745798, 1.599859, -0.6077192, 1, 1, 1, 1, 1,
-0.766587, 1.836146, -0.9833587, 1, 1, 1, 1, 1,
-0.7646658, 0.001523297, 0.9914472, 1, 1, 1, 1, 1,
-0.7631273, 0.3109207, -1.443103, 1, 1, 1, 1, 1,
-0.7529703, -1.14549, -2.767917, 1, 1, 1, 1, 1,
-0.7492816, 0.4025032, -1.346166, 0, 0, 1, 1, 1,
-0.7487207, 0.522947, -0.3669934, 1, 0, 0, 1, 1,
-0.7471436, 0.3104376, -0.06947052, 1, 0, 0, 1, 1,
-0.7455122, -0.7182146, -2.406938, 1, 0, 0, 1, 1,
-0.7431037, 0.2543544, 1.57382, 1, 0, 0, 1, 1,
-0.7420301, 0.7912874, -0.7635024, 1, 0, 0, 1, 1,
-0.7418831, 0.5601488, -0.03786441, 0, 0, 0, 1, 1,
-0.7411941, 0.2966279, -0.9507262, 0, 0, 0, 1, 1,
-0.7376772, -1.049985, -1.436413, 0, 0, 0, 1, 1,
-0.737397, -0.5023315, -2.091783, 0, 0, 0, 1, 1,
-0.7259086, 0.02358761, -2.032726, 0, 0, 0, 1, 1,
-0.7240063, -0.008848641, -2.644763, 0, 0, 0, 1, 1,
-0.7179126, 1.128348, -1.284377, 0, 0, 0, 1, 1,
-0.7175314, 0.2972606, -3.846203, 1, 1, 1, 1, 1,
-0.7131239, 0.0396742, -2.429806, 1, 1, 1, 1, 1,
-0.7128039, -0.5061578, -4.381588, 1, 1, 1, 1, 1,
-0.7112976, 0.3878759, -0.1620948, 1, 1, 1, 1, 1,
-0.6961343, 1.469568, -0.2412308, 1, 1, 1, 1, 1,
-0.6955485, -0.3742853, -4.514192, 1, 1, 1, 1, 1,
-0.6913779, -1.558087, -4.953445, 1, 1, 1, 1, 1,
-0.6897134, 2.592354, -0.6397625, 1, 1, 1, 1, 1,
-0.6822472, -1.175613, -3.40119, 1, 1, 1, 1, 1,
-0.6811885, -0.2062115, -3.662518, 1, 1, 1, 1, 1,
-0.6798733, 1.28943, -1.338976, 1, 1, 1, 1, 1,
-0.6766148, -0.5364109, -2.84145, 1, 1, 1, 1, 1,
-0.6755525, 2.298604, -0.9899924, 1, 1, 1, 1, 1,
-0.668615, 1.723394, -1.039051, 1, 1, 1, 1, 1,
-0.6670759, -0.6538149, -3.853156, 1, 1, 1, 1, 1,
-0.6644548, 0.8748828, -1.598852, 0, 0, 1, 1, 1,
-0.6612727, -0.6685394, -0.6636508, 1, 0, 0, 1, 1,
-0.6577656, -0.7558123, -2.278664, 1, 0, 0, 1, 1,
-0.6530685, -0.6490023, -1.555275, 1, 0, 0, 1, 1,
-0.6510533, 1.430601, -0.447304, 1, 0, 0, 1, 1,
-0.6505067, -0.3984601, -2.84741, 1, 0, 0, 1, 1,
-0.6461898, -1.223615, -1.687041, 0, 0, 0, 1, 1,
-0.645193, 0.07132953, -1.256744, 0, 0, 0, 1, 1,
-0.6328517, 0.4073429, -0.05413675, 0, 0, 0, 1, 1,
-0.6210689, 1.576072, -0.9087729, 0, 0, 0, 1, 1,
-0.615511, 0.1454162, -1.365282, 0, 0, 0, 1, 1,
-0.6133633, -0.2758337, -2.520223, 0, 0, 0, 1, 1,
-0.6106633, -1.088551, -3.558942, 0, 0, 0, 1, 1,
-0.6056617, 0.6069247, -0.8416722, 1, 1, 1, 1, 1,
-0.6025191, -0.1398456, -2.192854, 1, 1, 1, 1, 1,
-0.6024717, 0.1557996, -0.4746588, 1, 1, 1, 1, 1,
-0.6008819, -0.7471926, -0.9393769, 1, 1, 1, 1, 1,
-0.5981633, 1.094352, -1.076961, 1, 1, 1, 1, 1,
-0.5976744, -0.7195936, -2.838135, 1, 1, 1, 1, 1,
-0.5943903, 0.2198739, -1.772404, 1, 1, 1, 1, 1,
-0.5927035, -1.386544, -3.706469, 1, 1, 1, 1, 1,
-0.5801067, 1.290378, -0.5053955, 1, 1, 1, 1, 1,
-0.5788328, -1.687979, -2.64304, 1, 1, 1, 1, 1,
-0.5776299, -0.5237178, -4.56285, 1, 1, 1, 1, 1,
-0.5739855, 0.01491901, -0.817628, 1, 1, 1, 1, 1,
-0.5697061, 0.01832683, -2.632874, 1, 1, 1, 1, 1,
-0.5669299, -0.7711071, -4.283454, 1, 1, 1, 1, 1,
-0.5650258, -1.37798, -3.366965, 1, 1, 1, 1, 1,
-0.5640856, 0.620876, -0.6831053, 0, 0, 1, 1, 1,
-0.5638167, 0.8522151, -0.1437251, 1, 0, 0, 1, 1,
-0.5605178, 0.3871275, -1.026196, 1, 0, 0, 1, 1,
-0.5596512, -1.031647, -1.234455, 1, 0, 0, 1, 1,
-0.5583966, 0.7317656, 0.2053244, 1, 0, 0, 1, 1,
-0.5569195, -2.200313, -3.350589, 1, 0, 0, 1, 1,
-0.5556925, -2.954345, -1.728774, 0, 0, 0, 1, 1,
-0.5544488, -0.05058985, -2.997511, 0, 0, 0, 1, 1,
-0.5541597, -1.705084, -3.006773, 0, 0, 0, 1, 1,
-0.551505, -0.9786355, -2.856126, 0, 0, 0, 1, 1,
-0.5441353, 0.5189292, -1.17867, 0, 0, 0, 1, 1,
-0.5436631, -1.452979, -2.810071, 0, 0, 0, 1, 1,
-0.5429674, 0.673183, -0.3976424, 0, 0, 0, 1, 1,
-0.5413908, 0.8492225, 0.145806, 1, 1, 1, 1, 1,
-0.5368186, 2.141573, 0.7082437, 1, 1, 1, 1, 1,
-0.5352694, -1.069467, -1.748961, 1, 1, 1, 1, 1,
-0.5349803, 1.427263, -0.5256198, 1, 1, 1, 1, 1,
-0.5329782, -0.3639902, -1.354163, 1, 1, 1, 1, 1,
-0.5322651, -0.176975, -2.597619, 1, 1, 1, 1, 1,
-0.5304097, -0.6857534, -1.138478, 1, 1, 1, 1, 1,
-0.5296561, -1.291365, -4.874784, 1, 1, 1, 1, 1,
-0.5276932, 1.04422, -1.652648, 1, 1, 1, 1, 1,
-0.5256057, -1.707747, -2.404693, 1, 1, 1, 1, 1,
-0.5244727, 0.03383286, -1.350506, 1, 1, 1, 1, 1,
-0.5233307, 1.195319, 0.08904076, 1, 1, 1, 1, 1,
-0.522015, 1.180358, -0.2429158, 1, 1, 1, 1, 1,
-0.5173525, 0.1289565, -0.7002717, 1, 1, 1, 1, 1,
-0.5082594, -0.1121663, -1.506101, 1, 1, 1, 1, 1,
-0.5075634, 0.2027134, -0.847099, 0, 0, 1, 1, 1,
-0.5065567, -0.9874201, -1.441633, 1, 0, 0, 1, 1,
-0.5052496, -1.096901, -1.508022, 1, 0, 0, 1, 1,
-0.4995444, 0.9602662, -0.4008549, 1, 0, 0, 1, 1,
-0.4956603, 0.6185456, -0.7971578, 1, 0, 0, 1, 1,
-0.4952653, -0.7240344, -2.41421, 1, 0, 0, 1, 1,
-0.4825452, 0.6937226, 1.150774, 0, 0, 0, 1, 1,
-0.4774585, -0.0331709, -1.934406, 0, 0, 0, 1, 1,
-0.4712151, -1.367699, -3.122841, 0, 0, 0, 1, 1,
-0.4652303, -0.2627485, -1.323823, 0, 0, 0, 1, 1,
-0.4652166, -1.676523, -1.498253, 0, 0, 0, 1, 1,
-0.4597594, -0.8395284, -3.778088, 0, 0, 0, 1, 1,
-0.4558999, -1.712904, -3.834369, 0, 0, 0, 1, 1,
-0.4555413, 0.6988256, 0.7325952, 1, 1, 1, 1, 1,
-0.4543072, 0.3320595, -0.3146148, 1, 1, 1, 1, 1,
-0.4538066, -2.168736, -2.117152, 1, 1, 1, 1, 1,
-0.4523677, 0.2599271, -0.5219846, 1, 1, 1, 1, 1,
-0.4507891, 0.04372312, -0.3794924, 1, 1, 1, 1, 1,
-0.4493734, 0.08171878, -1.138284, 1, 1, 1, 1, 1,
-0.4483825, -0.2615252, -1.211032, 1, 1, 1, 1, 1,
-0.4480307, -0.171572, -1.545538, 1, 1, 1, 1, 1,
-0.4474829, -0.7647183, -4.108809, 1, 1, 1, 1, 1,
-0.4446087, 0.128079, -2.117461, 1, 1, 1, 1, 1,
-0.4438432, 1.461839, 0.487494, 1, 1, 1, 1, 1,
-0.4419582, -1.172404, -1.254887, 1, 1, 1, 1, 1,
-0.4401342, -1.224621, -2.588077, 1, 1, 1, 1, 1,
-0.4387316, 1.259189, 0.6172312, 1, 1, 1, 1, 1,
-0.4294287, 0.8428972, -0.2986673, 1, 1, 1, 1, 1,
-0.4226811, -1.058977, -4.275411, 0, 0, 1, 1, 1,
-0.4225478, 0.4991018, -0.5276859, 1, 0, 0, 1, 1,
-0.4171736, 0.09407338, -1.337155, 1, 0, 0, 1, 1,
-0.4088356, -1.148029, -3.65039, 1, 0, 0, 1, 1,
-0.4067421, -0.3118187, -1.649678, 1, 0, 0, 1, 1,
-0.4009524, -0.7178489, -0.02688026, 1, 0, 0, 1, 1,
-0.4004291, -0.7113499, -3.088691, 0, 0, 0, 1, 1,
-0.3979349, -0.2335062, -3.507872, 0, 0, 0, 1, 1,
-0.3956289, 0.2330006, -0.1024326, 0, 0, 0, 1, 1,
-0.3934955, -0.3755444, -0.1843864, 0, 0, 0, 1, 1,
-0.3926078, -0.1295028, -0.7410729, 0, 0, 0, 1, 1,
-0.3921515, 0.7085686, 0.5491989, 0, 0, 0, 1, 1,
-0.387538, -1.157091, -2.135256, 0, 0, 0, 1, 1,
-0.3870884, 0.7458193, -1.46332, 1, 1, 1, 1, 1,
-0.3808809, 0.7967396, -2.617365, 1, 1, 1, 1, 1,
-0.3786869, -1.611823, -3.329065, 1, 1, 1, 1, 1,
-0.377934, -0.109987, -1.774282, 1, 1, 1, 1, 1,
-0.3713921, 0.8449839, -0.7294067, 1, 1, 1, 1, 1,
-0.3683262, -0.241123, -1.857362, 1, 1, 1, 1, 1,
-0.3675871, 0.7121097, -0.3522668, 1, 1, 1, 1, 1,
-0.3661849, 0.7415925, -0.2376454, 1, 1, 1, 1, 1,
-0.3658598, -1.03696, -4.391637, 1, 1, 1, 1, 1,
-0.3643686, -0.4759511, -1.463799, 1, 1, 1, 1, 1,
-0.3603774, -0.09773186, -2.258751, 1, 1, 1, 1, 1,
-0.3588888, 1.145193, -0.7988613, 1, 1, 1, 1, 1,
-0.3577881, 0.02002498, -3.114866, 1, 1, 1, 1, 1,
-0.3540404, 0.9157475, -0.4383242, 1, 1, 1, 1, 1,
-0.3526284, 0.6179872, -0.2682651, 1, 1, 1, 1, 1,
-0.3513087, 0.8873876, -1.366809, 0, 0, 1, 1, 1,
-0.3481406, 0.5488391, -0.2079684, 1, 0, 0, 1, 1,
-0.3459527, 1.659434, -1.594452, 1, 0, 0, 1, 1,
-0.338722, -0.1057171, -2.100732, 1, 0, 0, 1, 1,
-0.3268094, 0.5048012, -0.1465313, 1, 0, 0, 1, 1,
-0.3228919, -0.668909, -2.769971, 1, 0, 0, 1, 1,
-0.3228171, -1.236713, -5.205958, 0, 0, 0, 1, 1,
-0.3226494, -0.2322761, -0.3733393, 0, 0, 0, 1, 1,
-0.3205654, 0.623391, 1.554621, 0, 0, 0, 1, 1,
-0.3142913, -2.548865, -3.626601, 0, 0, 0, 1, 1,
-0.3128873, 0.08904583, -2.129401, 0, 0, 0, 1, 1,
-0.3115154, -1.528902, -2.282447, 0, 0, 0, 1, 1,
-0.310266, -1.86122, -2.04986, 0, 0, 0, 1, 1,
-0.3066365, -0.4721822, -2.239383, 1, 1, 1, 1, 1,
-0.2989831, -0.8198866, -3.214552, 1, 1, 1, 1, 1,
-0.2984136, 1.387338, -0.6335438, 1, 1, 1, 1, 1,
-0.2939599, 0.5779, -1.115558, 1, 1, 1, 1, 1,
-0.2871853, -1.093949, -3.619124, 1, 1, 1, 1, 1,
-0.2844606, 0.6449314, 0.8159772, 1, 1, 1, 1, 1,
-0.2803202, 1.132761, 1.149369, 1, 1, 1, 1, 1,
-0.2802166, -1.191142, -1.184255, 1, 1, 1, 1, 1,
-0.2795601, 1.265977, -0.09862871, 1, 1, 1, 1, 1,
-0.2779483, -1.221271, -2.931769, 1, 1, 1, 1, 1,
-0.2762986, -1.425287, -2.141673, 1, 1, 1, 1, 1,
-0.2719569, -0.9452207, -4.251879, 1, 1, 1, 1, 1,
-0.2685085, 1.35586, 0.622845, 1, 1, 1, 1, 1,
-0.2665271, -1.138626, -2.516924, 1, 1, 1, 1, 1,
-0.2656222, 1.38865, -0.4068572, 1, 1, 1, 1, 1,
-0.2650889, -1.052168, -1.848731, 0, 0, 1, 1, 1,
-0.2625301, -0.04408394, -3.151034, 1, 0, 0, 1, 1,
-0.2574581, -0.03056815, -3.459862, 1, 0, 0, 1, 1,
-0.2540431, -1.151857, -3.667026, 1, 0, 0, 1, 1,
-0.2526237, 0.550835, -1.916792, 1, 0, 0, 1, 1,
-0.2498171, 1.291592, 0.4603146, 1, 0, 0, 1, 1,
-0.2393428, -0.334362, -2.799259, 0, 0, 0, 1, 1,
-0.2383193, 0.8778476, -1.479326, 0, 0, 0, 1, 1,
-0.236946, 0.5030513, -0.6691084, 0, 0, 0, 1, 1,
-0.2358265, -0.8594909, -3.707709, 0, 0, 0, 1, 1,
-0.231178, -0.1195033, -3.318364, 0, 0, 0, 1, 1,
-0.2295249, 0.9412135, -0.2928968, 0, 0, 0, 1, 1,
-0.2290018, -0.5212686, -3.732104, 0, 0, 0, 1, 1,
-0.2277548, 0.6966648, -0.1236023, 1, 1, 1, 1, 1,
-0.2265371, -0.2229495, -2.852621, 1, 1, 1, 1, 1,
-0.2258623, -1.197489, -2.965746, 1, 1, 1, 1, 1,
-0.225712, 1.639519, -0.9987304, 1, 1, 1, 1, 1,
-0.2220128, -1.632045, -4.380834, 1, 1, 1, 1, 1,
-0.2212116, 1.300459, -1.796379, 1, 1, 1, 1, 1,
-0.2174079, -1.008051, -3.455184, 1, 1, 1, 1, 1,
-0.2173803, -0.4839963, -2.402634, 1, 1, 1, 1, 1,
-0.2118564, 1.219734, -0.1139484, 1, 1, 1, 1, 1,
-0.2083303, 0.02180359, -0.7301974, 1, 1, 1, 1, 1,
-0.2049558, 0.807026, 0.2075271, 1, 1, 1, 1, 1,
-0.1934164, 1.24904, -0.2522059, 1, 1, 1, 1, 1,
-0.193383, 1.105191, -0.8403506, 1, 1, 1, 1, 1,
-0.1920356, 1.395505, 0.001008422, 1, 1, 1, 1, 1,
-0.191848, 0.7822813, -1.22901, 1, 1, 1, 1, 1,
-0.1915905, -0.004585816, -0.2076522, 0, 0, 1, 1, 1,
-0.1819131, 1.903388, -0.20203, 1, 0, 0, 1, 1,
-0.1815351, -0.258622, -2.189415, 1, 0, 0, 1, 1,
-0.1783868, 1.282685, 3.121325, 1, 0, 0, 1, 1,
-0.1781963, -0.03414046, -2.410823, 1, 0, 0, 1, 1,
-0.1780319, -1.136591, -4.0018, 1, 0, 0, 1, 1,
-0.171478, -1.265438, -3.905464, 0, 0, 0, 1, 1,
-0.1696495, 0.05192144, 0.3184575, 0, 0, 0, 1, 1,
-0.1637917, -2.001181, -3.363743, 0, 0, 0, 1, 1,
-0.1626497, -1.757197, -2.611453, 0, 0, 0, 1, 1,
-0.1570036, -0.2671513, -2.309322, 0, 0, 0, 1, 1,
-0.1546221, 0.4144378, -1.174502, 0, 0, 0, 1, 1,
-0.1519016, -1.059117, -3.911764, 0, 0, 0, 1, 1,
-0.1518048, -0.6388565, -2.641093, 1, 1, 1, 1, 1,
-0.1446031, -1.830246, -3.204677, 1, 1, 1, 1, 1,
-0.1421954, -1.241756, -2.461033, 1, 1, 1, 1, 1,
-0.1419632, -1.847648, -3.420426, 1, 1, 1, 1, 1,
-0.1400509, 0.2096685, -2.218762, 1, 1, 1, 1, 1,
-0.1396968, 1.770491, 0.06767549, 1, 1, 1, 1, 1,
-0.1343881, 0.7215928, 1.649921, 1, 1, 1, 1, 1,
-0.1257012, 0.7107797, -0.09032189, 1, 1, 1, 1, 1,
-0.1233032, 1.727315, 1.410977, 1, 1, 1, 1, 1,
-0.1222854, 0.08124909, -1.861472, 1, 1, 1, 1, 1,
-0.1203956, -0.2165688, -2.15888, 1, 1, 1, 1, 1,
-0.1153569, 0.3760623, -2.529073, 1, 1, 1, 1, 1,
-0.1141118, 0.3305217, -0.7736448, 1, 1, 1, 1, 1,
-0.1126962, -0.3560119, -1.439261, 1, 1, 1, 1, 1,
-0.1121352, -0.2629887, -2.799232, 1, 1, 1, 1, 1,
-0.1116655, 0.7145066, 0.500567, 0, 0, 1, 1, 1,
-0.1074788, -1.189486, -3.511253, 1, 0, 0, 1, 1,
-0.1050663, -0.466166, -3.495059, 1, 0, 0, 1, 1,
-0.1026749, -0.611746, -3.979147, 1, 0, 0, 1, 1,
-0.1021715, 0.08499598, -1.977388, 1, 0, 0, 1, 1,
-0.09118497, -0.3045855, -2.675517, 1, 0, 0, 1, 1,
-0.09042211, -2.708564, -2.749205, 0, 0, 0, 1, 1,
-0.08949439, 0.5937217, -0.9561922, 0, 0, 0, 1, 1,
-0.08917674, 0.5924518, -0.5711058, 0, 0, 0, 1, 1,
-0.08248299, 0.3828671, -0.3583908, 0, 0, 0, 1, 1,
-0.08041536, 1.037415, -0.1561151, 0, 0, 0, 1, 1,
-0.07667895, 0.5196778, -0.1832653, 0, 0, 0, 1, 1,
-0.07184201, 1.56673, 1.354988, 0, 0, 0, 1, 1,
-0.0718317, 0.1542298, 1.412788, 1, 1, 1, 1, 1,
-0.07041175, 1.364709, -0.4255997, 1, 1, 1, 1, 1,
-0.06469712, 0.7267556, -0.6783742, 1, 1, 1, 1, 1,
-0.05881408, 0.1080781, -0.1090412, 1, 1, 1, 1, 1,
-0.05767941, 0.2819434, -1.494609, 1, 1, 1, 1, 1,
-0.05741959, 0.6786387, -0.3813363, 1, 1, 1, 1, 1,
-0.05630714, -0.5013693, -3.126834, 1, 1, 1, 1, 1,
-0.05520933, 0.6241308, 1.527816, 1, 1, 1, 1, 1,
-0.05339246, -0.6814902, -2.180219, 1, 1, 1, 1, 1,
-0.05063804, 1.447597, -0.7527598, 1, 1, 1, 1, 1,
-0.04834914, -1.404173, -1.65152, 1, 1, 1, 1, 1,
-0.04604832, -0.2119016, -4.208034, 1, 1, 1, 1, 1,
-0.04440158, -0.4301811, -2.14421, 1, 1, 1, 1, 1,
-0.04419781, -0.2355683, -3.348052, 1, 1, 1, 1, 1,
-0.04309959, -1.139836, -3.345761, 1, 1, 1, 1, 1,
-0.03455403, 2.414501, -0.2210548, 0, 0, 1, 1, 1,
-0.03201154, 1.418758, -0.06383126, 1, 0, 0, 1, 1,
-0.03165259, -0.5908388, -3.043763, 1, 0, 0, 1, 1,
-0.0308331, 0.3713895, -0.7381526, 1, 0, 0, 1, 1,
-0.02943969, -0.3375649, -2.722091, 1, 0, 0, 1, 1,
-0.02809136, 0.8750687, -0.148476, 1, 0, 0, 1, 1,
-0.02581693, 0.594999, 1.241224, 0, 0, 0, 1, 1,
-0.02069424, 1.101182, 1.161134, 0, 0, 0, 1, 1,
-0.01957008, -0.04109152, -1.419675, 0, 0, 0, 1, 1,
-0.01924616, -0.5629101, -3.914127, 0, 0, 0, 1, 1,
-0.01489731, 1.401258, -0.07833291, 0, 0, 0, 1, 1,
-0.01469867, -0.7063255, -4.90597, 0, 0, 0, 1, 1,
-0.01304682, 1.41229, -1.127887, 0, 0, 0, 1, 1,
-0.007748998, -1.528375, -5.047451, 1, 1, 1, 1, 1,
-0.005898672, -1.249477, -3.284938, 1, 1, 1, 1, 1,
-0.001595793, 0.07183058, 1.472059, 1, 1, 1, 1, 1,
0.0009689605, -0.7843165, 4.085987, 1, 1, 1, 1, 1,
0.002963881, -0.658353, 3.719915, 1, 1, 1, 1, 1,
0.004212548, 0.4279548, -0.5561447, 1, 1, 1, 1, 1,
0.01105331, 0.9987814, -0.08286233, 1, 1, 1, 1, 1,
0.01393957, 0.7094537, -0.4332994, 1, 1, 1, 1, 1,
0.02041672, -0.3816299, 2.49788, 1, 1, 1, 1, 1,
0.02499709, -0.5772552, 2.99666, 1, 1, 1, 1, 1,
0.02810111, -0.8562978, 3.741593, 1, 1, 1, 1, 1,
0.02900055, -0.8212921, 4.533709, 1, 1, 1, 1, 1,
0.03709188, -0.4677788, 2.607484, 1, 1, 1, 1, 1,
0.03852984, 0.6174476, -1.657004, 1, 1, 1, 1, 1,
0.03999071, 0.3485554, 1.263482, 1, 1, 1, 1, 1,
0.04003384, -1.726352, 3.367932, 0, 0, 1, 1, 1,
0.04173146, -0.1691074, 3.37965, 1, 0, 0, 1, 1,
0.04316231, 0.5462192, 1.415598, 1, 0, 0, 1, 1,
0.04588027, 0.7261845, 1.230398, 1, 0, 0, 1, 1,
0.04744137, -0.3443083, 3.809667, 1, 0, 0, 1, 1,
0.04856468, -0.4373535, 1.762693, 1, 0, 0, 1, 1,
0.04919001, 0.2068407, -1.531146, 0, 0, 0, 1, 1,
0.0510506, -0.3474194, 3.06794, 0, 0, 0, 1, 1,
0.05111257, -0.2195369, 2.848846, 0, 0, 0, 1, 1,
0.05285407, -0.007367508, 3.75242, 0, 0, 0, 1, 1,
0.0560181, 0.6180488, -1.023265, 0, 0, 0, 1, 1,
0.05651263, -1.486576, 3.457244, 0, 0, 0, 1, 1,
0.05654978, -0.2044438, 3.509806, 0, 0, 0, 1, 1,
0.05809634, 0.4477722, -0.5826867, 1, 1, 1, 1, 1,
0.06177283, -1.039566, 3.34752, 1, 1, 1, 1, 1,
0.06299597, -1.264729, 1.219851, 1, 1, 1, 1, 1,
0.06396729, -0.06288963, 1.857549, 1, 1, 1, 1, 1,
0.06411842, -1.012603, 3.331925, 1, 1, 1, 1, 1,
0.06767543, -0.8334398, 3.703276, 1, 1, 1, 1, 1,
0.06967782, 2.020009, 1.668182, 1, 1, 1, 1, 1,
0.07078431, -0.4322777, 2.381747, 1, 1, 1, 1, 1,
0.07460566, 1.115998, -0.6425382, 1, 1, 1, 1, 1,
0.07517932, -0.7962496, 4.262857, 1, 1, 1, 1, 1,
0.07677901, 0.3319933, 0.5306446, 1, 1, 1, 1, 1,
0.08161919, 0.6627454, 0.03347354, 1, 1, 1, 1, 1,
0.08191143, 1.620488, -0.9026937, 1, 1, 1, 1, 1,
0.08535041, 1.072008, 0.2709005, 1, 1, 1, 1, 1,
0.08961843, -0.6491021, 2.669362, 1, 1, 1, 1, 1,
0.09286101, 0.6470259, 1.440102, 0, 0, 1, 1, 1,
0.09331208, -0.7800638, 2.305541, 1, 0, 0, 1, 1,
0.09383556, -2.164069, 1.384274, 1, 0, 0, 1, 1,
0.09679577, -0.8542807, 1.641863, 1, 0, 0, 1, 1,
0.1032981, -1.193891, 2.195387, 1, 0, 0, 1, 1,
0.1058118, -0.6151338, 4.005511, 1, 0, 0, 1, 1,
0.1083718, -0.679999, 3.172056, 0, 0, 0, 1, 1,
0.1132609, -0.4954537, 2.443438, 0, 0, 0, 1, 1,
0.1143777, 0.2183505, 0.4152795, 0, 0, 0, 1, 1,
0.1144077, 1.192333, 0.5494798, 0, 0, 0, 1, 1,
0.1178155, -0.351061, 4.376646, 0, 0, 0, 1, 1,
0.1189506, 0.9598882, -1.708474, 0, 0, 0, 1, 1,
0.1235257, 1.522139, 0.1044652, 0, 0, 0, 1, 1,
0.1256666, 1.002284, -0.2416919, 1, 1, 1, 1, 1,
0.1268547, 0.5682474, -0.03028671, 1, 1, 1, 1, 1,
0.1283995, 0.01675294, 2.55916, 1, 1, 1, 1, 1,
0.1328594, -2.021159, 1.972409, 1, 1, 1, 1, 1,
0.1335355, -1.053709, 3.237159, 1, 1, 1, 1, 1,
0.1455702, -0.2536045, 2.692133, 1, 1, 1, 1, 1,
0.1505785, -1.355541, 2.416482, 1, 1, 1, 1, 1,
0.154801, -1.689632, 3.539144, 1, 1, 1, 1, 1,
0.1553932, 1.701778, 0.752699, 1, 1, 1, 1, 1,
0.1577098, 0.4423275, 0.3665684, 1, 1, 1, 1, 1,
0.1583109, 1.824386, 1.521629, 1, 1, 1, 1, 1,
0.1605098, -0.5834656, 2.894693, 1, 1, 1, 1, 1,
0.1623198, -0.0715056, 0.3205336, 1, 1, 1, 1, 1,
0.1631915, -0.07656733, 1.510563, 1, 1, 1, 1, 1,
0.1662236, 0.5225246, 1.326202, 1, 1, 1, 1, 1,
0.1666798, 0.4520781, -0.02977207, 0, 0, 1, 1, 1,
0.1670859, 0.01708522, 2.750315, 1, 0, 0, 1, 1,
0.1686063, -0.3220651, 2.215258, 1, 0, 0, 1, 1,
0.1695459, 0.9831673, 1.109883, 1, 0, 0, 1, 1,
0.1773292, -0.3338432, 2.777364, 1, 0, 0, 1, 1,
0.1809493, -0.9974666, 3.594179, 1, 0, 0, 1, 1,
0.1811948, -0.09188585, 0.5173156, 0, 0, 0, 1, 1,
0.1856362, 2.375844, -0.1981768, 0, 0, 0, 1, 1,
0.1893692, -0.05609992, 1.812376, 0, 0, 0, 1, 1,
0.1926367, 0.1340666, 0.3655939, 0, 0, 0, 1, 1,
0.1932936, -0.230947, 1.298458, 0, 0, 0, 1, 1,
0.1970603, -1.365291, 4.415651, 0, 0, 0, 1, 1,
0.1989793, -1.071417, 3.335903, 0, 0, 0, 1, 1,
0.201566, 0.7257501, -3.574244, 1, 1, 1, 1, 1,
0.2039775, 0.2817707, 1.192607, 1, 1, 1, 1, 1,
0.2046854, -0.162471, 1.970614, 1, 1, 1, 1, 1,
0.2068675, 1.442569, -0.2041663, 1, 1, 1, 1, 1,
0.2129872, -0.0522651, 1.062337, 1, 1, 1, 1, 1,
0.215349, -0.9019895, 2.230062, 1, 1, 1, 1, 1,
0.2162233, -0.7342215, 1.16399, 1, 1, 1, 1, 1,
0.2172964, 1.198891, 0.3675537, 1, 1, 1, 1, 1,
0.2229245, -0.6834719, 3.633675, 1, 1, 1, 1, 1,
0.2247377, -0.6726713, 2.750659, 1, 1, 1, 1, 1,
0.2261228, -1.93833, 3.769648, 1, 1, 1, 1, 1,
0.2298456, -0.5187799, 2.789721, 1, 1, 1, 1, 1,
0.2298879, -1.458857, 2.681903, 1, 1, 1, 1, 1,
0.2300875, 1.114853, 1.405442, 1, 1, 1, 1, 1,
0.2316386, -0.05876059, 1.701729, 1, 1, 1, 1, 1,
0.2337359, 1.421977, 0.2140865, 0, 0, 1, 1, 1,
0.2343654, -0.560493, 4.684621, 1, 0, 0, 1, 1,
0.2343657, 0.6393849, -0.955005, 1, 0, 0, 1, 1,
0.2376725, 1.677335, -0.775013, 1, 0, 0, 1, 1,
0.2412566, -0.08842266, 2.854726, 1, 0, 0, 1, 1,
0.2433999, 0.4840171, 2.175294, 1, 0, 0, 1, 1,
0.2475328, 0.3092874, -0.3733566, 0, 0, 0, 1, 1,
0.2502198, -0.8226056, 1.734776, 0, 0, 0, 1, 1,
0.2515883, -0.4871361, 2.035551, 0, 0, 0, 1, 1,
0.2563249, -0.4139241, 2.720359, 0, 0, 0, 1, 1,
0.2591463, -0.8815775, 1.336551, 0, 0, 0, 1, 1,
0.266534, 0.08018602, 1.562383, 0, 0, 0, 1, 1,
0.2673644, 0.8754395, 0.7720547, 0, 0, 0, 1, 1,
0.2726771, -1.040081, 2.373526, 1, 1, 1, 1, 1,
0.2727152, -2.849855, 3.330789, 1, 1, 1, 1, 1,
0.2794836, -0.8963466, 1.489372, 1, 1, 1, 1, 1,
0.2799937, -0.4921827, 2.972757, 1, 1, 1, 1, 1,
0.2838659, -2.502891, 1.688919, 1, 1, 1, 1, 1,
0.2842588, 0.3460108, 0.4495906, 1, 1, 1, 1, 1,
0.2868824, 0.3967402, 0.2714339, 1, 1, 1, 1, 1,
0.2920718, -0.9052286, 1.951605, 1, 1, 1, 1, 1,
0.2929984, 1.083426, 0.344912, 1, 1, 1, 1, 1,
0.2962256, 2.616519, -0.5807223, 1, 1, 1, 1, 1,
0.2984664, 0.1762692, 0.6963663, 1, 1, 1, 1, 1,
0.3001786, 0.2714428, 2.692497, 1, 1, 1, 1, 1,
0.3029388, 0.9521296, -0.1413881, 1, 1, 1, 1, 1,
0.3029587, -1.359911, 2.847856, 1, 1, 1, 1, 1,
0.3033816, -0.3872176, 2.342647, 1, 1, 1, 1, 1,
0.3053065, 0.3584148, 0.4935436, 0, 0, 1, 1, 1,
0.3067987, -0.2242725, 1.580453, 1, 0, 0, 1, 1,
0.3125679, -0.6190662, 2.752704, 1, 0, 0, 1, 1,
0.3195483, -0.8424066, 3.364796, 1, 0, 0, 1, 1,
0.3219539, -1.393936, 3.178577, 1, 0, 0, 1, 1,
0.3231964, -0.6519839, 2.902966, 1, 0, 0, 1, 1,
0.3259916, 0.5708496, 0.9587108, 0, 0, 0, 1, 1,
0.3271593, -0.8156548, 5.460583, 0, 0, 0, 1, 1,
0.327714, 0.06798681, 1.909983, 0, 0, 0, 1, 1,
0.3329105, -0.05461516, 1.304659, 0, 0, 0, 1, 1,
0.336419, -0.4518661, 3.39551, 0, 0, 0, 1, 1,
0.3369698, 0.598488, 0.8680522, 0, 0, 0, 1, 1,
0.3386821, -0.2320688, 2.244323, 0, 0, 0, 1, 1,
0.3396246, 1.644285, 0.05678936, 1, 1, 1, 1, 1,
0.3399443, 0.02860141, 2.093523, 1, 1, 1, 1, 1,
0.3522627, -0.7922827, 2.174486, 1, 1, 1, 1, 1,
0.352761, -1.531111, 3.599121, 1, 1, 1, 1, 1,
0.3557451, -0.1826848, 1.604135, 1, 1, 1, 1, 1,
0.3575472, 0.0632794, 1.901963, 1, 1, 1, 1, 1,
0.3580999, 0.1479726, 1.782549, 1, 1, 1, 1, 1,
0.3590533, -1.13836, 1.209801, 1, 1, 1, 1, 1,
0.3591264, 0.02386328, 2.33653, 1, 1, 1, 1, 1,
0.3598205, 1.968047, 1.50502, 1, 1, 1, 1, 1,
0.3641199, 0.3668936, 2.111796, 1, 1, 1, 1, 1,
0.3647904, 0.7098212, 0.6658084, 1, 1, 1, 1, 1,
0.3713996, -0.3573358, 2.441336, 1, 1, 1, 1, 1,
0.3741518, -0.5571864, 1.951107, 1, 1, 1, 1, 1,
0.3746935, 0.551991, -0.2631865, 1, 1, 1, 1, 1,
0.3748326, -0.1275235, 0.2679488, 0, 0, 1, 1, 1,
0.3825859, -1.237393, 1.710649, 1, 0, 0, 1, 1,
0.3837353, -1.947453, 4.883165, 1, 0, 0, 1, 1,
0.3907046, -0.1580284, 2.062068, 1, 0, 0, 1, 1,
0.3942183, 0.009210154, 0.1721526, 1, 0, 0, 1, 1,
0.3945338, 0.1898521, 0.3194629, 1, 0, 0, 1, 1,
0.3947931, -0.7786792, 3.164176, 0, 0, 0, 1, 1,
0.3951125, -0.6095343, 2.422035, 0, 0, 0, 1, 1,
0.4000438, 1.355784, -0.03922732, 0, 0, 0, 1, 1,
0.4039766, 0.95529, 0.5707754, 0, 0, 0, 1, 1,
0.4058712, 0.9157885, 0.463755, 0, 0, 0, 1, 1,
0.4091879, -0.9753022, 2.69136, 0, 0, 0, 1, 1,
0.4096848, -1.972525, 3.130647, 0, 0, 0, 1, 1,
0.416587, 1.40732, -0.1766762, 1, 1, 1, 1, 1,
0.4204151, 1.013563, -0.4690883, 1, 1, 1, 1, 1,
0.4212666, 1.175322, 0.8340035, 1, 1, 1, 1, 1,
0.4224274, -0.8449184, 2.594063, 1, 1, 1, 1, 1,
0.4229915, -0.7603037, 2.693724, 1, 1, 1, 1, 1,
0.4231542, -0.9729821, 3.017622, 1, 1, 1, 1, 1,
0.4231681, 0.1857292, 3.526788, 1, 1, 1, 1, 1,
0.4232899, 0.3310306, 2.769633, 1, 1, 1, 1, 1,
0.4321618, -0.1464, -0.1683125, 1, 1, 1, 1, 1,
0.4346832, 0.7653923, 1.212257, 1, 1, 1, 1, 1,
0.4370621, -0.6226107, 1.395742, 1, 1, 1, 1, 1,
0.4376994, 0.118348, 1.716432, 1, 1, 1, 1, 1,
0.4448, 0.2531762, 0.3552456, 1, 1, 1, 1, 1,
0.4460185, 0.5200308, 3.751409, 1, 1, 1, 1, 1,
0.447821, -0.1980854, 2.09066, 1, 1, 1, 1, 1,
0.4522876, -0.380589, 1.101288, 0, 0, 1, 1, 1,
0.4536936, -0.2496769, 2.633724, 1, 0, 0, 1, 1,
0.4556793, -0.507279, 0.6432005, 1, 0, 0, 1, 1,
0.4562673, -0.9094083, 3.05153, 1, 0, 0, 1, 1,
0.4586787, 0.1236761, 1.583798, 1, 0, 0, 1, 1,
0.4602564, 0.00750728, 3.041483, 1, 0, 0, 1, 1,
0.4635623, -0.1624216, 2.733767, 0, 0, 0, 1, 1,
0.4704953, 0.06652725, 2.487532, 0, 0, 0, 1, 1,
0.4718829, 0.3814796, -0.4268588, 0, 0, 0, 1, 1,
0.4726125, 0.08810255, 0.8291117, 0, 0, 0, 1, 1,
0.475574, 0.2810461, 1.704166, 0, 0, 0, 1, 1,
0.4769543, 0.4810024, 1.202273, 0, 0, 0, 1, 1,
0.4872799, -0.5018893, 1.875956, 0, 0, 0, 1, 1,
0.48838, 0.5641339, 2.268492, 1, 1, 1, 1, 1,
0.4896285, 0.83969, 0.3530309, 1, 1, 1, 1, 1,
0.4900876, 1.591687, 1.056141, 1, 1, 1, 1, 1,
0.4951988, 1.426207, -0.7123665, 1, 1, 1, 1, 1,
0.497033, 0.3873622, -0.2792851, 1, 1, 1, 1, 1,
0.5039953, -0.007639441, 2.419361, 1, 1, 1, 1, 1,
0.5042839, 0.879388, 0.4471086, 1, 1, 1, 1, 1,
0.509186, 0.4599602, 2.299615, 1, 1, 1, 1, 1,
0.5100565, -0.7217469, 2.043092, 1, 1, 1, 1, 1,
0.5129182, 0.7091809, 1.660828, 1, 1, 1, 1, 1,
0.5188113, -0.04993831, 0.6535538, 1, 1, 1, 1, 1,
0.5279016, -0.08665033, 0.8954453, 1, 1, 1, 1, 1,
0.529882, 0.3738721, 1.26785, 1, 1, 1, 1, 1,
0.5300793, -0.4483522, 1.128998, 1, 1, 1, 1, 1,
0.5327305, 1.647931, 0.2742585, 1, 1, 1, 1, 1,
0.5334482, 1.017878, 1.751858, 0, 0, 1, 1, 1,
0.5371367, -0.09057655, 2.213672, 1, 0, 0, 1, 1,
0.5390728, -0.9641422, 2.935078, 1, 0, 0, 1, 1,
0.5396422, 0.006602059, 0.09089713, 1, 0, 0, 1, 1,
0.5450435, -0.2160964, 2.415006, 1, 0, 0, 1, 1,
0.5555817, -0.8831428, 2.535891, 1, 0, 0, 1, 1,
0.555911, -0.9782754, 2.354247, 0, 0, 0, 1, 1,
0.5586706, -0.2778468, 1.538232, 0, 0, 0, 1, 1,
0.5586712, 0.692041, -0.844542, 0, 0, 0, 1, 1,
0.5641525, 0.4576198, 2.031332, 0, 0, 0, 1, 1,
0.5645885, 1.905416, -0.1923924, 0, 0, 0, 1, 1,
0.566061, -0.3579379, 3.064277, 0, 0, 0, 1, 1,
0.569512, -0.7108817, 2.177061, 0, 0, 0, 1, 1,
0.5715647, 0.1227563, 0.6524164, 1, 1, 1, 1, 1,
0.573307, 1.556203, 0.9954771, 1, 1, 1, 1, 1,
0.5747494, -1.093258, 1.899323, 1, 1, 1, 1, 1,
0.5785533, 0.9294219, 0.5723391, 1, 1, 1, 1, 1,
0.5816963, -0.7790074, 2.620565, 1, 1, 1, 1, 1,
0.5841973, -1.163333, 2.024263, 1, 1, 1, 1, 1,
0.5866214, 0.2535487, 1.256675, 1, 1, 1, 1, 1,
0.5875389, -2.057593, 2.822931, 1, 1, 1, 1, 1,
0.5876312, -1.327022, 1.748747, 1, 1, 1, 1, 1,
0.5877945, -1.821843, 6.685811, 1, 1, 1, 1, 1,
0.5882543, 0.8115129, -0.4552448, 1, 1, 1, 1, 1,
0.590397, -1.265758, 4.696309, 1, 1, 1, 1, 1,
0.5909565, 0.3467081, 1.219956, 1, 1, 1, 1, 1,
0.5943328, 0.0653245, 0.9263046, 1, 1, 1, 1, 1,
0.5946754, 1.447182, 0.1743075, 1, 1, 1, 1, 1,
0.5998844, -0.8250901, 3.184643, 0, 0, 1, 1, 1,
0.600562, -0.7187524, 2.523981, 1, 0, 0, 1, 1,
0.6019862, -0.06196955, 1.310656, 1, 0, 0, 1, 1,
0.6041858, 1.20465, 0.4460751, 1, 0, 0, 1, 1,
0.6048195, -0.7591115, 1.773083, 1, 0, 0, 1, 1,
0.6064018, -0.1955813, 2.164634, 1, 0, 0, 1, 1,
0.6108544, 0.6690503, 1.138247, 0, 0, 0, 1, 1,
0.6193433, 0.6323689, -0.5244069, 0, 0, 0, 1, 1,
0.6212775, 0.4971321, 1.886629, 0, 0, 0, 1, 1,
0.6225769, -0.6465168, 4.229003, 0, 0, 0, 1, 1,
0.624325, -0.7055402, 3.096811, 0, 0, 0, 1, 1,
0.6265282, 0.2174646, 0.5664929, 0, 0, 0, 1, 1,
0.6267355, -2.067821, 3.478427, 0, 0, 0, 1, 1,
0.6272452, 2.025568, 1.37944, 1, 1, 1, 1, 1,
0.6277141, 0.4778753, 1.820081, 1, 1, 1, 1, 1,
0.6281646, -1.921462, 3.23497, 1, 1, 1, 1, 1,
0.6303771, 0.3606307, 2.262932, 1, 1, 1, 1, 1,
0.6333858, 0.5401287, 0.4620338, 1, 1, 1, 1, 1,
0.6364623, -0.2164521, 1.610702, 1, 1, 1, 1, 1,
0.6381382, -0.03415204, 1.17793, 1, 1, 1, 1, 1,
0.6415827, 1.456102, 0.09088568, 1, 1, 1, 1, 1,
0.6482098, -1.273601, 2.175257, 1, 1, 1, 1, 1,
0.6484504, -0.6141352, 3.290843, 1, 1, 1, 1, 1,
0.6505902, 2.271027, -1.851511, 1, 1, 1, 1, 1,
0.6557212, 0.2099363, 0.2447713, 1, 1, 1, 1, 1,
0.6595906, 0.4127137, 0.7317827, 1, 1, 1, 1, 1,
0.6649944, 1.12425, -0.05789854, 1, 1, 1, 1, 1,
0.666396, 0.7564961, 1.004767, 1, 1, 1, 1, 1,
0.6711725, 0.9302242, 1.128066, 0, 0, 1, 1, 1,
0.6748041, -1.501605, 3.325911, 1, 0, 0, 1, 1,
0.6795814, 0.4944898, 2.798985, 1, 0, 0, 1, 1,
0.6796189, -0.2878633, 1.777462, 1, 0, 0, 1, 1,
0.6815472, -0.1017076, 2.341737, 1, 0, 0, 1, 1,
0.6892395, 0.9391392, 1.837861, 1, 0, 0, 1, 1,
0.6902379, 0.3323097, 1.312536, 0, 0, 0, 1, 1,
0.6938956, 0.4743211, 2.128464, 0, 0, 0, 1, 1,
0.6961421, -1.514992, 2.230404, 0, 0, 0, 1, 1,
0.6965128, -0.436618, 1.526667, 0, 0, 0, 1, 1,
0.6971674, -0.9895768, 3.92552, 0, 0, 0, 1, 1,
0.6974322, 0.02039088, 2.91938, 0, 0, 0, 1, 1,
0.6996168, -0.3486377, 0.969816, 0, 0, 0, 1, 1,
0.7006804, -0.3560731, 0.5782006, 1, 1, 1, 1, 1,
0.7041914, 0.7194747, 1.440979, 1, 1, 1, 1, 1,
0.7072695, -2.055481, 2.459992, 1, 1, 1, 1, 1,
0.7079592, -0.4899271, 2.233756, 1, 1, 1, 1, 1,
0.7083136, -0.2475, 2.165342, 1, 1, 1, 1, 1,
0.7097831, -0.8510579, 2.590028, 1, 1, 1, 1, 1,
0.7105138, 0.1603887, 1.16572, 1, 1, 1, 1, 1,
0.7116599, 2.67827, 0.3405009, 1, 1, 1, 1, 1,
0.7177591, 0.4034983, 0.1348372, 1, 1, 1, 1, 1,
0.7340298, -0.8158258, 3.997612, 1, 1, 1, 1, 1,
0.7341659, -0.7737343, 2.993569, 1, 1, 1, 1, 1,
0.7365322, -0.8863713, 2.175765, 1, 1, 1, 1, 1,
0.7470102, -2.894141, 2.960571, 1, 1, 1, 1, 1,
0.7508992, -0.4400564, 1.083962, 1, 1, 1, 1, 1,
0.751953, -1.961801, 3.541002, 1, 1, 1, 1, 1,
0.754106, -2.281888, 2.953672, 0, 0, 1, 1, 1,
0.7583305, -0.4617732, 1.67621, 1, 0, 0, 1, 1,
0.770492, -0.175162, 1.969215, 1, 0, 0, 1, 1,
0.7748426, 0.8468874, -0.3628871, 1, 0, 0, 1, 1,
0.7786228, -0.1451441, 2.070179, 1, 0, 0, 1, 1,
0.7790167, -1.971178, 3.81315, 1, 0, 0, 1, 1,
0.7791892, 1.831603, 1.942459, 0, 0, 0, 1, 1,
0.78104, 0.9335897, 0.689393, 0, 0, 0, 1, 1,
0.7813741, 1.235587, 0.5447696, 0, 0, 0, 1, 1,
0.783181, -0.4705833, 1.700156, 0, 0, 0, 1, 1,
0.7833857, -0.8980144, 2.912642, 0, 0, 0, 1, 1,
0.7857653, -0.1810526, 1.909949, 0, 0, 0, 1, 1,
0.78859, -2.034003, 2.497278, 0, 0, 0, 1, 1,
0.7890089, 0.7435558, 0.2563081, 1, 1, 1, 1, 1,
0.794638, 0.889492, 1.002353, 1, 1, 1, 1, 1,
0.7954902, 0.3970437, 2.091917, 1, 1, 1, 1, 1,
0.7955464, 0.2835531, 0.7858469, 1, 1, 1, 1, 1,
0.7989621, -0.4074669, 0.1446814, 1, 1, 1, 1, 1,
0.7994986, 1.210757, -0.6980267, 1, 1, 1, 1, 1,
0.8023704, -1.37653, 2.540706, 1, 1, 1, 1, 1,
0.8044025, 1.398921, -0.7080472, 1, 1, 1, 1, 1,
0.8081988, -0.1071279, 1.122625, 1, 1, 1, 1, 1,
0.8210477, 0.5857243, 1.257595, 1, 1, 1, 1, 1,
0.8213438, 0.8305619, 0.6210319, 1, 1, 1, 1, 1,
0.8349685, -0.9643498, 2.993116, 1, 1, 1, 1, 1,
0.8447513, 0.1193349, 0.4802953, 1, 1, 1, 1, 1,
0.8484473, 0.7026618, 0.7028121, 1, 1, 1, 1, 1,
0.8498703, -0.04486478, 0.8961558, 1, 1, 1, 1, 1,
0.8524013, -1.549875, 2.270153, 0, 0, 1, 1, 1,
0.8578597, -1.830155, 1.683937, 1, 0, 0, 1, 1,
0.8584796, -0.3058816, 2.238905, 1, 0, 0, 1, 1,
0.8658833, 0.9193478, -0.02519445, 1, 0, 0, 1, 1,
0.8698657, 2.079888, 2.387174, 1, 0, 0, 1, 1,
0.8713737, -0.002550961, 1.553329, 1, 0, 0, 1, 1,
0.8747672, 0.2828626, 1.578898, 0, 0, 0, 1, 1,
0.8777192, 0.09281076, 1.931579, 0, 0, 0, 1, 1,
0.8783801, -0.4514742, 1.708427, 0, 0, 0, 1, 1,
0.8961995, -0.359747, 2.27161, 0, 0, 0, 1, 1,
0.8998991, 0.01782607, 0.5609666, 0, 0, 0, 1, 1,
0.905724, -0.2275334, 1.353211, 0, 0, 0, 1, 1,
0.9068362, -1.297284, 2.504882, 0, 0, 0, 1, 1,
0.9094377, 2.469024, 1.245568, 1, 1, 1, 1, 1,
0.9146297, -0.8599749, 2.348686, 1, 1, 1, 1, 1,
0.9169278, -0.003657632, 2.577248, 1, 1, 1, 1, 1,
0.9183671, 2.379523, 0.7271007, 1, 1, 1, 1, 1,
0.9217041, 0.7291498, 0.1902814, 1, 1, 1, 1, 1,
0.925641, -0.6557584, 3.414824, 1, 1, 1, 1, 1,
0.9318891, -0.7548365, 1.84057, 1, 1, 1, 1, 1,
0.9351322, -0.4552509, 1.548046, 1, 1, 1, 1, 1,
0.9398293, 0.1296774, 2.704329, 1, 1, 1, 1, 1,
0.9400877, 0.6772975, -0.8102722, 1, 1, 1, 1, 1,
0.9418268, 0.3580862, 0.5065554, 1, 1, 1, 1, 1,
0.9456185, -1.157984, 4.875242, 1, 1, 1, 1, 1,
0.9463698, 0.645418, 0.8732007, 1, 1, 1, 1, 1,
0.949319, -0.08562879, 1.808585, 1, 1, 1, 1, 1,
0.9526328, -0.9914459, 2.654329, 1, 1, 1, 1, 1,
0.9555094, 0.06116909, 2.183591, 0, 0, 1, 1, 1,
0.9575773, -0.767711, 2.964581, 1, 0, 0, 1, 1,
0.9579429, 0.5297459, 2.091654, 1, 0, 0, 1, 1,
0.9601709, 0.0294544, 2.806623, 1, 0, 0, 1, 1,
0.9608346, 0.6069005, -0.7877333, 1, 0, 0, 1, 1,
0.9613651, 0.06736536, 1.490997, 1, 0, 0, 1, 1,
0.965637, -0.007184112, 1.418906, 0, 0, 0, 1, 1,
0.9669712, -0.6928554, 3.01202, 0, 0, 0, 1, 1,
0.9670171, 0.1300104, 1.264726, 0, 0, 0, 1, 1,
0.9858369, -2.189789, 3.057264, 0, 0, 0, 1, 1,
0.9868229, -1.240545, 2.92304, 0, 0, 0, 1, 1,
0.9888996, 0.3939792, -0.1359002, 0, 0, 0, 1, 1,
0.9918694, -0.6327907, 1.490995, 0, 0, 0, 1, 1,
0.9930685, 0.4153597, 1.500996, 1, 1, 1, 1, 1,
0.993189, 0.2194503, 2.630008, 1, 1, 1, 1, 1,
0.9968454, -0.3040086, 1.855247, 1, 1, 1, 1, 1,
1.003837, 0.4528467, 1.140716, 1, 1, 1, 1, 1,
1.017116, -1.075078, 2.527035, 1, 1, 1, 1, 1,
1.021381, -0.2592447, 2.121191, 1, 1, 1, 1, 1,
1.030564, 0.7917362, 1.209219, 1, 1, 1, 1, 1,
1.035593, -0.1051454, 1.5195, 1, 1, 1, 1, 1,
1.048787, 0.2566752, 2.604133, 1, 1, 1, 1, 1,
1.048913, 0.6477188, 1.429119, 1, 1, 1, 1, 1,
1.054957, 0.2677731, 1.848553, 1, 1, 1, 1, 1,
1.06155, 0.1501532, 2.100981, 1, 1, 1, 1, 1,
1.064341, 0.9572245, 1.583641, 1, 1, 1, 1, 1,
1.064724, 0.355289, 0.8157291, 1, 1, 1, 1, 1,
1.067909, -1.785851, 1.770483, 1, 1, 1, 1, 1,
1.09187, 0.2477106, 0.5344409, 0, 0, 1, 1, 1,
1.094865, 1.896794, 1.989284, 1, 0, 0, 1, 1,
1.094895, -0.05582311, -0.05722079, 1, 0, 0, 1, 1,
1.096013, -0.4313707, 3.098196, 1, 0, 0, 1, 1,
1.096345, 0.9511307, 2.037116, 1, 0, 0, 1, 1,
1.098155, 0.7427955, 1.29064, 1, 0, 0, 1, 1,
1.10094, -0.4374083, 2.382557, 0, 0, 0, 1, 1,
1.101653, -1.148702, 1.487087, 0, 0, 0, 1, 1,
1.102306, -0.02713088, 1.650351, 0, 0, 0, 1, 1,
1.11889, 0.8472395, 1.745542, 0, 0, 0, 1, 1,
1.130975, 0.01737062, 0.6100747, 0, 0, 0, 1, 1,
1.144116, -0.8311478, 0.9709547, 0, 0, 0, 1, 1,
1.150395, 2.297513, -0.3436886, 0, 0, 0, 1, 1,
1.153921, 0.0790246, 1.222426, 1, 1, 1, 1, 1,
1.159554, 1.056373, 0.6418259, 1, 1, 1, 1, 1,
1.170946, 0.1496757, 2.096759, 1, 1, 1, 1, 1,
1.177076, 0.09243002, 3.252991, 1, 1, 1, 1, 1,
1.180614, 1.652758, 1.308923, 1, 1, 1, 1, 1,
1.185103, -1.033061, 1.312275, 1, 1, 1, 1, 1,
1.188781, 0.4734206, 0.9523321, 1, 1, 1, 1, 1,
1.190967, 1.071709, 0.9886872, 1, 1, 1, 1, 1,
1.193407, 1.019723, -0.4294953, 1, 1, 1, 1, 1,
1.194174, -0.7835899, 2.090216, 1, 1, 1, 1, 1,
1.208481, 0.7572626, -1.872872, 1, 1, 1, 1, 1,
1.210137, 0.5894884, 0.2885861, 1, 1, 1, 1, 1,
1.210992, -1.061042, 1.244341, 1, 1, 1, 1, 1,
1.218497, 0.5126675, -0.02274603, 1, 1, 1, 1, 1,
1.219915, 0.1770522, 0.9009516, 1, 1, 1, 1, 1,
1.224645, -0.8993445, 2.378676, 0, 0, 1, 1, 1,
1.226934, 0.8873928, 1.119703, 1, 0, 0, 1, 1,
1.231703, 0.5244828, 0.6323592, 1, 0, 0, 1, 1,
1.235855, -1.076112, 0.08982241, 1, 0, 0, 1, 1,
1.236104, -0.7793193, 2.861426, 1, 0, 0, 1, 1,
1.23823, 0.6413793, 2.029295, 1, 0, 0, 1, 1,
1.240059, -0.4423066, 2.578467, 0, 0, 0, 1, 1,
1.241291, 1.879002, -1.417902, 0, 0, 0, 1, 1,
1.243819, -1.723802, 2.310868, 0, 0, 0, 1, 1,
1.255365, 0.1705364, 1.587712, 0, 0, 0, 1, 1,
1.262076, -0.379521, 1.93147, 0, 0, 0, 1, 1,
1.282477, 0.1962921, 2.207734, 0, 0, 0, 1, 1,
1.283125, 1.312598, 1.23603, 0, 0, 0, 1, 1,
1.283984, 1.180202, -0.863673, 1, 1, 1, 1, 1,
1.286684, 0.6495323, 1.640905, 1, 1, 1, 1, 1,
1.29321, -0.2873832, 4.4453, 1, 1, 1, 1, 1,
1.297039, -1.427364, 2.96954, 1, 1, 1, 1, 1,
1.302619, 0.6439744, -0.9116513, 1, 1, 1, 1, 1,
1.303518, 0.07579336, 2.18807, 1, 1, 1, 1, 1,
1.304719, -0.1295202, 1.373152, 1, 1, 1, 1, 1,
1.307834, -1.041499, 3.582342, 1, 1, 1, 1, 1,
1.325459, -0.2295419, 2.356191, 1, 1, 1, 1, 1,
1.332623, -0.05822373, 1.642977, 1, 1, 1, 1, 1,
1.338448, -0.5759417, 0.7828898, 1, 1, 1, 1, 1,
1.352346, 0.8144493, 1.09587, 1, 1, 1, 1, 1,
1.355441, 0.340036, 2.414062, 1, 1, 1, 1, 1,
1.356413, 0.1777358, 0.9298099, 1, 1, 1, 1, 1,
1.36287, -0.04207313, 1.941728, 1, 1, 1, 1, 1,
1.363742, -0.7738864, 0.4870613, 0, 0, 1, 1, 1,
1.371914, -2.00893, 1.487074, 1, 0, 0, 1, 1,
1.374915, 0.07389238, 0.637457, 1, 0, 0, 1, 1,
1.376699, 0.7784671, -1.435776, 1, 0, 0, 1, 1,
1.378279, 1.010746, 0.182392, 1, 0, 0, 1, 1,
1.382261, 0.3137657, 0.8649994, 1, 0, 0, 1, 1,
1.398156, -0.815631, 0.9891443, 0, 0, 0, 1, 1,
1.420172, -0.03354313, 0.3083787, 0, 0, 0, 1, 1,
1.439306, -0.8520755, 0.4834406, 0, 0, 0, 1, 1,
1.442657, 0.2179514, 1.394592, 0, 0, 0, 1, 1,
1.484331, -1.484899, 2.820823, 0, 0, 0, 1, 1,
1.488045, -1.34786, 2.674897, 0, 0, 0, 1, 1,
1.494969, 1.441372, -0.7089272, 0, 0, 0, 1, 1,
1.497502, -1.381521, 2.448636, 1, 1, 1, 1, 1,
1.499816, -0.0093576, 1.556171, 1, 1, 1, 1, 1,
1.502843, 1.666396, 1.570173, 1, 1, 1, 1, 1,
1.511002, 0.5903301, 0.8439675, 1, 1, 1, 1, 1,
1.5435, 0.3412438, 2.248938, 1, 1, 1, 1, 1,
1.553499, 1.172829, -0.2811624, 1, 1, 1, 1, 1,
1.553752, -0.8364816, 2.647668, 1, 1, 1, 1, 1,
1.555078, -0.6214206, 1.607249, 1, 1, 1, 1, 1,
1.56616, 0.5440439, 2.13138, 1, 1, 1, 1, 1,
1.569345, -0.8370477, 3.307612, 1, 1, 1, 1, 1,
1.58221, -0.04346865, 0.7896129, 1, 1, 1, 1, 1,
1.606365, 1.065403, 1.823621, 1, 1, 1, 1, 1,
1.60984, 1.481455, 0.4226349, 1, 1, 1, 1, 1,
1.626424, 1.599922, 0.147427, 1, 1, 1, 1, 1,
1.628368, 0.9236469, 1.081108, 1, 1, 1, 1, 1,
1.638715, 1.229889, 1.448221, 0, 0, 1, 1, 1,
1.646515, 0.6634674, 0.8738443, 1, 0, 0, 1, 1,
1.655413, 1.346148, 0.1858763, 1, 0, 0, 1, 1,
1.656713, -1.80434, 2.905743, 1, 0, 0, 1, 1,
1.687142, 0.4031278, -0.783508, 1, 0, 0, 1, 1,
1.711091, 0.2543204, 1.242933, 1, 0, 0, 1, 1,
1.720818, -1.369062, 2.863873, 0, 0, 0, 1, 1,
1.724712, -1.361318, 1.428649, 0, 0, 0, 1, 1,
1.726043, -1.817168, 2.0367, 0, 0, 0, 1, 1,
1.728539, 0.2206219, 0.9665844, 0, 0, 0, 1, 1,
1.750556, 0.8370289, 3.384467, 0, 0, 0, 1, 1,
1.765382, 0.7100593, 2.700326, 0, 0, 0, 1, 1,
1.775954, -1.023129, 2.171121, 0, 0, 0, 1, 1,
1.825753, 1.004334, 0.7411028, 1, 1, 1, 1, 1,
1.835333, -1.893371, 1.302628, 1, 1, 1, 1, 1,
1.851794, -0.4065368, 0.6076301, 1, 1, 1, 1, 1,
1.873865, 0.4953484, 1.655529, 1, 1, 1, 1, 1,
1.87801, -1.857188, 3.777835, 1, 1, 1, 1, 1,
1.88237, -0.472309, 1.929702, 1, 1, 1, 1, 1,
1.901445, 1.718738, 1.329611, 1, 1, 1, 1, 1,
1.930291, -0.5288101, -0.2747445, 1, 1, 1, 1, 1,
1.950506, 1.006883, -0.402554, 1, 1, 1, 1, 1,
2.009404, -0.1618286, 2.699746, 1, 1, 1, 1, 1,
2.012136, 0.1486001, 0.7141774, 1, 1, 1, 1, 1,
2.014359, 0.7829494, 0.7000967, 1, 1, 1, 1, 1,
2.014929, 1.195665, 1.764408, 1, 1, 1, 1, 1,
2.032804, 0.7004982, 1.12971, 1, 1, 1, 1, 1,
2.103116, -1.371127, 2.71274, 1, 1, 1, 1, 1,
2.112175, 0.7210025, 0.9187682, 0, 0, 1, 1, 1,
2.14128, 0.1914406, 2.549829, 1, 0, 0, 1, 1,
2.175464, 0.006178925, 0.0691435, 1, 0, 0, 1, 1,
2.214463, -0.4285337, 2.013717, 1, 0, 0, 1, 1,
2.220236, 2.394387, -0.01949826, 1, 0, 0, 1, 1,
2.256851, -1.177788, 2.418192, 1, 0, 0, 1, 1,
2.261333, -0.7710719, 1.928723, 0, 0, 0, 1, 1,
2.272588, -0.2774048, 0.8802342, 0, 0, 0, 1, 1,
2.290849, -0.7119387, 2.172836, 0, 0, 0, 1, 1,
2.303175, 0.1147183, 0.29425, 0, 0, 0, 1, 1,
2.304359, -0.0172844, 1.665125, 0, 0, 0, 1, 1,
2.324418, -1.703981, 2.406229, 0, 0, 0, 1, 1,
2.33778, 0.3243707, 1.777807, 0, 0, 0, 1, 1,
2.393282, 0.3897323, 0.7554261, 1, 1, 1, 1, 1,
2.43856, -0.4073488, 1.104172, 1, 1, 1, 1, 1,
2.574728, -0.6220201, 3.496342, 1, 1, 1, 1, 1,
2.579298, -0.7323366, 2.06924, 1, 1, 1, 1, 1,
2.626843, -0.2578348, 0.2770889, 1, 1, 1, 1, 1,
2.922293, -0.6414491, 1.386313, 1, 1, 1, 1, 1,
3.033546, 1.449707, -0.6860517, 1, 1, 1, 1, 1
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
var radius = 9.789099;
var distance = 34.38379;
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
mvMatrix.translate( 0.0144043, 0.1380374, -0.7399261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38379);
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
