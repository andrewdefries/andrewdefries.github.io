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
-3.3924, -2.575587, -3.367718, 1, 0, 0, 1,
-3.057438, 1.688819, -0.5338687, 1, 0.007843138, 0, 1,
-2.745132, -0.6233019, -1.256197, 1, 0.01176471, 0, 1,
-2.744194, -2.649945, -2.297632, 1, 0.01960784, 0, 1,
-2.740545, 0.3844801, -2.824249, 1, 0.02352941, 0, 1,
-2.545675, 0.9082243, -2.606519, 1, 0.03137255, 0, 1,
-2.537731, 0.01927719, -2.493971, 1, 0.03529412, 0, 1,
-2.457808, 0.7979657, 0.6233653, 1, 0.04313726, 0, 1,
-2.457241, -1.86977, -3.025012, 1, 0.04705882, 0, 1,
-2.409181, -0.05098251, -1.245407, 1, 0.05490196, 0, 1,
-2.381461, 0.1772172, -1.83418, 1, 0.05882353, 0, 1,
-2.261057, -1.226848, -2.627476, 1, 0.06666667, 0, 1,
-2.239987, -0.2426644, -1.98841, 1, 0.07058824, 0, 1,
-2.225722, 1.265121, -3.025915, 1, 0.07843138, 0, 1,
-2.221989, 0.4948742, -0.6104565, 1, 0.08235294, 0, 1,
-2.217649, 0.4587867, -2.91624, 1, 0.09019608, 0, 1,
-2.130792, -1.026893, -1.417832, 1, 0.09411765, 0, 1,
-2.121354, 0.9205484, -2.24871, 1, 0.1019608, 0, 1,
-2.12058, -0.9592668, -3.004196, 1, 0.1098039, 0, 1,
-2.112678, 0.5218965, -0.9031634, 1, 0.1137255, 0, 1,
-2.079716, 0.9830716, -0.1082133, 1, 0.1215686, 0, 1,
-2.052193, -0.5241809, -2.573097, 1, 0.1254902, 0, 1,
-2.009325, -0.08013457, -1.630716, 1, 0.1333333, 0, 1,
-1.994523, 0.6797121, 0.09887804, 1, 0.1372549, 0, 1,
-1.938183, -0.3336193, -2.513085, 1, 0.145098, 0, 1,
-1.907815, -0.541641, -2.85215, 1, 0.1490196, 0, 1,
-1.902934, 0.894935, -1.185432, 1, 0.1568628, 0, 1,
-1.891209, 0.07448579, -1.709186, 1, 0.1607843, 0, 1,
-1.890752, 0.06205309, -0.9622118, 1, 0.1686275, 0, 1,
-1.864785, -0.6120908, -1.111038, 1, 0.172549, 0, 1,
-1.847988, -0.08546677, -2.058525, 1, 0.1803922, 0, 1,
-1.836098, 1.242575, 0.5734538, 1, 0.1843137, 0, 1,
-1.831007, 0.1552142, -0.7179906, 1, 0.1921569, 0, 1,
-1.811932, 0.8244299, 0.2216014, 1, 0.1960784, 0, 1,
-1.803528, 1.284451, -0.3169719, 1, 0.2039216, 0, 1,
-1.802171, 1.07501, -1.922089, 1, 0.2117647, 0, 1,
-1.795993, 0.4768353, -0.900767, 1, 0.2156863, 0, 1,
-1.795062, 0.1551367, -0.7617263, 1, 0.2235294, 0, 1,
-1.765657, 0.06764208, -0.528551, 1, 0.227451, 0, 1,
-1.747256, -0.487262, 0.2723376, 1, 0.2352941, 0, 1,
-1.742508, 1.258045, -1.223725, 1, 0.2392157, 0, 1,
-1.740234, 0.5255222, -1.356593, 1, 0.2470588, 0, 1,
-1.732868, -0.6813554, -1.349579, 1, 0.2509804, 0, 1,
-1.722119, 0.5136482, -0.4642589, 1, 0.2588235, 0, 1,
-1.712126, 1.101222, -1.791168, 1, 0.2627451, 0, 1,
-1.711282, -0.4882973, -1.229827, 1, 0.2705882, 0, 1,
-1.707647, -1.5602, -3.578414, 1, 0.2745098, 0, 1,
-1.684511, -1.86142, -3.139922, 1, 0.282353, 0, 1,
-1.664199, 0.9211748, 0.07348381, 1, 0.2862745, 0, 1,
-1.659518, -0.08950476, -0.5500727, 1, 0.2941177, 0, 1,
-1.655489, -0.5819554, -2.406238, 1, 0.3019608, 0, 1,
-1.652195, -0.5062836, -1.500068, 1, 0.3058824, 0, 1,
-1.606867, 0.415544, -1.604837, 1, 0.3137255, 0, 1,
-1.581123, 0.3107977, 0.1406984, 1, 0.3176471, 0, 1,
-1.562814, 0.6961497, -0.667637, 1, 0.3254902, 0, 1,
-1.560445, 1.091743, -1.881865, 1, 0.3294118, 0, 1,
-1.550158, 0.5073295, -1.668016, 1, 0.3372549, 0, 1,
-1.538662, 0.2533789, -0.8852783, 1, 0.3411765, 0, 1,
-1.530393, -0.3516193, -1.860871, 1, 0.3490196, 0, 1,
-1.529036, 1.107714, -3.038752, 1, 0.3529412, 0, 1,
-1.520672, 1.750685, -2.361246, 1, 0.3607843, 0, 1,
-1.495814, 0.2770785, -1.718957, 1, 0.3647059, 0, 1,
-1.489766, -0.386289, -0.3462279, 1, 0.372549, 0, 1,
-1.473247, 0.1284228, -1.361383, 1, 0.3764706, 0, 1,
-1.468883, 0.1402193, -0.6368576, 1, 0.3843137, 0, 1,
-1.468083, -0.4835743, -4.096328, 1, 0.3882353, 0, 1,
-1.462809, -0.6322385, -1.495422, 1, 0.3960784, 0, 1,
-1.462264, -1.079261, -4.032931, 1, 0.4039216, 0, 1,
-1.458818, 0.0353932, -1.810361, 1, 0.4078431, 0, 1,
-1.4513, 1.347685, -0.3153401, 1, 0.4156863, 0, 1,
-1.449518, 0.7538489, -1.69785, 1, 0.4196078, 0, 1,
-1.422878, -0.8633723, -2.047348, 1, 0.427451, 0, 1,
-1.402323, 0.2614445, -1.854125, 1, 0.4313726, 0, 1,
-1.393584, -1.282878, -3.114208, 1, 0.4392157, 0, 1,
-1.39171, 0.03731918, -2.220331, 1, 0.4431373, 0, 1,
-1.389311, 0.1381852, -0.6769756, 1, 0.4509804, 0, 1,
-1.37443, 0.4476378, -2.056762, 1, 0.454902, 0, 1,
-1.371455, -2.256639, -2.251996, 1, 0.4627451, 0, 1,
-1.370665, -0.4476565, -1.586637, 1, 0.4666667, 0, 1,
-1.367697, -1.044088, -0.921656, 1, 0.4745098, 0, 1,
-1.35595, 0.3270843, -4.042544, 1, 0.4784314, 0, 1,
-1.355851, 1.063702, -1.756836, 1, 0.4862745, 0, 1,
-1.348328, -0.5612193, -0.3037892, 1, 0.4901961, 0, 1,
-1.34699, 0.5542248, -0.5696672, 1, 0.4980392, 0, 1,
-1.342597, -0.08125929, 0.4987127, 1, 0.5058824, 0, 1,
-1.336151, -1.114643, -2.160502, 1, 0.509804, 0, 1,
-1.329516, 0.1682379, -0.5182902, 1, 0.5176471, 0, 1,
-1.322064, -0.1458042, -2.503759, 1, 0.5215687, 0, 1,
-1.319838, -1.353228, -1.149795, 1, 0.5294118, 0, 1,
-1.316701, 0.2821714, -0.4142304, 1, 0.5333334, 0, 1,
-1.307546, -0.3563522, -1.745106, 1, 0.5411765, 0, 1,
-1.30693, -1.379501, -3.95021, 1, 0.5450981, 0, 1,
-1.297067, -0.8139029, -2.809711, 1, 0.5529412, 0, 1,
-1.289214, 1.704873, -0.6194721, 1, 0.5568628, 0, 1,
-1.287281, 1.010768, -0.08691208, 1, 0.5647059, 0, 1,
-1.283502, 0.09342109, -0.2234583, 1, 0.5686275, 0, 1,
-1.273269, -1.205314, -2.025111, 1, 0.5764706, 0, 1,
-1.265084, 0.6529705, -3.291651, 1, 0.5803922, 0, 1,
-1.239326, -0.1593351, -0.3805056, 1, 0.5882353, 0, 1,
-1.229779, 1.661986, 1.314992, 1, 0.5921569, 0, 1,
-1.226772, -0.1338795, 0.1566437, 1, 0.6, 0, 1,
-1.226393, -0.02967525, -2.795689, 1, 0.6078432, 0, 1,
-1.223912, -0.3893428, -2.141909, 1, 0.6117647, 0, 1,
-1.223408, 2.861434, 0.6843289, 1, 0.6196079, 0, 1,
-1.222729, 0.4721545, -1.784917, 1, 0.6235294, 0, 1,
-1.217011, -2.00897, -1.535051, 1, 0.6313726, 0, 1,
-1.202964, 1.052143, -0.01352806, 1, 0.6352941, 0, 1,
-1.200896, 1.567567, -1.396547, 1, 0.6431373, 0, 1,
-1.200215, 2.40416, -1.349155, 1, 0.6470588, 0, 1,
-1.196833, -0.1758511, -0.3986897, 1, 0.654902, 0, 1,
-1.193094, -0.8147262, -2.419682, 1, 0.6588235, 0, 1,
-1.193048, -1.58346, -0.5846727, 1, 0.6666667, 0, 1,
-1.188734, 1.247723, -0.03016034, 1, 0.6705883, 0, 1,
-1.188432, 1.142255, -1.363408, 1, 0.6784314, 0, 1,
-1.184606, 0.4019916, -1.252396, 1, 0.682353, 0, 1,
-1.175436, -0.7511278, -1.642987, 1, 0.6901961, 0, 1,
-1.174497, -0.4703164, -3.212831, 1, 0.6941177, 0, 1,
-1.171118, 0.2318101, -0.9207016, 1, 0.7019608, 0, 1,
-1.169374, -1.417323, -3.235971, 1, 0.7098039, 0, 1,
-1.167849, -0.001348758, -0.2762609, 1, 0.7137255, 0, 1,
-1.159831, -2.125578, -0.8303251, 1, 0.7215686, 0, 1,
-1.148462, -0.6937319, -2.010518, 1, 0.7254902, 0, 1,
-1.139187, -0.6900602, -3.559721, 1, 0.7333333, 0, 1,
-1.125422, -0.2421189, 0.3604319, 1, 0.7372549, 0, 1,
-1.124421, -0.5002381, -3.345155, 1, 0.7450981, 0, 1,
-1.122199, 0.2469119, -0.7941259, 1, 0.7490196, 0, 1,
-1.119304, 0.2829339, 0.06756642, 1, 0.7568628, 0, 1,
-1.110683, 1.106095, 0.4579672, 1, 0.7607843, 0, 1,
-1.109413, -0.2338323, 0.2520122, 1, 0.7686275, 0, 1,
-1.099264, 0.7397108, 0.8322634, 1, 0.772549, 0, 1,
-1.094679, -0.005523304, -0.9784598, 1, 0.7803922, 0, 1,
-1.079308, -0.126997, -3.276463, 1, 0.7843137, 0, 1,
-1.074121, -0.6207302, -0.8925335, 1, 0.7921569, 0, 1,
-1.071553, 0.6196322, -1.851732, 1, 0.7960784, 0, 1,
-1.070381, -0.6164357, -2.066436, 1, 0.8039216, 0, 1,
-1.069011, 0.1820437, -1.112606, 1, 0.8117647, 0, 1,
-1.064551, -1.904313, -2.616399, 1, 0.8156863, 0, 1,
-1.062394, 0.9806332, -1.400819, 1, 0.8235294, 0, 1,
-1.061795, -0.8118358, -1.767993, 1, 0.827451, 0, 1,
-1.06118, -1.676891, -1.576685, 1, 0.8352941, 0, 1,
-1.045462, -0.4497779, -1.573933, 1, 0.8392157, 0, 1,
-1.042071, 0.365012, -2.428552, 1, 0.8470588, 0, 1,
-1.038959, -1.298288, -1.714843, 1, 0.8509804, 0, 1,
-1.037611, -0.5270822, -2.061387, 1, 0.8588235, 0, 1,
-1.018616, 1.417261, 0.8630568, 1, 0.8627451, 0, 1,
-1.017364, 0.8890717, -2.278131, 1, 0.8705882, 0, 1,
-1.012697, -0.3003485, -2.64086, 1, 0.8745098, 0, 1,
-1.010299, -0.6875252, -2.572047, 1, 0.8823529, 0, 1,
-1.005834, 1.198621, 0.4041469, 1, 0.8862745, 0, 1,
-1.005426, 0.3303699, -0.5987703, 1, 0.8941177, 0, 1,
-1.002988, 0.39295, -2.406939, 1, 0.8980392, 0, 1,
-0.9996673, 1.404217, -1.540976, 1, 0.9058824, 0, 1,
-0.9934855, 1.209659, -0.7894228, 1, 0.9137255, 0, 1,
-0.9893958, -0.6883324, -2.847247, 1, 0.9176471, 0, 1,
-0.9876348, 0.5116108, -1.65054, 1, 0.9254902, 0, 1,
-0.9851377, 0.7885427, -0.3919201, 1, 0.9294118, 0, 1,
-0.9806914, 0.9930323, -0.6095487, 1, 0.9372549, 0, 1,
-0.9783925, 0.3489099, -1.262383, 1, 0.9411765, 0, 1,
-0.9778346, 0.4071366, -2.619606, 1, 0.9490196, 0, 1,
-0.9776497, 0.691418, -3.701209, 1, 0.9529412, 0, 1,
-0.9760644, 1.009996, -0.5025169, 1, 0.9607843, 0, 1,
-0.9760587, -1.483177, -2.237535, 1, 0.9647059, 0, 1,
-0.9701946, -0.7059482, -2.189296, 1, 0.972549, 0, 1,
-0.9662322, -1.911706, -2.119524, 1, 0.9764706, 0, 1,
-0.9642166, 0.2536925, -2.54887, 1, 0.9843137, 0, 1,
-0.9634621, -0.5698091, -2.483366, 1, 0.9882353, 0, 1,
-0.9634027, -0.3613326, -2.579538, 1, 0.9960784, 0, 1,
-0.9567356, -1.114058, -2.353505, 0.9960784, 1, 0, 1,
-0.9566623, -0.2932587, -1.469852, 0.9921569, 1, 0, 1,
-0.9397752, 1.053544, -0.4166895, 0.9843137, 1, 0, 1,
-0.9393151, -0.9180787, -1.885541, 0.9803922, 1, 0, 1,
-0.9386111, 1.381651, 0.2500342, 0.972549, 1, 0, 1,
-0.9368817, -1.863343, -3.804254, 0.9686275, 1, 0, 1,
-0.9312192, 1.011751, 0.1334455, 0.9607843, 1, 0, 1,
-0.9220517, 0.7526234, 1.868741, 0.9568627, 1, 0, 1,
-0.9211941, -0.2745228, -2.537692, 0.9490196, 1, 0, 1,
-0.9210709, -0.4145952, -2.270349, 0.945098, 1, 0, 1,
-0.9128253, -0.1385202, -1.016891, 0.9372549, 1, 0, 1,
-0.9119697, 0.7818213, -0.1147193, 0.9333333, 1, 0, 1,
-0.9103422, -0.04120422, -1.143348, 0.9254902, 1, 0, 1,
-0.9087811, -1.466665, -0.9753021, 0.9215686, 1, 0, 1,
-0.9019649, 1.755357, 0.05557349, 0.9137255, 1, 0, 1,
-0.901899, 0.3851679, -0.3405759, 0.9098039, 1, 0, 1,
-0.8981258, -1.84348, -3.349353, 0.9019608, 1, 0, 1,
-0.8966084, -1.251978, -3.71678, 0.8941177, 1, 0, 1,
-0.8925746, 0.4896277, 0.09874004, 0.8901961, 1, 0, 1,
-0.8866724, 0.3191367, -1.547703, 0.8823529, 1, 0, 1,
-0.8803941, 0.6468347, 0.3396516, 0.8784314, 1, 0, 1,
-0.8801414, 0.6663352, 0.2525826, 0.8705882, 1, 0, 1,
-0.8730853, -0.7209833, -2.873331, 0.8666667, 1, 0, 1,
-0.8653958, 0.09726822, -2.021641, 0.8588235, 1, 0, 1,
-0.8595863, 0.7689316, -0.7641231, 0.854902, 1, 0, 1,
-0.8541337, 1.26767, -0.5747277, 0.8470588, 1, 0, 1,
-0.8539255, -1.097038, -2.179435, 0.8431373, 1, 0, 1,
-0.8534772, 0.5967991, -0.3177353, 0.8352941, 1, 0, 1,
-0.8516558, 0.328796, -2.402344, 0.8313726, 1, 0, 1,
-0.8447151, -0.5024282, -1.644526, 0.8235294, 1, 0, 1,
-0.8375441, 1.33277, 0.2662979, 0.8196079, 1, 0, 1,
-0.8362574, 0.08267044, -1.610289, 0.8117647, 1, 0, 1,
-0.8354774, -0.1371798, -1.455762, 0.8078431, 1, 0, 1,
-0.8350677, -1.322223, -3.194703, 0.8, 1, 0, 1,
-0.8251394, 0.4165109, -0.4046065, 0.7921569, 1, 0, 1,
-0.8233135, -1.640602, -2.808364, 0.7882353, 1, 0, 1,
-0.8196352, -0.02386129, -1.491321, 0.7803922, 1, 0, 1,
-0.818568, -0.4746026, -1.801568, 0.7764706, 1, 0, 1,
-0.8168193, 0.2292041, -1.06195, 0.7686275, 1, 0, 1,
-0.812901, -0.7050444, -1.452304, 0.7647059, 1, 0, 1,
-0.8073816, -0.4431551, 0.01492052, 0.7568628, 1, 0, 1,
-0.8065362, -0.9611908, -3.656981, 0.7529412, 1, 0, 1,
-0.8035732, -1.600638, -3.360121, 0.7450981, 1, 0, 1,
-0.8027027, 0.4490426, -0.4022917, 0.7411765, 1, 0, 1,
-0.7860146, -1.251331, -0.4439804, 0.7333333, 1, 0, 1,
-0.7814637, -0.2402664, -2.661263, 0.7294118, 1, 0, 1,
-0.78036, -2.729991, -3.15751, 0.7215686, 1, 0, 1,
-0.7802464, -0.8562748, -2.264696, 0.7176471, 1, 0, 1,
-0.7752237, -1.156966, -4.447562, 0.7098039, 1, 0, 1,
-0.7590796, 1.649588, 1.43251, 0.7058824, 1, 0, 1,
-0.7542419, 1.658846, 1.47971, 0.6980392, 1, 0, 1,
-0.7516923, -0.7822061, -2.958591, 0.6901961, 1, 0, 1,
-0.7495488, 1.811356, -1.099612, 0.6862745, 1, 0, 1,
-0.7281459, 0.8499492, -1.988412, 0.6784314, 1, 0, 1,
-0.7277017, -1.478053, -2.418463, 0.6745098, 1, 0, 1,
-0.72714, 0.6235601, -1.372643, 0.6666667, 1, 0, 1,
-0.7189389, -1.854741, -2.116012, 0.6627451, 1, 0, 1,
-0.714941, -0.5493589, -1.68892, 0.654902, 1, 0, 1,
-0.7145494, 0.3635858, -1.31736, 0.6509804, 1, 0, 1,
-0.7127123, -0.9112849, -2.566042, 0.6431373, 1, 0, 1,
-0.7120549, 1.098567, -0.6176735, 0.6392157, 1, 0, 1,
-0.7097086, 0.7830797, -1.559967, 0.6313726, 1, 0, 1,
-0.7061421, 0.2356017, -1.038046, 0.627451, 1, 0, 1,
-0.6996843, 0.8324058, -0.6385857, 0.6196079, 1, 0, 1,
-0.6970322, -0.1686327, -2.329823, 0.6156863, 1, 0, 1,
-0.6969694, -0.8213809, -2.505651, 0.6078432, 1, 0, 1,
-0.6939999, 0.2225915, -1.624579, 0.6039216, 1, 0, 1,
-0.6861766, -0.919401, -3.872183, 0.5960785, 1, 0, 1,
-0.6810072, -1.439282, -1.160568, 0.5882353, 1, 0, 1,
-0.6757783, -0.7611264, -1.528479, 0.5843138, 1, 0, 1,
-0.6707898, -0.45147, -2.469804, 0.5764706, 1, 0, 1,
-0.668156, -0.7198445, -1.564151, 0.572549, 1, 0, 1,
-0.6676683, -1.171696, -1.201836, 0.5647059, 1, 0, 1,
-0.6651994, 0.406373, -0.8584808, 0.5607843, 1, 0, 1,
-0.6607138, 1.553527, 0.2972239, 0.5529412, 1, 0, 1,
-0.6596867, 0.2594471, -0.6288038, 0.5490196, 1, 0, 1,
-0.6579733, 1.177058, -1.083317, 0.5411765, 1, 0, 1,
-0.6544825, 1.549801, -2.960974, 0.5372549, 1, 0, 1,
-0.6527078, 0.7652583, 0.2806546, 0.5294118, 1, 0, 1,
-0.6478265, -0.1131142, -2.774298, 0.5254902, 1, 0, 1,
-0.6361304, -0.393337, -2.98296, 0.5176471, 1, 0, 1,
-0.6311594, 0.5370486, -1.306344, 0.5137255, 1, 0, 1,
-0.6311549, 0.1764611, 0.2460707, 0.5058824, 1, 0, 1,
-0.6285803, 0.9609349, -1.44028, 0.5019608, 1, 0, 1,
-0.626991, 0.03111192, -0.8198113, 0.4941176, 1, 0, 1,
-0.6257633, -0.8543518, -3.424314, 0.4862745, 1, 0, 1,
-0.6232292, -0.6366463, -1.517807, 0.4823529, 1, 0, 1,
-0.6229461, -1.227655, -1.840801, 0.4745098, 1, 0, 1,
-0.6140506, -0.5829692, -3.950973, 0.4705882, 1, 0, 1,
-0.6124653, -0.2454461, -2.200868, 0.4627451, 1, 0, 1,
-0.6060902, -1.380764, -2.494753, 0.4588235, 1, 0, 1,
-0.605801, -0.7801494, -3.988608, 0.4509804, 1, 0, 1,
-0.6053984, 1.477166, -0.3494112, 0.4470588, 1, 0, 1,
-0.6052349, 0.7480596, -1.95165, 0.4392157, 1, 0, 1,
-0.6023172, 1.572764, -1.134003, 0.4352941, 1, 0, 1,
-0.6009955, 1.17652, -0.5914105, 0.427451, 1, 0, 1,
-0.5996693, -1.791932, -3.844769, 0.4235294, 1, 0, 1,
-0.5992659, -0.2865653, -1.824871, 0.4156863, 1, 0, 1,
-0.5953819, -0.8018603, -2.522579, 0.4117647, 1, 0, 1,
-0.5949847, -0.773468, -2.67427, 0.4039216, 1, 0, 1,
-0.5937418, 1.222577, 0.0384367, 0.3960784, 1, 0, 1,
-0.5888108, 0.2229402, -1.163312, 0.3921569, 1, 0, 1,
-0.5847362, -0.8998296, -1.255403, 0.3843137, 1, 0, 1,
-0.584622, 1.464419, 0.3845017, 0.3803922, 1, 0, 1,
-0.5842024, -0.215558, -2.030288, 0.372549, 1, 0, 1,
-0.5823993, -0.07039265, -1.437057, 0.3686275, 1, 0, 1,
-0.5811003, -2.219481, -3.836359, 0.3607843, 1, 0, 1,
-0.5807971, 0.01963553, -1.562391, 0.3568628, 1, 0, 1,
-0.5761278, -0.7366806, -0.4210435, 0.3490196, 1, 0, 1,
-0.5674338, 0.2126208, -0.5948851, 0.345098, 1, 0, 1,
-0.5665634, 1.233496, -0.3527184, 0.3372549, 1, 0, 1,
-0.5654857, -1.081938, -1.261592, 0.3333333, 1, 0, 1,
-0.5606204, 0.7269073, -2.494791, 0.3254902, 1, 0, 1,
-0.5588694, -0.442566, -3.503033, 0.3215686, 1, 0, 1,
-0.5573928, -0.7555009, -2.624081, 0.3137255, 1, 0, 1,
-0.5573692, -1.258438, -0.6699573, 0.3098039, 1, 0, 1,
-0.554502, 2.001267, -0.3935941, 0.3019608, 1, 0, 1,
-0.5525125, 0.559976, -1.801998, 0.2941177, 1, 0, 1,
-0.5515985, 2.240559, 0.5002436, 0.2901961, 1, 0, 1,
-0.5431004, -0.9579956, -1.731335, 0.282353, 1, 0, 1,
-0.5428649, 0.83628, 0.2099353, 0.2784314, 1, 0, 1,
-0.5357198, 0.2564717, -1.755711, 0.2705882, 1, 0, 1,
-0.532841, -2.519824, -4.372804, 0.2666667, 1, 0, 1,
-0.5325643, -0.945324, -0.02990065, 0.2588235, 1, 0, 1,
-0.5306838, -1.421607, -3.970854, 0.254902, 1, 0, 1,
-0.5279231, -1.097416, -2.772248, 0.2470588, 1, 0, 1,
-0.5251082, 2.197775, -0.02854055, 0.2431373, 1, 0, 1,
-0.5226734, -0.613381, -3.205743, 0.2352941, 1, 0, 1,
-0.520063, -0.4044252, -1.550426, 0.2313726, 1, 0, 1,
-0.5155048, 1.379677, 0.3419192, 0.2235294, 1, 0, 1,
-0.5111232, -1.992422, -3.153665, 0.2196078, 1, 0, 1,
-0.5096387, 0.9121976, -1.844041, 0.2117647, 1, 0, 1,
-0.5091516, 1.600127, -0.3901689, 0.2078431, 1, 0, 1,
-0.5073473, -0.2326276, -1.546318, 0.2, 1, 0, 1,
-0.5015349, -0.2397315, -3.180839, 0.1921569, 1, 0, 1,
-0.4980481, -0.1888966, -3.359668, 0.1882353, 1, 0, 1,
-0.4975611, -0.4345698, -3.710399, 0.1803922, 1, 0, 1,
-0.4929973, 0.902862, -2.224816, 0.1764706, 1, 0, 1,
-0.4877564, 0.5018562, -0.3228265, 0.1686275, 1, 0, 1,
-0.4861131, 1.323621, 0.1683966, 0.1647059, 1, 0, 1,
-0.4844796, -0.5426664, -0.5062225, 0.1568628, 1, 0, 1,
-0.4841641, 0.01520659, -1.923221, 0.1529412, 1, 0, 1,
-0.4836296, 0.9787773, -2.004955, 0.145098, 1, 0, 1,
-0.4783158, -0.3763934, -1.19751, 0.1411765, 1, 0, 1,
-0.477445, -0.3735069, -3.64355, 0.1333333, 1, 0, 1,
-0.4750375, -0.5996186, -2.908799, 0.1294118, 1, 0, 1,
-0.4736587, 0.4326542, -1.322625, 0.1215686, 1, 0, 1,
-0.4720673, 1.678015, -0.621774, 0.1176471, 1, 0, 1,
-0.4666052, -0.09836403, 0.376469, 0.1098039, 1, 0, 1,
-0.4662838, -0.2866636, -2.061865, 0.1058824, 1, 0, 1,
-0.4594528, 0.2885503, -0.9894717, 0.09803922, 1, 0, 1,
-0.4578752, 0.01279757, -1.843312, 0.09019608, 1, 0, 1,
-0.4543837, -0.9307624, -2.214628, 0.08627451, 1, 0, 1,
-0.4529741, -1.250823, -1.992357, 0.07843138, 1, 0, 1,
-0.4517312, -1.981228, -2.486484, 0.07450981, 1, 0, 1,
-0.4485546, -0.3418236, -1.868172, 0.06666667, 1, 0, 1,
-0.4458225, -0.4278764, -2.579061, 0.0627451, 1, 0, 1,
-0.4394942, 1.247523, -1.273852, 0.05490196, 1, 0, 1,
-0.4391694, -1.069579, -2.782897, 0.05098039, 1, 0, 1,
-0.4246618, 1.275542, 1.766806, 0.04313726, 1, 0, 1,
-0.4242021, 0.6976272, -1.578587, 0.03921569, 1, 0, 1,
-0.4241561, 1.185386, 0.7812231, 0.03137255, 1, 0, 1,
-0.4184095, 0.7325488, -0.9296139, 0.02745098, 1, 0, 1,
-0.4164895, -2.457645, -2.643578, 0.01960784, 1, 0, 1,
-0.4163368, 0.1218838, -3.551776, 0.01568628, 1, 0, 1,
-0.4160965, 0.08476155, -1.318686, 0.007843138, 1, 0, 1,
-0.4143437, 1.173111, 0.2746783, 0.003921569, 1, 0, 1,
-0.4131728, -0.7569453, -3.79143, 0, 1, 0.003921569, 1,
-0.4082112, 1.24254, 0.6838811, 0, 1, 0.01176471, 1,
-0.4030029, 1.112006, -1.184188, 0, 1, 0.01568628, 1,
-0.4022673, -1.248688, -1.842066, 0, 1, 0.02352941, 1,
-0.4014252, 1.313323, -0.5223221, 0, 1, 0.02745098, 1,
-0.3984112, 1.182813, -2.675514, 0, 1, 0.03529412, 1,
-0.3968644, 1.537609, -0.09743095, 0, 1, 0.03921569, 1,
-0.3947514, -0.6708486, -3.32959, 0, 1, 0.04705882, 1,
-0.390999, -0.6246668, -3.848205, 0, 1, 0.05098039, 1,
-0.3871787, 0.2372211, -0.4691359, 0, 1, 0.05882353, 1,
-0.3852667, -1.156033, -1.317857, 0, 1, 0.0627451, 1,
-0.3847764, 0.3779956, -0.2578575, 0, 1, 0.07058824, 1,
-0.3831522, 0.2184602, -0.1490974, 0, 1, 0.07450981, 1,
-0.3806086, -0.8176839, -2.935947, 0, 1, 0.08235294, 1,
-0.3704895, 0.2278904, -2.012783, 0, 1, 0.08627451, 1,
-0.365263, 0.1136055, -0.8036677, 0, 1, 0.09411765, 1,
-0.3625149, 0.3044936, -0.7782198, 0, 1, 0.1019608, 1,
-0.3540355, 1.987972, -2.35367, 0, 1, 0.1058824, 1,
-0.3474041, -0.7713848, -4.723251, 0, 1, 0.1137255, 1,
-0.3457515, 0.9490342, -0.426029, 0, 1, 0.1176471, 1,
-0.3435757, 0.380767, 1.413069, 0, 1, 0.1254902, 1,
-0.3380185, 0.5060308, -1.276067, 0, 1, 0.1294118, 1,
-0.3364926, 0.2997749, -1.168727, 0, 1, 0.1372549, 1,
-0.3330114, 0.712223, 0.8159307, 0, 1, 0.1411765, 1,
-0.3301137, -0.7792735, -0.6030641, 0, 1, 0.1490196, 1,
-0.3277955, -0.2585633, -1.30265, 0, 1, 0.1529412, 1,
-0.326354, 0.3185346, -1.488127, 0, 1, 0.1607843, 1,
-0.3145226, -0.5223939, -3.220338, 0, 1, 0.1647059, 1,
-0.3126522, -1.519735, -1.844864, 0, 1, 0.172549, 1,
-0.3112634, 0.624864, -1.432011, 0, 1, 0.1764706, 1,
-0.3106308, -0.230419, -1.937598, 0, 1, 0.1843137, 1,
-0.3077558, 1.204721, -0.4874473, 0, 1, 0.1882353, 1,
-0.304424, 1.023645, -1.637034, 0, 1, 0.1960784, 1,
-0.3027346, -0.6522661, -1.975226, 0, 1, 0.2039216, 1,
-0.2997946, -0.3038844, -1.163514, 0, 1, 0.2078431, 1,
-0.2915251, 0.5779971, -1.968749, 0, 1, 0.2156863, 1,
-0.2914572, 0.004074574, -2.55707, 0, 1, 0.2196078, 1,
-0.2898243, -0.0818437, -2.832039, 0, 1, 0.227451, 1,
-0.2889547, 0.5283699, 0.9487197, 0, 1, 0.2313726, 1,
-0.2863224, 0.733359, -0.2736089, 0, 1, 0.2392157, 1,
-0.2861093, 2.435818, 0.3622512, 0, 1, 0.2431373, 1,
-0.2831436, 0.2252724, -0.7174042, 0, 1, 0.2509804, 1,
-0.2764359, 0.6582839, 0.5861115, 0, 1, 0.254902, 1,
-0.2719879, 1.41093, 1.594347, 0, 1, 0.2627451, 1,
-0.2717963, -1.27368, -1.882468, 0, 1, 0.2666667, 1,
-0.2660658, -1.132644, -2.588442, 0, 1, 0.2745098, 1,
-0.2644871, 1.743329, 1.469932, 0, 1, 0.2784314, 1,
-0.2562844, -1.397176, -2.618062, 0, 1, 0.2862745, 1,
-0.255016, -0.748874, -3.286328, 0, 1, 0.2901961, 1,
-0.2517208, -0.9485111, -3.480205, 0, 1, 0.2980392, 1,
-0.2503087, 1.700131, -1.712409, 0, 1, 0.3058824, 1,
-0.2499163, 0.9931777, 0.4534276, 0, 1, 0.3098039, 1,
-0.2484759, 1.998908, -0.1640624, 0, 1, 0.3176471, 1,
-0.2462416, 0.6893945, 0.3138524, 0, 1, 0.3215686, 1,
-0.2422629, 2.320518, -0.8611047, 0, 1, 0.3294118, 1,
-0.240964, -1.379873, -4.547416, 0, 1, 0.3333333, 1,
-0.2406496, -0.3445111, 0.005179891, 0, 1, 0.3411765, 1,
-0.2397465, 1.256884, -0.7876545, 0, 1, 0.345098, 1,
-0.2384212, -1.964368, -4.22093, 0, 1, 0.3529412, 1,
-0.235074, -0.05888181, -3.110892, 0, 1, 0.3568628, 1,
-0.2346452, -0.8243551, -4.449623, 0, 1, 0.3647059, 1,
-0.2318328, -1.35019, -3.60093, 0, 1, 0.3686275, 1,
-0.2292998, 0.3261935, -1.036573, 0, 1, 0.3764706, 1,
-0.2264982, -0.764195, -2.126667, 0, 1, 0.3803922, 1,
-0.2249127, -0.8771384, -3.079022, 0, 1, 0.3882353, 1,
-0.2246759, 1.346383, 1.302878, 0, 1, 0.3921569, 1,
-0.2233266, -0.1707944, -2.948282, 0, 1, 0.4, 1,
-0.2207107, 1.900083, 0.1913812, 0, 1, 0.4078431, 1,
-0.2144421, -0.4077103, -3.059235, 0, 1, 0.4117647, 1,
-0.2110154, -0.06678317, -3.546726, 0, 1, 0.4196078, 1,
-0.2074651, 1.385466, -0.8759922, 0, 1, 0.4235294, 1,
-0.2046387, 0.06711336, -0.9803128, 0, 1, 0.4313726, 1,
-0.2020425, -0.7005912, -2.767065, 0, 1, 0.4352941, 1,
-0.2009907, -0.9009851, -3.693311, 0, 1, 0.4431373, 1,
-0.198875, 0.638732, 1.009928, 0, 1, 0.4470588, 1,
-0.1926875, -0.6331321, -3.771136, 0, 1, 0.454902, 1,
-0.1877781, 0.4302576, 1.938434, 0, 1, 0.4588235, 1,
-0.1866665, 1.912485, -2.284312, 0, 1, 0.4666667, 1,
-0.1851604, -0.09924633, -2.010697, 0, 1, 0.4705882, 1,
-0.1805142, -0.8895292, -3.421042, 0, 1, 0.4784314, 1,
-0.1781028, 1.259133, 0.1581081, 0, 1, 0.4823529, 1,
-0.1623723, -0.794293, -2.771676, 0, 1, 0.4901961, 1,
-0.1536234, -0.2039172, -3.908029, 0, 1, 0.4941176, 1,
-0.151377, 1.255233, -1.204119, 0, 1, 0.5019608, 1,
-0.1511594, 0.6952544, -1.301067, 0, 1, 0.509804, 1,
-0.1509327, 0.3560853, 1.230817, 0, 1, 0.5137255, 1,
-0.1499454, 1.312857, -1.397754, 0, 1, 0.5215687, 1,
-0.1499352, 0.9515935, 1.107429, 0, 1, 0.5254902, 1,
-0.1480871, 1.730368, 0.106005, 0, 1, 0.5333334, 1,
-0.1442752, 2.191344, -0.005470608, 0, 1, 0.5372549, 1,
-0.1399841, -0.3830451, -2.724682, 0, 1, 0.5450981, 1,
-0.1399318, 1.350469, -0.6375832, 0, 1, 0.5490196, 1,
-0.1355132, 0.2105294, -0.6566584, 0, 1, 0.5568628, 1,
-0.1354344, 0.008628323, -2.272214, 0, 1, 0.5607843, 1,
-0.1328996, 1.318076, 0.8839337, 0, 1, 0.5686275, 1,
-0.1299534, 1.16381, 0.2120729, 0, 1, 0.572549, 1,
-0.1294426, -0.6055808, -1.734548, 0, 1, 0.5803922, 1,
-0.125458, -0.02460746, -2.512478, 0, 1, 0.5843138, 1,
-0.120673, -0.6033967, -0.6289198, 0, 1, 0.5921569, 1,
-0.1150675, 1.345214, 1.811204, 0, 1, 0.5960785, 1,
-0.1120048, 0.5107041, -0.198433, 0, 1, 0.6039216, 1,
-0.1103563, 0.5993179, -0.5176634, 0, 1, 0.6117647, 1,
-0.1100884, -0.1482304, -2.211258, 0, 1, 0.6156863, 1,
-0.1063086, 0.2608782, 0.8902681, 0, 1, 0.6235294, 1,
-0.1031398, -0.4944206, -3.36789, 0, 1, 0.627451, 1,
-0.09359299, -1.109465, -1.826086, 0, 1, 0.6352941, 1,
-0.09227953, -0.1118176, -3.335008, 0, 1, 0.6392157, 1,
-0.09091844, 0.5423132, 1.474846, 0, 1, 0.6470588, 1,
-0.08833723, -1.742329, -3.158735, 0, 1, 0.6509804, 1,
-0.07648253, -0.3958832, -1.970436, 0, 1, 0.6588235, 1,
-0.07609411, -0.1499581, -2.976178, 0, 1, 0.6627451, 1,
-0.0755598, 0.9380843, 1.389271, 0, 1, 0.6705883, 1,
-0.0747852, 0.582744, 0.03883615, 0, 1, 0.6745098, 1,
-0.07285491, 0.5559669, 0.4558731, 0, 1, 0.682353, 1,
-0.07213438, 0.06195005, -0.2708249, 0, 1, 0.6862745, 1,
-0.06977974, -0.837634, -3.542248, 0, 1, 0.6941177, 1,
-0.06942766, -0.8234608, -2.116112, 0, 1, 0.7019608, 1,
-0.06901789, 1.713491, -0.8714018, 0, 1, 0.7058824, 1,
-0.06891297, 1.141757, 0.8387568, 0, 1, 0.7137255, 1,
-0.06860632, -0.5011751, -4.016583, 0, 1, 0.7176471, 1,
-0.06712437, -0.676925, -4.095849, 0, 1, 0.7254902, 1,
-0.06276326, 1.589154, -0.938957, 0, 1, 0.7294118, 1,
-0.06071227, 0.4076797, 0.3957288, 0, 1, 0.7372549, 1,
-0.05646069, 0.4866478, 0.5479869, 0, 1, 0.7411765, 1,
-0.05135365, 1.866403, 1.589785, 0, 1, 0.7490196, 1,
-0.04657085, -0.6637276, -2.769, 0, 1, 0.7529412, 1,
-0.04461938, -0.1705928, -3.95943, 0, 1, 0.7607843, 1,
-0.04354898, 1.490169, 0.2935894, 0, 1, 0.7647059, 1,
-0.04309874, 0.1762848, -1.265192, 0, 1, 0.772549, 1,
-0.04096114, -0.7650317, -2.345036, 0, 1, 0.7764706, 1,
-0.03901772, -0.7747838, -4.022571, 0, 1, 0.7843137, 1,
-0.02772791, 0.4707889, 0.07732444, 0, 1, 0.7882353, 1,
-0.02592941, -1.328195, -3.313276, 0, 1, 0.7960784, 1,
-0.02340162, -0.4742539, -2.046782, 0, 1, 0.8039216, 1,
-0.02288171, 0.09285723, 1.323936, 0, 1, 0.8078431, 1,
-0.01355581, -0.5417617, -1.82988, 0, 1, 0.8156863, 1,
-0.0112379, 0.4897114, 0.1301852, 0, 1, 0.8196079, 1,
-0.008952359, 1.337074, 0.6561627, 0, 1, 0.827451, 1,
-0.00772959, 1.1448, -0.4538842, 0, 1, 0.8313726, 1,
-0.005984157, -0.7902755, -6.006821, 0, 1, 0.8392157, 1,
-0.003098848, 1.45617, 0.5982766, 0, 1, 0.8431373, 1,
-0.002756448, 0.6214031, 0.4425686, 0, 1, 0.8509804, 1,
-0.002716169, -0.3077243, -5.417974, 0, 1, 0.854902, 1,
0.006517015, -0.2021598, 4.057553, 0, 1, 0.8627451, 1,
0.01222658, 1.49231, 1.320414, 0, 1, 0.8666667, 1,
0.01324127, 0.7213243, 0.8997772, 0, 1, 0.8745098, 1,
0.01479798, -0.6487717, 2.95701, 0, 1, 0.8784314, 1,
0.02758784, 0.5382836, -0.7905506, 0, 1, 0.8862745, 1,
0.02872527, 1.016171, -0.8222234, 0, 1, 0.8901961, 1,
0.02913221, 1.694596, -0.4114241, 0, 1, 0.8980392, 1,
0.03770389, 0.03190922, 2.407324, 0, 1, 0.9058824, 1,
0.03807241, 1.248961, -0.7671602, 0, 1, 0.9098039, 1,
0.03845041, 0.4236494, -1.296358, 0, 1, 0.9176471, 1,
0.04176025, -0.2102894, 2.042309, 0, 1, 0.9215686, 1,
0.04896007, -0.3048563, 4.798976, 0, 1, 0.9294118, 1,
0.04996441, 0.5153776, 0.7931159, 0, 1, 0.9333333, 1,
0.05046307, -0.1408826, 3.885142, 0, 1, 0.9411765, 1,
0.05153388, -0.3799566, 1.769742, 0, 1, 0.945098, 1,
0.05316485, -0.7196012, 2.979681, 0, 1, 0.9529412, 1,
0.05410297, -0.5695665, 3.036684, 0, 1, 0.9568627, 1,
0.05472222, 1.854821, -1.186972, 0, 1, 0.9647059, 1,
0.05757885, -0.9328464, 0.9491879, 0, 1, 0.9686275, 1,
0.05927728, -0.5074928, 3.64867, 0, 1, 0.9764706, 1,
0.06049111, -0.8970611, 3.295727, 0, 1, 0.9803922, 1,
0.06317741, -1.283993, 2.498104, 0, 1, 0.9882353, 1,
0.06494486, 1.229176, -0.2930109, 0, 1, 0.9921569, 1,
0.06761465, -1.361052, 4.65124, 0, 1, 1, 1,
0.070089, -0.4012574, 0.7243159, 0, 0.9921569, 1, 1,
0.07014218, 1.158341, 0.8381555, 0, 0.9882353, 1, 1,
0.07112858, -0.2925821, 4.118067, 0, 0.9803922, 1, 1,
0.07227695, -1.10906, 1.044561, 0, 0.9764706, 1, 1,
0.07532978, 0.6766078, -1.301337, 0, 0.9686275, 1, 1,
0.07538006, -0.5097323, 1.386953, 0, 0.9647059, 1, 1,
0.08045655, 1.305125, -0.6450151, 0, 0.9568627, 1, 1,
0.08113027, -0.09179491, 2.12416, 0, 0.9529412, 1, 1,
0.08507155, -0.6579951, 1.417511, 0, 0.945098, 1, 1,
0.08777491, -0.386227, 1.786078, 0, 0.9411765, 1, 1,
0.1000819, -0.2207806, 1.988404, 0, 0.9333333, 1, 1,
0.1033207, 1.522227, 0.3827516, 0, 0.9294118, 1, 1,
0.1063603, -1.705308, 3.688727, 0, 0.9215686, 1, 1,
0.1065642, 1.041757, 0.1287381, 0, 0.9176471, 1, 1,
0.1078123, 2.464561, -1.869738, 0, 0.9098039, 1, 1,
0.1093723, -2.334339, 2.215618, 0, 0.9058824, 1, 1,
0.1163859, 0.3728991, 0.06294616, 0, 0.8980392, 1, 1,
0.1167017, -0.9943858, 3.079367, 0, 0.8901961, 1, 1,
0.1177497, 1.232143, 1.293007, 0, 0.8862745, 1, 1,
0.1205704, -2.154186, 2.75638, 0, 0.8784314, 1, 1,
0.1237124, -0.3397931, 0.708222, 0, 0.8745098, 1, 1,
0.1256061, 0.3876261, 0.4760494, 0, 0.8666667, 1, 1,
0.1369182, -0.9195518, 1.276669, 0, 0.8627451, 1, 1,
0.1380326, -0.560445, 3.257523, 0, 0.854902, 1, 1,
0.1431566, 1.540089, -1.295553, 0, 0.8509804, 1, 1,
0.1453991, 0.6066592, -1.323452, 0, 0.8431373, 1, 1,
0.1459524, -0.542354, 2.515333, 0, 0.8392157, 1, 1,
0.148159, -0.33665, 3.309003, 0, 0.8313726, 1, 1,
0.1499212, -0.8091553, 2.841953, 0, 0.827451, 1, 1,
0.1509784, -0.6573442, 2.618491, 0, 0.8196079, 1, 1,
0.1531928, 0.4472986, 0.1141632, 0, 0.8156863, 1, 1,
0.1569021, 1.362539, -0.729608, 0, 0.8078431, 1, 1,
0.1586989, 1.977748, -0.4075731, 0, 0.8039216, 1, 1,
0.159424, 1.127226, 1.076098, 0, 0.7960784, 1, 1,
0.1616627, -1.379319, 1.444958, 0, 0.7882353, 1, 1,
0.1621451, 1.740789, -1.689178, 0, 0.7843137, 1, 1,
0.1633404, -2.192928, 3.074511, 0, 0.7764706, 1, 1,
0.1659005, 1.952294, -0.5436293, 0, 0.772549, 1, 1,
0.1716668, -0.5317234, 2.778719, 0, 0.7647059, 1, 1,
0.1724192, -0.8502826, 2.605984, 0, 0.7607843, 1, 1,
0.1742999, -0.7061331, 2.874252, 0, 0.7529412, 1, 1,
0.1744897, -0.7886419, 3.365845, 0, 0.7490196, 1, 1,
0.1775604, 0.373212, 0.4629569, 0, 0.7411765, 1, 1,
0.1817996, 0.9676207, 0.5227443, 0, 0.7372549, 1, 1,
0.1851017, -0.2820368, 1.379526, 0, 0.7294118, 1, 1,
0.1887268, 0.6389525, 0.7824059, 0, 0.7254902, 1, 1,
0.1901022, -0.637279, 2.291418, 0, 0.7176471, 1, 1,
0.1925333, 0.3451234, -0.5500537, 0, 0.7137255, 1, 1,
0.1945195, 0.8400334, -0.3573207, 0, 0.7058824, 1, 1,
0.199343, -1.103848, 4.907547, 0, 0.6980392, 1, 1,
0.2001393, 0.7180534, 0.5683116, 0, 0.6941177, 1, 1,
0.2035229, -0.3471942, 0.4978929, 0, 0.6862745, 1, 1,
0.2064855, 0.7032971, -0.1455475, 0, 0.682353, 1, 1,
0.2065206, 0.7939738, -1.015445, 0, 0.6745098, 1, 1,
0.2077138, 0.007528526, 1.484247, 0, 0.6705883, 1, 1,
0.2089334, 1.449179, 1.069692, 0, 0.6627451, 1, 1,
0.2124095, -0.4331307, 2.622674, 0, 0.6588235, 1, 1,
0.2124162, 0.4044624, 0.9785932, 0, 0.6509804, 1, 1,
0.2218217, 0.9032625, 0.205422, 0, 0.6470588, 1, 1,
0.2309167, 0.2563913, 1.521985, 0, 0.6392157, 1, 1,
0.2324926, 0.09477033, 1.503531, 0, 0.6352941, 1, 1,
0.2327816, -0.1119163, -0.2915871, 0, 0.627451, 1, 1,
0.2331774, 0.02317146, 1.808053, 0, 0.6235294, 1, 1,
0.2346022, 0.5149679, 1.627056, 0, 0.6156863, 1, 1,
0.2378847, 0.9825953, 1.197348, 0, 0.6117647, 1, 1,
0.2580734, -0.5795496, 5.438989, 0, 0.6039216, 1, 1,
0.2601469, 0.4029166, 0.8250258, 0, 0.5960785, 1, 1,
0.2632149, 1.336514, 0.8145156, 0, 0.5921569, 1, 1,
0.2633109, -0.7801877, 1.963561, 0, 0.5843138, 1, 1,
0.2669167, 1.45943, 0.5485984, 0, 0.5803922, 1, 1,
0.2677003, 1.091255, 1.240935, 0, 0.572549, 1, 1,
0.269961, 0.8307868, 1.363563, 0, 0.5686275, 1, 1,
0.2753025, 0.2352837, -1.245191, 0, 0.5607843, 1, 1,
0.2762328, 0.01170497, 1.606127, 0, 0.5568628, 1, 1,
0.2773703, -1.020577, 2.874109, 0, 0.5490196, 1, 1,
0.2789254, -1.713152, 3.631478, 0, 0.5450981, 1, 1,
0.2815246, 1.859768, 0.2736408, 0, 0.5372549, 1, 1,
0.2885165, 2.478386, -0.331967, 0, 0.5333334, 1, 1,
0.2932032, 0.05596299, 0.07504854, 0, 0.5254902, 1, 1,
0.2933202, 1.291963, 0.896678, 0, 0.5215687, 1, 1,
0.2954514, 1.244146, 2.246838, 0, 0.5137255, 1, 1,
0.2978774, 0.1390775, 0.639275, 0, 0.509804, 1, 1,
0.3037733, 0.4552227, 0.02821779, 0, 0.5019608, 1, 1,
0.3076582, 0.7106969, 1.757632, 0, 0.4941176, 1, 1,
0.3099316, 1.312451, -0.8192422, 0, 0.4901961, 1, 1,
0.311576, 0.2351039, -0.6827393, 0, 0.4823529, 1, 1,
0.3161854, -0.03603045, -0.5659091, 0, 0.4784314, 1, 1,
0.3163049, 0.116991, 0.0370134, 0, 0.4705882, 1, 1,
0.3213738, -0.6950446, 1.263108, 0, 0.4666667, 1, 1,
0.3214344, 0.2823744, 0.3021887, 0, 0.4588235, 1, 1,
0.3215194, 0.1791894, 0.8823805, 0, 0.454902, 1, 1,
0.3244672, -0.1819189, 1.761119, 0, 0.4470588, 1, 1,
0.3248348, -0.4986847, 3.432246, 0, 0.4431373, 1, 1,
0.3280219, 0.5368366, -0.281224, 0, 0.4352941, 1, 1,
0.3367263, 1.089026, 0.6633764, 0, 0.4313726, 1, 1,
0.338557, 0.6485659, 0.07467084, 0, 0.4235294, 1, 1,
0.3386329, -0.5725918, 3.280022, 0, 0.4196078, 1, 1,
0.3410885, -0.2327332, 1.608482, 0, 0.4117647, 1, 1,
0.3412411, 0.9776914, -2.443566, 0, 0.4078431, 1, 1,
0.3434738, -1.166416, 1.981474, 0, 0.4, 1, 1,
0.3590227, -0.4242031, 1.195001, 0, 0.3921569, 1, 1,
0.3633448, 0.7352894, 0.8721306, 0, 0.3882353, 1, 1,
0.3662868, -0.9930903, 2.540878, 0, 0.3803922, 1, 1,
0.3680971, 0.6168104, 1.246708, 0, 0.3764706, 1, 1,
0.3710108, 0.4805363, 1.015292, 0, 0.3686275, 1, 1,
0.3731502, -0.7040238, 1.171454, 0, 0.3647059, 1, 1,
0.3775959, -1.074064, 2.837457, 0, 0.3568628, 1, 1,
0.382296, 0.8070577, 0.9109597, 0, 0.3529412, 1, 1,
0.3858785, -0.5660787, 1.476549, 0, 0.345098, 1, 1,
0.3868928, -0.2662044, 3.171635, 0, 0.3411765, 1, 1,
0.3884342, 0.3743279, -0.05008037, 0, 0.3333333, 1, 1,
0.3900034, -0.2454892, 1.38412, 0, 0.3294118, 1, 1,
0.3939418, 1.630963, 0.6913622, 0, 0.3215686, 1, 1,
0.3986145, 0.4217986, 0.7470047, 0, 0.3176471, 1, 1,
0.4053578, -0.8245965, 3.882642, 0, 0.3098039, 1, 1,
0.4064469, 0.8082756, -0.4705549, 0, 0.3058824, 1, 1,
0.4093374, 0.6724295, 0.1557743, 0, 0.2980392, 1, 1,
0.4104639, 0.3056593, -0.6538121, 0, 0.2901961, 1, 1,
0.4132941, -0.5812349, 2.78213, 0, 0.2862745, 1, 1,
0.4160997, -1.829068, 3.366897, 0, 0.2784314, 1, 1,
0.4182649, -0.4483046, 4.274267, 0, 0.2745098, 1, 1,
0.4206458, -0.04987016, 0.538988, 0, 0.2666667, 1, 1,
0.4231586, 0.1048005, 3.433357, 0, 0.2627451, 1, 1,
0.4237626, -0.962595, 1.815987, 0, 0.254902, 1, 1,
0.4289799, 0.6819977, 0.09686975, 0, 0.2509804, 1, 1,
0.4309912, -1.103124, 4.044702, 0, 0.2431373, 1, 1,
0.4311006, -0.180236, 0.7093589, 0, 0.2392157, 1, 1,
0.4312766, 0.02072186, 2.161638, 0, 0.2313726, 1, 1,
0.4316979, 0.9165379, -1.208402, 0, 0.227451, 1, 1,
0.4345244, -0.4456997, 2.355048, 0, 0.2196078, 1, 1,
0.4394678, 1.92186, 1.076021, 0, 0.2156863, 1, 1,
0.4418416, -0.8877229, 0.8078678, 0, 0.2078431, 1, 1,
0.4427218, -0.4955576, 2.978389, 0, 0.2039216, 1, 1,
0.442739, -0.3325968, 2.410624, 0, 0.1960784, 1, 1,
0.4429235, 0.1614549, 1.25312, 0, 0.1882353, 1, 1,
0.4434903, -0.3507932, 2.627511, 0, 0.1843137, 1, 1,
0.4445445, 0.455231, 1.62482, 0, 0.1764706, 1, 1,
0.4454124, -1.339819, 1.19714, 0, 0.172549, 1, 1,
0.4457746, -0.256649, 1.565083, 0, 0.1647059, 1, 1,
0.4471219, 1.969613, -1.478794, 0, 0.1607843, 1, 1,
0.4484976, 0.7694944, 1.013647, 0, 0.1529412, 1, 1,
0.4525497, -0.3194483, 1.975616, 0, 0.1490196, 1, 1,
0.4532681, 0.7200106, 0.4656861, 0, 0.1411765, 1, 1,
0.4539738, -0.8433764, 1.897026, 0, 0.1372549, 1, 1,
0.4588599, 0.02415443, 0.2741904, 0, 0.1294118, 1, 1,
0.4597657, -0.2269756, 2.656817, 0, 0.1254902, 1, 1,
0.46083, 0.5694886, 0.4486523, 0, 0.1176471, 1, 1,
0.4614449, -0.5430703, 1.287635, 0, 0.1137255, 1, 1,
0.4659666, 0.1558099, 0.2318517, 0, 0.1058824, 1, 1,
0.4684358, -0.4464451, 2.676485, 0, 0.09803922, 1, 1,
0.471372, 0.2322653, 1.274965, 0, 0.09411765, 1, 1,
0.4745136, -0.4001746, 0.3633027, 0, 0.08627451, 1, 1,
0.4745924, -0.2013483, 3.024217, 0, 0.08235294, 1, 1,
0.4765158, -1.071024, 1.865964, 0, 0.07450981, 1, 1,
0.4778778, 0.3374222, 0.1138931, 0, 0.07058824, 1, 1,
0.4796055, 1.590238, -0.8674131, 0, 0.0627451, 1, 1,
0.4796755, -1.267539, 1.93579, 0, 0.05882353, 1, 1,
0.4799136, -1.008671, 1.620934, 0, 0.05098039, 1, 1,
0.4806978, -1.616724, 1.207456, 0, 0.04705882, 1, 1,
0.4839222, -2.169282, 2.777586, 0, 0.03921569, 1, 1,
0.4840271, 0.3533302, 1.207273, 0, 0.03529412, 1, 1,
0.4852862, -0.9169447, 3.680051, 0, 0.02745098, 1, 1,
0.4904541, -1.43148, 3.069214, 0, 0.02352941, 1, 1,
0.4916593, 1.549113, 0.7209212, 0, 0.01568628, 1, 1,
0.4920915, -0.1548841, 1.635254, 0, 0.01176471, 1, 1,
0.4986104, 0.01632663, 2.980304, 0, 0.003921569, 1, 1,
0.5002937, -0.1819106, 1.35496, 0.003921569, 0, 1, 1,
0.5035856, 2.20273, -0.4783739, 0.007843138, 0, 1, 1,
0.506486, -0.2741627, 0.8335317, 0.01568628, 0, 1, 1,
0.5110941, -1.067915, 3.893788, 0.01960784, 0, 1, 1,
0.5111278, 1.385978, 0.9789516, 0.02745098, 0, 1, 1,
0.5137789, -0.04732954, 1.831301, 0.03137255, 0, 1, 1,
0.5213313, 1.012347, 0.007518189, 0.03921569, 0, 1, 1,
0.5220508, 0.7529957, -1.577843, 0.04313726, 0, 1, 1,
0.5274078, -1.94976, 3.36388, 0.05098039, 0, 1, 1,
0.5302787, 1.852791, -0.8435679, 0.05490196, 0, 1, 1,
0.5305789, 0.6822841, 2.687596, 0.0627451, 0, 1, 1,
0.530941, 1.335041, -0.3802624, 0.06666667, 0, 1, 1,
0.5333021, -1.407274, 2.514149, 0.07450981, 0, 1, 1,
0.5334678, 1.865074, 0.3151156, 0.07843138, 0, 1, 1,
0.5378125, -1.297793, 2.60377, 0.08627451, 0, 1, 1,
0.5382152, 0.03919952, 1.992286, 0.09019608, 0, 1, 1,
0.5399636, -0.9945293, 0.9528458, 0.09803922, 0, 1, 1,
0.5448249, 1.085182, 0.2555013, 0.1058824, 0, 1, 1,
0.5478958, 0.04950177, 1.545708, 0.1098039, 0, 1, 1,
0.5490272, -0.01036616, 3.44547, 0.1176471, 0, 1, 1,
0.5542054, -0.7930915, 3.529462, 0.1215686, 0, 1, 1,
0.5564062, -1.697885, 0.9206244, 0.1294118, 0, 1, 1,
0.5598524, 0.07287608, 0.3605626, 0.1333333, 0, 1, 1,
0.5652125, 0.9834922, 0.3665728, 0.1411765, 0, 1, 1,
0.5680405, -1.95191, 2.10426, 0.145098, 0, 1, 1,
0.5729985, -0.4021171, 2.846969, 0.1529412, 0, 1, 1,
0.5786386, 0.8305973, 1.338247, 0.1568628, 0, 1, 1,
0.5813017, -0.245883, 1.397637, 0.1647059, 0, 1, 1,
0.5893828, 1.081443, 0.4500515, 0.1686275, 0, 1, 1,
0.5938305, 1.09549, 0.4976014, 0.1764706, 0, 1, 1,
0.5941769, 0.7981731, 0.9959913, 0.1803922, 0, 1, 1,
0.5963129, -0.9255376, 2.247144, 0.1882353, 0, 1, 1,
0.5982646, -0.2412739, 1.490016, 0.1921569, 0, 1, 1,
0.6007338, -0.7494722, 2.729674, 0.2, 0, 1, 1,
0.6016961, -0.3322318, 1.603189, 0.2078431, 0, 1, 1,
0.6025164, 0.5426855, 0.8467531, 0.2117647, 0, 1, 1,
0.6044729, 1.286399, -0.4337963, 0.2196078, 0, 1, 1,
0.607225, -1.344025, 1.945146, 0.2235294, 0, 1, 1,
0.6110553, -0.3561236, 2.650163, 0.2313726, 0, 1, 1,
0.6110919, 0.4341893, 1.17831, 0.2352941, 0, 1, 1,
0.6131601, -0.7265264, 2.26964, 0.2431373, 0, 1, 1,
0.6145543, -0.959691, 4.045623, 0.2470588, 0, 1, 1,
0.6147243, 0.4808326, 0.4698266, 0.254902, 0, 1, 1,
0.6157607, 0.9209258, -0.1140812, 0.2588235, 0, 1, 1,
0.6170822, -1.172868, 2.373089, 0.2666667, 0, 1, 1,
0.6177179, 1.096438, 0.2098636, 0.2705882, 0, 1, 1,
0.6189722, 0.7729072, -1.275937, 0.2784314, 0, 1, 1,
0.6212167, 1.082119, -0.7186952, 0.282353, 0, 1, 1,
0.6212803, 0.322749, 2.775225, 0.2901961, 0, 1, 1,
0.6245862, -1.655919, 4.013976, 0.2941177, 0, 1, 1,
0.6252543, -0.2889472, 1.742915, 0.3019608, 0, 1, 1,
0.6290323, -1.202412, 3.502149, 0.3098039, 0, 1, 1,
0.6351966, -0.3784118, 0.8933721, 0.3137255, 0, 1, 1,
0.6362072, 0.6736537, 0.5354591, 0.3215686, 0, 1, 1,
0.6408563, 1.661564, 2.288676, 0.3254902, 0, 1, 1,
0.6455948, 0.6840129, 2.187349, 0.3333333, 0, 1, 1,
0.6467183, 1.602482, 0.7692769, 0.3372549, 0, 1, 1,
0.6468045, -1.339794, 3.323609, 0.345098, 0, 1, 1,
0.6469933, -0.2968121, 1.941782, 0.3490196, 0, 1, 1,
0.6483497, -0.9449646, 2.180679, 0.3568628, 0, 1, 1,
0.6564858, 2.352315, 1.373963, 0.3607843, 0, 1, 1,
0.6587807, 1.028028, 1.189751, 0.3686275, 0, 1, 1,
0.6598067, -0.808131, 3.234889, 0.372549, 0, 1, 1,
0.6649239, -0.8519578, 2.17407, 0.3803922, 0, 1, 1,
0.6681367, 0.1126423, 1.269932, 0.3843137, 0, 1, 1,
0.6684605, 0.1563676, 1.329638, 0.3921569, 0, 1, 1,
0.6705044, -1.508467, 3.158975, 0.3960784, 0, 1, 1,
0.6789473, 0.3467957, 1.467187, 0.4039216, 0, 1, 1,
0.6846535, 0.2756323, -0.8821815, 0.4117647, 0, 1, 1,
0.6859708, -0.4253885, 1.781675, 0.4156863, 0, 1, 1,
0.6875228, 0.4693054, 1.292249, 0.4235294, 0, 1, 1,
0.6878299, -1.230797, 4.645409, 0.427451, 0, 1, 1,
0.6887694, -0.4206012, 3.100101, 0.4352941, 0, 1, 1,
0.6916714, 1.078155, 0.7435933, 0.4392157, 0, 1, 1,
0.6945406, 1.383187, 0.9114044, 0.4470588, 0, 1, 1,
0.7017309, -1.143359, 1.098642, 0.4509804, 0, 1, 1,
0.7075164, 0.539609, 1.067184, 0.4588235, 0, 1, 1,
0.7153333, -0.7635769, 3.450639, 0.4627451, 0, 1, 1,
0.7158309, -2.21354, 2.809845, 0.4705882, 0, 1, 1,
0.719112, -0.6151181, 2.375306, 0.4745098, 0, 1, 1,
0.7271022, -0.08956769, 2.258165, 0.4823529, 0, 1, 1,
0.7299668, -0.2382759, 3.174775, 0.4862745, 0, 1, 1,
0.7321839, -1.16934, 1.948496, 0.4941176, 0, 1, 1,
0.7354749, -0.406476, 3.247714, 0.5019608, 0, 1, 1,
0.7367069, 0.1630934, 2.001291, 0.5058824, 0, 1, 1,
0.7375846, 0.6051947, 1.220252, 0.5137255, 0, 1, 1,
0.7385691, -0.2972147, 1.964279, 0.5176471, 0, 1, 1,
0.746922, 1.997725, -0.5375062, 0.5254902, 0, 1, 1,
0.7470291, -0.6366695, 1.364117, 0.5294118, 0, 1, 1,
0.7540632, -1.263375, 2.144678, 0.5372549, 0, 1, 1,
0.7545197, -1.12837, 2.20288, 0.5411765, 0, 1, 1,
0.7545996, -0.5309031, 3.392442, 0.5490196, 0, 1, 1,
0.7549655, -1.396429, 2.225158, 0.5529412, 0, 1, 1,
0.755433, 0.4031215, -0.4423786, 0.5607843, 0, 1, 1,
0.7567312, -1.284636, 2.037975, 0.5647059, 0, 1, 1,
0.7587069, 0.6784125, 0.6348956, 0.572549, 0, 1, 1,
0.7615921, 0.6362588, 0.6579456, 0.5764706, 0, 1, 1,
0.7620065, -0.2749864, 2.692729, 0.5843138, 0, 1, 1,
0.7677977, 0.6106349, 0.2762771, 0.5882353, 0, 1, 1,
0.7715994, 1.111012, 1.392202, 0.5960785, 0, 1, 1,
0.7764512, -0.2801591, 0.6059852, 0.6039216, 0, 1, 1,
0.7791998, 1.101269, 0.4645786, 0.6078432, 0, 1, 1,
0.7827423, -1.832236, 2.817852, 0.6156863, 0, 1, 1,
0.7921923, 0.6061534, 2.04889, 0.6196079, 0, 1, 1,
0.794445, 0.4638636, 2.114486, 0.627451, 0, 1, 1,
0.7984407, -0.7844737, 3.031339, 0.6313726, 0, 1, 1,
0.8021938, 1.553926, 0.5402313, 0.6392157, 0, 1, 1,
0.8055359, 0.58917, 1.785291, 0.6431373, 0, 1, 1,
0.8089941, 1.848313, -0.465158, 0.6509804, 0, 1, 1,
0.8093541, -1.634974, 2.204767, 0.654902, 0, 1, 1,
0.8093589, -0.5742035, 3.979933, 0.6627451, 0, 1, 1,
0.8149537, 1.045389, 1.113226, 0.6666667, 0, 1, 1,
0.8152543, -1.420683, 2.089589, 0.6745098, 0, 1, 1,
0.8166221, -2.063169, 1.82427, 0.6784314, 0, 1, 1,
0.8233222, 1.649962, -1.029749, 0.6862745, 0, 1, 1,
0.8237444, 0.7922624, -0.5358912, 0.6901961, 0, 1, 1,
0.8262579, -0.5882098, 1.419034, 0.6980392, 0, 1, 1,
0.8324197, 0.6643494, 0.8717779, 0.7058824, 0, 1, 1,
0.8364294, -1.659339, 3.017543, 0.7098039, 0, 1, 1,
0.85311, 0.4213374, 1.641798, 0.7176471, 0, 1, 1,
0.8598199, 1.523292, -0.2295695, 0.7215686, 0, 1, 1,
0.8609021, -1.256291, 3.466097, 0.7294118, 0, 1, 1,
0.8617594, -0.2191831, 3.132938, 0.7333333, 0, 1, 1,
0.8623426, -0.5044379, 2.508162, 0.7411765, 0, 1, 1,
0.8707952, 1.295816, 1.290524, 0.7450981, 0, 1, 1,
0.8732905, -0.2225846, 1.147374, 0.7529412, 0, 1, 1,
0.8775563, -0.2771786, 2.187643, 0.7568628, 0, 1, 1,
0.8789802, -0.438457, 2.377031, 0.7647059, 0, 1, 1,
0.8799631, -1.53741, 2.839675, 0.7686275, 0, 1, 1,
0.8861235, 0.2706817, 1.52379, 0.7764706, 0, 1, 1,
0.8909602, 1.594879, 1.403964, 0.7803922, 0, 1, 1,
0.8912317, -0.3602109, 1.950102, 0.7882353, 0, 1, 1,
0.9063113, 0.7853874, 1.684125, 0.7921569, 0, 1, 1,
0.9076838, 0.5570676, 2.023893, 0.8, 0, 1, 1,
0.9080913, 0.4860976, 0.678197, 0.8078431, 0, 1, 1,
0.9118073, -1.473445, 3.815193, 0.8117647, 0, 1, 1,
0.9180984, 0.2023302, 2.284995, 0.8196079, 0, 1, 1,
0.9222525, -0.05899114, 2.173371, 0.8235294, 0, 1, 1,
0.924472, -0.1322607, 2.170604, 0.8313726, 0, 1, 1,
0.9305289, 0.7866981, -0.1016397, 0.8352941, 0, 1, 1,
0.9309904, -0.200301, 1.00094, 0.8431373, 0, 1, 1,
0.9332343, -0.4412654, 2.917328, 0.8470588, 0, 1, 1,
0.938596, -1.160836, 1.223397, 0.854902, 0, 1, 1,
0.9430385, -1.070239, 2.690079, 0.8588235, 0, 1, 1,
0.9502389, -0.6832356, 2.181442, 0.8666667, 0, 1, 1,
0.9515337, 0.5234195, 1.998367, 0.8705882, 0, 1, 1,
0.9541025, -1.25939, 1.724413, 0.8784314, 0, 1, 1,
0.9602086, -0.9529334, 2.851094, 0.8823529, 0, 1, 1,
0.9699053, 2.517171, 1.001226, 0.8901961, 0, 1, 1,
0.9719226, 0.03130307, 1.229724, 0.8941177, 0, 1, 1,
0.9742711, -0.2258437, 0.7139826, 0.9019608, 0, 1, 1,
0.9746274, 0.303125, 1.010949, 0.9098039, 0, 1, 1,
0.9970477, 0.8519369, 1.739737, 0.9137255, 0, 1, 1,
1.004117, 0.6639214, 0.1927999, 0.9215686, 0, 1, 1,
1.009666, -0.6874175, 1.456833, 0.9254902, 0, 1, 1,
1.010152, -0.7122595, 4.078817, 0.9333333, 0, 1, 1,
1.023667, -3.045282, 3.170321, 0.9372549, 0, 1, 1,
1.023676, 0.496562, 0.6947179, 0.945098, 0, 1, 1,
1.027878, -2.27895, 2.971625, 0.9490196, 0, 1, 1,
1.033074, 0.937776, -1.423565, 0.9568627, 0, 1, 1,
1.03343, -1.53062, 1.866759, 0.9607843, 0, 1, 1,
1.037885, -0.5757781, 3.156439, 0.9686275, 0, 1, 1,
1.045962, 1.301959, 2.810596, 0.972549, 0, 1, 1,
1.055946, 0.285899, 0.6472566, 0.9803922, 0, 1, 1,
1.058424, -0.09118078, 1.210134, 0.9843137, 0, 1, 1,
1.060394, 0.9776523, 0.488177, 0.9921569, 0, 1, 1,
1.070657, 0.5557082, 1.353425, 0.9960784, 0, 1, 1,
1.075988, 0.6876947, 1.78776, 1, 0, 0.9960784, 1,
1.088365, 0.2533801, 0.9349852, 1, 0, 0.9882353, 1,
1.088473, 2.000045, 0.9013734, 1, 0, 0.9843137, 1,
1.089795, 0.4213519, 1.113721, 1, 0, 0.9764706, 1,
1.095202, 0.9957827, 1.574467, 1, 0, 0.972549, 1,
1.10453, 0.8413987, -0.5791576, 1, 0, 0.9647059, 1,
1.113569, 1.787636, -0.2601156, 1, 0, 0.9607843, 1,
1.116845, 0.5262672, 0.7502583, 1, 0, 0.9529412, 1,
1.120853, 0.4715084, 0.1965348, 1, 0, 0.9490196, 1,
1.12402, -0.06101208, 2.673325, 1, 0, 0.9411765, 1,
1.126921, -0.1586141, 0.4652202, 1, 0, 0.9372549, 1,
1.129638, 0.5689204, 1.312617, 1, 0, 0.9294118, 1,
1.130327, 1.231607, -1.017874, 1, 0, 0.9254902, 1,
1.131591, 0.8727669, 0.7543184, 1, 0, 0.9176471, 1,
1.134883, -0.3550868, 1.4139, 1, 0, 0.9137255, 1,
1.13496, -1.140556, 2.088212, 1, 0, 0.9058824, 1,
1.141555, 2.19575, 2.686727, 1, 0, 0.9019608, 1,
1.143101, 1.063458, 2.17781, 1, 0, 0.8941177, 1,
1.143435, 0.523358, 0.7922519, 1, 0, 0.8862745, 1,
1.147495, -0.3696974, 0.1091163, 1, 0, 0.8823529, 1,
1.153397, -0.6145101, 1.595473, 1, 0, 0.8745098, 1,
1.153658, 0.7229788, 1.349826, 1, 0, 0.8705882, 1,
1.154419, -1.231723, 1.218469, 1, 0, 0.8627451, 1,
1.161033, 0.5059952, 2.489549, 1, 0, 0.8588235, 1,
1.169813, 0.1917387, 0.3100775, 1, 0, 0.8509804, 1,
1.177408, 0.4188341, 1.590095, 1, 0, 0.8470588, 1,
1.183271, 2.38451, 2.200974, 1, 0, 0.8392157, 1,
1.184872, -0.307857, 0.8171105, 1, 0, 0.8352941, 1,
1.185305, 1.391523, 0.9210857, 1, 0, 0.827451, 1,
1.188096, -2.245935, 4.776245, 1, 0, 0.8235294, 1,
1.205538, -1.757568, 2.485901, 1, 0, 0.8156863, 1,
1.206225, -1.663858, 1.700319, 1, 0, 0.8117647, 1,
1.209277, 0.3514105, 1.212825, 1, 0, 0.8039216, 1,
1.216333, 0.2281658, 2.933399, 1, 0, 0.7960784, 1,
1.216862, -0.5399911, 2.173559, 1, 0, 0.7921569, 1,
1.217271, -1.41425, 2.004259, 1, 0, 0.7843137, 1,
1.229099, 0.1999085, 2.039936, 1, 0, 0.7803922, 1,
1.230405, -0.1506882, 3.097176, 1, 0, 0.772549, 1,
1.236269, 0.5599134, 0.4018701, 1, 0, 0.7686275, 1,
1.237578, -0.1729293, 0.1735003, 1, 0, 0.7607843, 1,
1.239592, 1.657074, 0.2400353, 1, 0, 0.7568628, 1,
1.245136, -0.3462452, 2.730219, 1, 0, 0.7490196, 1,
1.249888, -0.3947418, 2.331324, 1, 0, 0.7450981, 1,
1.252226, -0.3447551, 2.131625, 1, 0, 0.7372549, 1,
1.254431, -0.305195, 1.461603, 1, 0, 0.7333333, 1,
1.255234, -0.7050096, 1.310964, 1, 0, 0.7254902, 1,
1.256663, -0.7824507, 2.183742, 1, 0, 0.7215686, 1,
1.280333, 0.6727104, 1.4733, 1, 0, 0.7137255, 1,
1.281558, 0.8930942, -1.16214, 1, 0, 0.7098039, 1,
1.283006, -0.1858677, 3.304066, 1, 0, 0.7019608, 1,
1.28984, 0.362337, 2.090664, 1, 0, 0.6941177, 1,
1.297906, -0.862551, 1.512803, 1, 0, 0.6901961, 1,
1.299788, 0.0009119142, 3.080592, 1, 0, 0.682353, 1,
1.305734, -1.179711, 2.031763, 1, 0, 0.6784314, 1,
1.309964, 0.7940363, 0.1707869, 1, 0, 0.6705883, 1,
1.315085, 1.041736, 0.7184511, 1, 0, 0.6666667, 1,
1.317638, -0.6273325, 1.229077, 1, 0, 0.6588235, 1,
1.322638, 1.275009, 1.506519, 1, 0, 0.654902, 1,
1.326179, 0.2924784, 1.912143, 1, 0, 0.6470588, 1,
1.331397, 2.273244, -0.1502154, 1, 0, 0.6431373, 1,
1.332162, 0.51805, 1.804659, 1, 0, 0.6352941, 1,
1.338894, -1.736883, 2.384953, 1, 0, 0.6313726, 1,
1.339773, 0.1733442, 1.362231, 1, 0, 0.6235294, 1,
1.348108, -1.246491, 2.271441, 1, 0, 0.6196079, 1,
1.351881, -0.4042844, 2.319014, 1, 0, 0.6117647, 1,
1.353427, -1.363602, 3.4621, 1, 0, 0.6078432, 1,
1.357424, 1.718868, 1.136287, 1, 0, 0.6, 1,
1.360091, -0.9670501, 3.293018, 1, 0, 0.5921569, 1,
1.360377, 0.04331196, 1.288719, 1, 0, 0.5882353, 1,
1.367531, 0.6638135, 0.7426344, 1, 0, 0.5803922, 1,
1.369108, -1.731626, 2.109459, 1, 0, 0.5764706, 1,
1.37346, -0.2151555, 2.455153, 1, 0, 0.5686275, 1,
1.37655, 0.1402913, 1.716052, 1, 0, 0.5647059, 1,
1.383066, -0.4162779, 3.667791, 1, 0, 0.5568628, 1,
1.383242, 0.6271486, 1.803361, 1, 0, 0.5529412, 1,
1.385756, 0.4507078, 1.07604, 1, 0, 0.5450981, 1,
1.388817, 0.2631838, 1.890767, 1, 0, 0.5411765, 1,
1.391039, -0.8540468, 1.161088, 1, 0, 0.5333334, 1,
1.391526, -1.309604, 2.352883, 1, 0, 0.5294118, 1,
1.394548, -0.8069305, 2.788512, 1, 0, 0.5215687, 1,
1.409177, -1.570567, 3.652094, 1, 0, 0.5176471, 1,
1.412254, 0.3400699, 1.436532, 1, 0, 0.509804, 1,
1.41356, -0.7465481, 1.68146, 1, 0, 0.5058824, 1,
1.414105, -0.5389361, 0.9085641, 1, 0, 0.4980392, 1,
1.419709, 1.551526, 1.530177, 1, 0, 0.4901961, 1,
1.425152, -0.1796995, 2.767273, 1, 0, 0.4862745, 1,
1.440202, -0.4723021, 1.819324, 1, 0, 0.4784314, 1,
1.45195, -0.7078215, 2.83629, 1, 0, 0.4745098, 1,
1.457097, -0.2105005, 2.507091, 1, 0, 0.4666667, 1,
1.458714, -1.270479, 1.104861, 1, 0, 0.4627451, 1,
1.460384, 0.06048815, 2.000663, 1, 0, 0.454902, 1,
1.465536, 0.7991472, 0.4524917, 1, 0, 0.4509804, 1,
1.469556, 0.3084461, 1.211402, 1, 0, 0.4431373, 1,
1.472312, -0.3470633, 2.224639, 1, 0, 0.4392157, 1,
1.474999, -0.8792552, 2.519089, 1, 0, 0.4313726, 1,
1.481546, -1.337242, 3.883573, 1, 0, 0.427451, 1,
1.482911, -0.2316106, 2.945908, 1, 0, 0.4196078, 1,
1.483012, 1.47671, 1.836365, 1, 0, 0.4156863, 1,
1.485602, 0.633924, -0.9787298, 1, 0, 0.4078431, 1,
1.512988, -0.009902249, -0.4112563, 1, 0, 0.4039216, 1,
1.522682, -0.8946651, 2.384684, 1, 0, 0.3960784, 1,
1.528612, -0.7001121, 2.269431, 1, 0, 0.3882353, 1,
1.540279, 0.2938057, 2.588907, 1, 0, 0.3843137, 1,
1.547436, -0.2245044, 2.443912, 1, 0, 0.3764706, 1,
1.549428, 0.4373446, 1.599768, 1, 0, 0.372549, 1,
1.557246, 1.863197, 1.437069, 1, 0, 0.3647059, 1,
1.562821, -1.544942, 1.625632, 1, 0, 0.3607843, 1,
1.569833, -2.339711, 2.484339, 1, 0, 0.3529412, 1,
1.571051, 0.06356842, 1.766352, 1, 0, 0.3490196, 1,
1.58156, -0.8328903, 1.407047, 1, 0, 0.3411765, 1,
1.614421, -0.07910716, 0.3772036, 1, 0, 0.3372549, 1,
1.624832, -1.268195, 3.170051, 1, 0, 0.3294118, 1,
1.626385, -0.04649449, 1.582411, 1, 0, 0.3254902, 1,
1.640068, 1.505684, 0.3797017, 1, 0, 0.3176471, 1,
1.669161, -1.166033, 2.750349, 1, 0, 0.3137255, 1,
1.671899, -1.821463, 2.381076, 1, 0, 0.3058824, 1,
1.682179, -1.416229, 1.10604, 1, 0, 0.2980392, 1,
1.683566, -0.3421401, 1.882356, 1, 0, 0.2941177, 1,
1.694848, -0.6333851, 2.67775, 1, 0, 0.2862745, 1,
1.703076, 1.461983, 1.15801, 1, 0, 0.282353, 1,
1.709444, 0.9413967, 1.762777, 1, 0, 0.2745098, 1,
1.725193, -0.9495277, -0.1443248, 1, 0, 0.2705882, 1,
1.726356, -1.450106, 1.973845, 1, 0, 0.2627451, 1,
1.735769, -1.941813, 2.081356, 1, 0, 0.2588235, 1,
1.736859, 1.392023, 1.907288, 1, 0, 0.2509804, 1,
1.737192, -0.4346331, 2.300737, 1, 0, 0.2470588, 1,
1.749702, -0.1643357, 3.400504, 1, 0, 0.2392157, 1,
1.801629, -0.4554439, 2.087436, 1, 0, 0.2352941, 1,
1.808339, 0.04072996, 2.229209, 1, 0, 0.227451, 1,
1.819252, -0.3946434, 1.928179, 1, 0, 0.2235294, 1,
1.825982, 0.723452, 2.119078, 1, 0, 0.2156863, 1,
1.827455, 1.300882, 1.557075, 1, 0, 0.2117647, 1,
1.828203, 0.1826625, 2.056019, 1, 0, 0.2039216, 1,
1.833708, 1.412139, 0.8373183, 1, 0, 0.1960784, 1,
1.838364, 0.6391374, 2.118339, 1, 0, 0.1921569, 1,
1.854067, -1.940721, 3.506752, 1, 0, 0.1843137, 1,
1.854093, -0.3543696, 1.98114, 1, 0, 0.1803922, 1,
1.861722, 0.3239289, 3.146896, 1, 0, 0.172549, 1,
1.862558, -0.2574326, 2.214975, 1, 0, 0.1686275, 1,
1.869248, -0.8791702, 2.715847, 1, 0, 0.1607843, 1,
1.902829, 0.1836273, 1.16935, 1, 0, 0.1568628, 1,
1.93385, 1.106549, 0.5348021, 1, 0, 0.1490196, 1,
1.934116, -0.4197622, 0.2756796, 1, 0, 0.145098, 1,
1.949079, 0.4610817, 0.9576134, 1, 0, 0.1372549, 1,
1.958812, -1.002433, 3.34896, 1, 0, 0.1333333, 1,
1.970527, 1.307101, 2.458719, 1, 0, 0.1254902, 1,
1.971162, 0.7820016, -0.6636599, 1, 0, 0.1215686, 1,
1.995287, 0.05638067, 0.9326937, 1, 0, 0.1137255, 1,
2.059916, 0.03243599, 1.089424, 1, 0, 0.1098039, 1,
2.076975, -0.9554529, 1.264045, 1, 0, 0.1019608, 1,
2.095325, -0.8851363, 1.764745, 1, 0, 0.09411765, 1,
2.146024, -1.092073, 2.773436, 1, 0, 0.09019608, 1,
2.189414, 1.077595, 1.091432, 1, 0, 0.08235294, 1,
2.197439, 0.1045873, 0.5882198, 1, 0, 0.07843138, 1,
2.330925, -1.583569, 1.949135, 1, 0, 0.07058824, 1,
2.388298, -1.115643, 1.362968, 1, 0, 0.06666667, 1,
2.432735, 1.487948, 1.288758, 1, 0, 0.05882353, 1,
2.442959, 2.422387, 1.08096, 1, 0, 0.05490196, 1,
2.496649, 0.5118701, 1.406577, 1, 0, 0.04705882, 1,
2.516886, -0.593713, 1.860595, 1, 0, 0.04313726, 1,
2.547111, -0.7417853, 0.3596219, 1, 0, 0.03529412, 1,
2.567633, 1.116587, 1.089208, 1, 0, 0.03137255, 1,
2.631914, 0.9925238, 1.186073, 1, 0, 0.02352941, 1,
2.635207, -0.1952736, 1.112958, 1, 0, 0.01960784, 1,
2.781442, 0.9843572, 0.7012307, 1, 0, 0.01176471, 1,
3.052652, -1.067354, 2.054446, 1, 0, 0.007843138, 1
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
-0.169874, -4.046471, -7.946886, 0, -0.5, 0.5, 0.5,
-0.169874, -4.046471, -7.946886, 1, -0.5, 0.5, 0.5,
-0.169874, -4.046471, -7.946886, 1, 1.5, 0.5, 0.5,
-0.169874, -4.046471, -7.946886, 0, 1.5, 0.5, 0.5
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
-4.484836, -0.09192419, -7.946886, 0, -0.5, 0.5, 0.5,
-4.484836, -0.09192419, -7.946886, 1, -0.5, 0.5, 0.5,
-4.484836, -0.09192419, -7.946886, 1, 1.5, 0.5, 0.5,
-4.484836, -0.09192419, -7.946886, 0, 1.5, 0.5, 0.5
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
-4.484836, -4.046471, -0.283916, 0, -0.5, 0.5, 0.5,
-4.484836, -4.046471, -0.283916, 1, -0.5, 0.5, 0.5,
-4.484836, -4.046471, -0.283916, 1, 1.5, 0.5, 0.5,
-4.484836, -4.046471, -0.283916, 0, 1.5, 0.5, 0.5
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
-3, -3.133883, -6.178508,
3, -3.133883, -6.178508,
-3, -3.133883, -6.178508,
-3, -3.285981, -6.473238,
-2, -3.133883, -6.178508,
-2, -3.285981, -6.473238,
-1, -3.133883, -6.178508,
-1, -3.285981, -6.473238,
0, -3.133883, -6.178508,
0, -3.285981, -6.473238,
1, -3.133883, -6.178508,
1, -3.285981, -6.473238,
2, -3.133883, -6.178508,
2, -3.285981, -6.473238,
3, -3.133883, -6.178508,
3, -3.285981, -6.473238
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
-3, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
-3, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
-3, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
-3, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5,
-2, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
-2, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
-2, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
-2, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5,
-1, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
-1, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
-1, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
-1, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5,
0, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
0, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
0, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
0, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5,
1, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
1, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
1, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
1, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5,
2, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
2, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
2, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
2, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5,
3, -3.590177, -7.062697, 0, -0.5, 0.5, 0.5,
3, -3.590177, -7.062697, 1, -0.5, 0.5, 0.5,
3, -3.590177, -7.062697, 1, 1.5, 0.5, 0.5,
3, -3.590177, -7.062697, 0, 1.5, 0.5, 0.5
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
-3.489075, -3, -6.178508,
-3.489075, 2, -6.178508,
-3.489075, -3, -6.178508,
-3.655035, -3, -6.473238,
-3.489075, -2, -6.178508,
-3.655035, -2, -6.473238,
-3.489075, -1, -6.178508,
-3.655035, -1, -6.473238,
-3.489075, 0, -6.178508,
-3.655035, 0, -6.473238,
-3.489075, 1, -6.178508,
-3.655035, 1, -6.473238,
-3.489075, 2, -6.178508,
-3.655035, 2, -6.473238
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
-3.986955, -3, -7.062697, 0, -0.5, 0.5, 0.5,
-3.986955, -3, -7.062697, 1, -0.5, 0.5, 0.5,
-3.986955, -3, -7.062697, 1, 1.5, 0.5, 0.5,
-3.986955, -3, -7.062697, 0, 1.5, 0.5, 0.5,
-3.986955, -2, -7.062697, 0, -0.5, 0.5, 0.5,
-3.986955, -2, -7.062697, 1, -0.5, 0.5, 0.5,
-3.986955, -2, -7.062697, 1, 1.5, 0.5, 0.5,
-3.986955, -2, -7.062697, 0, 1.5, 0.5, 0.5,
-3.986955, -1, -7.062697, 0, -0.5, 0.5, 0.5,
-3.986955, -1, -7.062697, 1, -0.5, 0.5, 0.5,
-3.986955, -1, -7.062697, 1, 1.5, 0.5, 0.5,
-3.986955, -1, -7.062697, 0, 1.5, 0.5, 0.5,
-3.986955, 0, -7.062697, 0, -0.5, 0.5, 0.5,
-3.986955, 0, -7.062697, 1, -0.5, 0.5, 0.5,
-3.986955, 0, -7.062697, 1, 1.5, 0.5, 0.5,
-3.986955, 0, -7.062697, 0, 1.5, 0.5, 0.5,
-3.986955, 1, -7.062697, 0, -0.5, 0.5, 0.5,
-3.986955, 1, -7.062697, 1, -0.5, 0.5, 0.5,
-3.986955, 1, -7.062697, 1, 1.5, 0.5, 0.5,
-3.986955, 1, -7.062697, 0, 1.5, 0.5, 0.5,
-3.986955, 2, -7.062697, 0, -0.5, 0.5, 0.5,
-3.986955, 2, -7.062697, 1, -0.5, 0.5, 0.5,
-3.986955, 2, -7.062697, 1, 1.5, 0.5, 0.5,
-3.986955, 2, -7.062697, 0, 1.5, 0.5, 0.5
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
-3.489075, -3.133883, -6,
-3.489075, -3.133883, 4,
-3.489075, -3.133883, -6,
-3.655035, -3.285981, -6,
-3.489075, -3.133883, -4,
-3.655035, -3.285981, -4,
-3.489075, -3.133883, -2,
-3.655035, -3.285981, -2,
-3.489075, -3.133883, 0,
-3.655035, -3.285981, 0,
-3.489075, -3.133883, 2,
-3.655035, -3.285981, 2,
-3.489075, -3.133883, 4,
-3.655035, -3.285981, 4
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
"-6",
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
-3.986955, -3.590177, -6, 0, -0.5, 0.5, 0.5,
-3.986955, -3.590177, -6, 1, -0.5, 0.5, 0.5,
-3.986955, -3.590177, -6, 1, 1.5, 0.5, 0.5,
-3.986955, -3.590177, -6, 0, 1.5, 0.5, 0.5,
-3.986955, -3.590177, -4, 0, -0.5, 0.5, 0.5,
-3.986955, -3.590177, -4, 1, -0.5, 0.5, 0.5,
-3.986955, -3.590177, -4, 1, 1.5, 0.5, 0.5,
-3.986955, -3.590177, -4, 0, 1.5, 0.5, 0.5,
-3.986955, -3.590177, -2, 0, -0.5, 0.5, 0.5,
-3.986955, -3.590177, -2, 1, -0.5, 0.5, 0.5,
-3.986955, -3.590177, -2, 1, 1.5, 0.5, 0.5,
-3.986955, -3.590177, -2, 0, 1.5, 0.5, 0.5,
-3.986955, -3.590177, 0, 0, -0.5, 0.5, 0.5,
-3.986955, -3.590177, 0, 1, -0.5, 0.5, 0.5,
-3.986955, -3.590177, 0, 1, 1.5, 0.5, 0.5,
-3.986955, -3.590177, 0, 0, 1.5, 0.5, 0.5,
-3.986955, -3.590177, 2, 0, -0.5, 0.5, 0.5,
-3.986955, -3.590177, 2, 1, -0.5, 0.5, 0.5,
-3.986955, -3.590177, 2, 1, 1.5, 0.5, 0.5,
-3.986955, -3.590177, 2, 0, 1.5, 0.5, 0.5,
-3.986955, -3.590177, 4, 0, -0.5, 0.5, 0.5,
-3.986955, -3.590177, 4, 1, -0.5, 0.5, 0.5,
-3.986955, -3.590177, 4, 1, 1.5, 0.5, 0.5,
-3.986955, -3.590177, 4, 0, 1.5, 0.5, 0.5
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
-3.489075, -3.133883, -6.178508,
-3.489075, 2.950035, -6.178508,
-3.489075, -3.133883, 5.610676,
-3.489075, 2.950035, 5.610676,
-3.489075, -3.133883, -6.178508,
-3.489075, -3.133883, 5.610676,
-3.489075, 2.950035, -6.178508,
-3.489075, 2.950035, 5.610676,
-3.489075, -3.133883, -6.178508,
3.149328, -3.133883, -6.178508,
-3.489075, -3.133883, 5.610676,
3.149328, -3.133883, 5.610676,
-3.489075, 2.950035, -6.178508,
3.149328, 2.950035, -6.178508,
-3.489075, 2.950035, 5.610676,
3.149328, 2.950035, 5.610676,
3.149328, -3.133883, -6.178508,
3.149328, 2.950035, -6.178508,
3.149328, -3.133883, 5.610676,
3.149328, 2.950035, 5.610676,
3.149328, -3.133883, -6.178508,
3.149328, -3.133883, 5.610676,
3.149328, 2.950035, -6.178508,
3.149328, 2.950035, 5.610676
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
var radius = 7.921424;
var distance = 35.24331;
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
mvMatrix.translate( 0.169874, 0.09192419, 0.283916 );
mvMatrix.scale( 1.29019, 1.407777, 0.7264963 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.24331);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
piperidine-1-carboth<-read.table("piperidine-1-carboth.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-piperidine-1-carboth$V2
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
```

```r
y<-piperidine-1-carboth$V3
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
```

```r
z<-piperidine-1-carboth$V4
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
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
-3.3924, -2.575587, -3.367718, 0, 0, 1, 1, 1,
-3.057438, 1.688819, -0.5338687, 1, 0, 0, 1, 1,
-2.745132, -0.6233019, -1.256197, 1, 0, 0, 1, 1,
-2.744194, -2.649945, -2.297632, 1, 0, 0, 1, 1,
-2.740545, 0.3844801, -2.824249, 1, 0, 0, 1, 1,
-2.545675, 0.9082243, -2.606519, 1, 0, 0, 1, 1,
-2.537731, 0.01927719, -2.493971, 0, 0, 0, 1, 1,
-2.457808, 0.7979657, 0.6233653, 0, 0, 0, 1, 1,
-2.457241, -1.86977, -3.025012, 0, 0, 0, 1, 1,
-2.409181, -0.05098251, -1.245407, 0, 0, 0, 1, 1,
-2.381461, 0.1772172, -1.83418, 0, 0, 0, 1, 1,
-2.261057, -1.226848, -2.627476, 0, 0, 0, 1, 1,
-2.239987, -0.2426644, -1.98841, 0, 0, 0, 1, 1,
-2.225722, 1.265121, -3.025915, 1, 1, 1, 1, 1,
-2.221989, 0.4948742, -0.6104565, 1, 1, 1, 1, 1,
-2.217649, 0.4587867, -2.91624, 1, 1, 1, 1, 1,
-2.130792, -1.026893, -1.417832, 1, 1, 1, 1, 1,
-2.121354, 0.9205484, -2.24871, 1, 1, 1, 1, 1,
-2.12058, -0.9592668, -3.004196, 1, 1, 1, 1, 1,
-2.112678, 0.5218965, -0.9031634, 1, 1, 1, 1, 1,
-2.079716, 0.9830716, -0.1082133, 1, 1, 1, 1, 1,
-2.052193, -0.5241809, -2.573097, 1, 1, 1, 1, 1,
-2.009325, -0.08013457, -1.630716, 1, 1, 1, 1, 1,
-1.994523, 0.6797121, 0.09887804, 1, 1, 1, 1, 1,
-1.938183, -0.3336193, -2.513085, 1, 1, 1, 1, 1,
-1.907815, -0.541641, -2.85215, 1, 1, 1, 1, 1,
-1.902934, 0.894935, -1.185432, 1, 1, 1, 1, 1,
-1.891209, 0.07448579, -1.709186, 1, 1, 1, 1, 1,
-1.890752, 0.06205309, -0.9622118, 0, 0, 1, 1, 1,
-1.864785, -0.6120908, -1.111038, 1, 0, 0, 1, 1,
-1.847988, -0.08546677, -2.058525, 1, 0, 0, 1, 1,
-1.836098, 1.242575, 0.5734538, 1, 0, 0, 1, 1,
-1.831007, 0.1552142, -0.7179906, 1, 0, 0, 1, 1,
-1.811932, 0.8244299, 0.2216014, 1, 0, 0, 1, 1,
-1.803528, 1.284451, -0.3169719, 0, 0, 0, 1, 1,
-1.802171, 1.07501, -1.922089, 0, 0, 0, 1, 1,
-1.795993, 0.4768353, -0.900767, 0, 0, 0, 1, 1,
-1.795062, 0.1551367, -0.7617263, 0, 0, 0, 1, 1,
-1.765657, 0.06764208, -0.528551, 0, 0, 0, 1, 1,
-1.747256, -0.487262, 0.2723376, 0, 0, 0, 1, 1,
-1.742508, 1.258045, -1.223725, 0, 0, 0, 1, 1,
-1.740234, 0.5255222, -1.356593, 1, 1, 1, 1, 1,
-1.732868, -0.6813554, -1.349579, 1, 1, 1, 1, 1,
-1.722119, 0.5136482, -0.4642589, 1, 1, 1, 1, 1,
-1.712126, 1.101222, -1.791168, 1, 1, 1, 1, 1,
-1.711282, -0.4882973, -1.229827, 1, 1, 1, 1, 1,
-1.707647, -1.5602, -3.578414, 1, 1, 1, 1, 1,
-1.684511, -1.86142, -3.139922, 1, 1, 1, 1, 1,
-1.664199, 0.9211748, 0.07348381, 1, 1, 1, 1, 1,
-1.659518, -0.08950476, -0.5500727, 1, 1, 1, 1, 1,
-1.655489, -0.5819554, -2.406238, 1, 1, 1, 1, 1,
-1.652195, -0.5062836, -1.500068, 1, 1, 1, 1, 1,
-1.606867, 0.415544, -1.604837, 1, 1, 1, 1, 1,
-1.581123, 0.3107977, 0.1406984, 1, 1, 1, 1, 1,
-1.562814, 0.6961497, -0.667637, 1, 1, 1, 1, 1,
-1.560445, 1.091743, -1.881865, 1, 1, 1, 1, 1,
-1.550158, 0.5073295, -1.668016, 0, 0, 1, 1, 1,
-1.538662, 0.2533789, -0.8852783, 1, 0, 0, 1, 1,
-1.530393, -0.3516193, -1.860871, 1, 0, 0, 1, 1,
-1.529036, 1.107714, -3.038752, 1, 0, 0, 1, 1,
-1.520672, 1.750685, -2.361246, 1, 0, 0, 1, 1,
-1.495814, 0.2770785, -1.718957, 1, 0, 0, 1, 1,
-1.489766, -0.386289, -0.3462279, 0, 0, 0, 1, 1,
-1.473247, 0.1284228, -1.361383, 0, 0, 0, 1, 1,
-1.468883, 0.1402193, -0.6368576, 0, 0, 0, 1, 1,
-1.468083, -0.4835743, -4.096328, 0, 0, 0, 1, 1,
-1.462809, -0.6322385, -1.495422, 0, 0, 0, 1, 1,
-1.462264, -1.079261, -4.032931, 0, 0, 0, 1, 1,
-1.458818, 0.0353932, -1.810361, 0, 0, 0, 1, 1,
-1.4513, 1.347685, -0.3153401, 1, 1, 1, 1, 1,
-1.449518, 0.7538489, -1.69785, 1, 1, 1, 1, 1,
-1.422878, -0.8633723, -2.047348, 1, 1, 1, 1, 1,
-1.402323, 0.2614445, -1.854125, 1, 1, 1, 1, 1,
-1.393584, -1.282878, -3.114208, 1, 1, 1, 1, 1,
-1.39171, 0.03731918, -2.220331, 1, 1, 1, 1, 1,
-1.389311, 0.1381852, -0.6769756, 1, 1, 1, 1, 1,
-1.37443, 0.4476378, -2.056762, 1, 1, 1, 1, 1,
-1.371455, -2.256639, -2.251996, 1, 1, 1, 1, 1,
-1.370665, -0.4476565, -1.586637, 1, 1, 1, 1, 1,
-1.367697, -1.044088, -0.921656, 1, 1, 1, 1, 1,
-1.35595, 0.3270843, -4.042544, 1, 1, 1, 1, 1,
-1.355851, 1.063702, -1.756836, 1, 1, 1, 1, 1,
-1.348328, -0.5612193, -0.3037892, 1, 1, 1, 1, 1,
-1.34699, 0.5542248, -0.5696672, 1, 1, 1, 1, 1,
-1.342597, -0.08125929, 0.4987127, 0, 0, 1, 1, 1,
-1.336151, -1.114643, -2.160502, 1, 0, 0, 1, 1,
-1.329516, 0.1682379, -0.5182902, 1, 0, 0, 1, 1,
-1.322064, -0.1458042, -2.503759, 1, 0, 0, 1, 1,
-1.319838, -1.353228, -1.149795, 1, 0, 0, 1, 1,
-1.316701, 0.2821714, -0.4142304, 1, 0, 0, 1, 1,
-1.307546, -0.3563522, -1.745106, 0, 0, 0, 1, 1,
-1.30693, -1.379501, -3.95021, 0, 0, 0, 1, 1,
-1.297067, -0.8139029, -2.809711, 0, 0, 0, 1, 1,
-1.289214, 1.704873, -0.6194721, 0, 0, 0, 1, 1,
-1.287281, 1.010768, -0.08691208, 0, 0, 0, 1, 1,
-1.283502, 0.09342109, -0.2234583, 0, 0, 0, 1, 1,
-1.273269, -1.205314, -2.025111, 0, 0, 0, 1, 1,
-1.265084, 0.6529705, -3.291651, 1, 1, 1, 1, 1,
-1.239326, -0.1593351, -0.3805056, 1, 1, 1, 1, 1,
-1.229779, 1.661986, 1.314992, 1, 1, 1, 1, 1,
-1.226772, -0.1338795, 0.1566437, 1, 1, 1, 1, 1,
-1.226393, -0.02967525, -2.795689, 1, 1, 1, 1, 1,
-1.223912, -0.3893428, -2.141909, 1, 1, 1, 1, 1,
-1.223408, 2.861434, 0.6843289, 1, 1, 1, 1, 1,
-1.222729, 0.4721545, -1.784917, 1, 1, 1, 1, 1,
-1.217011, -2.00897, -1.535051, 1, 1, 1, 1, 1,
-1.202964, 1.052143, -0.01352806, 1, 1, 1, 1, 1,
-1.200896, 1.567567, -1.396547, 1, 1, 1, 1, 1,
-1.200215, 2.40416, -1.349155, 1, 1, 1, 1, 1,
-1.196833, -0.1758511, -0.3986897, 1, 1, 1, 1, 1,
-1.193094, -0.8147262, -2.419682, 1, 1, 1, 1, 1,
-1.193048, -1.58346, -0.5846727, 1, 1, 1, 1, 1,
-1.188734, 1.247723, -0.03016034, 0, 0, 1, 1, 1,
-1.188432, 1.142255, -1.363408, 1, 0, 0, 1, 1,
-1.184606, 0.4019916, -1.252396, 1, 0, 0, 1, 1,
-1.175436, -0.7511278, -1.642987, 1, 0, 0, 1, 1,
-1.174497, -0.4703164, -3.212831, 1, 0, 0, 1, 1,
-1.171118, 0.2318101, -0.9207016, 1, 0, 0, 1, 1,
-1.169374, -1.417323, -3.235971, 0, 0, 0, 1, 1,
-1.167849, -0.001348758, -0.2762609, 0, 0, 0, 1, 1,
-1.159831, -2.125578, -0.8303251, 0, 0, 0, 1, 1,
-1.148462, -0.6937319, -2.010518, 0, 0, 0, 1, 1,
-1.139187, -0.6900602, -3.559721, 0, 0, 0, 1, 1,
-1.125422, -0.2421189, 0.3604319, 0, 0, 0, 1, 1,
-1.124421, -0.5002381, -3.345155, 0, 0, 0, 1, 1,
-1.122199, 0.2469119, -0.7941259, 1, 1, 1, 1, 1,
-1.119304, 0.2829339, 0.06756642, 1, 1, 1, 1, 1,
-1.110683, 1.106095, 0.4579672, 1, 1, 1, 1, 1,
-1.109413, -0.2338323, 0.2520122, 1, 1, 1, 1, 1,
-1.099264, 0.7397108, 0.8322634, 1, 1, 1, 1, 1,
-1.094679, -0.005523304, -0.9784598, 1, 1, 1, 1, 1,
-1.079308, -0.126997, -3.276463, 1, 1, 1, 1, 1,
-1.074121, -0.6207302, -0.8925335, 1, 1, 1, 1, 1,
-1.071553, 0.6196322, -1.851732, 1, 1, 1, 1, 1,
-1.070381, -0.6164357, -2.066436, 1, 1, 1, 1, 1,
-1.069011, 0.1820437, -1.112606, 1, 1, 1, 1, 1,
-1.064551, -1.904313, -2.616399, 1, 1, 1, 1, 1,
-1.062394, 0.9806332, -1.400819, 1, 1, 1, 1, 1,
-1.061795, -0.8118358, -1.767993, 1, 1, 1, 1, 1,
-1.06118, -1.676891, -1.576685, 1, 1, 1, 1, 1,
-1.045462, -0.4497779, -1.573933, 0, 0, 1, 1, 1,
-1.042071, 0.365012, -2.428552, 1, 0, 0, 1, 1,
-1.038959, -1.298288, -1.714843, 1, 0, 0, 1, 1,
-1.037611, -0.5270822, -2.061387, 1, 0, 0, 1, 1,
-1.018616, 1.417261, 0.8630568, 1, 0, 0, 1, 1,
-1.017364, 0.8890717, -2.278131, 1, 0, 0, 1, 1,
-1.012697, -0.3003485, -2.64086, 0, 0, 0, 1, 1,
-1.010299, -0.6875252, -2.572047, 0, 0, 0, 1, 1,
-1.005834, 1.198621, 0.4041469, 0, 0, 0, 1, 1,
-1.005426, 0.3303699, -0.5987703, 0, 0, 0, 1, 1,
-1.002988, 0.39295, -2.406939, 0, 0, 0, 1, 1,
-0.9996673, 1.404217, -1.540976, 0, 0, 0, 1, 1,
-0.9934855, 1.209659, -0.7894228, 0, 0, 0, 1, 1,
-0.9893958, -0.6883324, -2.847247, 1, 1, 1, 1, 1,
-0.9876348, 0.5116108, -1.65054, 1, 1, 1, 1, 1,
-0.9851377, 0.7885427, -0.3919201, 1, 1, 1, 1, 1,
-0.9806914, 0.9930323, -0.6095487, 1, 1, 1, 1, 1,
-0.9783925, 0.3489099, -1.262383, 1, 1, 1, 1, 1,
-0.9778346, 0.4071366, -2.619606, 1, 1, 1, 1, 1,
-0.9776497, 0.691418, -3.701209, 1, 1, 1, 1, 1,
-0.9760644, 1.009996, -0.5025169, 1, 1, 1, 1, 1,
-0.9760587, -1.483177, -2.237535, 1, 1, 1, 1, 1,
-0.9701946, -0.7059482, -2.189296, 1, 1, 1, 1, 1,
-0.9662322, -1.911706, -2.119524, 1, 1, 1, 1, 1,
-0.9642166, 0.2536925, -2.54887, 1, 1, 1, 1, 1,
-0.9634621, -0.5698091, -2.483366, 1, 1, 1, 1, 1,
-0.9634027, -0.3613326, -2.579538, 1, 1, 1, 1, 1,
-0.9567356, -1.114058, -2.353505, 1, 1, 1, 1, 1,
-0.9566623, -0.2932587, -1.469852, 0, 0, 1, 1, 1,
-0.9397752, 1.053544, -0.4166895, 1, 0, 0, 1, 1,
-0.9393151, -0.9180787, -1.885541, 1, 0, 0, 1, 1,
-0.9386111, 1.381651, 0.2500342, 1, 0, 0, 1, 1,
-0.9368817, -1.863343, -3.804254, 1, 0, 0, 1, 1,
-0.9312192, 1.011751, 0.1334455, 1, 0, 0, 1, 1,
-0.9220517, 0.7526234, 1.868741, 0, 0, 0, 1, 1,
-0.9211941, -0.2745228, -2.537692, 0, 0, 0, 1, 1,
-0.9210709, -0.4145952, -2.270349, 0, 0, 0, 1, 1,
-0.9128253, -0.1385202, -1.016891, 0, 0, 0, 1, 1,
-0.9119697, 0.7818213, -0.1147193, 0, 0, 0, 1, 1,
-0.9103422, -0.04120422, -1.143348, 0, 0, 0, 1, 1,
-0.9087811, -1.466665, -0.9753021, 0, 0, 0, 1, 1,
-0.9019649, 1.755357, 0.05557349, 1, 1, 1, 1, 1,
-0.901899, 0.3851679, -0.3405759, 1, 1, 1, 1, 1,
-0.8981258, -1.84348, -3.349353, 1, 1, 1, 1, 1,
-0.8966084, -1.251978, -3.71678, 1, 1, 1, 1, 1,
-0.8925746, 0.4896277, 0.09874004, 1, 1, 1, 1, 1,
-0.8866724, 0.3191367, -1.547703, 1, 1, 1, 1, 1,
-0.8803941, 0.6468347, 0.3396516, 1, 1, 1, 1, 1,
-0.8801414, 0.6663352, 0.2525826, 1, 1, 1, 1, 1,
-0.8730853, -0.7209833, -2.873331, 1, 1, 1, 1, 1,
-0.8653958, 0.09726822, -2.021641, 1, 1, 1, 1, 1,
-0.8595863, 0.7689316, -0.7641231, 1, 1, 1, 1, 1,
-0.8541337, 1.26767, -0.5747277, 1, 1, 1, 1, 1,
-0.8539255, -1.097038, -2.179435, 1, 1, 1, 1, 1,
-0.8534772, 0.5967991, -0.3177353, 1, 1, 1, 1, 1,
-0.8516558, 0.328796, -2.402344, 1, 1, 1, 1, 1,
-0.8447151, -0.5024282, -1.644526, 0, 0, 1, 1, 1,
-0.8375441, 1.33277, 0.2662979, 1, 0, 0, 1, 1,
-0.8362574, 0.08267044, -1.610289, 1, 0, 0, 1, 1,
-0.8354774, -0.1371798, -1.455762, 1, 0, 0, 1, 1,
-0.8350677, -1.322223, -3.194703, 1, 0, 0, 1, 1,
-0.8251394, 0.4165109, -0.4046065, 1, 0, 0, 1, 1,
-0.8233135, -1.640602, -2.808364, 0, 0, 0, 1, 1,
-0.8196352, -0.02386129, -1.491321, 0, 0, 0, 1, 1,
-0.818568, -0.4746026, -1.801568, 0, 0, 0, 1, 1,
-0.8168193, 0.2292041, -1.06195, 0, 0, 0, 1, 1,
-0.812901, -0.7050444, -1.452304, 0, 0, 0, 1, 1,
-0.8073816, -0.4431551, 0.01492052, 0, 0, 0, 1, 1,
-0.8065362, -0.9611908, -3.656981, 0, 0, 0, 1, 1,
-0.8035732, -1.600638, -3.360121, 1, 1, 1, 1, 1,
-0.8027027, 0.4490426, -0.4022917, 1, 1, 1, 1, 1,
-0.7860146, -1.251331, -0.4439804, 1, 1, 1, 1, 1,
-0.7814637, -0.2402664, -2.661263, 1, 1, 1, 1, 1,
-0.78036, -2.729991, -3.15751, 1, 1, 1, 1, 1,
-0.7802464, -0.8562748, -2.264696, 1, 1, 1, 1, 1,
-0.7752237, -1.156966, -4.447562, 1, 1, 1, 1, 1,
-0.7590796, 1.649588, 1.43251, 1, 1, 1, 1, 1,
-0.7542419, 1.658846, 1.47971, 1, 1, 1, 1, 1,
-0.7516923, -0.7822061, -2.958591, 1, 1, 1, 1, 1,
-0.7495488, 1.811356, -1.099612, 1, 1, 1, 1, 1,
-0.7281459, 0.8499492, -1.988412, 1, 1, 1, 1, 1,
-0.7277017, -1.478053, -2.418463, 1, 1, 1, 1, 1,
-0.72714, 0.6235601, -1.372643, 1, 1, 1, 1, 1,
-0.7189389, -1.854741, -2.116012, 1, 1, 1, 1, 1,
-0.714941, -0.5493589, -1.68892, 0, 0, 1, 1, 1,
-0.7145494, 0.3635858, -1.31736, 1, 0, 0, 1, 1,
-0.7127123, -0.9112849, -2.566042, 1, 0, 0, 1, 1,
-0.7120549, 1.098567, -0.6176735, 1, 0, 0, 1, 1,
-0.7097086, 0.7830797, -1.559967, 1, 0, 0, 1, 1,
-0.7061421, 0.2356017, -1.038046, 1, 0, 0, 1, 1,
-0.6996843, 0.8324058, -0.6385857, 0, 0, 0, 1, 1,
-0.6970322, -0.1686327, -2.329823, 0, 0, 0, 1, 1,
-0.6969694, -0.8213809, -2.505651, 0, 0, 0, 1, 1,
-0.6939999, 0.2225915, -1.624579, 0, 0, 0, 1, 1,
-0.6861766, -0.919401, -3.872183, 0, 0, 0, 1, 1,
-0.6810072, -1.439282, -1.160568, 0, 0, 0, 1, 1,
-0.6757783, -0.7611264, -1.528479, 0, 0, 0, 1, 1,
-0.6707898, -0.45147, -2.469804, 1, 1, 1, 1, 1,
-0.668156, -0.7198445, -1.564151, 1, 1, 1, 1, 1,
-0.6676683, -1.171696, -1.201836, 1, 1, 1, 1, 1,
-0.6651994, 0.406373, -0.8584808, 1, 1, 1, 1, 1,
-0.6607138, 1.553527, 0.2972239, 1, 1, 1, 1, 1,
-0.6596867, 0.2594471, -0.6288038, 1, 1, 1, 1, 1,
-0.6579733, 1.177058, -1.083317, 1, 1, 1, 1, 1,
-0.6544825, 1.549801, -2.960974, 1, 1, 1, 1, 1,
-0.6527078, 0.7652583, 0.2806546, 1, 1, 1, 1, 1,
-0.6478265, -0.1131142, -2.774298, 1, 1, 1, 1, 1,
-0.6361304, -0.393337, -2.98296, 1, 1, 1, 1, 1,
-0.6311594, 0.5370486, -1.306344, 1, 1, 1, 1, 1,
-0.6311549, 0.1764611, 0.2460707, 1, 1, 1, 1, 1,
-0.6285803, 0.9609349, -1.44028, 1, 1, 1, 1, 1,
-0.626991, 0.03111192, -0.8198113, 1, 1, 1, 1, 1,
-0.6257633, -0.8543518, -3.424314, 0, 0, 1, 1, 1,
-0.6232292, -0.6366463, -1.517807, 1, 0, 0, 1, 1,
-0.6229461, -1.227655, -1.840801, 1, 0, 0, 1, 1,
-0.6140506, -0.5829692, -3.950973, 1, 0, 0, 1, 1,
-0.6124653, -0.2454461, -2.200868, 1, 0, 0, 1, 1,
-0.6060902, -1.380764, -2.494753, 1, 0, 0, 1, 1,
-0.605801, -0.7801494, -3.988608, 0, 0, 0, 1, 1,
-0.6053984, 1.477166, -0.3494112, 0, 0, 0, 1, 1,
-0.6052349, 0.7480596, -1.95165, 0, 0, 0, 1, 1,
-0.6023172, 1.572764, -1.134003, 0, 0, 0, 1, 1,
-0.6009955, 1.17652, -0.5914105, 0, 0, 0, 1, 1,
-0.5996693, -1.791932, -3.844769, 0, 0, 0, 1, 1,
-0.5992659, -0.2865653, -1.824871, 0, 0, 0, 1, 1,
-0.5953819, -0.8018603, -2.522579, 1, 1, 1, 1, 1,
-0.5949847, -0.773468, -2.67427, 1, 1, 1, 1, 1,
-0.5937418, 1.222577, 0.0384367, 1, 1, 1, 1, 1,
-0.5888108, 0.2229402, -1.163312, 1, 1, 1, 1, 1,
-0.5847362, -0.8998296, -1.255403, 1, 1, 1, 1, 1,
-0.584622, 1.464419, 0.3845017, 1, 1, 1, 1, 1,
-0.5842024, -0.215558, -2.030288, 1, 1, 1, 1, 1,
-0.5823993, -0.07039265, -1.437057, 1, 1, 1, 1, 1,
-0.5811003, -2.219481, -3.836359, 1, 1, 1, 1, 1,
-0.5807971, 0.01963553, -1.562391, 1, 1, 1, 1, 1,
-0.5761278, -0.7366806, -0.4210435, 1, 1, 1, 1, 1,
-0.5674338, 0.2126208, -0.5948851, 1, 1, 1, 1, 1,
-0.5665634, 1.233496, -0.3527184, 1, 1, 1, 1, 1,
-0.5654857, -1.081938, -1.261592, 1, 1, 1, 1, 1,
-0.5606204, 0.7269073, -2.494791, 1, 1, 1, 1, 1,
-0.5588694, -0.442566, -3.503033, 0, 0, 1, 1, 1,
-0.5573928, -0.7555009, -2.624081, 1, 0, 0, 1, 1,
-0.5573692, -1.258438, -0.6699573, 1, 0, 0, 1, 1,
-0.554502, 2.001267, -0.3935941, 1, 0, 0, 1, 1,
-0.5525125, 0.559976, -1.801998, 1, 0, 0, 1, 1,
-0.5515985, 2.240559, 0.5002436, 1, 0, 0, 1, 1,
-0.5431004, -0.9579956, -1.731335, 0, 0, 0, 1, 1,
-0.5428649, 0.83628, 0.2099353, 0, 0, 0, 1, 1,
-0.5357198, 0.2564717, -1.755711, 0, 0, 0, 1, 1,
-0.532841, -2.519824, -4.372804, 0, 0, 0, 1, 1,
-0.5325643, -0.945324, -0.02990065, 0, 0, 0, 1, 1,
-0.5306838, -1.421607, -3.970854, 0, 0, 0, 1, 1,
-0.5279231, -1.097416, -2.772248, 0, 0, 0, 1, 1,
-0.5251082, 2.197775, -0.02854055, 1, 1, 1, 1, 1,
-0.5226734, -0.613381, -3.205743, 1, 1, 1, 1, 1,
-0.520063, -0.4044252, -1.550426, 1, 1, 1, 1, 1,
-0.5155048, 1.379677, 0.3419192, 1, 1, 1, 1, 1,
-0.5111232, -1.992422, -3.153665, 1, 1, 1, 1, 1,
-0.5096387, 0.9121976, -1.844041, 1, 1, 1, 1, 1,
-0.5091516, 1.600127, -0.3901689, 1, 1, 1, 1, 1,
-0.5073473, -0.2326276, -1.546318, 1, 1, 1, 1, 1,
-0.5015349, -0.2397315, -3.180839, 1, 1, 1, 1, 1,
-0.4980481, -0.1888966, -3.359668, 1, 1, 1, 1, 1,
-0.4975611, -0.4345698, -3.710399, 1, 1, 1, 1, 1,
-0.4929973, 0.902862, -2.224816, 1, 1, 1, 1, 1,
-0.4877564, 0.5018562, -0.3228265, 1, 1, 1, 1, 1,
-0.4861131, 1.323621, 0.1683966, 1, 1, 1, 1, 1,
-0.4844796, -0.5426664, -0.5062225, 1, 1, 1, 1, 1,
-0.4841641, 0.01520659, -1.923221, 0, 0, 1, 1, 1,
-0.4836296, 0.9787773, -2.004955, 1, 0, 0, 1, 1,
-0.4783158, -0.3763934, -1.19751, 1, 0, 0, 1, 1,
-0.477445, -0.3735069, -3.64355, 1, 0, 0, 1, 1,
-0.4750375, -0.5996186, -2.908799, 1, 0, 0, 1, 1,
-0.4736587, 0.4326542, -1.322625, 1, 0, 0, 1, 1,
-0.4720673, 1.678015, -0.621774, 0, 0, 0, 1, 1,
-0.4666052, -0.09836403, 0.376469, 0, 0, 0, 1, 1,
-0.4662838, -0.2866636, -2.061865, 0, 0, 0, 1, 1,
-0.4594528, 0.2885503, -0.9894717, 0, 0, 0, 1, 1,
-0.4578752, 0.01279757, -1.843312, 0, 0, 0, 1, 1,
-0.4543837, -0.9307624, -2.214628, 0, 0, 0, 1, 1,
-0.4529741, -1.250823, -1.992357, 0, 0, 0, 1, 1,
-0.4517312, -1.981228, -2.486484, 1, 1, 1, 1, 1,
-0.4485546, -0.3418236, -1.868172, 1, 1, 1, 1, 1,
-0.4458225, -0.4278764, -2.579061, 1, 1, 1, 1, 1,
-0.4394942, 1.247523, -1.273852, 1, 1, 1, 1, 1,
-0.4391694, -1.069579, -2.782897, 1, 1, 1, 1, 1,
-0.4246618, 1.275542, 1.766806, 1, 1, 1, 1, 1,
-0.4242021, 0.6976272, -1.578587, 1, 1, 1, 1, 1,
-0.4241561, 1.185386, 0.7812231, 1, 1, 1, 1, 1,
-0.4184095, 0.7325488, -0.9296139, 1, 1, 1, 1, 1,
-0.4164895, -2.457645, -2.643578, 1, 1, 1, 1, 1,
-0.4163368, 0.1218838, -3.551776, 1, 1, 1, 1, 1,
-0.4160965, 0.08476155, -1.318686, 1, 1, 1, 1, 1,
-0.4143437, 1.173111, 0.2746783, 1, 1, 1, 1, 1,
-0.4131728, -0.7569453, -3.79143, 1, 1, 1, 1, 1,
-0.4082112, 1.24254, 0.6838811, 1, 1, 1, 1, 1,
-0.4030029, 1.112006, -1.184188, 0, 0, 1, 1, 1,
-0.4022673, -1.248688, -1.842066, 1, 0, 0, 1, 1,
-0.4014252, 1.313323, -0.5223221, 1, 0, 0, 1, 1,
-0.3984112, 1.182813, -2.675514, 1, 0, 0, 1, 1,
-0.3968644, 1.537609, -0.09743095, 1, 0, 0, 1, 1,
-0.3947514, -0.6708486, -3.32959, 1, 0, 0, 1, 1,
-0.390999, -0.6246668, -3.848205, 0, 0, 0, 1, 1,
-0.3871787, 0.2372211, -0.4691359, 0, 0, 0, 1, 1,
-0.3852667, -1.156033, -1.317857, 0, 0, 0, 1, 1,
-0.3847764, 0.3779956, -0.2578575, 0, 0, 0, 1, 1,
-0.3831522, 0.2184602, -0.1490974, 0, 0, 0, 1, 1,
-0.3806086, -0.8176839, -2.935947, 0, 0, 0, 1, 1,
-0.3704895, 0.2278904, -2.012783, 0, 0, 0, 1, 1,
-0.365263, 0.1136055, -0.8036677, 1, 1, 1, 1, 1,
-0.3625149, 0.3044936, -0.7782198, 1, 1, 1, 1, 1,
-0.3540355, 1.987972, -2.35367, 1, 1, 1, 1, 1,
-0.3474041, -0.7713848, -4.723251, 1, 1, 1, 1, 1,
-0.3457515, 0.9490342, -0.426029, 1, 1, 1, 1, 1,
-0.3435757, 0.380767, 1.413069, 1, 1, 1, 1, 1,
-0.3380185, 0.5060308, -1.276067, 1, 1, 1, 1, 1,
-0.3364926, 0.2997749, -1.168727, 1, 1, 1, 1, 1,
-0.3330114, 0.712223, 0.8159307, 1, 1, 1, 1, 1,
-0.3301137, -0.7792735, -0.6030641, 1, 1, 1, 1, 1,
-0.3277955, -0.2585633, -1.30265, 1, 1, 1, 1, 1,
-0.326354, 0.3185346, -1.488127, 1, 1, 1, 1, 1,
-0.3145226, -0.5223939, -3.220338, 1, 1, 1, 1, 1,
-0.3126522, -1.519735, -1.844864, 1, 1, 1, 1, 1,
-0.3112634, 0.624864, -1.432011, 1, 1, 1, 1, 1,
-0.3106308, -0.230419, -1.937598, 0, 0, 1, 1, 1,
-0.3077558, 1.204721, -0.4874473, 1, 0, 0, 1, 1,
-0.304424, 1.023645, -1.637034, 1, 0, 0, 1, 1,
-0.3027346, -0.6522661, -1.975226, 1, 0, 0, 1, 1,
-0.2997946, -0.3038844, -1.163514, 1, 0, 0, 1, 1,
-0.2915251, 0.5779971, -1.968749, 1, 0, 0, 1, 1,
-0.2914572, 0.004074574, -2.55707, 0, 0, 0, 1, 1,
-0.2898243, -0.0818437, -2.832039, 0, 0, 0, 1, 1,
-0.2889547, 0.5283699, 0.9487197, 0, 0, 0, 1, 1,
-0.2863224, 0.733359, -0.2736089, 0, 0, 0, 1, 1,
-0.2861093, 2.435818, 0.3622512, 0, 0, 0, 1, 1,
-0.2831436, 0.2252724, -0.7174042, 0, 0, 0, 1, 1,
-0.2764359, 0.6582839, 0.5861115, 0, 0, 0, 1, 1,
-0.2719879, 1.41093, 1.594347, 1, 1, 1, 1, 1,
-0.2717963, -1.27368, -1.882468, 1, 1, 1, 1, 1,
-0.2660658, -1.132644, -2.588442, 1, 1, 1, 1, 1,
-0.2644871, 1.743329, 1.469932, 1, 1, 1, 1, 1,
-0.2562844, -1.397176, -2.618062, 1, 1, 1, 1, 1,
-0.255016, -0.748874, -3.286328, 1, 1, 1, 1, 1,
-0.2517208, -0.9485111, -3.480205, 1, 1, 1, 1, 1,
-0.2503087, 1.700131, -1.712409, 1, 1, 1, 1, 1,
-0.2499163, 0.9931777, 0.4534276, 1, 1, 1, 1, 1,
-0.2484759, 1.998908, -0.1640624, 1, 1, 1, 1, 1,
-0.2462416, 0.6893945, 0.3138524, 1, 1, 1, 1, 1,
-0.2422629, 2.320518, -0.8611047, 1, 1, 1, 1, 1,
-0.240964, -1.379873, -4.547416, 1, 1, 1, 1, 1,
-0.2406496, -0.3445111, 0.005179891, 1, 1, 1, 1, 1,
-0.2397465, 1.256884, -0.7876545, 1, 1, 1, 1, 1,
-0.2384212, -1.964368, -4.22093, 0, 0, 1, 1, 1,
-0.235074, -0.05888181, -3.110892, 1, 0, 0, 1, 1,
-0.2346452, -0.8243551, -4.449623, 1, 0, 0, 1, 1,
-0.2318328, -1.35019, -3.60093, 1, 0, 0, 1, 1,
-0.2292998, 0.3261935, -1.036573, 1, 0, 0, 1, 1,
-0.2264982, -0.764195, -2.126667, 1, 0, 0, 1, 1,
-0.2249127, -0.8771384, -3.079022, 0, 0, 0, 1, 1,
-0.2246759, 1.346383, 1.302878, 0, 0, 0, 1, 1,
-0.2233266, -0.1707944, -2.948282, 0, 0, 0, 1, 1,
-0.2207107, 1.900083, 0.1913812, 0, 0, 0, 1, 1,
-0.2144421, -0.4077103, -3.059235, 0, 0, 0, 1, 1,
-0.2110154, -0.06678317, -3.546726, 0, 0, 0, 1, 1,
-0.2074651, 1.385466, -0.8759922, 0, 0, 0, 1, 1,
-0.2046387, 0.06711336, -0.9803128, 1, 1, 1, 1, 1,
-0.2020425, -0.7005912, -2.767065, 1, 1, 1, 1, 1,
-0.2009907, -0.9009851, -3.693311, 1, 1, 1, 1, 1,
-0.198875, 0.638732, 1.009928, 1, 1, 1, 1, 1,
-0.1926875, -0.6331321, -3.771136, 1, 1, 1, 1, 1,
-0.1877781, 0.4302576, 1.938434, 1, 1, 1, 1, 1,
-0.1866665, 1.912485, -2.284312, 1, 1, 1, 1, 1,
-0.1851604, -0.09924633, -2.010697, 1, 1, 1, 1, 1,
-0.1805142, -0.8895292, -3.421042, 1, 1, 1, 1, 1,
-0.1781028, 1.259133, 0.1581081, 1, 1, 1, 1, 1,
-0.1623723, -0.794293, -2.771676, 1, 1, 1, 1, 1,
-0.1536234, -0.2039172, -3.908029, 1, 1, 1, 1, 1,
-0.151377, 1.255233, -1.204119, 1, 1, 1, 1, 1,
-0.1511594, 0.6952544, -1.301067, 1, 1, 1, 1, 1,
-0.1509327, 0.3560853, 1.230817, 1, 1, 1, 1, 1,
-0.1499454, 1.312857, -1.397754, 0, 0, 1, 1, 1,
-0.1499352, 0.9515935, 1.107429, 1, 0, 0, 1, 1,
-0.1480871, 1.730368, 0.106005, 1, 0, 0, 1, 1,
-0.1442752, 2.191344, -0.005470608, 1, 0, 0, 1, 1,
-0.1399841, -0.3830451, -2.724682, 1, 0, 0, 1, 1,
-0.1399318, 1.350469, -0.6375832, 1, 0, 0, 1, 1,
-0.1355132, 0.2105294, -0.6566584, 0, 0, 0, 1, 1,
-0.1354344, 0.008628323, -2.272214, 0, 0, 0, 1, 1,
-0.1328996, 1.318076, 0.8839337, 0, 0, 0, 1, 1,
-0.1299534, 1.16381, 0.2120729, 0, 0, 0, 1, 1,
-0.1294426, -0.6055808, -1.734548, 0, 0, 0, 1, 1,
-0.125458, -0.02460746, -2.512478, 0, 0, 0, 1, 1,
-0.120673, -0.6033967, -0.6289198, 0, 0, 0, 1, 1,
-0.1150675, 1.345214, 1.811204, 1, 1, 1, 1, 1,
-0.1120048, 0.5107041, -0.198433, 1, 1, 1, 1, 1,
-0.1103563, 0.5993179, -0.5176634, 1, 1, 1, 1, 1,
-0.1100884, -0.1482304, -2.211258, 1, 1, 1, 1, 1,
-0.1063086, 0.2608782, 0.8902681, 1, 1, 1, 1, 1,
-0.1031398, -0.4944206, -3.36789, 1, 1, 1, 1, 1,
-0.09359299, -1.109465, -1.826086, 1, 1, 1, 1, 1,
-0.09227953, -0.1118176, -3.335008, 1, 1, 1, 1, 1,
-0.09091844, 0.5423132, 1.474846, 1, 1, 1, 1, 1,
-0.08833723, -1.742329, -3.158735, 1, 1, 1, 1, 1,
-0.07648253, -0.3958832, -1.970436, 1, 1, 1, 1, 1,
-0.07609411, -0.1499581, -2.976178, 1, 1, 1, 1, 1,
-0.0755598, 0.9380843, 1.389271, 1, 1, 1, 1, 1,
-0.0747852, 0.582744, 0.03883615, 1, 1, 1, 1, 1,
-0.07285491, 0.5559669, 0.4558731, 1, 1, 1, 1, 1,
-0.07213438, 0.06195005, -0.2708249, 0, 0, 1, 1, 1,
-0.06977974, -0.837634, -3.542248, 1, 0, 0, 1, 1,
-0.06942766, -0.8234608, -2.116112, 1, 0, 0, 1, 1,
-0.06901789, 1.713491, -0.8714018, 1, 0, 0, 1, 1,
-0.06891297, 1.141757, 0.8387568, 1, 0, 0, 1, 1,
-0.06860632, -0.5011751, -4.016583, 1, 0, 0, 1, 1,
-0.06712437, -0.676925, -4.095849, 0, 0, 0, 1, 1,
-0.06276326, 1.589154, -0.938957, 0, 0, 0, 1, 1,
-0.06071227, 0.4076797, 0.3957288, 0, 0, 0, 1, 1,
-0.05646069, 0.4866478, 0.5479869, 0, 0, 0, 1, 1,
-0.05135365, 1.866403, 1.589785, 0, 0, 0, 1, 1,
-0.04657085, -0.6637276, -2.769, 0, 0, 0, 1, 1,
-0.04461938, -0.1705928, -3.95943, 0, 0, 0, 1, 1,
-0.04354898, 1.490169, 0.2935894, 1, 1, 1, 1, 1,
-0.04309874, 0.1762848, -1.265192, 1, 1, 1, 1, 1,
-0.04096114, -0.7650317, -2.345036, 1, 1, 1, 1, 1,
-0.03901772, -0.7747838, -4.022571, 1, 1, 1, 1, 1,
-0.02772791, 0.4707889, 0.07732444, 1, 1, 1, 1, 1,
-0.02592941, -1.328195, -3.313276, 1, 1, 1, 1, 1,
-0.02340162, -0.4742539, -2.046782, 1, 1, 1, 1, 1,
-0.02288171, 0.09285723, 1.323936, 1, 1, 1, 1, 1,
-0.01355581, -0.5417617, -1.82988, 1, 1, 1, 1, 1,
-0.0112379, 0.4897114, 0.1301852, 1, 1, 1, 1, 1,
-0.008952359, 1.337074, 0.6561627, 1, 1, 1, 1, 1,
-0.00772959, 1.1448, -0.4538842, 1, 1, 1, 1, 1,
-0.005984157, -0.7902755, -6.006821, 1, 1, 1, 1, 1,
-0.003098848, 1.45617, 0.5982766, 1, 1, 1, 1, 1,
-0.002756448, 0.6214031, 0.4425686, 1, 1, 1, 1, 1,
-0.002716169, -0.3077243, -5.417974, 0, 0, 1, 1, 1,
0.006517015, -0.2021598, 4.057553, 1, 0, 0, 1, 1,
0.01222658, 1.49231, 1.320414, 1, 0, 0, 1, 1,
0.01324127, 0.7213243, 0.8997772, 1, 0, 0, 1, 1,
0.01479798, -0.6487717, 2.95701, 1, 0, 0, 1, 1,
0.02758784, 0.5382836, -0.7905506, 1, 0, 0, 1, 1,
0.02872527, 1.016171, -0.8222234, 0, 0, 0, 1, 1,
0.02913221, 1.694596, -0.4114241, 0, 0, 0, 1, 1,
0.03770389, 0.03190922, 2.407324, 0, 0, 0, 1, 1,
0.03807241, 1.248961, -0.7671602, 0, 0, 0, 1, 1,
0.03845041, 0.4236494, -1.296358, 0, 0, 0, 1, 1,
0.04176025, -0.2102894, 2.042309, 0, 0, 0, 1, 1,
0.04896007, -0.3048563, 4.798976, 0, 0, 0, 1, 1,
0.04996441, 0.5153776, 0.7931159, 1, 1, 1, 1, 1,
0.05046307, -0.1408826, 3.885142, 1, 1, 1, 1, 1,
0.05153388, -0.3799566, 1.769742, 1, 1, 1, 1, 1,
0.05316485, -0.7196012, 2.979681, 1, 1, 1, 1, 1,
0.05410297, -0.5695665, 3.036684, 1, 1, 1, 1, 1,
0.05472222, 1.854821, -1.186972, 1, 1, 1, 1, 1,
0.05757885, -0.9328464, 0.9491879, 1, 1, 1, 1, 1,
0.05927728, -0.5074928, 3.64867, 1, 1, 1, 1, 1,
0.06049111, -0.8970611, 3.295727, 1, 1, 1, 1, 1,
0.06317741, -1.283993, 2.498104, 1, 1, 1, 1, 1,
0.06494486, 1.229176, -0.2930109, 1, 1, 1, 1, 1,
0.06761465, -1.361052, 4.65124, 1, 1, 1, 1, 1,
0.070089, -0.4012574, 0.7243159, 1, 1, 1, 1, 1,
0.07014218, 1.158341, 0.8381555, 1, 1, 1, 1, 1,
0.07112858, -0.2925821, 4.118067, 1, 1, 1, 1, 1,
0.07227695, -1.10906, 1.044561, 0, 0, 1, 1, 1,
0.07532978, 0.6766078, -1.301337, 1, 0, 0, 1, 1,
0.07538006, -0.5097323, 1.386953, 1, 0, 0, 1, 1,
0.08045655, 1.305125, -0.6450151, 1, 0, 0, 1, 1,
0.08113027, -0.09179491, 2.12416, 1, 0, 0, 1, 1,
0.08507155, -0.6579951, 1.417511, 1, 0, 0, 1, 1,
0.08777491, -0.386227, 1.786078, 0, 0, 0, 1, 1,
0.1000819, -0.2207806, 1.988404, 0, 0, 0, 1, 1,
0.1033207, 1.522227, 0.3827516, 0, 0, 0, 1, 1,
0.1063603, -1.705308, 3.688727, 0, 0, 0, 1, 1,
0.1065642, 1.041757, 0.1287381, 0, 0, 0, 1, 1,
0.1078123, 2.464561, -1.869738, 0, 0, 0, 1, 1,
0.1093723, -2.334339, 2.215618, 0, 0, 0, 1, 1,
0.1163859, 0.3728991, 0.06294616, 1, 1, 1, 1, 1,
0.1167017, -0.9943858, 3.079367, 1, 1, 1, 1, 1,
0.1177497, 1.232143, 1.293007, 1, 1, 1, 1, 1,
0.1205704, -2.154186, 2.75638, 1, 1, 1, 1, 1,
0.1237124, -0.3397931, 0.708222, 1, 1, 1, 1, 1,
0.1256061, 0.3876261, 0.4760494, 1, 1, 1, 1, 1,
0.1369182, -0.9195518, 1.276669, 1, 1, 1, 1, 1,
0.1380326, -0.560445, 3.257523, 1, 1, 1, 1, 1,
0.1431566, 1.540089, -1.295553, 1, 1, 1, 1, 1,
0.1453991, 0.6066592, -1.323452, 1, 1, 1, 1, 1,
0.1459524, -0.542354, 2.515333, 1, 1, 1, 1, 1,
0.148159, -0.33665, 3.309003, 1, 1, 1, 1, 1,
0.1499212, -0.8091553, 2.841953, 1, 1, 1, 1, 1,
0.1509784, -0.6573442, 2.618491, 1, 1, 1, 1, 1,
0.1531928, 0.4472986, 0.1141632, 1, 1, 1, 1, 1,
0.1569021, 1.362539, -0.729608, 0, 0, 1, 1, 1,
0.1586989, 1.977748, -0.4075731, 1, 0, 0, 1, 1,
0.159424, 1.127226, 1.076098, 1, 0, 0, 1, 1,
0.1616627, -1.379319, 1.444958, 1, 0, 0, 1, 1,
0.1621451, 1.740789, -1.689178, 1, 0, 0, 1, 1,
0.1633404, -2.192928, 3.074511, 1, 0, 0, 1, 1,
0.1659005, 1.952294, -0.5436293, 0, 0, 0, 1, 1,
0.1716668, -0.5317234, 2.778719, 0, 0, 0, 1, 1,
0.1724192, -0.8502826, 2.605984, 0, 0, 0, 1, 1,
0.1742999, -0.7061331, 2.874252, 0, 0, 0, 1, 1,
0.1744897, -0.7886419, 3.365845, 0, 0, 0, 1, 1,
0.1775604, 0.373212, 0.4629569, 0, 0, 0, 1, 1,
0.1817996, 0.9676207, 0.5227443, 0, 0, 0, 1, 1,
0.1851017, -0.2820368, 1.379526, 1, 1, 1, 1, 1,
0.1887268, 0.6389525, 0.7824059, 1, 1, 1, 1, 1,
0.1901022, -0.637279, 2.291418, 1, 1, 1, 1, 1,
0.1925333, 0.3451234, -0.5500537, 1, 1, 1, 1, 1,
0.1945195, 0.8400334, -0.3573207, 1, 1, 1, 1, 1,
0.199343, -1.103848, 4.907547, 1, 1, 1, 1, 1,
0.2001393, 0.7180534, 0.5683116, 1, 1, 1, 1, 1,
0.2035229, -0.3471942, 0.4978929, 1, 1, 1, 1, 1,
0.2064855, 0.7032971, -0.1455475, 1, 1, 1, 1, 1,
0.2065206, 0.7939738, -1.015445, 1, 1, 1, 1, 1,
0.2077138, 0.007528526, 1.484247, 1, 1, 1, 1, 1,
0.2089334, 1.449179, 1.069692, 1, 1, 1, 1, 1,
0.2124095, -0.4331307, 2.622674, 1, 1, 1, 1, 1,
0.2124162, 0.4044624, 0.9785932, 1, 1, 1, 1, 1,
0.2218217, 0.9032625, 0.205422, 1, 1, 1, 1, 1,
0.2309167, 0.2563913, 1.521985, 0, 0, 1, 1, 1,
0.2324926, 0.09477033, 1.503531, 1, 0, 0, 1, 1,
0.2327816, -0.1119163, -0.2915871, 1, 0, 0, 1, 1,
0.2331774, 0.02317146, 1.808053, 1, 0, 0, 1, 1,
0.2346022, 0.5149679, 1.627056, 1, 0, 0, 1, 1,
0.2378847, 0.9825953, 1.197348, 1, 0, 0, 1, 1,
0.2580734, -0.5795496, 5.438989, 0, 0, 0, 1, 1,
0.2601469, 0.4029166, 0.8250258, 0, 0, 0, 1, 1,
0.2632149, 1.336514, 0.8145156, 0, 0, 0, 1, 1,
0.2633109, -0.7801877, 1.963561, 0, 0, 0, 1, 1,
0.2669167, 1.45943, 0.5485984, 0, 0, 0, 1, 1,
0.2677003, 1.091255, 1.240935, 0, 0, 0, 1, 1,
0.269961, 0.8307868, 1.363563, 0, 0, 0, 1, 1,
0.2753025, 0.2352837, -1.245191, 1, 1, 1, 1, 1,
0.2762328, 0.01170497, 1.606127, 1, 1, 1, 1, 1,
0.2773703, -1.020577, 2.874109, 1, 1, 1, 1, 1,
0.2789254, -1.713152, 3.631478, 1, 1, 1, 1, 1,
0.2815246, 1.859768, 0.2736408, 1, 1, 1, 1, 1,
0.2885165, 2.478386, -0.331967, 1, 1, 1, 1, 1,
0.2932032, 0.05596299, 0.07504854, 1, 1, 1, 1, 1,
0.2933202, 1.291963, 0.896678, 1, 1, 1, 1, 1,
0.2954514, 1.244146, 2.246838, 1, 1, 1, 1, 1,
0.2978774, 0.1390775, 0.639275, 1, 1, 1, 1, 1,
0.3037733, 0.4552227, 0.02821779, 1, 1, 1, 1, 1,
0.3076582, 0.7106969, 1.757632, 1, 1, 1, 1, 1,
0.3099316, 1.312451, -0.8192422, 1, 1, 1, 1, 1,
0.311576, 0.2351039, -0.6827393, 1, 1, 1, 1, 1,
0.3161854, -0.03603045, -0.5659091, 1, 1, 1, 1, 1,
0.3163049, 0.116991, 0.0370134, 0, 0, 1, 1, 1,
0.3213738, -0.6950446, 1.263108, 1, 0, 0, 1, 1,
0.3214344, 0.2823744, 0.3021887, 1, 0, 0, 1, 1,
0.3215194, 0.1791894, 0.8823805, 1, 0, 0, 1, 1,
0.3244672, -0.1819189, 1.761119, 1, 0, 0, 1, 1,
0.3248348, -0.4986847, 3.432246, 1, 0, 0, 1, 1,
0.3280219, 0.5368366, -0.281224, 0, 0, 0, 1, 1,
0.3367263, 1.089026, 0.6633764, 0, 0, 0, 1, 1,
0.338557, 0.6485659, 0.07467084, 0, 0, 0, 1, 1,
0.3386329, -0.5725918, 3.280022, 0, 0, 0, 1, 1,
0.3410885, -0.2327332, 1.608482, 0, 0, 0, 1, 1,
0.3412411, 0.9776914, -2.443566, 0, 0, 0, 1, 1,
0.3434738, -1.166416, 1.981474, 0, 0, 0, 1, 1,
0.3590227, -0.4242031, 1.195001, 1, 1, 1, 1, 1,
0.3633448, 0.7352894, 0.8721306, 1, 1, 1, 1, 1,
0.3662868, -0.9930903, 2.540878, 1, 1, 1, 1, 1,
0.3680971, 0.6168104, 1.246708, 1, 1, 1, 1, 1,
0.3710108, 0.4805363, 1.015292, 1, 1, 1, 1, 1,
0.3731502, -0.7040238, 1.171454, 1, 1, 1, 1, 1,
0.3775959, -1.074064, 2.837457, 1, 1, 1, 1, 1,
0.382296, 0.8070577, 0.9109597, 1, 1, 1, 1, 1,
0.3858785, -0.5660787, 1.476549, 1, 1, 1, 1, 1,
0.3868928, -0.2662044, 3.171635, 1, 1, 1, 1, 1,
0.3884342, 0.3743279, -0.05008037, 1, 1, 1, 1, 1,
0.3900034, -0.2454892, 1.38412, 1, 1, 1, 1, 1,
0.3939418, 1.630963, 0.6913622, 1, 1, 1, 1, 1,
0.3986145, 0.4217986, 0.7470047, 1, 1, 1, 1, 1,
0.4053578, -0.8245965, 3.882642, 1, 1, 1, 1, 1,
0.4064469, 0.8082756, -0.4705549, 0, 0, 1, 1, 1,
0.4093374, 0.6724295, 0.1557743, 1, 0, 0, 1, 1,
0.4104639, 0.3056593, -0.6538121, 1, 0, 0, 1, 1,
0.4132941, -0.5812349, 2.78213, 1, 0, 0, 1, 1,
0.4160997, -1.829068, 3.366897, 1, 0, 0, 1, 1,
0.4182649, -0.4483046, 4.274267, 1, 0, 0, 1, 1,
0.4206458, -0.04987016, 0.538988, 0, 0, 0, 1, 1,
0.4231586, 0.1048005, 3.433357, 0, 0, 0, 1, 1,
0.4237626, -0.962595, 1.815987, 0, 0, 0, 1, 1,
0.4289799, 0.6819977, 0.09686975, 0, 0, 0, 1, 1,
0.4309912, -1.103124, 4.044702, 0, 0, 0, 1, 1,
0.4311006, -0.180236, 0.7093589, 0, 0, 0, 1, 1,
0.4312766, 0.02072186, 2.161638, 0, 0, 0, 1, 1,
0.4316979, 0.9165379, -1.208402, 1, 1, 1, 1, 1,
0.4345244, -0.4456997, 2.355048, 1, 1, 1, 1, 1,
0.4394678, 1.92186, 1.076021, 1, 1, 1, 1, 1,
0.4418416, -0.8877229, 0.8078678, 1, 1, 1, 1, 1,
0.4427218, -0.4955576, 2.978389, 1, 1, 1, 1, 1,
0.442739, -0.3325968, 2.410624, 1, 1, 1, 1, 1,
0.4429235, 0.1614549, 1.25312, 1, 1, 1, 1, 1,
0.4434903, -0.3507932, 2.627511, 1, 1, 1, 1, 1,
0.4445445, 0.455231, 1.62482, 1, 1, 1, 1, 1,
0.4454124, -1.339819, 1.19714, 1, 1, 1, 1, 1,
0.4457746, -0.256649, 1.565083, 1, 1, 1, 1, 1,
0.4471219, 1.969613, -1.478794, 1, 1, 1, 1, 1,
0.4484976, 0.7694944, 1.013647, 1, 1, 1, 1, 1,
0.4525497, -0.3194483, 1.975616, 1, 1, 1, 1, 1,
0.4532681, 0.7200106, 0.4656861, 1, 1, 1, 1, 1,
0.4539738, -0.8433764, 1.897026, 0, 0, 1, 1, 1,
0.4588599, 0.02415443, 0.2741904, 1, 0, 0, 1, 1,
0.4597657, -0.2269756, 2.656817, 1, 0, 0, 1, 1,
0.46083, 0.5694886, 0.4486523, 1, 0, 0, 1, 1,
0.4614449, -0.5430703, 1.287635, 1, 0, 0, 1, 1,
0.4659666, 0.1558099, 0.2318517, 1, 0, 0, 1, 1,
0.4684358, -0.4464451, 2.676485, 0, 0, 0, 1, 1,
0.471372, 0.2322653, 1.274965, 0, 0, 0, 1, 1,
0.4745136, -0.4001746, 0.3633027, 0, 0, 0, 1, 1,
0.4745924, -0.2013483, 3.024217, 0, 0, 0, 1, 1,
0.4765158, -1.071024, 1.865964, 0, 0, 0, 1, 1,
0.4778778, 0.3374222, 0.1138931, 0, 0, 0, 1, 1,
0.4796055, 1.590238, -0.8674131, 0, 0, 0, 1, 1,
0.4796755, -1.267539, 1.93579, 1, 1, 1, 1, 1,
0.4799136, -1.008671, 1.620934, 1, 1, 1, 1, 1,
0.4806978, -1.616724, 1.207456, 1, 1, 1, 1, 1,
0.4839222, -2.169282, 2.777586, 1, 1, 1, 1, 1,
0.4840271, 0.3533302, 1.207273, 1, 1, 1, 1, 1,
0.4852862, -0.9169447, 3.680051, 1, 1, 1, 1, 1,
0.4904541, -1.43148, 3.069214, 1, 1, 1, 1, 1,
0.4916593, 1.549113, 0.7209212, 1, 1, 1, 1, 1,
0.4920915, -0.1548841, 1.635254, 1, 1, 1, 1, 1,
0.4986104, 0.01632663, 2.980304, 1, 1, 1, 1, 1,
0.5002937, -0.1819106, 1.35496, 1, 1, 1, 1, 1,
0.5035856, 2.20273, -0.4783739, 1, 1, 1, 1, 1,
0.506486, -0.2741627, 0.8335317, 1, 1, 1, 1, 1,
0.5110941, -1.067915, 3.893788, 1, 1, 1, 1, 1,
0.5111278, 1.385978, 0.9789516, 1, 1, 1, 1, 1,
0.5137789, -0.04732954, 1.831301, 0, 0, 1, 1, 1,
0.5213313, 1.012347, 0.007518189, 1, 0, 0, 1, 1,
0.5220508, 0.7529957, -1.577843, 1, 0, 0, 1, 1,
0.5274078, -1.94976, 3.36388, 1, 0, 0, 1, 1,
0.5302787, 1.852791, -0.8435679, 1, 0, 0, 1, 1,
0.5305789, 0.6822841, 2.687596, 1, 0, 0, 1, 1,
0.530941, 1.335041, -0.3802624, 0, 0, 0, 1, 1,
0.5333021, -1.407274, 2.514149, 0, 0, 0, 1, 1,
0.5334678, 1.865074, 0.3151156, 0, 0, 0, 1, 1,
0.5378125, -1.297793, 2.60377, 0, 0, 0, 1, 1,
0.5382152, 0.03919952, 1.992286, 0, 0, 0, 1, 1,
0.5399636, -0.9945293, 0.9528458, 0, 0, 0, 1, 1,
0.5448249, 1.085182, 0.2555013, 0, 0, 0, 1, 1,
0.5478958, 0.04950177, 1.545708, 1, 1, 1, 1, 1,
0.5490272, -0.01036616, 3.44547, 1, 1, 1, 1, 1,
0.5542054, -0.7930915, 3.529462, 1, 1, 1, 1, 1,
0.5564062, -1.697885, 0.9206244, 1, 1, 1, 1, 1,
0.5598524, 0.07287608, 0.3605626, 1, 1, 1, 1, 1,
0.5652125, 0.9834922, 0.3665728, 1, 1, 1, 1, 1,
0.5680405, -1.95191, 2.10426, 1, 1, 1, 1, 1,
0.5729985, -0.4021171, 2.846969, 1, 1, 1, 1, 1,
0.5786386, 0.8305973, 1.338247, 1, 1, 1, 1, 1,
0.5813017, -0.245883, 1.397637, 1, 1, 1, 1, 1,
0.5893828, 1.081443, 0.4500515, 1, 1, 1, 1, 1,
0.5938305, 1.09549, 0.4976014, 1, 1, 1, 1, 1,
0.5941769, 0.7981731, 0.9959913, 1, 1, 1, 1, 1,
0.5963129, -0.9255376, 2.247144, 1, 1, 1, 1, 1,
0.5982646, -0.2412739, 1.490016, 1, 1, 1, 1, 1,
0.6007338, -0.7494722, 2.729674, 0, 0, 1, 1, 1,
0.6016961, -0.3322318, 1.603189, 1, 0, 0, 1, 1,
0.6025164, 0.5426855, 0.8467531, 1, 0, 0, 1, 1,
0.6044729, 1.286399, -0.4337963, 1, 0, 0, 1, 1,
0.607225, -1.344025, 1.945146, 1, 0, 0, 1, 1,
0.6110553, -0.3561236, 2.650163, 1, 0, 0, 1, 1,
0.6110919, 0.4341893, 1.17831, 0, 0, 0, 1, 1,
0.6131601, -0.7265264, 2.26964, 0, 0, 0, 1, 1,
0.6145543, -0.959691, 4.045623, 0, 0, 0, 1, 1,
0.6147243, 0.4808326, 0.4698266, 0, 0, 0, 1, 1,
0.6157607, 0.9209258, -0.1140812, 0, 0, 0, 1, 1,
0.6170822, -1.172868, 2.373089, 0, 0, 0, 1, 1,
0.6177179, 1.096438, 0.2098636, 0, 0, 0, 1, 1,
0.6189722, 0.7729072, -1.275937, 1, 1, 1, 1, 1,
0.6212167, 1.082119, -0.7186952, 1, 1, 1, 1, 1,
0.6212803, 0.322749, 2.775225, 1, 1, 1, 1, 1,
0.6245862, -1.655919, 4.013976, 1, 1, 1, 1, 1,
0.6252543, -0.2889472, 1.742915, 1, 1, 1, 1, 1,
0.6290323, -1.202412, 3.502149, 1, 1, 1, 1, 1,
0.6351966, -0.3784118, 0.8933721, 1, 1, 1, 1, 1,
0.6362072, 0.6736537, 0.5354591, 1, 1, 1, 1, 1,
0.6408563, 1.661564, 2.288676, 1, 1, 1, 1, 1,
0.6455948, 0.6840129, 2.187349, 1, 1, 1, 1, 1,
0.6467183, 1.602482, 0.7692769, 1, 1, 1, 1, 1,
0.6468045, -1.339794, 3.323609, 1, 1, 1, 1, 1,
0.6469933, -0.2968121, 1.941782, 1, 1, 1, 1, 1,
0.6483497, -0.9449646, 2.180679, 1, 1, 1, 1, 1,
0.6564858, 2.352315, 1.373963, 1, 1, 1, 1, 1,
0.6587807, 1.028028, 1.189751, 0, 0, 1, 1, 1,
0.6598067, -0.808131, 3.234889, 1, 0, 0, 1, 1,
0.6649239, -0.8519578, 2.17407, 1, 0, 0, 1, 1,
0.6681367, 0.1126423, 1.269932, 1, 0, 0, 1, 1,
0.6684605, 0.1563676, 1.329638, 1, 0, 0, 1, 1,
0.6705044, -1.508467, 3.158975, 1, 0, 0, 1, 1,
0.6789473, 0.3467957, 1.467187, 0, 0, 0, 1, 1,
0.6846535, 0.2756323, -0.8821815, 0, 0, 0, 1, 1,
0.6859708, -0.4253885, 1.781675, 0, 0, 0, 1, 1,
0.6875228, 0.4693054, 1.292249, 0, 0, 0, 1, 1,
0.6878299, -1.230797, 4.645409, 0, 0, 0, 1, 1,
0.6887694, -0.4206012, 3.100101, 0, 0, 0, 1, 1,
0.6916714, 1.078155, 0.7435933, 0, 0, 0, 1, 1,
0.6945406, 1.383187, 0.9114044, 1, 1, 1, 1, 1,
0.7017309, -1.143359, 1.098642, 1, 1, 1, 1, 1,
0.7075164, 0.539609, 1.067184, 1, 1, 1, 1, 1,
0.7153333, -0.7635769, 3.450639, 1, 1, 1, 1, 1,
0.7158309, -2.21354, 2.809845, 1, 1, 1, 1, 1,
0.719112, -0.6151181, 2.375306, 1, 1, 1, 1, 1,
0.7271022, -0.08956769, 2.258165, 1, 1, 1, 1, 1,
0.7299668, -0.2382759, 3.174775, 1, 1, 1, 1, 1,
0.7321839, -1.16934, 1.948496, 1, 1, 1, 1, 1,
0.7354749, -0.406476, 3.247714, 1, 1, 1, 1, 1,
0.7367069, 0.1630934, 2.001291, 1, 1, 1, 1, 1,
0.7375846, 0.6051947, 1.220252, 1, 1, 1, 1, 1,
0.7385691, -0.2972147, 1.964279, 1, 1, 1, 1, 1,
0.746922, 1.997725, -0.5375062, 1, 1, 1, 1, 1,
0.7470291, -0.6366695, 1.364117, 1, 1, 1, 1, 1,
0.7540632, -1.263375, 2.144678, 0, 0, 1, 1, 1,
0.7545197, -1.12837, 2.20288, 1, 0, 0, 1, 1,
0.7545996, -0.5309031, 3.392442, 1, 0, 0, 1, 1,
0.7549655, -1.396429, 2.225158, 1, 0, 0, 1, 1,
0.755433, 0.4031215, -0.4423786, 1, 0, 0, 1, 1,
0.7567312, -1.284636, 2.037975, 1, 0, 0, 1, 1,
0.7587069, 0.6784125, 0.6348956, 0, 0, 0, 1, 1,
0.7615921, 0.6362588, 0.6579456, 0, 0, 0, 1, 1,
0.7620065, -0.2749864, 2.692729, 0, 0, 0, 1, 1,
0.7677977, 0.6106349, 0.2762771, 0, 0, 0, 1, 1,
0.7715994, 1.111012, 1.392202, 0, 0, 0, 1, 1,
0.7764512, -0.2801591, 0.6059852, 0, 0, 0, 1, 1,
0.7791998, 1.101269, 0.4645786, 0, 0, 0, 1, 1,
0.7827423, -1.832236, 2.817852, 1, 1, 1, 1, 1,
0.7921923, 0.6061534, 2.04889, 1, 1, 1, 1, 1,
0.794445, 0.4638636, 2.114486, 1, 1, 1, 1, 1,
0.7984407, -0.7844737, 3.031339, 1, 1, 1, 1, 1,
0.8021938, 1.553926, 0.5402313, 1, 1, 1, 1, 1,
0.8055359, 0.58917, 1.785291, 1, 1, 1, 1, 1,
0.8089941, 1.848313, -0.465158, 1, 1, 1, 1, 1,
0.8093541, -1.634974, 2.204767, 1, 1, 1, 1, 1,
0.8093589, -0.5742035, 3.979933, 1, 1, 1, 1, 1,
0.8149537, 1.045389, 1.113226, 1, 1, 1, 1, 1,
0.8152543, -1.420683, 2.089589, 1, 1, 1, 1, 1,
0.8166221, -2.063169, 1.82427, 1, 1, 1, 1, 1,
0.8233222, 1.649962, -1.029749, 1, 1, 1, 1, 1,
0.8237444, 0.7922624, -0.5358912, 1, 1, 1, 1, 1,
0.8262579, -0.5882098, 1.419034, 1, 1, 1, 1, 1,
0.8324197, 0.6643494, 0.8717779, 0, 0, 1, 1, 1,
0.8364294, -1.659339, 3.017543, 1, 0, 0, 1, 1,
0.85311, 0.4213374, 1.641798, 1, 0, 0, 1, 1,
0.8598199, 1.523292, -0.2295695, 1, 0, 0, 1, 1,
0.8609021, -1.256291, 3.466097, 1, 0, 0, 1, 1,
0.8617594, -0.2191831, 3.132938, 1, 0, 0, 1, 1,
0.8623426, -0.5044379, 2.508162, 0, 0, 0, 1, 1,
0.8707952, 1.295816, 1.290524, 0, 0, 0, 1, 1,
0.8732905, -0.2225846, 1.147374, 0, 0, 0, 1, 1,
0.8775563, -0.2771786, 2.187643, 0, 0, 0, 1, 1,
0.8789802, -0.438457, 2.377031, 0, 0, 0, 1, 1,
0.8799631, -1.53741, 2.839675, 0, 0, 0, 1, 1,
0.8861235, 0.2706817, 1.52379, 0, 0, 0, 1, 1,
0.8909602, 1.594879, 1.403964, 1, 1, 1, 1, 1,
0.8912317, -0.3602109, 1.950102, 1, 1, 1, 1, 1,
0.9063113, 0.7853874, 1.684125, 1, 1, 1, 1, 1,
0.9076838, 0.5570676, 2.023893, 1, 1, 1, 1, 1,
0.9080913, 0.4860976, 0.678197, 1, 1, 1, 1, 1,
0.9118073, -1.473445, 3.815193, 1, 1, 1, 1, 1,
0.9180984, 0.2023302, 2.284995, 1, 1, 1, 1, 1,
0.9222525, -0.05899114, 2.173371, 1, 1, 1, 1, 1,
0.924472, -0.1322607, 2.170604, 1, 1, 1, 1, 1,
0.9305289, 0.7866981, -0.1016397, 1, 1, 1, 1, 1,
0.9309904, -0.200301, 1.00094, 1, 1, 1, 1, 1,
0.9332343, -0.4412654, 2.917328, 1, 1, 1, 1, 1,
0.938596, -1.160836, 1.223397, 1, 1, 1, 1, 1,
0.9430385, -1.070239, 2.690079, 1, 1, 1, 1, 1,
0.9502389, -0.6832356, 2.181442, 1, 1, 1, 1, 1,
0.9515337, 0.5234195, 1.998367, 0, 0, 1, 1, 1,
0.9541025, -1.25939, 1.724413, 1, 0, 0, 1, 1,
0.9602086, -0.9529334, 2.851094, 1, 0, 0, 1, 1,
0.9699053, 2.517171, 1.001226, 1, 0, 0, 1, 1,
0.9719226, 0.03130307, 1.229724, 1, 0, 0, 1, 1,
0.9742711, -0.2258437, 0.7139826, 1, 0, 0, 1, 1,
0.9746274, 0.303125, 1.010949, 0, 0, 0, 1, 1,
0.9970477, 0.8519369, 1.739737, 0, 0, 0, 1, 1,
1.004117, 0.6639214, 0.1927999, 0, 0, 0, 1, 1,
1.009666, -0.6874175, 1.456833, 0, 0, 0, 1, 1,
1.010152, -0.7122595, 4.078817, 0, 0, 0, 1, 1,
1.023667, -3.045282, 3.170321, 0, 0, 0, 1, 1,
1.023676, 0.496562, 0.6947179, 0, 0, 0, 1, 1,
1.027878, -2.27895, 2.971625, 1, 1, 1, 1, 1,
1.033074, 0.937776, -1.423565, 1, 1, 1, 1, 1,
1.03343, -1.53062, 1.866759, 1, 1, 1, 1, 1,
1.037885, -0.5757781, 3.156439, 1, 1, 1, 1, 1,
1.045962, 1.301959, 2.810596, 1, 1, 1, 1, 1,
1.055946, 0.285899, 0.6472566, 1, 1, 1, 1, 1,
1.058424, -0.09118078, 1.210134, 1, 1, 1, 1, 1,
1.060394, 0.9776523, 0.488177, 1, 1, 1, 1, 1,
1.070657, 0.5557082, 1.353425, 1, 1, 1, 1, 1,
1.075988, 0.6876947, 1.78776, 1, 1, 1, 1, 1,
1.088365, 0.2533801, 0.9349852, 1, 1, 1, 1, 1,
1.088473, 2.000045, 0.9013734, 1, 1, 1, 1, 1,
1.089795, 0.4213519, 1.113721, 1, 1, 1, 1, 1,
1.095202, 0.9957827, 1.574467, 1, 1, 1, 1, 1,
1.10453, 0.8413987, -0.5791576, 1, 1, 1, 1, 1,
1.113569, 1.787636, -0.2601156, 0, 0, 1, 1, 1,
1.116845, 0.5262672, 0.7502583, 1, 0, 0, 1, 1,
1.120853, 0.4715084, 0.1965348, 1, 0, 0, 1, 1,
1.12402, -0.06101208, 2.673325, 1, 0, 0, 1, 1,
1.126921, -0.1586141, 0.4652202, 1, 0, 0, 1, 1,
1.129638, 0.5689204, 1.312617, 1, 0, 0, 1, 1,
1.130327, 1.231607, -1.017874, 0, 0, 0, 1, 1,
1.131591, 0.8727669, 0.7543184, 0, 0, 0, 1, 1,
1.134883, -0.3550868, 1.4139, 0, 0, 0, 1, 1,
1.13496, -1.140556, 2.088212, 0, 0, 0, 1, 1,
1.141555, 2.19575, 2.686727, 0, 0, 0, 1, 1,
1.143101, 1.063458, 2.17781, 0, 0, 0, 1, 1,
1.143435, 0.523358, 0.7922519, 0, 0, 0, 1, 1,
1.147495, -0.3696974, 0.1091163, 1, 1, 1, 1, 1,
1.153397, -0.6145101, 1.595473, 1, 1, 1, 1, 1,
1.153658, 0.7229788, 1.349826, 1, 1, 1, 1, 1,
1.154419, -1.231723, 1.218469, 1, 1, 1, 1, 1,
1.161033, 0.5059952, 2.489549, 1, 1, 1, 1, 1,
1.169813, 0.1917387, 0.3100775, 1, 1, 1, 1, 1,
1.177408, 0.4188341, 1.590095, 1, 1, 1, 1, 1,
1.183271, 2.38451, 2.200974, 1, 1, 1, 1, 1,
1.184872, -0.307857, 0.8171105, 1, 1, 1, 1, 1,
1.185305, 1.391523, 0.9210857, 1, 1, 1, 1, 1,
1.188096, -2.245935, 4.776245, 1, 1, 1, 1, 1,
1.205538, -1.757568, 2.485901, 1, 1, 1, 1, 1,
1.206225, -1.663858, 1.700319, 1, 1, 1, 1, 1,
1.209277, 0.3514105, 1.212825, 1, 1, 1, 1, 1,
1.216333, 0.2281658, 2.933399, 1, 1, 1, 1, 1,
1.216862, -0.5399911, 2.173559, 0, 0, 1, 1, 1,
1.217271, -1.41425, 2.004259, 1, 0, 0, 1, 1,
1.229099, 0.1999085, 2.039936, 1, 0, 0, 1, 1,
1.230405, -0.1506882, 3.097176, 1, 0, 0, 1, 1,
1.236269, 0.5599134, 0.4018701, 1, 0, 0, 1, 1,
1.237578, -0.1729293, 0.1735003, 1, 0, 0, 1, 1,
1.239592, 1.657074, 0.2400353, 0, 0, 0, 1, 1,
1.245136, -0.3462452, 2.730219, 0, 0, 0, 1, 1,
1.249888, -0.3947418, 2.331324, 0, 0, 0, 1, 1,
1.252226, -0.3447551, 2.131625, 0, 0, 0, 1, 1,
1.254431, -0.305195, 1.461603, 0, 0, 0, 1, 1,
1.255234, -0.7050096, 1.310964, 0, 0, 0, 1, 1,
1.256663, -0.7824507, 2.183742, 0, 0, 0, 1, 1,
1.280333, 0.6727104, 1.4733, 1, 1, 1, 1, 1,
1.281558, 0.8930942, -1.16214, 1, 1, 1, 1, 1,
1.283006, -0.1858677, 3.304066, 1, 1, 1, 1, 1,
1.28984, 0.362337, 2.090664, 1, 1, 1, 1, 1,
1.297906, -0.862551, 1.512803, 1, 1, 1, 1, 1,
1.299788, 0.0009119142, 3.080592, 1, 1, 1, 1, 1,
1.305734, -1.179711, 2.031763, 1, 1, 1, 1, 1,
1.309964, 0.7940363, 0.1707869, 1, 1, 1, 1, 1,
1.315085, 1.041736, 0.7184511, 1, 1, 1, 1, 1,
1.317638, -0.6273325, 1.229077, 1, 1, 1, 1, 1,
1.322638, 1.275009, 1.506519, 1, 1, 1, 1, 1,
1.326179, 0.2924784, 1.912143, 1, 1, 1, 1, 1,
1.331397, 2.273244, -0.1502154, 1, 1, 1, 1, 1,
1.332162, 0.51805, 1.804659, 1, 1, 1, 1, 1,
1.338894, -1.736883, 2.384953, 1, 1, 1, 1, 1,
1.339773, 0.1733442, 1.362231, 0, 0, 1, 1, 1,
1.348108, -1.246491, 2.271441, 1, 0, 0, 1, 1,
1.351881, -0.4042844, 2.319014, 1, 0, 0, 1, 1,
1.353427, -1.363602, 3.4621, 1, 0, 0, 1, 1,
1.357424, 1.718868, 1.136287, 1, 0, 0, 1, 1,
1.360091, -0.9670501, 3.293018, 1, 0, 0, 1, 1,
1.360377, 0.04331196, 1.288719, 0, 0, 0, 1, 1,
1.367531, 0.6638135, 0.7426344, 0, 0, 0, 1, 1,
1.369108, -1.731626, 2.109459, 0, 0, 0, 1, 1,
1.37346, -0.2151555, 2.455153, 0, 0, 0, 1, 1,
1.37655, 0.1402913, 1.716052, 0, 0, 0, 1, 1,
1.383066, -0.4162779, 3.667791, 0, 0, 0, 1, 1,
1.383242, 0.6271486, 1.803361, 0, 0, 0, 1, 1,
1.385756, 0.4507078, 1.07604, 1, 1, 1, 1, 1,
1.388817, 0.2631838, 1.890767, 1, 1, 1, 1, 1,
1.391039, -0.8540468, 1.161088, 1, 1, 1, 1, 1,
1.391526, -1.309604, 2.352883, 1, 1, 1, 1, 1,
1.394548, -0.8069305, 2.788512, 1, 1, 1, 1, 1,
1.409177, -1.570567, 3.652094, 1, 1, 1, 1, 1,
1.412254, 0.3400699, 1.436532, 1, 1, 1, 1, 1,
1.41356, -0.7465481, 1.68146, 1, 1, 1, 1, 1,
1.414105, -0.5389361, 0.9085641, 1, 1, 1, 1, 1,
1.419709, 1.551526, 1.530177, 1, 1, 1, 1, 1,
1.425152, -0.1796995, 2.767273, 1, 1, 1, 1, 1,
1.440202, -0.4723021, 1.819324, 1, 1, 1, 1, 1,
1.45195, -0.7078215, 2.83629, 1, 1, 1, 1, 1,
1.457097, -0.2105005, 2.507091, 1, 1, 1, 1, 1,
1.458714, -1.270479, 1.104861, 1, 1, 1, 1, 1,
1.460384, 0.06048815, 2.000663, 0, 0, 1, 1, 1,
1.465536, 0.7991472, 0.4524917, 1, 0, 0, 1, 1,
1.469556, 0.3084461, 1.211402, 1, 0, 0, 1, 1,
1.472312, -0.3470633, 2.224639, 1, 0, 0, 1, 1,
1.474999, -0.8792552, 2.519089, 1, 0, 0, 1, 1,
1.481546, -1.337242, 3.883573, 1, 0, 0, 1, 1,
1.482911, -0.2316106, 2.945908, 0, 0, 0, 1, 1,
1.483012, 1.47671, 1.836365, 0, 0, 0, 1, 1,
1.485602, 0.633924, -0.9787298, 0, 0, 0, 1, 1,
1.512988, -0.009902249, -0.4112563, 0, 0, 0, 1, 1,
1.522682, -0.8946651, 2.384684, 0, 0, 0, 1, 1,
1.528612, -0.7001121, 2.269431, 0, 0, 0, 1, 1,
1.540279, 0.2938057, 2.588907, 0, 0, 0, 1, 1,
1.547436, -0.2245044, 2.443912, 1, 1, 1, 1, 1,
1.549428, 0.4373446, 1.599768, 1, 1, 1, 1, 1,
1.557246, 1.863197, 1.437069, 1, 1, 1, 1, 1,
1.562821, -1.544942, 1.625632, 1, 1, 1, 1, 1,
1.569833, -2.339711, 2.484339, 1, 1, 1, 1, 1,
1.571051, 0.06356842, 1.766352, 1, 1, 1, 1, 1,
1.58156, -0.8328903, 1.407047, 1, 1, 1, 1, 1,
1.614421, -0.07910716, 0.3772036, 1, 1, 1, 1, 1,
1.624832, -1.268195, 3.170051, 1, 1, 1, 1, 1,
1.626385, -0.04649449, 1.582411, 1, 1, 1, 1, 1,
1.640068, 1.505684, 0.3797017, 1, 1, 1, 1, 1,
1.669161, -1.166033, 2.750349, 1, 1, 1, 1, 1,
1.671899, -1.821463, 2.381076, 1, 1, 1, 1, 1,
1.682179, -1.416229, 1.10604, 1, 1, 1, 1, 1,
1.683566, -0.3421401, 1.882356, 1, 1, 1, 1, 1,
1.694848, -0.6333851, 2.67775, 0, 0, 1, 1, 1,
1.703076, 1.461983, 1.15801, 1, 0, 0, 1, 1,
1.709444, 0.9413967, 1.762777, 1, 0, 0, 1, 1,
1.725193, -0.9495277, -0.1443248, 1, 0, 0, 1, 1,
1.726356, -1.450106, 1.973845, 1, 0, 0, 1, 1,
1.735769, -1.941813, 2.081356, 1, 0, 0, 1, 1,
1.736859, 1.392023, 1.907288, 0, 0, 0, 1, 1,
1.737192, -0.4346331, 2.300737, 0, 0, 0, 1, 1,
1.749702, -0.1643357, 3.400504, 0, 0, 0, 1, 1,
1.801629, -0.4554439, 2.087436, 0, 0, 0, 1, 1,
1.808339, 0.04072996, 2.229209, 0, 0, 0, 1, 1,
1.819252, -0.3946434, 1.928179, 0, 0, 0, 1, 1,
1.825982, 0.723452, 2.119078, 0, 0, 0, 1, 1,
1.827455, 1.300882, 1.557075, 1, 1, 1, 1, 1,
1.828203, 0.1826625, 2.056019, 1, 1, 1, 1, 1,
1.833708, 1.412139, 0.8373183, 1, 1, 1, 1, 1,
1.838364, 0.6391374, 2.118339, 1, 1, 1, 1, 1,
1.854067, -1.940721, 3.506752, 1, 1, 1, 1, 1,
1.854093, -0.3543696, 1.98114, 1, 1, 1, 1, 1,
1.861722, 0.3239289, 3.146896, 1, 1, 1, 1, 1,
1.862558, -0.2574326, 2.214975, 1, 1, 1, 1, 1,
1.869248, -0.8791702, 2.715847, 1, 1, 1, 1, 1,
1.902829, 0.1836273, 1.16935, 1, 1, 1, 1, 1,
1.93385, 1.106549, 0.5348021, 1, 1, 1, 1, 1,
1.934116, -0.4197622, 0.2756796, 1, 1, 1, 1, 1,
1.949079, 0.4610817, 0.9576134, 1, 1, 1, 1, 1,
1.958812, -1.002433, 3.34896, 1, 1, 1, 1, 1,
1.970527, 1.307101, 2.458719, 1, 1, 1, 1, 1,
1.971162, 0.7820016, -0.6636599, 0, 0, 1, 1, 1,
1.995287, 0.05638067, 0.9326937, 1, 0, 0, 1, 1,
2.059916, 0.03243599, 1.089424, 1, 0, 0, 1, 1,
2.076975, -0.9554529, 1.264045, 1, 0, 0, 1, 1,
2.095325, -0.8851363, 1.764745, 1, 0, 0, 1, 1,
2.146024, -1.092073, 2.773436, 1, 0, 0, 1, 1,
2.189414, 1.077595, 1.091432, 0, 0, 0, 1, 1,
2.197439, 0.1045873, 0.5882198, 0, 0, 0, 1, 1,
2.330925, -1.583569, 1.949135, 0, 0, 0, 1, 1,
2.388298, -1.115643, 1.362968, 0, 0, 0, 1, 1,
2.432735, 1.487948, 1.288758, 0, 0, 0, 1, 1,
2.442959, 2.422387, 1.08096, 0, 0, 0, 1, 1,
2.496649, 0.5118701, 1.406577, 0, 0, 0, 1, 1,
2.516886, -0.593713, 1.860595, 1, 1, 1, 1, 1,
2.547111, -0.7417853, 0.3596219, 1, 1, 1, 1, 1,
2.567633, 1.116587, 1.089208, 1, 1, 1, 1, 1,
2.631914, 0.9925238, 1.186073, 1, 1, 1, 1, 1,
2.635207, -0.1952736, 1.112958, 1, 1, 1, 1, 1,
2.781442, 0.9843572, 0.7012307, 1, 1, 1, 1, 1,
3.052652, -1.067354, 2.054446, 1, 1, 1, 1, 1
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
var radius = 9.755717;
var distance = 34.26654;
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
mvMatrix.translate( 0.1698742, 0.09192419, 0.283916 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26654);
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
