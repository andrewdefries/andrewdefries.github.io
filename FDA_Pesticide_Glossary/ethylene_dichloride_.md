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
-3.673838, -0.6446003, -2.786844, 1, 0, 0, 1,
-3.169399, 0.6330816, -1.444161, 1, 0.007843138, 0, 1,
-3.155222, -1.321615, -0.5445799, 1, 0.01176471, 0, 1,
-2.817964, -0.3310243, -2.457186, 1, 0.01960784, 0, 1,
-2.790808, 0.6205604, -2.326565, 1, 0.02352941, 0, 1,
-2.707541, -0.2886143, -1.034415, 1, 0.03137255, 0, 1,
-2.668801, -0.3436864, 0.3758449, 1, 0.03529412, 0, 1,
-2.627733, -0.1417896, -2.116397, 1, 0.04313726, 0, 1,
-2.589183, -2.136649, -2.779322, 1, 0.04705882, 0, 1,
-2.552904, -2.078451, -2.794057, 1, 0.05490196, 0, 1,
-2.515059, 2.064639, -0.6047593, 1, 0.05882353, 0, 1,
-2.482963, -0.2984878, -2.553923, 1, 0.06666667, 0, 1,
-2.309175, 0.8475276, 0.1849683, 1, 0.07058824, 0, 1,
-2.279308, -0.9290794, -0.9636381, 1, 0.07843138, 0, 1,
-2.216437, 0.723281, -1.068783, 1, 0.08235294, 0, 1,
-2.216247, -0.7854152, -2.422302, 1, 0.09019608, 0, 1,
-2.167592, 1.549642, -1.148669, 1, 0.09411765, 0, 1,
-2.163802, 0.4547433, -0.8365765, 1, 0.1019608, 0, 1,
-2.127521, 0.1912782, -0.03840345, 1, 0.1098039, 0, 1,
-2.081964, -1.860023, -2.426806, 1, 0.1137255, 0, 1,
-2.045147, 0.03939307, -1.370204, 1, 0.1215686, 0, 1,
-2.004424, 0.595735, -1.747841, 1, 0.1254902, 0, 1,
-1.994216, 0.8536832, -1.471368, 1, 0.1333333, 0, 1,
-1.978592, 0.7565492, 0.6446325, 1, 0.1372549, 0, 1,
-1.975955, 1.360424, -2.407088, 1, 0.145098, 0, 1,
-1.975766, 0.6313348, -0.7060467, 1, 0.1490196, 0, 1,
-1.972663, -0.4351027, -3.440238, 1, 0.1568628, 0, 1,
-1.965144, 0.5866822, -0.685119, 1, 0.1607843, 0, 1,
-1.922663, -1.21283, -3.897462, 1, 0.1686275, 0, 1,
-1.911675, 1.809476, -1.460193, 1, 0.172549, 0, 1,
-1.894774, 1.452925, -1.742427, 1, 0.1803922, 0, 1,
-1.893235, -1.480453, -2.236121, 1, 0.1843137, 0, 1,
-1.890386, -0.4874708, -1.683298, 1, 0.1921569, 0, 1,
-1.850969, -0.5298253, -1.107581, 1, 0.1960784, 0, 1,
-1.848827, 2.05092, -1.184005, 1, 0.2039216, 0, 1,
-1.823695, 1.151475, -1.540944, 1, 0.2117647, 0, 1,
-1.807697, -0.4704953, -0.7900595, 1, 0.2156863, 0, 1,
-1.80373, 2.778153, -0.7573131, 1, 0.2235294, 0, 1,
-1.799738, 0.4208936, -3.107752, 1, 0.227451, 0, 1,
-1.773547, -0.4490748, -1.092677, 1, 0.2352941, 0, 1,
-1.764889, 0.009925338, -1.257242, 1, 0.2392157, 0, 1,
-1.737735, 0.5406907, -0.3735417, 1, 0.2470588, 0, 1,
-1.721626, 0.2403119, -0.9980422, 1, 0.2509804, 0, 1,
-1.716663, -0.3917318, -3.153919, 1, 0.2588235, 0, 1,
-1.715065, 0.002447848, -0.9652558, 1, 0.2627451, 0, 1,
-1.674939, 1.177518, -1.918172, 1, 0.2705882, 0, 1,
-1.6713, -1.658641, -3.696977, 1, 0.2745098, 0, 1,
-1.671251, -0.8216531, -4.27554, 1, 0.282353, 0, 1,
-1.667027, -1.110472, -2.066792, 1, 0.2862745, 0, 1,
-1.663838, -2.172777, -1.635247, 1, 0.2941177, 0, 1,
-1.6567, 1.490985, -0.06428581, 1, 0.3019608, 0, 1,
-1.651578, -0.5338482, -1.690491, 1, 0.3058824, 0, 1,
-1.643751, 0.4513861, -0.5912557, 1, 0.3137255, 0, 1,
-1.614783, -1.129591, 0.7057359, 1, 0.3176471, 0, 1,
-1.606548, 0.3850842, -0.4480218, 1, 0.3254902, 0, 1,
-1.603322, 0.5508218, -1.244449, 1, 0.3294118, 0, 1,
-1.602707, -0.3850333, -1.952007, 1, 0.3372549, 0, 1,
-1.597042, -0.1303989, -1.622963, 1, 0.3411765, 0, 1,
-1.586216, 0.3096157, 0.08686411, 1, 0.3490196, 0, 1,
-1.58602, -0.8888469, -1.768968, 1, 0.3529412, 0, 1,
-1.565157, 0.6967874, -1.60135, 1, 0.3607843, 0, 1,
-1.564083, -0.1044909, -1.433579, 1, 0.3647059, 0, 1,
-1.56075, -1.398147, -2.020026, 1, 0.372549, 0, 1,
-1.558184, 1.517309, 0.02930499, 1, 0.3764706, 0, 1,
-1.555975, -0.2655987, -1.974418, 1, 0.3843137, 0, 1,
-1.532667, 0.3027785, -2.666332, 1, 0.3882353, 0, 1,
-1.529352, -1.27317, -2.214986, 1, 0.3960784, 0, 1,
-1.52766, -0.006133496, -2.167335, 1, 0.4039216, 0, 1,
-1.526155, -2.301831, -3.931675, 1, 0.4078431, 0, 1,
-1.51756, -1.565461, -3.004891, 1, 0.4156863, 0, 1,
-1.512783, 1.248144, -1.104025, 1, 0.4196078, 0, 1,
-1.501698, 1.06643, -1.159119, 1, 0.427451, 0, 1,
-1.492432, 0.05254532, -1.024086, 1, 0.4313726, 0, 1,
-1.487366, -0.5136332, -1.92818, 1, 0.4392157, 0, 1,
-1.471256, -0.864261, -1.243427, 1, 0.4431373, 0, 1,
-1.465019, -1.307806, -1.260159, 1, 0.4509804, 0, 1,
-1.46234, 0.5917036, -2.312457, 1, 0.454902, 0, 1,
-1.453993, -0.211485, -2.82474, 1, 0.4627451, 0, 1,
-1.446858, 0.3876323, -3.092361, 1, 0.4666667, 0, 1,
-1.446077, 1.41262, -1.298056, 1, 0.4745098, 0, 1,
-1.443098, -1.440342, -1.379663, 1, 0.4784314, 0, 1,
-1.427907, 0.7696203, -0.2995501, 1, 0.4862745, 0, 1,
-1.424078, -0.1769129, -1.748769, 1, 0.4901961, 0, 1,
-1.410989, -0.1743519, 0.2384871, 1, 0.4980392, 0, 1,
-1.409691, 0.05730357, -2.369424, 1, 0.5058824, 0, 1,
-1.398794, -0.6830362, -1.028594, 1, 0.509804, 0, 1,
-1.395203, -0.3737559, -1.228742, 1, 0.5176471, 0, 1,
-1.385287, 0.1126712, -0.8371257, 1, 0.5215687, 0, 1,
-1.3842, 1.036166, -1.187625, 1, 0.5294118, 0, 1,
-1.374718, 0.1026041, -2.508713, 1, 0.5333334, 0, 1,
-1.374329, -0.3372681, -1.506132, 1, 0.5411765, 0, 1,
-1.368027, 0.9275872, -1.243272, 1, 0.5450981, 0, 1,
-1.36499, -2.652402, -1.805849, 1, 0.5529412, 0, 1,
-1.362094, -0.1041644, -0.1106654, 1, 0.5568628, 0, 1,
-1.361766, 0.4498222, -2.130231, 1, 0.5647059, 0, 1,
-1.359687, -0.7047994, -1.951408, 1, 0.5686275, 0, 1,
-1.359458, -0.6364879, -3.14338, 1, 0.5764706, 0, 1,
-1.357018, -0.9160096, -0.4802515, 1, 0.5803922, 0, 1,
-1.34346, 0.3185507, -1.808464, 1, 0.5882353, 0, 1,
-1.342683, 1.029488, -1.79104, 1, 0.5921569, 0, 1,
-1.334837, 2.211404, -1.072754, 1, 0.6, 0, 1,
-1.313536, -1.024436, -2.112686, 1, 0.6078432, 0, 1,
-1.299998, -1.613371, -2.542446, 1, 0.6117647, 0, 1,
-1.293807, -2.187994, -2.31156, 1, 0.6196079, 0, 1,
-1.291762, -1.086601, -1.953755, 1, 0.6235294, 0, 1,
-1.291002, 0.5396185, -1.473714, 1, 0.6313726, 0, 1,
-1.289967, -0.9835943, -1.438665, 1, 0.6352941, 0, 1,
-1.280164, 0.388146, -1.164317, 1, 0.6431373, 0, 1,
-1.267993, -0.4664744, -2.330493, 1, 0.6470588, 0, 1,
-1.267376, -1.154609, -1.265833, 1, 0.654902, 0, 1,
-1.265602, -0.4407189, -2.352964, 1, 0.6588235, 0, 1,
-1.265257, -1.571927, -2.287612, 1, 0.6666667, 0, 1,
-1.263596, 0.7211552, 0.07250009, 1, 0.6705883, 0, 1,
-1.239074, -0.1791957, -0.09015332, 1, 0.6784314, 0, 1,
-1.238091, -0.7418094, -1.239983, 1, 0.682353, 0, 1,
-1.232568, 0.8822894, -2.3069, 1, 0.6901961, 0, 1,
-1.228152, -1.132908, -2.723788, 1, 0.6941177, 0, 1,
-1.227759, -1.470849, -3.247944, 1, 0.7019608, 0, 1,
-1.225624, 0.2606475, -0.818099, 1, 0.7098039, 0, 1,
-1.213521, -1.313906, -3.149923, 1, 0.7137255, 0, 1,
-1.208321, -0.5103213, -4.096786, 1, 0.7215686, 0, 1,
-1.206422, 0.5215285, -2.738338, 1, 0.7254902, 0, 1,
-1.19567, -1.18784, -1.447755, 1, 0.7333333, 0, 1,
-1.194545, -1.511897, -2.838883, 1, 0.7372549, 0, 1,
-1.186033, -0.4966503, -3.56894, 1, 0.7450981, 0, 1,
-1.182725, 0.3644777, -3.119366, 1, 0.7490196, 0, 1,
-1.17433, -1.247566, -3.425443, 1, 0.7568628, 0, 1,
-1.168032, -0.2929149, -1.73158, 1, 0.7607843, 0, 1,
-1.165083, 0.8136376, -2.379966, 1, 0.7686275, 0, 1,
-1.161214, 0.4804412, -1.798128, 1, 0.772549, 0, 1,
-1.154462, 0.4364136, -0.2845698, 1, 0.7803922, 0, 1,
-1.153648, -0.1211068, -3.515743, 1, 0.7843137, 0, 1,
-1.153551, -1.069181, -2.628475, 1, 0.7921569, 0, 1,
-1.151949, 2.44225, -0.3312195, 1, 0.7960784, 0, 1,
-1.150908, 1.641196, -0.7384818, 1, 0.8039216, 0, 1,
-1.143254, 0.3519193, -0.2254905, 1, 0.8117647, 0, 1,
-1.141196, 1.511431, -0.1072457, 1, 0.8156863, 0, 1,
-1.131488, -2.230222, -3.888378, 1, 0.8235294, 0, 1,
-1.125329, -0.1144361, -1.682972, 1, 0.827451, 0, 1,
-1.122234, 2.576475, -1.189282, 1, 0.8352941, 0, 1,
-1.117551, -0.2232003, -3.300552, 1, 0.8392157, 0, 1,
-1.113345, -0.8980374, -1.471423, 1, 0.8470588, 0, 1,
-1.112883, 2.706277, 0.9661878, 1, 0.8509804, 0, 1,
-1.110262, -0.5824292, -3.698004, 1, 0.8588235, 0, 1,
-1.105157, 1.692204, -0.8835762, 1, 0.8627451, 0, 1,
-1.098986, -0.09517632, -1.137202, 1, 0.8705882, 0, 1,
-1.096495, -0.6977284, -2.056325, 1, 0.8745098, 0, 1,
-1.095109, -0.6808956, -3.398317, 1, 0.8823529, 0, 1,
-1.094977, -0.05658286, -3.190648, 1, 0.8862745, 0, 1,
-1.09438, -1.788796, -2.102674, 1, 0.8941177, 0, 1,
-1.093029, 0.08318958, -1.014641, 1, 0.8980392, 0, 1,
-1.09004, -0.8195123, -1.96239, 1, 0.9058824, 0, 1,
-1.089032, 2.834912, -1.728721, 1, 0.9137255, 0, 1,
-1.088258, -1.176413, -2.156477, 1, 0.9176471, 0, 1,
-1.082521, -0.8212388, -1.775522, 1, 0.9254902, 0, 1,
-1.080998, -0.7077874, -0.659152, 1, 0.9294118, 0, 1,
-1.07514, -1.179807, -2.319165, 1, 0.9372549, 0, 1,
-1.066128, -1.144758, -2.679816, 1, 0.9411765, 0, 1,
-1.06168, -0.997418, -2.59622, 1, 0.9490196, 0, 1,
-1.053762, 0.4944783, -2.433868, 1, 0.9529412, 0, 1,
-1.05096, -0.4313413, -1.510813, 1, 0.9607843, 0, 1,
-1.046841, 0.4062278, -0.4448192, 1, 0.9647059, 0, 1,
-1.042071, -0.8891153, -1.722197, 1, 0.972549, 0, 1,
-1.027303, -1.320895, 0.4035563, 1, 0.9764706, 0, 1,
-1.022087, 2.23745, -0.3032559, 1, 0.9843137, 0, 1,
-1.019866, -0.5966389, -0.1477706, 1, 0.9882353, 0, 1,
-1.015972, -0.6617284, -1.581536, 1, 0.9960784, 0, 1,
-1.009791, 0.4387932, -2.405118, 0.9960784, 1, 0, 1,
-1.007096, -1.300311, -3.494154, 0.9921569, 1, 0, 1,
-1.004179, -0.4985701, -2.391031, 0.9843137, 1, 0, 1,
-1.003723, -3.09899, -1.912315, 0.9803922, 1, 0, 1,
-1.002729, -0.5966862, -1.06349, 0.972549, 1, 0, 1,
-1.000564, 0.1578648, -1.918735, 0.9686275, 1, 0, 1,
-0.9992278, 0.2781092, -0.554181, 0.9607843, 1, 0, 1,
-0.9975511, -1.586766, -1.803892, 0.9568627, 1, 0, 1,
-0.9965923, 0.3559223, 0.7553782, 0.9490196, 1, 0, 1,
-0.996013, -0.5336418, -1.199201, 0.945098, 1, 0, 1,
-0.9941937, -0.4951907, -2.737374, 0.9372549, 1, 0, 1,
-0.9913325, -1.02752, -0.2533912, 0.9333333, 1, 0, 1,
-0.9835244, -0.2774825, -0.3748847, 0.9254902, 1, 0, 1,
-0.9833836, 1.356731, 0.7979403, 0.9215686, 1, 0, 1,
-0.9817317, 1.078852, -1.334298, 0.9137255, 1, 0, 1,
-0.9784306, -0.2185342, -0.1206848, 0.9098039, 1, 0, 1,
-0.9769181, 0.3834848, -1.920571, 0.9019608, 1, 0, 1,
-0.9710689, -0.331427, -1.77828, 0.8941177, 1, 0, 1,
-0.9617901, 0.5994528, -0.9659301, 0.8901961, 1, 0, 1,
-0.9612764, 1.154829, -0.8538805, 0.8823529, 1, 0, 1,
-0.9595434, -1.316172, -2.678436, 0.8784314, 1, 0, 1,
-0.9594734, 0.0001854984, -2.462955, 0.8705882, 1, 0, 1,
-0.9542317, -0.4809062, -2.29596, 0.8666667, 1, 0, 1,
-0.9505399, 0.6425314, -2.157552, 0.8588235, 1, 0, 1,
-0.9494427, -0.8755949, -3.152899, 0.854902, 1, 0, 1,
-0.9474124, -0.5825055, -1.886067, 0.8470588, 1, 0, 1,
-0.9466028, 1.037795, 0.2439115, 0.8431373, 1, 0, 1,
-0.9430063, 0.5420294, -1.531894, 0.8352941, 1, 0, 1,
-0.9371808, -0.06169412, -0.1501318, 0.8313726, 1, 0, 1,
-0.93557, -1.497908, -3.927529, 0.8235294, 1, 0, 1,
-0.9325926, -0.7156767, -1.586887, 0.8196079, 1, 0, 1,
-0.9190342, 0.8907042, 0.04260956, 0.8117647, 1, 0, 1,
-0.9168761, -0.1275493, -1.862404, 0.8078431, 1, 0, 1,
-0.9137402, 1.153938, -0.6930346, 0.8, 1, 0, 1,
-0.9133146, -0.3679087, -3.5162, 0.7921569, 1, 0, 1,
-0.9128404, -0.575116, -3.216656, 0.7882353, 1, 0, 1,
-0.9115678, -1.031483, -0.5989056, 0.7803922, 1, 0, 1,
-0.9098678, -0.1920206, -2.760732, 0.7764706, 1, 0, 1,
-0.90125, -1.183335, -1.74933, 0.7686275, 1, 0, 1,
-0.9007872, -0.4892309, -2.962483, 0.7647059, 1, 0, 1,
-0.8982123, 0.3502613, -0.9595134, 0.7568628, 1, 0, 1,
-0.8928317, 0.3878429, 0.2761456, 0.7529412, 1, 0, 1,
-0.8909798, 2.237367, 1.313553, 0.7450981, 1, 0, 1,
-0.8803213, 1.314585, -2.210413, 0.7411765, 1, 0, 1,
-0.8798207, -0.5003798, -1.180431, 0.7333333, 1, 0, 1,
-0.8780192, 0.485154, -1.862146, 0.7294118, 1, 0, 1,
-0.875905, 0.7096668, -1.509986, 0.7215686, 1, 0, 1,
-0.8695895, -0.807896, -2.521676, 0.7176471, 1, 0, 1,
-0.8664453, 0.6913401, 1.265867, 0.7098039, 1, 0, 1,
-0.8553631, 1.359486, 0.3781167, 0.7058824, 1, 0, 1,
-0.8512391, -0.3589737, -1.590733, 0.6980392, 1, 0, 1,
-0.8491376, 1.26159, 0.5302821, 0.6901961, 1, 0, 1,
-0.8480672, -0.1478816, -0.3489422, 0.6862745, 1, 0, 1,
-0.8450411, 0.4048592, 0.1060026, 0.6784314, 1, 0, 1,
-0.8388507, -0.4056356, -3.046131, 0.6745098, 1, 0, 1,
-0.8259544, -1.541036, -3.368019, 0.6666667, 1, 0, 1,
-0.8253235, -1.033577, -1.314326, 0.6627451, 1, 0, 1,
-0.8238945, 1.694658, 0.7160193, 0.654902, 1, 0, 1,
-0.8212307, -0.4956122, -0.9138471, 0.6509804, 1, 0, 1,
-0.8168192, 0.4103054, -0.08144745, 0.6431373, 1, 0, 1,
-0.8130563, -0.01401906, -1.43079, 0.6392157, 1, 0, 1,
-0.8121008, -0.88272, -3.873915, 0.6313726, 1, 0, 1,
-0.8117918, 1.286838, 0.3375844, 0.627451, 1, 0, 1,
-0.8110948, -0.9412141, -1.40496, 0.6196079, 1, 0, 1,
-0.809611, -1.457013, -1.735644, 0.6156863, 1, 0, 1,
-0.8091813, -0.1728349, -1.110052, 0.6078432, 1, 0, 1,
-0.8028631, -1.547383, -1.997183, 0.6039216, 1, 0, 1,
-0.8024721, 0.4757964, -1.893028, 0.5960785, 1, 0, 1,
-0.7999852, -1.722263, -2.958943, 0.5882353, 1, 0, 1,
-0.7964749, 0.6474948, -1.464283, 0.5843138, 1, 0, 1,
-0.795516, 0.8841676, -0.04493684, 0.5764706, 1, 0, 1,
-0.7942916, 0.09668909, -2.569074, 0.572549, 1, 0, 1,
-0.7935086, -1.804972, -3.201244, 0.5647059, 1, 0, 1,
-0.7899992, 0.7085543, 0.3353388, 0.5607843, 1, 0, 1,
-0.7840163, 0.6513497, -1.572816, 0.5529412, 1, 0, 1,
-0.7818252, -0.06813067, -2.21995, 0.5490196, 1, 0, 1,
-0.7691071, 0.6096705, -1.156805, 0.5411765, 1, 0, 1,
-0.7640346, 1.713597, -0.1545233, 0.5372549, 1, 0, 1,
-0.7616628, 1.041272, -2.230099, 0.5294118, 1, 0, 1,
-0.7569697, -1.685882, -2.891773, 0.5254902, 1, 0, 1,
-0.7565932, -0.362001, -0.6533899, 0.5176471, 1, 0, 1,
-0.7521046, -1.760701, -2.406706, 0.5137255, 1, 0, 1,
-0.7501354, 2.254044, 0.4963297, 0.5058824, 1, 0, 1,
-0.7488959, 1.297334, 0.06603833, 0.5019608, 1, 0, 1,
-0.7451184, 0.9631162, 0.7525576, 0.4941176, 1, 0, 1,
-0.7443426, -1.647069, -4.041257, 0.4862745, 1, 0, 1,
-0.7442529, 0.4147277, -0.16045, 0.4823529, 1, 0, 1,
-0.7391209, 1.198544, -2.65865, 0.4745098, 1, 0, 1,
-0.7311589, 0.0256375, -2.80381, 0.4705882, 1, 0, 1,
-0.7295574, 0.3228239, -1.663508, 0.4627451, 1, 0, 1,
-0.7294545, -1.21612, -3.159614, 0.4588235, 1, 0, 1,
-0.7245042, -0.537432, -3.27924, 0.4509804, 1, 0, 1,
-0.7242595, 0.6761497, -0.9141497, 0.4470588, 1, 0, 1,
-0.7234792, 0.6272638, -0.2996971, 0.4392157, 1, 0, 1,
-0.7130758, 0.09950995, -2.282928, 0.4352941, 1, 0, 1,
-0.710727, -0.957505, -1.303707, 0.427451, 1, 0, 1,
-0.7090051, 2.402969, -1.342257, 0.4235294, 1, 0, 1,
-0.7072245, -0.6155546, -1.054449, 0.4156863, 1, 0, 1,
-0.7049354, -0.3108991, -1.954587, 0.4117647, 1, 0, 1,
-0.7031441, -1.079069, -3.794564, 0.4039216, 1, 0, 1,
-0.7022622, -1.257548, -4.069281, 0.3960784, 1, 0, 1,
-0.7011231, 0.9092919, -0.3851622, 0.3921569, 1, 0, 1,
-0.7002621, -0.9543245, -0.9545227, 0.3843137, 1, 0, 1,
-0.6989074, 1.968423, 0.5229759, 0.3803922, 1, 0, 1,
-0.6929168, 0.5166357, -2.103235, 0.372549, 1, 0, 1,
-0.6848254, -1.934137, -2.426942, 0.3686275, 1, 0, 1,
-0.6845651, 0.2731255, -1.07654, 0.3607843, 1, 0, 1,
-0.6788902, -1.047093, -2.288079, 0.3568628, 1, 0, 1,
-0.6764003, 0.4898083, -0.8245496, 0.3490196, 1, 0, 1,
-0.6650644, -0.9057027, -2.522037, 0.345098, 1, 0, 1,
-0.6631899, -0.2206694, -2.732752, 0.3372549, 1, 0, 1,
-0.6611613, 0.3684525, -1.416753, 0.3333333, 1, 0, 1,
-0.6573371, 0.3403789, -0.1617457, 0.3254902, 1, 0, 1,
-0.649179, -0.7912912, -3.103136, 0.3215686, 1, 0, 1,
-0.646574, -0.03543565, -3.402943, 0.3137255, 1, 0, 1,
-0.6374035, -0.0969613, -0.5100325, 0.3098039, 1, 0, 1,
-0.6372846, -1.015844, -1.224165, 0.3019608, 1, 0, 1,
-0.6343262, 0.7125393, -1.538548, 0.2941177, 1, 0, 1,
-0.6304061, 2.200197, 0.1012962, 0.2901961, 1, 0, 1,
-0.6299347, 0.1255018, -1.052788, 0.282353, 1, 0, 1,
-0.6193075, -1.289876, -3.028253, 0.2784314, 1, 0, 1,
-0.6191382, -2.103806, -3.827909, 0.2705882, 1, 0, 1,
-0.6173241, -0.05282789, 0.1149317, 0.2666667, 1, 0, 1,
-0.6159694, -0.7120081, -1.11759, 0.2588235, 1, 0, 1,
-0.6112742, -0.1679007, -3.034607, 0.254902, 1, 0, 1,
-0.6022662, 2.834461, 0.79004, 0.2470588, 1, 0, 1,
-0.6010031, -2.166454, -2.529133, 0.2431373, 1, 0, 1,
-0.5973334, 0.004210288, -1.820683, 0.2352941, 1, 0, 1,
-0.5960475, -2.655996, -0.5325529, 0.2313726, 1, 0, 1,
-0.5887554, 0.3055494, -0.2726938, 0.2235294, 1, 0, 1,
-0.5750306, 0.7402743, -1.870739, 0.2196078, 1, 0, 1,
-0.5699108, -1.31992, -3.908069, 0.2117647, 1, 0, 1,
-0.5656751, 0.3434416, 0.3144048, 0.2078431, 1, 0, 1,
-0.5621321, -0.5098287, -0.5194253, 0.2, 1, 0, 1,
-0.5616228, -1.202461, -2.277948, 0.1921569, 1, 0, 1,
-0.5580899, -0.7825607, -5.096181, 0.1882353, 1, 0, 1,
-0.557355, 0.2343251, -1.546172, 0.1803922, 1, 0, 1,
-0.5549134, -0.3151673, -2.155757, 0.1764706, 1, 0, 1,
-0.5524612, 0.8762555, 0.2551551, 0.1686275, 1, 0, 1,
-0.5516169, 1.14919, -0.2957799, 0.1647059, 1, 0, 1,
-0.5472507, 0.6137372, -1.092232, 0.1568628, 1, 0, 1,
-0.5460669, -0.5095416, -3.497831, 0.1529412, 1, 0, 1,
-0.5421309, 0.6150157, 1.55542, 0.145098, 1, 0, 1,
-0.5352554, 1.575317, 1.814767, 0.1411765, 1, 0, 1,
-0.5341023, -1.27724, -1.896223, 0.1333333, 1, 0, 1,
-0.5315196, 0.9301814, 1.123226, 0.1294118, 1, 0, 1,
-0.5228614, -0.5495455, -0.8090498, 0.1215686, 1, 0, 1,
-0.5212817, 0.7429827, 0.6634075, 0.1176471, 1, 0, 1,
-0.5211271, -0.4292789, -3.338662, 0.1098039, 1, 0, 1,
-0.5202462, -1.35703, -3.158242, 0.1058824, 1, 0, 1,
-0.5175316, 0.6742206, -1.2973, 0.09803922, 1, 0, 1,
-0.5100564, 0.5798023, -0.8259869, 0.09019608, 1, 0, 1,
-0.5091594, 1.500876, 0.3032905, 0.08627451, 1, 0, 1,
-0.5043663, -2.231414, -3.227479, 0.07843138, 1, 0, 1,
-0.5025862, 1.578344, 0.4808726, 0.07450981, 1, 0, 1,
-0.5002235, -0.3276987, -1.990521, 0.06666667, 1, 0, 1,
-0.4999048, -0.8594133, -3.518982, 0.0627451, 1, 0, 1,
-0.4998333, -1.080384, -2.339734, 0.05490196, 1, 0, 1,
-0.4993252, -1.278727, -1.391803, 0.05098039, 1, 0, 1,
-0.4991167, 0.7249135, -0.961684, 0.04313726, 1, 0, 1,
-0.4941669, -0.747934, -3.081938, 0.03921569, 1, 0, 1,
-0.4869395, -0.9246073, -3.399155, 0.03137255, 1, 0, 1,
-0.4843518, -0.7721727, -1.34948, 0.02745098, 1, 0, 1,
-0.4803596, -1.803052, -3.900619, 0.01960784, 1, 0, 1,
-0.4787696, 1.218916, -2.005059, 0.01568628, 1, 0, 1,
-0.4753587, 0.9908953, -0.2437265, 0.007843138, 1, 0, 1,
-0.4741335, -0.6039802, -1.942178, 0.003921569, 1, 0, 1,
-0.469805, -0.581241, -1.17315, 0, 1, 0.003921569, 1,
-0.4695769, 0.790013, -1.621859, 0, 1, 0.01176471, 1,
-0.4682233, 0.5274419, -1.032463, 0, 1, 0.01568628, 1,
-0.4675365, 0.670718, 0.4182619, 0, 1, 0.02352941, 1,
-0.466495, -1.320375, -3.565787, 0, 1, 0.02745098, 1,
-0.4633833, -0.7087589, -3.521038, 0, 1, 0.03529412, 1,
-0.462828, -2.029617, -2.16326, 0, 1, 0.03921569, 1,
-0.4609296, 0.8670409, -1.189433, 0, 1, 0.04705882, 1,
-0.4576411, -0.09297562, -0.3342784, 0, 1, 0.05098039, 1,
-0.4510714, -0.08200292, -0.8747878, 0, 1, 0.05882353, 1,
-0.4480102, 0.71131, -1.147076, 0, 1, 0.0627451, 1,
-0.4471679, -0.4652205, -1.46468, 0, 1, 0.07058824, 1,
-0.4459506, 0.2981993, -1.819895, 0, 1, 0.07450981, 1,
-0.4427043, -0.4289368, -3.987001, 0, 1, 0.08235294, 1,
-0.4415464, -0.6074184, -0.7972999, 0, 1, 0.08627451, 1,
-0.4364208, -0.06779212, -1.443801, 0, 1, 0.09411765, 1,
-0.4357519, -0.1640026, -3.739331, 0, 1, 0.1019608, 1,
-0.4348845, -1.793455, -2.592683, 0, 1, 0.1058824, 1,
-0.4327641, 0.7090607, 0.4455985, 0, 1, 0.1137255, 1,
-0.4317867, 1.575092, -0.2545247, 0, 1, 0.1176471, 1,
-0.4305408, 0.4001645, -0.7260499, 0, 1, 0.1254902, 1,
-0.4254355, 0.8059609, -0.9663762, 0, 1, 0.1294118, 1,
-0.4206538, 0.2865803, -2.648217, 0, 1, 0.1372549, 1,
-0.4202613, -0.3843159, -1.974881, 0, 1, 0.1411765, 1,
-0.4192598, 0.4649127, -0.6932452, 0, 1, 0.1490196, 1,
-0.4186366, 0.9063762, -0.6547118, 0, 1, 0.1529412, 1,
-0.4162365, 0.9480688, -0.3521203, 0, 1, 0.1607843, 1,
-0.4156682, 0.4883222, -0.6110719, 0, 1, 0.1647059, 1,
-0.4145992, 0.8826634, -1.012157, 0, 1, 0.172549, 1,
-0.4092253, 0.5785578, -0.2012625, 0, 1, 0.1764706, 1,
-0.4073941, 1.854458, 0.5747803, 0, 1, 0.1843137, 1,
-0.403241, 1.567561, -0.4937215, 0, 1, 0.1882353, 1,
-0.4015688, 1.297692, -0.8303272, 0, 1, 0.1960784, 1,
-0.401189, 0.7357576, -0.5271543, 0, 1, 0.2039216, 1,
-0.3968229, 0.5701128, -0.07536268, 0, 1, 0.2078431, 1,
-0.3903936, -0.03443393, -1.50841, 0, 1, 0.2156863, 1,
-0.3864847, 1.392372, 0.943009, 0, 1, 0.2196078, 1,
-0.3848292, 0.9853045, -0.4750882, 0, 1, 0.227451, 1,
-0.384191, -0.8280652, -6.015159, 0, 1, 0.2313726, 1,
-0.3788957, -0.2099495, -0.7440497, 0, 1, 0.2392157, 1,
-0.378189, -1.005915, -2.498183, 0, 1, 0.2431373, 1,
-0.3772282, -1.33068, -2.831248, 0, 1, 0.2509804, 1,
-0.3755138, -0.5152718, -3.79566, 0, 1, 0.254902, 1,
-0.3747658, 0.849444, -0.3251318, 0, 1, 0.2627451, 1,
-0.3731693, 0.5061327, -1.183903, 0, 1, 0.2666667, 1,
-0.3719994, 1.060495, -0.1320521, 0, 1, 0.2745098, 1,
-0.3702672, 0.3090381, -0.1358139, 0, 1, 0.2784314, 1,
-0.369969, 0.6143796, -0.07815071, 0, 1, 0.2862745, 1,
-0.3692287, -0.2003013, -2.15592, 0, 1, 0.2901961, 1,
-0.3679332, -1.603482, -2.815836, 0, 1, 0.2980392, 1,
-0.3652624, -1.553745, -2.021688, 0, 1, 0.3058824, 1,
-0.3620021, 0.1812773, 0.0326774, 0, 1, 0.3098039, 1,
-0.3618022, -0.8602748, -1.986374, 0, 1, 0.3176471, 1,
-0.3599434, 0.8089119, 0.3597762, 0, 1, 0.3215686, 1,
-0.3562141, 0.9154083, 0.07956666, 0, 1, 0.3294118, 1,
-0.3532712, 0.5350456, -2.208985, 0, 1, 0.3333333, 1,
-0.3524533, 0.2320468, -1.522421, 0, 1, 0.3411765, 1,
-0.3519746, 0.6940677, 0.4773593, 0, 1, 0.345098, 1,
-0.3491165, 0.06676927, -1.448422, 0, 1, 0.3529412, 1,
-0.3476396, 1.759231, 1.334877, 0, 1, 0.3568628, 1,
-0.3459472, 0.9933136, -0.4289531, 0, 1, 0.3647059, 1,
-0.3440663, -0.08859542, -0.9314218, 0, 1, 0.3686275, 1,
-0.343976, 0.5782886, -1.718473, 0, 1, 0.3764706, 1,
-0.3430689, 0.183246, -2.343669, 0, 1, 0.3803922, 1,
-0.3328383, -0.5219638, -3.155456, 0, 1, 0.3882353, 1,
-0.3317387, -3.04553, -2.241229, 0, 1, 0.3921569, 1,
-0.3292499, -0.8518468, -2.520007, 0, 1, 0.4, 1,
-0.3177813, -0.5270318, -2.839417, 0, 1, 0.4078431, 1,
-0.3177648, -0.1334813, -1.709837, 0, 1, 0.4117647, 1,
-0.3176328, 0.7350133, -0.5648253, 0, 1, 0.4196078, 1,
-0.3149188, 0.3220442, -1.770591, 0, 1, 0.4235294, 1,
-0.3131726, -1.352961, -4.940406, 0, 1, 0.4313726, 1,
-0.3127114, 1.434194, -0.2700035, 0, 1, 0.4352941, 1,
-0.3120742, 0.1367532, -1.905158, 0, 1, 0.4431373, 1,
-0.3036037, -0.6615833, -3.259418, 0, 1, 0.4470588, 1,
-0.2987595, -0.3924398, -0.4763873, 0, 1, 0.454902, 1,
-0.2944745, -0.3878495, -2.742266, 0, 1, 0.4588235, 1,
-0.2936983, -1.116019, -1.112879, 0, 1, 0.4666667, 1,
-0.2920671, 0.5362196, -0.4784636, 0, 1, 0.4705882, 1,
-0.2895704, 0.7638623, 0.4858643, 0, 1, 0.4784314, 1,
-0.2894045, 0.2566378, 0.2558098, 0, 1, 0.4823529, 1,
-0.2884436, 0.06837276, -1.175707, 0, 1, 0.4901961, 1,
-0.2856957, -0.2266665, -1.507755, 0, 1, 0.4941176, 1,
-0.2837581, 0.08584412, -1.769429, 0, 1, 0.5019608, 1,
-0.2794376, 0.001464062, -1.330382, 0, 1, 0.509804, 1,
-0.2789799, -0.4021183, -1.496866, 0, 1, 0.5137255, 1,
-0.2756462, 1.539965, -1.049823, 0, 1, 0.5215687, 1,
-0.2750181, 0.3325181, -0.700671, 0, 1, 0.5254902, 1,
-0.2730214, -2.134586, -2.021368, 0, 1, 0.5333334, 1,
-0.2715096, -1.78081, -0.8454615, 0, 1, 0.5372549, 1,
-0.2696222, -1.262267, -3.046593, 0, 1, 0.5450981, 1,
-0.2661475, 0.9313906, 0.06459332, 0, 1, 0.5490196, 1,
-0.2615641, -1.30642, -1.837347, 0, 1, 0.5568628, 1,
-0.2582408, -0.1530154, -4.13844, 0, 1, 0.5607843, 1,
-0.2553737, -0.5262574, -1.920007, 0, 1, 0.5686275, 1,
-0.2514003, -0.3822551, -3.164147, 0, 1, 0.572549, 1,
-0.2495704, 0.6289428, -0.6117179, 0, 1, 0.5803922, 1,
-0.2488468, 2.036233, 0.5280344, 0, 1, 0.5843138, 1,
-0.247306, 1.113884, -1.245742, 0, 1, 0.5921569, 1,
-0.2450678, 1.103146, 1.67275, 0, 1, 0.5960785, 1,
-0.2423602, -1.182442, -0.7287806, 0, 1, 0.6039216, 1,
-0.2423219, 0.1503696, -1.029613, 0, 1, 0.6117647, 1,
-0.2419013, -2.065074, -2.957926, 0, 1, 0.6156863, 1,
-0.2398093, -1.517189, -2.563837, 0, 1, 0.6235294, 1,
-0.2390231, 0.1089576, -2.072029, 0, 1, 0.627451, 1,
-0.2361353, 0.3454939, -0.5107629, 0, 1, 0.6352941, 1,
-0.2353935, 0.1292707, -1.628377, 0, 1, 0.6392157, 1,
-0.2341128, 0.1890572, 0.2699616, 0, 1, 0.6470588, 1,
-0.2305581, -0.07586575, -1.695833, 0, 1, 0.6509804, 1,
-0.2294018, -2.090811, -2.824039, 0, 1, 0.6588235, 1,
-0.2185047, -0.5700907, -3.21578, 0, 1, 0.6627451, 1,
-0.2171977, -2.211601, -3.865841, 0, 1, 0.6705883, 1,
-0.2163463, 0.962396, 0.4710606, 0, 1, 0.6745098, 1,
-0.2155899, 1.644822, 1.253845, 0, 1, 0.682353, 1,
-0.206533, -1.489807, -2.749802, 0, 1, 0.6862745, 1,
-0.2060933, 0.9030547, -0.1774711, 0, 1, 0.6941177, 1,
-0.2026391, 0.2658303, -1.81928, 0, 1, 0.7019608, 1,
-0.2011718, -0.1845342, -2.570021, 0, 1, 0.7058824, 1,
-0.1996681, 0.450818, -0.3411792, 0, 1, 0.7137255, 1,
-0.1967407, 1.162322, 0.2201414, 0, 1, 0.7176471, 1,
-0.1893272, -0.649563, -2.317581, 0, 1, 0.7254902, 1,
-0.1888326, -1.183513, -3.596119, 0, 1, 0.7294118, 1,
-0.1882566, -0.1454527, -2.945796, 0, 1, 0.7372549, 1,
-0.185008, 0.9231143, -0.6610907, 0, 1, 0.7411765, 1,
-0.184187, 1.370322, -1.603253, 0, 1, 0.7490196, 1,
-0.1730665, 0.09218868, -1.304666, 0, 1, 0.7529412, 1,
-0.1702671, -0.8762279, -2.905326, 0, 1, 0.7607843, 1,
-0.1670514, 0.8225196, -0.6239818, 0, 1, 0.7647059, 1,
-0.1667955, 1.291437, -0.7027705, 0, 1, 0.772549, 1,
-0.1651897, 2.701218, 0.5368859, 0, 1, 0.7764706, 1,
-0.1628176, -0.1556206, -2.039655, 0, 1, 0.7843137, 1,
-0.1505804, 0.1561145, 0.534923, 0, 1, 0.7882353, 1,
-0.1493091, -0.9681497, -4.700691, 0, 1, 0.7960784, 1,
-0.1477405, 0.7634601, -1.654149, 0, 1, 0.8039216, 1,
-0.1415818, -0.8838945, -1.991539, 0, 1, 0.8078431, 1,
-0.1364992, 0.2164482, 0.08981546, 0, 1, 0.8156863, 1,
-0.1319674, -1.189312, -3.76417, 0, 1, 0.8196079, 1,
-0.1319411, 2.074446, -1.476039, 0, 1, 0.827451, 1,
-0.1285728, -0.6813373, -2.67115, 0, 1, 0.8313726, 1,
-0.1285499, 0.2147788, -0.6614919, 0, 1, 0.8392157, 1,
-0.1259675, 0.2290174, -0.3431878, 0, 1, 0.8431373, 1,
-0.1250863, -1.98068, -2.780195, 0, 1, 0.8509804, 1,
-0.1223489, 1.967246, 0.3333544, 0, 1, 0.854902, 1,
-0.1207996, -1.352244, -2.450079, 0, 1, 0.8627451, 1,
-0.1125704, -1.490047, -4.68577, 0, 1, 0.8666667, 1,
-0.1104755, 0.1870017, -1.274503, 0, 1, 0.8745098, 1,
-0.09488619, -0.1552154, -5.029995, 0, 1, 0.8784314, 1,
-0.09477095, 1.877221, -0.3024307, 0, 1, 0.8862745, 1,
-0.09414963, 0.2398736, -0.4731216, 0, 1, 0.8901961, 1,
-0.09321763, 1.010756, -0.3824553, 0, 1, 0.8980392, 1,
-0.09104091, 0.4194292, 0.5204294, 0, 1, 0.9058824, 1,
-0.09090719, 1.065007, 1.060497, 0, 1, 0.9098039, 1,
-0.08990901, -0.3300449, -4.000228, 0, 1, 0.9176471, 1,
-0.08867683, -1.144415, -2.076102, 0, 1, 0.9215686, 1,
-0.08561902, 0.6489103, -0.09888762, 0, 1, 0.9294118, 1,
-0.08482689, 0.2009037, 0.2330847, 0, 1, 0.9333333, 1,
-0.08162459, 0.2662703, -0.2683845, 0, 1, 0.9411765, 1,
-0.07675942, 0.6193815, -0.6322501, 0, 1, 0.945098, 1,
-0.07429039, 1.976239, -0.3723568, 0, 1, 0.9529412, 1,
-0.07325194, -0.8429729, -3.600945, 0, 1, 0.9568627, 1,
-0.06918567, -0.4291979, -4.31821, 0, 1, 0.9647059, 1,
-0.06872182, 0.7981511, 0.2230125, 0, 1, 0.9686275, 1,
-0.06829234, -0.2416229, -4.86117, 0, 1, 0.9764706, 1,
-0.0662694, 0.8747298, -0.5730498, 0, 1, 0.9803922, 1,
-0.0648363, -1.419289, -3.816742, 0, 1, 0.9882353, 1,
-0.06194932, -0.8572896, -4.600646, 0, 1, 0.9921569, 1,
-0.05776589, -0.01795083, -0.4982525, 0, 1, 1, 1,
-0.05558005, -1.461806, -2.130035, 0, 0.9921569, 1, 1,
-0.05382863, -0.4643552, -2.987344, 0, 0.9882353, 1, 1,
-0.05033936, 1.380219, 0.7085043, 0, 0.9803922, 1, 1,
-0.04599439, 0.417076, 0.8681753, 0, 0.9764706, 1, 1,
-0.04557124, -1.058039, -4.888237, 0, 0.9686275, 1, 1,
-0.03863551, -0.894262, -3.204139, 0, 0.9647059, 1, 1,
-0.03719178, 1.87532, 1.530369, 0, 0.9568627, 1, 1,
-0.03465879, -0.05955698, -2.129583, 0, 0.9529412, 1, 1,
-0.03385259, -1.194512, -2.903873, 0, 0.945098, 1, 1,
-0.03194119, 0.4653556, 0.5944611, 0, 0.9411765, 1, 1,
-0.02848271, 0.06404927, 0.182006, 0, 0.9333333, 1, 1,
-0.02757966, 1.592659, -2.055991, 0, 0.9294118, 1, 1,
-0.0263447, 0.8906275, -0.2873353, 0, 0.9215686, 1, 1,
-0.01904423, 0.2723534, -1.219014, 0, 0.9176471, 1, 1,
-0.01817088, 1.294426, -0.3820065, 0, 0.9098039, 1, 1,
-0.01606645, 0.5149444, 0.8661546, 0, 0.9058824, 1, 1,
-0.01396325, -0.9739086, -2.199241, 0, 0.8980392, 1, 1,
-0.01093591, -0.3126565, -3.592291, 0, 0.8901961, 1, 1,
-0.009276406, -1.271132, -0.6887556, 0, 0.8862745, 1, 1,
-0.007330978, 0.5936192, 1.843636, 0, 0.8784314, 1, 1,
-0.00687839, -1.243328, -2.737513, 0, 0.8745098, 1, 1,
-0.006592124, -1.296912, -4.351942, 0, 0.8666667, 1, 1,
-0.005457852, -0.3386019, -3.347424, 0, 0.8627451, 1, 1,
0.007273992, -0.8257057, 3.472316, 0, 0.854902, 1, 1,
0.008445216, -0.4020691, 5.435086, 0, 0.8509804, 1, 1,
0.009077251, -0.9253095, 2.75147, 0, 0.8431373, 1, 1,
0.009549713, -3.717324, 4.155481, 0, 0.8392157, 1, 1,
0.009972139, 1.777947, 1.410085, 0, 0.8313726, 1, 1,
0.01465057, -0.3350251, 2.227573, 0, 0.827451, 1, 1,
0.01563515, -1.416279, 5.177686, 0, 0.8196079, 1, 1,
0.0187122, 0.5547172, 1.342755, 0, 0.8156863, 1, 1,
0.02212421, -1.020334, 3.956889, 0, 0.8078431, 1, 1,
0.02621539, 1.172127, -0.8789083, 0, 0.8039216, 1, 1,
0.02721563, 0.1841988, 1.165726, 0, 0.7960784, 1, 1,
0.02927666, 1.470223, -0.7801214, 0, 0.7882353, 1, 1,
0.03262741, -1.832185, 2.694008, 0, 0.7843137, 1, 1,
0.03318004, 0.2243159, 0.09166157, 0, 0.7764706, 1, 1,
0.03375831, 0.4529808, -0.09995779, 0, 0.772549, 1, 1,
0.03613987, 0.3044375, 0.1462648, 0, 0.7647059, 1, 1,
0.03871318, -0.01602328, 2.666968, 0, 0.7607843, 1, 1,
0.04441807, 0.08881806, -0.3929674, 0, 0.7529412, 1, 1,
0.04569452, -0.5168658, 2.561862, 0, 0.7490196, 1, 1,
0.05394321, -0.04616214, 3.436418, 0, 0.7411765, 1, 1,
0.05541075, -0.3451406, 3.01224, 0, 0.7372549, 1, 1,
0.05808823, 1.034193, -0.6395132, 0, 0.7294118, 1, 1,
0.06525291, 0.06533208, 1.982423, 0, 0.7254902, 1, 1,
0.06551572, -1.411343, 1.545584, 0, 0.7176471, 1, 1,
0.0686339, 0.2715833, 1.400365, 0, 0.7137255, 1, 1,
0.06892838, 0.0743405, 1.092396, 0, 0.7058824, 1, 1,
0.07066409, 0.2836862, -0.08031915, 0, 0.6980392, 1, 1,
0.07271823, 1.01212, -1.096427, 0, 0.6941177, 1, 1,
0.08163308, -0.09465802, 1.994588, 0, 0.6862745, 1, 1,
0.08279434, 0.4213225, 1.219922, 0, 0.682353, 1, 1,
0.08366329, 0.9751061, 0.1585754, 0, 0.6745098, 1, 1,
0.09198585, -0.5487699, 2.81918, 0, 0.6705883, 1, 1,
0.1045083, 0.4944577, -0.3776853, 0, 0.6627451, 1, 1,
0.104766, -1.511885, 3.951345, 0, 0.6588235, 1, 1,
0.1061335, 0.3654879, -0.3429087, 0, 0.6509804, 1, 1,
0.1077753, 0.7440565, -1.128126, 0, 0.6470588, 1, 1,
0.1080979, -0.8964465, 3.105954, 0, 0.6392157, 1, 1,
0.1084386, -0.4912232, 2.486341, 0, 0.6352941, 1, 1,
0.114098, 0.2205452, 1.188197, 0, 0.627451, 1, 1,
0.1162924, -0.04086359, 2.114232, 0, 0.6235294, 1, 1,
0.1169624, -0.2685017, 4.851745, 0, 0.6156863, 1, 1,
0.1175295, -0.9626167, 4.800107, 0, 0.6117647, 1, 1,
0.1196444, -0.4458524, 4.480541, 0, 0.6039216, 1, 1,
0.1229848, 0.05084748, -0.628801, 0, 0.5960785, 1, 1,
0.1234046, -0.2985335, 0.9049231, 0, 0.5921569, 1, 1,
0.1300606, -0.2743903, 3.143895, 0, 0.5843138, 1, 1,
0.1349958, 1.357568, 0.4917278, 0, 0.5803922, 1, 1,
0.1392825, 1.299823, 1.278908, 0, 0.572549, 1, 1,
0.1411476, 1.066604, -0.4512765, 0, 0.5686275, 1, 1,
0.1412435, 0.6379054, 1.087678, 0, 0.5607843, 1, 1,
0.1445902, -0.4615642, 2.248173, 0, 0.5568628, 1, 1,
0.1507684, 0.04132472, 0.5012875, 0, 0.5490196, 1, 1,
0.1511289, 0.03349212, 1.706589, 0, 0.5450981, 1, 1,
0.1521472, 0.5697178, 1.397741, 0, 0.5372549, 1, 1,
0.1547927, 1.514934, -1.081389, 0, 0.5333334, 1, 1,
0.156861, -0.2687809, 3.019189, 0, 0.5254902, 1, 1,
0.1599985, -0.5795912, 4.848501, 0, 0.5215687, 1, 1,
0.1612728, 0.9142371, 0.07139788, 0, 0.5137255, 1, 1,
0.162984, -1.17794, 4.042826, 0, 0.509804, 1, 1,
0.1665567, 0.578036, -0.2598354, 0, 0.5019608, 1, 1,
0.1678073, 0.7174342, -0.0687236, 0, 0.4941176, 1, 1,
0.1691016, -1.870402, 3.188686, 0, 0.4901961, 1, 1,
0.1717601, 0.1607515, 1.811452, 0, 0.4823529, 1, 1,
0.1721487, 0.8264219, 0.5109547, 0, 0.4784314, 1, 1,
0.1773446, -1.422982, 2.311589, 0, 0.4705882, 1, 1,
0.1783261, -0.9161237, 1.955637, 0, 0.4666667, 1, 1,
0.1799554, -0.7239721, 3.711102, 0, 0.4588235, 1, 1,
0.1808604, -0.2223673, 2.616482, 0, 0.454902, 1, 1,
0.1883107, 0.5015997, -0.1930034, 0, 0.4470588, 1, 1,
0.1914603, 0.3233325, 0.3180152, 0, 0.4431373, 1, 1,
0.1915255, 0.06752498, 2.968609, 0, 0.4352941, 1, 1,
0.1916172, 0.04377267, 0.02790362, 0, 0.4313726, 1, 1,
0.1921293, -0.6511083, 2.795958, 0, 0.4235294, 1, 1,
0.1945194, 0.6175735, 1.287125, 0, 0.4196078, 1, 1,
0.1980284, 0.1474238, 0.09816141, 0, 0.4117647, 1, 1,
0.2012618, 2.257966, -0.9076205, 0, 0.4078431, 1, 1,
0.2051388, 0.2310966, 1.2729, 0, 0.4, 1, 1,
0.2055123, -1.822287, 4.48324, 0, 0.3921569, 1, 1,
0.2061509, -0.7832265, 4.30701, 0, 0.3882353, 1, 1,
0.2069596, -1.429705, 0.8909161, 0, 0.3803922, 1, 1,
0.2092592, -0.576041, 1.332661, 0, 0.3764706, 1, 1,
0.2109177, 1.809896, -0.007419302, 0, 0.3686275, 1, 1,
0.2122522, -0.3785506, 2.526229, 0, 0.3647059, 1, 1,
0.2126332, -0.6046531, 4.211073, 0, 0.3568628, 1, 1,
0.2214824, -1.785974, 3.286549, 0, 0.3529412, 1, 1,
0.2250409, -0.2802143, 3.348111, 0, 0.345098, 1, 1,
0.2258968, -1.919955, 2.714474, 0, 0.3411765, 1, 1,
0.2259979, -0.7113717, 2.710855, 0, 0.3333333, 1, 1,
0.2295106, -1.164743, 1.814347, 0, 0.3294118, 1, 1,
0.2317327, 0.836489, -0.3045883, 0, 0.3215686, 1, 1,
0.2512321, 1.216369, -0.2713242, 0, 0.3176471, 1, 1,
0.2543866, 0.1918227, 1.063044, 0, 0.3098039, 1, 1,
0.2555721, -1.102206, 2.15295, 0, 0.3058824, 1, 1,
0.2561343, -1.385385, 1.342427, 0, 0.2980392, 1, 1,
0.2588805, -0.9285527, 2.931257, 0, 0.2901961, 1, 1,
0.2608804, 0.6366534, -0.728321, 0, 0.2862745, 1, 1,
0.2618792, 0.4982212, -0.1520634, 0, 0.2784314, 1, 1,
0.2655299, 0.3384808, 0.5828839, 0, 0.2745098, 1, 1,
0.2756039, -0.2198298, 2.879465, 0, 0.2666667, 1, 1,
0.2771633, -0.9967451, 3.653436, 0, 0.2627451, 1, 1,
0.2781045, 1.875599, -0.2248891, 0, 0.254902, 1, 1,
0.2790884, 1.095604, -0.204053, 0, 0.2509804, 1, 1,
0.2803061, -1.486823, 3.498819, 0, 0.2431373, 1, 1,
0.2831744, -0.2902992, 1.72801, 0, 0.2392157, 1, 1,
0.2834924, 0.3561408, 2.142192, 0, 0.2313726, 1, 1,
0.2853776, 0.7827625, 0.6757374, 0, 0.227451, 1, 1,
0.2854056, -1.881613, 2.730458, 0, 0.2196078, 1, 1,
0.286525, -0.6908267, 2.381454, 0, 0.2156863, 1, 1,
0.2882057, 0.2520026, -2.245856, 0, 0.2078431, 1, 1,
0.2885243, 0.06192951, 2.918462, 0, 0.2039216, 1, 1,
0.2911694, -1.217412, 2.798569, 0, 0.1960784, 1, 1,
0.2940301, -1.781821, 4.986402, 0, 0.1882353, 1, 1,
0.2952117, 1.439999, 1.121561, 0, 0.1843137, 1, 1,
0.2958739, -0.01524658, -0.1163937, 0, 0.1764706, 1, 1,
0.2968446, 0.7808803, 0.006305387, 0, 0.172549, 1, 1,
0.3017119, 1.926059, 0.6289923, 0, 0.1647059, 1, 1,
0.3054778, -0.2328221, 2.838597, 0, 0.1607843, 1, 1,
0.3084773, -0.4863354, 0.1322744, 0, 0.1529412, 1, 1,
0.3120694, -0.5469674, 0.9775542, 0, 0.1490196, 1, 1,
0.316917, 0.03253393, 0.6900402, 0, 0.1411765, 1, 1,
0.3214022, -1.555655, 3.354006, 0, 0.1372549, 1, 1,
0.3241065, -1.652079, 2.910038, 0, 0.1294118, 1, 1,
0.3243636, -0.7253205, 2.88027, 0, 0.1254902, 1, 1,
0.3269675, 1.626233, 0.3768997, 0, 0.1176471, 1, 1,
0.3300953, -0.2735055, 1.109434, 0, 0.1137255, 1, 1,
0.3309384, 1.138767, 1.113506, 0, 0.1058824, 1, 1,
0.334028, -1.060662, 2.716332, 0, 0.09803922, 1, 1,
0.3347029, 1.200295, -0.5380213, 0, 0.09411765, 1, 1,
0.3380317, -0.6793919, 1.503405, 0, 0.08627451, 1, 1,
0.3398704, 0.1152996, 2.859809, 0, 0.08235294, 1, 1,
0.3399757, -0.3398363, 1.54693, 0, 0.07450981, 1, 1,
0.3401163, 0.1007299, 2.736294, 0, 0.07058824, 1, 1,
0.3416589, -1.154521, 1.4713, 0, 0.0627451, 1, 1,
0.3426695, 0.2563899, 0.7775995, 0, 0.05882353, 1, 1,
0.3429425, 1.397471, -0.3584931, 0, 0.05098039, 1, 1,
0.3477405, -2.000819, 2.941746, 0, 0.04705882, 1, 1,
0.3495864, 0.02665802, -0.4039085, 0, 0.03921569, 1, 1,
0.353552, -0.2891582, 2.50112, 0, 0.03529412, 1, 1,
0.3538237, 0.7149886, 0.7224588, 0, 0.02745098, 1, 1,
0.3567906, 1.660038, 1.45973, 0, 0.02352941, 1, 1,
0.3578985, -0.2090042, 0.957993, 0, 0.01568628, 1, 1,
0.3589056, 0.8813561, 0.09388831, 0, 0.01176471, 1, 1,
0.3605989, -0.12449, 1.247972, 0, 0.003921569, 1, 1,
0.3611391, -1.023185, 3.483416, 0.003921569, 0, 1, 1,
0.3635862, -0.3489709, 2.318017, 0.007843138, 0, 1, 1,
0.3662796, -0.07224485, 0.9841103, 0.01568628, 0, 1, 1,
0.3671324, -1.432513, 3.168746, 0.01960784, 0, 1, 1,
0.3766108, 0.4262268, 0.1833872, 0.02745098, 0, 1, 1,
0.3776855, 0.1442437, 0.5467193, 0.03137255, 0, 1, 1,
0.3787372, 0.7381914, -1.115621, 0.03921569, 0, 1, 1,
0.3807157, -0.6758917, 1.969681, 0.04313726, 0, 1, 1,
0.3824703, -0.6359804, 2.870654, 0.05098039, 0, 1, 1,
0.3841966, -1.002798, 2.083136, 0.05490196, 0, 1, 1,
0.3844394, -0.4755666, 4.42029, 0.0627451, 0, 1, 1,
0.3850981, 0.05162914, 2.692648, 0.06666667, 0, 1, 1,
0.3874637, -0.6912205, 3.042939, 0.07450981, 0, 1, 1,
0.3880458, -1.645704, 3.12464, 0.07843138, 0, 1, 1,
0.3887355, -1.490597, 1.897739, 0.08627451, 0, 1, 1,
0.3920561, -0.9229761, 4.469117, 0.09019608, 0, 1, 1,
0.3933303, 0.3392067, 1.706814, 0.09803922, 0, 1, 1,
0.394786, 0.8933166, 0.256825, 0.1058824, 0, 1, 1,
0.3994995, -1.445167, 2.640554, 0.1098039, 0, 1, 1,
0.4012377, -0.5960715, 4.023544, 0.1176471, 0, 1, 1,
0.4029296, -1.67528, 3.716302, 0.1215686, 0, 1, 1,
0.4046456, -0.7562183, 3.156893, 0.1294118, 0, 1, 1,
0.4066352, 0.6815104, 0.8337233, 0.1333333, 0, 1, 1,
0.4073688, -0.6546552, 0.2749183, 0.1411765, 0, 1, 1,
0.4087457, 1.746756, 1.167777, 0.145098, 0, 1, 1,
0.4124872, -2.252031, 3.192573, 0.1529412, 0, 1, 1,
0.4160741, 0.5718151, 0.1466426, 0.1568628, 0, 1, 1,
0.4211739, -0.7246487, 2.208947, 0.1647059, 0, 1, 1,
0.4245064, -0.01578869, 2.263978, 0.1686275, 0, 1, 1,
0.4266436, -0.2247612, 1.649102, 0.1764706, 0, 1, 1,
0.427286, 1.637014, 0.5264795, 0.1803922, 0, 1, 1,
0.4281951, 0.3431812, -0.4383357, 0.1882353, 0, 1, 1,
0.432768, 0.8378441, 0.4441667, 0.1921569, 0, 1, 1,
0.4366944, -0.7726862, 4.739266, 0.2, 0, 1, 1,
0.4384292, -0.09829051, -0.3513895, 0.2078431, 0, 1, 1,
0.4425104, -0.4999965, 1.694776, 0.2117647, 0, 1, 1,
0.4434174, -0.2659489, 1.98942, 0.2196078, 0, 1, 1,
0.4466559, -0.3509341, -0.2237249, 0.2235294, 0, 1, 1,
0.4472041, 0.4319765, 0.3933099, 0.2313726, 0, 1, 1,
0.450827, 0.4445547, 1.667535, 0.2352941, 0, 1, 1,
0.4511604, -0.862193, 2.374912, 0.2431373, 0, 1, 1,
0.4537909, 0.3180492, 0.8516063, 0.2470588, 0, 1, 1,
0.4552459, -1.946181, 3.87113, 0.254902, 0, 1, 1,
0.4569763, -0.2971799, 1.622232, 0.2588235, 0, 1, 1,
0.459782, -0.3343709, 2.250844, 0.2666667, 0, 1, 1,
0.4679119, -2.318967, 3.685053, 0.2705882, 0, 1, 1,
0.4688772, -0.7258927, 2.678382, 0.2784314, 0, 1, 1,
0.4732401, 1.111616, 2.366198, 0.282353, 0, 1, 1,
0.477222, -0.6567259, 2.574999, 0.2901961, 0, 1, 1,
0.4807786, 2.267587, -0.7931436, 0.2941177, 0, 1, 1,
0.4809539, 0.7091658, -1.254068, 0.3019608, 0, 1, 1,
0.485324, -0.9701272, 2.55124, 0.3098039, 0, 1, 1,
0.4884129, -0.8349848, 2.172757, 0.3137255, 0, 1, 1,
0.489069, 3.200714, 0.5518171, 0.3215686, 0, 1, 1,
0.4946619, -0.6119844, 1.409824, 0.3254902, 0, 1, 1,
0.500048, -0.7495559, 2.200499, 0.3333333, 0, 1, 1,
0.5039464, -0.3610837, 2.391229, 0.3372549, 0, 1, 1,
0.5043581, -0.1419062, 0.2970365, 0.345098, 0, 1, 1,
0.5060896, 0.5220582, 0.5359047, 0.3490196, 0, 1, 1,
0.5126524, -0.1856264, 2.466897, 0.3568628, 0, 1, 1,
0.5160125, 0.49986, 1.391301, 0.3607843, 0, 1, 1,
0.5174438, 0.461407, 0.7752033, 0.3686275, 0, 1, 1,
0.5216695, 1.028066, 1.574246, 0.372549, 0, 1, 1,
0.5238712, 0.2034317, 2.21858, 0.3803922, 0, 1, 1,
0.5255451, -0.5130864, 0.09470303, 0.3843137, 0, 1, 1,
0.5323271, 0.021667, 1.345953, 0.3921569, 0, 1, 1,
0.5355791, -0.2998794, 1.919123, 0.3960784, 0, 1, 1,
0.5407166, 1.551916, -0.8456509, 0.4039216, 0, 1, 1,
0.5431198, -1.02721, 2.775627, 0.4117647, 0, 1, 1,
0.5448588, 0.297133, 0.4310288, 0.4156863, 0, 1, 1,
0.5465785, -0.7696725, 2.8824, 0.4235294, 0, 1, 1,
0.5539109, -0.8846762, 4.026246, 0.427451, 0, 1, 1,
0.5573248, -0.05343017, 1.534349, 0.4352941, 0, 1, 1,
0.5593399, -0.1202559, 3.237759, 0.4392157, 0, 1, 1,
0.5626374, -0.9374896, 3.177032, 0.4470588, 0, 1, 1,
0.5690522, -0.3173553, 2.146162, 0.4509804, 0, 1, 1,
0.5691081, 1.148687, 0.5114021, 0.4588235, 0, 1, 1,
0.5696412, 0.6304258, 3.060939, 0.4627451, 0, 1, 1,
0.5734367, 0.4769, 1.038603, 0.4705882, 0, 1, 1,
0.5734409, 1.977206, -0.5487582, 0.4745098, 0, 1, 1,
0.5742995, 2.149149, 0.4351561, 0.4823529, 0, 1, 1,
0.5748558, -0.2317742, 2.829766, 0.4862745, 0, 1, 1,
0.5752729, -0.9710628, 2.097405, 0.4941176, 0, 1, 1,
0.5820208, 2.009192, -0.01368917, 0.5019608, 0, 1, 1,
0.5862024, -0.386287, 3.076536, 0.5058824, 0, 1, 1,
0.5894923, 0.4139306, 1.145798, 0.5137255, 0, 1, 1,
0.5934942, 1.180224, -0.5559862, 0.5176471, 0, 1, 1,
0.5943905, -0.6043844, 2.996807, 0.5254902, 0, 1, 1,
0.5981961, -0.148583, 2.006111, 0.5294118, 0, 1, 1,
0.6006781, 1.546895, 0.7155319, 0.5372549, 0, 1, 1,
0.6028554, 1.640879, -0.7678012, 0.5411765, 0, 1, 1,
0.6031799, 0.3507703, 0.7382486, 0.5490196, 0, 1, 1,
0.6038526, -1.422909, 3.292968, 0.5529412, 0, 1, 1,
0.6052362, -1.090339, 2.215218, 0.5607843, 0, 1, 1,
0.6078645, 0.4379151, 1.244489, 0.5647059, 0, 1, 1,
0.608363, 0.5665469, -0.6189068, 0.572549, 0, 1, 1,
0.6100578, 0.06553379, 2.42033, 0.5764706, 0, 1, 1,
0.6137564, -1.643792, 4.043447, 0.5843138, 0, 1, 1,
0.6173124, -0.8168786, 3.935621, 0.5882353, 0, 1, 1,
0.6190636, 0.8790614, 0.6649055, 0.5960785, 0, 1, 1,
0.624653, -2.123497, 3.021869, 0.6039216, 0, 1, 1,
0.6309625, 0.7125736, 2.311289, 0.6078432, 0, 1, 1,
0.6316734, -0.5263171, 2.375808, 0.6156863, 0, 1, 1,
0.6322464, 0.8655306, 0.6703546, 0.6196079, 0, 1, 1,
0.6377594, 0.009340546, 2.86338, 0.627451, 0, 1, 1,
0.639352, -0.3949321, 2.178078, 0.6313726, 0, 1, 1,
0.6432358, 0.8046374, 2.232045, 0.6392157, 0, 1, 1,
0.6452076, -1.292247, 2.460238, 0.6431373, 0, 1, 1,
0.6494352, -0.3001566, 2.126234, 0.6509804, 0, 1, 1,
0.6504947, 1.211521, -0.5098345, 0.654902, 0, 1, 1,
0.6518022, 0.8137732, 0.7481684, 0.6627451, 0, 1, 1,
0.6593876, 1.559348, 0.01168075, 0.6666667, 0, 1, 1,
0.6634767, -1.954474, 3.264202, 0.6745098, 0, 1, 1,
0.668578, 0.3180338, 0.02844533, 0.6784314, 0, 1, 1,
0.6774904, 0.01525254, 1.998433, 0.6862745, 0, 1, 1,
0.6817359, 0.7688801, 0.5715536, 0.6901961, 0, 1, 1,
0.6817908, 1.823301, 0.6628168, 0.6980392, 0, 1, 1,
0.6831242, 0.5696515, 2.462433, 0.7058824, 0, 1, 1,
0.6843496, -0.3598537, 2.557104, 0.7098039, 0, 1, 1,
0.6998309, 1.320008, 1.79703, 0.7176471, 0, 1, 1,
0.7049766, -1.168877, 2.453276, 0.7215686, 0, 1, 1,
0.7065611, 0.5132023, 0.1239176, 0.7294118, 0, 1, 1,
0.7098857, 0.8135908, 0.7770934, 0.7333333, 0, 1, 1,
0.7114286, 0.8313712, 0.2025945, 0.7411765, 0, 1, 1,
0.7319822, -0.187139, 2.721812, 0.7450981, 0, 1, 1,
0.7329856, -0.7408332, 1.386887, 0.7529412, 0, 1, 1,
0.7337313, 1.7342, 0.08599713, 0.7568628, 0, 1, 1,
0.7347214, 0.7799918, 1.588483, 0.7647059, 0, 1, 1,
0.7446468, -0.4559351, 1.177005, 0.7686275, 0, 1, 1,
0.7512681, 0.9776422, 0.5986655, 0.7764706, 0, 1, 1,
0.7533081, 0.4115897, 1.701909, 0.7803922, 0, 1, 1,
0.7535884, -1.119914, 1.675775, 0.7882353, 0, 1, 1,
0.7578092, 2.164009, 1.035291, 0.7921569, 0, 1, 1,
0.7589709, 1.187525, 1.263372, 0.8, 0, 1, 1,
0.7607427, -0.5532723, 0.4250149, 0.8078431, 0, 1, 1,
0.7657266, 2.348418, -1.685809, 0.8117647, 0, 1, 1,
0.7681568, -1.082416, 4.972827, 0.8196079, 0, 1, 1,
0.7750305, -0.5917711, 2.607846, 0.8235294, 0, 1, 1,
0.775125, -0.4285685, 2.728345, 0.8313726, 0, 1, 1,
0.7813162, -0.1855261, 2.363822, 0.8352941, 0, 1, 1,
0.7986585, -1.456031, 3.653512, 0.8431373, 0, 1, 1,
0.8052973, 0.1065081, 0.2845718, 0.8470588, 0, 1, 1,
0.8084163, 0.2727748, 3.320703, 0.854902, 0, 1, 1,
0.8121029, 0.7714826, -0.6087061, 0.8588235, 0, 1, 1,
0.8125234, 0.4268167, 1.987558, 0.8666667, 0, 1, 1,
0.8143328, 1.233819, -0.5007377, 0.8705882, 0, 1, 1,
0.8158789, -1.006112, 1.342388, 0.8784314, 0, 1, 1,
0.8202951, -0.3140389, 1.234256, 0.8823529, 0, 1, 1,
0.8256427, 2.656982, 1.537042, 0.8901961, 0, 1, 1,
0.8337322, 0.4743146, 1.741523, 0.8941177, 0, 1, 1,
0.8354594, -0.1473311, 3.189652, 0.9019608, 0, 1, 1,
0.8471525, 1.157446, 1.184572, 0.9098039, 0, 1, 1,
0.8514605, 2.16186, -0.35754, 0.9137255, 0, 1, 1,
0.8703541, -0.7423478, 3.001609, 0.9215686, 0, 1, 1,
0.872122, -0.3996567, 1.083963, 0.9254902, 0, 1, 1,
0.8721923, -0.4048135, 0.737625, 0.9333333, 0, 1, 1,
0.8757531, 0.09086438, 2.389981, 0.9372549, 0, 1, 1,
0.878801, -1.530892, 4.784218, 0.945098, 0, 1, 1,
0.884489, -1.586203, 2.185547, 0.9490196, 0, 1, 1,
0.8981436, 0.07757045, 2.138528, 0.9568627, 0, 1, 1,
0.9120505, -1.760492, 2.200073, 0.9607843, 0, 1, 1,
0.9203809, 1.260614, 0.1415534, 0.9686275, 0, 1, 1,
0.9275091, 1.631371, 1.355862, 0.972549, 0, 1, 1,
0.9312966, 0.1043337, 1.208102, 0.9803922, 0, 1, 1,
0.9415243, 1.895533, 1.185807, 0.9843137, 0, 1, 1,
0.9465439, 0.0645154, 1.788299, 0.9921569, 0, 1, 1,
0.9474596, -1.328001, 1.926425, 0.9960784, 0, 1, 1,
0.9481958, 0.05911726, 0.8796598, 1, 0, 0.9960784, 1,
0.951933, 0.2957492, 1.101396, 1, 0, 0.9882353, 1,
0.9545017, 1.332278, -1.006541, 1, 0, 0.9843137, 1,
0.9577167, 0.4080458, 1.150542, 1, 0, 0.9764706, 1,
0.9599255, -1.193949, 3.343529, 1, 0, 0.972549, 1,
0.9683606, -0.1894391, 0.90701, 1, 0, 0.9647059, 1,
0.9694018, 0.5301573, 1.016844, 1, 0, 0.9607843, 1,
0.9709113, -0.2557919, 0.7813032, 1, 0, 0.9529412, 1,
0.9738982, -0.1739791, 0.2244762, 1, 0, 0.9490196, 1,
0.9760175, -0.766562, 1.37786, 1, 0, 0.9411765, 1,
0.9803824, 1.566055, 1.269522, 1, 0, 0.9372549, 1,
0.9892711, 0.3250852, 0.3261281, 1, 0, 0.9294118, 1,
0.994235, 0.2686683, 0.3452599, 1, 0, 0.9254902, 1,
0.9951943, 1.750989, 1.279449, 1, 0, 0.9176471, 1,
0.9963487, -0.2696127, 1.777402, 1, 0, 0.9137255, 1,
0.9973185, -0.5064592, 3.927777, 1, 0, 0.9058824, 1,
1.013694, -1.167016, 2.332886, 1, 0, 0.9019608, 1,
1.013801, 0.177022, 0.6619548, 1, 0, 0.8941177, 1,
1.015224, -0.3523721, 1.135333, 1, 0, 0.8862745, 1,
1.027889, -1.478821, 0.9994207, 1, 0, 0.8823529, 1,
1.029298, 1.430077, 0.8148685, 1, 0, 0.8745098, 1,
1.031287, 0.9940578, 1.343026, 1, 0, 0.8705882, 1,
1.038283, -0.8635135, 3.503328, 1, 0, 0.8627451, 1,
1.05426, -0.3703087, 2.511346, 1, 0, 0.8588235, 1,
1.065069, 0.8538352, 2.772927, 1, 0, 0.8509804, 1,
1.074505, 0.03410191, 1.370921, 1, 0, 0.8470588, 1,
1.07786, 0.7835951, -0.08825623, 1, 0, 0.8392157, 1,
1.089079, 0.5737358, 1.157236, 1, 0, 0.8352941, 1,
1.089279, 1.343856, -2.209834, 1, 0, 0.827451, 1,
1.091799, -0.9629956, 2.545105, 1, 0, 0.8235294, 1,
1.092312, 0.2935904, 0.3394021, 1, 0, 0.8156863, 1,
1.093731, 0.9970194, 1.546482, 1, 0, 0.8117647, 1,
1.109588, -0.7398061, 2.202313, 1, 0, 0.8039216, 1,
1.114917, 1.246261, -1.677155, 1, 0, 0.7960784, 1,
1.117065, 0.5810115, 3.127089, 1, 0, 0.7921569, 1,
1.11826, 0.1641547, 3.023316, 1, 0, 0.7843137, 1,
1.122169, 0.4914031, 1.446722, 1, 0, 0.7803922, 1,
1.12732, 1.276351, -0.2300301, 1, 0, 0.772549, 1,
1.129923, -1.591096, 2.454864, 1, 0, 0.7686275, 1,
1.133404, -0.8525923, 2.133854, 1, 0, 0.7607843, 1,
1.136807, -0.7032708, 1.871946, 1, 0, 0.7568628, 1,
1.140219, 0.4390917, 1.690116, 1, 0, 0.7490196, 1,
1.152243, 1.072366, -0.5525408, 1, 0, 0.7450981, 1,
1.157388, 0.841931, 0.5054128, 1, 0, 0.7372549, 1,
1.16022, -0.5481431, 1.409378, 1, 0, 0.7333333, 1,
1.164976, -0.4147339, 1.555723, 1, 0, 0.7254902, 1,
1.169663, 0.6123316, 1.568972, 1, 0, 0.7215686, 1,
1.169733, 0.002678647, 0.8066637, 1, 0, 0.7137255, 1,
1.181756, 0.2906171, 1.018761, 1, 0, 0.7098039, 1,
1.183973, -0.6406589, 3.473795, 1, 0, 0.7019608, 1,
1.189114, 1.069578, 2.322981, 1, 0, 0.6941177, 1,
1.201448, -1.499663, 1.009894, 1, 0, 0.6901961, 1,
1.204853, 0.1764094, -0.03594313, 1, 0, 0.682353, 1,
1.206229, 0.317811, 1.47862, 1, 0, 0.6784314, 1,
1.214035, 0.2648495, 1.982204, 1, 0, 0.6705883, 1,
1.21918, -1.410498, 3.725705, 1, 0, 0.6666667, 1,
1.221072, 0.467465, 1.982079, 1, 0, 0.6588235, 1,
1.238764, 0.3148627, 0.9672258, 1, 0, 0.654902, 1,
1.24224, -0.1009869, 2.985153, 1, 0, 0.6470588, 1,
1.246566, 0.08068096, 2.004102, 1, 0, 0.6431373, 1,
1.254078, -0.1445027, 1.366755, 1, 0, 0.6352941, 1,
1.255736, -0.9820507, 2.725594, 1, 0, 0.6313726, 1,
1.26251, 0.7448919, 0.6296453, 1, 0, 0.6235294, 1,
1.272464, 0.5310315, 0.5754536, 1, 0, 0.6196079, 1,
1.272475, 0.04998998, 1.513725, 1, 0, 0.6117647, 1,
1.280626, -1.844348, 3.860676, 1, 0, 0.6078432, 1,
1.28362, 0.5031977, 0.4860159, 1, 0, 0.6, 1,
1.288737, 0.7995127, 1.504895, 1, 0, 0.5921569, 1,
1.289816, 0.4142408, 0.8156285, 1, 0, 0.5882353, 1,
1.31116, -0.1491061, 1.97254, 1, 0, 0.5803922, 1,
1.311301, -0.7264785, 0.6361583, 1, 0, 0.5764706, 1,
1.311646, -0.8103279, 2.126673, 1, 0, 0.5686275, 1,
1.314757, -0.5576749, 2.450114, 1, 0, 0.5647059, 1,
1.31671, 1.306273, 0.9477798, 1, 0, 0.5568628, 1,
1.328317, -0.4546613, 1.391701, 1, 0, 0.5529412, 1,
1.328565, 0.9591354, 2.027448, 1, 0, 0.5450981, 1,
1.328888, -0.1304658, 0.8695094, 1, 0, 0.5411765, 1,
1.331873, 1.14508, 0.1312454, 1, 0, 0.5333334, 1,
1.341402, -1.696804, 2.436454, 1, 0, 0.5294118, 1,
1.353382, -0.4464605, 0.6876286, 1, 0, 0.5215687, 1,
1.363027, -0.9132378, 3.241439, 1, 0, 0.5176471, 1,
1.369269, -0.01002426, 2.144147, 1, 0, 0.509804, 1,
1.373822, 1.449246, -0.2544226, 1, 0, 0.5058824, 1,
1.380802, -0.1476339, 1.92616, 1, 0, 0.4980392, 1,
1.385716, -0.7654309, 1.935117, 1, 0, 0.4901961, 1,
1.387745, 1.039591, 0.7510442, 1, 0, 0.4862745, 1,
1.388238, -0.4318518, 1.820037, 1, 0, 0.4784314, 1,
1.388837, 1.62494, -0.008045527, 1, 0, 0.4745098, 1,
1.395959, -1.270315, 4.105111, 1, 0, 0.4666667, 1,
1.399095, -1.465503, 2.408919, 1, 0, 0.4627451, 1,
1.426113, 0.5261663, 1.067232, 1, 0, 0.454902, 1,
1.427317, 0.843821, 1.45392, 1, 0, 0.4509804, 1,
1.429685, 0.1720673, 1.91941, 1, 0, 0.4431373, 1,
1.430866, -0.01157974, 2.056498, 1, 0, 0.4392157, 1,
1.45052, 0.09837277, 2.702228, 1, 0, 0.4313726, 1,
1.453777, 0.2736411, 1.945001, 1, 0, 0.427451, 1,
1.465708, -0.9345142, 1.090281, 1, 0, 0.4196078, 1,
1.468842, -0.9856675, 2.449152, 1, 0, 0.4156863, 1,
1.478331, 0.321631, -0.06065493, 1, 0, 0.4078431, 1,
1.483048, -0.06354657, -0.3799234, 1, 0, 0.4039216, 1,
1.48654, 1.630522, -0.1338894, 1, 0, 0.3960784, 1,
1.491891, 0.349771, 1.505938, 1, 0, 0.3882353, 1,
1.492186, -1.121093, 2.321486, 1, 0, 0.3843137, 1,
1.495199, 0.00220006, 1.826956, 1, 0, 0.3764706, 1,
1.509119, 0.3983467, 0.9362307, 1, 0, 0.372549, 1,
1.534949, -2.624619, 2.950835, 1, 0, 0.3647059, 1,
1.537834, -0.3077217, 1.139335, 1, 0, 0.3607843, 1,
1.551136, 0.2760464, 2.889783, 1, 0, 0.3529412, 1,
1.562564, 0.2379538, 2.10277, 1, 0, 0.3490196, 1,
1.579763, -1.24564, 2.089545, 1, 0, 0.3411765, 1,
1.600017, -1.005068, 1.93571, 1, 0, 0.3372549, 1,
1.6055, -0.310797, 1.506991, 1, 0, 0.3294118, 1,
1.606414, -0.4401797, 0.9849518, 1, 0, 0.3254902, 1,
1.609482, -0.256341, 1.615659, 1, 0, 0.3176471, 1,
1.629052, -0.8022771, 0.7208895, 1, 0, 0.3137255, 1,
1.632929, 0.6944554, 0.2822514, 1, 0, 0.3058824, 1,
1.645133, -0.2876429, 2.414666, 1, 0, 0.2980392, 1,
1.650818, -0.5982437, 1.509238, 1, 0, 0.2941177, 1,
1.657557, 0.8211383, 1.564299, 1, 0, 0.2862745, 1,
1.667626, 0.7865101, 1.7249, 1, 0, 0.282353, 1,
1.668347, 0.787052, 0.9748293, 1, 0, 0.2745098, 1,
1.678442, -0.4145899, 3.210714, 1, 0, 0.2705882, 1,
1.681948, 1.170448, -0.7251799, 1, 0, 0.2627451, 1,
1.7113, -0.006187688, 4.055657, 1, 0, 0.2588235, 1,
1.726663, 1.104564, 1.652449, 1, 0, 0.2509804, 1,
1.739573, 1.673441, -0.1675735, 1, 0, 0.2470588, 1,
1.748434, 1.085425, 0.2444366, 1, 0, 0.2392157, 1,
1.750012, 0.06530464, 2.262851, 1, 0, 0.2352941, 1,
1.762391, -0.4030504, 3.137243, 1, 0, 0.227451, 1,
1.774528, -1.511594, 1.120681, 1, 0, 0.2235294, 1,
1.78127, -0.5957575, 3.887894, 1, 0, 0.2156863, 1,
1.783765, -1.870166, 2.4879, 1, 0, 0.2117647, 1,
1.793854, 1.1427, 1.432514, 1, 0, 0.2039216, 1,
1.802818, -0.0253724, 1.501558, 1, 0, 0.1960784, 1,
1.814236, -1.328342, 0.8006158, 1, 0, 0.1921569, 1,
1.847508, 0.056965, 3.539256, 1, 0, 0.1843137, 1,
1.851003, -1.360909, 2.939895, 1, 0, 0.1803922, 1,
1.861497, 0.1112789, 1.82214, 1, 0, 0.172549, 1,
1.862624, 1.426399, 0.9144353, 1, 0, 0.1686275, 1,
1.885995, 0.8699176, 1.583855, 1, 0, 0.1607843, 1,
1.896635, -0.2699159, 2.720178, 1, 0, 0.1568628, 1,
1.909677, 0.4852299, 0.7639076, 1, 0, 0.1490196, 1,
1.928426, 1.222554, 0.5076641, 1, 0, 0.145098, 1,
1.943654, 1.36859, 0.9061734, 1, 0, 0.1372549, 1,
1.943932, -0.5021348, 2.127836, 1, 0, 0.1333333, 1,
1.969165, 0.2059775, 1.396371, 1, 0, 0.1254902, 1,
1.970593, 2.152236, 0.9445769, 1, 0, 0.1215686, 1,
1.985372, 0.6091651, 0.8220313, 1, 0, 0.1137255, 1,
1.995957, 0.4379901, 0.9072554, 1, 0, 0.1098039, 1,
2.000612, 1.011136, 0.04136158, 1, 0, 0.1019608, 1,
2.04461, -0.5900324, 2.867633, 1, 0, 0.09411765, 1,
2.066134, 0.7386689, 1.824761, 1, 0, 0.09019608, 1,
2.134236, 0.1743138, 1.279631, 1, 0, 0.08235294, 1,
2.185573, 0.5304772, 0.7698992, 1, 0, 0.07843138, 1,
2.273044, -0.7533754, -0.2199892, 1, 0, 0.07058824, 1,
2.303477, -0.569836, 2.947073, 1, 0, 0.06666667, 1,
2.355586, -1.43228, 1.467977, 1, 0, 0.05882353, 1,
2.484287, -0.8140872, 2.916543, 1, 0, 0.05490196, 1,
2.5045, -0.3091255, 1.820696, 1, 0, 0.04705882, 1,
2.516433, 0.2655371, 2.566463, 1, 0, 0.04313726, 1,
2.664791, 1.047646, 0.5989624, 1, 0, 0.03529412, 1,
2.769544, 1.255881, 1.659625, 1, 0, 0.03137255, 1,
2.840726, -1.273057, 2.898601, 1, 0, 0.02352941, 1,
2.852772, -2.528394, 4.725917, 1, 0, 0.01960784, 1,
3.61005, -0.9834114, 0.08011207, 1, 0, 0.01176471, 1,
3.692647, 1.629501, 2.249695, 1, 0, 0.007843138, 1
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
0.009404778, -4.889931, -7.955976, 0, -0.5, 0.5, 0.5,
0.009404778, -4.889931, -7.955976, 1, -0.5, 0.5, 0.5,
0.009404778, -4.889931, -7.955976, 1, 1.5, 0.5, 0.5,
0.009404778, -4.889931, -7.955976, 0, 1.5, 0.5, 0.5
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
-4.922457, -0.258305, -7.955976, 0, -0.5, 0.5, 0.5,
-4.922457, -0.258305, -7.955976, 1, -0.5, 0.5, 0.5,
-4.922457, -0.258305, -7.955976, 1, 1.5, 0.5, 0.5,
-4.922457, -0.258305, -7.955976, 0, 1.5, 0.5, 0.5
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
-4.922457, -4.889931, -0.2900364, 0, -0.5, 0.5, 0.5,
-4.922457, -4.889931, -0.2900364, 1, -0.5, 0.5, 0.5,
-4.922457, -4.889931, -0.2900364, 1, 1.5, 0.5, 0.5,
-4.922457, -4.889931, -0.2900364, 0, 1.5, 0.5, 0.5
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
-2, -3.821094, -6.186913,
2, -3.821094, -6.186913,
-2, -3.821094, -6.186913,
-2, -3.999234, -6.481757,
0, -3.821094, -6.186913,
0, -3.999234, -6.481757,
2, -3.821094, -6.186913,
2, -3.999234, -6.481757
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
"0",
"2"
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
-2, -4.355513, -7.071444, 0, -0.5, 0.5, 0.5,
-2, -4.355513, -7.071444, 1, -0.5, 0.5, 0.5,
-2, -4.355513, -7.071444, 1, 1.5, 0.5, 0.5,
-2, -4.355513, -7.071444, 0, 1.5, 0.5, 0.5,
0, -4.355513, -7.071444, 0, -0.5, 0.5, 0.5,
0, -4.355513, -7.071444, 1, -0.5, 0.5, 0.5,
0, -4.355513, -7.071444, 1, 1.5, 0.5, 0.5,
0, -4.355513, -7.071444, 0, 1.5, 0.5, 0.5,
2, -4.355513, -7.071444, 0, -0.5, 0.5, 0.5,
2, -4.355513, -7.071444, 1, -0.5, 0.5, 0.5,
2, -4.355513, -7.071444, 1, 1.5, 0.5, 0.5,
2, -4.355513, -7.071444, 0, 1.5, 0.5, 0.5
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
-3.784335, -3, -6.186913,
-3.784335, 3, -6.186913,
-3.784335, -3, -6.186913,
-3.974022, -3, -6.481757,
-3.784335, -2, -6.186913,
-3.974022, -2, -6.481757,
-3.784335, -1, -6.186913,
-3.974022, -1, -6.481757,
-3.784335, 0, -6.186913,
-3.974022, 0, -6.481757,
-3.784335, 1, -6.186913,
-3.974022, 1, -6.481757,
-3.784335, 2, -6.186913,
-3.974022, 2, -6.481757,
-3.784335, 3, -6.186913,
-3.974022, 3, -6.481757
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
-4.353396, -3, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, -3, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, -3, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, -3, -7.071444, 0, 1.5, 0.5, 0.5,
-4.353396, -2, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, -2, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, -2, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, -2, -7.071444, 0, 1.5, 0.5, 0.5,
-4.353396, -1, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, -1, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, -1, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, -1, -7.071444, 0, 1.5, 0.5, 0.5,
-4.353396, 0, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, 0, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, 0, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, 0, -7.071444, 0, 1.5, 0.5, 0.5,
-4.353396, 1, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, 1, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, 1, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, 1, -7.071444, 0, 1.5, 0.5, 0.5,
-4.353396, 2, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, 2, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, 2, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, 2, -7.071444, 0, 1.5, 0.5, 0.5,
-4.353396, 3, -7.071444, 0, -0.5, 0.5, 0.5,
-4.353396, 3, -7.071444, 1, -0.5, 0.5, 0.5,
-4.353396, 3, -7.071444, 1, 1.5, 0.5, 0.5,
-4.353396, 3, -7.071444, 0, 1.5, 0.5, 0.5
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
-3.784335, -3.821094, -6,
-3.784335, -3.821094, 4,
-3.784335, -3.821094, -6,
-3.974022, -3.999234, -6,
-3.784335, -3.821094, -4,
-3.974022, -3.999234, -4,
-3.784335, -3.821094, -2,
-3.974022, -3.999234, -2,
-3.784335, -3.821094, 0,
-3.974022, -3.999234, 0,
-3.784335, -3.821094, 2,
-3.974022, -3.999234, 2,
-3.784335, -3.821094, 4,
-3.974022, -3.999234, 4
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
-4.353396, -4.355513, -6, 0, -0.5, 0.5, 0.5,
-4.353396, -4.355513, -6, 1, -0.5, 0.5, 0.5,
-4.353396, -4.355513, -6, 1, 1.5, 0.5, 0.5,
-4.353396, -4.355513, -6, 0, 1.5, 0.5, 0.5,
-4.353396, -4.355513, -4, 0, -0.5, 0.5, 0.5,
-4.353396, -4.355513, -4, 1, -0.5, 0.5, 0.5,
-4.353396, -4.355513, -4, 1, 1.5, 0.5, 0.5,
-4.353396, -4.355513, -4, 0, 1.5, 0.5, 0.5,
-4.353396, -4.355513, -2, 0, -0.5, 0.5, 0.5,
-4.353396, -4.355513, -2, 1, -0.5, 0.5, 0.5,
-4.353396, -4.355513, -2, 1, 1.5, 0.5, 0.5,
-4.353396, -4.355513, -2, 0, 1.5, 0.5, 0.5,
-4.353396, -4.355513, 0, 0, -0.5, 0.5, 0.5,
-4.353396, -4.355513, 0, 1, -0.5, 0.5, 0.5,
-4.353396, -4.355513, 0, 1, 1.5, 0.5, 0.5,
-4.353396, -4.355513, 0, 0, 1.5, 0.5, 0.5,
-4.353396, -4.355513, 2, 0, -0.5, 0.5, 0.5,
-4.353396, -4.355513, 2, 1, -0.5, 0.5, 0.5,
-4.353396, -4.355513, 2, 1, 1.5, 0.5, 0.5,
-4.353396, -4.355513, 2, 0, 1.5, 0.5, 0.5,
-4.353396, -4.355513, 4, 0, -0.5, 0.5, 0.5,
-4.353396, -4.355513, 4, 1, -0.5, 0.5, 0.5,
-4.353396, -4.355513, 4, 1, 1.5, 0.5, 0.5,
-4.353396, -4.355513, 4, 0, 1.5, 0.5, 0.5
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
-3.784335, -3.821094, -6.186913,
-3.784335, 3.304484, -6.186913,
-3.784335, -3.821094, 5.60684,
-3.784335, 3.304484, 5.60684,
-3.784335, -3.821094, -6.186913,
-3.784335, -3.821094, 5.60684,
-3.784335, 3.304484, -6.186913,
-3.784335, 3.304484, 5.60684,
-3.784335, -3.821094, -6.186913,
3.803144, -3.821094, -6.186913,
-3.784335, -3.821094, 5.60684,
3.803144, -3.821094, 5.60684,
-3.784335, 3.304484, -6.186913,
3.803144, 3.304484, -6.186913,
-3.784335, 3.304484, 5.60684,
3.803144, 3.304484, 5.60684,
3.803144, -3.821094, -6.186913,
3.803144, 3.304484, -6.186913,
3.803144, -3.821094, 5.60684,
3.803144, 3.304484, 5.60684,
3.803144, -3.821094, -6.186913,
3.803144, -3.821094, 5.60684,
3.803144, 3.304484, -6.186913,
3.803144, 3.304484, 5.60684
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
var radius = 8.399573;
var distance = 37.37065;
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
mvMatrix.translate( -0.009404778, 0.258305, 0.2900364 );
mvMatrix.scale( 1.196943, 1.274533, 0.7700503 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.37065);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ethylene_dichloride_<-read.table("ethylene_dichloride_.xyz")
```

```
## Error in read.table("ethylene_dichloride_.xyz"): no lines available in input
```

```r
x<-ethylene_dichloride_$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dichloride_' not found
```

```r
y<-ethylene_dichloride_$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dichloride_' not found
```

```r
z<-ethylene_dichloride_$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dichloride_' not found
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
-3.673838, -0.6446003, -2.786844, 0, 0, 1, 1, 1,
-3.169399, 0.6330816, -1.444161, 1, 0, 0, 1, 1,
-3.155222, -1.321615, -0.5445799, 1, 0, 0, 1, 1,
-2.817964, -0.3310243, -2.457186, 1, 0, 0, 1, 1,
-2.790808, 0.6205604, -2.326565, 1, 0, 0, 1, 1,
-2.707541, -0.2886143, -1.034415, 1, 0, 0, 1, 1,
-2.668801, -0.3436864, 0.3758449, 0, 0, 0, 1, 1,
-2.627733, -0.1417896, -2.116397, 0, 0, 0, 1, 1,
-2.589183, -2.136649, -2.779322, 0, 0, 0, 1, 1,
-2.552904, -2.078451, -2.794057, 0, 0, 0, 1, 1,
-2.515059, 2.064639, -0.6047593, 0, 0, 0, 1, 1,
-2.482963, -0.2984878, -2.553923, 0, 0, 0, 1, 1,
-2.309175, 0.8475276, 0.1849683, 0, 0, 0, 1, 1,
-2.279308, -0.9290794, -0.9636381, 1, 1, 1, 1, 1,
-2.216437, 0.723281, -1.068783, 1, 1, 1, 1, 1,
-2.216247, -0.7854152, -2.422302, 1, 1, 1, 1, 1,
-2.167592, 1.549642, -1.148669, 1, 1, 1, 1, 1,
-2.163802, 0.4547433, -0.8365765, 1, 1, 1, 1, 1,
-2.127521, 0.1912782, -0.03840345, 1, 1, 1, 1, 1,
-2.081964, -1.860023, -2.426806, 1, 1, 1, 1, 1,
-2.045147, 0.03939307, -1.370204, 1, 1, 1, 1, 1,
-2.004424, 0.595735, -1.747841, 1, 1, 1, 1, 1,
-1.994216, 0.8536832, -1.471368, 1, 1, 1, 1, 1,
-1.978592, 0.7565492, 0.6446325, 1, 1, 1, 1, 1,
-1.975955, 1.360424, -2.407088, 1, 1, 1, 1, 1,
-1.975766, 0.6313348, -0.7060467, 1, 1, 1, 1, 1,
-1.972663, -0.4351027, -3.440238, 1, 1, 1, 1, 1,
-1.965144, 0.5866822, -0.685119, 1, 1, 1, 1, 1,
-1.922663, -1.21283, -3.897462, 0, 0, 1, 1, 1,
-1.911675, 1.809476, -1.460193, 1, 0, 0, 1, 1,
-1.894774, 1.452925, -1.742427, 1, 0, 0, 1, 1,
-1.893235, -1.480453, -2.236121, 1, 0, 0, 1, 1,
-1.890386, -0.4874708, -1.683298, 1, 0, 0, 1, 1,
-1.850969, -0.5298253, -1.107581, 1, 0, 0, 1, 1,
-1.848827, 2.05092, -1.184005, 0, 0, 0, 1, 1,
-1.823695, 1.151475, -1.540944, 0, 0, 0, 1, 1,
-1.807697, -0.4704953, -0.7900595, 0, 0, 0, 1, 1,
-1.80373, 2.778153, -0.7573131, 0, 0, 0, 1, 1,
-1.799738, 0.4208936, -3.107752, 0, 0, 0, 1, 1,
-1.773547, -0.4490748, -1.092677, 0, 0, 0, 1, 1,
-1.764889, 0.009925338, -1.257242, 0, 0, 0, 1, 1,
-1.737735, 0.5406907, -0.3735417, 1, 1, 1, 1, 1,
-1.721626, 0.2403119, -0.9980422, 1, 1, 1, 1, 1,
-1.716663, -0.3917318, -3.153919, 1, 1, 1, 1, 1,
-1.715065, 0.002447848, -0.9652558, 1, 1, 1, 1, 1,
-1.674939, 1.177518, -1.918172, 1, 1, 1, 1, 1,
-1.6713, -1.658641, -3.696977, 1, 1, 1, 1, 1,
-1.671251, -0.8216531, -4.27554, 1, 1, 1, 1, 1,
-1.667027, -1.110472, -2.066792, 1, 1, 1, 1, 1,
-1.663838, -2.172777, -1.635247, 1, 1, 1, 1, 1,
-1.6567, 1.490985, -0.06428581, 1, 1, 1, 1, 1,
-1.651578, -0.5338482, -1.690491, 1, 1, 1, 1, 1,
-1.643751, 0.4513861, -0.5912557, 1, 1, 1, 1, 1,
-1.614783, -1.129591, 0.7057359, 1, 1, 1, 1, 1,
-1.606548, 0.3850842, -0.4480218, 1, 1, 1, 1, 1,
-1.603322, 0.5508218, -1.244449, 1, 1, 1, 1, 1,
-1.602707, -0.3850333, -1.952007, 0, 0, 1, 1, 1,
-1.597042, -0.1303989, -1.622963, 1, 0, 0, 1, 1,
-1.586216, 0.3096157, 0.08686411, 1, 0, 0, 1, 1,
-1.58602, -0.8888469, -1.768968, 1, 0, 0, 1, 1,
-1.565157, 0.6967874, -1.60135, 1, 0, 0, 1, 1,
-1.564083, -0.1044909, -1.433579, 1, 0, 0, 1, 1,
-1.56075, -1.398147, -2.020026, 0, 0, 0, 1, 1,
-1.558184, 1.517309, 0.02930499, 0, 0, 0, 1, 1,
-1.555975, -0.2655987, -1.974418, 0, 0, 0, 1, 1,
-1.532667, 0.3027785, -2.666332, 0, 0, 0, 1, 1,
-1.529352, -1.27317, -2.214986, 0, 0, 0, 1, 1,
-1.52766, -0.006133496, -2.167335, 0, 0, 0, 1, 1,
-1.526155, -2.301831, -3.931675, 0, 0, 0, 1, 1,
-1.51756, -1.565461, -3.004891, 1, 1, 1, 1, 1,
-1.512783, 1.248144, -1.104025, 1, 1, 1, 1, 1,
-1.501698, 1.06643, -1.159119, 1, 1, 1, 1, 1,
-1.492432, 0.05254532, -1.024086, 1, 1, 1, 1, 1,
-1.487366, -0.5136332, -1.92818, 1, 1, 1, 1, 1,
-1.471256, -0.864261, -1.243427, 1, 1, 1, 1, 1,
-1.465019, -1.307806, -1.260159, 1, 1, 1, 1, 1,
-1.46234, 0.5917036, -2.312457, 1, 1, 1, 1, 1,
-1.453993, -0.211485, -2.82474, 1, 1, 1, 1, 1,
-1.446858, 0.3876323, -3.092361, 1, 1, 1, 1, 1,
-1.446077, 1.41262, -1.298056, 1, 1, 1, 1, 1,
-1.443098, -1.440342, -1.379663, 1, 1, 1, 1, 1,
-1.427907, 0.7696203, -0.2995501, 1, 1, 1, 1, 1,
-1.424078, -0.1769129, -1.748769, 1, 1, 1, 1, 1,
-1.410989, -0.1743519, 0.2384871, 1, 1, 1, 1, 1,
-1.409691, 0.05730357, -2.369424, 0, 0, 1, 1, 1,
-1.398794, -0.6830362, -1.028594, 1, 0, 0, 1, 1,
-1.395203, -0.3737559, -1.228742, 1, 0, 0, 1, 1,
-1.385287, 0.1126712, -0.8371257, 1, 0, 0, 1, 1,
-1.3842, 1.036166, -1.187625, 1, 0, 0, 1, 1,
-1.374718, 0.1026041, -2.508713, 1, 0, 0, 1, 1,
-1.374329, -0.3372681, -1.506132, 0, 0, 0, 1, 1,
-1.368027, 0.9275872, -1.243272, 0, 0, 0, 1, 1,
-1.36499, -2.652402, -1.805849, 0, 0, 0, 1, 1,
-1.362094, -0.1041644, -0.1106654, 0, 0, 0, 1, 1,
-1.361766, 0.4498222, -2.130231, 0, 0, 0, 1, 1,
-1.359687, -0.7047994, -1.951408, 0, 0, 0, 1, 1,
-1.359458, -0.6364879, -3.14338, 0, 0, 0, 1, 1,
-1.357018, -0.9160096, -0.4802515, 1, 1, 1, 1, 1,
-1.34346, 0.3185507, -1.808464, 1, 1, 1, 1, 1,
-1.342683, 1.029488, -1.79104, 1, 1, 1, 1, 1,
-1.334837, 2.211404, -1.072754, 1, 1, 1, 1, 1,
-1.313536, -1.024436, -2.112686, 1, 1, 1, 1, 1,
-1.299998, -1.613371, -2.542446, 1, 1, 1, 1, 1,
-1.293807, -2.187994, -2.31156, 1, 1, 1, 1, 1,
-1.291762, -1.086601, -1.953755, 1, 1, 1, 1, 1,
-1.291002, 0.5396185, -1.473714, 1, 1, 1, 1, 1,
-1.289967, -0.9835943, -1.438665, 1, 1, 1, 1, 1,
-1.280164, 0.388146, -1.164317, 1, 1, 1, 1, 1,
-1.267993, -0.4664744, -2.330493, 1, 1, 1, 1, 1,
-1.267376, -1.154609, -1.265833, 1, 1, 1, 1, 1,
-1.265602, -0.4407189, -2.352964, 1, 1, 1, 1, 1,
-1.265257, -1.571927, -2.287612, 1, 1, 1, 1, 1,
-1.263596, 0.7211552, 0.07250009, 0, 0, 1, 1, 1,
-1.239074, -0.1791957, -0.09015332, 1, 0, 0, 1, 1,
-1.238091, -0.7418094, -1.239983, 1, 0, 0, 1, 1,
-1.232568, 0.8822894, -2.3069, 1, 0, 0, 1, 1,
-1.228152, -1.132908, -2.723788, 1, 0, 0, 1, 1,
-1.227759, -1.470849, -3.247944, 1, 0, 0, 1, 1,
-1.225624, 0.2606475, -0.818099, 0, 0, 0, 1, 1,
-1.213521, -1.313906, -3.149923, 0, 0, 0, 1, 1,
-1.208321, -0.5103213, -4.096786, 0, 0, 0, 1, 1,
-1.206422, 0.5215285, -2.738338, 0, 0, 0, 1, 1,
-1.19567, -1.18784, -1.447755, 0, 0, 0, 1, 1,
-1.194545, -1.511897, -2.838883, 0, 0, 0, 1, 1,
-1.186033, -0.4966503, -3.56894, 0, 0, 0, 1, 1,
-1.182725, 0.3644777, -3.119366, 1, 1, 1, 1, 1,
-1.17433, -1.247566, -3.425443, 1, 1, 1, 1, 1,
-1.168032, -0.2929149, -1.73158, 1, 1, 1, 1, 1,
-1.165083, 0.8136376, -2.379966, 1, 1, 1, 1, 1,
-1.161214, 0.4804412, -1.798128, 1, 1, 1, 1, 1,
-1.154462, 0.4364136, -0.2845698, 1, 1, 1, 1, 1,
-1.153648, -0.1211068, -3.515743, 1, 1, 1, 1, 1,
-1.153551, -1.069181, -2.628475, 1, 1, 1, 1, 1,
-1.151949, 2.44225, -0.3312195, 1, 1, 1, 1, 1,
-1.150908, 1.641196, -0.7384818, 1, 1, 1, 1, 1,
-1.143254, 0.3519193, -0.2254905, 1, 1, 1, 1, 1,
-1.141196, 1.511431, -0.1072457, 1, 1, 1, 1, 1,
-1.131488, -2.230222, -3.888378, 1, 1, 1, 1, 1,
-1.125329, -0.1144361, -1.682972, 1, 1, 1, 1, 1,
-1.122234, 2.576475, -1.189282, 1, 1, 1, 1, 1,
-1.117551, -0.2232003, -3.300552, 0, 0, 1, 1, 1,
-1.113345, -0.8980374, -1.471423, 1, 0, 0, 1, 1,
-1.112883, 2.706277, 0.9661878, 1, 0, 0, 1, 1,
-1.110262, -0.5824292, -3.698004, 1, 0, 0, 1, 1,
-1.105157, 1.692204, -0.8835762, 1, 0, 0, 1, 1,
-1.098986, -0.09517632, -1.137202, 1, 0, 0, 1, 1,
-1.096495, -0.6977284, -2.056325, 0, 0, 0, 1, 1,
-1.095109, -0.6808956, -3.398317, 0, 0, 0, 1, 1,
-1.094977, -0.05658286, -3.190648, 0, 0, 0, 1, 1,
-1.09438, -1.788796, -2.102674, 0, 0, 0, 1, 1,
-1.093029, 0.08318958, -1.014641, 0, 0, 0, 1, 1,
-1.09004, -0.8195123, -1.96239, 0, 0, 0, 1, 1,
-1.089032, 2.834912, -1.728721, 0, 0, 0, 1, 1,
-1.088258, -1.176413, -2.156477, 1, 1, 1, 1, 1,
-1.082521, -0.8212388, -1.775522, 1, 1, 1, 1, 1,
-1.080998, -0.7077874, -0.659152, 1, 1, 1, 1, 1,
-1.07514, -1.179807, -2.319165, 1, 1, 1, 1, 1,
-1.066128, -1.144758, -2.679816, 1, 1, 1, 1, 1,
-1.06168, -0.997418, -2.59622, 1, 1, 1, 1, 1,
-1.053762, 0.4944783, -2.433868, 1, 1, 1, 1, 1,
-1.05096, -0.4313413, -1.510813, 1, 1, 1, 1, 1,
-1.046841, 0.4062278, -0.4448192, 1, 1, 1, 1, 1,
-1.042071, -0.8891153, -1.722197, 1, 1, 1, 1, 1,
-1.027303, -1.320895, 0.4035563, 1, 1, 1, 1, 1,
-1.022087, 2.23745, -0.3032559, 1, 1, 1, 1, 1,
-1.019866, -0.5966389, -0.1477706, 1, 1, 1, 1, 1,
-1.015972, -0.6617284, -1.581536, 1, 1, 1, 1, 1,
-1.009791, 0.4387932, -2.405118, 1, 1, 1, 1, 1,
-1.007096, -1.300311, -3.494154, 0, 0, 1, 1, 1,
-1.004179, -0.4985701, -2.391031, 1, 0, 0, 1, 1,
-1.003723, -3.09899, -1.912315, 1, 0, 0, 1, 1,
-1.002729, -0.5966862, -1.06349, 1, 0, 0, 1, 1,
-1.000564, 0.1578648, -1.918735, 1, 0, 0, 1, 1,
-0.9992278, 0.2781092, -0.554181, 1, 0, 0, 1, 1,
-0.9975511, -1.586766, -1.803892, 0, 0, 0, 1, 1,
-0.9965923, 0.3559223, 0.7553782, 0, 0, 0, 1, 1,
-0.996013, -0.5336418, -1.199201, 0, 0, 0, 1, 1,
-0.9941937, -0.4951907, -2.737374, 0, 0, 0, 1, 1,
-0.9913325, -1.02752, -0.2533912, 0, 0, 0, 1, 1,
-0.9835244, -0.2774825, -0.3748847, 0, 0, 0, 1, 1,
-0.9833836, 1.356731, 0.7979403, 0, 0, 0, 1, 1,
-0.9817317, 1.078852, -1.334298, 1, 1, 1, 1, 1,
-0.9784306, -0.2185342, -0.1206848, 1, 1, 1, 1, 1,
-0.9769181, 0.3834848, -1.920571, 1, 1, 1, 1, 1,
-0.9710689, -0.331427, -1.77828, 1, 1, 1, 1, 1,
-0.9617901, 0.5994528, -0.9659301, 1, 1, 1, 1, 1,
-0.9612764, 1.154829, -0.8538805, 1, 1, 1, 1, 1,
-0.9595434, -1.316172, -2.678436, 1, 1, 1, 1, 1,
-0.9594734, 0.0001854984, -2.462955, 1, 1, 1, 1, 1,
-0.9542317, -0.4809062, -2.29596, 1, 1, 1, 1, 1,
-0.9505399, 0.6425314, -2.157552, 1, 1, 1, 1, 1,
-0.9494427, -0.8755949, -3.152899, 1, 1, 1, 1, 1,
-0.9474124, -0.5825055, -1.886067, 1, 1, 1, 1, 1,
-0.9466028, 1.037795, 0.2439115, 1, 1, 1, 1, 1,
-0.9430063, 0.5420294, -1.531894, 1, 1, 1, 1, 1,
-0.9371808, -0.06169412, -0.1501318, 1, 1, 1, 1, 1,
-0.93557, -1.497908, -3.927529, 0, 0, 1, 1, 1,
-0.9325926, -0.7156767, -1.586887, 1, 0, 0, 1, 1,
-0.9190342, 0.8907042, 0.04260956, 1, 0, 0, 1, 1,
-0.9168761, -0.1275493, -1.862404, 1, 0, 0, 1, 1,
-0.9137402, 1.153938, -0.6930346, 1, 0, 0, 1, 1,
-0.9133146, -0.3679087, -3.5162, 1, 0, 0, 1, 1,
-0.9128404, -0.575116, -3.216656, 0, 0, 0, 1, 1,
-0.9115678, -1.031483, -0.5989056, 0, 0, 0, 1, 1,
-0.9098678, -0.1920206, -2.760732, 0, 0, 0, 1, 1,
-0.90125, -1.183335, -1.74933, 0, 0, 0, 1, 1,
-0.9007872, -0.4892309, -2.962483, 0, 0, 0, 1, 1,
-0.8982123, 0.3502613, -0.9595134, 0, 0, 0, 1, 1,
-0.8928317, 0.3878429, 0.2761456, 0, 0, 0, 1, 1,
-0.8909798, 2.237367, 1.313553, 1, 1, 1, 1, 1,
-0.8803213, 1.314585, -2.210413, 1, 1, 1, 1, 1,
-0.8798207, -0.5003798, -1.180431, 1, 1, 1, 1, 1,
-0.8780192, 0.485154, -1.862146, 1, 1, 1, 1, 1,
-0.875905, 0.7096668, -1.509986, 1, 1, 1, 1, 1,
-0.8695895, -0.807896, -2.521676, 1, 1, 1, 1, 1,
-0.8664453, 0.6913401, 1.265867, 1, 1, 1, 1, 1,
-0.8553631, 1.359486, 0.3781167, 1, 1, 1, 1, 1,
-0.8512391, -0.3589737, -1.590733, 1, 1, 1, 1, 1,
-0.8491376, 1.26159, 0.5302821, 1, 1, 1, 1, 1,
-0.8480672, -0.1478816, -0.3489422, 1, 1, 1, 1, 1,
-0.8450411, 0.4048592, 0.1060026, 1, 1, 1, 1, 1,
-0.8388507, -0.4056356, -3.046131, 1, 1, 1, 1, 1,
-0.8259544, -1.541036, -3.368019, 1, 1, 1, 1, 1,
-0.8253235, -1.033577, -1.314326, 1, 1, 1, 1, 1,
-0.8238945, 1.694658, 0.7160193, 0, 0, 1, 1, 1,
-0.8212307, -0.4956122, -0.9138471, 1, 0, 0, 1, 1,
-0.8168192, 0.4103054, -0.08144745, 1, 0, 0, 1, 1,
-0.8130563, -0.01401906, -1.43079, 1, 0, 0, 1, 1,
-0.8121008, -0.88272, -3.873915, 1, 0, 0, 1, 1,
-0.8117918, 1.286838, 0.3375844, 1, 0, 0, 1, 1,
-0.8110948, -0.9412141, -1.40496, 0, 0, 0, 1, 1,
-0.809611, -1.457013, -1.735644, 0, 0, 0, 1, 1,
-0.8091813, -0.1728349, -1.110052, 0, 0, 0, 1, 1,
-0.8028631, -1.547383, -1.997183, 0, 0, 0, 1, 1,
-0.8024721, 0.4757964, -1.893028, 0, 0, 0, 1, 1,
-0.7999852, -1.722263, -2.958943, 0, 0, 0, 1, 1,
-0.7964749, 0.6474948, -1.464283, 0, 0, 0, 1, 1,
-0.795516, 0.8841676, -0.04493684, 1, 1, 1, 1, 1,
-0.7942916, 0.09668909, -2.569074, 1, 1, 1, 1, 1,
-0.7935086, -1.804972, -3.201244, 1, 1, 1, 1, 1,
-0.7899992, 0.7085543, 0.3353388, 1, 1, 1, 1, 1,
-0.7840163, 0.6513497, -1.572816, 1, 1, 1, 1, 1,
-0.7818252, -0.06813067, -2.21995, 1, 1, 1, 1, 1,
-0.7691071, 0.6096705, -1.156805, 1, 1, 1, 1, 1,
-0.7640346, 1.713597, -0.1545233, 1, 1, 1, 1, 1,
-0.7616628, 1.041272, -2.230099, 1, 1, 1, 1, 1,
-0.7569697, -1.685882, -2.891773, 1, 1, 1, 1, 1,
-0.7565932, -0.362001, -0.6533899, 1, 1, 1, 1, 1,
-0.7521046, -1.760701, -2.406706, 1, 1, 1, 1, 1,
-0.7501354, 2.254044, 0.4963297, 1, 1, 1, 1, 1,
-0.7488959, 1.297334, 0.06603833, 1, 1, 1, 1, 1,
-0.7451184, 0.9631162, 0.7525576, 1, 1, 1, 1, 1,
-0.7443426, -1.647069, -4.041257, 0, 0, 1, 1, 1,
-0.7442529, 0.4147277, -0.16045, 1, 0, 0, 1, 1,
-0.7391209, 1.198544, -2.65865, 1, 0, 0, 1, 1,
-0.7311589, 0.0256375, -2.80381, 1, 0, 0, 1, 1,
-0.7295574, 0.3228239, -1.663508, 1, 0, 0, 1, 1,
-0.7294545, -1.21612, -3.159614, 1, 0, 0, 1, 1,
-0.7245042, -0.537432, -3.27924, 0, 0, 0, 1, 1,
-0.7242595, 0.6761497, -0.9141497, 0, 0, 0, 1, 1,
-0.7234792, 0.6272638, -0.2996971, 0, 0, 0, 1, 1,
-0.7130758, 0.09950995, -2.282928, 0, 0, 0, 1, 1,
-0.710727, -0.957505, -1.303707, 0, 0, 0, 1, 1,
-0.7090051, 2.402969, -1.342257, 0, 0, 0, 1, 1,
-0.7072245, -0.6155546, -1.054449, 0, 0, 0, 1, 1,
-0.7049354, -0.3108991, -1.954587, 1, 1, 1, 1, 1,
-0.7031441, -1.079069, -3.794564, 1, 1, 1, 1, 1,
-0.7022622, -1.257548, -4.069281, 1, 1, 1, 1, 1,
-0.7011231, 0.9092919, -0.3851622, 1, 1, 1, 1, 1,
-0.7002621, -0.9543245, -0.9545227, 1, 1, 1, 1, 1,
-0.6989074, 1.968423, 0.5229759, 1, 1, 1, 1, 1,
-0.6929168, 0.5166357, -2.103235, 1, 1, 1, 1, 1,
-0.6848254, -1.934137, -2.426942, 1, 1, 1, 1, 1,
-0.6845651, 0.2731255, -1.07654, 1, 1, 1, 1, 1,
-0.6788902, -1.047093, -2.288079, 1, 1, 1, 1, 1,
-0.6764003, 0.4898083, -0.8245496, 1, 1, 1, 1, 1,
-0.6650644, -0.9057027, -2.522037, 1, 1, 1, 1, 1,
-0.6631899, -0.2206694, -2.732752, 1, 1, 1, 1, 1,
-0.6611613, 0.3684525, -1.416753, 1, 1, 1, 1, 1,
-0.6573371, 0.3403789, -0.1617457, 1, 1, 1, 1, 1,
-0.649179, -0.7912912, -3.103136, 0, 0, 1, 1, 1,
-0.646574, -0.03543565, -3.402943, 1, 0, 0, 1, 1,
-0.6374035, -0.0969613, -0.5100325, 1, 0, 0, 1, 1,
-0.6372846, -1.015844, -1.224165, 1, 0, 0, 1, 1,
-0.6343262, 0.7125393, -1.538548, 1, 0, 0, 1, 1,
-0.6304061, 2.200197, 0.1012962, 1, 0, 0, 1, 1,
-0.6299347, 0.1255018, -1.052788, 0, 0, 0, 1, 1,
-0.6193075, -1.289876, -3.028253, 0, 0, 0, 1, 1,
-0.6191382, -2.103806, -3.827909, 0, 0, 0, 1, 1,
-0.6173241, -0.05282789, 0.1149317, 0, 0, 0, 1, 1,
-0.6159694, -0.7120081, -1.11759, 0, 0, 0, 1, 1,
-0.6112742, -0.1679007, -3.034607, 0, 0, 0, 1, 1,
-0.6022662, 2.834461, 0.79004, 0, 0, 0, 1, 1,
-0.6010031, -2.166454, -2.529133, 1, 1, 1, 1, 1,
-0.5973334, 0.004210288, -1.820683, 1, 1, 1, 1, 1,
-0.5960475, -2.655996, -0.5325529, 1, 1, 1, 1, 1,
-0.5887554, 0.3055494, -0.2726938, 1, 1, 1, 1, 1,
-0.5750306, 0.7402743, -1.870739, 1, 1, 1, 1, 1,
-0.5699108, -1.31992, -3.908069, 1, 1, 1, 1, 1,
-0.5656751, 0.3434416, 0.3144048, 1, 1, 1, 1, 1,
-0.5621321, -0.5098287, -0.5194253, 1, 1, 1, 1, 1,
-0.5616228, -1.202461, -2.277948, 1, 1, 1, 1, 1,
-0.5580899, -0.7825607, -5.096181, 1, 1, 1, 1, 1,
-0.557355, 0.2343251, -1.546172, 1, 1, 1, 1, 1,
-0.5549134, -0.3151673, -2.155757, 1, 1, 1, 1, 1,
-0.5524612, 0.8762555, 0.2551551, 1, 1, 1, 1, 1,
-0.5516169, 1.14919, -0.2957799, 1, 1, 1, 1, 1,
-0.5472507, 0.6137372, -1.092232, 1, 1, 1, 1, 1,
-0.5460669, -0.5095416, -3.497831, 0, 0, 1, 1, 1,
-0.5421309, 0.6150157, 1.55542, 1, 0, 0, 1, 1,
-0.5352554, 1.575317, 1.814767, 1, 0, 0, 1, 1,
-0.5341023, -1.27724, -1.896223, 1, 0, 0, 1, 1,
-0.5315196, 0.9301814, 1.123226, 1, 0, 0, 1, 1,
-0.5228614, -0.5495455, -0.8090498, 1, 0, 0, 1, 1,
-0.5212817, 0.7429827, 0.6634075, 0, 0, 0, 1, 1,
-0.5211271, -0.4292789, -3.338662, 0, 0, 0, 1, 1,
-0.5202462, -1.35703, -3.158242, 0, 0, 0, 1, 1,
-0.5175316, 0.6742206, -1.2973, 0, 0, 0, 1, 1,
-0.5100564, 0.5798023, -0.8259869, 0, 0, 0, 1, 1,
-0.5091594, 1.500876, 0.3032905, 0, 0, 0, 1, 1,
-0.5043663, -2.231414, -3.227479, 0, 0, 0, 1, 1,
-0.5025862, 1.578344, 0.4808726, 1, 1, 1, 1, 1,
-0.5002235, -0.3276987, -1.990521, 1, 1, 1, 1, 1,
-0.4999048, -0.8594133, -3.518982, 1, 1, 1, 1, 1,
-0.4998333, -1.080384, -2.339734, 1, 1, 1, 1, 1,
-0.4993252, -1.278727, -1.391803, 1, 1, 1, 1, 1,
-0.4991167, 0.7249135, -0.961684, 1, 1, 1, 1, 1,
-0.4941669, -0.747934, -3.081938, 1, 1, 1, 1, 1,
-0.4869395, -0.9246073, -3.399155, 1, 1, 1, 1, 1,
-0.4843518, -0.7721727, -1.34948, 1, 1, 1, 1, 1,
-0.4803596, -1.803052, -3.900619, 1, 1, 1, 1, 1,
-0.4787696, 1.218916, -2.005059, 1, 1, 1, 1, 1,
-0.4753587, 0.9908953, -0.2437265, 1, 1, 1, 1, 1,
-0.4741335, -0.6039802, -1.942178, 1, 1, 1, 1, 1,
-0.469805, -0.581241, -1.17315, 1, 1, 1, 1, 1,
-0.4695769, 0.790013, -1.621859, 1, 1, 1, 1, 1,
-0.4682233, 0.5274419, -1.032463, 0, 0, 1, 1, 1,
-0.4675365, 0.670718, 0.4182619, 1, 0, 0, 1, 1,
-0.466495, -1.320375, -3.565787, 1, 0, 0, 1, 1,
-0.4633833, -0.7087589, -3.521038, 1, 0, 0, 1, 1,
-0.462828, -2.029617, -2.16326, 1, 0, 0, 1, 1,
-0.4609296, 0.8670409, -1.189433, 1, 0, 0, 1, 1,
-0.4576411, -0.09297562, -0.3342784, 0, 0, 0, 1, 1,
-0.4510714, -0.08200292, -0.8747878, 0, 0, 0, 1, 1,
-0.4480102, 0.71131, -1.147076, 0, 0, 0, 1, 1,
-0.4471679, -0.4652205, -1.46468, 0, 0, 0, 1, 1,
-0.4459506, 0.2981993, -1.819895, 0, 0, 0, 1, 1,
-0.4427043, -0.4289368, -3.987001, 0, 0, 0, 1, 1,
-0.4415464, -0.6074184, -0.7972999, 0, 0, 0, 1, 1,
-0.4364208, -0.06779212, -1.443801, 1, 1, 1, 1, 1,
-0.4357519, -0.1640026, -3.739331, 1, 1, 1, 1, 1,
-0.4348845, -1.793455, -2.592683, 1, 1, 1, 1, 1,
-0.4327641, 0.7090607, 0.4455985, 1, 1, 1, 1, 1,
-0.4317867, 1.575092, -0.2545247, 1, 1, 1, 1, 1,
-0.4305408, 0.4001645, -0.7260499, 1, 1, 1, 1, 1,
-0.4254355, 0.8059609, -0.9663762, 1, 1, 1, 1, 1,
-0.4206538, 0.2865803, -2.648217, 1, 1, 1, 1, 1,
-0.4202613, -0.3843159, -1.974881, 1, 1, 1, 1, 1,
-0.4192598, 0.4649127, -0.6932452, 1, 1, 1, 1, 1,
-0.4186366, 0.9063762, -0.6547118, 1, 1, 1, 1, 1,
-0.4162365, 0.9480688, -0.3521203, 1, 1, 1, 1, 1,
-0.4156682, 0.4883222, -0.6110719, 1, 1, 1, 1, 1,
-0.4145992, 0.8826634, -1.012157, 1, 1, 1, 1, 1,
-0.4092253, 0.5785578, -0.2012625, 1, 1, 1, 1, 1,
-0.4073941, 1.854458, 0.5747803, 0, 0, 1, 1, 1,
-0.403241, 1.567561, -0.4937215, 1, 0, 0, 1, 1,
-0.4015688, 1.297692, -0.8303272, 1, 0, 0, 1, 1,
-0.401189, 0.7357576, -0.5271543, 1, 0, 0, 1, 1,
-0.3968229, 0.5701128, -0.07536268, 1, 0, 0, 1, 1,
-0.3903936, -0.03443393, -1.50841, 1, 0, 0, 1, 1,
-0.3864847, 1.392372, 0.943009, 0, 0, 0, 1, 1,
-0.3848292, 0.9853045, -0.4750882, 0, 0, 0, 1, 1,
-0.384191, -0.8280652, -6.015159, 0, 0, 0, 1, 1,
-0.3788957, -0.2099495, -0.7440497, 0, 0, 0, 1, 1,
-0.378189, -1.005915, -2.498183, 0, 0, 0, 1, 1,
-0.3772282, -1.33068, -2.831248, 0, 0, 0, 1, 1,
-0.3755138, -0.5152718, -3.79566, 0, 0, 0, 1, 1,
-0.3747658, 0.849444, -0.3251318, 1, 1, 1, 1, 1,
-0.3731693, 0.5061327, -1.183903, 1, 1, 1, 1, 1,
-0.3719994, 1.060495, -0.1320521, 1, 1, 1, 1, 1,
-0.3702672, 0.3090381, -0.1358139, 1, 1, 1, 1, 1,
-0.369969, 0.6143796, -0.07815071, 1, 1, 1, 1, 1,
-0.3692287, -0.2003013, -2.15592, 1, 1, 1, 1, 1,
-0.3679332, -1.603482, -2.815836, 1, 1, 1, 1, 1,
-0.3652624, -1.553745, -2.021688, 1, 1, 1, 1, 1,
-0.3620021, 0.1812773, 0.0326774, 1, 1, 1, 1, 1,
-0.3618022, -0.8602748, -1.986374, 1, 1, 1, 1, 1,
-0.3599434, 0.8089119, 0.3597762, 1, 1, 1, 1, 1,
-0.3562141, 0.9154083, 0.07956666, 1, 1, 1, 1, 1,
-0.3532712, 0.5350456, -2.208985, 1, 1, 1, 1, 1,
-0.3524533, 0.2320468, -1.522421, 1, 1, 1, 1, 1,
-0.3519746, 0.6940677, 0.4773593, 1, 1, 1, 1, 1,
-0.3491165, 0.06676927, -1.448422, 0, 0, 1, 1, 1,
-0.3476396, 1.759231, 1.334877, 1, 0, 0, 1, 1,
-0.3459472, 0.9933136, -0.4289531, 1, 0, 0, 1, 1,
-0.3440663, -0.08859542, -0.9314218, 1, 0, 0, 1, 1,
-0.343976, 0.5782886, -1.718473, 1, 0, 0, 1, 1,
-0.3430689, 0.183246, -2.343669, 1, 0, 0, 1, 1,
-0.3328383, -0.5219638, -3.155456, 0, 0, 0, 1, 1,
-0.3317387, -3.04553, -2.241229, 0, 0, 0, 1, 1,
-0.3292499, -0.8518468, -2.520007, 0, 0, 0, 1, 1,
-0.3177813, -0.5270318, -2.839417, 0, 0, 0, 1, 1,
-0.3177648, -0.1334813, -1.709837, 0, 0, 0, 1, 1,
-0.3176328, 0.7350133, -0.5648253, 0, 0, 0, 1, 1,
-0.3149188, 0.3220442, -1.770591, 0, 0, 0, 1, 1,
-0.3131726, -1.352961, -4.940406, 1, 1, 1, 1, 1,
-0.3127114, 1.434194, -0.2700035, 1, 1, 1, 1, 1,
-0.3120742, 0.1367532, -1.905158, 1, 1, 1, 1, 1,
-0.3036037, -0.6615833, -3.259418, 1, 1, 1, 1, 1,
-0.2987595, -0.3924398, -0.4763873, 1, 1, 1, 1, 1,
-0.2944745, -0.3878495, -2.742266, 1, 1, 1, 1, 1,
-0.2936983, -1.116019, -1.112879, 1, 1, 1, 1, 1,
-0.2920671, 0.5362196, -0.4784636, 1, 1, 1, 1, 1,
-0.2895704, 0.7638623, 0.4858643, 1, 1, 1, 1, 1,
-0.2894045, 0.2566378, 0.2558098, 1, 1, 1, 1, 1,
-0.2884436, 0.06837276, -1.175707, 1, 1, 1, 1, 1,
-0.2856957, -0.2266665, -1.507755, 1, 1, 1, 1, 1,
-0.2837581, 0.08584412, -1.769429, 1, 1, 1, 1, 1,
-0.2794376, 0.001464062, -1.330382, 1, 1, 1, 1, 1,
-0.2789799, -0.4021183, -1.496866, 1, 1, 1, 1, 1,
-0.2756462, 1.539965, -1.049823, 0, 0, 1, 1, 1,
-0.2750181, 0.3325181, -0.700671, 1, 0, 0, 1, 1,
-0.2730214, -2.134586, -2.021368, 1, 0, 0, 1, 1,
-0.2715096, -1.78081, -0.8454615, 1, 0, 0, 1, 1,
-0.2696222, -1.262267, -3.046593, 1, 0, 0, 1, 1,
-0.2661475, 0.9313906, 0.06459332, 1, 0, 0, 1, 1,
-0.2615641, -1.30642, -1.837347, 0, 0, 0, 1, 1,
-0.2582408, -0.1530154, -4.13844, 0, 0, 0, 1, 1,
-0.2553737, -0.5262574, -1.920007, 0, 0, 0, 1, 1,
-0.2514003, -0.3822551, -3.164147, 0, 0, 0, 1, 1,
-0.2495704, 0.6289428, -0.6117179, 0, 0, 0, 1, 1,
-0.2488468, 2.036233, 0.5280344, 0, 0, 0, 1, 1,
-0.247306, 1.113884, -1.245742, 0, 0, 0, 1, 1,
-0.2450678, 1.103146, 1.67275, 1, 1, 1, 1, 1,
-0.2423602, -1.182442, -0.7287806, 1, 1, 1, 1, 1,
-0.2423219, 0.1503696, -1.029613, 1, 1, 1, 1, 1,
-0.2419013, -2.065074, -2.957926, 1, 1, 1, 1, 1,
-0.2398093, -1.517189, -2.563837, 1, 1, 1, 1, 1,
-0.2390231, 0.1089576, -2.072029, 1, 1, 1, 1, 1,
-0.2361353, 0.3454939, -0.5107629, 1, 1, 1, 1, 1,
-0.2353935, 0.1292707, -1.628377, 1, 1, 1, 1, 1,
-0.2341128, 0.1890572, 0.2699616, 1, 1, 1, 1, 1,
-0.2305581, -0.07586575, -1.695833, 1, 1, 1, 1, 1,
-0.2294018, -2.090811, -2.824039, 1, 1, 1, 1, 1,
-0.2185047, -0.5700907, -3.21578, 1, 1, 1, 1, 1,
-0.2171977, -2.211601, -3.865841, 1, 1, 1, 1, 1,
-0.2163463, 0.962396, 0.4710606, 1, 1, 1, 1, 1,
-0.2155899, 1.644822, 1.253845, 1, 1, 1, 1, 1,
-0.206533, -1.489807, -2.749802, 0, 0, 1, 1, 1,
-0.2060933, 0.9030547, -0.1774711, 1, 0, 0, 1, 1,
-0.2026391, 0.2658303, -1.81928, 1, 0, 0, 1, 1,
-0.2011718, -0.1845342, -2.570021, 1, 0, 0, 1, 1,
-0.1996681, 0.450818, -0.3411792, 1, 0, 0, 1, 1,
-0.1967407, 1.162322, 0.2201414, 1, 0, 0, 1, 1,
-0.1893272, -0.649563, -2.317581, 0, 0, 0, 1, 1,
-0.1888326, -1.183513, -3.596119, 0, 0, 0, 1, 1,
-0.1882566, -0.1454527, -2.945796, 0, 0, 0, 1, 1,
-0.185008, 0.9231143, -0.6610907, 0, 0, 0, 1, 1,
-0.184187, 1.370322, -1.603253, 0, 0, 0, 1, 1,
-0.1730665, 0.09218868, -1.304666, 0, 0, 0, 1, 1,
-0.1702671, -0.8762279, -2.905326, 0, 0, 0, 1, 1,
-0.1670514, 0.8225196, -0.6239818, 1, 1, 1, 1, 1,
-0.1667955, 1.291437, -0.7027705, 1, 1, 1, 1, 1,
-0.1651897, 2.701218, 0.5368859, 1, 1, 1, 1, 1,
-0.1628176, -0.1556206, -2.039655, 1, 1, 1, 1, 1,
-0.1505804, 0.1561145, 0.534923, 1, 1, 1, 1, 1,
-0.1493091, -0.9681497, -4.700691, 1, 1, 1, 1, 1,
-0.1477405, 0.7634601, -1.654149, 1, 1, 1, 1, 1,
-0.1415818, -0.8838945, -1.991539, 1, 1, 1, 1, 1,
-0.1364992, 0.2164482, 0.08981546, 1, 1, 1, 1, 1,
-0.1319674, -1.189312, -3.76417, 1, 1, 1, 1, 1,
-0.1319411, 2.074446, -1.476039, 1, 1, 1, 1, 1,
-0.1285728, -0.6813373, -2.67115, 1, 1, 1, 1, 1,
-0.1285499, 0.2147788, -0.6614919, 1, 1, 1, 1, 1,
-0.1259675, 0.2290174, -0.3431878, 1, 1, 1, 1, 1,
-0.1250863, -1.98068, -2.780195, 1, 1, 1, 1, 1,
-0.1223489, 1.967246, 0.3333544, 0, 0, 1, 1, 1,
-0.1207996, -1.352244, -2.450079, 1, 0, 0, 1, 1,
-0.1125704, -1.490047, -4.68577, 1, 0, 0, 1, 1,
-0.1104755, 0.1870017, -1.274503, 1, 0, 0, 1, 1,
-0.09488619, -0.1552154, -5.029995, 1, 0, 0, 1, 1,
-0.09477095, 1.877221, -0.3024307, 1, 0, 0, 1, 1,
-0.09414963, 0.2398736, -0.4731216, 0, 0, 0, 1, 1,
-0.09321763, 1.010756, -0.3824553, 0, 0, 0, 1, 1,
-0.09104091, 0.4194292, 0.5204294, 0, 0, 0, 1, 1,
-0.09090719, 1.065007, 1.060497, 0, 0, 0, 1, 1,
-0.08990901, -0.3300449, -4.000228, 0, 0, 0, 1, 1,
-0.08867683, -1.144415, -2.076102, 0, 0, 0, 1, 1,
-0.08561902, 0.6489103, -0.09888762, 0, 0, 0, 1, 1,
-0.08482689, 0.2009037, 0.2330847, 1, 1, 1, 1, 1,
-0.08162459, 0.2662703, -0.2683845, 1, 1, 1, 1, 1,
-0.07675942, 0.6193815, -0.6322501, 1, 1, 1, 1, 1,
-0.07429039, 1.976239, -0.3723568, 1, 1, 1, 1, 1,
-0.07325194, -0.8429729, -3.600945, 1, 1, 1, 1, 1,
-0.06918567, -0.4291979, -4.31821, 1, 1, 1, 1, 1,
-0.06872182, 0.7981511, 0.2230125, 1, 1, 1, 1, 1,
-0.06829234, -0.2416229, -4.86117, 1, 1, 1, 1, 1,
-0.0662694, 0.8747298, -0.5730498, 1, 1, 1, 1, 1,
-0.0648363, -1.419289, -3.816742, 1, 1, 1, 1, 1,
-0.06194932, -0.8572896, -4.600646, 1, 1, 1, 1, 1,
-0.05776589, -0.01795083, -0.4982525, 1, 1, 1, 1, 1,
-0.05558005, -1.461806, -2.130035, 1, 1, 1, 1, 1,
-0.05382863, -0.4643552, -2.987344, 1, 1, 1, 1, 1,
-0.05033936, 1.380219, 0.7085043, 1, 1, 1, 1, 1,
-0.04599439, 0.417076, 0.8681753, 0, 0, 1, 1, 1,
-0.04557124, -1.058039, -4.888237, 1, 0, 0, 1, 1,
-0.03863551, -0.894262, -3.204139, 1, 0, 0, 1, 1,
-0.03719178, 1.87532, 1.530369, 1, 0, 0, 1, 1,
-0.03465879, -0.05955698, -2.129583, 1, 0, 0, 1, 1,
-0.03385259, -1.194512, -2.903873, 1, 0, 0, 1, 1,
-0.03194119, 0.4653556, 0.5944611, 0, 0, 0, 1, 1,
-0.02848271, 0.06404927, 0.182006, 0, 0, 0, 1, 1,
-0.02757966, 1.592659, -2.055991, 0, 0, 0, 1, 1,
-0.0263447, 0.8906275, -0.2873353, 0, 0, 0, 1, 1,
-0.01904423, 0.2723534, -1.219014, 0, 0, 0, 1, 1,
-0.01817088, 1.294426, -0.3820065, 0, 0, 0, 1, 1,
-0.01606645, 0.5149444, 0.8661546, 0, 0, 0, 1, 1,
-0.01396325, -0.9739086, -2.199241, 1, 1, 1, 1, 1,
-0.01093591, -0.3126565, -3.592291, 1, 1, 1, 1, 1,
-0.009276406, -1.271132, -0.6887556, 1, 1, 1, 1, 1,
-0.007330978, 0.5936192, 1.843636, 1, 1, 1, 1, 1,
-0.00687839, -1.243328, -2.737513, 1, 1, 1, 1, 1,
-0.006592124, -1.296912, -4.351942, 1, 1, 1, 1, 1,
-0.005457852, -0.3386019, -3.347424, 1, 1, 1, 1, 1,
0.007273992, -0.8257057, 3.472316, 1, 1, 1, 1, 1,
0.008445216, -0.4020691, 5.435086, 1, 1, 1, 1, 1,
0.009077251, -0.9253095, 2.75147, 1, 1, 1, 1, 1,
0.009549713, -3.717324, 4.155481, 1, 1, 1, 1, 1,
0.009972139, 1.777947, 1.410085, 1, 1, 1, 1, 1,
0.01465057, -0.3350251, 2.227573, 1, 1, 1, 1, 1,
0.01563515, -1.416279, 5.177686, 1, 1, 1, 1, 1,
0.0187122, 0.5547172, 1.342755, 1, 1, 1, 1, 1,
0.02212421, -1.020334, 3.956889, 0, 0, 1, 1, 1,
0.02621539, 1.172127, -0.8789083, 1, 0, 0, 1, 1,
0.02721563, 0.1841988, 1.165726, 1, 0, 0, 1, 1,
0.02927666, 1.470223, -0.7801214, 1, 0, 0, 1, 1,
0.03262741, -1.832185, 2.694008, 1, 0, 0, 1, 1,
0.03318004, 0.2243159, 0.09166157, 1, 0, 0, 1, 1,
0.03375831, 0.4529808, -0.09995779, 0, 0, 0, 1, 1,
0.03613987, 0.3044375, 0.1462648, 0, 0, 0, 1, 1,
0.03871318, -0.01602328, 2.666968, 0, 0, 0, 1, 1,
0.04441807, 0.08881806, -0.3929674, 0, 0, 0, 1, 1,
0.04569452, -0.5168658, 2.561862, 0, 0, 0, 1, 1,
0.05394321, -0.04616214, 3.436418, 0, 0, 0, 1, 1,
0.05541075, -0.3451406, 3.01224, 0, 0, 0, 1, 1,
0.05808823, 1.034193, -0.6395132, 1, 1, 1, 1, 1,
0.06525291, 0.06533208, 1.982423, 1, 1, 1, 1, 1,
0.06551572, -1.411343, 1.545584, 1, 1, 1, 1, 1,
0.0686339, 0.2715833, 1.400365, 1, 1, 1, 1, 1,
0.06892838, 0.0743405, 1.092396, 1, 1, 1, 1, 1,
0.07066409, 0.2836862, -0.08031915, 1, 1, 1, 1, 1,
0.07271823, 1.01212, -1.096427, 1, 1, 1, 1, 1,
0.08163308, -0.09465802, 1.994588, 1, 1, 1, 1, 1,
0.08279434, 0.4213225, 1.219922, 1, 1, 1, 1, 1,
0.08366329, 0.9751061, 0.1585754, 1, 1, 1, 1, 1,
0.09198585, -0.5487699, 2.81918, 1, 1, 1, 1, 1,
0.1045083, 0.4944577, -0.3776853, 1, 1, 1, 1, 1,
0.104766, -1.511885, 3.951345, 1, 1, 1, 1, 1,
0.1061335, 0.3654879, -0.3429087, 1, 1, 1, 1, 1,
0.1077753, 0.7440565, -1.128126, 1, 1, 1, 1, 1,
0.1080979, -0.8964465, 3.105954, 0, 0, 1, 1, 1,
0.1084386, -0.4912232, 2.486341, 1, 0, 0, 1, 1,
0.114098, 0.2205452, 1.188197, 1, 0, 0, 1, 1,
0.1162924, -0.04086359, 2.114232, 1, 0, 0, 1, 1,
0.1169624, -0.2685017, 4.851745, 1, 0, 0, 1, 1,
0.1175295, -0.9626167, 4.800107, 1, 0, 0, 1, 1,
0.1196444, -0.4458524, 4.480541, 0, 0, 0, 1, 1,
0.1229848, 0.05084748, -0.628801, 0, 0, 0, 1, 1,
0.1234046, -0.2985335, 0.9049231, 0, 0, 0, 1, 1,
0.1300606, -0.2743903, 3.143895, 0, 0, 0, 1, 1,
0.1349958, 1.357568, 0.4917278, 0, 0, 0, 1, 1,
0.1392825, 1.299823, 1.278908, 0, 0, 0, 1, 1,
0.1411476, 1.066604, -0.4512765, 0, 0, 0, 1, 1,
0.1412435, 0.6379054, 1.087678, 1, 1, 1, 1, 1,
0.1445902, -0.4615642, 2.248173, 1, 1, 1, 1, 1,
0.1507684, 0.04132472, 0.5012875, 1, 1, 1, 1, 1,
0.1511289, 0.03349212, 1.706589, 1, 1, 1, 1, 1,
0.1521472, 0.5697178, 1.397741, 1, 1, 1, 1, 1,
0.1547927, 1.514934, -1.081389, 1, 1, 1, 1, 1,
0.156861, -0.2687809, 3.019189, 1, 1, 1, 1, 1,
0.1599985, -0.5795912, 4.848501, 1, 1, 1, 1, 1,
0.1612728, 0.9142371, 0.07139788, 1, 1, 1, 1, 1,
0.162984, -1.17794, 4.042826, 1, 1, 1, 1, 1,
0.1665567, 0.578036, -0.2598354, 1, 1, 1, 1, 1,
0.1678073, 0.7174342, -0.0687236, 1, 1, 1, 1, 1,
0.1691016, -1.870402, 3.188686, 1, 1, 1, 1, 1,
0.1717601, 0.1607515, 1.811452, 1, 1, 1, 1, 1,
0.1721487, 0.8264219, 0.5109547, 1, 1, 1, 1, 1,
0.1773446, -1.422982, 2.311589, 0, 0, 1, 1, 1,
0.1783261, -0.9161237, 1.955637, 1, 0, 0, 1, 1,
0.1799554, -0.7239721, 3.711102, 1, 0, 0, 1, 1,
0.1808604, -0.2223673, 2.616482, 1, 0, 0, 1, 1,
0.1883107, 0.5015997, -0.1930034, 1, 0, 0, 1, 1,
0.1914603, 0.3233325, 0.3180152, 1, 0, 0, 1, 1,
0.1915255, 0.06752498, 2.968609, 0, 0, 0, 1, 1,
0.1916172, 0.04377267, 0.02790362, 0, 0, 0, 1, 1,
0.1921293, -0.6511083, 2.795958, 0, 0, 0, 1, 1,
0.1945194, 0.6175735, 1.287125, 0, 0, 0, 1, 1,
0.1980284, 0.1474238, 0.09816141, 0, 0, 0, 1, 1,
0.2012618, 2.257966, -0.9076205, 0, 0, 0, 1, 1,
0.2051388, 0.2310966, 1.2729, 0, 0, 0, 1, 1,
0.2055123, -1.822287, 4.48324, 1, 1, 1, 1, 1,
0.2061509, -0.7832265, 4.30701, 1, 1, 1, 1, 1,
0.2069596, -1.429705, 0.8909161, 1, 1, 1, 1, 1,
0.2092592, -0.576041, 1.332661, 1, 1, 1, 1, 1,
0.2109177, 1.809896, -0.007419302, 1, 1, 1, 1, 1,
0.2122522, -0.3785506, 2.526229, 1, 1, 1, 1, 1,
0.2126332, -0.6046531, 4.211073, 1, 1, 1, 1, 1,
0.2214824, -1.785974, 3.286549, 1, 1, 1, 1, 1,
0.2250409, -0.2802143, 3.348111, 1, 1, 1, 1, 1,
0.2258968, -1.919955, 2.714474, 1, 1, 1, 1, 1,
0.2259979, -0.7113717, 2.710855, 1, 1, 1, 1, 1,
0.2295106, -1.164743, 1.814347, 1, 1, 1, 1, 1,
0.2317327, 0.836489, -0.3045883, 1, 1, 1, 1, 1,
0.2512321, 1.216369, -0.2713242, 1, 1, 1, 1, 1,
0.2543866, 0.1918227, 1.063044, 1, 1, 1, 1, 1,
0.2555721, -1.102206, 2.15295, 0, 0, 1, 1, 1,
0.2561343, -1.385385, 1.342427, 1, 0, 0, 1, 1,
0.2588805, -0.9285527, 2.931257, 1, 0, 0, 1, 1,
0.2608804, 0.6366534, -0.728321, 1, 0, 0, 1, 1,
0.2618792, 0.4982212, -0.1520634, 1, 0, 0, 1, 1,
0.2655299, 0.3384808, 0.5828839, 1, 0, 0, 1, 1,
0.2756039, -0.2198298, 2.879465, 0, 0, 0, 1, 1,
0.2771633, -0.9967451, 3.653436, 0, 0, 0, 1, 1,
0.2781045, 1.875599, -0.2248891, 0, 0, 0, 1, 1,
0.2790884, 1.095604, -0.204053, 0, 0, 0, 1, 1,
0.2803061, -1.486823, 3.498819, 0, 0, 0, 1, 1,
0.2831744, -0.2902992, 1.72801, 0, 0, 0, 1, 1,
0.2834924, 0.3561408, 2.142192, 0, 0, 0, 1, 1,
0.2853776, 0.7827625, 0.6757374, 1, 1, 1, 1, 1,
0.2854056, -1.881613, 2.730458, 1, 1, 1, 1, 1,
0.286525, -0.6908267, 2.381454, 1, 1, 1, 1, 1,
0.2882057, 0.2520026, -2.245856, 1, 1, 1, 1, 1,
0.2885243, 0.06192951, 2.918462, 1, 1, 1, 1, 1,
0.2911694, -1.217412, 2.798569, 1, 1, 1, 1, 1,
0.2940301, -1.781821, 4.986402, 1, 1, 1, 1, 1,
0.2952117, 1.439999, 1.121561, 1, 1, 1, 1, 1,
0.2958739, -0.01524658, -0.1163937, 1, 1, 1, 1, 1,
0.2968446, 0.7808803, 0.006305387, 1, 1, 1, 1, 1,
0.3017119, 1.926059, 0.6289923, 1, 1, 1, 1, 1,
0.3054778, -0.2328221, 2.838597, 1, 1, 1, 1, 1,
0.3084773, -0.4863354, 0.1322744, 1, 1, 1, 1, 1,
0.3120694, -0.5469674, 0.9775542, 1, 1, 1, 1, 1,
0.316917, 0.03253393, 0.6900402, 1, 1, 1, 1, 1,
0.3214022, -1.555655, 3.354006, 0, 0, 1, 1, 1,
0.3241065, -1.652079, 2.910038, 1, 0, 0, 1, 1,
0.3243636, -0.7253205, 2.88027, 1, 0, 0, 1, 1,
0.3269675, 1.626233, 0.3768997, 1, 0, 0, 1, 1,
0.3300953, -0.2735055, 1.109434, 1, 0, 0, 1, 1,
0.3309384, 1.138767, 1.113506, 1, 0, 0, 1, 1,
0.334028, -1.060662, 2.716332, 0, 0, 0, 1, 1,
0.3347029, 1.200295, -0.5380213, 0, 0, 0, 1, 1,
0.3380317, -0.6793919, 1.503405, 0, 0, 0, 1, 1,
0.3398704, 0.1152996, 2.859809, 0, 0, 0, 1, 1,
0.3399757, -0.3398363, 1.54693, 0, 0, 0, 1, 1,
0.3401163, 0.1007299, 2.736294, 0, 0, 0, 1, 1,
0.3416589, -1.154521, 1.4713, 0, 0, 0, 1, 1,
0.3426695, 0.2563899, 0.7775995, 1, 1, 1, 1, 1,
0.3429425, 1.397471, -0.3584931, 1, 1, 1, 1, 1,
0.3477405, -2.000819, 2.941746, 1, 1, 1, 1, 1,
0.3495864, 0.02665802, -0.4039085, 1, 1, 1, 1, 1,
0.353552, -0.2891582, 2.50112, 1, 1, 1, 1, 1,
0.3538237, 0.7149886, 0.7224588, 1, 1, 1, 1, 1,
0.3567906, 1.660038, 1.45973, 1, 1, 1, 1, 1,
0.3578985, -0.2090042, 0.957993, 1, 1, 1, 1, 1,
0.3589056, 0.8813561, 0.09388831, 1, 1, 1, 1, 1,
0.3605989, -0.12449, 1.247972, 1, 1, 1, 1, 1,
0.3611391, -1.023185, 3.483416, 1, 1, 1, 1, 1,
0.3635862, -0.3489709, 2.318017, 1, 1, 1, 1, 1,
0.3662796, -0.07224485, 0.9841103, 1, 1, 1, 1, 1,
0.3671324, -1.432513, 3.168746, 1, 1, 1, 1, 1,
0.3766108, 0.4262268, 0.1833872, 1, 1, 1, 1, 1,
0.3776855, 0.1442437, 0.5467193, 0, 0, 1, 1, 1,
0.3787372, 0.7381914, -1.115621, 1, 0, 0, 1, 1,
0.3807157, -0.6758917, 1.969681, 1, 0, 0, 1, 1,
0.3824703, -0.6359804, 2.870654, 1, 0, 0, 1, 1,
0.3841966, -1.002798, 2.083136, 1, 0, 0, 1, 1,
0.3844394, -0.4755666, 4.42029, 1, 0, 0, 1, 1,
0.3850981, 0.05162914, 2.692648, 0, 0, 0, 1, 1,
0.3874637, -0.6912205, 3.042939, 0, 0, 0, 1, 1,
0.3880458, -1.645704, 3.12464, 0, 0, 0, 1, 1,
0.3887355, -1.490597, 1.897739, 0, 0, 0, 1, 1,
0.3920561, -0.9229761, 4.469117, 0, 0, 0, 1, 1,
0.3933303, 0.3392067, 1.706814, 0, 0, 0, 1, 1,
0.394786, 0.8933166, 0.256825, 0, 0, 0, 1, 1,
0.3994995, -1.445167, 2.640554, 1, 1, 1, 1, 1,
0.4012377, -0.5960715, 4.023544, 1, 1, 1, 1, 1,
0.4029296, -1.67528, 3.716302, 1, 1, 1, 1, 1,
0.4046456, -0.7562183, 3.156893, 1, 1, 1, 1, 1,
0.4066352, 0.6815104, 0.8337233, 1, 1, 1, 1, 1,
0.4073688, -0.6546552, 0.2749183, 1, 1, 1, 1, 1,
0.4087457, 1.746756, 1.167777, 1, 1, 1, 1, 1,
0.4124872, -2.252031, 3.192573, 1, 1, 1, 1, 1,
0.4160741, 0.5718151, 0.1466426, 1, 1, 1, 1, 1,
0.4211739, -0.7246487, 2.208947, 1, 1, 1, 1, 1,
0.4245064, -0.01578869, 2.263978, 1, 1, 1, 1, 1,
0.4266436, -0.2247612, 1.649102, 1, 1, 1, 1, 1,
0.427286, 1.637014, 0.5264795, 1, 1, 1, 1, 1,
0.4281951, 0.3431812, -0.4383357, 1, 1, 1, 1, 1,
0.432768, 0.8378441, 0.4441667, 1, 1, 1, 1, 1,
0.4366944, -0.7726862, 4.739266, 0, 0, 1, 1, 1,
0.4384292, -0.09829051, -0.3513895, 1, 0, 0, 1, 1,
0.4425104, -0.4999965, 1.694776, 1, 0, 0, 1, 1,
0.4434174, -0.2659489, 1.98942, 1, 0, 0, 1, 1,
0.4466559, -0.3509341, -0.2237249, 1, 0, 0, 1, 1,
0.4472041, 0.4319765, 0.3933099, 1, 0, 0, 1, 1,
0.450827, 0.4445547, 1.667535, 0, 0, 0, 1, 1,
0.4511604, -0.862193, 2.374912, 0, 0, 0, 1, 1,
0.4537909, 0.3180492, 0.8516063, 0, 0, 0, 1, 1,
0.4552459, -1.946181, 3.87113, 0, 0, 0, 1, 1,
0.4569763, -0.2971799, 1.622232, 0, 0, 0, 1, 1,
0.459782, -0.3343709, 2.250844, 0, 0, 0, 1, 1,
0.4679119, -2.318967, 3.685053, 0, 0, 0, 1, 1,
0.4688772, -0.7258927, 2.678382, 1, 1, 1, 1, 1,
0.4732401, 1.111616, 2.366198, 1, 1, 1, 1, 1,
0.477222, -0.6567259, 2.574999, 1, 1, 1, 1, 1,
0.4807786, 2.267587, -0.7931436, 1, 1, 1, 1, 1,
0.4809539, 0.7091658, -1.254068, 1, 1, 1, 1, 1,
0.485324, -0.9701272, 2.55124, 1, 1, 1, 1, 1,
0.4884129, -0.8349848, 2.172757, 1, 1, 1, 1, 1,
0.489069, 3.200714, 0.5518171, 1, 1, 1, 1, 1,
0.4946619, -0.6119844, 1.409824, 1, 1, 1, 1, 1,
0.500048, -0.7495559, 2.200499, 1, 1, 1, 1, 1,
0.5039464, -0.3610837, 2.391229, 1, 1, 1, 1, 1,
0.5043581, -0.1419062, 0.2970365, 1, 1, 1, 1, 1,
0.5060896, 0.5220582, 0.5359047, 1, 1, 1, 1, 1,
0.5126524, -0.1856264, 2.466897, 1, 1, 1, 1, 1,
0.5160125, 0.49986, 1.391301, 1, 1, 1, 1, 1,
0.5174438, 0.461407, 0.7752033, 0, 0, 1, 1, 1,
0.5216695, 1.028066, 1.574246, 1, 0, 0, 1, 1,
0.5238712, 0.2034317, 2.21858, 1, 0, 0, 1, 1,
0.5255451, -0.5130864, 0.09470303, 1, 0, 0, 1, 1,
0.5323271, 0.021667, 1.345953, 1, 0, 0, 1, 1,
0.5355791, -0.2998794, 1.919123, 1, 0, 0, 1, 1,
0.5407166, 1.551916, -0.8456509, 0, 0, 0, 1, 1,
0.5431198, -1.02721, 2.775627, 0, 0, 0, 1, 1,
0.5448588, 0.297133, 0.4310288, 0, 0, 0, 1, 1,
0.5465785, -0.7696725, 2.8824, 0, 0, 0, 1, 1,
0.5539109, -0.8846762, 4.026246, 0, 0, 0, 1, 1,
0.5573248, -0.05343017, 1.534349, 0, 0, 0, 1, 1,
0.5593399, -0.1202559, 3.237759, 0, 0, 0, 1, 1,
0.5626374, -0.9374896, 3.177032, 1, 1, 1, 1, 1,
0.5690522, -0.3173553, 2.146162, 1, 1, 1, 1, 1,
0.5691081, 1.148687, 0.5114021, 1, 1, 1, 1, 1,
0.5696412, 0.6304258, 3.060939, 1, 1, 1, 1, 1,
0.5734367, 0.4769, 1.038603, 1, 1, 1, 1, 1,
0.5734409, 1.977206, -0.5487582, 1, 1, 1, 1, 1,
0.5742995, 2.149149, 0.4351561, 1, 1, 1, 1, 1,
0.5748558, -0.2317742, 2.829766, 1, 1, 1, 1, 1,
0.5752729, -0.9710628, 2.097405, 1, 1, 1, 1, 1,
0.5820208, 2.009192, -0.01368917, 1, 1, 1, 1, 1,
0.5862024, -0.386287, 3.076536, 1, 1, 1, 1, 1,
0.5894923, 0.4139306, 1.145798, 1, 1, 1, 1, 1,
0.5934942, 1.180224, -0.5559862, 1, 1, 1, 1, 1,
0.5943905, -0.6043844, 2.996807, 1, 1, 1, 1, 1,
0.5981961, -0.148583, 2.006111, 1, 1, 1, 1, 1,
0.6006781, 1.546895, 0.7155319, 0, 0, 1, 1, 1,
0.6028554, 1.640879, -0.7678012, 1, 0, 0, 1, 1,
0.6031799, 0.3507703, 0.7382486, 1, 0, 0, 1, 1,
0.6038526, -1.422909, 3.292968, 1, 0, 0, 1, 1,
0.6052362, -1.090339, 2.215218, 1, 0, 0, 1, 1,
0.6078645, 0.4379151, 1.244489, 1, 0, 0, 1, 1,
0.608363, 0.5665469, -0.6189068, 0, 0, 0, 1, 1,
0.6100578, 0.06553379, 2.42033, 0, 0, 0, 1, 1,
0.6137564, -1.643792, 4.043447, 0, 0, 0, 1, 1,
0.6173124, -0.8168786, 3.935621, 0, 0, 0, 1, 1,
0.6190636, 0.8790614, 0.6649055, 0, 0, 0, 1, 1,
0.624653, -2.123497, 3.021869, 0, 0, 0, 1, 1,
0.6309625, 0.7125736, 2.311289, 0, 0, 0, 1, 1,
0.6316734, -0.5263171, 2.375808, 1, 1, 1, 1, 1,
0.6322464, 0.8655306, 0.6703546, 1, 1, 1, 1, 1,
0.6377594, 0.009340546, 2.86338, 1, 1, 1, 1, 1,
0.639352, -0.3949321, 2.178078, 1, 1, 1, 1, 1,
0.6432358, 0.8046374, 2.232045, 1, 1, 1, 1, 1,
0.6452076, -1.292247, 2.460238, 1, 1, 1, 1, 1,
0.6494352, -0.3001566, 2.126234, 1, 1, 1, 1, 1,
0.6504947, 1.211521, -0.5098345, 1, 1, 1, 1, 1,
0.6518022, 0.8137732, 0.7481684, 1, 1, 1, 1, 1,
0.6593876, 1.559348, 0.01168075, 1, 1, 1, 1, 1,
0.6634767, -1.954474, 3.264202, 1, 1, 1, 1, 1,
0.668578, 0.3180338, 0.02844533, 1, 1, 1, 1, 1,
0.6774904, 0.01525254, 1.998433, 1, 1, 1, 1, 1,
0.6817359, 0.7688801, 0.5715536, 1, 1, 1, 1, 1,
0.6817908, 1.823301, 0.6628168, 1, 1, 1, 1, 1,
0.6831242, 0.5696515, 2.462433, 0, 0, 1, 1, 1,
0.6843496, -0.3598537, 2.557104, 1, 0, 0, 1, 1,
0.6998309, 1.320008, 1.79703, 1, 0, 0, 1, 1,
0.7049766, -1.168877, 2.453276, 1, 0, 0, 1, 1,
0.7065611, 0.5132023, 0.1239176, 1, 0, 0, 1, 1,
0.7098857, 0.8135908, 0.7770934, 1, 0, 0, 1, 1,
0.7114286, 0.8313712, 0.2025945, 0, 0, 0, 1, 1,
0.7319822, -0.187139, 2.721812, 0, 0, 0, 1, 1,
0.7329856, -0.7408332, 1.386887, 0, 0, 0, 1, 1,
0.7337313, 1.7342, 0.08599713, 0, 0, 0, 1, 1,
0.7347214, 0.7799918, 1.588483, 0, 0, 0, 1, 1,
0.7446468, -0.4559351, 1.177005, 0, 0, 0, 1, 1,
0.7512681, 0.9776422, 0.5986655, 0, 0, 0, 1, 1,
0.7533081, 0.4115897, 1.701909, 1, 1, 1, 1, 1,
0.7535884, -1.119914, 1.675775, 1, 1, 1, 1, 1,
0.7578092, 2.164009, 1.035291, 1, 1, 1, 1, 1,
0.7589709, 1.187525, 1.263372, 1, 1, 1, 1, 1,
0.7607427, -0.5532723, 0.4250149, 1, 1, 1, 1, 1,
0.7657266, 2.348418, -1.685809, 1, 1, 1, 1, 1,
0.7681568, -1.082416, 4.972827, 1, 1, 1, 1, 1,
0.7750305, -0.5917711, 2.607846, 1, 1, 1, 1, 1,
0.775125, -0.4285685, 2.728345, 1, 1, 1, 1, 1,
0.7813162, -0.1855261, 2.363822, 1, 1, 1, 1, 1,
0.7986585, -1.456031, 3.653512, 1, 1, 1, 1, 1,
0.8052973, 0.1065081, 0.2845718, 1, 1, 1, 1, 1,
0.8084163, 0.2727748, 3.320703, 1, 1, 1, 1, 1,
0.8121029, 0.7714826, -0.6087061, 1, 1, 1, 1, 1,
0.8125234, 0.4268167, 1.987558, 1, 1, 1, 1, 1,
0.8143328, 1.233819, -0.5007377, 0, 0, 1, 1, 1,
0.8158789, -1.006112, 1.342388, 1, 0, 0, 1, 1,
0.8202951, -0.3140389, 1.234256, 1, 0, 0, 1, 1,
0.8256427, 2.656982, 1.537042, 1, 0, 0, 1, 1,
0.8337322, 0.4743146, 1.741523, 1, 0, 0, 1, 1,
0.8354594, -0.1473311, 3.189652, 1, 0, 0, 1, 1,
0.8471525, 1.157446, 1.184572, 0, 0, 0, 1, 1,
0.8514605, 2.16186, -0.35754, 0, 0, 0, 1, 1,
0.8703541, -0.7423478, 3.001609, 0, 0, 0, 1, 1,
0.872122, -0.3996567, 1.083963, 0, 0, 0, 1, 1,
0.8721923, -0.4048135, 0.737625, 0, 0, 0, 1, 1,
0.8757531, 0.09086438, 2.389981, 0, 0, 0, 1, 1,
0.878801, -1.530892, 4.784218, 0, 0, 0, 1, 1,
0.884489, -1.586203, 2.185547, 1, 1, 1, 1, 1,
0.8981436, 0.07757045, 2.138528, 1, 1, 1, 1, 1,
0.9120505, -1.760492, 2.200073, 1, 1, 1, 1, 1,
0.9203809, 1.260614, 0.1415534, 1, 1, 1, 1, 1,
0.9275091, 1.631371, 1.355862, 1, 1, 1, 1, 1,
0.9312966, 0.1043337, 1.208102, 1, 1, 1, 1, 1,
0.9415243, 1.895533, 1.185807, 1, 1, 1, 1, 1,
0.9465439, 0.0645154, 1.788299, 1, 1, 1, 1, 1,
0.9474596, -1.328001, 1.926425, 1, 1, 1, 1, 1,
0.9481958, 0.05911726, 0.8796598, 1, 1, 1, 1, 1,
0.951933, 0.2957492, 1.101396, 1, 1, 1, 1, 1,
0.9545017, 1.332278, -1.006541, 1, 1, 1, 1, 1,
0.9577167, 0.4080458, 1.150542, 1, 1, 1, 1, 1,
0.9599255, -1.193949, 3.343529, 1, 1, 1, 1, 1,
0.9683606, -0.1894391, 0.90701, 1, 1, 1, 1, 1,
0.9694018, 0.5301573, 1.016844, 0, 0, 1, 1, 1,
0.9709113, -0.2557919, 0.7813032, 1, 0, 0, 1, 1,
0.9738982, -0.1739791, 0.2244762, 1, 0, 0, 1, 1,
0.9760175, -0.766562, 1.37786, 1, 0, 0, 1, 1,
0.9803824, 1.566055, 1.269522, 1, 0, 0, 1, 1,
0.9892711, 0.3250852, 0.3261281, 1, 0, 0, 1, 1,
0.994235, 0.2686683, 0.3452599, 0, 0, 0, 1, 1,
0.9951943, 1.750989, 1.279449, 0, 0, 0, 1, 1,
0.9963487, -0.2696127, 1.777402, 0, 0, 0, 1, 1,
0.9973185, -0.5064592, 3.927777, 0, 0, 0, 1, 1,
1.013694, -1.167016, 2.332886, 0, 0, 0, 1, 1,
1.013801, 0.177022, 0.6619548, 0, 0, 0, 1, 1,
1.015224, -0.3523721, 1.135333, 0, 0, 0, 1, 1,
1.027889, -1.478821, 0.9994207, 1, 1, 1, 1, 1,
1.029298, 1.430077, 0.8148685, 1, 1, 1, 1, 1,
1.031287, 0.9940578, 1.343026, 1, 1, 1, 1, 1,
1.038283, -0.8635135, 3.503328, 1, 1, 1, 1, 1,
1.05426, -0.3703087, 2.511346, 1, 1, 1, 1, 1,
1.065069, 0.8538352, 2.772927, 1, 1, 1, 1, 1,
1.074505, 0.03410191, 1.370921, 1, 1, 1, 1, 1,
1.07786, 0.7835951, -0.08825623, 1, 1, 1, 1, 1,
1.089079, 0.5737358, 1.157236, 1, 1, 1, 1, 1,
1.089279, 1.343856, -2.209834, 1, 1, 1, 1, 1,
1.091799, -0.9629956, 2.545105, 1, 1, 1, 1, 1,
1.092312, 0.2935904, 0.3394021, 1, 1, 1, 1, 1,
1.093731, 0.9970194, 1.546482, 1, 1, 1, 1, 1,
1.109588, -0.7398061, 2.202313, 1, 1, 1, 1, 1,
1.114917, 1.246261, -1.677155, 1, 1, 1, 1, 1,
1.117065, 0.5810115, 3.127089, 0, 0, 1, 1, 1,
1.11826, 0.1641547, 3.023316, 1, 0, 0, 1, 1,
1.122169, 0.4914031, 1.446722, 1, 0, 0, 1, 1,
1.12732, 1.276351, -0.2300301, 1, 0, 0, 1, 1,
1.129923, -1.591096, 2.454864, 1, 0, 0, 1, 1,
1.133404, -0.8525923, 2.133854, 1, 0, 0, 1, 1,
1.136807, -0.7032708, 1.871946, 0, 0, 0, 1, 1,
1.140219, 0.4390917, 1.690116, 0, 0, 0, 1, 1,
1.152243, 1.072366, -0.5525408, 0, 0, 0, 1, 1,
1.157388, 0.841931, 0.5054128, 0, 0, 0, 1, 1,
1.16022, -0.5481431, 1.409378, 0, 0, 0, 1, 1,
1.164976, -0.4147339, 1.555723, 0, 0, 0, 1, 1,
1.169663, 0.6123316, 1.568972, 0, 0, 0, 1, 1,
1.169733, 0.002678647, 0.8066637, 1, 1, 1, 1, 1,
1.181756, 0.2906171, 1.018761, 1, 1, 1, 1, 1,
1.183973, -0.6406589, 3.473795, 1, 1, 1, 1, 1,
1.189114, 1.069578, 2.322981, 1, 1, 1, 1, 1,
1.201448, -1.499663, 1.009894, 1, 1, 1, 1, 1,
1.204853, 0.1764094, -0.03594313, 1, 1, 1, 1, 1,
1.206229, 0.317811, 1.47862, 1, 1, 1, 1, 1,
1.214035, 0.2648495, 1.982204, 1, 1, 1, 1, 1,
1.21918, -1.410498, 3.725705, 1, 1, 1, 1, 1,
1.221072, 0.467465, 1.982079, 1, 1, 1, 1, 1,
1.238764, 0.3148627, 0.9672258, 1, 1, 1, 1, 1,
1.24224, -0.1009869, 2.985153, 1, 1, 1, 1, 1,
1.246566, 0.08068096, 2.004102, 1, 1, 1, 1, 1,
1.254078, -0.1445027, 1.366755, 1, 1, 1, 1, 1,
1.255736, -0.9820507, 2.725594, 1, 1, 1, 1, 1,
1.26251, 0.7448919, 0.6296453, 0, 0, 1, 1, 1,
1.272464, 0.5310315, 0.5754536, 1, 0, 0, 1, 1,
1.272475, 0.04998998, 1.513725, 1, 0, 0, 1, 1,
1.280626, -1.844348, 3.860676, 1, 0, 0, 1, 1,
1.28362, 0.5031977, 0.4860159, 1, 0, 0, 1, 1,
1.288737, 0.7995127, 1.504895, 1, 0, 0, 1, 1,
1.289816, 0.4142408, 0.8156285, 0, 0, 0, 1, 1,
1.31116, -0.1491061, 1.97254, 0, 0, 0, 1, 1,
1.311301, -0.7264785, 0.6361583, 0, 0, 0, 1, 1,
1.311646, -0.8103279, 2.126673, 0, 0, 0, 1, 1,
1.314757, -0.5576749, 2.450114, 0, 0, 0, 1, 1,
1.31671, 1.306273, 0.9477798, 0, 0, 0, 1, 1,
1.328317, -0.4546613, 1.391701, 0, 0, 0, 1, 1,
1.328565, 0.9591354, 2.027448, 1, 1, 1, 1, 1,
1.328888, -0.1304658, 0.8695094, 1, 1, 1, 1, 1,
1.331873, 1.14508, 0.1312454, 1, 1, 1, 1, 1,
1.341402, -1.696804, 2.436454, 1, 1, 1, 1, 1,
1.353382, -0.4464605, 0.6876286, 1, 1, 1, 1, 1,
1.363027, -0.9132378, 3.241439, 1, 1, 1, 1, 1,
1.369269, -0.01002426, 2.144147, 1, 1, 1, 1, 1,
1.373822, 1.449246, -0.2544226, 1, 1, 1, 1, 1,
1.380802, -0.1476339, 1.92616, 1, 1, 1, 1, 1,
1.385716, -0.7654309, 1.935117, 1, 1, 1, 1, 1,
1.387745, 1.039591, 0.7510442, 1, 1, 1, 1, 1,
1.388238, -0.4318518, 1.820037, 1, 1, 1, 1, 1,
1.388837, 1.62494, -0.008045527, 1, 1, 1, 1, 1,
1.395959, -1.270315, 4.105111, 1, 1, 1, 1, 1,
1.399095, -1.465503, 2.408919, 1, 1, 1, 1, 1,
1.426113, 0.5261663, 1.067232, 0, 0, 1, 1, 1,
1.427317, 0.843821, 1.45392, 1, 0, 0, 1, 1,
1.429685, 0.1720673, 1.91941, 1, 0, 0, 1, 1,
1.430866, -0.01157974, 2.056498, 1, 0, 0, 1, 1,
1.45052, 0.09837277, 2.702228, 1, 0, 0, 1, 1,
1.453777, 0.2736411, 1.945001, 1, 0, 0, 1, 1,
1.465708, -0.9345142, 1.090281, 0, 0, 0, 1, 1,
1.468842, -0.9856675, 2.449152, 0, 0, 0, 1, 1,
1.478331, 0.321631, -0.06065493, 0, 0, 0, 1, 1,
1.483048, -0.06354657, -0.3799234, 0, 0, 0, 1, 1,
1.48654, 1.630522, -0.1338894, 0, 0, 0, 1, 1,
1.491891, 0.349771, 1.505938, 0, 0, 0, 1, 1,
1.492186, -1.121093, 2.321486, 0, 0, 0, 1, 1,
1.495199, 0.00220006, 1.826956, 1, 1, 1, 1, 1,
1.509119, 0.3983467, 0.9362307, 1, 1, 1, 1, 1,
1.534949, -2.624619, 2.950835, 1, 1, 1, 1, 1,
1.537834, -0.3077217, 1.139335, 1, 1, 1, 1, 1,
1.551136, 0.2760464, 2.889783, 1, 1, 1, 1, 1,
1.562564, 0.2379538, 2.10277, 1, 1, 1, 1, 1,
1.579763, -1.24564, 2.089545, 1, 1, 1, 1, 1,
1.600017, -1.005068, 1.93571, 1, 1, 1, 1, 1,
1.6055, -0.310797, 1.506991, 1, 1, 1, 1, 1,
1.606414, -0.4401797, 0.9849518, 1, 1, 1, 1, 1,
1.609482, -0.256341, 1.615659, 1, 1, 1, 1, 1,
1.629052, -0.8022771, 0.7208895, 1, 1, 1, 1, 1,
1.632929, 0.6944554, 0.2822514, 1, 1, 1, 1, 1,
1.645133, -0.2876429, 2.414666, 1, 1, 1, 1, 1,
1.650818, -0.5982437, 1.509238, 1, 1, 1, 1, 1,
1.657557, 0.8211383, 1.564299, 0, 0, 1, 1, 1,
1.667626, 0.7865101, 1.7249, 1, 0, 0, 1, 1,
1.668347, 0.787052, 0.9748293, 1, 0, 0, 1, 1,
1.678442, -0.4145899, 3.210714, 1, 0, 0, 1, 1,
1.681948, 1.170448, -0.7251799, 1, 0, 0, 1, 1,
1.7113, -0.006187688, 4.055657, 1, 0, 0, 1, 1,
1.726663, 1.104564, 1.652449, 0, 0, 0, 1, 1,
1.739573, 1.673441, -0.1675735, 0, 0, 0, 1, 1,
1.748434, 1.085425, 0.2444366, 0, 0, 0, 1, 1,
1.750012, 0.06530464, 2.262851, 0, 0, 0, 1, 1,
1.762391, -0.4030504, 3.137243, 0, 0, 0, 1, 1,
1.774528, -1.511594, 1.120681, 0, 0, 0, 1, 1,
1.78127, -0.5957575, 3.887894, 0, 0, 0, 1, 1,
1.783765, -1.870166, 2.4879, 1, 1, 1, 1, 1,
1.793854, 1.1427, 1.432514, 1, 1, 1, 1, 1,
1.802818, -0.0253724, 1.501558, 1, 1, 1, 1, 1,
1.814236, -1.328342, 0.8006158, 1, 1, 1, 1, 1,
1.847508, 0.056965, 3.539256, 1, 1, 1, 1, 1,
1.851003, -1.360909, 2.939895, 1, 1, 1, 1, 1,
1.861497, 0.1112789, 1.82214, 1, 1, 1, 1, 1,
1.862624, 1.426399, 0.9144353, 1, 1, 1, 1, 1,
1.885995, 0.8699176, 1.583855, 1, 1, 1, 1, 1,
1.896635, -0.2699159, 2.720178, 1, 1, 1, 1, 1,
1.909677, 0.4852299, 0.7639076, 1, 1, 1, 1, 1,
1.928426, 1.222554, 0.5076641, 1, 1, 1, 1, 1,
1.943654, 1.36859, 0.9061734, 1, 1, 1, 1, 1,
1.943932, -0.5021348, 2.127836, 1, 1, 1, 1, 1,
1.969165, 0.2059775, 1.396371, 1, 1, 1, 1, 1,
1.970593, 2.152236, 0.9445769, 0, 0, 1, 1, 1,
1.985372, 0.6091651, 0.8220313, 1, 0, 0, 1, 1,
1.995957, 0.4379901, 0.9072554, 1, 0, 0, 1, 1,
2.000612, 1.011136, 0.04136158, 1, 0, 0, 1, 1,
2.04461, -0.5900324, 2.867633, 1, 0, 0, 1, 1,
2.066134, 0.7386689, 1.824761, 1, 0, 0, 1, 1,
2.134236, 0.1743138, 1.279631, 0, 0, 0, 1, 1,
2.185573, 0.5304772, 0.7698992, 0, 0, 0, 1, 1,
2.273044, -0.7533754, -0.2199892, 0, 0, 0, 1, 1,
2.303477, -0.569836, 2.947073, 0, 0, 0, 1, 1,
2.355586, -1.43228, 1.467977, 0, 0, 0, 1, 1,
2.484287, -0.8140872, 2.916543, 0, 0, 0, 1, 1,
2.5045, -0.3091255, 1.820696, 0, 0, 0, 1, 1,
2.516433, 0.2655371, 2.566463, 1, 1, 1, 1, 1,
2.664791, 1.047646, 0.5989624, 1, 1, 1, 1, 1,
2.769544, 1.255881, 1.659625, 1, 1, 1, 1, 1,
2.840726, -1.273057, 2.898601, 1, 1, 1, 1, 1,
2.852772, -2.528394, 4.725917, 1, 1, 1, 1, 1,
3.61005, -0.9834114, 0.08011207, 1, 1, 1, 1, 1,
3.692647, 1.629501, 2.249695, 1, 1, 1, 1, 1
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
var radius = 10.26265;
var distance = 36.04711;
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
mvMatrix.translate( -0.009404659, 0.2583048, 0.2900364 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.04711);
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
