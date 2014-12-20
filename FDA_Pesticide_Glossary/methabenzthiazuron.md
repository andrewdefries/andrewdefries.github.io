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
-3.130061, 1.576392, -1.831887, 1, 0, 0, 1,
-3.004927, -0.6656528, -1.14354, 1, 0.007843138, 0, 1,
-2.750498, 0.4857943, -0.9977233, 1, 0.01176471, 0, 1,
-2.60793, 1.458819, -0.7830525, 1, 0.01960784, 0, 1,
-2.572556, 0.8202013, -2.746711, 1, 0.02352941, 0, 1,
-2.537365, 0.1128437, -3.632691, 1, 0.03137255, 0, 1,
-2.466314, -0.9438927, -2.270847, 1, 0.03529412, 0, 1,
-2.436416, -0.5382547, -2.469766, 1, 0.04313726, 0, 1,
-2.38128, -1.086598, -1.534186, 1, 0.04705882, 0, 1,
-2.344632, -0.9855225, -0.2472535, 1, 0.05490196, 0, 1,
-2.229045, -0.6375237, -2.518214, 1, 0.05882353, 0, 1,
-2.182293, 0.9873963, -2.537258, 1, 0.06666667, 0, 1,
-2.12727, 1.195197, -0.1779332, 1, 0.07058824, 0, 1,
-2.099254, -0.9683349, -1.999089, 1, 0.07843138, 0, 1,
-2.09414, 1.327641, -0.4882542, 1, 0.08235294, 0, 1,
-2.088363, -0.1454501, -2.434819, 1, 0.09019608, 0, 1,
-2.051286, -0.09782081, -2.839758, 1, 0.09411765, 0, 1,
-2.00977, -1.494954, 0.2394383, 1, 0.1019608, 0, 1,
-2.001925, -0.3615069, -3.338599, 1, 0.1098039, 0, 1,
-1.991346, 0.7364716, -1.177736, 1, 0.1137255, 0, 1,
-1.915776, 0.5320717, -3.096093, 1, 0.1215686, 0, 1,
-1.853845, -1.277058, -2.710318, 1, 0.1254902, 0, 1,
-1.850089, -0.04128677, -2.919811, 1, 0.1333333, 0, 1,
-1.84815, 0.216174, 1.192842, 1, 0.1372549, 0, 1,
-1.843926, -0.05980556, -2.39551, 1, 0.145098, 0, 1,
-1.841101, 1.627444, 0.9261685, 1, 0.1490196, 0, 1,
-1.81812, -0.9624436, -2.948929, 1, 0.1568628, 0, 1,
-1.797492, -1.216124, -3.594369, 1, 0.1607843, 0, 1,
-1.774362, 0.4810242, -1.772413, 1, 0.1686275, 0, 1,
-1.772819, -0.2832321, -1.468623, 1, 0.172549, 0, 1,
-1.748534, 1.093566, -2.170396, 1, 0.1803922, 0, 1,
-1.713312, 1.800724, 0.2190467, 1, 0.1843137, 0, 1,
-1.711552, 0.03732501, -2.88288, 1, 0.1921569, 0, 1,
-1.704772, -0.8597122, -2.197745, 1, 0.1960784, 0, 1,
-1.696568, 0.1518338, -2.734205, 1, 0.2039216, 0, 1,
-1.693893, -0.4355261, -0.9071018, 1, 0.2117647, 0, 1,
-1.661461, -0.8293257, -0.9592597, 1, 0.2156863, 0, 1,
-1.655171, 1.18135, -0.2555252, 1, 0.2235294, 0, 1,
-1.654141, 1.016164, -1.974071, 1, 0.227451, 0, 1,
-1.607746, -1.541414, -2.606618, 1, 0.2352941, 0, 1,
-1.601066, -0.5918695, -2.71255, 1, 0.2392157, 0, 1,
-1.579752, 0.705744, -2.339843, 1, 0.2470588, 0, 1,
-1.578015, 1.805722, 0.1218634, 1, 0.2509804, 0, 1,
-1.577716, -0.5451071, -2.930095, 1, 0.2588235, 0, 1,
-1.573741, -0.8942491, -2.362751, 1, 0.2627451, 0, 1,
-1.557167, 0.4985384, -0.9884957, 1, 0.2705882, 0, 1,
-1.557054, -1.106447, -3.33871, 1, 0.2745098, 0, 1,
-1.549936, -1.296587, -0.6661048, 1, 0.282353, 0, 1,
-1.539038, -1.858353, -2.300187, 1, 0.2862745, 0, 1,
-1.529996, 0.1813849, -1.599515, 1, 0.2941177, 0, 1,
-1.514268, 0.01751629, -1.917357, 1, 0.3019608, 0, 1,
-1.490221, -0.9637786, -1.805367, 1, 0.3058824, 0, 1,
-1.484076, 2.235816, 0.6329868, 1, 0.3137255, 0, 1,
-1.472298, 1.469841, -0.07506042, 1, 0.3176471, 0, 1,
-1.472219, -0.4167188, -2.042018, 1, 0.3254902, 0, 1,
-1.466006, 0.3664393, -1.391022, 1, 0.3294118, 0, 1,
-1.463812, 1.43746, 0.8172432, 1, 0.3372549, 0, 1,
-1.458016, -3.569213, -4.395918, 1, 0.3411765, 0, 1,
-1.454635, 0.7543812, -1.127082, 1, 0.3490196, 0, 1,
-1.446789, -0.3794175, -1.481285, 1, 0.3529412, 0, 1,
-1.428106, 1.957579, -0.9845849, 1, 0.3607843, 0, 1,
-1.41364, 1.056969, -0.5779104, 1, 0.3647059, 0, 1,
-1.413037, 0.9695647, -4.767912, 1, 0.372549, 0, 1,
-1.412322, 0.7171221, -0.7428885, 1, 0.3764706, 0, 1,
-1.40023, 0.7464687, -0.99342, 1, 0.3843137, 0, 1,
-1.399774, 0.8965161, -1.70073, 1, 0.3882353, 0, 1,
-1.366068, 0.0006182229, -2.162754, 1, 0.3960784, 0, 1,
-1.359489, -0.06155967, -3.007626, 1, 0.4039216, 0, 1,
-1.351516, 0.3105469, -0.3943172, 1, 0.4078431, 0, 1,
-1.334628, -1.364585, -1.462971, 1, 0.4156863, 0, 1,
-1.325147, -0.2078009, -1.13729, 1, 0.4196078, 0, 1,
-1.323391, -0.2132738, -2.687751, 1, 0.427451, 0, 1,
-1.319253, 0.08620603, -0.9736139, 1, 0.4313726, 0, 1,
-1.316096, 2.658089, 0.1456118, 1, 0.4392157, 0, 1,
-1.315439, -0.02016667, -1.399887, 1, 0.4431373, 0, 1,
-1.314811, 0.1842421, -0.7870042, 1, 0.4509804, 0, 1,
-1.313102, 0.004750579, -0.9959006, 1, 0.454902, 0, 1,
-1.310997, 0.9772353, -1.700579, 1, 0.4627451, 0, 1,
-1.305858, -0.290889, -0.9512, 1, 0.4666667, 0, 1,
-1.298113, -1.287414, -2.172025, 1, 0.4745098, 0, 1,
-1.293777, -1.377897, -4.270739, 1, 0.4784314, 0, 1,
-1.292932, -0.7051204, -2.45258, 1, 0.4862745, 0, 1,
-1.28806, -1.148295, -1.015883, 1, 0.4901961, 0, 1,
-1.286526, -0.6069461, -0.7681766, 1, 0.4980392, 0, 1,
-1.282203, 0.516699, -0.954653, 1, 0.5058824, 0, 1,
-1.274618, -0.7632484, -0.8488157, 1, 0.509804, 0, 1,
-1.271828, -0.5249106, -3.312367, 1, 0.5176471, 0, 1,
-1.262912, -0.1102386, -2.786666, 1, 0.5215687, 0, 1,
-1.254317, -0.5883127, -2.745576, 1, 0.5294118, 0, 1,
-1.249336, 0.8370012, -1.052177, 1, 0.5333334, 0, 1,
-1.241526, 1.000865, -0.7210332, 1, 0.5411765, 0, 1,
-1.239366, -1.090403, -0.8211023, 1, 0.5450981, 0, 1,
-1.239194, -1.639938, 0.1731734, 1, 0.5529412, 0, 1,
-1.238455, -0.3187958, -1.715478, 1, 0.5568628, 0, 1,
-1.224769, 0.6463286, -0.556707, 1, 0.5647059, 0, 1,
-1.215775, -1.289612, -4.982301, 1, 0.5686275, 0, 1,
-1.204286, 0.170503, -2.548544, 1, 0.5764706, 0, 1,
-1.19398, -2.104098, -1.496415, 1, 0.5803922, 0, 1,
-1.190213, 0.7225637, -1.640643, 1, 0.5882353, 0, 1,
-1.189975, -2.089728, -3.112733, 1, 0.5921569, 0, 1,
-1.186695, 1.751034, -0.5070494, 1, 0.6, 0, 1,
-1.184017, 1.124523, -2.176996, 1, 0.6078432, 0, 1,
-1.182981, 0.114292, -0.8945824, 1, 0.6117647, 0, 1,
-1.182424, -0.2773882, -2.112119, 1, 0.6196079, 0, 1,
-1.175376, -0.1961578, -0.7723083, 1, 0.6235294, 0, 1,
-1.174271, -0.03333632, -0.6046866, 1, 0.6313726, 0, 1,
-1.173974, -1.021788, -2.949514, 1, 0.6352941, 0, 1,
-1.16948, 0.05235349, -1.974054, 1, 0.6431373, 0, 1,
-1.168601, -0.8558306, -1.775865, 1, 0.6470588, 0, 1,
-1.166746, 1.156632, -2.397858, 1, 0.654902, 0, 1,
-1.165076, 1.469222, -0.006442528, 1, 0.6588235, 0, 1,
-1.158982, -0.6954578, -1.209997, 1, 0.6666667, 0, 1,
-1.156622, -1.675895, -3.40531, 1, 0.6705883, 0, 1,
-1.154374, 1.589484, -1.299627, 1, 0.6784314, 0, 1,
-1.149816, -0.4661212, -3.119486, 1, 0.682353, 0, 1,
-1.147497, 0.9880764, -1.296374, 1, 0.6901961, 0, 1,
-1.14639, 0.7800969, -0.898165, 1, 0.6941177, 0, 1,
-1.141385, -0.2487842, -1.482606, 1, 0.7019608, 0, 1,
-1.139312, -1.664122, -3.261663, 1, 0.7098039, 0, 1,
-1.128969, 0.538247, -1.428046, 1, 0.7137255, 0, 1,
-1.127296, -0.1800966, -1.003632, 1, 0.7215686, 0, 1,
-1.122265, -0.4275245, -2.295408, 1, 0.7254902, 0, 1,
-1.109724, -0.5280407, -2.311002, 1, 0.7333333, 0, 1,
-1.10965, -1.518815, -4.249988, 1, 0.7372549, 0, 1,
-1.103683, 0.6311987, -0.6662463, 1, 0.7450981, 0, 1,
-1.089808, 0.9784063, 0.06746759, 1, 0.7490196, 0, 1,
-1.076917, -0.7207804, -0.9498972, 1, 0.7568628, 0, 1,
-1.070493, -0.9856406, -2.048365, 1, 0.7607843, 0, 1,
-1.063418, 0.9593104, -1.600067, 1, 0.7686275, 0, 1,
-1.061729, -1.744962, -2.366685, 1, 0.772549, 0, 1,
-1.061309, 1.083025, 0.4084921, 1, 0.7803922, 0, 1,
-1.058109, 0.3823249, -0.8923714, 1, 0.7843137, 0, 1,
-1.051837, -0.2632093, -2.192237, 1, 0.7921569, 0, 1,
-1.039781, -1.138384, -4.235919, 1, 0.7960784, 0, 1,
-1.037931, -1.981312, -1.639701, 1, 0.8039216, 0, 1,
-1.035058, -0.1317214, -3.003125, 1, 0.8117647, 0, 1,
-1.031587, -1.484734, -4.095726, 1, 0.8156863, 0, 1,
-1.030866, 0.5922522, -3.256334, 1, 0.8235294, 0, 1,
-1.028854, 0.3058872, -2.345041, 1, 0.827451, 0, 1,
-1.026027, 1.025236, -0.2878601, 1, 0.8352941, 0, 1,
-1.014871, 0.9236235, -0.1006211, 1, 0.8392157, 0, 1,
-1.010415, 1.003448, -0.317837, 1, 0.8470588, 0, 1,
-1.010273, 1.670627, -0.8153475, 1, 0.8509804, 0, 1,
-1.010222, 0.6629882, -0.9771119, 1, 0.8588235, 0, 1,
-0.9980062, -0.5163956, -1.942288, 1, 0.8627451, 0, 1,
-0.9960755, 0.09836738, -1.381467, 1, 0.8705882, 0, 1,
-0.9832541, -0.8223492, -0.6308442, 1, 0.8745098, 0, 1,
-0.978996, 0.2453263, -1.727183, 1, 0.8823529, 0, 1,
-0.9677044, -0.07540023, -2.944632, 1, 0.8862745, 0, 1,
-0.9665982, -1.190082, -2.468084, 1, 0.8941177, 0, 1,
-0.9662259, 0.6579926, 0.2225723, 1, 0.8980392, 0, 1,
-0.9625781, -1.513284, -3.006913, 1, 0.9058824, 0, 1,
-0.9598269, 1.242971, -0.2823272, 1, 0.9137255, 0, 1,
-0.9562988, -0.8435001, -2.103232, 1, 0.9176471, 0, 1,
-0.9547951, -0.9376944, -2.116575, 1, 0.9254902, 0, 1,
-0.951576, 1.83488, -0.2874871, 1, 0.9294118, 0, 1,
-0.9468712, -0.5575174, -1.621895, 1, 0.9372549, 0, 1,
-0.9467704, -1.511958, -2.656675, 1, 0.9411765, 0, 1,
-0.943769, -0.9027088, -0.7805552, 1, 0.9490196, 0, 1,
-0.9426562, 0.9509934, -0.9254103, 1, 0.9529412, 0, 1,
-0.9401068, -0.2636624, -1.265829, 1, 0.9607843, 0, 1,
-0.9304422, -0.274626, -3.661015, 1, 0.9647059, 0, 1,
-0.9225439, -1.332658, -3.618995, 1, 0.972549, 0, 1,
-0.91973, 0.8474893, 0.8188955, 1, 0.9764706, 0, 1,
-0.9161298, -0.20854, -2.070751, 1, 0.9843137, 0, 1,
-0.9093306, 0.2228047, 0.386085, 1, 0.9882353, 0, 1,
-0.9091273, 1.910489, -0.5629812, 1, 0.9960784, 0, 1,
-0.9074883, 0.09953416, -1.802811, 0.9960784, 1, 0, 1,
-0.903233, 0.6384553, -2.216555, 0.9921569, 1, 0, 1,
-0.896936, 0.4558073, -1.922967, 0.9843137, 1, 0, 1,
-0.8923851, -1.304403, -2.878096, 0.9803922, 1, 0, 1,
-0.8914629, -0.670523, -3.043831, 0.972549, 1, 0, 1,
-0.890753, 0.08764533, -0.3426958, 0.9686275, 1, 0, 1,
-0.8825589, -0.4808047, -3.573334, 0.9607843, 1, 0, 1,
-0.877058, 1.500232, 0.2024054, 0.9568627, 1, 0, 1,
-0.8729146, 0.3589153, -1.475633, 0.9490196, 1, 0, 1,
-0.8705121, -1.877136, -3.684374, 0.945098, 1, 0, 1,
-0.8704095, -0.6804311, -3.210328, 0.9372549, 1, 0, 1,
-0.870207, 1.000923, -2.030986, 0.9333333, 1, 0, 1,
-0.8692014, -0.9197404, -2.819552, 0.9254902, 1, 0, 1,
-0.8588349, 1.64735, -0.02174157, 0.9215686, 1, 0, 1,
-0.8547743, -0.2034125, -0.8730414, 0.9137255, 1, 0, 1,
-0.8524601, 0.004594107, -0.6668029, 0.9098039, 1, 0, 1,
-0.8504454, -0.06364677, -1.210827, 0.9019608, 1, 0, 1,
-0.845721, 0.4833628, -1.36362, 0.8941177, 1, 0, 1,
-0.8374999, -0.4360099, -1.041961, 0.8901961, 1, 0, 1,
-0.835579, -0.6730895, -2.388183, 0.8823529, 1, 0, 1,
-0.8305817, 2.147562, -0.9124827, 0.8784314, 1, 0, 1,
-0.8266466, 0.8442029, -1.053743, 0.8705882, 1, 0, 1,
-0.825422, -1.032456, -2.918774, 0.8666667, 1, 0, 1,
-0.8244641, -0.8211533, -2.865362, 0.8588235, 1, 0, 1,
-0.8185664, -1.125226, -2.912828, 0.854902, 1, 0, 1,
-0.8175201, 0.1682556, -1.6822, 0.8470588, 1, 0, 1,
-0.8162639, -2.058936, -1.876532, 0.8431373, 1, 0, 1,
-0.8112245, -0.4997087, -3.847926, 0.8352941, 1, 0, 1,
-0.8044365, -0.05577087, -3.261643, 0.8313726, 1, 0, 1,
-0.798102, -0.06024352, -0.789363, 0.8235294, 1, 0, 1,
-0.7859972, -0.6831226, -2.674419, 0.8196079, 1, 0, 1,
-0.7814744, 1.2628, -2.603874, 0.8117647, 1, 0, 1,
-0.781374, -2.590108, -2.402662, 0.8078431, 1, 0, 1,
-0.7779732, 0.7524616, -0.6785681, 0.8, 1, 0, 1,
-0.7779633, -0.2714788, -2.034253, 0.7921569, 1, 0, 1,
-0.7674391, -0.01433146, -3.694376, 0.7882353, 1, 0, 1,
-0.7673811, 0.8401403, -0.6083477, 0.7803922, 1, 0, 1,
-0.7630925, -0.9312569, -1.420741, 0.7764706, 1, 0, 1,
-0.7607657, -0.2184549, -2.933083, 0.7686275, 1, 0, 1,
-0.7589465, -0.5865617, -1.095557, 0.7647059, 1, 0, 1,
-0.7551665, 0.3051251, -1.277853, 0.7568628, 1, 0, 1,
-0.7525747, -0.2375736, -1.508147, 0.7529412, 1, 0, 1,
-0.7521881, -0.7038217, -2.638273, 0.7450981, 1, 0, 1,
-0.752178, -0.5919325, -2.208065, 0.7411765, 1, 0, 1,
-0.7494949, 1.292757, -0.3768826, 0.7333333, 1, 0, 1,
-0.7494212, -0.9142377, -2.745686, 0.7294118, 1, 0, 1,
-0.7483568, 0.4329798, -0.6944024, 0.7215686, 1, 0, 1,
-0.7412071, 0.2898934, -2.174937, 0.7176471, 1, 0, 1,
-0.741004, 2.527148, -0.1108628, 0.7098039, 1, 0, 1,
-0.7386857, -0.793992, -2.033583, 0.7058824, 1, 0, 1,
-0.7363707, -1.644602, -4.403269, 0.6980392, 1, 0, 1,
-0.7361027, 1.954094, -0.006301649, 0.6901961, 1, 0, 1,
-0.7344519, 0.08913264, -0.9487858, 0.6862745, 1, 0, 1,
-0.7333924, 0.7781826, -0.5765635, 0.6784314, 1, 0, 1,
-0.731577, -0.6011624, -1.808438, 0.6745098, 1, 0, 1,
-0.7301911, -0.236865, -2.395037, 0.6666667, 1, 0, 1,
-0.7222276, 0.5007594, -0.2160722, 0.6627451, 1, 0, 1,
-0.719189, -0.3289412, -1.567365, 0.654902, 1, 0, 1,
-0.710318, 0.3984343, -1.09421, 0.6509804, 1, 0, 1,
-0.7089592, 0.1055482, -1.072963, 0.6431373, 1, 0, 1,
-0.7053503, 0.003382734, -0.6290817, 0.6392157, 1, 0, 1,
-0.6983198, -0.7524754, -2.142287, 0.6313726, 1, 0, 1,
-0.6961671, -0.7327275, -2.569096, 0.627451, 1, 0, 1,
-0.6949493, 0.5759081, 0.03670042, 0.6196079, 1, 0, 1,
-0.6920862, 0.1282054, -2.307004, 0.6156863, 1, 0, 1,
-0.6912652, -1.269779, -2.455571, 0.6078432, 1, 0, 1,
-0.6731685, -0.3692414, -2.894872, 0.6039216, 1, 0, 1,
-0.6714112, -0.3517178, -2.287961, 0.5960785, 1, 0, 1,
-0.662523, 0.7107905, -1.985085, 0.5882353, 1, 0, 1,
-0.6552059, 0.3976904, -1.121898, 0.5843138, 1, 0, 1,
-0.6396464, 0.1079173, -0.7762033, 0.5764706, 1, 0, 1,
-0.6390013, 0.5496027, 0.1221709, 0.572549, 1, 0, 1,
-0.6389996, 0.3714474, -1.604962, 0.5647059, 1, 0, 1,
-0.6380004, -0.1424201, -0.725268, 0.5607843, 1, 0, 1,
-0.6372017, -0.1353474, -2.006341, 0.5529412, 1, 0, 1,
-0.6370544, -0.1400185, -1.396684, 0.5490196, 1, 0, 1,
-0.629371, 1.952715, -0.4280408, 0.5411765, 1, 0, 1,
-0.6235908, -0.8524476, -2.789106, 0.5372549, 1, 0, 1,
-0.6216869, -1.130772, -3.265729, 0.5294118, 1, 0, 1,
-0.6212189, 0.3435291, -2.014863, 0.5254902, 1, 0, 1,
-0.6170182, 0.9293796, -2.71701, 0.5176471, 1, 0, 1,
-0.6116461, -0.303567, -1.469074, 0.5137255, 1, 0, 1,
-0.6113537, 0.2602635, -1.471402, 0.5058824, 1, 0, 1,
-0.6104137, 0.1453875, -2.653966, 0.5019608, 1, 0, 1,
-0.6056852, -1.197238, -5.002642, 0.4941176, 1, 0, 1,
-0.5967928, 0.2034054, 0.7081983, 0.4862745, 1, 0, 1,
-0.5953109, -1.81597, -2.262433, 0.4823529, 1, 0, 1,
-0.5886334, 0.5276327, -1.459141, 0.4745098, 1, 0, 1,
-0.5846303, -0.8763196, -1.314229, 0.4705882, 1, 0, 1,
-0.5843453, 0.4790775, -1.769217, 0.4627451, 1, 0, 1,
-0.5837641, 1.06381, 0.8634133, 0.4588235, 1, 0, 1,
-0.5816159, 1.233837, -0.7885405, 0.4509804, 1, 0, 1,
-0.5771974, 0.2186094, -0.0256706, 0.4470588, 1, 0, 1,
-0.572019, -0.6629025, -2.838187, 0.4392157, 1, 0, 1,
-0.5719987, -0.2316914, -2.089562, 0.4352941, 1, 0, 1,
-0.570285, -0.2547378, -1.718918, 0.427451, 1, 0, 1,
-0.5689979, 0.34888, -2.206485, 0.4235294, 1, 0, 1,
-0.5689911, -1.281442, -2.006579, 0.4156863, 1, 0, 1,
-0.5591974, -0.8781096, -3.663464, 0.4117647, 1, 0, 1,
-0.5577654, 0.09110947, -1.533697, 0.4039216, 1, 0, 1,
-0.5539519, -1.940112, -2.350532, 0.3960784, 1, 0, 1,
-0.5482234, -0.4433461, -2.129539, 0.3921569, 1, 0, 1,
-0.5478488, -0.1443285, -0.8759676, 0.3843137, 1, 0, 1,
-0.5475885, 1.175642, 0.3457805, 0.3803922, 1, 0, 1,
-0.5469977, 1.004208, -2.01102, 0.372549, 1, 0, 1,
-0.5401674, -0.08225448, -3.515519, 0.3686275, 1, 0, 1,
-0.5371656, -0.1196608, -2.996121, 0.3607843, 1, 0, 1,
-0.536997, -0.733441, -1.976287, 0.3568628, 1, 0, 1,
-0.5299976, 0.2295088, 0.6712002, 0.3490196, 1, 0, 1,
-0.5264057, -1.398132, -1.835252, 0.345098, 1, 0, 1,
-0.5262401, -0.6688067, -3.085823, 0.3372549, 1, 0, 1,
-0.521775, -1.266567, -2.663083, 0.3333333, 1, 0, 1,
-0.5211232, 0.04292759, -2.333068, 0.3254902, 1, 0, 1,
-0.5193107, 1.4292, -0.1177066, 0.3215686, 1, 0, 1,
-0.5190649, 0.4192091, -1.126668, 0.3137255, 1, 0, 1,
-0.5081523, -1.108253, -1.995771, 0.3098039, 1, 0, 1,
-0.5057522, 0.5799588, -1.672972, 0.3019608, 1, 0, 1,
-0.505242, 0.05918544, -1.971918, 0.2941177, 1, 0, 1,
-0.5027249, -0.2334318, -1.02546, 0.2901961, 1, 0, 1,
-0.5007235, -0.2831416, -2.574883, 0.282353, 1, 0, 1,
-0.5006211, 0.6531758, -1.145636, 0.2784314, 1, 0, 1,
-0.499839, 0.5535942, -0.08827834, 0.2705882, 1, 0, 1,
-0.4928077, 0.4938402, -0.6997719, 0.2666667, 1, 0, 1,
-0.4882604, -0.796555, -2.707126, 0.2588235, 1, 0, 1,
-0.4865218, -0.06079185, -0.1653179, 0.254902, 1, 0, 1,
-0.482798, -1.730477, -2.993597, 0.2470588, 1, 0, 1,
-0.4819744, -1.073048, -0.4321226, 0.2431373, 1, 0, 1,
-0.4785427, 0.7775302, -1.131485, 0.2352941, 1, 0, 1,
-0.4784333, -0.299863, -2.163778, 0.2313726, 1, 0, 1,
-0.4774491, 1.012711, 0.01017342, 0.2235294, 1, 0, 1,
-0.4766125, 1.800222, -1.608358, 0.2196078, 1, 0, 1,
-0.4725566, 0.2326304, 1.014397, 0.2117647, 1, 0, 1,
-0.4693427, 0.7761379, -0.7651688, 0.2078431, 1, 0, 1,
-0.4657052, -0.4779138, -3.622962, 0.2, 1, 0, 1,
-0.4579394, -1.0265, -2.855988, 0.1921569, 1, 0, 1,
-0.4565282, 0.1875455, -0.4185435, 0.1882353, 1, 0, 1,
-0.4562866, 0.320364, -1.836981, 0.1803922, 1, 0, 1,
-0.4513831, 0.1905151, -0.3575248, 0.1764706, 1, 0, 1,
-0.4452742, 0.4395115, -1.97601, 0.1686275, 1, 0, 1,
-0.437975, 0.1080224, -1.272093, 0.1647059, 1, 0, 1,
-0.43714, 0.6841557, 0.6379623, 0.1568628, 1, 0, 1,
-0.435298, 1.761888, 0.4904597, 0.1529412, 1, 0, 1,
-0.4328035, 2.065459, -1.224503, 0.145098, 1, 0, 1,
-0.4326853, -1.984055, -2.960145, 0.1411765, 1, 0, 1,
-0.4310663, 0.4767732, -0.9510763, 0.1333333, 1, 0, 1,
-0.4301197, -0.8030269, -3.066727, 0.1294118, 1, 0, 1,
-0.4264629, 0.3028373, -1.420205, 0.1215686, 1, 0, 1,
-0.4247711, 0.214189, -1.122247, 0.1176471, 1, 0, 1,
-0.4203711, 1.604818, -2.203821, 0.1098039, 1, 0, 1,
-0.4190587, -0.03815623, 0.2763481, 0.1058824, 1, 0, 1,
-0.4190484, -0.1197511, -2.864457, 0.09803922, 1, 0, 1,
-0.4165694, 0.391514, -1.540592, 0.09019608, 1, 0, 1,
-0.4148158, 0.876631, 0.6191061, 0.08627451, 1, 0, 1,
-0.409539, -0.07763007, -2.722113, 0.07843138, 1, 0, 1,
-0.4024515, 0.7629092, -0.612255, 0.07450981, 1, 0, 1,
-0.3988891, 0.6981801, 1.263984, 0.06666667, 1, 0, 1,
-0.3957222, 0.3499021, -0.6375437, 0.0627451, 1, 0, 1,
-0.3953842, -3.185654, -1.838346, 0.05490196, 1, 0, 1,
-0.3949211, -1.26345, -1.983279, 0.05098039, 1, 0, 1,
-0.3925028, -2.262044, -3.567981, 0.04313726, 1, 0, 1,
-0.3907559, 0.3602871, -2.570976, 0.03921569, 1, 0, 1,
-0.3886356, -0.1199278, -1.703722, 0.03137255, 1, 0, 1,
-0.3864321, 0.08108322, -0.9101483, 0.02745098, 1, 0, 1,
-0.384924, -1.226733, -1.975848, 0.01960784, 1, 0, 1,
-0.3843806, -1.048416, -2.927731, 0.01568628, 1, 0, 1,
-0.3816889, 0.6021185, -2.2961, 0.007843138, 1, 0, 1,
-0.3816656, 1.518065, 1.115427, 0.003921569, 1, 0, 1,
-0.379912, 0.5846257, -0.6763542, 0, 1, 0.003921569, 1,
-0.3797241, 0.08545262, -0.05146771, 0, 1, 0.01176471, 1,
-0.3769352, 0.602692, -2.539763, 0, 1, 0.01568628, 1,
-0.3750183, 0.1742227, -1.845287, 0, 1, 0.02352941, 1,
-0.3668177, 0.6443837, -0.7268466, 0, 1, 0.02745098, 1,
-0.3660826, 0.246269, -1.485575, 0, 1, 0.03529412, 1,
-0.3648134, 1.106268, -1.224097, 0, 1, 0.03921569, 1,
-0.3606645, -0.3327027, -2.54027, 0, 1, 0.04705882, 1,
-0.3602243, 0.02248619, -1.226066, 0, 1, 0.05098039, 1,
-0.3542108, -1.216619, -2.949791, 0, 1, 0.05882353, 1,
-0.3498414, -0.7969701, -1.717027, 0, 1, 0.0627451, 1,
-0.3483831, -1.504454, -1.67732, 0, 1, 0.07058824, 1,
-0.3440549, -1.895143, -3.496505, 0, 1, 0.07450981, 1,
-0.3413622, 0.1219303, -0.2748344, 0, 1, 0.08235294, 1,
-0.3401156, -1.094957, -4.255734, 0, 1, 0.08627451, 1,
-0.3393587, 0.7584328, -0.5889288, 0, 1, 0.09411765, 1,
-0.3379553, 2.62257, -0.6381048, 0, 1, 0.1019608, 1,
-0.3372443, -0.01462644, -2.746949, 0, 1, 0.1058824, 1,
-0.337145, -1.454461, -2.044132, 0, 1, 0.1137255, 1,
-0.3286004, 0.4795392, 0.689477, 0, 1, 0.1176471, 1,
-0.3278622, -0.745152, -4.130667, 0, 1, 0.1254902, 1,
-0.323482, -0.1676475, -1.870949, 0, 1, 0.1294118, 1,
-0.3175605, 0.6931713, -2.361274, 0, 1, 0.1372549, 1,
-0.3168362, -1.609952, -3.560853, 0, 1, 0.1411765, 1,
-0.3033957, 0.05622592, -2.103086, 0, 1, 0.1490196, 1,
-0.3023026, 0.565584, -0.7222669, 0, 1, 0.1529412, 1,
-0.2916823, 0.2485886, -0.4919668, 0, 1, 0.1607843, 1,
-0.2859082, -1.029885, -4.779645, 0, 1, 0.1647059, 1,
-0.2848055, -0.3496279, -1.584933, 0, 1, 0.172549, 1,
-0.2833429, 0.9295573, 0.2655641, 0, 1, 0.1764706, 1,
-0.2806883, -0.9659669, -3.097884, 0, 1, 0.1843137, 1,
-0.2766544, 0.9840418, -1.464373, 0, 1, 0.1882353, 1,
-0.2732894, 1.437817, -0.1794879, 0, 1, 0.1960784, 1,
-0.2723759, 0.7735359, -0.2786222, 0, 1, 0.2039216, 1,
-0.2722189, 0.2345238, -1.842075, 0, 1, 0.2078431, 1,
-0.2713945, -0.1278076, -1.361908, 0, 1, 0.2156863, 1,
-0.2663032, 0.1537932, -2.502951, 0, 1, 0.2196078, 1,
-0.2610356, 0.6888394, -1.429781, 0, 1, 0.227451, 1,
-0.2604909, 0.2552084, 0.192324, 0, 1, 0.2313726, 1,
-0.2581848, -0.4603215, -2.187335, 0, 1, 0.2392157, 1,
-0.256841, -0.2978965, -1.932462, 0, 1, 0.2431373, 1,
-0.2525301, -0.2704567, -1.353541, 0, 1, 0.2509804, 1,
-0.2474305, 0.4928558, -0.8973391, 0, 1, 0.254902, 1,
-0.2455372, -0.7822293, -2.31052, 0, 1, 0.2627451, 1,
-0.2424369, -0.0005751814, -1.150111, 0, 1, 0.2666667, 1,
-0.2379455, 0.8631842, -0.3257424, 0, 1, 0.2745098, 1,
-0.2369193, -0.4153464, -1.095436, 0, 1, 0.2784314, 1,
-0.2364925, -0.6647087, -1.86155, 0, 1, 0.2862745, 1,
-0.2360587, -1.176615, -5.981791, 0, 1, 0.2901961, 1,
-0.2353761, 0.2602969, -0.9065327, 0, 1, 0.2980392, 1,
-0.2216125, 0.6942051, 0.2475046, 0, 1, 0.3058824, 1,
-0.2215727, -0.931617, -2.624526, 0, 1, 0.3098039, 1,
-0.2179589, 0.5297011, -0.1024444, 0, 1, 0.3176471, 1,
-0.2136082, 0.5812331, -0.1504633, 0, 1, 0.3215686, 1,
-0.2134223, -1.170086, -3.570593, 0, 1, 0.3294118, 1,
-0.2112357, 0.2002243, -0.8578964, 0, 1, 0.3333333, 1,
-0.2038184, 1.703102, -0.6624649, 0, 1, 0.3411765, 1,
-0.2036611, 1.371854, -2.451155, 0, 1, 0.345098, 1,
-0.2020235, -0.5104337, -1.425435, 0, 1, 0.3529412, 1,
-0.1988335, 0.5038107, -0.2249459, 0, 1, 0.3568628, 1,
-0.1946909, 1.308388, 0.7135645, 0, 1, 0.3647059, 1,
-0.193708, -1.233142, -1.603817, 0, 1, 0.3686275, 1,
-0.1915906, 1.14452, 0.9832492, 0, 1, 0.3764706, 1,
-0.1903615, -0.3664477, -2.833593, 0, 1, 0.3803922, 1,
-0.1895768, 1.122733, -0.6944791, 0, 1, 0.3882353, 1,
-0.1875076, -1.063636, -5.327993, 0, 1, 0.3921569, 1,
-0.1827132, 0.2845193, -0.9666944, 0, 1, 0.4, 1,
-0.1823824, 0.8736567, -1.336399, 0, 1, 0.4078431, 1,
-0.1807609, -1.362895, -3.307225, 0, 1, 0.4117647, 1,
-0.1787806, 0.03780553, 0.001398266, 0, 1, 0.4196078, 1,
-0.1780551, -1.223794, -2.303901, 0, 1, 0.4235294, 1,
-0.174602, 0.7975101, -0.3783386, 0, 1, 0.4313726, 1,
-0.1717491, 0.2765376, 0.355163, 0, 1, 0.4352941, 1,
-0.1709609, 0.5484939, -0.4368721, 0, 1, 0.4431373, 1,
-0.1708886, -0.2638888, -4.12317, 0, 1, 0.4470588, 1,
-0.1687191, 0.1069366, -0.38283, 0, 1, 0.454902, 1,
-0.16859, 0.5762835, -0.5330041, 0, 1, 0.4588235, 1,
-0.1658028, 0.1062482, -1.991455, 0, 1, 0.4666667, 1,
-0.1657218, -0.1321188, -3.079536, 0, 1, 0.4705882, 1,
-0.1646623, -0.2720214, -2.542559, 0, 1, 0.4784314, 1,
-0.1645083, 1.685939, 0.1073299, 0, 1, 0.4823529, 1,
-0.1639448, 1.698897, 0.2804601, 0, 1, 0.4901961, 1,
-0.1590264, -0.3424125, -2.215181, 0, 1, 0.4941176, 1,
-0.1578245, -0.7641153, -1.441728, 0, 1, 0.5019608, 1,
-0.146918, 0.005382902, -2.195587, 0, 1, 0.509804, 1,
-0.1447154, 0.8211945, 0.8694777, 0, 1, 0.5137255, 1,
-0.1423433, -0.092167, -2.390154, 0, 1, 0.5215687, 1,
-0.1399285, 0.2809076, -2.157238, 0, 1, 0.5254902, 1,
-0.135646, 0.6878519, -0.8091465, 0, 1, 0.5333334, 1,
-0.135149, 1.07182, -0.3458817, 0, 1, 0.5372549, 1,
-0.1342402, 0.794983, -1.315706, 0, 1, 0.5450981, 1,
-0.130552, -0.5419644, -2.170312, 0, 1, 0.5490196, 1,
-0.1241064, 1.0579, -0.4306049, 0, 1, 0.5568628, 1,
-0.1232759, 0.5450693, -0.336995, 0, 1, 0.5607843, 1,
-0.1216789, -0.186047, -3.709253, 0, 1, 0.5686275, 1,
-0.119945, 1.277179, 1.736232, 0, 1, 0.572549, 1,
-0.1198744, 1.446965, -0.6527684, 0, 1, 0.5803922, 1,
-0.1099213, -0.7256492, -2.607622, 0, 1, 0.5843138, 1,
-0.1093942, -1.745844, -2.313348, 0, 1, 0.5921569, 1,
-0.1029821, -0.7545655, -2.570311, 0, 1, 0.5960785, 1,
-0.1026374, 1.488569, -0.2817721, 0, 1, 0.6039216, 1,
-0.09997158, 0.2068727, -0.1054088, 0, 1, 0.6117647, 1,
-0.09657209, 2.271947, -1.662282, 0, 1, 0.6156863, 1,
-0.09515686, 1.112482, 1.242628, 0, 1, 0.6235294, 1,
-0.09327248, 0.7030415, 0.5293682, 0, 1, 0.627451, 1,
-0.09190835, -0.009762727, -0.7615654, 0, 1, 0.6352941, 1,
-0.09088991, -1.087994, -2.456115, 0, 1, 0.6392157, 1,
-0.09003527, -1.047227, -4.417057, 0, 1, 0.6470588, 1,
-0.08540868, -0.8270035, -3.526711, 0, 1, 0.6509804, 1,
-0.08501941, -0.7905365, -4.015384, 0, 1, 0.6588235, 1,
-0.08459117, 0.04004666, -1.157004, 0, 1, 0.6627451, 1,
-0.08332911, 0.05690553, -1.85409, 0, 1, 0.6705883, 1,
-0.07956015, -0.4186126, -1.982411, 0, 1, 0.6745098, 1,
-0.07933414, -0.4466023, -3.679335, 0, 1, 0.682353, 1,
-0.07916985, -0.1726663, -2.283192, 0, 1, 0.6862745, 1,
-0.07876267, 1.537642, -1.172558, 0, 1, 0.6941177, 1,
-0.07642708, -0.7547304, -3.899899, 0, 1, 0.7019608, 1,
-0.07638618, 0.1273323, 1.115161, 0, 1, 0.7058824, 1,
-0.07493614, 2.161403, 0.7246227, 0, 1, 0.7137255, 1,
-0.07371736, 0.7268953, -0.2451375, 0, 1, 0.7176471, 1,
-0.07354476, 0.4752631, -2.064392, 0, 1, 0.7254902, 1,
-0.07148846, 0.6984115, -0.4894335, 0, 1, 0.7294118, 1,
-0.06922257, 0.4309104, -0.02685973, 0, 1, 0.7372549, 1,
-0.0673961, -0.6270247, -1.957467, 0, 1, 0.7411765, 1,
-0.06527638, 2.193949, -1.679488, 0, 1, 0.7490196, 1,
-0.0634774, 1.529837, 0.1652091, 0, 1, 0.7529412, 1,
-0.06226927, -0.7938457, -3.277857, 0, 1, 0.7607843, 1,
-0.06155921, 0.7448615, -2.20407, 0, 1, 0.7647059, 1,
-0.0550644, -0.9654945, -2.351166, 0, 1, 0.772549, 1,
-0.04489664, -0.416124, -2.701841, 0, 1, 0.7764706, 1,
-0.04418541, 1.847658, 0.5944875, 0, 1, 0.7843137, 1,
-0.04047228, 0.07343526, -0.6924841, 0, 1, 0.7882353, 1,
-0.03170397, -0.7963468, -3.122231, 0, 1, 0.7960784, 1,
-0.03038567, -1.071838, -1.598257, 0, 1, 0.8039216, 1,
-0.02646183, 2.263802, 0.5850891, 0, 1, 0.8078431, 1,
-0.02461019, -1.060543, -4.755252, 0, 1, 0.8156863, 1,
-0.02278628, -0.199965, -2.946656, 0, 1, 0.8196079, 1,
-0.01966191, -2.475526, -4.43772, 0, 1, 0.827451, 1,
-0.01934919, 0.3703871, 1.280666, 0, 1, 0.8313726, 1,
-0.01866862, -0.7148747, -3.078895, 0, 1, 0.8392157, 1,
-0.01360748, -0.2614924, -5.098829, 0, 1, 0.8431373, 1,
-0.01107119, -1.837895, -1.441696, 0, 1, 0.8509804, 1,
-0.003709755, -0.05229792, -5.508666, 0, 1, 0.854902, 1,
-0.002182268, 0.4841373, -1.169604, 0, 1, 0.8627451, 1,
0.003739708, -1.995224, 3.193193, 0, 1, 0.8666667, 1,
0.01512859, -0.1046346, 2.991885, 0, 1, 0.8745098, 1,
0.01938062, 0.9016533, 1.124125, 0, 1, 0.8784314, 1,
0.02078922, 2.745309, -0.6705283, 0, 1, 0.8862745, 1,
0.02547299, 0.534888, 0.3782538, 0, 1, 0.8901961, 1,
0.02717888, -0.3135183, 3.205028, 0, 1, 0.8980392, 1,
0.03631531, 1.555682, 1.02885, 0, 1, 0.9058824, 1,
0.03702551, 0.2318535, 0.2931543, 0, 1, 0.9098039, 1,
0.04035262, -0.950074, 2.389766, 0, 1, 0.9176471, 1,
0.04087723, -0.9098972, 4.062021, 0, 1, 0.9215686, 1,
0.04321388, -1.289937, 1.956521, 0, 1, 0.9294118, 1,
0.04816926, 0.6523395, -0.001381443, 0, 1, 0.9333333, 1,
0.05026598, 1.736439, 1.91538, 0, 1, 0.9411765, 1,
0.05115312, 1.285567, -1.407181, 0, 1, 0.945098, 1,
0.05597506, -0.6657235, 3.282958, 0, 1, 0.9529412, 1,
0.05940087, -0.7079888, -0.3663545, 0, 1, 0.9568627, 1,
0.05950367, 0.6567706, -0.4549441, 0, 1, 0.9647059, 1,
0.06142122, -2.299132, 3.099858, 0, 1, 0.9686275, 1,
0.06211135, 1.175819, 1.801762, 0, 1, 0.9764706, 1,
0.06282959, 0.5159127, -0.4284748, 0, 1, 0.9803922, 1,
0.06417073, 0.5883659, 0.007533573, 0, 1, 0.9882353, 1,
0.06749687, 0.3750609, 2.277328, 0, 1, 0.9921569, 1,
0.07247869, 0.2592832, 0.4662717, 0, 1, 1, 1,
0.07256689, -1.037186, 2.911014, 0, 0.9921569, 1, 1,
0.07331534, 0.2376958, 1.680048, 0, 0.9882353, 1, 1,
0.07371545, 2.203638, -0.6422404, 0, 0.9803922, 1, 1,
0.07421614, 1.036679, -1.00076, 0, 0.9764706, 1, 1,
0.08025675, -0.7634962, 3.353683, 0, 0.9686275, 1, 1,
0.08340456, 0.9873545, -0.4344998, 0, 0.9647059, 1, 1,
0.08358743, 0.1864424, 0.805132, 0, 0.9568627, 1, 1,
0.086496, -0.4822097, 4.278752, 0, 0.9529412, 1, 1,
0.08950145, -1.816737, 0.8964859, 0, 0.945098, 1, 1,
0.09068379, 2.035085, -1.477863, 0, 0.9411765, 1, 1,
0.09346822, -1.522523, 2.476685, 0, 0.9333333, 1, 1,
0.09468237, 1.218418, 0.07099833, 0, 0.9294118, 1, 1,
0.09584805, 0.930886, -0.4090295, 0, 0.9215686, 1, 1,
0.1046478, 0.7670605, -0.5830693, 0, 0.9176471, 1, 1,
0.1054917, 1.099467, 0.1248007, 0, 0.9098039, 1, 1,
0.1063347, -0.9782874, 2.757268, 0, 0.9058824, 1, 1,
0.1066739, -2.006821, 1.7908, 0, 0.8980392, 1, 1,
0.1072436, -0.7126456, 2.704851, 0, 0.8901961, 1, 1,
0.1125151, -0.4128884, 3.852282, 0, 0.8862745, 1, 1,
0.1132587, -1.138529, 3.891198, 0, 0.8784314, 1, 1,
0.1134362, -0.08376994, 2.742568, 0, 0.8745098, 1, 1,
0.1135128, -0.9785693, 1.103871, 0, 0.8666667, 1, 1,
0.1218814, 0.1847675, -0.9219347, 0, 0.8627451, 1, 1,
0.1243204, -0.2997745, 3.151694, 0, 0.854902, 1, 1,
0.1244128, -0.4844544, 1.967089, 0, 0.8509804, 1, 1,
0.1251847, -0.3265661, 2.687042, 0, 0.8431373, 1, 1,
0.1261659, -1.042342, 4.0532, 0, 0.8392157, 1, 1,
0.1269784, 0.3889096, 0.3431761, 0, 0.8313726, 1, 1,
0.127206, 0.1430947, -0.5110145, 0, 0.827451, 1, 1,
0.1285427, -0.9422958, 2.483094, 0, 0.8196079, 1, 1,
0.1308544, -2.431886, 1.686628, 0, 0.8156863, 1, 1,
0.1315825, 0.5416499, 2.034522, 0, 0.8078431, 1, 1,
0.1376542, 0.6012868, 1.501288, 0, 0.8039216, 1, 1,
0.1387649, -1.459993, 1.917513, 0, 0.7960784, 1, 1,
0.1510474, 1.286218, 0.4389907, 0, 0.7882353, 1, 1,
0.1580484, 0.07817673, 1.970431, 0, 0.7843137, 1, 1,
0.1584836, -1.113202, 2.860018, 0, 0.7764706, 1, 1,
0.1595251, -0.3636788, 4.192505, 0, 0.772549, 1, 1,
0.1596144, -0.1975167, 2.51035, 0, 0.7647059, 1, 1,
0.1618467, -0.7969265, 2.121845, 0, 0.7607843, 1, 1,
0.1635537, 0.8134056, -0.8888322, 0, 0.7529412, 1, 1,
0.1638079, -0.6158273, 3.728169, 0, 0.7490196, 1, 1,
0.165039, 0.9079518, 0.5640748, 0, 0.7411765, 1, 1,
0.1655159, 1.259251, 0.410219, 0, 0.7372549, 1, 1,
0.1758116, 1.449707, -0.8249249, 0, 0.7294118, 1, 1,
0.177072, 0.5798293, 0.5109452, 0, 0.7254902, 1, 1,
0.1818099, 0.616375, 1.515545, 0, 0.7176471, 1, 1,
0.1822448, 1.139851, -0.9010432, 0, 0.7137255, 1, 1,
0.1841459, 0.2199111, -0.3920834, 0, 0.7058824, 1, 1,
0.1857644, -0.9788718, 3.634444, 0, 0.6980392, 1, 1,
0.1931671, 1.261243, -0.3858301, 0, 0.6941177, 1, 1,
0.1956333, 0.4800074, -0.6129465, 0, 0.6862745, 1, 1,
0.1968302, 0.5659658, -0.8329717, 0, 0.682353, 1, 1,
0.2031299, 0.3389699, 1.20971, 0, 0.6745098, 1, 1,
0.207403, 0.1685054, 0.09426881, 0, 0.6705883, 1, 1,
0.2140786, -1.009919, 1.388902, 0, 0.6627451, 1, 1,
0.2146923, 0.7240468, -0.2444479, 0, 0.6588235, 1, 1,
0.2194105, 0.1480996, -0.4425945, 0, 0.6509804, 1, 1,
0.2196093, -0.9066846, 2.693164, 0, 0.6470588, 1, 1,
0.2227809, -1.460862, 2.421472, 0, 0.6392157, 1, 1,
0.2322794, 1.625372, 1.529051, 0, 0.6352941, 1, 1,
0.2398977, -0.8411846, 2.162721, 0, 0.627451, 1, 1,
0.2419576, 1.550567, 1.10771, 0, 0.6235294, 1, 1,
0.2464055, 0.09080236, -0.3734132, 0, 0.6156863, 1, 1,
0.2479794, -0.5477637, 2.747013, 0, 0.6117647, 1, 1,
0.2497369, 0.4766861, 1.535327, 0, 0.6039216, 1, 1,
0.2563482, 0.3630023, 0.957397, 0, 0.5960785, 1, 1,
0.2577379, 0.355902, 1.229549, 0, 0.5921569, 1, 1,
0.2643843, 1.403666, 1.332553, 0, 0.5843138, 1, 1,
0.264442, -0.07448321, 1.808689, 0, 0.5803922, 1, 1,
0.2661348, -0.7689475, 2.412495, 0, 0.572549, 1, 1,
0.2661876, 0.4772418, 0.8365982, 0, 0.5686275, 1, 1,
0.2672727, -0.3709659, 2.341805, 0, 0.5607843, 1, 1,
0.2681437, -1.024181, 2.66199, 0, 0.5568628, 1, 1,
0.2713814, 0.8855173, 0.8000914, 0, 0.5490196, 1, 1,
0.2725461, 0.3304738, 1.265867, 0, 0.5450981, 1, 1,
0.2751287, -0.2872072, 3.557245, 0, 0.5372549, 1, 1,
0.2777981, -0.9052773, 2.944206, 0, 0.5333334, 1, 1,
0.2817968, -0.9166562, 2.403884, 0, 0.5254902, 1, 1,
0.282179, -0.8892177, 2.341654, 0, 0.5215687, 1, 1,
0.2864276, 0.2972181, 1.045337, 0, 0.5137255, 1, 1,
0.2869401, 0.3470448, -0.3089192, 0, 0.509804, 1, 1,
0.2970487, -1.710356, 1.313311, 0, 0.5019608, 1, 1,
0.3016855, -1.032428, 4.23652, 0, 0.4941176, 1, 1,
0.3028916, -0.8630339, 3.745447, 0, 0.4901961, 1, 1,
0.306977, -1.225579, 3.028702, 0, 0.4823529, 1, 1,
0.3085275, -0.1643925, 4.260325, 0, 0.4784314, 1, 1,
0.3110563, -0.3577811, 2.725525, 0, 0.4705882, 1, 1,
0.3166671, 0.694638, 2.948866, 0, 0.4666667, 1, 1,
0.3172004, -0.582494, 3.017527, 0, 0.4588235, 1, 1,
0.3229097, -1.152205, 2.556115, 0, 0.454902, 1, 1,
0.3245839, -2.008553, 2.52922, 0, 0.4470588, 1, 1,
0.3257641, 0.3819882, 2.062763, 0, 0.4431373, 1, 1,
0.3303323, 0.5132193, 0.8949356, 0, 0.4352941, 1, 1,
0.3327449, 1.288275, -0.3112823, 0, 0.4313726, 1, 1,
0.3341802, -1.127182, 4.659355, 0, 0.4235294, 1, 1,
0.3343397, -0.5767201, 3.479135, 0, 0.4196078, 1, 1,
0.3348567, 0.3533062, 2.230241, 0, 0.4117647, 1, 1,
0.3351099, 0.05147725, 1.10884, 0, 0.4078431, 1, 1,
0.3364221, -0.3113135, 2.084918, 0, 0.4, 1, 1,
0.3366387, -1.012705, 3.822404, 0, 0.3921569, 1, 1,
0.3380745, -2.006205, 3.302753, 0, 0.3882353, 1, 1,
0.340512, -1.536506, 1.95999, 0, 0.3803922, 1, 1,
0.340572, 0.007059996, 1.527922, 0, 0.3764706, 1, 1,
0.3411665, 2.490788, -0.3593145, 0, 0.3686275, 1, 1,
0.3434685, -0.2604333, 2.052998, 0, 0.3647059, 1, 1,
0.3453852, -0.3002309, 2.899488, 0, 0.3568628, 1, 1,
0.3459422, -0.320087, 4.0072, 0, 0.3529412, 1, 1,
0.3475025, -1.464492, 4.747571, 0, 0.345098, 1, 1,
0.3481439, 0.6348142, 0.6022626, 0, 0.3411765, 1, 1,
0.3486173, -0.4162906, 2.87166, 0, 0.3333333, 1, 1,
0.349561, 0.8608508, 0.5020011, 0, 0.3294118, 1, 1,
0.3499616, -0.6834813, 2.523257, 0, 0.3215686, 1, 1,
0.3501154, 1.747637, -0.5155103, 0, 0.3176471, 1, 1,
0.3503751, 0.8915923, -0.06874306, 0, 0.3098039, 1, 1,
0.3504672, -1.517852, 1.470531, 0, 0.3058824, 1, 1,
0.3510289, -0.1771234, 2.498184, 0, 0.2980392, 1, 1,
0.3525136, 1.163517, -0.511, 0, 0.2901961, 1, 1,
0.3528501, -1.281368, 4.266355, 0, 0.2862745, 1, 1,
0.3533062, 1.49393, -0.08057681, 0, 0.2784314, 1, 1,
0.3538889, -0.4657197, 0.8742095, 0, 0.2745098, 1, 1,
0.3575527, -0.2579979, 2.564616, 0, 0.2666667, 1, 1,
0.3576207, 1.641855, 0.003293809, 0, 0.2627451, 1, 1,
0.3582233, 0.2067141, 0.4089944, 0, 0.254902, 1, 1,
0.359605, 0.2532839, 1.667954, 0, 0.2509804, 1, 1,
0.3680393, -1.154893, 3.506712, 0, 0.2431373, 1, 1,
0.3709861, 0.6624995, 1.158803, 0, 0.2392157, 1, 1,
0.371045, -1.209767, 3.164264, 0, 0.2313726, 1, 1,
0.3734471, 1.190829, -0.1489264, 0, 0.227451, 1, 1,
0.374563, 0.1449979, 1.331344, 0, 0.2196078, 1, 1,
0.3774598, -0.522424, 3.091657, 0, 0.2156863, 1, 1,
0.3786776, -0.6623847, 3.155497, 0, 0.2078431, 1, 1,
0.379628, 0.8515639, -0.4452338, 0, 0.2039216, 1, 1,
0.3800555, -1.561442, 1.610431, 0, 0.1960784, 1, 1,
0.3823574, 0.7790861, 1.555275, 0, 0.1882353, 1, 1,
0.392845, -0.5405425, 3.05522, 0, 0.1843137, 1, 1,
0.3954231, -2.076002, 3.969723, 0, 0.1764706, 1, 1,
0.3975897, -0.3850278, 3.554236, 0, 0.172549, 1, 1,
0.4015127, 0.7582257, -1.138227, 0, 0.1647059, 1, 1,
0.4016229, 0.3694443, 1.306162, 0, 0.1607843, 1, 1,
0.4028493, -0.9599291, 2.909001, 0, 0.1529412, 1, 1,
0.4052336, 0.7528077, 1.290538, 0, 0.1490196, 1, 1,
0.4179413, 0.3299317, 0.7202151, 0, 0.1411765, 1, 1,
0.4198484, 0.757894, 0.9623226, 0, 0.1372549, 1, 1,
0.4223294, -1.258626, 2.076011, 0, 0.1294118, 1, 1,
0.4246868, 1.491229, 1.166971, 0, 0.1254902, 1, 1,
0.4252977, 1.116745, 0.1417693, 0, 0.1176471, 1, 1,
0.4256286, 0.7382345, 0.1752654, 0, 0.1137255, 1, 1,
0.427183, 0.9166591, 1.371817, 0, 0.1058824, 1, 1,
0.4282725, 0.5262074, -0.02845816, 0, 0.09803922, 1, 1,
0.42898, 0.5816599, 0.06939519, 0, 0.09411765, 1, 1,
0.4299401, -0.216832, 1.35177, 0, 0.08627451, 1, 1,
0.4344857, -1.290507, 3.334184, 0, 0.08235294, 1, 1,
0.4360576, -0.523167, 2.427692, 0, 0.07450981, 1, 1,
0.4371471, 0.1649331, 2.761027, 0, 0.07058824, 1, 1,
0.4431988, -1.502898, 1.443315, 0, 0.0627451, 1, 1,
0.4449205, 0.1520798, -0.04405759, 0, 0.05882353, 1, 1,
0.4457445, -1.148611, 3.036538, 0, 0.05098039, 1, 1,
0.4476756, 1.369979, -0.3852667, 0, 0.04705882, 1, 1,
0.4482486, -0.003720597, 2.468122, 0, 0.03921569, 1, 1,
0.4519374, -0.9937052, 1.606237, 0, 0.03529412, 1, 1,
0.4520088, 0.1327162, 1.348323, 0, 0.02745098, 1, 1,
0.4584894, -0.5673649, 2.119164, 0, 0.02352941, 1, 1,
0.4673287, 2.51354, -0.5135621, 0, 0.01568628, 1, 1,
0.4720263, -0.3364863, 1.317064, 0, 0.01176471, 1, 1,
0.4750777, -1.129295, 2.630028, 0, 0.003921569, 1, 1,
0.4756774, 0.3573311, 2.591141, 0.003921569, 0, 1, 1,
0.4769342, -0.08460711, -0.8127554, 0.007843138, 0, 1, 1,
0.4815007, 0.6653655, -0.4483505, 0.01568628, 0, 1, 1,
0.4842713, -0.440338, 1.056738, 0.01960784, 0, 1, 1,
0.4873852, 0.165766, 0.8020668, 0.02745098, 0, 1, 1,
0.4899996, 0.742831, -0.1659013, 0.03137255, 0, 1, 1,
0.492005, -0.8768116, 2.973073, 0.03921569, 0, 1, 1,
0.4941767, 0.9410771, 1.798245, 0.04313726, 0, 1, 1,
0.5092925, -0.3662437, 3.657201, 0.05098039, 0, 1, 1,
0.5103251, 0.4487494, 1.008633, 0.05490196, 0, 1, 1,
0.5123211, -0.4387983, 0.1175678, 0.0627451, 0, 1, 1,
0.5170989, -0.1292432, 1.298988, 0.06666667, 0, 1, 1,
0.5210025, -0.6103585, 2.896274, 0.07450981, 0, 1, 1,
0.5226425, 0.189885, 1.450438, 0.07843138, 0, 1, 1,
0.5246278, 1.622904, 0.3709708, 0.08627451, 0, 1, 1,
0.5271884, -0.292646, 0.6907858, 0.09019608, 0, 1, 1,
0.528014, -0.412309, 1.653499, 0.09803922, 0, 1, 1,
0.5345849, -0.1810532, 1.657226, 0.1058824, 0, 1, 1,
0.5371941, -0.5009208, 3.15595, 0.1098039, 0, 1, 1,
0.5380636, 1.387589, -0.3373984, 0.1176471, 0, 1, 1,
0.5385489, 0.8018149, 2.148247, 0.1215686, 0, 1, 1,
0.5487671, 0.3507124, 0.9810662, 0.1294118, 0, 1, 1,
0.5489994, -0.8919567, 3.77778, 0.1333333, 0, 1, 1,
0.5504173, 1.228327, -0.9458433, 0.1411765, 0, 1, 1,
0.5549716, 0.8753493, 1.57099, 0.145098, 0, 1, 1,
0.55585, 0.430911, 0.2373309, 0.1529412, 0, 1, 1,
0.559697, 0.4480237, 1.970307, 0.1568628, 0, 1, 1,
0.570952, 0.03838299, 2.582905, 0.1647059, 0, 1, 1,
0.5712593, 0.8008398, -0.5631854, 0.1686275, 0, 1, 1,
0.5737491, -2.021572, 3.892603, 0.1764706, 0, 1, 1,
0.5738775, -0.5850806, 2.908765, 0.1803922, 0, 1, 1,
0.5776194, 0.03379411, 2.688859, 0.1882353, 0, 1, 1,
0.5873848, 0.9735766, 0.164327, 0.1921569, 0, 1, 1,
0.5899692, 0.1815295, 1.205723, 0.2, 0, 1, 1,
0.5907933, -0.3881851, 1.182968, 0.2078431, 0, 1, 1,
0.593228, -0.01397196, 2.29797, 0.2117647, 0, 1, 1,
0.5997618, 1.504002, 0.6350194, 0.2196078, 0, 1, 1,
0.6006753, -0.2329894, 2.394771, 0.2235294, 0, 1, 1,
0.6090729, 0.1402029, 0.7849516, 0.2313726, 0, 1, 1,
0.6163895, -0.06598376, 1.190689, 0.2352941, 0, 1, 1,
0.6193708, -1.958802, 3.167762, 0.2431373, 0, 1, 1,
0.6226717, -1.191196, 2.575152, 0.2470588, 0, 1, 1,
0.6250658, -0.8493593, 2.311117, 0.254902, 0, 1, 1,
0.6265546, 1.295741, 0.4726412, 0.2588235, 0, 1, 1,
0.6266708, -0.07483035, 2.438401, 0.2666667, 0, 1, 1,
0.6280181, -0.3413196, -0.007517665, 0.2705882, 0, 1, 1,
0.6318014, 0.7951536, 0.6765048, 0.2784314, 0, 1, 1,
0.6372589, -0.2117602, 1.74688, 0.282353, 0, 1, 1,
0.6376713, -0.5125799, 1.733563, 0.2901961, 0, 1, 1,
0.6429096, -0.7641771, 1.511957, 0.2941177, 0, 1, 1,
0.6444547, 0.473113, 0.5993093, 0.3019608, 0, 1, 1,
0.6468732, 0.6785282, 0.9563797, 0.3098039, 0, 1, 1,
0.6494299, 0.2640388, 1.13081, 0.3137255, 0, 1, 1,
0.65196, 1.087337, -0.8819649, 0.3215686, 0, 1, 1,
0.6524802, 0.6607476, -0.6381429, 0.3254902, 0, 1, 1,
0.6600319, -0.09679257, 1.80068, 0.3333333, 0, 1, 1,
0.6626471, 0.1863339, 1.5966, 0.3372549, 0, 1, 1,
0.6678978, -0.209276, 2.989007, 0.345098, 0, 1, 1,
0.6697599, -0.991105, 3.826, 0.3490196, 0, 1, 1,
0.6754409, -0.3480249, 1.492756, 0.3568628, 0, 1, 1,
0.6774155, -1.479421, 2.983065, 0.3607843, 0, 1, 1,
0.6818141, -0.7214445, 2.752192, 0.3686275, 0, 1, 1,
0.6888179, 0.8478829, 1.975456, 0.372549, 0, 1, 1,
0.6908385, 0.4035217, -0.3065776, 0.3803922, 0, 1, 1,
0.6913661, -1.021008, 2.928615, 0.3843137, 0, 1, 1,
0.6920897, -0.4358362, 3.689126, 0.3921569, 0, 1, 1,
0.6921509, -0.5931255, 3.167051, 0.3960784, 0, 1, 1,
0.6935208, 0.4425191, 1.743269, 0.4039216, 0, 1, 1,
0.6990349, 0.2341206, 2.100712, 0.4117647, 0, 1, 1,
0.7062359, -0.5215828, 1.182254, 0.4156863, 0, 1, 1,
0.7081679, 0.08393133, 2.231458, 0.4235294, 0, 1, 1,
0.7116285, 1.208359, 1.162538, 0.427451, 0, 1, 1,
0.7122993, 1.13177, 1.330189, 0.4352941, 0, 1, 1,
0.7145514, -1.466257, 3.253525, 0.4392157, 0, 1, 1,
0.7149534, 0.118796, 0.7040012, 0.4470588, 0, 1, 1,
0.7166292, 1.388466, 1.191664, 0.4509804, 0, 1, 1,
0.7168795, 0.7838703, 0.7643876, 0.4588235, 0, 1, 1,
0.717462, 0.3061243, 2.944867, 0.4627451, 0, 1, 1,
0.726422, -0.9440879, 2.731992, 0.4705882, 0, 1, 1,
0.7311155, -0.6302509, 2.224225, 0.4745098, 0, 1, 1,
0.733951, -0.6531621, 1.041474, 0.4823529, 0, 1, 1,
0.7354969, -0.3784675, -0.5516251, 0.4862745, 0, 1, 1,
0.7376861, 0.4629216, 1.313449, 0.4941176, 0, 1, 1,
0.7408424, -0.944501, 2.24263, 0.5019608, 0, 1, 1,
0.7482274, 1.931625, 0.8134676, 0.5058824, 0, 1, 1,
0.7494442, -0.9147514, 2.687345, 0.5137255, 0, 1, 1,
0.7502915, 0.5017028, -0.05666808, 0.5176471, 0, 1, 1,
0.7532005, 0.371628, 2.384889, 0.5254902, 0, 1, 1,
0.7568865, 1.505828, 1.566159, 0.5294118, 0, 1, 1,
0.7583002, 0.4106936, 0.4510364, 0.5372549, 0, 1, 1,
0.7596784, 0.6866851, 1.228293, 0.5411765, 0, 1, 1,
0.7605618, 0.1093309, 2.950283, 0.5490196, 0, 1, 1,
0.7608505, 0.1243345, 1.140836, 0.5529412, 0, 1, 1,
0.7693693, -0.9226779, 1.52363, 0.5607843, 0, 1, 1,
0.7720361, -0.9327193, 2.591083, 0.5647059, 0, 1, 1,
0.7731308, -0.767628, 2.468768, 0.572549, 0, 1, 1,
0.7765042, 0.5497866, 1.893685, 0.5764706, 0, 1, 1,
0.7780547, 0.4519687, 0.6014019, 0.5843138, 0, 1, 1,
0.7787898, -0.7523896, 0.9084094, 0.5882353, 0, 1, 1,
0.781163, 0.6339847, 1.262031, 0.5960785, 0, 1, 1,
0.7812432, -0.9789345, 1.855546, 0.6039216, 0, 1, 1,
0.7814411, 0.4806159, 1.300166, 0.6078432, 0, 1, 1,
0.7819026, 0.2619595, 1.546548, 0.6156863, 0, 1, 1,
0.7864423, 0.8754215, 1.233187, 0.6196079, 0, 1, 1,
0.787185, -0.1183329, 2.818194, 0.627451, 0, 1, 1,
0.7883095, 0.9671435, -0.2373923, 0.6313726, 0, 1, 1,
0.7883594, -1.798023, 1.69192, 0.6392157, 0, 1, 1,
0.7883734, -0.2130852, 3.234197, 0.6431373, 0, 1, 1,
0.7887784, -0.1854121, 0.7874686, 0.6509804, 0, 1, 1,
0.8003132, 0.1047024, 1.789773, 0.654902, 0, 1, 1,
0.8003361, -0.7194789, 2.365443, 0.6627451, 0, 1, 1,
0.8069613, 1.094241, 1.580308, 0.6666667, 0, 1, 1,
0.8105332, 0.1090773, 0.4752007, 0.6745098, 0, 1, 1,
0.8122079, -1.484767, 2.416489, 0.6784314, 0, 1, 1,
0.8134314, 1.040543, 0.9501668, 0.6862745, 0, 1, 1,
0.8237553, -0.5496098, 1.683702, 0.6901961, 0, 1, 1,
0.8250117, -0.1361815, 3.023594, 0.6980392, 0, 1, 1,
0.828179, -0.2672644, 1.84271, 0.7058824, 0, 1, 1,
0.8296325, -0.03336819, 2.244612, 0.7098039, 0, 1, 1,
0.8317699, 1.032926, -0.09254653, 0.7176471, 0, 1, 1,
0.8340469, 1.811185, 1.183796, 0.7215686, 0, 1, 1,
0.8391046, 0.0347357, 1.048536, 0.7294118, 0, 1, 1,
0.8404763, -0.4813114, 3.869313, 0.7333333, 0, 1, 1,
0.8404773, -1.223316, 4.243091, 0.7411765, 0, 1, 1,
0.8431367, 1.087442, 2.616171, 0.7450981, 0, 1, 1,
0.8462439, -0.7838789, 1.688075, 0.7529412, 0, 1, 1,
0.8473591, -0.6207507, 3.983427, 0.7568628, 0, 1, 1,
0.8505085, 1.572378, 0.9328917, 0.7647059, 0, 1, 1,
0.8520008, -0.1732931, 0.5778477, 0.7686275, 0, 1, 1,
0.8548231, -0.1578597, 1.318688, 0.7764706, 0, 1, 1,
0.8562742, -0.6239923, 3.851319, 0.7803922, 0, 1, 1,
0.8586218, -0.1400828, 1.813921, 0.7882353, 0, 1, 1,
0.8620986, 0.8456722, 2.544313, 0.7921569, 0, 1, 1,
0.8670681, 0.1551431, 0.1224431, 0.8, 0, 1, 1,
0.8689023, -0.1311979, 1.798389, 0.8078431, 0, 1, 1,
0.8754793, 0.4746305, 1.809926, 0.8117647, 0, 1, 1,
0.8767, 1.250391, -1.845773, 0.8196079, 0, 1, 1,
0.8768542, 0.6509235, 1.854555, 0.8235294, 0, 1, 1,
0.8806793, -0.1257619, 3.233784, 0.8313726, 0, 1, 1,
0.8827437, -0.4318428, 3.099447, 0.8352941, 0, 1, 1,
0.8834073, 1.054464, 0.8183371, 0.8431373, 0, 1, 1,
0.8842701, 0.6702376, 0.7877468, 0.8470588, 0, 1, 1,
0.8891389, -0.03513814, 1.396942, 0.854902, 0, 1, 1,
0.894436, -0.4638424, 0.1505568, 0.8588235, 0, 1, 1,
0.8989005, -0.5892627, 1.84022, 0.8666667, 0, 1, 1,
0.9018741, -0.5632302, 2.165024, 0.8705882, 0, 1, 1,
0.9055872, -1.141645, 1.22991, 0.8784314, 0, 1, 1,
0.9091619, 1.194798, 1.012274, 0.8823529, 0, 1, 1,
0.9103525, 0.538231, 1.761894, 0.8901961, 0, 1, 1,
0.9150416, 1.888432, 0.9172236, 0.8941177, 0, 1, 1,
0.9163613, -0.02051468, 0.8181832, 0.9019608, 0, 1, 1,
0.9203454, -1.175102, 3.272378, 0.9098039, 0, 1, 1,
0.9216425, 0.7373158, -0.04484499, 0.9137255, 0, 1, 1,
0.922648, 0.2396241, 0.2574989, 0.9215686, 0, 1, 1,
0.9234565, -2.431994, 1.777861, 0.9254902, 0, 1, 1,
0.9255879, 1.478292, 0.5841513, 0.9333333, 0, 1, 1,
0.9267013, 2.236354, -0.7220005, 0.9372549, 0, 1, 1,
0.9303666, -1.102149, 4.49569, 0.945098, 0, 1, 1,
0.9303849, 0.01999554, 3.145456, 0.9490196, 0, 1, 1,
0.9355476, -0.1263907, 0.9156457, 0.9568627, 0, 1, 1,
0.9359846, -0.5237538, 2.940463, 0.9607843, 0, 1, 1,
0.9404966, 1.708145, -0.2405168, 0.9686275, 0, 1, 1,
0.9446675, -0.8055527, 0.5471722, 0.972549, 0, 1, 1,
0.9499255, -0.7597877, 2.843463, 0.9803922, 0, 1, 1,
0.9523509, 1.222268, -0.1848216, 0.9843137, 0, 1, 1,
0.9524404, 0.8591949, 0.8419521, 0.9921569, 0, 1, 1,
0.9571767, 0.8071536, -0.07155613, 0.9960784, 0, 1, 1,
0.9613479, -1.285716, 2.72522, 1, 0, 0.9960784, 1,
0.9636174, -1.759068, 2.745835, 1, 0, 0.9882353, 1,
0.9655867, -0.003113898, -0.1909666, 1, 0, 0.9843137, 1,
0.967932, 0.8648786, 3.118507, 1, 0, 0.9764706, 1,
0.9714016, 0.0974398, 0.2830345, 1, 0, 0.972549, 1,
0.9721946, 0.146827, -0.05020254, 1, 0, 0.9647059, 1,
0.9731531, 0.4081271, 1.877116, 1, 0, 0.9607843, 1,
0.9761022, 0.06657779, 1.509267, 1, 0, 0.9529412, 1,
0.9767027, -0.5393197, 2.157808, 1, 0, 0.9490196, 1,
0.9796621, -0.2149715, 4.322567, 1, 0, 0.9411765, 1,
0.9803421, -0.3872042, -0.1660215, 1, 0, 0.9372549, 1,
0.983025, -0.930336, 3.445065, 1, 0, 0.9294118, 1,
0.9887364, -0.1438295, 2.807461, 1, 0, 0.9254902, 1,
1.004646, 1.209333, 0.04218344, 1, 0, 0.9176471, 1,
1.012114, -0.08791821, 1.064256, 1, 0, 0.9137255, 1,
1.013921, -0.5912103, 2.179034, 1, 0, 0.9058824, 1,
1.014558, 1.452767, 0.3637434, 1, 0, 0.9019608, 1,
1.022464, 0.8246834, -0.09897326, 1, 0, 0.8941177, 1,
1.023048, -0.2133387, 2.099816, 1, 0, 0.8862745, 1,
1.037003, -1.22295, 3.108501, 1, 0, 0.8823529, 1,
1.049863, 0.3388832, 2.088026, 1, 0, 0.8745098, 1,
1.056827, -0.1089851, 1.625374, 1, 0, 0.8705882, 1,
1.060312, -0.1514829, 1.999536, 1, 0, 0.8627451, 1,
1.063594, -0.1230851, 3.204517, 1, 0, 0.8588235, 1,
1.067187, 0.625556, 1.137588, 1, 0, 0.8509804, 1,
1.07076, 0.8701296, -0.4558246, 1, 0, 0.8470588, 1,
1.072369, 1.277695, 1.694081, 1, 0, 0.8392157, 1,
1.08535, -0.03477613, 0.7867985, 1, 0, 0.8352941, 1,
1.088057, 2.141995, 1.679377, 1, 0, 0.827451, 1,
1.092236, -1.056349, 2.826801, 1, 0, 0.8235294, 1,
1.092883, -0.2735823, 3.07365, 1, 0, 0.8156863, 1,
1.09456, 0.1588513, 0.555916, 1, 0, 0.8117647, 1,
1.103421, -1.472786, 2.695164, 1, 0, 0.8039216, 1,
1.110528, -1.736487, 2.967674, 1, 0, 0.7960784, 1,
1.111995, 0.09177736, 2.539941, 1, 0, 0.7921569, 1,
1.114589, 0.5748104, 2.470104, 1, 0, 0.7843137, 1,
1.114953, 1.570443, 1.438587, 1, 0, 0.7803922, 1,
1.115189, -2.266131, 3.034153, 1, 0, 0.772549, 1,
1.119572, -1.346244, 0.7747118, 1, 0, 0.7686275, 1,
1.129536, -2.573125, 3.093843, 1, 0, 0.7607843, 1,
1.13471, -0.211112, 1.809701, 1, 0, 0.7568628, 1,
1.139137, -1.200617, 1.760512, 1, 0, 0.7490196, 1,
1.140653, 0.3435121, 1.580644, 1, 0, 0.7450981, 1,
1.141072, -0.7688383, 1.643138, 1, 0, 0.7372549, 1,
1.145523, -1.358164, 1.916752, 1, 0, 0.7333333, 1,
1.152863, 0.4721405, -0.8040988, 1, 0, 0.7254902, 1,
1.157678, 0.1275285, 1.035282, 1, 0, 0.7215686, 1,
1.163804, -1.702583, 2.548762, 1, 0, 0.7137255, 1,
1.165675, 0.8560349, 1.101676, 1, 0, 0.7098039, 1,
1.170647, -1.776255, 2.568141, 1, 0, 0.7019608, 1,
1.172434, -1.20631, 1.772724, 1, 0, 0.6941177, 1,
1.19045, -0.2013547, 1.81522, 1, 0, 0.6901961, 1,
1.206033, -1.512833, 2.619317, 1, 0, 0.682353, 1,
1.213024, 0.026133, 0.6356104, 1, 0, 0.6784314, 1,
1.216323, 1.441006, -0.1039031, 1, 0, 0.6705883, 1,
1.216674, 0.8699178, -0.1054559, 1, 0, 0.6666667, 1,
1.216971, -1.623245, 3.744781, 1, 0, 0.6588235, 1,
1.218758, -0.5364115, 0.0933434, 1, 0, 0.654902, 1,
1.219326, -1.25498, 1.757433, 1, 0, 0.6470588, 1,
1.23081, -0.3041559, 2.096105, 1, 0, 0.6431373, 1,
1.232048, -1.574121, 3.251931, 1, 0, 0.6352941, 1,
1.233414, -2.06289, 1.229266, 1, 0, 0.6313726, 1,
1.245024, 1.927079, 1.54779, 1, 0, 0.6235294, 1,
1.245333, 0.05404838, 0.9071995, 1, 0, 0.6196079, 1,
1.245763, 1.106586, 0.776027, 1, 0, 0.6117647, 1,
1.25238, 1.7942, -0.1424689, 1, 0, 0.6078432, 1,
1.257073, 0.3259192, 1.975058, 1, 0, 0.6, 1,
1.269198, -1.734929, 2.595871, 1, 0, 0.5921569, 1,
1.269729, 2.383409, 0.5945317, 1, 0, 0.5882353, 1,
1.271282, -0.7356203, 1.606933, 1, 0, 0.5803922, 1,
1.275757, -1.927708, 3.264885, 1, 0, 0.5764706, 1,
1.276006, -0.476208, 1.915519, 1, 0, 0.5686275, 1,
1.283773, 0.7540868, 0.2089086, 1, 0, 0.5647059, 1,
1.290305, 0.8146642, 0.692619, 1, 0, 0.5568628, 1,
1.292502, 1.326384, 1.610466, 1, 0, 0.5529412, 1,
1.309664, 1.051686, 1.194515, 1, 0, 0.5450981, 1,
1.316431, 0.803248, 0.2099044, 1, 0, 0.5411765, 1,
1.323053, -0.5246057, 2.608942, 1, 0, 0.5333334, 1,
1.324134, 0.3541324, 0.03165898, 1, 0, 0.5294118, 1,
1.328114, 0.3653096, 2.123363, 1, 0, 0.5215687, 1,
1.33094, -1.052942, 2.090257, 1, 0, 0.5176471, 1,
1.335589, 1.218709, 0.8119019, 1, 0, 0.509804, 1,
1.34481, 1.555382, -0.1015002, 1, 0, 0.5058824, 1,
1.348137, 0.5056292, 0.3462646, 1, 0, 0.4980392, 1,
1.362357, 2.060058, -0.2868453, 1, 0, 0.4901961, 1,
1.373339, 0.2791804, -1.082182, 1, 0, 0.4862745, 1,
1.384774, 1.903931, -0.3090061, 1, 0, 0.4784314, 1,
1.391459, 1.293231, -0.2689637, 1, 0, 0.4745098, 1,
1.398067, 0.5072412, -0.02958652, 1, 0, 0.4666667, 1,
1.409578, -0.4885752, 1.274385, 1, 0, 0.4627451, 1,
1.419711, -0.6136174, 3.170581, 1, 0, 0.454902, 1,
1.430814, 0.6027846, -0.1169313, 1, 0, 0.4509804, 1,
1.434668, -0.6726401, 0.8104928, 1, 0, 0.4431373, 1,
1.442046, -0.4797519, 3.212554, 1, 0, 0.4392157, 1,
1.450487, -1.268673, 0.7808432, 1, 0, 0.4313726, 1,
1.454061, 1.215335, 0.6466851, 1, 0, 0.427451, 1,
1.469037, -1.137228, 1.339227, 1, 0, 0.4196078, 1,
1.477087, 0.09630451, 2.253036, 1, 0, 0.4156863, 1,
1.481798, -1.77501, 3.910292, 1, 0, 0.4078431, 1,
1.485407, 1.544176, -0.1111478, 1, 0, 0.4039216, 1,
1.505395, 1.561698, 0.9309139, 1, 0, 0.3960784, 1,
1.514894, 0.6409812, 0.2709315, 1, 0, 0.3882353, 1,
1.520671, -1.279502, 0.2495338, 1, 0, 0.3843137, 1,
1.521919, -0.9826605, 2.226635, 1, 0, 0.3764706, 1,
1.526546, -1.557866, 3.044342, 1, 0, 0.372549, 1,
1.529379, 0.2285758, 1.442336, 1, 0, 0.3647059, 1,
1.532842, -1.094735, -0.001882859, 1, 0, 0.3607843, 1,
1.533001, -0.06018287, 0.8878103, 1, 0, 0.3529412, 1,
1.540451, 0.9704267, -0.02962493, 1, 0, 0.3490196, 1,
1.542298, -1.265326, 1.998599, 1, 0, 0.3411765, 1,
1.545438, 0.758943, 1.081265, 1, 0, 0.3372549, 1,
1.546186, -1.196577, 2.422477, 1, 0, 0.3294118, 1,
1.563903, -0.7519663, 2.05792, 1, 0, 0.3254902, 1,
1.579489, 1.364181, 0.05224068, 1, 0, 0.3176471, 1,
1.585892, 1.158934, 1.19825, 1, 0, 0.3137255, 1,
1.589424, 0.4310768, 2.398265, 1, 0, 0.3058824, 1,
1.592104, 0.3077064, 1.852827, 1, 0, 0.2980392, 1,
1.596453, -0.4596697, 1.927709, 1, 0, 0.2941177, 1,
1.596777, -0.2859216, 1.859693, 1, 0, 0.2862745, 1,
1.604517, -1.438687, 1.233786, 1, 0, 0.282353, 1,
1.611917, 0.9778875, -0.1636197, 1, 0, 0.2745098, 1,
1.632355, -0.3444843, 2.050529, 1, 0, 0.2705882, 1,
1.634127, -0.02057346, 3.46269, 1, 0, 0.2627451, 1,
1.645487, -1.054077, 2.400296, 1, 0, 0.2588235, 1,
1.649993, -0.6264741, -0.3653414, 1, 0, 0.2509804, 1,
1.664273, 0.20365, 0.8528528, 1, 0, 0.2470588, 1,
1.670323, -0.3446175, 2.531938, 1, 0, 0.2392157, 1,
1.670753, -1.108516, 1.595669, 1, 0, 0.2352941, 1,
1.682577, -0.4467967, 3.231021, 1, 0, 0.227451, 1,
1.684561, -1.396148, 2.940812, 1, 0, 0.2235294, 1,
1.689983, -1.113765, 3.355729, 1, 0, 0.2156863, 1,
1.71137, -0.6551732, 1.443204, 1, 0, 0.2117647, 1,
1.772472, 0.2664427, 2.41659, 1, 0, 0.2039216, 1,
1.7775, -0.9220493, 2.300279, 1, 0, 0.1960784, 1,
1.784191, -1.39399, 3.416536, 1, 0, 0.1921569, 1,
1.785421, -0.01927153, 1.405201, 1, 0, 0.1843137, 1,
1.787274, 1.607884, -0.2433041, 1, 0, 0.1803922, 1,
1.799414, -1.030295, 1.113812, 1, 0, 0.172549, 1,
1.804536, 0.626102, 0.511988, 1, 0, 0.1686275, 1,
1.83258, -0.1219611, 2.314826, 1, 0, 0.1607843, 1,
1.83421, -0.8649721, 0.5545237, 1, 0, 0.1568628, 1,
1.848455, 1.056632, -0.4978115, 1, 0, 0.1490196, 1,
1.850575, 1.107558, 1.189737, 1, 0, 0.145098, 1,
1.857615, -1.235484, -0.229925, 1, 0, 0.1372549, 1,
1.869714, -0.2547257, 1.049835, 1, 0, 0.1333333, 1,
1.876203, -0.922559, 0.2182494, 1, 0, 0.1254902, 1,
1.897996, -0.4484932, 2.104321, 1, 0, 0.1215686, 1,
1.943038, -0.6534607, 3.382977, 1, 0, 0.1137255, 1,
2.029652, 1.493051, 1.255539, 1, 0, 0.1098039, 1,
2.03174, 0.7884924, 1.357765, 1, 0, 0.1019608, 1,
2.040193, 1.12448, -0.8261561, 1, 0, 0.09411765, 1,
2.067166, 0.1779827, 0.02588855, 1, 0, 0.09019608, 1,
2.140715, -1.190913, 1.739904, 1, 0, 0.08235294, 1,
2.170739, 0.437539, 2.57493, 1, 0, 0.07843138, 1,
2.184724, 0.8273075, 1.285049, 1, 0, 0.07058824, 1,
2.213594, 0.9393528, 0.4119838, 1, 0, 0.06666667, 1,
2.244068, 0.2265379, 1.56514, 1, 0, 0.05882353, 1,
2.324039, 0.07426368, 1.012968, 1, 0, 0.05490196, 1,
2.334082, -1.531014, 2.024593, 1, 0, 0.04705882, 1,
2.438789, -0.5572088, 2.590271, 1, 0, 0.04313726, 1,
2.520788, 1.277429, 1.399008, 1, 0, 0.03529412, 1,
2.527825, -1.424771, 2.417714, 1, 0, 0.03137255, 1,
2.570336, -0.9156032, -0.1522859, 1, 0, 0.02352941, 1,
2.588121, 1.249849, 0.8046036, 1, 0, 0.01960784, 1,
2.708883, 1.19243, 2.922969, 1, 0, 0.01176471, 1,
2.778552, 0.9267587, 1.618103, 1, 0, 0.007843138, 1
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
-0.1757542, -4.639524, -7.800418, 0, -0.5, 0.5, 0.5,
-0.1757542, -4.639524, -7.800418, 1, -0.5, 0.5, 0.5,
-0.1757542, -4.639524, -7.800418, 1, 1.5, 0.5, 0.5,
-0.1757542, -4.639524, -7.800418, 0, 1.5, 0.5, 0.5
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
-4.13157, -0.4119519, -7.800418, 0, -0.5, 0.5, 0.5,
-4.13157, -0.4119519, -7.800418, 1, -0.5, 0.5, 0.5,
-4.13157, -0.4119519, -7.800418, 1, 1.5, 0.5, 0.5,
-4.13157, -0.4119519, -7.800418, 0, 1.5, 0.5, 0.5
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
-4.13157, -4.639524, -0.6171103, 0, -0.5, 0.5, 0.5,
-4.13157, -4.639524, -0.6171103, 1, -0.5, 0.5, 0.5,
-4.13157, -4.639524, -0.6171103, 1, 1.5, 0.5, 0.5,
-4.13157, -4.639524, -0.6171103, 0, 1.5, 0.5, 0.5
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
-3, -3.663931, -6.142732,
2, -3.663931, -6.142732,
-3, -3.663931, -6.142732,
-3, -3.82653, -6.419013,
-2, -3.663931, -6.142732,
-2, -3.82653, -6.419013,
-1, -3.663931, -6.142732,
-1, -3.82653, -6.419013,
0, -3.663931, -6.142732,
0, -3.82653, -6.419013,
1, -3.663931, -6.142732,
1, -3.82653, -6.419013,
2, -3.663931, -6.142732,
2, -3.82653, -6.419013
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
-3, -4.151728, -6.971575, 0, -0.5, 0.5, 0.5,
-3, -4.151728, -6.971575, 1, -0.5, 0.5, 0.5,
-3, -4.151728, -6.971575, 1, 1.5, 0.5, 0.5,
-3, -4.151728, -6.971575, 0, 1.5, 0.5, 0.5,
-2, -4.151728, -6.971575, 0, -0.5, 0.5, 0.5,
-2, -4.151728, -6.971575, 1, -0.5, 0.5, 0.5,
-2, -4.151728, -6.971575, 1, 1.5, 0.5, 0.5,
-2, -4.151728, -6.971575, 0, 1.5, 0.5, 0.5,
-1, -4.151728, -6.971575, 0, -0.5, 0.5, 0.5,
-1, -4.151728, -6.971575, 1, -0.5, 0.5, 0.5,
-1, -4.151728, -6.971575, 1, 1.5, 0.5, 0.5,
-1, -4.151728, -6.971575, 0, 1.5, 0.5, 0.5,
0, -4.151728, -6.971575, 0, -0.5, 0.5, 0.5,
0, -4.151728, -6.971575, 1, -0.5, 0.5, 0.5,
0, -4.151728, -6.971575, 1, 1.5, 0.5, 0.5,
0, -4.151728, -6.971575, 0, 1.5, 0.5, 0.5,
1, -4.151728, -6.971575, 0, -0.5, 0.5, 0.5,
1, -4.151728, -6.971575, 1, -0.5, 0.5, 0.5,
1, -4.151728, -6.971575, 1, 1.5, 0.5, 0.5,
1, -4.151728, -6.971575, 0, 1.5, 0.5, 0.5,
2, -4.151728, -6.971575, 0, -0.5, 0.5, 0.5,
2, -4.151728, -6.971575, 1, -0.5, 0.5, 0.5,
2, -4.151728, -6.971575, 1, 1.5, 0.5, 0.5,
2, -4.151728, -6.971575, 0, 1.5, 0.5, 0.5
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
-3.21869, -3, -6.142732,
-3.21869, 2, -6.142732,
-3.21869, -3, -6.142732,
-3.370837, -3, -6.419013,
-3.21869, -2, -6.142732,
-3.370837, -2, -6.419013,
-3.21869, -1, -6.142732,
-3.370837, -1, -6.419013,
-3.21869, 0, -6.142732,
-3.370837, 0, -6.419013,
-3.21869, 1, -6.142732,
-3.370837, 1, -6.419013,
-3.21869, 2, -6.142732,
-3.370837, 2, -6.419013
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
-3.67513, -3, -6.971575, 0, -0.5, 0.5, 0.5,
-3.67513, -3, -6.971575, 1, -0.5, 0.5, 0.5,
-3.67513, -3, -6.971575, 1, 1.5, 0.5, 0.5,
-3.67513, -3, -6.971575, 0, 1.5, 0.5, 0.5,
-3.67513, -2, -6.971575, 0, -0.5, 0.5, 0.5,
-3.67513, -2, -6.971575, 1, -0.5, 0.5, 0.5,
-3.67513, -2, -6.971575, 1, 1.5, 0.5, 0.5,
-3.67513, -2, -6.971575, 0, 1.5, 0.5, 0.5,
-3.67513, -1, -6.971575, 0, -0.5, 0.5, 0.5,
-3.67513, -1, -6.971575, 1, -0.5, 0.5, 0.5,
-3.67513, -1, -6.971575, 1, 1.5, 0.5, 0.5,
-3.67513, -1, -6.971575, 0, 1.5, 0.5, 0.5,
-3.67513, 0, -6.971575, 0, -0.5, 0.5, 0.5,
-3.67513, 0, -6.971575, 1, -0.5, 0.5, 0.5,
-3.67513, 0, -6.971575, 1, 1.5, 0.5, 0.5,
-3.67513, 0, -6.971575, 0, 1.5, 0.5, 0.5,
-3.67513, 1, -6.971575, 0, -0.5, 0.5, 0.5,
-3.67513, 1, -6.971575, 1, -0.5, 0.5, 0.5,
-3.67513, 1, -6.971575, 1, 1.5, 0.5, 0.5,
-3.67513, 1, -6.971575, 0, 1.5, 0.5, 0.5,
-3.67513, 2, -6.971575, 0, -0.5, 0.5, 0.5,
-3.67513, 2, -6.971575, 1, -0.5, 0.5, 0.5,
-3.67513, 2, -6.971575, 1, 1.5, 0.5, 0.5,
-3.67513, 2, -6.971575, 0, 1.5, 0.5, 0.5
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
-3.21869, -3.663931, -4,
-3.21869, -3.663931, 4,
-3.21869, -3.663931, -4,
-3.370837, -3.82653, -4,
-3.21869, -3.663931, -2,
-3.370837, -3.82653, -2,
-3.21869, -3.663931, 0,
-3.370837, -3.82653, 0,
-3.21869, -3.663931, 2,
-3.370837, -3.82653, 2,
-3.21869, -3.663931, 4,
-3.370837, -3.82653, 4
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
-3.67513, -4.151728, -4, 0, -0.5, 0.5, 0.5,
-3.67513, -4.151728, -4, 1, -0.5, 0.5, 0.5,
-3.67513, -4.151728, -4, 1, 1.5, 0.5, 0.5,
-3.67513, -4.151728, -4, 0, 1.5, 0.5, 0.5,
-3.67513, -4.151728, -2, 0, -0.5, 0.5, 0.5,
-3.67513, -4.151728, -2, 1, -0.5, 0.5, 0.5,
-3.67513, -4.151728, -2, 1, 1.5, 0.5, 0.5,
-3.67513, -4.151728, -2, 0, 1.5, 0.5, 0.5,
-3.67513, -4.151728, 0, 0, -0.5, 0.5, 0.5,
-3.67513, -4.151728, 0, 1, -0.5, 0.5, 0.5,
-3.67513, -4.151728, 0, 1, 1.5, 0.5, 0.5,
-3.67513, -4.151728, 0, 0, 1.5, 0.5, 0.5,
-3.67513, -4.151728, 2, 0, -0.5, 0.5, 0.5,
-3.67513, -4.151728, 2, 1, -0.5, 0.5, 0.5,
-3.67513, -4.151728, 2, 1, 1.5, 0.5, 0.5,
-3.67513, -4.151728, 2, 0, 1.5, 0.5, 0.5,
-3.67513, -4.151728, 4, 0, -0.5, 0.5, 0.5,
-3.67513, -4.151728, 4, 1, -0.5, 0.5, 0.5,
-3.67513, -4.151728, 4, 1, 1.5, 0.5, 0.5,
-3.67513, -4.151728, 4, 0, 1.5, 0.5, 0.5
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
-3.21869, -3.663931, -6.142732,
-3.21869, 2.840027, -6.142732,
-3.21869, -3.663931, 4.908512,
-3.21869, 2.840027, 4.908512,
-3.21869, -3.663931, -6.142732,
-3.21869, -3.663931, 4.908512,
-3.21869, 2.840027, -6.142732,
-3.21869, 2.840027, 4.908512,
-3.21869, -3.663931, -6.142732,
2.867182, -3.663931, -6.142732,
-3.21869, -3.663931, 4.908512,
2.867182, -3.663931, 4.908512,
-3.21869, 2.840027, -6.142732,
2.867182, 2.840027, -6.142732,
-3.21869, 2.840027, 4.908512,
2.867182, 2.840027, 4.908512,
2.867182, -3.663931, -6.142732,
2.867182, 2.840027, -6.142732,
2.867182, -3.663931, 4.908512,
2.867182, 2.840027, 4.908512,
2.867182, -3.663931, -6.142732,
2.867182, -3.663931, 4.908512,
2.867182, 2.840027, -6.142732,
2.867182, 2.840027, 4.908512
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
var radius = 7.579314;
var distance = 33.72122;
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
mvMatrix.translate( 0.1757542, 0.4119519, 0.6171103 );
mvMatrix.scale( 1.346545, 1.259987, 0.7415367 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72122);
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
methabenzthiazuron<-read.table("methabenzthiazuron.xyz")
```

```
## Error in read.table("methabenzthiazuron.xyz"): no lines available in input
```

```r
x<-methabenzthiazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'methabenzthiazuron' not found
```

```r
y<-methabenzthiazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'methabenzthiazuron' not found
```

```r
z<-methabenzthiazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'methabenzthiazuron' not found
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
-3.130061, 1.576392, -1.831887, 0, 0, 1, 1, 1,
-3.004927, -0.6656528, -1.14354, 1, 0, 0, 1, 1,
-2.750498, 0.4857943, -0.9977233, 1, 0, 0, 1, 1,
-2.60793, 1.458819, -0.7830525, 1, 0, 0, 1, 1,
-2.572556, 0.8202013, -2.746711, 1, 0, 0, 1, 1,
-2.537365, 0.1128437, -3.632691, 1, 0, 0, 1, 1,
-2.466314, -0.9438927, -2.270847, 0, 0, 0, 1, 1,
-2.436416, -0.5382547, -2.469766, 0, 0, 0, 1, 1,
-2.38128, -1.086598, -1.534186, 0, 0, 0, 1, 1,
-2.344632, -0.9855225, -0.2472535, 0, 0, 0, 1, 1,
-2.229045, -0.6375237, -2.518214, 0, 0, 0, 1, 1,
-2.182293, 0.9873963, -2.537258, 0, 0, 0, 1, 1,
-2.12727, 1.195197, -0.1779332, 0, 0, 0, 1, 1,
-2.099254, -0.9683349, -1.999089, 1, 1, 1, 1, 1,
-2.09414, 1.327641, -0.4882542, 1, 1, 1, 1, 1,
-2.088363, -0.1454501, -2.434819, 1, 1, 1, 1, 1,
-2.051286, -0.09782081, -2.839758, 1, 1, 1, 1, 1,
-2.00977, -1.494954, 0.2394383, 1, 1, 1, 1, 1,
-2.001925, -0.3615069, -3.338599, 1, 1, 1, 1, 1,
-1.991346, 0.7364716, -1.177736, 1, 1, 1, 1, 1,
-1.915776, 0.5320717, -3.096093, 1, 1, 1, 1, 1,
-1.853845, -1.277058, -2.710318, 1, 1, 1, 1, 1,
-1.850089, -0.04128677, -2.919811, 1, 1, 1, 1, 1,
-1.84815, 0.216174, 1.192842, 1, 1, 1, 1, 1,
-1.843926, -0.05980556, -2.39551, 1, 1, 1, 1, 1,
-1.841101, 1.627444, 0.9261685, 1, 1, 1, 1, 1,
-1.81812, -0.9624436, -2.948929, 1, 1, 1, 1, 1,
-1.797492, -1.216124, -3.594369, 1, 1, 1, 1, 1,
-1.774362, 0.4810242, -1.772413, 0, 0, 1, 1, 1,
-1.772819, -0.2832321, -1.468623, 1, 0, 0, 1, 1,
-1.748534, 1.093566, -2.170396, 1, 0, 0, 1, 1,
-1.713312, 1.800724, 0.2190467, 1, 0, 0, 1, 1,
-1.711552, 0.03732501, -2.88288, 1, 0, 0, 1, 1,
-1.704772, -0.8597122, -2.197745, 1, 0, 0, 1, 1,
-1.696568, 0.1518338, -2.734205, 0, 0, 0, 1, 1,
-1.693893, -0.4355261, -0.9071018, 0, 0, 0, 1, 1,
-1.661461, -0.8293257, -0.9592597, 0, 0, 0, 1, 1,
-1.655171, 1.18135, -0.2555252, 0, 0, 0, 1, 1,
-1.654141, 1.016164, -1.974071, 0, 0, 0, 1, 1,
-1.607746, -1.541414, -2.606618, 0, 0, 0, 1, 1,
-1.601066, -0.5918695, -2.71255, 0, 0, 0, 1, 1,
-1.579752, 0.705744, -2.339843, 1, 1, 1, 1, 1,
-1.578015, 1.805722, 0.1218634, 1, 1, 1, 1, 1,
-1.577716, -0.5451071, -2.930095, 1, 1, 1, 1, 1,
-1.573741, -0.8942491, -2.362751, 1, 1, 1, 1, 1,
-1.557167, 0.4985384, -0.9884957, 1, 1, 1, 1, 1,
-1.557054, -1.106447, -3.33871, 1, 1, 1, 1, 1,
-1.549936, -1.296587, -0.6661048, 1, 1, 1, 1, 1,
-1.539038, -1.858353, -2.300187, 1, 1, 1, 1, 1,
-1.529996, 0.1813849, -1.599515, 1, 1, 1, 1, 1,
-1.514268, 0.01751629, -1.917357, 1, 1, 1, 1, 1,
-1.490221, -0.9637786, -1.805367, 1, 1, 1, 1, 1,
-1.484076, 2.235816, 0.6329868, 1, 1, 1, 1, 1,
-1.472298, 1.469841, -0.07506042, 1, 1, 1, 1, 1,
-1.472219, -0.4167188, -2.042018, 1, 1, 1, 1, 1,
-1.466006, 0.3664393, -1.391022, 1, 1, 1, 1, 1,
-1.463812, 1.43746, 0.8172432, 0, 0, 1, 1, 1,
-1.458016, -3.569213, -4.395918, 1, 0, 0, 1, 1,
-1.454635, 0.7543812, -1.127082, 1, 0, 0, 1, 1,
-1.446789, -0.3794175, -1.481285, 1, 0, 0, 1, 1,
-1.428106, 1.957579, -0.9845849, 1, 0, 0, 1, 1,
-1.41364, 1.056969, -0.5779104, 1, 0, 0, 1, 1,
-1.413037, 0.9695647, -4.767912, 0, 0, 0, 1, 1,
-1.412322, 0.7171221, -0.7428885, 0, 0, 0, 1, 1,
-1.40023, 0.7464687, -0.99342, 0, 0, 0, 1, 1,
-1.399774, 0.8965161, -1.70073, 0, 0, 0, 1, 1,
-1.366068, 0.0006182229, -2.162754, 0, 0, 0, 1, 1,
-1.359489, -0.06155967, -3.007626, 0, 0, 0, 1, 1,
-1.351516, 0.3105469, -0.3943172, 0, 0, 0, 1, 1,
-1.334628, -1.364585, -1.462971, 1, 1, 1, 1, 1,
-1.325147, -0.2078009, -1.13729, 1, 1, 1, 1, 1,
-1.323391, -0.2132738, -2.687751, 1, 1, 1, 1, 1,
-1.319253, 0.08620603, -0.9736139, 1, 1, 1, 1, 1,
-1.316096, 2.658089, 0.1456118, 1, 1, 1, 1, 1,
-1.315439, -0.02016667, -1.399887, 1, 1, 1, 1, 1,
-1.314811, 0.1842421, -0.7870042, 1, 1, 1, 1, 1,
-1.313102, 0.004750579, -0.9959006, 1, 1, 1, 1, 1,
-1.310997, 0.9772353, -1.700579, 1, 1, 1, 1, 1,
-1.305858, -0.290889, -0.9512, 1, 1, 1, 1, 1,
-1.298113, -1.287414, -2.172025, 1, 1, 1, 1, 1,
-1.293777, -1.377897, -4.270739, 1, 1, 1, 1, 1,
-1.292932, -0.7051204, -2.45258, 1, 1, 1, 1, 1,
-1.28806, -1.148295, -1.015883, 1, 1, 1, 1, 1,
-1.286526, -0.6069461, -0.7681766, 1, 1, 1, 1, 1,
-1.282203, 0.516699, -0.954653, 0, 0, 1, 1, 1,
-1.274618, -0.7632484, -0.8488157, 1, 0, 0, 1, 1,
-1.271828, -0.5249106, -3.312367, 1, 0, 0, 1, 1,
-1.262912, -0.1102386, -2.786666, 1, 0, 0, 1, 1,
-1.254317, -0.5883127, -2.745576, 1, 0, 0, 1, 1,
-1.249336, 0.8370012, -1.052177, 1, 0, 0, 1, 1,
-1.241526, 1.000865, -0.7210332, 0, 0, 0, 1, 1,
-1.239366, -1.090403, -0.8211023, 0, 0, 0, 1, 1,
-1.239194, -1.639938, 0.1731734, 0, 0, 0, 1, 1,
-1.238455, -0.3187958, -1.715478, 0, 0, 0, 1, 1,
-1.224769, 0.6463286, -0.556707, 0, 0, 0, 1, 1,
-1.215775, -1.289612, -4.982301, 0, 0, 0, 1, 1,
-1.204286, 0.170503, -2.548544, 0, 0, 0, 1, 1,
-1.19398, -2.104098, -1.496415, 1, 1, 1, 1, 1,
-1.190213, 0.7225637, -1.640643, 1, 1, 1, 1, 1,
-1.189975, -2.089728, -3.112733, 1, 1, 1, 1, 1,
-1.186695, 1.751034, -0.5070494, 1, 1, 1, 1, 1,
-1.184017, 1.124523, -2.176996, 1, 1, 1, 1, 1,
-1.182981, 0.114292, -0.8945824, 1, 1, 1, 1, 1,
-1.182424, -0.2773882, -2.112119, 1, 1, 1, 1, 1,
-1.175376, -0.1961578, -0.7723083, 1, 1, 1, 1, 1,
-1.174271, -0.03333632, -0.6046866, 1, 1, 1, 1, 1,
-1.173974, -1.021788, -2.949514, 1, 1, 1, 1, 1,
-1.16948, 0.05235349, -1.974054, 1, 1, 1, 1, 1,
-1.168601, -0.8558306, -1.775865, 1, 1, 1, 1, 1,
-1.166746, 1.156632, -2.397858, 1, 1, 1, 1, 1,
-1.165076, 1.469222, -0.006442528, 1, 1, 1, 1, 1,
-1.158982, -0.6954578, -1.209997, 1, 1, 1, 1, 1,
-1.156622, -1.675895, -3.40531, 0, 0, 1, 1, 1,
-1.154374, 1.589484, -1.299627, 1, 0, 0, 1, 1,
-1.149816, -0.4661212, -3.119486, 1, 0, 0, 1, 1,
-1.147497, 0.9880764, -1.296374, 1, 0, 0, 1, 1,
-1.14639, 0.7800969, -0.898165, 1, 0, 0, 1, 1,
-1.141385, -0.2487842, -1.482606, 1, 0, 0, 1, 1,
-1.139312, -1.664122, -3.261663, 0, 0, 0, 1, 1,
-1.128969, 0.538247, -1.428046, 0, 0, 0, 1, 1,
-1.127296, -0.1800966, -1.003632, 0, 0, 0, 1, 1,
-1.122265, -0.4275245, -2.295408, 0, 0, 0, 1, 1,
-1.109724, -0.5280407, -2.311002, 0, 0, 0, 1, 1,
-1.10965, -1.518815, -4.249988, 0, 0, 0, 1, 1,
-1.103683, 0.6311987, -0.6662463, 0, 0, 0, 1, 1,
-1.089808, 0.9784063, 0.06746759, 1, 1, 1, 1, 1,
-1.076917, -0.7207804, -0.9498972, 1, 1, 1, 1, 1,
-1.070493, -0.9856406, -2.048365, 1, 1, 1, 1, 1,
-1.063418, 0.9593104, -1.600067, 1, 1, 1, 1, 1,
-1.061729, -1.744962, -2.366685, 1, 1, 1, 1, 1,
-1.061309, 1.083025, 0.4084921, 1, 1, 1, 1, 1,
-1.058109, 0.3823249, -0.8923714, 1, 1, 1, 1, 1,
-1.051837, -0.2632093, -2.192237, 1, 1, 1, 1, 1,
-1.039781, -1.138384, -4.235919, 1, 1, 1, 1, 1,
-1.037931, -1.981312, -1.639701, 1, 1, 1, 1, 1,
-1.035058, -0.1317214, -3.003125, 1, 1, 1, 1, 1,
-1.031587, -1.484734, -4.095726, 1, 1, 1, 1, 1,
-1.030866, 0.5922522, -3.256334, 1, 1, 1, 1, 1,
-1.028854, 0.3058872, -2.345041, 1, 1, 1, 1, 1,
-1.026027, 1.025236, -0.2878601, 1, 1, 1, 1, 1,
-1.014871, 0.9236235, -0.1006211, 0, 0, 1, 1, 1,
-1.010415, 1.003448, -0.317837, 1, 0, 0, 1, 1,
-1.010273, 1.670627, -0.8153475, 1, 0, 0, 1, 1,
-1.010222, 0.6629882, -0.9771119, 1, 0, 0, 1, 1,
-0.9980062, -0.5163956, -1.942288, 1, 0, 0, 1, 1,
-0.9960755, 0.09836738, -1.381467, 1, 0, 0, 1, 1,
-0.9832541, -0.8223492, -0.6308442, 0, 0, 0, 1, 1,
-0.978996, 0.2453263, -1.727183, 0, 0, 0, 1, 1,
-0.9677044, -0.07540023, -2.944632, 0, 0, 0, 1, 1,
-0.9665982, -1.190082, -2.468084, 0, 0, 0, 1, 1,
-0.9662259, 0.6579926, 0.2225723, 0, 0, 0, 1, 1,
-0.9625781, -1.513284, -3.006913, 0, 0, 0, 1, 1,
-0.9598269, 1.242971, -0.2823272, 0, 0, 0, 1, 1,
-0.9562988, -0.8435001, -2.103232, 1, 1, 1, 1, 1,
-0.9547951, -0.9376944, -2.116575, 1, 1, 1, 1, 1,
-0.951576, 1.83488, -0.2874871, 1, 1, 1, 1, 1,
-0.9468712, -0.5575174, -1.621895, 1, 1, 1, 1, 1,
-0.9467704, -1.511958, -2.656675, 1, 1, 1, 1, 1,
-0.943769, -0.9027088, -0.7805552, 1, 1, 1, 1, 1,
-0.9426562, 0.9509934, -0.9254103, 1, 1, 1, 1, 1,
-0.9401068, -0.2636624, -1.265829, 1, 1, 1, 1, 1,
-0.9304422, -0.274626, -3.661015, 1, 1, 1, 1, 1,
-0.9225439, -1.332658, -3.618995, 1, 1, 1, 1, 1,
-0.91973, 0.8474893, 0.8188955, 1, 1, 1, 1, 1,
-0.9161298, -0.20854, -2.070751, 1, 1, 1, 1, 1,
-0.9093306, 0.2228047, 0.386085, 1, 1, 1, 1, 1,
-0.9091273, 1.910489, -0.5629812, 1, 1, 1, 1, 1,
-0.9074883, 0.09953416, -1.802811, 1, 1, 1, 1, 1,
-0.903233, 0.6384553, -2.216555, 0, 0, 1, 1, 1,
-0.896936, 0.4558073, -1.922967, 1, 0, 0, 1, 1,
-0.8923851, -1.304403, -2.878096, 1, 0, 0, 1, 1,
-0.8914629, -0.670523, -3.043831, 1, 0, 0, 1, 1,
-0.890753, 0.08764533, -0.3426958, 1, 0, 0, 1, 1,
-0.8825589, -0.4808047, -3.573334, 1, 0, 0, 1, 1,
-0.877058, 1.500232, 0.2024054, 0, 0, 0, 1, 1,
-0.8729146, 0.3589153, -1.475633, 0, 0, 0, 1, 1,
-0.8705121, -1.877136, -3.684374, 0, 0, 0, 1, 1,
-0.8704095, -0.6804311, -3.210328, 0, 0, 0, 1, 1,
-0.870207, 1.000923, -2.030986, 0, 0, 0, 1, 1,
-0.8692014, -0.9197404, -2.819552, 0, 0, 0, 1, 1,
-0.8588349, 1.64735, -0.02174157, 0, 0, 0, 1, 1,
-0.8547743, -0.2034125, -0.8730414, 1, 1, 1, 1, 1,
-0.8524601, 0.004594107, -0.6668029, 1, 1, 1, 1, 1,
-0.8504454, -0.06364677, -1.210827, 1, 1, 1, 1, 1,
-0.845721, 0.4833628, -1.36362, 1, 1, 1, 1, 1,
-0.8374999, -0.4360099, -1.041961, 1, 1, 1, 1, 1,
-0.835579, -0.6730895, -2.388183, 1, 1, 1, 1, 1,
-0.8305817, 2.147562, -0.9124827, 1, 1, 1, 1, 1,
-0.8266466, 0.8442029, -1.053743, 1, 1, 1, 1, 1,
-0.825422, -1.032456, -2.918774, 1, 1, 1, 1, 1,
-0.8244641, -0.8211533, -2.865362, 1, 1, 1, 1, 1,
-0.8185664, -1.125226, -2.912828, 1, 1, 1, 1, 1,
-0.8175201, 0.1682556, -1.6822, 1, 1, 1, 1, 1,
-0.8162639, -2.058936, -1.876532, 1, 1, 1, 1, 1,
-0.8112245, -0.4997087, -3.847926, 1, 1, 1, 1, 1,
-0.8044365, -0.05577087, -3.261643, 1, 1, 1, 1, 1,
-0.798102, -0.06024352, -0.789363, 0, 0, 1, 1, 1,
-0.7859972, -0.6831226, -2.674419, 1, 0, 0, 1, 1,
-0.7814744, 1.2628, -2.603874, 1, 0, 0, 1, 1,
-0.781374, -2.590108, -2.402662, 1, 0, 0, 1, 1,
-0.7779732, 0.7524616, -0.6785681, 1, 0, 0, 1, 1,
-0.7779633, -0.2714788, -2.034253, 1, 0, 0, 1, 1,
-0.7674391, -0.01433146, -3.694376, 0, 0, 0, 1, 1,
-0.7673811, 0.8401403, -0.6083477, 0, 0, 0, 1, 1,
-0.7630925, -0.9312569, -1.420741, 0, 0, 0, 1, 1,
-0.7607657, -0.2184549, -2.933083, 0, 0, 0, 1, 1,
-0.7589465, -0.5865617, -1.095557, 0, 0, 0, 1, 1,
-0.7551665, 0.3051251, -1.277853, 0, 0, 0, 1, 1,
-0.7525747, -0.2375736, -1.508147, 0, 0, 0, 1, 1,
-0.7521881, -0.7038217, -2.638273, 1, 1, 1, 1, 1,
-0.752178, -0.5919325, -2.208065, 1, 1, 1, 1, 1,
-0.7494949, 1.292757, -0.3768826, 1, 1, 1, 1, 1,
-0.7494212, -0.9142377, -2.745686, 1, 1, 1, 1, 1,
-0.7483568, 0.4329798, -0.6944024, 1, 1, 1, 1, 1,
-0.7412071, 0.2898934, -2.174937, 1, 1, 1, 1, 1,
-0.741004, 2.527148, -0.1108628, 1, 1, 1, 1, 1,
-0.7386857, -0.793992, -2.033583, 1, 1, 1, 1, 1,
-0.7363707, -1.644602, -4.403269, 1, 1, 1, 1, 1,
-0.7361027, 1.954094, -0.006301649, 1, 1, 1, 1, 1,
-0.7344519, 0.08913264, -0.9487858, 1, 1, 1, 1, 1,
-0.7333924, 0.7781826, -0.5765635, 1, 1, 1, 1, 1,
-0.731577, -0.6011624, -1.808438, 1, 1, 1, 1, 1,
-0.7301911, -0.236865, -2.395037, 1, 1, 1, 1, 1,
-0.7222276, 0.5007594, -0.2160722, 1, 1, 1, 1, 1,
-0.719189, -0.3289412, -1.567365, 0, 0, 1, 1, 1,
-0.710318, 0.3984343, -1.09421, 1, 0, 0, 1, 1,
-0.7089592, 0.1055482, -1.072963, 1, 0, 0, 1, 1,
-0.7053503, 0.003382734, -0.6290817, 1, 0, 0, 1, 1,
-0.6983198, -0.7524754, -2.142287, 1, 0, 0, 1, 1,
-0.6961671, -0.7327275, -2.569096, 1, 0, 0, 1, 1,
-0.6949493, 0.5759081, 0.03670042, 0, 0, 0, 1, 1,
-0.6920862, 0.1282054, -2.307004, 0, 0, 0, 1, 1,
-0.6912652, -1.269779, -2.455571, 0, 0, 0, 1, 1,
-0.6731685, -0.3692414, -2.894872, 0, 0, 0, 1, 1,
-0.6714112, -0.3517178, -2.287961, 0, 0, 0, 1, 1,
-0.662523, 0.7107905, -1.985085, 0, 0, 0, 1, 1,
-0.6552059, 0.3976904, -1.121898, 0, 0, 0, 1, 1,
-0.6396464, 0.1079173, -0.7762033, 1, 1, 1, 1, 1,
-0.6390013, 0.5496027, 0.1221709, 1, 1, 1, 1, 1,
-0.6389996, 0.3714474, -1.604962, 1, 1, 1, 1, 1,
-0.6380004, -0.1424201, -0.725268, 1, 1, 1, 1, 1,
-0.6372017, -0.1353474, -2.006341, 1, 1, 1, 1, 1,
-0.6370544, -0.1400185, -1.396684, 1, 1, 1, 1, 1,
-0.629371, 1.952715, -0.4280408, 1, 1, 1, 1, 1,
-0.6235908, -0.8524476, -2.789106, 1, 1, 1, 1, 1,
-0.6216869, -1.130772, -3.265729, 1, 1, 1, 1, 1,
-0.6212189, 0.3435291, -2.014863, 1, 1, 1, 1, 1,
-0.6170182, 0.9293796, -2.71701, 1, 1, 1, 1, 1,
-0.6116461, -0.303567, -1.469074, 1, 1, 1, 1, 1,
-0.6113537, 0.2602635, -1.471402, 1, 1, 1, 1, 1,
-0.6104137, 0.1453875, -2.653966, 1, 1, 1, 1, 1,
-0.6056852, -1.197238, -5.002642, 1, 1, 1, 1, 1,
-0.5967928, 0.2034054, 0.7081983, 0, 0, 1, 1, 1,
-0.5953109, -1.81597, -2.262433, 1, 0, 0, 1, 1,
-0.5886334, 0.5276327, -1.459141, 1, 0, 0, 1, 1,
-0.5846303, -0.8763196, -1.314229, 1, 0, 0, 1, 1,
-0.5843453, 0.4790775, -1.769217, 1, 0, 0, 1, 1,
-0.5837641, 1.06381, 0.8634133, 1, 0, 0, 1, 1,
-0.5816159, 1.233837, -0.7885405, 0, 0, 0, 1, 1,
-0.5771974, 0.2186094, -0.0256706, 0, 0, 0, 1, 1,
-0.572019, -0.6629025, -2.838187, 0, 0, 0, 1, 1,
-0.5719987, -0.2316914, -2.089562, 0, 0, 0, 1, 1,
-0.570285, -0.2547378, -1.718918, 0, 0, 0, 1, 1,
-0.5689979, 0.34888, -2.206485, 0, 0, 0, 1, 1,
-0.5689911, -1.281442, -2.006579, 0, 0, 0, 1, 1,
-0.5591974, -0.8781096, -3.663464, 1, 1, 1, 1, 1,
-0.5577654, 0.09110947, -1.533697, 1, 1, 1, 1, 1,
-0.5539519, -1.940112, -2.350532, 1, 1, 1, 1, 1,
-0.5482234, -0.4433461, -2.129539, 1, 1, 1, 1, 1,
-0.5478488, -0.1443285, -0.8759676, 1, 1, 1, 1, 1,
-0.5475885, 1.175642, 0.3457805, 1, 1, 1, 1, 1,
-0.5469977, 1.004208, -2.01102, 1, 1, 1, 1, 1,
-0.5401674, -0.08225448, -3.515519, 1, 1, 1, 1, 1,
-0.5371656, -0.1196608, -2.996121, 1, 1, 1, 1, 1,
-0.536997, -0.733441, -1.976287, 1, 1, 1, 1, 1,
-0.5299976, 0.2295088, 0.6712002, 1, 1, 1, 1, 1,
-0.5264057, -1.398132, -1.835252, 1, 1, 1, 1, 1,
-0.5262401, -0.6688067, -3.085823, 1, 1, 1, 1, 1,
-0.521775, -1.266567, -2.663083, 1, 1, 1, 1, 1,
-0.5211232, 0.04292759, -2.333068, 1, 1, 1, 1, 1,
-0.5193107, 1.4292, -0.1177066, 0, 0, 1, 1, 1,
-0.5190649, 0.4192091, -1.126668, 1, 0, 0, 1, 1,
-0.5081523, -1.108253, -1.995771, 1, 0, 0, 1, 1,
-0.5057522, 0.5799588, -1.672972, 1, 0, 0, 1, 1,
-0.505242, 0.05918544, -1.971918, 1, 0, 0, 1, 1,
-0.5027249, -0.2334318, -1.02546, 1, 0, 0, 1, 1,
-0.5007235, -0.2831416, -2.574883, 0, 0, 0, 1, 1,
-0.5006211, 0.6531758, -1.145636, 0, 0, 0, 1, 1,
-0.499839, 0.5535942, -0.08827834, 0, 0, 0, 1, 1,
-0.4928077, 0.4938402, -0.6997719, 0, 0, 0, 1, 1,
-0.4882604, -0.796555, -2.707126, 0, 0, 0, 1, 1,
-0.4865218, -0.06079185, -0.1653179, 0, 0, 0, 1, 1,
-0.482798, -1.730477, -2.993597, 0, 0, 0, 1, 1,
-0.4819744, -1.073048, -0.4321226, 1, 1, 1, 1, 1,
-0.4785427, 0.7775302, -1.131485, 1, 1, 1, 1, 1,
-0.4784333, -0.299863, -2.163778, 1, 1, 1, 1, 1,
-0.4774491, 1.012711, 0.01017342, 1, 1, 1, 1, 1,
-0.4766125, 1.800222, -1.608358, 1, 1, 1, 1, 1,
-0.4725566, 0.2326304, 1.014397, 1, 1, 1, 1, 1,
-0.4693427, 0.7761379, -0.7651688, 1, 1, 1, 1, 1,
-0.4657052, -0.4779138, -3.622962, 1, 1, 1, 1, 1,
-0.4579394, -1.0265, -2.855988, 1, 1, 1, 1, 1,
-0.4565282, 0.1875455, -0.4185435, 1, 1, 1, 1, 1,
-0.4562866, 0.320364, -1.836981, 1, 1, 1, 1, 1,
-0.4513831, 0.1905151, -0.3575248, 1, 1, 1, 1, 1,
-0.4452742, 0.4395115, -1.97601, 1, 1, 1, 1, 1,
-0.437975, 0.1080224, -1.272093, 1, 1, 1, 1, 1,
-0.43714, 0.6841557, 0.6379623, 1, 1, 1, 1, 1,
-0.435298, 1.761888, 0.4904597, 0, 0, 1, 1, 1,
-0.4328035, 2.065459, -1.224503, 1, 0, 0, 1, 1,
-0.4326853, -1.984055, -2.960145, 1, 0, 0, 1, 1,
-0.4310663, 0.4767732, -0.9510763, 1, 0, 0, 1, 1,
-0.4301197, -0.8030269, -3.066727, 1, 0, 0, 1, 1,
-0.4264629, 0.3028373, -1.420205, 1, 0, 0, 1, 1,
-0.4247711, 0.214189, -1.122247, 0, 0, 0, 1, 1,
-0.4203711, 1.604818, -2.203821, 0, 0, 0, 1, 1,
-0.4190587, -0.03815623, 0.2763481, 0, 0, 0, 1, 1,
-0.4190484, -0.1197511, -2.864457, 0, 0, 0, 1, 1,
-0.4165694, 0.391514, -1.540592, 0, 0, 0, 1, 1,
-0.4148158, 0.876631, 0.6191061, 0, 0, 0, 1, 1,
-0.409539, -0.07763007, -2.722113, 0, 0, 0, 1, 1,
-0.4024515, 0.7629092, -0.612255, 1, 1, 1, 1, 1,
-0.3988891, 0.6981801, 1.263984, 1, 1, 1, 1, 1,
-0.3957222, 0.3499021, -0.6375437, 1, 1, 1, 1, 1,
-0.3953842, -3.185654, -1.838346, 1, 1, 1, 1, 1,
-0.3949211, -1.26345, -1.983279, 1, 1, 1, 1, 1,
-0.3925028, -2.262044, -3.567981, 1, 1, 1, 1, 1,
-0.3907559, 0.3602871, -2.570976, 1, 1, 1, 1, 1,
-0.3886356, -0.1199278, -1.703722, 1, 1, 1, 1, 1,
-0.3864321, 0.08108322, -0.9101483, 1, 1, 1, 1, 1,
-0.384924, -1.226733, -1.975848, 1, 1, 1, 1, 1,
-0.3843806, -1.048416, -2.927731, 1, 1, 1, 1, 1,
-0.3816889, 0.6021185, -2.2961, 1, 1, 1, 1, 1,
-0.3816656, 1.518065, 1.115427, 1, 1, 1, 1, 1,
-0.379912, 0.5846257, -0.6763542, 1, 1, 1, 1, 1,
-0.3797241, 0.08545262, -0.05146771, 1, 1, 1, 1, 1,
-0.3769352, 0.602692, -2.539763, 0, 0, 1, 1, 1,
-0.3750183, 0.1742227, -1.845287, 1, 0, 0, 1, 1,
-0.3668177, 0.6443837, -0.7268466, 1, 0, 0, 1, 1,
-0.3660826, 0.246269, -1.485575, 1, 0, 0, 1, 1,
-0.3648134, 1.106268, -1.224097, 1, 0, 0, 1, 1,
-0.3606645, -0.3327027, -2.54027, 1, 0, 0, 1, 1,
-0.3602243, 0.02248619, -1.226066, 0, 0, 0, 1, 1,
-0.3542108, -1.216619, -2.949791, 0, 0, 0, 1, 1,
-0.3498414, -0.7969701, -1.717027, 0, 0, 0, 1, 1,
-0.3483831, -1.504454, -1.67732, 0, 0, 0, 1, 1,
-0.3440549, -1.895143, -3.496505, 0, 0, 0, 1, 1,
-0.3413622, 0.1219303, -0.2748344, 0, 0, 0, 1, 1,
-0.3401156, -1.094957, -4.255734, 0, 0, 0, 1, 1,
-0.3393587, 0.7584328, -0.5889288, 1, 1, 1, 1, 1,
-0.3379553, 2.62257, -0.6381048, 1, 1, 1, 1, 1,
-0.3372443, -0.01462644, -2.746949, 1, 1, 1, 1, 1,
-0.337145, -1.454461, -2.044132, 1, 1, 1, 1, 1,
-0.3286004, 0.4795392, 0.689477, 1, 1, 1, 1, 1,
-0.3278622, -0.745152, -4.130667, 1, 1, 1, 1, 1,
-0.323482, -0.1676475, -1.870949, 1, 1, 1, 1, 1,
-0.3175605, 0.6931713, -2.361274, 1, 1, 1, 1, 1,
-0.3168362, -1.609952, -3.560853, 1, 1, 1, 1, 1,
-0.3033957, 0.05622592, -2.103086, 1, 1, 1, 1, 1,
-0.3023026, 0.565584, -0.7222669, 1, 1, 1, 1, 1,
-0.2916823, 0.2485886, -0.4919668, 1, 1, 1, 1, 1,
-0.2859082, -1.029885, -4.779645, 1, 1, 1, 1, 1,
-0.2848055, -0.3496279, -1.584933, 1, 1, 1, 1, 1,
-0.2833429, 0.9295573, 0.2655641, 1, 1, 1, 1, 1,
-0.2806883, -0.9659669, -3.097884, 0, 0, 1, 1, 1,
-0.2766544, 0.9840418, -1.464373, 1, 0, 0, 1, 1,
-0.2732894, 1.437817, -0.1794879, 1, 0, 0, 1, 1,
-0.2723759, 0.7735359, -0.2786222, 1, 0, 0, 1, 1,
-0.2722189, 0.2345238, -1.842075, 1, 0, 0, 1, 1,
-0.2713945, -0.1278076, -1.361908, 1, 0, 0, 1, 1,
-0.2663032, 0.1537932, -2.502951, 0, 0, 0, 1, 1,
-0.2610356, 0.6888394, -1.429781, 0, 0, 0, 1, 1,
-0.2604909, 0.2552084, 0.192324, 0, 0, 0, 1, 1,
-0.2581848, -0.4603215, -2.187335, 0, 0, 0, 1, 1,
-0.256841, -0.2978965, -1.932462, 0, 0, 0, 1, 1,
-0.2525301, -0.2704567, -1.353541, 0, 0, 0, 1, 1,
-0.2474305, 0.4928558, -0.8973391, 0, 0, 0, 1, 1,
-0.2455372, -0.7822293, -2.31052, 1, 1, 1, 1, 1,
-0.2424369, -0.0005751814, -1.150111, 1, 1, 1, 1, 1,
-0.2379455, 0.8631842, -0.3257424, 1, 1, 1, 1, 1,
-0.2369193, -0.4153464, -1.095436, 1, 1, 1, 1, 1,
-0.2364925, -0.6647087, -1.86155, 1, 1, 1, 1, 1,
-0.2360587, -1.176615, -5.981791, 1, 1, 1, 1, 1,
-0.2353761, 0.2602969, -0.9065327, 1, 1, 1, 1, 1,
-0.2216125, 0.6942051, 0.2475046, 1, 1, 1, 1, 1,
-0.2215727, -0.931617, -2.624526, 1, 1, 1, 1, 1,
-0.2179589, 0.5297011, -0.1024444, 1, 1, 1, 1, 1,
-0.2136082, 0.5812331, -0.1504633, 1, 1, 1, 1, 1,
-0.2134223, -1.170086, -3.570593, 1, 1, 1, 1, 1,
-0.2112357, 0.2002243, -0.8578964, 1, 1, 1, 1, 1,
-0.2038184, 1.703102, -0.6624649, 1, 1, 1, 1, 1,
-0.2036611, 1.371854, -2.451155, 1, 1, 1, 1, 1,
-0.2020235, -0.5104337, -1.425435, 0, 0, 1, 1, 1,
-0.1988335, 0.5038107, -0.2249459, 1, 0, 0, 1, 1,
-0.1946909, 1.308388, 0.7135645, 1, 0, 0, 1, 1,
-0.193708, -1.233142, -1.603817, 1, 0, 0, 1, 1,
-0.1915906, 1.14452, 0.9832492, 1, 0, 0, 1, 1,
-0.1903615, -0.3664477, -2.833593, 1, 0, 0, 1, 1,
-0.1895768, 1.122733, -0.6944791, 0, 0, 0, 1, 1,
-0.1875076, -1.063636, -5.327993, 0, 0, 0, 1, 1,
-0.1827132, 0.2845193, -0.9666944, 0, 0, 0, 1, 1,
-0.1823824, 0.8736567, -1.336399, 0, 0, 0, 1, 1,
-0.1807609, -1.362895, -3.307225, 0, 0, 0, 1, 1,
-0.1787806, 0.03780553, 0.001398266, 0, 0, 0, 1, 1,
-0.1780551, -1.223794, -2.303901, 0, 0, 0, 1, 1,
-0.174602, 0.7975101, -0.3783386, 1, 1, 1, 1, 1,
-0.1717491, 0.2765376, 0.355163, 1, 1, 1, 1, 1,
-0.1709609, 0.5484939, -0.4368721, 1, 1, 1, 1, 1,
-0.1708886, -0.2638888, -4.12317, 1, 1, 1, 1, 1,
-0.1687191, 0.1069366, -0.38283, 1, 1, 1, 1, 1,
-0.16859, 0.5762835, -0.5330041, 1, 1, 1, 1, 1,
-0.1658028, 0.1062482, -1.991455, 1, 1, 1, 1, 1,
-0.1657218, -0.1321188, -3.079536, 1, 1, 1, 1, 1,
-0.1646623, -0.2720214, -2.542559, 1, 1, 1, 1, 1,
-0.1645083, 1.685939, 0.1073299, 1, 1, 1, 1, 1,
-0.1639448, 1.698897, 0.2804601, 1, 1, 1, 1, 1,
-0.1590264, -0.3424125, -2.215181, 1, 1, 1, 1, 1,
-0.1578245, -0.7641153, -1.441728, 1, 1, 1, 1, 1,
-0.146918, 0.005382902, -2.195587, 1, 1, 1, 1, 1,
-0.1447154, 0.8211945, 0.8694777, 1, 1, 1, 1, 1,
-0.1423433, -0.092167, -2.390154, 0, 0, 1, 1, 1,
-0.1399285, 0.2809076, -2.157238, 1, 0, 0, 1, 1,
-0.135646, 0.6878519, -0.8091465, 1, 0, 0, 1, 1,
-0.135149, 1.07182, -0.3458817, 1, 0, 0, 1, 1,
-0.1342402, 0.794983, -1.315706, 1, 0, 0, 1, 1,
-0.130552, -0.5419644, -2.170312, 1, 0, 0, 1, 1,
-0.1241064, 1.0579, -0.4306049, 0, 0, 0, 1, 1,
-0.1232759, 0.5450693, -0.336995, 0, 0, 0, 1, 1,
-0.1216789, -0.186047, -3.709253, 0, 0, 0, 1, 1,
-0.119945, 1.277179, 1.736232, 0, 0, 0, 1, 1,
-0.1198744, 1.446965, -0.6527684, 0, 0, 0, 1, 1,
-0.1099213, -0.7256492, -2.607622, 0, 0, 0, 1, 1,
-0.1093942, -1.745844, -2.313348, 0, 0, 0, 1, 1,
-0.1029821, -0.7545655, -2.570311, 1, 1, 1, 1, 1,
-0.1026374, 1.488569, -0.2817721, 1, 1, 1, 1, 1,
-0.09997158, 0.2068727, -0.1054088, 1, 1, 1, 1, 1,
-0.09657209, 2.271947, -1.662282, 1, 1, 1, 1, 1,
-0.09515686, 1.112482, 1.242628, 1, 1, 1, 1, 1,
-0.09327248, 0.7030415, 0.5293682, 1, 1, 1, 1, 1,
-0.09190835, -0.009762727, -0.7615654, 1, 1, 1, 1, 1,
-0.09088991, -1.087994, -2.456115, 1, 1, 1, 1, 1,
-0.09003527, -1.047227, -4.417057, 1, 1, 1, 1, 1,
-0.08540868, -0.8270035, -3.526711, 1, 1, 1, 1, 1,
-0.08501941, -0.7905365, -4.015384, 1, 1, 1, 1, 1,
-0.08459117, 0.04004666, -1.157004, 1, 1, 1, 1, 1,
-0.08332911, 0.05690553, -1.85409, 1, 1, 1, 1, 1,
-0.07956015, -0.4186126, -1.982411, 1, 1, 1, 1, 1,
-0.07933414, -0.4466023, -3.679335, 1, 1, 1, 1, 1,
-0.07916985, -0.1726663, -2.283192, 0, 0, 1, 1, 1,
-0.07876267, 1.537642, -1.172558, 1, 0, 0, 1, 1,
-0.07642708, -0.7547304, -3.899899, 1, 0, 0, 1, 1,
-0.07638618, 0.1273323, 1.115161, 1, 0, 0, 1, 1,
-0.07493614, 2.161403, 0.7246227, 1, 0, 0, 1, 1,
-0.07371736, 0.7268953, -0.2451375, 1, 0, 0, 1, 1,
-0.07354476, 0.4752631, -2.064392, 0, 0, 0, 1, 1,
-0.07148846, 0.6984115, -0.4894335, 0, 0, 0, 1, 1,
-0.06922257, 0.4309104, -0.02685973, 0, 0, 0, 1, 1,
-0.0673961, -0.6270247, -1.957467, 0, 0, 0, 1, 1,
-0.06527638, 2.193949, -1.679488, 0, 0, 0, 1, 1,
-0.0634774, 1.529837, 0.1652091, 0, 0, 0, 1, 1,
-0.06226927, -0.7938457, -3.277857, 0, 0, 0, 1, 1,
-0.06155921, 0.7448615, -2.20407, 1, 1, 1, 1, 1,
-0.0550644, -0.9654945, -2.351166, 1, 1, 1, 1, 1,
-0.04489664, -0.416124, -2.701841, 1, 1, 1, 1, 1,
-0.04418541, 1.847658, 0.5944875, 1, 1, 1, 1, 1,
-0.04047228, 0.07343526, -0.6924841, 1, 1, 1, 1, 1,
-0.03170397, -0.7963468, -3.122231, 1, 1, 1, 1, 1,
-0.03038567, -1.071838, -1.598257, 1, 1, 1, 1, 1,
-0.02646183, 2.263802, 0.5850891, 1, 1, 1, 1, 1,
-0.02461019, -1.060543, -4.755252, 1, 1, 1, 1, 1,
-0.02278628, -0.199965, -2.946656, 1, 1, 1, 1, 1,
-0.01966191, -2.475526, -4.43772, 1, 1, 1, 1, 1,
-0.01934919, 0.3703871, 1.280666, 1, 1, 1, 1, 1,
-0.01866862, -0.7148747, -3.078895, 1, 1, 1, 1, 1,
-0.01360748, -0.2614924, -5.098829, 1, 1, 1, 1, 1,
-0.01107119, -1.837895, -1.441696, 1, 1, 1, 1, 1,
-0.003709755, -0.05229792, -5.508666, 0, 0, 1, 1, 1,
-0.002182268, 0.4841373, -1.169604, 1, 0, 0, 1, 1,
0.003739708, -1.995224, 3.193193, 1, 0, 0, 1, 1,
0.01512859, -0.1046346, 2.991885, 1, 0, 0, 1, 1,
0.01938062, 0.9016533, 1.124125, 1, 0, 0, 1, 1,
0.02078922, 2.745309, -0.6705283, 1, 0, 0, 1, 1,
0.02547299, 0.534888, 0.3782538, 0, 0, 0, 1, 1,
0.02717888, -0.3135183, 3.205028, 0, 0, 0, 1, 1,
0.03631531, 1.555682, 1.02885, 0, 0, 0, 1, 1,
0.03702551, 0.2318535, 0.2931543, 0, 0, 0, 1, 1,
0.04035262, -0.950074, 2.389766, 0, 0, 0, 1, 1,
0.04087723, -0.9098972, 4.062021, 0, 0, 0, 1, 1,
0.04321388, -1.289937, 1.956521, 0, 0, 0, 1, 1,
0.04816926, 0.6523395, -0.001381443, 1, 1, 1, 1, 1,
0.05026598, 1.736439, 1.91538, 1, 1, 1, 1, 1,
0.05115312, 1.285567, -1.407181, 1, 1, 1, 1, 1,
0.05597506, -0.6657235, 3.282958, 1, 1, 1, 1, 1,
0.05940087, -0.7079888, -0.3663545, 1, 1, 1, 1, 1,
0.05950367, 0.6567706, -0.4549441, 1, 1, 1, 1, 1,
0.06142122, -2.299132, 3.099858, 1, 1, 1, 1, 1,
0.06211135, 1.175819, 1.801762, 1, 1, 1, 1, 1,
0.06282959, 0.5159127, -0.4284748, 1, 1, 1, 1, 1,
0.06417073, 0.5883659, 0.007533573, 1, 1, 1, 1, 1,
0.06749687, 0.3750609, 2.277328, 1, 1, 1, 1, 1,
0.07247869, 0.2592832, 0.4662717, 1, 1, 1, 1, 1,
0.07256689, -1.037186, 2.911014, 1, 1, 1, 1, 1,
0.07331534, 0.2376958, 1.680048, 1, 1, 1, 1, 1,
0.07371545, 2.203638, -0.6422404, 1, 1, 1, 1, 1,
0.07421614, 1.036679, -1.00076, 0, 0, 1, 1, 1,
0.08025675, -0.7634962, 3.353683, 1, 0, 0, 1, 1,
0.08340456, 0.9873545, -0.4344998, 1, 0, 0, 1, 1,
0.08358743, 0.1864424, 0.805132, 1, 0, 0, 1, 1,
0.086496, -0.4822097, 4.278752, 1, 0, 0, 1, 1,
0.08950145, -1.816737, 0.8964859, 1, 0, 0, 1, 1,
0.09068379, 2.035085, -1.477863, 0, 0, 0, 1, 1,
0.09346822, -1.522523, 2.476685, 0, 0, 0, 1, 1,
0.09468237, 1.218418, 0.07099833, 0, 0, 0, 1, 1,
0.09584805, 0.930886, -0.4090295, 0, 0, 0, 1, 1,
0.1046478, 0.7670605, -0.5830693, 0, 0, 0, 1, 1,
0.1054917, 1.099467, 0.1248007, 0, 0, 0, 1, 1,
0.1063347, -0.9782874, 2.757268, 0, 0, 0, 1, 1,
0.1066739, -2.006821, 1.7908, 1, 1, 1, 1, 1,
0.1072436, -0.7126456, 2.704851, 1, 1, 1, 1, 1,
0.1125151, -0.4128884, 3.852282, 1, 1, 1, 1, 1,
0.1132587, -1.138529, 3.891198, 1, 1, 1, 1, 1,
0.1134362, -0.08376994, 2.742568, 1, 1, 1, 1, 1,
0.1135128, -0.9785693, 1.103871, 1, 1, 1, 1, 1,
0.1218814, 0.1847675, -0.9219347, 1, 1, 1, 1, 1,
0.1243204, -0.2997745, 3.151694, 1, 1, 1, 1, 1,
0.1244128, -0.4844544, 1.967089, 1, 1, 1, 1, 1,
0.1251847, -0.3265661, 2.687042, 1, 1, 1, 1, 1,
0.1261659, -1.042342, 4.0532, 1, 1, 1, 1, 1,
0.1269784, 0.3889096, 0.3431761, 1, 1, 1, 1, 1,
0.127206, 0.1430947, -0.5110145, 1, 1, 1, 1, 1,
0.1285427, -0.9422958, 2.483094, 1, 1, 1, 1, 1,
0.1308544, -2.431886, 1.686628, 1, 1, 1, 1, 1,
0.1315825, 0.5416499, 2.034522, 0, 0, 1, 1, 1,
0.1376542, 0.6012868, 1.501288, 1, 0, 0, 1, 1,
0.1387649, -1.459993, 1.917513, 1, 0, 0, 1, 1,
0.1510474, 1.286218, 0.4389907, 1, 0, 0, 1, 1,
0.1580484, 0.07817673, 1.970431, 1, 0, 0, 1, 1,
0.1584836, -1.113202, 2.860018, 1, 0, 0, 1, 1,
0.1595251, -0.3636788, 4.192505, 0, 0, 0, 1, 1,
0.1596144, -0.1975167, 2.51035, 0, 0, 0, 1, 1,
0.1618467, -0.7969265, 2.121845, 0, 0, 0, 1, 1,
0.1635537, 0.8134056, -0.8888322, 0, 0, 0, 1, 1,
0.1638079, -0.6158273, 3.728169, 0, 0, 0, 1, 1,
0.165039, 0.9079518, 0.5640748, 0, 0, 0, 1, 1,
0.1655159, 1.259251, 0.410219, 0, 0, 0, 1, 1,
0.1758116, 1.449707, -0.8249249, 1, 1, 1, 1, 1,
0.177072, 0.5798293, 0.5109452, 1, 1, 1, 1, 1,
0.1818099, 0.616375, 1.515545, 1, 1, 1, 1, 1,
0.1822448, 1.139851, -0.9010432, 1, 1, 1, 1, 1,
0.1841459, 0.2199111, -0.3920834, 1, 1, 1, 1, 1,
0.1857644, -0.9788718, 3.634444, 1, 1, 1, 1, 1,
0.1931671, 1.261243, -0.3858301, 1, 1, 1, 1, 1,
0.1956333, 0.4800074, -0.6129465, 1, 1, 1, 1, 1,
0.1968302, 0.5659658, -0.8329717, 1, 1, 1, 1, 1,
0.2031299, 0.3389699, 1.20971, 1, 1, 1, 1, 1,
0.207403, 0.1685054, 0.09426881, 1, 1, 1, 1, 1,
0.2140786, -1.009919, 1.388902, 1, 1, 1, 1, 1,
0.2146923, 0.7240468, -0.2444479, 1, 1, 1, 1, 1,
0.2194105, 0.1480996, -0.4425945, 1, 1, 1, 1, 1,
0.2196093, -0.9066846, 2.693164, 1, 1, 1, 1, 1,
0.2227809, -1.460862, 2.421472, 0, 0, 1, 1, 1,
0.2322794, 1.625372, 1.529051, 1, 0, 0, 1, 1,
0.2398977, -0.8411846, 2.162721, 1, 0, 0, 1, 1,
0.2419576, 1.550567, 1.10771, 1, 0, 0, 1, 1,
0.2464055, 0.09080236, -0.3734132, 1, 0, 0, 1, 1,
0.2479794, -0.5477637, 2.747013, 1, 0, 0, 1, 1,
0.2497369, 0.4766861, 1.535327, 0, 0, 0, 1, 1,
0.2563482, 0.3630023, 0.957397, 0, 0, 0, 1, 1,
0.2577379, 0.355902, 1.229549, 0, 0, 0, 1, 1,
0.2643843, 1.403666, 1.332553, 0, 0, 0, 1, 1,
0.264442, -0.07448321, 1.808689, 0, 0, 0, 1, 1,
0.2661348, -0.7689475, 2.412495, 0, 0, 0, 1, 1,
0.2661876, 0.4772418, 0.8365982, 0, 0, 0, 1, 1,
0.2672727, -0.3709659, 2.341805, 1, 1, 1, 1, 1,
0.2681437, -1.024181, 2.66199, 1, 1, 1, 1, 1,
0.2713814, 0.8855173, 0.8000914, 1, 1, 1, 1, 1,
0.2725461, 0.3304738, 1.265867, 1, 1, 1, 1, 1,
0.2751287, -0.2872072, 3.557245, 1, 1, 1, 1, 1,
0.2777981, -0.9052773, 2.944206, 1, 1, 1, 1, 1,
0.2817968, -0.9166562, 2.403884, 1, 1, 1, 1, 1,
0.282179, -0.8892177, 2.341654, 1, 1, 1, 1, 1,
0.2864276, 0.2972181, 1.045337, 1, 1, 1, 1, 1,
0.2869401, 0.3470448, -0.3089192, 1, 1, 1, 1, 1,
0.2970487, -1.710356, 1.313311, 1, 1, 1, 1, 1,
0.3016855, -1.032428, 4.23652, 1, 1, 1, 1, 1,
0.3028916, -0.8630339, 3.745447, 1, 1, 1, 1, 1,
0.306977, -1.225579, 3.028702, 1, 1, 1, 1, 1,
0.3085275, -0.1643925, 4.260325, 1, 1, 1, 1, 1,
0.3110563, -0.3577811, 2.725525, 0, 0, 1, 1, 1,
0.3166671, 0.694638, 2.948866, 1, 0, 0, 1, 1,
0.3172004, -0.582494, 3.017527, 1, 0, 0, 1, 1,
0.3229097, -1.152205, 2.556115, 1, 0, 0, 1, 1,
0.3245839, -2.008553, 2.52922, 1, 0, 0, 1, 1,
0.3257641, 0.3819882, 2.062763, 1, 0, 0, 1, 1,
0.3303323, 0.5132193, 0.8949356, 0, 0, 0, 1, 1,
0.3327449, 1.288275, -0.3112823, 0, 0, 0, 1, 1,
0.3341802, -1.127182, 4.659355, 0, 0, 0, 1, 1,
0.3343397, -0.5767201, 3.479135, 0, 0, 0, 1, 1,
0.3348567, 0.3533062, 2.230241, 0, 0, 0, 1, 1,
0.3351099, 0.05147725, 1.10884, 0, 0, 0, 1, 1,
0.3364221, -0.3113135, 2.084918, 0, 0, 0, 1, 1,
0.3366387, -1.012705, 3.822404, 1, 1, 1, 1, 1,
0.3380745, -2.006205, 3.302753, 1, 1, 1, 1, 1,
0.340512, -1.536506, 1.95999, 1, 1, 1, 1, 1,
0.340572, 0.007059996, 1.527922, 1, 1, 1, 1, 1,
0.3411665, 2.490788, -0.3593145, 1, 1, 1, 1, 1,
0.3434685, -0.2604333, 2.052998, 1, 1, 1, 1, 1,
0.3453852, -0.3002309, 2.899488, 1, 1, 1, 1, 1,
0.3459422, -0.320087, 4.0072, 1, 1, 1, 1, 1,
0.3475025, -1.464492, 4.747571, 1, 1, 1, 1, 1,
0.3481439, 0.6348142, 0.6022626, 1, 1, 1, 1, 1,
0.3486173, -0.4162906, 2.87166, 1, 1, 1, 1, 1,
0.349561, 0.8608508, 0.5020011, 1, 1, 1, 1, 1,
0.3499616, -0.6834813, 2.523257, 1, 1, 1, 1, 1,
0.3501154, 1.747637, -0.5155103, 1, 1, 1, 1, 1,
0.3503751, 0.8915923, -0.06874306, 1, 1, 1, 1, 1,
0.3504672, -1.517852, 1.470531, 0, 0, 1, 1, 1,
0.3510289, -0.1771234, 2.498184, 1, 0, 0, 1, 1,
0.3525136, 1.163517, -0.511, 1, 0, 0, 1, 1,
0.3528501, -1.281368, 4.266355, 1, 0, 0, 1, 1,
0.3533062, 1.49393, -0.08057681, 1, 0, 0, 1, 1,
0.3538889, -0.4657197, 0.8742095, 1, 0, 0, 1, 1,
0.3575527, -0.2579979, 2.564616, 0, 0, 0, 1, 1,
0.3576207, 1.641855, 0.003293809, 0, 0, 0, 1, 1,
0.3582233, 0.2067141, 0.4089944, 0, 0, 0, 1, 1,
0.359605, 0.2532839, 1.667954, 0, 0, 0, 1, 1,
0.3680393, -1.154893, 3.506712, 0, 0, 0, 1, 1,
0.3709861, 0.6624995, 1.158803, 0, 0, 0, 1, 1,
0.371045, -1.209767, 3.164264, 0, 0, 0, 1, 1,
0.3734471, 1.190829, -0.1489264, 1, 1, 1, 1, 1,
0.374563, 0.1449979, 1.331344, 1, 1, 1, 1, 1,
0.3774598, -0.522424, 3.091657, 1, 1, 1, 1, 1,
0.3786776, -0.6623847, 3.155497, 1, 1, 1, 1, 1,
0.379628, 0.8515639, -0.4452338, 1, 1, 1, 1, 1,
0.3800555, -1.561442, 1.610431, 1, 1, 1, 1, 1,
0.3823574, 0.7790861, 1.555275, 1, 1, 1, 1, 1,
0.392845, -0.5405425, 3.05522, 1, 1, 1, 1, 1,
0.3954231, -2.076002, 3.969723, 1, 1, 1, 1, 1,
0.3975897, -0.3850278, 3.554236, 1, 1, 1, 1, 1,
0.4015127, 0.7582257, -1.138227, 1, 1, 1, 1, 1,
0.4016229, 0.3694443, 1.306162, 1, 1, 1, 1, 1,
0.4028493, -0.9599291, 2.909001, 1, 1, 1, 1, 1,
0.4052336, 0.7528077, 1.290538, 1, 1, 1, 1, 1,
0.4179413, 0.3299317, 0.7202151, 1, 1, 1, 1, 1,
0.4198484, 0.757894, 0.9623226, 0, 0, 1, 1, 1,
0.4223294, -1.258626, 2.076011, 1, 0, 0, 1, 1,
0.4246868, 1.491229, 1.166971, 1, 0, 0, 1, 1,
0.4252977, 1.116745, 0.1417693, 1, 0, 0, 1, 1,
0.4256286, 0.7382345, 0.1752654, 1, 0, 0, 1, 1,
0.427183, 0.9166591, 1.371817, 1, 0, 0, 1, 1,
0.4282725, 0.5262074, -0.02845816, 0, 0, 0, 1, 1,
0.42898, 0.5816599, 0.06939519, 0, 0, 0, 1, 1,
0.4299401, -0.216832, 1.35177, 0, 0, 0, 1, 1,
0.4344857, -1.290507, 3.334184, 0, 0, 0, 1, 1,
0.4360576, -0.523167, 2.427692, 0, 0, 0, 1, 1,
0.4371471, 0.1649331, 2.761027, 0, 0, 0, 1, 1,
0.4431988, -1.502898, 1.443315, 0, 0, 0, 1, 1,
0.4449205, 0.1520798, -0.04405759, 1, 1, 1, 1, 1,
0.4457445, -1.148611, 3.036538, 1, 1, 1, 1, 1,
0.4476756, 1.369979, -0.3852667, 1, 1, 1, 1, 1,
0.4482486, -0.003720597, 2.468122, 1, 1, 1, 1, 1,
0.4519374, -0.9937052, 1.606237, 1, 1, 1, 1, 1,
0.4520088, 0.1327162, 1.348323, 1, 1, 1, 1, 1,
0.4584894, -0.5673649, 2.119164, 1, 1, 1, 1, 1,
0.4673287, 2.51354, -0.5135621, 1, 1, 1, 1, 1,
0.4720263, -0.3364863, 1.317064, 1, 1, 1, 1, 1,
0.4750777, -1.129295, 2.630028, 1, 1, 1, 1, 1,
0.4756774, 0.3573311, 2.591141, 1, 1, 1, 1, 1,
0.4769342, -0.08460711, -0.8127554, 1, 1, 1, 1, 1,
0.4815007, 0.6653655, -0.4483505, 1, 1, 1, 1, 1,
0.4842713, -0.440338, 1.056738, 1, 1, 1, 1, 1,
0.4873852, 0.165766, 0.8020668, 1, 1, 1, 1, 1,
0.4899996, 0.742831, -0.1659013, 0, 0, 1, 1, 1,
0.492005, -0.8768116, 2.973073, 1, 0, 0, 1, 1,
0.4941767, 0.9410771, 1.798245, 1, 0, 0, 1, 1,
0.5092925, -0.3662437, 3.657201, 1, 0, 0, 1, 1,
0.5103251, 0.4487494, 1.008633, 1, 0, 0, 1, 1,
0.5123211, -0.4387983, 0.1175678, 1, 0, 0, 1, 1,
0.5170989, -0.1292432, 1.298988, 0, 0, 0, 1, 1,
0.5210025, -0.6103585, 2.896274, 0, 0, 0, 1, 1,
0.5226425, 0.189885, 1.450438, 0, 0, 0, 1, 1,
0.5246278, 1.622904, 0.3709708, 0, 0, 0, 1, 1,
0.5271884, -0.292646, 0.6907858, 0, 0, 0, 1, 1,
0.528014, -0.412309, 1.653499, 0, 0, 0, 1, 1,
0.5345849, -0.1810532, 1.657226, 0, 0, 0, 1, 1,
0.5371941, -0.5009208, 3.15595, 1, 1, 1, 1, 1,
0.5380636, 1.387589, -0.3373984, 1, 1, 1, 1, 1,
0.5385489, 0.8018149, 2.148247, 1, 1, 1, 1, 1,
0.5487671, 0.3507124, 0.9810662, 1, 1, 1, 1, 1,
0.5489994, -0.8919567, 3.77778, 1, 1, 1, 1, 1,
0.5504173, 1.228327, -0.9458433, 1, 1, 1, 1, 1,
0.5549716, 0.8753493, 1.57099, 1, 1, 1, 1, 1,
0.55585, 0.430911, 0.2373309, 1, 1, 1, 1, 1,
0.559697, 0.4480237, 1.970307, 1, 1, 1, 1, 1,
0.570952, 0.03838299, 2.582905, 1, 1, 1, 1, 1,
0.5712593, 0.8008398, -0.5631854, 1, 1, 1, 1, 1,
0.5737491, -2.021572, 3.892603, 1, 1, 1, 1, 1,
0.5738775, -0.5850806, 2.908765, 1, 1, 1, 1, 1,
0.5776194, 0.03379411, 2.688859, 1, 1, 1, 1, 1,
0.5873848, 0.9735766, 0.164327, 1, 1, 1, 1, 1,
0.5899692, 0.1815295, 1.205723, 0, 0, 1, 1, 1,
0.5907933, -0.3881851, 1.182968, 1, 0, 0, 1, 1,
0.593228, -0.01397196, 2.29797, 1, 0, 0, 1, 1,
0.5997618, 1.504002, 0.6350194, 1, 0, 0, 1, 1,
0.6006753, -0.2329894, 2.394771, 1, 0, 0, 1, 1,
0.6090729, 0.1402029, 0.7849516, 1, 0, 0, 1, 1,
0.6163895, -0.06598376, 1.190689, 0, 0, 0, 1, 1,
0.6193708, -1.958802, 3.167762, 0, 0, 0, 1, 1,
0.6226717, -1.191196, 2.575152, 0, 0, 0, 1, 1,
0.6250658, -0.8493593, 2.311117, 0, 0, 0, 1, 1,
0.6265546, 1.295741, 0.4726412, 0, 0, 0, 1, 1,
0.6266708, -0.07483035, 2.438401, 0, 0, 0, 1, 1,
0.6280181, -0.3413196, -0.007517665, 0, 0, 0, 1, 1,
0.6318014, 0.7951536, 0.6765048, 1, 1, 1, 1, 1,
0.6372589, -0.2117602, 1.74688, 1, 1, 1, 1, 1,
0.6376713, -0.5125799, 1.733563, 1, 1, 1, 1, 1,
0.6429096, -0.7641771, 1.511957, 1, 1, 1, 1, 1,
0.6444547, 0.473113, 0.5993093, 1, 1, 1, 1, 1,
0.6468732, 0.6785282, 0.9563797, 1, 1, 1, 1, 1,
0.6494299, 0.2640388, 1.13081, 1, 1, 1, 1, 1,
0.65196, 1.087337, -0.8819649, 1, 1, 1, 1, 1,
0.6524802, 0.6607476, -0.6381429, 1, 1, 1, 1, 1,
0.6600319, -0.09679257, 1.80068, 1, 1, 1, 1, 1,
0.6626471, 0.1863339, 1.5966, 1, 1, 1, 1, 1,
0.6678978, -0.209276, 2.989007, 1, 1, 1, 1, 1,
0.6697599, -0.991105, 3.826, 1, 1, 1, 1, 1,
0.6754409, -0.3480249, 1.492756, 1, 1, 1, 1, 1,
0.6774155, -1.479421, 2.983065, 1, 1, 1, 1, 1,
0.6818141, -0.7214445, 2.752192, 0, 0, 1, 1, 1,
0.6888179, 0.8478829, 1.975456, 1, 0, 0, 1, 1,
0.6908385, 0.4035217, -0.3065776, 1, 0, 0, 1, 1,
0.6913661, -1.021008, 2.928615, 1, 0, 0, 1, 1,
0.6920897, -0.4358362, 3.689126, 1, 0, 0, 1, 1,
0.6921509, -0.5931255, 3.167051, 1, 0, 0, 1, 1,
0.6935208, 0.4425191, 1.743269, 0, 0, 0, 1, 1,
0.6990349, 0.2341206, 2.100712, 0, 0, 0, 1, 1,
0.7062359, -0.5215828, 1.182254, 0, 0, 0, 1, 1,
0.7081679, 0.08393133, 2.231458, 0, 0, 0, 1, 1,
0.7116285, 1.208359, 1.162538, 0, 0, 0, 1, 1,
0.7122993, 1.13177, 1.330189, 0, 0, 0, 1, 1,
0.7145514, -1.466257, 3.253525, 0, 0, 0, 1, 1,
0.7149534, 0.118796, 0.7040012, 1, 1, 1, 1, 1,
0.7166292, 1.388466, 1.191664, 1, 1, 1, 1, 1,
0.7168795, 0.7838703, 0.7643876, 1, 1, 1, 1, 1,
0.717462, 0.3061243, 2.944867, 1, 1, 1, 1, 1,
0.726422, -0.9440879, 2.731992, 1, 1, 1, 1, 1,
0.7311155, -0.6302509, 2.224225, 1, 1, 1, 1, 1,
0.733951, -0.6531621, 1.041474, 1, 1, 1, 1, 1,
0.7354969, -0.3784675, -0.5516251, 1, 1, 1, 1, 1,
0.7376861, 0.4629216, 1.313449, 1, 1, 1, 1, 1,
0.7408424, -0.944501, 2.24263, 1, 1, 1, 1, 1,
0.7482274, 1.931625, 0.8134676, 1, 1, 1, 1, 1,
0.7494442, -0.9147514, 2.687345, 1, 1, 1, 1, 1,
0.7502915, 0.5017028, -0.05666808, 1, 1, 1, 1, 1,
0.7532005, 0.371628, 2.384889, 1, 1, 1, 1, 1,
0.7568865, 1.505828, 1.566159, 1, 1, 1, 1, 1,
0.7583002, 0.4106936, 0.4510364, 0, 0, 1, 1, 1,
0.7596784, 0.6866851, 1.228293, 1, 0, 0, 1, 1,
0.7605618, 0.1093309, 2.950283, 1, 0, 0, 1, 1,
0.7608505, 0.1243345, 1.140836, 1, 0, 0, 1, 1,
0.7693693, -0.9226779, 1.52363, 1, 0, 0, 1, 1,
0.7720361, -0.9327193, 2.591083, 1, 0, 0, 1, 1,
0.7731308, -0.767628, 2.468768, 0, 0, 0, 1, 1,
0.7765042, 0.5497866, 1.893685, 0, 0, 0, 1, 1,
0.7780547, 0.4519687, 0.6014019, 0, 0, 0, 1, 1,
0.7787898, -0.7523896, 0.9084094, 0, 0, 0, 1, 1,
0.781163, 0.6339847, 1.262031, 0, 0, 0, 1, 1,
0.7812432, -0.9789345, 1.855546, 0, 0, 0, 1, 1,
0.7814411, 0.4806159, 1.300166, 0, 0, 0, 1, 1,
0.7819026, 0.2619595, 1.546548, 1, 1, 1, 1, 1,
0.7864423, 0.8754215, 1.233187, 1, 1, 1, 1, 1,
0.787185, -0.1183329, 2.818194, 1, 1, 1, 1, 1,
0.7883095, 0.9671435, -0.2373923, 1, 1, 1, 1, 1,
0.7883594, -1.798023, 1.69192, 1, 1, 1, 1, 1,
0.7883734, -0.2130852, 3.234197, 1, 1, 1, 1, 1,
0.7887784, -0.1854121, 0.7874686, 1, 1, 1, 1, 1,
0.8003132, 0.1047024, 1.789773, 1, 1, 1, 1, 1,
0.8003361, -0.7194789, 2.365443, 1, 1, 1, 1, 1,
0.8069613, 1.094241, 1.580308, 1, 1, 1, 1, 1,
0.8105332, 0.1090773, 0.4752007, 1, 1, 1, 1, 1,
0.8122079, -1.484767, 2.416489, 1, 1, 1, 1, 1,
0.8134314, 1.040543, 0.9501668, 1, 1, 1, 1, 1,
0.8237553, -0.5496098, 1.683702, 1, 1, 1, 1, 1,
0.8250117, -0.1361815, 3.023594, 1, 1, 1, 1, 1,
0.828179, -0.2672644, 1.84271, 0, 0, 1, 1, 1,
0.8296325, -0.03336819, 2.244612, 1, 0, 0, 1, 1,
0.8317699, 1.032926, -0.09254653, 1, 0, 0, 1, 1,
0.8340469, 1.811185, 1.183796, 1, 0, 0, 1, 1,
0.8391046, 0.0347357, 1.048536, 1, 0, 0, 1, 1,
0.8404763, -0.4813114, 3.869313, 1, 0, 0, 1, 1,
0.8404773, -1.223316, 4.243091, 0, 0, 0, 1, 1,
0.8431367, 1.087442, 2.616171, 0, 0, 0, 1, 1,
0.8462439, -0.7838789, 1.688075, 0, 0, 0, 1, 1,
0.8473591, -0.6207507, 3.983427, 0, 0, 0, 1, 1,
0.8505085, 1.572378, 0.9328917, 0, 0, 0, 1, 1,
0.8520008, -0.1732931, 0.5778477, 0, 0, 0, 1, 1,
0.8548231, -0.1578597, 1.318688, 0, 0, 0, 1, 1,
0.8562742, -0.6239923, 3.851319, 1, 1, 1, 1, 1,
0.8586218, -0.1400828, 1.813921, 1, 1, 1, 1, 1,
0.8620986, 0.8456722, 2.544313, 1, 1, 1, 1, 1,
0.8670681, 0.1551431, 0.1224431, 1, 1, 1, 1, 1,
0.8689023, -0.1311979, 1.798389, 1, 1, 1, 1, 1,
0.8754793, 0.4746305, 1.809926, 1, 1, 1, 1, 1,
0.8767, 1.250391, -1.845773, 1, 1, 1, 1, 1,
0.8768542, 0.6509235, 1.854555, 1, 1, 1, 1, 1,
0.8806793, -0.1257619, 3.233784, 1, 1, 1, 1, 1,
0.8827437, -0.4318428, 3.099447, 1, 1, 1, 1, 1,
0.8834073, 1.054464, 0.8183371, 1, 1, 1, 1, 1,
0.8842701, 0.6702376, 0.7877468, 1, 1, 1, 1, 1,
0.8891389, -0.03513814, 1.396942, 1, 1, 1, 1, 1,
0.894436, -0.4638424, 0.1505568, 1, 1, 1, 1, 1,
0.8989005, -0.5892627, 1.84022, 1, 1, 1, 1, 1,
0.9018741, -0.5632302, 2.165024, 0, 0, 1, 1, 1,
0.9055872, -1.141645, 1.22991, 1, 0, 0, 1, 1,
0.9091619, 1.194798, 1.012274, 1, 0, 0, 1, 1,
0.9103525, 0.538231, 1.761894, 1, 0, 0, 1, 1,
0.9150416, 1.888432, 0.9172236, 1, 0, 0, 1, 1,
0.9163613, -0.02051468, 0.8181832, 1, 0, 0, 1, 1,
0.9203454, -1.175102, 3.272378, 0, 0, 0, 1, 1,
0.9216425, 0.7373158, -0.04484499, 0, 0, 0, 1, 1,
0.922648, 0.2396241, 0.2574989, 0, 0, 0, 1, 1,
0.9234565, -2.431994, 1.777861, 0, 0, 0, 1, 1,
0.9255879, 1.478292, 0.5841513, 0, 0, 0, 1, 1,
0.9267013, 2.236354, -0.7220005, 0, 0, 0, 1, 1,
0.9303666, -1.102149, 4.49569, 0, 0, 0, 1, 1,
0.9303849, 0.01999554, 3.145456, 1, 1, 1, 1, 1,
0.9355476, -0.1263907, 0.9156457, 1, 1, 1, 1, 1,
0.9359846, -0.5237538, 2.940463, 1, 1, 1, 1, 1,
0.9404966, 1.708145, -0.2405168, 1, 1, 1, 1, 1,
0.9446675, -0.8055527, 0.5471722, 1, 1, 1, 1, 1,
0.9499255, -0.7597877, 2.843463, 1, 1, 1, 1, 1,
0.9523509, 1.222268, -0.1848216, 1, 1, 1, 1, 1,
0.9524404, 0.8591949, 0.8419521, 1, 1, 1, 1, 1,
0.9571767, 0.8071536, -0.07155613, 1, 1, 1, 1, 1,
0.9613479, -1.285716, 2.72522, 1, 1, 1, 1, 1,
0.9636174, -1.759068, 2.745835, 1, 1, 1, 1, 1,
0.9655867, -0.003113898, -0.1909666, 1, 1, 1, 1, 1,
0.967932, 0.8648786, 3.118507, 1, 1, 1, 1, 1,
0.9714016, 0.0974398, 0.2830345, 1, 1, 1, 1, 1,
0.9721946, 0.146827, -0.05020254, 1, 1, 1, 1, 1,
0.9731531, 0.4081271, 1.877116, 0, 0, 1, 1, 1,
0.9761022, 0.06657779, 1.509267, 1, 0, 0, 1, 1,
0.9767027, -0.5393197, 2.157808, 1, 0, 0, 1, 1,
0.9796621, -0.2149715, 4.322567, 1, 0, 0, 1, 1,
0.9803421, -0.3872042, -0.1660215, 1, 0, 0, 1, 1,
0.983025, -0.930336, 3.445065, 1, 0, 0, 1, 1,
0.9887364, -0.1438295, 2.807461, 0, 0, 0, 1, 1,
1.004646, 1.209333, 0.04218344, 0, 0, 0, 1, 1,
1.012114, -0.08791821, 1.064256, 0, 0, 0, 1, 1,
1.013921, -0.5912103, 2.179034, 0, 0, 0, 1, 1,
1.014558, 1.452767, 0.3637434, 0, 0, 0, 1, 1,
1.022464, 0.8246834, -0.09897326, 0, 0, 0, 1, 1,
1.023048, -0.2133387, 2.099816, 0, 0, 0, 1, 1,
1.037003, -1.22295, 3.108501, 1, 1, 1, 1, 1,
1.049863, 0.3388832, 2.088026, 1, 1, 1, 1, 1,
1.056827, -0.1089851, 1.625374, 1, 1, 1, 1, 1,
1.060312, -0.1514829, 1.999536, 1, 1, 1, 1, 1,
1.063594, -0.1230851, 3.204517, 1, 1, 1, 1, 1,
1.067187, 0.625556, 1.137588, 1, 1, 1, 1, 1,
1.07076, 0.8701296, -0.4558246, 1, 1, 1, 1, 1,
1.072369, 1.277695, 1.694081, 1, 1, 1, 1, 1,
1.08535, -0.03477613, 0.7867985, 1, 1, 1, 1, 1,
1.088057, 2.141995, 1.679377, 1, 1, 1, 1, 1,
1.092236, -1.056349, 2.826801, 1, 1, 1, 1, 1,
1.092883, -0.2735823, 3.07365, 1, 1, 1, 1, 1,
1.09456, 0.1588513, 0.555916, 1, 1, 1, 1, 1,
1.103421, -1.472786, 2.695164, 1, 1, 1, 1, 1,
1.110528, -1.736487, 2.967674, 1, 1, 1, 1, 1,
1.111995, 0.09177736, 2.539941, 0, 0, 1, 1, 1,
1.114589, 0.5748104, 2.470104, 1, 0, 0, 1, 1,
1.114953, 1.570443, 1.438587, 1, 0, 0, 1, 1,
1.115189, -2.266131, 3.034153, 1, 0, 0, 1, 1,
1.119572, -1.346244, 0.7747118, 1, 0, 0, 1, 1,
1.129536, -2.573125, 3.093843, 1, 0, 0, 1, 1,
1.13471, -0.211112, 1.809701, 0, 0, 0, 1, 1,
1.139137, -1.200617, 1.760512, 0, 0, 0, 1, 1,
1.140653, 0.3435121, 1.580644, 0, 0, 0, 1, 1,
1.141072, -0.7688383, 1.643138, 0, 0, 0, 1, 1,
1.145523, -1.358164, 1.916752, 0, 0, 0, 1, 1,
1.152863, 0.4721405, -0.8040988, 0, 0, 0, 1, 1,
1.157678, 0.1275285, 1.035282, 0, 0, 0, 1, 1,
1.163804, -1.702583, 2.548762, 1, 1, 1, 1, 1,
1.165675, 0.8560349, 1.101676, 1, 1, 1, 1, 1,
1.170647, -1.776255, 2.568141, 1, 1, 1, 1, 1,
1.172434, -1.20631, 1.772724, 1, 1, 1, 1, 1,
1.19045, -0.2013547, 1.81522, 1, 1, 1, 1, 1,
1.206033, -1.512833, 2.619317, 1, 1, 1, 1, 1,
1.213024, 0.026133, 0.6356104, 1, 1, 1, 1, 1,
1.216323, 1.441006, -0.1039031, 1, 1, 1, 1, 1,
1.216674, 0.8699178, -0.1054559, 1, 1, 1, 1, 1,
1.216971, -1.623245, 3.744781, 1, 1, 1, 1, 1,
1.218758, -0.5364115, 0.0933434, 1, 1, 1, 1, 1,
1.219326, -1.25498, 1.757433, 1, 1, 1, 1, 1,
1.23081, -0.3041559, 2.096105, 1, 1, 1, 1, 1,
1.232048, -1.574121, 3.251931, 1, 1, 1, 1, 1,
1.233414, -2.06289, 1.229266, 1, 1, 1, 1, 1,
1.245024, 1.927079, 1.54779, 0, 0, 1, 1, 1,
1.245333, 0.05404838, 0.9071995, 1, 0, 0, 1, 1,
1.245763, 1.106586, 0.776027, 1, 0, 0, 1, 1,
1.25238, 1.7942, -0.1424689, 1, 0, 0, 1, 1,
1.257073, 0.3259192, 1.975058, 1, 0, 0, 1, 1,
1.269198, -1.734929, 2.595871, 1, 0, 0, 1, 1,
1.269729, 2.383409, 0.5945317, 0, 0, 0, 1, 1,
1.271282, -0.7356203, 1.606933, 0, 0, 0, 1, 1,
1.275757, -1.927708, 3.264885, 0, 0, 0, 1, 1,
1.276006, -0.476208, 1.915519, 0, 0, 0, 1, 1,
1.283773, 0.7540868, 0.2089086, 0, 0, 0, 1, 1,
1.290305, 0.8146642, 0.692619, 0, 0, 0, 1, 1,
1.292502, 1.326384, 1.610466, 0, 0, 0, 1, 1,
1.309664, 1.051686, 1.194515, 1, 1, 1, 1, 1,
1.316431, 0.803248, 0.2099044, 1, 1, 1, 1, 1,
1.323053, -0.5246057, 2.608942, 1, 1, 1, 1, 1,
1.324134, 0.3541324, 0.03165898, 1, 1, 1, 1, 1,
1.328114, 0.3653096, 2.123363, 1, 1, 1, 1, 1,
1.33094, -1.052942, 2.090257, 1, 1, 1, 1, 1,
1.335589, 1.218709, 0.8119019, 1, 1, 1, 1, 1,
1.34481, 1.555382, -0.1015002, 1, 1, 1, 1, 1,
1.348137, 0.5056292, 0.3462646, 1, 1, 1, 1, 1,
1.362357, 2.060058, -0.2868453, 1, 1, 1, 1, 1,
1.373339, 0.2791804, -1.082182, 1, 1, 1, 1, 1,
1.384774, 1.903931, -0.3090061, 1, 1, 1, 1, 1,
1.391459, 1.293231, -0.2689637, 1, 1, 1, 1, 1,
1.398067, 0.5072412, -0.02958652, 1, 1, 1, 1, 1,
1.409578, -0.4885752, 1.274385, 1, 1, 1, 1, 1,
1.419711, -0.6136174, 3.170581, 0, 0, 1, 1, 1,
1.430814, 0.6027846, -0.1169313, 1, 0, 0, 1, 1,
1.434668, -0.6726401, 0.8104928, 1, 0, 0, 1, 1,
1.442046, -0.4797519, 3.212554, 1, 0, 0, 1, 1,
1.450487, -1.268673, 0.7808432, 1, 0, 0, 1, 1,
1.454061, 1.215335, 0.6466851, 1, 0, 0, 1, 1,
1.469037, -1.137228, 1.339227, 0, 0, 0, 1, 1,
1.477087, 0.09630451, 2.253036, 0, 0, 0, 1, 1,
1.481798, -1.77501, 3.910292, 0, 0, 0, 1, 1,
1.485407, 1.544176, -0.1111478, 0, 0, 0, 1, 1,
1.505395, 1.561698, 0.9309139, 0, 0, 0, 1, 1,
1.514894, 0.6409812, 0.2709315, 0, 0, 0, 1, 1,
1.520671, -1.279502, 0.2495338, 0, 0, 0, 1, 1,
1.521919, -0.9826605, 2.226635, 1, 1, 1, 1, 1,
1.526546, -1.557866, 3.044342, 1, 1, 1, 1, 1,
1.529379, 0.2285758, 1.442336, 1, 1, 1, 1, 1,
1.532842, -1.094735, -0.001882859, 1, 1, 1, 1, 1,
1.533001, -0.06018287, 0.8878103, 1, 1, 1, 1, 1,
1.540451, 0.9704267, -0.02962493, 1, 1, 1, 1, 1,
1.542298, -1.265326, 1.998599, 1, 1, 1, 1, 1,
1.545438, 0.758943, 1.081265, 1, 1, 1, 1, 1,
1.546186, -1.196577, 2.422477, 1, 1, 1, 1, 1,
1.563903, -0.7519663, 2.05792, 1, 1, 1, 1, 1,
1.579489, 1.364181, 0.05224068, 1, 1, 1, 1, 1,
1.585892, 1.158934, 1.19825, 1, 1, 1, 1, 1,
1.589424, 0.4310768, 2.398265, 1, 1, 1, 1, 1,
1.592104, 0.3077064, 1.852827, 1, 1, 1, 1, 1,
1.596453, -0.4596697, 1.927709, 1, 1, 1, 1, 1,
1.596777, -0.2859216, 1.859693, 0, 0, 1, 1, 1,
1.604517, -1.438687, 1.233786, 1, 0, 0, 1, 1,
1.611917, 0.9778875, -0.1636197, 1, 0, 0, 1, 1,
1.632355, -0.3444843, 2.050529, 1, 0, 0, 1, 1,
1.634127, -0.02057346, 3.46269, 1, 0, 0, 1, 1,
1.645487, -1.054077, 2.400296, 1, 0, 0, 1, 1,
1.649993, -0.6264741, -0.3653414, 0, 0, 0, 1, 1,
1.664273, 0.20365, 0.8528528, 0, 0, 0, 1, 1,
1.670323, -0.3446175, 2.531938, 0, 0, 0, 1, 1,
1.670753, -1.108516, 1.595669, 0, 0, 0, 1, 1,
1.682577, -0.4467967, 3.231021, 0, 0, 0, 1, 1,
1.684561, -1.396148, 2.940812, 0, 0, 0, 1, 1,
1.689983, -1.113765, 3.355729, 0, 0, 0, 1, 1,
1.71137, -0.6551732, 1.443204, 1, 1, 1, 1, 1,
1.772472, 0.2664427, 2.41659, 1, 1, 1, 1, 1,
1.7775, -0.9220493, 2.300279, 1, 1, 1, 1, 1,
1.784191, -1.39399, 3.416536, 1, 1, 1, 1, 1,
1.785421, -0.01927153, 1.405201, 1, 1, 1, 1, 1,
1.787274, 1.607884, -0.2433041, 1, 1, 1, 1, 1,
1.799414, -1.030295, 1.113812, 1, 1, 1, 1, 1,
1.804536, 0.626102, 0.511988, 1, 1, 1, 1, 1,
1.83258, -0.1219611, 2.314826, 1, 1, 1, 1, 1,
1.83421, -0.8649721, 0.5545237, 1, 1, 1, 1, 1,
1.848455, 1.056632, -0.4978115, 1, 1, 1, 1, 1,
1.850575, 1.107558, 1.189737, 1, 1, 1, 1, 1,
1.857615, -1.235484, -0.229925, 1, 1, 1, 1, 1,
1.869714, -0.2547257, 1.049835, 1, 1, 1, 1, 1,
1.876203, -0.922559, 0.2182494, 1, 1, 1, 1, 1,
1.897996, -0.4484932, 2.104321, 0, 0, 1, 1, 1,
1.943038, -0.6534607, 3.382977, 1, 0, 0, 1, 1,
2.029652, 1.493051, 1.255539, 1, 0, 0, 1, 1,
2.03174, 0.7884924, 1.357765, 1, 0, 0, 1, 1,
2.040193, 1.12448, -0.8261561, 1, 0, 0, 1, 1,
2.067166, 0.1779827, 0.02588855, 1, 0, 0, 1, 1,
2.140715, -1.190913, 1.739904, 0, 0, 0, 1, 1,
2.170739, 0.437539, 2.57493, 0, 0, 0, 1, 1,
2.184724, 0.8273075, 1.285049, 0, 0, 0, 1, 1,
2.213594, 0.9393528, 0.4119838, 0, 0, 0, 1, 1,
2.244068, 0.2265379, 1.56514, 0, 0, 0, 1, 1,
2.324039, 0.07426368, 1.012968, 0, 0, 0, 1, 1,
2.334082, -1.531014, 2.024593, 0, 0, 0, 1, 1,
2.438789, -0.5572088, 2.590271, 1, 1, 1, 1, 1,
2.520788, 1.277429, 1.399008, 1, 1, 1, 1, 1,
2.527825, -1.424771, 2.417714, 1, 1, 1, 1, 1,
2.570336, -0.9156032, -0.1522859, 1, 1, 1, 1, 1,
2.588121, 1.249849, 0.8046036, 1, 1, 1, 1, 1,
2.708883, 1.19243, 2.922969, 1, 1, 1, 1, 1,
2.778552, 0.9267587, 1.618103, 1, 1, 1, 1, 1
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
var radius = 9.425949;
var distance = 33.10825;
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
mvMatrix.translate( 0.1757542, 0.4119519, 0.6171103 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.10825);
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
