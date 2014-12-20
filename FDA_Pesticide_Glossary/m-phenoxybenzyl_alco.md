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
-2.967325, 1.508677, -0.1039534, 1, 0, 0, 1,
-2.862627, 0.04811222, -1.349763, 1, 0.007843138, 0, 1,
-2.834601, 1.081996, -0.9430661, 1, 0.01176471, 0, 1,
-2.603034, -1.372958, -0.9741776, 1, 0.01960784, 0, 1,
-2.495158, -0.02458045, -0.1137863, 1, 0.02352941, 0, 1,
-2.448625, -0.643468, -1.846373, 1, 0.03137255, 0, 1,
-2.360514, -1.087832, -1.791203, 1, 0.03529412, 0, 1,
-2.345806, -0.2036139, -2.050536, 1, 0.04313726, 0, 1,
-2.335468, -1.007521, -3.369589, 1, 0.04705882, 0, 1,
-2.313016, 0.5357665, -2.193151, 1, 0.05490196, 0, 1,
-2.31197, -1.203452, -1.58353, 1, 0.05882353, 0, 1,
-2.165506, 0.6205941, -2.196176, 1, 0.06666667, 0, 1,
-2.143029, 0.1500478, -0.6065215, 1, 0.07058824, 0, 1,
-2.142586, 0.6442835, -0.9393629, 1, 0.07843138, 0, 1,
-2.13267, 0.2523061, -0.8753932, 1, 0.08235294, 0, 1,
-2.130547, 0.9938222, -0.9912667, 1, 0.09019608, 0, 1,
-2.104193, 0.7691905, -0.7698731, 1, 0.09411765, 0, 1,
-2.095851, -0.4173667, -3.001604, 1, 0.1019608, 0, 1,
-2.095371, -1.034982, -2.418334, 1, 0.1098039, 0, 1,
-2.08951, 1.709233, -1.665803, 1, 0.1137255, 0, 1,
-2.088837, 0.04145374, -1.28852, 1, 0.1215686, 0, 1,
-2.088753, 0.1558802, -0.4276601, 1, 0.1254902, 0, 1,
-2.080755, 1.532759, -0.5154222, 1, 0.1333333, 0, 1,
-2.06838, -0.2504557, -1.752772, 1, 0.1372549, 0, 1,
-2.039834, -1.569321, -2.085168, 1, 0.145098, 0, 1,
-2.021202, 0.09236456, -1.060775, 1, 0.1490196, 0, 1,
-2.021009, -0.1876812, -1.2499, 1, 0.1568628, 0, 1,
-2.013867, -0.6036937, -2.490707, 1, 0.1607843, 0, 1,
-2.009893, -0.5765062, -2.444816, 1, 0.1686275, 0, 1,
-1.972781, -0.7009284, -1.937989, 1, 0.172549, 0, 1,
-1.966019, 0.6955873, -1.87491, 1, 0.1803922, 0, 1,
-1.940583, -0.5199572, -1.048463, 1, 0.1843137, 0, 1,
-1.917317, -0.5653163, -2.154552, 1, 0.1921569, 0, 1,
-1.916678, 1.139488, 0.7468129, 1, 0.1960784, 0, 1,
-1.88989, 0.3035133, -0.8247809, 1, 0.2039216, 0, 1,
-1.880504, 1.496747, -0.4154242, 1, 0.2117647, 0, 1,
-1.861155, -0.3361984, -1.680439, 1, 0.2156863, 0, 1,
-1.823982, -0.1425582, -2.038963, 1, 0.2235294, 0, 1,
-1.8108, -0.1187368, -1.204363, 1, 0.227451, 0, 1,
-1.802256, 0.2693413, -1.507554, 1, 0.2352941, 0, 1,
-1.788168, -1.496171, -2.291947, 1, 0.2392157, 0, 1,
-1.774397, 0.5768311, -2.667429, 1, 0.2470588, 0, 1,
-1.774329, -0.3012678, -0.7504041, 1, 0.2509804, 0, 1,
-1.769737, -0.5993044, -0.7374597, 1, 0.2588235, 0, 1,
-1.761503, -0.05771998, -0.9342591, 1, 0.2627451, 0, 1,
-1.754483, 1.374766, -2.152807, 1, 0.2705882, 0, 1,
-1.747517, 0.2984023, -1.661911, 1, 0.2745098, 0, 1,
-1.738096, -0.467546, -2.932909, 1, 0.282353, 0, 1,
-1.728016, 0.7364575, -0.8923851, 1, 0.2862745, 0, 1,
-1.709159, 0.7597508, -1.885626, 1, 0.2941177, 0, 1,
-1.700165, 1.476077, -0.5848929, 1, 0.3019608, 0, 1,
-1.670731, -0.7409123, -1.637263, 1, 0.3058824, 0, 1,
-1.670072, 0.3681999, -1.872535, 1, 0.3137255, 0, 1,
-1.664074, -0.8664641, -0.4197088, 1, 0.3176471, 0, 1,
-1.658045, 1.241781, 0.4449512, 1, 0.3254902, 0, 1,
-1.65627, -1.665302, -0.7424974, 1, 0.3294118, 0, 1,
-1.634872, 0.8720976, -2.406543, 1, 0.3372549, 0, 1,
-1.625419, -0.02983526, -3.560857, 1, 0.3411765, 0, 1,
-1.625015, -0.9030126, -1.792627, 1, 0.3490196, 0, 1,
-1.615414, -1.712275, -2.843174, 1, 0.3529412, 0, 1,
-1.614182, 1.116692, -1.269525, 1, 0.3607843, 0, 1,
-1.59999, -1.257298, -2.033152, 1, 0.3647059, 0, 1,
-1.591132, 0.6879439, -1.26319, 1, 0.372549, 0, 1,
-1.585584, 0.9766592, -2.677313, 1, 0.3764706, 0, 1,
-1.582414, 1.653637, -1.889936, 1, 0.3843137, 0, 1,
-1.577876, -0.6881709, -1.62693, 1, 0.3882353, 0, 1,
-1.567844, -1.559592, -1.306983, 1, 0.3960784, 0, 1,
-1.563326, 0.8828038, 1.101657, 1, 0.4039216, 0, 1,
-1.560583, 1.603927, -1.129589, 1, 0.4078431, 0, 1,
-1.557663, -0.835772, -2.09494, 1, 0.4156863, 0, 1,
-1.556889, -0.8622053, -1.928679, 1, 0.4196078, 0, 1,
-1.534816, 0.515444, -2.232445, 1, 0.427451, 0, 1,
-1.528768, -0.8606254, -1.310318, 1, 0.4313726, 0, 1,
-1.525496, 0.8080214, 0.6058852, 1, 0.4392157, 0, 1,
-1.512187, -0.8179212, -2.280073, 1, 0.4431373, 0, 1,
-1.509176, 1.40886, -0.618062, 1, 0.4509804, 0, 1,
-1.501004, 0.182239, -1.367376, 1, 0.454902, 0, 1,
-1.488438, -0.4898417, -2.337966, 1, 0.4627451, 0, 1,
-1.486609, 0.5817174, 0.0435268, 1, 0.4666667, 0, 1,
-1.461382, -0.6902457, -1.685749, 1, 0.4745098, 0, 1,
-1.455982, -0.2933342, -2.408996, 1, 0.4784314, 0, 1,
-1.44794, -0.3700183, -1.504587, 1, 0.4862745, 0, 1,
-1.440618, -1.010438, -3.205668, 1, 0.4901961, 0, 1,
-1.43451, -1.371309, -2.40671, 1, 0.4980392, 0, 1,
-1.424636, 0.1965633, -1.330596, 1, 0.5058824, 0, 1,
-1.424248, -1.217432, -3.175979, 1, 0.509804, 0, 1,
-1.423954, -0.9444408, -2.985021, 1, 0.5176471, 0, 1,
-1.391966, -1.253453, -0.9515324, 1, 0.5215687, 0, 1,
-1.389345, 0.1998735, -2.803667, 1, 0.5294118, 0, 1,
-1.387851, -1.358035, -2.601459, 1, 0.5333334, 0, 1,
-1.386924, -0.1158604, -2.610892, 1, 0.5411765, 0, 1,
-1.383785, 0.5767982, -1.601573, 1, 0.5450981, 0, 1,
-1.382919, -1.343771, -1.518034, 1, 0.5529412, 0, 1,
-1.36025, -0.06978621, -0.2987594, 1, 0.5568628, 0, 1,
-1.35507, -0.1638728, -1.120153, 1, 0.5647059, 0, 1,
-1.349696, 0.4770462, -2.541236, 1, 0.5686275, 0, 1,
-1.348705, 2.165245, 0.1630412, 1, 0.5764706, 0, 1,
-1.339586, 1.242529, -0.2963913, 1, 0.5803922, 0, 1,
-1.327217, 1.86898, -0.04646164, 1, 0.5882353, 0, 1,
-1.3176, -1.008887, -1.423405, 1, 0.5921569, 0, 1,
-1.31701, 0.02851709, -0.5233397, 1, 0.6, 0, 1,
-1.312252, -0.3751542, -0.3761491, 1, 0.6078432, 0, 1,
-1.306712, -1.161745, -2.940716, 1, 0.6117647, 0, 1,
-1.306084, 1.490533, -0.01080974, 1, 0.6196079, 0, 1,
-1.301931, 0.01958988, -0.6654994, 1, 0.6235294, 0, 1,
-1.300889, -0.5287703, -1.370604, 1, 0.6313726, 0, 1,
-1.281864, 1.101369, -1.208827, 1, 0.6352941, 0, 1,
-1.267357, -1.156475, -0.6179683, 1, 0.6431373, 0, 1,
-1.257961, -1.976484, -2.918468, 1, 0.6470588, 0, 1,
-1.249368, -0.2709104, -1.344936, 1, 0.654902, 0, 1,
-1.232423, -0.2238019, -1.111451, 1, 0.6588235, 0, 1,
-1.231921, 0.09312377, -0.05722972, 1, 0.6666667, 0, 1,
-1.226507, 0.9219513, -2.308793, 1, 0.6705883, 0, 1,
-1.208899, 0.5567535, -0.05104273, 1, 0.6784314, 0, 1,
-1.208539, 0.002139155, -1.257514, 1, 0.682353, 0, 1,
-1.204863, 0.7047246, -0.5159247, 1, 0.6901961, 0, 1,
-1.196131, -0.8419658, -2.964794, 1, 0.6941177, 0, 1,
-1.182361, -0.5797717, -1.991338, 1, 0.7019608, 0, 1,
-1.18045, -1.639727, -2.831157, 1, 0.7098039, 0, 1,
-1.177717, 1.343796, 0.1105324, 1, 0.7137255, 0, 1,
-1.177261, 0.03523476, -1.817784, 1, 0.7215686, 0, 1,
-1.17621, -0.1025721, -2.231457, 1, 0.7254902, 0, 1,
-1.167248, 0.8378398, -0.8261639, 1, 0.7333333, 0, 1,
-1.165872, -2.010442, -3.374632, 1, 0.7372549, 0, 1,
-1.163441, 1.843888, -0.4005364, 1, 0.7450981, 0, 1,
-1.160841, -0.136463, -2.450483, 1, 0.7490196, 0, 1,
-1.159604, -0.9524996, -2.838106, 1, 0.7568628, 0, 1,
-1.150949, -0.7752082, -1.171208, 1, 0.7607843, 0, 1,
-1.143502, -0.756989, -2.67521, 1, 0.7686275, 0, 1,
-1.13943, -0.8032368, -2.516357, 1, 0.772549, 0, 1,
-1.13935, 0.7728863, -1.711108, 1, 0.7803922, 0, 1,
-1.139127, 0.04559759, -1.706921, 1, 0.7843137, 0, 1,
-1.138834, 0.4826397, -3.328368, 1, 0.7921569, 0, 1,
-1.137751, -0.3487624, -2.07631, 1, 0.7960784, 0, 1,
-1.137481, 1.915449, 1.386751, 1, 0.8039216, 0, 1,
-1.126693, -0.2818617, -1.963946, 1, 0.8117647, 0, 1,
-1.123899, -0.1315609, -1.30516, 1, 0.8156863, 0, 1,
-1.122532, 0.6106498, -0.5866213, 1, 0.8235294, 0, 1,
-1.121269, 1.285258, -0.1640978, 1, 0.827451, 0, 1,
-1.121245, -1.155084, -4.328609, 1, 0.8352941, 0, 1,
-1.118181, 0.8411517, -0.9845804, 1, 0.8392157, 0, 1,
-1.114357, -0.4120856, -1.433759, 1, 0.8470588, 0, 1,
-1.113533, -0.6616638, -3.625732, 1, 0.8509804, 0, 1,
-1.108996, -1.085154, -4.078214, 1, 0.8588235, 0, 1,
-1.105369, 0.1504412, -2.870436, 1, 0.8627451, 0, 1,
-1.095316, 0.53395, -2.159635, 1, 0.8705882, 0, 1,
-1.093335, -0.009748874, -1.928512, 1, 0.8745098, 0, 1,
-1.090922, 1.043468, -0.7962921, 1, 0.8823529, 0, 1,
-1.087011, -0.6338717, -2.993646, 1, 0.8862745, 0, 1,
-1.08598, 0.0954386, -1.618085, 1, 0.8941177, 0, 1,
-1.083066, -0.3444586, -3.230503, 1, 0.8980392, 0, 1,
-1.081756, 1.828868, -1.694869, 1, 0.9058824, 0, 1,
-1.07851, -1.294538, -1.290972, 1, 0.9137255, 0, 1,
-1.074137, -0.1327074, -0.6249423, 1, 0.9176471, 0, 1,
-1.072592, -0.3869412, -3.1377, 1, 0.9254902, 0, 1,
-1.070753, -1.102909, -1.249014, 1, 0.9294118, 0, 1,
-1.067768, 1.801261, 0.4762267, 1, 0.9372549, 0, 1,
-1.066364, -1.792504, -2.2402, 1, 0.9411765, 0, 1,
-1.062351, -1.913152, -2.794661, 1, 0.9490196, 0, 1,
-1.054613, -1.852486, -4.274179, 1, 0.9529412, 0, 1,
-1.047429, -0.9013302, -3.107489, 1, 0.9607843, 0, 1,
-1.047419, -0.2793453, 0.2426775, 1, 0.9647059, 0, 1,
-1.040291, -0.5793617, -3.003132, 1, 0.972549, 0, 1,
-1.039726, 0.1671962, -1.735151, 1, 0.9764706, 0, 1,
-1.026827, -0.1828846, -1.210705, 1, 0.9843137, 0, 1,
-1.02402, 0.8090983, -0.1666275, 1, 0.9882353, 0, 1,
-1.023467, -1.185842, -3.02911, 1, 0.9960784, 0, 1,
-1.018966, -0.755527, -1.972402, 0.9960784, 1, 0, 1,
-0.9960009, 2.659858, -0.6835481, 0.9921569, 1, 0, 1,
-0.9915662, -0.8968902, -2.169268, 0.9843137, 1, 0, 1,
-0.9910362, -0.3362086, -1.891541, 0.9803922, 1, 0, 1,
-0.9864289, -0.5154606, -3.344072, 0.972549, 1, 0, 1,
-0.9857584, -0.6618046, -2.410945, 0.9686275, 1, 0, 1,
-0.9850677, -0.1029996, -1.111762, 0.9607843, 1, 0, 1,
-0.9803297, 0.3497588, -1.582297, 0.9568627, 1, 0, 1,
-0.9738175, 1.675498, -2.544106, 0.9490196, 1, 0, 1,
-0.9722502, -1.07065, -4.721637, 0.945098, 1, 0, 1,
-0.9695056, -0.4183247, -0.3816377, 0.9372549, 1, 0, 1,
-0.9570327, 0.2866632, -0.4517283, 0.9333333, 1, 0, 1,
-0.9560394, -0.596569, -2.956104, 0.9254902, 1, 0, 1,
-0.9531805, -0.02725901, -0.6971272, 0.9215686, 1, 0, 1,
-0.9529233, 0.8969575, -2.39468, 0.9137255, 1, 0, 1,
-0.9435984, -0.9825138, -1.350452, 0.9098039, 1, 0, 1,
-0.9363586, 1.017909, -1.408459, 0.9019608, 1, 0, 1,
-0.9177153, -0.2506763, -1.459303, 0.8941177, 1, 0, 1,
-0.9137815, 1.109911, 0.2246217, 0.8901961, 1, 0, 1,
-0.9080291, 0.1322812, -0.4460918, 0.8823529, 1, 0, 1,
-0.906207, -0.4394248, -1.554468, 0.8784314, 1, 0, 1,
-0.8976046, -0.5414189, -1.950418, 0.8705882, 1, 0, 1,
-0.8973024, 0.09219933, -0.2492527, 0.8666667, 1, 0, 1,
-0.8925336, 1.526935, -0.409977, 0.8588235, 1, 0, 1,
-0.8858333, 0.6369678, -1.549032, 0.854902, 1, 0, 1,
-0.8856953, -0.1044252, -2.720826, 0.8470588, 1, 0, 1,
-0.8819521, 1.21272, -0.09802078, 0.8431373, 1, 0, 1,
-0.880869, -0.8973143, -1.847355, 0.8352941, 1, 0, 1,
-0.8725297, 0.4610553, -1.64392, 0.8313726, 1, 0, 1,
-0.8680783, 0.1150553, -1.587663, 0.8235294, 1, 0, 1,
-0.8670642, 1.177925, 1.5066, 0.8196079, 1, 0, 1,
-0.8656442, -0.6457343, -3.642898, 0.8117647, 1, 0, 1,
-0.8605441, 0.7477049, -0.05357649, 0.8078431, 1, 0, 1,
-0.8547809, -0.6179202, -3.356985, 0.8, 1, 0, 1,
-0.8528172, 1.219271, -1.059096, 0.7921569, 1, 0, 1,
-0.851495, 0.09276652, -1.244152, 0.7882353, 1, 0, 1,
-0.8510496, 0.6899338, -0.2035658, 0.7803922, 1, 0, 1,
-0.8486598, 0.3182429, -1.203396, 0.7764706, 1, 0, 1,
-0.8457762, -0.3612708, -1.66988, 0.7686275, 1, 0, 1,
-0.8420522, -0.6415404, -1.149175, 0.7647059, 1, 0, 1,
-0.8358353, -0.6727905, -0.53523, 0.7568628, 1, 0, 1,
-0.8286473, -0.7550803, -2.37848, 0.7529412, 1, 0, 1,
-0.8285414, 0.6104029, -0.6165119, 0.7450981, 1, 0, 1,
-0.8283054, -2.055367, -2.843206, 0.7411765, 1, 0, 1,
-0.8239061, 0.4241065, -0.6204027, 0.7333333, 1, 0, 1,
-0.8234099, 0.9044459, -0.8492938, 0.7294118, 1, 0, 1,
-0.8168638, -0.2141027, -3.304204, 0.7215686, 1, 0, 1,
-0.8148412, 0.3463654, -1.483705, 0.7176471, 1, 0, 1,
-0.8109322, 0.7104694, -1.530107, 0.7098039, 1, 0, 1,
-0.8047608, 0.182362, -0.4357398, 0.7058824, 1, 0, 1,
-0.8040761, -1.477221, -2.439183, 0.6980392, 1, 0, 1,
-0.7976031, -1.438348, -3.529086, 0.6901961, 1, 0, 1,
-0.7947991, -0.3788049, -1.803013, 0.6862745, 1, 0, 1,
-0.7930208, -0.7594826, -2.929671, 0.6784314, 1, 0, 1,
-0.7825524, -0.3539486, -2.207919, 0.6745098, 1, 0, 1,
-0.7732561, -0.1153684, -2.256652, 0.6666667, 1, 0, 1,
-0.7721752, 0.5920966, -1.97175, 0.6627451, 1, 0, 1,
-0.7721119, 1.229292, -0.7610002, 0.654902, 1, 0, 1,
-0.7707006, -1.214056, -1.15055, 0.6509804, 1, 0, 1,
-0.7703877, 0.0959205, -0.6179219, 0.6431373, 1, 0, 1,
-0.765587, -0.1528131, -0.2799158, 0.6392157, 1, 0, 1,
-0.7576151, -1.193165, -2.687438, 0.6313726, 1, 0, 1,
-0.7525227, -2.230216, -2.65349, 0.627451, 1, 0, 1,
-0.7475495, -0.2074319, -2.665026, 0.6196079, 1, 0, 1,
-0.7396793, -0.852962, -3.283602, 0.6156863, 1, 0, 1,
-0.7373747, 1.430691, -0.3703589, 0.6078432, 1, 0, 1,
-0.7361957, 1.463565, -0.07879062, 0.6039216, 1, 0, 1,
-0.7323719, -0.3139966, -2.721094, 0.5960785, 1, 0, 1,
-0.7256221, 1.652952, -0.5368886, 0.5882353, 1, 0, 1,
-0.7239479, -0.9905666, -0.1682056, 0.5843138, 1, 0, 1,
-0.7177917, 0.2197485, -2.309365, 0.5764706, 1, 0, 1,
-0.7174054, -0.2033752, -2.367806, 0.572549, 1, 0, 1,
-0.7169667, 0.5790192, -0.2209455, 0.5647059, 1, 0, 1,
-0.7166947, 0.08946626, -3.724165, 0.5607843, 1, 0, 1,
-0.7136558, -0.5846886, -2.541488, 0.5529412, 1, 0, 1,
-0.7088495, 0.216417, -2.516281, 0.5490196, 1, 0, 1,
-0.7085258, 0.1628326, -2.182323, 0.5411765, 1, 0, 1,
-0.7077138, -0.6145902, -1.042914, 0.5372549, 1, 0, 1,
-0.7025014, -1.327923, -0.764165, 0.5294118, 1, 0, 1,
-0.7023932, -0.9521008, -2.304046, 0.5254902, 1, 0, 1,
-0.7002111, -0.8746226, -2.485205, 0.5176471, 1, 0, 1,
-0.6917098, 0.96908, -1.558531, 0.5137255, 1, 0, 1,
-0.6911151, 1.494391, -1.281606, 0.5058824, 1, 0, 1,
-0.6902602, -0.838273, -2.761904, 0.5019608, 1, 0, 1,
-0.6838896, 1.260431, -0.4724514, 0.4941176, 1, 0, 1,
-0.6832099, -0.0368367, -0.8167592, 0.4862745, 1, 0, 1,
-0.6775495, 0.6257383, -0.1187812, 0.4823529, 1, 0, 1,
-0.6757029, -0.518854, -2.277578, 0.4745098, 1, 0, 1,
-0.6704884, -0.1401089, -0.738143, 0.4705882, 1, 0, 1,
-0.6657425, 0.4500753, -1.140725, 0.4627451, 1, 0, 1,
-0.6636216, -0.01758625, -2.384339, 0.4588235, 1, 0, 1,
-0.6627869, 1.321538, 1.455448, 0.4509804, 1, 0, 1,
-0.6541811, -1.818235, -2.604523, 0.4470588, 1, 0, 1,
-0.6531817, -1.974222, -2.652935, 0.4392157, 1, 0, 1,
-0.649608, 0.7542752, -1.001043, 0.4352941, 1, 0, 1,
-0.6464996, 1.188008, -0.602661, 0.427451, 1, 0, 1,
-0.6447974, -1.322303, -2.101478, 0.4235294, 1, 0, 1,
-0.64401, 0.4742255, -2.866725, 0.4156863, 1, 0, 1,
-0.6404836, -0.1189483, 0.02953647, 0.4117647, 1, 0, 1,
-0.6395156, -1.681687, -3.380856, 0.4039216, 1, 0, 1,
-0.636597, -1.870216, -2.399585, 0.3960784, 1, 0, 1,
-0.6316028, -0.5459041, -2.548319, 0.3921569, 1, 0, 1,
-0.6304832, -0.3547807, -2.018542, 0.3843137, 1, 0, 1,
-0.6241881, 0.352251, -1.253695, 0.3803922, 1, 0, 1,
-0.6236383, -1.372017, -2.460958, 0.372549, 1, 0, 1,
-0.6168272, 1.344813, -1.781466, 0.3686275, 1, 0, 1,
-0.6144947, 0.3918902, -1.525079, 0.3607843, 1, 0, 1,
-0.6104643, -0.2255154, -1.068157, 0.3568628, 1, 0, 1,
-0.6094443, -1.055704, -2.956243, 0.3490196, 1, 0, 1,
-0.6071227, -0.6424301, -2.967466, 0.345098, 1, 0, 1,
-0.6035016, -0.8917609, -3.388854, 0.3372549, 1, 0, 1,
-0.6012993, -1.638797, -3.089416, 0.3333333, 1, 0, 1,
-0.6008811, 0.2398006, -2.57847, 0.3254902, 1, 0, 1,
-0.5960763, -0.595099, -1.966787, 0.3215686, 1, 0, 1,
-0.5900803, 1.846613, -1.779201, 0.3137255, 1, 0, 1,
-0.5862398, -1.038196, -2.8125, 0.3098039, 1, 0, 1,
-0.5841637, 1.342595, 0.06056144, 0.3019608, 1, 0, 1,
-0.5840512, -0.5769721, -2.536998, 0.2941177, 1, 0, 1,
-0.5816703, 0.5575422, -0.8188224, 0.2901961, 1, 0, 1,
-0.5812222, 0.1617584, -3.086594, 0.282353, 1, 0, 1,
-0.5753255, 0.793646, -0.6055921, 0.2784314, 1, 0, 1,
-0.5700148, -1.260457, -4.077741, 0.2705882, 1, 0, 1,
-0.5652499, -0.4909053, -3.166927, 0.2666667, 1, 0, 1,
-0.5636206, -0.7981493, -2.809726, 0.2588235, 1, 0, 1,
-0.5612028, -0.3788715, -0.5901964, 0.254902, 1, 0, 1,
-0.5596808, -1.322987, -3.958305, 0.2470588, 1, 0, 1,
-0.5555157, 0.7261809, 0.2380175, 0.2431373, 1, 0, 1,
-0.5526869, -0.5804409, -2.33137, 0.2352941, 1, 0, 1,
-0.5523089, -0.08888082, -4.114489, 0.2313726, 1, 0, 1,
-0.5508834, 0.9408307, -0.5496224, 0.2235294, 1, 0, 1,
-0.5501985, -0.1537925, -2.828325, 0.2196078, 1, 0, 1,
-0.5489066, 0.140459, -0.6520287, 0.2117647, 1, 0, 1,
-0.5464882, 1.811545, 0.6811321, 0.2078431, 1, 0, 1,
-0.5406909, -0.5534688, -3.44014, 0.2, 1, 0, 1,
-0.5364808, -0.08687912, -0.9134182, 0.1921569, 1, 0, 1,
-0.5313346, -1.256613, -3.402559, 0.1882353, 1, 0, 1,
-0.5277109, -0.4133009, -2.696037, 0.1803922, 1, 0, 1,
-0.5267209, 1.071274, -1.193758, 0.1764706, 1, 0, 1,
-0.5264639, 0.9989992, -1.536491, 0.1686275, 1, 0, 1,
-0.5136866, -0.7047744, -1.565743, 0.1647059, 1, 0, 1,
-0.5129495, -1.837529, -1.92555, 0.1568628, 1, 0, 1,
-0.5129004, 1.092205, 0.6532685, 0.1529412, 1, 0, 1,
-0.5121797, 1.490467, -1.334125, 0.145098, 1, 0, 1,
-0.511198, -1.088644, -2.679896, 0.1411765, 1, 0, 1,
-0.5082256, -0.2100655, -2.972024, 0.1333333, 1, 0, 1,
-0.5081118, 1.381937, 0.04364488, 0.1294118, 1, 0, 1,
-0.5075685, -0.9013757, -1.5781, 0.1215686, 1, 0, 1,
-0.5040805, 2.409535, 0.7246926, 0.1176471, 1, 0, 1,
-0.4998089, 0.01409213, -3.899875, 0.1098039, 1, 0, 1,
-0.4979997, -0.2722867, -0.6710503, 0.1058824, 1, 0, 1,
-0.4920132, -0.7312319, -2.183298, 0.09803922, 1, 0, 1,
-0.4841385, 2.545822, 0.4170605, 0.09019608, 1, 0, 1,
-0.4836619, 0.08235797, -1.611407, 0.08627451, 1, 0, 1,
-0.4812762, -1.365719, -5.645068, 0.07843138, 1, 0, 1,
-0.4802322, 0.5970621, -0.05930791, 0.07450981, 1, 0, 1,
-0.4759771, 0.1291939, -1.078502, 0.06666667, 1, 0, 1,
-0.4757705, 0.3831694, -1.53802, 0.0627451, 1, 0, 1,
-0.4686078, 0.874061, -1.299553, 0.05490196, 1, 0, 1,
-0.4621205, -2.338094, -2.772766, 0.05098039, 1, 0, 1,
-0.4599242, -1.986513, -2.402904, 0.04313726, 1, 0, 1,
-0.4594396, 1.093619, -1.660539, 0.03921569, 1, 0, 1,
-0.4538294, -1.122916, -3.0094, 0.03137255, 1, 0, 1,
-0.4521843, -0.9247233, -1.985245, 0.02745098, 1, 0, 1,
-0.4516804, -0.9613525, -2.654811, 0.01960784, 1, 0, 1,
-0.45054, 0.1627635, -1.371193, 0.01568628, 1, 0, 1,
-0.4451789, -1.05422, -2.719455, 0.007843138, 1, 0, 1,
-0.4431109, -0.7372926, -2.789681, 0.003921569, 1, 0, 1,
-0.4408156, 1.557988, -0.02824838, 0, 1, 0.003921569, 1,
-0.4334021, 1.795882, -0.4519815, 0, 1, 0.01176471, 1,
-0.429781, -0.1035172, 0.1648991, 0, 1, 0.01568628, 1,
-0.4293323, -0.8822616, -3.244143, 0, 1, 0.02352941, 1,
-0.4285856, 1.729757, -1.869834, 0, 1, 0.02745098, 1,
-0.4266882, -0.5206867, -3.2385, 0, 1, 0.03529412, 1,
-0.4195241, -0.4859092, -3.610094, 0, 1, 0.03921569, 1,
-0.419468, 0.06495304, -0.8638548, 0, 1, 0.04705882, 1,
-0.419409, 1.341633, 0.06947497, 0, 1, 0.05098039, 1,
-0.4157402, -0.1297727, -1.17654, 0, 1, 0.05882353, 1,
-0.4140902, -2.054503, -2.880363, 0, 1, 0.0627451, 1,
-0.4097137, -0.2415523, -4.432034, 0, 1, 0.07058824, 1,
-0.3994941, -1.979336, -4.524349, 0, 1, 0.07450981, 1,
-0.399269, 1.012885, 0.886434, 0, 1, 0.08235294, 1,
-0.3989902, -0.08968781, -1.295627, 0, 1, 0.08627451, 1,
-0.3989371, -0.3006714, -0.9039374, 0, 1, 0.09411765, 1,
-0.3963024, 0.2830492, 0.1552811, 0, 1, 0.1019608, 1,
-0.3936521, -0.7755799, -1.772996, 0, 1, 0.1058824, 1,
-0.3924294, -1.202856, -4.895716, 0, 1, 0.1137255, 1,
-0.3801463, -0.3914976, -2.510352, 0, 1, 0.1176471, 1,
-0.3793574, -0.2572441, -1.613634, 0, 1, 0.1254902, 1,
-0.3791798, 0.7649139, 0.4654901, 0, 1, 0.1294118, 1,
-0.3647501, 1.415881, 0.9385456, 0, 1, 0.1372549, 1,
-0.3647004, 0.353222, -1.938884, 0, 1, 0.1411765, 1,
-0.3643926, 0.6067886, 0.1239073, 0, 1, 0.1490196, 1,
-0.361445, 1.013212, -0.9561177, 0, 1, 0.1529412, 1,
-0.3546287, 1.217226, -0.7601601, 0, 1, 0.1607843, 1,
-0.3529716, -0.6747051, -2.076184, 0, 1, 0.1647059, 1,
-0.3508165, 0.1038422, 0.1241283, 0, 1, 0.172549, 1,
-0.3506912, 1.447411, -0.5548628, 0, 1, 0.1764706, 1,
-0.3495245, -0.9309766, -1.797664, 0, 1, 0.1843137, 1,
-0.3436811, 0.2190903, -1.246858, 0, 1, 0.1882353, 1,
-0.3347788, -0.2216138, -2.467235, 0, 1, 0.1960784, 1,
-0.3322654, -1.548411, -3.087207, 0, 1, 0.2039216, 1,
-0.329881, 0.6428843, -1.486828, 0, 1, 0.2078431, 1,
-0.3294481, 0.1946111, 0.1474616, 0, 1, 0.2156863, 1,
-0.3240219, -1.377152, -2.276802, 0, 1, 0.2196078, 1,
-0.3224339, -0.07501642, -2.940145, 0, 1, 0.227451, 1,
-0.3174036, 0.5513856, 0.1177964, 0, 1, 0.2313726, 1,
-0.3109259, 0.287462, -3.219435, 0, 1, 0.2392157, 1,
-0.3040767, -0.7638484, -3.510032, 0, 1, 0.2431373, 1,
-0.3033071, -0.1348356, -3.080586, 0, 1, 0.2509804, 1,
-0.2993626, -0.6012313, -4.422383, 0, 1, 0.254902, 1,
-0.2968104, 0.6703798, -1.048396, 0, 1, 0.2627451, 1,
-0.2960489, 2.167992, -1.586121, 0, 1, 0.2666667, 1,
-0.2956021, -0.5942186, -1.359353, 0, 1, 0.2745098, 1,
-0.2930554, -0.01366383, -0.3974512, 0, 1, 0.2784314, 1,
-0.2883508, -0.3455596, -2.279804, 0, 1, 0.2862745, 1,
-0.2853738, 0.3034528, 0.4702125, 0, 1, 0.2901961, 1,
-0.282667, 1.145714, 1.303624, 0, 1, 0.2980392, 1,
-0.2796272, 0.0811511, -2.739291, 0, 1, 0.3058824, 1,
-0.2748336, -0.8519837, -1.736675, 0, 1, 0.3098039, 1,
-0.2737513, 0.1452571, -0.05507052, 0, 1, 0.3176471, 1,
-0.2685653, 0.9343166, -1.325978, 0, 1, 0.3215686, 1,
-0.2681974, -0.5575016, -1.878192, 0, 1, 0.3294118, 1,
-0.2655667, 0.1483683, -2.805031, 0, 1, 0.3333333, 1,
-0.2649826, 0.05423974, -2.83193, 0, 1, 0.3411765, 1,
-0.264468, -0.2654509, -1.824163, 0, 1, 0.345098, 1,
-0.2643909, -0.2487, -1.107545, 0, 1, 0.3529412, 1,
-0.2629054, 0.1186294, -2.439178, 0, 1, 0.3568628, 1,
-0.2628126, 0.540356, -1.101413, 0, 1, 0.3647059, 1,
-0.26249, 0.3672135, 0.9127473, 0, 1, 0.3686275, 1,
-0.2618861, 1.947338, -1.168044, 0, 1, 0.3764706, 1,
-0.2618296, -0.6116309, -2.933422, 0, 1, 0.3803922, 1,
-0.2612844, 0.6842219, -0.632055, 0, 1, 0.3882353, 1,
-0.2601836, 0.1535468, -2.830604, 0, 1, 0.3921569, 1,
-0.2597833, 1.296555, 1.232208, 0, 1, 0.4, 1,
-0.252169, -0.008201104, 0.06796571, 0, 1, 0.4078431, 1,
-0.2414306, -0.8081043, -1.837303, 0, 1, 0.4117647, 1,
-0.238108, -1.354827, -3.580643, 0, 1, 0.4196078, 1,
-0.2352472, 0.9638424, 1.122151, 0, 1, 0.4235294, 1,
-0.234722, 0.5133973, 0.7312801, 0, 1, 0.4313726, 1,
-0.2344309, 1.575865, 1.104374, 0, 1, 0.4352941, 1,
-0.2261273, -0.2601323, -2.989252, 0, 1, 0.4431373, 1,
-0.2207425, -1.747509, -3.285123, 0, 1, 0.4470588, 1,
-0.2202287, 0.5750877, -0.2607127, 0, 1, 0.454902, 1,
-0.2192768, -0.5298396, -2.130579, 0, 1, 0.4588235, 1,
-0.2164616, -0.8117191, -4.562305, 0, 1, 0.4666667, 1,
-0.2146163, 1.339693, -1.009723, 0, 1, 0.4705882, 1,
-0.2143475, 1.286594, -1.918078, 0, 1, 0.4784314, 1,
-0.2138881, -0.6513559, -2.461695, 0, 1, 0.4823529, 1,
-0.2137994, -0.536801, -2.280666, 0, 1, 0.4901961, 1,
-0.2081826, -0.2044055, -3.851385, 0, 1, 0.4941176, 1,
-0.2060112, 1.102335, -0.5907919, 0, 1, 0.5019608, 1,
-0.2037073, -0.8692557, -4.05286, 0, 1, 0.509804, 1,
-0.2029021, -0.9854031, -1.953247, 0, 1, 0.5137255, 1,
-0.196998, -0.9159908, -3.581599, 0, 1, 0.5215687, 1,
-0.1882719, -0.8865423, -2.645303, 0, 1, 0.5254902, 1,
-0.1848514, 0.1520686, 0.184489, 0, 1, 0.5333334, 1,
-0.1838473, -0.09650042, -2.254246, 0, 1, 0.5372549, 1,
-0.18267, 0.3332298, -1.489345, 0, 1, 0.5450981, 1,
-0.1802336, 0.105538, 0.3647128, 0, 1, 0.5490196, 1,
-0.1799292, 0.4494599, -1.799824, 0, 1, 0.5568628, 1,
-0.1782177, 0.8504692, -1.43723, 0, 1, 0.5607843, 1,
-0.1753573, 1.308715, -0.08948161, 0, 1, 0.5686275, 1,
-0.1749067, -1.247966, -1.817267, 0, 1, 0.572549, 1,
-0.1708716, 0.6335272, 1.183533, 0, 1, 0.5803922, 1,
-0.1693519, -0.5659536, -3.15145, 0, 1, 0.5843138, 1,
-0.1673311, 0.5469645, 0.4412881, 0, 1, 0.5921569, 1,
-0.1672046, -1.255175, -2.248079, 0, 1, 0.5960785, 1,
-0.1663156, -1.189737, -4.690907, 0, 1, 0.6039216, 1,
-0.1591382, 0.8925539, -1.125057, 0, 1, 0.6117647, 1,
-0.1553364, -0.1928638, -0.8918552, 0, 1, 0.6156863, 1,
-0.1498499, 0.6558107, 0.9866134, 0, 1, 0.6235294, 1,
-0.1434177, -0.1369577, -2.596128, 0, 1, 0.627451, 1,
-0.1410654, 0.5454602, 1.372898, 0, 1, 0.6352941, 1,
-0.1404455, 1.358078, -0.5757607, 0, 1, 0.6392157, 1,
-0.1401014, -1.355948, -1.892327, 0, 1, 0.6470588, 1,
-0.1334182, 0.2214517, -1.081374, 0, 1, 0.6509804, 1,
-0.1299675, -0.3131769, -4.459452, 0, 1, 0.6588235, 1,
-0.1263529, -0.8074304, -0.7883036, 0, 1, 0.6627451, 1,
-0.1252852, 0.5404441, -2.966934, 0, 1, 0.6705883, 1,
-0.1250025, -0.4409718, -2.930148, 0, 1, 0.6745098, 1,
-0.1249359, -2.176341, -4.848417, 0, 1, 0.682353, 1,
-0.1223629, -0.2004267, -3.01699, 0, 1, 0.6862745, 1,
-0.1176872, -0.2090651, -3.518987, 0, 1, 0.6941177, 1,
-0.1176585, 1.739387, -0.4104936, 0, 1, 0.7019608, 1,
-0.1143628, 1.64424, -0.3451688, 0, 1, 0.7058824, 1,
-0.1098794, -1.438774, -2.172744, 0, 1, 0.7137255, 1,
-0.1084517, -0.1192284, -2.974247, 0, 1, 0.7176471, 1,
-0.1073093, 0.2296424, 0.5647705, 0, 1, 0.7254902, 1,
-0.1045678, 2.807494, -0.7532728, 0, 1, 0.7294118, 1,
-0.1029013, 2.29116, -0.01679245, 0, 1, 0.7372549, 1,
-0.1026746, 1.174085, 0.0994806, 0, 1, 0.7411765, 1,
-0.09351073, -0.6679354, -1.760821, 0, 1, 0.7490196, 1,
-0.09097517, -0.9701213, -3.168929, 0, 1, 0.7529412, 1,
-0.08980557, 1.299715, -0.4039685, 0, 1, 0.7607843, 1,
-0.08853991, -0.4706203, -1.954335, 0, 1, 0.7647059, 1,
-0.08777328, 1.065417, -0.3433212, 0, 1, 0.772549, 1,
-0.08649391, -0.246765, -1.708845, 0, 1, 0.7764706, 1,
-0.08424139, -1.813251, -1.552463, 0, 1, 0.7843137, 1,
-0.07681683, -0.3494291, -3.670762, 0, 1, 0.7882353, 1,
-0.073722, -0.5230837, -2.807377, 0, 1, 0.7960784, 1,
-0.0721964, -0.7545646, -3.480066, 0, 1, 0.8039216, 1,
-0.06855294, 0.8484449, 0.7912365, 0, 1, 0.8078431, 1,
-0.06587773, 1.07451, -0.6178241, 0, 1, 0.8156863, 1,
-0.06045632, 1.482698, -0.5906583, 0, 1, 0.8196079, 1,
-0.06040931, 0.1155078, -1.439848, 0, 1, 0.827451, 1,
-0.05911408, -0.1803886, -4.347082, 0, 1, 0.8313726, 1,
-0.05769588, 0.268975, -1.950074, 0, 1, 0.8392157, 1,
-0.05474287, 0.002797941, -2.466531, 0, 1, 0.8431373, 1,
-0.0512707, -0.7121608, -5.095335, 0, 1, 0.8509804, 1,
-0.05042962, 0.3955941, 0.7513087, 0, 1, 0.854902, 1,
-0.05030225, -0.9642395, -2.374481, 0, 1, 0.8627451, 1,
-0.04995134, -1.308243, -3.07379, 0, 1, 0.8666667, 1,
-0.04968286, 0.280503, -0.4815925, 0, 1, 0.8745098, 1,
-0.04397828, 1.082639, 0.05857212, 0, 1, 0.8784314, 1,
-0.04258827, 0.5340713, -1.626954, 0, 1, 0.8862745, 1,
-0.04250864, -0.04007607, -1.817863, 0, 1, 0.8901961, 1,
-0.04170242, 0.09329176, 0.09768339, 0, 1, 0.8980392, 1,
-0.03933597, -1.368639, -4.724082, 0, 1, 0.9058824, 1,
-0.03780449, 0.691152, -0.9439892, 0, 1, 0.9098039, 1,
-0.03559544, 1.212886, 0.1076262, 0, 1, 0.9176471, 1,
-0.03355848, -0.9071049, -4.912229, 0, 1, 0.9215686, 1,
-0.03141765, -0.673862, -3.026634, 0, 1, 0.9294118, 1,
-0.02841175, 0.7610493, 0.8095449, 0, 1, 0.9333333, 1,
-0.0276254, 0.4018438, -0.5642083, 0, 1, 0.9411765, 1,
-0.02659836, 0.1786083, -1.555974, 0, 1, 0.945098, 1,
-0.02547499, 0.8192631, -0.4564931, 0, 1, 0.9529412, 1,
-0.02264796, -1.148014, -3.266298, 0, 1, 0.9568627, 1,
-0.02238352, 0.1103292, -1.833809, 0, 1, 0.9647059, 1,
-0.02076979, -0.4236334, -2.973051, 0, 1, 0.9686275, 1,
-0.0203356, -0.234069, -3.072965, 0, 1, 0.9764706, 1,
-0.02006328, 0.4041817, -0.77222, 0, 1, 0.9803922, 1,
-0.01884193, -0.5807617, -3.710324, 0, 1, 0.9882353, 1,
-0.01749324, -0.1267402, -4.023744, 0, 1, 0.9921569, 1,
-0.01746232, 1.941869, 0.04432977, 0, 1, 1, 1,
-0.01708934, -1.026874, -2.327127, 0, 0.9921569, 1, 1,
-0.01622388, 0.07945233, 0.4303221, 0, 0.9882353, 1, 1,
-0.01509692, -0.5906518, -3.68391, 0, 0.9803922, 1, 1,
-0.007329335, 0.1539699, -0.7704534, 0, 0.9764706, 1, 1,
-0.006506589, 2.44478, 0.8697102, 0, 0.9686275, 1, 1,
-0.003265197, -0.1144419, -3.570246, 0, 0.9647059, 1, 1,
-0.001911266, 0.02942054, -0.4706253, 0, 0.9568627, 1, 1,
-0.001473141, 0.9934971, -0.9675682, 0, 0.9529412, 1, 1,
0.002031329, -1.217534, 4.52103, 0, 0.945098, 1, 1,
0.002703989, 0.3419697, -0.02791104, 0, 0.9411765, 1, 1,
0.005963522, -0.7133869, 4.353503, 0, 0.9333333, 1, 1,
0.005986759, -0.4694897, 3.806516, 0, 0.9294118, 1, 1,
0.01231574, -0.01482816, 1.403784, 0, 0.9215686, 1, 1,
0.01750006, 1.09951, 1.522642, 0, 0.9176471, 1, 1,
0.01950104, 0.1827764, 0.1566144, 0, 0.9098039, 1, 1,
0.02112555, -1.231665, 2.457562, 0, 0.9058824, 1, 1,
0.02331946, -0.6034193, 3.332568, 0, 0.8980392, 1, 1,
0.02421309, -0.283793, 2.52381, 0, 0.8901961, 1, 1,
0.02612433, 1.099629, 2.0161, 0, 0.8862745, 1, 1,
0.02637573, 0.03961491, 2.466838, 0, 0.8784314, 1, 1,
0.02910629, -0.7383056, 2.941052, 0, 0.8745098, 1, 1,
0.03110882, -1.093007, 3.838013, 0, 0.8666667, 1, 1,
0.03550328, -0.3602667, 1.528823, 0, 0.8627451, 1, 1,
0.03670885, -0.1236, 3.167982, 0, 0.854902, 1, 1,
0.03801541, -0.4473009, 4.100508, 0, 0.8509804, 1, 1,
0.04017846, 0.3400741, 0.492491, 0, 0.8431373, 1, 1,
0.04259949, -0.8646979, 3.605147, 0, 0.8392157, 1, 1,
0.04571249, -0.3296415, 2.847182, 0, 0.8313726, 1, 1,
0.04682042, -1.781228, 3.872841, 0, 0.827451, 1, 1,
0.04795479, -0.1643189, 4.214797, 0, 0.8196079, 1, 1,
0.04880401, 0.4590797, 0.7216072, 0, 0.8156863, 1, 1,
0.0521887, -0.2984526, 3.331948, 0, 0.8078431, 1, 1,
0.05305093, -0.5647526, 4.485567, 0, 0.8039216, 1, 1,
0.05377911, -0.746232, 2.473807, 0, 0.7960784, 1, 1,
0.05480896, 0.1687086, 0.6281417, 0, 0.7882353, 1, 1,
0.05529542, -0.454806, 4.000489, 0, 0.7843137, 1, 1,
0.05767633, -0.200305, 2.686217, 0, 0.7764706, 1, 1,
0.05932842, -0.9054892, 4.777122, 0, 0.772549, 1, 1,
0.06209389, -0.7124108, 2.602957, 0, 0.7647059, 1, 1,
0.06627025, 1.498567, -0.2827509, 0, 0.7607843, 1, 1,
0.06697474, -1.377567, 3.932389, 0, 0.7529412, 1, 1,
0.06701332, -0.1144007, 2.366885, 0, 0.7490196, 1, 1,
0.06773124, 0.3317865, -0.3404915, 0, 0.7411765, 1, 1,
0.07222646, -1.381538, 4.060947, 0, 0.7372549, 1, 1,
0.07581736, 1.450821, 1.161281, 0, 0.7294118, 1, 1,
0.07645575, -0.300863, 4.783858, 0, 0.7254902, 1, 1,
0.07646103, 0.8254958, 0.0418561, 0, 0.7176471, 1, 1,
0.07724258, 0.8310823, -0.07493005, 0, 0.7137255, 1, 1,
0.07957421, -1.544433, 2.541969, 0, 0.7058824, 1, 1,
0.08112638, 1.047872, -1.221301, 0, 0.6980392, 1, 1,
0.08956078, -2.132429, 2.662828, 0, 0.6941177, 1, 1,
0.09775169, -1.565727, 3.826647, 0, 0.6862745, 1, 1,
0.09784462, 0.3317844, 0.114104, 0, 0.682353, 1, 1,
0.0983421, -1.161758, 1.659017, 0, 0.6745098, 1, 1,
0.1091267, 0.06433094, -0.2340983, 0, 0.6705883, 1, 1,
0.109327, 0.4248935, -2.014857, 0, 0.6627451, 1, 1,
0.1095316, 0.5774094, 0.7969635, 0, 0.6588235, 1, 1,
0.1098731, 0.3546411, -0.2511267, 0, 0.6509804, 1, 1,
0.1132711, -0.3354837, 1.651271, 0, 0.6470588, 1, 1,
0.1133679, 1.583434, -0.806727, 0, 0.6392157, 1, 1,
0.1158163, -0.469181, 2.421266, 0, 0.6352941, 1, 1,
0.1204308, -0.4491333, 3.435009, 0, 0.627451, 1, 1,
0.1208525, 1.782668, -0.2323978, 0, 0.6235294, 1, 1,
0.1296663, 1.366789, 0.6211396, 0, 0.6156863, 1, 1,
0.1318547, -0.3868636, 2.286438, 0, 0.6117647, 1, 1,
0.1329285, -0.4462071, 2.927781, 0, 0.6039216, 1, 1,
0.1368058, -0.9865178, 3.790265, 0, 0.5960785, 1, 1,
0.1376795, 1.539322, 1.420442, 0, 0.5921569, 1, 1,
0.1386966, -0.4947469, 3.798474, 0, 0.5843138, 1, 1,
0.1409623, 0.3086785, 1.657439, 0, 0.5803922, 1, 1,
0.1410809, 0.3022406, 1.165518, 0, 0.572549, 1, 1,
0.1452934, -0.1765126, 2.878309, 0, 0.5686275, 1, 1,
0.1466514, -0.6007613, 3.186394, 0, 0.5607843, 1, 1,
0.1469738, -1.134516, 1.594033, 0, 0.5568628, 1, 1,
0.1480989, 0.8430995, 0.02680909, 0, 0.5490196, 1, 1,
0.1528178, 0.9215749, 0.8685936, 0, 0.5450981, 1, 1,
0.1565761, -0.3864299, 2.20022, 0, 0.5372549, 1, 1,
0.1569009, 0.8611373, 0.033742, 0, 0.5333334, 1, 1,
0.1634721, -0.2011555, 3.374414, 0, 0.5254902, 1, 1,
0.1637469, 0.7853199, 1.338949, 0, 0.5215687, 1, 1,
0.1676454, -0.3995971, 1.827329, 0, 0.5137255, 1, 1,
0.16899, -0.5150969, 3.715405, 0, 0.509804, 1, 1,
0.1718995, 0.7176566, 0.1709445, 0, 0.5019608, 1, 1,
0.1738448, 0.7867787, -0.5127294, 0, 0.4941176, 1, 1,
0.1742771, 0.3616208, 0.9048582, 0, 0.4901961, 1, 1,
0.1796131, -0.2014381, 1.710843, 0, 0.4823529, 1, 1,
0.1866585, 0.05664481, 1.839907, 0, 0.4784314, 1, 1,
0.1875767, 0.3896588, 1.357652, 0, 0.4705882, 1, 1,
0.1910982, -0.7432017, 4.856912, 0, 0.4666667, 1, 1,
0.1937772, -1.143133, 2.904142, 0, 0.4588235, 1, 1,
0.1940061, 1.493656, 0.9225194, 0, 0.454902, 1, 1,
0.195416, 2.140836, -0.4915456, 0, 0.4470588, 1, 1,
0.1967795, -0.5054829, 2.438442, 0, 0.4431373, 1, 1,
0.1988717, 1.777783, -0.7098781, 0, 0.4352941, 1, 1,
0.1993902, -0.2410188, 4.182019, 0, 0.4313726, 1, 1,
0.2064249, 0.821149, 0.615234, 0, 0.4235294, 1, 1,
0.211338, -0.1058826, 0.587557, 0, 0.4196078, 1, 1,
0.2121202, 0.6583728, -0.1930865, 0, 0.4117647, 1, 1,
0.2151207, -1.817362, 2.705745, 0, 0.4078431, 1, 1,
0.2168668, -0.4438636, 4.197067, 0, 0.4, 1, 1,
0.219661, -1.067384, 2.981253, 0, 0.3921569, 1, 1,
0.2214719, 0.281168, 0.5114351, 0, 0.3882353, 1, 1,
0.2224783, 0.6026046, 0.4656597, 0, 0.3803922, 1, 1,
0.226116, -0.3671924, 2.036752, 0, 0.3764706, 1, 1,
0.230362, -0.9559209, 3.865709, 0, 0.3686275, 1, 1,
0.2310287, 1.482238, 0.4418046, 0, 0.3647059, 1, 1,
0.231988, 1.733994, 1.108283, 0, 0.3568628, 1, 1,
0.2328244, -0.2714061, 2.994334, 0, 0.3529412, 1, 1,
0.2363866, 0.5002228, 0.1080143, 0, 0.345098, 1, 1,
0.2389821, 2.077835, -0.6693641, 0, 0.3411765, 1, 1,
0.2400837, -0.7828761, 1.770144, 0, 0.3333333, 1, 1,
0.2408864, -0.9293166, 2.063839, 0, 0.3294118, 1, 1,
0.2437905, -0.6539143, 2.751604, 0, 0.3215686, 1, 1,
0.2439462, -1.25083, 2.852295, 0, 0.3176471, 1, 1,
0.2445173, 1.105228, 0.2976409, 0, 0.3098039, 1, 1,
0.246499, 1.070741, 0.02649275, 0, 0.3058824, 1, 1,
0.2480312, 0.182425, 0.3426246, 0, 0.2980392, 1, 1,
0.2488313, -1.323799, 3.546759, 0, 0.2901961, 1, 1,
0.2499128, 1.001689, 0.1749611, 0, 0.2862745, 1, 1,
0.249963, 0.09642086, 1.398509, 0, 0.2784314, 1, 1,
0.2522794, -0.6701992, 2.309367, 0, 0.2745098, 1, 1,
0.2542952, -1.028193, 2.619293, 0, 0.2666667, 1, 1,
0.2557824, -0.02486461, 1.240285, 0, 0.2627451, 1, 1,
0.2558188, -1.552357, 3.423107, 0, 0.254902, 1, 1,
0.2572443, 0.3666712, 0.03385792, 0, 0.2509804, 1, 1,
0.2580599, -0.7077304, 1.47849, 0, 0.2431373, 1, 1,
0.2595161, 0.7075007, -0.6839948, 0, 0.2392157, 1, 1,
0.2595189, 1.612846, 1.580852, 0, 0.2313726, 1, 1,
0.2626542, 1.987863, -0.4543113, 0, 0.227451, 1, 1,
0.2708755, 0.1028427, -1.166593, 0, 0.2196078, 1, 1,
0.279323, -0.4059971, 2.062381, 0, 0.2156863, 1, 1,
0.283749, 0.1078317, 3.296376, 0, 0.2078431, 1, 1,
0.285343, 1.306745, -0.8247672, 0, 0.2039216, 1, 1,
0.2860418, 1.017179, 1.013666, 0, 0.1960784, 1, 1,
0.2895395, -1.841495, 3.358262, 0, 0.1882353, 1, 1,
0.2903725, 0.2426589, 0.6764646, 0, 0.1843137, 1, 1,
0.2912838, -0.8983214, 3.10955, 0, 0.1764706, 1, 1,
0.2915998, -0.699263, 1.710066, 0, 0.172549, 1, 1,
0.2921178, 0.5689115, 0.6476049, 0, 0.1647059, 1, 1,
0.292437, -0.1883833, 1.087203, 0, 0.1607843, 1, 1,
0.2932211, -0.5314724, 3.646638, 0, 0.1529412, 1, 1,
0.2943155, 0.8644111, 0.4454305, 0, 0.1490196, 1, 1,
0.2969571, 0.8554914, 0.1057674, 0, 0.1411765, 1, 1,
0.2976238, -0.07702362, 1.333619, 0, 0.1372549, 1, 1,
0.2979721, 0.7702409, 1.584255, 0, 0.1294118, 1, 1,
0.2982007, -0.230217, 2.55988, 0, 0.1254902, 1, 1,
0.3021266, -1.945638, 4.783988, 0, 0.1176471, 1, 1,
0.3069904, 1.48357, -0.5739629, 0, 0.1137255, 1, 1,
0.3121198, 1.174093, -0.1618201, 0, 0.1058824, 1, 1,
0.3121616, -0.5097857, 2.874321, 0, 0.09803922, 1, 1,
0.3130893, -0.5767775, 2.284934, 0, 0.09411765, 1, 1,
0.3140619, 0.4971716, 1.09172, 0, 0.08627451, 1, 1,
0.3157067, 0.7430112, 1.070529, 0, 0.08235294, 1, 1,
0.3164146, 0.1195248, 3.127963, 0, 0.07450981, 1, 1,
0.3164702, 0.7399847, 0.991331, 0, 0.07058824, 1, 1,
0.322383, -0.2731187, 2.8224, 0, 0.0627451, 1, 1,
0.3326649, 0.9727029, 0.8386664, 0, 0.05882353, 1, 1,
0.3341092, -1.539489, 4.157519, 0, 0.05098039, 1, 1,
0.3381694, 0.3135499, -0.1063052, 0, 0.04705882, 1, 1,
0.3425172, 0.4888268, 0.9042425, 0, 0.03921569, 1, 1,
0.3428209, -1.727738, 3.310934, 0, 0.03529412, 1, 1,
0.3446837, 0.4908702, 1.379365, 0, 0.02745098, 1, 1,
0.3473915, 0.4837238, 0.83447, 0, 0.02352941, 1, 1,
0.3586531, 0.48382, 1.429669, 0, 0.01568628, 1, 1,
0.363871, -0.1220815, -0.3291849, 0, 0.01176471, 1, 1,
0.3675267, -0.4425569, 2.708454, 0, 0.003921569, 1, 1,
0.3682161, -0.08905432, 0.1311057, 0.003921569, 0, 1, 1,
0.372817, 0.4320494, 1.551766, 0.007843138, 0, 1, 1,
0.3755241, -1.525025, 1.290636, 0.01568628, 0, 1, 1,
0.379818, -1.510529, 4.318882, 0.01960784, 0, 1, 1,
0.3803391, 0.5904046, 2.512166, 0.02745098, 0, 1, 1,
0.3811783, -1.141646, 2.427801, 0.03137255, 0, 1, 1,
0.3816605, -0.03049866, 2.371498, 0.03921569, 0, 1, 1,
0.3836921, 0.9046635, -0.03222444, 0.04313726, 0, 1, 1,
0.3843671, -0.02965906, 1.308123, 0.05098039, 0, 1, 1,
0.3858835, -1.423091, 5.040682, 0.05490196, 0, 1, 1,
0.3899212, 0.5545307, 0.6254022, 0.0627451, 0, 1, 1,
0.3936243, 0.1776704, 0.1507069, 0.06666667, 0, 1, 1,
0.3944081, -0.4953904, 2.296778, 0.07450981, 0, 1, 1,
0.3948413, -0.287407, 1.721098, 0.07843138, 0, 1, 1,
0.3969702, 1.121832, 0.2486134, 0.08627451, 0, 1, 1,
0.3995987, 0.9152355, -0.6664476, 0.09019608, 0, 1, 1,
0.4007795, -1.270275, 2.941016, 0.09803922, 0, 1, 1,
0.411476, -1.431853, 3.665552, 0.1058824, 0, 1, 1,
0.4115984, 1.424281, 0.1109428, 0.1098039, 0, 1, 1,
0.4164402, -2.173658, 2.696021, 0.1176471, 0, 1, 1,
0.4172921, 0.02479655, 1.019639, 0.1215686, 0, 1, 1,
0.4226114, 1.034937, 0.854277, 0.1294118, 0, 1, 1,
0.4250335, 0.5246935, 2.318192, 0.1333333, 0, 1, 1,
0.4306014, 0.9021581, 0.7203224, 0.1411765, 0, 1, 1,
0.4307694, 0.4141609, 0.03663015, 0.145098, 0, 1, 1,
0.4334431, 0.08454268, 0.4511842, 0.1529412, 0, 1, 1,
0.4410407, -1.26258, 3.230776, 0.1568628, 0, 1, 1,
0.4430175, -0.8284517, 3.350716, 0.1647059, 0, 1, 1,
0.4432165, 0.2609589, 0.07571859, 0.1686275, 0, 1, 1,
0.4442191, 0.9449019, -0.8818701, 0.1764706, 0, 1, 1,
0.4516252, -0.2614367, 1.791541, 0.1803922, 0, 1, 1,
0.4548163, -0.3972125, 3.833681, 0.1882353, 0, 1, 1,
0.4561699, 0.2999655, 2.189179, 0.1921569, 0, 1, 1,
0.4629782, -0.4605092, 0.9704099, 0.2, 0, 1, 1,
0.4660382, 0.3148683, 0.6178128, 0.2078431, 0, 1, 1,
0.4661237, -2.007539, 4.350926, 0.2117647, 0, 1, 1,
0.473507, -0.5634449, 2.382643, 0.2196078, 0, 1, 1,
0.4804766, -0.3930486, 2.018889, 0.2235294, 0, 1, 1,
0.4828608, -0.4244683, 1.460935, 0.2313726, 0, 1, 1,
0.4864305, -0.8819153, 3.251161, 0.2352941, 0, 1, 1,
0.4865825, -0.2944629, 1.118555, 0.2431373, 0, 1, 1,
0.4889599, 1.384716, 1.962646, 0.2470588, 0, 1, 1,
0.4895566, 0.7055635, 1.093577, 0.254902, 0, 1, 1,
0.4910249, -0.4606274, 3.080391, 0.2588235, 0, 1, 1,
0.4951946, 1.702369, -0.08382061, 0.2666667, 0, 1, 1,
0.4955683, 0.8139966, 0.3685232, 0.2705882, 0, 1, 1,
0.5054194, -0.3034507, 1.597769, 0.2784314, 0, 1, 1,
0.5069363, -0.2325401, 2.552192, 0.282353, 0, 1, 1,
0.51361, 1.567494, 2.118593, 0.2901961, 0, 1, 1,
0.5237785, -1.350717, 4.359926, 0.2941177, 0, 1, 1,
0.5252919, -0.06885318, 0.9939899, 0.3019608, 0, 1, 1,
0.5257306, 0.4156763, -0.8037864, 0.3098039, 0, 1, 1,
0.5258688, 1.119419, 3.419308, 0.3137255, 0, 1, 1,
0.5273635, 0.712024, 1.73793, 0.3215686, 0, 1, 1,
0.5279823, -1.78886, 1.849311, 0.3254902, 0, 1, 1,
0.5328168, -0.9806347, 1.776368, 0.3333333, 0, 1, 1,
0.533308, -0.1953254, 4.092951, 0.3372549, 0, 1, 1,
0.5342525, -0.0214572, 1.839928, 0.345098, 0, 1, 1,
0.5401033, 1.129375, 0.1757155, 0.3490196, 0, 1, 1,
0.5539421, -0.279735, 1.370361, 0.3568628, 0, 1, 1,
0.5557285, -0.6194257, 1.768998, 0.3607843, 0, 1, 1,
0.5637236, 0.9556584, 0.245996, 0.3686275, 0, 1, 1,
0.5670281, 0.4283465, 0.3713503, 0.372549, 0, 1, 1,
0.567958, -0.6922158, 2.163715, 0.3803922, 0, 1, 1,
0.5725051, 0.475562, -0.1101435, 0.3843137, 0, 1, 1,
0.5885078, -0.2645544, 0.9961603, 0.3921569, 0, 1, 1,
0.5902699, -1.89062, 1.585561, 0.3960784, 0, 1, 1,
0.5922004, 0.03829863, -0.8113052, 0.4039216, 0, 1, 1,
0.599023, -0.6578, 1.580204, 0.4117647, 0, 1, 1,
0.5992043, -0.5299445, 2.978713, 0.4156863, 0, 1, 1,
0.5998294, 0.918769, -1.001789, 0.4235294, 0, 1, 1,
0.6000178, -0.2028973, 3.136434, 0.427451, 0, 1, 1,
0.6049376, -0.8589022, 5.081499, 0.4352941, 0, 1, 1,
0.6089758, -0.1660311, 2.345533, 0.4392157, 0, 1, 1,
0.6108721, -1.359312, 3.671488, 0.4470588, 0, 1, 1,
0.6149719, 0.1054504, 1.685741, 0.4509804, 0, 1, 1,
0.617236, -0.6537573, 1.514503, 0.4588235, 0, 1, 1,
0.620822, 0.4130043, 1.012971, 0.4627451, 0, 1, 1,
0.6211384, -0.3200475, 3.267083, 0.4705882, 0, 1, 1,
0.6219497, 2.053164, 1.361231, 0.4745098, 0, 1, 1,
0.6228617, 0.1891124, 2.261177, 0.4823529, 0, 1, 1,
0.6230704, 2.514798, -1.899987, 0.4862745, 0, 1, 1,
0.6263196, -1.096678, 5.194978, 0.4941176, 0, 1, 1,
0.6274327, -0.6337063, 0.7725056, 0.5019608, 0, 1, 1,
0.6299934, 0.2943926, 1.005693, 0.5058824, 0, 1, 1,
0.6370679, -0.09206034, 3.139108, 0.5137255, 0, 1, 1,
0.6426126, 0.3298925, 1.104562, 0.5176471, 0, 1, 1,
0.6450937, 1.579394, 1.192983, 0.5254902, 0, 1, 1,
0.6508125, 0.02981586, 1.392322, 0.5294118, 0, 1, 1,
0.6536189, 0.1588754, 1.841284, 0.5372549, 0, 1, 1,
0.6567214, -0.3590446, 0.8611923, 0.5411765, 0, 1, 1,
0.6637238, 0.02116415, 0.9539225, 0.5490196, 0, 1, 1,
0.6685446, -1.153007, 3.426032, 0.5529412, 0, 1, 1,
0.669366, -0.6803613, 1.925851, 0.5607843, 0, 1, 1,
0.6734701, 0.5889699, 1.137268, 0.5647059, 0, 1, 1,
0.6794664, 0.7503594, 1.066008, 0.572549, 0, 1, 1,
0.6853423, 2.377693, 1.185224, 0.5764706, 0, 1, 1,
0.6957648, 0.676817, 0.2593537, 0.5843138, 0, 1, 1,
0.7005075, 0.5365741, 0.8733111, 0.5882353, 0, 1, 1,
0.7009804, 2.449461, 1.607914, 0.5960785, 0, 1, 1,
0.7020934, -0.3169997, 0.4484702, 0.6039216, 0, 1, 1,
0.7024388, 0.1819605, 0.7639758, 0.6078432, 0, 1, 1,
0.7037328, 1.323555, -0.4906667, 0.6156863, 0, 1, 1,
0.7070154, 0.5493826, 0.3950616, 0.6196079, 0, 1, 1,
0.7131053, -0.297474, 2.499487, 0.627451, 0, 1, 1,
0.7233036, -0.6225404, 3.161328, 0.6313726, 0, 1, 1,
0.7290328, 1.736433, -0.02456329, 0.6392157, 0, 1, 1,
0.7363532, -1.344315, 3.112287, 0.6431373, 0, 1, 1,
0.7380168, -0.2372066, 1.3234, 0.6509804, 0, 1, 1,
0.7398086, 1.417025, 1.765104, 0.654902, 0, 1, 1,
0.7404799, 0.5132047, 0.07824264, 0.6627451, 0, 1, 1,
0.7427727, -0.4703878, 2.085971, 0.6666667, 0, 1, 1,
0.7513981, 1.572222, 0.8651659, 0.6745098, 0, 1, 1,
0.7542969, 0.8477957, 1.489592, 0.6784314, 0, 1, 1,
0.7591733, -0.6146763, 3.59263, 0.6862745, 0, 1, 1,
0.7611254, 0.9578569, 0.6020457, 0.6901961, 0, 1, 1,
0.7628195, 0.659377, 0.7233796, 0.6980392, 0, 1, 1,
0.7656691, 1.365835, 0.442553, 0.7058824, 0, 1, 1,
0.7707592, -1.386585, 4.018996, 0.7098039, 0, 1, 1,
0.7727205, -0.5989999, 3.144986, 0.7176471, 0, 1, 1,
0.7762056, -1.733686, 1.419758, 0.7215686, 0, 1, 1,
0.7778076, -0.04947698, 1.670699, 0.7294118, 0, 1, 1,
0.784933, -0.4503164, 1.25093, 0.7333333, 0, 1, 1,
0.7861359, -0.4285358, 1.268595, 0.7411765, 0, 1, 1,
0.7877293, 1.830265, 0.3208389, 0.7450981, 0, 1, 1,
0.7886047, 1.109644, 1.133631, 0.7529412, 0, 1, 1,
0.7947112, 0.7218043, 2.089061, 0.7568628, 0, 1, 1,
0.7993857, -0.4771731, 2.293231, 0.7647059, 0, 1, 1,
0.7997611, -0.5960431, 1.72948, 0.7686275, 0, 1, 1,
0.8093911, 0.3286447, 1.882609, 0.7764706, 0, 1, 1,
0.8098575, 0.4499522, -0.09988195, 0.7803922, 0, 1, 1,
0.8109388, -0.06013206, 0.9461628, 0.7882353, 0, 1, 1,
0.8144628, -0.09688678, 0.9218359, 0.7921569, 0, 1, 1,
0.8156223, 0.8147831, 0.05932735, 0.8, 0, 1, 1,
0.8232926, 0.1841837, 1.64267, 0.8078431, 0, 1, 1,
0.8239276, 2.226286, 0.6156718, 0.8117647, 0, 1, 1,
0.8276414, -1.230209, 4.300302, 0.8196079, 0, 1, 1,
0.8287454, -0.5507551, 0.8224436, 0.8235294, 0, 1, 1,
0.8342347, -0.07761633, 0.8585066, 0.8313726, 0, 1, 1,
0.8361272, 0.3616713, 1.258782, 0.8352941, 0, 1, 1,
0.8383228, 0.6949368, 0.01838379, 0.8431373, 0, 1, 1,
0.8392178, 0.06715135, 0.510775, 0.8470588, 0, 1, 1,
0.8402917, 0.9848875, 1.092863, 0.854902, 0, 1, 1,
0.8550329, 0.3739198, 1.181341, 0.8588235, 0, 1, 1,
0.8664232, -1.618044, 2.961311, 0.8666667, 0, 1, 1,
0.8676089, -0.08284778, 1.117594, 0.8705882, 0, 1, 1,
0.8707089, 0.5470457, 2.320071, 0.8784314, 0, 1, 1,
0.8713313, 0.2204389, 1.385936, 0.8823529, 0, 1, 1,
0.8748709, 0.4118563, 0.8091415, 0.8901961, 0, 1, 1,
0.8762571, -0.4191104, 3.238067, 0.8941177, 0, 1, 1,
0.876998, 0.338904, 2.115378, 0.9019608, 0, 1, 1,
0.8818142, 0.8813502, 1.640974, 0.9098039, 0, 1, 1,
0.8830906, 0.4959411, 1.825734, 0.9137255, 0, 1, 1,
0.8861158, 0.7595109, 2.05587, 0.9215686, 0, 1, 1,
0.8862208, -0.820658, 1.389385, 0.9254902, 0, 1, 1,
0.8886969, -0.1267548, 2.02113, 0.9333333, 0, 1, 1,
0.8943042, -0.1357078, 2.692806, 0.9372549, 0, 1, 1,
0.8964219, 1.054991, 0.6238723, 0.945098, 0, 1, 1,
0.8971426, 1.141076, 0.4381147, 0.9490196, 0, 1, 1,
0.9086248, -0.8045788, 2.964687, 0.9568627, 0, 1, 1,
0.9104632, 1.350911, -0.2179475, 0.9607843, 0, 1, 1,
0.9217387, -0.114311, 2.033381, 0.9686275, 0, 1, 1,
0.9255551, -0.8063994, 1.469676, 0.972549, 0, 1, 1,
0.9310801, 2.236866, 1.719798, 0.9803922, 0, 1, 1,
0.9340324, 1.137349, 0.5114004, 0.9843137, 0, 1, 1,
0.9352451, -0.03552998, 0.1273661, 0.9921569, 0, 1, 1,
0.9366164, 0.4495398, 1.294637, 0.9960784, 0, 1, 1,
0.9377847, 0.4212038, 1.165825, 1, 0, 0.9960784, 1,
0.942215, -1.599725, 2.826694, 1, 0, 0.9882353, 1,
0.9452949, -1.245485, 2.992281, 1, 0, 0.9843137, 1,
0.9525443, 0.2072653, 0.5687603, 1, 0, 0.9764706, 1,
0.9562845, 0.9925336, 1.290561, 1, 0, 0.972549, 1,
0.9584774, 1.784531, 1.97481, 1, 0, 0.9647059, 1,
0.9618666, -1.201862, 2.908438, 1, 0, 0.9607843, 1,
0.9663956, -0.1641523, 0.667971, 1, 0, 0.9529412, 1,
0.9699566, -0.4105275, 0.906619, 1, 0, 0.9490196, 1,
0.9702705, 0.1343143, 1.041101, 1, 0, 0.9411765, 1,
0.970955, -0.6452947, 2.860558, 1, 0, 0.9372549, 1,
0.9755754, 0.4853165, 0.8044569, 1, 0, 0.9294118, 1,
0.9766931, -0.2762321, 2.023654, 1, 0, 0.9254902, 1,
0.9798633, -1.030947, 2.882257, 1, 0, 0.9176471, 1,
0.9843153, -0.636941, 1.062729, 1, 0, 0.9137255, 1,
0.9854367, 1.015175, 1.467189, 1, 0, 0.9058824, 1,
0.9865053, 0.05578579, 0.8359609, 1, 0, 0.9019608, 1,
0.9908127, -0.6698875, 3.12926, 1, 0, 0.8941177, 1,
0.9968063, 0.9093947, 1.894918, 1, 0, 0.8862745, 1,
1.006572, 1.613886, 0.6896074, 1, 0, 0.8823529, 1,
1.009622, -1.026854, 0.9990648, 1, 0, 0.8745098, 1,
1.012195, -1.762045, 3.931198, 1, 0, 0.8705882, 1,
1.019973, 0.6108974, 0.2330197, 1, 0, 0.8627451, 1,
1.022279, 0.3415416, 3.130349, 1, 0, 0.8588235, 1,
1.026201, -1.599073, 1.728374, 1, 0, 0.8509804, 1,
1.044823, 1.330062, 0.6054586, 1, 0, 0.8470588, 1,
1.045012, -0.147, 0.9141234, 1, 0, 0.8392157, 1,
1.048737, 1.325037, 0.7523961, 1, 0, 0.8352941, 1,
1.054515, -2.126458, 4.004, 1, 0, 0.827451, 1,
1.059321, 0.5201585, 1.490169, 1, 0, 0.8235294, 1,
1.066769, 0.192388, 2.545502, 1, 0, 0.8156863, 1,
1.068417, -1.0232, 1.702926, 1, 0, 0.8117647, 1,
1.071739, 0.7921317, 0.6009681, 1, 0, 0.8039216, 1,
1.073916, -0.6691511, 3.224198, 1, 0, 0.7960784, 1,
1.075506, -1.232407, 3.048028, 1, 0, 0.7921569, 1,
1.085515, 1.112801, 1.28582, 1, 0, 0.7843137, 1,
1.089149, -0.7806944, 1.63346, 1, 0, 0.7803922, 1,
1.091074, 0.8052101, 0.9602259, 1, 0, 0.772549, 1,
1.091527, -0.8567641, 1.922213, 1, 0, 0.7686275, 1,
1.091622, 0.1782285, 0.05401264, 1, 0, 0.7607843, 1,
1.091819, -0.6333007, 1.94381, 1, 0, 0.7568628, 1,
1.094263, -0.483464, 2.054429, 1, 0, 0.7490196, 1,
1.095053, 0.5579548, 2.760874, 1, 0, 0.7450981, 1,
1.111648, -0.5782831, 1.173441, 1, 0, 0.7372549, 1,
1.119782, 0.01938601, 0.381204, 1, 0, 0.7333333, 1,
1.124601, 0.7467117, 3.060692, 1, 0, 0.7254902, 1,
1.130472, 0.9415382, 1.213348, 1, 0, 0.7215686, 1,
1.135522, 0.6093274, 0.1958367, 1, 0, 0.7137255, 1,
1.138095, -0.3063883, 0.9595467, 1, 0, 0.7098039, 1,
1.151008, 0.8360068, 2.357274, 1, 0, 0.7019608, 1,
1.15758, -0.09315394, 3.518887, 1, 0, 0.6941177, 1,
1.166483, -1.640957, 1.432989, 1, 0, 0.6901961, 1,
1.17101, -0.5383849, 3.39499, 1, 0, 0.682353, 1,
1.173109, 1.884511, 0.9981797, 1, 0, 0.6784314, 1,
1.174646, -0.7343594, 2.192274, 1, 0, 0.6705883, 1,
1.175862, 0.2398319, 0.8218688, 1, 0, 0.6666667, 1,
1.184355, 0.2089691, 1.081375, 1, 0, 0.6588235, 1,
1.18896, -0.2681206, 1.604988, 1, 0, 0.654902, 1,
1.193648, -0.9088491, 2.79774, 1, 0, 0.6470588, 1,
1.204359, -0.09884727, 1.015833, 1, 0, 0.6431373, 1,
1.205528, -0.5325113, -0.02755092, 1, 0, 0.6352941, 1,
1.208683, -0.1674177, 3.114501, 1, 0, 0.6313726, 1,
1.212717, 0.8997033, 1.677215, 1, 0, 0.6235294, 1,
1.23328, -0.7322775, 0.7316257, 1, 0, 0.6196079, 1,
1.235059, -0.4715582, 1.296794, 1, 0, 0.6117647, 1,
1.238355, -0.164209, 1.370237, 1, 0, 0.6078432, 1,
1.238465, 0.01626508, 1.968843, 1, 0, 0.6, 1,
1.249533, -1.258042, 2.994295, 1, 0, 0.5921569, 1,
1.252064, -0.230915, 2.873214, 1, 0, 0.5882353, 1,
1.254286, 0.02009502, 2.258403, 1, 0, 0.5803922, 1,
1.256663, -1.951948, 2.769364, 1, 0, 0.5764706, 1,
1.259087, 0.4053099, 1.02995, 1, 0, 0.5686275, 1,
1.266355, 0.5157644, 0.8686259, 1, 0, 0.5647059, 1,
1.268464, -0.9451157, 2.913097, 1, 0, 0.5568628, 1,
1.275142, -0.7417843, 0.5527107, 1, 0, 0.5529412, 1,
1.279611, 0.587531, 0.533491, 1, 0, 0.5450981, 1,
1.285172, 1.384171, 2.79033, 1, 0, 0.5411765, 1,
1.292532, 2.170526, 0.7550332, 1, 0, 0.5333334, 1,
1.316335, -0.8635522, 2.490015, 1, 0, 0.5294118, 1,
1.321401, -0.8049094, 2.662748, 1, 0, 0.5215687, 1,
1.334165, -0.9787593, 2.533497, 1, 0, 0.5176471, 1,
1.347372, 0.7763364, 2.116701, 1, 0, 0.509804, 1,
1.34746, -0.4117833, 3.370463, 1, 0, 0.5058824, 1,
1.355139, 0.9565156, -1.831092, 1, 0, 0.4980392, 1,
1.362704, 0.1671584, 0.399805, 1, 0, 0.4901961, 1,
1.373824, 0.9900431, 1.700504, 1, 0, 0.4862745, 1,
1.388478, -0.02163923, 1.870397, 1, 0, 0.4784314, 1,
1.388632, -0.6645769, 2.18463, 1, 0, 0.4745098, 1,
1.406983, -0.1094799, 1.861012, 1, 0, 0.4666667, 1,
1.412019, 0.3412232, 0.7342492, 1, 0, 0.4627451, 1,
1.412355, 1.859165, 0.3951817, 1, 0, 0.454902, 1,
1.41943, 1.006458, 0.04333874, 1, 0, 0.4509804, 1,
1.438806, -1.363247, 2.46422, 1, 0, 0.4431373, 1,
1.442808, 0.2626728, 1.575844, 1, 0, 0.4392157, 1,
1.443125, -0.324941, 1.881177, 1, 0, 0.4313726, 1,
1.455215, 0.1287342, 0.9667312, 1, 0, 0.427451, 1,
1.456303, -1.290464, 2.221887, 1, 0, 0.4196078, 1,
1.461655, -1.10542, 1.878165, 1, 0, 0.4156863, 1,
1.463285, 0.3375615, -0.07962323, 1, 0, 0.4078431, 1,
1.466644, -0.2637075, 1.959617, 1, 0, 0.4039216, 1,
1.481604, -0.3070153, 3.096903, 1, 0, 0.3960784, 1,
1.488234, -0.1293015, 2.216942, 1, 0, 0.3882353, 1,
1.511017, -1.366469, 1.966588, 1, 0, 0.3843137, 1,
1.515823, -0.5045941, 0.7573718, 1, 0, 0.3764706, 1,
1.524066, -0.4704703, 0.1173412, 1, 0, 0.372549, 1,
1.536241, -0.4678964, 1.348462, 1, 0, 0.3647059, 1,
1.540241, -0.9945291, 3.354187, 1, 0, 0.3607843, 1,
1.558563, -0.05577913, 1.366899, 1, 0, 0.3529412, 1,
1.580629, 0.6375887, 1.742572, 1, 0, 0.3490196, 1,
1.596255, -1.350278, 0.5479957, 1, 0, 0.3411765, 1,
1.614905, 0.2030618, 1.236378, 1, 0, 0.3372549, 1,
1.623046, -0.8696429, 1.2053, 1, 0, 0.3294118, 1,
1.626857, 0.8106452, -0.6991242, 1, 0, 0.3254902, 1,
1.63034, -0.8472205, 2.117953, 1, 0, 0.3176471, 1,
1.63435, 0.04483605, 2.580956, 1, 0, 0.3137255, 1,
1.640001, -0.07280493, 0.223805, 1, 0, 0.3058824, 1,
1.642143, 0.2910518, 1.110931, 1, 0, 0.2980392, 1,
1.674054, -0.7331495, 2.023586, 1, 0, 0.2941177, 1,
1.701513, 0.2761149, -0.3284087, 1, 0, 0.2862745, 1,
1.71639, 0.03255354, 0.8645583, 1, 0, 0.282353, 1,
1.717527, -1.976452, 0.3559479, 1, 0, 0.2745098, 1,
1.722327, -0.005481223, 1.473279, 1, 0, 0.2705882, 1,
1.728345, -0.5528011, 1.649879, 1, 0, 0.2627451, 1,
1.735656, -1.773182, 1.728559, 1, 0, 0.2588235, 1,
1.73777, 0.6258103, 1.213854, 1, 0, 0.2509804, 1,
1.743064, 0.6565512, 1.173588, 1, 0, 0.2470588, 1,
1.748479, -0.2334176, 2.304784, 1, 0, 0.2392157, 1,
1.76096, 1.305944, 0.9616598, 1, 0, 0.2352941, 1,
1.785008, 0.8101015, 1.0903, 1, 0, 0.227451, 1,
1.802036, 0.4009005, 1.247874, 1, 0, 0.2235294, 1,
1.808157, 1.165898, -0.9635972, 1, 0, 0.2156863, 1,
1.813157, 0.4287831, 0.9900736, 1, 0, 0.2117647, 1,
1.814412, 0.318115, -0.1888313, 1, 0, 0.2039216, 1,
1.82907, 2.314475, 0.6451316, 1, 0, 0.1960784, 1,
1.83165, -1.035403, 3.336164, 1, 0, 0.1921569, 1,
1.84477, -0.3656988, 0.4853308, 1, 0, 0.1843137, 1,
1.882563, -1.258736, 1.183024, 1, 0, 0.1803922, 1,
1.914028, 0.6965884, 1.762521, 1, 0, 0.172549, 1,
1.917963, -1.853653, 3.990016, 1, 0, 0.1686275, 1,
1.922037, -0.3030378, 1.094984, 1, 0, 0.1607843, 1,
1.932503, -0.243265, 1.617153, 1, 0, 0.1568628, 1,
1.974086, 0.3347476, 1.774389, 1, 0, 0.1490196, 1,
1.977212, 1.407454, 1.151551, 1, 0, 0.145098, 1,
1.990161, 0.8149468, 1.45741, 1, 0, 0.1372549, 1,
1.992479, 1.722371, 0.427191, 1, 0, 0.1333333, 1,
2.002137, -1.017325, 2.75351, 1, 0, 0.1254902, 1,
2.008815, 0.07723367, 0.8252028, 1, 0, 0.1215686, 1,
2.014544, -0.1579397, 2.396316, 1, 0, 0.1137255, 1,
2.04564, -0.369613, 3.256836, 1, 0, 0.1098039, 1,
2.077582, -0.9757878, 2.280541, 1, 0, 0.1019608, 1,
2.117871, -0.7128296, 2.536705, 1, 0, 0.09411765, 1,
2.134156, -0.1421214, 1.185485, 1, 0, 0.09019608, 1,
2.137534, -2.009496, 0.6947868, 1, 0, 0.08235294, 1,
2.153301, -0.3255643, -1.046924, 1, 0, 0.07843138, 1,
2.216307, 2.453232, 0.05171677, 1, 0, 0.07058824, 1,
2.233328, 1.30813, 0.3758278, 1, 0, 0.06666667, 1,
2.257608, -0.3728183, 0.2084316, 1, 0, 0.05882353, 1,
2.367613, -0.2847641, 0.8107673, 1, 0, 0.05490196, 1,
2.390535, -0.2949922, 1.254094, 1, 0, 0.04705882, 1,
2.401503, 0.4532288, -0.771736, 1, 0, 0.04313726, 1,
2.610379, 0.2156231, -1.069587, 1, 0, 0.03529412, 1,
2.622617, -1.002633, 2.121405, 1, 0, 0.03137255, 1,
2.68538, 0.3305954, 2.551285, 1, 0, 0.02352941, 1,
2.855451, 0.1342775, 1.558491, 1, 0, 0.01960784, 1,
2.929842, -1.093652, 3.060753, 1, 0, 0.01176471, 1,
2.961252, -1.652877, 1.898908, 1, 0, 0.007843138, 1
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
-0.003036857, -3.210271, -7.482456, 0, -0.5, 0.5, 0.5,
-0.003036857, -3.210271, -7.482456, 1, -0.5, 0.5, 0.5,
-0.003036857, -3.210271, -7.482456, 1, 1.5, 0.5, 0.5,
-0.003036857, -3.210271, -7.482456, 0, 1.5, 0.5, 0.5
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
-3.972219, 0.2347003, -7.482456, 0, -0.5, 0.5, 0.5,
-3.972219, 0.2347003, -7.482456, 1, -0.5, 0.5, 0.5,
-3.972219, 0.2347003, -7.482456, 1, 1.5, 0.5, 0.5,
-3.972219, 0.2347003, -7.482456, 0, 1.5, 0.5, 0.5
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
-3.972219, -3.210271, -0.225045, 0, -0.5, 0.5, 0.5,
-3.972219, -3.210271, -0.225045, 1, -0.5, 0.5, 0.5,
-3.972219, -3.210271, -0.225045, 1, 1.5, 0.5, 0.5,
-3.972219, -3.210271, -0.225045, 0, 1.5, 0.5, 0.5
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
-2, -2.415277, -5.807669,
2, -2.415277, -5.807669,
-2, -2.415277, -5.807669,
-2, -2.547776, -6.0868,
-1, -2.415277, -5.807669,
-1, -2.547776, -6.0868,
0, -2.415277, -5.807669,
0, -2.547776, -6.0868,
1, -2.415277, -5.807669,
1, -2.547776, -6.0868,
2, -2.415277, -5.807669,
2, -2.547776, -6.0868
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
-2, -2.812774, -6.645062, 0, -0.5, 0.5, 0.5,
-2, -2.812774, -6.645062, 1, -0.5, 0.5, 0.5,
-2, -2.812774, -6.645062, 1, 1.5, 0.5, 0.5,
-2, -2.812774, -6.645062, 0, 1.5, 0.5, 0.5,
-1, -2.812774, -6.645062, 0, -0.5, 0.5, 0.5,
-1, -2.812774, -6.645062, 1, -0.5, 0.5, 0.5,
-1, -2.812774, -6.645062, 1, 1.5, 0.5, 0.5,
-1, -2.812774, -6.645062, 0, 1.5, 0.5, 0.5,
0, -2.812774, -6.645062, 0, -0.5, 0.5, 0.5,
0, -2.812774, -6.645062, 1, -0.5, 0.5, 0.5,
0, -2.812774, -6.645062, 1, 1.5, 0.5, 0.5,
0, -2.812774, -6.645062, 0, 1.5, 0.5, 0.5,
1, -2.812774, -6.645062, 0, -0.5, 0.5, 0.5,
1, -2.812774, -6.645062, 1, -0.5, 0.5, 0.5,
1, -2.812774, -6.645062, 1, 1.5, 0.5, 0.5,
1, -2.812774, -6.645062, 0, 1.5, 0.5, 0.5,
2, -2.812774, -6.645062, 0, -0.5, 0.5, 0.5,
2, -2.812774, -6.645062, 1, -0.5, 0.5, 0.5,
2, -2.812774, -6.645062, 1, 1.5, 0.5, 0.5,
2, -2.812774, -6.645062, 0, 1.5, 0.5, 0.5
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
-3.056254, -2, -5.807669,
-3.056254, 2, -5.807669,
-3.056254, -2, -5.807669,
-3.208915, -2, -6.0868,
-3.056254, -1, -5.807669,
-3.208915, -1, -6.0868,
-3.056254, 0, -5.807669,
-3.208915, 0, -6.0868,
-3.056254, 1, -5.807669,
-3.208915, 1, -6.0868,
-3.056254, 2, -5.807669,
-3.208915, 2, -6.0868
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
-3.514237, -2, -6.645062, 0, -0.5, 0.5, 0.5,
-3.514237, -2, -6.645062, 1, -0.5, 0.5, 0.5,
-3.514237, -2, -6.645062, 1, 1.5, 0.5, 0.5,
-3.514237, -2, -6.645062, 0, 1.5, 0.5, 0.5,
-3.514237, -1, -6.645062, 0, -0.5, 0.5, 0.5,
-3.514237, -1, -6.645062, 1, -0.5, 0.5, 0.5,
-3.514237, -1, -6.645062, 1, 1.5, 0.5, 0.5,
-3.514237, -1, -6.645062, 0, 1.5, 0.5, 0.5,
-3.514237, 0, -6.645062, 0, -0.5, 0.5, 0.5,
-3.514237, 0, -6.645062, 1, -0.5, 0.5, 0.5,
-3.514237, 0, -6.645062, 1, 1.5, 0.5, 0.5,
-3.514237, 0, -6.645062, 0, 1.5, 0.5, 0.5,
-3.514237, 1, -6.645062, 0, -0.5, 0.5, 0.5,
-3.514237, 1, -6.645062, 1, -0.5, 0.5, 0.5,
-3.514237, 1, -6.645062, 1, 1.5, 0.5, 0.5,
-3.514237, 1, -6.645062, 0, 1.5, 0.5, 0.5,
-3.514237, 2, -6.645062, 0, -0.5, 0.5, 0.5,
-3.514237, 2, -6.645062, 1, -0.5, 0.5, 0.5,
-3.514237, 2, -6.645062, 1, 1.5, 0.5, 0.5,
-3.514237, 2, -6.645062, 0, 1.5, 0.5, 0.5
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
-3.056254, -2.415277, -4,
-3.056254, -2.415277, 4,
-3.056254, -2.415277, -4,
-3.208915, -2.547776, -4,
-3.056254, -2.415277, -2,
-3.208915, -2.547776, -2,
-3.056254, -2.415277, 0,
-3.208915, -2.547776, 0,
-3.056254, -2.415277, 2,
-3.208915, -2.547776, 2,
-3.056254, -2.415277, 4,
-3.208915, -2.547776, 4
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
-3.514237, -2.812774, -4, 0, -0.5, 0.5, 0.5,
-3.514237, -2.812774, -4, 1, -0.5, 0.5, 0.5,
-3.514237, -2.812774, -4, 1, 1.5, 0.5, 0.5,
-3.514237, -2.812774, -4, 0, 1.5, 0.5, 0.5,
-3.514237, -2.812774, -2, 0, -0.5, 0.5, 0.5,
-3.514237, -2.812774, -2, 1, -0.5, 0.5, 0.5,
-3.514237, -2.812774, -2, 1, 1.5, 0.5, 0.5,
-3.514237, -2.812774, -2, 0, 1.5, 0.5, 0.5,
-3.514237, -2.812774, 0, 0, -0.5, 0.5, 0.5,
-3.514237, -2.812774, 0, 1, -0.5, 0.5, 0.5,
-3.514237, -2.812774, 0, 1, 1.5, 0.5, 0.5,
-3.514237, -2.812774, 0, 0, 1.5, 0.5, 0.5,
-3.514237, -2.812774, 2, 0, -0.5, 0.5, 0.5,
-3.514237, -2.812774, 2, 1, -0.5, 0.5, 0.5,
-3.514237, -2.812774, 2, 1, 1.5, 0.5, 0.5,
-3.514237, -2.812774, 2, 0, 1.5, 0.5, 0.5,
-3.514237, -2.812774, 4, 0, -0.5, 0.5, 0.5,
-3.514237, -2.812774, 4, 1, -0.5, 0.5, 0.5,
-3.514237, -2.812774, 4, 1, 1.5, 0.5, 0.5,
-3.514237, -2.812774, 4, 0, 1.5, 0.5, 0.5
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
-3.056254, -2.415277, -5.807669,
-3.056254, 2.884678, -5.807669,
-3.056254, -2.415277, 5.357579,
-3.056254, 2.884678, 5.357579,
-3.056254, -2.415277, -5.807669,
-3.056254, -2.415277, 5.357579,
-3.056254, 2.884678, -5.807669,
-3.056254, 2.884678, 5.357579,
-3.056254, -2.415277, -5.807669,
3.05018, -2.415277, -5.807669,
-3.056254, -2.415277, 5.357579,
3.05018, -2.415277, 5.357579,
-3.056254, 2.884678, -5.807669,
3.05018, 2.884678, -5.807669,
-3.056254, 2.884678, 5.357579,
3.05018, 2.884678, 5.357579,
3.05018, -2.415277, -5.807669,
3.05018, 2.884678, -5.807669,
3.05018, -2.415277, 5.357579,
3.05018, 2.884678, 5.357579,
3.05018, -2.415277, -5.807669,
3.05018, -2.415277, 5.357579,
3.05018, 2.884678, -5.807669,
3.05018, 2.884678, 5.357579
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
var radius = 7.361205;
var distance = 32.75084;
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
mvMatrix.translate( 0.003036857, -0.2347003, 0.225045 );
mvMatrix.scale( 1.303392, 1.501726, 0.712844 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.75084);
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
m-phenoxybenzyl_alco<-read.table("m-phenoxybenzyl_alco.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-m-phenoxybenzyl_alco$V2
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
```

```r
y<-m-phenoxybenzyl_alco$V3
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
```

```r
z<-m-phenoxybenzyl_alco$V4
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
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
-2.967325, 1.508677, -0.1039534, 0, 0, 1, 1, 1,
-2.862627, 0.04811222, -1.349763, 1, 0, 0, 1, 1,
-2.834601, 1.081996, -0.9430661, 1, 0, 0, 1, 1,
-2.603034, -1.372958, -0.9741776, 1, 0, 0, 1, 1,
-2.495158, -0.02458045, -0.1137863, 1, 0, 0, 1, 1,
-2.448625, -0.643468, -1.846373, 1, 0, 0, 1, 1,
-2.360514, -1.087832, -1.791203, 0, 0, 0, 1, 1,
-2.345806, -0.2036139, -2.050536, 0, 0, 0, 1, 1,
-2.335468, -1.007521, -3.369589, 0, 0, 0, 1, 1,
-2.313016, 0.5357665, -2.193151, 0, 0, 0, 1, 1,
-2.31197, -1.203452, -1.58353, 0, 0, 0, 1, 1,
-2.165506, 0.6205941, -2.196176, 0, 0, 0, 1, 1,
-2.143029, 0.1500478, -0.6065215, 0, 0, 0, 1, 1,
-2.142586, 0.6442835, -0.9393629, 1, 1, 1, 1, 1,
-2.13267, 0.2523061, -0.8753932, 1, 1, 1, 1, 1,
-2.130547, 0.9938222, -0.9912667, 1, 1, 1, 1, 1,
-2.104193, 0.7691905, -0.7698731, 1, 1, 1, 1, 1,
-2.095851, -0.4173667, -3.001604, 1, 1, 1, 1, 1,
-2.095371, -1.034982, -2.418334, 1, 1, 1, 1, 1,
-2.08951, 1.709233, -1.665803, 1, 1, 1, 1, 1,
-2.088837, 0.04145374, -1.28852, 1, 1, 1, 1, 1,
-2.088753, 0.1558802, -0.4276601, 1, 1, 1, 1, 1,
-2.080755, 1.532759, -0.5154222, 1, 1, 1, 1, 1,
-2.06838, -0.2504557, -1.752772, 1, 1, 1, 1, 1,
-2.039834, -1.569321, -2.085168, 1, 1, 1, 1, 1,
-2.021202, 0.09236456, -1.060775, 1, 1, 1, 1, 1,
-2.021009, -0.1876812, -1.2499, 1, 1, 1, 1, 1,
-2.013867, -0.6036937, -2.490707, 1, 1, 1, 1, 1,
-2.009893, -0.5765062, -2.444816, 0, 0, 1, 1, 1,
-1.972781, -0.7009284, -1.937989, 1, 0, 0, 1, 1,
-1.966019, 0.6955873, -1.87491, 1, 0, 0, 1, 1,
-1.940583, -0.5199572, -1.048463, 1, 0, 0, 1, 1,
-1.917317, -0.5653163, -2.154552, 1, 0, 0, 1, 1,
-1.916678, 1.139488, 0.7468129, 1, 0, 0, 1, 1,
-1.88989, 0.3035133, -0.8247809, 0, 0, 0, 1, 1,
-1.880504, 1.496747, -0.4154242, 0, 0, 0, 1, 1,
-1.861155, -0.3361984, -1.680439, 0, 0, 0, 1, 1,
-1.823982, -0.1425582, -2.038963, 0, 0, 0, 1, 1,
-1.8108, -0.1187368, -1.204363, 0, 0, 0, 1, 1,
-1.802256, 0.2693413, -1.507554, 0, 0, 0, 1, 1,
-1.788168, -1.496171, -2.291947, 0, 0, 0, 1, 1,
-1.774397, 0.5768311, -2.667429, 1, 1, 1, 1, 1,
-1.774329, -0.3012678, -0.7504041, 1, 1, 1, 1, 1,
-1.769737, -0.5993044, -0.7374597, 1, 1, 1, 1, 1,
-1.761503, -0.05771998, -0.9342591, 1, 1, 1, 1, 1,
-1.754483, 1.374766, -2.152807, 1, 1, 1, 1, 1,
-1.747517, 0.2984023, -1.661911, 1, 1, 1, 1, 1,
-1.738096, -0.467546, -2.932909, 1, 1, 1, 1, 1,
-1.728016, 0.7364575, -0.8923851, 1, 1, 1, 1, 1,
-1.709159, 0.7597508, -1.885626, 1, 1, 1, 1, 1,
-1.700165, 1.476077, -0.5848929, 1, 1, 1, 1, 1,
-1.670731, -0.7409123, -1.637263, 1, 1, 1, 1, 1,
-1.670072, 0.3681999, -1.872535, 1, 1, 1, 1, 1,
-1.664074, -0.8664641, -0.4197088, 1, 1, 1, 1, 1,
-1.658045, 1.241781, 0.4449512, 1, 1, 1, 1, 1,
-1.65627, -1.665302, -0.7424974, 1, 1, 1, 1, 1,
-1.634872, 0.8720976, -2.406543, 0, 0, 1, 1, 1,
-1.625419, -0.02983526, -3.560857, 1, 0, 0, 1, 1,
-1.625015, -0.9030126, -1.792627, 1, 0, 0, 1, 1,
-1.615414, -1.712275, -2.843174, 1, 0, 0, 1, 1,
-1.614182, 1.116692, -1.269525, 1, 0, 0, 1, 1,
-1.59999, -1.257298, -2.033152, 1, 0, 0, 1, 1,
-1.591132, 0.6879439, -1.26319, 0, 0, 0, 1, 1,
-1.585584, 0.9766592, -2.677313, 0, 0, 0, 1, 1,
-1.582414, 1.653637, -1.889936, 0, 0, 0, 1, 1,
-1.577876, -0.6881709, -1.62693, 0, 0, 0, 1, 1,
-1.567844, -1.559592, -1.306983, 0, 0, 0, 1, 1,
-1.563326, 0.8828038, 1.101657, 0, 0, 0, 1, 1,
-1.560583, 1.603927, -1.129589, 0, 0, 0, 1, 1,
-1.557663, -0.835772, -2.09494, 1, 1, 1, 1, 1,
-1.556889, -0.8622053, -1.928679, 1, 1, 1, 1, 1,
-1.534816, 0.515444, -2.232445, 1, 1, 1, 1, 1,
-1.528768, -0.8606254, -1.310318, 1, 1, 1, 1, 1,
-1.525496, 0.8080214, 0.6058852, 1, 1, 1, 1, 1,
-1.512187, -0.8179212, -2.280073, 1, 1, 1, 1, 1,
-1.509176, 1.40886, -0.618062, 1, 1, 1, 1, 1,
-1.501004, 0.182239, -1.367376, 1, 1, 1, 1, 1,
-1.488438, -0.4898417, -2.337966, 1, 1, 1, 1, 1,
-1.486609, 0.5817174, 0.0435268, 1, 1, 1, 1, 1,
-1.461382, -0.6902457, -1.685749, 1, 1, 1, 1, 1,
-1.455982, -0.2933342, -2.408996, 1, 1, 1, 1, 1,
-1.44794, -0.3700183, -1.504587, 1, 1, 1, 1, 1,
-1.440618, -1.010438, -3.205668, 1, 1, 1, 1, 1,
-1.43451, -1.371309, -2.40671, 1, 1, 1, 1, 1,
-1.424636, 0.1965633, -1.330596, 0, 0, 1, 1, 1,
-1.424248, -1.217432, -3.175979, 1, 0, 0, 1, 1,
-1.423954, -0.9444408, -2.985021, 1, 0, 0, 1, 1,
-1.391966, -1.253453, -0.9515324, 1, 0, 0, 1, 1,
-1.389345, 0.1998735, -2.803667, 1, 0, 0, 1, 1,
-1.387851, -1.358035, -2.601459, 1, 0, 0, 1, 1,
-1.386924, -0.1158604, -2.610892, 0, 0, 0, 1, 1,
-1.383785, 0.5767982, -1.601573, 0, 0, 0, 1, 1,
-1.382919, -1.343771, -1.518034, 0, 0, 0, 1, 1,
-1.36025, -0.06978621, -0.2987594, 0, 0, 0, 1, 1,
-1.35507, -0.1638728, -1.120153, 0, 0, 0, 1, 1,
-1.349696, 0.4770462, -2.541236, 0, 0, 0, 1, 1,
-1.348705, 2.165245, 0.1630412, 0, 0, 0, 1, 1,
-1.339586, 1.242529, -0.2963913, 1, 1, 1, 1, 1,
-1.327217, 1.86898, -0.04646164, 1, 1, 1, 1, 1,
-1.3176, -1.008887, -1.423405, 1, 1, 1, 1, 1,
-1.31701, 0.02851709, -0.5233397, 1, 1, 1, 1, 1,
-1.312252, -0.3751542, -0.3761491, 1, 1, 1, 1, 1,
-1.306712, -1.161745, -2.940716, 1, 1, 1, 1, 1,
-1.306084, 1.490533, -0.01080974, 1, 1, 1, 1, 1,
-1.301931, 0.01958988, -0.6654994, 1, 1, 1, 1, 1,
-1.300889, -0.5287703, -1.370604, 1, 1, 1, 1, 1,
-1.281864, 1.101369, -1.208827, 1, 1, 1, 1, 1,
-1.267357, -1.156475, -0.6179683, 1, 1, 1, 1, 1,
-1.257961, -1.976484, -2.918468, 1, 1, 1, 1, 1,
-1.249368, -0.2709104, -1.344936, 1, 1, 1, 1, 1,
-1.232423, -0.2238019, -1.111451, 1, 1, 1, 1, 1,
-1.231921, 0.09312377, -0.05722972, 1, 1, 1, 1, 1,
-1.226507, 0.9219513, -2.308793, 0, 0, 1, 1, 1,
-1.208899, 0.5567535, -0.05104273, 1, 0, 0, 1, 1,
-1.208539, 0.002139155, -1.257514, 1, 0, 0, 1, 1,
-1.204863, 0.7047246, -0.5159247, 1, 0, 0, 1, 1,
-1.196131, -0.8419658, -2.964794, 1, 0, 0, 1, 1,
-1.182361, -0.5797717, -1.991338, 1, 0, 0, 1, 1,
-1.18045, -1.639727, -2.831157, 0, 0, 0, 1, 1,
-1.177717, 1.343796, 0.1105324, 0, 0, 0, 1, 1,
-1.177261, 0.03523476, -1.817784, 0, 0, 0, 1, 1,
-1.17621, -0.1025721, -2.231457, 0, 0, 0, 1, 1,
-1.167248, 0.8378398, -0.8261639, 0, 0, 0, 1, 1,
-1.165872, -2.010442, -3.374632, 0, 0, 0, 1, 1,
-1.163441, 1.843888, -0.4005364, 0, 0, 0, 1, 1,
-1.160841, -0.136463, -2.450483, 1, 1, 1, 1, 1,
-1.159604, -0.9524996, -2.838106, 1, 1, 1, 1, 1,
-1.150949, -0.7752082, -1.171208, 1, 1, 1, 1, 1,
-1.143502, -0.756989, -2.67521, 1, 1, 1, 1, 1,
-1.13943, -0.8032368, -2.516357, 1, 1, 1, 1, 1,
-1.13935, 0.7728863, -1.711108, 1, 1, 1, 1, 1,
-1.139127, 0.04559759, -1.706921, 1, 1, 1, 1, 1,
-1.138834, 0.4826397, -3.328368, 1, 1, 1, 1, 1,
-1.137751, -0.3487624, -2.07631, 1, 1, 1, 1, 1,
-1.137481, 1.915449, 1.386751, 1, 1, 1, 1, 1,
-1.126693, -0.2818617, -1.963946, 1, 1, 1, 1, 1,
-1.123899, -0.1315609, -1.30516, 1, 1, 1, 1, 1,
-1.122532, 0.6106498, -0.5866213, 1, 1, 1, 1, 1,
-1.121269, 1.285258, -0.1640978, 1, 1, 1, 1, 1,
-1.121245, -1.155084, -4.328609, 1, 1, 1, 1, 1,
-1.118181, 0.8411517, -0.9845804, 0, 0, 1, 1, 1,
-1.114357, -0.4120856, -1.433759, 1, 0, 0, 1, 1,
-1.113533, -0.6616638, -3.625732, 1, 0, 0, 1, 1,
-1.108996, -1.085154, -4.078214, 1, 0, 0, 1, 1,
-1.105369, 0.1504412, -2.870436, 1, 0, 0, 1, 1,
-1.095316, 0.53395, -2.159635, 1, 0, 0, 1, 1,
-1.093335, -0.009748874, -1.928512, 0, 0, 0, 1, 1,
-1.090922, 1.043468, -0.7962921, 0, 0, 0, 1, 1,
-1.087011, -0.6338717, -2.993646, 0, 0, 0, 1, 1,
-1.08598, 0.0954386, -1.618085, 0, 0, 0, 1, 1,
-1.083066, -0.3444586, -3.230503, 0, 0, 0, 1, 1,
-1.081756, 1.828868, -1.694869, 0, 0, 0, 1, 1,
-1.07851, -1.294538, -1.290972, 0, 0, 0, 1, 1,
-1.074137, -0.1327074, -0.6249423, 1, 1, 1, 1, 1,
-1.072592, -0.3869412, -3.1377, 1, 1, 1, 1, 1,
-1.070753, -1.102909, -1.249014, 1, 1, 1, 1, 1,
-1.067768, 1.801261, 0.4762267, 1, 1, 1, 1, 1,
-1.066364, -1.792504, -2.2402, 1, 1, 1, 1, 1,
-1.062351, -1.913152, -2.794661, 1, 1, 1, 1, 1,
-1.054613, -1.852486, -4.274179, 1, 1, 1, 1, 1,
-1.047429, -0.9013302, -3.107489, 1, 1, 1, 1, 1,
-1.047419, -0.2793453, 0.2426775, 1, 1, 1, 1, 1,
-1.040291, -0.5793617, -3.003132, 1, 1, 1, 1, 1,
-1.039726, 0.1671962, -1.735151, 1, 1, 1, 1, 1,
-1.026827, -0.1828846, -1.210705, 1, 1, 1, 1, 1,
-1.02402, 0.8090983, -0.1666275, 1, 1, 1, 1, 1,
-1.023467, -1.185842, -3.02911, 1, 1, 1, 1, 1,
-1.018966, -0.755527, -1.972402, 1, 1, 1, 1, 1,
-0.9960009, 2.659858, -0.6835481, 0, 0, 1, 1, 1,
-0.9915662, -0.8968902, -2.169268, 1, 0, 0, 1, 1,
-0.9910362, -0.3362086, -1.891541, 1, 0, 0, 1, 1,
-0.9864289, -0.5154606, -3.344072, 1, 0, 0, 1, 1,
-0.9857584, -0.6618046, -2.410945, 1, 0, 0, 1, 1,
-0.9850677, -0.1029996, -1.111762, 1, 0, 0, 1, 1,
-0.9803297, 0.3497588, -1.582297, 0, 0, 0, 1, 1,
-0.9738175, 1.675498, -2.544106, 0, 0, 0, 1, 1,
-0.9722502, -1.07065, -4.721637, 0, 0, 0, 1, 1,
-0.9695056, -0.4183247, -0.3816377, 0, 0, 0, 1, 1,
-0.9570327, 0.2866632, -0.4517283, 0, 0, 0, 1, 1,
-0.9560394, -0.596569, -2.956104, 0, 0, 0, 1, 1,
-0.9531805, -0.02725901, -0.6971272, 0, 0, 0, 1, 1,
-0.9529233, 0.8969575, -2.39468, 1, 1, 1, 1, 1,
-0.9435984, -0.9825138, -1.350452, 1, 1, 1, 1, 1,
-0.9363586, 1.017909, -1.408459, 1, 1, 1, 1, 1,
-0.9177153, -0.2506763, -1.459303, 1, 1, 1, 1, 1,
-0.9137815, 1.109911, 0.2246217, 1, 1, 1, 1, 1,
-0.9080291, 0.1322812, -0.4460918, 1, 1, 1, 1, 1,
-0.906207, -0.4394248, -1.554468, 1, 1, 1, 1, 1,
-0.8976046, -0.5414189, -1.950418, 1, 1, 1, 1, 1,
-0.8973024, 0.09219933, -0.2492527, 1, 1, 1, 1, 1,
-0.8925336, 1.526935, -0.409977, 1, 1, 1, 1, 1,
-0.8858333, 0.6369678, -1.549032, 1, 1, 1, 1, 1,
-0.8856953, -0.1044252, -2.720826, 1, 1, 1, 1, 1,
-0.8819521, 1.21272, -0.09802078, 1, 1, 1, 1, 1,
-0.880869, -0.8973143, -1.847355, 1, 1, 1, 1, 1,
-0.8725297, 0.4610553, -1.64392, 1, 1, 1, 1, 1,
-0.8680783, 0.1150553, -1.587663, 0, 0, 1, 1, 1,
-0.8670642, 1.177925, 1.5066, 1, 0, 0, 1, 1,
-0.8656442, -0.6457343, -3.642898, 1, 0, 0, 1, 1,
-0.8605441, 0.7477049, -0.05357649, 1, 0, 0, 1, 1,
-0.8547809, -0.6179202, -3.356985, 1, 0, 0, 1, 1,
-0.8528172, 1.219271, -1.059096, 1, 0, 0, 1, 1,
-0.851495, 0.09276652, -1.244152, 0, 0, 0, 1, 1,
-0.8510496, 0.6899338, -0.2035658, 0, 0, 0, 1, 1,
-0.8486598, 0.3182429, -1.203396, 0, 0, 0, 1, 1,
-0.8457762, -0.3612708, -1.66988, 0, 0, 0, 1, 1,
-0.8420522, -0.6415404, -1.149175, 0, 0, 0, 1, 1,
-0.8358353, -0.6727905, -0.53523, 0, 0, 0, 1, 1,
-0.8286473, -0.7550803, -2.37848, 0, 0, 0, 1, 1,
-0.8285414, 0.6104029, -0.6165119, 1, 1, 1, 1, 1,
-0.8283054, -2.055367, -2.843206, 1, 1, 1, 1, 1,
-0.8239061, 0.4241065, -0.6204027, 1, 1, 1, 1, 1,
-0.8234099, 0.9044459, -0.8492938, 1, 1, 1, 1, 1,
-0.8168638, -0.2141027, -3.304204, 1, 1, 1, 1, 1,
-0.8148412, 0.3463654, -1.483705, 1, 1, 1, 1, 1,
-0.8109322, 0.7104694, -1.530107, 1, 1, 1, 1, 1,
-0.8047608, 0.182362, -0.4357398, 1, 1, 1, 1, 1,
-0.8040761, -1.477221, -2.439183, 1, 1, 1, 1, 1,
-0.7976031, -1.438348, -3.529086, 1, 1, 1, 1, 1,
-0.7947991, -0.3788049, -1.803013, 1, 1, 1, 1, 1,
-0.7930208, -0.7594826, -2.929671, 1, 1, 1, 1, 1,
-0.7825524, -0.3539486, -2.207919, 1, 1, 1, 1, 1,
-0.7732561, -0.1153684, -2.256652, 1, 1, 1, 1, 1,
-0.7721752, 0.5920966, -1.97175, 1, 1, 1, 1, 1,
-0.7721119, 1.229292, -0.7610002, 0, 0, 1, 1, 1,
-0.7707006, -1.214056, -1.15055, 1, 0, 0, 1, 1,
-0.7703877, 0.0959205, -0.6179219, 1, 0, 0, 1, 1,
-0.765587, -0.1528131, -0.2799158, 1, 0, 0, 1, 1,
-0.7576151, -1.193165, -2.687438, 1, 0, 0, 1, 1,
-0.7525227, -2.230216, -2.65349, 1, 0, 0, 1, 1,
-0.7475495, -0.2074319, -2.665026, 0, 0, 0, 1, 1,
-0.7396793, -0.852962, -3.283602, 0, 0, 0, 1, 1,
-0.7373747, 1.430691, -0.3703589, 0, 0, 0, 1, 1,
-0.7361957, 1.463565, -0.07879062, 0, 0, 0, 1, 1,
-0.7323719, -0.3139966, -2.721094, 0, 0, 0, 1, 1,
-0.7256221, 1.652952, -0.5368886, 0, 0, 0, 1, 1,
-0.7239479, -0.9905666, -0.1682056, 0, 0, 0, 1, 1,
-0.7177917, 0.2197485, -2.309365, 1, 1, 1, 1, 1,
-0.7174054, -0.2033752, -2.367806, 1, 1, 1, 1, 1,
-0.7169667, 0.5790192, -0.2209455, 1, 1, 1, 1, 1,
-0.7166947, 0.08946626, -3.724165, 1, 1, 1, 1, 1,
-0.7136558, -0.5846886, -2.541488, 1, 1, 1, 1, 1,
-0.7088495, 0.216417, -2.516281, 1, 1, 1, 1, 1,
-0.7085258, 0.1628326, -2.182323, 1, 1, 1, 1, 1,
-0.7077138, -0.6145902, -1.042914, 1, 1, 1, 1, 1,
-0.7025014, -1.327923, -0.764165, 1, 1, 1, 1, 1,
-0.7023932, -0.9521008, -2.304046, 1, 1, 1, 1, 1,
-0.7002111, -0.8746226, -2.485205, 1, 1, 1, 1, 1,
-0.6917098, 0.96908, -1.558531, 1, 1, 1, 1, 1,
-0.6911151, 1.494391, -1.281606, 1, 1, 1, 1, 1,
-0.6902602, -0.838273, -2.761904, 1, 1, 1, 1, 1,
-0.6838896, 1.260431, -0.4724514, 1, 1, 1, 1, 1,
-0.6832099, -0.0368367, -0.8167592, 0, 0, 1, 1, 1,
-0.6775495, 0.6257383, -0.1187812, 1, 0, 0, 1, 1,
-0.6757029, -0.518854, -2.277578, 1, 0, 0, 1, 1,
-0.6704884, -0.1401089, -0.738143, 1, 0, 0, 1, 1,
-0.6657425, 0.4500753, -1.140725, 1, 0, 0, 1, 1,
-0.6636216, -0.01758625, -2.384339, 1, 0, 0, 1, 1,
-0.6627869, 1.321538, 1.455448, 0, 0, 0, 1, 1,
-0.6541811, -1.818235, -2.604523, 0, 0, 0, 1, 1,
-0.6531817, -1.974222, -2.652935, 0, 0, 0, 1, 1,
-0.649608, 0.7542752, -1.001043, 0, 0, 0, 1, 1,
-0.6464996, 1.188008, -0.602661, 0, 0, 0, 1, 1,
-0.6447974, -1.322303, -2.101478, 0, 0, 0, 1, 1,
-0.64401, 0.4742255, -2.866725, 0, 0, 0, 1, 1,
-0.6404836, -0.1189483, 0.02953647, 1, 1, 1, 1, 1,
-0.6395156, -1.681687, -3.380856, 1, 1, 1, 1, 1,
-0.636597, -1.870216, -2.399585, 1, 1, 1, 1, 1,
-0.6316028, -0.5459041, -2.548319, 1, 1, 1, 1, 1,
-0.6304832, -0.3547807, -2.018542, 1, 1, 1, 1, 1,
-0.6241881, 0.352251, -1.253695, 1, 1, 1, 1, 1,
-0.6236383, -1.372017, -2.460958, 1, 1, 1, 1, 1,
-0.6168272, 1.344813, -1.781466, 1, 1, 1, 1, 1,
-0.6144947, 0.3918902, -1.525079, 1, 1, 1, 1, 1,
-0.6104643, -0.2255154, -1.068157, 1, 1, 1, 1, 1,
-0.6094443, -1.055704, -2.956243, 1, 1, 1, 1, 1,
-0.6071227, -0.6424301, -2.967466, 1, 1, 1, 1, 1,
-0.6035016, -0.8917609, -3.388854, 1, 1, 1, 1, 1,
-0.6012993, -1.638797, -3.089416, 1, 1, 1, 1, 1,
-0.6008811, 0.2398006, -2.57847, 1, 1, 1, 1, 1,
-0.5960763, -0.595099, -1.966787, 0, 0, 1, 1, 1,
-0.5900803, 1.846613, -1.779201, 1, 0, 0, 1, 1,
-0.5862398, -1.038196, -2.8125, 1, 0, 0, 1, 1,
-0.5841637, 1.342595, 0.06056144, 1, 0, 0, 1, 1,
-0.5840512, -0.5769721, -2.536998, 1, 0, 0, 1, 1,
-0.5816703, 0.5575422, -0.8188224, 1, 0, 0, 1, 1,
-0.5812222, 0.1617584, -3.086594, 0, 0, 0, 1, 1,
-0.5753255, 0.793646, -0.6055921, 0, 0, 0, 1, 1,
-0.5700148, -1.260457, -4.077741, 0, 0, 0, 1, 1,
-0.5652499, -0.4909053, -3.166927, 0, 0, 0, 1, 1,
-0.5636206, -0.7981493, -2.809726, 0, 0, 0, 1, 1,
-0.5612028, -0.3788715, -0.5901964, 0, 0, 0, 1, 1,
-0.5596808, -1.322987, -3.958305, 0, 0, 0, 1, 1,
-0.5555157, 0.7261809, 0.2380175, 1, 1, 1, 1, 1,
-0.5526869, -0.5804409, -2.33137, 1, 1, 1, 1, 1,
-0.5523089, -0.08888082, -4.114489, 1, 1, 1, 1, 1,
-0.5508834, 0.9408307, -0.5496224, 1, 1, 1, 1, 1,
-0.5501985, -0.1537925, -2.828325, 1, 1, 1, 1, 1,
-0.5489066, 0.140459, -0.6520287, 1, 1, 1, 1, 1,
-0.5464882, 1.811545, 0.6811321, 1, 1, 1, 1, 1,
-0.5406909, -0.5534688, -3.44014, 1, 1, 1, 1, 1,
-0.5364808, -0.08687912, -0.9134182, 1, 1, 1, 1, 1,
-0.5313346, -1.256613, -3.402559, 1, 1, 1, 1, 1,
-0.5277109, -0.4133009, -2.696037, 1, 1, 1, 1, 1,
-0.5267209, 1.071274, -1.193758, 1, 1, 1, 1, 1,
-0.5264639, 0.9989992, -1.536491, 1, 1, 1, 1, 1,
-0.5136866, -0.7047744, -1.565743, 1, 1, 1, 1, 1,
-0.5129495, -1.837529, -1.92555, 1, 1, 1, 1, 1,
-0.5129004, 1.092205, 0.6532685, 0, 0, 1, 1, 1,
-0.5121797, 1.490467, -1.334125, 1, 0, 0, 1, 1,
-0.511198, -1.088644, -2.679896, 1, 0, 0, 1, 1,
-0.5082256, -0.2100655, -2.972024, 1, 0, 0, 1, 1,
-0.5081118, 1.381937, 0.04364488, 1, 0, 0, 1, 1,
-0.5075685, -0.9013757, -1.5781, 1, 0, 0, 1, 1,
-0.5040805, 2.409535, 0.7246926, 0, 0, 0, 1, 1,
-0.4998089, 0.01409213, -3.899875, 0, 0, 0, 1, 1,
-0.4979997, -0.2722867, -0.6710503, 0, 0, 0, 1, 1,
-0.4920132, -0.7312319, -2.183298, 0, 0, 0, 1, 1,
-0.4841385, 2.545822, 0.4170605, 0, 0, 0, 1, 1,
-0.4836619, 0.08235797, -1.611407, 0, 0, 0, 1, 1,
-0.4812762, -1.365719, -5.645068, 0, 0, 0, 1, 1,
-0.4802322, 0.5970621, -0.05930791, 1, 1, 1, 1, 1,
-0.4759771, 0.1291939, -1.078502, 1, 1, 1, 1, 1,
-0.4757705, 0.3831694, -1.53802, 1, 1, 1, 1, 1,
-0.4686078, 0.874061, -1.299553, 1, 1, 1, 1, 1,
-0.4621205, -2.338094, -2.772766, 1, 1, 1, 1, 1,
-0.4599242, -1.986513, -2.402904, 1, 1, 1, 1, 1,
-0.4594396, 1.093619, -1.660539, 1, 1, 1, 1, 1,
-0.4538294, -1.122916, -3.0094, 1, 1, 1, 1, 1,
-0.4521843, -0.9247233, -1.985245, 1, 1, 1, 1, 1,
-0.4516804, -0.9613525, -2.654811, 1, 1, 1, 1, 1,
-0.45054, 0.1627635, -1.371193, 1, 1, 1, 1, 1,
-0.4451789, -1.05422, -2.719455, 1, 1, 1, 1, 1,
-0.4431109, -0.7372926, -2.789681, 1, 1, 1, 1, 1,
-0.4408156, 1.557988, -0.02824838, 1, 1, 1, 1, 1,
-0.4334021, 1.795882, -0.4519815, 1, 1, 1, 1, 1,
-0.429781, -0.1035172, 0.1648991, 0, 0, 1, 1, 1,
-0.4293323, -0.8822616, -3.244143, 1, 0, 0, 1, 1,
-0.4285856, 1.729757, -1.869834, 1, 0, 0, 1, 1,
-0.4266882, -0.5206867, -3.2385, 1, 0, 0, 1, 1,
-0.4195241, -0.4859092, -3.610094, 1, 0, 0, 1, 1,
-0.419468, 0.06495304, -0.8638548, 1, 0, 0, 1, 1,
-0.419409, 1.341633, 0.06947497, 0, 0, 0, 1, 1,
-0.4157402, -0.1297727, -1.17654, 0, 0, 0, 1, 1,
-0.4140902, -2.054503, -2.880363, 0, 0, 0, 1, 1,
-0.4097137, -0.2415523, -4.432034, 0, 0, 0, 1, 1,
-0.3994941, -1.979336, -4.524349, 0, 0, 0, 1, 1,
-0.399269, 1.012885, 0.886434, 0, 0, 0, 1, 1,
-0.3989902, -0.08968781, -1.295627, 0, 0, 0, 1, 1,
-0.3989371, -0.3006714, -0.9039374, 1, 1, 1, 1, 1,
-0.3963024, 0.2830492, 0.1552811, 1, 1, 1, 1, 1,
-0.3936521, -0.7755799, -1.772996, 1, 1, 1, 1, 1,
-0.3924294, -1.202856, -4.895716, 1, 1, 1, 1, 1,
-0.3801463, -0.3914976, -2.510352, 1, 1, 1, 1, 1,
-0.3793574, -0.2572441, -1.613634, 1, 1, 1, 1, 1,
-0.3791798, 0.7649139, 0.4654901, 1, 1, 1, 1, 1,
-0.3647501, 1.415881, 0.9385456, 1, 1, 1, 1, 1,
-0.3647004, 0.353222, -1.938884, 1, 1, 1, 1, 1,
-0.3643926, 0.6067886, 0.1239073, 1, 1, 1, 1, 1,
-0.361445, 1.013212, -0.9561177, 1, 1, 1, 1, 1,
-0.3546287, 1.217226, -0.7601601, 1, 1, 1, 1, 1,
-0.3529716, -0.6747051, -2.076184, 1, 1, 1, 1, 1,
-0.3508165, 0.1038422, 0.1241283, 1, 1, 1, 1, 1,
-0.3506912, 1.447411, -0.5548628, 1, 1, 1, 1, 1,
-0.3495245, -0.9309766, -1.797664, 0, 0, 1, 1, 1,
-0.3436811, 0.2190903, -1.246858, 1, 0, 0, 1, 1,
-0.3347788, -0.2216138, -2.467235, 1, 0, 0, 1, 1,
-0.3322654, -1.548411, -3.087207, 1, 0, 0, 1, 1,
-0.329881, 0.6428843, -1.486828, 1, 0, 0, 1, 1,
-0.3294481, 0.1946111, 0.1474616, 1, 0, 0, 1, 1,
-0.3240219, -1.377152, -2.276802, 0, 0, 0, 1, 1,
-0.3224339, -0.07501642, -2.940145, 0, 0, 0, 1, 1,
-0.3174036, 0.5513856, 0.1177964, 0, 0, 0, 1, 1,
-0.3109259, 0.287462, -3.219435, 0, 0, 0, 1, 1,
-0.3040767, -0.7638484, -3.510032, 0, 0, 0, 1, 1,
-0.3033071, -0.1348356, -3.080586, 0, 0, 0, 1, 1,
-0.2993626, -0.6012313, -4.422383, 0, 0, 0, 1, 1,
-0.2968104, 0.6703798, -1.048396, 1, 1, 1, 1, 1,
-0.2960489, 2.167992, -1.586121, 1, 1, 1, 1, 1,
-0.2956021, -0.5942186, -1.359353, 1, 1, 1, 1, 1,
-0.2930554, -0.01366383, -0.3974512, 1, 1, 1, 1, 1,
-0.2883508, -0.3455596, -2.279804, 1, 1, 1, 1, 1,
-0.2853738, 0.3034528, 0.4702125, 1, 1, 1, 1, 1,
-0.282667, 1.145714, 1.303624, 1, 1, 1, 1, 1,
-0.2796272, 0.0811511, -2.739291, 1, 1, 1, 1, 1,
-0.2748336, -0.8519837, -1.736675, 1, 1, 1, 1, 1,
-0.2737513, 0.1452571, -0.05507052, 1, 1, 1, 1, 1,
-0.2685653, 0.9343166, -1.325978, 1, 1, 1, 1, 1,
-0.2681974, -0.5575016, -1.878192, 1, 1, 1, 1, 1,
-0.2655667, 0.1483683, -2.805031, 1, 1, 1, 1, 1,
-0.2649826, 0.05423974, -2.83193, 1, 1, 1, 1, 1,
-0.264468, -0.2654509, -1.824163, 1, 1, 1, 1, 1,
-0.2643909, -0.2487, -1.107545, 0, 0, 1, 1, 1,
-0.2629054, 0.1186294, -2.439178, 1, 0, 0, 1, 1,
-0.2628126, 0.540356, -1.101413, 1, 0, 0, 1, 1,
-0.26249, 0.3672135, 0.9127473, 1, 0, 0, 1, 1,
-0.2618861, 1.947338, -1.168044, 1, 0, 0, 1, 1,
-0.2618296, -0.6116309, -2.933422, 1, 0, 0, 1, 1,
-0.2612844, 0.6842219, -0.632055, 0, 0, 0, 1, 1,
-0.2601836, 0.1535468, -2.830604, 0, 0, 0, 1, 1,
-0.2597833, 1.296555, 1.232208, 0, 0, 0, 1, 1,
-0.252169, -0.008201104, 0.06796571, 0, 0, 0, 1, 1,
-0.2414306, -0.8081043, -1.837303, 0, 0, 0, 1, 1,
-0.238108, -1.354827, -3.580643, 0, 0, 0, 1, 1,
-0.2352472, 0.9638424, 1.122151, 0, 0, 0, 1, 1,
-0.234722, 0.5133973, 0.7312801, 1, 1, 1, 1, 1,
-0.2344309, 1.575865, 1.104374, 1, 1, 1, 1, 1,
-0.2261273, -0.2601323, -2.989252, 1, 1, 1, 1, 1,
-0.2207425, -1.747509, -3.285123, 1, 1, 1, 1, 1,
-0.2202287, 0.5750877, -0.2607127, 1, 1, 1, 1, 1,
-0.2192768, -0.5298396, -2.130579, 1, 1, 1, 1, 1,
-0.2164616, -0.8117191, -4.562305, 1, 1, 1, 1, 1,
-0.2146163, 1.339693, -1.009723, 1, 1, 1, 1, 1,
-0.2143475, 1.286594, -1.918078, 1, 1, 1, 1, 1,
-0.2138881, -0.6513559, -2.461695, 1, 1, 1, 1, 1,
-0.2137994, -0.536801, -2.280666, 1, 1, 1, 1, 1,
-0.2081826, -0.2044055, -3.851385, 1, 1, 1, 1, 1,
-0.2060112, 1.102335, -0.5907919, 1, 1, 1, 1, 1,
-0.2037073, -0.8692557, -4.05286, 1, 1, 1, 1, 1,
-0.2029021, -0.9854031, -1.953247, 1, 1, 1, 1, 1,
-0.196998, -0.9159908, -3.581599, 0, 0, 1, 1, 1,
-0.1882719, -0.8865423, -2.645303, 1, 0, 0, 1, 1,
-0.1848514, 0.1520686, 0.184489, 1, 0, 0, 1, 1,
-0.1838473, -0.09650042, -2.254246, 1, 0, 0, 1, 1,
-0.18267, 0.3332298, -1.489345, 1, 0, 0, 1, 1,
-0.1802336, 0.105538, 0.3647128, 1, 0, 0, 1, 1,
-0.1799292, 0.4494599, -1.799824, 0, 0, 0, 1, 1,
-0.1782177, 0.8504692, -1.43723, 0, 0, 0, 1, 1,
-0.1753573, 1.308715, -0.08948161, 0, 0, 0, 1, 1,
-0.1749067, -1.247966, -1.817267, 0, 0, 0, 1, 1,
-0.1708716, 0.6335272, 1.183533, 0, 0, 0, 1, 1,
-0.1693519, -0.5659536, -3.15145, 0, 0, 0, 1, 1,
-0.1673311, 0.5469645, 0.4412881, 0, 0, 0, 1, 1,
-0.1672046, -1.255175, -2.248079, 1, 1, 1, 1, 1,
-0.1663156, -1.189737, -4.690907, 1, 1, 1, 1, 1,
-0.1591382, 0.8925539, -1.125057, 1, 1, 1, 1, 1,
-0.1553364, -0.1928638, -0.8918552, 1, 1, 1, 1, 1,
-0.1498499, 0.6558107, 0.9866134, 1, 1, 1, 1, 1,
-0.1434177, -0.1369577, -2.596128, 1, 1, 1, 1, 1,
-0.1410654, 0.5454602, 1.372898, 1, 1, 1, 1, 1,
-0.1404455, 1.358078, -0.5757607, 1, 1, 1, 1, 1,
-0.1401014, -1.355948, -1.892327, 1, 1, 1, 1, 1,
-0.1334182, 0.2214517, -1.081374, 1, 1, 1, 1, 1,
-0.1299675, -0.3131769, -4.459452, 1, 1, 1, 1, 1,
-0.1263529, -0.8074304, -0.7883036, 1, 1, 1, 1, 1,
-0.1252852, 0.5404441, -2.966934, 1, 1, 1, 1, 1,
-0.1250025, -0.4409718, -2.930148, 1, 1, 1, 1, 1,
-0.1249359, -2.176341, -4.848417, 1, 1, 1, 1, 1,
-0.1223629, -0.2004267, -3.01699, 0, 0, 1, 1, 1,
-0.1176872, -0.2090651, -3.518987, 1, 0, 0, 1, 1,
-0.1176585, 1.739387, -0.4104936, 1, 0, 0, 1, 1,
-0.1143628, 1.64424, -0.3451688, 1, 0, 0, 1, 1,
-0.1098794, -1.438774, -2.172744, 1, 0, 0, 1, 1,
-0.1084517, -0.1192284, -2.974247, 1, 0, 0, 1, 1,
-0.1073093, 0.2296424, 0.5647705, 0, 0, 0, 1, 1,
-0.1045678, 2.807494, -0.7532728, 0, 0, 0, 1, 1,
-0.1029013, 2.29116, -0.01679245, 0, 0, 0, 1, 1,
-0.1026746, 1.174085, 0.0994806, 0, 0, 0, 1, 1,
-0.09351073, -0.6679354, -1.760821, 0, 0, 0, 1, 1,
-0.09097517, -0.9701213, -3.168929, 0, 0, 0, 1, 1,
-0.08980557, 1.299715, -0.4039685, 0, 0, 0, 1, 1,
-0.08853991, -0.4706203, -1.954335, 1, 1, 1, 1, 1,
-0.08777328, 1.065417, -0.3433212, 1, 1, 1, 1, 1,
-0.08649391, -0.246765, -1.708845, 1, 1, 1, 1, 1,
-0.08424139, -1.813251, -1.552463, 1, 1, 1, 1, 1,
-0.07681683, -0.3494291, -3.670762, 1, 1, 1, 1, 1,
-0.073722, -0.5230837, -2.807377, 1, 1, 1, 1, 1,
-0.0721964, -0.7545646, -3.480066, 1, 1, 1, 1, 1,
-0.06855294, 0.8484449, 0.7912365, 1, 1, 1, 1, 1,
-0.06587773, 1.07451, -0.6178241, 1, 1, 1, 1, 1,
-0.06045632, 1.482698, -0.5906583, 1, 1, 1, 1, 1,
-0.06040931, 0.1155078, -1.439848, 1, 1, 1, 1, 1,
-0.05911408, -0.1803886, -4.347082, 1, 1, 1, 1, 1,
-0.05769588, 0.268975, -1.950074, 1, 1, 1, 1, 1,
-0.05474287, 0.002797941, -2.466531, 1, 1, 1, 1, 1,
-0.0512707, -0.7121608, -5.095335, 1, 1, 1, 1, 1,
-0.05042962, 0.3955941, 0.7513087, 0, 0, 1, 1, 1,
-0.05030225, -0.9642395, -2.374481, 1, 0, 0, 1, 1,
-0.04995134, -1.308243, -3.07379, 1, 0, 0, 1, 1,
-0.04968286, 0.280503, -0.4815925, 1, 0, 0, 1, 1,
-0.04397828, 1.082639, 0.05857212, 1, 0, 0, 1, 1,
-0.04258827, 0.5340713, -1.626954, 1, 0, 0, 1, 1,
-0.04250864, -0.04007607, -1.817863, 0, 0, 0, 1, 1,
-0.04170242, 0.09329176, 0.09768339, 0, 0, 0, 1, 1,
-0.03933597, -1.368639, -4.724082, 0, 0, 0, 1, 1,
-0.03780449, 0.691152, -0.9439892, 0, 0, 0, 1, 1,
-0.03559544, 1.212886, 0.1076262, 0, 0, 0, 1, 1,
-0.03355848, -0.9071049, -4.912229, 0, 0, 0, 1, 1,
-0.03141765, -0.673862, -3.026634, 0, 0, 0, 1, 1,
-0.02841175, 0.7610493, 0.8095449, 1, 1, 1, 1, 1,
-0.0276254, 0.4018438, -0.5642083, 1, 1, 1, 1, 1,
-0.02659836, 0.1786083, -1.555974, 1, 1, 1, 1, 1,
-0.02547499, 0.8192631, -0.4564931, 1, 1, 1, 1, 1,
-0.02264796, -1.148014, -3.266298, 1, 1, 1, 1, 1,
-0.02238352, 0.1103292, -1.833809, 1, 1, 1, 1, 1,
-0.02076979, -0.4236334, -2.973051, 1, 1, 1, 1, 1,
-0.0203356, -0.234069, -3.072965, 1, 1, 1, 1, 1,
-0.02006328, 0.4041817, -0.77222, 1, 1, 1, 1, 1,
-0.01884193, -0.5807617, -3.710324, 1, 1, 1, 1, 1,
-0.01749324, -0.1267402, -4.023744, 1, 1, 1, 1, 1,
-0.01746232, 1.941869, 0.04432977, 1, 1, 1, 1, 1,
-0.01708934, -1.026874, -2.327127, 1, 1, 1, 1, 1,
-0.01622388, 0.07945233, 0.4303221, 1, 1, 1, 1, 1,
-0.01509692, -0.5906518, -3.68391, 1, 1, 1, 1, 1,
-0.007329335, 0.1539699, -0.7704534, 0, 0, 1, 1, 1,
-0.006506589, 2.44478, 0.8697102, 1, 0, 0, 1, 1,
-0.003265197, -0.1144419, -3.570246, 1, 0, 0, 1, 1,
-0.001911266, 0.02942054, -0.4706253, 1, 0, 0, 1, 1,
-0.001473141, 0.9934971, -0.9675682, 1, 0, 0, 1, 1,
0.002031329, -1.217534, 4.52103, 1, 0, 0, 1, 1,
0.002703989, 0.3419697, -0.02791104, 0, 0, 0, 1, 1,
0.005963522, -0.7133869, 4.353503, 0, 0, 0, 1, 1,
0.005986759, -0.4694897, 3.806516, 0, 0, 0, 1, 1,
0.01231574, -0.01482816, 1.403784, 0, 0, 0, 1, 1,
0.01750006, 1.09951, 1.522642, 0, 0, 0, 1, 1,
0.01950104, 0.1827764, 0.1566144, 0, 0, 0, 1, 1,
0.02112555, -1.231665, 2.457562, 0, 0, 0, 1, 1,
0.02331946, -0.6034193, 3.332568, 1, 1, 1, 1, 1,
0.02421309, -0.283793, 2.52381, 1, 1, 1, 1, 1,
0.02612433, 1.099629, 2.0161, 1, 1, 1, 1, 1,
0.02637573, 0.03961491, 2.466838, 1, 1, 1, 1, 1,
0.02910629, -0.7383056, 2.941052, 1, 1, 1, 1, 1,
0.03110882, -1.093007, 3.838013, 1, 1, 1, 1, 1,
0.03550328, -0.3602667, 1.528823, 1, 1, 1, 1, 1,
0.03670885, -0.1236, 3.167982, 1, 1, 1, 1, 1,
0.03801541, -0.4473009, 4.100508, 1, 1, 1, 1, 1,
0.04017846, 0.3400741, 0.492491, 1, 1, 1, 1, 1,
0.04259949, -0.8646979, 3.605147, 1, 1, 1, 1, 1,
0.04571249, -0.3296415, 2.847182, 1, 1, 1, 1, 1,
0.04682042, -1.781228, 3.872841, 1, 1, 1, 1, 1,
0.04795479, -0.1643189, 4.214797, 1, 1, 1, 1, 1,
0.04880401, 0.4590797, 0.7216072, 1, 1, 1, 1, 1,
0.0521887, -0.2984526, 3.331948, 0, 0, 1, 1, 1,
0.05305093, -0.5647526, 4.485567, 1, 0, 0, 1, 1,
0.05377911, -0.746232, 2.473807, 1, 0, 0, 1, 1,
0.05480896, 0.1687086, 0.6281417, 1, 0, 0, 1, 1,
0.05529542, -0.454806, 4.000489, 1, 0, 0, 1, 1,
0.05767633, -0.200305, 2.686217, 1, 0, 0, 1, 1,
0.05932842, -0.9054892, 4.777122, 0, 0, 0, 1, 1,
0.06209389, -0.7124108, 2.602957, 0, 0, 0, 1, 1,
0.06627025, 1.498567, -0.2827509, 0, 0, 0, 1, 1,
0.06697474, -1.377567, 3.932389, 0, 0, 0, 1, 1,
0.06701332, -0.1144007, 2.366885, 0, 0, 0, 1, 1,
0.06773124, 0.3317865, -0.3404915, 0, 0, 0, 1, 1,
0.07222646, -1.381538, 4.060947, 0, 0, 0, 1, 1,
0.07581736, 1.450821, 1.161281, 1, 1, 1, 1, 1,
0.07645575, -0.300863, 4.783858, 1, 1, 1, 1, 1,
0.07646103, 0.8254958, 0.0418561, 1, 1, 1, 1, 1,
0.07724258, 0.8310823, -0.07493005, 1, 1, 1, 1, 1,
0.07957421, -1.544433, 2.541969, 1, 1, 1, 1, 1,
0.08112638, 1.047872, -1.221301, 1, 1, 1, 1, 1,
0.08956078, -2.132429, 2.662828, 1, 1, 1, 1, 1,
0.09775169, -1.565727, 3.826647, 1, 1, 1, 1, 1,
0.09784462, 0.3317844, 0.114104, 1, 1, 1, 1, 1,
0.0983421, -1.161758, 1.659017, 1, 1, 1, 1, 1,
0.1091267, 0.06433094, -0.2340983, 1, 1, 1, 1, 1,
0.109327, 0.4248935, -2.014857, 1, 1, 1, 1, 1,
0.1095316, 0.5774094, 0.7969635, 1, 1, 1, 1, 1,
0.1098731, 0.3546411, -0.2511267, 1, 1, 1, 1, 1,
0.1132711, -0.3354837, 1.651271, 1, 1, 1, 1, 1,
0.1133679, 1.583434, -0.806727, 0, 0, 1, 1, 1,
0.1158163, -0.469181, 2.421266, 1, 0, 0, 1, 1,
0.1204308, -0.4491333, 3.435009, 1, 0, 0, 1, 1,
0.1208525, 1.782668, -0.2323978, 1, 0, 0, 1, 1,
0.1296663, 1.366789, 0.6211396, 1, 0, 0, 1, 1,
0.1318547, -0.3868636, 2.286438, 1, 0, 0, 1, 1,
0.1329285, -0.4462071, 2.927781, 0, 0, 0, 1, 1,
0.1368058, -0.9865178, 3.790265, 0, 0, 0, 1, 1,
0.1376795, 1.539322, 1.420442, 0, 0, 0, 1, 1,
0.1386966, -0.4947469, 3.798474, 0, 0, 0, 1, 1,
0.1409623, 0.3086785, 1.657439, 0, 0, 0, 1, 1,
0.1410809, 0.3022406, 1.165518, 0, 0, 0, 1, 1,
0.1452934, -0.1765126, 2.878309, 0, 0, 0, 1, 1,
0.1466514, -0.6007613, 3.186394, 1, 1, 1, 1, 1,
0.1469738, -1.134516, 1.594033, 1, 1, 1, 1, 1,
0.1480989, 0.8430995, 0.02680909, 1, 1, 1, 1, 1,
0.1528178, 0.9215749, 0.8685936, 1, 1, 1, 1, 1,
0.1565761, -0.3864299, 2.20022, 1, 1, 1, 1, 1,
0.1569009, 0.8611373, 0.033742, 1, 1, 1, 1, 1,
0.1634721, -0.2011555, 3.374414, 1, 1, 1, 1, 1,
0.1637469, 0.7853199, 1.338949, 1, 1, 1, 1, 1,
0.1676454, -0.3995971, 1.827329, 1, 1, 1, 1, 1,
0.16899, -0.5150969, 3.715405, 1, 1, 1, 1, 1,
0.1718995, 0.7176566, 0.1709445, 1, 1, 1, 1, 1,
0.1738448, 0.7867787, -0.5127294, 1, 1, 1, 1, 1,
0.1742771, 0.3616208, 0.9048582, 1, 1, 1, 1, 1,
0.1796131, -0.2014381, 1.710843, 1, 1, 1, 1, 1,
0.1866585, 0.05664481, 1.839907, 1, 1, 1, 1, 1,
0.1875767, 0.3896588, 1.357652, 0, 0, 1, 1, 1,
0.1910982, -0.7432017, 4.856912, 1, 0, 0, 1, 1,
0.1937772, -1.143133, 2.904142, 1, 0, 0, 1, 1,
0.1940061, 1.493656, 0.9225194, 1, 0, 0, 1, 1,
0.195416, 2.140836, -0.4915456, 1, 0, 0, 1, 1,
0.1967795, -0.5054829, 2.438442, 1, 0, 0, 1, 1,
0.1988717, 1.777783, -0.7098781, 0, 0, 0, 1, 1,
0.1993902, -0.2410188, 4.182019, 0, 0, 0, 1, 1,
0.2064249, 0.821149, 0.615234, 0, 0, 0, 1, 1,
0.211338, -0.1058826, 0.587557, 0, 0, 0, 1, 1,
0.2121202, 0.6583728, -0.1930865, 0, 0, 0, 1, 1,
0.2151207, -1.817362, 2.705745, 0, 0, 0, 1, 1,
0.2168668, -0.4438636, 4.197067, 0, 0, 0, 1, 1,
0.219661, -1.067384, 2.981253, 1, 1, 1, 1, 1,
0.2214719, 0.281168, 0.5114351, 1, 1, 1, 1, 1,
0.2224783, 0.6026046, 0.4656597, 1, 1, 1, 1, 1,
0.226116, -0.3671924, 2.036752, 1, 1, 1, 1, 1,
0.230362, -0.9559209, 3.865709, 1, 1, 1, 1, 1,
0.2310287, 1.482238, 0.4418046, 1, 1, 1, 1, 1,
0.231988, 1.733994, 1.108283, 1, 1, 1, 1, 1,
0.2328244, -0.2714061, 2.994334, 1, 1, 1, 1, 1,
0.2363866, 0.5002228, 0.1080143, 1, 1, 1, 1, 1,
0.2389821, 2.077835, -0.6693641, 1, 1, 1, 1, 1,
0.2400837, -0.7828761, 1.770144, 1, 1, 1, 1, 1,
0.2408864, -0.9293166, 2.063839, 1, 1, 1, 1, 1,
0.2437905, -0.6539143, 2.751604, 1, 1, 1, 1, 1,
0.2439462, -1.25083, 2.852295, 1, 1, 1, 1, 1,
0.2445173, 1.105228, 0.2976409, 1, 1, 1, 1, 1,
0.246499, 1.070741, 0.02649275, 0, 0, 1, 1, 1,
0.2480312, 0.182425, 0.3426246, 1, 0, 0, 1, 1,
0.2488313, -1.323799, 3.546759, 1, 0, 0, 1, 1,
0.2499128, 1.001689, 0.1749611, 1, 0, 0, 1, 1,
0.249963, 0.09642086, 1.398509, 1, 0, 0, 1, 1,
0.2522794, -0.6701992, 2.309367, 1, 0, 0, 1, 1,
0.2542952, -1.028193, 2.619293, 0, 0, 0, 1, 1,
0.2557824, -0.02486461, 1.240285, 0, 0, 0, 1, 1,
0.2558188, -1.552357, 3.423107, 0, 0, 0, 1, 1,
0.2572443, 0.3666712, 0.03385792, 0, 0, 0, 1, 1,
0.2580599, -0.7077304, 1.47849, 0, 0, 0, 1, 1,
0.2595161, 0.7075007, -0.6839948, 0, 0, 0, 1, 1,
0.2595189, 1.612846, 1.580852, 0, 0, 0, 1, 1,
0.2626542, 1.987863, -0.4543113, 1, 1, 1, 1, 1,
0.2708755, 0.1028427, -1.166593, 1, 1, 1, 1, 1,
0.279323, -0.4059971, 2.062381, 1, 1, 1, 1, 1,
0.283749, 0.1078317, 3.296376, 1, 1, 1, 1, 1,
0.285343, 1.306745, -0.8247672, 1, 1, 1, 1, 1,
0.2860418, 1.017179, 1.013666, 1, 1, 1, 1, 1,
0.2895395, -1.841495, 3.358262, 1, 1, 1, 1, 1,
0.2903725, 0.2426589, 0.6764646, 1, 1, 1, 1, 1,
0.2912838, -0.8983214, 3.10955, 1, 1, 1, 1, 1,
0.2915998, -0.699263, 1.710066, 1, 1, 1, 1, 1,
0.2921178, 0.5689115, 0.6476049, 1, 1, 1, 1, 1,
0.292437, -0.1883833, 1.087203, 1, 1, 1, 1, 1,
0.2932211, -0.5314724, 3.646638, 1, 1, 1, 1, 1,
0.2943155, 0.8644111, 0.4454305, 1, 1, 1, 1, 1,
0.2969571, 0.8554914, 0.1057674, 1, 1, 1, 1, 1,
0.2976238, -0.07702362, 1.333619, 0, 0, 1, 1, 1,
0.2979721, 0.7702409, 1.584255, 1, 0, 0, 1, 1,
0.2982007, -0.230217, 2.55988, 1, 0, 0, 1, 1,
0.3021266, -1.945638, 4.783988, 1, 0, 0, 1, 1,
0.3069904, 1.48357, -0.5739629, 1, 0, 0, 1, 1,
0.3121198, 1.174093, -0.1618201, 1, 0, 0, 1, 1,
0.3121616, -0.5097857, 2.874321, 0, 0, 0, 1, 1,
0.3130893, -0.5767775, 2.284934, 0, 0, 0, 1, 1,
0.3140619, 0.4971716, 1.09172, 0, 0, 0, 1, 1,
0.3157067, 0.7430112, 1.070529, 0, 0, 0, 1, 1,
0.3164146, 0.1195248, 3.127963, 0, 0, 0, 1, 1,
0.3164702, 0.7399847, 0.991331, 0, 0, 0, 1, 1,
0.322383, -0.2731187, 2.8224, 0, 0, 0, 1, 1,
0.3326649, 0.9727029, 0.8386664, 1, 1, 1, 1, 1,
0.3341092, -1.539489, 4.157519, 1, 1, 1, 1, 1,
0.3381694, 0.3135499, -0.1063052, 1, 1, 1, 1, 1,
0.3425172, 0.4888268, 0.9042425, 1, 1, 1, 1, 1,
0.3428209, -1.727738, 3.310934, 1, 1, 1, 1, 1,
0.3446837, 0.4908702, 1.379365, 1, 1, 1, 1, 1,
0.3473915, 0.4837238, 0.83447, 1, 1, 1, 1, 1,
0.3586531, 0.48382, 1.429669, 1, 1, 1, 1, 1,
0.363871, -0.1220815, -0.3291849, 1, 1, 1, 1, 1,
0.3675267, -0.4425569, 2.708454, 1, 1, 1, 1, 1,
0.3682161, -0.08905432, 0.1311057, 1, 1, 1, 1, 1,
0.372817, 0.4320494, 1.551766, 1, 1, 1, 1, 1,
0.3755241, -1.525025, 1.290636, 1, 1, 1, 1, 1,
0.379818, -1.510529, 4.318882, 1, 1, 1, 1, 1,
0.3803391, 0.5904046, 2.512166, 1, 1, 1, 1, 1,
0.3811783, -1.141646, 2.427801, 0, 0, 1, 1, 1,
0.3816605, -0.03049866, 2.371498, 1, 0, 0, 1, 1,
0.3836921, 0.9046635, -0.03222444, 1, 0, 0, 1, 1,
0.3843671, -0.02965906, 1.308123, 1, 0, 0, 1, 1,
0.3858835, -1.423091, 5.040682, 1, 0, 0, 1, 1,
0.3899212, 0.5545307, 0.6254022, 1, 0, 0, 1, 1,
0.3936243, 0.1776704, 0.1507069, 0, 0, 0, 1, 1,
0.3944081, -0.4953904, 2.296778, 0, 0, 0, 1, 1,
0.3948413, -0.287407, 1.721098, 0, 0, 0, 1, 1,
0.3969702, 1.121832, 0.2486134, 0, 0, 0, 1, 1,
0.3995987, 0.9152355, -0.6664476, 0, 0, 0, 1, 1,
0.4007795, -1.270275, 2.941016, 0, 0, 0, 1, 1,
0.411476, -1.431853, 3.665552, 0, 0, 0, 1, 1,
0.4115984, 1.424281, 0.1109428, 1, 1, 1, 1, 1,
0.4164402, -2.173658, 2.696021, 1, 1, 1, 1, 1,
0.4172921, 0.02479655, 1.019639, 1, 1, 1, 1, 1,
0.4226114, 1.034937, 0.854277, 1, 1, 1, 1, 1,
0.4250335, 0.5246935, 2.318192, 1, 1, 1, 1, 1,
0.4306014, 0.9021581, 0.7203224, 1, 1, 1, 1, 1,
0.4307694, 0.4141609, 0.03663015, 1, 1, 1, 1, 1,
0.4334431, 0.08454268, 0.4511842, 1, 1, 1, 1, 1,
0.4410407, -1.26258, 3.230776, 1, 1, 1, 1, 1,
0.4430175, -0.8284517, 3.350716, 1, 1, 1, 1, 1,
0.4432165, 0.2609589, 0.07571859, 1, 1, 1, 1, 1,
0.4442191, 0.9449019, -0.8818701, 1, 1, 1, 1, 1,
0.4516252, -0.2614367, 1.791541, 1, 1, 1, 1, 1,
0.4548163, -0.3972125, 3.833681, 1, 1, 1, 1, 1,
0.4561699, 0.2999655, 2.189179, 1, 1, 1, 1, 1,
0.4629782, -0.4605092, 0.9704099, 0, 0, 1, 1, 1,
0.4660382, 0.3148683, 0.6178128, 1, 0, 0, 1, 1,
0.4661237, -2.007539, 4.350926, 1, 0, 0, 1, 1,
0.473507, -0.5634449, 2.382643, 1, 0, 0, 1, 1,
0.4804766, -0.3930486, 2.018889, 1, 0, 0, 1, 1,
0.4828608, -0.4244683, 1.460935, 1, 0, 0, 1, 1,
0.4864305, -0.8819153, 3.251161, 0, 0, 0, 1, 1,
0.4865825, -0.2944629, 1.118555, 0, 0, 0, 1, 1,
0.4889599, 1.384716, 1.962646, 0, 0, 0, 1, 1,
0.4895566, 0.7055635, 1.093577, 0, 0, 0, 1, 1,
0.4910249, -0.4606274, 3.080391, 0, 0, 0, 1, 1,
0.4951946, 1.702369, -0.08382061, 0, 0, 0, 1, 1,
0.4955683, 0.8139966, 0.3685232, 0, 0, 0, 1, 1,
0.5054194, -0.3034507, 1.597769, 1, 1, 1, 1, 1,
0.5069363, -0.2325401, 2.552192, 1, 1, 1, 1, 1,
0.51361, 1.567494, 2.118593, 1, 1, 1, 1, 1,
0.5237785, -1.350717, 4.359926, 1, 1, 1, 1, 1,
0.5252919, -0.06885318, 0.9939899, 1, 1, 1, 1, 1,
0.5257306, 0.4156763, -0.8037864, 1, 1, 1, 1, 1,
0.5258688, 1.119419, 3.419308, 1, 1, 1, 1, 1,
0.5273635, 0.712024, 1.73793, 1, 1, 1, 1, 1,
0.5279823, -1.78886, 1.849311, 1, 1, 1, 1, 1,
0.5328168, -0.9806347, 1.776368, 1, 1, 1, 1, 1,
0.533308, -0.1953254, 4.092951, 1, 1, 1, 1, 1,
0.5342525, -0.0214572, 1.839928, 1, 1, 1, 1, 1,
0.5401033, 1.129375, 0.1757155, 1, 1, 1, 1, 1,
0.5539421, -0.279735, 1.370361, 1, 1, 1, 1, 1,
0.5557285, -0.6194257, 1.768998, 1, 1, 1, 1, 1,
0.5637236, 0.9556584, 0.245996, 0, 0, 1, 1, 1,
0.5670281, 0.4283465, 0.3713503, 1, 0, 0, 1, 1,
0.567958, -0.6922158, 2.163715, 1, 0, 0, 1, 1,
0.5725051, 0.475562, -0.1101435, 1, 0, 0, 1, 1,
0.5885078, -0.2645544, 0.9961603, 1, 0, 0, 1, 1,
0.5902699, -1.89062, 1.585561, 1, 0, 0, 1, 1,
0.5922004, 0.03829863, -0.8113052, 0, 0, 0, 1, 1,
0.599023, -0.6578, 1.580204, 0, 0, 0, 1, 1,
0.5992043, -0.5299445, 2.978713, 0, 0, 0, 1, 1,
0.5998294, 0.918769, -1.001789, 0, 0, 0, 1, 1,
0.6000178, -0.2028973, 3.136434, 0, 0, 0, 1, 1,
0.6049376, -0.8589022, 5.081499, 0, 0, 0, 1, 1,
0.6089758, -0.1660311, 2.345533, 0, 0, 0, 1, 1,
0.6108721, -1.359312, 3.671488, 1, 1, 1, 1, 1,
0.6149719, 0.1054504, 1.685741, 1, 1, 1, 1, 1,
0.617236, -0.6537573, 1.514503, 1, 1, 1, 1, 1,
0.620822, 0.4130043, 1.012971, 1, 1, 1, 1, 1,
0.6211384, -0.3200475, 3.267083, 1, 1, 1, 1, 1,
0.6219497, 2.053164, 1.361231, 1, 1, 1, 1, 1,
0.6228617, 0.1891124, 2.261177, 1, 1, 1, 1, 1,
0.6230704, 2.514798, -1.899987, 1, 1, 1, 1, 1,
0.6263196, -1.096678, 5.194978, 1, 1, 1, 1, 1,
0.6274327, -0.6337063, 0.7725056, 1, 1, 1, 1, 1,
0.6299934, 0.2943926, 1.005693, 1, 1, 1, 1, 1,
0.6370679, -0.09206034, 3.139108, 1, 1, 1, 1, 1,
0.6426126, 0.3298925, 1.104562, 1, 1, 1, 1, 1,
0.6450937, 1.579394, 1.192983, 1, 1, 1, 1, 1,
0.6508125, 0.02981586, 1.392322, 1, 1, 1, 1, 1,
0.6536189, 0.1588754, 1.841284, 0, 0, 1, 1, 1,
0.6567214, -0.3590446, 0.8611923, 1, 0, 0, 1, 1,
0.6637238, 0.02116415, 0.9539225, 1, 0, 0, 1, 1,
0.6685446, -1.153007, 3.426032, 1, 0, 0, 1, 1,
0.669366, -0.6803613, 1.925851, 1, 0, 0, 1, 1,
0.6734701, 0.5889699, 1.137268, 1, 0, 0, 1, 1,
0.6794664, 0.7503594, 1.066008, 0, 0, 0, 1, 1,
0.6853423, 2.377693, 1.185224, 0, 0, 0, 1, 1,
0.6957648, 0.676817, 0.2593537, 0, 0, 0, 1, 1,
0.7005075, 0.5365741, 0.8733111, 0, 0, 0, 1, 1,
0.7009804, 2.449461, 1.607914, 0, 0, 0, 1, 1,
0.7020934, -0.3169997, 0.4484702, 0, 0, 0, 1, 1,
0.7024388, 0.1819605, 0.7639758, 0, 0, 0, 1, 1,
0.7037328, 1.323555, -0.4906667, 1, 1, 1, 1, 1,
0.7070154, 0.5493826, 0.3950616, 1, 1, 1, 1, 1,
0.7131053, -0.297474, 2.499487, 1, 1, 1, 1, 1,
0.7233036, -0.6225404, 3.161328, 1, 1, 1, 1, 1,
0.7290328, 1.736433, -0.02456329, 1, 1, 1, 1, 1,
0.7363532, -1.344315, 3.112287, 1, 1, 1, 1, 1,
0.7380168, -0.2372066, 1.3234, 1, 1, 1, 1, 1,
0.7398086, 1.417025, 1.765104, 1, 1, 1, 1, 1,
0.7404799, 0.5132047, 0.07824264, 1, 1, 1, 1, 1,
0.7427727, -0.4703878, 2.085971, 1, 1, 1, 1, 1,
0.7513981, 1.572222, 0.8651659, 1, 1, 1, 1, 1,
0.7542969, 0.8477957, 1.489592, 1, 1, 1, 1, 1,
0.7591733, -0.6146763, 3.59263, 1, 1, 1, 1, 1,
0.7611254, 0.9578569, 0.6020457, 1, 1, 1, 1, 1,
0.7628195, 0.659377, 0.7233796, 1, 1, 1, 1, 1,
0.7656691, 1.365835, 0.442553, 0, 0, 1, 1, 1,
0.7707592, -1.386585, 4.018996, 1, 0, 0, 1, 1,
0.7727205, -0.5989999, 3.144986, 1, 0, 0, 1, 1,
0.7762056, -1.733686, 1.419758, 1, 0, 0, 1, 1,
0.7778076, -0.04947698, 1.670699, 1, 0, 0, 1, 1,
0.784933, -0.4503164, 1.25093, 1, 0, 0, 1, 1,
0.7861359, -0.4285358, 1.268595, 0, 0, 0, 1, 1,
0.7877293, 1.830265, 0.3208389, 0, 0, 0, 1, 1,
0.7886047, 1.109644, 1.133631, 0, 0, 0, 1, 1,
0.7947112, 0.7218043, 2.089061, 0, 0, 0, 1, 1,
0.7993857, -0.4771731, 2.293231, 0, 0, 0, 1, 1,
0.7997611, -0.5960431, 1.72948, 0, 0, 0, 1, 1,
0.8093911, 0.3286447, 1.882609, 0, 0, 0, 1, 1,
0.8098575, 0.4499522, -0.09988195, 1, 1, 1, 1, 1,
0.8109388, -0.06013206, 0.9461628, 1, 1, 1, 1, 1,
0.8144628, -0.09688678, 0.9218359, 1, 1, 1, 1, 1,
0.8156223, 0.8147831, 0.05932735, 1, 1, 1, 1, 1,
0.8232926, 0.1841837, 1.64267, 1, 1, 1, 1, 1,
0.8239276, 2.226286, 0.6156718, 1, 1, 1, 1, 1,
0.8276414, -1.230209, 4.300302, 1, 1, 1, 1, 1,
0.8287454, -0.5507551, 0.8224436, 1, 1, 1, 1, 1,
0.8342347, -0.07761633, 0.8585066, 1, 1, 1, 1, 1,
0.8361272, 0.3616713, 1.258782, 1, 1, 1, 1, 1,
0.8383228, 0.6949368, 0.01838379, 1, 1, 1, 1, 1,
0.8392178, 0.06715135, 0.510775, 1, 1, 1, 1, 1,
0.8402917, 0.9848875, 1.092863, 1, 1, 1, 1, 1,
0.8550329, 0.3739198, 1.181341, 1, 1, 1, 1, 1,
0.8664232, -1.618044, 2.961311, 1, 1, 1, 1, 1,
0.8676089, -0.08284778, 1.117594, 0, 0, 1, 1, 1,
0.8707089, 0.5470457, 2.320071, 1, 0, 0, 1, 1,
0.8713313, 0.2204389, 1.385936, 1, 0, 0, 1, 1,
0.8748709, 0.4118563, 0.8091415, 1, 0, 0, 1, 1,
0.8762571, -0.4191104, 3.238067, 1, 0, 0, 1, 1,
0.876998, 0.338904, 2.115378, 1, 0, 0, 1, 1,
0.8818142, 0.8813502, 1.640974, 0, 0, 0, 1, 1,
0.8830906, 0.4959411, 1.825734, 0, 0, 0, 1, 1,
0.8861158, 0.7595109, 2.05587, 0, 0, 0, 1, 1,
0.8862208, -0.820658, 1.389385, 0, 0, 0, 1, 1,
0.8886969, -0.1267548, 2.02113, 0, 0, 0, 1, 1,
0.8943042, -0.1357078, 2.692806, 0, 0, 0, 1, 1,
0.8964219, 1.054991, 0.6238723, 0, 0, 0, 1, 1,
0.8971426, 1.141076, 0.4381147, 1, 1, 1, 1, 1,
0.9086248, -0.8045788, 2.964687, 1, 1, 1, 1, 1,
0.9104632, 1.350911, -0.2179475, 1, 1, 1, 1, 1,
0.9217387, -0.114311, 2.033381, 1, 1, 1, 1, 1,
0.9255551, -0.8063994, 1.469676, 1, 1, 1, 1, 1,
0.9310801, 2.236866, 1.719798, 1, 1, 1, 1, 1,
0.9340324, 1.137349, 0.5114004, 1, 1, 1, 1, 1,
0.9352451, -0.03552998, 0.1273661, 1, 1, 1, 1, 1,
0.9366164, 0.4495398, 1.294637, 1, 1, 1, 1, 1,
0.9377847, 0.4212038, 1.165825, 1, 1, 1, 1, 1,
0.942215, -1.599725, 2.826694, 1, 1, 1, 1, 1,
0.9452949, -1.245485, 2.992281, 1, 1, 1, 1, 1,
0.9525443, 0.2072653, 0.5687603, 1, 1, 1, 1, 1,
0.9562845, 0.9925336, 1.290561, 1, 1, 1, 1, 1,
0.9584774, 1.784531, 1.97481, 1, 1, 1, 1, 1,
0.9618666, -1.201862, 2.908438, 0, 0, 1, 1, 1,
0.9663956, -0.1641523, 0.667971, 1, 0, 0, 1, 1,
0.9699566, -0.4105275, 0.906619, 1, 0, 0, 1, 1,
0.9702705, 0.1343143, 1.041101, 1, 0, 0, 1, 1,
0.970955, -0.6452947, 2.860558, 1, 0, 0, 1, 1,
0.9755754, 0.4853165, 0.8044569, 1, 0, 0, 1, 1,
0.9766931, -0.2762321, 2.023654, 0, 0, 0, 1, 1,
0.9798633, -1.030947, 2.882257, 0, 0, 0, 1, 1,
0.9843153, -0.636941, 1.062729, 0, 0, 0, 1, 1,
0.9854367, 1.015175, 1.467189, 0, 0, 0, 1, 1,
0.9865053, 0.05578579, 0.8359609, 0, 0, 0, 1, 1,
0.9908127, -0.6698875, 3.12926, 0, 0, 0, 1, 1,
0.9968063, 0.9093947, 1.894918, 0, 0, 0, 1, 1,
1.006572, 1.613886, 0.6896074, 1, 1, 1, 1, 1,
1.009622, -1.026854, 0.9990648, 1, 1, 1, 1, 1,
1.012195, -1.762045, 3.931198, 1, 1, 1, 1, 1,
1.019973, 0.6108974, 0.2330197, 1, 1, 1, 1, 1,
1.022279, 0.3415416, 3.130349, 1, 1, 1, 1, 1,
1.026201, -1.599073, 1.728374, 1, 1, 1, 1, 1,
1.044823, 1.330062, 0.6054586, 1, 1, 1, 1, 1,
1.045012, -0.147, 0.9141234, 1, 1, 1, 1, 1,
1.048737, 1.325037, 0.7523961, 1, 1, 1, 1, 1,
1.054515, -2.126458, 4.004, 1, 1, 1, 1, 1,
1.059321, 0.5201585, 1.490169, 1, 1, 1, 1, 1,
1.066769, 0.192388, 2.545502, 1, 1, 1, 1, 1,
1.068417, -1.0232, 1.702926, 1, 1, 1, 1, 1,
1.071739, 0.7921317, 0.6009681, 1, 1, 1, 1, 1,
1.073916, -0.6691511, 3.224198, 1, 1, 1, 1, 1,
1.075506, -1.232407, 3.048028, 0, 0, 1, 1, 1,
1.085515, 1.112801, 1.28582, 1, 0, 0, 1, 1,
1.089149, -0.7806944, 1.63346, 1, 0, 0, 1, 1,
1.091074, 0.8052101, 0.9602259, 1, 0, 0, 1, 1,
1.091527, -0.8567641, 1.922213, 1, 0, 0, 1, 1,
1.091622, 0.1782285, 0.05401264, 1, 0, 0, 1, 1,
1.091819, -0.6333007, 1.94381, 0, 0, 0, 1, 1,
1.094263, -0.483464, 2.054429, 0, 0, 0, 1, 1,
1.095053, 0.5579548, 2.760874, 0, 0, 0, 1, 1,
1.111648, -0.5782831, 1.173441, 0, 0, 0, 1, 1,
1.119782, 0.01938601, 0.381204, 0, 0, 0, 1, 1,
1.124601, 0.7467117, 3.060692, 0, 0, 0, 1, 1,
1.130472, 0.9415382, 1.213348, 0, 0, 0, 1, 1,
1.135522, 0.6093274, 0.1958367, 1, 1, 1, 1, 1,
1.138095, -0.3063883, 0.9595467, 1, 1, 1, 1, 1,
1.151008, 0.8360068, 2.357274, 1, 1, 1, 1, 1,
1.15758, -0.09315394, 3.518887, 1, 1, 1, 1, 1,
1.166483, -1.640957, 1.432989, 1, 1, 1, 1, 1,
1.17101, -0.5383849, 3.39499, 1, 1, 1, 1, 1,
1.173109, 1.884511, 0.9981797, 1, 1, 1, 1, 1,
1.174646, -0.7343594, 2.192274, 1, 1, 1, 1, 1,
1.175862, 0.2398319, 0.8218688, 1, 1, 1, 1, 1,
1.184355, 0.2089691, 1.081375, 1, 1, 1, 1, 1,
1.18896, -0.2681206, 1.604988, 1, 1, 1, 1, 1,
1.193648, -0.9088491, 2.79774, 1, 1, 1, 1, 1,
1.204359, -0.09884727, 1.015833, 1, 1, 1, 1, 1,
1.205528, -0.5325113, -0.02755092, 1, 1, 1, 1, 1,
1.208683, -0.1674177, 3.114501, 1, 1, 1, 1, 1,
1.212717, 0.8997033, 1.677215, 0, 0, 1, 1, 1,
1.23328, -0.7322775, 0.7316257, 1, 0, 0, 1, 1,
1.235059, -0.4715582, 1.296794, 1, 0, 0, 1, 1,
1.238355, -0.164209, 1.370237, 1, 0, 0, 1, 1,
1.238465, 0.01626508, 1.968843, 1, 0, 0, 1, 1,
1.249533, -1.258042, 2.994295, 1, 0, 0, 1, 1,
1.252064, -0.230915, 2.873214, 0, 0, 0, 1, 1,
1.254286, 0.02009502, 2.258403, 0, 0, 0, 1, 1,
1.256663, -1.951948, 2.769364, 0, 0, 0, 1, 1,
1.259087, 0.4053099, 1.02995, 0, 0, 0, 1, 1,
1.266355, 0.5157644, 0.8686259, 0, 0, 0, 1, 1,
1.268464, -0.9451157, 2.913097, 0, 0, 0, 1, 1,
1.275142, -0.7417843, 0.5527107, 0, 0, 0, 1, 1,
1.279611, 0.587531, 0.533491, 1, 1, 1, 1, 1,
1.285172, 1.384171, 2.79033, 1, 1, 1, 1, 1,
1.292532, 2.170526, 0.7550332, 1, 1, 1, 1, 1,
1.316335, -0.8635522, 2.490015, 1, 1, 1, 1, 1,
1.321401, -0.8049094, 2.662748, 1, 1, 1, 1, 1,
1.334165, -0.9787593, 2.533497, 1, 1, 1, 1, 1,
1.347372, 0.7763364, 2.116701, 1, 1, 1, 1, 1,
1.34746, -0.4117833, 3.370463, 1, 1, 1, 1, 1,
1.355139, 0.9565156, -1.831092, 1, 1, 1, 1, 1,
1.362704, 0.1671584, 0.399805, 1, 1, 1, 1, 1,
1.373824, 0.9900431, 1.700504, 1, 1, 1, 1, 1,
1.388478, -0.02163923, 1.870397, 1, 1, 1, 1, 1,
1.388632, -0.6645769, 2.18463, 1, 1, 1, 1, 1,
1.406983, -0.1094799, 1.861012, 1, 1, 1, 1, 1,
1.412019, 0.3412232, 0.7342492, 1, 1, 1, 1, 1,
1.412355, 1.859165, 0.3951817, 0, 0, 1, 1, 1,
1.41943, 1.006458, 0.04333874, 1, 0, 0, 1, 1,
1.438806, -1.363247, 2.46422, 1, 0, 0, 1, 1,
1.442808, 0.2626728, 1.575844, 1, 0, 0, 1, 1,
1.443125, -0.324941, 1.881177, 1, 0, 0, 1, 1,
1.455215, 0.1287342, 0.9667312, 1, 0, 0, 1, 1,
1.456303, -1.290464, 2.221887, 0, 0, 0, 1, 1,
1.461655, -1.10542, 1.878165, 0, 0, 0, 1, 1,
1.463285, 0.3375615, -0.07962323, 0, 0, 0, 1, 1,
1.466644, -0.2637075, 1.959617, 0, 0, 0, 1, 1,
1.481604, -0.3070153, 3.096903, 0, 0, 0, 1, 1,
1.488234, -0.1293015, 2.216942, 0, 0, 0, 1, 1,
1.511017, -1.366469, 1.966588, 0, 0, 0, 1, 1,
1.515823, -0.5045941, 0.7573718, 1, 1, 1, 1, 1,
1.524066, -0.4704703, 0.1173412, 1, 1, 1, 1, 1,
1.536241, -0.4678964, 1.348462, 1, 1, 1, 1, 1,
1.540241, -0.9945291, 3.354187, 1, 1, 1, 1, 1,
1.558563, -0.05577913, 1.366899, 1, 1, 1, 1, 1,
1.580629, 0.6375887, 1.742572, 1, 1, 1, 1, 1,
1.596255, -1.350278, 0.5479957, 1, 1, 1, 1, 1,
1.614905, 0.2030618, 1.236378, 1, 1, 1, 1, 1,
1.623046, -0.8696429, 1.2053, 1, 1, 1, 1, 1,
1.626857, 0.8106452, -0.6991242, 1, 1, 1, 1, 1,
1.63034, -0.8472205, 2.117953, 1, 1, 1, 1, 1,
1.63435, 0.04483605, 2.580956, 1, 1, 1, 1, 1,
1.640001, -0.07280493, 0.223805, 1, 1, 1, 1, 1,
1.642143, 0.2910518, 1.110931, 1, 1, 1, 1, 1,
1.674054, -0.7331495, 2.023586, 1, 1, 1, 1, 1,
1.701513, 0.2761149, -0.3284087, 0, 0, 1, 1, 1,
1.71639, 0.03255354, 0.8645583, 1, 0, 0, 1, 1,
1.717527, -1.976452, 0.3559479, 1, 0, 0, 1, 1,
1.722327, -0.005481223, 1.473279, 1, 0, 0, 1, 1,
1.728345, -0.5528011, 1.649879, 1, 0, 0, 1, 1,
1.735656, -1.773182, 1.728559, 1, 0, 0, 1, 1,
1.73777, 0.6258103, 1.213854, 0, 0, 0, 1, 1,
1.743064, 0.6565512, 1.173588, 0, 0, 0, 1, 1,
1.748479, -0.2334176, 2.304784, 0, 0, 0, 1, 1,
1.76096, 1.305944, 0.9616598, 0, 0, 0, 1, 1,
1.785008, 0.8101015, 1.0903, 0, 0, 0, 1, 1,
1.802036, 0.4009005, 1.247874, 0, 0, 0, 1, 1,
1.808157, 1.165898, -0.9635972, 0, 0, 0, 1, 1,
1.813157, 0.4287831, 0.9900736, 1, 1, 1, 1, 1,
1.814412, 0.318115, -0.1888313, 1, 1, 1, 1, 1,
1.82907, 2.314475, 0.6451316, 1, 1, 1, 1, 1,
1.83165, -1.035403, 3.336164, 1, 1, 1, 1, 1,
1.84477, -0.3656988, 0.4853308, 1, 1, 1, 1, 1,
1.882563, -1.258736, 1.183024, 1, 1, 1, 1, 1,
1.914028, 0.6965884, 1.762521, 1, 1, 1, 1, 1,
1.917963, -1.853653, 3.990016, 1, 1, 1, 1, 1,
1.922037, -0.3030378, 1.094984, 1, 1, 1, 1, 1,
1.932503, -0.243265, 1.617153, 1, 1, 1, 1, 1,
1.974086, 0.3347476, 1.774389, 1, 1, 1, 1, 1,
1.977212, 1.407454, 1.151551, 1, 1, 1, 1, 1,
1.990161, 0.8149468, 1.45741, 1, 1, 1, 1, 1,
1.992479, 1.722371, 0.427191, 1, 1, 1, 1, 1,
2.002137, -1.017325, 2.75351, 1, 1, 1, 1, 1,
2.008815, 0.07723367, 0.8252028, 0, 0, 1, 1, 1,
2.014544, -0.1579397, 2.396316, 1, 0, 0, 1, 1,
2.04564, -0.369613, 3.256836, 1, 0, 0, 1, 1,
2.077582, -0.9757878, 2.280541, 1, 0, 0, 1, 1,
2.117871, -0.7128296, 2.536705, 1, 0, 0, 1, 1,
2.134156, -0.1421214, 1.185485, 1, 0, 0, 1, 1,
2.137534, -2.009496, 0.6947868, 0, 0, 0, 1, 1,
2.153301, -0.3255643, -1.046924, 0, 0, 0, 1, 1,
2.216307, 2.453232, 0.05171677, 0, 0, 0, 1, 1,
2.233328, 1.30813, 0.3758278, 0, 0, 0, 1, 1,
2.257608, -0.3728183, 0.2084316, 0, 0, 0, 1, 1,
2.367613, -0.2847641, 0.8107673, 0, 0, 0, 1, 1,
2.390535, -0.2949922, 1.254094, 0, 0, 0, 1, 1,
2.401503, 0.4532288, -0.771736, 1, 1, 1, 1, 1,
2.610379, 0.2156231, -1.069587, 1, 1, 1, 1, 1,
2.622617, -1.002633, 2.121405, 1, 1, 1, 1, 1,
2.68538, 0.3305954, 2.551285, 1, 1, 1, 1, 1,
2.855451, 0.1342775, 1.558491, 1, 1, 1, 1, 1,
2.929842, -1.093652, 3.060753, 1, 1, 1, 1, 1,
2.961252, -1.652877, 1.898908, 1, 1, 1, 1, 1
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
var radius = 9.183329;
var distance = 32.25605;
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
mvMatrix.translate( 0.003036857, -0.2347003, 0.225045 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.25605);
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
