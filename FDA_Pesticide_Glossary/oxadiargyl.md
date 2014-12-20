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
-3.41168, 2.379877, -0.2811456, 1, 0, 0, 1,
-3.366762, -1.257915, -1.052499, 1, 0.007843138, 0, 1,
-3.047806, -0.3912875, -0.9549085, 1, 0.01176471, 0, 1,
-2.991525, -0.6687176, -0.8404005, 1, 0.01960784, 0, 1,
-2.740345, 0.8508315, -2.362759, 1, 0.02352941, 0, 1,
-2.506024, 2.09939, -0.8024185, 1, 0.03137255, 0, 1,
-2.50445, -0.3830787, -3.464711, 1, 0.03529412, 0, 1,
-2.470846, 0.8214614, -2.854843, 1, 0.04313726, 0, 1,
-2.460996, 1.353099, -1.582292, 1, 0.04705882, 0, 1,
-2.397525, -0.2777943, -2.615437, 1, 0.05490196, 0, 1,
-2.302249, 0.6565803, 0.3906336, 1, 0.05882353, 0, 1,
-2.29805, 0.8946059, -1.47649, 1, 0.06666667, 0, 1,
-2.296381, 0.7167283, -2.747637, 1, 0.07058824, 0, 1,
-2.266877, 0.7786931, -1.188953, 1, 0.07843138, 0, 1,
-2.236714, 0.1409416, -2.457083, 1, 0.08235294, 0, 1,
-2.217968, -1.029844, -0.2952114, 1, 0.09019608, 0, 1,
-2.201036, 0.06533041, -3.294507, 1, 0.09411765, 0, 1,
-2.170789, 0.5057636, -0.8780233, 1, 0.1019608, 0, 1,
-2.163374, 0.3484037, -2.260279, 1, 0.1098039, 0, 1,
-2.14598, -1.049472, -1.697025, 1, 0.1137255, 0, 1,
-2.115104, 1.265043, -0.5540442, 1, 0.1215686, 0, 1,
-2.077051, -2.369357, -2.42515, 1, 0.1254902, 0, 1,
-2.073978, -1.013295, -2.820278, 1, 0.1333333, 0, 1,
-2.045516, -1.969213, -1.185656, 1, 0.1372549, 0, 1,
-2.042507, -1.084644, -1.566486, 1, 0.145098, 0, 1,
-2.041286, 0.3340832, -2.723498, 1, 0.1490196, 0, 1,
-1.992818, -0.9579582, -2.181744, 1, 0.1568628, 0, 1,
-1.992728, -0.3662895, -1.84695, 1, 0.1607843, 0, 1,
-1.988929, -0.8059451, -1.428584, 1, 0.1686275, 0, 1,
-1.988436, 0.1542336, -2.287256, 1, 0.172549, 0, 1,
-1.978755, 0.7462968, -1.454555, 1, 0.1803922, 0, 1,
-1.977916, 0.04295194, -1.85462, 1, 0.1843137, 0, 1,
-1.977825, 0.09270249, -3.006324, 1, 0.1921569, 0, 1,
-1.940798, 1.073631, -0.5312723, 1, 0.1960784, 0, 1,
-1.923386, -0.005570694, -1.741966, 1, 0.2039216, 0, 1,
-1.914778, -1.019094, -4.435503, 1, 0.2117647, 0, 1,
-1.900511, -1.777295, -3.920495, 1, 0.2156863, 0, 1,
-1.900001, -1.263073, -0.7128463, 1, 0.2235294, 0, 1,
-1.895167, 0.4746725, -0.8098173, 1, 0.227451, 0, 1,
-1.886591, 0.9631306, -0.4340557, 1, 0.2352941, 0, 1,
-1.884853, 1.143309, -1.186385, 1, 0.2392157, 0, 1,
-1.873124, 0.2961619, -2.657046, 1, 0.2470588, 0, 1,
-1.87242, 0.9203627, -2.40895, 1, 0.2509804, 0, 1,
-1.8675, -0.5467284, -1.687116, 1, 0.2588235, 0, 1,
-1.865932, 0.1637721, -1.021078, 1, 0.2627451, 0, 1,
-1.857572, 0.2223441, -2.253807, 1, 0.2705882, 0, 1,
-1.851646, 0.6794224, -3.307392, 1, 0.2745098, 0, 1,
-1.841868, 0.3908344, -3.990956, 1, 0.282353, 0, 1,
-1.796534, 0.5664271, -1.154726, 1, 0.2862745, 0, 1,
-1.7844, -2.960138, -3.114537, 1, 0.2941177, 0, 1,
-1.776652, -0.4630777, -2.211976, 1, 0.3019608, 0, 1,
-1.767469, 0.1177261, -2.243952, 1, 0.3058824, 0, 1,
-1.7572, -1.867963, -1.241365, 1, 0.3137255, 0, 1,
-1.737583, -0.5895388, -2.162184, 1, 0.3176471, 0, 1,
-1.712765, 1.367057, -1.553238, 1, 0.3254902, 0, 1,
-1.712756, 0.949742, -1.176368, 1, 0.3294118, 0, 1,
-1.712213, -1.265079, -2.260974, 1, 0.3372549, 0, 1,
-1.711239, -0.9997911, -3.579883, 1, 0.3411765, 0, 1,
-1.701734, 0.4497373, -2.399659, 1, 0.3490196, 0, 1,
-1.700421, -2.497489, -0.7674507, 1, 0.3529412, 0, 1,
-1.692725, -2.501425, -0.8034256, 1, 0.3607843, 0, 1,
-1.684411, 1.221646, -0.9806466, 1, 0.3647059, 0, 1,
-1.683975, -0.1389305, -1.72948, 1, 0.372549, 0, 1,
-1.668749, 0.5942492, -0.2661443, 1, 0.3764706, 0, 1,
-1.666817, -1.620303, -1.417842, 1, 0.3843137, 0, 1,
-1.634585, 0.6612511, -3.062301, 1, 0.3882353, 0, 1,
-1.631451, 0.5271806, 0.9589318, 1, 0.3960784, 0, 1,
-1.615019, -0.003800336, -0.8380545, 1, 0.4039216, 0, 1,
-1.599651, -1.271158, -1.712096, 1, 0.4078431, 0, 1,
-1.585051, -0.3272714, -1.57972, 1, 0.4156863, 0, 1,
-1.561869, -1.138316, -2.678122, 1, 0.4196078, 0, 1,
-1.561458, 0.1943558, -2.449541, 1, 0.427451, 0, 1,
-1.558208, 0.1797017, -1.286813, 1, 0.4313726, 0, 1,
-1.550367, 0.6787329, -0.9870361, 1, 0.4392157, 0, 1,
-1.530636, -0.2119487, -0.8370881, 1, 0.4431373, 0, 1,
-1.52476, -0.1977084, -2.682227, 1, 0.4509804, 0, 1,
-1.51618, -0.1226245, -1.803686, 1, 0.454902, 0, 1,
-1.516114, -1.164187, 0.8005535, 1, 0.4627451, 0, 1,
-1.506014, 0.2414481, -1.884556, 1, 0.4666667, 0, 1,
-1.49146, -0.9738207, -2.214321, 1, 0.4745098, 0, 1,
-1.485281, -0.4802745, -1.888644, 1, 0.4784314, 0, 1,
-1.485093, -1.678404, -3.626901, 1, 0.4862745, 0, 1,
-1.474628, -0.8831015, -1.774718, 1, 0.4901961, 0, 1,
-1.453956, 0.2849919, -1.69692, 1, 0.4980392, 0, 1,
-1.453315, -3.233794, -3.697267, 1, 0.5058824, 0, 1,
-1.442495, -1.184746, -3.846107, 1, 0.509804, 0, 1,
-1.430737, 0.3014632, -0.7594089, 1, 0.5176471, 0, 1,
-1.418978, 1.948489, -0.9153945, 1, 0.5215687, 0, 1,
-1.416968, 0.454596, -2.024844, 1, 0.5294118, 0, 1,
-1.416252, -0.7478582, -2.339541, 1, 0.5333334, 0, 1,
-1.404044, -0.5277224, -1.124869, 1, 0.5411765, 0, 1,
-1.395498, 1.393127, -0.2834987, 1, 0.5450981, 0, 1,
-1.393093, -0.5415151, -0.4863382, 1, 0.5529412, 0, 1,
-1.37244, 0.9212244, -2.735811, 1, 0.5568628, 0, 1,
-1.36787, 0.2844483, -0.3390697, 1, 0.5647059, 0, 1,
-1.364816, -2.498079, -2.585395, 1, 0.5686275, 0, 1,
-1.35723, -1.088388, -2.367798, 1, 0.5764706, 0, 1,
-1.347327, -2.080377, -3.953543, 1, 0.5803922, 0, 1,
-1.344353, 2.659335, -0.6289826, 1, 0.5882353, 0, 1,
-1.329365, -0.762632, -2.532495, 1, 0.5921569, 0, 1,
-1.318561, 0.5264362, -1.979479, 1, 0.6, 0, 1,
-1.309087, 0.6483033, -1.072487, 1, 0.6078432, 0, 1,
-1.30108, 1.301954, -0.2658054, 1, 0.6117647, 0, 1,
-1.301053, 0.6363645, -1.427469, 1, 0.6196079, 0, 1,
-1.296689, 0.5446854, -2.687267, 1, 0.6235294, 0, 1,
-1.288908, 0.6303056, -1.819031, 1, 0.6313726, 0, 1,
-1.288447, -1.266992, -0.5663868, 1, 0.6352941, 0, 1,
-1.281899, -1.614194, -1.128019, 1, 0.6431373, 0, 1,
-1.280951, 0.9911335, -0.7245015, 1, 0.6470588, 0, 1,
-1.276302, -0.1441859, -1.443874, 1, 0.654902, 0, 1,
-1.270566, 0.1992896, -1.541857, 1, 0.6588235, 0, 1,
-1.266221, 0.1032793, -0.1990582, 1, 0.6666667, 0, 1,
-1.264208, -1.369969, -2.758031, 1, 0.6705883, 0, 1,
-1.262656, 1.853674, 0.09403791, 1, 0.6784314, 0, 1,
-1.256893, -0.807399, -1.964904, 1, 0.682353, 0, 1,
-1.256329, 0.8382531, -0.3558136, 1, 0.6901961, 0, 1,
-1.230892, 1.145833, 0.2531383, 1, 0.6941177, 0, 1,
-1.229223, 0.9188428, -1.100706, 1, 0.7019608, 0, 1,
-1.226754, -0.02591923, -2.261789, 1, 0.7098039, 0, 1,
-1.224454, 1.145292, -2.180237, 1, 0.7137255, 0, 1,
-1.207975, 0.4113862, -2.438247, 1, 0.7215686, 0, 1,
-1.19554, -1.779682, -4.225608, 1, 0.7254902, 0, 1,
-1.189785, 0.02195688, -1.378736, 1, 0.7333333, 0, 1,
-1.183315, 0.2901286, -1.765268, 1, 0.7372549, 0, 1,
-1.183122, -0.8226439, -2.929089, 1, 0.7450981, 0, 1,
-1.171945, 0.1740484, -3.158226, 1, 0.7490196, 0, 1,
-1.166872, -0.05245785, -0.5175575, 1, 0.7568628, 0, 1,
-1.166458, -0.3591225, -1.33223, 1, 0.7607843, 0, 1,
-1.160396, -0.7533356, -2.608271, 1, 0.7686275, 0, 1,
-1.157052, -0.4357784, -1.062567, 1, 0.772549, 0, 1,
-1.153744, 0.05934652, -1.545307, 1, 0.7803922, 0, 1,
-1.14689, -0.73202, -3.030984, 1, 0.7843137, 0, 1,
-1.143717, 0.4480919, -0.8897147, 1, 0.7921569, 0, 1,
-1.135599, 1.468313, 0.8123909, 1, 0.7960784, 0, 1,
-1.130734, 1.101022, -1.626443, 1, 0.8039216, 0, 1,
-1.126108, 0.4211849, -1.259669, 1, 0.8117647, 0, 1,
-1.107873, -1.38119, -1.667386, 1, 0.8156863, 0, 1,
-1.100014, 0.4015959, -0.9276742, 1, 0.8235294, 0, 1,
-1.093832, 0.6069357, -1.10549, 1, 0.827451, 0, 1,
-1.092058, 0.1381631, -1.722353, 1, 0.8352941, 0, 1,
-1.091197, 0.7113499, -2.012112, 1, 0.8392157, 0, 1,
-1.084838, 0.5814185, -2.814394, 1, 0.8470588, 0, 1,
-1.073977, -1.098731, -1.246664, 1, 0.8509804, 0, 1,
-1.072902, 0.8315414, 0.7981159, 1, 0.8588235, 0, 1,
-1.064995, -0.2001228, -0.3028405, 1, 0.8627451, 0, 1,
-1.062586, 0.6774148, -2.505945, 1, 0.8705882, 0, 1,
-1.060649, 0.8194225, -0.8711268, 1, 0.8745098, 0, 1,
-1.060577, -1.254768, -2.90828, 1, 0.8823529, 0, 1,
-1.059228, -1.37963, -1.911435, 1, 0.8862745, 0, 1,
-1.055047, 0.377443, -1.756958, 1, 0.8941177, 0, 1,
-1.054337, -1.017405, -2.471623, 1, 0.8980392, 0, 1,
-1.051743, 0.3378339, -1.614604, 1, 0.9058824, 0, 1,
-1.047335, -0.3254303, -2.472636, 1, 0.9137255, 0, 1,
-1.039543, 0.3584931, 0.09676789, 1, 0.9176471, 0, 1,
-1.026067, -2.291575, -3.567159, 1, 0.9254902, 0, 1,
-1.023704, -0.03628973, -1.704032, 1, 0.9294118, 0, 1,
-1.022227, 0.4885028, -2.658221, 1, 0.9372549, 0, 1,
-1.021484, -0.07312761, -3.797875, 1, 0.9411765, 0, 1,
-1.021081, -8.43827e-05, -2.885396, 1, 0.9490196, 0, 1,
-1.018384, -0.3533497, -2.720907, 1, 0.9529412, 0, 1,
-1.007264, -0.2618828, -2.970785, 1, 0.9607843, 0, 1,
-1.005356, -0.8838919, -2.401386, 1, 0.9647059, 0, 1,
-1.003427, 0.04237171, -0.7267933, 1, 0.972549, 0, 1,
-0.9949613, -0.8006997, -1.446143, 1, 0.9764706, 0, 1,
-0.990804, 0.9294292, -2.108526, 1, 0.9843137, 0, 1,
-0.9894117, -2.047265, -4.014547, 1, 0.9882353, 0, 1,
-0.9853993, 0.6424825, -1.391871, 1, 0.9960784, 0, 1,
-0.9822975, 1.097242, -1.408579, 0.9960784, 1, 0, 1,
-0.9822693, 2.464776, -0.9773299, 0.9921569, 1, 0, 1,
-0.9788461, -0.1019654, -0.7483554, 0.9843137, 1, 0, 1,
-0.9769846, 0.1138642, -1.306861, 0.9803922, 1, 0, 1,
-0.9684759, -0.5938078, -2.250646, 0.972549, 1, 0, 1,
-0.9535507, 1.427331, -2.229828, 0.9686275, 1, 0, 1,
-0.9514018, -0.7080593, -2.208607, 0.9607843, 1, 0, 1,
-0.951099, -1.845236, -2.504734, 0.9568627, 1, 0, 1,
-0.9508922, -0.6542753, -1.987452, 0.9490196, 1, 0, 1,
-0.9503667, -0.3162534, -1.713714, 0.945098, 1, 0, 1,
-0.9449456, -0.01984938, -0.4599629, 0.9372549, 1, 0, 1,
-0.9427004, 0.1226914, -0.3799257, 0.9333333, 1, 0, 1,
-0.9417388, 0.5920504, -0.8979784, 0.9254902, 1, 0, 1,
-0.9374467, -1.575309, -2.81881, 0.9215686, 1, 0, 1,
-0.9366439, 1.445095, -0.7343108, 0.9137255, 1, 0, 1,
-0.9321746, 0.6485976, -1.232363, 0.9098039, 1, 0, 1,
-0.9287558, 0.417453, -1.93562, 0.9019608, 1, 0, 1,
-0.9222879, 0.2398146, 7.480078e-05, 0.8941177, 1, 0, 1,
-0.9178311, -0.4638574, -2.307637, 0.8901961, 1, 0, 1,
-0.9166868, 1.350532, 0.01597862, 0.8823529, 1, 0, 1,
-0.9150894, 1.69162, -0.8833105, 0.8784314, 1, 0, 1,
-0.9062461, -0.7402464, -2.230549, 0.8705882, 1, 0, 1,
-0.8915978, 0.1764081, -1.05304, 0.8666667, 1, 0, 1,
-0.8897596, 1.138767, 0.476862, 0.8588235, 1, 0, 1,
-0.8892636, 0.1866784, -1.127817, 0.854902, 1, 0, 1,
-0.8842157, 0.6978579, -0.954506, 0.8470588, 1, 0, 1,
-0.8810533, -0.05243731, -1.266849, 0.8431373, 1, 0, 1,
-0.8809989, -0.906904, -3.050254, 0.8352941, 1, 0, 1,
-0.8727137, 0.5902681, -0.5802738, 0.8313726, 1, 0, 1,
-0.870141, -0.1747561, -2.92553, 0.8235294, 1, 0, 1,
-0.8684365, 1.487867, -0.09362015, 0.8196079, 1, 0, 1,
-0.8681949, -0.1327887, -3.513058, 0.8117647, 1, 0, 1,
-0.8623427, 0.1391611, -0.4271937, 0.8078431, 1, 0, 1,
-0.8616344, -1.945401, -3.732654, 0.8, 1, 0, 1,
-0.8595399, -0.5376607, -1.924245, 0.7921569, 1, 0, 1,
-0.8587326, -0.01553267, -1.736079, 0.7882353, 1, 0, 1,
-0.8563618, 1.110123, -1.099502, 0.7803922, 1, 0, 1,
-0.8549516, -0.1326874, -2.076268, 0.7764706, 1, 0, 1,
-0.8525752, 0.2163567, -1.915212, 0.7686275, 1, 0, 1,
-0.847358, -0.8612856, -2.098909, 0.7647059, 1, 0, 1,
-0.844569, 0.6473907, -1.411149, 0.7568628, 1, 0, 1,
-0.8432624, -1.050272, -0.4331964, 0.7529412, 1, 0, 1,
-0.838011, 0.5747817, -0.3867359, 0.7450981, 1, 0, 1,
-0.8340019, 1.226491, -1.629223, 0.7411765, 1, 0, 1,
-0.8221668, 1.055632, 0.2487748, 0.7333333, 1, 0, 1,
-0.812773, 1.295496, -0.2991307, 0.7294118, 1, 0, 1,
-0.8116615, -0.08032896, -0.4461908, 0.7215686, 1, 0, 1,
-0.8061157, -2.48, -2.409261, 0.7176471, 1, 0, 1,
-0.7958992, 0.5998183, -0.6218218, 0.7098039, 1, 0, 1,
-0.7946051, -0.8651261, -2.577448, 0.7058824, 1, 0, 1,
-0.7926604, -0.7920344, -1.74418, 0.6980392, 1, 0, 1,
-0.7923212, -0.4850731, -2.613605, 0.6901961, 1, 0, 1,
-0.7905288, 0.8883506, -1.037581, 0.6862745, 1, 0, 1,
-0.7901993, -0.7682968, -3.029403, 0.6784314, 1, 0, 1,
-0.7901082, 0.7501763, 0.2334045, 0.6745098, 1, 0, 1,
-0.7871068, -2.061294, -4.162263, 0.6666667, 1, 0, 1,
-0.785684, 0.5359257, -2.134166, 0.6627451, 1, 0, 1,
-0.784986, -1.220391, -2.461888, 0.654902, 1, 0, 1,
-0.7793216, -1.853344, -2.972085, 0.6509804, 1, 0, 1,
-0.7765034, -0.574226, -0.4182385, 0.6431373, 1, 0, 1,
-0.7755172, -1.662013, -3.633364, 0.6392157, 1, 0, 1,
-0.7713521, 0.08058351, -0.789675, 0.6313726, 1, 0, 1,
-0.767494, -0.102333, -2.010292, 0.627451, 1, 0, 1,
-0.7586363, 0.005933391, -1.926504, 0.6196079, 1, 0, 1,
-0.7578397, 1.538856, -0.0678763, 0.6156863, 1, 0, 1,
-0.7550851, -1.124153, -0.5424617, 0.6078432, 1, 0, 1,
-0.7456219, -0.6123637, -2.965111, 0.6039216, 1, 0, 1,
-0.745612, -0.08065861, -0.6864456, 0.5960785, 1, 0, 1,
-0.7426601, 0.8811647, 0.4005357, 0.5882353, 1, 0, 1,
-0.7419437, 0.03858031, -1.113368, 0.5843138, 1, 0, 1,
-0.7411383, -0.8584659, -3.539457, 0.5764706, 1, 0, 1,
-0.735375, 1.364808, -0.3815865, 0.572549, 1, 0, 1,
-0.7344514, 1.609994, -0.4447423, 0.5647059, 1, 0, 1,
-0.7331855, -0.1716178, -0.30863, 0.5607843, 1, 0, 1,
-0.7318379, 0.4039634, -0.9845785, 0.5529412, 1, 0, 1,
-0.7291742, -1.357164, -3.596326, 0.5490196, 1, 0, 1,
-0.7222965, -0.9434335, -1.459424, 0.5411765, 1, 0, 1,
-0.7218548, 0.5008769, -0.8285572, 0.5372549, 1, 0, 1,
-0.7163503, 1.177965, -1.03662, 0.5294118, 1, 0, 1,
-0.7092265, 2.589411, -0.2023632, 0.5254902, 1, 0, 1,
-0.7024204, 0.03759327, -3.12188, 0.5176471, 1, 0, 1,
-0.7016426, 1.47008, 0.1926298, 0.5137255, 1, 0, 1,
-0.7010694, 1.076657, -1.622179, 0.5058824, 1, 0, 1,
-0.6978572, 0.5478065, -1.044619, 0.5019608, 1, 0, 1,
-0.6951383, -0.9975711, -3.794007, 0.4941176, 1, 0, 1,
-0.6932656, -0.1125507, -1.347003, 0.4862745, 1, 0, 1,
-0.6861787, -1.293401, -2.941724, 0.4823529, 1, 0, 1,
-0.6802982, -1.256744, -1.52216, 0.4745098, 1, 0, 1,
-0.6792388, -0.2984037, -2.683711, 0.4705882, 1, 0, 1,
-0.6777908, -0.1886373, -2.710148, 0.4627451, 1, 0, 1,
-0.6756036, -0.6067629, -2.3802, 0.4588235, 1, 0, 1,
-0.6749532, -0.2977223, -3.113521, 0.4509804, 1, 0, 1,
-0.6735821, 1.880478, 0.1597979, 0.4470588, 1, 0, 1,
-0.6725425, -0.6110092, -2.40226, 0.4392157, 1, 0, 1,
-0.6690013, -0.0436675, -1.918293, 0.4352941, 1, 0, 1,
-0.6689224, 0.0347084, -0.3124361, 0.427451, 1, 0, 1,
-0.6669484, -0.06522194, -1.592165, 0.4235294, 1, 0, 1,
-0.6665838, -1.883911, -2.510896, 0.4156863, 1, 0, 1,
-0.6664302, 1.849404, -0.22293, 0.4117647, 1, 0, 1,
-0.6658877, -0.9003068, -2.844472, 0.4039216, 1, 0, 1,
-0.6615034, 0.03050601, -1.912766, 0.3960784, 1, 0, 1,
-0.6611993, -0.8146372, -1.967393, 0.3921569, 1, 0, 1,
-0.6601459, 2.501795, 0.2158851, 0.3843137, 1, 0, 1,
-0.6506755, 0.7648233, -0.4709664, 0.3803922, 1, 0, 1,
-0.6484727, -2.033108, -1.624215, 0.372549, 1, 0, 1,
-0.6396022, 0.3530093, 0.6341297, 0.3686275, 1, 0, 1,
-0.6383651, -0.4412597, -2.557833, 0.3607843, 1, 0, 1,
-0.635316, 0.3524683, 0.243697, 0.3568628, 1, 0, 1,
-0.6333317, 0.8264229, -0.3672087, 0.3490196, 1, 0, 1,
-0.6327938, -0.8679904, -4.199914, 0.345098, 1, 0, 1,
-0.63226, 0.4006052, 0.4409702, 0.3372549, 1, 0, 1,
-0.630907, 0.9188156, 1.132927, 0.3333333, 1, 0, 1,
-0.6308222, 0.3565833, -2.009753, 0.3254902, 1, 0, 1,
-0.6276419, 0.7374198, -0.1731581, 0.3215686, 1, 0, 1,
-0.627127, -1.37047, -3.14227, 0.3137255, 1, 0, 1,
-0.6250018, 0.00576774, -0.8120851, 0.3098039, 1, 0, 1,
-0.6240157, -2.895398, -3.940322, 0.3019608, 1, 0, 1,
-0.6185215, -0.06261115, -2.075952, 0.2941177, 1, 0, 1,
-0.6161373, -0.6152551, -0.843594, 0.2901961, 1, 0, 1,
-0.6132079, 1.203013, 0.2193194, 0.282353, 1, 0, 1,
-0.6033342, 1.242898, 0.9176391, 0.2784314, 1, 0, 1,
-0.602492, -0.7353086, -1.296588, 0.2705882, 1, 0, 1,
-0.5969427, -0.8344883, -2.484908, 0.2666667, 1, 0, 1,
-0.5968567, -0.8697824, -3.276148, 0.2588235, 1, 0, 1,
-0.5948387, -0.3604142, -1.192213, 0.254902, 1, 0, 1,
-0.5938525, 0.5216087, -1.136481, 0.2470588, 1, 0, 1,
-0.5904405, -0.3960372, -2.193145, 0.2431373, 1, 0, 1,
-0.5844836, -0.06199863, -0.9869871, 0.2352941, 1, 0, 1,
-0.5790445, 0.9286367, -0.3084955, 0.2313726, 1, 0, 1,
-0.5783505, 1.439087, 0.7877393, 0.2235294, 1, 0, 1,
-0.5762831, 0.9905362, 0.7501284, 0.2196078, 1, 0, 1,
-0.5753331, 0.5770451, -0.9693353, 0.2117647, 1, 0, 1,
-0.5723364, 0.8431716, -0.8545258, 0.2078431, 1, 0, 1,
-0.5600236, -1.01832, -3.475312, 0.2, 1, 0, 1,
-0.5598571, -0.1581574, -0.8974316, 0.1921569, 1, 0, 1,
-0.5576006, 0.5713062, -1.036034, 0.1882353, 1, 0, 1,
-0.5525461, -0.1927287, -0.8567424, 0.1803922, 1, 0, 1,
-0.5460053, 1.341056, 1.432707, 0.1764706, 1, 0, 1,
-0.5438393, -0.7679276, -2.638502, 0.1686275, 1, 0, 1,
-0.5404917, 0.4611969, 0.9491486, 0.1647059, 1, 0, 1,
-0.5386921, -1.417928, -2.595934, 0.1568628, 1, 0, 1,
-0.534824, -0.7992033, -1.79649, 0.1529412, 1, 0, 1,
-0.5325779, 1.745319, 0.2802402, 0.145098, 1, 0, 1,
-0.5260373, -0.307985, -1.573082, 0.1411765, 1, 0, 1,
-0.5255864, -0.02801552, -0.7745522, 0.1333333, 1, 0, 1,
-0.5248709, -0.02067464, -3.546069, 0.1294118, 1, 0, 1,
-0.5243512, 1.995917, -0.5579283, 0.1215686, 1, 0, 1,
-0.5240693, -0.2294678, -2.259253, 0.1176471, 1, 0, 1,
-0.5213631, -1.172201, -4.184898, 0.1098039, 1, 0, 1,
-0.5188015, -0.7510517, -1.474442, 0.1058824, 1, 0, 1,
-0.5183904, -0.4253605, -3.640272, 0.09803922, 1, 0, 1,
-0.5144934, -0.8480892, -2.290594, 0.09019608, 1, 0, 1,
-0.5110456, -1.361201, -2.94751, 0.08627451, 1, 0, 1,
-0.5013105, -1.05663, -0.2247885, 0.07843138, 1, 0, 1,
-0.4987826, 0.8916956, 0.1283368, 0.07450981, 1, 0, 1,
-0.4971681, 0.4999173, -1.749396, 0.06666667, 1, 0, 1,
-0.4969386, 0.8852068, -0.4530255, 0.0627451, 1, 0, 1,
-0.4930897, -0.8361611, -3.400959, 0.05490196, 1, 0, 1,
-0.4926263, -1.506469, -3.487572, 0.05098039, 1, 0, 1,
-0.4914959, -0.3194007, -3.181653, 0.04313726, 1, 0, 1,
-0.4882703, -0.1002522, -1.054607, 0.03921569, 1, 0, 1,
-0.4865718, -0.1546052, -2.840704, 0.03137255, 1, 0, 1,
-0.4847952, -1.071255, -4.922878, 0.02745098, 1, 0, 1,
-0.4846512, -0.6436539, -4.818933, 0.01960784, 1, 0, 1,
-0.4818739, 0.9111134, -0.5982118, 0.01568628, 1, 0, 1,
-0.4810042, -0.506714, -2.379212, 0.007843138, 1, 0, 1,
-0.4808429, -0.8987861, -1.024011, 0.003921569, 1, 0, 1,
-0.4784499, -0.5116653, -3.624674, 0, 1, 0.003921569, 1,
-0.4758399, 0.3631519, -0.1195221, 0, 1, 0.01176471, 1,
-0.4750355, -0.4374993, -3.519121, 0, 1, 0.01568628, 1,
-0.4740004, 0.3897023, -0.1607008, 0, 1, 0.02352941, 1,
-0.4731167, 0.4398115, -0.1529086, 0, 1, 0.02745098, 1,
-0.4684144, 1.583266, 0.9496024, 0, 1, 0.03529412, 1,
-0.4655658, -1.055376, -3.887806, 0, 1, 0.03921569, 1,
-0.4590537, -0.6694781, -1.899661, 0, 1, 0.04705882, 1,
-0.4577526, 0.302808, -0.5452061, 0, 1, 0.05098039, 1,
-0.4520477, 0.1237437, -2.23919, 0, 1, 0.05882353, 1,
-0.4512212, -1.33182, -4.291166, 0, 1, 0.0627451, 1,
-0.4507172, 0.5705133, -0.8340279, 0, 1, 0.07058824, 1,
-0.4416063, 0.9316837, -0.8780438, 0, 1, 0.07450981, 1,
-0.433152, 0.2236084, 1.569593, 0, 1, 0.08235294, 1,
-0.4259517, -1.522513, -1.012803, 0, 1, 0.08627451, 1,
-0.4152195, -1.396827, -3.312321, 0, 1, 0.09411765, 1,
-0.4147958, -2.569186, -2.733649, 0, 1, 0.1019608, 1,
-0.4137234, 0.7583961, -0.09063654, 0, 1, 0.1058824, 1,
-0.4128988, -1.453912, -3.845458, 0, 1, 0.1137255, 1,
-0.4086012, 1.233486, -0.8768716, 0, 1, 0.1176471, 1,
-0.4017418, 0.3073955, -1.156475, 0, 1, 0.1254902, 1,
-0.4006419, -0.4914313, -2.145662, 0, 1, 0.1294118, 1,
-0.3977169, 0.4100656, -0.03223229, 0, 1, 0.1372549, 1,
-0.3948617, 0.163517, -0.6121184, 0, 1, 0.1411765, 1,
-0.3901579, -0.8147304, -1.146387, 0, 1, 0.1490196, 1,
-0.3890008, 0.06702074, -0.6288698, 0, 1, 0.1529412, 1,
-0.3877991, 0.5286902, -0.2618581, 0, 1, 0.1607843, 1,
-0.3876489, 0.5183867, -1.851625, 0, 1, 0.1647059, 1,
-0.3875221, 0.5611778, -0.7425143, 0, 1, 0.172549, 1,
-0.3867732, -1.50357, -4.620832, 0, 1, 0.1764706, 1,
-0.3796333, -0.3209351, -0.6148191, 0, 1, 0.1843137, 1,
-0.3789442, 1.10086, -1.624573, 0, 1, 0.1882353, 1,
-0.3771919, 1.815272, -0.3907267, 0, 1, 0.1960784, 1,
-0.3764363, 1.028775, -1.201516, 0, 1, 0.2039216, 1,
-0.3719611, -1.323767, -2.251766, 0, 1, 0.2078431, 1,
-0.364135, 0.1211482, -1.610497, 0, 1, 0.2156863, 1,
-0.3607079, -1.289985, -2.08934, 0, 1, 0.2196078, 1,
-0.360619, 1.71969, 1.160082, 0, 1, 0.227451, 1,
-0.3602174, 0.1863864, -1.475603, 0, 1, 0.2313726, 1,
-0.3595572, 0.6124135, -0.7999287, 0, 1, 0.2392157, 1,
-0.3588553, -0.423351, -1.84089, 0, 1, 0.2431373, 1,
-0.3564214, -0.983605, -4.68825, 0, 1, 0.2509804, 1,
-0.3560722, -0.2791457, -2.72584, 0, 1, 0.254902, 1,
-0.3553272, -0.9337667, -3.548934, 0, 1, 0.2627451, 1,
-0.3456999, 1.157692, 1.187239, 0, 1, 0.2666667, 1,
-0.3419163, 0.9976773, -1.37545, 0, 1, 0.2745098, 1,
-0.3264986, -1.609826, -2.924269, 0, 1, 0.2784314, 1,
-0.3232583, -0.2681715, -1.358561, 0, 1, 0.2862745, 1,
-0.3226092, -0.4654185, -1.708667, 0, 1, 0.2901961, 1,
-0.3219237, -0.5821397, -3.017567, 0, 1, 0.2980392, 1,
-0.319635, 0.5314456, -0.2313787, 0, 1, 0.3058824, 1,
-0.3192391, 0.6035061, 1.094666, 0, 1, 0.3098039, 1,
-0.3168996, -1.685201, -2.238051, 0, 1, 0.3176471, 1,
-0.3150057, 1.595752, -0.3021317, 0, 1, 0.3215686, 1,
-0.3145379, -2.798465, -2.805249, 0, 1, 0.3294118, 1,
-0.3127726, 0.8783807, -0.05187921, 0, 1, 0.3333333, 1,
-0.3079425, 0.3042706, -1.040086, 0, 1, 0.3411765, 1,
-0.3078539, 1.424213, 0.2820397, 0, 1, 0.345098, 1,
-0.3070769, 2.605608, 2.145003, 0, 1, 0.3529412, 1,
-0.3068506, 0.1910739, -1.806826, 0, 1, 0.3568628, 1,
-0.3049495, -0.3491766, -3.564203, 0, 1, 0.3647059, 1,
-0.3041147, -1.716039, -2.824934, 0, 1, 0.3686275, 1,
-0.3033975, -2.121372, -2.4235, 0, 1, 0.3764706, 1,
-0.2962927, -0.0408413, -0.4244573, 0, 1, 0.3803922, 1,
-0.295727, -1.890471, -4.36341, 0, 1, 0.3882353, 1,
-0.2952497, -0.8487648, -0.2196048, 0, 1, 0.3921569, 1,
-0.2930643, 0.03740554, -1.707029, 0, 1, 0.4, 1,
-0.2894474, 0.9252577, -0.1991878, 0, 1, 0.4078431, 1,
-0.2888586, 1.453445, -0.3759414, 0, 1, 0.4117647, 1,
-0.2851209, 0.8613047, 0.001650605, 0, 1, 0.4196078, 1,
-0.2834264, 0.8469572, -1.451733, 0, 1, 0.4235294, 1,
-0.2785438, -0.3238074, -3.379013, 0, 1, 0.4313726, 1,
-0.277002, -1.151113, -1.364375, 0, 1, 0.4352941, 1,
-0.2728641, -1.105866, -2.352015, 0, 1, 0.4431373, 1,
-0.2713885, 0.2720315, -1.348607, 0, 1, 0.4470588, 1,
-0.2704891, -1.660273, -2.347049, 0, 1, 0.454902, 1,
-0.2626087, -0.3020217, -4.000322, 0, 1, 0.4588235, 1,
-0.2596234, -0.03459385, -2.575559, 0, 1, 0.4666667, 1,
-0.2502521, -1.16418, -2.310369, 0, 1, 0.4705882, 1,
-0.249045, 1.644285, -0.08375511, 0, 1, 0.4784314, 1,
-0.2484994, -0.5934697, -3.587003, 0, 1, 0.4823529, 1,
-0.248121, -0.1559094, -1.600432, 0, 1, 0.4901961, 1,
-0.2390787, -0.627948, -3.683354, 0, 1, 0.4941176, 1,
-0.2347961, 0.4412151, -0.3226707, 0, 1, 0.5019608, 1,
-0.2257882, 1.442329, 2.276662, 0, 1, 0.509804, 1,
-0.2210101, 4.248621, 0.1748583, 0, 1, 0.5137255, 1,
-0.2186575, -0.6317735, -3.574834, 0, 1, 0.5215687, 1,
-0.2158077, 0.4709879, 0.2571705, 0, 1, 0.5254902, 1,
-0.2148503, 0.3956116, -1.195398, 0, 1, 0.5333334, 1,
-0.2097139, 0.04178944, 0.319437, 0, 1, 0.5372549, 1,
-0.2075635, 0.4958515, -1.224154, 0, 1, 0.5450981, 1,
-0.2065811, -0.9017392, -4.028921, 0, 1, 0.5490196, 1,
-0.2045964, 1.543876, -0.463118, 0, 1, 0.5568628, 1,
-0.2044654, -0.2576603, -1.057005, 0, 1, 0.5607843, 1,
-0.2004259, 0.2954085, -2.168843, 0, 1, 0.5686275, 1,
-0.1994322, 0.2558724, -1.101214, 0, 1, 0.572549, 1,
-0.1968385, 0.314421, -0.04146538, 0, 1, 0.5803922, 1,
-0.190528, -0.6352042, -3.76145, 0, 1, 0.5843138, 1,
-0.1844082, 1.092846, 0.2741914, 0, 1, 0.5921569, 1,
-0.1747111, -0.4926909, -3.862715, 0, 1, 0.5960785, 1,
-0.1733421, -2.274379, -1.897768, 0, 1, 0.6039216, 1,
-0.17069, 0.2381284, -0.4098388, 0, 1, 0.6117647, 1,
-0.1684653, 2.310947, 0.3636302, 0, 1, 0.6156863, 1,
-0.1517309, 0.4765831, 1.468415, 0, 1, 0.6235294, 1,
-0.1515325, 0.9490854, -1.323938, 0, 1, 0.627451, 1,
-0.1503607, 0.4470454, 1.760906, 0, 1, 0.6352941, 1,
-0.1396746, 2.209176, 0.3401968, 0, 1, 0.6392157, 1,
-0.1368884, 0.2094182, -0.06889415, 0, 1, 0.6470588, 1,
-0.1294052, -1.195312, -0.8181959, 0, 1, 0.6509804, 1,
-0.1258251, 0.589722, 0.1234482, 0, 1, 0.6588235, 1,
-0.1231252, -1.581424, -3.552747, 0, 1, 0.6627451, 1,
-0.1192817, 0.602053, 0.009890858, 0, 1, 0.6705883, 1,
-0.1169005, 0.6108944, 0.2717076, 0, 1, 0.6745098, 1,
-0.1150254, 0.1699087, -1.715857, 0, 1, 0.682353, 1,
-0.113165, -1.81902, -3.496578, 0, 1, 0.6862745, 1,
-0.1120532, 1.010235, 0.9766133, 0, 1, 0.6941177, 1,
-0.1111511, 0.2915109, -0.7794828, 0, 1, 0.7019608, 1,
-0.1094333, 0.4923573, -2.160534, 0, 1, 0.7058824, 1,
-0.1070487, -1.184445, -3.12497, 0, 1, 0.7137255, 1,
-0.1063868, 0.2514576, -0.2841378, 0, 1, 0.7176471, 1,
-0.1058325, 1.375153, 0.328701, 0, 1, 0.7254902, 1,
-0.1055368, 0.4612775, 0.3831243, 0, 1, 0.7294118, 1,
-0.1048972, 0.5942952, -1.361085, 0, 1, 0.7372549, 1,
-0.1015432, 0.549318, 0.5114796, 0, 1, 0.7411765, 1,
-0.09773108, 0.2318617, 2.352028, 0, 1, 0.7490196, 1,
-0.09114935, -0.7286665, -2.970806, 0, 1, 0.7529412, 1,
-0.0889665, -0.4593471, -3.418052, 0, 1, 0.7607843, 1,
-0.08505954, 2.029401, -0.167202, 0, 1, 0.7647059, 1,
-0.08361053, -0.9968767, -3.789067, 0, 1, 0.772549, 1,
-0.08209198, 0.3592541, 0.3099309, 0, 1, 0.7764706, 1,
-0.07811673, 0.3246686, -1.370515, 0, 1, 0.7843137, 1,
-0.07678975, -1.280443, -2.472309, 0, 1, 0.7882353, 1,
-0.07618643, -1.911024, -3.80326, 0, 1, 0.7960784, 1,
-0.07188043, 2.960747, -2.313251, 0, 1, 0.8039216, 1,
-0.06663135, -0.3613815, -2.038672, 0, 1, 0.8078431, 1,
-0.06585408, 2.124825, -0.4236258, 0, 1, 0.8156863, 1,
-0.06543133, -0.3451313, -3.69342, 0, 1, 0.8196079, 1,
-0.06335707, -0.03444301, -1.500567, 0, 1, 0.827451, 1,
-0.06074551, 1.83257, 0.753431, 0, 1, 0.8313726, 1,
-0.06032494, 0.6857546, -0.3448696, 0, 1, 0.8392157, 1,
-0.05300397, 1.320403, 0.4903163, 0, 1, 0.8431373, 1,
-0.0508333, -0.1063901, -2.77593, 0, 1, 0.8509804, 1,
-0.04930097, -0.4055138, -3.453293, 0, 1, 0.854902, 1,
-0.04852621, -0.4760534, -3.061137, 0, 1, 0.8627451, 1,
-0.04681828, 1.049613, -0.2299839, 0, 1, 0.8666667, 1,
-0.04591139, 0.1055706, 0.2745965, 0, 1, 0.8745098, 1,
-0.04197723, 0.8124735, 1.678357, 0, 1, 0.8784314, 1,
-0.03650694, 0.1725508, 0.4712658, 0, 1, 0.8862745, 1,
-0.03289903, -0.6061292, -3.648469, 0, 1, 0.8901961, 1,
-0.03238127, -1.179312, -3.345634, 0, 1, 0.8980392, 1,
-0.02919303, 0.6288038, -0.2293432, 0, 1, 0.9058824, 1,
-0.02809125, 0.6526296, -0.4362877, 0, 1, 0.9098039, 1,
-0.02314763, -1.043038, -2.310899, 0, 1, 0.9176471, 1,
-0.01311333, -0.7503747, -3.424256, 0, 1, 0.9215686, 1,
-0.00885124, -1.577883, -3.029287, 0, 1, 0.9294118, 1,
-0.008034662, 1.09703, 1.030401, 0, 1, 0.9333333, 1,
-0.007432464, -0.04126915, -3.478567, 0, 1, 0.9411765, 1,
0.0003665128, -0.4726577, 2.169858, 0, 1, 0.945098, 1,
0.006240495, 1.794605, -2.450607, 0, 1, 0.9529412, 1,
0.0140185, 0.467195, -1.275916, 0, 1, 0.9568627, 1,
0.01508896, 0.651573, 0.5420537, 0, 1, 0.9647059, 1,
0.0155321, 0.1931048, 1.432713, 0, 1, 0.9686275, 1,
0.01747868, 0.9144676, 1.036246, 0, 1, 0.9764706, 1,
0.02040014, -0.5644016, 1.801532, 0, 1, 0.9803922, 1,
0.0250944, 0.112698, -0.6187487, 0, 1, 0.9882353, 1,
0.02872738, 0.7209412, 0.1366577, 0, 1, 0.9921569, 1,
0.03175255, 2.293385, 0.5810371, 0, 1, 1, 1,
0.03407505, 0.4451941, -0.887863, 0, 0.9921569, 1, 1,
0.03970314, -0.1257997, 2.920967, 0, 0.9882353, 1, 1,
0.03984668, -0.3705791, 3.752344, 0, 0.9803922, 1, 1,
0.0417261, -0.3252711, 4.378136, 0, 0.9764706, 1, 1,
0.04260165, -0.804539, 2.87716, 0, 0.9686275, 1, 1,
0.04500498, 0.43518, -1.187066, 0, 0.9647059, 1, 1,
0.04577016, -0.2327035, 2.204455, 0, 0.9568627, 1, 1,
0.04919696, 0.7120529, -0.5182568, 0, 0.9529412, 1, 1,
0.05469705, 0.845596, 0.3145522, 0, 0.945098, 1, 1,
0.05493135, -0.151939, 2.681257, 0, 0.9411765, 1, 1,
0.05652229, -0.6222557, 1.177656, 0, 0.9333333, 1, 1,
0.05759996, -0.04597862, 3.250796, 0, 0.9294118, 1, 1,
0.05846493, -0.4287953, 2.921013, 0, 0.9215686, 1, 1,
0.05963393, 1.865622, 0.5432245, 0, 0.9176471, 1, 1,
0.06637487, 2.297942, -0.08419973, 0, 0.9098039, 1, 1,
0.08272783, -0.06442986, 2.956304, 0, 0.9058824, 1, 1,
0.08466608, -0.3254092, 3.455466, 0, 0.8980392, 1, 1,
0.0870618, -1.598052, 4.101432, 0, 0.8901961, 1, 1,
0.09153242, -1.129204, 3.122023, 0, 0.8862745, 1, 1,
0.09315898, -0.2187323, 1.710047, 0, 0.8784314, 1, 1,
0.1016587, 1.175938, -0.6407451, 0, 0.8745098, 1, 1,
0.110188, 0.4444683, -0.5014804, 0, 0.8666667, 1, 1,
0.1149746, 0.6963208, -0.2270867, 0, 0.8627451, 1, 1,
0.1155797, -2.6656, 2.075589, 0, 0.854902, 1, 1,
0.1164856, -0.2362638, 2.527206, 0, 0.8509804, 1, 1,
0.12153, 0.5945646, 0.4905096, 0, 0.8431373, 1, 1,
0.1220646, -0.9064262, 4.440624, 0, 0.8392157, 1, 1,
0.1285972, 1.725478, 1.72687, 0, 0.8313726, 1, 1,
0.1291593, 0.09528695, 0.01007179, 0, 0.827451, 1, 1,
0.1302564, -0.2480463, 2.429484, 0, 0.8196079, 1, 1,
0.132162, -1.224454, 2.826838, 0, 0.8156863, 1, 1,
0.1367858, 1.173144, -0.7671527, 0, 0.8078431, 1, 1,
0.1381612, -1.426924, 3.216742, 0, 0.8039216, 1, 1,
0.141266, -2.016217, 3.621546, 0, 0.7960784, 1, 1,
0.1472602, 0.1071046, 0.2249404, 0, 0.7882353, 1, 1,
0.1489798, 0.3354571, 0.6618748, 0, 0.7843137, 1, 1,
0.1491549, 1.847811, 1.000911, 0, 0.7764706, 1, 1,
0.1548552, 2.083408, -0.3158038, 0, 0.772549, 1, 1,
0.1560687, -1.158443, 2.939398, 0, 0.7647059, 1, 1,
0.1561562, -1.789485, 2.756517, 0, 0.7607843, 1, 1,
0.1583612, -0.2176282, 2.224899, 0, 0.7529412, 1, 1,
0.1622011, 1.6831, 1.887292, 0, 0.7490196, 1, 1,
0.1635985, 0.09317328, 0.6556674, 0, 0.7411765, 1, 1,
0.1639229, -0.82761, 3.216408, 0, 0.7372549, 1, 1,
0.164423, -1.044603, 2.671409, 0, 0.7294118, 1, 1,
0.1662619, -0.7678064, 2.241494, 0, 0.7254902, 1, 1,
0.1663375, 0.2365119, 0.3420559, 0, 0.7176471, 1, 1,
0.1683108, 1.308883, 2.811936e-05, 0, 0.7137255, 1, 1,
0.1694967, 0.347214, -0.5489799, 0, 0.7058824, 1, 1,
0.170937, 0.3460998, 1.124462, 0, 0.6980392, 1, 1,
0.1782547, -0.697955, 2.489898, 0, 0.6941177, 1, 1,
0.1786143, -1.023845, 1.379048, 0, 0.6862745, 1, 1,
0.1790134, -0.7322831, 1.729609, 0, 0.682353, 1, 1,
0.1793556, 0.05786068, 0.8794987, 0, 0.6745098, 1, 1,
0.1806307, 3.461252, 0.1700311, 0, 0.6705883, 1, 1,
0.187062, 0.1279145, 1.710155, 0, 0.6627451, 1, 1,
0.1871513, -0.3145655, 2.352255, 0, 0.6588235, 1, 1,
0.1881768, 0.9987226, 0.165092, 0, 0.6509804, 1, 1,
0.191834, -1.400097, 3.064846, 0, 0.6470588, 1, 1,
0.1925935, 0.3508457, 0.4474781, 0, 0.6392157, 1, 1,
0.1928842, -0.2989687, 2.907966, 0, 0.6352941, 1, 1,
0.1939125, 0.8197783, 0.1206411, 0, 0.627451, 1, 1,
0.1955566, 0.5154694, 1.175148, 0, 0.6235294, 1, 1,
0.1972802, -0.5229672, 1.102791, 0, 0.6156863, 1, 1,
0.1977348, -1.211904, 2.949916, 0, 0.6117647, 1, 1,
0.1985892, -1.508735, 0.831997, 0, 0.6039216, 1, 1,
0.2025291, -0.6261986, 2.820718, 0, 0.5960785, 1, 1,
0.2035542, 1.587494, 1.148875, 0, 0.5921569, 1, 1,
0.203678, 0.4089774, 0.3583397, 0, 0.5843138, 1, 1,
0.2100748, 1.314894, -1.730111, 0, 0.5803922, 1, 1,
0.2127128, 0.02834941, 0.7369277, 0, 0.572549, 1, 1,
0.2162157, -0.06820095, 1.122872, 0, 0.5686275, 1, 1,
0.218254, -0.1608743, 3.590302, 0, 0.5607843, 1, 1,
0.2188195, 0.5228706, 0.3155029, 0, 0.5568628, 1, 1,
0.2189084, 0.5193715, -1.043085, 0, 0.5490196, 1, 1,
0.2209418, -0.07080524, 2.536057, 0, 0.5450981, 1, 1,
0.2237731, -0.442681, 3.098959, 0, 0.5372549, 1, 1,
0.2238823, -0.4690955, 2.748904, 0, 0.5333334, 1, 1,
0.2258253, -0.9815996, 2.381525, 0, 0.5254902, 1, 1,
0.2270887, 0.5710071, -0.2568171, 0, 0.5215687, 1, 1,
0.2271721, -0.491115, 2.948088, 0, 0.5137255, 1, 1,
0.2302769, -1.786556, 3.166332, 0, 0.509804, 1, 1,
0.2307843, -0.3652269, 3.537651, 0, 0.5019608, 1, 1,
0.2330796, 1.140243, -0.09713495, 0, 0.4941176, 1, 1,
0.2333105, 0.5861951, -0.1044211, 0, 0.4901961, 1, 1,
0.2350061, 1.11436, 0.146841, 0, 0.4823529, 1, 1,
0.2400271, -0.5301687, 1.165175, 0, 0.4784314, 1, 1,
0.2405492, 0.1024986, 1.308065, 0, 0.4705882, 1, 1,
0.2415015, -0.6806009, 5.457767, 0, 0.4666667, 1, 1,
0.2417802, -0.3575195, 2.002369, 0, 0.4588235, 1, 1,
0.2435473, 0.4505617, 1.091563, 0, 0.454902, 1, 1,
0.2468067, 0.06021482, 3.156964, 0, 0.4470588, 1, 1,
0.2529435, 0.2341969, 1.711078, 0, 0.4431373, 1, 1,
0.255121, 1.351251, 0.5288646, 0, 0.4352941, 1, 1,
0.2595496, -0.4672259, 3.464151, 0, 0.4313726, 1, 1,
0.2629253, -0.3017471, 1.201388, 0, 0.4235294, 1, 1,
0.2635914, 0.2061542, -0.1958379, 0, 0.4196078, 1, 1,
0.2671904, -0.1400992, 3.498502, 0, 0.4117647, 1, 1,
0.2695224, -0.04617785, 1.951364, 0, 0.4078431, 1, 1,
0.271863, -1.412011, 2.821692, 0, 0.4, 1, 1,
0.2720622, 0.02560837, 1.711122, 0, 0.3921569, 1, 1,
0.2723017, -1.81105, 1.982866, 0, 0.3882353, 1, 1,
0.2726906, -0.1706893, 2.724766, 0, 0.3803922, 1, 1,
0.2727596, -0.7330568, 2.004987, 0, 0.3764706, 1, 1,
0.2751635, -0.1916927, 4.174163, 0, 0.3686275, 1, 1,
0.278034, -0.04884869, 0.719772, 0, 0.3647059, 1, 1,
0.2789411, -0.390773, 4.453602, 0, 0.3568628, 1, 1,
0.2797604, -0.4083499, 1.72262, 0, 0.3529412, 1, 1,
0.2854302, 0.6870871, 1.031624, 0, 0.345098, 1, 1,
0.2878246, -1.830136, 2.286409, 0, 0.3411765, 1, 1,
0.2888819, -0.9311479, 4.123783, 0, 0.3333333, 1, 1,
0.2903973, 0.7105153, 0.2173528, 0, 0.3294118, 1, 1,
0.2961257, 0.713914, 2.421694, 0, 0.3215686, 1, 1,
0.3006313, 0.5349334, 0.7623401, 0, 0.3176471, 1, 1,
0.3054139, -0.6860854, 1.64501, 0, 0.3098039, 1, 1,
0.306683, 1.828602, -0.8368431, 0, 0.3058824, 1, 1,
0.3102962, -0.6676635, 4.27317, 0, 0.2980392, 1, 1,
0.3109018, -0.5216876, 3.307303, 0, 0.2901961, 1, 1,
0.3116079, 0.7430317, 0.7422684, 0, 0.2862745, 1, 1,
0.3178944, 1.121294, -0.6060302, 0, 0.2784314, 1, 1,
0.3184567, -1.101411, 2.213388, 0, 0.2745098, 1, 1,
0.3200963, -1.254887, 3.907268, 0, 0.2666667, 1, 1,
0.3206194, -0.8912942, 1.49634, 0, 0.2627451, 1, 1,
0.3253982, 3.503178, -0.4068852, 0, 0.254902, 1, 1,
0.3290187, -0.7667053, 2.371485, 0, 0.2509804, 1, 1,
0.3310897, -0.88243, 1.842054, 0, 0.2431373, 1, 1,
0.3381234, -0.8482132, 4.385652, 0, 0.2392157, 1, 1,
0.3459486, -1.647163, 3.785749, 0, 0.2313726, 1, 1,
0.3519746, 0.3036256, 0.04807498, 0, 0.227451, 1, 1,
0.3555895, 1.232926, -0.7279657, 0, 0.2196078, 1, 1,
0.3556263, 0.4884308, 1.125319, 0, 0.2156863, 1, 1,
0.3631626, 0.2654509, 2.663819, 0, 0.2078431, 1, 1,
0.363755, -1.73285, 3.274106, 0, 0.2039216, 1, 1,
0.3677385, -0.4695538, 3.174317, 0, 0.1960784, 1, 1,
0.368936, -0.7073394, 4.01001, 0, 0.1882353, 1, 1,
0.3694991, -1.716005, 2.90354, 0, 0.1843137, 1, 1,
0.3707577, 0.400305, -1.382259, 0, 0.1764706, 1, 1,
0.3743906, -1.021256, 4.527984, 0, 0.172549, 1, 1,
0.3745643, -1.57864, 2.367816, 0, 0.1647059, 1, 1,
0.3809842, -1.675123, 2.269099, 0, 0.1607843, 1, 1,
0.3816709, 1.70634, -2.04831, 0, 0.1529412, 1, 1,
0.3831985, 0.5497629, 0.4074028, 0, 0.1490196, 1, 1,
0.3841922, 0.8460438, -0.2678613, 0, 0.1411765, 1, 1,
0.3874815, 0.5458728, 0.5942379, 0, 0.1372549, 1, 1,
0.3938634, -0.9964933, 4.746342, 0, 0.1294118, 1, 1,
0.3944834, 0.00407514, 1.040514, 0, 0.1254902, 1, 1,
0.3962865, 0.8728467, 0.1614119, 0, 0.1176471, 1, 1,
0.3964794, -0.6930649, 3.808606, 0, 0.1137255, 1, 1,
0.3968952, 0.2672857, 1.345682, 0, 0.1058824, 1, 1,
0.3983465, 0.3158759, 0.896895, 0, 0.09803922, 1, 1,
0.3983828, -2.078693, 3.661024, 0, 0.09411765, 1, 1,
0.3992791, -1.948521, 4.297199, 0, 0.08627451, 1, 1,
0.4015341, -0.4075104, 4.169103, 0, 0.08235294, 1, 1,
0.4038061, -1.039317, 2.817466, 0, 0.07450981, 1, 1,
0.4046319, 1.057122, 1.22397, 0, 0.07058824, 1, 1,
0.4137621, 0.01615103, 1.213863, 0, 0.0627451, 1, 1,
0.4175124, 1.091079, -1.114061, 0, 0.05882353, 1, 1,
0.4181824, 0.2835892, 0.7848266, 0, 0.05098039, 1, 1,
0.4257802, -0.524164, 2.462654, 0, 0.04705882, 1, 1,
0.4261514, -1.250563, 2.433393, 0, 0.03921569, 1, 1,
0.427889, -1.632431, 1.542731, 0, 0.03529412, 1, 1,
0.429015, 0.7089003, -1.887345, 0, 0.02745098, 1, 1,
0.4340382, 0.8776035, 0.511823, 0, 0.02352941, 1, 1,
0.4355131, -0.5744928, 2.772192, 0, 0.01568628, 1, 1,
0.4378887, 0.2545632, 0.3239141, 0, 0.01176471, 1, 1,
0.4409493, 0.1992909, 0.8567429, 0, 0.003921569, 1, 1,
0.4439152, 0.853677, 0.5791724, 0.003921569, 0, 1, 1,
0.446144, 3.014084, 1.625117, 0.007843138, 0, 1, 1,
0.4463538, -0.432958, 2.077689, 0.01568628, 0, 1, 1,
0.4468023, -0.7140459, 0.5666808, 0.01960784, 0, 1, 1,
0.4516374, -0.4818947, 3.366966, 0.02745098, 0, 1, 1,
0.452989, -0.5014551, 2.48001, 0.03137255, 0, 1, 1,
0.4557416, 0.2878425, 0.2406275, 0.03921569, 0, 1, 1,
0.4559507, 1.24901, -0.5859095, 0.04313726, 0, 1, 1,
0.4606449, 1.529018, 0.1694132, 0.05098039, 0, 1, 1,
0.4624102, 1.352088, 0.07366262, 0.05490196, 0, 1, 1,
0.4657957, 1.58655, 0.2389015, 0.0627451, 0, 1, 1,
0.4658311, -1.242139, 3.703074, 0.06666667, 0, 1, 1,
0.467406, 1.265486, 2.859766, 0.07450981, 0, 1, 1,
0.4718514, 0.4705216, 0.621779, 0.07843138, 0, 1, 1,
0.4760715, -0.3073148, 2.279975, 0.08627451, 0, 1, 1,
0.4860331, -1.349686, 3.455431, 0.09019608, 0, 1, 1,
0.4885867, -0.2830815, 0.7492188, 0.09803922, 0, 1, 1,
0.4900316, 0.2081682, -0.676035, 0.1058824, 0, 1, 1,
0.4950623, 1.050859, -0.1464394, 0.1098039, 0, 1, 1,
0.4985579, 0.005017934, 0.1654912, 0.1176471, 0, 1, 1,
0.5080277, -0.3710112, 2.30934, 0.1215686, 0, 1, 1,
0.5081002, -0.559872, 1.522621, 0.1294118, 0, 1, 1,
0.5128543, 1.156184, -0.6893538, 0.1333333, 0, 1, 1,
0.5134828, 0.3311455, 1.01265, 0.1411765, 0, 1, 1,
0.5146877, 0.2742755, 2.117234, 0.145098, 0, 1, 1,
0.5154434, 1.879881, -0.3713993, 0.1529412, 0, 1, 1,
0.5159627, -0.4618609, 3.426923, 0.1568628, 0, 1, 1,
0.5176927, -1.248717, 0.5864547, 0.1647059, 0, 1, 1,
0.5227517, 0.8416126, 0.8788618, 0.1686275, 0, 1, 1,
0.5264715, -1.506029, 2.978426, 0.1764706, 0, 1, 1,
0.5269329, 0.6131306, 0.05278713, 0.1803922, 0, 1, 1,
0.5275533, 0.819295, 0.3068892, 0.1882353, 0, 1, 1,
0.5282526, -0.1184566, 1.819811, 0.1921569, 0, 1, 1,
0.5289189, -0.28891, 1.60081, 0.2, 0, 1, 1,
0.5298464, -1.235625, 4.045629, 0.2078431, 0, 1, 1,
0.532621, 0.3480075, 0.8695171, 0.2117647, 0, 1, 1,
0.538743, -1.80311, 3.542486, 0.2196078, 0, 1, 1,
0.5395404, 0.4680794, 0.5231531, 0.2235294, 0, 1, 1,
0.5417563, 0.9549295, 0.7086376, 0.2313726, 0, 1, 1,
0.5421112, -0.9910478, 3.859474, 0.2352941, 0, 1, 1,
0.5431007, -0.7404313, 3.552481, 0.2431373, 0, 1, 1,
0.5473131, -0.1100815, 3.119904, 0.2470588, 0, 1, 1,
0.5479244, 0.1938027, 1.531959, 0.254902, 0, 1, 1,
0.5501494, 0.3259293, -0.3668105, 0.2588235, 0, 1, 1,
0.5541254, 0.298235, 1.557218, 0.2666667, 0, 1, 1,
0.5542006, -0.9777913, 3.040192, 0.2705882, 0, 1, 1,
0.5575483, 0.4302563, 0.8044046, 0.2784314, 0, 1, 1,
0.5589742, 0.6704554, 2.064439, 0.282353, 0, 1, 1,
0.5623905, -0.7630306, 2.631317, 0.2901961, 0, 1, 1,
0.5623961, 0.5534836, 1.007526, 0.2941177, 0, 1, 1,
0.5634635, -0.2789629, 2.369064, 0.3019608, 0, 1, 1,
0.5712753, -0.2233711, 3.217283, 0.3098039, 0, 1, 1,
0.5717869, 0.2337649, 0.2381861, 0.3137255, 0, 1, 1,
0.5722007, 0.6836461, 0.1934562, 0.3215686, 0, 1, 1,
0.5835742, -0.940682, 2.525855, 0.3254902, 0, 1, 1,
0.583849, 0.5151701, -0.4594965, 0.3333333, 0, 1, 1,
0.5858012, -0.1473244, 1.607526, 0.3372549, 0, 1, 1,
0.5949718, 0.7855688, -0.3341396, 0.345098, 0, 1, 1,
0.5986577, 0.422576, 0.6876872, 0.3490196, 0, 1, 1,
0.5989072, 0.7440807, 1.379866, 0.3568628, 0, 1, 1,
0.6002488, -1.507877, 3.001606, 0.3607843, 0, 1, 1,
0.6019115, 0.8351936, 0.4476823, 0.3686275, 0, 1, 1,
0.6039761, -0.3434087, 2.258099, 0.372549, 0, 1, 1,
0.6077762, -1.396268, 1.991455, 0.3803922, 0, 1, 1,
0.6101126, 1.115291, -0.1825387, 0.3843137, 0, 1, 1,
0.6130683, -0.8189491, 2.930633, 0.3921569, 0, 1, 1,
0.6140769, 1.038341, 2.642195, 0.3960784, 0, 1, 1,
0.6168643, 1.326314, 1.445682, 0.4039216, 0, 1, 1,
0.6223849, 0.3129553, -1.070515, 0.4117647, 0, 1, 1,
0.6244491, -0.3211849, 0.8315342, 0.4156863, 0, 1, 1,
0.6271661, -1.097793, 2.455918, 0.4235294, 0, 1, 1,
0.6346398, 1.717128, 1.820814, 0.427451, 0, 1, 1,
0.6366831, -1.321902, 1.030979, 0.4352941, 0, 1, 1,
0.6391335, 0.3147232, 0.6816815, 0.4392157, 0, 1, 1,
0.6415169, -0.06889314, 2.026198, 0.4470588, 0, 1, 1,
0.6429173, -0.2164702, 1.255358, 0.4509804, 0, 1, 1,
0.6444417, -0.8632484, 1.618431, 0.4588235, 0, 1, 1,
0.649046, -0.8635653, 3.506699, 0.4627451, 0, 1, 1,
0.6495757, 0.5293752, -0.06136259, 0.4705882, 0, 1, 1,
0.6525767, -0.3684716, 3.752856, 0.4745098, 0, 1, 1,
0.653611, 0.6660459, 1.362151, 0.4823529, 0, 1, 1,
0.6543245, -1.865251, 3.578257, 0.4862745, 0, 1, 1,
0.6650208, 0.5865437, -0.5367409, 0.4941176, 0, 1, 1,
0.6650891, 0.4945447, -1.225728, 0.5019608, 0, 1, 1,
0.6683668, 0.5405807, 0.0002220486, 0.5058824, 0, 1, 1,
0.6694745, -0.8508472, 2.639468, 0.5137255, 0, 1, 1,
0.6708729, 0.79918, 2.99771, 0.5176471, 0, 1, 1,
0.6748511, 1.264927, 1.492599, 0.5254902, 0, 1, 1,
0.6760132, 0.7108069, 0.4512084, 0.5294118, 0, 1, 1,
0.6773896, 1.311527, -0.561653, 0.5372549, 0, 1, 1,
0.6808581, -0.4529945, 4.923737, 0.5411765, 0, 1, 1,
0.6880352, -0.6273446, 2.590809, 0.5490196, 0, 1, 1,
0.6891067, 0.2209343, 1.766193, 0.5529412, 0, 1, 1,
0.6899818, -1.630694, 4.980693, 0.5607843, 0, 1, 1,
0.6908758, 0.2533104, 1.909891, 0.5647059, 0, 1, 1,
0.6950291, 2.424964, -0.4995207, 0.572549, 0, 1, 1,
0.6953823, 0.3419465, -0.3205451, 0.5764706, 0, 1, 1,
0.6957756, 0.1826616, 1.216327, 0.5843138, 0, 1, 1,
0.6957798, -0.5570753, 4.074955, 0.5882353, 0, 1, 1,
0.6960195, -0.1988203, 1.02199, 0.5960785, 0, 1, 1,
0.699191, 1.070256, 0.4029878, 0.6039216, 0, 1, 1,
0.7005138, -0.005064394, 2.542391, 0.6078432, 0, 1, 1,
0.7009305, -2.350406, 2.170287, 0.6156863, 0, 1, 1,
0.7058076, -1.333801, 1.899305, 0.6196079, 0, 1, 1,
0.7169436, 1.565827, 2.482714, 0.627451, 0, 1, 1,
0.7207569, 1.060436, 2.166819, 0.6313726, 0, 1, 1,
0.7222901, 1.346425, -0.3736241, 0.6392157, 0, 1, 1,
0.724887, -2.197943, 3.823026, 0.6431373, 0, 1, 1,
0.7314869, 0.3428402, 0.4728317, 0.6509804, 0, 1, 1,
0.7320272, 0.9583356, 0.2474387, 0.654902, 0, 1, 1,
0.7359803, 1.251484, 0.6578569, 0.6627451, 0, 1, 1,
0.7427955, 1.428922, -1.207043, 0.6666667, 0, 1, 1,
0.7434339, -0.4068266, 2.936923, 0.6745098, 0, 1, 1,
0.7523809, -0.7475149, 3.018205, 0.6784314, 0, 1, 1,
0.7658892, 1.297331, -0.05365629, 0.6862745, 0, 1, 1,
0.7660594, 0.3639074, 1.607406, 0.6901961, 0, 1, 1,
0.7715988, 1.3532, 0.8403345, 0.6980392, 0, 1, 1,
0.7825434, 0.5020588, 1.025127, 0.7058824, 0, 1, 1,
0.7835285, -1.165363, 3.1019, 0.7098039, 0, 1, 1,
0.7894372, -0.4896972, 2.043453, 0.7176471, 0, 1, 1,
0.807547, -0.2329592, 2.638661, 0.7215686, 0, 1, 1,
0.807964, 0.7461646, -0.342479, 0.7294118, 0, 1, 1,
0.8081181, -0.01943475, 2.096769, 0.7333333, 0, 1, 1,
0.8081472, -0.5082038, 2.985537, 0.7411765, 0, 1, 1,
0.8250533, -0.19386, 1.2139, 0.7450981, 0, 1, 1,
0.8256984, 0.1227904, 2.172436, 0.7529412, 0, 1, 1,
0.8279139, 0.5644973, 0.07206467, 0.7568628, 0, 1, 1,
0.8281298, 0.1540819, 3.039549, 0.7647059, 0, 1, 1,
0.8287703, 0.2978001, -0.08984474, 0.7686275, 0, 1, 1,
0.8296273, 0.3851215, 0.437877, 0.7764706, 0, 1, 1,
0.8297202, -1.022533, 2.315573, 0.7803922, 0, 1, 1,
0.8341626, -0.1973121, 2.113679, 0.7882353, 0, 1, 1,
0.8343043, -0.414948, 2.513797, 0.7921569, 0, 1, 1,
0.8358726, 2.937687, -0.2734121, 0.8, 0, 1, 1,
0.8364039, 0.1643494, 1.122471, 0.8078431, 0, 1, 1,
0.837609, 1.847408, -0.3261481, 0.8117647, 0, 1, 1,
0.8444813, -0.4535136, 1.408128, 0.8196079, 0, 1, 1,
0.8487194, -1.683273, 3.472441, 0.8235294, 0, 1, 1,
0.8488003, 0.5528432, 1.239394, 0.8313726, 0, 1, 1,
0.8523862, 0.3028132, -1.075554, 0.8352941, 0, 1, 1,
0.8530269, 0.2338495, 2.863122, 0.8431373, 0, 1, 1,
0.8542553, 0.2713662, 1.216321, 0.8470588, 0, 1, 1,
0.8566259, 0.5557047, 1.640159, 0.854902, 0, 1, 1,
0.857115, 1.830709, -0.4315809, 0.8588235, 0, 1, 1,
0.8578055, 1.037399, 3.206022, 0.8666667, 0, 1, 1,
0.8599971, -0.9979529, 2.387505, 0.8705882, 0, 1, 1,
0.8734733, -0.552381, 4.840755, 0.8784314, 0, 1, 1,
0.8815968, -0.1778595, 2.742838, 0.8823529, 0, 1, 1,
0.8830786, 2.246254, 2.492413, 0.8901961, 0, 1, 1,
0.8899378, -0.9864445, 3.995488, 0.8941177, 0, 1, 1,
0.8919212, -0.5589601, 3.281316, 0.9019608, 0, 1, 1,
0.8923734, 0.9470245, -1.005628, 0.9098039, 0, 1, 1,
0.9054226, -0.5646087, 1.30542, 0.9137255, 0, 1, 1,
0.9143127, 1.34094, -1.486992, 0.9215686, 0, 1, 1,
0.9190612, -0.2084384, 1.204722, 0.9254902, 0, 1, 1,
0.9198823, 0.4821397, 1.994897, 0.9333333, 0, 1, 1,
0.9201053, -1.969023, 3.569652, 0.9372549, 0, 1, 1,
0.9242069, 0.5171245, 0.2279219, 0.945098, 0, 1, 1,
0.9257017, 0.4073688, 0.5976043, 0.9490196, 0, 1, 1,
0.9288973, -1.761625, 0.8118071, 0.9568627, 0, 1, 1,
0.9297705, 1.466198, 0.7170688, 0.9607843, 0, 1, 1,
0.9308603, 0.4318892, 1.103359, 0.9686275, 0, 1, 1,
0.9455015, -0.6683655, 1.405814, 0.972549, 0, 1, 1,
0.9474004, 0.6573465, 1.530966, 0.9803922, 0, 1, 1,
0.9492345, 1.210693, 0.7997055, 0.9843137, 0, 1, 1,
0.9627699, 1.155442, -0.2784545, 0.9921569, 0, 1, 1,
0.9660659, 1.619945, 0.1709274, 0.9960784, 0, 1, 1,
0.9660813, 0.2848277, 1.050807, 1, 0, 0.9960784, 1,
0.9672513, -0.9163604, 2.710484, 1, 0, 0.9882353, 1,
0.96847, 0.9615024, 0.06042721, 1, 0, 0.9843137, 1,
0.9699344, 0.381389, 0.2790835, 1, 0, 0.9764706, 1,
0.9725856, 1.558987, 1.701254, 1, 0, 0.972549, 1,
0.980619, -0.6533356, 1.635899, 1, 0, 0.9647059, 1,
0.9833891, -1.664581, 4.394338, 1, 0, 0.9607843, 1,
0.9846172, -0.07779646, 2.216881, 1, 0, 0.9529412, 1,
0.997314, -1.321649, 2.454232, 1, 0, 0.9490196, 1,
1.002307, 0.3280218, 0.9848723, 1, 0, 0.9411765, 1,
1.003886, -1.662746, 3.030426, 1, 0, 0.9372549, 1,
1.006276, -2.59134, 3.259902, 1, 0, 0.9294118, 1,
1.011927, 0.106128, 1.810456, 1, 0, 0.9254902, 1,
1.04493, -0.9287047, 2.092899, 1, 0, 0.9176471, 1,
1.0452, -1.078916, 4.695646, 1, 0, 0.9137255, 1,
1.055696, 0.3267733, 1.827497, 1, 0, 0.9058824, 1,
1.057959, -1.927153, 3.1702, 1, 0, 0.9019608, 1,
1.058941, -0.5152971, 2.098387, 1, 0, 0.8941177, 1,
1.060306, 0.5951858, -0.07665817, 1, 0, 0.8862745, 1,
1.060877, 0.1758732, 1.589857, 1, 0, 0.8823529, 1,
1.062289, -0.1349159, 2.675269, 1, 0, 0.8745098, 1,
1.065234, 0.9027725, -0.1180549, 1, 0, 0.8705882, 1,
1.066871, -0.4416363, 1.827962, 1, 0, 0.8627451, 1,
1.067229, 0.5270723, 1.309494, 1, 0, 0.8588235, 1,
1.06769, 0.5096564, 0.9743707, 1, 0, 0.8509804, 1,
1.073551, -1.012797, 2.005207, 1, 0, 0.8470588, 1,
1.074385, 0.5324127, 2.4535, 1, 0, 0.8392157, 1,
1.075107, 0.5841402, 1.742163, 1, 0, 0.8352941, 1,
1.0752, -0.2268224, 0.7099645, 1, 0, 0.827451, 1,
1.077429, 0.7554992, 0.2651096, 1, 0, 0.8235294, 1,
1.081397, -1.668063, 2.515798, 1, 0, 0.8156863, 1,
1.081888, -0.02037476, 3.077561, 1, 0, 0.8117647, 1,
1.085295, -1.465416, 1.471901, 1, 0, 0.8039216, 1,
1.087921, -0.4246812, 1.822548, 1, 0, 0.7960784, 1,
1.095686, 0.5507131, -0.5649834, 1, 0, 0.7921569, 1,
1.118803, 2.186435, 0.7111686, 1, 0, 0.7843137, 1,
1.130691, 1.619524, 1.401723, 1, 0, 0.7803922, 1,
1.132645, 0.6008642, -0.160686, 1, 0, 0.772549, 1,
1.136512, -0.2008592, 0.880668, 1, 0, 0.7686275, 1,
1.148986, 1.034809, 0.9069103, 1, 0, 0.7607843, 1,
1.151151, 0.7475649, 1.879388, 1, 0, 0.7568628, 1,
1.151774, -1.340005, 1.52395, 1, 0, 0.7490196, 1,
1.154858, 0.6514113, 1.893878, 1, 0, 0.7450981, 1,
1.155735, -1.41686, 1.788894, 1, 0, 0.7372549, 1,
1.166943, -0.1333712, 1.315383, 1, 0, 0.7333333, 1,
1.167143, 0.1369154, 2.570836, 1, 0, 0.7254902, 1,
1.171552, -0.02127371, 0.6897404, 1, 0, 0.7215686, 1,
1.179377, 0.5963233, 1.19568, 1, 0, 0.7137255, 1,
1.187999, 1.336999, 1.5587, 1, 0, 0.7098039, 1,
1.193928, 0.7617162, 0.5336531, 1, 0, 0.7019608, 1,
1.20144, 0.5369179, 0.6749646, 1, 0, 0.6941177, 1,
1.208395, -0.3499691, 2.803214, 1, 0, 0.6901961, 1,
1.209033, -0.4668321, 0.2693943, 1, 0, 0.682353, 1,
1.210087, 1.132583, 1.931904, 1, 0, 0.6784314, 1,
1.213692, -0.5352514, 2.270822, 1, 0, 0.6705883, 1,
1.222763, 0.3403323, 2.275353, 1, 0, 0.6666667, 1,
1.244017, 0.1641266, 0.238288, 1, 0, 0.6588235, 1,
1.246641, -0.1789916, 1.747923, 1, 0, 0.654902, 1,
1.2483, -0.8241394, 1.722225, 1, 0, 0.6470588, 1,
1.250742, -1.120601, 2.803856, 1, 0, 0.6431373, 1,
1.255815, 0.5574953, 0.512647, 1, 0, 0.6352941, 1,
1.271954, -1.220485, 2.059744, 1, 0, 0.6313726, 1,
1.276765, -0.3933863, 0.7313676, 1, 0, 0.6235294, 1,
1.28893, 0.1781795, 1.409662, 1, 0, 0.6196079, 1,
1.293681, -0.4426837, 1.936459, 1, 0, 0.6117647, 1,
1.300786, 0.3222354, 2.667194, 1, 0, 0.6078432, 1,
1.301945, -1.872854, 1.5471, 1, 0, 0.6, 1,
1.303552, -1.218007, 2.47129, 1, 0, 0.5921569, 1,
1.310149, -0.4589152, 3.027567, 1, 0, 0.5882353, 1,
1.329836, 0.1269383, 1.672398, 1, 0, 0.5803922, 1,
1.331478, -0.336652, -0.4473653, 1, 0, 0.5764706, 1,
1.331993, -0.2945517, 2.136468, 1, 0, 0.5686275, 1,
1.337797, -0.4582963, 1.255298, 1, 0, 0.5647059, 1,
1.35874, 1.216233, 1.490751, 1, 0, 0.5568628, 1,
1.359563, -0.429051, 2.591423, 1, 0, 0.5529412, 1,
1.370332, -0.2701629, 2.790048, 1, 0, 0.5450981, 1,
1.378944, 0.218367, 0.8258799, 1, 0, 0.5411765, 1,
1.386982, -1.097074, 2.905428, 1, 0, 0.5333334, 1,
1.393839, 0.008516492, -0.006163939, 1, 0, 0.5294118, 1,
1.394397, 0.4224831, 0.165816, 1, 0, 0.5215687, 1,
1.401956, 0.3255295, -1.233731, 1, 0, 0.5176471, 1,
1.406568, -1.132786, 2.542644, 1, 0, 0.509804, 1,
1.40827, -0.08174207, -0.4244213, 1, 0, 0.5058824, 1,
1.411886, -0.9746436, 2.096137, 1, 0, 0.4980392, 1,
1.413936, -0.02279864, 2.602417, 1, 0, 0.4901961, 1,
1.418208, -0.740717, 2.17155, 1, 0, 0.4862745, 1,
1.431377, 0.5540777, 1.208412, 1, 0, 0.4784314, 1,
1.432165, -0.5669717, 2.307509, 1, 0, 0.4745098, 1,
1.432536, 0.415659, 0.3435691, 1, 0, 0.4666667, 1,
1.441973, -0.3941297, 0.4045036, 1, 0, 0.4627451, 1,
1.450684, 1.535296, -0.08658447, 1, 0, 0.454902, 1,
1.475415, -1.458641, 2.769818, 1, 0, 0.4509804, 1,
1.477165, 0.3900881, 1.129952, 1, 0, 0.4431373, 1,
1.482762, 0.7576334, 1.596971, 1, 0, 0.4392157, 1,
1.492586, -1.399505, 1.177125, 1, 0, 0.4313726, 1,
1.500111, 0.2847303, 2.666862, 1, 0, 0.427451, 1,
1.506665, -1.252455, 1.722665, 1, 0, 0.4196078, 1,
1.508929, 1.2881, 1.001427, 1, 0, 0.4156863, 1,
1.516162, -0.7176495, 2.750172, 1, 0, 0.4078431, 1,
1.518005, 0.301446, -0.6090608, 1, 0, 0.4039216, 1,
1.52413, 0.0857371, 1.012619, 1, 0, 0.3960784, 1,
1.526847, 0.3210582, 0.6098627, 1, 0, 0.3882353, 1,
1.544673, 0.336306, 1.209549, 1, 0, 0.3843137, 1,
1.551506, 1.076492, 1.229177, 1, 0, 0.3764706, 1,
1.562287, -0.7397856, 2.038134, 1, 0, 0.372549, 1,
1.564733, 0.5647252, 2.299908, 1, 0, 0.3647059, 1,
1.56715, 2.574939, 1.744803, 1, 0, 0.3607843, 1,
1.571024, -1.25929, 2.10746, 1, 0, 0.3529412, 1,
1.576869, -0.01040508, 2.029611, 1, 0, 0.3490196, 1,
1.598317, 0.4852816, 1.352538, 1, 0, 0.3411765, 1,
1.601162, 0.2016471, 3.464417, 1, 0, 0.3372549, 1,
1.617574, -2.291861, 4.196835, 1, 0, 0.3294118, 1,
1.626659, 0.3776083, 2.163148, 1, 0, 0.3254902, 1,
1.653383, -1.2761, 3.218806, 1, 0, 0.3176471, 1,
1.663476, 1.089323, 0.1117741, 1, 0, 0.3137255, 1,
1.672004, 1.550592, 2.549303, 1, 0, 0.3058824, 1,
1.674575, -0.365184, 0.7453905, 1, 0, 0.2980392, 1,
1.680764, -0.7729329, 0.6557174, 1, 0, 0.2941177, 1,
1.682956, 0.487245, 0.5575706, 1, 0, 0.2862745, 1,
1.68312, 0.6164988, 1.412789, 1, 0, 0.282353, 1,
1.687327, -0.6251327, 1.882257, 1, 0, 0.2745098, 1,
1.691161, -0.04056137, 1.269894, 1, 0, 0.2705882, 1,
1.706411, 0.2387151, 0.5641918, 1, 0, 0.2627451, 1,
1.710748, 0.2385294, 2.243128, 1, 0, 0.2588235, 1,
1.724601, -1.376216, 1.845099, 1, 0, 0.2509804, 1,
1.725506, -0.1918682, 2.084115, 1, 0, 0.2470588, 1,
1.729509, -0.7814111, 0.9962047, 1, 0, 0.2392157, 1,
1.729763, 1.193887, 0.5556196, 1, 0, 0.2352941, 1,
1.73855, -1.072054, 1.355349, 1, 0, 0.227451, 1,
1.744916, 0.8215824, 2.450019, 1, 0, 0.2235294, 1,
1.762151, -2.286836, 1.564413, 1, 0, 0.2156863, 1,
1.774631, -1.050121, 1.80331, 1, 0, 0.2117647, 1,
1.776211, -0.3403357, 1.324429, 1, 0, 0.2039216, 1,
1.78821, -2.030564, 2.559446, 1, 0, 0.1960784, 1,
1.790994, 0.7815469, 1.085943, 1, 0, 0.1921569, 1,
1.791107, -0.4229586, 1.857373, 1, 0, 0.1843137, 1,
1.799511, -0.02008583, 2.197394, 1, 0, 0.1803922, 1,
1.806115, -0.5842376, 2.859765, 1, 0, 0.172549, 1,
1.841506, -1.529066, 3.459615, 1, 0, 0.1686275, 1,
1.881471, 0.1522987, 1.266155, 1, 0, 0.1607843, 1,
1.891257, 0.5075049, -0.6723015, 1, 0, 0.1568628, 1,
1.896237, -0.148723, 2.182815, 1, 0, 0.1490196, 1,
1.922176, -1.086157, 1.046341, 1, 0, 0.145098, 1,
1.966625, 1.225664, 1.932324, 1, 0, 0.1372549, 1,
1.994893, -0.04810673, 1.862678, 1, 0, 0.1333333, 1,
2.038105, -0.3442887, 0.8796198, 1, 0, 0.1254902, 1,
2.043625, -0.4842995, 1.512209, 1, 0, 0.1215686, 1,
2.056364, 0.3149954, 1.599543, 1, 0, 0.1137255, 1,
2.069061, -0.9398775, 0.8794597, 1, 0, 0.1098039, 1,
2.073934, -0.5818013, 3.054912, 1, 0, 0.1019608, 1,
2.074501, -0.1145354, -0.494819, 1, 0, 0.09411765, 1,
2.088436, -0.08722326, 1.441136, 1, 0, 0.09019608, 1,
2.182399, 0.1284536, -0.2124511, 1, 0, 0.08235294, 1,
2.216674, 0.4864465, 0.8434432, 1, 0, 0.07843138, 1,
2.256014, 0.8125511, 1.795581, 1, 0, 0.07058824, 1,
2.265735, -0.05567995, 3.158948, 1, 0, 0.06666667, 1,
2.324728, 0.1037172, 2.585177, 1, 0, 0.05882353, 1,
2.380526, -0.5946862, 0.8811697, 1, 0, 0.05490196, 1,
2.410798, 0.2115083, 2.574798, 1, 0, 0.04705882, 1,
2.414467, -0.2733759, 2.985365, 1, 0, 0.04313726, 1,
2.506696, 0.07564687, 1.864779, 1, 0, 0.03529412, 1,
2.603535, -0.6419014, 2.957016, 1, 0, 0.03137255, 1,
2.639145, -0.0104688, 3.032323, 1, 0, 0.02352941, 1,
2.89122, 1.449513, 0.9635513, 1, 0, 0.01960784, 1,
2.913701, 0.02969702, 2.853485, 1, 0, 0.01176471, 1,
4.027785, -0.2001047, 2.387932, 1, 0, 0.007843138, 1
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
0.3080529, -4.502063, -6.682397, 0, -0.5, 0.5, 0.5,
0.3080529, -4.502063, -6.682397, 1, -0.5, 0.5, 0.5,
0.3080529, -4.502063, -6.682397, 1, 1.5, 0.5, 0.5,
0.3080529, -4.502063, -6.682397, 0, 1.5, 0.5, 0.5
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
-4.672669, 0.5074137, -6.682397, 0, -0.5, 0.5, 0.5,
-4.672669, 0.5074137, -6.682397, 1, -0.5, 0.5, 0.5,
-4.672669, 0.5074137, -6.682397, 1, 1.5, 0.5, 0.5,
-4.672669, 0.5074137, -6.682397, 0, 1.5, 0.5, 0.5
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
-4.672669, -4.502063, 0.2674448, 0, -0.5, 0.5, 0.5,
-4.672669, -4.502063, 0.2674448, 1, -0.5, 0.5, 0.5,
-4.672669, -4.502063, 0.2674448, 1, 1.5, 0.5, 0.5,
-4.672669, -4.502063, 0.2674448, 0, 1.5, 0.5, 0.5
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
-2, -3.34603, -5.078588,
4, -3.34603, -5.078588,
-2, -3.34603, -5.078588,
-2, -3.538702, -5.345889,
0, -3.34603, -5.078588,
0, -3.538702, -5.345889,
2, -3.34603, -5.078588,
2, -3.538702, -5.345889,
4, -3.34603, -5.078588,
4, -3.538702, -5.345889
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
"2",
"4"
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
-2, -3.924047, -5.880492, 0, -0.5, 0.5, 0.5,
-2, -3.924047, -5.880492, 1, -0.5, 0.5, 0.5,
-2, -3.924047, -5.880492, 1, 1.5, 0.5, 0.5,
-2, -3.924047, -5.880492, 0, 1.5, 0.5, 0.5,
0, -3.924047, -5.880492, 0, -0.5, 0.5, 0.5,
0, -3.924047, -5.880492, 1, -0.5, 0.5, 0.5,
0, -3.924047, -5.880492, 1, 1.5, 0.5, 0.5,
0, -3.924047, -5.880492, 0, 1.5, 0.5, 0.5,
2, -3.924047, -5.880492, 0, -0.5, 0.5, 0.5,
2, -3.924047, -5.880492, 1, -0.5, 0.5, 0.5,
2, -3.924047, -5.880492, 1, 1.5, 0.5, 0.5,
2, -3.924047, -5.880492, 0, 1.5, 0.5, 0.5,
4, -3.924047, -5.880492, 0, -0.5, 0.5, 0.5,
4, -3.924047, -5.880492, 1, -0.5, 0.5, 0.5,
4, -3.924047, -5.880492, 1, 1.5, 0.5, 0.5,
4, -3.924047, -5.880492, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.523272, -2, -5.078588,
-3.523272, 4, -5.078588,
-3.523272, -2, -5.078588,
-3.714838, -2, -5.345889,
-3.523272, 0, -5.078588,
-3.714838, 0, -5.345889,
-3.523272, 2, -5.078588,
-3.714838, 2, -5.345889,
-3.523272, 4, -5.078588,
-3.714838, 4, -5.345889
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
"0",
"2",
"4"
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
-4.09797, -2, -5.880492, 0, -0.5, 0.5, 0.5,
-4.09797, -2, -5.880492, 1, -0.5, 0.5, 0.5,
-4.09797, -2, -5.880492, 1, 1.5, 0.5, 0.5,
-4.09797, -2, -5.880492, 0, 1.5, 0.5, 0.5,
-4.09797, 0, -5.880492, 0, -0.5, 0.5, 0.5,
-4.09797, 0, -5.880492, 1, -0.5, 0.5, 0.5,
-4.09797, 0, -5.880492, 1, 1.5, 0.5, 0.5,
-4.09797, 0, -5.880492, 0, 1.5, 0.5, 0.5,
-4.09797, 2, -5.880492, 0, -0.5, 0.5, 0.5,
-4.09797, 2, -5.880492, 1, -0.5, 0.5, 0.5,
-4.09797, 2, -5.880492, 1, 1.5, 0.5, 0.5,
-4.09797, 2, -5.880492, 0, 1.5, 0.5, 0.5,
-4.09797, 4, -5.880492, 0, -0.5, 0.5, 0.5,
-4.09797, 4, -5.880492, 1, -0.5, 0.5, 0.5,
-4.09797, 4, -5.880492, 1, 1.5, 0.5, 0.5,
-4.09797, 4, -5.880492, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.523272, -3.34603, -4,
-3.523272, -3.34603, 4,
-3.523272, -3.34603, -4,
-3.714838, -3.538702, -4,
-3.523272, -3.34603, -2,
-3.714838, -3.538702, -2,
-3.523272, -3.34603, 0,
-3.714838, -3.538702, 0,
-3.523272, -3.34603, 2,
-3.714838, -3.538702, 2,
-3.523272, -3.34603, 4,
-3.714838, -3.538702, 4
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
-4.09797, -3.924047, -4, 0, -0.5, 0.5, 0.5,
-4.09797, -3.924047, -4, 1, -0.5, 0.5, 0.5,
-4.09797, -3.924047, -4, 1, 1.5, 0.5, 0.5,
-4.09797, -3.924047, -4, 0, 1.5, 0.5, 0.5,
-4.09797, -3.924047, -2, 0, -0.5, 0.5, 0.5,
-4.09797, -3.924047, -2, 1, -0.5, 0.5, 0.5,
-4.09797, -3.924047, -2, 1, 1.5, 0.5, 0.5,
-4.09797, -3.924047, -2, 0, 1.5, 0.5, 0.5,
-4.09797, -3.924047, 0, 0, -0.5, 0.5, 0.5,
-4.09797, -3.924047, 0, 1, -0.5, 0.5, 0.5,
-4.09797, -3.924047, 0, 1, 1.5, 0.5, 0.5,
-4.09797, -3.924047, 0, 0, 1.5, 0.5, 0.5,
-4.09797, -3.924047, 2, 0, -0.5, 0.5, 0.5,
-4.09797, -3.924047, 2, 1, -0.5, 0.5, 0.5,
-4.09797, -3.924047, 2, 1, 1.5, 0.5, 0.5,
-4.09797, -3.924047, 2, 0, 1.5, 0.5, 0.5,
-4.09797, -3.924047, 4, 0, -0.5, 0.5, 0.5,
-4.09797, -3.924047, 4, 1, -0.5, 0.5, 0.5,
-4.09797, -3.924047, 4, 1, 1.5, 0.5, 0.5,
-4.09797, -3.924047, 4, 0, 1.5, 0.5, 0.5
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
-3.523272, -3.34603, -5.078588,
-3.523272, 4.360857, -5.078588,
-3.523272, -3.34603, 5.613477,
-3.523272, 4.360857, 5.613477,
-3.523272, -3.34603, -5.078588,
-3.523272, -3.34603, 5.613477,
-3.523272, 4.360857, -5.078588,
-3.523272, 4.360857, 5.613477,
-3.523272, -3.34603, -5.078588,
4.139377, -3.34603, -5.078588,
-3.523272, -3.34603, 5.613477,
4.139377, -3.34603, 5.613477,
-3.523272, 4.360857, -5.078588,
4.139377, 4.360857, -5.078588,
-3.523272, 4.360857, 5.613477,
4.139377, 4.360857, 5.613477,
4.139377, -3.34603, -5.078588,
4.139377, 4.360857, -5.078588,
4.139377, -3.34603, 5.613477,
4.139377, 4.360857, 5.613477,
4.139377, -3.34603, -5.078588,
4.139377, -3.34603, 5.613477,
4.139377, 4.360857, -5.078588,
4.139377, 4.360857, 5.613477
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
var radius = 8.140928;
var distance = 36.21991;
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
mvMatrix.translate( -0.3080529, -0.5074137, -0.2674448 );
mvMatrix.scale( 1.148706, 1.142112, 0.8232396 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.21991);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
oxadiargyl<-read.table("oxadiargyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxadiargyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
```

```r
y<-oxadiargyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
```

```r
z<-oxadiargyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
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
-3.41168, 2.379877, -0.2811456, 0, 0, 1, 1, 1,
-3.366762, -1.257915, -1.052499, 1, 0, 0, 1, 1,
-3.047806, -0.3912875, -0.9549085, 1, 0, 0, 1, 1,
-2.991525, -0.6687176, -0.8404005, 1, 0, 0, 1, 1,
-2.740345, 0.8508315, -2.362759, 1, 0, 0, 1, 1,
-2.506024, 2.09939, -0.8024185, 1, 0, 0, 1, 1,
-2.50445, -0.3830787, -3.464711, 0, 0, 0, 1, 1,
-2.470846, 0.8214614, -2.854843, 0, 0, 0, 1, 1,
-2.460996, 1.353099, -1.582292, 0, 0, 0, 1, 1,
-2.397525, -0.2777943, -2.615437, 0, 0, 0, 1, 1,
-2.302249, 0.6565803, 0.3906336, 0, 0, 0, 1, 1,
-2.29805, 0.8946059, -1.47649, 0, 0, 0, 1, 1,
-2.296381, 0.7167283, -2.747637, 0, 0, 0, 1, 1,
-2.266877, 0.7786931, -1.188953, 1, 1, 1, 1, 1,
-2.236714, 0.1409416, -2.457083, 1, 1, 1, 1, 1,
-2.217968, -1.029844, -0.2952114, 1, 1, 1, 1, 1,
-2.201036, 0.06533041, -3.294507, 1, 1, 1, 1, 1,
-2.170789, 0.5057636, -0.8780233, 1, 1, 1, 1, 1,
-2.163374, 0.3484037, -2.260279, 1, 1, 1, 1, 1,
-2.14598, -1.049472, -1.697025, 1, 1, 1, 1, 1,
-2.115104, 1.265043, -0.5540442, 1, 1, 1, 1, 1,
-2.077051, -2.369357, -2.42515, 1, 1, 1, 1, 1,
-2.073978, -1.013295, -2.820278, 1, 1, 1, 1, 1,
-2.045516, -1.969213, -1.185656, 1, 1, 1, 1, 1,
-2.042507, -1.084644, -1.566486, 1, 1, 1, 1, 1,
-2.041286, 0.3340832, -2.723498, 1, 1, 1, 1, 1,
-1.992818, -0.9579582, -2.181744, 1, 1, 1, 1, 1,
-1.992728, -0.3662895, -1.84695, 1, 1, 1, 1, 1,
-1.988929, -0.8059451, -1.428584, 0, 0, 1, 1, 1,
-1.988436, 0.1542336, -2.287256, 1, 0, 0, 1, 1,
-1.978755, 0.7462968, -1.454555, 1, 0, 0, 1, 1,
-1.977916, 0.04295194, -1.85462, 1, 0, 0, 1, 1,
-1.977825, 0.09270249, -3.006324, 1, 0, 0, 1, 1,
-1.940798, 1.073631, -0.5312723, 1, 0, 0, 1, 1,
-1.923386, -0.005570694, -1.741966, 0, 0, 0, 1, 1,
-1.914778, -1.019094, -4.435503, 0, 0, 0, 1, 1,
-1.900511, -1.777295, -3.920495, 0, 0, 0, 1, 1,
-1.900001, -1.263073, -0.7128463, 0, 0, 0, 1, 1,
-1.895167, 0.4746725, -0.8098173, 0, 0, 0, 1, 1,
-1.886591, 0.9631306, -0.4340557, 0, 0, 0, 1, 1,
-1.884853, 1.143309, -1.186385, 0, 0, 0, 1, 1,
-1.873124, 0.2961619, -2.657046, 1, 1, 1, 1, 1,
-1.87242, 0.9203627, -2.40895, 1, 1, 1, 1, 1,
-1.8675, -0.5467284, -1.687116, 1, 1, 1, 1, 1,
-1.865932, 0.1637721, -1.021078, 1, 1, 1, 1, 1,
-1.857572, 0.2223441, -2.253807, 1, 1, 1, 1, 1,
-1.851646, 0.6794224, -3.307392, 1, 1, 1, 1, 1,
-1.841868, 0.3908344, -3.990956, 1, 1, 1, 1, 1,
-1.796534, 0.5664271, -1.154726, 1, 1, 1, 1, 1,
-1.7844, -2.960138, -3.114537, 1, 1, 1, 1, 1,
-1.776652, -0.4630777, -2.211976, 1, 1, 1, 1, 1,
-1.767469, 0.1177261, -2.243952, 1, 1, 1, 1, 1,
-1.7572, -1.867963, -1.241365, 1, 1, 1, 1, 1,
-1.737583, -0.5895388, -2.162184, 1, 1, 1, 1, 1,
-1.712765, 1.367057, -1.553238, 1, 1, 1, 1, 1,
-1.712756, 0.949742, -1.176368, 1, 1, 1, 1, 1,
-1.712213, -1.265079, -2.260974, 0, 0, 1, 1, 1,
-1.711239, -0.9997911, -3.579883, 1, 0, 0, 1, 1,
-1.701734, 0.4497373, -2.399659, 1, 0, 0, 1, 1,
-1.700421, -2.497489, -0.7674507, 1, 0, 0, 1, 1,
-1.692725, -2.501425, -0.8034256, 1, 0, 0, 1, 1,
-1.684411, 1.221646, -0.9806466, 1, 0, 0, 1, 1,
-1.683975, -0.1389305, -1.72948, 0, 0, 0, 1, 1,
-1.668749, 0.5942492, -0.2661443, 0, 0, 0, 1, 1,
-1.666817, -1.620303, -1.417842, 0, 0, 0, 1, 1,
-1.634585, 0.6612511, -3.062301, 0, 0, 0, 1, 1,
-1.631451, 0.5271806, 0.9589318, 0, 0, 0, 1, 1,
-1.615019, -0.003800336, -0.8380545, 0, 0, 0, 1, 1,
-1.599651, -1.271158, -1.712096, 0, 0, 0, 1, 1,
-1.585051, -0.3272714, -1.57972, 1, 1, 1, 1, 1,
-1.561869, -1.138316, -2.678122, 1, 1, 1, 1, 1,
-1.561458, 0.1943558, -2.449541, 1, 1, 1, 1, 1,
-1.558208, 0.1797017, -1.286813, 1, 1, 1, 1, 1,
-1.550367, 0.6787329, -0.9870361, 1, 1, 1, 1, 1,
-1.530636, -0.2119487, -0.8370881, 1, 1, 1, 1, 1,
-1.52476, -0.1977084, -2.682227, 1, 1, 1, 1, 1,
-1.51618, -0.1226245, -1.803686, 1, 1, 1, 1, 1,
-1.516114, -1.164187, 0.8005535, 1, 1, 1, 1, 1,
-1.506014, 0.2414481, -1.884556, 1, 1, 1, 1, 1,
-1.49146, -0.9738207, -2.214321, 1, 1, 1, 1, 1,
-1.485281, -0.4802745, -1.888644, 1, 1, 1, 1, 1,
-1.485093, -1.678404, -3.626901, 1, 1, 1, 1, 1,
-1.474628, -0.8831015, -1.774718, 1, 1, 1, 1, 1,
-1.453956, 0.2849919, -1.69692, 1, 1, 1, 1, 1,
-1.453315, -3.233794, -3.697267, 0, 0, 1, 1, 1,
-1.442495, -1.184746, -3.846107, 1, 0, 0, 1, 1,
-1.430737, 0.3014632, -0.7594089, 1, 0, 0, 1, 1,
-1.418978, 1.948489, -0.9153945, 1, 0, 0, 1, 1,
-1.416968, 0.454596, -2.024844, 1, 0, 0, 1, 1,
-1.416252, -0.7478582, -2.339541, 1, 0, 0, 1, 1,
-1.404044, -0.5277224, -1.124869, 0, 0, 0, 1, 1,
-1.395498, 1.393127, -0.2834987, 0, 0, 0, 1, 1,
-1.393093, -0.5415151, -0.4863382, 0, 0, 0, 1, 1,
-1.37244, 0.9212244, -2.735811, 0, 0, 0, 1, 1,
-1.36787, 0.2844483, -0.3390697, 0, 0, 0, 1, 1,
-1.364816, -2.498079, -2.585395, 0, 0, 0, 1, 1,
-1.35723, -1.088388, -2.367798, 0, 0, 0, 1, 1,
-1.347327, -2.080377, -3.953543, 1, 1, 1, 1, 1,
-1.344353, 2.659335, -0.6289826, 1, 1, 1, 1, 1,
-1.329365, -0.762632, -2.532495, 1, 1, 1, 1, 1,
-1.318561, 0.5264362, -1.979479, 1, 1, 1, 1, 1,
-1.309087, 0.6483033, -1.072487, 1, 1, 1, 1, 1,
-1.30108, 1.301954, -0.2658054, 1, 1, 1, 1, 1,
-1.301053, 0.6363645, -1.427469, 1, 1, 1, 1, 1,
-1.296689, 0.5446854, -2.687267, 1, 1, 1, 1, 1,
-1.288908, 0.6303056, -1.819031, 1, 1, 1, 1, 1,
-1.288447, -1.266992, -0.5663868, 1, 1, 1, 1, 1,
-1.281899, -1.614194, -1.128019, 1, 1, 1, 1, 1,
-1.280951, 0.9911335, -0.7245015, 1, 1, 1, 1, 1,
-1.276302, -0.1441859, -1.443874, 1, 1, 1, 1, 1,
-1.270566, 0.1992896, -1.541857, 1, 1, 1, 1, 1,
-1.266221, 0.1032793, -0.1990582, 1, 1, 1, 1, 1,
-1.264208, -1.369969, -2.758031, 0, 0, 1, 1, 1,
-1.262656, 1.853674, 0.09403791, 1, 0, 0, 1, 1,
-1.256893, -0.807399, -1.964904, 1, 0, 0, 1, 1,
-1.256329, 0.8382531, -0.3558136, 1, 0, 0, 1, 1,
-1.230892, 1.145833, 0.2531383, 1, 0, 0, 1, 1,
-1.229223, 0.9188428, -1.100706, 1, 0, 0, 1, 1,
-1.226754, -0.02591923, -2.261789, 0, 0, 0, 1, 1,
-1.224454, 1.145292, -2.180237, 0, 0, 0, 1, 1,
-1.207975, 0.4113862, -2.438247, 0, 0, 0, 1, 1,
-1.19554, -1.779682, -4.225608, 0, 0, 0, 1, 1,
-1.189785, 0.02195688, -1.378736, 0, 0, 0, 1, 1,
-1.183315, 0.2901286, -1.765268, 0, 0, 0, 1, 1,
-1.183122, -0.8226439, -2.929089, 0, 0, 0, 1, 1,
-1.171945, 0.1740484, -3.158226, 1, 1, 1, 1, 1,
-1.166872, -0.05245785, -0.5175575, 1, 1, 1, 1, 1,
-1.166458, -0.3591225, -1.33223, 1, 1, 1, 1, 1,
-1.160396, -0.7533356, -2.608271, 1, 1, 1, 1, 1,
-1.157052, -0.4357784, -1.062567, 1, 1, 1, 1, 1,
-1.153744, 0.05934652, -1.545307, 1, 1, 1, 1, 1,
-1.14689, -0.73202, -3.030984, 1, 1, 1, 1, 1,
-1.143717, 0.4480919, -0.8897147, 1, 1, 1, 1, 1,
-1.135599, 1.468313, 0.8123909, 1, 1, 1, 1, 1,
-1.130734, 1.101022, -1.626443, 1, 1, 1, 1, 1,
-1.126108, 0.4211849, -1.259669, 1, 1, 1, 1, 1,
-1.107873, -1.38119, -1.667386, 1, 1, 1, 1, 1,
-1.100014, 0.4015959, -0.9276742, 1, 1, 1, 1, 1,
-1.093832, 0.6069357, -1.10549, 1, 1, 1, 1, 1,
-1.092058, 0.1381631, -1.722353, 1, 1, 1, 1, 1,
-1.091197, 0.7113499, -2.012112, 0, 0, 1, 1, 1,
-1.084838, 0.5814185, -2.814394, 1, 0, 0, 1, 1,
-1.073977, -1.098731, -1.246664, 1, 0, 0, 1, 1,
-1.072902, 0.8315414, 0.7981159, 1, 0, 0, 1, 1,
-1.064995, -0.2001228, -0.3028405, 1, 0, 0, 1, 1,
-1.062586, 0.6774148, -2.505945, 1, 0, 0, 1, 1,
-1.060649, 0.8194225, -0.8711268, 0, 0, 0, 1, 1,
-1.060577, -1.254768, -2.90828, 0, 0, 0, 1, 1,
-1.059228, -1.37963, -1.911435, 0, 0, 0, 1, 1,
-1.055047, 0.377443, -1.756958, 0, 0, 0, 1, 1,
-1.054337, -1.017405, -2.471623, 0, 0, 0, 1, 1,
-1.051743, 0.3378339, -1.614604, 0, 0, 0, 1, 1,
-1.047335, -0.3254303, -2.472636, 0, 0, 0, 1, 1,
-1.039543, 0.3584931, 0.09676789, 1, 1, 1, 1, 1,
-1.026067, -2.291575, -3.567159, 1, 1, 1, 1, 1,
-1.023704, -0.03628973, -1.704032, 1, 1, 1, 1, 1,
-1.022227, 0.4885028, -2.658221, 1, 1, 1, 1, 1,
-1.021484, -0.07312761, -3.797875, 1, 1, 1, 1, 1,
-1.021081, -8.43827e-05, -2.885396, 1, 1, 1, 1, 1,
-1.018384, -0.3533497, -2.720907, 1, 1, 1, 1, 1,
-1.007264, -0.2618828, -2.970785, 1, 1, 1, 1, 1,
-1.005356, -0.8838919, -2.401386, 1, 1, 1, 1, 1,
-1.003427, 0.04237171, -0.7267933, 1, 1, 1, 1, 1,
-0.9949613, -0.8006997, -1.446143, 1, 1, 1, 1, 1,
-0.990804, 0.9294292, -2.108526, 1, 1, 1, 1, 1,
-0.9894117, -2.047265, -4.014547, 1, 1, 1, 1, 1,
-0.9853993, 0.6424825, -1.391871, 1, 1, 1, 1, 1,
-0.9822975, 1.097242, -1.408579, 1, 1, 1, 1, 1,
-0.9822693, 2.464776, -0.9773299, 0, 0, 1, 1, 1,
-0.9788461, -0.1019654, -0.7483554, 1, 0, 0, 1, 1,
-0.9769846, 0.1138642, -1.306861, 1, 0, 0, 1, 1,
-0.9684759, -0.5938078, -2.250646, 1, 0, 0, 1, 1,
-0.9535507, 1.427331, -2.229828, 1, 0, 0, 1, 1,
-0.9514018, -0.7080593, -2.208607, 1, 0, 0, 1, 1,
-0.951099, -1.845236, -2.504734, 0, 0, 0, 1, 1,
-0.9508922, -0.6542753, -1.987452, 0, 0, 0, 1, 1,
-0.9503667, -0.3162534, -1.713714, 0, 0, 0, 1, 1,
-0.9449456, -0.01984938, -0.4599629, 0, 0, 0, 1, 1,
-0.9427004, 0.1226914, -0.3799257, 0, 0, 0, 1, 1,
-0.9417388, 0.5920504, -0.8979784, 0, 0, 0, 1, 1,
-0.9374467, -1.575309, -2.81881, 0, 0, 0, 1, 1,
-0.9366439, 1.445095, -0.7343108, 1, 1, 1, 1, 1,
-0.9321746, 0.6485976, -1.232363, 1, 1, 1, 1, 1,
-0.9287558, 0.417453, -1.93562, 1, 1, 1, 1, 1,
-0.9222879, 0.2398146, 7.480078e-05, 1, 1, 1, 1, 1,
-0.9178311, -0.4638574, -2.307637, 1, 1, 1, 1, 1,
-0.9166868, 1.350532, 0.01597862, 1, 1, 1, 1, 1,
-0.9150894, 1.69162, -0.8833105, 1, 1, 1, 1, 1,
-0.9062461, -0.7402464, -2.230549, 1, 1, 1, 1, 1,
-0.8915978, 0.1764081, -1.05304, 1, 1, 1, 1, 1,
-0.8897596, 1.138767, 0.476862, 1, 1, 1, 1, 1,
-0.8892636, 0.1866784, -1.127817, 1, 1, 1, 1, 1,
-0.8842157, 0.6978579, -0.954506, 1, 1, 1, 1, 1,
-0.8810533, -0.05243731, -1.266849, 1, 1, 1, 1, 1,
-0.8809989, -0.906904, -3.050254, 1, 1, 1, 1, 1,
-0.8727137, 0.5902681, -0.5802738, 1, 1, 1, 1, 1,
-0.870141, -0.1747561, -2.92553, 0, 0, 1, 1, 1,
-0.8684365, 1.487867, -0.09362015, 1, 0, 0, 1, 1,
-0.8681949, -0.1327887, -3.513058, 1, 0, 0, 1, 1,
-0.8623427, 0.1391611, -0.4271937, 1, 0, 0, 1, 1,
-0.8616344, -1.945401, -3.732654, 1, 0, 0, 1, 1,
-0.8595399, -0.5376607, -1.924245, 1, 0, 0, 1, 1,
-0.8587326, -0.01553267, -1.736079, 0, 0, 0, 1, 1,
-0.8563618, 1.110123, -1.099502, 0, 0, 0, 1, 1,
-0.8549516, -0.1326874, -2.076268, 0, 0, 0, 1, 1,
-0.8525752, 0.2163567, -1.915212, 0, 0, 0, 1, 1,
-0.847358, -0.8612856, -2.098909, 0, 0, 0, 1, 1,
-0.844569, 0.6473907, -1.411149, 0, 0, 0, 1, 1,
-0.8432624, -1.050272, -0.4331964, 0, 0, 0, 1, 1,
-0.838011, 0.5747817, -0.3867359, 1, 1, 1, 1, 1,
-0.8340019, 1.226491, -1.629223, 1, 1, 1, 1, 1,
-0.8221668, 1.055632, 0.2487748, 1, 1, 1, 1, 1,
-0.812773, 1.295496, -0.2991307, 1, 1, 1, 1, 1,
-0.8116615, -0.08032896, -0.4461908, 1, 1, 1, 1, 1,
-0.8061157, -2.48, -2.409261, 1, 1, 1, 1, 1,
-0.7958992, 0.5998183, -0.6218218, 1, 1, 1, 1, 1,
-0.7946051, -0.8651261, -2.577448, 1, 1, 1, 1, 1,
-0.7926604, -0.7920344, -1.74418, 1, 1, 1, 1, 1,
-0.7923212, -0.4850731, -2.613605, 1, 1, 1, 1, 1,
-0.7905288, 0.8883506, -1.037581, 1, 1, 1, 1, 1,
-0.7901993, -0.7682968, -3.029403, 1, 1, 1, 1, 1,
-0.7901082, 0.7501763, 0.2334045, 1, 1, 1, 1, 1,
-0.7871068, -2.061294, -4.162263, 1, 1, 1, 1, 1,
-0.785684, 0.5359257, -2.134166, 1, 1, 1, 1, 1,
-0.784986, -1.220391, -2.461888, 0, 0, 1, 1, 1,
-0.7793216, -1.853344, -2.972085, 1, 0, 0, 1, 1,
-0.7765034, -0.574226, -0.4182385, 1, 0, 0, 1, 1,
-0.7755172, -1.662013, -3.633364, 1, 0, 0, 1, 1,
-0.7713521, 0.08058351, -0.789675, 1, 0, 0, 1, 1,
-0.767494, -0.102333, -2.010292, 1, 0, 0, 1, 1,
-0.7586363, 0.005933391, -1.926504, 0, 0, 0, 1, 1,
-0.7578397, 1.538856, -0.0678763, 0, 0, 0, 1, 1,
-0.7550851, -1.124153, -0.5424617, 0, 0, 0, 1, 1,
-0.7456219, -0.6123637, -2.965111, 0, 0, 0, 1, 1,
-0.745612, -0.08065861, -0.6864456, 0, 0, 0, 1, 1,
-0.7426601, 0.8811647, 0.4005357, 0, 0, 0, 1, 1,
-0.7419437, 0.03858031, -1.113368, 0, 0, 0, 1, 1,
-0.7411383, -0.8584659, -3.539457, 1, 1, 1, 1, 1,
-0.735375, 1.364808, -0.3815865, 1, 1, 1, 1, 1,
-0.7344514, 1.609994, -0.4447423, 1, 1, 1, 1, 1,
-0.7331855, -0.1716178, -0.30863, 1, 1, 1, 1, 1,
-0.7318379, 0.4039634, -0.9845785, 1, 1, 1, 1, 1,
-0.7291742, -1.357164, -3.596326, 1, 1, 1, 1, 1,
-0.7222965, -0.9434335, -1.459424, 1, 1, 1, 1, 1,
-0.7218548, 0.5008769, -0.8285572, 1, 1, 1, 1, 1,
-0.7163503, 1.177965, -1.03662, 1, 1, 1, 1, 1,
-0.7092265, 2.589411, -0.2023632, 1, 1, 1, 1, 1,
-0.7024204, 0.03759327, -3.12188, 1, 1, 1, 1, 1,
-0.7016426, 1.47008, 0.1926298, 1, 1, 1, 1, 1,
-0.7010694, 1.076657, -1.622179, 1, 1, 1, 1, 1,
-0.6978572, 0.5478065, -1.044619, 1, 1, 1, 1, 1,
-0.6951383, -0.9975711, -3.794007, 1, 1, 1, 1, 1,
-0.6932656, -0.1125507, -1.347003, 0, 0, 1, 1, 1,
-0.6861787, -1.293401, -2.941724, 1, 0, 0, 1, 1,
-0.6802982, -1.256744, -1.52216, 1, 0, 0, 1, 1,
-0.6792388, -0.2984037, -2.683711, 1, 0, 0, 1, 1,
-0.6777908, -0.1886373, -2.710148, 1, 0, 0, 1, 1,
-0.6756036, -0.6067629, -2.3802, 1, 0, 0, 1, 1,
-0.6749532, -0.2977223, -3.113521, 0, 0, 0, 1, 1,
-0.6735821, 1.880478, 0.1597979, 0, 0, 0, 1, 1,
-0.6725425, -0.6110092, -2.40226, 0, 0, 0, 1, 1,
-0.6690013, -0.0436675, -1.918293, 0, 0, 0, 1, 1,
-0.6689224, 0.0347084, -0.3124361, 0, 0, 0, 1, 1,
-0.6669484, -0.06522194, -1.592165, 0, 0, 0, 1, 1,
-0.6665838, -1.883911, -2.510896, 0, 0, 0, 1, 1,
-0.6664302, 1.849404, -0.22293, 1, 1, 1, 1, 1,
-0.6658877, -0.9003068, -2.844472, 1, 1, 1, 1, 1,
-0.6615034, 0.03050601, -1.912766, 1, 1, 1, 1, 1,
-0.6611993, -0.8146372, -1.967393, 1, 1, 1, 1, 1,
-0.6601459, 2.501795, 0.2158851, 1, 1, 1, 1, 1,
-0.6506755, 0.7648233, -0.4709664, 1, 1, 1, 1, 1,
-0.6484727, -2.033108, -1.624215, 1, 1, 1, 1, 1,
-0.6396022, 0.3530093, 0.6341297, 1, 1, 1, 1, 1,
-0.6383651, -0.4412597, -2.557833, 1, 1, 1, 1, 1,
-0.635316, 0.3524683, 0.243697, 1, 1, 1, 1, 1,
-0.6333317, 0.8264229, -0.3672087, 1, 1, 1, 1, 1,
-0.6327938, -0.8679904, -4.199914, 1, 1, 1, 1, 1,
-0.63226, 0.4006052, 0.4409702, 1, 1, 1, 1, 1,
-0.630907, 0.9188156, 1.132927, 1, 1, 1, 1, 1,
-0.6308222, 0.3565833, -2.009753, 1, 1, 1, 1, 1,
-0.6276419, 0.7374198, -0.1731581, 0, 0, 1, 1, 1,
-0.627127, -1.37047, -3.14227, 1, 0, 0, 1, 1,
-0.6250018, 0.00576774, -0.8120851, 1, 0, 0, 1, 1,
-0.6240157, -2.895398, -3.940322, 1, 0, 0, 1, 1,
-0.6185215, -0.06261115, -2.075952, 1, 0, 0, 1, 1,
-0.6161373, -0.6152551, -0.843594, 1, 0, 0, 1, 1,
-0.6132079, 1.203013, 0.2193194, 0, 0, 0, 1, 1,
-0.6033342, 1.242898, 0.9176391, 0, 0, 0, 1, 1,
-0.602492, -0.7353086, -1.296588, 0, 0, 0, 1, 1,
-0.5969427, -0.8344883, -2.484908, 0, 0, 0, 1, 1,
-0.5968567, -0.8697824, -3.276148, 0, 0, 0, 1, 1,
-0.5948387, -0.3604142, -1.192213, 0, 0, 0, 1, 1,
-0.5938525, 0.5216087, -1.136481, 0, 0, 0, 1, 1,
-0.5904405, -0.3960372, -2.193145, 1, 1, 1, 1, 1,
-0.5844836, -0.06199863, -0.9869871, 1, 1, 1, 1, 1,
-0.5790445, 0.9286367, -0.3084955, 1, 1, 1, 1, 1,
-0.5783505, 1.439087, 0.7877393, 1, 1, 1, 1, 1,
-0.5762831, 0.9905362, 0.7501284, 1, 1, 1, 1, 1,
-0.5753331, 0.5770451, -0.9693353, 1, 1, 1, 1, 1,
-0.5723364, 0.8431716, -0.8545258, 1, 1, 1, 1, 1,
-0.5600236, -1.01832, -3.475312, 1, 1, 1, 1, 1,
-0.5598571, -0.1581574, -0.8974316, 1, 1, 1, 1, 1,
-0.5576006, 0.5713062, -1.036034, 1, 1, 1, 1, 1,
-0.5525461, -0.1927287, -0.8567424, 1, 1, 1, 1, 1,
-0.5460053, 1.341056, 1.432707, 1, 1, 1, 1, 1,
-0.5438393, -0.7679276, -2.638502, 1, 1, 1, 1, 1,
-0.5404917, 0.4611969, 0.9491486, 1, 1, 1, 1, 1,
-0.5386921, -1.417928, -2.595934, 1, 1, 1, 1, 1,
-0.534824, -0.7992033, -1.79649, 0, 0, 1, 1, 1,
-0.5325779, 1.745319, 0.2802402, 1, 0, 0, 1, 1,
-0.5260373, -0.307985, -1.573082, 1, 0, 0, 1, 1,
-0.5255864, -0.02801552, -0.7745522, 1, 0, 0, 1, 1,
-0.5248709, -0.02067464, -3.546069, 1, 0, 0, 1, 1,
-0.5243512, 1.995917, -0.5579283, 1, 0, 0, 1, 1,
-0.5240693, -0.2294678, -2.259253, 0, 0, 0, 1, 1,
-0.5213631, -1.172201, -4.184898, 0, 0, 0, 1, 1,
-0.5188015, -0.7510517, -1.474442, 0, 0, 0, 1, 1,
-0.5183904, -0.4253605, -3.640272, 0, 0, 0, 1, 1,
-0.5144934, -0.8480892, -2.290594, 0, 0, 0, 1, 1,
-0.5110456, -1.361201, -2.94751, 0, 0, 0, 1, 1,
-0.5013105, -1.05663, -0.2247885, 0, 0, 0, 1, 1,
-0.4987826, 0.8916956, 0.1283368, 1, 1, 1, 1, 1,
-0.4971681, 0.4999173, -1.749396, 1, 1, 1, 1, 1,
-0.4969386, 0.8852068, -0.4530255, 1, 1, 1, 1, 1,
-0.4930897, -0.8361611, -3.400959, 1, 1, 1, 1, 1,
-0.4926263, -1.506469, -3.487572, 1, 1, 1, 1, 1,
-0.4914959, -0.3194007, -3.181653, 1, 1, 1, 1, 1,
-0.4882703, -0.1002522, -1.054607, 1, 1, 1, 1, 1,
-0.4865718, -0.1546052, -2.840704, 1, 1, 1, 1, 1,
-0.4847952, -1.071255, -4.922878, 1, 1, 1, 1, 1,
-0.4846512, -0.6436539, -4.818933, 1, 1, 1, 1, 1,
-0.4818739, 0.9111134, -0.5982118, 1, 1, 1, 1, 1,
-0.4810042, -0.506714, -2.379212, 1, 1, 1, 1, 1,
-0.4808429, -0.8987861, -1.024011, 1, 1, 1, 1, 1,
-0.4784499, -0.5116653, -3.624674, 1, 1, 1, 1, 1,
-0.4758399, 0.3631519, -0.1195221, 1, 1, 1, 1, 1,
-0.4750355, -0.4374993, -3.519121, 0, 0, 1, 1, 1,
-0.4740004, 0.3897023, -0.1607008, 1, 0, 0, 1, 1,
-0.4731167, 0.4398115, -0.1529086, 1, 0, 0, 1, 1,
-0.4684144, 1.583266, 0.9496024, 1, 0, 0, 1, 1,
-0.4655658, -1.055376, -3.887806, 1, 0, 0, 1, 1,
-0.4590537, -0.6694781, -1.899661, 1, 0, 0, 1, 1,
-0.4577526, 0.302808, -0.5452061, 0, 0, 0, 1, 1,
-0.4520477, 0.1237437, -2.23919, 0, 0, 0, 1, 1,
-0.4512212, -1.33182, -4.291166, 0, 0, 0, 1, 1,
-0.4507172, 0.5705133, -0.8340279, 0, 0, 0, 1, 1,
-0.4416063, 0.9316837, -0.8780438, 0, 0, 0, 1, 1,
-0.433152, 0.2236084, 1.569593, 0, 0, 0, 1, 1,
-0.4259517, -1.522513, -1.012803, 0, 0, 0, 1, 1,
-0.4152195, -1.396827, -3.312321, 1, 1, 1, 1, 1,
-0.4147958, -2.569186, -2.733649, 1, 1, 1, 1, 1,
-0.4137234, 0.7583961, -0.09063654, 1, 1, 1, 1, 1,
-0.4128988, -1.453912, -3.845458, 1, 1, 1, 1, 1,
-0.4086012, 1.233486, -0.8768716, 1, 1, 1, 1, 1,
-0.4017418, 0.3073955, -1.156475, 1, 1, 1, 1, 1,
-0.4006419, -0.4914313, -2.145662, 1, 1, 1, 1, 1,
-0.3977169, 0.4100656, -0.03223229, 1, 1, 1, 1, 1,
-0.3948617, 0.163517, -0.6121184, 1, 1, 1, 1, 1,
-0.3901579, -0.8147304, -1.146387, 1, 1, 1, 1, 1,
-0.3890008, 0.06702074, -0.6288698, 1, 1, 1, 1, 1,
-0.3877991, 0.5286902, -0.2618581, 1, 1, 1, 1, 1,
-0.3876489, 0.5183867, -1.851625, 1, 1, 1, 1, 1,
-0.3875221, 0.5611778, -0.7425143, 1, 1, 1, 1, 1,
-0.3867732, -1.50357, -4.620832, 1, 1, 1, 1, 1,
-0.3796333, -0.3209351, -0.6148191, 0, 0, 1, 1, 1,
-0.3789442, 1.10086, -1.624573, 1, 0, 0, 1, 1,
-0.3771919, 1.815272, -0.3907267, 1, 0, 0, 1, 1,
-0.3764363, 1.028775, -1.201516, 1, 0, 0, 1, 1,
-0.3719611, -1.323767, -2.251766, 1, 0, 0, 1, 1,
-0.364135, 0.1211482, -1.610497, 1, 0, 0, 1, 1,
-0.3607079, -1.289985, -2.08934, 0, 0, 0, 1, 1,
-0.360619, 1.71969, 1.160082, 0, 0, 0, 1, 1,
-0.3602174, 0.1863864, -1.475603, 0, 0, 0, 1, 1,
-0.3595572, 0.6124135, -0.7999287, 0, 0, 0, 1, 1,
-0.3588553, -0.423351, -1.84089, 0, 0, 0, 1, 1,
-0.3564214, -0.983605, -4.68825, 0, 0, 0, 1, 1,
-0.3560722, -0.2791457, -2.72584, 0, 0, 0, 1, 1,
-0.3553272, -0.9337667, -3.548934, 1, 1, 1, 1, 1,
-0.3456999, 1.157692, 1.187239, 1, 1, 1, 1, 1,
-0.3419163, 0.9976773, -1.37545, 1, 1, 1, 1, 1,
-0.3264986, -1.609826, -2.924269, 1, 1, 1, 1, 1,
-0.3232583, -0.2681715, -1.358561, 1, 1, 1, 1, 1,
-0.3226092, -0.4654185, -1.708667, 1, 1, 1, 1, 1,
-0.3219237, -0.5821397, -3.017567, 1, 1, 1, 1, 1,
-0.319635, 0.5314456, -0.2313787, 1, 1, 1, 1, 1,
-0.3192391, 0.6035061, 1.094666, 1, 1, 1, 1, 1,
-0.3168996, -1.685201, -2.238051, 1, 1, 1, 1, 1,
-0.3150057, 1.595752, -0.3021317, 1, 1, 1, 1, 1,
-0.3145379, -2.798465, -2.805249, 1, 1, 1, 1, 1,
-0.3127726, 0.8783807, -0.05187921, 1, 1, 1, 1, 1,
-0.3079425, 0.3042706, -1.040086, 1, 1, 1, 1, 1,
-0.3078539, 1.424213, 0.2820397, 1, 1, 1, 1, 1,
-0.3070769, 2.605608, 2.145003, 0, 0, 1, 1, 1,
-0.3068506, 0.1910739, -1.806826, 1, 0, 0, 1, 1,
-0.3049495, -0.3491766, -3.564203, 1, 0, 0, 1, 1,
-0.3041147, -1.716039, -2.824934, 1, 0, 0, 1, 1,
-0.3033975, -2.121372, -2.4235, 1, 0, 0, 1, 1,
-0.2962927, -0.0408413, -0.4244573, 1, 0, 0, 1, 1,
-0.295727, -1.890471, -4.36341, 0, 0, 0, 1, 1,
-0.2952497, -0.8487648, -0.2196048, 0, 0, 0, 1, 1,
-0.2930643, 0.03740554, -1.707029, 0, 0, 0, 1, 1,
-0.2894474, 0.9252577, -0.1991878, 0, 0, 0, 1, 1,
-0.2888586, 1.453445, -0.3759414, 0, 0, 0, 1, 1,
-0.2851209, 0.8613047, 0.001650605, 0, 0, 0, 1, 1,
-0.2834264, 0.8469572, -1.451733, 0, 0, 0, 1, 1,
-0.2785438, -0.3238074, -3.379013, 1, 1, 1, 1, 1,
-0.277002, -1.151113, -1.364375, 1, 1, 1, 1, 1,
-0.2728641, -1.105866, -2.352015, 1, 1, 1, 1, 1,
-0.2713885, 0.2720315, -1.348607, 1, 1, 1, 1, 1,
-0.2704891, -1.660273, -2.347049, 1, 1, 1, 1, 1,
-0.2626087, -0.3020217, -4.000322, 1, 1, 1, 1, 1,
-0.2596234, -0.03459385, -2.575559, 1, 1, 1, 1, 1,
-0.2502521, -1.16418, -2.310369, 1, 1, 1, 1, 1,
-0.249045, 1.644285, -0.08375511, 1, 1, 1, 1, 1,
-0.2484994, -0.5934697, -3.587003, 1, 1, 1, 1, 1,
-0.248121, -0.1559094, -1.600432, 1, 1, 1, 1, 1,
-0.2390787, -0.627948, -3.683354, 1, 1, 1, 1, 1,
-0.2347961, 0.4412151, -0.3226707, 1, 1, 1, 1, 1,
-0.2257882, 1.442329, 2.276662, 1, 1, 1, 1, 1,
-0.2210101, 4.248621, 0.1748583, 1, 1, 1, 1, 1,
-0.2186575, -0.6317735, -3.574834, 0, 0, 1, 1, 1,
-0.2158077, 0.4709879, 0.2571705, 1, 0, 0, 1, 1,
-0.2148503, 0.3956116, -1.195398, 1, 0, 0, 1, 1,
-0.2097139, 0.04178944, 0.319437, 1, 0, 0, 1, 1,
-0.2075635, 0.4958515, -1.224154, 1, 0, 0, 1, 1,
-0.2065811, -0.9017392, -4.028921, 1, 0, 0, 1, 1,
-0.2045964, 1.543876, -0.463118, 0, 0, 0, 1, 1,
-0.2044654, -0.2576603, -1.057005, 0, 0, 0, 1, 1,
-0.2004259, 0.2954085, -2.168843, 0, 0, 0, 1, 1,
-0.1994322, 0.2558724, -1.101214, 0, 0, 0, 1, 1,
-0.1968385, 0.314421, -0.04146538, 0, 0, 0, 1, 1,
-0.190528, -0.6352042, -3.76145, 0, 0, 0, 1, 1,
-0.1844082, 1.092846, 0.2741914, 0, 0, 0, 1, 1,
-0.1747111, -0.4926909, -3.862715, 1, 1, 1, 1, 1,
-0.1733421, -2.274379, -1.897768, 1, 1, 1, 1, 1,
-0.17069, 0.2381284, -0.4098388, 1, 1, 1, 1, 1,
-0.1684653, 2.310947, 0.3636302, 1, 1, 1, 1, 1,
-0.1517309, 0.4765831, 1.468415, 1, 1, 1, 1, 1,
-0.1515325, 0.9490854, -1.323938, 1, 1, 1, 1, 1,
-0.1503607, 0.4470454, 1.760906, 1, 1, 1, 1, 1,
-0.1396746, 2.209176, 0.3401968, 1, 1, 1, 1, 1,
-0.1368884, 0.2094182, -0.06889415, 1, 1, 1, 1, 1,
-0.1294052, -1.195312, -0.8181959, 1, 1, 1, 1, 1,
-0.1258251, 0.589722, 0.1234482, 1, 1, 1, 1, 1,
-0.1231252, -1.581424, -3.552747, 1, 1, 1, 1, 1,
-0.1192817, 0.602053, 0.009890858, 1, 1, 1, 1, 1,
-0.1169005, 0.6108944, 0.2717076, 1, 1, 1, 1, 1,
-0.1150254, 0.1699087, -1.715857, 1, 1, 1, 1, 1,
-0.113165, -1.81902, -3.496578, 0, 0, 1, 1, 1,
-0.1120532, 1.010235, 0.9766133, 1, 0, 0, 1, 1,
-0.1111511, 0.2915109, -0.7794828, 1, 0, 0, 1, 1,
-0.1094333, 0.4923573, -2.160534, 1, 0, 0, 1, 1,
-0.1070487, -1.184445, -3.12497, 1, 0, 0, 1, 1,
-0.1063868, 0.2514576, -0.2841378, 1, 0, 0, 1, 1,
-0.1058325, 1.375153, 0.328701, 0, 0, 0, 1, 1,
-0.1055368, 0.4612775, 0.3831243, 0, 0, 0, 1, 1,
-0.1048972, 0.5942952, -1.361085, 0, 0, 0, 1, 1,
-0.1015432, 0.549318, 0.5114796, 0, 0, 0, 1, 1,
-0.09773108, 0.2318617, 2.352028, 0, 0, 0, 1, 1,
-0.09114935, -0.7286665, -2.970806, 0, 0, 0, 1, 1,
-0.0889665, -0.4593471, -3.418052, 0, 0, 0, 1, 1,
-0.08505954, 2.029401, -0.167202, 1, 1, 1, 1, 1,
-0.08361053, -0.9968767, -3.789067, 1, 1, 1, 1, 1,
-0.08209198, 0.3592541, 0.3099309, 1, 1, 1, 1, 1,
-0.07811673, 0.3246686, -1.370515, 1, 1, 1, 1, 1,
-0.07678975, -1.280443, -2.472309, 1, 1, 1, 1, 1,
-0.07618643, -1.911024, -3.80326, 1, 1, 1, 1, 1,
-0.07188043, 2.960747, -2.313251, 1, 1, 1, 1, 1,
-0.06663135, -0.3613815, -2.038672, 1, 1, 1, 1, 1,
-0.06585408, 2.124825, -0.4236258, 1, 1, 1, 1, 1,
-0.06543133, -0.3451313, -3.69342, 1, 1, 1, 1, 1,
-0.06335707, -0.03444301, -1.500567, 1, 1, 1, 1, 1,
-0.06074551, 1.83257, 0.753431, 1, 1, 1, 1, 1,
-0.06032494, 0.6857546, -0.3448696, 1, 1, 1, 1, 1,
-0.05300397, 1.320403, 0.4903163, 1, 1, 1, 1, 1,
-0.0508333, -0.1063901, -2.77593, 1, 1, 1, 1, 1,
-0.04930097, -0.4055138, -3.453293, 0, 0, 1, 1, 1,
-0.04852621, -0.4760534, -3.061137, 1, 0, 0, 1, 1,
-0.04681828, 1.049613, -0.2299839, 1, 0, 0, 1, 1,
-0.04591139, 0.1055706, 0.2745965, 1, 0, 0, 1, 1,
-0.04197723, 0.8124735, 1.678357, 1, 0, 0, 1, 1,
-0.03650694, 0.1725508, 0.4712658, 1, 0, 0, 1, 1,
-0.03289903, -0.6061292, -3.648469, 0, 0, 0, 1, 1,
-0.03238127, -1.179312, -3.345634, 0, 0, 0, 1, 1,
-0.02919303, 0.6288038, -0.2293432, 0, 0, 0, 1, 1,
-0.02809125, 0.6526296, -0.4362877, 0, 0, 0, 1, 1,
-0.02314763, -1.043038, -2.310899, 0, 0, 0, 1, 1,
-0.01311333, -0.7503747, -3.424256, 0, 0, 0, 1, 1,
-0.00885124, -1.577883, -3.029287, 0, 0, 0, 1, 1,
-0.008034662, 1.09703, 1.030401, 1, 1, 1, 1, 1,
-0.007432464, -0.04126915, -3.478567, 1, 1, 1, 1, 1,
0.0003665128, -0.4726577, 2.169858, 1, 1, 1, 1, 1,
0.006240495, 1.794605, -2.450607, 1, 1, 1, 1, 1,
0.0140185, 0.467195, -1.275916, 1, 1, 1, 1, 1,
0.01508896, 0.651573, 0.5420537, 1, 1, 1, 1, 1,
0.0155321, 0.1931048, 1.432713, 1, 1, 1, 1, 1,
0.01747868, 0.9144676, 1.036246, 1, 1, 1, 1, 1,
0.02040014, -0.5644016, 1.801532, 1, 1, 1, 1, 1,
0.0250944, 0.112698, -0.6187487, 1, 1, 1, 1, 1,
0.02872738, 0.7209412, 0.1366577, 1, 1, 1, 1, 1,
0.03175255, 2.293385, 0.5810371, 1, 1, 1, 1, 1,
0.03407505, 0.4451941, -0.887863, 1, 1, 1, 1, 1,
0.03970314, -0.1257997, 2.920967, 1, 1, 1, 1, 1,
0.03984668, -0.3705791, 3.752344, 1, 1, 1, 1, 1,
0.0417261, -0.3252711, 4.378136, 0, 0, 1, 1, 1,
0.04260165, -0.804539, 2.87716, 1, 0, 0, 1, 1,
0.04500498, 0.43518, -1.187066, 1, 0, 0, 1, 1,
0.04577016, -0.2327035, 2.204455, 1, 0, 0, 1, 1,
0.04919696, 0.7120529, -0.5182568, 1, 0, 0, 1, 1,
0.05469705, 0.845596, 0.3145522, 1, 0, 0, 1, 1,
0.05493135, -0.151939, 2.681257, 0, 0, 0, 1, 1,
0.05652229, -0.6222557, 1.177656, 0, 0, 0, 1, 1,
0.05759996, -0.04597862, 3.250796, 0, 0, 0, 1, 1,
0.05846493, -0.4287953, 2.921013, 0, 0, 0, 1, 1,
0.05963393, 1.865622, 0.5432245, 0, 0, 0, 1, 1,
0.06637487, 2.297942, -0.08419973, 0, 0, 0, 1, 1,
0.08272783, -0.06442986, 2.956304, 0, 0, 0, 1, 1,
0.08466608, -0.3254092, 3.455466, 1, 1, 1, 1, 1,
0.0870618, -1.598052, 4.101432, 1, 1, 1, 1, 1,
0.09153242, -1.129204, 3.122023, 1, 1, 1, 1, 1,
0.09315898, -0.2187323, 1.710047, 1, 1, 1, 1, 1,
0.1016587, 1.175938, -0.6407451, 1, 1, 1, 1, 1,
0.110188, 0.4444683, -0.5014804, 1, 1, 1, 1, 1,
0.1149746, 0.6963208, -0.2270867, 1, 1, 1, 1, 1,
0.1155797, -2.6656, 2.075589, 1, 1, 1, 1, 1,
0.1164856, -0.2362638, 2.527206, 1, 1, 1, 1, 1,
0.12153, 0.5945646, 0.4905096, 1, 1, 1, 1, 1,
0.1220646, -0.9064262, 4.440624, 1, 1, 1, 1, 1,
0.1285972, 1.725478, 1.72687, 1, 1, 1, 1, 1,
0.1291593, 0.09528695, 0.01007179, 1, 1, 1, 1, 1,
0.1302564, -0.2480463, 2.429484, 1, 1, 1, 1, 1,
0.132162, -1.224454, 2.826838, 1, 1, 1, 1, 1,
0.1367858, 1.173144, -0.7671527, 0, 0, 1, 1, 1,
0.1381612, -1.426924, 3.216742, 1, 0, 0, 1, 1,
0.141266, -2.016217, 3.621546, 1, 0, 0, 1, 1,
0.1472602, 0.1071046, 0.2249404, 1, 0, 0, 1, 1,
0.1489798, 0.3354571, 0.6618748, 1, 0, 0, 1, 1,
0.1491549, 1.847811, 1.000911, 1, 0, 0, 1, 1,
0.1548552, 2.083408, -0.3158038, 0, 0, 0, 1, 1,
0.1560687, -1.158443, 2.939398, 0, 0, 0, 1, 1,
0.1561562, -1.789485, 2.756517, 0, 0, 0, 1, 1,
0.1583612, -0.2176282, 2.224899, 0, 0, 0, 1, 1,
0.1622011, 1.6831, 1.887292, 0, 0, 0, 1, 1,
0.1635985, 0.09317328, 0.6556674, 0, 0, 0, 1, 1,
0.1639229, -0.82761, 3.216408, 0, 0, 0, 1, 1,
0.164423, -1.044603, 2.671409, 1, 1, 1, 1, 1,
0.1662619, -0.7678064, 2.241494, 1, 1, 1, 1, 1,
0.1663375, 0.2365119, 0.3420559, 1, 1, 1, 1, 1,
0.1683108, 1.308883, 2.811936e-05, 1, 1, 1, 1, 1,
0.1694967, 0.347214, -0.5489799, 1, 1, 1, 1, 1,
0.170937, 0.3460998, 1.124462, 1, 1, 1, 1, 1,
0.1782547, -0.697955, 2.489898, 1, 1, 1, 1, 1,
0.1786143, -1.023845, 1.379048, 1, 1, 1, 1, 1,
0.1790134, -0.7322831, 1.729609, 1, 1, 1, 1, 1,
0.1793556, 0.05786068, 0.8794987, 1, 1, 1, 1, 1,
0.1806307, 3.461252, 0.1700311, 1, 1, 1, 1, 1,
0.187062, 0.1279145, 1.710155, 1, 1, 1, 1, 1,
0.1871513, -0.3145655, 2.352255, 1, 1, 1, 1, 1,
0.1881768, 0.9987226, 0.165092, 1, 1, 1, 1, 1,
0.191834, -1.400097, 3.064846, 1, 1, 1, 1, 1,
0.1925935, 0.3508457, 0.4474781, 0, 0, 1, 1, 1,
0.1928842, -0.2989687, 2.907966, 1, 0, 0, 1, 1,
0.1939125, 0.8197783, 0.1206411, 1, 0, 0, 1, 1,
0.1955566, 0.5154694, 1.175148, 1, 0, 0, 1, 1,
0.1972802, -0.5229672, 1.102791, 1, 0, 0, 1, 1,
0.1977348, -1.211904, 2.949916, 1, 0, 0, 1, 1,
0.1985892, -1.508735, 0.831997, 0, 0, 0, 1, 1,
0.2025291, -0.6261986, 2.820718, 0, 0, 0, 1, 1,
0.2035542, 1.587494, 1.148875, 0, 0, 0, 1, 1,
0.203678, 0.4089774, 0.3583397, 0, 0, 0, 1, 1,
0.2100748, 1.314894, -1.730111, 0, 0, 0, 1, 1,
0.2127128, 0.02834941, 0.7369277, 0, 0, 0, 1, 1,
0.2162157, -0.06820095, 1.122872, 0, 0, 0, 1, 1,
0.218254, -0.1608743, 3.590302, 1, 1, 1, 1, 1,
0.2188195, 0.5228706, 0.3155029, 1, 1, 1, 1, 1,
0.2189084, 0.5193715, -1.043085, 1, 1, 1, 1, 1,
0.2209418, -0.07080524, 2.536057, 1, 1, 1, 1, 1,
0.2237731, -0.442681, 3.098959, 1, 1, 1, 1, 1,
0.2238823, -0.4690955, 2.748904, 1, 1, 1, 1, 1,
0.2258253, -0.9815996, 2.381525, 1, 1, 1, 1, 1,
0.2270887, 0.5710071, -0.2568171, 1, 1, 1, 1, 1,
0.2271721, -0.491115, 2.948088, 1, 1, 1, 1, 1,
0.2302769, -1.786556, 3.166332, 1, 1, 1, 1, 1,
0.2307843, -0.3652269, 3.537651, 1, 1, 1, 1, 1,
0.2330796, 1.140243, -0.09713495, 1, 1, 1, 1, 1,
0.2333105, 0.5861951, -0.1044211, 1, 1, 1, 1, 1,
0.2350061, 1.11436, 0.146841, 1, 1, 1, 1, 1,
0.2400271, -0.5301687, 1.165175, 1, 1, 1, 1, 1,
0.2405492, 0.1024986, 1.308065, 0, 0, 1, 1, 1,
0.2415015, -0.6806009, 5.457767, 1, 0, 0, 1, 1,
0.2417802, -0.3575195, 2.002369, 1, 0, 0, 1, 1,
0.2435473, 0.4505617, 1.091563, 1, 0, 0, 1, 1,
0.2468067, 0.06021482, 3.156964, 1, 0, 0, 1, 1,
0.2529435, 0.2341969, 1.711078, 1, 0, 0, 1, 1,
0.255121, 1.351251, 0.5288646, 0, 0, 0, 1, 1,
0.2595496, -0.4672259, 3.464151, 0, 0, 0, 1, 1,
0.2629253, -0.3017471, 1.201388, 0, 0, 0, 1, 1,
0.2635914, 0.2061542, -0.1958379, 0, 0, 0, 1, 1,
0.2671904, -0.1400992, 3.498502, 0, 0, 0, 1, 1,
0.2695224, -0.04617785, 1.951364, 0, 0, 0, 1, 1,
0.271863, -1.412011, 2.821692, 0, 0, 0, 1, 1,
0.2720622, 0.02560837, 1.711122, 1, 1, 1, 1, 1,
0.2723017, -1.81105, 1.982866, 1, 1, 1, 1, 1,
0.2726906, -0.1706893, 2.724766, 1, 1, 1, 1, 1,
0.2727596, -0.7330568, 2.004987, 1, 1, 1, 1, 1,
0.2751635, -0.1916927, 4.174163, 1, 1, 1, 1, 1,
0.278034, -0.04884869, 0.719772, 1, 1, 1, 1, 1,
0.2789411, -0.390773, 4.453602, 1, 1, 1, 1, 1,
0.2797604, -0.4083499, 1.72262, 1, 1, 1, 1, 1,
0.2854302, 0.6870871, 1.031624, 1, 1, 1, 1, 1,
0.2878246, -1.830136, 2.286409, 1, 1, 1, 1, 1,
0.2888819, -0.9311479, 4.123783, 1, 1, 1, 1, 1,
0.2903973, 0.7105153, 0.2173528, 1, 1, 1, 1, 1,
0.2961257, 0.713914, 2.421694, 1, 1, 1, 1, 1,
0.3006313, 0.5349334, 0.7623401, 1, 1, 1, 1, 1,
0.3054139, -0.6860854, 1.64501, 1, 1, 1, 1, 1,
0.306683, 1.828602, -0.8368431, 0, 0, 1, 1, 1,
0.3102962, -0.6676635, 4.27317, 1, 0, 0, 1, 1,
0.3109018, -0.5216876, 3.307303, 1, 0, 0, 1, 1,
0.3116079, 0.7430317, 0.7422684, 1, 0, 0, 1, 1,
0.3178944, 1.121294, -0.6060302, 1, 0, 0, 1, 1,
0.3184567, -1.101411, 2.213388, 1, 0, 0, 1, 1,
0.3200963, -1.254887, 3.907268, 0, 0, 0, 1, 1,
0.3206194, -0.8912942, 1.49634, 0, 0, 0, 1, 1,
0.3253982, 3.503178, -0.4068852, 0, 0, 0, 1, 1,
0.3290187, -0.7667053, 2.371485, 0, 0, 0, 1, 1,
0.3310897, -0.88243, 1.842054, 0, 0, 0, 1, 1,
0.3381234, -0.8482132, 4.385652, 0, 0, 0, 1, 1,
0.3459486, -1.647163, 3.785749, 0, 0, 0, 1, 1,
0.3519746, 0.3036256, 0.04807498, 1, 1, 1, 1, 1,
0.3555895, 1.232926, -0.7279657, 1, 1, 1, 1, 1,
0.3556263, 0.4884308, 1.125319, 1, 1, 1, 1, 1,
0.3631626, 0.2654509, 2.663819, 1, 1, 1, 1, 1,
0.363755, -1.73285, 3.274106, 1, 1, 1, 1, 1,
0.3677385, -0.4695538, 3.174317, 1, 1, 1, 1, 1,
0.368936, -0.7073394, 4.01001, 1, 1, 1, 1, 1,
0.3694991, -1.716005, 2.90354, 1, 1, 1, 1, 1,
0.3707577, 0.400305, -1.382259, 1, 1, 1, 1, 1,
0.3743906, -1.021256, 4.527984, 1, 1, 1, 1, 1,
0.3745643, -1.57864, 2.367816, 1, 1, 1, 1, 1,
0.3809842, -1.675123, 2.269099, 1, 1, 1, 1, 1,
0.3816709, 1.70634, -2.04831, 1, 1, 1, 1, 1,
0.3831985, 0.5497629, 0.4074028, 1, 1, 1, 1, 1,
0.3841922, 0.8460438, -0.2678613, 1, 1, 1, 1, 1,
0.3874815, 0.5458728, 0.5942379, 0, 0, 1, 1, 1,
0.3938634, -0.9964933, 4.746342, 1, 0, 0, 1, 1,
0.3944834, 0.00407514, 1.040514, 1, 0, 0, 1, 1,
0.3962865, 0.8728467, 0.1614119, 1, 0, 0, 1, 1,
0.3964794, -0.6930649, 3.808606, 1, 0, 0, 1, 1,
0.3968952, 0.2672857, 1.345682, 1, 0, 0, 1, 1,
0.3983465, 0.3158759, 0.896895, 0, 0, 0, 1, 1,
0.3983828, -2.078693, 3.661024, 0, 0, 0, 1, 1,
0.3992791, -1.948521, 4.297199, 0, 0, 0, 1, 1,
0.4015341, -0.4075104, 4.169103, 0, 0, 0, 1, 1,
0.4038061, -1.039317, 2.817466, 0, 0, 0, 1, 1,
0.4046319, 1.057122, 1.22397, 0, 0, 0, 1, 1,
0.4137621, 0.01615103, 1.213863, 0, 0, 0, 1, 1,
0.4175124, 1.091079, -1.114061, 1, 1, 1, 1, 1,
0.4181824, 0.2835892, 0.7848266, 1, 1, 1, 1, 1,
0.4257802, -0.524164, 2.462654, 1, 1, 1, 1, 1,
0.4261514, -1.250563, 2.433393, 1, 1, 1, 1, 1,
0.427889, -1.632431, 1.542731, 1, 1, 1, 1, 1,
0.429015, 0.7089003, -1.887345, 1, 1, 1, 1, 1,
0.4340382, 0.8776035, 0.511823, 1, 1, 1, 1, 1,
0.4355131, -0.5744928, 2.772192, 1, 1, 1, 1, 1,
0.4378887, 0.2545632, 0.3239141, 1, 1, 1, 1, 1,
0.4409493, 0.1992909, 0.8567429, 1, 1, 1, 1, 1,
0.4439152, 0.853677, 0.5791724, 1, 1, 1, 1, 1,
0.446144, 3.014084, 1.625117, 1, 1, 1, 1, 1,
0.4463538, -0.432958, 2.077689, 1, 1, 1, 1, 1,
0.4468023, -0.7140459, 0.5666808, 1, 1, 1, 1, 1,
0.4516374, -0.4818947, 3.366966, 1, 1, 1, 1, 1,
0.452989, -0.5014551, 2.48001, 0, 0, 1, 1, 1,
0.4557416, 0.2878425, 0.2406275, 1, 0, 0, 1, 1,
0.4559507, 1.24901, -0.5859095, 1, 0, 0, 1, 1,
0.4606449, 1.529018, 0.1694132, 1, 0, 0, 1, 1,
0.4624102, 1.352088, 0.07366262, 1, 0, 0, 1, 1,
0.4657957, 1.58655, 0.2389015, 1, 0, 0, 1, 1,
0.4658311, -1.242139, 3.703074, 0, 0, 0, 1, 1,
0.467406, 1.265486, 2.859766, 0, 0, 0, 1, 1,
0.4718514, 0.4705216, 0.621779, 0, 0, 0, 1, 1,
0.4760715, -0.3073148, 2.279975, 0, 0, 0, 1, 1,
0.4860331, -1.349686, 3.455431, 0, 0, 0, 1, 1,
0.4885867, -0.2830815, 0.7492188, 0, 0, 0, 1, 1,
0.4900316, 0.2081682, -0.676035, 0, 0, 0, 1, 1,
0.4950623, 1.050859, -0.1464394, 1, 1, 1, 1, 1,
0.4985579, 0.005017934, 0.1654912, 1, 1, 1, 1, 1,
0.5080277, -0.3710112, 2.30934, 1, 1, 1, 1, 1,
0.5081002, -0.559872, 1.522621, 1, 1, 1, 1, 1,
0.5128543, 1.156184, -0.6893538, 1, 1, 1, 1, 1,
0.5134828, 0.3311455, 1.01265, 1, 1, 1, 1, 1,
0.5146877, 0.2742755, 2.117234, 1, 1, 1, 1, 1,
0.5154434, 1.879881, -0.3713993, 1, 1, 1, 1, 1,
0.5159627, -0.4618609, 3.426923, 1, 1, 1, 1, 1,
0.5176927, -1.248717, 0.5864547, 1, 1, 1, 1, 1,
0.5227517, 0.8416126, 0.8788618, 1, 1, 1, 1, 1,
0.5264715, -1.506029, 2.978426, 1, 1, 1, 1, 1,
0.5269329, 0.6131306, 0.05278713, 1, 1, 1, 1, 1,
0.5275533, 0.819295, 0.3068892, 1, 1, 1, 1, 1,
0.5282526, -0.1184566, 1.819811, 1, 1, 1, 1, 1,
0.5289189, -0.28891, 1.60081, 0, 0, 1, 1, 1,
0.5298464, -1.235625, 4.045629, 1, 0, 0, 1, 1,
0.532621, 0.3480075, 0.8695171, 1, 0, 0, 1, 1,
0.538743, -1.80311, 3.542486, 1, 0, 0, 1, 1,
0.5395404, 0.4680794, 0.5231531, 1, 0, 0, 1, 1,
0.5417563, 0.9549295, 0.7086376, 1, 0, 0, 1, 1,
0.5421112, -0.9910478, 3.859474, 0, 0, 0, 1, 1,
0.5431007, -0.7404313, 3.552481, 0, 0, 0, 1, 1,
0.5473131, -0.1100815, 3.119904, 0, 0, 0, 1, 1,
0.5479244, 0.1938027, 1.531959, 0, 0, 0, 1, 1,
0.5501494, 0.3259293, -0.3668105, 0, 0, 0, 1, 1,
0.5541254, 0.298235, 1.557218, 0, 0, 0, 1, 1,
0.5542006, -0.9777913, 3.040192, 0, 0, 0, 1, 1,
0.5575483, 0.4302563, 0.8044046, 1, 1, 1, 1, 1,
0.5589742, 0.6704554, 2.064439, 1, 1, 1, 1, 1,
0.5623905, -0.7630306, 2.631317, 1, 1, 1, 1, 1,
0.5623961, 0.5534836, 1.007526, 1, 1, 1, 1, 1,
0.5634635, -0.2789629, 2.369064, 1, 1, 1, 1, 1,
0.5712753, -0.2233711, 3.217283, 1, 1, 1, 1, 1,
0.5717869, 0.2337649, 0.2381861, 1, 1, 1, 1, 1,
0.5722007, 0.6836461, 0.1934562, 1, 1, 1, 1, 1,
0.5835742, -0.940682, 2.525855, 1, 1, 1, 1, 1,
0.583849, 0.5151701, -0.4594965, 1, 1, 1, 1, 1,
0.5858012, -0.1473244, 1.607526, 1, 1, 1, 1, 1,
0.5949718, 0.7855688, -0.3341396, 1, 1, 1, 1, 1,
0.5986577, 0.422576, 0.6876872, 1, 1, 1, 1, 1,
0.5989072, 0.7440807, 1.379866, 1, 1, 1, 1, 1,
0.6002488, -1.507877, 3.001606, 1, 1, 1, 1, 1,
0.6019115, 0.8351936, 0.4476823, 0, 0, 1, 1, 1,
0.6039761, -0.3434087, 2.258099, 1, 0, 0, 1, 1,
0.6077762, -1.396268, 1.991455, 1, 0, 0, 1, 1,
0.6101126, 1.115291, -0.1825387, 1, 0, 0, 1, 1,
0.6130683, -0.8189491, 2.930633, 1, 0, 0, 1, 1,
0.6140769, 1.038341, 2.642195, 1, 0, 0, 1, 1,
0.6168643, 1.326314, 1.445682, 0, 0, 0, 1, 1,
0.6223849, 0.3129553, -1.070515, 0, 0, 0, 1, 1,
0.6244491, -0.3211849, 0.8315342, 0, 0, 0, 1, 1,
0.6271661, -1.097793, 2.455918, 0, 0, 0, 1, 1,
0.6346398, 1.717128, 1.820814, 0, 0, 0, 1, 1,
0.6366831, -1.321902, 1.030979, 0, 0, 0, 1, 1,
0.6391335, 0.3147232, 0.6816815, 0, 0, 0, 1, 1,
0.6415169, -0.06889314, 2.026198, 1, 1, 1, 1, 1,
0.6429173, -0.2164702, 1.255358, 1, 1, 1, 1, 1,
0.6444417, -0.8632484, 1.618431, 1, 1, 1, 1, 1,
0.649046, -0.8635653, 3.506699, 1, 1, 1, 1, 1,
0.6495757, 0.5293752, -0.06136259, 1, 1, 1, 1, 1,
0.6525767, -0.3684716, 3.752856, 1, 1, 1, 1, 1,
0.653611, 0.6660459, 1.362151, 1, 1, 1, 1, 1,
0.6543245, -1.865251, 3.578257, 1, 1, 1, 1, 1,
0.6650208, 0.5865437, -0.5367409, 1, 1, 1, 1, 1,
0.6650891, 0.4945447, -1.225728, 1, 1, 1, 1, 1,
0.6683668, 0.5405807, 0.0002220486, 1, 1, 1, 1, 1,
0.6694745, -0.8508472, 2.639468, 1, 1, 1, 1, 1,
0.6708729, 0.79918, 2.99771, 1, 1, 1, 1, 1,
0.6748511, 1.264927, 1.492599, 1, 1, 1, 1, 1,
0.6760132, 0.7108069, 0.4512084, 1, 1, 1, 1, 1,
0.6773896, 1.311527, -0.561653, 0, 0, 1, 1, 1,
0.6808581, -0.4529945, 4.923737, 1, 0, 0, 1, 1,
0.6880352, -0.6273446, 2.590809, 1, 0, 0, 1, 1,
0.6891067, 0.2209343, 1.766193, 1, 0, 0, 1, 1,
0.6899818, -1.630694, 4.980693, 1, 0, 0, 1, 1,
0.6908758, 0.2533104, 1.909891, 1, 0, 0, 1, 1,
0.6950291, 2.424964, -0.4995207, 0, 0, 0, 1, 1,
0.6953823, 0.3419465, -0.3205451, 0, 0, 0, 1, 1,
0.6957756, 0.1826616, 1.216327, 0, 0, 0, 1, 1,
0.6957798, -0.5570753, 4.074955, 0, 0, 0, 1, 1,
0.6960195, -0.1988203, 1.02199, 0, 0, 0, 1, 1,
0.699191, 1.070256, 0.4029878, 0, 0, 0, 1, 1,
0.7005138, -0.005064394, 2.542391, 0, 0, 0, 1, 1,
0.7009305, -2.350406, 2.170287, 1, 1, 1, 1, 1,
0.7058076, -1.333801, 1.899305, 1, 1, 1, 1, 1,
0.7169436, 1.565827, 2.482714, 1, 1, 1, 1, 1,
0.7207569, 1.060436, 2.166819, 1, 1, 1, 1, 1,
0.7222901, 1.346425, -0.3736241, 1, 1, 1, 1, 1,
0.724887, -2.197943, 3.823026, 1, 1, 1, 1, 1,
0.7314869, 0.3428402, 0.4728317, 1, 1, 1, 1, 1,
0.7320272, 0.9583356, 0.2474387, 1, 1, 1, 1, 1,
0.7359803, 1.251484, 0.6578569, 1, 1, 1, 1, 1,
0.7427955, 1.428922, -1.207043, 1, 1, 1, 1, 1,
0.7434339, -0.4068266, 2.936923, 1, 1, 1, 1, 1,
0.7523809, -0.7475149, 3.018205, 1, 1, 1, 1, 1,
0.7658892, 1.297331, -0.05365629, 1, 1, 1, 1, 1,
0.7660594, 0.3639074, 1.607406, 1, 1, 1, 1, 1,
0.7715988, 1.3532, 0.8403345, 1, 1, 1, 1, 1,
0.7825434, 0.5020588, 1.025127, 0, 0, 1, 1, 1,
0.7835285, -1.165363, 3.1019, 1, 0, 0, 1, 1,
0.7894372, -0.4896972, 2.043453, 1, 0, 0, 1, 1,
0.807547, -0.2329592, 2.638661, 1, 0, 0, 1, 1,
0.807964, 0.7461646, -0.342479, 1, 0, 0, 1, 1,
0.8081181, -0.01943475, 2.096769, 1, 0, 0, 1, 1,
0.8081472, -0.5082038, 2.985537, 0, 0, 0, 1, 1,
0.8250533, -0.19386, 1.2139, 0, 0, 0, 1, 1,
0.8256984, 0.1227904, 2.172436, 0, 0, 0, 1, 1,
0.8279139, 0.5644973, 0.07206467, 0, 0, 0, 1, 1,
0.8281298, 0.1540819, 3.039549, 0, 0, 0, 1, 1,
0.8287703, 0.2978001, -0.08984474, 0, 0, 0, 1, 1,
0.8296273, 0.3851215, 0.437877, 0, 0, 0, 1, 1,
0.8297202, -1.022533, 2.315573, 1, 1, 1, 1, 1,
0.8341626, -0.1973121, 2.113679, 1, 1, 1, 1, 1,
0.8343043, -0.414948, 2.513797, 1, 1, 1, 1, 1,
0.8358726, 2.937687, -0.2734121, 1, 1, 1, 1, 1,
0.8364039, 0.1643494, 1.122471, 1, 1, 1, 1, 1,
0.837609, 1.847408, -0.3261481, 1, 1, 1, 1, 1,
0.8444813, -0.4535136, 1.408128, 1, 1, 1, 1, 1,
0.8487194, -1.683273, 3.472441, 1, 1, 1, 1, 1,
0.8488003, 0.5528432, 1.239394, 1, 1, 1, 1, 1,
0.8523862, 0.3028132, -1.075554, 1, 1, 1, 1, 1,
0.8530269, 0.2338495, 2.863122, 1, 1, 1, 1, 1,
0.8542553, 0.2713662, 1.216321, 1, 1, 1, 1, 1,
0.8566259, 0.5557047, 1.640159, 1, 1, 1, 1, 1,
0.857115, 1.830709, -0.4315809, 1, 1, 1, 1, 1,
0.8578055, 1.037399, 3.206022, 1, 1, 1, 1, 1,
0.8599971, -0.9979529, 2.387505, 0, 0, 1, 1, 1,
0.8734733, -0.552381, 4.840755, 1, 0, 0, 1, 1,
0.8815968, -0.1778595, 2.742838, 1, 0, 0, 1, 1,
0.8830786, 2.246254, 2.492413, 1, 0, 0, 1, 1,
0.8899378, -0.9864445, 3.995488, 1, 0, 0, 1, 1,
0.8919212, -0.5589601, 3.281316, 1, 0, 0, 1, 1,
0.8923734, 0.9470245, -1.005628, 0, 0, 0, 1, 1,
0.9054226, -0.5646087, 1.30542, 0, 0, 0, 1, 1,
0.9143127, 1.34094, -1.486992, 0, 0, 0, 1, 1,
0.9190612, -0.2084384, 1.204722, 0, 0, 0, 1, 1,
0.9198823, 0.4821397, 1.994897, 0, 0, 0, 1, 1,
0.9201053, -1.969023, 3.569652, 0, 0, 0, 1, 1,
0.9242069, 0.5171245, 0.2279219, 0, 0, 0, 1, 1,
0.9257017, 0.4073688, 0.5976043, 1, 1, 1, 1, 1,
0.9288973, -1.761625, 0.8118071, 1, 1, 1, 1, 1,
0.9297705, 1.466198, 0.7170688, 1, 1, 1, 1, 1,
0.9308603, 0.4318892, 1.103359, 1, 1, 1, 1, 1,
0.9455015, -0.6683655, 1.405814, 1, 1, 1, 1, 1,
0.9474004, 0.6573465, 1.530966, 1, 1, 1, 1, 1,
0.9492345, 1.210693, 0.7997055, 1, 1, 1, 1, 1,
0.9627699, 1.155442, -0.2784545, 1, 1, 1, 1, 1,
0.9660659, 1.619945, 0.1709274, 1, 1, 1, 1, 1,
0.9660813, 0.2848277, 1.050807, 1, 1, 1, 1, 1,
0.9672513, -0.9163604, 2.710484, 1, 1, 1, 1, 1,
0.96847, 0.9615024, 0.06042721, 1, 1, 1, 1, 1,
0.9699344, 0.381389, 0.2790835, 1, 1, 1, 1, 1,
0.9725856, 1.558987, 1.701254, 1, 1, 1, 1, 1,
0.980619, -0.6533356, 1.635899, 1, 1, 1, 1, 1,
0.9833891, -1.664581, 4.394338, 0, 0, 1, 1, 1,
0.9846172, -0.07779646, 2.216881, 1, 0, 0, 1, 1,
0.997314, -1.321649, 2.454232, 1, 0, 0, 1, 1,
1.002307, 0.3280218, 0.9848723, 1, 0, 0, 1, 1,
1.003886, -1.662746, 3.030426, 1, 0, 0, 1, 1,
1.006276, -2.59134, 3.259902, 1, 0, 0, 1, 1,
1.011927, 0.106128, 1.810456, 0, 0, 0, 1, 1,
1.04493, -0.9287047, 2.092899, 0, 0, 0, 1, 1,
1.0452, -1.078916, 4.695646, 0, 0, 0, 1, 1,
1.055696, 0.3267733, 1.827497, 0, 0, 0, 1, 1,
1.057959, -1.927153, 3.1702, 0, 0, 0, 1, 1,
1.058941, -0.5152971, 2.098387, 0, 0, 0, 1, 1,
1.060306, 0.5951858, -0.07665817, 0, 0, 0, 1, 1,
1.060877, 0.1758732, 1.589857, 1, 1, 1, 1, 1,
1.062289, -0.1349159, 2.675269, 1, 1, 1, 1, 1,
1.065234, 0.9027725, -0.1180549, 1, 1, 1, 1, 1,
1.066871, -0.4416363, 1.827962, 1, 1, 1, 1, 1,
1.067229, 0.5270723, 1.309494, 1, 1, 1, 1, 1,
1.06769, 0.5096564, 0.9743707, 1, 1, 1, 1, 1,
1.073551, -1.012797, 2.005207, 1, 1, 1, 1, 1,
1.074385, 0.5324127, 2.4535, 1, 1, 1, 1, 1,
1.075107, 0.5841402, 1.742163, 1, 1, 1, 1, 1,
1.0752, -0.2268224, 0.7099645, 1, 1, 1, 1, 1,
1.077429, 0.7554992, 0.2651096, 1, 1, 1, 1, 1,
1.081397, -1.668063, 2.515798, 1, 1, 1, 1, 1,
1.081888, -0.02037476, 3.077561, 1, 1, 1, 1, 1,
1.085295, -1.465416, 1.471901, 1, 1, 1, 1, 1,
1.087921, -0.4246812, 1.822548, 1, 1, 1, 1, 1,
1.095686, 0.5507131, -0.5649834, 0, 0, 1, 1, 1,
1.118803, 2.186435, 0.7111686, 1, 0, 0, 1, 1,
1.130691, 1.619524, 1.401723, 1, 0, 0, 1, 1,
1.132645, 0.6008642, -0.160686, 1, 0, 0, 1, 1,
1.136512, -0.2008592, 0.880668, 1, 0, 0, 1, 1,
1.148986, 1.034809, 0.9069103, 1, 0, 0, 1, 1,
1.151151, 0.7475649, 1.879388, 0, 0, 0, 1, 1,
1.151774, -1.340005, 1.52395, 0, 0, 0, 1, 1,
1.154858, 0.6514113, 1.893878, 0, 0, 0, 1, 1,
1.155735, -1.41686, 1.788894, 0, 0, 0, 1, 1,
1.166943, -0.1333712, 1.315383, 0, 0, 0, 1, 1,
1.167143, 0.1369154, 2.570836, 0, 0, 0, 1, 1,
1.171552, -0.02127371, 0.6897404, 0, 0, 0, 1, 1,
1.179377, 0.5963233, 1.19568, 1, 1, 1, 1, 1,
1.187999, 1.336999, 1.5587, 1, 1, 1, 1, 1,
1.193928, 0.7617162, 0.5336531, 1, 1, 1, 1, 1,
1.20144, 0.5369179, 0.6749646, 1, 1, 1, 1, 1,
1.208395, -0.3499691, 2.803214, 1, 1, 1, 1, 1,
1.209033, -0.4668321, 0.2693943, 1, 1, 1, 1, 1,
1.210087, 1.132583, 1.931904, 1, 1, 1, 1, 1,
1.213692, -0.5352514, 2.270822, 1, 1, 1, 1, 1,
1.222763, 0.3403323, 2.275353, 1, 1, 1, 1, 1,
1.244017, 0.1641266, 0.238288, 1, 1, 1, 1, 1,
1.246641, -0.1789916, 1.747923, 1, 1, 1, 1, 1,
1.2483, -0.8241394, 1.722225, 1, 1, 1, 1, 1,
1.250742, -1.120601, 2.803856, 1, 1, 1, 1, 1,
1.255815, 0.5574953, 0.512647, 1, 1, 1, 1, 1,
1.271954, -1.220485, 2.059744, 1, 1, 1, 1, 1,
1.276765, -0.3933863, 0.7313676, 0, 0, 1, 1, 1,
1.28893, 0.1781795, 1.409662, 1, 0, 0, 1, 1,
1.293681, -0.4426837, 1.936459, 1, 0, 0, 1, 1,
1.300786, 0.3222354, 2.667194, 1, 0, 0, 1, 1,
1.301945, -1.872854, 1.5471, 1, 0, 0, 1, 1,
1.303552, -1.218007, 2.47129, 1, 0, 0, 1, 1,
1.310149, -0.4589152, 3.027567, 0, 0, 0, 1, 1,
1.329836, 0.1269383, 1.672398, 0, 0, 0, 1, 1,
1.331478, -0.336652, -0.4473653, 0, 0, 0, 1, 1,
1.331993, -0.2945517, 2.136468, 0, 0, 0, 1, 1,
1.337797, -0.4582963, 1.255298, 0, 0, 0, 1, 1,
1.35874, 1.216233, 1.490751, 0, 0, 0, 1, 1,
1.359563, -0.429051, 2.591423, 0, 0, 0, 1, 1,
1.370332, -0.2701629, 2.790048, 1, 1, 1, 1, 1,
1.378944, 0.218367, 0.8258799, 1, 1, 1, 1, 1,
1.386982, -1.097074, 2.905428, 1, 1, 1, 1, 1,
1.393839, 0.008516492, -0.006163939, 1, 1, 1, 1, 1,
1.394397, 0.4224831, 0.165816, 1, 1, 1, 1, 1,
1.401956, 0.3255295, -1.233731, 1, 1, 1, 1, 1,
1.406568, -1.132786, 2.542644, 1, 1, 1, 1, 1,
1.40827, -0.08174207, -0.4244213, 1, 1, 1, 1, 1,
1.411886, -0.9746436, 2.096137, 1, 1, 1, 1, 1,
1.413936, -0.02279864, 2.602417, 1, 1, 1, 1, 1,
1.418208, -0.740717, 2.17155, 1, 1, 1, 1, 1,
1.431377, 0.5540777, 1.208412, 1, 1, 1, 1, 1,
1.432165, -0.5669717, 2.307509, 1, 1, 1, 1, 1,
1.432536, 0.415659, 0.3435691, 1, 1, 1, 1, 1,
1.441973, -0.3941297, 0.4045036, 1, 1, 1, 1, 1,
1.450684, 1.535296, -0.08658447, 0, 0, 1, 1, 1,
1.475415, -1.458641, 2.769818, 1, 0, 0, 1, 1,
1.477165, 0.3900881, 1.129952, 1, 0, 0, 1, 1,
1.482762, 0.7576334, 1.596971, 1, 0, 0, 1, 1,
1.492586, -1.399505, 1.177125, 1, 0, 0, 1, 1,
1.500111, 0.2847303, 2.666862, 1, 0, 0, 1, 1,
1.506665, -1.252455, 1.722665, 0, 0, 0, 1, 1,
1.508929, 1.2881, 1.001427, 0, 0, 0, 1, 1,
1.516162, -0.7176495, 2.750172, 0, 0, 0, 1, 1,
1.518005, 0.301446, -0.6090608, 0, 0, 0, 1, 1,
1.52413, 0.0857371, 1.012619, 0, 0, 0, 1, 1,
1.526847, 0.3210582, 0.6098627, 0, 0, 0, 1, 1,
1.544673, 0.336306, 1.209549, 0, 0, 0, 1, 1,
1.551506, 1.076492, 1.229177, 1, 1, 1, 1, 1,
1.562287, -0.7397856, 2.038134, 1, 1, 1, 1, 1,
1.564733, 0.5647252, 2.299908, 1, 1, 1, 1, 1,
1.56715, 2.574939, 1.744803, 1, 1, 1, 1, 1,
1.571024, -1.25929, 2.10746, 1, 1, 1, 1, 1,
1.576869, -0.01040508, 2.029611, 1, 1, 1, 1, 1,
1.598317, 0.4852816, 1.352538, 1, 1, 1, 1, 1,
1.601162, 0.2016471, 3.464417, 1, 1, 1, 1, 1,
1.617574, -2.291861, 4.196835, 1, 1, 1, 1, 1,
1.626659, 0.3776083, 2.163148, 1, 1, 1, 1, 1,
1.653383, -1.2761, 3.218806, 1, 1, 1, 1, 1,
1.663476, 1.089323, 0.1117741, 1, 1, 1, 1, 1,
1.672004, 1.550592, 2.549303, 1, 1, 1, 1, 1,
1.674575, -0.365184, 0.7453905, 1, 1, 1, 1, 1,
1.680764, -0.7729329, 0.6557174, 1, 1, 1, 1, 1,
1.682956, 0.487245, 0.5575706, 0, 0, 1, 1, 1,
1.68312, 0.6164988, 1.412789, 1, 0, 0, 1, 1,
1.687327, -0.6251327, 1.882257, 1, 0, 0, 1, 1,
1.691161, -0.04056137, 1.269894, 1, 0, 0, 1, 1,
1.706411, 0.2387151, 0.5641918, 1, 0, 0, 1, 1,
1.710748, 0.2385294, 2.243128, 1, 0, 0, 1, 1,
1.724601, -1.376216, 1.845099, 0, 0, 0, 1, 1,
1.725506, -0.1918682, 2.084115, 0, 0, 0, 1, 1,
1.729509, -0.7814111, 0.9962047, 0, 0, 0, 1, 1,
1.729763, 1.193887, 0.5556196, 0, 0, 0, 1, 1,
1.73855, -1.072054, 1.355349, 0, 0, 0, 1, 1,
1.744916, 0.8215824, 2.450019, 0, 0, 0, 1, 1,
1.762151, -2.286836, 1.564413, 0, 0, 0, 1, 1,
1.774631, -1.050121, 1.80331, 1, 1, 1, 1, 1,
1.776211, -0.3403357, 1.324429, 1, 1, 1, 1, 1,
1.78821, -2.030564, 2.559446, 1, 1, 1, 1, 1,
1.790994, 0.7815469, 1.085943, 1, 1, 1, 1, 1,
1.791107, -0.4229586, 1.857373, 1, 1, 1, 1, 1,
1.799511, -0.02008583, 2.197394, 1, 1, 1, 1, 1,
1.806115, -0.5842376, 2.859765, 1, 1, 1, 1, 1,
1.841506, -1.529066, 3.459615, 1, 1, 1, 1, 1,
1.881471, 0.1522987, 1.266155, 1, 1, 1, 1, 1,
1.891257, 0.5075049, -0.6723015, 1, 1, 1, 1, 1,
1.896237, -0.148723, 2.182815, 1, 1, 1, 1, 1,
1.922176, -1.086157, 1.046341, 1, 1, 1, 1, 1,
1.966625, 1.225664, 1.932324, 1, 1, 1, 1, 1,
1.994893, -0.04810673, 1.862678, 1, 1, 1, 1, 1,
2.038105, -0.3442887, 0.8796198, 1, 1, 1, 1, 1,
2.043625, -0.4842995, 1.512209, 0, 0, 1, 1, 1,
2.056364, 0.3149954, 1.599543, 1, 0, 0, 1, 1,
2.069061, -0.9398775, 0.8794597, 1, 0, 0, 1, 1,
2.073934, -0.5818013, 3.054912, 1, 0, 0, 1, 1,
2.074501, -0.1145354, -0.494819, 1, 0, 0, 1, 1,
2.088436, -0.08722326, 1.441136, 1, 0, 0, 1, 1,
2.182399, 0.1284536, -0.2124511, 0, 0, 0, 1, 1,
2.216674, 0.4864465, 0.8434432, 0, 0, 0, 1, 1,
2.256014, 0.8125511, 1.795581, 0, 0, 0, 1, 1,
2.265735, -0.05567995, 3.158948, 0, 0, 0, 1, 1,
2.324728, 0.1037172, 2.585177, 0, 0, 0, 1, 1,
2.380526, -0.5946862, 0.8811697, 0, 0, 0, 1, 1,
2.410798, 0.2115083, 2.574798, 0, 0, 0, 1, 1,
2.414467, -0.2733759, 2.985365, 1, 1, 1, 1, 1,
2.506696, 0.07564687, 1.864779, 1, 1, 1, 1, 1,
2.603535, -0.6419014, 2.957016, 1, 1, 1, 1, 1,
2.639145, -0.0104688, 3.032323, 1, 1, 1, 1, 1,
2.89122, 1.449513, 0.9635513, 1, 1, 1, 1, 1,
2.913701, 0.02969702, 2.853485, 1, 1, 1, 1, 1,
4.027785, -0.2001047, 2.387932, 1, 1, 1, 1, 1
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
var radius = 10.026;
var distance = 35.21592;
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
mvMatrix.translate( -0.308053, -0.5074136, -0.2674448 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.21592);
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
