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
-2.908918, -0.4978661, -1.079047, 1, 0, 0, 1,
-2.749318, -0.07779598, -2.15513, 1, 0.007843138, 0, 1,
-2.662574, 1.144861, -0.5370486, 1, 0.01176471, 0, 1,
-2.600457, 2.042331, -1.352451, 1, 0.01960784, 0, 1,
-2.589108, -1.825646, -2.083543, 1, 0.02352941, 0, 1,
-2.587402, 0.1163179, -1.151909, 1, 0.03137255, 0, 1,
-2.514984, -0.4364785, -1.587806, 1, 0.03529412, 0, 1,
-2.43842, -0.9621701, -2.78382, 1, 0.04313726, 0, 1,
-2.381577, 1.271808, -1.768086, 1, 0.04705882, 0, 1,
-2.350531, -0.3607953, -0.9112051, 1, 0.05490196, 0, 1,
-2.335158, -0.4587618, -0.518606, 1, 0.05882353, 0, 1,
-2.297063, -0.4435551, -1.671396, 1, 0.06666667, 0, 1,
-2.272492, 1.015106, -2.099866, 1, 0.07058824, 0, 1,
-2.219989, 1.349913, 0.07581314, 1, 0.07843138, 0, 1,
-2.128434, -1.654911, -1.523052, 1, 0.08235294, 0, 1,
-2.078674, 0.01806553, -0.2386804, 1, 0.09019608, 0, 1,
-2.072423, -0.2759442, -1.761907, 1, 0.09411765, 0, 1,
-2.048161, 0.2210222, -0.3960676, 1, 0.1019608, 0, 1,
-2.039021, 0.4067201, 0.1261808, 1, 0.1098039, 0, 1,
-2.032781, -0.4482572, -1.090203, 1, 0.1137255, 0, 1,
-2.003867, 0.2238978, -2.36811, 1, 0.1215686, 0, 1,
-1.996407, -0.466628, -2.298202, 1, 0.1254902, 0, 1,
-1.982263, -0.2254315, -0.9779212, 1, 0.1333333, 0, 1,
-1.954531, -1.209031, -3.799553, 1, 0.1372549, 0, 1,
-1.93234, 0.04218702, -1.514446, 1, 0.145098, 0, 1,
-1.890553, 0.922033, -0.4093258, 1, 0.1490196, 0, 1,
-1.884969, -2.371635, -3.273505, 1, 0.1568628, 0, 1,
-1.870379, 1.726658, -1.388649, 1, 0.1607843, 0, 1,
-1.863855, 2.279555, -0.3304812, 1, 0.1686275, 0, 1,
-1.849594, 0.1174265, -2.0693, 1, 0.172549, 0, 1,
-1.843212, 1.079383, -1.746777, 1, 0.1803922, 0, 1,
-1.788306, 0.3514366, -2.381822, 1, 0.1843137, 0, 1,
-1.786996, 1.506368, 0.1604297, 1, 0.1921569, 0, 1,
-1.785404, 0.09192307, -3.273315, 1, 0.1960784, 0, 1,
-1.785254, -1.832618, -3.837822, 1, 0.2039216, 0, 1,
-1.765951, -0.4316919, -2.214019, 1, 0.2117647, 0, 1,
-1.74302, -1.349206, -2.832113, 1, 0.2156863, 0, 1,
-1.742012, -0.6234593, -0.7963986, 1, 0.2235294, 0, 1,
-1.737339, -0.7688487, -2.271337, 1, 0.227451, 0, 1,
-1.711533, -1.242635, -1.735745, 1, 0.2352941, 0, 1,
-1.707446, 1.52344, -2.627798, 1, 0.2392157, 0, 1,
-1.706675, 0.4837639, -0.3812836, 1, 0.2470588, 0, 1,
-1.704617, 1.463409, 1.960051, 1, 0.2509804, 0, 1,
-1.690722, 0.45748, -0.05951781, 1, 0.2588235, 0, 1,
-1.674278, -2.318565, -2.098372, 1, 0.2627451, 0, 1,
-1.670333, -1.188989, -2.421681, 1, 0.2705882, 0, 1,
-1.668161, -0.03456938, -3.336006, 1, 0.2745098, 0, 1,
-1.665001, -1.445892, -2.095795, 1, 0.282353, 0, 1,
-1.637645, -0.1204141, -0.74527, 1, 0.2862745, 0, 1,
-1.630251, -0.9822661, -3.773124, 1, 0.2941177, 0, 1,
-1.619513, 1.190833, -0.8952523, 1, 0.3019608, 0, 1,
-1.619293, 0.8477542, -1.384743, 1, 0.3058824, 0, 1,
-1.610717, 0.06975454, -1.666946, 1, 0.3137255, 0, 1,
-1.593836, -1.120786, -2.808613, 1, 0.3176471, 0, 1,
-1.591973, -0.7234138, -2.109346, 1, 0.3254902, 0, 1,
-1.582132, -1.065614, -1.868065, 1, 0.3294118, 0, 1,
-1.572032, -0.2928009, -1.858614, 1, 0.3372549, 0, 1,
-1.563915, -1.43013, -2.680734, 1, 0.3411765, 0, 1,
-1.562644, 0.3052264, 0.2049108, 1, 0.3490196, 0, 1,
-1.560864, -0.08636482, -2.981211, 1, 0.3529412, 0, 1,
-1.557407, -0.4797802, -1.089401, 1, 0.3607843, 0, 1,
-1.556686, -0.1041226, -3.137257, 1, 0.3647059, 0, 1,
-1.53738, 0.1214359, -0.2490875, 1, 0.372549, 0, 1,
-1.528408, -1.815879, -2.542074, 1, 0.3764706, 0, 1,
-1.515679, -0.2453602, -1.214107, 1, 0.3843137, 0, 1,
-1.514027, 0.7903125, -2.31516, 1, 0.3882353, 0, 1,
-1.511634, -0.9944825, -2.658248, 1, 0.3960784, 0, 1,
-1.496479, 0.5019416, -1.424988, 1, 0.4039216, 0, 1,
-1.49381, 0.6588025, -1.508618, 1, 0.4078431, 0, 1,
-1.488075, 0.3231055, -1.221774, 1, 0.4156863, 0, 1,
-1.479939, 0.599232, -3.341724, 1, 0.4196078, 0, 1,
-1.476274, -0.4073234, -2.576999, 1, 0.427451, 0, 1,
-1.475464, 0.3093282, -1.270254, 1, 0.4313726, 0, 1,
-1.473487, -0.8186148, -3.002523, 1, 0.4392157, 0, 1,
-1.472366, 0.7051414, -1.460113, 1, 0.4431373, 0, 1,
-1.467703, 0.3052573, -2.543108, 1, 0.4509804, 0, 1,
-1.459418, -0.1115379, -2.032593, 1, 0.454902, 0, 1,
-1.457921, 1.454874, -2.258878, 1, 0.4627451, 0, 1,
-1.448601, 0.1433416, -2.026654, 1, 0.4666667, 0, 1,
-1.447055, 0.6157537, -1.642811, 1, 0.4745098, 0, 1,
-1.443532, 0.09052021, -3.668338, 1, 0.4784314, 0, 1,
-1.434526, -0.4438041, -0.9940557, 1, 0.4862745, 0, 1,
-1.412192, 0.9490851, -0.5053174, 1, 0.4901961, 0, 1,
-1.405563, -2.361061, -4.755552, 1, 0.4980392, 0, 1,
-1.39698, 0.6570588, -0.6667601, 1, 0.5058824, 0, 1,
-1.395622, 0.1505684, -1.840467, 1, 0.509804, 0, 1,
-1.393046, 0.9771039, -0.2461202, 1, 0.5176471, 0, 1,
-1.392097, 1.086733, -1.467968, 1, 0.5215687, 0, 1,
-1.39164, 0.119944, -0.8427227, 1, 0.5294118, 0, 1,
-1.391306, -0.7947742, 0.02264111, 1, 0.5333334, 0, 1,
-1.377393, 0.8825571, -0.1191213, 1, 0.5411765, 0, 1,
-1.374491, 1.033101, 0.9177418, 1, 0.5450981, 0, 1,
-1.373813, 1.978457, -2.192591, 1, 0.5529412, 0, 1,
-1.368945, -0.7300407, -0.1756842, 1, 0.5568628, 0, 1,
-1.357331, 0.1194906, -1.160154, 1, 0.5647059, 0, 1,
-1.350852, -1.80994, -3.328077, 1, 0.5686275, 0, 1,
-1.34267, 0.2523021, -1.556406, 1, 0.5764706, 0, 1,
-1.342565, -1.010517, -1.834222, 1, 0.5803922, 0, 1,
-1.340529, -0.5835515, -1.124912, 1, 0.5882353, 0, 1,
-1.338307, 1.780428, -1.364639, 1, 0.5921569, 0, 1,
-1.333146, 0.6806276, -2.501152, 1, 0.6, 0, 1,
-1.329072, -0.8479104, -1.203899, 1, 0.6078432, 0, 1,
-1.326369, 0.248759, -2.408503, 1, 0.6117647, 0, 1,
-1.325032, 1.714248, 0.2427061, 1, 0.6196079, 0, 1,
-1.32251, 1.452762, -1.962701, 1, 0.6235294, 0, 1,
-1.321654, -1.658628, -1.309757, 1, 0.6313726, 0, 1,
-1.316315, 0.1167832, -2.568475, 1, 0.6352941, 0, 1,
-1.310335, -0.9595841, -0.845805, 1, 0.6431373, 0, 1,
-1.290366, 0.6191545, -2.104426, 1, 0.6470588, 0, 1,
-1.278075, -1.946383, -2.683775, 1, 0.654902, 0, 1,
-1.270714, -0.508999, -1.432446, 1, 0.6588235, 0, 1,
-1.268883, -1.188484, -2.592126, 1, 0.6666667, 0, 1,
-1.268664, -0.4954865, -2.345382, 1, 0.6705883, 0, 1,
-1.264907, -0.6347075, -0.9947605, 1, 0.6784314, 0, 1,
-1.259555, -0.4447686, -2.62493, 1, 0.682353, 0, 1,
-1.25926, -2.06448, -2.28986, 1, 0.6901961, 0, 1,
-1.255209, 0.9468026, 0.7582544, 1, 0.6941177, 0, 1,
-1.243742, -0.3056152, -1.367863, 1, 0.7019608, 0, 1,
-1.240787, -1.159113, -2.627177, 1, 0.7098039, 0, 1,
-1.240616, -0.3716359, -0.9329379, 1, 0.7137255, 0, 1,
-1.235098, -0.5488874, -2.993796, 1, 0.7215686, 0, 1,
-1.225687, 1.366591, -1.014954, 1, 0.7254902, 0, 1,
-1.222228, -0.5618125, -2.435582, 1, 0.7333333, 0, 1,
-1.205102, 0.6388904, -1.654979, 1, 0.7372549, 0, 1,
-1.185403, -0.8748314, -2.534482, 1, 0.7450981, 0, 1,
-1.183327, -0.7581459, -1.803185, 1, 0.7490196, 0, 1,
-1.182006, 0.09227703, -1.788702, 1, 0.7568628, 0, 1,
-1.180244, -0.9556296, -4.038908, 1, 0.7607843, 0, 1,
-1.176742, 0.3604937, 0.1254353, 1, 0.7686275, 0, 1,
-1.172627, 1.2444, 0.3782765, 1, 0.772549, 0, 1,
-1.164715, -1.843027, -3.36544, 1, 0.7803922, 0, 1,
-1.164434, 0.003624813, -1.72895, 1, 0.7843137, 0, 1,
-1.160607, -0.2560397, -1.958306, 1, 0.7921569, 0, 1,
-1.155965, -0.9967752, -3.946497, 1, 0.7960784, 0, 1,
-1.15238, -0.9034636, -1.551521, 1, 0.8039216, 0, 1,
-1.150817, -0.00240353, -1.409841, 1, 0.8117647, 0, 1,
-1.150507, -0.3764984, -1.512365, 1, 0.8156863, 0, 1,
-1.149192, -1.827938, -2.10173, 1, 0.8235294, 0, 1,
-1.144791, 0.6039517, 0.02659005, 1, 0.827451, 0, 1,
-1.122227, -1.262789, -2.455986, 1, 0.8352941, 0, 1,
-1.111359, -0.8423578, -2.357322, 1, 0.8392157, 0, 1,
-1.109938, 0.04208259, -2.993298, 1, 0.8470588, 0, 1,
-1.106555, -0.7378898, -1.998561, 1, 0.8509804, 0, 1,
-1.102177, 0.7972642, -0.9821522, 1, 0.8588235, 0, 1,
-1.096575, 0.3548648, 0.09685081, 1, 0.8627451, 0, 1,
-1.092401, 0.8498871, -0.2971281, 1, 0.8705882, 0, 1,
-1.091978, -0.2709162, -0.7942172, 1, 0.8745098, 0, 1,
-1.085906, -0.5254444, -2.333717, 1, 0.8823529, 0, 1,
-1.085448, -0.3806869, -1.928446, 1, 0.8862745, 0, 1,
-1.077885, 1.387186, 0.2425602, 1, 0.8941177, 0, 1,
-1.061046, 1.279856, -0.9736089, 1, 0.8980392, 0, 1,
-1.059296, -1.034629, -2.731124, 1, 0.9058824, 0, 1,
-1.053388, 0.4086164, -3.241231, 1, 0.9137255, 0, 1,
-1.045118, -0.3591703, -1.538537, 1, 0.9176471, 0, 1,
-1.042007, 0.6070512, -0.9481351, 1, 0.9254902, 0, 1,
-1.036669, 0.2948958, -1.300748, 1, 0.9294118, 0, 1,
-1.033837, -1.753554, -1.759507, 1, 0.9372549, 0, 1,
-1.031908, -0.51948, -1.164994, 1, 0.9411765, 0, 1,
-1.031177, 0.8620428, -1.018399, 1, 0.9490196, 0, 1,
-1.02969, -0.6865208, -3.413755, 1, 0.9529412, 0, 1,
-1.028894, 1.15134, -0.9842675, 1, 0.9607843, 0, 1,
-1.021112, -0.04730082, -1.598688, 1, 0.9647059, 0, 1,
-1.014554, 1.966249, -0.6664771, 1, 0.972549, 0, 1,
-1.010929, -0.5331033, -2.590318, 1, 0.9764706, 0, 1,
-1.009222, -2.839205, -0.5926268, 1, 0.9843137, 0, 1,
-1.001432, 0.9570562, -2.251936, 1, 0.9882353, 0, 1,
-0.9955665, -1.209225, -3.758671, 1, 0.9960784, 0, 1,
-0.9938495, 1.313015, -0.401354, 0.9960784, 1, 0, 1,
-0.9935553, 1.370749, 0.1564918, 0.9921569, 1, 0, 1,
-0.9895893, -0.8711963, -3.278562, 0.9843137, 1, 0, 1,
-0.9829004, -1.482007, -2.285051, 0.9803922, 1, 0, 1,
-0.9754267, 0.05832724, -2.864951, 0.972549, 1, 0, 1,
-0.972029, -1.078403, -1.44117, 0.9686275, 1, 0, 1,
-0.9645759, 0.2572546, -1.976872, 0.9607843, 1, 0, 1,
-0.9628068, -0.3252336, -1.137919, 0.9568627, 1, 0, 1,
-0.9612561, 0.76395, -0.1775729, 0.9490196, 1, 0, 1,
-0.9589708, 1.583171, -0.5291178, 0.945098, 1, 0, 1,
-0.9588271, 1.080869, -1.705786, 0.9372549, 1, 0, 1,
-0.9444489, -0.8525848, -3.602562, 0.9333333, 1, 0, 1,
-0.9283618, 0.5035954, -1.931674, 0.9254902, 1, 0, 1,
-0.9206566, -0.5897464, -0.02679712, 0.9215686, 1, 0, 1,
-0.9198418, 0.8601644, -1.380891, 0.9137255, 1, 0, 1,
-0.9182527, -1.31329, -2.262377, 0.9098039, 1, 0, 1,
-0.9176565, 1.389041, -1.653782, 0.9019608, 1, 0, 1,
-0.9155431, 0.1717991, -1.994963, 0.8941177, 1, 0, 1,
-0.9128671, 0.5325425, -2.101096, 0.8901961, 1, 0, 1,
-0.9122886, 1.216938, 0.4528819, 0.8823529, 1, 0, 1,
-0.9069591, 0.01207106, -1.868886, 0.8784314, 1, 0, 1,
-0.9067555, 1.450032, -2.745618, 0.8705882, 1, 0, 1,
-0.906475, -0.4325566, -3.42322, 0.8666667, 1, 0, 1,
-0.9058165, 0.4400206, -1.314776, 0.8588235, 1, 0, 1,
-0.9006948, -2.343266, -2.068314, 0.854902, 1, 0, 1,
-0.8979711, 2.181658, -1.487629, 0.8470588, 1, 0, 1,
-0.8977062, -1.004516, -3.140913, 0.8431373, 1, 0, 1,
-0.8916872, 1.508262, -0.4465163, 0.8352941, 1, 0, 1,
-0.8896236, -0.3792537, -1.998206, 0.8313726, 1, 0, 1,
-0.8887813, -1.232032, -4.390422, 0.8235294, 1, 0, 1,
-0.8877556, -1.463511, -3.420052, 0.8196079, 1, 0, 1,
-0.8808752, 2.026441, 0.183551, 0.8117647, 1, 0, 1,
-0.8742016, -1.57742, -1.577573, 0.8078431, 1, 0, 1,
-0.8738841, -0.6002572, -1.029594, 0.8, 1, 0, 1,
-0.8734103, 1.6069, -2.082342, 0.7921569, 1, 0, 1,
-0.8699093, 0.2183089, -1.839394, 0.7882353, 1, 0, 1,
-0.8648916, -0.0398647, -2.907127, 0.7803922, 1, 0, 1,
-0.8629094, 2.802271, -0.3475191, 0.7764706, 1, 0, 1,
-0.8573552, 0.1726357, -2.234915, 0.7686275, 1, 0, 1,
-0.8542256, -0.2836367, -1.917297, 0.7647059, 1, 0, 1,
-0.8537477, -0.7114297, -4.424038, 0.7568628, 1, 0, 1,
-0.8505172, 0.4587694, -0.5200933, 0.7529412, 1, 0, 1,
-0.8484033, 1.044401, -0.3126849, 0.7450981, 1, 0, 1,
-0.8450872, 1.519251, 0.3022819, 0.7411765, 1, 0, 1,
-0.8447895, -0.2350918, -1.080836, 0.7333333, 1, 0, 1,
-0.843759, -0.5769176, -2.39222, 0.7294118, 1, 0, 1,
-0.8420905, -1.068171, -3.057321, 0.7215686, 1, 0, 1,
-0.8383743, -0.2349568, -1.947971, 0.7176471, 1, 0, 1,
-0.8328825, -1.363608, -1.310893, 0.7098039, 1, 0, 1,
-0.816277, -0.017359, -4.171373, 0.7058824, 1, 0, 1,
-0.8071113, 0.1892388, -1.195438, 0.6980392, 1, 0, 1,
-0.7921175, -1.163297, -2.916087, 0.6901961, 1, 0, 1,
-0.788209, -1.259511, -2.065712, 0.6862745, 1, 0, 1,
-0.7851234, 1.130293, -0.1962928, 0.6784314, 1, 0, 1,
-0.7841619, -1.9518, -3.779857, 0.6745098, 1, 0, 1,
-0.781311, 0.4751016, -1.328851, 0.6666667, 1, 0, 1,
-0.7789598, -0.339759, -0.4496095, 0.6627451, 1, 0, 1,
-0.7768221, 0.5952395, 0.1238998, 0.654902, 1, 0, 1,
-0.7753592, 0.9869998, 0.09107033, 0.6509804, 1, 0, 1,
-0.7734491, -0.1677502, -0.3631703, 0.6431373, 1, 0, 1,
-0.7732933, -0.1148207, -0.8287926, 0.6392157, 1, 0, 1,
-0.7677036, -0.4997558, -2.90055, 0.6313726, 1, 0, 1,
-0.7654352, -1.286039, -2.253181, 0.627451, 1, 0, 1,
-0.7630033, -0.4928972, -1.973099, 0.6196079, 1, 0, 1,
-0.7611184, -0.08404125, -2.50926, 0.6156863, 1, 0, 1,
-0.7598277, 0.3288798, -3.314569, 0.6078432, 1, 0, 1,
-0.759826, -0.369791, -2.802592, 0.6039216, 1, 0, 1,
-0.7587156, -0.04875484, -1.02955, 0.5960785, 1, 0, 1,
-0.7577477, -1.033188, -2.544323, 0.5882353, 1, 0, 1,
-0.7532352, 0.5343944, -1.066106, 0.5843138, 1, 0, 1,
-0.7503853, 1.871489, -0.3186114, 0.5764706, 1, 0, 1,
-0.7457959, -0.08833952, -2.165814, 0.572549, 1, 0, 1,
-0.7394453, 1.831994, -1.083986, 0.5647059, 1, 0, 1,
-0.7323207, 1.415964, -1.886364, 0.5607843, 1, 0, 1,
-0.7317051, -0.1498154, -1.383233, 0.5529412, 1, 0, 1,
-0.7276506, -1.000759, -1.710341, 0.5490196, 1, 0, 1,
-0.7208272, -0.4210753, -3.311093, 0.5411765, 1, 0, 1,
-0.719099, -0.5851839, -3.226358, 0.5372549, 1, 0, 1,
-0.7161827, -0.3296942, -0.9975978, 0.5294118, 1, 0, 1,
-0.715878, -1.060837, -2.284442, 0.5254902, 1, 0, 1,
-0.7125311, -0.1450667, -2.180119, 0.5176471, 1, 0, 1,
-0.7082428, 0.1938774, -0.5856763, 0.5137255, 1, 0, 1,
-0.7052825, 0.7309129, -0.3637392, 0.5058824, 1, 0, 1,
-0.701946, 0.06087562, -1.988066, 0.5019608, 1, 0, 1,
-0.7009892, -0.00979315, -1.400275, 0.4941176, 1, 0, 1,
-0.6986077, -0.0396127, -1.90879, 0.4862745, 1, 0, 1,
-0.6982664, -0.8809152, -2.160143, 0.4823529, 1, 0, 1,
-0.6962167, 0.2487306, -0.5719832, 0.4745098, 1, 0, 1,
-0.6934643, 1.004979, -1.273932, 0.4705882, 1, 0, 1,
-0.6863389, -1.293097, -0.9455116, 0.4627451, 1, 0, 1,
-0.683468, 0.6738107, -2.926033, 0.4588235, 1, 0, 1,
-0.6805428, 1.008633, -0.9698979, 0.4509804, 1, 0, 1,
-0.6797131, 1.97005, -0.8525749, 0.4470588, 1, 0, 1,
-0.6788459, -0.7649025, -2.560355, 0.4392157, 1, 0, 1,
-0.6761954, 0.4962512, -0.09880552, 0.4352941, 1, 0, 1,
-0.6761379, 0.2180566, -1.801295, 0.427451, 1, 0, 1,
-0.6717793, 0.1153994, -0.9400088, 0.4235294, 1, 0, 1,
-0.666762, -0.5355512, 0.2747551, 0.4156863, 1, 0, 1,
-0.666256, 1.136039, -0.3395855, 0.4117647, 1, 0, 1,
-0.6571061, 0.1702347, -1.16187, 0.4039216, 1, 0, 1,
-0.6505072, 0.1500594, -1.001596, 0.3960784, 1, 0, 1,
-0.6492645, -1.496265, -2.899186, 0.3921569, 1, 0, 1,
-0.648859, 0.657771, 0.94379, 0.3843137, 1, 0, 1,
-0.6473663, 0.3554911, -2.618858, 0.3803922, 1, 0, 1,
-0.6438522, 0.4386768, -0.7973765, 0.372549, 1, 0, 1,
-0.6435984, 0.3618801, -0.5514972, 0.3686275, 1, 0, 1,
-0.6419926, 1.128751, -0.574163, 0.3607843, 1, 0, 1,
-0.6385008, 0.7727117, -1.283437, 0.3568628, 1, 0, 1,
-0.6381038, -1.736222, -3.545441, 0.3490196, 1, 0, 1,
-0.6319444, 1.411351, -1.048502, 0.345098, 1, 0, 1,
-0.6318461, 1.463798, 2.094469, 0.3372549, 1, 0, 1,
-0.6233508, 0.2174773, -1.063568, 0.3333333, 1, 0, 1,
-0.6224523, -0.5386341, -2.890482, 0.3254902, 1, 0, 1,
-0.6221878, 0.609479, -1.417252, 0.3215686, 1, 0, 1,
-0.6215942, 0.6248423, -1.293436, 0.3137255, 1, 0, 1,
-0.6122081, 0.02425846, -1.634844, 0.3098039, 1, 0, 1,
-0.6098198, -1.086961, -3.553251, 0.3019608, 1, 0, 1,
-0.609798, 1.245644, 1.218048, 0.2941177, 1, 0, 1,
-0.6079201, -2.114475, -0.4477385, 0.2901961, 1, 0, 1,
-0.6076821, 0.2569076, -1.421532, 0.282353, 1, 0, 1,
-0.6017109, -1.391137, -2.378263, 0.2784314, 1, 0, 1,
-0.5979009, 0.445497, -0.5636454, 0.2705882, 1, 0, 1,
-0.5950269, 0.08454698, -1.503662, 0.2666667, 1, 0, 1,
-0.5930616, -2.534248, -2.027949, 0.2588235, 1, 0, 1,
-0.5927507, 0.2590282, 0.1908045, 0.254902, 1, 0, 1,
-0.5902508, 0.01235055, -1.426242, 0.2470588, 1, 0, 1,
-0.5900628, 0.7545653, -0.943207, 0.2431373, 1, 0, 1,
-0.5893565, 1.267092, -0.3770283, 0.2352941, 1, 0, 1,
-0.589258, 0.03948434, -1.23723, 0.2313726, 1, 0, 1,
-0.5861903, 0.9968876, -1.392169, 0.2235294, 1, 0, 1,
-0.5858847, 1.151317, -1.922366, 0.2196078, 1, 0, 1,
-0.5797207, -1.38642, -2.656989, 0.2117647, 1, 0, 1,
-0.5786689, -1.865378, -1.976675, 0.2078431, 1, 0, 1,
-0.5723464, 1.678513, 2.216986, 0.2, 1, 0, 1,
-0.5703724, 0.4562545, -2.620844, 0.1921569, 1, 0, 1,
-0.5664915, -0.484929, -4.248072, 0.1882353, 1, 0, 1,
-0.5652067, 0.192431, -0.77806, 0.1803922, 1, 0, 1,
-0.5620509, -1.376894, -3.449567, 0.1764706, 1, 0, 1,
-0.5608506, 1.174327, -1.129665, 0.1686275, 1, 0, 1,
-0.5571664, -1.659622, -3.29304, 0.1647059, 1, 0, 1,
-0.5538413, 0.5164243, -1.285698, 0.1568628, 1, 0, 1,
-0.5517641, 0.8847538, -0.6501866, 0.1529412, 1, 0, 1,
-0.5509207, -1.368073, -2.956471, 0.145098, 1, 0, 1,
-0.5449088, 0.4631191, 0.1111789, 0.1411765, 1, 0, 1,
-0.5446215, -0.9666112, -1.031583, 0.1333333, 1, 0, 1,
-0.5370386, -0.40005, -1.129465, 0.1294118, 1, 0, 1,
-0.5370347, 1.917032, -0.4714968, 0.1215686, 1, 0, 1,
-0.5364972, 0.1225683, -1.209458, 0.1176471, 1, 0, 1,
-0.5351425, 0.6293151, -0.01149622, 0.1098039, 1, 0, 1,
-0.5332639, 0.5855534, 1.596038, 0.1058824, 1, 0, 1,
-0.5272264, -1.435704, -2.257196, 0.09803922, 1, 0, 1,
-0.5253419, -2.266143, -4.694187, 0.09019608, 1, 0, 1,
-0.5175598, -0.4268086, -4.014161, 0.08627451, 1, 0, 1,
-0.5163611, 0.3341679, -1.553702, 0.07843138, 1, 0, 1,
-0.5134163, -0.2104755, -0.3004873, 0.07450981, 1, 0, 1,
-0.5112221, 1.147236, -2.038695, 0.06666667, 1, 0, 1,
-0.4952691, -1.040332, -3.099937, 0.0627451, 1, 0, 1,
-0.490125, -0.1715105, -2.465025, 0.05490196, 1, 0, 1,
-0.4860242, -1.639652, -3.372548, 0.05098039, 1, 0, 1,
-0.4846917, 1.613804, -0.4869357, 0.04313726, 1, 0, 1,
-0.4786165, 0.4966037, -2.294293, 0.03921569, 1, 0, 1,
-0.477748, -0.2199182, -1.875341, 0.03137255, 1, 0, 1,
-0.4775548, 0.2913865, 0.3221887, 0.02745098, 1, 0, 1,
-0.4756091, -0.8323061, -2.705135, 0.01960784, 1, 0, 1,
-0.4738039, 1.535821, 0.1974451, 0.01568628, 1, 0, 1,
-0.4730139, 0.4135281, -1.99567, 0.007843138, 1, 0, 1,
-0.4698231, 1.840574, -0.6137778, 0.003921569, 1, 0, 1,
-0.4695319, 0.9400747, -1.909371, 0, 1, 0.003921569, 1,
-0.4684926, 0.3749034, -0.7566934, 0, 1, 0.01176471, 1,
-0.4644778, 0.4616143, -2.17293, 0, 1, 0.01568628, 1,
-0.463966, -0.197411, -1.797341, 0, 1, 0.02352941, 1,
-0.4619443, 1.237727, -1.589319, 0, 1, 0.02745098, 1,
-0.4613252, 0.3636227, -2.746597, 0, 1, 0.03529412, 1,
-0.457375, 0.1484105, 0.1204341, 0, 1, 0.03921569, 1,
-0.4559294, 0.3174721, -1.869618, 0, 1, 0.04705882, 1,
-0.453043, -1.391507, -2.171264, 0, 1, 0.05098039, 1,
-0.4497654, 0.7403151, 0.622434, 0, 1, 0.05882353, 1,
-0.4469792, 1.169314, -0.07746057, 0, 1, 0.0627451, 1,
-0.4464885, -0.1826469, -1.70462, 0, 1, 0.07058824, 1,
-0.4447511, 0.5239805, -1.187191, 0, 1, 0.07450981, 1,
-0.4447151, -0.8522791, -2.795878, 0, 1, 0.08235294, 1,
-0.4435287, -0.1002218, -1.878146, 0, 1, 0.08627451, 1,
-0.4426202, -0.9720887, -3.472034, 0, 1, 0.09411765, 1,
-0.4406419, -0.8286473, -1.679281, 0, 1, 0.1019608, 1,
-0.4388519, 0.5651672, -0.4429699, 0, 1, 0.1058824, 1,
-0.4370745, -0.4803868, -2.359797, 0, 1, 0.1137255, 1,
-0.4352115, 0.5265828, -0.01794129, 0, 1, 0.1176471, 1,
-0.4332336, -0.979466, -2.155664, 0, 1, 0.1254902, 1,
-0.4298939, 1.247236, -1.504697, 0, 1, 0.1294118, 1,
-0.4254858, 0.2813673, -1.156668, 0, 1, 0.1372549, 1,
-0.4224796, 1.100898, 0.3739673, 0, 1, 0.1411765, 1,
-0.419148, 1.525102, -0.2822297, 0, 1, 0.1490196, 1,
-0.4136802, -0.2126141, -1.087647, 0, 1, 0.1529412, 1,
-0.4136754, 0.3232159, 0.03531604, 0, 1, 0.1607843, 1,
-0.4040786, 0.819211, -3.152112, 0, 1, 0.1647059, 1,
-0.4034259, -0.8845516, -3.739074, 0, 1, 0.172549, 1,
-0.4022422, 0.6485476, -0.9270889, 0, 1, 0.1764706, 1,
-0.3995202, -0.9188875, -2.992631, 0, 1, 0.1843137, 1,
-0.3980944, -0.6857089, -3.514248, 0, 1, 0.1882353, 1,
-0.3962717, 1.982481, 0.4603098, 0, 1, 0.1960784, 1,
-0.3945349, 0.2470578, -2.516561, 0, 1, 0.2039216, 1,
-0.3899527, 0.922442, 0.1653767, 0, 1, 0.2078431, 1,
-0.3891364, -0.3312401, -1.18365, 0, 1, 0.2156863, 1,
-0.3883725, 0.3084223, -0.7072421, 0, 1, 0.2196078, 1,
-0.387747, 1.467115, 0.5651639, 0, 1, 0.227451, 1,
-0.3860595, -0.2511725, -1.636491, 0, 1, 0.2313726, 1,
-0.3836946, -0.6116217, -1.873952, 0, 1, 0.2392157, 1,
-0.3830316, -0.1640016, -1.378231, 0, 1, 0.2431373, 1,
-0.3790488, 2.052705, -2.891501, 0, 1, 0.2509804, 1,
-0.3764233, 0.2556403, -2.5577, 0, 1, 0.254902, 1,
-0.376069, -1.70899, -2.64416, 0, 1, 0.2627451, 1,
-0.3659204, -1.331947, -1.053062, 0, 1, 0.2666667, 1,
-0.362466, -0.4295974, -2.789432, 0, 1, 0.2745098, 1,
-0.3585342, 1.345163, -1.682398, 0, 1, 0.2784314, 1,
-0.3574551, -0.7501755, -0.4609102, 0, 1, 0.2862745, 1,
-0.3569197, 0.3188349, -1.510171, 0, 1, 0.2901961, 1,
-0.3439899, -1.255422, -1.941218, 0, 1, 0.2980392, 1,
-0.341046, -0.9568753, -2.181357, 0, 1, 0.3058824, 1,
-0.3409383, 0.5303481, 0.07262779, 0, 1, 0.3098039, 1,
-0.3408481, 0.7780874, -2.294659, 0, 1, 0.3176471, 1,
-0.3392181, 1.627185, 1.220874, 0, 1, 0.3215686, 1,
-0.3389681, 0.5494466, -0.8945688, 0, 1, 0.3294118, 1,
-0.3359666, 0.4743074, -0.04158899, 0, 1, 0.3333333, 1,
-0.3350634, 0.8350636, 0.4445715, 0, 1, 0.3411765, 1,
-0.3311502, -0.193565, -1.53046, 0, 1, 0.345098, 1,
-0.3304796, -0.6304847, -2.169295, 0, 1, 0.3529412, 1,
-0.3278108, -1.066677, -3.967157, 0, 1, 0.3568628, 1,
-0.3263304, -2.004589, -1.994223, 0, 1, 0.3647059, 1,
-0.3201085, -0.740738, -2.39738, 0, 1, 0.3686275, 1,
-0.3154711, 1.839138, -0.7153375, 0, 1, 0.3764706, 1,
-0.3110546, 0.03960263, -2.30687, 0, 1, 0.3803922, 1,
-0.3024392, -1.727761, -4.229712, 0, 1, 0.3882353, 1,
-0.2925229, 0.8370638, 1.412631, 0, 1, 0.3921569, 1,
-0.2906623, 0.8926926, 1.088035, 0, 1, 0.4, 1,
-0.2882333, -0.6860775, -2.260771, 0, 1, 0.4078431, 1,
-0.2825228, 0.3099816, -1.075322, 0, 1, 0.4117647, 1,
-0.2774864, -0.1577988, -2.7165, 0, 1, 0.4196078, 1,
-0.2694809, -0.4808232, -2.535121, 0, 1, 0.4235294, 1,
-0.2655903, -0.4830788, -3.415742, 0, 1, 0.4313726, 1,
-0.2647179, 1.556292, -0.9170425, 0, 1, 0.4352941, 1,
-0.2621196, -1.195604, -2.299556, 0, 1, 0.4431373, 1,
-0.2593336, -1.529135, -3.654102, 0, 1, 0.4470588, 1,
-0.2557529, 0.7051441, -2.493692, 0, 1, 0.454902, 1,
-0.253544, -1.481247, -0.5815505, 0, 1, 0.4588235, 1,
-0.2518644, 0.03370766, -2.587854, 0, 1, 0.4666667, 1,
-0.2504053, -0.2771048, -2.962985, 0, 1, 0.4705882, 1,
-0.2488373, -0.04852054, -0.3425978, 0, 1, 0.4784314, 1,
-0.2488051, 0.5576185, 0.6438728, 0, 1, 0.4823529, 1,
-0.2468341, 0.7927601, 0.2489037, 0, 1, 0.4901961, 1,
-0.2414567, 1.241521, -0.8466803, 0, 1, 0.4941176, 1,
-0.2407308, 0.5513901, -0.1217529, 0, 1, 0.5019608, 1,
-0.2404203, -0.9765453, -4.075079, 0, 1, 0.509804, 1,
-0.2346528, -0.3652858, -2.717223, 0, 1, 0.5137255, 1,
-0.2331041, 0.7793559, 0.6325161, 0, 1, 0.5215687, 1,
-0.2330342, 0.3278264, 0.8368767, 0, 1, 0.5254902, 1,
-0.2317658, -0.6822322, -1.789883, 0, 1, 0.5333334, 1,
-0.2279867, -0.01984605, -2.389693, 0, 1, 0.5372549, 1,
-0.2272464, 1.538803, 1.791713, 0, 1, 0.5450981, 1,
-0.2232763, 0.7168463, 0.6002696, 0, 1, 0.5490196, 1,
-0.2205643, 0.4656416, -1.246777, 0, 1, 0.5568628, 1,
-0.2187781, 0.4369526, -0.8528221, 0, 1, 0.5607843, 1,
-0.2179029, 0.1939104, -2.557356, 0, 1, 0.5686275, 1,
-0.212018, 0.6530454, 0.0813998, 0, 1, 0.572549, 1,
-0.2094041, -0.8867719, -3.687205, 0, 1, 0.5803922, 1,
-0.2090083, -1.552624, -3.042889, 0, 1, 0.5843138, 1,
-0.2076802, -0.2495459, -2.252921, 0, 1, 0.5921569, 1,
-0.2067298, -0.259781, -2.424343, 0, 1, 0.5960785, 1,
-0.2062789, -2.090982, -2.674644, 0, 1, 0.6039216, 1,
-0.2037148, -0.1368403, -3.371222, 0, 1, 0.6117647, 1,
-0.202601, -1.061097, -4.116371, 0, 1, 0.6156863, 1,
-0.2018204, -1.237665, -2.033863, 0, 1, 0.6235294, 1,
-0.2010957, 1.150976, 1.104286, 0, 1, 0.627451, 1,
-0.1988785, -0.1823793, -1.936031, 0, 1, 0.6352941, 1,
-0.1975192, -1.045548, -2.201925, 0, 1, 0.6392157, 1,
-0.1942645, -0.4413697, -3.63488, 0, 1, 0.6470588, 1,
-0.1937975, 0.3202365, 0.1279295, 0, 1, 0.6509804, 1,
-0.1934772, 0.6212322, 0.1207142, 0, 1, 0.6588235, 1,
-0.1908294, 1.049426, 1.656159, 0, 1, 0.6627451, 1,
-0.1893344, -1.153448, -3.608541, 0, 1, 0.6705883, 1,
-0.1846261, 0.4278679, -0.7619823, 0, 1, 0.6745098, 1,
-0.1829301, -0.6813261, -2.134745, 0, 1, 0.682353, 1,
-0.1827841, -1.275717, -2.67402, 0, 1, 0.6862745, 1,
-0.1817182, -3.106283, -3.588894, 0, 1, 0.6941177, 1,
-0.1777575, -0.8595239, -2.098929, 0, 1, 0.7019608, 1,
-0.1770699, 1.077833, -1.862231, 0, 1, 0.7058824, 1,
-0.1729121, 0.1132178, -2.834229, 0, 1, 0.7137255, 1,
-0.1688515, 0.7504394, -0.01284743, 0, 1, 0.7176471, 1,
-0.1683151, -0.4504964, -3.304639, 0, 1, 0.7254902, 1,
-0.1645886, -0.5059408, -3.624638, 0, 1, 0.7294118, 1,
-0.1602525, -0.6249211, -3.021465, 0, 1, 0.7372549, 1,
-0.1588072, 1.441278, 0.2453762, 0, 1, 0.7411765, 1,
-0.155839, -1.401594, -3.476594, 0, 1, 0.7490196, 1,
-0.1435037, -0.1279222, -2.815102, 0, 1, 0.7529412, 1,
-0.1422541, 1.272458, 1.526154, 0, 1, 0.7607843, 1,
-0.135825, -0.3050774, -3.055602, 0, 1, 0.7647059, 1,
-0.1272189, -1.366511, -5.464834, 0, 1, 0.772549, 1,
-0.1266246, 0.7735115, -0.2983927, 0, 1, 0.7764706, 1,
-0.1215098, 1.076506, -1.094559, 0, 1, 0.7843137, 1,
-0.1213332, 0.07091094, -1.277279, 0, 1, 0.7882353, 1,
-0.1191557, 1.279733, 0.1290045, 0, 1, 0.7960784, 1,
-0.1146472, -1.555669, -2.041536, 0, 1, 0.8039216, 1,
-0.1088116, 0.8740688, 1.453271, 0, 1, 0.8078431, 1,
-0.106969, -1.367795, -2.463508, 0, 1, 0.8156863, 1,
-0.1036885, 1.050924, -1.362552, 0, 1, 0.8196079, 1,
-0.09449963, 1.789683, 0.3742531, 0, 1, 0.827451, 1,
-0.0897788, -0.4288465, -1.817485, 0, 1, 0.8313726, 1,
-0.08916077, 0.3407442, 0.9826119, 0, 1, 0.8392157, 1,
-0.08825513, -1.400511, -2.326743, 0, 1, 0.8431373, 1,
-0.08677605, -0.7551657, -3.104422, 0, 1, 0.8509804, 1,
-0.08471878, -0.7750161, -0.8902004, 0, 1, 0.854902, 1,
-0.08179745, 0.1013275, -0.9530835, 0, 1, 0.8627451, 1,
-0.07657295, -1.630689, -4.021633, 0, 1, 0.8666667, 1,
-0.0761785, 0.8572277, -0.1196928, 0, 1, 0.8745098, 1,
-0.07338113, -0.1862926, -2.455438, 0, 1, 0.8784314, 1,
-0.07101596, 0.05267256, -0.05882252, 0, 1, 0.8862745, 1,
-0.06994776, -1.224186, -2.964066, 0, 1, 0.8901961, 1,
-0.06746521, -1.363761, -2.882384, 0, 1, 0.8980392, 1,
-0.06493355, 2.055662, 1.130819, 0, 1, 0.9058824, 1,
-0.06101831, -1.370117, -1.937216, 0, 1, 0.9098039, 1,
-0.06066833, -0.09505348, -3.065719, 0, 1, 0.9176471, 1,
-0.05822985, -1.864792, -2.644967, 0, 1, 0.9215686, 1,
-0.05518493, 1.48622, -0.8544305, 0, 1, 0.9294118, 1,
-0.05471361, 0.03044249, -1.622628, 0, 1, 0.9333333, 1,
-0.05313214, -1.002204, -3.402855, 0, 1, 0.9411765, 1,
-0.05289605, -0.8341225, -3.775135, 0, 1, 0.945098, 1,
-0.05220589, 0.5492305, -0.04613278, 0, 1, 0.9529412, 1,
-0.04434422, -0.2473225, -0.8184739, 0, 1, 0.9568627, 1,
-0.04396741, 1.871254, -1.2388, 0, 1, 0.9647059, 1,
-0.03188913, 0.4681884, -1.967271, 0, 1, 0.9686275, 1,
-0.03097915, 0.4327671, 0.802699, 0, 1, 0.9764706, 1,
-0.02600953, -2.220475, -2.760612, 0, 1, 0.9803922, 1,
-0.02564633, -0.6503175, -3.010655, 0, 1, 0.9882353, 1,
-0.02393768, -1.976118, -2.546034, 0, 1, 0.9921569, 1,
-0.02091746, 1.019461, -0.5676076, 0, 1, 1, 1,
-0.01803957, -1.573578, -3.252611, 0, 0.9921569, 1, 1,
-0.01339731, -1.723653, -2.606425, 0, 0.9882353, 1, 1,
-0.01337918, 0.5604979, -0.3945577, 0, 0.9803922, 1, 1,
-0.01331472, -0.1256482, -5.888719, 0, 0.9764706, 1, 1,
-0.01270345, 1.544057, 0.3596793, 0, 0.9686275, 1, 1,
-0.009812756, 1.571026, 1.123779, 0, 0.9647059, 1, 1,
-0.009575154, -0.7516567, -4.60706, 0, 0.9568627, 1, 1,
-0.009454466, -0.5113968, -2.904732, 0, 0.9529412, 1, 1,
-0.00871148, 0.4877385, 0.3976286, 0, 0.945098, 1, 1,
-0.008343216, -0.5705882, -2.658452, 0, 0.9411765, 1, 1,
-0.007700649, -0.9112747, -1.910626, 0, 0.9333333, 1, 1,
-0.006751336, 1.1943, 0.623818, 0, 0.9294118, 1, 1,
0.002955724, -0.2343036, 3.733726, 0, 0.9215686, 1, 1,
0.006986725, -0.2605485, 2.246206, 0, 0.9176471, 1, 1,
0.0100783, -0.100279, 2.388802, 0, 0.9098039, 1, 1,
0.01279649, -0.706014, 2.983762, 0, 0.9058824, 1, 1,
0.01610862, -0.3949343, 1.640228, 0, 0.8980392, 1, 1,
0.01642382, 1.421763, 1.641745, 0, 0.8901961, 1, 1,
0.01756872, -0.843708, 1.480882, 0, 0.8862745, 1, 1,
0.03121168, -0.1597639, 3.160766, 0, 0.8784314, 1, 1,
0.03138325, 0.6292469, -0.8482216, 0, 0.8745098, 1, 1,
0.03160468, -0.8343179, 2.360032, 0, 0.8666667, 1, 1,
0.03499421, 0.1776778, 0.3679125, 0, 0.8627451, 1, 1,
0.03625276, 1.021708, 0.7212544, 0, 0.854902, 1, 1,
0.03848663, -1.10112, 3.582457, 0, 0.8509804, 1, 1,
0.05232497, 1.434719, -0.1635538, 0, 0.8431373, 1, 1,
0.05316916, 0.08238179, 2.666572, 0, 0.8392157, 1, 1,
0.05645971, -0.2443493, 3.95413, 0, 0.8313726, 1, 1,
0.05928769, 0.3889084, 1.038519, 0, 0.827451, 1, 1,
0.06038182, 0.6523799, -0.2277782, 0, 0.8196079, 1, 1,
0.06349304, -0.9713844, 2.521649, 0, 0.8156863, 1, 1,
0.06476369, -0.3777044, 3.125072, 0, 0.8078431, 1, 1,
0.06892899, -0.8285573, 3.905902, 0, 0.8039216, 1, 1,
0.07209875, -0.1192335, 1.872329, 0, 0.7960784, 1, 1,
0.07222474, 0.5223662, -0.7262322, 0, 0.7882353, 1, 1,
0.07492182, -1.103532, 1.88759, 0, 0.7843137, 1, 1,
0.07748517, 0.4831344, -0.3423651, 0, 0.7764706, 1, 1,
0.07917075, 0.7611785, -1.066089, 0, 0.772549, 1, 1,
0.09506955, 1.020651, 1.222344, 0, 0.7647059, 1, 1,
0.1018567, 1.933337, 1.757967, 0, 0.7607843, 1, 1,
0.1064042, 1.070726, 0.1401352, 0, 0.7529412, 1, 1,
0.1072883, 1.002404, 0.7278401, 0, 0.7490196, 1, 1,
0.1123905, -0.3425604, 3.285273, 0, 0.7411765, 1, 1,
0.1125815, -0.109297, 3.348496, 0, 0.7372549, 1, 1,
0.1154082, 0.8551345, -0.800789, 0, 0.7294118, 1, 1,
0.1197126, -2.329125, 2.925365, 0, 0.7254902, 1, 1,
0.1200147, 1.269956, 0.2741399, 0, 0.7176471, 1, 1,
0.124238, 0.05661215, -0.4149323, 0, 0.7137255, 1, 1,
0.1262014, -1.106789, 2.467789, 0, 0.7058824, 1, 1,
0.131107, -0.9623594, 3.343404, 0, 0.6980392, 1, 1,
0.1316181, 0.5437238, 0.6519857, 0, 0.6941177, 1, 1,
0.1319298, -0.9808304, 3.169096, 0, 0.6862745, 1, 1,
0.1335633, 0.607015, -0.7126475, 0, 0.682353, 1, 1,
0.1376265, -0.8565913, 4.942138, 0, 0.6745098, 1, 1,
0.1399742, -0.07402615, 1.128416, 0, 0.6705883, 1, 1,
0.1482894, -0.003989167, 1.998098, 0, 0.6627451, 1, 1,
0.1483244, 0.04576731, 1.482187, 0, 0.6588235, 1, 1,
0.1507373, -0.3747991, 3.19481, 0, 0.6509804, 1, 1,
0.1538189, 2.3629, 0.3490586, 0, 0.6470588, 1, 1,
0.161316, 0.4181132, 0.6500532, 0, 0.6392157, 1, 1,
0.162161, -0.8944533, 2.931295, 0, 0.6352941, 1, 1,
0.1628233, 0.8267269, 0.5017057, 0, 0.627451, 1, 1,
0.166554, -3.041397, 4.887629, 0, 0.6235294, 1, 1,
0.1666814, -1.78519, 3.103074, 0, 0.6156863, 1, 1,
0.1713328, -0.3849482, 2.289044, 0, 0.6117647, 1, 1,
0.1721768, 1.291363, 0.3397213, 0, 0.6039216, 1, 1,
0.1730759, 0.6674582, -0.3232999, 0, 0.5960785, 1, 1,
0.1781234, 0.8836178, 0.1690311, 0, 0.5921569, 1, 1,
0.1799437, 0.8838067, 0.9069335, 0, 0.5843138, 1, 1,
0.1830131, -0.3140987, 1.478835, 0, 0.5803922, 1, 1,
0.1834278, 0.1571812, 0.9101419, 0, 0.572549, 1, 1,
0.1909456, 1.493217, -1.634313, 0, 0.5686275, 1, 1,
0.1942351, 1.313571, -0.6785498, 0, 0.5607843, 1, 1,
0.1970843, 0.8141503, -0.8691635, 0, 0.5568628, 1, 1,
0.2003371, 0.02497322, 1.132704, 0, 0.5490196, 1, 1,
0.2004574, -0.6667034, 2.915526, 0, 0.5450981, 1, 1,
0.2017394, -1.699954, 2.733091, 0, 0.5372549, 1, 1,
0.2053093, -0.2095179, 1.932553, 0, 0.5333334, 1, 1,
0.2059374, 0.3775831, 0.1359881, 0, 0.5254902, 1, 1,
0.2070969, 0.2596335, 1.436627, 0, 0.5215687, 1, 1,
0.2088877, -0.125941, 0.7908856, 0, 0.5137255, 1, 1,
0.208957, -0.6913866, 0.9758801, 0, 0.509804, 1, 1,
0.2107445, -1.146953, 2.350049, 0, 0.5019608, 1, 1,
0.2126612, 1.124697, 0.8603124, 0, 0.4941176, 1, 1,
0.2139031, -0.2409645, 3.361429, 0, 0.4901961, 1, 1,
0.2139056, 1.131017, 0.9394444, 0, 0.4823529, 1, 1,
0.2173897, 0.3558863, 0.8667778, 0, 0.4784314, 1, 1,
0.2191868, 0.7056549, 1.010655, 0, 0.4705882, 1, 1,
0.2197374, -0.6570453, 4.805994, 0, 0.4666667, 1, 1,
0.2203939, -0.2673933, 0.8191456, 0, 0.4588235, 1, 1,
0.2226915, -0.1854017, 1.535607, 0, 0.454902, 1, 1,
0.2242362, 0.5535626, 0.5848309, 0, 0.4470588, 1, 1,
0.2263629, -0.1158402, 2.217883, 0, 0.4431373, 1, 1,
0.2270324, 0.6759046, -1.451231, 0, 0.4352941, 1, 1,
0.2295062, 0.9437452, 0.02615312, 0, 0.4313726, 1, 1,
0.2298909, -0.3750899, 0.7193587, 0, 0.4235294, 1, 1,
0.2321461, 0.2029759, 1.351739, 0, 0.4196078, 1, 1,
0.2349257, -1.062894, 3.168731, 0, 0.4117647, 1, 1,
0.2402669, -0.04744018, 0.8076884, 0, 0.4078431, 1, 1,
0.2438195, -0.2953528, 2.784899, 0, 0.4, 1, 1,
0.2498296, -2.289967, 1.692179, 0, 0.3921569, 1, 1,
0.2512389, -2.125903, 1.18164, 0, 0.3882353, 1, 1,
0.2513267, 1.459033, -0.7315339, 0, 0.3803922, 1, 1,
0.2656158, 0.449717, 0.9894105, 0, 0.3764706, 1, 1,
0.2661971, -0.4681642, 3.043036, 0, 0.3686275, 1, 1,
0.2668298, 0.4060497, 0.2982865, 0, 0.3647059, 1, 1,
0.2713234, 1.062588, 1.019191, 0, 0.3568628, 1, 1,
0.2717493, -2.162852, 2.869928, 0, 0.3529412, 1, 1,
0.2774834, 1.394301, -2.016185, 0, 0.345098, 1, 1,
0.2781918, 1.322037, 0.7929944, 0, 0.3411765, 1, 1,
0.2799845, 1.19082, 1.129232, 0, 0.3333333, 1, 1,
0.2805807, -0.7029572, 2.626514, 0, 0.3294118, 1, 1,
0.2843527, -0.7416648, 3.219737, 0, 0.3215686, 1, 1,
0.2864843, 0.7480702, 0.663379, 0, 0.3176471, 1, 1,
0.292877, -2.246823, 2.801551, 0, 0.3098039, 1, 1,
0.293603, 0.4353164, 1.542773, 0, 0.3058824, 1, 1,
0.2961155, -1.210551, 4.791775, 0, 0.2980392, 1, 1,
0.2969815, -0.2461502, 3.304909, 0, 0.2901961, 1, 1,
0.2979264, -0.4937142, 2.346722, 0, 0.2862745, 1, 1,
0.2984443, 0.3179252, 3.125191, 0, 0.2784314, 1, 1,
0.3006141, 1.528714, -0.8239747, 0, 0.2745098, 1, 1,
0.3029179, -0.3140501, 2.521737, 0, 0.2666667, 1, 1,
0.3058061, -0.9458788, 1.803478, 0, 0.2627451, 1, 1,
0.3123123, -0.2279432, 2.1834, 0, 0.254902, 1, 1,
0.3125376, 1.010695, -0.3588413, 0, 0.2509804, 1, 1,
0.3148469, -0.1833498, 2.045803, 0, 0.2431373, 1, 1,
0.3169678, 0.9373198, 0.3192195, 0, 0.2392157, 1, 1,
0.3170038, -0.1404287, 3.43709, 0, 0.2313726, 1, 1,
0.3173493, 0.7497494, 2.842105, 0, 0.227451, 1, 1,
0.3185635, -0.3677603, 3.494457, 0, 0.2196078, 1, 1,
0.3209175, 0.02587556, 0.5471875, 0, 0.2156863, 1, 1,
0.3211415, -0.1715572, 1.577885, 0, 0.2078431, 1, 1,
0.3222197, 0.03329002, 1.873692, 0, 0.2039216, 1, 1,
0.32349, -1.099724, 2.380258, 0, 0.1960784, 1, 1,
0.3236305, 1.701444, -0.3291048, 0, 0.1882353, 1, 1,
0.3249475, -0.4012054, 3.237871, 0, 0.1843137, 1, 1,
0.334654, 1.715477, 0.0555489, 0, 0.1764706, 1, 1,
0.339343, -1.548174, 3.289294, 0, 0.172549, 1, 1,
0.3423677, -1.286488, 2.547423, 0, 0.1647059, 1, 1,
0.3447498, -1.260605, 2.305279, 0, 0.1607843, 1, 1,
0.3511012, 0.123126, 0.9931856, 0, 0.1529412, 1, 1,
0.353715, -0.2660294, 1.013645, 0, 0.1490196, 1, 1,
0.3577987, -1.82314, 3.761787, 0, 0.1411765, 1, 1,
0.3585818, -0.4053927, 1.873804, 0, 0.1372549, 1, 1,
0.3587969, 2.118279, 0.9433469, 0, 0.1294118, 1, 1,
0.3593561, -2.841436, 3.092557, 0, 0.1254902, 1, 1,
0.3603096, -1.097368, 2.18857, 0, 0.1176471, 1, 1,
0.3609027, -0.05808836, 1.057934, 0, 0.1137255, 1, 1,
0.3638099, -0.5214332, 0.7545211, 0, 0.1058824, 1, 1,
0.3716979, 0.04008324, -0.1072021, 0, 0.09803922, 1, 1,
0.3789934, -1.130096, 2.261634, 0, 0.09411765, 1, 1,
0.3853495, 1.697317, 0.5654362, 0, 0.08627451, 1, 1,
0.3886674, -0.08723605, 2.277716, 0, 0.08235294, 1, 1,
0.3935905, 0.172138, 0.6530062, 0, 0.07450981, 1, 1,
0.39475, 0.9215331, 0.8265245, 0, 0.07058824, 1, 1,
0.3950783, -0.492973, 2.078865, 0, 0.0627451, 1, 1,
0.3988466, -1.072683, 4.728607, 0, 0.05882353, 1, 1,
0.4055248, 0.2255674, 3.026731, 0, 0.05098039, 1, 1,
0.4072731, 0.09899206, 1.037682, 0, 0.04705882, 1, 1,
0.4076845, 0.06535355, 0.8788553, 0, 0.03921569, 1, 1,
0.4082243, -0.06344838, 2.03882, 0, 0.03529412, 1, 1,
0.4085255, -0.1021481, 3.123643, 0, 0.02745098, 1, 1,
0.4154248, 0.4525721, 1.225431, 0, 0.02352941, 1, 1,
0.41568, -0.2088487, 0.4881238, 0, 0.01568628, 1, 1,
0.4157765, -0.7870684, 2.057832, 0, 0.01176471, 1, 1,
0.4177026, 1.885057, 0.3883335, 0, 0.003921569, 1, 1,
0.4180287, -0.2882857, 2.450426, 0.003921569, 0, 1, 1,
0.4218405, 1.141252, 0.2656615, 0.007843138, 0, 1, 1,
0.4288859, 0.2719604, 1.569861, 0.01568628, 0, 1, 1,
0.4333271, 0.637445, -0.6559534, 0.01960784, 0, 1, 1,
0.4336353, -1.321584, 3.888351, 0.02745098, 0, 1, 1,
0.4368683, -0.6357546, 2.466591, 0.03137255, 0, 1, 1,
0.4396794, -1.890528, 3.196407, 0.03921569, 0, 1, 1,
0.4396822, -0.9184976, 4.326486, 0.04313726, 0, 1, 1,
0.441694, 0.14964, -1.431661, 0.05098039, 0, 1, 1,
0.4422185, 1.647381, -0.2139946, 0.05490196, 0, 1, 1,
0.443789, 0.855007, 1.49993, 0.0627451, 0, 1, 1,
0.4462948, -0.3698964, 3.253777, 0.06666667, 0, 1, 1,
0.4467902, -0.3801386, 1.374542, 0.07450981, 0, 1, 1,
0.4621287, -0.111607, 1.478252, 0.07843138, 0, 1, 1,
0.4626286, 0.6314739, -0.9072651, 0.08627451, 0, 1, 1,
0.4629961, 1.164205, -0.008039081, 0.09019608, 0, 1, 1,
0.4633121, -0.4938963, 2.061343, 0.09803922, 0, 1, 1,
0.4651611, 1.01847, 2.797615, 0.1058824, 0, 1, 1,
0.4678252, -0.01220762, 2.968162, 0.1098039, 0, 1, 1,
0.4685604, 0.4742428, 0.8626011, 0.1176471, 0, 1, 1,
0.4693324, 0.6380211, 1.148969, 0.1215686, 0, 1, 1,
0.4780627, 0.6113737, 1.256637, 0.1294118, 0, 1, 1,
0.4835574, 1.158448, 1.805072, 0.1333333, 0, 1, 1,
0.4898171, 0.494276, 1.833275, 0.1411765, 0, 1, 1,
0.4984313, -0.4686739, 3.32814, 0.145098, 0, 1, 1,
0.5016931, 1.072611, 1.278618, 0.1529412, 0, 1, 1,
0.5037389, 0.1359346, 1.09942, 0.1568628, 0, 1, 1,
0.5115199, -1.021488, 2.788676, 0.1647059, 0, 1, 1,
0.513559, 0.7281081, -2.040221, 0.1686275, 0, 1, 1,
0.5156435, -0.2845757, 3.226348, 0.1764706, 0, 1, 1,
0.5208337, 0.274769, 0.174667, 0.1803922, 0, 1, 1,
0.5274159, 0.4430631, -0.6303483, 0.1882353, 0, 1, 1,
0.5275028, -1.058754, 1.965664, 0.1921569, 0, 1, 1,
0.527599, 0.3962924, 2.106119, 0.2, 0, 1, 1,
0.529111, -0.8302783, 2.607299, 0.2078431, 0, 1, 1,
0.5304576, 0.4658031, 1.166938, 0.2117647, 0, 1, 1,
0.5335959, 0.0687574, 1.336605, 0.2196078, 0, 1, 1,
0.5341027, 0.8145943, 0.372253, 0.2235294, 0, 1, 1,
0.5343512, -3.171743, 3.575424, 0.2313726, 0, 1, 1,
0.5343512, -2.057385, 2.909587, 0.2352941, 0, 1, 1,
0.5349517, -0.8621905, 0.8265483, 0.2431373, 0, 1, 1,
0.5454818, -1.344408, 2.523387, 0.2470588, 0, 1, 1,
0.5499029, -0.371485, 0.9711538, 0.254902, 0, 1, 1,
0.5536834, 0.3850179, -0.2316369, 0.2588235, 0, 1, 1,
0.5537901, 0.1781221, 2.11828, 0.2666667, 0, 1, 1,
0.555326, -1.763082, 2.301484, 0.2705882, 0, 1, 1,
0.5553314, -0.1976475, 2.840526, 0.2784314, 0, 1, 1,
0.5555794, 0.04639446, 0.4006195, 0.282353, 0, 1, 1,
0.556839, 1.223189, 0.3436092, 0.2901961, 0, 1, 1,
0.5661739, 0.4000471, -0.594413, 0.2941177, 0, 1, 1,
0.5685545, -0.8167241, 3.251333, 0.3019608, 0, 1, 1,
0.5715047, -0.3374031, 1.918238, 0.3098039, 0, 1, 1,
0.577897, 0.9353526, 0.4845355, 0.3137255, 0, 1, 1,
0.5786145, 0.4801151, 3.081536, 0.3215686, 0, 1, 1,
0.5831134, -0.05225707, 3.018693, 0.3254902, 0, 1, 1,
0.5839261, 2.084606, 0.4706504, 0.3333333, 0, 1, 1,
0.5916347, 0.9722168, 2.181337, 0.3372549, 0, 1, 1,
0.592827, 1.503224, 1.052741, 0.345098, 0, 1, 1,
0.5939947, 1.334191, 0.8214388, 0.3490196, 0, 1, 1,
0.5994337, -0.1928703, 3.094865, 0.3568628, 0, 1, 1,
0.6012302, 0.01219895, 2.481148, 0.3607843, 0, 1, 1,
0.6035933, 0.09114318, 0.8662814, 0.3686275, 0, 1, 1,
0.615564, -0.5137744, 3.860211, 0.372549, 0, 1, 1,
0.6166189, 0.6474274, 0.9077246, 0.3803922, 0, 1, 1,
0.6191379, 0.04086955, 2.574334, 0.3843137, 0, 1, 1,
0.623002, -0.2135312, 0.8087705, 0.3921569, 0, 1, 1,
0.6291244, -0.09276349, 0.4624489, 0.3960784, 0, 1, 1,
0.6311073, -0.3140064, 2.283285, 0.4039216, 0, 1, 1,
0.6327855, -0.5156382, 2.998911, 0.4117647, 0, 1, 1,
0.6368439, -2.402545, 2.406564, 0.4156863, 0, 1, 1,
0.6391538, -0.3828763, 1.693752, 0.4235294, 0, 1, 1,
0.6397372, -0.5692227, 2.505167, 0.427451, 0, 1, 1,
0.6422463, -1.849152, 1.272924, 0.4352941, 0, 1, 1,
0.6521642, 0.2238494, 0.08088146, 0.4392157, 0, 1, 1,
0.6523038, -2.066439, 3.468214, 0.4470588, 0, 1, 1,
0.6551991, -0.162347, -0.5372997, 0.4509804, 0, 1, 1,
0.6673607, -1.770352, 3.513594, 0.4588235, 0, 1, 1,
0.6756699, 1.902184, 1.204902, 0.4627451, 0, 1, 1,
0.6782925, -0.2624863, 2.45433, 0.4705882, 0, 1, 1,
0.6789139, 0.8124595, 0.9130389, 0.4745098, 0, 1, 1,
0.6858036, 2.001361, -0.4660885, 0.4823529, 0, 1, 1,
0.6888694, 0.3536659, 1.658892, 0.4862745, 0, 1, 1,
0.6891788, 0.26682, 2.17028, 0.4941176, 0, 1, 1,
0.6973347, 0.1438662, 0.4280375, 0.5019608, 0, 1, 1,
0.6982495, 0.885498, 0.9252282, 0.5058824, 0, 1, 1,
0.7005117, -2.157201, 3.252048, 0.5137255, 0, 1, 1,
0.7062058, -0.4457291, 4.293655, 0.5176471, 0, 1, 1,
0.7089533, 1.276883, 1.809469, 0.5254902, 0, 1, 1,
0.7131948, -0.3046805, 0.2292429, 0.5294118, 0, 1, 1,
0.7139627, 0.6950808, -1.026796, 0.5372549, 0, 1, 1,
0.7148617, -1.023296, 1.166582, 0.5411765, 0, 1, 1,
0.7194368, 1.20465, 2.35362, 0.5490196, 0, 1, 1,
0.7200356, -0.6677004, 1.941751, 0.5529412, 0, 1, 1,
0.7210814, 3.23886, 0.8974238, 0.5607843, 0, 1, 1,
0.7379116, -0.7394198, 2.467677, 0.5647059, 0, 1, 1,
0.7447903, 0.3200239, 1.375354, 0.572549, 0, 1, 1,
0.7483482, -0.3704222, -0.07341626, 0.5764706, 0, 1, 1,
0.7503091, -0.6761715, 3.364226, 0.5843138, 0, 1, 1,
0.7545919, -0.1074921, -0.5370216, 0.5882353, 0, 1, 1,
0.7562201, -0.06732026, 2.35178, 0.5960785, 0, 1, 1,
0.7617787, 0.7352629, 0.7317618, 0.6039216, 0, 1, 1,
0.7663599, 1.187087, 0.7203416, 0.6078432, 0, 1, 1,
0.7677891, -0.1327701, 3.644871, 0.6156863, 0, 1, 1,
0.7717512, 1.176324, 2.561477, 0.6196079, 0, 1, 1,
0.7838088, -0.2266183, -1.412329, 0.627451, 0, 1, 1,
0.7868773, 0.03316505, 2.326804, 0.6313726, 0, 1, 1,
0.788554, -0.9676958, 2.109672, 0.6392157, 0, 1, 1,
0.7932215, 0.5514271, 2.118703, 0.6431373, 0, 1, 1,
0.7965736, -0.5443141, 1.049715, 0.6509804, 0, 1, 1,
0.807071, 0.5659831, 0.8814265, 0.654902, 0, 1, 1,
0.8091596, -0.9829521, 4.467293, 0.6627451, 0, 1, 1,
0.8094458, -0.3407668, 2.515606, 0.6666667, 0, 1, 1,
0.8132283, 1.455418, -0.8685547, 0.6745098, 0, 1, 1,
0.8133606, -0.7368989, 2.776891, 0.6784314, 0, 1, 1,
0.8157601, 1.384211, 0.02861662, 0.6862745, 0, 1, 1,
0.8190398, -0.6372571, 1.409697, 0.6901961, 0, 1, 1,
0.8191757, -0.08952732, 1.21149, 0.6980392, 0, 1, 1,
0.8225507, 0.5413795, 1.685652, 0.7058824, 0, 1, 1,
0.8301489, -0.2933182, 1.735838, 0.7098039, 0, 1, 1,
0.830977, 0.7498458, -0.00246141, 0.7176471, 0, 1, 1,
0.8335693, -2.072721, 4.214464, 0.7215686, 0, 1, 1,
0.8343328, -0.4513663, 0.3086419, 0.7294118, 0, 1, 1,
0.8421463, -0.1914284, 1.309631, 0.7333333, 0, 1, 1,
0.8537399, 1.392527, -1.007043, 0.7411765, 0, 1, 1,
0.8654187, -0.08537544, 0.9811798, 0.7450981, 0, 1, 1,
0.8673877, 0.2286785, 3.871011, 0.7529412, 0, 1, 1,
0.8739197, 0.78523, 1.101047, 0.7568628, 0, 1, 1,
0.8753833, 0.3058043, 1.906133, 0.7647059, 0, 1, 1,
0.876946, -1.65748, 1.472655, 0.7686275, 0, 1, 1,
0.8776928, 1.646402, 1.697377, 0.7764706, 0, 1, 1,
0.8803673, -0.4922971, 3.064623, 0.7803922, 0, 1, 1,
0.8877189, 0.637939, 0.9021636, 0.7882353, 0, 1, 1,
0.8915272, -0.9682809, 1.001221, 0.7921569, 0, 1, 1,
0.8935459, 0.3893555, 2.369856, 0.8, 0, 1, 1,
0.8969474, -2.249359, 3.144013, 0.8078431, 0, 1, 1,
0.8970942, -1.415782, 0.920367, 0.8117647, 0, 1, 1,
0.9001631, 0.2696059, 1.754393, 0.8196079, 0, 1, 1,
0.9097551, -0.1476216, 2.776823, 0.8235294, 0, 1, 1,
0.9204913, 0.02188612, 1.852289, 0.8313726, 0, 1, 1,
0.9248287, -1.61228, 2.127002, 0.8352941, 0, 1, 1,
0.926182, 0.01028941, 1.281099, 0.8431373, 0, 1, 1,
0.9366437, 0.8996353, 0.4324724, 0.8470588, 0, 1, 1,
0.9400752, -0.5098061, 3.537574, 0.854902, 0, 1, 1,
0.9412369, -1.038827, 2.871746, 0.8588235, 0, 1, 1,
0.9431986, 0.4110475, 1.463239, 0.8666667, 0, 1, 1,
0.9476576, -1.457479, 4.625976, 0.8705882, 0, 1, 1,
0.9525457, -0.5759891, 2.562664, 0.8784314, 0, 1, 1,
0.9553031, -0.08364806, 2.562175, 0.8823529, 0, 1, 1,
0.9591529, -0.630766, 2.002893, 0.8901961, 0, 1, 1,
0.9633753, -2.208009, 3.869373, 0.8941177, 0, 1, 1,
0.9828382, 0.4997448, 1.385447, 0.9019608, 0, 1, 1,
0.9885818, -0.5246962, 1.125924, 0.9098039, 0, 1, 1,
0.9944342, -0.008923761, 1.727823, 0.9137255, 0, 1, 1,
1.000151, -0.929388, 2.61333, 0.9215686, 0, 1, 1,
1.004516, 1.229933, 2.197211, 0.9254902, 0, 1, 1,
1.0057, -0.8284313, 2.354857, 0.9333333, 0, 1, 1,
1.005846, -0.06174888, 0.005039095, 0.9372549, 0, 1, 1,
1.008031, 0.5830485, 2.499221, 0.945098, 0, 1, 1,
1.018484, 1.516107, 1.56587, 0.9490196, 0, 1, 1,
1.026676, -0.5931779, 4.494079, 0.9568627, 0, 1, 1,
1.029278, -1.442257, 2.050729, 0.9607843, 0, 1, 1,
1.032317, -1.109314, 1.817705, 0.9686275, 0, 1, 1,
1.033296, -0.4038161, 1.765522, 0.972549, 0, 1, 1,
1.036843, 0.4925509, 2.045925, 0.9803922, 0, 1, 1,
1.043478, 1.524939, 1.344926, 0.9843137, 0, 1, 1,
1.047246, 1.16763, 2.833203, 0.9921569, 0, 1, 1,
1.051222, 0.776122, 1.004182, 0.9960784, 0, 1, 1,
1.051754, -1.620533, 1.596472, 1, 0, 0.9960784, 1,
1.055647, -1.121889, 2.941358, 1, 0, 0.9882353, 1,
1.058347, -0.07559967, 0.5615782, 1, 0, 0.9843137, 1,
1.061052, 1.190377, 0.4724679, 1, 0, 0.9764706, 1,
1.062146, -0.6989163, 1.369689, 1, 0, 0.972549, 1,
1.063028, 0.3085167, 1.333074, 1, 0, 0.9647059, 1,
1.064614, 1.084746, 2.402209, 1, 0, 0.9607843, 1,
1.066952, 0.2053879, -0.3590579, 1, 0, 0.9529412, 1,
1.067665, -0.8513746, 3.573616, 1, 0, 0.9490196, 1,
1.068818, -2.315072, 3.902945, 1, 0, 0.9411765, 1,
1.069416, -1.277124, 1.086912, 1, 0, 0.9372549, 1,
1.071866, -0.5890568, 2.56631, 1, 0, 0.9294118, 1,
1.074888, 0.4522355, 1.049428, 1, 0, 0.9254902, 1,
1.077077, -1.23781, 3.472577, 1, 0, 0.9176471, 1,
1.084116, 0.07382144, 1.859139, 1, 0, 0.9137255, 1,
1.0849, -1.818756, 2.688224, 1, 0, 0.9058824, 1,
1.08741, -0.6395345, 1.984828, 1, 0, 0.9019608, 1,
1.099427, 0.2956563, 0.8186699, 1, 0, 0.8941177, 1,
1.105771, 1.277925, 2.287186, 1, 0, 0.8862745, 1,
1.110171, 0.73561, 2.453396, 1, 0, 0.8823529, 1,
1.114588, 0.7035303, -0.1072558, 1, 0, 0.8745098, 1,
1.124743, 0.8670794, -0.2943731, 1, 0, 0.8705882, 1,
1.125913, 0.7269892, 0.9655613, 1, 0, 0.8627451, 1,
1.129124, -0.06391961, 2.522572, 1, 0, 0.8588235, 1,
1.130206, -0.412075, 1.906315, 1, 0, 0.8509804, 1,
1.131004, 0.7335402, 0.6221299, 1, 0, 0.8470588, 1,
1.131435, 0.2843244, 3.97714, 1, 0, 0.8392157, 1,
1.135024, 0.5210513, 1.2843, 1, 0, 0.8352941, 1,
1.140241, 0.4065311, 1.61692, 1, 0, 0.827451, 1,
1.14941, 1.186493, 1.375442, 1, 0, 0.8235294, 1,
1.153624, 0.8636083, 1.822346, 1, 0, 0.8156863, 1,
1.160546, 1.384318, -0.03283243, 1, 0, 0.8117647, 1,
1.166146, -2.466974, 1.70628, 1, 0, 0.8039216, 1,
1.173236, -0.9697332, 1.599017, 1, 0, 0.7960784, 1,
1.175443, -0.1343266, 1.641817, 1, 0, 0.7921569, 1,
1.179891, 0.1821251, 2.953293, 1, 0, 0.7843137, 1,
1.185224, 1.091201, -0.1269664, 1, 0, 0.7803922, 1,
1.189378, -1.232363, 0.6486423, 1, 0, 0.772549, 1,
1.202621, -1.664732, 2.899526, 1, 0, 0.7686275, 1,
1.210048, 1.425089, -0.7113273, 1, 0, 0.7607843, 1,
1.214734, 1.37989, 0.8709899, 1, 0, 0.7568628, 1,
1.232513, 0.3673412, 1.363674, 1, 0, 0.7490196, 1,
1.233357, 0.3110473, 0.3542603, 1, 0, 0.7450981, 1,
1.23554, 0.05940726, 0.3570437, 1, 0, 0.7372549, 1,
1.236399, -0.136397, 0.9011614, 1, 0, 0.7333333, 1,
1.236476, 0.2826221, 0.5079653, 1, 0, 0.7254902, 1,
1.239567, 1.086278, 1.07555, 1, 0, 0.7215686, 1,
1.240297, -0.7797385, 2.744721, 1, 0, 0.7137255, 1,
1.247047, -0.1473834, 1.762432, 1, 0, 0.7098039, 1,
1.252681, 0.6579534, 1.205808, 1, 0, 0.7019608, 1,
1.253633, 1.351364, 1.384436, 1, 0, 0.6941177, 1,
1.256231, 2.324191, 0.1907428, 1, 0, 0.6901961, 1,
1.263338, 1.119058, 0.02231786, 1, 0, 0.682353, 1,
1.266092, 1.657418, 1.252884, 1, 0, 0.6784314, 1,
1.268093, -1.370571, 2.204675, 1, 0, 0.6705883, 1,
1.269179, -0.2345421, 0.4149779, 1, 0, 0.6666667, 1,
1.271257, 0.2246633, 1.927267, 1, 0, 0.6588235, 1,
1.278536, -0.6079103, 2.219669, 1, 0, 0.654902, 1,
1.279955, -1.521939, 3.180505, 1, 0, 0.6470588, 1,
1.280583, -0.5803244, 2.098939, 1, 0, 0.6431373, 1,
1.285546, -0.5404901, 2.615498, 1, 0, 0.6352941, 1,
1.294384, -1.227461, 1.625096, 1, 0, 0.6313726, 1,
1.295312, -0.9122638, 2.124101, 1, 0, 0.6235294, 1,
1.296837, -0.0939192, -0.05737014, 1, 0, 0.6196079, 1,
1.307728, 0.714955, -1.430294, 1, 0, 0.6117647, 1,
1.313578, -0.3750147, 1.455945, 1, 0, 0.6078432, 1,
1.314003, 1.314981, 1.036962, 1, 0, 0.6, 1,
1.31517, 0.008942764, 0.1713364, 1, 0, 0.5921569, 1,
1.31736, 1.323237, 2.462463, 1, 0, 0.5882353, 1,
1.323158, -0.8376449, 4.486427, 1, 0, 0.5803922, 1,
1.323623, 0.1200293, 0.4682351, 1, 0, 0.5764706, 1,
1.325345, -0.9800683, 1.773492, 1, 0, 0.5686275, 1,
1.327592, 0.2320168, 3.763551, 1, 0, 0.5647059, 1,
1.334216, -0.2358298, 2.391731, 1, 0, 0.5568628, 1,
1.334958, 0.04900425, 2.178252, 1, 0, 0.5529412, 1,
1.335013, -0.544723, 3.038476, 1, 0, 0.5450981, 1,
1.336113, 0.5761776, 1.488617, 1, 0, 0.5411765, 1,
1.33987, -0.7377991, 2.951282, 1, 0, 0.5333334, 1,
1.355349, 0.8998207, 0.09906215, 1, 0, 0.5294118, 1,
1.377198, -0.2705758, 1.689513, 1, 0, 0.5215687, 1,
1.383589, 1.361634, 0.4616866, 1, 0, 0.5176471, 1,
1.389666, 0.7257056, 2.323259, 1, 0, 0.509804, 1,
1.411959, 1.941115, 0.4895208, 1, 0, 0.5058824, 1,
1.420549, -0.9788111, 3.969975, 1, 0, 0.4980392, 1,
1.425144, -2.271624, 1.670024, 1, 0, 0.4901961, 1,
1.425168, 0.2409488, 2.094886, 1, 0, 0.4862745, 1,
1.442392, 0.2933393, -0.133275, 1, 0, 0.4784314, 1,
1.448398, -0.9549733, 0.2004476, 1, 0, 0.4745098, 1,
1.452801, 0.3801321, 2.028652, 1, 0, 0.4666667, 1,
1.453744, -0.9494568, 1.007973, 1, 0, 0.4627451, 1,
1.459976, 0.5774958, 0.4654279, 1, 0, 0.454902, 1,
1.460433, 0.2729471, 1.192264, 1, 0, 0.4509804, 1,
1.467077, 0.4794535, 3.72929, 1, 0, 0.4431373, 1,
1.48286, -0.07809641, -0.03205667, 1, 0, 0.4392157, 1,
1.49116, 0.5275313, 2.931714, 1, 0, 0.4313726, 1,
1.493869, -0.05867872, 2.968695, 1, 0, 0.427451, 1,
1.50064, 0.5330718, 1.443549, 1, 0, 0.4196078, 1,
1.506651, -0.306609, 0.7895967, 1, 0, 0.4156863, 1,
1.508277, -0.5342885, 0.04623653, 1, 0, 0.4078431, 1,
1.536862, 1.110677, 1.673318, 1, 0, 0.4039216, 1,
1.546115, -2.218308, 1.925192, 1, 0, 0.3960784, 1,
1.549241, 1.620404, 1.289817, 1, 0, 0.3882353, 1,
1.551584, -0.7010779, 2.543173, 1, 0, 0.3843137, 1,
1.562866, 1.045394, 1.640054, 1, 0, 0.3764706, 1,
1.572749, 0.5651927, -0.1190253, 1, 0, 0.372549, 1,
1.613665, 0.1842812, 1.715024, 1, 0, 0.3647059, 1,
1.614075, 0.6604687, 1.136088, 1, 0, 0.3607843, 1,
1.620709, 1.053813, 2.733108, 1, 0, 0.3529412, 1,
1.620998, 0.6515996, 2.797288, 1, 0, 0.3490196, 1,
1.629535, 0.8644404, 1.881651, 1, 0, 0.3411765, 1,
1.636381, -0.9915567, 1.969725, 1, 0, 0.3372549, 1,
1.64748, 1.311275, 2.044376, 1, 0, 0.3294118, 1,
1.654473, -0.4196334, 3.431042, 1, 0, 0.3254902, 1,
1.674075, -0.6941605, 3.840396, 1, 0, 0.3176471, 1,
1.689745, 0.2945021, -0.2494476, 1, 0, 0.3137255, 1,
1.74337, 0.652896, 0.3845672, 1, 0, 0.3058824, 1,
1.750374, -1.151584, 2.108459, 1, 0, 0.2980392, 1,
1.762204, -1.270471, 2.651849, 1, 0, 0.2941177, 1,
1.766783, 0.2228562, 1.014347, 1, 0, 0.2862745, 1,
1.774099, 0.6807903, 2.516081, 1, 0, 0.282353, 1,
1.784968, 1.169884, 2.275565, 1, 0, 0.2745098, 1,
1.790328, 0.6875842, 0.6763179, 1, 0, 0.2705882, 1,
1.791424, 1.726766, 2.110569, 1, 0, 0.2627451, 1,
1.81709, -1.496712, 2.705553, 1, 0, 0.2588235, 1,
1.818281, -0.3568932, 1.692528, 1, 0, 0.2509804, 1,
1.83905, -0.8450089, 1.330537, 1, 0, 0.2470588, 1,
1.863129, 0.6699167, 0.9569675, 1, 0, 0.2392157, 1,
1.881732, 0.0125183, 0.2931871, 1, 0, 0.2352941, 1,
1.887381, -1.377054, 0.7869764, 1, 0, 0.227451, 1,
1.887934, -0.2944829, 0.9232419, 1, 0, 0.2235294, 1,
1.900653, -0.03358348, -0.6622202, 1, 0, 0.2156863, 1,
1.908642, 0.5932049, 0.6668311, 1, 0, 0.2117647, 1,
1.937223, 1.172609, -0.7572038, 1, 0, 0.2039216, 1,
1.969301, -2.319362, 0.8686798, 1, 0, 0.1960784, 1,
1.970011, 0.03705363, 3.227343, 1, 0, 0.1921569, 1,
1.995227, 0.2183457, 1.098468, 1, 0, 0.1843137, 1,
2.013159, -0.7781076, 3.845459, 1, 0, 0.1803922, 1,
2.03762, -0.5595762, 1.325133, 1, 0, 0.172549, 1,
2.042746, 1.105477, 1.000046, 1, 0, 0.1686275, 1,
2.073253, 1.231067, 1.609337, 1, 0, 0.1607843, 1,
2.102763, 1.382386, 0.8987173, 1, 0, 0.1568628, 1,
2.103656, -1.728105, 1.473787, 1, 0, 0.1490196, 1,
2.116306, 1.202559, -0.1566442, 1, 0, 0.145098, 1,
2.138032, 0.01112217, 0.8204904, 1, 0, 0.1372549, 1,
2.156187, -0.9058607, 2.303812, 1, 0, 0.1333333, 1,
2.17335, 1.618197, 0.4854536, 1, 0, 0.1254902, 1,
2.198949, 0.3236753, 1.008832, 1, 0, 0.1215686, 1,
2.203252, 0.5495397, 3.100581, 1, 0, 0.1137255, 1,
2.212615, -1.96902, 3.774692, 1, 0, 0.1098039, 1,
2.224476, -0.8090996, 1.082628, 1, 0, 0.1019608, 1,
2.255233, -0.5672253, 2.605079, 1, 0, 0.09411765, 1,
2.266458, 0.9128215, 2.45636, 1, 0, 0.09019608, 1,
2.295171, 0.269099, 1.933901, 1, 0, 0.08235294, 1,
2.305569, -0.4979017, 2.410372, 1, 0, 0.07843138, 1,
2.306821, -0.04011445, 1.860415, 1, 0, 0.07058824, 1,
2.328502, -0.9351261, 2.425927, 1, 0, 0.06666667, 1,
2.437102, -0.7354349, 0.09032254, 1, 0, 0.05882353, 1,
2.517069, 0.1838649, -0.00567243, 1, 0, 0.05490196, 1,
2.520778, 0.1424149, 0.7097522, 1, 0, 0.04705882, 1,
2.549419, 1.511377, 2.036119, 1, 0, 0.04313726, 1,
2.564511, 0.4882571, 1.365067, 1, 0, 0.03529412, 1,
2.60108, -1.088786, 0.2815389, 1, 0, 0.03137255, 1,
2.691812, 1.832774, 0.7381509, 1, 0, 0.02352941, 1,
2.874315, 0.2656724, 3.808959, 1, 0, 0.01960784, 1,
2.90984, 0.06255134, 3.193185, 1, 0, 0.01176471, 1,
2.950604, -0.6727535, 2.100784, 1, 0, 0.007843138, 1
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
0.02084315, -4.258341, -7.724549, 0, -0.5, 0.5, 0.5,
0.02084315, -4.258341, -7.724549, 1, -0.5, 0.5, 0.5,
0.02084315, -4.258341, -7.724549, 1, 1.5, 0.5, 0.5,
0.02084315, -4.258341, -7.724549, 0, 1.5, 0.5, 0.5
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
-3.902107, 0.03355849, -7.724549, 0, -0.5, 0.5, 0.5,
-3.902107, 0.03355849, -7.724549, 1, -0.5, 0.5, 0.5,
-3.902107, 0.03355849, -7.724549, 1, 1.5, 0.5, 0.5,
-3.902107, 0.03355849, -7.724549, 0, 1.5, 0.5, 0.5
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
-3.902107, -4.258341, -0.4732907, 0, -0.5, 0.5, 0.5,
-3.902107, -4.258341, -0.4732907, 1, -0.5, 0.5, 0.5,
-3.902107, -4.258341, -0.4732907, 1, 1.5, 0.5, 0.5,
-3.902107, -4.258341, -0.4732907, 0, 1.5, 0.5, 0.5
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
-2, -3.267902, -6.051182,
2, -3.267902, -6.051182,
-2, -3.267902, -6.051182,
-2, -3.432976, -6.330077,
-1, -3.267902, -6.051182,
-1, -3.432976, -6.330077,
0, -3.267902, -6.051182,
0, -3.432976, -6.330077,
1, -3.267902, -6.051182,
1, -3.432976, -6.330077,
2, -3.267902, -6.051182,
2, -3.432976, -6.330077
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
-2, -3.763122, -6.887866, 0, -0.5, 0.5, 0.5,
-2, -3.763122, -6.887866, 1, -0.5, 0.5, 0.5,
-2, -3.763122, -6.887866, 1, 1.5, 0.5, 0.5,
-2, -3.763122, -6.887866, 0, 1.5, 0.5, 0.5,
-1, -3.763122, -6.887866, 0, -0.5, 0.5, 0.5,
-1, -3.763122, -6.887866, 1, -0.5, 0.5, 0.5,
-1, -3.763122, -6.887866, 1, 1.5, 0.5, 0.5,
-1, -3.763122, -6.887866, 0, 1.5, 0.5, 0.5,
0, -3.763122, -6.887866, 0, -0.5, 0.5, 0.5,
0, -3.763122, -6.887866, 1, -0.5, 0.5, 0.5,
0, -3.763122, -6.887866, 1, 1.5, 0.5, 0.5,
0, -3.763122, -6.887866, 0, 1.5, 0.5, 0.5,
1, -3.763122, -6.887866, 0, -0.5, 0.5, 0.5,
1, -3.763122, -6.887866, 1, -0.5, 0.5, 0.5,
1, -3.763122, -6.887866, 1, 1.5, 0.5, 0.5,
1, -3.763122, -6.887866, 0, 1.5, 0.5, 0.5,
2, -3.763122, -6.887866, 0, -0.5, 0.5, 0.5,
2, -3.763122, -6.887866, 1, -0.5, 0.5, 0.5,
2, -3.763122, -6.887866, 1, 1.5, 0.5, 0.5,
2, -3.763122, -6.887866, 0, 1.5, 0.5, 0.5
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
-2.996811, -3, -6.051182,
-2.996811, 3, -6.051182,
-2.996811, -3, -6.051182,
-3.147693, -3, -6.330077,
-2.996811, -2, -6.051182,
-3.147693, -2, -6.330077,
-2.996811, -1, -6.051182,
-3.147693, -1, -6.330077,
-2.996811, 0, -6.051182,
-3.147693, 0, -6.330077,
-2.996811, 1, -6.051182,
-3.147693, 1, -6.330077,
-2.996811, 2, -6.051182,
-3.147693, 2, -6.330077,
-2.996811, 3, -6.051182,
-3.147693, 3, -6.330077
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
-3.449459, -3, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, -3, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, -3, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, -3, -6.887866, 0, 1.5, 0.5, 0.5,
-3.449459, -2, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, -2, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, -2, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, -2, -6.887866, 0, 1.5, 0.5, 0.5,
-3.449459, -1, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, -1, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, -1, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, -1, -6.887866, 0, 1.5, 0.5, 0.5,
-3.449459, 0, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, 0, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, 0, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, 0, -6.887866, 0, 1.5, 0.5, 0.5,
-3.449459, 1, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, 1, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, 1, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, 1, -6.887866, 0, 1.5, 0.5, 0.5,
-3.449459, 2, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, 2, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, 2, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, 2, -6.887866, 0, 1.5, 0.5, 0.5,
-3.449459, 3, -6.887866, 0, -0.5, 0.5, 0.5,
-3.449459, 3, -6.887866, 1, -0.5, 0.5, 0.5,
-3.449459, 3, -6.887866, 1, 1.5, 0.5, 0.5,
-3.449459, 3, -6.887866, 0, 1.5, 0.5, 0.5
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
-2.996811, -3.267902, -4,
-2.996811, -3.267902, 4,
-2.996811, -3.267902, -4,
-3.147693, -3.432976, -4,
-2.996811, -3.267902, -2,
-3.147693, -3.432976, -2,
-2.996811, -3.267902, 0,
-3.147693, -3.432976, 0,
-2.996811, -3.267902, 2,
-3.147693, -3.432976, 2,
-2.996811, -3.267902, 4,
-3.147693, -3.432976, 4
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
-3.449459, -3.763122, -4, 0, -0.5, 0.5, 0.5,
-3.449459, -3.763122, -4, 1, -0.5, 0.5, 0.5,
-3.449459, -3.763122, -4, 1, 1.5, 0.5, 0.5,
-3.449459, -3.763122, -4, 0, 1.5, 0.5, 0.5,
-3.449459, -3.763122, -2, 0, -0.5, 0.5, 0.5,
-3.449459, -3.763122, -2, 1, -0.5, 0.5, 0.5,
-3.449459, -3.763122, -2, 1, 1.5, 0.5, 0.5,
-3.449459, -3.763122, -2, 0, 1.5, 0.5, 0.5,
-3.449459, -3.763122, 0, 0, -0.5, 0.5, 0.5,
-3.449459, -3.763122, 0, 1, -0.5, 0.5, 0.5,
-3.449459, -3.763122, 0, 1, 1.5, 0.5, 0.5,
-3.449459, -3.763122, 0, 0, 1.5, 0.5, 0.5,
-3.449459, -3.763122, 2, 0, -0.5, 0.5, 0.5,
-3.449459, -3.763122, 2, 1, -0.5, 0.5, 0.5,
-3.449459, -3.763122, 2, 1, 1.5, 0.5, 0.5,
-3.449459, -3.763122, 2, 0, 1.5, 0.5, 0.5,
-3.449459, -3.763122, 4, 0, -0.5, 0.5, 0.5,
-3.449459, -3.763122, 4, 1, -0.5, 0.5, 0.5,
-3.449459, -3.763122, 4, 1, 1.5, 0.5, 0.5,
-3.449459, -3.763122, 4, 0, 1.5, 0.5, 0.5
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
-2.996811, -3.267902, -6.051182,
-2.996811, 3.335019, -6.051182,
-2.996811, -3.267902, 5.1046,
-2.996811, 3.335019, 5.1046,
-2.996811, -3.267902, -6.051182,
-2.996811, -3.267902, 5.1046,
-2.996811, 3.335019, -6.051182,
-2.996811, 3.335019, 5.1046,
-2.996811, -3.267902, -6.051182,
3.038497, -3.267902, -6.051182,
-2.996811, -3.267902, 5.1046,
3.038497, -3.267902, 5.1046,
-2.996811, 3.335019, -6.051182,
3.038497, 3.335019, -6.051182,
-2.996811, 3.335019, 5.1046,
3.038497, 3.335019, 5.1046,
3.038497, -3.267902, -6.051182,
3.038497, 3.335019, -6.051182,
3.038497, -3.267902, 5.1046,
3.038497, 3.335019, 5.1046,
3.038497, -3.267902, -6.051182,
3.038497, -3.267902, 5.1046,
3.038497, 3.335019, -6.051182,
3.038497, 3.335019, 5.1046
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
var radius = 7.635642;
var distance = 33.97184;
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
mvMatrix.translate( -0.02084315, -0.03355849, 0.4732907 );
mvMatrix.scale( 1.367918, 1.250326, 0.7400472 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.97184);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fenfuram<-read.table("fenfuram.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenfuram$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
```

```r
y<-fenfuram$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
```

```r
z<-fenfuram$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
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
-2.908918, -0.4978661, -1.079047, 0, 0, 1, 1, 1,
-2.749318, -0.07779598, -2.15513, 1, 0, 0, 1, 1,
-2.662574, 1.144861, -0.5370486, 1, 0, 0, 1, 1,
-2.600457, 2.042331, -1.352451, 1, 0, 0, 1, 1,
-2.589108, -1.825646, -2.083543, 1, 0, 0, 1, 1,
-2.587402, 0.1163179, -1.151909, 1, 0, 0, 1, 1,
-2.514984, -0.4364785, -1.587806, 0, 0, 0, 1, 1,
-2.43842, -0.9621701, -2.78382, 0, 0, 0, 1, 1,
-2.381577, 1.271808, -1.768086, 0, 0, 0, 1, 1,
-2.350531, -0.3607953, -0.9112051, 0, 0, 0, 1, 1,
-2.335158, -0.4587618, -0.518606, 0, 0, 0, 1, 1,
-2.297063, -0.4435551, -1.671396, 0, 0, 0, 1, 1,
-2.272492, 1.015106, -2.099866, 0, 0, 0, 1, 1,
-2.219989, 1.349913, 0.07581314, 1, 1, 1, 1, 1,
-2.128434, -1.654911, -1.523052, 1, 1, 1, 1, 1,
-2.078674, 0.01806553, -0.2386804, 1, 1, 1, 1, 1,
-2.072423, -0.2759442, -1.761907, 1, 1, 1, 1, 1,
-2.048161, 0.2210222, -0.3960676, 1, 1, 1, 1, 1,
-2.039021, 0.4067201, 0.1261808, 1, 1, 1, 1, 1,
-2.032781, -0.4482572, -1.090203, 1, 1, 1, 1, 1,
-2.003867, 0.2238978, -2.36811, 1, 1, 1, 1, 1,
-1.996407, -0.466628, -2.298202, 1, 1, 1, 1, 1,
-1.982263, -0.2254315, -0.9779212, 1, 1, 1, 1, 1,
-1.954531, -1.209031, -3.799553, 1, 1, 1, 1, 1,
-1.93234, 0.04218702, -1.514446, 1, 1, 1, 1, 1,
-1.890553, 0.922033, -0.4093258, 1, 1, 1, 1, 1,
-1.884969, -2.371635, -3.273505, 1, 1, 1, 1, 1,
-1.870379, 1.726658, -1.388649, 1, 1, 1, 1, 1,
-1.863855, 2.279555, -0.3304812, 0, 0, 1, 1, 1,
-1.849594, 0.1174265, -2.0693, 1, 0, 0, 1, 1,
-1.843212, 1.079383, -1.746777, 1, 0, 0, 1, 1,
-1.788306, 0.3514366, -2.381822, 1, 0, 0, 1, 1,
-1.786996, 1.506368, 0.1604297, 1, 0, 0, 1, 1,
-1.785404, 0.09192307, -3.273315, 1, 0, 0, 1, 1,
-1.785254, -1.832618, -3.837822, 0, 0, 0, 1, 1,
-1.765951, -0.4316919, -2.214019, 0, 0, 0, 1, 1,
-1.74302, -1.349206, -2.832113, 0, 0, 0, 1, 1,
-1.742012, -0.6234593, -0.7963986, 0, 0, 0, 1, 1,
-1.737339, -0.7688487, -2.271337, 0, 0, 0, 1, 1,
-1.711533, -1.242635, -1.735745, 0, 0, 0, 1, 1,
-1.707446, 1.52344, -2.627798, 0, 0, 0, 1, 1,
-1.706675, 0.4837639, -0.3812836, 1, 1, 1, 1, 1,
-1.704617, 1.463409, 1.960051, 1, 1, 1, 1, 1,
-1.690722, 0.45748, -0.05951781, 1, 1, 1, 1, 1,
-1.674278, -2.318565, -2.098372, 1, 1, 1, 1, 1,
-1.670333, -1.188989, -2.421681, 1, 1, 1, 1, 1,
-1.668161, -0.03456938, -3.336006, 1, 1, 1, 1, 1,
-1.665001, -1.445892, -2.095795, 1, 1, 1, 1, 1,
-1.637645, -0.1204141, -0.74527, 1, 1, 1, 1, 1,
-1.630251, -0.9822661, -3.773124, 1, 1, 1, 1, 1,
-1.619513, 1.190833, -0.8952523, 1, 1, 1, 1, 1,
-1.619293, 0.8477542, -1.384743, 1, 1, 1, 1, 1,
-1.610717, 0.06975454, -1.666946, 1, 1, 1, 1, 1,
-1.593836, -1.120786, -2.808613, 1, 1, 1, 1, 1,
-1.591973, -0.7234138, -2.109346, 1, 1, 1, 1, 1,
-1.582132, -1.065614, -1.868065, 1, 1, 1, 1, 1,
-1.572032, -0.2928009, -1.858614, 0, 0, 1, 1, 1,
-1.563915, -1.43013, -2.680734, 1, 0, 0, 1, 1,
-1.562644, 0.3052264, 0.2049108, 1, 0, 0, 1, 1,
-1.560864, -0.08636482, -2.981211, 1, 0, 0, 1, 1,
-1.557407, -0.4797802, -1.089401, 1, 0, 0, 1, 1,
-1.556686, -0.1041226, -3.137257, 1, 0, 0, 1, 1,
-1.53738, 0.1214359, -0.2490875, 0, 0, 0, 1, 1,
-1.528408, -1.815879, -2.542074, 0, 0, 0, 1, 1,
-1.515679, -0.2453602, -1.214107, 0, 0, 0, 1, 1,
-1.514027, 0.7903125, -2.31516, 0, 0, 0, 1, 1,
-1.511634, -0.9944825, -2.658248, 0, 0, 0, 1, 1,
-1.496479, 0.5019416, -1.424988, 0, 0, 0, 1, 1,
-1.49381, 0.6588025, -1.508618, 0, 0, 0, 1, 1,
-1.488075, 0.3231055, -1.221774, 1, 1, 1, 1, 1,
-1.479939, 0.599232, -3.341724, 1, 1, 1, 1, 1,
-1.476274, -0.4073234, -2.576999, 1, 1, 1, 1, 1,
-1.475464, 0.3093282, -1.270254, 1, 1, 1, 1, 1,
-1.473487, -0.8186148, -3.002523, 1, 1, 1, 1, 1,
-1.472366, 0.7051414, -1.460113, 1, 1, 1, 1, 1,
-1.467703, 0.3052573, -2.543108, 1, 1, 1, 1, 1,
-1.459418, -0.1115379, -2.032593, 1, 1, 1, 1, 1,
-1.457921, 1.454874, -2.258878, 1, 1, 1, 1, 1,
-1.448601, 0.1433416, -2.026654, 1, 1, 1, 1, 1,
-1.447055, 0.6157537, -1.642811, 1, 1, 1, 1, 1,
-1.443532, 0.09052021, -3.668338, 1, 1, 1, 1, 1,
-1.434526, -0.4438041, -0.9940557, 1, 1, 1, 1, 1,
-1.412192, 0.9490851, -0.5053174, 1, 1, 1, 1, 1,
-1.405563, -2.361061, -4.755552, 1, 1, 1, 1, 1,
-1.39698, 0.6570588, -0.6667601, 0, 0, 1, 1, 1,
-1.395622, 0.1505684, -1.840467, 1, 0, 0, 1, 1,
-1.393046, 0.9771039, -0.2461202, 1, 0, 0, 1, 1,
-1.392097, 1.086733, -1.467968, 1, 0, 0, 1, 1,
-1.39164, 0.119944, -0.8427227, 1, 0, 0, 1, 1,
-1.391306, -0.7947742, 0.02264111, 1, 0, 0, 1, 1,
-1.377393, 0.8825571, -0.1191213, 0, 0, 0, 1, 1,
-1.374491, 1.033101, 0.9177418, 0, 0, 0, 1, 1,
-1.373813, 1.978457, -2.192591, 0, 0, 0, 1, 1,
-1.368945, -0.7300407, -0.1756842, 0, 0, 0, 1, 1,
-1.357331, 0.1194906, -1.160154, 0, 0, 0, 1, 1,
-1.350852, -1.80994, -3.328077, 0, 0, 0, 1, 1,
-1.34267, 0.2523021, -1.556406, 0, 0, 0, 1, 1,
-1.342565, -1.010517, -1.834222, 1, 1, 1, 1, 1,
-1.340529, -0.5835515, -1.124912, 1, 1, 1, 1, 1,
-1.338307, 1.780428, -1.364639, 1, 1, 1, 1, 1,
-1.333146, 0.6806276, -2.501152, 1, 1, 1, 1, 1,
-1.329072, -0.8479104, -1.203899, 1, 1, 1, 1, 1,
-1.326369, 0.248759, -2.408503, 1, 1, 1, 1, 1,
-1.325032, 1.714248, 0.2427061, 1, 1, 1, 1, 1,
-1.32251, 1.452762, -1.962701, 1, 1, 1, 1, 1,
-1.321654, -1.658628, -1.309757, 1, 1, 1, 1, 1,
-1.316315, 0.1167832, -2.568475, 1, 1, 1, 1, 1,
-1.310335, -0.9595841, -0.845805, 1, 1, 1, 1, 1,
-1.290366, 0.6191545, -2.104426, 1, 1, 1, 1, 1,
-1.278075, -1.946383, -2.683775, 1, 1, 1, 1, 1,
-1.270714, -0.508999, -1.432446, 1, 1, 1, 1, 1,
-1.268883, -1.188484, -2.592126, 1, 1, 1, 1, 1,
-1.268664, -0.4954865, -2.345382, 0, 0, 1, 1, 1,
-1.264907, -0.6347075, -0.9947605, 1, 0, 0, 1, 1,
-1.259555, -0.4447686, -2.62493, 1, 0, 0, 1, 1,
-1.25926, -2.06448, -2.28986, 1, 0, 0, 1, 1,
-1.255209, 0.9468026, 0.7582544, 1, 0, 0, 1, 1,
-1.243742, -0.3056152, -1.367863, 1, 0, 0, 1, 1,
-1.240787, -1.159113, -2.627177, 0, 0, 0, 1, 1,
-1.240616, -0.3716359, -0.9329379, 0, 0, 0, 1, 1,
-1.235098, -0.5488874, -2.993796, 0, 0, 0, 1, 1,
-1.225687, 1.366591, -1.014954, 0, 0, 0, 1, 1,
-1.222228, -0.5618125, -2.435582, 0, 0, 0, 1, 1,
-1.205102, 0.6388904, -1.654979, 0, 0, 0, 1, 1,
-1.185403, -0.8748314, -2.534482, 0, 0, 0, 1, 1,
-1.183327, -0.7581459, -1.803185, 1, 1, 1, 1, 1,
-1.182006, 0.09227703, -1.788702, 1, 1, 1, 1, 1,
-1.180244, -0.9556296, -4.038908, 1, 1, 1, 1, 1,
-1.176742, 0.3604937, 0.1254353, 1, 1, 1, 1, 1,
-1.172627, 1.2444, 0.3782765, 1, 1, 1, 1, 1,
-1.164715, -1.843027, -3.36544, 1, 1, 1, 1, 1,
-1.164434, 0.003624813, -1.72895, 1, 1, 1, 1, 1,
-1.160607, -0.2560397, -1.958306, 1, 1, 1, 1, 1,
-1.155965, -0.9967752, -3.946497, 1, 1, 1, 1, 1,
-1.15238, -0.9034636, -1.551521, 1, 1, 1, 1, 1,
-1.150817, -0.00240353, -1.409841, 1, 1, 1, 1, 1,
-1.150507, -0.3764984, -1.512365, 1, 1, 1, 1, 1,
-1.149192, -1.827938, -2.10173, 1, 1, 1, 1, 1,
-1.144791, 0.6039517, 0.02659005, 1, 1, 1, 1, 1,
-1.122227, -1.262789, -2.455986, 1, 1, 1, 1, 1,
-1.111359, -0.8423578, -2.357322, 0, 0, 1, 1, 1,
-1.109938, 0.04208259, -2.993298, 1, 0, 0, 1, 1,
-1.106555, -0.7378898, -1.998561, 1, 0, 0, 1, 1,
-1.102177, 0.7972642, -0.9821522, 1, 0, 0, 1, 1,
-1.096575, 0.3548648, 0.09685081, 1, 0, 0, 1, 1,
-1.092401, 0.8498871, -0.2971281, 1, 0, 0, 1, 1,
-1.091978, -0.2709162, -0.7942172, 0, 0, 0, 1, 1,
-1.085906, -0.5254444, -2.333717, 0, 0, 0, 1, 1,
-1.085448, -0.3806869, -1.928446, 0, 0, 0, 1, 1,
-1.077885, 1.387186, 0.2425602, 0, 0, 0, 1, 1,
-1.061046, 1.279856, -0.9736089, 0, 0, 0, 1, 1,
-1.059296, -1.034629, -2.731124, 0, 0, 0, 1, 1,
-1.053388, 0.4086164, -3.241231, 0, 0, 0, 1, 1,
-1.045118, -0.3591703, -1.538537, 1, 1, 1, 1, 1,
-1.042007, 0.6070512, -0.9481351, 1, 1, 1, 1, 1,
-1.036669, 0.2948958, -1.300748, 1, 1, 1, 1, 1,
-1.033837, -1.753554, -1.759507, 1, 1, 1, 1, 1,
-1.031908, -0.51948, -1.164994, 1, 1, 1, 1, 1,
-1.031177, 0.8620428, -1.018399, 1, 1, 1, 1, 1,
-1.02969, -0.6865208, -3.413755, 1, 1, 1, 1, 1,
-1.028894, 1.15134, -0.9842675, 1, 1, 1, 1, 1,
-1.021112, -0.04730082, -1.598688, 1, 1, 1, 1, 1,
-1.014554, 1.966249, -0.6664771, 1, 1, 1, 1, 1,
-1.010929, -0.5331033, -2.590318, 1, 1, 1, 1, 1,
-1.009222, -2.839205, -0.5926268, 1, 1, 1, 1, 1,
-1.001432, 0.9570562, -2.251936, 1, 1, 1, 1, 1,
-0.9955665, -1.209225, -3.758671, 1, 1, 1, 1, 1,
-0.9938495, 1.313015, -0.401354, 1, 1, 1, 1, 1,
-0.9935553, 1.370749, 0.1564918, 0, 0, 1, 1, 1,
-0.9895893, -0.8711963, -3.278562, 1, 0, 0, 1, 1,
-0.9829004, -1.482007, -2.285051, 1, 0, 0, 1, 1,
-0.9754267, 0.05832724, -2.864951, 1, 0, 0, 1, 1,
-0.972029, -1.078403, -1.44117, 1, 0, 0, 1, 1,
-0.9645759, 0.2572546, -1.976872, 1, 0, 0, 1, 1,
-0.9628068, -0.3252336, -1.137919, 0, 0, 0, 1, 1,
-0.9612561, 0.76395, -0.1775729, 0, 0, 0, 1, 1,
-0.9589708, 1.583171, -0.5291178, 0, 0, 0, 1, 1,
-0.9588271, 1.080869, -1.705786, 0, 0, 0, 1, 1,
-0.9444489, -0.8525848, -3.602562, 0, 0, 0, 1, 1,
-0.9283618, 0.5035954, -1.931674, 0, 0, 0, 1, 1,
-0.9206566, -0.5897464, -0.02679712, 0, 0, 0, 1, 1,
-0.9198418, 0.8601644, -1.380891, 1, 1, 1, 1, 1,
-0.9182527, -1.31329, -2.262377, 1, 1, 1, 1, 1,
-0.9176565, 1.389041, -1.653782, 1, 1, 1, 1, 1,
-0.9155431, 0.1717991, -1.994963, 1, 1, 1, 1, 1,
-0.9128671, 0.5325425, -2.101096, 1, 1, 1, 1, 1,
-0.9122886, 1.216938, 0.4528819, 1, 1, 1, 1, 1,
-0.9069591, 0.01207106, -1.868886, 1, 1, 1, 1, 1,
-0.9067555, 1.450032, -2.745618, 1, 1, 1, 1, 1,
-0.906475, -0.4325566, -3.42322, 1, 1, 1, 1, 1,
-0.9058165, 0.4400206, -1.314776, 1, 1, 1, 1, 1,
-0.9006948, -2.343266, -2.068314, 1, 1, 1, 1, 1,
-0.8979711, 2.181658, -1.487629, 1, 1, 1, 1, 1,
-0.8977062, -1.004516, -3.140913, 1, 1, 1, 1, 1,
-0.8916872, 1.508262, -0.4465163, 1, 1, 1, 1, 1,
-0.8896236, -0.3792537, -1.998206, 1, 1, 1, 1, 1,
-0.8887813, -1.232032, -4.390422, 0, 0, 1, 1, 1,
-0.8877556, -1.463511, -3.420052, 1, 0, 0, 1, 1,
-0.8808752, 2.026441, 0.183551, 1, 0, 0, 1, 1,
-0.8742016, -1.57742, -1.577573, 1, 0, 0, 1, 1,
-0.8738841, -0.6002572, -1.029594, 1, 0, 0, 1, 1,
-0.8734103, 1.6069, -2.082342, 1, 0, 0, 1, 1,
-0.8699093, 0.2183089, -1.839394, 0, 0, 0, 1, 1,
-0.8648916, -0.0398647, -2.907127, 0, 0, 0, 1, 1,
-0.8629094, 2.802271, -0.3475191, 0, 0, 0, 1, 1,
-0.8573552, 0.1726357, -2.234915, 0, 0, 0, 1, 1,
-0.8542256, -0.2836367, -1.917297, 0, 0, 0, 1, 1,
-0.8537477, -0.7114297, -4.424038, 0, 0, 0, 1, 1,
-0.8505172, 0.4587694, -0.5200933, 0, 0, 0, 1, 1,
-0.8484033, 1.044401, -0.3126849, 1, 1, 1, 1, 1,
-0.8450872, 1.519251, 0.3022819, 1, 1, 1, 1, 1,
-0.8447895, -0.2350918, -1.080836, 1, 1, 1, 1, 1,
-0.843759, -0.5769176, -2.39222, 1, 1, 1, 1, 1,
-0.8420905, -1.068171, -3.057321, 1, 1, 1, 1, 1,
-0.8383743, -0.2349568, -1.947971, 1, 1, 1, 1, 1,
-0.8328825, -1.363608, -1.310893, 1, 1, 1, 1, 1,
-0.816277, -0.017359, -4.171373, 1, 1, 1, 1, 1,
-0.8071113, 0.1892388, -1.195438, 1, 1, 1, 1, 1,
-0.7921175, -1.163297, -2.916087, 1, 1, 1, 1, 1,
-0.788209, -1.259511, -2.065712, 1, 1, 1, 1, 1,
-0.7851234, 1.130293, -0.1962928, 1, 1, 1, 1, 1,
-0.7841619, -1.9518, -3.779857, 1, 1, 1, 1, 1,
-0.781311, 0.4751016, -1.328851, 1, 1, 1, 1, 1,
-0.7789598, -0.339759, -0.4496095, 1, 1, 1, 1, 1,
-0.7768221, 0.5952395, 0.1238998, 0, 0, 1, 1, 1,
-0.7753592, 0.9869998, 0.09107033, 1, 0, 0, 1, 1,
-0.7734491, -0.1677502, -0.3631703, 1, 0, 0, 1, 1,
-0.7732933, -0.1148207, -0.8287926, 1, 0, 0, 1, 1,
-0.7677036, -0.4997558, -2.90055, 1, 0, 0, 1, 1,
-0.7654352, -1.286039, -2.253181, 1, 0, 0, 1, 1,
-0.7630033, -0.4928972, -1.973099, 0, 0, 0, 1, 1,
-0.7611184, -0.08404125, -2.50926, 0, 0, 0, 1, 1,
-0.7598277, 0.3288798, -3.314569, 0, 0, 0, 1, 1,
-0.759826, -0.369791, -2.802592, 0, 0, 0, 1, 1,
-0.7587156, -0.04875484, -1.02955, 0, 0, 0, 1, 1,
-0.7577477, -1.033188, -2.544323, 0, 0, 0, 1, 1,
-0.7532352, 0.5343944, -1.066106, 0, 0, 0, 1, 1,
-0.7503853, 1.871489, -0.3186114, 1, 1, 1, 1, 1,
-0.7457959, -0.08833952, -2.165814, 1, 1, 1, 1, 1,
-0.7394453, 1.831994, -1.083986, 1, 1, 1, 1, 1,
-0.7323207, 1.415964, -1.886364, 1, 1, 1, 1, 1,
-0.7317051, -0.1498154, -1.383233, 1, 1, 1, 1, 1,
-0.7276506, -1.000759, -1.710341, 1, 1, 1, 1, 1,
-0.7208272, -0.4210753, -3.311093, 1, 1, 1, 1, 1,
-0.719099, -0.5851839, -3.226358, 1, 1, 1, 1, 1,
-0.7161827, -0.3296942, -0.9975978, 1, 1, 1, 1, 1,
-0.715878, -1.060837, -2.284442, 1, 1, 1, 1, 1,
-0.7125311, -0.1450667, -2.180119, 1, 1, 1, 1, 1,
-0.7082428, 0.1938774, -0.5856763, 1, 1, 1, 1, 1,
-0.7052825, 0.7309129, -0.3637392, 1, 1, 1, 1, 1,
-0.701946, 0.06087562, -1.988066, 1, 1, 1, 1, 1,
-0.7009892, -0.00979315, -1.400275, 1, 1, 1, 1, 1,
-0.6986077, -0.0396127, -1.90879, 0, 0, 1, 1, 1,
-0.6982664, -0.8809152, -2.160143, 1, 0, 0, 1, 1,
-0.6962167, 0.2487306, -0.5719832, 1, 0, 0, 1, 1,
-0.6934643, 1.004979, -1.273932, 1, 0, 0, 1, 1,
-0.6863389, -1.293097, -0.9455116, 1, 0, 0, 1, 1,
-0.683468, 0.6738107, -2.926033, 1, 0, 0, 1, 1,
-0.6805428, 1.008633, -0.9698979, 0, 0, 0, 1, 1,
-0.6797131, 1.97005, -0.8525749, 0, 0, 0, 1, 1,
-0.6788459, -0.7649025, -2.560355, 0, 0, 0, 1, 1,
-0.6761954, 0.4962512, -0.09880552, 0, 0, 0, 1, 1,
-0.6761379, 0.2180566, -1.801295, 0, 0, 0, 1, 1,
-0.6717793, 0.1153994, -0.9400088, 0, 0, 0, 1, 1,
-0.666762, -0.5355512, 0.2747551, 0, 0, 0, 1, 1,
-0.666256, 1.136039, -0.3395855, 1, 1, 1, 1, 1,
-0.6571061, 0.1702347, -1.16187, 1, 1, 1, 1, 1,
-0.6505072, 0.1500594, -1.001596, 1, 1, 1, 1, 1,
-0.6492645, -1.496265, -2.899186, 1, 1, 1, 1, 1,
-0.648859, 0.657771, 0.94379, 1, 1, 1, 1, 1,
-0.6473663, 0.3554911, -2.618858, 1, 1, 1, 1, 1,
-0.6438522, 0.4386768, -0.7973765, 1, 1, 1, 1, 1,
-0.6435984, 0.3618801, -0.5514972, 1, 1, 1, 1, 1,
-0.6419926, 1.128751, -0.574163, 1, 1, 1, 1, 1,
-0.6385008, 0.7727117, -1.283437, 1, 1, 1, 1, 1,
-0.6381038, -1.736222, -3.545441, 1, 1, 1, 1, 1,
-0.6319444, 1.411351, -1.048502, 1, 1, 1, 1, 1,
-0.6318461, 1.463798, 2.094469, 1, 1, 1, 1, 1,
-0.6233508, 0.2174773, -1.063568, 1, 1, 1, 1, 1,
-0.6224523, -0.5386341, -2.890482, 1, 1, 1, 1, 1,
-0.6221878, 0.609479, -1.417252, 0, 0, 1, 1, 1,
-0.6215942, 0.6248423, -1.293436, 1, 0, 0, 1, 1,
-0.6122081, 0.02425846, -1.634844, 1, 0, 0, 1, 1,
-0.6098198, -1.086961, -3.553251, 1, 0, 0, 1, 1,
-0.609798, 1.245644, 1.218048, 1, 0, 0, 1, 1,
-0.6079201, -2.114475, -0.4477385, 1, 0, 0, 1, 1,
-0.6076821, 0.2569076, -1.421532, 0, 0, 0, 1, 1,
-0.6017109, -1.391137, -2.378263, 0, 0, 0, 1, 1,
-0.5979009, 0.445497, -0.5636454, 0, 0, 0, 1, 1,
-0.5950269, 0.08454698, -1.503662, 0, 0, 0, 1, 1,
-0.5930616, -2.534248, -2.027949, 0, 0, 0, 1, 1,
-0.5927507, 0.2590282, 0.1908045, 0, 0, 0, 1, 1,
-0.5902508, 0.01235055, -1.426242, 0, 0, 0, 1, 1,
-0.5900628, 0.7545653, -0.943207, 1, 1, 1, 1, 1,
-0.5893565, 1.267092, -0.3770283, 1, 1, 1, 1, 1,
-0.589258, 0.03948434, -1.23723, 1, 1, 1, 1, 1,
-0.5861903, 0.9968876, -1.392169, 1, 1, 1, 1, 1,
-0.5858847, 1.151317, -1.922366, 1, 1, 1, 1, 1,
-0.5797207, -1.38642, -2.656989, 1, 1, 1, 1, 1,
-0.5786689, -1.865378, -1.976675, 1, 1, 1, 1, 1,
-0.5723464, 1.678513, 2.216986, 1, 1, 1, 1, 1,
-0.5703724, 0.4562545, -2.620844, 1, 1, 1, 1, 1,
-0.5664915, -0.484929, -4.248072, 1, 1, 1, 1, 1,
-0.5652067, 0.192431, -0.77806, 1, 1, 1, 1, 1,
-0.5620509, -1.376894, -3.449567, 1, 1, 1, 1, 1,
-0.5608506, 1.174327, -1.129665, 1, 1, 1, 1, 1,
-0.5571664, -1.659622, -3.29304, 1, 1, 1, 1, 1,
-0.5538413, 0.5164243, -1.285698, 1, 1, 1, 1, 1,
-0.5517641, 0.8847538, -0.6501866, 0, 0, 1, 1, 1,
-0.5509207, -1.368073, -2.956471, 1, 0, 0, 1, 1,
-0.5449088, 0.4631191, 0.1111789, 1, 0, 0, 1, 1,
-0.5446215, -0.9666112, -1.031583, 1, 0, 0, 1, 1,
-0.5370386, -0.40005, -1.129465, 1, 0, 0, 1, 1,
-0.5370347, 1.917032, -0.4714968, 1, 0, 0, 1, 1,
-0.5364972, 0.1225683, -1.209458, 0, 0, 0, 1, 1,
-0.5351425, 0.6293151, -0.01149622, 0, 0, 0, 1, 1,
-0.5332639, 0.5855534, 1.596038, 0, 0, 0, 1, 1,
-0.5272264, -1.435704, -2.257196, 0, 0, 0, 1, 1,
-0.5253419, -2.266143, -4.694187, 0, 0, 0, 1, 1,
-0.5175598, -0.4268086, -4.014161, 0, 0, 0, 1, 1,
-0.5163611, 0.3341679, -1.553702, 0, 0, 0, 1, 1,
-0.5134163, -0.2104755, -0.3004873, 1, 1, 1, 1, 1,
-0.5112221, 1.147236, -2.038695, 1, 1, 1, 1, 1,
-0.4952691, -1.040332, -3.099937, 1, 1, 1, 1, 1,
-0.490125, -0.1715105, -2.465025, 1, 1, 1, 1, 1,
-0.4860242, -1.639652, -3.372548, 1, 1, 1, 1, 1,
-0.4846917, 1.613804, -0.4869357, 1, 1, 1, 1, 1,
-0.4786165, 0.4966037, -2.294293, 1, 1, 1, 1, 1,
-0.477748, -0.2199182, -1.875341, 1, 1, 1, 1, 1,
-0.4775548, 0.2913865, 0.3221887, 1, 1, 1, 1, 1,
-0.4756091, -0.8323061, -2.705135, 1, 1, 1, 1, 1,
-0.4738039, 1.535821, 0.1974451, 1, 1, 1, 1, 1,
-0.4730139, 0.4135281, -1.99567, 1, 1, 1, 1, 1,
-0.4698231, 1.840574, -0.6137778, 1, 1, 1, 1, 1,
-0.4695319, 0.9400747, -1.909371, 1, 1, 1, 1, 1,
-0.4684926, 0.3749034, -0.7566934, 1, 1, 1, 1, 1,
-0.4644778, 0.4616143, -2.17293, 0, 0, 1, 1, 1,
-0.463966, -0.197411, -1.797341, 1, 0, 0, 1, 1,
-0.4619443, 1.237727, -1.589319, 1, 0, 0, 1, 1,
-0.4613252, 0.3636227, -2.746597, 1, 0, 0, 1, 1,
-0.457375, 0.1484105, 0.1204341, 1, 0, 0, 1, 1,
-0.4559294, 0.3174721, -1.869618, 1, 0, 0, 1, 1,
-0.453043, -1.391507, -2.171264, 0, 0, 0, 1, 1,
-0.4497654, 0.7403151, 0.622434, 0, 0, 0, 1, 1,
-0.4469792, 1.169314, -0.07746057, 0, 0, 0, 1, 1,
-0.4464885, -0.1826469, -1.70462, 0, 0, 0, 1, 1,
-0.4447511, 0.5239805, -1.187191, 0, 0, 0, 1, 1,
-0.4447151, -0.8522791, -2.795878, 0, 0, 0, 1, 1,
-0.4435287, -0.1002218, -1.878146, 0, 0, 0, 1, 1,
-0.4426202, -0.9720887, -3.472034, 1, 1, 1, 1, 1,
-0.4406419, -0.8286473, -1.679281, 1, 1, 1, 1, 1,
-0.4388519, 0.5651672, -0.4429699, 1, 1, 1, 1, 1,
-0.4370745, -0.4803868, -2.359797, 1, 1, 1, 1, 1,
-0.4352115, 0.5265828, -0.01794129, 1, 1, 1, 1, 1,
-0.4332336, -0.979466, -2.155664, 1, 1, 1, 1, 1,
-0.4298939, 1.247236, -1.504697, 1, 1, 1, 1, 1,
-0.4254858, 0.2813673, -1.156668, 1, 1, 1, 1, 1,
-0.4224796, 1.100898, 0.3739673, 1, 1, 1, 1, 1,
-0.419148, 1.525102, -0.2822297, 1, 1, 1, 1, 1,
-0.4136802, -0.2126141, -1.087647, 1, 1, 1, 1, 1,
-0.4136754, 0.3232159, 0.03531604, 1, 1, 1, 1, 1,
-0.4040786, 0.819211, -3.152112, 1, 1, 1, 1, 1,
-0.4034259, -0.8845516, -3.739074, 1, 1, 1, 1, 1,
-0.4022422, 0.6485476, -0.9270889, 1, 1, 1, 1, 1,
-0.3995202, -0.9188875, -2.992631, 0, 0, 1, 1, 1,
-0.3980944, -0.6857089, -3.514248, 1, 0, 0, 1, 1,
-0.3962717, 1.982481, 0.4603098, 1, 0, 0, 1, 1,
-0.3945349, 0.2470578, -2.516561, 1, 0, 0, 1, 1,
-0.3899527, 0.922442, 0.1653767, 1, 0, 0, 1, 1,
-0.3891364, -0.3312401, -1.18365, 1, 0, 0, 1, 1,
-0.3883725, 0.3084223, -0.7072421, 0, 0, 0, 1, 1,
-0.387747, 1.467115, 0.5651639, 0, 0, 0, 1, 1,
-0.3860595, -0.2511725, -1.636491, 0, 0, 0, 1, 1,
-0.3836946, -0.6116217, -1.873952, 0, 0, 0, 1, 1,
-0.3830316, -0.1640016, -1.378231, 0, 0, 0, 1, 1,
-0.3790488, 2.052705, -2.891501, 0, 0, 0, 1, 1,
-0.3764233, 0.2556403, -2.5577, 0, 0, 0, 1, 1,
-0.376069, -1.70899, -2.64416, 1, 1, 1, 1, 1,
-0.3659204, -1.331947, -1.053062, 1, 1, 1, 1, 1,
-0.362466, -0.4295974, -2.789432, 1, 1, 1, 1, 1,
-0.3585342, 1.345163, -1.682398, 1, 1, 1, 1, 1,
-0.3574551, -0.7501755, -0.4609102, 1, 1, 1, 1, 1,
-0.3569197, 0.3188349, -1.510171, 1, 1, 1, 1, 1,
-0.3439899, -1.255422, -1.941218, 1, 1, 1, 1, 1,
-0.341046, -0.9568753, -2.181357, 1, 1, 1, 1, 1,
-0.3409383, 0.5303481, 0.07262779, 1, 1, 1, 1, 1,
-0.3408481, 0.7780874, -2.294659, 1, 1, 1, 1, 1,
-0.3392181, 1.627185, 1.220874, 1, 1, 1, 1, 1,
-0.3389681, 0.5494466, -0.8945688, 1, 1, 1, 1, 1,
-0.3359666, 0.4743074, -0.04158899, 1, 1, 1, 1, 1,
-0.3350634, 0.8350636, 0.4445715, 1, 1, 1, 1, 1,
-0.3311502, -0.193565, -1.53046, 1, 1, 1, 1, 1,
-0.3304796, -0.6304847, -2.169295, 0, 0, 1, 1, 1,
-0.3278108, -1.066677, -3.967157, 1, 0, 0, 1, 1,
-0.3263304, -2.004589, -1.994223, 1, 0, 0, 1, 1,
-0.3201085, -0.740738, -2.39738, 1, 0, 0, 1, 1,
-0.3154711, 1.839138, -0.7153375, 1, 0, 0, 1, 1,
-0.3110546, 0.03960263, -2.30687, 1, 0, 0, 1, 1,
-0.3024392, -1.727761, -4.229712, 0, 0, 0, 1, 1,
-0.2925229, 0.8370638, 1.412631, 0, 0, 0, 1, 1,
-0.2906623, 0.8926926, 1.088035, 0, 0, 0, 1, 1,
-0.2882333, -0.6860775, -2.260771, 0, 0, 0, 1, 1,
-0.2825228, 0.3099816, -1.075322, 0, 0, 0, 1, 1,
-0.2774864, -0.1577988, -2.7165, 0, 0, 0, 1, 1,
-0.2694809, -0.4808232, -2.535121, 0, 0, 0, 1, 1,
-0.2655903, -0.4830788, -3.415742, 1, 1, 1, 1, 1,
-0.2647179, 1.556292, -0.9170425, 1, 1, 1, 1, 1,
-0.2621196, -1.195604, -2.299556, 1, 1, 1, 1, 1,
-0.2593336, -1.529135, -3.654102, 1, 1, 1, 1, 1,
-0.2557529, 0.7051441, -2.493692, 1, 1, 1, 1, 1,
-0.253544, -1.481247, -0.5815505, 1, 1, 1, 1, 1,
-0.2518644, 0.03370766, -2.587854, 1, 1, 1, 1, 1,
-0.2504053, -0.2771048, -2.962985, 1, 1, 1, 1, 1,
-0.2488373, -0.04852054, -0.3425978, 1, 1, 1, 1, 1,
-0.2488051, 0.5576185, 0.6438728, 1, 1, 1, 1, 1,
-0.2468341, 0.7927601, 0.2489037, 1, 1, 1, 1, 1,
-0.2414567, 1.241521, -0.8466803, 1, 1, 1, 1, 1,
-0.2407308, 0.5513901, -0.1217529, 1, 1, 1, 1, 1,
-0.2404203, -0.9765453, -4.075079, 1, 1, 1, 1, 1,
-0.2346528, -0.3652858, -2.717223, 1, 1, 1, 1, 1,
-0.2331041, 0.7793559, 0.6325161, 0, 0, 1, 1, 1,
-0.2330342, 0.3278264, 0.8368767, 1, 0, 0, 1, 1,
-0.2317658, -0.6822322, -1.789883, 1, 0, 0, 1, 1,
-0.2279867, -0.01984605, -2.389693, 1, 0, 0, 1, 1,
-0.2272464, 1.538803, 1.791713, 1, 0, 0, 1, 1,
-0.2232763, 0.7168463, 0.6002696, 1, 0, 0, 1, 1,
-0.2205643, 0.4656416, -1.246777, 0, 0, 0, 1, 1,
-0.2187781, 0.4369526, -0.8528221, 0, 0, 0, 1, 1,
-0.2179029, 0.1939104, -2.557356, 0, 0, 0, 1, 1,
-0.212018, 0.6530454, 0.0813998, 0, 0, 0, 1, 1,
-0.2094041, -0.8867719, -3.687205, 0, 0, 0, 1, 1,
-0.2090083, -1.552624, -3.042889, 0, 0, 0, 1, 1,
-0.2076802, -0.2495459, -2.252921, 0, 0, 0, 1, 1,
-0.2067298, -0.259781, -2.424343, 1, 1, 1, 1, 1,
-0.2062789, -2.090982, -2.674644, 1, 1, 1, 1, 1,
-0.2037148, -0.1368403, -3.371222, 1, 1, 1, 1, 1,
-0.202601, -1.061097, -4.116371, 1, 1, 1, 1, 1,
-0.2018204, -1.237665, -2.033863, 1, 1, 1, 1, 1,
-0.2010957, 1.150976, 1.104286, 1, 1, 1, 1, 1,
-0.1988785, -0.1823793, -1.936031, 1, 1, 1, 1, 1,
-0.1975192, -1.045548, -2.201925, 1, 1, 1, 1, 1,
-0.1942645, -0.4413697, -3.63488, 1, 1, 1, 1, 1,
-0.1937975, 0.3202365, 0.1279295, 1, 1, 1, 1, 1,
-0.1934772, 0.6212322, 0.1207142, 1, 1, 1, 1, 1,
-0.1908294, 1.049426, 1.656159, 1, 1, 1, 1, 1,
-0.1893344, -1.153448, -3.608541, 1, 1, 1, 1, 1,
-0.1846261, 0.4278679, -0.7619823, 1, 1, 1, 1, 1,
-0.1829301, -0.6813261, -2.134745, 1, 1, 1, 1, 1,
-0.1827841, -1.275717, -2.67402, 0, 0, 1, 1, 1,
-0.1817182, -3.106283, -3.588894, 1, 0, 0, 1, 1,
-0.1777575, -0.8595239, -2.098929, 1, 0, 0, 1, 1,
-0.1770699, 1.077833, -1.862231, 1, 0, 0, 1, 1,
-0.1729121, 0.1132178, -2.834229, 1, 0, 0, 1, 1,
-0.1688515, 0.7504394, -0.01284743, 1, 0, 0, 1, 1,
-0.1683151, -0.4504964, -3.304639, 0, 0, 0, 1, 1,
-0.1645886, -0.5059408, -3.624638, 0, 0, 0, 1, 1,
-0.1602525, -0.6249211, -3.021465, 0, 0, 0, 1, 1,
-0.1588072, 1.441278, 0.2453762, 0, 0, 0, 1, 1,
-0.155839, -1.401594, -3.476594, 0, 0, 0, 1, 1,
-0.1435037, -0.1279222, -2.815102, 0, 0, 0, 1, 1,
-0.1422541, 1.272458, 1.526154, 0, 0, 0, 1, 1,
-0.135825, -0.3050774, -3.055602, 1, 1, 1, 1, 1,
-0.1272189, -1.366511, -5.464834, 1, 1, 1, 1, 1,
-0.1266246, 0.7735115, -0.2983927, 1, 1, 1, 1, 1,
-0.1215098, 1.076506, -1.094559, 1, 1, 1, 1, 1,
-0.1213332, 0.07091094, -1.277279, 1, 1, 1, 1, 1,
-0.1191557, 1.279733, 0.1290045, 1, 1, 1, 1, 1,
-0.1146472, -1.555669, -2.041536, 1, 1, 1, 1, 1,
-0.1088116, 0.8740688, 1.453271, 1, 1, 1, 1, 1,
-0.106969, -1.367795, -2.463508, 1, 1, 1, 1, 1,
-0.1036885, 1.050924, -1.362552, 1, 1, 1, 1, 1,
-0.09449963, 1.789683, 0.3742531, 1, 1, 1, 1, 1,
-0.0897788, -0.4288465, -1.817485, 1, 1, 1, 1, 1,
-0.08916077, 0.3407442, 0.9826119, 1, 1, 1, 1, 1,
-0.08825513, -1.400511, -2.326743, 1, 1, 1, 1, 1,
-0.08677605, -0.7551657, -3.104422, 1, 1, 1, 1, 1,
-0.08471878, -0.7750161, -0.8902004, 0, 0, 1, 1, 1,
-0.08179745, 0.1013275, -0.9530835, 1, 0, 0, 1, 1,
-0.07657295, -1.630689, -4.021633, 1, 0, 0, 1, 1,
-0.0761785, 0.8572277, -0.1196928, 1, 0, 0, 1, 1,
-0.07338113, -0.1862926, -2.455438, 1, 0, 0, 1, 1,
-0.07101596, 0.05267256, -0.05882252, 1, 0, 0, 1, 1,
-0.06994776, -1.224186, -2.964066, 0, 0, 0, 1, 1,
-0.06746521, -1.363761, -2.882384, 0, 0, 0, 1, 1,
-0.06493355, 2.055662, 1.130819, 0, 0, 0, 1, 1,
-0.06101831, -1.370117, -1.937216, 0, 0, 0, 1, 1,
-0.06066833, -0.09505348, -3.065719, 0, 0, 0, 1, 1,
-0.05822985, -1.864792, -2.644967, 0, 0, 0, 1, 1,
-0.05518493, 1.48622, -0.8544305, 0, 0, 0, 1, 1,
-0.05471361, 0.03044249, -1.622628, 1, 1, 1, 1, 1,
-0.05313214, -1.002204, -3.402855, 1, 1, 1, 1, 1,
-0.05289605, -0.8341225, -3.775135, 1, 1, 1, 1, 1,
-0.05220589, 0.5492305, -0.04613278, 1, 1, 1, 1, 1,
-0.04434422, -0.2473225, -0.8184739, 1, 1, 1, 1, 1,
-0.04396741, 1.871254, -1.2388, 1, 1, 1, 1, 1,
-0.03188913, 0.4681884, -1.967271, 1, 1, 1, 1, 1,
-0.03097915, 0.4327671, 0.802699, 1, 1, 1, 1, 1,
-0.02600953, -2.220475, -2.760612, 1, 1, 1, 1, 1,
-0.02564633, -0.6503175, -3.010655, 1, 1, 1, 1, 1,
-0.02393768, -1.976118, -2.546034, 1, 1, 1, 1, 1,
-0.02091746, 1.019461, -0.5676076, 1, 1, 1, 1, 1,
-0.01803957, -1.573578, -3.252611, 1, 1, 1, 1, 1,
-0.01339731, -1.723653, -2.606425, 1, 1, 1, 1, 1,
-0.01337918, 0.5604979, -0.3945577, 1, 1, 1, 1, 1,
-0.01331472, -0.1256482, -5.888719, 0, 0, 1, 1, 1,
-0.01270345, 1.544057, 0.3596793, 1, 0, 0, 1, 1,
-0.009812756, 1.571026, 1.123779, 1, 0, 0, 1, 1,
-0.009575154, -0.7516567, -4.60706, 1, 0, 0, 1, 1,
-0.009454466, -0.5113968, -2.904732, 1, 0, 0, 1, 1,
-0.00871148, 0.4877385, 0.3976286, 1, 0, 0, 1, 1,
-0.008343216, -0.5705882, -2.658452, 0, 0, 0, 1, 1,
-0.007700649, -0.9112747, -1.910626, 0, 0, 0, 1, 1,
-0.006751336, 1.1943, 0.623818, 0, 0, 0, 1, 1,
0.002955724, -0.2343036, 3.733726, 0, 0, 0, 1, 1,
0.006986725, -0.2605485, 2.246206, 0, 0, 0, 1, 1,
0.0100783, -0.100279, 2.388802, 0, 0, 0, 1, 1,
0.01279649, -0.706014, 2.983762, 0, 0, 0, 1, 1,
0.01610862, -0.3949343, 1.640228, 1, 1, 1, 1, 1,
0.01642382, 1.421763, 1.641745, 1, 1, 1, 1, 1,
0.01756872, -0.843708, 1.480882, 1, 1, 1, 1, 1,
0.03121168, -0.1597639, 3.160766, 1, 1, 1, 1, 1,
0.03138325, 0.6292469, -0.8482216, 1, 1, 1, 1, 1,
0.03160468, -0.8343179, 2.360032, 1, 1, 1, 1, 1,
0.03499421, 0.1776778, 0.3679125, 1, 1, 1, 1, 1,
0.03625276, 1.021708, 0.7212544, 1, 1, 1, 1, 1,
0.03848663, -1.10112, 3.582457, 1, 1, 1, 1, 1,
0.05232497, 1.434719, -0.1635538, 1, 1, 1, 1, 1,
0.05316916, 0.08238179, 2.666572, 1, 1, 1, 1, 1,
0.05645971, -0.2443493, 3.95413, 1, 1, 1, 1, 1,
0.05928769, 0.3889084, 1.038519, 1, 1, 1, 1, 1,
0.06038182, 0.6523799, -0.2277782, 1, 1, 1, 1, 1,
0.06349304, -0.9713844, 2.521649, 1, 1, 1, 1, 1,
0.06476369, -0.3777044, 3.125072, 0, 0, 1, 1, 1,
0.06892899, -0.8285573, 3.905902, 1, 0, 0, 1, 1,
0.07209875, -0.1192335, 1.872329, 1, 0, 0, 1, 1,
0.07222474, 0.5223662, -0.7262322, 1, 0, 0, 1, 1,
0.07492182, -1.103532, 1.88759, 1, 0, 0, 1, 1,
0.07748517, 0.4831344, -0.3423651, 1, 0, 0, 1, 1,
0.07917075, 0.7611785, -1.066089, 0, 0, 0, 1, 1,
0.09506955, 1.020651, 1.222344, 0, 0, 0, 1, 1,
0.1018567, 1.933337, 1.757967, 0, 0, 0, 1, 1,
0.1064042, 1.070726, 0.1401352, 0, 0, 0, 1, 1,
0.1072883, 1.002404, 0.7278401, 0, 0, 0, 1, 1,
0.1123905, -0.3425604, 3.285273, 0, 0, 0, 1, 1,
0.1125815, -0.109297, 3.348496, 0, 0, 0, 1, 1,
0.1154082, 0.8551345, -0.800789, 1, 1, 1, 1, 1,
0.1197126, -2.329125, 2.925365, 1, 1, 1, 1, 1,
0.1200147, 1.269956, 0.2741399, 1, 1, 1, 1, 1,
0.124238, 0.05661215, -0.4149323, 1, 1, 1, 1, 1,
0.1262014, -1.106789, 2.467789, 1, 1, 1, 1, 1,
0.131107, -0.9623594, 3.343404, 1, 1, 1, 1, 1,
0.1316181, 0.5437238, 0.6519857, 1, 1, 1, 1, 1,
0.1319298, -0.9808304, 3.169096, 1, 1, 1, 1, 1,
0.1335633, 0.607015, -0.7126475, 1, 1, 1, 1, 1,
0.1376265, -0.8565913, 4.942138, 1, 1, 1, 1, 1,
0.1399742, -0.07402615, 1.128416, 1, 1, 1, 1, 1,
0.1482894, -0.003989167, 1.998098, 1, 1, 1, 1, 1,
0.1483244, 0.04576731, 1.482187, 1, 1, 1, 1, 1,
0.1507373, -0.3747991, 3.19481, 1, 1, 1, 1, 1,
0.1538189, 2.3629, 0.3490586, 1, 1, 1, 1, 1,
0.161316, 0.4181132, 0.6500532, 0, 0, 1, 1, 1,
0.162161, -0.8944533, 2.931295, 1, 0, 0, 1, 1,
0.1628233, 0.8267269, 0.5017057, 1, 0, 0, 1, 1,
0.166554, -3.041397, 4.887629, 1, 0, 0, 1, 1,
0.1666814, -1.78519, 3.103074, 1, 0, 0, 1, 1,
0.1713328, -0.3849482, 2.289044, 1, 0, 0, 1, 1,
0.1721768, 1.291363, 0.3397213, 0, 0, 0, 1, 1,
0.1730759, 0.6674582, -0.3232999, 0, 0, 0, 1, 1,
0.1781234, 0.8836178, 0.1690311, 0, 0, 0, 1, 1,
0.1799437, 0.8838067, 0.9069335, 0, 0, 0, 1, 1,
0.1830131, -0.3140987, 1.478835, 0, 0, 0, 1, 1,
0.1834278, 0.1571812, 0.9101419, 0, 0, 0, 1, 1,
0.1909456, 1.493217, -1.634313, 0, 0, 0, 1, 1,
0.1942351, 1.313571, -0.6785498, 1, 1, 1, 1, 1,
0.1970843, 0.8141503, -0.8691635, 1, 1, 1, 1, 1,
0.2003371, 0.02497322, 1.132704, 1, 1, 1, 1, 1,
0.2004574, -0.6667034, 2.915526, 1, 1, 1, 1, 1,
0.2017394, -1.699954, 2.733091, 1, 1, 1, 1, 1,
0.2053093, -0.2095179, 1.932553, 1, 1, 1, 1, 1,
0.2059374, 0.3775831, 0.1359881, 1, 1, 1, 1, 1,
0.2070969, 0.2596335, 1.436627, 1, 1, 1, 1, 1,
0.2088877, -0.125941, 0.7908856, 1, 1, 1, 1, 1,
0.208957, -0.6913866, 0.9758801, 1, 1, 1, 1, 1,
0.2107445, -1.146953, 2.350049, 1, 1, 1, 1, 1,
0.2126612, 1.124697, 0.8603124, 1, 1, 1, 1, 1,
0.2139031, -0.2409645, 3.361429, 1, 1, 1, 1, 1,
0.2139056, 1.131017, 0.9394444, 1, 1, 1, 1, 1,
0.2173897, 0.3558863, 0.8667778, 1, 1, 1, 1, 1,
0.2191868, 0.7056549, 1.010655, 0, 0, 1, 1, 1,
0.2197374, -0.6570453, 4.805994, 1, 0, 0, 1, 1,
0.2203939, -0.2673933, 0.8191456, 1, 0, 0, 1, 1,
0.2226915, -0.1854017, 1.535607, 1, 0, 0, 1, 1,
0.2242362, 0.5535626, 0.5848309, 1, 0, 0, 1, 1,
0.2263629, -0.1158402, 2.217883, 1, 0, 0, 1, 1,
0.2270324, 0.6759046, -1.451231, 0, 0, 0, 1, 1,
0.2295062, 0.9437452, 0.02615312, 0, 0, 0, 1, 1,
0.2298909, -0.3750899, 0.7193587, 0, 0, 0, 1, 1,
0.2321461, 0.2029759, 1.351739, 0, 0, 0, 1, 1,
0.2349257, -1.062894, 3.168731, 0, 0, 0, 1, 1,
0.2402669, -0.04744018, 0.8076884, 0, 0, 0, 1, 1,
0.2438195, -0.2953528, 2.784899, 0, 0, 0, 1, 1,
0.2498296, -2.289967, 1.692179, 1, 1, 1, 1, 1,
0.2512389, -2.125903, 1.18164, 1, 1, 1, 1, 1,
0.2513267, 1.459033, -0.7315339, 1, 1, 1, 1, 1,
0.2656158, 0.449717, 0.9894105, 1, 1, 1, 1, 1,
0.2661971, -0.4681642, 3.043036, 1, 1, 1, 1, 1,
0.2668298, 0.4060497, 0.2982865, 1, 1, 1, 1, 1,
0.2713234, 1.062588, 1.019191, 1, 1, 1, 1, 1,
0.2717493, -2.162852, 2.869928, 1, 1, 1, 1, 1,
0.2774834, 1.394301, -2.016185, 1, 1, 1, 1, 1,
0.2781918, 1.322037, 0.7929944, 1, 1, 1, 1, 1,
0.2799845, 1.19082, 1.129232, 1, 1, 1, 1, 1,
0.2805807, -0.7029572, 2.626514, 1, 1, 1, 1, 1,
0.2843527, -0.7416648, 3.219737, 1, 1, 1, 1, 1,
0.2864843, 0.7480702, 0.663379, 1, 1, 1, 1, 1,
0.292877, -2.246823, 2.801551, 1, 1, 1, 1, 1,
0.293603, 0.4353164, 1.542773, 0, 0, 1, 1, 1,
0.2961155, -1.210551, 4.791775, 1, 0, 0, 1, 1,
0.2969815, -0.2461502, 3.304909, 1, 0, 0, 1, 1,
0.2979264, -0.4937142, 2.346722, 1, 0, 0, 1, 1,
0.2984443, 0.3179252, 3.125191, 1, 0, 0, 1, 1,
0.3006141, 1.528714, -0.8239747, 1, 0, 0, 1, 1,
0.3029179, -0.3140501, 2.521737, 0, 0, 0, 1, 1,
0.3058061, -0.9458788, 1.803478, 0, 0, 0, 1, 1,
0.3123123, -0.2279432, 2.1834, 0, 0, 0, 1, 1,
0.3125376, 1.010695, -0.3588413, 0, 0, 0, 1, 1,
0.3148469, -0.1833498, 2.045803, 0, 0, 0, 1, 1,
0.3169678, 0.9373198, 0.3192195, 0, 0, 0, 1, 1,
0.3170038, -0.1404287, 3.43709, 0, 0, 0, 1, 1,
0.3173493, 0.7497494, 2.842105, 1, 1, 1, 1, 1,
0.3185635, -0.3677603, 3.494457, 1, 1, 1, 1, 1,
0.3209175, 0.02587556, 0.5471875, 1, 1, 1, 1, 1,
0.3211415, -0.1715572, 1.577885, 1, 1, 1, 1, 1,
0.3222197, 0.03329002, 1.873692, 1, 1, 1, 1, 1,
0.32349, -1.099724, 2.380258, 1, 1, 1, 1, 1,
0.3236305, 1.701444, -0.3291048, 1, 1, 1, 1, 1,
0.3249475, -0.4012054, 3.237871, 1, 1, 1, 1, 1,
0.334654, 1.715477, 0.0555489, 1, 1, 1, 1, 1,
0.339343, -1.548174, 3.289294, 1, 1, 1, 1, 1,
0.3423677, -1.286488, 2.547423, 1, 1, 1, 1, 1,
0.3447498, -1.260605, 2.305279, 1, 1, 1, 1, 1,
0.3511012, 0.123126, 0.9931856, 1, 1, 1, 1, 1,
0.353715, -0.2660294, 1.013645, 1, 1, 1, 1, 1,
0.3577987, -1.82314, 3.761787, 1, 1, 1, 1, 1,
0.3585818, -0.4053927, 1.873804, 0, 0, 1, 1, 1,
0.3587969, 2.118279, 0.9433469, 1, 0, 0, 1, 1,
0.3593561, -2.841436, 3.092557, 1, 0, 0, 1, 1,
0.3603096, -1.097368, 2.18857, 1, 0, 0, 1, 1,
0.3609027, -0.05808836, 1.057934, 1, 0, 0, 1, 1,
0.3638099, -0.5214332, 0.7545211, 1, 0, 0, 1, 1,
0.3716979, 0.04008324, -0.1072021, 0, 0, 0, 1, 1,
0.3789934, -1.130096, 2.261634, 0, 0, 0, 1, 1,
0.3853495, 1.697317, 0.5654362, 0, 0, 0, 1, 1,
0.3886674, -0.08723605, 2.277716, 0, 0, 0, 1, 1,
0.3935905, 0.172138, 0.6530062, 0, 0, 0, 1, 1,
0.39475, 0.9215331, 0.8265245, 0, 0, 0, 1, 1,
0.3950783, -0.492973, 2.078865, 0, 0, 0, 1, 1,
0.3988466, -1.072683, 4.728607, 1, 1, 1, 1, 1,
0.4055248, 0.2255674, 3.026731, 1, 1, 1, 1, 1,
0.4072731, 0.09899206, 1.037682, 1, 1, 1, 1, 1,
0.4076845, 0.06535355, 0.8788553, 1, 1, 1, 1, 1,
0.4082243, -0.06344838, 2.03882, 1, 1, 1, 1, 1,
0.4085255, -0.1021481, 3.123643, 1, 1, 1, 1, 1,
0.4154248, 0.4525721, 1.225431, 1, 1, 1, 1, 1,
0.41568, -0.2088487, 0.4881238, 1, 1, 1, 1, 1,
0.4157765, -0.7870684, 2.057832, 1, 1, 1, 1, 1,
0.4177026, 1.885057, 0.3883335, 1, 1, 1, 1, 1,
0.4180287, -0.2882857, 2.450426, 1, 1, 1, 1, 1,
0.4218405, 1.141252, 0.2656615, 1, 1, 1, 1, 1,
0.4288859, 0.2719604, 1.569861, 1, 1, 1, 1, 1,
0.4333271, 0.637445, -0.6559534, 1, 1, 1, 1, 1,
0.4336353, -1.321584, 3.888351, 1, 1, 1, 1, 1,
0.4368683, -0.6357546, 2.466591, 0, 0, 1, 1, 1,
0.4396794, -1.890528, 3.196407, 1, 0, 0, 1, 1,
0.4396822, -0.9184976, 4.326486, 1, 0, 0, 1, 1,
0.441694, 0.14964, -1.431661, 1, 0, 0, 1, 1,
0.4422185, 1.647381, -0.2139946, 1, 0, 0, 1, 1,
0.443789, 0.855007, 1.49993, 1, 0, 0, 1, 1,
0.4462948, -0.3698964, 3.253777, 0, 0, 0, 1, 1,
0.4467902, -0.3801386, 1.374542, 0, 0, 0, 1, 1,
0.4621287, -0.111607, 1.478252, 0, 0, 0, 1, 1,
0.4626286, 0.6314739, -0.9072651, 0, 0, 0, 1, 1,
0.4629961, 1.164205, -0.008039081, 0, 0, 0, 1, 1,
0.4633121, -0.4938963, 2.061343, 0, 0, 0, 1, 1,
0.4651611, 1.01847, 2.797615, 0, 0, 0, 1, 1,
0.4678252, -0.01220762, 2.968162, 1, 1, 1, 1, 1,
0.4685604, 0.4742428, 0.8626011, 1, 1, 1, 1, 1,
0.4693324, 0.6380211, 1.148969, 1, 1, 1, 1, 1,
0.4780627, 0.6113737, 1.256637, 1, 1, 1, 1, 1,
0.4835574, 1.158448, 1.805072, 1, 1, 1, 1, 1,
0.4898171, 0.494276, 1.833275, 1, 1, 1, 1, 1,
0.4984313, -0.4686739, 3.32814, 1, 1, 1, 1, 1,
0.5016931, 1.072611, 1.278618, 1, 1, 1, 1, 1,
0.5037389, 0.1359346, 1.09942, 1, 1, 1, 1, 1,
0.5115199, -1.021488, 2.788676, 1, 1, 1, 1, 1,
0.513559, 0.7281081, -2.040221, 1, 1, 1, 1, 1,
0.5156435, -0.2845757, 3.226348, 1, 1, 1, 1, 1,
0.5208337, 0.274769, 0.174667, 1, 1, 1, 1, 1,
0.5274159, 0.4430631, -0.6303483, 1, 1, 1, 1, 1,
0.5275028, -1.058754, 1.965664, 1, 1, 1, 1, 1,
0.527599, 0.3962924, 2.106119, 0, 0, 1, 1, 1,
0.529111, -0.8302783, 2.607299, 1, 0, 0, 1, 1,
0.5304576, 0.4658031, 1.166938, 1, 0, 0, 1, 1,
0.5335959, 0.0687574, 1.336605, 1, 0, 0, 1, 1,
0.5341027, 0.8145943, 0.372253, 1, 0, 0, 1, 1,
0.5343512, -3.171743, 3.575424, 1, 0, 0, 1, 1,
0.5343512, -2.057385, 2.909587, 0, 0, 0, 1, 1,
0.5349517, -0.8621905, 0.8265483, 0, 0, 0, 1, 1,
0.5454818, -1.344408, 2.523387, 0, 0, 0, 1, 1,
0.5499029, -0.371485, 0.9711538, 0, 0, 0, 1, 1,
0.5536834, 0.3850179, -0.2316369, 0, 0, 0, 1, 1,
0.5537901, 0.1781221, 2.11828, 0, 0, 0, 1, 1,
0.555326, -1.763082, 2.301484, 0, 0, 0, 1, 1,
0.5553314, -0.1976475, 2.840526, 1, 1, 1, 1, 1,
0.5555794, 0.04639446, 0.4006195, 1, 1, 1, 1, 1,
0.556839, 1.223189, 0.3436092, 1, 1, 1, 1, 1,
0.5661739, 0.4000471, -0.594413, 1, 1, 1, 1, 1,
0.5685545, -0.8167241, 3.251333, 1, 1, 1, 1, 1,
0.5715047, -0.3374031, 1.918238, 1, 1, 1, 1, 1,
0.577897, 0.9353526, 0.4845355, 1, 1, 1, 1, 1,
0.5786145, 0.4801151, 3.081536, 1, 1, 1, 1, 1,
0.5831134, -0.05225707, 3.018693, 1, 1, 1, 1, 1,
0.5839261, 2.084606, 0.4706504, 1, 1, 1, 1, 1,
0.5916347, 0.9722168, 2.181337, 1, 1, 1, 1, 1,
0.592827, 1.503224, 1.052741, 1, 1, 1, 1, 1,
0.5939947, 1.334191, 0.8214388, 1, 1, 1, 1, 1,
0.5994337, -0.1928703, 3.094865, 1, 1, 1, 1, 1,
0.6012302, 0.01219895, 2.481148, 1, 1, 1, 1, 1,
0.6035933, 0.09114318, 0.8662814, 0, 0, 1, 1, 1,
0.615564, -0.5137744, 3.860211, 1, 0, 0, 1, 1,
0.6166189, 0.6474274, 0.9077246, 1, 0, 0, 1, 1,
0.6191379, 0.04086955, 2.574334, 1, 0, 0, 1, 1,
0.623002, -0.2135312, 0.8087705, 1, 0, 0, 1, 1,
0.6291244, -0.09276349, 0.4624489, 1, 0, 0, 1, 1,
0.6311073, -0.3140064, 2.283285, 0, 0, 0, 1, 1,
0.6327855, -0.5156382, 2.998911, 0, 0, 0, 1, 1,
0.6368439, -2.402545, 2.406564, 0, 0, 0, 1, 1,
0.6391538, -0.3828763, 1.693752, 0, 0, 0, 1, 1,
0.6397372, -0.5692227, 2.505167, 0, 0, 0, 1, 1,
0.6422463, -1.849152, 1.272924, 0, 0, 0, 1, 1,
0.6521642, 0.2238494, 0.08088146, 0, 0, 0, 1, 1,
0.6523038, -2.066439, 3.468214, 1, 1, 1, 1, 1,
0.6551991, -0.162347, -0.5372997, 1, 1, 1, 1, 1,
0.6673607, -1.770352, 3.513594, 1, 1, 1, 1, 1,
0.6756699, 1.902184, 1.204902, 1, 1, 1, 1, 1,
0.6782925, -0.2624863, 2.45433, 1, 1, 1, 1, 1,
0.6789139, 0.8124595, 0.9130389, 1, 1, 1, 1, 1,
0.6858036, 2.001361, -0.4660885, 1, 1, 1, 1, 1,
0.6888694, 0.3536659, 1.658892, 1, 1, 1, 1, 1,
0.6891788, 0.26682, 2.17028, 1, 1, 1, 1, 1,
0.6973347, 0.1438662, 0.4280375, 1, 1, 1, 1, 1,
0.6982495, 0.885498, 0.9252282, 1, 1, 1, 1, 1,
0.7005117, -2.157201, 3.252048, 1, 1, 1, 1, 1,
0.7062058, -0.4457291, 4.293655, 1, 1, 1, 1, 1,
0.7089533, 1.276883, 1.809469, 1, 1, 1, 1, 1,
0.7131948, -0.3046805, 0.2292429, 1, 1, 1, 1, 1,
0.7139627, 0.6950808, -1.026796, 0, 0, 1, 1, 1,
0.7148617, -1.023296, 1.166582, 1, 0, 0, 1, 1,
0.7194368, 1.20465, 2.35362, 1, 0, 0, 1, 1,
0.7200356, -0.6677004, 1.941751, 1, 0, 0, 1, 1,
0.7210814, 3.23886, 0.8974238, 1, 0, 0, 1, 1,
0.7379116, -0.7394198, 2.467677, 1, 0, 0, 1, 1,
0.7447903, 0.3200239, 1.375354, 0, 0, 0, 1, 1,
0.7483482, -0.3704222, -0.07341626, 0, 0, 0, 1, 1,
0.7503091, -0.6761715, 3.364226, 0, 0, 0, 1, 1,
0.7545919, -0.1074921, -0.5370216, 0, 0, 0, 1, 1,
0.7562201, -0.06732026, 2.35178, 0, 0, 0, 1, 1,
0.7617787, 0.7352629, 0.7317618, 0, 0, 0, 1, 1,
0.7663599, 1.187087, 0.7203416, 0, 0, 0, 1, 1,
0.7677891, -0.1327701, 3.644871, 1, 1, 1, 1, 1,
0.7717512, 1.176324, 2.561477, 1, 1, 1, 1, 1,
0.7838088, -0.2266183, -1.412329, 1, 1, 1, 1, 1,
0.7868773, 0.03316505, 2.326804, 1, 1, 1, 1, 1,
0.788554, -0.9676958, 2.109672, 1, 1, 1, 1, 1,
0.7932215, 0.5514271, 2.118703, 1, 1, 1, 1, 1,
0.7965736, -0.5443141, 1.049715, 1, 1, 1, 1, 1,
0.807071, 0.5659831, 0.8814265, 1, 1, 1, 1, 1,
0.8091596, -0.9829521, 4.467293, 1, 1, 1, 1, 1,
0.8094458, -0.3407668, 2.515606, 1, 1, 1, 1, 1,
0.8132283, 1.455418, -0.8685547, 1, 1, 1, 1, 1,
0.8133606, -0.7368989, 2.776891, 1, 1, 1, 1, 1,
0.8157601, 1.384211, 0.02861662, 1, 1, 1, 1, 1,
0.8190398, -0.6372571, 1.409697, 1, 1, 1, 1, 1,
0.8191757, -0.08952732, 1.21149, 1, 1, 1, 1, 1,
0.8225507, 0.5413795, 1.685652, 0, 0, 1, 1, 1,
0.8301489, -0.2933182, 1.735838, 1, 0, 0, 1, 1,
0.830977, 0.7498458, -0.00246141, 1, 0, 0, 1, 1,
0.8335693, -2.072721, 4.214464, 1, 0, 0, 1, 1,
0.8343328, -0.4513663, 0.3086419, 1, 0, 0, 1, 1,
0.8421463, -0.1914284, 1.309631, 1, 0, 0, 1, 1,
0.8537399, 1.392527, -1.007043, 0, 0, 0, 1, 1,
0.8654187, -0.08537544, 0.9811798, 0, 0, 0, 1, 1,
0.8673877, 0.2286785, 3.871011, 0, 0, 0, 1, 1,
0.8739197, 0.78523, 1.101047, 0, 0, 0, 1, 1,
0.8753833, 0.3058043, 1.906133, 0, 0, 0, 1, 1,
0.876946, -1.65748, 1.472655, 0, 0, 0, 1, 1,
0.8776928, 1.646402, 1.697377, 0, 0, 0, 1, 1,
0.8803673, -0.4922971, 3.064623, 1, 1, 1, 1, 1,
0.8877189, 0.637939, 0.9021636, 1, 1, 1, 1, 1,
0.8915272, -0.9682809, 1.001221, 1, 1, 1, 1, 1,
0.8935459, 0.3893555, 2.369856, 1, 1, 1, 1, 1,
0.8969474, -2.249359, 3.144013, 1, 1, 1, 1, 1,
0.8970942, -1.415782, 0.920367, 1, 1, 1, 1, 1,
0.9001631, 0.2696059, 1.754393, 1, 1, 1, 1, 1,
0.9097551, -0.1476216, 2.776823, 1, 1, 1, 1, 1,
0.9204913, 0.02188612, 1.852289, 1, 1, 1, 1, 1,
0.9248287, -1.61228, 2.127002, 1, 1, 1, 1, 1,
0.926182, 0.01028941, 1.281099, 1, 1, 1, 1, 1,
0.9366437, 0.8996353, 0.4324724, 1, 1, 1, 1, 1,
0.9400752, -0.5098061, 3.537574, 1, 1, 1, 1, 1,
0.9412369, -1.038827, 2.871746, 1, 1, 1, 1, 1,
0.9431986, 0.4110475, 1.463239, 1, 1, 1, 1, 1,
0.9476576, -1.457479, 4.625976, 0, 0, 1, 1, 1,
0.9525457, -0.5759891, 2.562664, 1, 0, 0, 1, 1,
0.9553031, -0.08364806, 2.562175, 1, 0, 0, 1, 1,
0.9591529, -0.630766, 2.002893, 1, 0, 0, 1, 1,
0.9633753, -2.208009, 3.869373, 1, 0, 0, 1, 1,
0.9828382, 0.4997448, 1.385447, 1, 0, 0, 1, 1,
0.9885818, -0.5246962, 1.125924, 0, 0, 0, 1, 1,
0.9944342, -0.008923761, 1.727823, 0, 0, 0, 1, 1,
1.000151, -0.929388, 2.61333, 0, 0, 0, 1, 1,
1.004516, 1.229933, 2.197211, 0, 0, 0, 1, 1,
1.0057, -0.8284313, 2.354857, 0, 0, 0, 1, 1,
1.005846, -0.06174888, 0.005039095, 0, 0, 0, 1, 1,
1.008031, 0.5830485, 2.499221, 0, 0, 0, 1, 1,
1.018484, 1.516107, 1.56587, 1, 1, 1, 1, 1,
1.026676, -0.5931779, 4.494079, 1, 1, 1, 1, 1,
1.029278, -1.442257, 2.050729, 1, 1, 1, 1, 1,
1.032317, -1.109314, 1.817705, 1, 1, 1, 1, 1,
1.033296, -0.4038161, 1.765522, 1, 1, 1, 1, 1,
1.036843, 0.4925509, 2.045925, 1, 1, 1, 1, 1,
1.043478, 1.524939, 1.344926, 1, 1, 1, 1, 1,
1.047246, 1.16763, 2.833203, 1, 1, 1, 1, 1,
1.051222, 0.776122, 1.004182, 1, 1, 1, 1, 1,
1.051754, -1.620533, 1.596472, 1, 1, 1, 1, 1,
1.055647, -1.121889, 2.941358, 1, 1, 1, 1, 1,
1.058347, -0.07559967, 0.5615782, 1, 1, 1, 1, 1,
1.061052, 1.190377, 0.4724679, 1, 1, 1, 1, 1,
1.062146, -0.6989163, 1.369689, 1, 1, 1, 1, 1,
1.063028, 0.3085167, 1.333074, 1, 1, 1, 1, 1,
1.064614, 1.084746, 2.402209, 0, 0, 1, 1, 1,
1.066952, 0.2053879, -0.3590579, 1, 0, 0, 1, 1,
1.067665, -0.8513746, 3.573616, 1, 0, 0, 1, 1,
1.068818, -2.315072, 3.902945, 1, 0, 0, 1, 1,
1.069416, -1.277124, 1.086912, 1, 0, 0, 1, 1,
1.071866, -0.5890568, 2.56631, 1, 0, 0, 1, 1,
1.074888, 0.4522355, 1.049428, 0, 0, 0, 1, 1,
1.077077, -1.23781, 3.472577, 0, 0, 0, 1, 1,
1.084116, 0.07382144, 1.859139, 0, 0, 0, 1, 1,
1.0849, -1.818756, 2.688224, 0, 0, 0, 1, 1,
1.08741, -0.6395345, 1.984828, 0, 0, 0, 1, 1,
1.099427, 0.2956563, 0.8186699, 0, 0, 0, 1, 1,
1.105771, 1.277925, 2.287186, 0, 0, 0, 1, 1,
1.110171, 0.73561, 2.453396, 1, 1, 1, 1, 1,
1.114588, 0.7035303, -0.1072558, 1, 1, 1, 1, 1,
1.124743, 0.8670794, -0.2943731, 1, 1, 1, 1, 1,
1.125913, 0.7269892, 0.9655613, 1, 1, 1, 1, 1,
1.129124, -0.06391961, 2.522572, 1, 1, 1, 1, 1,
1.130206, -0.412075, 1.906315, 1, 1, 1, 1, 1,
1.131004, 0.7335402, 0.6221299, 1, 1, 1, 1, 1,
1.131435, 0.2843244, 3.97714, 1, 1, 1, 1, 1,
1.135024, 0.5210513, 1.2843, 1, 1, 1, 1, 1,
1.140241, 0.4065311, 1.61692, 1, 1, 1, 1, 1,
1.14941, 1.186493, 1.375442, 1, 1, 1, 1, 1,
1.153624, 0.8636083, 1.822346, 1, 1, 1, 1, 1,
1.160546, 1.384318, -0.03283243, 1, 1, 1, 1, 1,
1.166146, -2.466974, 1.70628, 1, 1, 1, 1, 1,
1.173236, -0.9697332, 1.599017, 1, 1, 1, 1, 1,
1.175443, -0.1343266, 1.641817, 0, 0, 1, 1, 1,
1.179891, 0.1821251, 2.953293, 1, 0, 0, 1, 1,
1.185224, 1.091201, -0.1269664, 1, 0, 0, 1, 1,
1.189378, -1.232363, 0.6486423, 1, 0, 0, 1, 1,
1.202621, -1.664732, 2.899526, 1, 0, 0, 1, 1,
1.210048, 1.425089, -0.7113273, 1, 0, 0, 1, 1,
1.214734, 1.37989, 0.8709899, 0, 0, 0, 1, 1,
1.232513, 0.3673412, 1.363674, 0, 0, 0, 1, 1,
1.233357, 0.3110473, 0.3542603, 0, 0, 0, 1, 1,
1.23554, 0.05940726, 0.3570437, 0, 0, 0, 1, 1,
1.236399, -0.136397, 0.9011614, 0, 0, 0, 1, 1,
1.236476, 0.2826221, 0.5079653, 0, 0, 0, 1, 1,
1.239567, 1.086278, 1.07555, 0, 0, 0, 1, 1,
1.240297, -0.7797385, 2.744721, 1, 1, 1, 1, 1,
1.247047, -0.1473834, 1.762432, 1, 1, 1, 1, 1,
1.252681, 0.6579534, 1.205808, 1, 1, 1, 1, 1,
1.253633, 1.351364, 1.384436, 1, 1, 1, 1, 1,
1.256231, 2.324191, 0.1907428, 1, 1, 1, 1, 1,
1.263338, 1.119058, 0.02231786, 1, 1, 1, 1, 1,
1.266092, 1.657418, 1.252884, 1, 1, 1, 1, 1,
1.268093, -1.370571, 2.204675, 1, 1, 1, 1, 1,
1.269179, -0.2345421, 0.4149779, 1, 1, 1, 1, 1,
1.271257, 0.2246633, 1.927267, 1, 1, 1, 1, 1,
1.278536, -0.6079103, 2.219669, 1, 1, 1, 1, 1,
1.279955, -1.521939, 3.180505, 1, 1, 1, 1, 1,
1.280583, -0.5803244, 2.098939, 1, 1, 1, 1, 1,
1.285546, -0.5404901, 2.615498, 1, 1, 1, 1, 1,
1.294384, -1.227461, 1.625096, 1, 1, 1, 1, 1,
1.295312, -0.9122638, 2.124101, 0, 0, 1, 1, 1,
1.296837, -0.0939192, -0.05737014, 1, 0, 0, 1, 1,
1.307728, 0.714955, -1.430294, 1, 0, 0, 1, 1,
1.313578, -0.3750147, 1.455945, 1, 0, 0, 1, 1,
1.314003, 1.314981, 1.036962, 1, 0, 0, 1, 1,
1.31517, 0.008942764, 0.1713364, 1, 0, 0, 1, 1,
1.31736, 1.323237, 2.462463, 0, 0, 0, 1, 1,
1.323158, -0.8376449, 4.486427, 0, 0, 0, 1, 1,
1.323623, 0.1200293, 0.4682351, 0, 0, 0, 1, 1,
1.325345, -0.9800683, 1.773492, 0, 0, 0, 1, 1,
1.327592, 0.2320168, 3.763551, 0, 0, 0, 1, 1,
1.334216, -0.2358298, 2.391731, 0, 0, 0, 1, 1,
1.334958, 0.04900425, 2.178252, 0, 0, 0, 1, 1,
1.335013, -0.544723, 3.038476, 1, 1, 1, 1, 1,
1.336113, 0.5761776, 1.488617, 1, 1, 1, 1, 1,
1.33987, -0.7377991, 2.951282, 1, 1, 1, 1, 1,
1.355349, 0.8998207, 0.09906215, 1, 1, 1, 1, 1,
1.377198, -0.2705758, 1.689513, 1, 1, 1, 1, 1,
1.383589, 1.361634, 0.4616866, 1, 1, 1, 1, 1,
1.389666, 0.7257056, 2.323259, 1, 1, 1, 1, 1,
1.411959, 1.941115, 0.4895208, 1, 1, 1, 1, 1,
1.420549, -0.9788111, 3.969975, 1, 1, 1, 1, 1,
1.425144, -2.271624, 1.670024, 1, 1, 1, 1, 1,
1.425168, 0.2409488, 2.094886, 1, 1, 1, 1, 1,
1.442392, 0.2933393, -0.133275, 1, 1, 1, 1, 1,
1.448398, -0.9549733, 0.2004476, 1, 1, 1, 1, 1,
1.452801, 0.3801321, 2.028652, 1, 1, 1, 1, 1,
1.453744, -0.9494568, 1.007973, 1, 1, 1, 1, 1,
1.459976, 0.5774958, 0.4654279, 0, 0, 1, 1, 1,
1.460433, 0.2729471, 1.192264, 1, 0, 0, 1, 1,
1.467077, 0.4794535, 3.72929, 1, 0, 0, 1, 1,
1.48286, -0.07809641, -0.03205667, 1, 0, 0, 1, 1,
1.49116, 0.5275313, 2.931714, 1, 0, 0, 1, 1,
1.493869, -0.05867872, 2.968695, 1, 0, 0, 1, 1,
1.50064, 0.5330718, 1.443549, 0, 0, 0, 1, 1,
1.506651, -0.306609, 0.7895967, 0, 0, 0, 1, 1,
1.508277, -0.5342885, 0.04623653, 0, 0, 0, 1, 1,
1.536862, 1.110677, 1.673318, 0, 0, 0, 1, 1,
1.546115, -2.218308, 1.925192, 0, 0, 0, 1, 1,
1.549241, 1.620404, 1.289817, 0, 0, 0, 1, 1,
1.551584, -0.7010779, 2.543173, 0, 0, 0, 1, 1,
1.562866, 1.045394, 1.640054, 1, 1, 1, 1, 1,
1.572749, 0.5651927, -0.1190253, 1, 1, 1, 1, 1,
1.613665, 0.1842812, 1.715024, 1, 1, 1, 1, 1,
1.614075, 0.6604687, 1.136088, 1, 1, 1, 1, 1,
1.620709, 1.053813, 2.733108, 1, 1, 1, 1, 1,
1.620998, 0.6515996, 2.797288, 1, 1, 1, 1, 1,
1.629535, 0.8644404, 1.881651, 1, 1, 1, 1, 1,
1.636381, -0.9915567, 1.969725, 1, 1, 1, 1, 1,
1.64748, 1.311275, 2.044376, 1, 1, 1, 1, 1,
1.654473, -0.4196334, 3.431042, 1, 1, 1, 1, 1,
1.674075, -0.6941605, 3.840396, 1, 1, 1, 1, 1,
1.689745, 0.2945021, -0.2494476, 1, 1, 1, 1, 1,
1.74337, 0.652896, 0.3845672, 1, 1, 1, 1, 1,
1.750374, -1.151584, 2.108459, 1, 1, 1, 1, 1,
1.762204, -1.270471, 2.651849, 1, 1, 1, 1, 1,
1.766783, 0.2228562, 1.014347, 0, 0, 1, 1, 1,
1.774099, 0.6807903, 2.516081, 1, 0, 0, 1, 1,
1.784968, 1.169884, 2.275565, 1, 0, 0, 1, 1,
1.790328, 0.6875842, 0.6763179, 1, 0, 0, 1, 1,
1.791424, 1.726766, 2.110569, 1, 0, 0, 1, 1,
1.81709, -1.496712, 2.705553, 1, 0, 0, 1, 1,
1.818281, -0.3568932, 1.692528, 0, 0, 0, 1, 1,
1.83905, -0.8450089, 1.330537, 0, 0, 0, 1, 1,
1.863129, 0.6699167, 0.9569675, 0, 0, 0, 1, 1,
1.881732, 0.0125183, 0.2931871, 0, 0, 0, 1, 1,
1.887381, -1.377054, 0.7869764, 0, 0, 0, 1, 1,
1.887934, -0.2944829, 0.9232419, 0, 0, 0, 1, 1,
1.900653, -0.03358348, -0.6622202, 0, 0, 0, 1, 1,
1.908642, 0.5932049, 0.6668311, 1, 1, 1, 1, 1,
1.937223, 1.172609, -0.7572038, 1, 1, 1, 1, 1,
1.969301, -2.319362, 0.8686798, 1, 1, 1, 1, 1,
1.970011, 0.03705363, 3.227343, 1, 1, 1, 1, 1,
1.995227, 0.2183457, 1.098468, 1, 1, 1, 1, 1,
2.013159, -0.7781076, 3.845459, 1, 1, 1, 1, 1,
2.03762, -0.5595762, 1.325133, 1, 1, 1, 1, 1,
2.042746, 1.105477, 1.000046, 1, 1, 1, 1, 1,
2.073253, 1.231067, 1.609337, 1, 1, 1, 1, 1,
2.102763, 1.382386, 0.8987173, 1, 1, 1, 1, 1,
2.103656, -1.728105, 1.473787, 1, 1, 1, 1, 1,
2.116306, 1.202559, -0.1566442, 1, 1, 1, 1, 1,
2.138032, 0.01112217, 0.8204904, 1, 1, 1, 1, 1,
2.156187, -0.9058607, 2.303812, 1, 1, 1, 1, 1,
2.17335, 1.618197, 0.4854536, 1, 1, 1, 1, 1,
2.198949, 0.3236753, 1.008832, 0, 0, 1, 1, 1,
2.203252, 0.5495397, 3.100581, 1, 0, 0, 1, 1,
2.212615, -1.96902, 3.774692, 1, 0, 0, 1, 1,
2.224476, -0.8090996, 1.082628, 1, 0, 0, 1, 1,
2.255233, -0.5672253, 2.605079, 1, 0, 0, 1, 1,
2.266458, 0.9128215, 2.45636, 1, 0, 0, 1, 1,
2.295171, 0.269099, 1.933901, 0, 0, 0, 1, 1,
2.305569, -0.4979017, 2.410372, 0, 0, 0, 1, 1,
2.306821, -0.04011445, 1.860415, 0, 0, 0, 1, 1,
2.328502, -0.9351261, 2.425927, 0, 0, 0, 1, 1,
2.437102, -0.7354349, 0.09032254, 0, 0, 0, 1, 1,
2.517069, 0.1838649, -0.00567243, 0, 0, 0, 1, 1,
2.520778, 0.1424149, 0.7097522, 0, 0, 0, 1, 1,
2.549419, 1.511377, 2.036119, 1, 1, 1, 1, 1,
2.564511, 0.4882571, 1.365067, 1, 1, 1, 1, 1,
2.60108, -1.088786, 0.2815389, 1, 1, 1, 1, 1,
2.691812, 1.832774, 0.7381509, 1, 1, 1, 1, 1,
2.874315, 0.2656724, 3.808959, 1, 1, 1, 1, 1,
2.90984, 0.06255134, 3.193185, 1, 1, 1, 1, 1,
2.950604, -0.6727535, 2.100784, 1, 1, 1, 1, 1
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
var radius = 9.480782;
var distance = 33.30084;
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
mvMatrix.translate( -0.02084315, -0.03355837, 0.4732907 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30084);
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
