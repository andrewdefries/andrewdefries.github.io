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
-3.424805, -1.336544, -1.451645, 1, 0, 0, 1,
-3.331532, 1.372874, -0.6115717, 1, 0.007843138, 0, 1,
-3.316632, 0.07129937, -2.75714, 1, 0.01176471, 0, 1,
-3.13701, 2.549051, -0.6270124, 1, 0.01960784, 0, 1,
-2.961971, -1.223818, -1.598632, 1, 0.02352941, 0, 1,
-2.88299, -0.4305255, -0.5102576, 1, 0.03137255, 0, 1,
-2.833827, 0.7730747, -2.029997, 1, 0.03529412, 0, 1,
-2.520304, 0.005976782, -2.098379, 1, 0.04313726, 0, 1,
-2.501346, 1.739802, 0.7647965, 1, 0.04705882, 0, 1,
-2.332214, -0.1058764, -0.5730356, 1, 0.05490196, 0, 1,
-2.2134, 1.393925, -0.3780292, 1, 0.05882353, 0, 1,
-2.121081, 0.02389734, -2.750471, 1, 0.06666667, 0, 1,
-2.116126, -1.61819, -2.58279, 1, 0.07058824, 0, 1,
-2.07242, -0.4502847, -1.550984, 1, 0.07843138, 0, 1,
-2.031838, -0.5688444, -3.403178, 1, 0.08235294, 0, 1,
-1.993129, 0.9379842, -2.017005, 1, 0.09019608, 0, 1,
-1.990453, -0.2933294, -2.513869, 1, 0.09411765, 0, 1,
-1.976662, 1.571676, -0.7588837, 1, 0.1019608, 0, 1,
-1.970351, 0.8265656, -1.274017, 1, 0.1098039, 0, 1,
-1.942094, -0.7249843, -2.294962, 1, 0.1137255, 0, 1,
-1.913448, 0.4645358, -1.353901, 1, 0.1215686, 0, 1,
-1.907297, -0.023994, -1.040983, 1, 0.1254902, 0, 1,
-1.898245, 0.1484823, -1.002761, 1, 0.1333333, 0, 1,
-1.874923, 0.2944193, -2.255355, 1, 0.1372549, 0, 1,
-1.872729, 1.131546, -1.932347, 1, 0.145098, 0, 1,
-1.869083, -0.335987, -1.624809, 1, 0.1490196, 0, 1,
-1.862888, -0.4935958, -1.071427, 1, 0.1568628, 0, 1,
-1.861987, -0.6436706, -3.668137, 1, 0.1607843, 0, 1,
-1.860241, -0.255134, -2.430979, 1, 0.1686275, 0, 1,
-1.853308, 1.165146, -1.386425, 1, 0.172549, 0, 1,
-1.852407, 0.7446716, -0.9059237, 1, 0.1803922, 0, 1,
-1.823218, 1.144023, -0.7608114, 1, 0.1843137, 0, 1,
-1.815665, 0.6022089, -1.468081, 1, 0.1921569, 0, 1,
-1.806541, 0.7364489, -0.01054518, 1, 0.1960784, 0, 1,
-1.789366, -0.4014765, -2.275583, 1, 0.2039216, 0, 1,
-1.785858, 0.8942806, -1.434092, 1, 0.2117647, 0, 1,
-1.76918, 0.9364624, -0.08590779, 1, 0.2156863, 0, 1,
-1.757982, 1.349826, 1.43945, 1, 0.2235294, 0, 1,
-1.735462, -0.2944933, -0.7811583, 1, 0.227451, 0, 1,
-1.729708, -0.1803056, -2.350133, 1, 0.2352941, 0, 1,
-1.728283, 1.932799, -0.549209, 1, 0.2392157, 0, 1,
-1.698214, 0.3628664, 0.5685322, 1, 0.2470588, 0, 1,
-1.689372, -1.697348, -1.930821, 1, 0.2509804, 0, 1,
-1.674401, 1.024295, -2.301713, 1, 0.2588235, 0, 1,
-1.668166, 1.647216, -2.088959, 1, 0.2627451, 0, 1,
-1.666161, -0.4502643, -2.281936, 1, 0.2705882, 0, 1,
-1.659557, -1.480852, -1.445139, 1, 0.2745098, 0, 1,
-1.652515, -0.4832342, -0.9807014, 1, 0.282353, 0, 1,
-1.64913, -1.576269, -3.041651, 1, 0.2862745, 0, 1,
-1.639659, 0.3311703, -0.4223345, 1, 0.2941177, 0, 1,
-1.636896, 0.9667213, -1.233687, 1, 0.3019608, 0, 1,
-1.632678, 0.789579, -1.059325, 1, 0.3058824, 0, 1,
-1.609039, -1.861776, -3.415004, 1, 0.3137255, 0, 1,
-1.590871, -0.1121217, -0.493467, 1, 0.3176471, 0, 1,
-1.583923, 0.3247007, -0.4457122, 1, 0.3254902, 0, 1,
-1.578624, 0.1004611, 0.931309, 1, 0.3294118, 0, 1,
-1.564626, 1.184797, 0.550244, 1, 0.3372549, 0, 1,
-1.553966, 0.7765649, -1.384854, 1, 0.3411765, 0, 1,
-1.550196, 0.252128, 0.1865148, 1, 0.3490196, 0, 1,
-1.545336, -1.074177, -1.506377, 1, 0.3529412, 0, 1,
-1.543784, -0.4275505, -0.8692556, 1, 0.3607843, 0, 1,
-1.543005, 0.6876993, -2.416127, 1, 0.3647059, 0, 1,
-1.521148, 1.337455, -1.761423, 1, 0.372549, 0, 1,
-1.516506, 1.873842, -2.545968, 1, 0.3764706, 0, 1,
-1.509509, 1.140714, -0.1294853, 1, 0.3843137, 0, 1,
-1.506554, 0.1264593, -0.6664113, 1, 0.3882353, 0, 1,
-1.480019, -0.3886489, -1.622434, 1, 0.3960784, 0, 1,
-1.462232, -0.3993969, -1.526205, 1, 0.4039216, 0, 1,
-1.44417, -0.8175367, -3.121819, 1, 0.4078431, 0, 1,
-1.437952, 0.7231459, -0.3490151, 1, 0.4156863, 0, 1,
-1.432745, -0.594711, -2.902093, 1, 0.4196078, 0, 1,
-1.423163, -0.6644145, -2.745266, 1, 0.427451, 0, 1,
-1.417673, -0.7776567, -0.8609753, 1, 0.4313726, 0, 1,
-1.409021, 0.2804465, -0.9293396, 1, 0.4392157, 0, 1,
-1.40514, -0.8652774, -2.658739, 1, 0.4431373, 0, 1,
-1.404854, 0.3648728, -3.773348, 1, 0.4509804, 0, 1,
-1.400457, 0.1726944, -1.290303, 1, 0.454902, 0, 1,
-1.394429, -0.3725878, -1.188963, 1, 0.4627451, 0, 1,
-1.385611, -0.2895797, -1.47564, 1, 0.4666667, 0, 1,
-1.382874, -1.47963, -2.402205, 1, 0.4745098, 0, 1,
-1.379813, 1.134729, -0.08781292, 1, 0.4784314, 0, 1,
-1.375183, 0.9552674, -0.335486, 1, 0.4862745, 0, 1,
-1.368156, 0.5479945, -2.103107, 1, 0.4901961, 0, 1,
-1.367446, -1.686103, -2.96966, 1, 0.4980392, 0, 1,
-1.361049, 1.095073, -0.04755713, 1, 0.5058824, 0, 1,
-1.359816, 1.196636, -1.917813, 1, 0.509804, 0, 1,
-1.357793, 1.350054, -0.005649558, 1, 0.5176471, 0, 1,
-1.356902, -0.8536662, -2.288188, 1, 0.5215687, 0, 1,
-1.356846, 0.1484912, -1.67227, 1, 0.5294118, 0, 1,
-1.345213, -0.1871563, -3.156425, 1, 0.5333334, 0, 1,
-1.342454, -1.941918, -2.286012, 1, 0.5411765, 0, 1,
-1.338791, -0.07227615, -1.160435, 1, 0.5450981, 0, 1,
-1.331811, 0.04633754, -1.420778, 1, 0.5529412, 0, 1,
-1.32848, -0.03471378, -0.901706, 1, 0.5568628, 0, 1,
-1.326424, 0.9102763, -1.210392, 1, 0.5647059, 0, 1,
-1.314238, -1.197334, -3.032533, 1, 0.5686275, 0, 1,
-1.287321, -0.643854, -3.253117, 1, 0.5764706, 0, 1,
-1.286333, -0.1882767, -1.211191, 1, 0.5803922, 0, 1,
-1.282416, -0.3359523, -1.99051, 1, 0.5882353, 0, 1,
-1.276011, -0.1352365, -3.715041, 1, 0.5921569, 0, 1,
-1.274525, -0.06957643, -0.1209982, 1, 0.6, 0, 1,
-1.267891, -0.800458, -2.497026, 1, 0.6078432, 0, 1,
-1.259691, 0.5890288, -0.09066777, 1, 0.6117647, 0, 1,
-1.258214, 0.6293964, -1.532908, 1, 0.6196079, 0, 1,
-1.256048, -0.5520623, -2.146766, 1, 0.6235294, 0, 1,
-1.254155, 0.7266209, -0.9347477, 1, 0.6313726, 0, 1,
-1.253753, -2.711344, -2.855538, 1, 0.6352941, 0, 1,
-1.246618, 0.014733, 0.142741, 1, 0.6431373, 0, 1,
-1.24355, 0.7078781, -0.3293174, 1, 0.6470588, 0, 1,
-1.239775, -1.288483, -3.981784, 1, 0.654902, 0, 1,
-1.229446, 1.162648, -0.6117156, 1, 0.6588235, 0, 1,
-1.227786, -0.6484019, -1.87475, 1, 0.6666667, 0, 1,
-1.219899, 0.1478977, -3.352982, 1, 0.6705883, 0, 1,
-1.216406, 1.781773, -0.4081087, 1, 0.6784314, 0, 1,
-1.212907, -0.7315475, -1.920438, 1, 0.682353, 0, 1,
-1.205569, -0.02213441, -0.4856803, 1, 0.6901961, 0, 1,
-1.20285, -1.502485, -1.987495, 1, 0.6941177, 0, 1,
-1.189785, 2.188357, -0.8660954, 1, 0.7019608, 0, 1,
-1.182106, -0.8946665, -1.071251, 1, 0.7098039, 0, 1,
-1.179593, 0.7577794, -1.003575, 1, 0.7137255, 0, 1,
-1.176418, 1.050647, -1.817967, 1, 0.7215686, 0, 1,
-1.173171, -0.2147312, -2.992198, 1, 0.7254902, 0, 1,
-1.168031, 1.184067, -1.278857, 1, 0.7333333, 0, 1,
-1.165145, -1.500046, -0.6353681, 1, 0.7372549, 0, 1,
-1.164031, -0.05908639, -1.671142, 1, 0.7450981, 0, 1,
-1.160236, 0.8574901, -0.05009175, 1, 0.7490196, 0, 1,
-1.151211, 0.5149505, -2.391731, 1, 0.7568628, 0, 1,
-1.145436, 1.282901, -1.658531, 1, 0.7607843, 0, 1,
-1.142141, 0.7903624, 0.1839902, 1, 0.7686275, 0, 1,
-1.135308, -1.905694, -2.395978, 1, 0.772549, 0, 1,
-1.116819, -1.280783, -1.213148, 1, 0.7803922, 0, 1,
-1.115497, -0.8488915, -2.221397, 1, 0.7843137, 0, 1,
-1.113526, 0.6152791, -0.3991551, 1, 0.7921569, 0, 1,
-1.113466, -0.7106689, -3.071781, 1, 0.7960784, 0, 1,
-1.106372, 0.9138886, -2.245806, 1, 0.8039216, 0, 1,
-1.104189, -0.1864448, -2.304334, 1, 0.8117647, 0, 1,
-1.100703, -0.6744761, -3.441182, 1, 0.8156863, 0, 1,
-1.099876, 2.780585, 0.3845338, 1, 0.8235294, 0, 1,
-1.099244, -0.2348238, -1.918458, 1, 0.827451, 0, 1,
-1.098919, -1.636158, -2.128736, 1, 0.8352941, 0, 1,
-1.098354, -1.060983, -2.698225, 1, 0.8392157, 0, 1,
-1.095138, -2.107997, -2.546797, 1, 0.8470588, 0, 1,
-1.091738, 0.3217198, -2.056467, 1, 0.8509804, 0, 1,
-1.085181, -0.279766, -2.631351, 1, 0.8588235, 0, 1,
-1.082815, -1.354401, -3.305792, 1, 0.8627451, 0, 1,
-1.081582, -1.361418, -2.19445, 1, 0.8705882, 0, 1,
-1.079623, -1.499081, -2.315726, 1, 0.8745098, 0, 1,
-1.069991, 0.2829469, -2.154081, 1, 0.8823529, 0, 1,
-1.065488, 1.213735, 0.8969071, 1, 0.8862745, 0, 1,
-1.063864, 1.616677, -0.820234, 1, 0.8941177, 0, 1,
-1.059361, -0.5299995, -2.004448, 1, 0.8980392, 0, 1,
-1.052736, -0.95209, -2.736865, 1, 0.9058824, 0, 1,
-1.04881, -1.14964, -3.477307, 1, 0.9137255, 0, 1,
-1.046586, 0.847726, -0.8339722, 1, 0.9176471, 0, 1,
-1.046316, -1.372746, -3.100016, 1, 0.9254902, 0, 1,
-1.039998, 1.632525, -1.153222, 1, 0.9294118, 0, 1,
-1.034905, -0.7228102, -1.743206, 1, 0.9372549, 0, 1,
-1.024737, -1.841974, -3.314974, 1, 0.9411765, 0, 1,
-1.022014, -0.4314258, -2.280927, 1, 0.9490196, 0, 1,
-1.020392, -0.8482391, -2.605431, 1, 0.9529412, 0, 1,
-1.010049, -0.8059685, -1.995939, 1, 0.9607843, 0, 1,
-1.000965, -1.121254, -2.640702, 1, 0.9647059, 0, 1,
-0.9995007, 1.105167, -1.161256, 1, 0.972549, 0, 1,
-0.9961135, -0.4596067, -4.943165, 1, 0.9764706, 0, 1,
-0.9910136, 0.5668519, -1.024917, 1, 0.9843137, 0, 1,
-0.9802982, 1.517423, -0.3668864, 1, 0.9882353, 0, 1,
-0.9754428, 1.287586, 0.156018, 1, 0.9960784, 0, 1,
-0.9625924, -0.3111324, -1.381843, 0.9960784, 1, 0, 1,
-0.9579103, 0.8042673, -2.286183, 0.9921569, 1, 0, 1,
-0.9578781, 1.342593, -0.4622916, 0.9843137, 1, 0, 1,
-0.9418794, 1.630209, -0.0381936, 0.9803922, 1, 0, 1,
-0.9412763, 1.151615, -2.105291, 0.972549, 1, 0, 1,
-0.9390069, 1.749474, -1.603096, 0.9686275, 1, 0, 1,
-0.9386735, -1.003017, -1.591915, 0.9607843, 1, 0, 1,
-0.938061, 0.4719586, -2.480675, 0.9568627, 1, 0, 1,
-0.9379247, 0.9254697, -1.689818, 0.9490196, 1, 0, 1,
-0.9353832, 0.3775299, -2.111305, 0.945098, 1, 0, 1,
-0.9302499, 2.258593, 0.1010775, 0.9372549, 1, 0, 1,
-0.9283525, -1.758707, -1.93338, 0.9333333, 1, 0, 1,
-0.9211249, 1.144504, 0.6968366, 0.9254902, 1, 0, 1,
-0.9184328, 1.046247, -1.216078, 0.9215686, 1, 0, 1,
-0.9176815, -0.6079972, -1.672088, 0.9137255, 1, 0, 1,
-0.9115691, 0.3566671, -3.008483, 0.9098039, 1, 0, 1,
-0.911075, 0.8512892, -1.156355, 0.9019608, 1, 0, 1,
-0.9072986, -1.044766, -3.028695, 0.8941177, 1, 0, 1,
-0.9014227, 0.6041257, -1.388331, 0.8901961, 1, 0, 1,
-0.8988556, 2.124026, 0.0331335, 0.8823529, 1, 0, 1,
-0.8945955, -0.2736753, -2.369842, 0.8784314, 1, 0, 1,
-0.8835228, -1.251881, -4.101442, 0.8705882, 1, 0, 1,
-0.8776863, -0.5187991, -1.079693, 0.8666667, 1, 0, 1,
-0.8772537, -0.4051647, -1.694154, 0.8588235, 1, 0, 1,
-0.8744777, -0.4181646, -2.91412, 0.854902, 1, 0, 1,
-0.8716491, -0.1431465, 0.1655457, 0.8470588, 1, 0, 1,
-0.8680761, -1.655442, -2.226474, 0.8431373, 1, 0, 1,
-0.856768, 1.012586, -0.6422902, 0.8352941, 1, 0, 1,
-0.8494722, -2.808631, -2.216221, 0.8313726, 1, 0, 1,
-0.8491026, 1.133849, -0.5937408, 0.8235294, 1, 0, 1,
-0.8487403, -0.8221221, -1.589144, 0.8196079, 1, 0, 1,
-0.8468002, -1.564423, -2.744336, 0.8117647, 1, 0, 1,
-0.8428069, -0.6405054, -2.159414, 0.8078431, 1, 0, 1,
-0.8424273, -1.045318, -3.902914, 0.8, 1, 0, 1,
-0.8293262, -0.4528774, -2.458767, 0.7921569, 1, 0, 1,
-0.8262244, 0.09843547, -2.654288, 0.7882353, 1, 0, 1,
-0.8240857, -1.528742, -2.118181, 0.7803922, 1, 0, 1,
-0.8223161, -1.299057, -2.033024, 0.7764706, 1, 0, 1,
-0.8203642, -0.2760393, -1.610519, 0.7686275, 1, 0, 1,
-0.8200367, -0.2977088, -3.105957, 0.7647059, 1, 0, 1,
-0.817064, 0.2322796, -0.2382001, 0.7568628, 1, 0, 1,
-0.8168976, -0.3892857, -3.082686, 0.7529412, 1, 0, 1,
-0.8038601, 0.07231994, -0.9822543, 0.7450981, 1, 0, 1,
-0.7954097, 0.1223926, -2.499414, 0.7411765, 1, 0, 1,
-0.7948563, -0.3375224, -3.191749, 0.7333333, 1, 0, 1,
-0.7933247, -1.744339, -3.598074, 0.7294118, 1, 0, 1,
-0.790456, 0.6037092, -1.117669, 0.7215686, 1, 0, 1,
-0.7841675, -0.3273246, -1.895724, 0.7176471, 1, 0, 1,
-0.7833267, 2.332014, 0.3534612, 0.7098039, 1, 0, 1,
-0.7826077, -0.2960481, -2.365304, 0.7058824, 1, 0, 1,
-0.7791464, -1.731313, -1.161679, 0.6980392, 1, 0, 1,
-0.7668116, 0.4466029, -0.0446832, 0.6901961, 1, 0, 1,
-0.7662588, -0.5037451, -3.052424, 0.6862745, 1, 0, 1,
-0.7606198, -0.641202, -1.08433, 0.6784314, 1, 0, 1,
-0.7595006, 0.1836875, -0.791624, 0.6745098, 1, 0, 1,
-0.7591885, -1.297044, -5.225067, 0.6666667, 1, 0, 1,
-0.7581163, 2.439074, -0.06642715, 0.6627451, 1, 0, 1,
-0.7568688, 0.3289236, -0.2844639, 0.654902, 1, 0, 1,
-0.7524014, -0.2997617, -0.6976789, 0.6509804, 1, 0, 1,
-0.7496899, 0.4464718, -1.604587, 0.6431373, 1, 0, 1,
-0.7444931, -0.4777593, -1.515174, 0.6392157, 1, 0, 1,
-0.7405144, 0.7282165, -2.28057, 0.6313726, 1, 0, 1,
-0.733402, 0.1596241, -0.04373151, 0.627451, 1, 0, 1,
-0.7330962, 1.017703, -0.5965439, 0.6196079, 1, 0, 1,
-0.7304999, -0.2182984, -2.472531, 0.6156863, 1, 0, 1,
-0.7283431, 0.2984515, -2.157826, 0.6078432, 1, 0, 1,
-0.7237229, 2.067036, -0.6203204, 0.6039216, 1, 0, 1,
-0.7236378, 0.2728914, -1.046772, 0.5960785, 1, 0, 1,
-0.7205443, -0.2549365, -1.109815, 0.5882353, 1, 0, 1,
-0.7186169, -2.547535, -2.679342, 0.5843138, 1, 0, 1,
-0.7178678, 1.40455, -0.6936204, 0.5764706, 1, 0, 1,
-0.716183, -0.4021266, -3.27062, 0.572549, 1, 0, 1,
-0.7116155, -0.7072214, -4.507926, 0.5647059, 1, 0, 1,
-0.7107567, -0.8919122, -2.344873, 0.5607843, 1, 0, 1,
-0.6923968, -0.8970739, -0.7753657, 0.5529412, 1, 0, 1,
-0.68949, -1.474616, -0.6797822, 0.5490196, 1, 0, 1,
-0.6894639, 0.954482, 0.7860893, 0.5411765, 1, 0, 1,
-0.682295, -0.5626319, -1.393124, 0.5372549, 1, 0, 1,
-0.6773576, 0.6273381, -2.216052, 0.5294118, 1, 0, 1,
-0.6772208, -0.6514699, -2.537966, 0.5254902, 1, 0, 1,
-0.6758412, -0.2138675, -1.985972, 0.5176471, 1, 0, 1,
-0.6741725, 1.049612, -1.093241, 0.5137255, 1, 0, 1,
-0.6731068, 1.053834, -0.4252923, 0.5058824, 1, 0, 1,
-0.6721002, 1.552297, 0.6070395, 0.5019608, 1, 0, 1,
-0.6720454, -0.3476006, -0.6629245, 0.4941176, 1, 0, 1,
-0.6684514, 0.4534568, 0.6134624, 0.4862745, 1, 0, 1,
-0.6632301, -1.544947, -2.527484, 0.4823529, 1, 0, 1,
-0.6593081, -0.5521734, -1.423883, 0.4745098, 1, 0, 1,
-0.657931, -1.73291, -3.64084, 0.4705882, 1, 0, 1,
-0.6575655, -1.281952, -2.002194, 0.4627451, 1, 0, 1,
-0.6560622, 0.7722803, 0.182605, 0.4588235, 1, 0, 1,
-0.655194, 0.5843584, -1.047182, 0.4509804, 1, 0, 1,
-0.6540236, 0.2793567, -2.029121, 0.4470588, 1, 0, 1,
-0.649848, 0.5336738, -3.574801, 0.4392157, 1, 0, 1,
-0.6454198, 0.6675214, -1.094333, 0.4352941, 1, 0, 1,
-0.6376219, 0.2068978, -2.661931, 0.427451, 1, 0, 1,
-0.6374571, -1.219081, -4.42479, 0.4235294, 1, 0, 1,
-0.6265967, 0.6917486, 0.8524603, 0.4156863, 1, 0, 1,
-0.6254343, 1.438595, 0.4093068, 0.4117647, 1, 0, 1,
-0.6221243, -0.4260404, -3.66647, 0.4039216, 1, 0, 1,
-0.6184961, -0.2440525, -1.388031, 0.3960784, 1, 0, 1,
-0.6160872, 0.7257618, 0.2640416, 0.3921569, 1, 0, 1,
-0.6091114, 1.637759, -0.2700062, 0.3843137, 1, 0, 1,
-0.60483, -0.956508, -1.701016, 0.3803922, 1, 0, 1,
-0.5978682, -2.88911, -2.125978, 0.372549, 1, 0, 1,
-0.5940421, -0.8785977, -4.968821, 0.3686275, 1, 0, 1,
-0.5927923, -0.2438408, -1.476171, 0.3607843, 1, 0, 1,
-0.5894383, 0.2463712, -1.546272, 0.3568628, 1, 0, 1,
-0.5881741, -0.02350872, -1.303109, 0.3490196, 1, 0, 1,
-0.5878256, 0.4429892, -1.030698, 0.345098, 1, 0, 1,
-0.5836908, 1.731252, -1.632161, 0.3372549, 1, 0, 1,
-0.5795358, -0.3173892, -2.329451, 0.3333333, 1, 0, 1,
-0.5784752, 0.1545003, -0.4148545, 0.3254902, 1, 0, 1,
-0.5765857, 0.1131831, -1.295711, 0.3215686, 1, 0, 1,
-0.5744399, 1.076596, -1.187483, 0.3137255, 1, 0, 1,
-0.5709927, -0.6469892, -2.371387, 0.3098039, 1, 0, 1,
-0.5672598, -0.7525491, -2.835043, 0.3019608, 1, 0, 1,
-0.5658094, 0.3184214, -2.222593, 0.2941177, 1, 0, 1,
-0.5636464, -1.505524, -3.912693, 0.2901961, 1, 0, 1,
-0.5625045, 0.5750419, -0.9065375, 0.282353, 1, 0, 1,
-0.5589865, 1.123408, 0.7858378, 0.2784314, 1, 0, 1,
-0.557409, 1.35696, -1.133545, 0.2705882, 1, 0, 1,
-0.5474156, -0.2866618, -1.485317, 0.2666667, 1, 0, 1,
-0.5464215, 0.02071062, -1.449285, 0.2588235, 1, 0, 1,
-0.5441403, -0.1874032, -0.3093642, 0.254902, 1, 0, 1,
-0.5405918, -0.440154, -1.364784, 0.2470588, 1, 0, 1,
-0.5303128, 0.8919962, -0.5511457, 0.2431373, 1, 0, 1,
-0.5289827, -0.6264172, -3.381193, 0.2352941, 1, 0, 1,
-0.5198931, 0.330496, -1.324373, 0.2313726, 1, 0, 1,
-0.5143905, 0.659272, -0.8411836, 0.2235294, 1, 0, 1,
-0.5086637, 0.01671231, -0.3720067, 0.2196078, 1, 0, 1,
-0.5078548, -0.6400054, -2.855564, 0.2117647, 1, 0, 1,
-0.5060639, 1.060044, -0.062466, 0.2078431, 1, 0, 1,
-0.5049009, -1.465059, -4.737775, 0.2, 1, 0, 1,
-0.5023106, -1.844215, -2.219998, 0.1921569, 1, 0, 1,
-0.5021117, -1.160761, -3.702208, 0.1882353, 1, 0, 1,
-0.5002183, 2.480514, -0.3673048, 0.1803922, 1, 0, 1,
-0.4987482, -0.3698854, -3.300598, 0.1764706, 1, 0, 1,
-0.4855821, -0.7741713, -2.2475, 0.1686275, 1, 0, 1,
-0.4855478, 1.794368, -0.3254132, 0.1647059, 1, 0, 1,
-0.4839391, 0.4143074, 0.707104, 0.1568628, 1, 0, 1,
-0.4789617, -1.235259, -2.721036, 0.1529412, 1, 0, 1,
-0.4672635, -0.9065707, -1.662087, 0.145098, 1, 0, 1,
-0.4662117, -2.335061, -2.105581, 0.1411765, 1, 0, 1,
-0.4660019, 0.888381, 0.04454395, 0.1333333, 1, 0, 1,
-0.4625973, -0.2144495, -2.857414, 0.1294118, 1, 0, 1,
-0.4514993, -0.5070611, -2.621149, 0.1215686, 1, 0, 1,
-0.4513609, 1.829788, -0.242721, 0.1176471, 1, 0, 1,
-0.450489, -0.8321332, -3.740471, 0.1098039, 1, 0, 1,
-0.4482783, -0.3233721, -2.939785, 0.1058824, 1, 0, 1,
-0.4464101, 0.3999506, -1.034366, 0.09803922, 1, 0, 1,
-0.4437615, -0.2633341, -3.693944, 0.09019608, 1, 0, 1,
-0.4420505, -0.8963306, -2.305984, 0.08627451, 1, 0, 1,
-0.4403162, 0.2215006, -1.176507, 0.07843138, 1, 0, 1,
-0.4398772, -1.979658, -2.54633, 0.07450981, 1, 0, 1,
-0.4392334, -0.3354358, -2.578642, 0.06666667, 1, 0, 1,
-0.4361064, 1.096887, 0.4583324, 0.0627451, 1, 0, 1,
-0.4354263, -0.1007829, -1.82766, 0.05490196, 1, 0, 1,
-0.4312172, 0.4208324, -1.105982, 0.05098039, 1, 0, 1,
-0.4293711, 0.7197599, -0.456732, 0.04313726, 1, 0, 1,
-0.4289539, 1.317151, 0.8681386, 0.03921569, 1, 0, 1,
-0.4283999, -0.9582214, -2.628544, 0.03137255, 1, 0, 1,
-0.4257128, 0.8080795, -0.8103559, 0.02745098, 1, 0, 1,
-0.425049, 0.005248368, -3.361555, 0.01960784, 1, 0, 1,
-0.4209821, -1.495776, -2.277269, 0.01568628, 1, 0, 1,
-0.4162512, 1.43837, 0.3313601, 0.007843138, 1, 0, 1,
-0.4159391, -0.8726376, -4.675529, 0.003921569, 1, 0, 1,
-0.4151567, -0.1682059, -2.864158, 0, 1, 0.003921569, 1,
-0.4140114, 1.090875, -0.6139947, 0, 1, 0.01176471, 1,
-0.412708, -0.8971629, -3.518059, 0, 1, 0.01568628, 1,
-0.4118744, 0.4606412, -0.6408064, 0, 1, 0.02352941, 1,
-0.4036777, 1.442504, 1.330142, 0, 1, 0.02745098, 1,
-0.401942, -0.5488241, -2.054801, 0, 1, 0.03529412, 1,
-0.3950516, 1.907799, -0.1438677, 0, 1, 0.03921569, 1,
-0.3931534, 0.102471, -0.01969818, 0, 1, 0.04705882, 1,
-0.3923584, 0.611103, -1.664971, 0, 1, 0.05098039, 1,
-0.3908825, 0.385469, 0.4269884, 0, 1, 0.05882353, 1,
-0.3895638, -1.674849, -1.147459, 0, 1, 0.0627451, 1,
-0.3876374, -0.121145, -2.160468, 0, 1, 0.07058824, 1,
-0.3853307, -0.9778715, -3.368424, 0, 1, 0.07450981, 1,
-0.3799676, 0.5830001, 0.7825763, 0, 1, 0.08235294, 1,
-0.3782402, 0.1955496, 1.104933, 0, 1, 0.08627451, 1,
-0.3752608, 0.2952652, -0.9498686, 0, 1, 0.09411765, 1,
-0.3746556, 0.7185218, -0.5826833, 0, 1, 0.1019608, 1,
-0.3731927, 0.5211329, -0.9683606, 0, 1, 0.1058824, 1,
-0.3703896, 0.6287336, -0.1398515, 0, 1, 0.1137255, 1,
-0.3703414, -0.2227781, -0.3012536, 0, 1, 0.1176471, 1,
-0.3674358, 0.47216, -1.328332, 0, 1, 0.1254902, 1,
-0.3633256, -0.03260874, -1.930364, 0, 1, 0.1294118, 1,
-0.3632352, 0.9119748, 0.6616774, 0, 1, 0.1372549, 1,
-0.3611201, -0.7845138, -2.22547, 0, 1, 0.1411765, 1,
-0.3563176, 1.525674, -1.799071, 0, 1, 0.1490196, 1,
-0.3558473, -3.098759, -3.995634, 0, 1, 0.1529412, 1,
-0.3526497, 0.3224595, -1.240937, 0, 1, 0.1607843, 1,
-0.3516465, -0.2497309, -0.4566006, 0, 1, 0.1647059, 1,
-0.3501267, -1.176723, -3.501783, 0, 1, 0.172549, 1,
-0.3436664, -0.09241702, -1.121857, 0, 1, 0.1764706, 1,
-0.339559, -0.9715925, -4.450954, 0, 1, 0.1843137, 1,
-0.3348978, 0.04297608, 0.3224663, 0, 1, 0.1882353, 1,
-0.3310759, -0.8109379, -4.011044, 0, 1, 0.1960784, 1,
-0.3237382, 0.8408119, -0.7131514, 0, 1, 0.2039216, 1,
-0.3195543, -0.688758, -2.595541, 0, 1, 0.2078431, 1,
-0.3183985, -0.01829381, -0.008888688, 0, 1, 0.2156863, 1,
-0.313772, 0.9496377, -2.033188, 0, 1, 0.2196078, 1,
-0.3131545, 0.2340325, -0.7593549, 0, 1, 0.227451, 1,
-0.3094361, 0.8584716, -0.262594, 0, 1, 0.2313726, 1,
-0.3091958, 1.50992, -0.9662418, 0, 1, 0.2392157, 1,
-0.3051645, 0.3167141, -0.4973887, 0, 1, 0.2431373, 1,
-0.3041894, 0.689133, -0.6085362, 0, 1, 0.2509804, 1,
-0.2974704, -0.09234692, -1.528167, 0, 1, 0.254902, 1,
-0.2967587, -1.137062, -2.427001, 0, 1, 0.2627451, 1,
-0.2956474, -0.316468, -1.684062, 0, 1, 0.2666667, 1,
-0.2938966, 0.601338, -1.118209, 0, 1, 0.2745098, 1,
-0.2916087, 1.309662, -2.563163, 0, 1, 0.2784314, 1,
-0.2908597, -0.9473607, -4.107411, 0, 1, 0.2862745, 1,
-0.2893281, -1.474116, -0.8680595, 0, 1, 0.2901961, 1,
-0.2828831, 0.1190191, -2.300627, 0, 1, 0.2980392, 1,
-0.2805493, 0.1779982, -1.721241, 0, 1, 0.3058824, 1,
-0.2799693, 0.630325, -1.326645, 0, 1, 0.3098039, 1,
-0.2796872, -0.8541897, -1.766334, 0, 1, 0.3176471, 1,
-0.2765055, 0.06183264, -0.9754704, 0, 1, 0.3215686, 1,
-0.269296, 0.3883767, -0.2927339, 0, 1, 0.3294118, 1,
-0.2609674, -0.6352829, -3.62854, 0, 1, 0.3333333, 1,
-0.2609385, 0.06038143, -0.00973886, 0, 1, 0.3411765, 1,
-0.2598366, 1.708121, -0.2035702, 0, 1, 0.345098, 1,
-0.2587418, -1.435899, -2.213392, 0, 1, 0.3529412, 1,
-0.2581765, -0.3269943, -2.187361, 0, 1, 0.3568628, 1,
-0.2547701, -0.633038, -3.438989, 0, 1, 0.3647059, 1,
-0.2542399, -0.3551602, -3.370301, 0, 1, 0.3686275, 1,
-0.2542343, 0.5544699, -0.8679195, 0, 1, 0.3764706, 1,
-0.2489055, 0.9047389, 0.1006481, 0, 1, 0.3803922, 1,
-0.2486342, -0.2316059, -2.419502, 0, 1, 0.3882353, 1,
-0.2429432, 0.3132947, -0.3941241, 0, 1, 0.3921569, 1,
-0.2418712, 2.11222, 0.290597, 0, 1, 0.4, 1,
-0.2338946, -0.5019975, -2.492791, 0, 1, 0.4078431, 1,
-0.2276253, 0.07994468, -0.9260386, 0, 1, 0.4117647, 1,
-0.2241092, -0.7874574, -1.967241, 0, 1, 0.4196078, 1,
-0.2187383, 0.3589988, -0.6743668, 0, 1, 0.4235294, 1,
-0.212074, -1.167187, -3.874226, 0, 1, 0.4313726, 1,
-0.2100063, -0.5814065, -2.271414, 0, 1, 0.4352941, 1,
-0.2079168, -0.8455948, -2.121659, 0, 1, 0.4431373, 1,
-0.2078873, 0.09917022, -3.228484, 0, 1, 0.4470588, 1,
-0.2077661, -0.04093736, -2.070797, 0, 1, 0.454902, 1,
-0.2045477, 1.267955, -1.79913, 0, 1, 0.4588235, 1,
-0.2026623, 1.198831, 0.9365999, 0, 1, 0.4666667, 1,
-0.2001048, -1.257714, -2.905316, 0, 1, 0.4705882, 1,
-0.1920617, 1.807109, 1.182007, 0, 1, 0.4784314, 1,
-0.1886303, -0.294922, -3.111839, 0, 1, 0.4823529, 1,
-0.1863897, 0.4180457, 0.5596631, 0, 1, 0.4901961, 1,
-0.1863483, 0.1866442, -0.5214097, 0, 1, 0.4941176, 1,
-0.1851415, -1.138692, -3.784052, 0, 1, 0.5019608, 1,
-0.1842107, 0.3862982, 1.527317, 0, 1, 0.509804, 1,
-0.1780209, 0.3938593, -1.618557, 0, 1, 0.5137255, 1,
-0.1777954, 0.07263384, -2.708194, 0, 1, 0.5215687, 1,
-0.1760562, -0.1980604, -1.788134, 0, 1, 0.5254902, 1,
-0.1668211, -0.7440519, -2.737208, 0, 1, 0.5333334, 1,
-0.1649684, 0.1768857, 0.1566, 0, 1, 0.5372549, 1,
-0.1637161, 0.1271851, -1.544947, 0, 1, 0.5450981, 1,
-0.15682, -0.9165088, -2.83666, 0, 1, 0.5490196, 1,
-0.1474241, 0.1054649, 0.1793493, 0, 1, 0.5568628, 1,
-0.1474078, 0.6762045, -0.2618034, 0, 1, 0.5607843, 1,
-0.1434631, -0.6106435, -2.680784, 0, 1, 0.5686275, 1,
-0.1429274, 1.215383, 1.66702, 0, 1, 0.572549, 1,
-0.142252, -0.3319716, -3.625686, 0, 1, 0.5803922, 1,
-0.1388726, 1.062823, -2.286425, 0, 1, 0.5843138, 1,
-0.1355346, -0.06141973, 0.347886, 0, 1, 0.5921569, 1,
-0.1330341, 0.1982888, 0.01039915, 0, 1, 0.5960785, 1,
-0.1235254, -0.1178393, -2.12602, 0, 1, 0.6039216, 1,
-0.1167407, -1.70347, -2.414824, 0, 1, 0.6117647, 1,
-0.1155806, -1.099144, -3.876994, 0, 1, 0.6156863, 1,
-0.1148844, 1.421064, -0.4458623, 0, 1, 0.6235294, 1,
-0.1070118, -0.2360792, -1.727141, 0, 1, 0.627451, 1,
-0.106442, -0.9826867, -1.162111, 0, 1, 0.6352941, 1,
-0.105796, 0.1387318, 0.04723728, 0, 1, 0.6392157, 1,
-0.1051612, 0.2889124, 0.9017698, 0, 1, 0.6470588, 1,
-0.1039527, -2.001255, -3.087041, 0, 1, 0.6509804, 1,
-0.09469895, -0.3371394, -1.40686, 0, 1, 0.6588235, 1,
-0.09218227, 1.683133, 1.178441, 0, 1, 0.6627451, 1,
-0.09211121, -0.134168, -4.643923, 0, 1, 0.6705883, 1,
-0.0892163, -0.1774631, -3.718487, 0, 1, 0.6745098, 1,
-0.0890573, -0.4105753, -4.273394, 0, 1, 0.682353, 1,
-0.08748297, -0.1486009, -1.576069, 0, 1, 0.6862745, 1,
-0.0828352, 0.4045561, 1.041488, 0, 1, 0.6941177, 1,
-0.08139817, 2.125875, -0.2992511, 0, 1, 0.7019608, 1,
-0.08088629, 1.741695, 0.1419904, 0, 1, 0.7058824, 1,
-0.08081997, -0.5835602, -2.842308, 0, 1, 0.7137255, 1,
-0.07581177, 0.7287158, 0.3411104, 0, 1, 0.7176471, 1,
-0.06542189, 0.08603502, -0.3498405, 0, 1, 0.7254902, 1,
-0.06179196, -0.9422123, -4.660704, 0, 1, 0.7294118, 1,
-0.06055685, -0.4582011, -3.445769, 0, 1, 0.7372549, 1,
-0.05872376, -0.09181959, -4.311361, 0, 1, 0.7411765, 1,
-0.05823622, -1.371994, -3.297058, 0, 1, 0.7490196, 1,
-0.05392417, 1.664772, -0.01667268, 0, 1, 0.7529412, 1,
-0.05175424, 0.6637009, -0.4302586, 0, 1, 0.7607843, 1,
-0.04850214, -1.204836, -2.297809, 0, 1, 0.7647059, 1,
-0.04794244, 0.8099071, 0.3215874, 0, 1, 0.772549, 1,
-0.046073, -0.8372429, -2.939907, 0, 1, 0.7764706, 1,
-0.04410899, 0.185166, 0.5861441, 0, 1, 0.7843137, 1,
-0.04018356, 1.350267, 0.4253827, 0, 1, 0.7882353, 1,
-0.03999365, -0.1621991, -4.590002, 0, 1, 0.7960784, 1,
-0.03116232, -0.09058148, -5.509853, 0, 1, 0.8039216, 1,
-0.02253735, -1.851384, -1.908646, 0, 1, 0.8078431, 1,
-0.01612947, 2.156322, 0.9085347, 0, 1, 0.8156863, 1,
-0.01371682, -0.4181828, -2.242575, 0, 1, 0.8196079, 1,
-0.01288495, 0.4410342, -1.21486, 0, 1, 0.827451, 1,
-0.008370766, 0.3041334, -0.637269, 0, 1, 0.8313726, 1,
-0.007718543, -0.5760949, -2.012546, 0, 1, 0.8392157, 1,
-0.007515925, 0.8342132, 2.205993, 0, 1, 0.8431373, 1,
-0.00511844, -0.08875152, -2.378821, 0, 1, 0.8509804, 1,
-0.001749682, -1.053101, -3.278413, 0, 1, 0.854902, 1,
0.00303918, -0.03017775, 4.455645, 0, 1, 0.8627451, 1,
0.00304919, -0.5749643, 2.977212, 0, 1, 0.8666667, 1,
0.003235299, 0.262856, -0.2062768, 0, 1, 0.8745098, 1,
0.007400039, -1.737766, 1.738544, 0, 1, 0.8784314, 1,
0.009482673, -1.82332, 2.023035, 0, 1, 0.8862745, 1,
0.01156937, -0.6206671, 1.635317, 0, 1, 0.8901961, 1,
0.02378459, -0.5218183, 2.862724, 0, 1, 0.8980392, 1,
0.02507219, 1.563696, 1.131901, 0, 1, 0.9058824, 1,
0.02594142, -0.3924543, 2.717608, 0, 1, 0.9098039, 1,
0.03051249, -0.04245945, 3.207465, 0, 1, 0.9176471, 1,
0.03214798, -0.5492101, 3.907845, 0, 1, 0.9215686, 1,
0.03340765, 0.8394806, 0.8195989, 0, 1, 0.9294118, 1,
0.03692083, 1.317169, -0.357465, 0, 1, 0.9333333, 1,
0.03958961, -0.3411708, 3.721998, 0, 1, 0.9411765, 1,
0.04043967, -0.2610624, 2.490818, 0, 1, 0.945098, 1,
0.04112386, -0.1131131, 5.671028, 0, 1, 0.9529412, 1,
0.04203757, -0.05699201, 2.935891, 0, 1, 0.9568627, 1,
0.04236272, 0.02703835, 1.858597, 0, 1, 0.9647059, 1,
0.04252511, -0.8096499, 3.128482, 0, 1, 0.9686275, 1,
0.04710564, -1.132497, 3.258298, 0, 1, 0.9764706, 1,
0.04959657, 0.3849732, -0.8164452, 0, 1, 0.9803922, 1,
0.05789204, -0.07932295, 2.628392, 0, 1, 0.9882353, 1,
0.05976359, 0.4275461, 1.347163, 0, 1, 0.9921569, 1,
0.06033742, 0.1918705, -0.8449693, 0, 1, 1, 1,
0.06486014, -0.1371143, 4.274212, 0, 0.9921569, 1, 1,
0.06518577, 0.312852, 0.5288571, 0, 0.9882353, 1, 1,
0.0658122, 1.578589, -0.5049841, 0, 0.9803922, 1, 1,
0.06698506, -0.1469247, 3.779976, 0, 0.9764706, 1, 1,
0.0676626, 0.2801446, 0.2162514, 0, 0.9686275, 1, 1,
0.06821571, 1.586348, 1.420374, 0, 0.9647059, 1, 1,
0.07134485, -0.5583268, 2.565517, 0, 0.9568627, 1, 1,
0.07243061, 0.3878802, 0.06462897, 0, 0.9529412, 1, 1,
0.0744368, 0.6591309, 0.2031851, 0, 0.945098, 1, 1,
0.07688989, 0.8967516, -2.164318, 0, 0.9411765, 1, 1,
0.07791787, 0.4095992, -0.1624228, 0, 0.9333333, 1, 1,
0.0781773, -0.1840171, 1.952613, 0, 0.9294118, 1, 1,
0.08056783, 0.4151176, 0.8205009, 0, 0.9215686, 1, 1,
0.08081166, 1.387208, -0.25016, 0, 0.9176471, 1, 1,
0.0816521, 0.4041726, -1.049617, 0, 0.9098039, 1, 1,
0.08312496, 0.3371406, -0.7536707, 0, 0.9058824, 1, 1,
0.08820518, -1.56458, 3.782734, 0, 0.8980392, 1, 1,
0.08961643, 1.092587, 2.112285, 0, 0.8901961, 1, 1,
0.09228598, -1.455706, 4.530271, 0, 0.8862745, 1, 1,
0.09368322, -0.6192183, 2.713483, 0, 0.8784314, 1, 1,
0.09374575, 1.108036, 0.1858309, 0, 0.8745098, 1, 1,
0.09442674, 0.7797496, 0.03100303, 0, 0.8666667, 1, 1,
0.09514648, 1.029069, 0.620375, 0, 0.8627451, 1, 1,
0.09875268, 1.587098, 1.586836, 0, 0.854902, 1, 1,
0.1018302, -0.9549136, 3.494878, 0, 0.8509804, 1, 1,
0.1018419, 1.258441, 0.06502087, 0, 0.8431373, 1, 1,
0.1026833, -3.241035, 3.758943, 0, 0.8392157, 1, 1,
0.1035048, 0.701055, -1.144504, 0, 0.8313726, 1, 1,
0.1059166, 1.239181, 2.021849, 0, 0.827451, 1, 1,
0.1062835, -0.3357544, 2.596246, 0, 0.8196079, 1, 1,
0.112416, -0.9998901, 2.887845, 0, 0.8156863, 1, 1,
0.1130418, 1.330873, 0.1659282, 0, 0.8078431, 1, 1,
0.1152403, -0.7350626, 2.174965, 0, 0.8039216, 1, 1,
0.1169893, 1.189303, -0.1445031, 0, 0.7960784, 1, 1,
0.1175634, 1.444401, 0.1733232, 0, 0.7882353, 1, 1,
0.1230199, -1.31396, 3.608775, 0, 0.7843137, 1, 1,
0.1278032, 1.604419, -0.3211668, 0, 0.7764706, 1, 1,
0.1310003, 0.1243616, 0.2390638, 0, 0.772549, 1, 1,
0.132721, 0.01263196, -0.1217332, 0, 0.7647059, 1, 1,
0.1359551, 1.137865, 0.685522, 0, 0.7607843, 1, 1,
0.1373383, 2.257963, 0.3071584, 0, 0.7529412, 1, 1,
0.1385119, -0.6252878, 5.289711, 0, 0.7490196, 1, 1,
0.1409858, -0.3607647, 2.217429, 0, 0.7411765, 1, 1,
0.1444511, -2.367309, 2.542593, 0, 0.7372549, 1, 1,
0.1562473, 0.3078108, -0.1994274, 0, 0.7294118, 1, 1,
0.1576231, -1.18294, 2.435763, 0, 0.7254902, 1, 1,
0.1576982, -1.339457, 4.133961, 0, 0.7176471, 1, 1,
0.1597515, 0.1628845, 1.078269, 0, 0.7137255, 1, 1,
0.161319, -2.114647, 3.694205, 0, 0.7058824, 1, 1,
0.1615618, -0.2146171, 1.954478, 0, 0.6980392, 1, 1,
0.1636362, 0.0854134, 1.019204, 0, 0.6941177, 1, 1,
0.1651934, -1.473081, 3.103835, 0, 0.6862745, 1, 1,
0.1729942, 0.6382409, 2.053746, 0, 0.682353, 1, 1,
0.1748216, -0.7188958, 2.831387, 0, 0.6745098, 1, 1,
0.1758896, 0.9644573, 1.381582, 0, 0.6705883, 1, 1,
0.1771741, 3.240905, -0.7765228, 0, 0.6627451, 1, 1,
0.181212, -1.962543, 2.572076, 0, 0.6588235, 1, 1,
0.1827093, 1.011563, 0.4050843, 0, 0.6509804, 1, 1,
0.1828578, 0.4597398, 1.798888, 0, 0.6470588, 1, 1,
0.1853159, -0.1936276, 2.007926, 0, 0.6392157, 1, 1,
0.1873498, 0.2748356, 0.6685187, 0, 0.6352941, 1, 1,
0.1896761, -0.1199224, 2.681998, 0, 0.627451, 1, 1,
0.1901264, 0.1505767, 2.433908, 0, 0.6235294, 1, 1,
0.1924685, 0.1394723, 0.2820393, 0, 0.6156863, 1, 1,
0.1926615, -0.8877983, 2.371328, 0, 0.6117647, 1, 1,
0.196853, -0.2268645, 0.8105649, 0, 0.6039216, 1, 1,
0.1999544, -1.225811, 3.013013, 0, 0.5960785, 1, 1,
0.2034421, 0.6993764, 0.02657734, 0, 0.5921569, 1, 1,
0.20407, -0.2949837, 3.206694, 0, 0.5843138, 1, 1,
0.207104, -0.1737197, 2.439932, 0, 0.5803922, 1, 1,
0.2112537, -1.927734, 3.170837, 0, 0.572549, 1, 1,
0.2132634, 0.9510723, 1.079435, 0, 0.5686275, 1, 1,
0.2133893, -1.493818, 3.523926, 0, 0.5607843, 1, 1,
0.213493, 0.1257666, 2.177521, 0, 0.5568628, 1, 1,
0.2154224, 0.3361436, 1.014893, 0, 0.5490196, 1, 1,
0.2164205, -0.546009, 2.845809, 0, 0.5450981, 1, 1,
0.2183294, 0.1796685, 0.406808, 0, 0.5372549, 1, 1,
0.2213127, -0.7393, 4.18663, 0, 0.5333334, 1, 1,
0.2259122, -1.014943, 1.02803, 0, 0.5254902, 1, 1,
0.2261384, -1.368626, 2.754196, 0, 0.5215687, 1, 1,
0.2261536, 0.06615399, 2.079282, 0, 0.5137255, 1, 1,
0.2317712, 0.2202344, 1.605584, 0, 0.509804, 1, 1,
0.2390084, 1.022389, -0.7087129, 0, 0.5019608, 1, 1,
0.2421826, -1.293335, 3.418703, 0, 0.4941176, 1, 1,
0.2427265, -0.7291689, 1.965939, 0, 0.4901961, 1, 1,
0.243869, 1.429766, 0.1905191, 0, 0.4823529, 1, 1,
0.2492598, -0.8819585, 3.512957, 0, 0.4784314, 1, 1,
0.2496734, -1.224392, 3.521233, 0, 0.4705882, 1, 1,
0.2498856, -0.2027402, 3.232864, 0, 0.4666667, 1, 1,
0.2509218, -0.1359947, 4.332711, 0, 0.4588235, 1, 1,
0.2554934, -1.213654, 4.410436, 0, 0.454902, 1, 1,
0.2558635, 0.777516, -0.4856035, 0, 0.4470588, 1, 1,
0.2569752, 1.898162, 0.6329094, 0, 0.4431373, 1, 1,
0.2599238, 1.615605, 0.5625926, 0, 0.4352941, 1, 1,
0.2614646, -0.3853015, 3.179121, 0, 0.4313726, 1, 1,
0.262051, 0.5471744, 0.1235523, 0, 0.4235294, 1, 1,
0.2628366, -0.8358575, 3.566368, 0, 0.4196078, 1, 1,
0.2692014, -0.2155646, 1.888278, 0, 0.4117647, 1, 1,
0.277959, 2.095218, 0.3461405, 0, 0.4078431, 1, 1,
0.2785212, 0.2595611, 1.489139, 0, 0.4, 1, 1,
0.284553, -1.034166, 2.159777, 0, 0.3921569, 1, 1,
0.2859994, 0.6070065, 0.5013911, 0, 0.3882353, 1, 1,
0.2863449, -1.258944, 6.21059, 0, 0.3803922, 1, 1,
0.2873794, 0.7801014, 1.944489, 0, 0.3764706, 1, 1,
0.2969717, 1.229909, -0.3654154, 0, 0.3686275, 1, 1,
0.2984261, 0.2351919, 1.261372, 0, 0.3647059, 1, 1,
0.3036571, 0.1870867, 2.500486, 0, 0.3568628, 1, 1,
0.3078248, -3.142687, 1.949641, 0, 0.3529412, 1, 1,
0.3107316, 0.5015196, 1.887814, 0, 0.345098, 1, 1,
0.3123483, -1.122314, 2.788863, 0, 0.3411765, 1, 1,
0.3127714, -1.240915, 2.551261, 0, 0.3333333, 1, 1,
0.3130313, 1.853838, 1.653568, 0, 0.3294118, 1, 1,
0.3180026, -1.588555, 2.406721, 0, 0.3215686, 1, 1,
0.3193623, 0.4556717, 0.3998549, 0, 0.3176471, 1, 1,
0.3234139, 0.8448625, 0.7393275, 0, 0.3098039, 1, 1,
0.3287304, -0.1760469, 3.492741, 0, 0.3058824, 1, 1,
0.3298736, 0.7831197, 0.5650229, 0, 0.2980392, 1, 1,
0.3309281, -0.6530298, 3.313452, 0, 0.2901961, 1, 1,
0.3315993, -1.326222, 3.159107, 0, 0.2862745, 1, 1,
0.3332224, 1.03916, 2.473088, 0, 0.2784314, 1, 1,
0.3346288, -0.9594362, 2.168604, 0, 0.2745098, 1, 1,
0.3360655, 1.477102, 1.081816, 0, 0.2666667, 1, 1,
0.3362246, -1.612258, 3.975086, 0, 0.2627451, 1, 1,
0.3372715, 0.7108318, 2.228395, 0, 0.254902, 1, 1,
0.3392161, -0.6157383, 2.789789, 0, 0.2509804, 1, 1,
0.3398163, 0.3648526, 0.39794, 0, 0.2431373, 1, 1,
0.3411034, -1.476677, 4.274649, 0, 0.2392157, 1, 1,
0.3437525, 0.2577803, 0.2373806, 0, 0.2313726, 1, 1,
0.3446785, -1.841054, 4.38177, 0, 0.227451, 1, 1,
0.351946, 0.9720592, 1.373524, 0, 0.2196078, 1, 1,
0.3520662, -1.240004, 2.88685, 0, 0.2156863, 1, 1,
0.352342, -0.5385184, 3.130844, 0, 0.2078431, 1, 1,
0.3583497, -0.4170631, 2.861758, 0, 0.2039216, 1, 1,
0.3613552, 0.1494612, -0.5591277, 0, 0.1960784, 1, 1,
0.3642218, 0.7539242, 1.023498, 0, 0.1882353, 1, 1,
0.3646859, 0.9361177, -1.330382, 0, 0.1843137, 1, 1,
0.3663828, 0.7346204, -0.7073458, 0, 0.1764706, 1, 1,
0.3673046, 1.560832, -1.074629, 0, 0.172549, 1, 1,
0.382623, 0.895156, 0.3413424, 0, 0.1647059, 1, 1,
0.3830761, -1.021509, 2.395969, 0, 0.1607843, 1, 1,
0.3844716, 0.5551803, -0.2710229, 0, 0.1529412, 1, 1,
0.3961529, 0.5273238, 0.2192806, 0, 0.1490196, 1, 1,
0.398384, -0.8025386, 2.416751, 0, 0.1411765, 1, 1,
0.4047326, -1.522229, 2.871459, 0, 0.1372549, 1, 1,
0.4089477, 0.6595641, 1.292939, 0, 0.1294118, 1, 1,
0.4137713, 0.7036683, 0.0948122, 0, 0.1254902, 1, 1,
0.4138386, -1.397123, 2.945654, 0, 0.1176471, 1, 1,
0.4143451, 1.203688, -1.469712, 0, 0.1137255, 1, 1,
0.4152667, -0.1012455, 2.000043, 0, 0.1058824, 1, 1,
0.4176273, 1.412098, 2.148056, 0, 0.09803922, 1, 1,
0.4267792, 0.03783724, 1.839292, 0, 0.09411765, 1, 1,
0.4300502, -0.5609352, 2.036791, 0, 0.08627451, 1, 1,
0.4326462, 2.047807, 1.595083, 0, 0.08235294, 1, 1,
0.4329512, -0.3760595, 2.196148, 0, 0.07450981, 1, 1,
0.437192, 0.1778794, 1.292494, 0, 0.07058824, 1, 1,
0.4379191, 0.18866, 1.33641, 0, 0.0627451, 1, 1,
0.4384979, 0.3837787, 2.070695, 0, 0.05882353, 1, 1,
0.4406962, -0.8696932, 1.41182, 0, 0.05098039, 1, 1,
0.4412135, 0.08046462, 0.1127216, 0, 0.04705882, 1, 1,
0.4467077, 1.099542, 2.296414, 0, 0.03921569, 1, 1,
0.4544623, -0.01720502, 2.713168, 0, 0.03529412, 1, 1,
0.4555616, 0.1682985, 1.285572, 0, 0.02745098, 1, 1,
0.4586993, -1.08858, 2.810407, 0, 0.02352941, 1, 1,
0.4630681, -1.360122, 1.49355, 0, 0.01568628, 1, 1,
0.4633498, -0.4735803, 2.052433, 0, 0.01176471, 1, 1,
0.4704697, -1.719618, 1.779077, 0, 0.003921569, 1, 1,
0.4721697, 0.8837981, -0.1207401, 0.003921569, 0, 1, 1,
0.4728889, -1.746174, 5.769076, 0.007843138, 0, 1, 1,
0.4764763, -1.059371, 2.040624, 0.01568628, 0, 1, 1,
0.4767015, 0.2408996, 1.096984, 0.01960784, 0, 1, 1,
0.4812941, -0.5478272, 2.68579, 0.02745098, 0, 1, 1,
0.483198, 0.6603298, -0.7557747, 0.03137255, 0, 1, 1,
0.4846888, 0.7266285, -0.3405912, 0.03921569, 0, 1, 1,
0.4867118, 1.683972, -0.9879346, 0.04313726, 0, 1, 1,
0.488948, -0.781299, 2.8342, 0.05098039, 0, 1, 1,
0.490041, 1.600146, -0.8358995, 0.05490196, 0, 1, 1,
0.4986938, -0.319811, 3.521764, 0.0627451, 0, 1, 1,
0.5028691, -0.2076676, 1.944403, 0.06666667, 0, 1, 1,
0.5107392, -0.4566539, 2.501381, 0.07450981, 0, 1, 1,
0.5220028, 0.4912861, 0.2786593, 0.07843138, 0, 1, 1,
0.5246292, -0.5010749, 2.416999, 0.08627451, 0, 1, 1,
0.5256628, 0.1615618, 0.3283842, 0.09019608, 0, 1, 1,
0.5266165, -0.5637409, 2.856829, 0.09803922, 0, 1, 1,
0.5272703, 1.703561, 0.9178429, 0.1058824, 0, 1, 1,
0.5357488, 2.067053, 0.4823202, 0.1098039, 0, 1, 1,
0.5400491, 0.3856873, 1.989788, 0.1176471, 0, 1, 1,
0.5445698, 0.6437725, 1.595374, 0.1215686, 0, 1, 1,
0.5454735, 1.868007, -0.7093419, 0.1294118, 0, 1, 1,
0.5475373, -1.691104, 2.524942, 0.1333333, 0, 1, 1,
0.5513927, -0.2812687, 5.053713, 0.1411765, 0, 1, 1,
0.5527641, -0.1806885, 2.203063, 0.145098, 0, 1, 1,
0.5581129, 0.595974, -0.05603247, 0.1529412, 0, 1, 1,
0.5595034, 0.2551372, 0.3856245, 0.1568628, 0, 1, 1,
0.5611295, 0.596451, 1.854708, 0.1647059, 0, 1, 1,
0.566016, -2.527036, 3.828403, 0.1686275, 0, 1, 1,
0.5689803, -0.3441009, 1.947361, 0.1764706, 0, 1, 1,
0.5752887, -0.7887048, 1.611856, 0.1803922, 0, 1, 1,
0.5767273, -1.907242, 3.803528, 0.1882353, 0, 1, 1,
0.5791598, -0.6075965, 1.934197, 0.1921569, 0, 1, 1,
0.5870875, -0.1982119, 1.107015, 0.2, 0, 1, 1,
0.5887386, -0.6745335, 3.414741, 0.2078431, 0, 1, 1,
0.5975913, 0.7970728, -0.0091685, 0.2117647, 0, 1, 1,
0.600921, -0.2302671, 1.462173, 0.2196078, 0, 1, 1,
0.6051393, 1.352274, 0.8689352, 0.2235294, 0, 1, 1,
0.6087314, 0.3124971, 0.08374937, 0.2313726, 0, 1, 1,
0.6135384, 0.2282367, 2.417005, 0.2352941, 0, 1, 1,
0.6159094, -0.8606741, 1.90304, 0.2431373, 0, 1, 1,
0.6166614, 1.07624, 1.900913, 0.2470588, 0, 1, 1,
0.6193651, -0.566739, 2.939269, 0.254902, 0, 1, 1,
0.6232772, 0.4636414, -1.241915, 0.2588235, 0, 1, 1,
0.6236213, 1.328643, 0.9378306, 0.2666667, 0, 1, 1,
0.6256571, 0.01399204, 0.456476, 0.2705882, 0, 1, 1,
0.6271265, 0.9837061, 0.738617, 0.2784314, 0, 1, 1,
0.6297238, -1.340109, 1.989655, 0.282353, 0, 1, 1,
0.6316144, 0.3442967, 0.8371138, 0.2901961, 0, 1, 1,
0.6343256, 0.449118, 0.6151894, 0.2941177, 0, 1, 1,
0.6419721, 0.9729701, -0.9636846, 0.3019608, 0, 1, 1,
0.64338, 1.780877, 0.2076589, 0.3098039, 0, 1, 1,
0.648211, 0.6878617, -0.0844654, 0.3137255, 0, 1, 1,
0.6491892, 0.3393931, 1.461928, 0.3215686, 0, 1, 1,
0.64924, 0.515444, -0.2865504, 0.3254902, 0, 1, 1,
0.6508802, -0.005618505, 1.005752, 0.3333333, 0, 1, 1,
0.6524476, 0.2125357, 1.077289, 0.3372549, 0, 1, 1,
0.6550205, 1.598111, 0.4888099, 0.345098, 0, 1, 1,
0.6550922, 0.3705524, 2.113854, 0.3490196, 0, 1, 1,
0.6570053, -0.6371372, 2.473434, 0.3568628, 0, 1, 1,
0.6594585, 0.2994372, 1.077325, 0.3607843, 0, 1, 1,
0.6635522, -1.686148, 1.555791, 0.3686275, 0, 1, 1,
0.6650161, -0.3487859, 0.7008224, 0.372549, 0, 1, 1,
0.6651906, 1.00759, 1.061703, 0.3803922, 0, 1, 1,
0.6680616, -0.8815513, 2.661917, 0.3843137, 0, 1, 1,
0.6719691, -0.6632431, -0.2721029, 0.3921569, 0, 1, 1,
0.673964, -1.123576, 4.177642, 0.3960784, 0, 1, 1,
0.6773406, -0.5412568, 2.160855, 0.4039216, 0, 1, 1,
0.67837, -0.7665706, 2.098884, 0.4117647, 0, 1, 1,
0.6803095, -0.903028, 1.914853, 0.4156863, 0, 1, 1,
0.6846881, 0.7228929, 0.4960369, 0.4235294, 0, 1, 1,
0.689175, -0.2703709, 1.73942, 0.427451, 0, 1, 1,
0.6899964, -1.200953, 1.552965, 0.4352941, 0, 1, 1,
0.6937954, -0.9444931, 2.130243, 0.4392157, 0, 1, 1,
0.6971413, 0.836509, 2.604946, 0.4470588, 0, 1, 1,
0.6996548, -0.03664667, 0.4811839, 0.4509804, 0, 1, 1,
0.700863, -0.9191633, 2.279197, 0.4588235, 0, 1, 1,
0.70253, -1.127605, 2.407672, 0.4627451, 0, 1, 1,
0.7030885, 0.9692957, 0.1302917, 0.4705882, 0, 1, 1,
0.7031703, -0.4697129, 2.345332, 0.4745098, 0, 1, 1,
0.7040455, -2.115652, 3.303213, 0.4823529, 0, 1, 1,
0.7059969, -0.77554, 1.019562, 0.4862745, 0, 1, 1,
0.7105348, -0.6998699, 3.569798, 0.4941176, 0, 1, 1,
0.7123166, -2.280852, 2.723214, 0.5019608, 0, 1, 1,
0.7147591, -1.760216, 2.04024, 0.5058824, 0, 1, 1,
0.7190326, -1.993086, 2.338277, 0.5137255, 0, 1, 1,
0.7395439, -0.503667, 2.135239, 0.5176471, 0, 1, 1,
0.7424497, -0.3664203, 0.5501796, 0.5254902, 0, 1, 1,
0.7433705, 0.510615, 0.8004336, 0.5294118, 0, 1, 1,
0.7541423, 0.9822074, 1.344697, 0.5372549, 0, 1, 1,
0.754984, -1.189842, 2.37827, 0.5411765, 0, 1, 1,
0.7574189, -0.2346819, 0.3553568, 0.5490196, 0, 1, 1,
0.7601175, -0.3912491, 1.587014, 0.5529412, 0, 1, 1,
0.7665898, 0.09914032, -0.5170407, 0.5607843, 0, 1, 1,
0.7686347, 1.58288, 1.438236, 0.5647059, 0, 1, 1,
0.7720622, 0.359201, 1.743312, 0.572549, 0, 1, 1,
0.7727967, 0.4208357, 0.8545265, 0.5764706, 0, 1, 1,
0.7810866, 1.445783, 0.7681921, 0.5843138, 0, 1, 1,
0.7877862, 0.2250801, 1.736784, 0.5882353, 0, 1, 1,
0.7886759, 1.631241, -0.8719098, 0.5960785, 0, 1, 1,
0.788801, 1.510157, 1.568201, 0.6039216, 0, 1, 1,
0.7929736, -0.9029383, 1.975201, 0.6078432, 0, 1, 1,
0.7946727, -0.5036517, 1.054565, 0.6156863, 0, 1, 1,
0.8011812, 0.4325364, 1.206567, 0.6196079, 0, 1, 1,
0.802004, -0.2564482, 0.4026405, 0.627451, 0, 1, 1,
0.8046111, -0.06954146, 2.479017, 0.6313726, 0, 1, 1,
0.8048214, -1.581003, 1.869391, 0.6392157, 0, 1, 1,
0.805937, 0.4296108, 3.088012, 0.6431373, 0, 1, 1,
0.8111296, 0.8153054, 2.581982, 0.6509804, 0, 1, 1,
0.8113148, 0.5798757, 0.03148768, 0.654902, 0, 1, 1,
0.8132724, -1.353016, 3.949315, 0.6627451, 0, 1, 1,
0.8247201, 0.140332, 3.140627, 0.6666667, 0, 1, 1,
0.8247538, -0.2575954, 1.491351, 0.6745098, 0, 1, 1,
0.8339936, 0.1954263, 2.569046, 0.6784314, 0, 1, 1,
0.8361884, -1.672512, 3.467987, 0.6862745, 0, 1, 1,
0.8362846, 0.6831669, 2.117773, 0.6901961, 0, 1, 1,
0.837104, 1.330185, -0.2691527, 0.6980392, 0, 1, 1,
0.8389058, 0.6825886, 0.8576212, 0.7058824, 0, 1, 1,
0.8411345, -0.791, 2.214305, 0.7098039, 0, 1, 1,
0.846669, -1.296281, 2.335613, 0.7176471, 0, 1, 1,
0.8493471, 0.1980256, 1.413675, 0.7215686, 0, 1, 1,
0.8541993, 0.2945586, 0.3290048, 0.7294118, 0, 1, 1,
0.859696, 0.9695764, 2.146809, 0.7333333, 0, 1, 1,
0.8626982, 0.4003721, 2.271176, 0.7411765, 0, 1, 1,
0.8746806, 0.4275663, 0.3720266, 0.7450981, 0, 1, 1,
0.8864686, 0.2156366, 0.2720338, 0.7529412, 0, 1, 1,
0.8872862, 2.414515, 0.902285, 0.7568628, 0, 1, 1,
0.8884281, 0.4912519, 1.456339, 0.7647059, 0, 1, 1,
0.8886172, 0.2045639, 1.332019, 0.7686275, 0, 1, 1,
0.8929234, 0.7117711, 0.4167749, 0.7764706, 0, 1, 1,
0.9106824, 2.078614, 1.597903, 0.7803922, 0, 1, 1,
0.915001, -0.3855073, -0.655983, 0.7882353, 0, 1, 1,
0.9164893, 0.01955634, 2.764744, 0.7921569, 0, 1, 1,
0.9172454, -0.05351439, 2.424153, 0.8, 0, 1, 1,
0.9190859, -0.2871786, 2.921444, 0.8078431, 0, 1, 1,
0.9215292, 1.183842, 1.170637, 0.8117647, 0, 1, 1,
0.9233679, -0.1907544, 1.987984, 0.8196079, 0, 1, 1,
0.92602, -0.5933173, 1.747491, 0.8235294, 0, 1, 1,
0.9339547, 0.003066452, 1.86083, 0.8313726, 0, 1, 1,
0.9359013, -0.2328382, 3.629929, 0.8352941, 0, 1, 1,
0.937346, -1.370733, 3.256838, 0.8431373, 0, 1, 1,
0.93919, 0.03057121, 2.003306, 0.8470588, 0, 1, 1,
0.9404367, 0.3534143, 1.169753, 0.854902, 0, 1, 1,
0.9414593, -0.7363445, 2.352346, 0.8588235, 0, 1, 1,
0.9449664, 1.6022, 0.278225, 0.8666667, 0, 1, 1,
0.9476179, -1.309161, 3.270463, 0.8705882, 0, 1, 1,
0.9487787, -0.5002269, 0.7450543, 0.8784314, 0, 1, 1,
0.9507469, 0.4630014, 2.046361, 0.8823529, 0, 1, 1,
0.9555072, -0.460794, 1.921022, 0.8901961, 0, 1, 1,
0.9628865, -0.2564029, -0.1063199, 0.8941177, 0, 1, 1,
0.9692002, 0.1102964, 0.8836308, 0.9019608, 0, 1, 1,
0.9730565, -1.586665, 3.61887, 0.9098039, 0, 1, 1,
0.9756324, 0.6660956, 2.881114, 0.9137255, 0, 1, 1,
0.9791946, -0.7515838, 1.483576, 0.9215686, 0, 1, 1,
0.9799653, -0.7476961, 2.521006, 0.9254902, 0, 1, 1,
0.9896204, -1.404296, 2.230567, 0.9333333, 0, 1, 1,
0.9928428, 0.05186981, 2.860191, 0.9372549, 0, 1, 1,
0.9995338, -0.8854817, 3.388393, 0.945098, 0, 1, 1,
1.00257, -0.6142364, 0.2302065, 0.9490196, 0, 1, 1,
1.013505, -0.419252, 1.717245, 0.9568627, 0, 1, 1,
1.024101, -1.647155, 2.157838, 0.9607843, 0, 1, 1,
1.026716, -0.7048756, 2.045496, 0.9686275, 0, 1, 1,
1.027082, -0.7522109, 1.78569, 0.972549, 0, 1, 1,
1.02711, 0.06606336, 0.988423, 0.9803922, 0, 1, 1,
1.029353, 1.260828, 0.3892109, 0.9843137, 0, 1, 1,
1.031515, 0.1348506, 3.242599, 0.9921569, 0, 1, 1,
1.032913, -1.180085, 1.598948, 0.9960784, 0, 1, 1,
1.036036, 0.142626, 2.34102, 1, 0, 0.9960784, 1,
1.037, 0.1440706, 0.7685029, 1, 0, 0.9882353, 1,
1.037692, 0.3610563, 0.4627588, 1, 0, 0.9843137, 1,
1.038231, -0.3191611, 1.734624, 1, 0, 0.9764706, 1,
1.039931, 0.1230421, 0.9049088, 1, 0, 0.972549, 1,
1.048675, 2.091733, 0.4029474, 1, 0, 0.9647059, 1,
1.049482, -0.7654856, 1.625661, 1, 0, 0.9607843, 1,
1.049941, -0.505088, 3.617911, 1, 0, 0.9529412, 1,
1.051238, 0.2078576, 1.041837, 1, 0, 0.9490196, 1,
1.056013, 0.07492916, 1.5558, 1, 0, 0.9411765, 1,
1.062885, -0.5355614, 2.989523, 1, 0, 0.9372549, 1,
1.065086, 0.2583668, 1.667272, 1, 0, 0.9294118, 1,
1.065897, -1.660992, 4.059662, 1, 0, 0.9254902, 1,
1.068199, 0.2111939, 0.5966365, 1, 0, 0.9176471, 1,
1.068622, -0.2648533, 1.705375, 1, 0, 0.9137255, 1,
1.076463, 0.6064059, 2.179868, 1, 0, 0.9058824, 1,
1.082426, -0.05379161, 2.599005, 1, 0, 0.9019608, 1,
1.082881, 1.044327, -1.632622, 1, 0, 0.8941177, 1,
1.089406, 1.218648, 1.001304, 1, 0, 0.8862745, 1,
1.089887, 0.05376437, 3.436183, 1, 0, 0.8823529, 1,
1.090667, 0.2487614, 0.9401841, 1, 0, 0.8745098, 1,
1.093554, 0.657987, -0.8055903, 1, 0, 0.8705882, 1,
1.094579, -0.3475176, 0.2815049, 1, 0, 0.8627451, 1,
1.10178, -0.9192544, 2.525827, 1, 0, 0.8588235, 1,
1.103765, 0.508482, 1.34239, 1, 0, 0.8509804, 1,
1.105514, -0.9385886, 1.940806, 1, 0, 0.8470588, 1,
1.107751, -1.397539, 2.820785, 1, 0, 0.8392157, 1,
1.110389, -1.004091, 1.513999, 1, 0, 0.8352941, 1,
1.111636, 0.09368028, -0.4191187, 1, 0, 0.827451, 1,
1.123395, 0.05132572, 1.460106, 1, 0, 0.8235294, 1,
1.12846, -1.185533, 2.649804, 1, 0, 0.8156863, 1,
1.136025, -1.293858, 1.330973, 1, 0, 0.8117647, 1,
1.14039, -0.06060318, 2.418769, 1, 0, 0.8039216, 1,
1.143703, -0.6497372, 1.500047, 1, 0, 0.7960784, 1,
1.153643, -1.391659, 1.307766, 1, 0, 0.7921569, 1,
1.155975, 0.8521476, 0.1119516, 1, 0, 0.7843137, 1,
1.165244, 0.1905076, 2.049642, 1, 0, 0.7803922, 1,
1.175512, -0.04288774, 1.0293, 1, 0, 0.772549, 1,
1.189281, -0.7920019, 2.039815, 1, 0, 0.7686275, 1,
1.190596, -1.510511, 4.103331, 1, 0, 0.7607843, 1,
1.190939, 0.7469814, 0.74489, 1, 0, 0.7568628, 1,
1.200513, 0.2013535, 1.341799, 1, 0, 0.7490196, 1,
1.202747, 0.7523202, 0.2143187, 1, 0, 0.7450981, 1,
1.203039, 1.436331, -0.3614325, 1, 0, 0.7372549, 1,
1.211487, -0.5034675, 1.744962, 1, 0, 0.7333333, 1,
1.21171, 0.2521, 2.945542, 1, 0, 0.7254902, 1,
1.21305, -0.2766629, 1.794698, 1, 0, 0.7215686, 1,
1.221254, -1.467339, 1.603179, 1, 0, 0.7137255, 1,
1.22536, 0.2143727, 2.380083, 1, 0, 0.7098039, 1,
1.23123, -0.4292561, 2.262753, 1, 0, 0.7019608, 1,
1.238351, 1.717114, 0.6320942, 1, 0, 0.6941177, 1,
1.253266, -0.9033813, 1.665047, 1, 0, 0.6901961, 1,
1.257999, 1.681874, 1.769867, 1, 0, 0.682353, 1,
1.276806, 0.7233574, 1.640311, 1, 0, 0.6784314, 1,
1.278201, -0.4538282, 0.4903059, 1, 0, 0.6705883, 1,
1.282736, -0.7466432, 2.018631, 1, 0, 0.6666667, 1,
1.284602, -0.4732398, 1.082591, 1, 0, 0.6588235, 1,
1.30401, -0.02796805, 0.8511581, 1, 0, 0.654902, 1,
1.307869, -0.5531411, -0.04075798, 1, 0, 0.6470588, 1,
1.318988, -0.6940918, 2.156263, 1, 0, 0.6431373, 1,
1.31935, 0.1377345, 1.427986, 1, 0, 0.6352941, 1,
1.326188, -1.211565, 1.973518, 1, 0, 0.6313726, 1,
1.326903, 1.044059, 2.127866, 1, 0, 0.6235294, 1,
1.328777, 0.4679028, 2.691353, 1, 0, 0.6196079, 1,
1.333661, -0.714382, 1.037754, 1, 0, 0.6117647, 1,
1.33631, 0.703977, 1.248869, 1, 0, 0.6078432, 1,
1.337219, 0.04257485, 1.543657, 1, 0, 0.6, 1,
1.343848, -0.02693576, 3.593907, 1, 0, 0.5921569, 1,
1.35105, 1.543772, 0.0364766, 1, 0, 0.5882353, 1,
1.3563, 0.6060815, 2.505944, 1, 0, 0.5803922, 1,
1.356708, 0.3209397, 1.460299, 1, 0, 0.5764706, 1,
1.359593, 0.5411441, 0.1687064, 1, 0, 0.5686275, 1,
1.366228, -0.5497437, 2.203067, 1, 0, 0.5647059, 1,
1.370038, 0.850276, -0.1514107, 1, 0, 0.5568628, 1,
1.378656, -2.299659, 2.248587, 1, 0, 0.5529412, 1,
1.382374, 0.288147, 0.6435878, 1, 0, 0.5450981, 1,
1.389357, 1.602291, 0.6449607, 1, 0, 0.5411765, 1,
1.414716, 0.1877864, 0.380967, 1, 0, 0.5333334, 1,
1.424461, 0.4663816, -0.1948014, 1, 0, 0.5294118, 1,
1.432286, 2.23207, 1.898772, 1, 0, 0.5215687, 1,
1.434382, 1.3253, 0.8623414, 1, 0, 0.5176471, 1,
1.438547, 0.4060775, 3.122853, 1, 0, 0.509804, 1,
1.443209, 0.07633377, -0.4585082, 1, 0, 0.5058824, 1,
1.449725, -0.1137233, 1.771286, 1, 0, 0.4980392, 1,
1.45234, -0.3724012, 1.925004, 1, 0, 0.4901961, 1,
1.455827, -0.3927506, 3.014694, 1, 0, 0.4862745, 1,
1.467261, 0.4498209, 0.6044987, 1, 0, 0.4784314, 1,
1.472119, 2.345113, -0.6185657, 1, 0, 0.4745098, 1,
1.4864, -0.06458814, 2.60467, 1, 0, 0.4666667, 1,
1.493741, 0.2056238, 1.388297, 1, 0, 0.4627451, 1,
1.507702, 1.113819, 1.728579, 1, 0, 0.454902, 1,
1.508594, 0.03173968, 1.474785, 1, 0, 0.4509804, 1,
1.510083, -0.2415159, 1.63335, 1, 0, 0.4431373, 1,
1.512415, 1.23684, -0.6893491, 1, 0, 0.4392157, 1,
1.515256, 1.428869, 0.2350852, 1, 0, 0.4313726, 1,
1.52202, 1.389928, -0.7097791, 1, 0, 0.427451, 1,
1.537637, 1.062772, -0.8003139, 1, 0, 0.4196078, 1,
1.540987, 1.044187, 1.044969, 1, 0, 0.4156863, 1,
1.542072, 0.5068696, 1.246321, 1, 0, 0.4078431, 1,
1.565048, 1.271743, 1.847729, 1, 0, 0.4039216, 1,
1.584145, 0.3598519, 2.907773, 1, 0, 0.3960784, 1,
1.585905, -0.9299976, 1.105393, 1, 0, 0.3882353, 1,
1.601333, 0.3359784, 0.9105363, 1, 0, 0.3843137, 1,
1.619034, 0.8468515, 0.9956863, 1, 0, 0.3764706, 1,
1.625243, 0.3621303, 1.18598, 1, 0, 0.372549, 1,
1.629169, -1.279217, 0.8043967, 1, 0, 0.3647059, 1,
1.640335, 0.2838296, 1.828965, 1, 0, 0.3607843, 1,
1.652762, -1.027715, 3.22929, 1, 0, 0.3529412, 1,
1.65622, -1.718665, 4.786315, 1, 0, 0.3490196, 1,
1.661507, 1.180174, 1.785679, 1, 0, 0.3411765, 1,
1.663479, 0.007599943, 3.17022, 1, 0, 0.3372549, 1,
1.667506, 0.3485078, 2.568562, 1, 0, 0.3294118, 1,
1.670883, 0.6522382, 0.3737739, 1, 0, 0.3254902, 1,
1.672376, -0.06192791, 4.11546, 1, 0, 0.3176471, 1,
1.678628, 0.4659565, 1.582354, 1, 0, 0.3137255, 1,
1.681771, 0.7657745, 0.7044721, 1, 0, 0.3058824, 1,
1.683986, -0.6369911, 2.137663, 1, 0, 0.2980392, 1,
1.691515, -0.4509958, 0.7880155, 1, 0, 0.2941177, 1,
1.710472, 0.5445482, 1.822271, 1, 0, 0.2862745, 1,
1.716581, -1.412035, 1.217558, 1, 0, 0.282353, 1,
1.718711, 0.2487672, 2.177675, 1, 0, 0.2745098, 1,
1.724361, -0.5132844, 0.6139693, 1, 0, 0.2705882, 1,
1.749484, -0.664405, 1.882102, 1, 0, 0.2627451, 1,
1.758468, 0.0675163, 3.591179, 1, 0, 0.2588235, 1,
1.758926, 0.6061968, 0.6259296, 1, 0, 0.2509804, 1,
1.765244, -0.6356393, 0.6888699, 1, 0, 0.2470588, 1,
1.772294, 2.768269, 0.6843227, 1, 0, 0.2392157, 1,
1.775259, 1.393864, 0.7858632, 1, 0, 0.2352941, 1,
1.783131, -0.0793825, 2.148164, 1, 0, 0.227451, 1,
1.798301, 1.377989, 2.661508, 1, 0, 0.2235294, 1,
1.798683, -0.2563299, 3.127752, 1, 0, 0.2156863, 1,
1.813354, -1.91306, 1.856287, 1, 0, 0.2117647, 1,
1.826469, -0.4420122, 1.457984, 1, 0, 0.2039216, 1,
1.835055, 0.3781747, 1.417212, 1, 0, 0.1960784, 1,
1.836931, 1.464663, 1.730498, 1, 0, 0.1921569, 1,
1.860282, -0.3263804, 1.675263, 1, 0, 0.1843137, 1,
1.861234, 0.3939479, 1.076684, 1, 0, 0.1803922, 1,
1.880516, -0.7643623, 4.535336, 1, 0, 0.172549, 1,
1.884684, -1.854236, 4.293775, 1, 0, 0.1686275, 1,
1.909617, 0.8273692, 0.5789608, 1, 0, 0.1607843, 1,
1.916775, -0.5373707, 2.282091, 1, 0, 0.1568628, 1,
1.922963, -1.117933, 2.432175, 1, 0, 0.1490196, 1,
1.927096, 1.136819, 1.444991, 1, 0, 0.145098, 1,
1.97794, -1.231709, 3.203953, 1, 0, 0.1372549, 1,
2.008483, 0.6271747, 1.550213, 1, 0, 0.1333333, 1,
2.043072, -1.501407, 4.391746, 1, 0, 0.1254902, 1,
2.084563, -1.792186, 0.3356495, 1, 0, 0.1215686, 1,
2.120232, 0.9515338, 1.337685, 1, 0, 0.1137255, 1,
2.144748, 0.006028235, 0.2681975, 1, 0, 0.1098039, 1,
2.148552, -0.6221076, -0.3038546, 1, 0, 0.1019608, 1,
2.161787, -3.132686, 3.555132, 1, 0, 0.09411765, 1,
2.173511, -0.1740935, 2.136899, 1, 0, 0.09019608, 1,
2.182727, -1.074376, 1.472169, 1, 0, 0.08235294, 1,
2.184795, -0.41221, 1.504173, 1, 0, 0.07843138, 1,
2.218452, 0.4052722, 1.429158, 1, 0, 0.07058824, 1,
2.225283, 0.4534811, 1.903311, 1, 0, 0.06666667, 1,
2.236587, -0.4512512, 4.463112, 1, 0, 0.05882353, 1,
2.253949, 1.926592, 0.6781763, 1, 0, 0.05490196, 1,
2.276863, 1.205661, 2.263482, 1, 0, 0.04705882, 1,
2.286961, 0.6706445, 2.808905, 1, 0, 0.04313726, 1,
2.29191, 0.6358464, 2.159059, 1, 0, 0.03529412, 1,
2.357015, 0.6428187, 1.520231, 1, 0, 0.03137255, 1,
2.665566, 0.3131845, 0.7838265, 1, 0, 0.02352941, 1,
2.791085, 1.538991, 0.2828547, 1, 0, 0.01960784, 1,
2.827159, -0.8466048, 3.041749, 1, 0, 0.01176471, 1,
3.138065, 1.692671, -0.1436564, 1, 0, 0.007843138, 1
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
-0.1433699, -4.339724, -7.496469, 0, -0.5, 0.5, 0.5,
-0.1433699, -4.339724, -7.496469, 1, -0.5, 0.5, 0.5,
-0.1433699, -4.339724, -7.496469, 1, 1.5, 0.5, 0.5,
-0.1433699, -4.339724, -7.496469, 0, 1.5, 0.5, 0.5
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
-4.537211, -6.473064e-05, -7.496469, 0, -0.5, 0.5, 0.5,
-4.537211, -6.473064e-05, -7.496469, 1, -0.5, 0.5, 0.5,
-4.537211, -6.473064e-05, -7.496469, 1, 1.5, 0.5, 0.5,
-4.537211, -6.473064e-05, -7.496469, 0, 1.5, 0.5, 0.5
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
-4.537211, -4.339724, 0.3503683, 0, -0.5, 0.5, 0.5,
-4.537211, -4.339724, 0.3503683, 1, -0.5, 0.5, 0.5,
-4.537211, -4.339724, 0.3503683, 1, 1.5, 0.5, 0.5,
-4.537211, -4.339724, 0.3503683, 0, 1.5, 0.5, 0.5
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
-3, -3.338264, -5.68566,
3, -3.338264, -5.68566,
-3, -3.338264, -5.68566,
-3, -3.505174, -5.987462,
-2, -3.338264, -5.68566,
-2, -3.505174, -5.987462,
-1, -3.338264, -5.68566,
-1, -3.505174, -5.987462,
0, -3.338264, -5.68566,
0, -3.505174, -5.987462,
1, -3.338264, -5.68566,
1, -3.505174, -5.987462,
2, -3.338264, -5.68566,
2, -3.505174, -5.987462,
3, -3.338264, -5.68566,
3, -3.505174, -5.987462
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
-3, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
-3, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
-3, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
-3, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5,
-2, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
-2, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
-2, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
-2, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5,
-1, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
-1, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
-1, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
-1, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5,
0, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
0, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
0, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
0, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5,
1, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
1, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
1, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
1, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5,
2, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
2, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
2, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
2, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5,
3, -3.838994, -6.591064, 0, -0.5, 0.5, 0.5,
3, -3.838994, -6.591064, 1, -0.5, 0.5, 0.5,
3, -3.838994, -6.591064, 1, 1.5, 0.5, 0.5,
3, -3.838994, -6.591064, 0, 1.5, 0.5, 0.5
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
-3.523248, -3, -5.68566,
-3.523248, 3, -5.68566,
-3.523248, -3, -5.68566,
-3.692242, -3, -5.987462,
-3.523248, -2, -5.68566,
-3.692242, -2, -5.987462,
-3.523248, -1, -5.68566,
-3.692242, -1, -5.987462,
-3.523248, 0, -5.68566,
-3.692242, 0, -5.987462,
-3.523248, 1, -5.68566,
-3.692242, 1, -5.987462,
-3.523248, 2, -5.68566,
-3.692242, 2, -5.987462,
-3.523248, 3, -5.68566,
-3.692242, 3, -5.987462
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
-4.03023, -3, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, -3, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, -3, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, -3, -6.591064, 0, 1.5, 0.5, 0.5,
-4.03023, -2, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, -2, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, -2, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, -2, -6.591064, 0, 1.5, 0.5, 0.5,
-4.03023, -1, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, -1, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, -1, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, -1, -6.591064, 0, 1.5, 0.5, 0.5,
-4.03023, 0, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, 0, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, 0, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, 0, -6.591064, 0, 1.5, 0.5, 0.5,
-4.03023, 1, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, 1, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, 1, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, 1, -6.591064, 0, 1.5, 0.5, 0.5,
-4.03023, 2, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, 2, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, 2, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, 2, -6.591064, 0, 1.5, 0.5, 0.5,
-4.03023, 3, -6.591064, 0, -0.5, 0.5, 0.5,
-4.03023, 3, -6.591064, 1, -0.5, 0.5, 0.5,
-4.03023, 3, -6.591064, 1, 1.5, 0.5, 0.5,
-4.03023, 3, -6.591064, 0, 1.5, 0.5, 0.5
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
-3.523248, -3.338264, -4,
-3.523248, -3.338264, 6,
-3.523248, -3.338264, -4,
-3.692242, -3.505174, -4,
-3.523248, -3.338264, -2,
-3.692242, -3.505174, -2,
-3.523248, -3.338264, 0,
-3.692242, -3.505174, 0,
-3.523248, -3.338264, 2,
-3.692242, -3.505174, 2,
-3.523248, -3.338264, 4,
-3.692242, -3.505174, 4,
-3.523248, -3.338264, 6,
-3.692242, -3.505174, 6
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
-4.03023, -3.838994, -4, 0, -0.5, 0.5, 0.5,
-4.03023, -3.838994, -4, 1, -0.5, 0.5, 0.5,
-4.03023, -3.838994, -4, 1, 1.5, 0.5, 0.5,
-4.03023, -3.838994, -4, 0, 1.5, 0.5, 0.5,
-4.03023, -3.838994, -2, 0, -0.5, 0.5, 0.5,
-4.03023, -3.838994, -2, 1, -0.5, 0.5, 0.5,
-4.03023, -3.838994, -2, 1, 1.5, 0.5, 0.5,
-4.03023, -3.838994, -2, 0, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 0, 0, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 0, 1, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 0, 1, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 0, 0, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 2, 0, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 2, 1, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 2, 1, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 2, 0, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 4, 0, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 4, 1, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 4, 1, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 4, 0, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 6, 0, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 6, 1, -0.5, 0.5, 0.5,
-4.03023, -3.838994, 6, 1, 1.5, 0.5, 0.5,
-4.03023, -3.838994, 6, 0, 1.5, 0.5, 0.5
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
-3.523248, -3.338264, -5.68566,
-3.523248, 3.338134, -5.68566,
-3.523248, -3.338264, 6.386396,
-3.523248, 3.338134, 6.386396,
-3.523248, -3.338264, -5.68566,
-3.523248, -3.338264, 6.386396,
-3.523248, 3.338134, -5.68566,
-3.523248, 3.338134, 6.386396,
-3.523248, -3.338264, -5.68566,
3.236508, -3.338264, -5.68566,
-3.523248, -3.338264, 6.386396,
3.236508, -3.338264, 6.386396,
-3.523248, 3.338134, -5.68566,
3.236508, 3.338134, -5.68566,
-3.523248, 3.338134, 6.386396,
3.236508, 3.338134, 6.386396,
3.236508, -3.338264, -5.68566,
3.236508, 3.338134, -5.68566,
3.236508, -3.338264, 6.386396,
3.236508, 3.338134, 6.386396,
3.236508, -3.338264, -5.68566,
3.236508, -3.338264, 6.386396,
3.236508, 3.338134, -5.68566,
3.236508, 3.338134, 6.386396
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
var radius = 8.20322;
var distance = 36.49705;
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
mvMatrix.translate( 0.1433699, 6.473064e-05, -0.3503683 );
mvMatrix.scale( 1.312101, 1.328483, 0.7347118 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.49705);
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


