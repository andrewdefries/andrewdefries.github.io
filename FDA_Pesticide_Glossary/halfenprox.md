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
-2.76387, 0.7783334, -0.6745709, 1, 0, 0, 1,
-2.615701, -0.6285725, -1.222239, 1, 0.007843138, 0, 1,
-2.592468, -1.571717, -3.362113, 1, 0.01176471, 0, 1,
-2.482518, -0.04437079, -2.999616, 1, 0.01960784, 0, 1,
-2.46722, -0.660437, -2.362468, 1, 0.02352941, 0, 1,
-2.388567, -0.2609874, -1.323962, 1, 0.03137255, 0, 1,
-2.360355, -1.848512, -3.033138, 1, 0.03529412, 0, 1,
-2.329812, 0.1510005, -0.4916883, 1, 0.04313726, 0, 1,
-2.279548, -0.7905644, -2.479555, 1, 0.04705882, 0, 1,
-2.235668, -0.2585898, -3.075699, 1, 0.05490196, 0, 1,
-2.212871, -0.3708847, -2.106299, 1, 0.05882353, 0, 1,
-2.17427, -1.085935, -1.848125, 1, 0.06666667, 0, 1,
-2.154501, 0.183291, -3.216773, 1, 0.07058824, 0, 1,
-2.15447, 1.29314, -2.123916, 1, 0.07843138, 0, 1,
-2.134843, 0.1527103, -2.658414, 1, 0.08235294, 0, 1,
-2.118404, -1.434708, -2.424568, 1, 0.09019608, 0, 1,
-2.097503, -1.304792, -0.8296412, 1, 0.09411765, 0, 1,
-2.050759, 1.009974, -2.148624, 1, 0.1019608, 0, 1,
-2.028692, 0.7502337, -3.457908, 1, 0.1098039, 0, 1,
-2.013418, -0.9864355, -3.571156, 1, 0.1137255, 0, 1,
-2.01188, 1.304956, -0.1775165, 1, 0.1215686, 0, 1,
-1.993418, -0.4875087, -1.923391, 1, 0.1254902, 0, 1,
-1.989211, 0.8782519, -0.4320173, 1, 0.1333333, 0, 1,
-1.977819, 1.479725, -0.4953099, 1, 0.1372549, 0, 1,
-1.94325, -1.837652, -1.602017, 1, 0.145098, 0, 1,
-1.918895, 0.3012726, -0.2871805, 1, 0.1490196, 0, 1,
-1.856881, -0.04791766, -0.7578831, 1, 0.1568628, 0, 1,
-1.854227, -1.944139, -0.9015043, 1, 0.1607843, 0, 1,
-1.850467, 0.5017454, 0.3630434, 1, 0.1686275, 0, 1,
-1.846695, -1.340374, -3.036185, 1, 0.172549, 0, 1,
-1.839199, -1.227048, -2.690116, 1, 0.1803922, 0, 1,
-1.786914, -0.7011491, -2.469744, 1, 0.1843137, 0, 1,
-1.767471, -0.1530915, -2.221822, 1, 0.1921569, 0, 1,
-1.755588, -1.038268, -0.191296, 1, 0.1960784, 0, 1,
-1.748461, 0.0790209, -1.151678, 1, 0.2039216, 0, 1,
-1.724677, 0.02855353, -2.196876, 1, 0.2117647, 0, 1,
-1.719481, -0.04608339, -0.6526256, 1, 0.2156863, 0, 1,
-1.707616, -0.5038087, -1.922285, 1, 0.2235294, 0, 1,
-1.689851, 0.7662072, -1.120904, 1, 0.227451, 0, 1,
-1.673147, -0.7686896, -2.018943, 1, 0.2352941, 0, 1,
-1.670528, -1.706723, -3.687715, 1, 0.2392157, 0, 1,
-1.658989, -0.2676315, -2.194947, 1, 0.2470588, 0, 1,
-1.658484, -0.56939, -1.943727, 1, 0.2509804, 0, 1,
-1.650704, -0.978767, -1.401463, 1, 0.2588235, 0, 1,
-1.646468, -0.3705483, -2.4653, 1, 0.2627451, 0, 1,
-1.64512, 0.1445323, -1.470187, 1, 0.2705882, 0, 1,
-1.639972, -0.6111966, -1.031166, 1, 0.2745098, 0, 1,
-1.633185, -0.7867789, -0.9989205, 1, 0.282353, 0, 1,
-1.596216, 2.011857, -1.104253, 1, 0.2862745, 0, 1,
-1.585691, 0.5454608, -2.659658, 1, 0.2941177, 0, 1,
-1.583311, -1.712751, -1.684944, 1, 0.3019608, 0, 1,
-1.581559, -1.108374, -1.907772, 1, 0.3058824, 0, 1,
-1.574278, -1.72208, -0.1388105, 1, 0.3137255, 0, 1,
-1.561724, 0.2122259, -1.84436, 1, 0.3176471, 0, 1,
-1.545839, 0.1802475, -0.5005736, 1, 0.3254902, 0, 1,
-1.526919, -0.00207623, -2.217727, 1, 0.3294118, 0, 1,
-1.522866, 1.36559, -0.2232466, 1, 0.3372549, 0, 1,
-1.512649, -0.4344444, -1.400696, 1, 0.3411765, 0, 1,
-1.509948, -1.8799, -0.4204001, 1, 0.3490196, 0, 1,
-1.503958, 0.3390527, -1.120041, 1, 0.3529412, 0, 1,
-1.495395, -1.299026, -2.739965, 1, 0.3607843, 0, 1,
-1.489529, -0.5602894, -2.358335, 1, 0.3647059, 0, 1,
-1.482001, -0.663587, -1.873713, 1, 0.372549, 0, 1,
-1.462915, 0.8214161, -1.850131, 1, 0.3764706, 0, 1,
-1.456563, 0.2019452, -1.867969, 1, 0.3843137, 0, 1,
-1.451229, -0.007136183, -0.840401, 1, 0.3882353, 0, 1,
-1.438691, -2.189455, -1.58571, 1, 0.3960784, 0, 1,
-1.430108, -0.4904834, -1.592607, 1, 0.4039216, 0, 1,
-1.426568, -0.638701, -3.848875, 1, 0.4078431, 0, 1,
-1.426164, 0.15067, -1.956224, 1, 0.4156863, 0, 1,
-1.41847, 1.048636, -0.6476023, 1, 0.4196078, 0, 1,
-1.413188, -1.69875, -3.377633, 1, 0.427451, 0, 1,
-1.407907, -0.672447, -0.4799184, 1, 0.4313726, 0, 1,
-1.399237, -0.05769951, -0.99833, 1, 0.4392157, 0, 1,
-1.394974, 0.5792403, -0.2324746, 1, 0.4431373, 0, 1,
-1.393504, -0.2837392, -2.854709, 1, 0.4509804, 0, 1,
-1.384677, -0.4342267, -2.282473, 1, 0.454902, 0, 1,
-1.370883, -0.3744636, -0.6420951, 1, 0.4627451, 0, 1,
-1.37002, 0.2322176, -0.0547911, 1, 0.4666667, 0, 1,
-1.363779, -2.60415, -1.838599, 1, 0.4745098, 0, 1,
-1.360198, 0.7574747, 1.65559, 1, 0.4784314, 0, 1,
-1.339441, 0.2965469, -2.513758, 1, 0.4862745, 0, 1,
-1.336906, 1.74205, -1.428594, 1, 0.4901961, 0, 1,
-1.329343, -0.4115469, -1.752318, 1, 0.4980392, 0, 1,
-1.325963, -0.04408307, -1.440167, 1, 0.5058824, 0, 1,
-1.32511, -1.206434, -1.333366, 1, 0.509804, 0, 1,
-1.324728, -0.4909947, -2.187243, 1, 0.5176471, 0, 1,
-1.321586, 0.4407386, -0.6202929, 1, 0.5215687, 0, 1,
-1.320431, -0.6957124, -1.484326, 1, 0.5294118, 0, 1,
-1.310478, -0.3752378, -1.990084, 1, 0.5333334, 0, 1,
-1.306389, -0.5882993, -2.69021, 1, 0.5411765, 0, 1,
-1.301414, -2.619448, -2.992741, 1, 0.5450981, 0, 1,
-1.296483, -1.183642, -3.002701, 1, 0.5529412, 0, 1,
-1.292995, 0.4824284, -2.685599, 1, 0.5568628, 0, 1,
-1.284629, -1.337576, -3.466551, 1, 0.5647059, 0, 1,
-1.277231, -0.05114688, -2.167166, 1, 0.5686275, 0, 1,
-1.272321, 0.268893, -1.793048, 1, 0.5764706, 0, 1,
-1.261491, -0.9033256, -3.428137, 1, 0.5803922, 0, 1,
-1.260206, 0.3713099, 0.3439837, 1, 0.5882353, 0, 1,
-1.259367, -1.728062, -3.26091, 1, 0.5921569, 0, 1,
-1.257487, 0.4069528, -1.199448, 1, 0.6, 0, 1,
-1.247952, -0.6513091, -2.561082, 1, 0.6078432, 0, 1,
-1.245807, -0.7001568, -2.47684, 1, 0.6117647, 0, 1,
-1.243247, 1.101745, 0.3738614, 1, 0.6196079, 0, 1,
-1.234388, -1.255831, -2.655291, 1, 0.6235294, 0, 1,
-1.229409, -1.353237, -0.9699266, 1, 0.6313726, 0, 1,
-1.227143, 0.6659444, -0.620449, 1, 0.6352941, 0, 1,
-1.217217, -0.3658679, -1.299688, 1, 0.6431373, 0, 1,
-1.214906, 0.1289565, 0.1889342, 1, 0.6470588, 0, 1,
-1.207624, 0.4662785, -0.9414736, 1, 0.654902, 0, 1,
-1.205361, -0.08448014, -1.21587, 1, 0.6588235, 0, 1,
-1.190919, -1.776831, -2.314619, 1, 0.6666667, 0, 1,
-1.190363, 0.8804141, -0.8088078, 1, 0.6705883, 0, 1,
-1.189506, -0.3167378, -2.739535, 1, 0.6784314, 0, 1,
-1.18945, -1.658663, -3.765104, 1, 0.682353, 0, 1,
-1.187085, -1.462355, -3.128587, 1, 0.6901961, 0, 1,
-1.182355, 0.370943, -1.769875, 1, 0.6941177, 0, 1,
-1.179005, -0.0835669, -1.145733, 1, 0.7019608, 0, 1,
-1.174325, 0.753669, -1.306256, 1, 0.7098039, 0, 1,
-1.171507, 0.6886029, -2.422698, 1, 0.7137255, 0, 1,
-1.160124, -0.4079961, -2.223652, 1, 0.7215686, 0, 1,
-1.159808, -1.382603, -1.04102, 1, 0.7254902, 0, 1,
-1.156602, 0.9789689, -1.208572, 1, 0.7333333, 0, 1,
-1.143103, -0.4629989, -2.326792, 1, 0.7372549, 0, 1,
-1.132134, -0.303814, -3.291235, 1, 0.7450981, 0, 1,
-1.128763, -1.96458, -2.58292, 1, 0.7490196, 0, 1,
-1.125969, -2.107281, -0.5769402, 1, 0.7568628, 0, 1,
-1.121559, -0.1502758, -2.157427, 1, 0.7607843, 0, 1,
-1.117826, -0.3229047, -2.202626, 1, 0.7686275, 0, 1,
-1.115479, 0.1905686, -1.115311, 1, 0.772549, 0, 1,
-1.11394, -0.2947631, -0.8833615, 1, 0.7803922, 0, 1,
-1.103894, 0.6876385, -1.98911, 1, 0.7843137, 0, 1,
-1.100698, -0.9417937, -3.723443, 1, 0.7921569, 0, 1,
-1.091095, 0.3795069, -1.121976, 1, 0.7960784, 0, 1,
-1.089562, 0.4752643, -2.753253, 1, 0.8039216, 0, 1,
-1.087944, 0.1528081, -2.834531, 1, 0.8117647, 0, 1,
-1.086639, -2.164505, -0.8333418, 1, 0.8156863, 0, 1,
-1.070476, -1.625725, -2.187571, 1, 0.8235294, 0, 1,
-1.065628, -0.4415685, -0.888755, 1, 0.827451, 0, 1,
-1.064671, -0.06421647, -1.798384, 1, 0.8352941, 0, 1,
-1.053798, 0.6426696, -0.807546, 1, 0.8392157, 0, 1,
-1.050569, 0.7927641, -1.096439, 1, 0.8470588, 0, 1,
-1.032668, 0.4427465, -0.3392129, 1, 0.8509804, 0, 1,
-1.032659, 1.091907, -0.04749241, 1, 0.8588235, 0, 1,
-1.027721, -0.7343805, -2.620008, 1, 0.8627451, 0, 1,
-1.020087, 0.125462, -1.900987, 1, 0.8705882, 0, 1,
-1.016712, -2.253455, -1.919181, 1, 0.8745098, 0, 1,
-1.00873, 0.9377109, -2.212913, 1, 0.8823529, 0, 1,
-1.006826, -1.431342, -4.003665, 1, 0.8862745, 0, 1,
-1.004862, 0.3648602, -2.072239, 1, 0.8941177, 0, 1,
-1.003167, -0.9882414, -1.670459, 1, 0.8980392, 0, 1,
-0.9970188, -0.9345468, -1.094607, 1, 0.9058824, 0, 1,
-0.9944072, 0.6152999, -0.7896053, 1, 0.9137255, 0, 1,
-0.9865267, 0.2276714, -0.8480654, 1, 0.9176471, 0, 1,
-0.9853547, 0.01541877, -2.682589, 1, 0.9254902, 0, 1,
-0.9825177, 0.1978867, -1.488696, 1, 0.9294118, 0, 1,
-0.9723501, 0.9476354, -1.399013, 1, 0.9372549, 0, 1,
-0.9695532, -0.676634, -1.857262, 1, 0.9411765, 0, 1,
-0.9686045, -1.138311, -2.152178, 1, 0.9490196, 0, 1,
-0.9671969, -1.229984, -1.117035, 1, 0.9529412, 0, 1,
-0.964281, 1.522808, -1.915812, 1, 0.9607843, 0, 1,
-0.9612737, -0.6938788, -2.209561, 1, 0.9647059, 0, 1,
-0.9612002, 0.1886379, -2.853607, 1, 0.972549, 0, 1,
-0.9537621, -0.6479813, -1.105286, 1, 0.9764706, 0, 1,
-0.9492514, 1.617865, -0.8813464, 1, 0.9843137, 0, 1,
-0.9457946, 1.407528, -0.9765383, 1, 0.9882353, 0, 1,
-0.9379964, -0.5199643, -1.03855, 1, 0.9960784, 0, 1,
-0.9348975, -0.6005886, -0.9780195, 0.9960784, 1, 0, 1,
-0.9265216, 1.580226, 0.2641112, 0.9921569, 1, 0, 1,
-0.9244614, -0.2725764, -1.216028, 0.9843137, 1, 0, 1,
-0.9211874, 0.12939, -0.974604, 0.9803922, 1, 0, 1,
-0.9209104, 1.046309, 0.3301381, 0.972549, 1, 0, 1,
-0.9138501, 1.881211, -0.4585038, 0.9686275, 1, 0, 1,
-0.9128841, 1.756401, 0.4861962, 0.9607843, 1, 0, 1,
-0.9084471, -0.2031286, -1.248765, 0.9568627, 1, 0, 1,
-0.9078864, 0.148509, -1.561815, 0.9490196, 1, 0, 1,
-0.9077807, 1.010482, -2.549344, 0.945098, 1, 0, 1,
-0.9062286, -0.9144412, -1.95196, 0.9372549, 1, 0, 1,
-0.9060315, -1.684813, -1.261824, 0.9333333, 1, 0, 1,
-0.9045666, 1.117368, -1.566683, 0.9254902, 1, 0, 1,
-0.899684, -0.5102078, -4.324063, 0.9215686, 1, 0, 1,
-0.8979634, 0.841995, -1.016259, 0.9137255, 1, 0, 1,
-0.8954887, -0.2832034, -1.587288, 0.9098039, 1, 0, 1,
-0.8920999, -0.3712298, -2.465182, 0.9019608, 1, 0, 1,
-0.8892592, -1.233386, -3.396888, 0.8941177, 1, 0, 1,
-0.88197, -0.5867849, -1.618728, 0.8901961, 1, 0, 1,
-0.872103, -0.1579587, -3.626929, 0.8823529, 1, 0, 1,
-0.8715889, -0.5718855, -1.762896, 0.8784314, 1, 0, 1,
-0.8671614, 0.998643, -0.411403, 0.8705882, 1, 0, 1,
-0.8650131, 0.5502496, 0.04347562, 0.8666667, 1, 0, 1,
-0.8608322, 0.04882482, -2.201208, 0.8588235, 1, 0, 1,
-0.8563426, 1.196433, 0.2253978, 0.854902, 1, 0, 1,
-0.8563409, -0.3791294, -2.249503, 0.8470588, 1, 0, 1,
-0.8444622, -0.9230581, -1.646275, 0.8431373, 1, 0, 1,
-0.8415459, 0.4480481, -0.2969534, 0.8352941, 1, 0, 1,
-0.8343963, -1.395682, -3.554054, 0.8313726, 1, 0, 1,
-0.829462, 0.591161, -0.7920387, 0.8235294, 1, 0, 1,
-0.8289828, -1.636017, -0.2579462, 0.8196079, 1, 0, 1,
-0.8281472, 0.6139699, -1.920035, 0.8117647, 1, 0, 1,
-0.8215901, 0.7258731, 0.06689689, 0.8078431, 1, 0, 1,
-0.8167632, 1.57479, -2.001364, 0.8, 1, 0, 1,
-0.8162752, 0.5908917, -2.563713, 0.7921569, 1, 0, 1,
-0.8050919, -0.5174588, -0.6487644, 0.7882353, 1, 0, 1,
-0.7997685, -0.9194205, -2.882195, 0.7803922, 1, 0, 1,
-0.797933, -0.4286415, -2.478935, 0.7764706, 1, 0, 1,
-0.7972536, -0.6379263, -0.9179007, 0.7686275, 1, 0, 1,
-0.7910805, 0.1721964, -1.245268, 0.7647059, 1, 0, 1,
-0.7908149, -0.6473726, -2.833156, 0.7568628, 1, 0, 1,
-0.7892289, 0.06730524, -2.066818, 0.7529412, 1, 0, 1,
-0.7879116, 0.870928, -1.278393, 0.7450981, 1, 0, 1,
-0.787218, 0.2948878, 0.5526099, 0.7411765, 1, 0, 1,
-0.7871884, -1.665991, -2.853916, 0.7333333, 1, 0, 1,
-0.7835172, -0.3152398, -2.530541, 0.7294118, 1, 0, 1,
-0.7762051, 1.848193, -0.2356194, 0.7215686, 1, 0, 1,
-0.77189, -0.4627421, -2.480422, 0.7176471, 1, 0, 1,
-0.7717766, -0.9109551, -2.008345, 0.7098039, 1, 0, 1,
-0.7686318, 0.1257938, -2.052303, 0.7058824, 1, 0, 1,
-0.7658299, -0.881084, -3.535092, 0.6980392, 1, 0, 1,
-0.7560095, -0.3932644, -2.266207, 0.6901961, 1, 0, 1,
-0.7524842, 0.813638, -0.3461674, 0.6862745, 1, 0, 1,
-0.750889, 0.3781659, -1.064326, 0.6784314, 1, 0, 1,
-0.7460204, 1.156241, -0.7928218, 0.6745098, 1, 0, 1,
-0.7412851, -0.7754291, -2.04376, 0.6666667, 1, 0, 1,
-0.736677, -0.03603957, -1.483042, 0.6627451, 1, 0, 1,
-0.734695, -1.416711, -3.203914, 0.654902, 1, 0, 1,
-0.7261105, -0.5511735, -1.107414, 0.6509804, 1, 0, 1,
-0.7236333, 0.0570844, -0.4802349, 0.6431373, 1, 0, 1,
-0.7217564, 0.04174207, -1.826327, 0.6392157, 1, 0, 1,
-0.7211381, 1.570973, -1.210288, 0.6313726, 1, 0, 1,
-0.7200985, -1.385846, -1.156483, 0.627451, 1, 0, 1,
-0.7191892, 0.5077803, -1.339424, 0.6196079, 1, 0, 1,
-0.7177573, -2.600665, -0.9234636, 0.6156863, 1, 0, 1,
-0.7168891, -0.9396727, -0.7978565, 0.6078432, 1, 0, 1,
-0.7150481, -0.9351841, -2.375051, 0.6039216, 1, 0, 1,
-0.704463, 0.8201129, -0.5473773, 0.5960785, 1, 0, 1,
-0.699065, 0.2886803, -0.783106, 0.5882353, 1, 0, 1,
-0.6971501, 0.9215702, -2.577495, 0.5843138, 1, 0, 1,
-0.6930851, -0.2870661, -1.766248, 0.5764706, 1, 0, 1,
-0.6902541, -1.042693, -0.9752953, 0.572549, 1, 0, 1,
-0.6887298, -0.921244, -1.272284, 0.5647059, 1, 0, 1,
-0.6878287, -0.3202465, -1.934653, 0.5607843, 1, 0, 1,
-0.6733535, 0.2661212, -2.226712, 0.5529412, 1, 0, 1,
-0.6718233, -0.8639377, -4.477653, 0.5490196, 1, 0, 1,
-0.6705931, -1.509736, -1.960743, 0.5411765, 1, 0, 1,
-0.6700831, 0.3440628, 0.01576119, 0.5372549, 1, 0, 1,
-0.6669999, 2.305511, 1.574551, 0.5294118, 1, 0, 1,
-0.6642089, 1.302128, -1.172733, 0.5254902, 1, 0, 1,
-0.6584661, 1.236462, 1.184754, 0.5176471, 1, 0, 1,
-0.6562051, 0.02878206, -1.656141, 0.5137255, 1, 0, 1,
-0.6555336, 1.347692, -0.7699454, 0.5058824, 1, 0, 1,
-0.6550177, -0.5781278, -3.258754, 0.5019608, 1, 0, 1,
-0.6538417, -0.4705227, -1.071434, 0.4941176, 1, 0, 1,
-0.6528952, -0.154627, -2.775893, 0.4862745, 1, 0, 1,
-0.6502293, 0.5741086, -0.0784313, 0.4823529, 1, 0, 1,
-0.6324003, 1.127042, -1.776545, 0.4745098, 1, 0, 1,
-0.6286023, 0.7844481, -0.5314271, 0.4705882, 1, 0, 1,
-0.6263731, -0.09314219, -2.083563, 0.4627451, 1, 0, 1,
-0.6255141, -0.1567017, -0.9191487, 0.4588235, 1, 0, 1,
-0.6242624, -1.275831, -4.038992, 0.4509804, 1, 0, 1,
-0.6229209, 0.9105921, -0.4474698, 0.4470588, 1, 0, 1,
-0.6184022, -1.368473, -1.567112, 0.4392157, 1, 0, 1,
-0.6156905, -0.6943742, -2.653154, 0.4352941, 1, 0, 1,
-0.6104794, 1.005195, 0.7261804, 0.427451, 1, 0, 1,
-0.6092942, 0.500231, -0.7363699, 0.4235294, 1, 0, 1,
-0.605669, 0.7378063, -0.3902315, 0.4156863, 1, 0, 1,
-0.5998964, 0.3987435, -0.7730699, 0.4117647, 1, 0, 1,
-0.5949734, 1.0249, -0.3190307, 0.4039216, 1, 0, 1,
-0.5922797, -0.6546094, -2.444068, 0.3960784, 1, 0, 1,
-0.5876238, 0.1822748, 0.3815913, 0.3921569, 1, 0, 1,
-0.583765, 0.2688549, -0.6167182, 0.3843137, 1, 0, 1,
-0.5823146, 0.1712955, -0.03152837, 0.3803922, 1, 0, 1,
-0.5751601, 1.66951, 0.06947483, 0.372549, 1, 0, 1,
-0.574842, 1.155431, -0.163422, 0.3686275, 1, 0, 1,
-0.573476, -0.5490299, -1.415201, 0.3607843, 1, 0, 1,
-0.5724405, -0.9399484, -2.982711, 0.3568628, 1, 0, 1,
-0.5708189, 0.3159565, -1.046004, 0.3490196, 1, 0, 1,
-0.5707644, 0.5366839, 0.455711, 0.345098, 1, 0, 1,
-0.5688523, -0.02094948, -0.7472652, 0.3372549, 1, 0, 1,
-0.5676615, 0.4231947, 0.9036233, 0.3333333, 1, 0, 1,
-0.5668471, -0.04252817, -1.735257, 0.3254902, 1, 0, 1,
-0.5649157, -1.292339, -1.992381, 0.3215686, 1, 0, 1,
-0.5631787, 0.2338638, -0.6209397, 0.3137255, 1, 0, 1,
-0.5589708, -0.4885409, -3.494179, 0.3098039, 1, 0, 1,
-0.5547184, -0.2831673, -0.6931264, 0.3019608, 1, 0, 1,
-0.5539227, -1.02698, -4.349941, 0.2941177, 1, 0, 1,
-0.5530509, -0.3661838, -2.521951, 0.2901961, 1, 0, 1,
-0.552119, 0.6503468, -2.598129, 0.282353, 1, 0, 1,
-0.5499519, 0.3697602, -1.53706, 0.2784314, 1, 0, 1,
-0.5491945, 1.463857, -0.2690111, 0.2705882, 1, 0, 1,
-0.5390525, -1.744096, -1.631803, 0.2666667, 1, 0, 1,
-0.5386568, 1.619737, 2.081825, 0.2588235, 1, 0, 1,
-0.5324179, -1.930724, -2.165859, 0.254902, 1, 0, 1,
-0.5314354, 0.8507876, 0.03064581, 0.2470588, 1, 0, 1,
-0.5249586, 0.6801885, -0.3161064, 0.2431373, 1, 0, 1,
-0.5233993, -0.9009134, -1.36477, 0.2352941, 1, 0, 1,
-0.523106, -0.7816421, -1.437808, 0.2313726, 1, 0, 1,
-0.5200959, -0.37012, -2.375029, 0.2235294, 1, 0, 1,
-0.5162767, -0.2149489, -1.906266, 0.2196078, 1, 0, 1,
-0.5095853, 0.2444739, -1.995839, 0.2117647, 1, 0, 1,
-0.5090312, -0.1686593, -2.524003, 0.2078431, 1, 0, 1,
-0.508441, -1.165439, -3.700855, 0.2, 1, 0, 1,
-0.5074553, 1.561552, -0.4182729, 0.1921569, 1, 0, 1,
-0.4992276, 0.3130241, -0.1566166, 0.1882353, 1, 0, 1,
-0.4990564, 0.0179532, -2.575138, 0.1803922, 1, 0, 1,
-0.48976, 1.417646, 0.3884138, 0.1764706, 1, 0, 1,
-0.4870071, 0.3069883, -0.754607, 0.1686275, 1, 0, 1,
-0.4859008, -0.7462578, -3.212209, 0.1647059, 1, 0, 1,
-0.4856294, -0.08573128, -1.144481, 0.1568628, 1, 0, 1,
-0.4838874, 0.4969561, -0.6872111, 0.1529412, 1, 0, 1,
-0.4729834, 0.2210588, -2.253495, 0.145098, 1, 0, 1,
-0.4607297, -0.9728812, -1.738654, 0.1411765, 1, 0, 1,
-0.4554113, 0.4140838, -1.771159, 0.1333333, 1, 0, 1,
-0.4553647, 0.3716905, 0.1658308, 0.1294118, 1, 0, 1,
-0.4518958, 1.367101, 1.6166, 0.1215686, 1, 0, 1,
-0.4504745, 0.1908426, -0.4311714, 0.1176471, 1, 0, 1,
-0.4504137, -0.8496603, -3.097872, 0.1098039, 1, 0, 1,
-0.4503261, 0.8255618, -3.023488, 0.1058824, 1, 0, 1,
-0.4469557, 1.630175, 0.1014801, 0.09803922, 1, 0, 1,
-0.4454823, 0.6279212, 0.2681156, 0.09019608, 1, 0, 1,
-0.4438788, 0.8393277, -1.524368, 0.08627451, 1, 0, 1,
-0.4419213, 0.4643865, -0.3683741, 0.07843138, 1, 0, 1,
-0.4411333, -0.05609646, -3.082227, 0.07450981, 1, 0, 1,
-0.4400848, -1.399036, -3.113039, 0.06666667, 1, 0, 1,
-0.4399011, -0.7276424, -2.264631, 0.0627451, 1, 0, 1,
-0.4350847, -1.180351, -1.475743, 0.05490196, 1, 0, 1,
-0.4302425, -1.19375, -2.497566, 0.05098039, 1, 0, 1,
-0.4205292, 0.7747275, -2.611633, 0.04313726, 1, 0, 1,
-0.4171205, -0.5454145, -0.2044971, 0.03921569, 1, 0, 1,
-0.4122649, -0.5877642, -2.515899, 0.03137255, 1, 0, 1,
-0.4104013, 1.541751, -0.002467793, 0.02745098, 1, 0, 1,
-0.4063787, -2.042382, -1.024986, 0.01960784, 1, 0, 1,
-0.4035724, -0.6245339, -0.8408242, 0.01568628, 1, 0, 1,
-0.4033954, 1.072677, 0.0113994, 0.007843138, 1, 0, 1,
-0.4020313, -0.05613269, 0.2183136, 0.003921569, 1, 0, 1,
-0.4017621, 0.2078113, 0.2146354, 0, 1, 0.003921569, 1,
-0.3820212, 0.9689113, -0.4878798, 0, 1, 0.01176471, 1,
-0.3812703, 0.4947013, 1.590418, 0, 1, 0.01568628, 1,
-0.3793225, 0.5725634, -1.971798, 0, 1, 0.02352941, 1,
-0.3783981, -0.5035253, -3.484066, 0, 1, 0.02745098, 1,
-0.3751088, -0.507576, -3.283221, 0, 1, 0.03529412, 1,
-0.3750853, -0.9350049, -2.67256, 0, 1, 0.03921569, 1,
-0.3738797, 0.09291937, -1.525564, 0, 1, 0.04705882, 1,
-0.372944, -0.6809387, -2.458045, 0, 1, 0.05098039, 1,
-0.3685339, -2.012155, -2.674131, 0, 1, 0.05882353, 1,
-0.3674742, -0.6734768, -3.890036, 0, 1, 0.0627451, 1,
-0.3673629, -0.8598834, -1.882044, 0, 1, 0.07058824, 1,
-0.3649851, 1.114689, -0.5954311, 0, 1, 0.07450981, 1,
-0.3636496, 0.3027921, -0.2346615, 0, 1, 0.08235294, 1,
-0.361399, -1.368401, -4.077573, 0, 1, 0.08627451, 1,
-0.3581747, 0.3081446, -1.199922, 0, 1, 0.09411765, 1,
-0.3567985, -2.436363, -4.852495, 0, 1, 0.1019608, 1,
-0.3562897, -1.51066, -3.439379, 0, 1, 0.1058824, 1,
-0.3555709, 0.1398076, -1.400935, 0, 1, 0.1137255, 1,
-0.3535813, 1.564952, 0.09504726, 0, 1, 0.1176471, 1,
-0.3453415, -1.54376, -2.845385, 0, 1, 0.1254902, 1,
-0.3410721, -0.2570457, -3.737448, 0, 1, 0.1294118, 1,
-0.340739, 1.975064, -1.302664, 0, 1, 0.1372549, 1,
-0.3403714, -1.217684, -1.597904, 0, 1, 0.1411765, 1,
-0.339243, -0.8677692, -1.995508, 0, 1, 0.1490196, 1,
-0.339063, 0.2712038, -0.623509, 0, 1, 0.1529412, 1,
-0.3384224, 0.531199, -0.2941667, 0, 1, 0.1607843, 1,
-0.3382954, -1.330258, -2.880865, 0, 1, 0.1647059, 1,
-0.3382907, -0.4218918, -3.059716, 0, 1, 0.172549, 1,
-0.3379396, 0.5704938, -1.28145, 0, 1, 0.1764706, 1,
-0.3354105, 0.69194, 1.035503, 0, 1, 0.1843137, 1,
-0.3273236, 0.7908543, -0.3779778, 0, 1, 0.1882353, 1,
-0.326879, 2.100987, 0.1737091, 0, 1, 0.1960784, 1,
-0.3264948, 0.2233758, -1.266991, 0, 1, 0.2039216, 1,
-0.3243046, 0.213074, -2.599435, 0, 1, 0.2078431, 1,
-0.3218524, -1.61758, -2.542305, 0, 1, 0.2156863, 1,
-0.3211381, 1.188745, -0.9740036, 0, 1, 0.2196078, 1,
-0.3209337, -0.8704222, -2.823925, 0, 1, 0.227451, 1,
-0.3160129, 2.098688, 1.360076, 0, 1, 0.2313726, 1,
-0.3159574, -0.7051926, -2.853108, 0, 1, 0.2392157, 1,
-0.3157849, -0.2377537, -1.979324, 0, 1, 0.2431373, 1,
-0.3123769, -0.02574777, -2.015446, 0, 1, 0.2509804, 1,
-0.3101538, -1.044412, -2.689811, 0, 1, 0.254902, 1,
-0.3089355, -0.800373, -2.837818, 0, 1, 0.2627451, 1,
-0.3086092, -0.07119162, -1.390238, 0, 1, 0.2666667, 1,
-0.3081474, -0.8845401, -3.455581, 0, 1, 0.2745098, 1,
-0.3000201, -0.7853464, -2.27167, 0, 1, 0.2784314, 1,
-0.2950496, 1.347802, -0.6041973, 0, 1, 0.2862745, 1,
-0.2917364, 0.4633821, -0.1308856, 0, 1, 0.2901961, 1,
-0.2906554, -0.2048167, -2.927, 0, 1, 0.2980392, 1,
-0.2830177, 1.525068, 0.313916, 0, 1, 0.3058824, 1,
-0.2828009, 0.8104727, -0.3848433, 0, 1, 0.3098039, 1,
-0.2816882, -1.363952, -2.046121, 0, 1, 0.3176471, 1,
-0.2768202, -0.1743031, -1.047781, 0, 1, 0.3215686, 1,
-0.2737795, 1.696558, -0.9108672, 0, 1, 0.3294118, 1,
-0.2734914, -0.4795528, -3.636417, 0, 1, 0.3333333, 1,
-0.2726259, -0.08202047, -2.658449, 0, 1, 0.3411765, 1,
-0.2663058, 0.4303441, -0.9272038, 0, 1, 0.345098, 1,
-0.2649723, 0.9739316, -0.8523338, 0, 1, 0.3529412, 1,
-0.2613428, 1.231336, 0.261473, 0, 1, 0.3568628, 1,
-0.2522556, 1.06177, 3.02955, 0, 1, 0.3647059, 1,
-0.2496474, 0.9905926, 0.7495872, 0, 1, 0.3686275, 1,
-0.2494434, 1.008999, 0.3055122, 0, 1, 0.3764706, 1,
-0.2424807, 2.572553, 0.6650479, 0, 1, 0.3803922, 1,
-0.2424657, -0.02114088, -0.9375997, 0, 1, 0.3882353, 1,
-0.2363476, 0.6585314, -1.962583, 0, 1, 0.3921569, 1,
-0.2326359, -0.7452011, -3.654498, 0, 1, 0.4, 1,
-0.2272302, 1.027931, -1.12086, 0, 1, 0.4078431, 1,
-0.2243131, 0.3267417, -0.1995062, 0, 1, 0.4117647, 1,
-0.2237357, 0.1143769, -0.9088213, 0, 1, 0.4196078, 1,
-0.2216567, -0.200206, -2.697728, 0, 1, 0.4235294, 1,
-0.2200098, -0.7215793, -2.185363, 0, 1, 0.4313726, 1,
-0.2187021, 0.5238182, 0.3859594, 0, 1, 0.4352941, 1,
-0.2180304, 0.1742001, -1.448467, 0, 1, 0.4431373, 1,
-0.2171218, -1.492364, -4.532306, 0, 1, 0.4470588, 1,
-0.2162921, 1.692576, -0.02474199, 0, 1, 0.454902, 1,
-0.2062347, 1.917491, 1.357631, 0, 1, 0.4588235, 1,
-0.205042, 1.354303, -0.1238557, 0, 1, 0.4666667, 1,
-0.2015645, -0.8180396, -2.135713, 0, 1, 0.4705882, 1,
-0.1989269, -0.7873362, -2.951887, 0, 1, 0.4784314, 1,
-0.19799, 0.5030409, 0.5736917, 0, 1, 0.4823529, 1,
-0.194261, -1.076433, -2.815608, 0, 1, 0.4901961, 1,
-0.1930653, 1.059583, -2.596521, 0, 1, 0.4941176, 1,
-0.1816674, 1.700868, -1.030975, 0, 1, 0.5019608, 1,
-0.1802023, -0.3181186, -3.641723, 0, 1, 0.509804, 1,
-0.1750042, -1.262148, -4.667022, 0, 1, 0.5137255, 1,
-0.1739353, 1.26863, 0.003619012, 0, 1, 0.5215687, 1,
-0.1735409, 0.1865059, -1.756474, 0, 1, 0.5254902, 1,
-0.1730784, 0.4138682, -1.823112, 0, 1, 0.5333334, 1,
-0.1719027, 1.409155, -0.7666284, 0, 1, 0.5372549, 1,
-0.1680934, -0.5665095, -4.785046, 0, 1, 0.5450981, 1,
-0.167582, 0.6692795, -0.04264042, 0, 1, 0.5490196, 1,
-0.1665483, -1.351681, -2.761344, 0, 1, 0.5568628, 1,
-0.1616651, -0.6527033, -2.440572, 0, 1, 0.5607843, 1,
-0.1563039, -1.21511, -3.591203, 0, 1, 0.5686275, 1,
-0.1547527, 0.6066868, -0.1511752, 0, 1, 0.572549, 1,
-0.1520702, 0.8239022, 1.042878, 0, 1, 0.5803922, 1,
-0.1506698, 1.290226, -0.1746182, 0, 1, 0.5843138, 1,
-0.1425169, -0.902874, -3.134652, 0, 1, 0.5921569, 1,
-0.139845, -0.1239397, -2.499059, 0, 1, 0.5960785, 1,
-0.1386202, 0.05212929, -0.08233947, 0, 1, 0.6039216, 1,
-0.1364086, 2.546094, -1.335756, 0, 1, 0.6117647, 1,
-0.1363733, -0.08259097, -2.830467, 0, 1, 0.6156863, 1,
-0.1356457, 2.040042, 0.5993488, 0, 1, 0.6235294, 1,
-0.1334477, -0.4261812, -3.034333, 0, 1, 0.627451, 1,
-0.1231477, 0.7342042, -1.724105, 0, 1, 0.6352941, 1,
-0.1209553, 0.33463, -1.010116, 0, 1, 0.6392157, 1,
-0.1182889, 2.002196, -2.635586, 0, 1, 0.6470588, 1,
-0.118074, -0.8143228, -3.415232, 0, 1, 0.6509804, 1,
-0.1166573, -0.838173, -4.659168, 0, 1, 0.6588235, 1,
-0.1140694, 0.31691, 2.371267, 0, 1, 0.6627451, 1,
-0.1132295, 1.383985, 0.3033865, 0, 1, 0.6705883, 1,
-0.1127433, 0.6200259, 0.6091786, 0, 1, 0.6745098, 1,
-0.1090771, -0.2184771, -3.500807, 0, 1, 0.682353, 1,
-0.1076526, 0.9164973, -0.08344599, 0, 1, 0.6862745, 1,
-0.106985, 1.159263, 1.494248, 0, 1, 0.6941177, 1,
-0.09677681, -0.3206554, -3.798162, 0, 1, 0.7019608, 1,
-0.09415366, -0.7456559, -2.182082, 0, 1, 0.7058824, 1,
-0.09196049, 1.172201, -0.7866696, 0, 1, 0.7137255, 1,
-0.08730776, 0.1924329, -2.052243, 0, 1, 0.7176471, 1,
-0.08605952, -0.8568308, -4.010958, 0, 1, 0.7254902, 1,
-0.08580959, -1.27573, -3.205751, 0, 1, 0.7294118, 1,
-0.08450703, -0.1326314, -4.289421, 0, 1, 0.7372549, 1,
-0.08359513, -1.075857, -5.148126, 0, 1, 0.7411765, 1,
-0.07776627, 1.156911, -0.5581071, 0, 1, 0.7490196, 1,
-0.07512233, 2.024863, 1.077054, 0, 1, 0.7529412, 1,
-0.07076576, 0.4265288, -0.01125244, 0, 1, 0.7607843, 1,
-0.06717163, -0.7151803, -3.193556, 0, 1, 0.7647059, 1,
-0.06580814, -0.9689974, -2.303078, 0, 1, 0.772549, 1,
-0.06502724, 0.855728, -0.8357106, 0, 1, 0.7764706, 1,
-0.0630757, -1.083648, -2.305946, 0, 1, 0.7843137, 1,
-0.06286147, -0.3372181, -3.343296, 0, 1, 0.7882353, 1,
-0.06092596, -0.2165713, -1.406208, 0, 1, 0.7960784, 1,
-0.0548164, 1.200423, 1.538044, 0, 1, 0.8039216, 1,
-0.05451858, 1.18093, 0.3025985, 0, 1, 0.8078431, 1,
-0.05407635, -0.3326477, -3.059539, 0, 1, 0.8156863, 1,
-0.05300637, 0.8608125, -1.989587, 0, 1, 0.8196079, 1,
-0.05084908, 1.40449, -0.2651753, 0, 1, 0.827451, 1,
-0.0504697, 1.638867, -1.395864, 0, 1, 0.8313726, 1,
-0.04199632, -1.062133, -3.909883, 0, 1, 0.8392157, 1,
-0.04028474, -0.4531437, -3.663865, 0, 1, 0.8431373, 1,
-0.03937193, -0.177628, -2.653477, 0, 1, 0.8509804, 1,
-0.03609403, 1.809638, -0.2554225, 0, 1, 0.854902, 1,
-0.03506186, 0.8932433, 1.830572, 0, 1, 0.8627451, 1,
-0.03027907, -0.5026103, -4.441546, 0, 1, 0.8666667, 1,
-0.02839292, 2.353211, -0.1169622, 0, 1, 0.8745098, 1,
-0.02582514, -0.6479212, -4.153757, 0, 1, 0.8784314, 1,
-0.02375881, -1.176188, -3.140331, 0, 1, 0.8862745, 1,
-0.02195731, 1.866286, -1.349852, 0, 1, 0.8901961, 1,
-0.02088954, -0.1804512, -1.652515, 0, 1, 0.8980392, 1,
-0.02004176, -1.041187, -2.897625, 0, 1, 0.9058824, 1,
-0.01775007, 0.8543016, -0.2430185, 0, 1, 0.9098039, 1,
-0.01733325, -0.8372256, -4.466494, 0, 1, 0.9176471, 1,
-0.01667857, -1.037263, -4.742307, 0, 1, 0.9215686, 1,
-0.01534448, -2.434068, -2.790861, 0, 1, 0.9294118, 1,
-0.01412919, 0.2764685, -0.7068844, 0, 1, 0.9333333, 1,
-0.01353688, 0.1188926, 1.870544, 0, 1, 0.9411765, 1,
-0.01306241, 0.2230882, 1.357911, 0, 1, 0.945098, 1,
-0.01023404, 1.951377, -0.2943096, 0, 1, 0.9529412, 1,
-0.00828397, -0.2366996, -2.931243, 0, 1, 0.9568627, 1,
-0.006503074, -0.2987898, -2.417626, 0, 1, 0.9647059, 1,
-0.003518459, 0.006753412, -1.698912, 0, 1, 0.9686275, 1,
-0.002788165, 1.294045, -0.2158133, 0, 1, 0.9764706, 1,
-0.002434165, 1.269858, 0.01822973, 0, 1, 0.9803922, 1,
-0.0003933695, -1.206974, -1.955567, 0, 1, 0.9882353, 1,
0.002550502, 0.7169735, -0.4499229, 0, 1, 0.9921569, 1,
0.006568655, -0.4140376, 4.725757, 0, 1, 1, 1,
0.01075262, -0.7238662, 2.592926, 0, 0.9921569, 1, 1,
0.01110318, 1.656046, -1.918848, 0, 0.9882353, 1, 1,
0.01124083, 0.2011848, 1.186309, 0, 0.9803922, 1, 1,
0.01612102, -0.4709963, 4.590723, 0, 0.9764706, 1, 1,
0.01703565, 1.839393, -0.7004221, 0, 0.9686275, 1, 1,
0.0211326, -1.340695, 3.580338, 0, 0.9647059, 1, 1,
0.02204231, 0.7702863, 0.5308826, 0, 0.9568627, 1, 1,
0.02515201, -1.441175, 3.688019, 0, 0.9529412, 1, 1,
0.02891066, -0.7996712, 2.98316, 0, 0.945098, 1, 1,
0.02969002, -1.122514, 2.709872, 0, 0.9411765, 1, 1,
0.03463553, -0.7078634, 3.846437, 0, 0.9333333, 1, 1,
0.03618907, 1.329092, 0.482428, 0, 0.9294118, 1, 1,
0.03896492, -1.500088, 1.612011, 0, 0.9215686, 1, 1,
0.03942278, -0.8232005, 5.501752, 0, 0.9176471, 1, 1,
0.04038425, -0.5569853, 2.264661, 0, 0.9098039, 1, 1,
0.04038549, 0.5834495, 1.127083, 0, 0.9058824, 1, 1,
0.04041005, 0.5920863, 1.112552, 0, 0.8980392, 1, 1,
0.04242581, -1.352179, 1.926581, 0, 0.8901961, 1, 1,
0.04341398, -0.8618232, 2.606039, 0, 0.8862745, 1, 1,
0.05350031, 0.5635442, -0.05540632, 0, 0.8784314, 1, 1,
0.05352194, -0.3570395, 1.791135, 0, 0.8745098, 1, 1,
0.0579222, 0.3550371, 0.7233043, 0, 0.8666667, 1, 1,
0.05973717, -0.7411951, 2.218158, 0, 0.8627451, 1, 1,
0.06126577, -1.420022, 1.700531, 0, 0.854902, 1, 1,
0.06614906, -0.5963936, 3.547114, 0, 0.8509804, 1, 1,
0.0662359, 0.4644922, -0.5666576, 0, 0.8431373, 1, 1,
0.06632573, -0.3818343, 0.6289679, 0, 0.8392157, 1, 1,
0.0678604, 0.1969602, 1.640045, 0, 0.8313726, 1, 1,
0.06865082, -1.919525, 3.764195, 0, 0.827451, 1, 1,
0.07811495, 1.049766, 1.449244, 0, 0.8196079, 1, 1,
0.08193318, -0.3647335, 2.984504, 0, 0.8156863, 1, 1,
0.08670253, 0.4949377, -0.8532439, 0, 0.8078431, 1, 1,
0.08802888, -0.2506931, 2.695435, 0, 0.8039216, 1, 1,
0.08830582, -0.3280095, 2.516037, 0, 0.7960784, 1, 1,
0.09245173, -1.664879, 4.170105, 0, 0.7882353, 1, 1,
0.09372182, -0.0385567, 2.044975, 0, 0.7843137, 1, 1,
0.09423686, 0.2869273, 2.269084, 0, 0.7764706, 1, 1,
0.0976254, 0.1635621, 0.7289838, 0, 0.772549, 1, 1,
0.1023266, 1.112675, -0.1446119, 0, 0.7647059, 1, 1,
0.1044227, -0.2324748, 2.273026, 0, 0.7607843, 1, 1,
0.1072436, -0.07310227, 0.4714933, 0, 0.7529412, 1, 1,
0.1123441, -0.5049446, 3.507148, 0, 0.7490196, 1, 1,
0.1215941, -1.598509, 1.407777, 0, 0.7411765, 1, 1,
0.1283282, -0.321938, 3.077793, 0, 0.7372549, 1, 1,
0.1288859, 0.8831013, 1.168841, 0, 0.7294118, 1, 1,
0.1325995, -0.08353777, 2.678418, 0, 0.7254902, 1, 1,
0.143044, 1.594366, 1.53537, 0, 0.7176471, 1, 1,
0.1448432, -1.404521, 2.929318, 0, 0.7137255, 1, 1,
0.1464327, 0.2944097, 2.133672, 0, 0.7058824, 1, 1,
0.1486745, -1.238875, 5.157399, 0, 0.6980392, 1, 1,
0.154903, -1.17227, 2.00772, 0, 0.6941177, 1, 1,
0.1551841, 1.288642, -1.339503, 0, 0.6862745, 1, 1,
0.1592632, 0.3871985, -0.3902725, 0, 0.682353, 1, 1,
0.160023, -0.50666, 3.067182, 0, 0.6745098, 1, 1,
0.1605094, -1.250553, 2.48334, 0, 0.6705883, 1, 1,
0.1611827, -0.0246022, 0.758599, 0, 0.6627451, 1, 1,
0.1645038, 0.5657967, 0.1304892, 0, 0.6588235, 1, 1,
0.1647328, 0.1526027, -0.1198261, 0, 0.6509804, 1, 1,
0.1649707, -0.08325691, 1.668073, 0, 0.6470588, 1, 1,
0.1711102, 0.5825311, -0.6450425, 0, 0.6392157, 1, 1,
0.1758606, 1.885586, 1.0356, 0, 0.6352941, 1, 1,
0.1780428, 0.5662441, 0.8568594, 0, 0.627451, 1, 1,
0.1834285, 0.7932852, -0.01178967, 0, 0.6235294, 1, 1,
0.1840383, -0.2733642, 1.202746, 0, 0.6156863, 1, 1,
0.1842123, 0.4662574, 0.7667196, 0, 0.6117647, 1, 1,
0.1857808, -0.01679139, 1.132638, 0, 0.6039216, 1, 1,
0.1876404, 0.1803509, 0.7366135, 0, 0.5960785, 1, 1,
0.1905685, -1.238267, 3.224486, 0, 0.5921569, 1, 1,
0.1988331, 0.5456095, 0.8396482, 0, 0.5843138, 1, 1,
0.1991113, -1.981195, 3.1077, 0, 0.5803922, 1, 1,
0.2036285, 0.01516014, 2.209736, 0, 0.572549, 1, 1,
0.2059846, 0.3855762, 1.609671, 0, 0.5686275, 1, 1,
0.2099394, 0.7130392, -0.9335694, 0, 0.5607843, 1, 1,
0.2180432, 0.9391479, -0.2315783, 0, 0.5568628, 1, 1,
0.2185653, -1.126116, 2.646986, 0, 0.5490196, 1, 1,
0.2235284, -0.6007087, 4.303342, 0, 0.5450981, 1, 1,
0.2324525, 0.6406159, -0.5167631, 0, 0.5372549, 1, 1,
0.2350994, 0.4401786, 1.857185, 0, 0.5333334, 1, 1,
0.2367758, -0.425001, 3.645041, 0, 0.5254902, 1, 1,
0.2370005, -1.241616, 2.88473, 0, 0.5215687, 1, 1,
0.2383894, 0.462171, 0.9799941, 0, 0.5137255, 1, 1,
0.2413214, -0.6724153, 1.248392, 0, 0.509804, 1, 1,
0.2447522, 0.5579578, 1.388525, 0, 0.5019608, 1, 1,
0.2462206, 0.02618963, 2.353374, 0, 0.4941176, 1, 1,
0.2475697, -0.8906568, 4.31209, 0, 0.4901961, 1, 1,
0.248421, 2.267943, -0.2984557, 0, 0.4823529, 1, 1,
0.2499523, -0.8328704, 2.422373, 0, 0.4784314, 1, 1,
0.2519954, -0.06640206, 2.304129, 0, 0.4705882, 1, 1,
0.2524033, -0.514391, 2.655773, 0, 0.4666667, 1, 1,
0.2601998, 0.2977702, 0.4230788, 0, 0.4588235, 1, 1,
0.2619032, 1.017802, -0.4014163, 0, 0.454902, 1, 1,
0.26994, 0.5382181, -0.06917232, 0, 0.4470588, 1, 1,
0.2702733, -0.9120547, 3.026768, 0, 0.4431373, 1, 1,
0.2712868, -0.4822922, 2.839319, 0, 0.4352941, 1, 1,
0.2722862, -0.5994619, 2.669892, 0, 0.4313726, 1, 1,
0.2734959, 1.553034, -0.0143901, 0, 0.4235294, 1, 1,
0.2832626, -0.5803424, 3.005657, 0, 0.4196078, 1, 1,
0.2886187, -0.6266972, 1.92856, 0, 0.4117647, 1, 1,
0.2960908, -0.7418915, 3.358423, 0, 0.4078431, 1, 1,
0.2965242, 1.275898, 1.159498, 0, 0.4, 1, 1,
0.2989772, 2.109278, 0.4514243, 0, 0.3921569, 1, 1,
0.2996653, -0.6335734, 0.68699, 0, 0.3882353, 1, 1,
0.302054, -1.931436, 5.202374, 0, 0.3803922, 1, 1,
0.3050368, -0.2000688, 0.5234652, 0, 0.3764706, 1, 1,
0.3061435, -1.102131, 3.86033, 0, 0.3686275, 1, 1,
0.3082699, 0.2240442, 0.5795625, 0, 0.3647059, 1, 1,
0.3105644, -1.065292, 3.322864, 0, 0.3568628, 1, 1,
0.3106465, -0.5724862, 3.424576, 0, 0.3529412, 1, 1,
0.3112562, 0.4690888, -0.2822159, 0, 0.345098, 1, 1,
0.3144695, -1.281919, 3.983185, 0, 0.3411765, 1, 1,
0.3190713, 1.939899, -1.641938, 0, 0.3333333, 1, 1,
0.3219598, -1.813624, 1.175328, 0, 0.3294118, 1, 1,
0.3235993, -0.4340712, 1.203264, 0, 0.3215686, 1, 1,
0.3275265, 1.014428, -0.1335393, 0, 0.3176471, 1, 1,
0.329109, -0.5572702, 1.98088, 0, 0.3098039, 1, 1,
0.3296645, -0.7073149, 1.89194, 0, 0.3058824, 1, 1,
0.3324105, -0.4075734, 3.148842, 0, 0.2980392, 1, 1,
0.3340557, -1.13457, 2.588114, 0, 0.2901961, 1, 1,
0.3374703, 0.6147797, 2.720413, 0, 0.2862745, 1, 1,
0.344533, -0.6725629, 3.306746, 0, 0.2784314, 1, 1,
0.3456741, -0.261196, 2.263872, 0, 0.2745098, 1, 1,
0.3480199, 1.171027, -1.410027, 0, 0.2666667, 1, 1,
0.3510558, -0.9635782, 4.147227, 0, 0.2627451, 1, 1,
0.3551129, -0.1950132, 1.369094, 0, 0.254902, 1, 1,
0.355222, 0.4845266, 0.9446822, 0, 0.2509804, 1, 1,
0.3621894, -0.5287753, 2.920731, 0, 0.2431373, 1, 1,
0.3654878, -0.03749638, -0.4482754, 0, 0.2392157, 1, 1,
0.3737787, 0.4157685, 1.0837, 0, 0.2313726, 1, 1,
0.3741395, -0.8266975, 1.186804, 0, 0.227451, 1, 1,
0.3746368, -0.8087469, 3.622233, 0, 0.2196078, 1, 1,
0.3764288, 0.5276769, 0.7165394, 0, 0.2156863, 1, 1,
0.379822, 1.001227, -0.5637693, 0, 0.2078431, 1, 1,
0.3806246, 0.009842864, 1.76785, 0, 0.2039216, 1, 1,
0.3841718, -2.314283, 1.770995, 0, 0.1960784, 1, 1,
0.3910035, -1.853446, 1.725762, 0, 0.1882353, 1, 1,
0.3941646, -1.4636, 2.221541, 0, 0.1843137, 1, 1,
0.3957856, -2.093133, 2.080311, 0, 0.1764706, 1, 1,
0.4009396, 0.1667947, 3.090167, 0, 0.172549, 1, 1,
0.4015988, 0.9923602, -0.4333968, 0, 0.1647059, 1, 1,
0.4045425, -0.336963, 2.218908, 0, 0.1607843, 1, 1,
0.4051792, 0.07726305, 1.581771, 0, 0.1529412, 1, 1,
0.4079853, -0.1645448, 1.473309, 0, 0.1490196, 1, 1,
0.4090899, -0.3136492, 3.668482, 0, 0.1411765, 1, 1,
0.4102392, -0.2770008, 2.260608, 0, 0.1372549, 1, 1,
0.4113711, 0.3680285, -0.9151609, 0, 0.1294118, 1, 1,
0.4114206, 0.008274331, 1.433761, 0, 0.1254902, 1, 1,
0.4164246, 0.5673348, 0.6983684, 0, 0.1176471, 1, 1,
0.4170016, -0.9410349, 2.194177, 0, 0.1137255, 1, 1,
0.4200545, 0.07416636, -1.342797, 0, 0.1058824, 1, 1,
0.4235387, 0.2106363, 2.370491, 0, 0.09803922, 1, 1,
0.4261051, 1.855758, -1.00273, 0, 0.09411765, 1, 1,
0.4301515, -1.273139, 2.692945, 0, 0.08627451, 1, 1,
0.4325481, -0.7148445, 1.718843, 0, 0.08235294, 1, 1,
0.4334707, 0.5792724, 0.7290806, 0, 0.07450981, 1, 1,
0.4337875, 0.9911699, 1.264097, 0, 0.07058824, 1, 1,
0.4358564, -0.8972725, 2.961568, 0, 0.0627451, 1, 1,
0.4372659, -0.2498979, 2.021761, 0, 0.05882353, 1, 1,
0.4378272, -1.0486, 2.635559, 0, 0.05098039, 1, 1,
0.439034, -0.5678552, 2.796314, 0, 0.04705882, 1, 1,
0.4394083, -0.3339281, 2.754174, 0, 0.03921569, 1, 1,
0.4416747, 0.4838786, 2.866224, 0, 0.03529412, 1, 1,
0.4428609, -1.495851, 3.484622, 0, 0.02745098, 1, 1,
0.444555, -0.1326395, 1.011382, 0, 0.02352941, 1, 1,
0.4510513, 0.3009218, 1.060736, 0, 0.01568628, 1, 1,
0.4531834, -0.484353, 1.471012, 0, 0.01176471, 1, 1,
0.4556332, 0.6057256, -0.4028989, 0, 0.003921569, 1, 1,
0.4571029, -1.145417, 1.908851, 0.003921569, 0, 1, 1,
0.4576266, 0.1912604, 2.661928, 0.007843138, 0, 1, 1,
0.4584157, -0.07397388, 1.508092, 0.01568628, 0, 1, 1,
0.459509, -1.169625, 3.030183, 0.01960784, 0, 1, 1,
0.4611161, 0.06806386, -0.08303335, 0.02745098, 0, 1, 1,
0.46145, 1.996781, -0.7660357, 0.03137255, 0, 1, 1,
0.4647938, -0.2362235, 3.114034, 0.03921569, 0, 1, 1,
0.4649001, -0.4924712, 2.380118, 0.04313726, 0, 1, 1,
0.4665145, -1.776713, 2.967251, 0.05098039, 0, 1, 1,
0.4693446, -0.9234599, 2.522532, 0.05490196, 0, 1, 1,
0.4710224, -0.5356193, 0.9850642, 0.0627451, 0, 1, 1,
0.4804205, -0.9407565, 2.661922, 0.06666667, 0, 1, 1,
0.4855538, 0.7253957, 0.2503363, 0.07450981, 0, 1, 1,
0.4872791, 0.5521638, 3.602186, 0.07843138, 0, 1, 1,
0.4904919, 1.439852, 1.281755, 0.08627451, 0, 1, 1,
0.4937542, -1.176311, 1.873374, 0.09019608, 0, 1, 1,
0.4949713, -1.266611, 2.237441, 0.09803922, 0, 1, 1,
0.4992134, 0.1413097, 2.286795, 0.1058824, 0, 1, 1,
0.4998536, 1.306126, -0.05959588, 0.1098039, 0, 1, 1,
0.5017709, 1.431407, -0.6555475, 0.1176471, 0, 1, 1,
0.5024031, 0.8993891, 0.8227779, 0.1215686, 0, 1, 1,
0.5103408, 2.054125, -0.5814192, 0.1294118, 0, 1, 1,
0.5117691, 1.987192, 1.423202, 0.1333333, 0, 1, 1,
0.5139968, 0.5747438, -0.5613342, 0.1411765, 0, 1, 1,
0.517683, 0.6067616, -1.177372, 0.145098, 0, 1, 1,
0.521847, 0.6349447, 0.8881989, 0.1529412, 0, 1, 1,
0.5233752, 0.9087241, 1.881512, 0.1568628, 0, 1, 1,
0.5267945, 0.5809147, 1.135939, 0.1647059, 0, 1, 1,
0.5281211, 0.6172107, 0.1152287, 0.1686275, 0, 1, 1,
0.5302348, 0.7343738, 0.3386535, 0.1764706, 0, 1, 1,
0.5342168, 1.063664, 1.249869, 0.1803922, 0, 1, 1,
0.5458981, -0.4464602, 2.327254, 0.1882353, 0, 1, 1,
0.5462072, -1.762141, 2.326616, 0.1921569, 0, 1, 1,
0.5505943, -0.8441775, 1.627245, 0.2, 0, 1, 1,
0.5566069, 0.8476697, 0.4964593, 0.2078431, 0, 1, 1,
0.5571126, -0.9241751, 3.223332, 0.2117647, 0, 1, 1,
0.5572144, 0.6922836, 2.136323, 0.2196078, 0, 1, 1,
0.558808, 0.799484, 0.1444981, 0.2235294, 0, 1, 1,
0.5607916, 1.278507, 0.957081, 0.2313726, 0, 1, 1,
0.561998, -1.295339, 0.08622557, 0.2352941, 0, 1, 1,
0.5665715, -2.007586, 1.743221, 0.2431373, 0, 1, 1,
0.5683194, -1.426107, 2.600773, 0.2470588, 0, 1, 1,
0.5706187, 0.7702786, -0.8770517, 0.254902, 0, 1, 1,
0.5713578, 0.7475759, 1.771681, 0.2588235, 0, 1, 1,
0.5743588, 1.064035, 2.785319, 0.2666667, 0, 1, 1,
0.5754576, 0.3759501, 2.021349, 0.2705882, 0, 1, 1,
0.5763636, -0.5281459, 0.5951487, 0.2784314, 0, 1, 1,
0.5849087, -0.9813865, 4.634383, 0.282353, 0, 1, 1,
0.5850648, 1.584191, 0.4907466, 0.2901961, 0, 1, 1,
0.5899447, -1.192609, 3.73576, 0.2941177, 0, 1, 1,
0.5940382, 0.86693, 1.054123, 0.3019608, 0, 1, 1,
0.5985765, 0.3359002, 0.7188112, 0.3098039, 0, 1, 1,
0.6045367, -0.8705721, 1.889348, 0.3137255, 0, 1, 1,
0.6058951, 0.6978083, 0.5745614, 0.3215686, 0, 1, 1,
0.6095542, 0.66409, 0.5563823, 0.3254902, 0, 1, 1,
0.6104856, 1.033269, 0.859242, 0.3333333, 0, 1, 1,
0.6120126, -0.3829852, 3.344731, 0.3372549, 0, 1, 1,
0.6132563, 1.772244, -0.5745832, 0.345098, 0, 1, 1,
0.6147485, 0.4927971, 0.9313549, 0.3490196, 0, 1, 1,
0.616675, 1.881455, -0.6574677, 0.3568628, 0, 1, 1,
0.6186538, 0.09038062, 3.467576, 0.3607843, 0, 1, 1,
0.619189, 1.031484, -0.9899315, 0.3686275, 0, 1, 1,
0.6215966, 0.07034011, 2.818829, 0.372549, 0, 1, 1,
0.6287171, 1.068713, -0.4147846, 0.3803922, 0, 1, 1,
0.6303221, -0.2626221, 1.668316, 0.3843137, 0, 1, 1,
0.6326235, -0.1225758, 1.598735, 0.3921569, 0, 1, 1,
0.6351229, 1.415474, 1.271852, 0.3960784, 0, 1, 1,
0.6354288, 0.6169614, 0.4587351, 0.4039216, 0, 1, 1,
0.6363833, -0.8813353, 3.960989, 0.4117647, 0, 1, 1,
0.6392282, -0.2615293, 2.767909, 0.4156863, 0, 1, 1,
0.6420109, -0.4412174, 2.246056, 0.4235294, 0, 1, 1,
0.6506617, -0.70717, 1.819409, 0.427451, 0, 1, 1,
0.650833, 1.557732, -0.005068809, 0.4352941, 0, 1, 1,
0.6566462, -0.00508894, 2.316068, 0.4392157, 0, 1, 1,
0.656664, 1.155661, -0.8199226, 0.4470588, 0, 1, 1,
0.6576657, -0.2462579, 0.8431021, 0.4509804, 0, 1, 1,
0.6582024, -3.087718, 4.000957, 0.4588235, 0, 1, 1,
0.6619359, 0.5278991, -0.04672848, 0.4627451, 0, 1, 1,
0.6621189, -0.1319129, 0.7699012, 0.4705882, 0, 1, 1,
0.663651, 0.5605353, 0.2189759, 0.4745098, 0, 1, 1,
0.6645975, 1.131761, 1.674654, 0.4823529, 0, 1, 1,
0.6655126, -1.436355, 2.789017, 0.4862745, 0, 1, 1,
0.6658002, 1.072859, 0.4898938, 0.4941176, 0, 1, 1,
0.6683353, 1.069779, 0.9013485, 0.5019608, 0, 1, 1,
0.6719159, 2.4083, -1.035696, 0.5058824, 0, 1, 1,
0.6743522, -0.3372831, 3.63806, 0.5137255, 0, 1, 1,
0.6758724, 0.9373128, 0.9990567, 0.5176471, 0, 1, 1,
0.6810796, -0.2044095, 1.252879, 0.5254902, 0, 1, 1,
0.6852908, 1.331742, 1.28072, 0.5294118, 0, 1, 1,
0.6891242, -1.508031, 2.349326, 0.5372549, 0, 1, 1,
0.6904663, 1.184728, 1.448082, 0.5411765, 0, 1, 1,
0.6905276, 0.03144766, 1.923559, 0.5490196, 0, 1, 1,
0.6927402, 1.224913, 0.9193072, 0.5529412, 0, 1, 1,
0.6959817, -0.4735616, 3.226184, 0.5607843, 0, 1, 1,
0.6998172, 0.2125454, 0.8099288, 0.5647059, 0, 1, 1,
0.7014329, -1.002728, 3.100129, 0.572549, 0, 1, 1,
0.7014806, 0.7366306, 1.64946, 0.5764706, 0, 1, 1,
0.7022655, -0.3780165, 2.611529, 0.5843138, 0, 1, 1,
0.7085304, 1.03088, -1.563555, 0.5882353, 0, 1, 1,
0.7099046, -1.857084, 2.359884, 0.5960785, 0, 1, 1,
0.7104225, -0.2191853, 0.4457332, 0.6039216, 0, 1, 1,
0.7109944, -0.5175006, 2.446748, 0.6078432, 0, 1, 1,
0.715945, -0.5204908, 2.207244, 0.6156863, 0, 1, 1,
0.716497, -0.4177051, 2.09351, 0.6196079, 0, 1, 1,
0.7209923, 0.5430958, 2.467604, 0.627451, 0, 1, 1,
0.7215822, 0.8640108, 0.3936403, 0.6313726, 0, 1, 1,
0.7249025, 1.209986, -0.7282724, 0.6392157, 0, 1, 1,
0.7256083, 0.03662917, 0.8194655, 0.6431373, 0, 1, 1,
0.7269759, -0.03132091, 1.050581, 0.6509804, 0, 1, 1,
0.7320423, 1.31374, 1.830718, 0.654902, 0, 1, 1,
0.747142, 0.9136974, -0.3127464, 0.6627451, 0, 1, 1,
0.7475622, -0.828384, 4.769503, 0.6666667, 0, 1, 1,
0.7484034, 0.3377641, 1.240219, 0.6745098, 0, 1, 1,
0.7522371, -1.092241, 2.361993, 0.6784314, 0, 1, 1,
0.7565947, -0.8318748, 1.208995, 0.6862745, 0, 1, 1,
0.7591317, 0.4522128, 0.8819939, 0.6901961, 0, 1, 1,
0.7640455, 0.8717303, -0.8122309, 0.6980392, 0, 1, 1,
0.7642839, -2.344825, 3.709638, 0.7058824, 0, 1, 1,
0.7647163, -0.4792345, 1.236099, 0.7098039, 0, 1, 1,
0.7671646, -0.7214229, 1.634643, 0.7176471, 0, 1, 1,
0.7683622, -0.4990783, 1.664488, 0.7215686, 0, 1, 1,
0.7813867, -2.041371, 4.153064, 0.7294118, 0, 1, 1,
0.7883722, 1.245991, 0.301708, 0.7333333, 0, 1, 1,
0.790653, -0.08600066, -0.3526713, 0.7411765, 0, 1, 1,
0.7923384, -0.6026657, 3.659056, 0.7450981, 0, 1, 1,
0.7957593, -1.401843, 2.353668, 0.7529412, 0, 1, 1,
0.7976782, 0.6471298, 0.6400498, 0.7568628, 0, 1, 1,
0.8020979, 0.2959293, 1.307115, 0.7647059, 0, 1, 1,
0.8031098, 1.288333, 0.2619965, 0.7686275, 0, 1, 1,
0.803852, -0.431387, 1.562958, 0.7764706, 0, 1, 1,
0.8077592, 0.3281469, -0.6611646, 0.7803922, 0, 1, 1,
0.8124394, -0.1535037, 0.1231517, 0.7882353, 0, 1, 1,
0.8282105, -1.423778, 3.682908, 0.7921569, 0, 1, 1,
0.8390996, 1.458764, 0.7707514, 0.8, 0, 1, 1,
0.8393013, -0.809806, 2.782606, 0.8078431, 0, 1, 1,
0.84085, -0.7325555, 3.104938, 0.8117647, 0, 1, 1,
0.8416224, 0.7471694, 1.798089, 0.8196079, 0, 1, 1,
0.841785, -0.9649748, 3.366578, 0.8235294, 0, 1, 1,
0.8452564, -0.1113111, 2.71237, 0.8313726, 0, 1, 1,
0.8497777, 0.3124266, 0.4210138, 0.8352941, 0, 1, 1,
0.8524522, 2.264542, 0.9296858, 0.8431373, 0, 1, 1,
0.8554344, 1.180047, 0.3729085, 0.8470588, 0, 1, 1,
0.859578, -0.9911728, 2.380713, 0.854902, 0, 1, 1,
0.8611765, -1.12633, 3.506353, 0.8588235, 0, 1, 1,
0.862043, -1.403218, 2.685445, 0.8666667, 0, 1, 1,
0.8637304, 0.4719644, 0.5264965, 0.8705882, 0, 1, 1,
0.8686923, 0.4267125, 1.967755, 0.8784314, 0, 1, 1,
0.8726028, 0.9134458, -0.0822906, 0.8823529, 0, 1, 1,
0.8730236, -0.2788637, 0.5897017, 0.8901961, 0, 1, 1,
0.8752518, 0.2871002, 1.909612, 0.8941177, 0, 1, 1,
0.875346, -0.7322112, 1.557925, 0.9019608, 0, 1, 1,
0.8756405, 0.2000157, 1.161372, 0.9098039, 0, 1, 1,
0.8771987, 0.6629943, 2.169942, 0.9137255, 0, 1, 1,
0.8772784, -1.100435, 5.172215, 0.9215686, 0, 1, 1,
0.8814121, -1.265368, 2.683542, 0.9254902, 0, 1, 1,
0.8816764, 0.08538782, 2.499869, 0.9333333, 0, 1, 1,
0.8820085, 0.8969041, 0.7043418, 0.9372549, 0, 1, 1,
0.8837702, -0.5276397, 2.303869, 0.945098, 0, 1, 1,
0.8914162, 0.9595426, 1.130302, 0.9490196, 0, 1, 1,
0.892314, -1.232863, 3.027924, 0.9568627, 0, 1, 1,
0.8971711, -0.3917962, 1.48994, 0.9607843, 0, 1, 1,
0.8982121, 0.9574225, 0.3120187, 0.9686275, 0, 1, 1,
0.8984964, -0.7676835, 1.661081, 0.972549, 0, 1, 1,
0.9018467, 2.133336, 0.2234695, 0.9803922, 0, 1, 1,
0.9045088, 1.681849, 0.7915518, 0.9843137, 0, 1, 1,
0.9069669, 0.5215896, 1.516302, 0.9921569, 0, 1, 1,
0.9074002, -0.1441177, 1.549942, 0.9960784, 0, 1, 1,
0.9125695, 0.5065671, 1.500128, 1, 0, 0.9960784, 1,
0.9130797, 0.2402892, 1.388168, 1, 0, 0.9882353, 1,
0.9138231, -1.111195, 2.623924, 1, 0, 0.9843137, 1,
0.9164515, 0.007622183, 2.514604, 1, 0, 0.9764706, 1,
0.9168974, -1.416745, 1.798093, 1, 0, 0.972549, 1,
0.9193159, -0.0008953597, 2.181936, 1, 0, 0.9647059, 1,
0.9313669, -0.5456684, 3.087356, 1, 0, 0.9607843, 1,
0.9377128, -0.4197128, 1.25013, 1, 0, 0.9529412, 1,
0.9398094, 0.1869367, 1.060325, 1, 0, 0.9490196, 1,
0.9409446, 0.249986, 2.152044, 1, 0, 0.9411765, 1,
0.9411592, -0.2391486, 1.749705, 1, 0, 0.9372549, 1,
0.9424848, -0.5936072, 0.2718086, 1, 0, 0.9294118, 1,
0.9431539, -0.1174518, 1.088101, 1, 0, 0.9254902, 1,
0.9463691, -0.907631, 1.096144, 1, 0, 0.9176471, 1,
0.9497859, 1.089451, 1.04806, 1, 0, 0.9137255, 1,
0.954074, -0.4579, 1.912329, 1, 0, 0.9058824, 1,
0.9556413, -1.645826, 4.483956, 1, 0, 0.9019608, 1,
0.9573632, -0.0143785, 1.466919, 1, 0, 0.8941177, 1,
0.957582, -0.04439099, 2.741765, 1, 0, 0.8862745, 1,
0.9673452, -0.8128043, 2.66073, 1, 0, 0.8823529, 1,
0.9715681, 1.72559, 0.04740141, 1, 0, 0.8745098, 1,
0.9718662, 1.040018, 1.054085, 1, 0, 0.8705882, 1,
0.9760733, 0.2119865, 0.9961551, 1, 0, 0.8627451, 1,
0.9760734, -1.50767, 0.7041625, 1, 0, 0.8588235, 1,
0.9772002, 0.1219153, 1.360915, 1, 0, 0.8509804, 1,
0.9797311, 0.3404737, 3.241028, 1, 0, 0.8470588, 1,
0.9801872, 0.9951077, -0.1763799, 1, 0, 0.8392157, 1,
0.9807251, 0.2527325, -0.3103615, 1, 0, 0.8352941, 1,
0.9856223, 0.9000883, -0.02793944, 1, 0, 0.827451, 1,
0.9908505, -1.300185, 2.238655, 1, 0, 0.8235294, 1,
0.990872, 0.6635408, 1.823453, 1, 0, 0.8156863, 1,
0.9938426, 0.07478773, 2.429655, 1, 0, 0.8117647, 1,
0.998599, 0.3576748, 1.700504, 1, 0, 0.8039216, 1,
1.008752, -2.624982, 1.773715, 1, 0, 0.7960784, 1,
1.011817, 1.872154, 0.9109961, 1, 0, 0.7921569, 1,
1.012788, 0.132276, 1.046238, 1, 0, 0.7843137, 1,
1.017685, -1.153904, 3.106487, 1, 0, 0.7803922, 1,
1.017823, 0.9013762, 0.2626765, 1, 0, 0.772549, 1,
1.022292, 2.764199, 0.9203434, 1, 0, 0.7686275, 1,
1.025422, -1.408431, 3.087308, 1, 0, 0.7607843, 1,
1.034445, 0.4427675, 0.003210486, 1, 0, 0.7568628, 1,
1.049088, 0.514227, 1.586755, 1, 0, 0.7490196, 1,
1.056441, 0.2496782, 1.980547, 1, 0, 0.7450981, 1,
1.056686, 0.3505218, -0.4394142, 1, 0, 0.7372549, 1,
1.065397, 0.3124035, 0.1970734, 1, 0, 0.7333333, 1,
1.068421, -0.08743632, 1.252185, 1, 0, 0.7254902, 1,
1.069583, 1.647037, 1.33577, 1, 0, 0.7215686, 1,
1.079242, 2.239205, 0.5020234, 1, 0, 0.7137255, 1,
1.079996, 0.2958421, 1.397173, 1, 0, 0.7098039, 1,
1.081857, -0.1130721, 2.892848, 1, 0, 0.7019608, 1,
1.082589, -1.246446, 2.525402, 1, 0, 0.6941177, 1,
1.084854, -1.750711, -0.368407, 1, 0, 0.6901961, 1,
1.093447, -2.211762, 3.545586, 1, 0, 0.682353, 1,
1.10186, 1.565658, -0.4485776, 1, 0, 0.6784314, 1,
1.106354, -0.6450414, 1.372056, 1, 0, 0.6705883, 1,
1.109928, 0.002225436, 1.101869, 1, 0, 0.6666667, 1,
1.112228, 0.8051289, 1.79079, 1, 0, 0.6588235, 1,
1.12015, 0.2215498, 1.333813, 1, 0, 0.654902, 1,
1.130566, 0.5804499, 1.3828, 1, 0, 0.6470588, 1,
1.134911, -0.5849944, 2.824236, 1, 0, 0.6431373, 1,
1.136923, -0.776521, 2.103044, 1, 0, 0.6352941, 1,
1.142462, 0.08882242, 0.8716702, 1, 0, 0.6313726, 1,
1.157539, -0.8634605, 1.644848, 1, 0, 0.6235294, 1,
1.166458, -0.1549928, 3.145429, 1, 0, 0.6196079, 1,
1.176603, 0.7744526, -0.903015, 1, 0, 0.6117647, 1,
1.193213, -0.5392205, 2.994004, 1, 0, 0.6078432, 1,
1.199818, -0.3967201, 2.203313, 1, 0, 0.6, 1,
1.202106, -0.5490446, 2.615857, 1, 0, 0.5921569, 1,
1.206485, -0.2431229, 1.365071, 1, 0, 0.5882353, 1,
1.209608, -0.1757002, 2.718688, 1, 0, 0.5803922, 1,
1.214136, -0.8452274, 1.379888, 1, 0, 0.5764706, 1,
1.222217, -0.8641258, 3.23679, 1, 0, 0.5686275, 1,
1.237424, -1.125932, 2.621283, 1, 0, 0.5647059, 1,
1.254727, -0.4497712, 1.58024, 1, 0, 0.5568628, 1,
1.277727, 1.587445, 0.6699418, 1, 0, 0.5529412, 1,
1.316906, 0.07129872, 2.346575, 1, 0, 0.5450981, 1,
1.325175, -1.708441, 3.003823, 1, 0, 0.5411765, 1,
1.33582, 0.7656593, -0.6788578, 1, 0, 0.5333334, 1,
1.336272, -0.07664545, 0.909786, 1, 0, 0.5294118, 1,
1.342996, 0.5212579, 1.103685, 1, 0, 0.5215687, 1,
1.343833, -1.523986, 0.03058521, 1, 0, 0.5176471, 1,
1.366537, 1.166752, 3.187268, 1, 0, 0.509804, 1,
1.370255, -0.06492027, 1.455728, 1, 0, 0.5058824, 1,
1.372169, -1.400955, 1.795538, 1, 0, 0.4980392, 1,
1.375827, -0.06924275, 1.512157, 1, 0, 0.4901961, 1,
1.378002, 0.3068586, 1.223198, 1, 0, 0.4862745, 1,
1.386943, -0.2036412, 1.823156, 1, 0, 0.4784314, 1,
1.401491, 1.290965, 1.35325, 1, 0, 0.4745098, 1,
1.418355, -1.454091, 2.742907, 1, 0, 0.4666667, 1,
1.423324, -1.734613, 3.149742, 1, 0, 0.4627451, 1,
1.428325, 0.502432, 1.355288, 1, 0, 0.454902, 1,
1.431851, 1.574052, 0.6333289, 1, 0, 0.4509804, 1,
1.435194, -1.187119, 2.70453, 1, 0, 0.4431373, 1,
1.44313, -0.1072075, 0.7081261, 1, 0, 0.4392157, 1,
1.443798, 0.05531096, 3.395823, 1, 0, 0.4313726, 1,
1.484913, 0.2153542, -0.5962161, 1, 0, 0.427451, 1,
1.484962, -0.3143098, 1.675903, 1, 0, 0.4196078, 1,
1.489094, -0.2195948, 3.279085, 1, 0, 0.4156863, 1,
1.513833, 0.8576917, -1.182889, 1, 0, 0.4078431, 1,
1.519783, -1.684923, 0.03439244, 1, 0, 0.4039216, 1,
1.535043, -0.0379926, 2.122222, 1, 0, 0.3960784, 1,
1.537804, -0.07141922, 2.028165, 1, 0, 0.3882353, 1,
1.538404, -0.1902854, 0.4198286, 1, 0, 0.3843137, 1,
1.541499, 0.5352187, 0.8815083, 1, 0, 0.3764706, 1,
1.541713, 0.2343719, 2.759728, 1, 0, 0.372549, 1,
1.542435, -0.3490213, 2.509335, 1, 0, 0.3647059, 1,
1.542442, 0.4940227, 0.09437152, 1, 0, 0.3607843, 1,
1.553434, -0.7188398, 2.976301, 1, 0, 0.3529412, 1,
1.56716, 1.534478, -1.177966, 1, 0, 0.3490196, 1,
1.585134, 0.2815776, 0.02862338, 1, 0, 0.3411765, 1,
1.585772, -1.16609, 2.206709, 1, 0, 0.3372549, 1,
1.586511, 0.3562772, 1.891138, 1, 0, 0.3294118, 1,
1.590611, -0.6418069, 1.539451, 1, 0, 0.3254902, 1,
1.593398, -1.346604, 0.9931132, 1, 0, 0.3176471, 1,
1.602605, 0.876672, 3.997944, 1, 0, 0.3137255, 1,
1.643219, 1.853008, -0.04981969, 1, 0, 0.3058824, 1,
1.644542, 1.867706, 1.993927, 1, 0, 0.2980392, 1,
1.649593, 1.636521, 0.6790304, 1, 0, 0.2941177, 1,
1.660214, 0.7825187, 0.9964489, 1, 0, 0.2862745, 1,
1.664833, -1.77933, 1.183381, 1, 0, 0.282353, 1,
1.666394, 0.2336801, 1.697796, 1, 0, 0.2745098, 1,
1.677189, 1.552723, 0.1244212, 1, 0, 0.2705882, 1,
1.677525, 0.1342138, 1.970918, 1, 0, 0.2627451, 1,
1.683179, 0.3461769, 1.037699, 1, 0, 0.2588235, 1,
1.683185, -0.04842572, 0.7677279, 1, 0, 0.2509804, 1,
1.689451, 0.5689937, 1.084681, 1, 0, 0.2470588, 1,
1.702277, -0.4733782, 1.281826, 1, 0, 0.2392157, 1,
1.704711, 1.462054, -0.2827624, 1, 0, 0.2352941, 1,
1.723249, 1.691577, 0.8199404, 1, 0, 0.227451, 1,
1.728228, -0.1397118, -0.4825825, 1, 0, 0.2235294, 1,
1.730757, 1.073335, 1.41583, 1, 0, 0.2156863, 1,
1.745671, -2.977199, 0.8662406, 1, 0, 0.2117647, 1,
1.766532, 0.6129444, 1.963744, 1, 0, 0.2039216, 1,
1.804746, -0.2364857, 1.437586, 1, 0, 0.1960784, 1,
1.811615, 0.5573657, -1.178358, 1, 0, 0.1921569, 1,
1.842184, 0.460103, 0.7658091, 1, 0, 0.1843137, 1,
1.85631, -0.8560385, 0.8004958, 1, 0, 0.1803922, 1,
1.89793, 0.8065045, 2.493696, 1, 0, 0.172549, 1,
1.898551, 1.138681, 1.378706, 1, 0, 0.1686275, 1,
1.919591, -0.1812084, 2.320054, 1, 0, 0.1607843, 1,
1.925518, -0.1551304, 2.62655, 1, 0, 0.1568628, 1,
1.932158, 0.6265091, 2.503519, 1, 0, 0.1490196, 1,
1.935582, 0.2527951, 0.6688251, 1, 0, 0.145098, 1,
1.952223, 0.3137296, 4.119368, 1, 0, 0.1372549, 1,
1.97553, -0.01559456, 3.231504, 1, 0, 0.1333333, 1,
1.997764, -0.1416696, 1.181759, 1, 0, 0.1254902, 1,
2.030555, 1.355617, 0.3028047, 1, 0, 0.1215686, 1,
2.037055, -2.366258, 2.736048, 1, 0, 0.1137255, 1,
2.046361, -1.090332, 1.586412, 1, 0, 0.1098039, 1,
2.079947, -0.03699553, 2.215374, 1, 0, 0.1019608, 1,
2.112573, 1.829795, 1.406459, 1, 0, 0.09411765, 1,
2.112698, 0.6883649, 1.583709, 1, 0, 0.09019608, 1,
2.147648, 0.5839996, 1.307369, 1, 0, 0.08235294, 1,
2.148427, 1.786003, 1.59965, 1, 0, 0.07843138, 1,
2.193902, -1.817775, 2.584618, 1, 0, 0.07058824, 1,
2.249778, -0.7067806, 1.625557, 1, 0, 0.06666667, 1,
2.257331, -1.344963, 3.836889, 1, 0, 0.05882353, 1,
2.350833, -0.8790087, 2.120264, 1, 0, 0.05490196, 1,
2.445855, -1.840081, 1.510782, 1, 0, 0.04705882, 1,
2.46689, 0.6311313, 1.563112, 1, 0, 0.04313726, 1,
2.501756, -1.326334, 1.960904, 1, 0, 0.03529412, 1,
3.328156, -0.2149892, 1.403346, 1, 0, 0.03137255, 1,
3.35951, -0.8424934, 3.595397, 1, 0, 0.02352941, 1,
3.375549, 1.74373, 1.344615, 1, 0, 0.01960784, 1,
3.384561, 0.6468685, -1.659153, 1, 0, 0.01176471, 1,
3.542537, 2.333362, 1.953908, 1, 0, 0.007843138, 1
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
0.3893336, -4.079618, -6.95328, 0, -0.5, 0.5, 0.5,
0.3893336, -4.079618, -6.95328, 1, -0.5, 0.5, 0.5,
0.3893336, -4.079618, -6.95328, 1, 1.5, 0.5, 0.5,
0.3893336, -4.079618, -6.95328, 0, 1.5, 0.5, 0.5
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
-3.832806, -0.1617595, -6.95328, 0, -0.5, 0.5, 0.5,
-3.832806, -0.1617595, -6.95328, 1, -0.5, 0.5, 0.5,
-3.832806, -0.1617595, -6.95328, 1, 1.5, 0.5, 0.5,
-3.832806, -0.1617595, -6.95328, 0, 1.5, 0.5, 0.5
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
-3.832806, -4.079618, 0.1768129, 0, -0.5, 0.5, 0.5,
-3.832806, -4.079618, 0.1768129, 1, -0.5, 0.5, 0.5,
-3.832806, -4.079618, 0.1768129, 1, 1.5, 0.5, 0.5,
-3.832806, -4.079618, 0.1768129, 0, 1.5, 0.5, 0.5
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
-2, -3.175497, -5.307874,
3, -3.175497, -5.307874,
-2, -3.175497, -5.307874,
-2, -3.326184, -5.582108,
-1, -3.175497, -5.307874,
-1, -3.326184, -5.582108,
0, -3.175497, -5.307874,
0, -3.326184, -5.582108,
1, -3.175497, -5.307874,
1, -3.326184, -5.582108,
2, -3.175497, -5.307874,
2, -3.326184, -5.582108,
3, -3.175497, -5.307874,
3, -3.326184, -5.582108
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
-2, -3.627558, -6.130578, 0, -0.5, 0.5, 0.5,
-2, -3.627558, -6.130578, 1, -0.5, 0.5, 0.5,
-2, -3.627558, -6.130578, 1, 1.5, 0.5, 0.5,
-2, -3.627558, -6.130578, 0, 1.5, 0.5, 0.5,
-1, -3.627558, -6.130578, 0, -0.5, 0.5, 0.5,
-1, -3.627558, -6.130578, 1, -0.5, 0.5, 0.5,
-1, -3.627558, -6.130578, 1, 1.5, 0.5, 0.5,
-1, -3.627558, -6.130578, 0, 1.5, 0.5, 0.5,
0, -3.627558, -6.130578, 0, -0.5, 0.5, 0.5,
0, -3.627558, -6.130578, 1, -0.5, 0.5, 0.5,
0, -3.627558, -6.130578, 1, 1.5, 0.5, 0.5,
0, -3.627558, -6.130578, 0, 1.5, 0.5, 0.5,
1, -3.627558, -6.130578, 0, -0.5, 0.5, 0.5,
1, -3.627558, -6.130578, 1, -0.5, 0.5, 0.5,
1, -3.627558, -6.130578, 1, 1.5, 0.5, 0.5,
1, -3.627558, -6.130578, 0, 1.5, 0.5, 0.5,
2, -3.627558, -6.130578, 0, -0.5, 0.5, 0.5,
2, -3.627558, -6.130578, 1, -0.5, 0.5, 0.5,
2, -3.627558, -6.130578, 1, 1.5, 0.5, 0.5,
2, -3.627558, -6.130578, 0, 1.5, 0.5, 0.5,
3, -3.627558, -6.130578, 0, -0.5, 0.5, 0.5,
3, -3.627558, -6.130578, 1, -0.5, 0.5, 0.5,
3, -3.627558, -6.130578, 1, 1.5, 0.5, 0.5,
3, -3.627558, -6.130578, 0, 1.5, 0.5, 0.5
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
-2.858466, -3, -5.307874,
-2.858466, 2, -5.307874,
-2.858466, -3, -5.307874,
-3.020856, -3, -5.582108,
-2.858466, -2, -5.307874,
-3.020856, -2, -5.582108,
-2.858466, -1, -5.307874,
-3.020856, -1, -5.582108,
-2.858466, 0, -5.307874,
-3.020856, 0, -5.582108,
-2.858466, 1, -5.307874,
-3.020856, 1, -5.582108,
-2.858466, 2, -5.307874,
-3.020856, 2, -5.582108
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
-3.345636, -3, -6.130578, 0, -0.5, 0.5, 0.5,
-3.345636, -3, -6.130578, 1, -0.5, 0.5, 0.5,
-3.345636, -3, -6.130578, 1, 1.5, 0.5, 0.5,
-3.345636, -3, -6.130578, 0, 1.5, 0.5, 0.5,
-3.345636, -2, -6.130578, 0, -0.5, 0.5, 0.5,
-3.345636, -2, -6.130578, 1, -0.5, 0.5, 0.5,
-3.345636, -2, -6.130578, 1, 1.5, 0.5, 0.5,
-3.345636, -2, -6.130578, 0, 1.5, 0.5, 0.5,
-3.345636, -1, -6.130578, 0, -0.5, 0.5, 0.5,
-3.345636, -1, -6.130578, 1, -0.5, 0.5, 0.5,
-3.345636, -1, -6.130578, 1, 1.5, 0.5, 0.5,
-3.345636, -1, -6.130578, 0, 1.5, 0.5, 0.5,
-3.345636, 0, -6.130578, 0, -0.5, 0.5, 0.5,
-3.345636, 0, -6.130578, 1, -0.5, 0.5, 0.5,
-3.345636, 0, -6.130578, 1, 1.5, 0.5, 0.5,
-3.345636, 0, -6.130578, 0, 1.5, 0.5, 0.5,
-3.345636, 1, -6.130578, 0, -0.5, 0.5, 0.5,
-3.345636, 1, -6.130578, 1, -0.5, 0.5, 0.5,
-3.345636, 1, -6.130578, 1, 1.5, 0.5, 0.5,
-3.345636, 1, -6.130578, 0, 1.5, 0.5, 0.5,
-3.345636, 2, -6.130578, 0, -0.5, 0.5, 0.5,
-3.345636, 2, -6.130578, 1, -0.5, 0.5, 0.5,
-3.345636, 2, -6.130578, 1, 1.5, 0.5, 0.5,
-3.345636, 2, -6.130578, 0, 1.5, 0.5, 0.5
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
-2.858466, -3.175497, -4,
-2.858466, -3.175497, 4,
-2.858466, -3.175497, -4,
-3.020856, -3.326184, -4,
-2.858466, -3.175497, -2,
-3.020856, -3.326184, -2,
-2.858466, -3.175497, 0,
-3.020856, -3.326184, 0,
-2.858466, -3.175497, 2,
-3.020856, -3.326184, 2,
-2.858466, -3.175497, 4,
-3.020856, -3.326184, 4
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
-3.345636, -3.627558, -4, 0, -0.5, 0.5, 0.5,
-3.345636, -3.627558, -4, 1, -0.5, 0.5, 0.5,
-3.345636, -3.627558, -4, 1, 1.5, 0.5, 0.5,
-3.345636, -3.627558, -4, 0, 1.5, 0.5, 0.5,
-3.345636, -3.627558, -2, 0, -0.5, 0.5, 0.5,
-3.345636, -3.627558, -2, 1, -0.5, 0.5, 0.5,
-3.345636, -3.627558, -2, 1, 1.5, 0.5, 0.5,
-3.345636, -3.627558, -2, 0, 1.5, 0.5, 0.5,
-3.345636, -3.627558, 0, 0, -0.5, 0.5, 0.5,
-3.345636, -3.627558, 0, 1, -0.5, 0.5, 0.5,
-3.345636, -3.627558, 0, 1, 1.5, 0.5, 0.5,
-3.345636, -3.627558, 0, 0, 1.5, 0.5, 0.5,
-3.345636, -3.627558, 2, 0, -0.5, 0.5, 0.5,
-3.345636, -3.627558, 2, 1, -0.5, 0.5, 0.5,
-3.345636, -3.627558, 2, 1, 1.5, 0.5, 0.5,
-3.345636, -3.627558, 2, 0, 1.5, 0.5, 0.5,
-3.345636, -3.627558, 4, 0, -0.5, 0.5, 0.5,
-3.345636, -3.627558, 4, 1, -0.5, 0.5, 0.5,
-3.345636, -3.627558, 4, 1, 1.5, 0.5, 0.5,
-3.345636, -3.627558, 4, 0, 1.5, 0.5, 0.5
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
-2.858466, -3.175497, -5.307874,
-2.858466, 2.851978, -5.307874,
-2.858466, -3.175497, 5.6615,
-2.858466, 2.851978, 5.6615,
-2.858466, -3.175497, -5.307874,
-2.858466, -3.175497, 5.6615,
-2.858466, 2.851978, -5.307874,
-2.858466, 2.851978, 5.6615,
-2.858466, -3.175497, -5.307874,
3.637133, -3.175497, -5.307874,
-2.858466, -3.175497, 5.6615,
3.637133, -3.175497, 5.6615,
-2.858466, 2.851978, -5.307874,
3.637133, 2.851978, -5.307874,
-2.858466, 2.851978, 5.6615,
3.637133, 2.851978, 5.6615,
3.637133, -3.175497, -5.307874,
3.637133, 2.851978, -5.307874,
3.637133, -3.175497, 5.6615,
3.637133, 2.851978, 5.6615,
3.637133, -3.175497, -5.307874,
3.637133, -3.175497, 5.6615,
3.637133, 2.851978, -5.307874,
3.637133, 2.851978, 5.6615
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
var radius = 7.529892;
var distance = 33.50134;
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
mvMatrix.translate( -0.3893336, 0.1617595, -0.1768129 );
mvMatrix.scale( 1.253382, 1.350726, 0.7421997 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50134);
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
halfenprox<-read.table("halfenprox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-halfenprox$V2
```

```
## Error in eval(expr, envir, enclos): object 'halfenprox' not found
```

```r
y<-halfenprox$V3
```

```
## Error in eval(expr, envir, enclos): object 'halfenprox' not found
```

```r
z<-halfenprox$V4
```

```
## Error in eval(expr, envir, enclos): object 'halfenprox' not found
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
-2.76387, 0.7783334, -0.6745709, 0, 0, 1, 1, 1,
-2.615701, -0.6285725, -1.222239, 1, 0, 0, 1, 1,
-2.592468, -1.571717, -3.362113, 1, 0, 0, 1, 1,
-2.482518, -0.04437079, -2.999616, 1, 0, 0, 1, 1,
-2.46722, -0.660437, -2.362468, 1, 0, 0, 1, 1,
-2.388567, -0.2609874, -1.323962, 1, 0, 0, 1, 1,
-2.360355, -1.848512, -3.033138, 0, 0, 0, 1, 1,
-2.329812, 0.1510005, -0.4916883, 0, 0, 0, 1, 1,
-2.279548, -0.7905644, -2.479555, 0, 0, 0, 1, 1,
-2.235668, -0.2585898, -3.075699, 0, 0, 0, 1, 1,
-2.212871, -0.3708847, -2.106299, 0, 0, 0, 1, 1,
-2.17427, -1.085935, -1.848125, 0, 0, 0, 1, 1,
-2.154501, 0.183291, -3.216773, 0, 0, 0, 1, 1,
-2.15447, 1.29314, -2.123916, 1, 1, 1, 1, 1,
-2.134843, 0.1527103, -2.658414, 1, 1, 1, 1, 1,
-2.118404, -1.434708, -2.424568, 1, 1, 1, 1, 1,
-2.097503, -1.304792, -0.8296412, 1, 1, 1, 1, 1,
-2.050759, 1.009974, -2.148624, 1, 1, 1, 1, 1,
-2.028692, 0.7502337, -3.457908, 1, 1, 1, 1, 1,
-2.013418, -0.9864355, -3.571156, 1, 1, 1, 1, 1,
-2.01188, 1.304956, -0.1775165, 1, 1, 1, 1, 1,
-1.993418, -0.4875087, -1.923391, 1, 1, 1, 1, 1,
-1.989211, 0.8782519, -0.4320173, 1, 1, 1, 1, 1,
-1.977819, 1.479725, -0.4953099, 1, 1, 1, 1, 1,
-1.94325, -1.837652, -1.602017, 1, 1, 1, 1, 1,
-1.918895, 0.3012726, -0.2871805, 1, 1, 1, 1, 1,
-1.856881, -0.04791766, -0.7578831, 1, 1, 1, 1, 1,
-1.854227, -1.944139, -0.9015043, 1, 1, 1, 1, 1,
-1.850467, 0.5017454, 0.3630434, 0, 0, 1, 1, 1,
-1.846695, -1.340374, -3.036185, 1, 0, 0, 1, 1,
-1.839199, -1.227048, -2.690116, 1, 0, 0, 1, 1,
-1.786914, -0.7011491, -2.469744, 1, 0, 0, 1, 1,
-1.767471, -0.1530915, -2.221822, 1, 0, 0, 1, 1,
-1.755588, -1.038268, -0.191296, 1, 0, 0, 1, 1,
-1.748461, 0.0790209, -1.151678, 0, 0, 0, 1, 1,
-1.724677, 0.02855353, -2.196876, 0, 0, 0, 1, 1,
-1.719481, -0.04608339, -0.6526256, 0, 0, 0, 1, 1,
-1.707616, -0.5038087, -1.922285, 0, 0, 0, 1, 1,
-1.689851, 0.7662072, -1.120904, 0, 0, 0, 1, 1,
-1.673147, -0.7686896, -2.018943, 0, 0, 0, 1, 1,
-1.670528, -1.706723, -3.687715, 0, 0, 0, 1, 1,
-1.658989, -0.2676315, -2.194947, 1, 1, 1, 1, 1,
-1.658484, -0.56939, -1.943727, 1, 1, 1, 1, 1,
-1.650704, -0.978767, -1.401463, 1, 1, 1, 1, 1,
-1.646468, -0.3705483, -2.4653, 1, 1, 1, 1, 1,
-1.64512, 0.1445323, -1.470187, 1, 1, 1, 1, 1,
-1.639972, -0.6111966, -1.031166, 1, 1, 1, 1, 1,
-1.633185, -0.7867789, -0.9989205, 1, 1, 1, 1, 1,
-1.596216, 2.011857, -1.104253, 1, 1, 1, 1, 1,
-1.585691, 0.5454608, -2.659658, 1, 1, 1, 1, 1,
-1.583311, -1.712751, -1.684944, 1, 1, 1, 1, 1,
-1.581559, -1.108374, -1.907772, 1, 1, 1, 1, 1,
-1.574278, -1.72208, -0.1388105, 1, 1, 1, 1, 1,
-1.561724, 0.2122259, -1.84436, 1, 1, 1, 1, 1,
-1.545839, 0.1802475, -0.5005736, 1, 1, 1, 1, 1,
-1.526919, -0.00207623, -2.217727, 1, 1, 1, 1, 1,
-1.522866, 1.36559, -0.2232466, 0, 0, 1, 1, 1,
-1.512649, -0.4344444, -1.400696, 1, 0, 0, 1, 1,
-1.509948, -1.8799, -0.4204001, 1, 0, 0, 1, 1,
-1.503958, 0.3390527, -1.120041, 1, 0, 0, 1, 1,
-1.495395, -1.299026, -2.739965, 1, 0, 0, 1, 1,
-1.489529, -0.5602894, -2.358335, 1, 0, 0, 1, 1,
-1.482001, -0.663587, -1.873713, 0, 0, 0, 1, 1,
-1.462915, 0.8214161, -1.850131, 0, 0, 0, 1, 1,
-1.456563, 0.2019452, -1.867969, 0, 0, 0, 1, 1,
-1.451229, -0.007136183, -0.840401, 0, 0, 0, 1, 1,
-1.438691, -2.189455, -1.58571, 0, 0, 0, 1, 1,
-1.430108, -0.4904834, -1.592607, 0, 0, 0, 1, 1,
-1.426568, -0.638701, -3.848875, 0, 0, 0, 1, 1,
-1.426164, 0.15067, -1.956224, 1, 1, 1, 1, 1,
-1.41847, 1.048636, -0.6476023, 1, 1, 1, 1, 1,
-1.413188, -1.69875, -3.377633, 1, 1, 1, 1, 1,
-1.407907, -0.672447, -0.4799184, 1, 1, 1, 1, 1,
-1.399237, -0.05769951, -0.99833, 1, 1, 1, 1, 1,
-1.394974, 0.5792403, -0.2324746, 1, 1, 1, 1, 1,
-1.393504, -0.2837392, -2.854709, 1, 1, 1, 1, 1,
-1.384677, -0.4342267, -2.282473, 1, 1, 1, 1, 1,
-1.370883, -0.3744636, -0.6420951, 1, 1, 1, 1, 1,
-1.37002, 0.2322176, -0.0547911, 1, 1, 1, 1, 1,
-1.363779, -2.60415, -1.838599, 1, 1, 1, 1, 1,
-1.360198, 0.7574747, 1.65559, 1, 1, 1, 1, 1,
-1.339441, 0.2965469, -2.513758, 1, 1, 1, 1, 1,
-1.336906, 1.74205, -1.428594, 1, 1, 1, 1, 1,
-1.329343, -0.4115469, -1.752318, 1, 1, 1, 1, 1,
-1.325963, -0.04408307, -1.440167, 0, 0, 1, 1, 1,
-1.32511, -1.206434, -1.333366, 1, 0, 0, 1, 1,
-1.324728, -0.4909947, -2.187243, 1, 0, 0, 1, 1,
-1.321586, 0.4407386, -0.6202929, 1, 0, 0, 1, 1,
-1.320431, -0.6957124, -1.484326, 1, 0, 0, 1, 1,
-1.310478, -0.3752378, -1.990084, 1, 0, 0, 1, 1,
-1.306389, -0.5882993, -2.69021, 0, 0, 0, 1, 1,
-1.301414, -2.619448, -2.992741, 0, 0, 0, 1, 1,
-1.296483, -1.183642, -3.002701, 0, 0, 0, 1, 1,
-1.292995, 0.4824284, -2.685599, 0, 0, 0, 1, 1,
-1.284629, -1.337576, -3.466551, 0, 0, 0, 1, 1,
-1.277231, -0.05114688, -2.167166, 0, 0, 0, 1, 1,
-1.272321, 0.268893, -1.793048, 0, 0, 0, 1, 1,
-1.261491, -0.9033256, -3.428137, 1, 1, 1, 1, 1,
-1.260206, 0.3713099, 0.3439837, 1, 1, 1, 1, 1,
-1.259367, -1.728062, -3.26091, 1, 1, 1, 1, 1,
-1.257487, 0.4069528, -1.199448, 1, 1, 1, 1, 1,
-1.247952, -0.6513091, -2.561082, 1, 1, 1, 1, 1,
-1.245807, -0.7001568, -2.47684, 1, 1, 1, 1, 1,
-1.243247, 1.101745, 0.3738614, 1, 1, 1, 1, 1,
-1.234388, -1.255831, -2.655291, 1, 1, 1, 1, 1,
-1.229409, -1.353237, -0.9699266, 1, 1, 1, 1, 1,
-1.227143, 0.6659444, -0.620449, 1, 1, 1, 1, 1,
-1.217217, -0.3658679, -1.299688, 1, 1, 1, 1, 1,
-1.214906, 0.1289565, 0.1889342, 1, 1, 1, 1, 1,
-1.207624, 0.4662785, -0.9414736, 1, 1, 1, 1, 1,
-1.205361, -0.08448014, -1.21587, 1, 1, 1, 1, 1,
-1.190919, -1.776831, -2.314619, 1, 1, 1, 1, 1,
-1.190363, 0.8804141, -0.8088078, 0, 0, 1, 1, 1,
-1.189506, -0.3167378, -2.739535, 1, 0, 0, 1, 1,
-1.18945, -1.658663, -3.765104, 1, 0, 0, 1, 1,
-1.187085, -1.462355, -3.128587, 1, 0, 0, 1, 1,
-1.182355, 0.370943, -1.769875, 1, 0, 0, 1, 1,
-1.179005, -0.0835669, -1.145733, 1, 0, 0, 1, 1,
-1.174325, 0.753669, -1.306256, 0, 0, 0, 1, 1,
-1.171507, 0.6886029, -2.422698, 0, 0, 0, 1, 1,
-1.160124, -0.4079961, -2.223652, 0, 0, 0, 1, 1,
-1.159808, -1.382603, -1.04102, 0, 0, 0, 1, 1,
-1.156602, 0.9789689, -1.208572, 0, 0, 0, 1, 1,
-1.143103, -0.4629989, -2.326792, 0, 0, 0, 1, 1,
-1.132134, -0.303814, -3.291235, 0, 0, 0, 1, 1,
-1.128763, -1.96458, -2.58292, 1, 1, 1, 1, 1,
-1.125969, -2.107281, -0.5769402, 1, 1, 1, 1, 1,
-1.121559, -0.1502758, -2.157427, 1, 1, 1, 1, 1,
-1.117826, -0.3229047, -2.202626, 1, 1, 1, 1, 1,
-1.115479, 0.1905686, -1.115311, 1, 1, 1, 1, 1,
-1.11394, -0.2947631, -0.8833615, 1, 1, 1, 1, 1,
-1.103894, 0.6876385, -1.98911, 1, 1, 1, 1, 1,
-1.100698, -0.9417937, -3.723443, 1, 1, 1, 1, 1,
-1.091095, 0.3795069, -1.121976, 1, 1, 1, 1, 1,
-1.089562, 0.4752643, -2.753253, 1, 1, 1, 1, 1,
-1.087944, 0.1528081, -2.834531, 1, 1, 1, 1, 1,
-1.086639, -2.164505, -0.8333418, 1, 1, 1, 1, 1,
-1.070476, -1.625725, -2.187571, 1, 1, 1, 1, 1,
-1.065628, -0.4415685, -0.888755, 1, 1, 1, 1, 1,
-1.064671, -0.06421647, -1.798384, 1, 1, 1, 1, 1,
-1.053798, 0.6426696, -0.807546, 0, 0, 1, 1, 1,
-1.050569, 0.7927641, -1.096439, 1, 0, 0, 1, 1,
-1.032668, 0.4427465, -0.3392129, 1, 0, 0, 1, 1,
-1.032659, 1.091907, -0.04749241, 1, 0, 0, 1, 1,
-1.027721, -0.7343805, -2.620008, 1, 0, 0, 1, 1,
-1.020087, 0.125462, -1.900987, 1, 0, 0, 1, 1,
-1.016712, -2.253455, -1.919181, 0, 0, 0, 1, 1,
-1.00873, 0.9377109, -2.212913, 0, 0, 0, 1, 1,
-1.006826, -1.431342, -4.003665, 0, 0, 0, 1, 1,
-1.004862, 0.3648602, -2.072239, 0, 0, 0, 1, 1,
-1.003167, -0.9882414, -1.670459, 0, 0, 0, 1, 1,
-0.9970188, -0.9345468, -1.094607, 0, 0, 0, 1, 1,
-0.9944072, 0.6152999, -0.7896053, 0, 0, 0, 1, 1,
-0.9865267, 0.2276714, -0.8480654, 1, 1, 1, 1, 1,
-0.9853547, 0.01541877, -2.682589, 1, 1, 1, 1, 1,
-0.9825177, 0.1978867, -1.488696, 1, 1, 1, 1, 1,
-0.9723501, 0.9476354, -1.399013, 1, 1, 1, 1, 1,
-0.9695532, -0.676634, -1.857262, 1, 1, 1, 1, 1,
-0.9686045, -1.138311, -2.152178, 1, 1, 1, 1, 1,
-0.9671969, -1.229984, -1.117035, 1, 1, 1, 1, 1,
-0.964281, 1.522808, -1.915812, 1, 1, 1, 1, 1,
-0.9612737, -0.6938788, -2.209561, 1, 1, 1, 1, 1,
-0.9612002, 0.1886379, -2.853607, 1, 1, 1, 1, 1,
-0.9537621, -0.6479813, -1.105286, 1, 1, 1, 1, 1,
-0.9492514, 1.617865, -0.8813464, 1, 1, 1, 1, 1,
-0.9457946, 1.407528, -0.9765383, 1, 1, 1, 1, 1,
-0.9379964, -0.5199643, -1.03855, 1, 1, 1, 1, 1,
-0.9348975, -0.6005886, -0.9780195, 1, 1, 1, 1, 1,
-0.9265216, 1.580226, 0.2641112, 0, 0, 1, 1, 1,
-0.9244614, -0.2725764, -1.216028, 1, 0, 0, 1, 1,
-0.9211874, 0.12939, -0.974604, 1, 0, 0, 1, 1,
-0.9209104, 1.046309, 0.3301381, 1, 0, 0, 1, 1,
-0.9138501, 1.881211, -0.4585038, 1, 0, 0, 1, 1,
-0.9128841, 1.756401, 0.4861962, 1, 0, 0, 1, 1,
-0.9084471, -0.2031286, -1.248765, 0, 0, 0, 1, 1,
-0.9078864, 0.148509, -1.561815, 0, 0, 0, 1, 1,
-0.9077807, 1.010482, -2.549344, 0, 0, 0, 1, 1,
-0.9062286, -0.9144412, -1.95196, 0, 0, 0, 1, 1,
-0.9060315, -1.684813, -1.261824, 0, 0, 0, 1, 1,
-0.9045666, 1.117368, -1.566683, 0, 0, 0, 1, 1,
-0.899684, -0.5102078, -4.324063, 0, 0, 0, 1, 1,
-0.8979634, 0.841995, -1.016259, 1, 1, 1, 1, 1,
-0.8954887, -0.2832034, -1.587288, 1, 1, 1, 1, 1,
-0.8920999, -0.3712298, -2.465182, 1, 1, 1, 1, 1,
-0.8892592, -1.233386, -3.396888, 1, 1, 1, 1, 1,
-0.88197, -0.5867849, -1.618728, 1, 1, 1, 1, 1,
-0.872103, -0.1579587, -3.626929, 1, 1, 1, 1, 1,
-0.8715889, -0.5718855, -1.762896, 1, 1, 1, 1, 1,
-0.8671614, 0.998643, -0.411403, 1, 1, 1, 1, 1,
-0.8650131, 0.5502496, 0.04347562, 1, 1, 1, 1, 1,
-0.8608322, 0.04882482, -2.201208, 1, 1, 1, 1, 1,
-0.8563426, 1.196433, 0.2253978, 1, 1, 1, 1, 1,
-0.8563409, -0.3791294, -2.249503, 1, 1, 1, 1, 1,
-0.8444622, -0.9230581, -1.646275, 1, 1, 1, 1, 1,
-0.8415459, 0.4480481, -0.2969534, 1, 1, 1, 1, 1,
-0.8343963, -1.395682, -3.554054, 1, 1, 1, 1, 1,
-0.829462, 0.591161, -0.7920387, 0, 0, 1, 1, 1,
-0.8289828, -1.636017, -0.2579462, 1, 0, 0, 1, 1,
-0.8281472, 0.6139699, -1.920035, 1, 0, 0, 1, 1,
-0.8215901, 0.7258731, 0.06689689, 1, 0, 0, 1, 1,
-0.8167632, 1.57479, -2.001364, 1, 0, 0, 1, 1,
-0.8162752, 0.5908917, -2.563713, 1, 0, 0, 1, 1,
-0.8050919, -0.5174588, -0.6487644, 0, 0, 0, 1, 1,
-0.7997685, -0.9194205, -2.882195, 0, 0, 0, 1, 1,
-0.797933, -0.4286415, -2.478935, 0, 0, 0, 1, 1,
-0.7972536, -0.6379263, -0.9179007, 0, 0, 0, 1, 1,
-0.7910805, 0.1721964, -1.245268, 0, 0, 0, 1, 1,
-0.7908149, -0.6473726, -2.833156, 0, 0, 0, 1, 1,
-0.7892289, 0.06730524, -2.066818, 0, 0, 0, 1, 1,
-0.7879116, 0.870928, -1.278393, 1, 1, 1, 1, 1,
-0.787218, 0.2948878, 0.5526099, 1, 1, 1, 1, 1,
-0.7871884, -1.665991, -2.853916, 1, 1, 1, 1, 1,
-0.7835172, -0.3152398, -2.530541, 1, 1, 1, 1, 1,
-0.7762051, 1.848193, -0.2356194, 1, 1, 1, 1, 1,
-0.77189, -0.4627421, -2.480422, 1, 1, 1, 1, 1,
-0.7717766, -0.9109551, -2.008345, 1, 1, 1, 1, 1,
-0.7686318, 0.1257938, -2.052303, 1, 1, 1, 1, 1,
-0.7658299, -0.881084, -3.535092, 1, 1, 1, 1, 1,
-0.7560095, -0.3932644, -2.266207, 1, 1, 1, 1, 1,
-0.7524842, 0.813638, -0.3461674, 1, 1, 1, 1, 1,
-0.750889, 0.3781659, -1.064326, 1, 1, 1, 1, 1,
-0.7460204, 1.156241, -0.7928218, 1, 1, 1, 1, 1,
-0.7412851, -0.7754291, -2.04376, 1, 1, 1, 1, 1,
-0.736677, -0.03603957, -1.483042, 1, 1, 1, 1, 1,
-0.734695, -1.416711, -3.203914, 0, 0, 1, 1, 1,
-0.7261105, -0.5511735, -1.107414, 1, 0, 0, 1, 1,
-0.7236333, 0.0570844, -0.4802349, 1, 0, 0, 1, 1,
-0.7217564, 0.04174207, -1.826327, 1, 0, 0, 1, 1,
-0.7211381, 1.570973, -1.210288, 1, 0, 0, 1, 1,
-0.7200985, -1.385846, -1.156483, 1, 0, 0, 1, 1,
-0.7191892, 0.5077803, -1.339424, 0, 0, 0, 1, 1,
-0.7177573, -2.600665, -0.9234636, 0, 0, 0, 1, 1,
-0.7168891, -0.9396727, -0.7978565, 0, 0, 0, 1, 1,
-0.7150481, -0.9351841, -2.375051, 0, 0, 0, 1, 1,
-0.704463, 0.8201129, -0.5473773, 0, 0, 0, 1, 1,
-0.699065, 0.2886803, -0.783106, 0, 0, 0, 1, 1,
-0.6971501, 0.9215702, -2.577495, 0, 0, 0, 1, 1,
-0.6930851, -0.2870661, -1.766248, 1, 1, 1, 1, 1,
-0.6902541, -1.042693, -0.9752953, 1, 1, 1, 1, 1,
-0.6887298, -0.921244, -1.272284, 1, 1, 1, 1, 1,
-0.6878287, -0.3202465, -1.934653, 1, 1, 1, 1, 1,
-0.6733535, 0.2661212, -2.226712, 1, 1, 1, 1, 1,
-0.6718233, -0.8639377, -4.477653, 1, 1, 1, 1, 1,
-0.6705931, -1.509736, -1.960743, 1, 1, 1, 1, 1,
-0.6700831, 0.3440628, 0.01576119, 1, 1, 1, 1, 1,
-0.6669999, 2.305511, 1.574551, 1, 1, 1, 1, 1,
-0.6642089, 1.302128, -1.172733, 1, 1, 1, 1, 1,
-0.6584661, 1.236462, 1.184754, 1, 1, 1, 1, 1,
-0.6562051, 0.02878206, -1.656141, 1, 1, 1, 1, 1,
-0.6555336, 1.347692, -0.7699454, 1, 1, 1, 1, 1,
-0.6550177, -0.5781278, -3.258754, 1, 1, 1, 1, 1,
-0.6538417, -0.4705227, -1.071434, 1, 1, 1, 1, 1,
-0.6528952, -0.154627, -2.775893, 0, 0, 1, 1, 1,
-0.6502293, 0.5741086, -0.0784313, 1, 0, 0, 1, 1,
-0.6324003, 1.127042, -1.776545, 1, 0, 0, 1, 1,
-0.6286023, 0.7844481, -0.5314271, 1, 0, 0, 1, 1,
-0.6263731, -0.09314219, -2.083563, 1, 0, 0, 1, 1,
-0.6255141, -0.1567017, -0.9191487, 1, 0, 0, 1, 1,
-0.6242624, -1.275831, -4.038992, 0, 0, 0, 1, 1,
-0.6229209, 0.9105921, -0.4474698, 0, 0, 0, 1, 1,
-0.6184022, -1.368473, -1.567112, 0, 0, 0, 1, 1,
-0.6156905, -0.6943742, -2.653154, 0, 0, 0, 1, 1,
-0.6104794, 1.005195, 0.7261804, 0, 0, 0, 1, 1,
-0.6092942, 0.500231, -0.7363699, 0, 0, 0, 1, 1,
-0.605669, 0.7378063, -0.3902315, 0, 0, 0, 1, 1,
-0.5998964, 0.3987435, -0.7730699, 1, 1, 1, 1, 1,
-0.5949734, 1.0249, -0.3190307, 1, 1, 1, 1, 1,
-0.5922797, -0.6546094, -2.444068, 1, 1, 1, 1, 1,
-0.5876238, 0.1822748, 0.3815913, 1, 1, 1, 1, 1,
-0.583765, 0.2688549, -0.6167182, 1, 1, 1, 1, 1,
-0.5823146, 0.1712955, -0.03152837, 1, 1, 1, 1, 1,
-0.5751601, 1.66951, 0.06947483, 1, 1, 1, 1, 1,
-0.574842, 1.155431, -0.163422, 1, 1, 1, 1, 1,
-0.573476, -0.5490299, -1.415201, 1, 1, 1, 1, 1,
-0.5724405, -0.9399484, -2.982711, 1, 1, 1, 1, 1,
-0.5708189, 0.3159565, -1.046004, 1, 1, 1, 1, 1,
-0.5707644, 0.5366839, 0.455711, 1, 1, 1, 1, 1,
-0.5688523, -0.02094948, -0.7472652, 1, 1, 1, 1, 1,
-0.5676615, 0.4231947, 0.9036233, 1, 1, 1, 1, 1,
-0.5668471, -0.04252817, -1.735257, 1, 1, 1, 1, 1,
-0.5649157, -1.292339, -1.992381, 0, 0, 1, 1, 1,
-0.5631787, 0.2338638, -0.6209397, 1, 0, 0, 1, 1,
-0.5589708, -0.4885409, -3.494179, 1, 0, 0, 1, 1,
-0.5547184, -0.2831673, -0.6931264, 1, 0, 0, 1, 1,
-0.5539227, -1.02698, -4.349941, 1, 0, 0, 1, 1,
-0.5530509, -0.3661838, -2.521951, 1, 0, 0, 1, 1,
-0.552119, 0.6503468, -2.598129, 0, 0, 0, 1, 1,
-0.5499519, 0.3697602, -1.53706, 0, 0, 0, 1, 1,
-0.5491945, 1.463857, -0.2690111, 0, 0, 0, 1, 1,
-0.5390525, -1.744096, -1.631803, 0, 0, 0, 1, 1,
-0.5386568, 1.619737, 2.081825, 0, 0, 0, 1, 1,
-0.5324179, -1.930724, -2.165859, 0, 0, 0, 1, 1,
-0.5314354, 0.8507876, 0.03064581, 0, 0, 0, 1, 1,
-0.5249586, 0.6801885, -0.3161064, 1, 1, 1, 1, 1,
-0.5233993, -0.9009134, -1.36477, 1, 1, 1, 1, 1,
-0.523106, -0.7816421, -1.437808, 1, 1, 1, 1, 1,
-0.5200959, -0.37012, -2.375029, 1, 1, 1, 1, 1,
-0.5162767, -0.2149489, -1.906266, 1, 1, 1, 1, 1,
-0.5095853, 0.2444739, -1.995839, 1, 1, 1, 1, 1,
-0.5090312, -0.1686593, -2.524003, 1, 1, 1, 1, 1,
-0.508441, -1.165439, -3.700855, 1, 1, 1, 1, 1,
-0.5074553, 1.561552, -0.4182729, 1, 1, 1, 1, 1,
-0.4992276, 0.3130241, -0.1566166, 1, 1, 1, 1, 1,
-0.4990564, 0.0179532, -2.575138, 1, 1, 1, 1, 1,
-0.48976, 1.417646, 0.3884138, 1, 1, 1, 1, 1,
-0.4870071, 0.3069883, -0.754607, 1, 1, 1, 1, 1,
-0.4859008, -0.7462578, -3.212209, 1, 1, 1, 1, 1,
-0.4856294, -0.08573128, -1.144481, 1, 1, 1, 1, 1,
-0.4838874, 0.4969561, -0.6872111, 0, 0, 1, 1, 1,
-0.4729834, 0.2210588, -2.253495, 1, 0, 0, 1, 1,
-0.4607297, -0.9728812, -1.738654, 1, 0, 0, 1, 1,
-0.4554113, 0.4140838, -1.771159, 1, 0, 0, 1, 1,
-0.4553647, 0.3716905, 0.1658308, 1, 0, 0, 1, 1,
-0.4518958, 1.367101, 1.6166, 1, 0, 0, 1, 1,
-0.4504745, 0.1908426, -0.4311714, 0, 0, 0, 1, 1,
-0.4504137, -0.8496603, -3.097872, 0, 0, 0, 1, 1,
-0.4503261, 0.8255618, -3.023488, 0, 0, 0, 1, 1,
-0.4469557, 1.630175, 0.1014801, 0, 0, 0, 1, 1,
-0.4454823, 0.6279212, 0.2681156, 0, 0, 0, 1, 1,
-0.4438788, 0.8393277, -1.524368, 0, 0, 0, 1, 1,
-0.4419213, 0.4643865, -0.3683741, 0, 0, 0, 1, 1,
-0.4411333, -0.05609646, -3.082227, 1, 1, 1, 1, 1,
-0.4400848, -1.399036, -3.113039, 1, 1, 1, 1, 1,
-0.4399011, -0.7276424, -2.264631, 1, 1, 1, 1, 1,
-0.4350847, -1.180351, -1.475743, 1, 1, 1, 1, 1,
-0.4302425, -1.19375, -2.497566, 1, 1, 1, 1, 1,
-0.4205292, 0.7747275, -2.611633, 1, 1, 1, 1, 1,
-0.4171205, -0.5454145, -0.2044971, 1, 1, 1, 1, 1,
-0.4122649, -0.5877642, -2.515899, 1, 1, 1, 1, 1,
-0.4104013, 1.541751, -0.002467793, 1, 1, 1, 1, 1,
-0.4063787, -2.042382, -1.024986, 1, 1, 1, 1, 1,
-0.4035724, -0.6245339, -0.8408242, 1, 1, 1, 1, 1,
-0.4033954, 1.072677, 0.0113994, 1, 1, 1, 1, 1,
-0.4020313, -0.05613269, 0.2183136, 1, 1, 1, 1, 1,
-0.4017621, 0.2078113, 0.2146354, 1, 1, 1, 1, 1,
-0.3820212, 0.9689113, -0.4878798, 1, 1, 1, 1, 1,
-0.3812703, 0.4947013, 1.590418, 0, 0, 1, 1, 1,
-0.3793225, 0.5725634, -1.971798, 1, 0, 0, 1, 1,
-0.3783981, -0.5035253, -3.484066, 1, 0, 0, 1, 1,
-0.3751088, -0.507576, -3.283221, 1, 0, 0, 1, 1,
-0.3750853, -0.9350049, -2.67256, 1, 0, 0, 1, 1,
-0.3738797, 0.09291937, -1.525564, 1, 0, 0, 1, 1,
-0.372944, -0.6809387, -2.458045, 0, 0, 0, 1, 1,
-0.3685339, -2.012155, -2.674131, 0, 0, 0, 1, 1,
-0.3674742, -0.6734768, -3.890036, 0, 0, 0, 1, 1,
-0.3673629, -0.8598834, -1.882044, 0, 0, 0, 1, 1,
-0.3649851, 1.114689, -0.5954311, 0, 0, 0, 1, 1,
-0.3636496, 0.3027921, -0.2346615, 0, 0, 0, 1, 1,
-0.361399, -1.368401, -4.077573, 0, 0, 0, 1, 1,
-0.3581747, 0.3081446, -1.199922, 1, 1, 1, 1, 1,
-0.3567985, -2.436363, -4.852495, 1, 1, 1, 1, 1,
-0.3562897, -1.51066, -3.439379, 1, 1, 1, 1, 1,
-0.3555709, 0.1398076, -1.400935, 1, 1, 1, 1, 1,
-0.3535813, 1.564952, 0.09504726, 1, 1, 1, 1, 1,
-0.3453415, -1.54376, -2.845385, 1, 1, 1, 1, 1,
-0.3410721, -0.2570457, -3.737448, 1, 1, 1, 1, 1,
-0.340739, 1.975064, -1.302664, 1, 1, 1, 1, 1,
-0.3403714, -1.217684, -1.597904, 1, 1, 1, 1, 1,
-0.339243, -0.8677692, -1.995508, 1, 1, 1, 1, 1,
-0.339063, 0.2712038, -0.623509, 1, 1, 1, 1, 1,
-0.3384224, 0.531199, -0.2941667, 1, 1, 1, 1, 1,
-0.3382954, -1.330258, -2.880865, 1, 1, 1, 1, 1,
-0.3382907, -0.4218918, -3.059716, 1, 1, 1, 1, 1,
-0.3379396, 0.5704938, -1.28145, 1, 1, 1, 1, 1,
-0.3354105, 0.69194, 1.035503, 0, 0, 1, 1, 1,
-0.3273236, 0.7908543, -0.3779778, 1, 0, 0, 1, 1,
-0.326879, 2.100987, 0.1737091, 1, 0, 0, 1, 1,
-0.3264948, 0.2233758, -1.266991, 1, 0, 0, 1, 1,
-0.3243046, 0.213074, -2.599435, 1, 0, 0, 1, 1,
-0.3218524, -1.61758, -2.542305, 1, 0, 0, 1, 1,
-0.3211381, 1.188745, -0.9740036, 0, 0, 0, 1, 1,
-0.3209337, -0.8704222, -2.823925, 0, 0, 0, 1, 1,
-0.3160129, 2.098688, 1.360076, 0, 0, 0, 1, 1,
-0.3159574, -0.7051926, -2.853108, 0, 0, 0, 1, 1,
-0.3157849, -0.2377537, -1.979324, 0, 0, 0, 1, 1,
-0.3123769, -0.02574777, -2.015446, 0, 0, 0, 1, 1,
-0.3101538, -1.044412, -2.689811, 0, 0, 0, 1, 1,
-0.3089355, -0.800373, -2.837818, 1, 1, 1, 1, 1,
-0.3086092, -0.07119162, -1.390238, 1, 1, 1, 1, 1,
-0.3081474, -0.8845401, -3.455581, 1, 1, 1, 1, 1,
-0.3000201, -0.7853464, -2.27167, 1, 1, 1, 1, 1,
-0.2950496, 1.347802, -0.6041973, 1, 1, 1, 1, 1,
-0.2917364, 0.4633821, -0.1308856, 1, 1, 1, 1, 1,
-0.2906554, -0.2048167, -2.927, 1, 1, 1, 1, 1,
-0.2830177, 1.525068, 0.313916, 1, 1, 1, 1, 1,
-0.2828009, 0.8104727, -0.3848433, 1, 1, 1, 1, 1,
-0.2816882, -1.363952, -2.046121, 1, 1, 1, 1, 1,
-0.2768202, -0.1743031, -1.047781, 1, 1, 1, 1, 1,
-0.2737795, 1.696558, -0.9108672, 1, 1, 1, 1, 1,
-0.2734914, -0.4795528, -3.636417, 1, 1, 1, 1, 1,
-0.2726259, -0.08202047, -2.658449, 1, 1, 1, 1, 1,
-0.2663058, 0.4303441, -0.9272038, 1, 1, 1, 1, 1,
-0.2649723, 0.9739316, -0.8523338, 0, 0, 1, 1, 1,
-0.2613428, 1.231336, 0.261473, 1, 0, 0, 1, 1,
-0.2522556, 1.06177, 3.02955, 1, 0, 0, 1, 1,
-0.2496474, 0.9905926, 0.7495872, 1, 0, 0, 1, 1,
-0.2494434, 1.008999, 0.3055122, 1, 0, 0, 1, 1,
-0.2424807, 2.572553, 0.6650479, 1, 0, 0, 1, 1,
-0.2424657, -0.02114088, -0.9375997, 0, 0, 0, 1, 1,
-0.2363476, 0.6585314, -1.962583, 0, 0, 0, 1, 1,
-0.2326359, -0.7452011, -3.654498, 0, 0, 0, 1, 1,
-0.2272302, 1.027931, -1.12086, 0, 0, 0, 1, 1,
-0.2243131, 0.3267417, -0.1995062, 0, 0, 0, 1, 1,
-0.2237357, 0.1143769, -0.9088213, 0, 0, 0, 1, 1,
-0.2216567, -0.200206, -2.697728, 0, 0, 0, 1, 1,
-0.2200098, -0.7215793, -2.185363, 1, 1, 1, 1, 1,
-0.2187021, 0.5238182, 0.3859594, 1, 1, 1, 1, 1,
-0.2180304, 0.1742001, -1.448467, 1, 1, 1, 1, 1,
-0.2171218, -1.492364, -4.532306, 1, 1, 1, 1, 1,
-0.2162921, 1.692576, -0.02474199, 1, 1, 1, 1, 1,
-0.2062347, 1.917491, 1.357631, 1, 1, 1, 1, 1,
-0.205042, 1.354303, -0.1238557, 1, 1, 1, 1, 1,
-0.2015645, -0.8180396, -2.135713, 1, 1, 1, 1, 1,
-0.1989269, -0.7873362, -2.951887, 1, 1, 1, 1, 1,
-0.19799, 0.5030409, 0.5736917, 1, 1, 1, 1, 1,
-0.194261, -1.076433, -2.815608, 1, 1, 1, 1, 1,
-0.1930653, 1.059583, -2.596521, 1, 1, 1, 1, 1,
-0.1816674, 1.700868, -1.030975, 1, 1, 1, 1, 1,
-0.1802023, -0.3181186, -3.641723, 1, 1, 1, 1, 1,
-0.1750042, -1.262148, -4.667022, 1, 1, 1, 1, 1,
-0.1739353, 1.26863, 0.003619012, 0, 0, 1, 1, 1,
-0.1735409, 0.1865059, -1.756474, 1, 0, 0, 1, 1,
-0.1730784, 0.4138682, -1.823112, 1, 0, 0, 1, 1,
-0.1719027, 1.409155, -0.7666284, 1, 0, 0, 1, 1,
-0.1680934, -0.5665095, -4.785046, 1, 0, 0, 1, 1,
-0.167582, 0.6692795, -0.04264042, 1, 0, 0, 1, 1,
-0.1665483, -1.351681, -2.761344, 0, 0, 0, 1, 1,
-0.1616651, -0.6527033, -2.440572, 0, 0, 0, 1, 1,
-0.1563039, -1.21511, -3.591203, 0, 0, 0, 1, 1,
-0.1547527, 0.6066868, -0.1511752, 0, 0, 0, 1, 1,
-0.1520702, 0.8239022, 1.042878, 0, 0, 0, 1, 1,
-0.1506698, 1.290226, -0.1746182, 0, 0, 0, 1, 1,
-0.1425169, -0.902874, -3.134652, 0, 0, 0, 1, 1,
-0.139845, -0.1239397, -2.499059, 1, 1, 1, 1, 1,
-0.1386202, 0.05212929, -0.08233947, 1, 1, 1, 1, 1,
-0.1364086, 2.546094, -1.335756, 1, 1, 1, 1, 1,
-0.1363733, -0.08259097, -2.830467, 1, 1, 1, 1, 1,
-0.1356457, 2.040042, 0.5993488, 1, 1, 1, 1, 1,
-0.1334477, -0.4261812, -3.034333, 1, 1, 1, 1, 1,
-0.1231477, 0.7342042, -1.724105, 1, 1, 1, 1, 1,
-0.1209553, 0.33463, -1.010116, 1, 1, 1, 1, 1,
-0.1182889, 2.002196, -2.635586, 1, 1, 1, 1, 1,
-0.118074, -0.8143228, -3.415232, 1, 1, 1, 1, 1,
-0.1166573, -0.838173, -4.659168, 1, 1, 1, 1, 1,
-0.1140694, 0.31691, 2.371267, 1, 1, 1, 1, 1,
-0.1132295, 1.383985, 0.3033865, 1, 1, 1, 1, 1,
-0.1127433, 0.6200259, 0.6091786, 1, 1, 1, 1, 1,
-0.1090771, -0.2184771, -3.500807, 1, 1, 1, 1, 1,
-0.1076526, 0.9164973, -0.08344599, 0, 0, 1, 1, 1,
-0.106985, 1.159263, 1.494248, 1, 0, 0, 1, 1,
-0.09677681, -0.3206554, -3.798162, 1, 0, 0, 1, 1,
-0.09415366, -0.7456559, -2.182082, 1, 0, 0, 1, 1,
-0.09196049, 1.172201, -0.7866696, 1, 0, 0, 1, 1,
-0.08730776, 0.1924329, -2.052243, 1, 0, 0, 1, 1,
-0.08605952, -0.8568308, -4.010958, 0, 0, 0, 1, 1,
-0.08580959, -1.27573, -3.205751, 0, 0, 0, 1, 1,
-0.08450703, -0.1326314, -4.289421, 0, 0, 0, 1, 1,
-0.08359513, -1.075857, -5.148126, 0, 0, 0, 1, 1,
-0.07776627, 1.156911, -0.5581071, 0, 0, 0, 1, 1,
-0.07512233, 2.024863, 1.077054, 0, 0, 0, 1, 1,
-0.07076576, 0.4265288, -0.01125244, 0, 0, 0, 1, 1,
-0.06717163, -0.7151803, -3.193556, 1, 1, 1, 1, 1,
-0.06580814, -0.9689974, -2.303078, 1, 1, 1, 1, 1,
-0.06502724, 0.855728, -0.8357106, 1, 1, 1, 1, 1,
-0.0630757, -1.083648, -2.305946, 1, 1, 1, 1, 1,
-0.06286147, -0.3372181, -3.343296, 1, 1, 1, 1, 1,
-0.06092596, -0.2165713, -1.406208, 1, 1, 1, 1, 1,
-0.0548164, 1.200423, 1.538044, 1, 1, 1, 1, 1,
-0.05451858, 1.18093, 0.3025985, 1, 1, 1, 1, 1,
-0.05407635, -0.3326477, -3.059539, 1, 1, 1, 1, 1,
-0.05300637, 0.8608125, -1.989587, 1, 1, 1, 1, 1,
-0.05084908, 1.40449, -0.2651753, 1, 1, 1, 1, 1,
-0.0504697, 1.638867, -1.395864, 1, 1, 1, 1, 1,
-0.04199632, -1.062133, -3.909883, 1, 1, 1, 1, 1,
-0.04028474, -0.4531437, -3.663865, 1, 1, 1, 1, 1,
-0.03937193, -0.177628, -2.653477, 1, 1, 1, 1, 1,
-0.03609403, 1.809638, -0.2554225, 0, 0, 1, 1, 1,
-0.03506186, 0.8932433, 1.830572, 1, 0, 0, 1, 1,
-0.03027907, -0.5026103, -4.441546, 1, 0, 0, 1, 1,
-0.02839292, 2.353211, -0.1169622, 1, 0, 0, 1, 1,
-0.02582514, -0.6479212, -4.153757, 1, 0, 0, 1, 1,
-0.02375881, -1.176188, -3.140331, 1, 0, 0, 1, 1,
-0.02195731, 1.866286, -1.349852, 0, 0, 0, 1, 1,
-0.02088954, -0.1804512, -1.652515, 0, 0, 0, 1, 1,
-0.02004176, -1.041187, -2.897625, 0, 0, 0, 1, 1,
-0.01775007, 0.8543016, -0.2430185, 0, 0, 0, 1, 1,
-0.01733325, -0.8372256, -4.466494, 0, 0, 0, 1, 1,
-0.01667857, -1.037263, -4.742307, 0, 0, 0, 1, 1,
-0.01534448, -2.434068, -2.790861, 0, 0, 0, 1, 1,
-0.01412919, 0.2764685, -0.7068844, 1, 1, 1, 1, 1,
-0.01353688, 0.1188926, 1.870544, 1, 1, 1, 1, 1,
-0.01306241, 0.2230882, 1.357911, 1, 1, 1, 1, 1,
-0.01023404, 1.951377, -0.2943096, 1, 1, 1, 1, 1,
-0.00828397, -0.2366996, -2.931243, 1, 1, 1, 1, 1,
-0.006503074, -0.2987898, -2.417626, 1, 1, 1, 1, 1,
-0.003518459, 0.006753412, -1.698912, 1, 1, 1, 1, 1,
-0.002788165, 1.294045, -0.2158133, 1, 1, 1, 1, 1,
-0.002434165, 1.269858, 0.01822973, 1, 1, 1, 1, 1,
-0.0003933695, -1.206974, -1.955567, 1, 1, 1, 1, 1,
0.002550502, 0.7169735, -0.4499229, 1, 1, 1, 1, 1,
0.006568655, -0.4140376, 4.725757, 1, 1, 1, 1, 1,
0.01075262, -0.7238662, 2.592926, 1, 1, 1, 1, 1,
0.01110318, 1.656046, -1.918848, 1, 1, 1, 1, 1,
0.01124083, 0.2011848, 1.186309, 1, 1, 1, 1, 1,
0.01612102, -0.4709963, 4.590723, 0, 0, 1, 1, 1,
0.01703565, 1.839393, -0.7004221, 1, 0, 0, 1, 1,
0.0211326, -1.340695, 3.580338, 1, 0, 0, 1, 1,
0.02204231, 0.7702863, 0.5308826, 1, 0, 0, 1, 1,
0.02515201, -1.441175, 3.688019, 1, 0, 0, 1, 1,
0.02891066, -0.7996712, 2.98316, 1, 0, 0, 1, 1,
0.02969002, -1.122514, 2.709872, 0, 0, 0, 1, 1,
0.03463553, -0.7078634, 3.846437, 0, 0, 0, 1, 1,
0.03618907, 1.329092, 0.482428, 0, 0, 0, 1, 1,
0.03896492, -1.500088, 1.612011, 0, 0, 0, 1, 1,
0.03942278, -0.8232005, 5.501752, 0, 0, 0, 1, 1,
0.04038425, -0.5569853, 2.264661, 0, 0, 0, 1, 1,
0.04038549, 0.5834495, 1.127083, 0, 0, 0, 1, 1,
0.04041005, 0.5920863, 1.112552, 1, 1, 1, 1, 1,
0.04242581, -1.352179, 1.926581, 1, 1, 1, 1, 1,
0.04341398, -0.8618232, 2.606039, 1, 1, 1, 1, 1,
0.05350031, 0.5635442, -0.05540632, 1, 1, 1, 1, 1,
0.05352194, -0.3570395, 1.791135, 1, 1, 1, 1, 1,
0.0579222, 0.3550371, 0.7233043, 1, 1, 1, 1, 1,
0.05973717, -0.7411951, 2.218158, 1, 1, 1, 1, 1,
0.06126577, -1.420022, 1.700531, 1, 1, 1, 1, 1,
0.06614906, -0.5963936, 3.547114, 1, 1, 1, 1, 1,
0.0662359, 0.4644922, -0.5666576, 1, 1, 1, 1, 1,
0.06632573, -0.3818343, 0.6289679, 1, 1, 1, 1, 1,
0.0678604, 0.1969602, 1.640045, 1, 1, 1, 1, 1,
0.06865082, -1.919525, 3.764195, 1, 1, 1, 1, 1,
0.07811495, 1.049766, 1.449244, 1, 1, 1, 1, 1,
0.08193318, -0.3647335, 2.984504, 1, 1, 1, 1, 1,
0.08670253, 0.4949377, -0.8532439, 0, 0, 1, 1, 1,
0.08802888, -0.2506931, 2.695435, 1, 0, 0, 1, 1,
0.08830582, -0.3280095, 2.516037, 1, 0, 0, 1, 1,
0.09245173, -1.664879, 4.170105, 1, 0, 0, 1, 1,
0.09372182, -0.0385567, 2.044975, 1, 0, 0, 1, 1,
0.09423686, 0.2869273, 2.269084, 1, 0, 0, 1, 1,
0.0976254, 0.1635621, 0.7289838, 0, 0, 0, 1, 1,
0.1023266, 1.112675, -0.1446119, 0, 0, 0, 1, 1,
0.1044227, -0.2324748, 2.273026, 0, 0, 0, 1, 1,
0.1072436, -0.07310227, 0.4714933, 0, 0, 0, 1, 1,
0.1123441, -0.5049446, 3.507148, 0, 0, 0, 1, 1,
0.1215941, -1.598509, 1.407777, 0, 0, 0, 1, 1,
0.1283282, -0.321938, 3.077793, 0, 0, 0, 1, 1,
0.1288859, 0.8831013, 1.168841, 1, 1, 1, 1, 1,
0.1325995, -0.08353777, 2.678418, 1, 1, 1, 1, 1,
0.143044, 1.594366, 1.53537, 1, 1, 1, 1, 1,
0.1448432, -1.404521, 2.929318, 1, 1, 1, 1, 1,
0.1464327, 0.2944097, 2.133672, 1, 1, 1, 1, 1,
0.1486745, -1.238875, 5.157399, 1, 1, 1, 1, 1,
0.154903, -1.17227, 2.00772, 1, 1, 1, 1, 1,
0.1551841, 1.288642, -1.339503, 1, 1, 1, 1, 1,
0.1592632, 0.3871985, -0.3902725, 1, 1, 1, 1, 1,
0.160023, -0.50666, 3.067182, 1, 1, 1, 1, 1,
0.1605094, -1.250553, 2.48334, 1, 1, 1, 1, 1,
0.1611827, -0.0246022, 0.758599, 1, 1, 1, 1, 1,
0.1645038, 0.5657967, 0.1304892, 1, 1, 1, 1, 1,
0.1647328, 0.1526027, -0.1198261, 1, 1, 1, 1, 1,
0.1649707, -0.08325691, 1.668073, 1, 1, 1, 1, 1,
0.1711102, 0.5825311, -0.6450425, 0, 0, 1, 1, 1,
0.1758606, 1.885586, 1.0356, 1, 0, 0, 1, 1,
0.1780428, 0.5662441, 0.8568594, 1, 0, 0, 1, 1,
0.1834285, 0.7932852, -0.01178967, 1, 0, 0, 1, 1,
0.1840383, -0.2733642, 1.202746, 1, 0, 0, 1, 1,
0.1842123, 0.4662574, 0.7667196, 1, 0, 0, 1, 1,
0.1857808, -0.01679139, 1.132638, 0, 0, 0, 1, 1,
0.1876404, 0.1803509, 0.7366135, 0, 0, 0, 1, 1,
0.1905685, -1.238267, 3.224486, 0, 0, 0, 1, 1,
0.1988331, 0.5456095, 0.8396482, 0, 0, 0, 1, 1,
0.1991113, -1.981195, 3.1077, 0, 0, 0, 1, 1,
0.2036285, 0.01516014, 2.209736, 0, 0, 0, 1, 1,
0.2059846, 0.3855762, 1.609671, 0, 0, 0, 1, 1,
0.2099394, 0.7130392, -0.9335694, 1, 1, 1, 1, 1,
0.2180432, 0.9391479, -0.2315783, 1, 1, 1, 1, 1,
0.2185653, -1.126116, 2.646986, 1, 1, 1, 1, 1,
0.2235284, -0.6007087, 4.303342, 1, 1, 1, 1, 1,
0.2324525, 0.6406159, -0.5167631, 1, 1, 1, 1, 1,
0.2350994, 0.4401786, 1.857185, 1, 1, 1, 1, 1,
0.2367758, -0.425001, 3.645041, 1, 1, 1, 1, 1,
0.2370005, -1.241616, 2.88473, 1, 1, 1, 1, 1,
0.2383894, 0.462171, 0.9799941, 1, 1, 1, 1, 1,
0.2413214, -0.6724153, 1.248392, 1, 1, 1, 1, 1,
0.2447522, 0.5579578, 1.388525, 1, 1, 1, 1, 1,
0.2462206, 0.02618963, 2.353374, 1, 1, 1, 1, 1,
0.2475697, -0.8906568, 4.31209, 1, 1, 1, 1, 1,
0.248421, 2.267943, -0.2984557, 1, 1, 1, 1, 1,
0.2499523, -0.8328704, 2.422373, 1, 1, 1, 1, 1,
0.2519954, -0.06640206, 2.304129, 0, 0, 1, 1, 1,
0.2524033, -0.514391, 2.655773, 1, 0, 0, 1, 1,
0.2601998, 0.2977702, 0.4230788, 1, 0, 0, 1, 1,
0.2619032, 1.017802, -0.4014163, 1, 0, 0, 1, 1,
0.26994, 0.5382181, -0.06917232, 1, 0, 0, 1, 1,
0.2702733, -0.9120547, 3.026768, 1, 0, 0, 1, 1,
0.2712868, -0.4822922, 2.839319, 0, 0, 0, 1, 1,
0.2722862, -0.5994619, 2.669892, 0, 0, 0, 1, 1,
0.2734959, 1.553034, -0.0143901, 0, 0, 0, 1, 1,
0.2832626, -0.5803424, 3.005657, 0, 0, 0, 1, 1,
0.2886187, -0.6266972, 1.92856, 0, 0, 0, 1, 1,
0.2960908, -0.7418915, 3.358423, 0, 0, 0, 1, 1,
0.2965242, 1.275898, 1.159498, 0, 0, 0, 1, 1,
0.2989772, 2.109278, 0.4514243, 1, 1, 1, 1, 1,
0.2996653, -0.6335734, 0.68699, 1, 1, 1, 1, 1,
0.302054, -1.931436, 5.202374, 1, 1, 1, 1, 1,
0.3050368, -0.2000688, 0.5234652, 1, 1, 1, 1, 1,
0.3061435, -1.102131, 3.86033, 1, 1, 1, 1, 1,
0.3082699, 0.2240442, 0.5795625, 1, 1, 1, 1, 1,
0.3105644, -1.065292, 3.322864, 1, 1, 1, 1, 1,
0.3106465, -0.5724862, 3.424576, 1, 1, 1, 1, 1,
0.3112562, 0.4690888, -0.2822159, 1, 1, 1, 1, 1,
0.3144695, -1.281919, 3.983185, 1, 1, 1, 1, 1,
0.3190713, 1.939899, -1.641938, 1, 1, 1, 1, 1,
0.3219598, -1.813624, 1.175328, 1, 1, 1, 1, 1,
0.3235993, -0.4340712, 1.203264, 1, 1, 1, 1, 1,
0.3275265, 1.014428, -0.1335393, 1, 1, 1, 1, 1,
0.329109, -0.5572702, 1.98088, 1, 1, 1, 1, 1,
0.3296645, -0.7073149, 1.89194, 0, 0, 1, 1, 1,
0.3324105, -0.4075734, 3.148842, 1, 0, 0, 1, 1,
0.3340557, -1.13457, 2.588114, 1, 0, 0, 1, 1,
0.3374703, 0.6147797, 2.720413, 1, 0, 0, 1, 1,
0.344533, -0.6725629, 3.306746, 1, 0, 0, 1, 1,
0.3456741, -0.261196, 2.263872, 1, 0, 0, 1, 1,
0.3480199, 1.171027, -1.410027, 0, 0, 0, 1, 1,
0.3510558, -0.9635782, 4.147227, 0, 0, 0, 1, 1,
0.3551129, -0.1950132, 1.369094, 0, 0, 0, 1, 1,
0.355222, 0.4845266, 0.9446822, 0, 0, 0, 1, 1,
0.3621894, -0.5287753, 2.920731, 0, 0, 0, 1, 1,
0.3654878, -0.03749638, -0.4482754, 0, 0, 0, 1, 1,
0.3737787, 0.4157685, 1.0837, 0, 0, 0, 1, 1,
0.3741395, -0.8266975, 1.186804, 1, 1, 1, 1, 1,
0.3746368, -0.8087469, 3.622233, 1, 1, 1, 1, 1,
0.3764288, 0.5276769, 0.7165394, 1, 1, 1, 1, 1,
0.379822, 1.001227, -0.5637693, 1, 1, 1, 1, 1,
0.3806246, 0.009842864, 1.76785, 1, 1, 1, 1, 1,
0.3841718, -2.314283, 1.770995, 1, 1, 1, 1, 1,
0.3910035, -1.853446, 1.725762, 1, 1, 1, 1, 1,
0.3941646, -1.4636, 2.221541, 1, 1, 1, 1, 1,
0.3957856, -2.093133, 2.080311, 1, 1, 1, 1, 1,
0.4009396, 0.1667947, 3.090167, 1, 1, 1, 1, 1,
0.4015988, 0.9923602, -0.4333968, 1, 1, 1, 1, 1,
0.4045425, -0.336963, 2.218908, 1, 1, 1, 1, 1,
0.4051792, 0.07726305, 1.581771, 1, 1, 1, 1, 1,
0.4079853, -0.1645448, 1.473309, 1, 1, 1, 1, 1,
0.4090899, -0.3136492, 3.668482, 1, 1, 1, 1, 1,
0.4102392, -0.2770008, 2.260608, 0, 0, 1, 1, 1,
0.4113711, 0.3680285, -0.9151609, 1, 0, 0, 1, 1,
0.4114206, 0.008274331, 1.433761, 1, 0, 0, 1, 1,
0.4164246, 0.5673348, 0.6983684, 1, 0, 0, 1, 1,
0.4170016, -0.9410349, 2.194177, 1, 0, 0, 1, 1,
0.4200545, 0.07416636, -1.342797, 1, 0, 0, 1, 1,
0.4235387, 0.2106363, 2.370491, 0, 0, 0, 1, 1,
0.4261051, 1.855758, -1.00273, 0, 0, 0, 1, 1,
0.4301515, -1.273139, 2.692945, 0, 0, 0, 1, 1,
0.4325481, -0.7148445, 1.718843, 0, 0, 0, 1, 1,
0.4334707, 0.5792724, 0.7290806, 0, 0, 0, 1, 1,
0.4337875, 0.9911699, 1.264097, 0, 0, 0, 1, 1,
0.4358564, -0.8972725, 2.961568, 0, 0, 0, 1, 1,
0.4372659, -0.2498979, 2.021761, 1, 1, 1, 1, 1,
0.4378272, -1.0486, 2.635559, 1, 1, 1, 1, 1,
0.439034, -0.5678552, 2.796314, 1, 1, 1, 1, 1,
0.4394083, -0.3339281, 2.754174, 1, 1, 1, 1, 1,
0.4416747, 0.4838786, 2.866224, 1, 1, 1, 1, 1,
0.4428609, -1.495851, 3.484622, 1, 1, 1, 1, 1,
0.444555, -0.1326395, 1.011382, 1, 1, 1, 1, 1,
0.4510513, 0.3009218, 1.060736, 1, 1, 1, 1, 1,
0.4531834, -0.484353, 1.471012, 1, 1, 1, 1, 1,
0.4556332, 0.6057256, -0.4028989, 1, 1, 1, 1, 1,
0.4571029, -1.145417, 1.908851, 1, 1, 1, 1, 1,
0.4576266, 0.1912604, 2.661928, 1, 1, 1, 1, 1,
0.4584157, -0.07397388, 1.508092, 1, 1, 1, 1, 1,
0.459509, -1.169625, 3.030183, 1, 1, 1, 1, 1,
0.4611161, 0.06806386, -0.08303335, 1, 1, 1, 1, 1,
0.46145, 1.996781, -0.7660357, 0, 0, 1, 1, 1,
0.4647938, -0.2362235, 3.114034, 1, 0, 0, 1, 1,
0.4649001, -0.4924712, 2.380118, 1, 0, 0, 1, 1,
0.4665145, -1.776713, 2.967251, 1, 0, 0, 1, 1,
0.4693446, -0.9234599, 2.522532, 1, 0, 0, 1, 1,
0.4710224, -0.5356193, 0.9850642, 1, 0, 0, 1, 1,
0.4804205, -0.9407565, 2.661922, 0, 0, 0, 1, 1,
0.4855538, 0.7253957, 0.2503363, 0, 0, 0, 1, 1,
0.4872791, 0.5521638, 3.602186, 0, 0, 0, 1, 1,
0.4904919, 1.439852, 1.281755, 0, 0, 0, 1, 1,
0.4937542, -1.176311, 1.873374, 0, 0, 0, 1, 1,
0.4949713, -1.266611, 2.237441, 0, 0, 0, 1, 1,
0.4992134, 0.1413097, 2.286795, 0, 0, 0, 1, 1,
0.4998536, 1.306126, -0.05959588, 1, 1, 1, 1, 1,
0.5017709, 1.431407, -0.6555475, 1, 1, 1, 1, 1,
0.5024031, 0.8993891, 0.8227779, 1, 1, 1, 1, 1,
0.5103408, 2.054125, -0.5814192, 1, 1, 1, 1, 1,
0.5117691, 1.987192, 1.423202, 1, 1, 1, 1, 1,
0.5139968, 0.5747438, -0.5613342, 1, 1, 1, 1, 1,
0.517683, 0.6067616, -1.177372, 1, 1, 1, 1, 1,
0.521847, 0.6349447, 0.8881989, 1, 1, 1, 1, 1,
0.5233752, 0.9087241, 1.881512, 1, 1, 1, 1, 1,
0.5267945, 0.5809147, 1.135939, 1, 1, 1, 1, 1,
0.5281211, 0.6172107, 0.1152287, 1, 1, 1, 1, 1,
0.5302348, 0.7343738, 0.3386535, 1, 1, 1, 1, 1,
0.5342168, 1.063664, 1.249869, 1, 1, 1, 1, 1,
0.5458981, -0.4464602, 2.327254, 1, 1, 1, 1, 1,
0.5462072, -1.762141, 2.326616, 1, 1, 1, 1, 1,
0.5505943, -0.8441775, 1.627245, 0, 0, 1, 1, 1,
0.5566069, 0.8476697, 0.4964593, 1, 0, 0, 1, 1,
0.5571126, -0.9241751, 3.223332, 1, 0, 0, 1, 1,
0.5572144, 0.6922836, 2.136323, 1, 0, 0, 1, 1,
0.558808, 0.799484, 0.1444981, 1, 0, 0, 1, 1,
0.5607916, 1.278507, 0.957081, 1, 0, 0, 1, 1,
0.561998, -1.295339, 0.08622557, 0, 0, 0, 1, 1,
0.5665715, -2.007586, 1.743221, 0, 0, 0, 1, 1,
0.5683194, -1.426107, 2.600773, 0, 0, 0, 1, 1,
0.5706187, 0.7702786, -0.8770517, 0, 0, 0, 1, 1,
0.5713578, 0.7475759, 1.771681, 0, 0, 0, 1, 1,
0.5743588, 1.064035, 2.785319, 0, 0, 0, 1, 1,
0.5754576, 0.3759501, 2.021349, 0, 0, 0, 1, 1,
0.5763636, -0.5281459, 0.5951487, 1, 1, 1, 1, 1,
0.5849087, -0.9813865, 4.634383, 1, 1, 1, 1, 1,
0.5850648, 1.584191, 0.4907466, 1, 1, 1, 1, 1,
0.5899447, -1.192609, 3.73576, 1, 1, 1, 1, 1,
0.5940382, 0.86693, 1.054123, 1, 1, 1, 1, 1,
0.5985765, 0.3359002, 0.7188112, 1, 1, 1, 1, 1,
0.6045367, -0.8705721, 1.889348, 1, 1, 1, 1, 1,
0.6058951, 0.6978083, 0.5745614, 1, 1, 1, 1, 1,
0.6095542, 0.66409, 0.5563823, 1, 1, 1, 1, 1,
0.6104856, 1.033269, 0.859242, 1, 1, 1, 1, 1,
0.6120126, -0.3829852, 3.344731, 1, 1, 1, 1, 1,
0.6132563, 1.772244, -0.5745832, 1, 1, 1, 1, 1,
0.6147485, 0.4927971, 0.9313549, 1, 1, 1, 1, 1,
0.616675, 1.881455, -0.6574677, 1, 1, 1, 1, 1,
0.6186538, 0.09038062, 3.467576, 1, 1, 1, 1, 1,
0.619189, 1.031484, -0.9899315, 0, 0, 1, 1, 1,
0.6215966, 0.07034011, 2.818829, 1, 0, 0, 1, 1,
0.6287171, 1.068713, -0.4147846, 1, 0, 0, 1, 1,
0.6303221, -0.2626221, 1.668316, 1, 0, 0, 1, 1,
0.6326235, -0.1225758, 1.598735, 1, 0, 0, 1, 1,
0.6351229, 1.415474, 1.271852, 1, 0, 0, 1, 1,
0.6354288, 0.6169614, 0.4587351, 0, 0, 0, 1, 1,
0.6363833, -0.8813353, 3.960989, 0, 0, 0, 1, 1,
0.6392282, -0.2615293, 2.767909, 0, 0, 0, 1, 1,
0.6420109, -0.4412174, 2.246056, 0, 0, 0, 1, 1,
0.6506617, -0.70717, 1.819409, 0, 0, 0, 1, 1,
0.650833, 1.557732, -0.005068809, 0, 0, 0, 1, 1,
0.6566462, -0.00508894, 2.316068, 0, 0, 0, 1, 1,
0.656664, 1.155661, -0.8199226, 1, 1, 1, 1, 1,
0.6576657, -0.2462579, 0.8431021, 1, 1, 1, 1, 1,
0.6582024, -3.087718, 4.000957, 1, 1, 1, 1, 1,
0.6619359, 0.5278991, -0.04672848, 1, 1, 1, 1, 1,
0.6621189, -0.1319129, 0.7699012, 1, 1, 1, 1, 1,
0.663651, 0.5605353, 0.2189759, 1, 1, 1, 1, 1,
0.6645975, 1.131761, 1.674654, 1, 1, 1, 1, 1,
0.6655126, -1.436355, 2.789017, 1, 1, 1, 1, 1,
0.6658002, 1.072859, 0.4898938, 1, 1, 1, 1, 1,
0.6683353, 1.069779, 0.9013485, 1, 1, 1, 1, 1,
0.6719159, 2.4083, -1.035696, 1, 1, 1, 1, 1,
0.6743522, -0.3372831, 3.63806, 1, 1, 1, 1, 1,
0.6758724, 0.9373128, 0.9990567, 1, 1, 1, 1, 1,
0.6810796, -0.2044095, 1.252879, 1, 1, 1, 1, 1,
0.6852908, 1.331742, 1.28072, 1, 1, 1, 1, 1,
0.6891242, -1.508031, 2.349326, 0, 0, 1, 1, 1,
0.6904663, 1.184728, 1.448082, 1, 0, 0, 1, 1,
0.6905276, 0.03144766, 1.923559, 1, 0, 0, 1, 1,
0.6927402, 1.224913, 0.9193072, 1, 0, 0, 1, 1,
0.6959817, -0.4735616, 3.226184, 1, 0, 0, 1, 1,
0.6998172, 0.2125454, 0.8099288, 1, 0, 0, 1, 1,
0.7014329, -1.002728, 3.100129, 0, 0, 0, 1, 1,
0.7014806, 0.7366306, 1.64946, 0, 0, 0, 1, 1,
0.7022655, -0.3780165, 2.611529, 0, 0, 0, 1, 1,
0.7085304, 1.03088, -1.563555, 0, 0, 0, 1, 1,
0.7099046, -1.857084, 2.359884, 0, 0, 0, 1, 1,
0.7104225, -0.2191853, 0.4457332, 0, 0, 0, 1, 1,
0.7109944, -0.5175006, 2.446748, 0, 0, 0, 1, 1,
0.715945, -0.5204908, 2.207244, 1, 1, 1, 1, 1,
0.716497, -0.4177051, 2.09351, 1, 1, 1, 1, 1,
0.7209923, 0.5430958, 2.467604, 1, 1, 1, 1, 1,
0.7215822, 0.8640108, 0.3936403, 1, 1, 1, 1, 1,
0.7249025, 1.209986, -0.7282724, 1, 1, 1, 1, 1,
0.7256083, 0.03662917, 0.8194655, 1, 1, 1, 1, 1,
0.7269759, -0.03132091, 1.050581, 1, 1, 1, 1, 1,
0.7320423, 1.31374, 1.830718, 1, 1, 1, 1, 1,
0.747142, 0.9136974, -0.3127464, 1, 1, 1, 1, 1,
0.7475622, -0.828384, 4.769503, 1, 1, 1, 1, 1,
0.7484034, 0.3377641, 1.240219, 1, 1, 1, 1, 1,
0.7522371, -1.092241, 2.361993, 1, 1, 1, 1, 1,
0.7565947, -0.8318748, 1.208995, 1, 1, 1, 1, 1,
0.7591317, 0.4522128, 0.8819939, 1, 1, 1, 1, 1,
0.7640455, 0.8717303, -0.8122309, 1, 1, 1, 1, 1,
0.7642839, -2.344825, 3.709638, 0, 0, 1, 1, 1,
0.7647163, -0.4792345, 1.236099, 1, 0, 0, 1, 1,
0.7671646, -0.7214229, 1.634643, 1, 0, 0, 1, 1,
0.7683622, -0.4990783, 1.664488, 1, 0, 0, 1, 1,
0.7813867, -2.041371, 4.153064, 1, 0, 0, 1, 1,
0.7883722, 1.245991, 0.301708, 1, 0, 0, 1, 1,
0.790653, -0.08600066, -0.3526713, 0, 0, 0, 1, 1,
0.7923384, -0.6026657, 3.659056, 0, 0, 0, 1, 1,
0.7957593, -1.401843, 2.353668, 0, 0, 0, 1, 1,
0.7976782, 0.6471298, 0.6400498, 0, 0, 0, 1, 1,
0.8020979, 0.2959293, 1.307115, 0, 0, 0, 1, 1,
0.8031098, 1.288333, 0.2619965, 0, 0, 0, 1, 1,
0.803852, -0.431387, 1.562958, 0, 0, 0, 1, 1,
0.8077592, 0.3281469, -0.6611646, 1, 1, 1, 1, 1,
0.8124394, -0.1535037, 0.1231517, 1, 1, 1, 1, 1,
0.8282105, -1.423778, 3.682908, 1, 1, 1, 1, 1,
0.8390996, 1.458764, 0.7707514, 1, 1, 1, 1, 1,
0.8393013, -0.809806, 2.782606, 1, 1, 1, 1, 1,
0.84085, -0.7325555, 3.104938, 1, 1, 1, 1, 1,
0.8416224, 0.7471694, 1.798089, 1, 1, 1, 1, 1,
0.841785, -0.9649748, 3.366578, 1, 1, 1, 1, 1,
0.8452564, -0.1113111, 2.71237, 1, 1, 1, 1, 1,
0.8497777, 0.3124266, 0.4210138, 1, 1, 1, 1, 1,
0.8524522, 2.264542, 0.9296858, 1, 1, 1, 1, 1,
0.8554344, 1.180047, 0.3729085, 1, 1, 1, 1, 1,
0.859578, -0.9911728, 2.380713, 1, 1, 1, 1, 1,
0.8611765, -1.12633, 3.506353, 1, 1, 1, 1, 1,
0.862043, -1.403218, 2.685445, 1, 1, 1, 1, 1,
0.8637304, 0.4719644, 0.5264965, 0, 0, 1, 1, 1,
0.8686923, 0.4267125, 1.967755, 1, 0, 0, 1, 1,
0.8726028, 0.9134458, -0.0822906, 1, 0, 0, 1, 1,
0.8730236, -0.2788637, 0.5897017, 1, 0, 0, 1, 1,
0.8752518, 0.2871002, 1.909612, 1, 0, 0, 1, 1,
0.875346, -0.7322112, 1.557925, 1, 0, 0, 1, 1,
0.8756405, 0.2000157, 1.161372, 0, 0, 0, 1, 1,
0.8771987, 0.6629943, 2.169942, 0, 0, 0, 1, 1,
0.8772784, -1.100435, 5.172215, 0, 0, 0, 1, 1,
0.8814121, -1.265368, 2.683542, 0, 0, 0, 1, 1,
0.8816764, 0.08538782, 2.499869, 0, 0, 0, 1, 1,
0.8820085, 0.8969041, 0.7043418, 0, 0, 0, 1, 1,
0.8837702, -0.5276397, 2.303869, 0, 0, 0, 1, 1,
0.8914162, 0.9595426, 1.130302, 1, 1, 1, 1, 1,
0.892314, -1.232863, 3.027924, 1, 1, 1, 1, 1,
0.8971711, -0.3917962, 1.48994, 1, 1, 1, 1, 1,
0.8982121, 0.9574225, 0.3120187, 1, 1, 1, 1, 1,
0.8984964, -0.7676835, 1.661081, 1, 1, 1, 1, 1,
0.9018467, 2.133336, 0.2234695, 1, 1, 1, 1, 1,
0.9045088, 1.681849, 0.7915518, 1, 1, 1, 1, 1,
0.9069669, 0.5215896, 1.516302, 1, 1, 1, 1, 1,
0.9074002, -0.1441177, 1.549942, 1, 1, 1, 1, 1,
0.9125695, 0.5065671, 1.500128, 1, 1, 1, 1, 1,
0.9130797, 0.2402892, 1.388168, 1, 1, 1, 1, 1,
0.9138231, -1.111195, 2.623924, 1, 1, 1, 1, 1,
0.9164515, 0.007622183, 2.514604, 1, 1, 1, 1, 1,
0.9168974, -1.416745, 1.798093, 1, 1, 1, 1, 1,
0.9193159, -0.0008953597, 2.181936, 1, 1, 1, 1, 1,
0.9313669, -0.5456684, 3.087356, 0, 0, 1, 1, 1,
0.9377128, -0.4197128, 1.25013, 1, 0, 0, 1, 1,
0.9398094, 0.1869367, 1.060325, 1, 0, 0, 1, 1,
0.9409446, 0.249986, 2.152044, 1, 0, 0, 1, 1,
0.9411592, -0.2391486, 1.749705, 1, 0, 0, 1, 1,
0.9424848, -0.5936072, 0.2718086, 1, 0, 0, 1, 1,
0.9431539, -0.1174518, 1.088101, 0, 0, 0, 1, 1,
0.9463691, -0.907631, 1.096144, 0, 0, 0, 1, 1,
0.9497859, 1.089451, 1.04806, 0, 0, 0, 1, 1,
0.954074, -0.4579, 1.912329, 0, 0, 0, 1, 1,
0.9556413, -1.645826, 4.483956, 0, 0, 0, 1, 1,
0.9573632, -0.0143785, 1.466919, 0, 0, 0, 1, 1,
0.957582, -0.04439099, 2.741765, 0, 0, 0, 1, 1,
0.9673452, -0.8128043, 2.66073, 1, 1, 1, 1, 1,
0.9715681, 1.72559, 0.04740141, 1, 1, 1, 1, 1,
0.9718662, 1.040018, 1.054085, 1, 1, 1, 1, 1,
0.9760733, 0.2119865, 0.9961551, 1, 1, 1, 1, 1,
0.9760734, -1.50767, 0.7041625, 1, 1, 1, 1, 1,
0.9772002, 0.1219153, 1.360915, 1, 1, 1, 1, 1,
0.9797311, 0.3404737, 3.241028, 1, 1, 1, 1, 1,
0.9801872, 0.9951077, -0.1763799, 1, 1, 1, 1, 1,
0.9807251, 0.2527325, -0.3103615, 1, 1, 1, 1, 1,
0.9856223, 0.9000883, -0.02793944, 1, 1, 1, 1, 1,
0.9908505, -1.300185, 2.238655, 1, 1, 1, 1, 1,
0.990872, 0.6635408, 1.823453, 1, 1, 1, 1, 1,
0.9938426, 0.07478773, 2.429655, 1, 1, 1, 1, 1,
0.998599, 0.3576748, 1.700504, 1, 1, 1, 1, 1,
1.008752, -2.624982, 1.773715, 1, 1, 1, 1, 1,
1.011817, 1.872154, 0.9109961, 0, 0, 1, 1, 1,
1.012788, 0.132276, 1.046238, 1, 0, 0, 1, 1,
1.017685, -1.153904, 3.106487, 1, 0, 0, 1, 1,
1.017823, 0.9013762, 0.2626765, 1, 0, 0, 1, 1,
1.022292, 2.764199, 0.9203434, 1, 0, 0, 1, 1,
1.025422, -1.408431, 3.087308, 1, 0, 0, 1, 1,
1.034445, 0.4427675, 0.003210486, 0, 0, 0, 1, 1,
1.049088, 0.514227, 1.586755, 0, 0, 0, 1, 1,
1.056441, 0.2496782, 1.980547, 0, 0, 0, 1, 1,
1.056686, 0.3505218, -0.4394142, 0, 0, 0, 1, 1,
1.065397, 0.3124035, 0.1970734, 0, 0, 0, 1, 1,
1.068421, -0.08743632, 1.252185, 0, 0, 0, 1, 1,
1.069583, 1.647037, 1.33577, 0, 0, 0, 1, 1,
1.079242, 2.239205, 0.5020234, 1, 1, 1, 1, 1,
1.079996, 0.2958421, 1.397173, 1, 1, 1, 1, 1,
1.081857, -0.1130721, 2.892848, 1, 1, 1, 1, 1,
1.082589, -1.246446, 2.525402, 1, 1, 1, 1, 1,
1.084854, -1.750711, -0.368407, 1, 1, 1, 1, 1,
1.093447, -2.211762, 3.545586, 1, 1, 1, 1, 1,
1.10186, 1.565658, -0.4485776, 1, 1, 1, 1, 1,
1.106354, -0.6450414, 1.372056, 1, 1, 1, 1, 1,
1.109928, 0.002225436, 1.101869, 1, 1, 1, 1, 1,
1.112228, 0.8051289, 1.79079, 1, 1, 1, 1, 1,
1.12015, 0.2215498, 1.333813, 1, 1, 1, 1, 1,
1.130566, 0.5804499, 1.3828, 1, 1, 1, 1, 1,
1.134911, -0.5849944, 2.824236, 1, 1, 1, 1, 1,
1.136923, -0.776521, 2.103044, 1, 1, 1, 1, 1,
1.142462, 0.08882242, 0.8716702, 1, 1, 1, 1, 1,
1.157539, -0.8634605, 1.644848, 0, 0, 1, 1, 1,
1.166458, -0.1549928, 3.145429, 1, 0, 0, 1, 1,
1.176603, 0.7744526, -0.903015, 1, 0, 0, 1, 1,
1.193213, -0.5392205, 2.994004, 1, 0, 0, 1, 1,
1.199818, -0.3967201, 2.203313, 1, 0, 0, 1, 1,
1.202106, -0.5490446, 2.615857, 1, 0, 0, 1, 1,
1.206485, -0.2431229, 1.365071, 0, 0, 0, 1, 1,
1.209608, -0.1757002, 2.718688, 0, 0, 0, 1, 1,
1.214136, -0.8452274, 1.379888, 0, 0, 0, 1, 1,
1.222217, -0.8641258, 3.23679, 0, 0, 0, 1, 1,
1.237424, -1.125932, 2.621283, 0, 0, 0, 1, 1,
1.254727, -0.4497712, 1.58024, 0, 0, 0, 1, 1,
1.277727, 1.587445, 0.6699418, 0, 0, 0, 1, 1,
1.316906, 0.07129872, 2.346575, 1, 1, 1, 1, 1,
1.325175, -1.708441, 3.003823, 1, 1, 1, 1, 1,
1.33582, 0.7656593, -0.6788578, 1, 1, 1, 1, 1,
1.336272, -0.07664545, 0.909786, 1, 1, 1, 1, 1,
1.342996, 0.5212579, 1.103685, 1, 1, 1, 1, 1,
1.343833, -1.523986, 0.03058521, 1, 1, 1, 1, 1,
1.366537, 1.166752, 3.187268, 1, 1, 1, 1, 1,
1.370255, -0.06492027, 1.455728, 1, 1, 1, 1, 1,
1.372169, -1.400955, 1.795538, 1, 1, 1, 1, 1,
1.375827, -0.06924275, 1.512157, 1, 1, 1, 1, 1,
1.378002, 0.3068586, 1.223198, 1, 1, 1, 1, 1,
1.386943, -0.2036412, 1.823156, 1, 1, 1, 1, 1,
1.401491, 1.290965, 1.35325, 1, 1, 1, 1, 1,
1.418355, -1.454091, 2.742907, 1, 1, 1, 1, 1,
1.423324, -1.734613, 3.149742, 1, 1, 1, 1, 1,
1.428325, 0.502432, 1.355288, 0, 0, 1, 1, 1,
1.431851, 1.574052, 0.6333289, 1, 0, 0, 1, 1,
1.435194, -1.187119, 2.70453, 1, 0, 0, 1, 1,
1.44313, -0.1072075, 0.7081261, 1, 0, 0, 1, 1,
1.443798, 0.05531096, 3.395823, 1, 0, 0, 1, 1,
1.484913, 0.2153542, -0.5962161, 1, 0, 0, 1, 1,
1.484962, -0.3143098, 1.675903, 0, 0, 0, 1, 1,
1.489094, -0.2195948, 3.279085, 0, 0, 0, 1, 1,
1.513833, 0.8576917, -1.182889, 0, 0, 0, 1, 1,
1.519783, -1.684923, 0.03439244, 0, 0, 0, 1, 1,
1.535043, -0.0379926, 2.122222, 0, 0, 0, 1, 1,
1.537804, -0.07141922, 2.028165, 0, 0, 0, 1, 1,
1.538404, -0.1902854, 0.4198286, 0, 0, 0, 1, 1,
1.541499, 0.5352187, 0.8815083, 1, 1, 1, 1, 1,
1.541713, 0.2343719, 2.759728, 1, 1, 1, 1, 1,
1.542435, -0.3490213, 2.509335, 1, 1, 1, 1, 1,
1.542442, 0.4940227, 0.09437152, 1, 1, 1, 1, 1,
1.553434, -0.7188398, 2.976301, 1, 1, 1, 1, 1,
1.56716, 1.534478, -1.177966, 1, 1, 1, 1, 1,
1.585134, 0.2815776, 0.02862338, 1, 1, 1, 1, 1,
1.585772, -1.16609, 2.206709, 1, 1, 1, 1, 1,
1.586511, 0.3562772, 1.891138, 1, 1, 1, 1, 1,
1.590611, -0.6418069, 1.539451, 1, 1, 1, 1, 1,
1.593398, -1.346604, 0.9931132, 1, 1, 1, 1, 1,
1.602605, 0.876672, 3.997944, 1, 1, 1, 1, 1,
1.643219, 1.853008, -0.04981969, 1, 1, 1, 1, 1,
1.644542, 1.867706, 1.993927, 1, 1, 1, 1, 1,
1.649593, 1.636521, 0.6790304, 1, 1, 1, 1, 1,
1.660214, 0.7825187, 0.9964489, 0, 0, 1, 1, 1,
1.664833, -1.77933, 1.183381, 1, 0, 0, 1, 1,
1.666394, 0.2336801, 1.697796, 1, 0, 0, 1, 1,
1.677189, 1.552723, 0.1244212, 1, 0, 0, 1, 1,
1.677525, 0.1342138, 1.970918, 1, 0, 0, 1, 1,
1.683179, 0.3461769, 1.037699, 1, 0, 0, 1, 1,
1.683185, -0.04842572, 0.7677279, 0, 0, 0, 1, 1,
1.689451, 0.5689937, 1.084681, 0, 0, 0, 1, 1,
1.702277, -0.4733782, 1.281826, 0, 0, 0, 1, 1,
1.704711, 1.462054, -0.2827624, 0, 0, 0, 1, 1,
1.723249, 1.691577, 0.8199404, 0, 0, 0, 1, 1,
1.728228, -0.1397118, -0.4825825, 0, 0, 0, 1, 1,
1.730757, 1.073335, 1.41583, 0, 0, 0, 1, 1,
1.745671, -2.977199, 0.8662406, 1, 1, 1, 1, 1,
1.766532, 0.6129444, 1.963744, 1, 1, 1, 1, 1,
1.804746, -0.2364857, 1.437586, 1, 1, 1, 1, 1,
1.811615, 0.5573657, -1.178358, 1, 1, 1, 1, 1,
1.842184, 0.460103, 0.7658091, 1, 1, 1, 1, 1,
1.85631, -0.8560385, 0.8004958, 1, 1, 1, 1, 1,
1.89793, 0.8065045, 2.493696, 1, 1, 1, 1, 1,
1.898551, 1.138681, 1.378706, 1, 1, 1, 1, 1,
1.919591, -0.1812084, 2.320054, 1, 1, 1, 1, 1,
1.925518, -0.1551304, 2.62655, 1, 1, 1, 1, 1,
1.932158, 0.6265091, 2.503519, 1, 1, 1, 1, 1,
1.935582, 0.2527951, 0.6688251, 1, 1, 1, 1, 1,
1.952223, 0.3137296, 4.119368, 1, 1, 1, 1, 1,
1.97553, -0.01559456, 3.231504, 1, 1, 1, 1, 1,
1.997764, -0.1416696, 1.181759, 1, 1, 1, 1, 1,
2.030555, 1.355617, 0.3028047, 0, 0, 1, 1, 1,
2.037055, -2.366258, 2.736048, 1, 0, 0, 1, 1,
2.046361, -1.090332, 1.586412, 1, 0, 0, 1, 1,
2.079947, -0.03699553, 2.215374, 1, 0, 0, 1, 1,
2.112573, 1.829795, 1.406459, 1, 0, 0, 1, 1,
2.112698, 0.6883649, 1.583709, 1, 0, 0, 1, 1,
2.147648, 0.5839996, 1.307369, 0, 0, 0, 1, 1,
2.148427, 1.786003, 1.59965, 0, 0, 0, 1, 1,
2.193902, -1.817775, 2.584618, 0, 0, 0, 1, 1,
2.249778, -0.7067806, 1.625557, 0, 0, 0, 1, 1,
2.257331, -1.344963, 3.836889, 0, 0, 0, 1, 1,
2.350833, -0.8790087, 2.120264, 0, 0, 0, 1, 1,
2.445855, -1.840081, 1.510782, 0, 0, 0, 1, 1,
2.46689, 0.6311313, 1.563112, 1, 1, 1, 1, 1,
2.501756, -1.326334, 1.960904, 1, 1, 1, 1, 1,
3.328156, -0.2149892, 1.403346, 1, 1, 1, 1, 1,
3.35951, -0.8424934, 3.595397, 1, 1, 1, 1, 1,
3.375549, 1.74373, 1.344615, 1, 1, 1, 1, 1,
3.384561, 0.6468685, -1.659153, 1, 1, 1, 1, 1,
3.542537, 2.333362, 1.953908, 1, 1, 1, 1, 1
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
var radius = 9.37695;
var distance = 32.93614;
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
mvMatrix.translate( -0.3893335, 0.1617594, -0.1768129 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93614);
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