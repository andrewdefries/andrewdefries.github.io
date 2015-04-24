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
-3.588114, 1.282848, -0.6721893, 1, 0, 0, 1,
-3.390163, -0.1061352, -1.038594, 1, 0.007843138, 0, 1,
-3.267255, -0.7666137, -1.776169, 1, 0.01176471, 0, 1,
-2.654266, 0.3586674, -3.002565, 1, 0.01960784, 0, 1,
-2.633353, 1.017219, -0.1970673, 1, 0.02352941, 0, 1,
-2.485213, 1.479211, -1.882912, 1, 0.03137255, 0, 1,
-2.363648, -0.02907557, -1.336931, 1, 0.03529412, 0, 1,
-2.304082, -1.600615, -1.244415, 1, 0.04313726, 0, 1,
-2.273336, -0.2175514, -0.1649626, 1, 0.04705882, 0, 1,
-2.247327, -0.3633803, -0.9768843, 1, 0.05490196, 0, 1,
-2.200474, 1.050823, -0.6267391, 1, 0.05882353, 0, 1,
-2.195099, 2.270213, 0.4630401, 1, 0.06666667, 0, 1,
-2.194479, 1.392892, -2.493261, 1, 0.07058824, 0, 1,
-2.126628, 0.8408756, -1.854181, 1, 0.07843138, 0, 1,
-2.082922, -0.6367858, -1.523388, 1, 0.08235294, 0, 1,
-2.067227, -1.702075, -2.27815, 1, 0.09019608, 0, 1,
-2.049641, -0.5785247, -1.904966, 1, 0.09411765, 0, 1,
-2.046817, -0.8323941, -2.621381, 1, 0.1019608, 0, 1,
-2.044318, 0.8028486, -0.4814261, 1, 0.1098039, 0, 1,
-2.030402, 1.010721, 1.174273, 1, 0.1137255, 0, 1,
-2.015201, 0.1090548, -2.930134, 1, 0.1215686, 0, 1,
-1.997736, -0.5936455, -0.734926, 1, 0.1254902, 0, 1,
-1.980982, 0.6476201, 0.1123594, 1, 0.1333333, 0, 1,
-1.962809, -0.1557976, -0.7206393, 1, 0.1372549, 0, 1,
-1.962786, 1.197199, -0.7272714, 1, 0.145098, 0, 1,
-1.953834, -0.5435472, -2.41247, 1, 0.1490196, 0, 1,
-1.94263, -1.557912, -2.983419, 1, 0.1568628, 0, 1,
-1.889035, -1.105684, -1.662764, 1, 0.1607843, 0, 1,
-1.883542, -1.26131, -4.597894, 1, 0.1686275, 0, 1,
-1.882375, 0.9560737, -0.1721155, 1, 0.172549, 0, 1,
-1.873578, -1.430719, -2.261607, 1, 0.1803922, 0, 1,
-1.870777, -0.3991009, -2.737083, 1, 0.1843137, 0, 1,
-1.860461, 0.4429969, -1.221457, 1, 0.1921569, 0, 1,
-1.858578, 1.357218, -0.6950337, 1, 0.1960784, 0, 1,
-1.857479, 1.336726, -1.009138, 1, 0.2039216, 0, 1,
-1.836458, -0.1693198, -3.031189, 1, 0.2117647, 0, 1,
-1.827275, -0.8835931, -0.8695346, 1, 0.2156863, 0, 1,
-1.816518, 0.85708, -2.995966, 1, 0.2235294, 0, 1,
-1.792545, 0.2921795, -3.859547, 1, 0.227451, 0, 1,
-1.767279, -0.7801246, -2.400626, 1, 0.2352941, 0, 1,
-1.701136, -0.3497171, -2.395756, 1, 0.2392157, 0, 1,
-1.692863, 0.7140668, -0.1308726, 1, 0.2470588, 0, 1,
-1.656587, 1.543208, -0.3893984, 1, 0.2509804, 0, 1,
-1.65224, 1.244783, -1.011454, 1, 0.2588235, 0, 1,
-1.635636, -1.661153, -3.874826, 1, 0.2627451, 0, 1,
-1.613406, 0.1656269, -2.082538, 1, 0.2705882, 0, 1,
-1.604404, -0.3258406, -1.914484, 1, 0.2745098, 0, 1,
-1.604132, -1.443664, -1.563716, 1, 0.282353, 0, 1,
-1.602886, -0.4780643, -1.090348, 1, 0.2862745, 0, 1,
-1.586207, -0.1209147, -1.957993, 1, 0.2941177, 0, 1,
-1.584782, -0.07459089, -2.712645, 1, 0.3019608, 0, 1,
-1.582502, -1.149904, -2.491657, 1, 0.3058824, 0, 1,
-1.577144, 0.249214, -2.066383, 1, 0.3137255, 0, 1,
-1.576648, 0.9742756, 0.199253, 1, 0.3176471, 0, 1,
-1.574964, 0.4584201, -1.799986, 1, 0.3254902, 0, 1,
-1.57204, -0.1632195, -0.8793581, 1, 0.3294118, 0, 1,
-1.556241, 0.6410116, -2.476964, 1, 0.3372549, 0, 1,
-1.541526, -1.255946, -2.595787, 1, 0.3411765, 0, 1,
-1.540676, -0.8479242, -2.922057, 1, 0.3490196, 0, 1,
-1.53775, 0.4802625, -0.01091826, 1, 0.3529412, 0, 1,
-1.535892, 0.2783033, -2.373263, 1, 0.3607843, 0, 1,
-1.521649, -0.4677974, -1.312707, 1, 0.3647059, 0, 1,
-1.520463, -0.2854423, -1.979102, 1, 0.372549, 0, 1,
-1.500431, -0.1693863, -1.735121, 1, 0.3764706, 0, 1,
-1.487661, 0.9593146, 0.7189954, 1, 0.3843137, 0, 1,
-1.47928, -0.24532, -1.341482, 1, 0.3882353, 0, 1,
-1.468216, -0.3524468, -0.1010335, 1, 0.3960784, 0, 1,
-1.463677, 0.8702778, -2.374461, 1, 0.4039216, 0, 1,
-1.456657, 0.4604222, 0.2376647, 1, 0.4078431, 0, 1,
-1.453505, -2.103855, -2.310794, 1, 0.4156863, 0, 1,
-1.452222, 1.105429, -0.3316905, 1, 0.4196078, 0, 1,
-1.451528, -1.723555, -3.159865, 1, 0.427451, 0, 1,
-1.441709, 1.062145, -0.1877978, 1, 0.4313726, 0, 1,
-1.43933, -0.4374553, -3.411089, 1, 0.4392157, 0, 1,
-1.438482, 0.2268962, -2.067286, 1, 0.4431373, 0, 1,
-1.434522, -1.050359, -2.199157, 1, 0.4509804, 0, 1,
-1.433696, -0.6501228, -1.70806, 1, 0.454902, 0, 1,
-1.430582, -0.5648106, -2.898923, 1, 0.4627451, 0, 1,
-1.421579, -0.8263931, -1.319862, 1, 0.4666667, 0, 1,
-1.413452, 0.1002824, -0.8808191, 1, 0.4745098, 0, 1,
-1.400624, -0.1632392, -2.148868, 1, 0.4784314, 0, 1,
-1.396993, 1.973259, -1.647463, 1, 0.4862745, 0, 1,
-1.394492, 0.245657, -0.3789071, 1, 0.4901961, 0, 1,
-1.392272, 1.488246, -1.426686, 1, 0.4980392, 0, 1,
-1.391774, 0.1728738, -1.032289, 1, 0.5058824, 0, 1,
-1.380497, -0.06119974, -1.119398, 1, 0.509804, 0, 1,
-1.369029, -2.097541, -1.887689, 1, 0.5176471, 0, 1,
-1.363223, 1.295443, -0.906916, 1, 0.5215687, 0, 1,
-1.358185, -0.6943968, -2.61299, 1, 0.5294118, 0, 1,
-1.341336, 0.05190321, -1.533518, 1, 0.5333334, 0, 1,
-1.323393, 2.343498, -1.099225, 1, 0.5411765, 0, 1,
-1.322132, -0.7859657, -1.644431, 1, 0.5450981, 0, 1,
-1.320558, -0.00675328, -0.7309937, 1, 0.5529412, 0, 1,
-1.318008, -1.226606, -1.654392, 1, 0.5568628, 0, 1,
-1.316654, -0.6622854, -0.6954364, 1, 0.5647059, 0, 1,
-1.312895, -1.356746, -1.869114, 1, 0.5686275, 0, 1,
-1.300126, -0.8698296, -3.159027, 1, 0.5764706, 0, 1,
-1.291626, -0.1410751, -3.082509, 1, 0.5803922, 0, 1,
-1.289374, -1.674317, -1.49046, 1, 0.5882353, 0, 1,
-1.286662, -0.4310144, -2.548412, 1, 0.5921569, 0, 1,
-1.282589, -0.39347, -1.126616, 1, 0.6, 0, 1,
-1.281332, 0.4914232, -0.8148723, 1, 0.6078432, 0, 1,
-1.278543, -0.6523798, -1.720599, 1, 0.6117647, 0, 1,
-1.275975, 1.047656, -0.4572005, 1, 0.6196079, 0, 1,
-1.275807, 1.576282, -1.110165, 1, 0.6235294, 0, 1,
-1.271254, -1.163656, -2.985267, 1, 0.6313726, 0, 1,
-1.269546, 0.002710924, -2.343856, 1, 0.6352941, 0, 1,
-1.266787, -0.5513295, -2.808831, 1, 0.6431373, 0, 1,
-1.262798, 0.001211336, -1.942764, 1, 0.6470588, 0, 1,
-1.259117, -0.306796, -1.997348, 1, 0.654902, 0, 1,
-1.253092, 0.8319324, -0.4014245, 1, 0.6588235, 0, 1,
-1.247068, -1.053753, -3.40553, 1, 0.6666667, 0, 1,
-1.241983, -0.5167561, -1.385216, 1, 0.6705883, 0, 1,
-1.241597, -1.817996, -3.22157, 1, 0.6784314, 0, 1,
-1.236037, 0.8973278, 0.5141762, 1, 0.682353, 0, 1,
-1.23334, 1.295914, -1.39507, 1, 0.6901961, 0, 1,
-1.224259, 0.2860808, -1.135924, 1, 0.6941177, 0, 1,
-1.22034, -0.1031058, -1.49811, 1, 0.7019608, 0, 1,
-1.219195, 0.7185959, -2.592655, 1, 0.7098039, 0, 1,
-1.210961, -0.5040553, -1.678367, 1, 0.7137255, 0, 1,
-1.208521, 1.718857, 0.7990932, 1, 0.7215686, 0, 1,
-1.208209, -1.600927, -2.484526, 1, 0.7254902, 0, 1,
-1.208027, -0.003009033, -0.8805873, 1, 0.7333333, 0, 1,
-1.200485, -1.063, -2.607975, 1, 0.7372549, 0, 1,
-1.197526, -0.478092, -1.875962, 1, 0.7450981, 0, 1,
-1.195139, -1.09955, -5.222733, 1, 0.7490196, 0, 1,
-1.19346, -1.391701, -1.050683, 1, 0.7568628, 0, 1,
-1.185772, 1.584504, 0.4128513, 1, 0.7607843, 0, 1,
-1.178425, -0.3619039, -2.483095, 1, 0.7686275, 0, 1,
-1.175217, 0.5524934, -2.024934, 1, 0.772549, 0, 1,
-1.173712, 0.7623534, -0.01874153, 1, 0.7803922, 0, 1,
-1.150603, 0.458059, -1.634552, 1, 0.7843137, 0, 1,
-1.150229, -0.9486967, -3.767087, 1, 0.7921569, 0, 1,
-1.144949, 0.7519956, 0.1107573, 1, 0.7960784, 0, 1,
-1.135731, 0.3083542, -0.3623418, 1, 0.8039216, 0, 1,
-1.123455, 0.605011, -1.317074, 1, 0.8117647, 0, 1,
-1.12286, -0.2056868, -2.424115, 1, 0.8156863, 0, 1,
-1.120792, 0.04140577, -0.7158922, 1, 0.8235294, 0, 1,
-1.114354, 0.5521994, -0.9656479, 1, 0.827451, 0, 1,
-1.111009, 0.7474678, -0.4432462, 1, 0.8352941, 0, 1,
-1.110481, -0.4035171, -1.616704, 1, 0.8392157, 0, 1,
-1.108972, -1.4635, -3.335856, 1, 0.8470588, 0, 1,
-1.100145, 1.449919, 1.08171, 1, 0.8509804, 0, 1,
-1.096946, 0.01553024, -0.7791404, 1, 0.8588235, 0, 1,
-1.096178, 1.168974, -0.0877746, 1, 0.8627451, 0, 1,
-1.095211, -1.380133, -1.304141, 1, 0.8705882, 0, 1,
-1.093866, 0.1396989, -1.072972, 1, 0.8745098, 0, 1,
-1.078089, 1.00724, -1.452435, 1, 0.8823529, 0, 1,
-1.075682, -0.9730809, -1.254946, 1, 0.8862745, 0, 1,
-1.071295, -0.8024419, -2.621521, 1, 0.8941177, 0, 1,
-1.070821, 0.2668128, -1.692779, 1, 0.8980392, 0, 1,
-1.069354, -1.303157, -4.002221, 1, 0.9058824, 0, 1,
-1.068221, 1.008632, 0.7248565, 1, 0.9137255, 0, 1,
-1.067368, 1.174906, -0.4905389, 1, 0.9176471, 0, 1,
-1.066035, 0.4393344, 0.533554, 1, 0.9254902, 0, 1,
-1.065523, -0.1208762, -2.964652, 1, 0.9294118, 0, 1,
-1.062495, 1.547551, -1.063197, 1, 0.9372549, 0, 1,
-1.056884, 1.041855, -1.891868, 1, 0.9411765, 0, 1,
-1.048173, 0.003585525, -0.6045378, 1, 0.9490196, 0, 1,
-1.045514, 1.048721, -0.3000995, 1, 0.9529412, 0, 1,
-1.044793, 0.9168646, -1.323254, 1, 0.9607843, 0, 1,
-1.040562, 1.819995, -1.800344, 1, 0.9647059, 0, 1,
-1.040217, 0.7464001, -2.251657, 1, 0.972549, 0, 1,
-1.039084, 0.5275641, 0.3232289, 1, 0.9764706, 0, 1,
-1.032341, -0.07375783, -1.649155, 1, 0.9843137, 0, 1,
-1.031634, -0.6901565, -2.24746, 1, 0.9882353, 0, 1,
-1.02348, -1.040837, -3.347132, 1, 0.9960784, 0, 1,
-1.020727, 0.4748845, -1.563192, 0.9960784, 1, 0, 1,
-1.016997, 0.1364544, -1.393914, 0.9921569, 1, 0, 1,
-1.011698, -0.04225918, -0.7738447, 0.9843137, 1, 0, 1,
-1.006066, 0.2625014, -0.1266425, 0.9803922, 1, 0, 1,
-0.9914053, 0.003538055, -0.6814952, 0.972549, 1, 0, 1,
-0.9909722, 2.17667, 0.5497027, 0.9686275, 1, 0, 1,
-0.9884641, 1.418653, -0.4274689, 0.9607843, 1, 0, 1,
-0.9812296, 1.781575, 0.9125063, 0.9568627, 1, 0, 1,
-0.9528615, -0.01320298, -3.036709, 0.9490196, 1, 0, 1,
-0.9512767, -1.001206, -4.540234, 0.945098, 1, 0, 1,
-0.9480972, 0.9093061, -0.7305964, 0.9372549, 1, 0, 1,
-0.947729, -0.06608462, 0.9199077, 0.9333333, 1, 0, 1,
-0.9427034, -1.910231, -2.656725, 0.9254902, 1, 0, 1,
-0.9367101, -1.215118, -2.245488, 0.9215686, 1, 0, 1,
-0.9350835, -1.431021, -2.358377, 0.9137255, 1, 0, 1,
-0.9223934, -0.9883764, -1.733717, 0.9098039, 1, 0, 1,
-0.9171413, 1.33665, 0.3361695, 0.9019608, 1, 0, 1,
-0.9142947, -1.419319, -3.836005, 0.8941177, 1, 0, 1,
-0.9097753, -1.238912, -3.366771, 0.8901961, 1, 0, 1,
-0.9081751, 0.1651762, -1.300322, 0.8823529, 1, 0, 1,
-0.9081082, -0.6077492, -0.9421033, 0.8784314, 1, 0, 1,
-0.8949032, 0.8693364, -0.9716222, 0.8705882, 1, 0, 1,
-0.8905848, 0.6021613, -0.8525851, 0.8666667, 1, 0, 1,
-0.8798774, -0.7103918, -1.543022, 0.8588235, 1, 0, 1,
-0.8757377, 0.1236467, -3.185879, 0.854902, 1, 0, 1,
-0.8751427, 0.2793698, -1.254879, 0.8470588, 1, 0, 1,
-0.8689125, 1.548323, -1.293235, 0.8431373, 1, 0, 1,
-0.8676333, -0.8250015, -3.791045, 0.8352941, 1, 0, 1,
-0.8661806, -0.1988119, -3.280691, 0.8313726, 1, 0, 1,
-0.8660936, -1.163529, -2.24156, 0.8235294, 1, 0, 1,
-0.8621573, 0.7975384, -0.5061386, 0.8196079, 1, 0, 1,
-0.860623, 0.307403, 0.09004062, 0.8117647, 1, 0, 1,
-0.8565063, -2.423062, -3.581223, 0.8078431, 1, 0, 1,
-0.855537, 0.09592433, -2.030514, 0.8, 1, 0, 1,
-0.8480334, -2.704974, -2.52509, 0.7921569, 1, 0, 1,
-0.8436906, 0.523362, -1.609068, 0.7882353, 1, 0, 1,
-0.8427684, -1.101545, -2.952698, 0.7803922, 1, 0, 1,
-0.8398239, -0.3266066, -2.474885, 0.7764706, 1, 0, 1,
-0.8396981, 0.972817, -1.786522, 0.7686275, 1, 0, 1,
-0.8381883, -0.5628207, -2.544452, 0.7647059, 1, 0, 1,
-0.8372508, -0.3940257, -3.649442, 0.7568628, 1, 0, 1,
-0.8355038, -1.739775, -3.637004, 0.7529412, 1, 0, 1,
-0.834662, 0.1134293, 1.105462, 0.7450981, 1, 0, 1,
-0.8325716, 0.2021442, -2.036552, 0.7411765, 1, 0, 1,
-0.8272115, -1.259103, -0.7603874, 0.7333333, 1, 0, 1,
-0.823842, 0.1686532, -2.028322, 0.7294118, 1, 0, 1,
-0.8120152, 0.8541543, -1.286738, 0.7215686, 1, 0, 1,
-0.8077871, 0.1225666, -2.524892, 0.7176471, 1, 0, 1,
-0.8047854, -0.3735519, -1.694919, 0.7098039, 1, 0, 1,
-0.8011014, 0.9373508, -2.440575, 0.7058824, 1, 0, 1,
-0.7969895, 0.3431148, -1.752217, 0.6980392, 1, 0, 1,
-0.7928925, 0.5128731, 0.7262902, 0.6901961, 1, 0, 1,
-0.7794666, 1.231071, 1.09521, 0.6862745, 1, 0, 1,
-0.7722901, 1.371483, -0.959375, 0.6784314, 1, 0, 1,
-0.7716706, -0.8510258, -1.289945, 0.6745098, 1, 0, 1,
-0.7705938, -1.192214, -2.717034, 0.6666667, 1, 0, 1,
-0.7691576, -0.580953, -0.7262864, 0.6627451, 1, 0, 1,
-0.7686839, -0.8846943, -3.118395, 0.654902, 1, 0, 1,
-0.7582023, -0.535375, -3.771417, 0.6509804, 1, 0, 1,
-0.7570083, 0.9064808, 0.08340465, 0.6431373, 1, 0, 1,
-0.7560567, 0.6834243, -1.537093, 0.6392157, 1, 0, 1,
-0.7493574, 1.406225, -2.346848, 0.6313726, 1, 0, 1,
-0.7433994, -0.8877347, -2.421874, 0.627451, 1, 0, 1,
-0.7411392, -0.2939613, -0.7691944, 0.6196079, 1, 0, 1,
-0.7410572, 0.9728779, -1.133601, 0.6156863, 1, 0, 1,
-0.7381315, 0.2354952, -0.9662278, 0.6078432, 1, 0, 1,
-0.7379104, -0.6117632, -0.289962, 0.6039216, 1, 0, 1,
-0.7347121, -0.1144622, -2.690373, 0.5960785, 1, 0, 1,
-0.7332493, -0.01799159, -2.085222, 0.5882353, 1, 0, 1,
-0.7318323, -0.4537663, -1.562456, 0.5843138, 1, 0, 1,
-0.7289916, -0.1095952, 0.1015888, 0.5764706, 1, 0, 1,
-0.7284799, -0.2706861, -2.259027, 0.572549, 1, 0, 1,
-0.7225736, 0.6749728, -1.215333, 0.5647059, 1, 0, 1,
-0.7208576, -0.5340154, -2.910371, 0.5607843, 1, 0, 1,
-0.7177707, -0.7996436, -1.768325, 0.5529412, 1, 0, 1,
-0.7164436, -0.6654004, -2.648172, 0.5490196, 1, 0, 1,
-0.7126282, -1.952042, -3.219068, 0.5411765, 1, 0, 1,
-0.7052681, 0.2531513, -2.124625, 0.5372549, 1, 0, 1,
-0.6979451, 1.783387, -0.3083217, 0.5294118, 1, 0, 1,
-0.6969513, 0.7809047, -0.3603664, 0.5254902, 1, 0, 1,
-0.6962876, -0.1018752, -0.1633251, 0.5176471, 1, 0, 1,
-0.6939758, -1.58163, -2.271692, 0.5137255, 1, 0, 1,
-0.6847547, 0.2892493, -2.260817, 0.5058824, 1, 0, 1,
-0.6836421, -1.302294, -2.048948, 0.5019608, 1, 0, 1,
-0.6836379, 1.61316, -1.978893, 0.4941176, 1, 0, 1,
-0.6647018, 0.791909, -0.7127291, 0.4862745, 1, 0, 1,
-0.6620923, 0.7926494, -1.080259, 0.4823529, 1, 0, 1,
-0.6580063, -0.8021644, -3.065979, 0.4745098, 1, 0, 1,
-0.6547017, 2.129829, -0.8688599, 0.4705882, 1, 0, 1,
-0.6484361, 0.7906435, -0.9362316, 0.4627451, 1, 0, 1,
-0.6471071, -0.6865702, -1.709812, 0.4588235, 1, 0, 1,
-0.6395745, 1.376644, 0.142603, 0.4509804, 1, 0, 1,
-0.6368664, -1.161196, -3.817412, 0.4470588, 1, 0, 1,
-0.6343761, -0.1465918, -1.511751, 0.4392157, 1, 0, 1,
-0.6298004, -0.638387, -1.458246, 0.4352941, 1, 0, 1,
-0.6296018, -0.7933085, -2.340619, 0.427451, 1, 0, 1,
-0.6221461, -0.2532023, -1.262416, 0.4235294, 1, 0, 1,
-0.6220306, 0.1936982, -1.583857, 0.4156863, 1, 0, 1,
-0.6182453, 1.628252, -0.6499534, 0.4117647, 1, 0, 1,
-0.6073257, 0.4469676, -0.4438628, 0.4039216, 1, 0, 1,
-0.5996574, -1.55274, -1.611146, 0.3960784, 1, 0, 1,
-0.5955696, 0.5949214, -0.2572265, 0.3921569, 1, 0, 1,
-0.5905758, -0.9482093, -1.35866, 0.3843137, 1, 0, 1,
-0.5881926, -1.444161, -4.416008, 0.3803922, 1, 0, 1,
-0.582374, 1.762898, -1.940405, 0.372549, 1, 0, 1,
-0.5820903, -0.5474458, -2.995388, 0.3686275, 1, 0, 1,
-0.5781788, -1.352355, -4.209379, 0.3607843, 1, 0, 1,
-0.5740376, -0.03667772, -1.940034, 0.3568628, 1, 0, 1,
-0.571259, 0.869655, -0.1950115, 0.3490196, 1, 0, 1,
-0.5508261, -0.1823163, -0.2926521, 0.345098, 1, 0, 1,
-0.548762, -1.188974, -4.037584, 0.3372549, 1, 0, 1,
-0.547768, -2.097445, -1.27302, 0.3333333, 1, 0, 1,
-0.5332053, 0.5175106, -1.83091, 0.3254902, 1, 0, 1,
-0.5306373, -1.168654, -2.807119, 0.3215686, 1, 0, 1,
-0.530405, -0.3309076, -2.04372, 0.3137255, 1, 0, 1,
-0.5281653, 1.110987, 0.722455, 0.3098039, 1, 0, 1,
-0.5253869, 0.1711185, 1.132951, 0.3019608, 1, 0, 1,
-0.5215982, 0.2176547, -0.7734897, 0.2941177, 1, 0, 1,
-0.5202991, 0.4691486, 1.499595, 0.2901961, 1, 0, 1,
-0.5193196, 0.9356382, -0.9224835, 0.282353, 1, 0, 1,
-0.5190502, -1.315747, -2.561333, 0.2784314, 1, 0, 1,
-0.5154254, 2.5269, -1.268669, 0.2705882, 1, 0, 1,
-0.5113473, 0.4566351, -0.5087878, 0.2666667, 1, 0, 1,
-0.5079184, 1.563716, 0.7218793, 0.2588235, 1, 0, 1,
-0.5047116, -0.05514591, -1.564108, 0.254902, 1, 0, 1,
-0.5027446, -0.4616977, -1.632024, 0.2470588, 1, 0, 1,
-0.5017508, 1.854067, 1.606549, 0.2431373, 1, 0, 1,
-0.4977249, -0.7206442, -2.316326, 0.2352941, 1, 0, 1,
-0.4966046, 0.6740215, -0.421887, 0.2313726, 1, 0, 1,
-0.4954748, 0.02418116, -1.8849, 0.2235294, 1, 0, 1,
-0.4953067, 1.401601, 0.954951, 0.2196078, 1, 0, 1,
-0.4895129, -0.2936734, -1.971592, 0.2117647, 1, 0, 1,
-0.4893914, 1.218997, -0.4471821, 0.2078431, 1, 0, 1,
-0.4855898, -0.625524, -1.291902, 0.2, 1, 0, 1,
-0.4840638, -0.4082145, -3.342322, 0.1921569, 1, 0, 1,
-0.4826057, 1.001676, 0.9176887, 0.1882353, 1, 0, 1,
-0.4823903, 0.3847192, 0.3636115, 0.1803922, 1, 0, 1,
-0.4798375, -0.9434754, -1.675437, 0.1764706, 1, 0, 1,
-0.4762632, 1.110617, -0.5579731, 0.1686275, 1, 0, 1,
-0.4743915, -0.07479591, -1.389182, 0.1647059, 1, 0, 1,
-0.4720694, 0.8064128, 1.276632, 0.1568628, 1, 0, 1,
-0.4709388, 0.9827899, -1.280331, 0.1529412, 1, 0, 1,
-0.4676043, 0.4039332, -3.135286, 0.145098, 1, 0, 1,
-0.4651715, -1.344819, -3.471498, 0.1411765, 1, 0, 1,
-0.4565094, 0.8585886, -0.4492889, 0.1333333, 1, 0, 1,
-0.4547707, 0.6966744, 0.5262178, 0.1294118, 1, 0, 1,
-0.4531336, -0.5691513, -2.964325, 0.1215686, 1, 0, 1,
-0.4486, 0.7325793, -1.781503, 0.1176471, 1, 0, 1,
-0.4394354, -1.016916, -3.583146, 0.1098039, 1, 0, 1,
-0.436926, -0.3005144, -2.921269, 0.1058824, 1, 0, 1,
-0.436392, 0.4760364, -1.89904, 0.09803922, 1, 0, 1,
-0.4321304, -0.6182923, -3.211737, 0.09019608, 1, 0, 1,
-0.4284752, -0.01201969, -1.47625, 0.08627451, 1, 0, 1,
-0.4198508, -0.0842078, -0.3674066, 0.07843138, 1, 0, 1,
-0.4189588, -0.4199415, -1.776796, 0.07450981, 1, 0, 1,
-0.4174253, -0.578765, -1.687025, 0.06666667, 1, 0, 1,
-0.4153491, -0.2101427, -1.369379, 0.0627451, 1, 0, 1,
-0.4139087, 0.04057131, -0.04456234, 0.05490196, 1, 0, 1,
-0.4111236, -0.5425919, -4.996088, 0.05098039, 1, 0, 1,
-0.4101761, 0.3021439, -2.036238, 0.04313726, 1, 0, 1,
-0.4078418, -1.589331, -4.509024, 0.03921569, 1, 0, 1,
-0.4066828, 1.329346, -0.782486, 0.03137255, 1, 0, 1,
-0.4016504, -0.3465576, -1.954771, 0.02745098, 1, 0, 1,
-0.3924167, 0.3572613, -0.2709252, 0.01960784, 1, 0, 1,
-0.390517, -1.530983, -4.32021, 0.01568628, 1, 0, 1,
-0.3894765, 0.4092775, -1.12169, 0.007843138, 1, 0, 1,
-0.387305, -0.1713831, -3.432266, 0.003921569, 1, 0, 1,
-0.3858119, 0.9977509, -1.115952, 0, 1, 0.003921569, 1,
-0.3783778, 0.2234908, -1.598774, 0, 1, 0.01176471, 1,
-0.3771176, -1.546479, -2.479709, 0, 1, 0.01568628, 1,
-0.3744782, -2.235681, -3.739079, 0, 1, 0.02352941, 1,
-0.3733993, 0.9662675, -0.5542244, 0, 1, 0.02745098, 1,
-0.3725266, 1.459572, 1.156038, 0, 1, 0.03529412, 1,
-0.3717252, 1.285708, -0.3435129, 0, 1, 0.03921569, 1,
-0.3705843, 0.1935263, -2.180562, 0, 1, 0.04705882, 1,
-0.3701149, 1.448637, -0.9727433, 0, 1, 0.05098039, 1,
-0.3667338, -0.6779287, -1.689364, 0, 1, 0.05882353, 1,
-0.3591458, -0.3440723, -2.286491, 0, 1, 0.0627451, 1,
-0.3565133, -0.6823378, -2.334329, 0, 1, 0.07058824, 1,
-0.351162, -0.2756859, -4.2441, 0, 1, 0.07450981, 1,
-0.3510538, 0.9047843, -0.329058, 0, 1, 0.08235294, 1,
-0.3505645, -1.043575, -2.592712, 0, 1, 0.08627451, 1,
-0.3457884, -1.633687, -1.460977, 0, 1, 0.09411765, 1,
-0.3457594, -0.7055492, -2.761524, 0, 1, 0.1019608, 1,
-0.3445321, -0.1988392, -1.507378, 0, 1, 0.1058824, 1,
-0.3439333, 0.4559177, -0.08338569, 0, 1, 0.1137255, 1,
-0.3437128, -0.1104609, -0.8313935, 0, 1, 0.1176471, 1,
-0.336729, 0.2305704, -1.08696, 0, 1, 0.1254902, 1,
-0.3342987, 0.6836336, -0.3276394, 0, 1, 0.1294118, 1,
-0.3335481, 0.4209152, -1.149632, 0, 1, 0.1372549, 1,
-0.3326943, 0.5170756, 0.4081027, 0, 1, 0.1411765, 1,
-0.3306939, 0.7391753, -1.893372, 0, 1, 0.1490196, 1,
-0.3257493, 0.0131829, -1.931037, 0, 1, 0.1529412, 1,
-0.3227158, -0.2992052, -1.585788, 0, 1, 0.1607843, 1,
-0.3220199, -1.07663, -2.401139, 0, 1, 0.1647059, 1,
-0.319779, 0.1215984, -2.221461, 0, 1, 0.172549, 1,
-0.3162894, -0.6027122, -1.84162, 0, 1, 0.1764706, 1,
-0.3159112, 0.361267, -1.124287, 0, 1, 0.1843137, 1,
-0.3112114, 0.2850396, -0.4614783, 0, 1, 0.1882353, 1,
-0.3106568, 0.7559188, 0.03742628, 0, 1, 0.1960784, 1,
-0.3097916, 0.7604918, 0.2645386, 0, 1, 0.2039216, 1,
-0.3095075, -0.3725538, -2.480015, 0, 1, 0.2078431, 1,
-0.3046022, -1.932333, -2.792965, 0, 1, 0.2156863, 1,
-0.3037585, 0.53759, 0.06722432, 0, 1, 0.2196078, 1,
-0.3008646, -0.03260933, -2.742148, 0, 1, 0.227451, 1,
-0.2913571, 1.907601, -1.012462, 0, 1, 0.2313726, 1,
-0.2910189, 1.476941, -0.3122306, 0, 1, 0.2392157, 1,
-0.2871673, -0.3878927, -1.654169, 0, 1, 0.2431373, 1,
-0.2867209, -2.050716, -3.262863, 0, 1, 0.2509804, 1,
-0.2859389, 0.03149695, -1.441934, 0, 1, 0.254902, 1,
-0.2815793, 0.01325641, -1.159776, 0, 1, 0.2627451, 1,
-0.2806175, 0.6348072, 0.3996151, 0, 1, 0.2666667, 1,
-0.2796885, 0.5012296, -0.6288488, 0, 1, 0.2745098, 1,
-0.2712447, -1.419021, -1.820978, 0, 1, 0.2784314, 1,
-0.2698863, 0.3754898, -0.8355745, 0, 1, 0.2862745, 1,
-0.2696433, 0.429371, -0.1034124, 0, 1, 0.2901961, 1,
-0.2685353, 0.1473993, -0.9795792, 0, 1, 0.2980392, 1,
-0.2635955, -0.8389656, -3.67749, 0, 1, 0.3058824, 1,
-0.2577999, -0.6558546, -1.648177, 0, 1, 0.3098039, 1,
-0.2565261, 2.323439, -1.388939, 0, 1, 0.3176471, 1,
-0.2565162, -0.9585121, -5.885184, 0, 1, 0.3215686, 1,
-0.2515861, -0.6113152, -1.960999, 0, 1, 0.3294118, 1,
-0.2500581, 1.551487, 0.6815916, 0, 1, 0.3333333, 1,
-0.2496507, -1.4025, -3.733197, 0, 1, 0.3411765, 1,
-0.2460594, 0.1302854, 1.119661, 0, 1, 0.345098, 1,
-0.2440765, -1.636572, -3.419988, 0, 1, 0.3529412, 1,
-0.243364, -0.6725367, -2.588024, 0, 1, 0.3568628, 1,
-0.2410921, -0.5598362, -0.8559507, 0, 1, 0.3647059, 1,
-0.2368763, -1.648335, -1.023161, 0, 1, 0.3686275, 1,
-0.2354126, -0.2950467, -1.902433, 0, 1, 0.3764706, 1,
-0.2352002, -0.6019574, -2.821706, 0, 1, 0.3803922, 1,
-0.235163, 0.1528883, -0.3898466, 0, 1, 0.3882353, 1,
-0.2322774, 0.6594954, 0.07416082, 0, 1, 0.3921569, 1,
-0.231753, 0.5744595, 1.120055, 0, 1, 0.4, 1,
-0.2310941, -0.5843759, -2.300855, 0, 1, 0.4078431, 1,
-0.2309417, -0.04190769, -2.097857, 0, 1, 0.4117647, 1,
-0.2286876, -1.9326, -2.82355, 0, 1, 0.4196078, 1,
-0.2237076, -0.8613114, -1.828955, 0, 1, 0.4235294, 1,
-0.2191866, -0.2657393, -3.212785, 0, 1, 0.4313726, 1,
-0.2187564, 0.293826, 0.1869579, 0, 1, 0.4352941, 1,
-0.2152302, 0.140464, 1.011205, 0, 1, 0.4431373, 1,
-0.2129002, 0.740577, -1.342601, 0, 1, 0.4470588, 1,
-0.2118926, 0.9438451, -0.467607, 0, 1, 0.454902, 1,
-0.209819, 0.4044976, -0.8659115, 0, 1, 0.4588235, 1,
-0.208134, 0.9510172, -2.609885, 0, 1, 0.4666667, 1,
-0.2076353, 0.4926832, 0.9865987, 0, 1, 0.4705882, 1,
-0.2066955, -1.079423, -3.69086, 0, 1, 0.4784314, 1,
-0.2065479, 0.5728188, 0.3117969, 0, 1, 0.4823529, 1,
-0.2044631, -0.285338, -1.099036, 0, 1, 0.4901961, 1,
-0.20412, -0.8538139, -4.065217, 0, 1, 0.4941176, 1,
-0.2028289, 0.8301821, -1.779527, 0, 1, 0.5019608, 1,
-0.1983723, 0.1421684, -1.25098, 0, 1, 0.509804, 1,
-0.1946351, 1.575764, -0.1488406, 0, 1, 0.5137255, 1,
-0.1880848, -0.9146495, -1.257203, 0, 1, 0.5215687, 1,
-0.177573, 1.32347, 0.3810072, 0, 1, 0.5254902, 1,
-0.1718012, 0.3155876, -1.176862, 0, 1, 0.5333334, 1,
-0.1663833, -0.03445765, -1.138648, 0, 1, 0.5372549, 1,
-0.1632102, -0.7224095, -3.777944, 0, 1, 0.5450981, 1,
-0.1570295, -0.2638973, -1.594664, 0, 1, 0.5490196, 1,
-0.1559482, 1.397139, 0.3270768, 0, 1, 0.5568628, 1,
-0.1554586, 0.6624718, 0.1087473, 0, 1, 0.5607843, 1,
-0.1474553, -1.752974, -3.410707, 0, 1, 0.5686275, 1,
-0.1466014, -0.8836981, -4.016037, 0, 1, 0.572549, 1,
-0.1437356, 0.7281766, -1.173218, 0, 1, 0.5803922, 1,
-0.1433496, 1.597919, 0.6425297, 0, 1, 0.5843138, 1,
-0.142954, -0.3406314, -3.683605, 0, 1, 0.5921569, 1,
-0.1419606, -0.2352166, -2.863455, 0, 1, 0.5960785, 1,
-0.1417155, -0.06048118, 0.004625109, 0, 1, 0.6039216, 1,
-0.1412443, -0.1611445, -2.13258, 0, 1, 0.6117647, 1,
-0.1382748, 0.05886033, -1.599348, 0, 1, 0.6156863, 1,
-0.1362141, 0.555284, -0.7563962, 0, 1, 0.6235294, 1,
-0.1344963, -1.855069, -3.098727, 0, 1, 0.627451, 1,
-0.1317848, -1.199601, -4.212467, 0, 1, 0.6352941, 1,
-0.126171, 0.1264472, -1.310418, 0, 1, 0.6392157, 1,
-0.1232503, 0.409149, -0.08384798, 0, 1, 0.6470588, 1,
-0.1164273, 0.901803, 1.565439, 0, 1, 0.6509804, 1,
-0.1147384, 1.3855, -0.9076589, 0, 1, 0.6588235, 1,
-0.1049612, -1.024509, -1.961421, 0, 1, 0.6627451, 1,
-0.1044509, 1.344255, -0.5359753, 0, 1, 0.6705883, 1,
-0.1034703, 0.8412089, -0.1018898, 0, 1, 0.6745098, 1,
-0.100697, -0.4255074, -3.851552, 0, 1, 0.682353, 1,
-0.0992263, 0.8107397, -0.5513505, 0, 1, 0.6862745, 1,
-0.09740185, 0.4957362, -0.7258589, 0, 1, 0.6941177, 1,
-0.09686475, -1.244556, -2.718251, 0, 1, 0.7019608, 1,
-0.09673756, -1.352426, -3.626466, 0, 1, 0.7058824, 1,
-0.09578719, 0.5426115, 0.3986113, 0, 1, 0.7137255, 1,
-0.08503976, 0.7199323, -1.619478, 0, 1, 0.7176471, 1,
-0.08470776, -0.4959579, -2.894629, 0, 1, 0.7254902, 1,
-0.08403084, -1.531696, -0.5665536, 0, 1, 0.7294118, 1,
-0.08281409, 0.05540434, -1.940789, 0, 1, 0.7372549, 1,
-0.08230635, -1.283168, -2.09257, 0, 1, 0.7411765, 1,
-0.07470509, -1.443033, -3.758303, 0, 1, 0.7490196, 1,
-0.0736839, -0.05019909, -2.193231, 0, 1, 0.7529412, 1,
-0.07105522, -0.003745995, -3.883363, 0, 1, 0.7607843, 1,
-0.06901, -0.4112101, -1.543818, 0, 1, 0.7647059, 1,
-0.06869031, -0.4255556, -2.921359, 0, 1, 0.772549, 1,
-0.06706608, -0.3004141, -3.521125, 0, 1, 0.7764706, 1,
-0.06358393, -2.919011, -4.311719, 0, 1, 0.7843137, 1,
-0.06309825, 0.4816348, -0.3019269, 0, 1, 0.7882353, 1,
-0.05860354, -0.05211869, -3.680613, 0, 1, 0.7960784, 1,
-0.05651284, -0.1767955, -3.379988, 0, 1, 0.8039216, 1,
-0.05313986, -0.9518117, -4.617869, 0, 1, 0.8078431, 1,
-0.05225186, 0.357518, 0.279909, 0, 1, 0.8156863, 1,
-0.05147568, 1.057615, -0.4755911, 0, 1, 0.8196079, 1,
-0.04606462, -0.1039345, -1.855858, 0, 1, 0.827451, 1,
-0.04565111, -0.8821828, -5.4017, 0, 1, 0.8313726, 1,
-0.04407816, 2.171716, 0.3740304, 0, 1, 0.8392157, 1,
-0.03740674, -0.6690568, -1.813729, 0, 1, 0.8431373, 1,
-0.03642746, 0.3274984, -1.027942, 0, 1, 0.8509804, 1,
-0.03366918, -0.9361737, -2.530489, 0, 1, 0.854902, 1,
-0.03362678, -1.44589, -4.590425, 0, 1, 0.8627451, 1,
-0.02915088, -0.3404834, -4.071004, 0, 1, 0.8666667, 1,
-0.02752161, 0.495766, -0.2952892, 0, 1, 0.8745098, 1,
-0.0228701, -1.223821, -3.75131, 0, 1, 0.8784314, 1,
-0.01483047, 0.1959698, -0.675633, 0, 1, 0.8862745, 1,
-0.01383108, -0.8515784, -0.6547616, 0, 1, 0.8901961, 1,
-0.01207344, -0.801732, -3.919312, 0, 1, 0.8980392, 1,
-0.01153566, 1.013649, 1.846291, 0, 1, 0.9058824, 1,
-0.009794747, -0.1405029, -3.070855, 0, 1, 0.9098039, 1,
-0.008847536, -0.9248823, -4.737022, 0, 1, 0.9176471, 1,
-0.007088252, 0.6367263, -0.6324663, 0, 1, 0.9215686, 1,
-0.006232494, -0.06644404, -2.461372, 0, 1, 0.9294118, 1,
-0.004149384, 0.265914, 0.7446613, 0, 1, 0.9333333, 1,
0.006008791, 0.6749151, 0.1782439, 0, 1, 0.9411765, 1,
0.01000368, 1.8615, 1.433645, 0, 1, 0.945098, 1,
0.01498981, 1.30148, 0.5966343, 0, 1, 0.9529412, 1,
0.01499604, -0.845309, 2.859818, 0, 1, 0.9568627, 1,
0.03037448, -1.726328, 2.638016, 0, 1, 0.9647059, 1,
0.03063162, -0.2496188, 3.228984, 0, 1, 0.9686275, 1,
0.03432109, 0.1902991, 0.2480968, 0, 1, 0.9764706, 1,
0.03642798, 0.2311393, -0.9450205, 0, 1, 0.9803922, 1,
0.04092181, -0.2401383, 4.632684, 0, 1, 0.9882353, 1,
0.04193598, 0.6798099, 0.3174772, 0, 1, 0.9921569, 1,
0.04285379, -1.148938, 1.88582, 0, 1, 1, 1,
0.04400779, -1.00953, 2.125164, 0, 0.9921569, 1, 1,
0.04629099, -0.5774488, 3.263077, 0, 0.9882353, 1, 1,
0.04713262, 2.161691, -1.134349, 0, 0.9803922, 1, 1,
0.04803257, 0.2421277, 1.45655, 0, 0.9764706, 1, 1,
0.04951987, -0.9101038, 3.847831, 0, 0.9686275, 1, 1,
0.05383018, 1.51155, 2.542557, 0, 0.9647059, 1, 1,
0.0556406, 0.1487429, -0.4958819, 0, 0.9568627, 1, 1,
0.05654304, -0.01832871, 0.272445, 0, 0.9529412, 1, 1,
0.05892714, 0.6390725, -0.9741137, 0, 0.945098, 1, 1,
0.06089104, 0.5046819, -1.727012, 0, 0.9411765, 1, 1,
0.06216051, 0.3022271, -0.939528, 0, 0.9333333, 1, 1,
0.06534749, -0.100069, 3.67774, 0, 0.9294118, 1, 1,
0.07262904, 0.4539642, 1.222765, 0, 0.9215686, 1, 1,
0.07863145, -0.4787057, 2.575012, 0, 0.9176471, 1, 1,
0.08777586, -0.7403368, 2.358066, 0, 0.9098039, 1, 1,
0.0883809, 1.168764, 2.724185, 0, 0.9058824, 1, 1,
0.088992, 3.273356, 1.697614, 0, 0.8980392, 1, 1,
0.09841166, -1.226715, 3.230128, 0, 0.8901961, 1, 1,
0.1006903, 0.8083733, -1.609607, 0, 0.8862745, 1, 1,
0.1027274, 0.05041203, 0.5097083, 0, 0.8784314, 1, 1,
0.1073827, 0.01186689, 3.669602, 0, 0.8745098, 1, 1,
0.1092938, 0.1696343, -0.1482624, 0, 0.8666667, 1, 1,
0.118258, -0.3553917, 4.311057, 0, 0.8627451, 1, 1,
0.119694, -1.860692, 4.335076, 0, 0.854902, 1, 1,
0.1198377, -1.445916, 3.240223, 0, 0.8509804, 1, 1,
0.1203536, 0.531513, -1.331133, 0, 0.8431373, 1, 1,
0.1204846, 0.1109472, 1.785767, 0, 0.8392157, 1, 1,
0.1260998, 0.1384848, 0.4469829, 0, 0.8313726, 1, 1,
0.1272143, -0.184882, 2.360061, 0, 0.827451, 1, 1,
0.1297502, 0.1652571, -0.1543048, 0, 0.8196079, 1, 1,
0.1322661, -1.459221, 2.71489, 0, 0.8156863, 1, 1,
0.1329099, 1.681906, -0.8019671, 0, 0.8078431, 1, 1,
0.1330019, 0.4702318, 0.1382299, 0, 0.8039216, 1, 1,
0.1343119, 1.636765, -0.9097733, 0, 0.7960784, 1, 1,
0.1405561, -0.3454818, 0.85485, 0, 0.7882353, 1, 1,
0.1436842, 0.4301187, -0.6146273, 0, 0.7843137, 1, 1,
0.1531956, -0.326515, 2.409212, 0, 0.7764706, 1, 1,
0.1537541, 0.7521014, 0.02349175, 0, 0.772549, 1, 1,
0.1604567, 0.3096248, 1.212873, 0, 0.7647059, 1, 1,
0.1653055, -0.8240552, 2.00539, 0, 0.7607843, 1, 1,
0.1655644, 0.4540132, 0.4488769, 0, 0.7529412, 1, 1,
0.17148, -0.1766293, 3.72996, 0, 0.7490196, 1, 1,
0.1792054, 0.2505076, 1.522413, 0, 0.7411765, 1, 1,
0.1810888, 2.207581, -1.130365, 0, 0.7372549, 1, 1,
0.1833421, -0.05078197, 0.1571965, 0, 0.7294118, 1, 1,
0.186177, -1.677765, 2.818834, 0, 0.7254902, 1, 1,
0.1872659, -0.5851596, 2.347321, 0, 0.7176471, 1, 1,
0.1883843, -0.2383508, 1.865649, 0, 0.7137255, 1, 1,
0.1887646, 0.7537113, -0.3271423, 0, 0.7058824, 1, 1,
0.1889099, -1.234066, 2.113652, 0, 0.6980392, 1, 1,
0.1891271, -2.744739, 1.905042, 0, 0.6941177, 1, 1,
0.1926604, 0.6647569, 0.5985507, 0, 0.6862745, 1, 1,
0.1927329, -0.7132943, 3.921139, 0, 0.682353, 1, 1,
0.2065983, 0.1370364, -0.3019579, 0, 0.6745098, 1, 1,
0.2109815, -0.6914665, 2.573123, 0, 0.6705883, 1, 1,
0.2147346, 0.09089307, 1.541721, 0, 0.6627451, 1, 1,
0.2160957, 1.307453, 1.58715, 0, 0.6588235, 1, 1,
0.2177152, 1.766989, -1.29379, 0, 0.6509804, 1, 1,
0.2186629, -0.3460152, 3.472153, 0, 0.6470588, 1, 1,
0.2188574, -1.230084, 2.968643, 0, 0.6392157, 1, 1,
0.2203808, -0.9612649, 3.488371, 0, 0.6352941, 1, 1,
0.2210674, -0.247671, 3.373822, 0, 0.627451, 1, 1,
0.2218151, -2.233583, 2.472211, 0, 0.6235294, 1, 1,
0.2253544, -0.3620861, 2.555951, 0, 0.6156863, 1, 1,
0.2264076, 0.3310288, 2.106291, 0, 0.6117647, 1, 1,
0.2287316, -0.3616194, 0.6759844, 0, 0.6039216, 1, 1,
0.2314807, -2.132135, 4.052031, 0, 0.5960785, 1, 1,
0.2323167, -0.194106, 1.768371, 0, 0.5921569, 1, 1,
0.2325169, 0.9677598, 0.01787792, 0, 0.5843138, 1, 1,
0.234533, -1.620281, 4.102597, 0, 0.5803922, 1, 1,
0.2348683, -0.5512146, 3.237941, 0, 0.572549, 1, 1,
0.2380046, 0.4812824, 2.713677, 0, 0.5686275, 1, 1,
0.2448302, -0.9207093, 1.699723, 0, 0.5607843, 1, 1,
0.2466539, -1.687277, 2.951617, 0, 0.5568628, 1, 1,
0.2516143, -2.249401, 3.395432, 0, 0.5490196, 1, 1,
0.2609663, 0.2181144, 1.215755, 0, 0.5450981, 1, 1,
0.2620521, -1.50335, 3.311327, 0, 0.5372549, 1, 1,
0.2622919, -1.211829, 3.228248, 0, 0.5333334, 1, 1,
0.264539, -1.064694, 2.610985, 0, 0.5254902, 1, 1,
0.2675617, 1.886025, 0.4801024, 0, 0.5215687, 1, 1,
0.2685852, -0.5215335, 1.052173, 0, 0.5137255, 1, 1,
0.2686343, -0.2684066, 1.427058, 0, 0.509804, 1, 1,
0.2730141, 0.9606802, 0.08109292, 0, 0.5019608, 1, 1,
0.2733142, 0.6748589, 1.312676, 0, 0.4941176, 1, 1,
0.2736346, -1.195057, 3.734112, 0, 0.4901961, 1, 1,
0.2788592, -0.1222114, 1.234711, 0, 0.4823529, 1, 1,
0.282139, 0.6964452, 0.07221214, 0, 0.4784314, 1, 1,
0.2835595, 1.726134, 2.068999, 0, 0.4705882, 1, 1,
0.2847308, 0.4213021, 0.1726789, 0, 0.4666667, 1, 1,
0.2881546, -0.08364351, 0.9867102, 0, 0.4588235, 1, 1,
0.2883031, -0.07082178, 3.05545, 0, 0.454902, 1, 1,
0.288438, -1.389615, 3.309373, 0, 0.4470588, 1, 1,
0.2913093, -1.352345, 3.25616, 0, 0.4431373, 1, 1,
0.2915181, 1.351844, 0.4459726, 0, 0.4352941, 1, 1,
0.2938346, 0.2555377, 2.607112, 0, 0.4313726, 1, 1,
0.2939061, 0.1596218, -0.02799574, 0, 0.4235294, 1, 1,
0.2960301, 0.01718565, -0.816321, 0, 0.4196078, 1, 1,
0.2961558, 0.4371334, 0.4330181, 0, 0.4117647, 1, 1,
0.3012729, 0.7327668, -1.038462, 0, 0.4078431, 1, 1,
0.3061301, 0.09827012, 0.4331013, 0, 0.4, 1, 1,
0.3065246, -0.4080925, 3.092369, 0, 0.3921569, 1, 1,
0.3117694, -0.8166866, 1.837214, 0, 0.3882353, 1, 1,
0.3138721, 0.5977783, 0.6812437, 0, 0.3803922, 1, 1,
0.3170623, -0.5448306, 1.402352, 0, 0.3764706, 1, 1,
0.3225433, 0.2811197, 1.929632, 0, 0.3686275, 1, 1,
0.3226593, 0.625975, 0.8540535, 0, 0.3647059, 1, 1,
0.3249981, -0.3931405, 1.825639, 0, 0.3568628, 1, 1,
0.3253604, -0.8794876, 2.650657, 0, 0.3529412, 1, 1,
0.3300805, -0.02607751, 2.190434, 0, 0.345098, 1, 1,
0.3305597, 0.2288334, 1.287771, 0, 0.3411765, 1, 1,
0.3361225, 0.2359229, 1.795354, 0, 0.3333333, 1, 1,
0.3390512, -0.1912889, 1.679454, 0, 0.3294118, 1, 1,
0.3399601, 0.7801486, -0.5470473, 0, 0.3215686, 1, 1,
0.3457703, -1.135472, 3.546701, 0, 0.3176471, 1, 1,
0.3480898, -1.435971, 4.738796, 0, 0.3098039, 1, 1,
0.3524956, 0.2580738, 2.054712, 0, 0.3058824, 1, 1,
0.3527164, 0.9554644, 0.2322912, 0, 0.2980392, 1, 1,
0.3533169, 0.1685915, 1.627331, 0, 0.2901961, 1, 1,
0.3537404, -0.973249, 2.575232, 0, 0.2862745, 1, 1,
0.35379, 0.9676129, -0.3370047, 0, 0.2784314, 1, 1,
0.3567131, 1.509063, 0.7676439, 0, 0.2745098, 1, 1,
0.3605725, 0.4578952, 0.007425017, 0, 0.2666667, 1, 1,
0.360903, 0.3928985, 1.123268, 0, 0.2627451, 1, 1,
0.3614277, 0.3740002, -0.09372181, 0, 0.254902, 1, 1,
0.361772, 0.1249385, 2.142863, 0, 0.2509804, 1, 1,
0.3656789, 1.199597, 2.101311, 0, 0.2431373, 1, 1,
0.3664426, -0.8289235, 3.130515, 0, 0.2392157, 1, 1,
0.3685492, -0.445268, 2.980002, 0, 0.2313726, 1, 1,
0.3721494, -1.853698, 3.369298, 0, 0.227451, 1, 1,
0.3736946, 1.583497, -1.609518, 0, 0.2196078, 1, 1,
0.3748465, 0.6899355, -0.8373582, 0, 0.2156863, 1, 1,
0.3776369, 0.7473344, 0.4071768, 0, 0.2078431, 1, 1,
0.378231, -0.4485099, 0.7964553, 0, 0.2039216, 1, 1,
0.3803842, 0.04172363, 1.825464, 0, 0.1960784, 1, 1,
0.381986, -1.689789, 3.00293, 0, 0.1882353, 1, 1,
0.3820694, -0.935652, 2.732625, 0, 0.1843137, 1, 1,
0.386224, 0.4235614, 0.396053, 0, 0.1764706, 1, 1,
0.3862805, 0.7299536, -0.237305, 0, 0.172549, 1, 1,
0.387351, 1.699707, 1.210776, 0, 0.1647059, 1, 1,
0.3883564, -0.1391508, 2.470792, 0, 0.1607843, 1, 1,
0.3968086, -0.3780675, 1.801517, 0, 0.1529412, 1, 1,
0.3984896, -0.5272547, 4.154533, 0, 0.1490196, 1, 1,
0.4029659, -0.02640994, 0.8266982, 0, 0.1411765, 1, 1,
0.4042637, 1.008969, -0.2371658, 0, 0.1372549, 1, 1,
0.4049241, -0.05009168, 0.9483958, 0, 0.1294118, 1, 1,
0.4049555, -1.361055, 2.395729, 0, 0.1254902, 1, 1,
0.4054826, -1.008584, 3.791745, 0, 0.1176471, 1, 1,
0.4070973, -2.174387, 2.059606, 0, 0.1137255, 1, 1,
0.4117704, -2.961552, 2.251596, 0, 0.1058824, 1, 1,
0.4157486, -1.474248, 3.989253, 0, 0.09803922, 1, 1,
0.4163666, -0.06799633, 1.330995, 0, 0.09411765, 1, 1,
0.4203552, 0.3492405, 0.01360742, 0, 0.08627451, 1, 1,
0.421667, 0.655793, -0.6146149, 0, 0.08235294, 1, 1,
0.421734, 0.8697414, -0.6594149, 0, 0.07450981, 1, 1,
0.4219901, -0.8899815, 3.338728, 0, 0.07058824, 1, 1,
0.4220737, 1.364771, -0.9538857, 0, 0.0627451, 1, 1,
0.4224121, 1.813474, -0.7724487, 0, 0.05882353, 1, 1,
0.42949, -0.2473276, 1.121896, 0, 0.05098039, 1, 1,
0.4302879, 0.04850759, -0.2203333, 0, 0.04705882, 1, 1,
0.4321534, 0.5696588, 0.9186995, 0, 0.03921569, 1, 1,
0.4361358, 0.3068486, 0.4537421, 0, 0.03529412, 1, 1,
0.4370825, 0.1917073, -0.3104906, 0, 0.02745098, 1, 1,
0.4387562, 0.42055, 1.66447, 0, 0.02352941, 1, 1,
0.4409235, 0.7808603, -0.4565655, 0, 0.01568628, 1, 1,
0.442281, -0.880847, 1.364947, 0, 0.01176471, 1, 1,
0.4459376, 0.9559373, 0.9280096, 0, 0.003921569, 1, 1,
0.4487768, 0.8375614, 1.22912, 0.003921569, 0, 1, 1,
0.4488013, -1.929504, 1.707878, 0.007843138, 0, 1, 1,
0.4496135, -1.787438, 1.535182, 0.01568628, 0, 1, 1,
0.4518096, 0.7430364, 1.638619, 0.01960784, 0, 1, 1,
0.4578798, 0.1240794, 0.8552261, 0.02745098, 0, 1, 1,
0.4586304, 1.152437, 0.7388611, 0.03137255, 0, 1, 1,
0.4612235, 0.3130243, 1.040836, 0.03921569, 0, 1, 1,
0.4652417, -0.5295873, 2.040513, 0.04313726, 0, 1, 1,
0.4689139, -0.6085482, 2.890452, 0.05098039, 0, 1, 1,
0.469154, 1.883336, -0.5452349, 0.05490196, 0, 1, 1,
0.470853, 1.202806, 1.124768, 0.0627451, 0, 1, 1,
0.4713673, -1.218337, 3.094197, 0.06666667, 0, 1, 1,
0.4731394, 0.6920052, -0.278769, 0.07450981, 0, 1, 1,
0.4741246, 0.1175315, 2.751405, 0.07843138, 0, 1, 1,
0.4812135, -0.3236115, 2.113713, 0.08627451, 0, 1, 1,
0.4814696, 1.447739, 1.681927, 0.09019608, 0, 1, 1,
0.4824388, -1.625359, 4.377892, 0.09803922, 0, 1, 1,
0.4830539, -0.9217203, 3.079604, 0.1058824, 0, 1, 1,
0.4873026, -0.007744079, 2.040861, 0.1098039, 0, 1, 1,
0.4888359, 0.7673522, 2.66103, 0.1176471, 0, 1, 1,
0.4902328, 1.740497, 1.713136, 0.1215686, 0, 1, 1,
0.5005209, -1.158805, 3.636407, 0.1294118, 0, 1, 1,
0.5014431, -1.00128, 3.775212, 0.1333333, 0, 1, 1,
0.5027708, 0.1325361, 2.768365, 0.1411765, 0, 1, 1,
0.5031088, -1.426293, 3.729907, 0.145098, 0, 1, 1,
0.5035356, 0.276349, 1.635918, 0.1529412, 0, 1, 1,
0.5044496, 1.422284, 0.7776145, 0.1568628, 0, 1, 1,
0.5066906, -1.395578, 2.745737, 0.1647059, 0, 1, 1,
0.5070838, -1.023075, 2.960667, 0.1686275, 0, 1, 1,
0.5101741, -0.2553259, 0.4603158, 0.1764706, 0, 1, 1,
0.5121847, -0.4882942, 2.276906, 0.1803922, 0, 1, 1,
0.5132025, 0.08761325, 0.144317, 0.1882353, 0, 1, 1,
0.5141525, -0.7016926, 0.8059673, 0.1921569, 0, 1, 1,
0.5231495, -1.659233, 4.285334, 0.2, 0, 1, 1,
0.5241416, 0.6484159, 1.388275, 0.2078431, 0, 1, 1,
0.5265499, 1.003448, 2.665339, 0.2117647, 0, 1, 1,
0.5298255, 1.660942, -0.3138201, 0.2196078, 0, 1, 1,
0.5316706, -1.584516, 4.003352, 0.2235294, 0, 1, 1,
0.5529881, -0.1118031, 1.47032, 0.2313726, 0, 1, 1,
0.5608972, -1.073689, 2.745751, 0.2352941, 0, 1, 1,
0.5626711, 2.056993, -0.1811456, 0.2431373, 0, 1, 1,
0.5644395, 0.495042, 1.101254, 0.2470588, 0, 1, 1,
0.5646197, 0.7788455, -0.1206873, 0.254902, 0, 1, 1,
0.5653939, 0.04944808, 2.074643, 0.2588235, 0, 1, 1,
0.568311, 0.6233954, 0.53703, 0.2666667, 0, 1, 1,
0.5734155, 0.901176, -0.06965122, 0.2705882, 0, 1, 1,
0.5740698, -0.2476793, 2.484451, 0.2784314, 0, 1, 1,
0.5756243, -1.279104, 1.122561, 0.282353, 0, 1, 1,
0.577279, 0.4401183, 0.400338, 0.2901961, 0, 1, 1,
0.579015, -0.01003729, 2.635824, 0.2941177, 0, 1, 1,
0.5834503, 2.431671, -2.078757, 0.3019608, 0, 1, 1,
0.5911793, 0.1807635, 0.9928281, 0.3098039, 0, 1, 1,
0.593897, 0.4683619, -0.038501, 0.3137255, 0, 1, 1,
0.6053635, 1.148162, 0.6203714, 0.3215686, 0, 1, 1,
0.6110118, 0.07680152, 0.9150049, 0.3254902, 0, 1, 1,
0.6113645, -0.805785, 2.936908, 0.3333333, 0, 1, 1,
0.6114451, 0.1893937, 1.148567, 0.3372549, 0, 1, 1,
0.6189984, 1.033099, -0.3729947, 0.345098, 0, 1, 1,
0.6220159, 0.5090467, 1.412958, 0.3490196, 0, 1, 1,
0.6234498, -0.865362, 2.411262, 0.3568628, 0, 1, 1,
0.6253148, -1.1529, 0.4887671, 0.3607843, 0, 1, 1,
0.625329, -1.710482, 2.812096, 0.3686275, 0, 1, 1,
0.627047, -1.939206, 4.647275, 0.372549, 0, 1, 1,
0.6316327, 0.6843932, -0.1189176, 0.3803922, 0, 1, 1,
0.6460281, -0.7878649, 1.749916, 0.3843137, 0, 1, 1,
0.6498266, -0.6919101, 3.960536, 0.3921569, 0, 1, 1,
0.6514204, -1.180842, 1.519487, 0.3960784, 0, 1, 1,
0.6515241, 0.3909882, 1.547059, 0.4039216, 0, 1, 1,
0.6530059, 1.42456, 0.7715474, 0.4117647, 0, 1, 1,
0.6605849, 1.440119, 2.100142, 0.4156863, 0, 1, 1,
0.6626321, 1.31634, -0.02096946, 0.4235294, 0, 1, 1,
0.6652893, 0.5820075, 0.8918291, 0.427451, 0, 1, 1,
0.6655311, 0.5619532, 0.4018997, 0.4352941, 0, 1, 1,
0.6680398, 0.6432147, 0.1136346, 0.4392157, 0, 1, 1,
0.6683018, -0.4957134, 2.319948, 0.4470588, 0, 1, 1,
0.6727924, 0.2028622, 1.236879, 0.4509804, 0, 1, 1,
0.6750895, 0.1210909, 0.04429977, 0.4588235, 0, 1, 1,
0.6813654, 0.7841368, 1.555081, 0.4627451, 0, 1, 1,
0.6821194, -1.3375, 1.023186, 0.4705882, 0, 1, 1,
0.6843242, 1.27606, -0.2085325, 0.4745098, 0, 1, 1,
0.6852987, 0.1673423, 0.7067173, 0.4823529, 0, 1, 1,
0.6856797, 0.133281, 1.066067, 0.4862745, 0, 1, 1,
0.6869692, 0.2412839, 1.204598, 0.4941176, 0, 1, 1,
0.6871542, -0.4145869, 3.051071, 0.5019608, 0, 1, 1,
0.7062711, 0.3809093, 0.335874, 0.5058824, 0, 1, 1,
0.7063564, -0.6807199, 0.8382478, 0.5137255, 0, 1, 1,
0.7074996, -0.3849917, 2.014402, 0.5176471, 0, 1, 1,
0.7116106, -1.298575, 3.055678, 0.5254902, 0, 1, 1,
0.712281, -0.7983856, 1.038818, 0.5294118, 0, 1, 1,
0.7131916, -0.4101554, 0.7830278, 0.5372549, 0, 1, 1,
0.7138457, -0.8772779, 2.539019, 0.5411765, 0, 1, 1,
0.7211463, 0.1702033, 2.301553, 0.5490196, 0, 1, 1,
0.7297959, -0.6278527, 0.9857145, 0.5529412, 0, 1, 1,
0.7327127, -0.983004, 3.591061, 0.5607843, 0, 1, 1,
0.741139, -1.781382, 2.296374, 0.5647059, 0, 1, 1,
0.7480127, -0.9103639, 1.781223, 0.572549, 0, 1, 1,
0.7494223, -0.854618, 3.358307, 0.5764706, 0, 1, 1,
0.7521145, -0.4526734, 1.741269, 0.5843138, 0, 1, 1,
0.7536284, -1.226153, 1.834884, 0.5882353, 0, 1, 1,
0.7557216, 0.9603813, 0.8980022, 0.5960785, 0, 1, 1,
0.7574817, -0.874338, 1.626457, 0.6039216, 0, 1, 1,
0.7596836, -0.1925153, 3.49748, 0.6078432, 0, 1, 1,
0.7704945, -0.6221558, 1.158886, 0.6156863, 0, 1, 1,
0.7823689, 0.1572462, 1.121063, 0.6196079, 0, 1, 1,
0.7838225, -0.6135545, 3.224783, 0.627451, 0, 1, 1,
0.7851005, -0.1514409, 2.77757, 0.6313726, 0, 1, 1,
0.79016, -0.8777369, 2.942608, 0.6392157, 0, 1, 1,
0.7907379, 0.9871733, -0.656594, 0.6431373, 0, 1, 1,
0.7999662, -1.494872, 2.597275, 0.6509804, 0, 1, 1,
0.8098525, 0.607183, 1.387358, 0.654902, 0, 1, 1,
0.809927, -0.9766558, 1.470086, 0.6627451, 0, 1, 1,
0.8136615, 0.2602935, 1.291006, 0.6666667, 0, 1, 1,
0.8189214, 1.014198, 0.4342571, 0.6745098, 0, 1, 1,
0.8208374, 1.07849, 0.7880176, 0.6784314, 0, 1, 1,
0.8211702, -1.638031, 3.641387, 0.6862745, 0, 1, 1,
0.8223372, -0.3534576, 2.338115, 0.6901961, 0, 1, 1,
0.822946, 1.405512, -0.5705221, 0.6980392, 0, 1, 1,
0.8240098, -1.664493, 3.01239, 0.7058824, 0, 1, 1,
0.8283968, 0.9872253, -0.2684948, 0.7098039, 0, 1, 1,
0.8363152, 0.08255148, 2.108949, 0.7176471, 0, 1, 1,
0.8387114, 1.449791, 1.139703, 0.7215686, 0, 1, 1,
0.8412421, -0.2622848, 0.8699536, 0.7294118, 0, 1, 1,
0.8424421, 0.2325137, 0.8382091, 0.7333333, 0, 1, 1,
0.8427436, 1.186391, 0.4584331, 0.7411765, 0, 1, 1,
0.8428187, -0.6197258, 3.831228, 0.7450981, 0, 1, 1,
0.8475348, 1.257108, 0.4254255, 0.7529412, 0, 1, 1,
0.8507445, -1.289547, 1.755487, 0.7568628, 0, 1, 1,
0.8594822, -0.917663, 0.9863458, 0.7647059, 0, 1, 1,
0.8649663, 0.05694314, 2.200148, 0.7686275, 0, 1, 1,
0.8701027, -0.02122354, 0.6809819, 0.7764706, 0, 1, 1,
0.8714455, 1.771169, 0.8193201, 0.7803922, 0, 1, 1,
0.871546, 1.929154, -0.7852676, 0.7882353, 0, 1, 1,
0.8727163, 0.4644362, 0.7609193, 0.7921569, 0, 1, 1,
0.8734012, -1.020216, 3.661675, 0.8, 0, 1, 1,
0.8786238, -0.0215762, 1.101891, 0.8078431, 0, 1, 1,
0.8809082, -1.902702, 3.547824, 0.8117647, 0, 1, 1,
0.8827195, 0.2489844, 1.14007, 0.8196079, 0, 1, 1,
0.8828669, 0.2104204, 2.44969, 0.8235294, 0, 1, 1,
0.8843277, 0.1488084, 1.236552, 0.8313726, 0, 1, 1,
0.8848438, -0.4189764, 2.307417, 0.8352941, 0, 1, 1,
0.8855637, -0.7579231, 3.708114, 0.8431373, 0, 1, 1,
0.8975112, -1.204092, 1.514252, 0.8470588, 0, 1, 1,
0.8982918, -0.3490013, 0.361119, 0.854902, 0, 1, 1,
0.9090004, -0.9592424, 2.795669, 0.8588235, 0, 1, 1,
0.9101627, -0.9098778, 1.779058, 0.8666667, 0, 1, 1,
0.9186228, 1.456059, 0.2409266, 0.8705882, 0, 1, 1,
0.9205129, -1.152208, 2.856666, 0.8784314, 0, 1, 1,
0.9205186, 0.3707299, 1.990036, 0.8823529, 0, 1, 1,
0.921609, -0.5081329, 1.942914, 0.8901961, 0, 1, 1,
0.9223583, -0.9041695, 2.984976, 0.8941177, 0, 1, 1,
0.9262753, -0.2035879, 2.568028, 0.9019608, 0, 1, 1,
0.9275002, -0.8298803, 2.932678, 0.9098039, 0, 1, 1,
0.9281646, 0.4629524, 2.261539, 0.9137255, 0, 1, 1,
0.9312443, -0.2364998, 2.841667, 0.9215686, 0, 1, 1,
0.9375792, 1.144304, 1.283307, 0.9254902, 0, 1, 1,
0.9401072, -0.4182089, -0.5161955, 0.9333333, 0, 1, 1,
0.9437431, 0.1828157, 2.683851, 0.9372549, 0, 1, 1,
0.948081, 0.9116994, -0.9688747, 0.945098, 0, 1, 1,
0.9539356, -1.131335, 2.099038, 0.9490196, 0, 1, 1,
0.9548669, -0.3311599, 0.9109888, 0.9568627, 0, 1, 1,
0.9578878, 1.489274, 0.1869796, 0.9607843, 0, 1, 1,
0.9674455, -1.398443, 2.791465, 0.9686275, 0, 1, 1,
0.978973, -1.315693, 2.097573, 0.972549, 0, 1, 1,
0.9801651, 0.09912977, 1.938239, 0.9803922, 0, 1, 1,
0.980764, -0.9804807, 1.981973, 0.9843137, 0, 1, 1,
0.9813563, 0.09430323, 1.977615, 0.9921569, 0, 1, 1,
0.9843359, 1.192728, 2.274134, 0.9960784, 0, 1, 1,
0.986376, -0.5725881, 1.95449, 1, 0, 0.9960784, 1,
0.9870261, 1.479359, 2.206032, 1, 0, 0.9882353, 1,
0.9952707, 0.2607661, 1.643607, 1, 0, 0.9843137, 1,
0.9995111, -0.04078859, 0.3545795, 1, 0, 0.9764706, 1,
0.9996722, 0.6433039, 2.539437, 1, 0, 0.972549, 1,
1.002879, 0.372272, 0.9256962, 1, 0, 0.9647059, 1,
1.006423, -0.4364898, 0.9615535, 1, 0, 0.9607843, 1,
1.006572, 1.726491, -0.2972471, 1, 0, 0.9529412, 1,
1.007648, -1.70664, 3.596497, 1, 0, 0.9490196, 1,
1.007968, 0.3942347, 0.05462945, 1, 0, 0.9411765, 1,
1.00899, -0.1590488, 2.308487, 1, 0, 0.9372549, 1,
1.013725, 0.8386762, 0.8893359, 1, 0, 0.9294118, 1,
1.018791, 0.8995764, 0.2250751, 1, 0, 0.9254902, 1,
1.019087, -2.807146, 1.572542, 1, 0, 0.9176471, 1,
1.019497, 0.87596, 1.598639, 1, 0, 0.9137255, 1,
1.021761, 0.6550847, 0.2746316, 1, 0, 0.9058824, 1,
1.02624, 0.8311709, 1.761093, 1, 0, 0.9019608, 1,
1.027031, 0.07235654, 1.117877, 1, 0, 0.8941177, 1,
1.029543, 1.258589, 2.061736, 1, 0, 0.8862745, 1,
1.031702, 0.2067237, 2.434086, 1, 0, 0.8823529, 1,
1.032839, -1.44857, 2.317753, 1, 0, 0.8745098, 1,
1.035543, -0.5981532, 3.296348, 1, 0, 0.8705882, 1,
1.044878, -1.31938, 1.618222, 1, 0, 0.8627451, 1,
1.046893, -1.170295, 1.82743, 1, 0, 0.8588235, 1,
1.056253, 0.1797784, 2.035584, 1, 0, 0.8509804, 1,
1.057861, 1.343679, 0.7931479, 1, 0, 0.8470588, 1,
1.061719, 0.752727, 2.168691, 1, 0, 0.8392157, 1,
1.066451, 0.4865173, 1.128229, 1, 0, 0.8352941, 1,
1.069548, -1.840221, 3.053911, 1, 0, 0.827451, 1,
1.076614, -0.1975171, 2.030076, 1, 0, 0.8235294, 1,
1.083282, -0.6429901, 1.093686, 1, 0, 0.8156863, 1,
1.108292, -0.5978068, 0.4557173, 1, 0, 0.8117647, 1,
1.109876, -0.238831, 3.233513, 1, 0, 0.8039216, 1,
1.120798, -0.2948373, 0.6083989, 1, 0, 0.7960784, 1,
1.126119, 1.031946, 2.446644, 1, 0, 0.7921569, 1,
1.129395, -2.132969, 2.344036, 1, 0, 0.7843137, 1,
1.130551, 0.2087818, 2.945298, 1, 0, 0.7803922, 1,
1.131725, 0.5748652, 0.3260997, 1, 0, 0.772549, 1,
1.135261, 0.1390613, 2.754737, 1, 0, 0.7686275, 1,
1.153732, -0.6865096, 3.535678, 1, 0, 0.7607843, 1,
1.154788, 0.2369123, 1.372284, 1, 0, 0.7568628, 1,
1.170386, -0.4858219, 2.203071, 1, 0, 0.7490196, 1,
1.170585, -1.199938, 1.003157, 1, 0, 0.7450981, 1,
1.171139, 0.6558519, 0.4748869, 1, 0, 0.7372549, 1,
1.178896, 1.066634, 0.7244191, 1, 0, 0.7333333, 1,
1.179884, -0.4134226, 2.403918, 1, 0, 0.7254902, 1,
1.199686, -0.4398842, 2.763796, 1, 0, 0.7215686, 1,
1.203086, -0.976186, 1.167472, 1, 0, 0.7137255, 1,
1.207264, 1.749531, 0.9967306, 1, 0, 0.7098039, 1,
1.211623, 0.06195469, 0.8292146, 1, 0, 0.7019608, 1,
1.213081, -0.6798826, 1.152396, 1, 0, 0.6941177, 1,
1.214666, -0.07386445, 1.067464, 1, 0, 0.6901961, 1,
1.223398, 2.234078, 1.007779, 1, 0, 0.682353, 1,
1.240111, 0.579982, 0.2193459, 1, 0, 0.6784314, 1,
1.242638, -0.3062267, 0.1400036, 1, 0, 0.6705883, 1,
1.252282, -0.1075958, 3.290609, 1, 0, 0.6666667, 1,
1.267159, -0.7655047, 3.840398, 1, 0, 0.6588235, 1,
1.269765, 0.001135106, 1.448018, 1, 0, 0.654902, 1,
1.271228, -2.167329, 3.00212, 1, 0, 0.6470588, 1,
1.278087, 1.026864, 1.579154, 1, 0, 0.6431373, 1,
1.27899, 1.276819, 1.177301, 1, 0, 0.6352941, 1,
1.281082, -0.04871156, 1.650669, 1, 0, 0.6313726, 1,
1.282461, -0.7702683, 2.45276, 1, 0, 0.6235294, 1,
1.289534, -0.6746089, 1.281633, 1, 0, 0.6196079, 1,
1.300206, 0.1302529, 0.7282565, 1, 0, 0.6117647, 1,
1.317713, -1.323321, 2.025262, 1, 0, 0.6078432, 1,
1.327925, -0.4477725, 2.07964, 1, 0, 0.6, 1,
1.328336, -0.5751559, 3.583827, 1, 0, 0.5921569, 1,
1.332902, 1.057523, -1.981132, 1, 0, 0.5882353, 1,
1.336898, -0.8544614, 4.016422, 1, 0, 0.5803922, 1,
1.349054, -2.177238, 2.194249, 1, 0, 0.5764706, 1,
1.36915, -1.764639, 0.4043152, 1, 0, 0.5686275, 1,
1.370012, -0.7683866, 1.649467, 1, 0, 0.5647059, 1,
1.381432, -0.8863614, 3.271253, 1, 0, 0.5568628, 1,
1.385787, -0.493199, 2.750755, 1, 0, 0.5529412, 1,
1.387045, 1.273819, 1.118481, 1, 0, 0.5450981, 1,
1.392935, -0.0003706447, 3.498459, 1, 0, 0.5411765, 1,
1.407382, -0.0224359, 1.420877, 1, 0, 0.5333334, 1,
1.412624, 1.973108, -0.228984, 1, 0, 0.5294118, 1,
1.419276, 0.5555179, 1.14618, 1, 0, 0.5215687, 1,
1.419515, 0.3743507, 2.440904, 1, 0, 0.5176471, 1,
1.419974, 0.3744316, 1.296568, 1, 0, 0.509804, 1,
1.429102, -1.064038, -0.2991739, 1, 0, 0.5058824, 1,
1.444885, -0.5474696, 1.519424, 1, 0, 0.4980392, 1,
1.446069, 0.4496014, 1.746206, 1, 0, 0.4901961, 1,
1.465355, 0.06987753, 1.720897, 1, 0, 0.4862745, 1,
1.466585, 0.1482961, 1.043471, 1, 0, 0.4784314, 1,
1.470582, 0.5438785, 1.783965, 1, 0, 0.4745098, 1,
1.473349, -1.378065, 0.6561971, 1, 0, 0.4666667, 1,
1.47521, 0.04886987, 0.4623664, 1, 0, 0.4627451, 1,
1.476119, 1.625249, 1.119624, 1, 0, 0.454902, 1,
1.480672, 0.4223436, 2.042462, 1, 0, 0.4509804, 1,
1.481123, 0.160067, 0.6864104, 1, 0, 0.4431373, 1,
1.491087, 0.1137177, 2.309777, 1, 0, 0.4392157, 1,
1.492589, -0.7669178, 1.449518, 1, 0, 0.4313726, 1,
1.498783, 0.1028074, 3.607385, 1, 0, 0.427451, 1,
1.498829, 0.19455, 2.500397, 1, 0, 0.4196078, 1,
1.505705, 1.433347, 0.990205, 1, 0, 0.4156863, 1,
1.510859, -2.295592, 2.305297, 1, 0, 0.4078431, 1,
1.512879, -0.1721192, 3.022044, 1, 0, 0.4039216, 1,
1.518695, -1.028744, 2.011322, 1, 0, 0.3960784, 1,
1.520971, 0.3452471, 2.040769, 1, 0, 0.3882353, 1,
1.529903, 1.043573, -1.283364, 1, 0, 0.3843137, 1,
1.537904, 0.5392892, 0.5983267, 1, 0, 0.3764706, 1,
1.541486, -1.746961, -0.2029591, 1, 0, 0.372549, 1,
1.550403, -0.8945431, 2.565206, 1, 0, 0.3647059, 1,
1.555157, 0.7247301, 1.559629, 1, 0, 0.3607843, 1,
1.566225, 0.5620008, 1.253665, 1, 0, 0.3529412, 1,
1.573612, -1.12684, 2.76804, 1, 0, 0.3490196, 1,
1.575269, 0.9084106, 0.988367, 1, 0, 0.3411765, 1,
1.602331, -3.221713, 2.186314, 1, 0, 0.3372549, 1,
1.609956, -0.04763691, 0.9166365, 1, 0, 0.3294118, 1,
1.623276, -1.539498, 3.240336, 1, 0, 0.3254902, 1,
1.627226, 0.004853476, 0.5616696, 1, 0, 0.3176471, 1,
1.628406, 1.007812, 1.416325, 1, 0, 0.3137255, 1,
1.631413, -0.5209476, 1.046692, 1, 0, 0.3058824, 1,
1.635437, 1.680933, -0.6144372, 1, 0, 0.2980392, 1,
1.675031, -0.4327401, 1.325484, 1, 0, 0.2941177, 1,
1.695031, 0.545983, 1.780664, 1, 0, 0.2862745, 1,
1.733786, -0.5187688, 2.244146, 1, 0, 0.282353, 1,
1.742175, 1.936415, 0.3285092, 1, 0, 0.2745098, 1,
1.745481, -0.3525981, 2.256842, 1, 0, 0.2705882, 1,
1.747773, -1.480466, 0.7978198, 1, 0, 0.2627451, 1,
1.756045, -0.5891316, 0.8396356, 1, 0, 0.2588235, 1,
1.759671, -0.5140611, 3.533915, 1, 0, 0.2509804, 1,
1.778355, -1.170198, 2.179029, 1, 0, 0.2470588, 1,
1.78361, -1.663859, 0.3204042, 1, 0, 0.2392157, 1,
1.787687, -1.129007, 2.976792, 1, 0, 0.2352941, 1,
1.788569, -0.8546309, 2.180273, 1, 0, 0.227451, 1,
1.820811, 0.4865897, 3.472623, 1, 0, 0.2235294, 1,
1.829071, -0.1297905, 2.945194, 1, 0, 0.2156863, 1,
1.856772, 0.7787332, 1.008952, 1, 0, 0.2117647, 1,
1.859459, 0.6989348, -0.2326046, 1, 0, 0.2039216, 1,
1.877072, -0.4213378, 1.875691, 1, 0, 0.1960784, 1,
1.895679, -0.3731009, 0.9996525, 1, 0, 0.1921569, 1,
1.95353, -0.8351227, 2.193979, 1, 0, 0.1843137, 1,
1.955683, -0.332133, 3.429217, 1, 0, 0.1803922, 1,
1.978397, 1.009667, 0.1995544, 1, 0, 0.172549, 1,
1.997503, -0.1726808, 2.514347, 1, 0, 0.1686275, 1,
2.003374, -0.3455262, 1.399655, 1, 0, 0.1607843, 1,
2.018839, -0.5218738, 1.626954, 1, 0, 0.1568628, 1,
2.022351, -0.07538861, 1.459452, 1, 0, 0.1490196, 1,
2.032022, 1.00246, 0.9576901, 1, 0, 0.145098, 1,
2.069963, 0.5131323, 2.575173, 1, 0, 0.1372549, 1,
2.074657, 0.6054499, 2.498238, 1, 0, 0.1333333, 1,
2.119799, 0.5926179, 0.7942557, 1, 0, 0.1254902, 1,
2.142322, -1.538481, 1.073401, 1, 0, 0.1215686, 1,
2.156315, -0.1370029, 0.1429012, 1, 0, 0.1137255, 1,
2.156757, 0.8573976, 1.885827, 1, 0, 0.1098039, 1,
2.230974, -0.7532728, 2.126397, 1, 0, 0.1019608, 1,
2.286445, 1.052188, 2.125232, 1, 0, 0.09411765, 1,
2.314005, 1.426666, 0.4035814, 1, 0, 0.09019608, 1,
2.321599, -0.781988, 2.07288, 1, 0, 0.08235294, 1,
2.354045, 1.454059, -0.5898133, 1, 0, 0.07843138, 1,
2.426832, 1.199949, -0.3646809, 1, 0, 0.07058824, 1,
2.432165, -1.1572, 2.562035, 1, 0, 0.06666667, 1,
2.438466, -0.1213935, 1.262565, 1, 0, 0.05882353, 1,
2.444824, -1.466063, 2.440527, 1, 0, 0.05490196, 1,
2.498826, -1.500938, 0.8573703, 1, 0, 0.04705882, 1,
2.505762, -0.4723672, 2.090935, 1, 0, 0.04313726, 1,
2.50797, 0.6351851, 1.238115, 1, 0, 0.03529412, 1,
2.527313, -0.5164865, 0.6911299, 1, 0, 0.03137255, 1,
2.630584, 0.8457991, -1.312331, 1, 0, 0.02352941, 1,
2.668284, 0.6950164, 1.181936, 1, 0, 0.01960784, 1,
2.725183, -0.8391067, 0.8530225, 1, 0, 0.01176471, 1,
3.621518, -0.8311099, 0.4990114, 1, 0, 0.007843138, 1
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
0.01670206, -4.322628, -7.685949, 0, -0.5, 0.5, 0.5,
0.01670206, -4.322628, -7.685949, 1, -0.5, 0.5, 0.5,
0.01670206, -4.322628, -7.685949, 1, 1.5, 0.5, 0.5,
0.01670206, -4.322628, -7.685949, 0, 1.5, 0.5, 0.5
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
-4.810147, 0.02582169, -7.685949, 0, -0.5, 0.5, 0.5,
-4.810147, 0.02582169, -7.685949, 1, -0.5, 0.5, 0.5,
-4.810147, 0.02582169, -7.685949, 1, 1.5, 0.5, 0.5,
-4.810147, 0.02582169, -7.685949, 0, 1.5, 0.5, 0.5
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
-4.810147, -4.322628, -0.5731943, 0, -0.5, 0.5, 0.5,
-4.810147, -4.322628, -0.5731943, 1, -0.5, 0.5, 0.5,
-4.810147, -4.322628, -0.5731943, 1, 1.5, 0.5, 0.5,
-4.810147, -4.322628, -0.5731943, 0, 1.5, 0.5, 0.5
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
-2, -3.319139, -6.044544,
2, -3.319139, -6.044544,
-2, -3.319139, -6.044544,
-2, -3.486387, -6.318111,
0, -3.319139, -6.044544,
0, -3.486387, -6.318111,
2, -3.319139, -6.044544,
2, -3.486387, -6.318111
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
-2, -3.820883, -6.865246, 0, -0.5, 0.5, 0.5,
-2, -3.820883, -6.865246, 1, -0.5, 0.5, 0.5,
-2, -3.820883, -6.865246, 1, 1.5, 0.5, 0.5,
-2, -3.820883, -6.865246, 0, 1.5, 0.5, 0.5,
0, -3.820883, -6.865246, 0, -0.5, 0.5, 0.5,
0, -3.820883, -6.865246, 1, -0.5, 0.5, 0.5,
0, -3.820883, -6.865246, 1, 1.5, 0.5, 0.5,
0, -3.820883, -6.865246, 0, 1.5, 0.5, 0.5,
2, -3.820883, -6.865246, 0, -0.5, 0.5, 0.5,
2, -3.820883, -6.865246, 1, -0.5, 0.5, 0.5,
2, -3.820883, -6.865246, 1, 1.5, 0.5, 0.5,
2, -3.820883, -6.865246, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.696259, -3, -6.044544,
-3.696259, 3, -6.044544,
-3.696259, -3, -6.044544,
-3.881907, -3, -6.318111,
-3.696259, -2, -6.044544,
-3.881907, -2, -6.318111,
-3.696259, -1, -6.044544,
-3.881907, -1, -6.318111,
-3.696259, 0, -6.044544,
-3.881907, 0, -6.318111,
-3.696259, 1, -6.044544,
-3.881907, 1, -6.318111,
-3.696259, 2, -6.044544,
-3.881907, 2, -6.318111,
-3.696259, 3, -6.044544,
-3.881907, 3, -6.318111
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
-4.253202, -3, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, -3, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, -3, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, -3, -6.865246, 0, 1.5, 0.5, 0.5,
-4.253202, -2, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, -2, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, -2, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, -2, -6.865246, 0, 1.5, 0.5, 0.5,
-4.253202, -1, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, -1, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, -1, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, -1, -6.865246, 0, 1.5, 0.5, 0.5,
-4.253202, 0, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, 0, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, 0, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, 0, -6.865246, 0, 1.5, 0.5, 0.5,
-4.253202, 1, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, 1, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, 1, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, 1, -6.865246, 0, 1.5, 0.5, 0.5,
-4.253202, 2, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, 2, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, 2, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, 2, -6.865246, 0, 1.5, 0.5, 0.5,
-4.253202, 3, -6.865246, 0, -0.5, 0.5, 0.5,
-4.253202, 3, -6.865246, 1, -0.5, 0.5, 0.5,
-4.253202, 3, -6.865246, 1, 1.5, 0.5, 0.5,
-4.253202, 3, -6.865246, 0, 1.5, 0.5, 0.5
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
-3.696259, -3.319139, -4,
-3.696259, -3.319139, 4,
-3.696259, -3.319139, -4,
-3.881907, -3.486387, -4,
-3.696259, -3.319139, -2,
-3.881907, -3.486387, -2,
-3.696259, -3.319139, 0,
-3.881907, -3.486387, 0,
-3.696259, -3.319139, 2,
-3.881907, -3.486387, 2,
-3.696259, -3.319139, 4,
-3.881907, -3.486387, 4
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
-4.253202, -3.820883, -4, 0, -0.5, 0.5, 0.5,
-4.253202, -3.820883, -4, 1, -0.5, 0.5, 0.5,
-4.253202, -3.820883, -4, 1, 1.5, 0.5, 0.5,
-4.253202, -3.820883, -4, 0, 1.5, 0.5, 0.5,
-4.253202, -3.820883, -2, 0, -0.5, 0.5, 0.5,
-4.253202, -3.820883, -2, 1, -0.5, 0.5, 0.5,
-4.253202, -3.820883, -2, 1, 1.5, 0.5, 0.5,
-4.253202, -3.820883, -2, 0, 1.5, 0.5, 0.5,
-4.253202, -3.820883, 0, 0, -0.5, 0.5, 0.5,
-4.253202, -3.820883, 0, 1, -0.5, 0.5, 0.5,
-4.253202, -3.820883, 0, 1, 1.5, 0.5, 0.5,
-4.253202, -3.820883, 0, 0, 1.5, 0.5, 0.5,
-4.253202, -3.820883, 2, 0, -0.5, 0.5, 0.5,
-4.253202, -3.820883, 2, 1, -0.5, 0.5, 0.5,
-4.253202, -3.820883, 2, 1, 1.5, 0.5, 0.5,
-4.253202, -3.820883, 2, 0, 1.5, 0.5, 0.5,
-4.253202, -3.820883, 4, 0, -0.5, 0.5, 0.5,
-4.253202, -3.820883, 4, 1, -0.5, 0.5, 0.5,
-4.253202, -3.820883, 4, 1, 1.5, 0.5, 0.5,
-4.253202, -3.820883, 4, 0, 1.5, 0.5, 0.5
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
-3.696259, -3.319139, -6.044544,
-3.696259, 3.370782, -6.044544,
-3.696259, -3.319139, 4.898156,
-3.696259, 3.370782, 4.898156,
-3.696259, -3.319139, -6.044544,
-3.696259, -3.319139, 4.898156,
-3.696259, 3.370782, -6.044544,
-3.696259, 3.370782, 4.898156,
-3.696259, -3.319139, -6.044544,
3.729663, -3.319139, -6.044544,
-3.696259, -3.319139, 4.898156,
3.729663, -3.319139, 4.898156,
-3.696259, 3.370782, -6.044544,
3.729663, 3.370782, -6.044544,
-3.696259, 3.370782, 4.898156,
3.729663, 3.370782, 4.898156,
3.729663, -3.319139, -6.044544,
3.729663, 3.370782, -6.044544,
3.729663, -3.319139, 4.898156,
3.729663, 3.370782, 4.898156,
3.729663, -3.319139, -6.044544,
3.729663, -3.319139, 4.898156,
3.729663, 3.370782, -6.044544,
3.729663, 3.370782, 4.898156
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
var radius = 7.913766;
var distance = 35.20924;
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
mvMatrix.translate( -0.01670206, -0.02582169, 0.5731943 );
mvMatrix.scale( 1.15225, 1.279016, 0.7819386 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20924);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
oxychlordane<-read.table("oxychlordane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxychlordane$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxychlordane' not found
```

```r
y<-oxychlordane$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxychlordane' not found
```

```r
z<-oxychlordane$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxychlordane' not found
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
-3.588114, 1.282848, -0.6721893, 0, 0, 1, 1, 1,
-3.390163, -0.1061352, -1.038594, 1, 0, 0, 1, 1,
-3.267255, -0.7666137, -1.776169, 1, 0, 0, 1, 1,
-2.654266, 0.3586674, -3.002565, 1, 0, 0, 1, 1,
-2.633353, 1.017219, -0.1970673, 1, 0, 0, 1, 1,
-2.485213, 1.479211, -1.882912, 1, 0, 0, 1, 1,
-2.363648, -0.02907557, -1.336931, 0, 0, 0, 1, 1,
-2.304082, -1.600615, -1.244415, 0, 0, 0, 1, 1,
-2.273336, -0.2175514, -0.1649626, 0, 0, 0, 1, 1,
-2.247327, -0.3633803, -0.9768843, 0, 0, 0, 1, 1,
-2.200474, 1.050823, -0.6267391, 0, 0, 0, 1, 1,
-2.195099, 2.270213, 0.4630401, 0, 0, 0, 1, 1,
-2.194479, 1.392892, -2.493261, 0, 0, 0, 1, 1,
-2.126628, 0.8408756, -1.854181, 1, 1, 1, 1, 1,
-2.082922, -0.6367858, -1.523388, 1, 1, 1, 1, 1,
-2.067227, -1.702075, -2.27815, 1, 1, 1, 1, 1,
-2.049641, -0.5785247, -1.904966, 1, 1, 1, 1, 1,
-2.046817, -0.8323941, -2.621381, 1, 1, 1, 1, 1,
-2.044318, 0.8028486, -0.4814261, 1, 1, 1, 1, 1,
-2.030402, 1.010721, 1.174273, 1, 1, 1, 1, 1,
-2.015201, 0.1090548, -2.930134, 1, 1, 1, 1, 1,
-1.997736, -0.5936455, -0.734926, 1, 1, 1, 1, 1,
-1.980982, 0.6476201, 0.1123594, 1, 1, 1, 1, 1,
-1.962809, -0.1557976, -0.7206393, 1, 1, 1, 1, 1,
-1.962786, 1.197199, -0.7272714, 1, 1, 1, 1, 1,
-1.953834, -0.5435472, -2.41247, 1, 1, 1, 1, 1,
-1.94263, -1.557912, -2.983419, 1, 1, 1, 1, 1,
-1.889035, -1.105684, -1.662764, 1, 1, 1, 1, 1,
-1.883542, -1.26131, -4.597894, 0, 0, 1, 1, 1,
-1.882375, 0.9560737, -0.1721155, 1, 0, 0, 1, 1,
-1.873578, -1.430719, -2.261607, 1, 0, 0, 1, 1,
-1.870777, -0.3991009, -2.737083, 1, 0, 0, 1, 1,
-1.860461, 0.4429969, -1.221457, 1, 0, 0, 1, 1,
-1.858578, 1.357218, -0.6950337, 1, 0, 0, 1, 1,
-1.857479, 1.336726, -1.009138, 0, 0, 0, 1, 1,
-1.836458, -0.1693198, -3.031189, 0, 0, 0, 1, 1,
-1.827275, -0.8835931, -0.8695346, 0, 0, 0, 1, 1,
-1.816518, 0.85708, -2.995966, 0, 0, 0, 1, 1,
-1.792545, 0.2921795, -3.859547, 0, 0, 0, 1, 1,
-1.767279, -0.7801246, -2.400626, 0, 0, 0, 1, 1,
-1.701136, -0.3497171, -2.395756, 0, 0, 0, 1, 1,
-1.692863, 0.7140668, -0.1308726, 1, 1, 1, 1, 1,
-1.656587, 1.543208, -0.3893984, 1, 1, 1, 1, 1,
-1.65224, 1.244783, -1.011454, 1, 1, 1, 1, 1,
-1.635636, -1.661153, -3.874826, 1, 1, 1, 1, 1,
-1.613406, 0.1656269, -2.082538, 1, 1, 1, 1, 1,
-1.604404, -0.3258406, -1.914484, 1, 1, 1, 1, 1,
-1.604132, -1.443664, -1.563716, 1, 1, 1, 1, 1,
-1.602886, -0.4780643, -1.090348, 1, 1, 1, 1, 1,
-1.586207, -0.1209147, -1.957993, 1, 1, 1, 1, 1,
-1.584782, -0.07459089, -2.712645, 1, 1, 1, 1, 1,
-1.582502, -1.149904, -2.491657, 1, 1, 1, 1, 1,
-1.577144, 0.249214, -2.066383, 1, 1, 1, 1, 1,
-1.576648, 0.9742756, 0.199253, 1, 1, 1, 1, 1,
-1.574964, 0.4584201, -1.799986, 1, 1, 1, 1, 1,
-1.57204, -0.1632195, -0.8793581, 1, 1, 1, 1, 1,
-1.556241, 0.6410116, -2.476964, 0, 0, 1, 1, 1,
-1.541526, -1.255946, -2.595787, 1, 0, 0, 1, 1,
-1.540676, -0.8479242, -2.922057, 1, 0, 0, 1, 1,
-1.53775, 0.4802625, -0.01091826, 1, 0, 0, 1, 1,
-1.535892, 0.2783033, -2.373263, 1, 0, 0, 1, 1,
-1.521649, -0.4677974, -1.312707, 1, 0, 0, 1, 1,
-1.520463, -0.2854423, -1.979102, 0, 0, 0, 1, 1,
-1.500431, -0.1693863, -1.735121, 0, 0, 0, 1, 1,
-1.487661, 0.9593146, 0.7189954, 0, 0, 0, 1, 1,
-1.47928, -0.24532, -1.341482, 0, 0, 0, 1, 1,
-1.468216, -0.3524468, -0.1010335, 0, 0, 0, 1, 1,
-1.463677, 0.8702778, -2.374461, 0, 0, 0, 1, 1,
-1.456657, 0.4604222, 0.2376647, 0, 0, 0, 1, 1,
-1.453505, -2.103855, -2.310794, 1, 1, 1, 1, 1,
-1.452222, 1.105429, -0.3316905, 1, 1, 1, 1, 1,
-1.451528, -1.723555, -3.159865, 1, 1, 1, 1, 1,
-1.441709, 1.062145, -0.1877978, 1, 1, 1, 1, 1,
-1.43933, -0.4374553, -3.411089, 1, 1, 1, 1, 1,
-1.438482, 0.2268962, -2.067286, 1, 1, 1, 1, 1,
-1.434522, -1.050359, -2.199157, 1, 1, 1, 1, 1,
-1.433696, -0.6501228, -1.70806, 1, 1, 1, 1, 1,
-1.430582, -0.5648106, -2.898923, 1, 1, 1, 1, 1,
-1.421579, -0.8263931, -1.319862, 1, 1, 1, 1, 1,
-1.413452, 0.1002824, -0.8808191, 1, 1, 1, 1, 1,
-1.400624, -0.1632392, -2.148868, 1, 1, 1, 1, 1,
-1.396993, 1.973259, -1.647463, 1, 1, 1, 1, 1,
-1.394492, 0.245657, -0.3789071, 1, 1, 1, 1, 1,
-1.392272, 1.488246, -1.426686, 1, 1, 1, 1, 1,
-1.391774, 0.1728738, -1.032289, 0, 0, 1, 1, 1,
-1.380497, -0.06119974, -1.119398, 1, 0, 0, 1, 1,
-1.369029, -2.097541, -1.887689, 1, 0, 0, 1, 1,
-1.363223, 1.295443, -0.906916, 1, 0, 0, 1, 1,
-1.358185, -0.6943968, -2.61299, 1, 0, 0, 1, 1,
-1.341336, 0.05190321, -1.533518, 1, 0, 0, 1, 1,
-1.323393, 2.343498, -1.099225, 0, 0, 0, 1, 1,
-1.322132, -0.7859657, -1.644431, 0, 0, 0, 1, 1,
-1.320558, -0.00675328, -0.7309937, 0, 0, 0, 1, 1,
-1.318008, -1.226606, -1.654392, 0, 0, 0, 1, 1,
-1.316654, -0.6622854, -0.6954364, 0, 0, 0, 1, 1,
-1.312895, -1.356746, -1.869114, 0, 0, 0, 1, 1,
-1.300126, -0.8698296, -3.159027, 0, 0, 0, 1, 1,
-1.291626, -0.1410751, -3.082509, 1, 1, 1, 1, 1,
-1.289374, -1.674317, -1.49046, 1, 1, 1, 1, 1,
-1.286662, -0.4310144, -2.548412, 1, 1, 1, 1, 1,
-1.282589, -0.39347, -1.126616, 1, 1, 1, 1, 1,
-1.281332, 0.4914232, -0.8148723, 1, 1, 1, 1, 1,
-1.278543, -0.6523798, -1.720599, 1, 1, 1, 1, 1,
-1.275975, 1.047656, -0.4572005, 1, 1, 1, 1, 1,
-1.275807, 1.576282, -1.110165, 1, 1, 1, 1, 1,
-1.271254, -1.163656, -2.985267, 1, 1, 1, 1, 1,
-1.269546, 0.002710924, -2.343856, 1, 1, 1, 1, 1,
-1.266787, -0.5513295, -2.808831, 1, 1, 1, 1, 1,
-1.262798, 0.001211336, -1.942764, 1, 1, 1, 1, 1,
-1.259117, -0.306796, -1.997348, 1, 1, 1, 1, 1,
-1.253092, 0.8319324, -0.4014245, 1, 1, 1, 1, 1,
-1.247068, -1.053753, -3.40553, 1, 1, 1, 1, 1,
-1.241983, -0.5167561, -1.385216, 0, 0, 1, 1, 1,
-1.241597, -1.817996, -3.22157, 1, 0, 0, 1, 1,
-1.236037, 0.8973278, 0.5141762, 1, 0, 0, 1, 1,
-1.23334, 1.295914, -1.39507, 1, 0, 0, 1, 1,
-1.224259, 0.2860808, -1.135924, 1, 0, 0, 1, 1,
-1.22034, -0.1031058, -1.49811, 1, 0, 0, 1, 1,
-1.219195, 0.7185959, -2.592655, 0, 0, 0, 1, 1,
-1.210961, -0.5040553, -1.678367, 0, 0, 0, 1, 1,
-1.208521, 1.718857, 0.7990932, 0, 0, 0, 1, 1,
-1.208209, -1.600927, -2.484526, 0, 0, 0, 1, 1,
-1.208027, -0.003009033, -0.8805873, 0, 0, 0, 1, 1,
-1.200485, -1.063, -2.607975, 0, 0, 0, 1, 1,
-1.197526, -0.478092, -1.875962, 0, 0, 0, 1, 1,
-1.195139, -1.09955, -5.222733, 1, 1, 1, 1, 1,
-1.19346, -1.391701, -1.050683, 1, 1, 1, 1, 1,
-1.185772, 1.584504, 0.4128513, 1, 1, 1, 1, 1,
-1.178425, -0.3619039, -2.483095, 1, 1, 1, 1, 1,
-1.175217, 0.5524934, -2.024934, 1, 1, 1, 1, 1,
-1.173712, 0.7623534, -0.01874153, 1, 1, 1, 1, 1,
-1.150603, 0.458059, -1.634552, 1, 1, 1, 1, 1,
-1.150229, -0.9486967, -3.767087, 1, 1, 1, 1, 1,
-1.144949, 0.7519956, 0.1107573, 1, 1, 1, 1, 1,
-1.135731, 0.3083542, -0.3623418, 1, 1, 1, 1, 1,
-1.123455, 0.605011, -1.317074, 1, 1, 1, 1, 1,
-1.12286, -0.2056868, -2.424115, 1, 1, 1, 1, 1,
-1.120792, 0.04140577, -0.7158922, 1, 1, 1, 1, 1,
-1.114354, 0.5521994, -0.9656479, 1, 1, 1, 1, 1,
-1.111009, 0.7474678, -0.4432462, 1, 1, 1, 1, 1,
-1.110481, -0.4035171, -1.616704, 0, 0, 1, 1, 1,
-1.108972, -1.4635, -3.335856, 1, 0, 0, 1, 1,
-1.100145, 1.449919, 1.08171, 1, 0, 0, 1, 1,
-1.096946, 0.01553024, -0.7791404, 1, 0, 0, 1, 1,
-1.096178, 1.168974, -0.0877746, 1, 0, 0, 1, 1,
-1.095211, -1.380133, -1.304141, 1, 0, 0, 1, 1,
-1.093866, 0.1396989, -1.072972, 0, 0, 0, 1, 1,
-1.078089, 1.00724, -1.452435, 0, 0, 0, 1, 1,
-1.075682, -0.9730809, -1.254946, 0, 0, 0, 1, 1,
-1.071295, -0.8024419, -2.621521, 0, 0, 0, 1, 1,
-1.070821, 0.2668128, -1.692779, 0, 0, 0, 1, 1,
-1.069354, -1.303157, -4.002221, 0, 0, 0, 1, 1,
-1.068221, 1.008632, 0.7248565, 0, 0, 0, 1, 1,
-1.067368, 1.174906, -0.4905389, 1, 1, 1, 1, 1,
-1.066035, 0.4393344, 0.533554, 1, 1, 1, 1, 1,
-1.065523, -0.1208762, -2.964652, 1, 1, 1, 1, 1,
-1.062495, 1.547551, -1.063197, 1, 1, 1, 1, 1,
-1.056884, 1.041855, -1.891868, 1, 1, 1, 1, 1,
-1.048173, 0.003585525, -0.6045378, 1, 1, 1, 1, 1,
-1.045514, 1.048721, -0.3000995, 1, 1, 1, 1, 1,
-1.044793, 0.9168646, -1.323254, 1, 1, 1, 1, 1,
-1.040562, 1.819995, -1.800344, 1, 1, 1, 1, 1,
-1.040217, 0.7464001, -2.251657, 1, 1, 1, 1, 1,
-1.039084, 0.5275641, 0.3232289, 1, 1, 1, 1, 1,
-1.032341, -0.07375783, -1.649155, 1, 1, 1, 1, 1,
-1.031634, -0.6901565, -2.24746, 1, 1, 1, 1, 1,
-1.02348, -1.040837, -3.347132, 1, 1, 1, 1, 1,
-1.020727, 0.4748845, -1.563192, 1, 1, 1, 1, 1,
-1.016997, 0.1364544, -1.393914, 0, 0, 1, 1, 1,
-1.011698, -0.04225918, -0.7738447, 1, 0, 0, 1, 1,
-1.006066, 0.2625014, -0.1266425, 1, 0, 0, 1, 1,
-0.9914053, 0.003538055, -0.6814952, 1, 0, 0, 1, 1,
-0.9909722, 2.17667, 0.5497027, 1, 0, 0, 1, 1,
-0.9884641, 1.418653, -0.4274689, 1, 0, 0, 1, 1,
-0.9812296, 1.781575, 0.9125063, 0, 0, 0, 1, 1,
-0.9528615, -0.01320298, -3.036709, 0, 0, 0, 1, 1,
-0.9512767, -1.001206, -4.540234, 0, 0, 0, 1, 1,
-0.9480972, 0.9093061, -0.7305964, 0, 0, 0, 1, 1,
-0.947729, -0.06608462, 0.9199077, 0, 0, 0, 1, 1,
-0.9427034, -1.910231, -2.656725, 0, 0, 0, 1, 1,
-0.9367101, -1.215118, -2.245488, 0, 0, 0, 1, 1,
-0.9350835, -1.431021, -2.358377, 1, 1, 1, 1, 1,
-0.9223934, -0.9883764, -1.733717, 1, 1, 1, 1, 1,
-0.9171413, 1.33665, 0.3361695, 1, 1, 1, 1, 1,
-0.9142947, -1.419319, -3.836005, 1, 1, 1, 1, 1,
-0.9097753, -1.238912, -3.366771, 1, 1, 1, 1, 1,
-0.9081751, 0.1651762, -1.300322, 1, 1, 1, 1, 1,
-0.9081082, -0.6077492, -0.9421033, 1, 1, 1, 1, 1,
-0.8949032, 0.8693364, -0.9716222, 1, 1, 1, 1, 1,
-0.8905848, 0.6021613, -0.8525851, 1, 1, 1, 1, 1,
-0.8798774, -0.7103918, -1.543022, 1, 1, 1, 1, 1,
-0.8757377, 0.1236467, -3.185879, 1, 1, 1, 1, 1,
-0.8751427, 0.2793698, -1.254879, 1, 1, 1, 1, 1,
-0.8689125, 1.548323, -1.293235, 1, 1, 1, 1, 1,
-0.8676333, -0.8250015, -3.791045, 1, 1, 1, 1, 1,
-0.8661806, -0.1988119, -3.280691, 1, 1, 1, 1, 1,
-0.8660936, -1.163529, -2.24156, 0, 0, 1, 1, 1,
-0.8621573, 0.7975384, -0.5061386, 1, 0, 0, 1, 1,
-0.860623, 0.307403, 0.09004062, 1, 0, 0, 1, 1,
-0.8565063, -2.423062, -3.581223, 1, 0, 0, 1, 1,
-0.855537, 0.09592433, -2.030514, 1, 0, 0, 1, 1,
-0.8480334, -2.704974, -2.52509, 1, 0, 0, 1, 1,
-0.8436906, 0.523362, -1.609068, 0, 0, 0, 1, 1,
-0.8427684, -1.101545, -2.952698, 0, 0, 0, 1, 1,
-0.8398239, -0.3266066, -2.474885, 0, 0, 0, 1, 1,
-0.8396981, 0.972817, -1.786522, 0, 0, 0, 1, 1,
-0.8381883, -0.5628207, -2.544452, 0, 0, 0, 1, 1,
-0.8372508, -0.3940257, -3.649442, 0, 0, 0, 1, 1,
-0.8355038, -1.739775, -3.637004, 0, 0, 0, 1, 1,
-0.834662, 0.1134293, 1.105462, 1, 1, 1, 1, 1,
-0.8325716, 0.2021442, -2.036552, 1, 1, 1, 1, 1,
-0.8272115, -1.259103, -0.7603874, 1, 1, 1, 1, 1,
-0.823842, 0.1686532, -2.028322, 1, 1, 1, 1, 1,
-0.8120152, 0.8541543, -1.286738, 1, 1, 1, 1, 1,
-0.8077871, 0.1225666, -2.524892, 1, 1, 1, 1, 1,
-0.8047854, -0.3735519, -1.694919, 1, 1, 1, 1, 1,
-0.8011014, 0.9373508, -2.440575, 1, 1, 1, 1, 1,
-0.7969895, 0.3431148, -1.752217, 1, 1, 1, 1, 1,
-0.7928925, 0.5128731, 0.7262902, 1, 1, 1, 1, 1,
-0.7794666, 1.231071, 1.09521, 1, 1, 1, 1, 1,
-0.7722901, 1.371483, -0.959375, 1, 1, 1, 1, 1,
-0.7716706, -0.8510258, -1.289945, 1, 1, 1, 1, 1,
-0.7705938, -1.192214, -2.717034, 1, 1, 1, 1, 1,
-0.7691576, -0.580953, -0.7262864, 1, 1, 1, 1, 1,
-0.7686839, -0.8846943, -3.118395, 0, 0, 1, 1, 1,
-0.7582023, -0.535375, -3.771417, 1, 0, 0, 1, 1,
-0.7570083, 0.9064808, 0.08340465, 1, 0, 0, 1, 1,
-0.7560567, 0.6834243, -1.537093, 1, 0, 0, 1, 1,
-0.7493574, 1.406225, -2.346848, 1, 0, 0, 1, 1,
-0.7433994, -0.8877347, -2.421874, 1, 0, 0, 1, 1,
-0.7411392, -0.2939613, -0.7691944, 0, 0, 0, 1, 1,
-0.7410572, 0.9728779, -1.133601, 0, 0, 0, 1, 1,
-0.7381315, 0.2354952, -0.9662278, 0, 0, 0, 1, 1,
-0.7379104, -0.6117632, -0.289962, 0, 0, 0, 1, 1,
-0.7347121, -0.1144622, -2.690373, 0, 0, 0, 1, 1,
-0.7332493, -0.01799159, -2.085222, 0, 0, 0, 1, 1,
-0.7318323, -0.4537663, -1.562456, 0, 0, 0, 1, 1,
-0.7289916, -0.1095952, 0.1015888, 1, 1, 1, 1, 1,
-0.7284799, -0.2706861, -2.259027, 1, 1, 1, 1, 1,
-0.7225736, 0.6749728, -1.215333, 1, 1, 1, 1, 1,
-0.7208576, -0.5340154, -2.910371, 1, 1, 1, 1, 1,
-0.7177707, -0.7996436, -1.768325, 1, 1, 1, 1, 1,
-0.7164436, -0.6654004, -2.648172, 1, 1, 1, 1, 1,
-0.7126282, -1.952042, -3.219068, 1, 1, 1, 1, 1,
-0.7052681, 0.2531513, -2.124625, 1, 1, 1, 1, 1,
-0.6979451, 1.783387, -0.3083217, 1, 1, 1, 1, 1,
-0.6969513, 0.7809047, -0.3603664, 1, 1, 1, 1, 1,
-0.6962876, -0.1018752, -0.1633251, 1, 1, 1, 1, 1,
-0.6939758, -1.58163, -2.271692, 1, 1, 1, 1, 1,
-0.6847547, 0.2892493, -2.260817, 1, 1, 1, 1, 1,
-0.6836421, -1.302294, -2.048948, 1, 1, 1, 1, 1,
-0.6836379, 1.61316, -1.978893, 1, 1, 1, 1, 1,
-0.6647018, 0.791909, -0.7127291, 0, 0, 1, 1, 1,
-0.6620923, 0.7926494, -1.080259, 1, 0, 0, 1, 1,
-0.6580063, -0.8021644, -3.065979, 1, 0, 0, 1, 1,
-0.6547017, 2.129829, -0.8688599, 1, 0, 0, 1, 1,
-0.6484361, 0.7906435, -0.9362316, 1, 0, 0, 1, 1,
-0.6471071, -0.6865702, -1.709812, 1, 0, 0, 1, 1,
-0.6395745, 1.376644, 0.142603, 0, 0, 0, 1, 1,
-0.6368664, -1.161196, -3.817412, 0, 0, 0, 1, 1,
-0.6343761, -0.1465918, -1.511751, 0, 0, 0, 1, 1,
-0.6298004, -0.638387, -1.458246, 0, 0, 0, 1, 1,
-0.6296018, -0.7933085, -2.340619, 0, 0, 0, 1, 1,
-0.6221461, -0.2532023, -1.262416, 0, 0, 0, 1, 1,
-0.6220306, 0.1936982, -1.583857, 0, 0, 0, 1, 1,
-0.6182453, 1.628252, -0.6499534, 1, 1, 1, 1, 1,
-0.6073257, 0.4469676, -0.4438628, 1, 1, 1, 1, 1,
-0.5996574, -1.55274, -1.611146, 1, 1, 1, 1, 1,
-0.5955696, 0.5949214, -0.2572265, 1, 1, 1, 1, 1,
-0.5905758, -0.9482093, -1.35866, 1, 1, 1, 1, 1,
-0.5881926, -1.444161, -4.416008, 1, 1, 1, 1, 1,
-0.582374, 1.762898, -1.940405, 1, 1, 1, 1, 1,
-0.5820903, -0.5474458, -2.995388, 1, 1, 1, 1, 1,
-0.5781788, -1.352355, -4.209379, 1, 1, 1, 1, 1,
-0.5740376, -0.03667772, -1.940034, 1, 1, 1, 1, 1,
-0.571259, 0.869655, -0.1950115, 1, 1, 1, 1, 1,
-0.5508261, -0.1823163, -0.2926521, 1, 1, 1, 1, 1,
-0.548762, -1.188974, -4.037584, 1, 1, 1, 1, 1,
-0.547768, -2.097445, -1.27302, 1, 1, 1, 1, 1,
-0.5332053, 0.5175106, -1.83091, 1, 1, 1, 1, 1,
-0.5306373, -1.168654, -2.807119, 0, 0, 1, 1, 1,
-0.530405, -0.3309076, -2.04372, 1, 0, 0, 1, 1,
-0.5281653, 1.110987, 0.722455, 1, 0, 0, 1, 1,
-0.5253869, 0.1711185, 1.132951, 1, 0, 0, 1, 1,
-0.5215982, 0.2176547, -0.7734897, 1, 0, 0, 1, 1,
-0.5202991, 0.4691486, 1.499595, 1, 0, 0, 1, 1,
-0.5193196, 0.9356382, -0.9224835, 0, 0, 0, 1, 1,
-0.5190502, -1.315747, -2.561333, 0, 0, 0, 1, 1,
-0.5154254, 2.5269, -1.268669, 0, 0, 0, 1, 1,
-0.5113473, 0.4566351, -0.5087878, 0, 0, 0, 1, 1,
-0.5079184, 1.563716, 0.7218793, 0, 0, 0, 1, 1,
-0.5047116, -0.05514591, -1.564108, 0, 0, 0, 1, 1,
-0.5027446, -0.4616977, -1.632024, 0, 0, 0, 1, 1,
-0.5017508, 1.854067, 1.606549, 1, 1, 1, 1, 1,
-0.4977249, -0.7206442, -2.316326, 1, 1, 1, 1, 1,
-0.4966046, 0.6740215, -0.421887, 1, 1, 1, 1, 1,
-0.4954748, 0.02418116, -1.8849, 1, 1, 1, 1, 1,
-0.4953067, 1.401601, 0.954951, 1, 1, 1, 1, 1,
-0.4895129, -0.2936734, -1.971592, 1, 1, 1, 1, 1,
-0.4893914, 1.218997, -0.4471821, 1, 1, 1, 1, 1,
-0.4855898, -0.625524, -1.291902, 1, 1, 1, 1, 1,
-0.4840638, -0.4082145, -3.342322, 1, 1, 1, 1, 1,
-0.4826057, 1.001676, 0.9176887, 1, 1, 1, 1, 1,
-0.4823903, 0.3847192, 0.3636115, 1, 1, 1, 1, 1,
-0.4798375, -0.9434754, -1.675437, 1, 1, 1, 1, 1,
-0.4762632, 1.110617, -0.5579731, 1, 1, 1, 1, 1,
-0.4743915, -0.07479591, -1.389182, 1, 1, 1, 1, 1,
-0.4720694, 0.8064128, 1.276632, 1, 1, 1, 1, 1,
-0.4709388, 0.9827899, -1.280331, 0, 0, 1, 1, 1,
-0.4676043, 0.4039332, -3.135286, 1, 0, 0, 1, 1,
-0.4651715, -1.344819, -3.471498, 1, 0, 0, 1, 1,
-0.4565094, 0.8585886, -0.4492889, 1, 0, 0, 1, 1,
-0.4547707, 0.6966744, 0.5262178, 1, 0, 0, 1, 1,
-0.4531336, -0.5691513, -2.964325, 1, 0, 0, 1, 1,
-0.4486, 0.7325793, -1.781503, 0, 0, 0, 1, 1,
-0.4394354, -1.016916, -3.583146, 0, 0, 0, 1, 1,
-0.436926, -0.3005144, -2.921269, 0, 0, 0, 1, 1,
-0.436392, 0.4760364, -1.89904, 0, 0, 0, 1, 1,
-0.4321304, -0.6182923, -3.211737, 0, 0, 0, 1, 1,
-0.4284752, -0.01201969, -1.47625, 0, 0, 0, 1, 1,
-0.4198508, -0.0842078, -0.3674066, 0, 0, 0, 1, 1,
-0.4189588, -0.4199415, -1.776796, 1, 1, 1, 1, 1,
-0.4174253, -0.578765, -1.687025, 1, 1, 1, 1, 1,
-0.4153491, -0.2101427, -1.369379, 1, 1, 1, 1, 1,
-0.4139087, 0.04057131, -0.04456234, 1, 1, 1, 1, 1,
-0.4111236, -0.5425919, -4.996088, 1, 1, 1, 1, 1,
-0.4101761, 0.3021439, -2.036238, 1, 1, 1, 1, 1,
-0.4078418, -1.589331, -4.509024, 1, 1, 1, 1, 1,
-0.4066828, 1.329346, -0.782486, 1, 1, 1, 1, 1,
-0.4016504, -0.3465576, -1.954771, 1, 1, 1, 1, 1,
-0.3924167, 0.3572613, -0.2709252, 1, 1, 1, 1, 1,
-0.390517, -1.530983, -4.32021, 1, 1, 1, 1, 1,
-0.3894765, 0.4092775, -1.12169, 1, 1, 1, 1, 1,
-0.387305, -0.1713831, -3.432266, 1, 1, 1, 1, 1,
-0.3858119, 0.9977509, -1.115952, 1, 1, 1, 1, 1,
-0.3783778, 0.2234908, -1.598774, 1, 1, 1, 1, 1,
-0.3771176, -1.546479, -2.479709, 0, 0, 1, 1, 1,
-0.3744782, -2.235681, -3.739079, 1, 0, 0, 1, 1,
-0.3733993, 0.9662675, -0.5542244, 1, 0, 0, 1, 1,
-0.3725266, 1.459572, 1.156038, 1, 0, 0, 1, 1,
-0.3717252, 1.285708, -0.3435129, 1, 0, 0, 1, 1,
-0.3705843, 0.1935263, -2.180562, 1, 0, 0, 1, 1,
-0.3701149, 1.448637, -0.9727433, 0, 0, 0, 1, 1,
-0.3667338, -0.6779287, -1.689364, 0, 0, 0, 1, 1,
-0.3591458, -0.3440723, -2.286491, 0, 0, 0, 1, 1,
-0.3565133, -0.6823378, -2.334329, 0, 0, 0, 1, 1,
-0.351162, -0.2756859, -4.2441, 0, 0, 0, 1, 1,
-0.3510538, 0.9047843, -0.329058, 0, 0, 0, 1, 1,
-0.3505645, -1.043575, -2.592712, 0, 0, 0, 1, 1,
-0.3457884, -1.633687, -1.460977, 1, 1, 1, 1, 1,
-0.3457594, -0.7055492, -2.761524, 1, 1, 1, 1, 1,
-0.3445321, -0.1988392, -1.507378, 1, 1, 1, 1, 1,
-0.3439333, 0.4559177, -0.08338569, 1, 1, 1, 1, 1,
-0.3437128, -0.1104609, -0.8313935, 1, 1, 1, 1, 1,
-0.336729, 0.2305704, -1.08696, 1, 1, 1, 1, 1,
-0.3342987, 0.6836336, -0.3276394, 1, 1, 1, 1, 1,
-0.3335481, 0.4209152, -1.149632, 1, 1, 1, 1, 1,
-0.3326943, 0.5170756, 0.4081027, 1, 1, 1, 1, 1,
-0.3306939, 0.7391753, -1.893372, 1, 1, 1, 1, 1,
-0.3257493, 0.0131829, -1.931037, 1, 1, 1, 1, 1,
-0.3227158, -0.2992052, -1.585788, 1, 1, 1, 1, 1,
-0.3220199, -1.07663, -2.401139, 1, 1, 1, 1, 1,
-0.319779, 0.1215984, -2.221461, 1, 1, 1, 1, 1,
-0.3162894, -0.6027122, -1.84162, 1, 1, 1, 1, 1,
-0.3159112, 0.361267, -1.124287, 0, 0, 1, 1, 1,
-0.3112114, 0.2850396, -0.4614783, 1, 0, 0, 1, 1,
-0.3106568, 0.7559188, 0.03742628, 1, 0, 0, 1, 1,
-0.3097916, 0.7604918, 0.2645386, 1, 0, 0, 1, 1,
-0.3095075, -0.3725538, -2.480015, 1, 0, 0, 1, 1,
-0.3046022, -1.932333, -2.792965, 1, 0, 0, 1, 1,
-0.3037585, 0.53759, 0.06722432, 0, 0, 0, 1, 1,
-0.3008646, -0.03260933, -2.742148, 0, 0, 0, 1, 1,
-0.2913571, 1.907601, -1.012462, 0, 0, 0, 1, 1,
-0.2910189, 1.476941, -0.3122306, 0, 0, 0, 1, 1,
-0.2871673, -0.3878927, -1.654169, 0, 0, 0, 1, 1,
-0.2867209, -2.050716, -3.262863, 0, 0, 0, 1, 1,
-0.2859389, 0.03149695, -1.441934, 0, 0, 0, 1, 1,
-0.2815793, 0.01325641, -1.159776, 1, 1, 1, 1, 1,
-0.2806175, 0.6348072, 0.3996151, 1, 1, 1, 1, 1,
-0.2796885, 0.5012296, -0.6288488, 1, 1, 1, 1, 1,
-0.2712447, -1.419021, -1.820978, 1, 1, 1, 1, 1,
-0.2698863, 0.3754898, -0.8355745, 1, 1, 1, 1, 1,
-0.2696433, 0.429371, -0.1034124, 1, 1, 1, 1, 1,
-0.2685353, 0.1473993, -0.9795792, 1, 1, 1, 1, 1,
-0.2635955, -0.8389656, -3.67749, 1, 1, 1, 1, 1,
-0.2577999, -0.6558546, -1.648177, 1, 1, 1, 1, 1,
-0.2565261, 2.323439, -1.388939, 1, 1, 1, 1, 1,
-0.2565162, -0.9585121, -5.885184, 1, 1, 1, 1, 1,
-0.2515861, -0.6113152, -1.960999, 1, 1, 1, 1, 1,
-0.2500581, 1.551487, 0.6815916, 1, 1, 1, 1, 1,
-0.2496507, -1.4025, -3.733197, 1, 1, 1, 1, 1,
-0.2460594, 0.1302854, 1.119661, 1, 1, 1, 1, 1,
-0.2440765, -1.636572, -3.419988, 0, 0, 1, 1, 1,
-0.243364, -0.6725367, -2.588024, 1, 0, 0, 1, 1,
-0.2410921, -0.5598362, -0.8559507, 1, 0, 0, 1, 1,
-0.2368763, -1.648335, -1.023161, 1, 0, 0, 1, 1,
-0.2354126, -0.2950467, -1.902433, 1, 0, 0, 1, 1,
-0.2352002, -0.6019574, -2.821706, 1, 0, 0, 1, 1,
-0.235163, 0.1528883, -0.3898466, 0, 0, 0, 1, 1,
-0.2322774, 0.6594954, 0.07416082, 0, 0, 0, 1, 1,
-0.231753, 0.5744595, 1.120055, 0, 0, 0, 1, 1,
-0.2310941, -0.5843759, -2.300855, 0, 0, 0, 1, 1,
-0.2309417, -0.04190769, -2.097857, 0, 0, 0, 1, 1,
-0.2286876, -1.9326, -2.82355, 0, 0, 0, 1, 1,
-0.2237076, -0.8613114, -1.828955, 0, 0, 0, 1, 1,
-0.2191866, -0.2657393, -3.212785, 1, 1, 1, 1, 1,
-0.2187564, 0.293826, 0.1869579, 1, 1, 1, 1, 1,
-0.2152302, 0.140464, 1.011205, 1, 1, 1, 1, 1,
-0.2129002, 0.740577, -1.342601, 1, 1, 1, 1, 1,
-0.2118926, 0.9438451, -0.467607, 1, 1, 1, 1, 1,
-0.209819, 0.4044976, -0.8659115, 1, 1, 1, 1, 1,
-0.208134, 0.9510172, -2.609885, 1, 1, 1, 1, 1,
-0.2076353, 0.4926832, 0.9865987, 1, 1, 1, 1, 1,
-0.2066955, -1.079423, -3.69086, 1, 1, 1, 1, 1,
-0.2065479, 0.5728188, 0.3117969, 1, 1, 1, 1, 1,
-0.2044631, -0.285338, -1.099036, 1, 1, 1, 1, 1,
-0.20412, -0.8538139, -4.065217, 1, 1, 1, 1, 1,
-0.2028289, 0.8301821, -1.779527, 1, 1, 1, 1, 1,
-0.1983723, 0.1421684, -1.25098, 1, 1, 1, 1, 1,
-0.1946351, 1.575764, -0.1488406, 1, 1, 1, 1, 1,
-0.1880848, -0.9146495, -1.257203, 0, 0, 1, 1, 1,
-0.177573, 1.32347, 0.3810072, 1, 0, 0, 1, 1,
-0.1718012, 0.3155876, -1.176862, 1, 0, 0, 1, 1,
-0.1663833, -0.03445765, -1.138648, 1, 0, 0, 1, 1,
-0.1632102, -0.7224095, -3.777944, 1, 0, 0, 1, 1,
-0.1570295, -0.2638973, -1.594664, 1, 0, 0, 1, 1,
-0.1559482, 1.397139, 0.3270768, 0, 0, 0, 1, 1,
-0.1554586, 0.6624718, 0.1087473, 0, 0, 0, 1, 1,
-0.1474553, -1.752974, -3.410707, 0, 0, 0, 1, 1,
-0.1466014, -0.8836981, -4.016037, 0, 0, 0, 1, 1,
-0.1437356, 0.7281766, -1.173218, 0, 0, 0, 1, 1,
-0.1433496, 1.597919, 0.6425297, 0, 0, 0, 1, 1,
-0.142954, -0.3406314, -3.683605, 0, 0, 0, 1, 1,
-0.1419606, -0.2352166, -2.863455, 1, 1, 1, 1, 1,
-0.1417155, -0.06048118, 0.004625109, 1, 1, 1, 1, 1,
-0.1412443, -0.1611445, -2.13258, 1, 1, 1, 1, 1,
-0.1382748, 0.05886033, -1.599348, 1, 1, 1, 1, 1,
-0.1362141, 0.555284, -0.7563962, 1, 1, 1, 1, 1,
-0.1344963, -1.855069, -3.098727, 1, 1, 1, 1, 1,
-0.1317848, -1.199601, -4.212467, 1, 1, 1, 1, 1,
-0.126171, 0.1264472, -1.310418, 1, 1, 1, 1, 1,
-0.1232503, 0.409149, -0.08384798, 1, 1, 1, 1, 1,
-0.1164273, 0.901803, 1.565439, 1, 1, 1, 1, 1,
-0.1147384, 1.3855, -0.9076589, 1, 1, 1, 1, 1,
-0.1049612, -1.024509, -1.961421, 1, 1, 1, 1, 1,
-0.1044509, 1.344255, -0.5359753, 1, 1, 1, 1, 1,
-0.1034703, 0.8412089, -0.1018898, 1, 1, 1, 1, 1,
-0.100697, -0.4255074, -3.851552, 1, 1, 1, 1, 1,
-0.0992263, 0.8107397, -0.5513505, 0, 0, 1, 1, 1,
-0.09740185, 0.4957362, -0.7258589, 1, 0, 0, 1, 1,
-0.09686475, -1.244556, -2.718251, 1, 0, 0, 1, 1,
-0.09673756, -1.352426, -3.626466, 1, 0, 0, 1, 1,
-0.09578719, 0.5426115, 0.3986113, 1, 0, 0, 1, 1,
-0.08503976, 0.7199323, -1.619478, 1, 0, 0, 1, 1,
-0.08470776, -0.4959579, -2.894629, 0, 0, 0, 1, 1,
-0.08403084, -1.531696, -0.5665536, 0, 0, 0, 1, 1,
-0.08281409, 0.05540434, -1.940789, 0, 0, 0, 1, 1,
-0.08230635, -1.283168, -2.09257, 0, 0, 0, 1, 1,
-0.07470509, -1.443033, -3.758303, 0, 0, 0, 1, 1,
-0.0736839, -0.05019909, -2.193231, 0, 0, 0, 1, 1,
-0.07105522, -0.003745995, -3.883363, 0, 0, 0, 1, 1,
-0.06901, -0.4112101, -1.543818, 1, 1, 1, 1, 1,
-0.06869031, -0.4255556, -2.921359, 1, 1, 1, 1, 1,
-0.06706608, -0.3004141, -3.521125, 1, 1, 1, 1, 1,
-0.06358393, -2.919011, -4.311719, 1, 1, 1, 1, 1,
-0.06309825, 0.4816348, -0.3019269, 1, 1, 1, 1, 1,
-0.05860354, -0.05211869, -3.680613, 1, 1, 1, 1, 1,
-0.05651284, -0.1767955, -3.379988, 1, 1, 1, 1, 1,
-0.05313986, -0.9518117, -4.617869, 1, 1, 1, 1, 1,
-0.05225186, 0.357518, 0.279909, 1, 1, 1, 1, 1,
-0.05147568, 1.057615, -0.4755911, 1, 1, 1, 1, 1,
-0.04606462, -0.1039345, -1.855858, 1, 1, 1, 1, 1,
-0.04565111, -0.8821828, -5.4017, 1, 1, 1, 1, 1,
-0.04407816, 2.171716, 0.3740304, 1, 1, 1, 1, 1,
-0.03740674, -0.6690568, -1.813729, 1, 1, 1, 1, 1,
-0.03642746, 0.3274984, -1.027942, 1, 1, 1, 1, 1,
-0.03366918, -0.9361737, -2.530489, 0, 0, 1, 1, 1,
-0.03362678, -1.44589, -4.590425, 1, 0, 0, 1, 1,
-0.02915088, -0.3404834, -4.071004, 1, 0, 0, 1, 1,
-0.02752161, 0.495766, -0.2952892, 1, 0, 0, 1, 1,
-0.0228701, -1.223821, -3.75131, 1, 0, 0, 1, 1,
-0.01483047, 0.1959698, -0.675633, 1, 0, 0, 1, 1,
-0.01383108, -0.8515784, -0.6547616, 0, 0, 0, 1, 1,
-0.01207344, -0.801732, -3.919312, 0, 0, 0, 1, 1,
-0.01153566, 1.013649, 1.846291, 0, 0, 0, 1, 1,
-0.009794747, -0.1405029, -3.070855, 0, 0, 0, 1, 1,
-0.008847536, -0.9248823, -4.737022, 0, 0, 0, 1, 1,
-0.007088252, 0.6367263, -0.6324663, 0, 0, 0, 1, 1,
-0.006232494, -0.06644404, -2.461372, 0, 0, 0, 1, 1,
-0.004149384, 0.265914, 0.7446613, 1, 1, 1, 1, 1,
0.006008791, 0.6749151, 0.1782439, 1, 1, 1, 1, 1,
0.01000368, 1.8615, 1.433645, 1, 1, 1, 1, 1,
0.01498981, 1.30148, 0.5966343, 1, 1, 1, 1, 1,
0.01499604, -0.845309, 2.859818, 1, 1, 1, 1, 1,
0.03037448, -1.726328, 2.638016, 1, 1, 1, 1, 1,
0.03063162, -0.2496188, 3.228984, 1, 1, 1, 1, 1,
0.03432109, 0.1902991, 0.2480968, 1, 1, 1, 1, 1,
0.03642798, 0.2311393, -0.9450205, 1, 1, 1, 1, 1,
0.04092181, -0.2401383, 4.632684, 1, 1, 1, 1, 1,
0.04193598, 0.6798099, 0.3174772, 1, 1, 1, 1, 1,
0.04285379, -1.148938, 1.88582, 1, 1, 1, 1, 1,
0.04400779, -1.00953, 2.125164, 1, 1, 1, 1, 1,
0.04629099, -0.5774488, 3.263077, 1, 1, 1, 1, 1,
0.04713262, 2.161691, -1.134349, 1, 1, 1, 1, 1,
0.04803257, 0.2421277, 1.45655, 0, 0, 1, 1, 1,
0.04951987, -0.9101038, 3.847831, 1, 0, 0, 1, 1,
0.05383018, 1.51155, 2.542557, 1, 0, 0, 1, 1,
0.0556406, 0.1487429, -0.4958819, 1, 0, 0, 1, 1,
0.05654304, -0.01832871, 0.272445, 1, 0, 0, 1, 1,
0.05892714, 0.6390725, -0.9741137, 1, 0, 0, 1, 1,
0.06089104, 0.5046819, -1.727012, 0, 0, 0, 1, 1,
0.06216051, 0.3022271, -0.939528, 0, 0, 0, 1, 1,
0.06534749, -0.100069, 3.67774, 0, 0, 0, 1, 1,
0.07262904, 0.4539642, 1.222765, 0, 0, 0, 1, 1,
0.07863145, -0.4787057, 2.575012, 0, 0, 0, 1, 1,
0.08777586, -0.7403368, 2.358066, 0, 0, 0, 1, 1,
0.0883809, 1.168764, 2.724185, 0, 0, 0, 1, 1,
0.088992, 3.273356, 1.697614, 1, 1, 1, 1, 1,
0.09841166, -1.226715, 3.230128, 1, 1, 1, 1, 1,
0.1006903, 0.8083733, -1.609607, 1, 1, 1, 1, 1,
0.1027274, 0.05041203, 0.5097083, 1, 1, 1, 1, 1,
0.1073827, 0.01186689, 3.669602, 1, 1, 1, 1, 1,
0.1092938, 0.1696343, -0.1482624, 1, 1, 1, 1, 1,
0.118258, -0.3553917, 4.311057, 1, 1, 1, 1, 1,
0.119694, -1.860692, 4.335076, 1, 1, 1, 1, 1,
0.1198377, -1.445916, 3.240223, 1, 1, 1, 1, 1,
0.1203536, 0.531513, -1.331133, 1, 1, 1, 1, 1,
0.1204846, 0.1109472, 1.785767, 1, 1, 1, 1, 1,
0.1260998, 0.1384848, 0.4469829, 1, 1, 1, 1, 1,
0.1272143, -0.184882, 2.360061, 1, 1, 1, 1, 1,
0.1297502, 0.1652571, -0.1543048, 1, 1, 1, 1, 1,
0.1322661, -1.459221, 2.71489, 1, 1, 1, 1, 1,
0.1329099, 1.681906, -0.8019671, 0, 0, 1, 1, 1,
0.1330019, 0.4702318, 0.1382299, 1, 0, 0, 1, 1,
0.1343119, 1.636765, -0.9097733, 1, 0, 0, 1, 1,
0.1405561, -0.3454818, 0.85485, 1, 0, 0, 1, 1,
0.1436842, 0.4301187, -0.6146273, 1, 0, 0, 1, 1,
0.1531956, -0.326515, 2.409212, 1, 0, 0, 1, 1,
0.1537541, 0.7521014, 0.02349175, 0, 0, 0, 1, 1,
0.1604567, 0.3096248, 1.212873, 0, 0, 0, 1, 1,
0.1653055, -0.8240552, 2.00539, 0, 0, 0, 1, 1,
0.1655644, 0.4540132, 0.4488769, 0, 0, 0, 1, 1,
0.17148, -0.1766293, 3.72996, 0, 0, 0, 1, 1,
0.1792054, 0.2505076, 1.522413, 0, 0, 0, 1, 1,
0.1810888, 2.207581, -1.130365, 0, 0, 0, 1, 1,
0.1833421, -0.05078197, 0.1571965, 1, 1, 1, 1, 1,
0.186177, -1.677765, 2.818834, 1, 1, 1, 1, 1,
0.1872659, -0.5851596, 2.347321, 1, 1, 1, 1, 1,
0.1883843, -0.2383508, 1.865649, 1, 1, 1, 1, 1,
0.1887646, 0.7537113, -0.3271423, 1, 1, 1, 1, 1,
0.1889099, -1.234066, 2.113652, 1, 1, 1, 1, 1,
0.1891271, -2.744739, 1.905042, 1, 1, 1, 1, 1,
0.1926604, 0.6647569, 0.5985507, 1, 1, 1, 1, 1,
0.1927329, -0.7132943, 3.921139, 1, 1, 1, 1, 1,
0.2065983, 0.1370364, -0.3019579, 1, 1, 1, 1, 1,
0.2109815, -0.6914665, 2.573123, 1, 1, 1, 1, 1,
0.2147346, 0.09089307, 1.541721, 1, 1, 1, 1, 1,
0.2160957, 1.307453, 1.58715, 1, 1, 1, 1, 1,
0.2177152, 1.766989, -1.29379, 1, 1, 1, 1, 1,
0.2186629, -0.3460152, 3.472153, 1, 1, 1, 1, 1,
0.2188574, -1.230084, 2.968643, 0, 0, 1, 1, 1,
0.2203808, -0.9612649, 3.488371, 1, 0, 0, 1, 1,
0.2210674, -0.247671, 3.373822, 1, 0, 0, 1, 1,
0.2218151, -2.233583, 2.472211, 1, 0, 0, 1, 1,
0.2253544, -0.3620861, 2.555951, 1, 0, 0, 1, 1,
0.2264076, 0.3310288, 2.106291, 1, 0, 0, 1, 1,
0.2287316, -0.3616194, 0.6759844, 0, 0, 0, 1, 1,
0.2314807, -2.132135, 4.052031, 0, 0, 0, 1, 1,
0.2323167, -0.194106, 1.768371, 0, 0, 0, 1, 1,
0.2325169, 0.9677598, 0.01787792, 0, 0, 0, 1, 1,
0.234533, -1.620281, 4.102597, 0, 0, 0, 1, 1,
0.2348683, -0.5512146, 3.237941, 0, 0, 0, 1, 1,
0.2380046, 0.4812824, 2.713677, 0, 0, 0, 1, 1,
0.2448302, -0.9207093, 1.699723, 1, 1, 1, 1, 1,
0.2466539, -1.687277, 2.951617, 1, 1, 1, 1, 1,
0.2516143, -2.249401, 3.395432, 1, 1, 1, 1, 1,
0.2609663, 0.2181144, 1.215755, 1, 1, 1, 1, 1,
0.2620521, -1.50335, 3.311327, 1, 1, 1, 1, 1,
0.2622919, -1.211829, 3.228248, 1, 1, 1, 1, 1,
0.264539, -1.064694, 2.610985, 1, 1, 1, 1, 1,
0.2675617, 1.886025, 0.4801024, 1, 1, 1, 1, 1,
0.2685852, -0.5215335, 1.052173, 1, 1, 1, 1, 1,
0.2686343, -0.2684066, 1.427058, 1, 1, 1, 1, 1,
0.2730141, 0.9606802, 0.08109292, 1, 1, 1, 1, 1,
0.2733142, 0.6748589, 1.312676, 1, 1, 1, 1, 1,
0.2736346, -1.195057, 3.734112, 1, 1, 1, 1, 1,
0.2788592, -0.1222114, 1.234711, 1, 1, 1, 1, 1,
0.282139, 0.6964452, 0.07221214, 1, 1, 1, 1, 1,
0.2835595, 1.726134, 2.068999, 0, 0, 1, 1, 1,
0.2847308, 0.4213021, 0.1726789, 1, 0, 0, 1, 1,
0.2881546, -0.08364351, 0.9867102, 1, 0, 0, 1, 1,
0.2883031, -0.07082178, 3.05545, 1, 0, 0, 1, 1,
0.288438, -1.389615, 3.309373, 1, 0, 0, 1, 1,
0.2913093, -1.352345, 3.25616, 1, 0, 0, 1, 1,
0.2915181, 1.351844, 0.4459726, 0, 0, 0, 1, 1,
0.2938346, 0.2555377, 2.607112, 0, 0, 0, 1, 1,
0.2939061, 0.1596218, -0.02799574, 0, 0, 0, 1, 1,
0.2960301, 0.01718565, -0.816321, 0, 0, 0, 1, 1,
0.2961558, 0.4371334, 0.4330181, 0, 0, 0, 1, 1,
0.3012729, 0.7327668, -1.038462, 0, 0, 0, 1, 1,
0.3061301, 0.09827012, 0.4331013, 0, 0, 0, 1, 1,
0.3065246, -0.4080925, 3.092369, 1, 1, 1, 1, 1,
0.3117694, -0.8166866, 1.837214, 1, 1, 1, 1, 1,
0.3138721, 0.5977783, 0.6812437, 1, 1, 1, 1, 1,
0.3170623, -0.5448306, 1.402352, 1, 1, 1, 1, 1,
0.3225433, 0.2811197, 1.929632, 1, 1, 1, 1, 1,
0.3226593, 0.625975, 0.8540535, 1, 1, 1, 1, 1,
0.3249981, -0.3931405, 1.825639, 1, 1, 1, 1, 1,
0.3253604, -0.8794876, 2.650657, 1, 1, 1, 1, 1,
0.3300805, -0.02607751, 2.190434, 1, 1, 1, 1, 1,
0.3305597, 0.2288334, 1.287771, 1, 1, 1, 1, 1,
0.3361225, 0.2359229, 1.795354, 1, 1, 1, 1, 1,
0.3390512, -0.1912889, 1.679454, 1, 1, 1, 1, 1,
0.3399601, 0.7801486, -0.5470473, 1, 1, 1, 1, 1,
0.3457703, -1.135472, 3.546701, 1, 1, 1, 1, 1,
0.3480898, -1.435971, 4.738796, 1, 1, 1, 1, 1,
0.3524956, 0.2580738, 2.054712, 0, 0, 1, 1, 1,
0.3527164, 0.9554644, 0.2322912, 1, 0, 0, 1, 1,
0.3533169, 0.1685915, 1.627331, 1, 0, 0, 1, 1,
0.3537404, -0.973249, 2.575232, 1, 0, 0, 1, 1,
0.35379, 0.9676129, -0.3370047, 1, 0, 0, 1, 1,
0.3567131, 1.509063, 0.7676439, 1, 0, 0, 1, 1,
0.3605725, 0.4578952, 0.007425017, 0, 0, 0, 1, 1,
0.360903, 0.3928985, 1.123268, 0, 0, 0, 1, 1,
0.3614277, 0.3740002, -0.09372181, 0, 0, 0, 1, 1,
0.361772, 0.1249385, 2.142863, 0, 0, 0, 1, 1,
0.3656789, 1.199597, 2.101311, 0, 0, 0, 1, 1,
0.3664426, -0.8289235, 3.130515, 0, 0, 0, 1, 1,
0.3685492, -0.445268, 2.980002, 0, 0, 0, 1, 1,
0.3721494, -1.853698, 3.369298, 1, 1, 1, 1, 1,
0.3736946, 1.583497, -1.609518, 1, 1, 1, 1, 1,
0.3748465, 0.6899355, -0.8373582, 1, 1, 1, 1, 1,
0.3776369, 0.7473344, 0.4071768, 1, 1, 1, 1, 1,
0.378231, -0.4485099, 0.7964553, 1, 1, 1, 1, 1,
0.3803842, 0.04172363, 1.825464, 1, 1, 1, 1, 1,
0.381986, -1.689789, 3.00293, 1, 1, 1, 1, 1,
0.3820694, -0.935652, 2.732625, 1, 1, 1, 1, 1,
0.386224, 0.4235614, 0.396053, 1, 1, 1, 1, 1,
0.3862805, 0.7299536, -0.237305, 1, 1, 1, 1, 1,
0.387351, 1.699707, 1.210776, 1, 1, 1, 1, 1,
0.3883564, -0.1391508, 2.470792, 1, 1, 1, 1, 1,
0.3968086, -0.3780675, 1.801517, 1, 1, 1, 1, 1,
0.3984896, -0.5272547, 4.154533, 1, 1, 1, 1, 1,
0.4029659, -0.02640994, 0.8266982, 1, 1, 1, 1, 1,
0.4042637, 1.008969, -0.2371658, 0, 0, 1, 1, 1,
0.4049241, -0.05009168, 0.9483958, 1, 0, 0, 1, 1,
0.4049555, -1.361055, 2.395729, 1, 0, 0, 1, 1,
0.4054826, -1.008584, 3.791745, 1, 0, 0, 1, 1,
0.4070973, -2.174387, 2.059606, 1, 0, 0, 1, 1,
0.4117704, -2.961552, 2.251596, 1, 0, 0, 1, 1,
0.4157486, -1.474248, 3.989253, 0, 0, 0, 1, 1,
0.4163666, -0.06799633, 1.330995, 0, 0, 0, 1, 1,
0.4203552, 0.3492405, 0.01360742, 0, 0, 0, 1, 1,
0.421667, 0.655793, -0.6146149, 0, 0, 0, 1, 1,
0.421734, 0.8697414, -0.6594149, 0, 0, 0, 1, 1,
0.4219901, -0.8899815, 3.338728, 0, 0, 0, 1, 1,
0.4220737, 1.364771, -0.9538857, 0, 0, 0, 1, 1,
0.4224121, 1.813474, -0.7724487, 1, 1, 1, 1, 1,
0.42949, -0.2473276, 1.121896, 1, 1, 1, 1, 1,
0.4302879, 0.04850759, -0.2203333, 1, 1, 1, 1, 1,
0.4321534, 0.5696588, 0.9186995, 1, 1, 1, 1, 1,
0.4361358, 0.3068486, 0.4537421, 1, 1, 1, 1, 1,
0.4370825, 0.1917073, -0.3104906, 1, 1, 1, 1, 1,
0.4387562, 0.42055, 1.66447, 1, 1, 1, 1, 1,
0.4409235, 0.7808603, -0.4565655, 1, 1, 1, 1, 1,
0.442281, -0.880847, 1.364947, 1, 1, 1, 1, 1,
0.4459376, 0.9559373, 0.9280096, 1, 1, 1, 1, 1,
0.4487768, 0.8375614, 1.22912, 1, 1, 1, 1, 1,
0.4488013, -1.929504, 1.707878, 1, 1, 1, 1, 1,
0.4496135, -1.787438, 1.535182, 1, 1, 1, 1, 1,
0.4518096, 0.7430364, 1.638619, 1, 1, 1, 1, 1,
0.4578798, 0.1240794, 0.8552261, 1, 1, 1, 1, 1,
0.4586304, 1.152437, 0.7388611, 0, 0, 1, 1, 1,
0.4612235, 0.3130243, 1.040836, 1, 0, 0, 1, 1,
0.4652417, -0.5295873, 2.040513, 1, 0, 0, 1, 1,
0.4689139, -0.6085482, 2.890452, 1, 0, 0, 1, 1,
0.469154, 1.883336, -0.5452349, 1, 0, 0, 1, 1,
0.470853, 1.202806, 1.124768, 1, 0, 0, 1, 1,
0.4713673, -1.218337, 3.094197, 0, 0, 0, 1, 1,
0.4731394, 0.6920052, -0.278769, 0, 0, 0, 1, 1,
0.4741246, 0.1175315, 2.751405, 0, 0, 0, 1, 1,
0.4812135, -0.3236115, 2.113713, 0, 0, 0, 1, 1,
0.4814696, 1.447739, 1.681927, 0, 0, 0, 1, 1,
0.4824388, -1.625359, 4.377892, 0, 0, 0, 1, 1,
0.4830539, -0.9217203, 3.079604, 0, 0, 0, 1, 1,
0.4873026, -0.007744079, 2.040861, 1, 1, 1, 1, 1,
0.4888359, 0.7673522, 2.66103, 1, 1, 1, 1, 1,
0.4902328, 1.740497, 1.713136, 1, 1, 1, 1, 1,
0.5005209, -1.158805, 3.636407, 1, 1, 1, 1, 1,
0.5014431, -1.00128, 3.775212, 1, 1, 1, 1, 1,
0.5027708, 0.1325361, 2.768365, 1, 1, 1, 1, 1,
0.5031088, -1.426293, 3.729907, 1, 1, 1, 1, 1,
0.5035356, 0.276349, 1.635918, 1, 1, 1, 1, 1,
0.5044496, 1.422284, 0.7776145, 1, 1, 1, 1, 1,
0.5066906, -1.395578, 2.745737, 1, 1, 1, 1, 1,
0.5070838, -1.023075, 2.960667, 1, 1, 1, 1, 1,
0.5101741, -0.2553259, 0.4603158, 1, 1, 1, 1, 1,
0.5121847, -0.4882942, 2.276906, 1, 1, 1, 1, 1,
0.5132025, 0.08761325, 0.144317, 1, 1, 1, 1, 1,
0.5141525, -0.7016926, 0.8059673, 1, 1, 1, 1, 1,
0.5231495, -1.659233, 4.285334, 0, 0, 1, 1, 1,
0.5241416, 0.6484159, 1.388275, 1, 0, 0, 1, 1,
0.5265499, 1.003448, 2.665339, 1, 0, 0, 1, 1,
0.5298255, 1.660942, -0.3138201, 1, 0, 0, 1, 1,
0.5316706, -1.584516, 4.003352, 1, 0, 0, 1, 1,
0.5529881, -0.1118031, 1.47032, 1, 0, 0, 1, 1,
0.5608972, -1.073689, 2.745751, 0, 0, 0, 1, 1,
0.5626711, 2.056993, -0.1811456, 0, 0, 0, 1, 1,
0.5644395, 0.495042, 1.101254, 0, 0, 0, 1, 1,
0.5646197, 0.7788455, -0.1206873, 0, 0, 0, 1, 1,
0.5653939, 0.04944808, 2.074643, 0, 0, 0, 1, 1,
0.568311, 0.6233954, 0.53703, 0, 0, 0, 1, 1,
0.5734155, 0.901176, -0.06965122, 0, 0, 0, 1, 1,
0.5740698, -0.2476793, 2.484451, 1, 1, 1, 1, 1,
0.5756243, -1.279104, 1.122561, 1, 1, 1, 1, 1,
0.577279, 0.4401183, 0.400338, 1, 1, 1, 1, 1,
0.579015, -0.01003729, 2.635824, 1, 1, 1, 1, 1,
0.5834503, 2.431671, -2.078757, 1, 1, 1, 1, 1,
0.5911793, 0.1807635, 0.9928281, 1, 1, 1, 1, 1,
0.593897, 0.4683619, -0.038501, 1, 1, 1, 1, 1,
0.6053635, 1.148162, 0.6203714, 1, 1, 1, 1, 1,
0.6110118, 0.07680152, 0.9150049, 1, 1, 1, 1, 1,
0.6113645, -0.805785, 2.936908, 1, 1, 1, 1, 1,
0.6114451, 0.1893937, 1.148567, 1, 1, 1, 1, 1,
0.6189984, 1.033099, -0.3729947, 1, 1, 1, 1, 1,
0.6220159, 0.5090467, 1.412958, 1, 1, 1, 1, 1,
0.6234498, -0.865362, 2.411262, 1, 1, 1, 1, 1,
0.6253148, -1.1529, 0.4887671, 1, 1, 1, 1, 1,
0.625329, -1.710482, 2.812096, 0, 0, 1, 1, 1,
0.627047, -1.939206, 4.647275, 1, 0, 0, 1, 1,
0.6316327, 0.6843932, -0.1189176, 1, 0, 0, 1, 1,
0.6460281, -0.7878649, 1.749916, 1, 0, 0, 1, 1,
0.6498266, -0.6919101, 3.960536, 1, 0, 0, 1, 1,
0.6514204, -1.180842, 1.519487, 1, 0, 0, 1, 1,
0.6515241, 0.3909882, 1.547059, 0, 0, 0, 1, 1,
0.6530059, 1.42456, 0.7715474, 0, 0, 0, 1, 1,
0.6605849, 1.440119, 2.100142, 0, 0, 0, 1, 1,
0.6626321, 1.31634, -0.02096946, 0, 0, 0, 1, 1,
0.6652893, 0.5820075, 0.8918291, 0, 0, 0, 1, 1,
0.6655311, 0.5619532, 0.4018997, 0, 0, 0, 1, 1,
0.6680398, 0.6432147, 0.1136346, 0, 0, 0, 1, 1,
0.6683018, -0.4957134, 2.319948, 1, 1, 1, 1, 1,
0.6727924, 0.2028622, 1.236879, 1, 1, 1, 1, 1,
0.6750895, 0.1210909, 0.04429977, 1, 1, 1, 1, 1,
0.6813654, 0.7841368, 1.555081, 1, 1, 1, 1, 1,
0.6821194, -1.3375, 1.023186, 1, 1, 1, 1, 1,
0.6843242, 1.27606, -0.2085325, 1, 1, 1, 1, 1,
0.6852987, 0.1673423, 0.7067173, 1, 1, 1, 1, 1,
0.6856797, 0.133281, 1.066067, 1, 1, 1, 1, 1,
0.6869692, 0.2412839, 1.204598, 1, 1, 1, 1, 1,
0.6871542, -0.4145869, 3.051071, 1, 1, 1, 1, 1,
0.7062711, 0.3809093, 0.335874, 1, 1, 1, 1, 1,
0.7063564, -0.6807199, 0.8382478, 1, 1, 1, 1, 1,
0.7074996, -0.3849917, 2.014402, 1, 1, 1, 1, 1,
0.7116106, -1.298575, 3.055678, 1, 1, 1, 1, 1,
0.712281, -0.7983856, 1.038818, 1, 1, 1, 1, 1,
0.7131916, -0.4101554, 0.7830278, 0, 0, 1, 1, 1,
0.7138457, -0.8772779, 2.539019, 1, 0, 0, 1, 1,
0.7211463, 0.1702033, 2.301553, 1, 0, 0, 1, 1,
0.7297959, -0.6278527, 0.9857145, 1, 0, 0, 1, 1,
0.7327127, -0.983004, 3.591061, 1, 0, 0, 1, 1,
0.741139, -1.781382, 2.296374, 1, 0, 0, 1, 1,
0.7480127, -0.9103639, 1.781223, 0, 0, 0, 1, 1,
0.7494223, -0.854618, 3.358307, 0, 0, 0, 1, 1,
0.7521145, -0.4526734, 1.741269, 0, 0, 0, 1, 1,
0.7536284, -1.226153, 1.834884, 0, 0, 0, 1, 1,
0.7557216, 0.9603813, 0.8980022, 0, 0, 0, 1, 1,
0.7574817, -0.874338, 1.626457, 0, 0, 0, 1, 1,
0.7596836, -0.1925153, 3.49748, 0, 0, 0, 1, 1,
0.7704945, -0.6221558, 1.158886, 1, 1, 1, 1, 1,
0.7823689, 0.1572462, 1.121063, 1, 1, 1, 1, 1,
0.7838225, -0.6135545, 3.224783, 1, 1, 1, 1, 1,
0.7851005, -0.1514409, 2.77757, 1, 1, 1, 1, 1,
0.79016, -0.8777369, 2.942608, 1, 1, 1, 1, 1,
0.7907379, 0.9871733, -0.656594, 1, 1, 1, 1, 1,
0.7999662, -1.494872, 2.597275, 1, 1, 1, 1, 1,
0.8098525, 0.607183, 1.387358, 1, 1, 1, 1, 1,
0.809927, -0.9766558, 1.470086, 1, 1, 1, 1, 1,
0.8136615, 0.2602935, 1.291006, 1, 1, 1, 1, 1,
0.8189214, 1.014198, 0.4342571, 1, 1, 1, 1, 1,
0.8208374, 1.07849, 0.7880176, 1, 1, 1, 1, 1,
0.8211702, -1.638031, 3.641387, 1, 1, 1, 1, 1,
0.8223372, -0.3534576, 2.338115, 1, 1, 1, 1, 1,
0.822946, 1.405512, -0.5705221, 1, 1, 1, 1, 1,
0.8240098, -1.664493, 3.01239, 0, 0, 1, 1, 1,
0.8283968, 0.9872253, -0.2684948, 1, 0, 0, 1, 1,
0.8363152, 0.08255148, 2.108949, 1, 0, 0, 1, 1,
0.8387114, 1.449791, 1.139703, 1, 0, 0, 1, 1,
0.8412421, -0.2622848, 0.8699536, 1, 0, 0, 1, 1,
0.8424421, 0.2325137, 0.8382091, 1, 0, 0, 1, 1,
0.8427436, 1.186391, 0.4584331, 0, 0, 0, 1, 1,
0.8428187, -0.6197258, 3.831228, 0, 0, 0, 1, 1,
0.8475348, 1.257108, 0.4254255, 0, 0, 0, 1, 1,
0.8507445, -1.289547, 1.755487, 0, 0, 0, 1, 1,
0.8594822, -0.917663, 0.9863458, 0, 0, 0, 1, 1,
0.8649663, 0.05694314, 2.200148, 0, 0, 0, 1, 1,
0.8701027, -0.02122354, 0.6809819, 0, 0, 0, 1, 1,
0.8714455, 1.771169, 0.8193201, 1, 1, 1, 1, 1,
0.871546, 1.929154, -0.7852676, 1, 1, 1, 1, 1,
0.8727163, 0.4644362, 0.7609193, 1, 1, 1, 1, 1,
0.8734012, -1.020216, 3.661675, 1, 1, 1, 1, 1,
0.8786238, -0.0215762, 1.101891, 1, 1, 1, 1, 1,
0.8809082, -1.902702, 3.547824, 1, 1, 1, 1, 1,
0.8827195, 0.2489844, 1.14007, 1, 1, 1, 1, 1,
0.8828669, 0.2104204, 2.44969, 1, 1, 1, 1, 1,
0.8843277, 0.1488084, 1.236552, 1, 1, 1, 1, 1,
0.8848438, -0.4189764, 2.307417, 1, 1, 1, 1, 1,
0.8855637, -0.7579231, 3.708114, 1, 1, 1, 1, 1,
0.8975112, -1.204092, 1.514252, 1, 1, 1, 1, 1,
0.8982918, -0.3490013, 0.361119, 1, 1, 1, 1, 1,
0.9090004, -0.9592424, 2.795669, 1, 1, 1, 1, 1,
0.9101627, -0.9098778, 1.779058, 1, 1, 1, 1, 1,
0.9186228, 1.456059, 0.2409266, 0, 0, 1, 1, 1,
0.9205129, -1.152208, 2.856666, 1, 0, 0, 1, 1,
0.9205186, 0.3707299, 1.990036, 1, 0, 0, 1, 1,
0.921609, -0.5081329, 1.942914, 1, 0, 0, 1, 1,
0.9223583, -0.9041695, 2.984976, 1, 0, 0, 1, 1,
0.9262753, -0.2035879, 2.568028, 1, 0, 0, 1, 1,
0.9275002, -0.8298803, 2.932678, 0, 0, 0, 1, 1,
0.9281646, 0.4629524, 2.261539, 0, 0, 0, 1, 1,
0.9312443, -0.2364998, 2.841667, 0, 0, 0, 1, 1,
0.9375792, 1.144304, 1.283307, 0, 0, 0, 1, 1,
0.9401072, -0.4182089, -0.5161955, 0, 0, 0, 1, 1,
0.9437431, 0.1828157, 2.683851, 0, 0, 0, 1, 1,
0.948081, 0.9116994, -0.9688747, 0, 0, 0, 1, 1,
0.9539356, -1.131335, 2.099038, 1, 1, 1, 1, 1,
0.9548669, -0.3311599, 0.9109888, 1, 1, 1, 1, 1,
0.9578878, 1.489274, 0.1869796, 1, 1, 1, 1, 1,
0.9674455, -1.398443, 2.791465, 1, 1, 1, 1, 1,
0.978973, -1.315693, 2.097573, 1, 1, 1, 1, 1,
0.9801651, 0.09912977, 1.938239, 1, 1, 1, 1, 1,
0.980764, -0.9804807, 1.981973, 1, 1, 1, 1, 1,
0.9813563, 0.09430323, 1.977615, 1, 1, 1, 1, 1,
0.9843359, 1.192728, 2.274134, 1, 1, 1, 1, 1,
0.986376, -0.5725881, 1.95449, 1, 1, 1, 1, 1,
0.9870261, 1.479359, 2.206032, 1, 1, 1, 1, 1,
0.9952707, 0.2607661, 1.643607, 1, 1, 1, 1, 1,
0.9995111, -0.04078859, 0.3545795, 1, 1, 1, 1, 1,
0.9996722, 0.6433039, 2.539437, 1, 1, 1, 1, 1,
1.002879, 0.372272, 0.9256962, 1, 1, 1, 1, 1,
1.006423, -0.4364898, 0.9615535, 0, 0, 1, 1, 1,
1.006572, 1.726491, -0.2972471, 1, 0, 0, 1, 1,
1.007648, -1.70664, 3.596497, 1, 0, 0, 1, 1,
1.007968, 0.3942347, 0.05462945, 1, 0, 0, 1, 1,
1.00899, -0.1590488, 2.308487, 1, 0, 0, 1, 1,
1.013725, 0.8386762, 0.8893359, 1, 0, 0, 1, 1,
1.018791, 0.8995764, 0.2250751, 0, 0, 0, 1, 1,
1.019087, -2.807146, 1.572542, 0, 0, 0, 1, 1,
1.019497, 0.87596, 1.598639, 0, 0, 0, 1, 1,
1.021761, 0.6550847, 0.2746316, 0, 0, 0, 1, 1,
1.02624, 0.8311709, 1.761093, 0, 0, 0, 1, 1,
1.027031, 0.07235654, 1.117877, 0, 0, 0, 1, 1,
1.029543, 1.258589, 2.061736, 0, 0, 0, 1, 1,
1.031702, 0.2067237, 2.434086, 1, 1, 1, 1, 1,
1.032839, -1.44857, 2.317753, 1, 1, 1, 1, 1,
1.035543, -0.5981532, 3.296348, 1, 1, 1, 1, 1,
1.044878, -1.31938, 1.618222, 1, 1, 1, 1, 1,
1.046893, -1.170295, 1.82743, 1, 1, 1, 1, 1,
1.056253, 0.1797784, 2.035584, 1, 1, 1, 1, 1,
1.057861, 1.343679, 0.7931479, 1, 1, 1, 1, 1,
1.061719, 0.752727, 2.168691, 1, 1, 1, 1, 1,
1.066451, 0.4865173, 1.128229, 1, 1, 1, 1, 1,
1.069548, -1.840221, 3.053911, 1, 1, 1, 1, 1,
1.076614, -0.1975171, 2.030076, 1, 1, 1, 1, 1,
1.083282, -0.6429901, 1.093686, 1, 1, 1, 1, 1,
1.108292, -0.5978068, 0.4557173, 1, 1, 1, 1, 1,
1.109876, -0.238831, 3.233513, 1, 1, 1, 1, 1,
1.120798, -0.2948373, 0.6083989, 1, 1, 1, 1, 1,
1.126119, 1.031946, 2.446644, 0, 0, 1, 1, 1,
1.129395, -2.132969, 2.344036, 1, 0, 0, 1, 1,
1.130551, 0.2087818, 2.945298, 1, 0, 0, 1, 1,
1.131725, 0.5748652, 0.3260997, 1, 0, 0, 1, 1,
1.135261, 0.1390613, 2.754737, 1, 0, 0, 1, 1,
1.153732, -0.6865096, 3.535678, 1, 0, 0, 1, 1,
1.154788, 0.2369123, 1.372284, 0, 0, 0, 1, 1,
1.170386, -0.4858219, 2.203071, 0, 0, 0, 1, 1,
1.170585, -1.199938, 1.003157, 0, 0, 0, 1, 1,
1.171139, 0.6558519, 0.4748869, 0, 0, 0, 1, 1,
1.178896, 1.066634, 0.7244191, 0, 0, 0, 1, 1,
1.179884, -0.4134226, 2.403918, 0, 0, 0, 1, 1,
1.199686, -0.4398842, 2.763796, 0, 0, 0, 1, 1,
1.203086, -0.976186, 1.167472, 1, 1, 1, 1, 1,
1.207264, 1.749531, 0.9967306, 1, 1, 1, 1, 1,
1.211623, 0.06195469, 0.8292146, 1, 1, 1, 1, 1,
1.213081, -0.6798826, 1.152396, 1, 1, 1, 1, 1,
1.214666, -0.07386445, 1.067464, 1, 1, 1, 1, 1,
1.223398, 2.234078, 1.007779, 1, 1, 1, 1, 1,
1.240111, 0.579982, 0.2193459, 1, 1, 1, 1, 1,
1.242638, -0.3062267, 0.1400036, 1, 1, 1, 1, 1,
1.252282, -0.1075958, 3.290609, 1, 1, 1, 1, 1,
1.267159, -0.7655047, 3.840398, 1, 1, 1, 1, 1,
1.269765, 0.001135106, 1.448018, 1, 1, 1, 1, 1,
1.271228, -2.167329, 3.00212, 1, 1, 1, 1, 1,
1.278087, 1.026864, 1.579154, 1, 1, 1, 1, 1,
1.27899, 1.276819, 1.177301, 1, 1, 1, 1, 1,
1.281082, -0.04871156, 1.650669, 1, 1, 1, 1, 1,
1.282461, -0.7702683, 2.45276, 0, 0, 1, 1, 1,
1.289534, -0.6746089, 1.281633, 1, 0, 0, 1, 1,
1.300206, 0.1302529, 0.7282565, 1, 0, 0, 1, 1,
1.317713, -1.323321, 2.025262, 1, 0, 0, 1, 1,
1.327925, -0.4477725, 2.07964, 1, 0, 0, 1, 1,
1.328336, -0.5751559, 3.583827, 1, 0, 0, 1, 1,
1.332902, 1.057523, -1.981132, 0, 0, 0, 1, 1,
1.336898, -0.8544614, 4.016422, 0, 0, 0, 1, 1,
1.349054, -2.177238, 2.194249, 0, 0, 0, 1, 1,
1.36915, -1.764639, 0.4043152, 0, 0, 0, 1, 1,
1.370012, -0.7683866, 1.649467, 0, 0, 0, 1, 1,
1.381432, -0.8863614, 3.271253, 0, 0, 0, 1, 1,
1.385787, -0.493199, 2.750755, 0, 0, 0, 1, 1,
1.387045, 1.273819, 1.118481, 1, 1, 1, 1, 1,
1.392935, -0.0003706447, 3.498459, 1, 1, 1, 1, 1,
1.407382, -0.0224359, 1.420877, 1, 1, 1, 1, 1,
1.412624, 1.973108, -0.228984, 1, 1, 1, 1, 1,
1.419276, 0.5555179, 1.14618, 1, 1, 1, 1, 1,
1.419515, 0.3743507, 2.440904, 1, 1, 1, 1, 1,
1.419974, 0.3744316, 1.296568, 1, 1, 1, 1, 1,
1.429102, -1.064038, -0.2991739, 1, 1, 1, 1, 1,
1.444885, -0.5474696, 1.519424, 1, 1, 1, 1, 1,
1.446069, 0.4496014, 1.746206, 1, 1, 1, 1, 1,
1.465355, 0.06987753, 1.720897, 1, 1, 1, 1, 1,
1.466585, 0.1482961, 1.043471, 1, 1, 1, 1, 1,
1.470582, 0.5438785, 1.783965, 1, 1, 1, 1, 1,
1.473349, -1.378065, 0.6561971, 1, 1, 1, 1, 1,
1.47521, 0.04886987, 0.4623664, 1, 1, 1, 1, 1,
1.476119, 1.625249, 1.119624, 0, 0, 1, 1, 1,
1.480672, 0.4223436, 2.042462, 1, 0, 0, 1, 1,
1.481123, 0.160067, 0.6864104, 1, 0, 0, 1, 1,
1.491087, 0.1137177, 2.309777, 1, 0, 0, 1, 1,
1.492589, -0.7669178, 1.449518, 1, 0, 0, 1, 1,
1.498783, 0.1028074, 3.607385, 1, 0, 0, 1, 1,
1.498829, 0.19455, 2.500397, 0, 0, 0, 1, 1,
1.505705, 1.433347, 0.990205, 0, 0, 0, 1, 1,
1.510859, -2.295592, 2.305297, 0, 0, 0, 1, 1,
1.512879, -0.1721192, 3.022044, 0, 0, 0, 1, 1,
1.518695, -1.028744, 2.011322, 0, 0, 0, 1, 1,
1.520971, 0.3452471, 2.040769, 0, 0, 0, 1, 1,
1.529903, 1.043573, -1.283364, 0, 0, 0, 1, 1,
1.537904, 0.5392892, 0.5983267, 1, 1, 1, 1, 1,
1.541486, -1.746961, -0.2029591, 1, 1, 1, 1, 1,
1.550403, -0.8945431, 2.565206, 1, 1, 1, 1, 1,
1.555157, 0.7247301, 1.559629, 1, 1, 1, 1, 1,
1.566225, 0.5620008, 1.253665, 1, 1, 1, 1, 1,
1.573612, -1.12684, 2.76804, 1, 1, 1, 1, 1,
1.575269, 0.9084106, 0.988367, 1, 1, 1, 1, 1,
1.602331, -3.221713, 2.186314, 1, 1, 1, 1, 1,
1.609956, -0.04763691, 0.9166365, 1, 1, 1, 1, 1,
1.623276, -1.539498, 3.240336, 1, 1, 1, 1, 1,
1.627226, 0.004853476, 0.5616696, 1, 1, 1, 1, 1,
1.628406, 1.007812, 1.416325, 1, 1, 1, 1, 1,
1.631413, -0.5209476, 1.046692, 1, 1, 1, 1, 1,
1.635437, 1.680933, -0.6144372, 1, 1, 1, 1, 1,
1.675031, -0.4327401, 1.325484, 1, 1, 1, 1, 1,
1.695031, 0.545983, 1.780664, 0, 0, 1, 1, 1,
1.733786, -0.5187688, 2.244146, 1, 0, 0, 1, 1,
1.742175, 1.936415, 0.3285092, 1, 0, 0, 1, 1,
1.745481, -0.3525981, 2.256842, 1, 0, 0, 1, 1,
1.747773, -1.480466, 0.7978198, 1, 0, 0, 1, 1,
1.756045, -0.5891316, 0.8396356, 1, 0, 0, 1, 1,
1.759671, -0.5140611, 3.533915, 0, 0, 0, 1, 1,
1.778355, -1.170198, 2.179029, 0, 0, 0, 1, 1,
1.78361, -1.663859, 0.3204042, 0, 0, 0, 1, 1,
1.787687, -1.129007, 2.976792, 0, 0, 0, 1, 1,
1.788569, -0.8546309, 2.180273, 0, 0, 0, 1, 1,
1.820811, 0.4865897, 3.472623, 0, 0, 0, 1, 1,
1.829071, -0.1297905, 2.945194, 0, 0, 0, 1, 1,
1.856772, 0.7787332, 1.008952, 1, 1, 1, 1, 1,
1.859459, 0.6989348, -0.2326046, 1, 1, 1, 1, 1,
1.877072, -0.4213378, 1.875691, 1, 1, 1, 1, 1,
1.895679, -0.3731009, 0.9996525, 1, 1, 1, 1, 1,
1.95353, -0.8351227, 2.193979, 1, 1, 1, 1, 1,
1.955683, -0.332133, 3.429217, 1, 1, 1, 1, 1,
1.978397, 1.009667, 0.1995544, 1, 1, 1, 1, 1,
1.997503, -0.1726808, 2.514347, 1, 1, 1, 1, 1,
2.003374, -0.3455262, 1.399655, 1, 1, 1, 1, 1,
2.018839, -0.5218738, 1.626954, 1, 1, 1, 1, 1,
2.022351, -0.07538861, 1.459452, 1, 1, 1, 1, 1,
2.032022, 1.00246, 0.9576901, 1, 1, 1, 1, 1,
2.069963, 0.5131323, 2.575173, 1, 1, 1, 1, 1,
2.074657, 0.6054499, 2.498238, 1, 1, 1, 1, 1,
2.119799, 0.5926179, 0.7942557, 1, 1, 1, 1, 1,
2.142322, -1.538481, 1.073401, 0, 0, 1, 1, 1,
2.156315, -0.1370029, 0.1429012, 1, 0, 0, 1, 1,
2.156757, 0.8573976, 1.885827, 1, 0, 0, 1, 1,
2.230974, -0.7532728, 2.126397, 1, 0, 0, 1, 1,
2.286445, 1.052188, 2.125232, 1, 0, 0, 1, 1,
2.314005, 1.426666, 0.4035814, 1, 0, 0, 1, 1,
2.321599, -0.781988, 2.07288, 0, 0, 0, 1, 1,
2.354045, 1.454059, -0.5898133, 0, 0, 0, 1, 1,
2.426832, 1.199949, -0.3646809, 0, 0, 0, 1, 1,
2.432165, -1.1572, 2.562035, 0, 0, 0, 1, 1,
2.438466, -0.1213935, 1.262565, 0, 0, 0, 1, 1,
2.444824, -1.466063, 2.440527, 0, 0, 0, 1, 1,
2.498826, -1.500938, 0.8573703, 0, 0, 0, 1, 1,
2.505762, -0.4723672, 2.090935, 1, 1, 1, 1, 1,
2.50797, 0.6351851, 1.238115, 1, 1, 1, 1, 1,
2.527313, -0.5164865, 0.6911299, 1, 1, 1, 1, 1,
2.630584, 0.8457991, -1.312331, 1, 1, 1, 1, 1,
2.668284, 0.6950164, 1.181936, 1, 1, 1, 1, 1,
2.725183, -0.8391067, 0.8530225, 1, 1, 1, 1, 1,
3.621518, -0.8311099, 0.4990114, 1, 1, 1, 1, 1
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
var radius = 9.782402;
var distance = 34.36028;
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
mvMatrix.translate( -0.01670218, -0.02582169, 0.5731943 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.36028);
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