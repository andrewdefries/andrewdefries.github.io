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
-3.136712, -1.597162, -1.754847, 1, 0, 0, 1,
-3.045201, -0.08547117, -0.3458576, 1, 0.007843138, 0, 1,
-2.758129, -0.5594411, -1.905857, 1, 0.01176471, 0, 1,
-2.707727, -0.06501707, -2.549834, 1, 0.01960784, 0, 1,
-2.657429, -0.1897202, 1.394273, 1, 0.02352941, 0, 1,
-2.618312, 0.5755699, -0.9210982, 1, 0.03137255, 0, 1,
-2.597312, 1.865984, 0.07055446, 1, 0.03529412, 0, 1,
-2.552451, 0.7877091, -0.1257558, 1, 0.04313726, 0, 1,
-2.521371, 0.02927454, -1.119674, 1, 0.04705882, 0, 1,
-2.505757, 0.2409076, -1.764421, 1, 0.05490196, 0, 1,
-2.433875, -0.7091799, -3.833558, 1, 0.05882353, 0, 1,
-2.405256, 0.4180001, 0.5800703, 1, 0.06666667, 0, 1,
-2.387466, -0.4452368, -0.5599732, 1, 0.07058824, 0, 1,
-2.360284, -0.02095135, -1.768603, 1, 0.07843138, 0, 1,
-2.325819, -0.290003, -1.836789, 1, 0.08235294, 0, 1,
-2.322175, -0.7972052, -1.616862, 1, 0.09019608, 0, 1,
-2.303449, -0.7228796, -1.804911, 1, 0.09411765, 0, 1,
-2.289602, -1.666515, -2.375931, 1, 0.1019608, 0, 1,
-2.218914, 0.02468468, -3.505096, 1, 0.1098039, 0, 1,
-2.204737, -1.655656, -2.864651, 1, 0.1137255, 0, 1,
-2.188048, -0.1663277, -2.240498, 1, 0.1215686, 0, 1,
-2.164389, -1.198037, -2.056036, 1, 0.1254902, 0, 1,
-2.142597, -0.09067295, -0.9066057, 1, 0.1333333, 0, 1,
-2.115583, -1.448659, -1.281883, 1, 0.1372549, 0, 1,
-2.112927, 0.3199208, -1.840003, 1, 0.145098, 0, 1,
-2.109884, -1.184458, -3.692946, 1, 0.1490196, 0, 1,
-2.103866, 0.2278561, -1.633752, 1, 0.1568628, 0, 1,
-2.101613, 1.811062, -2.212089, 1, 0.1607843, 0, 1,
-2.098735, -0.6143564, -1.125552, 1, 0.1686275, 0, 1,
-2.091711, 1.124719, -0.9427658, 1, 0.172549, 0, 1,
-2.056634, 1.420558, -1.71076, 1, 0.1803922, 0, 1,
-2.028487, -1.889537, -4.368759, 1, 0.1843137, 0, 1,
-2.020016, 1.449527, -0.3551916, 1, 0.1921569, 0, 1,
-2.000554, 0.1059587, -1.226973, 1, 0.1960784, 0, 1,
-1.993948, 0.3939656, -1.264126, 1, 0.2039216, 0, 1,
-1.984145, 0.01555318, -0.434613, 1, 0.2117647, 0, 1,
-1.972706, -2.447671, -0.2882167, 1, 0.2156863, 0, 1,
-1.933429, -0.9619502, -2.24715, 1, 0.2235294, 0, 1,
-1.913992, -1.234013, -0.8890697, 1, 0.227451, 0, 1,
-1.908625, -0.3444941, -0.5704493, 1, 0.2352941, 0, 1,
-1.903903, -1.533244, -0.8026645, 1, 0.2392157, 0, 1,
-1.883312, 0.9272658, -2.082176, 1, 0.2470588, 0, 1,
-1.868263, -0.6386991, -2.043952, 1, 0.2509804, 0, 1,
-1.865165, -1.358059, -1.173318, 1, 0.2588235, 0, 1,
-1.835634, 0.3546017, -0.4172462, 1, 0.2627451, 0, 1,
-1.804331, 0.5354021, -0.3488452, 1, 0.2705882, 0, 1,
-1.796722, 1.65152, -1.706611, 1, 0.2745098, 0, 1,
-1.786124, -2.446844, -1.920487, 1, 0.282353, 0, 1,
-1.783576, 1.054568, -1.124549, 1, 0.2862745, 0, 1,
-1.77873, -0.3904026, 0.3398243, 1, 0.2941177, 0, 1,
-1.763775, -0.4762136, -1.313923, 1, 0.3019608, 0, 1,
-1.738001, -0.4969001, -0.9669905, 1, 0.3058824, 0, 1,
-1.726799, -0.600055, -0.5022861, 1, 0.3137255, 0, 1,
-1.702677, 0.0238632, -4.202222, 1, 0.3176471, 0, 1,
-1.687138, 1.399191, -0.9820676, 1, 0.3254902, 0, 1,
-1.685619, 0.3069202, -0.3165773, 1, 0.3294118, 0, 1,
-1.683746, 0.2144251, -1.928196, 1, 0.3372549, 0, 1,
-1.676428, -0.3744616, -1.617311, 1, 0.3411765, 0, 1,
-1.662774, 1.222972, -0.5338203, 1, 0.3490196, 0, 1,
-1.661356, -1.133493, -2.966108, 1, 0.3529412, 0, 1,
-1.658412, -1.473176, -2.011386, 1, 0.3607843, 0, 1,
-1.645704, -0.1974318, -1.7513, 1, 0.3647059, 0, 1,
-1.64223, -0.5956712, -1.961191, 1, 0.372549, 0, 1,
-1.61833, 1.659173, 1.121661, 1, 0.3764706, 0, 1,
-1.610809, -1.786193, -1.754155, 1, 0.3843137, 0, 1,
-1.602694, 0.8919061, -0.6794018, 1, 0.3882353, 0, 1,
-1.602109, -1.315619, -2.100523, 1, 0.3960784, 0, 1,
-1.595466, 1.180751, -2.250565, 1, 0.4039216, 0, 1,
-1.587007, 2.034231, 0.119378, 1, 0.4078431, 0, 1,
-1.585168, 1.255195, 0.8543077, 1, 0.4156863, 0, 1,
-1.582444, 1.347074, -1.954845, 1, 0.4196078, 0, 1,
-1.579748, -0.4276821, -1.2988, 1, 0.427451, 0, 1,
-1.56316, 0.1231163, -1.861695, 1, 0.4313726, 0, 1,
-1.552525, 0.1562955, -2.500269, 1, 0.4392157, 0, 1,
-1.514225, 0.5673572, -2.010888, 1, 0.4431373, 0, 1,
-1.512997, -0.8565931, -2.990818, 1, 0.4509804, 0, 1,
-1.512655, 0.660482, -1.353559, 1, 0.454902, 0, 1,
-1.498224, 0.470636, -1.619367, 1, 0.4627451, 0, 1,
-1.496174, -1.774513, -3.029689, 1, 0.4666667, 0, 1,
-1.494475, 0.6937816, -1.302707, 1, 0.4745098, 0, 1,
-1.483136, -0.7482906, -2.221742, 1, 0.4784314, 0, 1,
-1.452835, -0.6643482, -0.2485316, 1, 0.4862745, 0, 1,
-1.44441, -0.9441541, -2.598862, 1, 0.4901961, 0, 1,
-1.426445, 1.384257, 0.4966509, 1, 0.4980392, 0, 1,
-1.418807, -2.388773, -2.782771, 1, 0.5058824, 0, 1,
-1.417607, -0.2696541, -1.096298, 1, 0.509804, 0, 1,
-1.412368, -1.324686, -3.595054, 1, 0.5176471, 0, 1,
-1.39965, -0.3457215, -1.3151, 1, 0.5215687, 0, 1,
-1.385266, -1.513603, -2.288771, 1, 0.5294118, 0, 1,
-1.368277, -0.06077728, -2.473738, 1, 0.5333334, 0, 1,
-1.365785, 0.4823441, -0.8275097, 1, 0.5411765, 0, 1,
-1.36075, 1.083517, -1.10812, 1, 0.5450981, 0, 1,
-1.338336, -1.396104, -1.945109, 1, 0.5529412, 0, 1,
-1.329837, -1.235368, -0.8594463, 1, 0.5568628, 0, 1,
-1.329221, -0.3289625, -0.5843471, 1, 0.5647059, 0, 1,
-1.323216, 0.538124, -1.876677, 1, 0.5686275, 0, 1,
-1.322725, -0.2008514, -2.322638, 1, 0.5764706, 0, 1,
-1.313585, -0.3836614, -0.7161519, 1, 0.5803922, 0, 1,
-1.30718, 2.22318, -1.896992, 1, 0.5882353, 0, 1,
-1.293408, 0.6421745, -0.9362598, 1, 0.5921569, 0, 1,
-1.29005, 0.9234509, -1.627007, 1, 0.6, 0, 1,
-1.285739, 0.6487873, -0.2469864, 1, 0.6078432, 0, 1,
-1.268872, 0.3734904, -1.983863, 1, 0.6117647, 0, 1,
-1.261038, 0.02547089, -3.108008, 1, 0.6196079, 0, 1,
-1.260088, -0.2158465, -0.9852074, 1, 0.6235294, 0, 1,
-1.255997, -1.761047, -3.101506, 1, 0.6313726, 0, 1,
-1.253786, 2.627112, -2.349168, 1, 0.6352941, 0, 1,
-1.225781, -2.386135, -4.563291, 1, 0.6431373, 0, 1,
-1.223203, -0.3504331, -1.586909, 1, 0.6470588, 0, 1,
-1.220674, -0.8592033, -1.314748, 1, 0.654902, 0, 1,
-1.219779, -0.5675338, -1.211918, 1, 0.6588235, 0, 1,
-1.214583, -0.2190242, -1.795514, 1, 0.6666667, 0, 1,
-1.214311, -0.9019893, -3.42242, 1, 0.6705883, 0, 1,
-1.21342, -1.39802, -2.269781, 1, 0.6784314, 0, 1,
-1.208824, 0.5123698, -1.496405, 1, 0.682353, 0, 1,
-1.206546, -0.5029286, -2.357336, 1, 0.6901961, 0, 1,
-1.204417, 0.8327119, -1.211555, 1, 0.6941177, 0, 1,
-1.20268, -1.624578, -1.696965, 1, 0.7019608, 0, 1,
-1.200917, 0.1563477, -0.5774878, 1, 0.7098039, 0, 1,
-1.189525, 0.8954227, -0.7016319, 1, 0.7137255, 0, 1,
-1.185378, 1.821005, 0.05621514, 1, 0.7215686, 0, 1,
-1.177115, 1.798469, -0.1108583, 1, 0.7254902, 0, 1,
-1.172153, -0.650507, -2.778179, 1, 0.7333333, 0, 1,
-1.168304, 0.391398, -1.255607, 1, 0.7372549, 0, 1,
-1.164132, 0.3409338, -0.3763941, 1, 0.7450981, 0, 1,
-1.161463, -0.3195643, -1.803345, 1, 0.7490196, 0, 1,
-1.154454, -0.6166348, -2.160051, 1, 0.7568628, 0, 1,
-1.149536, 0.4133826, -1.223894, 1, 0.7607843, 0, 1,
-1.149007, 0.7063137, -0.08120655, 1, 0.7686275, 0, 1,
-1.148598, 0.8290212, -1.334013, 1, 0.772549, 0, 1,
-1.143592, 0.7494537, -0.8355789, 1, 0.7803922, 0, 1,
-1.138757, -0.2286114, -0.1699144, 1, 0.7843137, 0, 1,
-1.136973, -1.405274, -0.6108501, 1, 0.7921569, 0, 1,
-1.130868, 0.6789353, 0.2748747, 1, 0.7960784, 0, 1,
-1.130402, 0.6434113, -1.675672, 1, 0.8039216, 0, 1,
-1.130277, 1.698385, -1.719651, 1, 0.8117647, 0, 1,
-1.128721, 0.4811526, -1.53109, 1, 0.8156863, 0, 1,
-1.127704, 0.7206233, -0.1281237, 1, 0.8235294, 0, 1,
-1.127581, 0.8720205, -1.739348, 1, 0.827451, 0, 1,
-1.127478, 0.7585469, -1.454329, 1, 0.8352941, 0, 1,
-1.12353, -1.583319, -2.162493, 1, 0.8392157, 0, 1,
-1.098826, -0.3321792, -1.512694, 1, 0.8470588, 0, 1,
-1.096193, 1.452975, -0.3602424, 1, 0.8509804, 0, 1,
-1.093802, -0.6249319, -3.180404, 1, 0.8588235, 0, 1,
-1.089682, -0.5182061, -1.316242, 1, 0.8627451, 0, 1,
-1.087806, -0.4830046, -2.2642, 1, 0.8705882, 0, 1,
-1.087156, -0.1136635, -2.441016, 1, 0.8745098, 0, 1,
-1.082194, 1.298164, -1.793681, 1, 0.8823529, 0, 1,
-1.065592, -1.360936, -3.369219, 1, 0.8862745, 0, 1,
-1.06296, -0.9068301, -3.744302, 1, 0.8941177, 0, 1,
-1.055748, -0.0798218, -0.9446446, 1, 0.8980392, 0, 1,
-1.055456, 0.3094097, -1.877125, 1, 0.9058824, 0, 1,
-1.051635, -0.3389828, -2.138281, 1, 0.9137255, 0, 1,
-1.050976, -0.1785024, -0.6155522, 1, 0.9176471, 0, 1,
-1.039008, -0.4231139, -1.06531, 1, 0.9254902, 0, 1,
-1.027046, -0.6950171, -1.39495, 1, 0.9294118, 0, 1,
-1.021699, 0.03115534, -1.866456, 1, 0.9372549, 0, 1,
-1.020943, -1.320842, -3.748338, 1, 0.9411765, 0, 1,
-1.017369, -1.362781, -2.246242, 1, 0.9490196, 0, 1,
-1.016744, -0.8690143, -3.258749, 1, 0.9529412, 0, 1,
-1.00933, -0.1337939, -2.703725, 1, 0.9607843, 0, 1,
-1.003238, 0.02704791, -1.845168, 1, 0.9647059, 0, 1,
-0.9956412, -0.07395283, -0.7864391, 1, 0.972549, 0, 1,
-0.992673, 1.420613, 1.210761, 1, 0.9764706, 0, 1,
-0.9898205, -0.6392095, -1.94269, 1, 0.9843137, 0, 1,
-0.989265, -0.2107754, -3.005607, 1, 0.9882353, 0, 1,
-0.9852913, 0.5000247, 0.6068663, 1, 0.9960784, 0, 1,
-0.9800272, 0.8688213, -2.099044, 0.9960784, 1, 0, 1,
-0.9777172, -1.330539, -3.215339, 0.9921569, 1, 0, 1,
-0.9770817, -0.3457864, -1.899257, 0.9843137, 1, 0, 1,
-0.963703, -0.02367412, -2.626442, 0.9803922, 1, 0, 1,
-0.9631499, -0.5388414, -2.176885, 0.972549, 1, 0, 1,
-0.9606056, -0.2333388, -1.622866, 0.9686275, 1, 0, 1,
-0.9594607, 1.396648, -1.110412, 0.9607843, 1, 0, 1,
-0.9573574, -1.009165, -2.431465, 0.9568627, 1, 0, 1,
-0.9418846, -1.270422, -3.345038, 0.9490196, 1, 0, 1,
-0.9294615, -1.251804, 1.155891, 0.945098, 1, 0, 1,
-0.9273238, 1.490316, 0.290585, 0.9372549, 1, 0, 1,
-0.9156232, 0.2347277, -2.228009, 0.9333333, 1, 0, 1,
-0.9111594, -0.1770095, -3.067608, 0.9254902, 1, 0, 1,
-0.9054499, 0.6345182, -3.539848, 0.9215686, 1, 0, 1,
-0.8988681, -1.367163, -0.939892, 0.9137255, 1, 0, 1,
-0.8968322, -0.3071746, -2.001761, 0.9098039, 1, 0, 1,
-0.8823546, -0.06725414, -2.45734, 0.9019608, 1, 0, 1,
-0.8785052, -0.3406293, -2.478377, 0.8941177, 1, 0, 1,
-0.8729286, 0.1000833, 0.08367927, 0.8901961, 1, 0, 1,
-0.871076, 0.02339423, -0.1139499, 0.8823529, 1, 0, 1,
-0.8671899, -0.1636239, -1.695158, 0.8784314, 1, 0, 1,
-0.8610562, 1.545668, -0.5034723, 0.8705882, 1, 0, 1,
-0.8589363, 0.4899292, -0.9496555, 0.8666667, 1, 0, 1,
-0.8543759, -0.1647063, 0.08953518, 0.8588235, 1, 0, 1,
-0.8525079, -0.4562374, -0.8245956, 0.854902, 1, 0, 1,
-0.8496122, 0.4446877, -2.274714, 0.8470588, 1, 0, 1,
-0.848115, -1.503181, -1.690286, 0.8431373, 1, 0, 1,
-0.8450585, -0.4419696, -1.737195, 0.8352941, 1, 0, 1,
-0.8421395, 0.9292051, 0.5516771, 0.8313726, 1, 0, 1,
-0.8418564, 0.4579877, -0.4621278, 0.8235294, 1, 0, 1,
-0.8335093, -0.1429295, -0.6649846, 0.8196079, 1, 0, 1,
-0.8311019, 0.3574974, -0.8753722, 0.8117647, 1, 0, 1,
-0.8310614, -1.238874, -3.317448, 0.8078431, 1, 0, 1,
-0.8235984, 1.541359, -0.2128365, 0.8, 1, 0, 1,
-0.8226113, 1.787647, 0.01164182, 0.7921569, 1, 0, 1,
-0.8196747, 0.4889428, 0.3521653, 0.7882353, 1, 0, 1,
-0.8173661, -0.8403792, -0.6825702, 0.7803922, 1, 0, 1,
-0.8166819, -0.07974873, -1.910185, 0.7764706, 1, 0, 1,
-0.8134753, 0.7813922, -0.3359658, 0.7686275, 1, 0, 1,
-0.8126684, 1.30072, -0.1856139, 0.7647059, 1, 0, 1,
-0.8061948, -1.019837, -3.745252, 0.7568628, 1, 0, 1,
-0.8027515, 0.3652323, -0.4186725, 0.7529412, 1, 0, 1,
-0.8022252, 1.673169, 1.110067, 0.7450981, 1, 0, 1,
-0.796145, -0.5684237, -1.688737, 0.7411765, 1, 0, 1,
-0.7945555, 0.563473, -2.102894, 0.7333333, 1, 0, 1,
-0.7895422, -0.5796137, -1.367455, 0.7294118, 1, 0, 1,
-0.7861775, -1.019139, -3.235394, 0.7215686, 1, 0, 1,
-0.7861506, -1.541271, -2.971025, 0.7176471, 1, 0, 1,
-0.7771552, -0.4317528, -3.200772, 0.7098039, 1, 0, 1,
-0.7738454, 0.4844362, 1.099708, 0.7058824, 1, 0, 1,
-0.7715415, -0.350043, -0.6812413, 0.6980392, 1, 0, 1,
-0.7712234, -0.7709095, -2.159974, 0.6901961, 1, 0, 1,
-0.7707505, -1.067892, -2.651263, 0.6862745, 1, 0, 1,
-0.7702338, 0.3459359, -0.8880094, 0.6784314, 1, 0, 1,
-0.76406, 0.4805144, -0.8527471, 0.6745098, 1, 0, 1,
-0.7586917, 0.7847, -0.8510386, 0.6666667, 1, 0, 1,
-0.7541354, -0.8607066, -3.667018, 0.6627451, 1, 0, 1,
-0.7529028, 0.6405199, -0.3518102, 0.654902, 1, 0, 1,
-0.750344, -0.607702, -1.820486, 0.6509804, 1, 0, 1,
-0.7484546, 0.5980682, -1.436998, 0.6431373, 1, 0, 1,
-0.7477118, -0.3492843, -2.711962, 0.6392157, 1, 0, 1,
-0.7439592, -0.09801172, -0.5944235, 0.6313726, 1, 0, 1,
-0.7429792, 0.2135586, -0.5573842, 0.627451, 1, 0, 1,
-0.7359562, 0.764383, 1.033107, 0.6196079, 1, 0, 1,
-0.7358425, -1.109261, -2.808345, 0.6156863, 1, 0, 1,
-0.7313294, -0.2755697, -3.014593, 0.6078432, 1, 0, 1,
-0.7246735, -0.3881502, -1.908123, 0.6039216, 1, 0, 1,
-0.72198, 0.223639, -2.065533, 0.5960785, 1, 0, 1,
-0.7054232, 0.8025615, -2.165541, 0.5882353, 1, 0, 1,
-0.7042589, -0.3873889, -1.385716, 0.5843138, 1, 0, 1,
-0.7035259, 0.766001, -0.3145759, 0.5764706, 1, 0, 1,
-0.7031075, 0.2283091, -0.4851636, 0.572549, 1, 0, 1,
-0.7028964, -0.3646779, -3.807262, 0.5647059, 1, 0, 1,
-0.7019354, 1.926142, 0.7033849, 0.5607843, 1, 0, 1,
-0.695428, -0.7556436, -2.214791, 0.5529412, 1, 0, 1,
-0.6916823, -0.6825987, -2.265072, 0.5490196, 1, 0, 1,
-0.6911833, -1.833649, -1.955417, 0.5411765, 1, 0, 1,
-0.6910506, 0.4541423, -2.207641, 0.5372549, 1, 0, 1,
-0.6858378, -0.576804, -2.974416, 0.5294118, 1, 0, 1,
-0.6841967, 0.5974552, -1.715419, 0.5254902, 1, 0, 1,
-0.6813053, 1.017614, -1.133478, 0.5176471, 1, 0, 1,
-0.6778257, 0.7140667, -0.5652754, 0.5137255, 1, 0, 1,
-0.6740357, -1.387942, 0.07797872, 0.5058824, 1, 0, 1,
-0.6677021, -1.086336, -3.078911, 0.5019608, 1, 0, 1,
-0.6661495, -0.9820518, -2.531528, 0.4941176, 1, 0, 1,
-0.6646308, 0.1445296, -3.614906, 0.4862745, 1, 0, 1,
-0.6606224, 1.245188, -1.016803, 0.4823529, 1, 0, 1,
-0.6576326, 0.1035246, 0.39533, 0.4745098, 1, 0, 1,
-0.6509649, -0.03842024, -0.2898664, 0.4705882, 1, 0, 1,
-0.6500905, -0.2090918, -1.295739, 0.4627451, 1, 0, 1,
-0.6450438, 0.5984904, 1.000726, 0.4588235, 1, 0, 1,
-0.6384841, 0.4728535, -0.8510784, 0.4509804, 1, 0, 1,
-0.637311, -0.2791388, -2.105967, 0.4470588, 1, 0, 1,
-0.6347473, -0.09371188, -0.2476942, 0.4392157, 1, 0, 1,
-0.6310911, -0.7914032, -2.541175, 0.4352941, 1, 0, 1,
-0.6299474, -1.832131, -3.415711, 0.427451, 1, 0, 1,
-0.6225872, 1.08984, -0.5895423, 0.4235294, 1, 0, 1,
-0.6213719, 1.629118, -0.3680441, 0.4156863, 1, 0, 1,
-0.6203177, 0.3831831, -1.780354, 0.4117647, 1, 0, 1,
-0.6194665, -1.082354, -4.952929, 0.4039216, 1, 0, 1,
-0.6149744, 0.3872002, -0.1078451, 0.3960784, 1, 0, 1,
-0.6148921, 1.257858, 0.3661066, 0.3921569, 1, 0, 1,
-0.6125231, 0.4381627, -0.3575965, 0.3843137, 1, 0, 1,
-0.6116543, -0.08521535, -1.821081, 0.3803922, 1, 0, 1,
-0.6023519, -0.6899859, -2.770324, 0.372549, 1, 0, 1,
-0.6002149, -0.07589786, -3.544418, 0.3686275, 1, 0, 1,
-0.5994843, 0.2364196, -1.923532, 0.3607843, 1, 0, 1,
-0.5959888, 1.819212, -0.6881037, 0.3568628, 1, 0, 1,
-0.5909792, -0.1317985, -2.272913, 0.3490196, 1, 0, 1,
-0.5870934, 0.397444, 0.06786536, 0.345098, 1, 0, 1,
-0.5870216, -0.1324464, -0.474357, 0.3372549, 1, 0, 1,
-0.5867533, 0.448015, -0.3936614, 0.3333333, 1, 0, 1,
-0.5848707, -0.4233439, -0.5422333, 0.3254902, 1, 0, 1,
-0.5834422, -0.7457527, -4.230705, 0.3215686, 1, 0, 1,
-0.5814019, -0.522203, -2.773617, 0.3137255, 1, 0, 1,
-0.5790231, 0.1336766, -0.5389439, 0.3098039, 1, 0, 1,
-0.5778691, -1.564941, -3.626661, 0.3019608, 1, 0, 1,
-0.5743359, 0.4515338, -1.727651, 0.2941177, 1, 0, 1,
-0.5728779, 0.9403761, -0.8195596, 0.2901961, 1, 0, 1,
-0.5714949, -0.6963708, -3.581557, 0.282353, 1, 0, 1,
-0.5644943, -0.03102788, -1.887728, 0.2784314, 1, 0, 1,
-0.5633925, -0.742029, -2.56542, 0.2705882, 1, 0, 1,
-0.5631596, 0.4140649, -1.242412, 0.2666667, 1, 0, 1,
-0.5542957, -2.13299, -3.391336, 0.2588235, 1, 0, 1,
-0.5540411, 0.7173893, -0.8166084, 0.254902, 1, 0, 1,
-0.5447341, 0.6880584, -1.586945, 0.2470588, 1, 0, 1,
-0.543698, -1.320334, -4.064656, 0.2431373, 1, 0, 1,
-0.5385991, -0.8905488, -3.675365, 0.2352941, 1, 0, 1,
-0.537425, -0.5571364, -2.722468, 0.2313726, 1, 0, 1,
-0.5310688, 0.4023865, -3.639629, 0.2235294, 1, 0, 1,
-0.5259579, 0.5974156, -0.1320105, 0.2196078, 1, 0, 1,
-0.5140187, 0.3595259, -1.575415, 0.2117647, 1, 0, 1,
-0.5130784, -0.4383027, -2.921699, 0.2078431, 1, 0, 1,
-0.5093279, 0.07559641, -1.533104, 0.2, 1, 0, 1,
-0.5063115, -1.11849, -3.262921, 0.1921569, 1, 0, 1,
-0.5056944, -1.071586, -2.32539, 0.1882353, 1, 0, 1,
-0.5045457, -2.005981, -5.187996, 0.1803922, 1, 0, 1,
-0.501363, -0.2964351, -4.334277, 0.1764706, 1, 0, 1,
-0.4955163, 2.122557, -0.1466172, 0.1686275, 1, 0, 1,
-0.4933152, -0.4015441, -3.770482, 0.1647059, 1, 0, 1,
-0.4926044, -1.297856, -2.621625, 0.1568628, 1, 0, 1,
-0.4877495, 1.210962, 0.1470821, 0.1529412, 1, 0, 1,
-0.4706387, 0.6293856, -1.104846, 0.145098, 1, 0, 1,
-0.4706098, 1.226547, 0.8190603, 0.1411765, 1, 0, 1,
-0.468479, -0.3037522, -2.712607, 0.1333333, 1, 0, 1,
-0.4672098, 0.1686713, -2.223799, 0.1294118, 1, 0, 1,
-0.4633965, 0.4307658, 0.3901551, 0.1215686, 1, 0, 1,
-0.4616482, 1.474698, -0.2692468, 0.1176471, 1, 0, 1,
-0.4614939, -1.617172, -3.980847, 0.1098039, 1, 0, 1,
-0.4612781, 0.9856403, -0.3841035, 0.1058824, 1, 0, 1,
-0.4611629, -1.19214, -2.933352, 0.09803922, 1, 0, 1,
-0.460018, 2.523739, 1.324582, 0.09019608, 1, 0, 1,
-0.4591586, -0.7342076, -2.549094, 0.08627451, 1, 0, 1,
-0.4563297, 1.751156, 0.1640059, 0.07843138, 1, 0, 1,
-0.4550936, 1.367054, 0.0318016, 0.07450981, 1, 0, 1,
-0.4535051, -1.330806, -2.032269, 0.06666667, 1, 0, 1,
-0.4520584, -0.5552836, -1.744846, 0.0627451, 1, 0, 1,
-0.4517238, -0.3358073, -2.491079, 0.05490196, 1, 0, 1,
-0.4491205, -0.01230163, -1.296563, 0.05098039, 1, 0, 1,
-0.4481766, 0.08234942, -2.151977, 0.04313726, 1, 0, 1,
-0.4481051, 1.477192, -0.663124, 0.03921569, 1, 0, 1,
-0.4468699, 0.8729719, 0.4346105, 0.03137255, 1, 0, 1,
-0.4456365, -0.6047242, -2.595246, 0.02745098, 1, 0, 1,
-0.4406222, 0.2102893, -0.6411929, 0.01960784, 1, 0, 1,
-0.4389659, -1.048228, -2.482534, 0.01568628, 1, 0, 1,
-0.4383852, 0.3454488, 0.7937315, 0.007843138, 1, 0, 1,
-0.438196, 0.8692606, 0.07427863, 0.003921569, 1, 0, 1,
-0.4329626, -2.255252, -4.619676, 0, 1, 0.003921569, 1,
-0.4285446, 0.3945161, -0.4365387, 0, 1, 0.01176471, 1,
-0.4263415, -2.413642, -3.84407, 0, 1, 0.01568628, 1,
-0.4256084, 1.645361, -0.806255, 0, 1, 0.02352941, 1,
-0.4246115, 0.1698759, -1.377402, 0, 1, 0.02745098, 1,
-0.4227447, 0.1396214, -2.047571, 0, 1, 0.03529412, 1,
-0.41838, -0.8710261, -3.563319, 0, 1, 0.03921569, 1,
-0.4180071, 1.086043, 0.158637, 0, 1, 0.04705882, 1,
-0.4142549, -0.9415102, -1.711497, 0, 1, 0.05098039, 1,
-0.4125339, 0.5839577, -1.2812, 0, 1, 0.05882353, 1,
-0.4115062, 1.595968, -1.057456, 0, 1, 0.0627451, 1,
-0.4092146, 0.3798458, 0.8685381, 0, 1, 0.07058824, 1,
-0.4030846, 0.8234847, 1.90547, 0, 1, 0.07450981, 1,
-0.402433, -0.6286724, -2.756116, 0, 1, 0.08235294, 1,
-0.4017782, -0.781719, -2.791835, 0, 1, 0.08627451, 1,
-0.3916263, -1.627404, -4.086289, 0, 1, 0.09411765, 1,
-0.3912466, 0.445655, -1.088668, 0, 1, 0.1019608, 1,
-0.3905384, -0.25108, -2.436013, 0, 1, 0.1058824, 1,
-0.3902667, 0.5302014, -2.11402, 0, 1, 0.1137255, 1,
-0.3816436, 0.649501, -1.528008, 0, 1, 0.1176471, 1,
-0.3804873, 0.1525542, -1.725598, 0, 1, 0.1254902, 1,
-0.3772767, -0.1553618, -0.9601826, 0, 1, 0.1294118, 1,
-0.377259, -0.7337961, -2.583386, 0, 1, 0.1372549, 1,
-0.3727916, 1.540905, 0.5049815, 0, 1, 0.1411765, 1,
-0.3709641, 0.4510882, -0.7035874, 0, 1, 0.1490196, 1,
-0.3703805, -0.4826225, -1.910767, 0, 1, 0.1529412, 1,
-0.3687824, 0.9056067, -1.099525, 0, 1, 0.1607843, 1,
-0.3672082, 0.2227847, -0.7365032, 0, 1, 0.1647059, 1,
-0.3657898, 0.497005, -1.059398, 0, 1, 0.172549, 1,
-0.365659, -2.561132, -2.307959, 0, 1, 0.1764706, 1,
-0.3602043, 0.964759, -0.5673969, 0, 1, 0.1843137, 1,
-0.3600353, 0.3644747, -0.4893347, 0, 1, 0.1882353, 1,
-0.3599328, 0.4563536, -0.6371548, 0, 1, 0.1960784, 1,
-0.3577203, 0.04037899, -2.237146, 0, 1, 0.2039216, 1,
-0.3574786, 0.6607525, -0.7588939, 0, 1, 0.2078431, 1,
-0.3523865, -0.8758885, -3.168844, 0, 1, 0.2156863, 1,
-0.3486408, -0.6817605, -3.573381, 0, 1, 0.2196078, 1,
-0.3444896, -0.4906825, -2.050247, 0, 1, 0.227451, 1,
-0.3443803, -1.142602, -2.936074, 0, 1, 0.2313726, 1,
-0.3381893, -1.62903, -2.832563, 0, 1, 0.2392157, 1,
-0.3372102, -1.859414, -3.108332, 0, 1, 0.2431373, 1,
-0.3309467, -0.2665244, -2.721799, 0, 1, 0.2509804, 1,
-0.3292612, -0.131797, -3.075253, 0, 1, 0.254902, 1,
-0.3290383, -0.1709555, -2.429849, 0, 1, 0.2627451, 1,
-0.3259234, -0.5497734, -1.291263, 0, 1, 0.2666667, 1,
-0.3254084, 0.2599535, -0.6716704, 0, 1, 0.2745098, 1,
-0.3197683, -0.7255186, -4.151387, 0, 1, 0.2784314, 1,
-0.3172152, 0.6855608, 1.01067, 0, 1, 0.2862745, 1,
-0.3150054, -0.2158077, -3.237735, 0, 1, 0.2901961, 1,
-0.3146442, -0.03326461, -2.997378, 0, 1, 0.2980392, 1,
-0.3140351, -0.9763538, -1.797596, 0, 1, 0.3058824, 1,
-0.3075565, 0.8701603, -1.487377, 0, 1, 0.3098039, 1,
-0.3044542, 0.5153481, -0.41398, 0, 1, 0.3176471, 1,
-0.3005382, 0.3124089, -0.505789, 0, 1, 0.3215686, 1,
-0.3000487, 1.072323, -0.7452725, 0, 1, 0.3294118, 1,
-0.2982722, -0.842749, -0.4852072, 0, 1, 0.3333333, 1,
-0.2973297, 0.7841548, 0.2909676, 0, 1, 0.3411765, 1,
-0.294993, 2.042182, 0.2523573, 0, 1, 0.345098, 1,
-0.2926155, -0.0211702, -2.234967, 0, 1, 0.3529412, 1,
-0.2826636, 0.9685183, 2.094286, 0, 1, 0.3568628, 1,
-0.2781677, -1.423662, -4.73934, 0, 1, 0.3647059, 1,
-0.2778512, -0.8302437, -3.384558, 0, 1, 0.3686275, 1,
-0.2756043, -1.720904, -2.099749, 0, 1, 0.3764706, 1,
-0.2708529, -0.4630271, -2.346087, 0, 1, 0.3803922, 1,
-0.2672221, -0.2638281, -1.897969, 0, 1, 0.3882353, 1,
-0.2666669, 1.317713, 0.01744424, 0, 1, 0.3921569, 1,
-0.2665169, -0.6591656, -2.723631, 0, 1, 0.4, 1,
-0.2630686, 1.966783, 0.5755193, 0, 1, 0.4078431, 1,
-0.2614508, 0.7765224, -0.9837992, 0, 1, 0.4117647, 1,
-0.2564292, -1.280653, -3.491183, 0, 1, 0.4196078, 1,
-0.2561246, -0.3725158, -3.295864, 0, 1, 0.4235294, 1,
-0.2545106, 2.652716, 1.888602, 0, 1, 0.4313726, 1,
-0.2456795, -2.757189, -3.369427, 0, 1, 0.4352941, 1,
-0.2385254, 2.292022, -1.072161, 0, 1, 0.4431373, 1,
-0.2339071, -0.8218136, -2.089532, 0, 1, 0.4470588, 1,
-0.230053, -0.5004093, -2.481428, 0, 1, 0.454902, 1,
-0.2252459, -0.9044997, -4.953546, 0, 1, 0.4588235, 1,
-0.2201152, -0.09515791, -0.3018363, 0, 1, 0.4666667, 1,
-0.2190505, 0.776606, -1.931658, 0, 1, 0.4705882, 1,
-0.2181418, -2.231828, -1.728097, 0, 1, 0.4784314, 1,
-0.2177843, 0.1083416, -0.1803729, 0, 1, 0.4823529, 1,
-0.2155436, 0.9593582, 0.4112893, 0, 1, 0.4901961, 1,
-0.2137989, -0.9519888, -2.514827, 0, 1, 0.4941176, 1,
-0.2128875, -1.269682, -2.514179, 0, 1, 0.5019608, 1,
-0.2111992, -1.15542, -3.158637, 0, 1, 0.509804, 1,
-0.2104648, 0.2666631, -0.3393, 0, 1, 0.5137255, 1,
-0.2090156, -0.6766837, -2.34664, 0, 1, 0.5215687, 1,
-0.2081507, 0.04201354, -3.726868, 0, 1, 0.5254902, 1,
-0.2046949, -0.6898079, -1.847275, 0, 1, 0.5333334, 1,
-0.2044587, 0.6318806, -0.2320867, 0, 1, 0.5372549, 1,
-0.2016681, -0.01492266, -2.914357, 0, 1, 0.5450981, 1,
-0.1938457, -0.9107509, -2.850302, 0, 1, 0.5490196, 1,
-0.1935526, 2.412312, 0.3592647, 0, 1, 0.5568628, 1,
-0.1877896, -0.5034001, -2.868522, 0, 1, 0.5607843, 1,
-0.1873677, -0.6832345, -3.023759, 0, 1, 0.5686275, 1,
-0.1858085, 0.7943309, -1.098022, 0, 1, 0.572549, 1,
-0.1822066, -0.3465673, -1.721735, 0, 1, 0.5803922, 1,
-0.1817492, 2.074637, -1.231996, 0, 1, 0.5843138, 1,
-0.1811541, 0.9478017, -0.7396032, 0, 1, 0.5921569, 1,
-0.1795349, -0.7506983, -2.697317, 0, 1, 0.5960785, 1,
-0.1790459, -0.93389, -3.360676, 0, 1, 0.6039216, 1,
-0.1788177, 0.9154266, 0.2348927, 0, 1, 0.6117647, 1,
-0.1782735, -0.3915161, -2.500349, 0, 1, 0.6156863, 1,
-0.1754835, -0.9309978, -2.462023, 0, 1, 0.6235294, 1,
-0.1744679, 0.5291833, 1.426096, 0, 1, 0.627451, 1,
-0.1736692, -2.116865, -3.432895, 0, 1, 0.6352941, 1,
-0.1728091, -1.038731, -3.101692, 0, 1, 0.6392157, 1,
-0.170101, -0.8440693, -2.718653, 0, 1, 0.6470588, 1,
-0.1659961, -0.9935794, -4.737675, 0, 1, 0.6509804, 1,
-0.1657434, 1.214855, -0.1836389, 0, 1, 0.6588235, 1,
-0.1626535, 0.2661516, 1.262539, 0, 1, 0.6627451, 1,
-0.1610968, 0.536198, 1.125057, 0, 1, 0.6705883, 1,
-0.1604488, -0.347484, -1.868732, 0, 1, 0.6745098, 1,
-0.1535715, 0.9736074, 0.3685242, 0, 1, 0.682353, 1,
-0.15206, 0.1692144, -1.136421, 0, 1, 0.6862745, 1,
-0.1491584, -0.5862773, -2.290774, 0, 1, 0.6941177, 1,
-0.1468276, 0.4998091, -0.2981, 0, 1, 0.7019608, 1,
-0.1461712, -0.1710696, -2.521497, 0, 1, 0.7058824, 1,
-0.1433869, 0.3468423, 0.3050382, 0, 1, 0.7137255, 1,
-0.1420239, 0.5993569, -0.004610313, 0, 1, 0.7176471, 1,
-0.1412024, 0.416054, -0.1737265, 0, 1, 0.7254902, 1,
-0.1408963, 1.151025, 0.2398194, 0, 1, 0.7294118, 1,
-0.1396261, 1.656865, -0.09729021, 0, 1, 0.7372549, 1,
-0.1393062, -0.4036557, -2.60464, 0, 1, 0.7411765, 1,
-0.1369342, -0.6698838, -2.330368, 0, 1, 0.7490196, 1,
-0.1352391, -0.6042538, -3.596525, 0, 1, 0.7529412, 1,
-0.13471, 0.514465, 0.7976864, 0, 1, 0.7607843, 1,
-0.1338905, -1.377966, -4.25072, 0, 1, 0.7647059, 1,
-0.1264598, 1.28963, -0.005735036, 0, 1, 0.772549, 1,
-0.1230571, 0.8710631, 0.3028815, 0, 1, 0.7764706, 1,
-0.1195663, -0.791194, -5.372188, 0, 1, 0.7843137, 1,
-0.1187585, -0.3361024, -2.030796, 0, 1, 0.7882353, 1,
-0.1170237, -0.3020242, -2.581692, 0, 1, 0.7960784, 1,
-0.1166496, -0.267318, -3.534711, 0, 1, 0.8039216, 1,
-0.1119096, 0.04990482, -1.362381, 0, 1, 0.8078431, 1,
-0.1116205, -0.231005, -4.256069, 0, 1, 0.8156863, 1,
-0.1111759, 1.638107, -0.5455124, 0, 1, 0.8196079, 1,
-0.1100761, 1.080236, 1.309407, 0, 1, 0.827451, 1,
-0.1098415, -0.07428919, -2.533405, 0, 1, 0.8313726, 1,
-0.1082021, -0.04821688, -2.168752, 0, 1, 0.8392157, 1,
-0.1016851, 1.415706, -0.06215686, 0, 1, 0.8431373, 1,
-0.1013658, -0.8829311, -2.091408, 0, 1, 0.8509804, 1,
-0.0995825, -1.034513, -3.363675, 0, 1, 0.854902, 1,
-0.09783, 1.201713, 1.228795, 0, 1, 0.8627451, 1,
-0.09772608, -0.4251295, -3.420239, 0, 1, 0.8666667, 1,
-0.09621596, 0.09909665, -1.825251, 0, 1, 0.8745098, 1,
-0.09045511, 0.4418217, 0.3757257, 0, 1, 0.8784314, 1,
-0.089412, -0.1405409, -1.752172, 0, 1, 0.8862745, 1,
-0.08248048, -1.940836, -5.248037, 0, 1, 0.8901961, 1,
-0.08237, 0.2695202, 0.2833079, 0, 1, 0.8980392, 1,
-0.08185754, -0.6635355, -4.406636, 0, 1, 0.9058824, 1,
-0.07899377, 0.6535035, -0.9225146, 0, 1, 0.9098039, 1,
-0.07715522, -0.645784, -2.865241, 0, 1, 0.9176471, 1,
-0.076747, 0.5518267, -1.615378, 0, 1, 0.9215686, 1,
-0.0757337, 0.7686933, 0.9107716, 0, 1, 0.9294118, 1,
-0.07436363, 0.5530224, -0.03734019, 0, 1, 0.9333333, 1,
-0.07320169, -0.8764789, -3.43627, 0, 1, 0.9411765, 1,
-0.07176576, 0.1841596, 0.1789327, 0, 1, 0.945098, 1,
-0.07009597, 0.8698603, 0.8354636, 0, 1, 0.9529412, 1,
-0.06525003, -0.8589978, -1.040677, 0, 1, 0.9568627, 1,
-0.06399547, -1.141891, -2.241651, 0, 1, 0.9647059, 1,
-0.0637897, -0.1650475, -4.872284, 0, 1, 0.9686275, 1,
-0.06031208, 0.6653848, 0.2912386, 0, 1, 0.9764706, 1,
-0.05804942, -0.7805769, -2.810345, 0, 1, 0.9803922, 1,
-0.05593225, -0.981996, -2.528627, 0, 1, 0.9882353, 1,
-0.05195007, -0.01822095, -1.479935, 0, 1, 0.9921569, 1,
-0.05076697, -1.111593, -5.138653, 0, 1, 1, 1,
-0.0469548, 1.294805, 0.04202525, 0, 0.9921569, 1, 1,
-0.04488971, 1.58748, -2.198027, 0, 0.9882353, 1, 1,
-0.04473464, 1.248286, 0.7218128, 0, 0.9803922, 1, 1,
-0.04362623, -0.2748809, -1.847587, 0, 0.9764706, 1, 1,
-0.04143276, -0.2997082, -0.6644134, 0, 0.9686275, 1, 1,
-0.04038783, -2.173738, -4.007829, 0, 0.9647059, 1, 1,
-0.03133423, -1.650199, -4.272764, 0, 0.9568627, 1, 1,
-0.0294706, -0.7100783, -1.070314, 0, 0.9529412, 1, 1,
-0.0258273, 0.6848491, 0.5935447, 0, 0.945098, 1, 1,
-0.02229573, -0.2419039, -1.301791, 0, 0.9411765, 1, 1,
-0.02087791, 1.061793, -2.896224, 0, 0.9333333, 1, 1,
-0.02029911, -0.1638138, -3.440315, 0, 0.9294118, 1, 1,
-0.01906687, -0.607504, -1.354722, 0, 0.9215686, 1, 1,
-0.0152576, -1.129819, -3.03722, 0, 0.9176471, 1, 1,
-0.01050023, -0.2261728, -2.374662, 0, 0.9098039, 1, 1,
-0.008849839, 2.553053, 0.5254311, 0, 0.9058824, 1, 1,
-0.008421162, 0.8422294, -0.09078081, 0, 0.8980392, 1, 1,
-0.001807273, 0.2862092, 0.3712598, 0, 0.8901961, 1, 1,
0.001153334, 0.9690548, 0.2893578, 0, 0.8862745, 1, 1,
0.002457173, 0.1312475, -0.07127518, 0, 0.8784314, 1, 1,
0.008651784, 1.642993, 0.4305641, 0, 0.8745098, 1, 1,
0.01421393, 1.118916, 0.7308768, 0, 0.8666667, 1, 1,
0.0168775, 0.2904551, -1.285665, 0, 0.8627451, 1, 1,
0.02341907, 0.3586445, 0.9268306, 0, 0.854902, 1, 1,
0.02378688, -0.32133, 1.468962, 0, 0.8509804, 1, 1,
0.02421337, 0.1389742, -0.03947615, 0, 0.8431373, 1, 1,
0.02475565, 0.008449938, 1.654777, 0, 0.8392157, 1, 1,
0.02525304, 0.3169553, -0.4132154, 0, 0.8313726, 1, 1,
0.03108018, -0.8972011, 2.144876, 0, 0.827451, 1, 1,
0.040009, -0.8093289, 2.991617, 0, 0.8196079, 1, 1,
0.04096254, -0.6746609, 2.899193, 0, 0.8156863, 1, 1,
0.04666441, 1.173377, 0.861621, 0, 0.8078431, 1, 1,
0.04919974, -0.9995305, 1.872371, 0, 0.8039216, 1, 1,
0.05000636, 1.259981, 0.4804104, 0, 0.7960784, 1, 1,
0.05249011, 0.8839582, 0.4808143, 0, 0.7882353, 1, 1,
0.05298248, 1.2059, -0.964681, 0, 0.7843137, 1, 1,
0.05500491, -0.9243236, 3.479218, 0, 0.7764706, 1, 1,
0.0607539, 1.205674, 0.813215, 0, 0.772549, 1, 1,
0.06194526, 2.210173, -1.746123, 0, 0.7647059, 1, 1,
0.06253313, 0.3803075, -0.4151961, 0, 0.7607843, 1, 1,
0.06255242, -0.4215298, 3.907276, 0, 0.7529412, 1, 1,
0.07310746, 0.9585676, 0.295038, 0, 0.7490196, 1, 1,
0.0734274, 0.7045531, -0.9048164, 0, 0.7411765, 1, 1,
0.07921951, -0.0900921, 2.667398, 0, 0.7372549, 1, 1,
0.08266049, -1.250813, 2.797379, 0, 0.7294118, 1, 1,
0.08279321, 0.846317, -1.244452, 0, 0.7254902, 1, 1,
0.08363347, 0.6279876, -0.4221804, 0, 0.7176471, 1, 1,
0.08598778, 0.3786018, -0.2174432, 0, 0.7137255, 1, 1,
0.08870691, -0.4888593, 1.989834, 0, 0.7058824, 1, 1,
0.0905655, -1.240933, 4.367293, 0, 0.6980392, 1, 1,
0.09212489, -1.261505, 1.573414, 0, 0.6941177, 1, 1,
0.09265351, -1.902537, 2.986895, 0, 0.6862745, 1, 1,
0.09291197, 1.385036, -1.054495, 0, 0.682353, 1, 1,
0.100461, -2.139828, 4.625884, 0, 0.6745098, 1, 1,
0.1012011, 2.089514, -0.9135385, 0, 0.6705883, 1, 1,
0.1049914, -0.1138044, 2.094834, 0, 0.6627451, 1, 1,
0.1080164, -0.1239658, 2.377923, 0, 0.6588235, 1, 1,
0.1196719, -0.2301477, 1.452422, 0, 0.6509804, 1, 1,
0.122465, 1.19612, -0.9392745, 0, 0.6470588, 1, 1,
0.1249035, 1.391936, -0.6720879, 0, 0.6392157, 1, 1,
0.1251384, 1.496767, 1.140357, 0, 0.6352941, 1, 1,
0.1255597, 0.8980011, 0.2764679, 0, 0.627451, 1, 1,
0.1263726, 0.2009606, 1.61639, 0, 0.6235294, 1, 1,
0.1281469, 0.1578266, 0.8269245, 0, 0.6156863, 1, 1,
0.1284534, 1.662694, 0.3148636, 0, 0.6117647, 1, 1,
0.1299031, -0.6526341, 2.669252, 0, 0.6039216, 1, 1,
0.1328989, 1.034608, -0.5066227, 0, 0.5960785, 1, 1,
0.1372013, -1.26327, 3.467963, 0, 0.5921569, 1, 1,
0.1394285, -1.53802, 4.673551, 0, 0.5843138, 1, 1,
0.1399863, -0.09384435, 2.749943, 0, 0.5803922, 1, 1,
0.1424185, -2.804731, 1.97515, 0, 0.572549, 1, 1,
0.1498757, 0.8584908, -1.904167, 0, 0.5686275, 1, 1,
0.1503093, 0.5825553, -0.4448937, 0, 0.5607843, 1, 1,
0.1509781, 1.231664, 0.3482784, 0, 0.5568628, 1, 1,
0.1541352, 1.309245, 1.025753, 0, 0.5490196, 1, 1,
0.1546314, 0.2735357, -0.3834996, 0, 0.5450981, 1, 1,
0.1549006, -1.487378, 4.190281, 0, 0.5372549, 1, 1,
0.1557072, 1.630548, -0.7035657, 0, 0.5333334, 1, 1,
0.1567736, -1.014722, 2.146785, 0, 0.5254902, 1, 1,
0.1568078, 0.3237899, 1.297459, 0, 0.5215687, 1, 1,
0.161914, 1.021775, 1.133058, 0, 0.5137255, 1, 1,
0.1663236, 1.130623, -1.906225, 0, 0.509804, 1, 1,
0.1705031, -0.4615839, 3.124644, 0, 0.5019608, 1, 1,
0.1763614, 1.408158, 0.8042897, 0, 0.4941176, 1, 1,
0.1791503, -0.2448503, 1.599005, 0, 0.4901961, 1, 1,
0.1793185, -0.7358496, -0.4697803, 0, 0.4823529, 1, 1,
0.180231, -0.6209984, 1.932361, 0, 0.4784314, 1, 1,
0.1807496, 0.6999611, -0.1471057, 0, 0.4705882, 1, 1,
0.1814882, -1.344604, 3.503866, 0, 0.4666667, 1, 1,
0.1820966, -1.304359, 2.590054, 0, 0.4588235, 1, 1,
0.1825236, 1.130132, 1.613592, 0, 0.454902, 1, 1,
0.1924115, -1.539697, 3.664906, 0, 0.4470588, 1, 1,
0.196058, -1.110218, 3.207416, 0, 0.4431373, 1, 1,
0.2032162, 1.353072, 0.2231014, 0, 0.4352941, 1, 1,
0.203473, -0.1782909, 4.655103, 0, 0.4313726, 1, 1,
0.2095237, -0.1600664, 2.703501, 0, 0.4235294, 1, 1,
0.2096285, 0.9895374, -0.2623288, 0, 0.4196078, 1, 1,
0.2157397, -0.9295072, 3.091693, 0, 0.4117647, 1, 1,
0.2231492, 0.4195884, 0.521704, 0, 0.4078431, 1, 1,
0.224931, 1.088414, 0.2730972, 0, 0.4, 1, 1,
0.22856, 1.373109, 1.419222, 0, 0.3921569, 1, 1,
0.2289084, -0.8492299, 2.540675, 0, 0.3882353, 1, 1,
0.2290066, 0.8309032, -0.6756078, 0, 0.3803922, 1, 1,
0.2321364, 2.192494, 0.2762319, 0, 0.3764706, 1, 1,
0.2326011, -1.812593, 2.184138, 0, 0.3686275, 1, 1,
0.232908, 2.014473, 1.254248, 0, 0.3647059, 1, 1,
0.2335444, -0.5165312, 4.00526, 0, 0.3568628, 1, 1,
0.2372953, 0.3415248, -1.474901, 0, 0.3529412, 1, 1,
0.2397325, -0.8883491, 1.742072, 0, 0.345098, 1, 1,
0.243401, 0.5648769, 0.6774352, 0, 0.3411765, 1, 1,
0.2435692, -1.976648, 3.712193, 0, 0.3333333, 1, 1,
0.2436237, -1.497922, 1.955626, 0, 0.3294118, 1, 1,
0.2466087, 1.052006, -0.2598675, 0, 0.3215686, 1, 1,
0.2519452, -0.1329009, 1.1083, 0, 0.3176471, 1, 1,
0.2557913, 0.3985726, 1.840447, 0, 0.3098039, 1, 1,
0.2601981, -1.378329, 2.800729, 0, 0.3058824, 1, 1,
0.2618547, -1.221214, 3.906162, 0, 0.2980392, 1, 1,
0.2619845, 0.3617971, 0.7229849, 0, 0.2901961, 1, 1,
0.262018, -0.138385, -0.3517142, 0, 0.2862745, 1, 1,
0.262527, -0.8746739, 3.130672, 0, 0.2784314, 1, 1,
0.2637021, 0.6603023, 0.09340982, 0, 0.2745098, 1, 1,
0.2640623, 2.401693, 0.1977637, 0, 0.2666667, 1, 1,
0.2651525, 0.3783188, 0.8543128, 0, 0.2627451, 1, 1,
0.272787, -0.8700581, 1.247685, 0, 0.254902, 1, 1,
0.275031, -0.4524956, 3.774257, 0, 0.2509804, 1, 1,
0.2773534, 0.1396641, 1.776321, 0, 0.2431373, 1, 1,
0.2781048, -1.761033, 2.608928, 0, 0.2392157, 1, 1,
0.2811053, -0.537376, 1.824046, 0, 0.2313726, 1, 1,
0.2910382, 0.3448615, 0.1590236, 0, 0.227451, 1, 1,
0.2919377, -1.938491, 3.406383, 0, 0.2196078, 1, 1,
0.2962912, 1.063969, 0.6746221, 0, 0.2156863, 1, 1,
0.2997298, 0.3186495, 0.8446775, 0, 0.2078431, 1, 1,
0.3025986, 0.2445923, 2.383316, 0, 0.2039216, 1, 1,
0.3081808, 0.3062903, 1.79235, 0, 0.1960784, 1, 1,
0.322909, 1.142981, -0.05599217, 0, 0.1882353, 1, 1,
0.3264146, 1.082174, 1.267435, 0, 0.1843137, 1, 1,
0.3286915, -0.2715972, 2.759939, 0, 0.1764706, 1, 1,
0.3304164, -1.82784, 2.124304, 0, 0.172549, 1, 1,
0.33796, -0.4775895, 1.791298, 0, 0.1647059, 1, 1,
0.342652, 1.194604, 0.09995794, 0, 0.1607843, 1, 1,
0.3426957, -0.7514089, 2.524375, 0, 0.1529412, 1, 1,
0.3469671, -0.8975144, 2.439886, 0, 0.1490196, 1, 1,
0.3564504, -0.7309291, 3.892419, 0, 0.1411765, 1, 1,
0.3616933, 0.9541336, 1.601189, 0, 0.1372549, 1, 1,
0.3623585, 0.4820687, 1.234158, 0, 0.1294118, 1, 1,
0.3624117, 0.8138142, 0.4943801, 0, 0.1254902, 1, 1,
0.363179, 0.7832936, -0.1159409, 0, 0.1176471, 1, 1,
0.3666278, 0.2839742, 2.177812, 0, 0.1137255, 1, 1,
0.3719483, 0.4143691, 1.464393, 0, 0.1058824, 1, 1,
0.3748418, -1.37051, 2.981107, 0, 0.09803922, 1, 1,
0.3774161, -0.9859793, 2.119175, 0, 0.09411765, 1, 1,
0.3775212, -2.395474, 3.430363, 0, 0.08627451, 1, 1,
0.3859024, -0.1981763, 2.375437, 0, 0.08235294, 1, 1,
0.3923004, 0.9239059, 1.755037, 0, 0.07450981, 1, 1,
0.3947525, -0.07393909, 1.461498, 0, 0.07058824, 1, 1,
0.3982771, -0.02454582, 2.099187, 0, 0.0627451, 1, 1,
0.3986516, -1.279122, 1.753464, 0, 0.05882353, 1, 1,
0.401962, 1.456031, -0.6517413, 0, 0.05098039, 1, 1,
0.4032858, 0.9365525, -0.0619077, 0, 0.04705882, 1, 1,
0.4080364, 0.735302, -0.09247085, 0, 0.03921569, 1, 1,
0.4185432, -0.2584694, 2.437846, 0, 0.03529412, 1, 1,
0.4230442, 1.22309, 1.219678, 0, 0.02745098, 1, 1,
0.4310667, -0.4833246, 4.998076, 0, 0.02352941, 1, 1,
0.4315656, -0.1417959, 3.419513, 0, 0.01568628, 1, 1,
0.4337755, 1.065718, -0.3465183, 0, 0.01176471, 1, 1,
0.4344949, -0.198579, 2.233562, 0, 0.003921569, 1, 1,
0.4377777, -0.5384184, 2.750504, 0.003921569, 0, 1, 1,
0.4491173, -0.07666531, 1.086011, 0.007843138, 0, 1, 1,
0.4509539, -0.2598154, 2.22928, 0.01568628, 0, 1, 1,
0.4521567, 1.491474, -0.9485655, 0.01960784, 0, 1, 1,
0.4540527, -1.817936, 1.516751, 0.02745098, 0, 1, 1,
0.4545686, 0.9749652, 1.754844, 0.03137255, 0, 1, 1,
0.4564176, -1.934285, 2.442618, 0.03921569, 0, 1, 1,
0.4569088, 1.003004, -0.1473933, 0.04313726, 0, 1, 1,
0.4585996, 2.989064, 0.9099023, 0.05098039, 0, 1, 1,
0.458982, -1.267395, 3.874286, 0.05490196, 0, 1, 1,
0.4602511, 0.4932734, 0.3202069, 0.0627451, 0, 1, 1,
0.463863, 0.3811519, -0.1345977, 0.06666667, 0, 1, 1,
0.4656446, 0.1217625, 1.959707, 0.07450981, 0, 1, 1,
0.4659212, -0.3141427, 2.198174, 0.07843138, 0, 1, 1,
0.4723543, -2.012915, 2.559244, 0.08627451, 0, 1, 1,
0.4897988, 0.6878244, -0.3748614, 0.09019608, 0, 1, 1,
0.4901962, 1.475505, -1.42204, 0.09803922, 0, 1, 1,
0.4933423, 1.083441, 0.5131683, 0.1058824, 0, 1, 1,
0.4987768, -0.111607, 2.243375, 0.1098039, 0, 1, 1,
0.5076344, 0.5167248, 2.33304, 0.1176471, 0, 1, 1,
0.5102389, 2.979483, 0.6456766, 0.1215686, 0, 1, 1,
0.5173649, 2.387625, 2.628821, 0.1294118, 0, 1, 1,
0.5190766, 0.710443, 0.08241085, 0.1333333, 0, 1, 1,
0.5253621, 0.07635813, 1.444847, 0.1411765, 0, 1, 1,
0.5267571, 0.2019991, 1.889886, 0.145098, 0, 1, 1,
0.5338027, -0.1222065, 3.164951, 0.1529412, 0, 1, 1,
0.5379516, 0.8549187, 0.1502775, 0.1568628, 0, 1, 1,
0.5387135, -0.6607031, 0.2889911, 0.1647059, 0, 1, 1,
0.539504, 1.389712, 0.7675974, 0.1686275, 0, 1, 1,
0.5485932, 1.427815, 0.5860206, 0.1764706, 0, 1, 1,
0.5543031, 0.4052674, 1.140169, 0.1803922, 0, 1, 1,
0.5565776, 1.090451, 1.877194, 0.1882353, 0, 1, 1,
0.5597884, 0.8774357, -0.0373356, 0.1921569, 0, 1, 1,
0.5650783, 0.5376435, 0.6580933, 0.2, 0, 1, 1,
0.5663683, -0.1154908, 3.014335, 0.2078431, 0, 1, 1,
0.5669447, -1.322905, 3.716374, 0.2117647, 0, 1, 1,
0.5695807, 0.6413159, 0.2113467, 0.2196078, 0, 1, 1,
0.571512, -0.9171963, 2.929811, 0.2235294, 0, 1, 1,
0.5728863, 0.9299051, 0.9657149, 0.2313726, 0, 1, 1,
0.5742707, -0.0733365, 3.170883, 0.2352941, 0, 1, 1,
0.5757208, -1.099588, 4.011972, 0.2431373, 0, 1, 1,
0.5763456, 1.559473, 2.693718, 0.2470588, 0, 1, 1,
0.5766389, 0.3597613, 1.031639, 0.254902, 0, 1, 1,
0.5776458, 1.153364, 0.3189148, 0.2588235, 0, 1, 1,
0.5846944, -0.6081291, 3.205874, 0.2666667, 0, 1, 1,
0.5865615, -1.286721, 3.448038, 0.2705882, 0, 1, 1,
0.5911525, -0.02740046, 2.061095, 0.2784314, 0, 1, 1,
0.5949662, -0.7048227, 3.363004, 0.282353, 0, 1, 1,
0.5951274, -0.1647846, 0.6663727, 0.2901961, 0, 1, 1,
0.5952647, 0.1060526, 1.747905, 0.2941177, 0, 1, 1,
0.597175, -0.7695547, 2.991481, 0.3019608, 0, 1, 1,
0.6008961, 1.352869, 0.9950958, 0.3098039, 0, 1, 1,
0.6026521, -0.2127173, 2.91915, 0.3137255, 0, 1, 1,
0.6065751, -1.224539, 4.006983, 0.3215686, 0, 1, 1,
0.6094646, -0.5419323, 3.184429, 0.3254902, 0, 1, 1,
0.6134312, -0.180493, 2.012008, 0.3333333, 0, 1, 1,
0.617726, 1.376809, 0.3644857, 0.3372549, 0, 1, 1,
0.6257016, 0.1403492, 1.308004, 0.345098, 0, 1, 1,
0.6258224, -0.03391945, 1.808689, 0.3490196, 0, 1, 1,
0.6293203, -0.4093204, 3.902619, 0.3568628, 0, 1, 1,
0.6294034, -0.0776129, 3.45646, 0.3607843, 0, 1, 1,
0.6296195, -0.5532176, 1.246269, 0.3686275, 0, 1, 1,
0.6313394, 0.9040691, 1.146807, 0.372549, 0, 1, 1,
0.6328653, -0.1007619, 1.084408, 0.3803922, 0, 1, 1,
0.6336605, -0.9824153, 3.540543, 0.3843137, 0, 1, 1,
0.6347892, -2.032525, 1.819934, 0.3921569, 0, 1, 1,
0.6454849, -1.658168, 2.964048, 0.3960784, 0, 1, 1,
0.6464766, 0.6543971, 1.320563, 0.4039216, 0, 1, 1,
0.6485986, -0.6409312, 2.66612, 0.4117647, 0, 1, 1,
0.6497986, 0.02555558, 1.812319, 0.4156863, 0, 1, 1,
0.650142, -1.080366, 3.458842, 0.4235294, 0, 1, 1,
0.661394, -0.06742222, 0.9946851, 0.427451, 0, 1, 1,
0.6629624, -1.653224, 4.0822, 0.4352941, 0, 1, 1,
0.6648752, 0.2960072, 1.926578, 0.4392157, 0, 1, 1,
0.6671511, 0.0875411, 0.8136021, 0.4470588, 0, 1, 1,
0.6714994, 0.08567642, 2.143564, 0.4509804, 0, 1, 1,
0.6718236, -0.4164588, 2.604682, 0.4588235, 0, 1, 1,
0.6720703, -0.2856569, -0.001089995, 0.4627451, 0, 1, 1,
0.6722307, 0.2482168, 0.7273239, 0.4705882, 0, 1, 1,
0.6821808, -0.5581865, 1.721351, 0.4745098, 0, 1, 1,
0.6860995, -1.226359, 3.802928, 0.4823529, 0, 1, 1,
0.6898462, 0.3213584, 1.163817, 0.4862745, 0, 1, 1,
0.6914094, -0.3843015, 2.286275, 0.4941176, 0, 1, 1,
0.6936129, 0.6967924, 1.429563, 0.5019608, 0, 1, 1,
0.6937329, -1.1939, 3.768707, 0.5058824, 0, 1, 1,
0.696614, -1.066128, 2.167932, 0.5137255, 0, 1, 1,
0.6989704, -0.165688, 2.120966, 0.5176471, 0, 1, 1,
0.6995869, -1.417644, 0.7238161, 0.5254902, 0, 1, 1,
0.7047854, 0.8009724, 0.9428863, 0.5294118, 0, 1, 1,
0.7075619, 0.2265752, 1.938876, 0.5372549, 0, 1, 1,
0.7103011, 0.1780479, 2.844665, 0.5411765, 0, 1, 1,
0.7158636, 1.161391, 0.453328, 0.5490196, 0, 1, 1,
0.7165562, 0.533893, -0.7978439, 0.5529412, 0, 1, 1,
0.7320518, 0.9333249, 1.214385, 0.5607843, 0, 1, 1,
0.738156, -1.066476, 3.075125, 0.5647059, 0, 1, 1,
0.7405507, 0.3940938, 0.9684037, 0.572549, 0, 1, 1,
0.7430608, 0.8961408, 1.259617, 0.5764706, 0, 1, 1,
0.7449085, 0.1177658, 0.8979491, 0.5843138, 0, 1, 1,
0.7474707, -1.137863, 3.107562, 0.5882353, 0, 1, 1,
0.7511331, 1.878902, 0.8767078, 0.5960785, 0, 1, 1,
0.7532505, 0.7722586, -0.3443117, 0.6039216, 0, 1, 1,
0.7542613, -0.1831302, 3.237627, 0.6078432, 0, 1, 1,
0.7701897, 0.9850188, 1.914077, 0.6156863, 0, 1, 1,
0.7764784, -0.1694019, 2.595714, 0.6196079, 0, 1, 1,
0.783128, -1.904861, 3.203759, 0.627451, 0, 1, 1,
0.7845306, 1.701475, 0.7552174, 0.6313726, 0, 1, 1,
0.785181, 0.4663682, 0.5351921, 0.6392157, 0, 1, 1,
0.786892, -0.1853291, 2.945999, 0.6431373, 0, 1, 1,
0.7880047, 0.4073493, 0.6929691, 0.6509804, 0, 1, 1,
0.7881326, 0.7132766, 2.002553, 0.654902, 0, 1, 1,
0.7892271, -0.09135365, 1.939507, 0.6627451, 0, 1, 1,
0.7899802, -0.5843342, 1.08355, 0.6666667, 0, 1, 1,
0.7919025, -0.2682697, 1.629681, 0.6745098, 0, 1, 1,
0.7925395, 1.257704, 0.5165147, 0.6784314, 0, 1, 1,
0.7926844, -0.166015, 2.387121, 0.6862745, 0, 1, 1,
0.7965965, 0.7411587, 0.6492267, 0.6901961, 0, 1, 1,
0.8027767, 1.166572, 1.137407, 0.6980392, 0, 1, 1,
0.8109899, -0.5303855, 2.304013, 0.7058824, 0, 1, 1,
0.8138284, 1.016157, 1.323405, 0.7098039, 0, 1, 1,
0.8163233, 0.1826118, 1.168506, 0.7176471, 0, 1, 1,
0.8213564, -2.026467, 3.52885, 0.7215686, 0, 1, 1,
0.8324715, 0.1184924, -0.4619177, 0.7294118, 0, 1, 1,
0.8343205, 1.329748, 2.02959, 0.7333333, 0, 1, 1,
0.837511, 0.1937822, -0.4736166, 0.7411765, 0, 1, 1,
0.8415903, 0.7011241, 1.625269, 0.7450981, 0, 1, 1,
0.8438203, 0.1652657, 2.468584, 0.7529412, 0, 1, 1,
0.8442449, 0.8277639, 1.640126, 0.7568628, 0, 1, 1,
0.8475094, 0.2746515, 1.683876, 0.7647059, 0, 1, 1,
0.851192, 0.8740841, 0.7742031, 0.7686275, 0, 1, 1,
0.8576329, 0.0481221, 2.817818, 0.7764706, 0, 1, 1,
0.8597587, -0.6879116, 2.721151, 0.7803922, 0, 1, 1,
0.860015, 1.409983, 0.4513439, 0.7882353, 0, 1, 1,
0.8611546, 1.302827, 0.02763942, 0.7921569, 0, 1, 1,
0.8696021, 0.5506615, 0.8496447, 0.8, 0, 1, 1,
0.8753198, 0.8430173, 1.578332, 0.8078431, 0, 1, 1,
0.8756896, -0.009936498, 2.305044, 0.8117647, 0, 1, 1,
0.8758546, 0.05586923, 1.87704, 0.8196079, 0, 1, 1,
0.8805632, -0.9205577, 2.132405, 0.8235294, 0, 1, 1,
0.8826106, -0.6824102, 1.400658, 0.8313726, 0, 1, 1,
0.8834493, -0.8705304, 3.630925, 0.8352941, 0, 1, 1,
0.8838717, 0.05354214, 2.014135, 0.8431373, 0, 1, 1,
0.8876871, 1.023809, 1.370406, 0.8470588, 0, 1, 1,
0.89113, 0.7237146, 0.7583257, 0.854902, 0, 1, 1,
0.8964513, -1.739106, 2.648205, 0.8588235, 0, 1, 1,
0.8965555, 1.25161, 1.283709, 0.8666667, 0, 1, 1,
0.9084691, -0.9379144, 1.708347, 0.8705882, 0, 1, 1,
0.9117894, -0.1277431, 1.477319, 0.8784314, 0, 1, 1,
0.9178982, -0.705981, 0.9897754, 0.8823529, 0, 1, 1,
0.9369701, -1.549285, 2.611627, 0.8901961, 0, 1, 1,
0.9496564, 1.8248, -0.5152817, 0.8941177, 0, 1, 1,
0.9570311, -0.4421497, 2.537047, 0.9019608, 0, 1, 1,
0.9648756, 0.8484651, 3.202763, 0.9098039, 0, 1, 1,
0.9749561, 0.2538975, 2.521303, 0.9137255, 0, 1, 1,
0.9777946, -0.009417716, -0.7276611, 0.9215686, 0, 1, 1,
0.980553, 0.7833205, 0.6241875, 0.9254902, 0, 1, 1,
0.9812859, -1.183114, 3.861644, 0.9333333, 0, 1, 1,
0.9835486, -0.4335228, 1.624143, 0.9372549, 0, 1, 1,
0.9848228, 0.1016526, 0.7092806, 0.945098, 0, 1, 1,
0.9851558, 1.750776, 0.8871533, 0.9490196, 0, 1, 1,
0.9926848, -0.5110694, 2.653083, 0.9568627, 0, 1, 1,
0.9948241, 1.239619, 1.259688, 0.9607843, 0, 1, 1,
0.9960108, 0.9711859, 2.310217, 0.9686275, 0, 1, 1,
1.010014, -0.2167639, 1.784995, 0.972549, 0, 1, 1,
1.012922, 1.076458, 0.5307737, 0.9803922, 0, 1, 1,
1.013895, -0.4956627, 2.001327, 0.9843137, 0, 1, 1,
1.021787, 1.467934, 0.612503, 0.9921569, 0, 1, 1,
1.023081, 1.013903, 0.6566646, 0.9960784, 0, 1, 1,
1.036404, 0.7557656, -0.9422788, 1, 0, 0.9960784, 1,
1.037651, -0.02200429, 2.168456, 1, 0, 0.9882353, 1,
1.039004, -1.195021, 1.781335, 1, 0, 0.9843137, 1,
1.040646, 1.157901, 3.101452, 1, 0, 0.9764706, 1,
1.044602, -1.209288, 2.228508, 1, 0, 0.972549, 1,
1.045951, -0.9138989, 0.9084942, 1, 0, 0.9647059, 1,
1.046509, 1.352031, 1.252284, 1, 0, 0.9607843, 1,
1.053629, 2.263965, -0.1764079, 1, 0, 0.9529412, 1,
1.057725, 0.5277297, 0.6174532, 1, 0, 0.9490196, 1,
1.059255, -0.05629123, 2.251412, 1, 0, 0.9411765, 1,
1.059939, -1.414165, 3.968652, 1, 0, 0.9372549, 1,
1.060575, 2.216257, 1.077076, 1, 0, 0.9294118, 1,
1.062864, -2.000825, 4.831596, 1, 0, 0.9254902, 1,
1.063524, 0.6156478, 2.204119, 1, 0, 0.9176471, 1,
1.077871, 1.560233, -0.008858886, 1, 0, 0.9137255, 1,
1.080029, -1.129004, 3.968874, 1, 0, 0.9058824, 1,
1.084399, 0.4978019, 1.607489, 1, 0, 0.9019608, 1,
1.087635, -0.8374692, 3.453635, 1, 0, 0.8941177, 1,
1.08847, 1.16159, 0.0539831, 1, 0, 0.8862745, 1,
1.091911, -0.9063137, 1.621563, 1, 0, 0.8823529, 1,
1.097247, 0.9245862, 1.384101, 1, 0, 0.8745098, 1,
1.097281, 0.1713001, -0.2685855, 1, 0, 0.8705882, 1,
1.101801, -1.59798, 3.112879, 1, 0, 0.8627451, 1,
1.10402, -0.4387909, 2.604965, 1, 0, 0.8588235, 1,
1.104233, 0.3030751, -0.1415292, 1, 0, 0.8509804, 1,
1.105993, 0.4516652, 0.09172932, 1, 0, 0.8470588, 1,
1.112374, -1.888681, 1.910925, 1, 0, 0.8392157, 1,
1.118005, 0.06222924, 0.5002505, 1, 0, 0.8352941, 1,
1.11975, -0.3957307, 3.446991, 1, 0, 0.827451, 1,
1.120106, -0.4310296, 1.936542, 1, 0, 0.8235294, 1,
1.125006, -0.0916084, 2.184203, 1, 0, 0.8156863, 1,
1.137821, -0.7426783, 1.511582, 1, 0, 0.8117647, 1,
1.141429, 0.148424, 2.01377, 1, 0, 0.8039216, 1,
1.146808, 0.1121437, 1.493654, 1, 0, 0.7960784, 1,
1.16064, 0.6339783, 0.2456028, 1, 0, 0.7921569, 1,
1.161966, 0.8594748, -1.414415, 1, 0, 0.7843137, 1,
1.164535, 0.5127941, 0.6669734, 1, 0, 0.7803922, 1,
1.167599, 1.922565, 0.2787716, 1, 0, 0.772549, 1,
1.167925, 0.8519171, -0.1838913, 1, 0, 0.7686275, 1,
1.168714, 0.6201017, 1.884889, 1, 0, 0.7607843, 1,
1.180985, 2.174729, 1.255423, 1, 0, 0.7568628, 1,
1.181798, -1.03054, 2.727663, 1, 0, 0.7490196, 1,
1.19492, 1.011987, 2.787653, 1, 0, 0.7450981, 1,
1.195292, -0.5669217, 3.42232, 1, 0, 0.7372549, 1,
1.196961, 0.2650055, 1.520282, 1, 0, 0.7333333, 1,
1.20151, 2.367326, 0.229761, 1, 0, 0.7254902, 1,
1.205877, 0.857802, 0.4579651, 1, 0, 0.7215686, 1,
1.207917, -1.534939, 3.06257, 1, 0, 0.7137255, 1,
1.216429, -0.1691954, 2.200716, 1, 0, 0.7098039, 1,
1.219773, -0.1928295, 0.4919791, 1, 0, 0.7019608, 1,
1.227113, 0.05838504, 2.281203, 1, 0, 0.6941177, 1,
1.227198, -0.1865068, 0.7915866, 1, 0, 0.6901961, 1,
1.241976, 0.8643652, 2.831265, 1, 0, 0.682353, 1,
1.251526, -0.1076585, 0.9118642, 1, 0, 0.6784314, 1,
1.252242, -1.188079, 2.543557, 1, 0, 0.6705883, 1,
1.275725, -1.256331, 4.142194, 1, 0, 0.6666667, 1,
1.27832, 0.2520726, 1.249613, 1, 0, 0.6588235, 1,
1.284201, -1.101617, 2.108911, 1, 0, 0.654902, 1,
1.284347, 1.670769, 2.351121, 1, 0, 0.6470588, 1,
1.292237, 2.254566, 1.068701, 1, 0, 0.6431373, 1,
1.299789, -0.06276104, 2.423552, 1, 0, 0.6352941, 1,
1.30391, 0.01637544, 1.689961, 1, 0, 0.6313726, 1,
1.304279, 0.4870506, 2.149777, 1, 0, 0.6235294, 1,
1.304867, -1.660032, 2.059436, 1, 0, 0.6196079, 1,
1.311764, 0.1206059, 3.162616, 1, 0, 0.6117647, 1,
1.318879, -0.1078303, 1.036129, 1, 0, 0.6078432, 1,
1.326681, 0.6280761, 3.875043, 1, 0, 0.6, 1,
1.329683, -0.01019236, 1.282377, 1, 0, 0.5921569, 1,
1.330278, -0.1449744, 2.37774, 1, 0, 0.5882353, 1,
1.355564, -0.6883629, 1.882596, 1, 0, 0.5803922, 1,
1.357405, 0.9642677, 1.889779, 1, 0, 0.5764706, 1,
1.360499, 2.615571, 0.1462846, 1, 0, 0.5686275, 1,
1.365027, 0.2478544, 2.888798, 1, 0, 0.5647059, 1,
1.365641, 1.767247, -0.4166382, 1, 0, 0.5568628, 1,
1.370196, -0.2479191, 2.570881, 1, 0, 0.5529412, 1,
1.394655, -0.4772411, 1.981347, 1, 0, 0.5450981, 1,
1.397035, 0.6046461, 1.603046, 1, 0, 0.5411765, 1,
1.404153, -1.43896, 2.81427, 1, 0, 0.5333334, 1,
1.404429, -0.6089277, 2.341362, 1, 0, 0.5294118, 1,
1.414453, 1.773675, 1.833028, 1, 0, 0.5215687, 1,
1.423532, -2.626272, 2.105094, 1, 0, 0.5176471, 1,
1.427443, 0.4221658, 1.152934, 1, 0, 0.509804, 1,
1.433851, 2.277047, 0.195364, 1, 0, 0.5058824, 1,
1.442399, -0.4289998, 1.622488, 1, 0, 0.4980392, 1,
1.442595, -0.06241547, 2.12022, 1, 0, 0.4901961, 1,
1.446153, 0.3173909, 2.639147, 1, 0, 0.4862745, 1,
1.452114, 1.569522, -0.4770935, 1, 0, 0.4784314, 1,
1.490447, 0.4306923, 2.290678, 1, 0, 0.4745098, 1,
1.50323, 0.2462728, 1.710028, 1, 0, 0.4666667, 1,
1.511424, 0.5044882, 1.999202, 1, 0, 0.4627451, 1,
1.517293, -0.6843784, 4.127912, 1, 0, 0.454902, 1,
1.522427, -0.2082606, 0.8767363, 1, 0, 0.4509804, 1,
1.534179, -0.553662, 2.677578, 1, 0, 0.4431373, 1,
1.536377, 0.8355746, 1.817044, 1, 0, 0.4392157, 1,
1.542314, -1.967082, 1.119311, 1, 0, 0.4313726, 1,
1.544332, 0.5900573, 1.51467, 1, 0, 0.427451, 1,
1.550783, 0.6460076, -0.002716488, 1, 0, 0.4196078, 1,
1.558226, 0.5939975, 1.844304, 1, 0, 0.4156863, 1,
1.560419, -0.9915966, 2.14358, 1, 0, 0.4078431, 1,
1.56596, -0.253519, 1.582177, 1, 0, 0.4039216, 1,
1.568194, -0.5938914, 2.360144, 1, 0, 0.3960784, 1,
1.569156, 0.508391, 2.58007, 1, 0, 0.3882353, 1,
1.569918, 0.3410884, -0.3639899, 1, 0, 0.3843137, 1,
1.579793, -1.314097, 3.78028, 1, 0, 0.3764706, 1,
1.579822, 0.5363652, 1.595609, 1, 0, 0.372549, 1,
1.584548, 0.8953052, 3.755378, 1, 0, 0.3647059, 1,
1.601122, 0.1160821, 2.290849, 1, 0, 0.3607843, 1,
1.608003, -0.3737645, 1.657609, 1, 0, 0.3529412, 1,
1.611859, -0.7371668, 1.592256, 1, 0, 0.3490196, 1,
1.625699, -1.164797, 2.143281, 1, 0, 0.3411765, 1,
1.631587, -0.02376117, 1.884805, 1, 0, 0.3372549, 1,
1.639155, 1.076839, 1.181126, 1, 0, 0.3294118, 1,
1.64277, 0.4195292, 0.7735245, 1, 0, 0.3254902, 1,
1.653546, 0.819257, 0.9457337, 1, 0, 0.3176471, 1,
1.660644, -0.5967416, 1.491147, 1, 0, 0.3137255, 1,
1.673107, -0.8819817, 2.226122, 1, 0, 0.3058824, 1,
1.685323, 0.2033709, 2.889212, 1, 0, 0.2980392, 1,
1.703469, 0.1119739, 0.6385322, 1, 0, 0.2941177, 1,
1.707446, -0.9429343, 1.556038, 1, 0, 0.2862745, 1,
1.712936, 0.2004164, 1.334573, 1, 0, 0.282353, 1,
1.720276, 0.6161474, 2.225038, 1, 0, 0.2745098, 1,
1.723162, 0.4974718, -0.3879066, 1, 0, 0.2705882, 1,
1.760938, 0.4986808, 2.201025, 1, 0, 0.2627451, 1,
1.777268, -0.01050555, 1.090127, 1, 0, 0.2588235, 1,
1.780106, -0.6413107, 1.283088, 1, 0, 0.2509804, 1,
1.795467, 0.5668312, 2.651762, 1, 0, 0.2470588, 1,
1.79787, -1.029207, 3.884891, 1, 0, 0.2392157, 1,
1.798434, 0.2596743, 2.349733, 1, 0, 0.2352941, 1,
1.802004, -0.489085, 1.378361, 1, 0, 0.227451, 1,
1.809659, -0.1556091, 0.4619634, 1, 0, 0.2235294, 1,
1.812402, -0.0403498, 0.8340384, 1, 0, 0.2156863, 1,
1.813227, -2.145477, 2.973675, 1, 0, 0.2117647, 1,
1.821426, -1.38638, 1.127867, 1, 0, 0.2039216, 1,
1.822479, 0.7995903, 0.6190004, 1, 0, 0.1960784, 1,
1.825982, 0.4433132, 1.262317, 1, 0, 0.1921569, 1,
1.854366, -0.2609617, 1.122609, 1, 0, 0.1843137, 1,
1.863703, 0.8078985, 2.350785, 1, 0, 0.1803922, 1,
1.865129, -0.04205868, 1.097546, 1, 0, 0.172549, 1,
1.885447, -0.009094539, 2.696498, 1, 0, 0.1686275, 1,
1.90036, 0.2956396, 1.296299, 1, 0, 0.1607843, 1,
1.912569, 1.381076, -0.3059456, 1, 0, 0.1568628, 1,
1.92258, 0.08139896, 2.934476, 1, 0, 0.1490196, 1,
1.928418, 0.7484015, 2.102568, 1, 0, 0.145098, 1,
1.93608, 0.9588704, 1.261586, 1, 0, 0.1372549, 1,
1.937984, -0.603525, 2.03395, 1, 0, 0.1333333, 1,
1.994481, -0.2553263, 0.3383175, 1, 0, 0.1254902, 1,
2.028411, -1.042558, 3.419437, 1, 0, 0.1215686, 1,
2.038761, -0.7033645, 1.425047, 1, 0, 0.1137255, 1,
2.041139, -0.3816681, 1.235356, 1, 0, 0.1098039, 1,
2.06747, 0.4007254, 1.146323, 1, 0, 0.1019608, 1,
2.080834, 0.1020593, 2.742676, 1, 0, 0.09411765, 1,
2.083392, -0.6048316, 1.959461, 1, 0, 0.09019608, 1,
2.237254, -0.5635443, 0.676808, 1, 0, 0.08235294, 1,
2.255722, -1.226075, 3.007483, 1, 0, 0.07843138, 1,
2.315989, -0.2539879, 1.525032, 1, 0, 0.07058824, 1,
2.328894, 1.911607, 1.820658, 1, 0, 0.06666667, 1,
2.337413, -0.8220639, 2.450002, 1, 0, 0.05882353, 1,
2.348734, -1.8863, 3.694289, 1, 0, 0.05490196, 1,
2.358312, -1.186196, 1.831458, 1, 0, 0.04705882, 1,
2.367097, 0.2133812, 0.6783833, 1, 0, 0.04313726, 1,
2.369608, -1.306738, 2.556723, 1, 0, 0.03529412, 1,
2.382034, -0.5157943, 2.749053, 1, 0, 0.03137255, 1,
2.392224, 0.7008017, 0.4654033, 1, 0, 0.02352941, 1,
2.447536, -1.504287, 1.464576, 1, 0, 0.01960784, 1,
2.494202, -1.087262, 1.826573, 1, 0, 0.01176471, 1,
2.748698, 0.1118378, 0.5124254, 1, 0, 0.007843138, 1
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
-0.1940072, -3.78678, -7.129948, 0, -0.5, 0.5, 0.5,
-0.1940072, -3.78678, -7.129948, 1, -0.5, 0.5, 0.5,
-0.1940072, -3.78678, -7.129948, 1, 1.5, 0.5, 0.5,
-0.1940072, -3.78678, -7.129948, 0, 1.5, 0.5, 0.5
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
-4.134289, 0.09216654, -7.129948, 0, -0.5, 0.5, 0.5,
-4.134289, 0.09216654, -7.129948, 1, -0.5, 0.5, 0.5,
-4.134289, 0.09216654, -7.129948, 1, 1.5, 0.5, 0.5,
-4.134289, 0.09216654, -7.129948, 0, 1.5, 0.5, 0.5
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
-4.134289, -3.78678, -0.1870561, 0, -0.5, 0.5, 0.5,
-4.134289, -3.78678, -0.1870561, 1, -0.5, 0.5, 0.5,
-4.134289, -3.78678, -0.1870561, 1, 1.5, 0.5, 0.5,
-4.134289, -3.78678, -0.1870561, 0, 1.5, 0.5, 0.5
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
-3, -2.891638, -5.527742,
2, -2.891638, -5.527742,
-3, -2.891638, -5.527742,
-3, -3.040828, -5.794776,
-2, -2.891638, -5.527742,
-2, -3.040828, -5.794776,
-1, -2.891638, -5.527742,
-1, -3.040828, -5.794776,
0, -2.891638, -5.527742,
0, -3.040828, -5.794776,
1, -2.891638, -5.527742,
1, -3.040828, -5.794776,
2, -2.891638, -5.527742,
2, -3.040828, -5.794776
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
-3, -3.339209, -6.328845, 0, -0.5, 0.5, 0.5,
-3, -3.339209, -6.328845, 1, -0.5, 0.5, 0.5,
-3, -3.339209, -6.328845, 1, 1.5, 0.5, 0.5,
-3, -3.339209, -6.328845, 0, 1.5, 0.5, 0.5,
-2, -3.339209, -6.328845, 0, -0.5, 0.5, 0.5,
-2, -3.339209, -6.328845, 1, -0.5, 0.5, 0.5,
-2, -3.339209, -6.328845, 1, 1.5, 0.5, 0.5,
-2, -3.339209, -6.328845, 0, 1.5, 0.5, 0.5,
-1, -3.339209, -6.328845, 0, -0.5, 0.5, 0.5,
-1, -3.339209, -6.328845, 1, -0.5, 0.5, 0.5,
-1, -3.339209, -6.328845, 1, 1.5, 0.5, 0.5,
-1, -3.339209, -6.328845, 0, 1.5, 0.5, 0.5,
0, -3.339209, -6.328845, 0, -0.5, 0.5, 0.5,
0, -3.339209, -6.328845, 1, -0.5, 0.5, 0.5,
0, -3.339209, -6.328845, 1, 1.5, 0.5, 0.5,
0, -3.339209, -6.328845, 0, 1.5, 0.5, 0.5,
1, -3.339209, -6.328845, 0, -0.5, 0.5, 0.5,
1, -3.339209, -6.328845, 1, -0.5, 0.5, 0.5,
1, -3.339209, -6.328845, 1, 1.5, 0.5, 0.5,
1, -3.339209, -6.328845, 0, 1.5, 0.5, 0.5,
2, -3.339209, -6.328845, 0, -0.5, 0.5, 0.5,
2, -3.339209, -6.328845, 1, -0.5, 0.5, 0.5,
2, -3.339209, -6.328845, 1, 1.5, 0.5, 0.5,
2, -3.339209, -6.328845, 0, 1.5, 0.5, 0.5
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
-3.224993, -2, -5.527742,
-3.224993, 2, -5.527742,
-3.224993, -2, -5.527742,
-3.376543, -2, -5.794776,
-3.224993, -1, -5.527742,
-3.376543, -1, -5.794776,
-3.224993, 0, -5.527742,
-3.376543, 0, -5.794776,
-3.224993, 1, -5.527742,
-3.376543, 1, -5.794776,
-3.224993, 2, -5.527742,
-3.376543, 2, -5.794776
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
-3.679641, -2, -6.328845, 0, -0.5, 0.5, 0.5,
-3.679641, -2, -6.328845, 1, -0.5, 0.5, 0.5,
-3.679641, -2, -6.328845, 1, 1.5, 0.5, 0.5,
-3.679641, -2, -6.328845, 0, 1.5, 0.5, 0.5,
-3.679641, -1, -6.328845, 0, -0.5, 0.5, 0.5,
-3.679641, -1, -6.328845, 1, -0.5, 0.5, 0.5,
-3.679641, -1, -6.328845, 1, 1.5, 0.5, 0.5,
-3.679641, -1, -6.328845, 0, 1.5, 0.5, 0.5,
-3.679641, 0, -6.328845, 0, -0.5, 0.5, 0.5,
-3.679641, 0, -6.328845, 1, -0.5, 0.5, 0.5,
-3.679641, 0, -6.328845, 1, 1.5, 0.5, 0.5,
-3.679641, 0, -6.328845, 0, 1.5, 0.5, 0.5,
-3.679641, 1, -6.328845, 0, -0.5, 0.5, 0.5,
-3.679641, 1, -6.328845, 1, -0.5, 0.5, 0.5,
-3.679641, 1, -6.328845, 1, 1.5, 0.5, 0.5,
-3.679641, 1, -6.328845, 0, 1.5, 0.5, 0.5,
-3.679641, 2, -6.328845, 0, -0.5, 0.5, 0.5,
-3.679641, 2, -6.328845, 1, -0.5, 0.5, 0.5,
-3.679641, 2, -6.328845, 1, 1.5, 0.5, 0.5,
-3.679641, 2, -6.328845, 0, 1.5, 0.5, 0.5
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
-3.224993, -2.891638, -4,
-3.224993, -2.891638, 4,
-3.224993, -2.891638, -4,
-3.376543, -3.040828, -4,
-3.224993, -2.891638, -2,
-3.376543, -3.040828, -2,
-3.224993, -2.891638, 0,
-3.376543, -3.040828, 0,
-3.224993, -2.891638, 2,
-3.376543, -3.040828, 2,
-3.224993, -2.891638, 4,
-3.376543, -3.040828, 4
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
-3.679641, -3.339209, -4, 0, -0.5, 0.5, 0.5,
-3.679641, -3.339209, -4, 1, -0.5, 0.5, 0.5,
-3.679641, -3.339209, -4, 1, 1.5, 0.5, 0.5,
-3.679641, -3.339209, -4, 0, 1.5, 0.5, 0.5,
-3.679641, -3.339209, -2, 0, -0.5, 0.5, 0.5,
-3.679641, -3.339209, -2, 1, -0.5, 0.5, 0.5,
-3.679641, -3.339209, -2, 1, 1.5, 0.5, 0.5,
-3.679641, -3.339209, -2, 0, 1.5, 0.5, 0.5,
-3.679641, -3.339209, 0, 0, -0.5, 0.5, 0.5,
-3.679641, -3.339209, 0, 1, -0.5, 0.5, 0.5,
-3.679641, -3.339209, 0, 1, 1.5, 0.5, 0.5,
-3.679641, -3.339209, 0, 0, 1.5, 0.5, 0.5,
-3.679641, -3.339209, 2, 0, -0.5, 0.5, 0.5,
-3.679641, -3.339209, 2, 1, -0.5, 0.5, 0.5,
-3.679641, -3.339209, 2, 1, 1.5, 0.5, 0.5,
-3.679641, -3.339209, 2, 0, 1.5, 0.5, 0.5,
-3.679641, -3.339209, 4, 0, -0.5, 0.5, 0.5,
-3.679641, -3.339209, 4, 1, -0.5, 0.5, 0.5,
-3.679641, -3.339209, 4, 1, 1.5, 0.5, 0.5,
-3.679641, -3.339209, 4, 0, 1.5, 0.5, 0.5
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
-3.224993, -2.891638, -5.527742,
-3.224993, 3.075971, -5.527742,
-3.224993, -2.891638, 5.15363,
-3.224993, 3.075971, 5.15363,
-3.224993, -2.891638, -5.527742,
-3.224993, -2.891638, 5.15363,
-3.224993, 3.075971, -5.527742,
-3.224993, 3.075971, 5.15363,
-3.224993, -2.891638, -5.527742,
2.836979, -2.891638, -5.527742,
-3.224993, -2.891638, 5.15363,
2.836979, -2.891638, 5.15363,
-3.224993, 3.075971, -5.527742,
2.836979, 3.075971, -5.527742,
-3.224993, 3.075971, 5.15363,
2.836979, 3.075971, 5.15363,
2.836979, -2.891638, -5.527742,
2.836979, 3.075971, -5.527742,
2.836979, -2.891638, 5.15363,
2.836979, 3.075971, 5.15363,
2.836979, -2.891638, -5.527742,
2.836979, -2.891638, 5.15363,
2.836979, 3.075971, -5.527742,
2.836979, 3.075971, 5.15363
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
var radius = 7.29136;
var distance = 32.44008;
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
mvMatrix.translate( 0.1940072, -0.09216654, 0.1870561 );
mvMatrix.scale( 1.300494, 1.321058, 0.7380663 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.44008);
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
prosulfuron<-read.table("prosulfuron.xyz")
```

```
## Error in read.table("prosulfuron.xyz"): no lines available in input
```

```r
x<-prosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'prosulfuron' not found
```

```r
y<-prosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'prosulfuron' not found
```

```r
z<-prosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'prosulfuron' not found
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
-3.136712, -1.597162, -1.754847, 0, 0, 1, 1, 1,
-3.045201, -0.08547117, -0.3458576, 1, 0, 0, 1, 1,
-2.758129, -0.5594411, -1.905857, 1, 0, 0, 1, 1,
-2.707727, -0.06501707, -2.549834, 1, 0, 0, 1, 1,
-2.657429, -0.1897202, 1.394273, 1, 0, 0, 1, 1,
-2.618312, 0.5755699, -0.9210982, 1, 0, 0, 1, 1,
-2.597312, 1.865984, 0.07055446, 0, 0, 0, 1, 1,
-2.552451, 0.7877091, -0.1257558, 0, 0, 0, 1, 1,
-2.521371, 0.02927454, -1.119674, 0, 0, 0, 1, 1,
-2.505757, 0.2409076, -1.764421, 0, 0, 0, 1, 1,
-2.433875, -0.7091799, -3.833558, 0, 0, 0, 1, 1,
-2.405256, 0.4180001, 0.5800703, 0, 0, 0, 1, 1,
-2.387466, -0.4452368, -0.5599732, 0, 0, 0, 1, 1,
-2.360284, -0.02095135, -1.768603, 1, 1, 1, 1, 1,
-2.325819, -0.290003, -1.836789, 1, 1, 1, 1, 1,
-2.322175, -0.7972052, -1.616862, 1, 1, 1, 1, 1,
-2.303449, -0.7228796, -1.804911, 1, 1, 1, 1, 1,
-2.289602, -1.666515, -2.375931, 1, 1, 1, 1, 1,
-2.218914, 0.02468468, -3.505096, 1, 1, 1, 1, 1,
-2.204737, -1.655656, -2.864651, 1, 1, 1, 1, 1,
-2.188048, -0.1663277, -2.240498, 1, 1, 1, 1, 1,
-2.164389, -1.198037, -2.056036, 1, 1, 1, 1, 1,
-2.142597, -0.09067295, -0.9066057, 1, 1, 1, 1, 1,
-2.115583, -1.448659, -1.281883, 1, 1, 1, 1, 1,
-2.112927, 0.3199208, -1.840003, 1, 1, 1, 1, 1,
-2.109884, -1.184458, -3.692946, 1, 1, 1, 1, 1,
-2.103866, 0.2278561, -1.633752, 1, 1, 1, 1, 1,
-2.101613, 1.811062, -2.212089, 1, 1, 1, 1, 1,
-2.098735, -0.6143564, -1.125552, 0, 0, 1, 1, 1,
-2.091711, 1.124719, -0.9427658, 1, 0, 0, 1, 1,
-2.056634, 1.420558, -1.71076, 1, 0, 0, 1, 1,
-2.028487, -1.889537, -4.368759, 1, 0, 0, 1, 1,
-2.020016, 1.449527, -0.3551916, 1, 0, 0, 1, 1,
-2.000554, 0.1059587, -1.226973, 1, 0, 0, 1, 1,
-1.993948, 0.3939656, -1.264126, 0, 0, 0, 1, 1,
-1.984145, 0.01555318, -0.434613, 0, 0, 0, 1, 1,
-1.972706, -2.447671, -0.2882167, 0, 0, 0, 1, 1,
-1.933429, -0.9619502, -2.24715, 0, 0, 0, 1, 1,
-1.913992, -1.234013, -0.8890697, 0, 0, 0, 1, 1,
-1.908625, -0.3444941, -0.5704493, 0, 0, 0, 1, 1,
-1.903903, -1.533244, -0.8026645, 0, 0, 0, 1, 1,
-1.883312, 0.9272658, -2.082176, 1, 1, 1, 1, 1,
-1.868263, -0.6386991, -2.043952, 1, 1, 1, 1, 1,
-1.865165, -1.358059, -1.173318, 1, 1, 1, 1, 1,
-1.835634, 0.3546017, -0.4172462, 1, 1, 1, 1, 1,
-1.804331, 0.5354021, -0.3488452, 1, 1, 1, 1, 1,
-1.796722, 1.65152, -1.706611, 1, 1, 1, 1, 1,
-1.786124, -2.446844, -1.920487, 1, 1, 1, 1, 1,
-1.783576, 1.054568, -1.124549, 1, 1, 1, 1, 1,
-1.77873, -0.3904026, 0.3398243, 1, 1, 1, 1, 1,
-1.763775, -0.4762136, -1.313923, 1, 1, 1, 1, 1,
-1.738001, -0.4969001, -0.9669905, 1, 1, 1, 1, 1,
-1.726799, -0.600055, -0.5022861, 1, 1, 1, 1, 1,
-1.702677, 0.0238632, -4.202222, 1, 1, 1, 1, 1,
-1.687138, 1.399191, -0.9820676, 1, 1, 1, 1, 1,
-1.685619, 0.3069202, -0.3165773, 1, 1, 1, 1, 1,
-1.683746, 0.2144251, -1.928196, 0, 0, 1, 1, 1,
-1.676428, -0.3744616, -1.617311, 1, 0, 0, 1, 1,
-1.662774, 1.222972, -0.5338203, 1, 0, 0, 1, 1,
-1.661356, -1.133493, -2.966108, 1, 0, 0, 1, 1,
-1.658412, -1.473176, -2.011386, 1, 0, 0, 1, 1,
-1.645704, -0.1974318, -1.7513, 1, 0, 0, 1, 1,
-1.64223, -0.5956712, -1.961191, 0, 0, 0, 1, 1,
-1.61833, 1.659173, 1.121661, 0, 0, 0, 1, 1,
-1.610809, -1.786193, -1.754155, 0, 0, 0, 1, 1,
-1.602694, 0.8919061, -0.6794018, 0, 0, 0, 1, 1,
-1.602109, -1.315619, -2.100523, 0, 0, 0, 1, 1,
-1.595466, 1.180751, -2.250565, 0, 0, 0, 1, 1,
-1.587007, 2.034231, 0.119378, 0, 0, 0, 1, 1,
-1.585168, 1.255195, 0.8543077, 1, 1, 1, 1, 1,
-1.582444, 1.347074, -1.954845, 1, 1, 1, 1, 1,
-1.579748, -0.4276821, -1.2988, 1, 1, 1, 1, 1,
-1.56316, 0.1231163, -1.861695, 1, 1, 1, 1, 1,
-1.552525, 0.1562955, -2.500269, 1, 1, 1, 1, 1,
-1.514225, 0.5673572, -2.010888, 1, 1, 1, 1, 1,
-1.512997, -0.8565931, -2.990818, 1, 1, 1, 1, 1,
-1.512655, 0.660482, -1.353559, 1, 1, 1, 1, 1,
-1.498224, 0.470636, -1.619367, 1, 1, 1, 1, 1,
-1.496174, -1.774513, -3.029689, 1, 1, 1, 1, 1,
-1.494475, 0.6937816, -1.302707, 1, 1, 1, 1, 1,
-1.483136, -0.7482906, -2.221742, 1, 1, 1, 1, 1,
-1.452835, -0.6643482, -0.2485316, 1, 1, 1, 1, 1,
-1.44441, -0.9441541, -2.598862, 1, 1, 1, 1, 1,
-1.426445, 1.384257, 0.4966509, 1, 1, 1, 1, 1,
-1.418807, -2.388773, -2.782771, 0, 0, 1, 1, 1,
-1.417607, -0.2696541, -1.096298, 1, 0, 0, 1, 1,
-1.412368, -1.324686, -3.595054, 1, 0, 0, 1, 1,
-1.39965, -0.3457215, -1.3151, 1, 0, 0, 1, 1,
-1.385266, -1.513603, -2.288771, 1, 0, 0, 1, 1,
-1.368277, -0.06077728, -2.473738, 1, 0, 0, 1, 1,
-1.365785, 0.4823441, -0.8275097, 0, 0, 0, 1, 1,
-1.36075, 1.083517, -1.10812, 0, 0, 0, 1, 1,
-1.338336, -1.396104, -1.945109, 0, 0, 0, 1, 1,
-1.329837, -1.235368, -0.8594463, 0, 0, 0, 1, 1,
-1.329221, -0.3289625, -0.5843471, 0, 0, 0, 1, 1,
-1.323216, 0.538124, -1.876677, 0, 0, 0, 1, 1,
-1.322725, -0.2008514, -2.322638, 0, 0, 0, 1, 1,
-1.313585, -0.3836614, -0.7161519, 1, 1, 1, 1, 1,
-1.30718, 2.22318, -1.896992, 1, 1, 1, 1, 1,
-1.293408, 0.6421745, -0.9362598, 1, 1, 1, 1, 1,
-1.29005, 0.9234509, -1.627007, 1, 1, 1, 1, 1,
-1.285739, 0.6487873, -0.2469864, 1, 1, 1, 1, 1,
-1.268872, 0.3734904, -1.983863, 1, 1, 1, 1, 1,
-1.261038, 0.02547089, -3.108008, 1, 1, 1, 1, 1,
-1.260088, -0.2158465, -0.9852074, 1, 1, 1, 1, 1,
-1.255997, -1.761047, -3.101506, 1, 1, 1, 1, 1,
-1.253786, 2.627112, -2.349168, 1, 1, 1, 1, 1,
-1.225781, -2.386135, -4.563291, 1, 1, 1, 1, 1,
-1.223203, -0.3504331, -1.586909, 1, 1, 1, 1, 1,
-1.220674, -0.8592033, -1.314748, 1, 1, 1, 1, 1,
-1.219779, -0.5675338, -1.211918, 1, 1, 1, 1, 1,
-1.214583, -0.2190242, -1.795514, 1, 1, 1, 1, 1,
-1.214311, -0.9019893, -3.42242, 0, 0, 1, 1, 1,
-1.21342, -1.39802, -2.269781, 1, 0, 0, 1, 1,
-1.208824, 0.5123698, -1.496405, 1, 0, 0, 1, 1,
-1.206546, -0.5029286, -2.357336, 1, 0, 0, 1, 1,
-1.204417, 0.8327119, -1.211555, 1, 0, 0, 1, 1,
-1.20268, -1.624578, -1.696965, 1, 0, 0, 1, 1,
-1.200917, 0.1563477, -0.5774878, 0, 0, 0, 1, 1,
-1.189525, 0.8954227, -0.7016319, 0, 0, 0, 1, 1,
-1.185378, 1.821005, 0.05621514, 0, 0, 0, 1, 1,
-1.177115, 1.798469, -0.1108583, 0, 0, 0, 1, 1,
-1.172153, -0.650507, -2.778179, 0, 0, 0, 1, 1,
-1.168304, 0.391398, -1.255607, 0, 0, 0, 1, 1,
-1.164132, 0.3409338, -0.3763941, 0, 0, 0, 1, 1,
-1.161463, -0.3195643, -1.803345, 1, 1, 1, 1, 1,
-1.154454, -0.6166348, -2.160051, 1, 1, 1, 1, 1,
-1.149536, 0.4133826, -1.223894, 1, 1, 1, 1, 1,
-1.149007, 0.7063137, -0.08120655, 1, 1, 1, 1, 1,
-1.148598, 0.8290212, -1.334013, 1, 1, 1, 1, 1,
-1.143592, 0.7494537, -0.8355789, 1, 1, 1, 1, 1,
-1.138757, -0.2286114, -0.1699144, 1, 1, 1, 1, 1,
-1.136973, -1.405274, -0.6108501, 1, 1, 1, 1, 1,
-1.130868, 0.6789353, 0.2748747, 1, 1, 1, 1, 1,
-1.130402, 0.6434113, -1.675672, 1, 1, 1, 1, 1,
-1.130277, 1.698385, -1.719651, 1, 1, 1, 1, 1,
-1.128721, 0.4811526, -1.53109, 1, 1, 1, 1, 1,
-1.127704, 0.7206233, -0.1281237, 1, 1, 1, 1, 1,
-1.127581, 0.8720205, -1.739348, 1, 1, 1, 1, 1,
-1.127478, 0.7585469, -1.454329, 1, 1, 1, 1, 1,
-1.12353, -1.583319, -2.162493, 0, 0, 1, 1, 1,
-1.098826, -0.3321792, -1.512694, 1, 0, 0, 1, 1,
-1.096193, 1.452975, -0.3602424, 1, 0, 0, 1, 1,
-1.093802, -0.6249319, -3.180404, 1, 0, 0, 1, 1,
-1.089682, -0.5182061, -1.316242, 1, 0, 0, 1, 1,
-1.087806, -0.4830046, -2.2642, 1, 0, 0, 1, 1,
-1.087156, -0.1136635, -2.441016, 0, 0, 0, 1, 1,
-1.082194, 1.298164, -1.793681, 0, 0, 0, 1, 1,
-1.065592, -1.360936, -3.369219, 0, 0, 0, 1, 1,
-1.06296, -0.9068301, -3.744302, 0, 0, 0, 1, 1,
-1.055748, -0.0798218, -0.9446446, 0, 0, 0, 1, 1,
-1.055456, 0.3094097, -1.877125, 0, 0, 0, 1, 1,
-1.051635, -0.3389828, -2.138281, 0, 0, 0, 1, 1,
-1.050976, -0.1785024, -0.6155522, 1, 1, 1, 1, 1,
-1.039008, -0.4231139, -1.06531, 1, 1, 1, 1, 1,
-1.027046, -0.6950171, -1.39495, 1, 1, 1, 1, 1,
-1.021699, 0.03115534, -1.866456, 1, 1, 1, 1, 1,
-1.020943, -1.320842, -3.748338, 1, 1, 1, 1, 1,
-1.017369, -1.362781, -2.246242, 1, 1, 1, 1, 1,
-1.016744, -0.8690143, -3.258749, 1, 1, 1, 1, 1,
-1.00933, -0.1337939, -2.703725, 1, 1, 1, 1, 1,
-1.003238, 0.02704791, -1.845168, 1, 1, 1, 1, 1,
-0.9956412, -0.07395283, -0.7864391, 1, 1, 1, 1, 1,
-0.992673, 1.420613, 1.210761, 1, 1, 1, 1, 1,
-0.9898205, -0.6392095, -1.94269, 1, 1, 1, 1, 1,
-0.989265, -0.2107754, -3.005607, 1, 1, 1, 1, 1,
-0.9852913, 0.5000247, 0.6068663, 1, 1, 1, 1, 1,
-0.9800272, 0.8688213, -2.099044, 1, 1, 1, 1, 1,
-0.9777172, -1.330539, -3.215339, 0, 0, 1, 1, 1,
-0.9770817, -0.3457864, -1.899257, 1, 0, 0, 1, 1,
-0.963703, -0.02367412, -2.626442, 1, 0, 0, 1, 1,
-0.9631499, -0.5388414, -2.176885, 1, 0, 0, 1, 1,
-0.9606056, -0.2333388, -1.622866, 1, 0, 0, 1, 1,
-0.9594607, 1.396648, -1.110412, 1, 0, 0, 1, 1,
-0.9573574, -1.009165, -2.431465, 0, 0, 0, 1, 1,
-0.9418846, -1.270422, -3.345038, 0, 0, 0, 1, 1,
-0.9294615, -1.251804, 1.155891, 0, 0, 0, 1, 1,
-0.9273238, 1.490316, 0.290585, 0, 0, 0, 1, 1,
-0.9156232, 0.2347277, -2.228009, 0, 0, 0, 1, 1,
-0.9111594, -0.1770095, -3.067608, 0, 0, 0, 1, 1,
-0.9054499, 0.6345182, -3.539848, 0, 0, 0, 1, 1,
-0.8988681, -1.367163, -0.939892, 1, 1, 1, 1, 1,
-0.8968322, -0.3071746, -2.001761, 1, 1, 1, 1, 1,
-0.8823546, -0.06725414, -2.45734, 1, 1, 1, 1, 1,
-0.8785052, -0.3406293, -2.478377, 1, 1, 1, 1, 1,
-0.8729286, 0.1000833, 0.08367927, 1, 1, 1, 1, 1,
-0.871076, 0.02339423, -0.1139499, 1, 1, 1, 1, 1,
-0.8671899, -0.1636239, -1.695158, 1, 1, 1, 1, 1,
-0.8610562, 1.545668, -0.5034723, 1, 1, 1, 1, 1,
-0.8589363, 0.4899292, -0.9496555, 1, 1, 1, 1, 1,
-0.8543759, -0.1647063, 0.08953518, 1, 1, 1, 1, 1,
-0.8525079, -0.4562374, -0.8245956, 1, 1, 1, 1, 1,
-0.8496122, 0.4446877, -2.274714, 1, 1, 1, 1, 1,
-0.848115, -1.503181, -1.690286, 1, 1, 1, 1, 1,
-0.8450585, -0.4419696, -1.737195, 1, 1, 1, 1, 1,
-0.8421395, 0.9292051, 0.5516771, 1, 1, 1, 1, 1,
-0.8418564, 0.4579877, -0.4621278, 0, 0, 1, 1, 1,
-0.8335093, -0.1429295, -0.6649846, 1, 0, 0, 1, 1,
-0.8311019, 0.3574974, -0.8753722, 1, 0, 0, 1, 1,
-0.8310614, -1.238874, -3.317448, 1, 0, 0, 1, 1,
-0.8235984, 1.541359, -0.2128365, 1, 0, 0, 1, 1,
-0.8226113, 1.787647, 0.01164182, 1, 0, 0, 1, 1,
-0.8196747, 0.4889428, 0.3521653, 0, 0, 0, 1, 1,
-0.8173661, -0.8403792, -0.6825702, 0, 0, 0, 1, 1,
-0.8166819, -0.07974873, -1.910185, 0, 0, 0, 1, 1,
-0.8134753, 0.7813922, -0.3359658, 0, 0, 0, 1, 1,
-0.8126684, 1.30072, -0.1856139, 0, 0, 0, 1, 1,
-0.8061948, -1.019837, -3.745252, 0, 0, 0, 1, 1,
-0.8027515, 0.3652323, -0.4186725, 0, 0, 0, 1, 1,
-0.8022252, 1.673169, 1.110067, 1, 1, 1, 1, 1,
-0.796145, -0.5684237, -1.688737, 1, 1, 1, 1, 1,
-0.7945555, 0.563473, -2.102894, 1, 1, 1, 1, 1,
-0.7895422, -0.5796137, -1.367455, 1, 1, 1, 1, 1,
-0.7861775, -1.019139, -3.235394, 1, 1, 1, 1, 1,
-0.7861506, -1.541271, -2.971025, 1, 1, 1, 1, 1,
-0.7771552, -0.4317528, -3.200772, 1, 1, 1, 1, 1,
-0.7738454, 0.4844362, 1.099708, 1, 1, 1, 1, 1,
-0.7715415, -0.350043, -0.6812413, 1, 1, 1, 1, 1,
-0.7712234, -0.7709095, -2.159974, 1, 1, 1, 1, 1,
-0.7707505, -1.067892, -2.651263, 1, 1, 1, 1, 1,
-0.7702338, 0.3459359, -0.8880094, 1, 1, 1, 1, 1,
-0.76406, 0.4805144, -0.8527471, 1, 1, 1, 1, 1,
-0.7586917, 0.7847, -0.8510386, 1, 1, 1, 1, 1,
-0.7541354, -0.8607066, -3.667018, 1, 1, 1, 1, 1,
-0.7529028, 0.6405199, -0.3518102, 0, 0, 1, 1, 1,
-0.750344, -0.607702, -1.820486, 1, 0, 0, 1, 1,
-0.7484546, 0.5980682, -1.436998, 1, 0, 0, 1, 1,
-0.7477118, -0.3492843, -2.711962, 1, 0, 0, 1, 1,
-0.7439592, -0.09801172, -0.5944235, 1, 0, 0, 1, 1,
-0.7429792, 0.2135586, -0.5573842, 1, 0, 0, 1, 1,
-0.7359562, 0.764383, 1.033107, 0, 0, 0, 1, 1,
-0.7358425, -1.109261, -2.808345, 0, 0, 0, 1, 1,
-0.7313294, -0.2755697, -3.014593, 0, 0, 0, 1, 1,
-0.7246735, -0.3881502, -1.908123, 0, 0, 0, 1, 1,
-0.72198, 0.223639, -2.065533, 0, 0, 0, 1, 1,
-0.7054232, 0.8025615, -2.165541, 0, 0, 0, 1, 1,
-0.7042589, -0.3873889, -1.385716, 0, 0, 0, 1, 1,
-0.7035259, 0.766001, -0.3145759, 1, 1, 1, 1, 1,
-0.7031075, 0.2283091, -0.4851636, 1, 1, 1, 1, 1,
-0.7028964, -0.3646779, -3.807262, 1, 1, 1, 1, 1,
-0.7019354, 1.926142, 0.7033849, 1, 1, 1, 1, 1,
-0.695428, -0.7556436, -2.214791, 1, 1, 1, 1, 1,
-0.6916823, -0.6825987, -2.265072, 1, 1, 1, 1, 1,
-0.6911833, -1.833649, -1.955417, 1, 1, 1, 1, 1,
-0.6910506, 0.4541423, -2.207641, 1, 1, 1, 1, 1,
-0.6858378, -0.576804, -2.974416, 1, 1, 1, 1, 1,
-0.6841967, 0.5974552, -1.715419, 1, 1, 1, 1, 1,
-0.6813053, 1.017614, -1.133478, 1, 1, 1, 1, 1,
-0.6778257, 0.7140667, -0.5652754, 1, 1, 1, 1, 1,
-0.6740357, -1.387942, 0.07797872, 1, 1, 1, 1, 1,
-0.6677021, -1.086336, -3.078911, 1, 1, 1, 1, 1,
-0.6661495, -0.9820518, -2.531528, 1, 1, 1, 1, 1,
-0.6646308, 0.1445296, -3.614906, 0, 0, 1, 1, 1,
-0.6606224, 1.245188, -1.016803, 1, 0, 0, 1, 1,
-0.6576326, 0.1035246, 0.39533, 1, 0, 0, 1, 1,
-0.6509649, -0.03842024, -0.2898664, 1, 0, 0, 1, 1,
-0.6500905, -0.2090918, -1.295739, 1, 0, 0, 1, 1,
-0.6450438, 0.5984904, 1.000726, 1, 0, 0, 1, 1,
-0.6384841, 0.4728535, -0.8510784, 0, 0, 0, 1, 1,
-0.637311, -0.2791388, -2.105967, 0, 0, 0, 1, 1,
-0.6347473, -0.09371188, -0.2476942, 0, 0, 0, 1, 1,
-0.6310911, -0.7914032, -2.541175, 0, 0, 0, 1, 1,
-0.6299474, -1.832131, -3.415711, 0, 0, 0, 1, 1,
-0.6225872, 1.08984, -0.5895423, 0, 0, 0, 1, 1,
-0.6213719, 1.629118, -0.3680441, 0, 0, 0, 1, 1,
-0.6203177, 0.3831831, -1.780354, 1, 1, 1, 1, 1,
-0.6194665, -1.082354, -4.952929, 1, 1, 1, 1, 1,
-0.6149744, 0.3872002, -0.1078451, 1, 1, 1, 1, 1,
-0.6148921, 1.257858, 0.3661066, 1, 1, 1, 1, 1,
-0.6125231, 0.4381627, -0.3575965, 1, 1, 1, 1, 1,
-0.6116543, -0.08521535, -1.821081, 1, 1, 1, 1, 1,
-0.6023519, -0.6899859, -2.770324, 1, 1, 1, 1, 1,
-0.6002149, -0.07589786, -3.544418, 1, 1, 1, 1, 1,
-0.5994843, 0.2364196, -1.923532, 1, 1, 1, 1, 1,
-0.5959888, 1.819212, -0.6881037, 1, 1, 1, 1, 1,
-0.5909792, -0.1317985, -2.272913, 1, 1, 1, 1, 1,
-0.5870934, 0.397444, 0.06786536, 1, 1, 1, 1, 1,
-0.5870216, -0.1324464, -0.474357, 1, 1, 1, 1, 1,
-0.5867533, 0.448015, -0.3936614, 1, 1, 1, 1, 1,
-0.5848707, -0.4233439, -0.5422333, 1, 1, 1, 1, 1,
-0.5834422, -0.7457527, -4.230705, 0, 0, 1, 1, 1,
-0.5814019, -0.522203, -2.773617, 1, 0, 0, 1, 1,
-0.5790231, 0.1336766, -0.5389439, 1, 0, 0, 1, 1,
-0.5778691, -1.564941, -3.626661, 1, 0, 0, 1, 1,
-0.5743359, 0.4515338, -1.727651, 1, 0, 0, 1, 1,
-0.5728779, 0.9403761, -0.8195596, 1, 0, 0, 1, 1,
-0.5714949, -0.6963708, -3.581557, 0, 0, 0, 1, 1,
-0.5644943, -0.03102788, -1.887728, 0, 0, 0, 1, 1,
-0.5633925, -0.742029, -2.56542, 0, 0, 0, 1, 1,
-0.5631596, 0.4140649, -1.242412, 0, 0, 0, 1, 1,
-0.5542957, -2.13299, -3.391336, 0, 0, 0, 1, 1,
-0.5540411, 0.7173893, -0.8166084, 0, 0, 0, 1, 1,
-0.5447341, 0.6880584, -1.586945, 0, 0, 0, 1, 1,
-0.543698, -1.320334, -4.064656, 1, 1, 1, 1, 1,
-0.5385991, -0.8905488, -3.675365, 1, 1, 1, 1, 1,
-0.537425, -0.5571364, -2.722468, 1, 1, 1, 1, 1,
-0.5310688, 0.4023865, -3.639629, 1, 1, 1, 1, 1,
-0.5259579, 0.5974156, -0.1320105, 1, 1, 1, 1, 1,
-0.5140187, 0.3595259, -1.575415, 1, 1, 1, 1, 1,
-0.5130784, -0.4383027, -2.921699, 1, 1, 1, 1, 1,
-0.5093279, 0.07559641, -1.533104, 1, 1, 1, 1, 1,
-0.5063115, -1.11849, -3.262921, 1, 1, 1, 1, 1,
-0.5056944, -1.071586, -2.32539, 1, 1, 1, 1, 1,
-0.5045457, -2.005981, -5.187996, 1, 1, 1, 1, 1,
-0.501363, -0.2964351, -4.334277, 1, 1, 1, 1, 1,
-0.4955163, 2.122557, -0.1466172, 1, 1, 1, 1, 1,
-0.4933152, -0.4015441, -3.770482, 1, 1, 1, 1, 1,
-0.4926044, -1.297856, -2.621625, 1, 1, 1, 1, 1,
-0.4877495, 1.210962, 0.1470821, 0, 0, 1, 1, 1,
-0.4706387, 0.6293856, -1.104846, 1, 0, 0, 1, 1,
-0.4706098, 1.226547, 0.8190603, 1, 0, 0, 1, 1,
-0.468479, -0.3037522, -2.712607, 1, 0, 0, 1, 1,
-0.4672098, 0.1686713, -2.223799, 1, 0, 0, 1, 1,
-0.4633965, 0.4307658, 0.3901551, 1, 0, 0, 1, 1,
-0.4616482, 1.474698, -0.2692468, 0, 0, 0, 1, 1,
-0.4614939, -1.617172, -3.980847, 0, 0, 0, 1, 1,
-0.4612781, 0.9856403, -0.3841035, 0, 0, 0, 1, 1,
-0.4611629, -1.19214, -2.933352, 0, 0, 0, 1, 1,
-0.460018, 2.523739, 1.324582, 0, 0, 0, 1, 1,
-0.4591586, -0.7342076, -2.549094, 0, 0, 0, 1, 1,
-0.4563297, 1.751156, 0.1640059, 0, 0, 0, 1, 1,
-0.4550936, 1.367054, 0.0318016, 1, 1, 1, 1, 1,
-0.4535051, -1.330806, -2.032269, 1, 1, 1, 1, 1,
-0.4520584, -0.5552836, -1.744846, 1, 1, 1, 1, 1,
-0.4517238, -0.3358073, -2.491079, 1, 1, 1, 1, 1,
-0.4491205, -0.01230163, -1.296563, 1, 1, 1, 1, 1,
-0.4481766, 0.08234942, -2.151977, 1, 1, 1, 1, 1,
-0.4481051, 1.477192, -0.663124, 1, 1, 1, 1, 1,
-0.4468699, 0.8729719, 0.4346105, 1, 1, 1, 1, 1,
-0.4456365, -0.6047242, -2.595246, 1, 1, 1, 1, 1,
-0.4406222, 0.2102893, -0.6411929, 1, 1, 1, 1, 1,
-0.4389659, -1.048228, -2.482534, 1, 1, 1, 1, 1,
-0.4383852, 0.3454488, 0.7937315, 1, 1, 1, 1, 1,
-0.438196, 0.8692606, 0.07427863, 1, 1, 1, 1, 1,
-0.4329626, -2.255252, -4.619676, 1, 1, 1, 1, 1,
-0.4285446, 0.3945161, -0.4365387, 1, 1, 1, 1, 1,
-0.4263415, -2.413642, -3.84407, 0, 0, 1, 1, 1,
-0.4256084, 1.645361, -0.806255, 1, 0, 0, 1, 1,
-0.4246115, 0.1698759, -1.377402, 1, 0, 0, 1, 1,
-0.4227447, 0.1396214, -2.047571, 1, 0, 0, 1, 1,
-0.41838, -0.8710261, -3.563319, 1, 0, 0, 1, 1,
-0.4180071, 1.086043, 0.158637, 1, 0, 0, 1, 1,
-0.4142549, -0.9415102, -1.711497, 0, 0, 0, 1, 1,
-0.4125339, 0.5839577, -1.2812, 0, 0, 0, 1, 1,
-0.4115062, 1.595968, -1.057456, 0, 0, 0, 1, 1,
-0.4092146, 0.3798458, 0.8685381, 0, 0, 0, 1, 1,
-0.4030846, 0.8234847, 1.90547, 0, 0, 0, 1, 1,
-0.402433, -0.6286724, -2.756116, 0, 0, 0, 1, 1,
-0.4017782, -0.781719, -2.791835, 0, 0, 0, 1, 1,
-0.3916263, -1.627404, -4.086289, 1, 1, 1, 1, 1,
-0.3912466, 0.445655, -1.088668, 1, 1, 1, 1, 1,
-0.3905384, -0.25108, -2.436013, 1, 1, 1, 1, 1,
-0.3902667, 0.5302014, -2.11402, 1, 1, 1, 1, 1,
-0.3816436, 0.649501, -1.528008, 1, 1, 1, 1, 1,
-0.3804873, 0.1525542, -1.725598, 1, 1, 1, 1, 1,
-0.3772767, -0.1553618, -0.9601826, 1, 1, 1, 1, 1,
-0.377259, -0.7337961, -2.583386, 1, 1, 1, 1, 1,
-0.3727916, 1.540905, 0.5049815, 1, 1, 1, 1, 1,
-0.3709641, 0.4510882, -0.7035874, 1, 1, 1, 1, 1,
-0.3703805, -0.4826225, -1.910767, 1, 1, 1, 1, 1,
-0.3687824, 0.9056067, -1.099525, 1, 1, 1, 1, 1,
-0.3672082, 0.2227847, -0.7365032, 1, 1, 1, 1, 1,
-0.3657898, 0.497005, -1.059398, 1, 1, 1, 1, 1,
-0.365659, -2.561132, -2.307959, 1, 1, 1, 1, 1,
-0.3602043, 0.964759, -0.5673969, 0, 0, 1, 1, 1,
-0.3600353, 0.3644747, -0.4893347, 1, 0, 0, 1, 1,
-0.3599328, 0.4563536, -0.6371548, 1, 0, 0, 1, 1,
-0.3577203, 0.04037899, -2.237146, 1, 0, 0, 1, 1,
-0.3574786, 0.6607525, -0.7588939, 1, 0, 0, 1, 1,
-0.3523865, -0.8758885, -3.168844, 1, 0, 0, 1, 1,
-0.3486408, -0.6817605, -3.573381, 0, 0, 0, 1, 1,
-0.3444896, -0.4906825, -2.050247, 0, 0, 0, 1, 1,
-0.3443803, -1.142602, -2.936074, 0, 0, 0, 1, 1,
-0.3381893, -1.62903, -2.832563, 0, 0, 0, 1, 1,
-0.3372102, -1.859414, -3.108332, 0, 0, 0, 1, 1,
-0.3309467, -0.2665244, -2.721799, 0, 0, 0, 1, 1,
-0.3292612, -0.131797, -3.075253, 0, 0, 0, 1, 1,
-0.3290383, -0.1709555, -2.429849, 1, 1, 1, 1, 1,
-0.3259234, -0.5497734, -1.291263, 1, 1, 1, 1, 1,
-0.3254084, 0.2599535, -0.6716704, 1, 1, 1, 1, 1,
-0.3197683, -0.7255186, -4.151387, 1, 1, 1, 1, 1,
-0.3172152, 0.6855608, 1.01067, 1, 1, 1, 1, 1,
-0.3150054, -0.2158077, -3.237735, 1, 1, 1, 1, 1,
-0.3146442, -0.03326461, -2.997378, 1, 1, 1, 1, 1,
-0.3140351, -0.9763538, -1.797596, 1, 1, 1, 1, 1,
-0.3075565, 0.8701603, -1.487377, 1, 1, 1, 1, 1,
-0.3044542, 0.5153481, -0.41398, 1, 1, 1, 1, 1,
-0.3005382, 0.3124089, -0.505789, 1, 1, 1, 1, 1,
-0.3000487, 1.072323, -0.7452725, 1, 1, 1, 1, 1,
-0.2982722, -0.842749, -0.4852072, 1, 1, 1, 1, 1,
-0.2973297, 0.7841548, 0.2909676, 1, 1, 1, 1, 1,
-0.294993, 2.042182, 0.2523573, 1, 1, 1, 1, 1,
-0.2926155, -0.0211702, -2.234967, 0, 0, 1, 1, 1,
-0.2826636, 0.9685183, 2.094286, 1, 0, 0, 1, 1,
-0.2781677, -1.423662, -4.73934, 1, 0, 0, 1, 1,
-0.2778512, -0.8302437, -3.384558, 1, 0, 0, 1, 1,
-0.2756043, -1.720904, -2.099749, 1, 0, 0, 1, 1,
-0.2708529, -0.4630271, -2.346087, 1, 0, 0, 1, 1,
-0.2672221, -0.2638281, -1.897969, 0, 0, 0, 1, 1,
-0.2666669, 1.317713, 0.01744424, 0, 0, 0, 1, 1,
-0.2665169, -0.6591656, -2.723631, 0, 0, 0, 1, 1,
-0.2630686, 1.966783, 0.5755193, 0, 0, 0, 1, 1,
-0.2614508, 0.7765224, -0.9837992, 0, 0, 0, 1, 1,
-0.2564292, -1.280653, -3.491183, 0, 0, 0, 1, 1,
-0.2561246, -0.3725158, -3.295864, 0, 0, 0, 1, 1,
-0.2545106, 2.652716, 1.888602, 1, 1, 1, 1, 1,
-0.2456795, -2.757189, -3.369427, 1, 1, 1, 1, 1,
-0.2385254, 2.292022, -1.072161, 1, 1, 1, 1, 1,
-0.2339071, -0.8218136, -2.089532, 1, 1, 1, 1, 1,
-0.230053, -0.5004093, -2.481428, 1, 1, 1, 1, 1,
-0.2252459, -0.9044997, -4.953546, 1, 1, 1, 1, 1,
-0.2201152, -0.09515791, -0.3018363, 1, 1, 1, 1, 1,
-0.2190505, 0.776606, -1.931658, 1, 1, 1, 1, 1,
-0.2181418, -2.231828, -1.728097, 1, 1, 1, 1, 1,
-0.2177843, 0.1083416, -0.1803729, 1, 1, 1, 1, 1,
-0.2155436, 0.9593582, 0.4112893, 1, 1, 1, 1, 1,
-0.2137989, -0.9519888, -2.514827, 1, 1, 1, 1, 1,
-0.2128875, -1.269682, -2.514179, 1, 1, 1, 1, 1,
-0.2111992, -1.15542, -3.158637, 1, 1, 1, 1, 1,
-0.2104648, 0.2666631, -0.3393, 1, 1, 1, 1, 1,
-0.2090156, -0.6766837, -2.34664, 0, 0, 1, 1, 1,
-0.2081507, 0.04201354, -3.726868, 1, 0, 0, 1, 1,
-0.2046949, -0.6898079, -1.847275, 1, 0, 0, 1, 1,
-0.2044587, 0.6318806, -0.2320867, 1, 0, 0, 1, 1,
-0.2016681, -0.01492266, -2.914357, 1, 0, 0, 1, 1,
-0.1938457, -0.9107509, -2.850302, 1, 0, 0, 1, 1,
-0.1935526, 2.412312, 0.3592647, 0, 0, 0, 1, 1,
-0.1877896, -0.5034001, -2.868522, 0, 0, 0, 1, 1,
-0.1873677, -0.6832345, -3.023759, 0, 0, 0, 1, 1,
-0.1858085, 0.7943309, -1.098022, 0, 0, 0, 1, 1,
-0.1822066, -0.3465673, -1.721735, 0, 0, 0, 1, 1,
-0.1817492, 2.074637, -1.231996, 0, 0, 0, 1, 1,
-0.1811541, 0.9478017, -0.7396032, 0, 0, 0, 1, 1,
-0.1795349, -0.7506983, -2.697317, 1, 1, 1, 1, 1,
-0.1790459, -0.93389, -3.360676, 1, 1, 1, 1, 1,
-0.1788177, 0.9154266, 0.2348927, 1, 1, 1, 1, 1,
-0.1782735, -0.3915161, -2.500349, 1, 1, 1, 1, 1,
-0.1754835, -0.9309978, -2.462023, 1, 1, 1, 1, 1,
-0.1744679, 0.5291833, 1.426096, 1, 1, 1, 1, 1,
-0.1736692, -2.116865, -3.432895, 1, 1, 1, 1, 1,
-0.1728091, -1.038731, -3.101692, 1, 1, 1, 1, 1,
-0.170101, -0.8440693, -2.718653, 1, 1, 1, 1, 1,
-0.1659961, -0.9935794, -4.737675, 1, 1, 1, 1, 1,
-0.1657434, 1.214855, -0.1836389, 1, 1, 1, 1, 1,
-0.1626535, 0.2661516, 1.262539, 1, 1, 1, 1, 1,
-0.1610968, 0.536198, 1.125057, 1, 1, 1, 1, 1,
-0.1604488, -0.347484, -1.868732, 1, 1, 1, 1, 1,
-0.1535715, 0.9736074, 0.3685242, 1, 1, 1, 1, 1,
-0.15206, 0.1692144, -1.136421, 0, 0, 1, 1, 1,
-0.1491584, -0.5862773, -2.290774, 1, 0, 0, 1, 1,
-0.1468276, 0.4998091, -0.2981, 1, 0, 0, 1, 1,
-0.1461712, -0.1710696, -2.521497, 1, 0, 0, 1, 1,
-0.1433869, 0.3468423, 0.3050382, 1, 0, 0, 1, 1,
-0.1420239, 0.5993569, -0.004610313, 1, 0, 0, 1, 1,
-0.1412024, 0.416054, -0.1737265, 0, 0, 0, 1, 1,
-0.1408963, 1.151025, 0.2398194, 0, 0, 0, 1, 1,
-0.1396261, 1.656865, -0.09729021, 0, 0, 0, 1, 1,
-0.1393062, -0.4036557, -2.60464, 0, 0, 0, 1, 1,
-0.1369342, -0.6698838, -2.330368, 0, 0, 0, 1, 1,
-0.1352391, -0.6042538, -3.596525, 0, 0, 0, 1, 1,
-0.13471, 0.514465, 0.7976864, 0, 0, 0, 1, 1,
-0.1338905, -1.377966, -4.25072, 1, 1, 1, 1, 1,
-0.1264598, 1.28963, -0.005735036, 1, 1, 1, 1, 1,
-0.1230571, 0.8710631, 0.3028815, 1, 1, 1, 1, 1,
-0.1195663, -0.791194, -5.372188, 1, 1, 1, 1, 1,
-0.1187585, -0.3361024, -2.030796, 1, 1, 1, 1, 1,
-0.1170237, -0.3020242, -2.581692, 1, 1, 1, 1, 1,
-0.1166496, -0.267318, -3.534711, 1, 1, 1, 1, 1,
-0.1119096, 0.04990482, -1.362381, 1, 1, 1, 1, 1,
-0.1116205, -0.231005, -4.256069, 1, 1, 1, 1, 1,
-0.1111759, 1.638107, -0.5455124, 1, 1, 1, 1, 1,
-0.1100761, 1.080236, 1.309407, 1, 1, 1, 1, 1,
-0.1098415, -0.07428919, -2.533405, 1, 1, 1, 1, 1,
-0.1082021, -0.04821688, -2.168752, 1, 1, 1, 1, 1,
-0.1016851, 1.415706, -0.06215686, 1, 1, 1, 1, 1,
-0.1013658, -0.8829311, -2.091408, 1, 1, 1, 1, 1,
-0.0995825, -1.034513, -3.363675, 0, 0, 1, 1, 1,
-0.09783, 1.201713, 1.228795, 1, 0, 0, 1, 1,
-0.09772608, -0.4251295, -3.420239, 1, 0, 0, 1, 1,
-0.09621596, 0.09909665, -1.825251, 1, 0, 0, 1, 1,
-0.09045511, 0.4418217, 0.3757257, 1, 0, 0, 1, 1,
-0.089412, -0.1405409, -1.752172, 1, 0, 0, 1, 1,
-0.08248048, -1.940836, -5.248037, 0, 0, 0, 1, 1,
-0.08237, 0.2695202, 0.2833079, 0, 0, 0, 1, 1,
-0.08185754, -0.6635355, -4.406636, 0, 0, 0, 1, 1,
-0.07899377, 0.6535035, -0.9225146, 0, 0, 0, 1, 1,
-0.07715522, -0.645784, -2.865241, 0, 0, 0, 1, 1,
-0.076747, 0.5518267, -1.615378, 0, 0, 0, 1, 1,
-0.0757337, 0.7686933, 0.9107716, 0, 0, 0, 1, 1,
-0.07436363, 0.5530224, -0.03734019, 1, 1, 1, 1, 1,
-0.07320169, -0.8764789, -3.43627, 1, 1, 1, 1, 1,
-0.07176576, 0.1841596, 0.1789327, 1, 1, 1, 1, 1,
-0.07009597, 0.8698603, 0.8354636, 1, 1, 1, 1, 1,
-0.06525003, -0.8589978, -1.040677, 1, 1, 1, 1, 1,
-0.06399547, -1.141891, -2.241651, 1, 1, 1, 1, 1,
-0.0637897, -0.1650475, -4.872284, 1, 1, 1, 1, 1,
-0.06031208, 0.6653848, 0.2912386, 1, 1, 1, 1, 1,
-0.05804942, -0.7805769, -2.810345, 1, 1, 1, 1, 1,
-0.05593225, -0.981996, -2.528627, 1, 1, 1, 1, 1,
-0.05195007, -0.01822095, -1.479935, 1, 1, 1, 1, 1,
-0.05076697, -1.111593, -5.138653, 1, 1, 1, 1, 1,
-0.0469548, 1.294805, 0.04202525, 1, 1, 1, 1, 1,
-0.04488971, 1.58748, -2.198027, 1, 1, 1, 1, 1,
-0.04473464, 1.248286, 0.7218128, 1, 1, 1, 1, 1,
-0.04362623, -0.2748809, -1.847587, 0, 0, 1, 1, 1,
-0.04143276, -0.2997082, -0.6644134, 1, 0, 0, 1, 1,
-0.04038783, -2.173738, -4.007829, 1, 0, 0, 1, 1,
-0.03133423, -1.650199, -4.272764, 1, 0, 0, 1, 1,
-0.0294706, -0.7100783, -1.070314, 1, 0, 0, 1, 1,
-0.0258273, 0.6848491, 0.5935447, 1, 0, 0, 1, 1,
-0.02229573, -0.2419039, -1.301791, 0, 0, 0, 1, 1,
-0.02087791, 1.061793, -2.896224, 0, 0, 0, 1, 1,
-0.02029911, -0.1638138, -3.440315, 0, 0, 0, 1, 1,
-0.01906687, -0.607504, -1.354722, 0, 0, 0, 1, 1,
-0.0152576, -1.129819, -3.03722, 0, 0, 0, 1, 1,
-0.01050023, -0.2261728, -2.374662, 0, 0, 0, 1, 1,
-0.008849839, 2.553053, 0.5254311, 0, 0, 0, 1, 1,
-0.008421162, 0.8422294, -0.09078081, 1, 1, 1, 1, 1,
-0.001807273, 0.2862092, 0.3712598, 1, 1, 1, 1, 1,
0.001153334, 0.9690548, 0.2893578, 1, 1, 1, 1, 1,
0.002457173, 0.1312475, -0.07127518, 1, 1, 1, 1, 1,
0.008651784, 1.642993, 0.4305641, 1, 1, 1, 1, 1,
0.01421393, 1.118916, 0.7308768, 1, 1, 1, 1, 1,
0.0168775, 0.2904551, -1.285665, 1, 1, 1, 1, 1,
0.02341907, 0.3586445, 0.9268306, 1, 1, 1, 1, 1,
0.02378688, -0.32133, 1.468962, 1, 1, 1, 1, 1,
0.02421337, 0.1389742, -0.03947615, 1, 1, 1, 1, 1,
0.02475565, 0.008449938, 1.654777, 1, 1, 1, 1, 1,
0.02525304, 0.3169553, -0.4132154, 1, 1, 1, 1, 1,
0.03108018, -0.8972011, 2.144876, 1, 1, 1, 1, 1,
0.040009, -0.8093289, 2.991617, 1, 1, 1, 1, 1,
0.04096254, -0.6746609, 2.899193, 1, 1, 1, 1, 1,
0.04666441, 1.173377, 0.861621, 0, 0, 1, 1, 1,
0.04919974, -0.9995305, 1.872371, 1, 0, 0, 1, 1,
0.05000636, 1.259981, 0.4804104, 1, 0, 0, 1, 1,
0.05249011, 0.8839582, 0.4808143, 1, 0, 0, 1, 1,
0.05298248, 1.2059, -0.964681, 1, 0, 0, 1, 1,
0.05500491, -0.9243236, 3.479218, 1, 0, 0, 1, 1,
0.0607539, 1.205674, 0.813215, 0, 0, 0, 1, 1,
0.06194526, 2.210173, -1.746123, 0, 0, 0, 1, 1,
0.06253313, 0.3803075, -0.4151961, 0, 0, 0, 1, 1,
0.06255242, -0.4215298, 3.907276, 0, 0, 0, 1, 1,
0.07310746, 0.9585676, 0.295038, 0, 0, 0, 1, 1,
0.0734274, 0.7045531, -0.9048164, 0, 0, 0, 1, 1,
0.07921951, -0.0900921, 2.667398, 0, 0, 0, 1, 1,
0.08266049, -1.250813, 2.797379, 1, 1, 1, 1, 1,
0.08279321, 0.846317, -1.244452, 1, 1, 1, 1, 1,
0.08363347, 0.6279876, -0.4221804, 1, 1, 1, 1, 1,
0.08598778, 0.3786018, -0.2174432, 1, 1, 1, 1, 1,
0.08870691, -0.4888593, 1.989834, 1, 1, 1, 1, 1,
0.0905655, -1.240933, 4.367293, 1, 1, 1, 1, 1,
0.09212489, -1.261505, 1.573414, 1, 1, 1, 1, 1,
0.09265351, -1.902537, 2.986895, 1, 1, 1, 1, 1,
0.09291197, 1.385036, -1.054495, 1, 1, 1, 1, 1,
0.100461, -2.139828, 4.625884, 1, 1, 1, 1, 1,
0.1012011, 2.089514, -0.9135385, 1, 1, 1, 1, 1,
0.1049914, -0.1138044, 2.094834, 1, 1, 1, 1, 1,
0.1080164, -0.1239658, 2.377923, 1, 1, 1, 1, 1,
0.1196719, -0.2301477, 1.452422, 1, 1, 1, 1, 1,
0.122465, 1.19612, -0.9392745, 1, 1, 1, 1, 1,
0.1249035, 1.391936, -0.6720879, 0, 0, 1, 1, 1,
0.1251384, 1.496767, 1.140357, 1, 0, 0, 1, 1,
0.1255597, 0.8980011, 0.2764679, 1, 0, 0, 1, 1,
0.1263726, 0.2009606, 1.61639, 1, 0, 0, 1, 1,
0.1281469, 0.1578266, 0.8269245, 1, 0, 0, 1, 1,
0.1284534, 1.662694, 0.3148636, 1, 0, 0, 1, 1,
0.1299031, -0.6526341, 2.669252, 0, 0, 0, 1, 1,
0.1328989, 1.034608, -0.5066227, 0, 0, 0, 1, 1,
0.1372013, -1.26327, 3.467963, 0, 0, 0, 1, 1,
0.1394285, -1.53802, 4.673551, 0, 0, 0, 1, 1,
0.1399863, -0.09384435, 2.749943, 0, 0, 0, 1, 1,
0.1424185, -2.804731, 1.97515, 0, 0, 0, 1, 1,
0.1498757, 0.8584908, -1.904167, 0, 0, 0, 1, 1,
0.1503093, 0.5825553, -0.4448937, 1, 1, 1, 1, 1,
0.1509781, 1.231664, 0.3482784, 1, 1, 1, 1, 1,
0.1541352, 1.309245, 1.025753, 1, 1, 1, 1, 1,
0.1546314, 0.2735357, -0.3834996, 1, 1, 1, 1, 1,
0.1549006, -1.487378, 4.190281, 1, 1, 1, 1, 1,
0.1557072, 1.630548, -0.7035657, 1, 1, 1, 1, 1,
0.1567736, -1.014722, 2.146785, 1, 1, 1, 1, 1,
0.1568078, 0.3237899, 1.297459, 1, 1, 1, 1, 1,
0.161914, 1.021775, 1.133058, 1, 1, 1, 1, 1,
0.1663236, 1.130623, -1.906225, 1, 1, 1, 1, 1,
0.1705031, -0.4615839, 3.124644, 1, 1, 1, 1, 1,
0.1763614, 1.408158, 0.8042897, 1, 1, 1, 1, 1,
0.1791503, -0.2448503, 1.599005, 1, 1, 1, 1, 1,
0.1793185, -0.7358496, -0.4697803, 1, 1, 1, 1, 1,
0.180231, -0.6209984, 1.932361, 1, 1, 1, 1, 1,
0.1807496, 0.6999611, -0.1471057, 0, 0, 1, 1, 1,
0.1814882, -1.344604, 3.503866, 1, 0, 0, 1, 1,
0.1820966, -1.304359, 2.590054, 1, 0, 0, 1, 1,
0.1825236, 1.130132, 1.613592, 1, 0, 0, 1, 1,
0.1924115, -1.539697, 3.664906, 1, 0, 0, 1, 1,
0.196058, -1.110218, 3.207416, 1, 0, 0, 1, 1,
0.2032162, 1.353072, 0.2231014, 0, 0, 0, 1, 1,
0.203473, -0.1782909, 4.655103, 0, 0, 0, 1, 1,
0.2095237, -0.1600664, 2.703501, 0, 0, 0, 1, 1,
0.2096285, 0.9895374, -0.2623288, 0, 0, 0, 1, 1,
0.2157397, -0.9295072, 3.091693, 0, 0, 0, 1, 1,
0.2231492, 0.4195884, 0.521704, 0, 0, 0, 1, 1,
0.224931, 1.088414, 0.2730972, 0, 0, 0, 1, 1,
0.22856, 1.373109, 1.419222, 1, 1, 1, 1, 1,
0.2289084, -0.8492299, 2.540675, 1, 1, 1, 1, 1,
0.2290066, 0.8309032, -0.6756078, 1, 1, 1, 1, 1,
0.2321364, 2.192494, 0.2762319, 1, 1, 1, 1, 1,
0.2326011, -1.812593, 2.184138, 1, 1, 1, 1, 1,
0.232908, 2.014473, 1.254248, 1, 1, 1, 1, 1,
0.2335444, -0.5165312, 4.00526, 1, 1, 1, 1, 1,
0.2372953, 0.3415248, -1.474901, 1, 1, 1, 1, 1,
0.2397325, -0.8883491, 1.742072, 1, 1, 1, 1, 1,
0.243401, 0.5648769, 0.6774352, 1, 1, 1, 1, 1,
0.2435692, -1.976648, 3.712193, 1, 1, 1, 1, 1,
0.2436237, -1.497922, 1.955626, 1, 1, 1, 1, 1,
0.2466087, 1.052006, -0.2598675, 1, 1, 1, 1, 1,
0.2519452, -0.1329009, 1.1083, 1, 1, 1, 1, 1,
0.2557913, 0.3985726, 1.840447, 1, 1, 1, 1, 1,
0.2601981, -1.378329, 2.800729, 0, 0, 1, 1, 1,
0.2618547, -1.221214, 3.906162, 1, 0, 0, 1, 1,
0.2619845, 0.3617971, 0.7229849, 1, 0, 0, 1, 1,
0.262018, -0.138385, -0.3517142, 1, 0, 0, 1, 1,
0.262527, -0.8746739, 3.130672, 1, 0, 0, 1, 1,
0.2637021, 0.6603023, 0.09340982, 1, 0, 0, 1, 1,
0.2640623, 2.401693, 0.1977637, 0, 0, 0, 1, 1,
0.2651525, 0.3783188, 0.8543128, 0, 0, 0, 1, 1,
0.272787, -0.8700581, 1.247685, 0, 0, 0, 1, 1,
0.275031, -0.4524956, 3.774257, 0, 0, 0, 1, 1,
0.2773534, 0.1396641, 1.776321, 0, 0, 0, 1, 1,
0.2781048, -1.761033, 2.608928, 0, 0, 0, 1, 1,
0.2811053, -0.537376, 1.824046, 0, 0, 0, 1, 1,
0.2910382, 0.3448615, 0.1590236, 1, 1, 1, 1, 1,
0.2919377, -1.938491, 3.406383, 1, 1, 1, 1, 1,
0.2962912, 1.063969, 0.6746221, 1, 1, 1, 1, 1,
0.2997298, 0.3186495, 0.8446775, 1, 1, 1, 1, 1,
0.3025986, 0.2445923, 2.383316, 1, 1, 1, 1, 1,
0.3081808, 0.3062903, 1.79235, 1, 1, 1, 1, 1,
0.322909, 1.142981, -0.05599217, 1, 1, 1, 1, 1,
0.3264146, 1.082174, 1.267435, 1, 1, 1, 1, 1,
0.3286915, -0.2715972, 2.759939, 1, 1, 1, 1, 1,
0.3304164, -1.82784, 2.124304, 1, 1, 1, 1, 1,
0.33796, -0.4775895, 1.791298, 1, 1, 1, 1, 1,
0.342652, 1.194604, 0.09995794, 1, 1, 1, 1, 1,
0.3426957, -0.7514089, 2.524375, 1, 1, 1, 1, 1,
0.3469671, -0.8975144, 2.439886, 1, 1, 1, 1, 1,
0.3564504, -0.7309291, 3.892419, 1, 1, 1, 1, 1,
0.3616933, 0.9541336, 1.601189, 0, 0, 1, 1, 1,
0.3623585, 0.4820687, 1.234158, 1, 0, 0, 1, 1,
0.3624117, 0.8138142, 0.4943801, 1, 0, 0, 1, 1,
0.363179, 0.7832936, -0.1159409, 1, 0, 0, 1, 1,
0.3666278, 0.2839742, 2.177812, 1, 0, 0, 1, 1,
0.3719483, 0.4143691, 1.464393, 1, 0, 0, 1, 1,
0.3748418, -1.37051, 2.981107, 0, 0, 0, 1, 1,
0.3774161, -0.9859793, 2.119175, 0, 0, 0, 1, 1,
0.3775212, -2.395474, 3.430363, 0, 0, 0, 1, 1,
0.3859024, -0.1981763, 2.375437, 0, 0, 0, 1, 1,
0.3923004, 0.9239059, 1.755037, 0, 0, 0, 1, 1,
0.3947525, -0.07393909, 1.461498, 0, 0, 0, 1, 1,
0.3982771, -0.02454582, 2.099187, 0, 0, 0, 1, 1,
0.3986516, -1.279122, 1.753464, 1, 1, 1, 1, 1,
0.401962, 1.456031, -0.6517413, 1, 1, 1, 1, 1,
0.4032858, 0.9365525, -0.0619077, 1, 1, 1, 1, 1,
0.4080364, 0.735302, -0.09247085, 1, 1, 1, 1, 1,
0.4185432, -0.2584694, 2.437846, 1, 1, 1, 1, 1,
0.4230442, 1.22309, 1.219678, 1, 1, 1, 1, 1,
0.4310667, -0.4833246, 4.998076, 1, 1, 1, 1, 1,
0.4315656, -0.1417959, 3.419513, 1, 1, 1, 1, 1,
0.4337755, 1.065718, -0.3465183, 1, 1, 1, 1, 1,
0.4344949, -0.198579, 2.233562, 1, 1, 1, 1, 1,
0.4377777, -0.5384184, 2.750504, 1, 1, 1, 1, 1,
0.4491173, -0.07666531, 1.086011, 1, 1, 1, 1, 1,
0.4509539, -0.2598154, 2.22928, 1, 1, 1, 1, 1,
0.4521567, 1.491474, -0.9485655, 1, 1, 1, 1, 1,
0.4540527, -1.817936, 1.516751, 1, 1, 1, 1, 1,
0.4545686, 0.9749652, 1.754844, 0, 0, 1, 1, 1,
0.4564176, -1.934285, 2.442618, 1, 0, 0, 1, 1,
0.4569088, 1.003004, -0.1473933, 1, 0, 0, 1, 1,
0.4585996, 2.989064, 0.9099023, 1, 0, 0, 1, 1,
0.458982, -1.267395, 3.874286, 1, 0, 0, 1, 1,
0.4602511, 0.4932734, 0.3202069, 1, 0, 0, 1, 1,
0.463863, 0.3811519, -0.1345977, 0, 0, 0, 1, 1,
0.4656446, 0.1217625, 1.959707, 0, 0, 0, 1, 1,
0.4659212, -0.3141427, 2.198174, 0, 0, 0, 1, 1,
0.4723543, -2.012915, 2.559244, 0, 0, 0, 1, 1,
0.4897988, 0.6878244, -0.3748614, 0, 0, 0, 1, 1,
0.4901962, 1.475505, -1.42204, 0, 0, 0, 1, 1,
0.4933423, 1.083441, 0.5131683, 0, 0, 0, 1, 1,
0.4987768, -0.111607, 2.243375, 1, 1, 1, 1, 1,
0.5076344, 0.5167248, 2.33304, 1, 1, 1, 1, 1,
0.5102389, 2.979483, 0.6456766, 1, 1, 1, 1, 1,
0.5173649, 2.387625, 2.628821, 1, 1, 1, 1, 1,
0.5190766, 0.710443, 0.08241085, 1, 1, 1, 1, 1,
0.5253621, 0.07635813, 1.444847, 1, 1, 1, 1, 1,
0.5267571, 0.2019991, 1.889886, 1, 1, 1, 1, 1,
0.5338027, -0.1222065, 3.164951, 1, 1, 1, 1, 1,
0.5379516, 0.8549187, 0.1502775, 1, 1, 1, 1, 1,
0.5387135, -0.6607031, 0.2889911, 1, 1, 1, 1, 1,
0.539504, 1.389712, 0.7675974, 1, 1, 1, 1, 1,
0.5485932, 1.427815, 0.5860206, 1, 1, 1, 1, 1,
0.5543031, 0.4052674, 1.140169, 1, 1, 1, 1, 1,
0.5565776, 1.090451, 1.877194, 1, 1, 1, 1, 1,
0.5597884, 0.8774357, -0.0373356, 1, 1, 1, 1, 1,
0.5650783, 0.5376435, 0.6580933, 0, 0, 1, 1, 1,
0.5663683, -0.1154908, 3.014335, 1, 0, 0, 1, 1,
0.5669447, -1.322905, 3.716374, 1, 0, 0, 1, 1,
0.5695807, 0.6413159, 0.2113467, 1, 0, 0, 1, 1,
0.571512, -0.9171963, 2.929811, 1, 0, 0, 1, 1,
0.5728863, 0.9299051, 0.9657149, 1, 0, 0, 1, 1,
0.5742707, -0.0733365, 3.170883, 0, 0, 0, 1, 1,
0.5757208, -1.099588, 4.011972, 0, 0, 0, 1, 1,
0.5763456, 1.559473, 2.693718, 0, 0, 0, 1, 1,
0.5766389, 0.3597613, 1.031639, 0, 0, 0, 1, 1,
0.5776458, 1.153364, 0.3189148, 0, 0, 0, 1, 1,
0.5846944, -0.6081291, 3.205874, 0, 0, 0, 1, 1,
0.5865615, -1.286721, 3.448038, 0, 0, 0, 1, 1,
0.5911525, -0.02740046, 2.061095, 1, 1, 1, 1, 1,
0.5949662, -0.7048227, 3.363004, 1, 1, 1, 1, 1,
0.5951274, -0.1647846, 0.6663727, 1, 1, 1, 1, 1,
0.5952647, 0.1060526, 1.747905, 1, 1, 1, 1, 1,
0.597175, -0.7695547, 2.991481, 1, 1, 1, 1, 1,
0.6008961, 1.352869, 0.9950958, 1, 1, 1, 1, 1,
0.6026521, -0.2127173, 2.91915, 1, 1, 1, 1, 1,
0.6065751, -1.224539, 4.006983, 1, 1, 1, 1, 1,
0.6094646, -0.5419323, 3.184429, 1, 1, 1, 1, 1,
0.6134312, -0.180493, 2.012008, 1, 1, 1, 1, 1,
0.617726, 1.376809, 0.3644857, 1, 1, 1, 1, 1,
0.6257016, 0.1403492, 1.308004, 1, 1, 1, 1, 1,
0.6258224, -0.03391945, 1.808689, 1, 1, 1, 1, 1,
0.6293203, -0.4093204, 3.902619, 1, 1, 1, 1, 1,
0.6294034, -0.0776129, 3.45646, 1, 1, 1, 1, 1,
0.6296195, -0.5532176, 1.246269, 0, 0, 1, 1, 1,
0.6313394, 0.9040691, 1.146807, 1, 0, 0, 1, 1,
0.6328653, -0.1007619, 1.084408, 1, 0, 0, 1, 1,
0.6336605, -0.9824153, 3.540543, 1, 0, 0, 1, 1,
0.6347892, -2.032525, 1.819934, 1, 0, 0, 1, 1,
0.6454849, -1.658168, 2.964048, 1, 0, 0, 1, 1,
0.6464766, 0.6543971, 1.320563, 0, 0, 0, 1, 1,
0.6485986, -0.6409312, 2.66612, 0, 0, 0, 1, 1,
0.6497986, 0.02555558, 1.812319, 0, 0, 0, 1, 1,
0.650142, -1.080366, 3.458842, 0, 0, 0, 1, 1,
0.661394, -0.06742222, 0.9946851, 0, 0, 0, 1, 1,
0.6629624, -1.653224, 4.0822, 0, 0, 0, 1, 1,
0.6648752, 0.2960072, 1.926578, 0, 0, 0, 1, 1,
0.6671511, 0.0875411, 0.8136021, 1, 1, 1, 1, 1,
0.6714994, 0.08567642, 2.143564, 1, 1, 1, 1, 1,
0.6718236, -0.4164588, 2.604682, 1, 1, 1, 1, 1,
0.6720703, -0.2856569, -0.001089995, 1, 1, 1, 1, 1,
0.6722307, 0.2482168, 0.7273239, 1, 1, 1, 1, 1,
0.6821808, -0.5581865, 1.721351, 1, 1, 1, 1, 1,
0.6860995, -1.226359, 3.802928, 1, 1, 1, 1, 1,
0.6898462, 0.3213584, 1.163817, 1, 1, 1, 1, 1,
0.6914094, -0.3843015, 2.286275, 1, 1, 1, 1, 1,
0.6936129, 0.6967924, 1.429563, 1, 1, 1, 1, 1,
0.6937329, -1.1939, 3.768707, 1, 1, 1, 1, 1,
0.696614, -1.066128, 2.167932, 1, 1, 1, 1, 1,
0.6989704, -0.165688, 2.120966, 1, 1, 1, 1, 1,
0.6995869, -1.417644, 0.7238161, 1, 1, 1, 1, 1,
0.7047854, 0.8009724, 0.9428863, 1, 1, 1, 1, 1,
0.7075619, 0.2265752, 1.938876, 0, 0, 1, 1, 1,
0.7103011, 0.1780479, 2.844665, 1, 0, 0, 1, 1,
0.7158636, 1.161391, 0.453328, 1, 0, 0, 1, 1,
0.7165562, 0.533893, -0.7978439, 1, 0, 0, 1, 1,
0.7320518, 0.9333249, 1.214385, 1, 0, 0, 1, 1,
0.738156, -1.066476, 3.075125, 1, 0, 0, 1, 1,
0.7405507, 0.3940938, 0.9684037, 0, 0, 0, 1, 1,
0.7430608, 0.8961408, 1.259617, 0, 0, 0, 1, 1,
0.7449085, 0.1177658, 0.8979491, 0, 0, 0, 1, 1,
0.7474707, -1.137863, 3.107562, 0, 0, 0, 1, 1,
0.7511331, 1.878902, 0.8767078, 0, 0, 0, 1, 1,
0.7532505, 0.7722586, -0.3443117, 0, 0, 0, 1, 1,
0.7542613, -0.1831302, 3.237627, 0, 0, 0, 1, 1,
0.7701897, 0.9850188, 1.914077, 1, 1, 1, 1, 1,
0.7764784, -0.1694019, 2.595714, 1, 1, 1, 1, 1,
0.783128, -1.904861, 3.203759, 1, 1, 1, 1, 1,
0.7845306, 1.701475, 0.7552174, 1, 1, 1, 1, 1,
0.785181, 0.4663682, 0.5351921, 1, 1, 1, 1, 1,
0.786892, -0.1853291, 2.945999, 1, 1, 1, 1, 1,
0.7880047, 0.4073493, 0.6929691, 1, 1, 1, 1, 1,
0.7881326, 0.7132766, 2.002553, 1, 1, 1, 1, 1,
0.7892271, -0.09135365, 1.939507, 1, 1, 1, 1, 1,
0.7899802, -0.5843342, 1.08355, 1, 1, 1, 1, 1,
0.7919025, -0.2682697, 1.629681, 1, 1, 1, 1, 1,
0.7925395, 1.257704, 0.5165147, 1, 1, 1, 1, 1,
0.7926844, -0.166015, 2.387121, 1, 1, 1, 1, 1,
0.7965965, 0.7411587, 0.6492267, 1, 1, 1, 1, 1,
0.8027767, 1.166572, 1.137407, 1, 1, 1, 1, 1,
0.8109899, -0.5303855, 2.304013, 0, 0, 1, 1, 1,
0.8138284, 1.016157, 1.323405, 1, 0, 0, 1, 1,
0.8163233, 0.1826118, 1.168506, 1, 0, 0, 1, 1,
0.8213564, -2.026467, 3.52885, 1, 0, 0, 1, 1,
0.8324715, 0.1184924, -0.4619177, 1, 0, 0, 1, 1,
0.8343205, 1.329748, 2.02959, 1, 0, 0, 1, 1,
0.837511, 0.1937822, -0.4736166, 0, 0, 0, 1, 1,
0.8415903, 0.7011241, 1.625269, 0, 0, 0, 1, 1,
0.8438203, 0.1652657, 2.468584, 0, 0, 0, 1, 1,
0.8442449, 0.8277639, 1.640126, 0, 0, 0, 1, 1,
0.8475094, 0.2746515, 1.683876, 0, 0, 0, 1, 1,
0.851192, 0.8740841, 0.7742031, 0, 0, 0, 1, 1,
0.8576329, 0.0481221, 2.817818, 0, 0, 0, 1, 1,
0.8597587, -0.6879116, 2.721151, 1, 1, 1, 1, 1,
0.860015, 1.409983, 0.4513439, 1, 1, 1, 1, 1,
0.8611546, 1.302827, 0.02763942, 1, 1, 1, 1, 1,
0.8696021, 0.5506615, 0.8496447, 1, 1, 1, 1, 1,
0.8753198, 0.8430173, 1.578332, 1, 1, 1, 1, 1,
0.8756896, -0.009936498, 2.305044, 1, 1, 1, 1, 1,
0.8758546, 0.05586923, 1.87704, 1, 1, 1, 1, 1,
0.8805632, -0.9205577, 2.132405, 1, 1, 1, 1, 1,
0.8826106, -0.6824102, 1.400658, 1, 1, 1, 1, 1,
0.8834493, -0.8705304, 3.630925, 1, 1, 1, 1, 1,
0.8838717, 0.05354214, 2.014135, 1, 1, 1, 1, 1,
0.8876871, 1.023809, 1.370406, 1, 1, 1, 1, 1,
0.89113, 0.7237146, 0.7583257, 1, 1, 1, 1, 1,
0.8964513, -1.739106, 2.648205, 1, 1, 1, 1, 1,
0.8965555, 1.25161, 1.283709, 1, 1, 1, 1, 1,
0.9084691, -0.9379144, 1.708347, 0, 0, 1, 1, 1,
0.9117894, -0.1277431, 1.477319, 1, 0, 0, 1, 1,
0.9178982, -0.705981, 0.9897754, 1, 0, 0, 1, 1,
0.9369701, -1.549285, 2.611627, 1, 0, 0, 1, 1,
0.9496564, 1.8248, -0.5152817, 1, 0, 0, 1, 1,
0.9570311, -0.4421497, 2.537047, 1, 0, 0, 1, 1,
0.9648756, 0.8484651, 3.202763, 0, 0, 0, 1, 1,
0.9749561, 0.2538975, 2.521303, 0, 0, 0, 1, 1,
0.9777946, -0.009417716, -0.7276611, 0, 0, 0, 1, 1,
0.980553, 0.7833205, 0.6241875, 0, 0, 0, 1, 1,
0.9812859, -1.183114, 3.861644, 0, 0, 0, 1, 1,
0.9835486, -0.4335228, 1.624143, 0, 0, 0, 1, 1,
0.9848228, 0.1016526, 0.7092806, 0, 0, 0, 1, 1,
0.9851558, 1.750776, 0.8871533, 1, 1, 1, 1, 1,
0.9926848, -0.5110694, 2.653083, 1, 1, 1, 1, 1,
0.9948241, 1.239619, 1.259688, 1, 1, 1, 1, 1,
0.9960108, 0.9711859, 2.310217, 1, 1, 1, 1, 1,
1.010014, -0.2167639, 1.784995, 1, 1, 1, 1, 1,
1.012922, 1.076458, 0.5307737, 1, 1, 1, 1, 1,
1.013895, -0.4956627, 2.001327, 1, 1, 1, 1, 1,
1.021787, 1.467934, 0.612503, 1, 1, 1, 1, 1,
1.023081, 1.013903, 0.6566646, 1, 1, 1, 1, 1,
1.036404, 0.7557656, -0.9422788, 1, 1, 1, 1, 1,
1.037651, -0.02200429, 2.168456, 1, 1, 1, 1, 1,
1.039004, -1.195021, 1.781335, 1, 1, 1, 1, 1,
1.040646, 1.157901, 3.101452, 1, 1, 1, 1, 1,
1.044602, -1.209288, 2.228508, 1, 1, 1, 1, 1,
1.045951, -0.9138989, 0.9084942, 1, 1, 1, 1, 1,
1.046509, 1.352031, 1.252284, 0, 0, 1, 1, 1,
1.053629, 2.263965, -0.1764079, 1, 0, 0, 1, 1,
1.057725, 0.5277297, 0.6174532, 1, 0, 0, 1, 1,
1.059255, -0.05629123, 2.251412, 1, 0, 0, 1, 1,
1.059939, -1.414165, 3.968652, 1, 0, 0, 1, 1,
1.060575, 2.216257, 1.077076, 1, 0, 0, 1, 1,
1.062864, -2.000825, 4.831596, 0, 0, 0, 1, 1,
1.063524, 0.6156478, 2.204119, 0, 0, 0, 1, 1,
1.077871, 1.560233, -0.008858886, 0, 0, 0, 1, 1,
1.080029, -1.129004, 3.968874, 0, 0, 0, 1, 1,
1.084399, 0.4978019, 1.607489, 0, 0, 0, 1, 1,
1.087635, -0.8374692, 3.453635, 0, 0, 0, 1, 1,
1.08847, 1.16159, 0.0539831, 0, 0, 0, 1, 1,
1.091911, -0.9063137, 1.621563, 1, 1, 1, 1, 1,
1.097247, 0.9245862, 1.384101, 1, 1, 1, 1, 1,
1.097281, 0.1713001, -0.2685855, 1, 1, 1, 1, 1,
1.101801, -1.59798, 3.112879, 1, 1, 1, 1, 1,
1.10402, -0.4387909, 2.604965, 1, 1, 1, 1, 1,
1.104233, 0.3030751, -0.1415292, 1, 1, 1, 1, 1,
1.105993, 0.4516652, 0.09172932, 1, 1, 1, 1, 1,
1.112374, -1.888681, 1.910925, 1, 1, 1, 1, 1,
1.118005, 0.06222924, 0.5002505, 1, 1, 1, 1, 1,
1.11975, -0.3957307, 3.446991, 1, 1, 1, 1, 1,
1.120106, -0.4310296, 1.936542, 1, 1, 1, 1, 1,
1.125006, -0.0916084, 2.184203, 1, 1, 1, 1, 1,
1.137821, -0.7426783, 1.511582, 1, 1, 1, 1, 1,
1.141429, 0.148424, 2.01377, 1, 1, 1, 1, 1,
1.146808, 0.1121437, 1.493654, 1, 1, 1, 1, 1,
1.16064, 0.6339783, 0.2456028, 0, 0, 1, 1, 1,
1.161966, 0.8594748, -1.414415, 1, 0, 0, 1, 1,
1.164535, 0.5127941, 0.6669734, 1, 0, 0, 1, 1,
1.167599, 1.922565, 0.2787716, 1, 0, 0, 1, 1,
1.167925, 0.8519171, -0.1838913, 1, 0, 0, 1, 1,
1.168714, 0.6201017, 1.884889, 1, 0, 0, 1, 1,
1.180985, 2.174729, 1.255423, 0, 0, 0, 1, 1,
1.181798, -1.03054, 2.727663, 0, 0, 0, 1, 1,
1.19492, 1.011987, 2.787653, 0, 0, 0, 1, 1,
1.195292, -0.5669217, 3.42232, 0, 0, 0, 1, 1,
1.196961, 0.2650055, 1.520282, 0, 0, 0, 1, 1,
1.20151, 2.367326, 0.229761, 0, 0, 0, 1, 1,
1.205877, 0.857802, 0.4579651, 0, 0, 0, 1, 1,
1.207917, -1.534939, 3.06257, 1, 1, 1, 1, 1,
1.216429, -0.1691954, 2.200716, 1, 1, 1, 1, 1,
1.219773, -0.1928295, 0.4919791, 1, 1, 1, 1, 1,
1.227113, 0.05838504, 2.281203, 1, 1, 1, 1, 1,
1.227198, -0.1865068, 0.7915866, 1, 1, 1, 1, 1,
1.241976, 0.8643652, 2.831265, 1, 1, 1, 1, 1,
1.251526, -0.1076585, 0.9118642, 1, 1, 1, 1, 1,
1.252242, -1.188079, 2.543557, 1, 1, 1, 1, 1,
1.275725, -1.256331, 4.142194, 1, 1, 1, 1, 1,
1.27832, 0.2520726, 1.249613, 1, 1, 1, 1, 1,
1.284201, -1.101617, 2.108911, 1, 1, 1, 1, 1,
1.284347, 1.670769, 2.351121, 1, 1, 1, 1, 1,
1.292237, 2.254566, 1.068701, 1, 1, 1, 1, 1,
1.299789, -0.06276104, 2.423552, 1, 1, 1, 1, 1,
1.30391, 0.01637544, 1.689961, 1, 1, 1, 1, 1,
1.304279, 0.4870506, 2.149777, 0, 0, 1, 1, 1,
1.304867, -1.660032, 2.059436, 1, 0, 0, 1, 1,
1.311764, 0.1206059, 3.162616, 1, 0, 0, 1, 1,
1.318879, -0.1078303, 1.036129, 1, 0, 0, 1, 1,
1.326681, 0.6280761, 3.875043, 1, 0, 0, 1, 1,
1.329683, -0.01019236, 1.282377, 1, 0, 0, 1, 1,
1.330278, -0.1449744, 2.37774, 0, 0, 0, 1, 1,
1.355564, -0.6883629, 1.882596, 0, 0, 0, 1, 1,
1.357405, 0.9642677, 1.889779, 0, 0, 0, 1, 1,
1.360499, 2.615571, 0.1462846, 0, 0, 0, 1, 1,
1.365027, 0.2478544, 2.888798, 0, 0, 0, 1, 1,
1.365641, 1.767247, -0.4166382, 0, 0, 0, 1, 1,
1.370196, -0.2479191, 2.570881, 0, 0, 0, 1, 1,
1.394655, -0.4772411, 1.981347, 1, 1, 1, 1, 1,
1.397035, 0.6046461, 1.603046, 1, 1, 1, 1, 1,
1.404153, -1.43896, 2.81427, 1, 1, 1, 1, 1,
1.404429, -0.6089277, 2.341362, 1, 1, 1, 1, 1,
1.414453, 1.773675, 1.833028, 1, 1, 1, 1, 1,
1.423532, -2.626272, 2.105094, 1, 1, 1, 1, 1,
1.427443, 0.4221658, 1.152934, 1, 1, 1, 1, 1,
1.433851, 2.277047, 0.195364, 1, 1, 1, 1, 1,
1.442399, -0.4289998, 1.622488, 1, 1, 1, 1, 1,
1.442595, -0.06241547, 2.12022, 1, 1, 1, 1, 1,
1.446153, 0.3173909, 2.639147, 1, 1, 1, 1, 1,
1.452114, 1.569522, -0.4770935, 1, 1, 1, 1, 1,
1.490447, 0.4306923, 2.290678, 1, 1, 1, 1, 1,
1.50323, 0.2462728, 1.710028, 1, 1, 1, 1, 1,
1.511424, 0.5044882, 1.999202, 1, 1, 1, 1, 1,
1.517293, -0.6843784, 4.127912, 0, 0, 1, 1, 1,
1.522427, -0.2082606, 0.8767363, 1, 0, 0, 1, 1,
1.534179, -0.553662, 2.677578, 1, 0, 0, 1, 1,
1.536377, 0.8355746, 1.817044, 1, 0, 0, 1, 1,
1.542314, -1.967082, 1.119311, 1, 0, 0, 1, 1,
1.544332, 0.5900573, 1.51467, 1, 0, 0, 1, 1,
1.550783, 0.6460076, -0.002716488, 0, 0, 0, 1, 1,
1.558226, 0.5939975, 1.844304, 0, 0, 0, 1, 1,
1.560419, -0.9915966, 2.14358, 0, 0, 0, 1, 1,
1.56596, -0.253519, 1.582177, 0, 0, 0, 1, 1,
1.568194, -0.5938914, 2.360144, 0, 0, 0, 1, 1,
1.569156, 0.508391, 2.58007, 0, 0, 0, 1, 1,
1.569918, 0.3410884, -0.3639899, 0, 0, 0, 1, 1,
1.579793, -1.314097, 3.78028, 1, 1, 1, 1, 1,
1.579822, 0.5363652, 1.595609, 1, 1, 1, 1, 1,
1.584548, 0.8953052, 3.755378, 1, 1, 1, 1, 1,
1.601122, 0.1160821, 2.290849, 1, 1, 1, 1, 1,
1.608003, -0.3737645, 1.657609, 1, 1, 1, 1, 1,
1.611859, -0.7371668, 1.592256, 1, 1, 1, 1, 1,
1.625699, -1.164797, 2.143281, 1, 1, 1, 1, 1,
1.631587, -0.02376117, 1.884805, 1, 1, 1, 1, 1,
1.639155, 1.076839, 1.181126, 1, 1, 1, 1, 1,
1.64277, 0.4195292, 0.7735245, 1, 1, 1, 1, 1,
1.653546, 0.819257, 0.9457337, 1, 1, 1, 1, 1,
1.660644, -0.5967416, 1.491147, 1, 1, 1, 1, 1,
1.673107, -0.8819817, 2.226122, 1, 1, 1, 1, 1,
1.685323, 0.2033709, 2.889212, 1, 1, 1, 1, 1,
1.703469, 0.1119739, 0.6385322, 1, 1, 1, 1, 1,
1.707446, -0.9429343, 1.556038, 0, 0, 1, 1, 1,
1.712936, 0.2004164, 1.334573, 1, 0, 0, 1, 1,
1.720276, 0.6161474, 2.225038, 1, 0, 0, 1, 1,
1.723162, 0.4974718, -0.3879066, 1, 0, 0, 1, 1,
1.760938, 0.4986808, 2.201025, 1, 0, 0, 1, 1,
1.777268, -0.01050555, 1.090127, 1, 0, 0, 1, 1,
1.780106, -0.6413107, 1.283088, 0, 0, 0, 1, 1,
1.795467, 0.5668312, 2.651762, 0, 0, 0, 1, 1,
1.79787, -1.029207, 3.884891, 0, 0, 0, 1, 1,
1.798434, 0.2596743, 2.349733, 0, 0, 0, 1, 1,
1.802004, -0.489085, 1.378361, 0, 0, 0, 1, 1,
1.809659, -0.1556091, 0.4619634, 0, 0, 0, 1, 1,
1.812402, -0.0403498, 0.8340384, 0, 0, 0, 1, 1,
1.813227, -2.145477, 2.973675, 1, 1, 1, 1, 1,
1.821426, -1.38638, 1.127867, 1, 1, 1, 1, 1,
1.822479, 0.7995903, 0.6190004, 1, 1, 1, 1, 1,
1.825982, 0.4433132, 1.262317, 1, 1, 1, 1, 1,
1.854366, -0.2609617, 1.122609, 1, 1, 1, 1, 1,
1.863703, 0.8078985, 2.350785, 1, 1, 1, 1, 1,
1.865129, -0.04205868, 1.097546, 1, 1, 1, 1, 1,
1.885447, -0.009094539, 2.696498, 1, 1, 1, 1, 1,
1.90036, 0.2956396, 1.296299, 1, 1, 1, 1, 1,
1.912569, 1.381076, -0.3059456, 1, 1, 1, 1, 1,
1.92258, 0.08139896, 2.934476, 1, 1, 1, 1, 1,
1.928418, 0.7484015, 2.102568, 1, 1, 1, 1, 1,
1.93608, 0.9588704, 1.261586, 1, 1, 1, 1, 1,
1.937984, -0.603525, 2.03395, 1, 1, 1, 1, 1,
1.994481, -0.2553263, 0.3383175, 1, 1, 1, 1, 1,
2.028411, -1.042558, 3.419437, 0, 0, 1, 1, 1,
2.038761, -0.7033645, 1.425047, 1, 0, 0, 1, 1,
2.041139, -0.3816681, 1.235356, 1, 0, 0, 1, 1,
2.06747, 0.4007254, 1.146323, 1, 0, 0, 1, 1,
2.080834, 0.1020593, 2.742676, 1, 0, 0, 1, 1,
2.083392, -0.6048316, 1.959461, 1, 0, 0, 1, 1,
2.237254, -0.5635443, 0.676808, 0, 0, 0, 1, 1,
2.255722, -1.226075, 3.007483, 0, 0, 0, 1, 1,
2.315989, -0.2539879, 1.525032, 0, 0, 0, 1, 1,
2.328894, 1.911607, 1.820658, 0, 0, 0, 1, 1,
2.337413, -0.8220639, 2.450002, 0, 0, 0, 1, 1,
2.348734, -1.8863, 3.694289, 0, 0, 0, 1, 1,
2.358312, -1.186196, 1.831458, 0, 0, 0, 1, 1,
2.367097, 0.2133812, 0.6783833, 1, 1, 1, 1, 1,
2.369608, -1.306738, 2.556723, 1, 1, 1, 1, 1,
2.382034, -0.5157943, 2.749053, 1, 1, 1, 1, 1,
2.392224, 0.7008017, 0.4654033, 1, 1, 1, 1, 1,
2.447536, -1.504287, 1.464576, 1, 1, 1, 1, 1,
2.494202, -1.087262, 1.826573, 1, 1, 1, 1, 1,
2.748698, 0.1118378, 0.5124254, 1, 1, 1, 1, 1
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
var radius = 9.136399;
var distance = 32.09121;
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
mvMatrix.translate( 0.194007, -0.09216654, 0.1870561 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.09121);
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
