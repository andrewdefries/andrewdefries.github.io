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
-3.36309, 0.7805169, -2.232096, 1, 0, 0, 1,
-3.293596, 0.2194594, -0.15179, 1, 0.007843138, 0, 1,
-3.127429, -1.606274, -1.880856, 1, 0.01176471, 0, 1,
-2.849999, -0.2106913, -0.4972109, 1, 0.01960784, 0, 1,
-2.637691, -1.558563, -0.6147082, 1, 0.02352941, 0, 1,
-2.617411, -0.5173683, -2.278398, 1, 0.03137255, 0, 1,
-2.589908, 0.9164558, -0.01419189, 1, 0.03529412, 0, 1,
-2.533434, -1.64522, -3.195536, 1, 0.04313726, 0, 1,
-2.375828, -0.1161639, -0.9926234, 1, 0.04705882, 0, 1,
-2.353916, 1.380219, -1.471515, 1, 0.05490196, 0, 1,
-2.306148, 0.1790814, -3.061002, 1, 0.05882353, 0, 1,
-2.233043, -1.195364, -1.736982, 1, 0.06666667, 0, 1,
-2.232311, 0.9182494, -2.295273, 1, 0.07058824, 0, 1,
-2.198055, 1.383065, -1.443944, 1, 0.07843138, 0, 1,
-2.162801, 0.7222226, 0.1168067, 1, 0.08235294, 0, 1,
-2.152251, 1.213215, -1.359435, 1, 0.09019608, 0, 1,
-2.145029, 0.6467831, -0.2696007, 1, 0.09411765, 0, 1,
-2.124563, 1.0533, -1.435432, 1, 0.1019608, 0, 1,
-2.118426, 0.03547321, -1.444166, 1, 0.1098039, 0, 1,
-2.111056, -0.6785097, -1.431967, 1, 0.1137255, 0, 1,
-2.091203, -0.8285403, -1.430799, 1, 0.1215686, 0, 1,
-2.036208, 1.931324, -1.972417, 1, 0.1254902, 0, 1,
-2.034428, 0.8821105, -1.681109, 1, 0.1333333, 0, 1,
-1.96284, -0.3942921, -1.353184, 1, 0.1372549, 0, 1,
-1.950545, -0.8327451, -1.410265, 1, 0.145098, 0, 1,
-1.946458, 0.8717973, -0.2871084, 1, 0.1490196, 0, 1,
-1.93269, -0.04039243, -2.007817, 1, 0.1568628, 0, 1,
-1.915149, 1.433781, -0.363284, 1, 0.1607843, 0, 1,
-1.87445, 0.01511247, -2.205744, 1, 0.1686275, 0, 1,
-1.870536, 0.51969, -1.458224, 1, 0.172549, 0, 1,
-1.862561, -0.615814, -3.384296, 1, 0.1803922, 0, 1,
-1.831197, 0.494189, -0.3285993, 1, 0.1843137, 0, 1,
-1.823283, 1.59106, -1.531163, 1, 0.1921569, 0, 1,
-1.816713, -0.7585667, -0.4997503, 1, 0.1960784, 0, 1,
-1.811466, 0.8042231, -2.749262, 1, 0.2039216, 0, 1,
-1.782493, -0.1893258, -2.724418, 1, 0.2117647, 0, 1,
-1.778701, 0.4708707, -0.8524847, 1, 0.2156863, 0, 1,
-1.772326, -0.9456017, -4.254684, 1, 0.2235294, 0, 1,
-1.772012, -0.49875, -2.432912, 1, 0.227451, 0, 1,
-1.752181, -1.167626, -1.770566, 1, 0.2352941, 0, 1,
-1.72579, -0.09324855, -1.769028, 1, 0.2392157, 0, 1,
-1.711922, 1.357753, -2.783058, 1, 0.2470588, 0, 1,
-1.706991, -0.4308853, -0.5741764, 1, 0.2509804, 0, 1,
-1.675106, 1.796255, -2.566155, 1, 0.2588235, 0, 1,
-1.658746, -0.0735158, -2.166767, 1, 0.2627451, 0, 1,
-1.643452, 0.1368643, -2.994939, 1, 0.2705882, 0, 1,
-1.631005, 0.4120148, -2.460304, 1, 0.2745098, 0, 1,
-1.607231, 0.3998809, -0.1397363, 1, 0.282353, 0, 1,
-1.606211, 0.3332469, -2.329383, 1, 0.2862745, 0, 1,
-1.598963, -0.03687894, -2.544176, 1, 0.2941177, 0, 1,
-1.587835, 0.3604546, 2.100919, 1, 0.3019608, 0, 1,
-1.582539, 0.06901008, -1.664049, 1, 0.3058824, 0, 1,
-1.572246, 0.9682012, -2.194332, 1, 0.3137255, 0, 1,
-1.561004, 1.408823, -2.195287, 1, 0.3176471, 0, 1,
-1.559796, -1.575628, -2.159384, 1, 0.3254902, 0, 1,
-1.551829, 0.7236478, -2.128775, 1, 0.3294118, 0, 1,
-1.550297, -0.2398463, -2.411779, 1, 0.3372549, 0, 1,
-1.544496, -0.6233599, -1.915452, 1, 0.3411765, 0, 1,
-1.5387, -0.3566291, -1.07219, 1, 0.3490196, 0, 1,
-1.528516, 1.392491, -1.250489, 1, 0.3529412, 0, 1,
-1.528368, 0.6079059, -2.919816, 1, 0.3607843, 0, 1,
-1.527782, 0.9404132, -0.8556031, 1, 0.3647059, 0, 1,
-1.526507, -0.253597, -1.038209, 1, 0.372549, 0, 1,
-1.522734, 1.323385, -2.429002, 1, 0.3764706, 0, 1,
-1.518261, -0.1901591, -2.093166, 1, 0.3843137, 0, 1,
-1.502728, 1.892849, -0.1224219, 1, 0.3882353, 0, 1,
-1.501752, -1.984746, -3.255255, 1, 0.3960784, 0, 1,
-1.495493, -1.631785, -3.061303, 1, 0.4039216, 0, 1,
-1.493693, 0.1478222, -1.961194, 1, 0.4078431, 0, 1,
-1.492838, -0.5596439, -1.795448, 1, 0.4156863, 0, 1,
-1.489214, -0.1424333, -3.127038, 1, 0.4196078, 0, 1,
-1.476039, 0.8654468, -1.588023, 1, 0.427451, 0, 1,
-1.471995, 0.809417, -1.287904, 1, 0.4313726, 0, 1,
-1.471791, 1.963885, -2.055331, 1, 0.4392157, 0, 1,
-1.46595, 0.6993378, -2.196484, 1, 0.4431373, 0, 1,
-1.455683, -0.02660169, -1.128956, 1, 0.4509804, 0, 1,
-1.45264, 1.411757, 0.5917946, 1, 0.454902, 0, 1,
-1.429128, -0.4391034, -2.643221, 1, 0.4627451, 0, 1,
-1.428121, 2.571945, 0.3930124, 1, 0.4666667, 0, 1,
-1.41271, 1.424091, -0.007369666, 1, 0.4745098, 0, 1,
-1.406615, 0.4401704, -0.2703667, 1, 0.4784314, 0, 1,
-1.40655, 0.7515265, -1.129996, 1, 0.4862745, 0, 1,
-1.404265, -0.2584461, -3.242423, 1, 0.4901961, 0, 1,
-1.380269, 0.08412883, -0.1830561, 1, 0.4980392, 0, 1,
-1.371691, 1.8008, -2.172288, 1, 0.5058824, 0, 1,
-1.368324, 1.84891, -0.3346756, 1, 0.509804, 0, 1,
-1.360536, -1.410661, -2.769014, 1, 0.5176471, 0, 1,
-1.343491, -0.6273294, -2.262285, 1, 0.5215687, 0, 1,
-1.339925, -1.302797, -2.778581, 1, 0.5294118, 0, 1,
-1.339775, -0.1832136, -1.559065, 1, 0.5333334, 0, 1,
-1.336047, -1.032627, -2.477451, 1, 0.5411765, 0, 1,
-1.33577, 1.124934, -0.8519222, 1, 0.5450981, 0, 1,
-1.335548, 0.8412009, -0.2429057, 1, 0.5529412, 0, 1,
-1.325853, -0.0447777, -0.2389149, 1, 0.5568628, 0, 1,
-1.320615, -1.302707, -3.75735, 1, 0.5647059, 0, 1,
-1.31664, 2.928604, 0.8542989, 1, 0.5686275, 0, 1,
-1.311044, 0.9716863, -0.331764, 1, 0.5764706, 0, 1,
-1.301564, -0.986865, -3.039014, 1, 0.5803922, 0, 1,
-1.29524, 0.5236073, -1.283123, 1, 0.5882353, 0, 1,
-1.293162, -0.1007829, -2.543683, 1, 0.5921569, 0, 1,
-1.276193, 0.3248208, 0.01799854, 1, 0.6, 0, 1,
-1.27001, -0.1193874, -2.023546, 1, 0.6078432, 0, 1,
-1.264092, -0.2134272, -0.9850077, 1, 0.6117647, 0, 1,
-1.263203, 0.5458836, -2.414348, 1, 0.6196079, 0, 1,
-1.26217, -1.057133, -3.001779, 1, 0.6235294, 0, 1,
-1.258886, -0.476732, -1.58407, 1, 0.6313726, 0, 1,
-1.249265, -0.8446575, -2.288675, 1, 0.6352941, 0, 1,
-1.240786, -0.1722707, -1.917886, 1, 0.6431373, 0, 1,
-1.240315, -0.4909626, -2.798974, 1, 0.6470588, 0, 1,
-1.238122, -1.492616, -2.493636, 1, 0.654902, 0, 1,
-1.2223, 0.1061067, -1.138505, 1, 0.6588235, 0, 1,
-1.21677, 0.6643019, 1.578359, 1, 0.6666667, 0, 1,
-1.214431, 0.3623415, -1.714586, 1, 0.6705883, 0, 1,
-1.213585, -1.024446, -3.386516, 1, 0.6784314, 0, 1,
-1.203273, -0.9105951, -2.456107, 1, 0.682353, 0, 1,
-1.198324, -0.5076969, -1.126881, 1, 0.6901961, 0, 1,
-1.197066, 0.2531365, -2.369371, 1, 0.6941177, 0, 1,
-1.194108, 0.721381, 0.2811328, 1, 0.7019608, 0, 1,
-1.19129, -1.327937, -2.059375, 1, 0.7098039, 0, 1,
-1.189682, 0.6924932, -1.563934, 1, 0.7137255, 0, 1,
-1.184685, -0.3745455, -2.577296, 1, 0.7215686, 0, 1,
-1.184267, 1.00587, 1.128259, 1, 0.7254902, 0, 1,
-1.176116, -1.687223, -3.378226, 1, 0.7333333, 0, 1,
-1.173217, 0.5325195, -2.048275, 1, 0.7372549, 0, 1,
-1.171191, -0.3569726, -1.27232, 1, 0.7450981, 0, 1,
-1.162712, 0.3049749, -0.8735842, 1, 0.7490196, 0, 1,
-1.152125, -0.4121166, -2.093913, 1, 0.7568628, 0, 1,
-1.149702, -0.9123828, -0.3891664, 1, 0.7607843, 0, 1,
-1.114703, 0.8005327, 0.3908674, 1, 0.7686275, 0, 1,
-1.114026, 2.245768, 0.819055, 1, 0.772549, 0, 1,
-1.11055, 0.02719763, -0.3826368, 1, 0.7803922, 0, 1,
-1.109079, -0.8845264, -4.071048, 1, 0.7843137, 0, 1,
-1.103606, -1.28725, -2.969563, 1, 0.7921569, 0, 1,
-1.1011, -0.5749789, -1.135997, 1, 0.7960784, 0, 1,
-1.098291, 1.536655, -1.469129, 1, 0.8039216, 0, 1,
-1.096406, 0.00448917, -0.2852635, 1, 0.8117647, 0, 1,
-1.092293, -1.495378, -2.733555, 1, 0.8156863, 0, 1,
-1.092274, -0.1842905, -2.527243, 1, 0.8235294, 0, 1,
-1.084969, -0.9610044, -3.117793, 1, 0.827451, 0, 1,
-1.079803, 0.1776395, -1.941232, 1, 0.8352941, 0, 1,
-1.073246, -0.4117738, -3.517192, 1, 0.8392157, 0, 1,
-1.070323, 0.2554392, -0.1836913, 1, 0.8470588, 0, 1,
-1.066438, -0.3275507, -1.070208, 1, 0.8509804, 0, 1,
-1.066014, 1.171405, -0.3441753, 1, 0.8588235, 0, 1,
-1.056073, -0.01731186, -1.222626, 1, 0.8627451, 0, 1,
-1.051886, 1.853709, 0.05329268, 1, 0.8705882, 0, 1,
-1.045933, -0.4678487, -1.837079, 1, 0.8745098, 0, 1,
-1.044109, -0.4706017, -2.934454, 1, 0.8823529, 0, 1,
-1.040731, -1.013392, -3.011051, 1, 0.8862745, 0, 1,
-1.039814, -1.33517, -2.808498, 1, 0.8941177, 0, 1,
-1.038395, 0.2753996, -2.774805, 1, 0.8980392, 0, 1,
-1.033874, 0.6096128, -0.6698996, 1, 0.9058824, 0, 1,
-1.03385, 0.2094353, -0.6431377, 1, 0.9137255, 0, 1,
-1.028834, -0.0531117, -1.824909, 1, 0.9176471, 0, 1,
-1.02663, 2.13827, -0.0617816, 1, 0.9254902, 0, 1,
-1.026286, 1.646133, 0.1851778, 1, 0.9294118, 0, 1,
-1.025451, -0.1002005, -2.656655, 1, 0.9372549, 0, 1,
-1.024723, -0.4103611, -1.971745, 1, 0.9411765, 0, 1,
-1.023502, 0.9790213, -0.953314, 1, 0.9490196, 0, 1,
-1.023128, 1.087999, -1.707229, 1, 0.9529412, 0, 1,
-1.022246, -0.2127251, -3.150604, 1, 0.9607843, 0, 1,
-1.020559, 0.8837857, -1.69218, 1, 0.9647059, 0, 1,
-1.014232, 1.230389, -0.6789601, 1, 0.972549, 0, 1,
-1.013378, -0.9960933, -3.132638, 1, 0.9764706, 0, 1,
-1.010931, -0.1332046, -2.978255, 1, 0.9843137, 0, 1,
-0.9933901, -0.02858367, -0.7585613, 1, 0.9882353, 0, 1,
-0.9855117, -1.516963, -2.660709, 1, 0.9960784, 0, 1,
-0.9814006, -0.2944096, -0.6344384, 0.9960784, 1, 0, 1,
-0.9758002, 0.2041354, -1.576361, 0.9921569, 1, 0, 1,
-0.9705315, 0.4352355, -0.9547443, 0.9843137, 1, 0, 1,
-0.9636539, -0.09010772, -1.792629, 0.9803922, 1, 0, 1,
-0.963644, 0.5828515, -2.272913, 0.972549, 1, 0, 1,
-0.9633752, -1.506201, -1.641795, 0.9686275, 1, 0, 1,
-0.9608648, 0.3669931, -0.3742206, 0.9607843, 1, 0, 1,
-0.9586521, -0.7468361, -3.312858, 0.9568627, 1, 0, 1,
-0.9585599, 0.6465551, -2.571381, 0.9490196, 1, 0, 1,
-0.955424, -1.390784, -0.08060884, 0.945098, 1, 0, 1,
-0.9484432, -0.2956272, -2.887143, 0.9372549, 1, 0, 1,
-0.9405754, 1.220494, -1.226933, 0.9333333, 1, 0, 1,
-0.9320872, -2.516677, -2.683812, 0.9254902, 1, 0, 1,
-0.9306135, 0.7320375, -0.8028217, 0.9215686, 1, 0, 1,
-0.9286168, 0.7397562, 0.1731617, 0.9137255, 1, 0, 1,
-0.927476, 2.271301, 0.30505, 0.9098039, 1, 0, 1,
-0.924558, 0.09902221, -2.070433, 0.9019608, 1, 0, 1,
-0.9222404, -0.3290978, -1.236312, 0.8941177, 1, 0, 1,
-0.9220651, 0.5828034, -1.580077, 0.8901961, 1, 0, 1,
-0.9200679, -0.1306536, -3.198581, 0.8823529, 1, 0, 1,
-0.918681, -0.9746769, -2.822213, 0.8784314, 1, 0, 1,
-0.914959, -1.125674, -0.5440112, 0.8705882, 1, 0, 1,
-0.9129347, -0.5485139, -2.527358, 0.8666667, 1, 0, 1,
-0.9100801, -1.157924, -1.623323, 0.8588235, 1, 0, 1,
-0.9059576, -0.557126, -2.504282, 0.854902, 1, 0, 1,
-0.9043073, -0.9245141, -2.499012, 0.8470588, 1, 0, 1,
-0.9032283, 1.341753, 0.9001762, 0.8431373, 1, 0, 1,
-0.8995743, -0.5194758, -1.326011, 0.8352941, 1, 0, 1,
-0.8982272, 1.262974, -1.137143, 0.8313726, 1, 0, 1,
-0.8977178, -1.239198, -2.386891, 0.8235294, 1, 0, 1,
-0.8960626, 2.1337, 1.111693, 0.8196079, 1, 0, 1,
-0.895551, 0.6767818, -0.5781394, 0.8117647, 1, 0, 1,
-0.8910071, 0.2316804, -1.221068, 0.8078431, 1, 0, 1,
-0.8855819, -1.496858, -2.531263, 0.8, 1, 0, 1,
-0.875303, -1.206453, -4.421969, 0.7921569, 1, 0, 1,
-0.8733323, -1.884659, -2.294639, 0.7882353, 1, 0, 1,
-0.8647531, 0.8434273, -2.171974, 0.7803922, 1, 0, 1,
-0.8558264, 0.6287187, -0.9846641, 0.7764706, 1, 0, 1,
-0.8544241, 1.025001, -0.6507821, 0.7686275, 1, 0, 1,
-0.8537821, 0.9323345, 0.4111954, 0.7647059, 1, 0, 1,
-0.8509223, 0.05830591, -0.9367635, 0.7568628, 1, 0, 1,
-0.8507566, 0.8618566, -1.216117, 0.7529412, 1, 0, 1,
-0.8501527, 1.181573, -1.14469, 0.7450981, 1, 0, 1,
-0.8497248, -0.2300869, -1.410287, 0.7411765, 1, 0, 1,
-0.8453447, -0.3325887, -2.612826, 0.7333333, 1, 0, 1,
-0.8443012, -1.284431, -1.514594, 0.7294118, 1, 0, 1,
-0.8384442, 0.2708743, -0.1046315, 0.7215686, 1, 0, 1,
-0.8380567, 1.790728, 0.7289791, 0.7176471, 1, 0, 1,
-0.8369293, 0.2838217, -1.68326, 0.7098039, 1, 0, 1,
-0.8358902, -0.2318161, 0.3081295, 0.7058824, 1, 0, 1,
-0.833554, 0.8661348, -0.7465656, 0.6980392, 1, 0, 1,
-0.8311241, 3.083265, -2.217825, 0.6901961, 1, 0, 1,
-0.8286958, -2.638486, -2.093876, 0.6862745, 1, 0, 1,
-0.8198755, 0.850948, 1.248584, 0.6784314, 1, 0, 1,
-0.8115208, -0.8385835, -2.835386, 0.6745098, 1, 0, 1,
-0.8112503, 0.4851016, -2.13386, 0.6666667, 1, 0, 1,
-0.8065116, 0.427298, -0.8355662, 0.6627451, 1, 0, 1,
-0.8043175, -0.7967857, -1.15209, 0.654902, 1, 0, 1,
-0.804229, 1.446242, -0.339761, 0.6509804, 1, 0, 1,
-0.8023728, -0.07886142, -1.818467, 0.6431373, 1, 0, 1,
-0.8015046, 1.32913, -1.112562, 0.6392157, 1, 0, 1,
-0.7953702, 1.828307, 0.1760291, 0.6313726, 1, 0, 1,
-0.7936281, -0.7560431, -2.845544, 0.627451, 1, 0, 1,
-0.7923999, -1.078937, -2.864761, 0.6196079, 1, 0, 1,
-0.7897592, 0.1342231, -1.893162, 0.6156863, 1, 0, 1,
-0.7811242, -1.785931, -4.198476, 0.6078432, 1, 0, 1,
-0.7733721, 1.355948, -1.90297, 0.6039216, 1, 0, 1,
-0.7694101, -0.8917155, -2.001921, 0.5960785, 1, 0, 1,
-0.7630361, -0.708822, -1.974826, 0.5882353, 1, 0, 1,
-0.7526885, -1.114957, -2.022305, 0.5843138, 1, 0, 1,
-0.7469549, -1.300771, -2.121922, 0.5764706, 1, 0, 1,
-0.7444222, -1.755282, -3.116331, 0.572549, 1, 0, 1,
-0.7384813, -0.3503007, -0.6212268, 0.5647059, 1, 0, 1,
-0.7356152, -0.4652125, -1.708331, 0.5607843, 1, 0, 1,
-0.7335681, -1.017039, -1.950895, 0.5529412, 1, 0, 1,
-0.7263697, -0.9863497, -2.893179, 0.5490196, 1, 0, 1,
-0.7259318, -0.3492955, -2.506699, 0.5411765, 1, 0, 1,
-0.72544, -0.785784, -2.55295, 0.5372549, 1, 0, 1,
-0.7212383, -0.0508393, -1.657902, 0.5294118, 1, 0, 1,
-0.7195539, 1.02192, -0.8283904, 0.5254902, 1, 0, 1,
-0.7194165, -1.041808, -3.830213, 0.5176471, 1, 0, 1,
-0.7121783, -1.132701, -0.8184467, 0.5137255, 1, 0, 1,
-0.7069028, -0.6548706, -2.301203, 0.5058824, 1, 0, 1,
-0.7064511, -0.5063282, -0.9618064, 0.5019608, 1, 0, 1,
-0.7062188, -0.329275, -2.995161, 0.4941176, 1, 0, 1,
-0.7055285, 0.4675633, -0.05126751, 0.4862745, 1, 0, 1,
-0.6975407, -0.5929558, -0.8794893, 0.4823529, 1, 0, 1,
-0.6964245, 1.043967, 0.494295, 0.4745098, 1, 0, 1,
-0.6932954, -0.7215371, -1.827055, 0.4705882, 1, 0, 1,
-0.6888394, 0.2255662, -2.721131, 0.4627451, 1, 0, 1,
-0.6876425, -0.6176614, -2.773744, 0.4588235, 1, 0, 1,
-0.6829604, -0.3765692, -3.631256, 0.4509804, 1, 0, 1,
-0.6777999, 0.2649479, -2.257618, 0.4470588, 1, 0, 1,
-0.6758517, 2.402724, 0.6911805, 0.4392157, 1, 0, 1,
-0.6751285, -0.7312447, -3.327263, 0.4352941, 1, 0, 1,
-0.6741526, -0.09748944, -3.490419, 0.427451, 1, 0, 1,
-0.6667643, 0.03301254, -1.743087, 0.4235294, 1, 0, 1,
-0.6646, 0.2598721, -2.024031, 0.4156863, 1, 0, 1,
-0.6558956, -1.024833, 0.1198843, 0.4117647, 1, 0, 1,
-0.6552332, -0.9456402, -3.949299, 0.4039216, 1, 0, 1,
-0.6527215, -1.954327, -3.255013, 0.3960784, 1, 0, 1,
-0.6452324, -1.158338, -2.137906, 0.3921569, 1, 0, 1,
-0.6420048, 1.131368, -1.078206, 0.3843137, 1, 0, 1,
-0.6340586, 0.7474189, -0.7902056, 0.3803922, 1, 0, 1,
-0.6313444, 0.1538143, -2.149927, 0.372549, 1, 0, 1,
-0.6292725, 2.479048, -1.931908, 0.3686275, 1, 0, 1,
-0.6290479, -0.3739879, -2.679624, 0.3607843, 1, 0, 1,
-0.6284006, 1.584274, -0.9359833, 0.3568628, 1, 0, 1,
-0.6267259, -0.07836656, -2.452928, 0.3490196, 1, 0, 1,
-0.6213703, -0.2650537, -1.720797, 0.345098, 1, 0, 1,
-0.61741, -0.3188046, -1.49294, 0.3372549, 1, 0, 1,
-0.6168129, 0.1241693, -1.042471, 0.3333333, 1, 0, 1,
-0.6041989, 0.04427121, -0.6111633, 0.3254902, 1, 0, 1,
-0.5978113, -0.3060928, -2.152398, 0.3215686, 1, 0, 1,
-0.5937731, -1.227214, -5.189839, 0.3137255, 1, 0, 1,
-0.5905534, 1.325833, -0.4495845, 0.3098039, 1, 0, 1,
-0.5888649, -0.8077088, -3.913622, 0.3019608, 1, 0, 1,
-0.5819489, 0.3242373, -1.501317, 0.2941177, 1, 0, 1,
-0.580202, 0.936399, 0.3498544, 0.2901961, 1, 0, 1,
-0.5754874, -0.3747993, -3.2594, 0.282353, 1, 0, 1,
-0.5713946, 0.173478, -3.063652, 0.2784314, 1, 0, 1,
-0.5711313, -0.3984895, -3.493544, 0.2705882, 1, 0, 1,
-0.5697291, -0.2871018, -3.034871, 0.2666667, 1, 0, 1,
-0.5560615, -0.5474735, -1.929993, 0.2588235, 1, 0, 1,
-0.5473823, -0.5139293, -1.970232, 0.254902, 1, 0, 1,
-0.5434765, 0.8151718, -0.610139, 0.2470588, 1, 0, 1,
-0.5431785, -0.05123058, -2.418944, 0.2431373, 1, 0, 1,
-0.5384633, 1.743363, -2.095104, 0.2352941, 1, 0, 1,
-0.5347325, 0.008046695, -1.892049, 0.2313726, 1, 0, 1,
-0.534721, 1.656352, -0.2681352, 0.2235294, 1, 0, 1,
-0.533951, -0.337454, -2.872125, 0.2196078, 1, 0, 1,
-0.5319075, -1.291694, -3.201798, 0.2117647, 1, 0, 1,
-0.5309979, -0.976153, -4.674966, 0.2078431, 1, 0, 1,
-0.530974, -1.272222, -2.358352, 0.2, 1, 0, 1,
-0.5235394, -0.4076536, -2.256096, 0.1921569, 1, 0, 1,
-0.5202664, 0.04120794, -1.368875, 0.1882353, 1, 0, 1,
-0.5151588, -0.5080346, -3.047995, 0.1803922, 1, 0, 1,
-0.5130047, 0.360835, -1.680104, 0.1764706, 1, 0, 1,
-0.5114359, -0.4405566, -1.024708, 0.1686275, 1, 0, 1,
-0.5084845, -0.925185, -4.583921, 0.1647059, 1, 0, 1,
-0.5067084, 0.09506965, 0.05481135, 0.1568628, 1, 0, 1,
-0.5014058, -0.6355646, -3.057232, 0.1529412, 1, 0, 1,
-0.5003908, 0.6215199, -1.686232, 0.145098, 1, 0, 1,
-0.500004, 0.7146878, -2.764585, 0.1411765, 1, 0, 1,
-0.4915379, -0.5144638, -3.897714, 0.1333333, 1, 0, 1,
-0.4913734, 1.800943, -0.790276, 0.1294118, 1, 0, 1,
-0.4904448, 0.6887386, 0.6237817, 0.1215686, 1, 0, 1,
-0.4895495, -0.06443974, -1.386656, 0.1176471, 1, 0, 1,
-0.4884769, 0.274689, -0.1452001, 0.1098039, 1, 0, 1,
-0.4870764, 0.4001965, 0.8874775, 0.1058824, 1, 0, 1,
-0.4820648, -1.45568, -1.836552, 0.09803922, 1, 0, 1,
-0.4777703, 1.878649, -1.035184, 0.09019608, 1, 0, 1,
-0.4760243, -0.5031286, -1.257562, 0.08627451, 1, 0, 1,
-0.4712785, 0.2237291, -0.2813472, 0.07843138, 1, 0, 1,
-0.468282, 0.6190851, -1.454421, 0.07450981, 1, 0, 1,
-0.4671352, -1.534742, -3.29582, 0.06666667, 1, 0, 1,
-0.4654988, 0.4242617, -2.159933, 0.0627451, 1, 0, 1,
-0.4635091, -0.453969, -2.777417, 0.05490196, 1, 0, 1,
-0.4629893, -0.9157653, -2.71525, 0.05098039, 1, 0, 1,
-0.4599065, -1.360359, -2.262703, 0.04313726, 1, 0, 1,
-0.4535362, 0.4008897, -0.647272, 0.03921569, 1, 0, 1,
-0.45029, 0.2144552, 0.9738694, 0.03137255, 1, 0, 1,
-0.447289, -0.5088487, -2.13022, 0.02745098, 1, 0, 1,
-0.4464158, -0.7352535, -3.278243, 0.01960784, 1, 0, 1,
-0.4462191, -0.1707924, -2.569198, 0.01568628, 1, 0, 1,
-0.4422156, -0.7440294, -1.964193, 0.007843138, 1, 0, 1,
-0.4372863, -0.6544552, -3.334474, 0.003921569, 1, 0, 1,
-0.4355234, 0.4153061, -0.1523833, 0, 1, 0.003921569, 1,
-0.4317219, -1.130096, -0.6826076, 0, 1, 0.01176471, 1,
-0.4294771, -1.661165, -3.335844, 0, 1, 0.01568628, 1,
-0.4252536, -0.09242728, -2.62973, 0, 1, 0.02352941, 1,
-0.4230799, 0.6323828, -0.1185924, 0, 1, 0.02745098, 1,
-0.4217848, -0.3807499, -1.691945, 0, 1, 0.03529412, 1,
-0.4207907, 2.385399, -0.4805478, 0, 1, 0.03921569, 1,
-0.4152596, -0.9241221, -3.94013, 0, 1, 0.04705882, 1,
-0.4116722, 1.993828, 0.4136396, 0, 1, 0.05098039, 1,
-0.4114592, -0.5526902, -1.609047, 0, 1, 0.05882353, 1,
-0.4104764, -0.6753063, -2.958113, 0, 1, 0.0627451, 1,
-0.4087934, 0.5649068, -1.605283, 0, 1, 0.07058824, 1,
-0.4084788, 0.04406964, -1.93682, 0, 1, 0.07450981, 1,
-0.4084069, -1.039358, -2.548824, 0, 1, 0.08235294, 1,
-0.3935839, -0.2596533, -2.038793, 0, 1, 0.08627451, 1,
-0.3929357, 0.1086828, -0.9860425, 0, 1, 0.09411765, 1,
-0.3904706, 1.476048, 0.83019, 0, 1, 0.1019608, 1,
-0.3887138, -0.2162333, -0.5015157, 0, 1, 0.1058824, 1,
-0.3861992, -1.47533, -2.417348, 0, 1, 0.1137255, 1,
-0.3861445, 0.3380035, -0.25962, 0, 1, 0.1176471, 1,
-0.3853575, 0.7375295, 0.4680362, 0, 1, 0.1254902, 1,
-0.3850981, 0.03163994, -2.357524, 0, 1, 0.1294118, 1,
-0.384149, 2.419724, 0.8241547, 0, 1, 0.1372549, 1,
-0.3810208, -0.8262308, -1.729486, 0, 1, 0.1411765, 1,
-0.3808323, -1.423578, -4.378677, 0, 1, 0.1490196, 1,
-0.380134, 0.4049658, 0.6472483, 0, 1, 0.1529412, 1,
-0.3799402, 1.513892, -1.15672, 0, 1, 0.1607843, 1,
-0.3786244, 0.02123497, -1.084365, 0, 1, 0.1647059, 1,
-0.3775193, -0.9853824, -1.840479, 0, 1, 0.172549, 1,
-0.3751395, 0.4689448, 0.2647069, 0, 1, 0.1764706, 1,
-0.373784, 0.4829141, 0.2214083, 0, 1, 0.1843137, 1,
-0.3712219, -1.067216, -2.934481, 0, 1, 0.1882353, 1,
-0.3704088, 0.7370756, 0.4388741, 0, 1, 0.1960784, 1,
-0.3680211, -1.061271, -3.672335, 0, 1, 0.2039216, 1,
-0.3673976, 0.2748642, -1.237186, 0, 1, 0.2078431, 1,
-0.3654775, 0.7029962, -2.4339, 0, 1, 0.2156863, 1,
-0.3570137, -0.7421409, -3.928472, 0, 1, 0.2196078, 1,
-0.3542205, -1.248129, -2.700771, 0, 1, 0.227451, 1,
-0.3538888, 0.1848594, -0.9484668, 0, 1, 0.2313726, 1,
-0.3456104, 0.07681779, -0.8280194, 0, 1, 0.2392157, 1,
-0.3423171, -0.417597, -1.88772, 0, 1, 0.2431373, 1,
-0.3403038, -0.2157668, -3.652181, 0, 1, 0.2509804, 1,
-0.3391078, -1.148896, -0.1089689, 0, 1, 0.254902, 1,
-0.3373131, -1.124508, -3.224588, 0, 1, 0.2627451, 1,
-0.3364991, 0.215136, -3.137623, 0, 1, 0.2666667, 1,
-0.3358148, -2.062125, -3.232432, 0, 1, 0.2745098, 1,
-0.3357733, -0.0682908, -1.491053, 0, 1, 0.2784314, 1,
-0.3316058, -0.3196054, -2.692893, 0, 1, 0.2862745, 1,
-0.3307997, -1.670783, -3.494577, 0, 1, 0.2901961, 1,
-0.3293245, 0.7294883, -1.893191, 0, 1, 0.2980392, 1,
-0.3287124, -0.570425, -0.8480545, 0, 1, 0.3058824, 1,
-0.3283772, 0.3547065, -1.044928, 0, 1, 0.3098039, 1,
-0.3255743, 1.14406, -0.6238506, 0, 1, 0.3176471, 1,
-0.3253832, -1.339571, -3.089345, 0, 1, 0.3215686, 1,
-0.3223651, -1.768711, -1.754973, 0, 1, 0.3294118, 1,
-0.3201802, -0.8110827, -0.7247357, 0, 1, 0.3333333, 1,
-0.3160834, -0.842446, -3.372416, 0, 1, 0.3411765, 1,
-0.3111405, -1.243359, -3.185549, 0, 1, 0.345098, 1,
-0.309117, 0.1000945, -0.6278203, 0, 1, 0.3529412, 1,
-0.3061604, -1.636308, -2.831604, 0, 1, 0.3568628, 1,
-0.3048227, -0.2318985, -2.778765, 0, 1, 0.3647059, 1,
-0.3010846, -1.236781, -2.827788, 0, 1, 0.3686275, 1,
-0.3009268, -0.9903719, -3.594651, 0, 1, 0.3764706, 1,
-0.3002116, -0.01076309, -2.135979, 0, 1, 0.3803922, 1,
-0.2965813, -0.8451809, -2.992907, 0, 1, 0.3882353, 1,
-0.2940618, -0.4280831, -2.051367, 0, 1, 0.3921569, 1,
-0.2928711, 1.373789, -0.0001221445, 0, 1, 0.4, 1,
-0.291613, 0.1196106, -0.7605302, 0, 1, 0.4078431, 1,
-0.2908797, -0.6748935, -2.570941, 0, 1, 0.4117647, 1,
-0.2908221, -0.3965533, -4.036956, 0, 1, 0.4196078, 1,
-0.2879973, 0.1677408, -1.431202, 0, 1, 0.4235294, 1,
-0.2874308, 0.1052084, -2.214909, 0, 1, 0.4313726, 1,
-0.2782305, 0.4592783, -1.746191, 0, 1, 0.4352941, 1,
-0.2776884, 1.734756, -1.838694, 0, 1, 0.4431373, 1,
-0.2755786, -1.329036, -1.890264, 0, 1, 0.4470588, 1,
-0.2735483, -1.06014, -2.436066, 0, 1, 0.454902, 1,
-0.2724868, 2.790426, 1.433447, 0, 1, 0.4588235, 1,
-0.2697904, 0.9359531, -0.2612125, 0, 1, 0.4666667, 1,
-0.2693674, 1.524413, -1.174433, 0, 1, 0.4705882, 1,
-0.2689127, 1.792714, -1.56676, 0, 1, 0.4784314, 1,
-0.2621815, -0.24411, -2.529008, 0, 1, 0.4823529, 1,
-0.2600666, 1.297274, -0.2357698, 0, 1, 0.4901961, 1,
-0.2594532, 1.178681, -0.003583266, 0, 1, 0.4941176, 1,
-0.2537073, -0.4005686, -2.872329, 0, 1, 0.5019608, 1,
-0.2487909, 0.2961428, 0.4013022, 0, 1, 0.509804, 1,
-0.2406884, 0.1018419, -1.611222, 0, 1, 0.5137255, 1,
-0.2404859, 0.3682788, -1.942299, 0, 1, 0.5215687, 1,
-0.240189, -1.389525, -2.630356, 0, 1, 0.5254902, 1,
-0.2372219, -1.108616, -2.897856, 0, 1, 0.5333334, 1,
-0.2360512, 0.3811986, 0.6486337, 0, 1, 0.5372549, 1,
-0.2304496, -1.151448, -3.039484, 0, 1, 0.5450981, 1,
-0.2240673, -1.32775, -3.126133, 0, 1, 0.5490196, 1,
-0.2230981, -0.4406731, -3.177461, 0, 1, 0.5568628, 1,
-0.2227718, -1.137879, -3.330104, 0, 1, 0.5607843, 1,
-0.2224621, 0.5680652, 2.04434, 0, 1, 0.5686275, 1,
-0.2183101, -0.3745985, -3.377957, 0, 1, 0.572549, 1,
-0.2168724, 0.1691303, -0.358796, 0, 1, 0.5803922, 1,
-0.2136459, 0.04804918, 0.04764577, 0, 1, 0.5843138, 1,
-0.2115311, 0.734955, 0.4062021, 0, 1, 0.5921569, 1,
-0.2105232, -0.09861145, -2.472264, 0, 1, 0.5960785, 1,
-0.2002907, 1.127248, -1.080875, 0, 1, 0.6039216, 1,
-0.1921826, 0.9087783, 1.669443, 0, 1, 0.6117647, 1,
-0.1900924, -0.9982239, -2.275527, 0, 1, 0.6156863, 1,
-0.1864834, -1.670154, -3.006167, 0, 1, 0.6235294, 1,
-0.1857042, -0.702889, -3.3204, 0, 1, 0.627451, 1,
-0.1853249, 0.1925853, -1.695014, 0, 1, 0.6352941, 1,
-0.184598, 0.3743168, -0.3062369, 0, 1, 0.6392157, 1,
-0.1779892, -1.723976, -3.927821, 0, 1, 0.6470588, 1,
-0.1724976, 1.620383, -0.557146, 0, 1, 0.6509804, 1,
-0.1722871, -0.6970181, -2.894003, 0, 1, 0.6588235, 1,
-0.1703844, -0.8570793, -2.323016, 0, 1, 0.6627451, 1,
-0.1654856, -0.9535883, 0.1342948, 0, 1, 0.6705883, 1,
-0.1639231, -1.771655, -3.957413, 0, 1, 0.6745098, 1,
-0.1637399, 0.1000366, -0.01335193, 0, 1, 0.682353, 1,
-0.1592481, 1.050562, -0.04191916, 0, 1, 0.6862745, 1,
-0.1585319, -0.7066944, -2.717561, 0, 1, 0.6941177, 1,
-0.1571171, -0.7639162, -2.784, 0, 1, 0.7019608, 1,
-0.1570986, -1.448798, -2.439631, 0, 1, 0.7058824, 1,
-0.1556571, -0.9410156, -4.360438, 0, 1, 0.7137255, 1,
-0.1555095, 0.0821218, -2.221638, 0, 1, 0.7176471, 1,
-0.1554501, -1.863937, -3.109006, 0, 1, 0.7254902, 1,
-0.1489394, 0.6386514, -0.01543596, 0, 1, 0.7294118, 1,
-0.1487285, -0.958132, -3.471189, 0, 1, 0.7372549, 1,
-0.1459645, 0.04002199, -3.544876, 0, 1, 0.7411765, 1,
-0.1443723, -3.112128, -3.260777, 0, 1, 0.7490196, 1,
-0.1395319, -0.6379356, -3.154224, 0, 1, 0.7529412, 1,
-0.1294945, -0.5899265, -2.440283, 0, 1, 0.7607843, 1,
-0.1263135, 0.009286975, -1.146431, 0, 1, 0.7647059, 1,
-0.12496, 0.3549258, -0.6293103, 0, 1, 0.772549, 1,
-0.1174503, 0.009334603, -0.6480073, 0, 1, 0.7764706, 1,
-0.1160092, 1.26329, -1.14871, 0, 1, 0.7843137, 1,
-0.1148208, 0.7436731, -0.2304842, 0, 1, 0.7882353, 1,
-0.1109179, 1.610191, -1.031642, 0, 1, 0.7960784, 1,
-0.1102145, -1.45524, -1.89709, 0, 1, 0.8039216, 1,
-0.1070384, -0.009925726, -2.528586, 0, 1, 0.8078431, 1,
-0.1055159, 0.4216759, -2.554664, 0, 1, 0.8156863, 1,
-0.1039983, 0.6005417, 0.2292735, 0, 1, 0.8196079, 1,
-0.1012624, -0.5949908, -1.755031, 0, 1, 0.827451, 1,
-0.1006405, -1.206418, -3.171019, 0, 1, 0.8313726, 1,
-0.09582599, 0.3743261, -0.9965046, 0, 1, 0.8392157, 1,
-0.09432141, 1.46154, -0.5915933, 0, 1, 0.8431373, 1,
-0.08972295, -0.00518819, -3.36384, 0, 1, 0.8509804, 1,
-0.08968834, -0.8919232, -5.208937, 0, 1, 0.854902, 1,
-0.07503807, 0.8639466, 0.5903051, 0, 1, 0.8627451, 1,
-0.07216523, -0.0815038, -4.903702, 0, 1, 0.8666667, 1,
-0.06953317, 1.663557, 1.094013, 0, 1, 0.8745098, 1,
-0.06634205, 0.6039261, 0.1606313, 0, 1, 0.8784314, 1,
-0.06268343, 0.9115164, -0.1480962, 0, 1, 0.8862745, 1,
-0.06030722, -1.076051, -3.101003, 0, 1, 0.8901961, 1,
-0.05859115, 0.7741918, -0.2593706, 0, 1, 0.8980392, 1,
-0.0533383, 1.510049, -1.10243, 0, 1, 0.9058824, 1,
-0.05286807, -0.9856974, -4.6911, 0, 1, 0.9098039, 1,
-0.04907304, 1.925357, -0.354669, 0, 1, 0.9176471, 1,
-0.04806524, -0.0856287, -1.708024, 0, 1, 0.9215686, 1,
-0.04506462, -0.5982907, -2.420072, 0, 1, 0.9294118, 1,
-0.04339711, 0.06308632, -1.612494, 0, 1, 0.9333333, 1,
-0.04307586, -1.171949, -3.248928, 0, 1, 0.9411765, 1,
-0.0424553, 1.161836, -1.464585, 0, 1, 0.945098, 1,
-0.03864052, 0.3528315, -0.6690232, 0, 1, 0.9529412, 1,
-0.03796904, -0.2097349, -3.599891, 0, 1, 0.9568627, 1,
-0.03706529, -1.494436, -3.335226, 0, 1, 0.9647059, 1,
-0.03552915, -2.308873, -3.194873, 0, 1, 0.9686275, 1,
-0.03050385, 1.647441, 0.3335075, 0, 1, 0.9764706, 1,
-0.02759637, 0.06740144, -1.252687, 0, 1, 0.9803922, 1,
-0.02325628, -1.311505, -3.696574, 0, 1, 0.9882353, 1,
-0.02211413, -0.1328889, -4.286265, 0, 1, 0.9921569, 1,
-0.0168288, -1.890047, -3.875623, 0, 1, 1, 1,
-0.01575412, -0.6073773, -3.656202, 0, 0.9921569, 1, 1,
-0.01272638, -0.160039, -3.17556, 0, 0.9882353, 1, 1,
-0.01012801, -0.3750399, -2.816217, 0, 0.9803922, 1, 1,
-0.009188258, -0.79395, -3.252002, 0, 0.9764706, 1, 1,
-0.006883654, 1.198665, 1.21578, 0, 0.9686275, 1, 1,
-0.006701415, -0.3021128, -3.326169, 0, 0.9647059, 1, 1,
-0.00365028, 0.7495155, 0.5224039, 0, 0.9568627, 1, 1,
-0.001738769, 0.4501806, 0.7608005, 0, 0.9529412, 1, 1,
-0.001333781, -0.4633939, -2.883692, 0, 0.945098, 1, 1,
-0.0013104, -1.294809, -3.117974, 0, 0.9411765, 1, 1,
0.007027764, -1.057221, 2.001559, 0, 0.9333333, 1, 1,
0.009024037, -0.8863398, 3.219974, 0, 0.9294118, 1, 1,
0.009857371, 0.6368468, -0.8912479, 0, 0.9215686, 1, 1,
0.01060425, 0.04309754, -0.8127595, 0, 0.9176471, 1, 1,
0.01305554, -0.4025754, 4.93885, 0, 0.9098039, 1, 1,
0.01609136, -0.1553514, 2.067888, 0, 0.9058824, 1, 1,
0.02036422, 1.164432, 0.2519276, 0, 0.8980392, 1, 1,
0.02286651, -2.496145, 2.703508, 0, 0.8901961, 1, 1,
0.02942854, 0.5143704, 2.89399, 0, 0.8862745, 1, 1,
0.03550036, -1.787519, 4.339298, 0, 0.8784314, 1, 1,
0.04158557, -1.365598, 3.233464, 0, 0.8745098, 1, 1,
0.04288788, 1.476597, 0.05204884, 0, 0.8666667, 1, 1,
0.04931124, 0.816007, 2.147373, 0, 0.8627451, 1, 1,
0.04983367, -0.4430369, 3.057302, 0, 0.854902, 1, 1,
0.05156902, -1.370011, 3.687301, 0, 0.8509804, 1, 1,
0.05451158, -0.5890426, 4.401674, 0, 0.8431373, 1, 1,
0.05880499, -0.3719212, 2.079766, 0, 0.8392157, 1, 1,
0.05913146, 0.1605165, 0.1544613, 0, 0.8313726, 1, 1,
0.06336442, 2.380603, -0.7477587, 0, 0.827451, 1, 1,
0.06415533, -2.266564, 2.766822, 0, 0.8196079, 1, 1,
0.07767998, -0.045288, 3.045688, 0, 0.8156863, 1, 1,
0.08286405, -1.104628, 1.904866, 0, 0.8078431, 1, 1,
0.08756666, 0.9923693, 1.183937, 0, 0.8039216, 1, 1,
0.08850613, -0.4948682, 3.182294, 0, 0.7960784, 1, 1,
0.09105039, 1.765227, 1.418366, 0, 0.7882353, 1, 1,
0.09285425, 0.2110462, 0.837656, 0, 0.7843137, 1, 1,
0.09624999, -0.490541, 4.337831, 0, 0.7764706, 1, 1,
0.09631149, 0.848853, -0.2119952, 0, 0.772549, 1, 1,
0.1002785, 0.3895497, -0.247573, 0, 0.7647059, 1, 1,
0.1022181, -1.454921, 3.987393, 0, 0.7607843, 1, 1,
0.105643, 0.118383, -1.444375, 0, 0.7529412, 1, 1,
0.1068976, 2.076465, -1.478384, 0, 0.7490196, 1, 1,
0.1074344, 1.403516, 0.5256633, 0, 0.7411765, 1, 1,
0.1080185, -0.1191029, 1.996544, 0, 0.7372549, 1, 1,
0.1094013, -1.519737, 3.691488, 0, 0.7294118, 1, 1,
0.1114885, 0.2390809, 1.011095, 0, 0.7254902, 1, 1,
0.1142247, -1.20147, 3.834737, 0, 0.7176471, 1, 1,
0.1150416, -2.144659, 1.77354, 0, 0.7137255, 1, 1,
0.1207453, 1.34662, 1.070935, 0, 0.7058824, 1, 1,
0.1224895, 1.16037, 0.9856368, 0, 0.6980392, 1, 1,
0.1257028, -2.526623, 4.053673, 0, 0.6941177, 1, 1,
0.127055, 0.8756369, 0.6151026, 0, 0.6862745, 1, 1,
0.1273975, -0.9806835, 2.354996, 0, 0.682353, 1, 1,
0.1312741, -0.03050129, 2.294258, 0, 0.6745098, 1, 1,
0.1321711, -0.6284704, 2.05328, 0, 0.6705883, 1, 1,
0.1363297, -0.3125798, 2.704196, 0, 0.6627451, 1, 1,
0.1463188, -0.9078124, 2.334581, 0, 0.6588235, 1, 1,
0.151417, 0.3231396, 2.155232, 0, 0.6509804, 1, 1,
0.152878, -0.01953189, 3.368955, 0, 0.6470588, 1, 1,
0.1606324, -1.113518, 4.053457, 0, 0.6392157, 1, 1,
0.1623627, 1.630571, -0.8304201, 0, 0.6352941, 1, 1,
0.1631918, 0.8297142, -1.032801, 0, 0.627451, 1, 1,
0.1636467, 0.5475627, -2.390149, 0, 0.6235294, 1, 1,
0.1677309, 0.9118009, 0.6831431, 0, 0.6156863, 1, 1,
0.175835, -2.624131, 5.296276, 0, 0.6117647, 1, 1,
0.1842469, 1.597415, 0.4985755, 0, 0.6039216, 1, 1,
0.1843223, -0.6500781, 3.049191, 0, 0.5960785, 1, 1,
0.1844951, -1.671209, 2.615595, 0, 0.5921569, 1, 1,
0.1846323, -0.4210389, 2.767693, 0, 0.5843138, 1, 1,
0.1846512, 0.5738283, 1.229714, 0, 0.5803922, 1, 1,
0.1851767, 0.7276109, 1.854452, 0, 0.572549, 1, 1,
0.1858186, 1.141383, -0.5399151, 0, 0.5686275, 1, 1,
0.1918951, -1.34538, 2.347064, 0, 0.5607843, 1, 1,
0.1949524, -1.400556, 2.409831, 0, 0.5568628, 1, 1,
0.195803, -0.9586961, 3.19187, 0, 0.5490196, 1, 1,
0.1966319, -0.07812892, -1.760159, 0, 0.5450981, 1, 1,
0.2007285, -1.276337, 2.125221, 0, 0.5372549, 1, 1,
0.200802, 0.1079032, 2.5433, 0, 0.5333334, 1, 1,
0.2061694, -0.7554544, 4.743032, 0, 0.5254902, 1, 1,
0.2086821, 1.579297, -1.180552, 0, 0.5215687, 1, 1,
0.2094702, 0.2256173, 0.2915301, 0, 0.5137255, 1, 1,
0.2097367, -0.0187061, 1.994018, 0, 0.509804, 1, 1,
0.2103054, -1.286428, 3.237799, 0, 0.5019608, 1, 1,
0.21084, 0.1648784, -1.304706, 0, 0.4941176, 1, 1,
0.2116351, -1.421226, 3.008005, 0, 0.4901961, 1, 1,
0.2149847, 0.7289852, -0.01149163, 0, 0.4823529, 1, 1,
0.2158695, -0.1196676, 3.012848, 0, 0.4784314, 1, 1,
0.2212457, 0.6030681, -0.3864955, 0, 0.4705882, 1, 1,
0.2251335, 0.441278, -0.3003747, 0, 0.4666667, 1, 1,
0.230285, 0.1942856, 0.1861407, 0, 0.4588235, 1, 1,
0.2316933, 0.3248591, 1.767705, 0, 0.454902, 1, 1,
0.2368881, -1.254917, 3.310841, 0, 0.4470588, 1, 1,
0.2374057, 0.414494, 1.276593, 0, 0.4431373, 1, 1,
0.2374998, -1.133751, 2.412255, 0, 0.4352941, 1, 1,
0.2398712, -1.104915, 2.388166, 0, 0.4313726, 1, 1,
0.248594, 0.6364191, -0.1216358, 0, 0.4235294, 1, 1,
0.2486302, -0.1324432, 1.500743, 0, 0.4196078, 1, 1,
0.2488516, 0.08274771, 0.1225762, 0, 0.4117647, 1, 1,
0.2503621, 1.215504, 2.98418, 0, 0.4078431, 1, 1,
0.252788, -0.3182123, 4.048349, 0, 0.4, 1, 1,
0.2543052, 0.9741817, -0.7184078, 0, 0.3921569, 1, 1,
0.2564128, 0.3350907, 1.009023, 0, 0.3882353, 1, 1,
0.2570424, 0.2003816, 2.141634, 0, 0.3803922, 1, 1,
0.2580253, -0.9173937, 3.181127, 0, 0.3764706, 1, 1,
0.2586941, 0.2690317, -0.2830643, 0, 0.3686275, 1, 1,
0.258967, -1.298945, 2.878394, 0, 0.3647059, 1, 1,
0.2592318, -0.5903798, 1.439453, 0, 0.3568628, 1, 1,
0.2598798, -0.7419991, 1.99264, 0, 0.3529412, 1, 1,
0.2660619, -1.858333, 3.664259, 0, 0.345098, 1, 1,
0.2666759, 2.311714, 0.2901544, 0, 0.3411765, 1, 1,
0.2722723, -0.2010519, 3.249591, 0, 0.3333333, 1, 1,
0.2730627, -1.67889, 2.834532, 0, 0.3294118, 1, 1,
0.2758392, 0.2039905, 2.409812, 0, 0.3215686, 1, 1,
0.2801589, 0.5579996, -1.392963, 0, 0.3176471, 1, 1,
0.2802095, 0.6944203, 2.291397, 0, 0.3098039, 1, 1,
0.2845914, 1.748228, 0.6836317, 0, 0.3058824, 1, 1,
0.2863677, -0.4086924, 3.691372, 0, 0.2980392, 1, 1,
0.2897933, -0.7584985, 2.746783, 0, 0.2901961, 1, 1,
0.2940595, 2.053608, 1.047363, 0, 0.2862745, 1, 1,
0.2963285, -0.1379761, 1.433766, 0, 0.2784314, 1, 1,
0.296366, 0.4021811, 0.943877, 0, 0.2745098, 1, 1,
0.2984042, 1.352067, 1.155136, 0, 0.2666667, 1, 1,
0.3022273, -0.0942755, 1.688136, 0, 0.2627451, 1, 1,
0.304831, -0.5228772, 3.925778, 0, 0.254902, 1, 1,
0.3086767, 0.2131726, 0.7045028, 0, 0.2509804, 1, 1,
0.3086852, -1.145524, 1.977871, 0, 0.2431373, 1, 1,
0.3248179, -0.09735753, 1.831885, 0, 0.2392157, 1, 1,
0.3251934, 1.449494, 1.160975, 0, 0.2313726, 1, 1,
0.3253202, 0.4288379, -0.6504073, 0, 0.227451, 1, 1,
0.3272362, 0.8881952, 0.2294419, 0, 0.2196078, 1, 1,
0.3283978, 0.5375881, 0.7292346, 0, 0.2156863, 1, 1,
0.3321506, -1.091836, 2.26512, 0, 0.2078431, 1, 1,
0.3324995, -1.351369, 2.183863, 0, 0.2039216, 1, 1,
0.3329776, 0.45824, 1.176313, 0, 0.1960784, 1, 1,
0.3331867, 0.4634503, 2.15413, 0, 0.1882353, 1, 1,
0.3395007, -0.5500717, 3.337652, 0, 0.1843137, 1, 1,
0.3418393, 0.1481456, 2.173222, 0, 0.1764706, 1, 1,
0.342363, -0.4656884, 2.620068, 0, 0.172549, 1, 1,
0.3429686, -0.003558361, 1.17952, 0, 0.1647059, 1, 1,
0.3437071, -0.8726284, 2.9834, 0, 0.1607843, 1, 1,
0.3440138, 0.776468, -0.3048891, 0, 0.1529412, 1, 1,
0.3504353, 0.9186805, 0.2717869, 0, 0.1490196, 1, 1,
0.3542498, 0.1014052, 2.035967, 0, 0.1411765, 1, 1,
0.3558244, -0.5083015, 3.643832, 0, 0.1372549, 1, 1,
0.3656374, 0.6387613, 1.59408, 0, 0.1294118, 1, 1,
0.366222, -0.5660328, -0.1480176, 0, 0.1254902, 1, 1,
0.3687756, -0.08010074, 1.358568, 0, 0.1176471, 1, 1,
0.3716341, 1.250106, 0.0473556, 0, 0.1137255, 1, 1,
0.373343, 0.6472824, -0.04999584, 0, 0.1058824, 1, 1,
0.3737513, -0.02527523, 2.032758, 0, 0.09803922, 1, 1,
0.3788696, 0.4961388, 0.3361209, 0, 0.09411765, 1, 1,
0.3801978, 0.5804034, 1.706145, 0, 0.08627451, 1, 1,
0.3812465, -0.6776535, 1.660113, 0, 0.08235294, 1, 1,
0.3822324, 0.6770757, 0.0385114, 0, 0.07450981, 1, 1,
0.3833225, -2.676327, 2.725609, 0, 0.07058824, 1, 1,
0.3847239, 0.9068143, 1.017081, 0, 0.0627451, 1, 1,
0.3886812, 1.386402, 1.02902, 0, 0.05882353, 1, 1,
0.3916982, 1.09115, 0.285952, 0, 0.05098039, 1, 1,
0.3980818, 2.233912, -0.1984586, 0, 0.04705882, 1, 1,
0.3998654, 1.26264, 0.1224834, 0, 0.03921569, 1, 1,
0.4024219, -0.5612873, 1.910987, 0, 0.03529412, 1, 1,
0.4042982, 0.5356113, 2.285621, 0, 0.02745098, 1, 1,
0.404301, 0.8055422, 0.16546, 0, 0.02352941, 1, 1,
0.4043915, 0.3712231, 0.884427, 0, 0.01568628, 1, 1,
0.4060382, 0.3319404, 0.02555814, 0, 0.01176471, 1, 1,
0.4073038, 0.173056, 2.068628, 0, 0.003921569, 1, 1,
0.4100418, 0.2059111, 2.031671, 0.003921569, 0, 1, 1,
0.4177293, 0.2594275, -0.3289334, 0.007843138, 0, 1, 1,
0.4177436, 1.552539, -0.2849786, 0.01568628, 0, 1, 1,
0.4193546, -0.2975189, 3.294329, 0.01960784, 0, 1, 1,
0.423876, -0.8983901, 2.000888, 0.02745098, 0, 1, 1,
0.4265805, -0.2811545, 1.864467, 0.03137255, 0, 1, 1,
0.4275296, -0.1937456, 1.50231, 0.03921569, 0, 1, 1,
0.4282502, 2.105932, -0.8488555, 0.04313726, 0, 1, 1,
0.4282604, -0.5303004, 2.547233, 0.05098039, 0, 1, 1,
0.4316975, -1.692753, 2.724505, 0.05490196, 0, 1, 1,
0.4324515, -0.2239992, 2.085746, 0.0627451, 0, 1, 1,
0.4344892, 0.9277806, 0.2040919, 0.06666667, 0, 1, 1,
0.4351113, 0.812595, 0.605642, 0.07450981, 0, 1, 1,
0.4357311, 0.5485116, 0.6326925, 0.07843138, 0, 1, 1,
0.4368771, 0.7420676, 1.450914, 0.08627451, 0, 1, 1,
0.4381922, 1.883615, 1.158281, 0.09019608, 0, 1, 1,
0.4385019, 1.587977, 1.258645, 0.09803922, 0, 1, 1,
0.4398225, -0.6775079, 2.596097, 0.1058824, 0, 1, 1,
0.4416599, -0.3654088, 4.406374, 0.1098039, 0, 1, 1,
0.4429456, -0.1927838, 2.812637, 0.1176471, 0, 1, 1,
0.4436978, -1.528241, 2.999201, 0.1215686, 0, 1, 1,
0.4468045, 0.5334767, 4.677426, 0.1294118, 0, 1, 1,
0.4478835, -0.8564938, 2.039876, 0.1333333, 0, 1, 1,
0.4492015, -0.7770428, 1.515006, 0.1411765, 0, 1, 1,
0.4517975, 0.6613821, 0.5391406, 0.145098, 0, 1, 1,
0.4545072, -0.4334433, 2.21598, 0.1529412, 0, 1, 1,
0.4552631, -1.152583, 4.049827, 0.1568628, 0, 1, 1,
0.4566778, -0.5816332, 2.07309, 0.1647059, 0, 1, 1,
0.4588614, 1.053672, 1.273258, 0.1686275, 0, 1, 1,
0.4599751, -0.2552658, 2.222162, 0.1764706, 0, 1, 1,
0.4634415, 0.3961869, 1.839675, 0.1803922, 0, 1, 1,
0.4637201, 0.1033878, -0.03133939, 0.1882353, 0, 1, 1,
0.4654858, -0.02826931, 2.177204, 0.1921569, 0, 1, 1,
0.4666421, -1.744193, 2.564795, 0.2, 0, 1, 1,
0.4743043, 0.7227092, 1.809401, 0.2078431, 0, 1, 1,
0.4744174, -1.649357, 2.460147, 0.2117647, 0, 1, 1,
0.4759689, -1.140734, 4.212891, 0.2196078, 0, 1, 1,
0.4760302, -1.007821, 2.779718, 0.2235294, 0, 1, 1,
0.4811271, 0.5615808, -0.1709569, 0.2313726, 0, 1, 1,
0.4812117, 3.20898, -0.05646757, 0.2352941, 0, 1, 1,
0.4829553, -0.4010743, 1.967624, 0.2431373, 0, 1, 1,
0.4850641, -0.0719957, 1.526758, 0.2470588, 0, 1, 1,
0.4878953, -0.2018642, 3.374358, 0.254902, 0, 1, 1,
0.4894178, 0.635287, 0.4369607, 0.2588235, 0, 1, 1,
0.5070248, -0.4244683, 2.501857, 0.2666667, 0, 1, 1,
0.5075797, -1.225032, 5.444175, 0.2705882, 0, 1, 1,
0.5097893, -2.235533, 3.906854, 0.2784314, 0, 1, 1,
0.5170023, 0.7536845, -0.3392694, 0.282353, 0, 1, 1,
0.5198854, -1.018352, 2.809081, 0.2901961, 0, 1, 1,
0.5202893, 0.376233, 1.31668, 0.2941177, 0, 1, 1,
0.5237938, 1.570838, 1.640154, 0.3019608, 0, 1, 1,
0.524681, 0.1851099, 1.93139, 0.3098039, 0, 1, 1,
0.5284221, -1.170029, 2.277918, 0.3137255, 0, 1, 1,
0.5309401, -0.4213093, 2.004594, 0.3215686, 0, 1, 1,
0.531266, -2.593968, 1.553651, 0.3254902, 0, 1, 1,
0.5348159, 0.7195876, 0.8145624, 0.3333333, 0, 1, 1,
0.5365121, 0.4038778, -0.9851252, 0.3372549, 0, 1, 1,
0.5506095, 1.311241, 0.3647092, 0.345098, 0, 1, 1,
0.5522749, -0.4500988, 3.012423, 0.3490196, 0, 1, 1,
0.5562057, 0.3357716, 1.775314, 0.3568628, 0, 1, 1,
0.5596172, 0.09214033, -0.4716014, 0.3607843, 0, 1, 1,
0.5604029, -1.037007, 1.492222, 0.3686275, 0, 1, 1,
0.5624939, -0.02164371, 1.459547, 0.372549, 0, 1, 1,
0.5646232, 1.431545, 0.3033129, 0.3803922, 0, 1, 1,
0.5651541, 0.3996368, 0.1528078, 0.3843137, 0, 1, 1,
0.5679181, 1.946762, -0.4127528, 0.3921569, 0, 1, 1,
0.5734361, -0.1207208, 0.6202993, 0.3960784, 0, 1, 1,
0.5771427, -0.1814638, 2.079375, 0.4039216, 0, 1, 1,
0.5775387, 0.4414887, 0.931549, 0.4117647, 0, 1, 1,
0.5783165, 0.0004439412, 1.012412, 0.4156863, 0, 1, 1,
0.5790366, 0.1435836, 2.922309, 0.4235294, 0, 1, 1,
0.5828506, 0.129787, 0.6438913, 0.427451, 0, 1, 1,
0.58413, 0.3772631, 0.3263129, 0.4352941, 0, 1, 1,
0.585367, 2.119701, 0.7520836, 0.4392157, 0, 1, 1,
0.588204, -1.030021, 3.545418, 0.4470588, 0, 1, 1,
0.5911648, -0.3937284, 4.312215, 0.4509804, 0, 1, 1,
0.5927845, -0.2319369, -1.465097, 0.4588235, 0, 1, 1,
0.5966164, 0.5837047, 1.090166, 0.4627451, 0, 1, 1,
0.5979599, 0.3431047, 1.17067, 0.4705882, 0, 1, 1,
0.6012725, -0.378164, 4.873804, 0.4745098, 0, 1, 1,
0.601283, 1.410305, -0.6238177, 0.4823529, 0, 1, 1,
0.6018784, 1.723486, 0.698137, 0.4862745, 0, 1, 1,
0.6132987, -0.5155748, 1.551234, 0.4941176, 0, 1, 1,
0.6146608, 0.7725472, 0.4139636, 0.5019608, 0, 1, 1,
0.6147272, -2.167011, 2.599483, 0.5058824, 0, 1, 1,
0.6217855, 1.479333, -0.1182195, 0.5137255, 0, 1, 1,
0.6268082, -0.7994701, 1.621588, 0.5176471, 0, 1, 1,
0.6286646, 0.8881987, 1.175896, 0.5254902, 0, 1, 1,
0.6298589, 0.08268486, 2.924179, 0.5294118, 0, 1, 1,
0.6325771, 1.039528, 2.16974, 0.5372549, 0, 1, 1,
0.6338799, 2.153761, 1.627633, 0.5411765, 0, 1, 1,
0.6342691, -0.7728934, 1.03173, 0.5490196, 0, 1, 1,
0.6372041, -0.8842235, 0.988096, 0.5529412, 0, 1, 1,
0.6389604, 0.04388828, 0.03753881, 0.5607843, 0, 1, 1,
0.6422344, -0.9272283, 2.602915, 0.5647059, 0, 1, 1,
0.6621246, -1.322025, 2.856886, 0.572549, 0, 1, 1,
0.6636363, 0.5766246, 0.4829813, 0.5764706, 0, 1, 1,
0.6762076, 0.7893924, 0.6160303, 0.5843138, 0, 1, 1,
0.6768386, -0.7245716, 3.016651, 0.5882353, 0, 1, 1,
0.6870194, -0.213204, 2.619464, 0.5960785, 0, 1, 1,
0.6920195, -0.5958572, 2.954471, 0.6039216, 0, 1, 1,
0.6927326, 0.5818934, 1.812885, 0.6078432, 0, 1, 1,
0.6952307, 0.926992, 1.218852, 0.6156863, 0, 1, 1,
0.6977322, 0.302946, -0.4366281, 0.6196079, 0, 1, 1,
0.7007229, -1.441027, 3.312086, 0.627451, 0, 1, 1,
0.7031804, -1.071129, 1.849296, 0.6313726, 0, 1, 1,
0.7089055, 0.02428015, 2.459856, 0.6392157, 0, 1, 1,
0.7137277, -0.3864718, 3.562899, 0.6431373, 0, 1, 1,
0.7141339, 0.2190055, 0.5540594, 0.6509804, 0, 1, 1,
0.7144631, 0.3250429, 0.681288, 0.654902, 0, 1, 1,
0.7145244, -0.3844067, 1.868074, 0.6627451, 0, 1, 1,
0.7153023, 0.9204959, 0.7009968, 0.6666667, 0, 1, 1,
0.7209606, 0.7609786, 0.5201157, 0.6745098, 0, 1, 1,
0.7231454, 0.318898, 1.30826, 0.6784314, 0, 1, 1,
0.7339132, 1.600371, -0.1691557, 0.6862745, 0, 1, 1,
0.7369566, 1.034145, -0.6928862, 0.6901961, 0, 1, 1,
0.7405878, -1.48267, 1.587857, 0.6980392, 0, 1, 1,
0.741403, 1.254093, -0.4745439, 0.7058824, 0, 1, 1,
0.7433017, -0.8411488, 3.954275, 0.7098039, 0, 1, 1,
0.7517227, -0.7092471, 1.483813, 0.7176471, 0, 1, 1,
0.7586501, -0.6906116, 0.8643698, 0.7215686, 0, 1, 1,
0.7590466, -0.4458142, 2.779021, 0.7294118, 0, 1, 1,
0.7601011, 0.7205406, 1.176772, 0.7333333, 0, 1, 1,
0.7634481, -0.6889172, 2.158936, 0.7411765, 0, 1, 1,
0.7661221, -0.6555677, 2.397211, 0.7450981, 0, 1, 1,
0.7662495, 1.028132, 0.7459915, 0.7529412, 0, 1, 1,
0.7688507, 0.4839476, 0.1284752, 0.7568628, 0, 1, 1,
0.7753834, 1.947159, -1.160287, 0.7647059, 0, 1, 1,
0.7754465, -1.785286, 3.002137, 0.7686275, 0, 1, 1,
0.7763368, 1.475392, -0.7913784, 0.7764706, 0, 1, 1,
0.7763798, 0.894036, 0.2024594, 0.7803922, 0, 1, 1,
0.7779036, 1.572394, 3.168119, 0.7882353, 0, 1, 1,
0.7793576, -1.288717, 1.425896, 0.7921569, 0, 1, 1,
0.7797998, 0.8115001, 1.368102, 0.8, 0, 1, 1,
0.7831546, 0.05826398, 1.475214, 0.8078431, 0, 1, 1,
0.7857134, 0.7591044, -0.1159191, 0.8117647, 0, 1, 1,
0.7857649, -0.3480141, 0.7624143, 0.8196079, 0, 1, 1,
0.8044567, -0.3028065, -0.1991073, 0.8235294, 0, 1, 1,
0.8050676, 0.2802447, -0.06846105, 0.8313726, 0, 1, 1,
0.8096855, 1.167878, 0.8912275, 0.8352941, 0, 1, 1,
0.8137954, 1.037728, -1.067664, 0.8431373, 0, 1, 1,
0.8160287, -0.9841828, 3.404214, 0.8470588, 0, 1, 1,
0.8189023, -0.7415142, 1.551542, 0.854902, 0, 1, 1,
0.8238944, 0.255994, -0.143461, 0.8588235, 0, 1, 1,
0.8239676, -1.499471, 2.964285, 0.8666667, 0, 1, 1,
0.8257959, -0.6367334, 4.05449, 0.8705882, 0, 1, 1,
0.8261561, -0.3744824, 2.869817, 0.8784314, 0, 1, 1,
0.8276104, 1.083561, 2.086078, 0.8823529, 0, 1, 1,
0.8281153, -0.4030307, 3.860341, 0.8901961, 0, 1, 1,
0.8322431, 0.1113528, 2.027159, 0.8941177, 0, 1, 1,
0.8402312, 1.031376, 0.06070522, 0.9019608, 0, 1, 1,
0.8459765, 0.5461947, 1.375747, 0.9098039, 0, 1, 1,
0.8464345, -0.200181, 2.363154, 0.9137255, 0, 1, 1,
0.849237, 0.1651887, 2.309192, 0.9215686, 0, 1, 1,
0.8513302, 0.5210092, -1.445635, 0.9254902, 0, 1, 1,
0.8564095, -1.154482, 3.625056, 0.9333333, 0, 1, 1,
0.8578467, 0.4894562, 1.515592, 0.9372549, 0, 1, 1,
0.8608632, 0.8916023, 0.8120586, 0.945098, 0, 1, 1,
0.861027, -0.6298301, 3.661193, 0.9490196, 0, 1, 1,
0.8724521, -0.8263988, 1.693629, 0.9568627, 0, 1, 1,
0.8792179, -1.348681, 1.401413, 0.9607843, 0, 1, 1,
0.8800798, -0.7634372, 0.8632621, 0.9686275, 0, 1, 1,
0.882893, 2.067065, 0.1278166, 0.972549, 0, 1, 1,
0.8830059, 0.5851376, 0.2095538, 0.9803922, 0, 1, 1,
0.8859159, -0.02214343, 0.7595171, 0.9843137, 0, 1, 1,
0.88669, -1.165323, 1.429857, 0.9921569, 0, 1, 1,
0.8883923, 0.2452303, 0.8937079, 0.9960784, 0, 1, 1,
0.8913063, -0.9668674, 2.080223, 1, 0, 0.9960784, 1,
0.8917146, -0.06582905, 1.515386, 1, 0, 0.9882353, 1,
0.8930857, 1.182279, 1.219787, 1, 0, 0.9843137, 1,
0.8948326, 1.848198, 0.3776188, 1, 0, 0.9764706, 1,
0.8965546, -0.4540283, 0.7384466, 1, 0, 0.972549, 1,
0.9065209, 0.4502572, 2.054557, 1, 0, 0.9647059, 1,
0.9122238, 1.282865, 1.008653, 1, 0, 0.9607843, 1,
0.9138228, 0.378087, 1.659964, 1, 0, 0.9529412, 1,
0.9154613, -0.4347091, 2.17749, 1, 0, 0.9490196, 1,
0.9226866, 1.28655, 0.7405173, 1, 0, 0.9411765, 1,
0.9237484, 0.2846632, 1.309086, 1, 0, 0.9372549, 1,
0.9258942, 0.4413436, 0.03240732, 1, 0, 0.9294118, 1,
0.9381343, 2.228344, 1.163046, 1, 0, 0.9254902, 1,
0.9464607, -1.768825, 2.566199, 1, 0, 0.9176471, 1,
0.9478136, 0.7960476, 0.5057973, 1, 0, 0.9137255, 1,
0.9532407, 1.791353, -0.3999227, 1, 0, 0.9058824, 1,
0.957958, -2.118998, 3.217131, 1, 0, 0.9019608, 1,
0.9621414, 1.338308, 0.9095981, 1, 0, 0.8941177, 1,
0.962835, -1.480543, 3.170089, 1, 0, 0.8862745, 1,
0.9649267, -0.4953677, 2.954521, 1, 0, 0.8823529, 1,
0.9701546, -0.06457365, 0.6163625, 1, 0, 0.8745098, 1,
0.9812071, 0.9370703, 0.4731632, 1, 0, 0.8705882, 1,
0.9851051, -1.159165, 4.452672, 1, 0, 0.8627451, 1,
1.00706, 0.6215805, -0.4492556, 1, 0, 0.8588235, 1,
1.01207, 0.5933001, 0.7323284, 1, 0, 0.8509804, 1,
1.016354, -0.2037227, 2.49535, 1, 0, 0.8470588, 1,
1.018987, -0.1526529, 2.25743, 1, 0, 0.8392157, 1,
1.02295, 0.6827233, 1.769651, 1, 0, 0.8352941, 1,
1.024163, 0.5111101, 1.661526, 1, 0, 0.827451, 1,
1.024271, 0.9556392, 0.1591635, 1, 0, 0.8235294, 1,
1.030639, 0.1120168, 0.330812, 1, 0, 0.8156863, 1,
1.040012, -1.113191, 1.159195, 1, 0, 0.8117647, 1,
1.040173, 0.6626741, 1.032851, 1, 0, 0.8039216, 1,
1.042033, 0.9576291, 0.837622, 1, 0, 0.7960784, 1,
1.049556, -0.3281288, 1.740773, 1, 0, 0.7921569, 1,
1.056075, 0.5365489, 0.382772, 1, 0, 0.7843137, 1,
1.071892, -1.248278, 2.000705, 1, 0, 0.7803922, 1,
1.092499, -0.8487054, 2.23459, 1, 0, 0.772549, 1,
1.094933, -1.046283, 0.6647246, 1, 0, 0.7686275, 1,
1.099163, -0.1032022, 2.462283, 1, 0, 0.7607843, 1,
1.110088, -1.050375, 2.742054, 1, 0, 0.7568628, 1,
1.116055, -0.1534744, 0.5506247, 1, 0, 0.7490196, 1,
1.118724, -2.495878, 1.502359, 1, 0, 0.7450981, 1,
1.125075, -0.6149409, 2.593343, 1, 0, 0.7372549, 1,
1.135458, 1.156406, 1.67969, 1, 0, 0.7333333, 1,
1.13567, -1.1897, 1.978493, 1, 0, 0.7254902, 1,
1.137389, 0.4845429, 1.492469, 1, 0, 0.7215686, 1,
1.144327, 1.100597, -0.06152881, 1, 0, 0.7137255, 1,
1.149507, -1.865503, 2.473688, 1, 0, 0.7098039, 1,
1.150065, -0.7961228, 1.091749, 1, 0, 0.7019608, 1,
1.159671, 1.008541, 0.2376841, 1, 0, 0.6941177, 1,
1.165403, -0.3749268, 1.970463, 1, 0, 0.6901961, 1,
1.188246, 0.2709255, 0.7424889, 1, 0, 0.682353, 1,
1.190937, -0.6919806, 1.505397, 1, 0, 0.6784314, 1,
1.192781, 1.734242, 1.43948, 1, 0, 0.6705883, 1,
1.21149, 0.7136389, 0.5991206, 1, 0, 0.6666667, 1,
1.212523, -1.59642, 1.313271, 1, 0, 0.6588235, 1,
1.212867, -1.013955, 1.32171, 1, 0, 0.654902, 1,
1.226048, 1.143031, -0.2179871, 1, 0, 0.6470588, 1,
1.227297, -0.8038009, 1.796505, 1, 0, 0.6431373, 1,
1.230006, 0.1345967, 2.001939, 1, 0, 0.6352941, 1,
1.231764, -0.1488644, 1.292531, 1, 0, 0.6313726, 1,
1.233862, -0.7560072, 1.336497, 1, 0, 0.6235294, 1,
1.241559, 1.043643, 0.9961101, 1, 0, 0.6196079, 1,
1.244387, 0.5275789, 1.316082, 1, 0, 0.6117647, 1,
1.249724, 1.11856, 0.08007416, 1, 0, 0.6078432, 1,
1.250274, -1.109797, 1.107503, 1, 0, 0.6, 1,
1.255357, 1.245693, 1.180474, 1, 0, 0.5921569, 1,
1.25603, -0.261456, 1.973079, 1, 0, 0.5882353, 1,
1.260892, 0.06186722, 1.128973, 1, 0, 0.5803922, 1,
1.261034, 1.905471, 0.03653729, 1, 0, 0.5764706, 1,
1.271238, 1.026342, 1.303756, 1, 0, 0.5686275, 1,
1.295843, -1.422342, 2.36559, 1, 0, 0.5647059, 1,
1.297138, -1.444489, -0.6099911, 1, 0, 0.5568628, 1,
1.301364, -0.09945592, 2.829286, 1, 0, 0.5529412, 1,
1.302819, -0.001647873, 1.075469, 1, 0, 0.5450981, 1,
1.304121, -0.2912941, 0.1352252, 1, 0, 0.5411765, 1,
1.305677, 0.7591975, 0.8002943, 1, 0, 0.5333334, 1,
1.308106, -1.655581, 2.905536, 1, 0, 0.5294118, 1,
1.311543, -2.887703, 1.79857, 1, 0, 0.5215687, 1,
1.323629, -0.204844, 1.550463, 1, 0, 0.5176471, 1,
1.336084, -0.4354059, 3.974857, 1, 0, 0.509804, 1,
1.344383, -0.76802, 1.204229, 1, 0, 0.5058824, 1,
1.344594, 0.7093186, 1.269885, 1, 0, 0.4980392, 1,
1.349569, 0.5389965, -1.422179, 1, 0, 0.4901961, 1,
1.352418, -0.4620779, 2.192568, 1, 0, 0.4862745, 1,
1.362935, 0.8625407, 1.997625, 1, 0, 0.4784314, 1,
1.367897, -0.2323951, 0.570416, 1, 0, 0.4745098, 1,
1.392415, 1.367531, 1.84638, 1, 0, 0.4666667, 1,
1.408526, 1.853674, 1.043617, 1, 0, 0.4627451, 1,
1.418349, 0.339813, 0.9453954, 1, 0, 0.454902, 1,
1.420386, -0.5983188, 0.2755369, 1, 0, 0.4509804, 1,
1.433411, 0.08072779, 0.52807, 1, 0, 0.4431373, 1,
1.439133, -0.4800013, 1.048842, 1, 0, 0.4392157, 1,
1.445194, 0.5571672, 3.307419, 1, 0, 0.4313726, 1,
1.447073, -0.04559071, -0.3164373, 1, 0, 0.427451, 1,
1.45564, 0.4890749, 0.1040442, 1, 0, 0.4196078, 1,
1.459168, -1.062965, 2.22139, 1, 0, 0.4156863, 1,
1.47663, 0.4299454, 0.9696833, 1, 0, 0.4078431, 1,
1.483951, -0.600673, 1.826545, 1, 0, 0.4039216, 1,
1.48622, 0.5292514, 3.103575, 1, 0, 0.3960784, 1,
1.497419, 0.5437195, 2.203254, 1, 0, 0.3882353, 1,
1.50436, -1.073848, 4.127472, 1, 0, 0.3843137, 1,
1.504652, 1.371447, 1.692649, 1, 0, 0.3764706, 1,
1.529547, 0.30404, 0.5539203, 1, 0, 0.372549, 1,
1.53581, 0.5063429, 0.1876844, 1, 0, 0.3647059, 1,
1.540596, 1.318629, 0.3873398, 1, 0, 0.3607843, 1,
1.542185, -1.206254, 2.169583, 1, 0, 0.3529412, 1,
1.544425, 0.2140983, 0.4483534, 1, 0, 0.3490196, 1,
1.557646, -0.8723772, 0.9999936, 1, 0, 0.3411765, 1,
1.573404, -0.9077751, 1.623819, 1, 0, 0.3372549, 1,
1.574494, 1.092697, 1.055635, 1, 0, 0.3294118, 1,
1.590894, 0.409546, 2.404885, 1, 0, 0.3254902, 1,
1.592841, 0.8088895, -1.605364, 1, 0, 0.3176471, 1,
1.596938, 0.9788204, -0.3994677, 1, 0, 0.3137255, 1,
1.612574, -0.3769238, 0.3860657, 1, 0, 0.3058824, 1,
1.640665, -0.6171536, 2.542934, 1, 0, 0.2980392, 1,
1.669727, 0.3084802, 1.400833, 1, 0, 0.2941177, 1,
1.671183, -1.887636, 1.940433, 1, 0, 0.2862745, 1,
1.674582, 1.408082, 0.8772654, 1, 0, 0.282353, 1,
1.678496, -0.6392282, 0.6571337, 1, 0, 0.2745098, 1,
1.690599, -1.505568, 2.619596, 1, 0, 0.2705882, 1,
1.699774, -0.7130874, 1.644345, 1, 0, 0.2627451, 1,
1.709687, 2.189919, 0.7078623, 1, 0, 0.2588235, 1,
1.722984, 0.1464747, 1.219274, 1, 0, 0.2509804, 1,
1.746511, 1.143397, -0.6517619, 1, 0, 0.2470588, 1,
1.748711, 1.189936, 0.8615128, 1, 0, 0.2392157, 1,
1.74937, -0.1707243, 0.3377548, 1, 0, 0.2352941, 1,
1.764416, -0.1120007, -0.09060225, 1, 0, 0.227451, 1,
1.776705, -0.1770682, 2.37559, 1, 0, 0.2235294, 1,
1.785319, -0.04381333, 0.8003556, 1, 0, 0.2156863, 1,
1.823186, 1.035403, 0.3431969, 1, 0, 0.2117647, 1,
1.825385, 0.5339852, 2.943238, 1, 0, 0.2039216, 1,
1.826612, 0.8946166, 0.1444358, 1, 0, 0.1960784, 1,
1.860212, -0.4754313, 4.982744, 1, 0, 0.1921569, 1,
1.868117, 0.01435582, 0.8493322, 1, 0, 0.1843137, 1,
1.869375, 0.1027807, 0.9205118, 1, 0, 0.1803922, 1,
1.880488, 1.273139, 1.338941, 1, 0, 0.172549, 1,
1.964256, -0.100759, 1.020826, 1, 0, 0.1686275, 1,
1.967484, 0.3083054, -0.3252558, 1, 0, 0.1607843, 1,
1.985708, -0.5850203, 2.463755, 1, 0, 0.1568628, 1,
2.001574, -0.43811, 2.420752, 1, 0, 0.1490196, 1,
2.023894, 1.495608, 1.7674, 1, 0, 0.145098, 1,
2.046438, -0.2476475, 3.094968, 1, 0, 0.1372549, 1,
2.064501, -0.6477244, 0.9583305, 1, 0, 0.1333333, 1,
2.090021, 0.1565182, 0.3872053, 1, 0, 0.1254902, 1,
2.161474, 0.9012862, 2.772331, 1, 0, 0.1215686, 1,
2.205742, 0.1035282, 1.116291, 1, 0, 0.1137255, 1,
2.219957, -0.6543083, 1.417704, 1, 0, 0.1098039, 1,
2.249592, 0.9683394, 0.04278856, 1, 0, 0.1019608, 1,
2.270327, 0.8744696, 2.303712, 1, 0, 0.09411765, 1,
2.287515, 1.407543, 0.347092, 1, 0, 0.09019608, 1,
2.294595, -0.903721, 1.931943, 1, 0, 0.08235294, 1,
2.306685, 0.7219383, 1.092623, 1, 0, 0.07843138, 1,
2.338267, -0.8182485, 1.716167, 1, 0, 0.07058824, 1,
2.358591, 1.105178, 2.11775, 1, 0, 0.06666667, 1,
2.398278, 1.187938, 1.214003, 1, 0, 0.05882353, 1,
2.477536, -0.6649154, 2.831591, 1, 0, 0.05490196, 1,
2.481925, 0.8874784, 1.527274, 1, 0, 0.04705882, 1,
2.491689, 0.03243613, 0.8500521, 1, 0, 0.04313726, 1,
2.550694, 0.3557433, 3.638635, 1, 0, 0.03529412, 1,
2.585546, 0.4486473, 1.565627, 1, 0, 0.03137255, 1,
2.659024, 0.3073082, 2.064684, 1, 0, 0.02352941, 1,
2.688468, -0.08944947, 1.245494, 1, 0, 0.01960784, 1,
3.031708, -0.05822569, 1.195173, 1, 0, 0.01176471, 1,
3.070143, 0.2941786, 1.304172, 1, 0, 0.007843138, 1
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
-0.1464736, -4.183555, -7.014639, 0, -0.5, 0.5, 0.5,
-0.1464736, -4.183555, -7.014639, 1, -0.5, 0.5, 0.5,
-0.1464736, -4.183555, -7.014639, 1, 1.5, 0.5, 0.5,
-0.1464736, -4.183555, -7.014639, 0, 1.5, 0.5, 0.5
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
-4.453523, 0.04842603, -7.014639, 0, -0.5, 0.5, 0.5,
-4.453523, 0.04842603, -7.014639, 1, -0.5, 0.5, 0.5,
-4.453523, 0.04842603, -7.014639, 1, 1.5, 0.5, 0.5,
-4.453523, 0.04842603, -7.014639, 0, 1.5, 0.5, 0.5
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
-4.453523, -4.183555, 0.117619, 0, -0.5, 0.5, 0.5,
-4.453523, -4.183555, 0.117619, 1, -0.5, 0.5, 0.5,
-4.453523, -4.183555, 0.117619, 1, 1.5, 0.5, 0.5,
-4.453523, -4.183555, 0.117619, 0, 1.5, 0.5, 0.5
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
-3, -3.206944, -5.368733,
3, -3.206944, -5.368733,
-3, -3.206944, -5.368733,
-3, -3.369713, -5.643051,
-2, -3.206944, -5.368733,
-2, -3.369713, -5.643051,
-1, -3.206944, -5.368733,
-1, -3.369713, -5.643051,
0, -3.206944, -5.368733,
0, -3.369713, -5.643051,
1, -3.206944, -5.368733,
1, -3.369713, -5.643051,
2, -3.206944, -5.368733,
2, -3.369713, -5.643051,
3, -3.206944, -5.368733,
3, -3.369713, -5.643051
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
-3, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
-3, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
-3, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
-3, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5,
-2, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
-2, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
-2, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
-2, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5,
-1, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
-1, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
-1, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
-1, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5,
0, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
0, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
0, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
0, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5,
1, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
1, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
1, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
1, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5,
2, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
2, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
2, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
2, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5,
3, -3.69525, -6.191686, 0, -0.5, 0.5, 0.5,
3, -3.69525, -6.191686, 1, -0.5, 0.5, 0.5,
3, -3.69525, -6.191686, 1, 1.5, 0.5, 0.5,
3, -3.69525, -6.191686, 0, 1.5, 0.5, 0.5
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
-3.459589, -3, -5.368733,
-3.459589, 3, -5.368733,
-3.459589, -3, -5.368733,
-3.625244, -3, -5.643051,
-3.459589, -2, -5.368733,
-3.625244, -2, -5.643051,
-3.459589, -1, -5.368733,
-3.625244, -1, -5.643051,
-3.459589, 0, -5.368733,
-3.625244, 0, -5.643051,
-3.459589, 1, -5.368733,
-3.625244, 1, -5.643051,
-3.459589, 2, -5.368733,
-3.625244, 2, -5.643051,
-3.459589, 3, -5.368733,
-3.625244, 3, -5.643051
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
-3.956556, -3, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, -3, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, -3, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, -3, -6.191686, 0, 1.5, 0.5, 0.5,
-3.956556, -2, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, -2, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, -2, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, -2, -6.191686, 0, 1.5, 0.5, 0.5,
-3.956556, -1, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, -1, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, -1, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, -1, -6.191686, 0, 1.5, 0.5, 0.5,
-3.956556, 0, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, 0, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, 0, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, 0, -6.191686, 0, 1.5, 0.5, 0.5,
-3.956556, 1, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, 1, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, 1, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, 1, -6.191686, 0, 1.5, 0.5, 0.5,
-3.956556, 2, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, 2, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, 2, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, 2, -6.191686, 0, 1.5, 0.5, 0.5,
-3.956556, 3, -6.191686, 0, -0.5, 0.5, 0.5,
-3.956556, 3, -6.191686, 1, -0.5, 0.5, 0.5,
-3.956556, 3, -6.191686, 1, 1.5, 0.5, 0.5,
-3.956556, 3, -6.191686, 0, 1.5, 0.5, 0.5
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
-3.459589, -3.206944, -4,
-3.459589, -3.206944, 4,
-3.459589, -3.206944, -4,
-3.625244, -3.369713, -4,
-3.459589, -3.206944, -2,
-3.625244, -3.369713, -2,
-3.459589, -3.206944, 0,
-3.625244, -3.369713, 0,
-3.459589, -3.206944, 2,
-3.625244, -3.369713, 2,
-3.459589, -3.206944, 4,
-3.625244, -3.369713, 4
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
-3.956556, -3.69525, -4, 0, -0.5, 0.5, 0.5,
-3.956556, -3.69525, -4, 1, -0.5, 0.5, 0.5,
-3.956556, -3.69525, -4, 1, 1.5, 0.5, 0.5,
-3.956556, -3.69525, -4, 0, 1.5, 0.5, 0.5,
-3.956556, -3.69525, -2, 0, -0.5, 0.5, 0.5,
-3.956556, -3.69525, -2, 1, -0.5, 0.5, 0.5,
-3.956556, -3.69525, -2, 1, 1.5, 0.5, 0.5,
-3.956556, -3.69525, -2, 0, 1.5, 0.5, 0.5,
-3.956556, -3.69525, 0, 0, -0.5, 0.5, 0.5,
-3.956556, -3.69525, 0, 1, -0.5, 0.5, 0.5,
-3.956556, -3.69525, 0, 1, 1.5, 0.5, 0.5,
-3.956556, -3.69525, 0, 0, 1.5, 0.5, 0.5,
-3.956556, -3.69525, 2, 0, -0.5, 0.5, 0.5,
-3.956556, -3.69525, 2, 1, -0.5, 0.5, 0.5,
-3.956556, -3.69525, 2, 1, 1.5, 0.5, 0.5,
-3.956556, -3.69525, 2, 0, 1.5, 0.5, 0.5,
-3.956556, -3.69525, 4, 0, -0.5, 0.5, 0.5,
-3.956556, -3.69525, 4, 1, -0.5, 0.5, 0.5,
-3.956556, -3.69525, 4, 1, 1.5, 0.5, 0.5,
-3.956556, -3.69525, 4, 0, 1.5, 0.5, 0.5
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
-3.459589, -3.206944, -5.368733,
-3.459589, 3.303796, -5.368733,
-3.459589, -3.206944, 5.603971,
-3.459589, 3.303796, 5.603971,
-3.459589, -3.206944, -5.368733,
-3.459589, -3.206944, 5.603971,
-3.459589, 3.303796, -5.368733,
-3.459589, 3.303796, 5.603971,
-3.459589, -3.206944, -5.368733,
3.166641, -3.206944, -5.368733,
-3.459589, -3.206944, 5.603971,
3.166641, -3.206944, 5.603971,
-3.459589, 3.303796, -5.368733,
3.166641, 3.303796, -5.368733,
-3.459589, 3.303796, 5.603971,
3.166641, 3.303796, 5.603971,
3.166641, -3.206944, -5.368733,
3.166641, 3.303796, -5.368733,
3.166641, -3.206944, 5.603971,
3.166641, 3.303796, 5.603971,
3.166641, -3.206944, -5.368733,
3.166641, -3.206944, 5.603971,
3.166641, 3.303796, -5.368733,
3.166641, 3.303796, 5.603971
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
var radius = 7.677016;
var distance = 34.15591;
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
mvMatrix.translate( 0.1464736, -0.04842603, -0.117619 );
mvMatrix.scale( 1.252679, 1.2749, 0.7564717 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15591);
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
phenothiazine<-read.table("phenothiazine.xyz")
```

```
## Error in read.table("phenothiazine.xyz"): no lines available in input
```

```r
x<-phenothiazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenothiazine' not found
```

```r
y<-phenothiazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenothiazine' not found
```

```r
z<-phenothiazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenothiazine' not found
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
-3.36309, 0.7805169, -2.232096, 0, 0, 1, 1, 1,
-3.293596, 0.2194594, -0.15179, 1, 0, 0, 1, 1,
-3.127429, -1.606274, -1.880856, 1, 0, 0, 1, 1,
-2.849999, -0.2106913, -0.4972109, 1, 0, 0, 1, 1,
-2.637691, -1.558563, -0.6147082, 1, 0, 0, 1, 1,
-2.617411, -0.5173683, -2.278398, 1, 0, 0, 1, 1,
-2.589908, 0.9164558, -0.01419189, 0, 0, 0, 1, 1,
-2.533434, -1.64522, -3.195536, 0, 0, 0, 1, 1,
-2.375828, -0.1161639, -0.9926234, 0, 0, 0, 1, 1,
-2.353916, 1.380219, -1.471515, 0, 0, 0, 1, 1,
-2.306148, 0.1790814, -3.061002, 0, 0, 0, 1, 1,
-2.233043, -1.195364, -1.736982, 0, 0, 0, 1, 1,
-2.232311, 0.9182494, -2.295273, 0, 0, 0, 1, 1,
-2.198055, 1.383065, -1.443944, 1, 1, 1, 1, 1,
-2.162801, 0.7222226, 0.1168067, 1, 1, 1, 1, 1,
-2.152251, 1.213215, -1.359435, 1, 1, 1, 1, 1,
-2.145029, 0.6467831, -0.2696007, 1, 1, 1, 1, 1,
-2.124563, 1.0533, -1.435432, 1, 1, 1, 1, 1,
-2.118426, 0.03547321, -1.444166, 1, 1, 1, 1, 1,
-2.111056, -0.6785097, -1.431967, 1, 1, 1, 1, 1,
-2.091203, -0.8285403, -1.430799, 1, 1, 1, 1, 1,
-2.036208, 1.931324, -1.972417, 1, 1, 1, 1, 1,
-2.034428, 0.8821105, -1.681109, 1, 1, 1, 1, 1,
-1.96284, -0.3942921, -1.353184, 1, 1, 1, 1, 1,
-1.950545, -0.8327451, -1.410265, 1, 1, 1, 1, 1,
-1.946458, 0.8717973, -0.2871084, 1, 1, 1, 1, 1,
-1.93269, -0.04039243, -2.007817, 1, 1, 1, 1, 1,
-1.915149, 1.433781, -0.363284, 1, 1, 1, 1, 1,
-1.87445, 0.01511247, -2.205744, 0, 0, 1, 1, 1,
-1.870536, 0.51969, -1.458224, 1, 0, 0, 1, 1,
-1.862561, -0.615814, -3.384296, 1, 0, 0, 1, 1,
-1.831197, 0.494189, -0.3285993, 1, 0, 0, 1, 1,
-1.823283, 1.59106, -1.531163, 1, 0, 0, 1, 1,
-1.816713, -0.7585667, -0.4997503, 1, 0, 0, 1, 1,
-1.811466, 0.8042231, -2.749262, 0, 0, 0, 1, 1,
-1.782493, -0.1893258, -2.724418, 0, 0, 0, 1, 1,
-1.778701, 0.4708707, -0.8524847, 0, 0, 0, 1, 1,
-1.772326, -0.9456017, -4.254684, 0, 0, 0, 1, 1,
-1.772012, -0.49875, -2.432912, 0, 0, 0, 1, 1,
-1.752181, -1.167626, -1.770566, 0, 0, 0, 1, 1,
-1.72579, -0.09324855, -1.769028, 0, 0, 0, 1, 1,
-1.711922, 1.357753, -2.783058, 1, 1, 1, 1, 1,
-1.706991, -0.4308853, -0.5741764, 1, 1, 1, 1, 1,
-1.675106, 1.796255, -2.566155, 1, 1, 1, 1, 1,
-1.658746, -0.0735158, -2.166767, 1, 1, 1, 1, 1,
-1.643452, 0.1368643, -2.994939, 1, 1, 1, 1, 1,
-1.631005, 0.4120148, -2.460304, 1, 1, 1, 1, 1,
-1.607231, 0.3998809, -0.1397363, 1, 1, 1, 1, 1,
-1.606211, 0.3332469, -2.329383, 1, 1, 1, 1, 1,
-1.598963, -0.03687894, -2.544176, 1, 1, 1, 1, 1,
-1.587835, 0.3604546, 2.100919, 1, 1, 1, 1, 1,
-1.582539, 0.06901008, -1.664049, 1, 1, 1, 1, 1,
-1.572246, 0.9682012, -2.194332, 1, 1, 1, 1, 1,
-1.561004, 1.408823, -2.195287, 1, 1, 1, 1, 1,
-1.559796, -1.575628, -2.159384, 1, 1, 1, 1, 1,
-1.551829, 0.7236478, -2.128775, 1, 1, 1, 1, 1,
-1.550297, -0.2398463, -2.411779, 0, 0, 1, 1, 1,
-1.544496, -0.6233599, -1.915452, 1, 0, 0, 1, 1,
-1.5387, -0.3566291, -1.07219, 1, 0, 0, 1, 1,
-1.528516, 1.392491, -1.250489, 1, 0, 0, 1, 1,
-1.528368, 0.6079059, -2.919816, 1, 0, 0, 1, 1,
-1.527782, 0.9404132, -0.8556031, 1, 0, 0, 1, 1,
-1.526507, -0.253597, -1.038209, 0, 0, 0, 1, 1,
-1.522734, 1.323385, -2.429002, 0, 0, 0, 1, 1,
-1.518261, -0.1901591, -2.093166, 0, 0, 0, 1, 1,
-1.502728, 1.892849, -0.1224219, 0, 0, 0, 1, 1,
-1.501752, -1.984746, -3.255255, 0, 0, 0, 1, 1,
-1.495493, -1.631785, -3.061303, 0, 0, 0, 1, 1,
-1.493693, 0.1478222, -1.961194, 0, 0, 0, 1, 1,
-1.492838, -0.5596439, -1.795448, 1, 1, 1, 1, 1,
-1.489214, -0.1424333, -3.127038, 1, 1, 1, 1, 1,
-1.476039, 0.8654468, -1.588023, 1, 1, 1, 1, 1,
-1.471995, 0.809417, -1.287904, 1, 1, 1, 1, 1,
-1.471791, 1.963885, -2.055331, 1, 1, 1, 1, 1,
-1.46595, 0.6993378, -2.196484, 1, 1, 1, 1, 1,
-1.455683, -0.02660169, -1.128956, 1, 1, 1, 1, 1,
-1.45264, 1.411757, 0.5917946, 1, 1, 1, 1, 1,
-1.429128, -0.4391034, -2.643221, 1, 1, 1, 1, 1,
-1.428121, 2.571945, 0.3930124, 1, 1, 1, 1, 1,
-1.41271, 1.424091, -0.007369666, 1, 1, 1, 1, 1,
-1.406615, 0.4401704, -0.2703667, 1, 1, 1, 1, 1,
-1.40655, 0.7515265, -1.129996, 1, 1, 1, 1, 1,
-1.404265, -0.2584461, -3.242423, 1, 1, 1, 1, 1,
-1.380269, 0.08412883, -0.1830561, 1, 1, 1, 1, 1,
-1.371691, 1.8008, -2.172288, 0, 0, 1, 1, 1,
-1.368324, 1.84891, -0.3346756, 1, 0, 0, 1, 1,
-1.360536, -1.410661, -2.769014, 1, 0, 0, 1, 1,
-1.343491, -0.6273294, -2.262285, 1, 0, 0, 1, 1,
-1.339925, -1.302797, -2.778581, 1, 0, 0, 1, 1,
-1.339775, -0.1832136, -1.559065, 1, 0, 0, 1, 1,
-1.336047, -1.032627, -2.477451, 0, 0, 0, 1, 1,
-1.33577, 1.124934, -0.8519222, 0, 0, 0, 1, 1,
-1.335548, 0.8412009, -0.2429057, 0, 0, 0, 1, 1,
-1.325853, -0.0447777, -0.2389149, 0, 0, 0, 1, 1,
-1.320615, -1.302707, -3.75735, 0, 0, 0, 1, 1,
-1.31664, 2.928604, 0.8542989, 0, 0, 0, 1, 1,
-1.311044, 0.9716863, -0.331764, 0, 0, 0, 1, 1,
-1.301564, -0.986865, -3.039014, 1, 1, 1, 1, 1,
-1.29524, 0.5236073, -1.283123, 1, 1, 1, 1, 1,
-1.293162, -0.1007829, -2.543683, 1, 1, 1, 1, 1,
-1.276193, 0.3248208, 0.01799854, 1, 1, 1, 1, 1,
-1.27001, -0.1193874, -2.023546, 1, 1, 1, 1, 1,
-1.264092, -0.2134272, -0.9850077, 1, 1, 1, 1, 1,
-1.263203, 0.5458836, -2.414348, 1, 1, 1, 1, 1,
-1.26217, -1.057133, -3.001779, 1, 1, 1, 1, 1,
-1.258886, -0.476732, -1.58407, 1, 1, 1, 1, 1,
-1.249265, -0.8446575, -2.288675, 1, 1, 1, 1, 1,
-1.240786, -0.1722707, -1.917886, 1, 1, 1, 1, 1,
-1.240315, -0.4909626, -2.798974, 1, 1, 1, 1, 1,
-1.238122, -1.492616, -2.493636, 1, 1, 1, 1, 1,
-1.2223, 0.1061067, -1.138505, 1, 1, 1, 1, 1,
-1.21677, 0.6643019, 1.578359, 1, 1, 1, 1, 1,
-1.214431, 0.3623415, -1.714586, 0, 0, 1, 1, 1,
-1.213585, -1.024446, -3.386516, 1, 0, 0, 1, 1,
-1.203273, -0.9105951, -2.456107, 1, 0, 0, 1, 1,
-1.198324, -0.5076969, -1.126881, 1, 0, 0, 1, 1,
-1.197066, 0.2531365, -2.369371, 1, 0, 0, 1, 1,
-1.194108, 0.721381, 0.2811328, 1, 0, 0, 1, 1,
-1.19129, -1.327937, -2.059375, 0, 0, 0, 1, 1,
-1.189682, 0.6924932, -1.563934, 0, 0, 0, 1, 1,
-1.184685, -0.3745455, -2.577296, 0, 0, 0, 1, 1,
-1.184267, 1.00587, 1.128259, 0, 0, 0, 1, 1,
-1.176116, -1.687223, -3.378226, 0, 0, 0, 1, 1,
-1.173217, 0.5325195, -2.048275, 0, 0, 0, 1, 1,
-1.171191, -0.3569726, -1.27232, 0, 0, 0, 1, 1,
-1.162712, 0.3049749, -0.8735842, 1, 1, 1, 1, 1,
-1.152125, -0.4121166, -2.093913, 1, 1, 1, 1, 1,
-1.149702, -0.9123828, -0.3891664, 1, 1, 1, 1, 1,
-1.114703, 0.8005327, 0.3908674, 1, 1, 1, 1, 1,
-1.114026, 2.245768, 0.819055, 1, 1, 1, 1, 1,
-1.11055, 0.02719763, -0.3826368, 1, 1, 1, 1, 1,
-1.109079, -0.8845264, -4.071048, 1, 1, 1, 1, 1,
-1.103606, -1.28725, -2.969563, 1, 1, 1, 1, 1,
-1.1011, -0.5749789, -1.135997, 1, 1, 1, 1, 1,
-1.098291, 1.536655, -1.469129, 1, 1, 1, 1, 1,
-1.096406, 0.00448917, -0.2852635, 1, 1, 1, 1, 1,
-1.092293, -1.495378, -2.733555, 1, 1, 1, 1, 1,
-1.092274, -0.1842905, -2.527243, 1, 1, 1, 1, 1,
-1.084969, -0.9610044, -3.117793, 1, 1, 1, 1, 1,
-1.079803, 0.1776395, -1.941232, 1, 1, 1, 1, 1,
-1.073246, -0.4117738, -3.517192, 0, 0, 1, 1, 1,
-1.070323, 0.2554392, -0.1836913, 1, 0, 0, 1, 1,
-1.066438, -0.3275507, -1.070208, 1, 0, 0, 1, 1,
-1.066014, 1.171405, -0.3441753, 1, 0, 0, 1, 1,
-1.056073, -0.01731186, -1.222626, 1, 0, 0, 1, 1,
-1.051886, 1.853709, 0.05329268, 1, 0, 0, 1, 1,
-1.045933, -0.4678487, -1.837079, 0, 0, 0, 1, 1,
-1.044109, -0.4706017, -2.934454, 0, 0, 0, 1, 1,
-1.040731, -1.013392, -3.011051, 0, 0, 0, 1, 1,
-1.039814, -1.33517, -2.808498, 0, 0, 0, 1, 1,
-1.038395, 0.2753996, -2.774805, 0, 0, 0, 1, 1,
-1.033874, 0.6096128, -0.6698996, 0, 0, 0, 1, 1,
-1.03385, 0.2094353, -0.6431377, 0, 0, 0, 1, 1,
-1.028834, -0.0531117, -1.824909, 1, 1, 1, 1, 1,
-1.02663, 2.13827, -0.0617816, 1, 1, 1, 1, 1,
-1.026286, 1.646133, 0.1851778, 1, 1, 1, 1, 1,
-1.025451, -0.1002005, -2.656655, 1, 1, 1, 1, 1,
-1.024723, -0.4103611, -1.971745, 1, 1, 1, 1, 1,
-1.023502, 0.9790213, -0.953314, 1, 1, 1, 1, 1,
-1.023128, 1.087999, -1.707229, 1, 1, 1, 1, 1,
-1.022246, -0.2127251, -3.150604, 1, 1, 1, 1, 1,
-1.020559, 0.8837857, -1.69218, 1, 1, 1, 1, 1,
-1.014232, 1.230389, -0.6789601, 1, 1, 1, 1, 1,
-1.013378, -0.9960933, -3.132638, 1, 1, 1, 1, 1,
-1.010931, -0.1332046, -2.978255, 1, 1, 1, 1, 1,
-0.9933901, -0.02858367, -0.7585613, 1, 1, 1, 1, 1,
-0.9855117, -1.516963, -2.660709, 1, 1, 1, 1, 1,
-0.9814006, -0.2944096, -0.6344384, 1, 1, 1, 1, 1,
-0.9758002, 0.2041354, -1.576361, 0, 0, 1, 1, 1,
-0.9705315, 0.4352355, -0.9547443, 1, 0, 0, 1, 1,
-0.9636539, -0.09010772, -1.792629, 1, 0, 0, 1, 1,
-0.963644, 0.5828515, -2.272913, 1, 0, 0, 1, 1,
-0.9633752, -1.506201, -1.641795, 1, 0, 0, 1, 1,
-0.9608648, 0.3669931, -0.3742206, 1, 0, 0, 1, 1,
-0.9586521, -0.7468361, -3.312858, 0, 0, 0, 1, 1,
-0.9585599, 0.6465551, -2.571381, 0, 0, 0, 1, 1,
-0.955424, -1.390784, -0.08060884, 0, 0, 0, 1, 1,
-0.9484432, -0.2956272, -2.887143, 0, 0, 0, 1, 1,
-0.9405754, 1.220494, -1.226933, 0, 0, 0, 1, 1,
-0.9320872, -2.516677, -2.683812, 0, 0, 0, 1, 1,
-0.9306135, 0.7320375, -0.8028217, 0, 0, 0, 1, 1,
-0.9286168, 0.7397562, 0.1731617, 1, 1, 1, 1, 1,
-0.927476, 2.271301, 0.30505, 1, 1, 1, 1, 1,
-0.924558, 0.09902221, -2.070433, 1, 1, 1, 1, 1,
-0.9222404, -0.3290978, -1.236312, 1, 1, 1, 1, 1,
-0.9220651, 0.5828034, -1.580077, 1, 1, 1, 1, 1,
-0.9200679, -0.1306536, -3.198581, 1, 1, 1, 1, 1,
-0.918681, -0.9746769, -2.822213, 1, 1, 1, 1, 1,
-0.914959, -1.125674, -0.5440112, 1, 1, 1, 1, 1,
-0.9129347, -0.5485139, -2.527358, 1, 1, 1, 1, 1,
-0.9100801, -1.157924, -1.623323, 1, 1, 1, 1, 1,
-0.9059576, -0.557126, -2.504282, 1, 1, 1, 1, 1,
-0.9043073, -0.9245141, -2.499012, 1, 1, 1, 1, 1,
-0.9032283, 1.341753, 0.9001762, 1, 1, 1, 1, 1,
-0.8995743, -0.5194758, -1.326011, 1, 1, 1, 1, 1,
-0.8982272, 1.262974, -1.137143, 1, 1, 1, 1, 1,
-0.8977178, -1.239198, -2.386891, 0, 0, 1, 1, 1,
-0.8960626, 2.1337, 1.111693, 1, 0, 0, 1, 1,
-0.895551, 0.6767818, -0.5781394, 1, 0, 0, 1, 1,
-0.8910071, 0.2316804, -1.221068, 1, 0, 0, 1, 1,
-0.8855819, -1.496858, -2.531263, 1, 0, 0, 1, 1,
-0.875303, -1.206453, -4.421969, 1, 0, 0, 1, 1,
-0.8733323, -1.884659, -2.294639, 0, 0, 0, 1, 1,
-0.8647531, 0.8434273, -2.171974, 0, 0, 0, 1, 1,
-0.8558264, 0.6287187, -0.9846641, 0, 0, 0, 1, 1,
-0.8544241, 1.025001, -0.6507821, 0, 0, 0, 1, 1,
-0.8537821, 0.9323345, 0.4111954, 0, 0, 0, 1, 1,
-0.8509223, 0.05830591, -0.9367635, 0, 0, 0, 1, 1,
-0.8507566, 0.8618566, -1.216117, 0, 0, 0, 1, 1,
-0.8501527, 1.181573, -1.14469, 1, 1, 1, 1, 1,
-0.8497248, -0.2300869, -1.410287, 1, 1, 1, 1, 1,
-0.8453447, -0.3325887, -2.612826, 1, 1, 1, 1, 1,
-0.8443012, -1.284431, -1.514594, 1, 1, 1, 1, 1,
-0.8384442, 0.2708743, -0.1046315, 1, 1, 1, 1, 1,
-0.8380567, 1.790728, 0.7289791, 1, 1, 1, 1, 1,
-0.8369293, 0.2838217, -1.68326, 1, 1, 1, 1, 1,
-0.8358902, -0.2318161, 0.3081295, 1, 1, 1, 1, 1,
-0.833554, 0.8661348, -0.7465656, 1, 1, 1, 1, 1,
-0.8311241, 3.083265, -2.217825, 1, 1, 1, 1, 1,
-0.8286958, -2.638486, -2.093876, 1, 1, 1, 1, 1,
-0.8198755, 0.850948, 1.248584, 1, 1, 1, 1, 1,
-0.8115208, -0.8385835, -2.835386, 1, 1, 1, 1, 1,
-0.8112503, 0.4851016, -2.13386, 1, 1, 1, 1, 1,
-0.8065116, 0.427298, -0.8355662, 1, 1, 1, 1, 1,
-0.8043175, -0.7967857, -1.15209, 0, 0, 1, 1, 1,
-0.804229, 1.446242, -0.339761, 1, 0, 0, 1, 1,
-0.8023728, -0.07886142, -1.818467, 1, 0, 0, 1, 1,
-0.8015046, 1.32913, -1.112562, 1, 0, 0, 1, 1,
-0.7953702, 1.828307, 0.1760291, 1, 0, 0, 1, 1,
-0.7936281, -0.7560431, -2.845544, 1, 0, 0, 1, 1,
-0.7923999, -1.078937, -2.864761, 0, 0, 0, 1, 1,
-0.7897592, 0.1342231, -1.893162, 0, 0, 0, 1, 1,
-0.7811242, -1.785931, -4.198476, 0, 0, 0, 1, 1,
-0.7733721, 1.355948, -1.90297, 0, 0, 0, 1, 1,
-0.7694101, -0.8917155, -2.001921, 0, 0, 0, 1, 1,
-0.7630361, -0.708822, -1.974826, 0, 0, 0, 1, 1,
-0.7526885, -1.114957, -2.022305, 0, 0, 0, 1, 1,
-0.7469549, -1.300771, -2.121922, 1, 1, 1, 1, 1,
-0.7444222, -1.755282, -3.116331, 1, 1, 1, 1, 1,
-0.7384813, -0.3503007, -0.6212268, 1, 1, 1, 1, 1,
-0.7356152, -0.4652125, -1.708331, 1, 1, 1, 1, 1,
-0.7335681, -1.017039, -1.950895, 1, 1, 1, 1, 1,
-0.7263697, -0.9863497, -2.893179, 1, 1, 1, 1, 1,
-0.7259318, -0.3492955, -2.506699, 1, 1, 1, 1, 1,
-0.72544, -0.785784, -2.55295, 1, 1, 1, 1, 1,
-0.7212383, -0.0508393, -1.657902, 1, 1, 1, 1, 1,
-0.7195539, 1.02192, -0.8283904, 1, 1, 1, 1, 1,
-0.7194165, -1.041808, -3.830213, 1, 1, 1, 1, 1,
-0.7121783, -1.132701, -0.8184467, 1, 1, 1, 1, 1,
-0.7069028, -0.6548706, -2.301203, 1, 1, 1, 1, 1,
-0.7064511, -0.5063282, -0.9618064, 1, 1, 1, 1, 1,
-0.7062188, -0.329275, -2.995161, 1, 1, 1, 1, 1,
-0.7055285, 0.4675633, -0.05126751, 0, 0, 1, 1, 1,
-0.6975407, -0.5929558, -0.8794893, 1, 0, 0, 1, 1,
-0.6964245, 1.043967, 0.494295, 1, 0, 0, 1, 1,
-0.6932954, -0.7215371, -1.827055, 1, 0, 0, 1, 1,
-0.6888394, 0.2255662, -2.721131, 1, 0, 0, 1, 1,
-0.6876425, -0.6176614, -2.773744, 1, 0, 0, 1, 1,
-0.6829604, -0.3765692, -3.631256, 0, 0, 0, 1, 1,
-0.6777999, 0.2649479, -2.257618, 0, 0, 0, 1, 1,
-0.6758517, 2.402724, 0.6911805, 0, 0, 0, 1, 1,
-0.6751285, -0.7312447, -3.327263, 0, 0, 0, 1, 1,
-0.6741526, -0.09748944, -3.490419, 0, 0, 0, 1, 1,
-0.6667643, 0.03301254, -1.743087, 0, 0, 0, 1, 1,
-0.6646, 0.2598721, -2.024031, 0, 0, 0, 1, 1,
-0.6558956, -1.024833, 0.1198843, 1, 1, 1, 1, 1,
-0.6552332, -0.9456402, -3.949299, 1, 1, 1, 1, 1,
-0.6527215, -1.954327, -3.255013, 1, 1, 1, 1, 1,
-0.6452324, -1.158338, -2.137906, 1, 1, 1, 1, 1,
-0.6420048, 1.131368, -1.078206, 1, 1, 1, 1, 1,
-0.6340586, 0.7474189, -0.7902056, 1, 1, 1, 1, 1,
-0.6313444, 0.1538143, -2.149927, 1, 1, 1, 1, 1,
-0.6292725, 2.479048, -1.931908, 1, 1, 1, 1, 1,
-0.6290479, -0.3739879, -2.679624, 1, 1, 1, 1, 1,
-0.6284006, 1.584274, -0.9359833, 1, 1, 1, 1, 1,
-0.6267259, -0.07836656, -2.452928, 1, 1, 1, 1, 1,
-0.6213703, -0.2650537, -1.720797, 1, 1, 1, 1, 1,
-0.61741, -0.3188046, -1.49294, 1, 1, 1, 1, 1,
-0.6168129, 0.1241693, -1.042471, 1, 1, 1, 1, 1,
-0.6041989, 0.04427121, -0.6111633, 1, 1, 1, 1, 1,
-0.5978113, -0.3060928, -2.152398, 0, 0, 1, 1, 1,
-0.5937731, -1.227214, -5.189839, 1, 0, 0, 1, 1,
-0.5905534, 1.325833, -0.4495845, 1, 0, 0, 1, 1,
-0.5888649, -0.8077088, -3.913622, 1, 0, 0, 1, 1,
-0.5819489, 0.3242373, -1.501317, 1, 0, 0, 1, 1,
-0.580202, 0.936399, 0.3498544, 1, 0, 0, 1, 1,
-0.5754874, -0.3747993, -3.2594, 0, 0, 0, 1, 1,
-0.5713946, 0.173478, -3.063652, 0, 0, 0, 1, 1,
-0.5711313, -0.3984895, -3.493544, 0, 0, 0, 1, 1,
-0.5697291, -0.2871018, -3.034871, 0, 0, 0, 1, 1,
-0.5560615, -0.5474735, -1.929993, 0, 0, 0, 1, 1,
-0.5473823, -0.5139293, -1.970232, 0, 0, 0, 1, 1,
-0.5434765, 0.8151718, -0.610139, 0, 0, 0, 1, 1,
-0.5431785, -0.05123058, -2.418944, 1, 1, 1, 1, 1,
-0.5384633, 1.743363, -2.095104, 1, 1, 1, 1, 1,
-0.5347325, 0.008046695, -1.892049, 1, 1, 1, 1, 1,
-0.534721, 1.656352, -0.2681352, 1, 1, 1, 1, 1,
-0.533951, -0.337454, -2.872125, 1, 1, 1, 1, 1,
-0.5319075, -1.291694, -3.201798, 1, 1, 1, 1, 1,
-0.5309979, -0.976153, -4.674966, 1, 1, 1, 1, 1,
-0.530974, -1.272222, -2.358352, 1, 1, 1, 1, 1,
-0.5235394, -0.4076536, -2.256096, 1, 1, 1, 1, 1,
-0.5202664, 0.04120794, -1.368875, 1, 1, 1, 1, 1,
-0.5151588, -0.5080346, -3.047995, 1, 1, 1, 1, 1,
-0.5130047, 0.360835, -1.680104, 1, 1, 1, 1, 1,
-0.5114359, -0.4405566, -1.024708, 1, 1, 1, 1, 1,
-0.5084845, -0.925185, -4.583921, 1, 1, 1, 1, 1,
-0.5067084, 0.09506965, 0.05481135, 1, 1, 1, 1, 1,
-0.5014058, -0.6355646, -3.057232, 0, 0, 1, 1, 1,
-0.5003908, 0.6215199, -1.686232, 1, 0, 0, 1, 1,
-0.500004, 0.7146878, -2.764585, 1, 0, 0, 1, 1,
-0.4915379, -0.5144638, -3.897714, 1, 0, 0, 1, 1,
-0.4913734, 1.800943, -0.790276, 1, 0, 0, 1, 1,
-0.4904448, 0.6887386, 0.6237817, 1, 0, 0, 1, 1,
-0.4895495, -0.06443974, -1.386656, 0, 0, 0, 1, 1,
-0.4884769, 0.274689, -0.1452001, 0, 0, 0, 1, 1,
-0.4870764, 0.4001965, 0.8874775, 0, 0, 0, 1, 1,
-0.4820648, -1.45568, -1.836552, 0, 0, 0, 1, 1,
-0.4777703, 1.878649, -1.035184, 0, 0, 0, 1, 1,
-0.4760243, -0.5031286, -1.257562, 0, 0, 0, 1, 1,
-0.4712785, 0.2237291, -0.2813472, 0, 0, 0, 1, 1,
-0.468282, 0.6190851, -1.454421, 1, 1, 1, 1, 1,
-0.4671352, -1.534742, -3.29582, 1, 1, 1, 1, 1,
-0.4654988, 0.4242617, -2.159933, 1, 1, 1, 1, 1,
-0.4635091, -0.453969, -2.777417, 1, 1, 1, 1, 1,
-0.4629893, -0.9157653, -2.71525, 1, 1, 1, 1, 1,
-0.4599065, -1.360359, -2.262703, 1, 1, 1, 1, 1,
-0.4535362, 0.4008897, -0.647272, 1, 1, 1, 1, 1,
-0.45029, 0.2144552, 0.9738694, 1, 1, 1, 1, 1,
-0.447289, -0.5088487, -2.13022, 1, 1, 1, 1, 1,
-0.4464158, -0.7352535, -3.278243, 1, 1, 1, 1, 1,
-0.4462191, -0.1707924, -2.569198, 1, 1, 1, 1, 1,
-0.4422156, -0.7440294, -1.964193, 1, 1, 1, 1, 1,
-0.4372863, -0.6544552, -3.334474, 1, 1, 1, 1, 1,
-0.4355234, 0.4153061, -0.1523833, 1, 1, 1, 1, 1,
-0.4317219, -1.130096, -0.6826076, 1, 1, 1, 1, 1,
-0.4294771, -1.661165, -3.335844, 0, 0, 1, 1, 1,
-0.4252536, -0.09242728, -2.62973, 1, 0, 0, 1, 1,
-0.4230799, 0.6323828, -0.1185924, 1, 0, 0, 1, 1,
-0.4217848, -0.3807499, -1.691945, 1, 0, 0, 1, 1,
-0.4207907, 2.385399, -0.4805478, 1, 0, 0, 1, 1,
-0.4152596, -0.9241221, -3.94013, 1, 0, 0, 1, 1,
-0.4116722, 1.993828, 0.4136396, 0, 0, 0, 1, 1,
-0.4114592, -0.5526902, -1.609047, 0, 0, 0, 1, 1,
-0.4104764, -0.6753063, -2.958113, 0, 0, 0, 1, 1,
-0.4087934, 0.5649068, -1.605283, 0, 0, 0, 1, 1,
-0.4084788, 0.04406964, -1.93682, 0, 0, 0, 1, 1,
-0.4084069, -1.039358, -2.548824, 0, 0, 0, 1, 1,
-0.3935839, -0.2596533, -2.038793, 0, 0, 0, 1, 1,
-0.3929357, 0.1086828, -0.9860425, 1, 1, 1, 1, 1,
-0.3904706, 1.476048, 0.83019, 1, 1, 1, 1, 1,
-0.3887138, -0.2162333, -0.5015157, 1, 1, 1, 1, 1,
-0.3861992, -1.47533, -2.417348, 1, 1, 1, 1, 1,
-0.3861445, 0.3380035, -0.25962, 1, 1, 1, 1, 1,
-0.3853575, 0.7375295, 0.4680362, 1, 1, 1, 1, 1,
-0.3850981, 0.03163994, -2.357524, 1, 1, 1, 1, 1,
-0.384149, 2.419724, 0.8241547, 1, 1, 1, 1, 1,
-0.3810208, -0.8262308, -1.729486, 1, 1, 1, 1, 1,
-0.3808323, -1.423578, -4.378677, 1, 1, 1, 1, 1,
-0.380134, 0.4049658, 0.6472483, 1, 1, 1, 1, 1,
-0.3799402, 1.513892, -1.15672, 1, 1, 1, 1, 1,
-0.3786244, 0.02123497, -1.084365, 1, 1, 1, 1, 1,
-0.3775193, -0.9853824, -1.840479, 1, 1, 1, 1, 1,
-0.3751395, 0.4689448, 0.2647069, 1, 1, 1, 1, 1,
-0.373784, 0.4829141, 0.2214083, 0, 0, 1, 1, 1,
-0.3712219, -1.067216, -2.934481, 1, 0, 0, 1, 1,
-0.3704088, 0.7370756, 0.4388741, 1, 0, 0, 1, 1,
-0.3680211, -1.061271, -3.672335, 1, 0, 0, 1, 1,
-0.3673976, 0.2748642, -1.237186, 1, 0, 0, 1, 1,
-0.3654775, 0.7029962, -2.4339, 1, 0, 0, 1, 1,
-0.3570137, -0.7421409, -3.928472, 0, 0, 0, 1, 1,
-0.3542205, -1.248129, -2.700771, 0, 0, 0, 1, 1,
-0.3538888, 0.1848594, -0.9484668, 0, 0, 0, 1, 1,
-0.3456104, 0.07681779, -0.8280194, 0, 0, 0, 1, 1,
-0.3423171, -0.417597, -1.88772, 0, 0, 0, 1, 1,
-0.3403038, -0.2157668, -3.652181, 0, 0, 0, 1, 1,
-0.3391078, -1.148896, -0.1089689, 0, 0, 0, 1, 1,
-0.3373131, -1.124508, -3.224588, 1, 1, 1, 1, 1,
-0.3364991, 0.215136, -3.137623, 1, 1, 1, 1, 1,
-0.3358148, -2.062125, -3.232432, 1, 1, 1, 1, 1,
-0.3357733, -0.0682908, -1.491053, 1, 1, 1, 1, 1,
-0.3316058, -0.3196054, -2.692893, 1, 1, 1, 1, 1,
-0.3307997, -1.670783, -3.494577, 1, 1, 1, 1, 1,
-0.3293245, 0.7294883, -1.893191, 1, 1, 1, 1, 1,
-0.3287124, -0.570425, -0.8480545, 1, 1, 1, 1, 1,
-0.3283772, 0.3547065, -1.044928, 1, 1, 1, 1, 1,
-0.3255743, 1.14406, -0.6238506, 1, 1, 1, 1, 1,
-0.3253832, -1.339571, -3.089345, 1, 1, 1, 1, 1,
-0.3223651, -1.768711, -1.754973, 1, 1, 1, 1, 1,
-0.3201802, -0.8110827, -0.7247357, 1, 1, 1, 1, 1,
-0.3160834, -0.842446, -3.372416, 1, 1, 1, 1, 1,
-0.3111405, -1.243359, -3.185549, 1, 1, 1, 1, 1,
-0.309117, 0.1000945, -0.6278203, 0, 0, 1, 1, 1,
-0.3061604, -1.636308, -2.831604, 1, 0, 0, 1, 1,
-0.3048227, -0.2318985, -2.778765, 1, 0, 0, 1, 1,
-0.3010846, -1.236781, -2.827788, 1, 0, 0, 1, 1,
-0.3009268, -0.9903719, -3.594651, 1, 0, 0, 1, 1,
-0.3002116, -0.01076309, -2.135979, 1, 0, 0, 1, 1,
-0.2965813, -0.8451809, -2.992907, 0, 0, 0, 1, 1,
-0.2940618, -0.4280831, -2.051367, 0, 0, 0, 1, 1,
-0.2928711, 1.373789, -0.0001221445, 0, 0, 0, 1, 1,
-0.291613, 0.1196106, -0.7605302, 0, 0, 0, 1, 1,
-0.2908797, -0.6748935, -2.570941, 0, 0, 0, 1, 1,
-0.2908221, -0.3965533, -4.036956, 0, 0, 0, 1, 1,
-0.2879973, 0.1677408, -1.431202, 0, 0, 0, 1, 1,
-0.2874308, 0.1052084, -2.214909, 1, 1, 1, 1, 1,
-0.2782305, 0.4592783, -1.746191, 1, 1, 1, 1, 1,
-0.2776884, 1.734756, -1.838694, 1, 1, 1, 1, 1,
-0.2755786, -1.329036, -1.890264, 1, 1, 1, 1, 1,
-0.2735483, -1.06014, -2.436066, 1, 1, 1, 1, 1,
-0.2724868, 2.790426, 1.433447, 1, 1, 1, 1, 1,
-0.2697904, 0.9359531, -0.2612125, 1, 1, 1, 1, 1,
-0.2693674, 1.524413, -1.174433, 1, 1, 1, 1, 1,
-0.2689127, 1.792714, -1.56676, 1, 1, 1, 1, 1,
-0.2621815, -0.24411, -2.529008, 1, 1, 1, 1, 1,
-0.2600666, 1.297274, -0.2357698, 1, 1, 1, 1, 1,
-0.2594532, 1.178681, -0.003583266, 1, 1, 1, 1, 1,
-0.2537073, -0.4005686, -2.872329, 1, 1, 1, 1, 1,
-0.2487909, 0.2961428, 0.4013022, 1, 1, 1, 1, 1,
-0.2406884, 0.1018419, -1.611222, 1, 1, 1, 1, 1,
-0.2404859, 0.3682788, -1.942299, 0, 0, 1, 1, 1,
-0.240189, -1.389525, -2.630356, 1, 0, 0, 1, 1,
-0.2372219, -1.108616, -2.897856, 1, 0, 0, 1, 1,
-0.2360512, 0.3811986, 0.6486337, 1, 0, 0, 1, 1,
-0.2304496, -1.151448, -3.039484, 1, 0, 0, 1, 1,
-0.2240673, -1.32775, -3.126133, 1, 0, 0, 1, 1,
-0.2230981, -0.4406731, -3.177461, 0, 0, 0, 1, 1,
-0.2227718, -1.137879, -3.330104, 0, 0, 0, 1, 1,
-0.2224621, 0.5680652, 2.04434, 0, 0, 0, 1, 1,
-0.2183101, -0.3745985, -3.377957, 0, 0, 0, 1, 1,
-0.2168724, 0.1691303, -0.358796, 0, 0, 0, 1, 1,
-0.2136459, 0.04804918, 0.04764577, 0, 0, 0, 1, 1,
-0.2115311, 0.734955, 0.4062021, 0, 0, 0, 1, 1,
-0.2105232, -0.09861145, -2.472264, 1, 1, 1, 1, 1,
-0.2002907, 1.127248, -1.080875, 1, 1, 1, 1, 1,
-0.1921826, 0.9087783, 1.669443, 1, 1, 1, 1, 1,
-0.1900924, -0.9982239, -2.275527, 1, 1, 1, 1, 1,
-0.1864834, -1.670154, -3.006167, 1, 1, 1, 1, 1,
-0.1857042, -0.702889, -3.3204, 1, 1, 1, 1, 1,
-0.1853249, 0.1925853, -1.695014, 1, 1, 1, 1, 1,
-0.184598, 0.3743168, -0.3062369, 1, 1, 1, 1, 1,
-0.1779892, -1.723976, -3.927821, 1, 1, 1, 1, 1,
-0.1724976, 1.620383, -0.557146, 1, 1, 1, 1, 1,
-0.1722871, -0.6970181, -2.894003, 1, 1, 1, 1, 1,
-0.1703844, -0.8570793, -2.323016, 1, 1, 1, 1, 1,
-0.1654856, -0.9535883, 0.1342948, 1, 1, 1, 1, 1,
-0.1639231, -1.771655, -3.957413, 1, 1, 1, 1, 1,
-0.1637399, 0.1000366, -0.01335193, 1, 1, 1, 1, 1,
-0.1592481, 1.050562, -0.04191916, 0, 0, 1, 1, 1,
-0.1585319, -0.7066944, -2.717561, 1, 0, 0, 1, 1,
-0.1571171, -0.7639162, -2.784, 1, 0, 0, 1, 1,
-0.1570986, -1.448798, -2.439631, 1, 0, 0, 1, 1,
-0.1556571, -0.9410156, -4.360438, 1, 0, 0, 1, 1,
-0.1555095, 0.0821218, -2.221638, 1, 0, 0, 1, 1,
-0.1554501, -1.863937, -3.109006, 0, 0, 0, 1, 1,
-0.1489394, 0.6386514, -0.01543596, 0, 0, 0, 1, 1,
-0.1487285, -0.958132, -3.471189, 0, 0, 0, 1, 1,
-0.1459645, 0.04002199, -3.544876, 0, 0, 0, 1, 1,
-0.1443723, -3.112128, -3.260777, 0, 0, 0, 1, 1,
-0.1395319, -0.6379356, -3.154224, 0, 0, 0, 1, 1,
-0.1294945, -0.5899265, -2.440283, 0, 0, 0, 1, 1,
-0.1263135, 0.009286975, -1.146431, 1, 1, 1, 1, 1,
-0.12496, 0.3549258, -0.6293103, 1, 1, 1, 1, 1,
-0.1174503, 0.009334603, -0.6480073, 1, 1, 1, 1, 1,
-0.1160092, 1.26329, -1.14871, 1, 1, 1, 1, 1,
-0.1148208, 0.7436731, -0.2304842, 1, 1, 1, 1, 1,
-0.1109179, 1.610191, -1.031642, 1, 1, 1, 1, 1,
-0.1102145, -1.45524, -1.89709, 1, 1, 1, 1, 1,
-0.1070384, -0.009925726, -2.528586, 1, 1, 1, 1, 1,
-0.1055159, 0.4216759, -2.554664, 1, 1, 1, 1, 1,
-0.1039983, 0.6005417, 0.2292735, 1, 1, 1, 1, 1,
-0.1012624, -0.5949908, -1.755031, 1, 1, 1, 1, 1,
-0.1006405, -1.206418, -3.171019, 1, 1, 1, 1, 1,
-0.09582599, 0.3743261, -0.9965046, 1, 1, 1, 1, 1,
-0.09432141, 1.46154, -0.5915933, 1, 1, 1, 1, 1,
-0.08972295, -0.00518819, -3.36384, 1, 1, 1, 1, 1,
-0.08968834, -0.8919232, -5.208937, 0, 0, 1, 1, 1,
-0.07503807, 0.8639466, 0.5903051, 1, 0, 0, 1, 1,
-0.07216523, -0.0815038, -4.903702, 1, 0, 0, 1, 1,
-0.06953317, 1.663557, 1.094013, 1, 0, 0, 1, 1,
-0.06634205, 0.6039261, 0.1606313, 1, 0, 0, 1, 1,
-0.06268343, 0.9115164, -0.1480962, 1, 0, 0, 1, 1,
-0.06030722, -1.076051, -3.101003, 0, 0, 0, 1, 1,
-0.05859115, 0.7741918, -0.2593706, 0, 0, 0, 1, 1,
-0.0533383, 1.510049, -1.10243, 0, 0, 0, 1, 1,
-0.05286807, -0.9856974, -4.6911, 0, 0, 0, 1, 1,
-0.04907304, 1.925357, -0.354669, 0, 0, 0, 1, 1,
-0.04806524, -0.0856287, -1.708024, 0, 0, 0, 1, 1,
-0.04506462, -0.5982907, -2.420072, 0, 0, 0, 1, 1,
-0.04339711, 0.06308632, -1.612494, 1, 1, 1, 1, 1,
-0.04307586, -1.171949, -3.248928, 1, 1, 1, 1, 1,
-0.0424553, 1.161836, -1.464585, 1, 1, 1, 1, 1,
-0.03864052, 0.3528315, -0.6690232, 1, 1, 1, 1, 1,
-0.03796904, -0.2097349, -3.599891, 1, 1, 1, 1, 1,
-0.03706529, -1.494436, -3.335226, 1, 1, 1, 1, 1,
-0.03552915, -2.308873, -3.194873, 1, 1, 1, 1, 1,
-0.03050385, 1.647441, 0.3335075, 1, 1, 1, 1, 1,
-0.02759637, 0.06740144, -1.252687, 1, 1, 1, 1, 1,
-0.02325628, -1.311505, -3.696574, 1, 1, 1, 1, 1,
-0.02211413, -0.1328889, -4.286265, 1, 1, 1, 1, 1,
-0.0168288, -1.890047, -3.875623, 1, 1, 1, 1, 1,
-0.01575412, -0.6073773, -3.656202, 1, 1, 1, 1, 1,
-0.01272638, -0.160039, -3.17556, 1, 1, 1, 1, 1,
-0.01012801, -0.3750399, -2.816217, 1, 1, 1, 1, 1,
-0.009188258, -0.79395, -3.252002, 0, 0, 1, 1, 1,
-0.006883654, 1.198665, 1.21578, 1, 0, 0, 1, 1,
-0.006701415, -0.3021128, -3.326169, 1, 0, 0, 1, 1,
-0.00365028, 0.7495155, 0.5224039, 1, 0, 0, 1, 1,
-0.001738769, 0.4501806, 0.7608005, 1, 0, 0, 1, 1,
-0.001333781, -0.4633939, -2.883692, 1, 0, 0, 1, 1,
-0.0013104, -1.294809, -3.117974, 0, 0, 0, 1, 1,
0.007027764, -1.057221, 2.001559, 0, 0, 0, 1, 1,
0.009024037, -0.8863398, 3.219974, 0, 0, 0, 1, 1,
0.009857371, 0.6368468, -0.8912479, 0, 0, 0, 1, 1,
0.01060425, 0.04309754, -0.8127595, 0, 0, 0, 1, 1,
0.01305554, -0.4025754, 4.93885, 0, 0, 0, 1, 1,
0.01609136, -0.1553514, 2.067888, 0, 0, 0, 1, 1,
0.02036422, 1.164432, 0.2519276, 1, 1, 1, 1, 1,
0.02286651, -2.496145, 2.703508, 1, 1, 1, 1, 1,
0.02942854, 0.5143704, 2.89399, 1, 1, 1, 1, 1,
0.03550036, -1.787519, 4.339298, 1, 1, 1, 1, 1,
0.04158557, -1.365598, 3.233464, 1, 1, 1, 1, 1,
0.04288788, 1.476597, 0.05204884, 1, 1, 1, 1, 1,
0.04931124, 0.816007, 2.147373, 1, 1, 1, 1, 1,
0.04983367, -0.4430369, 3.057302, 1, 1, 1, 1, 1,
0.05156902, -1.370011, 3.687301, 1, 1, 1, 1, 1,
0.05451158, -0.5890426, 4.401674, 1, 1, 1, 1, 1,
0.05880499, -0.3719212, 2.079766, 1, 1, 1, 1, 1,
0.05913146, 0.1605165, 0.1544613, 1, 1, 1, 1, 1,
0.06336442, 2.380603, -0.7477587, 1, 1, 1, 1, 1,
0.06415533, -2.266564, 2.766822, 1, 1, 1, 1, 1,
0.07767998, -0.045288, 3.045688, 1, 1, 1, 1, 1,
0.08286405, -1.104628, 1.904866, 0, 0, 1, 1, 1,
0.08756666, 0.9923693, 1.183937, 1, 0, 0, 1, 1,
0.08850613, -0.4948682, 3.182294, 1, 0, 0, 1, 1,
0.09105039, 1.765227, 1.418366, 1, 0, 0, 1, 1,
0.09285425, 0.2110462, 0.837656, 1, 0, 0, 1, 1,
0.09624999, -0.490541, 4.337831, 1, 0, 0, 1, 1,
0.09631149, 0.848853, -0.2119952, 0, 0, 0, 1, 1,
0.1002785, 0.3895497, -0.247573, 0, 0, 0, 1, 1,
0.1022181, -1.454921, 3.987393, 0, 0, 0, 1, 1,
0.105643, 0.118383, -1.444375, 0, 0, 0, 1, 1,
0.1068976, 2.076465, -1.478384, 0, 0, 0, 1, 1,
0.1074344, 1.403516, 0.5256633, 0, 0, 0, 1, 1,
0.1080185, -0.1191029, 1.996544, 0, 0, 0, 1, 1,
0.1094013, -1.519737, 3.691488, 1, 1, 1, 1, 1,
0.1114885, 0.2390809, 1.011095, 1, 1, 1, 1, 1,
0.1142247, -1.20147, 3.834737, 1, 1, 1, 1, 1,
0.1150416, -2.144659, 1.77354, 1, 1, 1, 1, 1,
0.1207453, 1.34662, 1.070935, 1, 1, 1, 1, 1,
0.1224895, 1.16037, 0.9856368, 1, 1, 1, 1, 1,
0.1257028, -2.526623, 4.053673, 1, 1, 1, 1, 1,
0.127055, 0.8756369, 0.6151026, 1, 1, 1, 1, 1,
0.1273975, -0.9806835, 2.354996, 1, 1, 1, 1, 1,
0.1312741, -0.03050129, 2.294258, 1, 1, 1, 1, 1,
0.1321711, -0.6284704, 2.05328, 1, 1, 1, 1, 1,
0.1363297, -0.3125798, 2.704196, 1, 1, 1, 1, 1,
0.1463188, -0.9078124, 2.334581, 1, 1, 1, 1, 1,
0.151417, 0.3231396, 2.155232, 1, 1, 1, 1, 1,
0.152878, -0.01953189, 3.368955, 1, 1, 1, 1, 1,
0.1606324, -1.113518, 4.053457, 0, 0, 1, 1, 1,
0.1623627, 1.630571, -0.8304201, 1, 0, 0, 1, 1,
0.1631918, 0.8297142, -1.032801, 1, 0, 0, 1, 1,
0.1636467, 0.5475627, -2.390149, 1, 0, 0, 1, 1,
0.1677309, 0.9118009, 0.6831431, 1, 0, 0, 1, 1,
0.175835, -2.624131, 5.296276, 1, 0, 0, 1, 1,
0.1842469, 1.597415, 0.4985755, 0, 0, 0, 1, 1,
0.1843223, -0.6500781, 3.049191, 0, 0, 0, 1, 1,
0.1844951, -1.671209, 2.615595, 0, 0, 0, 1, 1,
0.1846323, -0.4210389, 2.767693, 0, 0, 0, 1, 1,
0.1846512, 0.5738283, 1.229714, 0, 0, 0, 1, 1,
0.1851767, 0.7276109, 1.854452, 0, 0, 0, 1, 1,
0.1858186, 1.141383, -0.5399151, 0, 0, 0, 1, 1,
0.1918951, -1.34538, 2.347064, 1, 1, 1, 1, 1,
0.1949524, -1.400556, 2.409831, 1, 1, 1, 1, 1,
0.195803, -0.9586961, 3.19187, 1, 1, 1, 1, 1,
0.1966319, -0.07812892, -1.760159, 1, 1, 1, 1, 1,
0.2007285, -1.276337, 2.125221, 1, 1, 1, 1, 1,
0.200802, 0.1079032, 2.5433, 1, 1, 1, 1, 1,
0.2061694, -0.7554544, 4.743032, 1, 1, 1, 1, 1,
0.2086821, 1.579297, -1.180552, 1, 1, 1, 1, 1,
0.2094702, 0.2256173, 0.2915301, 1, 1, 1, 1, 1,
0.2097367, -0.0187061, 1.994018, 1, 1, 1, 1, 1,
0.2103054, -1.286428, 3.237799, 1, 1, 1, 1, 1,
0.21084, 0.1648784, -1.304706, 1, 1, 1, 1, 1,
0.2116351, -1.421226, 3.008005, 1, 1, 1, 1, 1,
0.2149847, 0.7289852, -0.01149163, 1, 1, 1, 1, 1,
0.2158695, -0.1196676, 3.012848, 1, 1, 1, 1, 1,
0.2212457, 0.6030681, -0.3864955, 0, 0, 1, 1, 1,
0.2251335, 0.441278, -0.3003747, 1, 0, 0, 1, 1,
0.230285, 0.1942856, 0.1861407, 1, 0, 0, 1, 1,
0.2316933, 0.3248591, 1.767705, 1, 0, 0, 1, 1,
0.2368881, -1.254917, 3.310841, 1, 0, 0, 1, 1,
0.2374057, 0.414494, 1.276593, 1, 0, 0, 1, 1,
0.2374998, -1.133751, 2.412255, 0, 0, 0, 1, 1,
0.2398712, -1.104915, 2.388166, 0, 0, 0, 1, 1,
0.248594, 0.6364191, -0.1216358, 0, 0, 0, 1, 1,
0.2486302, -0.1324432, 1.500743, 0, 0, 0, 1, 1,
0.2488516, 0.08274771, 0.1225762, 0, 0, 0, 1, 1,
0.2503621, 1.215504, 2.98418, 0, 0, 0, 1, 1,
0.252788, -0.3182123, 4.048349, 0, 0, 0, 1, 1,
0.2543052, 0.9741817, -0.7184078, 1, 1, 1, 1, 1,
0.2564128, 0.3350907, 1.009023, 1, 1, 1, 1, 1,
0.2570424, 0.2003816, 2.141634, 1, 1, 1, 1, 1,
0.2580253, -0.9173937, 3.181127, 1, 1, 1, 1, 1,
0.2586941, 0.2690317, -0.2830643, 1, 1, 1, 1, 1,
0.258967, -1.298945, 2.878394, 1, 1, 1, 1, 1,
0.2592318, -0.5903798, 1.439453, 1, 1, 1, 1, 1,
0.2598798, -0.7419991, 1.99264, 1, 1, 1, 1, 1,
0.2660619, -1.858333, 3.664259, 1, 1, 1, 1, 1,
0.2666759, 2.311714, 0.2901544, 1, 1, 1, 1, 1,
0.2722723, -0.2010519, 3.249591, 1, 1, 1, 1, 1,
0.2730627, -1.67889, 2.834532, 1, 1, 1, 1, 1,
0.2758392, 0.2039905, 2.409812, 1, 1, 1, 1, 1,
0.2801589, 0.5579996, -1.392963, 1, 1, 1, 1, 1,
0.2802095, 0.6944203, 2.291397, 1, 1, 1, 1, 1,
0.2845914, 1.748228, 0.6836317, 0, 0, 1, 1, 1,
0.2863677, -0.4086924, 3.691372, 1, 0, 0, 1, 1,
0.2897933, -0.7584985, 2.746783, 1, 0, 0, 1, 1,
0.2940595, 2.053608, 1.047363, 1, 0, 0, 1, 1,
0.2963285, -0.1379761, 1.433766, 1, 0, 0, 1, 1,
0.296366, 0.4021811, 0.943877, 1, 0, 0, 1, 1,
0.2984042, 1.352067, 1.155136, 0, 0, 0, 1, 1,
0.3022273, -0.0942755, 1.688136, 0, 0, 0, 1, 1,
0.304831, -0.5228772, 3.925778, 0, 0, 0, 1, 1,
0.3086767, 0.2131726, 0.7045028, 0, 0, 0, 1, 1,
0.3086852, -1.145524, 1.977871, 0, 0, 0, 1, 1,
0.3248179, -0.09735753, 1.831885, 0, 0, 0, 1, 1,
0.3251934, 1.449494, 1.160975, 0, 0, 0, 1, 1,
0.3253202, 0.4288379, -0.6504073, 1, 1, 1, 1, 1,
0.3272362, 0.8881952, 0.2294419, 1, 1, 1, 1, 1,
0.3283978, 0.5375881, 0.7292346, 1, 1, 1, 1, 1,
0.3321506, -1.091836, 2.26512, 1, 1, 1, 1, 1,
0.3324995, -1.351369, 2.183863, 1, 1, 1, 1, 1,
0.3329776, 0.45824, 1.176313, 1, 1, 1, 1, 1,
0.3331867, 0.4634503, 2.15413, 1, 1, 1, 1, 1,
0.3395007, -0.5500717, 3.337652, 1, 1, 1, 1, 1,
0.3418393, 0.1481456, 2.173222, 1, 1, 1, 1, 1,
0.342363, -0.4656884, 2.620068, 1, 1, 1, 1, 1,
0.3429686, -0.003558361, 1.17952, 1, 1, 1, 1, 1,
0.3437071, -0.8726284, 2.9834, 1, 1, 1, 1, 1,
0.3440138, 0.776468, -0.3048891, 1, 1, 1, 1, 1,
0.3504353, 0.9186805, 0.2717869, 1, 1, 1, 1, 1,
0.3542498, 0.1014052, 2.035967, 1, 1, 1, 1, 1,
0.3558244, -0.5083015, 3.643832, 0, 0, 1, 1, 1,
0.3656374, 0.6387613, 1.59408, 1, 0, 0, 1, 1,
0.366222, -0.5660328, -0.1480176, 1, 0, 0, 1, 1,
0.3687756, -0.08010074, 1.358568, 1, 0, 0, 1, 1,
0.3716341, 1.250106, 0.0473556, 1, 0, 0, 1, 1,
0.373343, 0.6472824, -0.04999584, 1, 0, 0, 1, 1,
0.3737513, -0.02527523, 2.032758, 0, 0, 0, 1, 1,
0.3788696, 0.4961388, 0.3361209, 0, 0, 0, 1, 1,
0.3801978, 0.5804034, 1.706145, 0, 0, 0, 1, 1,
0.3812465, -0.6776535, 1.660113, 0, 0, 0, 1, 1,
0.3822324, 0.6770757, 0.0385114, 0, 0, 0, 1, 1,
0.3833225, -2.676327, 2.725609, 0, 0, 0, 1, 1,
0.3847239, 0.9068143, 1.017081, 0, 0, 0, 1, 1,
0.3886812, 1.386402, 1.02902, 1, 1, 1, 1, 1,
0.3916982, 1.09115, 0.285952, 1, 1, 1, 1, 1,
0.3980818, 2.233912, -0.1984586, 1, 1, 1, 1, 1,
0.3998654, 1.26264, 0.1224834, 1, 1, 1, 1, 1,
0.4024219, -0.5612873, 1.910987, 1, 1, 1, 1, 1,
0.4042982, 0.5356113, 2.285621, 1, 1, 1, 1, 1,
0.404301, 0.8055422, 0.16546, 1, 1, 1, 1, 1,
0.4043915, 0.3712231, 0.884427, 1, 1, 1, 1, 1,
0.4060382, 0.3319404, 0.02555814, 1, 1, 1, 1, 1,
0.4073038, 0.173056, 2.068628, 1, 1, 1, 1, 1,
0.4100418, 0.2059111, 2.031671, 1, 1, 1, 1, 1,
0.4177293, 0.2594275, -0.3289334, 1, 1, 1, 1, 1,
0.4177436, 1.552539, -0.2849786, 1, 1, 1, 1, 1,
0.4193546, -0.2975189, 3.294329, 1, 1, 1, 1, 1,
0.423876, -0.8983901, 2.000888, 1, 1, 1, 1, 1,
0.4265805, -0.2811545, 1.864467, 0, 0, 1, 1, 1,
0.4275296, -0.1937456, 1.50231, 1, 0, 0, 1, 1,
0.4282502, 2.105932, -0.8488555, 1, 0, 0, 1, 1,
0.4282604, -0.5303004, 2.547233, 1, 0, 0, 1, 1,
0.4316975, -1.692753, 2.724505, 1, 0, 0, 1, 1,
0.4324515, -0.2239992, 2.085746, 1, 0, 0, 1, 1,
0.4344892, 0.9277806, 0.2040919, 0, 0, 0, 1, 1,
0.4351113, 0.812595, 0.605642, 0, 0, 0, 1, 1,
0.4357311, 0.5485116, 0.6326925, 0, 0, 0, 1, 1,
0.4368771, 0.7420676, 1.450914, 0, 0, 0, 1, 1,
0.4381922, 1.883615, 1.158281, 0, 0, 0, 1, 1,
0.4385019, 1.587977, 1.258645, 0, 0, 0, 1, 1,
0.4398225, -0.6775079, 2.596097, 0, 0, 0, 1, 1,
0.4416599, -0.3654088, 4.406374, 1, 1, 1, 1, 1,
0.4429456, -0.1927838, 2.812637, 1, 1, 1, 1, 1,
0.4436978, -1.528241, 2.999201, 1, 1, 1, 1, 1,
0.4468045, 0.5334767, 4.677426, 1, 1, 1, 1, 1,
0.4478835, -0.8564938, 2.039876, 1, 1, 1, 1, 1,
0.4492015, -0.7770428, 1.515006, 1, 1, 1, 1, 1,
0.4517975, 0.6613821, 0.5391406, 1, 1, 1, 1, 1,
0.4545072, -0.4334433, 2.21598, 1, 1, 1, 1, 1,
0.4552631, -1.152583, 4.049827, 1, 1, 1, 1, 1,
0.4566778, -0.5816332, 2.07309, 1, 1, 1, 1, 1,
0.4588614, 1.053672, 1.273258, 1, 1, 1, 1, 1,
0.4599751, -0.2552658, 2.222162, 1, 1, 1, 1, 1,
0.4634415, 0.3961869, 1.839675, 1, 1, 1, 1, 1,
0.4637201, 0.1033878, -0.03133939, 1, 1, 1, 1, 1,
0.4654858, -0.02826931, 2.177204, 1, 1, 1, 1, 1,
0.4666421, -1.744193, 2.564795, 0, 0, 1, 1, 1,
0.4743043, 0.7227092, 1.809401, 1, 0, 0, 1, 1,
0.4744174, -1.649357, 2.460147, 1, 0, 0, 1, 1,
0.4759689, -1.140734, 4.212891, 1, 0, 0, 1, 1,
0.4760302, -1.007821, 2.779718, 1, 0, 0, 1, 1,
0.4811271, 0.5615808, -0.1709569, 1, 0, 0, 1, 1,
0.4812117, 3.20898, -0.05646757, 0, 0, 0, 1, 1,
0.4829553, -0.4010743, 1.967624, 0, 0, 0, 1, 1,
0.4850641, -0.0719957, 1.526758, 0, 0, 0, 1, 1,
0.4878953, -0.2018642, 3.374358, 0, 0, 0, 1, 1,
0.4894178, 0.635287, 0.4369607, 0, 0, 0, 1, 1,
0.5070248, -0.4244683, 2.501857, 0, 0, 0, 1, 1,
0.5075797, -1.225032, 5.444175, 0, 0, 0, 1, 1,
0.5097893, -2.235533, 3.906854, 1, 1, 1, 1, 1,
0.5170023, 0.7536845, -0.3392694, 1, 1, 1, 1, 1,
0.5198854, -1.018352, 2.809081, 1, 1, 1, 1, 1,
0.5202893, 0.376233, 1.31668, 1, 1, 1, 1, 1,
0.5237938, 1.570838, 1.640154, 1, 1, 1, 1, 1,
0.524681, 0.1851099, 1.93139, 1, 1, 1, 1, 1,
0.5284221, -1.170029, 2.277918, 1, 1, 1, 1, 1,
0.5309401, -0.4213093, 2.004594, 1, 1, 1, 1, 1,
0.531266, -2.593968, 1.553651, 1, 1, 1, 1, 1,
0.5348159, 0.7195876, 0.8145624, 1, 1, 1, 1, 1,
0.5365121, 0.4038778, -0.9851252, 1, 1, 1, 1, 1,
0.5506095, 1.311241, 0.3647092, 1, 1, 1, 1, 1,
0.5522749, -0.4500988, 3.012423, 1, 1, 1, 1, 1,
0.5562057, 0.3357716, 1.775314, 1, 1, 1, 1, 1,
0.5596172, 0.09214033, -0.4716014, 1, 1, 1, 1, 1,
0.5604029, -1.037007, 1.492222, 0, 0, 1, 1, 1,
0.5624939, -0.02164371, 1.459547, 1, 0, 0, 1, 1,
0.5646232, 1.431545, 0.3033129, 1, 0, 0, 1, 1,
0.5651541, 0.3996368, 0.1528078, 1, 0, 0, 1, 1,
0.5679181, 1.946762, -0.4127528, 1, 0, 0, 1, 1,
0.5734361, -0.1207208, 0.6202993, 1, 0, 0, 1, 1,
0.5771427, -0.1814638, 2.079375, 0, 0, 0, 1, 1,
0.5775387, 0.4414887, 0.931549, 0, 0, 0, 1, 1,
0.5783165, 0.0004439412, 1.012412, 0, 0, 0, 1, 1,
0.5790366, 0.1435836, 2.922309, 0, 0, 0, 1, 1,
0.5828506, 0.129787, 0.6438913, 0, 0, 0, 1, 1,
0.58413, 0.3772631, 0.3263129, 0, 0, 0, 1, 1,
0.585367, 2.119701, 0.7520836, 0, 0, 0, 1, 1,
0.588204, -1.030021, 3.545418, 1, 1, 1, 1, 1,
0.5911648, -0.3937284, 4.312215, 1, 1, 1, 1, 1,
0.5927845, -0.2319369, -1.465097, 1, 1, 1, 1, 1,
0.5966164, 0.5837047, 1.090166, 1, 1, 1, 1, 1,
0.5979599, 0.3431047, 1.17067, 1, 1, 1, 1, 1,
0.6012725, -0.378164, 4.873804, 1, 1, 1, 1, 1,
0.601283, 1.410305, -0.6238177, 1, 1, 1, 1, 1,
0.6018784, 1.723486, 0.698137, 1, 1, 1, 1, 1,
0.6132987, -0.5155748, 1.551234, 1, 1, 1, 1, 1,
0.6146608, 0.7725472, 0.4139636, 1, 1, 1, 1, 1,
0.6147272, -2.167011, 2.599483, 1, 1, 1, 1, 1,
0.6217855, 1.479333, -0.1182195, 1, 1, 1, 1, 1,
0.6268082, -0.7994701, 1.621588, 1, 1, 1, 1, 1,
0.6286646, 0.8881987, 1.175896, 1, 1, 1, 1, 1,
0.6298589, 0.08268486, 2.924179, 1, 1, 1, 1, 1,
0.6325771, 1.039528, 2.16974, 0, 0, 1, 1, 1,
0.6338799, 2.153761, 1.627633, 1, 0, 0, 1, 1,
0.6342691, -0.7728934, 1.03173, 1, 0, 0, 1, 1,
0.6372041, -0.8842235, 0.988096, 1, 0, 0, 1, 1,
0.6389604, 0.04388828, 0.03753881, 1, 0, 0, 1, 1,
0.6422344, -0.9272283, 2.602915, 1, 0, 0, 1, 1,
0.6621246, -1.322025, 2.856886, 0, 0, 0, 1, 1,
0.6636363, 0.5766246, 0.4829813, 0, 0, 0, 1, 1,
0.6762076, 0.7893924, 0.6160303, 0, 0, 0, 1, 1,
0.6768386, -0.7245716, 3.016651, 0, 0, 0, 1, 1,
0.6870194, -0.213204, 2.619464, 0, 0, 0, 1, 1,
0.6920195, -0.5958572, 2.954471, 0, 0, 0, 1, 1,
0.6927326, 0.5818934, 1.812885, 0, 0, 0, 1, 1,
0.6952307, 0.926992, 1.218852, 1, 1, 1, 1, 1,
0.6977322, 0.302946, -0.4366281, 1, 1, 1, 1, 1,
0.7007229, -1.441027, 3.312086, 1, 1, 1, 1, 1,
0.7031804, -1.071129, 1.849296, 1, 1, 1, 1, 1,
0.7089055, 0.02428015, 2.459856, 1, 1, 1, 1, 1,
0.7137277, -0.3864718, 3.562899, 1, 1, 1, 1, 1,
0.7141339, 0.2190055, 0.5540594, 1, 1, 1, 1, 1,
0.7144631, 0.3250429, 0.681288, 1, 1, 1, 1, 1,
0.7145244, -0.3844067, 1.868074, 1, 1, 1, 1, 1,
0.7153023, 0.9204959, 0.7009968, 1, 1, 1, 1, 1,
0.7209606, 0.7609786, 0.5201157, 1, 1, 1, 1, 1,
0.7231454, 0.318898, 1.30826, 1, 1, 1, 1, 1,
0.7339132, 1.600371, -0.1691557, 1, 1, 1, 1, 1,
0.7369566, 1.034145, -0.6928862, 1, 1, 1, 1, 1,
0.7405878, -1.48267, 1.587857, 1, 1, 1, 1, 1,
0.741403, 1.254093, -0.4745439, 0, 0, 1, 1, 1,
0.7433017, -0.8411488, 3.954275, 1, 0, 0, 1, 1,
0.7517227, -0.7092471, 1.483813, 1, 0, 0, 1, 1,
0.7586501, -0.6906116, 0.8643698, 1, 0, 0, 1, 1,
0.7590466, -0.4458142, 2.779021, 1, 0, 0, 1, 1,
0.7601011, 0.7205406, 1.176772, 1, 0, 0, 1, 1,
0.7634481, -0.6889172, 2.158936, 0, 0, 0, 1, 1,
0.7661221, -0.6555677, 2.397211, 0, 0, 0, 1, 1,
0.7662495, 1.028132, 0.7459915, 0, 0, 0, 1, 1,
0.7688507, 0.4839476, 0.1284752, 0, 0, 0, 1, 1,
0.7753834, 1.947159, -1.160287, 0, 0, 0, 1, 1,
0.7754465, -1.785286, 3.002137, 0, 0, 0, 1, 1,
0.7763368, 1.475392, -0.7913784, 0, 0, 0, 1, 1,
0.7763798, 0.894036, 0.2024594, 1, 1, 1, 1, 1,
0.7779036, 1.572394, 3.168119, 1, 1, 1, 1, 1,
0.7793576, -1.288717, 1.425896, 1, 1, 1, 1, 1,
0.7797998, 0.8115001, 1.368102, 1, 1, 1, 1, 1,
0.7831546, 0.05826398, 1.475214, 1, 1, 1, 1, 1,
0.7857134, 0.7591044, -0.1159191, 1, 1, 1, 1, 1,
0.7857649, -0.3480141, 0.7624143, 1, 1, 1, 1, 1,
0.8044567, -0.3028065, -0.1991073, 1, 1, 1, 1, 1,
0.8050676, 0.2802447, -0.06846105, 1, 1, 1, 1, 1,
0.8096855, 1.167878, 0.8912275, 1, 1, 1, 1, 1,
0.8137954, 1.037728, -1.067664, 1, 1, 1, 1, 1,
0.8160287, -0.9841828, 3.404214, 1, 1, 1, 1, 1,
0.8189023, -0.7415142, 1.551542, 1, 1, 1, 1, 1,
0.8238944, 0.255994, -0.143461, 1, 1, 1, 1, 1,
0.8239676, -1.499471, 2.964285, 1, 1, 1, 1, 1,
0.8257959, -0.6367334, 4.05449, 0, 0, 1, 1, 1,
0.8261561, -0.3744824, 2.869817, 1, 0, 0, 1, 1,
0.8276104, 1.083561, 2.086078, 1, 0, 0, 1, 1,
0.8281153, -0.4030307, 3.860341, 1, 0, 0, 1, 1,
0.8322431, 0.1113528, 2.027159, 1, 0, 0, 1, 1,
0.8402312, 1.031376, 0.06070522, 1, 0, 0, 1, 1,
0.8459765, 0.5461947, 1.375747, 0, 0, 0, 1, 1,
0.8464345, -0.200181, 2.363154, 0, 0, 0, 1, 1,
0.849237, 0.1651887, 2.309192, 0, 0, 0, 1, 1,
0.8513302, 0.5210092, -1.445635, 0, 0, 0, 1, 1,
0.8564095, -1.154482, 3.625056, 0, 0, 0, 1, 1,
0.8578467, 0.4894562, 1.515592, 0, 0, 0, 1, 1,
0.8608632, 0.8916023, 0.8120586, 0, 0, 0, 1, 1,
0.861027, -0.6298301, 3.661193, 1, 1, 1, 1, 1,
0.8724521, -0.8263988, 1.693629, 1, 1, 1, 1, 1,
0.8792179, -1.348681, 1.401413, 1, 1, 1, 1, 1,
0.8800798, -0.7634372, 0.8632621, 1, 1, 1, 1, 1,
0.882893, 2.067065, 0.1278166, 1, 1, 1, 1, 1,
0.8830059, 0.5851376, 0.2095538, 1, 1, 1, 1, 1,
0.8859159, -0.02214343, 0.7595171, 1, 1, 1, 1, 1,
0.88669, -1.165323, 1.429857, 1, 1, 1, 1, 1,
0.8883923, 0.2452303, 0.8937079, 1, 1, 1, 1, 1,
0.8913063, -0.9668674, 2.080223, 1, 1, 1, 1, 1,
0.8917146, -0.06582905, 1.515386, 1, 1, 1, 1, 1,
0.8930857, 1.182279, 1.219787, 1, 1, 1, 1, 1,
0.8948326, 1.848198, 0.3776188, 1, 1, 1, 1, 1,
0.8965546, -0.4540283, 0.7384466, 1, 1, 1, 1, 1,
0.9065209, 0.4502572, 2.054557, 1, 1, 1, 1, 1,
0.9122238, 1.282865, 1.008653, 0, 0, 1, 1, 1,
0.9138228, 0.378087, 1.659964, 1, 0, 0, 1, 1,
0.9154613, -0.4347091, 2.17749, 1, 0, 0, 1, 1,
0.9226866, 1.28655, 0.7405173, 1, 0, 0, 1, 1,
0.9237484, 0.2846632, 1.309086, 1, 0, 0, 1, 1,
0.9258942, 0.4413436, 0.03240732, 1, 0, 0, 1, 1,
0.9381343, 2.228344, 1.163046, 0, 0, 0, 1, 1,
0.9464607, -1.768825, 2.566199, 0, 0, 0, 1, 1,
0.9478136, 0.7960476, 0.5057973, 0, 0, 0, 1, 1,
0.9532407, 1.791353, -0.3999227, 0, 0, 0, 1, 1,
0.957958, -2.118998, 3.217131, 0, 0, 0, 1, 1,
0.9621414, 1.338308, 0.9095981, 0, 0, 0, 1, 1,
0.962835, -1.480543, 3.170089, 0, 0, 0, 1, 1,
0.9649267, -0.4953677, 2.954521, 1, 1, 1, 1, 1,
0.9701546, -0.06457365, 0.6163625, 1, 1, 1, 1, 1,
0.9812071, 0.9370703, 0.4731632, 1, 1, 1, 1, 1,
0.9851051, -1.159165, 4.452672, 1, 1, 1, 1, 1,
1.00706, 0.6215805, -0.4492556, 1, 1, 1, 1, 1,
1.01207, 0.5933001, 0.7323284, 1, 1, 1, 1, 1,
1.016354, -0.2037227, 2.49535, 1, 1, 1, 1, 1,
1.018987, -0.1526529, 2.25743, 1, 1, 1, 1, 1,
1.02295, 0.6827233, 1.769651, 1, 1, 1, 1, 1,
1.024163, 0.5111101, 1.661526, 1, 1, 1, 1, 1,
1.024271, 0.9556392, 0.1591635, 1, 1, 1, 1, 1,
1.030639, 0.1120168, 0.330812, 1, 1, 1, 1, 1,
1.040012, -1.113191, 1.159195, 1, 1, 1, 1, 1,
1.040173, 0.6626741, 1.032851, 1, 1, 1, 1, 1,
1.042033, 0.9576291, 0.837622, 1, 1, 1, 1, 1,
1.049556, -0.3281288, 1.740773, 0, 0, 1, 1, 1,
1.056075, 0.5365489, 0.382772, 1, 0, 0, 1, 1,
1.071892, -1.248278, 2.000705, 1, 0, 0, 1, 1,
1.092499, -0.8487054, 2.23459, 1, 0, 0, 1, 1,
1.094933, -1.046283, 0.6647246, 1, 0, 0, 1, 1,
1.099163, -0.1032022, 2.462283, 1, 0, 0, 1, 1,
1.110088, -1.050375, 2.742054, 0, 0, 0, 1, 1,
1.116055, -0.1534744, 0.5506247, 0, 0, 0, 1, 1,
1.118724, -2.495878, 1.502359, 0, 0, 0, 1, 1,
1.125075, -0.6149409, 2.593343, 0, 0, 0, 1, 1,
1.135458, 1.156406, 1.67969, 0, 0, 0, 1, 1,
1.13567, -1.1897, 1.978493, 0, 0, 0, 1, 1,
1.137389, 0.4845429, 1.492469, 0, 0, 0, 1, 1,
1.144327, 1.100597, -0.06152881, 1, 1, 1, 1, 1,
1.149507, -1.865503, 2.473688, 1, 1, 1, 1, 1,
1.150065, -0.7961228, 1.091749, 1, 1, 1, 1, 1,
1.159671, 1.008541, 0.2376841, 1, 1, 1, 1, 1,
1.165403, -0.3749268, 1.970463, 1, 1, 1, 1, 1,
1.188246, 0.2709255, 0.7424889, 1, 1, 1, 1, 1,
1.190937, -0.6919806, 1.505397, 1, 1, 1, 1, 1,
1.192781, 1.734242, 1.43948, 1, 1, 1, 1, 1,
1.21149, 0.7136389, 0.5991206, 1, 1, 1, 1, 1,
1.212523, -1.59642, 1.313271, 1, 1, 1, 1, 1,
1.212867, -1.013955, 1.32171, 1, 1, 1, 1, 1,
1.226048, 1.143031, -0.2179871, 1, 1, 1, 1, 1,
1.227297, -0.8038009, 1.796505, 1, 1, 1, 1, 1,
1.230006, 0.1345967, 2.001939, 1, 1, 1, 1, 1,
1.231764, -0.1488644, 1.292531, 1, 1, 1, 1, 1,
1.233862, -0.7560072, 1.336497, 0, 0, 1, 1, 1,
1.241559, 1.043643, 0.9961101, 1, 0, 0, 1, 1,
1.244387, 0.5275789, 1.316082, 1, 0, 0, 1, 1,
1.249724, 1.11856, 0.08007416, 1, 0, 0, 1, 1,
1.250274, -1.109797, 1.107503, 1, 0, 0, 1, 1,
1.255357, 1.245693, 1.180474, 1, 0, 0, 1, 1,
1.25603, -0.261456, 1.973079, 0, 0, 0, 1, 1,
1.260892, 0.06186722, 1.128973, 0, 0, 0, 1, 1,
1.261034, 1.905471, 0.03653729, 0, 0, 0, 1, 1,
1.271238, 1.026342, 1.303756, 0, 0, 0, 1, 1,
1.295843, -1.422342, 2.36559, 0, 0, 0, 1, 1,
1.297138, -1.444489, -0.6099911, 0, 0, 0, 1, 1,
1.301364, -0.09945592, 2.829286, 0, 0, 0, 1, 1,
1.302819, -0.001647873, 1.075469, 1, 1, 1, 1, 1,
1.304121, -0.2912941, 0.1352252, 1, 1, 1, 1, 1,
1.305677, 0.7591975, 0.8002943, 1, 1, 1, 1, 1,
1.308106, -1.655581, 2.905536, 1, 1, 1, 1, 1,
1.311543, -2.887703, 1.79857, 1, 1, 1, 1, 1,
1.323629, -0.204844, 1.550463, 1, 1, 1, 1, 1,
1.336084, -0.4354059, 3.974857, 1, 1, 1, 1, 1,
1.344383, -0.76802, 1.204229, 1, 1, 1, 1, 1,
1.344594, 0.7093186, 1.269885, 1, 1, 1, 1, 1,
1.349569, 0.5389965, -1.422179, 1, 1, 1, 1, 1,
1.352418, -0.4620779, 2.192568, 1, 1, 1, 1, 1,
1.362935, 0.8625407, 1.997625, 1, 1, 1, 1, 1,
1.367897, -0.2323951, 0.570416, 1, 1, 1, 1, 1,
1.392415, 1.367531, 1.84638, 1, 1, 1, 1, 1,
1.408526, 1.853674, 1.043617, 1, 1, 1, 1, 1,
1.418349, 0.339813, 0.9453954, 0, 0, 1, 1, 1,
1.420386, -0.5983188, 0.2755369, 1, 0, 0, 1, 1,
1.433411, 0.08072779, 0.52807, 1, 0, 0, 1, 1,
1.439133, -0.4800013, 1.048842, 1, 0, 0, 1, 1,
1.445194, 0.5571672, 3.307419, 1, 0, 0, 1, 1,
1.447073, -0.04559071, -0.3164373, 1, 0, 0, 1, 1,
1.45564, 0.4890749, 0.1040442, 0, 0, 0, 1, 1,
1.459168, -1.062965, 2.22139, 0, 0, 0, 1, 1,
1.47663, 0.4299454, 0.9696833, 0, 0, 0, 1, 1,
1.483951, -0.600673, 1.826545, 0, 0, 0, 1, 1,
1.48622, 0.5292514, 3.103575, 0, 0, 0, 1, 1,
1.497419, 0.5437195, 2.203254, 0, 0, 0, 1, 1,
1.50436, -1.073848, 4.127472, 0, 0, 0, 1, 1,
1.504652, 1.371447, 1.692649, 1, 1, 1, 1, 1,
1.529547, 0.30404, 0.5539203, 1, 1, 1, 1, 1,
1.53581, 0.5063429, 0.1876844, 1, 1, 1, 1, 1,
1.540596, 1.318629, 0.3873398, 1, 1, 1, 1, 1,
1.542185, -1.206254, 2.169583, 1, 1, 1, 1, 1,
1.544425, 0.2140983, 0.4483534, 1, 1, 1, 1, 1,
1.557646, -0.8723772, 0.9999936, 1, 1, 1, 1, 1,
1.573404, -0.9077751, 1.623819, 1, 1, 1, 1, 1,
1.574494, 1.092697, 1.055635, 1, 1, 1, 1, 1,
1.590894, 0.409546, 2.404885, 1, 1, 1, 1, 1,
1.592841, 0.8088895, -1.605364, 1, 1, 1, 1, 1,
1.596938, 0.9788204, -0.3994677, 1, 1, 1, 1, 1,
1.612574, -0.3769238, 0.3860657, 1, 1, 1, 1, 1,
1.640665, -0.6171536, 2.542934, 1, 1, 1, 1, 1,
1.669727, 0.3084802, 1.400833, 1, 1, 1, 1, 1,
1.671183, -1.887636, 1.940433, 0, 0, 1, 1, 1,
1.674582, 1.408082, 0.8772654, 1, 0, 0, 1, 1,
1.678496, -0.6392282, 0.6571337, 1, 0, 0, 1, 1,
1.690599, -1.505568, 2.619596, 1, 0, 0, 1, 1,
1.699774, -0.7130874, 1.644345, 1, 0, 0, 1, 1,
1.709687, 2.189919, 0.7078623, 1, 0, 0, 1, 1,
1.722984, 0.1464747, 1.219274, 0, 0, 0, 1, 1,
1.746511, 1.143397, -0.6517619, 0, 0, 0, 1, 1,
1.748711, 1.189936, 0.8615128, 0, 0, 0, 1, 1,
1.74937, -0.1707243, 0.3377548, 0, 0, 0, 1, 1,
1.764416, -0.1120007, -0.09060225, 0, 0, 0, 1, 1,
1.776705, -0.1770682, 2.37559, 0, 0, 0, 1, 1,
1.785319, -0.04381333, 0.8003556, 0, 0, 0, 1, 1,
1.823186, 1.035403, 0.3431969, 1, 1, 1, 1, 1,
1.825385, 0.5339852, 2.943238, 1, 1, 1, 1, 1,
1.826612, 0.8946166, 0.1444358, 1, 1, 1, 1, 1,
1.860212, -0.4754313, 4.982744, 1, 1, 1, 1, 1,
1.868117, 0.01435582, 0.8493322, 1, 1, 1, 1, 1,
1.869375, 0.1027807, 0.9205118, 1, 1, 1, 1, 1,
1.880488, 1.273139, 1.338941, 1, 1, 1, 1, 1,
1.964256, -0.100759, 1.020826, 1, 1, 1, 1, 1,
1.967484, 0.3083054, -0.3252558, 1, 1, 1, 1, 1,
1.985708, -0.5850203, 2.463755, 1, 1, 1, 1, 1,
2.001574, -0.43811, 2.420752, 1, 1, 1, 1, 1,
2.023894, 1.495608, 1.7674, 1, 1, 1, 1, 1,
2.046438, -0.2476475, 3.094968, 1, 1, 1, 1, 1,
2.064501, -0.6477244, 0.9583305, 1, 1, 1, 1, 1,
2.090021, 0.1565182, 0.3872053, 1, 1, 1, 1, 1,
2.161474, 0.9012862, 2.772331, 0, 0, 1, 1, 1,
2.205742, 0.1035282, 1.116291, 1, 0, 0, 1, 1,
2.219957, -0.6543083, 1.417704, 1, 0, 0, 1, 1,
2.249592, 0.9683394, 0.04278856, 1, 0, 0, 1, 1,
2.270327, 0.8744696, 2.303712, 1, 0, 0, 1, 1,
2.287515, 1.407543, 0.347092, 1, 0, 0, 1, 1,
2.294595, -0.903721, 1.931943, 0, 0, 0, 1, 1,
2.306685, 0.7219383, 1.092623, 0, 0, 0, 1, 1,
2.338267, -0.8182485, 1.716167, 0, 0, 0, 1, 1,
2.358591, 1.105178, 2.11775, 0, 0, 0, 1, 1,
2.398278, 1.187938, 1.214003, 0, 0, 0, 1, 1,
2.477536, -0.6649154, 2.831591, 0, 0, 0, 1, 1,
2.481925, 0.8874784, 1.527274, 0, 0, 0, 1, 1,
2.491689, 0.03243613, 0.8500521, 1, 1, 1, 1, 1,
2.550694, 0.3557433, 3.638635, 1, 1, 1, 1, 1,
2.585546, 0.4486473, 1.565627, 1, 1, 1, 1, 1,
2.659024, 0.3073082, 2.064684, 1, 1, 1, 1, 1,
2.688468, -0.08944947, 1.245494, 1, 1, 1, 1, 1,
3.031708, -0.05822569, 1.195173, 1, 1, 1, 1, 1,
3.070143, 0.2941786, 1.304172, 1, 1, 1, 1, 1
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
var radius = 9.533603;
var distance = 33.48638;
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
mvMatrix.translate( 0.1464736, -0.04842615, -0.117619 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48638);
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
