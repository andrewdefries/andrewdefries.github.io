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
-3.863448, -0.7518002, -0.3514426, 1, 0, 0, 1,
-3.484334, 0.4393204, -1.040835, 1, 0.007843138, 0, 1,
-2.936251, -3.263167, -4.627573, 1, 0.01176471, 0, 1,
-2.579094, 1.105443, -1.755638, 1, 0.01960784, 0, 1,
-2.520622, -0.0732567, -1.994204, 1, 0.02352941, 0, 1,
-2.513841, -0.6317214, -0.2417219, 1, 0.03137255, 0, 1,
-2.50773, -0.424516, -2.522711, 1, 0.03529412, 0, 1,
-2.449544, -0.77289, -0.01543426, 1, 0.04313726, 0, 1,
-2.335931, 0.7552857, -3.147021, 1, 0.04705882, 0, 1,
-2.240865, 1.350447, -0.4481595, 1, 0.05490196, 0, 1,
-2.202765, 1.015115, 0.3831504, 1, 0.05882353, 0, 1,
-2.197874, -0.689396, 0.2185892, 1, 0.06666667, 0, 1,
-2.189866, 0.1979464, 1.141461, 1, 0.07058824, 0, 1,
-2.138204, -0.1660969, -3.169634, 1, 0.07843138, 0, 1,
-2.121542, 1.027773, -0.880688, 1, 0.08235294, 0, 1,
-2.100888, 0.2152231, -1.123069, 1, 0.09019608, 0, 1,
-2.095701, -1.316653, -3.426308, 1, 0.09411765, 0, 1,
-2.091898, -1.157009, -2.778388, 1, 0.1019608, 0, 1,
-1.985398, 2.368161, 1.448636, 1, 0.1098039, 0, 1,
-1.979196, 0.1669249, -3.220829, 1, 0.1137255, 0, 1,
-1.917338, -1.280406, -3.282726, 1, 0.1215686, 0, 1,
-1.890488, 0.7987742, 0.9400655, 1, 0.1254902, 0, 1,
-1.889243, -0.3197295, -2.749824, 1, 0.1333333, 0, 1,
-1.889123, 0.9437479, -0.1608779, 1, 0.1372549, 0, 1,
-1.874757, -0.4525426, -2.714839, 1, 0.145098, 0, 1,
-1.861637, 0.6957083, -2.385999, 1, 0.1490196, 0, 1,
-1.832976, -1.040066, -2.870046, 1, 0.1568628, 0, 1,
-1.815503, -1.12176, -3.68933, 1, 0.1607843, 0, 1,
-1.78362, -1.797989, -2.698406, 1, 0.1686275, 0, 1,
-1.772833, -1.357414, -1.546811, 1, 0.172549, 0, 1,
-1.7727, -0.850741, -0.3207179, 1, 0.1803922, 0, 1,
-1.760114, 0.3898913, -1.558052, 1, 0.1843137, 0, 1,
-1.75942, -1.08716, -5.544948, 1, 0.1921569, 0, 1,
-1.742685, -0.8902381, -2.942224, 1, 0.1960784, 0, 1,
-1.683224, 1.725282, -1.431418, 1, 0.2039216, 0, 1,
-1.676146, -0.2973228, -1.816208, 1, 0.2117647, 0, 1,
-1.67183, -1.680381, -2.244589, 1, 0.2156863, 0, 1,
-1.659136, 0.423359, -0.8012231, 1, 0.2235294, 0, 1,
-1.653452, 1.909761, -1.290568, 1, 0.227451, 0, 1,
-1.63553, -1.141893, -2.78854, 1, 0.2352941, 0, 1,
-1.63354, -0.9454105, -0.8814731, 1, 0.2392157, 0, 1,
-1.540933, -0.5941171, -0.7580548, 1, 0.2470588, 0, 1,
-1.538764, -0.01523763, -2.414194, 1, 0.2509804, 0, 1,
-1.531586, 1.048849, -0.8190892, 1, 0.2588235, 0, 1,
-1.531404, 0.1865857, -1.742278, 1, 0.2627451, 0, 1,
-1.524263, 0.132871, -3.233024, 1, 0.2705882, 0, 1,
-1.51033, -1.792, -2.72194, 1, 0.2745098, 0, 1,
-1.502274, -0.340044, -2.886248, 1, 0.282353, 0, 1,
-1.500584, -1.271981, -1.178442, 1, 0.2862745, 0, 1,
-1.497722, -0.7682436, -1.054406, 1, 0.2941177, 0, 1,
-1.495987, 0.2313527, -1.238502, 1, 0.3019608, 0, 1,
-1.484455, 0.7481641, -1.322882, 1, 0.3058824, 0, 1,
-1.473395, 0.1383786, -1.379322, 1, 0.3137255, 0, 1,
-1.463853, -1.093722, -2.76333, 1, 0.3176471, 0, 1,
-1.463558, 0.08836712, -1.767768, 1, 0.3254902, 0, 1,
-1.456705, 0.8355699, -0.1007869, 1, 0.3294118, 0, 1,
-1.427639, 0.08401617, -0.8433979, 1, 0.3372549, 0, 1,
-1.423841, 0.7296187, -0.611267, 1, 0.3411765, 0, 1,
-1.405531, 0.8984374, -1.333199, 1, 0.3490196, 0, 1,
-1.404537, -0.3062441, -3.145689, 1, 0.3529412, 0, 1,
-1.392863, -0.1059334, -1.132217, 1, 0.3607843, 0, 1,
-1.388406, 0.5340001, 0.9277418, 1, 0.3647059, 0, 1,
-1.387264, 0.24013, -1.634714, 1, 0.372549, 0, 1,
-1.385828, -0.2642959, -2.912928, 1, 0.3764706, 0, 1,
-1.385616, 0.3884998, -1.238529, 1, 0.3843137, 0, 1,
-1.374159, -0.4518341, -2.627555, 1, 0.3882353, 0, 1,
-1.368396, 0.3656739, -1.753317, 1, 0.3960784, 0, 1,
-1.364128, -0.8705266, -1.614625, 1, 0.4039216, 0, 1,
-1.36402, -2.06076, -1.519548, 1, 0.4078431, 0, 1,
-1.355207, 1.417191, 0.2885792, 1, 0.4156863, 0, 1,
-1.348356, -1.078797, -1.693057, 1, 0.4196078, 0, 1,
-1.338636, -0.5349045, -1.779046, 1, 0.427451, 0, 1,
-1.338394, -0.6429038, -1.698714, 1, 0.4313726, 0, 1,
-1.328217, 0.8895145, -2.335318, 1, 0.4392157, 0, 1,
-1.322958, 1.033309, -1.192016, 1, 0.4431373, 0, 1,
-1.309006, -0.5972323, -1.209406, 1, 0.4509804, 0, 1,
-1.308674, 1.181706, -0.6109208, 1, 0.454902, 0, 1,
-1.304918, 0.7210666, -2.927232, 1, 0.4627451, 0, 1,
-1.303711, -0.5711422, -3.193598, 1, 0.4666667, 0, 1,
-1.287849, -1.046387, -1.93707, 1, 0.4745098, 0, 1,
-1.273716, 0.455132, -0.8797985, 1, 0.4784314, 0, 1,
-1.272695, 0.6542687, -0.2665863, 1, 0.4862745, 0, 1,
-1.253134, -0.5266735, -2.26245, 1, 0.4901961, 0, 1,
-1.252999, 0.7021759, -1.261446, 1, 0.4980392, 0, 1,
-1.24764, 0.512414, -0.9477262, 1, 0.5058824, 0, 1,
-1.239856, -1.495474, -2.282124, 1, 0.509804, 0, 1,
-1.23556, 0.6904855, 0.3849025, 1, 0.5176471, 0, 1,
-1.222772, 0.3939138, -1.204286, 1, 0.5215687, 0, 1,
-1.222206, -0.719113, -1.332293, 1, 0.5294118, 0, 1,
-1.222154, -0.0002749896, 0.489181, 1, 0.5333334, 0, 1,
-1.219592, 0.9319903, -0.591737, 1, 0.5411765, 0, 1,
-1.219554, -0.321097, -3.25211, 1, 0.5450981, 0, 1,
-1.216358, 1.007229, 0.7234496, 1, 0.5529412, 0, 1,
-1.214667, -0.4686314, -1.344901, 1, 0.5568628, 0, 1,
-1.211483, -1.099923, -1.490701, 1, 0.5647059, 0, 1,
-1.211175, -3.468874, -3.452354, 1, 0.5686275, 0, 1,
-1.207537, -0.7615221, -2.022104, 1, 0.5764706, 0, 1,
-1.207339, -0.2366557, -1.640588, 1, 0.5803922, 0, 1,
-1.189678, -1.217013, -1.181816, 1, 0.5882353, 0, 1,
-1.169884, 0.7183858, -0.6111699, 1, 0.5921569, 0, 1,
-1.169467, 0.4216573, -0.3493265, 1, 0.6, 0, 1,
-1.164986, -1.194262, -2.273824, 1, 0.6078432, 0, 1,
-1.163444, 0.5793476, -0.8893687, 1, 0.6117647, 0, 1,
-1.158769, -1.555954, -1.195054, 1, 0.6196079, 0, 1,
-1.156752, -0.817656, -2.982712, 1, 0.6235294, 0, 1,
-1.148206, -0.516272, -0.9086396, 1, 0.6313726, 0, 1,
-1.148157, 1.131232, -0.06869267, 1, 0.6352941, 0, 1,
-1.147094, -0.5350744, -3.322975, 1, 0.6431373, 0, 1,
-1.146956, -0.7538433, -2.177689, 1, 0.6470588, 0, 1,
-1.143422, 0.8226064, -1.014963, 1, 0.654902, 0, 1,
-1.132635, -0.7211933, -3.305446, 1, 0.6588235, 0, 1,
-1.132173, -0.236799, -2.209127, 1, 0.6666667, 0, 1,
-1.132086, -0.4246371, -2.609827, 1, 0.6705883, 0, 1,
-1.1319, -0.1519986, -2.10517, 1, 0.6784314, 0, 1,
-1.129228, 0.1234674, 0.180077, 1, 0.682353, 0, 1,
-1.120337, -1.675815, -2.571533, 1, 0.6901961, 0, 1,
-1.119502, -0.3812638, -2.920326, 1, 0.6941177, 0, 1,
-1.119, -1.211496, -0.1288938, 1, 0.7019608, 0, 1,
-1.112772, 2.065128, -1.372445, 1, 0.7098039, 0, 1,
-1.109084, -0.6098316, -1.40699, 1, 0.7137255, 0, 1,
-1.091753, 0.5650256, -2.502601, 1, 0.7215686, 0, 1,
-1.089941, -0.6715459, -1.157014, 1, 0.7254902, 0, 1,
-1.086578, -0.6488447, -2.286114, 1, 0.7333333, 0, 1,
-1.084764, -1.283345, -1.595574, 1, 0.7372549, 0, 1,
-1.078004, 1.552941, 1.757481, 1, 0.7450981, 0, 1,
-1.068702, 1.848084, -2.42185, 1, 0.7490196, 0, 1,
-1.065768, 0.8194433, -1.154867, 1, 0.7568628, 0, 1,
-1.065696, -1.278924, -2.830145, 1, 0.7607843, 0, 1,
-1.054694, 0.1354275, -2.078361, 1, 0.7686275, 0, 1,
-1.048786, 0.8388841, -2.926189, 1, 0.772549, 0, 1,
-1.034619, -2.227185, -2.370816, 1, 0.7803922, 0, 1,
-1.032266, -1.248836, -2.698004, 1, 0.7843137, 0, 1,
-1.030419, -1.538833, -1.360208, 1, 0.7921569, 0, 1,
-1.029594, 0.8234188, -1.718764, 1, 0.7960784, 0, 1,
-1.025946, -0.55716, -2.409956, 1, 0.8039216, 0, 1,
-1.025007, 1.450383, -0.563469, 1, 0.8117647, 0, 1,
-1.019872, 0.5950068, -0.8216485, 1, 0.8156863, 0, 1,
-1.016621, -1.094957, -1.172348, 1, 0.8235294, 0, 1,
-1.014599, 1.24703, -2.225143, 1, 0.827451, 0, 1,
-1.013362, 1.368877, -0.3272696, 1, 0.8352941, 0, 1,
-1.012192, 0.1899014, -1.025648, 1, 0.8392157, 0, 1,
-1.0105, -0.2759525, -2.727325, 1, 0.8470588, 0, 1,
-1.006405, 1.064017, -0.8809463, 1, 0.8509804, 0, 1,
-1.006078, -1.637455, -4.358654, 1, 0.8588235, 0, 1,
-1.005907, -1.128637, -2.050818, 1, 0.8627451, 0, 1,
-1.005185, -1.210017, -2.370805, 1, 0.8705882, 0, 1,
-1.00453, -1.561426, -3.140863, 1, 0.8745098, 0, 1,
-1.002176, 0.2080716, -2.361072, 1, 0.8823529, 0, 1,
-1.002085, -0.1221997, -2.517255, 1, 0.8862745, 0, 1,
-0.9991581, -1.754836, -2.454993, 1, 0.8941177, 0, 1,
-0.9977689, -1.538659, -0.9779102, 1, 0.8980392, 0, 1,
-0.9920257, -1.252327, -1.944289, 1, 0.9058824, 0, 1,
-0.9908195, 0.2328762, 0.04322202, 1, 0.9137255, 0, 1,
-0.9887845, 1.12532, -0.7348467, 1, 0.9176471, 0, 1,
-0.984465, -0.8291895, -2.336824, 1, 0.9254902, 0, 1,
-0.9820902, -0.2984191, -2.036902, 1, 0.9294118, 0, 1,
-0.981977, 0.2040462, -2.631157, 1, 0.9372549, 0, 1,
-0.9815788, 1.042416, -2.119176, 1, 0.9411765, 0, 1,
-0.980944, 1.347889, -0.5501224, 1, 0.9490196, 0, 1,
-0.979853, -0.4082212, -0.6825208, 1, 0.9529412, 0, 1,
-0.9796913, 0.1887157, -1.956426, 1, 0.9607843, 0, 1,
-0.9789137, -1.605439, -2.201607, 1, 0.9647059, 0, 1,
-0.9778714, -1.091835, -1.93497, 1, 0.972549, 0, 1,
-0.9754405, -2.021071, -0.6197124, 1, 0.9764706, 0, 1,
-0.9707917, -0.5692276, -3.423432, 1, 0.9843137, 0, 1,
-0.9651775, 1.240203, 0.6625927, 1, 0.9882353, 0, 1,
-0.9578215, -0.7369596, -2.918355, 1, 0.9960784, 0, 1,
-0.9512163, 0.2857765, 0.3107418, 0.9960784, 1, 0, 1,
-0.9468837, 0.1321275, -0.7967031, 0.9921569, 1, 0, 1,
-0.9465521, -0.1844107, -3.186648, 0.9843137, 1, 0, 1,
-0.9399009, -0.5739, -3.050455, 0.9803922, 1, 0, 1,
-0.9327343, 0.6320505, -2.212018, 0.972549, 1, 0, 1,
-0.9310921, -0.4588965, -2.382838, 0.9686275, 1, 0, 1,
-0.9263084, -1.264753, -1.550348, 0.9607843, 1, 0, 1,
-0.9253023, -1.986994, -3.501189, 0.9568627, 1, 0, 1,
-0.9108251, 0.09918865, 0.3308368, 0.9490196, 1, 0, 1,
-0.9046965, 0.9359037, -1.378643, 0.945098, 1, 0, 1,
-0.903045, 0.6614601, -1.150633, 0.9372549, 1, 0, 1,
-0.8968966, 0.3512581, -0.8503743, 0.9333333, 1, 0, 1,
-0.8949128, 2.757936, -1.920276, 0.9254902, 1, 0, 1,
-0.8937477, -0.8795976, -2.894849, 0.9215686, 1, 0, 1,
-0.8900538, 0.1697353, -1.699376, 0.9137255, 1, 0, 1,
-0.8804882, -0.157428, -2.078069, 0.9098039, 1, 0, 1,
-0.878282, 0.3541667, -2.609634, 0.9019608, 1, 0, 1,
-0.8751715, 0.5841556, -0.3888549, 0.8941177, 1, 0, 1,
-0.874644, 0.4418059, -2.218851, 0.8901961, 1, 0, 1,
-0.8699413, 1.357287, -0.7132949, 0.8823529, 1, 0, 1,
-0.862245, -1.099693, -0.738579, 0.8784314, 1, 0, 1,
-0.85943, 1.951638, -0.1569951, 0.8705882, 1, 0, 1,
-0.8594221, 0.387156, -0.02402856, 0.8666667, 1, 0, 1,
-0.8556031, 1.422465, 0.2559042, 0.8588235, 1, 0, 1,
-0.8546543, -1.315155, -2.820992, 0.854902, 1, 0, 1,
-0.8454678, 1.370151, -0.8802483, 0.8470588, 1, 0, 1,
-0.8420595, 0.2464514, -1.036378, 0.8431373, 1, 0, 1,
-0.8389744, 1.220259, -0.3567202, 0.8352941, 1, 0, 1,
-0.8389171, -0.6049619, -3.263645, 0.8313726, 1, 0, 1,
-0.8342173, 0.371423, 0.9626926, 0.8235294, 1, 0, 1,
-0.8206678, -0.5982003, -3.333955, 0.8196079, 1, 0, 1,
-0.8158823, -1.091129, -3.142268, 0.8117647, 1, 0, 1,
-0.8125468, 1.01808, 0.6242403, 0.8078431, 1, 0, 1,
-0.8089449, 1.528493, -0.3982602, 0.8, 1, 0, 1,
-0.8053002, -0.9457753, -1.818203, 0.7921569, 1, 0, 1,
-0.8031338, -0.3968228, -0.7705408, 0.7882353, 1, 0, 1,
-0.7944757, 1.460255, 0.5644342, 0.7803922, 1, 0, 1,
-0.7856907, -1.611518, -1.981297, 0.7764706, 1, 0, 1,
-0.7852021, 0.4603825, -2.221091, 0.7686275, 1, 0, 1,
-0.7781987, -0.9228104, -3.627155, 0.7647059, 1, 0, 1,
-0.7667345, 1.062159, -1.196408, 0.7568628, 1, 0, 1,
-0.75939, 8.308176e-05, -1.823713, 0.7529412, 1, 0, 1,
-0.757391, -0.1328773, 0.2733504, 0.7450981, 1, 0, 1,
-0.7569725, 1.809408, 0.6261104, 0.7411765, 1, 0, 1,
-0.7542762, 1.051211, -0.1911644, 0.7333333, 1, 0, 1,
-0.749982, -2.420317, -2.579714, 0.7294118, 1, 0, 1,
-0.74914, 0.4672923, 1.283941, 0.7215686, 1, 0, 1,
-0.7484069, 1.044172, -1.060275, 0.7176471, 1, 0, 1,
-0.7406673, -0.1848738, -2.13186, 0.7098039, 1, 0, 1,
-0.7375452, 0.7548847, -0.3654853, 0.7058824, 1, 0, 1,
-0.7292752, 0.2698149, -1.024195, 0.6980392, 1, 0, 1,
-0.7290436, -1.724725, -1.202219, 0.6901961, 1, 0, 1,
-0.7282503, -1.184737, -2.377222, 0.6862745, 1, 0, 1,
-0.7269877, 0.5263879, -2.809249, 0.6784314, 1, 0, 1,
-0.7261264, 0.9050921, 0.5001412, 0.6745098, 1, 0, 1,
-0.7187654, -0.2229565, -0.8430012, 0.6666667, 1, 0, 1,
-0.7103181, -0.5087716, -2.576078, 0.6627451, 1, 0, 1,
-0.7077171, -0.9924657, -1.649775, 0.654902, 1, 0, 1,
-0.7067357, 0.4870055, -0.4616187, 0.6509804, 1, 0, 1,
-0.7046127, 0.4389252, -1.620164, 0.6431373, 1, 0, 1,
-0.6691681, 0.2698203, -1.185536, 0.6392157, 1, 0, 1,
-0.6678894, -0.4855036, -2.008255, 0.6313726, 1, 0, 1,
-0.6631085, -1.794511, -2.07437, 0.627451, 1, 0, 1,
-0.6610219, -1.124094, -2.312411, 0.6196079, 1, 0, 1,
-0.6602324, -0.1937992, -0.5788172, 0.6156863, 1, 0, 1,
-0.6527958, -1.641551, -1.690707, 0.6078432, 1, 0, 1,
-0.6489458, 1.064661, -1.311582, 0.6039216, 1, 0, 1,
-0.6476092, -0.1690544, -1.956678, 0.5960785, 1, 0, 1,
-0.6402512, 0.2283406, -1.355749, 0.5882353, 1, 0, 1,
-0.6390356, 1.43999, 1.053564, 0.5843138, 1, 0, 1,
-0.6382777, -1.394012, -3.483098, 0.5764706, 1, 0, 1,
-0.6275563, -0.3133501, -2.596405, 0.572549, 1, 0, 1,
-0.6267167, -0.08104318, -1.168513, 0.5647059, 1, 0, 1,
-0.6265164, -0.478391, -1.33162, 0.5607843, 1, 0, 1,
-0.6235744, 0.3515565, -2.600419, 0.5529412, 1, 0, 1,
-0.6230372, 0.7001988, -0.5722545, 0.5490196, 1, 0, 1,
-0.6227391, -0.7677262, -1.719459, 0.5411765, 1, 0, 1,
-0.620864, -0.03250492, -1.108958, 0.5372549, 1, 0, 1,
-0.618682, -0.2885254, -1.84339, 0.5294118, 1, 0, 1,
-0.6159616, -0.2987127, -1.901991, 0.5254902, 1, 0, 1,
-0.6154581, 2.348654, 1.528569, 0.5176471, 1, 0, 1,
-0.6154274, 0.6979939, -0.6674452, 0.5137255, 1, 0, 1,
-0.6143498, -1.559319, -4.174009, 0.5058824, 1, 0, 1,
-0.6068907, 0.7924494, -0.4545677, 0.5019608, 1, 0, 1,
-0.6018502, -0.08347305, -1.909077, 0.4941176, 1, 0, 1,
-0.599199, 0.723266, 0.3603665, 0.4862745, 1, 0, 1,
-0.5978284, -0.8469502, -2.346509, 0.4823529, 1, 0, 1,
-0.5973349, 0.9613959, 0.6431275, 0.4745098, 1, 0, 1,
-0.5917922, -0.2794095, -0.6965634, 0.4705882, 1, 0, 1,
-0.5874554, -0.2104274, -1.679852, 0.4627451, 1, 0, 1,
-0.5834754, -0.9468168, -3.054089, 0.4588235, 1, 0, 1,
-0.5780278, -0.6131565, -3.774998, 0.4509804, 1, 0, 1,
-0.5769704, -0.4963681, -2.704135, 0.4470588, 1, 0, 1,
-0.5765573, -1.082637, -2.019428, 0.4392157, 1, 0, 1,
-0.5739201, 1.641177, -1.049347, 0.4352941, 1, 0, 1,
-0.5702136, -0.1254465, -2.959696, 0.427451, 1, 0, 1,
-0.5673853, 0.6164713, -0.04537952, 0.4235294, 1, 0, 1,
-0.5625702, -0.5703512, -1.779894, 0.4156863, 1, 0, 1,
-0.5572332, 1.202387, -1.031388, 0.4117647, 1, 0, 1,
-0.5568086, -0.9159757, -2.888343, 0.4039216, 1, 0, 1,
-0.5549272, -0.8887373, -1.782909, 0.3960784, 1, 0, 1,
-0.5513731, 0.4618348, -0.4917012, 0.3921569, 1, 0, 1,
-0.5508271, -1.3161, -4.124763, 0.3843137, 1, 0, 1,
-0.5505545, 0.307739, 0.08525828, 0.3803922, 1, 0, 1,
-0.5495426, -1.339928, -4.377486, 0.372549, 1, 0, 1,
-0.5482348, -1.022263, -3.140729, 0.3686275, 1, 0, 1,
-0.5436457, 0.8945609, 0.4974713, 0.3607843, 1, 0, 1,
-0.5391908, 0.3828254, 1.649458, 0.3568628, 1, 0, 1,
-0.5328438, -0.7890287, -2.126066, 0.3490196, 1, 0, 1,
-0.5305966, 0.9737419, -0.2576015, 0.345098, 1, 0, 1,
-0.5276433, 1.835503, -0.0265034, 0.3372549, 1, 0, 1,
-0.5224091, 0.298543, -1.152849, 0.3333333, 1, 0, 1,
-0.5199162, -0.9985317, -2.545541, 0.3254902, 1, 0, 1,
-0.5185471, 0.7084541, -0.9444233, 0.3215686, 1, 0, 1,
-0.5182174, -0.5015929, -1.27579, 0.3137255, 1, 0, 1,
-0.5120127, 2.019331, 0.201918, 0.3098039, 1, 0, 1,
-0.5074418, 1.489663, 0.4729689, 0.3019608, 1, 0, 1,
-0.5019847, -0.5590727, -2.590826, 0.2941177, 1, 0, 1,
-0.5006427, 0.3377065, -1.097398, 0.2901961, 1, 0, 1,
-0.4912596, 1.249184, -0.9666433, 0.282353, 1, 0, 1,
-0.4906455, -0.4505767, -3.035104, 0.2784314, 1, 0, 1,
-0.4901677, -1.013507, -3.019132, 0.2705882, 1, 0, 1,
-0.4835522, 1.011059, -1.081776, 0.2666667, 1, 0, 1,
-0.4823467, 0.1360824, -2.051581, 0.2588235, 1, 0, 1,
-0.4805116, -1.676377, -2.527636, 0.254902, 1, 0, 1,
-0.4804547, -1.945345, -1.76768, 0.2470588, 1, 0, 1,
-0.4736197, 0.4347421, 0.2771801, 0.2431373, 1, 0, 1,
-0.4716868, 0.3984857, -1.139523, 0.2352941, 1, 0, 1,
-0.4709435, 0.8333378, -1.351451, 0.2313726, 1, 0, 1,
-0.4698039, -2.131135, -3.566725, 0.2235294, 1, 0, 1,
-0.4627029, -0.4210324, -1.093075, 0.2196078, 1, 0, 1,
-0.4624755, -1.541432, -3.481065, 0.2117647, 1, 0, 1,
-0.4591841, 0.293115, -1.685038, 0.2078431, 1, 0, 1,
-0.4577714, 0.48466, 0.9173498, 0.2, 1, 0, 1,
-0.4576246, -1.734123, -2.540761, 0.1921569, 1, 0, 1,
-0.4544061, 0.004331345, -0.3500999, 0.1882353, 1, 0, 1,
-0.4515099, -0.4106103, -1.443848, 0.1803922, 1, 0, 1,
-0.4462607, -0.874994, -3.486929, 0.1764706, 1, 0, 1,
-0.4462295, 1.153028, 0.9747348, 0.1686275, 1, 0, 1,
-0.443652, -1.352237, -2.216214, 0.1647059, 1, 0, 1,
-0.4435216, -0.5160994, -1.44491, 0.1568628, 1, 0, 1,
-0.4435042, -0.4309092, -0.07125463, 0.1529412, 1, 0, 1,
-0.4428593, 1.853877, -0.090588, 0.145098, 1, 0, 1,
-0.4417371, -0.4802938, -4.493158, 0.1411765, 1, 0, 1,
-0.4320809, 1.172626, -1.314469, 0.1333333, 1, 0, 1,
-0.4291486, 0.978874, -0.9835832, 0.1294118, 1, 0, 1,
-0.4274053, -2.578875, -2.254753, 0.1215686, 1, 0, 1,
-0.4269666, 1.71494, 0.9512175, 0.1176471, 1, 0, 1,
-0.4251292, 0.9654487, -1.939139, 0.1098039, 1, 0, 1,
-0.4248108, 0.1299947, -0.144965, 0.1058824, 1, 0, 1,
-0.4247738, 1.822632, 0.8038098, 0.09803922, 1, 0, 1,
-0.4170636, -0.9426841, -2.853244, 0.09019608, 1, 0, 1,
-0.415222, 0.3246026, 0.211859, 0.08627451, 1, 0, 1,
-0.4108124, 0.7455464, -0.8915088, 0.07843138, 1, 0, 1,
-0.4103484, -0.6120925, -2.717919, 0.07450981, 1, 0, 1,
-0.4068423, -0.2752806, -3.535859, 0.06666667, 1, 0, 1,
-0.4040146, -0.3918892, -3.006388, 0.0627451, 1, 0, 1,
-0.4022291, -0.5164089, -0.4988333, 0.05490196, 1, 0, 1,
-0.4014471, 1.022669, -1.281118, 0.05098039, 1, 0, 1,
-0.4001979, -0.1431971, -1.140185, 0.04313726, 1, 0, 1,
-0.3879802, 0.5064709, -0.2542567, 0.03921569, 1, 0, 1,
-0.3865809, 1.085043, -0.5555387, 0.03137255, 1, 0, 1,
-0.3865047, -0.3157144, -1.906439, 0.02745098, 1, 0, 1,
-0.383933, -0.5648431, -2.140725, 0.01960784, 1, 0, 1,
-0.381731, 0.7941737, -0.02836008, 0.01568628, 1, 0, 1,
-0.3781367, 0.5838277, -1.730736, 0.007843138, 1, 0, 1,
-0.3761066, -2.534578, -3.253312, 0.003921569, 1, 0, 1,
-0.3756179, -1.108962, -1.996813, 0, 1, 0.003921569, 1,
-0.3741921, -0.2216948, -1.064781, 0, 1, 0.01176471, 1,
-0.3738074, -1.046524, -2.078324, 0, 1, 0.01568628, 1,
-0.3735501, -1.782826, -2.412094, 0, 1, 0.02352941, 1,
-0.3716652, 0.8700635, -1.846483, 0, 1, 0.02745098, 1,
-0.3678339, -0.6393985, -2.266407, 0, 1, 0.03529412, 1,
-0.3667587, -0.623016, -2.426163, 0, 1, 0.03921569, 1,
-0.3662903, 0.8622486, 1.542196, 0, 1, 0.04705882, 1,
-0.3605374, -0.6942587, -1.541492, 0, 1, 0.05098039, 1,
-0.358032, 0.7275699, 0.2059433, 0, 1, 0.05882353, 1,
-0.3514119, 0.2449267, -1.591949, 0, 1, 0.0627451, 1,
-0.3508542, 0.210907, -0.4715397, 0, 1, 0.07058824, 1,
-0.3496053, -1.576859, -2.833678, 0, 1, 0.07450981, 1,
-0.3494807, 0.9107477, -0.9789141, 0, 1, 0.08235294, 1,
-0.3477199, 0.3294495, -1.236006, 0, 1, 0.08627451, 1,
-0.3453992, 1.020326, -0.764123, 0, 1, 0.09411765, 1,
-0.3452369, -0.8036809, -1.729923, 0, 1, 0.1019608, 1,
-0.3451599, -0.6358567, -3.230068, 0, 1, 0.1058824, 1,
-0.3431535, -1.796097, -2.571754, 0, 1, 0.1137255, 1,
-0.3412929, -0.1006359, -2.531039, 0, 1, 0.1176471, 1,
-0.3357718, -0.9598295, -3.064528, 0, 1, 0.1254902, 1,
-0.3356692, -0.7396218, -5.079876, 0, 1, 0.1294118, 1,
-0.3319423, 0.629292, -1.535697, 0, 1, 0.1372549, 1,
-0.3300588, -1.413307, -1.6856, 0, 1, 0.1411765, 1,
-0.3300362, 1.333468, -0.202693, 0, 1, 0.1490196, 1,
-0.32941, 0.1626104, -1.370254, 0, 1, 0.1529412, 1,
-0.324427, -0.08204386, -0.1495546, 0, 1, 0.1607843, 1,
-0.3243253, 0.3741177, -0.7261492, 0, 1, 0.1647059, 1,
-0.3240338, 1.263212, 0.5049996, 0, 1, 0.172549, 1,
-0.3224924, 0.6391987, 0.9229387, 0, 1, 0.1764706, 1,
-0.318086, -0.9116181, -2.326324, 0, 1, 0.1843137, 1,
-0.3123159, -0.2360496, -3.071101, 0, 1, 0.1882353, 1,
-0.3120386, -0.6174923, -2.608676, 0, 1, 0.1960784, 1,
-0.3118267, -0.8740441, -2.81316, 0, 1, 0.2039216, 1,
-0.3114101, -0.3426806, -4.111099, 0, 1, 0.2078431, 1,
-0.3043391, 0.2000855, -0.1059228, 0, 1, 0.2156863, 1,
-0.3006801, -0.6118681, -2.210295, 0, 1, 0.2196078, 1,
-0.3006384, -1.084757, -2.195329, 0, 1, 0.227451, 1,
-0.2983511, -1.907194, -2.174851, 0, 1, 0.2313726, 1,
-0.2846657, 1.169425, -0.7920777, 0, 1, 0.2392157, 1,
-0.2832289, 1.096846, 1.092307, 0, 1, 0.2431373, 1,
-0.2826877, 0.9452944, -0.4331075, 0, 1, 0.2509804, 1,
-0.2769798, 0.1861615, -0.7645382, 0, 1, 0.254902, 1,
-0.2761946, 0.1658897, -1.580706, 0, 1, 0.2627451, 1,
-0.2738563, -1.349801, -2.337327, 0, 1, 0.2666667, 1,
-0.2667498, 1.271219, -0.9003763, 0, 1, 0.2745098, 1,
-0.265159, 0.3323394, -1.655782, 0, 1, 0.2784314, 1,
-0.2611737, 0.1238358, 0.1221741, 0, 1, 0.2862745, 1,
-0.2588099, 1.183057, -0.3503353, 0, 1, 0.2901961, 1,
-0.2537773, -0.1699996, -3.603476, 0, 1, 0.2980392, 1,
-0.2528635, 0.6874413, 0.5227726, 0, 1, 0.3058824, 1,
-0.2490595, 1.204666, -0.2916453, 0, 1, 0.3098039, 1,
-0.247931, -2.231797, -2.469359, 0, 1, 0.3176471, 1,
-0.2447828, -1.217897, -4.148312, 0, 1, 0.3215686, 1,
-0.2432073, 1.084329, -0.4220499, 0, 1, 0.3294118, 1,
-0.2419524, -1.227747, -2.209018, 0, 1, 0.3333333, 1,
-0.2387086, -1.671084, -2.89671, 0, 1, 0.3411765, 1,
-0.2375759, 0.3783242, -0.5360503, 0, 1, 0.345098, 1,
-0.2349069, -1.280765, -4.773432, 0, 1, 0.3529412, 1,
-0.2346047, -2.069837, -3.713832, 0, 1, 0.3568628, 1,
-0.2340952, -1.487359, -0.8520114, 0, 1, 0.3647059, 1,
-0.2302384, -0.609243, -2.985784, 0, 1, 0.3686275, 1,
-0.2284597, -2.336595, -2.572972, 0, 1, 0.3764706, 1,
-0.2267421, -0.6102867, -4.215266, 0, 1, 0.3803922, 1,
-0.225937, -0.2107413, -2.526648, 0, 1, 0.3882353, 1,
-0.2258006, -0.6740479, -2.864406, 0, 1, 0.3921569, 1,
-0.2256741, -0.8164572, -3.48594, 0, 1, 0.4, 1,
-0.2251945, -0.5062466, -3.069202, 0, 1, 0.4078431, 1,
-0.2189881, 0.6008207, -2.440428, 0, 1, 0.4117647, 1,
-0.2188899, 0.4013688, -1.713628, 0, 1, 0.4196078, 1,
-0.2188715, 0.7153788, -1.256438, 0, 1, 0.4235294, 1,
-0.2173341, -1.431893, -2.069952, 0, 1, 0.4313726, 1,
-0.2150176, 1.542564, -0.6487706, 0, 1, 0.4352941, 1,
-0.2107155, 0.004757825, -2.65252, 0, 1, 0.4431373, 1,
-0.2057549, 0.590958, 1.515363, 0, 1, 0.4470588, 1,
-0.204119, -0.3977913, -2.795435, 0, 1, 0.454902, 1,
-0.2029244, 0.9053257, -0.379337, 0, 1, 0.4588235, 1,
-0.2019239, 1.312553, -1.423488, 0, 1, 0.4666667, 1,
-0.1988883, -0.5772635, -1.168179, 0, 1, 0.4705882, 1,
-0.1987298, -0.2146595, -2.756639, 0, 1, 0.4784314, 1,
-0.1984846, -0.7096885, -3.243688, 0, 1, 0.4823529, 1,
-0.181904, -1.567437, -1.368163, 0, 1, 0.4901961, 1,
-0.1816364, -0.02034614, -0.622655, 0, 1, 0.4941176, 1,
-0.1787341, 0.05285702, -1.124532, 0, 1, 0.5019608, 1,
-0.1752766, -1.510432, -2.337583, 0, 1, 0.509804, 1,
-0.1737932, 1.294348, 0.8585795, 0, 1, 0.5137255, 1,
-0.1732164, 0.4894549, -0.2175663, 0, 1, 0.5215687, 1,
-0.172674, -0.8272957, -4.216486, 0, 1, 0.5254902, 1,
-0.1704224, 0.1278324, -1.368776, 0, 1, 0.5333334, 1,
-0.1685434, -0.9550085, -4.696724, 0, 1, 0.5372549, 1,
-0.1681831, -0.3788491, -2.240136, 0, 1, 0.5450981, 1,
-0.1675158, 0.3466476, -0.163297, 0, 1, 0.5490196, 1,
-0.1674906, 0.01259752, -1.709157, 0, 1, 0.5568628, 1,
-0.1617903, 0.6013218, 0.9064258, 0, 1, 0.5607843, 1,
-0.1599022, -0.1835472, -1.607762, 0, 1, 0.5686275, 1,
-0.1598893, -1.332705, -1.007065, 0, 1, 0.572549, 1,
-0.1577852, -0.885693, -2.352405, 0, 1, 0.5803922, 1,
-0.1530952, 2.143718, -0.3079841, 0, 1, 0.5843138, 1,
-0.1525299, 0.820197, 0.344562, 0, 1, 0.5921569, 1,
-0.1502035, 0.6243306, -1.03446, 0, 1, 0.5960785, 1,
-0.1498545, -0.7075974, -1.230795, 0, 1, 0.6039216, 1,
-0.1488619, 0.7298266, 0.450871, 0, 1, 0.6117647, 1,
-0.1471311, -1.10695, -2.17852, 0, 1, 0.6156863, 1,
-0.1462369, -0.2950894, -2.852722, 0, 1, 0.6235294, 1,
-0.1457413, -0.4541224, -0.6791221, 0, 1, 0.627451, 1,
-0.1453486, 0.2118077, -2.047352, 0, 1, 0.6352941, 1,
-0.143143, -1.150032, -4.373677, 0, 1, 0.6392157, 1,
-0.1397662, -0.7827167, -1.251592, 0, 1, 0.6470588, 1,
-0.1394827, 0.1125019, -0.07396324, 0, 1, 0.6509804, 1,
-0.1387448, -0.1043697, -2.331121, 0, 1, 0.6588235, 1,
-0.1361868, -1.038961, -3.804387, 0, 1, 0.6627451, 1,
-0.1350851, -0.2855532, -2.765043, 0, 1, 0.6705883, 1,
-0.1305335, -0.2096881, -2.040805, 0, 1, 0.6745098, 1,
-0.1296494, -0.7510841, -3.948354, 0, 1, 0.682353, 1,
-0.1254685, -0.139302, -3.04861, 0, 1, 0.6862745, 1,
-0.1233598, 0.2693267, -0.5302685, 0, 1, 0.6941177, 1,
-0.1231141, 0.8452353, 1.275158, 0, 1, 0.7019608, 1,
-0.1184163, 0.03172379, -1.309897, 0, 1, 0.7058824, 1,
-0.1162349, 0.4144278, -1.657554, 0, 1, 0.7137255, 1,
-0.1134054, -1.473602, -4.307851, 0, 1, 0.7176471, 1,
-0.1127385, 0.3831982, 0.006541611, 0, 1, 0.7254902, 1,
-0.1120706, 0.07445712, -0.5470014, 0, 1, 0.7294118, 1,
-0.105292, -1.128002, -4.035646, 0, 1, 0.7372549, 1,
-0.1019768, -0.4192564, -3.467564, 0, 1, 0.7411765, 1,
-0.09467797, -0.1833906, -1.934525, 0, 1, 0.7490196, 1,
-0.09395557, 0.6046776, 0.5195549, 0, 1, 0.7529412, 1,
-0.08850174, 0.135224, -0.7264424, 0, 1, 0.7607843, 1,
-0.08784635, -0.2027169, -2.280838, 0, 1, 0.7647059, 1,
-0.08747438, 0.3071525, -1.567703, 0, 1, 0.772549, 1,
-0.08635137, 0.1667751, 0.5328824, 0, 1, 0.7764706, 1,
-0.08429002, -0.08426991, -0.3693129, 0, 1, 0.7843137, 1,
-0.08376139, 1.427882, -0.04213225, 0, 1, 0.7882353, 1,
-0.07892913, -1.30563, -4.359671, 0, 1, 0.7960784, 1,
-0.078039, 0.9255958, 0.2806679, 0, 1, 0.8039216, 1,
-0.07713406, -0.5630411, -2.550109, 0, 1, 0.8078431, 1,
-0.07588283, -2.905031, -4.787451, 0, 1, 0.8156863, 1,
-0.07482997, 0.4720794, 0.45032, 0, 1, 0.8196079, 1,
-0.07482455, -2.071269, -2.364035, 0, 1, 0.827451, 1,
-0.07284629, 2.084739, 1.25101, 0, 1, 0.8313726, 1,
-0.06696507, -0.6785321, -3.981728, 0, 1, 0.8392157, 1,
-0.06679498, 0.1886469, -0.2782314, 0, 1, 0.8431373, 1,
-0.06261335, 1.629569, 1.933371, 0, 1, 0.8509804, 1,
-0.05843522, 0.5043557, -0.111424, 0, 1, 0.854902, 1,
-0.05762961, 1.206602, -0.8508492, 0, 1, 0.8627451, 1,
-0.05681405, -1.557613, -2.605826, 0, 1, 0.8666667, 1,
-0.05167414, -0.4608462, -3.244846, 0, 1, 0.8745098, 1,
-0.04616465, -1.442964, -4.366796, 0, 1, 0.8784314, 1,
-0.04355886, 0.04591863, 0.1888676, 0, 1, 0.8862745, 1,
-0.0416641, -1.436893, -3.644068, 0, 1, 0.8901961, 1,
-0.03673574, 0.6543694, -1.355021, 0, 1, 0.8980392, 1,
-0.03591665, 0.8686426, -0.4229433, 0, 1, 0.9058824, 1,
-0.03532034, -0.2334243, -3.193722, 0, 1, 0.9098039, 1,
-0.03200664, -0.8840979, -3.68264, 0, 1, 0.9176471, 1,
-0.02757844, 0.7363528, -0.4172014, 0, 1, 0.9215686, 1,
-0.02367632, -1.382675, -3.485298, 0, 1, 0.9294118, 1,
-0.02359814, 0.7697236, -0.3163124, 0, 1, 0.9333333, 1,
-0.0214199, -0.7547672, -2.932503, 0, 1, 0.9411765, 1,
-0.01941592, 0.1677779, 0.5710924, 0, 1, 0.945098, 1,
-0.01842319, -0.9243757, -3.131151, 0, 1, 0.9529412, 1,
-0.0129403, 0.8775768, 2.83358, 0, 1, 0.9568627, 1,
-0.01169475, -0.4507692, -2.632596, 0, 1, 0.9647059, 1,
-0.01160581, -1.287827, -1.979036, 0, 1, 0.9686275, 1,
-0.006868844, -1.04667, -1.83642, 0, 1, 0.9764706, 1,
-0.004922221, 0.7347764, 3.132622, 0, 1, 0.9803922, 1,
-0.002417793, 0.4161178, 0.5765315, 0, 1, 0.9882353, 1,
-0.001586935, -0.3233526, -3.104718, 0, 1, 0.9921569, 1,
0.0003695149, -1.460051, 2.750388, 0, 1, 1, 1,
0.001591052, 0.7369667, 1.50402, 0, 0.9921569, 1, 1,
0.003324138, -0.599297, 3.928335, 0, 0.9882353, 1, 1,
0.005699382, 0.2769589, 2.158867, 0, 0.9803922, 1, 1,
0.005949295, -1.448935, 5.063299, 0, 0.9764706, 1, 1,
0.01506133, 0.313878, 0.5002838, 0, 0.9686275, 1, 1,
0.01559994, 0.8164604, -0.4894224, 0, 0.9647059, 1, 1,
0.01571595, 0.9484777, -1.071185, 0, 0.9568627, 1, 1,
0.01710657, -0.842567, 2.144778, 0, 0.9529412, 1, 1,
0.01862656, 0.6121252, 0.5750126, 0, 0.945098, 1, 1,
0.01887064, 0.3482805, 1.336175, 0, 0.9411765, 1, 1,
0.01984639, -0.6211408, 4.558395, 0, 0.9333333, 1, 1,
0.02027723, -0.3409388, 2.378235, 0, 0.9294118, 1, 1,
0.02475269, 0.5553535, -0.410811, 0, 0.9215686, 1, 1,
0.02681347, -0.2044211, 2.57588, 0, 0.9176471, 1, 1,
0.02701522, -0.5799558, 2.238218, 0, 0.9098039, 1, 1,
0.02994577, -0.3113575, 2.85728, 0, 0.9058824, 1, 1,
0.03052038, 0.7630913, 1.008467, 0, 0.8980392, 1, 1,
0.03128822, -0.7445956, 2.58745, 0, 0.8901961, 1, 1,
0.03488653, 0.2771819, -0.2634343, 0, 0.8862745, 1, 1,
0.03728561, 0.5836253, -0.1453991, 0, 0.8784314, 1, 1,
0.03792346, 0.4067935, -0.575919, 0, 0.8745098, 1, 1,
0.04007405, -0.6275941, 1.662769, 0, 0.8666667, 1, 1,
0.0418001, -0.2271352, 3.669081, 0, 0.8627451, 1, 1,
0.04654684, 0.3487797, 2.396048, 0, 0.854902, 1, 1,
0.05164489, 0.6733255, 1.496054, 0, 0.8509804, 1, 1,
0.05713437, -0.8763639, 1.997921, 0, 0.8431373, 1, 1,
0.05733432, 0.2479816, 1.245857, 0, 0.8392157, 1, 1,
0.0596443, 0.4520704, -0.3786763, 0, 0.8313726, 1, 1,
0.06358548, -0.9980336, 4.202978, 0, 0.827451, 1, 1,
0.06414224, 1.003302, -1.088573, 0, 0.8196079, 1, 1,
0.0662071, 0.3798027, -0.6776236, 0, 0.8156863, 1, 1,
0.06904599, 0.5394135, 1.293891, 0, 0.8078431, 1, 1,
0.07024142, -0.002609993, 0.9276121, 0, 0.8039216, 1, 1,
0.07844211, -1.216486, 3.73631, 0, 0.7960784, 1, 1,
0.07858945, -0.8453703, 3.26516, 0, 0.7882353, 1, 1,
0.08852611, -0.02975498, 2.002612, 0, 0.7843137, 1, 1,
0.09030913, 0.6621611, -0.4004001, 0, 0.7764706, 1, 1,
0.0919797, 0.8968331, -0.4834003, 0, 0.772549, 1, 1,
0.09578609, -1.039198, 2.318284, 0, 0.7647059, 1, 1,
0.09749989, 0.759344, 1.773572, 0, 0.7607843, 1, 1,
0.1030476, 1.36121, -1.848902, 0, 0.7529412, 1, 1,
0.105209, -0.6641103, 2.757495, 0, 0.7490196, 1, 1,
0.1053582, -1.263181, 3.479396, 0, 0.7411765, 1, 1,
0.1091914, 1.033968, 1.25261, 0, 0.7372549, 1, 1,
0.1124179, -1.67654, 4.065667, 0, 0.7294118, 1, 1,
0.1160393, 0.7886881, 2.322481, 0, 0.7254902, 1, 1,
0.1171212, 0.8756275, 1.510185, 0, 0.7176471, 1, 1,
0.1296163, 0.6523222, -0.5665192, 0, 0.7137255, 1, 1,
0.1313258, -1.036506, 1.952954, 0, 0.7058824, 1, 1,
0.1437665, 1.710886, -0.4405063, 0, 0.6980392, 1, 1,
0.1448597, -1.728488, 1.882078, 0, 0.6941177, 1, 1,
0.145856, -1.058674, 3.431778, 0, 0.6862745, 1, 1,
0.1462962, 0.2663261, 1.897535, 0, 0.682353, 1, 1,
0.1476393, -0.06055685, 4.208131, 0, 0.6745098, 1, 1,
0.14858, -0.3529179, 2.006309, 0, 0.6705883, 1, 1,
0.1520975, 1.343348, 0.9947029, 0, 0.6627451, 1, 1,
0.1525884, 0.6621293, -1.529687, 0, 0.6588235, 1, 1,
0.1563038, 1.023461, 0.2428237, 0, 0.6509804, 1, 1,
0.1594382, -0.3460955, 4.155364, 0, 0.6470588, 1, 1,
0.1604087, -0.9743931, 1.618502, 0, 0.6392157, 1, 1,
0.1612797, -1.214439, 2.32878, 0, 0.6352941, 1, 1,
0.1665393, -0.4985089, 3.980758, 0, 0.627451, 1, 1,
0.1709549, 1.044011, 2.043711, 0, 0.6235294, 1, 1,
0.1715991, 0.9673795, 0.9911212, 0, 0.6156863, 1, 1,
0.1739579, -0.7497786, 3.665371, 0, 0.6117647, 1, 1,
0.1745088, -1.784675, 3.175609, 0, 0.6039216, 1, 1,
0.1763368, -0.6925516, 3.005846, 0, 0.5960785, 1, 1,
0.1768154, -0.1422742, 3.333502, 0, 0.5921569, 1, 1,
0.1787284, -0.4274484, 1.621653, 0, 0.5843138, 1, 1,
0.1832289, 0.2319613, 0.7413584, 0, 0.5803922, 1, 1,
0.188227, 1.046216, -1.229496, 0, 0.572549, 1, 1,
0.1883352, 0.9240987, 2.21911, 0, 0.5686275, 1, 1,
0.1908154, 0.1163823, 2.143622, 0, 0.5607843, 1, 1,
0.1911588, 1.127982, 1.704873, 0, 0.5568628, 1, 1,
0.1914686, 2.771398, 0.1266238, 0, 0.5490196, 1, 1,
0.1934742, -0.4950011, 2.199775, 0, 0.5450981, 1, 1,
0.1956998, 0.1075068, 1.5424, 0, 0.5372549, 1, 1,
0.1989499, 0.1124279, -0.3149926, 0, 0.5333334, 1, 1,
0.2011015, 0.8442541, 0.8070877, 0, 0.5254902, 1, 1,
0.2015722, 0.4357778, 1.27427, 0, 0.5215687, 1, 1,
0.2019971, -0.7132496, 3.161996, 0, 0.5137255, 1, 1,
0.2063096, 0.7223616, -0.9871841, 0, 0.509804, 1, 1,
0.2073768, -0.2980709, 3.411421, 0, 0.5019608, 1, 1,
0.2090504, -0.0677065, 3.277313, 0, 0.4941176, 1, 1,
0.2115188, -0.9094751, 1.842448, 0, 0.4901961, 1, 1,
0.2129128, -0.6082023, 3.219333, 0, 0.4823529, 1, 1,
0.2140016, 0.2399209, 0.3872035, 0, 0.4784314, 1, 1,
0.2172549, 0.7281066, 0.4119985, 0, 0.4705882, 1, 1,
0.2184482, 1.248345, -0.5201418, 0, 0.4666667, 1, 1,
0.2300926, 1.011273, -0.2223326, 0, 0.4588235, 1, 1,
0.2322165, 1.459157, -0.6197422, 0, 0.454902, 1, 1,
0.2326144, -0.6627723, 3.675109, 0, 0.4470588, 1, 1,
0.2334379, -0.8647735, 1.514837, 0, 0.4431373, 1, 1,
0.2351899, -0.1288815, 1.852803, 0, 0.4352941, 1, 1,
0.2410222, -1.022003, 3.53302, 0, 0.4313726, 1, 1,
0.2475322, -0.1926892, 2.402125, 0, 0.4235294, 1, 1,
0.2544858, -1.212822, 3.333765, 0, 0.4196078, 1, 1,
0.2550125, 1.059202, 1.349374, 0, 0.4117647, 1, 1,
0.2598677, 0.6888054, 0.4511206, 0, 0.4078431, 1, 1,
0.2608215, 0.4345705, 0.5906856, 0, 0.4, 1, 1,
0.2693356, 1.797275, 1.692041, 0, 0.3921569, 1, 1,
0.2707534, 1.293846, 0.6247545, 0, 0.3882353, 1, 1,
0.2707717, -1.722333, 1.943514, 0, 0.3803922, 1, 1,
0.2713209, -1.53611, 2.179751, 0, 0.3764706, 1, 1,
0.2814653, -1.916587, 2.968575, 0, 0.3686275, 1, 1,
0.2830042, 0.5122234, 0.2950449, 0, 0.3647059, 1, 1,
0.2838165, 1.750139, 0.8829692, 0, 0.3568628, 1, 1,
0.2875302, -0.06974068, 2.663749, 0, 0.3529412, 1, 1,
0.2899665, -0.4916975, 3.315454, 0, 0.345098, 1, 1,
0.2913497, 1.20159, 1.626683, 0, 0.3411765, 1, 1,
0.2995303, -1.364022, 4.45094, 0, 0.3333333, 1, 1,
0.3026806, 0.013401, 2.540152, 0, 0.3294118, 1, 1,
0.305462, -0.2553618, 3.126037, 0, 0.3215686, 1, 1,
0.3056225, 1.233252, 0.4338711, 0, 0.3176471, 1, 1,
0.3062327, -0.5899578, 2.971778, 0, 0.3098039, 1, 1,
0.3111317, 1.712281, 1.761989, 0, 0.3058824, 1, 1,
0.3118617, 0.9920549, -0.8879119, 0, 0.2980392, 1, 1,
0.3156015, -1.089878, 3.066326, 0, 0.2901961, 1, 1,
0.3166764, -0.586751, 3.030576, 0, 0.2862745, 1, 1,
0.3187497, -0.02495367, 1.385538, 0, 0.2784314, 1, 1,
0.3205377, -0.1016679, 1.378865, 0, 0.2745098, 1, 1,
0.3207638, 1.642088, 0.2326296, 0, 0.2666667, 1, 1,
0.3226191, 1.718885, -0.5106318, 0, 0.2627451, 1, 1,
0.3246937, -1.244031, 1.885812, 0, 0.254902, 1, 1,
0.3255658, -0.8752634, 3.221184, 0, 0.2509804, 1, 1,
0.3283221, 0.05054111, 1.183669, 0, 0.2431373, 1, 1,
0.3319545, -1.348539, 2.562964, 0, 0.2392157, 1, 1,
0.3333942, -1.772708, 1.809889, 0, 0.2313726, 1, 1,
0.3370819, -0.905688, 1.116412, 0, 0.227451, 1, 1,
0.3406845, -0.4226627, 2.702575, 0, 0.2196078, 1, 1,
0.3418722, -0.3449428, 2.933663, 0, 0.2156863, 1, 1,
0.3430583, -0.6406485, 2.741139, 0, 0.2078431, 1, 1,
0.3435718, -0.8147287, 4.466771, 0, 0.2039216, 1, 1,
0.3452267, 1.410719, 0.98874, 0, 0.1960784, 1, 1,
0.3491325, -0.6426781, 3.030125, 0, 0.1882353, 1, 1,
0.3513886, 0.911774, -0.3657827, 0, 0.1843137, 1, 1,
0.3522504, -0.06347695, 1.928082, 0, 0.1764706, 1, 1,
0.352833, -0.3801213, 2.062251, 0, 0.172549, 1, 1,
0.3539149, 0.1476896, 2.68336, 0, 0.1647059, 1, 1,
0.3556405, -1.248358, 3.955796, 0, 0.1607843, 1, 1,
0.3590185, 0.2235633, 0.9292508, 0, 0.1529412, 1, 1,
0.3634627, 0.3628749, 1.857129, 0, 0.1490196, 1, 1,
0.3675309, -0.4696858, 3.167136, 0, 0.1411765, 1, 1,
0.3675316, -1.89825, 3.841111, 0, 0.1372549, 1, 1,
0.3697603, 0.2112416, 2.620635, 0, 0.1294118, 1, 1,
0.3698089, -0.9525275, 2.919794, 0, 0.1254902, 1, 1,
0.3699589, 0.1235215, -0.7699641, 0, 0.1176471, 1, 1,
0.3786221, -0.5109494, 2.823387, 0, 0.1137255, 1, 1,
0.3787093, -1.501329, 3.255194, 0, 0.1058824, 1, 1,
0.3791638, 0.2439196, 0.9667717, 0, 0.09803922, 1, 1,
0.3835214, -2.373174, 2.122781, 0, 0.09411765, 1, 1,
0.3844918, 0.7405167, 1.292527, 0, 0.08627451, 1, 1,
0.3863008, 0.5233046, 0.836606, 0, 0.08235294, 1, 1,
0.3865829, 0.8163453, 0.1155466, 0, 0.07450981, 1, 1,
0.3866028, -1.827617, 3.127115, 0, 0.07058824, 1, 1,
0.3870421, 0.9856551, -1.150338, 0, 0.0627451, 1, 1,
0.3895977, 1.346479, -0.6361708, 0, 0.05882353, 1, 1,
0.3901154, -1.391197, 4.150101, 0, 0.05098039, 1, 1,
0.390387, -0.4591666, 1.883433, 0, 0.04705882, 1, 1,
0.3960158, 0.6446016, -0.08384877, 0, 0.03921569, 1, 1,
0.3967003, -0.1056386, 0.7966197, 0, 0.03529412, 1, 1,
0.3973813, -0.7149811, 1.980448, 0, 0.02745098, 1, 1,
0.3993224, 2.34839, 1.441476, 0, 0.02352941, 1, 1,
0.4094719, 0.5846144, 1.767922, 0, 0.01568628, 1, 1,
0.4121273, -0.9658079, 2.22334, 0, 0.01176471, 1, 1,
0.4154558, 0.3019945, -0.08874991, 0, 0.003921569, 1, 1,
0.4174615, 0.941062, 0.1799558, 0.003921569, 0, 1, 1,
0.4186621, 0.4099046, 1.624648, 0.007843138, 0, 1, 1,
0.425159, -1.081024, 3.508226, 0.01568628, 0, 1, 1,
0.4281498, 0.1931783, 0.9209616, 0.01960784, 0, 1, 1,
0.4286475, -0.8711866, 1.993432, 0.02745098, 0, 1, 1,
0.4297845, -0.9788687, 2.816005, 0.03137255, 0, 1, 1,
0.4309694, -0.4962214, 1.786934, 0.03921569, 0, 1, 1,
0.4321328, -0.2791075, 3.205987, 0.04313726, 0, 1, 1,
0.4390693, -1.391563, 1.984421, 0.05098039, 0, 1, 1,
0.4415361, -0.2288994, 1.19744, 0.05490196, 0, 1, 1,
0.4477967, 0.03161948, 2.156698, 0.0627451, 0, 1, 1,
0.4510985, -0.3674166, 1.440561, 0.06666667, 0, 1, 1,
0.4520354, -0.8467234, 2.356873, 0.07450981, 0, 1, 1,
0.4529732, 1.552927, -1.357588, 0.07843138, 0, 1, 1,
0.4618959, 0.07691864, 1.258505, 0.08627451, 0, 1, 1,
0.4619001, -1.326547, 1.831027, 0.09019608, 0, 1, 1,
0.4630243, 0.4776867, -0.1250466, 0.09803922, 0, 1, 1,
0.4689803, -0.05118692, 1.369881, 0.1058824, 0, 1, 1,
0.4732406, -1.31586, 0.9440632, 0.1098039, 0, 1, 1,
0.4743012, 2.026675, -0.05213481, 0.1176471, 0, 1, 1,
0.4759262, -0.4946597, 2.025261, 0.1215686, 0, 1, 1,
0.4762372, -0.6496674, 2.644104, 0.1294118, 0, 1, 1,
0.4784527, -0.7539696, 3.411556, 0.1333333, 0, 1, 1,
0.478521, -0.6494516, 2.146242, 0.1411765, 0, 1, 1,
0.487475, -0.1924409, 3.281991, 0.145098, 0, 1, 1,
0.4904455, 0.8135957, -0.2657557, 0.1529412, 0, 1, 1,
0.4964357, -1.837552, 3.786773, 0.1568628, 0, 1, 1,
0.4987643, 2.417693, 3.647163, 0.1647059, 0, 1, 1,
0.5000185, 0.4924754, 1.56275, 0.1686275, 0, 1, 1,
0.5037776, -1.900057, 3.334073, 0.1764706, 0, 1, 1,
0.5083408, 0.3922638, 1.954209, 0.1803922, 0, 1, 1,
0.509735, -1.724729, 1.819066, 0.1882353, 0, 1, 1,
0.5099061, -0.2395363, 2.455308, 0.1921569, 0, 1, 1,
0.5099284, -0.3125966, 2.318552, 0.2, 0, 1, 1,
0.5112996, -0.1013915, 1.583599, 0.2078431, 0, 1, 1,
0.5152188, 0.9697759, -1.143404, 0.2117647, 0, 1, 1,
0.5214894, -1.482115, 2.776612, 0.2196078, 0, 1, 1,
0.5256705, -0.7423905, 3.032446, 0.2235294, 0, 1, 1,
0.5264304, -0.5999964, 1.43545, 0.2313726, 0, 1, 1,
0.5300196, -0.5652953, 2.786309, 0.2352941, 0, 1, 1,
0.5308239, 0.9041595, 0.3775971, 0.2431373, 0, 1, 1,
0.5327582, -1.583077, 1.626372, 0.2470588, 0, 1, 1,
0.5351101, 1.359242, 1.883958, 0.254902, 0, 1, 1,
0.5406259, 1.099757, -0.3460161, 0.2588235, 0, 1, 1,
0.5467463, 0.2554207, 1.357386, 0.2666667, 0, 1, 1,
0.5498341, -0.9743423, 2.604712, 0.2705882, 0, 1, 1,
0.5517814, -2.380352, 2.13123, 0.2784314, 0, 1, 1,
0.5551295, -0.9193334, 2.347217, 0.282353, 0, 1, 1,
0.5585492, -0.32987, 1.424787, 0.2901961, 0, 1, 1,
0.5654942, -0.4330377, 1.84398, 0.2941177, 0, 1, 1,
0.5703389, -0.6590477, 3.425848, 0.3019608, 0, 1, 1,
0.5714883, -0.0791936, 2.013373, 0.3098039, 0, 1, 1,
0.5798815, -0.4846839, 1.915123, 0.3137255, 0, 1, 1,
0.5851398, -0.6172066, 1.11904, 0.3215686, 0, 1, 1,
0.5866382, 2.660118, 1.120075, 0.3254902, 0, 1, 1,
0.5872553, -0.7796324, 1.827185, 0.3333333, 0, 1, 1,
0.5891674, 0.5556111, 0.3439634, 0.3372549, 0, 1, 1,
0.5909607, 0.516598, 1.913432, 0.345098, 0, 1, 1,
0.5962296, -0.3855422, 2.333917, 0.3490196, 0, 1, 1,
0.5968587, -0.293113, 2.108362, 0.3568628, 0, 1, 1,
0.598029, -0.3593276, 1.132245, 0.3607843, 0, 1, 1,
0.6005396, -1.582891, 3.437525, 0.3686275, 0, 1, 1,
0.6029761, -0.1713829, 1.653937, 0.372549, 0, 1, 1,
0.6043291, -0.2665214, 1.604843, 0.3803922, 0, 1, 1,
0.6060405, 1.331357, 1.71046, 0.3843137, 0, 1, 1,
0.609714, 0.4008834, -0.9388771, 0.3921569, 0, 1, 1,
0.6133852, -0.827302, 3.622711, 0.3960784, 0, 1, 1,
0.6179764, 0.5198559, -0.2485462, 0.4039216, 0, 1, 1,
0.6222434, 1.381263, -0.2095266, 0.4117647, 0, 1, 1,
0.623059, -0.4414726, 2.996324, 0.4156863, 0, 1, 1,
0.6249495, 0.8191693, -1.769547, 0.4235294, 0, 1, 1,
0.6250907, 1.140614, 0.7751219, 0.427451, 0, 1, 1,
0.6280247, -0.07391974, 2.89085, 0.4352941, 0, 1, 1,
0.6311112, -1.219642, 2.554649, 0.4392157, 0, 1, 1,
0.6330463, 0.1458642, 0.7954765, 0.4470588, 0, 1, 1,
0.6399641, 0.2338382, 1.300002, 0.4509804, 0, 1, 1,
0.6439917, -0.2732986, 1.625876, 0.4588235, 0, 1, 1,
0.645093, -0.5019997, 2.074368, 0.4627451, 0, 1, 1,
0.6480542, 0.5431492, 0.2546445, 0.4705882, 0, 1, 1,
0.6602561, 0.05670751, 2.288352, 0.4745098, 0, 1, 1,
0.6780471, 0.6937299, 1.660828, 0.4823529, 0, 1, 1,
0.6784, 1.329157, -0.2298132, 0.4862745, 0, 1, 1,
0.679686, -0.3493611, 2.748572, 0.4941176, 0, 1, 1,
0.6800089, 0.7561567, 0.1532955, 0.5019608, 0, 1, 1,
0.6823047, 0.7042344, 1.968823, 0.5058824, 0, 1, 1,
0.6876681, -0.243712, 1.691286, 0.5137255, 0, 1, 1,
0.6957597, 0.3833103, 0.3846413, 0.5176471, 0, 1, 1,
0.6971819, -1.246327, 4.041167, 0.5254902, 0, 1, 1,
0.6987291, 0.925719, 2.216608, 0.5294118, 0, 1, 1,
0.7022222, -0.1164175, 2.117544, 0.5372549, 0, 1, 1,
0.7069823, -1.635104, 2.774544, 0.5411765, 0, 1, 1,
0.7081882, -0.6307304, 1.862108, 0.5490196, 0, 1, 1,
0.7092668, 0.00723449, 2.071422, 0.5529412, 0, 1, 1,
0.7112083, -0.7678909, 0.6074572, 0.5607843, 0, 1, 1,
0.7169424, -0.6348, 2.342397, 0.5647059, 0, 1, 1,
0.7198183, 1.499797, 0.2070696, 0.572549, 0, 1, 1,
0.7305083, 0.8145936, 0.2788174, 0.5764706, 0, 1, 1,
0.7307336, -0.9641464, 3.489686, 0.5843138, 0, 1, 1,
0.734791, 0.4259258, 2.679252, 0.5882353, 0, 1, 1,
0.7351057, 0.2448125, 2.77537, 0.5960785, 0, 1, 1,
0.7406532, 0.3333688, 0.4934389, 0.6039216, 0, 1, 1,
0.7409428, -0.777114, 1.800641, 0.6078432, 0, 1, 1,
0.7430481, -0.5689904, 3.361662, 0.6156863, 0, 1, 1,
0.7484218, 1.179204, 0.6519315, 0.6196079, 0, 1, 1,
0.7490991, 1.459779, 0.9184673, 0.627451, 0, 1, 1,
0.7526846, 1.137974, 0.2544244, 0.6313726, 0, 1, 1,
0.7548693, -0.9789609, 1.002387, 0.6392157, 0, 1, 1,
0.7567714, 0.1199693, 2.21239, 0.6431373, 0, 1, 1,
0.7654847, -0.4076302, 1.765903, 0.6509804, 0, 1, 1,
0.7714017, 1.237732, 0.2478843, 0.654902, 0, 1, 1,
0.7726753, 0.9044473, 2.765612, 0.6627451, 0, 1, 1,
0.7779538, 2.078286, 1.394681, 0.6666667, 0, 1, 1,
0.778223, 0.293219, 2.21097, 0.6745098, 0, 1, 1,
0.7789469, -0.3456806, 2.122784, 0.6784314, 0, 1, 1,
0.7898616, 0.04893379, 3.165583, 0.6862745, 0, 1, 1,
0.7976456, -0.5240337, 0.9364733, 0.6901961, 0, 1, 1,
0.8006642, 0.67289, 1.522028, 0.6980392, 0, 1, 1,
0.8023127, -0.222441, 0.3380257, 0.7058824, 0, 1, 1,
0.8028139, -0.4145596, 1.423594, 0.7098039, 0, 1, 1,
0.8046864, 0.4392317, 1.736188, 0.7176471, 0, 1, 1,
0.8216219, -0.9043833, 1.512896, 0.7215686, 0, 1, 1,
0.8270684, 0.004365818, 2.193199, 0.7294118, 0, 1, 1,
0.8299717, 0.9653996, 2.154907, 0.7333333, 0, 1, 1,
0.8337409, 0.7055482, 0.4772755, 0.7411765, 0, 1, 1,
0.8354949, -0.1392857, 2.643742, 0.7450981, 0, 1, 1,
0.8367605, 1.959808, 0.7710736, 0.7529412, 0, 1, 1,
0.8507781, -1.696106, 2.5457, 0.7568628, 0, 1, 1,
0.8531697, 0.2263469, 1.149196, 0.7647059, 0, 1, 1,
0.8545785, -1.818088, 2.204324, 0.7686275, 0, 1, 1,
0.8581492, -1.10167, 3.66231, 0.7764706, 0, 1, 1,
0.8634815, -1.536492, 2.197849, 0.7803922, 0, 1, 1,
0.8708023, -0.6814214, 2.666575, 0.7882353, 0, 1, 1,
0.8718122, 2.262536, 0.144471, 0.7921569, 0, 1, 1,
0.8757613, 0.8923582, 0.03008389, 0.8, 0, 1, 1,
0.8761473, -0.746017, 3.007397, 0.8078431, 0, 1, 1,
0.8809482, -1.672302, 2.057739, 0.8117647, 0, 1, 1,
0.885012, 0.4598426, 1.624149, 0.8196079, 0, 1, 1,
0.8871369, -1.249464, 3.49838, 0.8235294, 0, 1, 1,
0.8948101, -0.8087509, 1.832133, 0.8313726, 0, 1, 1,
0.8964604, -0.9180962, 0.2559654, 0.8352941, 0, 1, 1,
0.9047922, 0.7202128, 0.494243, 0.8431373, 0, 1, 1,
0.9081112, 0.2201634, 1.258553, 0.8470588, 0, 1, 1,
0.9086239, 0.543982, 1.345469, 0.854902, 0, 1, 1,
0.9124044, -0.5214642, 1.852863, 0.8588235, 0, 1, 1,
0.9151146, -0.5288093, 3.250836, 0.8666667, 0, 1, 1,
0.9183367, 1.685763, 2.07579, 0.8705882, 0, 1, 1,
0.9184815, 0.09207099, 4.499272, 0.8784314, 0, 1, 1,
0.9203642, 1.690815, 0.5856994, 0.8823529, 0, 1, 1,
0.9218248, -2.143461, 3.713167, 0.8901961, 0, 1, 1,
0.9224877, 0.02350367, 1.802324, 0.8941177, 0, 1, 1,
0.9235485, 1.041194, -1.202471, 0.9019608, 0, 1, 1,
0.9246803, 2.118782, -1.467889, 0.9098039, 0, 1, 1,
0.9296775, -0.1574479, 1.452121, 0.9137255, 0, 1, 1,
0.9311715, 1.558459, 2.148479, 0.9215686, 0, 1, 1,
0.9342749, -0.06296426, 2.675751, 0.9254902, 0, 1, 1,
0.9360654, -0.4609047, 0.3014023, 0.9333333, 0, 1, 1,
0.9479902, -0.7832955, 1.667715, 0.9372549, 0, 1, 1,
0.9481547, -0.6118457, 3.165885, 0.945098, 0, 1, 1,
0.952436, 0.8636324, 1.32221, 0.9490196, 0, 1, 1,
0.9571028, 0.801492, -0.6549725, 0.9568627, 0, 1, 1,
0.9576917, -1.005489, 0.4650685, 0.9607843, 0, 1, 1,
0.9581974, -0.1573909, 2.402753, 0.9686275, 0, 1, 1,
0.9584683, -0.3944485, 2.229333, 0.972549, 0, 1, 1,
0.961215, -1.561907, 1.495106, 0.9803922, 0, 1, 1,
0.961938, -0.1618723, 1.616269, 0.9843137, 0, 1, 1,
0.9628136, -0.04580569, 1.664487, 0.9921569, 0, 1, 1,
0.9629075, -0.3485397, 2.296897, 0.9960784, 0, 1, 1,
0.9652294, -0.9794004, -0.5168566, 1, 0, 0.9960784, 1,
0.9872512, -2.497791, 2.435297, 1, 0, 0.9882353, 1,
0.9899827, 1.386353, 1.976898, 1, 0, 0.9843137, 1,
0.9969929, -0.2020658, 1.214894, 1, 0, 0.9764706, 1,
0.9997503, -1.036173, 0.9753677, 1, 0, 0.972549, 1,
0.9999102, -0.6306762, 3.882495, 1, 0, 0.9647059, 1,
1.00282, -1.664248, 0.7702486, 1, 0, 0.9607843, 1,
1.00325, 0.62408, 1.743537, 1, 0, 0.9529412, 1,
1.005231, 0.9798129, 1.579993, 1, 0, 0.9490196, 1,
1.005533, -2.100122, 3.081392, 1, 0, 0.9411765, 1,
1.010261, 2.370394, -0.3791214, 1, 0, 0.9372549, 1,
1.01547, -1.675557, 2.004251, 1, 0, 0.9294118, 1,
1.022577, 0.5502465, 0.7438698, 1, 0, 0.9254902, 1,
1.035035, -0.2341346, 0.9989684, 1, 0, 0.9176471, 1,
1.036996, 1.964262, -0.4508601, 1, 0, 0.9137255, 1,
1.045473, -0.7501039, 3.108501, 1, 0, 0.9058824, 1,
1.053524, -0.3892851, 2.141125, 1, 0, 0.9019608, 1,
1.056001, 0.0391954, 0.4562333, 1, 0, 0.8941177, 1,
1.066877, -0.7023172, 3.492524, 1, 0, 0.8862745, 1,
1.073244, -1.258746, 2.267706, 1, 0, 0.8823529, 1,
1.075685, -0.9921722, 1.384327, 1, 0, 0.8745098, 1,
1.079328, 0.1303182, 2.966012, 1, 0, 0.8705882, 1,
1.081121, -0.2560958, 0.7412366, 1, 0, 0.8627451, 1,
1.096526, 1.252093, 0.815205, 1, 0, 0.8588235, 1,
1.101102, 0.9630671, 0.5073124, 1, 0, 0.8509804, 1,
1.105738, 0.4452556, 2.222339, 1, 0, 0.8470588, 1,
1.113217, 1.006383, 2.46176, 1, 0, 0.8392157, 1,
1.114721, -0.1734238, 2.155331, 1, 0, 0.8352941, 1,
1.123583, 1.466077, -1.535347, 1, 0, 0.827451, 1,
1.127295, 0.8666731, 0.9395975, 1, 0, 0.8235294, 1,
1.12871, -0.8832424, 0.7968059, 1, 0, 0.8156863, 1,
1.130061, -0.344539, 0.560567, 1, 0, 0.8117647, 1,
1.134906, -0.2675162, 1.398551, 1, 0, 0.8039216, 1,
1.13682, -2.418085, 2.419794, 1, 0, 0.7960784, 1,
1.148991, 1.210988, 0.7399895, 1, 0, 0.7921569, 1,
1.150575, -1.060439, 1.254108, 1, 0, 0.7843137, 1,
1.155858, 1.374635, 1.588244, 1, 0, 0.7803922, 1,
1.156318, -0.1296723, 2.927918, 1, 0, 0.772549, 1,
1.160125, -0.8528346, 1.743322, 1, 0, 0.7686275, 1,
1.160402, -0.04529874, 2.954207, 1, 0, 0.7607843, 1,
1.162077, 0.1870213, 0.6407419, 1, 0, 0.7568628, 1,
1.180722, -0.05738082, 2.098694, 1, 0, 0.7490196, 1,
1.181677, 0.4952005, 1.042649, 1, 0, 0.7450981, 1,
1.18679, 1.357152, 2.127767, 1, 0, 0.7372549, 1,
1.187488, -1.294442, 1.746363, 1, 0, 0.7333333, 1,
1.194067, 0.3320196, 1.838308, 1, 0, 0.7254902, 1,
1.196525, 0.5437427, 1.287206, 1, 0, 0.7215686, 1,
1.198655, -1.265846, 1.261325, 1, 0, 0.7137255, 1,
1.213308, 2.428528, 0.9905075, 1, 0, 0.7098039, 1,
1.225751, 0.9152648, 1.505616, 1, 0, 0.7019608, 1,
1.229433, 0.4491821, 1.108061, 1, 0, 0.6941177, 1,
1.246002, 0.8764949, 1.784222, 1, 0, 0.6901961, 1,
1.253767, -0.7396296, 2.349506, 1, 0, 0.682353, 1,
1.264481, -0.3596887, 0.6524143, 1, 0, 0.6784314, 1,
1.265658, -0.3542534, 1.719038, 1, 0, 0.6705883, 1,
1.268156, 0.6391017, 1.232697, 1, 0, 0.6666667, 1,
1.268176, -1.268929, 1.435318, 1, 0, 0.6588235, 1,
1.26985, -2.34004, 2.518262, 1, 0, 0.654902, 1,
1.282181, -0.1550602, 1.525452, 1, 0, 0.6470588, 1,
1.2862, -0.9652009, 2.335418, 1, 0, 0.6431373, 1,
1.296052, -0.5423776, 1.830306, 1, 0, 0.6352941, 1,
1.29753, 1.020924, 0.7437578, 1, 0, 0.6313726, 1,
1.298829, -0.4555092, 1.351239, 1, 0, 0.6235294, 1,
1.299928, -0.7945346, 1.03884, 1, 0, 0.6196079, 1,
1.30546, -2.124526, 3.741554, 1, 0, 0.6117647, 1,
1.331786, 0.4084626, 1.293241, 1, 0, 0.6078432, 1,
1.332729, 0.4784324, 0.5522282, 1, 0, 0.6, 1,
1.341065, 0.5811568, 1.672551, 1, 0, 0.5921569, 1,
1.350654, -0.8742472, 2.609696, 1, 0, 0.5882353, 1,
1.374157, 1.362316, -0.1344796, 1, 0, 0.5803922, 1,
1.38392, -1.25792, 0.3776058, 1, 0, 0.5764706, 1,
1.390019, 0.5507997, 1.616812, 1, 0, 0.5686275, 1,
1.390702, -1.896264, 2.988234, 1, 0, 0.5647059, 1,
1.397143, 0.4022454, 1.02556, 1, 0, 0.5568628, 1,
1.39866, 0.2595594, 0.7263379, 1, 0, 0.5529412, 1,
1.407201, -0.7287514, 1.773347, 1, 0, 0.5450981, 1,
1.413636, 0.02693367, 0.1651595, 1, 0, 0.5411765, 1,
1.41548, -0.5308681, 1.162882, 1, 0, 0.5333334, 1,
1.439649, -0.08193991, 2.242967, 1, 0, 0.5294118, 1,
1.446063, -0.2233596, 3.171473, 1, 0, 0.5215687, 1,
1.446214, 0.508378, -0.192109, 1, 0, 0.5176471, 1,
1.451163, 0.2150135, 2.179916, 1, 0, 0.509804, 1,
1.456231, -0.3050861, 3.484627, 1, 0, 0.5058824, 1,
1.456311, 0.9287723, -1.191635, 1, 0, 0.4980392, 1,
1.46042, -0.2221527, 2.447352, 1, 0, 0.4901961, 1,
1.466994, 1.248069, -0.2068316, 1, 0, 0.4862745, 1,
1.468494, -0.04573072, 1.881961, 1, 0, 0.4784314, 1,
1.470061, 1.226922, 0.2519244, 1, 0, 0.4745098, 1,
1.471998, 0.204494, 1.073323, 1, 0, 0.4666667, 1,
1.478638, -0.3644421, 2.090389, 1, 0, 0.4627451, 1,
1.489706, -0.345035, 1.524048, 1, 0, 0.454902, 1,
1.491419, -1.177137, 1.898208, 1, 0, 0.4509804, 1,
1.497392, -1.248961, 0.7203954, 1, 0, 0.4431373, 1,
1.503675, -0.5152868, 1.453638, 1, 0, 0.4392157, 1,
1.511359, 0.8694609, 2.229152, 1, 0, 0.4313726, 1,
1.515908, -0.7864372, 0.8813752, 1, 0, 0.427451, 1,
1.518848, 0.8187308, 1.485535, 1, 0, 0.4196078, 1,
1.519184, -1.017426, 2.736826, 1, 0, 0.4156863, 1,
1.519271, 0.06901035, 2.210708, 1, 0, 0.4078431, 1,
1.519606, -1.818293, 0.345077, 1, 0, 0.4039216, 1,
1.548745, 2.087985, 2.530075, 1, 0, 0.3960784, 1,
1.562662, -1.972429, 4.125765, 1, 0, 0.3882353, 1,
1.577327, 1.696381, 0.08262324, 1, 0, 0.3843137, 1,
1.584489, -0.6776923, 3.061753, 1, 0, 0.3764706, 1,
1.593414, -0.5132213, 2.450165, 1, 0, 0.372549, 1,
1.606502, 0.4112275, 1.58048, 1, 0, 0.3647059, 1,
1.608049, -1.546988, 2.227043, 1, 0, 0.3607843, 1,
1.611198, 0.9872422, 2.299551, 1, 0, 0.3529412, 1,
1.611387, 0.2199872, 1.040764, 1, 0, 0.3490196, 1,
1.622176, -0.4483453, 0.7764435, 1, 0, 0.3411765, 1,
1.629746, 3.257709, 1.947269, 1, 0, 0.3372549, 1,
1.63193, 1.253037, 1.663771, 1, 0, 0.3294118, 1,
1.666023, 0.3889098, 2.301561, 1, 0, 0.3254902, 1,
1.666322, 0.8117205, 2.608427, 1, 0, 0.3176471, 1,
1.678396, -1.221766, 4.950798, 1, 0, 0.3137255, 1,
1.679485, -0.2998407, 2.143897, 1, 0, 0.3058824, 1,
1.697087, -0.3277812, 2.133107, 1, 0, 0.2980392, 1,
1.702759, 0.4974124, 0.8609381, 1, 0, 0.2941177, 1,
1.727342, 0.5189571, 1.279445, 1, 0, 0.2862745, 1,
1.738066, -1.496612, 1.3829, 1, 0, 0.282353, 1,
1.75394, 0.3602721, 1.166942, 1, 0, 0.2745098, 1,
1.758022, 0.05782292, 1.806233, 1, 0, 0.2705882, 1,
1.759262, 0.01038926, 3.471982, 1, 0, 0.2627451, 1,
1.787768, 1.028229, 1.39917, 1, 0, 0.2588235, 1,
1.833982, -0.6039738, 2.30898, 1, 0, 0.2509804, 1,
1.852855, -0.4191065, 1.53486, 1, 0, 0.2470588, 1,
1.869212, 1.999516, 0.3399655, 1, 0, 0.2392157, 1,
1.875711, 0.3618346, 1.440698, 1, 0, 0.2352941, 1,
1.909681, 0.3433902, 1.321281, 1, 0, 0.227451, 1,
1.914212, -0.4255574, 3.631199, 1, 0, 0.2235294, 1,
1.916569, 2.398988, 1.572985, 1, 0, 0.2156863, 1,
1.921687, -1.314462, 1.253881, 1, 0, 0.2117647, 1,
1.948941, -0.9169327, 3.903816, 1, 0, 0.2039216, 1,
1.97632, -1.793435, 1.207109, 1, 0, 0.1960784, 1,
1.982287, 0.5081814, 1.589351, 1, 0, 0.1921569, 1,
1.994242, 0.3734263, 1.713837, 1, 0, 0.1843137, 1,
2.000499, -0.01020364, 0.07033483, 1, 0, 0.1803922, 1,
2.017941, 0.9471865, 0.7360479, 1, 0, 0.172549, 1,
2.026327, -0.6371661, 2.843544, 1, 0, 0.1686275, 1,
2.027035, 0.06088429, 3.077394, 1, 0, 0.1607843, 1,
2.052962, 0.3419354, 0.6839306, 1, 0, 0.1568628, 1,
2.088679, 0.3204866, 2.367673, 1, 0, 0.1490196, 1,
2.117934, -1.486456, 3.137684, 1, 0, 0.145098, 1,
2.158569, 0.6406358, 1.857643, 1, 0, 0.1372549, 1,
2.178181, -0.7335836, -0.1452355, 1, 0, 0.1333333, 1,
2.208452, -1.944483, 2.301948, 1, 0, 0.1254902, 1,
2.216537, -0.7764145, 0.4831628, 1, 0, 0.1215686, 1,
2.22583, -0.6911843, 1.961329, 1, 0, 0.1137255, 1,
2.228326, -0.7727724, 0.5890561, 1, 0, 0.1098039, 1,
2.230248, 1.114079, 0.1646771, 1, 0, 0.1019608, 1,
2.252981, -0.1443314, 1.490351, 1, 0, 0.09411765, 1,
2.268046, 0.2859891, 1.294163, 1, 0, 0.09019608, 1,
2.28323, -0.3028403, 1.969959, 1, 0, 0.08235294, 1,
2.291755, 0.08543173, 0.5948305, 1, 0, 0.07843138, 1,
2.352003, -0.2278772, 0.2458379, 1, 0, 0.07058824, 1,
2.363792, 0.07834328, 2.145536, 1, 0, 0.06666667, 1,
2.397677, -0.4160179, 1.803057, 1, 0, 0.05882353, 1,
2.39933, -0.5743995, 2.679847, 1, 0, 0.05490196, 1,
2.629745, -0.7687033, 2.720003, 1, 0, 0.04705882, 1,
2.648706, -0.8728825, 2.569062, 1, 0, 0.04313726, 1,
2.760784, 0.6690833, 0.5437592, 1, 0, 0.03529412, 1,
2.812001, 1.74296, 0.8516979, 1, 0, 0.03137255, 1,
2.812334, -0.8826563, 0.5946366, 1, 0, 0.02352941, 1,
2.953574, -0.8117006, 0.3231785, 1, 0, 0.01960784, 1,
3.003895, -0.8431699, 0.5601429, 1, 0, 0.01176471, 1,
3.146758, -0.09294568, 1.667302, 1, 0, 0.007843138, 1
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
-0.3583449, -4.60903, -7.343046, 0, -0.5, 0.5, 0.5,
-0.3583449, -4.60903, -7.343046, 1, -0.5, 0.5, 0.5,
-0.3583449, -4.60903, -7.343046, 1, 1.5, 0.5, 0.5,
-0.3583449, -4.60903, -7.343046, 0, 1.5, 0.5, 0.5
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
-5.051678, -0.1055826, -7.343046, 0, -0.5, 0.5, 0.5,
-5.051678, -0.1055826, -7.343046, 1, -0.5, 0.5, 0.5,
-5.051678, -0.1055826, -7.343046, 1, 1.5, 0.5, 0.5,
-5.051678, -0.1055826, -7.343046, 0, 1.5, 0.5, 0.5
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
-5.051678, -4.60903, -0.2408247, 0, -0.5, 0.5, 0.5,
-5.051678, -4.60903, -0.2408247, 1, -0.5, 0.5, 0.5,
-5.051678, -4.60903, -0.2408247, 1, 1.5, 0.5, 0.5,
-5.051678, -4.60903, -0.2408247, 0, 1.5, 0.5, 0.5
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
-2, -3.569773, -5.704072,
2, -3.569773, -5.704072,
-2, -3.569773, -5.704072,
-2, -3.742982, -5.977234,
0, -3.569773, -5.704072,
0, -3.742982, -5.977234,
2, -3.569773, -5.704072,
2, -3.742982, -5.977234
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
-2, -4.089401, -6.523559, 0, -0.5, 0.5, 0.5,
-2, -4.089401, -6.523559, 1, -0.5, 0.5, 0.5,
-2, -4.089401, -6.523559, 1, 1.5, 0.5, 0.5,
-2, -4.089401, -6.523559, 0, 1.5, 0.5, 0.5,
0, -4.089401, -6.523559, 0, -0.5, 0.5, 0.5,
0, -4.089401, -6.523559, 1, -0.5, 0.5, 0.5,
0, -4.089401, -6.523559, 1, 1.5, 0.5, 0.5,
0, -4.089401, -6.523559, 0, 1.5, 0.5, 0.5,
2, -4.089401, -6.523559, 0, -0.5, 0.5, 0.5,
2, -4.089401, -6.523559, 1, -0.5, 0.5, 0.5,
2, -4.089401, -6.523559, 1, 1.5, 0.5, 0.5,
2, -4.089401, -6.523559, 0, 1.5, 0.5, 0.5
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
-3.968601, -3, -5.704072,
-3.968601, 3, -5.704072,
-3.968601, -3, -5.704072,
-4.149114, -3, -5.977234,
-3.968601, -2, -5.704072,
-4.149114, -2, -5.977234,
-3.968601, -1, -5.704072,
-4.149114, -1, -5.977234,
-3.968601, 0, -5.704072,
-4.149114, 0, -5.977234,
-3.968601, 1, -5.704072,
-4.149114, 1, -5.977234,
-3.968601, 2, -5.704072,
-4.149114, 2, -5.977234,
-3.968601, 3, -5.704072,
-4.149114, 3, -5.977234
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
-4.510139, -3, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, -3, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, -3, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, -3, -6.523559, 0, 1.5, 0.5, 0.5,
-4.510139, -2, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, -2, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, -2, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, -2, -6.523559, 0, 1.5, 0.5, 0.5,
-4.510139, -1, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, -1, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, -1, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, -1, -6.523559, 0, 1.5, 0.5, 0.5,
-4.510139, 0, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, 0, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, 0, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, 0, -6.523559, 0, 1.5, 0.5, 0.5,
-4.510139, 1, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, 1, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, 1, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, 1, -6.523559, 0, 1.5, 0.5, 0.5,
-4.510139, 2, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, 2, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, 2, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, 2, -6.523559, 0, 1.5, 0.5, 0.5,
-4.510139, 3, -6.523559, 0, -0.5, 0.5, 0.5,
-4.510139, 3, -6.523559, 1, -0.5, 0.5, 0.5,
-4.510139, 3, -6.523559, 1, 1.5, 0.5, 0.5,
-4.510139, 3, -6.523559, 0, 1.5, 0.5, 0.5
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
-3.968601, -3.569773, -4,
-3.968601, -3.569773, 4,
-3.968601, -3.569773, -4,
-4.149114, -3.742982, -4,
-3.968601, -3.569773, -2,
-4.149114, -3.742982, -2,
-3.968601, -3.569773, 0,
-4.149114, -3.742982, 0,
-3.968601, -3.569773, 2,
-4.149114, -3.742982, 2,
-3.968601, -3.569773, 4,
-4.149114, -3.742982, 4
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
-4.510139, -4.089401, -4, 0, -0.5, 0.5, 0.5,
-4.510139, -4.089401, -4, 1, -0.5, 0.5, 0.5,
-4.510139, -4.089401, -4, 1, 1.5, 0.5, 0.5,
-4.510139, -4.089401, -4, 0, 1.5, 0.5, 0.5,
-4.510139, -4.089401, -2, 0, -0.5, 0.5, 0.5,
-4.510139, -4.089401, -2, 1, -0.5, 0.5, 0.5,
-4.510139, -4.089401, -2, 1, 1.5, 0.5, 0.5,
-4.510139, -4.089401, -2, 0, 1.5, 0.5, 0.5,
-4.510139, -4.089401, 0, 0, -0.5, 0.5, 0.5,
-4.510139, -4.089401, 0, 1, -0.5, 0.5, 0.5,
-4.510139, -4.089401, 0, 1, 1.5, 0.5, 0.5,
-4.510139, -4.089401, 0, 0, 1.5, 0.5, 0.5,
-4.510139, -4.089401, 2, 0, -0.5, 0.5, 0.5,
-4.510139, -4.089401, 2, 1, -0.5, 0.5, 0.5,
-4.510139, -4.089401, 2, 1, 1.5, 0.5, 0.5,
-4.510139, -4.089401, 2, 0, 1.5, 0.5, 0.5,
-4.510139, -4.089401, 4, 0, -0.5, 0.5, 0.5,
-4.510139, -4.089401, 4, 1, -0.5, 0.5, 0.5,
-4.510139, -4.089401, 4, 1, 1.5, 0.5, 0.5,
-4.510139, -4.089401, 4, 0, 1.5, 0.5, 0.5
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
-3.968601, -3.569773, -5.704072,
-3.968601, 3.358608, -5.704072,
-3.968601, -3.569773, 5.222423,
-3.968601, 3.358608, 5.222423,
-3.968601, -3.569773, -5.704072,
-3.968601, -3.569773, 5.222423,
-3.968601, 3.358608, -5.704072,
-3.968601, 3.358608, 5.222423,
-3.968601, -3.569773, -5.704072,
3.251911, -3.569773, -5.704072,
-3.968601, -3.569773, 5.222423,
3.251911, -3.569773, 5.222423,
-3.968601, 3.358608, -5.704072,
3.251911, 3.358608, -5.704072,
-3.968601, 3.358608, 5.222423,
3.251911, 3.358608, 5.222423,
3.251911, -3.569773, -5.704072,
3.251911, 3.358608, -5.704072,
3.251911, -3.569773, 5.222423,
3.251911, 3.358608, 5.222423,
3.251911, -3.569773, -5.704072,
3.251911, -3.569773, 5.222423,
3.251911, 3.358608, -5.704072,
3.251911, 3.358608, 5.222423
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
var radius = 7.911685;
var distance = 35.19998;
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
mvMatrix.translate( 0.3583449, 0.1055826, 0.2408247 );
mvMatrix.scale( 1.184718, 1.234671, 0.7828923 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.19998);
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
fluthiamide<-read.table("fluthiamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluthiamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluthiamide' not found
```

```r
y<-fluthiamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluthiamide' not found
```

```r
z<-fluthiamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluthiamide' not found
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
-3.863448, -0.7518002, -0.3514426, 0, 0, 1, 1, 1,
-3.484334, 0.4393204, -1.040835, 1, 0, 0, 1, 1,
-2.936251, -3.263167, -4.627573, 1, 0, 0, 1, 1,
-2.579094, 1.105443, -1.755638, 1, 0, 0, 1, 1,
-2.520622, -0.0732567, -1.994204, 1, 0, 0, 1, 1,
-2.513841, -0.6317214, -0.2417219, 1, 0, 0, 1, 1,
-2.50773, -0.424516, -2.522711, 0, 0, 0, 1, 1,
-2.449544, -0.77289, -0.01543426, 0, 0, 0, 1, 1,
-2.335931, 0.7552857, -3.147021, 0, 0, 0, 1, 1,
-2.240865, 1.350447, -0.4481595, 0, 0, 0, 1, 1,
-2.202765, 1.015115, 0.3831504, 0, 0, 0, 1, 1,
-2.197874, -0.689396, 0.2185892, 0, 0, 0, 1, 1,
-2.189866, 0.1979464, 1.141461, 0, 0, 0, 1, 1,
-2.138204, -0.1660969, -3.169634, 1, 1, 1, 1, 1,
-2.121542, 1.027773, -0.880688, 1, 1, 1, 1, 1,
-2.100888, 0.2152231, -1.123069, 1, 1, 1, 1, 1,
-2.095701, -1.316653, -3.426308, 1, 1, 1, 1, 1,
-2.091898, -1.157009, -2.778388, 1, 1, 1, 1, 1,
-1.985398, 2.368161, 1.448636, 1, 1, 1, 1, 1,
-1.979196, 0.1669249, -3.220829, 1, 1, 1, 1, 1,
-1.917338, -1.280406, -3.282726, 1, 1, 1, 1, 1,
-1.890488, 0.7987742, 0.9400655, 1, 1, 1, 1, 1,
-1.889243, -0.3197295, -2.749824, 1, 1, 1, 1, 1,
-1.889123, 0.9437479, -0.1608779, 1, 1, 1, 1, 1,
-1.874757, -0.4525426, -2.714839, 1, 1, 1, 1, 1,
-1.861637, 0.6957083, -2.385999, 1, 1, 1, 1, 1,
-1.832976, -1.040066, -2.870046, 1, 1, 1, 1, 1,
-1.815503, -1.12176, -3.68933, 1, 1, 1, 1, 1,
-1.78362, -1.797989, -2.698406, 0, 0, 1, 1, 1,
-1.772833, -1.357414, -1.546811, 1, 0, 0, 1, 1,
-1.7727, -0.850741, -0.3207179, 1, 0, 0, 1, 1,
-1.760114, 0.3898913, -1.558052, 1, 0, 0, 1, 1,
-1.75942, -1.08716, -5.544948, 1, 0, 0, 1, 1,
-1.742685, -0.8902381, -2.942224, 1, 0, 0, 1, 1,
-1.683224, 1.725282, -1.431418, 0, 0, 0, 1, 1,
-1.676146, -0.2973228, -1.816208, 0, 0, 0, 1, 1,
-1.67183, -1.680381, -2.244589, 0, 0, 0, 1, 1,
-1.659136, 0.423359, -0.8012231, 0, 0, 0, 1, 1,
-1.653452, 1.909761, -1.290568, 0, 0, 0, 1, 1,
-1.63553, -1.141893, -2.78854, 0, 0, 0, 1, 1,
-1.63354, -0.9454105, -0.8814731, 0, 0, 0, 1, 1,
-1.540933, -0.5941171, -0.7580548, 1, 1, 1, 1, 1,
-1.538764, -0.01523763, -2.414194, 1, 1, 1, 1, 1,
-1.531586, 1.048849, -0.8190892, 1, 1, 1, 1, 1,
-1.531404, 0.1865857, -1.742278, 1, 1, 1, 1, 1,
-1.524263, 0.132871, -3.233024, 1, 1, 1, 1, 1,
-1.51033, -1.792, -2.72194, 1, 1, 1, 1, 1,
-1.502274, -0.340044, -2.886248, 1, 1, 1, 1, 1,
-1.500584, -1.271981, -1.178442, 1, 1, 1, 1, 1,
-1.497722, -0.7682436, -1.054406, 1, 1, 1, 1, 1,
-1.495987, 0.2313527, -1.238502, 1, 1, 1, 1, 1,
-1.484455, 0.7481641, -1.322882, 1, 1, 1, 1, 1,
-1.473395, 0.1383786, -1.379322, 1, 1, 1, 1, 1,
-1.463853, -1.093722, -2.76333, 1, 1, 1, 1, 1,
-1.463558, 0.08836712, -1.767768, 1, 1, 1, 1, 1,
-1.456705, 0.8355699, -0.1007869, 1, 1, 1, 1, 1,
-1.427639, 0.08401617, -0.8433979, 0, 0, 1, 1, 1,
-1.423841, 0.7296187, -0.611267, 1, 0, 0, 1, 1,
-1.405531, 0.8984374, -1.333199, 1, 0, 0, 1, 1,
-1.404537, -0.3062441, -3.145689, 1, 0, 0, 1, 1,
-1.392863, -0.1059334, -1.132217, 1, 0, 0, 1, 1,
-1.388406, 0.5340001, 0.9277418, 1, 0, 0, 1, 1,
-1.387264, 0.24013, -1.634714, 0, 0, 0, 1, 1,
-1.385828, -0.2642959, -2.912928, 0, 0, 0, 1, 1,
-1.385616, 0.3884998, -1.238529, 0, 0, 0, 1, 1,
-1.374159, -0.4518341, -2.627555, 0, 0, 0, 1, 1,
-1.368396, 0.3656739, -1.753317, 0, 0, 0, 1, 1,
-1.364128, -0.8705266, -1.614625, 0, 0, 0, 1, 1,
-1.36402, -2.06076, -1.519548, 0, 0, 0, 1, 1,
-1.355207, 1.417191, 0.2885792, 1, 1, 1, 1, 1,
-1.348356, -1.078797, -1.693057, 1, 1, 1, 1, 1,
-1.338636, -0.5349045, -1.779046, 1, 1, 1, 1, 1,
-1.338394, -0.6429038, -1.698714, 1, 1, 1, 1, 1,
-1.328217, 0.8895145, -2.335318, 1, 1, 1, 1, 1,
-1.322958, 1.033309, -1.192016, 1, 1, 1, 1, 1,
-1.309006, -0.5972323, -1.209406, 1, 1, 1, 1, 1,
-1.308674, 1.181706, -0.6109208, 1, 1, 1, 1, 1,
-1.304918, 0.7210666, -2.927232, 1, 1, 1, 1, 1,
-1.303711, -0.5711422, -3.193598, 1, 1, 1, 1, 1,
-1.287849, -1.046387, -1.93707, 1, 1, 1, 1, 1,
-1.273716, 0.455132, -0.8797985, 1, 1, 1, 1, 1,
-1.272695, 0.6542687, -0.2665863, 1, 1, 1, 1, 1,
-1.253134, -0.5266735, -2.26245, 1, 1, 1, 1, 1,
-1.252999, 0.7021759, -1.261446, 1, 1, 1, 1, 1,
-1.24764, 0.512414, -0.9477262, 0, 0, 1, 1, 1,
-1.239856, -1.495474, -2.282124, 1, 0, 0, 1, 1,
-1.23556, 0.6904855, 0.3849025, 1, 0, 0, 1, 1,
-1.222772, 0.3939138, -1.204286, 1, 0, 0, 1, 1,
-1.222206, -0.719113, -1.332293, 1, 0, 0, 1, 1,
-1.222154, -0.0002749896, 0.489181, 1, 0, 0, 1, 1,
-1.219592, 0.9319903, -0.591737, 0, 0, 0, 1, 1,
-1.219554, -0.321097, -3.25211, 0, 0, 0, 1, 1,
-1.216358, 1.007229, 0.7234496, 0, 0, 0, 1, 1,
-1.214667, -0.4686314, -1.344901, 0, 0, 0, 1, 1,
-1.211483, -1.099923, -1.490701, 0, 0, 0, 1, 1,
-1.211175, -3.468874, -3.452354, 0, 0, 0, 1, 1,
-1.207537, -0.7615221, -2.022104, 0, 0, 0, 1, 1,
-1.207339, -0.2366557, -1.640588, 1, 1, 1, 1, 1,
-1.189678, -1.217013, -1.181816, 1, 1, 1, 1, 1,
-1.169884, 0.7183858, -0.6111699, 1, 1, 1, 1, 1,
-1.169467, 0.4216573, -0.3493265, 1, 1, 1, 1, 1,
-1.164986, -1.194262, -2.273824, 1, 1, 1, 1, 1,
-1.163444, 0.5793476, -0.8893687, 1, 1, 1, 1, 1,
-1.158769, -1.555954, -1.195054, 1, 1, 1, 1, 1,
-1.156752, -0.817656, -2.982712, 1, 1, 1, 1, 1,
-1.148206, -0.516272, -0.9086396, 1, 1, 1, 1, 1,
-1.148157, 1.131232, -0.06869267, 1, 1, 1, 1, 1,
-1.147094, -0.5350744, -3.322975, 1, 1, 1, 1, 1,
-1.146956, -0.7538433, -2.177689, 1, 1, 1, 1, 1,
-1.143422, 0.8226064, -1.014963, 1, 1, 1, 1, 1,
-1.132635, -0.7211933, -3.305446, 1, 1, 1, 1, 1,
-1.132173, -0.236799, -2.209127, 1, 1, 1, 1, 1,
-1.132086, -0.4246371, -2.609827, 0, 0, 1, 1, 1,
-1.1319, -0.1519986, -2.10517, 1, 0, 0, 1, 1,
-1.129228, 0.1234674, 0.180077, 1, 0, 0, 1, 1,
-1.120337, -1.675815, -2.571533, 1, 0, 0, 1, 1,
-1.119502, -0.3812638, -2.920326, 1, 0, 0, 1, 1,
-1.119, -1.211496, -0.1288938, 1, 0, 0, 1, 1,
-1.112772, 2.065128, -1.372445, 0, 0, 0, 1, 1,
-1.109084, -0.6098316, -1.40699, 0, 0, 0, 1, 1,
-1.091753, 0.5650256, -2.502601, 0, 0, 0, 1, 1,
-1.089941, -0.6715459, -1.157014, 0, 0, 0, 1, 1,
-1.086578, -0.6488447, -2.286114, 0, 0, 0, 1, 1,
-1.084764, -1.283345, -1.595574, 0, 0, 0, 1, 1,
-1.078004, 1.552941, 1.757481, 0, 0, 0, 1, 1,
-1.068702, 1.848084, -2.42185, 1, 1, 1, 1, 1,
-1.065768, 0.8194433, -1.154867, 1, 1, 1, 1, 1,
-1.065696, -1.278924, -2.830145, 1, 1, 1, 1, 1,
-1.054694, 0.1354275, -2.078361, 1, 1, 1, 1, 1,
-1.048786, 0.8388841, -2.926189, 1, 1, 1, 1, 1,
-1.034619, -2.227185, -2.370816, 1, 1, 1, 1, 1,
-1.032266, -1.248836, -2.698004, 1, 1, 1, 1, 1,
-1.030419, -1.538833, -1.360208, 1, 1, 1, 1, 1,
-1.029594, 0.8234188, -1.718764, 1, 1, 1, 1, 1,
-1.025946, -0.55716, -2.409956, 1, 1, 1, 1, 1,
-1.025007, 1.450383, -0.563469, 1, 1, 1, 1, 1,
-1.019872, 0.5950068, -0.8216485, 1, 1, 1, 1, 1,
-1.016621, -1.094957, -1.172348, 1, 1, 1, 1, 1,
-1.014599, 1.24703, -2.225143, 1, 1, 1, 1, 1,
-1.013362, 1.368877, -0.3272696, 1, 1, 1, 1, 1,
-1.012192, 0.1899014, -1.025648, 0, 0, 1, 1, 1,
-1.0105, -0.2759525, -2.727325, 1, 0, 0, 1, 1,
-1.006405, 1.064017, -0.8809463, 1, 0, 0, 1, 1,
-1.006078, -1.637455, -4.358654, 1, 0, 0, 1, 1,
-1.005907, -1.128637, -2.050818, 1, 0, 0, 1, 1,
-1.005185, -1.210017, -2.370805, 1, 0, 0, 1, 1,
-1.00453, -1.561426, -3.140863, 0, 0, 0, 1, 1,
-1.002176, 0.2080716, -2.361072, 0, 0, 0, 1, 1,
-1.002085, -0.1221997, -2.517255, 0, 0, 0, 1, 1,
-0.9991581, -1.754836, -2.454993, 0, 0, 0, 1, 1,
-0.9977689, -1.538659, -0.9779102, 0, 0, 0, 1, 1,
-0.9920257, -1.252327, -1.944289, 0, 0, 0, 1, 1,
-0.9908195, 0.2328762, 0.04322202, 0, 0, 0, 1, 1,
-0.9887845, 1.12532, -0.7348467, 1, 1, 1, 1, 1,
-0.984465, -0.8291895, -2.336824, 1, 1, 1, 1, 1,
-0.9820902, -0.2984191, -2.036902, 1, 1, 1, 1, 1,
-0.981977, 0.2040462, -2.631157, 1, 1, 1, 1, 1,
-0.9815788, 1.042416, -2.119176, 1, 1, 1, 1, 1,
-0.980944, 1.347889, -0.5501224, 1, 1, 1, 1, 1,
-0.979853, -0.4082212, -0.6825208, 1, 1, 1, 1, 1,
-0.9796913, 0.1887157, -1.956426, 1, 1, 1, 1, 1,
-0.9789137, -1.605439, -2.201607, 1, 1, 1, 1, 1,
-0.9778714, -1.091835, -1.93497, 1, 1, 1, 1, 1,
-0.9754405, -2.021071, -0.6197124, 1, 1, 1, 1, 1,
-0.9707917, -0.5692276, -3.423432, 1, 1, 1, 1, 1,
-0.9651775, 1.240203, 0.6625927, 1, 1, 1, 1, 1,
-0.9578215, -0.7369596, -2.918355, 1, 1, 1, 1, 1,
-0.9512163, 0.2857765, 0.3107418, 1, 1, 1, 1, 1,
-0.9468837, 0.1321275, -0.7967031, 0, 0, 1, 1, 1,
-0.9465521, -0.1844107, -3.186648, 1, 0, 0, 1, 1,
-0.9399009, -0.5739, -3.050455, 1, 0, 0, 1, 1,
-0.9327343, 0.6320505, -2.212018, 1, 0, 0, 1, 1,
-0.9310921, -0.4588965, -2.382838, 1, 0, 0, 1, 1,
-0.9263084, -1.264753, -1.550348, 1, 0, 0, 1, 1,
-0.9253023, -1.986994, -3.501189, 0, 0, 0, 1, 1,
-0.9108251, 0.09918865, 0.3308368, 0, 0, 0, 1, 1,
-0.9046965, 0.9359037, -1.378643, 0, 0, 0, 1, 1,
-0.903045, 0.6614601, -1.150633, 0, 0, 0, 1, 1,
-0.8968966, 0.3512581, -0.8503743, 0, 0, 0, 1, 1,
-0.8949128, 2.757936, -1.920276, 0, 0, 0, 1, 1,
-0.8937477, -0.8795976, -2.894849, 0, 0, 0, 1, 1,
-0.8900538, 0.1697353, -1.699376, 1, 1, 1, 1, 1,
-0.8804882, -0.157428, -2.078069, 1, 1, 1, 1, 1,
-0.878282, 0.3541667, -2.609634, 1, 1, 1, 1, 1,
-0.8751715, 0.5841556, -0.3888549, 1, 1, 1, 1, 1,
-0.874644, 0.4418059, -2.218851, 1, 1, 1, 1, 1,
-0.8699413, 1.357287, -0.7132949, 1, 1, 1, 1, 1,
-0.862245, -1.099693, -0.738579, 1, 1, 1, 1, 1,
-0.85943, 1.951638, -0.1569951, 1, 1, 1, 1, 1,
-0.8594221, 0.387156, -0.02402856, 1, 1, 1, 1, 1,
-0.8556031, 1.422465, 0.2559042, 1, 1, 1, 1, 1,
-0.8546543, -1.315155, -2.820992, 1, 1, 1, 1, 1,
-0.8454678, 1.370151, -0.8802483, 1, 1, 1, 1, 1,
-0.8420595, 0.2464514, -1.036378, 1, 1, 1, 1, 1,
-0.8389744, 1.220259, -0.3567202, 1, 1, 1, 1, 1,
-0.8389171, -0.6049619, -3.263645, 1, 1, 1, 1, 1,
-0.8342173, 0.371423, 0.9626926, 0, 0, 1, 1, 1,
-0.8206678, -0.5982003, -3.333955, 1, 0, 0, 1, 1,
-0.8158823, -1.091129, -3.142268, 1, 0, 0, 1, 1,
-0.8125468, 1.01808, 0.6242403, 1, 0, 0, 1, 1,
-0.8089449, 1.528493, -0.3982602, 1, 0, 0, 1, 1,
-0.8053002, -0.9457753, -1.818203, 1, 0, 0, 1, 1,
-0.8031338, -0.3968228, -0.7705408, 0, 0, 0, 1, 1,
-0.7944757, 1.460255, 0.5644342, 0, 0, 0, 1, 1,
-0.7856907, -1.611518, -1.981297, 0, 0, 0, 1, 1,
-0.7852021, 0.4603825, -2.221091, 0, 0, 0, 1, 1,
-0.7781987, -0.9228104, -3.627155, 0, 0, 0, 1, 1,
-0.7667345, 1.062159, -1.196408, 0, 0, 0, 1, 1,
-0.75939, 8.308176e-05, -1.823713, 0, 0, 0, 1, 1,
-0.757391, -0.1328773, 0.2733504, 1, 1, 1, 1, 1,
-0.7569725, 1.809408, 0.6261104, 1, 1, 1, 1, 1,
-0.7542762, 1.051211, -0.1911644, 1, 1, 1, 1, 1,
-0.749982, -2.420317, -2.579714, 1, 1, 1, 1, 1,
-0.74914, 0.4672923, 1.283941, 1, 1, 1, 1, 1,
-0.7484069, 1.044172, -1.060275, 1, 1, 1, 1, 1,
-0.7406673, -0.1848738, -2.13186, 1, 1, 1, 1, 1,
-0.7375452, 0.7548847, -0.3654853, 1, 1, 1, 1, 1,
-0.7292752, 0.2698149, -1.024195, 1, 1, 1, 1, 1,
-0.7290436, -1.724725, -1.202219, 1, 1, 1, 1, 1,
-0.7282503, -1.184737, -2.377222, 1, 1, 1, 1, 1,
-0.7269877, 0.5263879, -2.809249, 1, 1, 1, 1, 1,
-0.7261264, 0.9050921, 0.5001412, 1, 1, 1, 1, 1,
-0.7187654, -0.2229565, -0.8430012, 1, 1, 1, 1, 1,
-0.7103181, -0.5087716, -2.576078, 1, 1, 1, 1, 1,
-0.7077171, -0.9924657, -1.649775, 0, 0, 1, 1, 1,
-0.7067357, 0.4870055, -0.4616187, 1, 0, 0, 1, 1,
-0.7046127, 0.4389252, -1.620164, 1, 0, 0, 1, 1,
-0.6691681, 0.2698203, -1.185536, 1, 0, 0, 1, 1,
-0.6678894, -0.4855036, -2.008255, 1, 0, 0, 1, 1,
-0.6631085, -1.794511, -2.07437, 1, 0, 0, 1, 1,
-0.6610219, -1.124094, -2.312411, 0, 0, 0, 1, 1,
-0.6602324, -0.1937992, -0.5788172, 0, 0, 0, 1, 1,
-0.6527958, -1.641551, -1.690707, 0, 0, 0, 1, 1,
-0.6489458, 1.064661, -1.311582, 0, 0, 0, 1, 1,
-0.6476092, -0.1690544, -1.956678, 0, 0, 0, 1, 1,
-0.6402512, 0.2283406, -1.355749, 0, 0, 0, 1, 1,
-0.6390356, 1.43999, 1.053564, 0, 0, 0, 1, 1,
-0.6382777, -1.394012, -3.483098, 1, 1, 1, 1, 1,
-0.6275563, -0.3133501, -2.596405, 1, 1, 1, 1, 1,
-0.6267167, -0.08104318, -1.168513, 1, 1, 1, 1, 1,
-0.6265164, -0.478391, -1.33162, 1, 1, 1, 1, 1,
-0.6235744, 0.3515565, -2.600419, 1, 1, 1, 1, 1,
-0.6230372, 0.7001988, -0.5722545, 1, 1, 1, 1, 1,
-0.6227391, -0.7677262, -1.719459, 1, 1, 1, 1, 1,
-0.620864, -0.03250492, -1.108958, 1, 1, 1, 1, 1,
-0.618682, -0.2885254, -1.84339, 1, 1, 1, 1, 1,
-0.6159616, -0.2987127, -1.901991, 1, 1, 1, 1, 1,
-0.6154581, 2.348654, 1.528569, 1, 1, 1, 1, 1,
-0.6154274, 0.6979939, -0.6674452, 1, 1, 1, 1, 1,
-0.6143498, -1.559319, -4.174009, 1, 1, 1, 1, 1,
-0.6068907, 0.7924494, -0.4545677, 1, 1, 1, 1, 1,
-0.6018502, -0.08347305, -1.909077, 1, 1, 1, 1, 1,
-0.599199, 0.723266, 0.3603665, 0, 0, 1, 1, 1,
-0.5978284, -0.8469502, -2.346509, 1, 0, 0, 1, 1,
-0.5973349, 0.9613959, 0.6431275, 1, 0, 0, 1, 1,
-0.5917922, -0.2794095, -0.6965634, 1, 0, 0, 1, 1,
-0.5874554, -0.2104274, -1.679852, 1, 0, 0, 1, 1,
-0.5834754, -0.9468168, -3.054089, 1, 0, 0, 1, 1,
-0.5780278, -0.6131565, -3.774998, 0, 0, 0, 1, 1,
-0.5769704, -0.4963681, -2.704135, 0, 0, 0, 1, 1,
-0.5765573, -1.082637, -2.019428, 0, 0, 0, 1, 1,
-0.5739201, 1.641177, -1.049347, 0, 0, 0, 1, 1,
-0.5702136, -0.1254465, -2.959696, 0, 0, 0, 1, 1,
-0.5673853, 0.6164713, -0.04537952, 0, 0, 0, 1, 1,
-0.5625702, -0.5703512, -1.779894, 0, 0, 0, 1, 1,
-0.5572332, 1.202387, -1.031388, 1, 1, 1, 1, 1,
-0.5568086, -0.9159757, -2.888343, 1, 1, 1, 1, 1,
-0.5549272, -0.8887373, -1.782909, 1, 1, 1, 1, 1,
-0.5513731, 0.4618348, -0.4917012, 1, 1, 1, 1, 1,
-0.5508271, -1.3161, -4.124763, 1, 1, 1, 1, 1,
-0.5505545, 0.307739, 0.08525828, 1, 1, 1, 1, 1,
-0.5495426, -1.339928, -4.377486, 1, 1, 1, 1, 1,
-0.5482348, -1.022263, -3.140729, 1, 1, 1, 1, 1,
-0.5436457, 0.8945609, 0.4974713, 1, 1, 1, 1, 1,
-0.5391908, 0.3828254, 1.649458, 1, 1, 1, 1, 1,
-0.5328438, -0.7890287, -2.126066, 1, 1, 1, 1, 1,
-0.5305966, 0.9737419, -0.2576015, 1, 1, 1, 1, 1,
-0.5276433, 1.835503, -0.0265034, 1, 1, 1, 1, 1,
-0.5224091, 0.298543, -1.152849, 1, 1, 1, 1, 1,
-0.5199162, -0.9985317, -2.545541, 1, 1, 1, 1, 1,
-0.5185471, 0.7084541, -0.9444233, 0, 0, 1, 1, 1,
-0.5182174, -0.5015929, -1.27579, 1, 0, 0, 1, 1,
-0.5120127, 2.019331, 0.201918, 1, 0, 0, 1, 1,
-0.5074418, 1.489663, 0.4729689, 1, 0, 0, 1, 1,
-0.5019847, -0.5590727, -2.590826, 1, 0, 0, 1, 1,
-0.5006427, 0.3377065, -1.097398, 1, 0, 0, 1, 1,
-0.4912596, 1.249184, -0.9666433, 0, 0, 0, 1, 1,
-0.4906455, -0.4505767, -3.035104, 0, 0, 0, 1, 1,
-0.4901677, -1.013507, -3.019132, 0, 0, 0, 1, 1,
-0.4835522, 1.011059, -1.081776, 0, 0, 0, 1, 1,
-0.4823467, 0.1360824, -2.051581, 0, 0, 0, 1, 1,
-0.4805116, -1.676377, -2.527636, 0, 0, 0, 1, 1,
-0.4804547, -1.945345, -1.76768, 0, 0, 0, 1, 1,
-0.4736197, 0.4347421, 0.2771801, 1, 1, 1, 1, 1,
-0.4716868, 0.3984857, -1.139523, 1, 1, 1, 1, 1,
-0.4709435, 0.8333378, -1.351451, 1, 1, 1, 1, 1,
-0.4698039, -2.131135, -3.566725, 1, 1, 1, 1, 1,
-0.4627029, -0.4210324, -1.093075, 1, 1, 1, 1, 1,
-0.4624755, -1.541432, -3.481065, 1, 1, 1, 1, 1,
-0.4591841, 0.293115, -1.685038, 1, 1, 1, 1, 1,
-0.4577714, 0.48466, 0.9173498, 1, 1, 1, 1, 1,
-0.4576246, -1.734123, -2.540761, 1, 1, 1, 1, 1,
-0.4544061, 0.004331345, -0.3500999, 1, 1, 1, 1, 1,
-0.4515099, -0.4106103, -1.443848, 1, 1, 1, 1, 1,
-0.4462607, -0.874994, -3.486929, 1, 1, 1, 1, 1,
-0.4462295, 1.153028, 0.9747348, 1, 1, 1, 1, 1,
-0.443652, -1.352237, -2.216214, 1, 1, 1, 1, 1,
-0.4435216, -0.5160994, -1.44491, 1, 1, 1, 1, 1,
-0.4435042, -0.4309092, -0.07125463, 0, 0, 1, 1, 1,
-0.4428593, 1.853877, -0.090588, 1, 0, 0, 1, 1,
-0.4417371, -0.4802938, -4.493158, 1, 0, 0, 1, 1,
-0.4320809, 1.172626, -1.314469, 1, 0, 0, 1, 1,
-0.4291486, 0.978874, -0.9835832, 1, 0, 0, 1, 1,
-0.4274053, -2.578875, -2.254753, 1, 0, 0, 1, 1,
-0.4269666, 1.71494, 0.9512175, 0, 0, 0, 1, 1,
-0.4251292, 0.9654487, -1.939139, 0, 0, 0, 1, 1,
-0.4248108, 0.1299947, -0.144965, 0, 0, 0, 1, 1,
-0.4247738, 1.822632, 0.8038098, 0, 0, 0, 1, 1,
-0.4170636, -0.9426841, -2.853244, 0, 0, 0, 1, 1,
-0.415222, 0.3246026, 0.211859, 0, 0, 0, 1, 1,
-0.4108124, 0.7455464, -0.8915088, 0, 0, 0, 1, 1,
-0.4103484, -0.6120925, -2.717919, 1, 1, 1, 1, 1,
-0.4068423, -0.2752806, -3.535859, 1, 1, 1, 1, 1,
-0.4040146, -0.3918892, -3.006388, 1, 1, 1, 1, 1,
-0.4022291, -0.5164089, -0.4988333, 1, 1, 1, 1, 1,
-0.4014471, 1.022669, -1.281118, 1, 1, 1, 1, 1,
-0.4001979, -0.1431971, -1.140185, 1, 1, 1, 1, 1,
-0.3879802, 0.5064709, -0.2542567, 1, 1, 1, 1, 1,
-0.3865809, 1.085043, -0.5555387, 1, 1, 1, 1, 1,
-0.3865047, -0.3157144, -1.906439, 1, 1, 1, 1, 1,
-0.383933, -0.5648431, -2.140725, 1, 1, 1, 1, 1,
-0.381731, 0.7941737, -0.02836008, 1, 1, 1, 1, 1,
-0.3781367, 0.5838277, -1.730736, 1, 1, 1, 1, 1,
-0.3761066, -2.534578, -3.253312, 1, 1, 1, 1, 1,
-0.3756179, -1.108962, -1.996813, 1, 1, 1, 1, 1,
-0.3741921, -0.2216948, -1.064781, 1, 1, 1, 1, 1,
-0.3738074, -1.046524, -2.078324, 0, 0, 1, 1, 1,
-0.3735501, -1.782826, -2.412094, 1, 0, 0, 1, 1,
-0.3716652, 0.8700635, -1.846483, 1, 0, 0, 1, 1,
-0.3678339, -0.6393985, -2.266407, 1, 0, 0, 1, 1,
-0.3667587, -0.623016, -2.426163, 1, 0, 0, 1, 1,
-0.3662903, 0.8622486, 1.542196, 1, 0, 0, 1, 1,
-0.3605374, -0.6942587, -1.541492, 0, 0, 0, 1, 1,
-0.358032, 0.7275699, 0.2059433, 0, 0, 0, 1, 1,
-0.3514119, 0.2449267, -1.591949, 0, 0, 0, 1, 1,
-0.3508542, 0.210907, -0.4715397, 0, 0, 0, 1, 1,
-0.3496053, -1.576859, -2.833678, 0, 0, 0, 1, 1,
-0.3494807, 0.9107477, -0.9789141, 0, 0, 0, 1, 1,
-0.3477199, 0.3294495, -1.236006, 0, 0, 0, 1, 1,
-0.3453992, 1.020326, -0.764123, 1, 1, 1, 1, 1,
-0.3452369, -0.8036809, -1.729923, 1, 1, 1, 1, 1,
-0.3451599, -0.6358567, -3.230068, 1, 1, 1, 1, 1,
-0.3431535, -1.796097, -2.571754, 1, 1, 1, 1, 1,
-0.3412929, -0.1006359, -2.531039, 1, 1, 1, 1, 1,
-0.3357718, -0.9598295, -3.064528, 1, 1, 1, 1, 1,
-0.3356692, -0.7396218, -5.079876, 1, 1, 1, 1, 1,
-0.3319423, 0.629292, -1.535697, 1, 1, 1, 1, 1,
-0.3300588, -1.413307, -1.6856, 1, 1, 1, 1, 1,
-0.3300362, 1.333468, -0.202693, 1, 1, 1, 1, 1,
-0.32941, 0.1626104, -1.370254, 1, 1, 1, 1, 1,
-0.324427, -0.08204386, -0.1495546, 1, 1, 1, 1, 1,
-0.3243253, 0.3741177, -0.7261492, 1, 1, 1, 1, 1,
-0.3240338, 1.263212, 0.5049996, 1, 1, 1, 1, 1,
-0.3224924, 0.6391987, 0.9229387, 1, 1, 1, 1, 1,
-0.318086, -0.9116181, -2.326324, 0, 0, 1, 1, 1,
-0.3123159, -0.2360496, -3.071101, 1, 0, 0, 1, 1,
-0.3120386, -0.6174923, -2.608676, 1, 0, 0, 1, 1,
-0.3118267, -0.8740441, -2.81316, 1, 0, 0, 1, 1,
-0.3114101, -0.3426806, -4.111099, 1, 0, 0, 1, 1,
-0.3043391, 0.2000855, -0.1059228, 1, 0, 0, 1, 1,
-0.3006801, -0.6118681, -2.210295, 0, 0, 0, 1, 1,
-0.3006384, -1.084757, -2.195329, 0, 0, 0, 1, 1,
-0.2983511, -1.907194, -2.174851, 0, 0, 0, 1, 1,
-0.2846657, 1.169425, -0.7920777, 0, 0, 0, 1, 1,
-0.2832289, 1.096846, 1.092307, 0, 0, 0, 1, 1,
-0.2826877, 0.9452944, -0.4331075, 0, 0, 0, 1, 1,
-0.2769798, 0.1861615, -0.7645382, 0, 0, 0, 1, 1,
-0.2761946, 0.1658897, -1.580706, 1, 1, 1, 1, 1,
-0.2738563, -1.349801, -2.337327, 1, 1, 1, 1, 1,
-0.2667498, 1.271219, -0.9003763, 1, 1, 1, 1, 1,
-0.265159, 0.3323394, -1.655782, 1, 1, 1, 1, 1,
-0.2611737, 0.1238358, 0.1221741, 1, 1, 1, 1, 1,
-0.2588099, 1.183057, -0.3503353, 1, 1, 1, 1, 1,
-0.2537773, -0.1699996, -3.603476, 1, 1, 1, 1, 1,
-0.2528635, 0.6874413, 0.5227726, 1, 1, 1, 1, 1,
-0.2490595, 1.204666, -0.2916453, 1, 1, 1, 1, 1,
-0.247931, -2.231797, -2.469359, 1, 1, 1, 1, 1,
-0.2447828, -1.217897, -4.148312, 1, 1, 1, 1, 1,
-0.2432073, 1.084329, -0.4220499, 1, 1, 1, 1, 1,
-0.2419524, -1.227747, -2.209018, 1, 1, 1, 1, 1,
-0.2387086, -1.671084, -2.89671, 1, 1, 1, 1, 1,
-0.2375759, 0.3783242, -0.5360503, 1, 1, 1, 1, 1,
-0.2349069, -1.280765, -4.773432, 0, 0, 1, 1, 1,
-0.2346047, -2.069837, -3.713832, 1, 0, 0, 1, 1,
-0.2340952, -1.487359, -0.8520114, 1, 0, 0, 1, 1,
-0.2302384, -0.609243, -2.985784, 1, 0, 0, 1, 1,
-0.2284597, -2.336595, -2.572972, 1, 0, 0, 1, 1,
-0.2267421, -0.6102867, -4.215266, 1, 0, 0, 1, 1,
-0.225937, -0.2107413, -2.526648, 0, 0, 0, 1, 1,
-0.2258006, -0.6740479, -2.864406, 0, 0, 0, 1, 1,
-0.2256741, -0.8164572, -3.48594, 0, 0, 0, 1, 1,
-0.2251945, -0.5062466, -3.069202, 0, 0, 0, 1, 1,
-0.2189881, 0.6008207, -2.440428, 0, 0, 0, 1, 1,
-0.2188899, 0.4013688, -1.713628, 0, 0, 0, 1, 1,
-0.2188715, 0.7153788, -1.256438, 0, 0, 0, 1, 1,
-0.2173341, -1.431893, -2.069952, 1, 1, 1, 1, 1,
-0.2150176, 1.542564, -0.6487706, 1, 1, 1, 1, 1,
-0.2107155, 0.004757825, -2.65252, 1, 1, 1, 1, 1,
-0.2057549, 0.590958, 1.515363, 1, 1, 1, 1, 1,
-0.204119, -0.3977913, -2.795435, 1, 1, 1, 1, 1,
-0.2029244, 0.9053257, -0.379337, 1, 1, 1, 1, 1,
-0.2019239, 1.312553, -1.423488, 1, 1, 1, 1, 1,
-0.1988883, -0.5772635, -1.168179, 1, 1, 1, 1, 1,
-0.1987298, -0.2146595, -2.756639, 1, 1, 1, 1, 1,
-0.1984846, -0.7096885, -3.243688, 1, 1, 1, 1, 1,
-0.181904, -1.567437, -1.368163, 1, 1, 1, 1, 1,
-0.1816364, -0.02034614, -0.622655, 1, 1, 1, 1, 1,
-0.1787341, 0.05285702, -1.124532, 1, 1, 1, 1, 1,
-0.1752766, -1.510432, -2.337583, 1, 1, 1, 1, 1,
-0.1737932, 1.294348, 0.8585795, 1, 1, 1, 1, 1,
-0.1732164, 0.4894549, -0.2175663, 0, 0, 1, 1, 1,
-0.172674, -0.8272957, -4.216486, 1, 0, 0, 1, 1,
-0.1704224, 0.1278324, -1.368776, 1, 0, 0, 1, 1,
-0.1685434, -0.9550085, -4.696724, 1, 0, 0, 1, 1,
-0.1681831, -0.3788491, -2.240136, 1, 0, 0, 1, 1,
-0.1675158, 0.3466476, -0.163297, 1, 0, 0, 1, 1,
-0.1674906, 0.01259752, -1.709157, 0, 0, 0, 1, 1,
-0.1617903, 0.6013218, 0.9064258, 0, 0, 0, 1, 1,
-0.1599022, -0.1835472, -1.607762, 0, 0, 0, 1, 1,
-0.1598893, -1.332705, -1.007065, 0, 0, 0, 1, 1,
-0.1577852, -0.885693, -2.352405, 0, 0, 0, 1, 1,
-0.1530952, 2.143718, -0.3079841, 0, 0, 0, 1, 1,
-0.1525299, 0.820197, 0.344562, 0, 0, 0, 1, 1,
-0.1502035, 0.6243306, -1.03446, 1, 1, 1, 1, 1,
-0.1498545, -0.7075974, -1.230795, 1, 1, 1, 1, 1,
-0.1488619, 0.7298266, 0.450871, 1, 1, 1, 1, 1,
-0.1471311, -1.10695, -2.17852, 1, 1, 1, 1, 1,
-0.1462369, -0.2950894, -2.852722, 1, 1, 1, 1, 1,
-0.1457413, -0.4541224, -0.6791221, 1, 1, 1, 1, 1,
-0.1453486, 0.2118077, -2.047352, 1, 1, 1, 1, 1,
-0.143143, -1.150032, -4.373677, 1, 1, 1, 1, 1,
-0.1397662, -0.7827167, -1.251592, 1, 1, 1, 1, 1,
-0.1394827, 0.1125019, -0.07396324, 1, 1, 1, 1, 1,
-0.1387448, -0.1043697, -2.331121, 1, 1, 1, 1, 1,
-0.1361868, -1.038961, -3.804387, 1, 1, 1, 1, 1,
-0.1350851, -0.2855532, -2.765043, 1, 1, 1, 1, 1,
-0.1305335, -0.2096881, -2.040805, 1, 1, 1, 1, 1,
-0.1296494, -0.7510841, -3.948354, 1, 1, 1, 1, 1,
-0.1254685, -0.139302, -3.04861, 0, 0, 1, 1, 1,
-0.1233598, 0.2693267, -0.5302685, 1, 0, 0, 1, 1,
-0.1231141, 0.8452353, 1.275158, 1, 0, 0, 1, 1,
-0.1184163, 0.03172379, -1.309897, 1, 0, 0, 1, 1,
-0.1162349, 0.4144278, -1.657554, 1, 0, 0, 1, 1,
-0.1134054, -1.473602, -4.307851, 1, 0, 0, 1, 1,
-0.1127385, 0.3831982, 0.006541611, 0, 0, 0, 1, 1,
-0.1120706, 0.07445712, -0.5470014, 0, 0, 0, 1, 1,
-0.105292, -1.128002, -4.035646, 0, 0, 0, 1, 1,
-0.1019768, -0.4192564, -3.467564, 0, 0, 0, 1, 1,
-0.09467797, -0.1833906, -1.934525, 0, 0, 0, 1, 1,
-0.09395557, 0.6046776, 0.5195549, 0, 0, 0, 1, 1,
-0.08850174, 0.135224, -0.7264424, 0, 0, 0, 1, 1,
-0.08784635, -0.2027169, -2.280838, 1, 1, 1, 1, 1,
-0.08747438, 0.3071525, -1.567703, 1, 1, 1, 1, 1,
-0.08635137, 0.1667751, 0.5328824, 1, 1, 1, 1, 1,
-0.08429002, -0.08426991, -0.3693129, 1, 1, 1, 1, 1,
-0.08376139, 1.427882, -0.04213225, 1, 1, 1, 1, 1,
-0.07892913, -1.30563, -4.359671, 1, 1, 1, 1, 1,
-0.078039, 0.9255958, 0.2806679, 1, 1, 1, 1, 1,
-0.07713406, -0.5630411, -2.550109, 1, 1, 1, 1, 1,
-0.07588283, -2.905031, -4.787451, 1, 1, 1, 1, 1,
-0.07482997, 0.4720794, 0.45032, 1, 1, 1, 1, 1,
-0.07482455, -2.071269, -2.364035, 1, 1, 1, 1, 1,
-0.07284629, 2.084739, 1.25101, 1, 1, 1, 1, 1,
-0.06696507, -0.6785321, -3.981728, 1, 1, 1, 1, 1,
-0.06679498, 0.1886469, -0.2782314, 1, 1, 1, 1, 1,
-0.06261335, 1.629569, 1.933371, 1, 1, 1, 1, 1,
-0.05843522, 0.5043557, -0.111424, 0, 0, 1, 1, 1,
-0.05762961, 1.206602, -0.8508492, 1, 0, 0, 1, 1,
-0.05681405, -1.557613, -2.605826, 1, 0, 0, 1, 1,
-0.05167414, -0.4608462, -3.244846, 1, 0, 0, 1, 1,
-0.04616465, -1.442964, -4.366796, 1, 0, 0, 1, 1,
-0.04355886, 0.04591863, 0.1888676, 1, 0, 0, 1, 1,
-0.0416641, -1.436893, -3.644068, 0, 0, 0, 1, 1,
-0.03673574, 0.6543694, -1.355021, 0, 0, 0, 1, 1,
-0.03591665, 0.8686426, -0.4229433, 0, 0, 0, 1, 1,
-0.03532034, -0.2334243, -3.193722, 0, 0, 0, 1, 1,
-0.03200664, -0.8840979, -3.68264, 0, 0, 0, 1, 1,
-0.02757844, 0.7363528, -0.4172014, 0, 0, 0, 1, 1,
-0.02367632, -1.382675, -3.485298, 0, 0, 0, 1, 1,
-0.02359814, 0.7697236, -0.3163124, 1, 1, 1, 1, 1,
-0.0214199, -0.7547672, -2.932503, 1, 1, 1, 1, 1,
-0.01941592, 0.1677779, 0.5710924, 1, 1, 1, 1, 1,
-0.01842319, -0.9243757, -3.131151, 1, 1, 1, 1, 1,
-0.0129403, 0.8775768, 2.83358, 1, 1, 1, 1, 1,
-0.01169475, -0.4507692, -2.632596, 1, 1, 1, 1, 1,
-0.01160581, -1.287827, -1.979036, 1, 1, 1, 1, 1,
-0.006868844, -1.04667, -1.83642, 1, 1, 1, 1, 1,
-0.004922221, 0.7347764, 3.132622, 1, 1, 1, 1, 1,
-0.002417793, 0.4161178, 0.5765315, 1, 1, 1, 1, 1,
-0.001586935, -0.3233526, -3.104718, 1, 1, 1, 1, 1,
0.0003695149, -1.460051, 2.750388, 1, 1, 1, 1, 1,
0.001591052, 0.7369667, 1.50402, 1, 1, 1, 1, 1,
0.003324138, -0.599297, 3.928335, 1, 1, 1, 1, 1,
0.005699382, 0.2769589, 2.158867, 1, 1, 1, 1, 1,
0.005949295, -1.448935, 5.063299, 0, 0, 1, 1, 1,
0.01506133, 0.313878, 0.5002838, 1, 0, 0, 1, 1,
0.01559994, 0.8164604, -0.4894224, 1, 0, 0, 1, 1,
0.01571595, 0.9484777, -1.071185, 1, 0, 0, 1, 1,
0.01710657, -0.842567, 2.144778, 1, 0, 0, 1, 1,
0.01862656, 0.6121252, 0.5750126, 1, 0, 0, 1, 1,
0.01887064, 0.3482805, 1.336175, 0, 0, 0, 1, 1,
0.01984639, -0.6211408, 4.558395, 0, 0, 0, 1, 1,
0.02027723, -0.3409388, 2.378235, 0, 0, 0, 1, 1,
0.02475269, 0.5553535, -0.410811, 0, 0, 0, 1, 1,
0.02681347, -0.2044211, 2.57588, 0, 0, 0, 1, 1,
0.02701522, -0.5799558, 2.238218, 0, 0, 0, 1, 1,
0.02994577, -0.3113575, 2.85728, 0, 0, 0, 1, 1,
0.03052038, 0.7630913, 1.008467, 1, 1, 1, 1, 1,
0.03128822, -0.7445956, 2.58745, 1, 1, 1, 1, 1,
0.03488653, 0.2771819, -0.2634343, 1, 1, 1, 1, 1,
0.03728561, 0.5836253, -0.1453991, 1, 1, 1, 1, 1,
0.03792346, 0.4067935, -0.575919, 1, 1, 1, 1, 1,
0.04007405, -0.6275941, 1.662769, 1, 1, 1, 1, 1,
0.0418001, -0.2271352, 3.669081, 1, 1, 1, 1, 1,
0.04654684, 0.3487797, 2.396048, 1, 1, 1, 1, 1,
0.05164489, 0.6733255, 1.496054, 1, 1, 1, 1, 1,
0.05713437, -0.8763639, 1.997921, 1, 1, 1, 1, 1,
0.05733432, 0.2479816, 1.245857, 1, 1, 1, 1, 1,
0.0596443, 0.4520704, -0.3786763, 1, 1, 1, 1, 1,
0.06358548, -0.9980336, 4.202978, 1, 1, 1, 1, 1,
0.06414224, 1.003302, -1.088573, 1, 1, 1, 1, 1,
0.0662071, 0.3798027, -0.6776236, 1, 1, 1, 1, 1,
0.06904599, 0.5394135, 1.293891, 0, 0, 1, 1, 1,
0.07024142, -0.002609993, 0.9276121, 1, 0, 0, 1, 1,
0.07844211, -1.216486, 3.73631, 1, 0, 0, 1, 1,
0.07858945, -0.8453703, 3.26516, 1, 0, 0, 1, 1,
0.08852611, -0.02975498, 2.002612, 1, 0, 0, 1, 1,
0.09030913, 0.6621611, -0.4004001, 1, 0, 0, 1, 1,
0.0919797, 0.8968331, -0.4834003, 0, 0, 0, 1, 1,
0.09578609, -1.039198, 2.318284, 0, 0, 0, 1, 1,
0.09749989, 0.759344, 1.773572, 0, 0, 0, 1, 1,
0.1030476, 1.36121, -1.848902, 0, 0, 0, 1, 1,
0.105209, -0.6641103, 2.757495, 0, 0, 0, 1, 1,
0.1053582, -1.263181, 3.479396, 0, 0, 0, 1, 1,
0.1091914, 1.033968, 1.25261, 0, 0, 0, 1, 1,
0.1124179, -1.67654, 4.065667, 1, 1, 1, 1, 1,
0.1160393, 0.7886881, 2.322481, 1, 1, 1, 1, 1,
0.1171212, 0.8756275, 1.510185, 1, 1, 1, 1, 1,
0.1296163, 0.6523222, -0.5665192, 1, 1, 1, 1, 1,
0.1313258, -1.036506, 1.952954, 1, 1, 1, 1, 1,
0.1437665, 1.710886, -0.4405063, 1, 1, 1, 1, 1,
0.1448597, -1.728488, 1.882078, 1, 1, 1, 1, 1,
0.145856, -1.058674, 3.431778, 1, 1, 1, 1, 1,
0.1462962, 0.2663261, 1.897535, 1, 1, 1, 1, 1,
0.1476393, -0.06055685, 4.208131, 1, 1, 1, 1, 1,
0.14858, -0.3529179, 2.006309, 1, 1, 1, 1, 1,
0.1520975, 1.343348, 0.9947029, 1, 1, 1, 1, 1,
0.1525884, 0.6621293, -1.529687, 1, 1, 1, 1, 1,
0.1563038, 1.023461, 0.2428237, 1, 1, 1, 1, 1,
0.1594382, -0.3460955, 4.155364, 1, 1, 1, 1, 1,
0.1604087, -0.9743931, 1.618502, 0, 0, 1, 1, 1,
0.1612797, -1.214439, 2.32878, 1, 0, 0, 1, 1,
0.1665393, -0.4985089, 3.980758, 1, 0, 0, 1, 1,
0.1709549, 1.044011, 2.043711, 1, 0, 0, 1, 1,
0.1715991, 0.9673795, 0.9911212, 1, 0, 0, 1, 1,
0.1739579, -0.7497786, 3.665371, 1, 0, 0, 1, 1,
0.1745088, -1.784675, 3.175609, 0, 0, 0, 1, 1,
0.1763368, -0.6925516, 3.005846, 0, 0, 0, 1, 1,
0.1768154, -0.1422742, 3.333502, 0, 0, 0, 1, 1,
0.1787284, -0.4274484, 1.621653, 0, 0, 0, 1, 1,
0.1832289, 0.2319613, 0.7413584, 0, 0, 0, 1, 1,
0.188227, 1.046216, -1.229496, 0, 0, 0, 1, 1,
0.1883352, 0.9240987, 2.21911, 0, 0, 0, 1, 1,
0.1908154, 0.1163823, 2.143622, 1, 1, 1, 1, 1,
0.1911588, 1.127982, 1.704873, 1, 1, 1, 1, 1,
0.1914686, 2.771398, 0.1266238, 1, 1, 1, 1, 1,
0.1934742, -0.4950011, 2.199775, 1, 1, 1, 1, 1,
0.1956998, 0.1075068, 1.5424, 1, 1, 1, 1, 1,
0.1989499, 0.1124279, -0.3149926, 1, 1, 1, 1, 1,
0.2011015, 0.8442541, 0.8070877, 1, 1, 1, 1, 1,
0.2015722, 0.4357778, 1.27427, 1, 1, 1, 1, 1,
0.2019971, -0.7132496, 3.161996, 1, 1, 1, 1, 1,
0.2063096, 0.7223616, -0.9871841, 1, 1, 1, 1, 1,
0.2073768, -0.2980709, 3.411421, 1, 1, 1, 1, 1,
0.2090504, -0.0677065, 3.277313, 1, 1, 1, 1, 1,
0.2115188, -0.9094751, 1.842448, 1, 1, 1, 1, 1,
0.2129128, -0.6082023, 3.219333, 1, 1, 1, 1, 1,
0.2140016, 0.2399209, 0.3872035, 1, 1, 1, 1, 1,
0.2172549, 0.7281066, 0.4119985, 0, 0, 1, 1, 1,
0.2184482, 1.248345, -0.5201418, 1, 0, 0, 1, 1,
0.2300926, 1.011273, -0.2223326, 1, 0, 0, 1, 1,
0.2322165, 1.459157, -0.6197422, 1, 0, 0, 1, 1,
0.2326144, -0.6627723, 3.675109, 1, 0, 0, 1, 1,
0.2334379, -0.8647735, 1.514837, 1, 0, 0, 1, 1,
0.2351899, -0.1288815, 1.852803, 0, 0, 0, 1, 1,
0.2410222, -1.022003, 3.53302, 0, 0, 0, 1, 1,
0.2475322, -0.1926892, 2.402125, 0, 0, 0, 1, 1,
0.2544858, -1.212822, 3.333765, 0, 0, 0, 1, 1,
0.2550125, 1.059202, 1.349374, 0, 0, 0, 1, 1,
0.2598677, 0.6888054, 0.4511206, 0, 0, 0, 1, 1,
0.2608215, 0.4345705, 0.5906856, 0, 0, 0, 1, 1,
0.2693356, 1.797275, 1.692041, 1, 1, 1, 1, 1,
0.2707534, 1.293846, 0.6247545, 1, 1, 1, 1, 1,
0.2707717, -1.722333, 1.943514, 1, 1, 1, 1, 1,
0.2713209, -1.53611, 2.179751, 1, 1, 1, 1, 1,
0.2814653, -1.916587, 2.968575, 1, 1, 1, 1, 1,
0.2830042, 0.5122234, 0.2950449, 1, 1, 1, 1, 1,
0.2838165, 1.750139, 0.8829692, 1, 1, 1, 1, 1,
0.2875302, -0.06974068, 2.663749, 1, 1, 1, 1, 1,
0.2899665, -0.4916975, 3.315454, 1, 1, 1, 1, 1,
0.2913497, 1.20159, 1.626683, 1, 1, 1, 1, 1,
0.2995303, -1.364022, 4.45094, 1, 1, 1, 1, 1,
0.3026806, 0.013401, 2.540152, 1, 1, 1, 1, 1,
0.305462, -0.2553618, 3.126037, 1, 1, 1, 1, 1,
0.3056225, 1.233252, 0.4338711, 1, 1, 1, 1, 1,
0.3062327, -0.5899578, 2.971778, 1, 1, 1, 1, 1,
0.3111317, 1.712281, 1.761989, 0, 0, 1, 1, 1,
0.3118617, 0.9920549, -0.8879119, 1, 0, 0, 1, 1,
0.3156015, -1.089878, 3.066326, 1, 0, 0, 1, 1,
0.3166764, -0.586751, 3.030576, 1, 0, 0, 1, 1,
0.3187497, -0.02495367, 1.385538, 1, 0, 0, 1, 1,
0.3205377, -0.1016679, 1.378865, 1, 0, 0, 1, 1,
0.3207638, 1.642088, 0.2326296, 0, 0, 0, 1, 1,
0.3226191, 1.718885, -0.5106318, 0, 0, 0, 1, 1,
0.3246937, -1.244031, 1.885812, 0, 0, 0, 1, 1,
0.3255658, -0.8752634, 3.221184, 0, 0, 0, 1, 1,
0.3283221, 0.05054111, 1.183669, 0, 0, 0, 1, 1,
0.3319545, -1.348539, 2.562964, 0, 0, 0, 1, 1,
0.3333942, -1.772708, 1.809889, 0, 0, 0, 1, 1,
0.3370819, -0.905688, 1.116412, 1, 1, 1, 1, 1,
0.3406845, -0.4226627, 2.702575, 1, 1, 1, 1, 1,
0.3418722, -0.3449428, 2.933663, 1, 1, 1, 1, 1,
0.3430583, -0.6406485, 2.741139, 1, 1, 1, 1, 1,
0.3435718, -0.8147287, 4.466771, 1, 1, 1, 1, 1,
0.3452267, 1.410719, 0.98874, 1, 1, 1, 1, 1,
0.3491325, -0.6426781, 3.030125, 1, 1, 1, 1, 1,
0.3513886, 0.911774, -0.3657827, 1, 1, 1, 1, 1,
0.3522504, -0.06347695, 1.928082, 1, 1, 1, 1, 1,
0.352833, -0.3801213, 2.062251, 1, 1, 1, 1, 1,
0.3539149, 0.1476896, 2.68336, 1, 1, 1, 1, 1,
0.3556405, -1.248358, 3.955796, 1, 1, 1, 1, 1,
0.3590185, 0.2235633, 0.9292508, 1, 1, 1, 1, 1,
0.3634627, 0.3628749, 1.857129, 1, 1, 1, 1, 1,
0.3675309, -0.4696858, 3.167136, 1, 1, 1, 1, 1,
0.3675316, -1.89825, 3.841111, 0, 0, 1, 1, 1,
0.3697603, 0.2112416, 2.620635, 1, 0, 0, 1, 1,
0.3698089, -0.9525275, 2.919794, 1, 0, 0, 1, 1,
0.3699589, 0.1235215, -0.7699641, 1, 0, 0, 1, 1,
0.3786221, -0.5109494, 2.823387, 1, 0, 0, 1, 1,
0.3787093, -1.501329, 3.255194, 1, 0, 0, 1, 1,
0.3791638, 0.2439196, 0.9667717, 0, 0, 0, 1, 1,
0.3835214, -2.373174, 2.122781, 0, 0, 0, 1, 1,
0.3844918, 0.7405167, 1.292527, 0, 0, 0, 1, 1,
0.3863008, 0.5233046, 0.836606, 0, 0, 0, 1, 1,
0.3865829, 0.8163453, 0.1155466, 0, 0, 0, 1, 1,
0.3866028, -1.827617, 3.127115, 0, 0, 0, 1, 1,
0.3870421, 0.9856551, -1.150338, 0, 0, 0, 1, 1,
0.3895977, 1.346479, -0.6361708, 1, 1, 1, 1, 1,
0.3901154, -1.391197, 4.150101, 1, 1, 1, 1, 1,
0.390387, -0.4591666, 1.883433, 1, 1, 1, 1, 1,
0.3960158, 0.6446016, -0.08384877, 1, 1, 1, 1, 1,
0.3967003, -0.1056386, 0.7966197, 1, 1, 1, 1, 1,
0.3973813, -0.7149811, 1.980448, 1, 1, 1, 1, 1,
0.3993224, 2.34839, 1.441476, 1, 1, 1, 1, 1,
0.4094719, 0.5846144, 1.767922, 1, 1, 1, 1, 1,
0.4121273, -0.9658079, 2.22334, 1, 1, 1, 1, 1,
0.4154558, 0.3019945, -0.08874991, 1, 1, 1, 1, 1,
0.4174615, 0.941062, 0.1799558, 1, 1, 1, 1, 1,
0.4186621, 0.4099046, 1.624648, 1, 1, 1, 1, 1,
0.425159, -1.081024, 3.508226, 1, 1, 1, 1, 1,
0.4281498, 0.1931783, 0.9209616, 1, 1, 1, 1, 1,
0.4286475, -0.8711866, 1.993432, 1, 1, 1, 1, 1,
0.4297845, -0.9788687, 2.816005, 0, 0, 1, 1, 1,
0.4309694, -0.4962214, 1.786934, 1, 0, 0, 1, 1,
0.4321328, -0.2791075, 3.205987, 1, 0, 0, 1, 1,
0.4390693, -1.391563, 1.984421, 1, 0, 0, 1, 1,
0.4415361, -0.2288994, 1.19744, 1, 0, 0, 1, 1,
0.4477967, 0.03161948, 2.156698, 1, 0, 0, 1, 1,
0.4510985, -0.3674166, 1.440561, 0, 0, 0, 1, 1,
0.4520354, -0.8467234, 2.356873, 0, 0, 0, 1, 1,
0.4529732, 1.552927, -1.357588, 0, 0, 0, 1, 1,
0.4618959, 0.07691864, 1.258505, 0, 0, 0, 1, 1,
0.4619001, -1.326547, 1.831027, 0, 0, 0, 1, 1,
0.4630243, 0.4776867, -0.1250466, 0, 0, 0, 1, 1,
0.4689803, -0.05118692, 1.369881, 0, 0, 0, 1, 1,
0.4732406, -1.31586, 0.9440632, 1, 1, 1, 1, 1,
0.4743012, 2.026675, -0.05213481, 1, 1, 1, 1, 1,
0.4759262, -0.4946597, 2.025261, 1, 1, 1, 1, 1,
0.4762372, -0.6496674, 2.644104, 1, 1, 1, 1, 1,
0.4784527, -0.7539696, 3.411556, 1, 1, 1, 1, 1,
0.478521, -0.6494516, 2.146242, 1, 1, 1, 1, 1,
0.487475, -0.1924409, 3.281991, 1, 1, 1, 1, 1,
0.4904455, 0.8135957, -0.2657557, 1, 1, 1, 1, 1,
0.4964357, -1.837552, 3.786773, 1, 1, 1, 1, 1,
0.4987643, 2.417693, 3.647163, 1, 1, 1, 1, 1,
0.5000185, 0.4924754, 1.56275, 1, 1, 1, 1, 1,
0.5037776, -1.900057, 3.334073, 1, 1, 1, 1, 1,
0.5083408, 0.3922638, 1.954209, 1, 1, 1, 1, 1,
0.509735, -1.724729, 1.819066, 1, 1, 1, 1, 1,
0.5099061, -0.2395363, 2.455308, 1, 1, 1, 1, 1,
0.5099284, -0.3125966, 2.318552, 0, 0, 1, 1, 1,
0.5112996, -0.1013915, 1.583599, 1, 0, 0, 1, 1,
0.5152188, 0.9697759, -1.143404, 1, 0, 0, 1, 1,
0.5214894, -1.482115, 2.776612, 1, 0, 0, 1, 1,
0.5256705, -0.7423905, 3.032446, 1, 0, 0, 1, 1,
0.5264304, -0.5999964, 1.43545, 1, 0, 0, 1, 1,
0.5300196, -0.5652953, 2.786309, 0, 0, 0, 1, 1,
0.5308239, 0.9041595, 0.3775971, 0, 0, 0, 1, 1,
0.5327582, -1.583077, 1.626372, 0, 0, 0, 1, 1,
0.5351101, 1.359242, 1.883958, 0, 0, 0, 1, 1,
0.5406259, 1.099757, -0.3460161, 0, 0, 0, 1, 1,
0.5467463, 0.2554207, 1.357386, 0, 0, 0, 1, 1,
0.5498341, -0.9743423, 2.604712, 0, 0, 0, 1, 1,
0.5517814, -2.380352, 2.13123, 1, 1, 1, 1, 1,
0.5551295, -0.9193334, 2.347217, 1, 1, 1, 1, 1,
0.5585492, -0.32987, 1.424787, 1, 1, 1, 1, 1,
0.5654942, -0.4330377, 1.84398, 1, 1, 1, 1, 1,
0.5703389, -0.6590477, 3.425848, 1, 1, 1, 1, 1,
0.5714883, -0.0791936, 2.013373, 1, 1, 1, 1, 1,
0.5798815, -0.4846839, 1.915123, 1, 1, 1, 1, 1,
0.5851398, -0.6172066, 1.11904, 1, 1, 1, 1, 1,
0.5866382, 2.660118, 1.120075, 1, 1, 1, 1, 1,
0.5872553, -0.7796324, 1.827185, 1, 1, 1, 1, 1,
0.5891674, 0.5556111, 0.3439634, 1, 1, 1, 1, 1,
0.5909607, 0.516598, 1.913432, 1, 1, 1, 1, 1,
0.5962296, -0.3855422, 2.333917, 1, 1, 1, 1, 1,
0.5968587, -0.293113, 2.108362, 1, 1, 1, 1, 1,
0.598029, -0.3593276, 1.132245, 1, 1, 1, 1, 1,
0.6005396, -1.582891, 3.437525, 0, 0, 1, 1, 1,
0.6029761, -0.1713829, 1.653937, 1, 0, 0, 1, 1,
0.6043291, -0.2665214, 1.604843, 1, 0, 0, 1, 1,
0.6060405, 1.331357, 1.71046, 1, 0, 0, 1, 1,
0.609714, 0.4008834, -0.9388771, 1, 0, 0, 1, 1,
0.6133852, -0.827302, 3.622711, 1, 0, 0, 1, 1,
0.6179764, 0.5198559, -0.2485462, 0, 0, 0, 1, 1,
0.6222434, 1.381263, -0.2095266, 0, 0, 0, 1, 1,
0.623059, -0.4414726, 2.996324, 0, 0, 0, 1, 1,
0.6249495, 0.8191693, -1.769547, 0, 0, 0, 1, 1,
0.6250907, 1.140614, 0.7751219, 0, 0, 0, 1, 1,
0.6280247, -0.07391974, 2.89085, 0, 0, 0, 1, 1,
0.6311112, -1.219642, 2.554649, 0, 0, 0, 1, 1,
0.6330463, 0.1458642, 0.7954765, 1, 1, 1, 1, 1,
0.6399641, 0.2338382, 1.300002, 1, 1, 1, 1, 1,
0.6439917, -0.2732986, 1.625876, 1, 1, 1, 1, 1,
0.645093, -0.5019997, 2.074368, 1, 1, 1, 1, 1,
0.6480542, 0.5431492, 0.2546445, 1, 1, 1, 1, 1,
0.6602561, 0.05670751, 2.288352, 1, 1, 1, 1, 1,
0.6780471, 0.6937299, 1.660828, 1, 1, 1, 1, 1,
0.6784, 1.329157, -0.2298132, 1, 1, 1, 1, 1,
0.679686, -0.3493611, 2.748572, 1, 1, 1, 1, 1,
0.6800089, 0.7561567, 0.1532955, 1, 1, 1, 1, 1,
0.6823047, 0.7042344, 1.968823, 1, 1, 1, 1, 1,
0.6876681, -0.243712, 1.691286, 1, 1, 1, 1, 1,
0.6957597, 0.3833103, 0.3846413, 1, 1, 1, 1, 1,
0.6971819, -1.246327, 4.041167, 1, 1, 1, 1, 1,
0.6987291, 0.925719, 2.216608, 1, 1, 1, 1, 1,
0.7022222, -0.1164175, 2.117544, 0, 0, 1, 1, 1,
0.7069823, -1.635104, 2.774544, 1, 0, 0, 1, 1,
0.7081882, -0.6307304, 1.862108, 1, 0, 0, 1, 1,
0.7092668, 0.00723449, 2.071422, 1, 0, 0, 1, 1,
0.7112083, -0.7678909, 0.6074572, 1, 0, 0, 1, 1,
0.7169424, -0.6348, 2.342397, 1, 0, 0, 1, 1,
0.7198183, 1.499797, 0.2070696, 0, 0, 0, 1, 1,
0.7305083, 0.8145936, 0.2788174, 0, 0, 0, 1, 1,
0.7307336, -0.9641464, 3.489686, 0, 0, 0, 1, 1,
0.734791, 0.4259258, 2.679252, 0, 0, 0, 1, 1,
0.7351057, 0.2448125, 2.77537, 0, 0, 0, 1, 1,
0.7406532, 0.3333688, 0.4934389, 0, 0, 0, 1, 1,
0.7409428, -0.777114, 1.800641, 0, 0, 0, 1, 1,
0.7430481, -0.5689904, 3.361662, 1, 1, 1, 1, 1,
0.7484218, 1.179204, 0.6519315, 1, 1, 1, 1, 1,
0.7490991, 1.459779, 0.9184673, 1, 1, 1, 1, 1,
0.7526846, 1.137974, 0.2544244, 1, 1, 1, 1, 1,
0.7548693, -0.9789609, 1.002387, 1, 1, 1, 1, 1,
0.7567714, 0.1199693, 2.21239, 1, 1, 1, 1, 1,
0.7654847, -0.4076302, 1.765903, 1, 1, 1, 1, 1,
0.7714017, 1.237732, 0.2478843, 1, 1, 1, 1, 1,
0.7726753, 0.9044473, 2.765612, 1, 1, 1, 1, 1,
0.7779538, 2.078286, 1.394681, 1, 1, 1, 1, 1,
0.778223, 0.293219, 2.21097, 1, 1, 1, 1, 1,
0.7789469, -0.3456806, 2.122784, 1, 1, 1, 1, 1,
0.7898616, 0.04893379, 3.165583, 1, 1, 1, 1, 1,
0.7976456, -0.5240337, 0.9364733, 1, 1, 1, 1, 1,
0.8006642, 0.67289, 1.522028, 1, 1, 1, 1, 1,
0.8023127, -0.222441, 0.3380257, 0, 0, 1, 1, 1,
0.8028139, -0.4145596, 1.423594, 1, 0, 0, 1, 1,
0.8046864, 0.4392317, 1.736188, 1, 0, 0, 1, 1,
0.8216219, -0.9043833, 1.512896, 1, 0, 0, 1, 1,
0.8270684, 0.004365818, 2.193199, 1, 0, 0, 1, 1,
0.8299717, 0.9653996, 2.154907, 1, 0, 0, 1, 1,
0.8337409, 0.7055482, 0.4772755, 0, 0, 0, 1, 1,
0.8354949, -0.1392857, 2.643742, 0, 0, 0, 1, 1,
0.8367605, 1.959808, 0.7710736, 0, 0, 0, 1, 1,
0.8507781, -1.696106, 2.5457, 0, 0, 0, 1, 1,
0.8531697, 0.2263469, 1.149196, 0, 0, 0, 1, 1,
0.8545785, -1.818088, 2.204324, 0, 0, 0, 1, 1,
0.8581492, -1.10167, 3.66231, 0, 0, 0, 1, 1,
0.8634815, -1.536492, 2.197849, 1, 1, 1, 1, 1,
0.8708023, -0.6814214, 2.666575, 1, 1, 1, 1, 1,
0.8718122, 2.262536, 0.144471, 1, 1, 1, 1, 1,
0.8757613, 0.8923582, 0.03008389, 1, 1, 1, 1, 1,
0.8761473, -0.746017, 3.007397, 1, 1, 1, 1, 1,
0.8809482, -1.672302, 2.057739, 1, 1, 1, 1, 1,
0.885012, 0.4598426, 1.624149, 1, 1, 1, 1, 1,
0.8871369, -1.249464, 3.49838, 1, 1, 1, 1, 1,
0.8948101, -0.8087509, 1.832133, 1, 1, 1, 1, 1,
0.8964604, -0.9180962, 0.2559654, 1, 1, 1, 1, 1,
0.9047922, 0.7202128, 0.494243, 1, 1, 1, 1, 1,
0.9081112, 0.2201634, 1.258553, 1, 1, 1, 1, 1,
0.9086239, 0.543982, 1.345469, 1, 1, 1, 1, 1,
0.9124044, -0.5214642, 1.852863, 1, 1, 1, 1, 1,
0.9151146, -0.5288093, 3.250836, 1, 1, 1, 1, 1,
0.9183367, 1.685763, 2.07579, 0, 0, 1, 1, 1,
0.9184815, 0.09207099, 4.499272, 1, 0, 0, 1, 1,
0.9203642, 1.690815, 0.5856994, 1, 0, 0, 1, 1,
0.9218248, -2.143461, 3.713167, 1, 0, 0, 1, 1,
0.9224877, 0.02350367, 1.802324, 1, 0, 0, 1, 1,
0.9235485, 1.041194, -1.202471, 1, 0, 0, 1, 1,
0.9246803, 2.118782, -1.467889, 0, 0, 0, 1, 1,
0.9296775, -0.1574479, 1.452121, 0, 0, 0, 1, 1,
0.9311715, 1.558459, 2.148479, 0, 0, 0, 1, 1,
0.9342749, -0.06296426, 2.675751, 0, 0, 0, 1, 1,
0.9360654, -0.4609047, 0.3014023, 0, 0, 0, 1, 1,
0.9479902, -0.7832955, 1.667715, 0, 0, 0, 1, 1,
0.9481547, -0.6118457, 3.165885, 0, 0, 0, 1, 1,
0.952436, 0.8636324, 1.32221, 1, 1, 1, 1, 1,
0.9571028, 0.801492, -0.6549725, 1, 1, 1, 1, 1,
0.9576917, -1.005489, 0.4650685, 1, 1, 1, 1, 1,
0.9581974, -0.1573909, 2.402753, 1, 1, 1, 1, 1,
0.9584683, -0.3944485, 2.229333, 1, 1, 1, 1, 1,
0.961215, -1.561907, 1.495106, 1, 1, 1, 1, 1,
0.961938, -0.1618723, 1.616269, 1, 1, 1, 1, 1,
0.9628136, -0.04580569, 1.664487, 1, 1, 1, 1, 1,
0.9629075, -0.3485397, 2.296897, 1, 1, 1, 1, 1,
0.9652294, -0.9794004, -0.5168566, 1, 1, 1, 1, 1,
0.9872512, -2.497791, 2.435297, 1, 1, 1, 1, 1,
0.9899827, 1.386353, 1.976898, 1, 1, 1, 1, 1,
0.9969929, -0.2020658, 1.214894, 1, 1, 1, 1, 1,
0.9997503, -1.036173, 0.9753677, 1, 1, 1, 1, 1,
0.9999102, -0.6306762, 3.882495, 1, 1, 1, 1, 1,
1.00282, -1.664248, 0.7702486, 0, 0, 1, 1, 1,
1.00325, 0.62408, 1.743537, 1, 0, 0, 1, 1,
1.005231, 0.9798129, 1.579993, 1, 0, 0, 1, 1,
1.005533, -2.100122, 3.081392, 1, 0, 0, 1, 1,
1.010261, 2.370394, -0.3791214, 1, 0, 0, 1, 1,
1.01547, -1.675557, 2.004251, 1, 0, 0, 1, 1,
1.022577, 0.5502465, 0.7438698, 0, 0, 0, 1, 1,
1.035035, -0.2341346, 0.9989684, 0, 0, 0, 1, 1,
1.036996, 1.964262, -0.4508601, 0, 0, 0, 1, 1,
1.045473, -0.7501039, 3.108501, 0, 0, 0, 1, 1,
1.053524, -0.3892851, 2.141125, 0, 0, 0, 1, 1,
1.056001, 0.0391954, 0.4562333, 0, 0, 0, 1, 1,
1.066877, -0.7023172, 3.492524, 0, 0, 0, 1, 1,
1.073244, -1.258746, 2.267706, 1, 1, 1, 1, 1,
1.075685, -0.9921722, 1.384327, 1, 1, 1, 1, 1,
1.079328, 0.1303182, 2.966012, 1, 1, 1, 1, 1,
1.081121, -0.2560958, 0.7412366, 1, 1, 1, 1, 1,
1.096526, 1.252093, 0.815205, 1, 1, 1, 1, 1,
1.101102, 0.9630671, 0.5073124, 1, 1, 1, 1, 1,
1.105738, 0.4452556, 2.222339, 1, 1, 1, 1, 1,
1.113217, 1.006383, 2.46176, 1, 1, 1, 1, 1,
1.114721, -0.1734238, 2.155331, 1, 1, 1, 1, 1,
1.123583, 1.466077, -1.535347, 1, 1, 1, 1, 1,
1.127295, 0.8666731, 0.9395975, 1, 1, 1, 1, 1,
1.12871, -0.8832424, 0.7968059, 1, 1, 1, 1, 1,
1.130061, -0.344539, 0.560567, 1, 1, 1, 1, 1,
1.134906, -0.2675162, 1.398551, 1, 1, 1, 1, 1,
1.13682, -2.418085, 2.419794, 1, 1, 1, 1, 1,
1.148991, 1.210988, 0.7399895, 0, 0, 1, 1, 1,
1.150575, -1.060439, 1.254108, 1, 0, 0, 1, 1,
1.155858, 1.374635, 1.588244, 1, 0, 0, 1, 1,
1.156318, -0.1296723, 2.927918, 1, 0, 0, 1, 1,
1.160125, -0.8528346, 1.743322, 1, 0, 0, 1, 1,
1.160402, -0.04529874, 2.954207, 1, 0, 0, 1, 1,
1.162077, 0.1870213, 0.6407419, 0, 0, 0, 1, 1,
1.180722, -0.05738082, 2.098694, 0, 0, 0, 1, 1,
1.181677, 0.4952005, 1.042649, 0, 0, 0, 1, 1,
1.18679, 1.357152, 2.127767, 0, 0, 0, 1, 1,
1.187488, -1.294442, 1.746363, 0, 0, 0, 1, 1,
1.194067, 0.3320196, 1.838308, 0, 0, 0, 1, 1,
1.196525, 0.5437427, 1.287206, 0, 0, 0, 1, 1,
1.198655, -1.265846, 1.261325, 1, 1, 1, 1, 1,
1.213308, 2.428528, 0.9905075, 1, 1, 1, 1, 1,
1.225751, 0.9152648, 1.505616, 1, 1, 1, 1, 1,
1.229433, 0.4491821, 1.108061, 1, 1, 1, 1, 1,
1.246002, 0.8764949, 1.784222, 1, 1, 1, 1, 1,
1.253767, -0.7396296, 2.349506, 1, 1, 1, 1, 1,
1.264481, -0.3596887, 0.6524143, 1, 1, 1, 1, 1,
1.265658, -0.3542534, 1.719038, 1, 1, 1, 1, 1,
1.268156, 0.6391017, 1.232697, 1, 1, 1, 1, 1,
1.268176, -1.268929, 1.435318, 1, 1, 1, 1, 1,
1.26985, -2.34004, 2.518262, 1, 1, 1, 1, 1,
1.282181, -0.1550602, 1.525452, 1, 1, 1, 1, 1,
1.2862, -0.9652009, 2.335418, 1, 1, 1, 1, 1,
1.296052, -0.5423776, 1.830306, 1, 1, 1, 1, 1,
1.29753, 1.020924, 0.7437578, 1, 1, 1, 1, 1,
1.298829, -0.4555092, 1.351239, 0, 0, 1, 1, 1,
1.299928, -0.7945346, 1.03884, 1, 0, 0, 1, 1,
1.30546, -2.124526, 3.741554, 1, 0, 0, 1, 1,
1.331786, 0.4084626, 1.293241, 1, 0, 0, 1, 1,
1.332729, 0.4784324, 0.5522282, 1, 0, 0, 1, 1,
1.341065, 0.5811568, 1.672551, 1, 0, 0, 1, 1,
1.350654, -0.8742472, 2.609696, 0, 0, 0, 1, 1,
1.374157, 1.362316, -0.1344796, 0, 0, 0, 1, 1,
1.38392, -1.25792, 0.3776058, 0, 0, 0, 1, 1,
1.390019, 0.5507997, 1.616812, 0, 0, 0, 1, 1,
1.390702, -1.896264, 2.988234, 0, 0, 0, 1, 1,
1.397143, 0.4022454, 1.02556, 0, 0, 0, 1, 1,
1.39866, 0.2595594, 0.7263379, 0, 0, 0, 1, 1,
1.407201, -0.7287514, 1.773347, 1, 1, 1, 1, 1,
1.413636, 0.02693367, 0.1651595, 1, 1, 1, 1, 1,
1.41548, -0.5308681, 1.162882, 1, 1, 1, 1, 1,
1.439649, -0.08193991, 2.242967, 1, 1, 1, 1, 1,
1.446063, -0.2233596, 3.171473, 1, 1, 1, 1, 1,
1.446214, 0.508378, -0.192109, 1, 1, 1, 1, 1,
1.451163, 0.2150135, 2.179916, 1, 1, 1, 1, 1,
1.456231, -0.3050861, 3.484627, 1, 1, 1, 1, 1,
1.456311, 0.9287723, -1.191635, 1, 1, 1, 1, 1,
1.46042, -0.2221527, 2.447352, 1, 1, 1, 1, 1,
1.466994, 1.248069, -0.2068316, 1, 1, 1, 1, 1,
1.468494, -0.04573072, 1.881961, 1, 1, 1, 1, 1,
1.470061, 1.226922, 0.2519244, 1, 1, 1, 1, 1,
1.471998, 0.204494, 1.073323, 1, 1, 1, 1, 1,
1.478638, -0.3644421, 2.090389, 1, 1, 1, 1, 1,
1.489706, -0.345035, 1.524048, 0, 0, 1, 1, 1,
1.491419, -1.177137, 1.898208, 1, 0, 0, 1, 1,
1.497392, -1.248961, 0.7203954, 1, 0, 0, 1, 1,
1.503675, -0.5152868, 1.453638, 1, 0, 0, 1, 1,
1.511359, 0.8694609, 2.229152, 1, 0, 0, 1, 1,
1.515908, -0.7864372, 0.8813752, 1, 0, 0, 1, 1,
1.518848, 0.8187308, 1.485535, 0, 0, 0, 1, 1,
1.519184, -1.017426, 2.736826, 0, 0, 0, 1, 1,
1.519271, 0.06901035, 2.210708, 0, 0, 0, 1, 1,
1.519606, -1.818293, 0.345077, 0, 0, 0, 1, 1,
1.548745, 2.087985, 2.530075, 0, 0, 0, 1, 1,
1.562662, -1.972429, 4.125765, 0, 0, 0, 1, 1,
1.577327, 1.696381, 0.08262324, 0, 0, 0, 1, 1,
1.584489, -0.6776923, 3.061753, 1, 1, 1, 1, 1,
1.593414, -0.5132213, 2.450165, 1, 1, 1, 1, 1,
1.606502, 0.4112275, 1.58048, 1, 1, 1, 1, 1,
1.608049, -1.546988, 2.227043, 1, 1, 1, 1, 1,
1.611198, 0.9872422, 2.299551, 1, 1, 1, 1, 1,
1.611387, 0.2199872, 1.040764, 1, 1, 1, 1, 1,
1.622176, -0.4483453, 0.7764435, 1, 1, 1, 1, 1,
1.629746, 3.257709, 1.947269, 1, 1, 1, 1, 1,
1.63193, 1.253037, 1.663771, 1, 1, 1, 1, 1,
1.666023, 0.3889098, 2.301561, 1, 1, 1, 1, 1,
1.666322, 0.8117205, 2.608427, 1, 1, 1, 1, 1,
1.678396, -1.221766, 4.950798, 1, 1, 1, 1, 1,
1.679485, -0.2998407, 2.143897, 1, 1, 1, 1, 1,
1.697087, -0.3277812, 2.133107, 1, 1, 1, 1, 1,
1.702759, 0.4974124, 0.8609381, 1, 1, 1, 1, 1,
1.727342, 0.5189571, 1.279445, 0, 0, 1, 1, 1,
1.738066, -1.496612, 1.3829, 1, 0, 0, 1, 1,
1.75394, 0.3602721, 1.166942, 1, 0, 0, 1, 1,
1.758022, 0.05782292, 1.806233, 1, 0, 0, 1, 1,
1.759262, 0.01038926, 3.471982, 1, 0, 0, 1, 1,
1.787768, 1.028229, 1.39917, 1, 0, 0, 1, 1,
1.833982, -0.6039738, 2.30898, 0, 0, 0, 1, 1,
1.852855, -0.4191065, 1.53486, 0, 0, 0, 1, 1,
1.869212, 1.999516, 0.3399655, 0, 0, 0, 1, 1,
1.875711, 0.3618346, 1.440698, 0, 0, 0, 1, 1,
1.909681, 0.3433902, 1.321281, 0, 0, 0, 1, 1,
1.914212, -0.4255574, 3.631199, 0, 0, 0, 1, 1,
1.916569, 2.398988, 1.572985, 0, 0, 0, 1, 1,
1.921687, -1.314462, 1.253881, 1, 1, 1, 1, 1,
1.948941, -0.9169327, 3.903816, 1, 1, 1, 1, 1,
1.97632, -1.793435, 1.207109, 1, 1, 1, 1, 1,
1.982287, 0.5081814, 1.589351, 1, 1, 1, 1, 1,
1.994242, 0.3734263, 1.713837, 1, 1, 1, 1, 1,
2.000499, -0.01020364, 0.07033483, 1, 1, 1, 1, 1,
2.017941, 0.9471865, 0.7360479, 1, 1, 1, 1, 1,
2.026327, -0.6371661, 2.843544, 1, 1, 1, 1, 1,
2.027035, 0.06088429, 3.077394, 1, 1, 1, 1, 1,
2.052962, 0.3419354, 0.6839306, 1, 1, 1, 1, 1,
2.088679, 0.3204866, 2.367673, 1, 1, 1, 1, 1,
2.117934, -1.486456, 3.137684, 1, 1, 1, 1, 1,
2.158569, 0.6406358, 1.857643, 1, 1, 1, 1, 1,
2.178181, -0.7335836, -0.1452355, 1, 1, 1, 1, 1,
2.208452, -1.944483, 2.301948, 1, 1, 1, 1, 1,
2.216537, -0.7764145, 0.4831628, 0, 0, 1, 1, 1,
2.22583, -0.6911843, 1.961329, 1, 0, 0, 1, 1,
2.228326, -0.7727724, 0.5890561, 1, 0, 0, 1, 1,
2.230248, 1.114079, 0.1646771, 1, 0, 0, 1, 1,
2.252981, -0.1443314, 1.490351, 1, 0, 0, 1, 1,
2.268046, 0.2859891, 1.294163, 1, 0, 0, 1, 1,
2.28323, -0.3028403, 1.969959, 0, 0, 0, 1, 1,
2.291755, 0.08543173, 0.5948305, 0, 0, 0, 1, 1,
2.352003, -0.2278772, 0.2458379, 0, 0, 0, 1, 1,
2.363792, 0.07834328, 2.145536, 0, 0, 0, 1, 1,
2.397677, -0.4160179, 1.803057, 0, 0, 0, 1, 1,
2.39933, -0.5743995, 2.679847, 0, 0, 0, 1, 1,
2.629745, -0.7687033, 2.720003, 0, 0, 0, 1, 1,
2.648706, -0.8728825, 2.569062, 1, 1, 1, 1, 1,
2.760784, 0.6690833, 0.5437592, 1, 1, 1, 1, 1,
2.812001, 1.74296, 0.8516979, 1, 1, 1, 1, 1,
2.812334, -0.8826563, 0.5946366, 1, 1, 1, 1, 1,
2.953574, -0.8117006, 0.3231785, 1, 1, 1, 1, 1,
3.003895, -0.8431699, 0.5601429, 1, 1, 1, 1, 1,
3.146758, -0.09294568, 1.667302, 1, 1, 1, 1, 1
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
var radius = 9.78173;
var distance = 34.35791;
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
mvMatrix.translate( 0.358345, 0.1055827, 0.2408247 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35791);
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