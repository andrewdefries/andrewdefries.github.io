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
-2.968945, 0.2562322, -0.5683051, 1, 0, 0, 1,
-2.765499, -0.7282024, -1.542964, 1, 0.007843138, 0, 1,
-2.652303, -0.4117123, -0.3506539, 1, 0.01176471, 0, 1,
-2.651237, 0.9064059, -1.802103, 1, 0.01960784, 0, 1,
-2.551721, -0.2433829, -0.808138, 1, 0.02352941, 0, 1,
-2.251792, -0.1837829, -1.9034, 1, 0.03137255, 0, 1,
-2.142558, 0.8457211, -0.900117, 1, 0.03529412, 0, 1,
-2.123647, -0.09915686, -1.528436, 1, 0.04313726, 0, 1,
-2.096749, -0.848311, -1.734756, 1, 0.04705882, 0, 1,
-2.093458, 1.65569, -1.190934, 1, 0.05490196, 0, 1,
-2.039441, -1.167722, -2.050539, 1, 0.05882353, 0, 1,
-1.98549, 1.604264, 0.2645819, 1, 0.06666667, 0, 1,
-1.978084, 1.30802, -1.351644, 1, 0.07058824, 0, 1,
-1.948003, 1.040848, 0.1636367, 1, 0.07843138, 0, 1,
-1.927378, -0.4863026, -2.003962, 1, 0.08235294, 0, 1,
-1.903408, 0.6898994, -1.195014, 1, 0.09019608, 0, 1,
-1.889721, -1.351795, -1.368001, 1, 0.09411765, 0, 1,
-1.88682, -0.752373, -0.9091561, 1, 0.1019608, 0, 1,
-1.885392, 2.363391, -0.4299668, 1, 0.1098039, 0, 1,
-1.881902, 0.5624503, -1.009276, 1, 0.1137255, 0, 1,
-1.868801, 0.1678715, -1.686044, 1, 0.1215686, 0, 1,
-1.855765, 0.3474786, 0.3386734, 1, 0.1254902, 0, 1,
-1.848669, -1.560839, -1.821347, 1, 0.1333333, 0, 1,
-1.810012, 0.8881366, -1.515908, 1, 0.1372549, 0, 1,
-1.802746, 2.217058, -0.2231368, 1, 0.145098, 0, 1,
-1.787856, 0.4802546, -1.739868, 1, 0.1490196, 0, 1,
-1.785886, 1.510375, -0.5734511, 1, 0.1568628, 0, 1,
-1.781732, -1.556097, -1.996914, 1, 0.1607843, 0, 1,
-1.767411, 0.3615717, -1.230556, 1, 0.1686275, 0, 1,
-1.76078, -0.460732, -1.211221, 1, 0.172549, 0, 1,
-1.758587, 0.1862503, -1.919794, 1, 0.1803922, 0, 1,
-1.737081, 2.545036, -0.09589988, 1, 0.1843137, 0, 1,
-1.726684, 0.1434001, -2.850148, 1, 0.1921569, 0, 1,
-1.706099, -1.121024, -1.61087, 1, 0.1960784, 0, 1,
-1.687333, -0.3405021, -1.365892, 1, 0.2039216, 0, 1,
-1.666309, 0.992689, 0.6950222, 1, 0.2117647, 0, 1,
-1.6656, 2.46037, -0.04676693, 1, 0.2156863, 0, 1,
-1.664978, -1.586096, -2.941199, 1, 0.2235294, 0, 1,
-1.662532, -0.3638711, -1.479478, 1, 0.227451, 0, 1,
-1.658377, 0.2813759, -1.541664, 1, 0.2352941, 0, 1,
-1.657514, 0.1595659, -2.238252, 1, 0.2392157, 0, 1,
-1.656904, -0.8701504, -1.749688, 1, 0.2470588, 0, 1,
-1.633618, -1.168608, -1.802283, 1, 0.2509804, 0, 1,
-1.631541, -0.4575311, -2.068449, 1, 0.2588235, 0, 1,
-1.610227, 0.1351992, -2.129997, 1, 0.2627451, 0, 1,
-1.608667, 0.6068624, -0.5405468, 1, 0.2705882, 0, 1,
-1.601607, -0.8407, -1.466971, 1, 0.2745098, 0, 1,
-1.597724, 0.7501343, 0.4942397, 1, 0.282353, 0, 1,
-1.587045, -0.3013325, -1.576768, 1, 0.2862745, 0, 1,
-1.577649, -0.8417218, -0.939568, 1, 0.2941177, 0, 1,
-1.561334, -0.7845862, -2.624314, 1, 0.3019608, 0, 1,
-1.539889, 0.7517592, -1.380594, 1, 0.3058824, 0, 1,
-1.527717, 1.267026, -1.572181, 1, 0.3137255, 0, 1,
-1.51356, 0.7042362, -0.4241267, 1, 0.3176471, 0, 1,
-1.510025, 0.9428146, -0.5046672, 1, 0.3254902, 0, 1,
-1.505963, -0.232366, -2.353951, 1, 0.3294118, 0, 1,
-1.502423, -2.22763, -1.156019, 1, 0.3372549, 0, 1,
-1.494623, 0.5006051, -1.269672, 1, 0.3411765, 0, 1,
-1.488199, -1.394536, -1.727808, 1, 0.3490196, 0, 1,
-1.454604, -0.03121947, -2.589137, 1, 0.3529412, 0, 1,
-1.447284, 1.342165, -0.9360824, 1, 0.3607843, 0, 1,
-1.444895, 0.2011561, -2.466948, 1, 0.3647059, 0, 1,
-1.438839, -0.5854959, -3.046677, 1, 0.372549, 0, 1,
-1.406601, 0.05209021, -1.672018, 1, 0.3764706, 0, 1,
-1.400269, 1.68453, -0.9329131, 1, 0.3843137, 0, 1,
-1.390203, -1.212623, -2.962039, 1, 0.3882353, 0, 1,
-1.387694, 0.6818471, -0.5231826, 1, 0.3960784, 0, 1,
-1.387179, 0.649539, -1.671057, 1, 0.4039216, 0, 1,
-1.382634, 0.4567945, -0.9529068, 1, 0.4078431, 0, 1,
-1.380917, -1.03592, -0.963065, 1, 0.4156863, 0, 1,
-1.357463, 0.1245029, -1.3837, 1, 0.4196078, 0, 1,
-1.347202, 0.2684485, -0.01193253, 1, 0.427451, 0, 1,
-1.346601, 0.7006543, -0.3984732, 1, 0.4313726, 0, 1,
-1.34236, 2.187776, -1.175045, 1, 0.4392157, 0, 1,
-1.325669, -0.5182442, -2.443488, 1, 0.4431373, 0, 1,
-1.316729, 0.5288783, -0.86684, 1, 0.4509804, 0, 1,
-1.315871, 0.04439507, -0.8501658, 1, 0.454902, 0, 1,
-1.312937, 2.337993, -1.579072, 1, 0.4627451, 0, 1,
-1.285834, 1.338718, -1.964133, 1, 0.4666667, 0, 1,
-1.285722, -0.3607708, -1.17054, 1, 0.4745098, 0, 1,
-1.280468, -0.343636, -0.9874651, 1, 0.4784314, 0, 1,
-1.279358, -0.7267711, -3.306811, 1, 0.4862745, 0, 1,
-1.275221, -1.267271, -1.92917, 1, 0.4901961, 0, 1,
-1.253725, 0.3986125, 0.6266156, 1, 0.4980392, 0, 1,
-1.252032, 0.2362475, -2.509076, 1, 0.5058824, 0, 1,
-1.251326, 0.2969598, -0.9572259, 1, 0.509804, 0, 1,
-1.250129, -1.335169, -1.314805, 1, 0.5176471, 0, 1,
-1.238352, -0.06667438, -0.2284707, 1, 0.5215687, 0, 1,
-1.236858, -0.583487, -0.5564464, 1, 0.5294118, 0, 1,
-1.219802, 0.1806169, -1.464042, 1, 0.5333334, 0, 1,
-1.219273, 0.6014428, 0.6606503, 1, 0.5411765, 0, 1,
-1.214238, 0.003187426, -1.119342, 1, 0.5450981, 0, 1,
-1.212679, 0.5429494, -0.7420449, 1, 0.5529412, 0, 1,
-1.204671, -0.7905194, -1.257797, 1, 0.5568628, 0, 1,
-1.202639, -1.870595, -1.934703, 1, 0.5647059, 0, 1,
-1.201934, -0.3771915, -1.059625, 1, 0.5686275, 0, 1,
-1.19457, 0.3363177, -1.090182, 1, 0.5764706, 0, 1,
-1.19402, -0.6680251, -3.888156, 1, 0.5803922, 0, 1,
-1.190545, 0.49265, -3.130015, 1, 0.5882353, 0, 1,
-1.190402, 0.1476124, -1.946247, 1, 0.5921569, 0, 1,
-1.189285, 1.432522, -0.7162024, 1, 0.6, 0, 1,
-1.189, 0.006454272, -3.07175, 1, 0.6078432, 0, 1,
-1.173921, -0.5538982, -1.754058, 1, 0.6117647, 0, 1,
-1.167566, -0.4636048, -2.915095, 1, 0.6196079, 0, 1,
-1.166522, 0.4051419, -0.6991289, 1, 0.6235294, 0, 1,
-1.165723, -0.2828342, -1.258018, 1, 0.6313726, 0, 1,
-1.165364, -0.9210203, -4.505672, 1, 0.6352941, 0, 1,
-1.161653, -0.7910791, -0.8990791, 1, 0.6431373, 0, 1,
-1.158651, -0.5847316, -2.23659, 1, 0.6470588, 0, 1,
-1.157347, -1.132192, -2.481781, 1, 0.654902, 0, 1,
-1.157178, -0.08371913, -2.562604, 1, 0.6588235, 0, 1,
-1.157115, -0.9399767, -2.326144, 1, 0.6666667, 0, 1,
-1.151453, -1.307911, -1.661981, 1, 0.6705883, 0, 1,
-1.148111, -1.353254, 1.39832, 1, 0.6784314, 0, 1,
-1.147624, 1.232185, 0.747526, 1, 0.682353, 0, 1,
-1.141714, -0.5102295, -1.780056, 1, 0.6901961, 0, 1,
-1.138309, 0.3031196, -0.4783885, 1, 0.6941177, 0, 1,
-1.135729, 1.250552, 0.2518317, 1, 0.7019608, 0, 1,
-1.126312, -0.281154, -1.62734, 1, 0.7098039, 0, 1,
-1.125288, -0.03665445, -1.410537, 1, 0.7137255, 0, 1,
-1.125168, -1.308462, -3.292433, 1, 0.7215686, 0, 1,
-1.118611, -0.2779432, -2.492986, 1, 0.7254902, 0, 1,
-1.116714, 0.2059499, -2.598942, 1, 0.7333333, 0, 1,
-1.116053, -0.07601728, 0.2074708, 1, 0.7372549, 0, 1,
-1.113378, -0.4678808, -2.451468, 1, 0.7450981, 0, 1,
-1.097378, 0.7607634, -2.73785, 1, 0.7490196, 0, 1,
-1.096244, -0.9052192, -3.729325, 1, 0.7568628, 0, 1,
-1.095813, -0.8805841, -0.9778249, 1, 0.7607843, 0, 1,
-1.090016, 0.9632068, -0.6469852, 1, 0.7686275, 0, 1,
-1.086317, -0.2984882, -0.8598223, 1, 0.772549, 0, 1,
-1.085552, -2.233945, -1.803392, 1, 0.7803922, 0, 1,
-1.081719, -0.1301647, -2.232017, 1, 0.7843137, 0, 1,
-1.081094, -0.9724255, -2.652736, 1, 0.7921569, 0, 1,
-1.079082, -1.51352, -0.9893567, 1, 0.7960784, 0, 1,
-1.078138, 0.414362, -0.9947341, 1, 0.8039216, 0, 1,
-1.076588, 0.4046324, -0.01573097, 1, 0.8117647, 0, 1,
-1.073303, 1.422079, -1.142584, 1, 0.8156863, 0, 1,
-1.062936, -0.4601945, -1.103871, 1, 0.8235294, 0, 1,
-1.060767, -0.03791843, 0.1321392, 1, 0.827451, 0, 1,
-1.060573, 1.672759, -0.995296, 1, 0.8352941, 0, 1,
-1.051795, 0.6008211, -2.504411, 1, 0.8392157, 0, 1,
-1.048715, 2.555493, -1.53957, 1, 0.8470588, 0, 1,
-1.044798, -1.148881, -3.290239, 1, 0.8509804, 0, 1,
-1.042787, 0.8674426, -1.977908, 1, 0.8588235, 0, 1,
-1.039042, -0.2482248, -2.54487, 1, 0.8627451, 0, 1,
-1.037039, -0.4116946, -2.378974, 1, 0.8705882, 0, 1,
-1.035443, -0.84467, -2.725142, 1, 0.8745098, 0, 1,
-1.031654, 1.018392, -1.467035, 1, 0.8823529, 0, 1,
-1.030946, 0.3523169, 0.2147665, 1, 0.8862745, 0, 1,
-1.030436, 0.2014746, -1.408061, 1, 0.8941177, 0, 1,
-1.02664, -1.454476, -1.907276, 1, 0.8980392, 0, 1,
-1.006723, -0.1844073, -0.602736, 1, 0.9058824, 0, 1,
-1.004785, -0.5578925, -1.08163, 1, 0.9137255, 0, 1,
-1.001443, -0.1918854, -1.864324, 1, 0.9176471, 0, 1,
-0.9987149, 0.7680455, -1.105997, 1, 0.9254902, 0, 1,
-0.9969522, -1.14421, -0.3241672, 1, 0.9294118, 0, 1,
-0.9968681, -1.439235, -3.369839, 1, 0.9372549, 0, 1,
-0.9935933, -0.7523581, -2.182537, 1, 0.9411765, 0, 1,
-0.9925005, 0.5993553, -1.193109, 1, 0.9490196, 0, 1,
-0.990675, -0.860532, -1.344577, 1, 0.9529412, 0, 1,
-0.9861608, 1.354743, -0.373273, 1, 0.9607843, 0, 1,
-0.985835, -1.294485, -1.480786, 1, 0.9647059, 0, 1,
-0.9839532, -1.12563, -2.01321, 1, 0.972549, 0, 1,
-0.9769239, -1.271742, -3.410092, 1, 0.9764706, 0, 1,
-0.9750762, 1.435182, 0.2178484, 1, 0.9843137, 0, 1,
-0.96188, -1.485154, -2.427321, 1, 0.9882353, 0, 1,
-0.9549246, 0.342738, -0.9545472, 1, 0.9960784, 0, 1,
-0.940966, 0.5409243, -0.7928725, 0.9960784, 1, 0, 1,
-0.938192, 0.3040942, 1.467815, 0.9921569, 1, 0, 1,
-0.9373909, -0.4469732, -2.59126, 0.9843137, 1, 0, 1,
-0.9335467, -1.156151, -2.035403, 0.9803922, 1, 0, 1,
-0.9191898, -0.4027927, -2.769623, 0.972549, 1, 0, 1,
-0.9117342, -0.4056783, -1.538876, 0.9686275, 1, 0, 1,
-0.9016211, 0.7730704, -0.3309393, 0.9607843, 1, 0, 1,
-0.8949744, 0.431958, -1.463077, 0.9568627, 1, 0, 1,
-0.8938722, -0.4329416, -3.178518, 0.9490196, 1, 0, 1,
-0.8893737, -0.6938325, -0.8294981, 0.945098, 1, 0, 1,
-0.8877929, 0.1155824, -0.7928316, 0.9372549, 1, 0, 1,
-0.8848838, -0.5008383, -3.114836, 0.9333333, 1, 0, 1,
-0.8752652, -0.2491367, -2.525388, 0.9254902, 1, 0, 1,
-0.8742005, 0.3766522, 0.0364088, 0.9215686, 1, 0, 1,
-0.8741298, -0.8731169, -2.773963, 0.9137255, 1, 0, 1,
-0.871151, -1.1103, -4.053667, 0.9098039, 1, 0, 1,
-0.8710293, -1.616274, -2.918171, 0.9019608, 1, 0, 1,
-0.8565471, 0.3962156, -2.314806, 0.8941177, 1, 0, 1,
-0.8544889, -0.03389987, -2.597391, 0.8901961, 1, 0, 1,
-0.8528268, -1.333569, -3.050993, 0.8823529, 1, 0, 1,
-0.8524167, 0.585797, 0.04193286, 0.8784314, 1, 0, 1,
-0.8496789, -0.1961755, -2.174823, 0.8705882, 1, 0, 1,
-0.8477567, -0.9325077, -2.67826, 0.8666667, 1, 0, 1,
-0.8465527, -1.413273, -0.8599813, 0.8588235, 1, 0, 1,
-0.8351517, -1.710662, -3.369825, 0.854902, 1, 0, 1,
-0.8340924, -0.8376164, -2.826971, 0.8470588, 1, 0, 1,
-0.8334234, 0.5108796, -1.322841, 0.8431373, 1, 0, 1,
-0.832467, -1.079551, -3.679216, 0.8352941, 1, 0, 1,
-0.8276804, -0.9875057, -2.167319, 0.8313726, 1, 0, 1,
-0.8271633, -0.5065892, -2.642155, 0.8235294, 1, 0, 1,
-0.8238303, -0.1797836, -0.5949115, 0.8196079, 1, 0, 1,
-0.8231984, 0.3965938, -3.208992, 0.8117647, 1, 0, 1,
-0.8231768, -0.149604, -0.4094543, 0.8078431, 1, 0, 1,
-0.8183684, -0.2110138, -1.227729, 0.8, 1, 0, 1,
-0.818002, 0.09358963, -0.3965714, 0.7921569, 1, 0, 1,
-0.8149924, 0.3163409, -1.106909, 0.7882353, 1, 0, 1,
-0.8122709, -1.56936, -1.167588, 0.7803922, 1, 0, 1,
-0.8054661, -0.6328155, -2.26687, 0.7764706, 1, 0, 1,
-0.803383, 0.5616168, -1.446405, 0.7686275, 1, 0, 1,
-0.8028185, 0.7849243, -1.623312, 0.7647059, 1, 0, 1,
-0.7949253, -0.4920497, -2.952138, 0.7568628, 1, 0, 1,
-0.7929359, -0.1153865, -2.731395, 0.7529412, 1, 0, 1,
-0.7873939, 0.268996, -0.4627757, 0.7450981, 1, 0, 1,
-0.7799535, -0.7449651, -2.713993, 0.7411765, 1, 0, 1,
-0.7735578, -0.3204564, -2.904079, 0.7333333, 1, 0, 1,
-0.7721868, -0.3327987, -0.4741392, 0.7294118, 1, 0, 1,
-0.7719944, -0.1333688, -2.296499, 0.7215686, 1, 0, 1,
-0.7640906, -0.834469, -2.477739, 0.7176471, 1, 0, 1,
-0.7593791, 0.4511831, -2.945533, 0.7098039, 1, 0, 1,
-0.7568014, 0.5049655, 1.325942, 0.7058824, 1, 0, 1,
-0.754908, 0.1017133, 0.2239686, 0.6980392, 1, 0, 1,
-0.7429731, -0.7906393, -2.759378, 0.6901961, 1, 0, 1,
-0.7353134, 0.2976397, -3.153456, 0.6862745, 1, 0, 1,
-0.7339857, -1.765374, -3.653539, 0.6784314, 1, 0, 1,
-0.7338992, -0.6903479, -1.365234, 0.6745098, 1, 0, 1,
-0.7287681, -1.12348, -2.684577, 0.6666667, 1, 0, 1,
-0.7214307, 0.5334609, -1.220924, 0.6627451, 1, 0, 1,
-0.7149441, 0.737858, -2.456583, 0.654902, 1, 0, 1,
-0.7115039, 0.6239387, -0.07584536, 0.6509804, 1, 0, 1,
-0.7097631, -2.03095, -3.405035, 0.6431373, 1, 0, 1,
-0.7079386, 0.6691836, 0.3010848, 0.6392157, 1, 0, 1,
-0.7066632, -1.354203, -2.045506, 0.6313726, 1, 0, 1,
-0.7065406, -1.897683, -2.10462, 0.627451, 1, 0, 1,
-0.7047044, 0.2580255, -0.8449736, 0.6196079, 1, 0, 1,
-0.7019334, 1.406925, 0.9754859, 0.6156863, 1, 0, 1,
-0.6996908, -0.9293341, -4.74866, 0.6078432, 1, 0, 1,
-0.6930412, -2.135041, -3.122375, 0.6039216, 1, 0, 1,
-0.6839244, -1.059138, -3.269099, 0.5960785, 1, 0, 1,
-0.6833146, -1.920358, -2.8294, 0.5882353, 1, 0, 1,
-0.6778981, -0.7592945, -2.422198, 0.5843138, 1, 0, 1,
-0.6744239, 1.207301, -1.371957, 0.5764706, 1, 0, 1,
-0.6730515, 0.2099137, 0.1038749, 0.572549, 1, 0, 1,
-0.6715811, -0.2344392, -1.114376, 0.5647059, 1, 0, 1,
-0.6703836, -0.001966072, -2.268635, 0.5607843, 1, 0, 1,
-0.6620629, -0.1061899, -2.17711, 0.5529412, 1, 0, 1,
-0.654142, 0.7579513, 1.558681, 0.5490196, 1, 0, 1,
-0.647063, -0.4046114, -0.6594427, 0.5411765, 1, 0, 1,
-0.6420146, -0.9497079, -5.346019, 0.5372549, 1, 0, 1,
-0.6408468, -0.615785, -1.029622, 0.5294118, 1, 0, 1,
-0.6386998, 0.5089636, -1.680586, 0.5254902, 1, 0, 1,
-0.6275833, 1.090146, 0.5432351, 0.5176471, 1, 0, 1,
-0.6250638, 1.913471, -1.219824, 0.5137255, 1, 0, 1,
-0.623998, 2.552706, -1.784584, 0.5058824, 1, 0, 1,
-0.6176999, -0.8114682, -4.605175, 0.5019608, 1, 0, 1,
-0.6058824, 1.125285, -0.3970259, 0.4941176, 1, 0, 1,
-0.6036384, -0.07660563, -2.974187, 0.4862745, 1, 0, 1,
-0.5972651, -0.3555988, -2.830554, 0.4823529, 1, 0, 1,
-0.595044, -1.05646, -2.477716, 0.4745098, 1, 0, 1,
-0.5926666, -0.7870461, -1.715108, 0.4705882, 1, 0, 1,
-0.5831473, 0.632865, -0.4624421, 0.4627451, 1, 0, 1,
-0.5814927, 0.1803831, -1.727006, 0.4588235, 1, 0, 1,
-0.5807856, 1.733173, -0.6964911, 0.4509804, 1, 0, 1,
-0.5774527, 0.569766, 0.1435198, 0.4470588, 1, 0, 1,
-0.5725414, -1.592911, -1.30536, 0.4392157, 1, 0, 1,
-0.5716109, -0.6956795, -2.139438, 0.4352941, 1, 0, 1,
-0.5682729, 0.3232903, -0.2068414, 0.427451, 1, 0, 1,
-0.5666163, 0.0131005, -0.8006677, 0.4235294, 1, 0, 1,
-0.5641356, 1.599596, -0.0365428, 0.4156863, 1, 0, 1,
-0.5637622, 1.327885, 0.5641056, 0.4117647, 1, 0, 1,
-0.5593261, 0.4371602, -0.1669663, 0.4039216, 1, 0, 1,
-0.5547135, 2.225549, -0.6841522, 0.3960784, 1, 0, 1,
-0.5539667, 1.159881, 1.126146, 0.3921569, 1, 0, 1,
-0.5521315, -0.6153269, -0.9222554, 0.3843137, 1, 0, 1,
-0.5354192, -1.144328, -2.874358, 0.3803922, 1, 0, 1,
-0.5329785, -1.229518, -1.635175, 0.372549, 1, 0, 1,
-0.5316188, -0.3934632, -1.781234, 0.3686275, 1, 0, 1,
-0.529976, 1.007531, -1.168775, 0.3607843, 1, 0, 1,
-0.5280666, 0.9094334, -0.905852, 0.3568628, 1, 0, 1,
-0.5233878, 0.01835309, -1.434885, 0.3490196, 1, 0, 1,
-0.5215043, 2.057368, -1.482857, 0.345098, 1, 0, 1,
-0.5212346, -1.965769, -2.156395, 0.3372549, 1, 0, 1,
-0.5211525, 0.5240859, -0.135501, 0.3333333, 1, 0, 1,
-0.5132044, -0.5332121, -2.016458, 0.3254902, 1, 0, 1,
-0.5077116, 0.2300592, 0.118977, 0.3215686, 1, 0, 1,
-0.4964379, -0.02201437, -2.442466, 0.3137255, 1, 0, 1,
-0.4879158, -0.3461182, -1.546137, 0.3098039, 1, 0, 1,
-0.484353, -0.133767, -1.368661, 0.3019608, 1, 0, 1,
-0.4840441, -0.7613035, -1.173268, 0.2941177, 1, 0, 1,
-0.4838171, -0.7145613, -2.877864, 0.2901961, 1, 0, 1,
-0.4807536, 0.4421346, -1.775625, 0.282353, 1, 0, 1,
-0.480339, 0.2629899, 0.2119594, 0.2784314, 1, 0, 1,
-0.4780966, 0.9621201, -0.6344126, 0.2705882, 1, 0, 1,
-0.4751843, 1.304036, -0.6841348, 0.2666667, 1, 0, 1,
-0.4741157, -0.208412, -2.947068, 0.2588235, 1, 0, 1,
-0.4718659, 0.618351, 0.5178312, 0.254902, 1, 0, 1,
-0.4710267, -0.3080123, -2.678178, 0.2470588, 1, 0, 1,
-0.4543588, 0.06622102, -0.6692657, 0.2431373, 1, 0, 1,
-0.4469346, -1.010655, -1.953422, 0.2352941, 1, 0, 1,
-0.4466664, 0.6660408, -1.248706, 0.2313726, 1, 0, 1,
-0.444683, 0.683087, 0.9828264, 0.2235294, 1, 0, 1,
-0.4418746, 0.1760699, -1.540579, 0.2196078, 1, 0, 1,
-0.4415415, 1.512332, 1.304766, 0.2117647, 1, 0, 1,
-0.4392251, -0.7786188, -0.926438, 0.2078431, 1, 0, 1,
-0.4377209, 0.3232467, -0.7696393, 0.2, 1, 0, 1,
-0.4346836, 0.4953681, -2.054639, 0.1921569, 1, 0, 1,
-0.4268586, 0.3611558, -0.8016068, 0.1882353, 1, 0, 1,
-0.423425, -1.069141, -1.475059, 0.1803922, 1, 0, 1,
-0.4216261, 1.449367, -0.9605261, 0.1764706, 1, 0, 1,
-0.419381, -0.4198937, -2.664226, 0.1686275, 1, 0, 1,
-0.416324, -1.370326, -3.199399, 0.1647059, 1, 0, 1,
-0.4121047, -1.035452, -3.817772, 0.1568628, 1, 0, 1,
-0.403737, -1.077162, -3.690315, 0.1529412, 1, 0, 1,
-0.4004163, -0.8714201, -2.751756, 0.145098, 1, 0, 1,
-0.3963281, 0.2225172, 0.7813252, 0.1411765, 1, 0, 1,
-0.3890994, 1.198458, 0.5244199, 0.1333333, 1, 0, 1,
-0.3837323, -0.586622, -5.362337, 0.1294118, 1, 0, 1,
-0.38313, -0.4263091, -2.154885, 0.1215686, 1, 0, 1,
-0.3814689, -0.8417441, -4.537988, 0.1176471, 1, 0, 1,
-0.3813279, 0.3726246, -0.4096182, 0.1098039, 1, 0, 1,
-0.378026, 0.5591449, 0.9025103, 0.1058824, 1, 0, 1,
-0.3763469, 0.2911727, -0.6292029, 0.09803922, 1, 0, 1,
-0.3742572, -0.2078844, -3.155444, 0.09019608, 1, 0, 1,
-0.3723482, 0.7788139, 0.6687229, 0.08627451, 1, 0, 1,
-0.3690823, -0.5265045, -2.815883, 0.07843138, 1, 0, 1,
-0.3685415, -0.5783558, -2.69438, 0.07450981, 1, 0, 1,
-0.3661999, -0.00314393, -2.586965, 0.06666667, 1, 0, 1,
-0.3659921, -0.7977824, -3.800773, 0.0627451, 1, 0, 1,
-0.361041, -0.5085205, -3.670829, 0.05490196, 1, 0, 1,
-0.3594681, -0.1226642, -2.487623, 0.05098039, 1, 0, 1,
-0.3566825, -1.81045, -2.834823, 0.04313726, 1, 0, 1,
-0.3555646, -1.754403, -2.166881, 0.03921569, 1, 0, 1,
-0.3524345, -1.154828, -2.221996, 0.03137255, 1, 0, 1,
-0.351995, -0.2330922, -3.79815, 0.02745098, 1, 0, 1,
-0.351149, 1.295552, -1.569845, 0.01960784, 1, 0, 1,
-0.3493226, 0.05781923, -2.587907, 0.01568628, 1, 0, 1,
-0.3443165, 0.5445297, -0.8671446, 0.007843138, 1, 0, 1,
-0.3437096, 0.7949018, -1.373628, 0.003921569, 1, 0, 1,
-0.3411116, -0.8272846, -2.560114, 0, 1, 0.003921569, 1,
-0.3408808, -1.090596, -4.249533, 0, 1, 0.01176471, 1,
-0.3408594, -0.0504237, -1.87086, 0, 1, 0.01568628, 1,
-0.3404027, 0.3833596, -1.099273, 0, 1, 0.02352941, 1,
-0.3370263, 1.048995, -1.520552, 0, 1, 0.02745098, 1,
-0.3328147, -0.9234048, -2.008409, 0, 1, 0.03529412, 1,
-0.3325023, -0.5814604, -2.245898, 0, 1, 0.03921569, 1,
-0.3316893, 1.249573, -1.299517, 0, 1, 0.04705882, 1,
-0.3271342, -2.67342, -2.859332, 0, 1, 0.05098039, 1,
-0.3267474, 0.1762201, -2.05429, 0, 1, 0.05882353, 1,
-0.3238317, -0.9990988, -2.868235, 0, 1, 0.0627451, 1,
-0.3224756, 0.7851193, -2.417495, 0, 1, 0.07058824, 1,
-0.3203623, 0.9376429, -2.208152, 0, 1, 0.07450981, 1,
-0.3185273, 0.328287, 0.2174976, 0, 1, 0.08235294, 1,
-0.318441, 0.3309039, 1.489142, 0, 1, 0.08627451, 1,
-0.3175189, -0.4310662, -0.6591754, 0, 1, 0.09411765, 1,
-0.3154693, 0.9254571, 1.507204, 0, 1, 0.1019608, 1,
-0.3120315, -1.281831, -3.132374, 0, 1, 0.1058824, 1,
-0.3115168, 0.2245137, 0.02721846, 0, 1, 0.1137255, 1,
-0.3093433, 0.1721463, -1.950406, 0, 1, 0.1176471, 1,
-0.3089771, -0.4027943, -2.583436, 0, 1, 0.1254902, 1,
-0.3080232, 0.09038255, -2.265095, 0, 1, 0.1294118, 1,
-0.2999008, 0.1065599, -1.706479, 0, 1, 0.1372549, 1,
-0.2993807, 1.104474, -0.4987216, 0, 1, 0.1411765, 1,
-0.2986437, -1.019022, -2.571411, 0, 1, 0.1490196, 1,
-0.297733, -1.606431, -2.013426, 0, 1, 0.1529412, 1,
-0.2965889, 1.225226, 0.3318893, 0, 1, 0.1607843, 1,
-0.2925302, -0.2740128, -2.688649, 0, 1, 0.1647059, 1,
-0.2913699, -0.3306399, -2.601425, 0, 1, 0.172549, 1,
-0.2883237, 2.312674, 0.1970906, 0, 1, 0.1764706, 1,
-0.2806039, -0.6817716, -3.67723, 0, 1, 0.1843137, 1,
-0.2780491, 0.5313686, -1.863296, 0, 1, 0.1882353, 1,
-0.276031, 0.5799853, 1.004277, 0, 1, 0.1960784, 1,
-0.2698377, 0.4825424, -0.230217, 0, 1, 0.2039216, 1,
-0.2670156, 1.883074, -0.9639494, 0, 1, 0.2078431, 1,
-0.2660706, -0.4901047, -3.402266, 0, 1, 0.2156863, 1,
-0.2613296, 0.04393873, -0.7085485, 0, 1, 0.2196078, 1,
-0.2599794, 0.3969994, -0.4667708, 0, 1, 0.227451, 1,
-0.2599488, -0.02358216, -3.312823, 0, 1, 0.2313726, 1,
-0.2549473, 1.949454, -0.6212935, 0, 1, 0.2392157, 1,
-0.247373, -0.05233391, -3.730506, 0, 1, 0.2431373, 1,
-0.2458743, -0.4451033, -1.950971, 0, 1, 0.2509804, 1,
-0.2449291, 1.160516, 0.4461451, 0, 1, 0.254902, 1,
-0.2431175, 0.9759706, 0.6913792, 0, 1, 0.2627451, 1,
-0.242694, 0.1116164, -1.009072, 0, 1, 0.2666667, 1,
-0.2378369, 1.376733, -1.441657, 0, 1, 0.2745098, 1,
-0.2372152, -0.01572928, -2.40697, 0, 1, 0.2784314, 1,
-0.235143, 0.1371941, 0.2107216, 0, 1, 0.2862745, 1,
-0.2348487, -0.9256176, -0.8823509, 0, 1, 0.2901961, 1,
-0.2330195, -0.8096196, -2.207618, 0, 1, 0.2980392, 1,
-0.2328996, 1.698733, -1.364485, 0, 1, 0.3058824, 1,
-0.2293501, -1.463157, -0.8998671, 0, 1, 0.3098039, 1,
-0.225912, -1.006297, -4.013773, 0, 1, 0.3176471, 1,
-0.2228304, 1.321404, 0.6668131, 0, 1, 0.3215686, 1,
-0.2204072, -1.727648, -3.779589, 0, 1, 0.3294118, 1,
-0.2188518, 0.4775226, -0.2548226, 0, 1, 0.3333333, 1,
-0.2178908, -0.6685031, -1.530073, 0, 1, 0.3411765, 1,
-0.2175955, -0.84134, -2.925308, 0, 1, 0.345098, 1,
-0.213521, 1.561689, 1.394774, 0, 1, 0.3529412, 1,
-0.2061298, 0.166168, -0.3174754, 0, 1, 0.3568628, 1,
-0.2030047, 0.6183753, 0.8244905, 0, 1, 0.3647059, 1,
-0.1957588, -0.3157728, -3.861372, 0, 1, 0.3686275, 1,
-0.1913966, -0.7111756, -2.034719, 0, 1, 0.3764706, 1,
-0.1908652, -1.130741, -2.151688, 0, 1, 0.3803922, 1,
-0.189302, -1.423146, -3.645136, 0, 1, 0.3882353, 1,
-0.1872327, -0.4312811, -2.732592, 0, 1, 0.3921569, 1,
-0.1838558, -0.7902578, -2.611293, 0, 1, 0.4, 1,
-0.1781006, 1.169835, 0.3608227, 0, 1, 0.4078431, 1,
-0.172879, 0.3998345, -1.571428, 0, 1, 0.4117647, 1,
-0.1706785, 0.1353839, 0.4405585, 0, 1, 0.4196078, 1,
-0.1699398, -0.2578555, -3.407109, 0, 1, 0.4235294, 1,
-0.1683246, 0.3106298, -1.805433, 0, 1, 0.4313726, 1,
-0.1659003, 1.008511, -0.07077458, 0, 1, 0.4352941, 1,
-0.1633796, 0.3391865, -0.06918832, 0, 1, 0.4431373, 1,
-0.1609563, 0.1824959, -0.6831759, 0, 1, 0.4470588, 1,
-0.1603602, 1.63258, -1.418838, 0, 1, 0.454902, 1,
-0.1591155, 1.441659, -0.8863026, 0, 1, 0.4588235, 1,
-0.1573676, 0.7995576, 0.09146678, 0, 1, 0.4666667, 1,
-0.1552105, -0.2699422, -2.015533, 0, 1, 0.4705882, 1,
-0.1491721, 1.082856, -1.333965, 0, 1, 0.4784314, 1,
-0.1472209, 0.4971739, 0.4853849, 0, 1, 0.4823529, 1,
-0.1445977, -0.4121672, -2.175059, 0, 1, 0.4901961, 1,
-0.1391914, -0.3074968, -2.349571, 0, 1, 0.4941176, 1,
-0.1369901, -0.8003541, -2.807973, 0, 1, 0.5019608, 1,
-0.1344886, 0.9397956, 0.675247, 0, 1, 0.509804, 1,
-0.1312929, -1.528926, -2.777514, 0, 1, 0.5137255, 1,
-0.1309401, 0.9111929, 1.325451, 0, 1, 0.5215687, 1,
-0.1263891, -1.844281, -1.34982, 0, 1, 0.5254902, 1,
-0.1252606, -0.7555711, -5.285976, 0, 1, 0.5333334, 1,
-0.1227641, -1.441024, -1.571514, 0, 1, 0.5372549, 1,
-0.1221131, -1.055824, -4.793033, 0, 1, 0.5450981, 1,
-0.1212694, -1.703848, -3.048831, 0, 1, 0.5490196, 1,
-0.1152455, -0.8620021, -4.408523, 0, 1, 0.5568628, 1,
-0.1144722, -1.081565, -2.275568, 0, 1, 0.5607843, 1,
-0.1095623, 0.1684831, 0.7875441, 0, 1, 0.5686275, 1,
-0.1091164, 1.004371, -0.09601092, 0, 1, 0.572549, 1,
-0.1064316, -2.14871, -4.789346, 0, 1, 0.5803922, 1,
-0.1048323, -0.3025311, -2.579766, 0, 1, 0.5843138, 1,
-0.1026786, 0.9956303, -0.2795179, 0, 1, 0.5921569, 1,
-0.09967573, 0.5957463, -1.818249, 0, 1, 0.5960785, 1,
-0.09873909, -3.528385, -2.077287, 0, 1, 0.6039216, 1,
-0.09756433, -1.754097, -3.112731, 0, 1, 0.6117647, 1,
-0.08879499, 0.05728202, -1.631942, 0, 1, 0.6156863, 1,
-0.08844581, 0.9787354, -0.1860124, 0, 1, 0.6235294, 1,
-0.08075215, -0.2106256, -4.865628, 0, 1, 0.627451, 1,
-0.07948898, -1.717445, -4.054293, 0, 1, 0.6352941, 1,
-0.07508998, 1.052961, -0.2117026, 0, 1, 0.6392157, 1,
-0.07403061, -0.2677843, -3.586552, 0, 1, 0.6470588, 1,
-0.06935161, 0.8495323, 0.5526057, 0, 1, 0.6509804, 1,
-0.06631468, 0.6548724, -0.8955634, 0, 1, 0.6588235, 1,
-0.05878228, -1.183728, -1.563535, 0, 1, 0.6627451, 1,
-0.05802629, 0.8915509, -3.030784, 0, 1, 0.6705883, 1,
-0.05025685, 0.9277897, 0.1261309, 0, 1, 0.6745098, 1,
-0.04813454, -0.7599672, -3.279048, 0, 1, 0.682353, 1,
-0.04480468, 0.1841832, -0.1625729, 0, 1, 0.6862745, 1,
-0.0429285, -0.4468559, -4.973608, 0, 1, 0.6941177, 1,
-0.04213668, -3.551763, -4.86535, 0, 1, 0.7019608, 1,
-0.03705282, 1.179707, 1.431892, 0, 1, 0.7058824, 1,
-0.03499041, -0.4716338, -1.332616, 0, 1, 0.7137255, 1,
-0.03414079, -0.0816657, -1.914749, 0, 1, 0.7176471, 1,
-0.02829373, 0.6418772, 1.318078, 0, 1, 0.7254902, 1,
-0.02187508, -0.3437597, -2.687231, 0, 1, 0.7294118, 1,
-0.02013765, 0.1902132, -0.2043103, 0, 1, 0.7372549, 1,
-0.01944791, 0.9730836, -0.3515483, 0, 1, 0.7411765, 1,
-0.01801352, -0.343694, -2.436185, 0, 1, 0.7490196, 1,
-0.01452384, 1.252332, -0.6025416, 0, 1, 0.7529412, 1,
-0.01431786, -0.406107, -3.716571, 0, 1, 0.7607843, 1,
-0.01335319, 0.02309966, -0.5312387, 0, 1, 0.7647059, 1,
-0.01109929, -0.7345749, -3.385916, 0, 1, 0.772549, 1,
-0.006397027, -0.4445142, -3.123109, 0, 1, 0.7764706, 1,
-0.005819671, -1.363414, -4.896732, 0, 1, 0.7843137, 1,
-0.001083127, 0.994202, 1.851487, 0, 1, 0.7882353, 1,
0.00204156, -0.2864521, 3.412317, 0, 1, 0.7960784, 1,
0.007905471, 1.26384, -0.7098203, 0, 1, 0.8039216, 1,
0.01207304, 0.06581657, -1.4739, 0, 1, 0.8078431, 1,
0.01353683, -0.8801259, 3.991039, 0, 1, 0.8156863, 1,
0.0149424, -0.2305454, 3.183313, 0, 1, 0.8196079, 1,
0.01741986, -0.3375106, 3.034213, 0, 1, 0.827451, 1,
0.01801659, -0.6472019, 4.307766, 0, 1, 0.8313726, 1,
0.01801729, -0.0375912, 1.745476, 0, 1, 0.8392157, 1,
0.01888378, -0.5428226, 2.082056, 0, 1, 0.8431373, 1,
0.02092529, 0.6468936, 1.155384, 0, 1, 0.8509804, 1,
0.0234272, 1.677094, 1.267303, 0, 1, 0.854902, 1,
0.02658528, -0.2153816, 3.10246, 0, 1, 0.8627451, 1,
0.02711787, 2.055952, 0.1774419, 0, 1, 0.8666667, 1,
0.02733197, 1.259232, -0.1334581, 0, 1, 0.8745098, 1,
0.03008195, 0.6199024, 1.320367, 0, 1, 0.8784314, 1,
0.03024328, 0.2601652, -0.5579998, 0, 1, 0.8862745, 1,
0.03370328, -0.3678295, 3.013092, 0, 1, 0.8901961, 1,
0.03429737, -0.8166531, 3.315718, 0, 1, 0.8980392, 1,
0.0349552, 0.5093588, -1.046883, 0, 1, 0.9058824, 1,
0.03581335, 0.01113394, 1.090405, 0, 1, 0.9098039, 1,
0.03602521, -1.910647, 4.007081, 0, 1, 0.9176471, 1,
0.04089361, -0.6558922, 2.584244, 0, 1, 0.9215686, 1,
0.04588806, -1.214806, 2.904688, 0, 1, 0.9294118, 1,
0.04672421, -0.9929314, 3.720847, 0, 1, 0.9333333, 1,
0.05092193, 0.705385, -0.04446281, 0, 1, 0.9411765, 1,
0.05129347, -0.2052695, 1.818379, 0, 1, 0.945098, 1,
0.05250473, -0.7261552, 3.234013, 0, 1, 0.9529412, 1,
0.05429183, 1.089264, -0.2765376, 0, 1, 0.9568627, 1,
0.05700026, 1.265486, -1.626141, 0, 1, 0.9647059, 1,
0.06035772, 1.41486, 0.8493001, 0, 1, 0.9686275, 1,
0.06523916, 0.9338975, -0.2259202, 0, 1, 0.9764706, 1,
0.06656326, -1.381951, 2.02013, 0, 1, 0.9803922, 1,
0.06965406, 1.415764, 0.5988718, 0, 1, 0.9882353, 1,
0.07336195, -1.222321, 3.78793, 0, 1, 0.9921569, 1,
0.07666163, -0.3470559, 2.967409, 0, 1, 1, 1,
0.08571675, 0.3286344, -1.957518, 0, 0.9921569, 1, 1,
0.08774336, -0.9606655, 1.277046, 0, 0.9882353, 1, 1,
0.08883199, -0.4115299, 2.780679, 0, 0.9803922, 1, 1,
0.0906156, 2.06883, 0.05109267, 0, 0.9764706, 1, 1,
0.09076349, -0.6000383, 3.048267, 0, 0.9686275, 1, 1,
0.09165597, 0.4718978, 0.4667133, 0, 0.9647059, 1, 1,
0.09386616, 0.02066431, -0.05955856, 0, 0.9568627, 1, 1,
0.09713019, -1.771044, 4.025395, 0, 0.9529412, 1, 1,
0.1027424, -1.216687, 3.206002, 0, 0.945098, 1, 1,
0.103411, 0.6260381, 0.02437639, 0, 0.9411765, 1, 1,
0.1035404, 0.4967945, -1.423756, 0, 0.9333333, 1, 1,
0.1055621, -1.478114, 1.879712, 0, 0.9294118, 1, 1,
0.1061198, 0.806232, 0.07303415, 0, 0.9215686, 1, 1,
0.1101706, 1.403321, 0.1520901, 0, 0.9176471, 1, 1,
0.1112978, 0.8618341, 1.112115, 0, 0.9098039, 1, 1,
0.1148917, 2.169327, -0.9298998, 0, 0.9058824, 1, 1,
0.1151241, -1.023262, 3.31082, 0, 0.8980392, 1, 1,
0.1164073, -0.3688738, 2.269644, 0, 0.8901961, 1, 1,
0.1175826, 0.9921384, -1.264376, 0, 0.8862745, 1, 1,
0.1203545, -1.15077, 2.944786, 0, 0.8784314, 1, 1,
0.1209996, -0.5502103, 2.447395, 0, 0.8745098, 1, 1,
0.1218916, 1.546544, -0.06623579, 0, 0.8666667, 1, 1,
0.1245618, -0.5394901, 3.61578, 0, 0.8627451, 1, 1,
0.1253134, -0.3927376, 3.321995, 0, 0.854902, 1, 1,
0.1269778, -0.2915566, 1.115209, 0, 0.8509804, 1, 1,
0.1291422, 0.5866783, 0.02914141, 0, 0.8431373, 1, 1,
0.1326424, 2.498937, 0.3241237, 0, 0.8392157, 1, 1,
0.1336581, -1.178441, 3.299787, 0, 0.8313726, 1, 1,
0.1395035, -0.8486924, 0.398282, 0, 0.827451, 1, 1,
0.1495884, 0.1752123, -0.09965823, 0, 0.8196079, 1, 1,
0.1509931, -2.056784, 3.603143, 0, 0.8156863, 1, 1,
0.1533647, -0.01988487, 2.670233, 0, 0.8078431, 1, 1,
0.1538011, -0.8409231, 3.590565, 0, 0.8039216, 1, 1,
0.1542336, 0.8279436, 0.8528721, 0, 0.7960784, 1, 1,
0.154836, -1.195558, 2.148233, 0, 0.7882353, 1, 1,
0.1616035, -0.5328544, 2.593808, 0, 0.7843137, 1, 1,
0.1629383, 0.4863413, 1.812245, 0, 0.7764706, 1, 1,
0.1640015, -1.45716, 3.814917, 0, 0.772549, 1, 1,
0.1640419, 0.5549608, -0.7228075, 0, 0.7647059, 1, 1,
0.1646385, 0.03803436, 0.2122424, 0, 0.7607843, 1, 1,
0.1660656, -0.6072971, 3.590251, 0, 0.7529412, 1, 1,
0.1687275, -0.5612589, 2.433944, 0, 0.7490196, 1, 1,
0.1694295, 0.9695387, -1.127756, 0, 0.7411765, 1, 1,
0.1711313, -0.3879287, 3.896372, 0, 0.7372549, 1, 1,
0.1729276, 1.111938, -1.239322, 0, 0.7294118, 1, 1,
0.1729765, -2.009943, 2.96342, 0, 0.7254902, 1, 1,
0.1747186, -0.1794043, 3.017977, 0, 0.7176471, 1, 1,
0.1778191, 0.3755572, 0.694393, 0, 0.7137255, 1, 1,
0.1793579, -0.2725931, 2.176465, 0, 0.7058824, 1, 1,
0.1880564, -1.337858, 1.799653, 0, 0.6980392, 1, 1,
0.1959804, -0.8955873, 4.675336, 0, 0.6941177, 1, 1,
0.1961571, 0.5959334, -1.027936, 0, 0.6862745, 1, 1,
0.1972721, -0.2286173, 2.039595, 0, 0.682353, 1, 1,
0.1989489, 0.5222684, 0.8911172, 0, 0.6745098, 1, 1,
0.2014763, 0.01797394, 1.042617, 0, 0.6705883, 1, 1,
0.201634, 2.045826, 0.7385587, 0, 0.6627451, 1, 1,
0.2022218, 0.5101192, 0.6000972, 0, 0.6588235, 1, 1,
0.2024476, 0.6503069, 1.56359, 0, 0.6509804, 1, 1,
0.2041911, 0.8582338, 0.1465538, 0, 0.6470588, 1, 1,
0.2052306, 0.5353953, 0.9214492, 0, 0.6392157, 1, 1,
0.2053718, -1.180169, 3.222799, 0, 0.6352941, 1, 1,
0.2059104, -0.480489, 1.612923, 0, 0.627451, 1, 1,
0.2064891, 0.2129744, 2.094826, 0, 0.6235294, 1, 1,
0.2088221, -0.08370068, 3.631012, 0, 0.6156863, 1, 1,
0.2120018, -0.0850568, 1.736069, 0, 0.6117647, 1, 1,
0.2130836, 0.5355487, -0.1837651, 0, 0.6039216, 1, 1,
0.2195868, 1.063412, 0.9285811, 0, 0.5960785, 1, 1,
0.2197898, 0.08213753, 2.738481, 0, 0.5921569, 1, 1,
0.223645, -1.246989, 4.298928, 0, 0.5843138, 1, 1,
0.2249206, 0.1300868, 2.466253, 0, 0.5803922, 1, 1,
0.2327296, -0.6133605, 3.964466, 0, 0.572549, 1, 1,
0.2398604, 1.067068, -0.1659181, 0, 0.5686275, 1, 1,
0.2401395, 0.02974436, 1.387558, 0, 0.5607843, 1, 1,
0.2401737, -0.01877684, 2.419142, 0, 0.5568628, 1, 1,
0.244432, 0.04647094, 0.9370967, 0, 0.5490196, 1, 1,
0.2462049, 0.3605281, -0.03668879, 0, 0.5450981, 1, 1,
0.2480038, -2.034842, 3.277158, 0, 0.5372549, 1, 1,
0.2530161, 0.4757346, -0.638365, 0, 0.5333334, 1, 1,
0.2535417, 0.1078301, 0.6468949, 0, 0.5254902, 1, 1,
0.2538469, -1.251256, 5.069025, 0, 0.5215687, 1, 1,
0.2546738, 0.2595261, 3.139997, 0, 0.5137255, 1, 1,
0.2550539, -0.893934, 2.7608, 0, 0.509804, 1, 1,
0.2581589, -0.1964683, 2.521101, 0, 0.5019608, 1, 1,
0.2607965, -1.493453, 3.510942, 0, 0.4941176, 1, 1,
0.262367, -0.03627582, 1.723679, 0, 0.4901961, 1, 1,
0.2629085, -0.7095468, 3.255721, 0, 0.4823529, 1, 1,
0.2636223, 1.289174, 0.5658408, 0, 0.4784314, 1, 1,
0.2671758, -1.141617, 3.049931, 0, 0.4705882, 1, 1,
0.2697477, -0.9229211, 0.9873071, 0, 0.4666667, 1, 1,
0.2770282, 1.273359, -0.03695852, 0, 0.4588235, 1, 1,
0.2793451, -0.1506409, 4.390327, 0, 0.454902, 1, 1,
0.2813991, 0.8812119, 2.721254, 0, 0.4470588, 1, 1,
0.2836884, -0.2983375, 1.828764, 0, 0.4431373, 1, 1,
0.2845784, -0.5479928, 2.258258, 0, 0.4352941, 1, 1,
0.2853589, -1.119924, 4.182536, 0, 0.4313726, 1, 1,
0.2865424, 0.05461738, 1.43536, 0, 0.4235294, 1, 1,
0.2982126, -1.370136, 2.877843, 0, 0.4196078, 1, 1,
0.298351, -1.799217, 1.804592, 0, 0.4117647, 1, 1,
0.2998661, 0.2103273, 1.373726, 0, 0.4078431, 1, 1,
0.3014975, -0.5820155, 2.470399, 0, 0.4, 1, 1,
0.303562, -0.4756466, 2.254111, 0, 0.3921569, 1, 1,
0.3046559, 1.338251, -1.531087, 0, 0.3882353, 1, 1,
0.3098909, 1.949245, -0.2183034, 0, 0.3803922, 1, 1,
0.3130485, -0.0809314, 2.818369, 0, 0.3764706, 1, 1,
0.31531, 1.058567, 2.166851, 0, 0.3686275, 1, 1,
0.3155859, -0.245474, 1.36073, 0, 0.3647059, 1, 1,
0.3195341, -1.311352, 4.473037, 0, 0.3568628, 1, 1,
0.3197368, 0.5131813, 2.081851, 0, 0.3529412, 1, 1,
0.3254124, 0.1582246, 1.39769, 0, 0.345098, 1, 1,
0.3255375, 0.7684147, -1.031199, 0, 0.3411765, 1, 1,
0.3309838, -1.955708, 3.733423, 0, 0.3333333, 1, 1,
0.3321829, -0.7804397, 4.136992, 0, 0.3294118, 1, 1,
0.3331049, -0.6244915, 1.594362, 0, 0.3215686, 1, 1,
0.3337242, -0.611377, 2.596458, 0, 0.3176471, 1, 1,
0.3337659, 0.2286565, 2.292723, 0, 0.3098039, 1, 1,
0.3340055, 0.4043022, 0.7769994, 0, 0.3058824, 1, 1,
0.336181, 0.053373, 0.475876, 0, 0.2980392, 1, 1,
0.3370375, -1.204638, 3.070933, 0, 0.2901961, 1, 1,
0.3378481, -2.569951, 2.954823, 0, 0.2862745, 1, 1,
0.3393141, 1.024363, -0.3068171, 0, 0.2784314, 1, 1,
0.340795, 1.210522, 1.230295, 0, 0.2745098, 1, 1,
0.3510083, -0.3312938, 3.423749, 0, 0.2666667, 1, 1,
0.3541071, -2.181325, 3.862319, 0, 0.2627451, 1, 1,
0.354968, -0.4304588, 3.813183, 0, 0.254902, 1, 1,
0.3561034, 0.002560819, 2.920198, 0, 0.2509804, 1, 1,
0.3563142, -0.6198048, 1.209905, 0, 0.2431373, 1, 1,
0.3564572, -1.174412, 0.672702, 0, 0.2392157, 1, 1,
0.3572922, -0.02199599, 0.6104769, 0, 0.2313726, 1, 1,
0.3599686, 0.5144132, 0.5896661, 0, 0.227451, 1, 1,
0.3668346, -0.2509508, 2.467159, 0, 0.2196078, 1, 1,
0.3672993, -1.044633, 1.816082, 0, 0.2156863, 1, 1,
0.3718942, -1.247654, 1.31635, 0, 0.2078431, 1, 1,
0.3725883, 0.5782909, -0.7919664, 0, 0.2039216, 1, 1,
0.3800316, 0.7792585, -1.568094, 0, 0.1960784, 1, 1,
0.3828582, 1.213177, 1.655961, 0, 0.1882353, 1, 1,
0.3861686, 0.2739685, 0.7369958, 0, 0.1843137, 1, 1,
0.3926423, -0.02053369, 3.854336, 0, 0.1764706, 1, 1,
0.3940017, -0.1348064, 1.944048, 0, 0.172549, 1, 1,
0.3946566, -0.8704259, 1.746078, 0, 0.1647059, 1, 1,
0.3953733, -0.1665597, 2.460003, 0, 0.1607843, 1, 1,
0.397336, 1.67095, -0.2411177, 0, 0.1529412, 1, 1,
0.3992198, 2.407845, 0.8759428, 0, 0.1490196, 1, 1,
0.4004664, 0.8884121, 0.512986, 0, 0.1411765, 1, 1,
0.4022123, -0.05423424, 2.007352, 0, 0.1372549, 1, 1,
0.4026659, -0.6749085, 2.347571, 0, 0.1294118, 1, 1,
0.4044365, -0.4960063, 4.248963, 0, 0.1254902, 1, 1,
0.4057097, -0.358499, 1.433615, 0, 0.1176471, 1, 1,
0.4072553, -0.7532349, 2.399925, 0, 0.1137255, 1, 1,
0.4107501, 0.5728658, 0.02457231, 0, 0.1058824, 1, 1,
0.4132997, -0.7092609, 2.037875, 0, 0.09803922, 1, 1,
0.4139162, -0.3206675, 0.6804533, 0, 0.09411765, 1, 1,
0.414374, 0.1275463, 2.834887, 0, 0.08627451, 1, 1,
0.4185196, -0.7889763, 3.39947, 0, 0.08235294, 1, 1,
0.4208164, -0.4263874, 1.712314, 0, 0.07450981, 1, 1,
0.4212736, 0.04215553, 1.280685, 0, 0.07058824, 1, 1,
0.4244621, 0.756528, 0.03671075, 0, 0.0627451, 1, 1,
0.4288932, -2.063379, 1.575567, 0, 0.05882353, 1, 1,
0.4304151, -1.884057, 3.35766, 0, 0.05098039, 1, 1,
0.434112, -0.07625183, 1.478453, 0, 0.04705882, 1, 1,
0.4424917, -1.463841, 2.337029, 0, 0.03921569, 1, 1,
0.4429275, -0.08904762, 1.635786, 0, 0.03529412, 1, 1,
0.4433196, 1.283671, 2.317622, 0, 0.02745098, 1, 1,
0.4449462, 0.7413273, 0.2925817, 0, 0.02352941, 1, 1,
0.4459968, 0.3571645, 1.880757, 0, 0.01568628, 1, 1,
0.446314, -1.132039, 2.527, 0, 0.01176471, 1, 1,
0.4467427, 1.267713, 0.1079404, 0, 0.003921569, 1, 1,
0.4473045, -0.1041263, 1.484268, 0.003921569, 0, 1, 1,
0.454244, 0.9397493, -0.1249477, 0.007843138, 0, 1, 1,
0.4548977, 0.7565731, 0.6981445, 0.01568628, 0, 1, 1,
0.4567309, 1.45353, -0.2572474, 0.01960784, 0, 1, 1,
0.4592408, 0.9508702, 1.387213, 0.02745098, 0, 1, 1,
0.4612279, -0.04127464, 1.47117, 0.03137255, 0, 1, 1,
0.4626538, -0.4364349, 1.705485, 0.03921569, 0, 1, 1,
0.4628018, -0.9580954, 2.433078, 0.04313726, 0, 1, 1,
0.4656235, -1.584964, 4.103618, 0.05098039, 0, 1, 1,
0.4721254, -0.2293609, 2.468924, 0.05490196, 0, 1, 1,
0.4727469, 1.426345, 0.4489613, 0.0627451, 0, 1, 1,
0.4762868, 0.2649987, 0.2254396, 0.06666667, 0, 1, 1,
0.4781687, -1.712817, 3.347144, 0.07450981, 0, 1, 1,
0.4800988, 0.6803181, 0.8069178, 0.07843138, 0, 1, 1,
0.4801264, -0.4667265, 2.504175, 0.08627451, 0, 1, 1,
0.4812105, 0.0780517, 1.034191, 0.09019608, 0, 1, 1,
0.4844595, 0.7005501, -0.3582623, 0.09803922, 0, 1, 1,
0.4845141, -0.5304088, 1.958637, 0.1058824, 0, 1, 1,
0.488177, 2.327949, -0.275328, 0.1098039, 0, 1, 1,
0.4884612, -0.1994346, 2.62366, 0.1176471, 0, 1, 1,
0.4907339, 1.710005, 1.012141, 0.1215686, 0, 1, 1,
0.4910883, 2.721509, 0.04429986, 0.1294118, 0, 1, 1,
0.4945445, -1.105973, 3.168096, 0.1333333, 0, 1, 1,
0.4969966, -0.4089752, 3.065633, 0.1411765, 0, 1, 1,
0.4976828, -1.543697, 4.544562, 0.145098, 0, 1, 1,
0.4999398, -1.104505, 2.009261, 0.1529412, 0, 1, 1,
0.5002602, -0.4045474, 2.013406, 0.1568628, 0, 1, 1,
0.5018777, -1.660653, 0.735229, 0.1647059, 0, 1, 1,
0.5028829, 0.4294514, 0.1491141, 0.1686275, 0, 1, 1,
0.5150216, 0.3720139, 0.03359825, 0.1764706, 0, 1, 1,
0.5168445, 0.05217206, 0.9898107, 0.1803922, 0, 1, 1,
0.5205565, -1.025967, 4.270836, 0.1882353, 0, 1, 1,
0.5234119, 0.8289201, -0.9748407, 0.1921569, 0, 1, 1,
0.5238483, 1.298543, -0.1437327, 0.2, 0, 1, 1,
0.5239133, 0.8162534, 1.415885, 0.2078431, 0, 1, 1,
0.5268519, 0.5829669, 0.7042108, 0.2117647, 0, 1, 1,
0.5280321, -0.4804699, 2.401065, 0.2196078, 0, 1, 1,
0.5338677, 0.3238355, -0.009886678, 0.2235294, 0, 1, 1,
0.53408, -1.077711, 2.606513, 0.2313726, 0, 1, 1,
0.5347608, 1.350975, 0.3718221, 0.2352941, 0, 1, 1,
0.5355219, -1.096555, 2.837908, 0.2431373, 0, 1, 1,
0.5466982, -1.772444, 1.44101, 0.2470588, 0, 1, 1,
0.5475888, -0.1464613, 1.703727, 0.254902, 0, 1, 1,
0.5491592, 0.3531067, -0.01934083, 0.2588235, 0, 1, 1,
0.549521, 0.0254522, 0.6776163, 0.2666667, 0, 1, 1,
0.5524514, 0.2891126, 0.163199, 0.2705882, 0, 1, 1,
0.5561841, -0.06564467, 4.121171, 0.2784314, 0, 1, 1,
0.5600066, -1.356526, 3.292519, 0.282353, 0, 1, 1,
0.5604108, -0.08833113, 2.595958, 0.2901961, 0, 1, 1,
0.5659627, -0.1822049, 2.059299, 0.2941177, 0, 1, 1,
0.5708221, 0.7241964, 0.1965258, 0.3019608, 0, 1, 1,
0.5754889, 0.3533247, 0.2016238, 0.3098039, 0, 1, 1,
0.5796195, -0.184371, 3.043192, 0.3137255, 0, 1, 1,
0.5865107, 0.7416003, 0.8243619, 0.3215686, 0, 1, 1,
0.5908793, 1.025387, -0.07671329, 0.3254902, 0, 1, 1,
0.5929787, -0.4849334, 2.06453, 0.3333333, 0, 1, 1,
0.5973883, 0.2279415, 1.634764, 0.3372549, 0, 1, 1,
0.5979528, -0.6175959, 2.527281, 0.345098, 0, 1, 1,
0.5990823, -0.592638, 1.712708, 0.3490196, 0, 1, 1,
0.6006535, -0.7874911, 2.771925, 0.3568628, 0, 1, 1,
0.604347, 1.222948, 0.9920701, 0.3607843, 0, 1, 1,
0.608561, 0.4323911, 0.2531326, 0.3686275, 0, 1, 1,
0.6099041, 0.7799083, 0.5913512, 0.372549, 0, 1, 1,
0.6119455, 0.03906327, -0.3636505, 0.3803922, 0, 1, 1,
0.6132258, -0.3787695, 1.738865, 0.3843137, 0, 1, 1,
0.6136239, -0.1898619, 2.505138, 0.3921569, 0, 1, 1,
0.6166956, -0.08866629, 1.669612, 0.3960784, 0, 1, 1,
0.6213552, 1.610694, -0.2494745, 0.4039216, 0, 1, 1,
0.6219721, -0.7919726, 0.6035573, 0.4117647, 0, 1, 1,
0.6256855, 0.5612122, 1.867215, 0.4156863, 0, 1, 1,
0.6281635, 0.2871975, 0.4215945, 0.4235294, 0, 1, 1,
0.6291896, -0.5385141, 3.064796, 0.427451, 0, 1, 1,
0.633181, 0.490885, 1.236044, 0.4352941, 0, 1, 1,
0.6339046, -0.01091908, 2.741308, 0.4392157, 0, 1, 1,
0.6404669, 0.1043071, -0.5250995, 0.4470588, 0, 1, 1,
0.6414934, 0.320773, 0.5016356, 0.4509804, 0, 1, 1,
0.6420636, -1.852695, 3.901387, 0.4588235, 0, 1, 1,
0.6434422, 2.407981, -0.7788235, 0.4627451, 0, 1, 1,
0.6523762, 0.9053553, 0.5290042, 0.4705882, 0, 1, 1,
0.6527959, 0.6128536, 3.093472, 0.4745098, 0, 1, 1,
0.6602664, 1.890364, 1.220627, 0.4823529, 0, 1, 1,
0.6740462, 0.5019369, 0.6695486, 0.4862745, 0, 1, 1,
0.6772856, -1.605299, 5.088118, 0.4941176, 0, 1, 1,
0.6838814, 1.136668, 0.01698181, 0.5019608, 0, 1, 1,
0.6904271, 0.01045777, 1.551863, 0.5058824, 0, 1, 1,
0.6955167, -0.01905373, 2.802838, 0.5137255, 0, 1, 1,
0.6982171, 1.186624, 2.87734, 0.5176471, 0, 1, 1,
0.7062306, 0.08301046, 2.006063, 0.5254902, 0, 1, 1,
0.7070979, -0.7670143, 3.428987, 0.5294118, 0, 1, 1,
0.7117179, 0.164132, 1.446271, 0.5372549, 0, 1, 1,
0.7181355, -0.5188276, 4.439454, 0.5411765, 0, 1, 1,
0.7201729, -0.6727926, 2.866488, 0.5490196, 0, 1, 1,
0.7258871, -1.001348, 2.215144, 0.5529412, 0, 1, 1,
0.7287664, 0.9607852, 0.4603305, 0.5607843, 0, 1, 1,
0.7311864, -0.7318992, 3.191739, 0.5647059, 0, 1, 1,
0.734397, 1.098681, -0.1603795, 0.572549, 0, 1, 1,
0.7406047, -0.7923394, 1.182887, 0.5764706, 0, 1, 1,
0.7416094, 0.7030253, 1.077871, 0.5843138, 0, 1, 1,
0.7428117, 0.2530046, 2.125223, 0.5882353, 0, 1, 1,
0.7633457, 0.1821601, 1.021924, 0.5960785, 0, 1, 1,
0.7677957, -1.711141, 1.755948, 0.6039216, 0, 1, 1,
0.7726318, 0.7290826, 0.3976955, 0.6078432, 0, 1, 1,
0.7764376, 0.4828694, 0.4175875, 0.6156863, 0, 1, 1,
0.7768875, -0.0203096, 0.8649707, 0.6196079, 0, 1, 1,
0.7772804, 0.845246, 1.741282, 0.627451, 0, 1, 1,
0.7791863, -0.3872972, 0.08506446, 0.6313726, 0, 1, 1,
0.7802067, 0.4822989, 0.8635858, 0.6392157, 0, 1, 1,
0.7824018, 0.7267085, 1.86907, 0.6431373, 0, 1, 1,
0.7845955, -0.2832388, 3.947409, 0.6509804, 0, 1, 1,
0.7851893, -0.09229416, 0.3866376, 0.654902, 0, 1, 1,
0.7853794, -1.160509, 3.428392, 0.6627451, 0, 1, 1,
0.7954662, -1.013923, 2.305338, 0.6666667, 0, 1, 1,
0.7974051, -0.2900282, 2.208478, 0.6745098, 0, 1, 1,
0.7991493, 0.679971, 2.214174, 0.6784314, 0, 1, 1,
0.8179724, 0.4009177, 0.819754, 0.6862745, 0, 1, 1,
0.8212563, -0.3658306, 2.526792, 0.6901961, 0, 1, 1,
0.8223921, 0.8790507, 0.3809264, 0.6980392, 0, 1, 1,
0.8264071, 1.335658, 0.1998399, 0.7058824, 0, 1, 1,
0.8275965, 1.355946, 0.505321, 0.7098039, 0, 1, 1,
0.8319482, -0.6977407, 1.702128, 0.7176471, 0, 1, 1,
0.8332716, 1.519682, 0.5607125, 0.7215686, 0, 1, 1,
0.8360572, -0.02015324, 1.005959, 0.7294118, 0, 1, 1,
0.8392107, -1.678508, 1.7212, 0.7333333, 0, 1, 1,
0.8447369, 1.69347, 2.550173, 0.7411765, 0, 1, 1,
0.8490516, -0.02313852, 0.7253551, 0.7450981, 0, 1, 1,
0.8495213, 0.181972, -0.2503323, 0.7529412, 0, 1, 1,
0.8573614, -0.01812197, 2.034942, 0.7568628, 0, 1, 1,
0.8593332, -0.863148, 2.196548, 0.7647059, 0, 1, 1,
0.8604839, 0.4769171, 0.7981912, 0.7686275, 0, 1, 1,
0.8646032, -0.1194936, 1.852383, 0.7764706, 0, 1, 1,
0.8668137, 2.106782, -0.4240438, 0.7803922, 0, 1, 1,
0.8671985, -0.4334958, 3.842152, 0.7882353, 0, 1, 1,
0.8729075, -0.8762958, 3.59054, 0.7921569, 0, 1, 1,
0.8736708, 0.289839, 1.857299, 0.8, 0, 1, 1,
0.8792068, 0.03202079, 2.437629, 0.8078431, 0, 1, 1,
0.8802944, 0.7058314, 1.566494, 0.8117647, 0, 1, 1,
0.8868469, -0.657773, 0.7737671, 0.8196079, 0, 1, 1,
0.8875454, 0.5152783, 1.883454, 0.8235294, 0, 1, 1,
0.8888579, -1.439344, 3.598797, 0.8313726, 0, 1, 1,
0.893195, 1.07741, -0.1854342, 0.8352941, 0, 1, 1,
0.9009686, 1.293889, 0.6079031, 0.8431373, 0, 1, 1,
0.9076267, 0.07573044, 2.726193, 0.8470588, 0, 1, 1,
0.9081017, -0.724458, 1.896585, 0.854902, 0, 1, 1,
0.9280061, -0.6446732, 2.938997, 0.8588235, 0, 1, 1,
0.9312644, 0.6419748, 1.052824, 0.8666667, 0, 1, 1,
0.9326354, 0.4648258, 1.461354, 0.8705882, 0, 1, 1,
0.9348593, -1.90766, 2.85132, 0.8784314, 0, 1, 1,
0.9377441, 0.967389, 0.539255, 0.8823529, 0, 1, 1,
0.9397141, -0.07623317, -0.1121582, 0.8901961, 0, 1, 1,
0.9427311, 0.5427052, 1.723056, 0.8941177, 0, 1, 1,
0.9514235, -0.6161561, 2.393153, 0.9019608, 0, 1, 1,
0.9518074, 1.163723, 0.8925059, 0.9098039, 0, 1, 1,
0.9527488, 0.5054893, 1.771558, 0.9137255, 0, 1, 1,
0.9569686, -1.606863, 2.642806, 0.9215686, 0, 1, 1,
0.9571609, 2.266322, 0.04806397, 0.9254902, 0, 1, 1,
0.9581204, 0.3175077, 1.399625, 0.9333333, 0, 1, 1,
0.9583653, -0.5337155, 2.584134, 0.9372549, 0, 1, 1,
0.9623559, -0.134186, 1.845017, 0.945098, 0, 1, 1,
0.9638146, 1.063474, -0.1289407, 0.9490196, 0, 1, 1,
0.9642625, -0.6341244, 2.595676, 0.9568627, 0, 1, 1,
0.9669925, 1.587994, 0.05340002, 0.9607843, 0, 1, 1,
0.9726738, -0.7705059, 2.820157, 0.9686275, 0, 1, 1,
0.973773, -0.3605354, 2.650259, 0.972549, 0, 1, 1,
0.9751706, 0.2458867, 3.024546, 0.9803922, 0, 1, 1,
0.9781737, 0.1371604, 0.9630353, 0.9843137, 0, 1, 1,
0.9801736, -1.198538, 2.259367, 0.9921569, 0, 1, 1,
0.9882252, 1.258997, 0.5909936, 0.9960784, 0, 1, 1,
0.9888223, 0.09578855, 0.574069, 1, 0, 0.9960784, 1,
0.9893105, 0.5912365, 0.2203838, 1, 0, 0.9882353, 1,
1.003136, 0.6997737, 0.9688202, 1, 0, 0.9843137, 1,
1.005876, -1.242843, 3.151556, 1, 0, 0.9764706, 1,
1.006986, -0.0238628, 0.1305206, 1, 0, 0.972549, 1,
1.007616, 0.07238522, 0.4147905, 1, 0, 0.9647059, 1,
1.007996, 1.647575, 0.2556784, 1, 0, 0.9607843, 1,
1.011382, 0.2025163, 1.58539, 1, 0, 0.9529412, 1,
1.025843, -0.8988621, 2.30257, 1, 0, 0.9490196, 1,
1.03103, 0.4571229, 1.998537, 1, 0, 0.9411765, 1,
1.039735, -0.8911929, 4.767529, 1, 0, 0.9372549, 1,
1.04081, 0.4965264, 3.396173, 1, 0, 0.9294118, 1,
1.053213, -0.7918944, 2.375428, 1, 0, 0.9254902, 1,
1.054741, 0.5118709, -0.4333203, 1, 0, 0.9176471, 1,
1.054877, 0.3403807, 0.401352, 1, 0, 0.9137255, 1,
1.056892, 1.311672, 1.224787, 1, 0, 0.9058824, 1,
1.061952, -1.919502, 1.861458, 1, 0, 0.9019608, 1,
1.06804, -0.005825171, 1.985854, 1, 0, 0.8941177, 1,
1.07562, 0.6083094, 0.7331756, 1, 0, 0.8862745, 1,
1.076159, 0.0269416, 1.226266, 1, 0, 0.8823529, 1,
1.078989, 0.4533251, 0.4895198, 1, 0, 0.8745098, 1,
1.082133, -0.5410063, 2.547163, 1, 0, 0.8705882, 1,
1.084234, 0.8934594, 1.029486, 1, 0, 0.8627451, 1,
1.094686, 0.1525333, -0.09965995, 1, 0, 0.8588235, 1,
1.101794, -0.5005032, 1.371717, 1, 0, 0.8509804, 1,
1.104723, -0.586238, 3.156884, 1, 0, 0.8470588, 1,
1.107147, 1.481692, 1.313982, 1, 0, 0.8392157, 1,
1.113695, 0.2337637, 2.167645, 1, 0, 0.8352941, 1,
1.121288, -1.126814, 4.575591, 1, 0, 0.827451, 1,
1.122869, -1.013144, 2.447037, 1, 0, 0.8235294, 1,
1.123595, 0.540486, 1.615746, 1, 0, 0.8156863, 1,
1.124317, -0.1860414, 3.401853, 1, 0, 0.8117647, 1,
1.128585, 0.2749096, -0.139896, 1, 0, 0.8039216, 1,
1.142219, -0.6261983, 2.074076, 1, 0, 0.7960784, 1,
1.143025, 0.00312076, 2.304883, 1, 0, 0.7921569, 1,
1.145454, 1.131954, 1.90648, 1, 0, 0.7843137, 1,
1.146659, 0.9916381, -0.07302392, 1, 0, 0.7803922, 1,
1.147412, 0.5218397, 1.152646, 1, 0, 0.772549, 1,
1.15184, -0.8154899, 1.709161, 1, 0, 0.7686275, 1,
1.153294, 1.274153, 0.5784613, 1, 0, 0.7607843, 1,
1.159134, -1.297785, 1.913027, 1, 0, 0.7568628, 1,
1.160771, 0.4962481, 0.8998951, 1, 0, 0.7490196, 1,
1.161452, 1.193458, 1.890497, 1, 0, 0.7450981, 1,
1.176979, 0.3793736, 2.517437, 1, 0, 0.7372549, 1,
1.177627, 1.000222, -0.05157088, 1, 0, 0.7333333, 1,
1.182322, -0.01810923, 2.777831, 1, 0, 0.7254902, 1,
1.201348, -0.2712885, 1.035828, 1, 0, 0.7215686, 1,
1.202895, 1.133283, 1.057447, 1, 0, 0.7137255, 1,
1.205384, 1.345328, 0.4614861, 1, 0, 0.7098039, 1,
1.206925, 1.141707, 0.8424224, 1, 0, 0.7019608, 1,
1.207904, -0.8735629, 2.392261, 1, 0, 0.6941177, 1,
1.208113, 1.052795, 0.4657478, 1, 0, 0.6901961, 1,
1.216346, 0.9743629, 1.799916, 1, 0, 0.682353, 1,
1.225526, -0.5666511, 2.098236, 1, 0, 0.6784314, 1,
1.236308, 0.5431671, 1.234537, 1, 0, 0.6705883, 1,
1.240526, 0.001444265, 2.947309, 1, 0, 0.6666667, 1,
1.269807, -0.8405414, 1.826265, 1, 0, 0.6588235, 1,
1.27223, 0.7263167, -1.294229, 1, 0, 0.654902, 1,
1.273141, 0.0401479, 1.100135, 1, 0, 0.6470588, 1,
1.275075, 0.2981509, 1.877602, 1, 0, 0.6431373, 1,
1.27527, 0.3877931, 1.5034, 1, 0, 0.6352941, 1,
1.280805, 0.7895919, 1.976145, 1, 0, 0.6313726, 1,
1.303773, -0.9854919, 3.313643, 1, 0, 0.6235294, 1,
1.305124, -0.381028, 3.083643, 1, 0, 0.6196079, 1,
1.314822, 0.7861043, 0.006275482, 1, 0, 0.6117647, 1,
1.318604, -0.2737061, 1.610348, 1, 0, 0.6078432, 1,
1.320629, 0.2938396, -0.3719362, 1, 0, 0.6, 1,
1.321995, -0.5322722, 2.400293, 1, 0, 0.5921569, 1,
1.332124, -0.5435036, 2.781015, 1, 0, 0.5882353, 1,
1.33483, 0.1654574, 0.8970805, 1, 0, 0.5803922, 1,
1.338195, 0.8467019, 1.977467, 1, 0, 0.5764706, 1,
1.339177, -1.269502, 0.09991653, 1, 0, 0.5686275, 1,
1.341794, -0.9556007, 2.813937, 1, 0, 0.5647059, 1,
1.348863, -1.222226, 2.776546, 1, 0, 0.5568628, 1,
1.356454, 0.4251906, 0.9083076, 1, 0, 0.5529412, 1,
1.357993, 0.4149369, 0.8535256, 1, 0, 0.5450981, 1,
1.358901, -1.754312, 1.76885, 1, 0, 0.5411765, 1,
1.362612, 1.516304, 0.8021482, 1, 0, 0.5333334, 1,
1.373036, -0.05749468, 1.202094, 1, 0, 0.5294118, 1,
1.387586, -0.5992779, 0.5892917, 1, 0, 0.5215687, 1,
1.402463, -1.532147, 2.688537, 1, 0, 0.5176471, 1,
1.408139, 0.3371525, 2.454507, 1, 0, 0.509804, 1,
1.415487, 1.378287, 0.2197854, 1, 0, 0.5058824, 1,
1.425058, 0.08920845, 2.352658, 1, 0, 0.4980392, 1,
1.427748, -0.8575978, 1.644487, 1, 0, 0.4901961, 1,
1.429021, 0.09955477, 2.153361, 1, 0, 0.4862745, 1,
1.429433, -0.07602925, 1.452252, 1, 0, 0.4784314, 1,
1.439177, 0.5408682, -0.3667235, 1, 0, 0.4745098, 1,
1.447514, -1.055144, 2.196633, 1, 0, 0.4666667, 1,
1.448677, 0.6582343, 1.829898, 1, 0, 0.4627451, 1,
1.449507, 0.5463449, 1.031853, 1, 0, 0.454902, 1,
1.455239, -1.196222, 0.8706706, 1, 0, 0.4509804, 1,
1.46289, 0.7215989, 0.0598335, 1, 0, 0.4431373, 1,
1.470211, -0.9895762, 3.175042, 1, 0, 0.4392157, 1,
1.480634, -0.5932221, 1.375551, 1, 0, 0.4313726, 1,
1.494912, 0.1640954, 2.053118, 1, 0, 0.427451, 1,
1.505132, -0.6846746, 2.821007, 1, 0, 0.4196078, 1,
1.520747, 0.7744589, 2.194327, 1, 0, 0.4156863, 1,
1.526636, -0.2975859, -0.2333815, 1, 0, 0.4078431, 1,
1.528611, -0.5259662, 2.913189, 1, 0, 0.4039216, 1,
1.529253, -0.8536, 3.757494, 1, 0, 0.3960784, 1,
1.531013, 1.474905, -0.5299078, 1, 0, 0.3882353, 1,
1.535336, -0.6237249, 0.8443798, 1, 0, 0.3843137, 1,
1.536775, -0.1077626, 0.6852106, 1, 0, 0.3764706, 1,
1.537618, 1.312377, -1.048007, 1, 0, 0.372549, 1,
1.54278, -0.5498225, 2.557135, 1, 0, 0.3647059, 1,
1.54303, 2.300642, 0.6785616, 1, 0, 0.3607843, 1,
1.552682, -0.3910954, 1.36534, 1, 0, 0.3529412, 1,
1.556391, -1.296809, 5.346356, 1, 0, 0.3490196, 1,
1.562257, 0.7877547, 1.200249, 1, 0, 0.3411765, 1,
1.568423, 1.062551, 2.113201, 1, 0, 0.3372549, 1,
1.572587, -0.5380532, 3.165844, 1, 0, 0.3294118, 1,
1.572899, -0.1188725, 2.716317, 1, 0, 0.3254902, 1,
1.574371, -2.465934, 3.073701, 1, 0, 0.3176471, 1,
1.579949, 0.8042501, 1.093704, 1, 0, 0.3137255, 1,
1.584875, 1.455915, 0.4510377, 1, 0, 0.3058824, 1,
1.603549, -2.005872, 1.542965, 1, 0, 0.2980392, 1,
1.614292, 1.586733, 0.4004801, 1, 0, 0.2941177, 1,
1.632494, 1.925309, 0.5543155, 1, 0, 0.2862745, 1,
1.641602, 0.3209256, 0.4877917, 1, 0, 0.282353, 1,
1.644173, 0.1814332, 2.049094, 1, 0, 0.2745098, 1,
1.649572, 0.2857424, 3.844914, 1, 0, 0.2705882, 1,
1.652235, 0.1877627, 1.975017, 1, 0, 0.2627451, 1,
1.652932, -1.550728, 2.292915, 1, 0, 0.2588235, 1,
1.665639, -0.6310195, 0.8990955, 1, 0, 0.2509804, 1,
1.673564, 0.6714617, 0.09234308, 1, 0, 0.2470588, 1,
1.676335, -1.0924, 0.9111556, 1, 0, 0.2392157, 1,
1.69765, 0.7896342, -0.509546, 1, 0, 0.2352941, 1,
1.701438, -0.8128741, 3.103785, 1, 0, 0.227451, 1,
1.705155, 0.1476632, 1.901694, 1, 0, 0.2235294, 1,
1.746603, 0.9765744, 1.325191, 1, 0, 0.2156863, 1,
1.78178, 0.4171743, 0.7197366, 1, 0, 0.2117647, 1,
1.788733, 1.294608, 1.779475, 1, 0, 0.2039216, 1,
1.811783, 0.2199691, 0.8395356, 1, 0, 0.1960784, 1,
1.825432, -0.7766592, 2.911252, 1, 0, 0.1921569, 1,
1.830633, -0.5217385, 0.9077767, 1, 0, 0.1843137, 1,
1.835993, 0.5170472, 0.17071, 1, 0, 0.1803922, 1,
1.848338, 1.125221, 0.4899901, 1, 0, 0.172549, 1,
1.859164, -1.311665, 3.267389, 1, 0, 0.1686275, 1,
1.864787, 0.5416157, 0.7086604, 1, 0, 0.1607843, 1,
1.883749, -0.8023526, 2.47736, 1, 0, 0.1568628, 1,
1.888162, 0.5525901, 0.1359631, 1, 0, 0.1490196, 1,
1.890569, 0.4591914, 1.07761, 1, 0, 0.145098, 1,
1.914997, 0.08956566, 3.172329, 1, 0, 0.1372549, 1,
1.928449, 2.170424, -0.3959905, 1, 0, 0.1333333, 1,
1.936564, 1.406036, 0.06737794, 1, 0, 0.1254902, 1,
1.941003, 0.7446819, 1.433676, 1, 0, 0.1215686, 1,
1.95815, 0.9716938, 2.345347, 1, 0, 0.1137255, 1,
1.994331, 0.1542345, 0.3440262, 1, 0, 0.1098039, 1,
2.008361, -1.143167, 1.814922, 1, 0, 0.1019608, 1,
2.015262, 0.3816158, 1.540452, 1, 0, 0.09411765, 1,
2.072353, 0.5018436, 1.889366, 1, 0, 0.09019608, 1,
2.124749, -0.1520257, 2.387561, 1, 0, 0.08235294, 1,
2.137216, -0.4160039, 0.7532539, 1, 0, 0.07843138, 1,
2.222647, 0.6124746, 0.811501, 1, 0, 0.07058824, 1,
2.241227, 0.4713529, 1.252131, 1, 0, 0.06666667, 1,
2.26955, 0.5572302, 0.59682, 1, 0, 0.05882353, 1,
2.294847, 0.01051101, -0.4676458, 1, 0, 0.05490196, 1,
2.302227, -0.2725339, 3.393305, 1, 0, 0.04705882, 1,
2.314314, -0.504241, 1.319044, 1, 0, 0.04313726, 1,
2.325447, 0.3736459, -0.1583619, 1, 0, 0.03529412, 1,
2.427902, -0.3333469, 0.6492968, 1, 0, 0.03137255, 1,
2.453253, -0.6128298, 0.1007665, 1, 0, 0.02352941, 1,
2.542387, -1.08365, 2.275995, 1, 0, 0.01960784, 1,
2.719097, 0.08874692, 3.23277, 1, 0, 0.01176471, 1,
2.85249, 1.84948, 1.016868, 1, 0, 0.007843138, 1
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
-0.05822718, -4.615083, -7.177461, 0, -0.5, 0.5, 0.5,
-0.05822718, -4.615083, -7.177461, 1, -0.5, 0.5, 0.5,
-0.05822718, -4.615083, -7.177461, 1, 1.5, 0.5, 0.5,
-0.05822718, -4.615083, -7.177461, 0, 1.5, 0.5, 0.5
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
-3.955678, -0.4151268, -7.177461, 0, -0.5, 0.5, 0.5,
-3.955678, -0.4151268, -7.177461, 1, -0.5, 0.5, 0.5,
-3.955678, -0.4151268, -7.177461, 1, 1.5, 0.5, 0.5,
-3.955678, -0.4151268, -7.177461, 0, 1.5, 0.5, 0.5
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
-3.955678, -4.615083, -0.00799036, 0, -0.5, 0.5, 0.5,
-3.955678, -4.615083, -0.00799036, 1, -0.5, 0.5, 0.5,
-3.955678, -4.615083, -0.00799036, 1, 1.5, 0.5, 0.5,
-3.955678, -4.615083, -0.00799036, 0, 1.5, 0.5, 0.5
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
-2, -3.645862, -5.522967,
2, -3.645862, -5.522967,
-2, -3.645862, -5.522967,
-2, -3.807399, -5.798717,
-1, -3.645862, -5.522967,
-1, -3.807399, -5.798717,
0, -3.645862, -5.522967,
0, -3.807399, -5.798717,
1, -3.645862, -5.522967,
1, -3.807399, -5.798717,
2, -3.645862, -5.522967,
2, -3.807399, -5.798717
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
-2, -4.130473, -6.350214, 0, -0.5, 0.5, 0.5,
-2, -4.130473, -6.350214, 1, -0.5, 0.5, 0.5,
-2, -4.130473, -6.350214, 1, 1.5, 0.5, 0.5,
-2, -4.130473, -6.350214, 0, 1.5, 0.5, 0.5,
-1, -4.130473, -6.350214, 0, -0.5, 0.5, 0.5,
-1, -4.130473, -6.350214, 1, -0.5, 0.5, 0.5,
-1, -4.130473, -6.350214, 1, 1.5, 0.5, 0.5,
-1, -4.130473, -6.350214, 0, 1.5, 0.5, 0.5,
0, -4.130473, -6.350214, 0, -0.5, 0.5, 0.5,
0, -4.130473, -6.350214, 1, -0.5, 0.5, 0.5,
0, -4.130473, -6.350214, 1, 1.5, 0.5, 0.5,
0, -4.130473, -6.350214, 0, 1.5, 0.5, 0.5,
1, -4.130473, -6.350214, 0, -0.5, 0.5, 0.5,
1, -4.130473, -6.350214, 1, -0.5, 0.5, 0.5,
1, -4.130473, -6.350214, 1, 1.5, 0.5, 0.5,
1, -4.130473, -6.350214, 0, 1.5, 0.5, 0.5,
2, -4.130473, -6.350214, 0, -0.5, 0.5, 0.5,
2, -4.130473, -6.350214, 1, -0.5, 0.5, 0.5,
2, -4.130473, -6.350214, 1, 1.5, 0.5, 0.5,
2, -4.130473, -6.350214, 0, 1.5, 0.5, 0.5
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
-3.056266, -3, -5.522967,
-3.056266, 2, -5.522967,
-3.056266, -3, -5.522967,
-3.206168, -3, -5.798717,
-3.056266, -2, -5.522967,
-3.206168, -2, -5.798717,
-3.056266, -1, -5.522967,
-3.206168, -1, -5.798717,
-3.056266, 0, -5.522967,
-3.206168, 0, -5.798717,
-3.056266, 1, -5.522967,
-3.206168, 1, -5.798717,
-3.056266, 2, -5.522967,
-3.206168, 2, -5.798717
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
-3.505972, -3, -6.350214, 0, -0.5, 0.5, 0.5,
-3.505972, -3, -6.350214, 1, -0.5, 0.5, 0.5,
-3.505972, -3, -6.350214, 1, 1.5, 0.5, 0.5,
-3.505972, -3, -6.350214, 0, 1.5, 0.5, 0.5,
-3.505972, -2, -6.350214, 0, -0.5, 0.5, 0.5,
-3.505972, -2, -6.350214, 1, -0.5, 0.5, 0.5,
-3.505972, -2, -6.350214, 1, 1.5, 0.5, 0.5,
-3.505972, -2, -6.350214, 0, 1.5, 0.5, 0.5,
-3.505972, -1, -6.350214, 0, -0.5, 0.5, 0.5,
-3.505972, -1, -6.350214, 1, -0.5, 0.5, 0.5,
-3.505972, -1, -6.350214, 1, 1.5, 0.5, 0.5,
-3.505972, -1, -6.350214, 0, 1.5, 0.5, 0.5,
-3.505972, 0, -6.350214, 0, -0.5, 0.5, 0.5,
-3.505972, 0, -6.350214, 1, -0.5, 0.5, 0.5,
-3.505972, 0, -6.350214, 1, 1.5, 0.5, 0.5,
-3.505972, 0, -6.350214, 0, 1.5, 0.5, 0.5,
-3.505972, 1, -6.350214, 0, -0.5, 0.5, 0.5,
-3.505972, 1, -6.350214, 1, -0.5, 0.5, 0.5,
-3.505972, 1, -6.350214, 1, 1.5, 0.5, 0.5,
-3.505972, 1, -6.350214, 0, 1.5, 0.5, 0.5,
-3.505972, 2, -6.350214, 0, -0.5, 0.5, 0.5,
-3.505972, 2, -6.350214, 1, -0.5, 0.5, 0.5,
-3.505972, 2, -6.350214, 1, 1.5, 0.5, 0.5,
-3.505972, 2, -6.350214, 0, 1.5, 0.5, 0.5
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
-3.056266, -3.645862, -4,
-3.056266, -3.645862, 4,
-3.056266, -3.645862, -4,
-3.206168, -3.807399, -4,
-3.056266, -3.645862, -2,
-3.206168, -3.807399, -2,
-3.056266, -3.645862, 0,
-3.206168, -3.807399, 0,
-3.056266, -3.645862, 2,
-3.206168, -3.807399, 2,
-3.056266, -3.645862, 4,
-3.206168, -3.807399, 4
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
-3.505972, -4.130473, -4, 0, -0.5, 0.5, 0.5,
-3.505972, -4.130473, -4, 1, -0.5, 0.5, 0.5,
-3.505972, -4.130473, -4, 1, 1.5, 0.5, 0.5,
-3.505972, -4.130473, -4, 0, 1.5, 0.5, 0.5,
-3.505972, -4.130473, -2, 0, -0.5, 0.5, 0.5,
-3.505972, -4.130473, -2, 1, -0.5, 0.5, 0.5,
-3.505972, -4.130473, -2, 1, 1.5, 0.5, 0.5,
-3.505972, -4.130473, -2, 0, 1.5, 0.5, 0.5,
-3.505972, -4.130473, 0, 0, -0.5, 0.5, 0.5,
-3.505972, -4.130473, 0, 1, -0.5, 0.5, 0.5,
-3.505972, -4.130473, 0, 1, 1.5, 0.5, 0.5,
-3.505972, -4.130473, 0, 0, 1.5, 0.5, 0.5,
-3.505972, -4.130473, 2, 0, -0.5, 0.5, 0.5,
-3.505972, -4.130473, 2, 1, -0.5, 0.5, 0.5,
-3.505972, -4.130473, 2, 1, 1.5, 0.5, 0.5,
-3.505972, -4.130473, 2, 0, 1.5, 0.5, 0.5,
-3.505972, -4.130473, 4, 0, -0.5, 0.5, 0.5,
-3.505972, -4.130473, 4, 1, -0.5, 0.5, 0.5,
-3.505972, -4.130473, 4, 1, 1.5, 0.5, 0.5,
-3.505972, -4.130473, 4, 0, 1.5, 0.5, 0.5
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
-3.056266, -3.645862, -5.522967,
-3.056266, 2.815609, -5.522967,
-3.056266, -3.645862, 5.506987,
-3.056266, 2.815609, 5.506987,
-3.056266, -3.645862, -5.522967,
-3.056266, -3.645862, 5.506987,
-3.056266, 2.815609, -5.522967,
-3.056266, 2.815609, 5.506987,
-3.056266, -3.645862, -5.522967,
2.939812, -3.645862, -5.522967,
-3.056266, -3.645862, 5.506987,
2.939812, -3.645862, 5.506987,
-3.056266, 2.815609, -5.522967,
2.939812, 2.815609, -5.522967,
-3.056266, 2.815609, 5.506987,
2.939812, 2.815609, 5.506987,
2.939812, -3.645862, -5.522967,
2.939812, 2.815609, -5.522967,
2.939812, -3.645862, 5.506987,
2.939812, 2.815609, 5.506987,
2.939812, -3.645862, -5.522967,
2.939812, -3.645862, 5.506987,
2.939812, 2.815609, -5.522967,
2.939812, 2.815609, 5.506987
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
var radius = 7.539599;
var distance = 33.54453;
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
mvMatrix.translate( 0.05822718, 0.4151268, 0.00799036 );
mvMatrix.scale( 1.359549, 1.261626, 0.7390749 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54453);
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
neburon<-read.table("neburon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-neburon$V2
```

```
## Error in eval(expr, envir, enclos): object 'neburon' not found
```

```r
y<-neburon$V3
```

```
## Error in eval(expr, envir, enclos): object 'neburon' not found
```

```r
z<-neburon$V4
```

```
## Error in eval(expr, envir, enclos): object 'neburon' not found
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
-2.968945, 0.2562322, -0.5683051, 0, 0, 1, 1, 1,
-2.765499, -0.7282024, -1.542964, 1, 0, 0, 1, 1,
-2.652303, -0.4117123, -0.3506539, 1, 0, 0, 1, 1,
-2.651237, 0.9064059, -1.802103, 1, 0, 0, 1, 1,
-2.551721, -0.2433829, -0.808138, 1, 0, 0, 1, 1,
-2.251792, -0.1837829, -1.9034, 1, 0, 0, 1, 1,
-2.142558, 0.8457211, -0.900117, 0, 0, 0, 1, 1,
-2.123647, -0.09915686, -1.528436, 0, 0, 0, 1, 1,
-2.096749, -0.848311, -1.734756, 0, 0, 0, 1, 1,
-2.093458, 1.65569, -1.190934, 0, 0, 0, 1, 1,
-2.039441, -1.167722, -2.050539, 0, 0, 0, 1, 1,
-1.98549, 1.604264, 0.2645819, 0, 0, 0, 1, 1,
-1.978084, 1.30802, -1.351644, 0, 0, 0, 1, 1,
-1.948003, 1.040848, 0.1636367, 1, 1, 1, 1, 1,
-1.927378, -0.4863026, -2.003962, 1, 1, 1, 1, 1,
-1.903408, 0.6898994, -1.195014, 1, 1, 1, 1, 1,
-1.889721, -1.351795, -1.368001, 1, 1, 1, 1, 1,
-1.88682, -0.752373, -0.9091561, 1, 1, 1, 1, 1,
-1.885392, 2.363391, -0.4299668, 1, 1, 1, 1, 1,
-1.881902, 0.5624503, -1.009276, 1, 1, 1, 1, 1,
-1.868801, 0.1678715, -1.686044, 1, 1, 1, 1, 1,
-1.855765, 0.3474786, 0.3386734, 1, 1, 1, 1, 1,
-1.848669, -1.560839, -1.821347, 1, 1, 1, 1, 1,
-1.810012, 0.8881366, -1.515908, 1, 1, 1, 1, 1,
-1.802746, 2.217058, -0.2231368, 1, 1, 1, 1, 1,
-1.787856, 0.4802546, -1.739868, 1, 1, 1, 1, 1,
-1.785886, 1.510375, -0.5734511, 1, 1, 1, 1, 1,
-1.781732, -1.556097, -1.996914, 1, 1, 1, 1, 1,
-1.767411, 0.3615717, -1.230556, 0, 0, 1, 1, 1,
-1.76078, -0.460732, -1.211221, 1, 0, 0, 1, 1,
-1.758587, 0.1862503, -1.919794, 1, 0, 0, 1, 1,
-1.737081, 2.545036, -0.09589988, 1, 0, 0, 1, 1,
-1.726684, 0.1434001, -2.850148, 1, 0, 0, 1, 1,
-1.706099, -1.121024, -1.61087, 1, 0, 0, 1, 1,
-1.687333, -0.3405021, -1.365892, 0, 0, 0, 1, 1,
-1.666309, 0.992689, 0.6950222, 0, 0, 0, 1, 1,
-1.6656, 2.46037, -0.04676693, 0, 0, 0, 1, 1,
-1.664978, -1.586096, -2.941199, 0, 0, 0, 1, 1,
-1.662532, -0.3638711, -1.479478, 0, 0, 0, 1, 1,
-1.658377, 0.2813759, -1.541664, 0, 0, 0, 1, 1,
-1.657514, 0.1595659, -2.238252, 0, 0, 0, 1, 1,
-1.656904, -0.8701504, -1.749688, 1, 1, 1, 1, 1,
-1.633618, -1.168608, -1.802283, 1, 1, 1, 1, 1,
-1.631541, -0.4575311, -2.068449, 1, 1, 1, 1, 1,
-1.610227, 0.1351992, -2.129997, 1, 1, 1, 1, 1,
-1.608667, 0.6068624, -0.5405468, 1, 1, 1, 1, 1,
-1.601607, -0.8407, -1.466971, 1, 1, 1, 1, 1,
-1.597724, 0.7501343, 0.4942397, 1, 1, 1, 1, 1,
-1.587045, -0.3013325, -1.576768, 1, 1, 1, 1, 1,
-1.577649, -0.8417218, -0.939568, 1, 1, 1, 1, 1,
-1.561334, -0.7845862, -2.624314, 1, 1, 1, 1, 1,
-1.539889, 0.7517592, -1.380594, 1, 1, 1, 1, 1,
-1.527717, 1.267026, -1.572181, 1, 1, 1, 1, 1,
-1.51356, 0.7042362, -0.4241267, 1, 1, 1, 1, 1,
-1.510025, 0.9428146, -0.5046672, 1, 1, 1, 1, 1,
-1.505963, -0.232366, -2.353951, 1, 1, 1, 1, 1,
-1.502423, -2.22763, -1.156019, 0, 0, 1, 1, 1,
-1.494623, 0.5006051, -1.269672, 1, 0, 0, 1, 1,
-1.488199, -1.394536, -1.727808, 1, 0, 0, 1, 1,
-1.454604, -0.03121947, -2.589137, 1, 0, 0, 1, 1,
-1.447284, 1.342165, -0.9360824, 1, 0, 0, 1, 1,
-1.444895, 0.2011561, -2.466948, 1, 0, 0, 1, 1,
-1.438839, -0.5854959, -3.046677, 0, 0, 0, 1, 1,
-1.406601, 0.05209021, -1.672018, 0, 0, 0, 1, 1,
-1.400269, 1.68453, -0.9329131, 0, 0, 0, 1, 1,
-1.390203, -1.212623, -2.962039, 0, 0, 0, 1, 1,
-1.387694, 0.6818471, -0.5231826, 0, 0, 0, 1, 1,
-1.387179, 0.649539, -1.671057, 0, 0, 0, 1, 1,
-1.382634, 0.4567945, -0.9529068, 0, 0, 0, 1, 1,
-1.380917, -1.03592, -0.963065, 1, 1, 1, 1, 1,
-1.357463, 0.1245029, -1.3837, 1, 1, 1, 1, 1,
-1.347202, 0.2684485, -0.01193253, 1, 1, 1, 1, 1,
-1.346601, 0.7006543, -0.3984732, 1, 1, 1, 1, 1,
-1.34236, 2.187776, -1.175045, 1, 1, 1, 1, 1,
-1.325669, -0.5182442, -2.443488, 1, 1, 1, 1, 1,
-1.316729, 0.5288783, -0.86684, 1, 1, 1, 1, 1,
-1.315871, 0.04439507, -0.8501658, 1, 1, 1, 1, 1,
-1.312937, 2.337993, -1.579072, 1, 1, 1, 1, 1,
-1.285834, 1.338718, -1.964133, 1, 1, 1, 1, 1,
-1.285722, -0.3607708, -1.17054, 1, 1, 1, 1, 1,
-1.280468, -0.343636, -0.9874651, 1, 1, 1, 1, 1,
-1.279358, -0.7267711, -3.306811, 1, 1, 1, 1, 1,
-1.275221, -1.267271, -1.92917, 1, 1, 1, 1, 1,
-1.253725, 0.3986125, 0.6266156, 1, 1, 1, 1, 1,
-1.252032, 0.2362475, -2.509076, 0, 0, 1, 1, 1,
-1.251326, 0.2969598, -0.9572259, 1, 0, 0, 1, 1,
-1.250129, -1.335169, -1.314805, 1, 0, 0, 1, 1,
-1.238352, -0.06667438, -0.2284707, 1, 0, 0, 1, 1,
-1.236858, -0.583487, -0.5564464, 1, 0, 0, 1, 1,
-1.219802, 0.1806169, -1.464042, 1, 0, 0, 1, 1,
-1.219273, 0.6014428, 0.6606503, 0, 0, 0, 1, 1,
-1.214238, 0.003187426, -1.119342, 0, 0, 0, 1, 1,
-1.212679, 0.5429494, -0.7420449, 0, 0, 0, 1, 1,
-1.204671, -0.7905194, -1.257797, 0, 0, 0, 1, 1,
-1.202639, -1.870595, -1.934703, 0, 0, 0, 1, 1,
-1.201934, -0.3771915, -1.059625, 0, 0, 0, 1, 1,
-1.19457, 0.3363177, -1.090182, 0, 0, 0, 1, 1,
-1.19402, -0.6680251, -3.888156, 1, 1, 1, 1, 1,
-1.190545, 0.49265, -3.130015, 1, 1, 1, 1, 1,
-1.190402, 0.1476124, -1.946247, 1, 1, 1, 1, 1,
-1.189285, 1.432522, -0.7162024, 1, 1, 1, 1, 1,
-1.189, 0.006454272, -3.07175, 1, 1, 1, 1, 1,
-1.173921, -0.5538982, -1.754058, 1, 1, 1, 1, 1,
-1.167566, -0.4636048, -2.915095, 1, 1, 1, 1, 1,
-1.166522, 0.4051419, -0.6991289, 1, 1, 1, 1, 1,
-1.165723, -0.2828342, -1.258018, 1, 1, 1, 1, 1,
-1.165364, -0.9210203, -4.505672, 1, 1, 1, 1, 1,
-1.161653, -0.7910791, -0.8990791, 1, 1, 1, 1, 1,
-1.158651, -0.5847316, -2.23659, 1, 1, 1, 1, 1,
-1.157347, -1.132192, -2.481781, 1, 1, 1, 1, 1,
-1.157178, -0.08371913, -2.562604, 1, 1, 1, 1, 1,
-1.157115, -0.9399767, -2.326144, 1, 1, 1, 1, 1,
-1.151453, -1.307911, -1.661981, 0, 0, 1, 1, 1,
-1.148111, -1.353254, 1.39832, 1, 0, 0, 1, 1,
-1.147624, 1.232185, 0.747526, 1, 0, 0, 1, 1,
-1.141714, -0.5102295, -1.780056, 1, 0, 0, 1, 1,
-1.138309, 0.3031196, -0.4783885, 1, 0, 0, 1, 1,
-1.135729, 1.250552, 0.2518317, 1, 0, 0, 1, 1,
-1.126312, -0.281154, -1.62734, 0, 0, 0, 1, 1,
-1.125288, -0.03665445, -1.410537, 0, 0, 0, 1, 1,
-1.125168, -1.308462, -3.292433, 0, 0, 0, 1, 1,
-1.118611, -0.2779432, -2.492986, 0, 0, 0, 1, 1,
-1.116714, 0.2059499, -2.598942, 0, 0, 0, 1, 1,
-1.116053, -0.07601728, 0.2074708, 0, 0, 0, 1, 1,
-1.113378, -0.4678808, -2.451468, 0, 0, 0, 1, 1,
-1.097378, 0.7607634, -2.73785, 1, 1, 1, 1, 1,
-1.096244, -0.9052192, -3.729325, 1, 1, 1, 1, 1,
-1.095813, -0.8805841, -0.9778249, 1, 1, 1, 1, 1,
-1.090016, 0.9632068, -0.6469852, 1, 1, 1, 1, 1,
-1.086317, -0.2984882, -0.8598223, 1, 1, 1, 1, 1,
-1.085552, -2.233945, -1.803392, 1, 1, 1, 1, 1,
-1.081719, -0.1301647, -2.232017, 1, 1, 1, 1, 1,
-1.081094, -0.9724255, -2.652736, 1, 1, 1, 1, 1,
-1.079082, -1.51352, -0.9893567, 1, 1, 1, 1, 1,
-1.078138, 0.414362, -0.9947341, 1, 1, 1, 1, 1,
-1.076588, 0.4046324, -0.01573097, 1, 1, 1, 1, 1,
-1.073303, 1.422079, -1.142584, 1, 1, 1, 1, 1,
-1.062936, -0.4601945, -1.103871, 1, 1, 1, 1, 1,
-1.060767, -0.03791843, 0.1321392, 1, 1, 1, 1, 1,
-1.060573, 1.672759, -0.995296, 1, 1, 1, 1, 1,
-1.051795, 0.6008211, -2.504411, 0, 0, 1, 1, 1,
-1.048715, 2.555493, -1.53957, 1, 0, 0, 1, 1,
-1.044798, -1.148881, -3.290239, 1, 0, 0, 1, 1,
-1.042787, 0.8674426, -1.977908, 1, 0, 0, 1, 1,
-1.039042, -0.2482248, -2.54487, 1, 0, 0, 1, 1,
-1.037039, -0.4116946, -2.378974, 1, 0, 0, 1, 1,
-1.035443, -0.84467, -2.725142, 0, 0, 0, 1, 1,
-1.031654, 1.018392, -1.467035, 0, 0, 0, 1, 1,
-1.030946, 0.3523169, 0.2147665, 0, 0, 0, 1, 1,
-1.030436, 0.2014746, -1.408061, 0, 0, 0, 1, 1,
-1.02664, -1.454476, -1.907276, 0, 0, 0, 1, 1,
-1.006723, -0.1844073, -0.602736, 0, 0, 0, 1, 1,
-1.004785, -0.5578925, -1.08163, 0, 0, 0, 1, 1,
-1.001443, -0.1918854, -1.864324, 1, 1, 1, 1, 1,
-0.9987149, 0.7680455, -1.105997, 1, 1, 1, 1, 1,
-0.9969522, -1.14421, -0.3241672, 1, 1, 1, 1, 1,
-0.9968681, -1.439235, -3.369839, 1, 1, 1, 1, 1,
-0.9935933, -0.7523581, -2.182537, 1, 1, 1, 1, 1,
-0.9925005, 0.5993553, -1.193109, 1, 1, 1, 1, 1,
-0.990675, -0.860532, -1.344577, 1, 1, 1, 1, 1,
-0.9861608, 1.354743, -0.373273, 1, 1, 1, 1, 1,
-0.985835, -1.294485, -1.480786, 1, 1, 1, 1, 1,
-0.9839532, -1.12563, -2.01321, 1, 1, 1, 1, 1,
-0.9769239, -1.271742, -3.410092, 1, 1, 1, 1, 1,
-0.9750762, 1.435182, 0.2178484, 1, 1, 1, 1, 1,
-0.96188, -1.485154, -2.427321, 1, 1, 1, 1, 1,
-0.9549246, 0.342738, -0.9545472, 1, 1, 1, 1, 1,
-0.940966, 0.5409243, -0.7928725, 1, 1, 1, 1, 1,
-0.938192, 0.3040942, 1.467815, 0, 0, 1, 1, 1,
-0.9373909, -0.4469732, -2.59126, 1, 0, 0, 1, 1,
-0.9335467, -1.156151, -2.035403, 1, 0, 0, 1, 1,
-0.9191898, -0.4027927, -2.769623, 1, 0, 0, 1, 1,
-0.9117342, -0.4056783, -1.538876, 1, 0, 0, 1, 1,
-0.9016211, 0.7730704, -0.3309393, 1, 0, 0, 1, 1,
-0.8949744, 0.431958, -1.463077, 0, 0, 0, 1, 1,
-0.8938722, -0.4329416, -3.178518, 0, 0, 0, 1, 1,
-0.8893737, -0.6938325, -0.8294981, 0, 0, 0, 1, 1,
-0.8877929, 0.1155824, -0.7928316, 0, 0, 0, 1, 1,
-0.8848838, -0.5008383, -3.114836, 0, 0, 0, 1, 1,
-0.8752652, -0.2491367, -2.525388, 0, 0, 0, 1, 1,
-0.8742005, 0.3766522, 0.0364088, 0, 0, 0, 1, 1,
-0.8741298, -0.8731169, -2.773963, 1, 1, 1, 1, 1,
-0.871151, -1.1103, -4.053667, 1, 1, 1, 1, 1,
-0.8710293, -1.616274, -2.918171, 1, 1, 1, 1, 1,
-0.8565471, 0.3962156, -2.314806, 1, 1, 1, 1, 1,
-0.8544889, -0.03389987, -2.597391, 1, 1, 1, 1, 1,
-0.8528268, -1.333569, -3.050993, 1, 1, 1, 1, 1,
-0.8524167, 0.585797, 0.04193286, 1, 1, 1, 1, 1,
-0.8496789, -0.1961755, -2.174823, 1, 1, 1, 1, 1,
-0.8477567, -0.9325077, -2.67826, 1, 1, 1, 1, 1,
-0.8465527, -1.413273, -0.8599813, 1, 1, 1, 1, 1,
-0.8351517, -1.710662, -3.369825, 1, 1, 1, 1, 1,
-0.8340924, -0.8376164, -2.826971, 1, 1, 1, 1, 1,
-0.8334234, 0.5108796, -1.322841, 1, 1, 1, 1, 1,
-0.832467, -1.079551, -3.679216, 1, 1, 1, 1, 1,
-0.8276804, -0.9875057, -2.167319, 1, 1, 1, 1, 1,
-0.8271633, -0.5065892, -2.642155, 0, 0, 1, 1, 1,
-0.8238303, -0.1797836, -0.5949115, 1, 0, 0, 1, 1,
-0.8231984, 0.3965938, -3.208992, 1, 0, 0, 1, 1,
-0.8231768, -0.149604, -0.4094543, 1, 0, 0, 1, 1,
-0.8183684, -0.2110138, -1.227729, 1, 0, 0, 1, 1,
-0.818002, 0.09358963, -0.3965714, 1, 0, 0, 1, 1,
-0.8149924, 0.3163409, -1.106909, 0, 0, 0, 1, 1,
-0.8122709, -1.56936, -1.167588, 0, 0, 0, 1, 1,
-0.8054661, -0.6328155, -2.26687, 0, 0, 0, 1, 1,
-0.803383, 0.5616168, -1.446405, 0, 0, 0, 1, 1,
-0.8028185, 0.7849243, -1.623312, 0, 0, 0, 1, 1,
-0.7949253, -0.4920497, -2.952138, 0, 0, 0, 1, 1,
-0.7929359, -0.1153865, -2.731395, 0, 0, 0, 1, 1,
-0.7873939, 0.268996, -0.4627757, 1, 1, 1, 1, 1,
-0.7799535, -0.7449651, -2.713993, 1, 1, 1, 1, 1,
-0.7735578, -0.3204564, -2.904079, 1, 1, 1, 1, 1,
-0.7721868, -0.3327987, -0.4741392, 1, 1, 1, 1, 1,
-0.7719944, -0.1333688, -2.296499, 1, 1, 1, 1, 1,
-0.7640906, -0.834469, -2.477739, 1, 1, 1, 1, 1,
-0.7593791, 0.4511831, -2.945533, 1, 1, 1, 1, 1,
-0.7568014, 0.5049655, 1.325942, 1, 1, 1, 1, 1,
-0.754908, 0.1017133, 0.2239686, 1, 1, 1, 1, 1,
-0.7429731, -0.7906393, -2.759378, 1, 1, 1, 1, 1,
-0.7353134, 0.2976397, -3.153456, 1, 1, 1, 1, 1,
-0.7339857, -1.765374, -3.653539, 1, 1, 1, 1, 1,
-0.7338992, -0.6903479, -1.365234, 1, 1, 1, 1, 1,
-0.7287681, -1.12348, -2.684577, 1, 1, 1, 1, 1,
-0.7214307, 0.5334609, -1.220924, 1, 1, 1, 1, 1,
-0.7149441, 0.737858, -2.456583, 0, 0, 1, 1, 1,
-0.7115039, 0.6239387, -0.07584536, 1, 0, 0, 1, 1,
-0.7097631, -2.03095, -3.405035, 1, 0, 0, 1, 1,
-0.7079386, 0.6691836, 0.3010848, 1, 0, 0, 1, 1,
-0.7066632, -1.354203, -2.045506, 1, 0, 0, 1, 1,
-0.7065406, -1.897683, -2.10462, 1, 0, 0, 1, 1,
-0.7047044, 0.2580255, -0.8449736, 0, 0, 0, 1, 1,
-0.7019334, 1.406925, 0.9754859, 0, 0, 0, 1, 1,
-0.6996908, -0.9293341, -4.74866, 0, 0, 0, 1, 1,
-0.6930412, -2.135041, -3.122375, 0, 0, 0, 1, 1,
-0.6839244, -1.059138, -3.269099, 0, 0, 0, 1, 1,
-0.6833146, -1.920358, -2.8294, 0, 0, 0, 1, 1,
-0.6778981, -0.7592945, -2.422198, 0, 0, 0, 1, 1,
-0.6744239, 1.207301, -1.371957, 1, 1, 1, 1, 1,
-0.6730515, 0.2099137, 0.1038749, 1, 1, 1, 1, 1,
-0.6715811, -0.2344392, -1.114376, 1, 1, 1, 1, 1,
-0.6703836, -0.001966072, -2.268635, 1, 1, 1, 1, 1,
-0.6620629, -0.1061899, -2.17711, 1, 1, 1, 1, 1,
-0.654142, 0.7579513, 1.558681, 1, 1, 1, 1, 1,
-0.647063, -0.4046114, -0.6594427, 1, 1, 1, 1, 1,
-0.6420146, -0.9497079, -5.346019, 1, 1, 1, 1, 1,
-0.6408468, -0.615785, -1.029622, 1, 1, 1, 1, 1,
-0.6386998, 0.5089636, -1.680586, 1, 1, 1, 1, 1,
-0.6275833, 1.090146, 0.5432351, 1, 1, 1, 1, 1,
-0.6250638, 1.913471, -1.219824, 1, 1, 1, 1, 1,
-0.623998, 2.552706, -1.784584, 1, 1, 1, 1, 1,
-0.6176999, -0.8114682, -4.605175, 1, 1, 1, 1, 1,
-0.6058824, 1.125285, -0.3970259, 1, 1, 1, 1, 1,
-0.6036384, -0.07660563, -2.974187, 0, 0, 1, 1, 1,
-0.5972651, -0.3555988, -2.830554, 1, 0, 0, 1, 1,
-0.595044, -1.05646, -2.477716, 1, 0, 0, 1, 1,
-0.5926666, -0.7870461, -1.715108, 1, 0, 0, 1, 1,
-0.5831473, 0.632865, -0.4624421, 1, 0, 0, 1, 1,
-0.5814927, 0.1803831, -1.727006, 1, 0, 0, 1, 1,
-0.5807856, 1.733173, -0.6964911, 0, 0, 0, 1, 1,
-0.5774527, 0.569766, 0.1435198, 0, 0, 0, 1, 1,
-0.5725414, -1.592911, -1.30536, 0, 0, 0, 1, 1,
-0.5716109, -0.6956795, -2.139438, 0, 0, 0, 1, 1,
-0.5682729, 0.3232903, -0.2068414, 0, 0, 0, 1, 1,
-0.5666163, 0.0131005, -0.8006677, 0, 0, 0, 1, 1,
-0.5641356, 1.599596, -0.0365428, 0, 0, 0, 1, 1,
-0.5637622, 1.327885, 0.5641056, 1, 1, 1, 1, 1,
-0.5593261, 0.4371602, -0.1669663, 1, 1, 1, 1, 1,
-0.5547135, 2.225549, -0.6841522, 1, 1, 1, 1, 1,
-0.5539667, 1.159881, 1.126146, 1, 1, 1, 1, 1,
-0.5521315, -0.6153269, -0.9222554, 1, 1, 1, 1, 1,
-0.5354192, -1.144328, -2.874358, 1, 1, 1, 1, 1,
-0.5329785, -1.229518, -1.635175, 1, 1, 1, 1, 1,
-0.5316188, -0.3934632, -1.781234, 1, 1, 1, 1, 1,
-0.529976, 1.007531, -1.168775, 1, 1, 1, 1, 1,
-0.5280666, 0.9094334, -0.905852, 1, 1, 1, 1, 1,
-0.5233878, 0.01835309, -1.434885, 1, 1, 1, 1, 1,
-0.5215043, 2.057368, -1.482857, 1, 1, 1, 1, 1,
-0.5212346, -1.965769, -2.156395, 1, 1, 1, 1, 1,
-0.5211525, 0.5240859, -0.135501, 1, 1, 1, 1, 1,
-0.5132044, -0.5332121, -2.016458, 1, 1, 1, 1, 1,
-0.5077116, 0.2300592, 0.118977, 0, 0, 1, 1, 1,
-0.4964379, -0.02201437, -2.442466, 1, 0, 0, 1, 1,
-0.4879158, -0.3461182, -1.546137, 1, 0, 0, 1, 1,
-0.484353, -0.133767, -1.368661, 1, 0, 0, 1, 1,
-0.4840441, -0.7613035, -1.173268, 1, 0, 0, 1, 1,
-0.4838171, -0.7145613, -2.877864, 1, 0, 0, 1, 1,
-0.4807536, 0.4421346, -1.775625, 0, 0, 0, 1, 1,
-0.480339, 0.2629899, 0.2119594, 0, 0, 0, 1, 1,
-0.4780966, 0.9621201, -0.6344126, 0, 0, 0, 1, 1,
-0.4751843, 1.304036, -0.6841348, 0, 0, 0, 1, 1,
-0.4741157, -0.208412, -2.947068, 0, 0, 0, 1, 1,
-0.4718659, 0.618351, 0.5178312, 0, 0, 0, 1, 1,
-0.4710267, -0.3080123, -2.678178, 0, 0, 0, 1, 1,
-0.4543588, 0.06622102, -0.6692657, 1, 1, 1, 1, 1,
-0.4469346, -1.010655, -1.953422, 1, 1, 1, 1, 1,
-0.4466664, 0.6660408, -1.248706, 1, 1, 1, 1, 1,
-0.444683, 0.683087, 0.9828264, 1, 1, 1, 1, 1,
-0.4418746, 0.1760699, -1.540579, 1, 1, 1, 1, 1,
-0.4415415, 1.512332, 1.304766, 1, 1, 1, 1, 1,
-0.4392251, -0.7786188, -0.926438, 1, 1, 1, 1, 1,
-0.4377209, 0.3232467, -0.7696393, 1, 1, 1, 1, 1,
-0.4346836, 0.4953681, -2.054639, 1, 1, 1, 1, 1,
-0.4268586, 0.3611558, -0.8016068, 1, 1, 1, 1, 1,
-0.423425, -1.069141, -1.475059, 1, 1, 1, 1, 1,
-0.4216261, 1.449367, -0.9605261, 1, 1, 1, 1, 1,
-0.419381, -0.4198937, -2.664226, 1, 1, 1, 1, 1,
-0.416324, -1.370326, -3.199399, 1, 1, 1, 1, 1,
-0.4121047, -1.035452, -3.817772, 1, 1, 1, 1, 1,
-0.403737, -1.077162, -3.690315, 0, 0, 1, 1, 1,
-0.4004163, -0.8714201, -2.751756, 1, 0, 0, 1, 1,
-0.3963281, 0.2225172, 0.7813252, 1, 0, 0, 1, 1,
-0.3890994, 1.198458, 0.5244199, 1, 0, 0, 1, 1,
-0.3837323, -0.586622, -5.362337, 1, 0, 0, 1, 1,
-0.38313, -0.4263091, -2.154885, 1, 0, 0, 1, 1,
-0.3814689, -0.8417441, -4.537988, 0, 0, 0, 1, 1,
-0.3813279, 0.3726246, -0.4096182, 0, 0, 0, 1, 1,
-0.378026, 0.5591449, 0.9025103, 0, 0, 0, 1, 1,
-0.3763469, 0.2911727, -0.6292029, 0, 0, 0, 1, 1,
-0.3742572, -0.2078844, -3.155444, 0, 0, 0, 1, 1,
-0.3723482, 0.7788139, 0.6687229, 0, 0, 0, 1, 1,
-0.3690823, -0.5265045, -2.815883, 0, 0, 0, 1, 1,
-0.3685415, -0.5783558, -2.69438, 1, 1, 1, 1, 1,
-0.3661999, -0.00314393, -2.586965, 1, 1, 1, 1, 1,
-0.3659921, -0.7977824, -3.800773, 1, 1, 1, 1, 1,
-0.361041, -0.5085205, -3.670829, 1, 1, 1, 1, 1,
-0.3594681, -0.1226642, -2.487623, 1, 1, 1, 1, 1,
-0.3566825, -1.81045, -2.834823, 1, 1, 1, 1, 1,
-0.3555646, -1.754403, -2.166881, 1, 1, 1, 1, 1,
-0.3524345, -1.154828, -2.221996, 1, 1, 1, 1, 1,
-0.351995, -0.2330922, -3.79815, 1, 1, 1, 1, 1,
-0.351149, 1.295552, -1.569845, 1, 1, 1, 1, 1,
-0.3493226, 0.05781923, -2.587907, 1, 1, 1, 1, 1,
-0.3443165, 0.5445297, -0.8671446, 1, 1, 1, 1, 1,
-0.3437096, 0.7949018, -1.373628, 1, 1, 1, 1, 1,
-0.3411116, -0.8272846, -2.560114, 1, 1, 1, 1, 1,
-0.3408808, -1.090596, -4.249533, 1, 1, 1, 1, 1,
-0.3408594, -0.0504237, -1.87086, 0, 0, 1, 1, 1,
-0.3404027, 0.3833596, -1.099273, 1, 0, 0, 1, 1,
-0.3370263, 1.048995, -1.520552, 1, 0, 0, 1, 1,
-0.3328147, -0.9234048, -2.008409, 1, 0, 0, 1, 1,
-0.3325023, -0.5814604, -2.245898, 1, 0, 0, 1, 1,
-0.3316893, 1.249573, -1.299517, 1, 0, 0, 1, 1,
-0.3271342, -2.67342, -2.859332, 0, 0, 0, 1, 1,
-0.3267474, 0.1762201, -2.05429, 0, 0, 0, 1, 1,
-0.3238317, -0.9990988, -2.868235, 0, 0, 0, 1, 1,
-0.3224756, 0.7851193, -2.417495, 0, 0, 0, 1, 1,
-0.3203623, 0.9376429, -2.208152, 0, 0, 0, 1, 1,
-0.3185273, 0.328287, 0.2174976, 0, 0, 0, 1, 1,
-0.318441, 0.3309039, 1.489142, 0, 0, 0, 1, 1,
-0.3175189, -0.4310662, -0.6591754, 1, 1, 1, 1, 1,
-0.3154693, 0.9254571, 1.507204, 1, 1, 1, 1, 1,
-0.3120315, -1.281831, -3.132374, 1, 1, 1, 1, 1,
-0.3115168, 0.2245137, 0.02721846, 1, 1, 1, 1, 1,
-0.3093433, 0.1721463, -1.950406, 1, 1, 1, 1, 1,
-0.3089771, -0.4027943, -2.583436, 1, 1, 1, 1, 1,
-0.3080232, 0.09038255, -2.265095, 1, 1, 1, 1, 1,
-0.2999008, 0.1065599, -1.706479, 1, 1, 1, 1, 1,
-0.2993807, 1.104474, -0.4987216, 1, 1, 1, 1, 1,
-0.2986437, -1.019022, -2.571411, 1, 1, 1, 1, 1,
-0.297733, -1.606431, -2.013426, 1, 1, 1, 1, 1,
-0.2965889, 1.225226, 0.3318893, 1, 1, 1, 1, 1,
-0.2925302, -0.2740128, -2.688649, 1, 1, 1, 1, 1,
-0.2913699, -0.3306399, -2.601425, 1, 1, 1, 1, 1,
-0.2883237, 2.312674, 0.1970906, 1, 1, 1, 1, 1,
-0.2806039, -0.6817716, -3.67723, 0, 0, 1, 1, 1,
-0.2780491, 0.5313686, -1.863296, 1, 0, 0, 1, 1,
-0.276031, 0.5799853, 1.004277, 1, 0, 0, 1, 1,
-0.2698377, 0.4825424, -0.230217, 1, 0, 0, 1, 1,
-0.2670156, 1.883074, -0.9639494, 1, 0, 0, 1, 1,
-0.2660706, -0.4901047, -3.402266, 1, 0, 0, 1, 1,
-0.2613296, 0.04393873, -0.7085485, 0, 0, 0, 1, 1,
-0.2599794, 0.3969994, -0.4667708, 0, 0, 0, 1, 1,
-0.2599488, -0.02358216, -3.312823, 0, 0, 0, 1, 1,
-0.2549473, 1.949454, -0.6212935, 0, 0, 0, 1, 1,
-0.247373, -0.05233391, -3.730506, 0, 0, 0, 1, 1,
-0.2458743, -0.4451033, -1.950971, 0, 0, 0, 1, 1,
-0.2449291, 1.160516, 0.4461451, 0, 0, 0, 1, 1,
-0.2431175, 0.9759706, 0.6913792, 1, 1, 1, 1, 1,
-0.242694, 0.1116164, -1.009072, 1, 1, 1, 1, 1,
-0.2378369, 1.376733, -1.441657, 1, 1, 1, 1, 1,
-0.2372152, -0.01572928, -2.40697, 1, 1, 1, 1, 1,
-0.235143, 0.1371941, 0.2107216, 1, 1, 1, 1, 1,
-0.2348487, -0.9256176, -0.8823509, 1, 1, 1, 1, 1,
-0.2330195, -0.8096196, -2.207618, 1, 1, 1, 1, 1,
-0.2328996, 1.698733, -1.364485, 1, 1, 1, 1, 1,
-0.2293501, -1.463157, -0.8998671, 1, 1, 1, 1, 1,
-0.225912, -1.006297, -4.013773, 1, 1, 1, 1, 1,
-0.2228304, 1.321404, 0.6668131, 1, 1, 1, 1, 1,
-0.2204072, -1.727648, -3.779589, 1, 1, 1, 1, 1,
-0.2188518, 0.4775226, -0.2548226, 1, 1, 1, 1, 1,
-0.2178908, -0.6685031, -1.530073, 1, 1, 1, 1, 1,
-0.2175955, -0.84134, -2.925308, 1, 1, 1, 1, 1,
-0.213521, 1.561689, 1.394774, 0, 0, 1, 1, 1,
-0.2061298, 0.166168, -0.3174754, 1, 0, 0, 1, 1,
-0.2030047, 0.6183753, 0.8244905, 1, 0, 0, 1, 1,
-0.1957588, -0.3157728, -3.861372, 1, 0, 0, 1, 1,
-0.1913966, -0.7111756, -2.034719, 1, 0, 0, 1, 1,
-0.1908652, -1.130741, -2.151688, 1, 0, 0, 1, 1,
-0.189302, -1.423146, -3.645136, 0, 0, 0, 1, 1,
-0.1872327, -0.4312811, -2.732592, 0, 0, 0, 1, 1,
-0.1838558, -0.7902578, -2.611293, 0, 0, 0, 1, 1,
-0.1781006, 1.169835, 0.3608227, 0, 0, 0, 1, 1,
-0.172879, 0.3998345, -1.571428, 0, 0, 0, 1, 1,
-0.1706785, 0.1353839, 0.4405585, 0, 0, 0, 1, 1,
-0.1699398, -0.2578555, -3.407109, 0, 0, 0, 1, 1,
-0.1683246, 0.3106298, -1.805433, 1, 1, 1, 1, 1,
-0.1659003, 1.008511, -0.07077458, 1, 1, 1, 1, 1,
-0.1633796, 0.3391865, -0.06918832, 1, 1, 1, 1, 1,
-0.1609563, 0.1824959, -0.6831759, 1, 1, 1, 1, 1,
-0.1603602, 1.63258, -1.418838, 1, 1, 1, 1, 1,
-0.1591155, 1.441659, -0.8863026, 1, 1, 1, 1, 1,
-0.1573676, 0.7995576, 0.09146678, 1, 1, 1, 1, 1,
-0.1552105, -0.2699422, -2.015533, 1, 1, 1, 1, 1,
-0.1491721, 1.082856, -1.333965, 1, 1, 1, 1, 1,
-0.1472209, 0.4971739, 0.4853849, 1, 1, 1, 1, 1,
-0.1445977, -0.4121672, -2.175059, 1, 1, 1, 1, 1,
-0.1391914, -0.3074968, -2.349571, 1, 1, 1, 1, 1,
-0.1369901, -0.8003541, -2.807973, 1, 1, 1, 1, 1,
-0.1344886, 0.9397956, 0.675247, 1, 1, 1, 1, 1,
-0.1312929, -1.528926, -2.777514, 1, 1, 1, 1, 1,
-0.1309401, 0.9111929, 1.325451, 0, 0, 1, 1, 1,
-0.1263891, -1.844281, -1.34982, 1, 0, 0, 1, 1,
-0.1252606, -0.7555711, -5.285976, 1, 0, 0, 1, 1,
-0.1227641, -1.441024, -1.571514, 1, 0, 0, 1, 1,
-0.1221131, -1.055824, -4.793033, 1, 0, 0, 1, 1,
-0.1212694, -1.703848, -3.048831, 1, 0, 0, 1, 1,
-0.1152455, -0.8620021, -4.408523, 0, 0, 0, 1, 1,
-0.1144722, -1.081565, -2.275568, 0, 0, 0, 1, 1,
-0.1095623, 0.1684831, 0.7875441, 0, 0, 0, 1, 1,
-0.1091164, 1.004371, -0.09601092, 0, 0, 0, 1, 1,
-0.1064316, -2.14871, -4.789346, 0, 0, 0, 1, 1,
-0.1048323, -0.3025311, -2.579766, 0, 0, 0, 1, 1,
-0.1026786, 0.9956303, -0.2795179, 0, 0, 0, 1, 1,
-0.09967573, 0.5957463, -1.818249, 1, 1, 1, 1, 1,
-0.09873909, -3.528385, -2.077287, 1, 1, 1, 1, 1,
-0.09756433, -1.754097, -3.112731, 1, 1, 1, 1, 1,
-0.08879499, 0.05728202, -1.631942, 1, 1, 1, 1, 1,
-0.08844581, 0.9787354, -0.1860124, 1, 1, 1, 1, 1,
-0.08075215, -0.2106256, -4.865628, 1, 1, 1, 1, 1,
-0.07948898, -1.717445, -4.054293, 1, 1, 1, 1, 1,
-0.07508998, 1.052961, -0.2117026, 1, 1, 1, 1, 1,
-0.07403061, -0.2677843, -3.586552, 1, 1, 1, 1, 1,
-0.06935161, 0.8495323, 0.5526057, 1, 1, 1, 1, 1,
-0.06631468, 0.6548724, -0.8955634, 1, 1, 1, 1, 1,
-0.05878228, -1.183728, -1.563535, 1, 1, 1, 1, 1,
-0.05802629, 0.8915509, -3.030784, 1, 1, 1, 1, 1,
-0.05025685, 0.9277897, 0.1261309, 1, 1, 1, 1, 1,
-0.04813454, -0.7599672, -3.279048, 1, 1, 1, 1, 1,
-0.04480468, 0.1841832, -0.1625729, 0, 0, 1, 1, 1,
-0.0429285, -0.4468559, -4.973608, 1, 0, 0, 1, 1,
-0.04213668, -3.551763, -4.86535, 1, 0, 0, 1, 1,
-0.03705282, 1.179707, 1.431892, 1, 0, 0, 1, 1,
-0.03499041, -0.4716338, -1.332616, 1, 0, 0, 1, 1,
-0.03414079, -0.0816657, -1.914749, 1, 0, 0, 1, 1,
-0.02829373, 0.6418772, 1.318078, 0, 0, 0, 1, 1,
-0.02187508, -0.3437597, -2.687231, 0, 0, 0, 1, 1,
-0.02013765, 0.1902132, -0.2043103, 0, 0, 0, 1, 1,
-0.01944791, 0.9730836, -0.3515483, 0, 0, 0, 1, 1,
-0.01801352, -0.343694, -2.436185, 0, 0, 0, 1, 1,
-0.01452384, 1.252332, -0.6025416, 0, 0, 0, 1, 1,
-0.01431786, -0.406107, -3.716571, 0, 0, 0, 1, 1,
-0.01335319, 0.02309966, -0.5312387, 1, 1, 1, 1, 1,
-0.01109929, -0.7345749, -3.385916, 1, 1, 1, 1, 1,
-0.006397027, -0.4445142, -3.123109, 1, 1, 1, 1, 1,
-0.005819671, -1.363414, -4.896732, 1, 1, 1, 1, 1,
-0.001083127, 0.994202, 1.851487, 1, 1, 1, 1, 1,
0.00204156, -0.2864521, 3.412317, 1, 1, 1, 1, 1,
0.007905471, 1.26384, -0.7098203, 1, 1, 1, 1, 1,
0.01207304, 0.06581657, -1.4739, 1, 1, 1, 1, 1,
0.01353683, -0.8801259, 3.991039, 1, 1, 1, 1, 1,
0.0149424, -0.2305454, 3.183313, 1, 1, 1, 1, 1,
0.01741986, -0.3375106, 3.034213, 1, 1, 1, 1, 1,
0.01801659, -0.6472019, 4.307766, 1, 1, 1, 1, 1,
0.01801729, -0.0375912, 1.745476, 1, 1, 1, 1, 1,
0.01888378, -0.5428226, 2.082056, 1, 1, 1, 1, 1,
0.02092529, 0.6468936, 1.155384, 1, 1, 1, 1, 1,
0.0234272, 1.677094, 1.267303, 0, 0, 1, 1, 1,
0.02658528, -0.2153816, 3.10246, 1, 0, 0, 1, 1,
0.02711787, 2.055952, 0.1774419, 1, 0, 0, 1, 1,
0.02733197, 1.259232, -0.1334581, 1, 0, 0, 1, 1,
0.03008195, 0.6199024, 1.320367, 1, 0, 0, 1, 1,
0.03024328, 0.2601652, -0.5579998, 1, 0, 0, 1, 1,
0.03370328, -0.3678295, 3.013092, 0, 0, 0, 1, 1,
0.03429737, -0.8166531, 3.315718, 0, 0, 0, 1, 1,
0.0349552, 0.5093588, -1.046883, 0, 0, 0, 1, 1,
0.03581335, 0.01113394, 1.090405, 0, 0, 0, 1, 1,
0.03602521, -1.910647, 4.007081, 0, 0, 0, 1, 1,
0.04089361, -0.6558922, 2.584244, 0, 0, 0, 1, 1,
0.04588806, -1.214806, 2.904688, 0, 0, 0, 1, 1,
0.04672421, -0.9929314, 3.720847, 1, 1, 1, 1, 1,
0.05092193, 0.705385, -0.04446281, 1, 1, 1, 1, 1,
0.05129347, -0.2052695, 1.818379, 1, 1, 1, 1, 1,
0.05250473, -0.7261552, 3.234013, 1, 1, 1, 1, 1,
0.05429183, 1.089264, -0.2765376, 1, 1, 1, 1, 1,
0.05700026, 1.265486, -1.626141, 1, 1, 1, 1, 1,
0.06035772, 1.41486, 0.8493001, 1, 1, 1, 1, 1,
0.06523916, 0.9338975, -0.2259202, 1, 1, 1, 1, 1,
0.06656326, -1.381951, 2.02013, 1, 1, 1, 1, 1,
0.06965406, 1.415764, 0.5988718, 1, 1, 1, 1, 1,
0.07336195, -1.222321, 3.78793, 1, 1, 1, 1, 1,
0.07666163, -0.3470559, 2.967409, 1, 1, 1, 1, 1,
0.08571675, 0.3286344, -1.957518, 1, 1, 1, 1, 1,
0.08774336, -0.9606655, 1.277046, 1, 1, 1, 1, 1,
0.08883199, -0.4115299, 2.780679, 1, 1, 1, 1, 1,
0.0906156, 2.06883, 0.05109267, 0, 0, 1, 1, 1,
0.09076349, -0.6000383, 3.048267, 1, 0, 0, 1, 1,
0.09165597, 0.4718978, 0.4667133, 1, 0, 0, 1, 1,
0.09386616, 0.02066431, -0.05955856, 1, 0, 0, 1, 1,
0.09713019, -1.771044, 4.025395, 1, 0, 0, 1, 1,
0.1027424, -1.216687, 3.206002, 1, 0, 0, 1, 1,
0.103411, 0.6260381, 0.02437639, 0, 0, 0, 1, 1,
0.1035404, 0.4967945, -1.423756, 0, 0, 0, 1, 1,
0.1055621, -1.478114, 1.879712, 0, 0, 0, 1, 1,
0.1061198, 0.806232, 0.07303415, 0, 0, 0, 1, 1,
0.1101706, 1.403321, 0.1520901, 0, 0, 0, 1, 1,
0.1112978, 0.8618341, 1.112115, 0, 0, 0, 1, 1,
0.1148917, 2.169327, -0.9298998, 0, 0, 0, 1, 1,
0.1151241, -1.023262, 3.31082, 1, 1, 1, 1, 1,
0.1164073, -0.3688738, 2.269644, 1, 1, 1, 1, 1,
0.1175826, 0.9921384, -1.264376, 1, 1, 1, 1, 1,
0.1203545, -1.15077, 2.944786, 1, 1, 1, 1, 1,
0.1209996, -0.5502103, 2.447395, 1, 1, 1, 1, 1,
0.1218916, 1.546544, -0.06623579, 1, 1, 1, 1, 1,
0.1245618, -0.5394901, 3.61578, 1, 1, 1, 1, 1,
0.1253134, -0.3927376, 3.321995, 1, 1, 1, 1, 1,
0.1269778, -0.2915566, 1.115209, 1, 1, 1, 1, 1,
0.1291422, 0.5866783, 0.02914141, 1, 1, 1, 1, 1,
0.1326424, 2.498937, 0.3241237, 1, 1, 1, 1, 1,
0.1336581, -1.178441, 3.299787, 1, 1, 1, 1, 1,
0.1395035, -0.8486924, 0.398282, 1, 1, 1, 1, 1,
0.1495884, 0.1752123, -0.09965823, 1, 1, 1, 1, 1,
0.1509931, -2.056784, 3.603143, 1, 1, 1, 1, 1,
0.1533647, -0.01988487, 2.670233, 0, 0, 1, 1, 1,
0.1538011, -0.8409231, 3.590565, 1, 0, 0, 1, 1,
0.1542336, 0.8279436, 0.8528721, 1, 0, 0, 1, 1,
0.154836, -1.195558, 2.148233, 1, 0, 0, 1, 1,
0.1616035, -0.5328544, 2.593808, 1, 0, 0, 1, 1,
0.1629383, 0.4863413, 1.812245, 1, 0, 0, 1, 1,
0.1640015, -1.45716, 3.814917, 0, 0, 0, 1, 1,
0.1640419, 0.5549608, -0.7228075, 0, 0, 0, 1, 1,
0.1646385, 0.03803436, 0.2122424, 0, 0, 0, 1, 1,
0.1660656, -0.6072971, 3.590251, 0, 0, 0, 1, 1,
0.1687275, -0.5612589, 2.433944, 0, 0, 0, 1, 1,
0.1694295, 0.9695387, -1.127756, 0, 0, 0, 1, 1,
0.1711313, -0.3879287, 3.896372, 0, 0, 0, 1, 1,
0.1729276, 1.111938, -1.239322, 1, 1, 1, 1, 1,
0.1729765, -2.009943, 2.96342, 1, 1, 1, 1, 1,
0.1747186, -0.1794043, 3.017977, 1, 1, 1, 1, 1,
0.1778191, 0.3755572, 0.694393, 1, 1, 1, 1, 1,
0.1793579, -0.2725931, 2.176465, 1, 1, 1, 1, 1,
0.1880564, -1.337858, 1.799653, 1, 1, 1, 1, 1,
0.1959804, -0.8955873, 4.675336, 1, 1, 1, 1, 1,
0.1961571, 0.5959334, -1.027936, 1, 1, 1, 1, 1,
0.1972721, -0.2286173, 2.039595, 1, 1, 1, 1, 1,
0.1989489, 0.5222684, 0.8911172, 1, 1, 1, 1, 1,
0.2014763, 0.01797394, 1.042617, 1, 1, 1, 1, 1,
0.201634, 2.045826, 0.7385587, 1, 1, 1, 1, 1,
0.2022218, 0.5101192, 0.6000972, 1, 1, 1, 1, 1,
0.2024476, 0.6503069, 1.56359, 1, 1, 1, 1, 1,
0.2041911, 0.8582338, 0.1465538, 1, 1, 1, 1, 1,
0.2052306, 0.5353953, 0.9214492, 0, 0, 1, 1, 1,
0.2053718, -1.180169, 3.222799, 1, 0, 0, 1, 1,
0.2059104, -0.480489, 1.612923, 1, 0, 0, 1, 1,
0.2064891, 0.2129744, 2.094826, 1, 0, 0, 1, 1,
0.2088221, -0.08370068, 3.631012, 1, 0, 0, 1, 1,
0.2120018, -0.0850568, 1.736069, 1, 0, 0, 1, 1,
0.2130836, 0.5355487, -0.1837651, 0, 0, 0, 1, 1,
0.2195868, 1.063412, 0.9285811, 0, 0, 0, 1, 1,
0.2197898, 0.08213753, 2.738481, 0, 0, 0, 1, 1,
0.223645, -1.246989, 4.298928, 0, 0, 0, 1, 1,
0.2249206, 0.1300868, 2.466253, 0, 0, 0, 1, 1,
0.2327296, -0.6133605, 3.964466, 0, 0, 0, 1, 1,
0.2398604, 1.067068, -0.1659181, 0, 0, 0, 1, 1,
0.2401395, 0.02974436, 1.387558, 1, 1, 1, 1, 1,
0.2401737, -0.01877684, 2.419142, 1, 1, 1, 1, 1,
0.244432, 0.04647094, 0.9370967, 1, 1, 1, 1, 1,
0.2462049, 0.3605281, -0.03668879, 1, 1, 1, 1, 1,
0.2480038, -2.034842, 3.277158, 1, 1, 1, 1, 1,
0.2530161, 0.4757346, -0.638365, 1, 1, 1, 1, 1,
0.2535417, 0.1078301, 0.6468949, 1, 1, 1, 1, 1,
0.2538469, -1.251256, 5.069025, 1, 1, 1, 1, 1,
0.2546738, 0.2595261, 3.139997, 1, 1, 1, 1, 1,
0.2550539, -0.893934, 2.7608, 1, 1, 1, 1, 1,
0.2581589, -0.1964683, 2.521101, 1, 1, 1, 1, 1,
0.2607965, -1.493453, 3.510942, 1, 1, 1, 1, 1,
0.262367, -0.03627582, 1.723679, 1, 1, 1, 1, 1,
0.2629085, -0.7095468, 3.255721, 1, 1, 1, 1, 1,
0.2636223, 1.289174, 0.5658408, 1, 1, 1, 1, 1,
0.2671758, -1.141617, 3.049931, 0, 0, 1, 1, 1,
0.2697477, -0.9229211, 0.9873071, 1, 0, 0, 1, 1,
0.2770282, 1.273359, -0.03695852, 1, 0, 0, 1, 1,
0.2793451, -0.1506409, 4.390327, 1, 0, 0, 1, 1,
0.2813991, 0.8812119, 2.721254, 1, 0, 0, 1, 1,
0.2836884, -0.2983375, 1.828764, 1, 0, 0, 1, 1,
0.2845784, -0.5479928, 2.258258, 0, 0, 0, 1, 1,
0.2853589, -1.119924, 4.182536, 0, 0, 0, 1, 1,
0.2865424, 0.05461738, 1.43536, 0, 0, 0, 1, 1,
0.2982126, -1.370136, 2.877843, 0, 0, 0, 1, 1,
0.298351, -1.799217, 1.804592, 0, 0, 0, 1, 1,
0.2998661, 0.2103273, 1.373726, 0, 0, 0, 1, 1,
0.3014975, -0.5820155, 2.470399, 0, 0, 0, 1, 1,
0.303562, -0.4756466, 2.254111, 1, 1, 1, 1, 1,
0.3046559, 1.338251, -1.531087, 1, 1, 1, 1, 1,
0.3098909, 1.949245, -0.2183034, 1, 1, 1, 1, 1,
0.3130485, -0.0809314, 2.818369, 1, 1, 1, 1, 1,
0.31531, 1.058567, 2.166851, 1, 1, 1, 1, 1,
0.3155859, -0.245474, 1.36073, 1, 1, 1, 1, 1,
0.3195341, -1.311352, 4.473037, 1, 1, 1, 1, 1,
0.3197368, 0.5131813, 2.081851, 1, 1, 1, 1, 1,
0.3254124, 0.1582246, 1.39769, 1, 1, 1, 1, 1,
0.3255375, 0.7684147, -1.031199, 1, 1, 1, 1, 1,
0.3309838, -1.955708, 3.733423, 1, 1, 1, 1, 1,
0.3321829, -0.7804397, 4.136992, 1, 1, 1, 1, 1,
0.3331049, -0.6244915, 1.594362, 1, 1, 1, 1, 1,
0.3337242, -0.611377, 2.596458, 1, 1, 1, 1, 1,
0.3337659, 0.2286565, 2.292723, 1, 1, 1, 1, 1,
0.3340055, 0.4043022, 0.7769994, 0, 0, 1, 1, 1,
0.336181, 0.053373, 0.475876, 1, 0, 0, 1, 1,
0.3370375, -1.204638, 3.070933, 1, 0, 0, 1, 1,
0.3378481, -2.569951, 2.954823, 1, 0, 0, 1, 1,
0.3393141, 1.024363, -0.3068171, 1, 0, 0, 1, 1,
0.340795, 1.210522, 1.230295, 1, 0, 0, 1, 1,
0.3510083, -0.3312938, 3.423749, 0, 0, 0, 1, 1,
0.3541071, -2.181325, 3.862319, 0, 0, 0, 1, 1,
0.354968, -0.4304588, 3.813183, 0, 0, 0, 1, 1,
0.3561034, 0.002560819, 2.920198, 0, 0, 0, 1, 1,
0.3563142, -0.6198048, 1.209905, 0, 0, 0, 1, 1,
0.3564572, -1.174412, 0.672702, 0, 0, 0, 1, 1,
0.3572922, -0.02199599, 0.6104769, 0, 0, 0, 1, 1,
0.3599686, 0.5144132, 0.5896661, 1, 1, 1, 1, 1,
0.3668346, -0.2509508, 2.467159, 1, 1, 1, 1, 1,
0.3672993, -1.044633, 1.816082, 1, 1, 1, 1, 1,
0.3718942, -1.247654, 1.31635, 1, 1, 1, 1, 1,
0.3725883, 0.5782909, -0.7919664, 1, 1, 1, 1, 1,
0.3800316, 0.7792585, -1.568094, 1, 1, 1, 1, 1,
0.3828582, 1.213177, 1.655961, 1, 1, 1, 1, 1,
0.3861686, 0.2739685, 0.7369958, 1, 1, 1, 1, 1,
0.3926423, -0.02053369, 3.854336, 1, 1, 1, 1, 1,
0.3940017, -0.1348064, 1.944048, 1, 1, 1, 1, 1,
0.3946566, -0.8704259, 1.746078, 1, 1, 1, 1, 1,
0.3953733, -0.1665597, 2.460003, 1, 1, 1, 1, 1,
0.397336, 1.67095, -0.2411177, 1, 1, 1, 1, 1,
0.3992198, 2.407845, 0.8759428, 1, 1, 1, 1, 1,
0.4004664, 0.8884121, 0.512986, 1, 1, 1, 1, 1,
0.4022123, -0.05423424, 2.007352, 0, 0, 1, 1, 1,
0.4026659, -0.6749085, 2.347571, 1, 0, 0, 1, 1,
0.4044365, -0.4960063, 4.248963, 1, 0, 0, 1, 1,
0.4057097, -0.358499, 1.433615, 1, 0, 0, 1, 1,
0.4072553, -0.7532349, 2.399925, 1, 0, 0, 1, 1,
0.4107501, 0.5728658, 0.02457231, 1, 0, 0, 1, 1,
0.4132997, -0.7092609, 2.037875, 0, 0, 0, 1, 1,
0.4139162, -0.3206675, 0.6804533, 0, 0, 0, 1, 1,
0.414374, 0.1275463, 2.834887, 0, 0, 0, 1, 1,
0.4185196, -0.7889763, 3.39947, 0, 0, 0, 1, 1,
0.4208164, -0.4263874, 1.712314, 0, 0, 0, 1, 1,
0.4212736, 0.04215553, 1.280685, 0, 0, 0, 1, 1,
0.4244621, 0.756528, 0.03671075, 0, 0, 0, 1, 1,
0.4288932, -2.063379, 1.575567, 1, 1, 1, 1, 1,
0.4304151, -1.884057, 3.35766, 1, 1, 1, 1, 1,
0.434112, -0.07625183, 1.478453, 1, 1, 1, 1, 1,
0.4424917, -1.463841, 2.337029, 1, 1, 1, 1, 1,
0.4429275, -0.08904762, 1.635786, 1, 1, 1, 1, 1,
0.4433196, 1.283671, 2.317622, 1, 1, 1, 1, 1,
0.4449462, 0.7413273, 0.2925817, 1, 1, 1, 1, 1,
0.4459968, 0.3571645, 1.880757, 1, 1, 1, 1, 1,
0.446314, -1.132039, 2.527, 1, 1, 1, 1, 1,
0.4467427, 1.267713, 0.1079404, 1, 1, 1, 1, 1,
0.4473045, -0.1041263, 1.484268, 1, 1, 1, 1, 1,
0.454244, 0.9397493, -0.1249477, 1, 1, 1, 1, 1,
0.4548977, 0.7565731, 0.6981445, 1, 1, 1, 1, 1,
0.4567309, 1.45353, -0.2572474, 1, 1, 1, 1, 1,
0.4592408, 0.9508702, 1.387213, 1, 1, 1, 1, 1,
0.4612279, -0.04127464, 1.47117, 0, 0, 1, 1, 1,
0.4626538, -0.4364349, 1.705485, 1, 0, 0, 1, 1,
0.4628018, -0.9580954, 2.433078, 1, 0, 0, 1, 1,
0.4656235, -1.584964, 4.103618, 1, 0, 0, 1, 1,
0.4721254, -0.2293609, 2.468924, 1, 0, 0, 1, 1,
0.4727469, 1.426345, 0.4489613, 1, 0, 0, 1, 1,
0.4762868, 0.2649987, 0.2254396, 0, 0, 0, 1, 1,
0.4781687, -1.712817, 3.347144, 0, 0, 0, 1, 1,
0.4800988, 0.6803181, 0.8069178, 0, 0, 0, 1, 1,
0.4801264, -0.4667265, 2.504175, 0, 0, 0, 1, 1,
0.4812105, 0.0780517, 1.034191, 0, 0, 0, 1, 1,
0.4844595, 0.7005501, -0.3582623, 0, 0, 0, 1, 1,
0.4845141, -0.5304088, 1.958637, 0, 0, 0, 1, 1,
0.488177, 2.327949, -0.275328, 1, 1, 1, 1, 1,
0.4884612, -0.1994346, 2.62366, 1, 1, 1, 1, 1,
0.4907339, 1.710005, 1.012141, 1, 1, 1, 1, 1,
0.4910883, 2.721509, 0.04429986, 1, 1, 1, 1, 1,
0.4945445, -1.105973, 3.168096, 1, 1, 1, 1, 1,
0.4969966, -0.4089752, 3.065633, 1, 1, 1, 1, 1,
0.4976828, -1.543697, 4.544562, 1, 1, 1, 1, 1,
0.4999398, -1.104505, 2.009261, 1, 1, 1, 1, 1,
0.5002602, -0.4045474, 2.013406, 1, 1, 1, 1, 1,
0.5018777, -1.660653, 0.735229, 1, 1, 1, 1, 1,
0.5028829, 0.4294514, 0.1491141, 1, 1, 1, 1, 1,
0.5150216, 0.3720139, 0.03359825, 1, 1, 1, 1, 1,
0.5168445, 0.05217206, 0.9898107, 1, 1, 1, 1, 1,
0.5205565, -1.025967, 4.270836, 1, 1, 1, 1, 1,
0.5234119, 0.8289201, -0.9748407, 1, 1, 1, 1, 1,
0.5238483, 1.298543, -0.1437327, 0, 0, 1, 1, 1,
0.5239133, 0.8162534, 1.415885, 1, 0, 0, 1, 1,
0.5268519, 0.5829669, 0.7042108, 1, 0, 0, 1, 1,
0.5280321, -0.4804699, 2.401065, 1, 0, 0, 1, 1,
0.5338677, 0.3238355, -0.009886678, 1, 0, 0, 1, 1,
0.53408, -1.077711, 2.606513, 1, 0, 0, 1, 1,
0.5347608, 1.350975, 0.3718221, 0, 0, 0, 1, 1,
0.5355219, -1.096555, 2.837908, 0, 0, 0, 1, 1,
0.5466982, -1.772444, 1.44101, 0, 0, 0, 1, 1,
0.5475888, -0.1464613, 1.703727, 0, 0, 0, 1, 1,
0.5491592, 0.3531067, -0.01934083, 0, 0, 0, 1, 1,
0.549521, 0.0254522, 0.6776163, 0, 0, 0, 1, 1,
0.5524514, 0.2891126, 0.163199, 0, 0, 0, 1, 1,
0.5561841, -0.06564467, 4.121171, 1, 1, 1, 1, 1,
0.5600066, -1.356526, 3.292519, 1, 1, 1, 1, 1,
0.5604108, -0.08833113, 2.595958, 1, 1, 1, 1, 1,
0.5659627, -0.1822049, 2.059299, 1, 1, 1, 1, 1,
0.5708221, 0.7241964, 0.1965258, 1, 1, 1, 1, 1,
0.5754889, 0.3533247, 0.2016238, 1, 1, 1, 1, 1,
0.5796195, -0.184371, 3.043192, 1, 1, 1, 1, 1,
0.5865107, 0.7416003, 0.8243619, 1, 1, 1, 1, 1,
0.5908793, 1.025387, -0.07671329, 1, 1, 1, 1, 1,
0.5929787, -0.4849334, 2.06453, 1, 1, 1, 1, 1,
0.5973883, 0.2279415, 1.634764, 1, 1, 1, 1, 1,
0.5979528, -0.6175959, 2.527281, 1, 1, 1, 1, 1,
0.5990823, -0.592638, 1.712708, 1, 1, 1, 1, 1,
0.6006535, -0.7874911, 2.771925, 1, 1, 1, 1, 1,
0.604347, 1.222948, 0.9920701, 1, 1, 1, 1, 1,
0.608561, 0.4323911, 0.2531326, 0, 0, 1, 1, 1,
0.6099041, 0.7799083, 0.5913512, 1, 0, 0, 1, 1,
0.6119455, 0.03906327, -0.3636505, 1, 0, 0, 1, 1,
0.6132258, -0.3787695, 1.738865, 1, 0, 0, 1, 1,
0.6136239, -0.1898619, 2.505138, 1, 0, 0, 1, 1,
0.6166956, -0.08866629, 1.669612, 1, 0, 0, 1, 1,
0.6213552, 1.610694, -0.2494745, 0, 0, 0, 1, 1,
0.6219721, -0.7919726, 0.6035573, 0, 0, 0, 1, 1,
0.6256855, 0.5612122, 1.867215, 0, 0, 0, 1, 1,
0.6281635, 0.2871975, 0.4215945, 0, 0, 0, 1, 1,
0.6291896, -0.5385141, 3.064796, 0, 0, 0, 1, 1,
0.633181, 0.490885, 1.236044, 0, 0, 0, 1, 1,
0.6339046, -0.01091908, 2.741308, 0, 0, 0, 1, 1,
0.6404669, 0.1043071, -0.5250995, 1, 1, 1, 1, 1,
0.6414934, 0.320773, 0.5016356, 1, 1, 1, 1, 1,
0.6420636, -1.852695, 3.901387, 1, 1, 1, 1, 1,
0.6434422, 2.407981, -0.7788235, 1, 1, 1, 1, 1,
0.6523762, 0.9053553, 0.5290042, 1, 1, 1, 1, 1,
0.6527959, 0.6128536, 3.093472, 1, 1, 1, 1, 1,
0.6602664, 1.890364, 1.220627, 1, 1, 1, 1, 1,
0.6740462, 0.5019369, 0.6695486, 1, 1, 1, 1, 1,
0.6772856, -1.605299, 5.088118, 1, 1, 1, 1, 1,
0.6838814, 1.136668, 0.01698181, 1, 1, 1, 1, 1,
0.6904271, 0.01045777, 1.551863, 1, 1, 1, 1, 1,
0.6955167, -0.01905373, 2.802838, 1, 1, 1, 1, 1,
0.6982171, 1.186624, 2.87734, 1, 1, 1, 1, 1,
0.7062306, 0.08301046, 2.006063, 1, 1, 1, 1, 1,
0.7070979, -0.7670143, 3.428987, 1, 1, 1, 1, 1,
0.7117179, 0.164132, 1.446271, 0, 0, 1, 1, 1,
0.7181355, -0.5188276, 4.439454, 1, 0, 0, 1, 1,
0.7201729, -0.6727926, 2.866488, 1, 0, 0, 1, 1,
0.7258871, -1.001348, 2.215144, 1, 0, 0, 1, 1,
0.7287664, 0.9607852, 0.4603305, 1, 0, 0, 1, 1,
0.7311864, -0.7318992, 3.191739, 1, 0, 0, 1, 1,
0.734397, 1.098681, -0.1603795, 0, 0, 0, 1, 1,
0.7406047, -0.7923394, 1.182887, 0, 0, 0, 1, 1,
0.7416094, 0.7030253, 1.077871, 0, 0, 0, 1, 1,
0.7428117, 0.2530046, 2.125223, 0, 0, 0, 1, 1,
0.7633457, 0.1821601, 1.021924, 0, 0, 0, 1, 1,
0.7677957, -1.711141, 1.755948, 0, 0, 0, 1, 1,
0.7726318, 0.7290826, 0.3976955, 0, 0, 0, 1, 1,
0.7764376, 0.4828694, 0.4175875, 1, 1, 1, 1, 1,
0.7768875, -0.0203096, 0.8649707, 1, 1, 1, 1, 1,
0.7772804, 0.845246, 1.741282, 1, 1, 1, 1, 1,
0.7791863, -0.3872972, 0.08506446, 1, 1, 1, 1, 1,
0.7802067, 0.4822989, 0.8635858, 1, 1, 1, 1, 1,
0.7824018, 0.7267085, 1.86907, 1, 1, 1, 1, 1,
0.7845955, -0.2832388, 3.947409, 1, 1, 1, 1, 1,
0.7851893, -0.09229416, 0.3866376, 1, 1, 1, 1, 1,
0.7853794, -1.160509, 3.428392, 1, 1, 1, 1, 1,
0.7954662, -1.013923, 2.305338, 1, 1, 1, 1, 1,
0.7974051, -0.2900282, 2.208478, 1, 1, 1, 1, 1,
0.7991493, 0.679971, 2.214174, 1, 1, 1, 1, 1,
0.8179724, 0.4009177, 0.819754, 1, 1, 1, 1, 1,
0.8212563, -0.3658306, 2.526792, 1, 1, 1, 1, 1,
0.8223921, 0.8790507, 0.3809264, 1, 1, 1, 1, 1,
0.8264071, 1.335658, 0.1998399, 0, 0, 1, 1, 1,
0.8275965, 1.355946, 0.505321, 1, 0, 0, 1, 1,
0.8319482, -0.6977407, 1.702128, 1, 0, 0, 1, 1,
0.8332716, 1.519682, 0.5607125, 1, 0, 0, 1, 1,
0.8360572, -0.02015324, 1.005959, 1, 0, 0, 1, 1,
0.8392107, -1.678508, 1.7212, 1, 0, 0, 1, 1,
0.8447369, 1.69347, 2.550173, 0, 0, 0, 1, 1,
0.8490516, -0.02313852, 0.7253551, 0, 0, 0, 1, 1,
0.8495213, 0.181972, -0.2503323, 0, 0, 0, 1, 1,
0.8573614, -0.01812197, 2.034942, 0, 0, 0, 1, 1,
0.8593332, -0.863148, 2.196548, 0, 0, 0, 1, 1,
0.8604839, 0.4769171, 0.7981912, 0, 0, 0, 1, 1,
0.8646032, -0.1194936, 1.852383, 0, 0, 0, 1, 1,
0.8668137, 2.106782, -0.4240438, 1, 1, 1, 1, 1,
0.8671985, -0.4334958, 3.842152, 1, 1, 1, 1, 1,
0.8729075, -0.8762958, 3.59054, 1, 1, 1, 1, 1,
0.8736708, 0.289839, 1.857299, 1, 1, 1, 1, 1,
0.8792068, 0.03202079, 2.437629, 1, 1, 1, 1, 1,
0.8802944, 0.7058314, 1.566494, 1, 1, 1, 1, 1,
0.8868469, -0.657773, 0.7737671, 1, 1, 1, 1, 1,
0.8875454, 0.5152783, 1.883454, 1, 1, 1, 1, 1,
0.8888579, -1.439344, 3.598797, 1, 1, 1, 1, 1,
0.893195, 1.07741, -0.1854342, 1, 1, 1, 1, 1,
0.9009686, 1.293889, 0.6079031, 1, 1, 1, 1, 1,
0.9076267, 0.07573044, 2.726193, 1, 1, 1, 1, 1,
0.9081017, -0.724458, 1.896585, 1, 1, 1, 1, 1,
0.9280061, -0.6446732, 2.938997, 1, 1, 1, 1, 1,
0.9312644, 0.6419748, 1.052824, 1, 1, 1, 1, 1,
0.9326354, 0.4648258, 1.461354, 0, 0, 1, 1, 1,
0.9348593, -1.90766, 2.85132, 1, 0, 0, 1, 1,
0.9377441, 0.967389, 0.539255, 1, 0, 0, 1, 1,
0.9397141, -0.07623317, -0.1121582, 1, 0, 0, 1, 1,
0.9427311, 0.5427052, 1.723056, 1, 0, 0, 1, 1,
0.9514235, -0.6161561, 2.393153, 1, 0, 0, 1, 1,
0.9518074, 1.163723, 0.8925059, 0, 0, 0, 1, 1,
0.9527488, 0.5054893, 1.771558, 0, 0, 0, 1, 1,
0.9569686, -1.606863, 2.642806, 0, 0, 0, 1, 1,
0.9571609, 2.266322, 0.04806397, 0, 0, 0, 1, 1,
0.9581204, 0.3175077, 1.399625, 0, 0, 0, 1, 1,
0.9583653, -0.5337155, 2.584134, 0, 0, 0, 1, 1,
0.9623559, -0.134186, 1.845017, 0, 0, 0, 1, 1,
0.9638146, 1.063474, -0.1289407, 1, 1, 1, 1, 1,
0.9642625, -0.6341244, 2.595676, 1, 1, 1, 1, 1,
0.9669925, 1.587994, 0.05340002, 1, 1, 1, 1, 1,
0.9726738, -0.7705059, 2.820157, 1, 1, 1, 1, 1,
0.973773, -0.3605354, 2.650259, 1, 1, 1, 1, 1,
0.9751706, 0.2458867, 3.024546, 1, 1, 1, 1, 1,
0.9781737, 0.1371604, 0.9630353, 1, 1, 1, 1, 1,
0.9801736, -1.198538, 2.259367, 1, 1, 1, 1, 1,
0.9882252, 1.258997, 0.5909936, 1, 1, 1, 1, 1,
0.9888223, 0.09578855, 0.574069, 1, 1, 1, 1, 1,
0.9893105, 0.5912365, 0.2203838, 1, 1, 1, 1, 1,
1.003136, 0.6997737, 0.9688202, 1, 1, 1, 1, 1,
1.005876, -1.242843, 3.151556, 1, 1, 1, 1, 1,
1.006986, -0.0238628, 0.1305206, 1, 1, 1, 1, 1,
1.007616, 0.07238522, 0.4147905, 1, 1, 1, 1, 1,
1.007996, 1.647575, 0.2556784, 0, 0, 1, 1, 1,
1.011382, 0.2025163, 1.58539, 1, 0, 0, 1, 1,
1.025843, -0.8988621, 2.30257, 1, 0, 0, 1, 1,
1.03103, 0.4571229, 1.998537, 1, 0, 0, 1, 1,
1.039735, -0.8911929, 4.767529, 1, 0, 0, 1, 1,
1.04081, 0.4965264, 3.396173, 1, 0, 0, 1, 1,
1.053213, -0.7918944, 2.375428, 0, 0, 0, 1, 1,
1.054741, 0.5118709, -0.4333203, 0, 0, 0, 1, 1,
1.054877, 0.3403807, 0.401352, 0, 0, 0, 1, 1,
1.056892, 1.311672, 1.224787, 0, 0, 0, 1, 1,
1.061952, -1.919502, 1.861458, 0, 0, 0, 1, 1,
1.06804, -0.005825171, 1.985854, 0, 0, 0, 1, 1,
1.07562, 0.6083094, 0.7331756, 0, 0, 0, 1, 1,
1.076159, 0.0269416, 1.226266, 1, 1, 1, 1, 1,
1.078989, 0.4533251, 0.4895198, 1, 1, 1, 1, 1,
1.082133, -0.5410063, 2.547163, 1, 1, 1, 1, 1,
1.084234, 0.8934594, 1.029486, 1, 1, 1, 1, 1,
1.094686, 0.1525333, -0.09965995, 1, 1, 1, 1, 1,
1.101794, -0.5005032, 1.371717, 1, 1, 1, 1, 1,
1.104723, -0.586238, 3.156884, 1, 1, 1, 1, 1,
1.107147, 1.481692, 1.313982, 1, 1, 1, 1, 1,
1.113695, 0.2337637, 2.167645, 1, 1, 1, 1, 1,
1.121288, -1.126814, 4.575591, 1, 1, 1, 1, 1,
1.122869, -1.013144, 2.447037, 1, 1, 1, 1, 1,
1.123595, 0.540486, 1.615746, 1, 1, 1, 1, 1,
1.124317, -0.1860414, 3.401853, 1, 1, 1, 1, 1,
1.128585, 0.2749096, -0.139896, 1, 1, 1, 1, 1,
1.142219, -0.6261983, 2.074076, 1, 1, 1, 1, 1,
1.143025, 0.00312076, 2.304883, 0, 0, 1, 1, 1,
1.145454, 1.131954, 1.90648, 1, 0, 0, 1, 1,
1.146659, 0.9916381, -0.07302392, 1, 0, 0, 1, 1,
1.147412, 0.5218397, 1.152646, 1, 0, 0, 1, 1,
1.15184, -0.8154899, 1.709161, 1, 0, 0, 1, 1,
1.153294, 1.274153, 0.5784613, 1, 0, 0, 1, 1,
1.159134, -1.297785, 1.913027, 0, 0, 0, 1, 1,
1.160771, 0.4962481, 0.8998951, 0, 0, 0, 1, 1,
1.161452, 1.193458, 1.890497, 0, 0, 0, 1, 1,
1.176979, 0.3793736, 2.517437, 0, 0, 0, 1, 1,
1.177627, 1.000222, -0.05157088, 0, 0, 0, 1, 1,
1.182322, -0.01810923, 2.777831, 0, 0, 0, 1, 1,
1.201348, -0.2712885, 1.035828, 0, 0, 0, 1, 1,
1.202895, 1.133283, 1.057447, 1, 1, 1, 1, 1,
1.205384, 1.345328, 0.4614861, 1, 1, 1, 1, 1,
1.206925, 1.141707, 0.8424224, 1, 1, 1, 1, 1,
1.207904, -0.8735629, 2.392261, 1, 1, 1, 1, 1,
1.208113, 1.052795, 0.4657478, 1, 1, 1, 1, 1,
1.216346, 0.9743629, 1.799916, 1, 1, 1, 1, 1,
1.225526, -0.5666511, 2.098236, 1, 1, 1, 1, 1,
1.236308, 0.5431671, 1.234537, 1, 1, 1, 1, 1,
1.240526, 0.001444265, 2.947309, 1, 1, 1, 1, 1,
1.269807, -0.8405414, 1.826265, 1, 1, 1, 1, 1,
1.27223, 0.7263167, -1.294229, 1, 1, 1, 1, 1,
1.273141, 0.0401479, 1.100135, 1, 1, 1, 1, 1,
1.275075, 0.2981509, 1.877602, 1, 1, 1, 1, 1,
1.27527, 0.3877931, 1.5034, 1, 1, 1, 1, 1,
1.280805, 0.7895919, 1.976145, 1, 1, 1, 1, 1,
1.303773, -0.9854919, 3.313643, 0, 0, 1, 1, 1,
1.305124, -0.381028, 3.083643, 1, 0, 0, 1, 1,
1.314822, 0.7861043, 0.006275482, 1, 0, 0, 1, 1,
1.318604, -0.2737061, 1.610348, 1, 0, 0, 1, 1,
1.320629, 0.2938396, -0.3719362, 1, 0, 0, 1, 1,
1.321995, -0.5322722, 2.400293, 1, 0, 0, 1, 1,
1.332124, -0.5435036, 2.781015, 0, 0, 0, 1, 1,
1.33483, 0.1654574, 0.8970805, 0, 0, 0, 1, 1,
1.338195, 0.8467019, 1.977467, 0, 0, 0, 1, 1,
1.339177, -1.269502, 0.09991653, 0, 0, 0, 1, 1,
1.341794, -0.9556007, 2.813937, 0, 0, 0, 1, 1,
1.348863, -1.222226, 2.776546, 0, 0, 0, 1, 1,
1.356454, 0.4251906, 0.9083076, 0, 0, 0, 1, 1,
1.357993, 0.4149369, 0.8535256, 1, 1, 1, 1, 1,
1.358901, -1.754312, 1.76885, 1, 1, 1, 1, 1,
1.362612, 1.516304, 0.8021482, 1, 1, 1, 1, 1,
1.373036, -0.05749468, 1.202094, 1, 1, 1, 1, 1,
1.387586, -0.5992779, 0.5892917, 1, 1, 1, 1, 1,
1.402463, -1.532147, 2.688537, 1, 1, 1, 1, 1,
1.408139, 0.3371525, 2.454507, 1, 1, 1, 1, 1,
1.415487, 1.378287, 0.2197854, 1, 1, 1, 1, 1,
1.425058, 0.08920845, 2.352658, 1, 1, 1, 1, 1,
1.427748, -0.8575978, 1.644487, 1, 1, 1, 1, 1,
1.429021, 0.09955477, 2.153361, 1, 1, 1, 1, 1,
1.429433, -0.07602925, 1.452252, 1, 1, 1, 1, 1,
1.439177, 0.5408682, -0.3667235, 1, 1, 1, 1, 1,
1.447514, -1.055144, 2.196633, 1, 1, 1, 1, 1,
1.448677, 0.6582343, 1.829898, 1, 1, 1, 1, 1,
1.449507, 0.5463449, 1.031853, 0, 0, 1, 1, 1,
1.455239, -1.196222, 0.8706706, 1, 0, 0, 1, 1,
1.46289, 0.7215989, 0.0598335, 1, 0, 0, 1, 1,
1.470211, -0.9895762, 3.175042, 1, 0, 0, 1, 1,
1.480634, -0.5932221, 1.375551, 1, 0, 0, 1, 1,
1.494912, 0.1640954, 2.053118, 1, 0, 0, 1, 1,
1.505132, -0.6846746, 2.821007, 0, 0, 0, 1, 1,
1.520747, 0.7744589, 2.194327, 0, 0, 0, 1, 1,
1.526636, -0.2975859, -0.2333815, 0, 0, 0, 1, 1,
1.528611, -0.5259662, 2.913189, 0, 0, 0, 1, 1,
1.529253, -0.8536, 3.757494, 0, 0, 0, 1, 1,
1.531013, 1.474905, -0.5299078, 0, 0, 0, 1, 1,
1.535336, -0.6237249, 0.8443798, 0, 0, 0, 1, 1,
1.536775, -0.1077626, 0.6852106, 1, 1, 1, 1, 1,
1.537618, 1.312377, -1.048007, 1, 1, 1, 1, 1,
1.54278, -0.5498225, 2.557135, 1, 1, 1, 1, 1,
1.54303, 2.300642, 0.6785616, 1, 1, 1, 1, 1,
1.552682, -0.3910954, 1.36534, 1, 1, 1, 1, 1,
1.556391, -1.296809, 5.346356, 1, 1, 1, 1, 1,
1.562257, 0.7877547, 1.200249, 1, 1, 1, 1, 1,
1.568423, 1.062551, 2.113201, 1, 1, 1, 1, 1,
1.572587, -0.5380532, 3.165844, 1, 1, 1, 1, 1,
1.572899, -0.1188725, 2.716317, 1, 1, 1, 1, 1,
1.574371, -2.465934, 3.073701, 1, 1, 1, 1, 1,
1.579949, 0.8042501, 1.093704, 1, 1, 1, 1, 1,
1.584875, 1.455915, 0.4510377, 1, 1, 1, 1, 1,
1.603549, -2.005872, 1.542965, 1, 1, 1, 1, 1,
1.614292, 1.586733, 0.4004801, 1, 1, 1, 1, 1,
1.632494, 1.925309, 0.5543155, 0, 0, 1, 1, 1,
1.641602, 0.3209256, 0.4877917, 1, 0, 0, 1, 1,
1.644173, 0.1814332, 2.049094, 1, 0, 0, 1, 1,
1.649572, 0.2857424, 3.844914, 1, 0, 0, 1, 1,
1.652235, 0.1877627, 1.975017, 1, 0, 0, 1, 1,
1.652932, -1.550728, 2.292915, 1, 0, 0, 1, 1,
1.665639, -0.6310195, 0.8990955, 0, 0, 0, 1, 1,
1.673564, 0.6714617, 0.09234308, 0, 0, 0, 1, 1,
1.676335, -1.0924, 0.9111556, 0, 0, 0, 1, 1,
1.69765, 0.7896342, -0.509546, 0, 0, 0, 1, 1,
1.701438, -0.8128741, 3.103785, 0, 0, 0, 1, 1,
1.705155, 0.1476632, 1.901694, 0, 0, 0, 1, 1,
1.746603, 0.9765744, 1.325191, 0, 0, 0, 1, 1,
1.78178, 0.4171743, 0.7197366, 1, 1, 1, 1, 1,
1.788733, 1.294608, 1.779475, 1, 1, 1, 1, 1,
1.811783, 0.2199691, 0.8395356, 1, 1, 1, 1, 1,
1.825432, -0.7766592, 2.911252, 1, 1, 1, 1, 1,
1.830633, -0.5217385, 0.9077767, 1, 1, 1, 1, 1,
1.835993, 0.5170472, 0.17071, 1, 1, 1, 1, 1,
1.848338, 1.125221, 0.4899901, 1, 1, 1, 1, 1,
1.859164, -1.311665, 3.267389, 1, 1, 1, 1, 1,
1.864787, 0.5416157, 0.7086604, 1, 1, 1, 1, 1,
1.883749, -0.8023526, 2.47736, 1, 1, 1, 1, 1,
1.888162, 0.5525901, 0.1359631, 1, 1, 1, 1, 1,
1.890569, 0.4591914, 1.07761, 1, 1, 1, 1, 1,
1.914997, 0.08956566, 3.172329, 1, 1, 1, 1, 1,
1.928449, 2.170424, -0.3959905, 1, 1, 1, 1, 1,
1.936564, 1.406036, 0.06737794, 1, 1, 1, 1, 1,
1.941003, 0.7446819, 1.433676, 0, 0, 1, 1, 1,
1.95815, 0.9716938, 2.345347, 1, 0, 0, 1, 1,
1.994331, 0.1542345, 0.3440262, 1, 0, 0, 1, 1,
2.008361, -1.143167, 1.814922, 1, 0, 0, 1, 1,
2.015262, 0.3816158, 1.540452, 1, 0, 0, 1, 1,
2.072353, 0.5018436, 1.889366, 1, 0, 0, 1, 1,
2.124749, -0.1520257, 2.387561, 0, 0, 0, 1, 1,
2.137216, -0.4160039, 0.7532539, 0, 0, 0, 1, 1,
2.222647, 0.6124746, 0.811501, 0, 0, 0, 1, 1,
2.241227, 0.4713529, 1.252131, 0, 0, 0, 1, 1,
2.26955, 0.5572302, 0.59682, 0, 0, 0, 1, 1,
2.294847, 0.01051101, -0.4676458, 0, 0, 0, 1, 1,
2.302227, -0.2725339, 3.393305, 0, 0, 0, 1, 1,
2.314314, -0.504241, 1.319044, 1, 1, 1, 1, 1,
2.325447, 0.3736459, -0.1583619, 1, 1, 1, 1, 1,
2.427902, -0.3333469, 0.6492968, 1, 1, 1, 1, 1,
2.453253, -0.6128298, 0.1007665, 1, 1, 1, 1, 1,
2.542387, -1.08365, 2.275995, 1, 1, 1, 1, 1,
2.719097, 0.08874692, 3.23277, 1, 1, 1, 1, 1,
2.85249, 1.84948, 1.016868, 1, 1, 1, 1, 1
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
var radius = 9.384437;
var distance = 32.96244;
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
mvMatrix.translate( 0.05822718, 0.4151268, 0.00799036 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.96244);
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
