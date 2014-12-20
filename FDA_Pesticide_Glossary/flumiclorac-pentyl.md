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
-2.649644, -0.7060331, -4.722208, 1, 0, 0, 1,
-2.459937, -1.482831, -2.58425, 1, 0.007843138, 0, 1,
-2.385403, -0.270409, -0.9624447, 1, 0.01176471, 0, 1,
-2.36374, 0.1417589, -0.1731283, 1, 0.01960784, 0, 1,
-2.346664, -0.02358465, -2.841246, 1, 0.02352941, 0, 1,
-2.322886, 0.3664559, -1.638816, 1, 0.03137255, 0, 1,
-2.282844, 0.3366923, -0.4825855, 1, 0.03529412, 0, 1,
-2.257163, 0.02030228, -1.828984, 1, 0.04313726, 0, 1,
-2.220904, -0.845026, -1.504893, 1, 0.04705882, 0, 1,
-2.204914, -0.365297, -3.249476, 1, 0.05490196, 0, 1,
-2.199223, 0.1391582, -1.405539, 1, 0.05882353, 0, 1,
-2.196117, 0.5925145, 0.1327325, 1, 0.06666667, 0, 1,
-2.10954, -0.8188573, -1.654077, 1, 0.07058824, 0, 1,
-2.105599, 0.8650241, -1.971712, 1, 0.07843138, 0, 1,
-2.100827, 0.4086243, -2.086028, 1, 0.08235294, 0, 1,
-2.087001, -1.247491, -0.700272, 1, 0.09019608, 0, 1,
-2.086872, 0.8157654, -0.3481475, 1, 0.09411765, 0, 1,
-2.069991, -2.037572, -2.135847, 1, 0.1019608, 0, 1,
-2.052028, -1.179469, -0.9494389, 1, 0.1098039, 0, 1,
-1.9727, -0.05888326, -0.9513774, 1, 0.1137255, 0, 1,
-1.954266, 0.3733826, -0.8970119, 1, 0.1215686, 0, 1,
-1.920425, 0.9631274, -3.100292, 1, 0.1254902, 0, 1,
-1.91694, -0.9779857, -1.01823, 1, 0.1333333, 0, 1,
-1.91365, 1.065488, -2.00108, 1, 0.1372549, 0, 1,
-1.911698, 0.6662201, -1.821806, 1, 0.145098, 0, 1,
-1.883852, 1.547997, -1.350605, 1, 0.1490196, 0, 1,
-1.858563, 1.75136, -1.123614, 1, 0.1568628, 0, 1,
-1.843921, -0.3197664, -1.979948, 1, 0.1607843, 0, 1,
-1.827264, -1.046644, -0.8556288, 1, 0.1686275, 0, 1,
-1.818476, -0.7073096, -1.942387, 1, 0.172549, 0, 1,
-1.816787, 0.5073361, -1.211221, 1, 0.1803922, 0, 1,
-1.801308, 1.384661, -2.279529, 1, 0.1843137, 0, 1,
-1.800284, -1.248677, -2.889935, 1, 0.1921569, 0, 1,
-1.786011, -0.6580872, -2.185865, 1, 0.1960784, 0, 1,
-1.783157, 0.5402956, -1.589069, 1, 0.2039216, 0, 1,
-1.781667, 0.9048648, -0.9367476, 1, 0.2117647, 0, 1,
-1.736025, 0.5648602, -1.094797, 1, 0.2156863, 0, 1,
-1.721237, -0.9007953, -0.2513851, 1, 0.2235294, 0, 1,
-1.70665, -1.246256, -1.645856, 1, 0.227451, 0, 1,
-1.704982, 0.08827127, 0.008215717, 1, 0.2352941, 0, 1,
-1.70167, -2.002642, -2.674059, 1, 0.2392157, 0, 1,
-1.638365, 1.865142, -0.3413098, 1, 0.2470588, 0, 1,
-1.637876, -0.655468, -0.001602942, 1, 0.2509804, 0, 1,
-1.606186, 0.07452528, -0.909649, 1, 0.2588235, 0, 1,
-1.603886, -0.1249063, -0.9604382, 1, 0.2627451, 0, 1,
-1.600571, 1.348674, -0.5868173, 1, 0.2705882, 0, 1,
-1.590188, 1.249624, -0.5218929, 1, 0.2745098, 0, 1,
-1.589686, 0.545469, -1.025032, 1, 0.282353, 0, 1,
-1.582055, 0.03363323, -0.005974596, 1, 0.2862745, 0, 1,
-1.581516, 0.5447074, -3.776548, 1, 0.2941177, 0, 1,
-1.577818, -0.2758594, -1.111489, 1, 0.3019608, 0, 1,
-1.567845, -0.4267087, -0.2561215, 1, 0.3058824, 0, 1,
-1.558865, 0.8252823, -2.151353, 1, 0.3137255, 0, 1,
-1.558247, -0.3228369, -2.952173, 1, 0.3176471, 0, 1,
-1.554814, 1.778735, -1.362228, 1, 0.3254902, 0, 1,
-1.551817, 1.037537, -3.28979, 1, 0.3294118, 0, 1,
-1.551457, -1.281335, -3.456948, 1, 0.3372549, 0, 1,
-1.550967, -0.8281055, -4.505122, 1, 0.3411765, 0, 1,
-1.523002, -0.75635, -2.622701, 1, 0.3490196, 0, 1,
-1.519773, 0.237619, -1.87894, 1, 0.3529412, 0, 1,
-1.514607, -1.126859, -2.664873, 1, 0.3607843, 0, 1,
-1.50171, -1.691325, -2.747828, 1, 0.3647059, 0, 1,
-1.489955, 0.7600315, -0.1964213, 1, 0.372549, 0, 1,
-1.487233, 0.3121372, -2.437376, 1, 0.3764706, 0, 1,
-1.486553, -1.393322, -4.014652, 1, 0.3843137, 0, 1,
-1.485845, 1.084829, -1.308075, 1, 0.3882353, 0, 1,
-1.479314, -1.006574, -2.08842, 1, 0.3960784, 0, 1,
-1.476619, 0.07277223, -0.3947766, 1, 0.4039216, 0, 1,
-1.475652, -0.6529739, -2.459246, 1, 0.4078431, 0, 1,
-1.475138, 0.4693015, -2.212957, 1, 0.4156863, 0, 1,
-1.465335, 1.684839, -1.013805, 1, 0.4196078, 0, 1,
-1.463742, -1.521844, -2.883936, 1, 0.427451, 0, 1,
-1.446329, -1.809096, -3.98099, 1, 0.4313726, 0, 1,
-1.435307, 1.761189, 0.03565496, 1, 0.4392157, 0, 1,
-1.435236, 1.308291, -0.02837071, 1, 0.4431373, 0, 1,
-1.414199, -0.497369, -1.757445, 1, 0.4509804, 0, 1,
-1.410878, 0.3109804, -2.703973, 1, 0.454902, 0, 1,
-1.41078, 0.9611113, -1.472535, 1, 0.4627451, 0, 1,
-1.408647, -0.07193495, -1.758985, 1, 0.4666667, 0, 1,
-1.385866, 0.5486293, 1.061939, 1, 0.4745098, 0, 1,
-1.385527, 0.9779938, 0.1405453, 1, 0.4784314, 0, 1,
-1.384126, -0.1465668, -1.576567, 1, 0.4862745, 0, 1,
-1.377956, -2.144997, -3.433074, 1, 0.4901961, 0, 1,
-1.37571, -1.461136, -0.5139351, 1, 0.4980392, 0, 1,
-1.370817, -1.363344, -2.437994, 1, 0.5058824, 0, 1,
-1.350118, -1.324734, -1.93857, 1, 0.509804, 0, 1,
-1.344078, 0.004317759, -1.844902, 1, 0.5176471, 0, 1,
-1.319162, -0.227329, -0.2378033, 1, 0.5215687, 0, 1,
-1.317145, 1.506712, 0.008482157, 1, 0.5294118, 0, 1,
-1.286295, 1.54644, -0.8855582, 1, 0.5333334, 0, 1,
-1.242902, -0.04541635, -0.8170741, 1, 0.5411765, 0, 1,
-1.236088, 0.4172073, -1.390635, 1, 0.5450981, 0, 1,
-1.22915, -1.301201, -0.5261443, 1, 0.5529412, 0, 1,
-1.223536, -0.4902184, -1.816447, 1, 0.5568628, 0, 1,
-1.211649, -1.879304, -2.414162, 1, 0.5647059, 0, 1,
-1.205499, -0.8133674, -3.506616, 1, 0.5686275, 0, 1,
-1.201514, -0.7402057, -3.662233, 1, 0.5764706, 0, 1,
-1.19641, -0.8598192, -0.962335, 1, 0.5803922, 0, 1,
-1.195164, 0.8896325, -0.8590216, 1, 0.5882353, 0, 1,
-1.186877, 0.3554156, 1.297263, 1, 0.5921569, 0, 1,
-1.170149, 1.041926, -0.5322267, 1, 0.6, 0, 1,
-1.168675, -0.3781441, -1.723399, 1, 0.6078432, 0, 1,
-1.157384, -0.08576991, -1.397739, 1, 0.6117647, 0, 1,
-1.145969, 0.3410503, 0.8031178, 1, 0.6196079, 0, 1,
-1.144538, 0.1185169, -0.8841506, 1, 0.6235294, 0, 1,
-1.143854, -0.6777092, -2.946095, 1, 0.6313726, 0, 1,
-1.142916, -0.1720034, -2.82671, 1, 0.6352941, 0, 1,
-1.141374, -0.867632, -3.969336, 1, 0.6431373, 0, 1,
-1.135472, -0.3083525, -0.8691961, 1, 0.6470588, 0, 1,
-1.122526, -0.2305056, -1.242728, 1, 0.654902, 0, 1,
-1.119584, 0.07401273, -0.690801, 1, 0.6588235, 0, 1,
-1.116264, 0.456296, -2.425479, 1, 0.6666667, 0, 1,
-1.114564, 0.2956176, -1.179159, 1, 0.6705883, 0, 1,
-1.113742, 0.7905008, -0.4406992, 1, 0.6784314, 0, 1,
-1.11017, 0.9738635, -1.549208, 1, 0.682353, 0, 1,
-1.106527, -1.27714, -3.566767, 1, 0.6901961, 0, 1,
-1.102452, -2.108227, -3.28765, 1, 0.6941177, 0, 1,
-1.101984, 1.797071, -0.6867319, 1, 0.7019608, 0, 1,
-1.076035, -0.3725553, -2.539177, 1, 0.7098039, 0, 1,
-1.073763, -0.01207568, -1.858566, 1, 0.7137255, 0, 1,
-1.068908, -1.781859, -1.595813, 1, 0.7215686, 0, 1,
-1.066887, 0.6541982, -1.282376, 1, 0.7254902, 0, 1,
-1.064347, 1.470971, -0.7083142, 1, 0.7333333, 0, 1,
-1.062276, 1.742787, -1.669991, 1, 0.7372549, 0, 1,
-1.060454, 0.1738214, -1.523509, 1, 0.7450981, 0, 1,
-1.059461, 1.121626, -0.02408727, 1, 0.7490196, 0, 1,
-1.053466, 0.3047417, -1.275626, 1, 0.7568628, 0, 1,
-1.050971, 0.6328719, 0.8820732, 1, 0.7607843, 0, 1,
-1.042055, -0.2601772, -2.633276, 1, 0.7686275, 0, 1,
-1.030772, 0.5366536, -0.4224737, 1, 0.772549, 0, 1,
-1.026253, 0.5198544, -1.474288, 1, 0.7803922, 0, 1,
-1.023023, 0.4871565, -1.418106, 1, 0.7843137, 0, 1,
-1.022787, -0.143886, -1.949203, 1, 0.7921569, 0, 1,
-1.020079, -0.4128047, -1.852139, 1, 0.7960784, 0, 1,
-1.019712, 0.3494161, -2.232352, 1, 0.8039216, 0, 1,
-1.016211, -0.9545906, -3.476092, 1, 0.8117647, 0, 1,
-1.009572, -1.353561, -1.356498, 1, 0.8156863, 0, 1,
-1.005712, -0.539727, -2.91493, 1, 0.8235294, 0, 1,
-1.002214, -0.378148, -2.194628, 1, 0.827451, 0, 1,
-0.9999874, -0.4389243, -3.081562, 1, 0.8352941, 0, 1,
-0.994602, 0.2839732, -0.5844546, 1, 0.8392157, 0, 1,
-0.9925224, 0.9603529, -2.199471, 1, 0.8470588, 0, 1,
-0.9858682, -1.241899, -2.358215, 1, 0.8509804, 0, 1,
-0.9704937, 1.273086, -0.9808206, 1, 0.8588235, 0, 1,
-0.959602, 0.1474665, 0.3681505, 1, 0.8627451, 0, 1,
-0.9572401, -0.2895797, -2.248139, 1, 0.8705882, 0, 1,
-0.9553497, -0.3080609, -1.425608, 1, 0.8745098, 0, 1,
-0.9547361, 0.7344894, -1.688316, 1, 0.8823529, 0, 1,
-0.9542435, 0.6666729, -1.399965, 1, 0.8862745, 0, 1,
-0.9525681, 1.933416, -1.350282, 1, 0.8941177, 0, 1,
-0.952527, -0.1046175, -3.447778, 1, 0.8980392, 0, 1,
-0.9499432, 0.5829258, -0.8170823, 1, 0.9058824, 0, 1,
-0.9482839, -0.7272456, -0.08980955, 1, 0.9137255, 0, 1,
-0.9478936, 2.750172, -2.631031, 1, 0.9176471, 0, 1,
-0.9352542, -1.442601, -5.136305, 1, 0.9254902, 0, 1,
-0.9329551, 0.1717528, 0.6644976, 1, 0.9294118, 0, 1,
-0.9315735, 2.156522, -0.3620627, 1, 0.9372549, 0, 1,
-0.9277257, 0.269099, -1.30555, 1, 0.9411765, 0, 1,
-0.9276864, -0.6127461, -2.740273, 1, 0.9490196, 0, 1,
-0.9213836, -0.4309096, -2.097132, 1, 0.9529412, 0, 1,
-0.9111893, 0.789136, 0.2557151, 1, 0.9607843, 0, 1,
-0.9106598, -0.3420145, -1.922592, 1, 0.9647059, 0, 1,
-0.9101143, 1.803582, 0.07905325, 1, 0.972549, 0, 1,
-0.909294, 0.5113026, -0.2721731, 1, 0.9764706, 0, 1,
-0.9091463, 1.547573, 0.8181368, 1, 0.9843137, 0, 1,
-0.9041913, -2.538586, -3.914754, 1, 0.9882353, 0, 1,
-0.9019256, -0.3272877, -1.004722, 1, 0.9960784, 0, 1,
-0.8978691, -1.259432, -2.413921, 0.9960784, 1, 0, 1,
-0.8977851, 0.01127841, -2.455739, 0.9921569, 1, 0, 1,
-0.8971924, -1.017635, -2.136888, 0.9843137, 1, 0, 1,
-0.8961855, 0.9681413, -0.3474239, 0.9803922, 1, 0, 1,
-0.8953215, 0.6357792, 0.0001670295, 0.972549, 1, 0, 1,
-0.8916904, -2.032185, -3.499601, 0.9686275, 1, 0, 1,
-0.8893818, -0.3476361, -3.093507, 0.9607843, 1, 0, 1,
-0.8844632, -0.30442, -2.261495, 0.9568627, 1, 0, 1,
-0.8801208, 0.8339181, 0.4235043, 0.9490196, 1, 0, 1,
-0.8768026, -0.3328711, -2.41479, 0.945098, 1, 0, 1,
-0.8767015, 0.6756106, -1.322353, 0.9372549, 1, 0, 1,
-0.8751717, -0.2467449, -1.922412, 0.9333333, 1, 0, 1,
-0.8746191, 0.9903283, -0.4383301, 0.9254902, 1, 0, 1,
-0.8671722, 1.013141, -0.0422871, 0.9215686, 1, 0, 1,
-0.8661732, -0.4199524, -1.479276, 0.9137255, 1, 0, 1,
-0.8642218, 0.01202131, -3.179465, 0.9098039, 1, 0, 1,
-0.8641499, 1.208006, -0.3217879, 0.9019608, 1, 0, 1,
-0.8582208, 1.252791, -1.073258, 0.8941177, 1, 0, 1,
-0.8480356, -0.7389616, -1.267532, 0.8901961, 1, 0, 1,
-0.8462796, -0.9470169, -2.644057, 0.8823529, 1, 0, 1,
-0.8451414, 0.2377558, -0.7215413, 0.8784314, 1, 0, 1,
-0.83834, 0.5759153, 0.3497831, 0.8705882, 1, 0, 1,
-0.8322007, 0.2590312, -2.419039, 0.8666667, 1, 0, 1,
-0.8257025, 0.8477181, -1.758849, 0.8588235, 1, 0, 1,
-0.8250656, 0.7137997, -1.941346, 0.854902, 1, 0, 1,
-0.8250179, -1.487167, -1.038136, 0.8470588, 1, 0, 1,
-0.8237187, -0.1170024, -0.5168321, 0.8431373, 1, 0, 1,
-0.8187804, 0.485459, -0.1350076, 0.8352941, 1, 0, 1,
-0.818644, -0.8466731, -2.169719, 0.8313726, 1, 0, 1,
-0.8143453, 0.2260974, -0.4163689, 0.8235294, 1, 0, 1,
-0.8121231, -0.01953914, -1.926192, 0.8196079, 1, 0, 1,
-0.8026727, -0.5761932, -2.606692, 0.8117647, 1, 0, 1,
-0.8026394, 0.58298, -1.867426, 0.8078431, 1, 0, 1,
-0.7964094, 0.1929775, -1.990694, 0.8, 1, 0, 1,
-0.7960833, 1.485271, -2.138727, 0.7921569, 1, 0, 1,
-0.7954038, 0.6223862, -1.54586, 0.7882353, 1, 0, 1,
-0.7922099, 0.2618105, -0.8551156, 0.7803922, 1, 0, 1,
-0.7919237, 1.129778, -1.785702, 0.7764706, 1, 0, 1,
-0.7876697, -1.009931, -3.606108, 0.7686275, 1, 0, 1,
-0.7840001, 1.597968, 1.581443, 0.7647059, 1, 0, 1,
-0.7822179, -1.246534, -3.893894, 0.7568628, 1, 0, 1,
-0.7813309, 1.049366, -1.428333, 0.7529412, 1, 0, 1,
-0.7800909, -0.9144672, -3.33363, 0.7450981, 1, 0, 1,
-0.7746547, 1.032354, 0.8360261, 0.7411765, 1, 0, 1,
-0.7736387, -0.1707417, -2.607231, 0.7333333, 1, 0, 1,
-0.7728369, 0.9310364, -0.6155862, 0.7294118, 1, 0, 1,
-0.772415, 0.140743, -0.7334148, 0.7215686, 1, 0, 1,
-0.7696857, -0.08905631, -3.958845, 0.7176471, 1, 0, 1,
-0.7664478, -0.2734155, -1.522133, 0.7098039, 1, 0, 1,
-0.7663906, 0.08765393, -1.678068, 0.7058824, 1, 0, 1,
-0.7654254, -1.955822, -3.167945, 0.6980392, 1, 0, 1,
-0.7617714, 0.08569787, -1.107876, 0.6901961, 1, 0, 1,
-0.7612742, 0.03604531, -2.360866, 0.6862745, 1, 0, 1,
-0.7580377, -0.7110149, -2.631742, 0.6784314, 1, 0, 1,
-0.7523668, 1.047935, -1.490772, 0.6745098, 1, 0, 1,
-0.7520226, 0.4966545, -0.8346417, 0.6666667, 1, 0, 1,
-0.7464946, -0.4580587, -1.950562, 0.6627451, 1, 0, 1,
-0.7450267, -0.3998639, -2.132682, 0.654902, 1, 0, 1,
-0.7408217, 0.4234404, -2.524537, 0.6509804, 1, 0, 1,
-0.7391706, 0.6086866, -0.921106, 0.6431373, 1, 0, 1,
-0.7367793, 0.1561535, -0.2875502, 0.6392157, 1, 0, 1,
-0.7365569, -0.3541618, -1.296886, 0.6313726, 1, 0, 1,
-0.7361291, -0.365743, -1.624308, 0.627451, 1, 0, 1,
-0.7345542, 1.238865, -1.434029, 0.6196079, 1, 0, 1,
-0.7321005, -0.9637405, -2.143596, 0.6156863, 1, 0, 1,
-0.725187, -1.191102, -1.659326, 0.6078432, 1, 0, 1,
-0.7227836, 1.524953, -1.313186, 0.6039216, 1, 0, 1,
-0.7127843, -1.079367, -2.146511, 0.5960785, 1, 0, 1,
-0.7105212, -0.7564718, -2.425923, 0.5882353, 1, 0, 1,
-0.7103205, 0.6897928, -2.535203, 0.5843138, 1, 0, 1,
-0.7028838, -0.204482, -1.839251, 0.5764706, 1, 0, 1,
-0.7005923, -0.9489502, -3.98752, 0.572549, 1, 0, 1,
-0.6959972, -0.223764, -2.421918, 0.5647059, 1, 0, 1,
-0.6948622, 0.2354359, -0.7574236, 0.5607843, 1, 0, 1,
-0.6938772, 0.2228718, -2.126881, 0.5529412, 1, 0, 1,
-0.6863674, -0.6644019, -3.711667, 0.5490196, 1, 0, 1,
-0.6848201, 0.746174, -1.45419, 0.5411765, 1, 0, 1,
-0.6831462, 0.1926624, -1.415664, 0.5372549, 1, 0, 1,
-0.6807562, 0.09902756, -2.452579, 0.5294118, 1, 0, 1,
-0.6760772, 0.2349681, -0.7985087, 0.5254902, 1, 0, 1,
-0.6739972, 1.156741, 0.1029427, 0.5176471, 1, 0, 1,
-0.6727074, -0.95378, -2.247692, 0.5137255, 1, 0, 1,
-0.67138, -0.1212415, -0.3028643, 0.5058824, 1, 0, 1,
-0.6608762, 1.051109, 0.3455138, 0.5019608, 1, 0, 1,
-0.6596469, 1.417917, 0.4275714, 0.4941176, 1, 0, 1,
-0.6539851, -0.5099309, -1.362172, 0.4862745, 1, 0, 1,
-0.6534516, 0.3197581, -0.6333765, 0.4823529, 1, 0, 1,
-0.6486046, 0.3174134, -2.186058, 0.4745098, 1, 0, 1,
-0.6476949, -0.5912948, -4.062922, 0.4705882, 1, 0, 1,
-0.6365905, 0.550609, -1.341234, 0.4627451, 1, 0, 1,
-0.6333591, 1.680829, 0.8382698, 0.4588235, 1, 0, 1,
-0.6317124, -0.275465, -1.946288, 0.4509804, 1, 0, 1,
-0.6290554, 1.113069, -1.207589, 0.4470588, 1, 0, 1,
-0.6268888, -1.111696, -2.510503, 0.4392157, 1, 0, 1,
-0.6128166, 1.045911, -0.3506168, 0.4352941, 1, 0, 1,
-0.6049964, 3.017834, 0.2779547, 0.427451, 1, 0, 1,
-0.6047956, 1.775828, -1.573552, 0.4235294, 1, 0, 1,
-0.6011711, 1.322535, -2.712999, 0.4156863, 1, 0, 1,
-0.6004825, -0.9235936, -1.705361, 0.4117647, 1, 0, 1,
-0.5970841, 0.0659047, -1.836753, 0.4039216, 1, 0, 1,
-0.5968416, -0.643042, -3.211429, 0.3960784, 1, 0, 1,
-0.5926905, -1.311887, -2.397384, 0.3921569, 1, 0, 1,
-0.5868873, -0.9908391, -1.409349, 0.3843137, 1, 0, 1,
-0.5868515, 0.4642144, -2.950982, 0.3803922, 1, 0, 1,
-0.5859127, -0.5148552, -1.407592, 0.372549, 1, 0, 1,
-0.5839302, 0.4522876, -1.590307, 0.3686275, 1, 0, 1,
-0.5819359, -0.002104517, -1.571694, 0.3607843, 1, 0, 1,
-0.5791295, -0.1465188, -2.478082, 0.3568628, 1, 0, 1,
-0.5786678, -0.4497296, -2.003209, 0.3490196, 1, 0, 1,
-0.5781416, -2.465391, -1.88859, 0.345098, 1, 0, 1,
-0.5775065, -0.6793937, -3.781644, 0.3372549, 1, 0, 1,
-0.5774851, -0.05584078, -0.6480181, 0.3333333, 1, 0, 1,
-0.5768837, -0.8538833, -3.173277, 0.3254902, 1, 0, 1,
-0.5753402, -1.776026, -3.675549, 0.3215686, 1, 0, 1,
-0.5750694, -2.774587, -2.849489, 0.3137255, 1, 0, 1,
-0.5748885, 1.321832, -0.4652155, 0.3098039, 1, 0, 1,
-0.5711244, 0.331422, -0.1559899, 0.3019608, 1, 0, 1,
-0.57111, 0.6195791, -0.9674037, 0.2941177, 1, 0, 1,
-0.5681527, -0.506604, -2.338579, 0.2901961, 1, 0, 1,
-0.5665765, -0.5959899, -0.5082037, 0.282353, 1, 0, 1,
-0.5619963, -0.1669284, -2.863781, 0.2784314, 1, 0, 1,
-0.5585031, -0.9590244, -2.508886, 0.2705882, 1, 0, 1,
-0.5522076, 0.2932849, -1.74606, 0.2666667, 1, 0, 1,
-0.5464876, -0.1815899, -2.525723, 0.2588235, 1, 0, 1,
-0.5446994, 0.4818987, -1.79085, 0.254902, 1, 0, 1,
-0.5445012, -0.08955653, -1.18759, 0.2470588, 1, 0, 1,
-0.5405381, 0.6590304, 0.8723758, 0.2431373, 1, 0, 1,
-0.5403349, 0.1275969, -2.243696, 0.2352941, 1, 0, 1,
-0.5341274, -0.3709289, -3.548733, 0.2313726, 1, 0, 1,
-0.5318342, 0.3087639, 0.144851, 0.2235294, 1, 0, 1,
-0.5308731, -0.4214135, -0.7635255, 0.2196078, 1, 0, 1,
-0.5289927, -0.9628513, -2.084083, 0.2117647, 1, 0, 1,
-0.5271975, -0.4981508, -0.7936296, 0.2078431, 1, 0, 1,
-0.5255216, -0.04648563, -2.177143, 0.2, 1, 0, 1,
-0.5193616, -1.048516, -2.789517, 0.1921569, 1, 0, 1,
-0.5123813, -0.1798366, -2.487151, 0.1882353, 1, 0, 1,
-0.5106478, -0.1859271, -1.091772, 0.1803922, 1, 0, 1,
-0.5103788, 0.02200749, -1.502601, 0.1764706, 1, 0, 1,
-0.5098557, -0.5466893, -1.197836, 0.1686275, 1, 0, 1,
-0.5094671, 1.033536, 0.47746, 0.1647059, 1, 0, 1,
-0.5074875, 0.186171, -1.439425, 0.1568628, 1, 0, 1,
-0.5030544, 1.201448, 0.8599094, 0.1529412, 1, 0, 1,
-0.4956097, 0.919228, -0.1322366, 0.145098, 1, 0, 1,
-0.4872312, 0.08728755, -1.799263, 0.1411765, 1, 0, 1,
-0.4855202, -0.2093042, -2.098809, 0.1333333, 1, 0, 1,
-0.4839535, 0.3668427, -1.105942, 0.1294118, 1, 0, 1,
-0.4798583, 1.457407, 0.3128007, 0.1215686, 1, 0, 1,
-0.479051, -2.226036, -4.274098, 0.1176471, 1, 0, 1,
-0.4744591, -0.6881789, -3.877031, 0.1098039, 1, 0, 1,
-0.4734817, -0.3619522, -0.9083441, 0.1058824, 1, 0, 1,
-0.4681303, 0.2396137, -0.3622992, 0.09803922, 1, 0, 1,
-0.467946, 1.304581, 0.6810265, 0.09019608, 1, 0, 1,
-0.4676558, 0.4823838, -1.009567, 0.08627451, 1, 0, 1,
-0.467041, -0.7735406, -3.113689, 0.07843138, 1, 0, 1,
-0.4668881, -0.8463566, -2.202756, 0.07450981, 1, 0, 1,
-0.4644619, 1.421206, -0.6991642, 0.06666667, 1, 0, 1,
-0.4609244, 0.3774987, -1.573447, 0.0627451, 1, 0, 1,
-0.4604096, -0.4859346, -2.723546, 0.05490196, 1, 0, 1,
-0.4590326, 0.5039822, -2.007797, 0.05098039, 1, 0, 1,
-0.4577928, 0.3753398, 1.11053, 0.04313726, 1, 0, 1,
-0.4517418, -0.7947118, -2.400221, 0.03921569, 1, 0, 1,
-0.4489684, -1.687745, -1.014527, 0.03137255, 1, 0, 1,
-0.4467634, 0.9297174, -1.684572, 0.02745098, 1, 0, 1,
-0.4442655, -0.3623224, -1.947613, 0.01960784, 1, 0, 1,
-0.4429344, 1.110663, -1.597242, 0.01568628, 1, 0, 1,
-0.4419059, -3.120884, -3.192353, 0.007843138, 1, 0, 1,
-0.4405948, -0.1175914, -1.599795, 0.003921569, 1, 0, 1,
-0.4391294, 0.8229643, -1.588128, 0, 1, 0.003921569, 1,
-0.4377038, -0.230702, -1.263787, 0, 1, 0.01176471, 1,
-0.4371482, 1.174986, -1.289476, 0, 1, 0.01568628, 1,
-0.4369293, -0.06460591, 0.03987912, 0, 1, 0.02352941, 1,
-0.4353853, 0.446479, -0.8141304, 0, 1, 0.02745098, 1,
-0.4352106, -0.4639293, -1.200639, 0, 1, 0.03529412, 1,
-0.4329134, -1.174377, -1.453021, 0, 1, 0.03921569, 1,
-0.4287553, 0.7851353, -0.2417127, 0, 1, 0.04705882, 1,
-0.4259222, -0.5749148, -2.412633, 0, 1, 0.05098039, 1,
-0.4249522, 0.4267593, -1.172614, 0, 1, 0.05882353, 1,
-0.4194524, 0.8882715, 2.182877, 0, 1, 0.0627451, 1,
-0.416027, 0.1829899, -0.07992779, 0, 1, 0.07058824, 1,
-0.4156397, -3.278216, -1.442643, 0, 1, 0.07450981, 1,
-0.4120115, 0.1588871, -2.628916, 0, 1, 0.08235294, 1,
-0.4110781, -0.6841694, -4.449593, 0, 1, 0.08627451, 1,
-0.4106064, -1.830562, -4.180248, 0, 1, 0.09411765, 1,
-0.4076, -0.3492039, -2.529352, 0, 1, 0.1019608, 1,
-0.4070296, -0.4160126, -1.744273, 0, 1, 0.1058824, 1,
-0.3943174, 0.7913738, -1.754899, 0, 1, 0.1137255, 1,
-0.3941123, 1.729012, 0.4618589, 0, 1, 0.1176471, 1,
-0.392225, -0.1682161, -2.109553, 0, 1, 0.1254902, 1,
-0.3912053, 1.074629, -2.15825, 0, 1, 0.1294118, 1,
-0.3856836, -0.2538505, -1.739798, 0, 1, 0.1372549, 1,
-0.3832429, 0.4831691, -0.9631359, 0, 1, 0.1411765, 1,
-0.3832044, -0.1987264, -1.594257, 0, 1, 0.1490196, 1,
-0.3798599, -0.3355979, -2.326957, 0, 1, 0.1529412, 1,
-0.3751524, 1.946211, -0.8506951, 0, 1, 0.1607843, 1,
-0.3723978, -1.352868, -1.50242, 0, 1, 0.1647059, 1,
-0.3705873, 1.810459, -0.5820184, 0, 1, 0.172549, 1,
-0.3621583, -1.64821, -3.232655, 0, 1, 0.1764706, 1,
-0.3615793, -0.0671099, -3.256682, 0, 1, 0.1843137, 1,
-0.3584101, -0.9784701, -2.335298, 0, 1, 0.1882353, 1,
-0.3571972, 0.4572783, 1.380947, 0, 1, 0.1960784, 1,
-0.3564691, 0.4974303, -0.4698386, 0, 1, 0.2039216, 1,
-0.3549541, 1.591758, 0.7861302, 0, 1, 0.2078431, 1,
-0.3536619, 0.6836755, 0.5533561, 0, 1, 0.2156863, 1,
-0.3505301, -0.1967034, -1.466708, 0, 1, 0.2196078, 1,
-0.3436297, 0.56753, -2.544112, 0, 1, 0.227451, 1,
-0.3361985, 0.8195386, 0.2251816, 0, 1, 0.2313726, 1,
-0.3357948, 0.2373026, -0.08031118, 0, 1, 0.2392157, 1,
-0.3343866, -0.2942447, -3.936408, 0, 1, 0.2431373, 1,
-0.3305886, -0.2392053, -2.147994, 0, 1, 0.2509804, 1,
-0.3264993, 0.6939992, -2.19193, 0, 1, 0.254902, 1,
-0.3243032, 0.5769641, -0.8712599, 0, 1, 0.2627451, 1,
-0.3224817, -0.9047807, -3.443785, 0, 1, 0.2666667, 1,
-0.3192064, 0.0283339, -1.163646, 0, 1, 0.2745098, 1,
-0.3138224, -1.125857, -3.132408, 0, 1, 0.2784314, 1,
-0.3118822, -0.2711383, -3.310937, 0, 1, 0.2862745, 1,
-0.3080545, -0.586555, -2.735175, 0, 1, 0.2901961, 1,
-0.3062995, -0.2815014, -2.162567, 0, 1, 0.2980392, 1,
-0.3057422, 0.03155236, -0.01347054, 0, 1, 0.3058824, 1,
-0.3013176, 0.3618379, -1.686695, 0, 1, 0.3098039, 1,
-0.3005156, 0.855664, -0.6740925, 0, 1, 0.3176471, 1,
-0.2978728, -0.6576336, -4.144281, 0, 1, 0.3215686, 1,
-0.2962076, 1.035657, 0.3514529, 0, 1, 0.3294118, 1,
-0.2925435, 1.011142, 0.9460561, 0, 1, 0.3333333, 1,
-0.2902528, -1.091534, -2.937771, 0, 1, 0.3411765, 1,
-0.2867739, -0.1606297, -2.519002, 0, 1, 0.345098, 1,
-0.2861746, -1.406929, -3.819823, 0, 1, 0.3529412, 1,
-0.2845743, -2.129508, -1.710018, 0, 1, 0.3568628, 1,
-0.2796011, -1.51283, -2.502823, 0, 1, 0.3647059, 1,
-0.278477, -1.190323, -3.231828, 0, 1, 0.3686275, 1,
-0.2758416, -0.5739399, -4.01739, 0, 1, 0.3764706, 1,
-0.2661246, -2.289586, -2.597615, 0, 1, 0.3803922, 1,
-0.2615569, 0.9051458, -1.610362, 0, 1, 0.3882353, 1,
-0.2580692, 0.1802688, -0.7441112, 0, 1, 0.3921569, 1,
-0.2569788, 0.9243953, -1.016214, 0, 1, 0.4, 1,
-0.2563704, -0.7075388, -0.7439474, 0, 1, 0.4078431, 1,
-0.256086, 0.1471408, -0.325184, 0, 1, 0.4117647, 1,
-0.2558871, 2.235227, -3.173941, 0, 1, 0.4196078, 1,
-0.2556026, -0.07450496, -2.365926, 0, 1, 0.4235294, 1,
-0.2552789, -0.3603616, -2.361266, 0, 1, 0.4313726, 1,
-0.2537999, -0.0320729, -2.554576, 0, 1, 0.4352941, 1,
-0.2472572, -0.3561581, -1.598945, 0, 1, 0.4431373, 1,
-0.2446802, -1.073897, -3.886038, 0, 1, 0.4470588, 1,
-0.2442127, 0.8529398, -2.469496, 0, 1, 0.454902, 1,
-0.2434517, 0.9538346, 1.223548, 0, 1, 0.4588235, 1,
-0.2426673, -0.7491075, -3.672205, 0, 1, 0.4666667, 1,
-0.2422744, -1.188735, -3.038902, 0, 1, 0.4705882, 1,
-0.2419684, 0.9996011, -0.6041331, 0, 1, 0.4784314, 1,
-0.2397276, -1.449888, -1.58617, 0, 1, 0.4823529, 1,
-0.2359621, -0.6757302, -3.022101, 0, 1, 0.4901961, 1,
-0.2357757, 0.7338057, -0.1459004, 0, 1, 0.4941176, 1,
-0.2342589, -2.327937, -1.463726, 0, 1, 0.5019608, 1,
-0.2314469, -0.4396372, -0.6824008, 0, 1, 0.509804, 1,
-0.2276541, -0.03530314, -2.774693, 0, 1, 0.5137255, 1,
-0.2133272, 0.7051775, -0.3595031, 0, 1, 0.5215687, 1,
-0.2102461, 0.9464552, 1.104944, 0, 1, 0.5254902, 1,
-0.207679, -0.5235516, -2.618641, 0, 1, 0.5333334, 1,
-0.2011162, 0.05734722, -1.873837, 0, 1, 0.5372549, 1,
-0.197457, -0.7080162, -2.671615, 0, 1, 0.5450981, 1,
-0.1935416, 1.744746, 0.4600623, 0, 1, 0.5490196, 1,
-0.1887967, -0.1754966, -3.00711, 0, 1, 0.5568628, 1,
-0.1873996, -0.05926154, -1.040215, 0, 1, 0.5607843, 1,
-0.1796692, 1.038542, 0.1106706, 0, 1, 0.5686275, 1,
-0.1793126, 0.2247836, -1.257545, 0, 1, 0.572549, 1,
-0.1786445, -1.533721, -2.426601, 0, 1, 0.5803922, 1,
-0.1763624, 0.4123199, -2.750869, 0, 1, 0.5843138, 1,
-0.1708866, 0.6121095, -1.815838, 0, 1, 0.5921569, 1,
-0.1700838, 0.8772255, -0.9637958, 0, 1, 0.5960785, 1,
-0.169589, 0.20853, -1.090305, 0, 1, 0.6039216, 1,
-0.1680717, -0.04201692, -3.456964, 0, 1, 0.6117647, 1,
-0.163362, 0.745939, 0.3711703, 0, 1, 0.6156863, 1,
-0.1618178, -1.147013, -4.306589, 0, 1, 0.6235294, 1,
-0.1610439, 0.8038638, -0.1858159, 0, 1, 0.627451, 1,
-0.1570041, 0.6342002, 1.267307, 0, 1, 0.6352941, 1,
-0.1560527, -1.82964, -2.003441, 0, 1, 0.6392157, 1,
-0.1557515, -1.583881, -3.622265, 0, 1, 0.6470588, 1,
-0.1554664, -1.59049, -3.037232, 0, 1, 0.6509804, 1,
-0.153849, -1.641371, -1.931992, 0, 1, 0.6588235, 1,
-0.1536132, -1.211767, -3.102488, 0, 1, 0.6627451, 1,
-0.1534573, 0.728604, -0.64703, 0, 1, 0.6705883, 1,
-0.1439737, -1.200193, -2.454749, 0, 1, 0.6745098, 1,
-0.1420136, -0.2189064, -2.45082, 0, 1, 0.682353, 1,
-0.136833, 0.4068063, -1.288608, 0, 1, 0.6862745, 1,
-0.1340034, 0.08260337, -0.9577447, 0, 1, 0.6941177, 1,
-0.1329572, 0.9387201, -1.414202, 0, 1, 0.7019608, 1,
-0.1326981, 0.4894798, 1.375715, 0, 1, 0.7058824, 1,
-0.1318123, -0.5964149, -4.1019, 0, 1, 0.7137255, 1,
-0.1310291, -0.862285, -3.328791, 0, 1, 0.7176471, 1,
-0.1296573, 1.070979, -3.570469, 0, 1, 0.7254902, 1,
-0.1293007, 0.5119656, 0.2847899, 0, 1, 0.7294118, 1,
-0.1231706, -1.106743, -1.115774, 0, 1, 0.7372549, 1,
-0.1184183, -0.2143085, -2.520216, 0, 1, 0.7411765, 1,
-0.1171313, -0.02781848, -0.2569853, 0, 1, 0.7490196, 1,
-0.1157455, -0.6188483, -2.57462, 0, 1, 0.7529412, 1,
-0.113996, 1.673341, -1.926191, 0, 1, 0.7607843, 1,
-0.1086201, -0.1867489, -0.8228738, 0, 1, 0.7647059, 1,
-0.1044452, 0.6827741, -1.517109, 0, 1, 0.772549, 1,
-0.0982097, -0.5533776, -1.588694, 0, 1, 0.7764706, 1,
-0.09431911, 0.002511801, -0.7132695, 0, 1, 0.7843137, 1,
-0.09331729, 2.557747, -0.4765068, 0, 1, 0.7882353, 1,
-0.08904474, -1.216771, -4.227969, 0, 1, 0.7960784, 1,
-0.08694206, -0.2563339, -3.095407, 0, 1, 0.8039216, 1,
-0.0813897, 1.226748, -0.5132883, 0, 1, 0.8078431, 1,
-0.07973178, 0.8493561, -0.05825385, 0, 1, 0.8156863, 1,
-0.07064725, 0.812276, 0.2945351, 0, 1, 0.8196079, 1,
-0.06922523, 2.234843, 0.004685332, 0, 1, 0.827451, 1,
-0.06877418, 0.0873826, -0.1820936, 0, 1, 0.8313726, 1,
-0.06487335, 0.7987167, 0.9500324, 0, 1, 0.8392157, 1,
-0.05709656, -1.400353, -2.505519, 0, 1, 0.8431373, 1,
-0.0548042, -0.414692, -4.249463, 0, 1, 0.8509804, 1,
-0.05313565, -1.783494, -1.703704, 0, 1, 0.854902, 1,
-0.05073383, 0.9969049, 1.460229, 0, 1, 0.8627451, 1,
-0.04855288, 0.3355804, 0.3544211, 0, 1, 0.8666667, 1,
-0.04316191, 0.09214067, -0.9373975, 0, 1, 0.8745098, 1,
-0.04185887, 0.8524677, -0.8856669, 0, 1, 0.8784314, 1,
-0.04000018, 1.628865, 0.5201425, 0, 1, 0.8862745, 1,
-0.03848677, 0.1650943, 0.2338492, 0, 1, 0.8901961, 1,
-0.03645607, -0.9375397, -3.433915, 0, 1, 0.8980392, 1,
-0.03613248, 0.2032741, -0.6920875, 0, 1, 0.9058824, 1,
-0.03369018, -1.839729, -3.124462, 0, 1, 0.9098039, 1,
-0.03275882, 1.101125, -0.8060611, 0, 1, 0.9176471, 1,
-0.03073811, 1.04029, -1.276828, 0, 1, 0.9215686, 1,
-0.02827195, 0.7824797, -1.041781, 0, 1, 0.9294118, 1,
-0.028053, -1.055489, -2.402156, 0, 1, 0.9333333, 1,
-0.02256241, 0.2083439, -1.650775, 0, 1, 0.9411765, 1,
-0.02027237, -1.636902, -2.741444, 0, 1, 0.945098, 1,
-0.01861753, -0.5251656, -3.182398, 0, 1, 0.9529412, 1,
-0.01835082, 0.4761951, 0.005433274, 0, 1, 0.9568627, 1,
-0.01753442, 0.5267893, -1.581045, 0, 1, 0.9647059, 1,
-0.0174628, 1.087718, -0.1906276, 0, 1, 0.9686275, 1,
-0.01462023, -0.8309667, -2.538627, 0, 1, 0.9764706, 1,
-0.006176075, -0.1846279, -2.288816, 0, 1, 0.9803922, 1,
-0.00492696, -1.795897, -2.836563, 0, 1, 0.9882353, 1,
-0.002294038, -0.3853766, -1.338537, 0, 1, 0.9921569, 1,
0.006154458, 0.8444753, 0.4116868, 0, 1, 1, 1,
0.009697757, -0.8035613, 2.124102, 0, 0.9921569, 1, 1,
0.01257979, 1.782698, -0.3924737, 0, 0.9882353, 1, 1,
0.0137033, 0.2308753, 1.521643, 0, 0.9803922, 1, 1,
0.01446717, -0.3974802, 3.660846, 0, 0.9764706, 1, 1,
0.01496197, 1.380538, 1.225305, 0, 0.9686275, 1, 1,
0.01550766, -1.311279, 4.766829, 0, 0.9647059, 1, 1,
0.01707044, 0.4323913, 0.4171099, 0, 0.9568627, 1, 1,
0.02538976, -0.2999676, 5.142804, 0, 0.9529412, 1, 1,
0.0327956, 1.585648, -2.220806, 0, 0.945098, 1, 1,
0.03284447, 0.7327054, 0.4595007, 0, 0.9411765, 1, 1,
0.03452178, -0.3474746, 2.164204, 0, 0.9333333, 1, 1,
0.03481936, 1.065114, 1.747996, 0, 0.9294118, 1, 1,
0.03574788, -1.513538, 1.83946, 0, 0.9215686, 1, 1,
0.03615751, -2.02347, 2.138813, 0, 0.9176471, 1, 1,
0.03847294, 1.723692, 0.9019712, 0, 0.9098039, 1, 1,
0.04161222, -0.8302375, 4.017036, 0, 0.9058824, 1, 1,
0.04166728, -1.051148, 3.692698, 0, 0.8980392, 1, 1,
0.04240192, -0.922162, 4.027842, 0, 0.8901961, 1, 1,
0.04319459, -0.4593513, 3.670192, 0, 0.8862745, 1, 1,
0.04388538, 0.2683485, 0.2773156, 0, 0.8784314, 1, 1,
0.04544127, 0.8522339, 0.2268532, 0, 0.8745098, 1, 1,
0.04634718, 1.802431, -0.9343411, 0, 0.8666667, 1, 1,
0.05260217, 0.05034073, 2.825875, 0, 0.8627451, 1, 1,
0.05654733, 0.7288302, -0.8720677, 0, 0.854902, 1, 1,
0.06921173, 1.265829, -0.9800537, 0, 0.8509804, 1, 1,
0.07011106, 0.2843449, -0.907586, 0, 0.8431373, 1, 1,
0.07054213, -0.3961895, 3.84445, 0, 0.8392157, 1, 1,
0.07130405, -0.643589, 1.37463, 0, 0.8313726, 1, 1,
0.07598195, 1.125657, -0.7817477, 0, 0.827451, 1, 1,
0.07737084, -1.322935, 6.060075, 0, 0.8196079, 1, 1,
0.07751855, 1.424276, 1.161247, 0, 0.8156863, 1, 1,
0.07803089, -0.7545676, 2.930812, 0, 0.8078431, 1, 1,
0.08522113, 0.6794696, 0.1089781, 0, 0.8039216, 1, 1,
0.08977204, 0.7216998, 0.8374912, 0, 0.7960784, 1, 1,
0.0945227, -0.7907732, 2.17358, 0, 0.7882353, 1, 1,
0.09590315, 0.2882009, 0.5216391, 0, 0.7843137, 1, 1,
0.09949028, -0.2885233, 2.987339, 0, 0.7764706, 1, 1,
0.1006258, -0.05289423, 4.001818, 0, 0.772549, 1, 1,
0.1006968, 1.850752, 0.4167498, 0, 0.7647059, 1, 1,
0.1010149, -0.9953954, 1.41663, 0, 0.7607843, 1, 1,
0.1036181, -0.01966766, 1.239654, 0, 0.7529412, 1, 1,
0.1048464, 0.4877816, 0.1529507, 0, 0.7490196, 1, 1,
0.1049365, 1.158774, 0.6593621, 0, 0.7411765, 1, 1,
0.1052967, 0.7164218, -0.2639603, 0, 0.7372549, 1, 1,
0.107398, 0.6334904, -1.540951, 0, 0.7294118, 1, 1,
0.1090275, -1.721903, 3.344856, 0, 0.7254902, 1, 1,
0.1098952, 0.7320624, -0.3092186, 0, 0.7176471, 1, 1,
0.1105257, 0.6484007, -2.661042, 0, 0.7137255, 1, 1,
0.112913, -0.1987983, 3.8595, 0, 0.7058824, 1, 1,
0.1287427, -1.680488, 4.265834, 0, 0.6980392, 1, 1,
0.1313344, -0.2958008, 3.643922, 0, 0.6941177, 1, 1,
0.131384, 0.5406023, -0.07246368, 0, 0.6862745, 1, 1,
0.1319579, -0.8388602, 5.154742, 0, 0.682353, 1, 1,
0.1429402, 0.5678356, 1.079728, 0, 0.6745098, 1, 1,
0.1441312, -0.484468, 2.763758, 0, 0.6705883, 1, 1,
0.1459723, 0.1746577, -0.4859171, 0, 0.6627451, 1, 1,
0.1465661, -2.686393, 3.55071, 0, 0.6588235, 1, 1,
0.1495404, -1.177812, 2.634131, 0, 0.6509804, 1, 1,
0.1551071, 1.51376, 0.9191931, 0, 0.6470588, 1, 1,
0.1584081, 3.955351, 0.13633, 0, 0.6392157, 1, 1,
0.1596879, 0.3640452, 0.5781776, 0, 0.6352941, 1, 1,
0.1630416, 0.2489777, -0.4603726, 0, 0.627451, 1, 1,
0.1631859, -0.04821549, 0.9872066, 0, 0.6235294, 1, 1,
0.164475, -1.281513, 1.917288, 0, 0.6156863, 1, 1,
0.1661277, -0.8167116, 2.576028, 0, 0.6117647, 1, 1,
0.1699739, -0.06350867, 2.082347, 0, 0.6039216, 1, 1,
0.170593, 1.006956, -1.008895, 0, 0.5960785, 1, 1,
0.1721698, -0.4500604, 2.692263, 0, 0.5921569, 1, 1,
0.174092, -0.4848339, 3.37446, 0, 0.5843138, 1, 1,
0.1755162, -0.4125896, 4.33147, 0, 0.5803922, 1, 1,
0.1845854, -0.1220995, 2.828096, 0, 0.572549, 1, 1,
0.1866857, 2.050906, -0.09614579, 0, 0.5686275, 1, 1,
0.1903759, -1.882767, 1.415814, 0, 0.5607843, 1, 1,
0.1903836, 1.261703, 0.3222341, 0, 0.5568628, 1, 1,
0.1945928, 0.3733767, 1.364219, 0, 0.5490196, 1, 1,
0.1964027, -0.9126266, 2.21155, 0, 0.5450981, 1, 1,
0.1966181, -0.7266037, 4.598711, 0, 0.5372549, 1, 1,
0.1978177, 0.499604, 1.416066, 0, 0.5333334, 1, 1,
0.2008926, 1.391564, 0.8205973, 0, 0.5254902, 1, 1,
0.2021376, -0.7658865, 1.759078, 0, 0.5215687, 1, 1,
0.2034913, -0.07172148, 4.163452, 0, 0.5137255, 1, 1,
0.2121219, 0.1428287, -0.04997189, 0, 0.509804, 1, 1,
0.212697, 1.493431, 0.126403, 0, 0.5019608, 1, 1,
0.2144744, -0.7692537, -0.491824, 0, 0.4941176, 1, 1,
0.2161895, 1.877985, 0.008115795, 0, 0.4901961, 1, 1,
0.2177375, 0.5786309, -0.1106751, 0, 0.4823529, 1, 1,
0.2201361, 0.2399985, -0.3151074, 0, 0.4784314, 1, 1,
0.220594, 0.2103222, 0.657613, 0, 0.4705882, 1, 1,
0.2239504, -0.3879437, 3.583993, 0, 0.4666667, 1, 1,
0.2302172, 0.6141012, 0.9322713, 0, 0.4588235, 1, 1,
0.2341785, 0.0316563, 2.235305, 0, 0.454902, 1, 1,
0.2379164, 0.7140006, 1.575891, 0, 0.4470588, 1, 1,
0.2431426, 1.238882, -0.1667542, 0, 0.4431373, 1, 1,
0.2472914, -0.1691591, 2.67168, 0, 0.4352941, 1, 1,
0.247688, -0.5099957, 1.910848, 0, 0.4313726, 1, 1,
0.249339, -0.4790564, 3.975423, 0, 0.4235294, 1, 1,
0.2506543, 0.6608836, 0.4841214, 0, 0.4196078, 1, 1,
0.254382, -0.1846638, 1.650845, 0, 0.4117647, 1, 1,
0.2563714, 0.1138935, 1.424711, 0, 0.4078431, 1, 1,
0.2564675, -1.095399, 3.84794, 0, 0.4, 1, 1,
0.2594118, 0.3329874, -0.05665297, 0, 0.3921569, 1, 1,
0.2667329, -0.06907618, 0.9950565, 0, 0.3882353, 1, 1,
0.2673734, -0.3123023, 3.398746, 0, 0.3803922, 1, 1,
0.2713631, -0.1284127, 1.700457, 0, 0.3764706, 1, 1,
0.275127, -0.3105361, 0.01706667, 0, 0.3686275, 1, 1,
0.2766455, 0.2714689, 0.88108, 0, 0.3647059, 1, 1,
0.2792623, 0.2708332, -0.3743025, 0, 0.3568628, 1, 1,
0.2797546, -0.7923387, 3.191088, 0, 0.3529412, 1, 1,
0.2806998, -1.018248, 4.108935, 0, 0.345098, 1, 1,
0.2812688, 0.8744432, -0.4391219, 0, 0.3411765, 1, 1,
0.2814041, 0.7535961, 1.068049, 0, 0.3333333, 1, 1,
0.2843906, -0.03892146, 1.863722, 0, 0.3294118, 1, 1,
0.2871537, -1.175033, 2.622472, 0, 0.3215686, 1, 1,
0.2886504, 0.1799513, 1.880904, 0, 0.3176471, 1, 1,
0.2917708, -0.8550333, 2.690809, 0, 0.3098039, 1, 1,
0.2950146, -0.4458331, 2.344447, 0, 0.3058824, 1, 1,
0.2952819, -0.8731357, 3.274981, 0, 0.2980392, 1, 1,
0.2954785, 0.2703555, 1.715023, 0, 0.2901961, 1, 1,
0.2955763, -0.7788548, 1.81787, 0, 0.2862745, 1, 1,
0.2999157, -1.189528, 4.276897, 0, 0.2784314, 1, 1,
0.3005623, -0.3618266, 1.69187, 0, 0.2745098, 1, 1,
0.3026625, -0.5110259, 2.322501, 0, 0.2666667, 1, 1,
0.3078173, 1.828017, 0.5968447, 0, 0.2627451, 1, 1,
0.3086416, 2.172395, 0.5334508, 0, 0.254902, 1, 1,
0.3141415, -1.361783, 1.409019, 0, 0.2509804, 1, 1,
0.3151559, -0.1508401, 1.034563, 0, 0.2431373, 1, 1,
0.3187321, -1.272632, 2.002408, 0, 0.2392157, 1, 1,
0.3213639, -1.492205, 3.502613, 0, 0.2313726, 1, 1,
0.3241941, 0.8819261, -0.6387053, 0, 0.227451, 1, 1,
0.330711, -0.5548059, 3.088921, 0, 0.2196078, 1, 1,
0.3325709, -0.07925837, 1.035732, 0, 0.2156863, 1, 1,
0.3346583, -0.4693128, 0.888028, 0, 0.2078431, 1, 1,
0.3372535, 0.1448067, 0.2387039, 0, 0.2039216, 1, 1,
0.3384943, -0.3735441, 2.557115, 0, 0.1960784, 1, 1,
0.339578, -0.1189764, 3.883543, 0, 0.1882353, 1, 1,
0.3401119, -0.2469317, 1.093633, 0, 0.1843137, 1, 1,
0.3424104, -1.335472, 3.707552, 0, 0.1764706, 1, 1,
0.3436063, 0.6994192, 1.128593, 0, 0.172549, 1, 1,
0.3453111, -1.646411, 2.607205, 0, 0.1647059, 1, 1,
0.3475849, -0.188107, 1.290647, 0, 0.1607843, 1, 1,
0.3532835, -1.411692, 1.539198, 0, 0.1529412, 1, 1,
0.3546367, 2.259448, 0.8168359, 0, 0.1490196, 1, 1,
0.3581706, -0.2747321, 2.062021, 0, 0.1411765, 1, 1,
0.3637097, 0.5522367, 0.3400277, 0, 0.1372549, 1, 1,
0.366218, 0.1021052, 1.807533, 0, 0.1294118, 1, 1,
0.3708376, -2.887336, 3.794867, 0, 0.1254902, 1, 1,
0.3731686, 0.6081421, -0.3119727, 0, 0.1176471, 1, 1,
0.3742479, -1.95304, 4.083467, 0, 0.1137255, 1, 1,
0.3747863, -0.7410266, 2.349073, 0, 0.1058824, 1, 1,
0.3791917, 0.08100891, 2.683046, 0, 0.09803922, 1, 1,
0.3799684, -0.1760758, 2.511846, 0, 0.09411765, 1, 1,
0.3852161, 1.366772, -0.3313644, 0, 0.08627451, 1, 1,
0.3884026, -0.2285174, 0.9694548, 0, 0.08235294, 1, 1,
0.3898126, 1.797387, -0.5191069, 0, 0.07450981, 1, 1,
0.3967697, 0.4366509, 1.387641, 0, 0.07058824, 1, 1,
0.3970856, 1.811088, -0.2883541, 0, 0.0627451, 1, 1,
0.3997734, -0.3480942, 2.014282, 0, 0.05882353, 1, 1,
0.4028028, -0.3525632, 2.487183, 0, 0.05098039, 1, 1,
0.4028165, -0.1288935, 2.425339, 0, 0.04705882, 1, 1,
0.4044577, -1.115669, 3.215059, 0, 0.03921569, 1, 1,
0.407834, -1.079631, 2.68685, 0, 0.03529412, 1, 1,
0.4082185, -0.9056134, 2.203917, 0, 0.02745098, 1, 1,
0.4087542, 0.4299068, -0.3149601, 0, 0.02352941, 1, 1,
0.409434, 0.9446215, -1.138698, 0, 0.01568628, 1, 1,
0.4100541, -0.2537159, 0.1122151, 0, 0.01176471, 1, 1,
0.4127106, 1.600362, 1.310776, 0, 0.003921569, 1, 1,
0.4171881, -0.4784134, 3.176321, 0.003921569, 0, 1, 1,
0.4185392, 0.1214904, 0.2673257, 0.007843138, 0, 1, 1,
0.4209633, -0.1613641, 2.424191, 0.01568628, 0, 1, 1,
0.4244276, 0.5040552, 0.6438274, 0.01960784, 0, 1, 1,
0.4250824, 2.110515, 0.3550146, 0.02745098, 0, 1, 1,
0.425734, 0.2112193, 0.4577161, 0.03137255, 0, 1, 1,
0.4275289, 1.158765, -0.2929959, 0.03921569, 0, 1, 1,
0.4298733, 1.343595, 1.02595, 0.04313726, 0, 1, 1,
0.4302407, 0.965628, -0.336017, 0.05098039, 0, 1, 1,
0.4317029, 0.06448531, 0.9755479, 0.05490196, 0, 1, 1,
0.4336422, -0.7684096, 4.216019, 0.0627451, 0, 1, 1,
0.435796, 2.358727, -1.24675, 0.06666667, 0, 1, 1,
0.4369281, -1.994832, 3.68839, 0.07450981, 0, 1, 1,
0.4397756, 0.2085111, -0.01562555, 0.07843138, 0, 1, 1,
0.4462768, 0.9226788, -0.3977418, 0.08627451, 0, 1, 1,
0.4464991, -0.9913284, 3.366557, 0.09019608, 0, 1, 1,
0.4482025, 1.259076, 0.5500041, 0.09803922, 0, 1, 1,
0.450709, -1.46047, 2.508285, 0.1058824, 0, 1, 1,
0.4580513, 0.4767255, -0.2683014, 0.1098039, 0, 1, 1,
0.4610938, -1.37612, 3.19589, 0.1176471, 0, 1, 1,
0.4637178, 1.162688, 0.1992313, 0.1215686, 0, 1, 1,
0.4682239, 0.9716377, 0.662515, 0.1294118, 0, 1, 1,
0.479443, 0.5658495, 0.8875579, 0.1333333, 0, 1, 1,
0.4846515, 2.059847, -0.3467152, 0.1411765, 0, 1, 1,
0.4849076, 0.6497483, 0.6230108, 0.145098, 0, 1, 1,
0.4881101, 0.381418, 1.41191, 0.1529412, 0, 1, 1,
0.4930376, -0.1810527, 2.503206, 0.1568628, 0, 1, 1,
0.4940752, 0.8820294, 0.97775, 0.1647059, 0, 1, 1,
0.4961493, 1.98858, -0.1034021, 0.1686275, 0, 1, 1,
0.496897, 0.1366297, 1.518077, 0.1764706, 0, 1, 1,
0.500977, 0.3682582, 2.609239, 0.1803922, 0, 1, 1,
0.5011207, -0.2360452, 2.893772, 0.1882353, 0, 1, 1,
0.5053186, -1.198752, 1.526287, 0.1921569, 0, 1, 1,
0.5061187, 0.949964, 1.132584, 0.2, 0, 1, 1,
0.5091172, -1.725859, 2.797067, 0.2078431, 0, 1, 1,
0.5119232, 0.08156709, 2.814001, 0.2117647, 0, 1, 1,
0.5139132, -1.627919, 3.46834, 0.2196078, 0, 1, 1,
0.5170269, -0.5071055, 1.337048, 0.2235294, 0, 1, 1,
0.5174387, -0.4786438, 1.487158, 0.2313726, 0, 1, 1,
0.5202535, -0.9197137, 2.21988, 0.2352941, 0, 1, 1,
0.5244439, 0.9707773, 0.3574737, 0.2431373, 0, 1, 1,
0.5245789, 1.088345, 1.173908, 0.2470588, 0, 1, 1,
0.5252663, 0.2771564, 0.04280937, 0.254902, 0, 1, 1,
0.5274459, 0.7146037, -0.1960942, 0.2588235, 0, 1, 1,
0.5299361, -1.831398, 1.955342, 0.2666667, 0, 1, 1,
0.5333945, -0.01033, 2.279013, 0.2705882, 0, 1, 1,
0.5350697, -0.1982567, 2.640103, 0.2784314, 0, 1, 1,
0.5373621, 0.4702294, 1.482098, 0.282353, 0, 1, 1,
0.5409027, -1.259842, 2.817798, 0.2901961, 0, 1, 1,
0.5415003, 0.01275924, 1.379133, 0.2941177, 0, 1, 1,
0.5417791, 0.2659592, 1.381383, 0.3019608, 0, 1, 1,
0.5436836, 0.9787088, 2.237505, 0.3098039, 0, 1, 1,
0.5447348, -1.049871, 3.842452, 0.3137255, 0, 1, 1,
0.5497432, 0.404141, 0.3286688, 0.3215686, 0, 1, 1,
0.5514722, 0.250841, 1.587474, 0.3254902, 0, 1, 1,
0.5536977, -0.05732298, 1.533187, 0.3333333, 0, 1, 1,
0.5620893, -0.8839296, 3.741714, 0.3372549, 0, 1, 1,
0.565639, -0.5643158, 2.688234, 0.345098, 0, 1, 1,
0.5658386, 1.482726, 0.4934926, 0.3490196, 0, 1, 1,
0.5662619, -0.6413, 1.043492, 0.3568628, 0, 1, 1,
0.5673687, -1.569801, 1.653498, 0.3607843, 0, 1, 1,
0.5741321, 1.099406, 0.2799289, 0.3686275, 0, 1, 1,
0.5824353, 0.2225678, 0.8203562, 0.372549, 0, 1, 1,
0.5853751, 0.08653045, 1.049431, 0.3803922, 0, 1, 1,
0.5874685, -1.523785, 3.410921, 0.3843137, 0, 1, 1,
0.5926927, -0.1679377, 4.835997, 0.3921569, 0, 1, 1,
0.5956007, -0.8535504, 0.9019571, 0.3960784, 0, 1, 1,
0.5972592, 1.020952, -1.381228, 0.4039216, 0, 1, 1,
0.6052065, 0.7065936, 1.643552, 0.4117647, 0, 1, 1,
0.605969, 0.0640948, 0.05524193, 0.4156863, 0, 1, 1,
0.6081951, 2.063013, 0.3264609, 0.4235294, 0, 1, 1,
0.6097094, -1.251179, 2.370078, 0.427451, 0, 1, 1,
0.6102211, 0.0835014, 1.820701, 0.4352941, 0, 1, 1,
0.6118701, 0.882491, -0.2707374, 0.4392157, 0, 1, 1,
0.6158121, -0.8284183, 2.233013, 0.4470588, 0, 1, 1,
0.6174321, 0.1328782, 2.599046, 0.4509804, 0, 1, 1,
0.6213228, -0.8933834, 3.495373, 0.4588235, 0, 1, 1,
0.6275644, -0.2680939, 1.145039, 0.4627451, 0, 1, 1,
0.63617, -0.1756814, 2.920074, 0.4705882, 0, 1, 1,
0.6366525, -0.1466257, 4.161861, 0.4745098, 0, 1, 1,
0.6398658, 0.9670398, 1.797911, 0.4823529, 0, 1, 1,
0.645133, -0.08109528, 1.927293, 0.4862745, 0, 1, 1,
0.6486679, 0.1256943, 2.224229, 0.4941176, 0, 1, 1,
0.6490225, -0.9949949, 2.633961, 0.5019608, 0, 1, 1,
0.6544908, -0.417564, 2.681432, 0.5058824, 0, 1, 1,
0.6555895, 1.232107, -1.332053, 0.5137255, 0, 1, 1,
0.6583372, 0.5171937, -0.4175505, 0.5176471, 0, 1, 1,
0.6614041, -1.395165, 3.456829, 0.5254902, 0, 1, 1,
0.6647919, 0.08232689, 2.817609, 0.5294118, 0, 1, 1,
0.6665116, 0.5246833, 1.868239, 0.5372549, 0, 1, 1,
0.6701954, 1.821506, -1.446329, 0.5411765, 0, 1, 1,
0.670525, 0.4742563, -0.1337807, 0.5490196, 0, 1, 1,
0.6708694, -0.07821734, 1.828723, 0.5529412, 0, 1, 1,
0.6720867, -0.799494, 2.498897, 0.5607843, 0, 1, 1,
0.6759241, -0.194895, 0.9832815, 0.5647059, 0, 1, 1,
0.6814609, -0.5707298, 3.109596, 0.572549, 0, 1, 1,
0.6842551, -0.8711541, 2.932306, 0.5764706, 0, 1, 1,
0.6851097, -0.2910963, 3.365355, 0.5843138, 0, 1, 1,
0.6890782, 0.1183886, 2.734777, 0.5882353, 0, 1, 1,
0.6919572, 0.2538866, 2.776248, 0.5960785, 0, 1, 1,
0.6976026, -0.7097159, 1.626288, 0.6039216, 0, 1, 1,
0.6990167, -1.037599, 1.369608, 0.6078432, 0, 1, 1,
0.7015342, 2.039978, 0.6238768, 0.6156863, 0, 1, 1,
0.7029647, 1.438193, 2.032038, 0.6196079, 0, 1, 1,
0.7129373, -0.6606596, 1.988668, 0.627451, 0, 1, 1,
0.7222551, 0.6267499, 1.244805, 0.6313726, 0, 1, 1,
0.722823, -1.000418, 0.4622729, 0.6392157, 0, 1, 1,
0.7244061, -1.824231, 0.8042102, 0.6431373, 0, 1, 1,
0.7249367, 0.1903355, -0.361978, 0.6509804, 0, 1, 1,
0.7263181, -0.7381322, 2.549767, 0.654902, 0, 1, 1,
0.7314222, -0.1548804, 2.619025, 0.6627451, 0, 1, 1,
0.7319365, 0.7708296, 1.746097, 0.6666667, 0, 1, 1,
0.7330902, -1.049549, 2.369136, 0.6745098, 0, 1, 1,
0.7359335, -0.9749199, 2.821905, 0.6784314, 0, 1, 1,
0.7402672, 1.487015, 1.008534, 0.6862745, 0, 1, 1,
0.7405369, -0.08037969, 1.02006, 0.6901961, 0, 1, 1,
0.7424518, 0.9579876, 0.5748149, 0.6980392, 0, 1, 1,
0.7433631, 1.180204, 0.08844683, 0.7058824, 0, 1, 1,
0.7445917, 0.544638, 1.407701, 0.7098039, 0, 1, 1,
0.7521108, -0.04115579, 2.425817, 0.7176471, 0, 1, 1,
0.7530864, 0.1766629, -0.537285, 0.7215686, 0, 1, 1,
0.7644125, 0.6477181, 0.3545246, 0.7294118, 0, 1, 1,
0.7721484, -0.06190544, 1.227424, 0.7333333, 0, 1, 1,
0.7726066, 0.2619888, 0.5033286, 0.7411765, 0, 1, 1,
0.7741305, -0.7974986, 1.488837, 0.7450981, 0, 1, 1,
0.7759113, 0.3663659, 1.480324, 0.7529412, 0, 1, 1,
0.7811465, 0.3178763, 0.7614169, 0.7568628, 0, 1, 1,
0.7845701, -0.02334613, 0.3360639, 0.7647059, 0, 1, 1,
0.7895325, -0.3500189, 3.134296, 0.7686275, 0, 1, 1,
0.7922356, -0.1908263, 2.433191, 0.7764706, 0, 1, 1,
0.7988629, 1.266619, -0.594188, 0.7803922, 0, 1, 1,
0.8104078, 0.2260519, 0.6827514, 0.7882353, 0, 1, 1,
0.8107225, 0.05309965, 1.023153, 0.7921569, 0, 1, 1,
0.8166034, 0.2349304, 1.05952, 0.8, 0, 1, 1,
0.8183156, 0.09172322, -0.5591203, 0.8078431, 0, 1, 1,
0.8255723, 0.5280199, 0.6209281, 0.8117647, 0, 1, 1,
0.8301733, 0.03888979, 2.167738, 0.8196079, 0, 1, 1,
0.834134, 0.1383755, 0.2240674, 0.8235294, 0, 1, 1,
0.8343954, -1.363982, 2.495497, 0.8313726, 0, 1, 1,
0.8358263, -0.2636894, 0.8049457, 0.8352941, 0, 1, 1,
0.8374045, 1.20523, -0.773166, 0.8431373, 0, 1, 1,
0.8388738, -0.05200846, 0.6250888, 0.8470588, 0, 1, 1,
0.8499402, 0.05787533, 0.2888007, 0.854902, 0, 1, 1,
0.8520364, 2.901773, -0.4836688, 0.8588235, 0, 1, 1,
0.8581634, 0.2470338, 0.6479659, 0.8666667, 0, 1, 1,
0.8718531, -0.50777, 1.37122, 0.8705882, 0, 1, 1,
0.8741286, -0.8018731, 2.616529, 0.8784314, 0, 1, 1,
0.8769311, 0.4701196, 2.418656, 0.8823529, 0, 1, 1,
0.8814821, -0.3779429, 1.714684, 0.8901961, 0, 1, 1,
0.8886796, -0.4106815, 2.215793, 0.8941177, 0, 1, 1,
0.889706, -0.5346932, 2.269338, 0.9019608, 0, 1, 1,
0.8942192, -0.6257805, 0.408841, 0.9098039, 0, 1, 1,
0.8952248, 0.8877159, -0.6612468, 0.9137255, 0, 1, 1,
0.9000791, -0.7037621, 1.315542, 0.9215686, 0, 1, 1,
0.9040752, 0.5518436, 2.196246, 0.9254902, 0, 1, 1,
0.9052298, -1.022607, 2.060389, 0.9333333, 0, 1, 1,
0.9100646, -0.1889903, 2.68013, 0.9372549, 0, 1, 1,
0.9148141, -0.7109687, 2.518525, 0.945098, 0, 1, 1,
0.9163483, -0.5561224, 3.507174, 0.9490196, 0, 1, 1,
0.9272756, 0.6993646, 0.1122535, 0.9568627, 0, 1, 1,
0.9279453, 0.5541944, 1.11987, 0.9607843, 0, 1, 1,
0.9414903, 0.7323225, 1.802211, 0.9686275, 0, 1, 1,
0.9451837, -2.502266, 3.500891, 0.972549, 0, 1, 1,
0.9565405, -0.790172, 2.768876, 0.9803922, 0, 1, 1,
0.9573445, -0.8217996, 1.039056, 0.9843137, 0, 1, 1,
0.9647534, -2.015033, 2.125559, 0.9921569, 0, 1, 1,
0.9661753, 0.8173553, 0.8632537, 0.9960784, 0, 1, 1,
0.9674175, -0.7101748, 1.444836, 1, 0, 0.9960784, 1,
0.9704998, 1.400445, -1.714969, 1, 0, 0.9882353, 1,
0.9718397, -0.284622, 0.190429, 1, 0, 0.9843137, 1,
0.9728802, -0.535831, 3.254732, 1, 0, 0.9764706, 1,
0.973864, 0.0498573, 2.191284, 1, 0, 0.972549, 1,
0.9742345, 0.79878, -0.2948827, 1, 0, 0.9647059, 1,
0.976414, 0.9246798, 0.03079442, 1, 0, 0.9607843, 1,
0.9799711, -2.507997, 4.289909, 1, 0, 0.9529412, 1,
0.9801225, -1.548796, 2.111132, 1, 0, 0.9490196, 1,
1.011189, 0.2167388, 1.903899, 1, 0, 0.9411765, 1,
1.023243, 1.111782, 1.107454, 1, 0, 0.9372549, 1,
1.02396, -0.2510169, 0.1580152, 1, 0, 0.9294118, 1,
1.031332, 0.4240522, 3.9239, 1, 0, 0.9254902, 1,
1.036893, 0.5353842, 2.039626, 1, 0, 0.9176471, 1,
1.040064, 0.0250984, 2.683591, 1, 0, 0.9137255, 1,
1.04553, 0.437277, 1.812282, 1, 0, 0.9058824, 1,
1.04616, 1.332888, 2.522315, 1, 0, 0.9019608, 1,
1.058124, 2.212597, 0.05492827, 1, 0, 0.8941177, 1,
1.064637, 1.199567, 1.406488, 1, 0, 0.8862745, 1,
1.065333, -0.3742551, 0.7121441, 1, 0, 0.8823529, 1,
1.078356, -0.6585219, 2.817373, 1, 0, 0.8745098, 1,
1.09032, 0.4281882, 1.662441, 1, 0, 0.8705882, 1,
1.09536, -0.1197467, 1.315614, 1, 0, 0.8627451, 1,
1.099611, -0.01210066, 1.256188, 1, 0, 0.8588235, 1,
1.105736, -1.030628, 3.020924, 1, 0, 0.8509804, 1,
1.107454, 1.206967, -1.297309, 1, 0, 0.8470588, 1,
1.112472, -1.39511, 3.404285, 1, 0, 0.8392157, 1,
1.115722, -0.3714916, 1.059529, 1, 0, 0.8352941, 1,
1.11688, -0.2282846, 1.696134, 1, 0, 0.827451, 1,
1.122417, 0.3317278, 1.211097, 1, 0, 0.8235294, 1,
1.124569, 2.345452, 1.421279, 1, 0, 0.8156863, 1,
1.126584, 0.1482996, -0.3694088, 1, 0, 0.8117647, 1,
1.127672, -0.3021531, 3.019839, 1, 0, 0.8039216, 1,
1.132307, -0.002158887, 1.094168, 1, 0, 0.7960784, 1,
1.138415, -0.9755514, 0.5760481, 1, 0, 0.7921569, 1,
1.148019, 0.9690274, -1.564505, 1, 0, 0.7843137, 1,
1.14908, 1.249878, 1.487901, 1, 0, 0.7803922, 1,
1.15938, -1.991276, 2.091287, 1, 0, 0.772549, 1,
1.161199, -2.332484, 1.737538, 1, 0, 0.7686275, 1,
1.173844, 0.5790375, 0.09095648, 1, 0, 0.7607843, 1,
1.175339, 0.1378582, 0.3270303, 1, 0, 0.7568628, 1,
1.176638, -0.5767391, 3.623575, 1, 0, 0.7490196, 1,
1.179279, -0.3963749, 0.2499203, 1, 0, 0.7450981, 1,
1.187415, -1.481969, 1.830524, 1, 0, 0.7372549, 1,
1.197926, 1.117314, 0.9509951, 1, 0, 0.7333333, 1,
1.205097, 0.2519419, 2.05749, 1, 0, 0.7254902, 1,
1.210247, -0.9937064, 2.485014, 1, 0, 0.7215686, 1,
1.210532, 1.196954, 1.26183, 1, 0, 0.7137255, 1,
1.212712, -0.1660173, 2.530964, 1, 0, 0.7098039, 1,
1.215573, 0.3570133, 0.6625249, 1, 0, 0.7019608, 1,
1.216712, -0.3793388, 1.838836, 1, 0, 0.6941177, 1,
1.220207, -0.2439129, 0.6287715, 1, 0, 0.6901961, 1,
1.22036, 0.7198786, 1.69681, 1, 0, 0.682353, 1,
1.224372, 0.3424234, 0.7305699, 1, 0, 0.6784314, 1,
1.228081, -0.8789448, 1.78695, 1, 0, 0.6705883, 1,
1.24135, -0.8246771, 2.938044, 1, 0, 0.6666667, 1,
1.247999, 0.7396751, 0.3586166, 1, 0, 0.6588235, 1,
1.251399, -0.2178301, 0.5715155, 1, 0, 0.654902, 1,
1.266126, 0.2312668, 1.63292, 1, 0, 0.6470588, 1,
1.26631, -0.2036636, 2.733986, 1, 0, 0.6431373, 1,
1.268869, 1.439375, 1.313129, 1, 0, 0.6352941, 1,
1.27231, 1.172101, 1.07829, 1, 0, 0.6313726, 1,
1.275177, -0.006819095, 1.127464, 1, 0, 0.6235294, 1,
1.282162, 0.3024568, 2.165004, 1, 0, 0.6196079, 1,
1.286613, 1.336671, 2.129939, 1, 0, 0.6117647, 1,
1.300309, 1.413397, 1.816104, 1, 0, 0.6078432, 1,
1.316766, -0.2659583, 0.7106839, 1, 0, 0.6, 1,
1.34129, 1.166253, 0.5555505, 1, 0, 0.5921569, 1,
1.349253, -2.001247, 3.033957, 1, 0, 0.5882353, 1,
1.350684, -1.198232, 2.994925, 1, 0, 0.5803922, 1,
1.36377, 1.057472, 1.526703, 1, 0, 0.5764706, 1,
1.370831, -0.3256274, 1.494884, 1, 0, 0.5686275, 1,
1.372261, 1.255769, -0.2343647, 1, 0, 0.5647059, 1,
1.378582, 0.6432418, 2.525373, 1, 0, 0.5568628, 1,
1.382696, -0.4612036, 0.8670107, 1, 0, 0.5529412, 1,
1.39391, -0.3174431, 3.914699, 1, 0, 0.5450981, 1,
1.396499, 0.4090032, 0.9460654, 1, 0, 0.5411765, 1,
1.40388, -0.538046, 2.01375, 1, 0, 0.5333334, 1,
1.404343, -2.776656, 3.749785, 1, 0, 0.5294118, 1,
1.417638, -1.431252, 1.341677, 1, 0, 0.5215687, 1,
1.420543, 0.4965505, 2.348434, 1, 0, 0.5176471, 1,
1.422942, 0.5977148, 2.197529, 1, 0, 0.509804, 1,
1.435999, 1.332219, -0.9137726, 1, 0, 0.5058824, 1,
1.449966, 0.4167264, 1.653441, 1, 0, 0.4980392, 1,
1.451745, -0.2272513, 2.917718, 1, 0, 0.4901961, 1,
1.463865, 0.2405389, 0.6485118, 1, 0, 0.4862745, 1,
1.467889, 0.7958061, 1.710876, 1, 0, 0.4784314, 1,
1.481981, 0.5028216, 3.15628, 1, 0, 0.4745098, 1,
1.484977, 1.033338, 0.8490356, 1, 0, 0.4666667, 1,
1.494731, 0.3555343, 2.108563, 1, 0, 0.4627451, 1,
1.49516, 0.1351698, 1.577743, 1, 0, 0.454902, 1,
1.496806, 0.03878745, 1.830174, 1, 0, 0.4509804, 1,
1.500329, -1.179448, 2.07871, 1, 0, 0.4431373, 1,
1.503588, -0.9636402, 3.033123, 1, 0, 0.4392157, 1,
1.523237, 0.9653664, 0.6251754, 1, 0, 0.4313726, 1,
1.529246, -0.007914423, -0.2367881, 1, 0, 0.427451, 1,
1.530864, -0.7163652, 1.679033, 1, 0, 0.4196078, 1,
1.549667, 0.4320581, 1.277643, 1, 0, 0.4156863, 1,
1.556339, 0.4760246, 0.4095285, 1, 0, 0.4078431, 1,
1.56992, -0.04481978, 0.4026732, 1, 0, 0.4039216, 1,
1.57895, 0.4834568, 1.050971, 1, 0, 0.3960784, 1,
1.581087, -0.5787757, 0.9426575, 1, 0, 0.3882353, 1,
1.583406, -0.05374065, -0.3668574, 1, 0, 0.3843137, 1,
1.598209, -0.1289067, 2.22042, 1, 0, 0.3764706, 1,
1.605882, -1.136953, 2.819397, 1, 0, 0.372549, 1,
1.610986, 1.992631, 1.540511, 1, 0, 0.3647059, 1,
1.619761, -0.0399299, 0.9121089, 1, 0, 0.3607843, 1,
1.62056, 0.03363671, 2.208982, 1, 0, 0.3529412, 1,
1.642384, -1.219472, 2.644148, 1, 0, 0.3490196, 1,
1.646133, 0.6596417, 1.4062, 1, 0, 0.3411765, 1,
1.647581, 0.3821516, 2.312363, 1, 0, 0.3372549, 1,
1.649259, 0.08107983, 1.007247, 1, 0, 0.3294118, 1,
1.658878, 0.5804661, 2.053504, 1, 0, 0.3254902, 1,
1.664277, -0.2280447, -0.03946909, 1, 0, 0.3176471, 1,
1.670313, -0.1085216, 1.284384, 1, 0, 0.3137255, 1,
1.691821, -0.2608885, 1.546903, 1, 0, 0.3058824, 1,
1.70298, -0.6156526, 3.924035, 1, 0, 0.2980392, 1,
1.714718, -0.1010083, -0.1300206, 1, 0, 0.2941177, 1,
1.744132, 1.375016, -0.3764498, 1, 0, 0.2862745, 1,
1.745856, 1.221988, 1.136112, 1, 0, 0.282353, 1,
1.755241, 1.045689, -1.023676, 1, 0, 0.2745098, 1,
1.75947, 1.55939, 1.062538, 1, 0, 0.2705882, 1,
1.765314, -0.8226749, 0.4978609, 1, 0, 0.2627451, 1,
1.771464, -1.177986, 2.562932, 1, 0, 0.2588235, 1,
1.776218, 1.281569, 0.45341, 1, 0, 0.2509804, 1,
1.79429, 0.4419949, 0.4495882, 1, 0, 0.2470588, 1,
1.806466, 0.3615722, 0.3051221, 1, 0, 0.2392157, 1,
1.806505, -0.2163947, 0.8469238, 1, 0, 0.2352941, 1,
1.809452, 1.497314, 0.5399549, 1, 0, 0.227451, 1,
1.812148, -0.06030945, 1.489969, 1, 0, 0.2235294, 1,
1.828115, 0.1362422, 1.388556, 1, 0, 0.2156863, 1,
1.834985, -1.598212, 1.939778, 1, 0, 0.2117647, 1,
1.842542, 1.752514, 1.667285, 1, 0, 0.2039216, 1,
1.853352, -0.1541276, 2.142799, 1, 0, 0.1960784, 1,
1.858526, -0.3156643, 1.060553, 1, 0, 0.1921569, 1,
1.865075, 0.598735, 0.5318987, 1, 0, 0.1843137, 1,
1.887313, 0.3565433, 0.8848622, 1, 0, 0.1803922, 1,
1.893184, -1.025712, 2.139436, 1, 0, 0.172549, 1,
1.902927, 0.7429416, 1.76838, 1, 0, 0.1686275, 1,
1.909901, 1.033358, 0.7685078, 1, 0, 0.1607843, 1,
1.913755, -0.09623147, 2.744609, 1, 0, 0.1568628, 1,
1.92445, 0.6653009, 1.756469, 1, 0, 0.1490196, 1,
1.927732, -0.1423071, 1.813651, 1, 0, 0.145098, 1,
1.931025, -0.3654671, 2.621766, 1, 0, 0.1372549, 1,
1.9392, -0.6182284, 2.391084, 1, 0, 0.1333333, 1,
1.979414, 1.152905, 0.5093771, 1, 0, 0.1254902, 1,
1.981943, -0.7164455, 2.029615, 1, 0, 0.1215686, 1,
1.982193, 1.343458, 1.743781, 1, 0, 0.1137255, 1,
1.982255, -1.274825, 1.44448, 1, 0, 0.1098039, 1,
1.986623, -0.1164105, 1.768985, 1, 0, 0.1019608, 1,
2.023679, 0.644526, 0.3861347, 1, 0, 0.09411765, 1,
2.118696, -1.697401, 2.990857, 1, 0, 0.09019608, 1,
2.130533, 1.327364, 0.6554431, 1, 0, 0.08235294, 1,
2.140631, 0.4725095, 0.8831474, 1, 0, 0.07843138, 1,
2.141645, -0.5942743, 1.29389, 1, 0, 0.07058824, 1,
2.163822, -1.737795, 2.380745, 1, 0, 0.06666667, 1,
2.174237, -1.528919, 4.390249, 1, 0, 0.05882353, 1,
2.205873, 0.2216341, 1.488765, 1, 0, 0.05490196, 1,
2.230735, -0.9879984, 1.785732, 1, 0, 0.04705882, 1,
2.300267, 0.1494658, 2.076548, 1, 0, 0.04313726, 1,
2.350377, 0.5994245, 0.4973826, 1, 0, 0.03529412, 1,
2.360315, -1.005036, 1.684256, 1, 0, 0.03137255, 1,
2.363166, 1.538918, 0.6251779, 1, 0, 0.02352941, 1,
2.559094, 0.3226683, 0.3016279, 1, 0, 0.01960784, 1,
2.624361, -0.3766447, 1.232948, 1, 0, 0.01176471, 1,
2.916804, -0.001075036, 2.401931, 1, 0, 0.007843138, 1
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
0.1335802, -4.504306, -7.034091, 0, -0.5, 0.5, 0.5,
0.1335802, -4.504306, -7.034091, 1, -0.5, 0.5, 0.5,
0.1335802, -4.504306, -7.034091, 1, 1.5, 0.5, 0.5,
0.1335802, -4.504306, -7.034091, 0, 1.5, 0.5, 0.5
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
-3.593157, 0.3385673, -7.034091, 0, -0.5, 0.5, 0.5,
-3.593157, 0.3385673, -7.034091, 1, -0.5, 0.5, 0.5,
-3.593157, 0.3385673, -7.034091, 1, 1.5, 0.5, 0.5,
-3.593157, 0.3385673, -7.034091, 0, 1.5, 0.5, 0.5
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
-3.593157, -4.504306, 0.461885, 0, -0.5, 0.5, 0.5,
-3.593157, -4.504306, 0.461885, 1, -0.5, 0.5, 0.5,
-3.593157, -4.504306, 0.461885, 1, 1.5, 0.5, 0.5,
-3.593157, -4.504306, 0.461885, 0, 1.5, 0.5, 0.5
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
-2, -3.38672, -5.304251,
2, -3.38672, -5.304251,
-2, -3.38672, -5.304251,
-2, -3.572984, -5.592557,
-1, -3.38672, -5.304251,
-1, -3.572984, -5.592557,
0, -3.38672, -5.304251,
0, -3.572984, -5.592557,
1, -3.38672, -5.304251,
1, -3.572984, -5.592557,
2, -3.38672, -5.304251,
2, -3.572984, -5.592557
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
-2, -3.945513, -6.169171, 0, -0.5, 0.5, 0.5,
-2, -3.945513, -6.169171, 1, -0.5, 0.5, 0.5,
-2, -3.945513, -6.169171, 1, 1.5, 0.5, 0.5,
-2, -3.945513, -6.169171, 0, 1.5, 0.5, 0.5,
-1, -3.945513, -6.169171, 0, -0.5, 0.5, 0.5,
-1, -3.945513, -6.169171, 1, -0.5, 0.5, 0.5,
-1, -3.945513, -6.169171, 1, 1.5, 0.5, 0.5,
-1, -3.945513, -6.169171, 0, 1.5, 0.5, 0.5,
0, -3.945513, -6.169171, 0, -0.5, 0.5, 0.5,
0, -3.945513, -6.169171, 1, -0.5, 0.5, 0.5,
0, -3.945513, -6.169171, 1, 1.5, 0.5, 0.5,
0, -3.945513, -6.169171, 0, 1.5, 0.5, 0.5,
1, -3.945513, -6.169171, 0, -0.5, 0.5, 0.5,
1, -3.945513, -6.169171, 1, -0.5, 0.5, 0.5,
1, -3.945513, -6.169171, 1, 1.5, 0.5, 0.5,
1, -3.945513, -6.169171, 0, 1.5, 0.5, 0.5,
2, -3.945513, -6.169171, 0, -0.5, 0.5, 0.5,
2, -3.945513, -6.169171, 1, -0.5, 0.5, 0.5,
2, -3.945513, -6.169171, 1, 1.5, 0.5, 0.5,
2, -3.945513, -6.169171, 0, 1.5, 0.5, 0.5
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
-2.733141, -2, -5.304251,
-2.733141, 2, -5.304251,
-2.733141, -2, -5.304251,
-2.876477, -2, -5.592557,
-2.733141, 0, -5.304251,
-2.876477, 0, -5.592557,
-2.733141, 2, -5.304251,
-2.876477, 2, -5.592557
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
"0",
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
-3.163149, -2, -6.169171, 0, -0.5, 0.5, 0.5,
-3.163149, -2, -6.169171, 1, -0.5, 0.5, 0.5,
-3.163149, -2, -6.169171, 1, 1.5, 0.5, 0.5,
-3.163149, -2, -6.169171, 0, 1.5, 0.5, 0.5,
-3.163149, 0, -6.169171, 0, -0.5, 0.5, 0.5,
-3.163149, 0, -6.169171, 1, -0.5, 0.5, 0.5,
-3.163149, 0, -6.169171, 1, 1.5, 0.5, 0.5,
-3.163149, 0, -6.169171, 0, 1.5, 0.5, 0.5,
-3.163149, 2, -6.169171, 0, -0.5, 0.5, 0.5,
-3.163149, 2, -6.169171, 1, -0.5, 0.5, 0.5,
-3.163149, 2, -6.169171, 1, 1.5, 0.5, 0.5,
-3.163149, 2, -6.169171, 0, 1.5, 0.5, 0.5
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
-2.733141, -3.38672, -4,
-2.733141, -3.38672, 6,
-2.733141, -3.38672, -4,
-2.876477, -3.572984, -4,
-2.733141, -3.38672, -2,
-2.876477, -3.572984, -2,
-2.733141, -3.38672, 0,
-2.876477, -3.572984, 0,
-2.733141, -3.38672, 2,
-2.876477, -3.572984, 2,
-2.733141, -3.38672, 4,
-2.876477, -3.572984, 4,
-2.733141, -3.38672, 6,
-2.876477, -3.572984, 6
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
-3.163149, -3.945513, -4, 0, -0.5, 0.5, 0.5,
-3.163149, -3.945513, -4, 1, -0.5, 0.5, 0.5,
-3.163149, -3.945513, -4, 1, 1.5, 0.5, 0.5,
-3.163149, -3.945513, -4, 0, 1.5, 0.5, 0.5,
-3.163149, -3.945513, -2, 0, -0.5, 0.5, 0.5,
-3.163149, -3.945513, -2, 1, -0.5, 0.5, 0.5,
-3.163149, -3.945513, -2, 1, 1.5, 0.5, 0.5,
-3.163149, -3.945513, -2, 0, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 0, 0, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 0, 1, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 0, 1, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 0, 0, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 2, 0, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 2, 1, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 2, 1, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 2, 0, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 4, 0, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 4, 1, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 4, 1, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 4, 0, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 6, 0, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 6, 1, -0.5, 0.5, 0.5,
-3.163149, -3.945513, 6, 1, 1.5, 0.5, 0.5,
-3.163149, -3.945513, 6, 0, 1.5, 0.5, 0.5
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
-2.733141, -3.38672, -5.304251,
-2.733141, 4.063854, -5.304251,
-2.733141, -3.38672, 6.228021,
-2.733141, 4.063854, 6.228021,
-2.733141, -3.38672, -5.304251,
-2.733141, -3.38672, 6.228021,
-2.733141, 4.063854, -5.304251,
-2.733141, 4.063854, 6.228021,
-2.733141, -3.38672, -5.304251,
3.000301, -3.38672, -5.304251,
-2.733141, -3.38672, 6.228021,
3.000301, -3.38672, 6.228021,
-2.733141, 4.063854, -5.304251,
3.000301, 4.063854, -5.304251,
-2.733141, 4.063854, 6.228021,
3.000301, 4.063854, 6.228021,
3.000301, -3.38672, -5.304251,
3.000301, 4.063854, -5.304251,
3.000301, -3.38672, 6.228021,
3.000301, 4.063854, 6.228021,
3.000301, -3.38672, -5.304251,
3.000301, -3.38672, 6.228021,
3.000301, 4.063854, -5.304251,
3.000301, 4.063854, 6.228021
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
var radius = 7.944954;
var distance = 35.348;
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
mvMatrix.translate( -0.1335802, -0.3385673, -0.461885 );
mvMatrix.scale( 1.498269, 1.152964, 0.7448871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.348);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flumiclorac-pentyl<-read.table("flumiclorac-pentyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flumiclorac-pentyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumiclorac' not found
```

```r
y<-flumiclorac-pentyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumiclorac' not found
```

```r
z<-flumiclorac-pentyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumiclorac' not found
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
-2.649644, -0.7060331, -4.722208, 0, 0, 1, 1, 1,
-2.459937, -1.482831, -2.58425, 1, 0, 0, 1, 1,
-2.385403, -0.270409, -0.9624447, 1, 0, 0, 1, 1,
-2.36374, 0.1417589, -0.1731283, 1, 0, 0, 1, 1,
-2.346664, -0.02358465, -2.841246, 1, 0, 0, 1, 1,
-2.322886, 0.3664559, -1.638816, 1, 0, 0, 1, 1,
-2.282844, 0.3366923, -0.4825855, 0, 0, 0, 1, 1,
-2.257163, 0.02030228, -1.828984, 0, 0, 0, 1, 1,
-2.220904, -0.845026, -1.504893, 0, 0, 0, 1, 1,
-2.204914, -0.365297, -3.249476, 0, 0, 0, 1, 1,
-2.199223, 0.1391582, -1.405539, 0, 0, 0, 1, 1,
-2.196117, 0.5925145, 0.1327325, 0, 0, 0, 1, 1,
-2.10954, -0.8188573, -1.654077, 0, 0, 0, 1, 1,
-2.105599, 0.8650241, -1.971712, 1, 1, 1, 1, 1,
-2.100827, 0.4086243, -2.086028, 1, 1, 1, 1, 1,
-2.087001, -1.247491, -0.700272, 1, 1, 1, 1, 1,
-2.086872, 0.8157654, -0.3481475, 1, 1, 1, 1, 1,
-2.069991, -2.037572, -2.135847, 1, 1, 1, 1, 1,
-2.052028, -1.179469, -0.9494389, 1, 1, 1, 1, 1,
-1.9727, -0.05888326, -0.9513774, 1, 1, 1, 1, 1,
-1.954266, 0.3733826, -0.8970119, 1, 1, 1, 1, 1,
-1.920425, 0.9631274, -3.100292, 1, 1, 1, 1, 1,
-1.91694, -0.9779857, -1.01823, 1, 1, 1, 1, 1,
-1.91365, 1.065488, -2.00108, 1, 1, 1, 1, 1,
-1.911698, 0.6662201, -1.821806, 1, 1, 1, 1, 1,
-1.883852, 1.547997, -1.350605, 1, 1, 1, 1, 1,
-1.858563, 1.75136, -1.123614, 1, 1, 1, 1, 1,
-1.843921, -0.3197664, -1.979948, 1, 1, 1, 1, 1,
-1.827264, -1.046644, -0.8556288, 0, 0, 1, 1, 1,
-1.818476, -0.7073096, -1.942387, 1, 0, 0, 1, 1,
-1.816787, 0.5073361, -1.211221, 1, 0, 0, 1, 1,
-1.801308, 1.384661, -2.279529, 1, 0, 0, 1, 1,
-1.800284, -1.248677, -2.889935, 1, 0, 0, 1, 1,
-1.786011, -0.6580872, -2.185865, 1, 0, 0, 1, 1,
-1.783157, 0.5402956, -1.589069, 0, 0, 0, 1, 1,
-1.781667, 0.9048648, -0.9367476, 0, 0, 0, 1, 1,
-1.736025, 0.5648602, -1.094797, 0, 0, 0, 1, 1,
-1.721237, -0.9007953, -0.2513851, 0, 0, 0, 1, 1,
-1.70665, -1.246256, -1.645856, 0, 0, 0, 1, 1,
-1.704982, 0.08827127, 0.008215717, 0, 0, 0, 1, 1,
-1.70167, -2.002642, -2.674059, 0, 0, 0, 1, 1,
-1.638365, 1.865142, -0.3413098, 1, 1, 1, 1, 1,
-1.637876, -0.655468, -0.001602942, 1, 1, 1, 1, 1,
-1.606186, 0.07452528, -0.909649, 1, 1, 1, 1, 1,
-1.603886, -0.1249063, -0.9604382, 1, 1, 1, 1, 1,
-1.600571, 1.348674, -0.5868173, 1, 1, 1, 1, 1,
-1.590188, 1.249624, -0.5218929, 1, 1, 1, 1, 1,
-1.589686, 0.545469, -1.025032, 1, 1, 1, 1, 1,
-1.582055, 0.03363323, -0.005974596, 1, 1, 1, 1, 1,
-1.581516, 0.5447074, -3.776548, 1, 1, 1, 1, 1,
-1.577818, -0.2758594, -1.111489, 1, 1, 1, 1, 1,
-1.567845, -0.4267087, -0.2561215, 1, 1, 1, 1, 1,
-1.558865, 0.8252823, -2.151353, 1, 1, 1, 1, 1,
-1.558247, -0.3228369, -2.952173, 1, 1, 1, 1, 1,
-1.554814, 1.778735, -1.362228, 1, 1, 1, 1, 1,
-1.551817, 1.037537, -3.28979, 1, 1, 1, 1, 1,
-1.551457, -1.281335, -3.456948, 0, 0, 1, 1, 1,
-1.550967, -0.8281055, -4.505122, 1, 0, 0, 1, 1,
-1.523002, -0.75635, -2.622701, 1, 0, 0, 1, 1,
-1.519773, 0.237619, -1.87894, 1, 0, 0, 1, 1,
-1.514607, -1.126859, -2.664873, 1, 0, 0, 1, 1,
-1.50171, -1.691325, -2.747828, 1, 0, 0, 1, 1,
-1.489955, 0.7600315, -0.1964213, 0, 0, 0, 1, 1,
-1.487233, 0.3121372, -2.437376, 0, 0, 0, 1, 1,
-1.486553, -1.393322, -4.014652, 0, 0, 0, 1, 1,
-1.485845, 1.084829, -1.308075, 0, 0, 0, 1, 1,
-1.479314, -1.006574, -2.08842, 0, 0, 0, 1, 1,
-1.476619, 0.07277223, -0.3947766, 0, 0, 0, 1, 1,
-1.475652, -0.6529739, -2.459246, 0, 0, 0, 1, 1,
-1.475138, 0.4693015, -2.212957, 1, 1, 1, 1, 1,
-1.465335, 1.684839, -1.013805, 1, 1, 1, 1, 1,
-1.463742, -1.521844, -2.883936, 1, 1, 1, 1, 1,
-1.446329, -1.809096, -3.98099, 1, 1, 1, 1, 1,
-1.435307, 1.761189, 0.03565496, 1, 1, 1, 1, 1,
-1.435236, 1.308291, -0.02837071, 1, 1, 1, 1, 1,
-1.414199, -0.497369, -1.757445, 1, 1, 1, 1, 1,
-1.410878, 0.3109804, -2.703973, 1, 1, 1, 1, 1,
-1.41078, 0.9611113, -1.472535, 1, 1, 1, 1, 1,
-1.408647, -0.07193495, -1.758985, 1, 1, 1, 1, 1,
-1.385866, 0.5486293, 1.061939, 1, 1, 1, 1, 1,
-1.385527, 0.9779938, 0.1405453, 1, 1, 1, 1, 1,
-1.384126, -0.1465668, -1.576567, 1, 1, 1, 1, 1,
-1.377956, -2.144997, -3.433074, 1, 1, 1, 1, 1,
-1.37571, -1.461136, -0.5139351, 1, 1, 1, 1, 1,
-1.370817, -1.363344, -2.437994, 0, 0, 1, 1, 1,
-1.350118, -1.324734, -1.93857, 1, 0, 0, 1, 1,
-1.344078, 0.004317759, -1.844902, 1, 0, 0, 1, 1,
-1.319162, -0.227329, -0.2378033, 1, 0, 0, 1, 1,
-1.317145, 1.506712, 0.008482157, 1, 0, 0, 1, 1,
-1.286295, 1.54644, -0.8855582, 1, 0, 0, 1, 1,
-1.242902, -0.04541635, -0.8170741, 0, 0, 0, 1, 1,
-1.236088, 0.4172073, -1.390635, 0, 0, 0, 1, 1,
-1.22915, -1.301201, -0.5261443, 0, 0, 0, 1, 1,
-1.223536, -0.4902184, -1.816447, 0, 0, 0, 1, 1,
-1.211649, -1.879304, -2.414162, 0, 0, 0, 1, 1,
-1.205499, -0.8133674, -3.506616, 0, 0, 0, 1, 1,
-1.201514, -0.7402057, -3.662233, 0, 0, 0, 1, 1,
-1.19641, -0.8598192, -0.962335, 1, 1, 1, 1, 1,
-1.195164, 0.8896325, -0.8590216, 1, 1, 1, 1, 1,
-1.186877, 0.3554156, 1.297263, 1, 1, 1, 1, 1,
-1.170149, 1.041926, -0.5322267, 1, 1, 1, 1, 1,
-1.168675, -0.3781441, -1.723399, 1, 1, 1, 1, 1,
-1.157384, -0.08576991, -1.397739, 1, 1, 1, 1, 1,
-1.145969, 0.3410503, 0.8031178, 1, 1, 1, 1, 1,
-1.144538, 0.1185169, -0.8841506, 1, 1, 1, 1, 1,
-1.143854, -0.6777092, -2.946095, 1, 1, 1, 1, 1,
-1.142916, -0.1720034, -2.82671, 1, 1, 1, 1, 1,
-1.141374, -0.867632, -3.969336, 1, 1, 1, 1, 1,
-1.135472, -0.3083525, -0.8691961, 1, 1, 1, 1, 1,
-1.122526, -0.2305056, -1.242728, 1, 1, 1, 1, 1,
-1.119584, 0.07401273, -0.690801, 1, 1, 1, 1, 1,
-1.116264, 0.456296, -2.425479, 1, 1, 1, 1, 1,
-1.114564, 0.2956176, -1.179159, 0, 0, 1, 1, 1,
-1.113742, 0.7905008, -0.4406992, 1, 0, 0, 1, 1,
-1.11017, 0.9738635, -1.549208, 1, 0, 0, 1, 1,
-1.106527, -1.27714, -3.566767, 1, 0, 0, 1, 1,
-1.102452, -2.108227, -3.28765, 1, 0, 0, 1, 1,
-1.101984, 1.797071, -0.6867319, 1, 0, 0, 1, 1,
-1.076035, -0.3725553, -2.539177, 0, 0, 0, 1, 1,
-1.073763, -0.01207568, -1.858566, 0, 0, 0, 1, 1,
-1.068908, -1.781859, -1.595813, 0, 0, 0, 1, 1,
-1.066887, 0.6541982, -1.282376, 0, 0, 0, 1, 1,
-1.064347, 1.470971, -0.7083142, 0, 0, 0, 1, 1,
-1.062276, 1.742787, -1.669991, 0, 0, 0, 1, 1,
-1.060454, 0.1738214, -1.523509, 0, 0, 0, 1, 1,
-1.059461, 1.121626, -0.02408727, 1, 1, 1, 1, 1,
-1.053466, 0.3047417, -1.275626, 1, 1, 1, 1, 1,
-1.050971, 0.6328719, 0.8820732, 1, 1, 1, 1, 1,
-1.042055, -0.2601772, -2.633276, 1, 1, 1, 1, 1,
-1.030772, 0.5366536, -0.4224737, 1, 1, 1, 1, 1,
-1.026253, 0.5198544, -1.474288, 1, 1, 1, 1, 1,
-1.023023, 0.4871565, -1.418106, 1, 1, 1, 1, 1,
-1.022787, -0.143886, -1.949203, 1, 1, 1, 1, 1,
-1.020079, -0.4128047, -1.852139, 1, 1, 1, 1, 1,
-1.019712, 0.3494161, -2.232352, 1, 1, 1, 1, 1,
-1.016211, -0.9545906, -3.476092, 1, 1, 1, 1, 1,
-1.009572, -1.353561, -1.356498, 1, 1, 1, 1, 1,
-1.005712, -0.539727, -2.91493, 1, 1, 1, 1, 1,
-1.002214, -0.378148, -2.194628, 1, 1, 1, 1, 1,
-0.9999874, -0.4389243, -3.081562, 1, 1, 1, 1, 1,
-0.994602, 0.2839732, -0.5844546, 0, 0, 1, 1, 1,
-0.9925224, 0.9603529, -2.199471, 1, 0, 0, 1, 1,
-0.9858682, -1.241899, -2.358215, 1, 0, 0, 1, 1,
-0.9704937, 1.273086, -0.9808206, 1, 0, 0, 1, 1,
-0.959602, 0.1474665, 0.3681505, 1, 0, 0, 1, 1,
-0.9572401, -0.2895797, -2.248139, 1, 0, 0, 1, 1,
-0.9553497, -0.3080609, -1.425608, 0, 0, 0, 1, 1,
-0.9547361, 0.7344894, -1.688316, 0, 0, 0, 1, 1,
-0.9542435, 0.6666729, -1.399965, 0, 0, 0, 1, 1,
-0.9525681, 1.933416, -1.350282, 0, 0, 0, 1, 1,
-0.952527, -0.1046175, -3.447778, 0, 0, 0, 1, 1,
-0.9499432, 0.5829258, -0.8170823, 0, 0, 0, 1, 1,
-0.9482839, -0.7272456, -0.08980955, 0, 0, 0, 1, 1,
-0.9478936, 2.750172, -2.631031, 1, 1, 1, 1, 1,
-0.9352542, -1.442601, -5.136305, 1, 1, 1, 1, 1,
-0.9329551, 0.1717528, 0.6644976, 1, 1, 1, 1, 1,
-0.9315735, 2.156522, -0.3620627, 1, 1, 1, 1, 1,
-0.9277257, 0.269099, -1.30555, 1, 1, 1, 1, 1,
-0.9276864, -0.6127461, -2.740273, 1, 1, 1, 1, 1,
-0.9213836, -0.4309096, -2.097132, 1, 1, 1, 1, 1,
-0.9111893, 0.789136, 0.2557151, 1, 1, 1, 1, 1,
-0.9106598, -0.3420145, -1.922592, 1, 1, 1, 1, 1,
-0.9101143, 1.803582, 0.07905325, 1, 1, 1, 1, 1,
-0.909294, 0.5113026, -0.2721731, 1, 1, 1, 1, 1,
-0.9091463, 1.547573, 0.8181368, 1, 1, 1, 1, 1,
-0.9041913, -2.538586, -3.914754, 1, 1, 1, 1, 1,
-0.9019256, -0.3272877, -1.004722, 1, 1, 1, 1, 1,
-0.8978691, -1.259432, -2.413921, 1, 1, 1, 1, 1,
-0.8977851, 0.01127841, -2.455739, 0, 0, 1, 1, 1,
-0.8971924, -1.017635, -2.136888, 1, 0, 0, 1, 1,
-0.8961855, 0.9681413, -0.3474239, 1, 0, 0, 1, 1,
-0.8953215, 0.6357792, 0.0001670295, 1, 0, 0, 1, 1,
-0.8916904, -2.032185, -3.499601, 1, 0, 0, 1, 1,
-0.8893818, -0.3476361, -3.093507, 1, 0, 0, 1, 1,
-0.8844632, -0.30442, -2.261495, 0, 0, 0, 1, 1,
-0.8801208, 0.8339181, 0.4235043, 0, 0, 0, 1, 1,
-0.8768026, -0.3328711, -2.41479, 0, 0, 0, 1, 1,
-0.8767015, 0.6756106, -1.322353, 0, 0, 0, 1, 1,
-0.8751717, -0.2467449, -1.922412, 0, 0, 0, 1, 1,
-0.8746191, 0.9903283, -0.4383301, 0, 0, 0, 1, 1,
-0.8671722, 1.013141, -0.0422871, 0, 0, 0, 1, 1,
-0.8661732, -0.4199524, -1.479276, 1, 1, 1, 1, 1,
-0.8642218, 0.01202131, -3.179465, 1, 1, 1, 1, 1,
-0.8641499, 1.208006, -0.3217879, 1, 1, 1, 1, 1,
-0.8582208, 1.252791, -1.073258, 1, 1, 1, 1, 1,
-0.8480356, -0.7389616, -1.267532, 1, 1, 1, 1, 1,
-0.8462796, -0.9470169, -2.644057, 1, 1, 1, 1, 1,
-0.8451414, 0.2377558, -0.7215413, 1, 1, 1, 1, 1,
-0.83834, 0.5759153, 0.3497831, 1, 1, 1, 1, 1,
-0.8322007, 0.2590312, -2.419039, 1, 1, 1, 1, 1,
-0.8257025, 0.8477181, -1.758849, 1, 1, 1, 1, 1,
-0.8250656, 0.7137997, -1.941346, 1, 1, 1, 1, 1,
-0.8250179, -1.487167, -1.038136, 1, 1, 1, 1, 1,
-0.8237187, -0.1170024, -0.5168321, 1, 1, 1, 1, 1,
-0.8187804, 0.485459, -0.1350076, 1, 1, 1, 1, 1,
-0.818644, -0.8466731, -2.169719, 1, 1, 1, 1, 1,
-0.8143453, 0.2260974, -0.4163689, 0, 0, 1, 1, 1,
-0.8121231, -0.01953914, -1.926192, 1, 0, 0, 1, 1,
-0.8026727, -0.5761932, -2.606692, 1, 0, 0, 1, 1,
-0.8026394, 0.58298, -1.867426, 1, 0, 0, 1, 1,
-0.7964094, 0.1929775, -1.990694, 1, 0, 0, 1, 1,
-0.7960833, 1.485271, -2.138727, 1, 0, 0, 1, 1,
-0.7954038, 0.6223862, -1.54586, 0, 0, 0, 1, 1,
-0.7922099, 0.2618105, -0.8551156, 0, 0, 0, 1, 1,
-0.7919237, 1.129778, -1.785702, 0, 0, 0, 1, 1,
-0.7876697, -1.009931, -3.606108, 0, 0, 0, 1, 1,
-0.7840001, 1.597968, 1.581443, 0, 0, 0, 1, 1,
-0.7822179, -1.246534, -3.893894, 0, 0, 0, 1, 1,
-0.7813309, 1.049366, -1.428333, 0, 0, 0, 1, 1,
-0.7800909, -0.9144672, -3.33363, 1, 1, 1, 1, 1,
-0.7746547, 1.032354, 0.8360261, 1, 1, 1, 1, 1,
-0.7736387, -0.1707417, -2.607231, 1, 1, 1, 1, 1,
-0.7728369, 0.9310364, -0.6155862, 1, 1, 1, 1, 1,
-0.772415, 0.140743, -0.7334148, 1, 1, 1, 1, 1,
-0.7696857, -0.08905631, -3.958845, 1, 1, 1, 1, 1,
-0.7664478, -0.2734155, -1.522133, 1, 1, 1, 1, 1,
-0.7663906, 0.08765393, -1.678068, 1, 1, 1, 1, 1,
-0.7654254, -1.955822, -3.167945, 1, 1, 1, 1, 1,
-0.7617714, 0.08569787, -1.107876, 1, 1, 1, 1, 1,
-0.7612742, 0.03604531, -2.360866, 1, 1, 1, 1, 1,
-0.7580377, -0.7110149, -2.631742, 1, 1, 1, 1, 1,
-0.7523668, 1.047935, -1.490772, 1, 1, 1, 1, 1,
-0.7520226, 0.4966545, -0.8346417, 1, 1, 1, 1, 1,
-0.7464946, -0.4580587, -1.950562, 1, 1, 1, 1, 1,
-0.7450267, -0.3998639, -2.132682, 0, 0, 1, 1, 1,
-0.7408217, 0.4234404, -2.524537, 1, 0, 0, 1, 1,
-0.7391706, 0.6086866, -0.921106, 1, 0, 0, 1, 1,
-0.7367793, 0.1561535, -0.2875502, 1, 0, 0, 1, 1,
-0.7365569, -0.3541618, -1.296886, 1, 0, 0, 1, 1,
-0.7361291, -0.365743, -1.624308, 1, 0, 0, 1, 1,
-0.7345542, 1.238865, -1.434029, 0, 0, 0, 1, 1,
-0.7321005, -0.9637405, -2.143596, 0, 0, 0, 1, 1,
-0.725187, -1.191102, -1.659326, 0, 0, 0, 1, 1,
-0.7227836, 1.524953, -1.313186, 0, 0, 0, 1, 1,
-0.7127843, -1.079367, -2.146511, 0, 0, 0, 1, 1,
-0.7105212, -0.7564718, -2.425923, 0, 0, 0, 1, 1,
-0.7103205, 0.6897928, -2.535203, 0, 0, 0, 1, 1,
-0.7028838, -0.204482, -1.839251, 1, 1, 1, 1, 1,
-0.7005923, -0.9489502, -3.98752, 1, 1, 1, 1, 1,
-0.6959972, -0.223764, -2.421918, 1, 1, 1, 1, 1,
-0.6948622, 0.2354359, -0.7574236, 1, 1, 1, 1, 1,
-0.6938772, 0.2228718, -2.126881, 1, 1, 1, 1, 1,
-0.6863674, -0.6644019, -3.711667, 1, 1, 1, 1, 1,
-0.6848201, 0.746174, -1.45419, 1, 1, 1, 1, 1,
-0.6831462, 0.1926624, -1.415664, 1, 1, 1, 1, 1,
-0.6807562, 0.09902756, -2.452579, 1, 1, 1, 1, 1,
-0.6760772, 0.2349681, -0.7985087, 1, 1, 1, 1, 1,
-0.6739972, 1.156741, 0.1029427, 1, 1, 1, 1, 1,
-0.6727074, -0.95378, -2.247692, 1, 1, 1, 1, 1,
-0.67138, -0.1212415, -0.3028643, 1, 1, 1, 1, 1,
-0.6608762, 1.051109, 0.3455138, 1, 1, 1, 1, 1,
-0.6596469, 1.417917, 0.4275714, 1, 1, 1, 1, 1,
-0.6539851, -0.5099309, -1.362172, 0, 0, 1, 1, 1,
-0.6534516, 0.3197581, -0.6333765, 1, 0, 0, 1, 1,
-0.6486046, 0.3174134, -2.186058, 1, 0, 0, 1, 1,
-0.6476949, -0.5912948, -4.062922, 1, 0, 0, 1, 1,
-0.6365905, 0.550609, -1.341234, 1, 0, 0, 1, 1,
-0.6333591, 1.680829, 0.8382698, 1, 0, 0, 1, 1,
-0.6317124, -0.275465, -1.946288, 0, 0, 0, 1, 1,
-0.6290554, 1.113069, -1.207589, 0, 0, 0, 1, 1,
-0.6268888, -1.111696, -2.510503, 0, 0, 0, 1, 1,
-0.6128166, 1.045911, -0.3506168, 0, 0, 0, 1, 1,
-0.6049964, 3.017834, 0.2779547, 0, 0, 0, 1, 1,
-0.6047956, 1.775828, -1.573552, 0, 0, 0, 1, 1,
-0.6011711, 1.322535, -2.712999, 0, 0, 0, 1, 1,
-0.6004825, -0.9235936, -1.705361, 1, 1, 1, 1, 1,
-0.5970841, 0.0659047, -1.836753, 1, 1, 1, 1, 1,
-0.5968416, -0.643042, -3.211429, 1, 1, 1, 1, 1,
-0.5926905, -1.311887, -2.397384, 1, 1, 1, 1, 1,
-0.5868873, -0.9908391, -1.409349, 1, 1, 1, 1, 1,
-0.5868515, 0.4642144, -2.950982, 1, 1, 1, 1, 1,
-0.5859127, -0.5148552, -1.407592, 1, 1, 1, 1, 1,
-0.5839302, 0.4522876, -1.590307, 1, 1, 1, 1, 1,
-0.5819359, -0.002104517, -1.571694, 1, 1, 1, 1, 1,
-0.5791295, -0.1465188, -2.478082, 1, 1, 1, 1, 1,
-0.5786678, -0.4497296, -2.003209, 1, 1, 1, 1, 1,
-0.5781416, -2.465391, -1.88859, 1, 1, 1, 1, 1,
-0.5775065, -0.6793937, -3.781644, 1, 1, 1, 1, 1,
-0.5774851, -0.05584078, -0.6480181, 1, 1, 1, 1, 1,
-0.5768837, -0.8538833, -3.173277, 1, 1, 1, 1, 1,
-0.5753402, -1.776026, -3.675549, 0, 0, 1, 1, 1,
-0.5750694, -2.774587, -2.849489, 1, 0, 0, 1, 1,
-0.5748885, 1.321832, -0.4652155, 1, 0, 0, 1, 1,
-0.5711244, 0.331422, -0.1559899, 1, 0, 0, 1, 1,
-0.57111, 0.6195791, -0.9674037, 1, 0, 0, 1, 1,
-0.5681527, -0.506604, -2.338579, 1, 0, 0, 1, 1,
-0.5665765, -0.5959899, -0.5082037, 0, 0, 0, 1, 1,
-0.5619963, -0.1669284, -2.863781, 0, 0, 0, 1, 1,
-0.5585031, -0.9590244, -2.508886, 0, 0, 0, 1, 1,
-0.5522076, 0.2932849, -1.74606, 0, 0, 0, 1, 1,
-0.5464876, -0.1815899, -2.525723, 0, 0, 0, 1, 1,
-0.5446994, 0.4818987, -1.79085, 0, 0, 0, 1, 1,
-0.5445012, -0.08955653, -1.18759, 0, 0, 0, 1, 1,
-0.5405381, 0.6590304, 0.8723758, 1, 1, 1, 1, 1,
-0.5403349, 0.1275969, -2.243696, 1, 1, 1, 1, 1,
-0.5341274, -0.3709289, -3.548733, 1, 1, 1, 1, 1,
-0.5318342, 0.3087639, 0.144851, 1, 1, 1, 1, 1,
-0.5308731, -0.4214135, -0.7635255, 1, 1, 1, 1, 1,
-0.5289927, -0.9628513, -2.084083, 1, 1, 1, 1, 1,
-0.5271975, -0.4981508, -0.7936296, 1, 1, 1, 1, 1,
-0.5255216, -0.04648563, -2.177143, 1, 1, 1, 1, 1,
-0.5193616, -1.048516, -2.789517, 1, 1, 1, 1, 1,
-0.5123813, -0.1798366, -2.487151, 1, 1, 1, 1, 1,
-0.5106478, -0.1859271, -1.091772, 1, 1, 1, 1, 1,
-0.5103788, 0.02200749, -1.502601, 1, 1, 1, 1, 1,
-0.5098557, -0.5466893, -1.197836, 1, 1, 1, 1, 1,
-0.5094671, 1.033536, 0.47746, 1, 1, 1, 1, 1,
-0.5074875, 0.186171, -1.439425, 1, 1, 1, 1, 1,
-0.5030544, 1.201448, 0.8599094, 0, 0, 1, 1, 1,
-0.4956097, 0.919228, -0.1322366, 1, 0, 0, 1, 1,
-0.4872312, 0.08728755, -1.799263, 1, 0, 0, 1, 1,
-0.4855202, -0.2093042, -2.098809, 1, 0, 0, 1, 1,
-0.4839535, 0.3668427, -1.105942, 1, 0, 0, 1, 1,
-0.4798583, 1.457407, 0.3128007, 1, 0, 0, 1, 1,
-0.479051, -2.226036, -4.274098, 0, 0, 0, 1, 1,
-0.4744591, -0.6881789, -3.877031, 0, 0, 0, 1, 1,
-0.4734817, -0.3619522, -0.9083441, 0, 0, 0, 1, 1,
-0.4681303, 0.2396137, -0.3622992, 0, 0, 0, 1, 1,
-0.467946, 1.304581, 0.6810265, 0, 0, 0, 1, 1,
-0.4676558, 0.4823838, -1.009567, 0, 0, 0, 1, 1,
-0.467041, -0.7735406, -3.113689, 0, 0, 0, 1, 1,
-0.4668881, -0.8463566, -2.202756, 1, 1, 1, 1, 1,
-0.4644619, 1.421206, -0.6991642, 1, 1, 1, 1, 1,
-0.4609244, 0.3774987, -1.573447, 1, 1, 1, 1, 1,
-0.4604096, -0.4859346, -2.723546, 1, 1, 1, 1, 1,
-0.4590326, 0.5039822, -2.007797, 1, 1, 1, 1, 1,
-0.4577928, 0.3753398, 1.11053, 1, 1, 1, 1, 1,
-0.4517418, -0.7947118, -2.400221, 1, 1, 1, 1, 1,
-0.4489684, -1.687745, -1.014527, 1, 1, 1, 1, 1,
-0.4467634, 0.9297174, -1.684572, 1, 1, 1, 1, 1,
-0.4442655, -0.3623224, -1.947613, 1, 1, 1, 1, 1,
-0.4429344, 1.110663, -1.597242, 1, 1, 1, 1, 1,
-0.4419059, -3.120884, -3.192353, 1, 1, 1, 1, 1,
-0.4405948, -0.1175914, -1.599795, 1, 1, 1, 1, 1,
-0.4391294, 0.8229643, -1.588128, 1, 1, 1, 1, 1,
-0.4377038, -0.230702, -1.263787, 1, 1, 1, 1, 1,
-0.4371482, 1.174986, -1.289476, 0, 0, 1, 1, 1,
-0.4369293, -0.06460591, 0.03987912, 1, 0, 0, 1, 1,
-0.4353853, 0.446479, -0.8141304, 1, 0, 0, 1, 1,
-0.4352106, -0.4639293, -1.200639, 1, 0, 0, 1, 1,
-0.4329134, -1.174377, -1.453021, 1, 0, 0, 1, 1,
-0.4287553, 0.7851353, -0.2417127, 1, 0, 0, 1, 1,
-0.4259222, -0.5749148, -2.412633, 0, 0, 0, 1, 1,
-0.4249522, 0.4267593, -1.172614, 0, 0, 0, 1, 1,
-0.4194524, 0.8882715, 2.182877, 0, 0, 0, 1, 1,
-0.416027, 0.1829899, -0.07992779, 0, 0, 0, 1, 1,
-0.4156397, -3.278216, -1.442643, 0, 0, 0, 1, 1,
-0.4120115, 0.1588871, -2.628916, 0, 0, 0, 1, 1,
-0.4110781, -0.6841694, -4.449593, 0, 0, 0, 1, 1,
-0.4106064, -1.830562, -4.180248, 1, 1, 1, 1, 1,
-0.4076, -0.3492039, -2.529352, 1, 1, 1, 1, 1,
-0.4070296, -0.4160126, -1.744273, 1, 1, 1, 1, 1,
-0.3943174, 0.7913738, -1.754899, 1, 1, 1, 1, 1,
-0.3941123, 1.729012, 0.4618589, 1, 1, 1, 1, 1,
-0.392225, -0.1682161, -2.109553, 1, 1, 1, 1, 1,
-0.3912053, 1.074629, -2.15825, 1, 1, 1, 1, 1,
-0.3856836, -0.2538505, -1.739798, 1, 1, 1, 1, 1,
-0.3832429, 0.4831691, -0.9631359, 1, 1, 1, 1, 1,
-0.3832044, -0.1987264, -1.594257, 1, 1, 1, 1, 1,
-0.3798599, -0.3355979, -2.326957, 1, 1, 1, 1, 1,
-0.3751524, 1.946211, -0.8506951, 1, 1, 1, 1, 1,
-0.3723978, -1.352868, -1.50242, 1, 1, 1, 1, 1,
-0.3705873, 1.810459, -0.5820184, 1, 1, 1, 1, 1,
-0.3621583, -1.64821, -3.232655, 1, 1, 1, 1, 1,
-0.3615793, -0.0671099, -3.256682, 0, 0, 1, 1, 1,
-0.3584101, -0.9784701, -2.335298, 1, 0, 0, 1, 1,
-0.3571972, 0.4572783, 1.380947, 1, 0, 0, 1, 1,
-0.3564691, 0.4974303, -0.4698386, 1, 0, 0, 1, 1,
-0.3549541, 1.591758, 0.7861302, 1, 0, 0, 1, 1,
-0.3536619, 0.6836755, 0.5533561, 1, 0, 0, 1, 1,
-0.3505301, -0.1967034, -1.466708, 0, 0, 0, 1, 1,
-0.3436297, 0.56753, -2.544112, 0, 0, 0, 1, 1,
-0.3361985, 0.8195386, 0.2251816, 0, 0, 0, 1, 1,
-0.3357948, 0.2373026, -0.08031118, 0, 0, 0, 1, 1,
-0.3343866, -0.2942447, -3.936408, 0, 0, 0, 1, 1,
-0.3305886, -0.2392053, -2.147994, 0, 0, 0, 1, 1,
-0.3264993, 0.6939992, -2.19193, 0, 0, 0, 1, 1,
-0.3243032, 0.5769641, -0.8712599, 1, 1, 1, 1, 1,
-0.3224817, -0.9047807, -3.443785, 1, 1, 1, 1, 1,
-0.3192064, 0.0283339, -1.163646, 1, 1, 1, 1, 1,
-0.3138224, -1.125857, -3.132408, 1, 1, 1, 1, 1,
-0.3118822, -0.2711383, -3.310937, 1, 1, 1, 1, 1,
-0.3080545, -0.586555, -2.735175, 1, 1, 1, 1, 1,
-0.3062995, -0.2815014, -2.162567, 1, 1, 1, 1, 1,
-0.3057422, 0.03155236, -0.01347054, 1, 1, 1, 1, 1,
-0.3013176, 0.3618379, -1.686695, 1, 1, 1, 1, 1,
-0.3005156, 0.855664, -0.6740925, 1, 1, 1, 1, 1,
-0.2978728, -0.6576336, -4.144281, 1, 1, 1, 1, 1,
-0.2962076, 1.035657, 0.3514529, 1, 1, 1, 1, 1,
-0.2925435, 1.011142, 0.9460561, 1, 1, 1, 1, 1,
-0.2902528, -1.091534, -2.937771, 1, 1, 1, 1, 1,
-0.2867739, -0.1606297, -2.519002, 1, 1, 1, 1, 1,
-0.2861746, -1.406929, -3.819823, 0, 0, 1, 1, 1,
-0.2845743, -2.129508, -1.710018, 1, 0, 0, 1, 1,
-0.2796011, -1.51283, -2.502823, 1, 0, 0, 1, 1,
-0.278477, -1.190323, -3.231828, 1, 0, 0, 1, 1,
-0.2758416, -0.5739399, -4.01739, 1, 0, 0, 1, 1,
-0.2661246, -2.289586, -2.597615, 1, 0, 0, 1, 1,
-0.2615569, 0.9051458, -1.610362, 0, 0, 0, 1, 1,
-0.2580692, 0.1802688, -0.7441112, 0, 0, 0, 1, 1,
-0.2569788, 0.9243953, -1.016214, 0, 0, 0, 1, 1,
-0.2563704, -0.7075388, -0.7439474, 0, 0, 0, 1, 1,
-0.256086, 0.1471408, -0.325184, 0, 0, 0, 1, 1,
-0.2558871, 2.235227, -3.173941, 0, 0, 0, 1, 1,
-0.2556026, -0.07450496, -2.365926, 0, 0, 0, 1, 1,
-0.2552789, -0.3603616, -2.361266, 1, 1, 1, 1, 1,
-0.2537999, -0.0320729, -2.554576, 1, 1, 1, 1, 1,
-0.2472572, -0.3561581, -1.598945, 1, 1, 1, 1, 1,
-0.2446802, -1.073897, -3.886038, 1, 1, 1, 1, 1,
-0.2442127, 0.8529398, -2.469496, 1, 1, 1, 1, 1,
-0.2434517, 0.9538346, 1.223548, 1, 1, 1, 1, 1,
-0.2426673, -0.7491075, -3.672205, 1, 1, 1, 1, 1,
-0.2422744, -1.188735, -3.038902, 1, 1, 1, 1, 1,
-0.2419684, 0.9996011, -0.6041331, 1, 1, 1, 1, 1,
-0.2397276, -1.449888, -1.58617, 1, 1, 1, 1, 1,
-0.2359621, -0.6757302, -3.022101, 1, 1, 1, 1, 1,
-0.2357757, 0.7338057, -0.1459004, 1, 1, 1, 1, 1,
-0.2342589, -2.327937, -1.463726, 1, 1, 1, 1, 1,
-0.2314469, -0.4396372, -0.6824008, 1, 1, 1, 1, 1,
-0.2276541, -0.03530314, -2.774693, 1, 1, 1, 1, 1,
-0.2133272, 0.7051775, -0.3595031, 0, 0, 1, 1, 1,
-0.2102461, 0.9464552, 1.104944, 1, 0, 0, 1, 1,
-0.207679, -0.5235516, -2.618641, 1, 0, 0, 1, 1,
-0.2011162, 0.05734722, -1.873837, 1, 0, 0, 1, 1,
-0.197457, -0.7080162, -2.671615, 1, 0, 0, 1, 1,
-0.1935416, 1.744746, 0.4600623, 1, 0, 0, 1, 1,
-0.1887967, -0.1754966, -3.00711, 0, 0, 0, 1, 1,
-0.1873996, -0.05926154, -1.040215, 0, 0, 0, 1, 1,
-0.1796692, 1.038542, 0.1106706, 0, 0, 0, 1, 1,
-0.1793126, 0.2247836, -1.257545, 0, 0, 0, 1, 1,
-0.1786445, -1.533721, -2.426601, 0, 0, 0, 1, 1,
-0.1763624, 0.4123199, -2.750869, 0, 0, 0, 1, 1,
-0.1708866, 0.6121095, -1.815838, 0, 0, 0, 1, 1,
-0.1700838, 0.8772255, -0.9637958, 1, 1, 1, 1, 1,
-0.169589, 0.20853, -1.090305, 1, 1, 1, 1, 1,
-0.1680717, -0.04201692, -3.456964, 1, 1, 1, 1, 1,
-0.163362, 0.745939, 0.3711703, 1, 1, 1, 1, 1,
-0.1618178, -1.147013, -4.306589, 1, 1, 1, 1, 1,
-0.1610439, 0.8038638, -0.1858159, 1, 1, 1, 1, 1,
-0.1570041, 0.6342002, 1.267307, 1, 1, 1, 1, 1,
-0.1560527, -1.82964, -2.003441, 1, 1, 1, 1, 1,
-0.1557515, -1.583881, -3.622265, 1, 1, 1, 1, 1,
-0.1554664, -1.59049, -3.037232, 1, 1, 1, 1, 1,
-0.153849, -1.641371, -1.931992, 1, 1, 1, 1, 1,
-0.1536132, -1.211767, -3.102488, 1, 1, 1, 1, 1,
-0.1534573, 0.728604, -0.64703, 1, 1, 1, 1, 1,
-0.1439737, -1.200193, -2.454749, 1, 1, 1, 1, 1,
-0.1420136, -0.2189064, -2.45082, 1, 1, 1, 1, 1,
-0.136833, 0.4068063, -1.288608, 0, 0, 1, 1, 1,
-0.1340034, 0.08260337, -0.9577447, 1, 0, 0, 1, 1,
-0.1329572, 0.9387201, -1.414202, 1, 0, 0, 1, 1,
-0.1326981, 0.4894798, 1.375715, 1, 0, 0, 1, 1,
-0.1318123, -0.5964149, -4.1019, 1, 0, 0, 1, 1,
-0.1310291, -0.862285, -3.328791, 1, 0, 0, 1, 1,
-0.1296573, 1.070979, -3.570469, 0, 0, 0, 1, 1,
-0.1293007, 0.5119656, 0.2847899, 0, 0, 0, 1, 1,
-0.1231706, -1.106743, -1.115774, 0, 0, 0, 1, 1,
-0.1184183, -0.2143085, -2.520216, 0, 0, 0, 1, 1,
-0.1171313, -0.02781848, -0.2569853, 0, 0, 0, 1, 1,
-0.1157455, -0.6188483, -2.57462, 0, 0, 0, 1, 1,
-0.113996, 1.673341, -1.926191, 0, 0, 0, 1, 1,
-0.1086201, -0.1867489, -0.8228738, 1, 1, 1, 1, 1,
-0.1044452, 0.6827741, -1.517109, 1, 1, 1, 1, 1,
-0.0982097, -0.5533776, -1.588694, 1, 1, 1, 1, 1,
-0.09431911, 0.002511801, -0.7132695, 1, 1, 1, 1, 1,
-0.09331729, 2.557747, -0.4765068, 1, 1, 1, 1, 1,
-0.08904474, -1.216771, -4.227969, 1, 1, 1, 1, 1,
-0.08694206, -0.2563339, -3.095407, 1, 1, 1, 1, 1,
-0.0813897, 1.226748, -0.5132883, 1, 1, 1, 1, 1,
-0.07973178, 0.8493561, -0.05825385, 1, 1, 1, 1, 1,
-0.07064725, 0.812276, 0.2945351, 1, 1, 1, 1, 1,
-0.06922523, 2.234843, 0.004685332, 1, 1, 1, 1, 1,
-0.06877418, 0.0873826, -0.1820936, 1, 1, 1, 1, 1,
-0.06487335, 0.7987167, 0.9500324, 1, 1, 1, 1, 1,
-0.05709656, -1.400353, -2.505519, 1, 1, 1, 1, 1,
-0.0548042, -0.414692, -4.249463, 1, 1, 1, 1, 1,
-0.05313565, -1.783494, -1.703704, 0, 0, 1, 1, 1,
-0.05073383, 0.9969049, 1.460229, 1, 0, 0, 1, 1,
-0.04855288, 0.3355804, 0.3544211, 1, 0, 0, 1, 1,
-0.04316191, 0.09214067, -0.9373975, 1, 0, 0, 1, 1,
-0.04185887, 0.8524677, -0.8856669, 1, 0, 0, 1, 1,
-0.04000018, 1.628865, 0.5201425, 1, 0, 0, 1, 1,
-0.03848677, 0.1650943, 0.2338492, 0, 0, 0, 1, 1,
-0.03645607, -0.9375397, -3.433915, 0, 0, 0, 1, 1,
-0.03613248, 0.2032741, -0.6920875, 0, 0, 0, 1, 1,
-0.03369018, -1.839729, -3.124462, 0, 0, 0, 1, 1,
-0.03275882, 1.101125, -0.8060611, 0, 0, 0, 1, 1,
-0.03073811, 1.04029, -1.276828, 0, 0, 0, 1, 1,
-0.02827195, 0.7824797, -1.041781, 0, 0, 0, 1, 1,
-0.028053, -1.055489, -2.402156, 1, 1, 1, 1, 1,
-0.02256241, 0.2083439, -1.650775, 1, 1, 1, 1, 1,
-0.02027237, -1.636902, -2.741444, 1, 1, 1, 1, 1,
-0.01861753, -0.5251656, -3.182398, 1, 1, 1, 1, 1,
-0.01835082, 0.4761951, 0.005433274, 1, 1, 1, 1, 1,
-0.01753442, 0.5267893, -1.581045, 1, 1, 1, 1, 1,
-0.0174628, 1.087718, -0.1906276, 1, 1, 1, 1, 1,
-0.01462023, -0.8309667, -2.538627, 1, 1, 1, 1, 1,
-0.006176075, -0.1846279, -2.288816, 1, 1, 1, 1, 1,
-0.00492696, -1.795897, -2.836563, 1, 1, 1, 1, 1,
-0.002294038, -0.3853766, -1.338537, 1, 1, 1, 1, 1,
0.006154458, 0.8444753, 0.4116868, 1, 1, 1, 1, 1,
0.009697757, -0.8035613, 2.124102, 1, 1, 1, 1, 1,
0.01257979, 1.782698, -0.3924737, 1, 1, 1, 1, 1,
0.0137033, 0.2308753, 1.521643, 1, 1, 1, 1, 1,
0.01446717, -0.3974802, 3.660846, 0, 0, 1, 1, 1,
0.01496197, 1.380538, 1.225305, 1, 0, 0, 1, 1,
0.01550766, -1.311279, 4.766829, 1, 0, 0, 1, 1,
0.01707044, 0.4323913, 0.4171099, 1, 0, 0, 1, 1,
0.02538976, -0.2999676, 5.142804, 1, 0, 0, 1, 1,
0.0327956, 1.585648, -2.220806, 1, 0, 0, 1, 1,
0.03284447, 0.7327054, 0.4595007, 0, 0, 0, 1, 1,
0.03452178, -0.3474746, 2.164204, 0, 0, 0, 1, 1,
0.03481936, 1.065114, 1.747996, 0, 0, 0, 1, 1,
0.03574788, -1.513538, 1.83946, 0, 0, 0, 1, 1,
0.03615751, -2.02347, 2.138813, 0, 0, 0, 1, 1,
0.03847294, 1.723692, 0.9019712, 0, 0, 0, 1, 1,
0.04161222, -0.8302375, 4.017036, 0, 0, 0, 1, 1,
0.04166728, -1.051148, 3.692698, 1, 1, 1, 1, 1,
0.04240192, -0.922162, 4.027842, 1, 1, 1, 1, 1,
0.04319459, -0.4593513, 3.670192, 1, 1, 1, 1, 1,
0.04388538, 0.2683485, 0.2773156, 1, 1, 1, 1, 1,
0.04544127, 0.8522339, 0.2268532, 1, 1, 1, 1, 1,
0.04634718, 1.802431, -0.9343411, 1, 1, 1, 1, 1,
0.05260217, 0.05034073, 2.825875, 1, 1, 1, 1, 1,
0.05654733, 0.7288302, -0.8720677, 1, 1, 1, 1, 1,
0.06921173, 1.265829, -0.9800537, 1, 1, 1, 1, 1,
0.07011106, 0.2843449, -0.907586, 1, 1, 1, 1, 1,
0.07054213, -0.3961895, 3.84445, 1, 1, 1, 1, 1,
0.07130405, -0.643589, 1.37463, 1, 1, 1, 1, 1,
0.07598195, 1.125657, -0.7817477, 1, 1, 1, 1, 1,
0.07737084, -1.322935, 6.060075, 1, 1, 1, 1, 1,
0.07751855, 1.424276, 1.161247, 1, 1, 1, 1, 1,
0.07803089, -0.7545676, 2.930812, 0, 0, 1, 1, 1,
0.08522113, 0.6794696, 0.1089781, 1, 0, 0, 1, 1,
0.08977204, 0.7216998, 0.8374912, 1, 0, 0, 1, 1,
0.0945227, -0.7907732, 2.17358, 1, 0, 0, 1, 1,
0.09590315, 0.2882009, 0.5216391, 1, 0, 0, 1, 1,
0.09949028, -0.2885233, 2.987339, 1, 0, 0, 1, 1,
0.1006258, -0.05289423, 4.001818, 0, 0, 0, 1, 1,
0.1006968, 1.850752, 0.4167498, 0, 0, 0, 1, 1,
0.1010149, -0.9953954, 1.41663, 0, 0, 0, 1, 1,
0.1036181, -0.01966766, 1.239654, 0, 0, 0, 1, 1,
0.1048464, 0.4877816, 0.1529507, 0, 0, 0, 1, 1,
0.1049365, 1.158774, 0.6593621, 0, 0, 0, 1, 1,
0.1052967, 0.7164218, -0.2639603, 0, 0, 0, 1, 1,
0.107398, 0.6334904, -1.540951, 1, 1, 1, 1, 1,
0.1090275, -1.721903, 3.344856, 1, 1, 1, 1, 1,
0.1098952, 0.7320624, -0.3092186, 1, 1, 1, 1, 1,
0.1105257, 0.6484007, -2.661042, 1, 1, 1, 1, 1,
0.112913, -0.1987983, 3.8595, 1, 1, 1, 1, 1,
0.1287427, -1.680488, 4.265834, 1, 1, 1, 1, 1,
0.1313344, -0.2958008, 3.643922, 1, 1, 1, 1, 1,
0.131384, 0.5406023, -0.07246368, 1, 1, 1, 1, 1,
0.1319579, -0.8388602, 5.154742, 1, 1, 1, 1, 1,
0.1429402, 0.5678356, 1.079728, 1, 1, 1, 1, 1,
0.1441312, -0.484468, 2.763758, 1, 1, 1, 1, 1,
0.1459723, 0.1746577, -0.4859171, 1, 1, 1, 1, 1,
0.1465661, -2.686393, 3.55071, 1, 1, 1, 1, 1,
0.1495404, -1.177812, 2.634131, 1, 1, 1, 1, 1,
0.1551071, 1.51376, 0.9191931, 1, 1, 1, 1, 1,
0.1584081, 3.955351, 0.13633, 0, 0, 1, 1, 1,
0.1596879, 0.3640452, 0.5781776, 1, 0, 0, 1, 1,
0.1630416, 0.2489777, -0.4603726, 1, 0, 0, 1, 1,
0.1631859, -0.04821549, 0.9872066, 1, 0, 0, 1, 1,
0.164475, -1.281513, 1.917288, 1, 0, 0, 1, 1,
0.1661277, -0.8167116, 2.576028, 1, 0, 0, 1, 1,
0.1699739, -0.06350867, 2.082347, 0, 0, 0, 1, 1,
0.170593, 1.006956, -1.008895, 0, 0, 0, 1, 1,
0.1721698, -0.4500604, 2.692263, 0, 0, 0, 1, 1,
0.174092, -0.4848339, 3.37446, 0, 0, 0, 1, 1,
0.1755162, -0.4125896, 4.33147, 0, 0, 0, 1, 1,
0.1845854, -0.1220995, 2.828096, 0, 0, 0, 1, 1,
0.1866857, 2.050906, -0.09614579, 0, 0, 0, 1, 1,
0.1903759, -1.882767, 1.415814, 1, 1, 1, 1, 1,
0.1903836, 1.261703, 0.3222341, 1, 1, 1, 1, 1,
0.1945928, 0.3733767, 1.364219, 1, 1, 1, 1, 1,
0.1964027, -0.9126266, 2.21155, 1, 1, 1, 1, 1,
0.1966181, -0.7266037, 4.598711, 1, 1, 1, 1, 1,
0.1978177, 0.499604, 1.416066, 1, 1, 1, 1, 1,
0.2008926, 1.391564, 0.8205973, 1, 1, 1, 1, 1,
0.2021376, -0.7658865, 1.759078, 1, 1, 1, 1, 1,
0.2034913, -0.07172148, 4.163452, 1, 1, 1, 1, 1,
0.2121219, 0.1428287, -0.04997189, 1, 1, 1, 1, 1,
0.212697, 1.493431, 0.126403, 1, 1, 1, 1, 1,
0.2144744, -0.7692537, -0.491824, 1, 1, 1, 1, 1,
0.2161895, 1.877985, 0.008115795, 1, 1, 1, 1, 1,
0.2177375, 0.5786309, -0.1106751, 1, 1, 1, 1, 1,
0.2201361, 0.2399985, -0.3151074, 1, 1, 1, 1, 1,
0.220594, 0.2103222, 0.657613, 0, 0, 1, 1, 1,
0.2239504, -0.3879437, 3.583993, 1, 0, 0, 1, 1,
0.2302172, 0.6141012, 0.9322713, 1, 0, 0, 1, 1,
0.2341785, 0.0316563, 2.235305, 1, 0, 0, 1, 1,
0.2379164, 0.7140006, 1.575891, 1, 0, 0, 1, 1,
0.2431426, 1.238882, -0.1667542, 1, 0, 0, 1, 1,
0.2472914, -0.1691591, 2.67168, 0, 0, 0, 1, 1,
0.247688, -0.5099957, 1.910848, 0, 0, 0, 1, 1,
0.249339, -0.4790564, 3.975423, 0, 0, 0, 1, 1,
0.2506543, 0.6608836, 0.4841214, 0, 0, 0, 1, 1,
0.254382, -0.1846638, 1.650845, 0, 0, 0, 1, 1,
0.2563714, 0.1138935, 1.424711, 0, 0, 0, 1, 1,
0.2564675, -1.095399, 3.84794, 0, 0, 0, 1, 1,
0.2594118, 0.3329874, -0.05665297, 1, 1, 1, 1, 1,
0.2667329, -0.06907618, 0.9950565, 1, 1, 1, 1, 1,
0.2673734, -0.3123023, 3.398746, 1, 1, 1, 1, 1,
0.2713631, -0.1284127, 1.700457, 1, 1, 1, 1, 1,
0.275127, -0.3105361, 0.01706667, 1, 1, 1, 1, 1,
0.2766455, 0.2714689, 0.88108, 1, 1, 1, 1, 1,
0.2792623, 0.2708332, -0.3743025, 1, 1, 1, 1, 1,
0.2797546, -0.7923387, 3.191088, 1, 1, 1, 1, 1,
0.2806998, -1.018248, 4.108935, 1, 1, 1, 1, 1,
0.2812688, 0.8744432, -0.4391219, 1, 1, 1, 1, 1,
0.2814041, 0.7535961, 1.068049, 1, 1, 1, 1, 1,
0.2843906, -0.03892146, 1.863722, 1, 1, 1, 1, 1,
0.2871537, -1.175033, 2.622472, 1, 1, 1, 1, 1,
0.2886504, 0.1799513, 1.880904, 1, 1, 1, 1, 1,
0.2917708, -0.8550333, 2.690809, 1, 1, 1, 1, 1,
0.2950146, -0.4458331, 2.344447, 0, 0, 1, 1, 1,
0.2952819, -0.8731357, 3.274981, 1, 0, 0, 1, 1,
0.2954785, 0.2703555, 1.715023, 1, 0, 0, 1, 1,
0.2955763, -0.7788548, 1.81787, 1, 0, 0, 1, 1,
0.2999157, -1.189528, 4.276897, 1, 0, 0, 1, 1,
0.3005623, -0.3618266, 1.69187, 1, 0, 0, 1, 1,
0.3026625, -0.5110259, 2.322501, 0, 0, 0, 1, 1,
0.3078173, 1.828017, 0.5968447, 0, 0, 0, 1, 1,
0.3086416, 2.172395, 0.5334508, 0, 0, 0, 1, 1,
0.3141415, -1.361783, 1.409019, 0, 0, 0, 1, 1,
0.3151559, -0.1508401, 1.034563, 0, 0, 0, 1, 1,
0.3187321, -1.272632, 2.002408, 0, 0, 0, 1, 1,
0.3213639, -1.492205, 3.502613, 0, 0, 0, 1, 1,
0.3241941, 0.8819261, -0.6387053, 1, 1, 1, 1, 1,
0.330711, -0.5548059, 3.088921, 1, 1, 1, 1, 1,
0.3325709, -0.07925837, 1.035732, 1, 1, 1, 1, 1,
0.3346583, -0.4693128, 0.888028, 1, 1, 1, 1, 1,
0.3372535, 0.1448067, 0.2387039, 1, 1, 1, 1, 1,
0.3384943, -0.3735441, 2.557115, 1, 1, 1, 1, 1,
0.339578, -0.1189764, 3.883543, 1, 1, 1, 1, 1,
0.3401119, -0.2469317, 1.093633, 1, 1, 1, 1, 1,
0.3424104, -1.335472, 3.707552, 1, 1, 1, 1, 1,
0.3436063, 0.6994192, 1.128593, 1, 1, 1, 1, 1,
0.3453111, -1.646411, 2.607205, 1, 1, 1, 1, 1,
0.3475849, -0.188107, 1.290647, 1, 1, 1, 1, 1,
0.3532835, -1.411692, 1.539198, 1, 1, 1, 1, 1,
0.3546367, 2.259448, 0.8168359, 1, 1, 1, 1, 1,
0.3581706, -0.2747321, 2.062021, 1, 1, 1, 1, 1,
0.3637097, 0.5522367, 0.3400277, 0, 0, 1, 1, 1,
0.366218, 0.1021052, 1.807533, 1, 0, 0, 1, 1,
0.3708376, -2.887336, 3.794867, 1, 0, 0, 1, 1,
0.3731686, 0.6081421, -0.3119727, 1, 0, 0, 1, 1,
0.3742479, -1.95304, 4.083467, 1, 0, 0, 1, 1,
0.3747863, -0.7410266, 2.349073, 1, 0, 0, 1, 1,
0.3791917, 0.08100891, 2.683046, 0, 0, 0, 1, 1,
0.3799684, -0.1760758, 2.511846, 0, 0, 0, 1, 1,
0.3852161, 1.366772, -0.3313644, 0, 0, 0, 1, 1,
0.3884026, -0.2285174, 0.9694548, 0, 0, 0, 1, 1,
0.3898126, 1.797387, -0.5191069, 0, 0, 0, 1, 1,
0.3967697, 0.4366509, 1.387641, 0, 0, 0, 1, 1,
0.3970856, 1.811088, -0.2883541, 0, 0, 0, 1, 1,
0.3997734, -0.3480942, 2.014282, 1, 1, 1, 1, 1,
0.4028028, -0.3525632, 2.487183, 1, 1, 1, 1, 1,
0.4028165, -0.1288935, 2.425339, 1, 1, 1, 1, 1,
0.4044577, -1.115669, 3.215059, 1, 1, 1, 1, 1,
0.407834, -1.079631, 2.68685, 1, 1, 1, 1, 1,
0.4082185, -0.9056134, 2.203917, 1, 1, 1, 1, 1,
0.4087542, 0.4299068, -0.3149601, 1, 1, 1, 1, 1,
0.409434, 0.9446215, -1.138698, 1, 1, 1, 1, 1,
0.4100541, -0.2537159, 0.1122151, 1, 1, 1, 1, 1,
0.4127106, 1.600362, 1.310776, 1, 1, 1, 1, 1,
0.4171881, -0.4784134, 3.176321, 1, 1, 1, 1, 1,
0.4185392, 0.1214904, 0.2673257, 1, 1, 1, 1, 1,
0.4209633, -0.1613641, 2.424191, 1, 1, 1, 1, 1,
0.4244276, 0.5040552, 0.6438274, 1, 1, 1, 1, 1,
0.4250824, 2.110515, 0.3550146, 1, 1, 1, 1, 1,
0.425734, 0.2112193, 0.4577161, 0, 0, 1, 1, 1,
0.4275289, 1.158765, -0.2929959, 1, 0, 0, 1, 1,
0.4298733, 1.343595, 1.02595, 1, 0, 0, 1, 1,
0.4302407, 0.965628, -0.336017, 1, 0, 0, 1, 1,
0.4317029, 0.06448531, 0.9755479, 1, 0, 0, 1, 1,
0.4336422, -0.7684096, 4.216019, 1, 0, 0, 1, 1,
0.435796, 2.358727, -1.24675, 0, 0, 0, 1, 1,
0.4369281, -1.994832, 3.68839, 0, 0, 0, 1, 1,
0.4397756, 0.2085111, -0.01562555, 0, 0, 0, 1, 1,
0.4462768, 0.9226788, -0.3977418, 0, 0, 0, 1, 1,
0.4464991, -0.9913284, 3.366557, 0, 0, 0, 1, 1,
0.4482025, 1.259076, 0.5500041, 0, 0, 0, 1, 1,
0.450709, -1.46047, 2.508285, 0, 0, 0, 1, 1,
0.4580513, 0.4767255, -0.2683014, 1, 1, 1, 1, 1,
0.4610938, -1.37612, 3.19589, 1, 1, 1, 1, 1,
0.4637178, 1.162688, 0.1992313, 1, 1, 1, 1, 1,
0.4682239, 0.9716377, 0.662515, 1, 1, 1, 1, 1,
0.479443, 0.5658495, 0.8875579, 1, 1, 1, 1, 1,
0.4846515, 2.059847, -0.3467152, 1, 1, 1, 1, 1,
0.4849076, 0.6497483, 0.6230108, 1, 1, 1, 1, 1,
0.4881101, 0.381418, 1.41191, 1, 1, 1, 1, 1,
0.4930376, -0.1810527, 2.503206, 1, 1, 1, 1, 1,
0.4940752, 0.8820294, 0.97775, 1, 1, 1, 1, 1,
0.4961493, 1.98858, -0.1034021, 1, 1, 1, 1, 1,
0.496897, 0.1366297, 1.518077, 1, 1, 1, 1, 1,
0.500977, 0.3682582, 2.609239, 1, 1, 1, 1, 1,
0.5011207, -0.2360452, 2.893772, 1, 1, 1, 1, 1,
0.5053186, -1.198752, 1.526287, 1, 1, 1, 1, 1,
0.5061187, 0.949964, 1.132584, 0, 0, 1, 1, 1,
0.5091172, -1.725859, 2.797067, 1, 0, 0, 1, 1,
0.5119232, 0.08156709, 2.814001, 1, 0, 0, 1, 1,
0.5139132, -1.627919, 3.46834, 1, 0, 0, 1, 1,
0.5170269, -0.5071055, 1.337048, 1, 0, 0, 1, 1,
0.5174387, -0.4786438, 1.487158, 1, 0, 0, 1, 1,
0.5202535, -0.9197137, 2.21988, 0, 0, 0, 1, 1,
0.5244439, 0.9707773, 0.3574737, 0, 0, 0, 1, 1,
0.5245789, 1.088345, 1.173908, 0, 0, 0, 1, 1,
0.5252663, 0.2771564, 0.04280937, 0, 0, 0, 1, 1,
0.5274459, 0.7146037, -0.1960942, 0, 0, 0, 1, 1,
0.5299361, -1.831398, 1.955342, 0, 0, 0, 1, 1,
0.5333945, -0.01033, 2.279013, 0, 0, 0, 1, 1,
0.5350697, -0.1982567, 2.640103, 1, 1, 1, 1, 1,
0.5373621, 0.4702294, 1.482098, 1, 1, 1, 1, 1,
0.5409027, -1.259842, 2.817798, 1, 1, 1, 1, 1,
0.5415003, 0.01275924, 1.379133, 1, 1, 1, 1, 1,
0.5417791, 0.2659592, 1.381383, 1, 1, 1, 1, 1,
0.5436836, 0.9787088, 2.237505, 1, 1, 1, 1, 1,
0.5447348, -1.049871, 3.842452, 1, 1, 1, 1, 1,
0.5497432, 0.404141, 0.3286688, 1, 1, 1, 1, 1,
0.5514722, 0.250841, 1.587474, 1, 1, 1, 1, 1,
0.5536977, -0.05732298, 1.533187, 1, 1, 1, 1, 1,
0.5620893, -0.8839296, 3.741714, 1, 1, 1, 1, 1,
0.565639, -0.5643158, 2.688234, 1, 1, 1, 1, 1,
0.5658386, 1.482726, 0.4934926, 1, 1, 1, 1, 1,
0.5662619, -0.6413, 1.043492, 1, 1, 1, 1, 1,
0.5673687, -1.569801, 1.653498, 1, 1, 1, 1, 1,
0.5741321, 1.099406, 0.2799289, 0, 0, 1, 1, 1,
0.5824353, 0.2225678, 0.8203562, 1, 0, 0, 1, 1,
0.5853751, 0.08653045, 1.049431, 1, 0, 0, 1, 1,
0.5874685, -1.523785, 3.410921, 1, 0, 0, 1, 1,
0.5926927, -0.1679377, 4.835997, 1, 0, 0, 1, 1,
0.5956007, -0.8535504, 0.9019571, 1, 0, 0, 1, 1,
0.5972592, 1.020952, -1.381228, 0, 0, 0, 1, 1,
0.6052065, 0.7065936, 1.643552, 0, 0, 0, 1, 1,
0.605969, 0.0640948, 0.05524193, 0, 0, 0, 1, 1,
0.6081951, 2.063013, 0.3264609, 0, 0, 0, 1, 1,
0.6097094, -1.251179, 2.370078, 0, 0, 0, 1, 1,
0.6102211, 0.0835014, 1.820701, 0, 0, 0, 1, 1,
0.6118701, 0.882491, -0.2707374, 0, 0, 0, 1, 1,
0.6158121, -0.8284183, 2.233013, 1, 1, 1, 1, 1,
0.6174321, 0.1328782, 2.599046, 1, 1, 1, 1, 1,
0.6213228, -0.8933834, 3.495373, 1, 1, 1, 1, 1,
0.6275644, -0.2680939, 1.145039, 1, 1, 1, 1, 1,
0.63617, -0.1756814, 2.920074, 1, 1, 1, 1, 1,
0.6366525, -0.1466257, 4.161861, 1, 1, 1, 1, 1,
0.6398658, 0.9670398, 1.797911, 1, 1, 1, 1, 1,
0.645133, -0.08109528, 1.927293, 1, 1, 1, 1, 1,
0.6486679, 0.1256943, 2.224229, 1, 1, 1, 1, 1,
0.6490225, -0.9949949, 2.633961, 1, 1, 1, 1, 1,
0.6544908, -0.417564, 2.681432, 1, 1, 1, 1, 1,
0.6555895, 1.232107, -1.332053, 1, 1, 1, 1, 1,
0.6583372, 0.5171937, -0.4175505, 1, 1, 1, 1, 1,
0.6614041, -1.395165, 3.456829, 1, 1, 1, 1, 1,
0.6647919, 0.08232689, 2.817609, 1, 1, 1, 1, 1,
0.6665116, 0.5246833, 1.868239, 0, 0, 1, 1, 1,
0.6701954, 1.821506, -1.446329, 1, 0, 0, 1, 1,
0.670525, 0.4742563, -0.1337807, 1, 0, 0, 1, 1,
0.6708694, -0.07821734, 1.828723, 1, 0, 0, 1, 1,
0.6720867, -0.799494, 2.498897, 1, 0, 0, 1, 1,
0.6759241, -0.194895, 0.9832815, 1, 0, 0, 1, 1,
0.6814609, -0.5707298, 3.109596, 0, 0, 0, 1, 1,
0.6842551, -0.8711541, 2.932306, 0, 0, 0, 1, 1,
0.6851097, -0.2910963, 3.365355, 0, 0, 0, 1, 1,
0.6890782, 0.1183886, 2.734777, 0, 0, 0, 1, 1,
0.6919572, 0.2538866, 2.776248, 0, 0, 0, 1, 1,
0.6976026, -0.7097159, 1.626288, 0, 0, 0, 1, 1,
0.6990167, -1.037599, 1.369608, 0, 0, 0, 1, 1,
0.7015342, 2.039978, 0.6238768, 1, 1, 1, 1, 1,
0.7029647, 1.438193, 2.032038, 1, 1, 1, 1, 1,
0.7129373, -0.6606596, 1.988668, 1, 1, 1, 1, 1,
0.7222551, 0.6267499, 1.244805, 1, 1, 1, 1, 1,
0.722823, -1.000418, 0.4622729, 1, 1, 1, 1, 1,
0.7244061, -1.824231, 0.8042102, 1, 1, 1, 1, 1,
0.7249367, 0.1903355, -0.361978, 1, 1, 1, 1, 1,
0.7263181, -0.7381322, 2.549767, 1, 1, 1, 1, 1,
0.7314222, -0.1548804, 2.619025, 1, 1, 1, 1, 1,
0.7319365, 0.7708296, 1.746097, 1, 1, 1, 1, 1,
0.7330902, -1.049549, 2.369136, 1, 1, 1, 1, 1,
0.7359335, -0.9749199, 2.821905, 1, 1, 1, 1, 1,
0.7402672, 1.487015, 1.008534, 1, 1, 1, 1, 1,
0.7405369, -0.08037969, 1.02006, 1, 1, 1, 1, 1,
0.7424518, 0.9579876, 0.5748149, 1, 1, 1, 1, 1,
0.7433631, 1.180204, 0.08844683, 0, 0, 1, 1, 1,
0.7445917, 0.544638, 1.407701, 1, 0, 0, 1, 1,
0.7521108, -0.04115579, 2.425817, 1, 0, 0, 1, 1,
0.7530864, 0.1766629, -0.537285, 1, 0, 0, 1, 1,
0.7644125, 0.6477181, 0.3545246, 1, 0, 0, 1, 1,
0.7721484, -0.06190544, 1.227424, 1, 0, 0, 1, 1,
0.7726066, 0.2619888, 0.5033286, 0, 0, 0, 1, 1,
0.7741305, -0.7974986, 1.488837, 0, 0, 0, 1, 1,
0.7759113, 0.3663659, 1.480324, 0, 0, 0, 1, 1,
0.7811465, 0.3178763, 0.7614169, 0, 0, 0, 1, 1,
0.7845701, -0.02334613, 0.3360639, 0, 0, 0, 1, 1,
0.7895325, -0.3500189, 3.134296, 0, 0, 0, 1, 1,
0.7922356, -0.1908263, 2.433191, 0, 0, 0, 1, 1,
0.7988629, 1.266619, -0.594188, 1, 1, 1, 1, 1,
0.8104078, 0.2260519, 0.6827514, 1, 1, 1, 1, 1,
0.8107225, 0.05309965, 1.023153, 1, 1, 1, 1, 1,
0.8166034, 0.2349304, 1.05952, 1, 1, 1, 1, 1,
0.8183156, 0.09172322, -0.5591203, 1, 1, 1, 1, 1,
0.8255723, 0.5280199, 0.6209281, 1, 1, 1, 1, 1,
0.8301733, 0.03888979, 2.167738, 1, 1, 1, 1, 1,
0.834134, 0.1383755, 0.2240674, 1, 1, 1, 1, 1,
0.8343954, -1.363982, 2.495497, 1, 1, 1, 1, 1,
0.8358263, -0.2636894, 0.8049457, 1, 1, 1, 1, 1,
0.8374045, 1.20523, -0.773166, 1, 1, 1, 1, 1,
0.8388738, -0.05200846, 0.6250888, 1, 1, 1, 1, 1,
0.8499402, 0.05787533, 0.2888007, 1, 1, 1, 1, 1,
0.8520364, 2.901773, -0.4836688, 1, 1, 1, 1, 1,
0.8581634, 0.2470338, 0.6479659, 1, 1, 1, 1, 1,
0.8718531, -0.50777, 1.37122, 0, 0, 1, 1, 1,
0.8741286, -0.8018731, 2.616529, 1, 0, 0, 1, 1,
0.8769311, 0.4701196, 2.418656, 1, 0, 0, 1, 1,
0.8814821, -0.3779429, 1.714684, 1, 0, 0, 1, 1,
0.8886796, -0.4106815, 2.215793, 1, 0, 0, 1, 1,
0.889706, -0.5346932, 2.269338, 1, 0, 0, 1, 1,
0.8942192, -0.6257805, 0.408841, 0, 0, 0, 1, 1,
0.8952248, 0.8877159, -0.6612468, 0, 0, 0, 1, 1,
0.9000791, -0.7037621, 1.315542, 0, 0, 0, 1, 1,
0.9040752, 0.5518436, 2.196246, 0, 0, 0, 1, 1,
0.9052298, -1.022607, 2.060389, 0, 0, 0, 1, 1,
0.9100646, -0.1889903, 2.68013, 0, 0, 0, 1, 1,
0.9148141, -0.7109687, 2.518525, 0, 0, 0, 1, 1,
0.9163483, -0.5561224, 3.507174, 1, 1, 1, 1, 1,
0.9272756, 0.6993646, 0.1122535, 1, 1, 1, 1, 1,
0.9279453, 0.5541944, 1.11987, 1, 1, 1, 1, 1,
0.9414903, 0.7323225, 1.802211, 1, 1, 1, 1, 1,
0.9451837, -2.502266, 3.500891, 1, 1, 1, 1, 1,
0.9565405, -0.790172, 2.768876, 1, 1, 1, 1, 1,
0.9573445, -0.8217996, 1.039056, 1, 1, 1, 1, 1,
0.9647534, -2.015033, 2.125559, 1, 1, 1, 1, 1,
0.9661753, 0.8173553, 0.8632537, 1, 1, 1, 1, 1,
0.9674175, -0.7101748, 1.444836, 1, 1, 1, 1, 1,
0.9704998, 1.400445, -1.714969, 1, 1, 1, 1, 1,
0.9718397, -0.284622, 0.190429, 1, 1, 1, 1, 1,
0.9728802, -0.535831, 3.254732, 1, 1, 1, 1, 1,
0.973864, 0.0498573, 2.191284, 1, 1, 1, 1, 1,
0.9742345, 0.79878, -0.2948827, 1, 1, 1, 1, 1,
0.976414, 0.9246798, 0.03079442, 0, 0, 1, 1, 1,
0.9799711, -2.507997, 4.289909, 1, 0, 0, 1, 1,
0.9801225, -1.548796, 2.111132, 1, 0, 0, 1, 1,
1.011189, 0.2167388, 1.903899, 1, 0, 0, 1, 1,
1.023243, 1.111782, 1.107454, 1, 0, 0, 1, 1,
1.02396, -0.2510169, 0.1580152, 1, 0, 0, 1, 1,
1.031332, 0.4240522, 3.9239, 0, 0, 0, 1, 1,
1.036893, 0.5353842, 2.039626, 0, 0, 0, 1, 1,
1.040064, 0.0250984, 2.683591, 0, 0, 0, 1, 1,
1.04553, 0.437277, 1.812282, 0, 0, 0, 1, 1,
1.04616, 1.332888, 2.522315, 0, 0, 0, 1, 1,
1.058124, 2.212597, 0.05492827, 0, 0, 0, 1, 1,
1.064637, 1.199567, 1.406488, 0, 0, 0, 1, 1,
1.065333, -0.3742551, 0.7121441, 1, 1, 1, 1, 1,
1.078356, -0.6585219, 2.817373, 1, 1, 1, 1, 1,
1.09032, 0.4281882, 1.662441, 1, 1, 1, 1, 1,
1.09536, -0.1197467, 1.315614, 1, 1, 1, 1, 1,
1.099611, -0.01210066, 1.256188, 1, 1, 1, 1, 1,
1.105736, -1.030628, 3.020924, 1, 1, 1, 1, 1,
1.107454, 1.206967, -1.297309, 1, 1, 1, 1, 1,
1.112472, -1.39511, 3.404285, 1, 1, 1, 1, 1,
1.115722, -0.3714916, 1.059529, 1, 1, 1, 1, 1,
1.11688, -0.2282846, 1.696134, 1, 1, 1, 1, 1,
1.122417, 0.3317278, 1.211097, 1, 1, 1, 1, 1,
1.124569, 2.345452, 1.421279, 1, 1, 1, 1, 1,
1.126584, 0.1482996, -0.3694088, 1, 1, 1, 1, 1,
1.127672, -0.3021531, 3.019839, 1, 1, 1, 1, 1,
1.132307, -0.002158887, 1.094168, 1, 1, 1, 1, 1,
1.138415, -0.9755514, 0.5760481, 0, 0, 1, 1, 1,
1.148019, 0.9690274, -1.564505, 1, 0, 0, 1, 1,
1.14908, 1.249878, 1.487901, 1, 0, 0, 1, 1,
1.15938, -1.991276, 2.091287, 1, 0, 0, 1, 1,
1.161199, -2.332484, 1.737538, 1, 0, 0, 1, 1,
1.173844, 0.5790375, 0.09095648, 1, 0, 0, 1, 1,
1.175339, 0.1378582, 0.3270303, 0, 0, 0, 1, 1,
1.176638, -0.5767391, 3.623575, 0, 0, 0, 1, 1,
1.179279, -0.3963749, 0.2499203, 0, 0, 0, 1, 1,
1.187415, -1.481969, 1.830524, 0, 0, 0, 1, 1,
1.197926, 1.117314, 0.9509951, 0, 0, 0, 1, 1,
1.205097, 0.2519419, 2.05749, 0, 0, 0, 1, 1,
1.210247, -0.9937064, 2.485014, 0, 0, 0, 1, 1,
1.210532, 1.196954, 1.26183, 1, 1, 1, 1, 1,
1.212712, -0.1660173, 2.530964, 1, 1, 1, 1, 1,
1.215573, 0.3570133, 0.6625249, 1, 1, 1, 1, 1,
1.216712, -0.3793388, 1.838836, 1, 1, 1, 1, 1,
1.220207, -0.2439129, 0.6287715, 1, 1, 1, 1, 1,
1.22036, 0.7198786, 1.69681, 1, 1, 1, 1, 1,
1.224372, 0.3424234, 0.7305699, 1, 1, 1, 1, 1,
1.228081, -0.8789448, 1.78695, 1, 1, 1, 1, 1,
1.24135, -0.8246771, 2.938044, 1, 1, 1, 1, 1,
1.247999, 0.7396751, 0.3586166, 1, 1, 1, 1, 1,
1.251399, -0.2178301, 0.5715155, 1, 1, 1, 1, 1,
1.266126, 0.2312668, 1.63292, 1, 1, 1, 1, 1,
1.26631, -0.2036636, 2.733986, 1, 1, 1, 1, 1,
1.268869, 1.439375, 1.313129, 1, 1, 1, 1, 1,
1.27231, 1.172101, 1.07829, 1, 1, 1, 1, 1,
1.275177, -0.006819095, 1.127464, 0, 0, 1, 1, 1,
1.282162, 0.3024568, 2.165004, 1, 0, 0, 1, 1,
1.286613, 1.336671, 2.129939, 1, 0, 0, 1, 1,
1.300309, 1.413397, 1.816104, 1, 0, 0, 1, 1,
1.316766, -0.2659583, 0.7106839, 1, 0, 0, 1, 1,
1.34129, 1.166253, 0.5555505, 1, 0, 0, 1, 1,
1.349253, -2.001247, 3.033957, 0, 0, 0, 1, 1,
1.350684, -1.198232, 2.994925, 0, 0, 0, 1, 1,
1.36377, 1.057472, 1.526703, 0, 0, 0, 1, 1,
1.370831, -0.3256274, 1.494884, 0, 0, 0, 1, 1,
1.372261, 1.255769, -0.2343647, 0, 0, 0, 1, 1,
1.378582, 0.6432418, 2.525373, 0, 0, 0, 1, 1,
1.382696, -0.4612036, 0.8670107, 0, 0, 0, 1, 1,
1.39391, -0.3174431, 3.914699, 1, 1, 1, 1, 1,
1.396499, 0.4090032, 0.9460654, 1, 1, 1, 1, 1,
1.40388, -0.538046, 2.01375, 1, 1, 1, 1, 1,
1.404343, -2.776656, 3.749785, 1, 1, 1, 1, 1,
1.417638, -1.431252, 1.341677, 1, 1, 1, 1, 1,
1.420543, 0.4965505, 2.348434, 1, 1, 1, 1, 1,
1.422942, 0.5977148, 2.197529, 1, 1, 1, 1, 1,
1.435999, 1.332219, -0.9137726, 1, 1, 1, 1, 1,
1.449966, 0.4167264, 1.653441, 1, 1, 1, 1, 1,
1.451745, -0.2272513, 2.917718, 1, 1, 1, 1, 1,
1.463865, 0.2405389, 0.6485118, 1, 1, 1, 1, 1,
1.467889, 0.7958061, 1.710876, 1, 1, 1, 1, 1,
1.481981, 0.5028216, 3.15628, 1, 1, 1, 1, 1,
1.484977, 1.033338, 0.8490356, 1, 1, 1, 1, 1,
1.494731, 0.3555343, 2.108563, 1, 1, 1, 1, 1,
1.49516, 0.1351698, 1.577743, 0, 0, 1, 1, 1,
1.496806, 0.03878745, 1.830174, 1, 0, 0, 1, 1,
1.500329, -1.179448, 2.07871, 1, 0, 0, 1, 1,
1.503588, -0.9636402, 3.033123, 1, 0, 0, 1, 1,
1.523237, 0.9653664, 0.6251754, 1, 0, 0, 1, 1,
1.529246, -0.007914423, -0.2367881, 1, 0, 0, 1, 1,
1.530864, -0.7163652, 1.679033, 0, 0, 0, 1, 1,
1.549667, 0.4320581, 1.277643, 0, 0, 0, 1, 1,
1.556339, 0.4760246, 0.4095285, 0, 0, 0, 1, 1,
1.56992, -0.04481978, 0.4026732, 0, 0, 0, 1, 1,
1.57895, 0.4834568, 1.050971, 0, 0, 0, 1, 1,
1.581087, -0.5787757, 0.9426575, 0, 0, 0, 1, 1,
1.583406, -0.05374065, -0.3668574, 0, 0, 0, 1, 1,
1.598209, -0.1289067, 2.22042, 1, 1, 1, 1, 1,
1.605882, -1.136953, 2.819397, 1, 1, 1, 1, 1,
1.610986, 1.992631, 1.540511, 1, 1, 1, 1, 1,
1.619761, -0.0399299, 0.9121089, 1, 1, 1, 1, 1,
1.62056, 0.03363671, 2.208982, 1, 1, 1, 1, 1,
1.642384, -1.219472, 2.644148, 1, 1, 1, 1, 1,
1.646133, 0.6596417, 1.4062, 1, 1, 1, 1, 1,
1.647581, 0.3821516, 2.312363, 1, 1, 1, 1, 1,
1.649259, 0.08107983, 1.007247, 1, 1, 1, 1, 1,
1.658878, 0.5804661, 2.053504, 1, 1, 1, 1, 1,
1.664277, -0.2280447, -0.03946909, 1, 1, 1, 1, 1,
1.670313, -0.1085216, 1.284384, 1, 1, 1, 1, 1,
1.691821, -0.2608885, 1.546903, 1, 1, 1, 1, 1,
1.70298, -0.6156526, 3.924035, 1, 1, 1, 1, 1,
1.714718, -0.1010083, -0.1300206, 1, 1, 1, 1, 1,
1.744132, 1.375016, -0.3764498, 0, 0, 1, 1, 1,
1.745856, 1.221988, 1.136112, 1, 0, 0, 1, 1,
1.755241, 1.045689, -1.023676, 1, 0, 0, 1, 1,
1.75947, 1.55939, 1.062538, 1, 0, 0, 1, 1,
1.765314, -0.8226749, 0.4978609, 1, 0, 0, 1, 1,
1.771464, -1.177986, 2.562932, 1, 0, 0, 1, 1,
1.776218, 1.281569, 0.45341, 0, 0, 0, 1, 1,
1.79429, 0.4419949, 0.4495882, 0, 0, 0, 1, 1,
1.806466, 0.3615722, 0.3051221, 0, 0, 0, 1, 1,
1.806505, -0.2163947, 0.8469238, 0, 0, 0, 1, 1,
1.809452, 1.497314, 0.5399549, 0, 0, 0, 1, 1,
1.812148, -0.06030945, 1.489969, 0, 0, 0, 1, 1,
1.828115, 0.1362422, 1.388556, 0, 0, 0, 1, 1,
1.834985, -1.598212, 1.939778, 1, 1, 1, 1, 1,
1.842542, 1.752514, 1.667285, 1, 1, 1, 1, 1,
1.853352, -0.1541276, 2.142799, 1, 1, 1, 1, 1,
1.858526, -0.3156643, 1.060553, 1, 1, 1, 1, 1,
1.865075, 0.598735, 0.5318987, 1, 1, 1, 1, 1,
1.887313, 0.3565433, 0.8848622, 1, 1, 1, 1, 1,
1.893184, -1.025712, 2.139436, 1, 1, 1, 1, 1,
1.902927, 0.7429416, 1.76838, 1, 1, 1, 1, 1,
1.909901, 1.033358, 0.7685078, 1, 1, 1, 1, 1,
1.913755, -0.09623147, 2.744609, 1, 1, 1, 1, 1,
1.92445, 0.6653009, 1.756469, 1, 1, 1, 1, 1,
1.927732, -0.1423071, 1.813651, 1, 1, 1, 1, 1,
1.931025, -0.3654671, 2.621766, 1, 1, 1, 1, 1,
1.9392, -0.6182284, 2.391084, 1, 1, 1, 1, 1,
1.979414, 1.152905, 0.5093771, 1, 1, 1, 1, 1,
1.981943, -0.7164455, 2.029615, 0, 0, 1, 1, 1,
1.982193, 1.343458, 1.743781, 1, 0, 0, 1, 1,
1.982255, -1.274825, 1.44448, 1, 0, 0, 1, 1,
1.986623, -0.1164105, 1.768985, 1, 0, 0, 1, 1,
2.023679, 0.644526, 0.3861347, 1, 0, 0, 1, 1,
2.118696, -1.697401, 2.990857, 1, 0, 0, 1, 1,
2.130533, 1.327364, 0.6554431, 0, 0, 0, 1, 1,
2.140631, 0.4725095, 0.8831474, 0, 0, 0, 1, 1,
2.141645, -0.5942743, 1.29389, 0, 0, 0, 1, 1,
2.163822, -1.737795, 2.380745, 0, 0, 0, 1, 1,
2.174237, -1.528919, 4.390249, 0, 0, 0, 1, 1,
2.205873, 0.2216341, 1.488765, 0, 0, 0, 1, 1,
2.230735, -0.9879984, 1.785732, 0, 0, 0, 1, 1,
2.300267, 0.1494658, 2.076548, 1, 1, 1, 1, 1,
2.350377, 0.5994245, 0.4973826, 1, 1, 1, 1, 1,
2.360315, -1.005036, 1.684256, 1, 1, 1, 1, 1,
2.363166, 1.538918, 0.6251779, 1, 1, 1, 1, 1,
2.559094, 0.3226683, 0.3016279, 1, 1, 1, 1, 1,
2.624361, -0.3766447, 1.232948, 1, 1, 1, 1, 1,
2.916804, -0.001075036, 2.401931, 1, 1, 1, 1, 1
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
var radius = 9.787131;
var distance = 34.37688;
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
mvMatrix.translate( -0.1335802, -0.3385673, -0.461885 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37688);
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
