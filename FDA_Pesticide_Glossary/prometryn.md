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
-3.369552, 0.6719702, -0.1674869, 1, 0, 0, 1,
-3.331773, 0.4202877, -1.227756, 1, 0.007843138, 0, 1,
-3.060944, -0.428158, -3.185213, 1, 0.01176471, 0, 1,
-2.80146, -0.2736983, -1.686347, 1, 0.01960784, 0, 1,
-2.801167, -0.02587528, -1.819877, 1, 0.02352941, 0, 1,
-2.79389, 0.6358086, -1.466943, 1, 0.03137255, 0, 1,
-2.686257, -0.8521739, 0.06531011, 1, 0.03529412, 0, 1,
-2.613713, 0.3022276, -0.08136063, 1, 0.04313726, 0, 1,
-2.577552, -0.6080181, -0.9947113, 1, 0.04705882, 0, 1,
-2.57457, 0.1548483, -2.013258, 1, 0.05490196, 0, 1,
-2.525893, -0.9590577, -1.350297, 1, 0.05882353, 0, 1,
-2.305889, -0.635766, -2.31936, 1, 0.06666667, 0, 1,
-2.232254, -0.09708968, -1.763862, 1, 0.07058824, 0, 1,
-2.228718, 1.83766, -2.693534, 1, 0.07843138, 0, 1,
-2.209079, 0.05796419, -0.46191, 1, 0.08235294, 0, 1,
-2.203735, 1.858686, -2.223744, 1, 0.09019608, 0, 1,
-2.200768, -1.196064, -1.746808, 1, 0.09411765, 0, 1,
-2.180347, -0.5251243, -2.689363, 1, 0.1019608, 0, 1,
-2.171726, 2.185716, -0.9095966, 1, 0.1098039, 0, 1,
-2.165988, -0.1000363, -1.387666, 1, 0.1137255, 0, 1,
-2.096572, -0.2857122, -1.297577, 1, 0.1215686, 0, 1,
-2.071118, -0.4728389, -0.966836, 1, 0.1254902, 0, 1,
-2.069225, 1.051695, 0.009718682, 1, 0.1333333, 0, 1,
-2.04606, 0.7500733, -2.460711, 1, 0.1372549, 0, 1,
-2.008689, 0.839345, -0.1207968, 1, 0.145098, 0, 1,
-1.979236, -0.1338334, -1.596794, 1, 0.1490196, 0, 1,
-1.939932, -0.6842946, -2.62157, 1, 0.1568628, 0, 1,
-1.924828, 0.9052666, -0.7819544, 1, 0.1607843, 0, 1,
-1.92322, 0.3423237, -2.019031, 1, 0.1686275, 0, 1,
-1.898428, -0.5125211, -1.859168, 1, 0.172549, 0, 1,
-1.871623, 2.127326, -0.2151816, 1, 0.1803922, 0, 1,
-1.870926, -0.4639958, -1.517594, 1, 0.1843137, 0, 1,
-1.861851, -0.4774847, -2.51327, 1, 0.1921569, 0, 1,
-1.853284, -0.1334336, -2.859141, 1, 0.1960784, 0, 1,
-1.841688, -1.322915, -2.384842, 1, 0.2039216, 0, 1,
-1.794237, 0.4636382, -0.6432787, 1, 0.2117647, 0, 1,
-1.794179, -1.028252, -2.699863, 1, 0.2156863, 0, 1,
-1.786305, -0.5125353, -1.008871, 1, 0.2235294, 0, 1,
-1.784868, -0.1353826, -3.037083, 1, 0.227451, 0, 1,
-1.772048, -0.785813, -1.362914, 1, 0.2352941, 0, 1,
-1.770247, -2.107129, -2.615702, 1, 0.2392157, 0, 1,
-1.76798, -0.03090324, -2.55955, 1, 0.2470588, 0, 1,
-1.761639, 1.48215, -2.436545, 1, 0.2509804, 0, 1,
-1.753977, 0.2322625, -1.558669, 1, 0.2588235, 0, 1,
-1.75175, 0.2734996, -1.624211, 1, 0.2627451, 0, 1,
-1.738075, 1.990812, -0.1291331, 1, 0.2705882, 0, 1,
-1.734116, 0.6278792, -2.121766, 1, 0.2745098, 0, 1,
-1.719899, -1.37154, -1.682854, 1, 0.282353, 0, 1,
-1.713839, 0.08078888, -0.6364871, 1, 0.2862745, 0, 1,
-1.700219, -0.2120001, -0.9438759, 1, 0.2941177, 0, 1,
-1.686347, -1.021299, -2.818688, 1, 0.3019608, 0, 1,
-1.672733, -0.1118611, -3.299905, 1, 0.3058824, 0, 1,
-1.669306, -1.000376, -1.920994, 1, 0.3137255, 0, 1,
-1.665607, 1.53368, -0.08113993, 1, 0.3176471, 0, 1,
-1.664788, -1.273952, -2.830369, 1, 0.3254902, 0, 1,
-1.650824, -1.673133, -1.867495, 1, 0.3294118, 0, 1,
-1.648897, 0.01176936, -2.437119, 1, 0.3372549, 0, 1,
-1.631264, -0.3836611, -4.555824, 1, 0.3411765, 0, 1,
-1.629794, 0.01090683, 0.8707265, 1, 0.3490196, 0, 1,
-1.629661, -0.8454242, -0.7305371, 1, 0.3529412, 0, 1,
-1.627549, -0.07250325, -2.712824, 1, 0.3607843, 0, 1,
-1.610162, 0.905649, -0.1443514, 1, 0.3647059, 0, 1,
-1.595965, 0.06438398, -1.143758, 1, 0.372549, 0, 1,
-1.588327, -1.044713, -1.736789, 1, 0.3764706, 0, 1,
-1.561495, -1.803699, -1.328147, 1, 0.3843137, 0, 1,
-1.55637, 0.4741431, -1.49661, 1, 0.3882353, 0, 1,
-1.551193, -1.232965, -2.479378, 1, 0.3960784, 0, 1,
-1.551169, 0.1954326, -1.637023, 1, 0.4039216, 0, 1,
-1.536571, -0.1423428, -2.274592, 1, 0.4078431, 0, 1,
-1.510227, 0.2623765, -2.965627, 1, 0.4156863, 0, 1,
-1.499029, 0.5033224, -2.640834, 1, 0.4196078, 0, 1,
-1.497099, 0.4165023, -1.075854, 1, 0.427451, 0, 1,
-1.49405, 0.3095798, -0.1613443, 1, 0.4313726, 0, 1,
-1.49251, 0.5253175, -1.368326, 1, 0.4392157, 0, 1,
-1.484821, 1.008992, -0.8727362, 1, 0.4431373, 0, 1,
-1.48374, 1.896648, -2.191415, 1, 0.4509804, 0, 1,
-1.474843, -0.6696663, -0.5896144, 1, 0.454902, 0, 1,
-1.46145, 0.4029571, -1.614888, 1, 0.4627451, 0, 1,
-1.460189, -0.6351346, -4.277007, 1, 0.4666667, 0, 1,
-1.458888, -2.198178, -3.011301, 1, 0.4745098, 0, 1,
-1.450432, 0.3186382, -0.6673921, 1, 0.4784314, 0, 1,
-1.441491, -0.5307029, -1.022861, 1, 0.4862745, 0, 1,
-1.42599, -0.7327349, -0.6908811, 1, 0.4901961, 0, 1,
-1.423198, 0.8188321, -1.859464, 1, 0.4980392, 0, 1,
-1.412406, -0.5194591, -2.637208, 1, 0.5058824, 0, 1,
-1.396631, 0.2162573, -2.125123, 1, 0.509804, 0, 1,
-1.394461, 1.566181, 0.3409867, 1, 0.5176471, 0, 1,
-1.392951, 0.01357393, 1.107606, 1, 0.5215687, 0, 1,
-1.39103, -1.161261, -1.715417, 1, 0.5294118, 0, 1,
-1.389485, 0.2800038, -0.5922411, 1, 0.5333334, 0, 1,
-1.367837, 0.1381031, -0.2483921, 1, 0.5411765, 0, 1,
-1.358182, -1.515393, -2.587744, 1, 0.5450981, 0, 1,
-1.339836, -0.03986434, -1.347879, 1, 0.5529412, 0, 1,
-1.338046, 0.7083197, -2.040093, 1, 0.5568628, 0, 1,
-1.333748, 0.5724439, -2.158085, 1, 0.5647059, 0, 1,
-1.333428, -0.5721169, -1.892239, 1, 0.5686275, 0, 1,
-1.328527, 0.5573491, 0.04019606, 1, 0.5764706, 0, 1,
-1.323369, 1.350764, -2.255369, 1, 0.5803922, 0, 1,
-1.322111, -1.188257, -2.898096, 1, 0.5882353, 0, 1,
-1.314913, -0.0784173, -0.2143816, 1, 0.5921569, 0, 1,
-1.309922, -1.126515, -2.778718, 1, 0.6, 0, 1,
-1.301099, 1.457555, -0.8805979, 1, 0.6078432, 0, 1,
-1.290334, 0.2424999, -1.063482, 1, 0.6117647, 0, 1,
-1.282111, -0.1868965, -2.360865, 1, 0.6196079, 0, 1,
-1.277008, -0.04130981, -0.9721098, 1, 0.6235294, 0, 1,
-1.27246, -0.295675, -1.100588, 1, 0.6313726, 0, 1,
-1.270293, 0.7527962, -1.139817, 1, 0.6352941, 0, 1,
-1.269942, 0.03914047, -2.637232, 1, 0.6431373, 0, 1,
-1.264625, -0.8564758, -2.588198, 1, 0.6470588, 0, 1,
-1.260599, -0.0326819, -1.059041, 1, 0.654902, 0, 1,
-1.251428, -0.3136193, -1.935408, 1, 0.6588235, 0, 1,
-1.251349, -0.1682065, -0.7292646, 1, 0.6666667, 0, 1,
-1.246106, -0.05984187, -1.92266, 1, 0.6705883, 0, 1,
-1.244134, -0.9881256, -2.178351, 1, 0.6784314, 0, 1,
-1.241715, -1.622477, -2.954569, 1, 0.682353, 0, 1,
-1.229829, -0.8821967, -2.092643, 1, 0.6901961, 0, 1,
-1.229333, -0.9059076, -4.014594, 1, 0.6941177, 0, 1,
-1.224936, 0.1037135, -3.608115, 1, 0.7019608, 0, 1,
-1.215806, -0.5333293, -1.827244, 1, 0.7098039, 0, 1,
-1.214609, 0.6775791, -1.725404, 1, 0.7137255, 0, 1,
-1.206943, 0.04422767, -3.727561, 1, 0.7215686, 0, 1,
-1.19621, 0.4672917, -0.7717161, 1, 0.7254902, 0, 1,
-1.193968, -0.5111587, -1.771685, 1, 0.7333333, 0, 1,
-1.185425, -0.8410835, -2.624231, 1, 0.7372549, 0, 1,
-1.181666, -0.3329803, -3.835948, 1, 0.7450981, 0, 1,
-1.17018, -0.3980053, -0.3739866, 1, 0.7490196, 0, 1,
-1.170079, -0.2001518, -0.3491412, 1, 0.7568628, 0, 1,
-1.168989, 0.9660932, -0.7714505, 1, 0.7607843, 0, 1,
-1.167025, 0.2660971, -1.796013, 1, 0.7686275, 0, 1,
-1.165516, 0.03368132, -0.8523297, 1, 0.772549, 0, 1,
-1.162686, -0.2953952, -0.89854, 1, 0.7803922, 0, 1,
-1.161258, 1.189666, -2.396295, 1, 0.7843137, 0, 1,
-1.156611, 0.345178, -0.4796802, 1, 0.7921569, 0, 1,
-1.152641, -0.6234486, -1.667847, 1, 0.7960784, 0, 1,
-1.14997, 1.837773, -0.2668435, 1, 0.8039216, 0, 1,
-1.149818, 0.00581288, -1.503028, 1, 0.8117647, 0, 1,
-1.148486, 1.112427, -2.023627, 1, 0.8156863, 0, 1,
-1.144092, -0.7104197, -2.39386, 1, 0.8235294, 0, 1,
-1.142576, 0.07794461, -0.06581923, 1, 0.827451, 0, 1,
-1.139819, 0.4391299, -1.119633, 1, 0.8352941, 0, 1,
-1.138826, 0.06008851, -3.669693, 1, 0.8392157, 0, 1,
-1.129829, 0.1480045, -1.96677, 1, 0.8470588, 0, 1,
-1.127256, -0.5050378, -2.490751, 1, 0.8509804, 0, 1,
-1.122234, -0.6050372, -2.554772, 1, 0.8588235, 0, 1,
-1.11187, -1.269385, -1.695443, 1, 0.8627451, 0, 1,
-1.098868, 0.3385113, -1.671348, 1, 0.8705882, 0, 1,
-1.093287, -0.8936073, -4.354238, 1, 0.8745098, 0, 1,
-1.086665, 0.1194416, -0.7968298, 1, 0.8823529, 0, 1,
-1.083623, -0.6637065, -0.6779196, 1, 0.8862745, 0, 1,
-1.078341, -0.04818995, -1.257256, 1, 0.8941177, 0, 1,
-1.067723, -0.4862268, -1.928395, 1, 0.8980392, 0, 1,
-1.066746, 2.716179, 0.9344824, 1, 0.9058824, 0, 1,
-1.0551, 0.9004224, -2.549302, 1, 0.9137255, 0, 1,
-1.054179, 1.47297, -0.6037013, 1, 0.9176471, 0, 1,
-1.052755, -1.244259, -0.1518943, 1, 0.9254902, 0, 1,
-1.050557, -0.207252, -2.283116, 1, 0.9294118, 0, 1,
-1.049809, -2.205273, -2.737771, 1, 0.9372549, 0, 1,
-1.043749, 1.313147, -0.609342, 1, 0.9411765, 0, 1,
-1.035693, 1.142749, -1.582986, 1, 0.9490196, 0, 1,
-1.032144, -0.9740548, -1.611399, 1, 0.9529412, 0, 1,
-1.032027, -0.2250312, -0.9603463, 1, 0.9607843, 0, 1,
-1.029565, -1.557037, -1.651589, 1, 0.9647059, 0, 1,
-1.020462, -0.6324217, -2.909289, 1, 0.972549, 0, 1,
-1.008919, 2.645586, -0.5079255, 1, 0.9764706, 0, 1,
-1.00512, -0.2118477, -1.360962, 1, 0.9843137, 0, 1,
-0.9879088, 1.099983, -1.185953, 1, 0.9882353, 0, 1,
-0.984476, 1.396066, 0.4237353, 1, 0.9960784, 0, 1,
-0.97594, -1.052124, -3.409542, 0.9960784, 1, 0, 1,
-0.9701048, -1.188627, -3.151632, 0.9921569, 1, 0, 1,
-0.969434, 0.6201449, -2.93347, 0.9843137, 1, 0, 1,
-0.968002, -0.5556567, -1.608499, 0.9803922, 1, 0, 1,
-0.9662579, -0.009019005, 0.1440214, 0.972549, 1, 0, 1,
-0.9641718, -0.04565557, -1.931114, 0.9686275, 1, 0, 1,
-0.9608913, -0.8657112, -3.120881, 0.9607843, 1, 0, 1,
-0.9529512, 0.8724829, -0.01070142, 0.9568627, 1, 0, 1,
-0.9448826, 0.1871933, -1.522284, 0.9490196, 1, 0, 1,
-0.9427909, 0.6714465, -1.599425, 0.945098, 1, 0, 1,
-0.937391, 0.1236571, -1.756605, 0.9372549, 1, 0, 1,
-0.9316137, 0.9552071, -0.001248351, 0.9333333, 1, 0, 1,
-0.9292615, 0.4776312, -0.2720128, 0.9254902, 1, 0, 1,
-0.9230605, 0.3435962, -1.203063, 0.9215686, 1, 0, 1,
-0.9192468, -0.3619245, -2.175807, 0.9137255, 1, 0, 1,
-0.9147447, -0.1284706, -1.353284, 0.9098039, 1, 0, 1,
-0.9135318, 0.3188501, -0.7851691, 0.9019608, 1, 0, 1,
-0.9043883, -0.7526481, -1.412785, 0.8941177, 1, 0, 1,
-0.8964541, -1.407488, -3.290718, 0.8901961, 1, 0, 1,
-0.8931133, -0.133105, -1.383488, 0.8823529, 1, 0, 1,
-0.8919853, -1.081683, -2.300213, 0.8784314, 1, 0, 1,
-0.8840424, -1.666489, -4.357737, 0.8705882, 1, 0, 1,
-0.8754809, 0.3710701, -1.275991, 0.8666667, 1, 0, 1,
-0.8745407, 0.08706693, -0.1214926, 0.8588235, 1, 0, 1,
-0.8678427, -1.920226, -2.468775, 0.854902, 1, 0, 1,
-0.8675275, 1.318225, -0.2289769, 0.8470588, 1, 0, 1,
-0.8648175, 1.508132, -1.701796, 0.8431373, 1, 0, 1,
-0.8631249, 0.9055045, -1.927896, 0.8352941, 1, 0, 1,
-0.8579701, -0.2916091, -4.264591, 0.8313726, 1, 0, 1,
-0.8461418, -0.4938106, -0.1127566, 0.8235294, 1, 0, 1,
-0.8439775, 1.35244, -0.8167283, 0.8196079, 1, 0, 1,
-0.8430635, -0.454398, -3.66789, 0.8117647, 1, 0, 1,
-0.8401636, 0.3987722, -0.3947689, 0.8078431, 1, 0, 1,
-0.8377693, 0.8387068, -1.181399, 0.8, 1, 0, 1,
-0.8323041, 1.405353, -1.064014, 0.7921569, 1, 0, 1,
-0.8293834, -0.2772338, -1.365043, 0.7882353, 1, 0, 1,
-0.8241806, 1.515285, 0.5593872, 0.7803922, 1, 0, 1,
-0.8201198, -1.019101, -2.865546, 0.7764706, 1, 0, 1,
-0.8195408, -1.524969, -3.453405, 0.7686275, 1, 0, 1,
-0.8185119, -0.4885323, -2.048139, 0.7647059, 1, 0, 1,
-0.8039322, 0.3021394, -1.0669, 0.7568628, 1, 0, 1,
-0.8038369, 0.2009661, -0.1373645, 0.7529412, 1, 0, 1,
-0.8035216, -0.1564094, -0.07500841, 0.7450981, 1, 0, 1,
-0.80017, -0.6922951, -0.5935441, 0.7411765, 1, 0, 1,
-0.7963883, 1.162419, -0.3248982, 0.7333333, 1, 0, 1,
-0.7949954, 0.1797076, -2.325305, 0.7294118, 1, 0, 1,
-0.7947738, 0.08727971, -1.573515, 0.7215686, 1, 0, 1,
-0.7892648, 0.7587969, -0.257706, 0.7176471, 1, 0, 1,
-0.7892635, -1.386237, -2.71165, 0.7098039, 1, 0, 1,
-0.7878456, -2.174772, -3.661851, 0.7058824, 1, 0, 1,
-0.7870975, -0.6080958, -2.782436, 0.6980392, 1, 0, 1,
-0.7802891, 0.9992413, -1.237972, 0.6901961, 1, 0, 1,
-0.7742011, -0.6230634, -2.287915, 0.6862745, 1, 0, 1,
-0.7724289, 0.9614474, -1.91267, 0.6784314, 1, 0, 1,
-0.7713315, 0.2360682, -1.92257, 0.6745098, 1, 0, 1,
-0.7702515, 1.217611, -1.030113, 0.6666667, 1, 0, 1,
-0.7697015, 0.1569342, -1.414658, 0.6627451, 1, 0, 1,
-0.7689529, 0.07066797, -0.9878462, 0.654902, 1, 0, 1,
-0.7656037, -0.2221179, -1.63596, 0.6509804, 1, 0, 1,
-0.7647198, -0.2058853, -3.703714, 0.6431373, 1, 0, 1,
-0.7561489, -0.8810546, -3.181779, 0.6392157, 1, 0, 1,
-0.7520124, 0.1407116, -3.00766, 0.6313726, 1, 0, 1,
-0.7499835, -1.035344, -1.389841, 0.627451, 1, 0, 1,
-0.7439781, 0.8334245, 0.08691602, 0.6196079, 1, 0, 1,
-0.7406623, -1.191556, -4.251623, 0.6156863, 1, 0, 1,
-0.7392839, 0.2708088, 0.1843641, 0.6078432, 1, 0, 1,
-0.7335894, -1.310514, -2.491469, 0.6039216, 1, 0, 1,
-0.7289467, -1.480328, -2.183128, 0.5960785, 1, 0, 1,
-0.725162, 0.3482296, -2.045578, 0.5882353, 1, 0, 1,
-0.7057387, -0.6763346, -1.265886, 0.5843138, 1, 0, 1,
-0.7028876, -0.3511095, -1.365273, 0.5764706, 1, 0, 1,
-0.6973007, 0.5635143, -1.252434, 0.572549, 1, 0, 1,
-0.6953908, -1.345574, -4.661707, 0.5647059, 1, 0, 1,
-0.6925238, -0.01560239, -2.016961, 0.5607843, 1, 0, 1,
-0.6914363, -0.7776481, -3.93215, 0.5529412, 1, 0, 1,
-0.6880996, -1.00948, -1.628525, 0.5490196, 1, 0, 1,
-0.6838284, -0.3358768, -1.464369, 0.5411765, 1, 0, 1,
-0.683125, 0.1852498, -1.185215, 0.5372549, 1, 0, 1,
-0.6778519, 0.06061169, -2.68813, 0.5294118, 1, 0, 1,
-0.6757014, 1.949558, 2.356897, 0.5254902, 1, 0, 1,
-0.6731932, 0.1568737, -2.117098, 0.5176471, 1, 0, 1,
-0.6674847, 1.259727, -2.104731, 0.5137255, 1, 0, 1,
-0.6533604, -0.1099333, -0.6036085, 0.5058824, 1, 0, 1,
-0.6526754, 1.78702, 0.2513916, 0.5019608, 1, 0, 1,
-0.6525555, 0.1983301, -1.613303, 0.4941176, 1, 0, 1,
-0.6513298, 0.960665, -0.8623936, 0.4862745, 1, 0, 1,
-0.6472304, 0.005027406, -1.061309, 0.4823529, 1, 0, 1,
-0.6425417, 0.3476903, -0.5358889, 0.4745098, 1, 0, 1,
-0.6418225, -0.8412322, -3.074245, 0.4705882, 1, 0, 1,
-0.6392807, 1.564128, -0.7667526, 0.4627451, 1, 0, 1,
-0.6380482, -1.949375, -3.770601, 0.4588235, 1, 0, 1,
-0.6347805, -1.567766, -2.61678, 0.4509804, 1, 0, 1,
-0.6319749, -0.4907387, -1.435954, 0.4470588, 1, 0, 1,
-0.6308051, -0.2898842, -2.40434, 0.4392157, 1, 0, 1,
-0.6252183, 0.2002864, -2.601521, 0.4352941, 1, 0, 1,
-0.6249469, -1.237011, -3.664088, 0.427451, 1, 0, 1,
-0.6171017, -0.5953295, -0.8797169, 0.4235294, 1, 0, 1,
-0.6133371, 0.8346043, -0.598617, 0.4156863, 1, 0, 1,
-0.6055697, 2.371309, 0.1441396, 0.4117647, 1, 0, 1,
-0.6038485, -0.8665285, -3.084978, 0.4039216, 1, 0, 1,
-0.6020527, 0.3789287, -0.3469612, 0.3960784, 1, 0, 1,
-0.5963989, -0.7955902, -3.044825, 0.3921569, 1, 0, 1,
-0.5949754, 0.5615347, -0.3777504, 0.3843137, 1, 0, 1,
-0.5916717, 0.2393963, -1.968264, 0.3803922, 1, 0, 1,
-0.589401, -0.05629365, -1.596187, 0.372549, 1, 0, 1,
-0.5881532, -0.180245, -0.7403986, 0.3686275, 1, 0, 1,
-0.5855947, 2.041736, -0.1941044, 0.3607843, 1, 0, 1,
-0.5849025, -1.714256, -4.200173, 0.3568628, 1, 0, 1,
-0.580294, -0.5945028, -2.471006, 0.3490196, 1, 0, 1,
-0.5738767, -1.706389, -2.21274, 0.345098, 1, 0, 1,
-0.5693229, 0.1243904, -0.7993295, 0.3372549, 1, 0, 1,
-0.5673653, -0.2025139, -2.586508, 0.3333333, 1, 0, 1,
-0.5624835, -1.098596, -1.420865, 0.3254902, 1, 0, 1,
-0.5536113, -2.50899, -5.078387, 0.3215686, 1, 0, 1,
-0.5531849, -1.835074, -3.25907, 0.3137255, 1, 0, 1,
-0.5520794, -1.423337, -3.960911, 0.3098039, 1, 0, 1,
-0.5480024, -1.44242, -2.231576, 0.3019608, 1, 0, 1,
-0.5470244, -1.399718, -3.217638, 0.2941177, 1, 0, 1,
-0.5421195, -0.8660611, -3.133605, 0.2901961, 1, 0, 1,
-0.5373263, 1.721984, 0.7080769, 0.282353, 1, 0, 1,
-0.5354486, 1.38635, -0.3668752, 0.2784314, 1, 0, 1,
-0.5352039, -1.972809, -1.355575, 0.2705882, 1, 0, 1,
-0.5334991, 1.386766, 0.4041797, 0.2666667, 1, 0, 1,
-0.5314153, -0.3161945, -1.678031, 0.2588235, 1, 0, 1,
-0.5282878, -1.641229, -4.45426, 0.254902, 1, 0, 1,
-0.5278144, -0.08254343, -1.638545, 0.2470588, 1, 0, 1,
-0.525835, 0.1531682, -0.00413424, 0.2431373, 1, 0, 1,
-0.5237741, -0.1739881, 1.175601, 0.2352941, 1, 0, 1,
-0.5226778, -0.525266, -0.9183576, 0.2313726, 1, 0, 1,
-0.5225444, 0.4551618, 1.267116, 0.2235294, 1, 0, 1,
-0.5204278, 0.2522698, -2.308764, 0.2196078, 1, 0, 1,
-0.5163722, 0.4026453, -1.651902, 0.2117647, 1, 0, 1,
-0.5133529, -1.003642, -1.98405, 0.2078431, 1, 0, 1,
-0.5130941, 0.4581457, -1.835604, 0.2, 1, 0, 1,
-0.5130728, -0.4212593, -2.197398, 0.1921569, 1, 0, 1,
-0.50856, 0.3833686, -0.6212308, 0.1882353, 1, 0, 1,
-0.5051871, -0.08656266, -2.356614, 0.1803922, 1, 0, 1,
-0.5002661, -1.63199, -4.294235, 0.1764706, 1, 0, 1,
-0.499367, 0.5387356, -1.117951, 0.1686275, 1, 0, 1,
-0.4957343, 0.5047319, -2.075445, 0.1647059, 1, 0, 1,
-0.495005, -1.31799, -3.026037, 0.1568628, 1, 0, 1,
-0.494279, -0.2248845, -1.696928, 0.1529412, 1, 0, 1,
-0.4937959, -1.605424, -1.720569, 0.145098, 1, 0, 1,
-0.4935034, 1.428199, 0.003167772, 0.1411765, 1, 0, 1,
-0.4914669, 1.178638, 1.056955, 0.1333333, 1, 0, 1,
-0.4898126, -1.29839, -3.638154, 0.1294118, 1, 0, 1,
-0.4868581, -0.8407985, -2.517497, 0.1215686, 1, 0, 1,
-0.4823043, -1.154749, -2.682699, 0.1176471, 1, 0, 1,
-0.4817094, -0.3302754, -0.3537225, 0.1098039, 1, 0, 1,
-0.4781219, 1.88531, -0.9532883, 0.1058824, 1, 0, 1,
-0.473847, -0.2695154, -3.141558, 0.09803922, 1, 0, 1,
-0.4724134, -1.516331, -4.576819, 0.09019608, 1, 0, 1,
-0.4652511, 1.643714, -1.83571, 0.08627451, 1, 0, 1,
-0.4625322, 0.9582206, -0.5608464, 0.07843138, 1, 0, 1,
-0.4614575, 1.520991, -1.284714, 0.07450981, 1, 0, 1,
-0.4588301, 1.275026, 1.321978, 0.06666667, 1, 0, 1,
-0.4517311, -0.2890538, -0.9457307, 0.0627451, 1, 0, 1,
-0.44787, 1.521042, 0.2047172, 0.05490196, 1, 0, 1,
-0.4463386, 0.04351878, 0.2980887, 0.05098039, 1, 0, 1,
-0.4415545, -0.05956892, -1.154826, 0.04313726, 1, 0, 1,
-0.4412071, -0.6829312, -3.877943, 0.03921569, 1, 0, 1,
-0.4391197, 0.2296739, -1.235047, 0.03137255, 1, 0, 1,
-0.4387444, 0.9844196, -2.040298, 0.02745098, 1, 0, 1,
-0.4385163, -2.018811, -3.623941, 0.01960784, 1, 0, 1,
-0.4372512, 0.7453758, 1.250596, 0.01568628, 1, 0, 1,
-0.4354708, -1.444105, -2.431438, 0.007843138, 1, 0, 1,
-0.4297589, 0.7376265, -1.614329, 0.003921569, 1, 0, 1,
-0.4293899, 1.618116, 0.4403532, 0, 1, 0.003921569, 1,
-0.4288809, -0.3967113, -2.180263, 0, 1, 0.01176471, 1,
-0.4230815, 2.672307, -1.72016, 0, 1, 0.01568628, 1,
-0.4206592, 0.9233205, 0.04994357, 0, 1, 0.02352941, 1,
-0.4198695, 0.1063256, -2.265324, 0, 1, 0.02745098, 1,
-0.4126725, -0.9948207, -2.123992, 0, 1, 0.03529412, 1,
-0.4087662, -0.3301203, -2.993672, 0, 1, 0.03921569, 1,
-0.4078478, 0.3279118, -4.134254, 0, 1, 0.04705882, 1,
-0.4071881, 0.6220059, -1.335254, 0, 1, 0.05098039, 1,
-0.4034534, 1.295905, 0.3221723, 0, 1, 0.05882353, 1,
-0.401204, 1.524472, -1.250179, 0, 1, 0.0627451, 1,
-0.3990336, 1.103213, 0.1786867, 0, 1, 0.07058824, 1,
-0.3976368, -0.2450903, -1.538848, 0, 1, 0.07450981, 1,
-0.3950759, -0.1828775, -2.698785, 0, 1, 0.08235294, 1,
-0.3933848, 2.12296, -2.721917, 0, 1, 0.08627451, 1,
-0.3891776, -0.1875228, -2.875021, 0, 1, 0.09411765, 1,
-0.3836801, -0.6185852, -2.602976, 0, 1, 0.1019608, 1,
-0.3795335, 0.6426975, 1.328364, 0, 1, 0.1058824, 1,
-0.3733151, 0.3942919, -1.274189, 0, 1, 0.1137255, 1,
-0.3627172, -0.9419048, -1.857753, 0, 1, 0.1176471, 1,
-0.3602918, 0.3826536, -1.407449, 0, 1, 0.1254902, 1,
-0.3585129, 0.229945, -1.657478, 0, 1, 0.1294118, 1,
-0.3561127, 0.1113249, -0.3316461, 0, 1, 0.1372549, 1,
-0.3558432, 1.009619, 0.832255, 0, 1, 0.1411765, 1,
-0.3442972, 1.796119, 0.3952709, 0, 1, 0.1490196, 1,
-0.3429084, 1.16321, -0.5198573, 0, 1, 0.1529412, 1,
-0.3427184, 0.0005298835, -1.538665, 0, 1, 0.1607843, 1,
-0.3422965, 1.575989, -0.4934992, 0, 1, 0.1647059, 1,
-0.3415158, 1.296954, -0.8008092, 0, 1, 0.172549, 1,
-0.3407721, 0.2882316, -0.555127, 0, 1, 0.1764706, 1,
-0.3382633, 0.5111031, 1.318119, 0, 1, 0.1843137, 1,
-0.3380656, 2.216457, 0.577517, 0, 1, 0.1882353, 1,
-0.3378832, -0.1468613, -2.258597, 0, 1, 0.1960784, 1,
-0.3354934, -0.3986385, -0.3158814, 0, 1, 0.2039216, 1,
-0.3345838, -0.6112772, -2.795153, 0, 1, 0.2078431, 1,
-0.3254054, -0.1073898, -0.5398238, 0, 1, 0.2156863, 1,
-0.3228826, 0.2412384, -1.64835, 0, 1, 0.2196078, 1,
-0.3214647, 0.5654028, -0.6090439, 0, 1, 0.227451, 1,
-0.3204508, -0.3871139, -2.50871, 0, 1, 0.2313726, 1,
-0.3152968, -0.3605994, -2.313449, 0, 1, 0.2392157, 1,
-0.3148927, 0.468539, -0.8282834, 0, 1, 0.2431373, 1,
-0.3132639, -1.314719, -3.076598, 0, 1, 0.2509804, 1,
-0.3121256, 0.6262713, -1.75602, 0, 1, 0.254902, 1,
-0.3076723, -1.309437, -3.427155, 0, 1, 0.2627451, 1,
-0.304359, -0.06309256, -2.124305, 0, 1, 0.2666667, 1,
-0.3015113, -1.000713, -3.315805, 0, 1, 0.2745098, 1,
-0.3010239, 0.7909179, -1.589588, 0, 1, 0.2784314, 1,
-0.2987651, 0.5149578, -0.4524243, 0, 1, 0.2862745, 1,
-0.2958277, -0.3732385, -3.8985, 0, 1, 0.2901961, 1,
-0.2901111, -0.02783022, -3.040238, 0, 1, 0.2980392, 1,
-0.2815666, 0.9529555, -0.3821263, 0, 1, 0.3058824, 1,
-0.2768811, -2.219753, -4.159961, 0, 1, 0.3098039, 1,
-0.2754653, 0.4345586, 0.2659535, 0, 1, 0.3176471, 1,
-0.2730667, -0.07971546, -2.994138, 0, 1, 0.3215686, 1,
-0.2727873, -1.175111, -3.949997, 0, 1, 0.3294118, 1,
-0.2723337, 0.419353, 0.9467958, 0, 1, 0.3333333, 1,
-0.2681099, -0.7932362, -2.469515, 0, 1, 0.3411765, 1,
-0.2679749, 0.8018669, -1.538501, 0, 1, 0.345098, 1,
-0.266553, 2.11555, -1.816391, 0, 1, 0.3529412, 1,
-0.262982, -1.767289, -2.386604, 0, 1, 0.3568628, 1,
-0.259699, 0.5805106, 0.5297101, 0, 1, 0.3647059, 1,
-0.257515, 0.6932676, -0.3652747, 0, 1, 0.3686275, 1,
-0.2494477, -0.3015361, -2.419208, 0, 1, 0.3764706, 1,
-0.2483797, -1.761684, -3.600389, 0, 1, 0.3803922, 1,
-0.2454583, 1.148892, -0.7610685, 0, 1, 0.3882353, 1,
-0.2443317, -0.6065063, -2.857777, 0, 1, 0.3921569, 1,
-0.2361112, -1.004137, -1.832098, 0, 1, 0.4, 1,
-0.2338999, -0.7908981, -3.614757, 0, 1, 0.4078431, 1,
-0.230253, 0.3364216, -0.3800244, 0, 1, 0.4117647, 1,
-0.2277148, 0.398592, -1.861295, 0, 1, 0.4196078, 1,
-0.2251437, -1.791047, -4.181497, 0, 1, 0.4235294, 1,
-0.224575, 0.6126105, -0.6224553, 0, 1, 0.4313726, 1,
-0.2193772, 0.05448351, -1.009841, 0, 1, 0.4352941, 1,
-0.2151068, -0.07951602, -0.8641161, 0, 1, 0.4431373, 1,
-0.2129414, 0.6962935, -0.174213, 0, 1, 0.4470588, 1,
-0.2079644, 0.3530088, 0.05717861, 0, 1, 0.454902, 1,
-0.2054107, -0.05901663, 0.008524894, 0, 1, 0.4588235, 1,
-0.2022167, 0.4433811, 0.3466095, 0, 1, 0.4666667, 1,
-0.1997409, 0.0355617, -0.5775746, 0, 1, 0.4705882, 1,
-0.1939479, 1.458394, 0.4398738, 0, 1, 0.4784314, 1,
-0.1923375, 1.696569, -1.75774, 0, 1, 0.4823529, 1,
-0.191499, 1.588539, -0.3878379, 0, 1, 0.4901961, 1,
-0.1872673, -0.6235607, -2.353917, 0, 1, 0.4941176, 1,
-0.1850128, 0.6951373, -1.558961, 0, 1, 0.5019608, 1,
-0.184621, 1.643915, 0.6031411, 0, 1, 0.509804, 1,
-0.1813542, 0.7513207, -1.071701, 0, 1, 0.5137255, 1,
-0.1798831, 0.3714132, -1.18264, 0, 1, 0.5215687, 1,
-0.1775169, 0.5457269, 0.2142048, 0, 1, 0.5254902, 1,
-0.1752178, 1.48211, -0.3208373, 0, 1, 0.5333334, 1,
-0.1749869, 0.242256, -1.460129, 0, 1, 0.5372549, 1,
-0.17454, -2.428192, -2.494479, 0, 1, 0.5450981, 1,
-0.1718444, -0.6339617, -2.045045, 0, 1, 0.5490196, 1,
-0.1709923, -0.8608454, -2.623439, 0, 1, 0.5568628, 1,
-0.1679704, 0.3620634, 0.9270453, 0, 1, 0.5607843, 1,
-0.1669445, 0.5285245, -2.096009, 0, 1, 0.5686275, 1,
-0.1647536, -0.05999736, 0.3417316, 0, 1, 0.572549, 1,
-0.1640075, 0.5208985, -2.245869, 0, 1, 0.5803922, 1,
-0.1630796, 0.9700717, 0.2453488, 0, 1, 0.5843138, 1,
-0.161602, -0.1586482, -0.9079247, 0, 1, 0.5921569, 1,
-0.1588978, 0.08279096, -2.037184, 0, 1, 0.5960785, 1,
-0.1580193, 0.6351207, 1.185394, 0, 1, 0.6039216, 1,
-0.1569443, 1.535121, 0.1059963, 0, 1, 0.6117647, 1,
-0.1542739, 0.1004664, -1.283742, 0, 1, 0.6156863, 1,
-0.1516217, -0.03309083, -3.109602, 0, 1, 0.6235294, 1,
-0.1508766, 0.265386, 0.5237949, 0, 1, 0.627451, 1,
-0.1498079, 2.575721, -2.094694, 0, 1, 0.6352941, 1,
-0.1426882, -0.182051, -2.771952, 0, 1, 0.6392157, 1,
-0.1421269, 0.8517137, -0.7506277, 0, 1, 0.6470588, 1,
-0.1401691, 0.9730867, -0.02075407, 0, 1, 0.6509804, 1,
-0.1395273, 0.7105691, -0.0300443, 0, 1, 0.6588235, 1,
-0.135554, 0.746735, 0.3314298, 0, 1, 0.6627451, 1,
-0.1346136, -0.2790823, -3.125864, 0, 1, 0.6705883, 1,
-0.1284987, 1.817962, 0.6633274, 0, 1, 0.6745098, 1,
-0.1276984, -0.8341891, -3.713234, 0, 1, 0.682353, 1,
-0.1242212, -0.5180144, -2.642243, 0, 1, 0.6862745, 1,
-0.1221005, 0.1336192, -1.807565, 0, 1, 0.6941177, 1,
-0.1119094, 1.088747, -1.346184, 0, 1, 0.7019608, 1,
-0.1039379, 0.2243074, -1.729881, 0, 1, 0.7058824, 1,
-0.1007288, -0.01208509, -1.036687, 0, 1, 0.7137255, 1,
-0.09929944, 0.9231809, 1.833928, 0, 1, 0.7176471, 1,
-0.0954826, 0.06051221, -1.977694, 0, 1, 0.7254902, 1,
-0.09514662, 0.4743344, -2.469501, 0, 1, 0.7294118, 1,
-0.09466714, -0.5459396, -0.4692306, 0, 1, 0.7372549, 1,
-0.0932372, 1.221091, 0.2519691, 0, 1, 0.7411765, 1,
-0.09094927, -0.07362738, -2.26915, 0, 1, 0.7490196, 1,
-0.08751283, 0.01931278, -1.968863, 0, 1, 0.7529412, 1,
-0.08679649, 1.659219, -0.8989734, 0, 1, 0.7607843, 1,
-0.07955106, -1.482291, -4.864494, 0, 1, 0.7647059, 1,
-0.07720876, 0.5052248, -0.1845934, 0, 1, 0.772549, 1,
-0.07695266, -0.2382, -2.693821, 0, 1, 0.7764706, 1,
-0.07629391, 0.9056968, -0.461227, 0, 1, 0.7843137, 1,
-0.074692, -0.7386903, -5.120909, 0, 1, 0.7882353, 1,
-0.07157129, 0.4703383, 0.7705843, 0, 1, 0.7960784, 1,
-0.07059409, 0.1415609, -0.919574, 0, 1, 0.8039216, 1,
-0.06957576, -1.317259, -3.214252, 0, 1, 0.8078431, 1,
-0.06634811, -0.2719985, -2.573131, 0, 1, 0.8156863, 1,
-0.06309846, -0.893855, -1.948117, 0, 1, 0.8196079, 1,
-0.06226271, 0.9369631, -0.5570455, 0, 1, 0.827451, 1,
-0.06207496, -0.6710468, -3.511065, 0, 1, 0.8313726, 1,
-0.060646, -0.1744687, -2.993761, 0, 1, 0.8392157, 1,
-0.05997102, -0.4352995, -2.732809, 0, 1, 0.8431373, 1,
-0.05884118, -1.230216, -2.98412, 0, 1, 0.8509804, 1,
-0.05243558, 0.7345642, 1.347376, 0, 1, 0.854902, 1,
-0.051361, 0.3093099, 2.170019, 0, 1, 0.8627451, 1,
-0.04744381, -0.8772748, -4.298836, 0, 1, 0.8666667, 1,
-0.04422165, -0.5446744, -2.27713, 0, 1, 0.8745098, 1,
-0.04301358, -2.419404, -2.790104, 0, 1, 0.8784314, 1,
-0.04115149, -0.9360111, -4.462358, 0, 1, 0.8862745, 1,
-0.03663428, -0.4230478, -2.093623, 0, 1, 0.8901961, 1,
-0.02980649, 0.7287703, 1.603923, 0, 1, 0.8980392, 1,
-0.02823288, -0.5708242, -0.5180995, 0, 1, 0.9058824, 1,
-0.02405433, -0.360625, -4.021527, 0, 1, 0.9098039, 1,
-0.02194949, -0.8420866, -3.713234, 0, 1, 0.9176471, 1,
-0.02017297, -1.823423, -4.016336, 0, 1, 0.9215686, 1,
-0.02012911, -1.057275, -3.02349, 0, 1, 0.9294118, 1,
-0.01734649, 2.073969, -0.1374223, 0, 1, 0.9333333, 1,
-0.01627335, -0.4797921, -1.758457, 0, 1, 0.9411765, 1,
-0.01517421, -2.256551, -4.005225, 0, 1, 0.945098, 1,
-0.01283, -0.08938406, -4.812727, 0, 1, 0.9529412, 1,
-0.009808916, -0.9225064, -3.709556, 0, 1, 0.9568627, 1,
-0.007718706, -0.5690625, -3.378379, 0, 1, 0.9647059, 1,
-0.00743848, 1.1442, -0.7318788, 0, 1, 0.9686275, 1,
-0.006705821, -0.09967663, -2.870858, 0, 1, 0.9764706, 1,
-0.005780476, -0.2652685, -3.932657, 0, 1, 0.9803922, 1,
0.0005057642, -0.2047706, 3.472314, 0, 1, 0.9882353, 1,
0.001857104, -0.1792273, 3.521286, 0, 1, 0.9921569, 1,
0.004857247, -0.8815868, 1.788826, 0, 1, 1, 1,
0.005089412, -0.9856348, 1.976438, 0, 0.9921569, 1, 1,
0.008104634, 0.507269, -0.3674525, 0, 0.9882353, 1, 1,
0.01063847, -0.6153438, 4.432987, 0, 0.9803922, 1, 1,
0.01793268, -0.009155509, 2.513375, 0, 0.9764706, 1, 1,
0.02102608, -2.267354, 3.043123, 0, 0.9686275, 1, 1,
0.02286791, -1.102144, 3.126967, 0, 0.9647059, 1, 1,
0.02494933, 1.35478, -2.970104, 0, 0.9568627, 1, 1,
0.02802486, 0.7576591, -1.849402, 0, 0.9529412, 1, 1,
0.02826297, 0.3948312, 1.176559, 0, 0.945098, 1, 1,
0.02847939, -0.8550534, 1.982546, 0, 0.9411765, 1, 1,
0.03002849, -0.5544332, 4.562284, 0, 0.9333333, 1, 1,
0.03010161, -1.022909, 2.212609, 0, 0.9294118, 1, 1,
0.03554668, -0.1790118, 1.101355, 0, 0.9215686, 1, 1,
0.03986798, -0.1289955, 3.920521, 0, 0.9176471, 1, 1,
0.04053362, -0.9810298, 3.151542, 0, 0.9098039, 1, 1,
0.04217941, 0.9071604, -0.8242157, 0, 0.9058824, 1, 1,
0.0432383, -0.002913125, 1.640046, 0, 0.8980392, 1, 1,
0.04511943, -0.6362259, 3.712286, 0, 0.8901961, 1, 1,
0.04765071, -0.1420525, 4.669342, 0, 0.8862745, 1, 1,
0.04992964, 0.2656367, 2.300535, 0, 0.8784314, 1, 1,
0.0567129, -0.1034781, 1.800463, 0, 0.8745098, 1, 1,
0.06012347, -1.177698, 1.894532, 0, 0.8666667, 1, 1,
0.06112298, 0.4020129, 0.1238933, 0, 0.8627451, 1, 1,
0.06291228, -1.154703, 3.697087, 0, 0.854902, 1, 1,
0.06576204, -1.581856, 3.38494, 0, 0.8509804, 1, 1,
0.06591258, 1.609365, 1.696441, 0, 0.8431373, 1, 1,
0.06644452, -0.07361843, 3.589621, 0, 0.8392157, 1, 1,
0.07158767, 0.2220177, 1.245551, 0, 0.8313726, 1, 1,
0.07597436, 0.2615302, -0.306327, 0, 0.827451, 1, 1,
0.07747825, 0.3425908, 0.39051, 0, 0.8196079, 1, 1,
0.07910699, -0.1737027, 1.41477, 0, 0.8156863, 1, 1,
0.08688886, -0.402071, 2.26462, 0, 0.8078431, 1, 1,
0.08691745, -0.1295136, 3.260765, 0, 0.8039216, 1, 1,
0.09028172, 0.5311311, -0.9139755, 0, 0.7960784, 1, 1,
0.09069872, -0.358203, 1.032878, 0, 0.7882353, 1, 1,
0.09223265, -1.556504, 1.867679, 0, 0.7843137, 1, 1,
0.09974111, -1.954726, 4.186992, 0, 0.7764706, 1, 1,
0.1011428, -0.6150311, 1.126938, 0, 0.772549, 1, 1,
0.1030516, -0.1573976, 3.872925, 0, 0.7647059, 1, 1,
0.1124082, -0.4860134, 4.798849, 0, 0.7607843, 1, 1,
0.1125923, -0.9165044, 3.320865, 0, 0.7529412, 1, 1,
0.1142321, -1.199557, 4.035161, 0, 0.7490196, 1, 1,
0.1250616, 2.235284, 1.079856, 0, 0.7411765, 1, 1,
0.1257226, 0.5115073, 1.939036, 0, 0.7372549, 1, 1,
0.1263704, -1.00549, 2.628392, 0, 0.7294118, 1, 1,
0.1274391, 1.541635, -0.5222002, 0, 0.7254902, 1, 1,
0.1295066, 0.2394984, 1.086641, 0, 0.7176471, 1, 1,
0.1387841, 1.930957, -0.2714924, 0, 0.7137255, 1, 1,
0.1403055, -1.497954, 3.299832, 0, 0.7058824, 1, 1,
0.1465438, -0.6139527, 1.930202, 0, 0.6980392, 1, 1,
0.1473612, 0.3457379, 1.240904, 0, 0.6941177, 1, 1,
0.1483956, -1.492983, 3.270353, 0, 0.6862745, 1, 1,
0.1520479, 1.082853, -0.2659408, 0, 0.682353, 1, 1,
0.1529382, -0.2310523, 2.901632, 0, 0.6745098, 1, 1,
0.1591328, -1.219357, 4.623913, 0, 0.6705883, 1, 1,
0.1593601, 1.361962, 0.4416896, 0, 0.6627451, 1, 1,
0.1595767, -1.705249, 3.810822, 0, 0.6588235, 1, 1,
0.1616265, -0.2169587, 1.575076, 0, 0.6509804, 1, 1,
0.1668426, -0.2381074, 3.778361, 0, 0.6470588, 1, 1,
0.1679616, -0.8267187, 3.793596, 0, 0.6392157, 1, 1,
0.1741697, -1.522781, 1.868492, 0, 0.6352941, 1, 1,
0.1745855, 0.03521889, 0.3877456, 0, 0.627451, 1, 1,
0.1752616, 0.778534, -0.3279179, 0, 0.6235294, 1, 1,
0.1772538, -0.6440424, 3.900279, 0, 0.6156863, 1, 1,
0.179572, -1.45365, 6.487545, 0, 0.6117647, 1, 1,
0.1807893, -0.1613469, 2.289308, 0, 0.6039216, 1, 1,
0.1817196, 0.4658217, 0.8616394, 0, 0.5960785, 1, 1,
0.1917614, 0.2167024, -0.499615, 0, 0.5921569, 1, 1,
0.1925167, 1.011117, 1.434456, 0, 0.5843138, 1, 1,
0.1931993, -3.282034, 4.864957, 0, 0.5803922, 1, 1,
0.1960497, -0.4892564, 4.591976, 0, 0.572549, 1, 1,
0.2046194, 0.4561192, 1.408922, 0, 0.5686275, 1, 1,
0.2059989, 0.1044811, 1.903674, 0, 0.5607843, 1, 1,
0.2084347, 1.981226, -0.2598225, 0, 0.5568628, 1, 1,
0.2104282, 0.2145181, 1.933614, 0, 0.5490196, 1, 1,
0.2128843, -0.05696428, 2.631609, 0, 0.5450981, 1, 1,
0.2151347, -0.4830024, 2.540305, 0, 0.5372549, 1, 1,
0.2177962, -0.9539739, 4.056057, 0, 0.5333334, 1, 1,
0.2280782, -0.6115496, 3.389169, 0, 0.5254902, 1, 1,
0.2286467, -1.927424, 2.363742, 0, 0.5215687, 1, 1,
0.235429, 0.9825212, 1.9116, 0, 0.5137255, 1, 1,
0.2361745, -3.351366, 2.912699, 0, 0.509804, 1, 1,
0.2408886, -0.6117158, 2.03591, 0, 0.5019608, 1, 1,
0.2432606, 0.8497915, 1.867174, 0, 0.4941176, 1, 1,
0.2444667, -1.116994, 3.645855, 0, 0.4901961, 1, 1,
0.2454226, -0.04981602, -0.6390753, 0, 0.4823529, 1, 1,
0.2459179, -1.279174, 2.156717, 0, 0.4784314, 1, 1,
0.2468119, 1.054904, -0.4601672, 0, 0.4705882, 1, 1,
0.2526626, -0.2067972, 2.181042, 0, 0.4666667, 1, 1,
0.2532846, 0.9646955, 1.313503, 0, 0.4588235, 1, 1,
0.2542932, 0.6744821, 0.4172636, 0, 0.454902, 1, 1,
0.2546835, -0.07652552, 1.321709, 0, 0.4470588, 1, 1,
0.2566864, -0.4965042, 2.03049, 0, 0.4431373, 1, 1,
0.2623179, -0.154352, 2.965402, 0, 0.4352941, 1, 1,
0.265076, 0.6621023, -0.9667365, 0, 0.4313726, 1, 1,
0.2708275, 1.371403, 1.537819, 0, 0.4235294, 1, 1,
0.277526, 0.6950788, -1.358422, 0, 0.4196078, 1, 1,
0.2803853, 0.0892232, 1.575216, 0, 0.4117647, 1, 1,
0.2817121, -0.708729, 4.189318, 0, 0.4078431, 1, 1,
0.2823962, 0.06120382, 2.209919, 0, 0.4, 1, 1,
0.2829103, 0.04530774, 2.673754, 0, 0.3921569, 1, 1,
0.2871211, 0.2156155, 1.840776, 0, 0.3882353, 1, 1,
0.2919177, 0.9718167, 1.378977, 0, 0.3803922, 1, 1,
0.2925341, 0.1351114, 1.752237, 0, 0.3764706, 1, 1,
0.2931057, 2.124755, 1.157513, 0, 0.3686275, 1, 1,
0.2935298, 0.5511925, 1.549608, 0, 0.3647059, 1, 1,
0.2940517, -2.012307, 1.900456, 0, 0.3568628, 1, 1,
0.2941462, -0.1244105, 2.264178, 0, 0.3529412, 1, 1,
0.2943852, 1.079026, 0.6547775, 0, 0.345098, 1, 1,
0.2978285, -0.3313776, 3.427906, 0, 0.3411765, 1, 1,
0.2985062, -0.03759044, 1.102255, 0, 0.3333333, 1, 1,
0.3012239, 0.7372173, 0.9722295, 0, 0.3294118, 1, 1,
0.301322, -0.5202402, 2.793681, 0, 0.3215686, 1, 1,
0.3060977, 1.347626, 1.885074, 0, 0.3176471, 1, 1,
0.3196459, -0.3337296, 2.406313, 0, 0.3098039, 1, 1,
0.320895, -1.045309, 2.967549, 0, 0.3058824, 1, 1,
0.3227065, -0.04429234, 0.92209, 0, 0.2980392, 1, 1,
0.3243347, -0.8124927, 3.090068, 0, 0.2901961, 1, 1,
0.3284419, 0.8847495, -0.2252016, 0, 0.2862745, 1, 1,
0.3291971, 1.952396, 1.736531, 0, 0.2784314, 1, 1,
0.3321713, 0.1828622, 1.362953, 0, 0.2745098, 1, 1,
0.3353781, -0.1708189, 1.188623, 0, 0.2666667, 1, 1,
0.3363679, -0.1893952, -0.2126884, 0, 0.2627451, 1, 1,
0.3384405, -1.17844, 3.005497, 0, 0.254902, 1, 1,
0.3404557, 1.18361, 0.5866513, 0, 0.2509804, 1, 1,
0.3415592, 0.912771, 0.6245471, 0, 0.2431373, 1, 1,
0.3447338, 0.3443865, 0.5325189, 0, 0.2392157, 1, 1,
0.3483998, 0.8288774, 1.107696, 0, 0.2313726, 1, 1,
0.3539625, -0.514181, 0.9510251, 0, 0.227451, 1, 1,
0.3540346, 0.4164411, 1.564478, 0, 0.2196078, 1, 1,
0.3582015, -1.80871, 3.891729, 0, 0.2156863, 1, 1,
0.3597287, 1.042727, -0.2246256, 0, 0.2078431, 1, 1,
0.3656988, -1.226593, 3.130377, 0, 0.2039216, 1, 1,
0.3684904, 0.560604, 2.959319, 0, 0.1960784, 1, 1,
0.3695378, -0.7461726, 2.795094, 0, 0.1882353, 1, 1,
0.3748078, -0.587768, 2.026902, 0, 0.1843137, 1, 1,
0.3784169, 0.1749748, 0.3468081, 0, 0.1764706, 1, 1,
0.3788661, -0.6173322, 2.12956, 0, 0.172549, 1, 1,
0.3822793, 0.8040483, 0.243849, 0, 0.1647059, 1, 1,
0.386745, -1.077273, 2.968524, 0, 0.1607843, 1, 1,
0.3872176, 0.7178609, -0.5185798, 0, 0.1529412, 1, 1,
0.3884455, -0.1054906, 0.9721437, 0, 0.1490196, 1, 1,
0.3893381, -0.9847181, 3.001679, 0, 0.1411765, 1, 1,
0.3905267, -0.1613384, 1.22011, 0, 0.1372549, 1, 1,
0.3917908, -0.3057361, 1.932562, 0, 0.1294118, 1, 1,
0.3918703, -0.06713244, 1.422333, 0, 0.1254902, 1, 1,
0.3935507, 0.8717801, 0.3324206, 0, 0.1176471, 1, 1,
0.3936283, -0.3039048, 1.351886, 0, 0.1137255, 1, 1,
0.3948914, -0.1534531, 2.071342, 0, 0.1058824, 1, 1,
0.397649, 0.241128, 0.7280046, 0, 0.09803922, 1, 1,
0.4013514, 1.136014, 1.923843, 0, 0.09411765, 1, 1,
0.402114, -0.3416944, 3.666831, 0, 0.08627451, 1, 1,
0.4049482, -0.9608487, 1.814572, 0, 0.08235294, 1, 1,
0.4054271, -0.7721508, 1.33603, 0, 0.07450981, 1, 1,
0.4065336, 0.8185769, -0.8178979, 0, 0.07058824, 1, 1,
0.4079315, 2.440418, 1.367428, 0, 0.0627451, 1, 1,
0.4099919, -0.7062656, 0.6636773, 0, 0.05882353, 1, 1,
0.4203857, -0.2370339, 1.429263, 0, 0.05098039, 1, 1,
0.4210618, 0.3249821, 1.835326, 0, 0.04705882, 1, 1,
0.4250967, 0.7701681, 0.9267054, 0, 0.03921569, 1, 1,
0.4251463, -0.4583796, 2.415804, 0, 0.03529412, 1, 1,
0.4258208, -0.1791354, 3.125065, 0, 0.02745098, 1, 1,
0.4268321, 0.1777363, 1.608331, 0, 0.02352941, 1, 1,
0.4271742, -0.02876956, 0.7482998, 0, 0.01568628, 1, 1,
0.428429, 1.858711, 0.6618224, 0, 0.01176471, 1, 1,
0.4333621, -0.0712773, 1.237633, 0, 0.003921569, 1, 1,
0.4396929, -0.441423, 3.323845, 0.003921569, 0, 1, 1,
0.4401478, -0.1374262, 1.663435, 0.007843138, 0, 1, 1,
0.45097, 1.044975, 1.023402, 0.01568628, 0, 1, 1,
0.4527471, 1.031718, -0.2904114, 0.01960784, 0, 1, 1,
0.4552858, 0.511788, 1.914618, 0.02745098, 0, 1, 1,
0.455305, 1.571155, 1.379248, 0.03137255, 0, 1, 1,
0.4553438, 1.227232, 0.2563769, 0.03921569, 0, 1, 1,
0.459065, -0.4162576, 1.675267, 0.04313726, 0, 1, 1,
0.4611908, 0.4041179, -0.3108111, 0.05098039, 0, 1, 1,
0.4673426, -0.1107374, 0.6739695, 0.05490196, 0, 1, 1,
0.4679681, 1.574021, -0.4515893, 0.0627451, 0, 1, 1,
0.4686677, 1.833026, -0.1275806, 0.06666667, 0, 1, 1,
0.4744032, -0.4067053, 3.476775, 0.07450981, 0, 1, 1,
0.4783658, 1.80131, 1.668932, 0.07843138, 0, 1, 1,
0.4795962, -1.103209, 1.575958, 0.08627451, 0, 1, 1,
0.4796817, 0.5725515, 0.9847465, 0.09019608, 0, 1, 1,
0.4812366, 0.06499638, 2.2616, 0.09803922, 0, 1, 1,
0.4841046, -1.005536, 0.8247737, 0.1058824, 0, 1, 1,
0.5012326, -0.1983483, 2.65518, 0.1098039, 0, 1, 1,
0.5023624, -0.5604796, 4.076833, 0.1176471, 0, 1, 1,
0.5084667, -0.1130737, 0.8769794, 0.1215686, 0, 1, 1,
0.5133177, 1.07043, 0.7295005, 0.1294118, 0, 1, 1,
0.5148248, 1.097654, 2.244379, 0.1333333, 0, 1, 1,
0.5151814, 1.087881, 0.4877899, 0.1411765, 0, 1, 1,
0.5154357, -1.208027, 3.589595, 0.145098, 0, 1, 1,
0.5171079, -1.6958, 3.190293, 0.1529412, 0, 1, 1,
0.5178726, 1.987935, 1.133824, 0.1568628, 0, 1, 1,
0.5194207, -0.07257199, 1.929508, 0.1647059, 0, 1, 1,
0.5213224, 0.1154791, 1.001488, 0.1686275, 0, 1, 1,
0.5248268, 0.5894397, 2.314099, 0.1764706, 0, 1, 1,
0.5290554, 0.4586687, 1.691076, 0.1803922, 0, 1, 1,
0.5320374, 0.8163497, 1.549791, 0.1882353, 0, 1, 1,
0.5335447, -0.1482206, 1.651841, 0.1921569, 0, 1, 1,
0.5473838, 0.3308861, 1.32973, 0.2, 0, 1, 1,
0.5521562, 1.494051, -0.7826707, 0.2078431, 0, 1, 1,
0.5526263, -2.275521, 4.346627, 0.2117647, 0, 1, 1,
0.5538217, -0.5019095, 3.414019, 0.2196078, 0, 1, 1,
0.5567116, -0.3814793, 1.729345, 0.2235294, 0, 1, 1,
0.5604582, -0.3572354, 2.443562, 0.2313726, 0, 1, 1,
0.5655405, -0.5275247, 2.965178, 0.2352941, 0, 1, 1,
0.5668852, -0.3338149, 1.967993, 0.2431373, 0, 1, 1,
0.5669649, 0.4151583, 0.06712982, 0.2470588, 0, 1, 1,
0.5679682, -0.4739514, 0.9662362, 0.254902, 0, 1, 1,
0.5771532, -0.2233013, 2.195807, 0.2588235, 0, 1, 1,
0.5867479, 0.7213371, 1.324223, 0.2666667, 0, 1, 1,
0.5928633, 0.06052452, -0.3943051, 0.2705882, 0, 1, 1,
0.5944239, -0.4776474, 3.341367, 0.2784314, 0, 1, 1,
0.5951853, 0.6695704, -0.5443346, 0.282353, 0, 1, 1,
0.6001161, 0.6756459, -1.248723, 0.2901961, 0, 1, 1,
0.6013066, 1.146747, 0.3521287, 0.2941177, 0, 1, 1,
0.6086923, -0.5496618, 1.034701, 0.3019608, 0, 1, 1,
0.6091715, 0.2229744, 0.4999782, 0.3098039, 0, 1, 1,
0.6132956, -1.210815, 2.101751, 0.3137255, 0, 1, 1,
0.6151559, -0.7339982, 3.500108, 0.3215686, 0, 1, 1,
0.6160074, 0.9782421, 0.4326977, 0.3254902, 0, 1, 1,
0.6164967, 0.3303886, 2.48566, 0.3333333, 0, 1, 1,
0.6199296, -0.5532818, 4.45306, 0.3372549, 0, 1, 1,
0.6205695, -2.618984, 3.815532, 0.345098, 0, 1, 1,
0.6236687, -0.8684351, 2.652828, 0.3490196, 0, 1, 1,
0.6268326, -0.1015053, 2.777131, 0.3568628, 0, 1, 1,
0.6296979, 1.151881, 0.1929181, 0.3607843, 0, 1, 1,
0.6319427, -1.390869, 3.656478, 0.3686275, 0, 1, 1,
0.636345, 0.5547929, -0.02721657, 0.372549, 0, 1, 1,
0.6370817, -0.8815641, 2.331975, 0.3803922, 0, 1, 1,
0.6392686, 0.656521, 1.774741, 0.3843137, 0, 1, 1,
0.6412612, 0.4584128, 1.557301, 0.3921569, 0, 1, 1,
0.6457165, 1.611044, 0.526344, 0.3960784, 0, 1, 1,
0.646597, -0.1984151, 1.561399, 0.4039216, 0, 1, 1,
0.6467444, 0.5668671, 1.539506, 0.4117647, 0, 1, 1,
0.6468356, 1.53761, -0.05925245, 0.4156863, 0, 1, 1,
0.6531273, 0.6578323, 1.188249, 0.4235294, 0, 1, 1,
0.6577819, 0.5236086, 0.9384744, 0.427451, 0, 1, 1,
0.6588947, -1.328594, 3.741949, 0.4352941, 0, 1, 1,
0.6615835, -0.006293138, -0.2704801, 0.4392157, 0, 1, 1,
0.662649, 0.7939075, 0.1939035, 0.4470588, 0, 1, 1,
0.6644927, 0.3810825, 1.214242, 0.4509804, 0, 1, 1,
0.6666865, -0.5895721, 2.618743, 0.4588235, 0, 1, 1,
0.6667476, 0.05207957, 1.807203, 0.4627451, 0, 1, 1,
0.6677537, 1.309906, 0.9249716, 0.4705882, 0, 1, 1,
0.6686419, 0.2399891, -0.8982872, 0.4745098, 0, 1, 1,
0.6782344, -1.194889, 3.615199, 0.4823529, 0, 1, 1,
0.6797325, -1.022511, 3.110009, 0.4862745, 0, 1, 1,
0.6804547, -0.3209767, 3.032944, 0.4941176, 0, 1, 1,
0.6839101, -1.185697, 1.592251, 0.5019608, 0, 1, 1,
0.6868179, -0.005761774, 1.116036, 0.5058824, 0, 1, 1,
0.6890899, -0.03412592, 1.986259, 0.5137255, 0, 1, 1,
0.6919633, -0.387975, 1.886344, 0.5176471, 0, 1, 1,
0.6930226, 0.8592486, 1.328636, 0.5254902, 0, 1, 1,
0.69444, -2.07063, 2.883032, 0.5294118, 0, 1, 1,
0.6986575, 0.1059583, 1.440972, 0.5372549, 0, 1, 1,
0.6987628, -1.326737, 3.075449, 0.5411765, 0, 1, 1,
0.7035014, -0.5667831, -0.0730493, 0.5490196, 0, 1, 1,
0.7046579, 0.4564415, 0.5382321, 0.5529412, 0, 1, 1,
0.7048703, -1.104514, 2.593387, 0.5607843, 0, 1, 1,
0.7086444, -1.265226, 1.44333, 0.5647059, 0, 1, 1,
0.7136122, -1.008855, 1.980453, 0.572549, 0, 1, 1,
0.7144439, 0.3050776, 0.7008123, 0.5764706, 0, 1, 1,
0.7197331, -0.8414481, 3.393218, 0.5843138, 0, 1, 1,
0.7276487, 0.2381408, 1.024317, 0.5882353, 0, 1, 1,
0.7326517, 0.05268476, 1.257832, 0.5960785, 0, 1, 1,
0.7389081, -1.483585, 1.985498, 0.6039216, 0, 1, 1,
0.7406817, 0.6606703, 1.314422, 0.6078432, 0, 1, 1,
0.7441414, 0.4213046, 1.695985, 0.6156863, 0, 1, 1,
0.7442158, -0.7604775, 2.464212, 0.6196079, 0, 1, 1,
0.7442436, -0.7440068, 3.780689, 0.627451, 0, 1, 1,
0.7451382, -2.051859, 3.219821, 0.6313726, 0, 1, 1,
0.7452178, -1.373876, 3.71728, 0.6392157, 0, 1, 1,
0.7511211, -1.134353, 3.019082, 0.6431373, 0, 1, 1,
0.7516926, 0.1955191, 0.2243348, 0.6509804, 0, 1, 1,
0.7545221, -1.641649, 2.909016, 0.654902, 0, 1, 1,
0.7548293, 0.4490429, 0.4921159, 0.6627451, 0, 1, 1,
0.7587174, 0.3212197, 0.2259163, 0.6666667, 0, 1, 1,
0.769759, 0.9914052, -0.1747928, 0.6745098, 0, 1, 1,
0.7714719, -1.335659, 0.5072172, 0.6784314, 0, 1, 1,
0.77232, 0.09042168, 0.1875017, 0.6862745, 0, 1, 1,
0.7744358, -0.5354887, 1.969378, 0.6901961, 0, 1, 1,
0.7829465, -0.3794698, 1.274322, 0.6980392, 0, 1, 1,
0.7844687, 0.6552847, 1.510667, 0.7058824, 0, 1, 1,
0.7848449, 0.1668422, 1.500132, 0.7098039, 0, 1, 1,
0.7878006, 0.2994778, 0.9186392, 0.7176471, 0, 1, 1,
0.7885539, 0.3765908, -0.7079831, 0.7215686, 0, 1, 1,
0.7907005, 0.2436872, 1.984771, 0.7294118, 0, 1, 1,
0.7912484, -0.381113, 2.183664, 0.7333333, 0, 1, 1,
0.7923016, 0.3909526, -2.20834, 0.7411765, 0, 1, 1,
0.794234, 1.458471, -0.1497549, 0.7450981, 0, 1, 1,
0.8002467, 0.633271, 3.238507, 0.7529412, 0, 1, 1,
0.8017804, 0.157758, 3.022952, 0.7568628, 0, 1, 1,
0.8125087, 0.03337309, 1.496599, 0.7647059, 0, 1, 1,
0.8148766, -0.8594154, 2.255638, 0.7686275, 0, 1, 1,
0.8214663, 1.159066, 0.3437365, 0.7764706, 0, 1, 1,
0.8215277, 1.24057, 0.7996247, 0.7803922, 0, 1, 1,
0.8216043, 0.7889845, -0.1292318, 0.7882353, 0, 1, 1,
0.8253708, 2.012689, 0.7333237, 0.7921569, 0, 1, 1,
0.8266633, -1.088783, 2.946474, 0.8, 0, 1, 1,
0.8317924, -0.8532078, 2.025561, 0.8078431, 0, 1, 1,
0.8416291, -0.5915478, 4.297382, 0.8117647, 0, 1, 1,
0.8424041, -0.8475018, 2.219712, 0.8196079, 0, 1, 1,
0.8467842, -0.5482317, 2.722443, 0.8235294, 0, 1, 1,
0.847625, -0.3185745, 2.846883, 0.8313726, 0, 1, 1,
0.8489327, 0.05805359, 2.334758, 0.8352941, 0, 1, 1,
0.8496115, -0.2982917, 0.4457599, 0.8431373, 0, 1, 1,
0.8606169, 1.312906, -0.429148, 0.8470588, 0, 1, 1,
0.8663079, -0.5410712, 0.3890913, 0.854902, 0, 1, 1,
0.8670241, -1.728907, 3.659974, 0.8588235, 0, 1, 1,
0.8865116, -0.2933264, 1.183035, 0.8666667, 0, 1, 1,
0.8867519, -0.6550806, 3.004731, 0.8705882, 0, 1, 1,
0.8903933, -1.9022, 2.596761, 0.8784314, 0, 1, 1,
0.8906156, -0.5029286, -0.1729763, 0.8823529, 0, 1, 1,
0.9101243, -1.129665, 2.600034, 0.8901961, 0, 1, 1,
0.9129865, -1.135877, 3.230589, 0.8941177, 0, 1, 1,
0.9132615, 0.4777044, 0.8518031, 0.9019608, 0, 1, 1,
0.9189929, 1.143569, 2.338117, 0.9098039, 0, 1, 1,
0.9214653, -0.3985355, 2.80609, 0.9137255, 0, 1, 1,
0.9236974, 0.3515903, 0.825708, 0.9215686, 0, 1, 1,
0.9274431, -1.422892, 1.019309, 0.9254902, 0, 1, 1,
0.9328133, -1.66565, 2.899506, 0.9333333, 0, 1, 1,
0.9344921, -0.91684, 2.353894, 0.9372549, 0, 1, 1,
0.9356492, -1.416068, 2.992027, 0.945098, 0, 1, 1,
0.9366632, -0.4185695, 2.606348, 0.9490196, 0, 1, 1,
0.9382504, -1.23699, 0.6908773, 0.9568627, 0, 1, 1,
0.9464245, -0.6808928, 1.067922, 0.9607843, 0, 1, 1,
0.9468814, 0.6364136, 1.868077, 0.9686275, 0, 1, 1,
0.949694, 0.5714758, 2.39866, 0.972549, 0, 1, 1,
0.9504741, -1.771609, 3.87082, 0.9803922, 0, 1, 1,
0.951982, -1.203112, 3.225009, 0.9843137, 0, 1, 1,
0.9683989, -3.097526, 2.494782, 0.9921569, 0, 1, 1,
0.9739272, 1.029585, -0.276893, 0.9960784, 0, 1, 1,
0.9743638, -0.981476, 2.646812, 1, 0, 0.9960784, 1,
0.9798552, -0.9100737, 0.2801499, 1, 0, 0.9882353, 1,
0.9814922, 0.9668545, -0.4747021, 1, 0, 0.9843137, 1,
0.9959444, -0.6882681, 2.451537, 1, 0, 0.9764706, 1,
0.9960919, -3.135158, 3.115286, 1, 0, 0.972549, 1,
1.003035, 0.6000034, -0.2239484, 1, 0, 0.9647059, 1,
1.003702, -0.6675239, 1.009529, 1, 0, 0.9607843, 1,
1.009509, 2.106141, -0.1068127, 1, 0, 0.9529412, 1,
1.018984, -0.8881454, 1.650891, 1, 0, 0.9490196, 1,
1.021875, 1.127975, 0.6902245, 1, 0, 0.9411765, 1,
1.036317, 0.3302856, 1.131794, 1, 0, 0.9372549, 1,
1.036741, -1.092828, 1.805719, 1, 0, 0.9294118, 1,
1.038061, -0.3681062, 0.02188664, 1, 0, 0.9254902, 1,
1.039627, -0.4165989, 1.210975, 1, 0, 0.9176471, 1,
1.040052, 1.22034, 3.315644, 1, 0, 0.9137255, 1,
1.041884, 0.7526045, -0.3485658, 1, 0, 0.9058824, 1,
1.058877, 0.3265337, -0.8492655, 1, 0, 0.9019608, 1,
1.065347, -1.019153, 2.330173, 1, 0, 0.8941177, 1,
1.066244, 0.2033803, 1.857162, 1, 0, 0.8862745, 1,
1.072898, 0.670229, 2.814863, 1, 0, 0.8823529, 1,
1.073587, 1.727936, 0.644805, 1, 0, 0.8745098, 1,
1.079457, -0.4616929, 3.318929, 1, 0, 0.8705882, 1,
1.080485, 0.7879912, 0.6560091, 1, 0, 0.8627451, 1,
1.085744, -1.112416, 0.9422994, 1, 0, 0.8588235, 1,
1.090981, 0.5961037, 1.248525, 1, 0, 0.8509804, 1,
1.091704, 2.710092, -2.157033, 1, 0, 0.8470588, 1,
1.11498, -0.1517287, 2.361037, 1, 0, 0.8392157, 1,
1.116645, -0.659678, 2.952933, 1, 0, 0.8352941, 1,
1.127829, 0.6862301, 1.15096, 1, 0, 0.827451, 1,
1.12975, 2.206741, 1.710879, 1, 0, 0.8235294, 1,
1.133885, -0.4825742, 3.195976, 1, 0, 0.8156863, 1,
1.142809, 0.9373819, 1.60283, 1, 0, 0.8117647, 1,
1.152575, 0.3696925, 0.08697817, 1, 0, 0.8039216, 1,
1.156665, -0.06641397, 2.485214, 1, 0, 0.7960784, 1,
1.161987, 0.486699, -1.760969, 1, 0, 0.7921569, 1,
1.173863, -0.6231065, 0.9179773, 1, 0, 0.7843137, 1,
1.176726, 1.483976, -0.4200393, 1, 0, 0.7803922, 1,
1.178457, 1.364607, 1.991577, 1, 0, 0.772549, 1,
1.18778, 1.247577, 0.9500591, 1, 0, 0.7686275, 1,
1.190008, 0.02364228, 1.128459, 1, 0, 0.7607843, 1,
1.19299, -0.1779425, 1.925309, 1, 0, 0.7568628, 1,
1.195946, -1.502557, 1.958035, 1, 0, 0.7490196, 1,
1.198326, -1.824965, 1.877319, 1, 0, 0.7450981, 1,
1.200158, 0.238238, 2.636398, 1, 0, 0.7372549, 1,
1.203571, 0.1461999, 1.12312, 1, 0, 0.7333333, 1,
1.211611, 0.6141205, 1.146864, 1, 0, 0.7254902, 1,
1.212568, -1.214591, 2.313267, 1, 0, 0.7215686, 1,
1.217556, 0.1587487, 0.5659274, 1, 0, 0.7137255, 1,
1.219286, -0.6659413, 3.748468, 1, 0, 0.7098039, 1,
1.223201, -0.1279589, -0.5723892, 1, 0, 0.7019608, 1,
1.232116, -0.40448, 3.336059, 1, 0, 0.6941177, 1,
1.234046, -1.198725, 2.965744, 1, 0, 0.6901961, 1,
1.248371, 0.6549094, 0.7731824, 1, 0, 0.682353, 1,
1.250279, 0.2097679, 0.389474, 1, 0, 0.6784314, 1,
1.254525, 1.721215, -0.2738815, 1, 0, 0.6705883, 1,
1.262383, 0.207487, 2.202573, 1, 0, 0.6666667, 1,
1.273374, 0.495663, 0.1224758, 1, 0, 0.6588235, 1,
1.273478, -0.6546389, 1.3364, 1, 0, 0.654902, 1,
1.273559, -1.029485, 1.88399, 1, 0, 0.6470588, 1,
1.278719, -0.0344684, 0.8351858, 1, 0, 0.6431373, 1,
1.280348, 0.7138428, 2.986084, 1, 0, 0.6352941, 1,
1.283882, 0.6371928, 2.743293, 1, 0, 0.6313726, 1,
1.286047, -0.864687, 2.542317, 1, 0, 0.6235294, 1,
1.289029, -0.1521435, 2.121348, 1, 0, 0.6196079, 1,
1.291453, 0.5629998, 1.082959, 1, 0, 0.6117647, 1,
1.292524, 0.372323, -0.148091, 1, 0, 0.6078432, 1,
1.294582, 1.190446, 0.400479, 1, 0, 0.6, 1,
1.296282, -0.2032576, 2.522674, 1, 0, 0.5921569, 1,
1.302037, 2.089964, 0.5768386, 1, 0, 0.5882353, 1,
1.302735, 0.7114676, 3.26475, 1, 0, 0.5803922, 1,
1.309618, -0.991617, 1.985174, 1, 0, 0.5764706, 1,
1.327804, 1.274264, 2.038178, 1, 0, 0.5686275, 1,
1.328622, -0.9717371, 3.300641, 1, 0, 0.5647059, 1,
1.328835, -2.272055, 1.400676, 1, 0, 0.5568628, 1,
1.344721, 0.9679133, 3.007923, 1, 0, 0.5529412, 1,
1.348789, 0.7916726, 0.3005373, 1, 0, 0.5450981, 1,
1.350427, 1.701116, 1.518749, 1, 0, 0.5411765, 1,
1.353948, 0.975897, 0.8217366, 1, 0, 0.5333334, 1,
1.371802, -1.271993, 4.524271, 1, 0, 0.5294118, 1,
1.375829, -1.067694, 1.69571, 1, 0, 0.5215687, 1,
1.384992, -0.4343742, 2.803834, 1, 0, 0.5176471, 1,
1.386429, 0.9674609, -0.2772509, 1, 0, 0.509804, 1,
1.387469, -0.3363581, 1.102275, 1, 0, 0.5058824, 1,
1.390723, -0.2956226, 2.888947, 1, 0, 0.4980392, 1,
1.392004, -1.09624, 1.930457, 1, 0, 0.4901961, 1,
1.393132, 0.9900324, 1.251472, 1, 0, 0.4862745, 1,
1.393827, -0.207877, 3.185555, 1, 0, 0.4784314, 1,
1.394641, -1.357027, 2.867064, 1, 0, 0.4745098, 1,
1.410594, 1.155248, 0.2316422, 1, 0, 0.4666667, 1,
1.420665, 0.02736907, 2.21482, 1, 0, 0.4627451, 1,
1.427354, -0.08218855, 1.858955, 1, 0, 0.454902, 1,
1.439348, -1.749081, 2.553272, 1, 0, 0.4509804, 1,
1.449011, -0.930986, 3.85618, 1, 0, 0.4431373, 1,
1.453554, 0.6615129, 1.903848, 1, 0, 0.4392157, 1,
1.455528, -1.382252, 2.752628, 1, 0, 0.4313726, 1,
1.476705, 0.08132996, 1.102552, 1, 0, 0.427451, 1,
1.492557, 0.8708185, 1.010337, 1, 0, 0.4196078, 1,
1.498087, 0.9249797, 0.1213775, 1, 0, 0.4156863, 1,
1.498808, 0.8308349, 0.7998159, 1, 0, 0.4078431, 1,
1.509783, 0.7298399, 0.5606866, 1, 0, 0.4039216, 1,
1.514255, -0.7591385, 0.1815403, 1, 0, 0.3960784, 1,
1.516971, 1.019941, 1.205122, 1, 0, 0.3882353, 1,
1.519151, 0.1089356, 2.091737, 1, 0, 0.3843137, 1,
1.529664, 1.446398, 0.7493464, 1, 0, 0.3764706, 1,
1.541276, -0.1590459, 2.034378, 1, 0, 0.372549, 1,
1.544085, 0.159413, 2.255707, 1, 0, 0.3647059, 1,
1.551085, -1.279972, 2.405247, 1, 0, 0.3607843, 1,
1.553972, -0.2038382, 3.006181, 1, 0, 0.3529412, 1,
1.554788, 0.2937289, 0.7849686, 1, 0, 0.3490196, 1,
1.556002, 0.712694, -1.497876, 1, 0, 0.3411765, 1,
1.567615, -1.231238, 3.069351, 1, 0, 0.3372549, 1,
1.570319, -0.3146963, 3.321096, 1, 0, 0.3294118, 1,
1.598706, -1.39727, 2.836457, 1, 0, 0.3254902, 1,
1.600096, -1.240659, 1.56089, 1, 0, 0.3176471, 1,
1.631265, -1.10999, 1.780475, 1, 0, 0.3137255, 1,
1.633012, -0.4912632, 1.15444, 1, 0, 0.3058824, 1,
1.649203, -0.7971908, 1.737602, 1, 0, 0.2980392, 1,
1.649472, 2.147788, 0.3455472, 1, 0, 0.2941177, 1,
1.661046, 0.9249509, 4.516741, 1, 0, 0.2862745, 1,
1.674262, -0.686987, 2.763182, 1, 0, 0.282353, 1,
1.675435, -0.0673675, 0.7245493, 1, 0, 0.2745098, 1,
1.684111, 0.7826907, 2.242532, 1, 0, 0.2705882, 1,
1.684752, -0.6439451, 2.687367, 1, 0, 0.2627451, 1,
1.705555, 0.02636692, 3.496778, 1, 0, 0.2588235, 1,
1.71241, -0.7800456, 3.608182, 1, 0, 0.2509804, 1,
1.739177, 1.170912, 0.5002359, 1, 0, 0.2470588, 1,
1.740495, -0.1333478, 1.430021, 1, 0, 0.2392157, 1,
1.751227, -0.9827686, 3.453888, 1, 0, 0.2352941, 1,
1.771237, -0.0899096, 1.928768, 1, 0, 0.227451, 1,
1.772901, 1.785191, 0.7510768, 1, 0, 0.2235294, 1,
1.776209, -1.800417, 3.025777, 1, 0, 0.2156863, 1,
1.796213, 1.074026, 1.241542, 1, 0, 0.2117647, 1,
1.813108, -1.043929, 2.683848, 1, 0, 0.2039216, 1,
1.821155, -1.531413, 3.13283, 1, 0, 0.1960784, 1,
1.82145, 1.062941, -0.3590743, 1, 0, 0.1921569, 1,
1.846991, 2.972042, 0.6161204, 1, 0, 0.1843137, 1,
1.88123, 1.025497, 1.327004, 1, 0, 0.1803922, 1,
1.882653, -0.9151586, 3.634121, 1, 0, 0.172549, 1,
1.901165, 0.0836788, 0.4945656, 1, 0, 0.1686275, 1,
1.944517, -0.1305342, 0.5104192, 1, 0, 0.1607843, 1,
1.947806, 0.8374662, 1.879158, 1, 0, 0.1568628, 1,
1.979157, -0.325487, 1.680735, 1, 0, 0.1490196, 1,
1.986804, -0.4744695, 2.030029, 1, 0, 0.145098, 1,
2.008965, 0.540923, -1.057296, 1, 0, 0.1372549, 1,
2.050286, 0.4250908, 1.150829, 1, 0, 0.1333333, 1,
2.152836, -0.7207981, 1.787525, 1, 0, 0.1254902, 1,
2.168255, -0.3319383, 0.7964484, 1, 0, 0.1215686, 1,
2.175446, 1.374087, 1.796083, 1, 0, 0.1137255, 1,
2.184765, -0.3729509, 2.614979, 1, 0, 0.1098039, 1,
2.234433, 0.8463913, 2.808325, 1, 0, 0.1019608, 1,
2.284731, 0.4183432, 1.21199, 1, 0, 0.09411765, 1,
2.312397, -0.5429144, 2.497221, 1, 0, 0.09019608, 1,
2.31738, -0.9028066, 0.6141905, 1, 0, 0.08235294, 1,
2.334435, 0.2395868, 1.783846, 1, 0, 0.07843138, 1,
2.344725, 0.01052481, 1.15481, 1, 0, 0.07058824, 1,
2.352811, 0.2539713, 2.650817, 1, 0, 0.06666667, 1,
2.366974, 0.3101221, 1.750373, 1, 0, 0.05882353, 1,
2.372449, 0.3887565, -0.05930572, 1, 0, 0.05490196, 1,
2.385347, -0.3752074, 2.004737, 1, 0, 0.04705882, 1,
2.420605, -1.021729, 1.815917, 1, 0, 0.04313726, 1,
2.591272, -0.08129873, 2.268605, 1, 0, 0.03529412, 1,
2.62423, 0.5127241, 1.526981, 1, 0, 0.03137255, 1,
2.670053, -0.3726147, 0.8221008, 1, 0, 0.02352941, 1,
2.692288, 0.04405505, 2.678327, 1, 0, 0.01960784, 1,
2.843386, -0.9297196, 1.814456, 1, 0, 0.01176471, 1,
3.994428, 0.1778584, 1.674217, 1, 0, 0.007843138, 1
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
0.3124379, -4.423183, -7.088542, 0, -0.5, 0.5, 0.5,
0.3124379, -4.423183, -7.088542, 1, -0.5, 0.5, 0.5,
0.3124379, -4.423183, -7.088542, 1, 1.5, 0.5, 0.5,
0.3124379, -4.423183, -7.088542, 0, 1.5, 0.5, 0.5
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
-4.617747, -0.1896617, -7.088542, 0, -0.5, 0.5, 0.5,
-4.617747, -0.1896617, -7.088542, 1, -0.5, 0.5, 0.5,
-4.617747, -0.1896617, -7.088542, 1, 1.5, 0.5, 0.5,
-4.617747, -0.1896617, -7.088542, 0, 1.5, 0.5, 0.5
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
-4.617747, -4.423183, 0.6833184, 0, -0.5, 0.5, 0.5,
-4.617747, -4.423183, 0.6833184, 1, -0.5, 0.5, 0.5,
-4.617747, -4.423183, 0.6833184, 1, 1.5, 0.5, 0.5,
-4.617747, -4.423183, 0.6833184, 0, 1.5, 0.5, 0.5
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
-2, -3.446217, -5.295035,
2, -3.446217, -5.295035,
-2, -3.446217, -5.295035,
-2, -3.609044, -5.593953,
0, -3.446217, -5.295035,
0, -3.609044, -5.593953,
2, -3.446217, -5.295035,
2, -3.609044, -5.593953
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
-2, -3.9347, -6.191789, 0, -0.5, 0.5, 0.5,
-2, -3.9347, -6.191789, 1, -0.5, 0.5, 0.5,
-2, -3.9347, -6.191789, 1, 1.5, 0.5, 0.5,
-2, -3.9347, -6.191789, 0, 1.5, 0.5, 0.5,
0, -3.9347, -6.191789, 0, -0.5, 0.5, 0.5,
0, -3.9347, -6.191789, 1, -0.5, 0.5, 0.5,
0, -3.9347, -6.191789, 1, 1.5, 0.5, 0.5,
0, -3.9347, -6.191789, 0, 1.5, 0.5, 0.5,
2, -3.9347, -6.191789, 0, -0.5, 0.5, 0.5,
2, -3.9347, -6.191789, 1, -0.5, 0.5, 0.5,
2, -3.9347, -6.191789, 1, 1.5, 0.5, 0.5,
2, -3.9347, -6.191789, 0, 1.5, 0.5, 0.5
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
-3.480012, -3, -5.295035,
-3.480012, 2, -5.295035,
-3.480012, -3, -5.295035,
-3.669634, -3, -5.593953,
-3.480012, -2, -5.295035,
-3.669634, -2, -5.593953,
-3.480012, -1, -5.295035,
-3.669634, -1, -5.593953,
-3.480012, 0, -5.295035,
-3.669634, 0, -5.593953,
-3.480012, 1, -5.295035,
-3.669634, 1, -5.593953,
-3.480012, 2, -5.295035,
-3.669634, 2, -5.593953
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
-4.048879, -3, -6.191789, 0, -0.5, 0.5, 0.5,
-4.048879, -3, -6.191789, 1, -0.5, 0.5, 0.5,
-4.048879, -3, -6.191789, 1, 1.5, 0.5, 0.5,
-4.048879, -3, -6.191789, 0, 1.5, 0.5, 0.5,
-4.048879, -2, -6.191789, 0, -0.5, 0.5, 0.5,
-4.048879, -2, -6.191789, 1, -0.5, 0.5, 0.5,
-4.048879, -2, -6.191789, 1, 1.5, 0.5, 0.5,
-4.048879, -2, -6.191789, 0, 1.5, 0.5, 0.5,
-4.048879, -1, -6.191789, 0, -0.5, 0.5, 0.5,
-4.048879, -1, -6.191789, 1, -0.5, 0.5, 0.5,
-4.048879, -1, -6.191789, 1, 1.5, 0.5, 0.5,
-4.048879, -1, -6.191789, 0, 1.5, 0.5, 0.5,
-4.048879, 0, -6.191789, 0, -0.5, 0.5, 0.5,
-4.048879, 0, -6.191789, 1, -0.5, 0.5, 0.5,
-4.048879, 0, -6.191789, 1, 1.5, 0.5, 0.5,
-4.048879, 0, -6.191789, 0, 1.5, 0.5, 0.5,
-4.048879, 1, -6.191789, 0, -0.5, 0.5, 0.5,
-4.048879, 1, -6.191789, 1, -0.5, 0.5, 0.5,
-4.048879, 1, -6.191789, 1, 1.5, 0.5, 0.5,
-4.048879, 1, -6.191789, 0, 1.5, 0.5, 0.5,
-4.048879, 2, -6.191789, 0, -0.5, 0.5, 0.5,
-4.048879, 2, -6.191789, 1, -0.5, 0.5, 0.5,
-4.048879, 2, -6.191789, 1, 1.5, 0.5, 0.5,
-4.048879, 2, -6.191789, 0, 1.5, 0.5, 0.5
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
-3.480012, -3.446217, -4,
-3.480012, -3.446217, 6,
-3.480012, -3.446217, -4,
-3.669634, -3.609044, -4,
-3.480012, -3.446217, -2,
-3.669634, -3.609044, -2,
-3.480012, -3.446217, 0,
-3.669634, -3.609044, 0,
-3.480012, -3.446217, 2,
-3.669634, -3.609044, 2,
-3.480012, -3.446217, 4,
-3.669634, -3.609044, 4,
-3.480012, -3.446217, 6,
-3.669634, -3.609044, 6
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
"4",
"6"
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
-4.048879, -3.9347, -4, 0, -0.5, 0.5, 0.5,
-4.048879, -3.9347, -4, 1, -0.5, 0.5, 0.5,
-4.048879, -3.9347, -4, 1, 1.5, 0.5, 0.5,
-4.048879, -3.9347, -4, 0, 1.5, 0.5, 0.5,
-4.048879, -3.9347, -2, 0, -0.5, 0.5, 0.5,
-4.048879, -3.9347, -2, 1, -0.5, 0.5, 0.5,
-4.048879, -3.9347, -2, 1, 1.5, 0.5, 0.5,
-4.048879, -3.9347, -2, 0, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 0, 0, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 0, 1, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 0, 1, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 0, 0, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 2, 0, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 2, 1, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 2, 1, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 2, 0, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 4, 0, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 4, 1, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 4, 1, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 4, 0, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 6, 0, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 6, 1, -0.5, 0.5, 0.5,
-4.048879, -3.9347, 6, 1, 1.5, 0.5, 0.5,
-4.048879, -3.9347, 6, 0, 1.5, 0.5, 0.5
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
-3.480012, -3.446217, -5.295035,
-3.480012, 3.066893, -5.295035,
-3.480012, -3.446217, 6.661672,
-3.480012, 3.066893, 6.661672,
-3.480012, -3.446217, -5.295035,
-3.480012, -3.446217, 6.661672,
-3.480012, 3.066893, -5.295035,
-3.480012, 3.066893, 6.661672,
-3.480012, -3.446217, -5.295035,
4.104887, -3.446217, -5.295035,
-3.480012, -3.446217, 6.661672,
4.104887, -3.446217, 6.661672,
-3.480012, 3.066893, -5.295035,
4.104887, 3.066893, -5.295035,
-3.480012, 3.066893, 6.661672,
4.104887, 3.066893, 6.661672,
4.104887, -3.446217, -5.295035,
4.104887, 3.066893, -5.295035,
4.104887, -3.446217, 6.661672,
4.104887, 3.066893, 6.661672,
4.104887, -3.446217, -5.295035,
4.104887, -3.446217, 6.661672,
4.104887, 3.066893, -5.295035,
4.104887, 3.066893, 6.661672
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
var radius = 8.322463;
var distance = 37.02758;
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
mvMatrix.translate( -0.3124379, 0.1896617, -0.6833184 );
mvMatrix.scale( 1.186359, 1.381584, 0.7525826 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.02758);
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
prometryn<-read.table("prometryn.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prometryn$V2
```

```
## Error in eval(expr, envir, enclos): object 'prometryn' not found
```

```r
y<-prometryn$V3
```

```
## Error in eval(expr, envir, enclos): object 'prometryn' not found
```

```r
z<-prometryn$V4
```

```
## Error in eval(expr, envir, enclos): object 'prometryn' not found
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
-3.369552, 0.6719702, -0.1674869, 0, 0, 1, 1, 1,
-3.331773, 0.4202877, -1.227756, 1, 0, 0, 1, 1,
-3.060944, -0.428158, -3.185213, 1, 0, 0, 1, 1,
-2.80146, -0.2736983, -1.686347, 1, 0, 0, 1, 1,
-2.801167, -0.02587528, -1.819877, 1, 0, 0, 1, 1,
-2.79389, 0.6358086, -1.466943, 1, 0, 0, 1, 1,
-2.686257, -0.8521739, 0.06531011, 0, 0, 0, 1, 1,
-2.613713, 0.3022276, -0.08136063, 0, 0, 0, 1, 1,
-2.577552, -0.6080181, -0.9947113, 0, 0, 0, 1, 1,
-2.57457, 0.1548483, -2.013258, 0, 0, 0, 1, 1,
-2.525893, -0.9590577, -1.350297, 0, 0, 0, 1, 1,
-2.305889, -0.635766, -2.31936, 0, 0, 0, 1, 1,
-2.232254, -0.09708968, -1.763862, 0, 0, 0, 1, 1,
-2.228718, 1.83766, -2.693534, 1, 1, 1, 1, 1,
-2.209079, 0.05796419, -0.46191, 1, 1, 1, 1, 1,
-2.203735, 1.858686, -2.223744, 1, 1, 1, 1, 1,
-2.200768, -1.196064, -1.746808, 1, 1, 1, 1, 1,
-2.180347, -0.5251243, -2.689363, 1, 1, 1, 1, 1,
-2.171726, 2.185716, -0.9095966, 1, 1, 1, 1, 1,
-2.165988, -0.1000363, -1.387666, 1, 1, 1, 1, 1,
-2.096572, -0.2857122, -1.297577, 1, 1, 1, 1, 1,
-2.071118, -0.4728389, -0.966836, 1, 1, 1, 1, 1,
-2.069225, 1.051695, 0.009718682, 1, 1, 1, 1, 1,
-2.04606, 0.7500733, -2.460711, 1, 1, 1, 1, 1,
-2.008689, 0.839345, -0.1207968, 1, 1, 1, 1, 1,
-1.979236, -0.1338334, -1.596794, 1, 1, 1, 1, 1,
-1.939932, -0.6842946, -2.62157, 1, 1, 1, 1, 1,
-1.924828, 0.9052666, -0.7819544, 1, 1, 1, 1, 1,
-1.92322, 0.3423237, -2.019031, 0, 0, 1, 1, 1,
-1.898428, -0.5125211, -1.859168, 1, 0, 0, 1, 1,
-1.871623, 2.127326, -0.2151816, 1, 0, 0, 1, 1,
-1.870926, -0.4639958, -1.517594, 1, 0, 0, 1, 1,
-1.861851, -0.4774847, -2.51327, 1, 0, 0, 1, 1,
-1.853284, -0.1334336, -2.859141, 1, 0, 0, 1, 1,
-1.841688, -1.322915, -2.384842, 0, 0, 0, 1, 1,
-1.794237, 0.4636382, -0.6432787, 0, 0, 0, 1, 1,
-1.794179, -1.028252, -2.699863, 0, 0, 0, 1, 1,
-1.786305, -0.5125353, -1.008871, 0, 0, 0, 1, 1,
-1.784868, -0.1353826, -3.037083, 0, 0, 0, 1, 1,
-1.772048, -0.785813, -1.362914, 0, 0, 0, 1, 1,
-1.770247, -2.107129, -2.615702, 0, 0, 0, 1, 1,
-1.76798, -0.03090324, -2.55955, 1, 1, 1, 1, 1,
-1.761639, 1.48215, -2.436545, 1, 1, 1, 1, 1,
-1.753977, 0.2322625, -1.558669, 1, 1, 1, 1, 1,
-1.75175, 0.2734996, -1.624211, 1, 1, 1, 1, 1,
-1.738075, 1.990812, -0.1291331, 1, 1, 1, 1, 1,
-1.734116, 0.6278792, -2.121766, 1, 1, 1, 1, 1,
-1.719899, -1.37154, -1.682854, 1, 1, 1, 1, 1,
-1.713839, 0.08078888, -0.6364871, 1, 1, 1, 1, 1,
-1.700219, -0.2120001, -0.9438759, 1, 1, 1, 1, 1,
-1.686347, -1.021299, -2.818688, 1, 1, 1, 1, 1,
-1.672733, -0.1118611, -3.299905, 1, 1, 1, 1, 1,
-1.669306, -1.000376, -1.920994, 1, 1, 1, 1, 1,
-1.665607, 1.53368, -0.08113993, 1, 1, 1, 1, 1,
-1.664788, -1.273952, -2.830369, 1, 1, 1, 1, 1,
-1.650824, -1.673133, -1.867495, 1, 1, 1, 1, 1,
-1.648897, 0.01176936, -2.437119, 0, 0, 1, 1, 1,
-1.631264, -0.3836611, -4.555824, 1, 0, 0, 1, 1,
-1.629794, 0.01090683, 0.8707265, 1, 0, 0, 1, 1,
-1.629661, -0.8454242, -0.7305371, 1, 0, 0, 1, 1,
-1.627549, -0.07250325, -2.712824, 1, 0, 0, 1, 1,
-1.610162, 0.905649, -0.1443514, 1, 0, 0, 1, 1,
-1.595965, 0.06438398, -1.143758, 0, 0, 0, 1, 1,
-1.588327, -1.044713, -1.736789, 0, 0, 0, 1, 1,
-1.561495, -1.803699, -1.328147, 0, 0, 0, 1, 1,
-1.55637, 0.4741431, -1.49661, 0, 0, 0, 1, 1,
-1.551193, -1.232965, -2.479378, 0, 0, 0, 1, 1,
-1.551169, 0.1954326, -1.637023, 0, 0, 0, 1, 1,
-1.536571, -0.1423428, -2.274592, 0, 0, 0, 1, 1,
-1.510227, 0.2623765, -2.965627, 1, 1, 1, 1, 1,
-1.499029, 0.5033224, -2.640834, 1, 1, 1, 1, 1,
-1.497099, 0.4165023, -1.075854, 1, 1, 1, 1, 1,
-1.49405, 0.3095798, -0.1613443, 1, 1, 1, 1, 1,
-1.49251, 0.5253175, -1.368326, 1, 1, 1, 1, 1,
-1.484821, 1.008992, -0.8727362, 1, 1, 1, 1, 1,
-1.48374, 1.896648, -2.191415, 1, 1, 1, 1, 1,
-1.474843, -0.6696663, -0.5896144, 1, 1, 1, 1, 1,
-1.46145, 0.4029571, -1.614888, 1, 1, 1, 1, 1,
-1.460189, -0.6351346, -4.277007, 1, 1, 1, 1, 1,
-1.458888, -2.198178, -3.011301, 1, 1, 1, 1, 1,
-1.450432, 0.3186382, -0.6673921, 1, 1, 1, 1, 1,
-1.441491, -0.5307029, -1.022861, 1, 1, 1, 1, 1,
-1.42599, -0.7327349, -0.6908811, 1, 1, 1, 1, 1,
-1.423198, 0.8188321, -1.859464, 1, 1, 1, 1, 1,
-1.412406, -0.5194591, -2.637208, 0, 0, 1, 1, 1,
-1.396631, 0.2162573, -2.125123, 1, 0, 0, 1, 1,
-1.394461, 1.566181, 0.3409867, 1, 0, 0, 1, 1,
-1.392951, 0.01357393, 1.107606, 1, 0, 0, 1, 1,
-1.39103, -1.161261, -1.715417, 1, 0, 0, 1, 1,
-1.389485, 0.2800038, -0.5922411, 1, 0, 0, 1, 1,
-1.367837, 0.1381031, -0.2483921, 0, 0, 0, 1, 1,
-1.358182, -1.515393, -2.587744, 0, 0, 0, 1, 1,
-1.339836, -0.03986434, -1.347879, 0, 0, 0, 1, 1,
-1.338046, 0.7083197, -2.040093, 0, 0, 0, 1, 1,
-1.333748, 0.5724439, -2.158085, 0, 0, 0, 1, 1,
-1.333428, -0.5721169, -1.892239, 0, 0, 0, 1, 1,
-1.328527, 0.5573491, 0.04019606, 0, 0, 0, 1, 1,
-1.323369, 1.350764, -2.255369, 1, 1, 1, 1, 1,
-1.322111, -1.188257, -2.898096, 1, 1, 1, 1, 1,
-1.314913, -0.0784173, -0.2143816, 1, 1, 1, 1, 1,
-1.309922, -1.126515, -2.778718, 1, 1, 1, 1, 1,
-1.301099, 1.457555, -0.8805979, 1, 1, 1, 1, 1,
-1.290334, 0.2424999, -1.063482, 1, 1, 1, 1, 1,
-1.282111, -0.1868965, -2.360865, 1, 1, 1, 1, 1,
-1.277008, -0.04130981, -0.9721098, 1, 1, 1, 1, 1,
-1.27246, -0.295675, -1.100588, 1, 1, 1, 1, 1,
-1.270293, 0.7527962, -1.139817, 1, 1, 1, 1, 1,
-1.269942, 0.03914047, -2.637232, 1, 1, 1, 1, 1,
-1.264625, -0.8564758, -2.588198, 1, 1, 1, 1, 1,
-1.260599, -0.0326819, -1.059041, 1, 1, 1, 1, 1,
-1.251428, -0.3136193, -1.935408, 1, 1, 1, 1, 1,
-1.251349, -0.1682065, -0.7292646, 1, 1, 1, 1, 1,
-1.246106, -0.05984187, -1.92266, 0, 0, 1, 1, 1,
-1.244134, -0.9881256, -2.178351, 1, 0, 0, 1, 1,
-1.241715, -1.622477, -2.954569, 1, 0, 0, 1, 1,
-1.229829, -0.8821967, -2.092643, 1, 0, 0, 1, 1,
-1.229333, -0.9059076, -4.014594, 1, 0, 0, 1, 1,
-1.224936, 0.1037135, -3.608115, 1, 0, 0, 1, 1,
-1.215806, -0.5333293, -1.827244, 0, 0, 0, 1, 1,
-1.214609, 0.6775791, -1.725404, 0, 0, 0, 1, 1,
-1.206943, 0.04422767, -3.727561, 0, 0, 0, 1, 1,
-1.19621, 0.4672917, -0.7717161, 0, 0, 0, 1, 1,
-1.193968, -0.5111587, -1.771685, 0, 0, 0, 1, 1,
-1.185425, -0.8410835, -2.624231, 0, 0, 0, 1, 1,
-1.181666, -0.3329803, -3.835948, 0, 0, 0, 1, 1,
-1.17018, -0.3980053, -0.3739866, 1, 1, 1, 1, 1,
-1.170079, -0.2001518, -0.3491412, 1, 1, 1, 1, 1,
-1.168989, 0.9660932, -0.7714505, 1, 1, 1, 1, 1,
-1.167025, 0.2660971, -1.796013, 1, 1, 1, 1, 1,
-1.165516, 0.03368132, -0.8523297, 1, 1, 1, 1, 1,
-1.162686, -0.2953952, -0.89854, 1, 1, 1, 1, 1,
-1.161258, 1.189666, -2.396295, 1, 1, 1, 1, 1,
-1.156611, 0.345178, -0.4796802, 1, 1, 1, 1, 1,
-1.152641, -0.6234486, -1.667847, 1, 1, 1, 1, 1,
-1.14997, 1.837773, -0.2668435, 1, 1, 1, 1, 1,
-1.149818, 0.00581288, -1.503028, 1, 1, 1, 1, 1,
-1.148486, 1.112427, -2.023627, 1, 1, 1, 1, 1,
-1.144092, -0.7104197, -2.39386, 1, 1, 1, 1, 1,
-1.142576, 0.07794461, -0.06581923, 1, 1, 1, 1, 1,
-1.139819, 0.4391299, -1.119633, 1, 1, 1, 1, 1,
-1.138826, 0.06008851, -3.669693, 0, 0, 1, 1, 1,
-1.129829, 0.1480045, -1.96677, 1, 0, 0, 1, 1,
-1.127256, -0.5050378, -2.490751, 1, 0, 0, 1, 1,
-1.122234, -0.6050372, -2.554772, 1, 0, 0, 1, 1,
-1.11187, -1.269385, -1.695443, 1, 0, 0, 1, 1,
-1.098868, 0.3385113, -1.671348, 1, 0, 0, 1, 1,
-1.093287, -0.8936073, -4.354238, 0, 0, 0, 1, 1,
-1.086665, 0.1194416, -0.7968298, 0, 0, 0, 1, 1,
-1.083623, -0.6637065, -0.6779196, 0, 0, 0, 1, 1,
-1.078341, -0.04818995, -1.257256, 0, 0, 0, 1, 1,
-1.067723, -0.4862268, -1.928395, 0, 0, 0, 1, 1,
-1.066746, 2.716179, 0.9344824, 0, 0, 0, 1, 1,
-1.0551, 0.9004224, -2.549302, 0, 0, 0, 1, 1,
-1.054179, 1.47297, -0.6037013, 1, 1, 1, 1, 1,
-1.052755, -1.244259, -0.1518943, 1, 1, 1, 1, 1,
-1.050557, -0.207252, -2.283116, 1, 1, 1, 1, 1,
-1.049809, -2.205273, -2.737771, 1, 1, 1, 1, 1,
-1.043749, 1.313147, -0.609342, 1, 1, 1, 1, 1,
-1.035693, 1.142749, -1.582986, 1, 1, 1, 1, 1,
-1.032144, -0.9740548, -1.611399, 1, 1, 1, 1, 1,
-1.032027, -0.2250312, -0.9603463, 1, 1, 1, 1, 1,
-1.029565, -1.557037, -1.651589, 1, 1, 1, 1, 1,
-1.020462, -0.6324217, -2.909289, 1, 1, 1, 1, 1,
-1.008919, 2.645586, -0.5079255, 1, 1, 1, 1, 1,
-1.00512, -0.2118477, -1.360962, 1, 1, 1, 1, 1,
-0.9879088, 1.099983, -1.185953, 1, 1, 1, 1, 1,
-0.984476, 1.396066, 0.4237353, 1, 1, 1, 1, 1,
-0.97594, -1.052124, -3.409542, 1, 1, 1, 1, 1,
-0.9701048, -1.188627, -3.151632, 0, 0, 1, 1, 1,
-0.969434, 0.6201449, -2.93347, 1, 0, 0, 1, 1,
-0.968002, -0.5556567, -1.608499, 1, 0, 0, 1, 1,
-0.9662579, -0.009019005, 0.1440214, 1, 0, 0, 1, 1,
-0.9641718, -0.04565557, -1.931114, 1, 0, 0, 1, 1,
-0.9608913, -0.8657112, -3.120881, 1, 0, 0, 1, 1,
-0.9529512, 0.8724829, -0.01070142, 0, 0, 0, 1, 1,
-0.9448826, 0.1871933, -1.522284, 0, 0, 0, 1, 1,
-0.9427909, 0.6714465, -1.599425, 0, 0, 0, 1, 1,
-0.937391, 0.1236571, -1.756605, 0, 0, 0, 1, 1,
-0.9316137, 0.9552071, -0.001248351, 0, 0, 0, 1, 1,
-0.9292615, 0.4776312, -0.2720128, 0, 0, 0, 1, 1,
-0.9230605, 0.3435962, -1.203063, 0, 0, 0, 1, 1,
-0.9192468, -0.3619245, -2.175807, 1, 1, 1, 1, 1,
-0.9147447, -0.1284706, -1.353284, 1, 1, 1, 1, 1,
-0.9135318, 0.3188501, -0.7851691, 1, 1, 1, 1, 1,
-0.9043883, -0.7526481, -1.412785, 1, 1, 1, 1, 1,
-0.8964541, -1.407488, -3.290718, 1, 1, 1, 1, 1,
-0.8931133, -0.133105, -1.383488, 1, 1, 1, 1, 1,
-0.8919853, -1.081683, -2.300213, 1, 1, 1, 1, 1,
-0.8840424, -1.666489, -4.357737, 1, 1, 1, 1, 1,
-0.8754809, 0.3710701, -1.275991, 1, 1, 1, 1, 1,
-0.8745407, 0.08706693, -0.1214926, 1, 1, 1, 1, 1,
-0.8678427, -1.920226, -2.468775, 1, 1, 1, 1, 1,
-0.8675275, 1.318225, -0.2289769, 1, 1, 1, 1, 1,
-0.8648175, 1.508132, -1.701796, 1, 1, 1, 1, 1,
-0.8631249, 0.9055045, -1.927896, 1, 1, 1, 1, 1,
-0.8579701, -0.2916091, -4.264591, 1, 1, 1, 1, 1,
-0.8461418, -0.4938106, -0.1127566, 0, 0, 1, 1, 1,
-0.8439775, 1.35244, -0.8167283, 1, 0, 0, 1, 1,
-0.8430635, -0.454398, -3.66789, 1, 0, 0, 1, 1,
-0.8401636, 0.3987722, -0.3947689, 1, 0, 0, 1, 1,
-0.8377693, 0.8387068, -1.181399, 1, 0, 0, 1, 1,
-0.8323041, 1.405353, -1.064014, 1, 0, 0, 1, 1,
-0.8293834, -0.2772338, -1.365043, 0, 0, 0, 1, 1,
-0.8241806, 1.515285, 0.5593872, 0, 0, 0, 1, 1,
-0.8201198, -1.019101, -2.865546, 0, 0, 0, 1, 1,
-0.8195408, -1.524969, -3.453405, 0, 0, 0, 1, 1,
-0.8185119, -0.4885323, -2.048139, 0, 0, 0, 1, 1,
-0.8039322, 0.3021394, -1.0669, 0, 0, 0, 1, 1,
-0.8038369, 0.2009661, -0.1373645, 0, 0, 0, 1, 1,
-0.8035216, -0.1564094, -0.07500841, 1, 1, 1, 1, 1,
-0.80017, -0.6922951, -0.5935441, 1, 1, 1, 1, 1,
-0.7963883, 1.162419, -0.3248982, 1, 1, 1, 1, 1,
-0.7949954, 0.1797076, -2.325305, 1, 1, 1, 1, 1,
-0.7947738, 0.08727971, -1.573515, 1, 1, 1, 1, 1,
-0.7892648, 0.7587969, -0.257706, 1, 1, 1, 1, 1,
-0.7892635, -1.386237, -2.71165, 1, 1, 1, 1, 1,
-0.7878456, -2.174772, -3.661851, 1, 1, 1, 1, 1,
-0.7870975, -0.6080958, -2.782436, 1, 1, 1, 1, 1,
-0.7802891, 0.9992413, -1.237972, 1, 1, 1, 1, 1,
-0.7742011, -0.6230634, -2.287915, 1, 1, 1, 1, 1,
-0.7724289, 0.9614474, -1.91267, 1, 1, 1, 1, 1,
-0.7713315, 0.2360682, -1.92257, 1, 1, 1, 1, 1,
-0.7702515, 1.217611, -1.030113, 1, 1, 1, 1, 1,
-0.7697015, 0.1569342, -1.414658, 1, 1, 1, 1, 1,
-0.7689529, 0.07066797, -0.9878462, 0, 0, 1, 1, 1,
-0.7656037, -0.2221179, -1.63596, 1, 0, 0, 1, 1,
-0.7647198, -0.2058853, -3.703714, 1, 0, 0, 1, 1,
-0.7561489, -0.8810546, -3.181779, 1, 0, 0, 1, 1,
-0.7520124, 0.1407116, -3.00766, 1, 0, 0, 1, 1,
-0.7499835, -1.035344, -1.389841, 1, 0, 0, 1, 1,
-0.7439781, 0.8334245, 0.08691602, 0, 0, 0, 1, 1,
-0.7406623, -1.191556, -4.251623, 0, 0, 0, 1, 1,
-0.7392839, 0.2708088, 0.1843641, 0, 0, 0, 1, 1,
-0.7335894, -1.310514, -2.491469, 0, 0, 0, 1, 1,
-0.7289467, -1.480328, -2.183128, 0, 0, 0, 1, 1,
-0.725162, 0.3482296, -2.045578, 0, 0, 0, 1, 1,
-0.7057387, -0.6763346, -1.265886, 0, 0, 0, 1, 1,
-0.7028876, -0.3511095, -1.365273, 1, 1, 1, 1, 1,
-0.6973007, 0.5635143, -1.252434, 1, 1, 1, 1, 1,
-0.6953908, -1.345574, -4.661707, 1, 1, 1, 1, 1,
-0.6925238, -0.01560239, -2.016961, 1, 1, 1, 1, 1,
-0.6914363, -0.7776481, -3.93215, 1, 1, 1, 1, 1,
-0.6880996, -1.00948, -1.628525, 1, 1, 1, 1, 1,
-0.6838284, -0.3358768, -1.464369, 1, 1, 1, 1, 1,
-0.683125, 0.1852498, -1.185215, 1, 1, 1, 1, 1,
-0.6778519, 0.06061169, -2.68813, 1, 1, 1, 1, 1,
-0.6757014, 1.949558, 2.356897, 1, 1, 1, 1, 1,
-0.6731932, 0.1568737, -2.117098, 1, 1, 1, 1, 1,
-0.6674847, 1.259727, -2.104731, 1, 1, 1, 1, 1,
-0.6533604, -0.1099333, -0.6036085, 1, 1, 1, 1, 1,
-0.6526754, 1.78702, 0.2513916, 1, 1, 1, 1, 1,
-0.6525555, 0.1983301, -1.613303, 1, 1, 1, 1, 1,
-0.6513298, 0.960665, -0.8623936, 0, 0, 1, 1, 1,
-0.6472304, 0.005027406, -1.061309, 1, 0, 0, 1, 1,
-0.6425417, 0.3476903, -0.5358889, 1, 0, 0, 1, 1,
-0.6418225, -0.8412322, -3.074245, 1, 0, 0, 1, 1,
-0.6392807, 1.564128, -0.7667526, 1, 0, 0, 1, 1,
-0.6380482, -1.949375, -3.770601, 1, 0, 0, 1, 1,
-0.6347805, -1.567766, -2.61678, 0, 0, 0, 1, 1,
-0.6319749, -0.4907387, -1.435954, 0, 0, 0, 1, 1,
-0.6308051, -0.2898842, -2.40434, 0, 0, 0, 1, 1,
-0.6252183, 0.2002864, -2.601521, 0, 0, 0, 1, 1,
-0.6249469, -1.237011, -3.664088, 0, 0, 0, 1, 1,
-0.6171017, -0.5953295, -0.8797169, 0, 0, 0, 1, 1,
-0.6133371, 0.8346043, -0.598617, 0, 0, 0, 1, 1,
-0.6055697, 2.371309, 0.1441396, 1, 1, 1, 1, 1,
-0.6038485, -0.8665285, -3.084978, 1, 1, 1, 1, 1,
-0.6020527, 0.3789287, -0.3469612, 1, 1, 1, 1, 1,
-0.5963989, -0.7955902, -3.044825, 1, 1, 1, 1, 1,
-0.5949754, 0.5615347, -0.3777504, 1, 1, 1, 1, 1,
-0.5916717, 0.2393963, -1.968264, 1, 1, 1, 1, 1,
-0.589401, -0.05629365, -1.596187, 1, 1, 1, 1, 1,
-0.5881532, -0.180245, -0.7403986, 1, 1, 1, 1, 1,
-0.5855947, 2.041736, -0.1941044, 1, 1, 1, 1, 1,
-0.5849025, -1.714256, -4.200173, 1, 1, 1, 1, 1,
-0.580294, -0.5945028, -2.471006, 1, 1, 1, 1, 1,
-0.5738767, -1.706389, -2.21274, 1, 1, 1, 1, 1,
-0.5693229, 0.1243904, -0.7993295, 1, 1, 1, 1, 1,
-0.5673653, -0.2025139, -2.586508, 1, 1, 1, 1, 1,
-0.5624835, -1.098596, -1.420865, 1, 1, 1, 1, 1,
-0.5536113, -2.50899, -5.078387, 0, 0, 1, 1, 1,
-0.5531849, -1.835074, -3.25907, 1, 0, 0, 1, 1,
-0.5520794, -1.423337, -3.960911, 1, 0, 0, 1, 1,
-0.5480024, -1.44242, -2.231576, 1, 0, 0, 1, 1,
-0.5470244, -1.399718, -3.217638, 1, 0, 0, 1, 1,
-0.5421195, -0.8660611, -3.133605, 1, 0, 0, 1, 1,
-0.5373263, 1.721984, 0.7080769, 0, 0, 0, 1, 1,
-0.5354486, 1.38635, -0.3668752, 0, 0, 0, 1, 1,
-0.5352039, -1.972809, -1.355575, 0, 0, 0, 1, 1,
-0.5334991, 1.386766, 0.4041797, 0, 0, 0, 1, 1,
-0.5314153, -0.3161945, -1.678031, 0, 0, 0, 1, 1,
-0.5282878, -1.641229, -4.45426, 0, 0, 0, 1, 1,
-0.5278144, -0.08254343, -1.638545, 0, 0, 0, 1, 1,
-0.525835, 0.1531682, -0.00413424, 1, 1, 1, 1, 1,
-0.5237741, -0.1739881, 1.175601, 1, 1, 1, 1, 1,
-0.5226778, -0.525266, -0.9183576, 1, 1, 1, 1, 1,
-0.5225444, 0.4551618, 1.267116, 1, 1, 1, 1, 1,
-0.5204278, 0.2522698, -2.308764, 1, 1, 1, 1, 1,
-0.5163722, 0.4026453, -1.651902, 1, 1, 1, 1, 1,
-0.5133529, -1.003642, -1.98405, 1, 1, 1, 1, 1,
-0.5130941, 0.4581457, -1.835604, 1, 1, 1, 1, 1,
-0.5130728, -0.4212593, -2.197398, 1, 1, 1, 1, 1,
-0.50856, 0.3833686, -0.6212308, 1, 1, 1, 1, 1,
-0.5051871, -0.08656266, -2.356614, 1, 1, 1, 1, 1,
-0.5002661, -1.63199, -4.294235, 1, 1, 1, 1, 1,
-0.499367, 0.5387356, -1.117951, 1, 1, 1, 1, 1,
-0.4957343, 0.5047319, -2.075445, 1, 1, 1, 1, 1,
-0.495005, -1.31799, -3.026037, 1, 1, 1, 1, 1,
-0.494279, -0.2248845, -1.696928, 0, 0, 1, 1, 1,
-0.4937959, -1.605424, -1.720569, 1, 0, 0, 1, 1,
-0.4935034, 1.428199, 0.003167772, 1, 0, 0, 1, 1,
-0.4914669, 1.178638, 1.056955, 1, 0, 0, 1, 1,
-0.4898126, -1.29839, -3.638154, 1, 0, 0, 1, 1,
-0.4868581, -0.8407985, -2.517497, 1, 0, 0, 1, 1,
-0.4823043, -1.154749, -2.682699, 0, 0, 0, 1, 1,
-0.4817094, -0.3302754, -0.3537225, 0, 0, 0, 1, 1,
-0.4781219, 1.88531, -0.9532883, 0, 0, 0, 1, 1,
-0.473847, -0.2695154, -3.141558, 0, 0, 0, 1, 1,
-0.4724134, -1.516331, -4.576819, 0, 0, 0, 1, 1,
-0.4652511, 1.643714, -1.83571, 0, 0, 0, 1, 1,
-0.4625322, 0.9582206, -0.5608464, 0, 0, 0, 1, 1,
-0.4614575, 1.520991, -1.284714, 1, 1, 1, 1, 1,
-0.4588301, 1.275026, 1.321978, 1, 1, 1, 1, 1,
-0.4517311, -0.2890538, -0.9457307, 1, 1, 1, 1, 1,
-0.44787, 1.521042, 0.2047172, 1, 1, 1, 1, 1,
-0.4463386, 0.04351878, 0.2980887, 1, 1, 1, 1, 1,
-0.4415545, -0.05956892, -1.154826, 1, 1, 1, 1, 1,
-0.4412071, -0.6829312, -3.877943, 1, 1, 1, 1, 1,
-0.4391197, 0.2296739, -1.235047, 1, 1, 1, 1, 1,
-0.4387444, 0.9844196, -2.040298, 1, 1, 1, 1, 1,
-0.4385163, -2.018811, -3.623941, 1, 1, 1, 1, 1,
-0.4372512, 0.7453758, 1.250596, 1, 1, 1, 1, 1,
-0.4354708, -1.444105, -2.431438, 1, 1, 1, 1, 1,
-0.4297589, 0.7376265, -1.614329, 1, 1, 1, 1, 1,
-0.4293899, 1.618116, 0.4403532, 1, 1, 1, 1, 1,
-0.4288809, -0.3967113, -2.180263, 1, 1, 1, 1, 1,
-0.4230815, 2.672307, -1.72016, 0, 0, 1, 1, 1,
-0.4206592, 0.9233205, 0.04994357, 1, 0, 0, 1, 1,
-0.4198695, 0.1063256, -2.265324, 1, 0, 0, 1, 1,
-0.4126725, -0.9948207, -2.123992, 1, 0, 0, 1, 1,
-0.4087662, -0.3301203, -2.993672, 1, 0, 0, 1, 1,
-0.4078478, 0.3279118, -4.134254, 1, 0, 0, 1, 1,
-0.4071881, 0.6220059, -1.335254, 0, 0, 0, 1, 1,
-0.4034534, 1.295905, 0.3221723, 0, 0, 0, 1, 1,
-0.401204, 1.524472, -1.250179, 0, 0, 0, 1, 1,
-0.3990336, 1.103213, 0.1786867, 0, 0, 0, 1, 1,
-0.3976368, -0.2450903, -1.538848, 0, 0, 0, 1, 1,
-0.3950759, -0.1828775, -2.698785, 0, 0, 0, 1, 1,
-0.3933848, 2.12296, -2.721917, 0, 0, 0, 1, 1,
-0.3891776, -0.1875228, -2.875021, 1, 1, 1, 1, 1,
-0.3836801, -0.6185852, -2.602976, 1, 1, 1, 1, 1,
-0.3795335, 0.6426975, 1.328364, 1, 1, 1, 1, 1,
-0.3733151, 0.3942919, -1.274189, 1, 1, 1, 1, 1,
-0.3627172, -0.9419048, -1.857753, 1, 1, 1, 1, 1,
-0.3602918, 0.3826536, -1.407449, 1, 1, 1, 1, 1,
-0.3585129, 0.229945, -1.657478, 1, 1, 1, 1, 1,
-0.3561127, 0.1113249, -0.3316461, 1, 1, 1, 1, 1,
-0.3558432, 1.009619, 0.832255, 1, 1, 1, 1, 1,
-0.3442972, 1.796119, 0.3952709, 1, 1, 1, 1, 1,
-0.3429084, 1.16321, -0.5198573, 1, 1, 1, 1, 1,
-0.3427184, 0.0005298835, -1.538665, 1, 1, 1, 1, 1,
-0.3422965, 1.575989, -0.4934992, 1, 1, 1, 1, 1,
-0.3415158, 1.296954, -0.8008092, 1, 1, 1, 1, 1,
-0.3407721, 0.2882316, -0.555127, 1, 1, 1, 1, 1,
-0.3382633, 0.5111031, 1.318119, 0, 0, 1, 1, 1,
-0.3380656, 2.216457, 0.577517, 1, 0, 0, 1, 1,
-0.3378832, -0.1468613, -2.258597, 1, 0, 0, 1, 1,
-0.3354934, -0.3986385, -0.3158814, 1, 0, 0, 1, 1,
-0.3345838, -0.6112772, -2.795153, 1, 0, 0, 1, 1,
-0.3254054, -0.1073898, -0.5398238, 1, 0, 0, 1, 1,
-0.3228826, 0.2412384, -1.64835, 0, 0, 0, 1, 1,
-0.3214647, 0.5654028, -0.6090439, 0, 0, 0, 1, 1,
-0.3204508, -0.3871139, -2.50871, 0, 0, 0, 1, 1,
-0.3152968, -0.3605994, -2.313449, 0, 0, 0, 1, 1,
-0.3148927, 0.468539, -0.8282834, 0, 0, 0, 1, 1,
-0.3132639, -1.314719, -3.076598, 0, 0, 0, 1, 1,
-0.3121256, 0.6262713, -1.75602, 0, 0, 0, 1, 1,
-0.3076723, -1.309437, -3.427155, 1, 1, 1, 1, 1,
-0.304359, -0.06309256, -2.124305, 1, 1, 1, 1, 1,
-0.3015113, -1.000713, -3.315805, 1, 1, 1, 1, 1,
-0.3010239, 0.7909179, -1.589588, 1, 1, 1, 1, 1,
-0.2987651, 0.5149578, -0.4524243, 1, 1, 1, 1, 1,
-0.2958277, -0.3732385, -3.8985, 1, 1, 1, 1, 1,
-0.2901111, -0.02783022, -3.040238, 1, 1, 1, 1, 1,
-0.2815666, 0.9529555, -0.3821263, 1, 1, 1, 1, 1,
-0.2768811, -2.219753, -4.159961, 1, 1, 1, 1, 1,
-0.2754653, 0.4345586, 0.2659535, 1, 1, 1, 1, 1,
-0.2730667, -0.07971546, -2.994138, 1, 1, 1, 1, 1,
-0.2727873, -1.175111, -3.949997, 1, 1, 1, 1, 1,
-0.2723337, 0.419353, 0.9467958, 1, 1, 1, 1, 1,
-0.2681099, -0.7932362, -2.469515, 1, 1, 1, 1, 1,
-0.2679749, 0.8018669, -1.538501, 1, 1, 1, 1, 1,
-0.266553, 2.11555, -1.816391, 0, 0, 1, 1, 1,
-0.262982, -1.767289, -2.386604, 1, 0, 0, 1, 1,
-0.259699, 0.5805106, 0.5297101, 1, 0, 0, 1, 1,
-0.257515, 0.6932676, -0.3652747, 1, 0, 0, 1, 1,
-0.2494477, -0.3015361, -2.419208, 1, 0, 0, 1, 1,
-0.2483797, -1.761684, -3.600389, 1, 0, 0, 1, 1,
-0.2454583, 1.148892, -0.7610685, 0, 0, 0, 1, 1,
-0.2443317, -0.6065063, -2.857777, 0, 0, 0, 1, 1,
-0.2361112, -1.004137, -1.832098, 0, 0, 0, 1, 1,
-0.2338999, -0.7908981, -3.614757, 0, 0, 0, 1, 1,
-0.230253, 0.3364216, -0.3800244, 0, 0, 0, 1, 1,
-0.2277148, 0.398592, -1.861295, 0, 0, 0, 1, 1,
-0.2251437, -1.791047, -4.181497, 0, 0, 0, 1, 1,
-0.224575, 0.6126105, -0.6224553, 1, 1, 1, 1, 1,
-0.2193772, 0.05448351, -1.009841, 1, 1, 1, 1, 1,
-0.2151068, -0.07951602, -0.8641161, 1, 1, 1, 1, 1,
-0.2129414, 0.6962935, -0.174213, 1, 1, 1, 1, 1,
-0.2079644, 0.3530088, 0.05717861, 1, 1, 1, 1, 1,
-0.2054107, -0.05901663, 0.008524894, 1, 1, 1, 1, 1,
-0.2022167, 0.4433811, 0.3466095, 1, 1, 1, 1, 1,
-0.1997409, 0.0355617, -0.5775746, 1, 1, 1, 1, 1,
-0.1939479, 1.458394, 0.4398738, 1, 1, 1, 1, 1,
-0.1923375, 1.696569, -1.75774, 1, 1, 1, 1, 1,
-0.191499, 1.588539, -0.3878379, 1, 1, 1, 1, 1,
-0.1872673, -0.6235607, -2.353917, 1, 1, 1, 1, 1,
-0.1850128, 0.6951373, -1.558961, 1, 1, 1, 1, 1,
-0.184621, 1.643915, 0.6031411, 1, 1, 1, 1, 1,
-0.1813542, 0.7513207, -1.071701, 1, 1, 1, 1, 1,
-0.1798831, 0.3714132, -1.18264, 0, 0, 1, 1, 1,
-0.1775169, 0.5457269, 0.2142048, 1, 0, 0, 1, 1,
-0.1752178, 1.48211, -0.3208373, 1, 0, 0, 1, 1,
-0.1749869, 0.242256, -1.460129, 1, 0, 0, 1, 1,
-0.17454, -2.428192, -2.494479, 1, 0, 0, 1, 1,
-0.1718444, -0.6339617, -2.045045, 1, 0, 0, 1, 1,
-0.1709923, -0.8608454, -2.623439, 0, 0, 0, 1, 1,
-0.1679704, 0.3620634, 0.9270453, 0, 0, 0, 1, 1,
-0.1669445, 0.5285245, -2.096009, 0, 0, 0, 1, 1,
-0.1647536, -0.05999736, 0.3417316, 0, 0, 0, 1, 1,
-0.1640075, 0.5208985, -2.245869, 0, 0, 0, 1, 1,
-0.1630796, 0.9700717, 0.2453488, 0, 0, 0, 1, 1,
-0.161602, -0.1586482, -0.9079247, 0, 0, 0, 1, 1,
-0.1588978, 0.08279096, -2.037184, 1, 1, 1, 1, 1,
-0.1580193, 0.6351207, 1.185394, 1, 1, 1, 1, 1,
-0.1569443, 1.535121, 0.1059963, 1, 1, 1, 1, 1,
-0.1542739, 0.1004664, -1.283742, 1, 1, 1, 1, 1,
-0.1516217, -0.03309083, -3.109602, 1, 1, 1, 1, 1,
-0.1508766, 0.265386, 0.5237949, 1, 1, 1, 1, 1,
-0.1498079, 2.575721, -2.094694, 1, 1, 1, 1, 1,
-0.1426882, -0.182051, -2.771952, 1, 1, 1, 1, 1,
-0.1421269, 0.8517137, -0.7506277, 1, 1, 1, 1, 1,
-0.1401691, 0.9730867, -0.02075407, 1, 1, 1, 1, 1,
-0.1395273, 0.7105691, -0.0300443, 1, 1, 1, 1, 1,
-0.135554, 0.746735, 0.3314298, 1, 1, 1, 1, 1,
-0.1346136, -0.2790823, -3.125864, 1, 1, 1, 1, 1,
-0.1284987, 1.817962, 0.6633274, 1, 1, 1, 1, 1,
-0.1276984, -0.8341891, -3.713234, 1, 1, 1, 1, 1,
-0.1242212, -0.5180144, -2.642243, 0, 0, 1, 1, 1,
-0.1221005, 0.1336192, -1.807565, 1, 0, 0, 1, 1,
-0.1119094, 1.088747, -1.346184, 1, 0, 0, 1, 1,
-0.1039379, 0.2243074, -1.729881, 1, 0, 0, 1, 1,
-0.1007288, -0.01208509, -1.036687, 1, 0, 0, 1, 1,
-0.09929944, 0.9231809, 1.833928, 1, 0, 0, 1, 1,
-0.0954826, 0.06051221, -1.977694, 0, 0, 0, 1, 1,
-0.09514662, 0.4743344, -2.469501, 0, 0, 0, 1, 1,
-0.09466714, -0.5459396, -0.4692306, 0, 0, 0, 1, 1,
-0.0932372, 1.221091, 0.2519691, 0, 0, 0, 1, 1,
-0.09094927, -0.07362738, -2.26915, 0, 0, 0, 1, 1,
-0.08751283, 0.01931278, -1.968863, 0, 0, 0, 1, 1,
-0.08679649, 1.659219, -0.8989734, 0, 0, 0, 1, 1,
-0.07955106, -1.482291, -4.864494, 1, 1, 1, 1, 1,
-0.07720876, 0.5052248, -0.1845934, 1, 1, 1, 1, 1,
-0.07695266, -0.2382, -2.693821, 1, 1, 1, 1, 1,
-0.07629391, 0.9056968, -0.461227, 1, 1, 1, 1, 1,
-0.074692, -0.7386903, -5.120909, 1, 1, 1, 1, 1,
-0.07157129, 0.4703383, 0.7705843, 1, 1, 1, 1, 1,
-0.07059409, 0.1415609, -0.919574, 1, 1, 1, 1, 1,
-0.06957576, -1.317259, -3.214252, 1, 1, 1, 1, 1,
-0.06634811, -0.2719985, -2.573131, 1, 1, 1, 1, 1,
-0.06309846, -0.893855, -1.948117, 1, 1, 1, 1, 1,
-0.06226271, 0.9369631, -0.5570455, 1, 1, 1, 1, 1,
-0.06207496, -0.6710468, -3.511065, 1, 1, 1, 1, 1,
-0.060646, -0.1744687, -2.993761, 1, 1, 1, 1, 1,
-0.05997102, -0.4352995, -2.732809, 1, 1, 1, 1, 1,
-0.05884118, -1.230216, -2.98412, 1, 1, 1, 1, 1,
-0.05243558, 0.7345642, 1.347376, 0, 0, 1, 1, 1,
-0.051361, 0.3093099, 2.170019, 1, 0, 0, 1, 1,
-0.04744381, -0.8772748, -4.298836, 1, 0, 0, 1, 1,
-0.04422165, -0.5446744, -2.27713, 1, 0, 0, 1, 1,
-0.04301358, -2.419404, -2.790104, 1, 0, 0, 1, 1,
-0.04115149, -0.9360111, -4.462358, 1, 0, 0, 1, 1,
-0.03663428, -0.4230478, -2.093623, 0, 0, 0, 1, 1,
-0.02980649, 0.7287703, 1.603923, 0, 0, 0, 1, 1,
-0.02823288, -0.5708242, -0.5180995, 0, 0, 0, 1, 1,
-0.02405433, -0.360625, -4.021527, 0, 0, 0, 1, 1,
-0.02194949, -0.8420866, -3.713234, 0, 0, 0, 1, 1,
-0.02017297, -1.823423, -4.016336, 0, 0, 0, 1, 1,
-0.02012911, -1.057275, -3.02349, 0, 0, 0, 1, 1,
-0.01734649, 2.073969, -0.1374223, 1, 1, 1, 1, 1,
-0.01627335, -0.4797921, -1.758457, 1, 1, 1, 1, 1,
-0.01517421, -2.256551, -4.005225, 1, 1, 1, 1, 1,
-0.01283, -0.08938406, -4.812727, 1, 1, 1, 1, 1,
-0.009808916, -0.9225064, -3.709556, 1, 1, 1, 1, 1,
-0.007718706, -0.5690625, -3.378379, 1, 1, 1, 1, 1,
-0.00743848, 1.1442, -0.7318788, 1, 1, 1, 1, 1,
-0.006705821, -0.09967663, -2.870858, 1, 1, 1, 1, 1,
-0.005780476, -0.2652685, -3.932657, 1, 1, 1, 1, 1,
0.0005057642, -0.2047706, 3.472314, 1, 1, 1, 1, 1,
0.001857104, -0.1792273, 3.521286, 1, 1, 1, 1, 1,
0.004857247, -0.8815868, 1.788826, 1, 1, 1, 1, 1,
0.005089412, -0.9856348, 1.976438, 1, 1, 1, 1, 1,
0.008104634, 0.507269, -0.3674525, 1, 1, 1, 1, 1,
0.01063847, -0.6153438, 4.432987, 1, 1, 1, 1, 1,
0.01793268, -0.009155509, 2.513375, 0, 0, 1, 1, 1,
0.02102608, -2.267354, 3.043123, 1, 0, 0, 1, 1,
0.02286791, -1.102144, 3.126967, 1, 0, 0, 1, 1,
0.02494933, 1.35478, -2.970104, 1, 0, 0, 1, 1,
0.02802486, 0.7576591, -1.849402, 1, 0, 0, 1, 1,
0.02826297, 0.3948312, 1.176559, 1, 0, 0, 1, 1,
0.02847939, -0.8550534, 1.982546, 0, 0, 0, 1, 1,
0.03002849, -0.5544332, 4.562284, 0, 0, 0, 1, 1,
0.03010161, -1.022909, 2.212609, 0, 0, 0, 1, 1,
0.03554668, -0.1790118, 1.101355, 0, 0, 0, 1, 1,
0.03986798, -0.1289955, 3.920521, 0, 0, 0, 1, 1,
0.04053362, -0.9810298, 3.151542, 0, 0, 0, 1, 1,
0.04217941, 0.9071604, -0.8242157, 0, 0, 0, 1, 1,
0.0432383, -0.002913125, 1.640046, 1, 1, 1, 1, 1,
0.04511943, -0.6362259, 3.712286, 1, 1, 1, 1, 1,
0.04765071, -0.1420525, 4.669342, 1, 1, 1, 1, 1,
0.04992964, 0.2656367, 2.300535, 1, 1, 1, 1, 1,
0.0567129, -0.1034781, 1.800463, 1, 1, 1, 1, 1,
0.06012347, -1.177698, 1.894532, 1, 1, 1, 1, 1,
0.06112298, 0.4020129, 0.1238933, 1, 1, 1, 1, 1,
0.06291228, -1.154703, 3.697087, 1, 1, 1, 1, 1,
0.06576204, -1.581856, 3.38494, 1, 1, 1, 1, 1,
0.06591258, 1.609365, 1.696441, 1, 1, 1, 1, 1,
0.06644452, -0.07361843, 3.589621, 1, 1, 1, 1, 1,
0.07158767, 0.2220177, 1.245551, 1, 1, 1, 1, 1,
0.07597436, 0.2615302, -0.306327, 1, 1, 1, 1, 1,
0.07747825, 0.3425908, 0.39051, 1, 1, 1, 1, 1,
0.07910699, -0.1737027, 1.41477, 1, 1, 1, 1, 1,
0.08688886, -0.402071, 2.26462, 0, 0, 1, 1, 1,
0.08691745, -0.1295136, 3.260765, 1, 0, 0, 1, 1,
0.09028172, 0.5311311, -0.9139755, 1, 0, 0, 1, 1,
0.09069872, -0.358203, 1.032878, 1, 0, 0, 1, 1,
0.09223265, -1.556504, 1.867679, 1, 0, 0, 1, 1,
0.09974111, -1.954726, 4.186992, 1, 0, 0, 1, 1,
0.1011428, -0.6150311, 1.126938, 0, 0, 0, 1, 1,
0.1030516, -0.1573976, 3.872925, 0, 0, 0, 1, 1,
0.1124082, -0.4860134, 4.798849, 0, 0, 0, 1, 1,
0.1125923, -0.9165044, 3.320865, 0, 0, 0, 1, 1,
0.1142321, -1.199557, 4.035161, 0, 0, 0, 1, 1,
0.1250616, 2.235284, 1.079856, 0, 0, 0, 1, 1,
0.1257226, 0.5115073, 1.939036, 0, 0, 0, 1, 1,
0.1263704, -1.00549, 2.628392, 1, 1, 1, 1, 1,
0.1274391, 1.541635, -0.5222002, 1, 1, 1, 1, 1,
0.1295066, 0.2394984, 1.086641, 1, 1, 1, 1, 1,
0.1387841, 1.930957, -0.2714924, 1, 1, 1, 1, 1,
0.1403055, -1.497954, 3.299832, 1, 1, 1, 1, 1,
0.1465438, -0.6139527, 1.930202, 1, 1, 1, 1, 1,
0.1473612, 0.3457379, 1.240904, 1, 1, 1, 1, 1,
0.1483956, -1.492983, 3.270353, 1, 1, 1, 1, 1,
0.1520479, 1.082853, -0.2659408, 1, 1, 1, 1, 1,
0.1529382, -0.2310523, 2.901632, 1, 1, 1, 1, 1,
0.1591328, -1.219357, 4.623913, 1, 1, 1, 1, 1,
0.1593601, 1.361962, 0.4416896, 1, 1, 1, 1, 1,
0.1595767, -1.705249, 3.810822, 1, 1, 1, 1, 1,
0.1616265, -0.2169587, 1.575076, 1, 1, 1, 1, 1,
0.1668426, -0.2381074, 3.778361, 1, 1, 1, 1, 1,
0.1679616, -0.8267187, 3.793596, 0, 0, 1, 1, 1,
0.1741697, -1.522781, 1.868492, 1, 0, 0, 1, 1,
0.1745855, 0.03521889, 0.3877456, 1, 0, 0, 1, 1,
0.1752616, 0.778534, -0.3279179, 1, 0, 0, 1, 1,
0.1772538, -0.6440424, 3.900279, 1, 0, 0, 1, 1,
0.179572, -1.45365, 6.487545, 1, 0, 0, 1, 1,
0.1807893, -0.1613469, 2.289308, 0, 0, 0, 1, 1,
0.1817196, 0.4658217, 0.8616394, 0, 0, 0, 1, 1,
0.1917614, 0.2167024, -0.499615, 0, 0, 0, 1, 1,
0.1925167, 1.011117, 1.434456, 0, 0, 0, 1, 1,
0.1931993, -3.282034, 4.864957, 0, 0, 0, 1, 1,
0.1960497, -0.4892564, 4.591976, 0, 0, 0, 1, 1,
0.2046194, 0.4561192, 1.408922, 0, 0, 0, 1, 1,
0.2059989, 0.1044811, 1.903674, 1, 1, 1, 1, 1,
0.2084347, 1.981226, -0.2598225, 1, 1, 1, 1, 1,
0.2104282, 0.2145181, 1.933614, 1, 1, 1, 1, 1,
0.2128843, -0.05696428, 2.631609, 1, 1, 1, 1, 1,
0.2151347, -0.4830024, 2.540305, 1, 1, 1, 1, 1,
0.2177962, -0.9539739, 4.056057, 1, 1, 1, 1, 1,
0.2280782, -0.6115496, 3.389169, 1, 1, 1, 1, 1,
0.2286467, -1.927424, 2.363742, 1, 1, 1, 1, 1,
0.235429, 0.9825212, 1.9116, 1, 1, 1, 1, 1,
0.2361745, -3.351366, 2.912699, 1, 1, 1, 1, 1,
0.2408886, -0.6117158, 2.03591, 1, 1, 1, 1, 1,
0.2432606, 0.8497915, 1.867174, 1, 1, 1, 1, 1,
0.2444667, -1.116994, 3.645855, 1, 1, 1, 1, 1,
0.2454226, -0.04981602, -0.6390753, 1, 1, 1, 1, 1,
0.2459179, -1.279174, 2.156717, 1, 1, 1, 1, 1,
0.2468119, 1.054904, -0.4601672, 0, 0, 1, 1, 1,
0.2526626, -0.2067972, 2.181042, 1, 0, 0, 1, 1,
0.2532846, 0.9646955, 1.313503, 1, 0, 0, 1, 1,
0.2542932, 0.6744821, 0.4172636, 1, 0, 0, 1, 1,
0.2546835, -0.07652552, 1.321709, 1, 0, 0, 1, 1,
0.2566864, -0.4965042, 2.03049, 1, 0, 0, 1, 1,
0.2623179, -0.154352, 2.965402, 0, 0, 0, 1, 1,
0.265076, 0.6621023, -0.9667365, 0, 0, 0, 1, 1,
0.2708275, 1.371403, 1.537819, 0, 0, 0, 1, 1,
0.277526, 0.6950788, -1.358422, 0, 0, 0, 1, 1,
0.2803853, 0.0892232, 1.575216, 0, 0, 0, 1, 1,
0.2817121, -0.708729, 4.189318, 0, 0, 0, 1, 1,
0.2823962, 0.06120382, 2.209919, 0, 0, 0, 1, 1,
0.2829103, 0.04530774, 2.673754, 1, 1, 1, 1, 1,
0.2871211, 0.2156155, 1.840776, 1, 1, 1, 1, 1,
0.2919177, 0.9718167, 1.378977, 1, 1, 1, 1, 1,
0.2925341, 0.1351114, 1.752237, 1, 1, 1, 1, 1,
0.2931057, 2.124755, 1.157513, 1, 1, 1, 1, 1,
0.2935298, 0.5511925, 1.549608, 1, 1, 1, 1, 1,
0.2940517, -2.012307, 1.900456, 1, 1, 1, 1, 1,
0.2941462, -0.1244105, 2.264178, 1, 1, 1, 1, 1,
0.2943852, 1.079026, 0.6547775, 1, 1, 1, 1, 1,
0.2978285, -0.3313776, 3.427906, 1, 1, 1, 1, 1,
0.2985062, -0.03759044, 1.102255, 1, 1, 1, 1, 1,
0.3012239, 0.7372173, 0.9722295, 1, 1, 1, 1, 1,
0.301322, -0.5202402, 2.793681, 1, 1, 1, 1, 1,
0.3060977, 1.347626, 1.885074, 1, 1, 1, 1, 1,
0.3196459, -0.3337296, 2.406313, 1, 1, 1, 1, 1,
0.320895, -1.045309, 2.967549, 0, 0, 1, 1, 1,
0.3227065, -0.04429234, 0.92209, 1, 0, 0, 1, 1,
0.3243347, -0.8124927, 3.090068, 1, 0, 0, 1, 1,
0.3284419, 0.8847495, -0.2252016, 1, 0, 0, 1, 1,
0.3291971, 1.952396, 1.736531, 1, 0, 0, 1, 1,
0.3321713, 0.1828622, 1.362953, 1, 0, 0, 1, 1,
0.3353781, -0.1708189, 1.188623, 0, 0, 0, 1, 1,
0.3363679, -0.1893952, -0.2126884, 0, 0, 0, 1, 1,
0.3384405, -1.17844, 3.005497, 0, 0, 0, 1, 1,
0.3404557, 1.18361, 0.5866513, 0, 0, 0, 1, 1,
0.3415592, 0.912771, 0.6245471, 0, 0, 0, 1, 1,
0.3447338, 0.3443865, 0.5325189, 0, 0, 0, 1, 1,
0.3483998, 0.8288774, 1.107696, 0, 0, 0, 1, 1,
0.3539625, -0.514181, 0.9510251, 1, 1, 1, 1, 1,
0.3540346, 0.4164411, 1.564478, 1, 1, 1, 1, 1,
0.3582015, -1.80871, 3.891729, 1, 1, 1, 1, 1,
0.3597287, 1.042727, -0.2246256, 1, 1, 1, 1, 1,
0.3656988, -1.226593, 3.130377, 1, 1, 1, 1, 1,
0.3684904, 0.560604, 2.959319, 1, 1, 1, 1, 1,
0.3695378, -0.7461726, 2.795094, 1, 1, 1, 1, 1,
0.3748078, -0.587768, 2.026902, 1, 1, 1, 1, 1,
0.3784169, 0.1749748, 0.3468081, 1, 1, 1, 1, 1,
0.3788661, -0.6173322, 2.12956, 1, 1, 1, 1, 1,
0.3822793, 0.8040483, 0.243849, 1, 1, 1, 1, 1,
0.386745, -1.077273, 2.968524, 1, 1, 1, 1, 1,
0.3872176, 0.7178609, -0.5185798, 1, 1, 1, 1, 1,
0.3884455, -0.1054906, 0.9721437, 1, 1, 1, 1, 1,
0.3893381, -0.9847181, 3.001679, 1, 1, 1, 1, 1,
0.3905267, -0.1613384, 1.22011, 0, 0, 1, 1, 1,
0.3917908, -0.3057361, 1.932562, 1, 0, 0, 1, 1,
0.3918703, -0.06713244, 1.422333, 1, 0, 0, 1, 1,
0.3935507, 0.8717801, 0.3324206, 1, 0, 0, 1, 1,
0.3936283, -0.3039048, 1.351886, 1, 0, 0, 1, 1,
0.3948914, -0.1534531, 2.071342, 1, 0, 0, 1, 1,
0.397649, 0.241128, 0.7280046, 0, 0, 0, 1, 1,
0.4013514, 1.136014, 1.923843, 0, 0, 0, 1, 1,
0.402114, -0.3416944, 3.666831, 0, 0, 0, 1, 1,
0.4049482, -0.9608487, 1.814572, 0, 0, 0, 1, 1,
0.4054271, -0.7721508, 1.33603, 0, 0, 0, 1, 1,
0.4065336, 0.8185769, -0.8178979, 0, 0, 0, 1, 1,
0.4079315, 2.440418, 1.367428, 0, 0, 0, 1, 1,
0.4099919, -0.7062656, 0.6636773, 1, 1, 1, 1, 1,
0.4203857, -0.2370339, 1.429263, 1, 1, 1, 1, 1,
0.4210618, 0.3249821, 1.835326, 1, 1, 1, 1, 1,
0.4250967, 0.7701681, 0.9267054, 1, 1, 1, 1, 1,
0.4251463, -0.4583796, 2.415804, 1, 1, 1, 1, 1,
0.4258208, -0.1791354, 3.125065, 1, 1, 1, 1, 1,
0.4268321, 0.1777363, 1.608331, 1, 1, 1, 1, 1,
0.4271742, -0.02876956, 0.7482998, 1, 1, 1, 1, 1,
0.428429, 1.858711, 0.6618224, 1, 1, 1, 1, 1,
0.4333621, -0.0712773, 1.237633, 1, 1, 1, 1, 1,
0.4396929, -0.441423, 3.323845, 1, 1, 1, 1, 1,
0.4401478, -0.1374262, 1.663435, 1, 1, 1, 1, 1,
0.45097, 1.044975, 1.023402, 1, 1, 1, 1, 1,
0.4527471, 1.031718, -0.2904114, 1, 1, 1, 1, 1,
0.4552858, 0.511788, 1.914618, 1, 1, 1, 1, 1,
0.455305, 1.571155, 1.379248, 0, 0, 1, 1, 1,
0.4553438, 1.227232, 0.2563769, 1, 0, 0, 1, 1,
0.459065, -0.4162576, 1.675267, 1, 0, 0, 1, 1,
0.4611908, 0.4041179, -0.3108111, 1, 0, 0, 1, 1,
0.4673426, -0.1107374, 0.6739695, 1, 0, 0, 1, 1,
0.4679681, 1.574021, -0.4515893, 1, 0, 0, 1, 1,
0.4686677, 1.833026, -0.1275806, 0, 0, 0, 1, 1,
0.4744032, -0.4067053, 3.476775, 0, 0, 0, 1, 1,
0.4783658, 1.80131, 1.668932, 0, 0, 0, 1, 1,
0.4795962, -1.103209, 1.575958, 0, 0, 0, 1, 1,
0.4796817, 0.5725515, 0.9847465, 0, 0, 0, 1, 1,
0.4812366, 0.06499638, 2.2616, 0, 0, 0, 1, 1,
0.4841046, -1.005536, 0.8247737, 0, 0, 0, 1, 1,
0.5012326, -0.1983483, 2.65518, 1, 1, 1, 1, 1,
0.5023624, -0.5604796, 4.076833, 1, 1, 1, 1, 1,
0.5084667, -0.1130737, 0.8769794, 1, 1, 1, 1, 1,
0.5133177, 1.07043, 0.7295005, 1, 1, 1, 1, 1,
0.5148248, 1.097654, 2.244379, 1, 1, 1, 1, 1,
0.5151814, 1.087881, 0.4877899, 1, 1, 1, 1, 1,
0.5154357, -1.208027, 3.589595, 1, 1, 1, 1, 1,
0.5171079, -1.6958, 3.190293, 1, 1, 1, 1, 1,
0.5178726, 1.987935, 1.133824, 1, 1, 1, 1, 1,
0.5194207, -0.07257199, 1.929508, 1, 1, 1, 1, 1,
0.5213224, 0.1154791, 1.001488, 1, 1, 1, 1, 1,
0.5248268, 0.5894397, 2.314099, 1, 1, 1, 1, 1,
0.5290554, 0.4586687, 1.691076, 1, 1, 1, 1, 1,
0.5320374, 0.8163497, 1.549791, 1, 1, 1, 1, 1,
0.5335447, -0.1482206, 1.651841, 1, 1, 1, 1, 1,
0.5473838, 0.3308861, 1.32973, 0, 0, 1, 1, 1,
0.5521562, 1.494051, -0.7826707, 1, 0, 0, 1, 1,
0.5526263, -2.275521, 4.346627, 1, 0, 0, 1, 1,
0.5538217, -0.5019095, 3.414019, 1, 0, 0, 1, 1,
0.5567116, -0.3814793, 1.729345, 1, 0, 0, 1, 1,
0.5604582, -0.3572354, 2.443562, 1, 0, 0, 1, 1,
0.5655405, -0.5275247, 2.965178, 0, 0, 0, 1, 1,
0.5668852, -0.3338149, 1.967993, 0, 0, 0, 1, 1,
0.5669649, 0.4151583, 0.06712982, 0, 0, 0, 1, 1,
0.5679682, -0.4739514, 0.9662362, 0, 0, 0, 1, 1,
0.5771532, -0.2233013, 2.195807, 0, 0, 0, 1, 1,
0.5867479, 0.7213371, 1.324223, 0, 0, 0, 1, 1,
0.5928633, 0.06052452, -0.3943051, 0, 0, 0, 1, 1,
0.5944239, -0.4776474, 3.341367, 1, 1, 1, 1, 1,
0.5951853, 0.6695704, -0.5443346, 1, 1, 1, 1, 1,
0.6001161, 0.6756459, -1.248723, 1, 1, 1, 1, 1,
0.6013066, 1.146747, 0.3521287, 1, 1, 1, 1, 1,
0.6086923, -0.5496618, 1.034701, 1, 1, 1, 1, 1,
0.6091715, 0.2229744, 0.4999782, 1, 1, 1, 1, 1,
0.6132956, -1.210815, 2.101751, 1, 1, 1, 1, 1,
0.6151559, -0.7339982, 3.500108, 1, 1, 1, 1, 1,
0.6160074, 0.9782421, 0.4326977, 1, 1, 1, 1, 1,
0.6164967, 0.3303886, 2.48566, 1, 1, 1, 1, 1,
0.6199296, -0.5532818, 4.45306, 1, 1, 1, 1, 1,
0.6205695, -2.618984, 3.815532, 1, 1, 1, 1, 1,
0.6236687, -0.8684351, 2.652828, 1, 1, 1, 1, 1,
0.6268326, -0.1015053, 2.777131, 1, 1, 1, 1, 1,
0.6296979, 1.151881, 0.1929181, 1, 1, 1, 1, 1,
0.6319427, -1.390869, 3.656478, 0, 0, 1, 1, 1,
0.636345, 0.5547929, -0.02721657, 1, 0, 0, 1, 1,
0.6370817, -0.8815641, 2.331975, 1, 0, 0, 1, 1,
0.6392686, 0.656521, 1.774741, 1, 0, 0, 1, 1,
0.6412612, 0.4584128, 1.557301, 1, 0, 0, 1, 1,
0.6457165, 1.611044, 0.526344, 1, 0, 0, 1, 1,
0.646597, -0.1984151, 1.561399, 0, 0, 0, 1, 1,
0.6467444, 0.5668671, 1.539506, 0, 0, 0, 1, 1,
0.6468356, 1.53761, -0.05925245, 0, 0, 0, 1, 1,
0.6531273, 0.6578323, 1.188249, 0, 0, 0, 1, 1,
0.6577819, 0.5236086, 0.9384744, 0, 0, 0, 1, 1,
0.6588947, -1.328594, 3.741949, 0, 0, 0, 1, 1,
0.6615835, -0.006293138, -0.2704801, 0, 0, 0, 1, 1,
0.662649, 0.7939075, 0.1939035, 1, 1, 1, 1, 1,
0.6644927, 0.3810825, 1.214242, 1, 1, 1, 1, 1,
0.6666865, -0.5895721, 2.618743, 1, 1, 1, 1, 1,
0.6667476, 0.05207957, 1.807203, 1, 1, 1, 1, 1,
0.6677537, 1.309906, 0.9249716, 1, 1, 1, 1, 1,
0.6686419, 0.2399891, -0.8982872, 1, 1, 1, 1, 1,
0.6782344, -1.194889, 3.615199, 1, 1, 1, 1, 1,
0.6797325, -1.022511, 3.110009, 1, 1, 1, 1, 1,
0.6804547, -0.3209767, 3.032944, 1, 1, 1, 1, 1,
0.6839101, -1.185697, 1.592251, 1, 1, 1, 1, 1,
0.6868179, -0.005761774, 1.116036, 1, 1, 1, 1, 1,
0.6890899, -0.03412592, 1.986259, 1, 1, 1, 1, 1,
0.6919633, -0.387975, 1.886344, 1, 1, 1, 1, 1,
0.6930226, 0.8592486, 1.328636, 1, 1, 1, 1, 1,
0.69444, -2.07063, 2.883032, 1, 1, 1, 1, 1,
0.6986575, 0.1059583, 1.440972, 0, 0, 1, 1, 1,
0.6987628, -1.326737, 3.075449, 1, 0, 0, 1, 1,
0.7035014, -0.5667831, -0.0730493, 1, 0, 0, 1, 1,
0.7046579, 0.4564415, 0.5382321, 1, 0, 0, 1, 1,
0.7048703, -1.104514, 2.593387, 1, 0, 0, 1, 1,
0.7086444, -1.265226, 1.44333, 1, 0, 0, 1, 1,
0.7136122, -1.008855, 1.980453, 0, 0, 0, 1, 1,
0.7144439, 0.3050776, 0.7008123, 0, 0, 0, 1, 1,
0.7197331, -0.8414481, 3.393218, 0, 0, 0, 1, 1,
0.7276487, 0.2381408, 1.024317, 0, 0, 0, 1, 1,
0.7326517, 0.05268476, 1.257832, 0, 0, 0, 1, 1,
0.7389081, -1.483585, 1.985498, 0, 0, 0, 1, 1,
0.7406817, 0.6606703, 1.314422, 0, 0, 0, 1, 1,
0.7441414, 0.4213046, 1.695985, 1, 1, 1, 1, 1,
0.7442158, -0.7604775, 2.464212, 1, 1, 1, 1, 1,
0.7442436, -0.7440068, 3.780689, 1, 1, 1, 1, 1,
0.7451382, -2.051859, 3.219821, 1, 1, 1, 1, 1,
0.7452178, -1.373876, 3.71728, 1, 1, 1, 1, 1,
0.7511211, -1.134353, 3.019082, 1, 1, 1, 1, 1,
0.7516926, 0.1955191, 0.2243348, 1, 1, 1, 1, 1,
0.7545221, -1.641649, 2.909016, 1, 1, 1, 1, 1,
0.7548293, 0.4490429, 0.4921159, 1, 1, 1, 1, 1,
0.7587174, 0.3212197, 0.2259163, 1, 1, 1, 1, 1,
0.769759, 0.9914052, -0.1747928, 1, 1, 1, 1, 1,
0.7714719, -1.335659, 0.5072172, 1, 1, 1, 1, 1,
0.77232, 0.09042168, 0.1875017, 1, 1, 1, 1, 1,
0.7744358, -0.5354887, 1.969378, 1, 1, 1, 1, 1,
0.7829465, -0.3794698, 1.274322, 1, 1, 1, 1, 1,
0.7844687, 0.6552847, 1.510667, 0, 0, 1, 1, 1,
0.7848449, 0.1668422, 1.500132, 1, 0, 0, 1, 1,
0.7878006, 0.2994778, 0.9186392, 1, 0, 0, 1, 1,
0.7885539, 0.3765908, -0.7079831, 1, 0, 0, 1, 1,
0.7907005, 0.2436872, 1.984771, 1, 0, 0, 1, 1,
0.7912484, -0.381113, 2.183664, 1, 0, 0, 1, 1,
0.7923016, 0.3909526, -2.20834, 0, 0, 0, 1, 1,
0.794234, 1.458471, -0.1497549, 0, 0, 0, 1, 1,
0.8002467, 0.633271, 3.238507, 0, 0, 0, 1, 1,
0.8017804, 0.157758, 3.022952, 0, 0, 0, 1, 1,
0.8125087, 0.03337309, 1.496599, 0, 0, 0, 1, 1,
0.8148766, -0.8594154, 2.255638, 0, 0, 0, 1, 1,
0.8214663, 1.159066, 0.3437365, 0, 0, 0, 1, 1,
0.8215277, 1.24057, 0.7996247, 1, 1, 1, 1, 1,
0.8216043, 0.7889845, -0.1292318, 1, 1, 1, 1, 1,
0.8253708, 2.012689, 0.7333237, 1, 1, 1, 1, 1,
0.8266633, -1.088783, 2.946474, 1, 1, 1, 1, 1,
0.8317924, -0.8532078, 2.025561, 1, 1, 1, 1, 1,
0.8416291, -0.5915478, 4.297382, 1, 1, 1, 1, 1,
0.8424041, -0.8475018, 2.219712, 1, 1, 1, 1, 1,
0.8467842, -0.5482317, 2.722443, 1, 1, 1, 1, 1,
0.847625, -0.3185745, 2.846883, 1, 1, 1, 1, 1,
0.8489327, 0.05805359, 2.334758, 1, 1, 1, 1, 1,
0.8496115, -0.2982917, 0.4457599, 1, 1, 1, 1, 1,
0.8606169, 1.312906, -0.429148, 1, 1, 1, 1, 1,
0.8663079, -0.5410712, 0.3890913, 1, 1, 1, 1, 1,
0.8670241, -1.728907, 3.659974, 1, 1, 1, 1, 1,
0.8865116, -0.2933264, 1.183035, 1, 1, 1, 1, 1,
0.8867519, -0.6550806, 3.004731, 0, 0, 1, 1, 1,
0.8903933, -1.9022, 2.596761, 1, 0, 0, 1, 1,
0.8906156, -0.5029286, -0.1729763, 1, 0, 0, 1, 1,
0.9101243, -1.129665, 2.600034, 1, 0, 0, 1, 1,
0.9129865, -1.135877, 3.230589, 1, 0, 0, 1, 1,
0.9132615, 0.4777044, 0.8518031, 1, 0, 0, 1, 1,
0.9189929, 1.143569, 2.338117, 0, 0, 0, 1, 1,
0.9214653, -0.3985355, 2.80609, 0, 0, 0, 1, 1,
0.9236974, 0.3515903, 0.825708, 0, 0, 0, 1, 1,
0.9274431, -1.422892, 1.019309, 0, 0, 0, 1, 1,
0.9328133, -1.66565, 2.899506, 0, 0, 0, 1, 1,
0.9344921, -0.91684, 2.353894, 0, 0, 0, 1, 1,
0.9356492, -1.416068, 2.992027, 0, 0, 0, 1, 1,
0.9366632, -0.4185695, 2.606348, 1, 1, 1, 1, 1,
0.9382504, -1.23699, 0.6908773, 1, 1, 1, 1, 1,
0.9464245, -0.6808928, 1.067922, 1, 1, 1, 1, 1,
0.9468814, 0.6364136, 1.868077, 1, 1, 1, 1, 1,
0.949694, 0.5714758, 2.39866, 1, 1, 1, 1, 1,
0.9504741, -1.771609, 3.87082, 1, 1, 1, 1, 1,
0.951982, -1.203112, 3.225009, 1, 1, 1, 1, 1,
0.9683989, -3.097526, 2.494782, 1, 1, 1, 1, 1,
0.9739272, 1.029585, -0.276893, 1, 1, 1, 1, 1,
0.9743638, -0.981476, 2.646812, 1, 1, 1, 1, 1,
0.9798552, -0.9100737, 0.2801499, 1, 1, 1, 1, 1,
0.9814922, 0.9668545, -0.4747021, 1, 1, 1, 1, 1,
0.9959444, -0.6882681, 2.451537, 1, 1, 1, 1, 1,
0.9960919, -3.135158, 3.115286, 1, 1, 1, 1, 1,
1.003035, 0.6000034, -0.2239484, 1, 1, 1, 1, 1,
1.003702, -0.6675239, 1.009529, 0, 0, 1, 1, 1,
1.009509, 2.106141, -0.1068127, 1, 0, 0, 1, 1,
1.018984, -0.8881454, 1.650891, 1, 0, 0, 1, 1,
1.021875, 1.127975, 0.6902245, 1, 0, 0, 1, 1,
1.036317, 0.3302856, 1.131794, 1, 0, 0, 1, 1,
1.036741, -1.092828, 1.805719, 1, 0, 0, 1, 1,
1.038061, -0.3681062, 0.02188664, 0, 0, 0, 1, 1,
1.039627, -0.4165989, 1.210975, 0, 0, 0, 1, 1,
1.040052, 1.22034, 3.315644, 0, 0, 0, 1, 1,
1.041884, 0.7526045, -0.3485658, 0, 0, 0, 1, 1,
1.058877, 0.3265337, -0.8492655, 0, 0, 0, 1, 1,
1.065347, -1.019153, 2.330173, 0, 0, 0, 1, 1,
1.066244, 0.2033803, 1.857162, 0, 0, 0, 1, 1,
1.072898, 0.670229, 2.814863, 1, 1, 1, 1, 1,
1.073587, 1.727936, 0.644805, 1, 1, 1, 1, 1,
1.079457, -0.4616929, 3.318929, 1, 1, 1, 1, 1,
1.080485, 0.7879912, 0.6560091, 1, 1, 1, 1, 1,
1.085744, -1.112416, 0.9422994, 1, 1, 1, 1, 1,
1.090981, 0.5961037, 1.248525, 1, 1, 1, 1, 1,
1.091704, 2.710092, -2.157033, 1, 1, 1, 1, 1,
1.11498, -0.1517287, 2.361037, 1, 1, 1, 1, 1,
1.116645, -0.659678, 2.952933, 1, 1, 1, 1, 1,
1.127829, 0.6862301, 1.15096, 1, 1, 1, 1, 1,
1.12975, 2.206741, 1.710879, 1, 1, 1, 1, 1,
1.133885, -0.4825742, 3.195976, 1, 1, 1, 1, 1,
1.142809, 0.9373819, 1.60283, 1, 1, 1, 1, 1,
1.152575, 0.3696925, 0.08697817, 1, 1, 1, 1, 1,
1.156665, -0.06641397, 2.485214, 1, 1, 1, 1, 1,
1.161987, 0.486699, -1.760969, 0, 0, 1, 1, 1,
1.173863, -0.6231065, 0.9179773, 1, 0, 0, 1, 1,
1.176726, 1.483976, -0.4200393, 1, 0, 0, 1, 1,
1.178457, 1.364607, 1.991577, 1, 0, 0, 1, 1,
1.18778, 1.247577, 0.9500591, 1, 0, 0, 1, 1,
1.190008, 0.02364228, 1.128459, 1, 0, 0, 1, 1,
1.19299, -0.1779425, 1.925309, 0, 0, 0, 1, 1,
1.195946, -1.502557, 1.958035, 0, 0, 0, 1, 1,
1.198326, -1.824965, 1.877319, 0, 0, 0, 1, 1,
1.200158, 0.238238, 2.636398, 0, 0, 0, 1, 1,
1.203571, 0.1461999, 1.12312, 0, 0, 0, 1, 1,
1.211611, 0.6141205, 1.146864, 0, 0, 0, 1, 1,
1.212568, -1.214591, 2.313267, 0, 0, 0, 1, 1,
1.217556, 0.1587487, 0.5659274, 1, 1, 1, 1, 1,
1.219286, -0.6659413, 3.748468, 1, 1, 1, 1, 1,
1.223201, -0.1279589, -0.5723892, 1, 1, 1, 1, 1,
1.232116, -0.40448, 3.336059, 1, 1, 1, 1, 1,
1.234046, -1.198725, 2.965744, 1, 1, 1, 1, 1,
1.248371, 0.6549094, 0.7731824, 1, 1, 1, 1, 1,
1.250279, 0.2097679, 0.389474, 1, 1, 1, 1, 1,
1.254525, 1.721215, -0.2738815, 1, 1, 1, 1, 1,
1.262383, 0.207487, 2.202573, 1, 1, 1, 1, 1,
1.273374, 0.495663, 0.1224758, 1, 1, 1, 1, 1,
1.273478, -0.6546389, 1.3364, 1, 1, 1, 1, 1,
1.273559, -1.029485, 1.88399, 1, 1, 1, 1, 1,
1.278719, -0.0344684, 0.8351858, 1, 1, 1, 1, 1,
1.280348, 0.7138428, 2.986084, 1, 1, 1, 1, 1,
1.283882, 0.6371928, 2.743293, 1, 1, 1, 1, 1,
1.286047, -0.864687, 2.542317, 0, 0, 1, 1, 1,
1.289029, -0.1521435, 2.121348, 1, 0, 0, 1, 1,
1.291453, 0.5629998, 1.082959, 1, 0, 0, 1, 1,
1.292524, 0.372323, -0.148091, 1, 0, 0, 1, 1,
1.294582, 1.190446, 0.400479, 1, 0, 0, 1, 1,
1.296282, -0.2032576, 2.522674, 1, 0, 0, 1, 1,
1.302037, 2.089964, 0.5768386, 0, 0, 0, 1, 1,
1.302735, 0.7114676, 3.26475, 0, 0, 0, 1, 1,
1.309618, -0.991617, 1.985174, 0, 0, 0, 1, 1,
1.327804, 1.274264, 2.038178, 0, 0, 0, 1, 1,
1.328622, -0.9717371, 3.300641, 0, 0, 0, 1, 1,
1.328835, -2.272055, 1.400676, 0, 0, 0, 1, 1,
1.344721, 0.9679133, 3.007923, 0, 0, 0, 1, 1,
1.348789, 0.7916726, 0.3005373, 1, 1, 1, 1, 1,
1.350427, 1.701116, 1.518749, 1, 1, 1, 1, 1,
1.353948, 0.975897, 0.8217366, 1, 1, 1, 1, 1,
1.371802, -1.271993, 4.524271, 1, 1, 1, 1, 1,
1.375829, -1.067694, 1.69571, 1, 1, 1, 1, 1,
1.384992, -0.4343742, 2.803834, 1, 1, 1, 1, 1,
1.386429, 0.9674609, -0.2772509, 1, 1, 1, 1, 1,
1.387469, -0.3363581, 1.102275, 1, 1, 1, 1, 1,
1.390723, -0.2956226, 2.888947, 1, 1, 1, 1, 1,
1.392004, -1.09624, 1.930457, 1, 1, 1, 1, 1,
1.393132, 0.9900324, 1.251472, 1, 1, 1, 1, 1,
1.393827, -0.207877, 3.185555, 1, 1, 1, 1, 1,
1.394641, -1.357027, 2.867064, 1, 1, 1, 1, 1,
1.410594, 1.155248, 0.2316422, 1, 1, 1, 1, 1,
1.420665, 0.02736907, 2.21482, 1, 1, 1, 1, 1,
1.427354, -0.08218855, 1.858955, 0, 0, 1, 1, 1,
1.439348, -1.749081, 2.553272, 1, 0, 0, 1, 1,
1.449011, -0.930986, 3.85618, 1, 0, 0, 1, 1,
1.453554, 0.6615129, 1.903848, 1, 0, 0, 1, 1,
1.455528, -1.382252, 2.752628, 1, 0, 0, 1, 1,
1.476705, 0.08132996, 1.102552, 1, 0, 0, 1, 1,
1.492557, 0.8708185, 1.010337, 0, 0, 0, 1, 1,
1.498087, 0.9249797, 0.1213775, 0, 0, 0, 1, 1,
1.498808, 0.8308349, 0.7998159, 0, 0, 0, 1, 1,
1.509783, 0.7298399, 0.5606866, 0, 0, 0, 1, 1,
1.514255, -0.7591385, 0.1815403, 0, 0, 0, 1, 1,
1.516971, 1.019941, 1.205122, 0, 0, 0, 1, 1,
1.519151, 0.1089356, 2.091737, 0, 0, 0, 1, 1,
1.529664, 1.446398, 0.7493464, 1, 1, 1, 1, 1,
1.541276, -0.1590459, 2.034378, 1, 1, 1, 1, 1,
1.544085, 0.159413, 2.255707, 1, 1, 1, 1, 1,
1.551085, -1.279972, 2.405247, 1, 1, 1, 1, 1,
1.553972, -0.2038382, 3.006181, 1, 1, 1, 1, 1,
1.554788, 0.2937289, 0.7849686, 1, 1, 1, 1, 1,
1.556002, 0.712694, -1.497876, 1, 1, 1, 1, 1,
1.567615, -1.231238, 3.069351, 1, 1, 1, 1, 1,
1.570319, -0.3146963, 3.321096, 1, 1, 1, 1, 1,
1.598706, -1.39727, 2.836457, 1, 1, 1, 1, 1,
1.600096, -1.240659, 1.56089, 1, 1, 1, 1, 1,
1.631265, -1.10999, 1.780475, 1, 1, 1, 1, 1,
1.633012, -0.4912632, 1.15444, 1, 1, 1, 1, 1,
1.649203, -0.7971908, 1.737602, 1, 1, 1, 1, 1,
1.649472, 2.147788, 0.3455472, 1, 1, 1, 1, 1,
1.661046, 0.9249509, 4.516741, 0, 0, 1, 1, 1,
1.674262, -0.686987, 2.763182, 1, 0, 0, 1, 1,
1.675435, -0.0673675, 0.7245493, 1, 0, 0, 1, 1,
1.684111, 0.7826907, 2.242532, 1, 0, 0, 1, 1,
1.684752, -0.6439451, 2.687367, 1, 0, 0, 1, 1,
1.705555, 0.02636692, 3.496778, 1, 0, 0, 1, 1,
1.71241, -0.7800456, 3.608182, 0, 0, 0, 1, 1,
1.739177, 1.170912, 0.5002359, 0, 0, 0, 1, 1,
1.740495, -0.1333478, 1.430021, 0, 0, 0, 1, 1,
1.751227, -0.9827686, 3.453888, 0, 0, 0, 1, 1,
1.771237, -0.0899096, 1.928768, 0, 0, 0, 1, 1,
1.772901, 1.785191, 0.7510768, 0, 0, 0, 1, 1,
1.776209, -1.800417, 3.025777, 0, 0, 0, 1, 1,
1.796213, 1.074026, 1.241542, 1, 1, 1, 1, 1,
1.813108, -1.043929, 2.683848, 1, 1, 1, 1, 1,
1.821155, -1.531413, 3.13283, 1, 1, 1, 1, 1,
1.82145, 1.062941, -0.3590743, 1, 1, 1, 1, 1,
1.846991, 2.972042, 0.6161204, 1, 1, 1, 1, 1,
1.88123, 1.025497, 1.327004, 1, 1, 1, 1, 1,
1.882653, -0.9151586, 3.634121, 1, 1, 1, 1, 1,
1.901165, 0.0836788, 0.4945656, 1, 1, 1, 1, 1,
1.944517, -0.1305342, 0.5104192, 1, 1, 1, 1, 1,
1.947806, 0.8374662, 1.879158, 1, 1, 1, 1, 1,
1.979157, -0.325487, 1.680735, 1, 1, 1, 1, 1,
1.986804, -0.4744695, 2.030029, 1, 1, 1, 1, 1,
2.008965, 0.540923, -1.057296, 1, 1, 1, 1, 1,
2.050286, 0.4250908, 1.150829, 1, 1, 1, 1, 1,
2.152836, -0.7207981, 1.787525, 1, 1, 1, 1, 1,
2.168255, -0.3319383, 0.7964484, 0, 0, 1, 1, 1,
2.175446, 1.374087, 1.796083, 1, 0, 0, 1, 1,
2.184765, -0.3729509, 2.614979, 1, 0, 0, 1, 1,
2.234433, 0.8463913, 2.808325, 1, 0, 0, 1, 1,
2.284731, 0.4183432, 1.21199, 1, 0, 0, 1, 1,
2.312397, -0.5429144, 2.497221, 1, 0, 0, 1, 1,
2.31738, -0.9028066, 0.6141905, 0, 0, 0, 1, 1,
2.334435, 0.2395868, 1.783846, 0, 0, 0, 1, 1,
2.344725, 0.01052481, 1.15481, 0, 0, 0, 1, 1,
2.352811, 0.2539713, 2.650817, 0, 0, 0, 1, 1,
2.366974, 0.3101221, 1.750373, 0, 0, 0, 1, 1,
2.372449, 0.3887565, -0.05930572, 0, 0, 0, 1, 1,
2.385347, -0.3752074, 2.004737, 0, 0, 0, 1, 1,
2.420605, -1.021729, 1.815917, 1, 1, 1, 1, 1,
2.591272, -0.08129873, 2.268605, 1, 1, 1, 1, 1,
2.62423, 0.5127241, 1.526981, 1, 1, 1, 1, 1,
2.670053, -0.3726147, 0.8221008, 1, 1, 1, 1, 1,
2.692288, 0.04405505, 2.678327, 1, 1, 1, 1, 1,
2.843386, -0.9297196, 1.814456, 1, 1, 1, 1, 1,
3.994428, 0.1778584, 1.674217, 1, 1, 1, 1, 1
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
var radius = 10.17356;
var distance = 35.7342;
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
mvMatrix.translate( -0.3124378, 0.1896617, -0.6833184 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.7342);
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
