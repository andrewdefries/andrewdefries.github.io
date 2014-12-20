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
-2.945158, -0.4241079, -0.9344884, 1, 0, 0, 1,
-2.840393, -0.938804, -0.7105688, 1, 0.007843138, 0, 1,
-2.798776, 1.356358, -0.9573247, 1, 0.01176471, 0, 1,
-2.682863, -0.9526234, -1.615175, 1, 0.01960784, 0, 1,
-2.626487, -0.2835449, -0.7547139, 1, 0.02352941, 0, 1,
-2.607815, 0.4579115, -1.672897, 1, 0.03137255, 0, 1,
-2.43244, -0.02661353, -1.070739, 1, 0.03529412, 0, 1,
-2.407469, 0.6832322, -2.228853, 1, 0.04313726, 0, 1,
-2.395076, 1.03679, -2.321257, 1, 0.04705882, 0, 1,
-2.379428, 1.884569, -0.592488, 1, 0.05490196, 0, 1,
-2.333366, -0.1327816, -1.034321, 1, 0.05882353, 0, 1,
-2.304547, -0.9740165, -1.512005, 1, 0.06666667, 0, 1,
-2.299935, 0.7281907, -2.616966, 1, 0.07058824, 0, 1,
-2.2932, 1.679661, -1.567641, 1, 0.07843138, 0, 1,
-2.175578, 0.3865194, -1.213405, 1, 0.08235294, 0, 1,
-2.159396, 0.7254465, -2.543521, 1, 0.09019608, 0, 1,
-2.1551, 0.6876134, -1.795344, 1, 0.09411765, 0, 1,
-2.106426, -1.3919, -3.249382, 1, 0.1019608, 0, 1,
-2.047058, -0.2636013, -2.013135, 1, 0.1098039, 0, 1,
-2.023882, -0.1211898, -0.3835169, 1, 0.1137255, 0, 1,
-2.008699, -0.02616118, -2.343171, 1, 0.1215686, 0, 1,
-1.977517, -0.2468141, 0.4652601, 1, 0.1254902, 0, 1,
-1.915492, 0.3936383, -1.871608, 1, 0.1333333, 0, 1,
-1.887926, -0.4496383, -1.595943, 1, 0.1372549, 0, 1,
-1.884442, 1.645787, -1.418009, 1, 0.145098, 0, 1,
-1.884324, -1.916357, -1.69677, 1, 0.1490196, 0, 1,
-1.880422, -0.6639008, -1.653908, 1, 0.1568628, 0, 1,
-1.865054, -0.01945559, -1.066291, 1, 0.1607843, 0, 1,
-1.861343, 0.4124631, -2.63404, 1, 0.1686275, 0, 1,
-1.847025, -0.1631762, -1.810198, 1, 0.172549, 0, 1,
-1.827187, 0.3595342, -0.996659, 1, 0.1803922, 0, 1,
-1.804393, 0.8161229, -0.8512558, 1, 0.1843137, 0, 1,
-1.804295, 1.015711, -1.446505, 1, 0.1921569, 0, 1,
-1.789423, 1.440406, -0.4105799, 1, 0.1960784, 0, 1,
-1.788267, -0.2690106, -1.806315, 1, 0.2039216, 0, 1,
-1.782495, 2.103794, -1.97305, 1, 0.2117647, 0, 1,
-1.76896, 2.217853, 0.4712195, 1, 0.2156863, 0, 1,
-1.759207, 0.9354366, -0.8729857, 1, 0.2235294, 0, 1,
-1.75554, 0.5332306, 0.8592479, 1, 0.227451, 0, 1,
-1.751733, -0.5587676, -2.057735, 1, 0.2352941, 0, 1,
-1.72388, 0.1386495, -0.9591315, 1, 0.2392157, 0, 1,
-1.713406, 0.8121713, 0.4312744, 1, 0.2470588, 0, 1,
-1.713014, -1.266181, -1.505084, 1, 0.2509804, 0, 1,
-1.709458, 0.8486752, -2.027461, 1, 0.2588235, 0, 1,
-1.699335, -0.1574378, -1.164323, 1, 0.2627451, 0, 1,
-1.696789, 0.8131824, -2.117218, 1, 0.2705882, 0, 1,
-1.695128, 1.250775, -2.440467, 1, 0.2745098, 0, 1,
-1.693126, -0.4051268, -1.476852, 1, 0.282353, 0, 1,
-1.664818, -0.3241935, -1.595434, 1, 0.2862745, 0, 1,
-1.65819, 0.7573753, -0.9722586, 1, 0.2941177, 0, 1,
-1.63309, -0.4688888, -1.846545, 1, 0.3019608, 0, 1,
-1.627948, -0.5408934, -3.279371, 1, 0.3058824, 0, 1,
-1.625138, 0.09813233, -1.615839, 1, 0.3137255, 0, 1,
-1.601767, 1.894354, -0.1545528, 1, 0.3176471, 0, 1,
-1.596018, 3.500054, 0.03792375, 1, 0.3254902, 0, 1,
-1.573517, -0.05340449, -0.6116269, 1, 0.3294118, 0, 1,
-1.566692, -0.7942286, -2.910959, 1, 0.3372549, 0, 1,
-1.554572, 0.891739, 0.1471759, 1, 0.3411765, 0, 1,
-1.553216, -1.183617, -3.295758, 1, 0.3490196, 0, 1,
-1.547421, -0.9588242, -1.738433, 1, 0.3529412, 0, 1,
-1.545966, -0.4540394, -1.527642, 1, 0.3607843, 0, 1,
-1.521099, 0.7608574, -0.2205157, 1, 0.3647059, 0, 1,
-1.512762, -0.5453506, -2.643661, 1, 0.372549, 0, 1,
-1.495292, -2.424699, -3.55013, 1, 0.3764706, 0, 1,
-1.489425, 0.2187068, -1.898554, 1, 0.3843137, 0, 1,
-1.482778, -0.01626659, -2.89718, 1, 0.3882353, 0, 1,
-1.477616, 0.1605814, -2.162805, 1, 0.3960784, 0, 1,
-1.47189, -1.041352, -1.621755, 1, 0.4039216, 0, 1,
-1.471231, -1.250013, -2.310257, 1, 0.4078431, 0, 1,
-1.459655, 0.7494923, -0.4774105, 1, 0.4156863, 0, 1,
-1.441182, 0.8408619, -1.061188, 1, 0.4196078, 0, 1,
-1.43936, 0.6231046, 0.1146158, 1, 0.427451, 0, 1,
-1.426026, -1.201545, -2.146876, 1, 0.4313726, 0, 1,
-1.409665, -0.5173702, -3.512386, 1, 0.4392157, 0, 1,
-1.388404, 0.2404427, 0.478498, 1, 0.4431373, 0, 1,
-1.372238, -0.220931, -1.558576, 1, 0.4509804, 0, 1,
-1.362699, 0.4254707, 0.01807252, 1, 0.454902, 0, 1,
-1.360016, 1.325026, -1.033823, 1, 0.4627451, 0, 1,
-1.345432, -0.9196672, -2.017457, 1, 0.4666667, 0, 1,
-1.342267, -0.282959, -2.819139, 1, 0.4745098, 0, 1,
-1.326888, 0.299491, -0.7447635, 1, 0.4784314, 0, 1,
-1.319452, -1.18703, -1.092124, 1, 0.4862745, 0, 1,
-1.313042, -1.039143, -2.509916, 1, 0.4901961, 0, 1,
-1.307751, -0.8270185, -2.376884, 1, 0.4980392, 0, 1,
-1.307003, 1.957697, -1.641897, 1, 0.5058824, 0, 1,
-1.306351, 1.082168, -0.6475103, 1, 0.509804, 0, 1,
-1.298736, -0.1500096, -1.53732, 1, 0.5176471, 0, 1,
-1.294491, -0.5488917, -2.612007, 1, 0.5215687, 0, 1,
-1.291924, -0.9382297, -0.896468, 1, 0.5294118, 0, 1,
-1.287327, 0.1570374, -0.1273806, 1, 0.5333334, 0, 1,
-1.27624, -1.641124, -1.854978, 1, 0.5411765, 0, 1,
-1.273468, 0.1823276, -2.550929, 1, 0.5450981, 0, 1,
-1.270228, -0.696755, -1.650473, 1, 0.5529412, 0, 1,
-1.268298, 0.6022731, -0.9428054, 1, 0.5568628, 0, 1,
-1.266958, -0.273147, -1.864257, 1, 0.5647059, 0, 1,
-1.260909, -0.1668026, -3.656234, 1, 0.5686275, 0, 1,
-1.258135, 0.1088574, -0.8696479, 1, 0.5764706, 0, 1,
-1.255719, 0.1641337, -1.435136, 1, 0.5803922, 0, 1,
-1.255693, -0.4448349, -3.867028, 1, 0.5882353, 0, 1,
-1.252863, -0.681663, -1.546283, 1, 0.5921569, 0, 1,
-1.244991, 1.311657, -0.01174422, 1, 0.6, 0, 1,
-1.243512, 0.1484244, -1.046476, 1, 0.6078432, 0, 1,
-1.243417, 0.5123825, -0.5319878, 1, 0.6117647, 0, 1,
-1.23656, -2.173082, -0.341309, 1, 0.6196079, 0, 1,
-1.224048, -1.057629, -0.3509907, 1, 0.6235294, 0, 1,
-1.223947, -0.1207453, -3.097499, 1, 0.6313726, 0, 1,
-1.2192, 0.009987565, -3.137457, 1, 0.6352941, 0, 1,
-1.212775, 0.02366148, -2.364549, 1, 0.6431373, 0, 1,
-1.209424, -1.965013, -1.828996, 1, 0.6470588, 0, 1,
-1.207098, 1.640267, -0.8565274, 1, 0.654902, 0, 1,
-1.204358, -2.311522, -2.735608, 1, 0.6588235, 0, 1,
-1.197361, 0.4976781, -0.8083593, 1, 0.6666667, 0, 1,
-1.175571, -0.9899547, -2.067528, 1, 0.6705883, 0, 1,
-1.170703, 0.2926382, -1.036509, 1, 0.6784314, 0, 1,
-1.16738, 0.1076612, -3.536099, 1, 0.682353, 0, 1,
-1.15238, 1.347633, -0.3112777, 1, 0.6901961, 0, 1,
-1.148271, 1.21287, -1.316353, 1, 0.6941177, 0, 1,
-1.145474, -0.3446116, -1.336365, 1, 0.7019608, 0, 1,
-1.143189, -1.320676, -1.150317, 1, 0.7098039, 0, 1,
-1.140782, -1.046566, -4.444751, 1, 0.7137255, 0, 1,
-1.134881, 0.1475444, -2.316211, 1, 0.7215686, 0, 1,
-1.133992, -0.3144339, -1.565279, 1, 0.7254902, 0, 1,
-1.133003, 0.3456524, -1.78179, 1, 0.7333333, 0, 1,
-1.108153, 0.2529241, -3.685735, 1, 0.7372549, 0, 1,
-1.106195, -0.09148634, -0.7834501, 1, 0.7450981, 0, 1,
-1.105206, -1.011337, -1.400737, 1, 0.7490196, 0, 1,
-1.098312, 1.448594, -0.6855434, 1, 0.7568628, 0, 1,
-1.097991, -1.541628, -3.976883, 1, 0.7607843, 0, 1,
-1.097143, 0.04894044, -3.542392, 1, 0.7686275, 0, 1,
-1.092765, -1.625796, -2.335893, 1, 0.772549, 0, 1,
-1.091691, -0.8663892, -2.428169, 1, 0.7803922, 0, 1,
-1.073059, -0.9786425, -1.555634, 1, 0.7843137, 0, 1,
-1.072891, 0.3223751, -1.195905, 1, 0.7921569, 0, 1,
-1.069076, -0.1941088, 0.1153587, 1, 0.7960784, 0, 1,
-1.068533, -0.01430077, -2.164096, 1, 0.8039216, 0, 1,
-1.064808, -0.6320754, -0.9637995, 1, 0.8117647, 0, 1,
-1.062873, -0.1857123, -1.671879, 1, 0.8156863, 0, 1,
-1.062515, -0.2582649, -1.923236, 1, 0.8235294, 0, 1,
-1.04446, 0.9682449, -0.3233803, 1, 0.827451, 0, 1,
-1.041883, -0.4977333, -3.770605, 1, 0.8352941, 0, 1,
-1.031679, 0.7113335, -0.8310766, 1, 0.8392157, 0, 1,
-1.026615, -2.339409, -1.51217, 1, 0.8470588, 0, 1,
-1.013324, 1.141534, -0.6516968, 1, 0.8509804, 0, 1,
-1.006625, -1.950752, -2.21269, 1, 0.8588235, 0, 1,
-1.005523, 0.9395831, -0.1061553, 1, 0.8627451, 0, 1,
-1.003193, -1.037925, -4.18622, 1, 0.8705882, 0, 1,
-1.001199, 1.344038, -2.328382, 1, 0.8745098, 0, 1,
-0.9892155, 0.1820069, -1.429322, 1, 0.8823529, 0, 1,
-0.986941, 0.4000979, -2.875694, 1, 0.8862745, 0, 1,
-0.9854069, 2.340015, -0.1620419, 1, 0.8941177, 0, 1,
-0.9854027, -0.3389935, -3.106908, 1, 0.8980392, 0, 1,
-0.9841744, -0.2724264, -2.397381, 1, 0.9058824, 0, 1,
-0.9832809, 0.8429609, -0.01897408, 1, 0.9137255, 0, 1,
-0.9812105, 0.8473022, -2.537559, 1, 0.9176471, 0, 1,
-0.9801162, 0.4298777, -0.9620638, 1, 0.9254902, 0, 1,
-0.9757523, -0.3728794, -1.664471, 1, 0.9294118, 0, 1,
-0.9662511, 1.104446, 0.1122192, 1, 0.9372549, 0, 1,
-0.960903, 0.6511867, -0.1853548, 1, 0.9411765, 0, 1,
-0.9584312, -1.705687, -2.92674, 1, 0.9490196, 0, 1,
-0.9556251, 0.1926365, -0.4410084, 1, 0.9529412, 0, 1,
-0.9504373, -0.836236, -3.297979, 1, 0.9607843, 0, 1,
-0.9487826, 1.104906, -1.168403, 1, 0.9647059, 0, 1,
-0.9400556, -0.2137712, -0.966804, 1, 0.972549, 0, 1,
-0.938494, 1.247304, -1.320179, 1, 0.9764706, 0, 1,
-0.9377379, 0.4542933, -2.014933, 1, 0.9843137, 0, 1,
-0.9314637, 1.286411, -0.8175057, 1, 0.9882353, 0, 1,
-0.9307932, -0.7437264, -0.0125763, 1, 0.9960784, 0, 1,
-0.9293069, 1.894026, -0.6893336, 0.9960784, 1, 0, 1,
-0.9270962, -0.2899733, -1.480091, 0.9921569, 1, 0, 1,
-0.9177503, 0.1850771, 0.1490741, 0.9843137, 1, 0, 1,
-0.915458, -0.05091101, -1.025656, 0.9803922, 1, 0, 1,
-0.9113212, 0.8755983, -0.3776373, 0.972549, 1, 0, 1,
-0.9112511, -1.680369, -2.471854, 0.9686275, 1, 0, 1,
-0.9083295, -0.6744364, -1.354986, 0.9607843, 1, 0, 1,
-0.9072274, 0.1805252, 0.2631271, 0.9568627, 1, 0, 1,
-0.8936722, -1.085797, -2.263411, 0.9490196, 1, 0, 1,
-0.892555, -1.260717, -2.675637, 0.945098, 1, 0, 1,
-0.8865976, -0.132313, -1.709127, 0.9372549, 1, 0, 1,
-0.8862057, -0.4853485, -2.427446, 0.9333333, 1, 0, 1,
-0.8834258, 0.5317542, -1.671858, 0.9254902, 1, 0, 1,
-0.8827613, -0.4919836, -1.371736, 0.9215686, 1, 0, 1,
-0.881158, -0.6742277, -3.165141, 0.9137255, 1, 0, 1,
-0.8761505, -0.6025375, -3.127481, 0.9098039, 1, 0, 1,
-0.8617641, -1.178646, -1.536642, 0.9019608, 1, 0, 1,
-0.8593826, 0.8001798, -0.5670247, 0.8941177, 1, 0, 1,
-0.8524719, 0.9395161, 0.06655817, 0.8901961, 1, 0, 1,
-0.8490611, -0.5228002, -1.802159, 0.8823529, 1, 0, 1,
-0.8431146, 0.4397635, -0.07621359, 0.8784314, 1, 0, 1,
-0.841025, 0.6342903, -0.7302803, 0.8705882, 1, 0, 1,
-0.8409862, -0.1208694, -1.880772, 0.8666667, 1, 0, 1,
-0.8318459, -1.183105, -2.734832, 0.8588235, 1, 0, 1,
-0.8310491, 0.7288595, -0.8754087, 0.854902, 1, 0, 1,
-0.8263494, -0.1965808, -3.235452, 0.8470588, 1, 0, 1,
-0.823226, 1.436517, 0.6328076, 0.8431373, 1, 0, 1,
-0.812135, -0.2948977, -0.6373158, 0.8352941, 1, 0, 1,
-0.8089969, 1.811759, -1.473594, 0.8313726, 1, 0, 1,
-0.8035071, 0.9260163, -0.6154836, 0.8235294, 1, 0, 1,
-0.8027392, -0.7259467, -2.520376, 0.8196079, 1, 0, 1,
-0.8015482, 0.796019, -1.090606, 0.8117647, 1, 0, 1,
-0.8010244, 0.07441588, -2.516246, 0.8078431, 1, 0, 1,
-0.7984589, -1.831111, -1.616482, 0.8, 1, 0, 1,
-0.7968336, 0.9388247, -0.9746936, 0.7921569, 1, 0, 1,
-0.7927935, 0.3588729, -2.304772, 0.7882353, 1, 0, 1,
-0.791102, 0.6303824, -1.091403, 0.7803922, 1, 0, 1,
-0.7898087, 1.522595, -0.738888, 0.7764706, 1, 0, 1,
-0.7878745, -0.1113412, -3.503658, 0.7686275, 1, 0, 1,
-0.7867402, 1.550116, -0.5809564, 0.7647059, 1, 0, 1,
-0.7851566, -0.1598021, -3.248328, 0.7568628, 1, 0, 1,
-0.7825931, 1.198633, -0.5275885, 0.7529412, 1, 0, 1,
-0.7813727, 2.448954, -0.9494191, 0.7450981, 1, 0, 1,
-0.777695, -2.537568, -3.434465, 0.7411765, 1, 0, 1,
-0.7740835, 0.2320566, -1.483456, 0.7333333, 1, 0, 1,
-0.7736949, 1.311996, -0.8462887, 0.7294118, 1, 0, 1,
-0.7721967, 0.1451736, -2.072084, 0.7215686, 1, 0, 1,
-0.7713208, -0.2483275, -3.764727, 0.7176471, 1, 0, 1,
-0.7642175, 1.036375, -1.037257, 0.7098039, 1, 0, 1,
-0.7625192, 0.7582179, -0.4851413, 0.7058824, 1, 0, 1,
-0.7619292, -1.335558, -1.348877, 0.6980392, 1, 0, 1,
-0.7617245, 0.04058918, -1.56066, 0.6901961, 1, 0, 1,
-0.7602075, 0.3634421, -2.435648, 0.6862745, 1, 0, 1,
-0.7551996, 0.453761, -1.59545, 0.6784314, 1, 0, 1,
-0.7497262, -0.541527, -3.355459, 0.6745098, 1, 0, 1,
-0.7468359, -1.174636, -1.57907, 0.6666667, 1, 0, 1,
-0.7439464, -1.361125, -3.070159, 0.6627451, 1, 0, 1,
-0.7437618, -0.6029422, -2.58839, 0.654902, 1, 0, 1,
-0.7426066, 1.477768, -0.07329208, 0.6509804, 1, 0, 1,
-0.7423409, 0.749786, 0.300745, 0.6431373, 1, 0, 1,
-0.7416621, 1.59314, 0.9204279, 0.6392157, 1, 0, 1,
-0.7341705, 1.748329, -0.03323854, 0.6313726, 1, 0, 1,
-0.7323596, 0.8526992, -0.04038619, 0.627451, 1, 0, 1,
-0.7323508, 0.9045729, -0.07658312, 0.6196079, 1, 0, 1,
-0.7303203, 0.5645317, -1.010295, 0.6156863, 1, 0, 1,
-0.729697, -0.005819586, -1.545786, 0.6078432, 1, 0, 1,
-0.7288725, 0.1544144, -0.04238519, 0.6039216, 1, 0, 1,
-0.7167353, 0.3022411, -1.498559, 0.5960785, 1, 0, 1,
-0.713874, -0.1893034, -2.892794, 0.5882353, 1, 0, 1,
-0.7134873, 1.682584, -0.6417384, 0.5843138, 1, 0, 1,
-0.6998895, -0.8713059, -3.20393, 0.5764706, 1, 0, 1,
-0.6968595, -0.2581805, -1.774275, 0.572549, 1, 0, 1,
-0.6961426, -0.2050133, -1.630881, 0.5647059, 1, 0, 1,
-0.6952589, -0.9565727, -2.543412, 0.5607843, 1, 0, 1,
-0.6932593, 1.351779, -1.234091, 0.5529412, 1, 0, 1,
-0.6884186, -0.2661888, -3.005614, 0.5490196, 1, 0, 1,
-0.6680695, -0.1328808, -1.656869, 0.5411765, 1, 0, 1,
-0.6654715, 0.6764592, -0.03756829, 0.5372549, 1, 0, 1,
-0.6625556, -0.9742836, -2.559277, 0.5294118, 1, 0, 1,
-0.6615212, -1.794919, -2.632982, 0.5254902, 1, 0, 1,
-0.6600724, -0.7393328, -3.136352, 0.5176471, 1, 0, 1,
-0.6600719, -1.133394, -3.22846, 0.5137255, 1, 0, 1,
-0.6584885, -0.1124488, -0.7329099, 0.5058824, 1, 0, 1,
-0.6546409, 0.2986605, -1.303305, 0.5019608, 1, 0, 1,
-0.6511173, 0.4651591, -2.571213, 0.4941176, 1, 0, 1,
-0.6444812, -0.8222759, -1.254583, 0.4862745, 1, 0, 1,
-0.6421239, -2.555633, -3.979427, 0.4823529, 1, 0, 1,
-0.6414988, -1.848231, -2.218886, 0.4745098, 1, 0, 1,
-0.640982, -1.136714, -3.314995, 0.4705882, 1, 0, 1,
-0.640891, 0.1746782, -0.8591678, 0.4627451, 1, 0, 1,
-0.6388446, -0.4778114, -0.277848, 0.4588235, 1, 0, 1,
-0.6353562, 1.572459, -0.968401, 0.4509804, 1, 0, 1,
-0.6311272, 0.4363543, 0.3401512, 0.4470588, 1, 0, 1,
-0.6271747, -0.08832587, -3.312183, 0.4392157, 1, 0, 1,
-0.6234046, 1.30832, -0.6713178, 0.4352941, 1, 0, 1,
-0.620567, 1.215138, 1.045316, 0.427451, 1, 0, 1,
-0.6197917, 0.9587629, -0.5614951, 0.4235294, 1, 0, 1,
-0.6174352, -0.09249043, -0.996942, 0.4156863, 1, 0, 1,
-0.606674, 0.7448223, -2.334331, 0.4117647, 1, 0, 1,
-0.6034597, -0.7025723, -2.764096, 0.4039216, 1, 0, 1,
-0.6034504, 1.208441, 0.6928743, 0.3960784, 1, 0, 1,
-0.6032509, 0.9512256, -3.250275, 0.3921569, 1, 0, 1,
-0.6027839, -1.462514, -4.503649, 0.3843137, 1, 0, 1,
-0.602585, 1.444865, -0.5909945, 0.3803922, 1, 0, 1,
-0.601772, -1.641515, -1.850889, 0.372549, 1, 0, 1,
-0.6015052, -0.4944165, -2.50218, 0.3686275, 1, 0, 1,
-0.600525, -0.8258227, -1.011065, 0.3607843, 1, 0, 1,
-0.5922539, -1.13388, -3.834494, 0.3568628, 1, 0, 1,
-0.5918375, 0.9177539, -1.576974, 0.3490196, 1, 0, 1,
-0.5889388, 0.1533728, -1.153058, 0.345098, 1, 0, 1,
-0.5881057, -0.04464078, 0.5241703, 0.3372549, 1, 0, 1,
-0.5833454, -1.662521, -3.708032, 0.3333333, 1, 0, 1,
-0.5756435, 1.166031, 0.2074308, 0.3254902, 1, 0, 1,
-0.5714391, 0.1710749, -3.03727, 0.3215686, 1, 0, 1,
-0.563831, 1.730955, 0.7818927, 0.3137255, 1, 0, 1,
-0.5577952, 0.3737682, -0.5631573, 0.3098039, 1, 0, 1,
-0.5556135, 0.1342252, -1.206398, 0.3019608, 1, 0, 1,
-0.5555075, -0.0187201, -0.4900886, 0.2941177, 1, 0, 1,
-0.554401, 1.453599, 0.2814127, 0.2901961, 1, 0, 1,
-0.5533295, -0.6432149, -2.81661, 0.282353, 1, 0, 1,
-0.550401, -0.09808111, -1.850209, 0.2784314, 1, 0, 1,
-0.5502477, 1.244953, -0.8258646, 0.2705882, 1, 0, 1,
-0.5486696, -1.570345, -3.870459, 0.2666667, 1, 0, 1,
-0.54654, -0.4531403, -2.479553, 0.2588235, 1, 0, 1,
-0.5461765, -0.1784288, -1.851759, 0.254902, 1, 0, 1,
-0.5442892, 0.2264685, -2.397279, 0.2470588, 1, 0, 1,
-0.5421953, -0.8786201, -4.720202, 0.2431373, 1, 0, 1,
-0.5408754, -0.3027744, -0.7788158, 0.2352941, 1, 0, 1,
-0.5386149, -0.8417704, -1.341947, 0.2313726, 1, 0, 1,
-0.5383106, -1.596049, -2.071309, 0.2235294, 1, 0, 1,
-0.5346274, -0.1778362, -1.729284, 0.2196078, 1, 0, 1,
-0.5320048, -2.130913, -3.757962, 0.2117647, 1, 0, 1,
-0.5289196, 2.343802, -0.3737881, 0.2078431, 1, 0, 1,
-0.5286633, -0.5927519, -0.8493963, 0.2, 1, 0, 1,
-0.5256068, -1.191252, -3.594043, 0.1921569, 1, 0, 1,
-0.5238637, 0.1715632, -1.273896, 0.1882353, 1, 0, 1,
-0.5215319, -1.529958, -4.941931, 0.1803922, 1, 0, 1,
-0.5200779, -0.0952803, 1.096879, 0.1764706, 1, 0, 1,
-0.5188202, -1.875332, -3.569696, 0.1686275, 1, 0, 1,
-0.5132012, 1.095725, 0.1951003, 0.1647059, 1, 0, 1,
-0.4964287, 2.112928, -0.2358885, 0.1568628, 1, 0, 1,
-0.4954118, -0.7290281, -2.689541, 0.1529412, 1, 0, 1,
-0.4950018, -0.11195, -1.380351, 0.145098, 1, 0, 1,
-0.4894123, 0.05200191, -0.5596358, 0.1411765, 1, 0, 1,
-0.4852536, -1.107452, -3.055743, 0.1333333, 1, 0, 1,
-0.4817616, 0.5538901, -0.6840894, 0.1294118, 1, 0, 1,
-0.4810706, -0.165381, -0.9659994, 0.1215686, 1, 0, 1,
-0.4797266, 0.841145, 1.392378, 0.1176471, 1, 0, 1,
-0.4777407, 0.6329428, -1.582859, 0.1098039, 1, 0, 1,
-0.4739749, 0.4021364, -1.029877, 0.1058824, 1, 0, 1,
-0.4673854, 0.9395367, -0.8305125, 0.09803922, 1, 0, 1,
-0.4600276, 0.2504119, -1.28933, 0.09019608, 1, 0, 1,
-0.4596149, -0.4742897, -4.035968, 0.08627451, 1, 0, 1,
-0.4544973, -0.0787563, -1.049363, 0.07843138, 1, 0, 1,
-0.4533994, 0.8172202, -0.5732615, 0.07450981, 1, 0, 1,
-0.4518245, -1.110725, -2.673736, 0.06666667, 1, 0, 1,
-0.4507453, -1.203379, -1.792447, 0.0627451, 1, 0, 1,
-0.4506653, -2.264808, -0.4199646, 0.05490196, 1, 0, 1,
-0.4495943, -0.6189876, -2.139443, 0.05098039, 1, 0, 1,
-0.4462833, 0.2173584, -3.664211, 0.04313726, 1, 0, 1,
-0.4447252, -0.2134044, -1.676632, 0.03921569, 1, 0, 1,
-0.4430255, -0.4814112, -2.140318, 0.03137255, 1, 0, 1,
-0.4410674, 1.547157, -0.8530372, 0.02745098, 1, 0, 1,
-0.4394072, -2.170984, -1.783121, 0.01960784, 1, 0, 1,
-0.4384299, -2.034062, -3.465326, 0.01568628, 1, 0, 1,
-0.4384263, -0.2691552, -1.695463, 0.007843138, 1, 0, 1,
-0.4327713, 0.0400513, -1.368362, 0.003921569, 1, 0, 1,
-0.4279857, 1.155853, -0.3767025, 0, 1, 0.003921569, 1,
-0.4169673, 0.8953983, 1.142106, 0, 1, 0.01176471, 1,
-0.4161378, 0.6533696, -0.6068852, 0, 1, 0.01568628, 1,
-0.4146717, -0.8553036, -3.27047, 0, 1, 0.02352941, 1,
-0.4076149, -0.6469386, -4.699097, 0, 1, 0.02745098, 1,
-0.4021751, -0.6482117, -3.085578, 0, 1, 0.03529412, 1,
-0.4020338, -0.7063908, -2.100899, 0, 1, 0.03921569, 1,
-0.3992746, -0.5121659, -3.09295, 0, 1, 0.04705882, 1,
-0.3921005, -1.011679, -2.965821, 0, 1, 0.05098039, 1,
-0.3871464, 0.1435721, -1.513799, 0, 1, 0.05882353, 1,
-0.3869617, -0.8929984, -2.313493, 0, 1, 0.0627451, 1,
-0.3835295, 0.3224304, -0.9590845, 0, 1, 0.07058824, 1,
-0.3787291, -0.1172668, -2.438392, 0, 1, 0.07450981, 1,
-0.37644, -0.4158724, -2.745317, 0, 1, 0.08235294, 1,
-0.3753752, -1.303569, -2.372361, 0, 1, 0.08627451, 1,
-0.3724596, -0.2545204, -3.232048, 0, 1, 0.09411765, 1,
-0.3680055, -0.3906637, -0.746305, 0, 1, 0.1019608, 1,
-0.3550421, -0.05829436, -1.90857, 0, 1, 0.1058824, 1,
-0.3522472, -2.563379, -4.391364, 0, 1, 0.1137255, 1,
-0.351713, -0.5602685, -2.724883, 0, 1, 0.1176471, 1,
-0.3504936, 1.187173, -0.86831, 0, 1, 0.1254902, 1,
-0.3488546, 0.8335754, 0.829509, 0, 1, 0.1294118, 1,
-0.3478994, -0.6759437, -2.255795, 0, 1, 0.1372549, 1,
-0.347413, -0.5588311, -2.78245, 0, 1, 0.1411765, 1,
-0.3459259, -0.489439, -0.2220094, 0, 1, 0.1490196, 1,
-0.3456392, -0.7667723, -2.87197, 0, 1, 0.1529412, 1,
-0.3445468, 0.003909888, -2.453864, 0, 1, 0.1607843, 1,
-0.3427329, 0.588301, 0.0680549, 0, 1, 0.1647059, 1,
-0.339498, -0.5936643, -1.991163, 0, 1, 0.172549, 1,
-0.3380367, -1.078928, -4.253195, 0, 1, 0.1764706, 1,
-0.3295577, -0.2494372, -4.0071, 0, 1, 0.1843137, 1,
-0.3283255, -1.513893, -4.345797, 0, 1, 0.1882353, 1,
-0.3262451, 1.322729, -1.205475, 0, 1, 0.1960784, 1,
-0.3217365, -0.5654137, -3.631575, 0, 1, 0.2039216, 1,
-0.3144642, -0.4817231, -2.716344, 0, 1, 0.2078431, 1,
-0.3070686, 0.7553721, 1.177759, 0, 1, 0.2156863, 1,
-0.3044267, -0.5266098, -2.763238, 0, 1, 0.2196078, 1,
-0.3042647, 0.8581581, -1.069898, 0, 1, 0.227451, 1,
-0.3041329, -1.460938, -4.954824, 0, 1, 0.2313726, 1,
-0.3030724, -1.468111, -1.87748, 0, 1, 0.2392157, 1,
-0.3013706, 0.7354755, 0.7341185, 0, 1, 0.2431373, 1,
-0.3007543, -0.8742877, -1.832875, 0, 1, 0.2509804, 1,
-0.299978, 0.4108625, -0.6283395, 0, 1, 0.254902, 1,
-0.2928399, 0.1275814, -1.499951, 0, 1, 0.2627451, 1,
-0.2922469, 0.7030695, -0.3365949, 0, 1, 0.2666667, 1,
-0.2921744, -0.8984547, -3.420019, 0, 1, 0.2745098, 1,
-0.2898896, 0.1977767, -0.605822, 0, 1, 0.2784314, 1,
-0.2887921, 0.3176082, -1.299037, 0, 1, 0.2862745, 1,
-0.2881917, -0.9007972, -3.005462, 0, 1, 0.2901961, 1,
-0.2857272, 0.3532707, -1.113014, 0, 1, 0.2980392, 1,
-0.2838756, -0.9385512, -4.394997, 0, 1, 0.3058824, 1,
-0.2838008, -0.5164278, -2.354376, 0, 1, 0.3098039, 1,
-0.2818451, -0.9166257, -2.60355, 0, 1, 0.3176471, 1,
-0.2747664, -0.08854286, -2.786047, 0, 1, 0.3215686, 1,
-0.27218, -0.6353568, -0.4517055, 0, 1, 0.3294118, 1,
-0.26894, 0.8107178, 0.417436, 0, 1, 0.3333333, 1,
-0.2674669, -1.280949, -3.47589, 0, 1, 0.3411765, 1,
-0.2643243, -1.107802, -4.701795, 0, 1, 0.345098, 1,
-0.2593265, 1.219213, 0.06595146, 0, 1, 0.3529412, 1,
-0.2581141, -0.3720053, -0.5436467, 0, 1, 0.3568628, 1,
-0.2548524, -1.922077, -2.286786, 0, 1, 0.3647059, 1,
-0.2547165, 0.9963113, -0.6633112, 0, 1, 0.3686275, 1,
-0.2533762, 0.01492263, -2.963962, 0, 1, 0.3764706, 1,
-0.2528089, -0.8287174, -2.848204, 0, 1, 0.3803922, 1,
-0.2508081, 0.1533779, 1.137172, 0, 1, 0.3882353, 1,
-0.2463679, -1.210205, -2.330898, 0, 1, 0.3921569, 1,
-0.2457121, -0.3246925, -2.997092, 0, 1, 0.4, 1,
-0.2454462, 0.311905, 0.257023, 0, 1, 0.4078431, 1,
-0.2445065, -1.309795, -2.895877, 0, 1, 0.4117647, 1,
-0.2416978, -2.67391, -2.874283, 0, 1, 0.4196078, 1,
-0.2409042, 0.9977205, 0.5972052, 0, 1, 0.4235294, 1,
-0.2404269, 2.770202, -1.919541, 0, 1, 0.4313726, 1,
-0.2292184, 1.282786, -0.9569661, 0, 1, 0.4352941, 1,
-0.2256052, 0.005363227, -1.333804, 0, 1, 0.4431373, 1,
-0.2218954, 0.1115553, -2.190591, 0, 1, 0.4470588, 1,
-0.2213543, 0.4877917, -0.2723245, 0, 1, 0.454902, 1,
-0.2209864, 0.912851, 0.3330187, 0, 1, 0.4588235, 1,
-0.218162, 0.6414424, -0.2515089, 0, 1, 0.4666667, 1,
-0.217305, 0.1839648, 1.127187, 0, 1, 0.4705882, 1,
-0.2138975, -1.006925, -1.977795, 0, 1, 0.4784314, 1,
-0.2106118, -0.5808837, -3.468647, 0, 1, 0.4823529, 1,
-0.207319, 0.2357418, -0.06362454, 0, 1, 0.4901961, 1,
-0.2065988, 1.106192, -0.1149302, 0, 1, 0.4941176, 1,
-0.2059827, 0.4417737, 1.106535, 0, 1, 0.5019608, 1,
-0.2040447, 0.8153912, -0.982338, 0, 1, 0.509804, 1,
-0.1999637, 1.426531, -0.09879738, 0, 1, 0.5137255, 1,
-0.1943456, -2.26945, -2.312374, 0, 1, 0.5215687, 1,
-0.1931414, 0.446499, -0.9002243, 0, 1, 0.5254902, 1,
-0.1926586, 0.7805241, 1.275893, 0, 1, 0.5333334, 1,
-0.1870542, -0.3523774, -3.560687, 0, 1, 0.5372549, 1,
-0.1867484, -1.575426, -3.020157, 0, 1, 0.5450981, 1,
-0.1819085, -1.162066, -0.2843746, 0, 1, 0.5490196, 1,
-0.1819069, -1.671655, -1.724603, 0, 1, 0.5568628, 1,
-0.1793006, -1.0389, -2.114009, 0, 1, 0.5607843, 1,
-0.1730797, 0.0007768327, -3.248285, 0, 1, 0.5686275, 1,
-0.1727666, 0.8158663, -0.8502489, 0, 1, 0.572549, 1,
-0.1715845, -0.8593277, -3.001755, 0, 1, 0.5803922, 1,
-0.1713071, 0.2631227, -1.0184, 0, 1, 0.5843138, 1,
-0.1679494, -0.381727, -2.286194, 0, 1, 0.5921569, 1,
-0.164025, 0.1682512, -0.9152523, 0, 1, 0.5960785, 1,
-0.1609229, -0.2517441, -4.081261, 0, 1, 0.6039216, 1,
-0.1586476, -0.3187004, -1.598412, 0, 1, 0.6117647, 1,
-0.1512441, -0.3731391, -1.722629, 0, 1, 0.6156863, 1,
-0.1398022, -0.9525857, -3.580343, 0, 1, 0.6235294, 1,
-0.1358423, -0.2452867, -3.748408, 0, 1, 0.627451, 1,
-0.1333724, 0.3971573, -0.1360923, 0, 1, 0.6352941, 1,
-0.1324898, 1.728476, -0.09872501, 0, 1, 0.6392157, 1,
-0.131312, -0.5506171, -3.241914, 0, 1, 0.6470588, 1,
-0.1292765, 0.5973811, -0.9611313, 0, 1, 0.6509804, 1,
-0.1257951, 0.7160857, 0.9028854, 0, 1, 0.6588235, 1,
-0.1227758, 1.101061, -0.1095772, 0, 1, 0.6627451, 1,
-0.1217698, 0.5215924, 0.1133961, 0, 1, 0.6705883, 1,
-0.1214922, 0.6947113, 1.837671, 0, 1, 0.6745098, 1,
-0.121269, -0.02552855, -2.365088, 0, 1, 0.682353, 1,
-0.1211268, 1.695986, -0.1436987, 0, 1, 0.6862745, 1,
-0.1184527, -1.353065, -3.64957, 0, 1, 0.6941177, 1,
-0.1149621, -1.276442, -4.540326, 0, 1, 0.7019608, 1,
-0.1142461, 1.168485, -1.670176, 0, 1, 0.7058824, 1,
-0.1134382, -0.3537506, -1.345316, 0, 1, 0.7137255, 1,
-0.1130961, -0.6003665, -1.010947, 0, 1, 0.7176471, 1,
-0.1114628, 0.9786605, -1.153682, 0, 1, 0.7254902, 1,
-0.1111731, 0.6629422, -0.09417519, 0, 1, 0.7294118, 1,
-0.1101563, 0.6347075, 0.3438247, 0, 1, 0.7372549, 1,
-0.1099196, -0.4335359, -2.541012, 0, 1, 0.7411765, 1,
-0.1077376, 0.06259901, -0.8639363, 0, 1, 0.7490196, 1,
-0.1047491, -1.358772, -3.155598, 0, 1, 0.7529412, 1,
-0.1026167, 1.155663, 0.2165572, 0, 1, 0.7607843, 1,
-0.0937201, 1.150464, 0.4402828, 0, 1, 0.7647059, 1,
-0.09114131, 0.02882788, -1.076658, 0, 1, 0.772549, 1,
-0.08972, 1.280421, 0.1774813, 0, 1, 0.7764706, 1,
-0.08820142, 0.7593107, 0.1455359, 0, 1, 0.7843137, 1,
-0.08572034, 1.646772, -0.09422059, 0, 1, 0.7882353, 1,
-0.08513252, 0.834785, -0.3831996, 0, 1, 0.7960784, 1,
-0.08155609, -0.2986794, -3.006845, 0, 1, 0.8039216, 1,
-0.0766165, 0.4923835, -0.4986145, 0, 1, 0.8078431, 1,
-0.0758796, -1.170663, -2.618357, 0, 1, 0.8156863, 1,
-0.07533709, -1.073249, -3.036294, 0, 1, 0.8196079, 1,
-0.07316146, -0.03563035, -3.491177, 0, 1, 0.827451, 1,
-0.07196137, 0.0005878194, -3.247889, 0, 1, 0.8313726, 1,
-0.06414606, -0.6822575, -2.663103, 0, 1, 0.8392157, 1,
-0.06196186, -0.2687094, -3.418447, 0, 1, 0.8431373, 1,
-0.06039783, -0.0119126, -2.956178, 0, 1, 0.8509804, 1,
-0.05415886, 0.5880274, -0.1520395, 0, 1, 0.854902, 1,
-0.05192584, -1.721386, -3.919556, 0, 1, 0.8627451, 1,
-0.04970372, 0.6929287, -1.730177, 0, 1, 0.8666667, 1,
-0.04866802, -0.3235487, -1.169217, 0, 1, 0.8745098, 1,
-0.04588236, 0.7868625, -2.327337, 0, 1, 0.8784314, 1,
-0.04316547, -0.541543, -3.532906, 0, 1, 0.8862745, 1,
-0.0388451, 0.6117271, 0.1045484, 0, 1, 0.8901961, 1,
-0.03859933, -0.04600857, -1.287015, 0, 1, 0.8980392, 1,
-0.03757373, -1.14239, -3.455128, 0, 1, 0.9058824, 1,
-0.03395396, -1.450452, -2.432348, 0, 1, 0.9098039, 1,
-0.03371383, -0.1606607, -3.77449, 0, 1, 0.9176471, 1,
-0.03348422, 0.758535, 0.07612669, 0, 1, 0.9215686, 1,
-0.02290483, -0.2086595, -3.901062, 0, 1, 0.9294118, 1,
-0.02070768, -0.02024277, -2.703182, 0, 1, 0.9333333, 1,
-0.01881345, -2.011017, -2.23111, 0, 1, 0.9411765, 1,
-0.01637406, -0.0827417, -0.7818801, 0, 1, 0.945098, 1,
-0.01300602, 0.6590617, 1.184931, 0, 1, 0.9529412, 1,
-0.007588111, 0.6928614, -0.4826989, 0, 1, 0.9568627, 1,
0.002552721, -1.508526, 1.528685, 0, 1, 0.9647059, 1,
0.003689599, 0.3245221, 0.5421752, 0, 1, 0.9686275, 1,
0.007947774, 0.7242401, -0.5837284, 0, 1, 0.9764706, 1,
0.007994241, -0.3474195, 1.037428, 0, 1, 0.9803922, 1,
0.008869907, 0.5669265, -0.9430371, 0, 1, 0.9882353, 1,
0.009004965, 0.9748046, 0.5176159, 0, 1, 0.9921569, 1,
0.01498365, -0.1296377, 2.511956, 0, 1, 1, 1,
0.020446, 1.574981, -1.120708, 0, 0.9921569, 1, 1,
0.02149044, -1.784703, 2.704076, 0, 0.9882353, 1, 1,
0.02182646, -0.1159691, 3.219314, 0, 0.9803922, 1, 1,
0.02399268, 0.6657758, -0.1168564, 0, 0.9764706, 1, 1,
0.02798974, 0.1409447, 0.8973901, 0, 0.9686275, 1, 1,
0.02805114, 0.9333814, -1.571215, 0, 0.9647059, 1, 1,
0.03454687, 0.8919213, 0.07373047, 0, 0.9568627, 1, 1,
0.03789125, -1.0768, 3.833051, 0, 0.9529412, 1, 1,
0.04000461, -0.840358, 1.29291, 0, 0.945098, 1, 1,
0.04029294, 0.07288568, 0.4022624, 0, 0.9411765, 1, 1,
0.04182518, 0.3328879, -0.2272661, 0, 0.9333333, 1, 1,
0.0435512, -0.8159633, 3.85908, 0, 0.9294118, 1, 1,
0.04712882, 0.5244577, -1.714751, 0, 0.9215686, 1, 1,
0.04755073, 1.283675, -2.604556, 0, 0.9176471, 1, 1,
0.04808048, 0.3071095, -0.2043023, 0, 0.9098039, 1, 1,
0.0494665, 0.4776531, -0.8726239, 0, 0.9058824, 1, 1,
0.05261162, -1.205459, 2.736434, 0, 0.8980392, 1, 1,
0.05310703, -1.184996, 1.017294, 0, 0.8901961, 1, 1,
0.0563915, -1.474002, 3.589313, 0, 0.8862745, 1, 1,
0.05909308, -0.7580609, 2.811423, 0, 0.8784314, 1, 1,
0.05909701, -0.4961017, 3.817046, 0, 0.8745098, 1, 1,
0.06212984, -0.4272659, 6.015374, 0, 0.8666667, 1, 1,
0.06223538, -0.6420287, 2.849174, 0, 0.8627451, 1, 1,
0.0640478, -2.387098, 3.917052, 0, 0.854902, 1, 1,
0.07117674, 1.599542, -1.046834, 0, 0.8509804, 1, 1,
0.07699791, -0.3906402, 3.406863, 0, 0.8431373, 1, 1,
0.08319402, 1.025495, -1.000936, 0, 0.8392157, 1, 1,
0.08369699, -0.005282312, 0.569744, 0, 0.8313726, 1, 1,
0.08654898, -0.481906, 2.222981, 0, 0.827451, 1, 1,
0.09025187, -2.405447, 3.973799, 0, 0.8196079, 1, 1,
0.09057181, -0.8608317, 2.935133, 0, 0.8156863, 1, 1,
0.09319019, 0.2538007, -0.4590912, 0, 0.8078431, 1, 1,
0.09519115, -1.132874, 3.014922, 0, 0.8039216, 1, 1,
0.09520455, -0.2743446, 3.392905, 0, 0.7960784, 1, 1,
0.09550842, 0.5934738, -0.2326214, 0, 0.7882353, 1, 1,
0.09790081, 0.1318109, -0.1390199, 0, 0.7843137, 1, 1,
0.0992107, 1.641888, 0.9801235, 0, 0.7764706, 1, 1,
0.1036056, 0.2544912, 3.131115, 0, 0.772549, 1, 1,
0.1090076, 0.5637172, 0.7478555, 0, 0.7647059, 1, 1,
0.109409, -1.136908, 2.70498, 0, 0.7607843, 1, 1,
0.1107305, -0.2876176, 1.173724, 0, 0.7529412, 1, 1,
0.1108786, 0.3242546, 1.837633, 0, 0.7490196, 1, 1,
0.1154123, 1.686647, 0.4758382, 0, 0.7411765, 1, 1,
0.1154288, 0.260577, -0.1333155, 0, 0.7372549, 1, 1,
0.1238709, 0.4959834, -0.7802899, 0, 0.7294118, 1, 1,
0.1295929, 1.23551, 1.035635, 0, 0.7254902, 1, 1,
0.1297257, 0.6577938, -0.4968787, 0, 0.7176471, 1, 1,
0.1303051, -0.4356073, 4.058864, 0, 0.7137255, 1, 1,
0.1304973, -0.7061502, 1.396339, 0, 0.7058824, 1, 1,
0.1319214, 0.2904296, 0.1201501, 0, 0.6980392, 1, 1,
0.1327585, 1.512224, 1.179431, 0, 0.6941177, 1, 1,
0.1342902, 0.01078714, -0.5443119, 0, 0.6862745, 1, 1,
0.1382587, -0.08090015, 1.440807, 0, 0.682353, 1, 1,
0.1408483, -0.26939, 2.871505, 0, 0.6745098, 1, 1,
0.1527666, -0.2100859, 1.689592, 0, 0.6705883, 1, 1,
0.1551679, -0.3709667, 0.9588385, 0, 0.6627451, 1, 1,
0.1618944, -0.4616339, 3.36664, 0, 0.6588235, 1, 1,
0.1680428, 1.411603, 0.7111077, 0, 0.6509804, 1, 1,
0.168393, -2.283234, 4.586554, 0, 0.6470588, 1, 1,
0.1712955, -1.203008, 0.8615792, 0, 0.6392157, 1, 1,
0.1719663, -1.422454, 5.604982, 0, 0.6352941, 1, 1,
0.174296, -1.328442, 3.267406, 0, 0.627451, 1, 1,
0.186186, 0.2893883, 2.054373, 0, 0.6235294, 1, 1,
0.1880469, 0.2279867, 1.270217, 0, 0.6156863, 1, 1,
0.1881475, -0.08214366, 1.645251, 0, 0.6117647, 1, 1,
0.1903996, 1.095827, 1.112759, 0, 0.6039216, 1, 1,
0.1912364, -0.08535516, 1.093385, 0, 0.5960785, 1, 1,
0.1927178, -0.4470228, 1.19208, 0, 0.5921569, 1, 1,
0.1938518, 0.697861, 0.4410951, 0, 0.5843138, 1, 1,
0.1999849, -0.2251694, 3.58278, 0, 0.5803922, 1, 1,
0.2016084, 0.7160166, 1.324721, 0, 0.572549, 1, 1,
0.2025958, 0.6799501, 1.55944, 0, 0.5686275, 1, 1,
0.2027437, 0.4843689, -1.127023, 0, 0.5607843, 1, 1,
0.2064097, -0.1790377, 0.7230968, 0, 0.5568628, 1, 1,
0.2085024, -1.280816, 3.521995, 0, 0.5490196, 1, 1,
0.2122599, 0.2302168, 0.4372377, 0, 0.5450981, 1, 1,
0.2151681, 1.016569, 0.3061175, 0, 0.5372549, 1, 1,
0.2154382, -0.8718586, 2.236074, 0, 0.5333334, 1, 1,
0.2163538, -1.201535, 1.753489, 0, 0.5254902, 1, 1,
0.2180599, -0.03335252, 0.8250127, 0, 0.5215687, 1, 1,
0.2191126, 0.8757028, 1.934414, 0, 0.5137255, 1, 1,
0.2206581, 0.01456735, 1.017745, 0, 0.509804, 1, 1,
0.2219421, -1.624371, 4.927866, 0, 0.5019608, 1, 1,
0.2228937, 0.3601863, 0.2830526, 0, 0.4941176, 1, 1,
0.2248961, 0.1998766, 0.5919645, 0, 0.4901961, 1, 1,
0.2269365, -0.3694828, 2.983232, 0, 0.4823529, 1, 1,
0.2298549, 0.9802656, 0.7687263, 0, 0.4784314, 1, 1,
0.2484032, 0.3857748, -0.3675988, 0, 0.4705882, 1, 1,
0.2492893, 0.3222961, 0.3690175, 0, 0.4666667, 1, 1,
0.2515852, -0.9900006, 3.145785, 0, 0.4588235, 1, 1,
0.252092, -1.529199, 2.516166, 0, 0.454902, 1, 1,
0.2552877, -1.976099, 4.199191, 0, 0.4470588, 1, 1,
0.2564895, 2.279293, 0.3204846, 0, 0.4431373, 1, 1,
0.263092, -1.259176, 5.497985, 0, 0.4352941, 1, 1,
0.2641551, 0.3230098, 0.2303685, 0, 0.4313726, 1, 1,
0.2673965, 1.654699, -1.311894, 0, 0.4235294, 1, 1,
0.2688019, 0.3601957, 1.652143, 0, 0.4196078, 1, 1,
0.2693512, 0.9739239, 0.08368717, 0, 0.4117647, 1, 1,
0.2693883, -0.137972, 3.080611, 0, 0.4078431, 1, 1,
0.2725726, -0.1295074, 1.369211, 0, 0.4, 1, 1,
0.274278, 1.462126, -0.9867504, 0, 0.3921569, 1, 1,
0.2754107, 0.6141219, 1.314094, 0, 0.3882353, 1, 1,
0.2779989, 0.7060205, 0.5294191, 0, 0.3803922, 1, 1,
0.2784342, 0.2297235, 2.046798, 0, 0.3764706, 1, 1,
0.2792436, -1.374813, 1.632327, 0, 0.3686275, 1, 1,
0.2803152, 1.714235, 0.6463687, 0, 0.3647059, 1, 1,
0.2805074, -0.08111294, 0.3927441, 0, 0.3568628, 1, 1,
0.286969, 1.58556, -0.9965551, 0, 0.3529412, 1, 1,
0.2890923, -0.9089197, 2.143761, 0, 0.345098, 1, 1,
0.2914629, 0.6798802, -0.9297549, 0, 0.3411765, 1, 1,
0.2938572, 1.511531, -2.067531, 0, 0.3333333, 1, 1,
0.2942993, 1.060975, 0.4993169, 0, 0.3294118, 1, 1,
0.2966659, 0.4567603, 1.816015, 0, 0.3215686, 1, 1,
0.2982468, -1.535605, 3.612933, 0, 0.3176471, 1, 1,
0.2996757, -0.6209617, 1.1977, 0, 0.3098039, 1, 1,
0.3001005, 0.09992983, 2.497654, 0, 0.3058824, 1, 1,
0.3012726, -0.9573079, 1.012827, 0, 0.2980392, 1, 1,
0.3025171, 1.463263, 0.9114063, 0, 0.2901961, 1, 1,
0.3043107, -0.1987866, 0.6982237, 0, 0.2862745, 1, 1,
0.30437, -0.8892606, 1.885605, 0, 0.2784314, 1, 1,
0.3067824, -1.850016, 1.390527, 0, 0.2745098, 1, 1,
0.3079848, -0.401978, 3.729688, 0, 0.2666667, 1, 1,
0.3082152, -0.2989182, 1.739098, 0, 0.2627451, 1, 1,
0.316259, -0.7021664, 2.511618, 0, 0.254902, 1, 1,
0.3170001, 1.453236, 0.6411898, 0, 0.2509804, 1, 1,
0.3216545, -2.035849, 4.19125, 0, 0.2431373, 1, 1,
0.3218328, -0.9903589, 3.534834, 0, 0.2392157, 1, 1,
0.3229178, 0.1413093, 2.420338, 0, 0.2313726, 1, 1,
0.324144, 0.9270268, -0.4632298, 0, 0.227451, 1, 1,
0.3248208, 0.4345396, -1.770487, 0, 0.2196078, 1, 1,
0.3253878, 0.4331827, 0.8958878, 0, 0.2156863, 1, 1,
0.3267934, 0.7395899, 2.817439, 0, 0.2078431, 1, 1,
0.3274874, -0.3277942, 2.42281, 0, 0.2039216, 1, 1,
0.3349864, 1.113523, 1.38891, 0, 0.1960784, 1, 1,
0.3360561, 0.420886, 1.966983, 0, 0.1882353, 1, 1,
0.3363029, 0.9054568, -0.1071728, 0, 0.1843137, 1, 1,
0.3404286, 2.100586, 0.01078811, 0, 0.1764706, 1, 1,
0.3450097, -1.154184, 2.36924, 0, 0.172549, 1, 1,
0.3500224, -0.5266566, 1.878485, 0, 0.1647059, 1, 1,
0.3522913, -2.801506, 4.962966, 0, 0.1607843, 1, 1,
0.3537001, -0.4391244, 1.034058, 0, 0.1529412, 1, 1,
0.3602961, 0.6745419, 0.4423865, 0, 0.1490196, 1, 1,
0.3613552, -0.2757561, 0.8311924, 0, 0.1411765, 1, 1,
0.3684455, -1.043172, 1.635755, 0, 0.1372549, 1, 1,
0.3684637, -0.4774449, 0.7888799, 0, 0.1294118, 1, 1,
0.3703108, -0.8477796, 3.470429, 0, 0.1254902, 1, 1,
0.3708364, 0.880892, -0.6763029, 0, 0.1176471, 1, 1,
0.3711855, -0.4348605, 2.425309, 0, 0.1137255, 1, 1,
0.3731384, 1.415757, 1.385927, 0, 0.1058824, 1, 1,
0.3755623, 0.8956608, 1.608931, 0, 0.09803922, 1, 1,
0.3797754, 1.031531, 1.028272, 0, 0.09411765, 1, 1,
0.3851659, -0.3732917, 1.159193, 0, 0.08627451, 1, 1,
0.3895769, -0.2840646, 1.294742, 0, 0.08235294, 1, 1,
0.3916958, -0.8443485, 2.441405, 0, 0.07450981, 1, 1,
0.3988029, -1.260877, 2.312825, 0, 0.07058824, 1, 1,
0.4027822, -0.08796953, 2.541112, 0, 0.0627451, 1, 1,
0.4137574, -0.06621808, 2.904004, 0, 0.05882353, 1, 1,
0.4152563, -0.2617854, 1.06354, 0, 0.05098039, 1, 1,
0.4165018, 0.9082611, -0.3778852, 0, 0.04705882, 1, 1,
0.4177234, 1.592076, 1.78437, 0, 0.03921569, 1, 1,
0.4361084, -1.862066, 3.182741, 0, 0.03529412, 1, 1,
0.4367002, 0.9726155, 0.2242683, 0, 0.02745098, 1, 1,
0.437862, 1.252817, 1.297611, 0, 0.02352941, 1, 1,
0.4396646, -1.307083, 2.716039, 0, 0.01568628, 1, 1,
0.4431396, -0.4848056, 3.788947, 0, 0.01176471, 1, 1,
0.4449151, 0.5451618, 1.487353, 0, 0.003921569, 1, 1,
0.4468382, -0.2679884, 3.522522, 0.003921569, 0, 1, 1,
0.4477941, -0.6034986, 2.762291, 0.007843138, 0, 1, 1,
0.4497774, 0.1082737, 0.9121965, 0.01568628, 0, 1, 1,
0.4499974, -0.4023757, 0.4743028, 0.01960784, 0, 1, 1,
0.4553043, -0.9000571, 2.300729, 0.02745098, 0, 1, 1,
0.4564592, -0.2303039, 0.5667121, 0.03137255, 0, 1, 1,
0.4583265, 1.144668, 1.277675, 0.03921569, 0, 1, 1,
0.4615443, 0.3113215, 1.960551, 0.04313726, 0, 1, 1,
0.4618059, 0.07798745, -0.1009221, 0.05098039, 0, 1, 1,
0.462593, 0.3925859, -0.6049005, 0.05490196, 0, 1, 1,
0.4670283, 0.1364338, 1.584087, 0.0627451, 0, 1, 1,
0.4709677, -0.6393013, 2.32673, 0.06666667, 0, 1, 1,
0.4736842, -0.270411, 2.684547, 0.07450981, 0, 1, 1,
0.4737612, 0.4302335, 0.6540588, 0.07843138, 0, 1, 1,
0.4815632, -0.04340435, 1.334873, 0.08627451, 0, 1, 1,
0.4856651, -0.8580164, 2.125116, 0.09019608, 0, 1, 1,
0.4880272, 0.7327524, -0.06769288, 0.09803922, 0, 1, 1,
0.4882405, 0.3846377, 1.583782, 0.1058824, 0, 1, 1,
0.493718, 2.349416, -0.4499451, 0.1098039, 0, 1, 1,
0.496214, -1.424358, 1.998317, 0.1176471, 0, 1, 1,
0.5052604, 1.156085, 1.200165, 0.1215686, 0, 1, 1,
0.5074902, 0.3832094, 0.9971435, 0.1294118, 0, 1, 1,
0.5086547, -0.2228392, 2.699187, 0.1333333, 0, 1, 1,
0.5090614, -1.68821, 3.274649, 0.1411765, 0, 1, 1,
0.5113629, 1.280337, -0.3664178, 0.145098, 0, 1, 1,
0.5118999, -1.880602, 3.269628, 0.1529412, 0, 1, 1,
0.5126812, 0.6432751, -0.1164589, 0.1568628, 0, 1, 1,
0.513197, -0.02974691, 0.8663414, 0.1647059, 0, 1, 1,
0.5142105, -0.5969554, 3.318683, 0.1686275, 0, 1, 1,
0.5165019, 1.49827, -1.067905, 0.1764706, 0, 1, 1,
0.5178595, 0.5346875, -0.671751, 0.1803922, 0, 1, 1,
0.5220473, 1.428352, -1.377561, 0.1882353, 0, 1, 1,
0.5275207, -0.2529387, 2.112246, 0.1921569, 0, 1, 1,
0.5286613, 1.693914, -1.872183, 0.2, 0, 1, 1,
0.5317827, -0.3257887, 1.743325, 0.2078431, 0, 1, 1,
0.5351861, 0.9885218, 0.8842319, 0.2117647, 0, 1, 1,
0.5355256, 0.07884452, 1.372385, 0.2196078, 0, 1, 1,
0.5365576, 0.6103399, 2.33539, 0.2235294, 0, 1, 1,
0.5382333, 1.764441, -1.612588, 0.2313726, 0, 1, 1,
0.5426182, 0.1861852, -0.5132803, 0.2352941, 0, 1, 1,
0.5434334, 0.1226965, 0.9645884, 0.2431373, 0, 1, 1,
0.5441991, 0.8887008, -0.8196815, 0.2470588, 0, 1, 1,
0.5653146, 1.555192, -0.2914529, 0.254902, 0, 1, 1,
0.5742211, -0.08260402, 1.909266, 0.2588235, 0, 1, 1,
0.5765166, 0.2255949, -0.2996106, 0.2666667, 0, 1, 1,
0.5777841, 0.8014644, 1.976724, 0.2705882, 0, 1, 1,
0.5803426, -1.046174, 3.091912, 0.2784314, 0, 1, 1,
0.5839695, 0.4326032, -0.6680552, 0.282353, 0, 1, 1,
0.5909765, -0.1218426, 2.017792, 0.2901961, 0, 1, 1,
0.5924897, 0.8875847, 1.171132, 0.2941177, 0, 1, 1,
0.5951787, 0.7085008, 1.393616, 0.3019608, 0, 1, 1,
0.5957943, 0.4682046, 0.5649373, 0.3098039, 0, 1, 1,
0.5959988, 0.2483996, 3.741128, 0.3137255, 0, 1, 1,
0.5968979, 1.095703, -0.06792086, 0.3215686, 0, 1, 1,
0.598812, -1.348965, 2.810696, 0.3254902, 0, 1, 1,
0.5995699, -0.62115, 2.102155, 0.3333333, 0, 1, 1,
0.6035358, 0.06660701, 2.0389, 0.3372549, 0, 1, 1,
0.6047746, 0.6620477, 0.5459504, 0.345098, 0, 1, 1,
0.6073535, -0.3799634, 3.13071, 0.3490196, 0, 1, 1,
0.6132577, 0.2226413, 1.145823, 0.3568628, 0, 1, 1,
0.6181666, -0.3246204, 2.081817, 0.3607843, 0, 1, 1,
0.6214613, 0.6469079, -0.5423645, 0.3686275, 0, 1, 1,
0.6221602, -1.082814, 2.199883, 0.372549, 0, 1, 1,
0.6245419, -0.8523127, 3.333803, 0.3803922, 0, 1, 1,
0.625269, -0.7402182, 1.303714, 0.3843137, 0, 1, 1,
0.626158, -0.0981311, 1.856401, 0.3921569, 0, 1, 1,
0.6265975, -0.08268913, 1.529843, 0.3960784, 0, 1, 1,
0.6276396, -0.6590962, 2.255697, 0.4039216, 0, 1, 1,
0.6289949, 1.0352, 0.2246437, 0.4117647, 0, 1, 1,
0.6292912, 1.498365, -2.502979, 0.4156863, 0, 1, 1,
0.6378453, -1.567797, 4.413592, 0.4235294, 0, 1, 1,
0.6410351, 0.3884214, -0.1468935, 0.427451, 0, 1, 1,
0.6443772, -0.0672309, 2.731296, 0.4352941, 0, 1, 1,
0.6460635, 0.1403171, 1.692098, 0.4392157, 0, 1, 1,
0.6521324, 0.5314904, 1.772619, 0.4470588, 0, 1, 1,
0.6531115, -1.895514, 3.023806, 0.4509804, 0, 1, 1,
0.6537363, 0.006707384, 1.396981, 0.4588235, 0, 1, 1,
0.6576582, -1.032081, 1.289192, 0.4627451, 0, 1, 1,
0.6599209, -0.2332693, 0.4835577, 0.4705882, 0, 1, 1,
0.6608584, -0.8605605, 1.973789, 0.4745098, 0, 1, 1,
0.6634757, -0.8007079, 4.493205, 0.4823529, 0, 1, 1,
0.6643494, 0.7886822, 1.806401, 0.4862745, 0, 1, 1,
0.6655071, -1.010825, 2.00416, 0.4941176, 0, 1, 1,
0.6723779, -1.070472, 2.809134, 0.5019608, 0, 1, 1,
0.6726928, -0.05676493, 1.564264, 0.5058824, 0, 1, 1,
0.6786151, -1.710032, 3.165757, 0.5137255, 0, 1, 1,
0.6800063, -1.080066, 2.987318, 0.5176471, 0, 1, 1,
0.6810465, -0.06590965, 2.645923, 0.5254902, 0, 1, 1,
0.683327, 1.743634, 1.355929, 0.5294118, 0, 1, 1,
0.6879606, 0.2363038, 1.335802, 0.5372549, 0, 1, 1,
0.6886098, -1.575158, 2.227399, 0.5411765, 0, 1, 1,
0.6988126, -0.2231558, 2.098573, 0.5490196, 0, 1, 1,
0.7005246, 0.491786, 0.5642437, 0.5529412, 0, 1, 1,
0.7010698, -0.6848709, 2.094006, 0.5607843, 0, 1, 1,
0.7035615, -1.009665, 2.10171, 0.5647059, 0, 1, 1,
0.708286, 0.5435713, -0.1262386, 0.572549, 0, 1, 1,
0.7115386, -1.452638, 4.199312, 0.5764706, 0, 1, 1,
0.7179883, -0.5822286, 2.590717, 0.5843138, 0, 1, 1,
0.7197608, 0.06625056, 0.4146652, 0.5882353, 0, 1, 1,
0.7316036, -0.9074671, 3.072453, 0.5960785, 0, 1, 1,
0.7383215, 1.396273, 1.176849, 0.6039216, 0, 1, 1,
0.7422646, 1.743948, 0.341314, 0.6078432, 0, 1, 1,
0.7441435, -0.4332652, 2.683671, 0.6156863, 0, 1, 1,
0.7448642, -0.1024778, 1.26318, 0.6196079, 0, 1, 1,
0.7562348, -0.06228441, 2.884697, 0.627451, 0, 1, 1,
0.7574056, 0.292038, 1.459197, 0.6313726, 0, 1, 1,
0.7649438, -1.270739, 3.896692, 0.6392157, 0, 1, 1,
0.768397, -1.890243, 1.959659, 0.6431373, 0, 1, 1,
0.768792, 0.2362188, 0.864253, 0.6509804, 0, 1, 1,
0.77005, 0.1873292, -0.6938294, 0.654902, 0, 1, 1,
0.7762969, 0.2563048, 0.4073361, 0.6627451, 0, 1, 1,
0.7775207, 1.492836, 0.836598, 0.6666667, 0, 1, 1,
0.7838204, -0.5773959, 0.6011567, 0.6745098, 0, 1, 1,
0.7848231, 0.1066458, 0.8169242, 0.6784314, 0, 1, 1,
0.7922224, 0.4307544, 1.67898, 0.6862745, 0, 1, 1,
0.7937627, -1.534478, 3.765129, 0.6901961, 0, 1, 1,
0.7942158, 1.127433, -0.3344217, 0.6980392, 0, 1, 1,
0.7980707, -0.8225645, 2.394617, 0.7058824, 0, 1, 1,
0.8023667, 1.00803, 0.2310907, 0.7098039, 0, 1, 1,
0.8030619, -0.4514734, 2.085737, 0.7176471, 0, 1, 1,
0.8054902, -0.1776009, 0.4639196, 0.7215686, 0, 1, 1,
0.8088139, 0.3242566, 1.238107, 0.7294118, 0, 1, 1,
0.8209215, 0.6673267, 1.118183, 0.7333333, 0, 1, 1,
0.8229566, -1.517202, 3.47548, 0.7411765, 0, 1, 1,
0.8238631, 0.02252478, 1.936323, 0.7450981, 0, 1, 1,
0.8283604, 0.1829619, 0.8667916, 0.7529412, 0, 1, 1,
0.8320938, 0.8948669, 1.300954, 0.7568628, 0, 1, 1,
0.8365915, -0.3788813, 0.411997, 0.7647059, 0, 1, 1,
0.844453, -0.1671606, 1.450157, 0.7686275, 0, 1, 1,
0.8491408, -1.202089, 0.668416, 0.7764706, 0, 1, 1,
0.8493361, -0.5590038, 2.024878, 0.7803922, 0, 1, 1,
0.8521676, -0.4247501, 2.101609, 0.7882353, 0, 1, 1,
0.8547635, -0.5103503, 2.646725, 0.7921569, 0, 1, 1,
0.8555909, -0.7577943, 2.865812, 0.8, 0, 1, 1,
0.8567035, -1.53619, 2.725059, 0.8078431, 0, 1, 1,
0.8578702, 0.1623634, 0.4223158, 0.8117647, 0, 1, 1,
0.8584948, 1.952343, 1.015905, 0.8196079, 0, 1, 1,
0.8633988, 0.4839108, 1.607328, 0.8235294, 0, 1, 1,
0.8650731, -0.4353483, 2.226184, 0.8313726, 0, 1, 1,
0.8715611, -1.872873, 2.263947, 0.8352941, 0, 1, 1,
0.8751533, -0.1124861, 2.925741, 0.8431373, 0, 1, 1,
0.8858091, -0.574843, 2.121297, 0.8470588, 0, 1, 1,
0.8893499, 0.3137248, -0.7140695, 0.854902, 0, 1, 1,
0.8917445, -0.7988955, 2.005206, 0.8588235, 0, 1, 1,
0.8980979, 0.3531826, 1.795004, 0.8666667, 0, 1, 1,
0.901078, 1.982712, -0.3808391, 0.8705882, 0, 1, 1,
0.9114539, -0.4012058, 2.846731, 0.8784314, 0, 1, 1,
0.9118126, 0.7653415, 1.184647, 0.8823529, 0, 1, 1,
0.9145877, 0.8334782, 1.646789, 0.8901961, 0, 1, 1,
0.9186499, 1.254126, 1.136424, 0.8941177, 0, 1, 1,
0.9208844, 0.03864071, 1.201829, 0.9019608, 0, 1, 1,
0.9227254, -1.738017, 3.70427, 0.9098039, 0, 1, 1,
0.9267378, -2.150334, 3.435245, 0.9137255, 0, 1, 1,
0.9278011, 0.2461923, 0.1346034, 0.9215686, 0, 1, 1,
0.9336655, -0.1624383, 2.73743, 0.9254902, 0, 1, 1,
0.9369183, 0.5250695, 2.585053, 0.9333333, 0, 1, 1,
0.9394512, -0.2625055, 0.166252, 0.9372549, 0, 1, 1,
0.9461421, 1.040805, 1.851461, 0.945098, 0, 1, 1,
0.9484326, -1.042626, 2.422141, 0.9490196, 0, 1, 1,
0.9496663, 0.3921237, 2.413977, 0.9568627, 0, 1, 1,
0.9504063, 0.5243405, 1.027706, 0.9607843, 0, 1, 1,
0.9618033, 0.413522, 0.8057781, 0.9686275, 0, 1, 1,
0.972728, 0.1231042, 2.738438, 0.972549, 0, 1, 1,
0.9773937, -1.596068, 3.157207, 0.9803922, 0, 1, 1,
0.979793, 0.83122, 1.004742, 0.9843137, 0, 1, 1,
0.9856542, 1.753381, 1.226801, 0.9921569, 0, 1, 1,
0.9870459, -0.526935, 0.4231139, 0.9960784, 0, 1, 1,
0.9878415, 0.1378891, 1.661912, 1, 0, 0.9960784, 1,
0.9920572, -0.2740781, 1.274352, 1, 0, 0.9882353, 1,
0.9923814, 0.2475138, 0.08557327, 1, 0, 0.9843137, 1,
0.9949694, -0.2761157, 2.429281, 1, 0, 0.9764706, 1,
0.9994017, 0.4942563, 0.1168181, 1, 0, 0.972549, 1,
1.002118, 0.7921728, 1.812925, 1, 0, 0.9647059, 1,
1.005318, 1.353583, -0.3834152, 1, 0, 0.9607843, 1,
1.006544, -1.410553, 2.745054, 1, 0, 0.9529412, 1,
1.008822, -0.7416764, 0.6535636, 1, 0, 0.9490196, 1,
1.009584, 0.4215645, 2.889952, 1, 0, 0.9411765, 1,
1.021096, 0.2360023, 2.343556, 1, 0, 0.9372549, 1,
1.021568, 0.4130196, 2.533207, 1, 0, 0.9294118, 1,
1.023177, 0.8986464, 0.2093408, 1, 0, 0.9254902, 1,
1.024847, -0.920891, 2.581778, 1, 0, 0.9176471, 1,
1.02737, -0.01206166, 0.8764042, 1, 0, 0.9137255, 1,
1.029072, -0.2643037, 1.788324, 1, 0, 0.9058824, 1,
1.029108, 1.358425, 0.2687682, 1, 0, 0.9019608, 1,
1.033311, -0.09192268, 2.460934, 1, 0, 0.8941177, 1,
1.034582, -0.5176851, 2.729458, 1, 0, 0.8862745, 1,
1.039065, -0.8807662, 2.547684, 1, 0, 0.8823529, 1,
1.039089, -0.1428249, 2.71038, 1, 0, 0.8745098, 1,
1.043249, 0.7508565, 0.5745121, 1, 0, 0.8705882, 1,
1.043462, 0.07856491, 3.245868, 1, 0, 0.8627451, 1,
1.056916, 0.3585053, 0.5011253, 1, 0, 0.8588235, 1,
1.058917, 0.1433519, 1.398964, 1, 0, 0.8509804, 1,
1.061698, -0.1779412, 1.207412, 1, 0, 0.8470588, 1,
1.062098, 0.9602027, 0.07254953, 1, 0, 0.8392157, 1,
1.06694, 0.7279577, 0.7968062, 1, 0, 0.8352941, 1,
1.076675, -0.5515739, 1.84671, 1, 0, 0.827451, 1,
1.078795, -0.4211101, 1.365, 1, 0, 0.8235294, 1,
1.086419, -0.02087314, 0.9036979, 1, 0, 0.8156863, 1,
1.088093, -0.1272082, 2.495986, 1, 0, 0.8117647, 1,
1.091334, 0.3622882, -0.1635535, 1, 0, 0.8039216, 1,
1.093314, 1.46179, -0.7864744, 1, 0, 0.7960784, 1,
1.09455, 0.6283124, 0.4473785, 1, 0, 0.7921569, 1,
1.096596, -0.1675728, 0.9413515, 1, 0, 0.7843137, 1,
1.098094, -2.049949, 1.880295, 1, 0, 0.7803922, 1,
1.098838, -2.345027, 2.163443, 1, 0, 0.772549, 1,
1.103199, -0.4345038, 3.460732, 1, 0, 0.7686275, 1,
1.114116, -0.4798873, 1.509054, 1, 0, 0.7607843, 1,
1.12721, 0.1194045, 2.741794, 1, 0, 0.7568628, 1,
1.127357, 0.254609, 1.986516, 1, 0, 0.7490196, 1,
1.13102, -1.839081, 4.239701, 1, 0, 0.7450981, 1,
1.142215, 0.6567671, 0.4505492, 1, 0, 0.7372549, 1,
1.155077, -0.7590011, 1.737183, 1, 0, 0.7333333, 1,
1.156344, 1.352645, 1.831846, 1, 0, 0.7254902, 1,
1.169077, -1.242808, 1.59666, 1, 0, 0.7215686, 1,
1.186764, -0.379219, 2.899437, 1, 0, 0.7137255, 1,
1.189851, 0.6777163, 0.6855363, 1, 0, 0.7098039, 1,
1.200398, -0.06000583, 1.999333, 1, 0, 0.7019608, 1,
1.205946, -0.1354117, 2.433856, 1, 0, 0.6941177, 1,
1.215359, 0.2073718, 3.059566, 1, 0, 0.6901961, 1,
1.233711, 0.3153754, 0.7199941, 1, 0, 0.682353, 1,
1.239224, -2.787503, 2.51531, 1, 0, 0.6784314, 1,
1.241043, -0.7681733, 1.716458, 1, 0, 0.6705883, 1,
1.243939, -0.6205999, 2.742086, 1, 0, 0.6666667, 1,
1.263887, 0.1369341, 3.100692, 1, 0, 0.6588235, 1,
1.272393, -0.004991422, 1.606259, 1, 0, 0.654902, 1,
1.274694, -0.7304373, 2.883745, 1, 0, 0.6470588, 1,
1.282612, -0.6128532, -0.1254898, 1, 0, 0.6431373, 1,
1.284757, -0.2295103, 2.16203, 1, 0, 0.6352941, 1,
1.291172, 0.1319749, 3.05459, 1, 0, 0.6313726, 1,
1.301432, -2.205805, 1.723399, 1, 0, 0.6235294, 1,
1.304714, -0.5608245, 2.631464, 1, 0, 0.6196079, 1,
1.305007, 2.393446, 0.9857873, 1, 0, 0.6117647, 1,
1.311658, -0.1645972, 1.651601, 1, 0, 0.6078432, 1,
1.336584, -2.17962, 2.155419, 1, 0, 0.6, 1,
1.349545, 1.169244, 2.333925, 1, 0, 0.5921569, 1,
1.354321, 0.3133324, 0.8080075, 1, 0, 0.5882353, 1,
1.36314, 0.1928896, 1.378466, 1, 0, 0.5803922, 1,
1.38655, -1.486979, 2.413316, 1, 0, 0.5764706, 1,
1.391713, 1.938926, 1.246414, 1, 0, 0.5686275, 1,
1.395768, -0.5050594, 2.308743, 1, 0, 0.5647059, 1,
1.409937, 0.4673591, 0.8594317, 1, 0, 0.5568628, 1,
1.411606, 0.9140443, 2.513581, 1, 0, 0.5529412, 1,
1.412653, 0.02723996, 1.520874, 1, 0, 0.5450981, 1,
1.422937, -0.2791534, 3.467735, 1, 0, 0.5411765, 1,
1.42555, -0.05665221, 2.359077, 1, 0, 0.5333334, 1,
1.442453, 0.07772192, 2.416682, 1, 0, 0.5294118, 1,
1.448857, 1.02955, 0.6404459, 1, 0, 0.5215687, 1,
1.460607, -0.3859912, 1.993672, 1, 0, 0.5176471, 1,
1.466891, -0.9502614, 2.186975, 1, 0, 0.509804, 1,
1.468755, 0.8287778, 2.350516, 1, 0, 0.5058824, 1,
1.469762, -1.621236, 2.352701, 1, 0, 0.4980392, 1,
1.47099, -0.790704, 2.823067, 1, 0, 0.4901961, 1,
1.479143, -0.5462025, 1.759147, 1, 0, 0.4862745, 1,
1.485304, 0.7124352, 1.503558, 1, 0, 0.4784314, 1,
1.507185, -0.36456, 0.9738792, 1, 0, 0.4745098, 1,
1.511625, 0.1506647, 1.544134, 1, 0, 0.4666667, 1,
1.51205, 0.1972889, -0.2179637, 1, 0, 0.4627451, 1,
1.513381, 0.6322477, 0.4021729, 1, 0, 0.454902, 1,
1.519287, -1.67999, 3.050373, 1, 0, 0.4509804, 1,
1.530928, 0.3235289, 1.514695, 1, 0, 0.4431373, 1,
1.540445, 2.203005, 0.2362986, 1, 0, 0.4392157, 1,
1.55448, -0.02438712, 2.637377, 1, 0, 0.4313726, 1,
1.560155, 0.1749704, 0.158482, 1, 0, 0.427451, 1,
1.582094, 0.3645501, 2.054774, 1, 0, 0.4196078, 1,
1.583497, -0.5935608, 0.1359517, 1, 0, 0.4156863, 1,
1.592423, -0.6129286, 2.372054, 1, 0, 0.4078431, 1,
1.599975, 0.8832965, -0.2035481, 1, 0, 0.4039216, 1,
1.624535, 0.4586685, 2.004792, 1, 0, 0.3960784, 1,
1.645783, -0.5420948, 1.602654, 1, 0, 0.3882353, 1,
1.652846, -0.9467775, 2.395989, 1, 0, 0.3843137, 1,
1.658068, 0.8242859, 0.9170467, 1, 0, 0.3764706, 1,
1.662999, 1.040884, -0.1629125, 1, 0, 0.372549, 1,
1.680035, -0.4437849, -0.6364536, 1, 0, 0.3647059, 1,
1.692189, 0.2702689, 2.389306, 1, 0, 0.3607843, 1,
1.710233, 0.8147407, 1.943653, 1, 0, 0.3529412, 1,
1.718347, -0.1220416, 2.557973, 1, 0, 0.3490196, 1,
1.722935, -0.6549044, 1.554842, 1, 0, 0.3411765, 1,
1.73616, -1.385458, 0.3742138, 1, 0, 0.3372549, 1,
1.747417, 0.07512139, 1.496835, 1, 0, 0.3294118, 1,
1.753648, -1.271179, 1.563937, 1, 0, 0.3254902, 1,
1.753967, 0.4851598, 2.739329, 1, 0, 0.3176471, 1,
1.764847, 1.577443, 0.6070003, 1, 0, 0.3137255, 1,
1.799211, -2.643199, 1.88589, 1, 0, 0.3058824, 1,
1.813572, -1.392557, 0.8678085, 1, 0, 0.2980392, 1,
1.8215, -0.9241381, 2.176626, 1, 0, 0.2941177, 1,
1.82666, -0.03169032, 1.792593, 1, 0, 0.2862745, 1,
1.830038, -0.3146108, 3.725559, 1, 0, 0.282353, 1,
1.839742, 0.4052536, 1.206775, 1, 0, 0.2745098, 1,
1.841167, 0.973766, 1.213375, 1, 0, 0.2705882, 1,
1.849049, 1.531263, 1.228758, 1, 0, 0.2627451, 1,
1.858319, -1.221733, 1.723063, 1, 0, 0.2588235, 1,
1.895521, -1.285931, 2.965875, 1, 0, 0.2509804, 1,
1.899339, -1.20772, 2.30108, 1, 0, 0.2470588, 1,
1.903932, 0.7753771, -0.4202563, 1, 0, 0.2392157, 1,
1.922447, 1.228455, 0.09244577, 1, 0, 0.2352941, 1,
1.934795, 0.5825954, 1.615308, 1, 0, 0.227451, 1,
1.971434, 0.8840737, 1.804814, 1, 0, 0.2235294, 1,
1.980127, 1.087667, 0.4294837, 1, 0, 0.2156863, 1,
1.980937, 0.6210012, 0.7929195, 1, 0, 0.2117647, 1,
1.990956, -1.526636, 2.619789, 1, 0, 0.2039216, 1,
1.998776, 3.2803, 0.461789, 1, 0, 0.1960784, 1,
2.007645, -0.6618748, 2.473516, 1, 0, 0.1921569, 1,
2.014809, 0.5345326, 1.639127, 1, 0, 0.1843137, 1,
2.015402, -0.0174327, 1.366065, 1, 0, 0.1803922, 1,
2.038246, -0.5801419, 1.503739, 1, 0, 0.172549, 1,
2.085187, 0.5087594, 1.934029, 1, 0, 0.1686275, 1,
2.10148, 0.1536916, 0.8698651, 1, 0, 0.1607843, 1,
2.121129, -2.405471, 1.815287, 1, 0, 0.1568628, 1,
2.168942, 1.275301, 1.145711, 1, 0, 0.1490196, 1,
2.177862, -0.1553462, 3.219828, 1, 0, 0.145098, 1,
2.178244, 1.244766, -1.128569, 1, 0, 0.1372549, 1,
2.203663, -0.09873448, 3.195275, 1, 0, 0.1333333, 1,
2.249362, 0.1078323, 2.617346, 1, 0, 0.1254902, 1,
2.32054, -0.80832, 1.750222, 1, 0, 0.1215686, 1,
2.335144, -0.08267532, 2.191648, 1, 0, 0.1137255, 1,
2.338525, 1.055875, 0.6304258, 1, 0, 0.1098039, 1,
2.34847, 1.388066, 1.46563, 1, 0, 0.1019608, 1,
2.364506, 0.2688846, 0.7408677, 1, 0, 0.09411765, 1,
2.370642, 0.9505038, 1.491701, 1, 0, 0.09019608, 1,
2.383364, -0.2755843, 2.652744, 1, 0, 0.08235294, 1,
2.440557, -1.24576, 2.575105, 1, 0, 0.07843138, 1,
2.449854, 1.061042, 1.646619, 1, 0, 0.07058824, 1,
2.467002, -1.577666, 1.011846, 1, 0, 0.06666667, 1,
2.562397, -0.545451, 0.317762, 1, 0, 0.05882353, 1,
2.67582, 1.27421, 1.288273, 1, 0, 0.05490196, 1,
2.702604, 1.343318, -0.3184877, 1, 0, 0.04705882, 1,
2.707223, 0.4654562, 2.122739, 1, 0, 0.04313726, 1,
2.73246, -0.1840328, 1.674581, 1, 0, 0.03529412, 1,
2.804139, -0.04019607, 0.5962387, 1, 0, 0.03137255, 1,
2.805784, -0.298335, 0.8897967, 1, 0, 0.02352941, 1,
2.831717, 0.3368896, 1.475038, 1, 0, 0.01960784, 1,
2.847533, -0.08691991, -0.51935, 1, 0, 0.01176471, 1,
3.258979, 0.926536, 2.140247, 1, 0, 0.007843138, 1
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
0.1569102, -3.86962, -6.814273, 0, -0.5, 0.5, 0.5,
0.1569102, -3.86962, -6.814273, 1, -0.5, 0.5, 0.5,
0.1569102, -3.86962, -6.814273, 1, 1.5, 0.5, 0.5,
0.1569102, -3.86962, -6.814273, 0, 1.5, 0.5, 0.5
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
-3.99676, 0.3492743, -6.814273, 0, -0.5, 0.5, 0.5,
-3.99676, 0.3492743, -6.814273, 1, -0.5, 0.5, 0.5,
-3.99676, 0.3492743, -6.814273, 1, 1.5, 0.5, 0.5,
-3.99676, 0.3492743, -6.814273, 0, 1.5, 0.5, 0.5
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
-3.99676, -3.86962, 0.5302746, 0, -0.5, 0.5, 0.5,
-3.99676, -3.86962, 0.5302746, 1, -0.5, 0.5, 0.5,
-3.99676, -3.86962, 0.5302746, 1, 1.5, 0.5, 0.5,
-3.99676, -3.86962, 0.5302746, 0, 1.5, 0.5, 0.5
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
-2, -2.896029, -5.119378,
3, -2.896029, -5.119378,
-2, -2.896029, -5.119378,
-2, -3.058294, -5.40186,
-1, -2.896029, -5.119378,
-1, -3.058294, -5.40186,
0, -2.896029, -5.119378,
0, -3.058294, -5.40186,
1, -2.896029, -5.119378,
1, -3.058294, -5.40186,
2, -2.896029, -5.119378,
2, -3.058294, -5.40186,
3, -2.896029, -5.119378,
3, -3.058294, -5.40186
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
-2, -3.382825, -5.966825, 0, -0.5, 0.5, 0.5,
-2, -3.382825, -5.966825, 1, -0.5, 0.5, 0.5,
-2, -3.382825, -5.966825, 1, 1.5, 0.5, 0.5,
-2, -3.382825, -5.966825, 0, 1.5, 0.5, 0.5,
-1, -3.382825, -5.966825, 0, -0.5, 0.5, 0.5,
-1, -3.382825, -5.966825, 1, -0.5, 0.5, 0.5,
-1, -3.382825, -5.966825, 1, 1.5, 0.5, 0.5,
-1, -3.382825, -5.966825, 0, 1.5, 0.5, 0.5,
0, -3.382825, -5.966825, 0, -0.5, 0.5, 0.5,
0, -3.382825, -5.966825, 1, -0.5, 0.5, 0.5,
0, -3.382825, -5.966825, 1, 1.5, 0.5, 0.5,
0, -3.382825, -5.966825, 0, 1.5, 0.5, 0.5,
1, -3.382825, -5.966825, 0, -0.5, 0.5, 0.5,
1, -3.382825, -5.966825, 1, -0.5, 0.5, 0.5,
1, -3.382825, -5.966825, 1, 1.5, 0.5, 0.5,
1, -3.382825, -5.966825, 0, 1.5, 0.5, 0.5,
2, -3.382825, -5.966825, 0, -0.5, 0.5, 0.5,
2, -3.382825, -5.966825, 1, -0.5, 0.5, 0.5,
2, -3.382825, -5.966825, 1, 1.5, 0.5, 0.5,
2, -3.382825, -5.966825, 0, 1.5, 0.5, 0.5,
3, -3.382825, -5.966825, 0, -0.5, 0.5, 0.5,
3, -3.382825, -5.966825, 1, -0.5, 0.5, 0.5,
3, -3.382825, -5.966825, 1, 1.5, 0.5, 0.5,
3, -3.382825, -5.966825, 0, 1.5, 0.5, 0.5
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
-3.038221, -2, -5.119378,
-3.038221, 3, -5.119378,
-3.038221, -2, -5.119378,
-3.197977, -2, -5.40186,
-3.038221, -1, -5.119378,
-3.197977, -1, -5.40186,
-3.038221, 0, -5.119378,
-3.197977, 0, -5.40186,
-3.038221, 1, -5.119378,
-3.197977, 1, -5.40186,
-3.038221, 2, -5.119378,
-3.197977, 2, -5.40186,
-3.038221, 3, -5.119378,
-3.197977, 3, -5.40186
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
-3.51749, -2, -5.966825, 0, -0.5, 0.5, 0.5,
-3.51749, -2, -5.966825, 1, -0.5, 0.5, 0.5,
-3.51749, -2, -5.966825, 1, 1.5, 0.5, 0.5,
-3.51749, -2, -5.966825, 0, 1.5, 0.5, 0.5,
-3.51749, -1, -5.966825, 0, -0.5, 0.5, 0.5,
-3.51749, -1, -5.966825, 1, -0.5, 0.5, 0.5,
-3.51749, -1, -5.966825, 1, 1.5, 0.5, 0.5,
-3.51749, -1, -5.966825, 0, 1.5, 0.5, 0.5,
-3.51749, 0, -5.966825, 0, -0.5, 0.5, 0.5,
-3.51749, 0, -5.966825, 1, -0.5, 0.5, 0.5,
-3.51749, 0, -5.966825, 1, 1.5, 0.5, 0.5,
-3.51749, 0, -5.966825, 0, 1.5, 0.5, 0.5,
-3.51749, 1, -5.966825, 0, -0.5, 0.5, 0.5,
-3.51749, 1, -5.966825, 1, -0.5, 0.5, 0.5,
-3.51749, 1, -5.966825, 1, 1.5, 0.5, 0.5,
-3.51749, 1, -5.966825, 0, 1.5, 0.5, 0.5,
-3.51749, 2, -5.966825, 0, -0.5, 0.5, 0.5,
-3.51749, 2, -5.966825, 1, -0.5, 0.5, 0.5,
-3.51749, 2, -5.966825, 1, 1.5, 0.5, 0.5,
-3.51749, 2, -5.966825, 0, 1.5, 0.5, 0.5,
-3.51749, 3, -5.966825, 0, -0.5, 0.5, 0.5,
-3.51749, 3, -5.966825, 1, -0.5, 0.5, 0.5,
-3.51749, 3, -5.966825, 1, 1.5, 0.5, 0.5,
-3.51749, 3, -5.966825, 0, 1.5, 0.5, 0.5
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
-3.038221, -2.896029, -4,
-3.038221, -2.896029, 6,
-3.038221, -2.896029, -4,
-3.197977, -3.058294, -4,
-3.038221, -2.896029, -2,
-3.197977, -3.058294, -2,
-3.038221, -2.896029, 0,
-3.197977, -3.058294, 0,
-3.038221, -2.896029, 2,
-3.197977, -3.058294, 2,
-3.038221, -2.896029, 4,
-3.197977, -3.058294, 4,
-3.038221, -2.896029, 6,
-3.197977, -3.058294, 6
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
-3.51749, -3.382825, -4, 0, -0.5, 0.5, 0.5,
-3.51749, -3.382825, -4, 1, -0.5, 0.5, 0.5,
-3.51749, -3.382825, -4, 1, 1.5, 0.5, 0.5,
-3.51749, -3.382825, -4, 0, 1.5, 0.5, 0.5,
-3.51749, -3.382825, -2, 0, -0.5, 0.5, 0.5,
-3.51749, -3.382825, -2, 1, -0.5, 0.5, 0.5,
-3.51749, -3.382825, -2, 1, 1.5, 0.5, 0.5,
-3.51749, -3.382825, -2, 0, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 0, 0, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 0, 1, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 0, 1, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 0, 0, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 2, 0, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 2, 1, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 2, 1, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 2, 0, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 4, 0, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 4, 1, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 4, 1, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 4, 0, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 6, 0, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 6, 1, -0.5, 0.5, 0.5,
-3.51749, -3.382825, 6, 1, 1.5, 0.5, 0.5,
-3.51749, -3.382825, 6, 0, 1.5, 0.5, 0.5
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
-3.038221, -2.896029, -5.119378,
-3.038221, 3.594578, -5.119378,
-3.038221, -2.896029, 6.179927,
-3.038221, 3.594578, 6.179927,
-3.038221, -2.896029, -5.119378,
-3.038221, -2.896029, 6.179927,
-3.038221, 3.594578, -5.119378,
-3.038221, 3.594578, 6.179927,
-3.038221, -2.896029, -5.119378,
3.352041, -2.896029, -5.119378,
-3.038221, -2.896029, 6.179927,
3.352041, -2.896029, 6.179927,
-3.038221, 3.594578, -5.119378,
3.352041, 3.594578, -5.119378,
-3.038221, 3.594578, 6.179927,
3.352041, 3.594578, 6.179927,
3.352041, -2.896029, -5.119378,
3.352041, 3.594578, -5.119378,
3.352041, -2.896029, 6.179927,
3.352041, 3.594578, 6.179927,
3.352041, -2.896029, -5.119378,
3.352041, -2.896029, 6.179927,
3.352041, 3.594578, -5.119378,
3.352041, 3.594578, 6.179927
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
var radius = 7.749854;
var distance = 34.47998;
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
mvMatrix.translate( -0.1569102, -0.3492743, -0.5302746 );
mvMatrix.scale( 1.31126, 1.290988, 0.7415761 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.47998);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ferimzone<-read.table("ferimzone.xyz")
```

```
## Error in read.table("ferimzone.xyz"): no lines available in input
```

```r
x<-ferimzone$V2
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
```

```r
y<-ferimzone$V3
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
```

```r
z<-ferimzone$V4
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
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
-2.945158, -0.4241079, -0.9344884, 0, 0, 1, 1, 1,
-2.840393, -0.938804, -0.7105688, 1, 0, 0, 1, 1,
-2.798776, 1.356358, -0.9573247, 1, 0, 0, 1, 1,
-2.682863, -0.9526234, -1.615175, 1, 0, 0, 1, 1,
-2.626487, -0.2835449, -0.7547139, 1, 0, 0, 1, 1,
-2.607815, 0.4579115, -1.672897, 1, 0, 0, 1, 1,
-2.43244, -0.02661353, -1.070739, 0, 0, 0, 1, 1,
-2.407469, 0.6832322, -2.228853, 0, 0, 0, 1, 1,
-2.395076, 1.03679, -2.321257, 0, 0, 0, 1, 1,
-2.379428, 1.884569, -0.592488, 0, 0, 0, 1, 1,
-2.333366, -0.1327816, -1.034321, 0, 0, 0, 1, 1,
-2.304547, -0.9740165, -1.512005, 0, 0, 0, 1, 1,
-2.299935, 0.7281907, -2.616966, 0, 0, 0, 1, 1,
-2.2932, 1.679661, -1.567641, 1, 1, 1, 1, 1,
-2.175578, 0.3865194, -1.213405, 1, 1, 1, 1, 1,
-2.159396, 0.7254465, -2.543521, 1, 1, 1, 1, 1,
-2.1551, 0.6876134, -1.795344, 1, 1, 1, 1, 1,
-2.106426, -1.3919, -3.249382, 1, 1, 1, 1, 1,
-2.047058, -0.2636013, -2.013135, 1, 1, 1, 1, 1,
-2.023882, -0.1211898, -0.3835169, 1, 1, 1, 1, 1,
-2.008699, -0.02616118, -2.343171, 1, 1, 1, 1, 1,
-1.977517, -0.2468141, 0.4652601, 1, 1, 1, 1, 1,
-1.915492, 0.3936383, -1.871608, 1, 1, 1, 1, 1,
-1.887926, -0.4496383, -1.595943, 1, 1, 1, 1, 1,
-1.884442, 1.645787, -1.418009, 1, 1, 1, 1, 1,
-1.884324, -1.916357, -1.69677, 1, 1, 1, 1, 1,
-1.880422, -0.6639008, -1.653908, 1, 1, 1, 1, 1,
-1.865054, -0.01945559, -1.066291, 1, 1, 1, 1, 1,
-1.861343, 0.4124631, -2.63404, 0, 0, 1, 1, 1,
-1.847025, -0.1631762, -1.810198, 1, 0, 0, 1, 1,
-1.827187, 0.3595342, -0.996659, 1, 0, 0, 1, 1,
-1.804393, 0.8161229, -0.8512558, 1, 0, 0, 1, 1,
-1.804295, 1.015711, -1.446505, 1, 0, 0, 1, 1,
-1.789423, 1.440406, -0.4105799, 1, 0, 0, 1, 1,
-1.788267, -0.2690106, -1.806315, 0, 0, 0, 1, 1,
-1.782495, 2.103794, -1.97305, 0, 0, 0, 1, 1,
-1.76896, 2.217853, 0.4712195, 0, 0, 0, 1, 1,
-1.759207, 0.9354366, -0.8729857, 0, 0, 0, 1, 1,
-1.75554, 0.5332306, 0.8592479, 0, 0, 0, 1, 1,
-1.751733, -0.5587676, -2.057735, 0, 0, 0, 1, 1,
-1.72388, 0.1386495, -0.9591315, 0, 0, 0, 1, 1,
-1.713406, 0.8121713, 0.4312744, 1, 1, 1, 1, 1,
-1.713014, -1.266181, -1.505084, 1, 1, 1, 1, 1,
-1.709458, 0.8486752, -2.027461, 1, 1, 1, 1, 1,
-1.699335, -0.1574378, -1.164323, 1, 1, 1, 1, 1,
-1.696789, 0.8131824, -2.117218, 1, 1, 1, 1, 1,
-1.695128, 1.250775, -2.440467, 1, 1, 1, 1, 1,
-1.693126, -0.4051268, -1.476852, 1, 1, 1, 1, 1,
-1.664818, -0.3241935, -1.595434, 1, 1, 1, 1, 1,
-1.65819, 0.7573753, -0.9722586, 1, 1, 1, 1, 1,
-1.63309, -0.4688888, -1.846545, 1, 1, 1, 1, 1,
-1.627948, -0.5408934, -3.279371, 1, 1, 1, 1, 1,
-1.625138, 0.09813233, -1.615839, 1, 1, 1, 1, 1,
-1.601767, 1.894354, -0.1545528, 1, 1, 1, 1, 1,
-1.596018, 3.500054, 0.03792375, 1, 1, 1, 1, 1,
-1.573517, -0.05340449, -0.6116269, 1, 1, 1, 1, 1,
-1.566692, -0.7942286, -2.910959, 0, 0, 1, 1, 1,
-1.554572, 0.891739, 0.1471759, 1, 0, 0, 1, 1,
-1.553216, -1.183617, -3.295758, 1, 0, 0, 1, 1,
-1.547421, -0.9588242, -1.738433, 1, 0, 0, 1, 1,
-1.545966, -0.4540394, -1.527642, 1, 0, 0, 1, 1,
-1.521099, 0.7608574, -0.2205157, 1, 0, 0, 1, 1,
-1.512762, -0.5453506, -2.643661, 0, 0, 0, 1, 1,
-1.495292, -2.424699, -3.55013, 0, 0, 0, 1, 1,
-1.489425, 0.2187068, -1.898554, 0, 0, 0, 1, 1,
-1.482778, -0.01626659, -2.89718, 0, 0, 0, 1, 1,
-1.477616, 0.1605814, -2.162805, 0, 0, 0, 1, 1,
-1.47189, -1.041352, -1.621755, 0, 0, 0, 1, 1,
-1.471231, -1.250013, -2.310257, 0, 0, 0, 1, 1,
-1.459655, 0.7494923, -0.4774105, 1, 1, 1, 1, 1,
-1.441182, 0.8408619, -1.061188, 1, 1, 1, 1, 1,
-1.43936, 0.6231046, 0.1146158, 1, 1, 1, 1, 1,
-1.426026, -1.201545, -2.146876, 1, 1, 1, 1, 1,
-1.409665, -0.5173702, -3.512386, 1, 1, 1, 1, 1,
-1.388404, 0.2404427, 0.478498, 1, 1, 1, 1, 1,
-1.372238, -0.220931, -1.558576, 1, 1, 1, 1, 1,
-1.362699, 0.4254707, 0.01807252, 1, 1, 1, 1, 1,
-1.360016, 1.325026, -1.033823, 1, 1, 1, 1, 1,
-1.345432, -0.9196672, -2.017457, 1, 1, 1, 1, 1,
-1.342267, -0.282959, -2.819139, 1, 1, 1, 1, 1,
-1.326888, 0.299491, -0.7447635, 1, 1, 1, 1, 1,
-1.319452, -1.18703, -1.092124, 1, 1, 1, 1, 1,
-1.313042, -1.039143, -2.509916, 1, 1, 1, 1, 1,
-1.307751, -0.8270185, -2.376884, 1, 1, 1, 1, 1,
-1.307003, 1.957697, -1.641897, 0, 0, 1, 1, 1,
-1.306351, 1.082168, -0.6475103, 1, 0, 0, 1, 1,
-1.298736, -0.1500096, -1.53732, 1, 0, 0, 1, 1,
-1.294491, -0.5488917, -2.612007, 1, 0, 0, 1, 1,
-1.291924, -0.9382297, -0.896468, 1, 0, 0, 1, 1,
-1.287327, 0.1570374, -0.1273806, 1, 0, 0, 1, 1,
-1.27624, -1.641124, -1.854978, 0, 0, 0, 1, 1,
-1.273468, 0.1823276, -2.550929, 0, 0, 0, 1, 1,
-1.270228, -0.696755, -1.650473, 0, 0, 0, 1, 1,
-1.268298, 0.6022731, -0.9428054, 0, 0, 0, 1, 1,
-1.266958, -0.273147, -1.864257, 0, 0, 0, 1, 1,
-1.260909, -0.1668026, -3.656234, 0, 0, 0, 1, 1,
-1.258135, 0.1088574, -0.8696479, 0, 0, 0, 1, 1,
-1.255719, 0.1641337, -1.435136, 1, 1, 1, 1, 1,
-1.255693, -0.4448349, -3.867028, 1, 1, 1, 1, 1,
-1.252863, -0.681663, -1.546283, 1, 1, 1, 1, 1,
-1.244991, 1.311657, -0.01174422, 1, 1, 1, 1, 1,
-1.243512, 0.1484244, -1.046476, 1, 1, 1, 1, 1,
-1.243417, 0.5123825, -0.5319878, 1, 1, 1, 1, 1,
-1.23656, -2.173082, -0.341309, 1, 1, 1, 1, 1,
-1.224048, -1.057629, -0.3509907, 1, 1, 1, 1, 1,
-1.223947, -0.1207453, -3.097499, 1, 1, 1, 1, 1,
-1.2192, 0.009987565, -3.137457, 1, 1, 1, 1, 1,
-1.212775, 0.02366148, -2.364549, 1, 1, 1, 1, 1,
-1.209424, -1.965013, -1.828996, 1, 1, 1, 1, 1,
-1.207098, 1.640267, -0.8565274, 1, 1, 1, 1, 1,
-1.204358, -2.311522, -2.735608, 1, 1, 1, 1, 1,
-1.197361, 0.4976781, -0.8083593, 1, 1, 1, 1, 1,
-1.175571, -0.9899547, -2.067528, 0, 0, 1, 1, 1,
-1.170703, 0.2926382, -1.036509, 1, 0, 0, 1, 1,
-1.16738, 0.1076612, -3.536099, 1, 0, 0, 1, 1,
-1.15238, 1.347633, -0.3112777, 1, 0, 0, 1, 1,
-1.148271, 1.21287, -1.316353, 1, 0, 0, 1, 1,
-1.145474, -0.3446116, -1.336365, 1, 0, 0, 1, 1,
-1.143189, -1.320676, -1.150317, 0, 0, 0, 1, 1,
-1.140782, -1.046566, -4.444751, 0, 0, 0, 1, 1,
-1.134881, 0.1475444, -2.316211, 0, 0, 0, 1, 1,
-1.133992, -0.3144339, -1.565279, 0, 0, 0, 1, 1,
-1.133003, 0.3456524, -1.78179, 0, 0, 0, 1, 1,
-1.108153, 0.2529241, -3.685735, 0, 0, 0, 1, 1,
-1.106195, -0.09148634, -0.7834501, 0, 0, 0, 1, 1,
-1.105206, -1.011337, -1.400737, 1, 1, 1, 1, 1,
-1.098312, 1.448594, -0.6855434, 1, 1, 1, 1, 1,
-1.097991, -1.541628, -3.976883, 1, 1, 1, 1, 1,
-1.097143, 0.04894044, -3.542392, 1, 1, 1, 1, 1,
-1.092765, -1.625796, -2.335893, 1, 1, 1, 1, 1,
-1.091691, -0.8663892, -2.428169, 1, 1, 1, 1, 1,
-1.073059, -0.9786425, -1.555634, 1, 1, 1, 1, 1,
-1.072891, 0.3223751, -1.195905, 1, 1, 1, 1, 1,
-1.069076, -0.1941088, 0.1153587, 1, 1, 1, 1, 1,
-1.068533, -0.01430077, -2.164096, 1, 1, 1, 1, 1,
-1.064808, -0.6320754, -0.9637995, 1, 1, 1, 1, 1,
-1.062873, -0.1857123, -1.671879, 1, 1, 1, 1, 1,
-1.062515, -0.2582649, -1.923236, 1, 1, 1, 1, 1,
-1.04446, 0.9682449, -0.3233803, 1, 1, 1, 1, 1,
-1.041883, -0.4977333, -3.770605, 1, 1, 1, 1, 1,
-1.031679, 0.7113335, -0.8310766, 0, 0, 1, 1, 1,
-1.026615, -2.339409, -1.51217, 1, 0, 0, 1, 1,
-1.013324, 1.141534, -0.6516968, 1, 0, 0, 1, 1,
-1.006625, -1.950752, -2.21269, 1, 0, 0, 1, 1,
-1.005523, 0.9395831, -0.1061553, 1, 0, 0, 1, 1,
-1.003193, -1.037925, -4.18622, 1, 0, 0, 1, 1,
-1.001199, 1.344038, -2.328382, 0, 0, 0, 1, 1,
-0.9892155, 0.1820069, -1.429322, 0, 0, 0, 1, 1,
-0.986941, 0.4000979, -2.875694, 0, 0, 0, 1, 1,
-0.9854069, 2.340015, -0.1620419, 0, 0, 0, 1, 1,
-0.9854027, -0.3389935, -3.106908, 0, 0, 0, 1, 1,
-0.9841744, -0.2724264, -2.397381, 0, 0, 0, 1, 1,
-0.9832809, 0.8429609, -0.01897408, 0, 0, 0, 1, 1,
-0.9812105, 0.8473022, -2.537559, 1, 1, 1, 1, 1,
-0.9801162, 0.4298777, -0.9620638, 1, 1, 1, 1, 1,
-0.9757523, -0.3728794, -1.664471, 1, 1, 1, 1, 1,
-0.9662511, 1.104446, 0.1122192, 1, 1, 1, 1, 1,
-0.960903, 0.6511867, -0.1853548, 1, 1, 1, 1, 1,
-0.9584312, -1.705687, -2.92674, 1, 1, 1, 1, 1,
-0.9556251, 0.1926365, -0.4410084, 1, 1, 1, 1, 1,
-0.9504373, -0.836236, -3.297979, 1, 1, 1, 1, 1,
-0.9487826, 1.104906, -1.168403, 1, 1, 1, 1, 1,
-0.9400556, -0.2137712, -0.966804, 1, 1, 1, 1, 1,
-0.938494, 1.247304, -1.320179, 1, 1, 1, 1, 1,
-0.9377379, 0.4542933, -2.014933, 1, 1, 1, 1, 1,
-0.9314637, 1.286411, -0.8175057, 1, 1, 1, 1, 1,
-0.9307932, -0.7437264, -0.0125763, 1, 1, 1, 1, 1,
-0.9293069, 1.894026, -0.6893336, 1, 1, 1, 1, 1,
-0.9270962, -0.2899733, -1.480091, 0, 0, 1, 1, 1,
-0.9177503, 0.1850771, 0.1490741, 1, 0, 0, 1, 1,
-0.915458, -0.05091101, -1.025656, 1, 0, 0, 1, 1,
-0.9113212, 0.8755983, -0.3776373, 1, 0, 0, 1, 1,
-0.9112511, -1.680369, -2.471854, 1, 0, 0, 1, 1,
-0.9083295, -0.6744364, -1.354986, 1, 0, 0, 1, 1,
-0.9072274, 0.1805252, 0.2631271, 0, 0, 0, 1, 1,
-0.8936722, -1.085797, -2.263411, 0, 0, 0, 1, 1,
-0.892555, -1.260717, -2.675637, 0, 0, 0, 1, 1,
-0.8865976, -0.132313, -1.709127, 0, 0, 0, 1, 1,
-0.8862057, -0.4853485, -2.427446, 0, 0, 0, 1, 1,
-0.8834258, 0.5317542, -1.671858, 0, 0, 0, 1, 1,
-0.8827613, -0.4919836, -1.371736, 0, 0, 0, 1, 1,
-0.881158, -0.6742277, -3.165141, 1, 1, 1, 1, 1,
-0.8761505, -0.6025375, -3.127481, 1, 1, 1, 1, 1,
-0.8617641, -1.178646, -1.536642, 1, 1, 1, 1, 1,
-0.8593826, 0.8001798, -0.5670247, 1, 1, 1, 1, 1,
-0.8524719, 0.9395161, 0.06655817, 1, 1, 1, 1, 1,
-0.8490611, -0.5228002, -1.802159, 1, 1, 1, 1, 1,
-0.8431146, 0.4397635, -0.07621359, 1, 1, 1, 1, 1,
-0.841025, 0.6342903, -0.7302803, 1, 1, 1, 1, 1,
-0.8409862, -0.1208694, -1.880772, 1, 1, 1, 1, 1,
-0.8318459, -1.183105, -2.734832, 1, 1, 1, 1, 1,
-0.8310491, 0.7288595, -0.8754087, 1, 1, 1, 1, 1,
-0.8263494, -0.1965808, -3.235452, 1, 1, 1, 1, 1,
-0.823226, 1.436517, 0.6328076, 1, 1, 1, 1, 1,
-0.812135, -0.2948977, -0.6373158, 1, 1, 1, 1, 1,
-0.8089969, 1.811759, -1.473594, 1, 1, 1, 1, 1,
-0.8035071, 0.9260163, -0.6154836, 0, 0, 1, 1, 1,
-0.8027392, -0.7259467, -2.520376, 1, 0, 0, 1, 1,
-0.8015482, 0.796019, -1.090606, 1, 0, 0, 1, 1,
-0.8010244, 0.07441588, -2.516246, 1, 0, 0, 1, 1,
-0.7984589, -1.831111, -1.616482, 1, 0, 0, 1, 1,
-0.7968336, 0.9388247, -0.9746936, 1, 0, 0, 1, 1,
-0.7927935, 0.3588729, -2.304772, 0, 0, 0, 1, 1,
-0.791102, 0.6303824, -1.091403, 0, 0, 0, 1, 1,
-0.7898087, 1.522595, -0.738888, 0, 0, 0, 1, 1,
-0.7878745, -0.1113412, -3.503658, 0, 0, 0, 1, 1,
-0.7867402, 1.550116, -0.5809564, 0, 0, 0, 1, 1,
-0.7851566, -0.1598021, -3.248328, 0, 0, 0, 1, 1,
-0.7825931, 1.198633, -0.5275885, 0, 0, 0, 1, 1,
-0.7813727, 2.448954, -0.9494191, 1, 1, 1, 1, 1,
-0.777695, -2.537568, -3.434465, 1, 1, 1, 1, 1,
-0.7740835, 0.2320566, -1.483456, 1, 1, 1, 1, 1,
-0.7736949, 1.311996, -0.8462887, 1, 1, 1, 1, 1,
-0.7721967, 0.1451736, -2.072084, 1, 1, 1, 1, 1,
-0.7713208, -0.2483275, -3.764727, 1, 1, 1, 1, 1,
-0.7642175, 1.036375, -1.037257, 1, 1, 1, 1, 1,
-0.7625192, 0.7582179, -0.4851413, 1, 1, 1, 1, 1,
-0.7619292, -1.335558, -1.348877, 1, 1, 1, 1, 1,
-0.7617245, 0.04058918, -1.56066, 1, 1, 1, 1, 1,
-0.7602075, 0.3634421, -2.435648, 1, 1, 1, 1, 1,
-0.7551996, 0.453761, -1.59545, 1, 1, 1, 1, 1,
-0.7497262, -0.541527, -3.355459, 1, 1, 1, 1, 1,
-0.7468359, -1.174636, -1.57907, 1, 1, 1, 1, 1,
-0.7439464, -1.361125, -3.070159, 1, 1, 1, 1, 1,
-0.7437618, -0.6029422, -2.58839, 0, 0, 1, 1, 1,
-0.7426066, 1.477768, -0.07329208, 1, 0, 0, 1, 1,
-0.7423409, 0.749786, 0.300745, 1, 0, 0, 1, 1,
-0.7416621, 1.59314, 0.9204279, 1, 0, 0, 1, 1,
-0.7341705, 1.748329, -0.03323854, 1, 0, 0, 1, 1,
-0.7323596, 0.8526992, -0.04038619, 1, 0, 0, 1, 1,
-0.7323508, 0.9045729, -0.07658312, 0, 0, 0, 1, 1,
-0.7303203, 0.5645317, -1.010295, 0, 0, 0, 1, 1,
-0.729697, -0.005819586, -1.545786, 0, 0, 0, 1, 1,
-0.7288725, 0.1544144, -0.04238519, 0, 0, 0, 1, 1,
-0.7167353, 0.3022411, -1.498559, 0, 0, 0, 1, 1,
-0.713874, -0.1893034, -2.892794, 0, 0, 0, 1, 1,
-0.7134873, 1.682584, -0.6417384, 0, 0, 0, 1, 1,
-0.6998895, -0.8713059, -3.20393, 1, 1, 1, 1, 1,
-0.6968595, -0.2581805, -1.774275, 1, 1, 1, 1, 1,
-0.6961426, -0.2050133, -1.630881, 1, 1, 1, 1, 1,
-0.6952589, -0.9565727, -2.543412, 1, 1, 1, 1, 1,
-0.6932593, 1.351779, -1.234091, 1, 1, 1, 1, 1,
-0.6884186, -0.2661888, -3.005614, 1, 1, 1, 1, 1,
-0.6680695, -0.1328808, -1.656869, 1, 1, 1, 1, 1,
-0.6654715, 0.6764592, -0.03756829, 1, 1, 1, 1, 1,
-0.6625556, -0.9742836, -2.559277, 1, 1, 1, 1, 1,
-0.6615212, -1.794919, -2.632982, 1, 1, 1, 1, 1,
-0.6600724, -0.7393328, -3.136352, 1, 1, 1, 1, 1,
-0.6600719, -1.133394, -3.22846, 1, 1, 1, 1, 1,
-0.6584885, -0.1124488, -0.7329099, 1, 1, 1, 1, 1,
-0.6546409, 0.2986605, -1.303305, 1, 1, 1, 1, 1,
-0.6511173, 0.4651591, -2.571213, 1, 1, 1, 1, 1,
-0.6444812, -0.8222759, -1.254583, 0, 0, 1, 1, 1,
-0.6421239, -2.555633, -3.979427, 1, 0, 0, 1, 1,
-0.6414988, -1.848231, -2.218886, 1, 0, 0, 1, 1,
-0.640982, -1.136714, -3.314995, 1, 0, 0, 1, 1,
-0.640891, 0.1746782, -0.8591678, 1, 0, 0, 1, 1,
-0.6388446, -0.4778114, -0.277848, 1, 0, 0, 1, 1,
-0.6353562, 1.572459, -0.968401, 0, 0, 0, 1, 1,
-0.6311272, 0.4363543, 0.3401512, 0, 0, 0, 1, 1,
-0.6271747, -0.08832587, -3.312183, 0, 0, 0, 1, 1,
-0.6234046, 1.30832, -0.6713178, 0, 0, 0, 1, 1,
-0.620567, 1.215138, 1.045316, 0, 0, 0, 1, 1,
-0.6197917, 0.9587629, -0.5614951, 0, 0, 0, 1, 1,
-0.6174352, -0.09249043, -0.996942, 0, 0, 0, 1, 1,
-0.606674, 0.7448223, -2.334331, 1, 1, 1, 1, 1,
-0.6034597, -0.7025723, -2.764096, 1, 1, 1, 1, 1,
-0.6034504, 1.208441, 0.6928743, 1, 1, 1, 1, 1,
-0.6032509, 0.9512256, -3.250275, 1, 1, 1, 1, 1,
-0.6027839, -1.462514, -4.503649, 1, 1, 1, 1, 1,
-0.602585, 1.444865, -0.5909945, 1, 1, 1, 1, 1,
-0.601772, -1.641515, -1.850889, 1, 1, 1, 1, 1,
-0.6015052, -0.4944165, -2.50218, 1, 1, 1, 1, 1,
-0.600525, -0.8258227, -1.011065, 1, 1, 1, 1, 1,
-0.5922539, -1.13388, -3.834494, 1, 1, 1, 1, 1,
-0.5918375, 0.9177539, -1.576974, 1, 1, 1, 1, 1,
-0.5889388, 0.1533728, -1.153058, 1, 1, 1, 1, 1,
-0.5881057, -0.04464078, 0.5241703, 1, 1, 1, 1, 1,
-0.5833454, -1.662521, -3.708032, 1, 1, 1, 1, 1,
-0.5756435, 1.166031, 0.2074308, 1, 1, 1, 1, 1,
-0.5714391, 0.1710749, -3.03727, 0, 0, 1, 1, 1,
-0.563831, 1.730955, 0.7818927, 1, 0, 0, 1, 1,
-0.5577952, 0.3737682, -0.5631573, 1, 0, 0, 1, 1,
-0.5556135, 0.1342252, -1.206398, 1, 0, 0, 1, 1,
-0.5555075, -0.0187201, -0.4900886, 1, 0, 0, 1, 1,
-0.554401, 1.453599, 0.2814127, 1, 0, 0, 1, 1,
-0.5533295, -0.6432149, -2.81661, 0, 0, 0, 1, 1,
-0.550401, -0.09808111, -1.850209, 0, 0, 0, 1, 1,
-0.5502477, 1.244953, -0.8258646, 0, 0, 0, 1, 1,
-0.5486696, -1.570345, -3.870459, 0, 0, 0, 1, 1,
-0.54654, -0.4531403, -2.479553, 0, 0, 0, 1, 1,
-0.5461765, -0.1784288, -1.851759, 0, 0, 0, 1, 1,
-0.5442892, 0.2264685, -2.397279, 0, 0, 0, 1, 1,
-0.5421953, -0.8786201, -4.720202, 1, 1, 1, 1, 1,
-0.5408754, -0.3027744, -0.7788158, 1, 1, 1, 1, 1,
-0.5386149, -0.8417704, -1.341947, 1, 1, 1, 1, 1,
-0.5383106, -1.596049, -2.071309, 1, 1, 1, 1, 1,
-0.5346274, -0.1778362, -1.729284, 1, 1, 1, 1, 1,
-0.5320048, -2.130913, -3.757962, 1, 1, 1, 1, 1,
-0.5289196, 2.343802, -0.3737881, 1, 1, 1, 1, 1,
-0.5286633, -0.5927519, -0.8493963, 1, 1, 1, 1, 1,
-0.5256068, -1.191252, -3.594043, 1, 1, 1, 1, 1,
-0.5238637, 0.1715632, -1.273896, 1, 1, 1, 1, 1,
-0.5215319, -1.529958, -4.941931, 1, 1, 1, 1, 1,
-0.5200779, -0.0952803, 1.096879, 1, 1, 1, 1, 1,
-0.5188202, -1.875332, -3.569696, 1, 1, 1, 1, 1,
-0.5132012, 1.095725, 0.1951003, 1, 1, 1, 1, 1,
-0.4964287, 2.112928, -0.2358885, 1, 1, 1, 1, 1,
-0.4954118, -0.7290281, -2.689541, 0, 0, 1, 1, 1,
-0.4950018, -0.11195, -1.380351, 1, 0, 0, 1, 1,
-0.4894123, 0.05200191, -0.5596358, 1, 0, 0, 1, 1,
-0.4852536, -1.107452, -3.055743, 1, 0, 0, 1, 1,
-0.4817616, 0.5538901, -0.6840894, 1, 0, 0, 1, 1,
-0.4810706, -0.165381, -0.9659994, 1, 0, 0, 1, 1,
-0.4797266, 0.841145, 1.392378, 0, 0, 0, 1, 1,
-0.4777407, 0.6329428, -1.582859, 0, 0, 0, 1, 1,
-0.4739749, 0.4021364, -1.029877, 0, 0, 0, 1, 1,
-0.4673854, 0.9395367, -0.8305125, 0, 0, 0, 1, 1,
-0.4600276, 0.2504119, -1.28933, 0, 0, 0, 1, 1,
-0.4596149, -0.4742897, -4.035968, 0, 0, 0, 1, 1,
-0.4544973, -0.0787563, -1.049363, 0, 0, 0, 1, 1,
-0.4533994, 0.8172202, -0.5732615, 1, 1, 1, 1, 1,
-0.4518245, -1.110725, -2.673736, 1, 1, 1, 1, 1,
-0.4507453, -1.203379, -1.792447, 1, 1, 1, 1, 1,
-0.4506653, -2.264808, -0.4199646, 1, 1, 1, 1, 1,
-0.4495943, -0.6189876, -2.139443, 1, 1, 1, 1, 1,
-0.4462833, 0.2173584, -3.664211, 1, 1, 1, 1, 1,
-0.4447252, -0.2134044, -1.676632, 1, 1, 1, 1, 1,
-0.4430255, -0.4814112, -2.140318, 1, 1, 1, 1, 1,
-0.4410674, 1.547157, -0.8530372, 1, 1, 1, 1, 1,
-0.4394072, -2.170984, -1.783121, 1, 1, 1, 1, 1,
-0.4384299, -2.034062, -3.465326, 1, 1, 1, 1, 1,
-0.4384263, -0.2691552, -1.695463, 1, 1, 1, 1, 1,
-0.4327713, 0.0400513, -1.368362, 1, 1, 1, 1, 1,
-0.4279857, 1.155853, -0.3767025, 1, 1, 1, 1, 1,
-0.4169673, 0.8953983, 1.142106, 1, 1, 1, 1, 1,
-0.4161378, 0.6533696, -0.6068852, 0, 0, 1, 1, 1,
-0.4146717, -0.8553036, -3.27047, 1, 0, 0, 1, 1,
-0.4076149, -0.6469386, -4.699097, 1, 0, 0, 1, 1,
-0.4021751, -0.6482117, -3.085578, 1, 0, 0, 1, 1,
-0.4020338, -0.7063908, -2.100899, 1, 0, 0, 1, 1,
-0.3992746, -0.5121659, -3.09295, 1, 0, 0, 1, 1,
-0.3921005, -1.011679, -2.965821, 0, 0, 0, 1, 1,
-0.3871464, 0.1435721, -1.513799, 0, 0, 0, 1, 1,
-0.3869617, -0.8929984, -2.313493, 0, 0, 0, 1, 1,
-0.3835295, 0.3224304, -0.9590845, 0, 0, 0, 1, 1,
-0.3787291, -0.1172668, -2.438392, 0, 0, 0, 1, 1,
-0.37644, -0.4158724, -2.745317, 0, 0, 0, 1, 1,
-0.3753752, -1.303569, -2.372361, 0, 0, 0, 1, 1,
-0.3724596, -0.2545204, -3.232048, 1, 1, 1, 1, 1,
-0.3680055, -0.3906637, -0.746305, 1, 1, 1, 1, 1,
-0.3550421, -0.05829436, -1.90857, 1, 1, 1, 1, 1,
-0.3522472, -2.563379, -4.391364, 1, 1, 1, 1, 1,
-0.351713, -0.5602685, -2.724883, 1, 1, 1, 1, 1,
-0.3504936, 1.187173, -0.86831, 1, 1, 1, 1, 1,
-0.3488546, 0.8335754, 0.829509, 1, 1, 1, 1, 1,
-0.3478994, -0.6759437, -2.255795, 1, 1, 1, 1, 1,
-0.347413, -0.5588311, -2.78245, 1, 1, 1, 1, 1,
-0.3459259, -0.489439, -0.2220094, 1, 1, 1, 1, 1,
-0.3456392, -0.7667723, -2.87197, 1, 1, 1, 1, 1,
-0.3445468, 0.003909888, -2.453864, 1, 1, 1, 1, 1,
-0.3427329, 0.588301, 0.0680549, 1, 1, 1, 1, 1,
-0.339498, -0.5936643, -1.991163, 1, 1, 1, 1, 1,
-0.3380367, -1.078928, -4.253195, 1, 1, 1, 1, 1,
-0.3295577, -0.2494372, -4.0071, 0, 0, 1, 1, 1,
-0.3283255, -1.513893, -4.345797, 1, 0, 0, 1, 1,
-0.3262451, 1.322729, -1.205475, 1, 0, 0, 1, 1,
-0.3217365, -0.5654137, -3.631575, 1, 0, 0, 1, 1,
-0.3144642, -0.4817231, -2.716344, 1, 0, 0, 1, 1,
-0.3070686, 0.7553721, 1.177759, 1, 0, 0, 1, 1,
-0.3044267, -0.5266098, -2.763238, 0, 0, 0, 1, 1,
-0.3042647, 0.8581581, -1.069898, 0, 0, 0, 1, 1,
-0.3041329, -1.460938, -4.954824, 0, 0, 0, 1, 1,
-0.3030724, -1.468111, -1.87748, 0, 0, 0, 1, 1,
-0.3013706, 0.7354755, 0.7341185, 0, 0, 0, 1, 1,
-0.3007543, -0.8742877, -1.832875, 0, 0, 0, 1, 1,
-0.299978, 0.4108625, -0.6283395, 0, 0, 0, 1, 1,
-0.2928399, 0.1275814, -1.499951, 1, 1, 1, 1, 1,
-0.2922469, 0.7030695, -0.3365949, 1, 1, 1, 1, 1,
-0.2921744, -0.8984547, -3.420019, 1, 1, 1, 1, 1,
-0.2898896, 0.1977767, -0.605822, 1, 1, 1, 1, 1,
-0.2887921, 0.3176082, -1.299037, 1, 1, 1, 1, 1,
-0.2881917, -0.9007972, -3.005462, 1, 1, 1, 1, 1,
-0.2857272, 0.3532707, -1.113014, 1, 1, 1, 1, 1,
-0.2838756, -0.9385512, -4.394997, 1, 1, 1, 1, 1,
-0.2838008, -0.5164278, -2.354376, 1, 1, 1, 1, 1,
-0.2818451, -0.9166257, -2.60355, 1, 1, 1, 1, 1,
-0.2747664, -0.08854286, -2.786047, 1, 1, 1, 1, 1,
-0.27218, -0.6353568, -0.4517055, 1, 1, 1, 1, 1,
-0.26894, 0.8107178, 0.417436, 1, 1, 1, 1, 1,
-0.2674669, -1.280949, -3.47589, 1, 1, 1, 1, 1,
-0.2643243, -1.107802, -4.701795, 1, 1, 1, 1, 1,
-0.2593265, 1.219213, 0.06595146, 0, 0, 1, 1, 1,
-0.2581141, -0.3720053, -0.5436467, 1, 0, 0, 1, 1,
-0.2548524, -1.922077, -2.286786, 1, 0, 0, 1, 1,
-0.2547165, 0.9963113, -0.6633112, 1, 0, 0, 1, 1,
-0.2533762, 0.01492263, -2.963962, 1, 0, 0, 1, 1,
-0.2528089, -0.8287174, -2.848204, 1, 0, 0, 1, 1,
-0.2508081, 0.1533779, 1.137172, 0, 0, 0, 1, 1,
-0.2463679, -1.210205, -2.330898, 0, 0, 0, 1, 1,
-0.2457121, -0.3246925, -2.997092, 0, 0, 0, 1, 1,
-0.2454462, 0.311905, 0.257023, 0, 0, 0, 1, 1,
-0.2445065, -1.309795, -2.895877, 0, 0, 0, 1, 1,
-0.2416978, -2.67391, -2.874283, 0, 0, 0, 1, 1,
-0.2409042, 0.9977205, 0.5972052, 0, 0, 0, 1, 1,
-0.2404269, 2.770202, -1.919541, 1, 1, 1, 1, 1,
-0.2292184, 1.282786, -0.9569661, 1, 1, 1, 1, 1,
-0.2256052, 0.005363227, -1.333804, 1, 1, 1, 1, 1,
-0.2218954, 0.1115553, -2.190591, 1, 1, 1, 1, 1,
-0.2213543, 0.4877917, -0.2723245, 1, 1, 1, 1, 1,
-0.2209864, 0.912851, 0.3330187, 1, 1, 1, 1, 1,
-0.218162, 0.6414424, -0.2515089, 1, 1, 1, 1, 1,
-0.217305, 0.1839648, 1.127187, 1, 1, 1, 1, 1,
-0.2138975, -1.006925, -1.977795, 1, 1, 1, 1, 1,
-0.2106118, -0.5808837, -3.468647, 1, 1, 1, 1, 1,
-0.207319, 0.2357418, -0.06362454, 1, 1, 1, 1, 1,
-0.2065988, 1.106192, -0.1149302, 1, 1, 1, 1, 1,
-0.2059827, 0.4417737, 1.106535, 1, 1, 1, 1, 1,
-0.2040447, 0.8153912, -0.982338, 1, 1, 1, 1, 1,
-0.1999637, 1.426531, -0.09879738, 1, 1, 1, 1, 1,
-0.1943456, -2.26945, -2.312374, 0, 0, 1, 1, 1,
-0.1931414, 0.446499, -0.9002243, 1, 0, 0, 1, 1,
-0.1926586, 0.7805241, 1.275893, 1, 0, 0, 1, 1,
-0.1870542, -0.3523774, -3.560687, 1, 0, 0, 1, 1,
-0.1867484, -1.575426, -3.020157, 1, 0, 0, 1, 1,
-0.1819085, -1.162066, -0.2843746, 1, 0, 0, 1, 1,
-0.1819069, -1.671655, -1.724603, 0, 0, 0, 1, 1,
-0.1793006, -1.0389, -2.114009, 0, 0, 0, 1, 1,
-0.1730797, 0.0007768327, -3.248285, 0, 0, 0, 1, 1,
-0.1727666, 0.8158663, -0.8502489, 0, 0, 0, 1, 1,
-0.1715845, -0.8593277, -3.001755, 0, 0, 0, 1, 1,
-0.1713071, 0.2631227, -1.0184, 0, 0, 0, 1, 1,
-0.1679494, -0.381727, -2.286194, 0, 0, 0, 1, 1,
-0.164025, 0.1682512, -0.9152523, 1, 1, 1, 1, 1,
-0.1609229, -0.2517441, -4.081261, 1, 1, 1, 1, 1,
-0.1586476, -0.3187004, -1.598412, 1, 1, 1, 1, 1,
-0.1512441, -0.3731391, -1.722629, 1, 1, 1, 1, 1,
-0.1398022, -0.9525857, -3.580343, 1, 1, 1, 1, 1,
-0.1358423, -0.2452867, -3.748408, 1, 1, 1, 1, 1,
-0.1333724, 0.3971573, -0.1360923, 1, 1, 1, 1, 1,
-0.1324898, 1.728476, -0.09872501, 1, 1, 1, 1, 1,
-0.131312, -0.5506171, -3.241914, 1, 1, 1, 1, 1,
-0.1292765, 0.5973811, -0.9611313, 1, 1, 1, 1, 1,
-0.1257951, 0.7160857, 0.9028854, 1, 1, 1, 1, 1,
-0.1227758, 1.101061, -0.1095772, 1, 1, 1, 1, 1,
-0.1217698, 0.5215924, 0.1133961, 1, 1, 1, 1, 1,
-0.1214922, 0.6947113, 1.837671, 1, 1, 1, 1, 1,
-0.121269, -0.02552855, -2.365088, 1, 1, 1, 1, 1,
-0.1211268, 1.695986, -0.1436987, 0, 0, 1, 1, 1,
-0.1184527, -1.353065, -3.64957, 1, 0, 0, 1, 1,
-0.1149621, -1.276442, -4.540326, 1, 0, 0, 1, 1,
-0.1142461, 1.168485, -1.670176, 1, 0, 0, 1, 1,
-0.1134382, -0.3537506, -1.345316, 1, 0, 0, 1, 1,
-0.1130961, -0.6003665, -1.010947, 1, 0, 0, 1, 1,
-0.1114628, 0.9786605, -1.153682, 0, 0, 0, 1, 1,
-0.1111731, 0.6629422, -0.09417519, 0, 0, 0, 1, 1,
-0.1101563, 0.6347075, 0.3438247, 0, 0, 0, 1, 1,
-0.1099196, -0.4335359, -2.541012, 0, 0, 0, 1, 1,
-0.1077376, 0.06259901, -0.8639363, 0, 0, 0, 1, 1,
-0.1047491, -1.358772, -3.155598, 0, 0, 0, 1, 1,
-0.1026167, 1.155663, 0.2165572, 0, 0, 0, 1, 1,
-0.0937201, 1.150464, 0.4402828, 1, 1, 1, 1, 1,
-0.09114131, 0.02882788, -1.076658, 1, 1, 1, 1, 1,
-0.08972, 1.280421, 0.1774813, 1, 1, 1, 1, 1,
-0.08820142, 0.7593107, 0.1455359, 1, 1, 1, 1, 1,
-0.08572034, 1.646772, -0.09422059, 1, 1, 1, 1, 1,
-0.08513252, 0.834785, -0.3831996, 1, 1, 1, 1, 1,
-0.08155609, -0.2986794, -3.006845, 1, 1, 1, 1, 1,
-0.0766165, 0.4923835, -0.4986145, 1, 1, 1, 1, 1,
-0.0758796, -1.170663, -2.618357, 1, 1, 1, 1, 1,
-0.07533709, -1.073249, -3.036294, 1, 1, 1, 1, 1,
-0.07316146, -0.03563035, -3.491177, 1, 1, 1, 1, 1,
-0.07196137, 0.0005878194, -3.247889, 1, 1, 1, 1, 1,
-0.06414606, -0.6822575, -2.663103, 1, 1, 1, 1, 1,
-0.06196186, -0.2687094, -3.418447, 1, 1, 1, 1, 1,
-0.06039783, -0.0119126, -2.956178, 1, 1, 1, 1, 1,
-0.05415886, 0.5880274, -0.1520395, 0, 0, 1, 1, 1,
-0.05192584, -1.721386, -3.919556, 1, 0, 0, 1, 1,
-0.04970372, 0.6929287, -1.730177, 1, 0, 0, 1, 1,
-0.04866802, -0.3235487, -1.169217, 1, 0, 0, 1, 1,
-0.04588236, 0.7868625, -2.327337, 1, 0, 0, 1, 1,
-0.04316547, -0.541543, -3.532906, 1, 0, 0, 1, 1,
-0.0388451, 0.6117271, 0.1045484, 0, 0, 0, 1, 1,
-0.03859933, -0.04600857, -1.287015, 0, 0, 0, 1, 1,
-0.03757373, -1.14239, -3.455128, 0, 0, 0, 1, 1,
-0.03395396, -1.450452, -2.432348, 0, 0, 0, 1, 1,
-0.03371383, -0.1606607, -3.77449, 0, 0, 0, 1, 1,
-0.03348422, 0.758535, 0.07612669, 0, 0, 0, 1, 1,
-0.02290483, -0.2086595, -3.901062, 0, 0, 0, 1, 1,
-0.02070768, -0.02024277, -2.703182, 1, 1, 1, 1, 1,
-0.01881345, -2.011017, -2.23111, 1, 1, 1, 1, 1,
-0.01637406, -0.0827417, -0.7818801, 1, 1, 1, 1, 1,
-0.01300602, 0.6590617, 1.184931, 1, 1, 1, 1, 1,
-0.007588111, 0.6928614, -0.4826989, 1, 1, 1, 1, 1,
0.002552721, -1.508526, 1.528685, 1, 1, 1, 1, 1,
0.003689599, 0.3245221, 0.5421752, 1, 1, 1, 1, 1,
0.007947774, 0.7242401, -0.5837284, 1, 1, 1, 1, 1,
0.007994241, -0.3474195, 1.037428, 1, 1, 1, 1, 1,
0.008869907, 0.5669265, -0.9430371, 1, 1, 1, 1, 1,
0.009004965, 0.9748046, 0.5176159, 1, 1, 1, 1, 1,
0.01498365, -0.1296377, 2.511956, 1, 1, 1, 1, 1,
0.020446, 1.574981, -1.120708, 1, 1, 1, 1, 1,
0.02149044, -1.784703, 2.704076, 1, 1, 1, 1, 1,
0.02182646, -0.1159691, 3.219314, 1, 1, 1, 1, 1,
0.02399268, 0.6657758, -0.1168564, 0, 0, 1, 1, 1,
0.02798974, 0.1409447, 0.8973901, 1, 0, 0, 1, 1,
0.02805114, 0.9333814, -1.571215, 1, 0, 0, 1, 1,
0.03454687, 0.8919213, 0.07373047, 1, 0, 0, 1, 1,
0.03789125, -1.0768, 3.833051, 1, 0, 0, 1, 1,
0.04000461, -0.840358, 1.29291, 1, 0, 0, 1, 1,
0.04029294, 0.07288568, 0.4022624, 0, 0, 0, 1, 1,
0.04182518, 0.3328879, -0.2272661, 0, 0, 0, 1, 1,
0.0435512, -0.8159633, 3.85908, 0, 0, 0, 1, 1,
0.04712882, 0.5244577, -1.714751, 0, 0, 0, 1, 1,
0.04755073, 1.283675, -2.604556, 0, 0, 0, 1, 1,
0.04808048, 0.3071095, -0.2043023, 0, 0, 0, 1, 1,
0.0494665, 0.4776531, -0.8726239, 0, 0, 0, 1, 1,
0.05261162, -1.205459, 2.736434, 1, 1, 1, 1, 1,
0.05310703, -1.184996, 1.017294, 1, 1, 1, 1, 1,
0.0563915, -1.474002, 3.589313, 1, 1, 1, 1, 1,
0.05909308, -0.7580609, 2.811423, 1, 1, 1, 1, 1,
0.05909701, -0.4961017, 3.817046, 1, 1, 1, 1, 1,
0.06212984, -0.4272659, 6.015374, 1, 1, 1, 1, 1,
0.06223538, -0.6420287, 2.849174, 1, 1, 1, 1, 1,
0.0640478, -2.387098, 3.917052, 1, 1, 1, 1, 1,
0.07117674, 1.599542, -1.046834, 1, 1, 1, 1, 1,
0.07699791, -0.3906402, 3.406863, 1, 1, 1, 1, 1,
0.08319402, 1.025495, -1.000936, 1, 1, 1, 1, 1,
0.08369699, -0.005282312, 0.569744, 1, 1, 1, 1, 1,
0.08654898, -0.481906, 2.222981, 1, 1, 1, 1, 1,
0.09025187, -2.405447, 3.973799, 1, 1, 1, 1, 1,
0.09057181, -0.8608317, 2.935133, 1, 1, 1, 1, 1,
0.09319019, 0.2538007, -0.4590912, 0, 0, 1, 1, 1,
0.09519115, -1.132874, 3.014922, 1, 0, 0, 1, 1,
0.09520455, -0.2743446, 3.392905, 1, 0, 0, 1, 1,
0.09550842, 0.5934738, -0.2326214, 1, 0, 0, 1, 1,
0.09790081, 0.1318109, -0.1390199, 1, 0, 0, 1, 1,
0.0992107, 1.641888, 0.9801235, 1, 0, 0, 1, 1,
0.1036056, 0.2544912, 3.131115, 0, 0, 0, 1, 1,
0.1090076, 0.5637172, 0.7478555, 0, 0, 0, 1, 1,
0.109409, -1.136908, 2.70498, 0, 0, 0, 1, 1,
0.1107305, -0.2876176, 1.173724, 0, 0, 0, 1, 1,
0.1108786, 0.3242546, 1.837633, 0, 0, 0, 1, 1,
0.1154123, 1.686647, 0.4758382, 0, 0, 0, 1, 1,
0.1154288, 0.260577, -0.1333155, 0, 0, 0, 1, 1,
0.1238709, 0.4959834, -0.7802899, 1, 1, 1, 1, 1,
0.1295929, 1.23551, 1.035635, 1, 1, 1, 1, 1,
0.1297257, 0.6577938, -0.4968787, 1, 1, 1, 1, 1,
0.1303051, -0.4356073, 4.058864, 1, 1, 1, 1, 1,
0.1304973, -0.7061502, 1.396339, 1, 1, 1, 1, 1,
0.1319214, 0.2904296, 0.1201501, 1, 1, 1, 1, 1,
0.1327585, 1.512224, 1.179431, 1, 1, 1, 1, 1,
0.1342902, 0.01078714, -0.5443119, 1, 1, 1, 1, 1,
0.1382587, -0.08090015, 1.440807, 1, 1, 1, 1, 1,
0.1408483, -0.26939, 2.871505, 1, 1, 1, 1, 1,
0.1527666, -0.2100859, 1.689592, 1, 1, 1, 1, 1,
0.1551679, -0.3709667, 0.9588385, 1, 1, 1, 1, 1,
0.1618944, -0.4616339, 3.36664, 1, 1, 1, 1, 1,
0.1680428, 1.411603, 0.7111077, 1, 1, 1, 1, 1,
0.168393, -2.283234, 4.586554, 1, 1, 1, 1, 1,
0.1712955, -1.203008, 0.8615792, 0, 0, 1, 1, 1,
0.1719663, -1.422454, 5.604982, 1, 0, 0, 1, 1,
0.174296, -1.328442, 3.267406, 1, 0, 0, 1, 1,
0.186186, 0.2893883, 2.054373, 1, 0, 0, 1, 1,
0.1880469, 0.2279867, 1.270217, 1, 0, 0, 1, 1,
0.1881475, -0.08214366, 1.645251, 1, 0, 0, 1, 1,
0.1903996, 1.095827, 1.112759, 0, 0, 0, 1, 1,
0.1912364, -0.08535516, 1.093385, 0, 0, 0, 1, 1,
0.1927178, -0.4470228, 1.19208, 0, 0, 0, 1, 1,
0.1938518, 0.697861, 0.4410951, 0, 0, 0, 1, 1,
0.1999849, -0.2251694, 3.58278, 0, 0, 0, 1, 1,
0.2016084, 0.7160166, 1.324721, 0, 0, 0, 1, 1,
0.2025958, 0.6799501, 1.55944, 0, 0, 0, 1, 1,
0.2027437, 0.4843689, -1.127023, 1, 1, 1, 1, 1,
0.2064097, -0.1790377, 0.7230968, 1, 1, 1, 1, 1,
0.2085024, -1.280816, 3.521995, 1, 1, 1, 1, 1,
0.2122599, 0.2302168, 0.4372377, 1, 1, 1, 1, 1,
0.2151681, 1.016569, 0.3061175, 1, 1, 1, 1, 1,
0.2154382, -0.8718586, 2.236074, 1, 1, 1, 1, 1,
0.2163538, -1.201535, 1.753489, 1, 1, 1, 1, 1,
0.2180599, -0.03335252, 0.8250127, 1, 1, 1, 1, 1,
0.2191126, 0.8757028, 1.934414, 1, 1, 1, 1, 1,
0.2206581, 0.01456735, 1.017745, 1, 1, 1, 1, 1,
0.2219421, -1.624371, 4.927866, 1, 1, 1, 1, 1,
0.2228937, 0.3601863, 0.2830526, 1, 1, 1, 1, 1,
0.2248961, 0.1998766, 0.5919645, 1, 1, 1, 1, 1,
0.2269365, -0.3694828, 2.983232, 1, 1, 1, 1, 1,
0.2298549, 0.9802656, 0.7687263, 1, 1, 1, 1, 1,
0.2484032, 0.3857748, -0.3675988, 0, 0, 1, 1, 1,
0.2492893, 0.3222961, 0.3690175, 1, 0, 0, 1, 1,
0.2515852, -0.9900006, 3.145785, 1, 0, 0, 1, 1,
0.252092, -1.529199, 2.516166, 1, 0, 0, 1, 1,
0.2552877, -1.976099, 4.199191, 1, 0, 0, 1, 1,
0.2564895, 2.279293, 0.3204846, 1, 0, 0, 1, 1,
0.263092, -1.259176, 5.497985, 0, 0, 0, 1, 1,
0.2641551, 0.3230098, 0.2303685, 0, 0, 0, 1, 1,
0.2673965, 1.654699, -1.311894, 0, 0, 0, 1, 1,
0.2688019, 0.3601957, 1.652143, 0, 0, 0, 1, 1,
0.2693512, 0.9739239, 0.08368717, 0, 0, 0, 1, 1,
0.2693883, -0.137972, 3.080611, 0, 0, 0, 1, 1,
0.2725726, -0.1295074, 1.369211, 0, 0, 0, 1, 1,
0.274278, 1.462126, -0.9867504, 1, 1, 1, 1, 1,
0.2754107, 0.6141219, 1.314094, 1, 1, 1, 1, 1,
0.2779989, 0.7060205, 0.5294191, 1, 1, 1, 1, 1,
0.2784342, 0.2297235, 2.046798, 1, 1, 1, 1, 1,
0.2792436, -1.374813, 1.632327, 1, 1, 1, 1, 1,
0.2803152, 1.714235, 0.6463687, 1, 1, 1, 1, 1,
0.2805074, -0.08111294, 0.3927441, 1, 1, 1, 1, 1,
0.286969, 1.58556, -0.9965551, 1, 1, 1, 1, 1,
0.2890923, -0.9089197, 2.143761, 1, 1, 1, 1, 1,
0.2914629, 0.6798802, -0.9297549, 1, 1, 1, 1, 1,
0.2938572, 1.511531, -2.067531, 1, 1, 1, 1, 1,
0.2942993, 1.060975, 0.4993169, 1, 1, 1, 1, 1,
0.2966659, 0.4567603, 1.816015, 1, 1, 1, 1, 1,
0.2982468, -1.535605, 3.612933, 1, 1, 1, 1, 1,
0.2996757, -0.6209617, 1.1977, 1, 1, 1, 1, 1,
0.3001005, 0.09992983, 2.497654, 0, 0, 1, 1, 1,
0.3012726, -0.9573079, 1.012827, 1, 0, 0, 1, 1,
0.3025171, 1.463263, 0.9114063, 1, 0, 0, 1, 1,
0.3043107, -0.1987866, 0.6982237, 1, 0, 0, 1, 1,
0.30437, -0.8892606, 1.885605, 1, 0, 0, 1, 1,
0.3067824, -1.850016, 1.390527, 1, 0, 0, 1, 1,
0.3079848, -0.401978, 3.729688, 0, 0, 0, 1, 1,
0.3082152, -0.2989182, 1.739098, 0, 0, 0, 1, 1,
0.316259, -0.7021664, 2.511618, 0, 0, 0, 1, 1,
0.3170001, 1.453236, 0.6411898, 0, 0, 0, 1, 1,
0.3216545, -2.035849, 4.19125, 0, 0, 0, 1, 1,
0.3218328, -0.9903589, 3.534834, 0, 0, 0, 1, 1,
0.3229178, 0.1413093, 2.420338, 0, 0, 0, 1, 1,
0.324144, 0.9270268, -0.4632298, 1, 1, 1, 1, 1,
0.3248208, 0.4345396, -1.770487, 1, 1, 1, 1, 1,
0.3253878, 0.4331827, 0.8958878, 1, 1, 1, 1, 1,
0.3267934, 0.7395899, 2.817439, 1, 1, 1, 1, 1,
0.3274874, -0.3277942, 2.42281, 1, 1, 1, 1, 1,
0.3349864, 1.113523, 1.38891, 1, 1, 1, 1, 1,
0.3360561, 0.420886, 1.966983, 1, 1, 1, 1, 1,
0.3363029, 0.9054568, -0.1071728, 1, 1, 1, 1, 1,
0.3404286, 2.100586, 0.01078811, 1, 1, 1, 1, 1,
0.3450097, -1.154184, 2.36924, 1, 1, 1, 1, 1,
0.3500224, -0.5266566, 1.878485, 1, 1, 1, 1, 1,
0.3522913, -2.801506, 4.962966, 1, 1, 1, 1, 1,
0.3537001, -0.4391244, 1.034058, 1, 1, 1, 1, 1,
0.3602961, 0.6745419, 0.4423865, 1, 1, 1, 1, 1,
0.3613552, -0.2757561, 0.8311924, 1, 1, 1, 1, 1,
0.3684455, -1.043172, 1.635755, 0, 0, 1, 1, 1,
0.3684637, -0.4774449, 0.7888799, 1, 0, 0, 1, 1,
0.3703108, -0.8477796, 3.470429, 1, 0, 0, 1, 1,
0.3708364, 0.880892, -0.6763029, 1, 0, 0, 1, 1,
0.3711855, -0.4348605, 2.425309, 1, 0, 0, 1, 1,
0.3731384, 1.415757, 1.385927, 1, 0, 0, 1, 1,
0.3755623, 0.8956608, 1.608931, 0, 0, 0, 1, 1,
0.3797754, 1.031531, 1.028272, 0, 0, 0, 1, 1,
0.3851659, -0.3732917, 1.159193, 0, 0, 0, 1, 1,
0.3895769, -0.2840646, 1.294742, 0, 0, 0, 1, 1,
0.3916958, -0.8443485, 2.441405, 0, 0, 0, 1, 1,
0.3988029, -1.260877, 2.312825, 0, 0, 0, 1, 1,
0.4027822, -0.08796953, 2.541112, 0, 0, 0, 1, 1,
0.4137574, -0.06621808, 2.904004, 1, 1, 1, 1, 1,
0.4152563, -0.2617854, 1.06354, 1, 1, 1, 1, 1,
0.4165018, 0.9082611, -0.3778852, 1, 1, 1, 1, 1,
0.4177234, 1.592076, 1.78437, 1, 1, 1, 1, 1,
0.4361084, -1.862066, 3.182741, 1, 1, 1, 1, 1,
0.4367002, 0.9726155, 0.2242683, 1, 1, 1, 1, 1,
0.437862, 1.252817, 1.297611, 1, 1, 1, 1, 1,
0.4396646, -1.307083, 2.716039, 1, 1, 1, 1, 1,
0.4431396, -0.4848056, 3.788947, 1, 1, 1, 1, 1,
0.4449151, 0.5451618, 1.487353, 1, 1, 1, 1, 1,
0.4468382, -0.2679884, 3.522522, 1, 1, 1, 1, 1,
0.4477941, -0.6034986, 2.762291, 1, 1, 1, 1, 1,
0.4497774, 0.1082737, 0.9121965, 1, 1, 1, 1, 1,
0.4499974, -0.4023757, 0.4743028, 1, 1, 1, 1, 1,
0.4553043, -0.9000571, 2.300729, 1, 1, 1, 1, 1,
0.4564592, -0.2303039, 0.5667121, 0, 0, 1, 1, 1,
0.4583265, 1.144668, 1.277675, 1, 0, 0, 1, 1,
0.4615443, 0.3113215, 1.960551, 1, 0, 0, 1, 1,
0.4618059, 0.07798745, -0.1009221, 1, 0, 0, 1, 1,
0.462593, 0.3925859, -0.6049005, 1, 0, 0, 1, 1,
0.4670283, 0.1364338, 1.584087, 1, 0, 0, 1, 1,
0.4709677, -0.6393013, 2.32673, 0, 0, 0, 1, 1,
0.4736842, -0.270411, 2.684547, 0, 0, 0, 1, 1,
0.4737612, 0.4302335, 0.6540588, 0, 0, 0, 1, 1,
0.4815632, -0.04340435, 1.334873, 0, 0, 0, 1, 1,
0.4856651, -0.8580164, 2.125116, 0, 0, 0, 1, 1,
0.4880272, 0.7327524, -0.06769288, 0, 0, 0, 1, 1,
0.4882405, 0.3846377, 1.583782, 0, 0, 0, 1, 1,
0.493718, 2.349416, -0.4499451, 1, 1, 1, 1, 1,
0.496214, -1.424358, 1.998317, 1, 1, 1, 1, 1,
0.5052604, 1.156085, 1.200165, 1, 1, 1, 1, 1,
0.5074902, 0.3832094, 0.9971435, 1, 1, 1, 1, 1,
0.5086547, -0.2228392, 2.699187, 1, 1, 1, 1, 1,
0.5090614, -1.68821, 3.274649, 1, 1, 1, 1, 1,
0.5113629, 1.280337, -0.3664178, 1, 1, 1, 1, 1,
0.5118999, -1.880602, 3.269628, 1, 1, 1, 1, 1,
0.5126812, 0.6432751, -0.1164589, 1, 1, 1, 1, 1,
0.513197, -0.02974691, 0.8663414, 1, 1, 1, 1, 1,
0.5142105, -0.5969554, 3.318683, 1, 1, 1, 1, 1,
0.5165019, 1.49827, -1.067905, 1, 1, 1, 1, 1,
0.5178595, 0.5346875, -0.671751, 1, 1, 1, 1, 1,
0.5220473, 1.428352, -1.377561, 1, 1, 1, 1, 1,
0.5275207, -0.2529387, 2.112246, 1, 1, 1, 1, 1,
0.5286613, 1.693914, -1.872183, 0, 0, 1, 1, 1,
0.5317827, -0.3257887, 1.743325, 1, 0, 0, 1, 1,
0.5351861, 0.9885218, 0.8842319, 1, 0, 0, 1, 1,
0.5355256, 0.07884452, 1.372385, 1, 0, 0, 1, 1,
0.5365576, 0.6103399, 2.33539, 1, 0, 0, 1, 1,
0.5382333, 1.764441, -1.612588, 1, 0, 0, 1, 1,
0.5426182, 0.1861852, -0.5132803, 0, 0, 0, 1, 1,
0.5434334, 0.1226965, 0.9645884, 0, 0, 0, 1, 1,
0.5441991, 0.8887008, -0.8196815, 0, 0, 0, 1, 1,
0.5653146, 1.555192, -0.2914529, 0, 0, 0, 1, 1,
0.5742211, -0.08260402, 1.909266, 0, 0, 0, 1, 1,
0.5765166, 0.2255949, -0.2996106, 0, 0, 0, 1, 1,
0.5777841, 0.8014644, 1.976724, 0, 0, 0, 1, 1,
0.5803426, -1.046174, 3.091912, 1, 1, 1, 1, 1,
0.5839695, 0.4326032, -0.6680552, 1, 1, 1, 1, 1,
0.5909765, -0.1218426, 2.017792, 1, 1, 1, 1, 1,
0.5924897, 0.8875847, 1.171132, 1, 1, 1, 1, 1,
0.5951787, 0.7085008, 1.393616, 1, 1, 1, 1, 1,
0.5957943, 0.4682046, 0.5649373, 1, 1, 1, 1, 1,
0.5959988, 0.2483996, 3.741128, 1, 1, 1, 1, 1,
0.5968979, 1.095703, -0.06792086, 1, 1, 1, 1, 1,
0.598812, -1.348965, 2.810696, 1, 1, 1, 1, 1,
0.5995699, -0.62115, 2.102155, 1, 1, 1, 1, 1,
0.6035358, 0.06660701, 2.0389, 1, 1, 1, 1, 1,
0.6047746, 0.6620477, 0.5459504, 1, 1, 1, 1, 1,
0.6073535, -0.3799634, 3.13071, 1, 1, 1, 1, 1,
0.6132577, 0.2226413, 1.145823, 1, 1, 1, 1, 1,
0.6181666, -0.3246204, 2.081817, 1, 1, 1, 1, 1,
0.6214613, 0.6469079, -0.5423645, 0, 0, 1, 1, 1,
0.6221602, -1.082814, 2.199883, 1, 0, 0, 1, 1,
0.6245419, -0.8523127, 3.333803, 1, 0, 0, 1, 1,
0.625269, -0.7402182, 1.303714, 1, 0, 0, 1, 1,
0.626158, -0.0981311, 1.856401, 1, 0, 0, 1, 1,
0.6265975, -0.08268913, 1.529843, 1, 0, 0, 1, 1,
0.6276396, -0.6590962, 2.255697, 0, 0, 0, 1, 1,
0.6289949, 1.0352, 0.2246437, 0, 0, 0, 1, 1,
0.6292912, 1.498365, -2.502979, 0, 0, 0, 1, 1,
0.6378453, -1.567797, 4.413592, 0, 0, 0, 1, 1,
0.6410351, 0.3884214, -0.1468935, 0, 0, 0, 1, 1,
0.6443772, -0.0672309, 2.731296, 0, 0, 0, 1, 1,
0.6460635, 0.1403171, 1.692098, 0, 0, 0, 1, 1,
0.6521324, 0.5314904, 1.772619, 1, 1, 1, 1, 1,
0.6531115, -1.895514, 3.023806, 1, 1, 1, 1, 1,
0.6537363, 0.006707384, 1.396981, 1, 1, 1, 1, 1,
0.6576582, -1.032081, 1.289192, 1, 1, 1, 1, 1,
0.6599209, -0.2332693, 0.4835577, 1, 1, 1, 1, 1,
0.6608584, -0.8605605, 1.973789, 1, 1, 1, 1, 1,
0.6634757, -0.8007079, 4.493205, 1, 1, 1, 1, 1,
0.6643494, 0.7886822, 1.806401, 1, 1, 1, 1, 1,
0.6655071, -1.010825, 2.00416, 1, 1, 1, 1, 1,
0.6723779, -1.070472, 2.809134, 1, 1, 1, 1, 1,
0.6726928, -0.05676493, 1.564264, 1, 1, 1, 1, 1,
0.6786151, -1.710032, 3.165757, 1, 1, 1, 1, 1,
0.6800063, -1.080066, 2.987318, 1, 1, 1, 1, 1,
0.6810465, -0.06590965, 2.645923, 1, 1, 1, 1, 1,
0.683327, 1.743634, 1.355929, 1, 1, 1, 1, 1,
0.6879606, 0.2363038, 1.335802, 0, 0, 1, 1, 1,
0.6886098, -1.575158, 2.227399, 1, 0, 0, 1, 1,
0.6988126, -0.2231558, 2.098573, 1, 0, 0, 1, 1,
0.7005246, 0.491786, 0.5642437, 1, 0, 0, 1, 1,
0.7010698, -0.6848709, 2.094006, 1, 0, 0, 1, 1,
0.7035615, -1.009665, 2.10171, 1, 0, 0, 1, 1,
0.708286, 0.5435713, -0.1262386, 0, 0, 0, 1, 1,
0.7115386, -1.452638, 4.199312, 0, 0, 0, 1, 1,
0.7179883, -0.5822286, 2.590717, 0, 0, 0, 1, 1,
0.7197608, 0.06625056, 0.4146652, 0, 0, 0, 1, 1,
0.7316036, -0.9074671, 3.072453, 0, 0, 0, 1, 1,
0.7383215, 1.396273, 1.176849, 0, 0, 0, 1, 1,
0.7422646, 1.743948, 0.341314, 0, 0, 0, 1, 1,
0.7441435, -0.4332652, 2.683671, 1, 1, 1, 1, 1,
0.7448642, -0.1024778, 1.26318, 1, 1, 1, 1, 1,
0.7562348, -0.06228441, 2.884697, 1, 1, 1, 1, 1,
0.7574056, 0.292038, 1.459197, 1, 1, 1, 1, 1,
0.7649438, -1.270739, 3.896692, 1, 1, 1, 1, 1,
0.768397, -1.890243, 1.959659, 1, 1, 1, 1, 1,
0.768792, 0.2362188, 0.864253, 1, 1, 1, 1, 1,
0.77005, 0.1873292, -0.6938294, 1, 1, 1, 1, 1,
0.7762969, 0.2563048, 0.4073361, 1, 1, 1, 1, 1,
0.7775207, 1.492836, 0.836598, 1, 1, 1, 1, 1,
0.7838204, -0.5773959, 0.6011567, 1, 1, 1, 1, 1,
0.7848231, 0.1066458, 0.8169242, 1, 1, 1, 1, 1,
0.7922224, 0.4307544, 1.67898, 1, 1, 1, 1, 1,
0.7937627, -1.534478, 3.765129, 1, 1, 1, 1, 1,
0.7942158, 1.127433, -0.3344217, 1, 1, 1, 1, 1,
0.7980707, -0.8225645, 2.394617, 0, 0, 1, 1, 1,
0.8023667, 1.00803, 0.2310907, 1, 0, 0, 1, 1,
0.8030619, -0.4514734, 2.085737, 1, 0, 0, 1, 1,
0.8054902, -0.1776009, 0.4639196, 1, 0, 0, 1, 1,
0.8088139, 0.3242566, 1.238107, 1, 0, 0, 1, 1,
0.8209215, 0.6673267, 1.118183, 1, 0, 0, 1, 1,
0.8229566, -1.517202, 3.47548, 0, 0, 0, 1, 1,
0.8238631, 0.02252478, 1.936323, 0, 0, 0, 1, 1,
0.8283604, 0.1829619, 0.8667916, 0, 0, 0, 1, 1,
0.8320938, 0.8948669, 1.300954, 0, 0, 0, 1, 1,
0.8365915, -0.3788813, 0.411997, 0, 0, 0, 1, 1,
0.844453, -0.1671606, 1.450157, 0, 0, 0, 1, 1,
0.8491408, -1.202089, 0.668416, 0, 0, 0, 1, 1,
0.8493361, -0.5590038, 2.024878, 1, 1, 1, 1, 1,
0.8521676, -0.4247501, 2.101609, 1, 1, 1, 1, 1,
0.8547635, -0.5103503, 2.646725, 1, 1, 1, 1, 1,
0.8555909, -0.7577943, 2.865812, 1, 1, 1, 1, 1,
0.8567035, -1.53619, 2.725059, 1, 1, 1, 1, 1,
0.8578702, 0.1623634, 0.4223158, 1, 1, 1, 1, 1,
0.8584948, 1.952343, 1.015905, 1, 1, 1, 1, 1,
0.8633988, 0.4839108, 1.607328, 1, 1, 1, 1, 1,
0.8650731, -0.4353483, 2.226184, 1, 1, 1, 1, 1,
0.8715611, -1.872873, 2.263947, 1, 1, 1, 1, 1,
0.8751533, -0.1124861, 2.925741, 1, 1, 1, 1, 1,
0.8858091, -0.574843, 2.121297, 1, 1, 1, 1, 1,
0.8893499, 0.3137248, -0.7140695, 1, 1, 1, 1, 1,
0.8917445, -0.7988955, 2.005206, 1, 1, 1, 1, 1,
0.8980979, 0.3531826, 1.795004, 1, 1, 1, 1, 1,
0.901078, 1.982712, -0.3808391, 0, 0, 1, 1, 1,
0.9114539, -0.4012058, 2.846731, 1, 0, 0, 1, 1,
0.9118126, 0.7653415, 1.184647, 1, 0, 0, 1, 1,
0.9145877, 0.8334782, 1.646789, 1, 0, 0, 1, 1,
0.9186499, 1.254126, 1.136424, 1, 0, 0, 1, 1,
0.9208844, 0.03864071, 1.201829, 1, 0, 0, 1, 1,
0.9227254, -1.738017, 3.70427, 0, 0, 0, 1, 1,
0.9267378, -2.150334, 3.435245, 0, 0, 0, 1, 1,
0.9278011, 0.2461923, 0.1346034, 0, 0, 0, 1, 1,
0.9336655, -0.1624383, 2.73743, 0, 0, 0, 1, 1,
0.9369183, 0.5250695, 2.585053, 0, 0, 0, 1, 1,
0.9394512, -0.2625055, 0.166252, 0, 0, 0, 1, 1,
0.9461421, 1.040805, 1.851461, 0, 0, 0, 1, 1,
0.9484326, -1.042626, 2.422141, 1, 1, 1, 1, 1,
0.9496663, 0.3921237, 2.413977, 1, 1, 1, 1, 1,
0.9504063, 0.5243405, 1.027706, 1, 1, 1, 1, 1,
0.9618033, 0.413522, 0.8057781, 1, 1, 1, 1, 1,
0.972728, 0.1231042, 2.738438, 1, 1, 1, 1, 1,
0.9773937, -1.596068, 3.157207, 1, 1, 1, 1, 1,
0.979793, 0.83122, 1.004742, 1, 1, 1, 1, 1,
0.9856542, 1.753381, 1.226801, 1, 1, 1, 1, 1,
0.9870459, -0.526935, 0.4231139, 1, 1, 1, 1, 1,
0.9878415, 0.1378891, 1.661912, 1, 1, 1, 1, 1,
0.9920572, -0.2740781, 1.274352, 1, 1, 1, 1, 1,
0.9923814, 0.2475138, 0.08557327, 1, 1, 1, 1, 1,
0.9949694, -0.2761157, 2.429281, 1, 1, 1, 1, 1,
0.9994017, 0.4942563, 0.1168181, 1, 1, 1, 1, 1,
1.002118, 0.7921728, 1.812925, 1, 1, 1, 1, 1,
1.005318, 1.353583, -0.3834152, 0, 0, 1, 1, 1,
1.006544, -1.410553, 2.745054, 1, 0, 0, 1, 1,
1.008822, -0.7416764, 0.6535636, 1, 0, 0, 1, 1,
1.009584, 0.4215645, 2.889952, 1, 0, 0, 1, 1,
1.021096, 0.2360023, 2.343556, 1, 0, 0, 1, 1,
1.021568, 0.4130196, 2.533207, 1, 0, 0, 1, 1,
1.023177, 0.8986464, 0.2093408, 0, 0, 0, 1, 1,
1.024847, -0.920891, 2.581778, 0, 0, 0, 1, 1,
1.02737, -0.01206166, 0.8764042, 0, 0, 0, 1, 1,
1.029072, -0.2643037, 1.788324, 0, 0, 0, 1, 1,
1.029108, 1.358425, 0.2687682, 0, 0, 0, 1, 1,
1.033311, -0.09192268, 2.460934, 0, 0, 0, 1, 1,
1.034582, -0.5176851, 2.729458, 0, 0, 0, 1, 1,
1.039065, -0.8807662, 2.547684, 1, 1, 1, 1, 1,
1.039089, -0.1428249, 2.71038, 1, 1, 1, 1, 1,
1.043249, 0.7508565, 0.5745121, 1, 1, 1, 1, 1,
1.043462, 0.07856491, 3.245868, 1, 1, 1, 1, 1,
1.056916, 0.3585053, 0.5011253, 1, 1, 1, 1, 1,
1.058917, 0.1433519, 1.398964, 1, 1, 1, 1, 1,
1.061698, -0.1779412, 1.207412, 1, 1, 1, 1, 1,
1.062098, 0.9602027, 0.07254953, 1, 1, 1, 1, 1,
1.06694, 0.7279577, 0.7968062, 1, 1, 1, 1, 1,
1.076675, -0.5515739, 1.84671, 1, 1, 1, 1, 1,
1.078795, -0.4211101, 1.365, 1, 1, 1, 1, 1,
1.086419, -0.02087314, 0.9036979, 1, 1, 1, 1, 1,
1.088093, -0.1272082, 2.495986, 1, 1, 1, 1, 1,
1.091334, 0.3622882, -0.1635535, 1, 1, 1, 1, 1,
1.093314, 1.46179, -0.7864744, 1, 1, 1, 1, 1,
1.09455, 0.6283124, 0.4473785, 0, 0, 1, 1, 1,
1.096596, -0.1675728, 0.9413515, 1, 0, 0, 1, 1,
1.098094, -2.049949, 1.880295, 1, 0, 0, 1, 1,
1.098838, -2.345027, 2.163443, 1, 0, 0, 1, 1,
1.103199, -0.4345038, 3.460732, 1, 0, 0, 1, 1,
1.114116, -0.4798873, 1.509054, 1, 0, 0, 1, 1,
1.12721, 0.1194045, 2.741794, 0, 0, 0, 1, 1,
1.127357, 0.254609, 1.986516, 0, 0, 0, 1, 1,
1.13102, -1.839081, 4.239701, 0, 0, 0, 1, 1,
1.142215, 0.6567671, 0.4505492, 0, 0, 0, 1, 1,
1.155077, -0.7590011, 1.737183, 0, 0, 0, 1, 1,
1.156344, 1.352645, 1.831846, 0, 0, 0, 1, 1,
1.169077, -1.242808, 1.59666, 0, 0, 0, 1, 1,
1.186764, -0.379219, 2.899437, 1, 1, 1, 1, 1,
1.189851, 0.6777163, 0.6855363, 1, 1, 1, 1, 1,
1.200398, -0.06000583, 1.999333, 1, 1, 1, 1, 1,
1.205946, -0.1354117, 2.433856, 1, 1, 1, 1, 1,
1.215359, 0.2073718, 3.059566, 1, 1, 1, 1, 1,
1.233711, 0.3153754, 0.7199941, 1, 1, 1, 1, 1,
1.239224, -2.787503, 2.51531, 1, 1, 1, 1, 1,
1.241043, -0.7681733, 1.716458, 1, 1, 1, 1, 1,
1.243939, -0.6205999, 2.742086, 1, 1, 1, 1, 1,
1.263887, 0.1369341, 3.100692, 1, 1, 1, 1, 1,
1.272393, -0.004991422, 1.606259, 1, 1, 1, 1, 1,
1.274694, -0.7304373, 2.883745, 1, 1, 1, 1, 1,
1.282612, -0.6128532, -0.1254898, 1, 1, 1, 1, 1,
1.284757, -0.2295103, 2.16203, 1, 1, 1, 1, 1,
1.291172, 0.1319749, 3.05459, 1, 1, 1, 1, 1,
1.301432, -2.205805, 1.723399, 0, 0, 1, 1, 1,
1.304714, -0.5608245, 2.631464, 1, 0, 0, 1, 1,
1.305007, 2.393446, 0.9857873, 1, 0, 0, 1, 1,
1.311658, -0.1645972, 1.651601, 1, 0, 0, 1, 1,
1.336584, -2.17962, 2.155419, 1, 0, 0, 1, 1,
1.349545, 1.169244, 2.333925, 1, 0, 0, 1, 1,
1.354321, 0.3133324, 0.8080075, 0, 0, 0, 1, 1,
1.36314, 0.1928896, 1.378466, 0, 0, 0, 1, 1,
1.38655, -1.486979, 2.413316, 0, 0, 0, 1, 1,
1.391713, 1.938926, 1.246414, 0, 0, 0, 1, 1,
1.395768, -0.5050594, 2.308743, 0, 0, 0, 1, 1,
1.409937, 0.4673591, 0.8594317, 0, 0, 0, 1, 1,
1.411606, 0.9140443, 2.513581, 0, 0, 0, 1, 1,
1.412653, 0.02723996, 1.520874, 1, 1, 1, 1, 1,
1.422937, -0.2791534, 3.467735, 1, 1, 1, 1, 1,
1.42555, -0.05665221, 2.359077, 1, 1, 1, 1, 1,
1.442453, 0.07772192, 2.416682, 1, 1, 1, 1, 1,
1.448857, 1.02955, 0.6404459, 1, 1, 1, 1, 1,
1.460607, -0.3859912, 1.993672, 1, 1, 1, 1, 1,
1.466891, -0.9502614, 2.186975, 1, 1, 1, 1, 1,
1.468755, 0.8287778, 2.350516, 1, 1, 1, 1, 1,
1.469762, -1.621236, 2.352701, 1, 1, 1, 1, 1,
1.47099, -0.790704, 2.823067, 1, 1, 1, 1, 1,
1.479143, -0.5462025, 1.759147, 1, 1, 1, 1, 1,
1.485304, 0.7124352, 1.503558, 1, 1, 1, 1, 1,
1.507185, -0.36456, 0.9738792, 1, 1, 1, 1, 1,
1.511625, 0.1506647, 1.544134, 1, 1, 1, 1, 1,
1.51205, 0.1972889, -0.2179637, 1, 1, 1, 1, 1,
1.513381, 0.6322477, 0.4021729, 0, 0, 1, 1, 1,
1.519287, -1.67999, 3.050373, 1, 0, 0, 1, 1,
1.530928, 0.3235289, 1.514695, 1, 0, 0, 1, 1,
1.540445, 2.203005, 0.2362986, 1, 0, 0, 1, 1,
1.55448, -0.02438712, 2.637377, 1, 0, 0, 1, 1,
1.560155, 0.1749704, 0.158482, 1, 0, 0, 1, 1,
1.582094, 0.3645501, 2.054774, 0, 0, 0, 1, 1,
1.583497, -0.5935608, 0.1359517, 0, 0, 0, 1, 1,
1.592423, -0.6129286, 2.372054, 0, 0, 0, 1, 1,
1.599975, 0.8832965, -0.2035481, 0, 0, 0, 1, 1,
1.624535, 0.4586685, 2.004792, 0, 0, 0, 1, 1,
1.645783, -0.5420948, 1.602654, 0, 0, 0, 1, 1,
1.652846, -0.9467775, 2.395989, 0, 0, 0, 1, 1,
1.658068, 0.8242859, 0.9170467, 1, 1, 1, 1, 1,
1.662999, 1.040884, -0.1629125, 1, 1, 1, 1, 1,
1.680035, -0.4437849, -0.6364536, 1, 1, 1, 1, 1,
1.692189, 0.2702689, 2.389306, 1, 1, 1, 1, 1,
1.710233, 0.8147407, 1.943653, 1, 1, 1, 1, 1,
1.718347, -0.1220416, 2.557973, 1, 1, 1, 1, 1,
1.722935, -0.6549044, 1.554842, 1, 1, 1, 1, 1,
1.73616, -1.385458, 0.3742138, 1, 1, 1, 1, 1,
1.747417, 0.07512139, 1.496835, 1, 1, 1, 1, 1,
1.753648, -1.271179, 1.563937, 1, 1, 1, 1, 1,
1.753967, 0.4851598, 2.739329, 1, 1, 1, 1, 1,
1.764847, 1.577443, 0.6070003, 1, 1, 1, 1, 1,
1.799211, -2.643199, 1.88589, 1, 1, 1, 1, 1,
1.813572, -1.392557, 0.8678085, 1, 1, 1, 1, 1,
1.8215, -0.9241381, 2.176626, 1, 1, 1, 1, 1,
1.82666, -0.03169032, 1.792593, 0, 0, 1, 1, 1,
1.830038, -0.3146108, 3.725559, 1, 0, 0, 1, 1,
1.839742, 0.4052536, 1.206775, 1, 0, 0, 1, 1,
1.841167, 0.973766, 1.213375, 1, 0, 0, 1, 1,
1.849049, 1.531263, 1.228758, 1, 0, 0, 1, 1,
1.858319, -1.221733, 1.723063, 1, 0, 0, 1, 1,
1.895521, -1.285931, 2.965875, 0, 0, 0, 1, 1,
1.899339, -1.20772, 2.30108, 0, 0, 0, 1, 1,
1.903932, 0.7753771, -0.4202563, 0, 0, 0, 1, 1,
1.922447, 1.228455, 0.09244577, 0, 0, 0, 1, 1,
1.934795, 0.5825954, 1.615308, 0, 0, 0, 1, 1,
1.971434, 0.8840737, 1.804814, 0, 0, 0, 1, 1,
1.980127, 1.087667, 0.4294837, 0, 0, 0, 1, 1,
1.980937, 0.6210012, 0.7929195, 1, 1, 1, 1, 1,
1.990956, -1.526636, 2.619789, 1, 1, 1, 1, 1,
1.998776, 3.2803, 0.461789, 1, 1, 1, 1, 1,
2.007645, -0.6618748, 2.473516, 1, 1, 1, 1, 1,
2.014809, 0.5345326, 1.639127, 1, 1, 1, 1, 1,
2.015402, -0.0174327, 1.366065, 1, 1, 1, 1, 1,
2.038246, -0.5801419, 1.503739, 1, 1, 1, 1, 1,
2.085187, 0.5087594, 1.934029, 1, 1, 1, 1, 1,
2.10148, 0.1536916, 0.8698651, 1, 1, 1, 1, 1,
2.121129, -2.405471, 1.815287, 1, 1, 1, 1, 1,
2.168942, 1.275301, 1.145711, 1, 1, 1, 1, 1,
2.177862, -0.1553462, 3.219828, 1, 1, 1, 1, 1,
2.178244, 1.244766, -1.128569, 1, 1, 1, 1, 1,
2.203663, -0.09873448, 3.195275, 1, 1, 1, 1, 1,
2.249362, 0.1078323, 2.617346, 1, 1, 1, 1, 1,
2.32054, -0.80832, 1.750222, 0, 0, 1, 1, 1,
2.335144, -0.08267532, 2.191648, 1, 0, 0, 1, 1,
2.338525, 1.055875, 0.6304258, 1, 0, 0, 1, 1,
2.34847, 1.388066, 1.46563, 1, 0, 0, 1, 1,
2.364506, 0.2688846, 0.7408677, 1, 0, 0, 1, 1,
2.370642, 0.9505038, 1.491701, 1, 0, 0, 1, 1,
2.383364, -0.2755843, 2.652744, 0, 0, 0, 1, 1,
2.440557, -1.24576, 2.575105, 0, 0, 0, 1, 1,
2.449854, 1.061042, 1.646619, 0, 0, 0, 1, 1,
2.467002, -1.577666, 1.011846, 0, 0, 0, 1, 1,
2.562397, -0.545451, 0.317762, 0, 0, 0, 1, 1,
2.67582, 1.27421, 1.288273, 0, 0, 0, 1, 1,
2.702604, 1.343318, -0.3184877, 0, 0, 0, 1, 1,
2.707223, 0.4654562, 2.122739, 1, 1, 1, 1, 1,
2.73246, -0.1840328, 1.674581, 1, 1, 1, 1, 1,
2.804139, -0.04019607, 0.5962387, 1, 1, 1, 1, 1,
2.805784, -0.298335, 0.8897967, 1, 1, 1, 1, 1,
2.831717, 0.3368896, 1.475038, 1, 1, 1, 1, 1,
2.847533, -0.08691991, -0.51935, 1, 1, 1, 1, 1,
3.258979, 0.926536, 2.140247, 1, 1, 1, 1, 1
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
var radius = 9.59667;
var distance = 33.70789;
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
mvMatrix.translate( -0.1569102, -0.3492743, -0.5302746 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70789);
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
