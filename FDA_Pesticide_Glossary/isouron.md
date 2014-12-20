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
-2.870847, 0.5851641, -1.499905, 1, 0, 0, 1,
-2.628769, 0.4972594, -3.283922, 1, 0.007843138, 0, 1,
-2.582923, 0.5037639, -1.498537, 1, 0.01176471, 0, 1,
-2.463063, -0.03483124, -1.2745, 1, 0.01960784, 0, 1,
-2.457902, -1.344542, -2.671888, 1, 0.02352941, 0, 1,
-2.347343, 0.4174538, -0.9309189, 1, 0.03137255, 0, 1,
-2.332706, -0.9704764, -1.405264, 1, 0.03529412, 0, 1,
-2.326505, 1.411269, -2.496763, 1, 0.04313726, 0, 1,
-2.296508, 1.574737, -1.194773, 1, 0.04705882, 0, 1,
-2.117292, 0.8639422, -0.3114473, 1, 0.05490196, 0, 1,
-2.110588, 2.773547, 0.3575028, 1, 0.05882353, 0, 1,
-2.105623, -0.008702778, -1.758651, 1, 0.06666667, 0, 1,
-2.099608, -1.319112, -2.900838, 1, 0.07058824, 0, 1,
-2.088826, -1.851506, -2.800349, 1, 0.07843138, 0, 1,
-2.070251, 0.03731689, -0.5378155, 1, 0.08235294, 0, 1,
-2.068255, -0.4011333, -1.683671, 1, 0.09019608, 0, 1,
-2.018494, 1.032746, -2.008675, 1, 0.09411765, 0, 1,
-2.017672, 0.929047, -0.4463168, 1, 0.1019608, 0, 1,
-1.992039, -0.6566482, -0.332258, 1, 0.1098039, 0, 1,
-1.982736, -0.5240226, -1.814942, 1, 0.1137255, 0, 1,
-1.97858, -0.7715374, -2.627864, 1, 0.1215686, 0, 1,
-1.94603, -0.8122956, -3.454451, 1, 0.1254902, 0, 1,
-1.930679, -2.02896, -1.056438, 1, 0.1333333, 0, 1,
-1.928749, 1.138031, -0.3677694, 1, 0.1372549, 0, 1,
-1.922486, 2.005048, 1.30519, 1, 0.145098, 0, 1,
-1.915431, 0.435293, -0.9840381, 1, 0.1490196, 0, 1,
-1.906179, -1.719476, -3.28691, 1, 0.1568628, 0, 1,
-1.902594, 1.047289, -0.3226078, 1, 0.1607843, 0, 1,
-1.887503, -1.475731, -1.972005, 1, 0.1686275, 0, 1,
-1.87821, -0.7123123, -2.31482, 1, 0.172549, 0, 1,
-1.87579, -0.7684938, -1.315258, 1, 0.1803922, 0, 1,
-1.872156, -0.3785864, -0.9184513, 1, 0.1843137, 0, 1,
-1.811399, 1.34236, 0.4984286, 1, 0.1921569, 0, 1,
-1.802125, 0.1818721, -1.443761, 1, 0.1960784, 0, 1,
-1.801582, -0.2442823, -1.445817, 1, 0.2039216, 0, 1,
-1.784284, 0.6965612, -1.46161, 1, 0.2117647, 0, 1,
-1.752884, 0.4566236, -0.4970562, 1, 0.2156863, 0, 1,
-1.73414, 1.38806, -1.252347, 1, 0.2235294, 0, 1,
-1.714163, 0.8578627, 0.02275094, 1, 0.227451, 0, 1,
-1.710935, -1.706526, -3.224371, 1, 0.2352941, 0, 1,
-1.707002, -1.219858, -2.694248, 1, 0.2392157, 0, 1,
-1.705588, -0.008949504, -1.876658, 1, 0.2470588, 0, 1,
-1.700256, -0.06116029, -1.831623, 1, 0.2509804, 0, 1,
-1.689155, 2.592196, -0.02307503, 1, 0.2588235, 0, 1,
-1.687992, 0.832127, -1.264199, 1, 0.2627451, 0, 1,
-1.683463, -0.5541479, -3.088659, 1, 0.2705882, 0, 1,
-1.681157, -1.528817, -2.436803, 1, 0.2745098, 0, 1,
-1.659314, -0.4149746, -2.889804, 1, 0.282353, 0, 1,
-1.658143, -0.006155154, -1.579486, 1, 0.2862745, 0, 1,
-1.657605, -0.2975281, -0.8842505, 1, 0.2941177, 0, 1,
-1.647558, -0.7173649, -2.039959, 1, 0.3019608, 0, 1,
-1.646945, 0.6957563, -1.545352, 1, 0.3058824, 0, 1,
-1.643426, -1.003255, -1.045459, 1, 0.3137255, 0, 1,
-1.631671, -1.070151, -1.540341, 1, 0.3176471, 0, 1,
-1.626012, -0.8069175, -0.8413475, 1, 0.3254902, 0, 1,
-1.618706, 0.3701462, -0.6147585, 1, 0.3294118, 0, 1,
-1.600668, 2.326562, 0.556493, 1, 0.3372549, 0, 1,
-1.5956, 0.2435752, -0.6595661, 1, 0.3411765, 0, 1,
-1.594689, -1.975768, -1.787992, 1, 0.3490196, 0, 1,
-1.552868, -0.6788101, -0.9742815, 1, 0.3529412, 0, 1,
-1.552532, 0.5416512, -0.5819699, 1, 0.3607843, 0, 1,
-1.544266, -0.3470492, -1.181177, 1, 0.3647059, 0, 1,
-1.535514, -0.2925005, 0.9842163, 1, 0.372549, 0, 1,
-1.529833, 0.8005757, 1.062689, 1, 0.3764706, 0, 1,
-1.522593, 0.8130455, -4.221598, 1, 0.3843137, 0, 1,
-1.506868, -0.6343701, -1.647462, 1, 0.3882353, 0, 1,
-1.504016, -0.7790611, -2.766655, 1, 0.3960784, 0, 1,
-1.481099, 0.1143971, -1.935556, 1, 0.4039216, 0, 1,
-1.478425, -0.2553251, -1.153583, 1, 0.4078431, 0, 1,
-1.455511, 1.457832, -2.540238, 1, 0.4156863, 0, 1,
-1.450266, -1.993138, -3.647949, 1, 0.4196078, 0, 1,
-1.448079, 0.06989634, -1.191551, 1, 0.427451, 0, 1,
-1.442919, 0.8271379, -1.88426, 1, 0.4313726, 0, 1,
-1.432806, 1.016358, -2.494218, 1, 0.4392157, 0, 1,
-1.410618, 0.9717116, 0.3108467, 1, 0.4431373, 0, 1,
-1.398379, 0.204806, -1.771173, 1, 0.4509804, 0, 1,
-1.389956, -1.778059, -3.089908, 1, 0.454902, 0, 1,
-1.377488, 0.439296, -2.841304, 1, 0.4627451, 0, 1,
-1.377023, -0.05662629, -2.359649, 1, 0.4666667, 0, 1,
-1.359311, -0.7800595, -1.341259, 1, 0.4745098, 0, 1,
-1.358335, 1.778907, 0.6659878, 1, 0.4784314, 0, 1,
-1.352426, 2.103924, -2.022115, 1, 0.4862745, 0, 1,
-1.351098, -1.616333, -3.501451, 1, 0.4901961, 0, 1,
-1.343815, 0.6453516, -2.247738, 1, 0.4980392, 0, 1,
-1.343486, 0.4385486, -1.106763, 1, 0.5058824, 0, 1,
-1.343213, 0.4375452, -2.006936, 1, 0.509804, 0, 1,
-1.341983, 2.190468, -1.368907, 1, 0.5176471, 0, 1,
-1.340954, 0.8434517, -2.291677, 1, 0.5215687, 0, 1,
-1.338046, 0.01810952, -1.636836, 1, 0.5294118, 0, 1,
-1.333276, -1.629381, -2.746256, 1, 0.5333334, 0, 1,
-1.328194, -1.535034, -1.749761, 1, 0.5411765, 0, 1,
-1.325523, -0.08243262, -3.601613, 1, 0.5450981, 0, 1,
-1.314151, -0.9968826, -1.025007, 1, 0.5529412, 0, 1,
-1.312979, -0.1665948, -1.648001, 1, 0.5568628, 0, 1,
-1.307026, 0.07951798, -2.968799, 1, 0.5647059, 0, 1,
-1.306794, -0.4130083, -2.670341, 1, 0.5686275, 0, 1,
-1.293236, -0.8263364, -0.8604148, 1, 0.5764706, 0, 1,
-1.283904, 1.526449, -0.388443, 1, 0.5803922, 0, 1,
-1.277524, -2.196424, -0.9023005, 1, 0.5882353, 0, 1,
-1.266633, -1.969165, -0.04144061, 1, 0.5921569, 0, 1,
-1.26567, 0.3856541, -1.712399, 1, 0.6, 0, 1,
-1.257349, 0.7261472, -1.853982, 1, 0.6078432, 0, 1,
-1.247827, -0.6314625, -1.849033, 1, 0.6117647, 0, 1,
-1.246786, 0.452832, 0.2709593, 1, 0.6196079, 0, 1,
-1.236119, -1.035873, -1.161103, 1, 0.6235294, 0, 1,
-1.23397, 0.3180266, -1.608547, 1, 0.6313726, 0, 1,
-1.231378, -0.6941826, -2.350241, 1, 0.6352941, 0, 1,
-1.226716, 1.018911, -0.2531745, 1, 0.6431373, 0, 1,
-1.212293, -1.440726, -3.688471, 1, 0.6470588, 0, 1,
-1.210335, -0.2205838, -1.518821, 1, 0.654902, 0, 1,
-1.206259, -0.6310001, -2.146307, 1, 0.6588235, 0, 1,
-1.202029, -0.8539371, -4.013682, 1, 0.6666667, 0, 1,
-1.195578, 1.119705, -0.9684787, 1, 0.6705883, 0, 1,
-1.182954, -1.625111, -3.254228, 1, 0.6784314, 0, 1,
-1.178346, -0.3931683, -1.760266, 1, 0.682353, 0, 1,
-1.176286, 0.5394621, -1.525379, 1, 0.6901961, 0, 1,
-1.174212, 1.384526, 0.02368748, 1, 0.6941177, 0, 1,
-1.172675, 1.013695, -0.5066619, 1, 0.7019608, 0, 1,
-1.169147, 0.1404893, -0.5564438, 1, 0.7098039, 0, 1,
-1.168068, 3.193658, 0.2106576, 1, 0.7137255, 0, 1,
-1.164806, -3.143754, -2.614224, 1, 0.7215686, 0, 1,
-1.164769, -0.1864251, -1.82609, 1, 0.7254902, 0, 1,
-1.159804, 1.357727, -0.6593569, 1, 0.7333333, 0, 1,
-1.159167, -0.3673775, -2.098089, 1, 0.7372549, 0, 1,
-1.138273, 1.134961, -0.1248521, 1, 0.7450981, 0, 1,
-1.133515, 0.1330684, -1.787423, 1, 0.7490196, 0, 1,
-1.13108, -0.8409424, -0.2543074, 1, 0.7568628, 0, 1,
-1.123789, -0.07156137, -1.113713, 1, 0.7607843, 0, 1,
-1.113859, -1.110082, -2.444608, 1, 0.7686275, 0, 1,
-1.102281, 1.818903, -0.1836947, 1, 0.772549, 0, 1,
-1.099492, -0.1102672, -2.633589, 1, 0.7803922, 0, 1,
-1.0854, 0.5851231, -0.6750305, 1, 0.7843137, 0, 1,
-1.078521, -0.3301513, -1.717408, 1, 0.7921569, 0, 1,
-1.078348, -0.4488384, -1.90354, 1, 0.7960784, 0, 1,
-1.069949, -0.1018211, -0.2897215, 1, 0.8039216, 0, 1,
-1.066656, -1.183769, -1.093265, 1, 0.8117647, 0, 1,
-1.063327, 0.2555718, -1.670955, 1, 0.8156863, 0, 1,
-1.062251, 0.2861151, -1.914499, 1, 0.8235294, 0, 1,
-1.053625, 0.1575874, -2.729139, 1, 0.827451, 0, 1,
-1.049815, -0.8895818, -2.062332, 1, 0.8352941, 0, 1,
-1.048414, 0.5582656, -1.537944, 1, 0.8392157, 0, 1,
-1.046219, 0.6690366, 0.09464705, 1, 0.8470588, 0, 1,
-1.046067, 0.04109165, 0.2992128, 1, 0.8509804, 0, 1,
-1.041583, 0.2233679, -2.77177, 1, 0.8588235, 0, 1,
-1.038564, -0.4531901, -0.09131583, 1, 0.8627451, 0, 1,
-1.036493, 0.6385775, -0.6038311, 1, 0.8705882, 0, 1,
-1.035465, -0.9482908, -2.271277, 1, 0.8745098, 0, 1,
-1.03297, -0.3167969, -2.108065, 1, 0.8823529, 0, 1,
-1.031644, -0.7783408, -3.002515, 1, 0.8862745, 0, 1,
-1.030084, -0.2304497, -2.763561, 1, 0.8941177, 0, 1,
-1.02972, 0.7211955, -2.495268, 1, 0.8980392, 0, 1,
-1.028917, -1.215342, -2.996719, 1, 0.9058824, 0, 1,
-1.011281, 0.4893177, -1.218408, 1, 0.9137255, 0, 1,
-1.0082, 1.029149, -0.2280383, 1, 0.9176471, 0, 1,
-1.001288, 0.216505, -1.865968, 1, 0.9254902, 0, 1,
-1.000786, 0.7565182, -1.584522, 1, 0.9294118, 0, 1,
-0.9973685, 1.075245, 0.2733764, 1, 0.9372549, 0, 1,
-0.99724, 0.8704125, -1.781559, 1, 0.9411765, 0, 1,
-0.9964696, -0.6128643, -3.182353, 1, 0.9490196, 0, 1,
-0.9963795, -0.4533926, -1.892049, 1, 0.9529412, 0, 1,
-0.993591, 1.112108, -0.6564158, 1, 0.9607843, 0, 1,
-0.9898105, 0.299055, -1.800604, 1, 0.9647059, 0, 1,
-0.9892898, 1.208736, -0.4443545, 1, 0.972549, 0, 1,
-0.9810625, -0.1152, -1.179741, 1, 0.9764706, 0, 1,
-0.9770385, 0.2562671, -0.5246292, 1, 0.9843137, 0, 1,
-0.9704186, -0.7340381, -2.501507, 1, 0.9882353, 0, 1,
-0.9691914, 1.280526, 1.791726, 1, 0.9960784, 0, 1,
-0.9648804, 0.7823785, -1.271524, 0.9960784, 1, 0, 1,
-0.9598442, -1.238257, -3.137334, 0.9921569, 1, 0, 1,
-0.9460005, -0.5754349, -2.431841, 0.9843137, 1, 0, 1,
-0.9455737, -0.6957265, -1.419051, 0.9803922, 1, 0, 1,
-0.9435778, 0.2327201, -2.463067, 0.972549, 1, 0, 1,
-0.9430193, -0.6435851, -3.415389, 0.9686275, 1, 0, 1,
-0.9428918, 0.6257222, -1.015938, 0.9607843, 1, 0, 1,
-0.9425085, 0.197796, -1.470505, 0.9568627, 1, 0, 1,
-0.9391969, -0.8393597, -2.089929, 0.9490196, 1, 0, 1,
-0.9331543, -0.5831105, -2.772794, 0.945098, 1, 0, 1,
-0.9331031, -1.73733, -2.81031, 0.9372549, 1, 0, 1,
-0.932379, -0.07308911, -1.639253, 0.9333333, 1, 0, 1,
-0.9313419, -0.1352209, -1.403786, 0.9254902, 1, 0, 1,
-0.9280072, 1.09443, 1.081744, 0.9215686, 1, 0, 1,
-0.9192781, 0.03639178, -0.8356445, 0.9137255, 1, 0, 1,
-0.9093176, 0.8804492, -1.772512, 0.9098039, 1, 0, 1,
-0.9082087, 0.6431674, 0.6364702, 0.9019608, 1, 0, 1,
-0.9073721, -0.4504765, -2.080121, 0.8941177, 1, 0, 1,
-0.8955368, 1.742434, -2.16661, 0.8901961, 1, 0, 1,
-0.8947407, 1.198025, -1.893667, 0.8823529, 1, 0, 1,
-0.8925436, -1.070444, -0.5424497, 0.8784314, 1, 0, 1,
-0.8897471, -0.996307, -1.059261, 0.8705882, 1, 0, 1,
-0.886835, 1.188946, 0.6995698, 0.8666667, 1, 0, 1,
-0.8855031, 1.45879, 0.7221465, 0.8588235, 1, 0, 1,
-0.8852971, -1.366031, -2.252142, 0.854902, 1, 0, 1,
-0.879555, 0.547061, -2.919481, 0.8470588, 1, 0, 1,
-0.8790907, -1.051714, -2.384842, 0.8431373, 1, 0, 1,
-0.8686435, -0.01575735, -1.973956, 0.8352941, 1, 0, 1,
-0.8653819, 2.397601, -0.0415094, 0.8313726, 1, 0, 1,
-0.8564626, 0.9058136, -0.9395275, 0.8235294, 1, 0, 1,
-0.8547294, 2.428019, 0.9764163, 0.8196079, 1, 0, 1,
-0.8477737, -0.7743847, -2.046998, 0.8117647, 1, 0, 1,
-0.8457043, 1.611159, -1.707412, 0.8078431, 1, 0, 1,
-0.8435355, -0.5651962, -0.8237554, 0.8, 1, 0, 1,
-0.8401628, -0.6999592, -2.98216, 0.7921569, 1, 0, 1,
-0.8351458, -1.601144, -1.375936, 0.7882353, 1, 0, 1,
-0.8310496, 1.759771, -0.5687218, 0.7803922, 1, 0, 1,
-0.8305434, 0.6114623, -1.086278, 0.7764706, 1, 0, 1,
-0.8272331, 1.26887, -0.7892329, 0.7686275, 1, 0, 1,
-0.8267816, -1.322119, -3.731693, 0.7647059, 1, 0, 1,
-0.8234659, 0.8210014, -1.846253, 0.7568628, 1, 0, 1,
-0.8221058, -0.702592, -1.275593, 0.7529412, 1, 0, 1,
-0.8164877, 0.4383959, 0.427933, 0.7450981, 1, 0, 1,
-0.8161281, 1.218605, 0.2156027, 0.7411765, 1, 0, 1,
-0.8137251, -0.9016298, -3.768651, 0.7333333, 1, 0, 1,
-0.8128503, 0.4957751, -1.957526, 0.7294118, 1, 0, 1,
-0.8015994, 0.1393758, -2.345473, 0.7215686, 1, 0, 1,
-0.7876229, -0.9219677, -1.760424, 0.7176471, 1, 0, 1,
-0.7839701, -1.194781, -2.810076, 0.7098039, 1, 0, 1,
-0.7834247, 0.06042667, -1.946345, 0.7058824, 1, 0, 1,
-0.780368, 0.05924948, -0.7037562, 0.6980392, 1, 0, 1,
-0.7776941, 0.1809691, -0.9852185, 0.6901961, 1, 0, 1,
-0.7773172, -1.014027, -2.757074, 0.6862745, 1, 0, 1,
-0.77257, 1.539895, 1.288911, 0.6784314, 1, 0, 1,
-0.7641231, -0.739159, -1.167325, 0.6745098, 1, 0, 1,
-0.7558223, 0.234754, -2.219687, 0.6666667, 1, 0, 1,
-0.7556913, 0.0454612, -1.837809, 0.6627451, 1, 0, 1,
-0.7495879, -0.5083119, -3.562969, 0.654902, 1, 0, 1,
-0.748116, 0.6677542, -1.516779, 0.6509804, 1, 0, 1,
-0.746212, 0.1064993, -2.711131, 0.6431373, 1, 0, 1,
-0.7442861, -0.4044378, -1.921443, 0.6392157, 1, 0, 1,
-0.7412838, 0.3458882, -1.588169, 0.6313726, 1, 0, 1,
-0.7400575, -2.47914, -3.989662, 0.627451, 1, 0, 1,
-0.739148, -0.815226, -3.548224, 0.6196079, 1, 0, 1,
-0.7374098, -0.5200734, -0.7211665, 0.6156863, 1, 0, 1,
-0.7335468, 1.68458, -1.355911, 0.6078432, 1, 0, 1,
-0.7333168, 0.8234797, -2.603178, 0.6039216, 1, 0, 1,
-0.7297899, 0.6700836, -0.9891497, 0.5960785, 1, 0, 1,
-0.7296737, 1.295241, -1.04005, 0.5882353, 1, 0, 1,
-0.7294407, 0.1435005, -2.433623, 0.5843138, 1, 0, 1,
-0.7264291, -0.4246863, -2.768465, 0.5764706, 1, 0, 1,
-0.7146711, -2.089538, -2.440625, 0.572549, 1, 0, 1,
-0.7125484, -0.2735362, -0.9730117, 0.5647059, 1, 0, 1,
-0.7100968, 0.3963977, -1.115407, 0.5607843, 1, 0, 1,
-0.707424, 0.5693982, -1.619488, 0.5529412, 1, 0, 1,
-0.6990449, 0.9925196, -0.7837681, 0.5490196, 1, 0, 1,
-0.6982112, 0.01072889, -0.7012665, 0.5411765, 1, 0, 1,
-0.6938425, 0.5336453, -1.247307, 0.5372549, 1, 0, 1,
-0.6901341, 0.265168, -0.9023908, 0.5294118, 1, 0, 1,
-0.6889363, 1.642277, -0.9713564, 0.5254902, 1, 0, 1,
-0.6803074, 0.1994613, -2.230238, 0.5176471, 1, 0, 1,
-0.6764953, -0.8194178, -2.49059, 0.5137255, 1, 0, 1,
-0.6730279, 1.785987, -0.2519926, 0.5058824, 1, 0, 1,
-0.6630105, 0.1363195, -2.561972, 0.5019608, 1, 0, 1,
-0.6623675, -1.130753, -2.275848, 0.4941176, 1, 0, 1,
-0.659733, -1.47789, -1.978388, 0.4862745, 1, 0, 1,
-0.6576765, -0.9965167, -4.00398, 0.4823529, 1, 0, 1,
-0.6554047, 2.493803, 0.3227082, 0.4745098, 1, 0, 1,
-0.6554016, 0.04859116, -2.716136, 0.4705882, 1, 0, 1,
-0.6542307, 0.07193454, -1.10917, 0.4627451, 1, 0, 1,
-0.6492602, 0.1766347, -1.824984, 0.4588235, 1, 0, 1,
-0.6487452, -0.6966966, -4.065101, 0.4509804, 1, 0, 1,
-0.6470404, -0.9964204, -1.020813, 0.4470588, 1, 0, 1,
-0.6456937, 1.383319, 0.988194, 0.4392157, 1, 0, 1,
-0.643194, 0.1244129, -0.5515821, 0.4352941, 1, 0, 1,
-0.6356606, 0.747024, -0.4571702, 0.427451, 1, 0, 1,
-0.63312, -0.006203046, -2.998962, 0.4235294, 1, 0, 1,
-0.6279156, -0.528997, -3.332712, 0.4156863, 1, 0, 1,
-0.624833, 0.9591117, -2.052583, 0.4117647, 1, 0, 1,
-0.6186786, 1.298172, -0.7285519, 0.4039216, 1, 0, 1,
-0.6119758, -0.4900632, -2.228036, 0.3960784, 1, 0, 1,
-0.60992, 0.6352079, -1.669821, 0.3921569, 1, 0, 1,
-0.6083144, -0.3895032, -2.251305, 0.3843137, 1, 0, 1,
-0.607834, -0.2511167, -1.440531, 0.3803922, 1, 0, 1,
-0.6015691, -0.1660088, -1.135582, 0.372549, 1, 0, 1,
-0.5984765, -1.762468, -2.399638, 0.3686275, 1, 0, 1,
-0.5957937, -0.6897433, -2.930867, 0.3607843, 1, 0, 1,
-0.5950443, 2.415302, -0.3717707, 0.3568628, 1, 0, 1,
-0.5949818, -0.1360648, -0.4435477, 0.3490196, 1, 0, 1,
-0.5916907, 0.7557742, -0.1925403, 0.345098, 1, 0, 1,
-0.5908312, 1.408911, 0.802371, 0.3372549, 1, 0, 1,
-0.585007, 1.054065, -2.192179, 0.3333333, 1, 0, 1,
-0.5845206, 2.026476, -1.238529, 0.3254902, 1, 0, 1,
-0.5784122, 1.833107, 0.9477171, 0.3215686, 1, 0, 1,
-0.5782859, 1.163675, -0.3539346, 0.3137255, 1, 0, 1,
-0.568938, 0.04386863, -1.965098, 0.3098039, 1, 0, 1,
-0.5678579, -0.8666484, -4.247786, 0.3019608, 1, 0, 1,
-0.5660985, -1.417532, -3.375195, 0.2941177, 1, 0, 1,
-0.5659728, -0.8694313, -2.199391, 0.2901961, 1, 0, 1,
-0.5658483, -0.5760773, -1.65364, 0.282353, 1, 0, 1,
-0.5635342, -0.9760594, -5.008139, 0.2784314, 1, 0, 1,
-0.557488, -0.3098228, -1.763823, 0.2705882, 1, 0, 1,
-0.5565884, -0.443695, -5.303184, 0.2666667, 1, 0, 1,
-0.5542596, 1.724909, 0.926384, 0.2588235, 1, 0, 1,
-0.5475984, -0.01161661, -2.340773, 0.254902, 1, 0, 1,
-0.5367913, -0.3480096, -1.12928, 0.2470588, 1, 0, 1,
-0.5329596, 1.677316, 1.960155, 0.2431373, 1, 0, 1,
-0.5306142, 1.87245, -2.277892, 0.2352941, 1, 0, 1,
-0.5292397, 1.51551, 0.4274658, 0.2313726, 1, 0, 1,
-0.5285193, 1.159358, 0.2177941, 0.2235294, 1, 0, 1,
-0.5282026, -1.402585, -3.027973, 0.2196078, 1, 0, 1,
-0.5279203, 1.012097, -0.961372, 0.2117647, 1, 0, 1,
-0.5276153, -1.338108, -4.323442, 0.2078431, 1, 0, 1,
-0.5221758, -0.586109, -4.036621, 0.2, 1, 0, 1,
-0.5198046, 2.351681, -0.01708709, 0.1921569, 1, 0, 1,
-0.5196294, -0.6094835, -2.400697, 0.1882353, 1, 0, 1,
-0.518145, -0.006537507, 0.2100196, 0.1803922, 1, 0, 1,
-0.5173786, 0.4423726, -0.3163551, 0.1764706, 1, 0, 1,
-0.5156394, 1.462467, 0.1327244, 0.1686275, 1, 0, 1,
-0.5144751, -1.842215, -3.701803, 0.1647059, 1, 0, 1,
-0.5129941, 0.2531135, -0.3622212, 0.1568628, 1, 0, 1,
-0.5110447, 1.035651, 1.222098, 0.1529412, 1, 0, 1,
-0.5096668, 1.043746, 0.08728883, 0.145098, 1, 0, 1,
-0.5081639, -1.510544, -3.525348, 0.1411765, 1, 0, 1,
-0.5080603, -0.4093879, -2.948437, 0.1333333, 1, 0, 1,
-0.4982098, -2.446652, -1.784167, 0.1294118, 1, 0, 1,
-0.4980097, 1.25555, -1.141947, 0.1215686, 1, 0, 1,
-0.4972826, 0.2299432, 0.2252997, 0.1176471, 1, 0, 1,
-0.4939367, 0.104311, -0.770821, 0.1098039, 1, 0, 1,
-0.4924738, -1.346517, -4.253025, 0.1058824, 1, 0, 1,
-0.4908124, 0.8591666, 0.01162513, 0.09803922, 1, 0, 1,
-0.4881248, 1.538053, -0.6274379, 0.09019608, 1, 0, 1,
-0.4758842, 1.230877, -0.5573125, 0.08627451, 1, 0, 1,
-0.4751858, 0.4279228, -3.104416, 0.07843138, 1, 0, 1,
-0.4709424, -0.1234274, -1.935114, 0.07450981, 1, 0, 1,
-0.4649283, 0.5563297, -2.055146, 0.06666667, 1, 0, 1,
-0.4633154, -1.325213, -2.671252, 0.0627451, 1, 0, 1,
-0.4607655, 1.939159, -0.5474178, 0.05490196, 1, 0, 1,
-0.4605098, -0.6044744, -2.930171, 0.05098039, 1, 0, 1,
-0.4475701, 0.4651407, -0.2841685, 0.04313726, 1, 0, 1,
-0.4470696, 0.9624929, 0.07097434, 0.03921569, 1, 0, 1,
-0.4435747, 1.09853, 0.1638076, 0.03137255, 1, 0, 1,
-0.4435628, 0.9531236, 0.1510833, 0.02745098, 1, 0, 1,
-0.4381972, 0.6441439, -1.752377, 0.01960784, 1, 0, 1,
-0.4364107, -0.5133204, -1.0662, 0.01568628, 1, 0, 1,
-0.4359633, -0.6925157, -2.947218, 0.007843138, 1, 0, 1,
-0.4306962, 0.2906288, -0.001846282, 0.003921569, 1, 0, 1,
-0.430258, -1.01596, -4.247474, 0, 1, 0.003921569, 1,
-0.4271445, -1.329774, -4.692646, 0, 1, 0.01176471, 1,
-0.4221622, -0.02443718, -1.855671, 0, 1, 0.01568628, 1,
-0.4200782, -0.4370745, -0.4068842, 0, 1, 0.02352941, 1,
-0.4147195, -1.506059, -2.61079, 0, 1, 0.02745098, 1,
-0.4127564, 0.6394183, -0.2589791, 0, 1, 0.03529412, 1,
-0.4120973, 0.4638436, -0.1403618, 0, 1, 0.03921569, 1,
-0.4093851, 1.231355, -0.168989, 0, 1, 0.04705882, 1,
-0.4084319, -1.453643, -4.414815, 0, 1, 0.05098039, 1,
-0.405591, 0.1256881, -3.259079, 0, 1, 0.05882353, 1,
-0.4046949, 0.01929439, -0.8620823, 0, 1, 0.0627451, 1,
-0.4015455, 0.9927559, -1.126773, 0, 1, 0.07058824, 1,
-0.3984328, -0.2523747, -1.857989, 0, 1, 0.07450981, 1,
-0.3974418, 0.714022, -0.1929082, 0, 1, 0.08235294, 1,
-0.3969825, -0.3686053, -1.849797, 0, 1, 0.08627451, 1,
-0.3952331, -0.3987241, -2.042135, 0, 1, 0.09411765, 1,
-0.3946573, 1.115392, -0.1474458, 0, 1, 0.1019608, 1,
-0.3926102, 0.1878525, -0.004339417, 0, 1, 0.1058824, 1,
-0.390103, 1.148527, -0.5629295, 0, 1, 0.1137255, 1,
-0.3833265, 0.1919315, -2.699008, 0, 1, 0.1176471, 1,
-0.3807949, -1.398928, -3.04981, 0, 1, 0.1254902, 1,
-0.3799975, -0.04663237, -1.248217, 0, 1, 0.1294118, 1,
-0.3794059, -0.5329177, -1.956643, 0, 1, 0.1372549, 1,
-0.3770131, 0.6426068, -0.03944525, 0, 1, 0.1411765, 1,
-0.3722684, 0.2607083, -1.784684, 0, 1, 0.1490196, 1,
-0.3703436, -0.4191052, -0.5310825, 0, 1, 0.1529412, 1,
-0.3687074, 1.153898, 0.7807856, 0, 1, 0.1607843, 1,
-0.3667893, -0.02223949, 0.6722951, 0, 1, 0.1647059, 1,
-0.3666655, 1.715777, -0.1623958, 0, 1, 0.172549, 1,
-0.3655382, 2.307556, -0.2793707, 0, 1, 0.1764706, 1,
-0.3636189, 1.86576, -1.217409, 0, 1, 0.1843137, 1,
-0.3609264, 0.1349798, 1.475417, 0, 1, 0.1882353, 1,
-0.3593389, -0.05280196, -1.60863, 0, 1, 0.1960784, 1,
-0.3527068, -0.0445627, -2.034261, 0, 1, 0.2039216, 1,
-0.3524312, -0.9497797, -2.273003, 0, 1, 0.2078431, 1,
-0.3521724, -1.158619, -4.352377, 0, 1, 0.2156863, 1,
-0.3500025, -0.5362251, -2.585716, 0, 1, 0.2196078, 1,
-0.3481129, -1.1154, -2.745451, 0, 1, 0.227451, 1,
-0.3480337, 0.5620984, 0.9621886, 0, 1, 0.2313726, 1,
-0.3475561, 0.02809576, -0.7867059, 0, 1, 0.2392157, 1,
-0.342043, 1.821408, 0.6397908, 0, 1, 0.2431373, 1,
-0.3370738, 1.140832, 0.1607754, 0, 1, 0.2509804, 1,
-0.3360752, 1.229411, 1.320146, 0, 1, 0.254902, 1,
-0.3345742, -0.5972319, -1.961782, 0, 1, 0.2627451, 1,
-0.3303143, -1.114763, -4.252154, 0, 1, 0.2666667, 1,
-0.3296194, -1.188282, -4.095715, 0, 1, 0.2745098, 1,
-0.3281076, -0.728726, -0.3806647, 0, 1, 0.2784314, 1,
-0.3254273, -1.131683, -2.28724, 0, 1, 0.2862745, 1,
-0.3225164, -0.9863381, -2.169316, 0, 1, 0.2901961, 1,
-0.3199185, -0.1067214, -2.641269, 0, 1, 0.2980392, 1,
-0.3175007, -0.7104402, -2.860777, 0, 1, 0.3058824, 1,
-0.3170501, -0.2410651, -2.535021, 0, 1, 0.3098039, 1,
-0.3128467, 0.736645, 0.9156905, 0, 1, 0.3176471, 1,
-0.3098607, -2.308026, -1.905233, 0, 1, 0.3215686, 1,
-0.3096578, -0.9940684, -4.285344, 0, 1, 0.3294118, 1,
-0.3085636, -0.520016, -1.906311, 0, 1, 0.3333333, 1,
-0.3055284, -1.673133, -2.13652, 0, 1, 0.3411765, 1,
-0.305133, 0.394991, -0.4688639, 0, 1, 0.345098, 1,
-0.3049056, -2.419912, -4.133869, 0, 1, 0.3529412, 1,
-0.3036771, 0.003199308, -2.419778, 0, 1, 0.3568628, 1,
-0.2990955, -0.4808299, -2.574964, 0, 1, 0.3647059, 1,
-0.2988967, 0.2862124, -1.789574, 0, 1, 0.3686275, 1,
-0.2965534, 0.5829808, -1.265381, 0, 1, 0.3764706, 1,
-0.2959588, 0.3323749, -1.812449, 0, 1, 0.3803922, 1,
-0.2930326, 1.154423, -0.3481244, 0, 1, 0.3882353, 1,
-0.2910385, 0.2432675, 0.1768186, 0, 1, 0.3921569, 1,
-0.2900639, -0.8090066, -0.5833674, 0, 1, 0.4, 1,
-0.2866264, 1.735493, -0.3902068, 0, 1, 0.4078431, 1,
-0.2844944, 1.867367, -1.336513, 0, 1, 0.4117647, 1,
-0.2842789, 2.544009, -0.3320559, 0, 1, 0.4196078, 1,
-0.2836926, 0.386952, -0.06082973, 0, 1, 0.4235294, 1,
-0.2799407, 0.1264263, 0.1686376, 0, 1, 0.4313726, 1,
-0.2775196, 0.5919982, -0.9873302, 0, 1, 0.4352941, 1,
-0.2720031, 0.7122551, -0.6533892, 0, 1, 0.4431373, 1,
-0.2704934, -1.622855, -3.271341, 0, 1, 0.4470588, 1,
-0.2677646, 1.15402, 0.7663676, 0, 1, 0.454902, 1,
-0.2628229, -0.1217287, -1.920339, 0, 1, 0.4588235, 1,
-0.2625169, 1.071012, 2.144852, 0, 1, 0.4666667, 1,
-0.2601827, 1.136307, -0.5299491, 0, 1, 0.4705882, 1,
-0.252875, 0.3066441, -0.3737939, 0, 1, 0.4784314, 1,
-0.2518164, 1.284103, 0.02288652, 0, 1, 0.4823529, 1,
-0.251325, -1.520328, -3.01443, 0, 1, 0.4901961, 1,
-0.2505114, -0.7323514, -3.564676, 0, 1, 0.4941176, 1,
-0.2450846, -0.06246509, -2.25739, 0, 1, 0.5019608, 1,
-0.242011, 1.11915, 0.2926336, 0, 1, 0.509804, 1,
-0.2414433, -0.5256712, -3.261431, 0, 1, 0.5137255, 1,
-0.2359459, -0.2325507, -1.723566, 0, 1, 0.5215687, 1,
-0.2325637, -0.6064816, -1.836486, 0, 1, 0.5254902, 1,
-0.2322903, -0.9333096, -3.153567, 0, 1, 0.5333334, 1,
-0.2264759, -0.9707069, -1.920322, 0, 1, 0.5372549, 1,
-0.2200574, 1.85388, 0.2696447, 0, 1, 0.5450981, 1,
-0.2190948, -0.08292942, -2.012496, 0, 1, 0.5490196, 1,
-0.2179597, -1.001671, -3.107717, 0, 1, 0.5568628, 1,
-0.212955, -0.3738874, -3.871077, 0, 1, 0.5607843, 1,
-0.2122026, 1.156138, 0.07825056, 0, 1, 0.5686275, 1,
-0.2089483, 0.6378481, -0.2587611, 0, 1, 0.572549, 1,
-0.1950997, -1.58025, -3.479173, 0, 1, 0.5803922, 1,
-0.1937847, -1.565201, -3.018621, 0, 1, 0.5843138, 1,
-0.1924829, 1.48427, -2.050737, 0, 1, 0.5921569, 1,
-0.1919, -0.1133602, -0.9112785, 0, 1, 0.5960785, 1,
-0.1902792, -0.6407818, -1.745547, 0, 1, 0.6039216, 1,
-0.1889089, -1.679956, -2.267578, 0, 1, 0.6117647, 1,
-0.1868871, -0.02123084, 0.1370776, 0, 1, 0.6156863, 1,
-0.178831, 1.088106, 0.5748035, 0, 1, 0.6235294, 1,
-0.1778133, 2.854933, 0.5153419, 0, 1, 0.627451, 1,
-0.1773806, 0.08327276, -1.454655, 0, 1, 0.6352941, 1,
-0.1710977, 0.9425578, -1.772516, 0, 1, 0.6392157, 1,
-0.1658003, -0.2512702, -1.864648, 0, 1, 0.6470588, 1,
-0.1644427, -0.2832868, -2.687863, 0, 1, 0.6509804, 1,
-0.1638033, -0.8205994, -3.286075, 0, 1, 0.6588235, 1,
-0.1632249, -0.1717679, -1.552602, 0, 1, 0.6627451, 1,
-0.1619801, -1.457084, -2.802439, 0, 1, 0.6705883, 1,
-0.1613016, 0.9845417, 1.870466, 0, 1, 0.6745098, 1,
-0.160139, 0.9843518, -0.4698283, 0, 1, 0.682353, 1,
-0.1601307, 1.214087, 0.2154542, 0, 1, 0.6862745, 1,
-0.1579647, -0.008383185, -0.5327848, 0, 1, 0.6941177, 1,
-0.1546311, -1.754838, -3.016789, 0, 1, 0.7019608, 1,
-0.1528291, 0.5189578, -2.52014, 0, 1, 0.7058824, 1,
-0.1522968, 0.2321301, 0.01818129, 0, 1, 0.7137255, 1,
-0.1492188, -1.324829, -3.912672, 0, 1, 0.7176471, 1,
-0.1466754, -0.3648853, -3.140497, 0, 1, 0.7254902, 1,
-0.1416702, -0.3090422, -2.962929, 0, 1, 0.7294118, 1,
-0.1403103, -0.3897442, -3.113464, 0, 1, 0.7372549, 1,
-0.1403035, -0.05419614, -1.202215, 0, 1, 0.7411765, 1,
-0.1386578, -1.005012, -3.881961, 0, 1, 0.7490196, 1,
-0.1368352, -0.1726013, -2.621713, 0, 1, 0.7529412, 1,
-0.1259251, 0.009387381, -0.6823568, 0, 1, 0.7607843, 1,
-0.1258339, -2.293898, -3.799182, 0, 1, 0.7647059, 1,
-0.1248792, -0.6997569, -2.290682, 0, 1, 0.772549, 1,
-0.1247097, -1.171704, -1.559502, 0, 1, 0.7764706, 1,
-0.1186564, 1.4001, -2.73249, 0, 1, 0.7843137, 1,
-0.1134755, 0.3338956, -1.620245, 0, 1, 0.7882353, 1,
-0.1088068, 0.5494035, -0.4522545, 0, 1, 0.7960784, 1,
-0.1064167, 1.247063, -0.34263, 0, 1, 0.8039216, 1,
-0.09573182, -0.4273012, -1.810517, 0, 1, 0.8078431, 1,
-0.09247452, -0.9440321, -3.234565, 0, 1, 0.8156863, 1,
-0.08673587, -0.7279938, -3.757508, 0, 1, 0.8196079, 1,
-0.0860477, 0.6515724, 0.941052, 0, 1, 0.827451, 1,
-0.08501346, 1.170916, 0.2060442, 0, 1, 0.8313726, 1,
-0.08371675, 1.043913, -0.4133276, 0, 1, 0.8392157, 1,
-0.08144045, -1.618059, -3.225483, 0, 1, 0.8431373, 1,
-0.08106234, -0.4497003, -2.602754, 0, 1, 0.8509804, 1,
-0.08063378, -0.3442503, -3.86489, 0, 1, 0.854902, 1,
-0.08040679, -1.62232, -2.485538, 0, 1, 0.8627451, 1,
-0.08003037, -0.1484233, -1.195391, 0, 1, 0.8666667, 1,
-0.07752211, -0.07474884, -1.799405, 0, 1, 0.8745098, 1,
-0.07229742, -0.8773521, -2.866591, 0, 1, 0.8784314, 1,
-0.06887294, -0.6595699, -2.162244, 0, 1, 0.8862745, 1,
-0.06723862, -0.2262946, -4.203899, 0, 1, 0.8901961, 1,
-0.06714322, -1.031888, -3.522133, 0, 1, 0.8980392, 1,
-0.06685358, 1.093202, -0.01087403, 0, 1, 0.9058824, 1,
-0.06440189, 0.0436589, -0.5870503, 0, 1, 0.9098039, 1,
-0.06438255, -2.150263, -3.574168, 0, 1, 0.9176471, 1,
-0.06124316, -0.4824826, -1.252211, 0, 1, 0.9215686, 1,
-0.05972494, -0.9773188, -2.843823, 0, 1, 0.9294118, 1,
-0.0594694, 0.7553508, 0.8569662, 0, 1, 0.9333333, 1,
-0.05793971, -1.096811, -3.340352, 0, 1, 0.9411765, 1,
-0.05708319, 1.916992, -0.6530554, 0, 1, 0.945098, 1,
-0.0557488, 1.40619, 0.3447716, 0, 1, 0.9529412, 1,
-0.0504452, 0.6153448, 0.9689313, 0, 1, 0.9568627, 1,
-0.04895675, -1.286097, -4.627666, 0, 1, 0.9647059, 1,
-0.04675537, -1.287224, -2.076987, 0, 1, 0.9686275, 1,
-0.04248849, 1.137493, 0.2025633, 0, 1, 0.9764706, 1,
-0.03898967, -1.191863, -2.885383, 0, 1, 0.9803922, 1,
-0.03800969, -1.617569, -3.353784, 0, 1, 0.9882353, 1,
-0.03592112, 1.066934, 0.07049432, 0, 1, 0.9921569, 1,
-0.03396155, 1.455969, -0.3879781, 0, 1, 1, 1,
-0.03338039, 1.079282, 0.3102304, 0, 0.9921569, 1, 1,
-0.03286529, 0.9033703, -0.5110092, 0, 0.9882353, 1, 1,
-0.02819752, 2.050273, -0.03227525, 0, 0.9803922, 1, 1,
-0.02585062, -0.04881516, -3.097361, 0, 0.9764706, 1, 1,
-0.02278287, 1.047467, 0.5823358, 0, 0.9686275, 1, 1,
-0.02091749, 0.7151285, 1.411011, 0, 0.9647059, 1, 1,
-0.02041304, 0.3724572, -1.923947, 0, 0.9568627, 1, 1,
-0.01969956, 0.3406333, 1.840948, 0, 0.9529412, 1, 1,
-0.01844219, -0.1190646, -3.074481, 0, 0.945098, 1, 1,
-0.01537766, -1.060249, -1.963333, 0, 0.9411765, 1, 1,
-0.01243152, 1.02666, -1.009797, 0, 0.9333333, 1, 1,
-0.00969824, 1.25533, -2.42111, 0, 0.9294118, 1, 1,
-0.008997454, -0.2111481, -4.163929, 0, 0.9215686, 1, 1,
-0.006217535, 2.027761, -0.285609, 0, 0.9176471, 1, 1,
-0.004989689, 0.3890549, 0.00566178, 0, 0.9098039, 1, 1,
0.00318008, 0.7800663, -0.9201172, 0, 0.9058824, 1, 1,
0.01086718, -0.3951639, 2.671745, 0, 0.8980392, 1, 1,
0.01393173, 0.2672113, -0.08944013, 0, 0.8901961, 1, 1,
0.01499493, 0.3170734, 0.2676949, 0, 0.8862745, 1, 1,
0.01702322, 0.6071181, -0.3969787, 0, 0.8784314, 1, 1,
0.01785062, -1.676921, 3.453211, 0, 0.8745098, 1, 1,
0.02031831, 0.4670483, 1.288093, 0, 0.8666667, 1, 1,
0.02429869, -0.262657, 3.554765, 0, 0.8627451, 1, 1,
0.02912324, 0.1523645, 0.1408844, 0, 0.854902, 1, 1,
0.03465769, -0.6203712, 2.617749, 0, 0.8509804, 1, 1,
0.03580407, 0.02867542, 1.098069, 0, 0.8431373, 1, 1,
0.0416395, 0.419245, -1.691487, 0, 0.8392157, 1, 1,
0.04271432, 0.5009394, -0.1959972, 0, 0.8313726, 1, 1,
0.04443407, -0.003691981, 1.462039, 0, 0.827451, 1, 1,
0.04482312, 1.599921, -1.268544, 0, 0.8196079, 1, 1,
0.04885206, 0.2087118, 0.8973184, 0, 0.8156863, 1, 1,
0.04915764, -0.4685371, 4.2008, 0, 0.8078431, 1, 1,
0.05420217, 1.24368, -0.3107503, 0, 0.8039216, 1, 1,
0.05792147, 0.05597613, 1.464831, 0, 0.7960784, 1, 1,
0.05959647, -0.6217616, 1.653879, 0, 0.7882353, 1, 1,
0.05968741, -0.2239402, 5.57703, 0, 0.7843137, 1, 1,
0.06174926, -0.6816255, 2.444579, 0, 0.7764706, 1, 1,
0.06218635, -0.5996934, 4.34544, 0, 0.772549, 1, 1,
0.06809631, -0.3039845, 2.445251, 0, 0.7647059, 1, 1,
0.06936463, -0.09155256, 1.475073, 0, 0.7607843, 1, 1,
0.07143065, -1.815599, 3.317271, 0, 0.7529412, 1, 1,
0.08130752, 1.059703, 0.8189328, 0, 0.7490196, 1, 1,
0.08267865, -1.052936, 4.478518, 0, 0.7411765, 1, 1,
0.08276555, -0.9948192, 4.163566, 0, 0.7372549, 1, 1,
0.08423387, 0.8141567, -0.289552, 0, 0.7294118, 1, 1,
0.08455414, 1.710455, -0.452959, 0, 0.7254902, 1, 1,
0.08598665, -0.6739043, 1.820435, 0, 0.7176471, 1, 1,
0.08675313, -0.4136921, 1.855922, 0, 0.7137255, 1, 1,
0.08675519, 0.1294618, 1.871162, 0, 0.7058824, 1, 1,
0.09313364, 0.4951976, 0.1802495, 0, 0.6980392, 1, 1,
0.09368186, -1.508054, 1.592359, 0, 0.6941177, 1, 1,
0.09652212, 0.5378225, 0.31178, 0, 0.6862745, 1, 1,
0.09691676, 0.6269166, 0.4511204, 0, 0.682353, 1, 1,
0.09782031, 1.962231, 0.1963373, 0, 0.6745098, 1, 1,
0.1010224, -0.2813915, 4.431832, 0, 0.6705883, 1, 1,
0.1027087, 0.9842038, 0.4057427, 0, 0.6627451, 1, 1,
0.1031736, -1.733415, 3.157789, 0, 0.6588235, 1, 1,
0.1040074, -0.1772986, 1.956487, 0, 0.6509804, 1, 1,
0.1051726, 1.372894, 0.9104979, 0, 0.6470588, 1, 1,
0.106488, -0.6827033, 2.871638, 0, 0.6392157, 1, 1,
0.1065525, 0.7905713, -1.083672, 0, 0.6352941, 1, 1,
0.1083175, 1.637989, 0.4392856, 0, 0.627451, 1, 1,
0.109278, 0.6104833, 0.5608829, 0, 0.6235294, 1, 1,
0.1200679, -0.5770787, 2.745535, 0, 0.6156863, 1, 1,
0.1202188, -0.2404994, 0.5124141, 0, 0.6117647, 1, 1,
0.1231062, -1.080333, 2.239832, 0, 0.6039216, 1, 1,
0.1285119, -0.5919842, 3.362399, 0, 0.5960785, 1, 1,
0.1289218, 0.9140993, 1.764181, 0, 0.5921569, 1, 1,
0.1293127, 0.1766039, 0.8106666, 0, 0.5843138, 1, 1,
0.1329085, -2.121007, 3.580142, 0, 0.5803922, 1, 1,
0.1355397, 2.612486, -1.205765, 0, 0.572549, 1, 1,
0.1365181, -2.534909, 2.947202, 0, 0.5686275, 1, 1,
0.142979, -1.128354, 2.573471, 0, 0.5607843, 1, 1,
0.1497352, -0.3236658, 2.653838, 0, 0.5568628, 1, 1,
0.1547946, -0.01852663, 0.9154601, 0, 0.5490196, 1, 1,
0.1649468, -1.324317, 3.845214, 0, 0.5450981, 1, 1,
0.1673776, 0.1097174, -0.7597582, 0, 0.5372549, 1, 1,
0.1689043, -0.129872, 2.328117, 0, 0.5333334, 1, 1,
0.1704275, -1.345739, 1.590268, 0, 0.5254902, 1, 1,
0.1710781, -1.276125, 3.423743, 0, 0.5215687, 1, 1,
0.1779898, -0.1827156, 1.273454, 0, 0.5137255, 1, 1,
0.1783485, 0.111464, 0.7185823, 0, 0.509804, 1, 1,
0.1796865, -0.05783926, 2.031707, 0, 0.5019608, 1, 1,
0.1798302, 0.6906928, -1.054722, 0, 0.4941176, 1, 1,
0.1838739, -0.806704, 2.379941, 0, 0.4901961, 1, 1,
0.1892231, 0.5158135, 0.828737, 0, 0.4823529, 1, 1,
0.1929623, 1.734238, 2.138258, 0, 0.4784314, 1, 1,
0.1948142, -2.087235, 2.586796, 0, 0.4705882, 1, 1,
0.2004736, -0.4089555, 0.2972763, 0, 0.4666667, 1, 1,
0.2085917, -2.187818, 2.641724, 0, 0.4588235, 1, 1,
0.211718, -0.01595422, 0.1240102, 0, 0.454902, 1, 1,
0.2148443, -1.850039, 2.028573, 0, 0.4470588, 1, 1,
0.2227342, -1.367266, 2.907298, 0, 0.4431373, 1, 1,
0.2284346, 0.2075601, 1.380823, 0, 0.4352941, 1, 1,
0.2297287, -1.171465, 2.383563, 0, 0.4313726, 1, 1,
0.2330678, -0.9179388, 1.9825, 0, 0.4235294, 1, 1,
0.2376506, 0.3765915, -0.4154957, 0, 0.4196078, 1, 1,
0.2410585, 0.6449752, 0.5983459, 0, 0.4117647, 1, 1,
0.244299, 0.1755668, 0.9222341, 0, 0.4078431, 1, 1,
0.244619, -0.33411, 3.554321, 0, 0.4, 1, 1,
0.2464402, -0.2534491, 3.106406, 0, 0.3921569, 1, 1,
0.2527188, 1.304525, 1.080499, 0, 0.3882353, 1, 1,
0.2531168, -0.2094469, 2.901585, 0, 0.3803922, 1, 1,
0.2539807, -0.02902919, 0.6838245, 0, 0.3764706, 1, 1,
0.2546348, -0.8705601, 3.363328, 0, 0.3686275, 1, 1,
0.2581563, 1.343431, 1.366534, 0, 0.3647059, 1, 1,
0.260457, 0.1411995, 1.034988, 0, 0.3568628, 1, 1,
0.2606828, 0.5426754, -0.03607627, 0, 0.3529412, 1, 1,
0.2664753, 0.1297783, -0.1264208, 0, 0.345098, 1, 1,
0.2665764, 1.795573, -0.996301, 0, 0.3411765, 1, 1,
0.2667171, 1.459154, -0.6145094, 0, 0.3333333, 1, 1,
0.2716017, 0.02470552, 1.890687, 0, 0.3294118, 1, 1,
0.2718747, 0.6833584, 0.07100442, 0, 0.3215686, 1, 1,
0.2721018, 1.40528, 0.1865768, 0, 0.3176471, 1, 1,
0.2784271, -0.8791979, 2.829978, 0, 0.3098039, 1, 1,
0.2787311, -0.1463575, 1.734866, 0, 0.3058824, 1, 1,
0.2845955, 1.280199, -1.743331, 0, 0.2980392, 1, 1,
0.2853063, -0.859732, 3.312661, 0, 0.2901961, 1, 1,
0.287953, -0.2612225, 0.2184284, 0, 0.2862745, 1, 1,
0.2934761, 0.6595157, 3.333336, 0, 0.2784314, 1, 1,
0.2969585, 1.574261, 1.704385, 0, 0.2745098, 1, 1,
0.3015265, 2.713097, -0.4318779, 0, 0.2666667, 1, 1,
0.3021341, -2.445439, 2.255315, 0, 0.2627451, 1, 1,
0.3024555, -0.5355188, 1.479276, 0, 0.254902, 1, 1,
0.3071358, 0.06507163, 2.251662, 0, 0.2509804, 1, 1,
0.3098213, 0.00461547, 1.369885, 0, 0.2431373, 1, 1,
0.3119327, 0.307632, -1.058471, 0, 0.2392157, 1, 1,
0.3121927, -0.5759263, 4.158721, 0, 0.2313726, 1, 1,
0.313329, -0.695868, 2.344124, 0, 0.227451, 1, 1,
0.3154253, -0.9013796, 5.786909, 0, 0.2196078, 1, 1,
0.3162074, -0.4457693, 1.711634, 0, 0.2156863, 1, 1,
0.3172356, -0.05969285, 0.8789271, 0, 0.2078431, 1, 1,
0.318929, -0.9440277, 1.838472, 0, 0.2039216, 1, 1,
0.3193564, -0.2986276, 0.8517304, 0, 0.1960784, 1, 1,
0.3196502, -0.1592645, 1.686412, 0, 0.1882353, 1, 1,
0.3284275, 0.1178565, 3.151512, 0, 0.1843137, 1, 1,
0.3294363, 0.1944026, 2.270273, 0, 0.1764706, 1, 1,
0.330687, 0.9690948, 0.2458389, 0, 0.172549, 1, 1,
0.3332758, 1.001812, -0.3346195, 0, 0.1647059, 1, 1,
0.3390379, -1.182144, 3.437137, 0, 0.1607843, 1, 1,
0.3469991, 0.8647078, -0.8285348, 0, 0.1529412, 1, 1,
0.3497238, -0.5035154, 1.328598, 0, 0.1490196, 1, 1,
0.35002, 0.4446568, 1.502399, 0, 0.1411765, 1, 1,
0.3507033, -0.1512793, 1.890944, 0, 0.1372549, 1, 1,
0.3532987, 0.3919658, -2.02685, 0, 0.1294118, 1, 1,
0.3550188, 1.285942, 0.4455351, 0, 0.1254902, 1, 1,
0.3550926, -1.962235, 3.811081, 0, 0.1176471, 1, 1,
0.3561581, -0.8434741, 3.700485, 0, 0.1137255, 1, 1,
0.3571142, 0.6653451, -1.134118, 0, 0.1058824, 1, 1,
0.357731, -0.8762963, 1.638783, 0, 0.09803922, 1, 1,
0.3651097, -1.255674, 2.203074, 0, 0.09411765, 1, 1,
0.3700872, -0.1980128, 1.176002, 0, 0.08627451, 1, 1,
0.3702923, 1.393444, 0.674669, 0, 0.08235294, 1, 1,
0.3746829, 1.68541, 1.277438, 0, 0.07450981, 1, 1,
0.3749808, 0.0217238, 1.546949, 0, 0.07058824, 1, 1,
0.3749921, -0.5650391, 3.214298, 0, 0.0627451, 1, 1,
0.3777341, -0.2065988, 1.832459, 0, 0.05882353, 1, 1,
0.383425, 1.549914, 1.888299, 0, 0.05098039, 1, 1,
0.3844258, 1.385654, 1.814991, 0, 0.04705882, 1, 1,
0.3920456, 0.5046949, 0.2109032, 0, 0.03921569, 1, 1,
0.3931387, -0.2074817, 0.631782, 0, 0.03529412, 1, 1,
0.3932979, -1.076394, 2.790336, 0, 0.02745098, 1, 1,
0.3937606, -0.9078622, 3.1456, 0, 0.02352941, 1, 1,
0.3951263, -0.8956257, 4.410849, 0, 0.01568628, 1, 1,
0.3961836, -0.3232937, 1.883993, 0, 0.01176471, 1, 1,
0.3985898, -1.241687, 3.364109, 0, 0.003921569, 1, 1,
0.3993658, 1.711763, 1.283787, 0.003921569, 0, 1, 1,
0.399859, -0.1668739, 2.139709, 0.007843138, 0, 1, 1,
0.4019636, -0.700263, 1.792371, 0.01568628, 0, 1, 1,
0.409106, -0.5928242, 2.895456, 0.01960784, 0, 1, 1,
0.4099357, 0.1556898, 1.966975, 0.02745098, 0, 1, 1,
0.4138857, -1.149481, 3.549448, 0.03137255, 0, 1, 1,
0.4214646, -0.2156715, 1.216173, 0.03921569, 0, 1, 1,
0.4236738, 1.763413, -0.5268177, 0.04313726, 0, 1, 1,
0.426289, -0.4088137, 2.636479, 0.05098039, 0, 1, 1,
0.4305808, -0.5994674, 3.475595, 0.05490196, 0, 1, 1,
0.4331143, 1.150268, 0.3769403, 0.0627451, 0, 1, 1,
0.4384587, -0.8866315, 2.377917, 0.06666667, 0, 1, 1,
0.4407184, -0.8230658, 1.294722, 0.07450981, 0, 1, 1,
0.4426838, -0.6877069, 2.374465, 0.07843138, 0, 1, 1,
0.4480108, -0.4362573, 3.128577, 0.08627451, 0, 1, 1,
0.4534438, 1.111271, -1.735486, 0.09019608, 0, 1, 1,
0.4585253, -0.7738104, 2.351895, 0.09803922, 0, 1, 1,
0.4592987, -0.04577093, 1.146074, 0.1058824, 0, 1, 1,
0.4604051, -0.01755414, 1.275181, 0.1098039, 0, 1, 1,
0.4628903, 0.08272535, 0.4539327, 0.1176471, 0, 1, 1,
0.4648194, -2.558666, 0.766026, 0.1215686, 0, 1, 1,
0.4699803, -1.254802, 3.521531, 0.1294118, 0, 1, 1,
0.4708531, 0.2870739, 2.329675, 0.1333333, 0, 1, 1,
0.4735989, 1.009441, 0.5560377, 0.1411765, 0, 1, 1,
0.4737491, 0.01707052, 1.820593, 0.145098, 0, 1, 1,
0.4786691, -2.013421, 1.15558, 0.1529412, 0, 1, 1,
0.484483, 2.692529, 2.609205, 0.1568628, 0, 1, 1,
0.4881938, 1.209066, 1.369909, 0.1647059, 0, 1, 1,
0.4930777, 0.2988999, 0.3313848, 0.1686275, 0, 1, 1,
0.5012144, -0.5164523, 3.920931, 0.1764706, 0, 1, 1,
0.5024959, -1.036813, 3.945336, 0.1803922, 0, 1, 1,
0.5059457, -0.7277768, 3.336954, 0.1882353, 0, 1, 1,
0.5113831, -1.111374, 1.084612, 0.1921569, 0, 1, 1,
0.515977, 0.5236403, -0.2711266, 0.2, 0, 1, 1,
0.523656, 1.72321, -0.6410128, 0.2078431, 0, 1, 1,
0.5248269, -0.4690244, 2.637043, 0.2117647, 0, 1, 1,
0.5256042, -0.3576128, 2.639472, 0.2196078, 0, 1, 1,
0.526602, 0.664602, 0.5553092, 0.2235294, 0, 1, 1,
0.5290011, -0.7839543, 1.993753, 0.2313726, 0, 1, 1,
0.5291396, 0.3994097, 0.9784358, 0.2352941, 0, 1, 1,
0.5297088, -0.3810137, 2.62078, 0.2431373, 0, 1, 1,
0.5351256, -0.4336643, 1.688174, 0.2470588, 0, 1, 1,
0.5351796, -0.8055846, 0.6432749, 0.254902, 0, 1, 1,
0.5353085, 0.378916, 0.8926916, 0.2588235, 0, 1, 1,
0.5412973, 0.2069994, -0.1024749, 0.2666667, 0, 1, 1,
0.5429913, 1.474928, 0.7495472, 0.2705882, 0, 1, 1,
0.5499911, -0.1370439, 1.5301, 0.2784314, 0, 1, 1,
0.5513195, -0.9191949, 1.150354, 0.282353, 0, 1, 1,
0.5536778, 0.2138329, 2.404457, 0.2901961, 0, 1, 1,
0.5584993, -0.3161254, 2.069786, 0.2941177, 0, 1, 1,
0.5611134, 1.253905, -0.641762, 0.3019608, 0, 1, 1,
0.5614313, -0.9541669, 1.459833, 0.3098039, 0, 1, 1,
0.5615575, 0.4214159, 0.221902, 0.3137255, 0, 1, 1,
0.5651965, -2.119736, 4.413995, 0.3215686, 0, 1, 1,
0.5707945, 1.600758, -0.166026, 0.3254902, 0, 1, 1,
0.5728773, 0.2443444, -0.6648934, 0.3333333, 0, 1, 1,
0.5768827, 0.5761865, 1.127507, 0.3372549, 0, 1, 1,
0.580747, 2.332959, -2.119208, 0.345098, 0, 1, 1,
0.5827653, 0.2791112, 2.699112, 0.3490196, 0, 1, 1,
0.5828139, 0.4284835, 1.635576, 0.3568628, 0, 1, 1,
0.5862232, -1.072985, 1.913368, 0.3607843, 0, 1, 1,
0.5900819, -0.7718394, 3.392391, 0.3686275, 0, 1, 1,
0.5947017, -1.344282, 3.549325, 0.372549, 0, 1, 1,
0.5987929, -0.07926303, 1.565587, 0.3803922, 0, 1, 1,
0.6038353, 0.3507435, 1.668365, 0.3843137, 0, 1, 1,
0.6091903, 9.526157e-05, 2.918922, 0.3921569, 0, 1, 1,
0.6099665, 0.3916755, -0.7651988, 0.3960784, 0, 1, 1,
0.615653, -0.9583111, 3.086253, 0.4039216, 0, 1, 1,
0.6209587, 0.08943301, -0.02776174, 0.4117647, 0, 1, 1,
0.6214749, -0.4834757, 3.155135, 0.4156863, 0, 1, 1,
0.6240616, -2.253458, 2.757234, 0.4235294, 0, 1, 1,
0.6270193, 1.027701, 0.3807283, 0.427451, 0, 1, 1,
0.6298938, -1.057861, 3.740422, 0.4352941, 0, 1, 1,
0.6340131, -2.372589, 3.743549, 0.4392157, 0, 1, 1,
0.6348064, -0.9996179, 2.188782, 0.4470588, 0, 1, 1,
0.635471, -0.3679177, 2.7419, 0.4509804, 0, 1, 1,
0.6365048, 0.3994553, 0.2058996, 0.4588235, 0, 1, 1,
0.6386793, 0.0913211, 1.171099, 0.4627451, 0, 1, 1,
0.6440607, -0.8208616, 3.046535, 0.4705882, 0, 1, 1,
0.6458601, -0.5993283, 2.944579, 0.4745098, 0, 1, 1,
0.64882, -1.111743, 1.06674, 0.4823529, 0, 1, 1,
0.6489825, 0.3812051, 0.7855847, 0.4862745, 0, 1, 1,
0.6547615, -1.103405, 2.9993, 0.4941176, 0, 1, 1,
0.6557913, 0.5857207, 1.084375, 0.5019608, 0, 1, 1,
0.6605215, 0.4622998, 2.649975, 0.5058824, 0, 1, 1,
0.6638546, 0.008834024, 2.275043, 0.5137255, 0, 1, 1,
0.6648364, -0.9955711, 1.775611, 0.5176471, 0, 1, 1,
0.6654447, -1.789779, 2.77542, 0.5254902, 0, 1, 1,
0.6666917, -0.1753664, 1.558426, 0.5294118, 0, 1, 1,
0.6762471, -0.2047137, 2.288787, 0.5372549, 0, 1, 1,
0.6774356, 0.2891111, 2.430467, 0.5411765, 0, 1, 1,
0.6838731, -1.535533, 3.283667, 0.5490196, 0, 1, 1,
0.6880336, -1.161102, 3.403199, 0.5529412, 0, 1, 1,
0.6884397, -0.3461672, 3.201182, 0.5607843, 0, 1, 1,
0.6889399, 0.8294168, 1.649357, 0.5647059, 0, 1, 1,
0.6917213, 0.2649918, 2.192228, 0.572549, 0, 1, 1,
0.6982151, -0.5555638, 3.006772, 0.5764706, 0, 1, 1,
0.7045212, -0.1964094, -1.439633, 0.5843138, 0, 1, 1,
0.7062049, 1.010439, -1.445511, 0.5882353, 0, 1, 1,
0.7115096, -0.896856, 1.554208, 0.5960785, 0, 1, 1,
0.7134017, 0.09792586, 1.564855, 0.6039216, 0, 1, 1,
0.7159062, 0.8183331, 1.157701, 0.6078432, 0, 1, 1,
0.7216533, 1.282786, -0.7525661, 0.6156863, 0, 1, 1,
0.7243744, 0.05331944, 2.362755, 0.6196079, 0, 1, 1,
0.7267678, -0.03282718, 1.957862, 0.627451, 0, 1, 1,
0.7295548, 1.521281, -0.7962583, 0.6313726, 0, 1, 1,
0.7344866, 1.91567, 0.1790705, 0.6392157, 0, 1, 1,
0.7355381, 0.543568, 0.5206499, 0.6431373, 0, 1, 1,
0.7363529, -1.285871, 3.48616, 0.6509804, 0, 1, 1,
0.7393838, -1.923937, 3.362359, 0.654902, 0, 1, 1,
0.7400966, -0.6399964, 2.507915, 0.6627451, 0, 1, 1,
0.7440347, 1.879907, 1.498522, 0.6666667, 0, 1, 1,
0.7443804, 1.031634, 1.736759, 0.6745098, 0, 1, 1,
0.7443843, 0.5752641, 0.3811924, 0.6784314, 0, 1, 1,
0.7571173, 1.654401, 0.1011641, 0.6862745, 0, 1, 1,
0.7573223, 1.158688, -0.9314393, 0.6901961, 0, 1, 1,
0.763077, 0.1760276, -0.3692431, 0.6980392, 0, 1, 1,
0.7644879, 2.561448, 0.8034195, 0.7058824, 0, 1, 1,
0.7660235, -0.2320641, 1.803324, 0.7098039, 0, 1, 1,
0.7705562, -0.5944946, 2.814172, 0.7176471, 0, 1, 1,
0.7763548, -0.3081421, 2.954853, 0.7215686, 0, 1, 1,
0.7867345, -0.9774963, 3.749852, 0.7294118, 0, 1, 1,
0.7904401, -0.004578161, 2.13512, 0.7333333, 0, 1, 1,
0.7985761, -1.382748, 0.8783472, 0.7411765, 0, 1, 1,
0.8004258, -0.02418838, 0.9348701, 0.7450981, 0, 1, 1,
0.8070789, 0.5436011, 1.137531, 0.7529412, 0, 1, 1,
0.8139308, -0.8145145, 0.9859651, 0.7568628, 0, 1, 1,
0.8201591, -0.1715502, 1.057122, 0.7647059, 0, 1, 1,
0.8278126, 0.01675907, 1.750533, 0.7686275, 0, 1, 1,
0.8310821, -0.09889294, 2.539706, 0.7764706, 0, 1, 1,
0.8369471, -1.715813, 2.543248, 0.7803922, 0, 1, 1,
0.8412125, -1.93177, 3.44651, 0.7882353, 0, 1, 1,
0.8482903, 1.99891, 0.3105288, 0.7921569, 0, 1, 1,
0.8501898, 1.451617, -0.5199182, 0.8, 0, 1, 1,
0.8506256, 0.3878992, 1.415272, 0.8078431, 0, 1, 1,
0.8525256, -1.379628, 3.105857, 0.8117647, 0, 1, 1,
0.8578617, -0.4103063, 1.205944, 0.8196079, 0, 1, 1,
0.8584535, 0.5672901, -0.02909379, 0.8235294, 0, 1, 1,
0.8620146, -1.584636, 1.570643, 0.8313726, 0, 1, 1,
0.8654051, -2.048569, 3.541141, 0.8352941, 0, 1, 1,
0.8668463, -0.730978, 1.505108, 0.8431373, 0, 1, 1,
0.8758717, -0.8768392, 1.956035, 0.8470588, 0, 1, 1,
0.882769, -0.5716564, 1.543441, 0.854902, 0, 1, 1,
0.8841906, -0.519021, 2.072714, 0.8588235, 0, 1, 1,
0.8900288, 3.024955, 0.2165289, 0.8666667, 0, 1, 1,
0.8939488, -1.238156, 1.777183, 0.8705882, 0, 1, 1,
0.8964865, -0.0899008, 1.279403, 0.8784314, 0, 1, 1,
0.8976265, -0.3708219, 0.6110061, 0.8823529, 0, 1, 1,
0.8980756, 0.2783739, 0.3061321, 0.8901961, 0, 1, 1,
0.9025862, 1.521718, 1.019365, 0.8941177, 0, 1, 1,
0.9031155, -1.788947, 3.994312, 0.9019608, 0, 1, 1,
0.9091429, -0.5301407, 4.075345, 0.9098039, 0, 1, 1,
0.9112192, 0.3157589, 1.022523, 0.9137255, 0, 1, 1,
0.9193739, -0.6255813, 1.718866, 0.9215686, 0, 1, 1,
0.9194015, 1.99038, -0.2858373, 0.9254902, 0, 1, 1,
0.9196358, 0.4827474, -0.1716149, 0.9333333, 0, 1, 1,
0.9222857, 0.8357561, 0.1284713, 0.9372549, 0, 1, 1,
0.9243697, -1.267638, 3.95668, 0.945098, 0, 1, 1,
0.9358634, -0.2573342, 2.391726, 0.9490196, 0, 1, 1,
0.9397239, 0.1199037, -0.9729736, 0.9568627, 0, 1, 1,
0.9472967, -0.9943545, 2.132867, 0.9607843, 0, 1, 1,
0.9532825, 1.457259, 2.157346, 0.9686275, 0, 1, 1,
0.9555834, -1.34993, 3.864881, 0.972549, 0, 1, 1,
0.9557105, 0.9182022, 0.6446579, 0.9803922, 0, 1, 1,
0.959973, -1.518074, 3.84856, 0.9843137, 0, 1, 1,
0.9625361, -0.8123295, 1.309138, 0.9921569, 0, 1, 1,
0.9644146, 1.937236, 1.269072, 0.9960784, 0, 1, 1,
0.9680455, -0.02419961, 1.922923, 1, 0, 0.9960784, 1,
0.972138, -0.1983778, 1.349012, 1, 0, 0.9882353, 1,
0.9751796, 0.5394427, 1.226458, 1, 0, 0.9843137, 1,
0.9939191, 1.181872, -0.6973015, 1, 0, 0.9764706, 1,
0.9950516, 0.2529663, 2.255429, 1, 0, 0.972549, 1,
1.001661, -1.58963, 1.282745, 1, 0, 0.9647059, 1,
1.006907, -0.5600131, 3.457413, 1, 0, 0.9607843, 1,
1.007204, -0.7447706, 3.615292, 1, 0, 0.9529412, 1,
1.01306, -0.298679, 2.90958, 1, 0, 0.9490196, 1,
1.018966, 0.3489064, -0.199019, 1, 0, 0.9411765, 1,
1.020554, 1.081251, 1.652817, 1, 0, 0.9372549, 1,
1.025957, 0.9452554, -0.6287047, 1, 0, 0.9294118, 1,
1.030697, 1.508185, -0.8461764, 1, 0, 0.9254902, 1,
1.031605, -2.337724, 1.310449, 1, 0, 0.9176471, 1,
1.031893, -0.3748776, 3.803637, 1, 0, 0.9137255, 1,
1.040852, 0.2353158, 2.145924, 1, 0, 0.9058824, 1,
1.044544, -0.7253462, 4.642926, 1, 0, 0.9019608, 1,
1.048495, -0.5330019, 2.799165, 1, 0, 0.8941177, 1,
1.048915, 0.6604492, 1.793646, 1, 0, 0.8862745, 1,
1.051888, -0.1506371, 1.4149, 1, 0, 0.8823529, 1,
1.052897, 0.6441078, 2.721373, 1, 0, 0.8745098, 1,
1.056653, -0.3319276, 1.0935, 1, 0, 0.8705882, 1,
1.059168, 0.01320258, -0.2575108, 1, 0, 0.8627451, 1,
1.06186, -0.4233035, 0.8757882, 1, 0, 0.8588235, 1,
1.062884, 0.06408737, 1.79804, 1, 0, 0.8509804, 1,
1.070785, -1.354053, 2.948997, 1, 0, 0.8470588, 1,
1.071306, -0.5531545, 2.705615, 1, 0, 0.8392157, 1,
1.075956, 0.109731, 3.221061, 1, 0, 0.8352941, 1,
1.078316, 0.1287093, 3.184119, 1, 0, 0.827451, 1,
1.08225, -0.09627609, 2.230883, 1, 0, 0.8235294, 1,
1.089542, 1.667982, 0.4236782, 1, 0, 0.8156863, 1,
1.092888, 0.6012437, 0.432327, 1, 0, 0.8117647, 1,
1.100175, 0.41201, 2.437935, 1, 0, 0.8039216, 1,
1.110513, -1.237617, 2.799531, 1, 0, 0.7960784, 1,
1.110545, -0.848835, 1.472587, 1, 0, 0.7921569, 1,
1.110631, 0.6496711, 0.02107243, 1, 0, 0.7843137, 1,
1.111874, -0.3397264, 2.066924, 1, 0, 0.7803922, 1,
1.114961, -1.597128, 2.649562, 1, 0, 0.772549, 1,
1.119462, -0.7954019, 2.489745, 1, 0, 0.7686275, 1,
1.123046, 0.2107507, 2.592089, 1, 0, 0.7607843, 1,
1.127924, -0.286458, 2.538171, 1, 0, 0.7568628, 1,
1.143173, 0.3900286, 0.9494367, 1, 0, 0.7490196, 1,
1.157555, 1.344038, -0.1410818, 1, 0, 0.7450981, 1,
1.162276, -0.5796103, 2.650602, 1, 0, 0.7372549, 1,
1.168863, 1.316616, 0.1882347, 1, 0, 0.7333333, 1,
1.169829, -0.7785115, 2.229521, 1, 0, 0.7254902, 1,
1.177641, -1.436512, 0.4536087, 1, 0, 0.7215686, 1,
1.180542, 2.115973, 0.2387105, 1, 0, 0.7137255, 1,
1.186335, 0.2468766, 0.06741616, 1, 0, 0.7098039, 1,
1.189583, -0.1367813, 2.519539, 1, 0, 0.7019608, 1,
1.189953, 1.511036, 1.068671, 1, 0, 0.6941177, 1,
1.196121, -2.088323, 1.01203, 1, 0, 0.6901961, 1,
1.198586, 1.768109, 1.997448, 1, 0, 0.682353, 1,
1.201459, -1.131243, -1.186657, 1, 0, 0.6784314, 1,
1.202975, 0.3277405, 0.4601575, 1, 0, 0.6705883, 1,
1.20464, -0.2100879, 2.155728, 1, 0, 0.6666667, 1,
1.206174, -0.6663297, 3.210182, 1, 0, 0.6588235, 1,
1.209914, -0.4096663, 1.902497, 1, 0, 0.654902, 1,
1.21018, 0.1279573, 3.661784, 1, 0, 0.6470588, 1,
1.219707, 0.6980966, 1.46627, 1, 0, 0.6431373, 1,
1.226177, -0.05401664, -0.3490086, 1, 0, 0.6352941, 1,
1.230417, -0.053544, 2.327335, 1, 0, 0.6313726, 1,
1.234925, -0.4072292, 2.240439, 1, 0, 0.6235294, 1,
1.246265, 0.1579266, -0.5463241, 1, 0, 0.6196079, 1,
1.248075, 1.853991, 1.063596, 1, 0, 0.6117647, 1,
1.248588, 0.5439368, 0.03899695, 1, 0, 0.6078432, 1,
1.251055, -1.823388, 2.941293, 1, 0, 0.6, 1,
1.252105, 0.5977608, 1.076992, 1, 0, 0.5921569, 1,
1.253462, 0.5512807, 2.429929, 1, 0, 0.5882353, 1,
1.266304, 1.336424, 2.147352, 1, 0, 0.5803922, 1,
1.266439, -0.4401803, 1.977167, 1, 0, 0.5764706, 1,
1.275064, 1.64339, -0.7774448, 1, 0, 0.5686275, 1,
1.278116, -1.364611, -0.08447062, 1, 0, 0.5647059, 1,
1.278988, -0.1364596, 2.536588, 1, 0, 0.5568628, 1,
1.28368, 0.25937, 0.6943837, 1, 0, 0.5529412, 1,
1.28441, 0.6013162, 2.053164, 1, 0, 0.5450981, 1,
1.292432, -1.760009, 1.937468, 1, 0, 0.5411765, 1,
1.300832, 2.074854, 1.889256, 1, 0, 0.5333334, 1,
1.314603, 0.8384603, -0.1130364, 1, 0, 0.5294118, 1,
1.318139, -1.066751, 2.040443, 1, 0, 0.5215687, 1,
1.332683, -1.101324, 3.507653, 1, 0, 0.5176471, 1,
1.343804, 0.7640259, 1.478997, 1, 0, 0.509804, 1,
1.353213, -0.08671422, -0.132967, 1, 0, 0.5058824, 1,
1.383685, -0.1337321, 1.425379, 1, 0, 0.4980392, 1,
1.387212, 0.9128922, 0.2000567, 1, 0, 0.4901961, 1,
1.399489, -1.819922, 2.995291, 1, 0, 0.4862745, 1,
1.400122, -0.01231522, 2.388666, 1, 0, 0.4784314, 1,
1.407938, -0.3087298, 1.272687, 1, 0, 0.4745098, 1,
1.413209, -0.161338, 0.2562236, 1, 0, 0.4666667, 1,
1.419173, 1.154055, 0.3928295, 1, 0, 0.4627451, 1,
1.444064, -1.080155, 2.875744, 1, 0, 0.454902, 1,
1.445169, 1.597401, 1.069861, 1, 0, 0.4509804, 1,
1.464025, 1.329031, -1.090208, 1, 0, 0.4431373, 1,
1.464749, 1.034866, -0.2014344, 1, 0, 0.4392157, 1,
1.466214, -0.7922281, 1.884091, 1, 0, 0.4313726, 1,
1.472265, -0.972149, 2.189352, 1, 0, 0.427451, 1,
1.477409, -0.2324541, 1.777873, 1, 0, 0.4196078, 1,
1.485393, 1.51705, -1.170574, 1, 0, 0.4156863, 1,
1.502622, 1.061584, 0.8357305, 1, 0, 0.4078431, 1,
1.513384, -0.2118493, 1.8905, 1, 0, 0.4039216, 1,
1.532566, -1.236944, 2.492825, 1, 0, 0.3960784, 1,
1.552194, 1.265626, 1.157307, 1, 0, 0.3882353, 1,
1.556832, -2.189309, 2.625683, 1, 0, 0.3843137, 1,
1.564454, 1.735806, 2.396942, 1, 0, 0.3764706, 1,
1.572154, -1.544724, 2.434048, 1, 0, 0.372549, 1,
1.573684, 1.821565, 0.8565918, 1, 0, 0.3647059, 1,
1.586308, 1.42389, 2.577055, 1, 0, 0.3607843, 1,
1.611729, -0.6277007, 2.777278, 1, 0, 0.3529412, 1,
1.617244, -0.4186273, 0.3820378, 1, 0, 0.3490196, 1,
1.627608, 1.184508, 0.04487557, 1, 0, 0.3411765, 1,
1.638488, -0.6913481, 1.553338, 1, 0, 0.3372549, 1,
1.639231, -0.4730853, 4.095674, 1, 0, 0.3294118, 1,
1.641346, -0.6461104, 3.123982, 1, 0, 0.3254902, 1,
1.669788, -0.5917747, -0.09589254, 1, 0, 0.3176471, 1,
1.67479, 1.553235, 2.022744, 1, 0, 0.3137255, 1,
1.676158, 2.46978, 1.262625, 1, 0, 0.3058824, 1,
1.685277, -0.4954367, 2.333999, 1, 0, 0.2980392, 1,
1.710339, -0.6979966, 1.114287, 1, 0, 0.2941177, 1,
1.711857, -0.1877808, 2.794616, 1, 0, 0.2862745, 1,
1.716799, -0.1492239, 0.5886658, 1, 0, 0.282353, 1,
1.727733, -0.5362589, 1.032308, 1, 0, 0.2745098, 1,
1.737797, -0.6025653, 1.581072, 1, 0, 0.2705882, 1,
1.745876, 0.9148886, 1.007122, 1, 0, 0.2627451, 1,
1.759145, -1.834385, 2.541593, 1, 0, 0.2588235, 1,
1.784348, 0.3663969, 1.439069, 1, 0, 0.2509804, 1,
1.81624, -1.460335, 1.675991, 1, 0, 0.2470588, 1,
1.835302, -2.043105, 3.289444, 1, 0, 0.2392157, 1,
1.849665, 2.054896, -0.5300358, 1, 0, 0.2352941, 1,
1.867201, 1.854455, 1.406979, 1, 0, 0.227451, 1,
1.88196, -0.7409746, 1.611385, 1, 0, 0.2235294, 1,
1.888914, -1.043143, 0.5255503, 1, 0, 0.2156863, 1,
1.894849, 0.1558483, 0.2946641, 1, 0, 0.2117647, 1,
1.943819, -1.74565, 2.166303, 1, 0, 0.2039216, 1,
1.946503, 1.107591, 0.1053876, 1, 0, 0.1960784, 1,
1.949668, 2.054561, -0.8057328, 1, 0, 0.1921569, 1,
1.973284, -0.2272419, 2.31219, 1, 0, 0.1843137, 1,
1.97672, 1.722233, 1.677663, 1, 0, 0.1803922, 1,
1.987536, -0.08298613, 2.213368, 1, 0, 0.172549, 1,
1.996847, -1.271864, 2.290694, 1, 0, 0.1686275, 1,
2.015679, -1.101339, 1.403057, 1, 0, 0.1607843, 1,
2.064342, -0.4564635, 3.470855, 1, 0, 0.1568628, 1,
2.081268, 0.3922529, 1.537596, 1, 0, 0.1490196, 1,
2.113641, -0.8495343, 2.772452, 1, 0, 0.145098, 1,
2.141883, 0.364635, 3.387631, 1, 0, 0.1372549, 1,
2.193752, -1.010933, 3.15231, 1, 0, 0.1333333, 1,
2.201245, -0.9585639, 1.343539, 1, 0, 0.1254902, 1,
2.20406, -0.7441502, 2.491339, 1, 0, 0.1215686, 1,
2.20983, 1.101915, 1.384818, 1, 0, 0.1137255, 1,
2.21972, -0.6113783, 2.576652, 1, 0, 0.1098039, 1,
2.229739, 0.4403576, 2.164291, 1, 0, 0.1019608, 1,
2.255383, 0.8054286, 1.968144, 1, 0, 0.09411765, 1,
2.255633, 1.098134, 2.569659, 1, 0, 0.09019608, 1,
2.260633, -0.0854804, 2.265904, 1, 0, 0.08235294, 1,
2.30183, 0.1565612, 0.5246725, 1, 0, 0.07843138, 1,
2.316775, -1.021248, 2.658617, 1, 0, 0.07058824, 1,
2.322923, 0.5430014, 0.5980911, 1, 0, 0.06666667, 1,
2.33813, 0.939635, 1.205141, 1, 0, 0.05882353, 1,
2.377531, -1.821579, 1.685749, 1, 0, 0.05490196, 1,
2.390435, 0.3899076, 2.689598, 1, 0, 0.04705882, 1,
2.418472, 0.632008, 1.797266, 1, 0, 0.04313726, 1,
2.422272, -1.62681, 2.181589, 1, 0, 0.03529412, 1,
2.453249, -0.7317548, 1.642103, 1, 0, 0.03137255, 1,
2.525911, 1.515686, 0.5744381, 1, 0, 0.02352941, 1,
2.533991, -0.2073285, 3.527045, 1, 0, 0.01960784, 1,
2.672731, -0.6327175, 1.577483, 1, 0, 0.01176471, 1,
3.297806, -0.5518148, 3.08552, 1, 0, 0.007843138, 1
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
0.2134795, -4.217945, -7.182954, 0, -0.5, 0.5, 0.5,
0.2134795, -4.217945, -7.182954, 1, -0.5, 0.5, 0.5,
0.2134795, -4.217945, -7.182954, 1, 1.5, 0.5, 0.5,
0.2134795, -4.217945, -7.182954, 0, 1.5, 0.5, 0.5
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
-3.916434, 0.02495229, -7.182954, 0, -0.5, 0.5, 0.5,
-3.916434, 0.02495229, -7.182954, 1, -0.5, 0.5, 0.5,
-3.916434, 0.02495229, -7.182954, 1, 1.5, 0.5, 0.5,
-3.916434, 0.02495229, -7.182954, 0, 1.5, 0.5, 0.5
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
-3.916434, -4.217945, 0.2418628, 0, -0.5, 0.5, 0.5,
-3.916434, -4.217945, 0.2418628, 1, -0.5, 0.5, 0.5,
-3.916434, -4.217945, 0.2418628, 1, 1.5, 0.5, 0.5,
-3.916434, -4.217945, 0.2418628, 0, 1.5, 0.5, 0.5
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
-2, -3.238815, -5.469535,
3, -3.238815, -5.469535,
-2, -3.238815, -5.469535,
-2, -3.402003, -5.755105,
-1, -3.238815, -5.469535,
-1, -3.402003, -5.755105,
0, -3.238815, -5.469535,
0, -3.402003, -5.755105,
1, -3.238815, -5.469535,
1, -3.402003, -5.755105,
2, -3.238815, -5.469535,
2, -3.402003, -5.755105,
3, -3.238815, -5.469535,
3, -3.402003, -5.755105
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
-2, -3.72838, -6.326245, 0, -0.5, 0.5, 0.5,
-2, -3.72838, -6.326245, 1, -0.5, 0.5, 0.5,
-2, -3.72838, -6.326245, 1, 1.5, 0.5, 0.5,
-2, -3.72838, -6.326245, 0, 1.5, 0.5, 0.5,
-1, -3.72838, -6.326245, 0, -0.5, 0.5, 0.5,
-1, -3.72838, -6.326245, 1, -0.5, 0.5, 0.5,
-1, -3.72838, -6.326245, 1, 1.5, 0.5, 0.5,
-1, -3.72838, -6.326245, 0, 1.5, 0.5, 0.5,
0, -3.72838, -6.326245, 0, -0.5, 0.5, 0.5,
0, -3.72838, -6.326245, 1, -0.5, 0.5, 0.5,
0, -3.72838, -6.326245, 1, 1.5, 0.5, 0.5,
0, -3.72838, -6.326245, 0, 1.5, 0.5, 0.5,
1, -3.72838, -6.326245, 0, -0.5, 0.5, 0.5,
1, -3.72838, -6.326245, 1, -0.5, 0.5, 0.5,
1, -3.72838, -6.326245, 1, 1.5, 0.5, 0.5,
1, -3.72838, -6.326245, 0, 1.5, 0.5, 0.5,
2, -3.72838, -6.326245, 0, -0.5, 0.5, 0.5,
2, -3.72838, -6.326245, 1, -0.5, 0.5, 0.5,
2, -3.72838, -6.326245, 1, 1.5, 0.5, 0.5,
2, -3.72838, -6.326245, 0, 1.5, 0.5, 0.5,
3, -3.72838, -6.326245, 0, -0.5, 0.5, 0.5,
3, -3.72838, -6.326245, 1, -0.5, 0.5, 0.5,
3, -3.72838, -6.326245, 1, 1.5, 0.5, 0.5,
3, -3.72838, -6.326245, 0, 1.5, 0.5, 0.5
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
-2.963377, -3, -5.469535,
-2.963377, 3, -5.469535,
-2.963377, -3, -5.469535,
-3.12222, -3, -5.755105,
-2.963377, -2, -5.469535,
-3.12222, -2, -5.755105,
-2.963377, -1, -5.469535,
-3.12222, -1, -5.755105,
-2.963377, 0, -5.469535,
-3.12222, 0, -5.755105,
-2.963377, 1, -5.469535,
-3.12222, 1, -5.755105,
-2.963377, 2, -5.469535,
-3.12222, 2, -5.755105,
-2.963377, 3, -5.469535,
-3.12222, 3, -5.755105
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
-3.439905, -3, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, -3, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, -3, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, -3, -6.326245, 0, 1.5, 0.5, 0.5,
-3.439905, -2, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, -2, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, -2, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, -2, -6.326245, 0, 1.5, 0.5, 0.5,
-3.439905, -1, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, -1, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, -1, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, -1, -6.326245, 0, 1.5, 0.5, 0.5,
-3.439905, 0, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, 0, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, 0, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, 0, -6.326245, 0, 1.5, 0.5, 0.5,
-3.439905, 1, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, 1, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, 1, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, 1, -6.326245, 0, 1.5, 0.5, 0.5,
-3.439905, 2, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, 2, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, 2, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, 2, -6.326245, 0, 1.5, 0.5, 0.5,
-3.439905, 3, -6.326245, 0, -0.5, 0.5, 0.5,
-3.439905, 3, -6.326245, 1, -0.5, 0.5, 0.5,
-3.439905, 3, -6.326245, 1, 1.5, 0.5, 0.5,
-3.439905, 3, -6.326245, 0, 1.5, 0.5, 0.5
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
-2.963377, -3.238815, -4,
-2.963377, -3.238815, 4,
-2.963377, -3.238815, -4,
-3.12222, -3.402003, -4,
-2.963377, -3.238815, -2,
-3.12222, -3.402003, -2,
-2.963377, -3.238815, 0,
-3.12222, -3.402003, 0,
-2.963377, -3.238815, 2,
-3.12222, -3.402003, 2,
-2.963377, -3.238815, 4,
-3.12222, -3.402003, 4
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
-3.439905, -3.72838, -4, 0, -0.5, 0.5, 0.5,
-3.439905, -3.72838, -4, 1, -0.5, 0.5, 0.5,
-3.439905, -3.72838, -4, 1, 1.5, 0.5, 0.5,
-3.439905, -3.72838, -4, 0, 1.5, 0.5, 0.5,
-3.439905, -3.72838, -2, 0, -0.5, 0.5, 0.5,
-3.439905, -3.72838, -2, 1, -0.5, 0.5, 0.5,
-3.439905, -3.72838, -2, 1, 1.5, 0.5, 0.5,
-3.439905, -3.72838, -2, 0, 1.5, 0.5, 0.5,
-3.439905, -3.72838, 0, 0, -0.5, 0.5, 0.5,
-3.439905, -3.72838, 0, 1, -0.5, 0.5, 0.5,
-3.439905, -3.72838, 0, 1, 1.5, 0.5, 0.5,
-3.439905, -3.72838, 0, 0, 1.5, 0.5, 0.5,
-3.439905, -3.72838, 2, 0, -0.5, 0.5, 0.5,
-3.439905, -3.72838, 2, 1, -0.5, 0.5, 0.5,
-3.439905, -3.72838, 2, 1, 1.5, 0.5, 0.5,
-3.439905, -3.72838, 2, 0, 1.5, 0.5, 0.5,
-3.439905, -3.72838, 4, 0, -0.5, 0.5, 0.5,
-3.439905, -3.72838, 4, 1, -0.5, 0.5, 0.5,
-3.439905, -3.72838, 4, 1, 1.5, 0.5, 0.5,
-3.439905, -3.72838, 4, 0, 1.5, 0.5, 0.5
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
-2.963377, -3.238815, -5.469535,
-2.963377, 3.288719, -5.469535,
-2.963377, -3.238815, 5.95326,
-2.963377, 3.288719, 5.95326,
-2.963377, -3.238815, -5.469535,
-2.963377, -3.238815, 5.95326,
-2.963377, 3.288719, -5.469535,
-2.963377, 3.288719, 5.95326,
-2.963377, -3.238815, -5.469535,
3.390336, -3.238815, -5.469535,
-2.963377, -3.238815, 5.95326,
3.390336, -3.238815, 5.95326,
-2.963377, 3.288719, -5.469535,
3.390336, 3.288719, -5.469535,
-2.963377, 3.288719, 5.95326,
3.390336, 3.288719, 5.95326,
3.390336, -3.238815, -5.469535,
3.390336, 3.288719, -5.469535,
3.390336, -3.238815, 5.95326,
3.390336, 3.288719, 5.95326,
3.390336, -3.238815, -5.469535,
3.390336, -3.238815, 5.95326,
3.390336, 3.288719, -5.469535,
3.390336, 3.288719, 5.95326
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
var radius = 7.801576;
var distance = 34.71009;
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
mvMatrix.translate( -0.2134795, -0.02495229, -0.2418628 );
mvMatrix.scale( 1.327604, 1.292252, 0.7384546 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71009);
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
isouron<-read.table("isouron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isouron$V2
```

```
## Error in eval(expr, envir, enclos): object 'isouron' not found
```

```r
y<-isouron$V3
```

```
## Error in eval(expr, envir, enclos): object 'isouron' not found
```

```r
z<-isouron$V4
```

```
## Error in eval(expr, envir, enclos): object 'isouron' not found
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
-2.870847, 0.5851641, -1.499905, 0, 0, 1, 1, 1,
-2.628769, 0.4972594, -3.283922, 1, 0, 0, 1, 1,
-2.582923, 0.5037639, -1.498537, 1, 0, 0, 1, 1,
-2.463063, -0.03483124, -1.2745, 1, 0, 0, 1, 1,
-2.457902, -1.344542, -2.671888, 1, 0, 0, 1, 1,
-2.347343, 0.4174538, -0.9309189, 1, 0, 0, 1, 1,
-2.332706, -0.9704764, -1.405264, 0, 0, 0, 1, 1,
-2.326505, 1.411269, -2.496763, 0, 0, 0, 1, 1,
-2.296508, 1.574737, -1.194773, 0, 0, 0, 1, 1,
-2.117292, 0.8639422, -0.3114473, 0, 0, 0, 1, 1,
-2.110588, 2.773547, 0.3575028, 0, 0, 0, 1, 1,
-2.105623, -0.008702778, -1.758651, 0, 0, 0, 1, 1,
-2.099608, -1.319112, -2.900838, 0, 0, 0, 1, 1,
-2.088826, -1.851506, -2.800349, 1, 1, 1, 1, 1,
-2.070251, 0.03731689, -0.5378155, 1, 1, 1, 1, 1,
-2.068255, -0.4011333, -1.683671, 1, 1, 1, 1, 1,
-2.018494, 1.032746, -2.008675, 1, 1, 1, 1, 1,
-2.017672, 0.929047, -0.4463168, 1, 1, 1, 1, 1,
-1.992039, -0.6566482, -0.332258, 1, 1, 1, 1, 1,
-1.982736, -0.5240226, -1.814942, 1, 1, 1, 1, 1,
-1.97858, -0.7715374, -2.627864, 1, 1, 1, 1, 1,
-1.94603, -0.8122956, -3.454451, 1, 1, 1, 1, 1,
-1.930679, -2.02896, -1.056438, 1, 1, 1, 1, 1,
-1.928749, 1.138031, -0.3677694, 1, 1, 1, 1, 1,
-1.922486, 2.005048, 1.30519, 1, 1, 1, 1, 1,
-1.915431, 0.435293, -0.9840381, 1, 1, 1, 1, 1,
-1.906179, -1.719476, -3.28691, 1, 1, 1, 1, 1,
-1.902594, 1.047289, -0.3226078, 1, 1, 1, 1, 1,
-1.887503, -1.475731, -1.972005, 0, 0, 1, 1, 1,
-1.87821, -0.7123123, -2.31482, 1, 0, 0, 1, 1,
-1.87579, -0.7684938, -1.315258, 1, 0, 0, 1, 1,
-1.872156, -0.3785864, -0.9184513, 1, 0, 0, 1, 1,
-1.811399, 1.34236, 0.4984286, 1, 0, 0, 1, 1,
-1.802125, 0.1818721, -1.443761, 1, 0, 0, 1, 1,
-1.801582, -0.2442823, -1.445817, 0, 0, 0, 1, 1,
-1.784284, 0.6965612, -1.46161, 0, 0, 0, 1, 1,
-1.752884, 0.4566236, -0.4970562, 0, 0, 0, 1, 1,
-1.73414, 1.38806, -1.252347, 0, 0, 0, 1, 1,
-1.714163, 0.8578627, 0.02275094, 0, 0, 0, 1, 1,
-1.710935, -1.706526, -3.224371, 0, 0, 0, 1, 1,
-1.707002, -1.219858, -2.694248, 0, 0, 0, 1, 1,
-1.705588, -0.008949504, -1.876658, 1, 1, 1, 1, 1,
-1.700256, -0.06116029, -1.831623, 1, 1, 1, 1, 1,
-1.689155, 2.592196, -0.02307503, 1, 1, 1, 1, 1,
-1.687992, 0.832127, -1.264199, 1, 1, 1, 1, 1,
-1.683463, -0.5541479, -3.088659, 1, 1, 1, 1, 1,
-1.681157, -1.528817, -2.436803, 1, 1, 1, 1, 1,
-1.659314, -0.4149746, -2.889804, 1, 1, 1, 1, 1,
-1.658143, -0.006155154, -1.579486, 1, 1, 1, 1, 1,
-1.657605, -0.2975281, -0.8842505, 1, 1, 1, 1, 1,
-1.647558, -0.7173649, -2.039959, 1, 1, 1, 1, 1,
-1.646945, 0.6957563, -1.545352, 1, 1, 1, 1, 1,
-1.643426, -1.003255, -1.045459, 1, 1, 1, 1, 1,
-1.631671, -1.070151, -1.540341, 1, 1, 1, 1, 1,
-1.626012, -0.8069175, -0.8413475, 1, 1, 1, 1, 1,
-1.618706, 0.3701462, -0.6147585, 1, 1, 1, 1, 1,
-1.600668, 2.326562, 0.556493, 0, 0, 1, 1, 1,
-1.5956, 0.2435752, -0.6595661, 1, 0, 0, 1, 1,
-1.594689, -1.975768, -1.787992, 1, 0, 0, 1, 1,
-1.552868, -0.6788101, -0.9742815, 1, 0, 0, 1, 1,
-1.552532, 0.5416512, -0.5819699, 1, 0, 0, 1, 1,
-1.544266, -0.3470492, -1.181177, 1, 0, 0, 1, 1,
-1.535514, -0.2925005, 0.9842163, 0, 0, 0, 1, 1,
-1.529833, 0.8005757, 1.062689, 0, 0, 0, 1, 1,
-1.522593, 0.8130455, -4.221598, 0, 0, 0, 1, 1,
-1.506868, -0.6343701, -1.647462, 0, 0, 0, 1, 1,
-1.504016, -0.7790611, -2.766655, 0, 0, 0, 1, 1,
-1.481099, 0.1143971, -1.935556, 0, 0, 0, 1, 1,
-1.478425, -0.2553251, -1.153583, 0, 0, 0, 1, 1,
-1.455511, 1.457832, -2.540238, 1, 1, 1, 1, 1,
-1.450266, -1.993138, -3.647949, 1, 1, 1, 1, 1,
-1.448079, 0.06989634, -1.191551, 1, 1, 1, 1, 1,
-1.442919, 0.8271379, -1.88426, 1, 1, 1, 1, 1,
-1.432806, 1.016358, -2.494218, 1, 1, 1, 1, 1,
-1.410618, 0.9717116, 0.3108467, 1, 1, 1, 1, 1,
-1.398379, 0.204806, -1.771173, 1, 1, 1, 1, 1,
-1.389956, -1.778059, -3.089908, 1, 1, 1, 1, 1,
-1.377488, 0.439296, -2.841304, 1, 1, 1, 1, 1,
-1.377023, -0.05662629, -2.359649, 1, 1, 1, 1, 1,
-1.359311, -0.7800595, -1.341259, 1, 1, 1, 1, 1,
-1.358335, 1.778907, 0.6659878, 1, 1, 1, 1, 1,
-1.352426, 2.103924, -2.022115, 1, 1, 1, 1, 1,
-1.351098, -1.616333, -3.501451, 1, 1, 1, 1, 1,
-1.343815, 0.6453516, -2.247738, 1, 1, 1, 1, 1,
-1.343486, 0.4385486, -1.106763, 0, 0, 1, 1, 1,
-1.343213, 0.4375452, -2.006936, 1, 0, 0, 1, 1,
-1.341983, 2.190468, -1.368907, 1, 0, 0, 1, 1,
-1.340954, 0.8434517, -2.291677, 1, 0, 0, 1, 1,
-1.338046, 0.01810952, -1.636836, 1, 0, 0, 1, 1,
-1.333276, -1.629381, -2.746256, 1, 0, 0, 1, 1,
-1.328194, -1.535034, -1.749761, 0, 0, 0, 1, 1,
-1.325523, -0.08243262, -3.601613, 0, 0, 0, 1, 1,
-1.314151, -0.9968826, -1.025007, 0, 0, 0, 1, 1,
-1.312979, -0.1665948, -1.648001, 0, 0, 0, 1, 1,
-1.307026, 0.07951798, -2.968799, 0, 0, 0, 1, 1,
-1.306794, -0.4130083, -2.670341, 0, 0, 0, 1, 1,
-1.293236, -0.8263364, -0.8604148, 0, 0, 0, 1, 1,
-1.283904, 1.526449, -0.388443, 1, 1, 1, 1, 1,
-1.277524, -2.196424, -0.9023005, 1, 1, 1, 1, 1,
-1.266633, -1.969165, -0.04144061, 1, 1, 1, 1, 1,
-1.26567, 0.3856541, -1.712399, 1, 1, 1, 1, 1,
-1.257349, 0.7261472, -1.853982, 1, 1, 1, 1, 1,
-1.247827, -0.6314625, -1.849033, 1, 1, 1, 1, 1,
-1.246786, 0.452832, 0.2709593, 1, 1, 1, 1, 1,
-1.236119, -1.035873, -1.161103, 1, 1, 1, 1, 1,
-1.23397, 0.3180266, -1.608547, 1, 1, 1, 1, 1,
-1.231378, -0.6941826, -2.350241, 1, 1, 1, 1, 1,
-1.226716, 1.018911, -0.2531745, 1, 1, 1, 1, 1,
-1.212293, -1.440726, -3.688471, 1, 1, 1, 1, 1,
-1.210335, -0.2205838, -1.518821, 1, 1, 1, 1, 1,
-1.206259, -0.6310001, -2.146307, 1, 1, 1, 1, 1,
-1.202029, -0.8539371, -4.013682, 1, 1, 1, 1, 1,
-1.195578, 1.119705, -0.9684787, 0, 0, 1, 1, 1,
-1.182954, -1.625111, -3.254228, 1, 0, 0, 1, 1,
-1.178346, -0.3931683, -1.760266, 1, 0, 0, 1, 1,
-1.176286, 0.5394621, -1.525379, 1, 0, 0, 1, 1,
-1.174212, 1.384526, 0.02368748, 1, 0, 0, 1, 1,
-1.172675, 1.013695, -0.5066619, 1, 0, 0, 1, 1,
-1.169147, 0.1404893, -0.5564438, 0, 0, 0, 1, 1,
-1.168068, 3.193658, 0.2106576, 0, 0, 0, 1, 1,
-1.164806, -3.143754, -2.614224, 0, 0, 0, 1, 1,
-1.164769, -0.1864251, -1.82609, 0, 0, 0, 1, 1,
-1.159804, 1.357727, -0.6593569, 0, 0, 0, 1, 1,
-1.159167, -0.3673775, -2.098089, 0, 0, 0, 1, 1,
-1.138273, 1.134961, -0.1248521, 0, 0, 0, 1, 1,
-1.133515, 0.1330684, -1.787423, 1, 1, 1, 1, 1,
-1.13108, -0.8409424, -0.2543074, 1, 1, 1, 1, 1,
-1.123789, -0.07156137, -1.113713, 1, 1, 1, 1, 1,
-1.113859, -1.110082, -2.444608, 1, 1, 1, 1, 1,
-1.102281, 1.818903, -0.1836947, 1, 1, 1, 1, 1,
-1.099492, -0.1102672, -2.633589, 1, 1, 1, 1, 1,
-1.0854, 0.5851231, -0.6750305, 1, 1, 1, 1, 1,
-1.078521, -0.3301513, -1.717408, 1, 1, 1, 1, 1,
-1.078348, -0.4488384, -1.90354, 1, 1, 1, 1, 1,
-1.069949, -0.1018211, -0.2897215, 1, 1, 1, 1, 1,
-1.066656, -1.183769, -1.093265, 1, 1, 1, 1, 1,
-1.063327, 0.2555718, -1.670955, 1, 1, 1, 1, 1,
-1.062251, 0.2861151, -1.914499, 1, 1, 1, 1, 1,
-1.053625, 0.1575874, -2.729139, 1, 1, 1, 1, 1,
-1.049815, -0.8895818, -2.062332, 1, 1, 1, 1, 1,
-1.048414, 0.5582656, -1.537944, 0, 0, 1, 1, 1,
-1.046219, 0.6690366, 0.09464705, 1, 0, 0, 1, 1,
-1.046067, 0.04109165, 0.2992128, 1, 0, 0, 1, 1,
-1.041583, 0.2233679, -2.77177, 1, 0, 0, 1, 1,
-1.038564, -0.4531901, -0.09131583, 1, 0, 0, 1, 1,
-1.036493, 0.6385775, -0.6038311, 1, 0, 0, 1, 1,
-1.035465, -0.9482908, -2.271277, 0, 0, 0, 1, 1,
-1.03297, -0.3167969, -2.108065, 0, 0, 0, 1, 1,
-1.031644, -0.7783408, -3.002515, 0, 0, 0, 1, 1,
-1.030084, -0.2304497, -2.763561, 0, 0, 0, 1, 1,
-1.02972, 0.7211955, -2.495268, 0, 0, 0, 1, 1,
-1.028917, -1.215342, -2.996719, 0, 0, 0, 1, 1,
-1.011281, 0.4893177, -1.218408, 0, 0, 0, 1, 1,
-1.0082, 1.029149, -0.2280383, 1, 1, 1, 1, 1,
-1.001288, 0.216505, -1.865968, 1, 1, 1, 1, 1,
-1.000786, 0.7565182, -1.584522, 1, 1, 1, 1, 1,
-0.9973685, 1.075245, 0.2733764, 1, 1, 1, 1, 1,
-0.99724, 0.8704125, -1.781559, 1, 1, 1, 1, 1,
-0.9964696, -0.6128643, -3.182353, 1, 1, 1, 1, 1,
-0.9963795, -0.4533926, -1.892049, 1, 1, 1, 1, 1,
-0.993591, 1.112108, -0.6564158, 1, 1, 1, 1, 1,
-0.9898105, 0.299055, -1.800604, 1, 1, 1, 1, 1,
-0.9892898, 1.208736, -0.4443545, 1, 1, 1, 1, 1,
-0.9810625, -0.1152, -1.179741, 1, 1, 1, 1, 1,
-0.9770385, 0.2562671, -0.5246292, 1, 1, 1, 1, 1,
-0.9704186, -0.7340381, -2.501507, 1, 1, 1, 1, 1,
-0.9691914, 1.280526, 1.791726, 1, 1, 1, 1, 1,
-0.9648804, 0.7823785, -1.271524, 1, 1, 1, 1, 1,
-0.9598442, -1.238257, -3.137334, 0, 0, 1, 1, 1,
-0.9460005, -0.5754349, -2.431841, 1, 0, 0, 1, 1,
-0.9455737, -0.6957265, -1.419051, 1, 0, 0, 1, 1,
-0.9435778, 0.2327201, -2.463067, 1, 0, 0, 1, 1,
-0.9430193, -0.6435851, -3.415389, 1, 0, 0, 1, 1,
-0.9428918, 0.6257222, -1.015938, 1, 0, 0, 1, 1,
-0.9425085, 0.197796, -1.470505, 0, 0, 0, 1, 1,
-0.9391969, -0.8393597, -2.089929, 0, 0, 0, 1, 1,
-0.9331543, -0.5831105, -2.772794, 0, 0, 0, 1, 1,
-0.9331031, -1.73733, -2.81031, 0, 0, 0, 1, 1,
-0.932379, -0.07308911, -1.639253, 0, 0, 0, 1, 1,
-0.9313419, -0.1352209, -1.403786, 0, 0, 0, 1, 1,
-0.9280072, 1.09443, 1.081744, 0, 0, 0, 1, 1,
-0.9192781, 0.03639178, -0.8356445, 1, 1, 1, 1, 1,
-0.9093176, 0.8804492, -1.772512, 1, 1, 1, 1, 1,
-0.9082087, 0.6431674, 0.6364702, 1, 1, 1, 1, 1,
-0.9073721, -0.4504765, -2.080121, 1, 1, 1, 1, 1,
-0.8955368, 1.742434, -2.16661, 1, 1, 1, 1, 1,
-0.8947407, 1.198025, -1.893667, 1, 1, 1, 1, 1,
-0.8925436, -1.070444, -0.5424497, 1, 1, 1, 1, 1,
-0.8897471, -0.996307, -1.059261, 1, 1, 1, 1, 1,
-0.886835, 1.188946, 0.6995698, 1, 1, 1, 1, 1,
-0.8855031, 1.45879, 0.7221465, 1, 1, 1, 1, 1,
-0.8852971, -1.366031, -2.252142, 1, 1, 1, 1, 1,
-0.879555, 0.547061, -2.919481, 1, 1, 1, 1, 1,
-0.8790907, -1.051714, -2.384842, 1, 1, 1, 1, 1,
-0.8686435, -0.01575735, -1.973956, 1, 1, 1, 1, 1,
-0.8653819, 2.397601, -0.0415094, 1, 1, 1, 1, 1,
-0.8564626, 0.9058136, -0.9395275, 0, 0, 1, 1, 1,
-0.8547294, 2.428019, 0.9764163, 1, 0, 0, 1, 1,
-0.8477737, -0.7743847, -2.046998, 1, 0, 0, 1, 1,
-0.8457043, 1.611159, -1.707412, 1, 0, 0, 1, 1,
-0.8435355, -0.5651962, -0.8237554, 1, 0, 0, 1, 1,
-0.8401628, -0.6999592, -2.98216, 1, 0, 0, 1, 1,
-0.8351458, -1.601144, -1.375936, 0, 0, 0, 1, 1,
-0.8310496, 1.759771, -0.5687218, 0, 0, 0, 1, 1,
-0.8305434, 0.6114623, -1.086278, 0, 0, 0, 1, 1,
-0.8272331, 1.26887, -0.7892329, 0, 0, 0, 1, 1,
-0.8267816, -1.322119, -3.731693, 0, 0, 0, 1, 1,
-0.8234659, 0.8210014, -1.846253, 0, 0, 0, 1, 1,
-0.8221058, -0.702592, -1.275593, 0, 0, 0, 1, 1,
-0.8164877, 0.4383959, 0.427933, 1, 1, 1, 1, 1,
-0.8161281, 1.218605, 0.2156027, 1, 1, 1, 1, 1,
-0.8137251, -0.9016298, -3.768651, 1, 1, 1, 1, 1,
-0.8128503, 0.4957751, -1.957526, 1, 1, 1, 1, 1,
-0.8015994, 0.1393758, -2.345473, 1, 1, 1, 1, 1,
-0.7876229, -0.9219677, -1.760424, 1, 1, 1, 1, 1,
-0.7839701, -1.194781, -2.810076, 1, 1, 1, 1, 1,
-0.7834247, 0.06042667, -1.946345, 1, 1, 1, 1, 1,
-0.780368, 0.05924948, -0.7037562, 1, 1, 1, 1, 1,
-0.7776941, 0.1809691, -0.9852185, 1, 1, 1, 1, 1,
-0.7773172, -1.014027, -2.757074, 1, 1, 1, 1, 1,
-0.77257, 1.539895, 1.288911, 1, 1, 1, 1, 1,
-0.7641231, -0.739159, -1.167325, 1, 1, 1, 1, 1,
-0.7558223, 0.234754, -2.219687, 1, 1, 1, 1, 1,
-0.7556913, 0.0454612, -1.837809, 1, 1, 1, 1, 1,
-0.7495879, -0.5083119, -3.562969, 0, 0, 1, 1, 1,
-0.748116, 0.6677542, -1.516779, 1, 0, 0, 1, 1,
-0.746212, 0.1064993, -2.711131, 1, 0, 0, 1, 1,
-0.7442861, -0.4044378, -1.921443, 1, 0, 0, 1, 1,
-0.7412838, 0.3458882, -1.588169, 1, 0, 0, 1, 1,
-0.7400575, -2.47914, -3.989662, 1, 0, 0, 1, 1,
-0.739148, -0.815226, -3.548224, 0, 0, 0, 1, 1,
-0.7374098, -0.5200734, -0.7211665, 0, 0, 0, 1, 1,
-0.7335468, 1.68458, -1.355911, 0, 0, 0, 1, 1,
-0.7333168, 0.8234797, -2.603178, 0, 0, 0, 1, 1,
-0.7297899, 0.6700836, -0.9891497, 0, 0, 0, 1, 1,
-0.7296737, 1.295241, -1.04005, 0, 0, 0, 1, 1,
-0.7294407, 0.1435005, -2.433623, 0, 0, 0, 1, 1,
-0.7264291, -0.4246863, -2.768465, 1, 1, 1, 1, 1,
-0.7146711, -2.089538, -2.440625, 1, 1, 1, 1, 1,
-0.7125484, -0.2735362, -0.9730117, 1, 1, 1, 1, 1,
-0.7100968, 0.3963977, -1.115407, 1, 1, 1, 1, 1,
-0.707424, 0.5693982, -1.619488, 1, 1, 1, 1, 1,
-0.6990449, 0.9925196, -0.7837681, 1, 1, 1, 1, 1,
-0.6982112, 0.01072889, -0.7012665, 1, 1, 1, 1, 1,
-0.6938425, 0.5336453, -1.247307, 1, 1, 1, 1, 1,
-0.6901341, 0.265168, -0.9023908, 1, 1, 1, 1, 1,
-0.6889363, 1.642277, -0.9713564, 1, 1, 1, 1, 1,
-0.6803074, 0.1994613, -2.230238, 1, 1, 1, 1, 1,
-0.6764953, -0.8194178, -2.49059, 1, 1, 1, 1, 1,
-0.6730279, 1.785987, -0.2519926, 1, 1, 1, 1, 1,
-0.6630105, 0.1363195, -2.561972, 1, 1, 1, 1, 1,
-0.6623675, -1.130753, -2.275848, 1, 1, 1, 1, 1,
-0.659733, -1.47789, -1.978388, 0, 0, 1, 1, 1,
-0.6576765, -0.9965167, -4.00398, 1, 0, 0, 1, 1,
-0.6554047, 2.493803, 0.3227082, 1, 0, 0, 1, 1,
-0.6554016, 0.04859116, -2.716136, 1, 0, 0, 1, 1,
-0.6542307, 0.07193454, -1.10917, 1, 0, 0, 1, 1,
-0.6492602, 0.1766347, -1.824984, 1, 0, 0, 1, 1,
-0.6487452, -0.6966966, -4.065101, 0, 0, 0, 1, 1,
-0.6470404, -0.9964204, -1.020813, 0, 0, 0, 1, 1,
-0.6456937, 1.383319, 0.988194, 0, 0, 0, 1, 1,
-0.643194, 0.1244129, -0.5515821, 0, 0, 0, 1, 1,
-0.6356606, 0.747024, -0.4571702, 0, 0, 0, 1, 1,
-0.63312, -0.006203046, -2.998962, 0, 0, 0, 1, 1,
-0.6279156, -0.528997, -3.332712, 0, 0, 0, 1, 1,
-0.624833, 0.9591117, -2.052583, 1, 1, 1, 1, 1,
-0.6186786, 1.298172, -0.7285519, 1, 1, 1, 1, 1,
-0.6119758, -0.4900632, -2.228036, 1, 1, 1, 1, 1,
-0.60992, 0.6352079, -1.669821, 1, 1, 1, 1, 1,
-0.6083144, -0.3895032, -2.251305, 1, 1, 1, 1, 1,
-0.607834, -0.2511167, -1.440531, 1, 1, 1, 1, 1,
-0.6015691, -0.1660088, -1.135582, 1, 1, 1, 1, 1,
-0.5984765, -1.762468, -2.399638, 1, 1, 1, 1, 1,
-0.5957937, -0.6897433, -2.930867, 1, 1, 1, 1, 1,
-0.5950443, 2.415302, -0.3717707, 1, 1, 1, 1, 1,
-0.5949818, -0.1360648, -0.4435477, 1, 1, 1, 1, 1,
-0.5916907, 0.7557742, -0.1925403, 1, 1, 1, 1, 1,
-0.5908312, 1.408911, 0.802371, 1, 1, 1, 1, 1,
-0.585007, 1.054065, -2.192179, 1, 1, 1, 1, 1,
-0.5845206, 2.026476, -1.238529, 1, 1, 1, 1, 1,
-0.5784122, 1.833107, 0.9477171, 0, 0, 1, 1, 1,
-0.5782859, 1.163675, -0.3539346, 1, 0, 0, 1, 1,
-0.568938, 0.04386863, -1.965098, 1, 0, 0, 1, 1,
-0.5678579, -0.8666484, -4.247786, 1, 0, 0, 1, 1,
-0.5660985, -1.417532, -3.375195, 1, 0, 0, 1, 1,
-0.5659728, -0.8694313, -2.199391, 1, 0, 0, 1, 1,
-0.5658483, -0.5760773, -1.65364, 0, 0, 0, 1, 1,
-0.5635342, -0.9760594, -5.008139, 0, 0, 0, 1, 1,
-0.557488, -0.3098228, -1.763823, 0, 0, 0, 1, 1,
-0.5565884, -0.443695, -5.303184, 0, 0, 0, 1, 1,
-0.5542596, 1.724909, 0.926384, 0, 0, 0, 1, 1,
-0.5475984, -0.01161661, -2.340773, 0, 0, 0, 1, 1,
-0.5367913, -0.3480096, -1.12928, 0, 0, 0, 1, 1,
-0.5329596, 1.677316, 1.960155, 1, 1, 1, 1, 1,
-0.5306142, 1.87245, -2.277892, 1, 1, 1, 1, 1,
-0.5292397, 1.51551, 0.4274658, 1, 1, 1, 1, 1,
-0.5285193, 1.159358, 0.2177941, 1, 1, 1, 1, 1,
-0.5282026, -1.402585, -3.027973, 1, 1, 1, 1, 1,
-0.5279203, 1.012097, -0.961372, 1, 1, 1, 1, 1,
-0.5276153, -1.338108, -4.323442, 1, 1, 1, 1, 1,
-0.5221758, -0.586109, -4.036621, 1, 1, 1, 1, 1,
-0.5198046, 2.351681, -0.01708709, 1, 1, 1, 1, 1,
-0.5196294, -0.6094835, -2.400697, 1, 1, 1, 1, 1,
-0.518145, -0.006537507, 0.2100196, 1, 1, 1, 1, 1,
-0.5173786, 0.4423726, -0.3163551, 1, 1, 1, 1, 1,
-0.5156394, 1.462467, 0.1327244, 1, 1, 1, 1, 1,
-0.5144751, -1.842215, -3.701803, 1, 1, 1, 1, 1,
-0.5129941, 0.2531135, -0.3622212, 1, 1, 1, 1, 1,
-0.5110447, 1.035651, 1.222098, 0, 0, 1, 1, 1,
-0.5096668, 1.043746, 0.08728883, 1, 0, 0, 1, 1,
-0.5081639, -1.510544, -3.525348, 1, 0, 0, 1, 1,
-0.5080603, -0.4093879, -2.948437, 1, 0, 0, 1, 1,
-0.4982098, -2.446652, -1.784167, 1, 0, 0, 1, 1,
-0.4980097, 1.25555, -1.141947, 1, 0, 0, 1, 1,
-0.4972826, 0.2299432, 0.2252997, 0, 0, 0, 1, 1,
-0.4939367, 0.104311, -0.770821, 0, 0, 0, 1, 1,
-0.4924738, -1.346517, -4.253025, 0, 0, 0, 1, 1,
-0.4908124, 0.8591666, 0.01162513, 0, 0, 0, 1, 1,
-0.4881248, 1.538053, -0.6274379, 0, 0, 0, 1, 1,
-0.4758842, 1.230877, -0.5573125, 0, 0, 0, 1, 1,
-0.4751858, 0.4279228, -3.104416, 0, 0, 0, 1, 1,
-0.4709424, -0.1234274, -1.935114, 1, 1, 1, 1, 1,
-0.4649283, 0.5563297, -2.055146, 1, 1, 1, 1, 1,
-0.4633154, -1.325213, -2.671252, 1, 1, 1, 1, 1,
-0.4607655, 1.939159, -0.5474178, 1, 1, 1, 1, 1,
-0.4605098, -0.6044744, -2.930171, 1, 1, 1, 1, 1,
-0.4475701, 0.4651407, -0.2841685, 1, 1, 1, 1, 1,
-0.4470696, 0.9624929, 0.07097434, 1, 1, 1, 1, 1,
-0.4435747, 1.09853, 0.1638076, 1, 1, 1, 1, 1,
-0.4435628, 0.9531236, 0.1510833, 1, 1, 1, 1, 1,
-0.4381972, 0.6441439, -1.752377, 1, 1, 1, 1, 1,
-0.4364107, -0.5133204, -1.0662, 1, 1, 1, 1, 1,
-0.4359633, -0.6925157, -2.947218, 1, 1, 1, 1, 1,
-0.4306962, 0.2906288, -0.001846282, 1, 1, 1, 1, 1,
-0.430258, -1.01596, -4.247474, 1, 1, 1, 1, 1,
-0.4271445, -1.329774, -4.692646, 1, 1, 1, 1, 1,
-0.4221622, -0.02443718, -1.855671, 0, 0, 1, 1, 1,
-0.4200782, -0.4370745, -0.4068842, 1, 0, 0, 1, 1,
-0.4147195, -1.506059, -2.61079, 1, 0, 0, 1, 1,
-0.4127564, 0.6394183, -0.2589791, 1, 0, 0, 1, 1,
-0.4120973, 0.4638436, -0.1403618, 1, 0, 0, 1, 1,
-0.4093851, 1.231355, -0.168989, 1, 0, 0, 1, 1,
-0.4084319, -1.453643, -4.414815, 0, 0, 0, 1, 1,
-0.405591, 0.1256881, -3.259079, 0, 0, 0, 1, 1,
-0.4046949, 0.01929439, -0.8620823, 0, 0, 0, 1, 1,
-0.4015455, 0.9927559, -1.126773, 0, 0, 0, 1, 1,
-0.3984328, -0.2523747, -1.857989, 0, 0, 0, 1, 1,
-0.3974418, 0.714022, -0.1929082, 0, 0, 0, 1, 1,
-0.3969825, -0.3686053, -1.849797, 0, 0, 0, 1, 1,
-0.3952331, -0.3987241, -2.042135, 1, 1, 1, 1, 1,
-0.3946573, 1.115392, -0.1474458, 1, 1, 1, 1, 1,
-0.3926102, 0.1878525, -0.004339417, 1, 1, 1, 1, 1,
-0.390103, 1.148527, -0.5629295, 1, 1, 1, 1, 1,
-0.3833265, 0.1919315, -2.699008, 1, 1, 1, 1, 1,
-0.3807949, -1.398928, -3.04981, 1, 1, 1, 1, 1,
-0.3799975, -0.04663237, -1.248217, 1, 1, 1, 1, 1,
-0.3794059, -0.5329177, -1.956643, 1, 1, 1, 1, 1,
-0.3770131, 0.6426068, -0.03944525, 1, 1, 1, 1, 1,
-0.3722684, 0.2607083, -1.784684, 1, 1, 1, 1, 1,
-0.3703436, -0.4191052, -0.5310825, 1, 1, 1, 1, 1,
-0.3687074, 1.153898, 0.7807856, 1, 1, 1, 1, 1,
-0.3667893, -0.02223949, 0.6722951, 1, 1, 1, 1, 1,
-0.3666655, 1.715777, -0.1623958, 1, 1, 1, 1, 1,
-0.3655382, 2.307556, -0.2793707, 1, 1, 1, 1, 1,
-0.3636189, 1.86576, -1.217409, 0, 0, 1, 1, 1,
-0.3609264, 0.1349798, 1.475417, 1, 0, 0, 1, 1,
-0.3593389, -0.05280196, -1.60863, 1, 0, 0, 1, 1,
-0.3527068, -0.0445627, -2.034261, 1, 0, 0, 1, 1,
-0.3524312, -0.9497797, -2.273003, 1, 0, 0, 1, 1,
-0.3521724, -1.158619, -4.352377, 1, 0, 0, 1, 1,
-0.3500025, -0.5362251, -2.585716, 0, 0, 0, 1, 1,
-0.3481129, -1.1154, -2.745451, 0, 0, 0, 1, 1,
-0.3480337, 0.5620984, 0.9621886, 0, 0, 0, 1, 1,
-0.3475561, 0.02809576, -0.7867059, 0, 0, 0, 1, 1,
-0.342043, 1.821408, 0.6397908, 0, 0, 0, 1, 1,
-0.3370738, 1.140832, 0.1607754, 0, 0, 0, 1, 1,
-0.3360752, 1.229411, 1.320146, 0, 0, 0, 1, 1,
-0.3345742, -0.5972319, -1.961782, 1, 1, 1, 1, 1,
-0.3303143, -1.114763, -4.252154, 1, 1, 1, 1, 1,
-0.3296194, -1.188282, -4.095715, 1, 1, 1, 1, 1,
-0.3281076, -0.728726, -0.3806647, 1, 1, 1, 1, 1,
-0.3254273, -1.131683, -2.28724, 1, 1, 1, 1, 1,
-0.3225164, -0.9863381, -2.169316, 1, 1, 1, 1, 1,
-0.3199185, -0.1067214, -2.641269, 1, 1, 1, 1, 1,
-0.3175007, -0.7104402, -2.860777, 1, 1, 1, 1, 1,
-0.3170501, -0.2410651, -2.535021, 1, 1, 1, 1, 1,
-0.3128467, 0.736645, 0.9156905, 1, 1, 1, 1, 1,
-0.3098607, -2.308026, -1.905233, 1, 1, 1, 1, 1,
-0.3096578, -0.9940684, -4.285344, 1, 1, 1, 1, 1,
-0.3085636, -0.520016, -1.906311, 1, 1, 1, 1, 1,
-0.3055284, -1.673133, -2.13652, 1, 1, 1, 1, 1,
-0.305133, 0.394991, -0.4688639, 1, 1, 1, 1, 1,
-0.3049056, -2.419912, -4.133869, 0, 0, 1, 1, 1,
-0.3036771, 0.003199308, -2.419778, 1, 0, 0, 1, 1,
-0.2990955, -0.4808299, -2.574964, 1, 0, 0, 1, 1,
-0.2988967, 0.2862124, -1.789574, 1, 0, 0, 1, 1,
-0.2965534, 0.5829808, -1.265381, 1, 0, 0, 1, 1,
-0.2959588, 0.3323749, -1.812449, 1, 0, 0, 1, 1,
-0.2930326, 1.154423, -0.3481244, 0, 0, 0, 1, 1,
-0.2910385, 0.2432675, 0.1768186, 0, 0, 0, 1, 1,
-0.2900639, -0.8090066, -0.5833674, 0, 0, 0, 1, 1,
-0.2866264, 1.735493, -0.3902068, 0, 0, 0, 1, 1,
-0.2844944, 1.867367, -1.336513, 0, 0, 0, 1, 1,
-0.2842789, 2.544009, -0.3320559, 0, 0, 0, 1, 1,
-0.2836926, 0.386952, -0.06082973, 0, 0, 0, 1, 1,
-0.2799407, 0.1264263, 0.1686376, 1, 1, 1, 1, 1,
-0.2775196, 0.5919982, -0.9873302, 1, 1, 1, 1, 1,
-0.2720031, 0.7122551, -0.6533892, 1, 1, 1, 1, 1,
-0.2704934, -1.622855, -3.271341, 1, 1, 1, 1, 1,
-0.2677646, 1.15402, 0.7663676, 1, 1, 1, 1, 1,
-0.2628229, -0.1217287, -1.920339, 1, 1, 1, 1, 1,
-0.2625169, 1.071012, 2.144852, 1, 1, 1, 1, 1,
-0.2601827, 1.136307, -0.5299491, 1, 1, 1, 1, 1,
-0.252875, 0.3066441, -0.3737939, 1, 1, 1, 1, 1,
-0.2518164, 1.284103, 0.02288652, 1, 1, 1, 1, 1,
-0.251325, -1.520328, -3.01443, 1, 1, 1, 1, 1,
-0.2505114, -0.7323514, -3.564676, 1, 1, 1, 1, 1,
-0.2450846, -0.06246509, -2.25739, 1, 1, 1, 1, 1,
-0.242011, 1.11915, 0.2926336, 1, 1, 1, 1, 1,
-0.2414433, -0.5256712, -3.261431, 1, 1, 1, 1, 1,
-0.2359459, -0.2325507, -1.723566, 0, 0, 1, 1, 1,
-0.2325637, -0.6064816, -1.836486, 1, 0, 0, 1, 1,
-0.2322903, -0.9333096, -3.153567, 1, 0, 0, 1, 1,
-0.2264759, -0.9707069, -1.920322, 1, 0, 0, 1, 1,
-0.2200574, 1.85388, 0.2696447, 1, 0, 0, 1, 1,
-0.2190948, -0.08292942, -2.012496, 1, 0, 0, 1, 1,
-0.2179597, -1.001671, -3.107717, 0, 0, 0, 1, 1,
-0.212955, -0.3738874, -3.871077, 0, 0, 0, 1, 1,
-0.2122026, 1.156138, 0.07825056, 0, 0, 0, 1, 1,
-0.2089483, 0.6378481, -0.2587611, 0, 0, 0, 1, 1,
-0.1950997, -1.58025, -3.479173, 0, 0, 0, 1, 1,
-0.1937847, -1.565201, -3.018621, 0, 0, 0, 1, 1,
-0.1924829, 1.48427, -2.050737, 0, 0, 0, 1, 1,
-0.1919, -0.1133602, -0.9112785, 1, 1, 1, 1, 1,
-0.1902792, -0.6407818, -1.745547, 1, 1, 1, 1, 1,
-0.1889089, -1.679956, -2.267578, 1, 1, 1, 1, 1,
-0.1868871, -0.02123084, 0.1370776, 1, 1, 1, 1, 1,
-0.178831, 1.088106, 0.5748035, 1, 1, 1, 1, 1,
-0.1778133, 2.854933, 0.5153419, 1, 1, 1, 1, 1,
-0.1773806, 0.08327276, -1.454655, 1, 1, 1, 1, 1,
-0.1710977, 0.9425578, -1.772516, 1, 1, 1, 1, 1,
-0.1658003, -0.2512702, -1.864648, 1, 1, 1, 1, 1,
-0.1644427, -0.2832868, -2.687863, 1, 1, 1, 1, 1,
-0.1638033, -0.8205994, -3.286075, 1, 1, 1, 1, 1,
-0.1632249, -0.1717679, -1.552602, 1, 1, 1, 1, 1,
-0.1619801, -1.457084, -2.802439, 1, 1, 1, 1, 1,
-0.1613016, 0.9845417, 1.870466, 1, 1, 1, 1, 1,
-0.160139, 0.9843518, -0.4698283, 1, 1, 1, 1, 1,
-0.1601307, 1.214087, 0.2154542, 0, 0, 1, 1, 1,
-0.1579647, -0.008383185, -0.5327848, 1, 0, 0, 1, 1,
-0.1546311, -1.754838, -3.016789, 1, 0, 0, 1, 1,
-0.1528291, 0.5189578, -2.52014, 1, 0, 0, 1, 1,
-0.1522968, 0.2321301, 0.01818129, 1, 0, 0, 1, 1,
-0.1492188, -1.324829, -3.912672, 1, 0, 0, 1, 1,
-0.1466754, -0.3648853, -3.140497, 0, 0, 0, 1, 1,
-0.1416702, -0.3090422, -2.962929, 0, 0, 0, 1, 1,
-0.1403103, -0.3897442, -3.113464, 0, 0, 0, 1, 1,
-0.1403035, -0.05419614, -1.202215, 0, 0, 0, 1, 1,
-0.1386578, -1.005012, -3.881961, 0, 0, 0, 1, 1,
-0.1368352, -0.1726013, -2.621713, 0, 0, 0, 1, 1,
-0.1259251, 0.009387381, -0.6823568, 0, 0, 0, 1, 1,
-0.1258339, -2.293898, -3.799182, 1, 1, 1, 1, 1,
-0.1248792, -0.6997569, -2.290682, 1, 1, 1, 1, 1,
-0.1247097, -1.171704, -1.559502, 1, 1, 1, 1, 1,
-0.1186564, 1.4001, -2.73249, 1, 1, 1, 1, 1,
-0.1134755, 0.3338956, -1.620245, 1, 1, 1, 1, 1,
-0.1088068, 0.5494035, -0.4522545, 1, 1, 1, 1, 1,
-0.1064167, 1.247063, -0.34263, 1, 1, 1, 1, 1,
-0.09573182, -0.4273012, -1.810517, 1, 1, 1, 1, 1,
-0.09247452, -0.9440321, -3.234565, 1, 1, 1, 1, 1,
-0.08673587, -0.7279938, -3.757508, 1, 1, 1, 1, 1,
-0.0860477, 0.6515724, 0.941052, 1, 1, 1, 1, 1,
-0.08501346, 1.170916, 0.2060442, 1, 1, 1, 1, 1,
-0.08371675, 1.043913, -0.4133276, 1, 1, 1, 1, 1,
-0.08144045, -1.618059, -3.225483, 1, 1, 1, 1, 1,
-0.08106234, -0.4497003, -2.602754, 1, 1, 1, 1, 1,
-0.08063378, -0.3442503, -3.86489, 0, 0, 1, 1, 1,
-0.08040679, -1.62232, -2.485538, 1, 0, 0, 1, 1,
-0.08003037, -0.1484233, -1.195391, 1, 0, 0, 1, 1,
-0.07752211, -0.07474884, -1.799405, 1, 0, 0, 1, 1,
-0.07229742, -0.8773521, -2.866591, 1, 0, 0, 1, 1,
-0.06887294, -0.6595699, -2.162244, 1, 0, 0, 1, 1,
-0.06723862, -0.2262946, -4.203899, 0, 0, 0, 1, 1,
-0.06714322, -1.031888, -3.522133, 0, 0, 0, 1, 1,
-0.06685358, 1.093202, -0.01087403, 0, 0, 0, 1, 1,
-0.06440189, 0.0436589, -0.5870503, 0, 0, 0, 1, 1,
-0.06438255, -2.150263, -3.574168, 0, 0, 0, 1, 1,
-0.06124316, -0.4824826, -1.252211, 0, 0, 0, 1, 1,
-0.05972494, -0.9773188, -2.843823, 0, 0, 0, 1, 1,
-0.0594694, 0.7553508, 0.8569662, 1, 1, 1, 1, 1,
-0.05793971, -1.096811, -3.340352, 1, 1, 1, 1, 1,
-0.05708319, 1.916992, -0.6530554, 1, 1, 1, 1, 1,
-0.0557488, 1.40619, 0.3447716, 1, 1, 1, 1, 1,
-0.0504452, 0.6153448, 0.9689313, 1, 1, 1, 1, 1,
-0.04895675, -1.286097, -4.627666, 1, 1, 1, 1, 1,
-0.04675537, -1.287224, -2.076987, 1, 1, 1, 1, 1,
-0.04248849, 1.137493, 0.2025633, 1, 1, 1, 1, 1,
-0.03898967, -1.191863, -2.885383, 1, 1, 1, 1, 1,
-0.03800969, -1.617569, -3.353784, 1, 1, 1, 1, 1,
-0.03592112, 1.066934, 0.07049432, 1, 1, 1, 1, 1,
-0.03396155, 1.455969, -0.3879781, 1, 1, 1, 1, 1,
-0.03338039, 1.079282, 0.3102304, 1, 1, 1, 1, 1,
-0.03286529, 0.9033703, -0.5110092, 1, 1, 1, 1, 1,
-0.02819752, 2.050273, -0.03227525, 1, 1, 1, 1, 1,
-0.02585062, -0.04881516, -3.097361, 0, 0, 1, 1, 1,
-0.02278287, 1.047467, 0.5823358, 1, 0, 0, 1, 1,
-0.02091749, 0.7151285, 1.411011, 1, 0, 0, 1, 1,
-0.02041304, 0.3724572, -1.923947, 1, 0, 0, 1, 1,
-0.01969956, 0.3406333, 1.840948, 1, 0, 0, 1, 1,
-0.01844219, -0.1190646, -3.074481, 1, 0, 0, 1, 1,
-0.01537766, -1.060249, -1.963333, 0, 0, 0, 1, 1,
-0.01243152, 1.02666, -1.009797, 0, 0, 0, 1, 1,
-0.00969824, 1.25533, -2.42111, 0, 0, 0, 1, 1,
-0.008997454, -0.2111481, -4.163929, 0, 0, 0, 1, 1,
-0.006217535, 2.027761, -0.285609, 0, 0, 0, 1, 1,
-0.004989689, 0.3890549, 0.00566178, 0, 0, 0, 1, 1,
0.00318008, 0.7800663, -0.9201172, 0, 0, 0, 1, 1,
0.01086718, -0.3951639, 2.671745, 1, 1, 1, 1, 1,
0.01393173, 0.2672113, -0.08944013, 1, 1, 1, 1, 1,
0.01499493, 0.3170734, 0.2676949, 1, 1, 1, 1, 1,
0.01702322, 0.6071181, -0.3969787, 1, 1, 1, 1, 1,
0.01785062, -1.676921, 3.453211, 1, 1, 1, 1, 1,
0.02031831, 0.4670483, 1.288093, 1, 1, 1, 1, 1,
0.02429869, -0.262657, 3.554765, 1, 1, 1, 1, 1,
0.02912324, 0.1523645, 0.1408844, 1, 1, 1, 1, 1,
0.03465769, -0.6203712, 2.617749, 1, 1, 1, 1, 1,
0.03580407, 0.02867542, 1.098069, 1, 1, 1, 1, 1,
0.0416395, 0.419245, -1.691487, 1, 1, 1, 1, 1,
0.04271432, 0.5009394, -0.1959972, 1, 1, 1, 1, 1,
0.04443407, -0.003691981, 1.462039, 1, 1, 1, 1, 1,
0.04482312, 1.599921, -1.268544, 1, 1, 1, 1, 1,
0.04885206, 0.2087118, 0.8973184, 1, 1, 1, 1, 1,
0.04915764, -0.4685371, 4.2008, 0, 0, 1, 1, 1,
0.05420217, 1.24368, -0.3107503, 1, 0, 0, 1, 1,
0.05792147, 0.05597613, 1.464831, 1, 0, 0, 1, 1,
0.05959647, -0.6217616, 1.653879, 1, 0, 0, 1, 1,
0.05968741, -0.2239402, 5.57703, 1, 0, 0, 1, 1,
0.06174926, -0.6816255, 2.444579, 1, 0, 0, 1, 1,
0.06218635, -0.5996934, 4.34544, 0, 0, 0, 1, 1,
0.06809631, -0.3039845, 2.445251, 0, 0, 0, 1, 1,
0.06936463, -0.09155256, 1.475073, 0, 0, 0, 1, 1,
0.07143065, -1.815599, 3.317271, 0, 0, 0, 1, 1,
0.08130752, 1.059703, 0.8189328, 0, 0, 0, 1, 1,
0.08267865, -1.052936, 4.478518, 0, 0, 0, 1, 1,
0.08276555, -0.9948192, 4.163566, 0, 0, 0, 1, 1,
0.08423387, 0.8141567, -0.289552, 1, 1, 1, 1, 1,
0.08455414, 1.710455, -0.452959, 1, 1, 1, 1, 1,
0.08598665, -0.6739043, 1.820435, 1, 1, 1, 1, 1,
0.08675313, -0.4136921, 1.855922, 1, 1, 1, 1, 1,
0.08675519, 0.1294618, 1.871162, 1, 1, 1, 1, 1,
0.09313364, 0.4951976, 0.1802495, 1, 1, 1, 1, 1,
0.09368186, -1.508054, 1.592359, 1, 1, 1, 1, 1,
0.09652212, 0.5378225, 0.31178, 1, 1, 1, 1, 1,
0.09691676, 0.6269166, 0.4511204, 1, 1, 1, 1, 1,
0.09782031, 1.962231, 0.1963373, 1, 1, 1, 1, 1,
0.1010224, -0.2813915, 4.431832, 1, 1, 1, 1, 1,
0.1027087, 0.9842038, 0.4057427, 1, 1, 1, 1, 1,
0.1031736, -1.733415, 3.157789, 1, 1, 1, 1, 1,
0.1040074, -0.1772986, 1.956487, 1, 1, 1, 1, 1,
0.1051726, 1.372894, 0.9104979, 1, 1, 1, 1, 1,
0.106488, -0.6827033, 2.871638, 0, 0, 1, 1, 1,
0.1065525, 0.7905713, -1.083672, 1, 0, 0, 1, 1,
0.1083175, 1.637989, 0.4392856, 1, 0, 0, 1, 1,
0.109278, 0.6104833, 0.5608829, 1, 0, 0, 1, 1,
0.1200679, -0.5770787, 2.745535, 1, 0, 0, 1, 1,
0.1202188, -0.2404994, 0.5124141, 1, 0, 0, 1, 1,
0.1231062, -1.080333, 2.239832, 0, 0, 0, 1, 1,
0.1285119, -0.5919842, 3.362399, 0, 0, 0, 1, 1,
0.1289218, 0.9140993, 1.764181, 0, 0, 0, 1, 1,
0.1293127, 0.1766039, 0.8106666, 0, 0, 0, 1, 1,
0.1329085, -2.121007, 3.580142, 0, 0, 0, 1, 1,
0.1355397, 2.612486, -1.205765, 0, 0, 0, 1, 1,
0.1365181, -2.534909, 2.947202, 0, 0, 0, 1, 1,
0.142979, -1.128354, 2.573471, 1, 1, 1, 1, 1,
0.1497352, -0.3236658, 2.653838, 1, 1, 1, 1, 1,
0.1547946, -0.01852663, 0.9154601, 1, 1, 1, 1, 1,
0.1649468, -1.324317, 3.845214, 1, 1, 1, 1, 1,
0.1673776, 0.1097174, -0.7597582, 1, 1, 1, 1, 1,
0.1689043, -0.129872, 2.328117, 1, 1, 1, 1, 1,
0.1704275, -1.345739, 1.590268, 1, 1, 1, 1, 1,
0.1710781, -1.276125, 3.423743, 1, 1, 1, 1, 1,
0.1779898, -0.1827156, 1.273454, 1, 1, 1, 1, 1,
0.1783485, 0.111464, 0.7185823, 1, 1, 1, 1, 1,
0.1796865, -0.05783926, 2.031707, 1, 1, 1, 1, 1,
0.1798302, 0.6906928, -1.054722, 1, 1, 1, 1, 1,
0.1838739, -0.806704, 2.379941, 1, 1, 1, 1, 1,
0.1892231, 0.5158135, 0.828737, 1, 1, 1, 1, 1,
0.1929623, 1.734238, 2.138258, 1, 1, 1, 1, 1,
0.1948142, -2.087235, 2.586796, 0, 0, 1, 1, 1,
0.2004736, -0.4089555, 0.2972763, 1, 0, 0, 1, 1,
0.2085917, -2.187818, 2.641724, 1, 0, 0, 1, 1,
0.211718, -0.01595422, 0.1240102, 1, 0, 0, 1, 1,
0.2148443, -1.850039, 2.028573, 1, 0, 0, 1, 1,
0.2227342, -1.367266, 2.907298, 1, 0, 0, 1, 1,
0.2284346, 0.2075601, 1.380823, 0, 0, 0, 1, 1,
0.2297287, -1.171465, 2.383563, 0, 0, 0, 1, 1,
0.2330678, -0.9179388, 1.9825, 0, 0, 0, 1, 1,
0.2376506, 0.3765915, -0.4154957, 0, 0, 0, 1, 1,
0.2410585, 0.6449752, 0.5983459, 0, 0, 0, 1, 1,
0.244299, 0.1755668, 0.9222341, 0, 0, 0, 1, 1,
0.244619, -0.33411, 3.554321, 0, 0, 0, 1, 1,
0.2464402, -0.2534491, 3.106406, 1, 1, 1, 1, 1,
0.2527188, 1.304525, 1.080499, 1, 1, 1, 1, 1,
0.2531168, -0.2094469, 2.901585, 1, 1, 1, 1, 1,
0.2539807, -0.02902919, 0.6838245, 1, 1, 1, 1, 1,
0.2546348, -0.8705601, 3.363328, 1, 1, 1, 1, 1,
0.2581563, 1.343431, 1.366534, 1, 1, 1, 1, 1,
0.260457, 0.1411995, 1.034988, 1, 1, 1, 1, 1,
0.2606828, 0.5426754, -0.03607627, 1, 1, 1, 1, 1,
0.2664753, 0.1297783, -0.1264208, 1, 1, 1, 1, 1,
0.2665764, 1.795573, -0.996301, 1, 1, 1, 1, 1,
0.2667171, 1.459154, -0.6145094, 1, 1, 1, 1, 1,
0.2716017, 0.02470552, 1.890687, 1, 1, 1, 1, 1,
0.2718747, 0.6833584, 0.07100442, 1, 1, 1, 1, 1,
0.2721018, 1.40528, 0.1865768, 1, 1, 1, 1, 1,
0.2784271, -0.8791979, 2.829978, 1, 1, 1, 1, 1,
0.2787311, -0.1463575, 1.734866, 0, 0, 1, 1, 1,
0.2845955, 1.280199, -1.743331, 1, 0, 0, 1, 1,
0.2853063, -0.859732, 3.312661, 1, 0, 0, 1, 1,
0.287953, -0.2612225, 0.2184284, 1, 0, 0, 1, 1,
0.2934761, 0.6595157, 3.333336, 1, 0, 0, 1, 1,
0.2969585, 1.574261, 1.704385, 1, 0, 0, 1, 1,
0.3015265, 2.713097, -0.4318779, 0, 0, 0, 1, 1,
0.3021341, -2.445439, 2.255315, 0, 0, 0, 1, 1,
0.3024555, -0.5355188, 1.479276, 0, 0, 0, 1, 1,
0.3071358, 0.06507163, 2.251662, 0, 0, 0, 1, 1,
0.3098213, 0.00461547, 1.369885, 0, 0, 0, 1, 1,
0.3119327, 0.307632, -1.058471, 0, 0, 0, 1, 1,
0.3121927, -0.5759263, 4.158721, 0, 0, 0, 1, 1,
0.313329, -0.695868, 2.344124, 1, 1, 1, 1, 1,
0.3154253, -0.9013796, 5.786909, 1, 1, 1, 1, 1,
0.3162074, -0.4457693, 1.711634, 1, 1, 1, 1, 1,
0.3172356, -0.05969285, 0.8789271, 1, 1, 1, 1, 1,
0.318929, -0.9440277, 1.838472, 1, 1, 1, 1, 1,
0.3193564, -0.2986276, 0.8517304, 1, 1, 1, 1, 1,
0.3196502, -0.1592645, 1.686412, 1, 1, 1, 1, 1,
0.3284275, 0.1178565, 3.151512, 1, 1, 1, 1, 1,
0.3294363, 0.1944026, 2.270273, 1, 1, 1, 1, 1,
0.330687, 0.9690948, 0.2458389, 1, 1, 1, 1, 1,
0.3332758, 1.001812, -0.3346195, 1, 1, 1, 1, 1,
0.3390379, -1.182144, 3.437137, 1, 1, 1, 1, 1,
0.3469991, 0.8647078, -0.8285348, 1, 1, 1, 1, 1,
0.3497238, -0.5035154, 1.328598, 1, 1, 1, 1, 1,
0.35002, 0.4446568, 1.502399, 1, 1, 1, 1, 1,
0.3507033, -0.1512793, 1.890944, 0, 0, 1, 1, 1,
0.3532987, 0.3919658, -2.02685, 1, 0, 0, 1, 1,
0.3550188, 1.285942, 0.4455351, 1, 0, 0, 1, 1,
0.3550926, -1.962235, 3.811081, 1, 0, 0, 1, 1,
0.3561581, -0.8434741, 3.700485, 1, 0, 0, 1, 1,
0.3571142, 0.6653451, -1.134118, 1, 0, 0, 1, 1,
0.357731, -0.8762963, 1.638783, 0, 0, 0, 1, 1,
0.3651097, -1.255674, 2.203074, 0, 0, 0, 1, 1,
0.3700872, -0.1980128, 1.176002, 0, 0, 0, 1, 1,
0.3702923, 1.393444, 0.674669, 0, 0, 0, 1, 1,
0.3746829, 1.68541, 1.277438, 0, 0, 0, 1, 1,
0.3749808, 0.0217238, 1.546949, 0, 0, 0, 1, 1,
0.3749921, -0.5650391, 3.214298, 0, 0, 0, 1, 1,
0.3777341, -0.2065988, 1.832459, 1, 1, 1, 1, 1,
0.383425, 1.549914, 1.888299, 1, 1, 1, 1, 1,
0.3844258, 1.385654, 1.814991, 1, 1, 1, 1, 1,
0.3920456, 0.5046949, 0.2109032, 1, 1, 1, 1, 1,
0.3931387, -0.2074817, 0.631782, 1, 1, 1, 1, 1,
0.3932979, -1.076394, 2.790336, 1, 1, 1, 1, 1,
0.3937606, -0.9078622, 3.1456, 1, 1, 1, 1, 1,
0.3951263, -0.8956257, 4.410849, 1, 1, 1, 1, 1,
0.3961836, -0.3232937, 1.883993, 1, 1, 1, 1, 1,
0.3985898, -1.241687, 3.364109, 1, 1, 1, 1, 1,
0.3993658, 1.711763, 1.283787, 1, 1, 1, 1, 1,
0.399859, -0.1668739, 2.139709, 1, 1, 1, 1, 1,
0.4019636, -0.700263, 1.792371, 1, 1, 1, 1, 1,
0.409106, -0.5928242, 2.895456, 1, 1, 1, 1, 1,
0.4099357, 0.1556898, 1.966975, 1, 1, 1, 1, 1,
0.4138857, -1.149481, 3.549448, 0, 0, 1, 1, 1,
0.4214646, -0.2156715, 1.216173, 1, 0, 0, 1, 1,
0.4236738, 1.763413, -0.5268177, 1, 0, 0, 1, 1,
0.426289, -0.4088137, 2.636479, 1, 0, 0, 1, 1,
0.4305808, -0.5994674, 3.475595, 1, 0, 0, 1, 1,
0.4331143, 1.150268, 0.3769403, 1, 0, 0, 1, 1,
0.4384587, -0.8866315, 2.377917, 0, 0, 0, 1, 1,
0.4407184, -0.8230658, 1.294722, 0, 0, 0, 1, 1,
0.4426838, -0.6877069, 2.374465, 0, 0, 0, 1, 1,
0.4480108, -0.4362573, 3.128577, 0, 0, 0, 1, 1,
0.4534438, 1.111271, -1.735486, 0, 0, 0, 1, 1,
0.4585253, -0.7738104, 2.351895, 0, 0, 0, 1, 1,
0.4592987, -0.04577093, 1.146074, 0, 0, 0, 1, 1,
0.4604051, -0.01755414, 1.275181, 1, 1, 1, 1, 1,
0.4628903, 0.08272535, 0.4539327, 1, 1, 1, 1, 1,
0.4648194, -2.558666, 0.766026, 1, 1, 1, 1, 1,
0.4699803, -1.254802, 3.521531, 1, 1, 1, 1, 1,
0.4708531, 0.2870739, 2.329675, 1, 1, 1, 1, 1,
0.4735989, 1.009441, 0.5560377, 1, 1, 1, 1, 1,
0.4737491, 0.01707052, 1.820593, 1, 1, 1, 1, 1,
0.4786691, -2.013421, 1.15558, 1, 1, 1, 1, 1,
0.484483, 2.692529, 2.609205, 1, 1, 1, 1, 1,
0.4881938, 1.209066, 1.369909, 1, 1, 1, 1, 1,
0.4930777, 0.2988999, 0.3313848, 1, 1, 1, 1, 1,
0.5012144, -0.5164523, 3.920931, 1, 1, 1, 1, 1,
0.5024959, -1.036813, 3.945336, 1, 1, 1, 1, 1,
0.5059457, -0.7277768, 3.336954, 1, 1, 1, 1, 1,
0.5113831, -1.111374, 1.084612, 1, 1, 1, 1, 1,
0.515977, 0.5236403, -0.2711266, 0, 0, 1, 1, 1,
0.523656, 1.72321, -0.6410128, 1, 0, 0, 1, 1,
0.5248269, -0.4690244, 2.637043, 1, 0, 0, 1, 1,
0.5256042, -0.3576128, 2.639472, 1, 0, 0, 1, 1,
0.526602, 0.664602, 0.5553092, 1, 0, 0, 1, 1,
0.5290011, -0.7839543, 1.993753, 1, 0, 0, 1, 1,
0.5291396, 0.3994097, 0.9784358, 0, 0, 0, 1, 1,
0.5297088, -0.3810137, 2.62078, 0, 0, 0, 1, 1,
0.5351256, -0.4336643, 1.688174, 0, 0, 0, 1, 1,
0.5351796, -0.8055846, 0.6432749, 0, 0, 0, 1, 1,
0.5353085, 0.378916, 0.8926916, 0, 0, 0, 1, 1,
0.5412973, 0.2069994, -0.1024749, 0, 0, 0, 1, 1,
0.5429913, 1.474928, 0.7495472, 0, 0, 0, 1, 1,
0.5499911, -0.1370439, 1.5301, 1, 1, 1, 1, 1,
0.5513195, -0.9191949, 1.150354, 1, 1, 1, 1, 1,
0.5536778, 0.2138329, 2.404457, 1, 1, 1, 1, 1,
0.5584993, -0.3161254, 2.069786, 1, 1, 1, 1, 1,
0.5611134, 1.253905, -0.641762, 1, 1, 1, 1, 1,
0.5614313, -0.9541669, 1.459833, 1, 1, 1, 1, 1,
0.5615575, 0.4214159, 0.221902, 1, 1, 1, 1, 1,
0.5651965, -2.119736, 4.413995, 1, 1, 1, 1, 1,
0.5707945, 1.600758, -0.166026, 1, 1, 1, 1, 1,
0.5728773, 0.2443444, -0.6648934, 1, 1, 1, 1, 1,
0.5768827, 0.5761865, 1.127507, 1, 1, 1, 1, 1,
0.580747, 2.332959, -2.119208, 1, 1, 1, 1, 1,
0.5827653, 0.2791112, 2.699112, 1, 1, 1, 1, 1,
0.5828139, 0.4284835, 1.635576, 1, 1, 1, 1, 1,
0.5862232, -1.072985, 1.913368, 1, 1, 1, 1, 1,
0.5900819, -0.7718394, 3.392391, 0, 0, 1, 1, 1,
0.5947017, -1.344282, 3.549325, 1, 0, 0, 1, 1,
0.5987929, -0.07926303, 1.565587, 1, 0, 0, 1, 1,
0.6038353, 0.3507435, 1.668365, 1, 0, 0, 1, 1,
0.6091903, 9.526157e-05, 2.918922, 1, 0, 0, 1, 1,
0.6099665, 0.3916755, -0.7651988, 1, 0, 0, 1, 1,
0.615653, -0.9583111, 3.086253, 0, 0, 0, 1, 1,
0.6209587, 0.08943301, -0.02776174, 0, 0, 0, 1, 1,
0.6214749, -0.4834757, 3.155135, 0, 0, 0, 1, 1,
0.6240616, -2.253458, 2.757234, 0, 0, 0, 1, 1,
0.6270193, 1.027701, 0.3807283, 0, 0, 0, 1, 1,
0.6298938, -1.057861, 3.740422, 0, 0, 0, 1, 1,
0.6340131, -2.372589, 3.743549, 0, 0, 0, 1, 1,
0.6348064, -0.9996179, 2.188782, 1, 1, 1, 1, 1,
0.635471, -0.3679177, 2.7419, 1, 1, 1, 1, 1,
0.6365048, 0.3994553, 0.2058996, 1, 1, 1, 1, 1,
0.6386793, 0.0913211, 1.171099, 1, 1, 1, 1, 1,
0.6440607, -0.8208616, 3.046535, 1, 1, 1, 1, 1,
0.6458601, -0.5993283, 2.944579, 1, 1, 1, 1, 1,
0.64882, -1.111743, 1.06674, 1, 1, 1, 1, 1,
0.6489825, 0.3812051, 0.7855847, 1, 1, 1, 1, 1,
0.6547615, -1.103405, 2.9993, 1, 1, 1, 1, 1,
0.6557913, 0.5857207, 1.084375, 1, 1, 1, 1, 1,
0.6605215, 0.4622998, 2.649975, 1, 1, 1, 1, 1,
0.6638546, 0.008834024, 2.275043, 1, 1, 1, 1, 1,
0.6648364, -0.9955711, 1.775611, 1, 1, 1, 1, 1,
0.6654447, -1.789779, 2.77542, 1, 1, 1, 1, 1,
0.6666917, -0.1753664, 1.558426, 1, 1, 1, 1, 1,
0.6762471, -0.2047137, 2.288787, 0, 0, 1, 1, 1,
0.6774356, 0.2891111, 2.430467, 1, 0, 0, 1, 1,
0.6838731, -1.535533, 3.283667, 1, 0, 0, 1, 1,
0.6880336, -1.161102, 3.403199, 1, 0, 0, 1, 1,
0.6884397, -0.3461672, 3.201182, 1, 0, 0, 1, 1,
0.6889399, 0.8294168, 1.649357, 1, 0, 0, 1, 1,
0.6917213, 0.2649918, 2.192228, 0, 0, 0, 1, 1,
0.6982151, -0.5555638, 3.006772, 0, 0, 0, 1, 1,
0.7045212, -0.1964094, -1.439633, 0, 0, 0, 1, 1,
0.7062049, 1.010439, -1.445511, 0, 0, 0, 1, 1,
0.7115096, -0.896856, 1.554208, 0, 0, 0, 1, 1,
0.7134017, 0.09792586, 1.564855, 0, 0, 0, 1, 1,
0.7159062, 0.8183331, 1.157701, 0, 0, 0, 1, 1,
0.7216533, 1.282786, -0.7525661, 1, 1, 1, 1, 1,
0.7243744, 0.05331944, 2.362755, 1, 1, 1, 1, 1,
0.7267678, -0.03282718, 1.957862, 1, 1, 1, 1, 1,
0.7295548, 1.521281, -0.7962583, 1, 1, 1, 1, 1,
0.7344866, 1.91567, 0.1790705, 1, 1, 1, 1, 1,
0.7355381, 0.543568, 0.5206499, 1, 1, 1, 1, 1,
0.7363529, -1.285871, 3.48616, 1, 1, 1, 1, 1,
0.7393838, -1.923937, 3.362359, 1, 1, 1, 1, 1,
0.7400966, -0.6399964, 2.507915, 1, 1, 1, 1, 1,
0.7440347, 1.879907, 1.498522, 1, 1, 1, 1, 1,
0.7443804, 1.031634, 1.736759, 1, 1, 1, 1, 1,
0.7443843, 0.5752641, 0.3811924, 1, 1, 1, 1, 1,
0.7571173, 1.654401, 0.1011641, 1, 1, 1, 1, 1,
0.7573223, 1.158688, -0.9314393, 1, 1, 1, 1, 1,
0.763077, 0.1760276, -0.3692431, 1, 1, 1, 1, 1,
0.7644879, 2.561448, 0.8034195, 0, 0, 1, 1, 1,
0.7660235, -0.2320641, 1.803324, 1, 0, 0, 1, 1,
0.7705562, -0.5944946, 2.814172, 1, 0, 0, 1, 1,
0.7763548, -0.3081421, 2.954853, 1, 0, 0, 1, 1,
0.7867345, -0.9774963, 3.749852, 1, 0, 0, 1, 1,
0.7904401, -0.004578161, 2.13512, 1, 0, 0, 1, 1,
0.7985761, -1.382748, 0.8783472, 0, 0, 0, 1, 1,
0.8004258, -0.02418838, 0.9348701, 0, 0, 0, 1, 1,
0.8070789, 0.5436011, 1.137531, 0, 0, 0, 1, 1,
0.8139308, -0.8145145, 0.9859651, 0, 0, 0, 1, 1,
0.8201591, -0.1715502, 1.057122, 0, 0, 0, 1, 1,
0.8278126, 0.01675907, 1.750533, 0, 0, 0, 1, 1,
0.8310821, -0.09889294, 2.539706, 0, 0, 0, 1, 1,
0.8369471, -1.715813, 2.543248, 1, 1, 1, 1, 1,
0.8412125, -1.93177, 3.44651, 1, 1, 1, 1, 1,
0.8482903, 1.99891, 0.3105288, 1, 1, 1, 1, 1,
0.8501898, 1.451617, -0.5199182, 1, 1, 1, 1, 1,
0.8506256, 0.3878992, 1.415272, 1, 1, 1, 1, 1,
0.8525256, -1.379628, 3.105857, 1, 1, 1, 1, 1,
0.8578617, -0.4103063, 1.205944, 1, 1, 1, 1, 1,
0.8584535, 0.5672901, -0.02909379, 1, 1, 1, 1, 1,
0.8620146, -1.584636, 1.570643, 1, 1, 1, 1, 1,
0.8654051, -2.048569, 3.541141, 1, 1, 1, 1, 1,
0.8668463, -0.730978, 1.505108, 1, 1, 1, 1, 1,
0.8758717, -0.8768392, 1.956035, 1, 1, 1, 1, 1,
0.882769, -0.5716564, 1.543441, 1, 1, 1, 1, 1,
0.8841906, -0.519021, 2.072714, 1, 1, 1, 1, 1,
0.8900288, 3.024955, 0.2165289, 1, 1, 1, 1, 1,
0.8939488, -1.238156, 1.777183, 0, 0, 1, 1, 1,
0.8964865, -0.0899008, 1.279403, 1, 0, 0, 1, 1,
0.8976265, -0.3708219, 0.6110061, 1, 0, 0, 1, 1,
0.8980756, 0.2783739, 0.3061321, 1, 0, 0, 1, 1,
0.9025862, 1.521718, 1.019365, 1, 0, 0, 1, 1,
0.9031155, -1.788947, 3.994312, 1, 0, 0, 1, 1,
0.9091429, -0.5301407, 4.075345, 0, 0, 0, 1, 1,
0.9112192, 0.3157589, 1.022523, 0, 0, 0, 1, 1,
0.9193739, -0.6255813, 1.718866, 0, 0, 0, 1, 1,
0.9194015, 1.99038, -0.2858373, 0, 0, 0, 1, 1,
0.9196358, 0.4827474, -0.1716149, 0, 0, 0, 1, 1,
0.9222857, 0.8357561, 0.1284713, 0, 0, 0, 1, 1,
0.9243697, -1.267638, 3.95668, 0, 0, 0, 1, 1,
0.9358634, -0.2573342, 2.391726, 1, 1, 1, 1, 1,
0.9397239, 0.1199037, -0.9729736, 1, 1, 1, 1, 1,
0.9472967, -0.9943545, 2.132867, 1, 1, 1, 1, 1,
0.9532825, 1.457259, 2.157346, 1, 1, 1, 1, 1,
0.9555834, -1.34993, 3.864881, 1, 1, 1, 1, 1,
0.9557105, 0.9182022, 0.6446579, 1, 1, 1, 1, 1,
0.959973, -1.518074, 3.84856, 1, 1, 1, 1, 1,
0.9625361, -0.8123295, 1.309138, 1, 1, 1, 1, 1,
0.9644146, 1.937236, 1.269072, 1, 1, 1, 1, 1,
0.9680455, -0.02419961, 1.922923, 1, 1, 1, 1, 1,
0.972138, -0.1983778, 1.349012, 1, 1, 1, 1, 1,
0.9751796, 0.5394427, 1.226458, 1, 1, 1, 1, 1,
0.9939191, 1.181872, -0.6973015, 1, 1, 1, 1, 1,
0.9950516, 0.2529663, 2.255429, 1, 1, 1, 1, 1,
1.001661, -1.58963, 1.282745, 1, 1, 1, 1, 1,
1.006907, -0.5600131, 3.457413, 0, 0, 1, 1, 1,
1.007204, -0.7447706, 3.615292, 1, 0, 0, 1, 1,
1.01306, -0.298679, 2.90958, 1, 0, 0, 1, 1,
1.018966, 0.3489064, -0.199019, 1, 0, 0, 1, 1,
1.020554, 1.081251, 1.652817, 1, 0, 0, 1, 1,
1.025957, 0.9452554, -0.6287047, 1, 0, 0, 1, 1,
1.030697, 1.508185, -0.8461764, 0, 0, 0, 1, 1,
1.031605, -2.337724, 1.310449, 0, 0, 0, 1, 1,
1.031893, -0.3748776, 3.803637, 0, 0, 0, 1, 1,
1.040852, 0.2353158, 2.145924, 0, 0, 0, 1, 1,
1.044544, -0.7253462, 4.642926, 0, 0, 0, 1, 1,
1.048495, -0.5330019, 2.799165, 0, 0, 0, 1, 1,
1.048915, 0.6604492, 1.793646, 0, 0, 0, 1, 1,
1.051888, -0.1506371, 1.4149, 1, 1, 1, 1, 1,
1.052897, 0.6441078, 2.721373, 1, 1, 1, 1, 1,
1.056653, -0.3319276, 1.0935, 1, 1, 1, 1, 1,
1.059168, 0.01320258, -0.2575108, 1, 1, 1, 1, 1,
1.06186, -0.4233035, 0.8757882, 1, 1, 1, 1, 1,
1.062884, 0.06408737, 1.79804, 1, 1, 1, 1, 1,
1.070785, -1.354053, 2.948997, 1, 1, 1, 1, 1,
1.071306, -0.5531545, 2.705615, 1, 1, 1, 1, 1,
1.075956, 0.109731, 3.221061, 1, 1, 1, 1, 1,
1.078316, 0.1287093, 3.184119, 1, 1, 1, 1, 1,
1.08225, -0.09627609, 2.230883, 1, 1, 1, 1, 1,
1.089542, 1.667982, 0.4236782, 1, 1, 1, 1, 1,
1.092888, 0.6012437, 0.432327, 1, 1, 1, 1, 1,
1.100175, 0.41201, 2.437935, 1, 1, 1, 1, 1,
1.110513, -1.237617, 2.799531, 1, 1, 1, 1, 1,
1.110545, -0.848835, 1.472587, 0, 0, 1, 1, 1,
1.110631, 0.6496711, 0.02107243, 1, 0, 0, 1, 1,
1.111874, -0.3397264, 2.066924, 1, 0, 0, 1, 1,
1.114961, -1.597128, 2.649562, 1, 0, 0, 1, 1,
1.119462, -0.7954019, 2.489745, 1, 0, 0, 1, 1,
1.123046, 0.2107507, 2.592089, 1, 0, 0, 1, 1,
1.127924, -0.286458, 2.538171, 0, 0, 0, 1, 1,
1.143173, 0.3900286, 0.9494367, 0, 0, 0, 1, 1,
1.157555, 1.344038, -0.1410818, 0, 0, 0, 1, 1,
1.162276, -0.5796103, 2.650602, 0, 0, 0, 1, 1,
1.168863, 1.316616, 0.1882347, 0, 0, 0, 1, 1,
1.169829, -0.7785115, 2.229521, 0, 0, 0, 1, 1,
1.177641, -1.436512, 0.4536087, 0, 0, 0, 1, 1,
1.180542, 2.115973, 0.2387105, 1, 1, 1, 1, 1,
1.186335, 0.2468766, 0.06741616, 1, 1, 1, 1, 1,
1.189583, -0.1367813, 2.519539, 1, 1, 1, 1, 1,
1.189953, 1.511036, 1.068671, 1, 1, 1, 1, 1,
1.196121, -2.088323, 1.01203, 1, 1, 1, 1, 1,
1.198586, 1.768109, 1.997448, 1, 1, 1, 1, 1,
1.201459, -1.131243, -1.186657, 1, 1, 1, 1, 1,
1.202975, 0.3277405, 0.4601575, 1, 1, 1, 1, 1,
1.20464, -0.2100879, 2.155728, 1, 1, 1, 1, 1,
1.206174, -0.6663297, 3.210182, 1, 1, 1, 1, 1,
1.209914, -0.4096663, 1.902497, 1, 1, 1, 1, 1,
1.21018, 0.1279573, 3.661784, 1, 1, 1, 1, 1,
1.219707, 0.6980966, 1.46627, 1, 1, 1, 1, 1,
1.226177, -0.05401664, -0.3490086, 1, 1, 1, 1, 1,
1.230417, -0.053544, 2.327335, 1, 1, 1, 1, 1,
1.234925, -0.4072292, 2.240439, 0, 0, 1, 1, 1,
1.246265, 0.1579266, -0.5463241, 1, 0, 0, 1, 1,
1.248075, 1.853991, 1.063596, 1, 0, 0, 1, 1,
1.248588, 0.5439368, 0.03899695, 1, 0, 0, 1, 1,
1.251055, -1.823388, 2.941293, 1, 0, 0, 1, 1,
1.252105, 0.5977608, 1.076992, 1, 0, 0, 1, 1,
1.253462, 0.5512807, 2.429929, 0, 0, 0, 1, 1,
1.266304, 1.336424, 2.147352, 0, 0, 0, 1, 1,
1.266439, -0.4401803, 1.977167, 0, 0, 0, 1, 1,
1.275064, 1.64339, -0.7774448, 0, 0, 0, 1, 1,
1.278116, -1.364611, -0.08447062, 0, 0, 0, 1, 1,
1.278988, -0.1364596, 2.536588, 0, 0, 0, 1, 1,
1.28368, 0.25937, 0.6943837, 0, 0, 0, 1, 1,
1.28441, 0.6013162, 2.053164, 1, 1, 1, 1, 1,
1.292432, -1.760009, 1.937468, 1, 1, 1, 1, 1,
1.300832, 2.074854, 1.889256, 1, 1, 1, 1, 1,
1.314603, 0.8384603, -0.1130364, 1, 1, 1, 1, 1,
1.318139, -1.066751, 2.040443, 1, 1, 1, 1, 1,
1.332683, -1.101324, 3.507653, 1, 1, 1, 1, 1,
1.343804, 0.7640259, 1.478997, 1, 1, 1, 1, 1,
1.353213, -0.08671422, -0.132967, 1, 1, 1, 1, 1,
1.383685, -0.1337321, 1.425379, 1, 1, 1, 1, 1,
1.387212, 0.9128922, 0.2000567, 1, 1, 1, 1, 1,
1.399489, -1.819922, 2.995291, 1, 1, 1, 1, 1,
1.400122, -0.01231522, 2.388666, 1, 1, 1, 1, 1,
1.407938, -0.3087298, 1.272687, 1, 1, 1, 1, 1,
1.413209, -0.161338, 0.2562236, 1, 1, 1, 1, 1,
1.419173, 1.154055, 0.3928295, 1, 1, 1, 1, 1,
1.444064, -1.080155, 2.875744, 0, 0, 1, 1, 1,
1.445169, 1.597401, 1.069861, 1, 0, 0, 1, 1,
1.464025, 1.329031, -1.090208, 1, 0, 0, 1, 1,
1.464749, 1.034866, -0.2014344, 1, 0, 0, 1, 1,
1.466214, -0.7922281, 1.884091, 1, 0, 0, 1, 1,
1.472265, -0.972149, 2.189352, 1, 0, 0, 1, 1,
1.477409, -0.2324541, 1.777873, 0, 0, 0, 1, 1,
1.485393, 1.51705, -1.170574, 0, 0, 0, 1, 1,
1.502622, 1.061584, 0.8357305, 0, 0, 0, 1, 1,
1.513384, -0.2118493, 1.8905, 0, 0, 0, 1, 1,
1.532566, -1.236944, 2.492825, 0, 0, 0, 1, 1,
1.552194, 1.265626, 1.157307, 0, 0, 0, 1, 1,
1.556832, -2.189309, 2.625683, 0, 0, 0, 1, 1,
1.564454, 1.735806, 2.396942, 1, 1, 1, 1, 1,
1.572154, -1.544724, 2.434048, 1, 1, 1, 1, 1,
1.573684, 1.821565, 0.8565918, 1, 1, 1, 1, 1,
1.586308, 1.42389, 2.577055, 1, 1, 1, 1, 1,
1.611729, -0.6277007, 2.777278, 1, 1, 1, 1, 1,
1.617244, -0.4186273, 0.3820378, 1, 1, 1, 1, 1,
1.627608, 1.184508, 0.04487557, 1, 1, 1, 1, 1,
1.638488, -0.6913481, 1.553338, 1, 1, 1, 1, 1,
1.639231, -0.4730853, 4.095674, 1, 1, 1, 1, 1,
1.641346, -0.6461104, 3.123982, 1, 1, 1, 1, 1,
1.669788, -0.5917747, -0.09589254, 1, 1, 1, 1, 1,
1.67479, 1.553235, 2.022744, 1, 1, 1, 1, 1,
1.676158, 2.46978, 1.262625, 1, 1, 1, 1, 1,
1.685277, -0.4954367, 2.333999, 1, 1, 1, 1, 1,
1.710339, -0.6979966, 1.114287, 1, 1, 1, 1, 1,
1.711857, -0.1877808, 2.794616, 0, 0, 1, 1, 1,
1.716799, -0.1492239, 0.5886658, 1, 0, 0, 1, 1,
1.727733, -0.5362589, 1.032308, 1, 0, 0, 1, 1,
1.737797, -0.6025653, 1.581072, 1, 0, 0, 1, 1,
1.745876, 0.9148886, 1.007122, 1, 0, 0, 1, 1,
1.759145, -1.834385, 2.541593, 1, 0, 0, 1, 1,
1.784348, 0.3663969, 1.439069, 0, 0, 0, 1, 1,
1.81624, -1.460335, 1.675991, 0, 0, 0, 1, 1,
1.835302, -2.043105, 3.289444, 0, 0, 0, 1, 1,
1.849665, 2.054896, -0.5300358, 0, 0, 0, 1, 1,
1.867201, 1.854455, 1.406979, 0, 0, 0, 1, 1,
1.88196, -0.7409746, 1.611385, 0, 0, 0, 1, 1,
1.888914, -1.043143, 0.5255503, 0, 0, 0, 1, 1,
1.894849, 0.1558483, 0.2946641, 1, 1, 1, 1, 1,
1.943819, -1.74565, 2.166303, 1, 1, 1, 1, 1,
1.946503, 1.107591, 0.1053876, 1, 1, 1, 1, 1,
1.949668, 2.054561, -0.8057328, 1, 1, 1, 1, 1,
1.973284, -0.2272419, 2.31219, 1, 1, 1, 1, 1,
1.97672, 1.722233, 1.677663, 1, 1, 1, 1, 1,
1.987536, -0.08298613, 2.213368, 1, 1, 1, 1, 1,
1.996847, -1.271864, 2.290694, 1, 1, 1, 1, 1,
2.015679, -1.101339, 1.403057, 1, 1, 1, 1, 1,
2.064342, -0.4564635, 3.470855, 1, 1, 1, 1, 1,
2.081268, 0.3922529, 1.537596, 1, 1, 1, 1, 1,
2.113641, -0.8495343, 2.772452, 1, 1, 1, 1, 1,
2.141883, 0.364635, 3.387631, 1, 1, 1, 1, 1,
2.193752, -1.010933, 3.15231, 1, 1, 1, 1, 1,
2.201245, -0.9585639, 1.343539, 1, 1, 1, 1, 1,
2.20406, -0.7441502, 2.491339, 0, 0, 1, 1, 1,
2.20983, 1.101915, 1.384818, 1, 0, 0, 1, 1,
2.21972, -0.6113783, 2.576652, 1, 0, 0, 1, 1,
2.229739, 0.4403576, 2.164291, 1, 0, 0, 1, 1,
2.255383, 0.8054286, 1.968144, 1, 0, 0, 1, 1,
2.255633, 1.098134, 2.569659, 1, 0, 0, 1, 1,
2.260633, -0.0854804, 2.265904, 0, 0, 0, 1, 1,
2.30183, 0.1565612, 0.5246725, 0, 0, 0, 1, 1,
2.316775, -1.021248, 2.658617, 0, 0, 0, 1, 1,
2.322923, 0.5430014, 0.5980911, 0, 0, 0, 1, 1,
2.33813, 0.939635, 1.205141, 0, 0, 0, 1, 1,
2.377531, -1.821579, 1.685749, 0, 0, 0, 1, 1,
2.390435, 0.3899076, 2.689598, 0, 0, 0, 1, 1,
2.418472, 0.632008, 1.797266, 1, 1, 1, 1, 1,
2.422272, -1.62681, 2.181589, 1, 1, 1, 1, 1,
2.453249, -0.7317548, 1.642103, 1, 1, 1, 1, 1,
2.525911, 1.515686, 0.5744381, 1, 1, 1, 1, 1,
2.533991, -0.2073285, 3.527045, 1, 1, 1, 1, 1,
2.672731, -0.6327175, 1.577483, 1, 1, 1, 1, 1,
3.297806, -0.5518148, 3.08552, 1, 1, 1, 1, 1
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
var radius = 9.646032;
var distance = 33.88128;
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
mvMatrix.translate( -0.2134795, -0.02495217, -0.2418628 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.88128);
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
