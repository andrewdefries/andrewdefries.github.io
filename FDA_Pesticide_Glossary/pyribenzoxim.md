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
-3.142131, 0.7191362, -1.134158, 1, 0, 0, 1,
-2.937776, 1.474117, -2.185809, 1, 0.007843138, 0, 1,
-2.823354, -1.748112, -1.688857, 1, 0.01176471, 0, 1,
-2.812449, 1.429143, 0.7024446, 1, 0.01960784, 0, 1,
-2.646394, -0.9642414, -0.6146101, 1, 0.02352941, 0, 1,
-2.546231, 0.8728656, -1.893906, 1, 0.03137255, 0, 1,
-2.519996, -0.9449414, -2.639964, 1, 0.03529412, 0, 1,
-2.518777, 0.3271445, -1.853721, 1, 0.04313726, 0, 1,
-2.47029, -1.093339, 0.1870011, 1, 0.04705882, 0, 1,
-2.396948, 1.633472, 1.670208, 1, 0.05490196, 0, 1,
-2.391786, 0.9233087, -1.053162, 1, 0.05882353, 0, 1,
-2.334325, 1.015275, -0.1401399, 1, 0.06666667, 0, 1,
-2.262203, 1.649281, -2.046015, 1, 0.07058824, 0, 1,
-2.253533, 0.7746919, 0.5685854, 1, 0.07843138, 0, 1,
-2.226085, -0.6079956, -3.929591, 1, 0.08235294, 0, 1,
-2.219386, 0.3652472, -2.141769, 1, 0.09019608, 0, 1,
-2.198028, -0.324862, -0.6820778, 1, 0.09411765, 0, 1,
-2.182886, -1.267848, -3.6402, 1, 0.1019608, 0, 1,
-2.181046, -0.06215623, -1.148271, 1, 0.1098039, 0, 1,
-2.137929, 1.351043, -1.263014, 1, 0.1137255, 0, 1,
-2.115592, 0.1004395, 0.02812196, 1, 0.1215686, 0, 1,
-2.102617, 0.8264673, -0.4800246, 1, 0.1254902, 0, 1,
-2.057046, -0.8716924, -0.1166756, 1, 0.1333333, 0, 1,
-2.036571, 0.3533488, -0.9509382, 1, 0.1372549, 0, 1,
-2.012237, -0.5996137, -0.3405572, 1, 0.145098, 0, 1,
-2.008485, -0.8031331, -2.051138, 1, 0.1490196, 0, 1,
-1.96646, 2.425084, 0.2727427, 1, 0.1568628, 0, 1,
-1.965339, -0.2994727, -1.611298, 1, 0.1607843, 0, 1,
-1.944901, 1.261198, -1.66555, 1, 0.1686275, 0, 1,
-1.924021, 0.2026316, 0.03792739, 1, 0.172549, 0, 1,
-1.914029, -0.2767779, -1.278902, 1, 0.1803922, 0, 1,
-1.913206, 1.303495, 0.7908853, 1, 0.1843137, 0, 1,
-1.899964, -1.619302, -2.47081, 1, 0.1921569, 0, 1,
-1.873202, 0.9932151, -1.572307, 1, 0.1960784, 0, 1,
-1.870715, -0.36098, -1.964703, 1, 0.2039216, 0, 1,
-1.830299, 0.3437545, -0.878458, 1, 0.2117647, 0, 1,
-1.811632, 1.244498, -0.9851126, 1, 0.2156863, 0, 1,
-1.792755, -1.920445, -3.892222, 1, 0.2235294, 0, 1,
-1.787265, 0.8556308, -0.1028408, 1, 0.227451, 0, 1,
-1.77215, 1.059496, -0.9832008, 1, 0.2352941, 0, 1,
-1.769786, -0.2547498, -0.7289344, 1, 0.2392157, 0, 1,
-1.768384, 0.6649302, -2.826644, 1, 0.2470588, 0, 1,
-1.706436, -0.264782, -3.169932, 1, 0.2509804, 0, 1,
-1.7002, 1.049735, 0.2747843, 1, 0.2588235, 0, 1,
-1.685943, -0.02283797, -1.548907, 1, 0.2627451, 0, 1,
-1.681455, 1.304416, 0.1517307, 1, 0.2705882, 0, 1,
-1.644893, 2.288255, -0.8224134, 1, 0.2745098, 0, 1,
-1.641469, 0.3305427, -1.07713, 1, 0.282353, 0, 1,
-1.630455, -0.4833253, -1.008298, 1, 0.2862745, 0, 1,
-1.622793, 0.8589067, -2.512137, 1, 0.2941177, 0, 1,
-1.620711, -0.9418514, -2.314443, 1, 0.3019608, 0, 1,
-1.598687, 1.486467, -1.653335, 1, 0.3058824, 0, 1,
-1.582145, 0.9150964, -0.2614219, 1, 0.3137255, 0, 1,
-1.580897, -1.334055, -2.478309, 1, 0.3176471, 0, 1,
-1.556342, 1.120994, -0.592944, 1, 0.3254902, 0, 1,
-1.554463, -0.4079419, -1.82128, 1, 0.3294118, 0, 1,
-1.553082, -1.817012, -2.900443, 1, 0.3372549, 0, 1,
-1.533783, 1.256082, -1.574975, 1, 0.3411765, 0, 1,
-1.526339, -0.9038885, -2.869781, 1, 0.3490196, 0, 1,
-1.523645, 0.90545, -1.709468, 1, 0.3529412, 0, 1,
-1.516259, 0.5588192, -0.166981, 1, 0.3607843, 0, 1,
-1.508426, 1.107123, -1.059844, 1, 0.3647059, 0, 1,
-1.505226, 0.1960362, -2.298047, 1, 0.372549, 0, 1,
-1.49035, -1.932598, -2.178928, 1, 0.3764706, 0, 1,
-1.48968, 1.730905, -1.617212, 1, 0.3843137, 0, 1,
-1.484514, -1.488467, -3.266821, 1, 0.3882353, 0, 1,
-1.47922, 0.1217947, -2.312475, 1, 0.3960784, 0, 1,
-1.473733, -0.9169591, -1.623282, 1, 0.4039216, 0, 1,
-1.473651, -0.5724556, -0.5672508, 1, 0.4078431, 0, 1,
-1.46975, -1.51903, -2.864538, 1, 0.4156863, 0, 1,
-1.462005, -0.9348831, -1.466374, 1, 0.4196078, 0, 1,
-1.458626, 0.8291529, 0.2986148, 1, 0.427451, 0, 1,
-1.45289, 0.1570003, 0.5172418, 1, 0.4313726, 0, 1,
-1.443908, -0.6592618, -2.196939, 1, 0.4392157, 0, 1,
-1.44086, 1.556845, -1.523843, 1, 0.4431373, 0, 1,
-1.437767, 0.3275693, -1.666833, 1, 0.4509804, 0, 1,
-1.433637, -0.6533852, -2.295641, 1, 0.454902, 0, 1,
-1.425204, 1.066394, -1.720943, 1, 0.4627451, 0, 1,
-1.417204, 0.8041263, -1.136097, 1, 0.4666667, 0, 1,
-1.414892, -0.3145934, -2.859212, 1, 0.4745098, 0, 1,
-1.400928, -0.601087, -2.941021, 1, 0.4784314, 0, 1,
-1.394167, 0.7400718, 0.9368755, 1, 0.4862745, 0, 1,
-1.390254, -0.5585318, -2.737724, 1, 0.4901961, 0, 1,
-1.385939, -0.5549824, -0.8845289, 1, 0.4980392, 0, 1,
-1.380129, -1.111623, -2.178081, 1, 0.5058824, 0, 1,
-1.376427, 0.09271338, -0.5929118, 1, 0.509804, 0, 1,
-1.371609, -0.8832108, -1.015322, 1, 0.5176471, 0, 1,
-1.370078, 0.6830708, -2.117719, 1, 0.5215687, 0, 1,
-1.365027, -0.1415037, 0.8453506, 1, 0.5294118, 0, 1,
-1.36449, -0.9018567, -1.704293, 1, 0.5333334, 0, 1,
-1.357526, -0.564212, -2.773615, 1, 0.5411765, 0, 1,
-1.351465, 1.32453, -0.8127801, 1, 0.5450981, 0, 1,
-1.349539, -0.9444126, -2.693231, 1, 0.5529412, 0, 1,
-1.347722, 1.310331, 0.9264775, 1, 0.5568628, 0, 1,
-1.344224, -1.106058, -2.120888, 1, 0.5647059, 0, 1,
-1.339569, 0.5331068, -2.045793, 1, 0.5686275, 0, 1,
-1.336323, -1.878364, -1.911092, 1, 0.5764706, 0, 1,
-1.333051, 1.737261, -0.9294489, 1, 0.5803922, 0, 1,
-1.33193, 0.5131614, -2.110493, 1, 0.5882353, 0, 1,
-1.327704, 0.6576387, -0.4311535, 1, 0.5921569, 0, 1,
-1.320923, 0.9017919, -0.2815182, 1, 0.6, 0, 1,
-1.291346, 0.1077012, -0.1606057, 1, 0.6078432, 0, 1,
-1.281567, 0.9069642, -2.384512, 1, 0.6117647, 0, 1,
-1.280903, 0.4438089, -0.4857766, 1, 0.6196079, 0, 1,
-1.28014, -0.8712748, -5.215797, 1, 0.6235294, 0, 1,
-1.272898, -0.6176321, -2.497839, 1, 0.6313726, 0, 1,
-1.268214, 0.1736493, -0.07835556, 1, 0.6352941, 0, 1,
-1.266528, 1.723429, -0.1127659, 1, 0.6431373, 0, 1,
-1.265267, 0.5316334, -1.528531, 1, 0.6470588, 0, 1,
-1.248941, -0.9338257, -2.318779, 1, 0.654902, 0, 1,
-1.248479, 0.7502499, -2.193756, 1, 0.6588235, 0, 1,
-1.234418, -1.259513, -1.209815, 1, 0.6666667, 0, 1,
-1.21876, 1.002818, -1.523293, 1, 0.6705883, 0, 1,
-1.21189, 0.6357849, -2.078564, 1, 0.6784314, 0, 1,
-1.205537, 0.6421351, -2.649178, 1, 0.682353, 0, 1,
-1.20423, 0.1641585, -2.112708, 1, 0.6901961, 0, 1,
-1.203123, -2.54444, -2.787512, 1, 0.6941177, 0, 1,
-1.195614, 1.734153, -0.4357597, 1, 0.7019608, 0, 1,
-1.193799, 0.3326362, -1.857218, 1, 0.7098039, 0, 1,
-1.188322, -0.352387, -1.685812, 1, 0.7137255, 0, 1,
-1.184474, 2.060102, -0.3195509, 1, 0.7215686, 0, 1,
-1.181801, -1.339202, -0.3527687, 1, 0.7254902, 0, 1,
-1.17212, -0.8646291, -1.60883, 1, 0.7333333, 0, 1,
-1.164398, 0.8682704, -2.004987, 1, 0.7372549, 0, 1,
-1.157207, -0.7749397, -0.07367389, 1, 0.7450981, 0, 1,
-1.155787, 0.6615336, -1.597594, 1, 0.7490196, 0, 1,
-1.154476, 1.378706, -0.08662952, 1, 0.7568628, 0, 1,
-1.14776, 0.07316986, -0.7348535, 1, 0.7607843, 0, 1,
-1.137758, 0.06358432, -2.265681, 1, 0.7686275, 0, 1,
-1.136906, -0.3308291, -2.740406, 1, 0.772549, 0, 1,
-1.129326, -0.1841945, -0.5181727, 1, 0.7803922, 0, 1,
-1.125344, -0.0286334, -1.163545, 1, 0.7843137, 0, 1,
-1.112443, -0.3467019, -0.6651295, 1, 0.7921569, 0, 1,
-1.107521, -0.006555041, -1.67527, 1, 0.7960784, 0, 1,
-1.106815, 0.5572525, -2.388496, 1, 0.8039216, 0, 1,
-1.10655, -0.4846391, -0.9041095, 1, 0.8117647, 0, 1,
-1.102719, -0.743745, -3.831351, 1, 0.8156863, 0, 1,
-1.100651, -0.3557068, -2.472221, 1, 0.8235294, 0, 1,
-1.100415, -0.09644645, -1.118095, 1, 0.827451, 0, 1,
-1.098075, -0.6380234, -1.976274, 1, 0.8352941, 0, 1,
-1.097219, 1.724058, -0.8594537, 1, 0.8392157, 0, 1,
-1.093026, 1.14172, 0.4964385, 1, 0.8470588, 0, 1,
-1.089378, -0.4873404, -3.546423, 1, 0.8509804, 0, 1,
-1.08802, 0.7440221, -2.471811, 1, 0.8588235, 0, 1,
-1.082884, -0.02942326, -1.328688, 1, 0.8627451, 0, 1,
-1.076444, -0.522441, -1.604154, 1, 0.8705882, 0, 1,
-1.07139, -0.5619933, -2.68967, 1, 0.8745098, 0, 1,
-1.066371, -0.5032663, -1.751715, 1, 0.8823529, 0, 1,
-1.062681, -0.3584209, -2.554919, 1, 0.8862745, 0, 1,
-1.060966, -0.5115321, -2.186406, 1, 0.8941177, 0, 1,
-1.042688, -0.3670049, -2.347471, 1, 0.8980392, 0, 1,
-1.041951, 0.8974966, -0.6625295, 1, 0.9058824, 0, 1,
-1.038964, -2.147824, -3.974428, 1, 0.9137255, 0, 1,
-1.034358, -0.9473099, -0.8891938, 1, 0.9176471, 0, 1,
-1.022754, -1.282136, -2.836752, 1, 0.9254902, 0, 1,
-1.018708, -0.1109179, -2.133421, 1, 0.9294118, 0, 1,
-1.004601, 0.3838632, -2.169377, 1, 0.9372549, 0, 1,
-0.9999834, -1.925539, -3.774359, 1, 0.9411765, 0, 1,
-0.9995377, 2.383227, -1.744769, 1, 0.9490196, 0, 1,
-0.9954838, 0.4757814, -0.7540754, 1, 0.9529412, 0, 1,
-0.9928298, 0.4042197, -0.6473091, 1, 0.9607843, 0, 1,
-0.9872714, -0.3114016, -2.390621, 1, 0.9647059, 0, 1,
-0.976132, -0.655708, -2.426819, 1, 0.972549, 0, 1,
-0.9662172, -2.090255, -2.351398, 1, 0.9764706, 0, 1,
-0.9651978, 0.7928109, -2.460151, 1, 0.9843137, 0, 1,
-0.959896, 0.07892121, -2.03663, 1, 0.9882353, 0, 1,
-0.9416826, -0.2088244, -1.72848, 1, 0.9960784, 0, 1,
-0.9217316, -2.122419, -3.693244, 0.9960784, 1, 0, 1,
-0.9207563, 0.5948685, -1.844825, 0.9921569, 1, 0, 1,
-0.9032677, -0.6056653, -1.189911, 0.9843137, 1, 0, 1,
-0.9004438, -1.051411, 0.8656117, 0.9803922, 1, 0, 1,
-0.9002244, -0.1594908, -1.337658, 0.972549, 1, 0, 1,
-0.8870603, -1.562966, -2.502889, 0.9686275, 1, 0, 1,
-0.8846975, -1.035864, -2.9099, 0.9607843, 1, 0, 1,
-0.879703, -0.08416151, -2.492491, 0.9568627, 1, 0, 1,
-0.8776606, -0.3658704, -1.866581, 0.9490196, 1, 0, 1,
-0.8699133, 0.550785, 1.026116, 0.945098, 1, 0, 1,
-0.8694295, -0.9929104, -1.427116, 0.9372549, 1, 0, 1,
-0.8615074, 2.003114, -1.46145, 0.9333333, 1, 0, 1,
-0.8602256, 0.4404643, -1.398713, 0.9254902, 1, 0, 1,
-0.8543262, -0.2224661, -3.970496, 0.9215686, 1, 0, 1,
-0.8519967, -0.08289769, -2.694818, 0.9137255, 1, 0, 1,
-0.8503049, 2.862467, -0.9721658, 0.9098039, 1, 0, 1,
-0.8495656, -0.2549338, -1.97185, 0.9019608, 1, 0, 1,
-0.8494497, 1.58434, 0.1741605, 0.8941177, 1, 0, 1,
-0.8461368, 0.1373582, -1.550491, 0.8901961, 1, 0, 1,
-0.8430865, -0.01605531, -2.854567, 0.8823529, 1, 0, 1,
-0.8419402, -1.595388, -3.5956, 0.8784314, 1, 0, 1,
-0.836561, -0.3640198, -2.19205, 0.8705882, 1, 0, 1,
-0.8348429, -0.4229798, -2.084885, 0.8666667, 1, 0, 1,
-0.8326041, 3.020876, 1.24564, 0.8588235, 1, 0, 1,
-0.830777, -0.2596727, -2.284528, 0.854902, 1, 0, 1,
-0.8188863, 0.3438679, -2.54674, 0.8470588, 1, 0, 1,
-0.8149589, 0.6743459, -0.7757351, 0.8431373, 1, 0, 1,
-0.8085327, 0.2571459, -1.329845, 0.8352941, 1, 0, 1,
-0.8075441, -0.9606342, -1.094542, 0.8313726, 1, 0, 1,
-0.8057053, -0.5664512, -1.993386, 0.8235294, 1, 0, 1,
-0.8042791, -0.3966494, -3.177832, 0.8196079, 1, 0, 1,
-0.7991735, -1.447824, -1.719507, 0.8117647, 1, 0, 1,
-0.7983753, -0.7712467, -1.931298, 0.8078431, 1, 0, 1,
-0.791044, -0.3740942, -1.829425, 0.8, 1, 0, 1,
-0.7852797, -0.663332, -3.092394, 0.7921569, 1, 0, 1,
-0.7851867, -0.5731229, -2.37185, 0.7882353, 1, 0, 1,
-0.7831117, -0.8430911, -1.220506, 0.7803922, 1, 0, 1,
-0.7821878, 0.1861054, -1.394659, 0.7764706, 1, 0, 1,
-0.7728156, -1.813073, -2.345491, 0.7686275, 1, 0, 1,
-0.7710652, 1.910512, -1.445191, 0.7647059, 1, 0, 1,
-0.7691509, 0.6822247, -1.634167, 0.7568628, 1, 0, 1,
-0.7660161, -0.8193936, -1.569157, 0.7529412, 1, 0, 1,
-0.7640125, -0.4478864, -1.657796, 0.7450981, 1, 0, 1,
-0.7635288, 0.06329097, -1.94034, 0.7411765, 1, 0, 1,
-0.7630506, 0.4637037, -0.5559867, 0.7333333, 1, 0, 1,
-0.75777, 0.7279937, -0.9874381, 0.7294118, 1, 0, 1,
-0.7487483, -0.3451481, -0.3540938, 0.7215686, 1, 0, 1,
-0.7417052, 0.1311426, -2.09508, 0.7176471, 1, 0, 1,
-0.7410197, 1.673546, -0.1148166, 0.7098039, 1, 0, 1,
-0.7395246, -0.8622329, -2.850045, 0.7058824, 1, 0, 1,
-0.7373725, 0.08428959, -1.311594, 0.6980392, 1, 0, 1,
-0.7367696, -0.3691962, -4.285219, 0.6901961, 1, 0, 1,
-0.7334193, 2.407371, -0.540649, 0.6862745, 1, 0, 1,
-0.7303742, -0.6228534, -1.836861, 0.6784314, 1, 0, 1,
-0.7299681, -1.084542, -0.6606737, 0.6745098, 1, 0, 1,
-0.727649, 0.6460459, -1.927821, 0.6666667, 1, 0, 1,
-0.7265211, -0.7997341, -0.9360051, 0.6627451, 1, 0, 1,
-0.7264008, 0.1405369, -1.199806, 0.654902, 1, 0, 1,
-0.7261285, 0.6858465, -1.334133, 0.6509804, 1, 0, 1,
-0.7241352, 0.9576913, 1.457383, 0.6431373, 1, 0, 1,
-0.7232726, -0.476885, -2.174171, 0.6392157, 1, 0, 1,
-0.7217337, 1.961306, -1.052089, 0.6313726, 1, 0, 1,
-0.720762, -1.935552, -2.488936, 0.627451, 1, 0, 1,
-0.7195719, -0.5289807, -2.399112, 0.6196079, 1, 0, 1,
-0.7139855, -1.268291, -2.809084, 0.6156863, 1, 0, 1,
-0.7126216, -1.614277, -3.526513, 0.6078432, 1, 0, 1,
-0.7122304, -0.3095823, -0.8691882, 0.6039216, 1, 0, 1,
-0.7104809, -0.8309853, -2.249068, 0.5960785, 1, 0, 1,
-0.7095703, -1.01678, -2.730502, 0.5882353, 1, 0, 1,
-0.7068655, -1.073409, -4.810158, 0.5843138, 1, 0, 1,
-0.7016078, 0.1518136, -0.7036629, 0.5764706, 1, 0, 1,
-0.6976757, 0.1931121, -2.86089, 0.572549, 1, 0, 1,
-0.6947715, -0.249229, -2.627149, 0.5647059, 1, 0, 1,
-0.6933402, 0.5624843, -1.244084, 0.5607843, 1, 0, 1,
-0.6930384, -0.9720346, -2.695148, 0.5529412, 1, 0, 1,
-0.6870595, -0.4368472, -1.520301, 0.5490196, 1, 0, 1,
-0.6833888, -0.3187267, -2.254778, 0.5411765, 1, 0, 1,
-0.6798861, -0.2917382, -0.794894, 0.5372549, 1, 0, 1,
-0.6792668, 0.0196653, -0.8067517, 0.5294118, 1, 0, 1,
-0.6782774, -1.350355, -2.43357, 0.5254902, 1, 0, 1,
-0.6771301, 0.6409472, -1.683951, 0.5176471, 1, 0, 1,
-0.6735208, 1.051946, 0.2519599, 0.5137255, 1, 0, 1,
-0.6718042, -1.849798, -2.606616, 0.5058824, 1, 0, 1,
-0.6694641, -1.709927, -3.32398, 0.5019608, 1, 0, 1,
-0.6693956, -0.5064716, -2.259767, 0.4941176, 1, 0, 1,
-0.6676069, 0.1491663, -1.236565, 0.4862745, 1, 0, 1,
-0.6628507, 0.3835831, 0.3205861, 0.4823529, 1, 0, 1,
-0.6602451, 0.3033319, -1.594871, 0.4745098, 1, 0, 1,
-0.6574432, 0.2245898, -3.350955, 0.4705882, 1, 0, 1,
-0.6546218, -0.6091027, -1.381381, 0.4627451, 1, 0, 1,
-0.6498012, 0.7440185, -0.6534665, 0.4588235, 1, 0, 1,
-0.6444439, -0.4906479, -1.865912, 0.4509804, 1, 0, 1,
-0.6433089, 0.02663019, -1.435632, 0.4470588, 1, 0, 1,
-0.6329979, -0.0246375, -1.506604, 0.4392157, 1, 0, 1,
-0.6315634, -1.297006, -3.501917, 0.4352941, 1, 0, 1,
-0.6220042, -1.252768, -4.910022, 0.427451, 1, 0, 1,
-0.6158377, -0.04333203, -2.716027, 0.4235294, 1, 0, 1,
-0.6092818, 1.108086, -1.048289, 0.4156863, 1, 0, 1,
-0.6086379, -0.177189, -1.78896, 0.4117647, 1, 0, 1,
-0.6075822, -0.01944871, -2.162896, 0.4039216, 1, 0, 1,
-0.6055599, -1.159818, -2.321359, 0.3960784, 1, 0, 1,
-0.6055598, -2.661718, -3.220368, 0.3921569, 1, 0, 1,
-0.6050956, 0.7079974, -1.065555, 0.3843137, 1, 0, 1,
-0.6037686, -0.6149628, -2.551486, 0.3803922, 1, 0, 1,
-0.6030829, -0.6460056, -1.970335, 0.372549, 1, 0, 1,
-0.5968483, 0.6505159, -0.3709585, 0.3686275, 1, 0, 1,
-0.5901962, -0.9716974, -1.74815, 0.3607843, 1, 0, 1,
-0.5889048, 1.573854, 1.147689, 0.3568628, 1, 0, 1,
-0.5880417, -1.640387, -2.378181, 0.3490196, 1, 0, 1,
-0.5853283, 0.2633401, -1.801021, 0.345098, 1, 0, 1,
-0.5846165, -0.9225439, -4.182193, 0.3372549, 1, 0, 1,
-0.5789123, -0.4672516, -3.069971, 0.3333333, 1, 0, 1,
-0.5731097, 0.4315473, -1.349573, 0.3254902, 1, 0, 1,
-0.5730496, 2.212804, -0.8058714, 0.3215686, 1, 0, 1,
-0.5727895, -0.5877246, -1.702698, 0.3137255, 1, 0, 1,
-0.5656266, -0.3709736, -1.732653, 0.3098039, 1, 0, 1,
-0.5634128, 1.769005, -0.1404641, 0.3019608, 1, 0, 1,
-0.561415, -0.1076498, -0.4141215, 0.2941177, 1, 0, 1,
-0.5596581, 0.272067, -2.735906, 0.2901961, 1, 0, 1,
-0.5596285, -0.1898921, -2.757595, 0.282353, 1, 0, 1,
-0.5588736, 0.07520834, -1.142918, 0.2784314, 1, 0, 1,
-0.5564484, 0.5574344, 0.592017, 0.2705882, 1, 0, 1,
-0.5562277, 0.4467913, -1.634586, 0.2666667, 1, 0, 1,
-0.5508597, 0.9645587, -1.026947, 0.2588235, 1, 0, 1,
-0.5493148, 0.5077429, -0.3109003, 0.254902, 1, 0, 1,
-0.5466398, 1.087279, -0.7971128, 0.2470588, 1, 0, 1,
-0.545362, -0.4846101, -4.34445, 0.2431373, 1, 0, 1,
-0.5359809, -1.150897, -3.287822, 0.2352941, 1, 0, 1,
-0.5333208, 1.030351, 0.4617413, 0.2313726, 1, 0, 1,
-0.5319904, 1.988337, -0.1424203, 0.2235294, 1, 0, 1,
-0.5293522, 0.2903827, -1.101783, 0.2196078, 1, 0, 1,
-0.5289374, -0.323159, -2.506125, 0.2117647, 1, 0, 1,
-0.5255541, 1.568285, -1.006923, 0.2078431, 1, 0, 1,
-0.5223581, -0.2482128, -3.366482, 0.2, 1, 0, 1,
-0.5123642, -0.6904044, -0.2902077, 0.1921569, 1, 0, 1,
-0.508705, 0.1608239, -2.49805, 0.1882353, 1, 0, 1,
-0.5082542, -3.062667, -2.765544, 0.1803922, 1, 0, 1,
-0.5075423, 0.915226, 1.247926, 0.1764706, 1, 0, 1,
-0.4917974, 1.384008, 1.272558, 0.1686275, 1, 0, 1,
-0.4913164, -0.4145064, -0.05125883, 0.1647059, 1, 0, 1,
-0.4827999, 0.663395, -0.04936371, 0.1568628, 1, 0, 1,
-0.4782417, 0.1368286, -0.6019789, 0.1529412, 1, 0, 1,
-0.4755031, -1.147098, -2.466019, 0.145098, 1, 0, 1,
-0.4753183, 0.7485397, -0.5194361, 0.1411765, 1, 0, 1,
-0.4725412, -1.98752, -4.113842, 0.1333333, 1, 0, 1,
-0.4724359, -1.461167, -3.020522, 0.1294118, 1, 0, 1,
-0.4696769, 0.4228095, -0.2009316, 0.1215686, 1, 0, 1,
-0.4686424, 0.05090757, -0.0485058, 0.1176471, 1, 0, 1,
-0.4618652, -1.331472, -2.509862, 0.1098039, 1, 0, 1,
-0.460929, 1.911217, -1.045507, 0.1058824, 1, 0, 1,
-0.4601306, -0.588109, -3.422072, 0.09803922, 1, 0, 1,
-0.4594854, -0.2208961, -1.809467, 0.09019608, 1, 0, 1,
-0.4574646, -0.9824725, -1.796591, 0.08627451, 1, 0, 1,
-0.4571218, 0.610175, -0.5574586, 0.07843138, 1, 0, 1,
-0.4545248, -0.6960659, -3.873471, 0.07450981, 1, 0, 1,
-0.4464325, -2.084933, -0.9053496, 0.06666667, 1, 0, 1,
-0.4423067, -0.2694598, -2.344439, 0.0627451, 1, 0, 1,
-0.4418325, 0.8734396, 0.3827665, 0.05490196, 1, 0, 1,
-0.4382087, -1.008879, -3.327969, 0.05098039, 1, 0, 1,
-0.4377256, -1.490136, -2.719738, 0.04313726, 1, 0, 1,
-0.4347252, -1.131358, -3.759698, 0.03921569, 1, 0, 1,
-0.4333608, 0.1281738, 0.4275617, 0.03137255, 1, 0, 1,
-0.4278981, 0.1828141, -1.111158, 0.02745098, 1, 0, 1,
-0.4248933, -0.2750499, -0.03377462, 0.01960784, 1, 0, 1,
-0.4196333, -0.0150239, -1.478526, 0.01568628, 1, 0, 1,
-0.4186049, -0.9828984, -3.273947, 0.007843138, 1, 0, 1,
-0.4122584, 0.2400909, -0.2699161, 0.003921569, 1, 0, 1,
-0.4094506, 0.2601084, -1.547415, 0, 1, 0.003921569, 1,
-0.409117, 0.3973795, -1.372742, 0, 1, 0.01176471, 1,
-0.4086172, -0.7185473, -3.35643, 0, 1, 0.01568628, 1,
-0.4043579, -1.622095, -0.5941468, 0, 1, 0.02352941, 1,
-0.4038311, -1.569206, -5.062306, 0, 1, 0.02745098, 1,
-0.4013407, -0.6946273, -2.199142, 0, 1, 0.03529412, 1,
-0.4012367, 0.3354393, -1.306922, 0, 1, 0.03921569, 1,
-0.3982738, -0.9252999, -1.677892, 0, 1, 0.04705882, 1,
-0.3981106, 1.447123, 0.7506594, 0, 1, 0.05098039, 1,
-0.3979169, 1.275057, 1.041625, 0, 1, 0.05882353, 1,
-0.3888467, 1.034855, 0.3271537, 0, 1, 0.0627451, 1,
-0.3845499, -0.1669011, -1.825953, 0, 1, 0.07058824, 1,
-0.3825755, 0.31477, -0.7973258, 0, 1, 0.07450981, 1,
-0.382092, 0.8167831, -0.1091582, 0, 1, 0.08235294, 1,
-0.3820402, -0.7415987, -3.337179, 0, 1, 0.08627451, 1,
-0.3796958, -0.1817193, -3.319027, 0, 1, 0.09411765, 1,
-0.379657, 0.5478239, 0.5921777, 0, 1, 0.1019608, 1,
-0.3779899, 0.3008569, 0.3545141, 0, 1, 0.1058824, 1,
-0.3762623, -1.657971, -4.884806, 0, 1, 0.1137255, 1,
-0.3758985, -0.8896878, -1.84516, 0, 1, 0.1176471, 1,
-0.3727825, -0.5752549, -3.082774, 0, 1, 0.1254902, 1,
-0.3713709, -0.6121342, -2.938888, 0, 1, 0.1294118, 1,
-0.3707228, 0.4287198, -0.6351169, 0, 1, 0.1372549, 1,
-0.3699086, -1.705776, -2.466305, 0, 1, 0.1411765, 1,
-0.3643488, 1.462411, -0.9494815, 0, 1, 0.1490196, 1,
-0.3612252, 1.160656, -0.53854, 0, 1, 0.1529412, 1,
-0.3605196, 2.098675, -1.811789, 0, 1, 0.1607843, 1,
-0.352989, -0.520439, -1.954399, 0, 1, 0.1647059, 1,
-0.3527434, 0.01334976, -1.093538, 0, 1, 0.172549, 1,
-0.3516118, -0.5384645, -3.404234, 0, 1, 0.1764706, 1,
-0.3496205, 0.5808721, 0.09747252, 0, 1, 0.1843137, 1,
-0.3484405, -0.3999825, -1.532049, 0, 1, 0.1882353, 1,
-0.3446168, 0.9796785, 0.07354801, 0, 1, 0.1960784, 1,
-0.3434114, -1.64806, -1.265907, 0, 1, 0.2039216, 1,
-0.3402007, 0.8105008, 0.2097492, 0, 1, 0.2078431, 1,
-0.3327984, -1.09967, -2.41836, 0, 1, 0.2156863, 1,
-0.3301688, 1.21358, 0.6096845, 0, 1, 0.2196078, 1,
-0.3284348, -1.566324, -4.564635, 0, 1, 0.227451, 1,
-0.3264905, -0.2924535, -2.747702, 0, 1, 0.2313726, 1,
-0.315197, -0.9901139, -2.682477, 0, 1, 0.2392157, 1,
-0.3146368, 0.3297932, 1.601434, 0, 1, 0.2431373, 1,
-0.3105516, -0.2129987, -2.388908, 0, 1, 0.2509804, 1,
-0.3077971, -0.1601753, -2.769329, 0, 1, 0.254902, 1,
-0.3072911, -0.5376743, -1.823225, 0, 1, 0.2627451, 1,
-0.3022759, 0.0495301, -0.6466264, 0, 1, 0.2666667, 1,
-0.3007821, 0.5368321, 0.06076726, 0, 1, 0.2745098, 1,
-0.3002874, -0.2286233, -3.383816, 0, 1, 0.2784314, 1,
-0.294693, 2.147198, 1.628123, 0, 1, 0.2862745, 1,
-0.2927209, -1.551798, -3.214063, 0, 1, 0.2901961, 1,
-0.2888822, 1.239468, -1.37986, 0, 1, 0.2980392, 1,
-0.2875117, 1.443136, 0.4674423, 0, 1, 0.3058824, 1,
-0.287005, 0.649168, 1.415639, 0, 1, 0.3098039, 1,
-0.2832321, 0.1872967, -0.4766492, 0, 1, 0.3176471, 1,
-0.2758282, -0.29567, -1.844858, 0, 1, 0.3215686, 1,
-0.2757761, 2.011186, 1.072288, 0, 1, 0.3294118, 1,
-0.2709505, -0.09782171, -2.169718, 0, 1, 0.3333333, 1,
-0.266637, 0.3313738, 0.4142005, 0, 1, 0.3411765, 1,
-0.2590648, -0.2015116, -1.181276, 0, 1, 0.345098, 1,
-0.2575976, -0.2757681, -2.391903, 0, 1, 0.3529412, 1,
-0.2571022, 1.499271, -0.02299013, 0, 1, 0.3568628, 1,
-0.2560126, -0.2271585, -2.937836, 0, 1, 0.3647059, 1,
-0.2547269, 0.8982381, -0.8633363, 0, 1, 0.3686275, 1,
-0.2546346, -1.533547, -3.876389, 0, 1, 0.3764706, 1,
-0.2523383, -0.02771709, -2.988243, 0, 1, 0.3803922, 1,
-0.2498953, -0.9477089, -1.164748, 0, 1, 0.3882353, 1,
-0.2482599, 0.5060575, -0.3123915, 0, 1, 0.3921569, 1,
-0.2444307, 2.408546, 0.08944599, 0, 1, 0.4, 1,
-0.2441227, -0.1987601, -2.843021, 0, 1, 0.4078431, 1,
-0.2437879, 0.0003629806, -1.670123, 0, 1, 0.4117647, 1,
-0.2410706, 1.118922, -1.088571, 0, 1, 0.4196078, 1,
-0.2387262, 0.9016959, 0.8845717, 0, 1, 0.4235294, 1,
-0.23191, -0.5066414, -2.113818, 0, 1, 0.4313726, 1,
-0.2293643, -0.2186309, -3.059774, 0, 1, 0.4352941, 1,
-0.2291532, -0.5343304, -2.249657, 0, 1, 0.4431373, 1,
-0.2278797, -1.271429, -2.057565, 0, 1, 0.4470588, 1,
-0.227692, 0.1707274, 0.323838, 0, 1, 0.454902, 1,
-0.222188, -0.09452923, -2.863223, 0, 1, 0.4588235, 1,
-0.2207748, 1.223748, 1.112335, 0, 1, 0.4666667, 1,
-0.2174212, -0.3984083, -2.551876, 0, 1, 0.4705882, 1,
-0.2102866, -0.09325771, -0.9233989, 0, 1, 0.4784314, 1,
-0.2082801, -0.7627606, -1.464053, 0, 1, 0.4823529, 1,
-0.2038777, -0.4822975, -3.410454, 0, 1, 0.4901961, 1,
-0.2030565, -0.9943058, -1.98489, 0, 1, 0.4941176, 1,
-0.2009528, 1.569447, -0.263229, 0, 1, 0.5019608, 1,
-0.19827, -0.5641659, -3.740069, 0, 1, 0.509804, 1,
-0.1936467, -0.683996, -2.733846, 0, 1, 0.5137255, 1,
-0.1916004, 1.176025, -1.083026, 0, 1, 0.5215687, 1,
-0.1905363, -0.1692704, -2.671535, 0, 1, 0.5254902, 1,
-0.1905308, 1.703235, -1.651315, 0, 1, 0.5333334, 1,
-0.1883993, 0.3489336, -0.4016493, 0, 1, 0.5372549, 1,
-0.1871523, 0.2760302, 0.3630781, 0, 1, 0.5450981, 1,
-0.1870096, -0.07392992, -2.727928, 0, 1, 0.5490196, 1,
-0.1867241, -0.1624444, -3.029047, 0, 1, 0.5568628, 1,
-0.1805997, -0.9591978, -4.025549, 0, 1, 0.5607843, 1,
-0.1797181, 0.5283484, -0.1380302, 0, 1, 0.5686275, 1,
-0.1788844, -0.3619981, -3.924427, 0, 1, 0.572549, 1,
-0.178725, 1.282277, -1.147724, 0, 1, 0.5803922, 1,
-0.1786074, 1.324372, -0.6019666, 0, 1, 0.5843138, 1,
-0.1772566, -1.309735, -3.761103, 0, 1, 0.5921569, 1,
-0.174599, 1.195818, 0.4462393, 0, 1, 0.5960785, 1,
-0.1736705, 0.1403512, -1.964537, 0, 1, 0.6039216, 1,
-0.1702917, 0.859542, 1.058679, 0, 1, 0.6117647, 1,
-0.1697662, 0.2798036, -2.570669, 0, 1, 0.6156863, 1,
-0.1656541, 0.9722084, 0.2293971, 0, 1, 0.6235294, 1,
-0.1649536, 0.4464267, -1.975496, 0, 1, 0.627451, 1,
-0.1597696, -0.7539025, -1.97885, 0, 1, 0.6352941, 1,
-0.1585759, 0.04467205, -2.819465, 0, 1, 0.6392157, 1,
-0.1538899, -1.7194, -2.455261, 0, 1, 0.6470588, 1,
-0.1498712, -0.3595306, -1.695094, 0, 1, 0.6509804, 1,
-0.1494636, 1.837361, -0.4487537, 0, 1, 0.6588235, 1,
-0.149444, 0.2655154, -2.050518, 0, 1, 0.6627451, 1,
-0.1475988, -0.07243842, -3.352681, 0, 1, 0.6705883, 1,
-0.1449607, -0.1301986, -2.979211, 0, 1, 0.6745098, 1,
-0.1408238, -0.1992563, -4.353821, 0, 1, 0.682353, 1,
-0.1390547, 0.5767595, -0.4354728, 0, 1, 0.6862745, 1,
-0.133807, -2.204972, -4.10813, 0, 1, 0.6941177, 1,
-0.1333007, -0.1631848, -0.7675001, 0, 1, 0.7019608, 1,
-0.1297521, 0.2780159, 1.088333, 0, 1, 0.7058824, 1,
-0.1296905, -0.03854983, -2.399425, 0, 1, 0.7137255, 1,
-0.1254568, 0.7089157, -0.4806263, 0, 1, 0.7176471, 1,
-0.1244241, 0.9534954, -0.01044867, 0, 1, 0.7254902, 1,
-0.1192057, -2.124433, -2.739998, 0, 1, 0.7294118, 1,
-0.1142303, -0.713458, -2.940844, 0, 1, 0.7372549, 1,
-0.11183, -0.8690963, -3.024293, 0, 1, 0.7411765, 1,
-0.1099251, 0.538363, 2.594518, 0, 1, 0.7490196, 1,
-0.1069986, 1.759878, 1.079097, 0, 1, 0.7529412, 1,
-0.1068737, -0.2395115, -1.969213, 0, 1, 0.7607843, 1,
-0.1050281, 1.824573, 0.9038478, 0, 1, 0.7647059, 1,
-0.1048376, 0.1481611, -0.9401266, 0, 1, 0.772549, 1,
-0.1035705, 0.8985119, -0.3081197, 0, 1, 0.7764706, 1,
-0.1028601, 0.4061477, 0.08914594, 0, 1, 0.7843137, 1,
-0.1001006, 0.5360214, 1.282129, 0, 1, 0.7882353, 1,
-0.09961484, 0.1441004, -1.825645, 0, 1, 0.7960784, 1,
-0.0995191, 1.627611, -1.591043, 0, 1, 0.8039216, 1,
-0.09840794, 1.141036, -1.124953, 0, 1, 0.8078431, 1,
-0.09692054, -0.0406222, -0.4037963, 0, 1, 0.8156863, 1,
-0.08469187, -0.675629, -4.069022, 0, 1, 0.8196079, 1,
-0.07591578, -0.6181758, -2.815779, 0, 1, 0.827451, 1,
-0.06408807, -0.71705, -4.378214, 0, 1, 0.8313726, 1,
-0.06265315, 0.7104004, 2.002028, 0, 1, 0.8392157, 1,
-0.06200458, -1.137907, -4.041945, 0, 1, 0.8431373, 1,
-0.05987889, -0.748221, -1.357801, 0, 1, 0.8509804, 1,
-0.05309431, 0.8437435, 0.04616243, 0, 1, 0.854902, 1,
-0.05126891, -0.7514923, -2.586507, 0, 1, 0.8627451, 1,
-0.04772304, 0.7337905, 1.150788, 0, 1, 0.8666667, 1,
-0.04630576, -1.109511, -3.277766, 0, 1, 0.8745098, 1,
-0.04453965, 0.3793849, 0.4681164, 0, 1, 0.8784314, 1,
-0.04449597, -0.9325436, -1.683297, 0, 1, 0.8862745, 1,
-0.04415739, 0.1965681, -2.13121, 0, 1, 0.8901961, 1,
-0.03972278, 0.8152631, -0.07122838, 0, 1, 0.8980392, 1,
-0.0390056, -0.1371601, -0.962496, 0, 1, 0.9058824, 1,
-0.03430342, 0.6121396, 0.00769654, 0, 1, 0.9098039, 1,
-0.0294422, 0.6456809, 2.414407, 0, 1, 0.9176471, 1,
-0.02938241, 0.8730344, 1.920931, 0, 1, 0.9215686, 1,
-0.02754468, -0.3008803, -2.337355, 0, 1, 0.9294118, 1,
-0.02023217, -0.5613948, -4.163049, 0, 1, 0.9333333, 1,
-0.01980688, 0.6614584, -0.08631034, 0, 1, 0.9411765, 1,
-0.01966449, -1.088605, -3.875889, 0, 1, 0.945098, 1,
-0.01879513, 1.409247, 0.873625, 0, 1, 0.9529412, 1,
-0.01842986, 0.9450475, -1.064001, 0, 1, 0.9568627, 1,
-0.01065538, 0.3575696, 0.1320655, 0, 1, 0.9647059, 1,
-0.005111366, 0.5182281, -0.1513725, 0, 1, 0.9686275, 1,
-0.004842484, 1.097536, 0.3679191, 0, 1, 0.9764706, 1,
-0.002402242, 0.8704258, -0.6127988, 0, 1, 0.9803922, 1,
-0.001361827, -1.20081, -4.839742, 0, 1, 0.9882353, 1,
0.0005478939, 0.9422535, 1.268355, 0, 1, 0.9921569, 1,
0.0009358145, 0.4383642, -0.4756635, 0, 1, 1, 1,
0.001862436, 0.4925776, -0.05185272, 0, 0.9921569, 1, 1,
0.002231523, -0.2935977, 3.075557, 0, 0.9882353, 1, 1,
0.008055232, -0.06459144, 3.392836, 0, 0.9803922, 1, 1,
0.008203229, 0.6151448, 0.4434591, 0, 0.9764706, 1, 1,
0.008315089, 1.075661, 0.7183694, 0, 0.9686275, 1, 1,
0.01200438, 1.54489, -0.6345755, 0, 0.9647059, 1, 1,
0.01305162, -1.878295, 4.109808, 0, 0.9568627, 1, 1,
0.01853467, -0.08250091, 2.678145, 0, 0.9529412, 1, 1,
0.01990316, 0.4796783, 0.7410312, 0, 0.945098, 1, 1,
0.02359459, 0.08458512, -0.3566242, 0, 0.9411765, 1, 1,
0.0237085, 0.780294, 0.7162377, 0, 0.9333333, 1, 1,
0.02596267, 0.3312294, -1.35583, 0, 0.9294118, 1, 1,
0.02738207, 2.421313, -1.323405, 0, 0.9215686, 1, 1,
0.03021873, -0.09441045, 2.470649, 0, 0.9176471, 1, 1,
0.03352828, 0.196819, -0.06275959, 0, 0.9098039, 1, 1,
0.0338088, -0.5314963, 2.336655, 0, 0.9058824, 1, 1,
0.03552693, 0.3452219, 0.4170877, 0, 0.8980392, 1, 1,
0.03852083, -1.329859, 3.834738, 0, 0.8901961, 1, 1,
0.0396352, 0.7739112, -0.6169564, 0, 0.8862745, 1, 1,
0.04110457, -0.2127687, 1.476691, 0, 0.8784314, 1, 1,
0.0413038, 0.02921122, 1.197857, 0, 0.8745098, 1, 1,
0.04304555, -0.1626823, 2.406866, 0, 0.8666667, 1, 1,
0.04416082, 0.4008982, -2.165663, 0, 0.8627451, 1, 1,
0.0496572, 0.5597246, -1.662083, 0, 0.854902, 1, 1,
0.05481597, 2.067928, -1.347874, 0, 0.8509804, 1, 1,
0.05663518, -0.5403877, 2.258509, 0, 0.8431373, 1, 1,
0.05800538, 1.170111, -0.9990078, 0, 0.8392157, 1, 1,
0.05879143, 0.477801, -1.384231, 0, 0.8313726, 1, 1,
0.0592681, 0.265976, 1.140353, 0, 0.827451, 1, 1,
0.06487019, -0.5490183, 3.990697, 0, 0.8196079, 1, 1,
0.06491435, 0.7381102, 1.552436, 0, 0.8156863, 1, 1,
0.06564566, 0.5182877, 0.09910228, 0, 0.8078431, 1, 1,
0.06585091, -0.1106277, 2.9058, 0, 0.8039216, 1, 1,
0.06914462, 0.9941049, -0.713838, 0, 0.7960784, 1, 1,
0.0724052, 2.097691, -0.1938486, 0, 0.7882353, 1, 1,
0.07289872, -0.6182059, 3.622282, 0, 0.7843137, 1, 1,
0.07535597, -0.1311429, 0.1472641, 0, 0.7764706, 1, 1,
0.07818967, 0.3072112, 1.422899, 0, 0.772549, 1, 1,
0.0782541, 0.6408673, 0.402503, 0, 0.7647059, 1, 1,
0.07835221, -0.4749789, 2.757056, 0, 0.7607843, 1, 1,
0.07898296, -0.2180886, 4.190628, 0, 0.7529412, 1, 1,
0.08237883, -0.08650786, 0.9409076, 0, 0.7490196, 1, 1,
0.08312169, -1.502198, 2.989273, 0, 0.7411765, 1, 1,
0.08832157, -0.364463, 3.543144, 0, 0.7372549, 1, 1,
0.08905175, -0.08754502, 1.942298, 0, 0.7294118, 1, 1,
0.09941463, -1.683636, 2.863549, 0, 0.7254902, 1, 1,
0.1011013, -1.473512, 3.529388, 0, 0.7176471, 1, 1,
0.1011566, -0.7332259, 3.843309, 0, 0.7137255, 1, 1,
0.1016063, 0.7019442, 1.60447, 0, 0.7058824, 1, 1,
0.1037063, 0.368099, 1.200956, 0, 0.6980392, 1, 1,
0.1037114, 0.6516061, 0.2876923, 0, 0.6941177, 1, 1,
0.1042989, -1.708325, 2.030026, 0, 0.6862745, 1, 1,
0.1117467, 0.6167163, 1.284216, 0, 0.682353, 1, 1,
0.1180005, 0.5128915, 0.9532998, 0, 0.6745098, 1, 1,
0.121678, 0.9068023, 0.9128199, 0, 0.6705883, 1, 1,
0.1259944, -1.327432, 3.71726, 0, 0.6627451, 1, 1,
0.1261304, 0.8068941, 0.5197516, 0, 0.6588235, 1, 1,
0.1363991, -0.6375327, 4.123578, 0, 0.6509804, 1, 1,
0.138864, -0.9192876, 2.111856, 0, 0.6470588, 1, 1,
0.1391331, -0.5586031, 3.092534, 0, 0.6392157, 1, 1,
0.1401645, 0.1149448, -0.1218747, 0, 0.6352941, 1, 1,
0.1405562, -0.3952251, 4.380115, 0, 0.627451, 1, 1,
0.1412795, -0.9351701, 3.796254, 0, 0.6235294, 1, 1,
0.1441635, -0.2349046, 4.044937, 0, 0.6156863, 1, 1,
0.1471418, 0.01129015, 3.76844, 0, 0.6117647, 1, 1,
0.1484127, 1.38067, 0.6290614, 0, 0.6039216, 1, 1,
0.149619, -0.5969195, 3.655833, 0, 0.5960785, 1, 1,
0.1501773, 0.04216772, 0.1973966, 0, 0.5921569, 1, 1,
0.1537166, -0.2413097, 3.440343, 0, 0.5843138, 1, 1,
0.1538173, 0.3151297, 0.7644804, 0, 0.5803922, 1, 1,
0.1572552, -0.1125953, 2.824589, 0, 0.572549, 1, 1,
0.160605, -1.40425, 4.178292, 0, 0.5686275, 1, 1,
0.1733091, 0.4542171, -0.2376781, 0, 0.5607843, 1, 1,
0.1803043, -0.8849542, 3.929994, 0, 0.5568628, 1, 1,
0.1822768, -0.05106686, 4.31397, 0, 0.5490196, 1, 1,
0.1881097, -0.4725096, 3.212879, 0, 0.5450981, 1, 1,
0.191847, 1.093983, 1.210274, 0, 0.5372549, 1, 1,
0.1945297, 0.768347, 0.2624834, 0, 0.5333334, 1, 1,
0.1965589, -0.03826498, 3.122389, 0, 0.5254902, 1, 1,
0.198292, 1.0268, 1.572714, 0, 0.5215687, 1, 1,
0.1991176, -1.916319, 2.519427, 0, 0.5137255, 1, 1,
0.2056861, 1.512654, 1.769287, 0, 0.509804, 1, 1,
0.2144855, 0.233012, 0.4677634, 0, 0.5019608, 1, 1,
0.2155274, 0.9487968, -1.001015, 0, 0.4941176, 1, 1,
0.2216824, -0.2468437, 0.648479, 0, 0.4901961, 1, 1,
0.2222061, -1.192577, 2.566645, 0, 0.4823529, 1, 1,
0.2234805, -0.8207481, 1.715619, 0, 0.4784314, 1, 1,
0.2243334, 0.2946987, 0.609297, 0, 0.4705882, 1, 1,
0.2258819, -0.6289242, 3.609848, 0, 0.4666667, 1, 1,
0.2271118, -0.02476872, 3.188883, 0, 0.4588235, 1, 1,
0.230023, -0.6001629, 2.437575, 0, 0.454902, 1, 1,
0.2312952, -0.5169894, 3.083757, 0, 0.4470588, 1, 1,
0.2367517, 0.06057099, 0.899456, 0, 0.4431373, 1, 1,
0.2372766, 0.7999797, 1.355747, 0, 0.4352941, 1, 1,
0.2378371, 0.1992245, 2.522343, 0, 0.4313726, 1, 1,
0.2394622, 0.349455, 1.450166, 0, 0.4235294, 1, 1,
0.2502454, 1.044148, 1.789856, 0, 0.4196078, 1, 1,
0.2521707, 0.3968234, 1.99136, 0, 0.4117647, 1, 1,
0.2532519, 0.8227098, 0.5010748, 0, 0.4078431, 1, 1,
0.2536399, -0.7242064, 3.316168, 0, 0.4, 1, 1,
0.2537155, 0.4771993, 0.8280275, 0, 0.3921569, 1, 1,
0.2604372, 0.1703628, 2.590034, 0, 0.3882353, 1, 1,
0.2630464, 0.7775331, 0.4191564, 0, 0.3803922, 1, 1,
0.2658953, 0.002831021, 2.787307, 0, 0.3764706, 1, 1,
0.2677155, -0.0370663, 0.02673441, 0, 0.3686275, 1, 1,
0.276097, 0.5084701, 0.2286594, 0, 0.3647059, 1, 1,
0.2843359, 0.9339538, -0.7966199, 0, 0.3568628, 1, 1,
0.2865193, 0.3516539, 0.09734067, 0, 0.3529412, 1, 1,
0.3002066, -0.8579499, 2.563622, 0, 0.345098, 1, 1,
0.3045179, 1.721834, 1.204006, 0, 0.3411765, 1, 1,
0.3087379, 0.5204898, 2.072436, 0, 0.3333333, 1, 1,
0.3117733, 2.892301, 0.836715, 0, 0.3294118, 1, 1,
0.3134641, -0.7183244, 1.978843, 0, 0.3215686, 1, 1,
0.3137028, 0.4067249, 0.3933538, 0, 0.3176471, 1, 1,
0.3140844, -1.115426, 3.178665, 0, 0.3098039, 1, 1,
0.3152708, -0.8947533, 2.169275, 0, 0.3058824, 1, 1,
0.3218766, -1.550727, 2.635835, 0, 0.2980392, 1, 1,
0.3237003, 0.6377179, 0.258215, 0, 0.2901961, 1, 1,
0.3258016, 0.5616911, 0.06273869, 0, 0.2862745, 1, 1,
0.3375972, 0.1680821, 1.140047, 0, 0.2784314, 1, 1,
0.3379456, 0.6265352, 0.1209011, 0, 0.2745098, 1, 1,
0.339856, -1.247275, 2.093682, 0, 0.2666667, 1, 1,
0.3410578, 0.6449615, 2.072991, 0, 0.2627451, 1, 1,
0.3429934, -1.086012, 1.509979, 0, 0.254902, 1, 1,
0.3443572, -0.06290937, -0.3344904, 0, 0.2509804, 1, 1,
0.3459471, 0.1350474, 1.760418, 0, 0.2431373, 1, 1,
0.3462046, 0.8358735, -0.1466653, 0, 0.2392157, 1, 1,
0.3472574, -1.681384, 3.625499, 0, 0.2313726, 1, 1,
0.3483215, 1.286467, 0.5856658, 0, 0.227451, 1, 1,
0.350399, 0.09440605, 1.040969, 0, 0.2196078, 1, 1,
0.3512323, 0.04185491, 1.233581, 0, 0.2156863, 1, 1,
0.3571796, 0.848881, -0.6569434, 0, 0.2078431, 1, 1,
0.3582091, -1.4164, 3.728326, 0, 0.2039216, 1, 1,
0.3593445, -0.7696506, 2.142307, 0, 0.1960784, 1, 1,
0.3633078, -0.8391638, 1.644838, 0, 0.1882353, 1, 1,
0.3718061, -0.2578271, 2.708971, 0, 0.1843137, 1, 1,
0.372364, 1.3365, -0.5318505, 0, 0.1764706, 1, 1,
0.3760349, -1.89824, 3.492855, 0, 0.172549, 1, 1,
0.3769748, 1.46594, 0.326777, 0, 0.1647059, 1, 1,
0.3792994, -1.395705, 1.015913, 0, 0.1607843, 1, 1,
0.381998, 1.623502, -0.3358204, 0, 0.1529412, 1, 1,
0.3835357, 0.1848511, -0.3616996, 0, 0.1490196, 1, 1,
0.3867984, 0.7216673, 1.224153, 0, 0.1411765, 1, 1,
0.3870431, 0.4713078, -0.05377004, 0, 0.1372549, 1, 1,
0.3891432, -0.1459139, 2.515856, 0, 0.1294118, 1, 1,
0.3891919, 0.1580941, -0.7057031, 0, 0.1254902, 1, 1,
0.3942085, 1.051695, 0.6082317, 0, 0.1176471, 1, 1,
0.3943234, -1.244243, 3.018366, 0, 0.1137255, 1, 1,
0.3955953, -1.478202, 2.618126, 0, 0.1058824, 1, 1,
0.3995878, -0.06855126, 2.448977, 0, 0.09803922, 1, 1,
0.4040983, 0.9573851, 2.309443, 0, 0.09411765, 1, 1,
0.4070384, 0.1736491, 2.572433, 0, 0.08627451, 1, 1,
0.4075441, 1.814915, -0.3208282, 0, 0.08235294, 1, 1,
0.4077871, 1.56975, -1.053735, 0, 0.07450981, 1, 1,
0.4179733, -0.432623, 3.628877, 0, 0.07058824, 1, 1,
0.4244808, -0.5817626, 3.028654, 0, 0.0627451, 1, 1,
0.4245088, -0.7425703, 3.07813, 0, 0.05882353, 1, 1,
0.4258049, -1.387028, 2.911791, 0, 0.05098039, 1, 1,
0.426224, -0.2295534, 1.560871, 0, 0.04705882, 1, 1,
0.426964, -1.587144, 2.290484, 0, 0.03921569, 1, 1,
0.4299456, -0.05948124, 1.59382, 0, 0.03529412, 1, 1,
0.4342305, 1.074778, -0.7589667, 0, 0.02745098, 1, 1,
0.4348005, 1.041499, 0.6233948, 0, 0.02352941, 1, 1,
0.4370071, 0.3083782, 2.971033, 0, 0.01568628, 1, 1,
0.4370769, 0.396492, 1.109395, 0, 0.01176471, 1, 1,
0.4393944, -0.517197, 1.851244, 0, 0.003921569, 1, 1,
0.4406342, -0.7771056, 3.204983, 0.003921569, 0, 1, 1,
0.4419887, 1.996632, -0.6814031, 0.007843138, 0, 1, 1,
0.4421228, 0.467732, 0.3276693, 0.01568628, 0, 1, 1,
0.4428302, -1.916808, 2.286743, 0.01960784, 0, 1, 1,
0.4462464, 0.5262628, 0.3186665, 0.02745098, 0, 1, 1,
0.4520684, 0.8892032, 0.4220079, 0.03137255, 0, 1, 1,
0.4533813, -0.9356321, 2.421154, 0.03921569, 0, 1, 1,
0.4538737, 0.2682482, 0.7736385, 0.04313726, 0, 1, 1,
0.4596027, 0.1411103, 1.364424, 0.05098039, 0, 1, 1,
0.4597329, 0.9644245, -0.05108328, 0.05490196, 0, 1, 1,
0.4607796, 0.8696933, 0.2462898, 0.0627451, 0, 1, 1,
0.4610078, -1.303347, 3.391682, 0.06666667, 0, 1, 1,
0.4703498, 1.034689, -0.5337716, 0.07450981, 0, 1, 1,
0.4739792, -0.4895687, 3.279514, 0.07843138, 0, 1, 1,
0.4742585, 1.536169, 0.3241945, 0.08627451, 0, 1, 1,
0.4750572, -0.6706734, 2.564727, 0.09019608, 0, 1, 1,
0.4757026, -0.9251676, 2.784204, 0.09803922, 0, 1, 1,
0.4790183, -0.2121214, 1.281635, 0.1058824, 0, 1, 1,
0.4802877, 0.2054713, 1.860856, 0.1098039, 0, 1, 1,
0.4816968, 1.261483, 0.6141911, 0.1176471, 0, 1, 1,
0.4853323, -1.388785, 2.996288, 0.1215686, 0, 1, 1,
0.4856038, 0.139605, 1.830508, 0.1294118, 0, 1, 1,
0.490046, 0.8426154, 0.07982016, 0.1333333, 0, 1, 1,
0.4962163, 0.7680452, 1.126552, 0.1411765, 0, 1, 1,
0.4973856, -0.2420557, 0.6992907, 0.145098, 0, 1, 1,
0.5010623, -1.696045, 2.196208, 0.1529412, 0, 1, 1,
0.5117789, 0.05898983, 2.571209, 0.1568628, 0, 1, 1,
0.5120211, -1.264217, 1.849995, 0.1647059, 0, 1, 1,
0.5147408, -0.1931531, 1.308128, 0.1686275, 0, 1, 1,
0.5161817, -0.04665668, 2.668447, 0.1764706, 0, 1, 1,
0.52024, -0.01637477, 0.6506793, 0.1803922, 0, 1, 1,
0.5233454, -1.339762, 2.263318, 0.1882353, 0, 1, 1,
0.5234351, 0.2661321, 1.18905, 0.1921569, 0, 1, 1,
0.5262459, 1.070026, 0.1308682, 0.2, 0, 1, 1,
0.5270227, 0.7553146, 1.341487, 0.2078431, 0, 1, 1,
0.5294613, -2.517078, 3.336082, 0.2117647, 0, 1, 1,
0.5326221, -0.358102, 2.353069, 0.2196078, 0, 1, 1,
0.5328285, 0.3876116, 0.4585206, 0.2235294, 0, 1, 1,
0.5346144, 0.1832794, 0.7778854, 0.2313726, 0, 1, 1,
0.5372888, -1.272561, -0.7113948, 0.2352941, 0, 1, 1,
0.5415916, 0.01888396, 1.550197, 0.2431373, 0, 1, 1,
0.542628, 1.336349, -2.583042, 0.2470588, 0, 1, 1,
0.5483416, 0.6678919, 0.5773728, 0.254902, 0, 1, 1,
0.5497478, 0.1829854, 0.5441886, 0.2588235, 0, 1, 1,
0.5528402, -0.349559, 2.347095, 0.2666667, 0, 1, 1,
0.5566173, -1.146169, 2.826808, 0.2705882, 0, 1, 1,
0.5610456, 0.05248736, 1.073287, 0.2784314, 0, 1, 1,
0.5641835, -1.84905, 2.949438, 0.282353, 0, 1, 1,
0.5646411, 1.038496, 1.374361, 0.2901961, 0, 1, 1,
0.5650162, -0.01469752, 2.127254, 0.2941177, 0, 1, 1,
0.5660245, 2.45382, 0.8334334, 0.3019608, 0, 1, 1,
0.5663258, -0.4190204, 1.999907, 0.3098039, 0, 1, 1,
0.568088, -0.4036116, 0.01788198, 0.3137255, 0, 1, 1,
0.5688023, -0.3071897, 3.093002, 0.3215686, 0, 1, 1,
0.5732939, -1.105016, 1.306916, 0.3254902, 0, 1, 1,
0.5777932, 0.8589322, -1.663194, 0.3333333, 0, 1, 1,
0.5786939, 0.1413806, 1.642894, 0.3372549, 0, 1, 1,
0.5800269, -1.081851, 2.047425, 0.345098, 0, 1, 1,
0.5801453, -0.7786859, 2.53913, 0.3490196, 0, 1, 1,
0.5860559, -0.4418302, 1.459425, 0.3568628, 0, 1, 1,
0.5868885, -1.013687, 1.923983, 0.3607843, 0, 1, 1,
0.5889069, -1.538047, 3.022997, 0.3686275, 0, 1, 1,
0.5890364, 0.09574994, 2.278224, 0.372549, 0, 1, 1,
0.5891697, -0.773257, 3.327361, 0.3803922, 0, 1, 1,
0.5891707, -0.1715967, 1.238889, 0.3843137, 0, 1, 1,
0.594746, -0.821282, 0.5353466, 0.3921569, 0, 1, 1,
0.5950597, -0.08630791, 3.595854, 0.3960784, 0, 1, 1,
0.5968762, 0.2931341, 2.541796, 0.4039216, 0, 1, 1,
0.5992023, -0.1516903, 2.142471, 0.4117647, 0, 1, 1,
0.6098403, 3.54939, 0.7002907, 0.4156863, 0, 1, 1,
0.6147839, 0.308039, 1.259546, 0.4235294, 0, 1, 1,
0.6157792, 1.990507, -0.2261501, 0.427451, 0, 1, 1,
0.6281564, 0.2739692, -0.1553524, 0.4352941, 0, 1, 1,
0.6308048, -0.7442343, 3.625712, 0.4392157, 0, 1, 1,
0.6357113, 0.2785305, 1.122415, 0.4470588, 0, 1, 1,
0.6364869, -0.1643021, 1.18581, 0.4509804, 0, 1, 1,
0.6384277, 1.338575, -0.03448362, 0.4588235, 0, 1, 1,
0.6394596, -0.00938205, -0.0287961, 0.4627451, 0, 1, 1,
0.6400244, 1.658278, 0.642267, 0.4705882, 0, 1, 1,
0.6416864, 0.3878489, 1.005253, 0.4745098, 0, 1, 1,
0.6423776, 0.8527816, 1.679365, 0.4823529, 0, 1, 1,
0.6496202, 0.3867615, 0.5826889, 0.4862745, 0, 1, 1,
0.6548072, 0.595524, 0.6462239, 0.4941176, 0, 1, 1,
0.6562455, -0.09736113, 1.798761, 0.5019608, 0, 1, 1,
0.6618771, -1.16833, 2.511566, 0.5058824, 0, 1, 1,
0.6627374, -0.09349693, 0.257846, 0.5137255, 0, 1, 1,
0.6629788, 0.2322051, 1.176313, 0.5176471, 0, 1, 1,
0.6639351, -0.3675078, -0.3760242, 0.5254902, 0, 1, 1,
0.6642116, -1.630573, 1.487766, 0.5294118, 0, 1, 1,
0.6643721, -0.5007933, 2.880559, 0.5372549, 0, 1, 1,
0.6654643, -0.3236308, 3.797251, 0.5411765, 0, 1, 1,
0.6672197, 0.1005434, 1.730293, 0.5490196, 0, 1, 1,
0.6752941, -0.2042712, 0.8463298, 0.5529412, 0, 1, 1,
0.6760419, 0.4403273, 0.774255, 0.5607843, 0, 1, 1,
0.6784464, -1.595569, 1.041769, 0.5647059, 0, 1, 1,
0.6795121, 0.8935556, -0.366471, 0.572549, 0, 1, 1,
0.67959, -0.4926098, 2.22899, 0.5764706, 0, 1, 1,
0.6847368, 1.683407, 0.5998441, 0.5843138, 0, 1, 1,
0.6847863, -0.215285, 2.889858, 0.5882353, 0, 1, 1,
0.6868146, -0.163659, 0.08679095, 0.5960785, 0, 1, 1,
0.6994544, 0.1605431, 1.339916, 0.6039216, 0, 1, 1,
0.7057478, -0.6202007, 3.077088, 0.6078432, 0, 1, 1,
0.7075955, -0.4154649, 3.70494, 0.6156863, 0, 1, 1,
0.7086887, 0.859923, 1.616547, 0.6196079, 0, 1, 1,
0.7116229, -0.4870277, 2.342465, 0.627451, 0, 1, 1,
0.713859, 0.5051752, 1.713775, 0.6313726, 0, 1, 1,
0.7161654, 0.01056472, 1.777652, 0.6392157, 0, 1, 1,
0.7202094, -0.422722, 1.82338, 0.6431373, 0, 1, 1,
0.7229733, -2.186942, 4.006727, 0.6509804, 0, 1, 1,
0.7286674, 0.8576937, 0.5158647, 0.654902, 0, 1, 1,
0.7292637, 0.8852653, 0.6970207, 0.6627451, 0, 1, 1,
0.7301102, 0.2092016, 1.225027, 0.6666667, 0, 1, 1,
0.7312139, 1.716984, 0.04133705, 0.6745098, 0, 1, 1,
0.7360027, -0.3042842, 1.758986, 0.6784314, 0, 1, 1,
0.7392217, 0.9808642, 0.7587023, 0.6862745, 0, 1, 1,
0.7458283, -0.8458663, 3.007122, 0.6901961, 0, 1, 1,
0.7475921, -1.167432, 3.496101, 0.6980392, 0, 1, 1,
0.7482719, 0.3627581, 1.690195, 0.7058824, 0, 1, 1,
0.7498295, 0.1938207, 1.766141, 0.7098039, 0, 1, 1,
0.7609291, 1.468084, 1.918003, 0.7176471, 0, 1, 1,
0.7654414, -1.275094, 1.686253, 0.7215686, 0, 1, 1,
0.7726334, 0.6530586, 0.4856493, 0.7294118, 0, 1, 1,
0.7846709, 0.9862853, -1.399972, 0.7333333, 0, 1, 1,
0.7932046, -0.1548502, 2.846547, 0.7411765, 0, 1, 1,
0.8031976, 0.9385239, -1.243714, 0.7450981, 0, 1, 1,
0.8035009, -0.4463474, 2.262424, 0.7529412, 0, 1, 1,
0.8037919, -0.818961, 3.358337, 0.7568628, 0, 1, 1,
0.8118542, 0.423503, 2.226088, 0.7647059, 0, 1, 1,
0.8143681, 0.9667196, 0.03164383, 0.7686275, 0, 1, 1,
0.8179399, -0.342494, 0.5384878, 0.7764706, 0, 1, 1,
0.8205847, -1.011673, 1.729491, 0.7803922, 0, 1, 1,
0.8232583, -0.3800581, 1.921844, 0.7882353, 0, 1, 1,
0.8244601, 0.5417653, 0.9311119, 0.7921569, 0, 1, 1,
0.8264158, -0.7609928, 1.566135, 0.8, 0, 1, 1,
0.8278107, -1.071697, 1.477173, 0.8078431, 0, 1, 1,
0.8342952, -1.057187, 0.8618336, 0.8117647, 0, 1, 1,
0.8355972, -0.222378, 1.838597, 0.8196079, 0, 1, 1,
0.8403664, 0.6512391, 1.108059, 0.8235294, 0, 1, 1,
0.840937, 0.945917, 1.029481, 0.8313726, 0, 1, 1,
0.8453897, 0.7675166, 2.45115, 0.8352941, 0, 1, 1,
0.8462904, 2.030275, -0.3219789, 0.8431373, 0, 1, 1,
0.848211, 1.421546, 1.613939, 0.8470588, 0, 1, 1,
0.853323, 0.7518302, 1.559371, 0.854902, 0, 1, 1,
0.8563139, 1.448595, 2.491133, 0.8588235, 0, 1, 1,
0.858003, 0.548025, -0.5617303, 0.8666667, 0, 1, 1,
0.8615081, -0.7373586, 2.39736, 0.8705882, 0, 1, 1,
0.8626111, 0.6370334, 0.816738, 0.8784314, 0, 1, 1,
0.8661953, 1.117307, -2.589434, 0.8823529, 0, 1, 1,
0.8665599, -0.5961448, 1.608969, 0.8901961, 0, 1, 1,
0.868389, 0.2781632, 0.2802825, 0.8941177, 0, 1, 1,
0.8694386, -0.1570392, -0.8349416, 0.9019608, 0, 1, 1,
0.8729742, -0.1287933, 1.130497, 0.9098039, 0, 1, 1,
0.8773282, 1.246793, -0.2892543, 0.9137255, 0, 1, 1,
0.8773661, -1.985958, 1.72269, 0.9215686, 0, 1, 1,
0.887062, -2.240486, 2.5913, 0.9254902, 0, 1, 1,
0.8876266, -1.876225, 2.649704, 0.9333333, 0, 1, 1,
0.8878959, 1.891759, 0.4808249, 0.9372549, 0, 1, 1,
0.891607, -1.531773, 2.198821, 0.945098, 0, 1, 1,
0.8932332, 1.087125, -0.1443084, 0.9490196, 0, 1, 1,
0.8937992, -1.088228, 1.626857, 0.9568627, 0, 1, 1,
0.8946047, 1.922194, 1.11905, 0.9607843, 0, 1, 1,
0.8964224, 0.1712887, 2.399129, 0.9686275, 0, 1, 1,
0.8994572, 1.356066, 1.606814, 0.972549, 0, 1, 1,
0.9094158, 0.07031382, 1.732623, 0.9803922, 0, 1, 1,
0.9165716, 0.08470403, 1.872619, 0.9843137, 0, 1, 1,
0.9177608, -0.7172003, 2.378209, 0.9921569, 0, 1, 1,
0.9195008, -1.261972, 2.50771, 0.9960784, 0, 1, 1,
0.9208078, -0.3353253, 2.388614, 1, 0, 0.9960784, 1,
0.9286811, -0.5100642, 1.833999, 1, 0, 0.9882353, 1,
0.9402462, -1.209545, 3.068589, 1, 0, 0.9843137, 1,
0.9434621, -0.6489516, 2.080658, 1, 0, 0.9764706, 1,
0.9493615, -0.01275837, 1.652616, 1, 0, 0.972549, 1,
0.9522571, 0.6544168, 2.173501, 1, 0, 0.9647059, 1,
0.9538755, -1.055171, 3.881375, 1, 0, 0.9607843, 1,
0.9590082, -1.203955, 1.693692, 1, 0, 0.9529412, 1,
0.9698554, -0.6930344, 3.261156, 1, 0, 0.9490196, 1,
0.971435, -1.119157, 2.970847, 1, 0, 0.9411765, 1,
0.972054, 0.5402381, 3.263909, 1, 0, 0.9372549, 1,
0.972468, -0.8835759, 2.394823, 1, 0, 0.9294118, 1,
0.9738135, 0.8161873, 1.533828, 1, 0, 0.9254902, 1,
0.9758872, 0.7197487, -0.4747978, 1, 0, 0.9176471, 1,
0.977751, -0.778854, 2.73974, 1, 0, 0.9137255, 1,
0.9780032, -0.843034, 2.596658, 1, 0, 0.9058824, 1,
0.9804024, 0.3502838, 1.507353, 1, 0, 0.9019608, 1,
0.9831095, -0.13914, 2.656216, 1, 0, 0.8941177, 1,
0.9848415, -0.5676097, 4.228273, 1, 0, 0.8862745, 1,
0.9865136, 0.3955075, 1.58514, 1, 0, 0.8823529, 1,
0.9917532, 2.121675, -0.5983304, 1, 0, 0.8745098, 1,
1.000177, 1.109979, 1.357019, 1, 0, 0.8705882, 1,
1.0006, 0.02342431, 1.089312, 1, 0, 0.8627451, 1,
1.001264, -2.364896, 2.914352, 1, 0, 0.8588235, 1,
1.003211, 1.609448, -0.4587408, 1, 0, 0.8509804, 1,
1.00468, 0.52353, 1.708577, 1, 0, 0.8470588, 1,
1.006666, -0.8062198, 1.663253, 1, 0, 0.8392157, 1,
1.010733, -1.40859, 4.138306, 1, 0, 0.8352941, 1,
1.014717, -1.784982, 1.492258, 1, 0, 0.827451, 1,
1.027543, -1.502323, 3.461508, 1, 0, 0.8235294, 1,
1.028131, 0.9449196, 1.325134, 1, 0, 0.8156863, 1,
1.030253, 0.1787728, 1.495919, 1, 0, 0.8117647, 1,
1.034955, -0.4235703, 2.83623, 1, 0, 0.8039216, 1,
1.044833, 0.2062377, 0.751547, 1, 0, 0.7960784, 1,
1.045197, -1.13837, 2.885452, 1, 0, 0.7921569, 1,
1.049415, -1.341409, 4.462685, 1, 0, 0.7843137, 1,
1.0532, -0.7033208, 2.551818, 1, 0, 0.7803922, 1,
1.054005, 0.896154, -0.291339, 1, 0, 0.772549, 1,
1.054248, -0.525111, 2.764111, 1, 0, 0.7686275, 1,
1.058903, -0.810549, 1.841139, 1, 0, 0.7607843, 1,
1.062751, 1.351229, 1.041908, 1, 0, 0.7568628, 1,
1.062795, -2.366613, 1.089719, 1, 0, 0.7490196, 1,
1.072148, 1.588349, 1.180866, 1, 0, 0.7450981, 1,
1.084098, -0.03872966, 0.2399028, 1, 0, 0.7372549, 1,
1.087449, -0.4019629, 3.158351, 1, 0, 0.7333333, 1,
1.08884, -0.009122525, 2.787633, 1, 0, 0.7254902, 1,
1.093209, -0.2922887, 2.171296, 1, 0, 0.7215686, 1,
1.102527, -1.118613, 0.8301203, 1, 0, 0.7137255, 1,
1.104167, -0.3934125, 2.320883, 1, 0, 0.7098039, 1,
1.104632, 0.4040926, 2.001818, 1, 0, 0.7019608, 1,
1.11258, 1.162299, -0.3905972, 1, 0, 0.6941177, 1,
1.120971, 0.3510424, 1.368397, 1, 0, 0.6901961, 1,
1.126404, 0.3916653, 2.369795, 1, 0, 0.682353, 1,
1.140261, 0.6207449, -0.7116474, 1, 0, 0.6784314, 1,
1.141172, 0.6694622, 0.4259008, 1, 0, 0.6705883, 1,
1.142062, 0.3544645, 1.476045, 1, 0, 0.6666667, 1,
1.14231, 0.9915283, 1.647304, 1, 0, 0.6588235, 1,
1.145296, -0.7897335, 4.1264, 1, 0, 0.654902, 1,
1.148416, -0.1452324, 1.939101, 1, 0, 0.6470588, 1,
1.157792, -1.601313, 1.069635, 1, 0, 0.6431373, 1,
1.16292, 1.415225, 0.9446551, 1, 0, 0.6352941, 1,
1.164166, -0.4178686, 3.17469, 1, 0, 0.6313726, 1,
1.172276, 1.499377, 1.044413, 1, 0, 0.6235294, 1,
1.192824, -0.6330248, 4.389398, 1, 0, 0.6196079, 1,
1.194077, 0.7131627, 3.306967, 1, 0, 0.6117647, 1,
1.195417, -0.6743335, 2.953499, 1, 0, 0.6078432, 1,
1.198305, -0.7948846, 2.03839, 1, 0, 0.6, 1,
1.198317, -0.1715729, 0.8325894, 1, 0, 0.5921569, 1,
1.202964, -0.5825821, 2.749567, 1, 0, 0.5882353, 1,
1.20502, -0.6476936, 2.806393, 1, 0, 0.5803922, 1,
1.209421, -0.7372287, 2.342459, 1, 0, 0.5764706, 1,
1.21083, 1.777315, 0.1057191, 1, 0, 0.5686275, 1,
1.22262, -0.4941915, 0.8036926, 1, 0, 0.5647059, 1,
1.232563, -0.8355488, 1.775955, 1, 0, 0.5568628, 1,
1.251333, -0.2856491, 2.016559, 1, 0, 0.5529412, 1,
1.257478, 0.8428217, 1.990955, 1, 0, 0.5450981, 1,
1.258049, 0.5826341, 2.789826, 1, 0, 0.5411765, 1,
1.265536, -0.5838314, 2.564573, 1, 0, 0.5333334, 1,
1.266232, 0.5141838, 1.928, 1, 0, 0.5294118, 1,
1.275526, -0.2639947, 0.1277735, 1, 0, 0.5215687, 1,
1.284705, -0.5438187, -0.6966435, 1, 0, 0.5176471, 1,
1.289873, -0.5012553, 2.331852, 1, 0, 0.509804, 1,
1.292973, -0.9741829, 1.486188, 1, 0, 0.5058824, 1,
1.296373, -0.9370722, 1.395164, 1, 0, 0.4980392, 1,
1.296385, 1.14061, 0.6102907, 1, 0, 0.4901961, 1,
1.301293, -0.2509727, 1.514948, 1, 0, 0.4862745, 1,
1.301807, 0.2939483, 1.716564, 1, 0, 0.4784314, 1,
1.307745, 0.5328026, 2.78733, 1, 0, 0.4745098, 1,
1.310705, -1.978423, 1.264037, 1, 0, 0.4666667, 1,
1.31425, -0.1992691, 1.084427, 1, 0, 0.4627451, 1,
1.318868, 1.938432, 1.967414, 1, 0, 0.454902, 1,
1.319332, -2.835504, 5.057061, 1, 0, 0.4509804, 1,
1.321355, 0.771953, 0.6812199, 1, 0, 0.4431373, 1,
1.329028, -0.3851464, 2.858805, 1, 0, 0.4392157, 1,
1.330885, 0.2215086, 2.608394, 1, 0, 0.4313726, 1,
1.342875, -0.5561793, 3.226031, 1, 0, 0.427451, 1,
1.357783, -0.3021753, 1.434612, 1, 0, 0.4196078, 1,
1.362939, 0.8711829, 1.886189, 1, 0, 0.4156863, 1,
1.365448, 0.4624283, 0.6746321, 1, 0, 0.4078431, 1,
1.370324, 0.1328941, 0.8517983, 1, 0, 0.4039216, 1,
1.375653, 2.07156, 0.1109139, 1, 0, 0.3960784, 1,
1.385419, 0.3532933, 2.118222, 1, 0, 0.3882353, 1,
1.4056, 0.8053733, 1.428943, 1, 0, 0.3843137, 1,
1.415534, 0.3049416, 2.056834, 1, 0, 0.3764706, 1,
1.42292, 0.438817, 0.8281731, 1, 0, 0.372549, 1,
1.435045, -0.3105452, 2.675768, 1, 0, 0.3647059, 1,
1.451737, -0.7821863, 2.652825, 1, 0, 0.3607843, 1,
1.454374, 0.1117377, 2.442984, 1, 0, 0.3529412, 1,
1.475438, -1.193112, 1.929937, 1, 0, 0.3490196, 1,
1.482052, -0.5303372, 2.023736, 1, 0, 0.3411765, 1,
1.484171, 1.274776, 1.674126, 1, 0, 0.3372549, 1,
1.490025, -0.20716, 1.311697, 1, 0, 0.3294118, 1,
1.496352, -0.5777228, 1.250778, 1, 0, 0.3254902, 1,
1.507405, 0.9485851, 0.06267625, 1, 0, 0.3176471, 1,
1.521803, 1.025493, -0.8884746, 1, 0, 0.3137255, 1,
1.544649, -0.3886603, 0.3566194, 1, 0, 0.3058824, 1,
1.547191, -0.7894608, 2.672406, 1, 0, 0.2980392, 1,
1.55734, 0.3015818, 0.947642, 1, 0, 0.2941177, 1,
1.566082, 0.6192542, 0.7923712, 1, 0, 0.2862745, 1,
1.578997, -0.6058521, 0.6676744, 1, 0, 0.282353, 1,
1.579195, -0.714615, -0.003262728, 1, 0, 0.2745098, 1,
1.610637, -2.416345, 3.026863, 1, 0, 0.2705882, 1,
1.625381, -1.162086, 3.490422, 1, 0, 0.2627451, 1,
1.630626, 1.20968, 0.1433079, 1, 0, 0.2588235, 1,
1.641851, -0.6918127, 2.338196, 1, 0, 0.2509804, 1,
1.642399, -0.9673368, 4.098015, 1, 0, 0.2470588, 1,
1.651732, 1.989659, 1.493003, 1, 0, 0.2392157, 1,
1.651986, -0.3439161, 1.415289, 1, 0, 0.2352941, 1,
1.677932, -1.276173, 0.168797, 1, 0, 0.227451, 1,
1.709256, 2.026801, -0.05090882, 1, 0, 0.2235294, 1,
1.721711, -0.7017993, 1.808316, 1, 0, 0.2156863, 1,
1.721784, 1.083385, 0.9925494, 1, 0, 0.2117647, 1,
1.755672, 0.8025819, 1.929844, 1, 0, 0.2039216, 1,
1.767572, -1.003982, 1.494394, 1, 0, 0.1960784, 1,
1.791328, 0.1679318, 3.177849, 1, 0, 0.1921569, 1,
1.796997, -1.623315, 3.012975, 1, 0, 0.1843137, 1,
1.808013, -1.053453, 2.563558, 1, 0, 0.1803922, 1,
1.818283, -0.5492049, 2.119546, 1, 0, 0.172549, 1,
1.825373, 2.307391, 0.9743623, 1, 0, 0.1686275, 1,
1.853669, -0.8341784, 2.240849, 1, 0, 0.1607843, 1,
1.873157, 0.5593645, -0.246671, 1, 0, 0.1568628, 1,
1.880022, -0.9548375, 1.410115, 1, 0, 0.1490196, 1,
1.881893, -0.4609338, 1.17573, 1, 0, 0.145098, 1,
1.901057, 0.8467821, 1.324472, 1, 0, 0.1372549, 1,
1.913622, -0.3007972, -0.8042986, 1, 0, 0.1333333, 1,
1.936627, -0.7357623, 2.62989, 1, 0, 0.1254902, 1,
1.998287, -1.350542, 2.374673, 1, 0, 0.1215686, 1,
2.01806, 1.5481, 2.056428, 1, 0, 0.1137255, 1,
2.044841, 0.2837889, 3.826851, 1, 0, 0.1098039, 1,
2.094432, 0.3382557, 1.730539, 1, 0, 0.1019608, 1,
2.105715, -1.833039, 2.84996, 1, 0, 0.09411765, 1,
2.122882, 0.8717396, 1.306375, 1, 0, 0.09019608, 1,
2.143041, 0.8568245, 1.33531, 1, 0, 0.08235294, 1,
2.143203, -0.13731, 3.362835, 1, 0, 0.07843138, 1,
2.158548, 0.7855251, 1.028133, 1, 0, 0.07058824, 1,
2.205992, -1.180909, 0.7755373, 1, 0, 0.06666667, 1,
2.208213, -0.2376054, 2.749144, 1, 0, 0.05882353, 1,
2.219797, -0.7043704, 2.000808, 1, 0, 0.05490196, 1,
2.224614, -0.5142837, 2.423956, 1, 0, 0.04705882, 1,
2.275469, 2.143998, 1.785819, 1, 0, 0.04313726, 1,
2.450681, 0.7935649, 1.763722, 1, 0, 0.03529412, 1,
2.465615, 0.6495616, 1.425053, 1, 0, 0.03137255, 1,
2.696632, -0.8134639, 1.997896, 1, 0, 0.02352941, 1,
2.734513, 1.007376, 3.393581, 1, 0, 0.01960784, 1,
2.76638, 0.5177566, 3.607875, 1, 0, 0.01176471, 1,
2.952793, 0.2309403, 0.9060241, 1, 0, 0.007843138, 1
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
-0.09466875, -4.183411, -6.957047, 0, -0.5, 0.5, 0.5,
-0.09466875, -4.183411, -6.957047, 1, -0.5, 0.5, 0.5,
-0.09466875, -4.183411, -6.957047, 1, 1.5, 0.5, 0.5,
-0.09466875, -4.183411, -6.957047, 0, 1.5, 0.5, 0.5
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
-4.17522, 0.2433615, -6.957047, 0, -0.5, 0.5, 0.5,
-4.17522, 0.2433615, -6.957047, 1, -0.5, 0.5, 0.5,
-4.17522, 0.2433615, -6.957047, 1, 1.5, 0.5, 0.5,
-4.17522, 0.2433615, -6.957047, 0, 1.5, 0.5, 0.5
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
-4.17522, -4.183411, -0.07936835, 0, -0.5, 0.5, 0.5,
-4.17522, -4.183411, -0.07936835, 1, -0.5, 0.5, 0.5,
-4.17522, -4.183411, -0.07936835, 1, 1.5, 0.5, 0.5,
-4.17522, -4.183411, -0.07936835, 0, 1.5, 0.5, 0.5
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
-3, -3.161848, -5.36989,
2, -3.161848, -5.36989,
-3, -3.161848, -5.36989,
-3, -3.332108, -5.634417,
-2, -3.161848, -5.36989,
-2, -3.332108, -5.634417,
-1, -3.161848, -5.36989,
-1, -3.332108, -5.634417,
0, -3.161848, -5.36989,
0, -3.332108, -5.634417,
1, -3.161848, -5.36989,
1, -3.332108, -5.634417,
2, -3.161848, -5.36989,
2, -3.332108, -5.634417
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
-3, -3.672629, -6.163468, 0, -0.5, 0.5, 0.5,
-3, -3.672629, -6.163468, 1, -0.5, 0.5, 0.5,
-3, -3.672629, -6.163468, 1, 1.5, 0.5, 0.5,
-3, -3.672629, -6.163468, 0, 1.5, 0.5, 0.5,
-2, -3.672629, -6.163468, 0, -0.5, 0.5, 0.5,
-2, -3.672629, -6.163468, 1, -0.5, 0.5, 0.5,
-2, -3.672629, -6.163468, 1, 1.5, 0.5, 0.5,
-2, -3.672629, -6.163468, 0, 1.5, 0.5, 0.5,
-1, -3.672629, -6.163468, 0, -0.5, 0.5, 0.5,
-1, -3.672629, -6.163468, 1, -0.5, 0.5, 0.5,
-1, -3.672629, -6.163468, 1, 1.5, 0.5, 0.5,
-1, -3.672629, -6.163468, 0, 1.5, 0.5, 0.5,
0, -3.672629, -6.163468, 0, -0.5, 0.5, 0.5,
0, -3.672629, -6.163468, 1, -0.5, 0.5, 0.5,
0, -3.672629, -6.163468, 1, 1.5, 0.5, 0.5,
0, -3.672629, -6.163468, 0, 1.5, 0.5, 0.5,
1, -3.672629, -6.163468, 0, -0.5, 0.5, 0.5,
1, -3.672629, -6.163468, 1, -0.5, 0.5, 0.5,
1, -3.672629, -6.163468, 1, 1.5, 0.5, 0.5,
1, -3.672629, -6.163468, 0, 1.5, 0.5, 0.5,
2, -3.672629, -6.163468, 0, -0.5, 0.5, 0.5,
2, -3.672629, -6.163468, 1, -0.5, 0.5, 0.5,
2, -3.672629, -6.163468, 1, 1.5, 0.5, 0.5,
2, -3.672629, -6.163468, 0, 1.5, 0.5, 0.5
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
-3.233555, -3, -5.36989,
-3.233555, 3, -5.36989,
-3.233555, -3, -5.36989,
-3.390499, -3, -5.634417,
-3.233555, -2, -5.36989,
-3.390499, -2, -5.634417,
-3.233555, -1, -5.36989,
-3.390499, -1, -5.634417,
-3.233555, 0, -5.36989,
-3.390499, 0, -5.634417,
-3.233555, 1, -5.36989,
-3.390499, 1, -5.634417,
-3.233555, 2, -5.36989,
-3.390499, 2, -5.634417,
-3.233555, 3, -5.36989,
-3.390499, 3, -5.634417
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
-3.704388, -3, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, -3, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, -3, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, -3, -6.163468, 0, 1.5, 0.5, 0.5,
-3.704388, -2, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, -2, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, -2, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, -2, -6.163468, 0, 1.5, 0.5, 0.5,
-3.704388, -1, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, -1, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, -1, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, -1, -6.163468, 0, 1.5, 0.5, 0.5,
-3.704388, 0, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, 0, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, 0, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, 0, -6.163468, 0, 1.5, 0.5, 0.5,
-3.704388, 1, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, 1, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, 1, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, 1, -6.163468, 0, 1.5, 0.5, 0.5,
-3.704388, 2, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, 2, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, 2, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, 2, -6.163468, 0, 1.5, 0.5, 0.5,
-3.704388, 3, -6.163468, 0, -0.5, 0.5, 0.5,
-3.704388, 3, -6.163468, 1, -0.5, 0.5, 0.5,
-3.704388, 3, -6.163468, 1, 1.5, 0.5, 0.5,
-3.704388, 3, -6.163468, 0, 1.5, 0.5, 0.5
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
-3.233555, -3.161848, -4,
-3.233555, -3.161848, 4,
-3.233555, -3.161848, -4,
-3.390499, -3.332108, -4,
-3.233555, -3.161848, -2,
-3.390499, -3.332108, -2,
-3.233555, -3.161848, 0,
-3.390499, -3.332108, 0,
-3.233555, -3.161848, 2,
-3.390499, -3.332108, 2,
-3.233555, -3.161848, 4,
-3.390499, -3.332108, 4
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
-3.704388, -3.672629, -4, 0, -0.5, 0.5, 0.5,
-3.704388, -3.672629, -4, 1, -0.5, 0.5, 0.5,
-3.704388, -3.672629, -4, 1, 1.5, 0.5, 0.5,
-3.704388, -3.672629, -4, 0, 1.5, 0.5, 0.5,
-3.704388, -3.672629, -2, 0, -0.5, 0.5, 0.5,
-3.704388, -3.672629, -2, 1, -0.5, 0.5, 0.5,
-3.704388, -3.672629, -2, 1, 1.5, 0.5, 0.5,
-3.704388, -3.672629, -2, 0, 1.5, 0.5, 0.5,
-3.704388, -3.672629, 0, 0, -0.5, 0.5, 0.5,
-3.704388, -3.672629, 0, 1, -0.5, 0.5, 0.5,
-3.704388, -3.672629, 0, 1, 1.5, 0.5, 0.5,
-3.704388, -3.672629, 0, 0, 1.5, 0.5, 0.5,
-3.704388, -3.672629, 2, 0, -0.5, 0.5, 0.5,
-3.704388, -3.672629, 2, 1, -0.5, 0.5, 0.5,
-3.704388, -3.672629, 2, 1, 1.5, 0.5, 0.5,
-3.704388, -3.672629, 2, 0, 1.5, 0.5, 0.5,
-3.704388, -3.672629, 4, 0, -0.5, 0.5, 0.5,
-3.704388, -3.672629, 4, 1, -0.5, 0.5, 0.5,
-3.704388, -3.672629, 4, 1, 1.5, 0.5, 0.5,
-3.704388, -3.672629, 4, 0, 1.5, 0.5, 0.5
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
-3.233555, -3.161848, -5.36989,
-3.233555, 3.648571, -5.36989,
-3.233555, -3.161848, 5.211154,
-3.233555, 3.648571, 5.211154,
-3.233555, -3.161848, -5.36989,
-3.233555, -3.161848, 5.211154,
-3.233555, 3.648571, -5.36989,
-3.233555, 3.648571, 5.211154,
-3.233555, -3.161848, -5.36989,
3.044217, -3.161848, -5.36989,
-3.233555, -3.161848, 5.211154,
3.044217, -3.161848, 5.211154,
-3.233555, 3.648571, -5.36989,
3.044217, 3.648571, -5.36989,
-3.233555, 3.648571, 5.211154,
3.044217, 3.648571, 5.211154,
3.044217, -3.161848, -5.36989,
3.044217, 3.648571, -5.36989,
3.044217, -3.161848, 5.211154,
3.044217, 3.648571, 5.211154,
3.044217, -3.161848, -5.36989,
3.044217, -3.161848, 5.211154,
3.044217, 3.648571, -5.36989,
3.044217, 3.648571, 5.211154
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
var radius = 7.509041;
var distance = 33.40857;
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
mvMatrix.translate( 0.09466875, -0.2433615, 0.07936835 );
mvMatrix.scale( 1.293281, 1.192133, 0.7673083 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.40857);
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
pyribenzoxim<-read.table("pyribenzoxim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyribenzoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
```

```r
y<-pyribenzoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
```

```r
z<-pyribenzoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
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
-3.142131, 0.7191362, -1.134158, 0, 0, 1, 1, 1,
-2.937776, 1.474117, -2.185809, 1, 0, 0, 1, 1,
-2.823354, -1.748112, -1.688857, 1, 0, 0, 1, 1,
-2.812449, 1.429143, 0.7024446, 1, 0, 0, 1, 1,
-2.646394, -0.9642414, -0.6146101, 1, 0, 0, 1, 1,
-2.546231, 0.8728656, -1.893906, 1, 0, 0, 1, 1,
-2.519996, -0.9449414, -2.639964, 0, 0, 0, 1, 1,
-2.518777, 0.3271445, -1.853721, 0, 0, 0, 1, 1,
-2.47029, -1.093339, 0.1870011, 0, 0, 0, 1, 1,
-2.396948, 1.633472, 1.670208, 0, 0, 0, 1, 1,
-2.391786, 0.9233087, -1.053162, 0, 0, 0, 1, 1,
-2.334325, 1.015275, -0.1401399, 0, 0, 0, 1, 1,
-2.262203, 1.649281, -2.046015, 0, 0, 0, 1, 1,
-2.253533, 0.7746919, 0.5685854, 1, 1, 1, 1, 1,
-2.226085, -0.6079956, -3.929591, 1, 1, 1, 1, 1,
-2.219386, 0.3652472, -2.141769, 1, 1, 1, 1, 1,
-2.198028, -0.324862, -0.6820778, 1, 1, 1, 1, 1,
-2.182886, -1.267848, -3.6402, 1, 1, 1, 1, 1,
-2.181046, -0.06215623, -1.148271, 1, 1, 1, 1, 1,
-2.137929, 1.351043, -1.263014, 1, 1, 1, 1, 1,
-2.115592, 0.1004395, 0.02812196, 1, 1, 1, 1, 1,
-2.102617, 0.8264673, -0.4800246, 1, 1, 1, 1, 1,
-2.057046, -0.8716924, -0.1166756, 1, 1, 1, 1, 1,
-2.036571, 0.3533488, -0.9509382, 1, 1, 1, 1, 1,
-2.012237, -0.5996137, -0.3405572, 1, 1, 1, 1, 1,
-2.008485, -0.8031331, -2.051138, 1, 1, 1, 1, 1,
-1.96646, 2.425084, 0.2727427, 1, 1, 1, 1, 1,
-1.965339, -0.2994727, -1.611298, 1, 1, 1, 1, 1,
-1.944901, 1.261198, -1.66555, 0, 0, 1, 1, 1,
-1.924021, 0.2026316, 0.03792739, 1, 0, 0, 1, 1,
-1.914029, -0.2767779, -1.278902, 1, 0, 0, 1, 1,
-1.913206, 1.303495, 0.7908853, 1, 0, 0, 1, 1,
-1.899964, -1.619302, -2.47081, 1, 0, 0, 1, 1,
-1.873202, 0.9932151, -1.572307, 1, 0, 0, 1, 1,
-1.870715, -0.36098, -1.964703, 0, 0, 0, 1, 1,
-1.830299, 0.3437545, -0.878458, 0, 0, 0, 1, 1,
-1.811632, 1.244498, -0.9851126, 0, 0, 0, 1, 1,
-1.792755, -1.920445, -3.892222, 0, 0, 0, 1, 1,
-1.787265, 0.8556308, -0.1028408, 0, 0, 0, 1, 1,
-1.77215, 1.059496, -0.9832008, 0, 0, 0, 1, 1,
-1.769786, -0.2547498, -0.7289344, 0, 0, 0, 1, 1,
-1.768384, 0.6649302, -2.826644, 1, 1, 1, 1, 1,
-1.706436, -0.264782, -3.169932, 1, 1, 1, 1, 1,
-1.7002, 1.049735, 0.2747843, 1, 1, 1, 1, 1,
-1.685943, -0.02283797, -1.548907, 1, 1, 1, 1, 1,
-1.681455, 1.304416, 0.1517307, 1, 1, 1, 1, 1,
-1.644893, 2.288255, -0.8224134, 1, 1, 1, 1, 1,
-1.641469, 0.3305427, -1.07713, 1, 1, 1, 1, 1,
-1.630455, -0.4833253, -1.008298, 1, 1, 1, 1, 1,
-1.622793, 0.8589067, -2.512137, 1, 1, 1, 1, 1,
-1.620711, -0.9418514, -2.314443, 1, 1, 1, 1, 1,
-1.598687, 1.486467, -1.653335, 1, 1, 1, 1, 1,
-1.582145, 0.9150964, -0.2614219, 1, 1, 1, 1, 1,
-1.580897, -1.334055, -2.478309, 1, 1, 1, 1, 1,
-1.556342, 1.120994, -0.592944, 1, 1, 1, 1, 1,
-1.554463, -0.4079419, -1.82128, 1, 1, 1, 1, 1,
-1.553082, -1.817012, -2.900443, 0, 0, 1, 1, 1,
-1.533783, 1.256082, -1.574975, 1, 0, 0, 1, 1,
-1.526339, -0.9038885, -2.869781, 1, 0, 0, 1, 1,
-1.523645, 0.90545, -1.709468, 1, 0, 0, 1, 1,
-1.516259, 0.5588192, -0.166981, 1, 0, 0, 1, 1,
-1.508426, 1.107123, -1.059844, 1, 0, 0, 1, 1,
-1.505226, 0.1960362, -2.298047, 0, 0, 0, 1, 1,
-1.49035, -1.932598, -2.178928, 0, 0, 0, 1, 1,
-1.48968, 1.730905, -1.617212, 0, 0, 0, 1, 1,
-1.484514, -1.488467, -3.266821, 0, 0, 0, 1, 1,
-1.47922, 0.1217947, -2.312475, 0, 0, 0, 1, 1,
-1.473733, -0.9169591, -1.623282, 0, 0, 0, 1, 1,
-1.473651, -0.5724556, -0.5672508, 0, 0, 0, 1, 1,
-1.46975, -1.51903, -2.864538, 1, 1, 1, 1, 1,
-1.462005, -0.9348831, -1.466374, 1, 1, 1, 1, 1,
-1.458626, 0.8291529, 0.2986148, 1, 1, 1, 1, 1,
-1.45289, 0.1570003, 0.5172418, 1, 1, 1, 1, 1,
-1.443908, -0.6592618, -2.196939, 1, 1, 1, 1, 1,
-1.44086, 1.556845, -1.523843, 1, 1, 1, 1, 1,
-1.437767, 0.3275693, -1.666833, 1, 1, 1, 1, 1,
-1.433637, -0.6533852, -2.295641, 1, 1, 1, 1, 1,
-1.425204, 1.066394, -1.720943, 1, 1, 1, 1, 1,
-1.417204, 0.8041263, -1.136097, 1, 1, 1, 1, 1,
-1.414892, -0.3145934, -2.859212, 1, 1, 1, 1, 1,
-1.400928, -0.601087, -2.941021, 1, 1, 1, 1, 1,
-1.394167, 0.7400718, 0.9368755, 1, 1, 1, 1, 1,
-1.390254, -0.5585318, -2.737724, 1, 1, 1, 1, 1,
-1.385939, -0.5549824, -0.8845289, 1, 1, 1, 1, 1,
-1.380129, -1.111623, -2.178081, 0, 0, 1, 1, 1,
-1.376427, 0.09271338, -0.5929118, 1, 0, 0, 1, 1,
-1.371609, -0.8832108, -1.015322, 1, 0, 0, 1, 1,
-1.370078, 0.6830708, -2.117719, 1, 0, 0, 1, 1,
-1.365027, -0.1415037, 0.8453506, 1, 0, 0, 1, 1,
-1.36449, -0.9018567, -1.704293, 1, 0, 0, 1, 1,
-1.357526, -0.564212, -2.773615, 0, 0, 0, 1, 1,
-1.351465, 1.32453, -0.8127801, 0, 0, 0, 1, 1,
-1.349539, -0.9444126, -2.693231, 0, 0, 0, 1, 1,
-1.347722, 1.310331, 0.9264775, 0, 0, 0, 1, 1,
-1.344224, -1.106058, -2.120888, 0, 0, 0, 1, 1,
-1.339569, 0.5331068, -2.045793, 0, 0, 0, 1, 1,
-1.336323, -1.878364, -1.911092, 0, 0, 0, 1, 1,
-1.333051, 1.737261, -0.9294489, 1, 1, 1, 1, 1,
-1.33193, 0.5131614, -2.110493, 1, 1, 1, 1, 1,
-1.327704, 0.6576387, -0.4311535, 1, 1, 1, 1, 1,
-1.320923, 0.9017919, -0.2815182, 1, 1, 1, 1, 1,
-1.291346, 0.1077012, -0.1606057, 1, 1, 1, 1, 1,
-1.281567, 0.9069642, -2.384512, 1, 1, 1, 1, 1,
-1.280903, 0.4438089, -0.4857766, 1, 1, 1, 1, 1,
-1.28014, -0.8712748, -5.215797, 1, 1, 1, 1, 1,
-1.272898, -0.6176321, -2.497839, 1, 1, 1, 1, 1,
-1.268214, 0.1736493, -0.07835556, 1, 1, 1, 1, 1,
-1.266528, 1.723429, -0.1127659, 1, 1, 1, 1, 1,
-1.265267, 0.5316334, -1.528531, 1, 1, 1, 1, 1,
-1.248941, -0.9338257, -2.318779, 1, 1, 1, 1, 1,
-1.248479, 0.7502499, -2.193756, 1, 1, 1, 1, 1,
-1.234418, -1.259513, -1.209815, 1, 1, 1, 1, 1,
-1.21876, 1.002818, -1.523293, 0, 0, 1, 1, 1,
-1.21189, 0.6357849, -2.078564, 1, 0, 0, 1, 1,
-1.205537, 0.6421351, -2.649178, 1, 0, 0, 1, 1,
-1.20423, 0.1641585, -2.112708, 1, 0, 0, 1, 1,
-1.203123, -2.54444, -2.787512, 1, 0, 0, 1, 1,
-1.195614, 1.734153, -0.4357597, 1, 0, 0, 1, 1,
-1.193799, 0.3326362, -1.857218, 0, 0, 0, 1, 1,
-1.188322, -0.352387, -1.685812, 0, 0, 0, 1, 1,
-1.184474, 2.060102, -0.3195509, 0, 0, 0, 1, 1,
-1.181801, -1.339202, -0.3527687, 0, 0, 0, 1, 1,
-1.17212, -0.8646291, -1.60883, 0, 0, 0, 1, 1,
-1.164398, 0.8682704, -2.004987, 0, 0, 0, 1, 1,
-1.157207, -0.7749397, -0.07367389, 0, 0, 0, 1, 1,
-1.155787, 0.6615336, -1.597594, 1, 1, 1, 1, 1,
-1.154476, 1.378706, -0.08662952, 1, 1, 1, 1, 1,
-1.14776, 0.07316986, -0.7348535, 1, 1, 1, 1, 1,
-1.137758, 0.06358432, -2.265681, 1, 1, 1, 1, 1,
-1.136906, -0.3308291, -2.740406, 1, 1, 1, 1, 1,
-1.129326, -0.1841945, -0.5181727, 1, 1, 1, 1, 1,
-1.125344, -0.0286334, -1.163545, 1, 1, 1, 1, 1,
-1.112443, -0.3467019, -0.6651295, 1, 1, 1, 1, 1,
-1.107521, -0.006555041, -1.67527, 1, 1, 1, 1, 1,
-1.106815, 0.5572525, -2.388496, 1, 1, 1, 1, 1,
-1.10655, -0.4846391, -0.9041095, 1, 1, 1, 1, 1,
-1.102719, -0.743745, -3.831351, 1, 1, 1, 1, 1,
-1.100651, -0.3557068, -2.472221, 1, 1, 1, 1, 1,
-1.100415, -0.09644645, -1.118095, 1, 1, 1, 1, 1,
-1.098075, -0.6380234, -1.976274, 1, 1, 1, 1, 1,
-1.097219, 1.724058, -0.8594537, 0, 0, 1, 1, 1,
-1.093026, 1.14172, 0.4964385, 1, 0, 0, 1, 1,
-1.089378, -0.4873404, -3.546423, 1, 0, 0, 1, 1,
-1.08802, 0.7440221, -2.471811, 1, 0, 0, 1, 1,
-1.082884, -0.02942326, -1.328688, 1, 0, 0, 1, 1,
-1.076444, -0.522441, -1.604154, 1, 0, 0, 1, 1,
-1.07139, -0.5619933, -2.68967, 0, 0, 0, 1, 1,
-1.066371, -0.5032663, -1.751715, 0, 0, 0, 1, 1,
-1.062681, -0.3584209, -2.554919, 0, 0, 0, 1, 1,
-1.060966, -0.5115321, -2.186406, 0, 0, 0, 1, 1,
-1.042688, -0.3670049, -2.347471, 0, 0, 0, 1, 1,
-1.041951, 0.8974966, -0.6625295, 0, 0, 0, 1, 1,
-1.038964, -2.147824, -3.974428, 0, 0, 0, 1, 1,
-1.034358, -0.9473099, -0.8891938, 1, 1, 1, 1, 1,
-1.022754, -1.282136, -2.836752, 1, 1, 1, 1, 1,
-1.018708, -0.1109179, -2.133421, 1, 1, 1, 1, 1,
-1.004601, 0.3838632, -2.169377, 1, 1, 1, 1, 1,
-0.9999834, -1.925539, -3.774359, 1, 1, 1, 1, 1,
-0.9995377, 2.383227, -1.744769, 1, 1, 1, 1, 1,
-0.9954838, 0.4757814, -0.7540754, 1, 1, 1, 1, 1,
-0.9928298, 0.4042197, -0.6473091, 1, 1, 1, 1, 1,
-0.9872714, -0.3114016, -2.390621, 1, 1, 1, 1, 1,
-0.976132, -0.655708, -2.426819, 1, 1, 1, 1, 1,
-0.9662172, -2.090255, -2.351398, 1, 1, 1, 1, 1,
-0.9651978, 0.7928109, -2.460151, 1, 1, 1, 1, 1,
-0.959896, 0.07892121, -2.03663, 1, 1, 1, 1, 1,
-0.9416826, -0.2088244, -1.72848, 1, 1, 1, 1, 1,
-0.9217316, -2.122419, -3.693244, 1, 1, 1, 1, 1,
-0.9207563, 0.5948685, -1.844825, 0, 0, 1, 1, 1,
-0.9032677, -0.6056653, -1.189911, 1, 0, 0, 1, 1,
-0.9004438, -1.051411, 0.8656117, 1, 0, 0, 1, 1,
-0.9002244, -0.1594908, -1.337658, 1, 0, 0, 1, 1,
-0.8870603, -1.562966, -2.502889, 1, 0, 0, 1, 1,
-0.8846975, -1.035864, -2.9099, 1, 0, 0, 1, 1,
-0.879703, -0.08416151, -2.492491, 0, 0, 0, 1, 1,
-0.8776606, -0.3658704, -1.866581, 0, 0, 0, 1, 1,
-0.8699133, 0.550785, 1.026116, 0, 0, 0, 1, 1,
-0.8694295, -0.9929104, -1.427116, 0, 0, 0, 1, 1,
-0.8615074, 2.003114, -1.46145, 0, 0, 0, 1, 1,
-0.8602256, 0.4404643, -1.398713, 0, 0, 0, 1, 1,
-0.8543262, -0.2224661, -3.970496, 0, 0, 0, 1, 1,
-0.8519967, -0.08289769, -2.694818, 1, 1, 1, 1, 1,
-0.8503049, 2.862467, -0.9721658, 1, 1, 1, 1, 1,
-0.8495656, -0.2549338, -1.97185, 1, 1, 1, 1, 1,
-0.8494497, 1.58434, 0.1741605, 1, 1, 1, 1, 1,
-0.8461368, 0.1373582, -1.550491, 1, 1, 1, 1, 1,
-0.8430865, -0.01605531, -2.854567, 1, 1, 1, 1, 1,
-0.8419402, -1.595388, -3.5956, 1, 1, 1, 1, 1,
-0.836561, -0.3640198, -2.19205, 1, 1, 1, 1, 1,
-0.8348429, -0.4229798, -2.084885, 1, 1, 1, 1, 1,
-0.8326041, 3.020876, 1.24564, 1, 1, 1, 1, 1,
-0.830777, -0.2596727, -2.284528, 1, 1, 1, 1, 1,
-0.8188863, 0.3438679, -2.54674, 1, 1, 1, 1, 1,
-0.8149589, 0.6743459, -0.7757351, 1, 1, 1, 1, 1,
-0.8085327, 0.2571459, -1.329845, 1, 1, 1, 1, 1,
-0.8075441, -0.9606342, -1.094542, 1, 1, 1, 1, 1,
-0.8057053, -0.5664512, -1.993386, 0, 0, 1, 1, 1,
-0.8042791, -0.3966494, -3.177832, 1, 0, 0, 1, 1,
-0.7991735, -1.447824, -1.719507, 1, 0, 0, 1, 1,
-0.7983753, -0.7712467, -1.931298, 1, 0, 0, 1, 1,
-0.791044, -0.3740942, -1.829425, 1, 0, 0, 1, 1,
-0.7852797, -0.663332, -3.092394, 1, 0, 0, 1, 1,
-0.7851867, -0.5731229, -2.37185, 0, 0, 0, 1, 1,
-0.7831117, -0.8430911, -1.220506, 0, 0, 0, 1, 1,
-0.7821878, 0.1861054, -1.394659, 0, 0, 0, 1, 1,
-0.7728156, -1.813073, -2.345491, 0, 0, 0, 1, 1,
-0.7710652, 1.910512, -1.445191, 0, 0, 0, 1, 1,
-0.7691509, 0.6822247, -1.634167, 0, 0, 0, 1, 1,
-0.7660161, -0.8193936, -1.569157, 0, 0, 0, 1, 1,
-0.7640125, -0.4478864, -1.657796, 1, 1, 1, 1, 1,
-0.7635288, 0.06329097, -1.94034, 1, 1, 1, 1, 1,
-0.7630506, 0.4637037, -0.5559867, 1, 1, 1, 1, 1,
-0.75777, 0.7279937, -0.9874381, 1, 1, 1, 1, 1,
-0.7487483, -0.3451481, -0.3540938, 1, 1, 1, 1, 1,
-0.7417052, 0.1311426, -2.09508, 1, 1, 1, 1, 1,
-0.7410197, 1.673546, -0.1148166, 1, 1, 1, 1, 1,
-0.7395246, -0.8622329, -2.850045, 1, 1, 1, 1, 1,
-0.7373725, 0.08428959, -1.311594, 1, 1, 1, 1, 1,
-0.7367696, -0.3691962, -4.285219, 1, 1, 1, 1, 1,
-0.7334193, 2.407371, -0.540649, 1, 1, 1, 1, 1,
-0.7303742, -0.6228534, -1.836861, 1, 1, 1, 1, 1,
-0.7299681, -1.084542, -0.6606737, 1, 1, 1, 1, 1,
-0.727649, 0.6460459, -1.927821, 1, 1, 1, 1, 1,
-0.7265211, -0.7997341, -0.9360051, 1, 1, 1, 1, 1,
-0.7264008, 0.1405369, -1.199806, 0, 0, 1, 1, 1,
-0.7261285, 0.6858465, -1.334133, 1, 0, 0, 1, 1,
-0.7241352, 0.9576913, 1.457383, 1, 0, 0, 1, 1,
-0.7232726, -0.476885, -2.174171, 1, 0, 0, 1, 1,
-0.7217337, 1.961306, -1.052089, 1, 0, 0, 1, 1,
-0.720762, -1.935552, -2.488936, 1, 0, 0, 1, 1,
-0.7195719, -0.5289807, -2.399112, 0, 0, 0, 1, 1,
-0.7139855, -1.268291, -2.809084, 0, 0, 0, 1, 1,
-0.7126216, -1.614277, -3.526513, 0, 0, 0, 1, 1,
-0.7122304, -0.3095823, -0.8691882, 0, 0, 0, 1, 1,
-0.7104809, -0.8309853, -2.249068, 0, 0, 0, 1, 1,
-0.7095703, -1.01678, -2.730502, 0, 0, 0, 1, 1,
-0.7068655, -1.073409, -4.810158, 0, 0, 0, 1, 1,
-0.7016078, 0.1518136, -0.7036629, 1, 1, 1, 1, 1,
-0.6976757, 0.1931121, -2.86089, 1, 1, 1, 1, 1,
-0.6947715, -0.249229, -2.627149, 1, 1, 1, 1, 1,
-0.6933402, 0.5624843, -1.244084, 1, 1, 1, 1, 1,
-0.6930384, -0.9720346, -2.695148, 1, 1, 1, 1, 1,
-0.6870595, -0.4368472, -1.520301, 1, 1, 1, 1, 1,
-0.6833888, -0.3187267, -2.254778, 1, 1, 1, 1, 1,
-0.6798861, -0.2917382, -0.794894, 1, 1, 1, 1, 1,
-0.6792668, 0.0196653, -0.8067517, 1, 1, 1, 1, 1,
-0.6782774, -1.350355, -2.43357, 1, 1, 1, 1, 1,
-0.6771301, 0.6409472, -1.683951, 1, 1, 1, 1, 1,
-0.6735208, 1.051946, 0.2519599, 1, 1, 1, 1, 1,
-0.6718042, -1.849798, -2.606616, 1, 1, 1, 1, 1,
-0.6694641, -1.709927, -3.32398, 1, 1, 1, 1, 1,
-0.6693956, -0.5064716, -2.259767, 1, 1, 1, 1, 1,
-0.6676069, 0.1491663, -1.236565, 0, 0, 1, 1, 1,
-0.6628507, 0.3835831, 0.3205861, 1, 0, 0, 1, 1,
-0.6602451, 0.3033319, -1.594871, 1, 0, 0, 1, 1,
-0.6574432, 0.2245898, -3.350955, 1, 0, 0, 1, 1,
-0.6546218, -0.6091027, -1.381381, 1, 0, 0, 1, 1,
-0.6498012, 0.7440185, -0.6534665, 1, 0, 0, 1, 1,
-0.6444439, -0.4906479, -1.865912, 0, 0, 0, 1, 1,
-0.6433089, 0.02663019, -1.435632, 0, 0, 0, 1, 1,
-0.6329979, -0.0246375, -1.506604, 0, 0, 0, 1, 1,
-0.6315634, -1.297006, -3.501917, 0, 0, 0, 1, 1,
-0.6220042, -1.252768, -4.910022, 0, 0, 0, 1, 1,
-0.6158377, -0.04333203, -2.716027, 0, 0, 0, 1, 1,
-0.6092818, 1.108086, -1.048289, 0, 0, 0, 1, 1,
-0.6086379, -0.177189, -1.78896, 1, 1, 1, 1, 1,
-0.6075822, -0.01944871, -2.162896, 1, 1, 1, 1, 1,
-0.6055599, -1.159818, -2.321359, 1, 1, 1, 1, 1,
-0.6055598, -2.661718, -3.220368, 1, 1, 1, 1, 1,
-0.6050956, 0.7079974, -1.065555, 1, 1, 1, 1, 1,
-0.6037686, -0.6149628, -2.551486, 1, 1, 1, 1, 1,
-0.6030829, -0.6460056, -1.970335, 1, 1, 1, 1, 1,
-0.5968483, 0.6505159, -0.3709585, 1, 1, 1, 1, 1,
-0.5901962, -0.9716974, -1.74815, 1, 1, 1, 1, 1,
-0.5889048, 1.573854, 1.147689, 1, 1, 1, 1, 1,
-0.5880417, -1.640387, -2.378181, 1, 1, 1, 1, 1,
-0.5853283, 0.2633401, -1.801021, 1, 1, 1, 1, 1,
-0.5846165, -0.9225439, -4.182193, 1, 1, 1, 1, 1,
-0.5789123, -0.4672516, -3.069971, 1, 1, 1, 1, 1,
-0.5731097, 0.4315473, -1.349573, 1, 1, 1, 1, 1,
-0.5730496, 2.212804, -0.8058714, 0, 0, 1, 1, 1,
-0.5727895, -0.5877246, -1.702698, 1, 0, 0, 1, 1,
-0.5656266, -0.3709736, -1.732653, 1, 0, 0, 1, 1,
-0.5634128, 1.769005, -0.1404641, 1, 0, 0, 1, 1,
-0.561415, -0.1076498, -0.4141215, 1, 0, 0, 1, 1,
-0.5596581, 0.272067, -2.735906, 1, 0, 0, 1, 1,
-0.5596285, -0.1898921, -2.757595, 0, 0, 0, 1, 1,
-0.5588736, 0.07520834, -1.142918, 0, 0, 0, 1, 1,
-0.5564484, 0.5574344, 0.592017, 0, 0, 0, 1, 1,
-0.5562277, 0.4467913, -1.634586, 0, 0, 0, 1, 1,
-0.5508597, 0.9645587, -1.026947, 0, 0, 0, 1, 1,
-0.5493148, 0.5077429, -0.3109003, 0, 0, 0, 1, 1,
-0.5466398, 1.087279, -0.7971128, 0, 0, 0, 1, 1,
-0.545362, -0.4846101, -4.34445, 1, 1, 1, 1, 1,
-0.5359809, -1.150897, -3.287822, 1, 1, 1, 1, 1,
-0.5333208, 1.030351, 0.4617413, 1, 1, 1, 1, 1,
-0.5319904, 1.988337, -0.1424203, 1, 1, 1, 1, 1,
-0.5293522, 0.2903827, -1.101783, 1, 1, 1, 1, 1,
-0.5289374, -0.323159, -2.506125, 1, 1, 1, 1, 1,
-0.5255541, 1.568285, -1.006923, 1, 1, 1, 1, 1,
-0.5223581, -0.2482128, -3.366482, 1, 1, 1, 1, 1,
-0.5123642, -0.6904044, -0.2902077, 1, 1, 1, 1, 1,
-0.508705, 0.1608239, -2.49805, 1, 1, 1, 1, 1,
-0.5082542, -3.062667, -2.765544, 1, 1, 1, 1, 1,
-0.5075423, 0.915226, 1.247926, 1, 1, 1, 1, 1,
-0.4917974, 1.384008, 1.272558, 1, 1, 1, 1, 1,
-0.4913164, -0.4145064, -0.05125883, 1, 1, 1, 1, 1,
-0.4827999, 0.663395, -0.04936371, 1, 1, 1, 1, 1,
-0.4782417, 0.1368286, -0.6019789, 0, 0, 1, 1, 1,
-0.4755031, -1.147098, -2.466019, 1, 0, 0, 1, 1,
-0.4753183, 0.7485397, -0.5194361, 1, 0, 0, 1, 1,
-0.4725412, -1.98752, -4.113842, 1, 0, 0, 1, 1,
-0.4724359, -1.461167, -3.020522, 1, 0, 0, 1, 1,
-0.4696769, 0.4228095, -0.2009316, 1, 0, 0, 1, 1,
-0.4686424, 0.05090757, -0.0485058, 0, 0, 0, 1, 1,
-0.4618652, -1.331472, -2.509862, 0, 0, 0, 1, 1,
-0.460929, 1.911217, -1.045507, 0, 0, 0, 1, 1,
-0.4601306, -0.588109, -3.422072, 0, 0, 0, 1, 1,
-0.4594854, -0.2208961, -1.809467, 0, 0, 0, 1, 1,
-0.4574646, -0.9824725, -1.796591, 0, 0, 0, 1, 1,
-0.4571218, 0.610175, -0.5574586, 0, 0, 0, 1, 1,
-0.4545248, -0.6960659, -3.873471, 1, 1, 1, 1, 1,
-0.4464325, -2.084933, -0.9053496, 1, 1, 1, 1, 1,
-0.4423067, -0.2694598, -2.344439, 1, 1, 1, 1, 1,
-0.4418325, 0.8734396, 0.3827665, 1, 1, 1, 1, 1,
-0.4382087, -1.008879, -3.327969, 1, 1, 1, 1, 1,
-0.4377256, -1.490136, -2.719738, 1, 1, 1, 1, 1,
-0.4347252, -1.131358, -3.759698, 1, 1, 1, 1, 1,
-0.4333608, 0.1281738, 0.4275617, 1, 1, 1, 1, 1,
-0.4278981, 0.1828141, -1.111158, 1, 1, 1, 1, 1,
-0.4248933, -0.2750499, -0.03377462, 1, 1, 1, 1, 1,
-0.4196333, -0.0150239, -1.478526, 1, 1, 1, 1, 1,
-0.4186049, -0.9828984, -3.273947, 1, 1, 1, 1, 1,
-0.4122584, 0.2400909, -0.2699161, 1, 1, 1, 1, 1,
-0.4094506, 0.2601084, -1.547415, 1, 1, 1, 1, 1,
-0.409117, 0.3973795, -1.372742, 1, 1, 1, 1, 1,
-0.4086172, -0.7185473, -3.35643, 0, 0, 1, 1, 1,
-0.4043579, -1.622095, -0.5941468, 1, 0, 0, 1, 1,
-0.4038311, -1.569206, -5.062306, 1, 0, 0, 1, 1,
-0.4013407, -0.6946273, -2.199142, 1, 0, 0, 1, 1,
-0.4012367, 0.3354393, -1.306922, 1, 0, 0, 1, 1,
-0.3982738, -0.9252999, -1.677892, 1, 0, 0, 1, 1,
-0.3981106, 1.447123, 0.7506594, 0, 0, 0, 1, 1,
-0.3979169, 1.275057, 1.041625, 0, 0, 0, 1, 1,
-0.3888467, 1.034855, 0.3271537, 0, 0, 0, 1, 1,
-0.3845499, -0.1669011, -1.825953, 0, 0, 0, 1, 1,
-0.3825755, 0.31477, -0.7973258, 0, 0, 0, 1, 1,
-0.382092, 0.8167831, -0.1091582, 0, 0, 0, 1, 1,
-0.3820402, -0.7415987, -3.337179, 0, 0, 0, 1, 1,
-0.3796958, -0.1817193, -3.319027, 1, 1, 1, 1, 1,
-0.379657, 0.5478239, 0.5921777, 1, 1, 1, 1, 1,
-0.3779899, 0.3008569, 0.3545141, 1, 1, 1, 1, 1,
-0.3762623, -1.657971, -4.884806, 1, 1, 1, 1, 1,
-0.3758985, -0.8896878, -1.84516, 1, 1, 1, 1, 1,
-0.3727825, -0.5752549, -3.082774, 1, 1, 1, 1, 1,
-0.3713709, -0.6121342, -2.938888, 1, 1, 1, 1, 1,
-0.3707228, 0.4287198, -0.6351169, 1, 1, 1, 1, 1,
-0.3699086, -1.705776, -2.466305, 1, 1, 1, 1, 1,
-0.3643488, 1.462411, -0.9494815, 1, 1, 1, 1, 1,
-0.3612252, 1.160656, -0.53854, 1, 1, 1, 1, 1,
-0.3605196, 2.098675, -1.811789, 1, 1, 1, 1, 1,
-0.352989, -0.520439, -1.954399, 1, 1, 1, 1, 1,
-0.3527434, 0.01334976, -1.093538, 1, 1, 1, 1, 1,
-0.3516118, -0.5384645, -3.404234, 1, 1, 1, 1, 1,
-0.3496205, 0.5808721, 0.09747252, 0, 0, 1, 1, 1,
-0.3484405, -0.3999825, -1.532049, 1, 0, 0, 1, 1,
-0.3446168, 0.9796785, 0.07354801, 1, 0, 0, 1, 1,
-0.3434114, -1.64806, -1.265907, 1, 0, 0, 1, 1,
-0.3402007, 0.8105008, 0.2097492, 1, 0, 0, 1, 1,
-0.3327984, -1.09967, -2.41836, 1, 0, 0, 1, 1,
-0.3301688, 1.21358, 0.6096845, 0, 0, 0, 1, 1,
-0.3284348, -1.566324, -4.564635, 0, 0, 0, 1, 1,
-0.3264905, -0.2924535, -2.747702, 0, 0, 0, 1, 1,
-0.315197, -0.9901139, -2.682477, 0, 0, 0, 1, 1,
-0.3146368, 0.3297932, 1.601434, 0, 0, 0, 1, 1,
-0.3105516, -0.2129987, -2.388908, 0, 0, 0, 1, 1,
-0.3077971, -0.1601753, -2.769329, 0, 0, 0, 1, 1,
-0.3072911, -0.5376743, -1.823225, 1, 1, 1, 1, 1,
-0.3022759, 0.0495301, -0.6466264, 1, 1, 1, 1, 1,
-0.3007821, 0.5368321, 0.06076726, 1, 1, 1, 1, 1,
-0.3002874, -0.2286233, -3.383816, 1, 1, 1, 1, 1,
-0.294693, 2.147198, 1.628123, 1, 1, 1, 1, 1,
-0.2927209, -1.551798, -3.214063, 1, 1, 1, 1, 1,
-0.2888822, 1.239468, -1.37986, 1, 1, 1, 1, 1,
-0.2875117, 1.443136, 0.4674423, 1, 1, 1, 1, 1,
-0.287005, 0.649168, 1.415639, 1, 1, 1, 1, 1,
-0.2832321, 0.1872967, -0.4766492, 1, 1, 1, 1, 1,
-0.2758282, -0.29567, -1.844858, 1, 1, 1, 1, 1,
-0.2757761, 2.011186, 1.072288, 1, 1, 1, 1, 1,
-0.2709505, -0.09782171, -2.169718, 1, 1, 1, 1, 1,
-0.266637, 0.3313738, 0.4142005, 1, 1, 1, 1, 1,
-0.2590648, -0.2015116, -1.181276, 1, 1, 1, 1, 1,
-0.2575976, -0.2757681, -2.391903, 0, 0, 1, 1, 1,
-0.2571022, 1.499271, -0.02299013, 1, 0, 0, 1, 1,
-0.2560126, -0.2271585, -2.937836, 1, 0, 0, 1, 1,
-0.2547269, 0.8982381, -0.8633363, 1, 0, 0, 1, 1,
-0.2546346, -1.533547, -3.876389, 1, 0, 0, 1, 1,
-0.2523383, -0.02771709, -2.988243, 1, 0, 0, 1, 1,
-0.2498953, -0.9477089, -1.164748, 0, 0, 0, 1, 1,
-0.2482599, 0.5060575, -0.3123915, 0, 0, 0, 1, 1,
-0.2444307, 2.408546, 0.08944599, 0, 0, 0, 1, 1,
-0.2441227, -0.1987601, -2.843021, 0, 0, 0, 1, 1,
-0.2437879, 0.0003629806, -1.670123, 0, 0, 0, 1, 1,
-0.2410706, 1.118922, -1.088571, 0, 0, 0, 1, 1,
-0.2387262, 0.9016959, 0.8845717, 0, 0, 0, 1, 1,
-0.23191, -0.5066414, -2.113818, 1, 1, 1, 1, 1,
-0.2293643, -0.2186309, -3.059774, 1, 1, 1, 1, 1,
-0.2291532, -0.5343304, -2.249657, 1, 1, 1, 1, 1,
-0.2278797, -1.271429, -2.057565, 1, 1, 1, 1, 1,
-0.227692, 0.1707274, 0.323838, 1, 1, 1, 1, 1,
-0.222188, -0.09452923, -2.863223, 1, 1, 1, 1, 1,
-0.2207748, 1.223748, 1.112335, 1, 1, 1, 1, 1,
-0.2174212, -0.3984083, -2.551876, 1, 1, 1, 1, 1,
-0.2102866, -0.09325771, -0.9233989, 1, 1, 1, 1, 1,
-0.2082801, -0.7627606, -1.464053, 1, 1, 1, 1, 1,
-0.2038777, -0.4822975, -3.410454, 1, 1, 1, 1, 1,
-0.2030565, -0.9943058, -1.98489, 1, 1, 1, 1, 1,
-0.2009528, 1.569447, -0.263229, 1, 1, 1, 1, 1,
-0.19827, -0.5641659, -3.740069, 1, 1, 1, 1, 1,
-0.1936467, -0.683996, -2.733846, 1, 1, 1, 1, 1,
-0.1916004, 1.176025, -1.083026, 0, 0, 1, 1, 1,
-0.1905363, -0.1692704, -2.671535, 1, 0, 0, 1, 1,
-0.1905308, 1.703235, -1.651315, 1, 0, 0, 1, 1,
-0.1883993, 0.3489336, -0.4016493, 1, 0, 0, 1, 1,
-0.1871523, 0.2760302, 0.3630781, 1, 0, 0, 1, 1,
-0.1870096, -0.07392992, -2.727928, 1, 0, 0, 1, 1,
-0.1867241, -0.1624444, -3.029047, 0, 0, 0, 1, 1,
-0.1805997, -0.9591978, -4.025549, 0, 0, 0, 1, 1,
-0.1797181, 0.5283484, -0.1380302, 0, 0, 0, 1, 1,
-0.1788844, -0.3619981, -3.924427, 0, 0, 0, 1, 1,
-0.178725, 1.282277, -1.147724, 0, 0, 0, 1, 1,
-0.1786074, 1.324372, -0.6019666, 0, 0, 0, 1, 1,
-0.1772566, -1.309735, -3.761103, 0, 0, 0, 1, 1,
-0.174599, 1.195818, 0.4462393, 1, 1, 1, 1, 1,
-0.1736705, 0.1403512, -1.964537, 1, 1, 1, 1, 1,
-0.1702917, 0.859542, 1.058679, 1, 1, 1, 1, 1,
-0.1697662, 0.2798036, -2.570669, 1, 1, 1, 1, 1,
-0.1656541, 0.9722084, 0.2293971, 1, 1, 1, 1, 1,
-0.1649536, 0.4464267, -1.975496, 1, 1, 1, 1, 1,
-0.1597696, -0.7539025, -1.97885, 1, 1, 1, 1, 1,
-0.1585759, 0.04467205, -2.819465, 1, 1, 1, 1, 1,
-0.1538899, -1.7194, -2.455261, 1, 1, 1, 1, 1,
-0.1498712, -0.3595306, -1.695094, 1, 1, 1, 1, 1,
-0.1494636, 1.837361, -0.4487537, 1, 1, 1, 1, 1,
-0.149444, 0.2655154, -2.050518, 1, 1, 1, 1, 1,
-0.1475988, -0.07243842, -3.352681, 1, 1, 1, 1, 1,
-0.1449607, -0.1301986, -2.979211, 1, 1, 1, 1, 1,
-0.1408238, -0.1992563, -4.353821, 1, 1, 1, 1, 1,
-0.1390547, 0.5767595, -0.4354728, 0, 0, 1, 1, 1,
-0.133807, -2.204972, -4.10813, 1, 0, 0, 1, 1,
-0.1333007, -0.1631848, -0.7675001, 1, 0, 0, 1, 1,
-0.1297521, 0.2780159, 1.088333, 1, 0, 0, 1, 1,
-0.1296905, -0.03854983, -2.399425, 1, 0, 0, 1, 1,
-0.1254568, 0.7089157, -0.4806263, 1, 0, 0, 1, 1,
-0.1244241, 0.9534954, -0.01044867, 0, 0, 0, 1, 1,
-0.1192057, -2.124433, -2.739998, 0, 0, 0, 1, 1,
-0.1142303, -0.713458, -2.940844, 0, 0, 0, 1, 1,
-0.11183, -0.8690963, -3.024293, 0, 0, 0, 1, 1,
-0.1099251, 0.538363, 2.594518, 0, 0, 0, 1, 1,
-0.1069986, 1.759878, 1.079097, 0, 0, 0, 1, 1,
-0.1068737, -0.2395115, -1.969213, 0, 0, 0, 1, 1,
-0.1050281, 1.824573, 0.9038478, 1, 1, 1, 1, 1,
-0.1048376, 0.1481611, -0.9401266, 1, 1, 1, 1, 1,
-0.1035705, 0.8985119, -0.3081197, 1, 1, 1, 1, 1,
-0.1028601, 0.4061477, 0.08914594, 1, 1, 1, 1, 1,
-0.1001006, 0.5360214, 1.282129, 1, 1, 1, 1, 1,
-0.09961484, 0.1441004, -1.825645, 1, 1, 1, 1, 1,
-0.0995191, 1.627611, -1.591043, 1, 1, 1, 1, 1,
-0.09840794, 1.141036, -1.124953, 1, 1, 1, 1, 1,
-0.09692054, -0.0406222, -0.4037963, 1, 1, 1, 1, 1,
-0.08469187, -0.675629, -4.069022, 1, 1, 1, 1, 1,
-0.07591578, -0.6181758, -2.815779, 1, 1, 1, 1, 1,
-0.06408807, -0.71705, -4.378214, 1, 1, 1, 1, 1,
-0.06265315, 0.7104004, 2.002028, 1, 1, 1, 1, 1,
-0.06200458, -1.137907, -4.041945, 1, 1, 1, 1, 1,
-0.05987889, -0.748221, -1.357801, 1, 1, 1, 1, 1,
-0.05309431, 0.8437435, 0.04616243, 0, 0, 1, 1, 1,
-0.05126891, -0.7514923, -2.586507, 1, 0, 0, 1, 1,
-0.04772304, 0.7337905, 1.150788, 1, 0, 0, 1, 1,
-0.04630576, -1.109511, -3.277766, 1, 0, 0, 1, 1,
-0.04453965, 0.3793849, 0.4681164, 1, 0, 0, 1, 1,
-0.04449597, -0.9325436, -1.683297, 1, 0, 0, 1, 1,
-0.04415739, 0.1965681, -2.13121, 0, 0, 0, 1, 1,
-0.03972278, 0.8152631, -0.07122838, 0, 0, 0, 1, 1,
-0.0390056, -0.1371601, -0.962496, 0, 0, 0, 1, 1,
-0.03430342, 0.6121396, 0.00769654, 0, 0, 0, 1, 1,
-0.0294422, 0.6456809, 2.414407, 0, 0, 0, 1, 1,
-0.02938241, 0.8730344, 1.920931, 0, 0, 0, 1, 1,
-0.02754468, -0.3008803, -2.337355, 0, 0, 0, 1, 1,
-0.02023217, -0.5613948, -4.163049, 1, 1, 1, 1, 1,
-0.01980688, 0.6614584, -0.08631034, 1, 1, 1, 1, 1,
-0.01966449, -1.088605, -3.875889, 1, 1, 1, 1, 1,
-0.01879513, 1.409247, 0.873625, 1, 1, 1, 1, 1,
-0.01842986, 0.9450475, -1.064001, 1, 1, 1, 1, 1,
-0.01065538, 0.3575696, 0.1320655, 1, 1, 1, 1, 1,
-0.005111366, 0.5182281, -0.1513725, 1, 1, 1, 1, 1,
-0.004842484, 1.097536, 0.3679191, 1, 1, 1, 1, 1,
-0.002402242, 0.8704258, -0.6127988, 1, 1, 1, 1, 1,
-0.001361827, -1.20081, -4.839742, 1, 1, 1, 1, 1,
0.0005478939, 0.9422535, 1.268355, 1, 1, 1, 1, 1,
0.0009358145, 0.4383642, -0.4756635, 1, 1, 1, 1, 1,
0.001862436, 0.4925776, -0.05185272, 1, 1, 1, 1, 1,
0.002231523, -0.2935977, 3.075557, 1, 1, 1, 1, 1,
0.008055232, -0.06459144, 3.392836, 1, 1, 1, 1, 1,
0.008203229, 0.6151448, 0.4434591, 0, 0, 1, 1, 1,
0.008315089, 1.075661, 0.7183694, 1, 0, 0, 1, 1,
0.01200438, 1.54489, -0.6345755, 1, 0, 0, 1, 1,
0.01305162, -1.878295, 4.109808, 1, 0, 0, 1, 1,
0.01853467, -0.08250091, 2.678145, 1, 0, 0, 1, 1,
0.01990316, 0.4796783, 0.7410312, 1, 0, 0, 1, 1,
0.02359459, 0.08458512, -0.3566242, 0, 0, 0, 1, 1,
0.0237085, 0.780294, 0.7162377, 0, 0, 0, 1, 1,
0.02596267, 0.3312294, -1.35583, 0, 0, 0, 1, 1,
0.02738207, 2.421313, -1.323405, 0, 0, 0, 1, 1,
0.03021873, -0.09441045, 2.470649, 0, 0, 0, 1, 1,
0.03352828, 0.196819, -0.06275959, 0, 0, 0, 1, 1,
0.0338088, -0.5314963, 2.336655, 0, 0, 0, 1, 1,
0.03552693, 0.3452219, 0.4170877, 1, 1, 1, 1, 1,
0.03852083, -1.329859, 3.834738, 1, 1, 1, 1, 1,
0.0396352, 0.7739112, -0.6169564, 1, 1, 1, 1, 1,
0.04110457, -0.2127687, 1.476691, 1, 1, 1, 1, 1,
0.0413038, 0.02921122, 1.197857, 1, 1, 1, 1, 1,
0.04304555, -0.1626823, 2.406866, 1, 1, 1, 1, 1,
0.04416082, 0.4008982, -2.165663, 1, 1, 1, 1, 1,
0.0496572, 0.5597246, -1.662083, 1, 1, 1, 1, 1,
0.05481597, 2.067928, -1.347874, 1, 1, 1, 1, 1,
0.05663518, -0.5403877, 2.258509, 1, 1, 1, 1, 1,
0.05800538, 1.170111, -0.9990078, 1, 1, 1, 1, 1,
0.05879143, 0.477801, -1.384231, 1, 1, 1, 1, 1,
0.0592681, 0.265976, 1.140353, 1, 1, 1, 1, 1,
0.06487019, -0.5490183, 3.990697, 1, 1, 1, 1, 1,
0.06491435, 0.7381102, 1.552436, 1, 1, 1, 1, 1,
0.06564566, 0.5182877, 0.09910228, 0, 0, 1, 1, 1,
0.06585091, -0.1106277, 2.9058, 1, 0, 0, 1, 1,
0.06914462, 0.9941049, -0.713838, 1, 0, 0, 1, 1,
0.0724052, 2.097691, -0.1938486, 1, 0, 0, 1, 1,
0.07289872, -0.6182059, 3.622282, 1, 0, 0, 1, 1,
0.07535597, -0.1311429, 0.1472641, 1, 0, 0, 1, 1,
0.07818967, 0.3072112, 1.422899, 0, 0, 0, 1, 1,
0.0782541, 0.6408673, 0.402503, 0, 0, 0, 1, 1,
0.07835221, -0.4749789, 2.757056, 0, 0, 0, 1, 1,
0.07898296, -0.2180886, 4.190628, 0, 0, 0, 1, 1,
0.08237883, -0.08650786, 0.9409076, 0, 0, 0, 1, 1,
0.08312169, -1.502198, 2.989273, 0, 0, 0, 1, 1,
0.08832157, -0.364463, 3.543144, 0, 0, 0, 1, 1,
0.08905175, -0.08754502, 1.942298, 1, 1, 1, 1, 1,
0.09941463, -1.683636, 2.863549, 1, 1, 1, 1, 1,
0.1011013, -1.473512, 3.529388, 1, 1, 1, 1, 1,
0.1011566, -0.7332259, 3.843309, 1, 1, 1, 1, 1,
0.1016063, 0.7019442, 1.60447, 1, 1, 1, 1, 1,
0.1037063, 0.368099, 1.200956, 1, 1, 1, 1, 1,
0.1037114, 0.6516061, 0.2876923, 1, 1, 1, 1, 1,
0.1042989, -1.708325, 2.030026, 1, 1, 1, 1, 1,
0.1117467, 0.6167163, 1.284216, 1, 1, 1, 1, 1,
0.1180005, 0.5128915, 0.9532998, 1, 1, 1, 1, 1,
0.121678, 0.9068023, 0.9128199, 1, 1, 1, 1, 1,
0.1259944, -1.327432, 3.71726, 1, 1, 1, 1, 1,
0.1261304, 0.8068941, 0.5197516, 1, 1, 1, 1, 1,
0.1363991, -0.6375327, 4.123578, 1, 1, 1, 1, 1,
0.138864, -0.9192876, 2.111856, 1, 1, 1, 1, 1,
0.1391331, -0.5586031, 3.092534, 0, 0, 1, 1, 1,
0.1401645, 0.1149448, -0.1218747, 1, 0, 0, 1, 1,
0.1405562, -0.3952251, 4.380115, 1, 0, 0, 1, 1,
0.1412795, -0.9351701, 3.796254, 1, 0, 0, 1, 1,
0.1441635, -0.2349046, 4.044937, 1, 0, 0, 1, 1,
0.1471418, 0.01129015, 3.76844, 1, 0, 0, 1, 1,
0.1484127, 1.38067, 0.6290614, 0, 0, 0, 1, 1,
0.149619, -0.5969195, 3.655833, 0, 0, 0, 1, 1,
0.1501773, 0.04216772, 0.1973966, 0, 0, 0, 1, 1,
0.1537166, -0.2413097, 3.440343, 0, 0, 0, 1, 1,
0.1538173, 0.3151297, 0.7644804, 0, 0, 0, 1, 1,
0.1572552, -0.1125953, 2.824589, 0, 0, 0, 1, 1,
0.160605, -1.40425, 4.178292, 0, 0, 0, 1, 1,
0.1733091, 0.4542171, -0.2376781, 1, 1, 1, 1, 1,
0.1803043, -0.8849542, 3.929994, 1, 1, 1, 1, 1,
0.1822768, -0.05106686, 4.31397, 1, 1, 1, 1, 1,
0.1881097, -0.4725096, 3.212879, 1, 1, 1, 1, 1,
0.191847, 1.093983, 1.210274, 1, 1, 1, 1, 1,
0.1945297, 0.768347, 0.2624834, 1, 1, 1, 1, 1,
0.1965589, -0.03826498, 3.122389, 1, 1, 1, 1, 1,
0.198292, 1.0268, 1.572714, 1, 1, 1, 1, 1,
0.1991176, -1.916319, 2.519427, 1, 1, 1, 1, 1,
0.2056861, 1.512654, 1.769287, 1, 1, 1, 1, 1,
0.2144855, 0.233012, 0.4677634, 1, 1, 1, 1, 1,
0.2155274, 0.9487968, -1.001015, 1, 1, 1, 1, 1,
0.2216824, -0.2468437, 0.648479, 1, 1, 1, 1, 1,
0.2222061, -1.192577, 2.566645, 1, 1, 1, 1, 1,
0.2234805, -0.8207481, 1.715619, 1, 1, 1, 1, 1,
0.2243334, 0.2946987, 0.609297, 0, 0, 1, 1, 1,
0.2258819, -0.6289242, 3.609848, 1, 0, 0, 1, 1,
0.2271118, -0.02476872, 3.188883, 1, 0, 0, 1, 1,
0.230023, -0.6001629, 2.437575, 1, 0, 0, 1, 1,
0.2312952, -0.5169894, 3.083757, 1, 0, 0, 1, 1,
0.2367517, 0.06057099, 0.899456, 1, 0, 0, 1, 1,
0.2372766, 0.7999797, 1.355747, 0, 0, 0, 1, 1,
0.2378371, 0.1992245, 2.522343, 0, 0, 0, 1, 1,
0.2394622, 0.349455, 1.450166, 0, 0, 0, 1, 1,
0.2502454, 1.044148, 1.789856, 0, 0, 0, 1, 1,
0.2521707, 0.3968234, 1.99136, 0, 0, 0, 1, 1,
0.2532519, 0.8227098, 0.5010748, 0, 0, 0, 1, 1,
0.2536399, -0.7242064, 3.316168, 0, 0, 0, 1, 1,
0.2537155, 0.4771993, 0.8280275, 1, 1, 1, 1, 1,
0.2604372, 0.1703628, 2.590034, 1, 1, 1, 1, 1,
0.2630464, 0.7775331, 0.4191564, 1, 1, 1, 1, 1,
0.2658953, 0.002831021, 2.787307, 1, 1, 1, 1, 1,
0.2677155, -0.0370663, 0.02673441, 1, 1, 1, 1, 1,
0.276097, 0.5084701, 0.2286594, 1, 1, 1, 1, 1,
0.2843359, 0.9339538, -0.7966199, 1, 1, 1, 1, 1,
0.2865193, 0.3516539, 0.09734067, 1, 1, 1, 1, 1,
0.3002066, -0.8579499, 2.563622, 1, 1, 1, 1, 1,
0.3045179, 1.721834, 1.204006, 1, 1, 1, 1, 1,
0.3087379, 0.5204898, 2.072436, 1, 1, 1, 1, 1,
0.3117733, 2.892301, 0.836715, 1, 1, 1, 1, 1,
0.3134641, -0.7183244, 1.978843, 1, 1, 1, 1, 1,
0.3137028, 0.4067249, 0.3933538, 1, 1, 1, 1, 1,
0.3140844, -1.115426, 3.178665, 1, 1, 1, 1, 1,
0.3152708, -0.8947533, 2.169275, 0, 0, 1, 1, 1,
0.3218766, -1.550727, 2.635835, 1, 0, 0, 1, 1,
0.3237003, 0.6377179, 0.258215, 1, 0, 0, 1, 1,
0.3258016, 0.5616911, 0.06273869, 1, 0, 0, 1, 1,
0.3375972, 0.1680821, 1.140047, 1, 0, 0, 1, 1,
0.3379456, 0.6265352, 0.1209011, 1, 0, 0, 1, 1,
0.339856, -1.247275, 2.093682, 0, 0, 0, 1, 1,
0.3410578, 0.6449615, 2.072991, 0, 0, 0, 1, 1,
0.3429934, -1.086012, 1.509979, 0, 0, 0, 1, 1,
0.3443572, -0.06290937, -0.3344904, 0, 0, 0, 1, 1,
0.3459471, 0.1350474, 1.760418, 0, 0, 0, 1, 1,
0.3462046, 0.8358735, -0.1466653, 0, 0, 0, 1, 1,
0.3472574, -1.681384, 3.625499, 0, 0, 0, 1, 1,
0.3483215, 1.286467, 0.5856658, 1, 1, 1, 1, 1,
0.350399, 0.09440605, 1.040969, 1, 1, 1, 1, 1,
0.3512323, 0.04185491, 1.233581, 1, 1, 1, 1, 1,
0.3571796, 0.848881, -0.6569434, 1, 1, 1, 1, 1,
0.3582091, -1.4164, 3.728326, 1, 1, 1, 1, 1,
0.3593445, -0.7696506, 2.142307, 1, 1, 1, 1, 1,
0.3633078, -0.8391638, 1.644838, 1, 1, 1, 1, 1,
0.3718061, -0.2578271, 2.708971, 1, 1, 1, 1, 1,
0.372364, 1.3365, -0.5318505, 1, 1, 1, 1, 1,
0.3760349, -1.89824, 3.492855, 1, 1, 1, 1, 1,
0.3769748, 1.46594, 0.326777, 1, 1, 1, 1, 1,
0.3792994, -1.395705, 1.015913, 1, 1, 1, 1, 1,
0.381998, 1.623502, -0.3358204, 1, 1, 1, 1, 1,
0.3835357, 0.1848511, -0.3616996, 1, 1, 1, 1, 1,
0.3867984, 0.7216673, 1.224153, 1, 1, 1, 1, 1,
0.3870431, 0.4713078, -0.05377004, 0, 0, 1, 1, 1,
0.3891432, -0.1459139, 2.515856, 1, 0, 0, 1, 1,
0.3891919, 0.1580941, -0.7057031, 1, 0, 0, 1, 1,
0.3942085, 1.051695, 0.6082317, 1, 0, 0, 1, 1,
0.3943234, -1.244243, 3.018366, 1, 0, 0, 1, 1,
0.3955953, -1.478202, 2.618126, 1, 0, 0, 1, 1,
0.3995878, -0.06855126, 2.448977, 0, 0, 0, 1, 1,
0.4040983, 0.9573851, 2.309443, 0, 0, 0, 1, 1,
0.4070384, 0.1736491, 2.572433, 0, 0, 0, 1, 1,
0.4075441, 1.814915, -0.3208282, 0, 0, 0, 1, 1,
0.4077871, 1.56975, -1.053735, 0, 0, 0, 1, 1,
0.4179733, -0.432623, 3.628877, 0, 0, 0, 1, 1,
0.4244808, -0.5817626, 3.028654, 0, 0, 0, 1, 1,
0.4245088, -0.7425703, 3.07813, 1, 1, 1, 1, 1,
0.4258049, -1.387028, 2.911791, 1, 1, 1, 1, 1,
0.426224, -0.2295534, 1.560871, 1, 1, 1, 1, 1,
0.426964, -1.587144, 2.290484, 1, 1, 1, 1, 1,
0.4299456, -0.05948124, 1.59382, 1, 1, 1, 1, 1,
0.4342305, 1.074778, -0.7589667, 1, 1, 1, 1, 1,
0.4348005, 1.041499, 0.6233948, 1, 1, 1, 1, 1,
0.4370071, 0.3083782, 2.971033, 1, 1, 1, 1, 1,
0.4370769, 0.396492, 1.109395, 1, 1, 1, 1, 1,
0.4393944, -0.517197, 1.851244, 1, 1, 1, 1, 1,
0.4406342, -0.7771056, 3.204983, 1, 1, 1, 1, 1,
0.4419887, 1.996632, -0.6814031, 1, 1, 1, 1, 1,
0.4421228, 0.467732, 0.3276693, 1, 1, 1, 1, 1,
0.4428302, -1.916808, 2.286743, 1, 1, 1, 1, 1,
0.4462464, 0.5262628, 0.3186665, 1, 1, 1, 1, 1,
0.4520684, 0.8892032, 0.4220079, 0, 0, 1, 1, 1,
0.4533813, -0.9356321, 2.421154, 1, 0, 0, 1, 1,
0.4538737, 0.2682482, 0.7736385, 1, 0, 0, 1, 1,
0.4596027, 0.1411103, 1.364424, 1, 0, 0, 1, 1,
0.4597329, 0.9644245, -0.05108328, 1, 0, 0, 1, 1,
0.4607796, 0.8696933, 0.2462898, 1, 0, 0, 1, 1,
0.4610078, -1.303347, 3.391682, 0, 0, 0, 1, 1,
0.4703498, 1.034689, -0.5337716, 0, 0, 0, 1, 1,
0.4739792, -0.4895687, 3.279514, 0, 0, 0, 1, 1,
0.4742585, 1.536169, 0.3241945, 0, 0, 0, 1, 1,
0.4750572, -0.6706734, 2.564727, 0, 0, 0, 1, 1,
0.4757026, -0.9251676, 2.784204, 0, 0, 0, 1, 1,
0.4790183, -0.2121214, 1.281635, 0, 0, 0, 1, 1,
0.4802877, 0.2054713, 1.860856, 1, 1, 1, 1, 1,
0.4816968, 1.261483, 0.6141911, 1, 1, 1, 1, 1,
0.4853323, -1.388785, 2.996288, 1, 1, 1, 1, 1,
0.4856038, 0.139605, 1.830508, 1, 1, 1, 1, 1,
0.490046, 0.8426154, 0.07982016, 1, 1, 1, 1, 1,
0.4962163, 0.7680452, 1.126552, 1, 1, 1, 1, 1,
0.4973856, -0.2420557, 0.6992907, 1, 1, 1, 1, 1,
0.5010623, -1.696045, 2.196208, 1, 1, 1, 1, 1,
0.5117789, 0.05898983, 2.571209, 1, 1, 1, 1, 1,
0.5120211, -1.264217, 1.849995, 1, 1, 1, 1, 1,
0.5147408, -0.1931531, 1.308128, 1, 1, 1, 1, 1,
0.5161817, -0.04665668, 2.668447, 1, 1, 1, 1, 1,
0.52024, -0.01637477, 0.6506793, 1, 1, 1, 1, 1,
0.5233454, -1.339762, 2.263318, 1, 1, 1, 1, 1,
0.5234351, 0.2661321, 1.18905, 1, 1, 1, 1, 1,
0.5262459, 1.070026, 0.1308682, 0, 0, 1, 1, 1,
0.5270227, 0.7553146, 1.341487, 1, 0, 0, 1, 1,
0.5294613, -2.517078, 3.336082, 1, 0, 0, 1, 1,
0.5326221, -0.358102, 2.353069, 1, 0, 0, 1, 1,
0.5328285, 0.3876116, 0.4585206, 1, 0, 0, 1, 1,
0.5346144, 0.1832794, 0.7778854, 1, 0, 0, 1, 1,
0.5372888, -1.272561, -0.7113948, 0, 0, 0, 1, 1,
0.5415916, 0.01888396, 1.550197, 0, 0, 0, 1, 1,
0.542628, 1.336349, -2.583042, 0, 0, 0, 1, 1,
0.5483416, 0.6678919, 0.5773728, 0, 0, 0, 1, 1,
0.5497478, 0.1829854, 0.5441886, 0, 0, 0, 1, 1,
0.5528402, -0.349559, 2.347095, 0, 0, 0, 1, 1,
0.5566173, -1.146169, 2.826808, 0, 0, 0, 1, 1,
0.5610456, 0.05248736, 1.073287, 1, 1, 1, 1, 1,
0.5641835, -1.84905, 2.949438, 1, 1, 1, 1, 1,
0.5646411, 1.038496, 1.374361, 1, 1, 1, 1, 1,
0.5650162, -0.01469752, 2.127254, 1, 1, 1, 1, 1,
0.5660245, 2.45382, 0.8334334, 1, 1, 1, 1, 1,
0.5663258, -0.4190204, 1.999907, 1, 1, 1, 1, 1,
0.568088, -0.4036116, 0.01788198, 1, 1, 1, 1, 1,
0.5688023, -0.3071897, 3.093002, 1, 1, 1, 1, 1,
0.5732939, -1.105016, 1.306916, 1, 1, 1, 1, 1,
0.5777932, 0.8589322, -1.663194, 1, 1, 1, 1, 1,
0.5786939, 0.1413806, 1.642894, 1, 1, 1, 1, 1,
0.5800269, -1.081851, 2.047425, 1, 1, 1, 1, 1,
0.5801453, -0.7786859, 2.53913, 1, 1, 1, 1, 1,
0.5860559, -0.4418302, 1.459425, 1, 1, 1, 1, 1,
0.5868885, -1.013687, 1.923983, 1, 1, 1, 1, 1,
0.5889069, -1.538047, 3.022997, 0, 0, 1, 1, 1,
0.5890364, 0.09574994, 2.278224, 1, 0, 0, 1, 1,
0.5891697, -0.773257, 3.327361, 1, 0, 0, 1, 1,
0.5891707, -0.1715967, 1.238889, 1, 0, 0, 1, 1,
0.594746, -0.821282, 0.5353466, 1, 0, 0, 1, 1,
0.5950597, -0.08630791, 3.595854, 1, 0, 0, 1, 1,
0.5968762, 0.2931341, 2.541796, 0, 0, 0, 1, 1,
0.5992023, -0.1516903, 2.142471, 0, 0, 0, 1, 1,
0.6098403, 3.54939, 0.7002907, 0, 0, 0, 1, 1,
0.6147839, 0.308039, 1.259546, 0, 0, 0, 1, 1,
0.6157792, 1.990507, -0.2261501, 0, 0, 0, 1, 1,
0.6281564, 0.2739692, -0.1553524, 0, 0, 0, 1, 1,
0.6308048, -0.7442343, 3.625712, 0, 0, 0, 1, 1,
0.6357113, 0.2785305, 1.122415, 1, 1, 1, 1, 1,
0.6364869, -0.1643021, 1.18581, 1, 1, 1, 1, 1,
0.6384277, 1.338575, -0.03448362, 1, 1, 1, 1, 1,
0.6394596, -0.00938205, -0.0287961, 1, 1, 1, 1, 1,
0.6400244, 1.658278, 0.642267, 1, 1, 1, 1, 1,
0.6416864, 0.3878489, 1.005253, 1, 1, 1, 1, 1,
0.6423776, 0.8527816, 1.679365, 1, 1, 1, 1, 1,
0.6496202, 0.3867615, 0.5826889, 1, 1, 1, 1, 1,
0.6548072, 0.595524, 0.6462239, 1, 1, 1, 1, 1,
0.6562455, -0.09736113, 1.798761, 1, 1, 1, 1, 1,
0.6618771, -1.16833, 2.511566, 1, 1, 1, 1, 1,
0.6627374, -0.09349693, 0.257846, 1, 1, 1, 1, 1,
0.6629788, 0.2322051, 1.176313, 1, 1, 1, 1, 1,
0.6639351, -0.3675078, -0.3760242, 1, 1, 1, 1, 1,
0.6642116, -1.630573, 1.487766, 1, 1, 1, 1, 1,
0.6643721, -0.5007933, 2.880559, 0, 0, 1, 1, 1,
0.6654643, -0.3236308, 3.797251, 1, 0, 0, 1, 1,
0.6672197, 0.1005434, 1.730293, 1, 0, 0, 1, 1,
0.6752941, -0.2042712, 0.8463298, 1, 0, 0, 1, 1,
0.6760419, 0.4403273, 0.774255, 1, 0, 0, 1, 1,
0.6784464, -1.595569, 1.041769, 1, 0, 0, 1, 1,
0.6795121, 0.8935556, -0.366471, 0, 0, 0, 1, 1,
0.67959, -0.4926098, 2.22899, 0, 0, 0, 1, 1,
0.6847368, 1.683407, 0.5998441, 0, 0, 0, 1, 1,
0.6847863, -0.215285, 2.889858, 0, 0, 0, 1, 1,
0.6868146, -0.163659, 0.08679095, 0, 0, 0, 1, 1,
0.6994544, 0.1605431, 1.339916, 0, 0, 0, 1, 1,
0.7057478, -0.6202007, 3.077088, 0, 0, 0, 1, 1,
0.7075955, -0.4154649, 3.70494, 1, 1, 1, 1, 1,
0.7086887, 0.859923, 1.616547, 1, 1, 1, 1, 1,
0.7116229, -0.4870277, 2.342465, 1, 1, 1, 1, 1,
0.713859, 0.5051752, 1.713775, 1, 1, 1, 1, 1,
0.7161654, 0.01056472, 1.777652, 1, 1, 1, 1, 1,
0.7202094, -0.422722, 1.82338, 1, 1, 1, 1, 1,
0.7229733, -2.186942, 4.006727, 1, 1, 1, 1, 1,
0.7286674, 0.8576937, 0.5158647, 1, 1, 1, 1, 1,
0.7292637, 0.8852653, 0.6970207, 1, 1, 1, 1, 1,
0.7301102, 0.2092016, 1.225027, 1, 1, 1, 1, 1,
0.7312139, 1.716984, 0.04133705, 1, 1, 1, 1, 1,
0.7360027, -0.3042842, 1.758986, 1, 1, 1, 1, 1,
0.7392217, 0.9808642, 0.7587023, 1, 1, 1, 1, 1,
0.7458283, -0.8458663, 3.007122, 1, 1, 1, 1, 1,
0.7475921, -1.167432, 3.496101, 1, 1, 1, 1, 1,
0.7482719, 0.3627581, 1.690195, 0, 0, 1, 1, 1,
0.7498295, 0.1938207, 1.766141, 1, 0, 0, 1, 1,
0.7609291, 1.468084, 1.918003, 1, 0, 0, 1, 1,
0.7654414, -1.275094, 1.686253, 1, 0, 0, 1, 1,
0.7726334, 0.6530586, 0.4856493, 1, 0, 0, 1, 1,
0.7846709, 0.9862853, -1.399972, 1, 0, 0, 1, 1,
0.7932046, -0.1548502, 2.846547, 0, 0, 0, 1, 1,
0.8031976, 0.9385239, -1.243714, 0, 0, 0, 1, 1,
0.8035009, -0.4463474, 2.262424, 0, 0, 0, 1, 1,
0.8037919, -0.818961, 3.358337, 0, 0, 0, 1, 1,
0.8118542, 0.423503, 2.226088, 0, 0, 0, 1, 1,
0.8143681, 0.9667196, 0.03164383, 0, 0, 0, 1, 1,
0.8179399, -0.342494, 0.5384878, 0, 0, 0, 1, 1,
0.8205847, -1.011673, 1.729491, 1, 1, 1, 1, 1,
0.8232583, -0.3800581, 1.921844, 1, 1, 1, 1, 1,
0.8244601, 0.5417653, 0.9311119, 1, 1, 1, 1, 1,
0.8264158, -0.7609928, 1.566135, 1, 1, 1, 1, 1,
0.8278107, -1.071697, 1.477173, 1, 1, 1, 1, 1,
0.8342952, -1.057187, 0.8618336, 1, 1, 1, 1, 1,
0.8355972, -0.222378, 1.838597, 1, 1, 1, 1, 1,
0.8403664, 0.6512391, 1.108059, 1, 1, 1, 1, 1,
0.840937, 0.945917, 1.029481, 1, 1, 1, 1, 1,
0.8453897, 0.7675166, 2.45115, 1, 1, 1, 1, 1,
0.8462904, 2.030275, -0.3219789, 1, 1, 1, 1, 1,
0.848211, 1.421546, 1.613939, 1, 1, 1, 1, 1,
0.853323, 0.7518302, 1.559371, 1, 1, 1, 1, 1,
0.8563139, 1.448595, 2.491133, 1, 1, 1, 1, 1,
0.858003, 0.548025, -0.5617303, 1, 1, 1, 1, 1,
0.8615081, -0.7373586, 2.39736, 0, 0, 1, 1, 1,
0.8626111, 0.6370334, 0.816738, 1, 0, 0, 1, 1,
0.8661953, 1.117307, -2.589434, 1, 0, 0, 1, 1,
0.8665599, -0.5961448, 1.608969, 1, 0, 0, 1, 1,
0.868389, 0.2781632, 0.2802825, 1, 0, 0, 1, 1,
0.8694386, -0.1570392, -0.8349416, 1, 0, 0, 1, 1,
0.8729742, -0.1287933, 1.130497, 0, 0, 0, 1, 1,
0.8773282, 1.246793, -0.2892543, 0, 0, 0, 1, 1,
0.8773661, -1.985958, 1.72269, 0, 0, 0, 1, 1,
0.887062, -2.240486, 2.5913, 0, 0, 0, 1, 1,
0.8876266, -1.876225, 2.649704, 0, 0, 0, 1, 1,
0.8878959, 1.891759, 0.4808249, 0, 0, 0, 1, 1,
0.891607, -1.531773, 2.198821, 0, 0, 0, 1, 1,
0.8932332, 1.087125, -0.1443084, 1, 1, 1, 1, 1,
0.8937992, -1.088228, 1.626857, 1, 1, 1, 1, 1,
0.8946047, 1.922194, 1.11905, 1, 1, 1, 1, 1,
0.8964224, 0.1712887, 2.399129, 1, 1, 1, 1, 1,
0.8994572, 1.356066, 1.606814, 1, 1, 1, 1, 1,
0.9094158, 0.07031382, 1.732623, 1, 1, 1, 1, 1,
0.9165716, 0.08470403, 1.872619, 1, 1, 1, 1, 1,
0.9177608, -0.7172003, 2.378209, 1, 1, 1, 1, 1,
0.9195008, -1.261972, 2.50771, 1, 1, 1, 1, 1,
0.9208078, -0.3353253, 2.388614, 1, 1, 1, 1, 1,
0.9286811, -0.5100642, 1.833999, 1, 1, 1, 1, 1,
0.9402462, -1.209545, 3.068589, 1, 1, 1, 1, 1,
0.9434621, -0.6489516, 2.080658, 1, 1, 1, 1, 1,
0.9493615, -0.01275837, 1.652616, 1, 1, 1, 1, 1,
0.9522571, 0.6544168, 2.173501, 1, 1, 1, 1, 1,
0.9538755, -1.055171, 3.881375, 0, 0, 1, 1, 1,
0.9590082, -1.203955, 1.693692, 1, 0, 0, 1, 1,
0.9698554, -0.6930344, 3.261156, 1, 0, 0, 1, 1,
0.971435, -1.119157, 2.970847, 1, 0, 0, 1, 1,
0.972054, 0.5402381, 3.263909, 1, 0, 0, 1, 1,
0.972468, -0.8835759, 2.394823, 1, 0, 0, 1, 1,
0.9738135, 0.8161873, 1.533828, 0, 0, 0, 1, 1,
0.9758872, 0.7197487, -0.4747978, 0, 0, 0, 1, 1,
0.977751, -0.778854, 2.73974, 0, 0, 0, 1, 1,
0.9780032, -0.843034, 2.596658, 0, 0, 0, 1, 1,
0.9804024, 0.3502838, 1.507353, 0, 0, 0, 1, 1,
0.9831095, -0.13914, 2.656216, 0, 0, 0, 1, 1,
0.9848415, -0.5676097, 4.228273, 0, 0, 0, 1, 1,
0.9865136, 0.3955075, 1.58514, 1, 1, 1, 1, 1,
0.9917532, 2.121675, -0.5983304, 1, 1, 1, 1, 1,
1.000177, 1.109979, 1.357019, 1, 1, 1, 1, 1,
1.0006, 0.02342431, 1.089312, 1, 1, 1, 1, 1,
1.001264, -2.364896, 2.914352, 1, 1, 1, 1, 1,
1.003211, 1.609448, -0.4587408, 1, 1, 1, 1, 1,
1.00468, 0.52353, 1.708577, 1, 1, 1, 1, 1,
1.006666, -0.8062198, 1.663253, 1, 1, 1, 1, 1,
1.010733, -1.40859, 4.138306, 1, 1, 1, 1, 1,
1.014717, -1.784982, 1.492258, 1, 1, 1, 1, 1,
1.027543, -1.502323, 3.461508, 1, 1, 1, 1, 1,
1.028131, 0.9449196, 1.325134, 1, 1, 1, 1, 1,
1.030253, 0.1787728, 1.495919, 1, 1, 1, 1, 1,
1.034955, -0.4235703, 2.83623, 1, 1, 1, 1, 1,
1.044833, 0.2062377, 0.751547, 1, 1, 1, 1, 1,
1.045197, -1.13837, 2.885452, 0, 0, 1, 1, 1,
1.049415, -1.341409, 4.462685, 1, 0, 0, 1, 1,
1.0532, -0.7033208, 2.551818, 1, 0, 0, 1, 1,
1.054005, 0.896154, -0.291339, 1, 0, 0, 1, 1,
1.054248, -0.525111, 2.764111, 1, 0, 0, 1, 1,
1.058903, -0.810549, 1.841139, 1, 0, 0, 1, 1,
1.062751, 1.351229, 1.041908, 0, 0, 0, 1, 1,
1.062795, -2.366613, 1.089719, 0, 0, 0, 1, 1,
1.072148, 1.588349, 1.180866, 0, 0, 0, 1, 1,
1.084098, -0.03872966, 0.2399028, 0, 0, 0, 1, 1,
1.087449, -0.4019629, 3.158351, 0, 0, 0, 1, 1,
1.08884, -0.009122525, 2.787633, 0, 0, 0, 1, 1,
1.093209, -0.2922887, 2.171296, 0, 0, 0, 1, 1,
1.102527, -1.118613, 0.8301203, 1, 1, 1, 1, 1,
1.104167, -0.3934125, 2.320883, 1, 1, 1, 1, 1,
1.104632, 0.4040926, 2.001818, 1, 1, 1, 1, 1,
1.11258, 1.162299, -0.3905972, 1, 1, 1, 1, 1,
1.120971, 0.3510424, 1.368397, 1, 1, 1, 1, 1,
1.126404, 0.3916653, 2.369795, 1, 1, 1, 1, 1,
1.140261, 0.6207449, -0.7116474, 1, 1, 1, 1, 1,
1.141172, 0.6694622, 0.4259008, 1, 1, 1, 1, 1,
1.142062, 0.3544645, 1.476045, 1, 1, 1, 1, 1,
1.14231, 0.9915283, 1.647304, 1, 1, 1, 1, 1,
1.145296, -0.7897335, 4.1264, 1, 1, 1, 1, 1,
1.148416, -0.1452324, 1.939101, 1, 1, 1, 1, 1,
1.157792, -1.601313, 1.069635, 1, 1, 1, 1, 1,
1.16292, 1.415225, 0.9446551, 1, 1, 1, 1, 1,
1.164166, -0.4178686, 3.17469, 1, 1, 1, 1, 1,
1.172276, 1.499377, 1.044413, 0, 0, 1, 1, 1,
1.192824, -0.6330248, 4.389398, 1, 0, 0, 1, 1,
1.194077, 0.7131627, 3.306967, 1, 0, 0, 1, 1,
1.195417, -0.6743335, 2.953499, 1, 0, 0, 1, 1,
1.198305, -0.7948846, 2.03839, 1, 0, 0, 1, 1,
1.198317, -0.1715729, 0.8325894, 1, 0, 0, 1, 1,
1.202964, -0.5825821, 2.749567, 0, 0, 0, 1, 1,
1.20502, -0.6476936, 2.806393, 0, 0, 0, 1, 1,
1.209421, -0.7372287, 2.342459, 0, 0, 0, 1, 1,
1.21083, 1.777315, 0.1057191, 0, 0, 0, 1, 1,
1.22262, -0.4941915, 0.8036926, 0, 0, 0, 1, 1,
1.232563, -0.8355488, 1.775955, 0, 0, 0, 1, 1,
1.251333, -0.2856491, 2.016559, 0, 0, 0, 1, 1,
1.257478, 0.8428217, 1.990955, 1, 1, 1, 1, 1,
1.258049, 0.5826341, 2.789826, 1, 1, 1, 1, 1,
1.265536, -0.5838314, 2.564573, 1, 1, 1, 1, 1,
1.266232, 0.5141838, 1.928, 1, 1, 1, 1, 1,
1.275526, -0.2639947, 0.1277735, 1, 1, 1, 1, 1,
1.284705, -0.5438187, -0.6966435, 1, 1, 1, 1, 1,
1.289873, -0.5012553, 2.331852, 1, 1, 1, 1, 1,
1.292973, -0.9741829, 1.486188, 1, 1, 1, 1, 1,
1.296373, -0.9370722, 1.395164, 1, 1, 1, 1, 1,
1.296385, 1.14061, 0.6102907, 1, 1, 1, 1, 1,
1.301293, -0.2509727, 1.514948, 1, 1, 1, 1, 1,
1.301807, 0.2939483, 1.716564, 1, 1, 1, 1, 1,
1.307745, 0.5328026, 2.78733, 1, 1, 1, 1, 1,
1.310705, -1.978423, 1.264037, 1, 1, 1, 1, 1,
1.31425, -0.1992691, 1.084427, 1, 1, 1, 1, 1,
1.318868, 1.938432, 1.967414, 0, 0, 1, 1, 1,
1.319332, -2.835504, 5.057061, 1, 0, 0, 1, 1,
1.321355, 0.771953, 0.6812199, 1, 0, 0, 1, 1,
1.329028, -0.3851464, 2.858805, 1, 0, 0, 1, 1,
1.330885, 0.2215086, 2.608394, 1, 0, 0, 1, 1,
1.342875, -0.5561793, 3.226031, 1, 0, 0, 1, 1,
1.357783, -0.3021753, 1.434612, 0, 0, 0, 1, 1,
1.362939, 0.8711829, 1.886189, 0, 0, 0, 1, 1,
1.365448, 0.4624283, 0.6746321, 0, 0, 0, 1, 1,
1.370324, 0.1328941, 0.8517983, 0, 0, 0, 1, 1,
1.375653, 2.07156, 0.1109139, 0, 0, 0, 1, 1,
1.385419, 0.3532933, 2.118222, 0, 0, 0, 1, 1,
1.4056, 0.8053733, 1.428943, 0, 0, 0, 1, 1,
1.415534, 0.3049416, 2.056834, 1, 1, 1, 1, 1,
1.42292, 0.438817, 0.8281731, 1, 1, 1, 1, 1,
1.435045, -0.3105452, 2.675768, 1, 1, 1, 1, 1,
1.451737, -0.7821863, 2.652825, 1, 1, 1, 1, 1,
1.454374, 0.1117377, 2.442984, 1, 1, 1, 1, 1,
1.475438, -1.193112, 1.929937, 1, 1, 1, 1, 1,
1.482052, -0.5303372, 2.023736, 1, 1, 1, 1, 1,
1.484171, 1.274776, 1.674126, 1, 1, 1, 1, 1,
1.490025, -0.20716, 1.311697, 1, 1, 1, 1, 1,
1.496352, -0.5777228, 1.250778, 1, 1, 1, 1, 1,
1.507405, 0.9485851, 0.06267625, 1, 1, 1, 1, 1,
1.521803, 1.025493, -0.8884746, 1, 1, 1, 1, 1,
1.544649, -0.3886603, 0.3566194, 1, 1, 1, 1, 1,
1.547191, -0.7894608, 2.672406, 1, 1, 1, 1, 1,
1.55734, 0.3015818, 0.947642, 1, 1, 1, 1, 1,
1.566082, 0.6192542, 0.7923712, 0, 0, 1, 1, 1,
1.578997, -0.6058521, 0.6676744, 1, 0, 0, 1, 1,
1.579195, -0.714615, -0.003262728, 1, 0, 0, 1, 1,
1.610637, -2.416345, 3.026863, 1, 0, 0, 1, 1,
1.625381, -1.162086, 3.490422, 1, 0, 0, 1, 1,
1.630626, 1.20968, 0.1433079, 1, 0, 0, 1, 1,
1.641851, -0.6918127, 2.338196, 0, 0, 0, 1, 1,
1.642399, -0.9673368, 4.098015, 0, 0, 0, 1, 1,
1.651732, 1.989659, 1.493003, 0, 0, 0, 1, 1,
1.651986, -0.3439161, 1.415289, 0, 0, 0, 1, 1,
1.677932, -1.276173, 0.168797, 0, 0, 0, 1, 1,
1.709256, 2.026801, -0.05090882, 0, 0, 0, 1, 1,
1.721711, -0.7017993, 1.808316, 0, 0, 0, 1, 1,
1.721784, 1.083385, 0.9925494, 1, 1, 1, 1, 1,
1.755672, 0.8025819, 1.929844, 1, 1, 1, 1, 1,
1.767572, -1.003982, 1.494394, 1, 1, 1, 1, 1,
1.791328, 0.1679318, 3.177849, 1, 1, 1, 1, 1,
1.796997, -1.623315, 3.012975, 1, 1, 1, 1, 1,
1.808013, -1.053453, 2.563558, 1, 1, 1, 1, 1,
1.818283, -0.5492049, 2.119546, 1, 1, 1, 1, 1,
1.825373, 2.307391, 0.9743623, 1, 1, 1, 1, 1,
1.853669, -0.8341784, 2.240849, 1, 1, 1, 1, 1,
1.873157, 0.5593645, -0.246671, 1, 1, 1, 1, 1,
1.880022, -0.9548375, 1.410115, 1, 1, 1, 1, 1,
1.881893, -0.4609338, 1.17573, 1, 1, 1, 1, 1,
1.901057, 0.8467821, 1.324472, 1, 1, 1, 1, 1,
1.913622, -0.3007972, -0.8042986, 1, 1, 1, 1, 1,
1.936627, -0.7357623, 2.62989, 1, 1, 1, 1, 1,
1.998287, -1.350542, 2.374673, 0, 0, 1, 1, 1,
2.01806, 1.5481, 2.056428, 1, 0, 0, 1, 1,
2.044841, 0.2837889, 3.826851, 1, 0, 0, 1, 1,
2.094432, 0.3382557, 1.730539, 1, 0, 0, 1, 1,
2.105715, -1.833039, 2.84996, 1, 0, 0, 1, 1,
2.122882, 0.8717396, 1.306375, 1, 0, 0, 1, 1,
2.143041, 0.8568245, 1.33531, 0, 0, 0, 1, 1,
2.143203, -0.13731, 3.362835, 0, 0, 0, 1, 1,
2.158548, 0.7855251, 1.028133, 0, 0, 0, 1, 1,
2.205992, -1.180909, 0.7755373, 0, 0, 0, 1, 1,
2.208213, -0.2376054, 2.749144, 0, 0, 0, 1, 1,
2.219797, -0.7043704, 2.000808, 0, 0, 0, 1, 1,
2.224614, -0.5142837, 2.423956, 0, 0, 0, 1, 1,
2.275469, 2.143998, 1.785819, 1, 1, 1, 1, 1,
2.450681, 0.7935649, 1.763722, 1, 1, 1, 1, 1,
2.465615, 0.6495616, 1.425053, 1, 1, 1, 1, 1,
2.696632, -0.8134639, 1.997896, 1, 1, 1, 1, 1,
2.734513, 1.007376, 3.393581, 1, 1, 1, 1, 1,
2.76638, 0.5177566, 3.607875, 1, 1, 1, 1, 1,
2.952793, 0.2309403, 0.9060241, 1, 1, 1, 1, 1
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
var radius = 9.371302;
var distance = 32.9163;
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
mvMatrix.translate( 0.09466875, -0.2433615, 0.07936835 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9163);
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
