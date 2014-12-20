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
-3.000919, -2.065969, -2.014673, 1, 0, 0, 1,
-2.717947, 0.6890653, -0.3400443, 1, 0.007843138, 0, 1,
-2.683866, 0.9843853, -1.328504, 1, 0.01176471, 0, 1,
-2.466925, -0.6062432, -1.855341, 1, 0.01960784, 0, 1,
-2.458947, -0.4013925, 0.2976192, 1, 0.02352941, 0, 1,
-2.452831, -2.582381, -2.522227, 1, 0.03137255, 0, 1,
-2.434752, 0.2690203, -0.4688987, 1, 0.03529412, 0, 1,
-2.363451, 1.046922, 0.5507044, 1, 0.04313726, 0, 1,
-2.327141, 0.3631575, -1.494047, 1, 0.04705882, 0, 1,
-2.313577, -1.119742, -1.667544, 1, 0.05490196, 0, 1,
-2.2912, -1.198046, -3.700376, 1, 0.05882353, 0, 1,
-2.2444, -0.5050398, -3.681446, 1, 0.06666667, 0, 1,
-2.208592, -1.002252, -0.8882471, 1, 0.07058824, 0, 1,
-2.207103, 0.5914724, 0.5218501, 1, 0.07843138, 0, 1,
-2.1924, -0.4467469, -0.4854987, 1, 0.08235294, 0, 1,
-2.181246, 0.7871752, -1.770273, 1, 0.09019608, 0, 1,
-2.133852, 0.7106163, -1.933448, 1, 0.09411765, 0, 1,
-2.068512, -0.01361552, -2.30594, 1, 0.1019608, 0, 1,
-2.056378, -0.0678248, -0.3426222, 1, 0.1098039, 0, 1,
-2.042236, -0.4195247, -2.182709, 1, 0.1137255, 0, 1,
-1.983664, -0.2527277, -1.121205, 1, 0.1215686, 0, 1,
-1.929093, -1.206047, -2.081004, 1, 0.1254902, 0, 1,
-1.90202, -1.390774, -3.700334, 1, 0.1333333, 0, 1,
-1.894637, 2.435433, 0.2412594, 1, 0.1372549, 0, 1,
-1.890598, 0.704217, -1.596359, 1, 0.145098, 0, 1,
-1.885002, -0.6546424, -2.810838, 1, 0.1490196, 0, 1,
-1.883722, -0.3412151, -0.7293094, 1, 0.1568628, 0, 1,
-1.882804, -0.6338189, -3.25469, 1, 0.1607843, 0, 1,
-1.87826, -0.5102801, -0.5506871, 1, 0.1686275, 0, 1,
-1.845579, 0.5739846, 0.719596, 1, 0.172549, 0, 1,
-1.839772, -1.571714, -2.504793, 1, 0.1803922, 0, 1,
-1.812215, 1.485807, -0.9448073, 1, 0.1843137, 0, 1,
-1.810382, 0.666612, -0.9236644, 1, 0.1921569, 0, 1,
-1.797327, 0.6628606, -1.542309, 1, 0.1960784, 0, 1,
-1.781229, -0.2643384, -1.521954, 1, 0.2039216, 0, 1,
-1.766053, -0.4879284, -1.127246, 1, 0.2117647, 0, 1,
-1.745896, 1.425427, 0.08926732, 1, 0.2156863, 0, 1,
-1.741279, -0.8247026, -2.645005, 1, 0.2235294, 0, 1,
-1.740969, -0.6131657, -2.051973, 1, 0.227451, 0, 1,
-1.704803, -0.1262924, -0.6202592, 1, 0.2352941, 0, 1,
-1.670933, -1.621512, -3.064778, 1, 0.2392157, 0, 1,
-1.656532, 0.09925491, -0.7233654, 1, 0.2470588, 0, 1,
-1.636645, 1.684206, -1.416389, 1, 0.2509804, 0, 1,
-1.623395, 0.3956745, -0.7107661, 1, 0.2588235, 0, 1,
-1.606173, -0.3566854, -1.471432, 1, 0.2627451, 0, 1,
-1.591533, 0.6663173, -1.549443, 1, 0.2705882, 0, 1,
-1.568486, 0.04900554, -1.350907, 1, 0.2745098, 0, 1,
-1.559955, -0.8858024, -1.819926, 1, 0.282353, 0, 1,
-1.55994, -0.3289174, -1.69731, 1, 0.2862745, 0, 1,
-1.546664, 0.6678328, -0.9712498, 1, 0.2941177, 0, 1,
-1.539202, 0.3219765, 0.770058, 1, 0.3019608, 0, 1,
-1.523847, -1.096535, -2.524029, 1, 0.3058824, 0, 1,
-1.521601, 0.06401453, -2.132164, 1, 0.3137255, 0, 1,
-1.521404, -0.5606344, -0.5339346, 1, 0.3176471, 0, 1,
-1.520886, 1.398207, -1.717415, 1, 0.3254902, 0, 1,
-1.513947, -0.9302959, -2.048104, 1, 0.3294118, 0, 1,
-1.50879, -0.4642149, -0.5491417, 1, 0.3372549, 0, 1,
-1.508382, 0.9516788, -0.01170679, 1, 0.3411765, 0, 1,
-1.499198, 0.4714784, -0.1124058, 1, 0.3490196, 0, 1,
-1.495237, 1.360369, -1.527575, 1, 0.3529412, 0, 1,
-1.490485, -1.122576, -2.07055, 1, 0.3607843, 0, 1,
-1.485808, 0.9499327, -1.267542, 1, 0.3647059, 0, 1,
-1.468646, -1.341501, -2.379325, 1, 0.372549, 0, 1,
-1.468477, -0.5826876, -1.705114, 1, 0.3764706, 0, 1,
-1.441859, 1.495765, 1.690721, 1, 0.3843137, 0, 1,
-1.440952, -0.3962528, -3.035671, 1, 0.3882353, 0, 1,
-1.435885, 1.091111, -2.237042, 1, 0.3960784, 0, 1,
-1.435389, 2.198483, -2.441066, 1, 0.4039216, 0, 1,
-1.435175, 0.1721222, -1.217086, 1, 0.4078431, 0, 1,
-1.428111, 0.3677647, -3.348474, 1, 0.4156863, 0, 1,
-1.412511, -0.3133203, -2.885661, 1, 0.4196078, 0, 1,
-1.410592, 0.1190948, -1.284726, 1, 0.427451, 0, 1,
-1.407134, -0.784826, -3.157461, 1, 0.4313726, 0, 1,
-1.369624, 1.239947, 0.1263721, 1, 0.4392157, 0, 1,
-1.365629, -0.7798339, -1.701426, 1, 0.4431373, 0, 1,
-1.364641, -0.006602465, -1.323851, 1, 0.4509804, 0, 1,
-1.330998, 0.2031513, -0.7460877, 1, 0.454902, 0, 1,
-1.301402, -0.3405216, 0.06865453, 1, 0.4627451, 0, 1,
-1.298401, -0.07172087, -0.560956, 1, 0.4666667, 0, 1,
-1.295402, 0.06982365, 0.0618217, 1, 0.4745098, 0, 1,
-1.28979, -1.245601, -1.865869, 1, 0.4784314, 0, 1,
-1.278274, 0.8980458, -1.517027, 1, 0.4862745, 0, 1,
-1.251371, 0.3081751, 0.4702688, 1, 0.4901961, 0, 1,
-1.249699, -0.3482927, -1.806466, 1, 0.4980392, 0, 1,
-1.243614, 1.575234, 0.6011741, 1, 0.5058824, 0, 1,
-1.2422, -1.984656, -2.164514, 1, 0.509804, 0, 1,
-1.239091, -2.727499, -2.673002, 1, 0.5176471, 0, 1,
-1.237321, 0.4002386, -0.2228055, 1, 0.5215687, 0, 1,
-1.232361, -1.085035, -2.168209, 1, 0.5294118, 0, 1,
-1.231147, 1.160705, -0.7507348, 1, 0.5333334, 0, 1,
-1.230219, -0.5352129, -1.802351, 1, 0.5411765, 0, 1,
-1.21551, 0.6087912, -1.038086, 1, 0.5450981, 0, 1,
-1.210706, 0.3959285, -1.907336, 1, 0.5529412, 0, 1,
-1.207954, -1.069127, -3.243981, 1, 0.5568628, 0, 1,
-1.207709, -0.1794148, -1.8225, 1, 0.5647059, 0, 1,
-1.198635, 0.9073052, -1.70778, 1, 0.5686275, 0, 1,
-1.194316, 0.9812219, 0.4938657, 1, 0.5764706, 0, 1,
-1.191096, -0.7032944, -0.898306, 1, 0.5803922, 0, 1,
-1.190628, 0.651597, -1.130549, 1, 0.5882353, 0, 1,
-1.186049, -0.3670064, -1.430304, 1, 0.5921569, 0, 1,
-1.178378, -0.009252205, -2.511124, 1, 0.6, 0, 1,
-1.17501, -0.5991939, -1.801182, 1, 0.6078432, 0, 1,
-1.167844, -0.1979918, -1.662919, 1, 0.6117647, 0, 1,
-1.167057, 0.5963852, -0.3329335, 1, 0.6196079, 0, 1,
-1.163618, 0.05239184, -1.243234, 1, 0.6235294, 0, 1,
-1.163422, 0.5407245, -1.72428, 1, 0.6313726, 0, 1,
-1.147628, 0.7906085, -1.088104, 1, 0.6352941, 0, 1,
-1.144802, 0.3682379, -0.5400921, 1, 0.6431373, 0, 1,
-1.144174, 0.4998307, -0.4909214, 1, 0.6470588, 0, 1,
-1.132709, -1.811054, -2.498729, 1, 0.654902, 0, 1,
-1.130565, -0.4139131, -1.497707, 1, 0.6588235, 0, 1,
-1.120211, -0.3298569, -2.537415, 1, 0.6666667, 0, 1,
-1.117788, 0.4137212, -1.842929, 1, 0.6705883, 0, 1,
-1.113824, 1.237723, -1.539276, 1, 0.6784314, 0, 1,
-1.109836, 2.59093, -1.338567, 1, 0.682353, 0, 1,
-1.106419, -1.614306, -3.271881, 1, 0.6901961, 0, 1,
-1.100863, -0.9480132, -3.642871, 1, 0.6941177, 0, 1,
-1.092886, -1.383975, -2.439545, 1, 0.7019608, 0, 1,
-1.092769, -2.912276, -0.7246083, 1, 0.7098039, 0, 1,
-1.092553, 0.7557256, -2.017354, 1, 0.7137255, 0, 1,
-1.092469, 0.2680692, -1.36949, 1, 0.7215686, 0, 1,
-1.089238, 0.7050064, -0.1462522, 1, 0.7254902, 0, 1,
-1.086819, 0.9739519, -0.8136175, 1, 0.7333333, 0, 1,
-1.085673, 0.9530053, -0.6796203, 1, 0.7372549, 0, 1,
-1.084938, 0.9214883, -1.445678, 1, 0.7450981, 0, 1,
-1.084259, 0.4510634, -0.5125918, 1, 0.7490196, 0, 1,
-1.082175, -0.8335474, -1.406818, 1, 0.7568628, 0, 1,
-1.073014, 0.9045566, -0.1899529, 1, 0.7607843, 0, 1,
-1.072959, 0.5739202, 0.09959911, 1, 0.7686275, 0, 1,
-1.071972, -0.4161704, -1.23156, 1, 0.772549, 0, 1,
-1.07083, -0.9387236, -1.692528, 1, 0.7803922, 0, 1,
-1.068868, -1.046761, -0.8656566, 1, 0.7843137, 0, 1,
-1.063405, -1.05214, -2.701513, 1, 0.7921569, 0, 1,
-1.05994, -1.597373, -1.470086, 1, 0.7960784, 0, 1,
-1.055711, 0.1004439, -1.682371, 1, 0.8039216, 0, 1,
-1.053208, 0.549909, -2.273197, 1, 0.8117647, 0, 1,
-1.051857, 0.6246627, -0.4169399, 1, 0.8156863, 0, 1,
-1.048409, 0.05762685, -1.159908, 1, 0.8235294, 0, 1,
-1.047168, -0.6768457, -1.199747, 1, 0.827451, 0, 1,
-1.046534, 0.225325, -0.9130188, 1, 0.8352941, 0, 1,
-1.043867, 0.05333471, -1.446964, 1, 0.8392157, 0, 1,
-1.040408, 1.263706, 0.9571961, 1, 0.8470588, 0, 1,
-1.035899, -0.09345035, -1.248044, 1, 0.8509804, 0, 1,
-1.033908, -0.03506955, -0.798883, 1, 0.8588235, 0, 1,
-1.027859, 1.008475, -0.5774934, 1, 0.8627451, 0, 1,
-1.027104, 0.2272402, -1.269777, 1, 0.8705882, 0, 1,
-1.025229, -0.8507756, -3.547102, 1, 0.8745098, 0, 1,
-1.024697, 0.1698946, -1.632255, 1, 0.8823529, 0, 1,
-1.024078, -0.9625208, -2.428479, 1, 0.8862745, 0, 1,
-1.020894, 3.837781, 1.103851, 1, 0.8941177, 0, 1,
-1.014372, 1.535293, -1.50547, 1, 0.8980392, 0, 1,
-1.012147, 0.8696907, 0.7638918, 1, 0.9058824, 0, 1,
-1.005532, -0.1236505, -2.928939, 1, 0.9137255, 0, 1,
-1.002455, 2.080758, 0.2639082, 1, 0.9176471, 0, 1,
-0.99514, -0.5015948, -2.192813, 1, 0.9254902, 0, 1,
-0.9898769, -1.462112, -2.53223, 1, 0.9294118, 0, 1,
-0.9875407, 1.185457, -0.905961, 1, 0.9372549, 0, 1,
-0.9817977, -0.146392, -0.2930771, 1, 0.9411765, 0, 1,
-0.9812288, -1.382573, -2.4701, 1, 0.9490196, 0, 1,
-0.9789941, -1.792391, -0.08117981, 1, 0.9529412, 0, 1,
-0.9724433, -0.8789282, -1.007925, 1, 0.9607843, 0, 1,
-0.9689133, 0.2088002, -2.554494, 1, 0.9647059, 0, 1,
-0.963676, -0.1541073, -2.223372, 1, 0.972549, 0, 1,
-0.9634571, -0.02989584, -0.3067829, 1, 0.9764706, 0, 1,
-0.9593608, -0.2482521, -1.67241, 1, 0.9843137, 0, 1,
-0.95275, -0.1853508, -0.4747149, 1, 0.9882353, 0, 1,
-0.9512612, 1.687673, 1.218646, 1, 0.9960784, 0, 1,
-0.9446315, 1.554082, -0.1100279, 0.9960784, 1, 0, 1,
-0.9443185, -0.8878961, -0.6707137, 0.9921569, 1, 0, 1,
-0.943297, -2.199365, -3.205474, 0.9843137, 1, 0, 1,
-0.9407641, 0.5482836, -0.3402703, 0.9803922, 1, 0, 1,
-0.9392621, -0.977721, -4.081953, 0.972549, 1, 0, 1,
-0.9312291, -0.1461971, -3.046793, 0.9686275, 1, 0, 1,
-0.930256, -2.430865, -2.2241, 0.9607843, 1, 0, 1,
-0.9201373, -0.1848748, -1.270663, 0.9568627, 1, 0, 1,
-0.9175422, -0.1203022, 0.1249418, 0.9490196, 1, 0, 1,
-0.9174094, 0.5177739, -1.771636, 0.945098, 1, 0, 1,
-0.9167452, 1.320775, -1.101917, 0.9372549, 1, 0, 1,
-0.9165601, 0.119246, -0.6601352, 0.9333333, 1, 0, 1,
-0.9137577, 0.1809834, -1.663186, 0.9254902, 1, 0, 1,
-0.9135615, 1.178385, -0.9423888, 0.9215686, 1, 0, 1,
-0.9125243, -0.2910993, -0.5685513, 0.9137255, 1, 0, 1,
-0.9106232, 0.01566318, -0.09389429, 0.9098039, 1, 0, 1,
-0.9090562, -0.1474935, -1.886741, 0.9019608, 1, 0, 1,
-0.907626, -0.06337125, -1.593774, 0.8941177, 1, 0, 1,
-0.9074466, -0.2099674, -0.4005624, 0.8901961, 1, 0, 1,
-0.9019924, 1.090301, -3.016427, 0.8823529, 1, 0, 1,
-0.8954143, -0.5874159, -0.1581507, 0.8784314, 1, 0, 1,
-0.8856456, -0.6910213, -1.78626, 0.8705882, 1, 0, 1,
-0.8775333, -0.296268, -1.892047, 0.8666667, 1, 0, 1,
-0.877124, 1.186223, -1.87102, 0.8588235, 1, 0, 1,
-0.8756661, -0.03111554, -2.32968, 0.854902, 1, 0, 1,
-0.8754735, 0.9413233, -0.7362999, 0.8470588, 1, 0, 1,
-0.8753703, 0.520636, -0.7279373, 0.8431373, 1, 0, 1,
-0.8704822, 0.9859695, -0.6355048, 0.8352941, 1, 0, 1,
-0.8669273, 0.5852075, -1.491344, 0.8313726, 1, 0, 1,
-0.8663496, -2.201552, -3.610798, 0.8235294, 1, 0, 1,
-0.8626922, 0.2335863, -2.718281, 0.8196079, 1, 0, 1,
-0.860131, 1.289427, -1.172005, 0.8117647, 1, 0, 1,
-0.8528409, 1.756724, 0.2308325, 0.8078431, 1, 0, 1,
-0.8465504, -1.578343, -1.573572, 0.8, 1, 0, 1,
-0.8460327, -0.4284761, -1.03351, 0.7921569, 1, 0, 1,
-0.8456745, -0.1506283, -1.678705, 0.7882353, 1, 0, 1,
-0.8370844, 0.4854045, -0.2762837, 0.7803922, 1, 0, 1,
-0.8365006, 2.257468, 0.6627738, 0.7764706, 1, 0, 1,
-0.8361834, 0.08315738, -1.385373, 0.7686275, 1, 0, 1,
-0.8339915, 1.732651, -2.294403, 0.7647059, 1, 0, 1,
-0.8318592, 0.3047365, -1.080277, 0.7568628, 1, 0, 1,
-0.8251567, 0.08560254, -1.463796, 0.7529412, 1, 0, 1,
-0.82021, -0.3720022, -1.349087, 0.7450981, 1, 0, 1,
-0.8154714, -1.33805, -2.286629, 0.7411765, 1, 0, 1,
-0.804594, -0.7446473, -2.45265, 0.7333333, 1, 0, 1,
-0.8019001, 0.553324, -2.859007, 0.7294118, 1, 0, 1,
-0.7987227, -0.3247766, 0.1234688, 0.7215686, 1, 0, 1,
-0.7926182, 1.038684, -1.240703, 0.7176471, 1, 0, 1,
-0.7874247, -0.555546, -0.8251338, 0.7098039, 1, 0, 1,
-0.7719301, -0.6078514, -1.984007, 0.7058824, 1, 0, 1,
-0.7691305, -0.03498036, -2.454316, 0.6980392, 1, 0, 1,
-0.7679844, 1.164637, -0.422434, 0.6901961, 1, 0, 1,
-0.7651704, -0.2438239, -1.906552, 0.6862745, 1, 0, 1,
-0.7631331, -1.037511, -2.658849, 0.6784314, 1, 0, 1,
-0.7558422, 0.5334273, -0.8220121, 0.6745098, 1, 0, 1,
-0.7494775, -1.150225, -3.579176, 0.6666667, 1, 0, 1,
-0.7452659, 0.3498527, 0.9175209, 0.6627451, 1, 0, 1,
-0.7444888, -0.1933926, -1.823385, 0.654902, 1, 0, 1,
-0.7443587, 1.023076, -0.31959, 0.6509804, 1, 0, 1,
-0.7434574, 1.966699, 0.679341, 0.6431373, 1, 0, 1,
-0.7360256, 0.2750829, -2.51739, 0.6392157, 1, 0, 1,
-0.7323568, 0.4597276, -0.5833594, 0.6313726, 1, 0, 1,
-0.7301723, -1.576862, -2.061632, 0.627451, 1, 0, 1,
-0.7268764, -1.029798, -3.276902, 0.6196079, 1, 0, 1,
-0.7171699, 1.916542, 0.450303, 0.6156863, 1, 0, 1,
-0.7166832, 1.273173, -0.02095137, 0.6078432, 1, 0, 1,
-0.7158614, 0.004702738, 2.587686, 0.6039216, 1, 0, 1,
-0.7079208, 2.409137, -0.8493202, 0.5960785, 1, 0, 1,
-0.7074004, 0.7999823, 0.2610506, 0.5882353, 1, 0, 1,
-0.7019959, -0.08967073, -1.590808, 0.5843138, 1, 0, 1,
-0.6967497, -0.7726578, -4.06891, 0.5764706, 1, 0, 1,
-0.6958075, -2.151296, -3.030904, 0.572549, 1, 0, 1,
-0.6953316, -0.724766, -1.625401, 0.5647059, 1, 0, 1,
-0.6919451, -0.4615593, -2.976155, 0.5607843, 1, 0, 1,
-0.6910298, 0.9238771, 1.256166, 0.5529412, 1, 0, 1,
-0.6904382, 1.0663, -1.640196, 0.5490196, 1, 0, 1,
-0.6802815, -0.08234813, -1.90867, 0.5411765, 1, 0, 1,
-0.6787794, -0.4172049, -1.730582, 0.5372549, 1, 0, 1,
-0.6776382, -0.6925809, -2.700055, 0.5294118, 1, 0, 1,
-0.6772998, -0.4589153, -2.3681, 0.5254902, 1, 0, 1,
-0.6704371, -1.683424, -1.791534, 0.5176471, 1, 0, 1,
-0.6688718, 0.5026312, -1.909302, 0.5137255, 1, 0, 1,
-0.668027, -0.9612641, -1.918498, 0.5058824, 1, 0, 1,
-0.6664278, -0.721307, -1.731489, 0.5019608, 1, 0, 1,
-0.6662561, 0.9367849, -0.3788176, 0.4941176, 1, 0, 1,
-0.6590505, -0.8968323, -0.982748, 0.4862745, 1, 0, 1,
-0.6555532, 0.7560791, -1.743365, 0.4823529, 1, 0, 1,
-0.6455659, -0.232515, -2.330283, 0.4745098, 1, 0, 1,
-0.6455294, 1.250593, 0.7138611, 0.4705882, 1, 0, 1,
-0.6452454, -1.480494, -2.044346, 0.4627451, 1, 0, 1,
-0.6442508, 1.634119, -1.264437, 0.4588235, 1, 0, 1,
-0.6433421, 0.8051437, -0.6588867, 0.4509804, 1, 0, 1,
-0.6429431, -1.844293, -2.505582, 0.4470588, 1, 0, 1,
-0.6380591, -0.72647, -1.664152, 0.4392157, 1, 0, 1,
-0.6358402, -0.06201182, -1.75833, 0.4352941, 1, 0, 1,
-0.6329595, 0.02177572, -1.428888, 0.427451, 1, 0, 1,
-0.6317335, -1.819076, -2.61849, 0.4235294, 1, 0, 1,
-0.630387, 0.1254065, -1.438573, 0.4156863, 1, 0, 1,
-0.629458, 0.4333011, -1.318794, 0.4117647, 1, 0, 1,
-0.6183306, -0.9553491, -3.76669, 0.4039216, 1, 0, 1,
-0.6071405, -1.224629, -1.564282, 0.3960784, 1, 0, 1,
-0.606368, -0.09908967, -2.63494, 0.3921569, 1, 0, 1,
-0.6059053, 0.7229158, -0.3071384, 0.3843137, 1, 0, 1,
-0.6031148, 0.8596877, -2.324961, 0.3803922, 1, 0, 1,
-0.5946652, -0.3172534, -1.173613, 0.372549, 1, 0, 1,
-0.5945694, 0.2858006, -2.084766, 0.3686275, 1, 0, 1,
-0.5935232, -1.452912, -3.472986, 0.3607843, 1, 0, 1,
-0.584196, 0.1588279, -2.315079, 0.3568628, 1, 0, 1,
-0.5822067, 0.9518503, -0.4334897, 0.3490196, 1, 0, 1,
-0.5754564, 1.441155, -2.275593, 0.345098, 1, 0, 1,
-0.5728284, 0.1581209, -1.351478, 0.3372549, 1, 0, 1,
-0.571425, -0.5849683, -2.650583, 0.3333333, 1, 0, 1,
-0.5697918, 0.9474924, 0.1490698, 0.3254902, 1, 0, 1,
-0.5633807, 1.393541, -0.4781756, 0.3215686, 1, 0, 1,
-0.5593892, 1.783548, -0.9671426, 0.3137255, 1, 0, 1,
-0.5590311, 1.334298, -1.00836, 0.3098039, 1, 0, 1,
-0.5563115, 0.8827585, -2.263571, 0.3019608, 1, 0, 1,
-0.5562857, -0.4313464, -3.239074, 0.2941177, 1, 0, 1,
-0.5556133, -1.497621, -1.3197, 0.2901961, 1, 0, 1,
-0.5529189, -0.4740584, -0.4818235, 0.282353, 1, 0, 1,
-0.5365835, 1.020541, -0.1311289, 0.2784314, 1, 0, 1,
-0.533339, -0.6948666, -2.787992, 0.2705882, 1, 0, 1,
-0.5312171, -0.9650283, -4.244892, 0.2666667, 1, 0, 1,
-0.5296694, 1.458972, 0.7982177, 0.2588235, 1, 0, 1,
-0.5290122, -0.07129814, -3.444298, 0.254902, 1, 0, 1,
-0.5255447, -0.7655449, -2.861907, 0.2470588, 1, 0, 1,
-0.5200701, 0.6924148, -0.6802516, 0.2431373, 1, 0, 1,
-0.518375, 0.01816787, -2.604148, 0.2352941, 1, 0, 1,
-0.5169865, -0.8490747, -1.517568, 0.2313726, 1, 0, 1,
-0.5166738, -0.0470709, -2.630355, 0.2235294, 1, 0, 1,
-0.5111554, 0.4134735, -1.327078, 0.2196078, 1, 0, 1,
-0.5081615, 0.1970869, -1.907801, 0.2117647, 1, 0, 1,
-0.5079788, 1.077801, -0.1683546, 0.2078431, 1, 0, 1,
-0.5061732, -0.1821336, -1.592741, 0.2, 1, 0, 1,
-0.5060499, -1.304187, -2.805358, 0.1921569, 1, 0, 1,
-0.505227, 1.367623, -1.863126, 0.1882353, 1, 0, 1,
-0.5000872, -1.383425, -3.094799, 0.1803922, 1, 0, 1,
-0.4993264, -0.988568, -2.513676, 0.1764706, 1, 0, 1,
-0.4976327, 0.8317772, 0.1769607, 0.1686275, 1, 0, 1,
-0.4962372, -1.415601, -1.622127, 0.1647059, 1, 0, 1,
-0.4903335, 1.188589, -0.3767761, 0.1568628, 1, 0, 1,
-0.4876323, 0.912472, 0.3739947, 0.1529412, 1, 0, 1,
-0.4870534, 0.4377888, -0.01378119, 0.145098, 1, 0, 1,
-0.4868351, -0.1369355, -3.019086, 0.1411765, 1, 0, 1,
-0.4800458, -1.512653, -2.261522, 0.1333333, 1, 0, 1,
-0.4800159, 1.107247, -0.784479, 0.1294118, 1, 0, 1,
-0.4787884, 1.673395, 1.029274, 0.1215686, 1, 0, 1,
-0.4731093, 1.078503, -0.8520877, 0.1176471, 1, 0, 1,
-0.4722732, 0.8262956, -1.12235, 0.1098039, 1, 0, 1,
-0.46361, 1.400515, 0.659764, 0.1058824, 1, 0, 1,
-0.4535542, -1.063917, -3.739208, 0.09803922, 1, 0, 1,
-0.4506366, -0.9566211, -4.614464, 0.09019608, 1, 0, 1,
-0.4494579, 0.676938, 0.7983045, 0.08627451, 1, 0, 1,
-0.4470751, 1.679642, -0.6638309, 0.07843138, 1, 0, 1,
-0.4396077, -0.4266349, -1.622799, 0.07450981, 1, 0, 1,
-0.4374876, 0.9923354, -1.358014, 0.06666667, 1, 0, 1,
-0.4373368, -1.272759, -3.490934, 0.0627451, 1, 0, 1,
-0.436835, 0.9373428, -1.188386, 0.05490196, 1, 0, 1,
-0.4353781, 1.387762, 0.2393515, 0.05098039, 1, 0, 1,
-0.4340997, 0.8533311, -2.432177, 0.04313726, 1, 0, 1,
-0.4337308, -1.325802, -2.60924, 0.03921569, 1, 0, 1,
-0.4336115, -0.8736503, -0.7338714, 0.03137255, 1, 0, 1,
-0.4334192, 1.071167, 1.517473, 0.02745098, 1, 0, 1,
-0.4315561, -0.5530002, -3.471881, 0.01960784, 1, 0, 1,
-0.4302973, -0.1734122, -3.770668, 0.01568628, 1, 0, 1,
-0.428291, -1.161516, -0.4429224, 0.007843138, 1, 0, 1,
-0.427797, -0.2501645, -2.449468, 0.003921569, 1, 0, 1,
-0.4260501, 0.3120075, -1.238228, 0, 1, 0.003921569, 1,
-0.4239496, -1.132395, -2.836454, 0, 1, 0.01176471, 1,
-0.4198989, 0.7158516, -1.205886, 0, 1, 0.01568628, 1,
-0.4163083, 0.5546914, -0.8864076, 0, 1, 0.02352941, 1,
-0.407745, 1.344743, -0.0505489, 0, 1, 0.02745098, 1,
-0.4072318, 0.1802842, -0.5597098, 0, 1, 0.03529412, 1,
-0.4071237, 0.5671864, 0.7559052, 0, 1, 0.03921569, 1,
-0.4062884, 0.6480035, -1.336609, 0, 1, 0.04705882, 1,
-0.4005559, -0.8496813, -2.167295, 0, 1, 0.05098039, 1,
-0.3975308, 0.2937983, -0.5338623, 0, 1, 0.05882353, 1,
-0.3962926, -0.4203717, -3.430766, 0, 1, 0.0627451, 1,
-0.3940737, -0.4711515, -2.126934, 0, 1, 0.07058824, 1,
-0.3893906, -1.460586, -2.13396, 0, 1, 0.07450981, 1,
-0.3885727, 0.4829076, -0.5772377, 0, 1, 0.08235294, 1,
-0.3845966, -2.904758, -2.852291, 0, 1, 0.08627451, 1,
-0.3842832, 0.5594082, -0.9716355, 0, 1, 0.09411765, 1,
-0.3826513, -0.4817726, -1.369902, 0, 1, 0.1019608, 1,
-0.3817233, 0.7393789, -1.694134, 0, 1, 0.1058824, 1,
-0.3798951, 0.5316807, -0.2671422, 0, 1, 0.1137255, 1,
-0.3759447, -0.7500603, -1.907885, 0, 1, 0.1176471, 1,
-0.3710574, -0.1712812, -2.90014, 0, 1, 0.1254902, 1,
-0.3668373, -0.9977884, -3.328066, 0, 1, 0.1294118, 1,
-0.3642179, 0.2410603, -1.17325, 0, 1, 0.1372549, 1,
-0.3638236, 1.593283, -0.962687, 0, 1, 0.1411765, 1,
-0.3626323, -0.7890971, -3.498863, 0, 1, 0.1490196, 1,
-0.3552335, -0.5923948, -4.445174, 0, 1, 0.1529412, 1,
-0.3541002, -0.5867885, -2.220319, 0, 1, 0.1607843, 1,
-0.3486111, -0.843117, -4.987482, 0, 1, 0.1647059, 1,
-0.3468093, -0.3652548, -2.972246, 0, 1, 0.172549, 1,
-0.3449648, -0.8436306, -2.32416, 0, 1, 0.1764706, 1,
-0.3428089, -1.093285, -3.521402, 0, 1, 0.1843137, 1,
-0.3427259, 0.4770591, 0.7218544, 0, 1, 0.1882353, 1,
-0.3413532, -1.209705, -2.567455, 0, 1, 0.1960784, 1,
-0.3316858, 2.820765, 0.9191796, 0, 1, 0.2039216, 1,
-0.3315324, -0.4583992, -2.414807, 0, 1, 0.2078431, 1,
-0.3263807, -0.6063914, -3.165374, 0, 1, 0.2156863, 1,
-0.3240483, -0.1229504, -2.917998, 0, 1, 0.2196078, 1,
-0.3230252, -0.5608793, -3.253766, 0, 1, 0.227451, 1,
-0.3173657, 1.45838, 0.3078521, 0, 1, 0.2313726, 1,
-0.3131678, 0.2557197, -0.8926497, 0, 1, 0.2392157, 1,
-0.3048047, 1.928997, -0.6468075, 0, 1, 0.2431373, 1,
-0.2995218, -0.6956283, -3.832797, 0, 1, 0.2509804, 1,
-0.2989302, -0.5367997, -2.152497, 0, 1, 0.254902, 1,
-0.2943311, -0.9591972, -1.259803, 0, 1, 0.2627451, 1,
-0.2926439, 0.1812622, -0.736852, 0, 1, 0.2666667, 1,
-0.2903808, -0.8241336, -1.865405, 0, 1, 0.2745098, 1,
-0.289502, -0.5015077, -2.712128, 0, 1, 0.2784314, 1,
-0.286902, -1.897354, -2.960184, 0, 1, 0.2862745, 1,
-0.2826868, -2.205152, -2.173167, 0, 1, 0.2901961, 1,
-0.2601842, 0.2427687, -0.9643651, 0, 1, 0.2980392, 1,
-0.257545, 0.0003729412, -0.9192229, 0, 1, 0.3058824, 1,
-0.2515264, 0.3170259, -0.7417253, 0, 1, 0.3098039, 1,
-0.2485112, -1.491686, -3.326797, 0, 1, 0.3176471, 1,
-0.2447921, 0.9812407, -0.2143935, 0, 1, 0.3215686, 1,
-0.2402274, -0.8533317, -2.405302, 0, 1, 0.3294118, 1,
-0.239722, -0.4561639, -1.710025, 0, 1, 0.3333333, 1,
-0.2394021, 0.2963095, -0.5715095, 0, 1, 0.3411765, 1,
-0.2383989, 0.3935205, -0.2755572, 0, 1, 0.345098, 1,
-0.2365548, 0.3695265, 0.6731548, 0, 1, 0.3529412, 1,
-0.2358707, 1.125721, 1.155077, 0, 1, 0.3568628, 1,
-0.2309815, 0.6841071, 0.5785808, 0, 1, 0.3647059, 1,
-0.2290614, -0.9278245, -3.071164, 0, 1, 0.3686275, 1,
-0.2236512, 0.9692285, -2.334813, 0, 1, 0.3764706, 1,
-0.2234045, -1.644131, -0.9306265, 0, 1, 0.3803922, 1,
-0.2175282, 0.6679541, -0.004966439, 0, 1, 0.3882353, 1,
-0.2124245, 0.310813, 0.5042019, 0, 1, 0.3921569, 1,
-0.2096687, 1.155168, 0.1708167, 0, 1, 0.4, 1,
-0.2093979, 0.4302747, 0.5839595, 0, 1, 0.4078431, 1,
-0.2074836, -1.52743, -1.597295, 0, 1, 0.4117647, 1,
-0.2059371, -1.066293, -0.5054037, 0, 1, 0.4196078, 1,
-0.1940666, -1.073235, -3.766937, 0, 1, 0.4235294, 1,
-0.1894738, 0.3135574, -0.8880966, 0, 1, 0.4313726, 1,
-0.188909, -0.8723671, -3.281566, 0, 1, 0.4352941, 1,
-0.1879464, -0.7157188, -4.850302, 0, 1, 0.4431373, 1,
-0.1868289, 1.067232, 0.9157136, 0, 1, 0.4470588, 1,
-0.1845486, -1.520552, -2.43152, 0, 1, 0.454902, 1,
-0.1831205, 1.691395, -1.106195, 0, 1, 0.4588235, 1,
-0.1825996, 0.5977305, 0.371702, 0, 1, 0.4666667, 1,
-0.1820668, -1.399313, -3.051522, 0, 1, 0.4705882, 1,
-0.1813218, 0.5707524, -3.100545, 0, 1, 0.4784314, 1,
-0.1803729, -1.627643, -2.241486, 0, 1, 0.4823529, 1,
-0.1750783, -1.233473, -2.529263, 0, 1, 0.4901961, 1,
-0.171441, 0.2467959, 0.3641694, 0, 1, 0.4941176, 1,
-0.1692848, -0.405302, -2.761255, 0, 1, 0.5019608, 1,
-0.1677922, 0.1079292, 0.7884001, 0, 1, 0.509804, 1,
-0.1657431, 1.004713, 0.2705447, 0, 1, 0.5137255, 1,
-0.1622816, -1.174893, -3.577309, 0, 1, 0.5215687, 1,
-0.1616343, -1.250086, -2.659337, 0, 1, 0.5254902, 1,
-0.1603303, 1.001264, -0.3780223, 0, 1, 0.5333334, 1,
-0.1599377, -1.112858, -4.601997, 0, 1, 0.5372549, 1,
-0.1588231, -1.543077, -2.048815, 0, 1, 0.5450981, 1,
-0.1549568, 1.606417, 0.794795, 0, 1, 0.5490196, 1,
-0.1525679, 0.6083412, -1.14843, 0, 1, 0.5568628, 1,
-0.1523201, 1.409996, -0.4271623, 0, 1, 0.5607843, 1,
-0.1512226, -0.2207679, -1.695294, 0, 1, 0.5686275, 1,
-0.1511975, 0.1802885, 0.7852918, 0, 1, 0.572549, 1,
-0.1507659, 1.345497, 0.4972756, 0, 1, 0.5803922, 1,
-0.1494575, 1.186758, 0.4415557, 0, 1, 0.5843138, 1,
-0.148843, 1.215848, 1.238172, 0, 1, 0.5921569, 1,
-0.1486197, 0.1785384, 0.2634022, 0, 1, 0.5960785, 1,
-0.1388005, -1.177022, -1.743562, 0, 1, 0.6039216, 1,
-0.1380936, -0.1347327, -0.1088574, 0, 1, 0.6117647, 1,
-0.1314824, -0.7826681, -3.163511, 0, 1, 0.6156863, 1,
-0.1294275, 1.629781, 1.23356, 0, 1, 0.6235294, 1,
-0.1278906, -1.078311, -2.686888, 0, 1, 0.627451, 1,
-0.1266551, -0.5923776, -4.787515, 0, 1, 0.6352941, 1,
-0.1264783, -0.7354182, -1.139026, 0, 1, 0.6392157, 1,
-0.1237647, -0.6246946, -3.401638, 0, 1, 0.6470588, 1,
-0.1232039, 0.1461906, -0.1913379, 0, 1, 0.6509804, 1,
-0.1192346, -0.5939931, -2.732651, 0, 1, 0.6588235, 1,
-0.1187203, 1.103001, 0.3011179, 0, 1, 0.6627451, 1,
-0.1119787, 0.4189419, -1.159267, 0, 1, 0.6705883, 1,
-0.1117028, 0.8267128, 1.502228, 0, 1, 0.6745098, 1,
-0.1105054, 0.2170077, -0.2532507, 0, 1, 0.682353, 1,
-0.1100346, 1.554882, -0.7192456, 0, 1, 0.6862745, 1,
-0.1098504, -0.25105, -2.304587, 0, 1, 0.6941177, 1,
-0.1078214, -0.6203204, -2.761832, 0, 1, 0.7019608, 1,
-0.1059214, 1.973238, -0.9847952, 0, 1, 0.7058824, 1,
-0.1055317, -0.9644324, -2.114736, 0, 1, 0.7137255, 1,
-0.1009573, 0.1058283, -0.0303123, 0, 1, 0.7176471, 1,
-0.1006655, 0.6555307, 0.3047391, 0, 1, 0.7254902, 1,
-0.09993964, -0.4045911, -3.762562, 0, 1, 0.7294118, 1,
-0.09755689, -0.2258934, -2.329234, 0, 1, 0.7372549, 1,
-0.09707012, -1.199503, -3.073601, 0, 1, 0.7411765, 1,
-0.08733813, -0.5524906, -2.714049, 0, 1, 0.7490196, 1,
-0.08675993, -0.7464645, -4.581375, 0, 1, 0.7529412, 1,
-0.08426318, -2.065045, -3.784314, 0, 1, 0.7607843, 1,
-0.08367951, -0.5492714, -2.866031, 0, 1, 0.7647059, 1,
-0.08299889, 1.130135, -0.6360498, 0, 1, 0.772549, 1,
-0.08088483, -0.7713456, -4.479803, 0, 1, 0.7764706, 1,
-0.07834841, -0.3306637, -2.516737, 0, 1, 0.7843137, 1,
-0.07800429, -0.02158899, -2.322167, 0, 1, 0.7882353, 1,
-0.07782991, 0.434242, -0.6497685, 0, 1, 0.7960784, 1,
-0.07612029, 1.898656, -0.8306139, 0, 1, 0.8039216, 1,
-0.07589617, -1.126243, -2.579959, 0, 1, 0.8078431, 1,
-0.0756623, -1.626735, -2.769099, 0, 1, 0.8156863, 1,
-0.07379109, -0.6905346, -2.857289, 0, 1, 0.8196079, 1,
-0.07272567, -0.5649235, -3.50921, 0, 1, 0.827451, 1,
-0.06889328, 1.079029, -1.373291, 0, 1, 0.8313726, 1,
-0.06555432, -0.8588392, -4.189331, 0, 1, 0.8392157, 1,
-0.06463624, 0.1340694, -4.355555, 0, 1, 0.8431373, 1,
-0.06204875, -1.445888, -4.275583, 0, 1, 0.8509804, 1,
-0.06045855, 0.8525939, 0.9475688, 0, 1, 0.854902, 1,
-0.05754115, -0.472057, -3.890615, 0, 1, 0.8627451, 1,
-0.04955488, 0.4363746, 0.6972467, 0, 1, 0.8666667, 1,
-0.04827205, 0.5850273, -0.4196041, 0, 1, 0.8745098, 1,
-0.04644837, -1.138478, -2.940155, 0, 1, 0.8784314, 1,
-0.04490719, -0.80285, -3.589413, 0, 1, 0.8862745, 1,
-0.04096485, -0.3970306, -1.198611, 0, 1, 0.8901961, 1,
-0.03492768, -0.4702534, -3.824111, 0, 1, 0.8980392, 1,
-0.02505683, 0.5536398, -0.4543948, 0, 1, 0.9058824, 1,
-0.01807597, -1.111329, -2.791832, 0, 1, 0.9098039, 1,
-0.01397633, 0.09877132, -2.101135, 0, 1, 0.9176471, 1,
-0.01374268, 0.04550556, 0.1645829, 0, 1, 0.9215686, 1,
-0.0108833, -2.234405, -2.722975, 0, 1, 0.9294118, 1,
0.001715553, 0.5524375, 1.507078, 0, 1, 0.9333333, 1,
0.008828746, -1.529492, 2.346788, 0, 1, 0.9411765, 1,
0.01876719, 1.584731, 0.4689383, 0, 1, 0.945098, 1,
0.02101485, -0.8166776, 2.969527, 0, 1, 0.9529412, 1,
0.02153559, 0.5030183, -1.479174, 0, 1, 0.9568627, 1,
0.02185556, -0.5898156, 3.006151, 0, 1, 0.9647059, 1,
0.02666633, 0.05473104, 0.9651244, 0, 1, 0.9686275, 1,
0.0284577, 2.548378, -0.9474883, 0, 1, 0.9764706, 1,
0.03453101, -1.610651, 4.024701, 0, 1, 0.9803922, 1,
0.03741271, -0.06064769, 1.782365, 0, 1, 0.9882353, 1,
0.04484345, 2.287211, -1.23436, 0, 1, 0.9921569, 1,
0.04794215, -1.189065, 2.855088, 0, 1, 1, 1,
0.04965023, -0.2354111, 3.370081, 0, 0.9921569, 1, 1,
0.05279756, -1.195475, 3.601144, 0, 0.9882353, 1, 1,
0.05467504, 1.190867, 1.832538, 0, 0.9803922, 1, 1,
0.05470359, 0.1543026, -0.02918168, 0, 0.9764706, 1, 1,
0.05516431, -1.02235, 1.965746, 0, 0.9686275, 1, 1,
0.05561217, 2.21517, -1.424219, 0, 0.9647059, 1, 1,
0.05700032, -0.2853542, 3.794742, 0, 0.9568627, 1, 1,
0.05755696, -0.9584297, 4.234128, 0, 0.9529412, 1, 1,
0.06993227, 0.05059331, 0.5957262, 0, 0.945098, 1, 1,
0.07191617, 0.7258334, 1.565924, 0, 0.9411765, 1, 1,
0.07500887, -1.036997, 3.443592, 0, 0.9333333, 1, 1,
0.07577428, 0.7738581, -0.4637094, 0, 0.9294118, 1, 1,
0.07612481, 0.5986276, 0.7866767, 0, 0.9215686, 1, 1,
0.07785983, -1.356987, 4.119277, 0, 0.9176471, 1, 1,
0.08039773, 0.8950815, 0.0839987, 0, 0.9098039, 1, 1,
0.08574624, 1.009996, -0.09926079, 0, 0.9058824, 1, 1,
0.09090603, 0.6786708, 0.2908491, 0, 0.8980392, 1, 1,
0.09315157, 0.1943321, -0.9485022, 0, 0.8901961, 1, 1,
0.09369766, 1.271656, -0.1640199, 0, 0.8862745, 1, 1,
0.09541378, 1.839879, -0.05430134, 0, 0.8784314, 1, 1,
0.09799036, 0.06192691, 1.758954, 0, 0.8745098, 1, 1,
0.09965552, 1.537319, 0.9463031, 0, 0.8666667, 1, 1,
0.1010264, -1.655039, 4.840548, 0, 0.8627451, 1, 1,
0.1040355, -0.2570629, 3.976067, 0, 0.854902, 1, 1,
0.1062825, -0.5202296, 2.065524, 0, 0.8509804, 1, 1,
0.1116326, 0.04243029, 1.651504, 0, 0.8431373, 1, 1,
0.1138306, -1.63734, 4.637214, 0, 0.8392157, 1, 1,
0.1147303, -0.3034037, 3.014888, 0, 0.8313726, 1, 1,
0.1201045, -0.4672759, 4.136192, 0, 0.827451, 1, 1,
0.1203495, -0.2022575, 3.453668, 0, 0.8196079, 1, 1,
0.1288115, -0.898322, 4.982384, 0, 0.8156863, 1, 1,
0.129723, -0.07128145, 2.884037, 0, 0.8078431, 1, 1,
0.1345094, 1.559577, 0.07829446, 0, 0.8039216, 1, 1,
0.1385503, 0.7358973, 0.231895, 0, 0.7960784, 1, 1,
0.1423929, -1.713152, 3.439113, 0, 0.7882353, 1, 1,
0.1424096, -2.011771, 2.222982, 0, 0.7843137, 1, 1,
0.1428144, -0.3015417, 3.976282, 0, 0.7764706, 1, 1,
0.1429695, -0.3482238, 2.237638, 0, 0.772549, 1, 1,
0.1454562, -0.06377134, 1.929909, 0, 0.7647059, 1, 1,
0.1463252, 0.4420405, -0.6140028, 0, 0.7607843, 1, 1,
0.1487415, 0.6756206, 0.7022591, 0, 0.7529412, 1, 1,
0.1510802, 0.06667503, 0.705449, 0, 0.7490196, 1, 1,
0.153246, -0.5120634, 3.184088, 0, 0.7411765, 1, 1,
0.1550176, -0.458732, 2.684906, 0, 0.7372549, 1, 1,
0.1559051, 1.357094, 0.008054449, 0, 0.7294118, 1, 1,
0.1559102, -0.2506799, 1.812517, 0, 0.7254902, 1, 1,
0.1669142, -0.4247676, 3.307432, 0, 0.7176471, 1, 1,
0.167365, -0.5080985, 4.212017, 0, 0.7137255, 1, 1,
0.169775, 0.9092634, -1.115724, 0, 0.7058824, 1, 1,
0.1757848, -0.5931389, 2.994476, 0, 0.6980392, 1, 1,
0.1773382, -1.414845, 1.545047, 0, 0.6941177, 1, 1,
0.1846296, 0.1095973, 3.022727, 0, 0.6862745, 1, 1,
0.1964013, -0.3619961, 3.647006, 0, 0.682353, 1, 1,
0.1992173, 0.935137, -0.4217864, 0, 0.6745098, 1, 1,
0.202783, 1.97553, 0.6341122, 0, 0.6705883, 1, 1,
0.2054341, 1.93291, 0.4933157, 0, 0.6627451, 1, 1,
0.2076307, 1.802063, 1.070591, 0, 0.6588235, 1, 1,
0.2077435, -0.9385571, 3.916195, 0, 0.6509804, 1, 1,
0.2154674, -1.107475, 3.148768, 0, 0.6470588, 1, 1,
0.2172995, -0.06963421, 1.050198, 0, 0.6392157, 1, 1,
0.2179196, 0.8518057, -0.73436, 0, 0.6352941, 1, 1,
0.221097, 1.146383, 0.7280987, 0, 0.627451, 1, 1,
0.222297, -0.5074455, 2.549024, 0, 0.6235294, 1, 1,
0.2250719, 1.376142, -0.655531, 0, 0.6156863, 1, 1,
0.2252861, 1.237034, -1.353132, 0, 0.6117647, 1, 1,
0.2264808, 0.07549514, 0.7190933, 0, 0.6039216, 1, 1,
0.2325803, 1.366714, -0.4957432, 0, 0.5960785, 1, 1,
0.2334464, 1.244945, 0.9029185, 0, 0.5921569, 1, 1,
0.2334912, 2.250639, 1.652187, 0, 0.5843138, 1, 1,
0.2424885, 0.7985906, -0.4908545, 0, 0.5803922, 1, 1,
0.2454547, 1.272443, -0.6278909, 0, 0.572549, 1, 1,
0.247485, -1.064603, 2.715176, 0, 0.5686275, 1, 1,
0.2487257, 1.029814, 0.6968344, 0, 0.5607843, 1, 1,
0.2493548, -0.2466327, 3.215842, 0, 0.5568628, 1, 1,
0.2512156, -1.40696, 1.22528, 0, 0.5490196, 1, 1,
0.2512977, -1.860975, 3.520823, 0, 0.5450981, 1, 1,
0.2540315, 0.09434299, -0.6271667, 0, 0.5372549, 1, 1,
0.2552043, -0.8679815, 3.855737, 0, 0.5333334, 1, 1,
0.2563334, 0.9641061, 0.9672258, 0, 0.5254902, 1, 1,
0.2596565, 1.036365, -0.8795868, 0, 0.5215687, 1, 1,
0.2616399, 0.9456877, -0.5853335, 0, 0.5137255, 1, 1,
0.2636194, -0.918797, 1.001679, 0, 0.509804, 1, 1,
0.2652486, -1.464474, 3.740936, 0, 0.5019608, 1, 1,
0.2692189, -0.05786727, 2.289714, 0, 0.4941176, 1, 1,
0.2693183, -1.042112, 3.58041, 0, 0.4901961, 1, 1,
0.2720508, 0.3198418, 0.4203809, 0, 0.4823529, 1, 1,
0.2795988, -1.614044, 2.926099, 0, 0.4784314, 1, 1,
0.2800663, 0.6948406, -0.440375, 0, 0.4705882, 1, 1,
0.2865443, -1.973332, 5.168751, 0, 0.4666667, 1, 1,
0.288504, 0.963334, 0.4692622, 0, 0.4588235, 1, 1,
0.2902873, -0.2729729, 2.251702, 0, 0.454902, 1, 1,
0.2913849, -0.9109582, 2.697896, 0, 0.4470588, 1, 1,
0.294405, 0.4448921, 0.04315733, 0, 0.4431373, 1, 1,
0.2970027, -1.21428, 1.393449, 0, 0.4352941, 1, 1,
0.2976048, -0.6704931, 2.362071, 0, 0.4313726, 1, 1,
0.2979394, -0.3240004, 2.022043, 0, 0.4235294, 1, 1,
0.2985978, -0.8622497, 4.634742, 0, 0.4196078, 1, 1,
0.3000323, -0.6893148, 2.393368, 0, 0.4117647, 1, 1,
0.3010618, -0.2004171, 2.143008, 0, 0.4078431, 1, 1,
0.303466, 1.961951, -0.08110777, 0, 0.4, 1, 1,
0.3044771, 0.8625372, 0.4871338, 0, 0.3921569, 1, 1,
0.3046894, 1.894282, 0.4452647, 0, 0.3882353, 1, 1,
0.3051147, -1.881922, 1.954129, 0, 0.3803922, 1, 1,
0.3145146, 1.054482, 0.8161079, 0, 0.3764706, 1, 1,
0.3157405, -0.07850553, 2.612295, 0, 0.3686275, 1, 1,
0.3159322, -1.95634, 2.535108, 0, 0.3647059, 1, 1,
0.3168775, -1.203175, 2.633181, 0, 0.3568628, 1, 1,
0.3195655, -0.8744575, 2.631524, 0, 0.3529412, 1, 1,
0.3215347, 0.5418097, -0.5149738, 0, 0.345098, 1, 1,
0.3219848, -0.4002409, 3.24791, 0, 0.3411765, 1, 1,
0.3236024, -0.2438567, 3.016842, 0, 0.3333333, 1, 1,
0.3252644, 0.2646096, 0.4084947, 0, 0.3294118, 1, 1,
0.3347986, -0.11871, 4.422544, 0, 0.3215686, 1, 1,
0.3366693, -0.05462169, 2.837666, 0, 0.3176471, 1, 1,
0.336841, 0.9855089, 0.3499409, 0, 0.3098039, 1, 1,
0.337534, 1.2862, 0.7294566, 0, 0.3058824, 1, 1,
0.3395884, 0.4643823, -1.309547, 0, 0.2980392, 1, 1,
0.3401233, 2.983463, 0.8738632, 0, 0.2901961, 1, 1,
0.3425286, 0.4918659, 1.925452, 0, 0.2862745, 1, 1,
0.3458625, 0.08029383, 0.5574474, 0, 0.2784314, 1, 1,
0.3502553, -0.4318736, 2.067607, 0, 0.2745098, 1, 1,
0.3513574, 1.526103, 0.08727732, 0, 0.2666667, 1, 1,
0.3559751, 0.248612, 1.016036, 0, 0.2627451, 1, 1,
0.3578072, -0.1531116, 1.609789, 0, 0.254902, 1, 1,
0.3601991, -1.482642, 2.45587, 0, 0.2509804, 1, 1,
0.3605161, -0.8196167, 2.174101, 0, 0.2431373, 1, 1,
0.3613658, -1.063689, 3.666664, 0, 0.2392157, 1, 1,
0.3624872, 0.562, 1.190782, 0, 0.2313726, 1, 1,
0.3640811, 0.8444381, -0.1768134, 0, 0.227451, 1, 1,
0.3690138, -1.355573, 3.300485, 0, 0.2196078, 1, 1,
0.3714753, -1.446964, 3.229047, 0, 0.2156863, 1, 1,
0.3728002, 2.393569, -0.7600867, 0, 0.2078431, 1, 1,
0.3803861, -1.279155, 4.031457, 0, 0.2039216, 1, 1,
0.3813863, 0.06286689, 1.32134, 0, 0.1960784, 1, 1,
0.3816784, 0.4637884, 0.4955835, 0, 0.1882353, 1, 1,
0.3848118, 0.4403216, 1.985412, 0, 0.1843137, 1, 1,
0.3861403, -0.9319939, 4.178076, 0, 0.1764706, 1, 1,
0.3936861, 0.9740139, -0.5966648, 0, 0.172549, 1, 1,
0.3941784, -0.8854795, 2.466146, 0, 0.1647059, 1, 1,
0.3991517, -0.7117325, 3.062321, 0, 0.1607843, 1, 1,
0.4012031, 1.079225, 1.31473, 0, 0.1529412, 1, 1,
0.403233, -2.059425, 3.323554, 0, 0.1490196, 1, 1,
0.4056074, -0.8202458, 1.020827, 0, 0.1411765, 1, 1,
0.4063706, -2.622698, 3.61995, 0, 0.1372549, 1, 1,
0.4089223, 0.6845543, -0.3488942, 0, 0.1294118, 1, 1,
0.4100486, -0.3938998, 2.87693, 0, 0.1254902, 1, 1,
0.4129726, 0.3083178, -1.566583, 0, 0.1176471, 1, 1,
0.4135432, 0.4161491, -0.1132775, 0, 0.1137255, 1, 1,
0.4149431, 0.5342777, 2.250706, 0, 0.1058824, 1, 1,
0.4150987, -1.05558, 2.599313, 0, 0.09803922, 1, 1,
0.4231361, 1.944258, -0.6555947, 0, 0.09411765, 1, 1,
0.4262482, 0.7936306, 1.918445, 0, 0.08627451, 1, 1,
0.4271947, -0.1042844, 1.856001, 0, 0.08235294, 1, 1,
0.4291096, -0.487498, 2.789709, 0, 0.07450981, 1, 1,
0.4294365, -1.556184, 1.332594, 0, 0.07058824, 1, 1,
0.4341591, -1.832094, 2.248592, 0, 0.0627451, 1, 1,
0.4361196, 0.3303883, -0.2912345, 0, 0.05882353, 1, 1,
0.4368034, 2.162738, 1.857666, 0, 0.05098039, 1, 1,
0.4390692, 1.35666, 0.03570679, 0, 0.04705882, 1, 1,
0.4400306, 0.5629742, 2.473205, 0, 0.03921569, 1, 1,
0.4418244, -0.3771826, 2.564956, 0, 0.03529412, 1, 1,
0.4452614, -0.6942641, 1.057575, 0, 0.02745098, 1, 1,
0.4470273, -0.5624761, 3.918605, 0, 0.02352941, 1, 1,
0.4522036, -1.634223, 1.805733, 0, 0.01568628, 1, 1,
0.4568279, 0.04197288, 2.911774, 0, 0.01176471, 1, 1,
0.4588923, 0.6378401, 1.817142, 0, 0.003921569, 1, 1,
0.4620944, -0.9256445, 1.644251, 0.003921569, 0, 1, 1,
0.4647523, -0.6209338, 4.181698, 0.007843138, 0, 1, 1,
0.4662927, -1.612233, 3.918388, 0.01568628, 0, 1, 1,
0.4701643, -1.150946, 2.379638, 0.01960784, 0, 1, 1,
0.4702097, -0.7597311, 1.725436, 0.02745098, 0, 1, 1,
0.4729562, -0.1782927, 2.603104, 0.03137255, 0, 1, 1,
0.4758658, 0.1967439, 1.126801, 0.03921569, 0, 1, 1,
0.4822652, 0.6920252, 1.570091, 0.04313726, 0, 1, 1,
0.48377, -0.4840318, 1.518848, 0.05098039, 0, 1, 1,
0.488507, -0.02383781, 0.8279625, 0.05490196, 0, 1, 1,
0.4915343, -0.6692511, 2.492356, 0.0627451, 0, 1, 1,
0.4917301, 1.983061, -2.886842, 0.06666667, 0, 1, 1,
0.4970851, -0.3499064, 2.534311, 0.07450981, 0, 1, 1,
0.4988245, -0.1581475, 2.64147, 0.07843138, 0, 1, 1,
0.5014362, 0.7467382, 3.300662, 0.08627451, 0, 1, 1,
0.5014374, 0.1107474, 2.260643, 0.09019608, 0, 1, 1,
0.5023762, -0.788623, 3.78142, 0.09803922, 0, 1, 1,
0.5078686, -1.775382, 4.07923, 0.1058824, 0, 1, 1,
0.5079637, -0.01281856, 1.584338, 0.1098039, 0, 1, 1,
0.5080695, 0.293125, 1.455942, 0.1176471, 0, 1, 1,
0.5168487, -2.640666, 1.760654, 0.1215686, 0, 1, 1,
0.5193358, 1.096389, 0.569288, 0.1294118, 0, 1, 1,
0.5219061, 1.215687, -0.5444617, 0.1333333, 0, 1, 1,
0.5224349, 0.5692943, 2.231207, 0.1411765, 0, 1, 1,
0.5237471, -0.3589141, 1.094738, 0.145098, 0, 1, 1,
0.5341943, -0.6138778, 2.833744, 0.1529412, 0, 1, 1,
0.5349094, 2.814857, -0.04319767, 0.1568628, 0, 1, 1,
0.5387871, -0.4305601, 1.605245, 0.1647059, 0, 1, 1,
0.5405089, 0.6549014, 0.1481516, 0.1686275, 0, 1, 1,
0.5461773, -0.4828335, 1.367812, 0.1764706, 0, 1, 1,
0.546627, 0.04979137, -0.8295318, 0.1803922, 0, 1, 1,
0.5468682, 1.679354, -1.00208, 0.1882353, 0, 1, 1,
0.5503488, -1.734509, 2.098826, 0.1921569, 0, 1, 1,
0.5536265, -0.5627213, 0.977746, 0.2, 0, 1, 1,
0.5569545, 0.5266801, 1.455727, 0.2078431, 0, 1, 1,
0.5586407, -1.600384, 3.327303, 0.2117647, 0, 1, 1,
0.5603938, 0.04951769, 1.31885, 0.2196078, 0, 1, 1,
0.5610083, -1.633301, 2.09849, 0.2235294, 0, 1, 1,
0.5631126, 0.2391946, 2.126237, 0.2313726, 0, 1, 1,
0.5663539, -0.5288073, 1.875636, 0.2352941, 0, 1, 1,
0.5671666, 2.627099, 0.420152, 0.2431373, 0, 1, 1,
0.5755407, 0.09762009, 1.486758, 0.2470588, 0, 1, 1,
0.5829534, 0.4599401, 0.7161517, 0.254902, 0, 1, 1,
0.5853836, -0.3873384, 1.076958, 0.2588235, 0, 1, 1,
0.5866777, -1.855209, 4.195551, 0.2666667, 0, 1, 1,
0.5867248, -1.323625, 2.550966, 0.2705882, 0, 1, 1,
0.5869232, -0.288714, 5.216052, 0.2784314, 0, 1, 1,
0.5877457, -1.474665, 3.716558, 0.282353, 0, 1, 1,
0.5888405, 1.03748, -0.9112465, 0.2901961, 0, 1, 1,
0.5938578, 0.9047781, 0.4536661, 0.2941177, 0, 1, 1,
0.5955164, -0.5401162, 3.237103, 0.3019608, 0, 1, 1,
0.5963668, -0.8740579, 3.49103, 0.3098039, 0, 1, 1,
0.596683, 0.04412322, 0.9587099, 0.3137255, 0, 1, 1,
0.5980451, 0.2207382, 2.8089, 0.3215686, 0, 1, 1,
0.5981221, 0.07930863, 0.06992, 0.3254902, 0, 1, 1,
0.6012413, -0.2410396, 0.5587645, 0.3333333, 0, 1, 1,
0.6166338, 1.743115, 0.269463, 0.3372549, 0, 1, 1,
0.6176601, 0.7538149, -1.134781, 0.345098, 0, 1, 1,
0.6188724, -0.8007926, 2.708507, 0.3490196, 0, 1, 1,
0.6207931, -0.8928857, 4.148716, 0.3568628, 0, 1, 1,
0.6238177, -0.3481234, 4.025459, 0.3607843, 0, 1, 1,
0.6238902, 0.6126551, 0.3848618, 0.3686275, 0, 1, 1,
0.6305666, 0.6819625, 2.57625, 0.372549, 0, 1, 1,
0.6339366, -2.051671, 1.799509, 0.3803922, 0, 1, 1,
0.6385576, -0.2738925, 2.701736, 0.3843137, 0, 1, 1,
0.6401233, 0.9120122, -0.2659827, 0.3921569, 0, 1, 1,
0.6428708, -1.993489, 3.591863, 0.3960784, 0, 1, 1,
0.6449598, -0.2220339, 2.079656, 0.4039216, 0, 1, 1,
0.6541403, 0.9409456, 0.3547779, 0.4117647, 0, 1, 1,
0.6555911, 1.196501, -0.1018516, 0.4156863, 0, 1, 1,
0.6582574, 0.5665745, -0.3325166, 0.4235294, 0, 1, 1,
0.658802, -0.06335305, 1.590648, 0.427451, 0, 1, 1,
0.6615614, 1.899084, -0.1455454, 0.4352941, 0, 1, 1,
0.6615633, -0.8156882, 2.257879, 0.4392157, 0, 1, 1,
0.6674543, 0.01575026, 0.02194358, 0.4470588, 0, 1, 1,
0.6698088, 0.2148175, 0.2325906, 0.4509804, 0, 1, 1,
0.6778042, -0.7803782, 2.069176, 0.4588235, 0, 1, 1,
0.6825799, -0.474337, 2.009587, 0.4627451, 0, 1, 1,
0.6828156, -2.323127, 4.359714, 0.4705882, 0, 1, 1,
0.6856576, 1.242192, 0.2072282, 0.4745098, 0, 1, 1,
0.6927465, -1.405818, 2.221014, 0.4823529, 0, 1, 1,
0.6996873, 0.6825098, 1.471764, 0.4862745, 0, 1, 1,
0.7015321, -0.1136605, 2.045561, 0.4941176, 0, 1, 1,
0.7045643, -0.2692946, 0.976263, 0.5019608, 0, 1, 1,
0.7077423, 1.084137, 0.3756399, 0.5058824, 0, 1, 1,
0.7080224, 0.03734096, 2.807426, 0.5137255, 0, 1, 1,
0.7141693, 0.7441478, 0.6485972, 0.5176471, 0, 1, 1,
0.7189936, 0.3740951, 0.6271076, 0.5254902, 0, 1, 1,
0.719757, 1.969129, 1.868354, 0.5294118, 0, 1, 1,
0.7221212, 0.797106, 0.5815586, 0.5372549, 0, 1, 1,
0.7276037, -0.8510865, 2.287649, 0.5411765, 0, 1, 1,
0.7332274, 0.7516234, -1.925779, 0.5490196, 0, 1, 1,
0.7404411, -0.3548748, 1.916526, 0.5529412, 0, 1, 1,
0.7436401, -1.192432, 2.411087, 0.5607843, 0, 1, 1,
0.7482366, 0.2020378, -0.4864237, 0.5647059, 0, 1, 1,
0.752482, -0.828119, 1.915966, 0.572549, 0, 1, 1,
0.7535012, -0.08520798, 1.869929, 0.5764706, 0, 1, 1,
0.7596833, -0.4185449, 0.02586882, 0.5843138, 0, 1, 1,
0.7598321, 0.6807803, 1.938234, 0.5882353, 0, 1, 1,
0.7624943, 0.41173, 0.1458691, 0.5960785, 0, 1, 1,
0.7630607, -1.121425, 4.160325, 0.6039216, 0, 1, 1,
0.7665983, -1.26711, 2.386312, 0.6078432, 0, 1, 1,
0.7709836, -0.4617715, 2.223666, 0.6156863, 0, 1, 1,
0.7729165, -0.8395641, 2.134972, 0.6196079, 0, 1, 1,
0.7759048, -0.1517519, 1.3602, 0.627451, 0, 1, 1,
0.7875862, 0.7922941, -0.6356461, 0.6313726, 0, 1, 1,
0.7937349, -0.1827705, 2.17479, 0.6392157, 0, 1, 1,
0.7938417, 0.4109869, -1.021848, 0.6431373, 0, 1, 1,
0.7946454, 0.9397979, 1.39321, 0.6509804, 0, 1, 1,
0.7961561, -0.4146492, 1.414092, 0.654902, 0, 1, 1,
0.7966007, 1.201674, 1.100454, 0.6627451, 0, 1, 1,
0.804955, 0.8657475, 1.194116, 0.6666667, 0, 1, 1,
0.807417, -0.4112439, 0.8743815, 0.6745098, 0, 1, 1,
0.8084864, 0.2768656, 0.6185662, 0.6784314, 0, 1, 1,
0.8117991, 0.668565, 2.82359, 0.6862745, 0, 1, 1,
0.812946, 0.999873, 1.399562, 0.6901961, 0, 1, 1,
0.8174944, 0.1914741, 0.7743095, 0.6980392, 0, 1, 1,
0.8202539, 0.219165, 2.573699, 0.7058824, 0, 1, 1,
0.8228508, -1.197812, 0.81988, 0.7098039, 0, 1, 1,
0.8283838, -1.143102, 3.569552, 0.7176471, 0, 1, 1,
0.8298436, 0.6709656, 1.09292, 0.7215686, 0, 1, 1,
0.83376, 0.2136131, 1.742827, 0.7294118, 0, 1, 1,
0.837999, 0.0370126, 3.044953, 0.7333333, 0, 1, 1,
0.8402889, -0.2281827, 1.227286, 0.7411765, 0, 1, 1,
0.8404051, 1.625357, 0.6177987, 0.7450981, 0, 1, 1,
0.8471736, -1.234824, 1.841809, 0.7529412, 0, 1, 1,
0.8476655, -1.375434, 2.226629, 0.7568628, 0, 1, 1,
0.8481225, 0.7731729, 2.179887, 0.7647059, 0, 1, 1,
0.8535438, 0.09625486, 1.423519, 0.7686275, 0, 1, 1,
0.8573565, -0.884289, 2.422098, 0.7764706, 0, 1, 1,
0.8733355, 0.8006607, 0.6297281, 0.7803922, 0, 1, 1,
0.8738814, 0.116106, 0.03325692, 0.7882353, 0, 1, 1,
0.8780238, 1.672313, -0.5758253, 0.7921569, 0, 1, 1,
0.8878265, -2.624423, 3.404106, 0.8, 0, 1, 1,
0.8889523, -1.131696, 3.522627, 0.8078431, 0, 1, 1,
0.8967209, -0.02876441, -0.3963794, 0.8117647, 0, 1, 1,
0.8992811, 0.658997, 0.7672166, 0.8196079, 0, 1, 1,
0.9000018, -1.470043, 1.52037, 0.8235294, 0, 1, 1,
0.901507, -1.240136, 1.441472, 0.8313726, 0, 1, 1,
0.906495, -0.1714342, 2.765449, 0.8352941, 0, 1, 1,
0.9072611, 1.029081, 1.352387, 0.8431373, 0, 1, 1,
0.9097864, 0.2767723, -0.3818927, 0.8470588, 0, 1, 1,
0.9098942, 1.416654, -1.051193, 0.854902, 0, 1, 1,
0.9224002, -0.5738934, 2.732663, 0.8588235, 0, 1, 1,
0.9242008, 0.6396339, 0.3116755, 0.8666667, 0, 1, 1,
0.9243336, -0.2668106, 1.518587, 0.8705882, 0, 1, 1,
0.9263086, 0.03084806, 2.070832, 0.8784314, 0, 1, 1,
0.9375134, 2.540178, 0.7546312, 0.8823529, 0, 1, 1,
0.9594287, 0.1459083, 2.499507, 0.8901961, 0, 1, 1,
0.9641206, 1.235458, 0.2509374, 0.8941177, 0, 1, 1,
0.9775693, -0.6073991, 1.507438, 0.9019608, 0, 1, 1,
0.9856951, -0.4595289, 0.3781619, 0.9098039, 0, 1, 1,
0.9898363, -0.420072, 2.927016, 0.9137255, 0, 1, 1,
0.9960461, -1.190244, 1.699753, 0.9215686, 0, 1, 1,
0.9991887, 0.6470761, 2.251736, 0.9254902, 0, 1, 1,
1.000291, -0.5348602, 2.532193, 0.9333333, 0, 1, 1,
1.00577, -0.2298484, 1.726729, 0.9372549, 0, 1, 1,
1.006879, 0.9444438, -0.2368252, 0.945098, 0, 1, 1,
1.008036, 0.1323803, 2.10916, 0.9490196, 0, 1, 1,
1.010212, 0.5803053, 1.866033, 0.9568627, 0, 1, 1,
1.010314, 0.6887199, 0.3323594, 0.9607843, 0, 1, 1,
1.012174, 1.962237, 1.999918, 0.9686275, 0, 1, 1,
1.01243, -0.7489001, 2.376087, 0.972549, 0, 1, 1,
1.019259, 0.8218646, 3.730741, 0.9803922, 0, 1, 1,
1.020177, 0.7115975, 0.5806363, 0.9843137, 0, 1, 1,
1.022629, -0.1883145, 3.047257, 0.9921569, 0, 1, 1,
1.027196, -0.767877, 0.804975, 0.9960784, 0, 1, 1,
1.030534, 1.875632, 1.516821, 1, 0, 0.9960784, 1,
1.033251, 0.4795618, 2.020234, 1, 0, 0.9882353, 1,
1.036516, -0.3595876, 1.44121, 1, 0, 0.9843137, 1,
1.039534, -0.7653469, 1.523545, 1, 0, 0.9764706, 1,
1.044095, -0.09592844, 0.8354, 1, 0, 0.972549, 1,
1.05, 0.9379158, 0.9513271, 1, 0, 0.9647059, 1,
1.050675, 0.9756088, 0.8230683, 1, 0, 0.9607843, 1,
1.063001, -0.03675102, 2.449531, 1, 0, 0.9529412, 1,
1.063978, -2.126599, 1.681784, 1, 0, 0.9490196, 1,
1.064726, -0.3304539, 1.633484, 1, 0, 0.9411765, 1,
1.067567, -0.5073804, 3.225041, 1, 0, 0.9372549, 1,
1.072812, 0.07514051, 1.820282, 1, 0, 0.9294118, 1,
1.078068, -0.2716267, 1.981505, 1, 0, 0.9254902, 1,
1.082312, -0.2791955, 2.364905, 1, 0, 0.9176471, 1,
1.092908, -1.314211, 2.543871, 1, 0, 0.9137255, 1,
1.09362, -0.3389339, 2.769209, 1, 0, 0.9058824, 1,
1.095877, 0.5908023, 2.358832, 1, 0, 0.9019608, 1,
1.103598, 0.4897822, 0.3455523, 1, 0, 0.8941177, 1,
1.104196, -1.097003, 3.075188, 1, 0, 0.8862745, 1,
1.105403, -1.389283, 1.997811, 1, 0, 0.8823529, 1,
1.110731, -1.127825, 2.367682, 1, 0, 0.8745098, 1,
1.119075, -1.046039, 2.548027, 1, 0, 0.8705882, 1,
1.120251, 0.2065991, 1.695134, 1, 0, 0.8627451, 1,
1.125603, -1.255031, 3.474578, 1, 0, 0.8588235, 1,
1.130297, 0.4515573, 0.1704231, 1, 0, 0.8509804, 1,
1.131437, 1.455874, -0.4348134, 1, 0, 0.8470588, 1,
1.13311, 0.9711305, -0.204773, 1, 0, 0.8392157, 1,
1.141704, 1.044838, 0.9274219, 1, 0, 0.8352941, 1,
1.142245, -0.09098262, 2.263137, 1, 0, 0.827451, 1,
1.146178, 0.7680724, 1.791306, 1, 0, 0.8235294, 1,
1.147867, -0.0281566, 0.5027612, 1, 0, 0.8156863, 1,
1.154048, -0.6167087, 2.375687, 1, 0, 0.8117647, 1,
1.154846, 0.4731384, 1.604021, 1, 0, 0.8039216, 1,
1.155174, 0.9102764, 0.675842, 1, 0, 0.7960784, 1,
1.156091, -1.324882, 0.925408, 1, 0, 0.7921569, 1,
1.163347, -1.517288, 3.310655, 1, 0, 0.7843137, 1,
1.163608, 0.02076437, 1.032087, 1, 0, 0.7803922, 1,
1.169166, 0.5568284, 1.096893, 1, 0, 0.772549, 1,
1.173702, 1.47175, 0.02412182, 1, 0, 0.7686275, 1,
1.175946, -0.5015501, 3.372516, 1, 0, 0.7607843, 1,
1.179684, -1.10531, 1.929627, 1, 0, 0.7568628, 1,
1.185848, 1.029746, 0.05647623, 1, 0, 0.7490196, 1,
1.192397, 0.6522152, 0.5098544, 1, 0, 0.7450981, 1,
1.194539, 0.8888536, -0.2463252, 1, 0, 0.7372549, 1,
1.198134, 0.3366228, 3.707622, 1, 0, 0.7333333, 1,
1.198911, -1.466683, 2.899292, 1, 0, 0.7254902, 1,
1.200846, 0.7585725, 1.947776, 1, 0, 0.7215686, 1,
1.203253, -0.869792, 2.849324, 1, 0, 0.7137255, 1,
1.210764, 0.1153019, 1.84004, 1, 0, 0.7098039, 1,
1.212531, -0.9496843, 1.678392, 1, 0, 0.7019608, 1,
1.225686, -0.257674, 2.859632, 1, 0, 0.6941177, 1,
1.22604, 0.4530942, 2.788889, 1, 0, 0.6901961, 1,
1.23112, 1.546751, -0.1666399, 1, 0, 0.682353, 1,
1.231623, -0.5796564, 2.61572, 1, 0, 0.6784314, 1,
1.234133, 0.3858383, -0.03956784, 1, 0, 0.6705883, 1,
1.241575, 0.2051703, 1.194743, 1, 0, 0.6666667, 1,
1.242139, 1.08986, 1.82269, 1, 0, 0.6588235, 1,
1.249359, 2.03429, 0.4502178, 1, 0, 0.654902, 1,
1.26539, 0.1672995, 0.9616183, 1, 0, 0.6470588, 1,
1.273723, 0.03936003, 2.261044, 1, 0, 0.6431373, 1,
1.296098, 0.3707385, 0.4481431, 1, 0, 0.6352941, 1,
1.297786, -0.7634778, 3.009228, 1, 0, 0.6313726, 1,
1.299117, -0.5838257, 0.5801374, 1, 0, 0.6235294, 1,
1.300298, 1.008438, 1.112308, 1, 0, 0.6196079, 1,
1.301853, 0.4481843, 0.6148786, 1, 0, 0.6117647, 1,
1.309874, 0.17896, 0.2658574, 1, 0, 0.6078432, 1,
1.31125, 1.195655, 2.745295, 1, 0, 0.6, 1,
1.313453, -0.9742507, 0.438918, 1, 0, 0.5921569, 1,
1.326206, -0.4435942, 2.426512, 1, 0, 0.5882353, 1,
1.327952, 2.227587, -0.4353914, 1, 0, 0.5803922, 1,
1.335013, 0.1231288, 0.8432693, 1, 0, 0.5764706, 1,
1.341434, -0.9758586, 2.386266, 1, 0, 0.5686275, 1,
1.343102, 0.3069846, 2.001961, 1, 0, 0.5647059, 1,
1.345952, -2.154706, 4.148872, 1, 0, 0.5568628, 1,
1.35033, -0.5217251, 2.345578, 1, 0, 0.5529412, 1,
1.353495, -0.3924391, 2.127736, 1, 0, 0.5450981, 1,
1.355285, 0.8503786, -0.1862086, 1, 0, 0.5411765, 1,
1.356382, 1.736801, 2.803701, 1, 0, 0.5333334, 1,
1.363579, -1.674816, 1.875947, 1, 0, 0.5294118, 1,
1.368371, 1.284218, -1.013875, 1, 0, 0.5215687, 1,
1.375301, -0.4838824, 1.544697, 1, 0, 0.5176471, 1,
1.376014, 2.587641, 1.407109, 1, 0, 0.509804, 1,
1.38728, 1.419001, 1.866853, 1, 0, 0.5058824, 1,
1.391751, -0.9171571, -0.281204, 1, 0, 0.4980392, 1,
1.40599, -0.02421769, 2.491814, 1, 0, 0.4901961, 1,
1.41188, -0.6235736, 0.8011174, 1, 0, 0.4862745, 1,
1.413639, -0.7589235, 2.390344, 1, 0, 0.4784314, 1,
1.414206, 0.2296207, 0.1221513, 1, 0, 0.4745098, 1,
1.417382, 0.2981475, 2.887543, 1, 0, 0.4666667, 1,
1.424939, -0.1769543, 1.239811, 1, 0, 0.4627451, 1,
1.428388, -1.305878, 2.587168, 1, 0, 0.454902, 1,
1.431125, -0.8926097, 1.172732, 1, 0, 0.4509804, 1,
1.441077, 0.854657, -0.5041211, 1, 0, 0.4431373, 1,
1.441952, 0.3397616, 1.420783, 1, 0, 0.4392157, 1,
1.448714, 0.8653219, 0.6550415, 1, 0, 0.4313726, 1,
1.451991, -0.8888736, -0.6827791, 1, 0, 0.427451, 1,
1.464031, 0.02270049, 1.470855, 1, 0, 0.4196078, 1,
1.471127, 1.094233, 1.199813, 1, 0, 0.4156863, 1,
1.484388, 0.1378057, 3.669774, 1, 0, 0.4078431, 1,
1.484562, 0.9513191, 0.8574769, 1, 0, 0.4039216, 1,
1.488244, 0.004862686, 2.11203, 1, 0, 0.3960784, 1,
1.489165, 0.70319, 0.8384103, 1, 0, 0.3882353, 1,
1.500992, 0.3349463, 1.472627, 1, 0, 0.3843137, 1,
1.506256, 1.007689, 1.789725, 1, 0, 0.3764706, 1,
1.510929, 0.3246467, 1.905072, 1, 0, 0.372549, 1,
1.516731, -0.01798481, 1.545245, 1, 0, 0.3647059, 1,
1.524118, -0.02051839, 1.475022, 1, 0, 0.3607843, 1,
1.540999, -0.2966641, 2.305106, 1, 0, 0.3529412, 1,
1.563794, 0.6457372, 1.382029, 1, 0, 0.3490196, 1,
1.565229, 1.075157, -1.576679, 1, 0, 0.3411765, 1,
1.57474, -0.1044207, 1.351587, 1, 0, 0.3372549, 1,
1.583561, -1.254289, 0.1789661, 1, 0, 0.3294118, 1,
1.585202, -0.2012633, 1.121058, 1, 0, 0.3254902, 1,
1.598476, -0.1807747, 1.578482, 1, 0, 0.3176471, 1,
1.599364, 0.2265686, 2.8254, 1, 0, 0.3137255, 1,
1.61307, 1.813276, 3.235697, 1, 0, 0.3058824, 1,
1.646072, -0.6099607, 1.290533, 1, 0, 0.2980392, 1,
1.670602, 0.9834477, 0.7751621, 1, 0, 0.2941177, 1,
1.697102, 0.2158553, 0.6932496, 1, 0, 0.2862745, 1,
1.704445, -0.6918998, 2.738258, 1, 0, 0.282353, 1,
1.706934, -0.1510217, 0.7007558, 1, 0, 0.2745098, 1,
1.745325, -1.176965, 1.200791, 1, 0, 0.2705882, 1,
1.746637, -0.9077287, 2.704492, 1, 0, 0.2627451, 1,
1.772586, 0.2482575, 0.579504, 1, 0, 0.2588235, 1,
1.778009, 0.5362455, 0.7000003, 1, 0, 0.2509804, 1,
1.782611, 0.6850578, 2.663539, 1, 0, 0.2470588, 1,
1.818925, -1.188537, 3.828265, 1, 0, 0.2392157, 1,
1.840721, -0.8304934, 1.712257, 1, 0, 0.2352941, 1,
1.841803, -0.6187879, 3.289668, 1, 0, 0.227451, 1,
1.873734, 0.5507558, 0.6217064, 1, 0, 0.2235294, 1,
1.873887, 0.1720125, 1.037593, 1, 0, 0.2156863, 1,
1.878567, 1.227859, 1.067683, 1, 0, 0.2117647, 1,
1.902115, 2.21034, 1.124396, 1, 0, 0.2039216, 1,
1.940882, -0.6717016, 3.200811, 1, 0, 0.1960784, 1,
1.942622, 0.6638275, 2.964944, 1, 0, 0.1921569, 1,
1.947709, -1.251426, 0.9497781, 1, 0, 0.1843137, 1,
1.97352, 0.3445982, 2.67286, 1, 0, 0.1803922, 1,
2.003181, -0.159238, 1.871138, 1, 0, 0.172549, 1,
2.021862, 1.220398, 1.792568, 1, 0, 0.1686275, 1,
2.029435, -0.1402101, 2.670887, 1, 0, 0.1607843, 1,
2.03614, 1.46331, 1.639671, 1, 0, 0.1568628, 1,
2.068471, -1.148286, 1.785483, 1, 0, 0.1490196, 1,
2.088978, -0.8238611, 2.031842, 1, 0, 0.145098, 1,
2.1111, 1.562544, 1.029866, 1, 0, 0.1372549, 1,
2.143201, -1.19279, 1.490914, 1, 0, 0.1333333, 1,
2.147206, -0.3897695, 0.03632913, 1, 0, 0.1254902, 1,
2.159398, 0.1439439, 2.017497, 1, 0, 0.1215686, 1,
2.171727, 0.6364062, 1.108903, 1, 0, 0.1137255, 1,
2.196295, -1.013248, 0.6772853, 1, 0, 0.1098039, 1,
2.211865, -1.210917, 1.622168, 1, 0, 0.1019608, 1,
2.234968, 0.01575865, 2.166893, 1, 0, 0.09411765, 1,
2.297865, -1.258843, 1.706535, 1, 0, 0.09019608, 1,
2.316532, -0.5567198, -0.4145394, 1, 0, 0.08235294, 1,
2.367986, 0.4290564, 1.665185, 1, 0, 0.07843138, 1,
2.411082, -1.241433, 2.620801, 1, 0, 0.07058824, 1,
2.415561, 0.08812163, 1.509963, 1, 0, 0.06666667, 1,
2.43666, -0.4794375, 2.411129, 1, 0, 0.05882353, 1,
2.44668, 0.4316854, 0.6840231, 1, 0, 0.05490196, 1,
2.473559, 1.086145, 1.094871, 1, 0, 0.04705882, 1,
2.527514, 1.199412, 0.7550005, 1, 0, 0.04313726, 1,
2.56179, 0.2198964, 1.963921, 1, 0, 0.03529412, 1,
2.677925, 0.5032683, 1.072786, 1, 0, 0.03137255, 1,
2.681923, 0.03158621, 0.9611263, 1, 0, 0.02352941, 1,
2.693225, -0.7487648, 1.972588, 1, 0, 0.01960784, 1,
2.720083, 0.3429332, 2.133889, 1, 0, 0.01176471, 1,
2.731312, -0.4208593, 1.337205, 1, 0, 0.007843138, 1
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
-0.1348035, -4.05641, -6.71698, 0, -0.5, 0.5, 0.5,
-0.1348035, -4.05641, -6.71698, 1, -0.5, 0.5, 0.5,
-0.1348035, -4.05641, -6.71698, 1, 1.5, 0.5, 0.5,
-0.1348035, -4.05641, -6.71698, 0, 1.5, 0.5, 0.5
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
-3.972532, 0.4627527, -6.71698, 0, -0.5, 0.5, 0.5,
-3.972532, 0.4627527, -6.71698, 1, -0.5, 0.5, 0.5,
-3.972532, 0.4627527, -6.71698, 1, 1.5, 0.5, 0.5,
-3.972532, 0.4627527, -6.71698, 0, 1.5, 0.5, 0.5
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
-3.972532, -4.05641, 0.1142852, 0, -0.5, 0.5, 0.5,
-3.972532, -4.05641, 0.1142852, 1, -0.5, 0.5, 0.5,
-3.972532, -4.05641, 0.1142852, 1, 1.5, 0.5, 0.5,
-3.972532, -4.05641, 0.1142852, 0, 1.5, 0.5, 0.5
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
-3, -3.013526, -5.140534,
2, -3.013526, -5.140534,
-3, -3.013526, -5.140534,
-3, -3.18734, -5.403275,
-2, -3.013526, -5.140534,
-2, -3.18734, -5.403275,
-1, -3.013526, -5.140534,
-1, -3.18734, -5.403275,
0, -3.013526, -5.140534,
0, -3.18734, -5.403275,
1, -3.013526, -5.140534,
1, -3.18734, -5.403275,
2, -3.013526, -5.140534,
2, -3.18734, -5.403275
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
-3, -3.534968, -5.928758, 0, -0.5, 0.5, 0.5,
-3, -3.534968, -5.928758, 1, -0.5, 0.5, 0.5,
-3, -3.534968, -5.928758, 1, 1.5, 0.5, 0.5,
-3, -3.534968, -5.928758, 0, 1.5, 0.5, 0.5,
-2, -3.534968, -5.928758, 0, -0.5, 0.5, 0.5,
-2, -3.534968, -5.928758, 1, -0.5, 0.5, 0.5,
-2, -3.534968, -5.928758, 1, 1.5, 0.5, 0.5,
-2, -3.534968, -5.928758, 0, 1.5, 0.5, 0.5,
-1, -3.534968, -5.928758, 0, -0.5, 0.5, 0.5,
-1, -3.534968, -5.928758, 1, -0.5, 0.5, 0.5,
-1, -3.534968, -5.928758, 1, 1.5, 0.5, 0.5,
-1, -3.534968, -5.928758, 0, 1.5, 0.5, 0.5,
0, -3.534968, -5.928758, 0, -0.5, 0.5, 0.5,
0, -3.534968, -5.928758, 1, -0.5, 0.5, 0.5,
0, -3.534968, -5.928758, 1, 1.5, 0.5, 0.5,
0, -3.534968, -5.928758, 0, 1.5, 0.5, 0.5,
1, -3.534968, -5.928758, 0, -0.5, 0.5, 0.5,
1, -3.534968, -5.928758, 1, -0.5, 0.5, 0.5,
1, -3.534968, -5.928758, 1, 1.5, 0.5, 0.5,
1, -3.534968, -5.928758, 0, 1.5, 0.5, 0.5,
2, -3.534968, -5.928758, 0, -0.5, 0.5, 0.5,
2, -3.534968, -5.928758, 1, -0.5, 0.5, 0.5,
2, -3.534968, -5.928758, 1, 1.5, 0.5, 0.5,
2, -3.534968, -5.928758, 0, 1.5, 0.5, 0.5
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
-3.086902, -2, -5.140534,
-3.086902, 3, -5.140534,
-3.086902, -2, -5.140534,
-3.234507, -2, -5.403275,
-3.086902, -1, -5.140534,
-3.234507, -1, -5.403275,
-3.086902, 0, -5.140534,
-3.234507, 0, -5.403275,
-3.086902, 1, -5.140534,
-3.234507, 1, -5.403275,
-3.086902, 2, -5.140534,
-3.234507, 2, -5.403275,
-3.086902, 3, -5.140534,
-3.234507, 3, -5.403275
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
-3.529717, -2, -5.928758, 0, -0.5, 0.5, 0.5,
-3.529717, -2, -5.928758, 1, -0.5, 0.5, 0.5,
-3.529717, -2, -5.928758, 1, 1.5, 0.5, 0.5,
-3.529717, -2, -5.928758, 0, 1.5, 0.5, 0.5,
-3.529717, -1, -5.928758, 0, -0.5, 0.5, 0.5,
-3.529717, -1, -5.928758, 1, -0.5, 0.5, 0.5,
-3.529717, -1, -5.928758, 1, 1.5, 0.5, 0.5,
-3.529717, -1, -5.928758, 0, 1.5, 0.5, 0.5,
-3.529717, 0, -5.928758, 0, -0.5, 0.5, 0.5,
-3.529717, 0, -5.928758, 1, -0.5, 0.5, 0.5,
-3.529717, 0, -5.928758, 1, 1.5, 0.5, 0.5,
-3.529717, 0, -5.928758, 0, 1.5, 0.5, 0.5,
-3.529717, 1, -5.928758, 0, -0.5, 0.5, 0.5,
-3.529717, 1, -5.928758, 1, -0.5, 0.5, 0.5,
-3.529717, 1, -5.928758, 1, 1.5, 0.5, 0.5,
-3.529717, 1, -5.928758, 0, 1.5, 0.5, 0.5,
-3.529717, 2, -5.928758, 0, -0.5, 0.5, 0.5,
-3.529717, 2, -5.928758, 1, -0.5, 0.5, 0.5,
-3.529717, 2, -5.928758, 1, 1.5, 0.5, 0.5,
-3.529717, 2, -5.928758, 0, 1.5, 0.5, 0.5,
-3.529717, 3, -5.928758, 0, -0.5, 0.5, 0.5,
-3.529717, 3, -5.928758, 1, -0.5, 0.5, 0.5,
-3.529717, 3, -5.928758, 1, 1.5, 0.5, 0.5,
-3.529717, 3, -5.928758, 0, 1.5, 0.5, 0.5
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
-3.086902, -3.013526, -4,
-3.086902, -3.013526, 4,
-3.086902, -3.013526, -4,
-3.234507, -3.18734, -4,
-3.086902, -3.013526, -2,
-3.234507, -3.18734, -2,
-3.086902, -3.013526, 0,
-3.234507, -3.18734, 0,
-3.086902, -3.013526, 2,
-3.234507, -3.18734, 2,
-3.086902, -3.013526, 4,
-3.234507, -3.18734, 4
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
-3.529717, -3.534968, -4, 0, -0.5, 0.5, 0.5,
-3.529717, -3.534968, -4, 1, -0.5, 0.5, 0.5,
-3.529717, -3.534968, -4, 1, 1.5, 0.5, 0.5,
-3.529717, -3.534968, -4, 0, 1.5, 0.5, 0.5,
-3.529717, -3.534968, -2, 0, -0.5, 0.5, 0.5,
-3.529717, -3.534968, -2, 1, -0.5, 0.5, 0.5,
-3.529717, -3.534968, -2, 1, 1.5, 0.5, 0.5,
-3.529717, -3.534968, -2, 0, 1.5, 0.5, 0.5,
-3.529717, -3.534968, 0, 0, -0.5, 0.5, 0.5,
-3.529717, -3.534968, 0, 1, -0.5, 0.5, 0.5,
-3.529717, -3.534968, 0, 1, 1.5, 0.5, 0.5,
-3.529717, -3.534968, 0, 0, 1.5, 0.5, 0.5,
-3.529717, -3.534968, 2, 0, -0.5, 0.5, 0.5,
-3.529717, -3.534968, 2, 1, -0.5, 0.5, 0.5,
-3.529717, -3.534968, 2, 1, 1.5, 0.5, 0.5,
-3.529717, -3.534968, 2, 0, 1.5, 0.5, 0.5,
-3.529717, -3.534968, 4, 0, -0.5, 0.5, 0.5,
-3.529717, -3.534968, 4, 1, -0.5, 0.5, 0.5,
-3.529717, -3.534968, 4, 1, 1.5, 0.5, 0.5,
-3.529717, -3.534968, 4, 0, 1.5, 0.5, 0.5
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
-3.086902, -3.013526, -5.140534,
-3.086902, 3.939032, -5.140534,
-3.086902, -3.013526, 5.369105,
-3.086902, 3.939032, 5.369105,
-3.086902, -3.013526, -5.140534,
-3.086902, -3.013526, 5.369105,
-3.086902, 3.939032, -5.140534,
-3.086902, 3.939032, 5.369105,
-3.086902, -3.013526, -5.140534,
2.817295, -3.013526, -5.140534,
-3.086902, -3.013526, 5.369105,
2.817295, -3.013526, 5.369105,
-3.086902, 3.939032, -5.140534,
2.817295, 3.939032, -5.140534,
-3.086902, 3.939032, 5.369105,
2.817295, 3.939032, 5.369105,
2.817295, -3.013526, -5.140534,
2.817295, 3.939032, -5.140534,
2.817295, -3.013526, 5.369105,
2.817295, 3.939032, 5.369105,
2.817295, -3.013526, -5.140534,
2.817295, -3.013526, 5.369105,
2.817295, 3.939032, -5.140534,
2.817295, 3.939032, 5.369105
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
var radius = 7.43078;
var distance = 33.06038;
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
mvMatrix.translate( 0.1348035, -0.4627527, -0.1142852 );
mvMatrix.scale( 1.360778, 1.15559, 0.76447 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.06038);
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
methyl_ester<-read.table("methyl_ester.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyl_ester$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
```

```r
y<-methyl_ester$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
```

```r
z<-methyl_ester$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
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
-3.000919, -2.065969, -2.014673, 0, 0, 1, 1, 1,
-2.717947, 0.6890653, -0.3400443, 1, 0, 0, 1, 1,
-2.683866, 0.9843853, -1.328504, 1, 0, 0, 1, 1,
-2.466925, -0.6062432, -1.855341, 1, 0, 0, 1, 1,
-2.458947, -0.4013925, 0.2976192, 1, 0, 0, 1, 1,
-2.452831, -2.582381, -2.522227, 1, 0, 0, 1, 1,
-2.434752, 0.2690203, -0.4688987, 0, 0, 0, 1, 1,
-2.363451, 1.046922, 0.5507044, 0, 0, 0, 1, 1,
-2.327141, 0.3631575, -1.494047, 0, 0, 0, 1, 1,
-2.313577, -1.119742, -1.667544, 0, 0, 0, 1, 1,
-2.2912, -1.198046, -3.700376, 0, 0, 0, 1, 1,
-2.2444, -0.5050398, -3.681446, 0, 0, 0, 1, 1,
-2.208592, -1.002252, -0.8882471, 0, 0, 0, 1, 1,
-2.207103, 0.5914724, 0.5218501, 1, 1, 1, 1, 1,
-2.1924, -0.4467469, -0.4854987, 1, 1, 1, 1, 1,
-2.181246, 0.7871752, -1.770273, 1, 1, 1, 1, 1,
-2.133852, 0.7106163, -1.933448, 1, 1, 1, 1, 1,
-2.068512, -0.01361552, -2.30594, 1, 1, 1, 1, 1,
-2.056378, -0.0678248, -0.3426222, 1, 1, 1, 1, 1,
-2.042236, -0.4195247, -2.182709, 1, 1, 1, 1, 1,
-1.983664, -0.2527277, -1.121205, 1, 1, 1, 1, 1,
-1.929093, -1.206047, -2.081004, 1, 1, 1, 1, 1,
-1.90202, -1.390774, -3.700334, 1, 1, 1, 1, 1,
-1.894637, 2.435433, 0.2412594, 1, 1, 1, 1, 1,
-1.890598, 0.704217, -1.596359, 1, 1, 1, 1, 1,
-1.885002, -0.6546424, -2.810838, 1, 1, 1, 1, 1,
-1.883722, -0.3412151, -0.7293094, 1, 1, 1, 1, 1,
-1.882804, -0.6338189, -3.25469, 1, 1, 1, 1, 1,
-1.87826, -0.5102801, -0.5506871, 0, 0, 1, 1, 1,
-1.845579, 0.5739846, 0.719596, 1, 0, 0, 1, 1,
-1.839772, -1.571714, -2.504793, 1, 0, 0, 1, 1,
-1.812215, 1.485807, -0.9448073, 1, 0, 0, 1, 1,
-1.810382, 0.666612, -0.9236644, 1, 0, 0, 1, 1,
-1.797327, 0.6628606, -1.542309, 1, 0, 0, 1, 1,
-1.781229, -0.2643384, -1.521954, 0, 0, 0, 1, 1,
-1.766053, -0.4879284, -1.127246, 0, 0, 0, 1, 1,
-1.745896, 1.425427, 0.08926732, 0, 0, 0, 1, 1,
-1.741279, -0.8247026, -2.645005, 0, 0, 0, 1, 1,
-1.740969, -0.6131657, -2.051973, 0, 0, 0, 1, 1,
-1.704803, -0.1262924, -0.6202592, 0, 0, 0, 1, 1,
-1.670933, -1.621512, -3.064778, 0, 0, 0, 1, 1,
-1.656532, 0.09925491, -0.7233654, 1, 1, 1, 1, 1,
-1.636645, 1.684206, -1.416389, 1, 1, 1, 1, 1,
-1.623395, 0.3956745, -0.7107661, 1, 1, 1, 1, 1,
-1.606173, -0.3566854, -1.471432, 1, 1, 1, 1, 1,
-1.591533, 0.6663173, -1.549443, 1, 1, 1, 1, 1,
-1.568486, 0.04900554, -1.350907, 1, 1, 1, 1, 1,
-1.559955, -0.8858024, -1.819926, 1, 1, 1, 1, 1,
-1.55994, -0.3289174, -1.69731, 1, 1, 1, 1, 1,
-1.546664, 0.6678328, -0.9712498, 1, 1, 1, 1, 1,
-1.539202, 0.3219765, 0.770058, 1, 1, 1, 1, 1,
-1.523847, -1.096535, -2.524029, 1, 1, 1, 1, 1,
-1.521601, 0.06401453, -2.132164, 1, 1, 1, 1, 1,
-1.521404, -0.5606344, -0.5339346, 1, 1, 1, 1, 1,
-1.520886, 1.398207, -1.717415, 1, 1, 1, 1, 1,
-1.513947, -0.9302959, -2.048104, 1, 1, 1, 1, 1,
-1.50879, -0.4642149, -0.5491417, 0, 0, 1, 1, 1,
-1.508382, 0.9516788, -0.01170679, 1, 0, 0, 1, 1,
-1.499198, 0.4714784, -0.1124058, 1, 0, 0, 1, 1,
-1.495237, 1.360369, -1.527575, 1, 0, 0, 1, 1,
-1.490485, -1.122576, -2.07055, 1, 0, 0, 1, 1,
-1.485808, 0.9499327, -1.267542, 1, 0, 0, 1, 1,
-1.468646, -1.341501, -2.379325, 0, 0, 0, 1, 1,
-1.468477, -0.5826876, -1.705114, 0, 0, 0, 1, 1,
-1.441859, 1.495765, 1.690721, 0, 0, 0, 1, 1,
-1.440952, -0.3962528, -3.035671, 0, 0, 0, 1, 1,
-1.435885, 1.091111, -2.237042, 0, 0, 0, 1, 1,
-1.435389, 2.198483, -2.441066, 0, 0, 0, 1, 1,
-1.435175, 0.1721222, -1.217086, 0, 0, 0, 1, 1,
-1.428111, 0.3677647, -3.348474, 1, 1, 1, 1, 1,
-1.412511, -0.3133203, -2.885661, 1, 1, 1, 1, 1,
-1.410592, 0.1190948, -1.284726, 1, 1, 1, 1, 1,
-1.407134, -0.784826, -3.157461, 1, 1, 1, 1, 1,
-1.369624, 1.239947, 0.1263721, 1, 1, 1, 1, 1,
-1.365629, -0.7798339, -1.701426, 1, 1, 1, 1, 1,
-1.364641, -0.006602465, -1.323851, 1, 1, 1, 1, 1,
-1.330998, 0.2031513, -0.7460877, 1, 1, 1, 1, 1,
-1.301402, -0.3405216, 0.06865453, 1, 1, 1, 1, 1,
-1.298401, -0.07172087, -0.560956, 1, 1, 1, 1, 1,
-1.295402, 0.06982365, 0.0618217, 1, 1, 1, 1, 1,
-1.28979, -1.245601, -1.865869, 1, 1, 1, 1, 1,
-1.278274, 0.8980458, -1.517027, 1, 1, 1, 1, 1,
-1.251371, 0.3081751, 0.4702688, 1, 1, 1, 1, 1,
-1.249699, -0.3482927, -1.806466, 1, 1, 1, 1, 1,
-1.243614, 1.575234, 0.6011741, 0, 0, 1, 1, 1,
-1.2422, -1.984656, -2.164514, 1, 0, 0, 1, 1,
-1.239091, -2.727499, -2.673002, 1, 0, 0, 1, 1,
-1.237321, 0.4002386, -0.2228055, 1, 0, 0, 1, 1,
-1.232361, -1.085035, -2.168209, 1, 0, 0, 1, 1,
-1.231147, 1.160705, -0.7507348, 1, 0, 0, 1, 1,
-1.230219, -0.5352129, -1.802351, 0, 0, 0, 1, 1,
-1.21551, 0.6087912, -1.038086, 0, 0, 0, 1, 1,
-1.210706, 0.3959285, -1.907336, 0, 0, 0, 1, 1,
-1.207954, -1.069127, -3.243981, 0, 0, 0, 1, 1,
-1.207709, -0.1794148, -1.8225, 0, 0, 0, 1, 1,
-1.198635, 0.9073052, -1.70778, 0, 0, 0, 1, 1,
-1.194316, 0.9812219, 0.4938657, 0, 0, 0, 1, 1,
-1.191096, -0.7032944, -0.898306, 1, 1, 1, 1, 1,
-1.190628, 0.651597, -1.130549, 1, 1, 1, 1, 1,
-1.186049, -0.3670064, -1.430304, 1, 1, 1, 1, 1,
-1.178378, -0.009252205, -2.511124, 1, 1, 1, 1, 1,
-1.17501, -0.5991939, -1.801182, 1, 1, 1, 1, 1,
-1.167844, -0.1979918, -1.662919, 1, 1, 1, 1, 1,
-1.167057, 0.5963852, -0.3329335, 1, 1, 1, 1, 1,
-1.163618, 0.05239184, -1.243234, 1, 1, 1, 1, 1,
-1.163422, 0.5407245, -1.72428, 1, 1, 1, 1, 1,
-1.147628, 0.7906085, -1.088104, 1, 1, 1, 1, 1,
-1.144802, 0.3682379, -0.5400921, 1, 1, 1, 1, 1,
-1.144174, 0.4998307, -0.4909214, 1, 1, 1, 1, 1,
-1.132709, -1.811054, -2.498729, 1, 1, 1, 1, 1,
-1.130565, -0.4139131, -1.497707, 1, 1, 1, 1, 1,
-1.120211, -0.3298569, -2.537415, 1, 1, 1, 1, 1,
-1.117788, 0.4137212, -1.842929, 0, 0, 1, 1, 1,
-1.113824, 1.237723, -1.539276, 1, 0, 0, 1, 1,
-1.109836, 2.59093, -1.338567, 1, 0, 0, 1, 1,
-1.106419, -1.614306, -3.271881, 1, 0, 0, 1, 1,
-1.100863, -0.9480132, -3.642871, 1, 0, 0, 1, 1,
-1.092886, -1.383975, -2.439545, 1, 0, 0, 1, 1,
-1.092769, -2.912276, -0.7246083, 0, 0, 0, 1, 1,
-1.092553, 0.7557256, -2.017354, 0, 0, 0, 1, 1,
-1.092469, 0.2680692, -1.36949, 0, 0, 0, 1, 1,
-1.089238, 0.7050064, -0.1462522, 0, 0, 0, 1, 1,
-1.086819, 0.9739519, -0.8136175, 0, 0, 0, 1, 1,
-1.085673, 0.9530053, -0.6796203, 0, 0, 0, 1, 1,
-1.084938, 0.9214883, -1.445678, 0, 0, 0, 1, 1,
-1.084259, 0.4510634, -0.5125918, 1, 1, 1, 1, 1,
-1.082175, -0.8335474, -1.406818, 1, 1, 1, 1, 1,
-1.073014, 0.9045566, -0.1899529, 1, 1, 1, 1, 1,
-1.072959, 0.5739202, 0.09959911, 1, 1, 1, 1, 1,
-1.071972, -0.4161704, -1.23156, 1, 1, 1, 1, 1,
-1.07083, -0.9387236, -1.692528, 1, 1, 1, 1, 1,
-1.068868, -1.046761, -0.8656566, 1, 1, 1, 1, 1,
-1.063405, -1.05214, -2.701513, 1, 1, 1, 1, 1,
-1.05994, -1.597373, -1.470086, 1, 1, 1, 1, 1,
-1.055711, 0.1004439, -1.682371, 1, 1, 1, 1, 1,
-1.053208, 0.549909, -2.273197, 1, 1, 1, 1, 1,
-1.051857, 0.6246627, -0.4169399, 1, 1, 1, 1, 1,
-1.048409, 0.05762685, -1.159908, 1, 1, 1, 1, 1,
-1.047168, -0.6768457, -1.199747, 1, 1, 1, 1, 1,
-1.046534, 0.225325, -0.9130188, 1, 1, 1, 1, 1,
-1.043867, 0.05333471, -1.446964, 0, 0, 1, 1, 1,
-1.040408, 1.263706, 0.9571961, 1, 0, 0, 1, 1,
-1.035899, -0.09345035, -1.248044, 1, 0, 0, 1, 1,
-1.033908, -0.03506955, -0.798883, 1, 0, 0, 1, 1,
-1.027859, 1.008475, -0.5774934, 1, 0, 0, 1, 1,
-1.027104, 0.2272402, -1.269777, 1, 0, 0, 1, 1,
-1.025229, -0.8507756, -3.547102, 0, 0, 0, 1, 1,
-1.024697, 0.1698946, -1.632255, 0, 0, 0, 1, 1,
-1.024078, -0.9625208, -2.428479, 0, 0, 0, 1, 1,
-1.020894, 3.837781, 1.103851, 0, 0, 0, 1, 1,
-1.014372, 1.535293, -1.50547, 0, 0, 0, 1, 1,
-1.012147, 0.8696907, 0.7638918, 0, 0, 0, 1, 1,
-1.005532, -0.1236505, -2.928939, 0, 0, 0, 1, 1,
-1.002455, 2.080758, 0.2639082, 1, 1, 1, 1, 1,
-0.99514, -0.5015948, -2.192813, 1, 1, 1, 1, 1,
-0.9898769, -1.462112, -2.53223, 1, 1, 1, 1, 1,
-0.9875407, 1.185457, -0.905961, 1, 1, 1, 1, 1,
-0.9817977, -0.146392, -0.2930771, 1, 1, 1, 1, 1,
-0.9812288, -1.382573, -2.4701, 1, 1, 1, 1, 1,
-0.9789941, -1.792391, -0.08117981, 1, 1, 1, 1, 1,
-0.9724433, -0.8789282, -1.007925, 1, 1, 1, 1, 1,
-0.9689133, 0.2088002, -2.554494, 1, 1, 1, 1, 1,
-0.963676, -0.1541073, -2.223372, 1, 1, 1, 1, 1,
-0.9634571, -0.02989584, -0.3067829, 1, 1, 1, 1, 1,
-0.9593608, -0.2482521, -1.67241, 1, 1, 1, 1, 1,
-0.95275, -0.1853508, -0.4747149, 1, 1, 1, 1, 1,
-0.9512612, 1.687673, 1.218646, 1, 1, 1, 1, 1,
-0.9446315, 1.554082, -0.1100279, 1, 1, 1, 1, 1,
-0.9443185, -0.8878961, -0.6707137, 0, 0, 1, 1, 1,
-0.943297, -2.199365, -3.205474, 1, 0, 0, 1, 1,
-0.9407641, 0.5482836, -0.3402703, 1, 0, 0, 1, 1,
-0.9392621, -0.977721, -4.081953, 1, 0, 0, 1, 1,
-0.9312291, -0.1461971, -3.046793, 1, 0, 0, 1, 1,
-0.930256, -2.430865, -2.2241, 1, 0, 0, 1, 1,
-0.9201373, -0.1848748, -1.270663, 0, 0, 0, 1, 1,
-0.9175422, -0.1203022, 0.1249418, 0, 0, 0, 1, 1,
-0.9174094, 0.5177739, -1.771636, 0, 0, 0, 1, 1,
-0.9167452, 1.320775, -1.101917, 0, 0, 0, 1, 1,
-0.9165601, 0.119246, -0.6601352, 0, 0, 0, 1, 1,
-0.9137577, 0.1809834, -1.663186, 0, 0, 0, 1, 1,
-0.9135615, 1.178385, -0.9423888, 0, 0, 0, 1, 1,
-0.9125243, -0.2910993, -0.5685513, 1, 1, 1, 1, 1,
-0.9106232, 0.01566318, -0.09389429, 1, 1, 1, 1, 1,
-0.9090562, -0.1474935, -1.886741, 1, 1, 1, 1, 1,
-0.907626, -0.06337125, -1.593774, 1, 1, 1, 1, 1,
-0.9074466, -0.2099674, -0.4005624, 1, 1, 1, 1, 1,
-0.9019924, 1.090301, -3.016427, 1, 1, 1, 1, 1,
-0.8954143, -0.5874159, -0.1581507, 1, 1, 1, 1, 1,
-0.8856456, -0.6910213, -1.78626, 1, 1, 1, 1, 1,
-0.8775333, -0.296268, -1.892047, 1, 1, 1, 1, 1,
-0.877124, 1.186223, -1.87102, 1, 1, 1, 1, 1,
-0.8756661, -0.03111554, -2.32968, 1, 1, 1, 1, 1,
-0.8754735, 0.9413233, -0.7362999, 1, 1, 1, 1, 1,
-0.8753703, 0.520636, -0.7279373, 1, 1, 1, 1, 1,
-0.8704822, 0.9859695, -0.6355048, 1, 1, 1, 1, 1,
-0.8669273, 0.5852075, -1.491344, 1, 1, 1, 1, 1,
-0.8663496, -2.201552, -3.610798, 0, 0, 1, 1, 1,
-0.8626922, 0.2335863, -2.718281, 1, 0, 0, 1, 1,
-0.860131, 1.289427, -1.172005, 1, 0, 0, 1, 1,
-0.8528409, 1.756724, 0.2308325, 1, 0, 0, 1, 1,
-0.8465504, -1.578343, -1.573572, 1, 0, 0, 1, 1,
-0.8460327, -0.4284761, -1.03351, 1, 0, 0, 1, 1,
-0.8456745, -0.1506283, -1.678705, 0, 0, 0, 1, 1,
-0.8370844, 0.4854045, -0.2762837, 0, 0, 0, 1, 1,
-0.8365006, 2.257468, 0.6627738, 0, 0, 0, 1, 1,
-0.8361834, 0.08315738, -1.385373, 0, 0, 0, 1, 1,
-0.8339915, 1.732651, -2.294403, 0, 0, 0, 1, 1,
-0.8318592, 0.3047365, -1.080277, 0, 0, 0, 1, 1,
-0.8251567, 0.08560254, -1.463796, 0, 0, 0, 1, 1,
-0.82021, -0.3720022, -1.349087, 1, 1, 1, 1, 1,
-0.8154714, -1.33805, -2.286629, 1, 1, 1, 1, 1,
-0.804594, -0.7446473, -2.45265, 1, 1, 1, 1, 1,
-0.8019001, 0.553324, -2.859007, 1, 1, 1, 1, 1,
-0.7987227, -0.3247766, 0.1234688, 1, 1, 1, 1, 1,
-0.7926182, 1.038684, -1.240703, 1, 1, 1, 1, 1,
-0.7874247, -0.555546, -0.8251338, 1, 1, 1, 1, 1,
-0.7719301, -0.6078514, -1.984007, 1, 1, 1, 1, 1,
-0.7691305, -0.03498036, -2.454316, 1, 1, 1, 1, 1,
-0.7679844, 1.164637, -0.422434, 1, 1, 1, 1, 1,
-0.7651704, -0.2438239, -1.906552, 1, 1, 1, 1, 1,
-0.7631331, -1.037511, -2.658849, 1, 1, 1, 1, 1,
-0.7558422, 0.5334273, -0.8220121, 1, 1, 1, 1, 1,
-0.7494775, -1.150225, -3.579176, 1, 1, 1, 1, 1,
-0.7452659, 0.3498527, 0.9175209, 1, 1, 1, 1, 1,
-0.7444888, -0.1933926, -1.823385, 0, 0, 1, 1, 1,
-0.7443587, 1.023076, -0.31959, 1, 0, 0, 1, 1,
-0.7434574, 1.966699, 0.679341, 1, 0, 0, 1, 1,
-0.7360256, 0.2750829, -2.51739, 1, 0, 0, 1, 1,
-0.7323568, 0.4597276, -0.5833594, 1, 0, 0, 1, 1,
-0.7301723, -1.576862, -2.061632, 1, 0, 0, 1, 1,
-0.7268764, -1.029798, -3.276902, 0, 0, 0, 1, 1,
-0.7171699, 1.916542, 0.450303, 0, 0, 0, 1, 1,
-0.7166832, 1.273173, -0.02095137, 0, 0, 0, 1, 1,
-0.7158614, 0.004702738, 2.587686, 0, 0, 0, 1, 1,
-0.7079208, 2.409137, -0.8493202, 0, 0, 0, 1, 1,
-0.7074004, 0.7999823, 0.2610506, 0, 0, 0, 1, 1,
-0.7019959, -0.08967073, -1.590808, 0, 0, 0, 1, 1,
-0.6967497, -0.7726578, -4.06891, 1, 1, 1, 1, 1,
-0.6958075, -2.151296, -3.030904, 1, 1, 1, 1, 1,
-0.6953316, -0.724766, -1.625401, 1, 1, 1, 1, 1,
-0.6919451, -0.4615593, -2.976155, 1, 1, 1, 1, 1,
-0.6910298, 0.9238771, 1.256166, 1, 1, 1, 1, 1,
-0.6904382, 1.0663, -1.640196, 1, 1, 1, 1, 1,
-0.6802815, -0.08234813, -1.90867, 1, 1, 1, 1, 1,
-0.6787794, -0.4172049, -1.730582, 1, 1, 1, 1, 1,
-0.6776382, -0.6925809, -2.700055, 1, 1, 1, 1, 1,
-0.6772998, -0.4589153, -2.3681, 1, 1, 1, 1, 1,
-0.6704371, -1.683424, -1.791534, 1, 1, 1, 1, 1,
-0.6688718, 0.5026312, -1.909302, 1, 1, 1, 1, 1,
-0.668027, -0.9612641, -1.918498, 1, 1, 1, 1, 1,
-0.6664278, -0.721307, -1.731489, 1, 1, 1, 1, 1,
-0.6662561, 0.9367849, -0.3788176, 1, 1, 1, 1, 1,
-0.6590505, -0.8968323, -0.982748, 0, 0, 1, 1, 1,
-0.6555532, 0.7560791, -1.743365, 1, 0, 0, 1, 1,
-0.6455659, -0.232515, -2.330283, 1, 0, 0, 1, 1,
-0.6455294, 1.250593, 0.7138611, 1, 0, 0, 1, 1,
-0.6452454, -1.480494, -2.044346, 1, 0, 0, 1, 1,
-0.6442508, 1.634119, -1.264437, 1, 0, 0, 1, 1,
-0.6433421, 0.8051437, -0.6588867, 0, 0, 0, 1, 1,
-0.6429431, -1.844293, -2.505582, 0, 0, 0, 1, 1,
-0.6380591, -0.72647, -1.664152, 0, 0, 0, 1, 1,
-0.6358402, -0.06201182, -1.75833, 0, 0, 0, 1, 1,
-0.6329595, 0.02177572, -1.428888, 0, 0, 0, 1, 1,
-0.6317335, -1.819076, -2.61849, 0, 0, 0, 1, 1,
-0.630387, 0.1254065, -1.438573, 0, 0, 0, 1, 1,
-0.629458, 0.4333011, -1.318794, 1, 1, 1, 1, 1,
-0.6183306, -0.9553491, -3.76669, 1, 1, 1, 1, 1,
-0.6071405, -1.224629, -1.564282, 1, 1, 1, 1, 1,
-0.606368, -0.09908967, -2.63494, 1, 1, 1, 1, 1,
-0.6059053, 0.7229158, -0.3071384, 1, 1, 1, 1, 1,
-0.6031148, 0.8596877, -2.324961, 1, 1, 1, 1, 1,
-0.5946652, -0.3172534, -1.173613, 1, 1, 1, 1, 1,
-0.5945694, 0.2858006, -2.084766, 1, 1, 1, 1, 1,
-0.5935232, -1.452912, -3.472986, 1, 1, 1, 1, 1,
-0.584196, 0.1588279, -2.315079, 1, 1, 1, 1, 1,
-0.5822067, 0.9518503, -0.4334897, 1, 1, 1, 1, 1,
-0.5754564, 1.441155, -2.275593, 1, 1, 1, 1, 1,
-0.5728284, 0.1581209, -1.351478, 1, 1, 1, 1, 1,
-0.571425, -0.5849683, -2.650583, 1, 1, 1, 1, 1,
-0.5697918, 0.9474924, 0.1490698, 1, 1, 1, 1, 1,
-0.5633807, 1.393541, -0.4781756, 0, 0, 1, 1, 1,
-0.5593892, 1.783548, -0.9671426, 1, 0, 0, 1, 1,
-0.5590311, 1.334298, -1.00836, 1, 0, 0, 1, 1,
-0.5563115, 0.8827585, -2.263571, 1, 0, 0, 1, 1,
-0.5562857, -0.4313464, -3.239074, 1, 0, 0, 1, 1,
-0.5556133, -1.497621, -1.3197, 1, 0, 0, 1, 1,
-0.5529189, -0.4740584, -0.4818235, 0, 0, 0, 1, 1,
-0.5365835, 1.020541, -0.1311289, 0, 0, 0, 1, 1,
-0.533339, -0.6948666, -2.787992, 0, 0, 0, 1, 1,
-0.5312171, -0.9650283, -4.244892, 0, 0, 0, 1, 1,
-0.5296694, 1.458972, 0.7982177, 0, 0, 0, 1, 1,
-0.5290122, -0.07129814, -3.444298, 0, 0, 0, 1, 1,
-0.5255447, -0.7655449, -2.861907, 0, 0, 0, 1, 1,
-0.5200701, 0.6924148, -0.6802516, 1, 1, 1, 1, 1,
-0.518375, 0.01816787, -2.604148, 1, 1, 1, 1, 1,
-0.5169865, -0.8490747, -1.517568, 1, 1, 1, 1, 1,
-0.5166738, -0.0470709, -2.630355, 1, 1, 1, 1, 1,
-0.5111554, 0.4134735, -1.327078, 1, 1, 1, 1, 1,
-0.5081615, 0.1970869, -1.907801, 1, 1, 1, 1, 1,
-0.5079788, 1.077801, -0.1683546, 1, 1, 1, 1, 1,
-0.5061732, -0.1821336, -1.592741, 1, 1, 1, 1, 1,
-0.5060499, -1.304187, -2.805358, 1, 1, 1, 1, 1,
-0.505227, 1.367623, -1.863126, 1, 1, 1, 1, 1,
-0.5000872, -1.383425, -3.094799, 1, 1, 1, 1, 1,
-0.4993264, -0.988568, -2.513676, 1, 1, 1, 1, 1,
-0.4976327, 0.8317772, 0.1769607, 1, 1, 1, 1, 1,
-0.4962372, -1.415601, -1.622127, 1, 1, 1, 1, 1,
-0.4903335, 1.188589, -0.3767761, 1, 1, 1, 1, 1,
-0.4876323, 0.912472, 0.3739947, 0, 0, 1, 1, 1,
-0.4870534, 0.4377888, -0.01378119, 1, 0, 0, 1, 1,
-0.4868351, -0.1369355, -3.019086, 1, 0, 0, 1, 1,
-0.4800458, -1.512653, -2.261522, 1, 0, 0, 1, 1,
-0.4800159, 1.107247, -0.784479, 1, 0, 0, 1, 1,
-0.4787884, 1.673395, 1.029274, 1, 0, 0, 1, 1,
-0.4731093, 1.078503, -0.8520877, 0, 0, 0, 1, 1,
-0.4722732, 0.8262956, -1.12235, 0, 0, 0, 1, 1,
-0.46361, 1.400515, 0.659764, 0, 0, 0, 1, 1,
-0.4535542, -1.063917, -3.739208, 0, 0, 0, 1, 1,
-0.4506366, -0.9566211, -4.614464, 0, 0, 0, 1, 1,
-0.4494579, 0.676938, 0.7983045, 0, 0, 0, 1, 1,
-0.4470751, 1.679642, -0.6638309, 0, 0, 0, 1, 1,
-0.4396077, -0.4266349, -1.622799, 1, 1, 1, 1, 1,
-0.4374876, 0.9923354, -1.358014, 1, 1, 1, 1, 1,
-0.4373368, -1.272759, -3.490934, 1, 1, 1, 1, 1,
-0.436835, 0.9373428, -1.188386, 1, 1, 1, 1, 1,
-0.4353781, 1.387762, 0.2393515, 1, 1, 1, 1, 1,
-0.4340997, 0.8533311, -2.432177, 1, 1, 1, 1, 1,
-0.4337308, -1.325802, -2.60924, 1, 1, 1, 1, 1,
-0.4336115, -0.8736503, -0.7338714, 1, 1, 1, 1, 1,
-0.4334192, 1.071167, 1.517473, 1, 1, 1, 1, 1,
-0.4315561, -0.5530002, -3.471881, 1, 1, 1, 1, 1,
-0.4302973, -0.1734122, -3.770668, 1, 1, 1, 1, 1,
-0.428291, -1.161516, -0.4429224, 1, 1, 1, 1, 1,
-0.427797, -0.2501645, -2.449468, 1, 1, 1, 1, 1,
-0.4260501, 0.3120075, -1.238228, 1, 1, 1, 1, 1,
-0.4239496, -1.132395, -2.836454, 1, 1, 1, 1, 1,
-0.4198989, 0.7158516, -1.205886, 0, 0, 1, 1, 1,
-0.4163083, 0.5546914, -0.8864076, 1, 0, 0, 1, 1,
-0.407745, 1.344743, -0.0505489, 1, 0, 0, 1, 1,
-0.4072318, 0.1802842, -0.5597098, 1, 0, 0, 1, 1,
-0.4071237, 0.5671864, 0.7559052, 1, 0, 0, 1, 1,
-0.4062884, 0.6480035, -1.336609, 1, 0, 0, 1, 1,
-0.4005559, -0.8496813, -2.167295, 0, 0, 0, 1, 1,
-0.3975308, 0.2937983, -0.5338623, 0, 0, 0, 1, 1,
-0.3962926, -0.4203717, -3.430766, 0, 0, 0, 1, 1,
-0.3940737, -0.4711515, -2.126934, 0, 0, 0, 1, 1,
-0.3893906, -1.460586, -2.13396, 0, 0, 0, 1, 1,
-0.3885727, 0.4829076, -0.5772377, 0, 0, 0, 1, 1,
-0.3845966, -2.904758, -2.852291, 0, 0, 0, 1, 1,
-0.3842832, 0.5594082, -0.9716355, 1, 1, 1, 1, 1,
-0.3826513, -0.4817726, -1.369902, 1, 1, 1, 1, 1,
-0.3817233, 0.7393789, -1.694134, 1, 1, 1, 1, 1,
-0.3798951, 0.5316807, -0.2671422, 1, 1, 1, 1, 1,
-0.3759447, -0.7500603, -1.907885, 1, 1, 1, 1, 1,
-0.3710574, -0.1712812, -2.90014, 1, 1, 1, 1, 1,
-0.3668373, -0.9977884, -3.328066, 1, 1, 1, 1, 1,
-0.3642179, 0.2410603, -1.17325, 1, 1, 1, 1, 1,
-0.3638236, 1.593283, -0.962687, 1, 1, 1, 1, 1,
-0.3626323, -0.7890971, -3.498863, 1, 1, 1, 1, 1,
-0.3552335, -0.5923948, -4.445174, 1, 1, 1, 1, 1,
-0.3541002, -0.5867885, -2.220319, 1, 1, 1, 1, 1,
-0.3486111, -0.843117, -4.987482, 1, 1, 1, 1, 1,
-0.3468093, -0.3652548, -2.972246, 1, 1, 1, 1, 1,
-0.3449648, -0.8436306, -2.32416, 1, 1, 1, 1, 1,
-0.3428089, -1.093285, -3.521402, 0, 0, 1, 1, 1,
-0.3427259, 0.4770591, 0.7218544, 1, 0, 0, 1, 1,
-0.3413532, -1.209705, -2.567455, 1, 0, 0, 1, 1,
-0.3316858, 2.820765, 0.9191796, 1, 0, 0, 1, 1,
-0.3315324, -0.4583992, -2.414807, 1, 0, 0, 1, 1,
-0.3263807, -0.6063914, -3.165374, 1, 0, 0, 1, 1,
-0.3240483, -0.1229504, -2.917998, 0, 0, 0, 1, 1,
-0.3230252, -0.5608793, -3.253766, 0, 0, 0, 1, 1,
-0.3173657, 1.45838, 0.3078521, 0, 0, 0, 1, 1,
-0.3131678, 0.2557197, -0.8926497, 0, 0, 0, 1, 1,
-0.3048047, 1.928997, -0.6468075, 0, 0, 0, 1, 1,
-0.2995218, -0.6956283, -3.832797, 0, 0, 0, 1, 1,
-0.2989302, -0.5367997, -2.152497, 0, 0, 0, 1, 1,
-0.2943311, -0.9591972, -1.259803, 1, 1, 1, 1, 1,
-0.2926439, 0.1812622, -0.736852, 1, 1, 1, 1, 1,
-0.2903808, -0.8241336, -1.865405, 1, 1, 1, 1, 1,
-0.289502, -0.5015077, -2.712128, 1, 1, 1, 1, 1,
-0.286902, -1.897354, -2.960184, 1, 1, 1, 1, 1,
-0.2826868, -2.205152, -2.173167, 1, 1, 1, 1, 1,
-0.2601842, 0.2427687, -0.9643651, 1, 1, 1, 1, 1,
-0.257545, 0.0003729412, -0.9192229, 1, 1, 1, 1, 1,
-0.2515264, 0.3170259, -0.7417253, 1, 1, 1, 1, 1,
-0.2485112, -1.491686, -3.326797, 1, 1, 1, 1, 1,
-0.2447921, 0.9812407, -0.2143935, 1, 1, 1, 1, 1,
-0.2402274, -0.8533317, -2.405302, 1, 1, 1, 1, 1,
-0.239722, -0.4561639, -1.710025, 1, 1, 1, 1, 1,
-0.2394021, 0.2963095, -0.5715095, 1, 1, 1, 1, 1,
-0.2383989, 0.3935205, -0.2755572, 1, 1, 1, 1, 1,
-0.2365548, 0.3695265, 0.6731548, 0, 0, 1, 1, 1,
-0.2358707, 1.125721, 1.155077, 1, 0, 0, 1, 1,
-0.2309815, 0.6841071, 0.5785808, 1, 0, 0, 1, 1,
-0.2290614, -0.9278245, -3.071164, 1, 0, 0, 1, 1,
-0.2236512, 0.9692285, -2.334813, 1, 0, 0, 1, 1,
-0.2234045, -1.644131, -0.9306265, 1, 0, 0, 1, 1,
-0.2175282, 0.6679541, -0.004966439, 0, 0, 0, 1, 1,
-0.2124245, 0.310813, 0.5042019, 0, 0, 0, 1, 1,
-0.2096687, 1.155168, 0.1708167, 0, 0, 0, 1, 1,
-0.2093979, 0.4302747, 0.5839595, 0, 0, 0, 1, 1,
-0.2074836, -1.52743, -1.597295, 0, 0, 0, 1, 1,
-0.2059371, -1.066293, -0.5054037, 0, 0, 0, 1, 1,
-0.1940666, -1.073235, -3.766937, 0, 0, 0, 1, 1,
-0.1894738, 0.3135574, -0.8880966, 1, 1, 1, 1, 1,
-0.188909, -0.8723671, -3.281566, 1, 1, 1, 1, 1,
-0.1879464, -0.7157188, -4.850302, 1, 1, 1, 1, 1,
-0.1868289, 1.067232, 0.9157136, 1, 1, 1, 1, 1,
-0.1845486, -1.520552, -2.43152, 1, 1, 1, 1, 1,
-0.1831205, 1.691395, -1.106195, 1, 1, 1, 1, 1,
-0.1825996, 0.5977305, 0.371702, 1, 1, 1, 1, 1,
-0.1820668, -1.399313, -3.051522, 1, 1, 1, 1, 1,
-0.1813218, 0.5707524, -3.100545, 1, 1, 1, 1, 1,
-0.1803729, -1.627643, -2.241486, 1, 1, 1, 1, 1,
-0.1750783, -1.233473, -2.529263, 1, 1, 1, 1, 1,
-0.171441, 0.2467959, 0.3641694, 1, 1, 1, 1, 1,
-0.1692848, -0.405302, -2.761255, 1, 1, 1, 1, 1,
-0.1677922, 0.1079292, 0.7884001, 1, 1, 1, 1, 1,
-0.1657431, 1.004713, 0.2705447, 1, 1, 1, 1, 1,
-0.1622816, -1.174893, -3.577309, 0, 0, 1, 1, 1,
-0.1616343, -1.250086, -2.659337, 1, 0, 0, 1, 1,
-0.1603303, 1.001264, -0.3780223, 1, 0, 0, 1, 1,
-0.1599377, -1.112858, -4.601997, 1, 0, 0, 1, 1,
-0.1588231, -1.543077, -2.048815, 1, 0, 0, 1, 1,
-0.1549568, 1.606417, 0.794795, 1, 0, 0, 1, 1,
-0.1525679, 0.6083412, -1.14843, 0, 0, 0, 1, 1,
-0.1523201, 1.409996, -0.4271623, 0, 0, 0, 1, 1,
-0.1512226, -0.2207679, -1.695294, 0, 0, 0, 1, 1,
-0.1511975, 0.1802885, 0.7852918, 0, 0, 0, 1, 1,
-0.1507659, 1.345497, 0.4972756, 0, 0, 0, 1, 1,
-0.1494575, 1.186758, 0.4415557, 0, 0, 0, 1, 1,
-0.148843, 1.215848, 1.238172, 0, 0, 0, 1, 1,
-0.1486197, 0.1785384, 0.2634022, 1, 1, 1, 1, 1,
-0.1388005, -1.177022, -1.743562, 1, 1, 1, 1, 1,
-0.1380936, -0.1347327, -0.1088574, 1, 1, 1, 1, 1,
-0.1314824, -0.7826681, -3.163511, 1, 1, 1, 1, 1,
-0.1294275, 1.629781, 1.23356, 1, 1, 1, 1, 1,
-0.1278906, -1.078311, -2.686888, 1, 1, 1, 1, 1,
-0.1266551, -0.5923776, -4.787515, 1, 1, 1, 1, 1,
-0.1264783, -0.7354182, -1.139026, 1, 1, 1, 1, 1,
-0.1237647, -0.6246946, -3.401638, 1, 1, 1, 1, 1,
-0.1232039, 0.1461906, -0.1913379, 1, 1, 1, 1, 1,
-0.1192346, -0.5939931, -2.732651, 1, 1, 1, 1, 1,
-0.1187203, 1.103001, 0.3011179, 1, 1, 1, 1, 1,
-0.1119787, 0.4189419, -1.159267, 1, 1, 1, 1, 1,
-0.1117028, 0.8267128, 1.502228, 1, 1, 1, 1, 1,
-0.1105054, 0.2170077, -0.2532507, 1, 1, 1, 1, 1,
-0.1100346, 1.554882, -0.7192456, 0, 0, 1, 1, 1,
-0.1098504, -0.25105, -2.304587, 1, 0, 0, 1, 1,
-0.1078214, -0.6203204, -2.761832, 1, 0, 0, 1, 1,
-0.1059214, 1.973238, -0.9847952, 1, 0, 0, 1, 1,
-0.1055317, -0.9644324, -2.114736, 1, 0, 0, 1, 1,
-0.1009573, 0.1058283, -0.0303123, 1, 0, 0, 1, 1,
-0.1006655, 0.6555307, 0.3047391, 0, 0, 0, 1, 1,
-0.09993964, -0.4045911, -3.762562, 0, 0, 0, 1, 1,
-0.09755689, -0.2258934, -2.329234, 0, 0, 0, 1, 1,
-0.09707012, -1.199503, -3.073601, 0, 0, 0, 1, 1,
-0.08733813, -0.5524906, -2.714049, 0, 0, 0, 1, 1,
-0.08675993, -0.7464645, -4.581375, 0, 0, 0, 1, 1,
-0.08426318, -2.065045, -3.784314, 0, 0, 0, 1, 1,
-0.08367951, -0.5492714, -2.866031, 1, 1, 1, 1, 1,
-0.08299889, 1.130135, -0.6360498, 1, 1, 1, 1, 1,
-0.08088483, -0.7713456, -4.479803, 1, 1, 1, 1, 1,
-0.07834841, -0.3306637, -2.516737, 1, 1, 1, 1, 1,
-0.07800429, -0.02158899, -2.322167, 1, 1, 1, 1, 1,
-0.07782991, 0.434242, -0.6497685, 1, 1, 1, 1, 1,
-0.07612029, 1.898656, -0.8306139, 1, 1, 1, 1, 1,
-0.07589617, -1.126243, -2.579959, 1, 1, 1, 1, 1,
-0.0756623, -1.626735, -2.769099, 1, 1, 1, 1, 1,
-0.07379109, -0.6905346, -2.857289, 1, 1, 1, 1, 1,
-0.07272567, -0.5649235, -3.50921, 1, 1, 1, 1, 1,
-0.06889328, 1.079029, -1.373291, 1, 1, 1, 1, 1,
-0.06555432, -0.8588392, -4.189331, 1, 1, 1, 1, 1,
-0.06463624, 0.1340694, -4.355555, 1, 1, 1, 1, 1,
-0.06204875, -1.445888, -4.275583, 1, 1, 1, 1, 1,
-0.06045855, 0.8525939, 0.9475688, 0, 0, 1, 1, 1,
-0.05754115, -0.472057, -3.890615, 1, 0, 0, 1, 1,
-0.04955488, 0.4363746, 0.6972467, 1, 0, 0, 1, 1,
-0.04827205, 0.5850273, -0.4196041, 1, 0, 0, 1, 1,
-0.04644837, -1.138478, -2.940155, 1, 0, 0, 1, 1,
-0.04490719, -0.80285, -3.589413, 1, 0, 0, 1, 1,
-0.04096485, -0.3970306, -1.198611, 0, 0, 0, 1, 1,
-0.03492768, -0.4702534, -3.824111, 0, 0, 0, 1, 1,
-0.02505683, 0.5536398, -0.4543948, 0, 0, 0, 1, 1,
-0.01807597, -1.111329, -2.791832, 0, 0, 0, 1, 1,
-0.01397633, 0.09877132, -2.101135, 0, 0, 0, 1, 1,
-0.01374268, 0.04550556, 0.1645829, 0, 0, 0, 1, 1,
-0.0108833, -2.234405, -2.722975, 0, 0, 0, 1, 1,
0.001715553, 0.5524375, 1.507078, 1, 1, 1, 1, 1,
0.008828746, -1.529492, 2.346788, 1, 1, 1, 1, 1,
0.01876719, 1.584731, 0.4689383, 1, 1, 1, 1, 1,
0.02101485, -0.8166776, 2.969527, 1, 1, 1, 1, 1,
0.02153559, 0.5030183, -1.479174, 1, 1, 1, 1, 1,
0.02185556, -0.5898156, 3.006151, 1, 1, 1, 1, 1,
0.02666633, 0.05473104, 0.9651244, 1, 1, 1, 1, 1,
0.0284577, 2.548378, -0.9474883, 1, 1, 1, 1, 1,
0.03453101, -1.610651, 4.024701, 1, 1, 1, 1, 1,
0.03741271, -0.06064769, 1.782365, 1, 1, 1, 1, 1,
0.04484345, 2.287211, -1.23436, 1, 1, 1, 1, 1,
0.04794215, -1.189065, 2.855088, 1, 1, 1, 1, 1,
0.04965023, -0.2354111, 3.370081, 1, 1, 1, 1, 1,
0.05279756, -1.195475, 3.601144, 1, 1, 1, 1, 1,
0.05467504, 1.190867, 1.832538, 1, 1, 1, 1, 1,
0.05470359, 0.1543026, -0.02918168, 0, 0, 1, 1, 1,
0.05516431, -1.02235, 1.965746, 1, 0, 0, 1, 1,
0.05561217, 2.21517, -1.424219, 1, 0, 0, 1, 1,
0.05700032, -0.2853542, 3.794742, 1, 0, 0, 1, 1,
0.05755696, -0.9584297, 4.234128, 1, 0, 0, 1, 1,
0.06993227, 0.05059331, 0.5957262, 1, 0, 0, 1, 1,
0.07191617, 0.7258334, 1.565924, 0, 0, 0, 1, 1,
0.07500887, -1.036997, 3.443592, 0, 0, 0, 1, 1,
0.07577428, 0.7738581, -0.4637094, 0, 0, 0, 1, 1,
0.07612481, 0.5986276, 0.7866767, 0, 0, 0, 1, 1,
0.07785983, -1.356987, 4.119277, 0, 0, 0, 1, 1,
0.08039773, 0.8950815, 0.0839987, 0, 0, 0, 1, 1,
0.08574624, 1.009996, -0.09926079, 0, 0, 0, 1, 1,
0.09090603, 0.6786708, 0.2908491, 1, 1, 1, 1, 1,
0.09315157, 0.1943321, -0.9485022, 1, 1, 1, 1, 1,
0.09369766, 1.271656, -0.1640199, 1, 1, 1, 1, 1,
0.09541378, 1.839879, -0.05430134, 1, 1, 1, 1, 1,
0.09799036, 0.06192691, 1.758954, 1, 1, 1, 1, 1,
0.09965552, 1.537319, 0.9463031, 1, 1, 1, 1, 1,
0.1010264, -1.655039, 4.840548, 1, 1, 1, 1, 1,
0.1040355, -0.2570629, 3.976067, 1, 1, 1, 1, 1,
0.1062825, -0.5202296, 2.065524, 1, 1, 1, 1, 1,
0.1116326, 0.04243029, 1.651504, 1, 1, 1, 1, 1,
0.1138306, -1.63734, 4.637214, 1, 1, 1, 1, 1,
0.1147303, -0.3034037, 3.014888, 1, 1, 1, 1, 1,
0.1201045, -0.4672759, 4.136192, 1, 1, 1, 1, 1,
0.1203495, -0.2022575, 3.453668, 1, 1, 1, 1, 1,
0.1288115, -0.898322, 4.982384, 1, 1, 1, 1, 1,
0.129723, -0.07128145, 2.884037, 0, 0, 1, 1, 1,
0.1345094, 1.559577, 0.07829446, 1, 0, 0, 1, 1,
0.1385503, 0.7358973, 0.231895, 1, 0, 0, 1, 1,
0.1423929, -1.713152, 3.439113, 1, 0, 0, 1, 1,
0.1424096, -2.011771, 2.222982, 1, 0, 0, 1, 1,
0.1428144, -0.3015417, 3.976282, 1, 0, 0, 1, 1,
0.1429695, -0.3482238, 2.237638, 0, 0, 0, 1, 1,
0.1454562, -0.06377134, 1.929909, 0, 0, 0, 1, 1,
0.1463252, 0.4420405, -0.6140028, 0, 0, 0, 1, 1,
0.1487415, 0.6756206, 0.7022591, 0, 0, 0, 1, 1,
0.1510802, 0.06667503, 0.705449, 0, 0, 0, 1, 1,
0.153246, -0.5120634, 3.184088, 0, 0, 0, 1, 1,
0.1550176, -0.458732, 2.684906, 0, 0, 0, 1, 1,
0.1559051, 1.357094, 0.008054449, 1, 1, 1, 1, 1,
0.1559102, -0.2506799, 1.812517, 1, 1, 1, 1, 1,
0.1669142, -0.4247676, 3.307432, 1, 1, 1, 1, 1,
0.167365, -0.5080985, 4.212017, 1, 1, 1, 1, 1,
0.169775, 0.9092634, -1.115724, 1, 1, 1, 1, 1,
0.1757848, -0.5931389, 2.994476, 1, 1, 1, 1, 1,
0.1773382, -1.414845, 1.545047, 1, 1, 1, 1, 1,
0.1846296, 0.1095973, 3.022727, 1, 1, 1, 1, 1,
0.1964013, -0.3619961, 3.647006, 1, 1, 1, 1, 1,
0.1992173, 0.935137, -0.4217864, 1, 1, 1, 1, 1,
0.202783, 1.97553, 0.6341122, 1, 1, 1, 1, 1,
0.2054341, 1.93291, 0.4933157, 1, 1, 1, 1, 1,
0.2076307, 1.802063, 1.070591, 1, 1, 1, 1, 1,
0.2077435, -0.9385571, 3.916195, 1, 1, 1, 1, 1,
0.2154674, -1.107475, 3.148768, 1, 1, 1, 1, 1,
0.2172995, -0.06963421, 1.050198, 0, 0, 1, 1, 1,
0.2179196, 0.8518057, -0.73436, 1, 0, 0, 1, 1,
0.221097, 1.146383, 0.7280987, 1, 0, 0, 1, 1,
0.222297, -0.5074455, 2.549024, 1, 0, 0, 1, 1,
0.2250719, 1.376142, -0.655531, 1, 0, 0, 1, 1,
0.2252861, 1.237034, -1.353132, 1, 0, 0, 1, 1,
0.2264808, 0.07549514, 0.7190933, 0, 0, 0, 1, 1,
0.2325803, 1.366714, -0.4957432, 0, 0, 0, 1, 1,
0.2334464, 1.244945, 0.9029185, 0, 0, 0, 1, 1,
0.2334912, 2.250639, 1.652187, 0, 0, 0, 1, 1,
0.2424885, 0.7985906, -0.4908545, 0, 0, 0, 1, 1,
0.2454547, 1.272443, -0.6278909, 0, 0, 0, 1, 1,
0.247485, -1.064603, 2.715176, 0, 0, 0, 1, 1,
0.2487257, 1.029814, 0.6968344, 1, 1, 1, 1, 1,
0.2493548, -0.2466327, 3.215842, 1, 1, 1, 1, 1,
0.2512156, -1.40696, 1.22528, 1, 1, 1, 1, 1,
0.2512977, -1.860975, 3.520823, 1, 1, 1, 1, 1,
0.2540315, 0.09434299, -0.6271667, 1, 1, 1, 1, 1,
0.2552043, -0.8679815, 3.855737, 1, 1, 1, 1, 1,
0.2563334, 0.9641061, 0.9672258, 1, 1, 1, 1, 1,
0.2596565, 1.036365, -0.8795868, 1, 1, 1, 1, 1,
0.2616399, 0.9456877, -0.5853335, 1, 1, 1, 1, 1,
0.2636194, -0.918797, 1.001679, 1, 1, 1, 1, 1,
0.2652486, -1.464474, 3.740936, 1, 1, 1, 1, 1,
0.2692189, -0.05786727, 2.289714, 1, 1, 1, 1, 1,
0.2693183, -1.042112, 3.58041, 1, 1, 1, 1, 1,
0.2720508, 0.3198418, 0.4203809, 1, 1, 1, 1, 1,
0.2795988, -1.614044, 2.926099, 1, 1, 1, 1, 1,
0.2800663, 0.6948406, -0.440375, 0, 0, 1, 1, 1,
0.2865443, -1.973332, 5.168751, 1, 0, 0, 1, 1,
0.288504, 0.963334, 0.4692622, 1, 0, 0, 1, 1,
0.2902873, -0.2729729, 2.251702, 1, 0, 0, 1, 1,
0.2913849, -0.9109582, 2.697896, 1, 0, 0, 1, 1,
0.294405, 0.4448921, 0.04315733, 1, 0, 0, 1, 1,
0.2970027, -1.21428, 1.393449, 0, 0, 0, 1, 1,
0.2976048, -0.6704931, 2.362071, 0, 0, 0, 1, 1,
0.2979394, -0.3240004, 2.022043, 0, 0, 0, 1, 1,
0.2985978, -0.8622497, 4.634742, 0, 0, 0, 1, 1,
0.3000323, -0.6893148, 2.393368, 0, 0, 0, 1, 1,
0.3010618, -0.2004171, 2.143008, 0, 0, 0, 1, 1,
0.303466, 1.961951, -0.08110777, 0, 0, 0, 1, 1,
0.3044771, 0.8625372, 0.4871338, 1, 1, 1, 1, 1,
0.3046894, 1.894282, 0.4452647, 1, 1, 1, 1, 1,
0.3051147, -1.881922, 1.954129, 1, 1, 1, 1, 1,
0.3145146, 1.054482, 0.8161079, 1, 1, 1, 1, 1,
0.3157405, -0.07850553, 2.612295, 1, 1, 1, 1, 1,
0.3159322, -1.95634, 2.535108, 1, 1, 1, 1, 1,
0.3168775, -1.203175, 2.633181, 1, 1, 1, 1, 1,
0.3195655, -0.8744575, 2.631524, 1, 1, 1, 1, 1,
0.3215347, 0.5418097, -0.5149738, 1, 1, 1, 1, 1,
0.3219848, -0.4002409, 3.24791, 1, 1, 1, 1, 1,
0.3236024, -0.2438567, 3.016842, 1, 1, 1, 1, 1,
0.3252644, 0.2646096, 0.4084947, 1, 1, 1, 1, 1,
0.3347986, -0.11871, 4.422544, 1, 1, 1, 1, 1,
0.3366693, -0.05462169, 2.837666, 1, 1, 1, 1, 1,
0.336841, 0.9855089, 0.3499409, 1, 1, 1, 1, 1,
0.337534, 1.2862, 0.7294566, 0, 0, 1, 1, 1,
0.3395884, 0.4643823, -1.309547, 1, 0, 0, 1, 1,
0.3401233, 2.983463, 0.8738632, 1, 0, 0, 1, 1,
0.3425286, 0.4918659, 1.925452, 1, 0, 0, 1, 1,
0.3458625, 0.08029383, 0.5574474, 1, 0, 0, 1, 1,
0.3502553, -0.4318736, 2.067607, 1, 0, 0, 1, 1,
0.3513574, 1.526103, 0.08727732, 0, 0, 0, 1, 1,
0.3559751, 0.248612, 1.016036, 0, 0, 0, 1, 1,
0.3578072, -0.1531116, 1.609789, 0, 0, 0, 1, 1,
0.3601991, -1.482642, 2.45587, 0, 0, 0, 1, 1,
0.3605161, -0.8196167, 2.174101, 0, 0, 0, 1, 1,
0.3613658, -1.063689, 3.666664, 0, 0, 0, 1, 1,
0.3624872, 0.562, 1.190782, 0, 0, 0, 1, 1,
0.3640811, 0.8444381, -0.1768134, 1, 1, 1, 1, 1,
0.3690138, -1.355573, 3.300485, 1, 1, 1, 1, 1,
0.3714753, -1.446964, 3.229047, 1, 1, 1, 1, 1,
0.3728002, 2.393569, -0.7600867, 1, 1, 1, 1, 1,
0.3803861, -1.279155, 4.031457, 1, 1, 1, 1, 1,
0.3813863, 0.06286689, 1.32134, 1, 1, 1, 1, 1,
0.3816784, 0.4637884, 0.4955835, 1, 1, 1, 1, 1,
0.3848118, 0.4403216, 1.985412, 1, 1, 1, 1, 1,
0.3861403, -0.9319939, 4.178076, 1, 1, 1, 1, 1,
0.3936861, 0.9740139, -0.5966648, 1, 1, 1, 1, 1,
0.3941784, -0.8854795, 2.466146, 1, 1, 1, 1, 1,
0.3991517, -0.7117325, 3.062321, 1, 1, 1, 1, 1,
0.4012031, 1.079225, 1.31473, 1, 1, 1, 1, 1,
0.403233, -2.059425, 3.323554, 1, 1, 1, 1, 1,
0.4056074, -0.8202458, 1.020827, 1, 1, 1, 1, 1,
0.4063706, -2.622698, 3.61995, 0, 0, 1, 1, 1,
0.4089223, 0.6845543, -0.3488942, 1, 0, 0, 1, 1,
0.4100486, -0.3938998, 2.87693, 1, 0, 0, 1, 1,
0.4129726, 0.3083178, -1.566583, 1, 0, 0, 1, 1,
0.4135432, 0.4161491, -0.1132775, 1, 0, 0, 1, 1,
0.4149431, 0.5342777, 2.250706, 1, 0, 0, 1, 1,
0.4150987, -1.05558, 2.599313, 0, 0, 0, 1, 1,
0.4231361, 1.944258, -0.6555947, 0, 0, 0, 1, 1,
0.4262482, 0.7936306, 1.918445, 0, 0, 0, 1, 1,
0.4271947, -0.1042844, 1.856001, 0, 0, 0, 1, 1,
0.4291096, -0.487498, 2.789709, 0, 0, 0, 1, 1,
0.4294365, -1.556184, 1.332594, 0, 0, 0, 1, 1,
0.4341591, -1.832094, 2.248592, 0, 0, 0, 1, 1,
0.4361196, 0.3303883, -0.2912345, 1, 1, 1, 1, 1,
0.4368034, 2.162738, 1.857666, 1, 1, 1, 1, 1,
0.4390692, 1.35666, 0.03570679, 1, 1, 1, 1, 1,
0.4400306, 0.5629742, 2.473205, 1, 1, 1, 1, 1,
0.4418244, -0.3771826, 2.564956, 1, 1, 1, 1, 1,
0.4452614, -0.6942641, 1.057575, 1, 1, 1, 1, 1,
0.4470273, -0.5624761, 3.918605, 1, 1, 1, 1, 1,
0.4522036, -1.634223, 1.805733, 1, 1, 1, 1, 1,
0.4568279, 0.04197288, 2.911774, 1, 1, 1, 1, 1,
0.4588923, 0.6378401, 1.817142, 1, 1, 1, 1, 1,
0.4620944, -0.9256445, 1.644251, 1, 1, 1, 1, 1,
0.4647523, -0.6209338, 4.181698, 1, 1, 1, 1, 1,
0.4662927, -1.612233, 3.918388, 1, 1, 1, 1, 1,
0.4701643, -1.150946, 2.379638, 1, 1, 1, 1, 1,
0.4702097, -0.7597311, 1.725436, 1, 1, 1, 1, 1,
0.4729562, -0.1782927, 2.603104, 0, 0, 1, 1, 1,
0.4758658, 0.1967439, 1.126801, 1, 0, 0, 1, 1,
0.4822652, 0.6920252, 1.570091, 1, 0, 0, 1, 1,
0.48377, -0.4840318, 1.518848, 1, 0, 0, 1, 1,
0.488507, -0.02383781, 0.8279625, 1, 0, 0, 1, 1,
0.4915343, -0.6692511, 2.492356, 1, 0, 0, 1, 1,
0.4917301, 1.983061, -2.886842, 0, 0, 0, 1, 1,
0.4970851, -0.3499064, 2.534311, 0, 0, 0, 1, 1,
0.4988245, -0.1581475, 2.64147, 0, 0, 0, 1, 1,
0.5014362, 0.7467382, 3.300662, 0, 0, 0, 1, 1,
0.5014374, 0.1107474, 2.260643, 0, 0, 0, 1, 1,
0.5023762, -0.788623, 3.78142, 0, 0, 0, 1, 1,
0.5078686, -1.775382, 4.07923, 0, 0, 0, 1, 1,
0.5079637, -0.01281856, 1.584338, 1, 1, 1, 1, 1,
0.5080695, 0.293125, 1.455942, 1, 1, 1, 1, 1,
0.5168487, -2.640666, 1.760654, 1, 1, 1, 1, 1,
0.5193358, 1.096389, 0.569288, 1, 1, 1, 1, 1,
0.5219061, 1.215687, -0.5444617, 1, 1, 1, 1, 1,
0.5224349, 0.5692943, 2.231207, 1, 1, 1, 1, 1,
0.5237471, -0.3589141, 1.094738, 1, 1, 1, 1, 1,
0.5341943, -0.6138778, 2.833744, 1, 1, 1, 1, 1,
0.5349094, 2.814857, -0.04319767, 1, 1, 1, 1, 1,
0.5387871, -0.4305601, 1.605245, 1, 1, 1, 1, 1,
0.5405089, 0.6549014, 0.1481516, 1, 1, 1, 1, 1,
0.5461773, -0.4828335, 1.367812, 1, 1, 1, 1, 1,
0.546627, 0.04979137, -0.8295318, 1, 1, 1, 1, 1,
0.5468682, 1.679354, -1.00208, 1, 1, 1, 1, 1,
0.5503488, -1.734509, 2.098826, 1, 1, 1, 1, 1,
0.5536265, -0.5627213, 0.977746, 0, 0, 1, 1, 1,
0.5569545, 0.5266801, 1.455727, 1, 0, 0, 1, 1,
0.5586407, -1.600384, 3.327303, 1, 0, 0, 1, 1,
0.5603938, 0.04951769, 1.31885, 1, 0, 0, 1, 1,
0.5610083, -1.633301, 2.09849, 1, 0, 0, 1, 1,
0.5631126, 0.2391946, 2.126237, 1, 0, 0, 1, 1,
0.5663539, -0.5288073, 1.875636, 0, 0, 0, 1, 1,
0.5671666, 2.627099, 0.420152, 0, 0, 0, 1, 1,
0.5755407, 0.09762009, 1.486758, 0, 0, 0, 1, 1,
0.5829534, 0.4599401, 0.7161517, 0, 0, 0, 1, 1,
0.5853836, -0.3873384, 1.076958, 0, 0, 0, 1, 1,
0.5866777, -1.855209, 4.195551, 0, 0, 0, 1, 1,
0.5867248, -1.323625, 2.550966, 0, 0, 0, 1, 1,
0.5869232, -0.288714, 5.216052, 1, 1, 1, 1, 1,
0.5877457, -1.474665, 3.716558, 1, 1, 1, 1, 1,
0.5888405, 1.03748, -0.9112465, 1, 1, 1, 1, 1,
0.5938578, 0.9047781, 0.4536661, 1, 1, 1, 1, 1,
0.5955164, -0.5401162, 3.237103, 1, 1, 1, 1, 1,
0.5963668, -0.8740579, 3.49103, 1, 1, 1, 1, 1,
0.596683, 0.04412322, 0.9587099, 1, 1, 1, 1, 1,
0.5980451, 0.2207382, 2.8089, 1, 1, 1, 1, 1,
0.5981221, 0.07930863, 0.06992, 1, 1, 1, 1, 1,
0.6012413, -0.2410396, 0.5587645, 1, 1, 1, 1, 1,
0.6166338, 1.743115, 0.269463, 1, 1, 1, 1, 1,
0.6176601, 0.7538149, -1.134781, 1, 1, 1, 1, 1,
0.6188724, -0.8007926, 2.708507, 1, 1, 1, 1, 1,
0.6207931, -0.8928857, 4.148716, 1, 1, 1, 1, 1,
0.6238177, -0.3481234, 4.025459, 1, 1, 1, 1, 1,
0.6238902, 0.6126551, 0.3848618, 0, 0, 1, 1, 1,
0.6305666, 0.6819625, 2.57625, 1, 0, 0, 1, 1,
0.6339366, -2.051671, 1.799509, 1, 0, 0, 1, 1,
0.6385576, -0.2738925, 2.701736, 1, 0, 0, 1, 1,
0.6401233, 0.9120122, -0.2659827, 1, 0, 0, 1, 1,
0.6428708, -1.993489, 3.591863, 1, 0, 0, 1, 1,
0.6449598, -0.2220339, 2.079656, 0, 0, 0, 1, 1,
0.6541403, 0.9409456, 0.3547779, 0, 0, 0, 1, 1,
0.6555911, 1.196501, -0.1018516, 0, 0, 0, 1, 1,
0.6582574, 0.5665745, -0.3325166, 0, 0, 0, 1, 1,
0.658802, -0.06335305, 1.590648, 0, 0, 0, 1, 1,
0.6615614, 1.899084, -0.1455454, 0, 0, 0, 1, 1,
0.6615633, -0.8156882, 2.257879, 0, 0, 0, 1, 1,
0.6674543, 0.01575026, 0.02194358, 1, 1, 1, 1, 1,
0.6698088, 0.2148175, 0.2325906, 1, 1, 1, 1, 1,
0.6778042, -0.7803782, 2.069176, 1, 1, 1, 1, 1,
0.6825799, -0.474337, 2.009587, 1, 1, 1, 1, 1,
0.6828156, -2.323127, 4.359714, 1, 1, 1, 1, 1,
0.6856576, 1.242192, 0.2072282, 1, 1, 1, 1, 1,
0.6927465, -1.405818, 2.221014, 1, 1, 1, 1, 1,
0.6996873, 0.6825098, 1.471764, 1, 1, 1, 1, 1,
0.7015321, -0.1136605, 2.045561, 1, 1, 1, 1, 1,
0.7045643, -0.2692946, 0.976263, 1, 1, 1, 1, 1,
0.7077423, 1.084137, 0.3756399, 1, 1, 1, 1, 1,
0.7080224, 0.03734096, 2.807426, 1, 1, 1, 1, 1,
0.7141693, 0.7441478, 0.6485972, 1, 1, 1, 1, 1,
0.7189936, 0.3740951, 0.6271076, 1, 1, 1, 1, 1,
0.719757, 1.969129, 1.868354, 1, 1, 1, 1, 1,
0.7221212, 0.797106, 0.5815586, 0, 0, 1, 1, 1,
0.7276037, -0.8510865, 2.287649, 1, 0, 0, 1, 1,
0.7332274, 0.7516234, -1.925779, 1, 0, 0, 1, 1,
0.7404411, -0.3548748, 1.916526, 1, 0, 0, 1, 1,
0.7436401, -1.192432, 2.411087, 1, 0, 0, 1, 1,
0.7482366, 0.2020378, -0.4864237, 1, 0, 0, 1, 1,
0.752482, -0.828119, 1.915966, 0, 0, 0, 1, 1,
0.7535012, -0.08520798, 1.869929, 0, 0, 0, 1, 1,
0.7596833, -0.4185449, 0.02586882, 0, 0, 0, 1, 1,
0.7598321, 0.6807803, 1.938234, 0, 0, 0, 1, 1,
0.7624943, 0.41173, 0.1458691, 0, 0, 0, 1, 1,
0.7630607, -1.121425, 4.160325, 0, 0, 0, 1, 1,
0.7665983, -1.26711, 2.386312, 0, 0, 0, 1, 1,
0.7709836, -0.4617715, 2.223666, 1, 1, 1, 1, 1,
0.7729165, -0.8395641, 2.134972, 1, 1, 1, 1, 1,
0.7759048, -0.1517519, 1.3602, 1, 1, 1, 1, 1,
0.7875862, 0.7922941, -0.6356461, 1, 1, 1, 1, 1,
0.7937349, -0.1827705, 2.17479, 1, 1, 1, 1, 1,
0.7938417, 0.4109869, -1.021848, 1, 1, 1, 1, 1,
0.7946454, 0.9397979, 1.39321, 1, 1, 1, 1, 1,
0.7961561, -0.4146492, 1.414092, 1, 1, 1, 1, 1,
0.7966007, 1.201674, 1.100454, 1, 1, 1, 1, 1,
0.804955, 0.8657475, 1.194116, 1, 1, 1, 1, 1,
0.807417, -0.4112439, 0.8743815, 1, 1, 1, 1, 1,
0.8084864, 0.2768656, 0.6185662, 1, 1, 1, 1, 1,
0.8117991, 0.668565, 2.82359, 1, 1, 1, 1, 1,
0.812946, 0.999873, 1.399562, 1, 1, 1, 1, 1,
0.8174944, 0.1914741, 0.7743095, 1, 1, 1, 1, 1,
0.8202539, 0.219165, 2.573699, 0, 0, 1, 1, 1,
0.8228508, -1.197812, 0.81988, 1, 0, 0, 1, 1,
0.8283838, -1.143102, 3.569552, 1, 0, 0, 1, 1,
0.8298436, 0.6709656, 1.09292, 1, 0, 0, 1, 1,
0.83376, 0.2136131, 1.742827, 1, 0, 0, 1, 1,
0.837999, 0.0370126, 3.044953, 1, 0, 0, 1, 1,
0.8402889, -0.2281827, 1.227286, 0, 0, 0, 1, 1,
0.8404051, 1.625357, 0.6177987, 0, 0, 0, 1, 1,
0.8471736, -1.234824, 1.841809, 0, 0, 0, 1, 1,
0.8476655, -1.375434, 2.226629, 0, 0, 0, 1, 1,
0.8481225, 0.7731729, 2.179887, 0, 0, 0, 1, 1,
0.8535438, 0.09625486, 1.423519, 0, 0, 0, 1, 1,
0.8573565, -0.884289, 2.422098, 0, 0, 0, 1, 1,
0.8733355, 0.8006607, 0.6297281, 1, 1, 1, 1, 1,
0.8738814, 0.116106, 0.03325692, 1, 1, 1, 1, 1,
0.8780238, 1.672313, -0.5758253, 1, 1, 1, 1, 1,
0.8878265, -2.624423, 3.404106, 1, 1, 1, 1, 1,
0.8889523, -1.131696, 3.522627, 1, 1, 1, 1, 1,
0.8967209, -0.02876441, -0.3963794, 1, 1, 1, 1, 1,
0.8992811, 0.658997, 0.7672166, 1, 1, 1, 1, 1,
0.9000018, -1.470043, 1.52037, 1, 1, 1, 1, 1,
0.901507, -1.240136, 1.441472, 1, 1, 1, 1, 1,
0.906495, -0.1714342, 2.765449, 1, 1, 1, 1, 1,
0.9072611, 1.029081, 1.352387, 1, 1, 1, 1, 1,
0.9097864, 0.2767723, -0.3818927, 1, 1, 1, 1, 1,
0.9098942, 1.416654, -1.051193, 1, 1, 1, 1, 1,
0.9224002, -0.5738934, 2.732663, 1, 1, 1, 1, 1,
0.9242008, 0.6396339, 0.3116755, 1, 1, 1, 1, 1,
0.9243336, -0.2668106, 1.518587, 0, 0, 1, 1, 1,
0.9263086, 0.03084806, 2.070832, 1, 0, 0, 1, 1,
0.9375134, 2.540178, 0.7546312, 1, 0, 0, 1, 1,
0.9594287, 0.1459083, 2.499507, 1, 0, 0, 1, 1,
0.9641206, 1.235458, 0.2509374, 1, 0, 0, 1, 1,
0.9775693, -0.6073991, 1.507438, 1, 0, 0, 1, 1,
0.9856951, -0.4595289, 0.3781619, 0, 0, 0, 1, 1,
0.9898363, -0.420072, 2.927016, 0, 0, 0, 1, 1,
0.9960461, -1.190244, 1.699753, 0, 0, 0, 1, 1,
0.9991887, 0.6470761, 2.251736, 0, 0, 0, 1, 1,
1.000291, -0.5348602, 2.532193, 0, 0, 0, 1, 1,
1.00577, -0.2298484, 1.726729, 0, 0, 0, 1, 1,
1.006879, 0.9444438, -0.2368252, 0, 0, 0, 1, 1,
1.008036, 0.1323803, 2.10916, 1, 1, 1, 1, 1,
1.010212, 0.5803053, 1.866033, 1, 1, 1, 1, 1,
1.010314, 0.6887199, 0.3323594, 1, 1, 1, 1, 1,
1.012174, 1.962237, 1.999918, 1, 1, 1, 1, 1,
1.01243, -0.7489001, 2.376087, 1, 1, 1, 1, 1,
1.019259, 0.8218646, 3.730741, 1, 1, 1, 1, 1,
1.020177, 0.7115975, 0.5806363, 1, 1, 1, 1, 1,
1.022629, -0.1883145, 3.047257, 1, 1, 1, 1, 1,
1.027196, -0.767877, 0.804975, 1, 1, 1, 1, 1,
1.030534, 1.875632, 1.516821, 1, 1, 1, 1, 1,
1.033251, 0.4795618, 2.020234, 1, 1, 1, 1, 1,
1.036516, -0.3595876, 1.44121, 1, 1, 1, 1, 1,
1.039534, -0.7653469, 1.523545, 1, 1, 1, 1, 1,
1.044095, -0.09592844, 0.8354, 1, 1, 1, 1, 1,
1.05, 0.9379158, 0.9513271, 1, 1, 1, 1, 1,
1.050675, 0.9756088, 0.8230683, 0, 0, 1, 1, 1,
1.063001, -0.03675102, 2.449531, 1, 0, 0, 1, 1,
1.063978, -2.126599, 1.681784, 1, 0, 0, 1, 1,
1.064726, -0.3304539, 1.633484, 1, 0, 0, 1, 1,
1.067567, -0.5073804, 3.225041, 1, 0, 0, 1, 1,
1.072812, 0.07514051, 1.820282, 1, 0, 0, 1, 1,
1.078068, -0.2716267, 1.981505, 0, 0, 0, 1, 1,
1.082312, -0.2791955, 2.364905, 0, 0, 0, 1, 1,
1.092908, -1.314211, 2.543871, 0, 0, 0, 1, 1,
1.09362, -0.3389339, 2.769209, 0, 0, 0, 1, 1,
1.095877, 0.5908023, 2.358832, 0, 0, 0, 1, 1,
1.103598, 0.4897822, 0.3455523, 0, 0, 0, 1, 1,
1.104196, -1.097003, 3.075188, 0, 0, 0, 1, 1,
1.105403, -1.389283, 1.997811, 1, 1, 1, 1, 1,
1.110731, -1.127825, 2.367682, 1, 1, 1, 1, 1,
1.119075, -1.046039, 2.548027, 1, 1, 1, 1, 1,
1.120251, 0.2065991, 1.695134, 1, 1, 1, 1, 1,
1.125603, -1.255031, 3.474578, 1, 1, 1, 1, 1,
1.130297, 0.4515573, 0.1704231, 1, 1, 1, 1, 1,
1.131437, 1.455874, -0.4348134, 1, 1, 1, 1, 1,
1.13311, 0.9711305, -0.204773, 1, 1, 1, 1, 1,
1.141704, 1.044838, 0.9274219, 1, 1, 1, 1, 1,
1.142245, -0.09098262, 2.263137, 1, 1, 1, 1, 1,
1.146178, 0.7680724, 1.791306, 1, 1, 1, 1, 1,
1.147867, -0.0281566, 0.5027612, 1, 1, 1, 1, 1,
1.154048, -0.6167087, 2.375687, 1, 1, 1, 1, 1,
1.154846, 0.4731384, 1.604021, 1, 1, 1, 1, 1,
1.155174, 0.9102764, 0.675842, 1, 1, 1, 1, 1,
1.156091, -1.324882, 0.925408, 0, 0, 1, 1, 1,
1.163347, -1.517288, 3.310655, 1, 0, 0, 1, 1,
1.163608, 0.02076437, 1.032087, 1, 0, 0, 1, 1,
1.169166, 0.5568284, 1.096893, 1, 0, 0, 1, 1,
1.173702, 1.47175, 0.02412182, 1, 0, 0, 1, 1,
1.175946, -0.5015501, 3.372516, 1, 0, 0, 1, 1,
1.179684, -1.10531, 1.929627, 0, 0, 0, 1, 1,
1.185848, 1.029746, 0.05647623, 0, 0, 0, 1, 1,
1.192397, 0.6522152, 0.5098544, 0, 0, 0, 1, 1,
1.194539, 0.8888536, -0.2463252, 0, 0, 0, 1, 1,
1.198134, 0.3366228, 3.707622, 0, 0, 0, 1, 1,
1.198911, -1.466683, 2.899292, 0, 0, 0, 1, 1,
1.200846, 0.7585725, 1.947776, 0, 0, 0, 1, 1,
1.203253, -0.869792, 2.849324, 1, 1, 1, 1, 1,
1.210764, 0.1153019, 1.84004, 1, 1, 1, 1, 1,
1.212531, -0.9496843, 1.678392, 1, 1, 1, 1, 1,
1.225686, -0.257674, 2.859632, 1, 1, 1, 1, 1,
1.22604, 0.4530942, 2.788889, 1, 1, 1, 1, 1,
1.23112, 1.546751, -0.1666399, 1, 1, 1, 1, 1,
1.231623, -0.5796564, 2.61572, 1, 1, 1, 1, 1,
1.234133, 0.3858383, -0.03956784, 1, 1, 1, 1, 1,
1.241575, 0.2051703, 1.194743, 1, 1, 1, 1, 1,
1.242139, 1.08986, 1.82269, 1, 1, 1, 1, 1,
1.249359, 2.03429, 0.4502178, 1, 1, 1, 1, 1,
1.26539, 0.1672995, 0.9616183, 1, 1, 1, 1, 1,
1.273723, 0.03936003, 2.261044, 1, 1, 1, 1, 1,
1.296098, 0.3707385, 0.4481431, 1, 1, 1, 1, 1,
1.297786, -0.7634778, 3.009228, 1, 1, 1, 1, 1,
1.299117, -0.5838257, 0.5801374, 0, 0, 1, 1, 1,
1.300298, 1.008438, 1.112308, 1, 0, 0, 1, 1,
1.301853, 0.4481843, 0.6148786, 1, 0, 0, 1, 1,
1.309874, 0.17896, 0.2658574, 1, 0, 0, 1, 1,
1.31125, 1.195655, 2.745295, 1, 0, 0, 1, 1,
1.313453, -0.9742507, 0.438918, 1, 0, 0, 1, 1,
1.326206, -0.4435942, 2.426512, 0, 0, 0, 1, 1,
1.327952, 2.227587, -0.4353914, 0, 0, 0, 1, 1,
1.335013, 0.1231288, 0.8432693, 0, 0, 0, 1, 1,
1.341434, -0.9758586, 2.386266, 0, 0, 0, 1, 1,
1.343102, 0.3069846, 2.001961, 0, 0, 0, 1, 1,
1.345952, -2.154706, 4.148872, 0, 0, 0, 1, 1,
1.35033, -0.5217251, 2.345578, 0, 0, 0, 1, 1,
1.353495, -0.3924391, 2.127736, 1, 1, 1, 1, 1,
1.355285, 0.8503786, -0.1862086, 1, 1, 1, 1, 1,
1.356382, 1.736801, 2.803701, 1, 1, 1, 1, 1,
1.363579, -1.674816, 1.875947, 1, 1, 1, 1, 1,
1.368371, 1.284218, -1.013875, 1, 1, 1, 1, 1,
1.375301, -0.4838824, 1.544697, 1, 1, 1, 1, 1,
1.376014, 2.587641, 1.407109, 1, 1, 1, 1, 1,
1.38728, 1.419001, 1.866853, 1, 1, 1, 1, 1,
1.391751, -0.9171571, -0.281204, 1, 1, 1, 1, 1,
1.40599, -0.02421769, 2.491814, 1, 1, 1, 1, 1,
1.41188, -0.6235736, 0.8011174, 1, 1, 1, 1, 1,
1.413639, -0.7589235, 2.390344, 1, 1, 1, 1, 1,
1.414206, 0.2296207, 0.1221513, 1, 1, 1, 1, 1,
1.417382, 0.2981475, 2.887543, 1, 1, 1, 1, 1,
1.424939, -0.1769543, 1.239811, 1, 1, 1, 1, 1,
1.428388, -1.305878, 2.587168, 0, 0, 1, 1, 1,
1.431125, -0.8926097, 1.172732, 1, 0, 0, 1, 1,
1.441077, 0.854657, -0.5041211, 1, 0, 0, 1, 1,
1.441952, 0.3397616, 1.420783, 1, 0, 0, 1, 1,
1.448714, 0.8653219, 0.6550415, 1, 0, 0, 1, 1,
1.451991, -0.8888736, -0.6827791, 1, 0, 0, 1, 1,
1.464031, 0.02270049, 1.470855, 0, 0, 0, 1, 1,
1.471127, 1.094233, 1.199813, 0, 0, 0, 1, 1,
1.484388, 0.1378057, 3.669774, 0, 0, 0, 1, 1,
1.484562, 0.9513191, 0.8574769, 0, 0, 0, 1, 1,
1.488244, 0.004862686, 2.11203, 0, 0, 0, 1, 1,
1.489165, 0.70319, 0.8384103, 0, 0, 0, 1, 1,
1.500992, 0.3349463, 1.472627, 0, 0, 0, 1, 1,
1.506256, 1.007689, 1.789725, 1, 1, 1, 1, 1,
1.510929, 0.3246467, 1.905072, 1, 1, 1, 1, 1,
1.516731, -0.01798481, 1.545245, 1, 1, 1, 1, 1,
1.524118, -0.02051839, 1.475022, 1, 1, 1, 1, 1,
1.540999, -0.2966641, 2.305106, 1, 1, 1, 1, 1,
1.563794, 0.6457372, 1.382029, 1, 1, 1, 1, 1,
1.565229, 1.075157, -1.576679, 1, 1, 1, 1, 1,
1.57474, -0.1044207, 1.351587, 1, 1, 1, 1, 1,
1.583561, -1.254289, 0.1789661, 1, 1, 1, 1, 1,
1.585202, -0.2012633, 1.121058, 1, 1, 1, 1, 1,
1.598476, -0.1807747, 1.578482, 1, 1, 1, 1, 1,
1.599364, 0.2265686, 2.8254, 1, 1, 1, 1, 1,
1.61307, 1.813276, 3.235697, 1, 1, 1, 1, 1,
1.646072, -0.6099607, 1.290533, 1, 1, 1, 1, 1,
1.670602, 0.9834477, 0.7751621, 1, 1, 1, 1, 1,
1.697102, 0.2158553, 0.6932496, 0, 0, 1, 1, 1,
1.704445, -0.6918998, 2.738258, 1, 0, 0, 1, 1,
1.706934, -0.1510217, 0.7007558, 1, 0, 0, 1, 1,
1.745325, -1.176965, 1.200791, 1, 0, 0, 1, 1,
1.746637, -0.9077287, 2.704492, 1, 0, 0, 1, 1,
1.772586, 0.2482575, 0.579504, 1, 0, 0, 1, 1,
1.778009, 0.5362455, 0.7000003, 0, 0, 0, 1, 1,
1.782611, 0.6850578, 2.663539, 0, 0, 0, 1, 1,
1.818925, -1.188537, 3.828265, 0, 0, 0, 1, 1,
1.840721, -0.8304934, 1.712257, 0, 0, 0, 1, 1,
1.841803, -0.6187879, 3.289668, 0, 0, 0, 1, 1,
1.873734, 0.5507558, 0.6217064, 0, 0, 0, 1, 1,
1.873887, 0.1720125, 1.037593, 0, 0, 0, 1, 1,
1.878567, 1.227859, 1.067683, 1, 1, 1, 1, 1,
1.902115, 2.21034, 1.124396, 1, 1, 1, 1, 1,
1.940882, -0.6717016, 3.200811, 1, 1, 1, 1, 1,
1.942622, 0.6638275, 2.964944, 1, 1, 1, 1, 1,
1.947709, -1.251426, 0.9497781, 1, 1, 1, 1, 1,
1.97352, 0.3445982, 2.67286, 1, 1, 1, 1, 1,
2.003181, -0.159238, 1.871138, 1, 1, 1, 1, 1,
2.021862, 1.220398, 1.792568, 1, 1, 1, 1, 1,
2.029435, -0.1402101, 2.670887, 1, 1, 1, 1, 1,
2.03614, 1.46331, 1.639671, 1, 1, 1, 1, 1,
2.068471, -1.148286, 1.785483, 1, 1, 1, 1, 1,
2.088978, -0.8238611, 2.031842, 1, 1, 1, 1, 1,
2.1111, 1.562544, 1.029866, 1, 1, 1, 1, 1,
2.143201, -1.19279, 1.490914, 1, 1, 1, 1, 1,
2.147206, -0.3897695, 0.03632913, 1, 1, 1, 1, 1,
2.159398, 0.1439439, 2.017497, 0, 0, 1, 1, 1,
2.171727, 0.6364062, 1.108903, 1, 0, 0, 1, 1,
2.196295, -1.013248, 0.6772853, 1, 0, 0, 1, 1,
2.211865, -1.210917, 1.622168, 1, 0, 0, 1, 1,
2.234968, 0.01575865, 2.166893, 1, 0, 0, 1, 1,
2.297865, -1.258843, 1.706535, 1, 0, 0, 1, 1,
2.316532, -0.5567198, -0.4145394, 0, 0, 0, 1, 1,
2.367986, 0.4290564, 1.665185, 0, 0, 0, 1, 1,
2.411082, -1.241433, 2.620801, 0, 0, 0, 1, 1,
2.415561, 0.08812163, 1.509963, 0, 0, 0, 1, 1,
2.43666, -0.4794375, 2.411129, 0, 0, 0, 1, 1,
2.44668, 0.4316854, 0.6840231, 0, 0, 0, 1, 1,
2.473559, 1.086145, 1.094871, 0, 0, 0, 1, 1,
2.527514, 1.199412, 0.7550005, 1, 1, 1, 1, 1,
2.56179, 0.2198964, 1.963921, 1, 1, 1, 1, 1,
2.677925, 0.5032683, 1.072786, 1, 1, 1, 1, 1,
2.681923, 0.03158621, 0.9611263, 1, 1, 1, 1, 1,
2.693225, -0.7487648, 1.972588, 1, 1, 1, 1, 1,
2.720083, 0.3429332, 2.133889, 1, 1, 1, 1, 1,
2.731312, -0.4208593, 1.337205, 1, 1, 1, 1, 1
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
var radius = 9.289582;
var distance = 32.62926;
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
mvMatrix.translate( 0.1348035, -0.4627527, -0.1142852 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.62926);
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
