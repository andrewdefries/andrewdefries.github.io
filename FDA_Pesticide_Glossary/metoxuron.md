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
-3.041043, 0.1246713, -1.219921, 1, 0, 0, 1,
-2.702534, 0.4153011, -0.6994637, 1, 0.007843138, 0, 1,
-2.668696, -0.6997258, -1.736899, 1, 0.01176471, 0, 1,
-2.630996, -0.2089084, -2.75689, 1, 0.01960784, 0, 1,
-2.551015, 0.8499872, -1.381004, 1, 0.02352941, 0, 1,
-2.452204, -0.2507537, -1.810689, 1, 0.03137255, 0, 1,
-2.444084, -0.7659927, -3.383481, 1, 0.03529412, 0, 1,
-2.356092, -0.6174897, -0.5875767, 1, 0.04313726, 0, 1,
-2.347314, -0.2829569, -1.009558, 1, 0.04705882, 0, 1,
-2.341725, 1.181759, -0.3829274, 1, 0.05490196, 0, 1,
-2.295432, -0.7112545, -1.436286, 1, 0.05882353, 0, 1,
-2.287076, -1.161439, -1.670837, 1, 0.06666667, 0, 1,
-2.242285, -0.6252087, -1.900494, 1, 0.07058824, 0, 1,
-2.229639, 0.3126493, -2.609242, 1, 0.07843138, 0, 1,
-2.220509, -0.26657, -2.081566, 1, 0.08235294, 0, 1,
-2.202132, 1.537363, -1.353993, 1, 0.09019608, 0, 1,
-2.180477, -0.7133511, -2.523086, 1, 0.09411765, 0, 1,
-2.176715, -1.061891, -1.539248, 1, 0.1019608, 0, 1,
-2.138872, 1.113184, -0.2503216, 1, 0.1098039, 0, 1,
-2.136082, -0.2038881, -1.883974, 1, 0.1137255, 0, 1,
-2.126177, 1.557371, -1.51601, 1, 0.1215686, 0, 1,
-2.114144, -1.127297, -1.262423, 1, 0.1254902, 0, 1,
-2.092597, 0.7680039, -0.7186069, 1, 0.1333333, 0, 1,
-2.081314, 0.1737082, -2.837101, 1, 0.1372549, 0, 1,
-2.076843, 0.7824535, -1.085777, 1, 0.145098, 0, 1,
-2.072704, -0.1877693, -2.036869, 1, 0.1490196, 0, 1,
-2.051583, -1.746534, -0.8404282, 1, 0.1568628, 0, 1,
-2.038087, -0.007583766, -1.716432, 1, 0.1607843, 0, 1,
-2.020873, -1.59106, -2.538063, 1, 0.1686275, 0, 1,
-2.018182, 0.7231503, -1.740786, 1, 0.172549, 0, 1,
-1.994845, 0.03297317, -2.632736, 1, 0.1803922, 0, 1,
-1.985655, 0.2755708, -1.586265, 1, 0.1843137, 0, 1,
-1.982579, 0.9655288, -0.7187683, 1, 0.1921569, 0, 1,
-1.977999, 0.5777553, -2.656178, 1, 0.1960784, 0, 1,
-1.960877, 2.170024, 0.4891569, 1, 0.2039216, 0, 1,
-1.958183, -1.090772, -1.730549, 1, 0.2117647, 0, 1,
-1.943659, -0.6703265, -1.906225, 1, 0.2156863, 0, 1,
-1.934638, 1.263417, -1.516577, 1, 0.2235294, 0, 1,
-1.933661, 0.5078804, -1.78463, 1, 0.227451, 0, 1,
-1.921875, 2.526034, -0.5474988, 1, 0.2352941, 0, 1,
-1.86809, -0.3570948, -2.727947, 1, 0.2392157, 0, 1,
-1.867201, -0.1826628, -2.29884, 1, 0.2470588, 0, 1,
-1.8396, -0.305993, -1.999908, 1, 0.2509804, 0, 1,
-1.824169, 0.7291015, -1.855475, 1, 0.2588235, 0, 1,
-1.823063, -0.3696505, -1.538022, 1, 0.2627451, 0, 1,
-1.807946, -0.7366102, -1.603267, 1, 0.2705882, 0, 1,
-1.805312, -1.731814, -2.396028, 1, 0.2745098, 0, 1,
-1.782389, 0.551716, -1.591482, 1, 0.282353, 0, 1,
-1.773799, 2.4435, -0.794425, 1, 0.2862745, 0, 1,
-1.745927, -0.658213, -1.362997, 1, 0.2941177, 0, 1,
-1.74354, -1.026602, -1.725274, 1, 0.3019608, 0, 1,
-1.702018, -0.01886864, -1.402677, 1, 0.3058824, 0, 1,
-1.689175, -0.8077744, -1.388893, 1, 0.3137255, 0, 1,
-1.685269, 1.681828, -0.7413567, 1, 0.3176471, 0, 1,
-1.68468, 0.3866182, -1.471278, 1, 0.3254902, 0, 1,
-1.67603, 0.9484175, -0.8038601, 1, 0.3294118, 0, 1,
-1.658795, -0.650439, -1.138771, 1, 0.3372549, 0, 1,
-1.637305, -1.006744, -2.684173, 1, 0.3411765, 0, 1,
-1.620301, -0.3278735, -2.73503, 1, 0.3490196, 0, 1,
-1.612332, -0.221806, -1.693818, 1, 0.3529412, 0, 1,
-1.594497, -1.345795, -3.917542, 1, 0.3607843, 0, 1,
-1.586168, -0.5097561, -2.709359, 1, 0.3647059, 0, 1,
-1.583649, -0.2411678, -1.0429, 1, 0.372549, 0, 1,
-1.572612, -1.638788, -3.328114, 1, 0.3764706, 0, 1,
-1.562202, -0.7574489, -2.67066, 1, 0.3843137, 0, 1,
-1.555352, 0.01328837, -0.9150981, 1, 0.3882353, 0, 1,
-1.554748, 0.6714222, -0.4183198, 1, 0.3960784, 0, 1,
-1.549972, -0.0620507, 0.1913893, 1, 0.4039216, 0, 1,
-1.535566, -0.4066694, -2.571136, 1, 0.4078431, 0, 1,
-1.532634, 0.5907025, -1.382296, 1, 0.4156863, 0, 1,
-1.522888, 0.4510634, -1.026779, 1, 0.4196078, 0, 1,
-1.522572, 1.333084, 0.526008, 1, 0.427451, 0, 1,
-1.51789, -0.5863816, -1.697815, 1, 0.4313726, 0, 1,
-1.515605, -0.9017723, -1.965284, 1, 0.4392157, 0, 1,
-1.492942, 2.868348, 0.6372151, 1, 0.4431373, 0, 1,
-1.483516, 0.1185391, -3.139788, 1, 0.4509804, 0, 1,
-1.471048, 1.279704, -1.066308, 1, 0.454902, 0, 1,
-1.46984, -0.5123371, -2.061922, 1, 0.4627451, 0, 1,
-1.467194, -1.485494, -3.238542, 1, 0.4666667, 0, 1,
-1.463124, -0.8927292, -4.329168, 1, 0.4745098, 0, 1,
-1.462074, 0.8892879, -2.76308, 1, 0.4784314, 0, 1,
-1.454636, 0.1872116, -0.9374419, 1, 0.4862745, 0, 1,
-1.447736, -0.4017955, -1.854693, 1, 0.4901961, 0, 1,
-1.442401, 2.10013, 0.1371581, 1, 0.4980392, 0, 1,
-1.428307, 0.5371256, -0.9121219, 1, 0.5058824, 0, 1,
-1.420746, 1.372417, -0.2245566, 1, 0.509804, 0, 1,
-1.41922, 0.253851, -0.8301574, 1, 0.5176471, 0, 1,
-1.419082, -1.868849, -0.6864576, 1, 0.5215687, 0, 1,
-1.417801, -0.754595, -1.880905, 1, 0.5294118, 0, 1,
-1.414991, 0.09526174, -1.215599, 1, 0.5333334, 0, 1,
-1.399994, 0.4724884, -1.037077, 1, 0.5411765, 0, 1,
-1.397896, -0.910486, -3.453194, 1, 0.5450981, 0, 1,
-1.39079, -1.681341, -2.485124, 1, 0.5529412, 0, 1,
-1.383856, 0.5966079, -2.377747, 1, 0.5568628, 0, 1,
-1.382872, 1.293381, -1.12846, 1, 0.5647059, 0, 1,
-1.353459, -0.8134405, -0.678611, 1, 0.5686275, 0, 1,
-1.351925, 0.1364035, -1.507974, 1, 0.5764706, 0, 1,
-1.346328, 0.1796339, 0.1254752, 1, 0.5803922, 0, 1,
-1.342571, -0.1008691, -2.084275, 1, 0.5882353, 0, 1,
-1.337008, 0.3270541, -0.9887465, 1, 0.5921569, 0, 1,
-1.32244, 0.9967193, -0.5625919, 1, 0.6, 0, 1,
-1.320919, 1.632046, -0.274028, 1, 0.6078432, 0, 1,
-1.30873, -0.3215744, -1.830517, 1, 0.6117647, 0, 1,
-1.305458, -0.9386446, -2.61708, 1, 0.6196079, 0, 1,
-1.30442, -0.9508003, -2.882802, 1, 0.6235294, 0, 1,
-1.298263, -0.2572836, -0.6382142, 1, 0.6313726, 0, 1,
-1.293842, 0.9387652, -0.4276568, 1, 0.6352941, 0, 1,
-1.29264, 1.975698, 0.2849958, 1, 0.6431373, 0, 1,
-1.287303, -1.406517, -2.714414, 1, 0.6470588, 0, 1,
-1.27972, 0.2696385, -1.96258, 1, 0.654902, 0, 1,
-1.277939, 1.836088, -0.4922721, 1, 0.6588235, 0, 1,
-1.272329, 0.2196658, -2.354575, 1, 0.6666667, 0, 1,
-1.249893, 0.3363413, -1.863775, 1, 0.6705883, 0, 1,
-1.247606, 1.706218, -0.623875, 1, 0.6784314, 0, 1,
-1.242461, -0.02557268, -1.025465, 1, 0.682353, 0, 1,
-1.235914, -0.4951649, -1.53954, 1, 0.6901961, 0, 1,
-1.235092, -0.5927978, -1.938063, 1, 0.6941177, 0, 1,
-1.231393, 0.6317475, -1.086239, 1, 0.7019608, 0, 1,
-1.228536, 0.7947287, -0.9629023, 1, 0.7098039, 0, 1,
-1.214291, -0.757471, -1.584074, 1, 0.7137255, 0, 1,
-1.209806, 0.4265133, -2.798852, 1, 0.7215686, 0, 1,
-1.207439, 0.6143806, -0.9053544, 1, 0.7254902, 0, 1,
-1.205162, -0.1541143, -2.402337, 1, 0.7333333, 0, 1,
-1.199604, 1.038491, -1.80314, 1, 0.7372549, 0, 1,
-1.198941, -0.3904315, -1.796553, 1, 0.7450981, 0, 1,
-1.196988, -1.083109, -3.314854, 1, 0.7490196, 0, 1,
-1.181626, 0.7744094, 0.6626786, 1, 0.7568628, 0, 1,
-1.177845, 1.059233, 0.1246934, 1, 0.7607843, 0, 1,
-1.177474, -0.2469653, -1.394841, 1, 0.7686275, 0, 1,
-1.171116, 1.866986, -1.05431, 1, 0.772549, 0, 1,
-1.166258, -1.767837, -3.473344, 1, 0.7803922, 0, 1,
-1.164814, 0.4815112, 0.2251378, 1, 0.7843137, 0, 1,
-1.162466, -0.5771462, -2.635907, 1, 0.7921569, 0, 1,
-1.158452, -0.02300303, -2.223412, 1, 0.7960784, 0, 1,
-1.150761, -0.07764757, -1.184041, 1, 0.8039216, 0, 1,
-1.14481, -0.3886467, -3.55901, 1, 0.8117647, 0, 1,
-1.138964, -1.517425, -4.465368, 1, 0.8156863, 0, 1,
-1.138858, 2.171193, -0.3096488, 1, 0.8235294, 0, 1,
-1.134682, 1.378121, -0.08643444, 1, 0.827451, 0, 1,
-1.132244, 0.3303326, -1.031325, 1, 0.8352941, 0, 1,
-1.130294, -0.6738051, -2.591717, 1, 0.8392157, 0, 1,
-1.125613, -0.4209141, -1.65272, 1, 0.8470588, 0, 1,
-1.099474, 0.760788, -0.3159711, 1, 0.8509804, 0, 1,
-1.086544, -1.089508, -3.252055, 1, 0.8588235, 0, 1,
-1.082301, 0.1682586, -0.9880624, 1, 0.8627451, 0, 1,
-1.078334, 0.6184064, -2.058805, 1, 0.8705882, 0, 1,
-1.0778, 0.08568621, -1.666624, 1, 0.8745098, 0, 1,
-1.076254, -0.4030584, -2.164015, 1, 0.8823529, 0, 1,
-1.071035, -0.7733167, -1.4963, 1, 0.8862745, 0, 1,
-1.069347, 0.231371, -2.035198, 1, 0.8941177, 0, 1,
-1.062513, 0.06368846, -1.337583, 1, 0.8980392, 0, 1,
-1.052998, -3.44178, -1.239581, 1, 0.9058824, 0, 1,
-1.048981, -0.5904513, -3.002523, 1, 0.9137255, 0, 1,
-1.045716, -0.1930849, -2.041143, 1, 0.9176471, 0, 1,
-1.044538, -0.2915759, -0.6097893, 1, 0.9254902, 0, 1,
-1.043911, 0.8555223, -2.245812, 1, 0.9294118, 0, 1,
-1.043074, 0.9459122, -1.859545, 1, 0.9372549, 0, 1,
-1.041666, 0.3821916, -2.417343, 1, 0.9411765, 0, 1,
-1.032769, -0.7999397, -0.6439986, 1, 0.9490196, 0, 1,
-1.029634, -0.9401374, -2.62802, 1, 0.9529412, 0, 1,
-1.029341, 1.70277, -1.616466, 1, 0.9607843, 0, 1,
-1.029115, 1.010461, 1.234637, 1, 0.9647059, 0, 1,
-1.010464, -0.4901276, -3.470546, 1, 0.972549, 0, 1,
-1.00888, -0.5290068, -1.889783, 1, 0.9764706, 0, 1,
-1.005024, -2.611748, -3.315523, 1, 0.9843137, 0, 1,
-1.004234, 1.081043, -2.339539, 1, 0.9882353, 0, 1,
-1.003606, 0.1867331, -2.149628, 1, 0.9960784, 0, 1,
-1.002207, 1.166308, 0.7665686, 0.9960784, 1, 0, 1,
-0.9972293, 1.110451, -0.884368, 0.9921569, 1, 0, 1,
-0.9897321, 1.958677, -0.01456534, 0.9843137, 1, 0, 1,
-0.9872674, -0.535502, -0.149269, 0.9803922, 1, 0, 1,
-0.9871806, 1.590146, -1.548406, 0.972549, 1, 0, 1,
-0.9767309, 0.2015941, -0.4703738, 0.9686275, 1, 0, 1,
-0.9762629, -0.496361, -1.213009, 0.9607843, 1, 0, 1,
-0.9732966, -0.2268666, -0.8534094, 0.9568627, 1, 0, 1,
-0.9668112, 0.7149844, -0.6214802, 0.9490196, 1, 0, 1,
-0.9657013, 0.8055563, -1.505119, 0.945098, 1, 0, 1,
-0.9626284, 1.137119, 1.530999, 0.9372549, 1, 0, 1,
-0.9579119, -0.3849441, -2.429614, 0.9333333, 1, 0, 1,
-0.9573703, -0.4290881, -1.572817, 0.9254902, 1, 0, 1,
-0.9454208, 0.8579428, -0.4774763, 0.9215686, 1, 0, 1,
-0.9390374, 0.7178183, -0.7955882, 0.9137255, 1, 0, 1,
-0.9368454, -0.7482033, -2.083921, 0.9098039, 1, 0, 1,
-0.935679, 0.4407085, 0.1669797, 0.9019608, 1, 0, 1,
-0.9306769, -0.09374055, -0.9754451, 0.8941177, 1, 0, 1,
-0.9213518, 0.4054164, -2.108738, 0.8901961, 1, 0, 1,
-0.9152841, 0.8627239, -1.548768, 0.8823529, 1, 0, 1,
-0.9145142, 2.403212, 0.3785843, 0.8784314, 1, 0, 1,
-0.9134422, 0.09078804, -2.444953, 0.8705882, 1, 0, 1,
-0.9091553, 0.0006029863, 0.2817068, 0.8666667, 1, 0, 1,
-0.9047218, -0.3076862, -1.144801, 0.8588235, 1, 0, 1,
-0.9038439, 0.9191342, 1.465432, 0.854902, 1, 0, 1,
-0.901021, 0.6018136, -2.670445, 0.8470588, 1, 0, 1,
-0.9009573, -0.3122832, -1.146601, 0.8431373, 1, 0, 1,
-0.9002393, 0.988171, -1.831017, 0.8352941, 1, 0, 1,
-0.8945798, -1.159157, -2.184299, 0.8313726, 1, 0, 1,
-0.892763, -0.2614373, -1.145677, 0.8235294, 1, 0, 1,
-0.8918236, 0.1562784, -0.8706489, 0.8196079, 1, 0, 1,
-0.8901979, -0.9323013, -1.951451, 0.8117647, 1, 0, 1,
-0.8871523, 0.7150218, -0.8332203, 0.8078431, 1, 0, 1,
-0.8869179, -0.7843095, -2.407369, 0.8, 1, 0, 1,
-0.8843099, 1.014241, -3.011209, 0.7921569, 1, 0, 1,
-0.8841366, -1.113677, -4.02028, 0.7882353, 1, 0, 1,
-0.875743, -0.8228867, -1.033747, 0.7803922, 1, 0, 1,
-0.8713275, -0.3034055, -2.503705, 0.7764706, 1, 0, 1,
-0.8704901, 0.4845448, -1.319699, 0.7686275, 1, 0, 1,
-0.8683105, -0.6389001, -1.016023, 0.7647059, 1, 0, 1,
-0.8681347, -0.7519966, -2.479037, 0.7568628, 1, 0, 1,
-0.8679764, -0.03566023, -0.9535779, 0.7529412, 1, 0, 1,
-0.8635001, 0.973218, -1.704669, 0.7450981, 1, 0, 1,
-0.8629351, 1.111914, -1.107088, 0.7411765, 1, 0, 1,
-0.8618985, -0.7577131, -3.242967, 0.7333333, 1, 0, 1,
-0.8533182, 1.651922, -0.9898843, 0.7294118, 1, 0, 1,
-0.852724, -0.1054749, -2.261491, 0.7215686, 1, 0, 1,
-0.8455005, -1.180245, -3.961486, 0.7176471, 1, 0, 1,
-0.8421691, 1.319058, -2.560555, 0.7098039, 1, 0, 1,
-0.8384817, -0.8444207, -0.6770942, 0.7058824, 1, 0, 1,
-0.8375304, 1.031988, 0.1540414, 0.6980392, 1, 0, 1,
-0.8352016, -0.3935067, -2.321258, 0.6901961, 1, 0, 1,
-0.831257, 1.956765, -0.6227792, 0.6862745, 1, 0, 1,
-0.8277918, 0.3894224, -0.3918169, 0.6784314, 1, 0, 1,
-0.826888, -0.3940974, -1.323089, 0.6745098, 1, 0, 1,
-0.8226588, 2.102232, -0.1471203, 0.6666667, 1, 0, 1,
-0.8202999, -1.3628, -1.424758, 0.6627451, 1, 0, 1,
-0.8137272, -0.0376833, -3.130041, 0.654902, 1, 0, 1,
-0.8133546, 0.22452, -0.5409662, 0.6509804, 1, 0, 1,
-0.8122808, -0.2714985, 0.5132352, 0.6431373, 1, 0, 1,
-0.8122166, -0.9731644, -2.982284, 0.6392157, 1, 0, 1,
-0.8059966, 0.08321699, -0.9601974, 0.6313726, 1, 0, 1,
-0.8050579, -1.216971, -1.876409, 0.627451, 1, 0, 1,
-0.7986208, 0.3457296, -0.5472336, 0.6196079, 1, 0, 1,
-0.7958236, -0.6319489, -3.487854, 0.6156863, 1, 0, 1,
-0.7945474, 0.3813677, -1.057144, 0.6078432, 1, 0, 1,
-0.7906553, -0.7804912, -3.771424, 0.6039216, 1, 0, 1,
-0.7891502, 1.052435, 0.4228239, 0.5960785, 1, 0, 1,
-0.7859314, -0.8775135, -3.05398, 0.5882353, 1, 0, 1,
-0.7856393, 0.4443682, -1.6068, 0.5843138, 1, 0, 1,
-0.7830154, -1.552604, -0.8974285, 0.5764706, 1, 0, 1,
-0.7801219, 0.7059148, -2.572628, 0.572549, 1, 0, 1,
-0.7789686, -0.7014659, -1.053948, 0.5647059, 1, 0, 1,
-0.7731049, -0.9256267, -1.981218, 0.5607843, 1, 0, 1,
-0.7660173, -0.9324812, -0.8374159, 0.5529412, 1, 0, 1,
-0.7659441, -1.6223, -1.983584, 0.5490196, 1, 0, 1,
-0.7654171, -0.07503738, -1.092295, 0.5411765, 1, 0, 1,
-0.761647, -0.1104157, -1.67613, 0.5372549, 1, 0, 1,
-0.7600226, -2.640762, -2.395703, 0.5294118, 1, 0, 1,
-0.7596537, -1.21151, -0.480547, 0.5254902, 1, 0, 1,
-0.7587104, 0.7631171, -0.9894251, 0.5176471, 1, 0, 1,
-0.7451884, 0.1012961, -0.7349115, 0.5137255, 1, 0, 1,
-0.744849, 0.6965935, -0.4644127, 0.5058824, 1, 0, 1,
-0.7448439, -0.01256734, -0.5899135, 0.5019608, 1, 0, 1,
-0.7427649, -1.296479, -3.549613, 0.4941176, 1, 0, 1,
-0.7424755, 1.603793, -0.3364874, 0.4862745, 1, 0, 1,
-0.7423857, 1.066565, 0.4233927, 0.4823529, 1, 0, 1,
-0.7411281, 1.672256, -1.073743, 0.4745098, 1, 0, 1,
-0.7395142, 2.453008, 1.719758, 0.4705882, 1, 0, 1,
-0.7387241, 0.8073034, -0.9909467, 0.4627451, 1, 0, 1,
-0.735381, 0.6312339, -0.7241127, 0.4588235, 1, 0, 1,
-0.734273, 1.38044, -0.1734174, 0.4509804, 1, 0, 1,
-0.7330783, -0.1985465, -2.726038, 0.4470588, 1, 0, 1,
-0.7330682, -1.818434, -1.681751, 0.4392157, 1, 0, 1,
-0.7295275, 0.4751982, -2.223053, 0.4352941, 1, 0, 1,
-0.7293086, 0.2316692, 0.2560146, 0.427451, 1, 0, 1,
-0.7277886, -0.2791084, -2.265052, 0.4235294, 1, 0, 1,
-0.7184382, 0.08256652, -0.9372954, 0.4156863, 1, 0, 1,
-0.7170386, 0.7198406, -0.8600997, 0.4117647, 1, 0, 1,
-0.7133523, 0.2305475, -2.1767, 0.4039216, 1, 0, 1,
-0.709215, -0.8164625, -0.7004373, 0.3960784, 1, 0, 1,
-0.7050363, 0.001099615, -1.307651, 0.3921569, 1, 0, 1,
-0.7042694, 0.5601209, -1.592615, 0.3843137, 1, 0, 1,
-0.7025054, 0.08509601, -2.128252, 0.3803922, 1, 0, 1,
-0.698743, -1.248907, -3.801515, 0.372549, 1, 0, 1,
-0.6979685, 0.5472238, 0.5347602, 0.3686275, 1, 0, 1,
-0.69754, -1.11852, -1.799634, 0.3607843, 1, 0, 1,
-0.694027, -0.6461278, -2.001166, 0.3568628, 1, 0, 1,
-0.68884, -0.265378, -2.801764, 0.3490196, 1, 0, 1,
-0.6876146, -0.8366602, -2.676933, 0.345098, 1, 0, 1,
-0.6843541, 0.1999228, 0.7678345, 0.3372549, 1, 0, 1,
-0.6840497, 1.850886, -0.4070663, 0.3333333, 1, 0, 1,
-0.6797532, 1.731284, 0.527313, 0.3254902, 1, 0, 1,
-0.6779233, 0.2369371, -2.218681, 0.3215686, 1, 0, 1,
-0.6756751, -1.938565, -3.528991, 0.3137255, 1, 0, 1,
-0.6742303, -0.974404, -1.95773, 0.3098039, 1, 0, 1,
-0.6680202, 0.3215297, -0.8480462, 0.3019608, 1, 0, 1,
-0.6674866, 0.783577, -0.6670926, 0.2941177, 1, 0, 1,
-0.665554, -1.566044, -1.152069, 0.2901961, 1, 0, 1,
-0.6654788, 0.9971536, 0.9895052, 0.282353, 1, 0, 1,
-0.6619807, 0.5209052, -1.029086, 0.2784314, 1, 0, 1,
-0.6599536, -1.245669, -1.580885, 0.2705882, 1, 0, 1,
-0.6598082, 2.71772, -0.2730443, 0.2666667, 1, 0, 1,
-0.6593986, 0.5267012, -1.034696, 0.2588235, 1, 0, 1,
-0.6586024, 1.004662, -2.091446, 0.254902, 1, 0, 1,
-0.6572428, -2.224032, -4.368845, 0.2470588, 1, 0, 1,
-0.646706, -0.707392, -3.405974, 0.2431373, 1, 0, 1,
-0.6449634, 0.44231, -0.5445537, 0.2352941, 1, 0, 1,
-0.6447909, -1.66243, -3.167683, 0.2313726, 1, 0, 1,
-0.644173, -0.5388182, -0.7981669, 0.2235294, 1, 0, 1,
-0.6418195, 1.213143, 0.4315755, 0.2196078, 1, 0, 1,
-0.6364282, -1.190708, -2.280423, 0.2117647, 1, 0, 1,
-0.6363847, -0.0413744, -1.4417, 0.2078431, 1, 0, 1,
-0.6343524, 0.3332875, -0.984377, 0.2, 1, 0, 1,
-0.6331919, 0.7674772, -1.178709, 0.1921569, 1, 0, 1,
-0.6288344, -1.804645, -3.362828, 0.1882353, 1, 0, 1,
-0.6263121, -0.5516459, -2.008467, 0.1803922, 1, 0, 1,
-0.6247559, -1.305077, -2.928292, 0.1764706, 1, 0, 1,
-0.6228456, -1.500056, -1.766312, 0.1686275, 1, 0, 1,
-0.617918, 0.09852175, 0.03305632, 0.1647059, 1, 0, 1,
-0.6162994, 0.326349, 0.2085752, 0.1568628, 1, 0, 1,
-0.615136, 0.4182639, 1.246652, 0.1529412, 1, 0, 1,
-0.6061864, -0.3524359, -2.260385, 0.145098, 1, 0, 1,
-0.6038748, 0.3011904, -1.384817, 0.1411765, 1, 0, 1,
-0.5990269, -1.956871, -3.653697, 0.1333333, 1, 0, 1,
-0.5936015, -0.4308902, -2.811433, 0.1294118, 1, 0, 1,
-0.5818093, 1.327098, 0.9084383, 0.1215686, 1, 0, 1,
-0.5783543, 1.382325, -2.88841, 0.1176471, 1, 0, 1,
-0.5745002, -1.24777, -3.082745, 0.1098039, 1, 0, 1,
-0.573976, -1.137382, -2.455808, 0.1058824, 1, 0, 1,
-0.5734043, -1.021939, -2.676666, 0.09803922, 1, 0, 1,
-0.5690993, -0.2714422, -0.6081128, 0.09019608, 1, 0, 1,
-0.5639121, 1.509863, -0.3335883, 0.08627451, 1, 0, 1,
-0.561579, 0.3761411, -0.7993337, 0.07843138, 1, 0, 1,
-0.5590296, 0.5277224, -0.9255422, 0.07450981, 1, 0, 1,
-0.5499859, 0.9549174, -2.303981, 0.06666667, 1, 0, 1,
-0.5497979, -1.199187, -4.011835, 0.0627451, 1, 0, 1,
-0.549592, -1.203001, -2.220217, 0.05490196, 1, 0, 1,
-0.5472775, 0.5590481, -0.9389338, 0.05098039, 1, 0, 1,
-0.5392827, 0.1716734, 0.253026, 0.04313726, 1, 0, 1,
-0.5352896, -0.7321944, -2.086719, 0.03921569, 1, 0, 1,
-0.5341135, -0.01667266, -1.5944, 0.03137255, 1, 0, 1,
-0.5334443, 1.518914, 0.6236145, 0.02745098, 1, 0, 1,
-0.5271137, 0.5531768, -1.118363, 0.01960784, 1, 0, 1,
-0.5147715, -0.2778397, -2.413156, 0.01568628, 1, 0, 1,
-0.5141262, 1.11814, -0.4676899, 0.007843138, 1, 0, 1,
-0.5112236, -0.9639977, -3.633977, 0.003921569, 1, 0, 1,
-0.5068653, -0.194059, -2.833894, 0, 1, 0.003921569, 1,
-0.5046023, -1.098703, -3.001933, 0, 1, 0.01176471, 1,
-0.4993295, -1.110597, -2.294575, 0, 1, 0.01568628, 1,
-0.4964282, 0.4503481, -1.774296, 0, 1, 0.02352941, 1,
-0.4863709, -0.284859, -2.710174, 0, 1, 0.02745098, 1,
-0.4830349, -1.079138, -3.559528, 0, 1, 0.03529412, 1,
-0.4780708, 0.4084345, -0.8260273, 0, 1, 0.03921569, 1,
-0.4668039, 2.446563, -0.1907021, 0, 1, 0.04705882, 1,
-0.4647109, -0.191453, -1.783157, 0, 1, 0.05098039, 1,
-0.4639525, -0.131575, -1.618219, 0, 1, 0.05882353, 1,
-0.4603066, 1.945521, 0.6287531, 0, 1, 0.0627451, 1,
-0.4563856, 1.666914, -0.8558729, 0, 1, 0.07058824, 1,
-0.4546701, 1.118425, -0.03939667, 0, 1, 0.07450981, 1,
-0.4527029, -1.744797, -2.847925, 0, 1, 0.08235294, 1,
-0.4411801, -0.01255761, -0.8983282, 0, 1, 0.08627451, 1,
-0.4390425, -0.6094686, -3.091269, 0, 1, 0.09411765, 1,
-0.4360768, 0.3980112, 0.4588372, 0, 1, 0.1019608, 1,
-0.4360721, 0.8281496, -0.6889841, 0, 1, 0.1058824, 1,
-0.431305, 0.08627211, -3.153864, 0, 1, 0.1137255, 1,
-0.4298761, -1.033914, -1.707592, 0, 1, 0.1176471, 1,
-0.4287225, -1.575023, -3.795855, 0, 1, 0.1254902, 1,
-0.4237682, -0.09844693, -1.819569, 0, 1, 0.1294118, 1,
-0.4231625, 0.07509504, -1.188995, 0, 1, 0.1372549, 1,
-0.4193486, 1.415067, -0.6780292, 0, 1, 0.1411765, 1,
-0.4183818, -1.183218, -3.611569, 0, 1, 0.1490196, 1,
-0.4118981, 1.071287, -0.6973363, 0, 1, 0.1529412, 1,
-0.4079177, -0.2412502, -0.6140049, 0, 1, 0.1607843, 1,
-0.4063183, 2.045586, 1.473778, 0, 1, 0.1647059, 1,
-0.4034503, -0.3321508, -2.086488, 0, 1, 0.172549, 1,
-0.4020959, -0.7171997, -2.671906, 0, 1, 0.1764706, 1,
-0.4015193, -0.8467818, -1.728715, 0, 1, 0.1843137, 1,
-0.4009509, 0.1696416, -1.786113, 0, 1, 0.1882353, 1,
-0.3990138, 2.128287, -0.4511182, 0, 1, 0.1960784, 1,
-0.3976148, 0.6257178, -1.796153, 0, 1, 0.2039216, 1,
-0.3956486, 0.1780174, 0.3684111, 0, 1, 0.2078431, 1,
-0.3954885, -0.2325709, 0.04643229, 0, 1, 0.2156863, 1,
-0.3953755, -0.08608764, -0.5216259, 0, 1, 0.2196078, 1,
-0.3895148, 1.855698, 1.145497, 0, 1, 0.227451, 1,
-0.3731588, 0.1920462, 0.6996493, 0, 1, 0.2313726, 1,
-0.3723835, 0.8614743, 0.7420366, 0, 1, 0.2392157, 1,
-0.3708445, 0.485425, -1.71019, 0, 1, 0.2431373, 1,
-0.364228, 0.1575681, -0.9869688, 0, 1, 0.2509804, 1,
-0.3605373, -0.2253373, -1.917512, 0, 1, 0.254902, 1,
-0.3592687, -0.7107021, -1.954578, 0, 1, 0.2627451, 1,
-0.3536024, 0.8136535, 0.5400088, 0, 1, 0.2666667, 1,
-0.3529609, 1.693417, -1.027193, 0, 1, 0.2745098, 1,
-0.3489217, -0.4987315, -3.266999, 0, 1, 0.2784314, 1,
-0.3453763, -1.359068, -3.725898, 0, 1, 0.2862745, 1,
-0.3446171, -1.07503, -2.223306, 0, 1, 0.2901961, 1,
-0.3436601, 1.10188, -3.046924, 0, 1, 0.2980392, 1,
-0.3432938, 1.988756, -0.8993521, 0, 1, 0.3058824, 1,
-0.3407952, 0.06070692, -1.917445, 0, 1, 0.3098039, 1,
-0.3399619, 0.01184698, -0.4494802, 0, 1, 0.3176471, 1,
-0.3332262, 1.271016, 1.12861, 0, 1, 0.3215686, 1,
-0.3319854, 0.4512593, -1.536452, 0, 1, 0.3294118, 1,
-0.3312519, -2.209102, -5.449362, 0, 1, 0.3333333, 1,
-0.3287684, 0.05975498, -1.15056, 0, 1, 0.3411765, 1,
-0.323719, -0.06938688, -1.929716, 0, 1, 0.345098, 1,
-0.3230921, -0.3621251, -3.636667, 0, 1, 0.3529412, 1,
-0.3210819, -0.5743735, -2.85181, 0, 1, 0.3568628, 1,
-0.3206289, -0.3713372, -3.118846, 0, 1, 0.3647059, 1,
-0.3154597, 0.09026308, 0.5543708, 0, 1, 0.3686275, 1,
-0.3129652, 1.1715, 2.0298, 0, 1, 0.3764706, 1,
-0.3078445, 2.407856, -0.3366047, 0, 1, 0.3803922, 1,
-0.3071016, 0.4259154, -0.2009373, 0, 1, 0.3882353, 1,
-0.3039551, -0.5826679, -0.8211725, 0, 1, 0.3921569, 1,
-0.2961997, 0.6098518, -0.7031699, 0, 1, 0.4, 1,
-0.2923971, -0.8316163, -2.95016, 0, 1, 0.4078431, 1,
-0.2878194, 0.9896069, 0.1420936, 0, 1, 0.4117647, 1,
-0.2869618, -1.199789, -4.418998, 0, 1, 0.4196078, 1,
-0.2847957, -0.9205875, -1.728069, 0, 1, 0.4235294, 1,
-0.2778465, -0.7141682, -3.110743, 0, 1, 0.4313726, 1,
-0.2731138, 0.1362119, -1.386275, 0, 1, 0.4352941, 1,
-0.2715365, 0.7399094, -1.64921, 0, 1, 0.4431373, 1,
-0.2698284, 1.678739, 0.9935138, 0, 1, 0.4470588, 1,
-0.2661595, -0.01929729, -1.829862, 0, 1, 0.454902, 1,
-0.2587531, -0.4576257, -2.151993, 0, 1, 0.4588235, 1,
-0.2576765, 0.7312167, -0.144174, 0, 1, 0.4666667, 1,
-0.2542682, -0.02215941, -1.514506, 0, 1, 0.4705882, 1,
-0.2512117, -0.595562, -2.479789, 0, 1, 0.4784314, 1,
-0.2494274, 1.090121, 0.07706525, 0, 1, 0.4823529, 1,
-0.2480314, 0.6035202, -0.9956136, 0, 1, 0.4901961, 1,
-0.2475373, -1.037287, -1.796744, 0, 1, 0.4941176, 1,
-0.2469117, 0.5245533, 0.393623, 0, 1, 0.5019608, 1,
-0.2423528, -0.3248015, -1.955328, 0, 1, 0.509804, 1,
-0.2411948, 0.6325666, -0.4340245, 0, 1, 0.5137255, 1,
-0.2361413, 1.344624, 0.3059345, 0, 1, 0.5215687, 1,
-0.2354361, -0.3369737, -3.861147, 0, 1, 0.5254902, 1,
-0.2328208, 0.49825, 0.5645986, 0, 1, 0.5333334, 1,
-0.2310298, 1.02703, 0.0161132, 0, 1, 0.5372549, 1,
-0.2309428, 1.047181, 0.9701746, 0, 1, 0.5450981, 1,
-0.2244821, -1.970679, -4.35292, 0, 1, 0.5490196, 1,
-0.223947, -1.042554, -4.271081, 0, 1, 0.5568628, 1,
-0.2228975, 0.2551157, -1.215513, 0, 1, 0.5607843, 1,
-0.2196494, -0.8053284, -3.433542, 0, 1, 0.5686275, 1,
-0.2196459, -1.757847, -2.211605, 0, 1, 0.572549, 1,
-0.2188038, 1.67847, 1.411058, 0, 1, 0.5803922, 1,
-0.2170561, -0.1235101, -3.407422, 0, 1, 0.5843138, 1,
-0.2121591, -0.0571079, -3.213956, 0, 1, 0.5921569, 1,
-0.2105774, 2.133735, -0.1342504, 0, 1, 0.5960785, 1,
-0.2048948, 0.2259243, 0.6317448, 0, 1, 0.6039216, 1,
-0.2015071, -0.07220685, -1.932796, 0, 1, 0.6117647, 1,
-0.1978884, 2.129659, 0.6008494, 0, 1, 0.6156863, 1,
-0.1947255, -0.6214213, -2.195704, 0, 1, 0.6235294, 1,
-0.1941633, 0.1822883, -0.2654154, 0, 1, 0.627451, 1,
-0.18377, -0.8652502, -2.741044, 0, 1, 0.6352941, 1,
-0.1817709, 1.026183, 1.829283, 0, 1, 0.6392157, 1,
-0.1812305, -0.8804356, -3.082911, 0, 1, 0.6470588, 1,
-0.1812053, 0.2317988, -1.692832, 0, 1, 0.6509804, 1,
-0.180475, 0.8700897, -0.03317368, 0, 1, 0.6588235, 1,
-0.1758212, -1.733564, -3.022008, 0, 1, 0.6627451, 1,
-0.1750929, 0.9030574, -0.1356245, 0, 1, 0.6705883, 1,
-0.1738185, -0.1783736, -2.348046, 0, 1, 0.6745098, 1,
-0.1716254, -1.226899, -4.391243, 0, 1, 0.682353, 1,
-0.1711488, 0.1772767, -0.8361083, 0, 1, 0.6862745, 1,
-0.1703444, 1.083867, -0.2814307, 0, 1, 0.6941177, 1,
-0.1690845, 0.2025674, -0.7704868, 0, 1, 0.7019608, 1,
-0.1650143, -0.04564723, -0.08494237, 0, 1, 0.7058824, 1,
-0.1620378, -0.3557184, -2.546597, 0, 1, 0.7137255, 1,
-0.1620249, -0.1344777, -3.939776, 0, 1, 0.7176471, 1,
-0.1614859, 0.9890675, -0.6491176, 0, 1, 0.7254902, 1,
-0.1597835, -1.06784, -3.14933, 0, 1, 0.7294118, 1,
-0.1591141, 0.8293926, -2.457784, 0, 1, 0.7372549, 1,
-0.1568801, -0.585876, -3.520962, 0, 1, 0.7411765, 1,
-0.1555941, 0.8698567, 0.3693712, 0, 1, 0.7490196, 1,
-0.1553783, -1.145734, -2.973747, 0, 1, 0.7529412, 1,
-0.1537817, -0.8043295, -4.357329, 0, 1, 0.7607843, 1,
-0.1451788, -1.740948, -2.455864, 0, 1, 0.7647059, 1,
-0.1414487, -0.461951, -3.103594, 0, 1, 0.772549, 1,
-0.1399635, 0.9712131, -1.201563, 0, 1, 0.7764706, 1,
-0.13874, 0.5842869, 0.4710479, 0, 1, 0.7843137, 1,
-0.1331257, -0.9679931, -4.611891, 0, 1, 0.7882353, 1,
-0.1313768, -0.02828431, -0.6158514, 0, 1, 0.7960784, 1,
-0.1307325, 1.749865, 0.168359, 0, 1, 0.8039216, 1,
-0.1305735, 0.2841054, -1.877073, 0, 1, 0.8078431, 1,
-0.1284595, -0.7953973, -2.134089, 0, 1, 0.8156863, 1,
-0.1253522, -1.08698, -1.567477, 0, 1, 0.8196079, 1,
-0.1180356, 0.3845659, 1.29239, 0, 1, 0.827451, 1,
-0.1144779, 1.107362, 0.1491185, 0, 1, 0.8313726, 1,
-0.1143636, -1.529354, -3.356859, 0, 1, 0.8392157, 1,
-0.1127008, -0.4366732, -4.463237, 0, 1, 0.8431373, 1,
-0.1113949, 2.255405, -0.7766454, 0, 1, 0.8509804, 1,
-0.1105119, 0.5744982, -0.247583, 0, 1, 0.854902, 1,
-0.1098995, -1.008407, -3.675558, 0, 1, 0.8627451, 1,
-0.1097836, -0.730834, -1.946637, 0, 1, 0.8666667, 1,
-0.1049558, -2.380355, -5.361858, 0, 1, 0.8745098, 1,
-0.09986514, -0.1374619, -3.296455, 0, 1, 0.8784314, 1,
-0.09805557, 0.2910561, -1.286574, 0, 1, 0.8862745, 1,
-0.09682747, -1.0419, -2.888442, 0, 1, 0.8901961, 1,
-0.09666654, -1.106153, -3.966943, 0, 1, 0.8980392, 1,
-0.08623415, -2.45226, -2.20003, 0, 1, 0.9058824, 1,
-0.08124013, 1.413413, -0.004934695, 0, 1, 0.9098039, 1,
-0.07407902, 0.7423835, -1.114699, 0, 1, 0.9176471, 1,
-0.06671675, 0.9863515, -0.2852004, 0, 1, 0.9215686, 1,
-0.06600977, -0.8498876, -1.483533, 0, 1, 0.9294118, 1,
-0.05828428, -0.4759391, -3.616533, 0, 1, 0.9333333, 1,
-0.0531124, -1.197801, -3.357184, 0, 1, 0.9411765, 1,
-0.04967694, -0.7547278, -2.96043, 0, 1, 0.945098, 1,
-0.04757919, 1.652277, 0.1066482, 0, 1, 0.9529412, 1,
-0.04556784, 0.482206, -0.2470746, 0, 1, 0.9568627, 1,
-0.04537622, -0.1608629, -3.870104, 0, 1, 0.9647059, 1,
-0.03947128, 0.8891923, -1.179987, 0, 1, 0.9686275, 1,
-0.03612547, 0.5151275, -0.04225777, 0, 1, 0.9764706, 1,
-0.03541526, -0.5325648, -1.856809, 0, 1, 0.9803922, 1,
-0.03534313, 0.6796203, 0.8523057, 0, 1, 0.9882353, 1,
-0.03356462, 1.363962, 0.4392187, 0, 1, 0.9921569, 1,
-0.02997727, 1.194862, 0.08536602, 0, 1, 1, 1,
-0.02831372, -1.11619, -1.84777, 0, 0.9921569, 1, 1,
-0.02657011, 1.006341, 0.5661423, 0, 0.9882353, 1, 1,
-0.02335806, 0.07701092, 1.677176, 0, 0.9803922, 1, 1,
-0.02191637, 0.0244623, 0.9391909, 0, 0.9764706, 1, 1,
-0.02182397, -0.2355899, -2.737527, 0, 0.9686275, 1, 1,
-0.02057082, -0.2401634, -3.416567, 0, 0.9647059, 1, 1,
-0.01763539, -0.9228424, -3.585455, 0, 0.9568627, 1, 1,
-0.01660485, 0.5851908, -1.972417, 0, 0.9529412, 1, 1,
-0.01598466, -1.246792, -3.142877, 0, 0.945098, 1, 1,
-0.01457815, -0.248763, -3.254624, 0, 0.9411765, 1, 1,
-0.01169517, -0.3149823, -1.227623, 0, 0.9333333, 1, 1,
-0.007836986, 0.2023489, -1.234901, 0, 0.9294118, 1, 1,
-0.004281583, 1.780904, -0.01658649, 0, 0.9215686, 1, 1,
-0.001216979, 0.4127831, -2.333839, 0, 0.9176471, 1, 1,
0.0007865511, 0.8361086, -0.5740547, 0, 0.9098039, 1, 1,
0.0008921287, -0.7775, 1.528797, 0, 0.9058824, 1, 1,
0.001456626, -0.003156414, 2.577544, 0, 0.8980392, 1, 1,
0.001732067, 1.735487, -0.4142744, 0, 0.8901961, 1, 1,
0.00466003, -0.6488409, 3.139123, 0, 0.8862745, 1, 1,
0.005386671, 1.564223, -0.5733884, 0, 0.8784314, 1, 1,
0.01130647, 1.185596, -2.572017, 0, 0.8745098, 1, 1,
0.01299179, 0.1472282, 0.8312024, 0, 0.8666667, 1, 1,
0.01323422, -1.342099, 2.782946, 0, 0.8627451, 1, 1,
0.01365356, -1.263693, 0.9912945, 0, 0.854902, 1, 1,
0.01948167, 0.9677993, -1.116027, 0, 0.8509804, 1, 1,
0.0284002, 0.6655579, 1.856112, 0, 0.8431373, 1, 1,
0.03125618, -0.5410065, 3.881617, 0, 0.8392157, 1, 1,
0.03333342, 1.301889, -1.960887, 0, 0.8313726, 1, 1,
0.03486636, 0.3813876, -0.9499611, 0, 0.827451, 1, 1,
0.03626154, -1.545247, 2.351529, 0, 0.8196079, 1, 1,
0.03814641, 0.8520668, -1.176046, 0, 0.8156863, 1, 1,
0.04489219, -0.5136779, 3.330554, 0, 0.8078431, 1, 1,
0.0499372, -0.1796839, 3.944742, 0, 0.8039216, 1, 1,
0.05132983, 1.185458, -1.392091, 0, 0.7960784, 1, 1,
0.05297291, -0.3487519, 4.476184, 0, 0.7882353, 1, 1,
0.05698952, -0.2591045, 2.21922, 0, 0.7843137, 1, 1,
0.06272553, -1.409798, 3.199156, 0, 0.7764706, 1, 1,
0.06347601, -0.9294053, 1.286315, 0, 0.772549, 1, 1,
0.06861308, 0.9630632, -0.2356563, 0, 0.7647059, 1, 1,
0.068846, -1.6572, 2.764538, 0, 0.7607843, 1, 1,
0.06994706, -1.443147, 4.123832, 0, 0.7529412, 1, 1,
0.07395524, -0.9043694, 2.309052, 0, 0.7490196, 1, 1,
0.0781557, 0.1418375, 1.023376, 0, 0.7411765, 1, 1,
0.08279322, -1.166835, 2.125426, 0, 0.7372549, 1, 1,
0.08390088, 0.3608828, 1.038533, 0, 0.7294118, 1, 1,
0.09105377, 0.5832574, 1.370317, 0, 0.7254902, 1, 1,
0.0917568, 1.040706, -1.221882, 0, 0.7176471, 1, 1,
0.09277458, -0.05850635, 3.169978, 0, 0.7137255, 1, 1,
0.1012925, -1.975742, 1.731115, 0, 0.7058824, 1, 1,
0.1018973, -0.3620141, 3.35208, 0, 0.6980392, 1, 1,
0.1037489, 1.113023, -0.9574364, 0, 0.6941177, 1, 1,
0.1079806, -1.533172, 4.517193, 0, 0.6862745, 1, 1,
0.1144765, 1.082188, 0.272746, 0, 0.682353, 1, 1,
0.1263951, -1.441883, 2.900911, 0, 0.6745098, 1, 1,
0.1358999, 1.76577, -0.118077, 0, 0.6705883, 1, 1,
0.1366414, -0.2656485, 2.183069, 0, 0.6627451, 1, 1,
0.1380531, -0.02634832, 1.76651, 0, 0.6588235, 1, 1,
0.1445554, 0.09650489, 1.375514, 0, 0.6509804, 1, 1,
0.1494928, 0.6022704, -0.5424946, 0, 0.6470588, 1, 1,
0.1521313, 0.214932, -0.2706775, 0, 0.6392157, 1, 1,
0.162979, -0.5386256, 2.125258, 0, 0.6352941, 1, 1,
0.164104, -0.1480729, 1.887609, 0, 0.627451, 1, 1,
0.1652326, 1.324525, 0.8497102, 0, 0.6235294, 1, 1,
0.1652646, -0.2723152, 2.865486, 0, 0.6156863, 1, 1,
0.1693393, 0.79331, 0.5260126, 0, 0.6117647, 1, 1,
0.1718792, -0.8176324, 3.474921, 0, 0.6039216, 1, 1,
0.1757673, 0.2996469, 2.060733, 0, 0.5960785, 1, 1,
0.1765274, 0.09778707, 1.403888, 0, 0.5921569, 1, 1,
0.1814824, -0.5277087, 3.195102, 0, 0.5843138, 1, 1,
0.1839437, 0.2584656, 0.2567038, 0, 0.5803922, 1, 1,
0.1845037, -0.4188267, 1.826468, 0, 0.572549, 1, 1,
0.1860674, -2.377027, 1.568679, 0, 0.5686275, 1, 1,
0.1862223, -0.9085816, 2.232753, 0, 0.5607843, 1, 1,
0.1888725, 0.4005255, 1.995495, 0, 0.5568628, 1, 1,
0.1981481, -0.5720617, 2.395564, 0, 0.5490196, 1, 1,
0.2001523, 1.361383, -0.6906689, 0, 0.5450981, 1, 1,
0.2021727, -1.599339, 2.079149, 0, 0.5372549, 1, 1,
0.2058799, -1.473095, 3.91141, 0, 0.5333334, 1, 1,
0.2074954, 0.5392514, 2.659173, 0, 0.5254902, 1, 1,
0.20837, -1.254565, 3.187649, 0, 0.5215687, 1, 1,
0.2099218, -1.024277, 1.820776, 0, 0.5137255, 1, 1,
0.2115535, -0.1244483, 0.9098502, 0, 0.509804, 1, 1,
0.2116567, -0.9037713, 1.909828, 0, 0.5019608, 1, 1,
0.2129889, 2.132209, -0.1062792, 0, 0.4941176, 1, 1,
0.2130113, -0.5572645, 3.657998, 0, 0.4901961, 1, 1,
0.2130303, 0.6560349, 0.7569388, 0, 0.4823529, 1, 1,
0.2141589, 1.462162, 0.1256621, 0, 0.4784314, 1, 1,
0.2191611, -0.1618474, 2.309523, 0, 0.4705882, 1, 1,
0.2206645, 0.9959478, -0.6480265, 0, 0.4666667, 1, 1,
0.2228384, -0.5698612, 2.243945, 0, 0.4588235, 1, 1,
0.2233593, 1.128365, 1.399884, 0, 0.454902, 1, 1,
0.2238115, -1.795476, 3.535316, 0, 0.4470588, 1, 1,
0.223813, -1.213144, 2.396261, 0, 0.4431373, 1, 1,
0.2242997, -1.039776, 3.255059, 0, 0.4352941, 1, 1,
0.2285323, 0.6006923, 2.946463, 0, 0.4313726, 1, 1,
0.2348098, -0.6598897, 4.433977, 0, 0.4235294, 1, 1,
0.2375482, -0.3957278, 1.75515, 0, 0.4196078, 1, 1,
0.2385751, 0.1061466, 1.084958, 0, 0.4117647, 1, 1,
0.2406335, -0.1391905, 3.661267, 0, 0.4078431, 1, 1,
0.2415918, -1.629351, 2.426346, 0, 0.4, 1, 1,
0.2417643, -0.5393035, 3.966723, 0, 0.3921569, 1, 1,
0.2448566, -0.6553191, 3.487796, 0, 0.3882353, 1, 1,
0.2457895, 0.2320037, 0.6689679, 0, 0.3803922, 1, 1,
0.2489483, -0.415406, 2.53478, 0, 0.3764706, 1, 1,
0.2503665, 1.188001, 0.7509066, 0, 0.3686275, 1, 1,
0.250467, -1.231725, 2.056037, 0, 0.3647059, 1, 1,
0.2519807, -0.1522875, 1.935449, 0, 0.3568628, 1, 1,
0.256388, -0.03051536, 1.531466, 0, 0.3529412, 1, 1,
0.2638993, -0.8975835, 4.983375, 0, 0.345098, 1, 1,
0.2668303, 0.3198922, 0.4311129, 0, 0.3411765, 1, 1,
0.2720404, 0.5142661, -0.1453566, 0, 0.3333333, 1, 1,
0.2747903, 0.3489289, 0.1495637, 0, 0.3294118, 1, 1,
0.2749935, -1.930843, 3.339033, 0, 0.3215686, 1, 1,
0.2755215, 0.4767046, -2.290618, 0, 0.3176471, 1, 1,
0.2755576, -0.8324695, 4.30481, 0, 0.3098039, 1, 1,
0.2817422, 2.120812, -1.055367, 0, 0.3058824, 1, 1,
0.2833199, -0.1588167, 2.035426, 0, 0.2980392, 1, 1,
0.2866715, 1.569796, -0.3325446, 0, 0.2901961, 1, 1,
0.2933078, -1.147805, 2.154007, 0, 0.2862745, 1, 1,
0.3022236, 0.4256767, 2.039971, 0, 0.2784314, 1, 1,
0.3022522, 1.919023, -0.6159253, 0, 0.2745098, 1, 1,
0.3037136, -0.2555903, 2.439453, 0, 0.2666667, 1, 1,
0.3067233, -0.2845082, 5.185585, 0, 0.2627451, 1, 1,
0.30935, 0.3038059, 0.228842, 0, 0.254902, 1, 1,
0.3096475, -1.635615, 2.418301, 0, 0.2509804, 1, 1,
0.3117094, -0.1160348, 2.19837, 0, 0.2431373, 1, 1,
0.3133568, 0.4875151, 0.9682094, 0, 0.2392157, 1, 1,
0.3141966, -0.5770143, 4.695456, 0, 0.2313726, 1, 1,
0.316774, -2.568706, 0.4884487, 0, 0.227451, 1, 1,
0.3171631, 1.002767, -0.948586, 0, 0.2196078, 1, 1,
0.321732, 0.464499, 0.8339521, 0, 0.2156863, 1, 1,
0.3222266, -1.664969, 3.191458, 0, 0.2078431, 1, 1,
0.3305395, 0.3608525, 1.087961, 0, 0.2039216, 1, 1,
0.3345499, 2.890837, 0.3672549, 0, 0.1960784, 1, 1,
0.3353342, 0.9176001, 0.9499276, 0, 0.1882353, 1, 1,
0.3360533, -0.04139094, 2.529257, 0, 0.1843137, 1, 1,
0.3368925, 1.682993, 1.084651, 0, 0.1764706, 1, 1,
0.3431848, -1.827585, 3.027303, 0, 0.172549, 1, 1,
0.3437522, 0.4306835, 0.7512176, 0, 0.1647059, 1, 1,
0.3482434, -0.2763948, 1.19464, 0, 0.1607843, 1, 1,
0.3497804, 1.13759, -0.2501252, 0, 0.1529412, 1, 1,
0.3512527, 1.213313, 0.4719404, 0, 0.1490196, 1, 1,
0.3526653, 1.050633, 1.631165, 0, 0.1411765, 1, 1,
0.357567, -0.04340296, 0.5558559, 0, 0.1372549, 1, 1,
0.3611047, -0.09200216, 1.430428, 0, 0.1294118, 1, 1,
0.3619488, -0.2477134, 2.345395, 0, 0.1254902, 1, 1,
0.3635769, 0.08282927, 1.243682, 0, 0.1176471, 1, 1,
0.3659846, -0.173374, 1.501885, 0, 0.1137255, 1, 1,
0.3686373, 1.277114, 0.622973, 0, 0.1058824, 1, 1,
0.3687523, -0.6464841, 2.027034, 0, 0.09803922, 1, 1,
0.3699337, -0.4543564, 1.485235, 0, 0.09411765, 1, 1,
0.3714882, -1.680647, 4.316683, 0, 0.08627451, 1, 1,
0.3748745, 0.1089345, 2.04726, 0, 0.08235294, 1, 1,
0.3781188, -0.9014489, 2.671448, 0, 0.07450981, 1, 1,
0.3796839, 0.5471531, -0.3226015, 0, 0.07058824, 1, 1,
0.3797785, -1.340147, 3.004276, 0, 0.0627451, 1, 1,
0.3822908, 1.84426, 0.7427101, 0, 0.05882353, 1, 1,
0.3842178, -0.9119613, 4.599748, 0, 0.05098039, 1, 1,
0.3865, -0.6925929, 1.341871, 0, 0.04705882, 1, 1,
0.390231, -0.2966774, 2.599494, 0, 0.03921569, 1, 1,
0.3940262, 0.2017096, 2.167947, 0, 0.03529412, 1, 1,
0.3944108, 2.575237, -0.5252541, 0, 0.02745098, 1, 1,
0.3966392, 2.362849, -0.9523535, 0, 0.02352941, 1, 1,
0.3980536, -1.073858, 2.764571, 0, 0.01568628, 1, 1,
0.3988674, -1.759935, 1.160556, 0, 0.01176471, 1, 1,
0.400081, -0.9060751, 2.787568, 0, 0.003921569, 1, 1,
0.4102276, -0.2936928, 0.6112514, 0.003921569, 0, 1, 1,
0.4130529, -0.1835615, 0.8048652, 0.007843138, 0, 1, 1,
0.4153501, 0.1267727, 0.5559675, 0.01568628, 0, 1, 1,
0.4161756, 1.097869, -0.8531545, 0.01960784, 0, 1, 1,
0.4195505, -0.3390969, 0.2861567, 0.02745098, 0, 1, 1,
0.4215814, -1.071828, 0.8778602, 0.03137255, 0, 1, 1,
0.421821, 0.3253355, 1.239936, 0.03921569, 0, 1, 1,
0.4235625, -1.040224, 1.625229, 0.04313726, 0, 1, 1,
0.4267857, 0.3688975, 0.693975, 0.05098039, 0, 1, 1,
0.4319642, 1.872241, 1.552054, 0.05490196, 0, 1, 1,
0.4419292, 0.229126, 1.566273, 0.0627451, 0, 1, 1,
0.4429418, 1.03382, -0.1196002, 0.06666667, 0, 1, 1,
0.4477524, -1.175774, 0.3454303, 0.07450981, 0, 1, 1,
0.4503556, -0.6894553, 2.664604, 0.07843138, 0, 1, 1,
0.451993, -0.774289, 1.539838, 0.08627451, 0, 1, 1,
0.4528848, 1.308916, -2.029881, 0.09019608, 0, 1, 1,
0.4532392, 0.2783254, 0.7906222, 0.09803922, 0, 1, 1,
0.4571129, -0.6977817, 0.5338676, 0.1058824, 0, 1, 1,
0.4584356, 1.619679, 1.370571, 0.1098039, 0, 1, 1,
0.4618309, 0.2729554, 0.4923764, 0.1176471, 0, 1, 1,
0.463742, -0.9562621, 3.172478, 0.1215686, 0, 1, 1,
0.4694304, -2.48802, 3.259041, 0.1294118, 0, 1, 1,
0.4700999, 0.1975396, 0.6893355, 0.1333333, 0, 1, 1,
0.4771522, -0.868434, 2.48864, 0.1411765, 0, 1, 1,
0.4781545, -0.5362858, 2.989056, 0.145098, 0, 1, 1,
0.4801857, -0.6979092, 2.23277, 0.1529412, 0, 1, 1,
0.4802999, -0.7868159, 3.576907, 0.1568628, 0, 1, 1,
0.4839877, -1.589652, 4.819188, 0.1647059, 0, 1, 1,
0.4852735, 1.2969, 1.154656, 0.1686275, 0, 1, 1,
0.4853125, -1.282116, 3.530231, 0.1764706, 0, 1, 1,
0.4890064, 0.5650272, 0.5953488, 0.1803922, 0, 1, 1,
0.4902439, -0.4728123, 1.792592, 0.1882353, 0, 1, 1,
0.4912539, -2.698113, 3.709456, 0.1921569, 0, 1, 1,
0.4929025, 0.9111464, 0.728758, 0.2, 0, 1, 1,
0.4940458, -0.0605492, 0.9729543, 0.2078431, 0, 1, 1,
0.4954188, 0.2636445, -0.5172495, 0.2117647, 0, 1, 1,
0.4957355, -0.9932753, 2.807942, 0.2196078, 0, 1, 1,
0.4959238, -0.5210916, 0.585024, 0.2235294, 0, 1, 1,
0.4969946, 1.971085, 0.03449888, 0.2313726, 0, 1, 1,
0.4997509, 2.125059, -0.342646, 0.2352941, 0, 1, 1,
0.5109886, 0.43452, 0.9012524, 0.2431373, 0, 1, 1,
0.512761, -0.8333191, 2.149198, 0.2470588, 0, 1, 1,
0.5189707, 0.5249264, -0.1031238, 0.254902, 0, 1, 1,
0.5243358, -0.470432, 2.18556, 0.2588235, 0, 1, 1,
0.5317117, 1.017181, -0.9756085, 0.2666667, 0, 1, 1,
0.5355096, 0.6845012, -0.06059667, 0.2705882, 0, 1, 1,
0.5411419, -0.3586906, 0.6878449, 0.2784314, 0, 1, 1,
0.5450311, -2.405018, 2.618442, 0.282353, 0, 1, 1,
0.5452601, 0.2739446, 1.85656, 0.2901961, 0, 1, 1,
0.5458938, 2.301199, -0.3550273, 0.2941177, 0, 1, 1,
0.5464289, -0.2868992, 1.566204, 0.3019608, 0, 1, 1,
0.5540811, -0.5828996, 2.180295, 0.3098039, 0, 1, 1,
0.5558816, 0.1040121, 2.616912, 0.3137255, 0, 1, 1,
0.5577283, 0.3823931, 1.877645, 0.3215686, 0, 1, 1,
0.5602376, 0.1199647, 0.7392759, 0.3254902, 0, 1, 1,
0.5636238, 0.3964478, 0.2254523, 0.3333333, 0, 1, 1,
0.5650284, 1.075511, 0.7892288, 0.3372549, 0, 1, 1,
0.5672678, 0.5399022, 1.234486, 0.345098, 0, 1, 1,
0.5773848, -1.289424, 3.128436, 0.3490196, 0, 1, 1,
0.5794528, -0.3789976, 1.569514, 0.3568628, 0, 1, 1,
0.582268, -0.8604182, 2.092514, 0.3607843, 0, 1, 1,
0.5859886, -0.1872189, 0.9190205, 0.3686275, 0, 1, 1,
0.5916486, 0.7892129, 0.9464905, 0.372549, 0, 1, 1,
0.5922046, 0.6379277, 0.80088, 0.3803922, 0, 1, 1,
0.5936458, 1.232442, 0.03224768, 0.3843137, 0, 1, 1,
0.5938601, -0.3008071, 2.932515, 0.3921569, 0, 1, 1,
0.5963154, 1.189896, -0.6235602, 0.3960784, 0, 1, 1,
0.5970545, 1.320215, 2.031179, 0.4039216, 0, 1, 1,
0.6005049, 0.9685777, 1.416501, 0.4117647, 0, 1, 1,
0.604081, 0.4671623, 0.6292138, 0.4156863, 0, 1, 1,
0.6043115, 0.4777273, 1.053568, 0.4235294, 0, 1, 1,
0.6097231, 0.4850665, 0.8557785, 0.427451, 0, 1, 1,
0.6098927, 0.8848394, 1.285507, 0.4352941, 0, 1, 1,
0.621172, 0.6024524, 0.9963735, 0.4392157, 0, 1, 1,
0.6219892, 0.4639702, 1.366566, 0.4470588, 0, 1, 1,
0.6304248, -0.625668, 2.278, 0.4509804, 0, 1, 1,
0.6370795, 0.1206992, 1.342739, 0.4588235, 0, 1, 1,
0.6390179, 1.671987, -0.3023509, 0.4627451, 0, 1, 1,
0.639057, 0.5062079, 2.200598, 0.4705882, 0, 1, 1,
0.6419075, -0.3587845, 2.033863, 0.4745098, 0, 1, 1,
0.6419165, 1.858933, -0.2069151, 0.4823529, 0, 1, 1,
0.6472989, -1.993218, 2.906524, 0.4862745, 0, 1, 1,
0.6474404, 2.101799, -0.9578804, 0.4941176, 0, 1, 1,
0.6477968, 0.2819264, 1.773816, 0.5019608, 0, 1, 1,
0.6504681, 0.2360175, 1.389504, 0.5058824, 0, 1, 1,
0.6511065, -0.1886622, 1.398762, 0.5137255, 0, 1, 1,
0.6560422, -2.672029, 2.68743, 0.5176471, 0, 1, 1,
0.6583784, -1.311358, 2.967117, 0.5254902, 0, 1, 1,
0.6588888, 0.9779113, 0.7667278, 0.5294118, 0, 1, 1,
0.6688386, 0.03154704, 1.500601, 0.5372549, 0, 1, 1,
0.6691934, -2.101083, 3.32313, 0.5411765, 0, 1, 1,
0.6699555, -1.415734, 0.8653285, 0.5490196, 0, 1, 1,
0.670843, 0.2694307, 2.891355, 0.5529412, 0, 1, 1,
0.6850122, -1.089486, 3.129054, 0.5607843, 0, 1, 1,
0.6858898, 1.798206, -1.707724, 0.5647059, 0, 1, 1,
0.6861995, -0.428242, 3.224637, 0.572549, 0, 1, 1,
0.6883504, 1.203067, -0.03949857, 0.5764706, 0, 1, 1,
0.688441, -2.029676, 0.7979689, 0.5843138, 0, 1, 1,
0.6961287, -0.3223242, 2.463103, 0.5882353, 0, 1, 1,
0.6966198, -1.956799, 2.823835, 0.5960785, 0, 1, 1,
0.6978561, 1.144535, -0.4755293, 0.6039216, 0, 1, 1,
0.6979197, -1.177292, 2.643486, 0.6078432, 0, 1, 1,
0.7003897, -0.4000119, 1.775687, 0.6156863, 0, 1, 1,
0.7004842, -0.04160976, -0.1538108, 0.6196079, 0, 1, 1,
0.7045343, 1.992307, 1.13078, 0.627451, 0, 1, 1,
0.7055358, -0.659538, 2.089791, 0.6313726, 0, 1, 1,
0.7132249, -0.2225764, -0.3700892, 0.6392157, 0, 1, 1,
0.7158775, 1.805492, 0.7024502, 0.6431373, 0, 1, 1,
0.7161711, -1.733361, 1.61075, 0.6509804, 0, 1, 1,
0.716239, 1.264381, 0.1347032, 0.654902, 0, 1, 1,
0.7215754, 0.2294367, 0.9219005, 0.6627451, 0, 1, 1,
0.7262347, -2.091844, 5.428519, 0.6666667, 0, 1, 1,
0.7309106, 1.115117, 0.9211072, 0.6745098, 0, 1, 1,
0.7353025, 0.01372094, 1.974282, 0.6784314, 0, 1, 1,
0.7381976, -0.8478002, 3.982521, 0.6862745, 0, 1, 1,
0.7479984, -0.4472177, 1.266143, 0.6901961, 0, 1, 1,
0.7514051, -1.088783, 3.734257, 0.6980392, 0, 1, 1,
0.7516426, -0.8646257, 2.197387, 0.7058824, 0, 1, 1,
0.7526516, 0.7357675, 2.594706, 0.7098039, 0, 1, 1,
0.7530636, -1.458148, 1.289884, 0.7176471, 0, 1, 1,
0.753147, 0.6554638, 1.405471, 0.7215686, 0, 1, 1,
0.7595716, -0.9160444, 3.509896, 0.7294118, 0, 1, 1,
0.7664796, -1.087789, 2.270684, 0.7333333, 0, 1, 1,
0.7773787, 0.1337365, 1.341495, 0.7411765, 0, 1, 1,
0.7785856, -0.2812555, 1.09972, 0.7450981, 0, 1, 1,
0.7975401, 0.8689567, 1.549838, 0.7529412, 0, 1, 1,
0.7977642, 0.03234538, 1.664392, 0.7568628, 0, 1, 1,
0.8027135, 1.006751, -0.4217179, 0.7647059, 0, 1, 1,
0.8064827, 0.4829127, -0.3712557, 0.7686275, 0, 1, 1,
0.8066928, 2.596948, 0.2149794, 0.7764706, 0, 1, 1,
0.8085184, 0.7564385, -0.4974383, 0.7803922, 0, 1, 1,
0.8148735, -1.261083, 1.430268, 0.7882353, 0, 1, 1,
0.8248147, 0.9855025, 0.5783455, 0.7921569, 0, 1, 1,
0.8328203, -0.3952207, 1.736273, 0.8, 0, 1, 1,
0.8336781, 0.2133138, 0.2925375, 0.8078431, 0, 1, 1,
0.8354535, -0.3368663, 2.571685, 0.8117647, 0, 1, 1,
0.8364332, -0.6535488, 3.908875, 0.8196079, 0, 1, 1,
0.8474005, 0.2448434, 1.312259, 0.8235294, 0, 1, 1,
0.8477647, 1.041894, 1.18702, 0.8313726, 0, 1, 1,
0.8524373, -0.5262441, 3.797926, 0.8352941, 0, 1, 1,
0.8580254, -0.5772393, 2.345789, 0.8431373, 0, 1, 1,
0.8611689, 0.4874579, 0.8636067, 0.8470588, 0, 1, 1,
0.8669015, 0.5941218, 0.5929512, 0.854902, 0, 1, 1,
0.8725542, -0.7548863, 2.257372, 0.8588235, 0, 1, 1,
0.8826312, 2.06842, 1.241691, 0.8666667, 0, 1, 1,
0.8829305, 0.05085212, 2.01403, 0.8705882, 0, 1, 1,
0.8838207, -0.25511, 3.24778, 0.8784314, 0, 1, 1,
0.8860769, 0.3317801, 0.1731009, 0.8823529, 0, 1, 1,
0.887875, 0.641811, 0.4239343, 0.8901961, 0, 1, 1,
0.8879037, -0.004394222, 1.492396, 0.8941177, 0, 1, 1,
0.8902465, -0.346862, 1.939393, 0.9019608, 0, 1, 1,
0.8917255, -1.353366, 1.405726, 0.9098039, 0, 1, 1,
0.8918959, 2.369863, -1.630322, 0.9137255, 0, 1, 1,
0.8946993, 0.1682631, 1.329369, 0.9215686, 0, 1, 1,
0.8958559, 2.233919, -1.181143, 0.9254902, 0, 1, 1,
0.9063588, -0.4973688, 1.969811, 0.9333333, 0, 1, 1,
0.9075229, -1.658188, 1.289757, 0.9372549, 0, 1, 1,
0.9080396, -0.09047102, 1.11081, 0.945098, 0, 1, 1,
0.9082346, 0.1767644, 1.986061, 0.9490196, 0, 1, 1,
0.9084981, 0.06257813, 0.5446579, 0.9568627, 0, 1, 1,
0.9094785, -0.5428525, 0.08826316, 0.9607843, 0, 1, 1,
0.9155456, 0.6238363, 1.922585, 0.9686275, 0, 1, 1,
0.9304464, -1.319224, 1.382061, 0.972549, 0, 1, 1,
0.9374253, 0.9393042, -1.450643, 0.9803922, 0, 1, 1,
0.9435409, 1.159615, 1.03663, 0.9843137, 0, 1, 1,
0.9446692, -1.586546, 3.638858, 0.9921569, 0, 1, 1,
0.9474181, 1.334082, 0.5807736, 0.9960784, 0, 1, 1,
0.9513654, -0.3673398, 0.8873873, 1, 0, 0.9960784, 1,
0.9524576, 0.2571004, 1.132249, 1, 0, 0.9882353, 1,
0.9593435, 0.6811128, 1.490343, 1, 0, 0.9843137, 1,
0.9598749, -0.6221957, 2.941039, 1, 0, 0.9764706, 1,
0.9644626, -0.2921659, 0.3510138, 1, 0, 0.972549, 1,
0.9696849, -1.300001, 2.486778, 1, 0, 0.9647059, 1,
0.9700104, 1.306227, 1.308973, 1, 0, 0.9607843, 1,
0.9742189, 0.5289099, 0.9188908, 1, 0, 0.9529412, 1,
0.9780967, -0.1747214, 1.997996, 1, 0, 0.9490196, 1,
0.9795765, -1.719031, 2.171874, 1, 0, 0.9411765, 1,
0.9858774, 0.4449078, 1.670152, 1, 0, 0.9372549, 1,
0.9898636, -0.2862641, 0.6049749, 1, 0, 0.9294118, 1,
0.9929008, 0.05885925, 1.291981, 1, 0, 0.9254902, 1,
0.9934236, 1.052295, 0.5999656, 1, 0, 0.9176471, 1,
0.9949338, -1.400639, 1.476877, 1, 0, 0.9137255, 1,
0.9969121, 1.834546, -0.574091, 1, 0, 0.9058824, 1,
1.001407, 0.8723046, 0.5054657, 1, 0, 0.9019608, 1,
1.009031, -1.234006, 2.167248, 1, 0, 0.8941177, 1,
1.010128, 0.7194528, 1.90429, 1, 0, 0.8862745, 1,
1.016131, 0.9364122, 0.2549443, 1, 0, 0.8823529, 1,
1.01657, 0.5049087, -0.1063089, 1, 0, 0.8745098, 1,
1.020557, -0.7521251, 2.283299, 1, 0, 0.8705882, 1,
1.022601, -0.2933178, 1.378865, 1, 0, 0.8627451, 1,
1.027152, 0.1937033, 1.247393, 1, 0, 0.8588235, 1,
1.029744, 1.048965, 0.8683066, 1, 0, 0.8509804, 1,
1.030468, 0.5539521, 1.480112, 1, 0, 0.8470588, 1,
1.04217, 0.2340625, 1.055166, 1, 0, 0.8392157, 1,
1.04719, 0.3559816, 0.4299012, 1, 0, 0.8352941, 1,
1.049604, -0.7376792, 2.958484, 1, 0, 0.827451, 1,
1.05056, -1.079203, 3.790074, 1, 0, 0.8235294, 1,
1.060877, -0.5853785, 2.007718, 1, 0, 0.8156863, 1,
1.066662, 0.6564209, -0.1961952, 1, 0, 0.8117647, 1,
1.067033, -0.6120484, 1.301105, 1, 0, 0.8039216, 1,
1.071587, 0.9277715, 1.814389, 1, 0, 0.7960784, 1,
1.072843, -0.6197163, 1.519183, 1, 0, 0.7921569, 1,
1.079087, -1.706038, 2.538481, 1, 0, 0.7843137, 1,
1.079365, 1.735372, 0.3966809, 1, 0, 0.7803922, 1,
1.087378, 0.7313601, 0.7840504, 1, 0, 0.772549, 1,
1.090723, -0.0256246, -0.1360721, 1, 0, 0.7686275, 1,
1.093798, 0.3814582, 0.09807187, 1, 0, 0.7607843, 1,
1.094892, 0.5168459, -1.146137, 1, 0, 0.7568628, 1,
1.09713, -0.5087167, 1.330824, 1, 0, 0.7490196, 1,
1.097592, -1.612378, 2.380303, 1, 0, 0.7450981, 1,
1.098979, -0.9502506, 2.544475, 1, 0, 0.7372549, 1,
1.104321, 0.4797403, 1.833854, 1, 0, 0.7333333, 1,
1.108622, -0.2450032, 0.1222401, 1, 0, 0.7254902, 1,
1.108794, -0.3911878, 1.614004, 1, 0, 0.7215686, 1,
1.11009, -0.4648961, 0.8395402, 1, 0, 0.7137255, 1,
1.116488, 0.09760807, 3.207794, 1, 0, 0.7098039, 1,
1.118513, 1.286024, 0.6426172, 1, 0, 0.7019608, 1,
1.131857, 1.6562, 3.696357, 1, 0, 0.6941177, 1,
1.135022, 0.5704106, -0.3375352, 1, 0, 0.6901961, 1,
1.135144, 0.9438341, 1.504444, 1, 0, 0.682353, 1,
1.143958, -0.8561376, 2.035454, 1, 0, 0.6784314, 1,
1.15146, -0.6815087, 1.284574, 1, 0, 0.6705883, 1,
1.153747, 0.269934, 1.095344, 1, 0, 0.6666667, 1,
1.157265, 1.110567, 0.6894491, 1, 0, 0.6588235, 1,
1.158521, -1.565913, 2.605855, 1, 0, 0.654902, 1,
1.159847, 0.5829862, 0.5243035, 1, 0, 0.6470588, 1,
1.172674, -1.543816, 3.528944, 1, 0, 0.6431373, 1,
1.175462, 0.1759397, 1.805269, 1, 0, 0.6352941, 1,
1.177608, -0.7189684, 0.4512615, 1, 0, 0.6313726, 1,
1.179916, -1.214814, 1.930311, 1, 0, 0.6235294, 1,
1.189333, -0.1291314, 2.100178, 1, 0, 0.6196079, 1,
1.206507, -0.9281668, 3.485845, 1, 0, 0.6117647, 1,
1.206965, -0.2209365, 1.706597, 1, 0, 0.6078432, 1,
1.207162, -0.4203523, 0.7683744, 1, 0, 0.6, 1,
1.209474, 1.311597, 0.9233585, 1, 0, 0.5921569, 1,
1.213703, -0.1834274, 1.394265, 1, 0, 0.5882353, 1,
1.220557, -1.290937, 2.302362, 1, 0, 0.5803922, 1,
1.23129, 0.299394, 1.364413, 1, 0, 0.5764706, 1,
1.231973, 0.7354817, 0.376972, 1, 0, 0.5686275, 1,
1.234188, 0.3240305, 2.400258, 1, 0, 0.5647059, 1,
1.245009, -1.065193, 2.311991, 1, 0, 0.5568628, 1,
1.252479, 0.7645627, 2.816233, 1, 0, 0.5529412, 1,
1.261441, -0.7190758, 2.507035, 1, 0, 0.5450981, 1,
1.261617, -0.4339425, 2.074811, 1, 0, 0.5411765, 1,
1.261717, 1.47189, 0.3499977, 1, 0, 0.5333334, 1,
1.264648, -0.1183619, 1.528606, 1, 0, 0.5294118, 1,
1.277748, -0.2636425, 0.3633652, 1, 0, 0.5215687, 1,
1.292182, -0.5941052, 1.355638, 1, 0, 0.5176471, 1,
1.292972, -0.6168658, 2.216057, 1, 0, 0.509804, 1,
1.295187, 0.2680874, 1.385257, 1, 0, 0.5058824, 1,
1.29533, 0.4361638, 1.267984, 1, 0, 0.4980392, 1,
1.299731, 0.4608107, 3.275912, 1, 0, 0.4901961, 1,
1.302289, 2.021938, 0.7396195, 1, 0, 0.4862745, 1,
1.312761, 0.8910376, 1.433397, 1, 0, 0.4784314, 1,
1.316188, -0.1760921, 1.252195, 1, 0, 0.4745098, 1,
1.317548, -1.022236, 2.032851, 1, 0, 0.4666667, 1,
1.319602, -2.159428, 3.765337, 1, 0, 0.4627451, 1,
1.330751, -0.3853216, 0.3491813, 1, 0, 0.454902, 1,
1.333361, 0.8105514, 0.3166803, 1, 0, 0.4509804, 1,
1.343884, -0.4275641, 0.48899, 1, 0, 0.4431373, 1,
1.344416, 0.05800845, -0.2594382, 1, 0, 0.4392157, 1,
1.353919, 0.06135741, 1.874171, 1, 0, 0.4313726, 1,
1.36233, -0.5735701, 2.349522, 1, 0, 0.427451, 1,
1.372195, -0.6841427, 2.665131, 1, 0, 0.4196078, 1,
1.38605, 1.355228, 1.16608, 1, 0, 0.4156863, 1,
1.395664, 0.04512136, -0.2206169, 1, 0, 0.4078431, 1,
1.419662, 0.006636457, 1.727101, 1, 0, 0.4039216, 1,
1.42922, 0.07200211, 0.148932, 1, 0, 0.3960784, 1,
1.431836, 1.117324, 1.175094, 1, 0, 0.3882353, 1,
1.435388, 0.4788413, 0.807089, 1, 0, 0.3843137, 1,
1.439875, -1.846722, 2.477795, 1, 0, 0.3764706, 1,
1.444039, -2.415294, 2.231307, 1, 0, 0.372549, 1,
1.444054, -1.428913, 0.7089375, 1, 0, 0.3647059, 1,
1.45021, 1.270301, 1.218852, 1, 0, 0.3607843, 1,
1.461077, 0.2199091, -0.2936717, 1, 0, 0.3529412, 1,
1.482798, -1.51337, 2.748463, 1, 0, 0.3490196, 1,
1.490414, -1.150692, 2.46564, 1, 0, 0.3411765, 1,
1.497045, 0.3180938, 2.666185, 1, 0, 0.3372549, 1,
1.497149, 0.2924277, 1.876419, 1, 0, 0.3294118, 1,
1.501126, 0.623039, 0.4853133, 1, 0, 0.3254902, 1,
1.510553, -0.3244843, 1.656915, 1, 0, 0.3176471, 1,
1.513238, 0.5427925, 2.856051, 1, 0, 0.3137255, 1,
1.516996, 0.7713754, 1.028934, 1, 0, 0.3058824, 1,
1.520426, 0.1809698, 1.134493, 1, 0, 0.2980392, 1,
1.526572, 1.423619, 0.7572779, 1, 0, 0.2941177, 1,
1.533399, -0.3716006, 3.255065, 1, 0, 0.2862745, 1,
1.558097, 0.1476873, 0.2410984, 1, 0, 0.282353, 1,
1.57456, -0.23646, 3.075583, 1, 0, 0.2745098, 1,
1.58069, -1.332669, 2.884342, 1, 0, 0.2705882, 1,
1.590356, -1.391849, 1.449927, 1, 0, 0.2627451, 1,
1.591566, 0.2143719, 3.123605, 1, 0, 0.2588235, 1,
1.601087, -1.35657, 2.849657, 1, 0, 0.2509804, 1,
1.616742, -0.8743748, 1.139585, 1, 0, 0.2470588, 1,
1.622266, 1.193165, 1.993293, 1, 0, 0.2392157, 1,
1.624988, 0.8735689, -0.2511653, 1, 0, 0.2352941, 1,
1.625504, -0.3817662, 2.861933, 1, 0, 0.227451, 1,
1.629148, 1.539018, 2.24598, 1, 0, 0.2235294, 1,
1.637593, -0.3752073, 2.231216, 1, 0, 0.2156863, 1,
1.653129, -0.6979747, 2.132608, 1, 0, 0.2117647, 1,
1.659976, -0.5884131, 1.853981, 1, 0, 0.2039216, 1,
1.663533, 0.1888521, 0.2636773, 1, 0, 0.1960784, 1,
1.694659, -1.44181, 2.815135, 1, 0, 0.1921569, 1,
1.694948, 1.39785, 1.206712, 1, 0, 0.1843137, 1,
1.700194, -0.1769632, 1.535964, 1, 0, 0.1803922, 1,
1.739214, 1.632359, -0.2829566, 1, 0, 0.172549, 1,
1.759351, -0.9870223, 0.4862461, 1, 0, 0.1686275, 1,
1.780278, -2.136738, 3.457413, 1, 0, 0.1607843, 1,
1.801458, 2.021333, 0.884097, 1, 0, 0.1568628, 1,
1.809664, 0.5677969, 1.155053, 1, 0, 0.1490196, 1,
1.834988, -1.766585, 1.463483, 1, 0, 0.145098, 1,
1.861504, -0.6387514, 2.498136, 1, 0, 0.1372549, 1,
1.871611, 1.111659, 0.9458482, 1, 0, 0.1333333, 1,
1.968719, 0.8373541, 1.648971, 1, 0, 0.1254902, 1,
2.003944, 0.04555061, 1.844301, 1, 0, 0.1215686, 1,
2.015036, 0.6879624, -0.3092014, 1, 0, 0.1137255, 1,
2.016738, -1.920757, 4.493857, 1, 0, 0.1098039, 1,
2.027819, -1.359976, 3.351791, 1, 0, 0.1019608, 1,
2.029443, -1.924394, 2.59066, 1, 0, 0.09411765, 1,
2.047544, 0.687842, 1.978828, 1, 0, 0.09019608, 1,
2.066454, 0.1457995, 1.778402, 1, 0, 0.08235294, 1,
2.068711, -0.9947681, 0.9903989, 1, 0, 0.07843138, 1,
2.108752, -2.201644, 3.030672, 1, 0, 0.07058824, 1,
2.111967, 0.9449375, 1.780527, 1, 0, 0.06666667, 1,
2.134561, 0.8910348, 0.4279834, 1, 0, 0.05882353, 1,
2.166033, -0.6999725, 1.462857, 1, 0, 0.05490196, 1,
2.18437, -1.223037, 2.356011, 1, 0, 0.04705882, 1,
2.206338, -1.249646, 1.353333, 1, 0, 0.04313726, 1,
2.264376, -0.167895, 2.695639, 1, 0, 0.03529412, 1,
2.327834, 1.105536, 0.5406821, 1, 0, 0.03137255, 1,
2.392823, -0.7863015, 2.534046, 1, 0, 0.02352941, 1,
2.467605, -0.06300227, 1.501047, 1, 0, 0.01960784, 1,
2.543606, -0.2174278, 1.481096, 1, 0, 0.01176471, 1,
2.904115, 0.4192921, 2.785984, 1, 0, 0.007843138, 1
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
-0.0684638, -4.515159, -7.293162, 0, -0.5, 0.5, 0.5,
-0.0684638, -4.515159, -7.293162, 1, -0.5, 0.5, 0.5,
-0.0684638, -4.515159, -7.293162, 1, 1.5, 0.5, 0.5,
-0.0684638, -4.515159, -7.293162, 0, 1.5, 0.5, 0.5
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
-4.048747, -0.2754713, -7.293162, 0, -0.5, 0.5, 0.5,
-4.048747, -0.2754713, -7.293162, 1, -0.5, 0.5, 0.5,
-4.048747, -0.2754713, -7.293162, 1, 1.5, 0.5, 0.5,
-4.048747, -0.2754713, -7.293162, 0, 1.5, 0.5, 0.5
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
-4.048747, -4.515159, -0.01042151, 0, -0.5, 0.5, 0.5,
-4.048747, -4.515159, -0.01042151, 1, -0.5, 0.5, 0.5,
-4.048747, -4.515159, -0.01042151, 1, 1.5, 0.5, 0.5,
-4.048747, -4.515159, -0.01042151, 0, 1.5, 0.5, 0.5
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
-3, -3.536769, -5.61253,
2, -3.536769, -5.61253,
-3, -3.536769, -5.61253,
-3, -3.699834, -5.892635,
-2, -3.536769, -5.61253,
-2, -3.699834, -5.892635,
-1, -3.536769, -5.61253,
-1, -3.699834, -5.892635,
0, -3.536769, -5.61253,
0, -3.699834, -5.892635,
1, -3.536769, -5.61253,
1, -3.699834, -5.892635,
2, -3.536769, -5.61253,
2, -3.699834, -5.892635
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
-3, -4.025964, -6.452846, 0, -0.5, 0.5, 0.5,
-3, -4.025964, -6.452846, 1, -0.5, 0.5, 0.5,
-3, -4.025964, -6.452846, 1, 1.5, 0.5, 0.5,
-3, -4.025964, -6.452846, 0, 1.5, 0.5, 0.5,
-2, -4.025964, -6.452846, 0, -0.5, 0.5, 0.5,
-2, -4.025964, -6.452846, 1, -0.5, 0.5, 0.5,
-2, -4.025964, -6.452846, 1, 1.5, 0.5, 0.5,
-2, -4.025964, -6.452846, 0, 1.5, 0.5, 0.5,
-1, -4.025964, -6.452846, 0, -0.5, 0.5, 0.5,
-1, -4.025964, -6.452846, 1, -0.5, 0.5, 0.5,
-1, -4.025964, -6.452846, 1, 1.5, 0.5, 0.5,
-1, -4.025964, -6.452846, 0, 1.5, 0.5, 0.5,
0, -4.025964, -6.452846, 0, -0.5, 0.5, 0.5,
0, -4.025964, -6.452846, 1, -0.5, 0.5, 0.5,
0, -4.025964, -6.452846, 1, 1.5, 0.5, 0.5,
0, -4.025964, -6.452846, 0, 1.5, 0.5, 0.5,
1, -4.025964, -6.452846, 0, -0.5, 0.5, 0.5,
1, -4.025964, -6.452846, 1, -0.5, 0.5, 0.5,
1, -4.025964, -6.452846, 1, 1.5, 0.5, 0.5,
1, -4.025964, -6.452846, 0, 1.5, 0.5, 0.5,
2, -4.025964, -6.452846, 0, -0.5, 0.5, 0.5,
2, -4.025964, -6.452846, 1, -0.5, 0.5, 0.5,
2, -4.025964, -6.452846, 1, 1.5, 0.5, 0.5,
2, -4.025964, -6.452846, 0, 1.5, 0.5, 0.5
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
-3.13022, -3, -5.61253,
-3.13022, 2, -5.61253,
-3.13022, -3, -5.61253,
-3.283308, -3, -5.892635,
-3.13022, -2, -5.61253,
-3.283308, -2, -5.892635,
-3.13022, -1, -5.61253,
-3.283308, -1, -5.892635,
-3.13022, 0, -5.61253,
-3.283308, 0, -5.892635,
-3.13022, 1, -5.61253,
-3.283308, 1, -5.892635,
-3.13022, 2, -5.61253,
-3.283308, 2, -5.892635
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
-3.589483, -3, -6.452846, 0, -0.5, 0.5, 0.5,
-3.589483, -3, -6.452846, 1, -0.5, 0.5, 0.5,
-3.589483, -3, -6.452846, 1, 1.5, 0.5, 0.5,
-3.589483, -3, -6.452846, 0, 1.5, 0.5, 0.5,
-3.589483, -2, -6.452846, 0, -0.5, 0.5, 0.5,
-3.589483, -2, -6.452846, 1, -0.5, 0.5, 0.5,
-3.589483, -2, -6.452846, 1, 1.5, 0.5, 0.5,
-3.589483, -2, -6.452846, 0, 1.5, 0.5, 0.5,
-3.589483, -1, -6.452846, 0, -0.5, 0.5, 0.5,
-3.589483, -1, -6.452846, 1, -0.5, 0.5, 0.5,
-3.589483, -1, -6.452846, 1, 1.5, 0.5, 0.5,
-3.589483, -1, -6.452846, 0, 1.5, 0.5, 0.5,
-3.589483, 0, -6.452846, 0, -0.5, 0.5, 0.5,
-3.589483, 0, -6.452846, 1, -0.5, 0.5, 0.5,
-3.589483, 0, -6.452846, 1, 1.5, 0.5, 0.5,
-3.589483, 0, -6.452846, 0, 1.5, 0.5, 0.5,
-3.589483, 1, -6.452846, 0, -0.5, 0.5, 0.5,
-3.589483, 1, -6.452846, 1, -0.5, 0.5, 0.5,
-3.589483, 1, -6.452846, 1, 1.5, 0.5, 0.5,
-3.589483, 1, -6.452846, 0, 1.5, 0.5, 0.5,
-3.589483, 2, -6.452846, 0, -0.5, 0.5, 0.5,
-3.589483, 2, -6.452846, 1, -0.5, 0.5, 0.5,
-3.589483, 2, -6.452846, 1, 1.5, 0.5, 0.5,
-3.589483, 2, -6.452846, 0, 1.5, 0.5, 0.5
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
-3.13022, -3.536769, -4,
-3.13022, -3.536769, 4,
-3.13022, -3.536769, -4,
-3.283308, -3.699834, -4,
-3.13022, -3.536769, -2,
-3.283308, -3.699834, -2,
-3.13022, -3.536769, 0,
-3.283308, -3.699834, 0,
-3.13022, -3.536769, 2,
-3.283308, -3.699834, 2,
-3.13022, -3.536769, 4,
-3.283308, -3.699834, 4
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
-3.589483, -4.025964, -4, 0, -0.5, 0.5, 0.5,
-3.589483, -4.025964, -4, 1, -0.5, 0.5, 0.5,
-3.589483, -4.025964, -4, 1, 1.5, 0.5, 0.5,
-3.589483, -4.025964, -4, 0, 1.5, 0.5, 0.5,
-3.589483, -4.025964, -2, 0, -0.5, 0.5, 0.5,
-3.589483, -4.025964, -2, 1, -0.5, 0.5, 0.5,
-3.589483, -4.025964, -2, 1, 1.5, 0.5, 0.5,
-3.589483, -4.025964, -2, 0, 1.5, 0.5, 0.5,
-3.589483, -4.025964, 0, 0, -0.5, 0.5, 0.5,
-3.589483, -4.025964, 0, 1, -0.5, 0.5, 0.5,
-3.589483, -4.025964, 0, 1, 1.5, 0.5, 0.5,
-3.589483, -4.025964, 0, 0, 1.5, 0.5, 0.5,
-3.589483, -4.025964, 2, 0, -0.5, 0.5, 0.5,
-3.589483, -4.025964, 2, 1, -0.5, 0.5, 0.5,
-3.589483, -4.025964, 2, 1, 1.5, 0.5, 0.5,
-3.589483, -4.025964, 2, 0, 1.5, 0.5, 0.5,
-3.589483, -4.025964, 4, 0, -0.5, 0.5, 0.5,
-3.589483, -4.025964, 4, 1, -0.5, 0.5, 0.5,
-3.589483, -4.025964, 4, 1, 1.5, 0.5, 0.5,
-3.589483, -4.025964, 4, 0, 1.5, 0.5, 0.5
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
-3.13022, -3.536769, -5.61253,
-3.13022, 2.985827, -5.61253,
-3.13022, -3.536769, 5.591687,
-3.13022, 2.985827, 5.591687,
-3.13022, -3.536769, -5.61253,
-3.13022, -3.536769, 5.591687,
-3.13022, 2.985827, -5.61253,
-3.13022, 2.985827, 5.591687,
-3.13022, -3.536769, -5.61253,
2.993292, -3.536769, -5.61253,
-3.13022, -3.536769, 5.591687,
2.993292, -3.536769, 5.591687,
-3.13022, 2.985827, -5.61253,
2.993292, 2.985827, -5.61253,
-3.13022, 2.985827, 5.591687,
2.993292, 2.985827, 5.591687,
2.993292, -3.536769, -5.61253,
2.993292, 2.985827, -5.61253,
2.993292, -3.536769, 5.591687,
2.993292, 2.985827, 5.591687,
2.993292, -3.536769, -5.61253,
2.993292, -3.536769, 5.591687,
2.993292, 2.985827, -5.61253,
2.993292, 2.985827, 5.591687
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
var radius = 7.656175;
var distance = 34.06319;
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
mvMatrix.translate( 0.0684638, 0.2754713, 0.01042151 );
mvMatrix.scale( 1.35184, 1.269127, 0.7388295 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06319);
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
metoxuron<-read.table("metoxuron.xyz")
```

```
## Error in read.table("metoxuron.xyz"): no lines available in input
```

```r
x<-metoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metoxuron' not found
```

```r
y<-metoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metoxuron' not found
```

```r
z<-metoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metoxuron' not found
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
-3.041043, 0.1246713, -1.219921, 0, 0, 1, 1, 1,
-2.702534, 0.4153011, -0.6994637, 1, 0, 0, 1, 1,
-2.668696, -0.6997258, -1.736899, 1, 0, 0, 1, 1,
-2.630996, -0.2089084, -2.75689, 1, 0, 0, 1, 1,
-2.551015, 0.8499872, -1.381004, 1, 0, 0, 1, 1,
-2.452204, -0.2507537, -1.810689, 1, 0, 0, 1, 1,
-2.444084, -0.7659927, -3.383481, 0, 0, 0, 1, 1,
-2.356092, -0.6174897, -0.5875767, 0, 0, 0, 1, 1,
-2.347314, -0.2829569, -1.009558, 0, 0, 0, 1, 1,
-2.341725, 1.181759, -0.3829274, 0, 0, 0, 1, 1,
-2.295432, -0.7112545, -1.436286, 0, 0, 0, 1, 1,
-2.287076, -1.161439, -1.670837, 0, 0, 0, 1, 1,
-2.242285, -0.6252087, -1.900494, 0, 0, 0, 1, 1,
-2.229639, 0.3126493, -2.609242, 1, 1, 1, 1, 1,
-2.220509, -0.26657, -2.081566, 1, 1, 1, 1, 1,
-2.202132, 1.537363, -1.353993, 1, 1, 1, 1, 1,
-2.180477, -0.7133511, -2.523086, 1, 1, 1, 1, 1,
-2.176715, -1.061891, -1.539248, 1, 1, 1, 1, 1,
-2.138872, 1.113184, -0.2503216, 1, 1, 1, 1, 1,
-2.136082, -0.2038881, -1.883974, 1, 1, 1, 1, 1,
-2.126177, 1.557371, -1.51601, 1, 1, 1, 1, 1,
-2.114144, -1.127297, -1.262423, 1, 1, 1, 1, 1,
-2.092597, 0.7680039, -0.7186069, 1, 1, 1, 1, 1,
-2.081314, 0.1737082, -2.837101, 1, 1, 1, 1, 1,
-2.076843, 0.7824535, -1.085777, 1, 1, 1, 1, 1,
-2.072704, -0.1877693, -2.036869, 1, 1, 1, 1, 1,
-2.051583, -1.746534, -0.8404282, 1, 1, 1, 1, 1,
-2.038087, -0.007583766, -1.716432, 1, 1, 1, 1, 1,
-2.020873, -1.59106, -2.538063, 0, 0, 1, 1, 1,
-2.018182, 0.7231503, -1.740786, 1, 0, 0, 1, 1,
-1.994845, 0.03297317, -2.632736, 1, 0, 0, 1, 1,
-1.985655, 0.2755708, -1.586265, 1, 0, 0, 1, 1,
-1.982579, 0.9655288, -0.7187683, 1, 0, 0, 1, 1,
-1.977999, 0.5777553, -2.656178, 1, 0, 0, 1, 1,
-1.960877, 2.170024, 0.4891569, 0, 0, 0, 1, 1,
-1.958183, -1.090772, -1.730549, 0, 0, 0, 1, 1,
-1.943659, -0.6703265, -1.906225, 0, 0, 0, 1, 1,
-1.934638, 1.263417, -1.516577, 0, 0, 0, 1, 1,
-1.933661, 0.5078804, -1.78463, 0, 0, 0, 1, 1,
-1.921875, 2.526034, -0.5474988, 0, 0, 0, 1, 1,
-1.86809, -0.3570948, -2.727947, 0, 0, 0, 1, 1,
-1.867201, -0.1826628, -2.29884, 1, 1, 1, 1, 1,
-1.8396, -0.305993, -1.999908, 1, 1, 1, 1, 1,
-1.824169, 0.7291015, -1.855475, 1, 1, 1, 1, 1,
-1.823063, -0.3696505, -1.538022, 1, 1, 1, 1, 1,
-1.807946, -0.7366102, -1.603267, 1, 1, 1, 1, 1,
-1.805312, -1.731814, -2.396028, 1, 1, 1, 1, 1,
-1.782389, 0.551716, -1.591482, 1, 1, 1, 1, 1,
-1.773799, 2.4435, -0.794425, 1, 1, 1, 1, 1,
-1.745927, -0.658213, -1.362997, 1, 1, 1, 1, 1,
-1.74354, -1.026602, -1.725274, 1, 1, 1, 1, 1,
-1.702018, -0.01886864, -1.402677, 1, 1, 1, 1, 1,
-1.689175, -0.8077744, -1.388893, 1, 1, 1, 1, 1,
-1.685269, 1.681828, -0.7413567, 1, 1, 1, 1, 1,
-1.68468, 0.3866182, -1.471278, 1, 1, 1, 1, 1,
-1.67603, 0.9484175, -0.8038601, 1, 1, 1, 1, 1,
-1.658795, -0.650439, -1.138771, 0, 0, 1, 1, 1,
-1.637305, -1.006744, -2.684173, 1, 0, 0, 1, 1,
-1.620301, -0.3278735, -2.73503, 1, 0, 0, 1, 1,
-1.612332, -0.221806, -1.693818, 1, 0, 0, 1, 1,
-1.594497, -1.345795, -3.917542, 1, 0, 0, 1, 1,
-1.586168, -0.5097561, -2.709359, 1, 0, 0, 1, 1,
-1.583649, -0.2411678, -1.0429, 0, 0, 0, 1, 1,
-1.572612, -1.638788, -3.328114, 0, 0, 0, 1, 1,
-1.562202, -0.7574489, -2.67066, 0, 0, 0, 1, 1,
-1.555352, 0.01328837, -0.9150981, 0, 0, 0, 1, 1,
-1.554748, 0.6714222, -0.4183198, 0, 0, 0, 1, 1,
-1.549972, -0.0620507, 0.1913893, 0, 0, 0, 1, 1,
-1.535566, -0.4066694, -2.571136, 0, 0, 0, 1, 1,
-1.532634, 0.5907025, -1.382296, 1, 1, 1, 1, 1,
-1.522888, 0.4510634, -1.026779, 1, 1, 1, 1, 1,
-1.522572, 1.333084, 0.526008, 1, 1, 1, 1, 1,
-1.51789, -0.5863816, -1.697815, 1, 1, 1, 1, 1,
-1.515605, -0.9017723, -1.965284, 1, 1, 1, 1, 1,
-1.492942, 2.868348, 0.6372151, 1, 1, 1, 1, 1,
-1.483516, 0.1185391, -3.139788, 1, 1, 1, 1, 1,
-1.471048, 1.279704, -1.066308, 1, 1, 1, 1, 1,
-1.46984, -0.5123371, -2.061922, 1, 1, 1, 1, 1,
-1.467194, -1.485494, -3.238542, 1, 1, 1, 1, 1,
-1.463124, -0.8927292, -4.329168, 1, 1, 1, 1, 1,
-1.462074, 0.8892879, -2.76308, 1, 1, 1, 1, 1,
-1.454636, 0.1872116, -0.9374419, 1, 1, 1, 1, 1,
-1.447736, -0.4017955, -1.854693, 1, 1, 1, 1, 1,
-1.442401, 2.10013, 0.1371581, 1, 1, 1, 1, 1,
-1.428307, 0.5371256, -0.9121219, 0, 0, 1, 1, 1,
-1.420746, 1.372417, -0.2245566, 1, 0, 0, 1, 1,
-1.41922, 0.253851, -0.8301574, 1, 0, 0, 1, 1,
-1.419082, -1.868849, -0.6864576, 1, 0, 0, 1, 1,
-1.417801, -0.754595, -1.880905, 1, 0, 0, 1, 1,
-1.414991, 0.09526174, -1.215599, 1, 0, 0, 1, 1,
-1.399994, 0.4724884, -1.037077, 0, 0, 0, 1, 1,
-1.397896, -0.910486, -3.453194, 0, 0, 0, 1, 1,
-1.39079, -1.681341, -2.485124, 0, 0, 0, 1, 1,
-1.383856, 0.5966079, -2.377747, 0, 0, 0, 1, 1,
-1.382872, 1.293381, -1.12846, 0, 0, 0, 1, 1,
-1.353459, -0.8134405, -0.678611, 0, 0, 0, 1, 1,
-1.351925, 0.1364035, -1.507974, 0, 0, 0, 1, 1,
-1.346328, 0.1796339, 0.1254752, 1, 1, 1, 1, 1,
-1.342571, -0.1008691, -2.084275, 1, 1, 1, 1, 1,
-1.337008, 0.3270541, -0.9887465, 1, 1, 1, 1, 1,
-1.32244, 0.9967193, -0.5625919, 1, 1, 1, 1, 1,
-1.320919, 1.632046, -0.274028, 1, 1, 1, 1, 1,
-1.30873, -0.3215744, -1.830517, 1, 1, 1, 1, 1,
-1.305458, -0.9386446, -2.61708, 1, 1, 1, 1, 1,
-1.30442, -0.9508003, -2.882802, 1, 1, 1, 1, 1,
-1.298263, -0.2572836, -0.6382142, 1, 1, 1, 1, 1,
-1.293842, 0.9387652, -0.4276568, 1, 1, 1, 1, 1,
-1.29264, 1.975698, 0.2849958, 1, 1, 1, 1, 1,
-1.287303, -1.406517, -2.714414, 1, 1, 1, 1, 1,
-1.27972, 0.2696385, -1.96258, 1, 1, 1, 1, 1,
-1.277939, 1.836088, -0.4922721, 1, 1, 1, 1, 1,
-1.272329, 0.2196658, -2.354575, 1, 1, 1, 1, 1,
-1.249893, 0.3363413, -1.863775, 0, 0, 1, 1, 1,
-1.247606, 1.706218, -0.623875, 1, 0, 0, 1, 1,
-1.242461, -0.02557268, -1.025465, 1, 0, 0, 1, 1,
-1.235914, -0.4951649, -1.53954, 1, 0, 0, 1, 1,
-1.235092, -0.5927978, -1.938063, 1, 0, 0, 1, 1,
-1.231393, 0.6317475, -1.086239, 1, 0, 0, 1, 1,
-1.228536, 0.7947287, -0.9629023, 0, 0, 0, 1, 1,
-1.214291, -0.757471, -1.584074, 0, 0, 0, 1, 1,
-1.209806, 0.4265133, -2.798852, 0, 0, 0, 1, 1,
-1.207439, 0.6143806, -0.9053544, 0, 0, 0, 1, 1,
-1.205162, -0.1541143, -2.402337, 0, 0, 0, 1, 1,
-1.199604, 1.038491, -1.80314, 0, 0, 0, 1, 1,
-1.198941, -0.3904315, -1.796553, 0, 0, 0, 1, 1,
-1.196988, -1.083109, -3.314854, 1, 1, 1, 1, 1,
-1.181626, 0.7744094, 0.6626786, 1, 1, 1, 1, 1,
-1.177845, 1.059233, 0.1246934, 1, 1, 1, 1, 1,
-1.177474, -0.2469653, -1.394841, 1, 1, 1, 1, 1,
-1.171116, 1.866986, -1.05431, 1, 1, 1, 1, 1,
-1.166258, -1.767837, -3.473344, 1, 1, 1, 1, 1,
-1.164814, 0.4815112, 0.2251378, 1, 1, 1, 1, 1,
-1.162466, -0.5771462, -2.635907, 1, 1, 1, 1, 1,
-1.158452, -0.02300303, -2.223412, 1, 1, 1, 1, 1,
-1.150761, -0.07764757, -1.184041, 1, 1, 1, 1, 1,
-1.14481, -0.3886467, -3.55901, 1, 1, 1, 1, 1,
-1.138964, -1.517425, -4.465368, 1, 1, 1, 1, 1,
-1.138858, 2.171193, -0.3096488, 1, 1, 1, 1, 1,
-1.134682, 1.378121, -0.08643444, 1, 1, 1, 1, 1,
-1.132244, 0.3303326, -1.031325, 1, 1, 1, 1, 1,
-1.130294, -0.6738051, -2.591717, 0, 0, 1, 1, 1,
-1.125613, -0.4209141, -1.65272, 1, 0, 0, 1, 1,
-1.099474, 0.760788, -0.3159711, 1, 0, 0, 1, 1,
-1.086544, -1.089508, -3.252055, 1, 0, 0, 1, 1,
-1.082301, 0.1682586, -0.9880624, 1, 0, 0, 1, 1,
-1.078334, 0.6184064, -2.058805, 1, 0, 0, 1, 1,
-1.0778, 0.08568621, -1.666624, 0, 0, 0, 1, 1,
-1.076254, -0.4030584, -2.164015, 0, 0, 0, 1, 1,
-1.071035, -0.7733167, -1.4963, 0, 0, 0, 1, 1,
-1.069347, 0.231371, -2.035198, 0, 0, 0, 1, 1,
-1.062513, 0.06368846, -1.337583, 0, 0, 0, 1, 1,
-1.052998, -3.44178, -1.239581, 0, 0, 0, 1, 1,
-1.048981, -0.5904513, -3.002523, 0, 0, 0, 1, 1,
-1.045716, -0.1930849, -2.041143, 1, 1, 1, 1, 1,
-1.044538, -0.2915759, -0.6097893, 1, 1, 1, 1, 1,
-1.043911, 0.8555223, -2.245812, 1, 1, 1, 1, 1,
-1.043074, 0.9459122, -1.859545, 1, 1, 1, 1, 1,
-1.041666, 0.3821916, -2.417343, 1, 1, 1, 1, 1,
-1.032769, -0.7999397, -0.6439986, 1, 1, 1, 1, 1,
-1.029634, -0.9401374, -2.62802, 1, 1, 1, 1, 1,
-1.029341, 1.70277, -1.616466, 1, 1, 1, 1, 1,
-1.029115, 1.010461, 1.234637, 1, 1, 1, 1, 1,
-1.010464, -0.4901276, -3.470546, 1, 1, 1, 1, 1,
-1.00888, -0.5290068, -1.889783, 1, 1, 1, 1, 1,
-1.005024, -2.611748, -3.315523, 1, 1, 1, 1, 1,
-1.004234, 1.081043, -2.339539, 1, 1, 1, 1, 1,
-1.003606, 0.1867331, -2.149628, 1, 1, 1, 1, 1,
-1.002207, 1.166308, 0.7665686, 1, 1, 1, 1, 1,
-0.9972293, 1.110451, -0.884368, 0, 0, 1, 1, 1,
-0.9897321, 1.958677, -0.01456534, 1, 0, 0, 1, 1,
-0.9872674, -0.535502, -0.149269, 1, 0, 0, 1, 1,
-0.9871806, 1.590146, -1.548406, 1, 0, 0, 1, 1,
-0.9767309, 0.2015941, -0.4703738, 1, 0, 0, 1, 1,
-0.9762629, -0.496361, -1.213009, 1, 0, 0, 1, 1,
-0.9732966, -0.2268666, -0.8534094, 0, 0, 0, 1, 1,
-0.9668112, 0.7149844, -0.6214802, 0, 0, 0, 1, 1,
-0.9657013, 0.8055563, -1.505119, 0, 0, 0, 1, 1,
-0.9626284, 1.137119, 1.530999, 0, 0, 0, 1, 1,
-0.9579119, -0.3849441, -2.429614, 0, 0, 0, 1, 1,
-0.9573703, -0.4290881, -1.572817, 0, 0, 0, 1, 1,
-0.9454208, 0.8579428, -0.4774763, 0, 0, 0, 1, 1,
-0.9390374, 0.7178183, -0.7955882, 1, 1, 1, 1, 1,
-0.9368454, -0.7482033, -2.083921, 1, 1, 1, 1, 1,
-0.935679, 0.4407085, 0.1669797, 1, 1, 1, 1, 1,
-0.9306769, -0.09374055, -0.9754451, 1, 1, 1, 1, 1,
-0.9213518, 0.4054164, -2.108738, 1, 1, 1, 1, 1,
-0.9152841, 0.8627239, -1.548768, 1, 1, 1, 1, 1,
-0.9145142, 2.403212, 0.3785843, 1, 1, 1, 1, 1,
-0.9134422, 0.09078804, -2.444953, 1, 1, 1, 1, 1,
-0.9091553, 0.0006029863, 0.2817068, 1, 1, 1, 1, 1,
-0.9047218, -0.3076862, -1.144801, 1, 1, 1, 1, 1,
-0.9038439, 0.9191342, 1.465432, 1, 1, 1, 1, 1,
-0.901021, 0.6018136, -2.670445, 1, 1, 1, 1, 1,
-0.9009573, -0.3122832, -1.146601, 1, 1, 1, 1, 1,
-0.9002393, 0.988171, -1.831017, 1, 1, 1, 1, 1,
-0.8945798, -1.159157, -2.184299, 1, 1, 1, 1, 1,
-0.892763, -0.2614373, -1.145677, 0, 0, 1, 1, 1,
-0.8918236, 0.1562784, -0.8706489, 1, 0, 0, 1, 1,
-0.8901979, -0.9323013, -1.951451, 1, 0, 0, 1, 1,
-0.8871523, 0.7150218, -0.8332203, 1, 0, 0, 1, 1,
-0.8869179, -0.7843095, -2.407369, 1, 0, 0, 1, 1,
-0.8843099, 1.014241, -3.011209, 1, 0, 0, 1, 1,
-0.8841366, -1.113677, -4.02028, 0, 0, 0, 1, 1,
-0.875743, -0.8228867, -1.033747, 0, 0, 0, 1, 1,
-0.8713275, -0.3034055, -2.503705, 0, 0, 0, 1, 1,
-0.8704901, 0.4845448, -1.319699, 0, 0, 0, 1, 1,
-0.8683105, -0.6389001, -1.016023, 0, 0, 0, 1, 1,
-0.8681347, -0.7519966, -2.479037, 0, 0, 0, 1, 1,
-0.8679764, -0.03566023, -0.9535779, 0, 0, 0, 1, 1,
-0.8635001, 0.973218, -1.704669, 1, 1, 1, 1, 1,
-0.8629351, 1.111914, -1.107088, 1, 1, 1, 1, 1,
-0.8618985, -0.7577131, -3.242967, 1, 1, 1, 1, 1,
-0.8533182, 1.651922, -0.9898843, 1, 1, 1, 1, 1,
-0.852724, -0.1054749, -2.261491, 1, 1, 1, 1, 1,
-0.8455005, -1.180245, -3.961486, 1, 1, 1, 1, 1,
-0.8421691, 1.319058, -2.560555, 1, 1, 1, 1, 1,
-0.8384817, -0.8444207, -0.6770942, 1, 1, 1, 1, 1,
-0.8375304, 1.031988, 0.1540414, 1, 1, 1, 1, 1,
-0.8352016, -0.3935067, -2.321258, 1, 1, 1, 1, 1,
-0.831257, 1.956765, -0.6227792, 1, 1, 1, 1, 1,
-0.8277918, 0.3894224, -0.3918169, 1, 1, 1, 1, 1,
-0.826888, -0.3940974, -1.323089, 1, 1, 1, 1, 1,
-0.8226588, 2.102232, -0.1471203, 1, 1, 1, 1, 1,
-0.8202999, -1.3628, -1.424758, 1, 1, 1, 1, 1,
-0.8137272, -0.0376833, -3.130041, 0, 0, 1, 1, 1,
-0.8133546, 0.22452, -0.5409662, 1, 0, 0, 1, 1,
-0.8122808, -0.2714985, 0.5132352, 1, 0, 0, 1, 1,
-0.8122166, -0.9731644, -2.982284, 1, 0, 0, 1, 1,
-0.8059966, 0.08321699, -0.9601974, 1, 0, 0, 1, 1,
-0.8050579, -1.216971, -1.876409, 1, 0, 0, 1, 1,
-0.7986208, 0.3457296, -0.5472336, 0, 0, 0, 1, 1,
-0.7958236, -0.6319489, -3.487854, 0, 0, 0, 1, 1,
-0.7945474, 0.3813677, -1.057144, 0, 0, 0, 1, 1,
-0.7906553, -0.7804912, -3.771424, 0, 0, 0, 1, 1,
-0.7891502, 1.052435, 0.4228239, 0, 0, 0, 1, 1,
-0.7859314, -0.8775135, -3.05398, 0, 0, 0, 1, 1,
-0.7856393, 0.4443682, -1.6068, 0, 0, 0, 1, 1,
-0.7830154, -1.552604, -0.8974285, 1, 1, 1, 1, 1,
-0.7801219, 0.7059148, -2.572628, 1, 1, 1, 1, 1,
-0.7789686, -0.7014659, -1.053948, 1, 1, 1, 1, 1,
-0.7731049, -0.9256267, -1.981218, 1, 1, 1, 1, 1,
-0.7660173, -0.9324812, -0.8374159, 1, 1, 1, 1, 1,
-0.7659441, -1.6223, -1.983584, 1, 1, 1, 1, 1,
-0.7654171, -0.07503738, -1.092295, 1, 1, 1, 1, 1,
-0.761647, -0.1104157, -1.67613, 1, 1, 1, 1, 1,
-0.7600226, -2.640762, -2.395703, 1, 1, 1, 1, 1,
-0.7596537, -1.21151, -0.480547, 1, 1, 1, 1, 1,
-0.7587104, 0.7631171, -0.9894251, 1, 1, 1, 1, 1,
-0.7451884, 0.1012961, -0.7349115, 1, 1, 1, 1, 1,
-0.744849, 0.6965935, -0.4644127, 1, 1, 1, 1, 1,
-0.7448439, -0.01256734, -0.5899135, 1, 1, 1, 1, 1,
-0.7427649, -1.296479, -3.549613, 1, 1, 1, 1, 1,
-0.7424755, 1.603793, -0.3364874, 0, 0, 1, 1, 1,
-0.7423857, 1.066565, 0.4233927, 1, 0, 0, 1, 1,
-0.7411281, 1.672256, -1.073743, 1, 0, 0, 1, 1,
-0.7395142, 2.453008, 1.719758, 1, 0, 0, 1, 1,
-0.7387241, 0.8073034, -0.9909467, 1, 0, 0, 1, 1,
-0.735381, 0.6312339, -0.7241127, 1, 0, 0, 1, 1,
-0.734273, 1.38044, -0.1734174, 0, 0, 0, 1, 1,
-0.7330783, -0.1985465, -2.726038, 0, 0, 0, 1, 1,
-0.7330682, -1.818434, -1.681751, 0, 0, 0, 1, 1,
-0.7295275, 0.4751982, -2.223053, 0, 0, 0, 1, 1,
-0.7293086, 0.2316692, 0.2560146, 0, 0, 0, 1, 1,
-0.7277886, -0.2791084, -2.265052, 0, 0, 0, 1, 1,
-0.7184382, 0.08256652, -0.9372954, 0, 0, 0, 1, 1,
-0.7170386, 0.7198406, -0.8600997, 1, 1, 1, 1, 1,
-0.7133523, 0.2305475, -2.1767, 1, 1, 1, 1, 1,
-0.709215, -0.8164625, -0.7004373, 1, 1, 1, 1, 1,
-0.7050363, 0.001099615, -1.307651, 1, 1, 1, 1, 1,
-0.7042694, 0.5601209, -1.592615, 1, 1, 1, 1, 1,
-0.7025054, 0.08509601, -2.128252, 1, 1, 1, 1, 1,
-0.698743, -1.248907, -3.801515, 1, 1, 1, 1, 1,
-0.6979685, 0.5472238, 0.5347602, 1, 1, 1, 1, 1,
-0.69754, -1.11852, -1.799634, 1, 1, 1, 1, 1,
-0.694027, -0.6461278, -2.001166, 1, 1, 1, 1, 1,
-0.68884, -0.265378, -2.801764, 1, 1, 1, 1, 1,
-0.6876146, -0.8366602, -2.676933, 1, 1, 1, 1, 1,
-0.6843541, 0.1999228, 0.7678345, 1, 1, 1, 1, 1,
-0.6840497, 1.850886, -0.4070663, 1, 1, 1, 1, 1,
-0.6797532, 1.731284, 0.527313, 1, 1, 1, 1, 1,
-0.6779233, 0.2369371, -2.218681, 0, 0, 1, 1, 1,
-0.6756751, -1.938565, -3.528991, 1, 0, 0, 1, 1,
-0.6742303, -0.974404, -1.95773, 1, 0, 0, 1, 1,
-0.6680202, 0.3215297, -0.8480462, 1, 0, 0, 1, 1,
-0.6674866, 0.783577, -0.6670926, 1, 0, 0, 1, 1,
-0.665554, -1.566044, -1.152069, 1, 0, 0, 1, 1,
-0.6654788, 0.9971536, 0.9895052, 0, 0, 0, 1, 1,
-0.6619807, 0.5209052, -1.029086, 0, 0, 0, 1, 1,
-0.6599536, -1.245669, -1.580885, 0, 0, 0, 1, 1,
-0.6598082, 2.71772, -0.2730443, 0, 0, 0, 1, 1,
-0.6593986, 0.5267012, -1.034696, 0, 0, 0, 1, 1,
-0.6586024, 1.004662, -2.091446, 0, 0, 0, 1, 1,
-0.6572428, -2.224032, -4.368845, 0, 0, 0, 1, 1,
-0.646706, -0.707392, -3.405974, 1, 1, 1, 1, 1,
-0.6449634, 0.44231, -0.5445537, 1, 1, 1, 1, 1,
-0.6447909, -1.66243, -3.167683, 1, 1, 1, 1, 1,
-0.644173, -0.5388182, -0.7981669, 1, 1, 1, 1, 1,
-0.6418195, 1.213143, 0.4315755, 1, 1, 1, 1, 1,
-0.6364282, -1.190708, -2.280423, 1, 1, 1, 1, 1,
-0.6363847, -0.0413744, -1.4417, 1, 1, 1, 1, 1,
-0.6343524, 0.3332875, -0.984377, 1, 1, 1, 1, 1,
-0.6331919, 0.7674772, -1.178709, 1, 1, 1, 1, 1,
-0.6288344, -1.804645, -3.362828, 1, 1, 1, 1, 1,
-0.6263121, -0.5516459, -2.008467, 1, 1, 1, 1, 1,
-0.6247559, -1.305077, -2.928292, 1, 1, 1, 1, 1,
-0.6228456, -1.500056, -1.766312, 1, 1, 1, 1, 1,
-0.617918, 0.09852175, 0.03305632, 1, 1, 1, 1, 1,
-0.6162994, 0.326349, 0.2085752, 1, 1, 1, 1, 1,
-0.615136, 0.4182639, 1.246652, 0, 0, 1, 1, 1,
-0.6061864, -0.3524359, -2.260385, 1, 0, 0, 1, 1,
-0.6038748, 0.3011904, -1.384817, 1, 0, 0, 1, 1,
-0.5990269, -1.956871, -3.653697, 1, 0, 0, 1, 1,
-0.5936015, -0.4308902, -2.811433, 1, 0, 0, 1, 1,
-0.5818093, 1.327098, 0.9084383, 1, 0, 0, 1, 1,
-0.5783543, 1.382325, -2.88841, 0, 0, 0, 1, 1,
-0.5745002, -1.24777, -3.082745, 0, 0, 0, 1, 1,
-0.573976, -1.137382, -2.455808, 0, 0, 0, 1, 1,
-0.5734043, -1.021939, -2.676666, 0, 0, 0, 1, 1,
-0.5690993, -0.2714422, -0.6081128, 0, 0, 0, 1, 1,
-0.5639121, 1.509863, -0.3335883, 0, 0, 0, 1, 1,
-0.561579, 0.3761411, -0.7993337, 0, 0, 0, 1, 1,
-0.5590296, 0.5277224, -0.9255422, 1, 1, 1, 1, 1,
-0.5499859, 0.9549174, -2.303981, 1, 1, 1, 1, 1,
-0.5497979, -1.199187, -4.011835, 1, 1, 1, 1, 1,
-0.549592, -1.203001, -2.220217, 1, 1, 1, 1, 1,
-0.5472775, 0.5590481, -0.9389338, 1, 1, 1, 1, 1,
-0.5392827, 0.1716734, 0.253026, 1, 1, 1, 1, 1,
-0.5352896, -0.7321944, -2.086719, 1, 1, 1, 1, 1,
-0.5341135, -0.01667266, -1.5944, 1, 1, 1, 1, 1,
-0.5334443, 1.518914, 0.6236145, 1, 1, 1, 1, 1,
-0.5271137, 0.5531768, -1.118363, 1, 1, 1, 1, 1,
-0.5147715, -0.2778397, -2.413156, 1, 1, 1, 1, 1,
-0.5141262, 1.11814, -0.4676899, 1, 1, 1, 1, 1,
-0.5112236, -0.9639977, -3.633977, 1, 1, 1, 1, 1,
-0.5068653, -0.194059, -2.833894, 1, 1, 1, 1, 1,
-0.5046023, -1.098703, -3.001933, 1, 1, 1, 1, 1,
-0.4993295, -1.110597, -2.294575, 0, 0, 1, 1, 1,
-0.4964282, 0.4503481, -1.774296, 1, 0, 0, 1, 1,
-0.4863709, -0.284859, -2.710174, 1, 0, 0, 1, 1,
-0.4830349, -1.079138, -3.559528, 1, 0, 0, 1, 1,
-0.4780708, 0.4084345, -0.8260273, 1, 0, 0, 1, 1,
-0.4668039, 2.446563, -0.1907021, 1, 0, 0, 1, 1,
-0.4647109, -0.191453, -1.783157, 0, 0, 0, 1, 1,
-0.4639525, -0.131575, -1.618219, 0, 0, 0, 1, 1,
-0.4603066, 1.945521, 0.6287531, 0, 0, 0, 1, 1,
-0.4563856, 1.666914, -0.8558729, 0, 0, 0, 1, 1,
-0.4546701, 1.118425, -0.03939667, 0, 0, 0, 1, 1,
-0.4527029, -1.744797, -2.847925, 0, 0, 0, 1, 1,
-0.4411801, -0.01255761, -0.8983282, 0, 0, 0, 1, 1,
-0.4390425, -0.6094686, -3.091269, 1, 1, 1, 1, 1,
-0.4360768, 0.3980112, 0.4588372, 1, 1, 1, 1, 1,
-0.4360721, 0.8281496, -0.6889841, 1, 1, 1, 1, 1,
-0.431305, 0.08627211, -3.153864, 1, 1, 1, 1, 1,
-0.4298761, -1.033914, -1.707592, 1, 1, 1, 1, 1,
-0.4287225, -1.575023, -3.795855, 1, 1, 1, 1, 1,
-0.4237682, -0.09844693, -1.819569, 1, 1, 1, 1, 1,
-0.4231625, 0.07509504, -1.188995, 1, 1, 1, 1, 1,
-0.4193486, 1.415067, -0.6780292, 1, 1, 1, 1, 1,
-0.4183818, -1.183218, -3.611569, 1, 1, 1, 1, 1,
-0.4118981, 1.071287, -0.6973363, 1, 1, 1, 1, 1,
-0.4079177, -0.2412502, -0.6140049, 1, 1, 1, 1, 1,
-0.4063183, 2.045586, 1.473778, 1, 1, 1, 1, 1,
-0.4034503, -0.3321508, -2.086488, 1, 1, 1, 1, 1,
-0.4020959, -0.7171997, -2.671906, 1, 1, 1, 1, 1,
-0.4015193, -0.8467818, -1.728715, 0, 0, 1, 1, 1,
-0.4009509, 0.1696416, -1.786113, 1, 0, 0, 1, 1,
-0.3990138, 2.128287, -0.4511182, 1, 0, 0, 1, 1,
-0.3976148, 0.6257178, -1.796153, 1, 0, 0, 1, 1,
-0.3956486, 0.1780174, 0.3684111, 1, 0, 0, 1, 1,
-0.3954885, -0.2325709, 0.04643229, 1, 0, 0, 1, 1,
-0.3953755, -0.08608764, -0.5216259, 0, 0, 0, 1, 1,
-0.3895148, 1.855698, 1.145497, 0, 0, 0, 1, 1,
-0.3731588, 0.1920462, 0.6996493, 0, 0, 0, 1, 1,
-0.3723835, 0.8614743, 0.7420366, 0, 0, 0, 1, 1,
-0.3708445, 0.485425, -1.71019, 0, 0, 0, 1, 1,
-0.364228, 0.1575681, -0.9869688, 0, 0, 0, 1, 1,
-0.3605373, -0.2253373, -1.917512, 0, 0, 0, 1, 1,
-0.3592687, -0.7107021, -1.954578, 1, 1, 1, 1, 1,
-0.3536024, 0.8136535, 0.5400088, 1, 1, 1, 1, 1,
-0.3529609, 1.693417, -1.027193, 1, 1, 1, 1, 1,
-0.3489217, -0.4987315, -3.266999, 1, 1, 1, 1, 1,
-0.3453763, -1.359068, -3.725898, 1, 1, 1, 1, 1,
-0.3446171, -1.07503, -2.223306, 1, 1, 1, 1, 1,
-0.3436601, 1.10188, -3.046924, 1, 1, 1, 1, 1,
-0.3432938, 1.988756, -0.8993521, 1, 1, 1, 1, 1,
-0.3407952, 0.06070692, -1.917445, 1, 1, 1, 1, 1,
-0.3399619, 0.01184698, -0.4494802, 1, 1, 1, 1, 1,
-0.3332262, 1.271016, 1.12861, 1, 1, 1, 1, 1,
-0.3319854, 0.4512593, -1.536452, 1, 1, 1, 1, 1,
-0.3312519, -2.209102, -5.449362, 1, 1, 1, 1, 1,
-0.3287684, 0.05975498, -1.15056, 1, 1, 1, 1, 1,
-0.323719, -0.06938688, -1.929716, 1, 1, 1, 1, 1,
-0.3230921, -0.3621251, -3.636667, 0, 0, 1, 1, 1,
-0.3210819, -0.5743735, -2.85181, 1, 0, 0, 1, 1,
-0.3206289, -0.3713372, -3.118846, 1, 0, 0, 1, 1,
-0.3154597, 0.09026308, 0.5543708, 1, 0, 0, 1, 1,
-0.3129652, 1.1715, 2.0298, 1, 0, 0, 1, 1,
-0.3078445, 2.407856, -0.3366047, 1, 0, 0, 1, 1,
-0.3071016, 0.4259154, -0.2009373, 0, 0, 0, 1, 1,
-0.3039551, -0.5826679, -0.8211725, 0, 0, 0, 1, 1,
-0.2961997, 0.6098518, -0.7031699, 0, 0, 0, 1, 1,
-0.2923971, -0.8316163, -2.95016, 0, 0, 0, 1, 1,
-0.2878194, 0.9896069, 0.1420936, 0, 0, 0, 1, 1,
-0.2869618, -1.199789, -4.418998, 0, 0, 0, 1, 1,
-0.2847957, -0.9205875, -1.728069, 0, 0, 0, 1, 1,
-0.2778465, -0.7141682, -3.110743, 1, 1, 1, 1, 1,
-0.2731138, 0.1362119, -1.386275, 1, 1, 1, 1, 1,
-0.2715365, 0.7399094, -1.64921, 1, 1, 1, 1, 1,
-0.2698284, 1.678739, 0.9935138, 1, 1, 1, 1, 1,
-0.2661595, -0.01929729, -1.829862, 1, 1, 1, 1, 1,
-0.2587531, -0.4576257, -2.151993, 1, 1, 1, 1, 1,
-0.2576765, 0.7312167, -0.144174, 1, 1, 1, 1, 1,
-0.2542682, -0.02215941, -1.514506, 1, 1, 1, 1, 1,
-0.2512117, -0.595562, -2.479789, 1, 1, 1, 1, 1,
-0.2494274, 1.090121, 0.07706525, 1, 1, 1, 1, 1,
-0.2480314, 0.6035202, -0.9956136, 1, 1, 1, 1, 1,
-0.2475373, -1.037287, -1.796744, 1, 1, 1, 1, 1,
-0.2469117, 0.5245533, 0.393623, 1, 1, 1, 1, 1,
-0.2423528, -0.3248015, -1.955328, 1, 1, 1, 1, 1,
-0.2411948, 0.6325666, -0.4340245, 1, 1, 1, 1, 1,
-0.2361413, 1.344624, 0.3059345, 0, 0, 1, 1, 1,
-0.2354361, -0.3369737, -3.861147, 1, 0, 0, 1, 1,
-0.2328208, 0.49825, 0.5645986, 1, 0, 0, 1, 1,
-0.2310298, 1.02703, 0.0161132, 1, 0, 0, 1, 1,
-0.2309428, 1.047181, 0.9701746, 1, 0, 0, 1, 1,
-0.2244821, -1.970679, -4.35292, 1, 0, 0, 1, 1,
-0.223947, -1.042554, -4.271081, 0, 0, 0, 1, 1,
-0.2228975, 0.2551157, -1.215513, 0, 0, 0, 1, 1,
-0.2196494, -0.8053284, -3.433542, 0, 0, 0, 1, 1,
-0.2196459, -1.757847, -2.211605, 0, 0, 0, 1, 1,
-0.2188038, 1.67847, 1.411058, 0, 0, 0, 1, 1,
-0.2170561, -0.1235101, -3.407422, 0, 0, 0, 1, 1,
-0.2121591, -0.0571079, -3.213956, 0, 0, 0, 1, 1,
-0.2105774, 2.133735, -0.1342504, 1, 1, 1, 1, 1,
-0.2048948, 0.2259243, 0.6317448, 1, 1, 1, 1, 1,
-0.2015071, -0.07220685, -1.932796, 1, 1, 1, 1, 1,
-0.1978884, 2.129659, 0.6008494, 1, 1, 1, 1, 1,
-0.1947255, -0.6214213, -2.195704, 1, 1, 1, 1, 1,
-0.1941633, 0.1822883, -0.2654154, 1, 1, 1, 1, 1,
-0.18377, -0.8652502, -2.741044, 1, 1, 1, 1, 1,
-0.1817709, 1.026183, 1.829283, 1, 1, 1, 1, 1,
-0.1812305, -0.8804356, -3.082911, 1, 1, 1, 1, 1,
-0.1812053, 0.2317988, -1.692832, 1, 1, 1, 1, 1,
-0.180475, 0.8700897, -0.03317368, 1, 1, 1, 1, 1,
-0.1758212, -1.733564, -3.022008, 1, 1, 1, 1, 1,
-0.1750929, 0.9030574, -0.1356245, 1, 1, 1, 1, 1,
-0.1738185, -0.1783736, -2.348046, 1, 1, 1, 1, 1,
-0.1716254, -1.226899, -4.391243, 1, 1, 1, 1, 1,
-0.1711488, 0.1772767, -0.8361083, 0, 0, 1, 1, 1,
-0.1703444, 1.083867, -0.2814307, 1, 0, 0, 1, 1,
-0.1690845, 0.2025674, -0.7704868, 1, 0, 0, 1, 1,
-0.1650143, -0.04564723, -0.08494237, 1, 0, 0, 1, 1,
-0.1620378, -0.3557184, -2.546597, 1, 0, 0, 1, 1,
-0.1620249, -0.1344777, -3.939776, 1, 0, 0, 1, 1,
-0.1614859, 0.9890675, -0.6491176, 0, 0, 0, 1, 1,
-0.1597835, -1.06784, -3.14933, 0, 0, 0, 1, 1,
-0.1591141, 0.8293926, -2.457784, 0, 0, 0, 1, 1,
-0.1568801, -0.585876, -3.520962, 0, 0, 0, 1, 1,
-0.1555941, 0.8698567, 0.3693712, 0, 0, 0, 1, 1,
-0.1553783, -1.145734, -2.973747, 0, 0, 0, 1, 1,
-0.1537817, -0.8043295, -4.357329, 0, 0, 0, 1, 1,
-0.1451788, -1.740948, -2.455864, 1, 1, 1, 1, 1,
-0.1414487, -0.461951, -3.103594, 1, 1, 1, 1, 1,
-0.1399635, 0.9712131, -1.201563, 1, 1, 1, 1, 1,
-0.13874, 0.5842869, 0.4710479, 1, 1, 1, 1, 1,
-0.1331257, -0.9679931, -4.611891, 1, 1, 1, 1, 1,
-0.1313768, -0.02828431, -0.6158514, 1, 1, 1, 1, 1,
-0.1307325, 1.749865, 0.168359, 1, 1, 1, 1, 1,
-0.1305735, 0.2841054, -1.877073, 1, 1, 1, 1, 1,
-0.1284595, -0.7953973, -2.134089, 1, 1, 1, 1, 1,
-0.1253522, -1.08698, -1.567477, 1, 1, 1, 1, 1,
-0.1180356, 0.3845659, 1.29239, 1, 1, 1, 1, 1,
-0.1144779, 1.107362, 0.1491185, 1, 1, 1, 1, 1,
-0.1143636, -1.529354, -3.356859, 1, 1, 1, 1, 1,
-0.1127008, -0.4366732, -4.463237, 1, 1, 1, 1, 1,
-0.1113949, 2.255405, -0.7766454, 1, 1, 1, 1, 1,
-0.1105119, 0.5744982, -0.247583, 0, 0, 1, 1, 1,
-0.1098995, -1.008407, -3.675558, 1, 0, 0, 1, 1,
-0.1097836, -0.730834, -1.946637, 1, 0, 0, 1, 1,
-0.1049558, -2.380355, -5.361858, 1, 0, 0, 1, 1,
-0.09986514, -0.1374619, -3.296455, 1, 0, 0, 1, 1,
-0.09805557, 0.2910561, -1.286574, 1, 0, 0, 1, 1,
-0.09682747, -1.0419, -2.888442, 0, 0, 0, 1, 1,
-0.09666654, -1.106153, -3.966943, 0, 0, 0, 1, 1,
-0.08623415, -2.45226, -2.20003, 0, 0, 0, 1, 1,
-0.08124013, 1.413413, -0.004934695, 0, 0, 0, 1, 1,
-0.07407902, 0.7423835, -1.114699, 0, 0, 0, 1, 1,
-0.06671675, 0.9863515, -0.2852004, 0, 0, 0, 1, 1,
-0.06600977, -0.8498876, -1.483533, 0, 0, 0, 1, 1,
-0.05828428, -0.4759391, -3.616533, 1, 1, 1, 1, 1,
-0.0531124, -1.197801, -3.357184, 1, 1, 1, 1, 1,
-0.04967694, -0.7547278, -2.96043, 1, 1, 1, 1, 1,
-0.04757919, 1.652277, 0.1066482, 1, 1, 1, 1, 1,
-0.04556784, 0.482206, -0.2470746, 1, 1, 1, 1, 1,
-0.04537622, -0.1608629, -3.870104, 1, 1, 1, 1, 1,
-0.03947128, 0.8891923, -1.179987, 1, 1, 1, 1, 1,
-0.03612547, 0.5151275, -0.04225777, 1, 1, 1, 1, 1,
-0.03541526, -0.5325648, -1.856809, 1, 1, 1, 1, 1,
-0.03534313, 0.6796203, 0.8523057, 1, 1, 1, 1, 1,
-0.03356462, 1.363962, 0.4392187, 1, 1, 1, 1, 1,
-0.02997727, 1.194862, 0.08536602, 1, 1, 1, 1, 1,
-0.02831372, -1.11619, -1.84777, 1, 1, 1, 1, 1,
-0.02657011, 1.006341, 0.5661423, 1, 1, 1, 1, 1,
-0.02335806, 0.07701092, 1.677176, 1, 1, 1, 1, 1,
-0.02191637, 0.0244623, 0.9391909, 0, 0, 1, 1, 1,
-0.02182397, -0.2355899, -2.737527, 1, 0, 0, 1, 1,
-0.02057082, -0.2401634, -3.416567, 1, 0, 0, 1, 1,
-0.01763539, -0.9228424, -3.585455, 1, 0, 0, 1, 1,
-0.01660485, 0.5851908, -1.972417, 1, 0, 0, 1, 1,
-0.01598466, -1.246792, -3.142877, 1, 0, 0, 1, 1,
-0.01457815, -0.248763, -3.254624, 0, 0, 0, 1, 1,
-0.01169517, -0.3149823, -1.227623, 0, 0, 0, 1, 1,
-0.007836986, 0.2023489, -1.234901, 0, 0, 0, 1, 1,
-0.004281583, 1.780904, -0.01658649, 0, 0, 0, 1, 1,
-0.001216979, 0.4127831, -2.333839, 0, 0, 0, 1, 1,
0.0007865511, 0.8361086, -0.5740547, 0, 0, 0, 1, 1,
0.0008921287, -0.7775, 1.528797, 0, 0, 0, 1, 1,
0.001456626, -0.003156414, 2.577544, 1, 1, 1, 1, 1,
0.001732067, 1.735487, -0.4142744, 1, 1, 1, 1, 1,
0.00466003, -0.6488409, 3.139123, 1, 1, 1, 1, 1,
0.005386671, 1.564223, -0.5733884, 1, 1, 1, 1, 1,
0.01130647, 1.185596, -2.572017, 1, 1, 1, 1, 1,
0.01299179, 0.1472282, 0.8312024, 1, 1, 1, 1, 1,
0.01323422, -1.342099, 2.782946, 1, 1, 1, 1, 1,
0.01365356, -1.263693, 0.9912945, 1, 1, 1, 1, 1,
0.01948167, 0.9677993, -1.116027, 1, 1, 1, 1, 1,
0.0284002, 0.6655579, 1.856112, 1, 1, 1, 1, 1,
0.03125618, -0.5410065, 3.881617, 1, 1, 1, 1, 1,
0.03333342, 1.301889, -1.960887, 1, 1, 1, 1, 1,
0.03486636, 0.3813876, -0.9499611, 1, 1, 1, 1, 1,
0.03626154, -1.545247, 2.351529, 1, 1, 1, 1, 1,
0.03814641, 0.8520668, -1.176046, 1, 1, 1, 1, 1,
0.04489219, -0.5136779, 3.330554, 0, 0, 1, 1, 1,
0.0499372, -0.1796839, 3.944742, 1, 0, 0, 1, 1,
0.05132983, 1.185458, -1.392091, 1, 0, 0, 1, 1,
0.05297291, -0.3487519, 4.476184, 1, 0, 0, 1, 1,
0.05698952, -0.2591045, 2.21922, 1, 0, 0, 1, 1,
0.06272553, -1.409798, 3.199156, 1, 0, 0, 1, 1,
0.06347601, -0.9294053, 1.286315, 0, 0, 0, 1, 1,
0.06861308, 0.9630632, -0.2356563, 0, 0, 0, 1, 1,
0.068846, -1.6572, 2.764538, 0, 0, 0, 1, 1,
0.06994706, -1.443147, 4.123832, 0, 0, 0, 1, 1,
0.07395524, -0.9043694, 2.309052, 0, 0, 0, 1, 1,
0.0781557, 0.1418375, 1.023376, 0, 0, 0, 1, 1,
0.08279322, -1.166835, 2.125426, 0, 0, 0, 1, 1,
0.08390088, 0.3608828, 1.038533, 1, 1, 1, 1, 1,
0.09105377, 0.5832574, 1.370317, 1, 1, 1, 1, 1,
0.0917568, 1.040706, -1.221882, 1, 1, 1, 1, 1,
0.09277458, -0.05850635, 3.169978, 1, 1, 1, 1, 1,
0.1012925, -1.975742, 1.731115, 1, 1, 1, 1, 1,
0.1018973, -0.3620141, 3.35208, 1, 1, 1, 1, 1,
0.1037489, 1.113023, -0.9574364, 1, 1, 1, 1, 1,
0.1079806, -1.533172, 4.517193, 1, 1, 1, 1, 1,
0.1144765, 1.082188, 0.272746, 1, 1, 1, 1, 1,
0.1263951, -1.441883, 2.900911, 1, 1, 1, 1, 1,
0.1358999, 1.76577, -0.118077, 1, 1, 1, 1, 1,
0.1366414, -0.2656485, 2.183069, 1, 1, 1, 1, 1,
0.1380531, -0.02634832, 1.76651, 1, 1, 1, 1, 1,
0.1445554, 0.09650489, 1.375514, 1, 1, 1, 1, 1,
0.1494928, 0.6022704, -0.5424946, 1, 1, 1, 1, 1,
0.1521313, 0.214932, -0.2706775, 0, 0, 1, 1, 1,
0.162979, -0.5386256, 2.125258, 1, 0, 0, 1, 1,
0.164104, -0.1480729, 1.887609, 1, 0, 0, 1, 1,
0.1652326, 1.324525, 0.8497102, 1, 0, 0, 1, 1,
0.1652646, -0.2723152, 2.865486, 1, 0, 0, 1, 1,
0.1693393, 0.79331, 0.5260126, 1, 0, 0, 1, 1,
0.1718792, -0.8176324, 3.474921, 0, 0, 0, 1, 1,
0.1757673, 0.2996469, 2.060733, 0, 0, 0, 1, 1,
0.1765274, 0.09778707, 1.403888, 0, 0, 0, 1, 1,
0.1814824, -0.5277087, 3.195102, 0, 0, 0, 1, 1,
0.1839437, 0.2584656, 0.2567038, 0, 0, 0, 1, 1,
0.1845037, -0.4188267, 1.826468, 0, 0, 0, 1, 1,
0.1860674, -2.377027, 1.568679, 0, 0, 0, 1, 1,
0.1862223, -0.9085816, 2.232753, 1, 1, 1, 1, 1,
0.1888725, 0.4005255, 1.995495, 1, 1, 1, 1, 1,
0.1981481, -0.5720617, 2.395564, 1, 1, 1, 1, 1,
0.2001523, 1.361383, -0.6906689, 1, 1, 1, 1, 1,
0.2021727, -1.599339, 2.079149, 1, 1, 1, 1, 1,
0.2058799, -1.473095, 3.91141, 1, 1, 1, 1, 1,
0.2074954, 0.5392514, 2.659173, 1, 1, 1, 1, 1,
0.20837, -1.254565, 3.187649, 1, 1, 1, 1, 1,
0.2099218, -1.024277, 1.820776, 1, 1, 1, 1, 1,
0.2115535, -0.1244483, 0.9098502, 1, 1, 1, 1, 1,
0.2116567, -0.9037713, 1.909828, 1, 1, 1, 1, 1,
0.2129889, 2.132209, -0.1062792, 1, 1, 1, 1, 1,
0.2130113, -0.5572645, 3.657998, 1, 1, 1, 1, 1,
0.2130303, 0.6560349, 0.7569388, 1, 1, 1, 1, 1,
0.2141589, 1.462162, 0.1256621, 1, 1, 1, 1, 1,
0.2191611, -0.1618474, 2.309523, 0, 0, 1, 1, 1,
0.2206645, 0.9959478, -0.6480265, 1, 0, 0, 1, 1,
0.2228384, -0.5698612, 2.243945, 1, 0, 0, 1, 1,
0.2233593, 1.128365, 1.399884, 1, 0, 0, 1, 1,
0.2238115, -1.795476, 3.535316, 1, 0, 0, 1, 1,
0.223813, -1.213144, 2.396261, 1, 0, 0, 1, 1,
0.2242997, -1.039776, 3.255059, 0, 0, 0, 1, 1,
0.2285323, 0.6006923, 2.946463, 0, 0, 0, 1, 1,
0.2348098, -0.6598897, 4.433977, 0, 0, 0, 1, 1,
0.2375482, -0.3957278, 1.75515, 0, 0, 0, 1, 1,
0.2385751, 0.1061466, 1.084958, 0, 0, 0, 1, 1,
0.2406335, -0.1391905, 3.661267, 0, 0, 0, 1, 1,
0.2415918, -1.629351, 2.426346, 0, 0, 0, 1, 1,
0.2417643, -0.5393035, 3.966723, 1, 1, 1, 1, 1,
0.2448566, -0.6553191, 3.487796, 1, 1, 1, 1, 1,
0.2457895, 0.2320037, 0.6689679, 1, 1, 1, 1, 1,
0.2489483, -0.415406, 2.53478, 1, 1, 1, 1, 1,
0.2503665, 1.188001, 0.7509066, 1, 1, 1, 1, 1,
0.250467, -1.231725, 2.056037, 1, 1, 1, 1, 1,
0.2519807, -0.1522875, 1.935449, 1, 1, 1, 1, 1,
0.256388, -0.03051536, 1.531466, 1, 1, 1, 1, 1,
0.2638993, -0.8975835, 4.983375, 1, 1, 1, 1, 1,
0.2668303, 0.3198922, 0.4311129, 1, 1, 1, 1, 1,
0.2720404, 0.5142661, -0.1453566, 1, 1, 1, 1, 1,
0.2747903, 0.3489289, 0.1495637, 1, 1, 1, 1, 1,
0.2749935, -1.930843, 3.339033, 1, 1, 1, 1, 1,
0.2755215, 0.4767046, -2.290618, 1, 1, 1, 1, 1,
0.2755576, -0.8324695, 4.30481, 1, 1, 1, 1, 1,
0.2817422, 2.120812, -1.055367, 0, 0, 1, 1, 1,
0.2833199, -0.1588167, 2.035426, 1, 0, 0, 1, 1,
0.2866715, 1.569796, -0.3325446, 1, 0, 0, 1, 1,
0.2933078, -1.147805, 2.154007, 1, 0, 0, 1, 1,
0.3022236, 0.4256767, 2.039971, 1, 0, 0, 1, 1,
0.3022522, 1.919023, -0.6159253, 1, 0, 0, 1, 1,
0.3037136, -0.2555903, 2.439453, 0, 0, 0, 1, 1,
0.3067233, -0.2845082, 5.185585, 0, 0, 0, 1, 1,
0.30935, 0.3038059, 0.228842, 0, 0, 0, 1, 1,
0.3096475, -1.635615, 2.418301, 0, 0, 0, 1, 1,
0.3117094, -0.1160348, 2.19837, 0, 0, 0, 1, 1,
0.3133568, 0.4875151, 0.9682094, 0, 0, 0, 1, 1,
0.3141966, -0.5770143, 4.695456, 0, 0, 0, 1, 1,
0.316774, -2.568706, 0.4884487, 1, 1, 1, 1, 1,
0.3171631, 1.002767, -0.948586, 1, 1, 1, 1, 1,
0.321732, 0.464499, 0.8339521, 1, 1, 1, 1, 1,
0.3222266, -1.664969, 3.191458, 1, 1, 1, 1, 1,
0.3305395, 0.3608525, 1.087961, 1, 1, 1, 1, 1,
0.3345499, 2.890837, 0.3672549, 1, 1, 1, 1, 1,
0.3353342, 0.9176001, 0.9499276, 1, 1, 1, 1, 1,
0.3360533, -0.04139094, 2.529257, 1, 1, 1, 1, 1,
0.3368925, 1.682993, 1.084651, 1, 1, 1, 1, 1,
0.3431848, -1.827585, 3.027303, 1, 1, 1, 1, 1,
0.3437522, 0.4306835, 0.7512176, 1, 1, 1, 1, 1,
0.3482434, -0.2763948, 1.19464, 1, 1, 1, 1, 1,
0.3497804, 1.13759, -0.2501252, 1, 1, 1, 1, 1,
0.3512527, 1.213313, 0.4719404, 1, 1, 1, 1, 1,
0.3526653, 1.050633, 1.631165, 1, 1, 1, 1, 1,
0.357567, -0.04340296, 0.5558559, 0, 0, 1, 1, 1,
0.3611047, -0.09200216, 1.430428, 1, 0, 0, 1, 1,
0.3619488, -0.2477134, 2.345395, 1, 0, 0, 1, 1,
0.3635769, 0.08282927, 1.243682, 1, 0, 0, 1, 1,
0.3659846, -0.173374, 1.501885, 1, 0, 0, 1, 1,
0.3686373, 1.277114, 0.622973, 1, 0, 0, 1, 1,
0.3687523, -0.6464841, 2.027034, 0, 0, 0, 1, 1,
0.3699337, -0.4543564, 1.485235, 0, 0, 0, 1, 1,
0.3714882, -1.680647, 4.316683, 0, 0, 0, 1, 1,
0.3748745, 0.1089345, 2.04726, 0, 0, 0, 1, 1,
0.3781188, -0.9014489, 2.671448, 0, 0, 0, 1, 1,
0.3796839, 0.5471531, -0.3226015, 0, 0, 0, 1, 1,
0.3797785, -1.340147, 3.004276, 0, 0, 0, 1, 1,
0.3822908, 1.84426, 0.7427101, 1, 1, 1, 1, 1,
0.3842178, -0.9119613, 4.599748, 1, 1, 1, 1, 1,
0.3865, -0.6925929, 1.341871, 1, 1, 1, 1, 1,
0.390231, -0.2966774, 2.599494, 1, 1, 1, 1, 1,
0.3940262, 0.2017096, 2.167947, 1, 1, 1, 1, 1,
0.3944108, 2.575237, -0.5252541, 1, 1, 1, 1, 1,
0.3966392, 2.362849, -0.9523535, 1, 1, 1, 1, 1,
0.3980536, -1.073858, 2.764571, 1, 1, 1, 1, 1,
0.3988674, -1.759935, 1.160556, 1, 1, 1, 1, 1,
0.400081, -0.9060751, 2.787568, 1, 1, 1, 1, 1,
0.4102276, -0.2936928, 0.6112514, 1, 1, 1, 1, 1,
0.4130529, -0.1835615, 0.8048652, 1, 1, 1, 1, 1,
0.4153501, 0.1267727, 0.5559675, 1, 1, 1, 1, 1,
0.4161756, 1.097869, -0.8531545, 1, 1, 1, 1, 1,
0.4195505, -0.3390969, 0.2861567, 1, 1, 1, 1, 1,
0.4215814, -1.071828, 0.8778602, 0, 0, 1, 1, 1,
0.421821, 0.3253355, 1.239936, 1, 0, 0, 1, 1,
0.4235625, -1.040224, 1.625229, 1, 0, 0, 1, 1,
0.4267857, 0.3688975, 0.693975, 1, 0, 0, 1, 1,
0.4319642, 1.872241, 1.552054, 1, 0, 0, 1, 1,
0.4419292, 0.229126, 1.566273, 1, 0, 0, 1, 1,
0.4429418, 1.03382, -0.1196002, 0, 0, 0, 1, 1,
0.4477524, -1.175774, 0.3454303, 0, 0, 0, 1, 1,
0.4503556, -0.6894553, 2.664604, 0, 0, 0, 1, 1,
0.451993, -0.774289, 1.539838, 0, 0, 0, 1, 1,
0.4528848, 1.308916, -2.029881, 0, 0, 0, 1, 1,
0.4532392, 0.2783254, 0.7906222, 0, 0, 0, 1, 1,
0.4571129, -0.6977817, 0.5338676, 0, 0, 0, 1, 1,
0.4584356, 1.619679, 1.370571, 1, 1, 1, 1, 1,
0.4618309, 0.2729554, 0.4923764, 1, 1, 1, 1, 1,
0.463742, -0.9562621, 3.172478, 1, 1, 1, 1, 1,
0.4694304, -2.48802, 3.259041, 1, 1, 1, 1, 1,
0.4700999, 0.1975396, 0.6893355, 1, 1, 1, 1, 1,
0.4771522, -0.868434, 2.48864, 1, 1, 1, 1, 1,
0.4781545, -0.5362858, 2.989056, 1, 1, 1, 1, 1,
0.4801857, -0.6979092, 2.23277, 1, 1, 1, 1, 1,
0.4802999, -0.7868159, 3.576907, 1, 1, 1, 1, 1,
0.4839877, -1.589652, 4.819188, 1, 1, 1, 1, 1,
0.4852735, 1.2969, 1.154656, 1, 1, 1, 1, 1,
0.4853125, -1.282116, 3.530231, 1, 1, 1, 1, 1,
0.4890064, 0.5650272, 0.5953488, 1, 1, 1, 1, 1,
0.4902439, -0.4728123, 1.792592, 1, 1, 1, 1, 1,
0.4912539, -2.698113, 3.709456, 1, 1, 1, 1, 1,
0.4929025, 0.9111464, 0.728758, 0, 0, 1, 1, 1,
0.4940458, -0.0605492, 0.9729543, 1, 0, 0, 1, 1,
0.4954188, 0.2636445, -0.5172495, 1, 0, 0, 1, 1,
0.4957355, -0.9932753, 2.807942, 1, 0, 0, 1, 1,
0.4959238, -0.5210916, 0.585024, 1, 0, 0, 1, 1,
0.4969946, 1.971085, 0.03449888, 1, 0, 0, 1, 1,
0.4997509, 2.125059, -0.342646, 0, 0, 0, 1, 1,
0.5109886, 0.43452, 0.9012524, 0, 0, 0, 1, 1,
0.512761, -0.8333191, 2.149198, 0, 0, 0, 1, 1,
0.5189707, 0.5249264, -0.1031238, 0, 0, 0, 1, 1,
0.5243358, -0.470432, 2.18556, 0, 0, 0, 1, 1,
0.5317117, 1.017181, -0.9756085, 0, 0, 0, 1, 1,
0.5355096, 0.6845012, -0.06059667, 0, 0, 0, 1, 1,
0.5411419, -0.3586906, 0.6878449, 1, 1, 1, 1, 1,
0.5450311, -2.405018, 2.618442, 1, 1, 1, 1, 1,
0.5452601, 0.2739446, 1.85656, 1, 1, 1, 1, 1,
0.5458938, 2.301199, -0.3550273, 1, 1, 1, 1, 1,
0.5464289, -0.2868992, 1.566204, 1, 1, 1, 1, 1,
0.5540811, -0.5828996, 2.180295, 1, 1, 1, 1, 1,
0.5558816, 0.1040121, 2.616912, 1, 1, 1, 1, 1,
0.5577283, 0.3823931, 1.877645, 1, 1, 1, 1, 1,
0.5602376, 0.1199647, 0.7392759, 1, 1, 1, 1, 1,
0.5636238, 0.3964478, 0.2254523, 1, 1, 1, 1, 1,
0.5650284, 1.075511, 0.7892288, 1, 1, 1, 1, 1,
0.5672678, 0.5399022, 1.234486, 1, 1, 1, 1, 1,
0.5773848, -1.289424, 3.128436, 1, 1, 1, 1, 1,
0.5794528, -0.3789976, 1.569514, 1, 1, 1, 1, 1,
0.582268, -0.8604182, 2.092514, 1, 1, 1, 1, 1,
0.5859886, -0.1872189, 0.9190205, 0, 0, 1, 1, 1,
0.5916486, 0.7892129, 0.9464905, 1, 0, 0, 1, 1,
0.5922046, 0.6379277, 0.80088, 1, 0, 0, 1, 1,
0.5936458, 1.232442, 0.03224768, 1, 0, 0, 1, 1,
0.5938601, -0.3008071, 2.932515, 1, 0, 0, 1, 1,
0.5963154, 1.189896, -0.6235602, 1, 0, 0, 1, 1,
0.5970545, 1.320215, 2.031179, 0, 0, 0, 1, 1,
0.6005049, 0.9685777, 1.416501, 0, 0, 0, 1, 1,
0.604081, 0.4671623, 0.6292138, 0, 0, 0, 1, 1,
0.6043115, 0.4777273, 1.053568, 0, 0, 0, 1, 1,
0.6097231, 0.4850665, 0.8557785, 0, 0, 0, 1, 1,
0.6098927, 0.8848394, 1.285507, 0, 0, 0, 1, 1,
0.621172, 0.6024524, 0.9963735, 0, 0, 0, 1, 1,
0.6219892, 0.4639702, 1.366566, 1, 1, 1, 1, 1,
0.6304248, -0.625668, 2.278, 1, 1, 1, 1, 1,
0.6370795, 0.1206992, 1.342739, 1, 1, 1, 1, 1,
0.6390179, 1.671987, -0.3023509, 1, 1, 1, 1, 1,
0.639057, 0.5062079, 2.200598, 1, 1, 1, 1, 1,
0.6419075, -0.3587845, 2.033863, 1, 1, 1, 1, 1,
0.6419165, 1.858933, -0.2069151, 1, 1, 1, 1, 1,
0.6472989, -1.993218, 2.906524, 1, 1, 1, 1, 1,
0.6474404, 2.101799, -0.9578804, 1, 1, 1, 1, 1,
0.6477968, 0.2819264, 1.773816, 1, 1, 1, 1, 1,
0.6504681, 0.2360175, 1.389504, 1, 1, 1, 1, 1,
0.6511065, -0.1886622, 1.398762, 1, 1, 1, 1, 1,
0.6560422, -2.672029, 2.68743, 1, 1, 1, 1, 1,
0.6583784, -1.311358, 2.967117, 1, 1, 1, 1, 1,
0.6588888, 0.9779113, 0.7667278, 1, 1, 1, 1, 1,
0.6688386, 0.03154704, 1.500601, 0, 0, 1, 1, 1,
0.6691934, -2.101083, 3.32313, 1, 0, 0, 1, 1,
0.6699555, -1.415734, 0.8653285, 1, 0, 0, 1, 1,
0.670843, 0.2694307, 2.891355, 1, 0, 0, 1, 1,
0.6850122, -1.089486, 3.129054, 1, 0, 0, 1, 1,
0.6858898, 1.798206, -1.707724, 1, 0, 0, 1, 1,
0.6861995, -0.428242, 3.224637, 0, 0, 0, 1, 1,
0.6883504, 1.203067, -0.03949857, 0, 0, 0, 1, 1,
0.688441, -2.029676, 0.7979689, 0, 0, 0, 1, 1,
0.6961287, -0.3223242, 2.463103, 0, 0, 0, 1, 1,
0.6966198, -1.956799, 2.823835, 0, 0, 0, 1, 1,
0.6978561, 1.144535, -0.4755293, 0, 0, 0, 1, 1,
0.6979197, -1.177292, 2.643486, 0, 0, 0, 1, 1,
0.7003897, -0.4000119, 1.775687, 1, 1, 1, 1, 1,
0.7004842, -0.04160976, -0.1538108, 1, 1, 1, 1, 1,
0.7045343, 1.992307, 1.13078, 1, 1, 1, 1, 1,
0.7055358, -0.659538, 2.089791, 1, 1, 1, 1, 1,
0.7132249, -0.2225764, -0.3700892, 1, 1, 1, 1, 1,
0.7158775, 1.805492, 0.7024502, 1, 1, 1, 1, 1,
0.7161711, -1.733361, 1.61075, 1, 1, 1, 1, 1,
0.716239, 1.264381, 0.1347032, 1, 1, 1, 1, 1,
0.7215754, 0.2294367, 0.9219005, 1, 1, 1, 1, 1,
0.7262347, -2.091844, 5.428519, 1, 1, 1, 1, 1,
0.7309106, 1.115117, 0.9211072, 1, 1, 1, 1, 1,
0.7353025, 0.01372094, 1.974282, 1, 1, 1, 1, 1,
0.7381976, -0.8478002, 3.982521, 1, 1, 1, 1, 1,
0.7479984, -0.4472177, 1.266143, 1, 1, 1, 1, 1,
0.7514051, -1.088783, 3.734257, 1, 1, 1, 1, 1,
0.7516426, -0.8646257, 2.197387, 0, 0, 1, 1, 1,
0.7526516, 0.7357675, 2.594706, 1, 0, 0, 1, 1,
0.7530636, -1.458148, 1.289884, 1, 0, 0, 1, 1,
0.753147, 0.6554638, 1.405471, 1, 0, 0, 1, 1,
0.7595716, -0.9160444, 3.509896, 1, 0, 0, 1, 1,
0.7664796, -1.087789, 2.270684, 1, 0, 0, 1, 1,
0.7773787, 0.1337365, 1.341495, 0, 0, 0, 1, 1,
0.7785856, -0.2812555, 1.09972, 0, 0, 0, 1, 1,
0.7975401, 0.8689567, 1.549838, 0, 0, 0, 1, 1,
0.7977642, 0.03234538, 1.664392, 0, 0, 0, 1, 1,
0.8027135, 1.006751, -0.4217179, 0, 0, 0, 1, 1,
0.8064827, 0.4829127, -0.3712557, 0, 0, 0, 1, 1,
0.8066928, 2.596948, 0.2149794, 0, 0, 0, 1, 1,
0.8085184, 0.7564385, -0.4974383, 1, 1, 1, 1, 1,
0.8148735, -1.261083, 1.430268, 1, 1, 1, 1, 1,
0.8248147, 0.9855025, 0.5783455, 1, 1, 1, 1, 1,
0.8328203, -0.3952207, 1.736273, 1, 1, 1, 1, 1,
0.8336781, 0.2133138, 0.2925375, 1, 1, 1, 1, 1,
0.8354535, -0.3368663, 2.571685, 1, 1, 1, 1, 1,
0.8364332, -0.6535488, 3.908875, 1, 1, 1, 1, 1,
0.8474005, 0.2448434, 1.312259, 1, 1, 1, 1, 1,
0.8477647, 1.041894, 1.18702, 1, 1, 1, 1, 1,
0.8524373, -0.5262441, 3.797926, 1, 1, 1, 1, 1,
0.8580254, -0.5772393, 2.345789, 1, 1, 1, 1, 1,
0.8611689, 0.4874579, 0.8636067, 1, 1, 1, 1, 1,
0.8669015, 0.5941218, 0.5929512, 1, 1, 1, 1, 1,
0.8725542, -0.7548863, 2.257372, 1, 1, 1, 1, 1,
0.8826312, 2.06842, 1.241691, 1, 1, 1, 1, 1,
0.8829305, 0.05085212, 2.01403, 0, 0, 1, 1, 1,
0.8838207, -0.25511, 3.24778, 1, 0, 0, 1, 1,
0.8860769, 0.3317801, 0.1731009, 1, 0, 0, 1, 1,
0.887875, 0.641811, 0.4239343, 1, 0, 0, 1, 1,
0.8879037, -0.004394222, 1.492396, 1, 0, 0, 1, 1,
0.8902465, -0.346862, 1.939393, 1, 0, 0, 1, 1,
0.8917255, -1.353366, 1.405726, 0, 0, 0, 1, 1,
0.8918959, 2.369863, -1.630322, 0, 0, 0, 1, 1,
0.8946993, 0.1682631, 1.329369, 0, 0, 0, 1, 1,
0.8958559, 2.233919, -1.181143, 0, 0, 0, 1, 1,
0.9063588, -0.4973688, 1.969811, 0, 0, 0, 1, 1,
0.9075229, -1.658188, 1.289757, 0, 0, 0, 1, 1,
0.9080396, -0.09047102, 1.11081, 0, 0, 0, 1, 1,
0.9082346, 0.1767644, 1.986061, 1, 1, 1, 1, 1,
0.9084981, 0.06257813, 0.5446579, 1, 1, 1, 1, 1,
0.9094785, -0.5428525, 0.08826316, 1, 1, 1, 1, 1,
0.9155456, 0.6238363, 1.922585, 1, 1, 1, 1, 1,
0.9304464, -1.319224, 1.382061, 1, 1, 1, 1, 1,
0.9374253, 0.9393042, -1.450643, 1, 1, 1, 1, 1,
0.9435409, 1.159615, 1.03663, 1, 1, 1, 1, 1,
0.9446692, -1.586546, 3.638858, 1, 1, 1, 1, 1,
0.9474181, 1.334082, 0.5807736, 1, 1, 1, 1, 1,
0.9513654, -0.3673398, 0.8873873, 1, 1, 1, 1, 1,
0.9524576, 0.2571004, 1.132249, 1, 1, 1, 1, 1,
0.9593435, 0.6811128, 1.490343, 1, 1, 1, 1, 1,
0.9598749, -0.6221957, 2.941039, 1, 1, 1, 1, 1,
0.9644626, -0.2921659, 0.3510138, 1, 1, 1, 1, 1,
0.9696849, -1.300001, 2.486778, 1, 1, 1, 1, 1,
0.9700104, 1.306227, 1.308973, 0, 0, 1, 1, 1,
0.9742189, 0.5289099, 0.9188908, 1, 0, 0, 1, 1,
0.9780967, -0.1747214, 1.997996, 1, 0, 0, 1, 1,
0.9795765, -1.719031, 2.171874, 1, 0, 0, 1, 1,
0.9858774, 0.4449078, 1.670152, 1, 0, 0, 1, 1,
0.9898636, -0.2862641, 0.6049749, 1, 0, 0, 1, 1,
0.9929008, 0.05885925, 1.291981, 0, 0, 0, 1, 1,
0.9934236, 1.052295, 0.5999656, 0, 0, 0, 1, 1,
0.9949338, -1.400639, 1.476877, 0, 0, 0, 1, 1,
0.9969121, 1.834546, -0.574091, 0, 0, 0, 1, 1,
1.001407, 0.8723046, 0.5054657, 0, 0, 0, 1, 1,
1.009031, -1.234006, 2.167248, 0, 0, 0, 1, 1,
1.010128, 0.7194528, 1.90429, 0, 0, 0, 1, 1,
1.016131, 0.9364122, 0.2549443, 1, 1, 1, 1, 1,
1.01657, 0.5049087, -0.1063089, 1, 1, 1, 1, 1,
1.020557, -0.7521251, 2.283299, 1, 1, 1, 1, 1,
1.022601, -0.2933178, 1.378865, 1, 1, 1, 1, 1,
1.027152, 0.1937033, 1.247393, 1, 1, 1, 1, 1,
1.029744, 1.048965, 0.8683066, 1, 1, 1, 1, 1,
1.030468, 0.5539521, 1.480112, 1, 1, 1, 1, 1,
1.04217, 0.2340625, 1.055166, 1, 1, 1, 1, 1,
1.04719, 0.3559816, 0.4299012, 1, 1, 1, 1, 1,
1.049604, -0.7376792, 2.958484, 1, 1, 1, 1, 1,
1.05056, -1.079203, 3.790074, 1, 1, 1, 1, 1,
1.060877, -0.5853785, 2.007718, 1, 1, 1, 1, 1,
1.066662, 0.6564209, -0.1961952, 1, 1, 1, 1, 1,
1.067033, -0.6120484, 1.301105, 1, 1, 1, 1, 1,
1.071587, 0.9277715, 1.814389, 1, 1, 1, 1, 1,
1.072843, -0.6197163, 1.519183, 0, 0, 1, 1, 1,
1.079087, -1.706038, 2.538481, 1, 0, 0, 1, 1,
1.079365, 1.735372, 0.3966809, 1, 0, 0, 1, 1,
1.087378, 0.7313601, 0.7840504, 1, 0, 0, 1, 1,
1.090723, -0.0256246, -0.1360721, 1, 0, 0, 1, 1,
1.093798, 0.3814582, 0.09807187, 1, 0, 0, 1, 1,
1.094892, 0.5168459, -1.146137, 0, 0, 0, 1, 1,
1.09713, -0.5087167, 1.330824, 0, 0, 0, 1, 1,
1.097592, -1.612378, 2.380303, 0, 0, 0, 1, 1,
1.098979, -0.9502506, 2.544475, 0, 0, 0, 1, 1,
1.104321, 0.4797403, 1.833854, 0, 0, 0, 1, 1,
1.108622, -0.2450032, 0.1222401, 0, 0, 0, 1, 1,
1.108794, -0.3911878, 1.614004, 0, 0, 0, 1, 1,
1.11009, -0.4648961, 0.8395402, 1, 1, 1, 1, 1,
1.116488, 0.09760807, 3.207794, 1, 1, 1, 1, 1,
1.118513, 1.286024, 0.6426172, 1, 1, 1, 1, 1,
1.131857, 1.6562, 3.696357, 1, 1, 1, 1, 1,
1.135022, 0.5704106, -0.3375352, 1, 1, 1, 1, 1,
1.135144, 0.9438341, 1.504444, 1, 1, 1, 1, 1,
1.143958, -0.8561376, 2.035454, 1, 1, 1, 1, 1,
1.15146, -0.6815087, 1.284574, 1, 1, 1, 1, 1,
1.153747, 0.269934, 1.095344, 1, 1, 1, 1, 1,
1.157265, 1.110567, 0.6894491, 1, 1, 1, 1, 1,
1.158521, -1.565913, 2.605855, 1, 1, 1, 1, 1,
1.159847, 0.5829862, 0.5243035, 1, 1, 1, 1, 1,
1.172674, -1.543816, 3.528944, 1, 1, 1, 1, 1,
1.175462, 0.1759397, 1.805269, 1, 1, 1, 1, 1,
1.177608, -0.7189684, 0.4512615, 1, 1, 1, 1, 1,
1.179916, -1.214814, 1.930311, 0, 0, 1, 1, 1,
1.189333, -0.1291314, 2.100178, 1, 0, 0, 1, 1,
1.206507, -0.9281668, 3.485845, 1, 0, 0, 1, 1,
1.206965, -0.2209365, 1.706597, 1, 0, 0, 1, 1,
1.207162, -0.4203523, 0.7683744, 1, 0, 0, 1, 1,
1.209474, 1.311597, 0.9233585, 1, 0, 0, 1, 1,
1.213703, -0.1834274, 1.394265, 0, 0, 0, 1, 1,
1.220557, -1.290937, 2.302362, 0, 0, 0, 1, 1,
1.23129, 0.299394, 1.364413, 0, 0, 0, 1, 1,
1.231973, 0.7354817, 0.376972, 0, 0, 0, 1, 1,
1.234188, 0.3240305, 2.400258, 0, 0, 0, 1, 1,
1.245009, -1.065193, 2.311991, 0, 0, 0, 1, 1,
1.252479, 0.7645627, 2.816233, 0, 0, 0, 1, 1,
1.261441, -0.7190758, 2.507035, 1, 1, 1, 1, 1,
1.261617, -0.4339425, 2.074811, 1, 1, 1, 1, 1,
1.261717, 1.47189, 0.3499977, 1, 1, 1, 1, 1,
1.264648, -0.1183619, 1.528606, 1, 1, 1, 1, 1,
1.277748, -0.2636425, 0.3633652, 1, 1, 1, 1, 1,
1.292182, -0.5941052, 1.355638, 1, 1, 1, 1, 1,
1.292972, -0.6168658, 2.216057, 1, 1, 1, 1, 1,
1.295187, 0.2680874, 1.385257, 1, 1, 1, 1, 1,
1.29533, 0.4361638, 1.267984, 1, 1, 1, 1, 1,
1.299731, 0.4608107, 3.275912, 1, 1, 1, 1, 1,
1.302289, 2.021938, 0.7396195, 1, 1, 1, 1, 1,
1.312761, 0.8910376, 1.433397, 1, 1, 1, 1, 1,
1.316188, -0.1760921, 1.252195, 1, 1, 1, 1, 1,
1.317548, -1.022236, 2.032851, 1, 1, 1, 1, 1,
1.319602, -2.159428, 3.765337, 1, 1, 1, 1, 1,
1.330751, -0.3853216, 0.3491813, 0, 0, 1, 1, 1,
1.333361, 0.8105514, 0.3166803, 1, 0, 0, 1, 1,
1.343884, -0.4275641, 0.48899, 1, 0, 0, 1, 1,
1.344416, 0.05800845, -0.2594382, 1, 0, 0, 1, 1,
1.353919, 0.06135741, 1.874171, 1, 0, 0, 1, 1,
1.36233, -0.5735701, 2.349522, 1, 0, 0, 1, 1,
1.372195, -0.6841427, 2.665131, 0, 0, 0, 1, 1,
1.38605, 1.355228, 1.16608, 0, 0, 0, 1, 1,
1.395664, 0.04512136, -0.2206169, 0, 0, 0, 1, 1,
1.419662, 0.006636457, 1.727101, 0, 0, 0, 1, 1,
1.42922, 0.07200211, 0.148932, 0, 0, 0, 1, 1,
1.431836, 1.117324, 1.175094, 0, 0, 0, 1, 1,
1.435388, 0.4788413, 0.807089, 0, 0, 0, 1, 1,
1.439875, -1.846722, 2.477795, 1, 1, 1, 1, 1,
1.444039, -2.415294, 2.231307, 1, 1, 1, 1, 1,
1.444054, -1.428913, 0.7089375, 1, 1, 1, 1, 1,
1.45021, 1.270301, 1.218852, 1, 1, 1, 1, 1,
1.461077, 0.2199091, -0.2936717, 1, 1, 1, 1, 1,
1.482798, -1.51337, 2.748463, 1, 1, 1, 1, 1,
1.490414, -1.150692, 2.46564, 1, 1, 1, 1, 1,
1.497045, 0.3180938, 2.666185, 1, 1, 1, 1, 1,
1.497149, 0.2924277, 1.876419, 1, 1, 1, 1, 1,
1.501126, 0.623039, 0.4853133, 1, 1, 1, 1, 1,
1.510553, -0.3244843, 1.656915, 1, 1, 1, 1, 1,
1.513238, 0.5427925, 2.856051, 1, 1, 1, 1, 1,
1.516996, 0.7713754, 1.028934, 1, 1, 1, 1, 1,
1.520426, 0.1809698, 1.134493, 1, 1, 1, 1, 1,
1.526572, 1.423619, 0.7572779, 1, 1, 1, 1, 1,
1.533399, -0.3716006, 3.255065, 0, 0, 1, 1, 1,
1.558097, 0.1476873, 0.2410984, 1, 0, 0, 1, 1,
1.57456, -0.23646, 3.075583, 1, 0, 0, 1, 1,
1.58069, -1.332669, 2.884342, 1, 0, 0, 1, 1,
1.590356, -1.391849, 1.449927, 1, 0, 0, 1, 1,
1.591566, 0.2143719, 3.123605, 1, 0, 0, 1, 1,
1.601087, -1.35657, 2.849657, 0, 0, 0, 1, 1,
1.616742, -0.8743748, 1.139585, 0, 0, 0, 1, 1,
1.622266, 1.193165, 1.993293, 0, 0, 0, 1, 1,
1.624988, 0.8735689, -0.2511653, 0, 0, 0, 1, 1,
1.625504, -0.3817662, 2.861933, 0, 0, 0, 1, 1,
1.629148, 1.539018, 2.24598, 0, 0, 0, 1, 1,
1.637593, -0.3752073, 2.231216, 0, 0, 0, 1, 1,
1.653129, -0.6979747, 2.132608, 1, 1, 1, 1, 1,
1.659976, -0.5884131, 1.853981, 1, 1, 1, 1, 1,
1.663533, 0.1888521, 0.2636773, 1, 1, 1, 1, 1,
1.694659, -1.44181, 2.815135, 1, 1, 1, 1, 1,
1.694948, 1.39785, 1.206712, 1, 1, 1, 1, 1,
1.700194, -0.1769632, 1.535964, 1, 1, 1, 1, 1,
1.739214, 1.632359, -0.2829566, 1, 1, 1, 1, 1,
1.759351, -0.9870223, 0.4862461, 1, 1, 1, 1, 1,
1.780278, -2.136738, 3.457413, 1, 1, 1, 1, 1,
1.801458, 2.021333, 0.884097, 1, 1, 1, 1, 1,
1.809664, 0.5677969, 1.155053, 1, 1, 1, 1, 1,
1.834988, -1.766585, 1.463483, 1, 1, 1, 1, 1,
1.861504, -0.6387514, 2.498136, 1, 1, 1, 1, 1,
1.871611, 1.111659, 0.9458482, 1, 1, 1, 1, 1,
1.968719, 0.8373541, 1.648971, 1, 1, 1, 1, 1,
2.003944, 0.04555061, 1.844301, 0, 0, 1, 1, 1,
2.015036, 0.6879624, -0.3092014, 1, 0, 0, 1, 1,
2.016738, -1.920757, 4.493857, 1, 0, 0, 1, 1,
2.027819, -1.359976, 3.351791, 1, 0, 0, 1, 1,
2.029443, -1.924394, 2.59066, 1, 0, 0, 1, 1,
2.047544, 0.687842, 1.978828, 1, 0, 0, 1, 1,
2.066454, 0.1457995, 1.778402, 0, 0, 0, 1, 1,
2.068711, -0.9947681, 0.9903989, 0, 0, 0, 1, 1,
2.108752, -2.201644, 3.030672, 0, 0, 0, 1, 1,
2.111967, 0.9449375, 1.780527, 0, 0, 0, 1, 1,
2.134561, 0.8910348, 0.4279834, 0, 0, 0, 1, 1,
2.166033, -0.6999725, 1.462857, 0, 0, 0, 1, 1,
2.18437, -1.223037, 2.356011, 0, 0, 0, 1, 1,
2.206338, -1.249646, 1.353333, 1, 1, 1, 1, 1,
2.264376, -0.167895, 2.695639, 1, 1, 1, 1, 1,
2.327834, 1.105536, 0.5406821, 1, 1, 1, 1, 1,
2.392823, -0.7863015, 2.534046, 1, 1, 1, 1, 1,
2.467605, -0.06300227, 1.501047, 1, 1, 1, 1, 1,
2.543606, -0.2174278, 1.481096, 1, 1, 1, 1, 1,
2.904115, 0.4192921, 2.785984, 1, 1, 1, 1, 1
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
var radius = 9.500808;
var distance = 33.37118;
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
mvMatrix.translate( 0.06846368, 0.2754713, 0.01042151 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.37118);
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
