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
-3.606919, -1.701483, -3.04658, 1, 0, 0, 1,
-3.172923, 0.869215, -0.4930527, 1, 0.007843138, 0, 1,
-2.845782, 1.703321, 0.3098519, 1, 0.01176471, 0, 1,
-2.754608, 0.7964382, -1.394294, 1, 0.01960784, 0, 1,
-2.554789, 0.4279447, 0.3650095, 1, 0.02352941, 0, 1,
-2.502078, 0.9898151, -2.619518, 1, 0.03137255, 0, 1,
-2.429833, 0.4958497, -1.126454, 1, 0.03529412, 0, 1,
-2.416186, 0.6858734, -0.6455151, 1, 0.04313726, 0, 1,
-2.333512, 0.1416013, -2.285809, 1, 0.04705882, 0, 1,
-2.299156, -0.6186764, -2.550612, 1, 0.05490196, 0, 1,
-2.270031, 0.4056554, -0.3448919, 1, 0.05882353, 0, 1,
-2.246976, -0.133838, -1.554229, 1, 0.06666667, 0, 1,
-2.212646, 1.095842, -1.565314, 1, 0.07058824, 0, 1,
-2.202802, 1.055154, 0.2978448, 1, 0.07843138, 0, 1,
-2.164116, -0.4507569, -2.901698, 1, 0.08235294, 0, 1,
-2.162726, 0.8043884, 1.052958, 1, 0.09019608, 0, 1,
-2.12527, 0.1327179, -2.746862, 1, 0.09411765, 0, 1,
-2.099789, 1.109115, -2.188886, 1, 0.1019608, 0, 1,
-2.068614, -0.5747733, -1.324117, 1, 0.1098039, 0, 1,
-2.063198, -0.245078, -1.65281, 1, 0.1137255, 0, 1,
-2.060442, 0.2938755, -1.741366, 1, 0.1215686, 0, 1,
-2.054237, 0.5011466, -1.460012, 1, 0.1254902, 0, 1,
-2.044471, -0.7194455, -1.48453, 1, 0.1333333, 0, 1,
-2.012803, 0.1477023, -1.866022, 1, 0.1372549, 0, 1,
-1.989063, -0.3091323, -2.224376, 1, 0.145098, 0, 1,
-1.981737, 0.2675386, -1.682088, 1, 0.1490196, 0, 1,
-1.979355, -0.5234281, -1.591642, 1, 0.1568628, 0, 1,
-1.979169, 0.6407285, 0.02413744, 1, 0.1607843, 0, 1,
-1.943595, 0.4983799, -1.724102, 1, 0.1686275, 0, 1,
-1.905828, 1.153059, 0.4327841, 1, 0.172549, 0, 1,
-1.883435, -0.5287238, -3.830609, 1, 0.1803922, 0, 1,
-1.86965, 0.4239498, -1.807959, 1, 0.1843137, 0, 1,
-1.853824, -0.2699764, 0.3022885, 1, 0.1921569, 0, 1,
-1.85316, 1.335663, 0.3608693, 1, 0.1960784, 0, 1,
-1.847206, -1.791109, -2.680676, 1, 0.2039216, 0, 1,
-1.843821, 0.1293074, -0.6117241, 1, 0.2117647, 0, 1,
-1.842613, -2.224468, -3.183567, 1, 0.2156863, 0, 1,
-1.836663, 0.847075, -2.842688, 1, 0.2235294, 0, 1,
-1.827059, -1.107494, -2.288526, 1, 0.227451, 0, 1,
-1.816643, 0.9248548, -0.4310636, 1, 0.2352941, 0, 1,
-1.815622, -0.7571261, -2.443701, 1, 0.2392157, 0, 1,
-1.815619, -1.717315, -3.126546, 1, 0.2470588, 0, 1,
-1.812834, -0.2321565, -2.682843, 1, 0.2509804, 0, 1,
-1.80281, 1.532116, -0.8662627, 1, 0.2588235, 0, 1,
-1.798176, -1.410209, -3.011799, 1, 0.2627451, 0, 1,
-1.782551, 0.08923064, -2.131145, 1, 0.2705882, 0, 1,
-1.779704, 1.421046, -0.9921989, 1, 0.2745098, 0, 1,
-1.777311, -0.2414655, -2.923884, 1, 0.282353, 0, 1,
-1.766927, -1.999191, -1.555357, 1, 0.2862745, 0, 1,
-1.766441, -0.02214738, -2.329776, 1, 0.2941177, 0, 1,
-1.747733, 0.7251719, -0.7126402, 1, 0.3019608, 0, 1,
-1.746092, 1.282065, -1.581582, 1, 0.3058824, 0, 1,
-1.721808, 0.08625484, -2.079896, 1, 0.3137255, 0, 1,
-1.721556, 0.9251641, -1.748997, 1, 0.3176471, 0, 1,
-1.703941, -0.5802241, -0.9432985, 1, 0.3254902, 0, 1,
-1.680385, -0.1195229, -0.1195258, 1, 0.3294118, 0, 1,
-1.679127, -1.379426, -4.310774, 1, 0.3372549, 0, 1,
-1.677106, 1.07462, -0.9427629, 1, 0.3411765, 0, 1,
-1.668318, 1.311249, -0.7670736, 1, 0.3490196, 0, 1,
-1.659373, -0.1524313, -2.574136, 1, 0.3529412, 0, 1,
-1.645237, -0.6557685, -1.86287, 1, 0.3607843, 0, 1,
-1.634291, -0.02810671, -1.53477, 1, 0.3647059, 0, 1,
-1.612058, 1.274536, 0.2737412, 1, 0.372549, 0, 1,
-1.594343, -0.600153, -2.121356, 1, 0.3764706, 0, 1,
-1.591769, -0.05164807, -2.700866, 1, 0.3843137, 0, 1,
-1.591046, -0.8480172, -2.630112, 1, 0.3882353, 0, 1,
-1.57622, 0.1411679, -2.073776, 1, 0.3960784, 0, 1,
-1.575517, 0.6799472, -2.526226, 1, 0.4039216, 0, 1,
-1.567356, -1.089275, -0.9161539, 1, 0.4078431, 0, 1,
-1.559808, 0.09702004, 0.4930416, 1, 0.4156863, 0, 1,
-1.557016, 0.2270368, -1.686691, 1, 0.4196078, 0, 1,
-1.550335, -0.2846985, -4.111639, 1, 0.427451, 0, 1,
-1.540459, -1.325518, -2.374793, 1, 0.4313726, 0, 1,
-1.535172, -1.108881, -4.15367, 1, 0.4392157, 0, 1,
-1.517836, 0.7534827, -2.079075, 1, 0.4431373, 0, 1,
-1.505782, -1.856125, -4.040311, 1, 0.4509804, 0, 1,
-1.503161, 0.9707108, -0.3288736, 1, 0.454902, 0, 1,
-1.495306, -0.2170662, -1.074636, 1, 0.4627451, 0, 1,
-1.490286, -0.4278796, -1.491927, 1, 0.4666667, 0, 1,
-1.489179, -0.2963817, -2.688348, 1, 0.4745098, 0, 1,
-1.487623, -1.284081, -3.356421, 1, 0.4784314, 0, 1,
-1.460651, 2.607248, -1.310801, 1, 0.4862745, 0, 1,
-1.458435, -0.365254, -1.266294, 1, 0.4901961, 0, 1,
-1.454099, -2.689613, -3.316793, 1, 0.4980392, 0, 1,
-1.451641, 1.868206, 0.9575804, 1, 0.5058824, 0, 1,
-1.435563, 0.07218678, -0.5788287, 1, 0.509804, 0, 1,
-1.380728, 0.06557909, -1.659666, 1, 0.5176471, 0, 1,
-1.376412, -0.04905358, -2.898865, 1, 0.5215687, 0, 1,
-1.368514, 0.3733695, -0.6914752, 1, 0.5294118, 0, 1,
-1.356881, 0.679412, -1.010919, 1, 0.5333334, 0, 1,
-1.356752, -1.022628, -2.673789, 1, 0.5411765, 0, 1,
-1.350799, -0.535938, -2.941025, 1, 0.5450981, 0, 1,
-1.341696, -0.2979205, -2.28895, 1, 0.5529412, 0, 1,
-1.339115, -0.9504973, -4.700471, 1, 0.5568628, 0, 1,
-1.329353, -1.138361, -3.651247, 1, 0.5647059, 0, 1,
-1.327256, 1.911016, 0.2055372, 1, 0.5686275, 0, 1,
-1.323738, 0.7491561, -0.5263402, 1, 0.5764706, 0, 1,
-1.308627, 0.2438047, -0.8024828, 1, 0.5803922, 0, 1,
-1.307895, 0.7545658, -2.504284, 1, 0.5882353, 0, 1,
-1.304029, -0.2696628, -1.070976, 1, 0.5921569, 0, 1,
-1.298359, -0.4255442, -3.144688, 1, 0.6, 0, 1,
-1.288191, 1.930332, -0.2549865, 1, 0.6078432, 0, 1,
-1.283977, -0.8245252, -2.518557, 1, 0.6117647, 0, 1,
-1.281036, 0.4366619, -1.279977, 1, 0.6196079, 0, 1,
-1.276451, 0.4401333, -0.8708616, 1, 0.6235294, 0, 1,
-1.274642, 0.7279027, -1.339323, 1, 0.6313726, 0, 1,
-1.272763, 0.5025595, -2.029716, 1, 0.6352941, 0, 1,
-1.268998, -0.7821674, 0.3274756, 1, 0.6431373, 0, 1,
-1.267648, 0.5937849, -2.120716, 1, 0.6470588, 0, 1,
-1.262809, -0.4953343, -2.031774, 1, 0.654902, 0, 1,
-1.234715, 1.442926, -1.036892, 1, 0.6588235, 0, 1,
-1.233034, -0.1171616, -1.544207, 1, 0.6666667, 0, 1,
-1.227847, -0.1789137, -2.465005, 1, 0.6705883, 0, 1,
-1.225354, 0.2368097, -2.543883, 1, 0.6784314, 0, 1,
-1.225037, -0.127761, -0.7103445, 1, 0.682353, 0, 1,
-1.215534, 0.4025723, -2.397244, 1, 0.6901961, 0, 1,
-1.213366, -1.069258, -3.492791, 1, 0.6941177, 0, 1,
-1.210568, 1.002082, -2.172884, 1, 0.7019608, 0, 1,
-1.208977, 0.130588, -0.1172471, 1, 0.7098039, 0, 1,
-1.20235, -0.1151313, -1.308827, 1, 0.7137255, 0, 1,
-1.199558, 0.4011244, -0.7578817, 1, 0.7215686, 0, 1,
-1.190921, 0.4808075, 0.009543173, 1, 0.7254902, 0, 1,
-1.178423, 0.5571616, -3.015181, 1, 0.7333333, 0, 1,
-1.177453, 0.5463012, -1.730188, 1, 0.7372549, 0, 1,
-1.171762, -0.6312535, -1.901704, 1, 0.7450981, 0, 1,
-1.168022, -0.3598446, -2.555358, 1, 0.7490196, 0, 1,
-1.16581, 1.536622, -0.583037, 1, 0.7568628, 0, 1,
-1.160038, -0.184481, -1.976952, 1, 0.7607843, 0, 1,
-1.149303, 0.8893599, -0.3581215, 1, 0.7686275, 0, 1,
-1.14129, -2.338789, -3.980616, 1, 0.772549, 0, 1,
-1.139044, 0.2284291, -1.587127, 1, 0.7803922, 0, 1,
-1.138095, 1.180352, -0.1150351, 1, 0.7843137, 0, 1,
-1.136894, -1.03669, -3.64273, 1, 0.7921569, 0, 1,
-1.134105, 0.4316731, -2.187624, 1, 0.7960784, 0, 1,
-1.132968, 1.476748, -0.68229, 1, 0.8039216, 0, 1,
-1.128307, 0.08997405, -3.839761, 1, 0.8117647, 0, 1,
-1.125155, -0.8446632, -0.6969031, 1, 0.8156863, 0, 1,
-1.12495, 1.630593, -1.225546, 1, 0.8235294, 0, 1,
-1.114616, 1.25891, -0.4938839, 1, 0.827451, 0, 1,
-1.10562, 1.92142, -0.3499777, 1, 0.8352941, 0, 1,
-1.101545, -2.145938, -2.526912, 1, 0.8392157, 0, 1,
-1.098892, 0.02754742, -0.5998692, 1, 0.8470588, 0, 1,
-1.098402, 1.418342, -0.8838454, 1, 0.8509804, 0, 1,
-1.096312, 0.5585213, -0.6363194, 1, 0.8588235, 0, 1,
-1.095189, -0.4039161, -1.365919, 1, 0.8627451, 0, 1,
-1.092827, -0.1318331, -0.5990594, 1, 0.8705882, 0, 1,
-1.092551, 0.05889634, -2.39658, 1, 0.8745098, 0, 1,
-1.091831, 0.4641429, 1.209589, 1, 0.8823529, 0, 1,
-1.08599, 0.5735723, 0.2745542, 1, 0.8862745, 0, 1,
-1.084722, -0.2834574, -2.268955, 1, 0.8941177, 0, 1,
-1.081643, -0.3926649, -1.875565, 1, 0.8980392, 0, 1,
-1.076876, 0.9827256, -0.9191937, 1, 0.9058824, 0, 1,
-1.069543, -1.179701, -0.963242, 1, 0.9137255, 0, 1,
-1.062335, 0.6185271, -1.876158, 1, 0.9176471, 0, 1,
-1.056885, -0.1222662, -1.611774, 1, 0.9254902, 0, 1,
-1.053343, -0.7858014, -3.839666, 1, 0.9294118, 0, 1,
-1.052452, -1.981444, -1.036176, 1, 0.9372549, 0, 1,
-1.050213, -0.2973484, -1.796062, 1, 0.9411765, 0, 1,
-1.045789, 1.781675, 0.002435957, 1, 0.9490196, 0, 1,
-1.040369, -0.5828383, -0.8753631, 1, 0.9529412, 0, 1,
-1.035311, 0.06710538, -2.695518, 1, 0.9607843, 0, 1,
-1.033333, 2.560253, 0.9795013, 1, 0.9647059, 0, 1,
-1.030804, 0.617254, 1.338931, 1, 0.972549, 0, 1,
-1.026233, -0.2059884, 0.3281009, 1, 0.9764706, 0, 1,
-1.026106, 0.9529809, 1.139437, 1, 0.9843137, 0, 1,
-1.017729, 2.421119, 0.4106605, 1, 0.9882353, 0, 1,
-1.016912, 0.1152651, -1.54619, 1, 0.9960784, 0, 1,
-1.007683, 3.000745, 0.7650638, 0.9960784, 1, 0, 1,
-1.007254, 1.192132, -0.002704651, 0.9921569, 1, 0, 1,
-1.006911, 0.1839926, -2.928043, 0.9843137, 1, 0, 1,
-1.004972, 0.237456, -2.025593, 0.9803922, 1, 0, 1,
-1.003567, 0.3665917, -2.145395, 0.972549, 1, 0, 1,
-1.002863, -1.070158, -2.349847, 0.9686275, 1, 0, 1,
-1.001958, -0.5661227, -3.465248, 0.9607843, 1, 0, 1,
-0.9860562, 0.2863355, -0.3007926, 0.9568627, 1, 0, 1,
-0.9853139, -1.819299, -0.8255002, 0.9490196, 1, 0, 1,
-0.979907, 2.28163, 0.6231073, 0.945098, 1, 0, 1,
-0.9794628, -1.796619, -2.995887, 0.9372549, 1, 0, 1,
-0.9728352, 0.9349101, -0.8635294, 0.9333333, 1, 0, 1,
-0.9690742, 0.4028662, -1.995599, 0.9254902, 1, 0, 1,
-0.9681371, 0.06457904, -1.767114, 0.9215686, 1, 0, 1,
-0.9670187, -0.1642707, -1.869154, 0.9137255, 1, 0, 1,
-0.9665208, 0.7079174, -2.129232, 0.9098039, 1, 0, 1,
-0.9639213, -0.2301721, -2.880813, 0.9019608, 1, 0, 1,
-0.9588835, -0.1086502, -2.433494, 0.8941177, 1, 0, 1,
-0.9563267, -0.318373, -2.873766, 0.8901961, 1, 0, 1,
-0.9539364, -0.3889108, -2.317519, 0.8823529, 1, 0, 1,
-0.9390466, 0.1619128, -2.984017, 0.8784314, 1, 0, 1,
-0.9359939, -0.8829367, -2.133748, 0.8705882, 1, 0, 1,
-0.9342843, 0.2537822, -0.178549, 0.8666667, 1, 0, 1,
-0.9324792, 0.3229721, -1.939803, 0.8588235, 1, 0, 1,
-0.9316913, 0.993212, -0.3798893, 0.854902, 1, 0, 1,
-0.9311286, -0.7017947, -2.338214, 0.8470588, 1, 0, 1,
-0.9276233, 0.9447168, -0.3508311, 0.8431373, 1, 0, 1,
-0.9266461, 0.618921, 0.8144619, 0.8352941, 1, 0, 1,
-0.9175958, -0.350506, -2.174149, 0.8313726, 1, 0, 1,
-0.916831, -0.1324623, -1.951194, 0.8235294, 1, 0, 1,
-0.916231, 0.1535736, -1.415214, 0.8196079, 1, 0, 1,
-0.9108087, 0.5095924, -1.835732, 0.8117647, 1, 0, 1,
-0.8991913, -0.9147412, -2.099117, 0.8078431, 1, 0, 1,
-0.8954145, -0.7342174, -2.333775, 0.8, 1, 0, 1,
-0.8946431, 0.4163908, -1.526448, 0.7921569, 1, 0, 1,
-0.8938737, -0.123017, -0.9593402, 0.7882353, 1, 0, 1,
-0.8768021, 1.255311, -0.8458606, 0.7803922, 1, 0, 1,
-0.8743215, -0.7654284, -1.890237, 0.7764706, 1, 0, 1,
-0.8581097, -0.3795933, -0.2135003, 0.7686275, 1, 0, 1,
-0.8526931, 0.2407332, -0.07996032, 0.7647059, 1, 0, 1,
-0.8513039, -0.2481825, -1.256563, 0.7568628, 1, 0, 1,
-0.8494669, -0.9618222, -2.627147, 0.7529412, 1, 0, 1,
-0.848718, -0.7447076, -2.393798, 0.7450981, 1, 0, 1,
-0.8456242, -0.9064159, -0.6962503, 0.7411765, 1, 0, 1,
-0.8445636, 0.8155936, -0.5333222, 0.7333333, 1, 0, 1,
-0.8406153, -0.0108364, -2.981205, 0.7294118, 1, 0, 1,
-0.8404798, 0.4020711, -1.315041, 0.7215686, 1, 0, 1,
-0.8402429, -1.227841, -2.075443, 0.7176471, 1, 0, 1,
-0.8357775, 0.8488827, -0.9573141, 0.7098039, 1, 0, 1,
-0.8323061, -1.875741, -3.12106, 0.7058824, 1, 0, 1,
-0.8257031, -0.1992833, -2.665236, 0.6980392, 1, 0, 1,
-0.8255771, 0.03801927, -2.393566, 0.6901961, 1, 0, 1,
-0.8204939, -0.6511246, -1.456022, 0.6862745, 1, 0, 1,
-0.8194361, -1.979164, -3.525244, 0.6784314, 1, 0, 1,
-0.8130698, -0.8619953, -2.674117, 0.6745098, 1, 0, 1,
-0.8117302, 1.210929, 0.3190247, 0.6666667, 1, 0, 1,
-0.811726, -0.2580158, -2.075929, 0.6627451, 1, 0, 1,
-0.8107569, 0.3625828, -2.462422, 0.654902, 1, 0, 1,
-0.803445, 0.009965721, -2.021889, 0.6509804, 1, 0, 1,
-0.7960922, 1.29575, 0.02494452, 0.6431373, 1, 0, 1,
-0.7954345, -0.605666, -3.166177, 0.6392157, 1, 0, 1,
-0.7943458, 1.609068, 1.76476, 0.6313726, 1, 0, 1,
-0.7942312, -0.8531088, -1.013034, 0.627451, 1, 0, 1,
-0.7915992, 1.072188, -0.326889, 0.6196079, 1, 0, 1,
-0.7910561, -0.008434792, -1.11453, 0.6156863, 1, 0, 1,
-0.7865201, 1.418505, -1.104018, 0.6078432, 1, 0, 1,
-0.7864463, 0.7509909, -0.1455599, 0.6039216, 1, 0, 1,
-0.7852162, -0.2916484, -3.474777, 0.5960785, 1, 0, 1,
-0.7831045, -0.0541381, -2.733479, 0.5882353, 1, 0, 1,
-0.7801608, -0.8312178, -2.145924, 0.5843138, 1, 0, 1,
-0.7796154, 0.1717523, -0.9374011, 0.5764706, 1, 0, 1,
-0.776993, -0.1986536, -2.342168, 0.572549, 1, 0, 1,
-0.7729895, 1.546197, -0.5360963, 0.5647059, 1, 0, 1,
-0.7715288, 0.1593191, -2.297297, 0.5607843, 1, 0, 1,
-0.7698053, -1.192861, -3.738869, 0.5529412, 1, 0, 1,
-0.7691168, -1.270988, -2.358864, 0.5490196, 1, 0, 1,
-0.7585536, -0.9863659, -2.450751, 0.5411765, 1, 0, 1,
-0.7559687, 0.3073165, -0.2107554, 0.5372549, 1, 0, 1,
-0.7539957, 0.008478493, -1.388577, 0.5294118, 1, 0, 1,
-0.7445489, -0.3302687, -1.712877, 0.5254902, 1, 0, 1,
-0.739226, -1.61681, -2.989297, 0.5176471, 1, 0, 1,
-0.7390192, -0.4155993, -2.920677, 0.5137255, 1, 0, 1,
-0.7379407, -0.8044121, -2.946597, 0.5058824, 1, 0, 1,
-0.7374547, -0.1532313, -0.1478438, 0.5019608, 1, 0, 1,
-0.7363483, -0.7419146, -4.313076, 0.4941176, 1, 0, 1,
-0.7357333, 0.5021433, -1.213687, 0.4862745, 1, 0, 1,
-0.7272601, -1.304512, -2.827433, 0.4823529, 1, 0, 1,
-0.7210201, -0.3969415, -3.130934, 0.4745098, 1, 0, 1,
-0.717941, 0.043066, -1.030058, 0.4705882, 1, 0, 1,
-0.7136573, 0.7455432, 1.085448, 0.4627451, 1, 0, 1,
-0.7112119, -0.7101085, -1.756336, 0.4588235, 1, 0, 1,
-0.7041848, 0.3715384, -0.5384123, 0.4509804, 1, 0, 1,
-0.7009267, 0.2833622, -0.9483241, 0.4470588, 1, 0, 1,
-0.6923126, -0.4476173, -2.115719, 0.4392157, 1, 0, 1,
-0.6920702, 1.706423, -0.02278958, 0.4352941, 1, 0, 1,
-0.6920305, 1.982212, 0.458162, 0.427451, 1, 0, 1,
-0.691484, 1.169555, -0.3685637, 0.4235294, 1, 0, 1,
-0.6879543, 1.795386, -1.564651, 0.4156863, 1, 0, 1,
-0.6878185, 0.2166789, -1.128333, 0.4117647, 1, 0, 1,
-0.6850267, -0.6859915, -2.648807, 0.4039216, 1, 0, 1,
-0.683387, 1.35414, -1.802634, 0.3960784, 1, 0, 1,
-0.6752384, -0.8671941, -3.14806, 0.3921569, 1, 0, 1,
-0.6703902, 1.11727, -1.363533, 0.3843137, 1, 0, 1,
-0.6702152, 0.2287836, -3.253443, 0.3803922, 1, 0, 1,
-0.6593337, -1.540356, -5.114022, 0.372549, 1, 0, 1,
-0.6497989, 0.8414903, -0.005049432, 0.3686275, 1, 0, 1,
-0.6457065, 0.04352329, -1.73323, 0.3607843, 1, 0, 1,
-0.6434283, -0.3768949, -3.361367, 0.3568628, 1, 0, 1,
-0.6414633, 0.6961706, -1.951263, 0.3490196, 1, 0, 1,
-0.6359909, -0.9509207, -3.449465, 0.345098, 1, 0, 1,
-0.6338096, -2.57543, -2.845043, 0.3372549, 1, 0, 1,
-0.6311795, 3.309974, -0.6527807, 0.3333333, 1, 0, 1,
-0.6294367, -0.6487104, -2.726725, 0.3254902, 1, 0, 1,
-0.6288792, 0.2950309, -0.8640235, 0.3215686, 1, 0, 1,
-0.6238127, -0.3610535, -3.20337, 0.3137255, 1, 0, 1,
-0.6229538, -0.6870018, -1.655754, 0.3098039, 1, 0, 1,
-0.6187972, 0.8028581, 1.53513, 0.3019608, 1, 0, 1,
-0.6162418, 0.4961299, 0.4475608, 0.2941177, 1, 0, 1,
-0.6145465, -0.5347279, -1.057985, 0.2901961, 1, 0, 1,
-0.6086503, -0.2779531, -1.963079, 0.282353, 1, 0, 1,
-0.6075581, -1.379476, -2.523005, 0.2784314, 1, 0, 1,
-0.6042559, 0.5448658, -1.955515, 0.2705882, 1, 0, 1,
-0.6036313, -0.5394156, -2.328424, 0.2666667, 1, 0, 1,
-0.6021526, 1.435391, 1.357908, 0.2588235, 1, 0, 1,
-0.6011481, -0.4719003, -2.042796, 0.254902, 1, 0, 1,
-0.5969916, 2.385566, -0.2099438, 0.2470588, 1, 0, 1,
-0.5944958, 1.351098, 0.6824151, 0.2431373, 1, 0, 1,
-0.5940951, 0.5426971, 0.8991824, 0.2352941, 1, 0, 1,
-0.590065, -0.3905203, -2.20655, 0.2313726, 1, 0, 1,
-0.5869511, 0.1810267, -2.073674, 0.2235294, 1, 0, 1,
-0.5854855, -1.285751, -3.122494, 0.2196078, 1, 0, 1,
-0.5847086, 0.4984928, 0.5964978, 0.2117647, 1, 0, 1,
-0.5797043, 0.7101786, -1.628279, 0.2078431, 1, 0, 1,
-0.5796378, 0.66803, -0.8826239, 0.2, 1, 0, 1,
-0.5763604, 0.1433586, -2.072997, 0.1921569, 1, 0, 1,
-0.5757828, -0.2660347, -3.126547, 0.1882353, 1, 0, 1,
-0.5752409, -1.722092, -3.246777, 0.1803922, 1, 0, 1,
-0.5720544, -0.3737177, -2.219786, 0.1764706, 1, 0, 1,
-0.5716511, -2.17651, -3.937823, 0.1686275, 1, 0, 1,
-0.5669129, -1.034951, -2.081048, 0.1647059, 1, 0, 1,
-0.5652189, 0.952816, -0.9233673, 0.1568628, 1, 0, 1,
-0.5644096, 1.419626, -2.395083, 0.1529412, 1, 0, 1,
-0.5588733, 0.245842, -0.9677613, 0.145098, 1, 0, 1,
-0.5581824, -2.223957, -3.759021, 0.1411765, 1, 0, 1,
-0.5570844, -0.1984285, -3.132638, 0.1333333, 1, 0, 1,
-0.5549954, -0.6518986, -3.300455, 0.1294118, 1, 0, 1,
-0.5538241, -0.05605943, -1.715821, 0.1215686, 1, 0, 1,
-0.5523291, -0.4406788, -2.261781, 0.1176471, 1, 0, 1,
-0.5504919, 0.3269738, -0.9326676, 0.1098039, 1, 0, 1,
-0.5461695, -0.6978872, -2.969549, 0.1058824, 1, 0, 1,
-0.5453666, 0.1107256, -3.075342, 0.09803922, 1, 0, 1,
-0.5429123, 0.5192786, 0.8914154, 0.09019608, 1, 0, 1,
-0.5379604, 0.2018245, -1.856967, 0.08627451, 1, 0, 1,
-0.5372503, -0.5678268, -3.821951, 0.07843138, 1, 0, 1,
-0.5366775, -0.5836516, -2.560004, 0.07450981, 1, 0, 1,
-0.5328324, 0.7460408, -2.234719, 0.06666667, 1, 0, 1,
-0.5261158, 0.1764658, -0.1525036, 0.0627451, 1, 0, 1,
-0.5259575, 0.932537, -2.367194, 0.05490196, 1, 0, 1,
-0.5206255, 2.432073, -2.50885, 0.05098039, 1, 0, 1,
-0.5129691, -0.1830485, -0.3935396, 0.04313726, 1, 0, 1,
-0.5127141, -1.107915, -1.358857, 0.03921569, 1, 0, 1,
-0.5123964, 0.07665139, -2.050277, 0.03137255, 1, 0, 1,
-0.509986, 1.042944, -0.7810262, 0.02745098, 1, 0, 1,
-0.5047429, -0.2611354, -2.651642, 0.01960784, 1, 0, 1,
-0.5036117, 0.1369592, -1.155637, 0.01568628, 1, 0, 1,
-0.4966702, 1.204318, -2.131001, 0.007843138, 1, 0, 1,
-0.4957446, -0.02687342, -1.549705, 0.003921569, 1, 0, 1,
-0.4930251, 0.8427982, -0.2815586, 0, 1, 0.003921569, 1,
-0.4891815, -1.456651, -3.314479, 0, 1, 0.01176471, 1,
-0.486928, 0.3445869, 0.399763, 0, 1, 0.01568628, 1,
-0.4850769, 0.9322902, -2.082515, 0, 1, 0.02352941, 1,
-0.4833696, -1.507134, -2.909314, 0, 1, 0.02745098, 1,
-0.4830945, -0.9830353, -2.112115, 0, 1, 0.03529412, 1,
-0.4821558, 1.997846, -1.751496, 0, 1, 0.03921569, 1,
-0.4813071, 1.173031, -1.410579, 0, 1, 0.04705882, 1,
-0.477748, -0.6855314, -1.269734, 0, 1, 0.05098039, 1,
-0.4773293, 0.1265887, -1.22126, 0, 1, 0.05882353, 1,
-0.4746253, -1.880706, -2.205967, 0, 1, 0.0627451, 1,
-0.4697829, 0.2003935, -1.73946, 0, 1, 0.07058824, 1,
-0.4697214, 0.2791477, 0.1948964, 0, 1, 0.07450981, 1,
-0.4680776, 0.9842713, 0.229697, 0, 1, 0.08235294, 1,
-0.4666222, 0.2390069, 0.5906219, 0, 1, 0.08627451, 1,
-0.4657016, -1.426426, -3.45857, 0, 1, 0.09411765, 1,
-0.465034, -1.049846, -1.85993, 0, 1, 0.1019608, 1,
-0.4546998, 0.0262997, -1.976665, 0, 1, 0.1058824, 1,
-0.4499921, -0.9376622, -3.190686, 0, 1, 0.1137255, 1,
-0.4493344, 0.9664758, -0.7965356, 0, 1, 0.1176471, 1,
-0.4488366, 0.6409535, -1.308718, 0, 1, 0.1254902, 1,
-0.447477, -0.7139595, -2.85485, 0, 1, 0.1294118, 1,
-0.4432974, 0.2891733, -2.168496, 0, 1, 0.1372549, 1,
-0.4386131, -0.4543962, -1.729767, 0, 1, 0.1411765, 1,
-0.437825, 0.2439356, -0.2761332, 0, 1, 0.1490196, 1,
-0.4344925, 0.7785012, -0.6101983, 0, 1, 0.1529412, 1,
-0.4340552, -0.88993, -1.341512, 0, 1, 0.1607843, 1,
-0.4271404, -0.5012937, -1.272377, 0, 1, 0.1647059, 1,
-0.4265539, -0.8292647, -1.729939, 0, 1, 0.172549, 1,
-0.4215564, 1.462831, 0.5585732, 0, 1, 0.1764706, 1,
-0.4209702, 0.7096109, -0.3719389, 0, 1, 0.1843137, 1,
-0.4168328, -1.026687, -2.490608, 0, 1, 0.1882353, 1,
-0.4167597, -1.734051, -2.360556, 0, 1, 0.1960784, 1,
-0.4136919, -0.2586144, -1.993579, 0, 1, 0.2039216, 1,
-0.4080979, -0.04902422, -4.11228, 0, 1, 0.2078431, 1,
-0.4061819, 0.3522002, -1.021046, 0, 1, 0.2156863, 1,
-0.4051883, -0.5920147, -3.502215, 0, 1, 0.2196078, 1,
-0.4050755, -0.2506266, -2.533926, 0, 1, 0.227451, 1,
-0.4039561, -1.505647, -2.621157, 0, 1, 0.2313726, 1,
-0.4037157, -0.1235556, -1.282865, 0, 1, 0.2392157, 1,
-0.3984557, 0.6623577, 0.5761344, 0, 1, 0.2431373, 1,
-0.3932134, -0.707674, -3.486644, 0, 1, 0.2509804, 1,
-0.3887608, 0.9836853, -0.0632399, 0, 1, 0.254902, 1,
-0.3886632, 1.423737, -0.7307451, 0, 1, 0.2627451, 1,
-0.3821736, -1.388959, -2.344434, 0, 1, 0.2666667, 1,
-0.3808829, 0.7785195, -0.5042249, 0, 1, 0.2745098, 1,
-0.3761175, -1.071717, -2.834204, 0, 1, 0.2784314, 1,
-0.3754882, -1.9346, -2.21745, 0, 1, 0.2862745, 1,
-0.3751955, -0.6094335, -1.346826, 0, 1, 0.2901961, 1,
-0.3747772, -1.134726, -2.914944, 0, 1, 0.2980392, 1,
-0.3742963, -2.06059, -0.7988644, 0, 1, 0.3058824, 1,
-0.3737905, -1.181672, -2.180259, 0, 1, 0.3098039, 1,
-0.3709316, 0.4238008, -1.754901, 0, 1, 0.3176471, 1,
-0.3667376, 0.6493178, -0.6096339, 0, 1, 0.3215686, 1,
-0.3662083, 1.028749, 1.339796, 0, 1, 0.3294118, 1,
-0.3633788, 0.8256683, -1.382027, 0, 1, 0.3333333, 1,
-0.3616, 1.358364, 1.668072, 0, 1, 0.3411765, 1,
-0.3528901, 1.091192, -0.4959885, 0, 1, 0.345098, 1,
-0.3482124, 0.8338967, -0.262281, 0, 1, 0.3529412, 1,
-0.3469598, -1.770944, -3.308187, 0, 1, 0.3568628, 1,
-0.3459954, 0.01246211, -2.098548, 0, 1, 0.3647059, 1,
-0.3420074, 0.9773362, -0.4174857, 0, 1, 0.3686275, 1,
-0.3392179, -0.7391458, -2.38836, 0, 1, 0.3764706, 1,
-0.3338599, -0.7923778, -1.902688, 0, 1, 0.3803922, 1,
-0.3334727, 1.28187, -0.7125217, 0, 1, 0.3882353, 1,
-0.3271976, 1.238039, -2.948141, 0, 1, 0.3921569, 1,
-0.3250581, -0.9391843, -4.619233, 0, 1, 0.4, 1,
-0.3120166, -0.000418514, -1.956926, 0, 1, 0.4078431, 1,
-0.3021759, -0.07066625, -1.074018, 0, 1, 0.4117647, 1,
-0.293056, 0.1437984, -2.434277, 0, 1, 0.4196078, 1,
-0.2854924, -0.3770873, -2.337065, 0, 1, 0.4235294, 1,
-0.2852097, 0.9023512, 0.5808729, 0, 1, 0.4313726, 1,
-0.2848262, -1.145175, -1.871947, 0, 1, 0.4352941, 1,
-0.271304, 1.265965, 0.2294855, 0, 1, 0.4431373, 1,
-0.2711192, -0.6446665, -3.103473, 0, 1, 0.4470588, 1,
-0.2688906, 1.074364, 0.994241, 0, 1, 0.454902, 1,
-0.2675095, 0.7038817, 0.2013352, 0, 1, 0.4588235, 1,
-0.2641802, -0.2336664, -2.419528, 0, 1, 0.4666667, 1,
-0.2609529, -0.5859352, -3.28328, 0, 1, 0.4705882, 1,
-0.2595279, 1.802003, 0.0692779, 0, 1, 0.4784314, 1,
-0.2589217, -0.3090933, -1.120844, 0, 1, 0.4823529, 1,
-0.2546512, -0.9618967, -3.34933, 0, 1, 0.4901961, 1,
-0.2368956, -0.5025623, -2.595701, 0, 1, 0.4941176, 1,
-0.2363265, 0.4384635, -1.017515, 0, 1, 0.5019608, 1,
-0.2356911, -1.250613, -3.557328, 0, 1, 0.509804, 1,
-0.2327185, -0.1555174, -1.098019, 0, 1, 0.5137255, 1,
-0.224738, 0.1086103, -1.259564, 0, 1, 0.5215687, 1,
-0.2219202, 0.4442199, -1.520697, 0, 1, 0.5254902, 1,
-0.2211525, 1.821747, -0.1025311, 0, 1, 0.5333334, 1,
-0.2177342, -1.237844, -1.930506, 0, 1, 0.5372549, 1,
-0.216782, -0.773271, -1.910312, 0, 1, 0.5450981, 1,
-0.21587, 0.36199, -1.036762, 0, 1, 0.5490196, 1,
-0.2158299, 2.311, 0.7761561, 0, 1, 0.5568628, 1,
-0.2123834, 0.9034282, -0.3891518, 0, 1, 0.5607843, 1,
-0.211052, -0.3794792, -2.488979, 0, 1, 0.5686275, 1,
-0.2107647, 0.8585437, -0.03669312, 0, 1, 0.572549, 1,
-0.2090101, 1.259843, -2.560596, 0, 1, 0.5803922, 1,
-0.2069741, -0.564916, -2.372524, 0, 1, 0.5843138, 1,
-0.2068066, 0.5136777, 0.500412, 0, 1, 0.5921569, 1,
-0.2053432, 0.6681679, -1.130577, 0, 1, 0.5960785, 1,
-0.198859, 1.229364, -1.039906, 0, 1, 0.6039216, 1,
-0.1972512, 0.9858383, 0.1271988, 0, 1, 0.6117647, 1,
-0.1965649, -0.01241421, -3.054337, 0, 1, 0.6156863, 1,
-0.1955043, -0.1486502, -1.153406, 0, 1, 0.6235294, 1,
-0.195418, 0.1435441, -0.8788508, 0, 1, 0.627451, 1,
-0.1939242, 0.580064, -0.5862119, 0, 1, 0.6352941, 1,
-0.1908675, -1.016951, -4.355271, 0, 1, 0.6392157, 1,
-0.1869269, 2.262158, -0.9377634, 0, 1, 0.6470588, 1,
-0.1867812, 0.2055911, -2.224249, 0, 1, 0.6509804, 1,
-0.1865745, 0.470406, -1.865698, 0, 1, 0.6588235, 1,
-0.1845376, 0.768365, -2.785516, 0, 1, 0.6627451, 1,
-0.1838557, 0.2232091, -0.01431795, 0, 1, 0.6705883, 1,
-0.1833389, -0.2828757, -0.5857183, 0, 1, 0.6745098, 1,
-0.1822872, 0.04627883, 0.02398767, 0, 1, 0.682353, 1,
-0.1821353, -0.03805703, -2.301899, 0, 1, 0.6862745, 1,
-0.1808947, 0.1066791, 0.3850051, 0, 1, 0.6941177, 1,
-0.1757035, 1.33225, -0.03238114, 0, 1, 0.7019608, 1,
-0.1755391, 0.714227, -0.3927897, 0, 1, 0.7058824, 1,
-0.1753408, 1.351025, -1.090697, 0, 1, 0.7137255, 1,
-0.1745025, 0.07386371, -2.011295, 0, 1, 0.7176471, 1,
-0.17309, 0.2377975, -1.566629, 0, 1, 0.7254902, 1,
-0.1719901, 1.123605, 0.2709557, 0, 1, 0.7294118, 1,
-0.1719393, 1.027014, 0.9155903, 0, 1, 0.7372549, 1,
-0.1711175, -1.076284, -3.624854, 0, 1, 0.7411765, 1,
-0.1707427, 1.210506, -1.505145, 0, 1, 0.7490196, 1,
-0.1700044, -0.3291143, -3.222825, 0, 1, 0.7529412, 1,
-0.1661783, 0.1533517, -1.41299, 0, 1, 0.7607843, 1,
-0.1653686, 0.6180981, 0.5507873, 0, 1, 0.7647059, 1,
-0.1605557, -0.430993, -3.141668, 0, 1, 0.772549, 1,
-0.1603301, -0.4655184, -2.297236, 0, 1, 0.7764706, 1,
-0.1602429, 1.62144, -0.3130643, 0, 1, 0.7843137, 1,
-0.1584266, -1.530652, -1.272049, 0, 1, 0.7882353, 1,
-0.156394, 1.36622, 0.4267682, 0, 1, 0.7960784, 1,
-0.1541519, -2.960425, -0.1912982, 0, 1, 0.8039216, 1,
-0.1532743, -0.2882057, -1.355618, 0, 1, 0.8078431, 1,
-0.1399915, 0.4140634, 0.699634, 0, 1, 0.8156863, 1,
-0.139264, -0.01465285, -0.07291324, 0, 1, 0.8196079, 1,
-0.1372651, -0.9536291, -2.863052, 0, 1, 0.827451, 1,
-0.1343827, -0.4332164, -2.668196, 0, 1, 0.8313726, 1,
-0.1294882, -1.220071, -3.167798, 0, 1, 0.8392157, 1,
-0.1291874, -0.3915347, -3.321901, 0, 1, 0.8431373, 1,
-0.1284214, -0.147193, -0.8098413, 0, 1, 0.8509804, 1,
-0.126377, -0.4926554, -2.170498, 0, 1, 0.854902, 1,
-0.126175, -0.3088617, -2.943372, 0, 1, 0.8627451, 1,
-0.1251134, 1.776646, -0.2856649, 0, 1, 0.8666667, 1,
-0.1222255, 0.36434, -0.9396923, 0, 1, 0.8745098, 1,
-0.1181001, 0.01788758, -3.371927, 0, 1, 0.8784314, 1,
-0.114584, 0.005053192, -4.276537, 0, 1, 0.8862745, 1,
-0.108813, 0.381111, 0.2801298, 0, 1, 0.8901961, 1,
-0.108348, -0.2050824, -3.265099, 0, 1, 0.8980392, 1,
-0.106469, -0.536121, -2.658256, 0, 1, 0.9058824, 1,
-0.104275, -0.1723552, -1.373635, 0, 1, 0.9098039, 1,
-0.1040655, -0.2703045, -2.412385, 0, 1, 0.9176471, 1,
-0.1035421, 0.8867907, -0.26168, 0, 1, 0.9215686, 1,
-0.1019077, -0.8556215, -5.400753, 0, 1, 0.9294118, 1,
-0.09977323, 0.3134728, 1.073205, 0, 1, 0.9333333, 1,
-0.09936944, -0.01838188, -0.0702508, 0, 1, 0.9411765, 1,
-0.09302007, 1.296857, 0.7384882, 0, 1, 0.945098, 1,
-0.09104694, 0.3769494, -0.9775563, 0, 1, 0.9529412, 1,
-0.08442409, -0.2447804, -1.835752, 0, 1, 0.9568627, 1,
-0.08414067, 0.9176547, -0.9413882, 0, 1, 0.9647059, 1,
-0.08143849, -0.03845932, -2.872046, 0, 1, 0.9686275, 1,
-0.08113991, 0.1930323, -2.441402, 0, 1, 0.9764706, 1,
-0.07937107, 0.6529642, -0.7582101, 0, 1, 0.9803922, 1,
-0.07852577, 0.882259, 0.2263505, 0, 1, 0.9882353, 1,
-0.07315785, 0.4499786, 0.2722475, 0, 1, 0.9921569, 1,
-0.07170477, -1.014945, -3.825078, 0, 1, 1, 1,
-0.06888413, -0.4526879, -4.666111, 0, 0.9921569, 1, 1,
-0.06830239, 0.137675, 0.9316438, 0, 0.9882353, 1, 1,
-0.05979282, 0.07514726, -0.9529147, 0, 0.9803922, 1, 1,
-0.05919979, 0.354201, -0.5889139, 0, 0.9764706, 1, 1,
-0.05123558, -0.3953554, -3.351399, 0, 0.9686275, 1, 1,
-0.05049966, 0.04622241, -1.80517, 0, 0.9647059, 1, 1,
-0.04798866, 3.122657, -0.0928997, 0, 0.9568627, 1, 1,
-0.04664651, -1.121601, -4.022552, 0, 0.9529412, 1, 1,
-0.0461467, -1.047084, -3.230504, 0, 0.945098, 1, 1,
-0.04244588, -0.6839211, -3.045741, 0, 0.9411765, 1, 1,
-0.04211609, -0.5919189, -3.093172, 0, 0.9333333, 1, 1,
-0.03924856, -1.798531, -2.815845, 0, 0.9294118, 1, 1,
-0.03658194, -1.494974, -2.710593, 0, 0.9215686, 1, 1,
-0.03555074, 1.486084, 0.3999032, 0, 0.9176471, 1, 1,
-0.03379459, 0.9131007, -0.08268556, 0, 0.9098039, 1, 1,
-0.03072543, -0.4346066, -3.498549, 0, 0.9058824, 1, 1,
-0.03046015, -1.408285, -3.564422, 0, 0.8980392, 1, 1,
-0.03018689, -2.009601, -3.564469, 0, 0.8901961, 1, 1,
-0.02809236, 1.078394, 0.9029373, 0, 0.8862745, 1, 1,
-0.02144649, -1.821233, -3.132911, 0, 0.8784314, 1, 1,
-0.01921858, -0.5553732, -3.087619, 0, 0.8745098, 1, 1,
-0.01847278, -0.03807392, -3.853246, 0, 0.8666667, 1, 1,
-0.01565136, -0.03164412, -1.827465, 0, 0.8627451, 1, 1,
-0.01253523, 0.2352299, -0.9390014, 0, 0.854902, 1, 1,
-0.01030187, 0.9398656, 0.3072571, 0, 0.8509804, 1, 1,
-0.008141133, -0.5771055, -1.427761, 0, 0.8431373, 1, 1,
-0.007609786, 1.037173, 1.298203, 0, 0.8392157, 1, 1,
-0.007529473, -0.9861789, -4.403125, 0, 0.8313726, 1, 1,
-0.001208499, -0.7752117, -2.67167, 0, 0.827451, 1, 1,
0.004083409, -0.578212, 2.711539, 0, 0.8196079, 1, 1,
0.004770312, -0.4024862, 2.812185, 0, 0.8156863, 1, 1,
0.00504212, 0.1693245, -0.8931585, 0, 0.8078431, 1, 1,
0.00545212, -0.8283101, 4.986012, 0, 0.8039216, 1, 1,
0.006842847, 1.465951, 1.131578, 0, 0.7960784, 1, 1,
0.0100749, 1.102154, 0.872556, 0, 0.7882353, 1, 1,
0.01067713, 0.8411392, 0.4611482, 0, 0.7843137, 1, 1,
0.01182827, 0.7603393, 1.190625, 0, 0.7764706, 1, 1,
0.01241308, -1.77269, 5.111997, 0, 0.772549, 1, 1,
0.02123009, -2.255172, 3.459218, 0, 0.7647059, 1, 1,
0.02801236, -0.5176179, 3.47711, 0, 0.7607843, 1, 1,
0.02896473, -1.232778, 3.013726, 0, 0.7529412, 1, 1,
0.0290161, 0.1144114, -1.542585, 0, 0.7490196, 1, 1,
0.03129188, -1.261609, 4.495059, 0, 0.7411765, 1, 1,
0.03931024, -0.1710854, 3.703914, 0, 0.7372549, 1, 1,
0.04236289, 0.2551059, 0.03691444, 0, 0.7294118, 1, 1,
0.04328946, 0.5130295, 2.841138, 0, 0.7254902, 1, 1,
0.04736031, -2.181945, 2.212667, 0, 0.7176471, 1, 1,
0.04841205, -0.009955508, 1.718735, 0, 0.7137255, 1, 1,
0.05469853, -0.005211552, 2.834815, 0, 0.7058824, 1, 1,
0.05566018, -0.5910833, 3.940419, 0, 0.6980392, 1, 1,
0.05868457, 0.7250026, -1.304527, 0, 0.6941177, 1, 1,
0.06006701, -1.032689, 1.932431, 0, 0.6862745, 1, 1,
0.06215646, 1.769191, 0.3792455, 0, 0.682353, 1, 1,
0.06372008, 0.5930793, 0.2112604, 0, 0.6745098, 1, 1,
0.06996635, -0.5998837, 2.847878, 0, 0.6705883, 1, 1,
0.07017636, 2.064246, 1.869388, 0, 0.6627451, 1, 1,
0.07097525, 0.4825371, 0.7737912, 0, 0.6588235, 1, 1,
0.07127776, 0.1552593, 1.371507, 0, 0.6509804, 1, 1,
0.07422151, -2.258097, 1.071442, 0, 0.6470588, 1, 1,
0.07527559, -0.339965, 2.66513, 0, 0.6392157, 1, 1,
0.07690459, 0.7374246, -0.507342, 0, 0.6352941, 1, 1,
0.07742187, -1.713738, 4.591688, 0, 0.627451, 1, 1,
0.07808827, -1.146117, 1.189795, 0, 0.6235294, 1, 1,
0.08396572, -0.3974345, 2.875547, 0, 0.6156863, 1, 1,
0.08535263, 0.6541016, 0.4189427, 0, 0.6117647, 1, 1,
0.08677132, -0.1572467, 3.614711, 0, 0.6039216, 1, 1,
0.08723378, 0.5152515, 2.383545, 0, 0.5960785, 1, 1,
0.0872962, -1.935168, 2.779235, 0, 0.5921569, 1, 1,
0.09267098, -0.9579037, 2.688325, 0, 0.5843138, 1, 1,
0.09654317, 0.3090289, -0.5493804, 0, 0.5803922, 1, 1,
0.09885406, 0.4952788, 0.8673366, 0, 0.572549, 1, 1,
0.1012942, -0.5282738, 2.403926, 0, 0.5686275, 1, 1,
0.1015005, -0.5605833, 2.917666, 0, 0.5607843, 1, 1,
0.1029383, 0.6601034, -0.5708629, 0, 0.5568628, 1, 1,
0.1037613, 0.8861693, 1.410661, 0, 0.5490196, 1, 1,
0.1050327, 0.2575156, 0.8605339, 0, 0.5450981, 1, 1,
0.1118792, -0.1494059, 2.458135, 0, 0.5372549, 1, 1,
0.1177514, -0.4588202, 4.196413, 0, 0.5333334, 1, 1,
0.1178994, -2.066762, 1.582082, 0, 0.5254902, 1, 1,
0.1214028, 1.787649, -0.03908367, 0, 0.5215687, 1, 1,
0.1236846, -0.9442078, 3.450749, 0, 0.5137255, 1, 1,
0.1239516, 1.355874, 0.4841149, 0, 0.509804, 1, 1,
0.1241662, 1.539483, -0.2354082, 0, 0.5019608, 1, 1,
0.1262915, -0.212414, 2.927727, 0, 0.4941176, 1, 1,
0.1272509, -0.9140877, 2.777474, 0, 0.4901961, 1, 1,
0.1276865, 0.5230194, 0.5401589, 0, 0.4823529, 1, 1,
0.1303967, -0.952376, 2.88727, 0, 0.4784314, 1, 1,
0.1339386, -0.8633584, 5.118103, 0, 0.4705882, 1, 1,
0.1358052, -1.430961, 2.65726, 0, 0.4666667, 1, 1,
0.1430008, -0.5733494, 1.904529, 0, 0.4588235, 1, 1,
0.150072, 0.2644901, -0.4024894, 0, 0.454902, 1, 1,
0.1513902, 0.889927, 1.334656, 0, 0.4470588, 1, 1,
0.1552431, -0.6296449, 1.447552, 0, 0.4431373, 1, 1,
0.1556767, 0.2920856, 1.970884, 0, 0.4352941, 1, 1,
0.1599173, 0.4161809, 0.2015235, 0, 0.4313726, 1, 1,
0.1616744, -0.8394032, 2.687999, 0, 0.4235294, 1, 1,
0.1617243, -1.038051, 3.82462, 0, 0.4196078, 1, 1,
0.1673613, -1.408451, 3.1445, 0, 0.4117647, 1, 1,
0.1713343, 1.416256, 0.9021414, 0, 0.4078431, 1, 1,
0.1716799, 0.7456387, -0.03137463, 0, 0.4, 1, 1,
0.1720895, 0.2387795, 0.8492503, 0, 0.3921569, 1, 1,
0.1734258, -1.679717, 2.764791, 0, 0.3882353, 1, 1,
0.1743993, 1.562027, -0.3305673, 0, 0.3803922, 1, 1,
0.1770976, 0.9611406, 0.4215072, 0, 0.3764706, 1, 1,
0.1806498, 0.1559314, 0.1315926, 0, 0.3686275, 1, 1,
0.1828082, -0.7143413, 0.8659044, 0, 0.3647059, 1, 1,
0.1830787, -0.4235255, 1.014345, 0, 0.3568628, 1, 1,
0.1835638, 0.3563149, 0.6633289, 0, 0.3529412, 1, 1,
0.1842643, 1.668855, -0.4904346, 0, 0.345098, 1, 1,
0.1903961, -0.8579853, 4.853687, 0, 0.3411765, 1, 1,
0.1928466, 0.7634932, 0.476133, 0, 0.3333333, 1, 1,
0.1945395, -1.676955, 2.512764, 0, 0.3294118, 1, 1,
0.1962981, 0.01430874, 0.3945307, 0, 0.3215686, 1, 1,
0.1973075, 0.812561, -0.7161934, 0, 0.3176471, 1, 1,
0.1977974, -1.340073, 1.84567, 0, 0.3098039, 1, 1,
0.199654, -0.6260241, 2.9508, 0, 0.3058824, 1, 1,
0.2018067, -0.7273546, 2.290446, 0, 0.2980392, 1, 1,
0.2048847, -0.214964, 1.203783, 0, 0.2901961, 1, 1,
0.2049891, -1.448925, 3.099632, 0, 0.2862745, 1, 1,
0.2072954, 0.3528156, 1.536265, 0, 0.2784314, 1, 1,
0.2076295, 0.570251, 0.8292191, 0, 0.2745098, 1, 1,
0.2077432, -0.1307945, 3.584469, 0, 0.2666667, 1, 1,
0.2111232, -0.4750139, 2.11778, 0, 0.2627451, 1, 1,
0.22248, -1.993802, 1.457913, 0, 0.254902, 1, 1,
0.2256118, -0.7727145, 3.951542, 0, 0.2509804, 1, 1,
0.2257474, 0.553656, 0.2368276, 0, 0.2431373, 1, 1,
0.2261247, -1.07621, 2.288476, 0, 0.2392157, 1, 1,
0.2286226, 0.3383282, -0.5059493, 0, 0.2313726, 1, 1,
0.2295482, 0.7314062, 0.6490423, 0, 0.227451, 1, 1,
0.2296169, 0.01930218, 1.308665, 0, 0.2196078, 1, 1,
0.2301009, 0.6133568, 1.52957, 0, 0.2156863, 1, 1,
0.2306616, -1.000297, 3.360207, 0, 0.2078431, 1, 1,
0.2319442, -1.321155, 1.680734, 0, 0.2039216, 1, 1,
0.236329, -0.4074726, 5.417515, 0, 0.1960784, 1, 1,
0.2375904, 0.1204255, 0.9382858, 0, 0.1882353, 1, 1,
0.2520469, -1.106197, 0.5633773, 0, 0.1843137, 1, 1,
0.252167, 0.4847033, 0.2125463, 0, 0.1764706, 1, 1,
0.2524174, -0.01501543, 3.650477, 0, 0.172549, 1, 1,
0.2560141, 0.07404833, 2.856921, 0, 0.1647059, 1, 1,
0.2570522, -1.612985, 2.596118, 0, 0.1607843, 1, 1,
0.2584789, -0.3407668, 1.649406, 0, 0.1529412, 1, 1,
0.2596675, -0.3666791, 2.004279, 0, 0.1490196, 1, 1,
0.2685906, 0.9178531, 0.4891917, 0, 0.1411765, 1, 1,
0.269248, 0.6388508, -2.093043, 0, 0.1372549, 1, 1,
0.2711252, 1.304251, 0.1858184, 0, 0.1294118, 1, 1,
0.2730165, -0.3830016, 0.734691, 0, 0.1254902, 1, 1,
0.277642, -0.5397914, 4.833435, 0, 0.1176471, 1, 1,
0.2840353, 0.1031842, 1.737417, 0, 0.1137255, 1, 1,
0.2869423, -0.06730002, 1.124019, 0, 0.1058824, 1, 1,
0.287663, 0.7053597, 1.896334, 0, 0.09803922, 1, 1,
0.2892275, -0.8770115, 1.690562, 0, 0.09411765, 1, 1,
0.2894842, 1.784622, 0.8113697, 0, 0.08627451, 1, 1,
0.2905334, 0.1261927, 1.672954, 0, 0.08235294, 1, 1,
0.2976103, 0.818163, -0.5008575, 0, 0.07450981, 1, 1,
0.2990599, 0.3005402, -1.868151, 0, 0.07058824, 1, 1,
0.3015209, -1.410401, 4.428549, 0, 0.0627451, 1, 1,
0.3025924, 0.6499694, -0.3883314, 0, 0.05882353, 1, 1,
0.3107952, -0.1824435, 0.9820776, 0, 0.05098039, 1, 1,
0.3126276, -1.376716, 4.781132, 0, 0.04705882, 1, 1,
0.319968, 0.1443701, 2.218832, 0, 0.03921569, 1, 1,
0.3203965, 0.3670509, 0.007792702, 0, 0.03529412, 1, 1,
0.3220507, -0.4233668, 2.859605, 0, 0.02745098, 1, 1,
0.3223096, -0.5776367, 3.230147, 0, 0.02352941, 1, 1,
0.3272124, -0.07986984, 1.196281, 0, 0.01568628, 1, 1,
0.3278969, 2.255286, 0.9468588, 0, 0.01176471, 1, 1,
0.3299432, 0.04236825, 2.684126, 0, 0.003921569, 1, 1,
0.3351862, -1.409475, 3.568654, 0.003921569, 0, 1, 1,
0.3376096, 0.5338386, 0.7604641, 0.007843138, 0, 1, 1,
0.3389404, -0.152002, 3.414326, 0.01568628, 0, 1, 1,
0.341488, 0.4496748, 2.826704, 0.01960784, 0, 1, 1,
0.3425912, 0.7962269, -0.9740317, 0.02745098, 0, 1, 1,
0.3468764, -0.06262292, 2.772114, 0.03137255, 0, 1, 1,
0.3475097, -1.082435, 1.112681, 0.03921569, 0, 1, 1,
0.3502569, -1.147932, 2.871089, 0.04313726, 0, 1, 1,
0.3515948, -0.1410389, 1.701387, 0.05098039, 0, 1, 1,
0.3569587, 1.182522, 0.9157115, 0.05490196, 0, 1, 1,
0.3571786, 0.9076783, 1.146432, 0.0627451, 0, 1, 1,
0.360323, 0.5990075, 0.9435098, 0.06666667, 0, 1, 1,
0.3726777, 0.3967338, 1.308767, 0.07450981, 0, 1, 1,
0.3732827, -0.3155554, 1.018507, 0.07843138, 0, 1, 1,
0.3736081, 0.1498009, 1.744543, 0.08627451, 0, 1, 1,
0.3759891, -0.07673213, 4.721557, 0.09019608, 0, 1, 1,
0.3879345, 0.2627695, 0.8381303, 0.09803922, 0, 1, 1,
0.3883922, 0.5803286, 1.570273, 0.1058824, 0, 1, 1,
0.3925847, -1.190871, 4.31262, 0.1098039, 0, 1, 1,
0.3943267, -0.7172375, 1.399615, 0.1176471, 0, 1, 1,
0.3952641, -1.852848, 4.171527, 0.1215686, 0, 1, 1,
0.3984252, 1.626402, 1.18304, 0.1294118, 0, 1, 1,
0.4015478, 0.4541234, 1.447352, 0.1333333, 0, 1, 1,
0.402675, 0.5699452, -0.04047275, 0.1411765, 0, 1, 1,
0.4051969, 0.05180202, 1.278517, 0.145098, 0, 1, 1,
0.4074208, 1.078473, 1.528327, 0.1529412, 0, 1, 1,
0.4084511, 1.17434, -0.1845243, 0.1568628, 0, 1, 1,
0.4120789, 1.626626, 1.323467, 0.1647059, 0, 1, 1,
0.4158852, -0.02811419, 2.87083, 0.1686275, 0, 1, 1,
0.4164548, 0.513191, 1.644681, 0.1764706, 0, 1, 1,
0.4213003, -0.3275469, 0.764693, 0.1803922, 0, 1, 1,
0.4215188, 1.693815, 2.479598, 0.1882353, 0, 1, 1,
0.4226676, 0.9048591, 1.83893, 0.1921569, 0, 1, 1,
0.4239782, 0.1644768, 2.080381, 0.2, 0, 1, 1,
0.4261217, -0.6641438, -0.06368361, 0.2078431, 0, 1, 1,
0.4264892, -0.09862364, 2.955902, 0.2117647, 0, 1, 1,
0.4279487, 0.3009567, -0.9361115, 0.2196078, 0, 1, 1,
0.4281096, -1.184646, 2.197144, 0.2235294, 0, 1, 1,
0.4318838, -0.6040984, 3.602578, 0.2313726, 0, 1, 1,
0.4387154, -1.241516, 3.835205, 0.2352941, 0, 1, 1,
0.4415566, 0.5338718, 0.4618915, 0.2431373, 0, 1, 1,
0.4418213, 1.502183, 1.833779, 0.2470588, 0, 1, 1,
0.4545652, 0.9153192, 0.6592199, 0.254902, 0, 1, 1,
0.4614602, 1.003832, 0.002145855, 0.2588235, 0, 1, 1,
0.4636303, 0.8795947, 0.1134671, 0.2666667, 0, 1, 1,
0.4710735, 1.25154, 2.45911, 0.2705882, 0, 1, 1,
0.4719856, 0.1164873, 1.406498, 0.2784314, 0, 1, 1,
0.4740877, 0.7360532, 0.753237, 0.282353, 0, 1, 1,
0.4742403, 1.165643, 1.497386, 0.2901961, 0, 1, 1,
0.4782523, -0.4589282, 2.263128, 0.2941177, 0, 1, 1,
0.4814831, -0.5094825, 1.998897, 0.3019608, 0, 1, 1,
0.4891454, -0.9800755, 2.597718, 0.3098039, 0, 1, 1,
0.4893859, 0.7984338, 2.945701, 0.3137255, 0, 1, 1,
0.4912869, 1.120533, 2.9818, 0.3215686, 0, 1, 1,
0.5055732, 0.05617648, 1.414865, 0.3254902, 0, 1, 1,
0.510949, 1.01842, 0.3818986, 0.3333333, 0, 1, 1,
0.5125424, 0.03779885, 0.5236483, 0.3372549, 0, 1, 1,
0.5173294, 1.415036, 0.198207, 0.345098, 0, 1, 1,
0.5192481, 1.959553, -0.08022346, 0.3490196, 0, 1, 1,
0.5209926, -1.973581, 4.642262, 0.3568628, 0, 1, 1,
0.524049, 0.1027166, 1.768552, 0.3607843, 0, 1, 1,
0.5268477, -0.2530938, 1.662257, 0.3686275, 0, 1, 1,
0.5322593, 1.454293, 0.7729014, 0.372549, 0, 1, 1,
0.5324837, -1.363404, 2.211023, 0.3803922, 0, 1, 1,
0.5388405, -0.3220192, 3.004915, 0.3843137, 0, 1, 1,
0.5389151, -0.6396902, 2.07041, 0.3921569, 0, 1, 1,
0.5406621, 0.5524929, 0.3950215, 0.3960784, 0, 1, 1,
0.541634, -0.4801395, 2.113867, 0.4039216, 0, 1, 1,
0.5422645, -0.316073, 2.548055, 0.4117647, 0, 1, 1,
0.5530777, -1.031703, 2.638648, 0.4156863, 0, 1, 1,
0.5531206, 0.009788296, 1.102419, 0.4235294, 0, 1, 1,
0.5586835, -1.442093, 0.2438387, 0.427451, 0, 1, 1,
0.5601412, -0.9543964, 1.239119, 0.4352941, 0, 1, 1,
0.5620164, -0.4445764, 1.844889, 0.4392157, 0, 1, 1,
0.5648387, 1.27149, -0.7937723, 0.4470588, 0, 1, 1,
0.5656851, -0.5446608, 1.682611, 0.4509804, 0, 1, 1,
0.5672365, 1.486694, -1.599464, 0.4588235, 0, 1, 1,
0.5674206, 3.036788, -0.007124806, 0.4627451, 0, 1, 1,
0.5698631, -1.873951, 1.458556, 0.4705882, 0, 1, 1,
0.5720948, -0.690143, 2.159683, 0.4745098, 0, 1, 1,
0.5760036, 1.383083, -0.2158429, 0.4823529, 0, 1, 1,
0.5761164, -0.3017951, 2.696722, 0.4862745, 0, 1, 1,
0.5775653, 1.302325, 0.6947774, 0.4941176, 0, 1, 1,
0.5811958, 1.0636, 0.4549597, 0.5019608, 0, 1, 1,
0.5859676, 1.340804, 2.338023, 0.5058824, 0, 1, 1,
0.5864282, -0.8701538, 2.997292, 0.5137255, 0, 1, 1,
0.5866039, -0.8236353, 4.373458, 0.5176471, 0, 1, 1,
0.5884494, 0.6695911, 0.26138, 0.5254902, 0, 1, 1,
0.5893915, -1.028858, 2.235329, 0.5294118, 0, 1, 1,
0.5928429, -0.1703988, 0.04013514, 0.5372549, 0, 1, 1,
0.5937179, 0.186905, 2.028709, 0.5411765, 0, 1, 1,
0.5971963, -0.6058782, 2.795651, 0.5490196, 0, 1, 1,
0.5996286, -0.6698116, 1.742573, 0.5529412, 0, 1, 1,
0.6019216, 0.1833422, 1.434079, 0.5607843, 0, 1, 1,
0.6025112, -0.5967519, 1.429125, 0.5647059, 0, 1, 1,
0.603567, -0.4219213, 4.926738, 0.572549, 0, 1, 1,
0.6069687, -0.2207521, 1.936537, 0.5764706, 0, 1, 1,
0.6087857, 1.061746, -2.357527, 0.5843138, 0, 1, 1,
0.610115, -0.7329507, 4.346941, 0.5882353, 0, 1, 1,
0.6138024, 0.6708781, 1.742896, 0.5960785, 0, 1, 1,
0.615138, 0.3661089, -0.134818, 0.6039216, 0, 1, 1,
0.6223103, 0.6960393, 1.127595, 0.6078432, 0, 1, 1,
0.6244534, -0.2652964, 3.644307, 0.6156863, 0, 1, 1,
0.6316068, -0.4530765, 3.04287, 0.6196079, 0, 1, 1,
0.6337613, -0.06467275, 0.9169106, 0.627451, 0, 1, 1,
0.6354061, 0.4501522, 0.1423923, 0.6313726, 0, 1, 1,
0.6450198, 0.4181731, 2.188516, 0.6392157, 0, 1, 1,
0.6482376, 2.087278, -0.7542002, 0.6431373, 0, 1, 1,
0.6517346, -0.5479149, 2.262502, 0.6509804, 0, 1, 1,
0.6520928, -0.2524829, 2.699278, 0.654902, 0, 1, 1,
0.6563547, -0.08081408, 1.351101, 0.6627451, 0, 1, 1,
0.6604996, 0.1955792, 0.9880573, 0.6666667, 0, 1, 1,
0.664262, -0.04364309, 0.9991461, 0.6745098, 0, 1, 1,
0.6648475, 1.435689, -1.222439, 0.6784314, 0, 1, 1,
0.6670557, -0.647424, 1.141493, 0.6862745, 0, 1, 1,
0.670812, 1.614029, 0.8139021, 0.6901961, 0, 1, 1,
0.6736028, 1.755187, 0.8089755, 0.6980392, 0, 1, 1,
0.6742349, 1.390207, 0.6036209, 0.7058824, 0, 1, 1,
0.6770934, 1.310347, -0.1022199, 0.7098039, 0, 1, 1,
0.6771795, -2.731327, 4.100674, 0.7176471, 0, 1, 1,
0.6813443, -0.4440738, 2.960642, 0.7215686, 0, 1, 1,
0.6813457, 0.01833274, 1.943534, 0.7294118, 0, 1, 1,
0.6835706, 0.5945986, 0.9965886, 0.7333333, 0, 1, 1,
0.6838722, 2.050978, -0.9188648, 0.7411765, 0, 1, 1,
0.6846104, -0.3482935, 2.994318, 0.7450981, 0, 1, 1,
0.6976251, -0.9785855, 1.247161, 0.7529412, 0, 1, 1,
0.7033888, 1.667481, -0.053636, 0.7568628, 0, 1, 1,
0.7042522, 0.4280533, 1.621936, 0.7647059, 0, 1, 1,
0.7070888, -1.344954, 2.269426, 0.7686275, 0, 1, 1,
0.7080238, -1.14168, 1.93943, 0.7764706, 0, 1, 1,
0.716, -0.6523759, 2.069983, 0.7803922, 0, 1, 1,
0.7220696, -0.1479835, 1.38637, 0.7882353, 0, 1, 1,
0.7224948, 1.058342, -0.3957421, 0.7921569, 0, 1, 1,
0.7317865, -1.499085, 3.283047, 0.8, 0, 1, 1,
0.7329014, 0.1066275, 2.062828, 0.8078431, 0, 1, 1,
0.7409158, -0.3437307, 3.79116, 0.8117647, 0, 1, 1,
0.7427065, 0.5342641, 0.5467821, 0.8196079, 0, 1, 1,
0.7444925, -0.2690308, 2.028419, 0.8235294, 0, 1, 1,
0.7457095, -1.263209, 3.085346, 0.8313726, 0, 1, 1,
0.7459482, -0.4527822, 0.9449971, 0.8352941, 0, 1, 1,
0.7460114, 1.198867, -0.6110968, 0.8431373, 0, 1, 1,
0.7471754, -2.959783, 3.589907, 0.8470588, 0, 1, 1,
0.7521181, 0.2608909, 0.7412357, 0.854902, 0, 1, 1,
0.7661234, -0.585766, 2.622056, 0.8588235, 0, 1, 1,
0.7714164, 0.156605, 2.176723, 0.8666667, 0, 1, 1,
0.7715971, 0.09946159, 1.16471, 0.8705882, 0, 1, 1,
0.7807648, -0.5707318, 1.863416, 0.8784314, 0, 1, 1,
0.7855175, 0.8939962, 0.9506905, 0.8823529, 0, 1, 1,
0.7991298, -0.2868479, 0.185473, 0.8901961, 0, 1, 1,
0.7994316, -1.926544, 4.616651, 0.8941177, 0, 1, 1,
0.8004353, -0.5648054, 0.6849274, 0.9019608, 0, 1, 1,
0.8037607, -1.533099, 3.135364, 0.9098039, 0, 1, 1,
0.804989, -0.4985776, 1.755988, 0.9137255, 0, 1, 1,
0.8141019, 0.8464245, 0.3613883, 0.9215686, 0, 1, 1,
0.8151677, -0.6346347, 1.537349, 0.9254902, 0, 1, 1,
0.8196155, -1.380588, 2.043282, 0.9333333, 0, 1, 1,
0.8202477, 0.3528123, 1.604674, 0.9372549, 0, 1, 1,
0.8249093, 0.1155523, 0.5113346, 0.945098, 0, 1, 1,
0.8318161, 0.030843, 0.341606, 0.9490196, 0, 1, 1,
0.8418702, 0.09599441, 2.149028, 0.9568627, 0, 1, 1,
0.8420492, -1.431564, 0.9234378, 0.9607843, 0, 1, 1,
0.8529933, 0.6191769, 1.559255, 0.9686275, 0, 1, 1,
0.8533684, 1.264392, 0.5662094, 0.972549, 0, 1, 1,
0.8570938, 1.487504, 2.008597, 0.9803922, 0, 1, 1,
0.8580962, -0.7498504, 2.41202, 0.9843137, 0, 1, 1,
0.8640324, 0.7320849, -0.3123338, 0.9921569, 0, 1, 1,
0.8767375, 0.536759, 2.239407, 0.9960784, 0, 1, 1,
0.8793931, -1.98471, 4.51606, 1, 0, 0.9960784, 1,
0.8794321, -0.9523679, 3.488219, 1, 0, 0.9882353, 1,
0.8826149, -1.306923, 1.016538, 1, 0, 0.9843137, 1,
0.8981556, 2.487629, 0.02494545, 1, 0, 0.9764706, 1,
0.8991747, -2.262532, 3.192901, 1, 0, 0.972549, 1,
0.9016894, 0.6344823, 2.607981, 1, 0, 0.9647059, 1,
0.9047891, 0.2683235, 1.994321, 1, 0, 0.9607843, 1,
0.9096407, 2.030859, 1.550326, 1, 0, 0.9529412, 1,
0.9109856, -0.006090411, 2.104117, 1, 0, 0.9490196, 1,
0.9152701, 0.08197846, 0.357127, 1, 0, 0.9411765, 1,
0.9166043, -0.164091, 2.613704, 1, 0, 0.9372549, 1,
0.9176718, 1.432418, 0.8030132, 1, 0, 0.9294118, 1,
0.9178455, -0.2175986, 2.302495, 1, 0, 0.9254902, 1,
0.918814, -1.148118, 2.863562, 1, 0, 0.9176471, 1,
0.9342366, -0.4398706, 0.820662, 1, 0, 0.9137255, 1,
0.934414, -2.25414, 4.344771, 1, 0, 0.9058824, 1,
0.9372088, 0.06655959, -0.1682543, 1, 0, 0.9019608, 1,
0.9393588, -0.8118855, 1.117206, 1, 0, 0.8941177, 1,
0.9394335, 0.1334311, 1.445818, 1, 0, 0.8862745, 1,
0.9401619, -1.133073, 3.094679, 1, 0, 0.8823529, 1,
0.943091, -0.5254323, 2.247624, 1, 0, 0.8745098, 1,
0.9439821, -0.2195595, 0.2912776, 1, 0, 0.8705882, 1,
0.945906, 0.4234774, 1.538571, 1, 0, 0.8627451, 1,
0.9461794, 1.407071, -0.9658541, 1, 0, 0.8588235, 1,
0.9464324, -0.9301955, 1.195329, 1, 0, 0.8509804, 1,
0.9481167, 1.998082, -0.5885741, 1, 0, 0.8470588, 1,
0.9744611, 0.3311763, 1.402711, 1, 0, 0.8392157, 1,
0.9766666, -0.5348151, 1.879642, 1, 0, 0.8352941, 1,
0.9776438, 0.6994734, -0.906436, 1, 0, 0.827451, 1,
0.9816194, 0.7358302, 0.2177018, 1, 0, 0.8235294, 1,
0.9894872, 0.965903, 0.7738742, 1, 0, 0.8156863, 1,
0.9963942, 0.896394, 1.054166, 1, 0, 0.8117647, 1,
0.996866, -1.183747, 0.5210726, 1, 0, 0.8039216, 1,
1.012088, -0.7256865, 2.144387, 1, 0, 0.7960784, 1,
1.017565, 1.091884, 0.9568404, 1, 0, 0.7921569, 1,
1.020286, 0.2721545, 1.437405, 1, 0, 0.7843137, 1,
1.023837, -1.456236, 3.051435, 1, 0, 0.7803922, 1,
1.025436, 1.222304, 0.472349, 1, 0, 0.772549, 1,
1.028361, -1.549352, 3.405701, 1, 0, 0.7686275, 1,
1.037826, -1.046264, 3.133125, 1, 0, 0.7607843, 1,
1.046793, 1.656431, 0.751641, 1, 0, 0.7568628, 1,
1.050488, 0.6952549, -0.9322513, 1, 0, 0.7490196, 1,
1.051517, 0.4336336, 1.561413, 1, 0, 0.7450981, 1,
1.053998, 0.2220807, 1.025494, 1, 0, 0.7372549, 1,
1.055955, -0.6659797, 1.660231, 1, 0, 0.7333333, 1,
1.06665, -0.7064024, 2.793231, 1, 0, 0.7254902, 1,
1.085984, 0.2769461, 1.180138, 1, 0, 0.7215686, 1,
1.087178, 0.2477893, 1.61781, 1, 0, 0.7137255, 1,
1.092093, 1.072886, 2.362122, 1, 0, 0.7098039, 1,
1.093178, -0.9319831, 3.184532, 1, 0, 0.7019608, 1,
1.104467, 1.236536, -0.6305352, 1, 0, 0.6941177, 1,
1.108646, -0.6608325, 0.8807164, 1, 0, 0.6901961, 1,
1.134027, -0.3155147, 3.976569, 1, 0, 0.682353, 1,
1.137278, -0.7033262, 2.636544, 1, 0, 0.6784314, 1,
1.142734, 0.08053008, 2.902229, 1, 0, 0.6705883, 1,
1.145201, 0.6072779, 1.794427, 1, 0, 0.6666667, 1,
1.14551, 0.5279435, -0.3562047, 1, 0, 0.6588235, 1,
1.151389, 0.4233733, 0.3336971, 1, 0, 0.654902, 1,
1.152168, -0.2779894, 2.981345, 1, 0, 0.6470588, 1,
1.161686, -1.17909, 1.470751, 1, 0, 0.6431373, 1,
1.162788, -0.2895309, 1.384922, 1, 0, 0.6352941, 1,
1.165346, -0.5227458, 2.444116, 1, 0, 0.6313726, 1,
1.165654, 0.02609543, 2.023114, 1, 0, 0.6235294, 1,
1.175948, 0.5177673, 0.3016255, 1, 0, 0.6196079, 1,
1.178468, -1.081682, 2.73271, 1, 0, 0.6117647, 1,
1.179433, 1.234965, 1.162069, 1, 0, 0.6078432, 1,
1.183668, -1.09775, 0.2471544, 1, 0, 0.6, 1,
1.192872, 0.8151937, -0.04508182, 1, 0, 0.5921569, 1,
1.199669, 0.786085, 2.18533, 1, 0, 0.5882353, 1,
1.20219, -1.074943, 2.922832, 1, 0, 0.5803922, 1,
1.204315, -1.301312, 2.168087, 1, 0, 0.5764706, 1,
1.207559, -0.2388597, 1.065539, 1, 0, 0.5686275, 1,
1.214872, -1.259003, 3.154656, 1, 0, 0.5647059, 1,
1.2167, -1.171555, 2.833931, 1, 0, 0.5568628, 1,
1.217029, 1.676789, 0.5269641, 1, 0, 0.5529412, 1,
1.218716, 0.1801213, 0.9396957, 1, 0, 0.5450981, 1,
1.222138, 0.7867794, 2.357668, 1, 0, 0.5411765, 1,
1.238971, -0.4255809, 2.622485, 1, 0, 0.5333334, 1,
1.240002, 0.5702319, -0.2672024, 1, 0, 0.5294118, 1,
1.240347, -0.2779126, 1.06165, 1, 0, 0.5215687, 1,
1.256446, 0.9325352, 0.5999513, 1, 0, 0.5176471, 1,
1.264547, 0.06874978, 3.332358, 1, 0, 0.509804, 1,
1.266585, -1.485507, 1.356216, 1, 0, 0.5058824, 1,
1.288199, -1.703282, 3.040054, 1, 0, 0.4980392, 1,
1.298906, 1.547549, 0.2585513, 1, 0, 0.4901961, 1,
1.300126, 0.6879122, 0.1491247, 1, 0, 0.4862745, 1,
1.306155, -0.3679721, 1.38128, 1, 0, 0.4784314, 1,
1.316204, -2.391278, 3.493304, 1, 0, 0.4745098, 1,
1.321274, 0.2486215, 2.378431, 1, 0, 0.4666667, 1,
1.327578, 0.6150984, 0.3707997, 1, 0, 0.4627451, 1,
1.329403, 0.3542627, 2.844121, 1, 0, 0.454902, 1,
1.330893, -0.3632392, 2.855137, 1, 0, 0.4509804, 1,
1.333872, 0.5643476, 0.679109, 1, 0, 0.4431373, 1,
1.344549, 0.100679, 0.8753911, 1, 0, 0.4392157, 1,
1.349893, -0.4118924, 1.200807, 1, 0, 0.4313726, 1,
1.351224, -0.4702829, 1.51598, 1, 0, 0.427451, 1,
1.35655, 1.028578, 1.691106, 1, 0, 0.4196078, 1,
1.361824, 0.438624, 3.328829, 1, 0, 0.4156863, 1,
1.371737, 1.612409, 0.2005398, 1, 0, 0.4078431, 1,
1.374306, -0.5918171, 2.539438, 1, 0, 0.4039216, 1,
1.383738, 2.476103, 0.04229895, 1, 0, 0.3960784, 1,
1.400385, -0.5264077, 1.600272, 1, 0, 0.3882353, 1,
1.402325, -0.2871506, -0.2220206, 1, 0, 0.3843137, 1,
1.403109, -0.5036883, 1.42915, 1, 0, 0.3764706, 1,
1.403977, 0.6592589, -0.9222444, 1, 0, 0.372549, 1,
1.412991, -0.08855105, 1.622713, 1, 0, 0.3647059, 1,
1.417679, -0.840129, 1.25833, 1, 0, 0.3607843, 1,
1.430449, 0.1391204, 2.844078, 1, 0, 0.3529412, 1,
1.435122, 0.9787627, 0.8456075, 1, 0, 0.3490196, 1,
1.441854, 0.1528681, 0.829083, 1, 0, 0.3411765, 1,
1.452529, -0.864262, 2.851106, 1, 0, 0.3372549, 1,
1.476458, 0.450216, 0.4608145, 1, 0, 0.3294118, 1,
1.486019, 1.77758, -1.294769, 1, 0, 0.3254902, 1,
1.519807, 0.4118633, 1.451082, 1, 0, 0.3176471, 1,
1.54246, -0.9946901, 3.168653, 1, 0, 0.3137255, 1,
1.568223, 1.741579, 1.233811, 1, 0, 0.3058824, 1,
1.57089, 1.072805, 1.672945, 1, 0, 0.2980392, 1,
1.582412, -0.6175653, 3.563805, 1, 0, 0.2941177, 1,
1.598794, -0.1234508, 1.845765, 1, 0, 0.2862745, 1,
1.620406, 0.5465872, 2.020262, 1, 0, 0.282353, 1,
1.623631, -0.1113367, 0.4042705, 1, 0, 0.2745098, 1,
1.626469, 1.722228, 1.35924, 1, 0, 0.2705882, 1,
1.651362, 0.4766406, 1.171219, 1, 0, 0.2627451, 1,
1.653577, -0.5303988, 1.482372, 1, 0, 0.2588235, 1,
1.660586, -0.5248474, 0.6980075, 1, 0, 0.2509804, 1,
1.665714, 0.2836998, 0.4689127, 1, 0, 0.2470588, 1,
1.674925, 2.373186, 0.4067094, 1, 0, 0.2392157, 1,
1.693245, -0.00134747, 2.128954, 1, 0, 0.2352941, 1,
1.712515, 0.6524689, 1.105129, 1, 0, 0.227451, 1,
1.713159, 1.041474, 0.3695904, 1, 0, 0.2235294, 1,
1.720098, 0.4859005, 0.8957039, 1, 0, 0.2156863, 1,
1.728167, 0.2171453, 2.596474, 1, 0, 0.2117647, 1,
1.737959, 0.1059654, 1.337164, 1, 0, 0.2039216, 1,
1.821826, 0.2698447, 1.076893, 1, 0, 0.1960784, 1,
1.839268, 1.583002, 0.9914556, 1, 0, 0.1921569, 1,
1.849065, 0.005731222, 2.539785, 1, 0, 0.1843137, 1,
1.883186, -0.7294394, 2.017954, 1, 0, 0.1803922, 1,
1.90018, -0.7778888, 2.836602, 1, 0, 0.172549, 1,
1.907927, 1.757626, 0.06738529, 1, 0, 0.1686275, 1,
1.909952, 1.47721, 1.074189, 1, 0, 0.1607843, 1,
1.963596, 0.5770165, 2.893299, 1, 0, 0.1568628, 1,
2.0065, -0.7132049, 2.483188, 1, 0, 0.1490196, 1,
2.052465, -0.8497734, 2.985012, 1, 0, 0.145098, 1,
2.081858, -0.02767551, 0.5432863, 1, 0, 0.1372549, 1,
2.153164, 0.298634, -1.064804, 1, 0, 0.1333333, 1,
2.163198, -1.282121, 0.9357523, 1, 0, 0.1254902, 1,
2.222831, -1.20667, 1.413412, 1, 0, 0.1215686, 1,
2.24161, 2.808216, 0.8032501, 1, 0, 0.1137255, 1,
2.247098, -1.180654, 1.649711, 1, 0, 0.1098039, 1,
2.248362, -0.9113007, 2.958888, 1, 0, 0.1019608, 1,
2.255628, 2.207163, 2.707308, 1, 0, 0.09411765, 1,
2.268599, -0.8318163, 1.415529, 1, 0, 0.09019608, 1,
2.283372, 0.5080218, 2.53777, 1, 0, 0.08235294, 1,
2.335029, -0.4980494, -0.06280982, 1, 0, 0.07843138, 1,
2.337243, 0.1752383, 2.426376, 1, 0, 0.07058824, 1,
2.350356, 0.9132325, 1.68086, 1, 0, 0.06666667, 1,
2.35177, -0.614167, 1.593091, 1, 0, 0.05882353, 1,
2.393593, 1.636153, 1.360579, 1, 0, 0.05490196, 1,
2.427969, -1.153927, 0.4338725, 1, 0, 0.04705882, 1,
2.440383, -0.5799308, 1.552751, 1, 0, 0.04313726, 1,
2.54119, 0.8845055, 1.947567, 1, 0, 0.03529412, 1,
2.592034, -0.3820095, 2.473546, 1, 0, 0.03137255, 1,
2.597792, -0.8419873, 2.291887, 1, 0, 0.02352941, 1,
2.961774, 0.1120814, 1.550887, 1, 0, 0.01960784, 1,
2.982889, -1.207319, 1.156682, 1, 0, 0.01176471, 1,
3.268123, -1.406384, 2.207492, 1, 0, 0.007843138, 1
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
-0.1693978, -4.023258, -7.234449, 0, -0.5, 0.5, 0.5,
-0.1693978, -4.023258, -7.234449, 1, -0.5, 0.5, 0.5,
-0.1693978, -4.023258, -7.234449, 1, 1.5, 0.5, 0.5,
-0.1693978, -4.023258, -7.234449, 0, 1.5, 0.5, 0.5
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
-4.772238, 0.1747746, -7.234449, 0, -0.5, 0.5, 0.5,
-4.772238, 0.1747746, -7.234449, 1, -0.5, 0.5, 0.5,
-4.772238, 0.1747746, -7.234449, 1, 1.5, 0.5, 0.5,
-4.772238, 0.1747746, -7.234449, 0, 1.5, 0.5, 0.5
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
-4.772238, -4.023258, 0.008381128, 0, -0.5, 0.5, 0.5,
-4.772238, -4.023258, 0.008381128, 1, -0.5, 0.5, 0.5,
-4.772238, -4.023258, 0.008381128, 1, 1.5, 0.5, 0.5,
-4.772238, -4.023258, 0.008381128, 0, 1.5, 0.5, 0.5
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
-3, -3.054481, -5.563027,
3, -3.054481, -5.563027,
-3, -3.054481, -5.563027,
-3, -3.215944, -5.841598,
-2, -3.054481, -5.563027,
-2, -3.215944, -5.841598,
-1, -3.054481, -5.563027,
-1, -3.215944, -5.841598,
0, -3.054481, -5.563027,
0, -3.215944, -5.841598,
1, -3.054481, -5.563027,
1, -3.215944, -5.841598,
2, -3.054481, -5.563027,
2, -3.215944, -5.841598,
3, -3.054481, -5.563027,
3, -3.215944, -5.841598
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
-3, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
-3, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
-3, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
-3, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5,
-2, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
-2, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
-2, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
-2, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5,
-1, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
-1, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
-1, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
-1, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5,
0, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
0, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
0, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
0, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5,
1, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
1, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
1, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
1, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5,
2, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
2, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
2, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
2, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5,
3, -3.538869, -6.398738, 0, -0.5, 0.5, 0.5,
3, -3.538869, -6.398738, 1, -0.5, 0.5, 0.5,
3, -3.538869, -6.398738, 1, 1.5, 0.5, 0.5,
3, -3.538869, -6.398738, 0, 1.5, 0.5, 0.5
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
-3.710044, -2, -5.563027,
-3.710044, 3, -5.563027,
-3.710044, -2, -5.563027,
-3.887077, -2, -5.841598,
-3.710044, -1, -5.563027,
-3.887077, -1, -5.841598,
-3.710044, 0, -5.563027,
-3.887077, 0, -5.841598,
-3.710044, 1, -5.563027,
-3.887077, 1, -5.841598,
-3.710044, 2, -5.563027,
-3.887077, 2, -5.841598,
-3.710044, 3, -5.563027,
-3.887077, 3, -5.841598
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
-4.241141, -2, -6.398738, 0, -0.5, 0.5, 0.5,
-4.241141, -2, -6.398738, 1, -0.5, 0.5, 0.5,
-4.241141, -2, -6.398738, 1, 1.5, 0.5, 0.5,
-4.241141, -2, -6.398738, 0, 1.5, 0.5, 0.5,
-4.241141, -1, -6.398738, 0, -0.5, 0.5, 0.5,
-4.241141, -1, -6.398738, 1, -0.5, 0.5, 0.5,
-4.241141, -1, -6.398738, 1, 1.5, 0.5, 0.5,
-4.241141, -1, -6.398738, 0, 1.5, 0.5, 0.5,
-4.241141, 0, -6.398738, 0, -0.5, 0.5, 0.5,
-4.241141, 0, -6.398738, 1, -0.5, 0.5, 0.5,
-4.241141, 0, -6.398738, 1, 1.5, 0.5, 0.5,
-4.241141, 0, -6.398738, 0, 1.5, 0.5, 0.5,
-4.241141, 1, -6.398738, 0, -0.5, 0.5, 0.5,
-4.241141, 1, -6.398738, 1, -0.5, 0.5, 0.5,
-4.241141, 1, -6.398738, 1, 1.5, 0.5, 0.5,
-4.241141, 1, -6.398738, 0, 1.5, 0.5, 0.5,
-4.241141, 2, -6.398738, 0, -0.5, 0.5, 0.5,
-4.241141, 2, -6.398738, 1, -0.5, 0.5, 0.5,
-4.241141, 2, -6.398738, 1, 1.5, 0.5, 0.5,
-4.241141, 2, -6.398738, 0, 1.5, 0.5, 0.5,
-4.241141, 3, -6.398738, 0, -0.5, 0.5, 0.5,
-4.241141, 3, -6.398738, 1, -0.5, 0.5, 0.5,
-4.241141, 3, -6.398738, 1, 1.5, 0.5, 0.5,
-4.241141, 3, -6.398738, 0, 1.5, 0.5, 0.5
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
-3.710044, -3.054481, -4,
-3.710044, -3.054481, 4,
-3.710044, -3.054481, -4,
-3.887077, -3.215944, -4,
-3.710044, -3.054481, -2,
-3.887077, -3.215944, -2,
-3.710044, -3.054481, 0,
-3.887077, -3.215944, 0,
-3.710044, -3.054481, 2,
-3.887077, -3.215944, 2,
-3.710044, -3.054481, 4,
-3.887077, -3.215944, 4
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
-4.241141, -3.538869, -4, 0, -0.5, 0.5, 0.5,
-4.241141, -3.538869, -4, 1, -0.5, 0.5, 0.5,
-4.241141, -3.538869, -4, 1, 1.5, 0.5, 0.5,
-4.241141, -3.538869, -4, 0, 1.5, 0.5, 0.5,
-4.241141, -3.538869, -2, 0, -0.5, 0.5, 0.5,
-4.241141, -3.538869, -2, 1, -0.5, 0.5, 0.5,
-4.241141, -3.538869, -2, 1, 1.5, 0.5, 0.5,
-4.241141, -3.538869, -2, 0, 1.5, 0.5, 0.5,
-4.241141, -3.538869, 0, 0, -0.5, 0.5, 0.5,
-4.241141, -3.538869, 0, 1, -0.5, 0.5, 0.5,
-4.241141, -3.538869, 0, 1, 1.5, 0.5, 0.5,
-4.241141, -3.538869, 0, 0, 1.5, 0.5, 0.5,
-4.241141, -3.538869, 2, 0, -0.5, 0.5, 0.5,
-4.241141, -3.538869, 2, 1, -0.5, 0.5, 0.5,
-4.241141, -3.538869, 2, 1, 1.5, 0.5, 0.5,
-4.241141, -3.538869, 2, 0, 1.5, 0.5, 0.5,
-4.241141, -3.538869, 4, 0, -0.5, 0.5, 0.5,
-4.241141, -3.538869, 4, 1, -0.5, 0.5, 0.5,
-4.241141, -3.538869, 4, 1, 1.5, 0.5, 0.5,
-4.241141, -3.538869, 4, 0, 1.5, 0.5, 0.5
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
-3.710044, -3.054481, -5.563027,
-3.710044, 3.40403, -5.563027,
-3.710044, -3.054481, 5.579789,
-3.710044, 3.40403, 5.579789,
-3.710044, -3.054481, -5.563027,
-3.710044, -3.054481, 5.579789,
-3.710044, 3.40403, -5.563027,
-3.710044, 3.40403, 5.579789,
-3.710044, -3.054481, -5.563027,
3.371249, -3.054481, -5.563027,
-3.710044, -3.054481, 5.579789,
3.371249, -3.054481, 5.579789,
-3.710044, 3.40403, -5.563027,
3.371249, 3.40403, -5.563027,
-3.710044, 3.40403, 5.579789,
3.371249, 3.40403, 5.579789,
3.371249, -3.054481, -5.563027,
3.371249, 3.40403, -5.563027,
3.371249, -3.054481, 5.579789,
3.371249, 3.40403, 5.579789,
3.371249, -3.054481, -5.563027,
3.371249, -3.054481, 5.579789,
3.371249, 3.40403, -5.563027,
3.371249, 3.40403, 5.579789
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
var radius = 7.848233;
var distance = 34.91768;
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
mvMatrix.translate( 0.1693978, -0.1747746, -0.008381128 );
mvMatrix.scale( 1.198321, 1.313873, 0.7615367 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91768);
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
hydroxyhippuric_acid<-read.table("hydroxyhippuric_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hydroxyhippuric_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
```

```r
y<-hydroxyhippuric_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
```

```r
z<-hydroxyhippuric_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
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
-3.606919, -1.701483, -3.04658, 0, 0, 1, 1, 1,
-3.172923, 0.869215, -0.4930527, 1, 0, 0, 1, 1,
-2.845782, 1.703321, 0.3098519, 1, 0, 0, 1, 1,
-2.754608, 0.7964382, -1.394294, 1, 0, 0, 1, 1,
-2.554789, 0.4279447, 0.3650095, 1, 0, 0, 1, 1,
-2.502078, 0.9898151, -2.619518, 1, 0, 0, 1, 1,
-2.429833, 0.4958497, -1.126454, 0, 0, 0, 1, 1,
-2.416186, 0.6858734, -0.6455151, 0, 0, 0, 1, 1,
-2.333512, 0.1416013, -2.285809, 0, 0, 0, 1, 1,
-2.299156, -0.6186764, -2.550612, 0, 0, 0, 1, 1,
-2.270031, 0.4056554, -0.3448919, 0, 0, 0, 1, 1,
-2.246976, -0.133838, -1.554229, 0, 0, 0, 1, 1,
-2.212646, 1.095842, -1.565314, 0, 0, 0, 1, 1,
-2.202802, 1.055154, 0.2978448, 1, 1, 1, 1, 1,
-2.164116, -0.4507569, -2.901698, 1, 1, 1, 1, 1,
-2.162726, 0.8043884, 1.052958, 1, 1, 1, 1, 1,
-2.12527, 0.1327179, -2.746862, 1, 1, 1, 1, 1,
-2.099789, 1.109115, -2.188886, 1, 1, 1, 1, 1,
-2.068614, -0.5747733, -1.324117, 1, 1, 1, 1, 1,
-2.063198, -0.245078, -1.65281, 1, 1, 1, 1, 1,
-2.060442, 0.2938755, -1.741366, 1, 1, 1, 1, 1,
-2.054237, 0.5011466, -1.460012, 1, 1, 1, 1, 1,
-2.044471, -0.7194455, -1.48453, 1, 1, 1, 1, 1,
-2.012803, 0.1477023, -1.866022, 1, 1, 1, 1, 1,
-1.989063, -0.3091323, -2.224376, 1, 1, 1, 1, 1,
-1.981737, 0.2675386, -1.682088, 1, 1, 1, 1, 1,
-1.979355, -0.5234281, -1.591642, 1, 1, 1, 1, 1,
-1.979169, 0.6407285, 0.02413744, 1, 1, 1, 1, 1,
-1.943595, 0.4983799, -1.724102, 0, 0, 1, 1, 1,
-1.905828, 1.153059, 0.4327841, 1, 0, 0, 1, 1,
-1.883435, -0.5287238, -3.830609, 1, 0, 0, 1, 1,
-1.86965, 0.4239498, -1.807959, 1, 0, 0, 1, 1,
-1.853824, -0.2699764, 0.3022885, 1, 0, 0, 1, 1,
-1.85316, 1.335663, 0.3608693, 1, 0, 0, 1, 1,
-1.847206, -1.791109, -2.680676, 0, 0, 0, 1, 1,
-1.843821, 0.1293074, -0.6117241, 0, 0, 0, 1, 1,
-1.842613, -2.224468, -3.183567, 0, 0, 0, 1, 1,
-1.836663, 0.847075, -2.842688, 0, 0, 0, 1, 1,
-1.827059, -1.107494, -2.288526, 0, 0, 0, 1, 1,
-1.816643, 0.9248548, -0.4310636, 0, 0, 0, 1, 1,
-1.815622, -0.7571261, -2.443701, 0, 0, 0, 1, 1,
-1.815619, -1.717315, -3.126546, 1, 1, 1, 1, 1,
-1.812834, -0.2321565, -2.682843, 1, 1, 1, 1, 1,
-1.80281, 1.532116, -0.8662627, 1, 1, 1, 1, 1,
-1.798176, -1.410209, -3.011799, 1, 1, 1, 1, 1,
-1.782551, 0.08923064, -2.131145, 1, 1, 1, 1, 1,
-1.779704, 1.421046, -0.9921989, 1, 1, 1, 1, 1,
-1.777311, -0.2414655, -2.923884, 1, 1, 1, 1, 1,
-1.766927, -1.999191, -1.555357, 1, 1, 1, 1, 1,
-1.766441, -0.02214738, -2.329776, 1, 1, 1, 1, 1,
-1.747733, 0.7251719, -0.7126402, 1, 1, 1, 1, 1,
-1.746092, 1.282065, -1.581582, 1, 1, 1, 1, 1,
-1.721808, 0.08625484, -2.079896, 1, 1, 1, 1, 1,
-1.721556, 0.9251641, -1.748997, 1, 1, 1, 1, 1,
-1.703941, -0.5802241, -0.9432985, 1, 1, 1, 1, 1,
-1.680385, -0.1195229, -0.1195258, 1, 1, 1, 1, 1,
-1.679127, -1.379426, -4.310774, 0, 0, 1, 1, 1,
-1.677106, 1.07462, -0.9427629, 1, 0, 0, 1, 1,
-1.668318, 1.311249, -0.7670736, 1, 0, 0, 1, 1,
-1.659373, -0.1524313, -2.574136, 1, 0, 0, 1, 1,
-1.645237, -0.6557685, -1.86287, 1, 0, 0, 1, 1,
-1.634291, -0.02810671, -1.53477, 1, 0, 0, 1, 1,
-1.612058, 1.274536, 0.2737412, 0, 0, 0, 1, 1,
-1.594343, -0.600153, -2.121356, 0, 0, 0, 1, 1,
-1.591769, -0.05164807, -2.700866, 0, 0, 0, 1, 1,
-1.591046, -0.8480172, -2.630112, 0, 0, 0, 1, 1,
-1.57622, 0.1411679, -2.073776, 0, 0, 0, 1, 1,
-1.575517, 0.6799472, -2.526226, 0, 0, 0, 1, 1,
-1.567356, -1.089275, -0.9161539, 0, 0, 0, 1, 1,
-1.559808, 0.09702004, 0.4930416, 1, 1, 1, 1, 1,
-1.557016, 0.2270368, -1.686691, 1, 1, 1, 1, 1,
-1.550335, -0.2846985, -4.111639, 1, 1, 1, 1, 1,
-1.540459, -1.325518, -2.374793, 1, 1, 1, 1, 1,
-1.535172, -1.108881, -4.15367, 1, 1, 1, 1, 1,
-1.517836, 0.7534827, -2.079075, 1, 1, 1, 1, 1,
-1.505782, -1.856125, -4.040311, 1, 1, 1, 1, 1,
-1.503161, 0.9707108, -0.3288736, 1, 1, 1, 1, 1,
-1.495306, -0.2170662, -1.074636, 1, 1, 1, 1, 1,
-1.490286, -0.4278796, -1.491927, 1, 1, 1, 1, 1,
-1.489179, -0.2963817, -2.688348, 1, 1, 1, 1, 1,
-1.487623, -1.284081, -3.356421, 1, 1, 1, 1, 1,
-1.460651, 2.607248, -1.310801, 1, 1, 1, 1, 1,
-1.458435, -0.365254, -1.266294, 1, 1, 1, 1, 1,
-1.454099, -2.689613, -3.316793, 1, 1, 1, 1, 1,
-1.451641, 1.868206, 0.9575804, 0, 0, 1, 1, 1,
-1.435563, 0.07218678, -0.5788287, 1, 0, 0, 1, 1,
-1.380728, 0.06557909, -1.659666, 1, 0, 0, 1, 1,
-1.376412, -0.04905358, -2.898865, 1, 0, 0, 1, 1,
-1.368514, 0.3733695, -0.6914752, 1, 0, 0, 1, 1,
-1.356881, 0.679412, -1.010919, 1, 0, 0, 1, 1,
-1.356752, -1.022628, -2.673789, 0, 0, 0, 1, 1,
-1.350799, -0.535938, -2.941025, 0, 0, 0, 1, 1,
-1.341696, -0.2979205, -2.28895, 0, 0, 0, 1, 1,
-1.339115, -0.9504973, -4.700471, 0, 0, 0, 1, 1,
-1.329353, -1.138361, -3.651247, 0, 0, 0, 1, 1,
-1.327256, 1.911016, 0.2055372, 0, 0, 0, 1, 1,
-1.323738, 0.7491561, -0.5263402, 0, 0, 0, 1, 1,
-1.308627, 0.2438047, -0.8024828, 1, 1, 1, 1, 1,
-1.307895, 0.7545658, -2.504284, 1, 1, 1, 1, 1,
-1.304029, -0.2696628, -1.070976, 1, 1, 1, 1, 1,
-1.298359, -0.4255442, -3.144688, 1, 1, 1, 1, 1,
-1.288191, 1.930332, -0.2549865, 1, 1, 1, 1, 1,
-1.283977, -0.8245252, -2.518557, 1, 1, 1, 1, 1,
-1.281036, 0.4366619, -1.279977, 1, 1, 1, 1, 1,
-1.276451, 0.4401333, -0.8708616, 1, 1, 1, 1, 1,
-1.274642, 0.7279027, -1.339323, 1, 1, 1, 1, 1,
-1.272763, 0.5025595, -2.029716, 1, 1, 1, 1, 1,
-1.268998, -0.7821674, 0.3274756, 1, 1, 1, 1, 1,
-1.267648, 0.5937849, -2.120716, 1, 1, 1, 1, 1,
-1.262809, -0.4953343, -2.031774, 1, 1, 1, 1, 1,
-1.234715, 1.442926, -1.036892, 1, 1, 1, 1, 1,
-1.233034, -0.1171616, -1.544207, 1, 1, 1, 1, 1,
-1.227847, -0.1789137, -2.465005, 0, 0, 1, 1, 1,
-1.225354, 0.2368097, -2.543883, 1, 0, 0, 1, 1,
-1.225037, -0.127761, -0.7103445, 1, 0, 0, 1, 1,
-1.215534, 0.4025723, -2.397244, 1, 0, 0, 1, 1,
-1.213366, -1.069258, -3.492791, 1, 0, 0, 1, 1,
-1.210568, 1.002082, -2.172884, 1, 0, 0, 1, 1,
-1.208977, 0.130588, -0.1172471, 0, 0, 0, 1, 1,
-1.20235, -0.1151313, -1.308827, 0, 0, 0, 1, 1,
-1.199558, 0.4011244, -0.7578817, 0, 0, 0, 1, 1,
-1.190921, 0.4808075, 0.009543173, 0, 0, 0, 1, 1,
-1.178423, 0.5571616, -3.015181, 0, 0, 0, 1, 1,
-1.177453, 0.5463012, -1.730188, 0, 0, 0, 1, 1,
-1.171762, -0.6312535, -1.901704, 0, 0, 0, 1, 1,
-1.168022, -0.3598446, -2.555358, 1, 1, 1, 1, 1,
-1.16581, 1.536622, -0.583037, 1, 1, 1, 1, 1,
-1.160038, -0.184481, -1.976952, 1, 1, 1, 1, 1,
-1.149303, 0.8893599, -0.3581215, 1, 1, 1, 1, 1,
-1.14129, -2.338789, -3.980616, 1, 1, 1, 1, 1,
-1.139044, 0.2284291, -1.587127, 1, 1, 1, 1, 1,
-1.138095, 1.180352, -0.1150351, 1, 1, 1, 1, 1,
-1.136894, -1.03669, -3.64273, 1, 1, 1, 1, 1,
-1.134105, 0.4316731, -2.187624, 1, 1, 1, 1, 1,
-1.132968, 1.476748, -0.68229, 1, 1, 1, 1, 1,
-1.128307, 0.08997405, -3.839761, 1, 1, 1, 1, 1,
-1.125155, -0.8446632, -0.6969031, 1, 1, 1, 1, 1,
-1.12495, 1.630593, -1.225546, 1, 1, 1, 1, 1,
-1.114616, 1.25891, -0.4938839, 1, 1, 1, 1, 1,
-1.10562, 1.92142, -0.3499777, 1, 1, 1, 1, 1,
-1.101545, -2.145938, -2.526912, 0, 0, 1, 1, 1,
-1.098892, 0.02754742, -0.5998692, 1, 0, 0, 1, 1,
-1.098402, 1.418342, -0.8838454, 1, 0, 0, 1, 1,
-1.096312, 0.5585213, -0.6363194, 1, 0, 0, 1, 1,
-1.095189, -0.4039161, -1.365919, 1, 0, 0, 1, 1,
-1.092827, -0.1318331, -0.5990594, 1, 0, 0, 1, 1,
-1.092551, 0.05889634, -2.39658, 0, 0, 0, 1, 1,
-1.091831, 0.4641429, 1.209589, 0, 0, 0, 1, 1,
-1.08599, 0.5735723, 0.2745542, 0, 0, 0, 1, 1,
-1.084722, -0.2834574, -2.268955, 0, 0, 0, 1, 1,
-1.081643, -0.3926649, -1.875565, 0, 0, 0, 1, 1,
-1.076876, 0.9827256, -0.9191937, 0, 0, 0, 1, 1,
-1.069543, -1.179701, -0.963242, 0, 0, 0, 1, 1,
-1.062335, 0.6185271, -1.876158, 1, 1, 1, 1, 1,
-1.056885, -0.1222662, -1.611774, 1, 1, 1, 1, 1,
-1.053343, -0.7858014, -3.839666, 1, 1, 1, 1, 1,
-1.052452, -1.981444, -1.036176, 1, 1, 1, 1, 1,
-1.050213, -0.2973484, -1.796062, 1, 1, 1, 1, 1,
-1.045789, 1.781675, 0.002435957, 1, 1, 1, 1, 1,
-1.040369, -0.5828383, -0.8753631, 1, 1, 1, 1, 1,
-1.035311, 0.06710538, -2.695518, 1, 1, 1, 1, 1,
-1.033333, 2.560253, 0.9795013, 1, 1, 1, 1, 1,
-1.030804, 0.617254, 1.338931, 1, 1, 1, 1, 1,
-1.026233, -0.2059884, 0.3281009, 1, 1, 1, 1, 1,
-1.026106, 0.9529809, 1.139437, 1, 1, 1, 1, 1,
-1.017729, 2.421119, 0.4106605, 1, 1, 1, 1, 1,
-1.016912, 0.1152651, -1.54619, 1, 1, 1, 1, 1,
-1.007683, 3.000745, 0.7650638, 1, 1, 1, 1, 1,
-1.007254, 1.192132, -0.002704651, 0, 0, 1, 1, 1,
-1.006911, 0.1839926, -2.928043, 1, 0, 0, 1, 1,
-1.004972, 0.237456, -2.025593, 1, 0, 0, 1, 1,
-1.003567, 0.3665917, -2.145395, 1, 0, 0, 1, 1,
-1.002863, -1.070158, -2.349847, 1, 0, 0, 1, 1,
-1.001958, -0.5661227, -3.465248, 1, 0, 0, 1, 1,
-0.9860562, 0.2863355, -0.3007926, 0, 0, 0, 1, 1,
-0.9853139, -1.819299, -0.8255002, 0, 0, 0, 1, 1,
-0.979907, 2.28163, 0.6231073, 0, 0, 0, 1, 1,
-0.9794628, -1.796619, -2.995887, 0, 0, 0, 1, 1,
-0.9728352, 0.9349101, -0.8635294, 0, 0, 0, 1, 1,
-0.9690742, 0.4028662, -1.995599, 0, 0, 0, 1, 1,
-0.9681371, 0.06457904, -1.767114, 0, 0, 0, 1, 1,
-0.9670187, -0.1642707, -1.869154, 1, 1, 1, 1, 1,
-0.9665208, 0.7079174, -2.129232, 1, 1, 1, 1, 1,
-0.9639213, -0.2301721, -2.880813, 1, 1, 1, 1, 1,
-0.9588835, -0.1086502, -2.433494, 1, 1, 1, 1, 1,
-0.9563267, -0.318373, -2.873766, 1, 1, 1, 1, 1,
-0.9539364, -0.3889108, -2.317519, 1, 1, 1, 1, 1,
-0.9390466, 0.1619128, -2.984017, 1, 1, 1, 1, 1,
-0.9359939, -0.8829367, -2.133748, 1, 1, 1, 1, 1,
-0.9342843, 0.2537822, -0.178549, 1, 1, 1, 1, 1,
-0.9324792, 0.3229721, -1.939803, 1, 1, 1, 1, 1,
-0.9316913, 0.993212, -0.3798893, 1, 1, 1, 1, 1,
-0.9311286, -0.7017947, -2.338214, 1, 1, 1, 1, 1,
-0.9276233, 0.9447168, -0.3508311, 1, 1, 1, 1, 1,
-0.9266461, 0.618921, 0.8144619, 1, 1, 1, 1, 1,
-0.9175958, -0.350506, -2.174149, 1, 1, 1, 1, 1,
-0.916831, -0.1324623, -1.951194, 0, 0, 1, 1, 1,
-0.916231, 0.1535736, -1.415214, 1, 0, 0, 1, 1,
-0.9108087, 0.5095924, -1.835732, 1, 0, 0, 1, 1,
-0.8991913, -0.9147412, -2.099117, 1, 0, 0, 1, 1,
-0.8954145, -0.7342174, -2.333775, 1, 0, 0, 1, 1,
-0.8946431, 0.4163908, -1.526448, 1, 0, 0, 1, 1,
-0.8938737, -0.123017, -0.9593402, 0, 0, 0, 1, 1,
-0.8768021, 1.255311, -0.8458606, 0, 0, 0, 1, 1,
-0.8743215, -0.7654284, -1.890237, 0, 0, 0, 1, 1,
-0.8581097, -0.3795933, -0.2135003, 0, 0, 0, 1, 1,
-0.8526931, 0.2407332, -0.07996032, 0, 0, 0, 1, 1,
-0.8513039, -0.2481825, -1.256563, 0, 0, 0, 1, 1,
-0.8494669, -0.9618222, -2.627147, 0, 0, 0, 1, 1,
-0.848718, -0.7447076, -2.393798, 1, 1, 1, 1, 1,
-0.8456242, -0.9064159, -0.6962503, 1, 1, 1, 1, 1,
-0.8445636, 0.8155936, -0.5333222, 1, 1, 1, 1, 1,
-0.8406153, -0.0108364, -2.981205, 1, 1, 1, 1, 1,
-0.8404798, 0.4020711, -1.315041, 1, 1, 1, 1, 1,
-0.8402429, -1.227841, -2.075443, 1, 1, 1, 1, 1,
-0.8357775, 0.8488827, -0.9573141, 1, 1, 1, 1, 1,
-0.8323061, -1.875741, -3.12106, 1, 1, 1, 1, 1,
-0.8257031, -0.1992833, -2.665236, 1, 1, 1, 1, 1,
-0.8255771, 0.03801927, -2.393566, 1, 1, 1, 1, 1,
-0.8204939, -0.6511246, -1.456022, 1, 1, 1, 1, 1,
-0.8194361, -1.979164, -3.525244, 1, 1, 1, 1, 1,
-0.8130698, -0.8619953, -2.674117, 1, 1, 1, 1, 1,
-0.8117302, 1.210929, 0.3190247, 1, 1, 1, 1, 1,
-0.811726, -0.2580158, -2.075929, 1, 1, 1, 1, 1,
-0.8107569, 0.3625828, -2.462422, 0, 0, 1, 1, 1,
-0.803445, 0.009965721, -2.021889, 1, 0, 0, 1, 1,
-0.7960922, 1.29575, 0.02494452, 1, 0, 0, 1, 1,
-0.7954345, -0.605666, -3.166177, 1, 0, 0, 1, 1,
-0.7943458, 1.609068, 1.76476, 1, 0, 0, 1, 1,
-0.7942312, -0.8531088, -1.013034, 1, 0, 0, 1, 1,
-0.7915992, 1.072188, -0.326889, 0, 0, 0, 1, 1,
-0.7910561, -0.008434792, -1.11453, 0, 0, 0, 1, 1,
-0.7865201, 1.418505, -1.104018, 0, 0, 0, 1, 1,
-0.7864463, 0.7509909, -0.1455599, 0, 0, 0, 1, 1,
-0.7852162, -0.2916484, -3.474777, 0, 0, 0, 1, 1,
-0.7831045, -0.0541381, -2.733479, 0, 0, 0, 1, 1,
-0.7801608, -0.8312178, -2.145924, 0, 0, 0, 1, 1,
-0.7796154, 0.1717523, -0.9374011, 1, 1, 1, 1, 1,
-0.776993, -0.1986536, -2.342168, 1, 1, 1, 1, 1,
-0.7729895, 1.546197, -0.5360963, 1, 1, 1, 1, 1,
-0.7715288, 0.1593191, -2.297297, 1, 1, 1, 1, 1,
-0.7698053, -1.192861, -3.738869, 1, 1, 1, 1, 1,
-0.7691168, -1.270988, -2.358864, 1, 1, 1, 1, 1,
-0.7585536, -0.9863659, -2.450751, 1, 1, 1, 1, 1,
-0.7559687, 0.3073165, -0.2107554, 1, 1, 1, 1, 1,
-0.7539957, 0.008478493, -1.388577, 1, 1, 1, 1, 1,
-0.7445489, -0.3302687, -1.712877, 1, 1, 1, 1, 1,
-0.739226, -1.61681, -2.989297, 1, 1, 1, 1, 1,
-0.7390192, -0.4155993, -2.920677, 1, 1, 1, 1, 1,
-0.7379407, -0.8044121, -2.946597, 1, 1, 1, 1, 1,
-0.7374547, -0.1532313, -0.1478438, 1, 1, 1, 1, 1,
-0.7363483, -0.7419146, -4.313076, 1, 1, 1, 1, 1,
-0.7357333, 0.5021433, -1.213687, 0, 0, 1, 1, 1,
-0.7272601, -1.304512, -2.827433, 1, 0, 0, 1, 1,
-0.7210201, -0.3969415, -3.130934, 1, 0, 0, 1, 1,
-0.717941, 0.043066, -1.030058, 1, 0, 0, 1, 1,
-0.7136573, 0.7455432, 1.085448, 1, 0, 0, 1, 1,
-0.7112119, -0.7101085, -1.756336, 1, 0, 0, 1, 1,
-0.7041848, 0.3715384, -0.5384123, 0, 0, 0, 1, 1,
-0.7009267, 0.2833622, -0.9483241, 0, 0, 0, 1, 1,
-0.6923126, -0.4476173, -2.115719, 0, 0, 0, 1, 1,
-0.6920702, 1.706423, -0.02278958, 0, 0, 0, 1, 1,
-0.6920305, 1.982212, 0.458162, 0, 0, 0, 1, 1,
-0.691484, 1.169555, -0.3685637, 0, 0, 0, 1, 1,
-0.6879543, 1.795386, -1.564651, 0, 0, 0, 1, 1,
-0.6878185, 0.2166789, -1.128333, 1, 1, 1, 1, 1,
-0.6850267, -0.6859915, -2.648807, 1, 1, 1, 1, 1,
-0.683387, 1.35414, -1.802634, 1, 1, 1, 1, 1,
-0.6752384, -0.8671941, -3.14806, 1, 1, 1, 1, 1,
-0.6703902, 1.11727, -1.363533, 1, 1, 1, 1, 1,
-0.6702152, 0.2287836, -3.253443, 1, 1, 1, 1, 1,
-0.6593337, -1.540356, -5.114022, 1, 1, 1, 1, 1,
-0.6497989, 0.8414903, -0.005049432, 1, 1, 1, 1, 1,
-0.6457065, 0.04352329, -1.73323, 1, 1, 1, 1, 1,
-0.6434283, -0.3768949, -3.361367, 1, 1, 1, 1, 1,
-0.6414633, 0.6961706, -1.951263, 1, 1, 1, 1, 1,
-0.6359909, -0.9509207, -3.449465, 1, 1, 1, 1, 1,
-0.6338096, -2.57543, -2.845043, 1, 1, 1, 1, 1,
-0.6311795, 3.309974, -0.6527807, 1, 1, 1, 1, 1,
-0.6294367, -0.6487104, -2.726725, 1, 1, 1, 1, 1,
-0.6288792, 0.2950309, -0.8640235, 0, 0, 1, 1, 1,
-0.6238127, -0.3610535, -3.20337, 1, 0, 0, 1, 1,
-0.6229538, -0.6870018, -1.655754, 1, 0, 0, 1, 1,
-0.6187972, 0.8028581, 1.53513, 1, 0, 0, 1, 1,
-0.6162418, 0.4961299, 0.4475608, 1, 0, 0, 1, 1,
-0.6145465, -0.5347279, -1.057985, 1, 0, 0, 1, 1,
-0.6086503, -0.2779531, -1.963079, 0, 0, 0, 1, 1,
-0.6075581, -1.379476, -2.523005, 0, 0, 0, 1, 1,
-0.6042559, 0.5448658, -1.955515, 0, 0, 0, 1, 1,
-0.6036313, -0.5394156, -2.328424, 0, 0, 0, 1, 1,
-0.6021526, 1.435391, 1.357908, 0, 0, 0, 1, 1,
-0.6011481, -0.4719003, -2.042796, 0, 0, 0, 1, 1,
-0.5969916, 2.385566, -0.2099438, 0, 0, 0, 1, 1,
-0.5944958, 1.351098, 0.6824151, 1, 1, 1, 1, 1,
-0.5940951, 0.5426971, 0.8991824, 1, 1, 1, 1, 1,
-0.590065, -0.3905203, -2.20655, 1, 1, 1, 1, 1,
-0.5869511, 0.1810267, -2.073674, 1, 1, 1, 1, 1,
-0.5854855, -1.285751, -3.122494, 1, 1, 1, 1, 1,
-0.5847086, 0.4984928, 0.5964978, 1, 1, 1, 1, 1,
-0.5797043, 0.7101786, -1.628279, 1, 1, 1, 1, 1,
-0.5796378, 0.66803, -0.8826239, 1, 1, 1, 1, 1,
-0.5763604, 0.1433586, -2.072997, 1, 1, 1, 1, 1,
-0.5757828, -0.2660347, -3.126547, 1, 1, 1, 1, 1,
-0.5752409, -1.722092, -3.246777, 1, 1, 1, 1, 1,
-0.5720544, -0.3737177, -2.219786, 1, 1, 1, 1, 1,
-0.5716511, -2.17651, -3.937823, 1, 1, 1, 1, 1,
-0.5669129, -1.034951, -2.081048, 1, 1, 1, 1, 1,
-0.5652189, 0.952816, -0.9233673, 1, 1, 1, 1, 1,
-0.5644096, 1.419626, -2.395083, 0, 0, 1, 1, 1,
-0.5588733, 0.245842, -0.9677613, 1, 0, 0, 1, 1,
-0.5581824, -2.223957, -3.759021, 1, 0, 0, 1, 1,
-0.5570844, -0.1984285, -3.132638, 1, 0, 0, 1, 1,
-0.5549954, -0.6518986, -3.300455, 1, 0, 0, 1, 1,
-0.5538241, -0.05605943, -1.715821, 1, 0, 0, 1, 1,
-0.5523291, -0.4406788, -2.261781, 0, 0, 0, 1, 1,
-0.5504919, 0.3269738, -0.9326676, 0, 0, 0, 1, 1,
-0.5461695, -0.6978872, -2.969549, 0, 0, 0, 1, 1,
-0.5453666, 0.1107256, -3.075342, 0, 0, 0, 1, 1,
-0.5429123, 0.5192786, 0.8914154, 0, 0, 0, 1, 1,
-0.5379604, 0.2018245, -1.856967, 0, 0, 0, 1, 1,
-0.5372503, -0.5678268, -3.821951, 0, 0, 0, 1, 1,
-0.5366775, -0.5836516, -2.560004, 1, 1, 1, 1, 1,
-0.5328324, 0.7460408, -2.234719, 1, 1, 1, 1, 1,
-0.5261158, 0.1764658, -0.1525036, 1, 1, 1, 1, 1,
-0.5259575, 0.932537, -2.367194, 1, 1, 1, 1, 1,
-0.5206255, 2.432073, -2.50885, 1, 1, 1, 1, 1,
-0.5129691, -0.1830485, -0.3935396, 1, 1, 1, 1, 1,
-0.5127141, -1.107915, -1.358857, 1, 1, 1, 1, 1,
-0.5123964, 0.07665139, -2.050277, 1, 1, 1, 1, 1,
-0.509986, 1.042944, -0.7810262, 1, 1, 1, 1, 1,
-0.5047429, -0.2611354, -2.651642, 1, 1, 1, 1, 1,
-0.5036117, 0.1369592, -1.155637, 1, 1, 1, 1, 1,
-0.4966702, 1.204318, -2.131001, 1, 1, 1, 1, 1,
-0.4957446, -0.02687342, -1.549705, 1, 1, 1, 1, 1,
-0.4930251, 0.8427982, -0.2815586, 1, 1, 1, 1, 1,
-0.4891815, -1.456651, -3.314479, 1, 1, 1, 1, 1,
-0.486928, 0.3445869, 0.399763, 0, 0, 1, 1, 1,
-0.4850769, 0.9322902, -2.082515, 1, 0, 0, 1, 1,
-0.4833696, -1.507134, -2.909314, 1, 0, 0, 1, 1,
-0.4830945, -0.9830353, -2.112115, 1, 0, 0, 1, 1,
-0.4821558, 1.997846, -1.751496, 1, 0, 0, 1, 1,
-0.4813071, 1.173031, -1.410579, 1, 0, 0, 1, 1,
-0.477748, -0.6855314, -1.269734, 0, 0, 0, 1, 1,
-0.4773293, 0.1265887, -1.22126, 0, 0, 0, 1, 1,
-0.4746253, -1.880706, -2.205967, 0, 0, 0, 1, 1,
-0.4697829, 0.2003935, -1.73946, 0, 0, 0, 1, 1,
-0.4697214, 0.2791477, 0.1948964, 0, 0, 0, 1, 1,
-0.4680776, 0.9842713, 0.229697, 0, 0, 0, 1, 1,
-0.4666222, 0.2390069, 0.5906219, 0, 0, 0, 1, 1,
-0.4657016, -1.426426, -3.45857, 1, 1, 1, 1, 1,
-0.465034, -1.049846, -1.85993, 1, 1, 1, 1, 1,
-0.4546998, 0.0262997, -1.976665, 1, 1, 1, 1, 1,
-0.4499921, -0.9376622, -3.190686, 1, 1, 1, 1, 1,
-0.4493344, 0.9664758, -0.7965356, 1, 1, 1, 1, 1,
-0.4488366, 0.6409535, -1.308718, 1, 1, 1, 1, 1,
-0.447477, -0.7139595, -2.85485, 1, 1, 1, 1, 1,
-0.4432974, 0.2891733, -2.168496, 1, 1, 1, 1, 1,
-0.4386131, -0.4543962, -1.729767, 1, 1, 1, 1, 1,
-0.437825, 0.2439356, -0.2761332, 1, 1, 1, 1, 1,
-0.4344925, 0.7785012, -0.6101983, 1, 1, 1, 1, 1,
-0.4340552, -0.88993, -1.341512, 1, 1, 1, 1, 1,
-0.4271404, -0.5012937, -1.272377, 1, 1, 1, 1, 1,
-0.4265539, -0.8292647, -1.729939, 1, 1, 1, 1, 1,
-0.4215564, 1.462831, 0.5585732, 1, 1, 1, 1, 1,
-0.4209702, 0.7096109, -0.3719389, 0, 0, 1, 1, 1,
-0.4168328, -1.026687, -2.490608, 1, 0, 0, 1, 1,
-0.4167597, -1.734051, -2.360556, 1, 0, 0, 1, 1,
-0.4136919, -0.2586144, -1.993579, 1, 0, 0, 1, 1,
-0.4080979, -0.04902422, -4.11228, 1, 0, 0, 1, 1,
-0.4061819, 0.3522002, -1.021046, 1, 0, 0, 1, 1,
-0.4051883, -0.5920147, -3.502215, 0, 0, 0, 1, 1,
-0.4050755, -0.2506266, -2.533926, 0, 0, 0, 1, 1,
-0.4039561, -1.505647, -2.621157, 0, 0, 0, 1, 1,
-0.4037157, -0.1235556, -1.282865, 0, 0, 0, 1, 1,
-0.3984557, 0.6623577, 0.5761344, 0, 0, 0, 1, 1,
-0.3932134, -0.707674, -3.486644, 0, 0, 0, 1, 1,
-0.3887608, 0.9836853, -0.0632399, 0, 0, 0, 1, 1,
-0.3886632, 1.423737, -0.7307451, 1, 1, 1, 1, 1,
-0.3821736, -1.388959, -2.344434, 1, 1, 1, 1, 1,
-0.3808829, 0.7785195, -0.5042249, 1, 1, 1, 1, 1,
-0.3761175, -1.071717, -2.834204, 1, 1, 1, 1, 1,
-0.3754882, -1.9346, -2.21745, 1, 1, 1, 1, 1,
-0.3751955, -0.6094335, -1.346826, 1, 1, 1, 1, 1,
-0.3747772, -1.134726, -2.914944, 1, 1, 1, 1, 1,
-0.3742963, -2.06059, -0.7988644, 1, 1, 1, 1, 1,
-0.3737905, -1.181672, -2.180259, 1, 1, 1, 1, 1,
-0.3709316, 0.4238008, -1.754901, 1, 1, 1, 1, 1,
-0.3667376, 0.6493178, -0.6096339, 1, 1, 1, 1, 1,
-0.3662083, 1.028749, 1.339796, 1, 1, 1, 1, 1,
-0.3633788, 0.8256683, -1.382027, 1, 1, 1, 1, 1,
-0.3616, 1.358364, 1.668072, 1, 1, 1, 1, 1,
-0.3528901, 1.091192, -0.4959885, 1, 1, 1, 1, 1,
-0.3482124, 0.8338967, -0.262281, 0, 0, 1, 1, 1,
-0.3469598, -1.770944, -3.308187, 1, 0, 0, 1, 1,
-0.3459954, 0.01246211, -2.098548, 1, 0, 0, 1, 1,
-0.3420074, 0.9773362, -0.4174857, 1, 0, 0, 1, 1,
-0.3392179, -0.7391458, -2.38836, 1, 0, 0, 1, 1,
-0.3338599, -0.7923778, -1.902688, 1, 0, 0, 1, 1,
-0.3334727, 1.28187, -0.7125217, 0, 0, 0, 1, 1,
-0.3271976, 1.238039, -2.948141, 0, 0, 0, 1, 1,
-0.3250581, -0.9391843, -4.619233, 0, 0, 0, 1, 1,
-0.3120166, -0.000418514, -1.956926, 0, 0, 0, 1, 1,
-0.3021759, -0.07066625, -1.074018, 0, 0, 0, 1, 1,
-0.293056, 0.1437984, -2.434277, 0, 0, 0, 1, 1,
-0.2854924, -0.3770873, -2.337065, 0, 0, 0, 1, 1,
-0.2852097, 0.9023512, 0.5808729, 1, 1, 1, 1, 1,
-0.2848262, -1.145175, -1.871947, 1, 1, 1, 1, 1,
-0.271304, 1.265965, 0.2294855, 1, 1, 1, 1, 1,
-0.2711192, -0.6446665, -3.103473, 1, 1, 1, 1, 1,
-0.2688906, 1.074364, 0.994241, 1, 1, 1, 1, 1,
-0.2675095, 0.7038817, 0.2013352, 1, 1, 1, 1, 1,
-0.2641802, -0.2336664, -2.419528, 1, 1, 1, 1, 1,
-0.2609529, -0.5859352, -3.28328, 1, 1, 1, 1, 1,
-0.2595279, 1.802003, 0.0692779, 1, 1, 1, 1, 1,
-0.2589217, -0.3090933, -1.120844, 1, 1, 1, 1, 1,
-0.2546512, -0.9618967, -3.34933, 1, 1, 1, 1, 1,
-0.2368956, -0.5025623, -2.595701, 1, 1, 1, 1, 1,
-0.2363265, 0.4384635, -1.017515, 1, 1, 1, 1, 1,
-0.2356911, -1.250613, -3.557328, 1, 1, 1, 1, 1,
-0.2327185, -0.1555174, -1.098019, 1, 1, 1, 1, 1,
-0.224738, 0.1086103, -1.259564, 0, 0, 1, 1, 1,
-0.2219202, 0.4442199, -1.520697, 1, 0, 0, 1, 1,
-0.2211525, 1.821747, -0.1025311, 1, 0, 0, 1, 1,
-0.2177342, -1.237844, -1.930506, 1, 0, 0, 1, 1,
-0.216782, -0.773271, -1.910312, 1, 0, 0, 1, 1,
-0.21587, 0.36199, -1.036762, 1, 0, 0, 1, 1,
-0.2158299, 2.311, 0.7761561, 0, 0, 0, 1, 1,
-0.2123834, 0.9034282, -0.3891518, 0, 0, 0, 1, 1,
-0.211052, -0.3794792, -2.488979, 0, 0, 0, 1, 1,
-0.2107647, 0.8585437, -0.03669312, 0, 0, 0, 1, 1,
-0.2090101, 1.259843, -2.560596, 0, 0, 0, 1, 1,
-0.2069741, -0.564916, -2.372524, 0, 0, 0, 1, 1,
-0.2068066, 0.5136777, 0.500412, 0, 0, 0, 1, 1,
-0.2053432, 0.6681679, -1.130577, 1, 1, 1, 1, 1,
-0.198859, 1.229364, -1.039906, 1, 1, 1, 1, 1,
-0.1972512, 0.9858383, 0.1271988, 1, 1, 1, 1, 1,
-0.1965649, -0.01241421, -3.054337, 1, 1, 1, 1, 1,
-0.1955043, -0.1486502, -1.153406, 1, 1, 1, 1, 1,
-0.195418, 0.1435441, -0.8788508, 1, 1, 1, 1, 1,
-0.1939242, 0.580064, -0.5862119, 1, 1, 1, 1, 1,
-0.1908675, -1.016951, -4.355271, 1, 1, 1, 1, 1,
-0.1869269, 2.262158, -0.9377634, 1, 1, 1, 1, 1,
-0.1867812, 0.2055911, -2.224249, 1, 1, 1, 1, 1,
-0.1865745, 0.470406, -1.865698, 1, 1, 1, 1, 1,
-0.1845376, 0.768365, -2.785516, 1, 1, 1, 1, 1,
-0.1838557, 0.2232091, -0.01431795, 1, 1, 1, 1, 1,
-0.1833389, -0.2828757, -0.5857183, 1, 1, 1, 1, 1,
-0.1822872, 0.04627883, 0.02398767, 1, 1, 1, 1, 1,
-0.1821353, -0.03805703, -2.301899, 0, 0, 1, 1, 1,
-0.1808947, 0.1066791, 0.3850051, 1, 0, 0, 1, 1,
-0.1757035, 1.33225, -0.03238114, 1, 0, 0, 1, 1,
-0.1755391, 0.714227, -0.3927897, 1, 0, 0, 1, 1,
-0.1753408, 1.351025, -1.090697, 1, 0, 0, 1, 1,
-0.1745025, 0.07386371, -2.011295, 1, 0, 0, 1, 1,
-0.17309, 0.2377975, -1.566629, 0, 0, 0, 1, 1,
-0.1719901, 1.123605, 0.2709557, 0, 0, 0, 1, 1,
-0.1719393, 1.027014, 0.9155903, 0, 0, 0, 1, 1,
-0.1711175, -1.076284, -3.624854, 0, 0, 0, 1, 1,
-0.1707427, 1.210506, -1.505145, 0, 0, 0, 1, 1,
-0.1700044, -0.3291143, -3.222825, 0, 0, 0, 1, 1,
-0.1661783, 0.1533517, -1.41299, 0, 0, 0, 1, 1,
-0.1653686, 0.6180981, 0.5507873, 1, 1, 1, 1, 1,
-0.1605557, -0.430993, -3.141668, 1, 1, 1, 1, 1,
-0.1603301, -0.4655184, -2.297236, 1, 1, 1, 1, 1,
-0.1602429, 1.62144, -0.3130643, 1, 1, 1, 1, 1,
-0.1584266, -1.530652, -1.272049, 1, 1, 1, 1, 1,
-0.156394, 1.36622, 0.4267682, 1, 1, 1, 1, 1,
-0.1541519, -2.960425, -0.1912982, 1, 1, 1, 1, 1,
-0.1532743, -0.2882057, -1.355618, 1, 1, 1, 1, 1,
-0.1399915, 0.4140634, 0.699634, 1, 1, 1, 1, 1,
-0.139264, -0.01465285, -0.07291324, 1, 1, 1, 1, 1,
-0.1372651, -0.9536291, -2.863052, 1, 1, 1, 1, 1,
-0.1343827, -0.4332164, -2.668196, 1, 1, 1, 1, 1,
-0.1294882, -1.220071, -3.167798, 1, 1, 1, 1, 1,
-0.1291874, -0.3915347, -3.321901, 1, 1, 1, 1, 1,
-0.1284214, -0.147193, -0.8098413, 1, 1, 1, 1, 1,
-0.126377, -0.4926554, -2.170498, 0, 0, 1, 1, 1,
-0.126175, -0.3088617, -2.943372, 1, 0, 0, 1, 1,
-0.1251134, 1.776646, -0.2856649, 1, 0, 0, 1, 1,
-0.1222255, 0.36434, -0.9396923, 1, 0, 0, 1, 1,
-0.1181001, 0.01788758, -3.371927, 1, 0, 0, 1, 1,
-0.114584, 0.005053192, -4.276537, 1, 0, 0, 1, 1,
-0.108813, 0.381111, 0.2801298, 0, 0, 0, 1, 1,
-0.108348, -0.2050824, -3.265099, 0, 0, 0, 1, 1,
-0.106469, -0.536121, -2.658256, 0, 0, 0, 1, 1,
-0.104275, -0.1723552, -1.373635, 0, 0, 0, 1, 1,
-0.1040655, -0.2703045, -2.412385, 0, 0, 0, 1, 1,
-0.1035421, 0.8867907, -0.26168, 0, 0, 0, 1, 1,
-0.1019077, -0.8556215, -5.400753, 0, 0, 0, 1, 1,
-0.09977323, 0.3134728, 1.073205, 1, 1, 1, 1, 1,
-0.09936944, -0.01838188, -0.0702508, 1, 1, 1, 1, 1,
-0.09302007, 1.296857, 0.7384882, 1, 1, 1, 1, 1,
-0.09104694, 0.3769494, -0.9775563, 1, 1, 1, 1, 1,
-0.08442409, -0.2447804, -1.835752, 1, 1, 1, 1, 1,
-0.08414067, 0.9176547, -0.9413882, 1, 1, 1, 1, 1,
-0.08143849, -0.03845932, -2.872046, 1, 1, 1, 1, 1,
-0.08113991, 0.1930323, -2.441402, 1, 1, 1, 1, 1,
-0.07937107, 0.6529642, -0.7582101, 1, 1, 1, 1, 1,
-0.07852577, 0.882259, 0.2263505, 1, 1, 1, 1, 1,
-0.07315785, 0.4499786, 0.2722475, 1, 1, 1, 1, 1,
-0.07170477, -1.014945, -3.825078, 1, 1, 1, 1, 1,
-0.06888413, -0.4526879, -4.666111, 1, 1, 1, 1, 1,
-0.06830239, 0.137675, 0.9316438, 1, 1, 1, 1, 1,
-0.05979282, 0.07514726, -0.9529147, 1, 1, 1, 1, 1,
-0.05919979, 0.354201, -0.5889139, 0, 0, 1, 1, 1,
-0.05123558, -0.3953554, -3.351399, 1, 0, 0, 1, 1,
-0.05049966, 0.04622241, -1.80517, 1, 0, 0, 1, 1,
-0.04798866, 3.122657, -0.0928997, 1, 0, 0, 1, 1,
-0.04664651, -1.121601, -4.022552, 1, 0, 0, 1, 1,
-0.0461467, -1.047084, -3.230504, 1, 0, 0, 1, 1,
-0.04244588, -0.6839211, -3.045741, 0, 0, 0, 1, 1,
-0.04211609, -0.5919189, -3.093172, 0, 0, 0, 1, 1,
-0.03924856, -1.798531, -2.815845, 0, 0, 0, 1, 1,
-0.03658194, -1.494974, -2.710593, 0, 0, 0, 1, 1,
-0.03555074, 1.486084, 0.3999032, 0, 0, 0, 1, 1,
-0.03379459, 0.9131007, -0.08268556, 0, 0, 0, 1, 1,
-0.03072543, -0.4346066, -3.498549, 0, 0, 0, 1, 1,
-0.03046015, -1.408285, -3.564422, 1, 1, 1, 1, 1,
-0.03018689, -2.009601, -3.564469, 1, 1, 1, 1, 1,
-0.02809236, 1.078394, 0.9029373, 1, 1, 1, 1, 1,
-0.02144649, -1.821233, -3.132911, 1, 1, 1, 1, 1,
-0.01921858, -0.5553732, -3.087619, 1, 1, 1, 1, 1,
-0.01847278, -0.03807392, -3.853246, 1, 1, 1, 1, 1,
-0.01565136, -0.03164412, -1.827465, 1, 1, 1, 1, 1,
-0.01253523, 0.2352299, -0.9390014, 1, 1, 1, 1, 1,
-0.01030187, 0.9398656, 0.3072571, 1, 1, 1, 1, 1,
-0.008141133, -0.5771055, -1.427761, 1, 1, 1, 1, 1,
-0.007609786, 1.037173, 1.298203, 1, 1, 1, 1, 1,
-0.007529473, -0.9861789, -4.403125, 1, 1, 1, 1, 1,
-0.001208499, -0.7752117, -2.67167, 1, 1, 1, 1, 1,
0.004083409, -0.578212, 2.711539, 1, 1, 1, 1, 1,
0.004770312, -0.4024862, 2.812185, 1, 1, 1, 1, 1,
0.00504212, 0.1693245, -0.8931585, 0, 0, 1, 1, 1,
0.00545212, -0.8283101, 4.986012, 1, 0, 0, 1, 1,
0.006842847, 1.465951, 1.131578, 1, 0, 0, 1, 1,
0.0100749, 1.102154, 0.872556, 1, 0, 0, 1, 1,
0.01067713, 0.8411392, 0.4611482, 1, 0, 0, 1, 1,
0.01182827, 0.7603393, 1.190625, 1, 0, 0, 1, 1,
0.01241308, -1.77269, 5.111997, 0, 0, 0, 1, 1,
0.02123009, -2.255172, 3.459218, 0, 0, 0, 1, 1,
0.02801236, -0.5176179, 3.47711, 0, 0, 0, 1, 1,
0.02896473, -1.232778, 3.013726, 0, 0, 0, 1, 1,
0.0290161, 0.1144114, -1.542585, 0, 0, 0, 1, 1,
0.03129188, -1.261609, 4.495059, 0, 0, 0, 1, 1,
0.03931024, -0.1710854, 3.703914, 0, 0, 0, 1, 1,
0.04236289, 0.2551059, 0.03691444, 1, 1, 1, 1, 1,
0.04328946, 0.5130295, 2.841138, 1, 1, 1, 1, 1,
0.04736031, -2.181945, 2.212667, 1, 1, 1, 1, 1,
0.04841205, -0.009955508, 1.718735, 1, 1, 1, 1, 1,
0.05469853, -0.005211552, 2.834815, 1, 1, 1, 1, 1,
0.05566018, -0.5910833, 3.940419, 1, 1, 1, 1, 1,
0.05868457, 0.7250026, -1.304527, 1, 1, 1, 1, 1,
0.06006701, -1.032689, 1.932431, 1, 1, 1, 1, 1,
0.06215646, 1.769191, 0.3792455, 1, 1, 1, 1, 1,
0.06372008, 0.5930793, 0.2112604, 1, 1, 1, 1, 1,
0.06996635, -0.5998837, 2.847878, 1, 1, 1, 1, 1,
0.07017636, 2.064246, 1.869388, 1, 1, 1, 1, 1,
0.07097525, 0.4825371, 0.7737912, 1, 1, 1, 1, 1,
0.07127776, 0.1552593, 1.371507, 1, 1, 1, 1, 1,
0.07422151, -2.258097, 1.071442, 1, 1, 1, 1, 1,
0.07527559, -0.339965, 2.66513, 0, 0, 1, 1, 1,
0.07690459, 0.7374246, -0.507342, 1, 0, 0, 1, 1,
0.07742187, -1.713738, 4.591688, 1, 0, 0, 1, 1,
0.07808827, -1.146117, 1.189795, 1, 0, 0, 1, 1,
0.08396572, -0.3974345, 2.875547, 1, 0, 0, 1, 1,
0.08535263, 0.6541016, 0.4189427, 1, 0, 0, 1, 1,
0.08677132, -0.1572467, 3.614711, 0, 0, 0, 1, 1,
0.08723378, 0.5152515, 2.383545, 0, 0, 0, 1, 1,
0.0872962, -1.935168, 2.779235, 0, 0, 0, 1, 1,
0.09267098, -0.9579037, 2.688325, 0, 0, 0, 1, 1,
0.09654317, 0.3090289, -0.5493804, 0, 0, 0, 1, 1,
0.09885406, 0.4952788, 0.8673366, 0, 0, 0, 1, 1,
0.1012942, -0.5282738, 2.403926, 0, 0, 0, 1, 1,
0.1015005, -0.5605833, 2.917666, 1, 1, 1, 1, 1,
0.1029383, 0.6601034, -0.5708629, 1, 1, 1, 1, 1,
0.1037613, 0.8861693, 1.410661, 1, 1, 1, 1, 1,
0.1050327, 0.2575156, 0.8605339, 1, 1, 1, 1, 1,
0.1118792, -0.1494059, 2.458135, 1, 1, 1, 1, 1,
0.1177514, -0.4588202, 4.196413, 1, 1, 1, 1, 1,
0.1178994, -2.066762, 1.582082, 1, 1, 1, 1, 1,
0.1214028, 1.787649, -0.03908367, 1, 1, 1, 1, 1,
0.1236846, -0.9442078, 3.450749, 1, 1, 1, 1, 1,
0.1239516, 1.355874, 0.4841149, 1, 1, 1, 1, 1,
0.1241662, 1.539483, -0.2354082, 1, 1, 1, 1, 1,
0.1262915, -0.212414, 2.927727, 1, 1, 1, 1, 1,
0.1272509, -0.9140877, 2.777474, 1, 1, 1, 1, 1,
0.1276865, 0.5230194, 0.5401589, 1, 1, 1, 1, 1,
0.1303967, -0.952376, 2.88727, 1, 1, 1, 1, 1,
0.1339386, -0.8633584, 5.118103, 0, 0, 1, 1, 1,
0.1358052, -1.430961, 2.65726, 1, 0, 0, 1, 1,
0.1430008, -0.5733494, 1.904529, 1, 0, 0, 1, 1,
0.150072, 0.2644901, -0.4024894, 1, 0, 0, 1, 1,
0.1513902, 0.889927, 1.334656, 1, 0, 0, 1, 1,
0.1552431, -0.6296449, 1.447552, 1, 0, 0, 1, 1,
0.1556767, 0.2920856, 1.970884, 0, 0, 0, 1, 1,
0.1599173, 0.4161809, 0.2015235, 0, 0, 0, 1, 1,
0.1616744, -0.8394032, 2.687999, 0, 0, 0, 1, 1,
0.1617243, -1.038051, 3.82462, 0, 0, 0, 1, 1,
0.1673613, -1.408451, 3.1445, 0, 0, 0, 1, 1,
0.1713343, 1.416256, 0.9021414, 0, 0, 0, 1, 1,
0.1716799, 0.7456387, -0.03137463, 0, 0, 0, 1, 1,
0.1720895, 0.2387795, 0.8492503, 1, 1, 1, 1, 1,
0.1734258, -1.679717, 2.764791, 1, 1, 1, 1, 1,
0.1743993, 1.562027, -0.3305673, 1, 1, 1, 1, 1,
0.1770976, 0.9611406, 0.4215072, 1, 1, 1, 1, 1,
0.1806498, 0.1559314, 0.1315926, 1, 1, 1, 1, 1,
0.1828082, -0.7143413, 0.8659044, 1, 1, 1, 1, 1,
0.1830787, -0.4235255, 1.014345, 1, 1, 1, 1, 1,
0.1835638, 0.3563149, 0.6633289, 1, 1, 1, 1, 1,
0.1842643, 1.668855, -0.4904346, 1, 1, 1, 1, 1,
0.1903961, -0.8579853, 4.853687, 1, 1, 1, 1, 1,
0.1928466, 0.7634932, 0.476133, 1, 1, 1, 1, 1,
0.1945395, -1.676955, 2.512764, 1, 1, 1, 1, 1,
0.1962981, 0.01430874, 0.3945307, 1, 1, 1, 1, 1,
0.1973075, 0.812561, -0.7161934, 1, 1, 1, 1, 1,
0.1977974, -1.340073, 1.84567, 1, 1, 1, 1, 1,
0.199654, -0.6260241, 2.9508, 0, 0, 1, 1, 1,
0.2018067, -0.7273546, 2.290446, 1, 0, 0, 1, 1,
0.2048847, -0.214964, 1.203783, 1, 0, 0, 1, 1,
0.2049891, -1.448925, 3.099632, 1, 0, 0, 1, 1,
0.2072954, 0.3528156, 1.536265, 1, 0, 0, 1, 1,
0.2076295, 0.570251, 0.8292191, 1, 0, 0, 1, 1,
0.2077432, -0.1307945, 3.584469, 0, 0, 0, 1, 1,
0.2111232, -0.4750139, 2.11778, 0, 0, 0, 1, 1,
0.22248, -1.993802, 1.457913, 0, 0, 0, 1, 1,
0.2256118, -0.7727145, 3.951542, 0, 0, 0, 1, 1,
0.2257474, 0.553656, 0.2368276, 0, 0, 0, 1, 1,
0.2261247, -1.07621, 2.288476, 0, 0, 0, 1, 1,
0.2286226, 0.3383282, -0.5059493, 0, 0, 0, 1, 1,
0.2295482, 0.7314062, 0.6490423, 1, 1, 1, 1, 1,
0.2296169, 0.01930218, 1.308665, 1, 1, 1, 1, 1,
0.2301009, 0.6133568, 1.52957, 1, 1, 1, 1, 1,
0.2306616, -1.000297, 3.360207, 1, 1, 1, 1, 1,
0.2319442, -1.321155, 1.680734, 1, 1, 1, 1, 1,
0.236329, -0.4074726, 5.417515, 1, 1, 1, 1, 1,
0.2375904, 0.1204255, 0.9382858, 1, 1, 1, 1, 1,
0.2520469, -1.106197, 0.5633773, 1, 1, 1, 1, 1,
0.252167, 0.4847033, 0.2125463, 1, 1, 1, 1, 1,
0.2524174, -0.01501543, 3.650477, 1, 1, 1, 1, 1,
0.2560141, 0.07404833, 2.856921, 1, 1, 1, 1, 1,
0.2570522, -1.612985, 2.596118, 1, 1, 1, 1, 1,
0.2584789, -0.3407668, 1.649406, 1, 1, 1, 1, 1,
0.2596675, -0.3666791, 2.004279, 1, 1, 1, 1, 1,
0.2685906, 0.9178531, 0.4891917, 1, 1, 1, 1, 1,
0.269248, 0.6388508, -2.093043, 0, 0, 1, 1, 1,
0.2711252, 1.304251, 0.1858184, 1, 0, 0, 1, 1,
0.2730165, -0.3830016, 0.734691, 1, 0, 0, 1, 1,
0.277642, -0.5397914, 4.833435, 1, 0, 0, 1, 1,
0.2840353, 0.1031842, 1.737417, 1, 0, 0, 1, 1,
0.2869423, -0.06730002, 1.124019, 1, 0, 0, 1, 1,
0.287663, 0.7053597, 1.896334, 0, 0, 0, 1, 1,
0.2892275, -0.8770115, 1.690562, 0, 0, 0, 1, 1,
0.2894842, 1.784622, 0.8113697, 0, 0, 0, 1, 1,
0.2905334, 0.1261927, 1.672954, 0, 0, 0, 1, 1,
0.2976103, 0.818163, -0.5008575, 0, 0, 0, 1, 1,
0.2990599, 0.3005402, -1.868151, 0, 0, 0, 1, 1,
0.3015209, -1.410401, 4.428549, 0, 0, 0, 1, 1,
0.3025924, 0.6499694, -0.3883314, 1, 1, 1, 1, 1,
0.3107952, -0.1824435, 0.9820776, 1, 1, 1, 1, 1,
0.3126276, -1.376716, 4.781132, 1, 1, 1, 1, 1,
0.319968, 0.1443701, 2.218832, 1, 1, 1, 1, 1,
0.3203965, 0.3670509, 0.007792702, 1, 1, 1, 1, 1,
0.3220507, -0.4233668, 2.859605, 1, 1, 1, 1, 1,
0.3223096, -0.5776367, 3.230147, 1, 1, 1, 1, 1,
0.3272124, -0.07986984, 1.196281, 1, 1, 1, 1, 1,
0.3278969, 2.255286, 0.9468588, 1, 1, 1, 1, 1,
0.3299432, 0.04236825, 2.684126, 1, 1, 1, 1, 1,
0.3351862, -1.409475, 3.568654, 1, 1, 1, 1, 1,
0.3376096, 0.5338386, 0.7604641, 1, 1, 1, 1, 1,
0.3389404, -0.152002, 3.414326, 1, 1, 1, 1, 1,
0.341488, 0.4496748, 2.826704, 1, 1, 1, 1, 1,
0.3425912, 0.7962269, -0.9740317, 1, 1, 1, 1, 1,
0.3468764, -0.06262292, 2.772114, 0, 0, 1, 1, 1,
0.3475097, -1.082435, 1.112681, 1, 0, 0, 1, 1,
0.3502569, -1.147932, 2.871089, 1, 0, 0, 1, 1,
0.3515948, -0.1410389, 1.701387, 1, 0, 0, 1, 1,
0.3569587, 1.182522, 0.9157115, 1, 0, 0, 1, 1,
0.3571786, 0.9076783, 1.146432, 1, 0, 0, 1, 1,
0.360323, 0.5990075, 0.9435098, 0, 0, 0, 1, 1,
0.3726777, 0.3967338, 1.308767, 0, 0, 0, 1, 1,
0.3732827, -0.3155554, 1.018507, 0, 0, 0, 1, 1,
0.3736081, 0.1498009, 1.744543, 0, 0, 0, 1, 1,
0.3759891, -0.07673213, 4.721557, 0, 0, 0, 1, 1,
0.3879345, 0.2627695, 0.8381303, 0, 0, 0, 1, 1,
0.3883922, 0.5803286, 1.570273, 0, 0, 0, 1, 1,
0.3925847, -1.190871, 4.31262, 1, 1, 1, 1, 1,
0.3943267, -0.7172375, 1.399615, 1, 1, 1, 1, 1,
0.3952641, -1.852848, 4.171527, 1, 1, 1, 1, 1,
0.3984252, 1.626402, 1.18304, 1, 1, 1, 1, 1,
0.4015478, 0.4541234, 1.447352, 1, 1, 1, 1, 1,
0.402675, 0.5699452, -0.04047275, 1, 1, 1, 1, 1,
0.4051969, 0.05180202, 1.278517, 1, 1, 1, 1, 1,
0.4074208, 1.078473, 1.528327, 1, 1, 1, 1, 1,
0.4084511, 1.17434, -0.1845243, 1, 1, 1, 1, 1,
0.4120789, 1.626626, 1.323467, 1, 1, 1, 1, 1,
0.4158852, -0.02811419, 2.87083, 1, 1, 1, 1, 1,
0.4164548, 0.513191, 1.644681, 1, 1, 1, 1, 1,
0.4213003, -0.3275469, 0.764693, 1, 1, 1, 1, 1,
0.4215188, 1.693815, 2.479598, 1, 1, 1, 1, 1,
0.4226676, 0.9048591, 1.83893, 1, 1, 1, 1, 1,
0.4239782, 0.1644768, 2.080381, 0, 0, 1, 1, 1,
0.4261217, -0.6641438, -0.06368361, 1, 0, 0, 1, 1,
0.4264892, -0.09862364, 2.955902, 1, 0, 0, 1, 1,
0.4279487, 0.3009567, -0.9361115, 1, 0, 0, 1, 1,
0.4281096, -1.184646, 2.197144, 1, 0, 0, 1, 1,
0.4318838, -0.6040984, 3.602578, 1, 0, 0, 1, 1,
0.4387154, -1.241516, 3.835205, 0, 0, 0, 1, 1,
0.4415566, 0.5338718, 0.4618915, 0, 0, 0, 1, 1,
0.4418213, 1.502183, 1.833779, 0, 0, 0, 1, 1,
0.4545652, 0.9153192, 0.6592199, 0, 0, 0, 1, 1,
0.4614602, 1.003832, 0.002145855, 0, 0, 0, 1, 1,
0.4636303, 0.8795947, 0.1134671, 0, 0, 0, 1, 1,
0.4710735, 1.25154, 2.45911, 0, 0, 0, 1, 1,
0.4719856, 0.1164873, 1.406498, 1, 1, 1, 1, 1,
0.4740877, 0.7360532, 0.753237, 1, 1, 1, 1, 1,
0.4742403, 1.165643, 1.497386, 1, 1, 1, 1, 1,
0.4782523, -0.4589282, 2.263128, 1, 1, 1, 1, 1,
0.4814831, -0.5094825, 1.998897, 1, 1, 1, 1, 1,
0.4891454, -0.9800755, 2.597718, 1, 1, 1, 1, 1,
0.4893859, 0.7984338, 2.945701, 1, 1, 1, 1, 1,
0.4912869, 1.120533, 2.9818, 1, 1, 1, 1, 1,
0.5055732, 0.05617648, 1.414865, 1, 1, 1, 1, 1,
0.510949, 1.01842, 0.3818986, 1, 1, 1, 1, 1,
0.5125424, 0.03779885, 0.5236483, 1, 1, 1, 1, 1,
0.5173294, 1.415036, 0.198207, 1, 1, 1, 1, 1,
0.5192481, 1.959553, -0.08022346, 1, 1, 1, 1, 1,
0.5209926, -1.973581, 4.642262, 1, 1, 1, 1, 1,
0.524049, 0.1027166, 1.768552, 1, 1, 1, 1, 1,
0.5268477, -0.2530938, 1.662257, 0, 0, 1, 1, 1,
0.5322593, 1.454293, 0.7729014, 1, 0, 0, 1, 1,
0.5324837, -1.363404, 2.211023, 1, 0, 0, 1, 1,
0.5388405, -0.3220192, 3.004915, 1, 0, 0, 1, 1,
0.5389151, -0.6396902, 2.07041, 1, 0, 0, 1, 1,
0.5406621, 0.5524929, 0.3950215, 1, 0, 0, 1, 1,
0.541634, -0.4801395, 2.113867, 0, 0, 0, 1, 1,
0.5422645, -0.316073, 2.548055, 0, 0, 0, 1, 1,
0.5530777, -1.031703, 2.638648, 0, 0, 0, 1, 1,
0.5531206, 0.009788296, 1.102419, 0, 0, 0, 1, 1,
0.5586835, -1.442093, 0.2438387, 0, 0, 0, 1, 1,
0.5601412, -0.9543964, 1.239119, 0, 0, 0, 1, 1,
0.5620164, -0.4445764, 1.844889, 0, 0, 0, 1, 1,
0.5648387, 1.27149, -0.7937723, 1, 1, 1, 1, 1,
0.5656851, -0.5446608, 1.682611, 1, 1, 1, 1, 1,
0.5672365, 1.486694, -1.599464, 1, 1, 1, 1, 1,
0.5674206, 3.036788, -0.007124806, 1, 1, 1, 1, 1,
0.5698631, -1.873951, 1.458556, 1, 1, 1, 1, 1,
0.5720948, -0.690143, 2.159683, 1, 1, 1, 1, 1,
0.5760036, 1.383083, -0.2158429, 1, 1, 1, 1, 1,
0.5761164, -0.3017951, 2.696722, 1, 1, 1, 1, 1,
0.5775653, 1.302325, 0.6947774, 1, 1, 1, 1, 1,
0.5811958, 1.0636, 0.4549597, 1, 1, 1, 1, 1,
0.5859676, 1.340804, 2.338023, 1, 1, 1, 1, 1,
0.5864282, -0.8701538, 2.997292, 1, 1, 1, 1, 1,
0.5866039, -0.8236353, 4.373458, 1, 1, 1, 1, 1,
0.5884494, 0.6695911, 0.26138, 1, 1, 1, 1, 1,
0.5893915, -1.028858, 2.235329, 1, 1, 1, 1, 1,
0.5928429, -0.1703988, 0.04013514, 0, 0, 1, 1, 1,
0.5937179, 0.186905, 2.028709, 1, 0, 0, 1, 1,
0.5971963, -0.6058782, 2.795651, 1, 0, 0, 1, 1,
0.5996286, -0.6698116, 1.742573, 1, 0, 0, 1, 1,
0.6019216, 0.1833422, 1.434079, 1, 0, 0, 1, 1,
0.6025112, -0.5967519, 1.429125, 1, 0, 0, 1, 1,
0.603567, -0.4219213, 4.926738, 0, 0, 0, 1, 1,
0.6069687, -0.2207521, 1.936537, 0, 0, 0, 1, 1,
0.6087857, 1.061746, -2.357527, 0, 0, 0, 1, 1,
0.610115, -0.7329507, 4.346941, 0, 0, 0, 1, 1,
0.6138024, 0.6708781, 1.742896, 0, 0, 0, 1, 1,
0.615138, 0.3661089, -0.134818, 0, 0, 0, 1, 1,
0.6223103, 0.6960393, 1.127595, 0, 0, 0, 1, 1,
0.6244534, -0.2652964, 3.644307, 1, 1, 1, 1, 1,
0.6316068, -0.4530765, 3.04287, 1, 1, 1, 1, 1,
0.6337613, -0.06467275, 0.9169106, 1, 1, 1, 1, 1,
0.6354061, 0.4501522, 0.1423923, 1, 1, 1, 1, 1,
0.6450198, 0.4181731, 2.188516, 1, 1, 1, 1, 1,
0.6482376, 2.087278, -0.7542002, 1, 1, 1, 1, 1,
0.6517346, -0.5479149, 2.262502, 1, 1, 1, 1, 1,
0.6520928, -0.2524829, 2.699278, 1, 1, 1, 1, 1,
0.6563547, -0.08081408, 1.351101, 1, 1, 1, 1, 1,
0.6604996, 0.1955792, 0.9880573, 1, 1, 1, 1, 1,
0.664262, -0.04364309, 0.9991461, 1, 1, 1, 1, 1,
0.6648475, 1.435689, -1.222439, 1, 1, 1, 1, 1,
0.6670557, -0.647424, 1.141493, 1, 1, 1, 1, 1,
0.670812, 1.614029, 0.8139021, 1, 1, 1, 1, 1,
0.6736028, 1.755187, 0.8089755, 1, 1, 1, 1, 1,
0.6742349, 1.390207, 0.6036209, 0, 0, 1, 1, 1,
0.6770934, 1.310347, -0.1022199, 1, 0, 0, 1, 1,
0.6771795, -2.731327, 4.100674, 1, 0, 0, 1, 1,
0.6813443, -0.4440738, 2.960642, 1, 0, 0, 1, 1,
0.6813457, 0.01833274, 1.943534, 1, 0, 0, 1, 1,
0.6835706, 0.5945986, 0.9965886, 1, 0, 0, 1, 1,
0.6838722, 2.050978, -0.9188648, 0, 0, 0, 1, 1,
0.6846104, -0.3482935, 2.994318, 0, 0, 0, 1, 1,
0.6976251, -0.9785855, 1.247161, 0, 0, 0, 1, 1,
0.7033888, 1.667481, -0.053636, 0, 0, 0, 1, 1,
0.7042522, 0.4280533, 1.621936, 0, 0, 0, 1, 1,
0.7070888, -1.344954, 2.269426, 0, 0, 0, 1, 1,
0.7080238, -1.14168, 1.93943, 0, 0, 0, 1, 1,
0.716, -0.6523759, 2.069983, 1, 1, 1, 1, 1,
0.7220696, -0.1479835, 1.38637, 1, 1, 1, 1, 1,
0.7224948, 1.058342, -0.3957421, 1, 1, 1, 1, 1,
0.7317865, -1.499085, 3.283047, 1, 1, 1, 1, 1,
0.7329014, 0.1066275, 2.062828, 1, 1, 1, 1, 1,
0.7409158, -0.3437307, 3.79116, 1, 1, 1, 1, 1,
0.7427065, 0.5342641, 0.5467821, 1, 1, 1, 1, 1,
0.7444925, -0.2690308, 2.028419, 1, 1, 1, 1, 1,
0.7457095, -1.263209, 3.085346, 1, 1, 1, 1, 1,
0.7459482, -0.4527822, 0.9449971, 1, 1, 1, 1, 1,
0.7460114, 1.198867, -0.6110968, 1, 1, 1, 1, 1,
0.7471754, -2.959783, 3.589907, 1, 1, 1, 1, 1,
0.7521181, 0.2608909, 0.7412357, 1, 1, 1, 1, 1,
0.7661234, -0.585766, 2.622056, 1, 1, 1, 1, 1,
0.7714164, 0.156605, 2.176723, 1, 1, 1, 1, 1,
0.7715971, 0.09946159, 1.16471, 0, 0, 1, 1, 1,
0.7807648, -0.5707318, 1.863416, 1, 0, 0, 1, 1,
0.7855175, 0.8939962, 0.9506905, 1, 0, 0, 1, 1,
0.7991298, -0.2868479, 0.185473, 1, 0, 0, 1, 1,
0.7994316, -1.926544, 4.616651, 1, 0, 0, 1, 1,
0.8004353, -0.5648054, 0.6849274, 1, 0, 0, 1, 1,
0.8037607, -1.533099, 3.135364, 0, 0, 0, 1, 1,
0.804989, -0.4985776, 1.755988, 0, 0, 0, 1, 1,
0.8141019, 0.8464245, 0.3613883, 0, 0, 0, 1, 1,
0.8151677, -0.6346347, 1.537349, 0, 0, 0, 1, 1,
0.8196155, -1.380588, 2.043282, 0, 0, 0, 1, 1,
0.8202477, 0.3528123, 1.604674, 0, 0, 0, 1, 1,
0.8249093, 0.1155523, 0.5113346, 0, 0, 0, 1, 1,
0.8318161, 0.030843, 0.341606, 1, 1, 1, 1, 1,
0.8418702, 0.09599441, 2.149028, 1, 1, 1, 1, 1,
0.8420492, -1.431564, 0.9234378, 1, 1, 1, 1, 1,
0.8529933, 0.6191769, 1.559255, 1, 1, 1, 1, 1,
0.8533684, 1.264392, 0.5662094, 1, 1, 1, 1, 1,
0.8570938, 1.487504, 2.008597, 1, 1, 1, 1, 1,
0.8580962, -0.7498504, 2.41202, 1, 1, 1, 1, 1,
0.8640324, 0.7320849, -0.3123338, 1, 1, 1, 1, 1,
0.8767375, 0.536759, 2.239407, 1, 1, 1, 1, 1,
0.8793931, -1.98471, 4.51606, 1, 1, 1, 1, 1,
0.8794321, -0.9523679, 3.488219, 1, 1, 1, 1, 1,
0.8826149, -1.306923, 1.016538, 1, 1, 1, 1, 1,
0.8981556, 2.487629, 0.02494545, 1, 1, 1, 1, 1,
0.8991747, -2.262532, 3.192901, 1, 1, 1, 1, 1,
0.9016894, 0.6344823, 2.607981, 1, 1, 1, 1, 1,
0.9047891, 0.2683235, 1.994321, 0, 0, 1, 1, 1,
0.9096407, 2.030859, 1.550326, 1, 0, 0, 1, 1,
0.9109856, -0.006090411, 2.104117, 1, 0, 0, 1, 1,
0.9152701, 0.08197846, 0.357127, 1, 0, 0, 1, 1,
0.9166043, -0.164091, 2.613704, 1, 0, 0, 1, 1,
0.9176718, 1.432418, 0.8030132, 1, 0, 0, 1, 1,
0.9178455, -0.2175986, 2.302495, 0, 0, 0, 1, 1,
0.918814, -1.148118, 2.863562, 0, 0, 0, 1, 1,
0.9342366, -0.4398706, 0.820662, 0, 0, 0, 1, 1,
0.934414, -2.25414, 4.344771, 0, 0, 0, 1, 1,
0.9372088, 0.06655959, -0.1682543, 0, 0, 0, 1, 1,
0.9393588, -0.8118855, 1.117206, 0, 0, 0, 1, 1,
0.9394335, 0.1334311, 1.445818, 0, 0, 0, 1, 1,
0.9401619, -1.133073, 3.094679, 1, 1, 1, 1, 1,
0.943091, -0.5254323, 2.247624, 1, 1, 1, 1, 1,
0.9439821, -0.2195595, 0.2912776, 1, 1, 1, 1, 1,
0.945906, 0.4234774, 1.538571, 1, 1, 1, 1, 1,
0.9461794, 1.407071, -0.9658541, 1, 1, 1, 1, 1,
0.9464324, -0.9301955, 1.195329, 1, 1, 1, 1, 1,
0.9481167, 1.998082, -0.5885741, 1, 1, 1, 1, 1,
0.9744611, 0.3311763, 1.402711, 1, 1, 1, 1, 1,
0.9766666, -0.5348151, 1.879642, 1, 1, 1, 1, 1,
0.9776438, 0.6994734, -0.906436, 1, 1, 1, 1, 1,
0.9816194, 0.7358302, 0.2177018, 1, 1, 1, 1, 1,
0.9894872, 0.965903, 0.7738742, 1, 1, 1, 1, 1,
0.9963942, 0.896394, 1.054166, 1, 1, 1, 1, 1,
0.996866, -1.183747, 0.5210726, 1, 1, 1, 1, 1,
1.012088, -0.7256865, 2.144387, 1, 1, 1, 1, 1,
1.017565, 1.091884, 0.9568404, 0, 0, 1, 1, 1,
1.020286, 0.2721545, 1.437405, 1, 0, 0, 1, 1,
1.023837, -1.456236, 3.051435, 1, 0, 0, 1, 1,
1.025436, 1.222304, 0.472349, 1, 0, 0, 1, 1,
1.028361, -1.549352, 3.405701, 1, 0, 0, 1, 1,
1.037826, -1.046264, 3.133125, 1, 0, 0, 1, 1,
1.046793, 1.656431, 0.751641, 0, 0, 0, 1, 1,
1.050488, 0.6952549, -0.9322513, 0, 0, 0, 1, 1,
1.051517, 0.4336336, 1.561413, 0, 0, 0, 1, 1,
1.053998, 0.2220807, 1.025494, 0, 0, 0, 1, 1,
1.055955, -0.6659797, 1.660231, 0, 0, 0, 1, 1,
1.06665, -0.7064024, 2.793231, 0, 0, 0, 1, 1,
1.085984, 0.2769461, 1.180138, 0, 0, 0, 1, 1,
1.087178, 0.2477893, 1.61781, 1, 1, 1, 1, 1,
1.092093, 1.072886, 2.362122, 1, 1, 1, 1, 1,
1.093178, -0.9319831, 3.184532, 1, 1, 1, 1, 1,
1.104467, 1.236536, -0.6305352, 1, 1, 1, 1, 1,
1.108646, -0.6608325, 0.8807164, 1, 1, 1, 1, 1,
1.134027, -0.3155147, 3.976569, 1, 1, 1, 1, 1,
1.137278, -0.7033262, 2.636544, 1, 1, 1, 1, 1,
1.142734, 0.08053008, 2.902229, 1, 1, 1, 1, 1,
1.145201, 0.6072779, 1.794427, 1, 1, 1, 1, 1,
1.14551, 0.5279435, -0.3562047, 1, 1, 1, 1, 1,
1.151389, 0.4233733, 0.3336971, 1, 1, 1, 1, 1,
1.152168, -0.2779894, 2.981345, 1, 1, 1, 1, 1,
1.161686, -1.17909, 1.470751, 1, 1, 1, 1, 1,
1.162788, -0.2895309, 1.384922, 1, 1, 1, 1, 1,
1.165346, -0.5227458, 2.444116, 1, 1, 1, 1, 1,
1.165654, 0.02609543, 2.023114, 0, 0, 1, 1, 1,
1.175948, 0.5177673, 0.3016255, 1, 0, 0, 1, 1,
1.178468, -1.081682, 2.73271, 1, 0, 0, 1, 1,
1.179433, 1.234965, 1.162069, 1, 0, 0, 1, 1,
1.183668, -1.09775, 0.2471544, 1, 0, 0, 1, 1,
1.192872, 0.8151937, -0.04508182, 1, 0, 0, 1, 1,
1.199669, 0.786085, 2.18533, 0, 0, 0, 1, 1,
1.20219, -1.074943, 2.922832, 0, 0, 0, 1, 1,
1.204315, -1.301312, 2.168087, 0, 0, 0, 1, 1,
1.207559, -0.2388597, 1.065539, 0, 0, 0, 1, 1,
1.214872, -1.259003, 3.154656, 0, 0, 0, 1, 1,
1.2167, -1.171555, 2.833931, 0, 0, 0, 1, 1,
1.217029, 1.676789, 0.5269641, 0, 0, 0, 1, 1,
1.218716, 0.1801213, 0.9396957, 1, 1, 1, 1, 1,
1.222138, 0.7867794, 2.357668, 1, 1, 1, 1, 1,
1.238971, -0.4255809, 2.622485, 1, 1, 1, 1, 1,
1.240002, 0.5702319, -0.2672024, 1, 1, 1, 1, 1,
1.240347, -0.2779126, 1.06165, 1, 1, 1, 1, 1,
1.256446, 0.9325352, 0.5999513, 1, 1, 1, 1, 1,
1.264547, 0.06874978, 3.332358, 1, 1, 1, 1, 1,
1.266585, -1.485507, 1.356216, 1, 1, 1, 1, 1,
1.288199, -1.703282, 3.040054, 1, 1, 1, 1, 1,
1.298906, 1.547549, 0.2585513, 1, 1, 1, 1, 1,
1.300126, 0.6879122, 0.1491247, 1, 1, 1, 1, 1,
1.306155, -0.3679721, 1.38128, 1, 1, 1, 1, 1,
1.316204, -2.391278, 3.493304, 1, 1, 1, 1, 1,
1.321274, 0.2486215, 2.378431, 1, 1, 1, 1, 1,
1.327578, 0.6150984, 0.3707997, 1, 1, 1, 1, 1,
1.329403, 0.3542627, 2.844121, 0, 0, 1, 1, 1,
1.330893, -0.3632392, 2.855137, 1, 0, 0, 1, 1,
1.333872, 0.5643476, 0.679109, 1, 0, 0, 1, 1,
1.344549, 0.100679, 0.8753911, 1, 0, 0, 1, 1,
1.349893, -0.4118924, 1.200807, 1, 0, 0, 1, 1,
1.351224, -0.4702829, 1.51598, 1, 0, 0, 1, 1,
1.35655, 1.028578, 1.691106, 0, 0, 0, 1, 1,
1.361824, 0.438624, 3.328829, 0, 0, 0, 1, 1,
1.371737, 1.612409, 0.2005398, 0, 0, 0, 1, 1,
1.374306, -0.5918171, 2.539438, 0, 0, 0, 1, 1,
1.383738, 2.476103, 0.04229895, 0, 0, 0, 1, 1,
1.400385, -0.5264077, 1.600272, 0, 0, 0, 1, 1,
1.402325, -0.2871506, -0.2220206, 0, 0, 0, 1, 1,
1.403109, -0.5036883, 1.42915, 1, 1, 1, 1, 1,
1.403977, 0.6592589, -0.9222444, 1, 1, 1, 1, 1,
1.412991, -0.08855105, 1.622713, 1, 1, 1, 1, 1,
1.417679, -0.840129, 1.25833, 1, 1, 1, 1, 1,
1.430449, 0.1391204, 2.844078, 1, 1, 1, 1, 1,
1.435122, 0.9787627, 0.8456075, 1, 1, 1, 1, 1,
1.441854, 0.1528681, 0.829083, 1, 1, 1, 1, 1,
1.452529, -0.864262, 2.851106, 1, 1, 1, 1, 1,
1.476458, 0.450216, 0.4608145, 1, 1, 1, 1, 1,
1.486019, 1.77758, -1.294769, 1, 1, 1, 1, 1,
1.519807, 0.4118633, 1.451082, 1, 1, 1, 1, 1,
1.54246, -0.9946901, 3.168653, 1, 1, 1, 1, 1,
1.568223, 1.741579, 1.233811, 1, 1, 1, 1, 1,
1.57089, 1.072805, 1.672945, 1, 1, 1, 1, 1,
1.582412, -0.6175653, 3.563805, 1, 1, 1, 1, 1,
1.598794, -0.1234508, 1.845765, 0, 0, 1, 1, 1,
1.620406, 0.5465872, 2.020262, 1, 0, 0, 1, 1,
1.623631, -0.1113367, 0.4042705, 1, 0, 0, 1, 1,
1.626469, 1.722228, 1.35924, 1, 0, 0, 1, 1,
1.651362, 0.4766406, 1.171219, 1, 0, 0, 1, 1,
1.653577, -0.5303988, 1.482372, 1, 0, 0, 1, 1,
1.660586, -0.5248474, 0.6980075, 0, 0, 0, 1, 1,
1.665714, 0.2836998, 0.4689127, 0, 0, 0, 1, 1,
1.674925, 2.373186, 0.4067094, 0, 0, 0, 1, 1,
1.693245, -0.00134747, 2.128954, 0, 0, 0, 1, 1,
1.712515, 0.6524689, 1.105129, 0, 0, 0, 1, 1,
1.713159, 1.041474, 0.3695904, 0, 0, 0, 1, 1,
1.720098, 0.4859005, 0.8957039, 0, 0, 0, 1, 1,
1.728167, 0.2171453, 2.596474, 1, 1, 1, 1, 1,
1.737959, 0.1059654, 1.337164, 1, 1, 1, 1, 1,
1.821826, 0.2698447, 1.076893, 1, 1, 1, 1, 1,
1.839268, 1.583002, 0.9914556, 1, 1, 1, 1, 1,
1.849065, 0.005731222, 2.539785, 1, 1, 1, 1, 1,
1.883186, -0.7294394, 2.017954, 1, 1, 1, 1, 1,
1.90018, -0.7778888, 2.836602, 1, 1, 1, 1, 1,
1.907927, 1.757626, 0.06738529, 1, 1, 1, 1, 1,
1.909952, 1.47721, 1.074189, 1, 1, 1, 1, 1,
1.963596, 0.5770165, 2.893299, 1, 1, 1, 1, 1,
2.0065, -0.7132049, 2.483188, 1, 1, 1, 1, 1,
2.052465, -0.8497734, 2.985012, 1, 1, 1, 1, 1,
2.081858, -0.02767551, 0.5432863, 1, 1, 1, 1, 1,
2.153164, 0.298634, -1.064804, 1, 1, 1, 1, 1,
2.163198, -1.282121, 0.9357523, 1, 1, 1, 1, 1,
2.222831, -1.20667, 1.413412, 0, 0, 1, 1, 1,
2.24161, 2.808216, 0.8032501, 1, 0, 0, 1, 1,
2.247098, -1.180654, 1.649711, 1, 0, 0, 1, 1,
2.248362, -0.9113007, 2.958888, 1, 0, 0, 1, 1,
2.255628, 2.207163, 2.707308, 1, 0, 0, 1, 1,
2.268599, -0.8318163, 1.415529, 1, 0, 0, 1, 1,
2.283372, 0.5080218, 2.53777, 0, 0, 0, 1, 1,
2.335029, -0.4980494, -0.06280982, 0, 0, 0, 1, 1,
2.337243, 0.1752383, 2.426376, 0, 0, 0, 1, 1,
2.350356, 0.9132325, 1.68086, 0, 0, 0, 1, 1,
2.35177, -0.614167, 1.593091, 0, 0, 0, 1, 1,
2.393593, 1.636153, 1.360579, 0, 0, 0, 1, 1,
2.427969, -1.153927, 0.4338725, 0, 0, 0, 1, 1,
2.440383, -0.5799308, 1.552751, 1, 1, 1, 1, 1,
2.54119, 0.8845055, 1.947567, 1, 1, 1, 1, 1,
2.592034, -0.3820095, 2.473546, 1, 1, 1, 1, 1,
2.597792, -0.8419873, 2.291887, 1, 1, 1, 1, 1,
2.961774, 0.1120814, 1.550887, 1, 1, 1, 1, 1,
2.982889, -1.207319, 1.156682, 1, 1, 1, 1, 1,
3.268123, -1.406384, 2.207492, 1, 1, 1, 1, 1
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
var radius = 9.706742;
var distance = 34.09452;
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
mvMatrix.translate( 0.1693978, -0.1747746, -0.008381128 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09452);
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
