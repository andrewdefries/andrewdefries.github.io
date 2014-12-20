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
-3.44532, -0.9711441, -1.795274, 1, 0, 0, 1,
-3.016587, 1.34577, -2.004967, 1, 0.007843138, 0, 1,
-2.83572, 0.3792824, -0.7502193, 1, 0.01176471, 0, 1,
-2.777105, 1.411289, -1.056305, 1, 0.01960784, 0, 1,
-2.714295, -0.7058563, -1.005508, 1, 0.02352941, 0, 1,
-2.642939, -0.4308668, -1.81962, 1, 0.03137255, 0, 1,
-2.624894, -0.7633446, -1.320038, 1, 0.03529412, 0, 1,
-2.508913, 0.1829126, -1.075706, 1, 0.04313726, 0, 1,
-2.491314, 1.011003, -1.959103, 1, 0.04705882, 0, 1,
-2.415438, -0.3617775, -0.6951918, 1, 0.05490196, 0, 1,
-2.333977, 2.143826, -0.6489291, 1, 0.05882353, 0, 1,
-2.319629, 1.93429, -1.013313, 1, 0.06666667, 0, 1,
-2.252392, -0.3645816, -2.853332, 1, 0.07058824, 0, 1,
-2.21707, -1.552987, -0.1455972, 1, 0.07843138, 0, 1,
-2.198421, 0.2133966, -0.7376074, 1, 0.08235294, 0, 1,
-2.112633, -1.896626, -3.102885, 1, 0.09019608, 0, 1,
-2.112452, 0.7641389, -0.5428809, 1, 0.09411765, 0, 1,
-2.053292, -1.083564, -1.622783, 1, 0.1019608, 0, 1,
-2.023574, -1.364106, -1.894174, 1, 0.1098039, 0, 1,
-2.008846, -0.2433272, -1.041158, 1, 0.1137255, 0, 1,
-2.004554, -0.903376, -1.102868, 1, 0.1215686, 0, 1,
-1.956672, 0.1782884, 0.02488389, 1, 0.1254902, 0, 1,
-1.953463, 0.6874434, -0.595185, 1, 0.1333333, 0, 1,
-1.905038, -0.6585308, -0.3870089, 1, 0.1372549, 0, 1,
-1.815705, 1.336637, 0.03065966, 1, 0.145098, 0, 1,
-1.811635, -0.7170458, -2.0947, 1, 0.1490196, 0, 1,
-1.810845, -0.3541945, -3.84475, 1, 0.1568628, 0, 1,
-1.809026, -0.3402938, -2.487103, 1, 0.1607843, 0, 1,
-1.782439, 0.8005012, -0.732263, 1, 0.1686275, 0, 1,
-1.737027, -0.2538528, -1.070212, 1, 0.172549, 0, 1,
-1.721245, -1.063002, -1.99229, 1, 0.1803922, 0, 1,
-1.711799, 1.552768, -1.589455, 1, 0.1843137, 0, 1,
-1.695141, 0.8682647, -1.045414, 1, 0.1921569, 0, 1,
-1.688185, 1.255475, 0.2136994, 1, 0.1960784, 0, 1,
-1.678579, 0.5413622, -1.121947, 1, 0.2039216, 0, 1,
-1.675503, 0.1746659, -1.489617, 1, 0.2117647, 0, 1,
-1.67518, -1.187125, -4.011612, 1, 0.2156863, 0, 1,
-1.652121, -1.399382, -1.035986, 1, 0.2235294, 0, 1,
-1.633943, 1.452372, 0.682251, 1, 0.227451, 0, 1,
-1.633211, -1.48068, -3.180773, 1, 0.2352941, 0, 1,
-1.623723, 0.6337816, -1.16115, 1, 0.2392157, 0, 1,
-1.615821, -0.5710131, -2.559627, 1, 0.2470588, 0, 1,
-1.614814, 0.1419045, -1.726298, 1, 0.2509804, 0, 1,
-1.610595, -0.992238, -2.477878, 1, 0.2588235, 0, 1,
-1.601728, 0.5376137, -2.721588, 1, 0.2627451, 0, 1,
-1.570753, 0.2598512, 1.671739, 1, 0.2705882, 0, 1,
-1.549446, 1.021505, -1.455409, 1, 0.2745098, 0, 1,
-1.528781, 1.017049, -0.5177947, 1, 0.282353, 0, 1,
-1.507308, -0.4871804, -1.436027, 1, 0.2862745, 0, 1,
-1.502476, 0.3756941, -1.947327, 1, 0.2941177, 0, 1,
-1.501882, 1.078269, -1.216807, 1, 0.3019608, 0, 1,
-1.493494, -0.535866, 0.1452155, 1, 0.3058824, 0, 1,
-1.487203, 1.231772, -0.5435935, 1, 0.3137255, 0, 1,
-1.472161, 1.668886, 0.3797986, 1, 0.3176471, 0, 1,
-1.45864, -1.979947, -1.469522, 1, 0.3254902, 0, 1,
-1.453161, -0.8826398, -3.305476, 1, 0.3294118, 0, 1,
-1.431417, 1.29059, -1.396438, 1, 0.3372549, 0, 1,
-1.427307, 0.3931368, -0.3824457, 1, 0.3411765, 0, 1,
-1.423411, -1.039546, -2.447852, 1, 0.3490196, 0, 1,
-1.421391, 1.251004, -0.1124952, 1, 0.3529412, 0, 1,
-1.404012, 0.1337024, -1.254936, 1, 0.3607843, 0, 1,
-1.395746, 0.8965607, -1.632428, 1, 0.3647059, 0, 1,
-1.393901, -0.5517663, -3.077769, 1, 0.372549, 0, 1,
-1.385748, -1.207134, -1.071678, 1, 0.3764706, 0, 1,
-1.374599, -1.195758, -1.076139, 1, 0.3843137, 0, 1,
-1.36843, -0.9343432, -1.708629, 1, 0.3882353, 0, 1,
-1.362397, -1.25406, -2.102858, 1, 0.3960784, 0, 1,
-1.36172, 0.192825, -1.553326, 1, 0.4039216, 0, 1,
-1.361014, 1.963805, -0.8891904, 1, 0.4078431, 0, 1,
-1.359364, -0.03950326, -2.346255, 1, 0.4156863, 0, 1,
-1.356527, 2.27105, 0.5695066, 1, 0.4196078, 0, 1,
-1.351383, -1.090858, -2.712046, 1, 0.427451, 0, 1,
-1.345923, -0.06931994, -2.007473, 1, 0.4313726, 0, 1,
-1.33477, 0.1087725, -2.91643, 1, 0.4392157, 0, 1,
-1.319053, -0.2447066, -1.342409, 1, 0.4431373, 0, 1,
-1.31897, -0.01235922, -1.762028, 1, 0.4509804, 0, 1,
-1.318116, 0.5106482, 0.3714515, 1, 0.454902, 0, 1,
-1.316636, -0.06797673, -3.445927, 1, 0.4627451, 0, 1,
-1.306496, 1.733151, 1.227948, 1, 0.4666667, 0, 1,
-1.303467, -1.846894, -0.912438, 1, 0.4745098, 0, 1,
-1.303324, 0.8956645, -3.329719, 1, 0.4784314, 0, 1,
-1.299269, 0.818137, 0.6134822, 1, 0.4862745, 0, 1,
-1.280276, 0.7962303, -1.552327, 1, 0.4901961, 0, 1,
-1.275875, 0.8781642, -0.9797775, 1, 0.4980392, 0, 1,
-1.275153, 0.7670586, -0.3809974, 1, 0.5058824, 0, 1,
-1.273618, -0.08030748, -1.581442, 1, 0.509804, 0, 1,
-1.269688, -1.233953, -2.238817, 1, 0.5176471, 0, 1,
-1.269267, 0.04287439, -1.282859, 1, 0.5215687, 0, 1,
-1.265986, 0.2392266, -0.1174243, 1, 0.5294118, 0, 1,
-1.255579, -0.473401, -0.2639943, 1, 0.5333334, 0, 1,
-1.254019, -1.510193, -2.515677, 1, 0.5411765, 0, 1,
-1.250809, -0.5405179, -3.381626, 1, 0.5450981, 0, 1,
-1.239596, -1.435106, -2.456257, 1, 0.5529412, 0, 1,
-1.238169, 0.00465121, -1.789279, 1, 0.5568628, 0, 1,
-1.236658, -0.439793, -1.213914, 1, 0.5647059, 0, 1,
-1.233266, -0.04563531, -3.224261, 1, 0.5686275, 0, 1,
-1.232373, -0.1913659, -3.35515, 1, 0.5764706, 0, 1,
-1.230788, 0.458468, -2.042088, 1, 0.5803922, 0, 1,
-1.227066, -1.493118, -2.728675, 1, 0.5882353, 0, 1,
-1.224039, 0.2089895, -1.816313, 1, 0.5921569, 0, 1,
-1.218861, -0.1395385, -0.7747992, 1, 0.6, 0, 1,
-1.214937, -0.1396854, 0.3269376, 1, 0.6078432, 0, 1,
-1.211033, 1.031802, -1.586997, 1, 0.6117647, 0, 1,
-1.192181, -0.2359607, -1.411677, 1, 0.6196079, 0, 1,
-1.191936, 0.01592698, -2.445822, 1, 0.6235294, 0, 1,
-1.186645, -0.1683666, -2.028814, 1, 0.6313726, 0, 1,
-1.185875, -0.4849445, -2.447977, 1, 0.6352941, 0, 1,
-1.184239, -0.7501097, -2.168911, 1, 0.6431373, 0, 1,
-1.184221, 0.5326192, -0.6446058, 1, 0.6470588, 0, 1,
-1.179621, -0.8308342, -1.875322, 1, 0.654902, 0, 1,
-1.171099, -0.6484856, -1.364549, 1, 0.6588235, 0, 1,
-1.164501, 0.04999321, -1.451005, 1, 0.6666667, 0, 1,
-1.162418, -0.6771694, -3.152045, 1, 0.6705883, 0, 1,
-1.155573, 0.3088082, -1.793626, 1, 0.6784314, 0, 1,
-1.134829, 1.562672, -0.7689125, 1, 0.682353, 0, 1,
-1.129727, -0.03807271, -1.052486, 1, 0.6901961, 0, 1,
-1.127774, 0.7437527, 0.7192192, 1, 0.6941177, 0, 1,
-1.127412, -0.2678706, -1.457114, 1, 0.7019608, 0, 1,
-1.127196, -1.250479, -2.824971, 1, 0.7098039, 0, 1,
-1.121806, -0.9749306, -2.132141, 1, 0.7137255, 0, 1,
-1.106372, -0.6158602, -2.471374, 1, 0.7215686, 0, 1,
-1.105375, 1.438371, -0.2092184, 1, 0.7254902, 0, 1,
-1.102584, 0.9821916, -0.9661862, 1, 0.7333333, 0, 1,
-1.102166, -2.574558, -2.464864, 1, 0.7372549, 0, 1,
-1.095062, -1.107138, -3.496558, 1, 0.7450981, 0, 1,
-1.094006, 1.297181, 1.473469, 1, 0.7490196, 0, 1,
-1.093273, 0.3097527, -0.3915971, 1, 0.7568628, 0, 1,
-1.091815, -0.6322115, -1.821592, 1, 0.7607843, 0, 1,
-1.090201, 0.2782546, 0.1402571, 1, 0.7686275, 0, 1,
-1.081354, -1.512052, -4.221389, 1, 0.772549, 0, 1,
-1.071194, -0.1210074, -1.189008, 1, 0.7803922, 0, 1,
-1.06888, 0.2572054, -1.422747, 1, 0.7843137, 0, 1,
-1.06065, 0.6376662, -2.240639, 1, 0.7921569, 0, 1,
-1.049185, -0.06767906, -1.402446, 1, 0.7960784, 0, 1,
-1.039817, 1.971519, -1.154041, 1, 0.8039216, 0, 1,
-1.038229, -0.4553985, -0.9712468, 1, 0.8117647, 0, 1,
-1.036564, 1.105396, -1.301252, 1, 0.8156863, 0, 1,
-1.035915, -0.8882716, -1.568107, 1, 0.8235294, 0, 1,
-1.035475, 0.7263271, -1.463928, 1, 0.827451, 0, 1,
-1.03398, -0.4302332, 0.07049213, 1, 0.8352941, 0, 1,
-1.033407, 0.9517955, 0.1002408, 1, 0.8392157, 0, 1,
-1.031481, 0.2181306, -1.547145, 1, 0.8470588, 0, 1,
-1.029625, 0.06596228, -2.774593, 1, 0.8509804, 0, 1,
-1.027335, 0.5311783, -1.521027, 1, 0.8588235, 0, 1,
-1.027039, 0.5362412, -0.9262626, 1, 0.8627451, 0, 1,
-1.024096, 0.1395907, -1.876604, 1, 0.8705882, 0, 1,
-1.022788, -2.190152, -1.070387, 1, 0.8745098, 0, 1,
-1.022355, -1.372545, -3.275372, 1, 0.8823529, 0, 1,
-1.020913, -0.267303, -0.7429138, 1, 0.8862745, 0, 1,
-1.014461, 0.6636547, -0.6658058, 1, 0.8941177, 0, 1,
-1.012514, -1.484437, -2.469715, 1, 0.8980392, 0, 1,
-1.009049, -0.3825353, -1.034064, 1, 0.9058824, 0, 1,
-1.005042, -0.4234741, -3.409968, 1, 0.9137255, 0, 1,
-0.9989055, 1.006856, 1.016243, 1, 0.9176471, 0, 1,
-0.9986256, 0.3162046, -0.3900947, 1, 0.9254902, 0, 1,
-0.9962811, -0.1311954, -0.5441972, 1, 0.9294118, 0, 1,
-0.9962513, -0.4777819, -1.751083, 1, 0.9372549, 0, 1,
-0.9960675, 0.5706037, -0.2900596, 1, 0.9411765, 0, 1,
-0.9906117, 1.430509, -1.646346, 1, 0.9490196, 0, 1,
-0.9848487, 1.604112, -0.397604, 1, 0.9529412, 0, 1,
-0.9836175, -0.4365719, -2.769068, 1, 0.9607843, 0, 1,
-0.9728523, -0.5143577, -2.209844, 1, 0.9647059, 0, 1,
-0.9726132, -0.4380357, -1.871298, 1, 0.972549, 0, 1,
-0.9695405, 0.521445, -2.58677, 1, 0.9764706, 0, 1,
-0.9662143, -0.0334925, -2.834161, 1, 0.9843137, 0, 1,
-0.962926, -0.5245618, -3.065735, 1, 0.9882353, 0, 1,
-0.9559012, 1.927722, 1.086543, 1, 0.9960784, 0, 1,
-0.950433, -0.2895092, -1.392119, 0.9960784, 1, 0, 1,
-0.9375561, 0.5254957, 0.01098778, 0.9921569, 1, 0, 1,
-0.9313804, -2.664217, -2.357866, 0.9843137, 1, 0, 1,
-0.9267699, 0.009782358, 0.6596867, 0.9803922, 1, 0, 1,
-0.9237295, -1.877963, -1.921841, 0.972549, 1, 0, 1,
-0.9221915, -0.4096843, -1.854345, 0.9686275, 1, 0, 1,
-0.9159923, -1.039328, -2.408153, 0.9607843, 1, 0, 1,
-0.9152573, -0.4235281, -1.459718, 0.9568627, 1, 0, 1,
-0.9120711, -0.3367737, -1.138183, 0.9490196, 1, 0, 1,
-0.9023846, -0.6139333, -3.61134, 0.945098, 1, 0, 1,
-0.8919392, 0.1212851, -2.708613, 0.9372549, 1, 0, 1,
-0.8884398, -0.2503155, -1.960815, 0.9333333, 1, 0, 1,
-0.8839589, -1.077976, -3.085181, 0.9254902, 1, 0, 1,
-0.8738262, 1.029173, -0.08379331, 0.9215686, 1, 0, 1,
-0.87119, -0.02655837, -1.805554, 0.9137255, 1, 0, 1,
-0.8692907, -0.4805636, -3.750027, 0.9098039, 1, 0, 1,
-0.8633749, -0.8611235, -1.663017, 0.9019608, 1, 0, 1,
-0.8614589, 0.2645768, -1.947449, 0.8941177, 1, 0, 1,
-0.8592549, 0.2559398, 0.0389776, 0.8901961, 1, 0, 1,
-0.8585809, -1.4521, -3.66089, 0.8823529, 1, 0, 1,
-0.8502527, -0.2885849, -3.241356, 0.8784314, 1, 0, 1,
-0.8491014, -0.5283067, -1.905399, 0.8705882, 1, 0, 1,
-0.8429515, 1.000165, -1.1036, 0.8666667, 1, 0, 1,
-0.8287195, -0.5583398, -3.204443, 0.8588235, 1, 0, 1,
-0.8272722, -0.6248485, -1.945048, 0.854902, 1, 0, 1,
-0.8235817, 0.3915909, -0.9000446, 0.8470588, 1, 0, 1,
-0.8235368, -0.6641403, -0.1011028, 0.8431373, 1, 0, 1,
-0.8224561, -1.135702, -3.807094, 0.8352941, 1, 0, 1,
-0.818, 1.313824, -0.5033478, 0.8313726, 1, 0, 1,
-0.8172055, 0.8428292, -1.548738, 0.8235294, 1, 0, 1,
-0.8008694, 0.2578269, -1.854274, 0.8196079, 1, 0, 1,
-0.8002406, -0.5753849, -2.868778, 0.8117647, 1, 0, 1,
-0.7996076, 1.641561, -1.135022, 0.8078431, 1, 0, 1,
-0.798858, 1.374598, -0.3978772, 0.8, 1, 0, 1,
-0.7967371, -0.3362069, -2.135885, 0.7921569, 1, 0, 1,
-0.7862239, -1.044602, -2.378805, 0.7882353, 1, 0, 1,
-0.7838973, 0.6459707, -0.4740309, 0.7803922, 1, 0, 1,
-0.7836973, -0.8255931, -2.277606, 0.7764706, 1, 0, 1,
-0.7809973, -0.5306144, -1.747445, 0.7686275, 1, 0, 1,
-0.7790173, -3.029361, -1.442752, 0.7647059, 1, 0, 1,
-0.7677227, -0.1258834, -2.262003, 0.7568628, 1, 0, 1,
-0.7675669, -0.03667726, -1.38301, 0.7529412, 1, 0, 1,
-0.7665767, 1.279345, -1.731969, 0.7450981, 1, 0, 1,
-0.7564087, -0.2903971, -0.4204572, 0.7411765, 1, 0, 1,
-0.7549964, -1.153053, -2.947058, 0.7333333, 1, 0, 1,
-0.7535149, 0.6186919, -1.212501, 0.7294118, 1, 0, 1,
-0.7498099, 0.1927479, -1.193661, 0.7215686, 1, 0, 1,
-0.7428722, -0.7921247, -2.449998, 0.7176471, 1, 0, 1,
-0.7394803, -0.1568798, 0.04741313, 0.7098039, 1, 0, 1,
-0.738089, 0.05542197, -0.5871283, 0.7058824, 1, 0, 1,
-0.732092, -1.606214, -3.613351, 0.6980392, 1, 0, 1,
-0.7318516, -0.4683583, -2.487136, 0.6901961, 1, 0, 1,
-0.7242016, -0.08835164, -2.904572, 0.6862745, 1, 0, 1,
-0.7241793, -1.271627, -2.408319, 0.6784314, 1, 0, 1,
-0.7216866, 0.9112514, 0.1672627, 0.6745098, 1, 0, 1,
-0.717337, 0.6910083, -2.891844, 0.6666667, 1, 0, 1,
-0.7172609, 0.187798, -2.885433, 0.6627451, 1, 0, 1,
-0.7155941, 0.9301735, -1.434271, 0.654902, 1, 0, 1,
-0.713549, -1.040325, -5.342349, 0.6509804, 1, 0, 1,
-0.7091539, -0.06743956, -1.193834, 0.6431373, 1, 0, 1,
-0.708747, -0.2049419, -2.838753, 0.6392157, 1, 0, 1,
-0.7056822, 0.4021556, -0.18169, 0.6313726, 1, 0, 1,
-0.7011405, 1.342167, 0.2108511, 0.627451, 1, 0, 1,
-0.6952817, 0.7548476, -1.604818, 0.6196079, 1, 0, 1,
-0.6951483, 0.3716041, -2.063437, 0.6156863, 1, 0, 1,
-0.6945279, -0.4249341, -2.247415, 0.6078432, 1, 0, 1,
-0.6900896, 0.03086513, 0.4157939, 0.6039216, 1, 0, 1,
-0.6899028, -0.3585858, 0.05329367, 0.5960785, 1, 0, 1,
-0.688461, -0.1557154, -0.714729, 0.5882353, 1, 0, 1,
-0.6879265, -0.8674095, -3.095533, 0.5843138, 1, 0, 1,
-0.6864793, 1.01602, -0.7909657, 0.5764706, 1, 0, 1,
-0.683931, 0.2322914, -1.293564, 0.572549, 1, 0, 1,
-0.6807627, 0.4248759, -1.666844, 0.5647059, 1, 0, 1,
-0.6660261, 1.387655, 0.1733647, 0.5607843, 1, 0, 1,
-0.6648066, 0.2641866, -0.3571702, 0.5529412, 1, 0, 1,
-0.6621606, 0.7535677, -0.5558005, 0.5490196, 1, 0, 1,
-0.6603329, -1.093569, -4.181673, 0.5411765, 1, 0, 1,
-0.6553217, 1.535905, -0.2419582, 0.5372549, 1, 0, 1,
-0.6505168, -0.7217748, -2.443718, 0.5294118, 1, 0, 1,
-0.6479104, 1.931454, 0.6445501, 0.5254902, 1, 0, 1,
-0.646561, 1.939945, -0.4874685, 0.5176471, 1, 0, 1,
-0.6430157, -0.725497, -0.3664365, 0.5137255, 1, 0, 1,
-0.6410382, 0.6447519, -1.484205, 0.5058824, 1, 0, 1,
-0.6381686, 1.164468, -0.6277235, 0.5019608, 1, 0, 1,
-0.6325691, -0.1165321, -1.800317, 0.4941176, 1, 0, 1,
-0.6294807, -0.1021236, -1.147879, 0.4862745, 1, 0, 1,
-0.6262417, -0.5757313, -2.435426, 0.4823529, 1, 0, 1,
-0.6162868, -1.348424, -4.224129, 0.4745098, 1, 0, 1,
-0.6096454, -1.612052, -4.745284, 0.4705882, 1, 0, 1,
-0.6085405, -0.330297, -0.8090851, 0.4627451, 1, 0, 1,
-0.6073902, 0.4067655, -0.6768001, 0.4588235, 1, 0, 1,
-0.6072022, -0.2569164, -1.889632, 0.4509804, 1, 0, 1,
-0.6055924, 0.9596413, -0.2845403, 0.4470588, 1, 0, 1,
-0.6019194, -0.6476592, -2.660146, 0.4392157, 1, 0, 1,
-0.5979114, -0.4444863, -1.877628, 0.4352941, 1, 0, 1,
-0.5861887, 0.3099557, -0.5376436, 0.427451, 1, 0, 1,
-0.5846414, -0.02102017, -2.649751, 0.4235294, 1, 0, 1,
-0.5841, 0.1565343, -2.50158, 0.4156863, 1, 0, 1,
-0.5801553, 0.9127453, -1.990917, 0.4117647, 1, 0, 1,
-0.5771095, -0.7972997, -0.551442, 0.4039216, 1, 0, 1,
-0.5763626, 0.8897673, -0.5046493, 0.3960784, 1, 0, 1,
-0.5760952, -0.5094997, -1.517704, 0.3921569, 1, 0, 1,
-0.5671238, -0.7204755, -2.249795, 0.3843137, 1, 0, 1,
-0.5607272, 1.300408, -0.3283318, 0.3803922, 1, 0, 1,
-0.555541, -1.136808, -0.8883697, 0.372549, 1, 0, 1,
-0.5525984, 0.7090398, -1.741909, 0.3686275, 1, 0, 1,
-0.5517181, -0.324218, -1.89212, 0.3607843, 1, 0, 1,
-0.550181, -0.5253783, -2.734833, 0.3568628, 1, 0, 1,
-0.5499386, 0.8193786, -0.9517221, 0.3490196, 1, 0, 1,
-0.5489857, -1.305462, -3.373981, 0.345098, 1, 0, 1,
-0.5437759, 2.507969, -0.07299688, 0.3372549, 1, 0, 1,
-0.5380247, 0.06551779, 0.09896675, 0.3333333, 1, 0, 1,
-0.5363468, -1.131982, -4.602418, 0.3254902, 1, 0, 1,
-0.5296633, -0.9777703, -2.509598, 0.3215686, 1, 0, 1,
-0.5182041, -1.641634, -1.47868, 0.3137255, 1, 0, 1,
-0.5156471, -0.256496, -3.626177, 0.3098039, 1, 0, 1,
-0.5150185, 1.358748, -0.4681105, 0.3019608, 1, 0, 1,
-0.5123983, -0.2118026, -4.046654, 0.2941177, 1, 0, 1,
-0.5086015, 0.07793076, -0.7388831, 0.2901961, 1, 0, 1,
-0.503837, -0.390443, -2.681321, 0.282353, 1, 0, 1,
-0.4967851, -0.9068533, -3.100456, 0.2784314, 1, 0, 1,
-0.4947771, -0.2694558, -1.543822, 0.2705882, 1, 0, 1,
-0.4940617, 0.4444329, 0.3256328, 0.2666667, 1, 0, 1,
-0.4928569, -0.8149282, -2.005207, 0.2588235, 1, 0, 1,
-0.4926557, -0.1800653, -2.665415, 0.254902, 1, 0, 1,
-0.4836967, 0.4504514, -0.7952895, 0.2470588, 1, 0, 1,
-0.4801884, -1.2092, -4.305516, 0.2431373, 1, 0, 1,
-0.4795801, -0.7829935, -2.522538, 0.2352941, 1, 0, 1,
-0.4788025, -0.3342334, -2.097788, 0.2313726, 1, 0, 1,
-0.4784473, -0.4409071, -1.851598, 0.2235294, 1, 0, 1,
-0.4718279, -0.3928612, -0.7874459, 0.2196078, 1, 0, 1,
-0.4710699, 2.386737, -0.2495439, 0.2117647, 1, 0, 1,
-0.468238, 1.423072, -1.080206, 0.2078431, 1, 0, 1,
-0.4669938, -0.8951287, -2.972247, 0.2, 1, 0, 1,
-0.4657391, -0.8121464, -3.692519, 0.1921569, 1, 0, 1,
-0.4615771, 0.8544044, -0.005345195, 0.1882353, 1, 0, 1,
-0.4615581, -1.028267, -1.928354, 0.1803922, 1, 0, 1,
-0.4575745, 0.1279351, -0.624426, 0.1764706, 1, 0, 1,
-0.4573924, -0.2657926, -2.303431, 0.1686275, 1, 0, 1,
-0.4562929, -0.5593535, -2.828817, 0.1647059, 1, 0, 1,
-0.4506972, 0.2809388, -1.242525, 0.1568628, 1, 0, 1,
-0.4486873, 1.486998, -0.115826, 0.1529412, 1, 0, 1,
-0.4485596, -1.805056, -2.787348, 0.145098, 1, 0, 1,
-0.4458113, -0.3457547, -1.475782, 0.1411765, 1, 0, 1,
-0.4420791, -2.343287, -3.125632, 0.1333333, 1, 0, 1,
-0.440656, -0.2067551, -1.671992, 0.1294118, 1, 0, 1,
-0.4403954, 1.113292, -0.2054994, 0.1215686, 1, 0, 1,
-0.4390951, -0.5248861, -2.463539, 0.1176471, 1, 0, 1,
-0.4386129, 1.710845, -1.91267, 0.1098039, 1, 0, 1,
-0.4377424, -0.4322902, -0.1362292, 0.1058824, 1, 0, 1,
-0.4355989, 0.6205904, -1.554612, 0.09803922, 1, 0, 1,
-0.4320911, -1.019199, -1.635406, 0.09019608, 1, 0, 1,
-0.4313409, -0.7580736, -0.820056, 0.08627451, 1, 0, 1,
-0.4289826, 0.308065, -1.299827, 0.07843138, 1, 0, 1,
-0.4278218, 2.353062, -1.03746, 0.07450981, 1, 0, 1,
-0.4199833, -0.2471579, -0.5643294, 0.06666667, 1, 0, 1,
-0.4084495, 0.8412338, 0.6802462, 0.0627451, 1, 0, 1,
-0.4051543, -0.738075, -2.08357, 0.05490196, 1, 0, 1,
-0.4043187, -0.5198184, -3.011292, 0.05098039, 1, 0, 1,
-0.4040122, 0.9277077, -0.06926706, 0.04313726, 1, 0, 1,
-0.3989108, -0.08371942, -2.367799, 0.03921569, 1, 0, 1,
-0.3933331, 1.242985, -0.2861784, 0.03137255, 1, 0, 1,
-0.3858264, 0.4393615, -0.8574482, 0.02745098, 1, 0, 1,
-0.3848611, 0.0681578, -2.457693, 0.01960784, 1, 0, 1,
-0.3831514, -0.5031421, -2.726188, 0.01568628, 1, 0, 1,
-0.3831053, -0.696802, -2.787971, 0.007843138, 1, 0, 1,
-0.3823307, 0.06000628, -1.136426, 0.003921569, 1, 0, 1,
-0.3805361, -0.05644845, -4.021217, 0, 1, 0.003921569, 1,
-0.3777217, 2.802719, 0.003328589, 0, 1, 0.01176471, 1,
-0.3759813, 0.9893358, 0.1689241, 0, 1, 0.01568628, 1,
-0.3722861, 0.3463905, -1.062732, 0, 1, 0.02352941, 1,
-0.3712251, -0.04256457, -1.25394, 0, 1, 0.02745098, 1,
-0.3685327, 0.2580985, 0.2256036, 0, 1, 0.03529412, 1,
-0.3669353, -0.3789491, -2.836592, 0, 1, 0.03921569, 1,
-0.3667846, 0.2279109, -0.1438881, 0, 1, 0.04705882, 1,
-0.3628357, 1.057809, 0.401371, 0, 1, 0.05098039, 1,
-0.3596022, -1.430508, -2.171089, 0, 1, 0.05882353, 1,
-0.3586511, -0.4075335, -2.206527, 0, 1, 0.0627451, 1,
-0.3578557, 0.1650423, -0.7322096, 0, 1, 0.07058824, 1,
-0.3552901, 1.620935, -1.742182, 0, 1, 0.07450981, 1,
-0.3532023, -0.6394722, -1.465811, 0, 1, 0.08235294, 1,
-0.3489093, 0.4516665, -1.300085, 0, 1, 0.08627451, 1,
-0.3469709, -0.5969874, -2.416015, 0, 1, 0.09411765, 1,
-0.342138, -1.078144, -2.428276, 0, 1, 0.1019608, 1,
-0.3397267, 1.768541, -0.4427298, 0, 1, 0.1058824, 1,
-0.3364355, -0.8805831, -1.817588, 0, 1, 0.1137255, 1,
-0.3344196, -0.9603541, -2.810523, 0, 1, 0.1176471, 1,
-0.3333303, 1.45792, 1.280547, 0, 1, 0.1254902, 1,
-0.3284129, 0.5398899, 0.4369797, 0, 1, 0.1294118, 1,
-0.3178819, 0.1247236, -0.09717048, 0, 1, 0.1372549, 1,
-0.3177165, -0.6829984, -2.347727, 0, 1, 0.1411765, 1,
-0.3176405, 1.830232, -0.02613817, 0, 1, 0.1490196, 1,
-0.3107355, -1.496451, -4.491804, 0, 1, 0.1529412, 1,
-0.3072661, 1.234388, -2.211184, 0, 1, 0.1607843, 1,
-0.3052576, -0.5758377, -3.823822, 0, 1, 0.1647059, 1,
-0.3011027, -0.09042024, -1.52133, 0, 1, 0.172549, 1,
-0.2938661, 0.5255212, -0.2176783, 0, 1, 0.1764706, 1,
-0.2938482, -0.3799678, -1.577936, 0, 1, 0.1843137, 1,
-0.2899806, -0.441318, -1.828008, 0, 1, 0.1882353, 1,
-0.2885088, 1.921252, 1.010899, 0, 1, 0.1960784, 1,
-0.2881216, -0.8574868, -2.122782, 0, 1, 0.2039216, 1,
-0.2870336, -0.4229568, -2.822681, 0, 1, 0.2078431, 1,
-0.2864015, 0.4003696, -2.670156, 0, 1, 0.2156863, 1,
-0.2856228, 0.8024383, 1.213522, 0, 1, 0.2196078, 1,
-0.2850267, 0.2720368, -1.977607, 0, 1, 0.227451, 1,
-0.2842574, -0.5822521, -3.534786, 0, 1, 0.2313726, 1,
-0.2755787, 0.7024198, -2.085035, 0, 1, 0.2392157, 1,
-0.2706807, 1.194716, 0.7723848, 0, 1, 0.2431373, 1,
-0.2705948, -2.849645, -4.240825, 0, 1, 0.2509804, 1,
-0.2697279, -0.1314012, -2.900017, 0, 1, 0.254902, 1,
-0.2693897, 0.6358895, -0.1263763, 0, 1, 0.2627451, 1,
-0.2671025, 1.05488, 0.6982873, 0, 1, 0.2666667, 1,
-0.2662352, -0.1964679, -4.244857, 0, 1, 0.2745098, 1,
-0.265457, 0.3303022, -3.003192, 0, 1, 0.2784314, 1,
-0.2653299, -0.4676507, -0.5517831, 0, 1, 0.2862745, 1,
-0.2650559, -1.135406, -1.020345, 0, 1, 0.2901961, 1,
-0.2555415, -0.9326741, -0.5444285, 0, 1, 0.2980392, 1,
-0.2536946, 0.8248742, -0.3293189, 0, 1, 0.3058824, 1,
-0.25017, -0.6931605, -3.086317, 0, 1, 0.3098039, 1,
-0.2492425, 0.7609367, 1.722262, 0, 1, 0.3176471, 1,
-0.2467006, 1.199625, 0.5259598, 0, 1, 0.3215686, 1,
-0.2429812, 0.905532, -0.07501624, 0, 1, 0.3294118, 1,
-0.2429652, -0.01033462, -0.2470278, 0, 1, 0.3333333, 1,
-0.2412697, 1.611477, -1.391687, 0, 1, 0.3411765, 1,
-0.2399809, -0.7085199, -4.766303, 0, 1, 0.345098, 1,
-0.2395188, 0.4725444, -0.1190398, 0, 1, 0.3529412, 1,
-0.2350144, -0.4935713, -3.691513, 0, 1, 0.3568628, 1,
-0.2347732, -0.3181138, -4.863544, 0, 1, 0.3647059, 1,
-0.2343545, 0.610569, -0.8316048, 0, 1, 0.3686275, 1,
-0.2312128, -0.447217, -3.305432, 0, 1, 0.3764706, 1,
-0.2266939, -1.186512, -1.928286, 0, 1, 0.3803922, 1,
-0.2240934, 1.347772, 0.4105506, 0, 1, 0.3882353, 1,
-0.2236118, 1.399576, -0.6328321, 0, 1, 0.3921569, 1,
-0.2179473, -0.3935597, -2.034703, 0, 1, 0.4, 1,
-0.2141763, -0.3257025, -2.304683, 0, 1, 0.4078431, 1,
-0.2122026, 0.483437, -0.327693, 0, 1, 0.4117647, 1,
-0.2085403, -0.1658393, -3.148221, 0, 1, 0.4196078, 1,
-0.2079872, -1.247648, -4.140175, 0, 1, 0.4235294, 1,
-0.2073569, -0.974629, -2.306094, 0, 1, 0.4313726, 1,
-0.2041385, 0.8946945, 0.3344449, 0, 1, 0.4352941, 1,
-0.203947, 0.02277881, -1.727902, 0, 1, 0.4431373, 1,
-0.1953552, 0.1448239, 0.03315516, 0, 1, 0.4470588, 1,
-0.1949768, -0.2400834, -1.218194, 0, 1, 0.454902, 1,
-0.1928537, -1.363207, -2.935424, 0, 1, 0.4588235, 1,
-0.1911616, -0.4024955, -2.119539, 0, 1, 0.4666667, 1,
-0.1884732, 0.4586046, 0.001497561, 0, 1, 0.4705882, 1,
-0.1857563, -1.364568, -1.290777, 0, 1, 0.4784314, 1,
-0.1835399, -0.0338368, -1.942112, 0, 1, 0.4823529, 1,
-0.1829121, -0.0680826, -0.4562051, 0, 1, 0.4901961, 1,
-0.1823254, 0.2007533, 1.03246, 0, 1, 0.4941176, 1,
-0.1809157, -1.104904, -2.659507, 0, 1, 0.5019608, 1,
-0.1796085, 1.369937, -1.159358, 0, 1, 0.509804, 1,
-0.1789395, 0.7599983, 0.03477361, 0, 1, 0.5137255, 1,
-0.1778582, 1.365578, 1.081372, 0, 1, 0.5215687, 1,
-0.1732881, 0.8093762, 1.742393, 0, 1, 0.5254902, 1,
-0.1686978, 1.495266, 1.279938, 0, 1, 0.5333334, 1,
-0.1674152, 0.417322, -1.187163, 0, 1, 0.5372549, 1,
-0.1609963, 0.9506696, 0.0738702, 0, 1, 0.5450981, 1,
-0.1572118, -0.1692258, -2.473452, 0, 1, 0.5490196, 1,
-0.1515085, -0.7461574, -2.970442, 0, 1, 0.5568628, 1,
-0.1460544, -0.8283263, -1.869738, 0, 1, 0.5607843, 1,
-0.1418975, 2.382161, -0.5437834, 0, 1, 0.5686275, 1,
-0.1389356, 0.2646856, 0.5081922, 0, 1, 0.572549, 1,
-0.1379936, -1.669384, -2.781845, 0, 1, 0.5803922, 1,
-0.1378628, -0.177843, -1.054795, 0, 1, 0.5843138, 1,
-0.1370859, -0.3596318, -5.619418, 0, 1, 0.5921569, 1,
-0.1337058, -0.5248705, -2.429028, 0, 1, 0.5960785, 1,
-0.1322407, -0.1217797, -2.950006, 0, 1, 0.6039216, 1,
-0.1280973, -0.405676, -1.724916, 0, 1, 0.6117647, 1,
-0.1270552, -0.6819661, -1.811777, 0, 1, 0.6156863, 1,
-0.1255893, -0.05014026, -2.655113, 0, 1, 0.6235294, 1,
-0.1243463, 0.589031, -0.2441738, 0, 1, 0.627451, 1,
-0.1242359, -0.8046877, -3.894255, 0, 1, 0.6352941, 1,
-0.1197388, 0.2307036, -0.9029336, 0, 1, 0.6392157, 1,
-0.1169404, 0.01822352, -1.091495, 0, 1, 0.6470588, 1,
-0.1082495, 0.3954064, -2.041078, 0, 1, 0.6509804, 1,
-0.1073846, 0.913644, 0.1234167, 0, 1, 0.6588235, 1,
-0.1058048, 1.158825, -0.1055349, 0, 1, 0.6627451, 1,
-0.1042977, 0.2637527, -0.8293878, 0, 1, 0.6705883, 1,
-0.1018913, -1.272374, -2.610354, 0, 1, 0.6745098, 1,
-0.101716, -0.5864058, -3.125939, 0, 1, 0.682353, 1,
-0.0950738, 0.342118, 0.09672993, 0, 1, 0.6862745, 1,
-0.08744016, 0.2210925, -0.8690424, 0, 1, 0.6941177, 1,
-0.08707786, -1.607142, -2.986445, 0, 1, 0.7019608, 1,
-0.08571157, -0.8649633, -2.856448, 0, 1, 0.7058824, 1,
-0.08026343, 0.8014652, -2.069638, 0, 1, 0.7137255, 1,
-0.07496659, 0.7430869, 0.7393783, 0, 1, 0.7176471, 1,
-0.07128727, 0.8998291, 0.9677051, 0, 1, 0.7254902, 1,
-0.0698622, 0.6272889, 0.8285623, 0, 1, 0.7294118, 1,
-0.06676318, 0.6350755, 1.077219, 0, 1, 0.7372549, 1,
-0.06604563, 0.5178677, -1.023474, 0, 1, 0.7411765, 1,
-0.06577356, -0.8882102, -2.093966, 0, 1, 0.7490196, 1,
-0.06570706, -1.426541, -2.96789, 0, 1, 0.7529412, 1,
-0.06521096, 0.5359403, 0.8668375, 0, 1, 0.7607843, 1,
-0.06466433, 0.5503293, 0.7387034, 0, 1, 0.7647059, 1,
-0.06429517, 1.312445, 0.710187, 0, 1, 0.772549, 1,
-0.05860923, -0.6660848, -2.391735, 0, 1, 0.7764706, 1,
-0.05685522, 0.8590773, 1.054973, 0, 1, 0.7843137, 1,
-0.05341316, 1.260957, 0.3960518, 0, 1, 0.7882353, 1,
-0.05234372, -0.9160581, -3.498229, 0, 1, 0.7960784, 1,
-0.0491005, 1.914494, -0.6288645, 0, 1, 0.8039216, 1,
-0.04804239, 0.4841794, -0.5371419, 0, 1, 0.8078431, 1,
-0.03843814, -0.1622173, -3.405771, 0, 1, 0.8156863, 1,
-0.03809412, 0.4760693, 0.2835159, 0, 1, 0.8196079, 1,
-0.03746813, 0.04090641, -1.475448, 0, 1, 0.827451, 1,
-0.02470504, 0.1824097, 0.1109863, 0, 1, 0.8313726, 1,
-0.02467536, -1.085608, -3.44428, 0, 1, 0.8392157, 1,
-0.02420093, -0.6069372, -3.852123, 0, 1, 0.8431373, 1,
-0.01112071, -0.5931463, -2.779296, 0, 1, 0.8509804, 1,
-0.01078078, -0.694882, -5.760789, 0, 1, 0.854902, 1,
-0.008628132, 1.417385, 0.8302504, 0, 1, 0.8627451, 1,
-0.003873136, 0.6912564, -0.5356326, 0, 1, 0.8666667, 1,
-0.001199139, -0.5209179, -5.639103, 0, 1, 0.8745098, 1,
0.003604378, 2.618214, -0.7460297, 0, 1, 0.8784314, 1,
0.004179604, -1.8842, 0.8676314, 0, 1, 0.8862745, 1,
0.005353887, 0.9090478, 1.338912, 0, 1, 0.8901961, 1,
0.008013743, 0.205752, 1.739911, 0, 1, 0.8980392, 1,
0.01120989, 0.09746699, 0.7068184, 0, 1, 0.9058824, 1,
0.01183896, 0.4529478, 0.5587247, 0, 1, 0.9098039, 1,
0.01254251, -0.3160686, 3.722939, 0, 1, 0.9176471, 1,
0.01303262, -0.2823179, 5.134458, 0, 1, 0.9215686, 1,
0.01615222, 0.6406682, -0.07905029, 0, 1, 0.9294118, 1,
0.01865404, 0.4712067, 1.120292, 0, 1, 0.9333333, 1,
0.02527509, 0.8231112, 0.1589615, 0, 1, 0.9411765, 1,
0.02834443, -1.134627, 1.480812, 0, 1, 0.945098, 1,
0.02943019, 0.3052279, 0.8472903, 0, 1, 0.9529412, 1,
0.02985684, -0.1291306, 2.551274, 0, 1, 0.9568627, 1,
0.03462692, 1.907279, -0.4352014, 0, 1, 0.9647059, 1,
0.03480795, -0.4359624, 1.650164, 0, 1, 0.9686275, 1,
0.03579319, -1.904405, 3.506617, 0, 1, 0.9764706, 1,
0.03630287, 1.327141, -0.9999455, 0, 1, 0.9803922, 1,
0.03714873, -0.7235491, 4.301898, 0, 1, 0.9882353, 1,
0.0390019, 0.06615175, 1.596223, 0, 1, 0.9921569, 1,
0.04170758, 0.4740917, -0.007573721, 0, 1, 1, 1,
0.04691499, -0.07327607, 3.480143, 0, 0.9921569, 1, 1,
0.05504012, 0.4563838, 1.515584, 0, 0.9882353, 1, 1,
0.06474672, 1.258497, -0.562911, 0, 0.9803922, 1, 1,
0.07478736, 1.340042, -1.139547, 0, 0.9764706, 1, 1,
0.07585727, 2.018426, -1.970527, 0, 0.9686275, 1, 1,
0.07753382, 0.5976458, -0.4872958, 0, 0.9647059, 1, 1,
0.07933336, 0.5880851, 0.4918827, 0, 0.9568627, 1, 1,
0.07938945, 0.1883473, -0.9533631, 0, 0.9529412, 1, 1,
0.07976785, 0.3718545, -0.6874389, 0, 0.945098, 1, 1,
0.08098815, 1.089993, -1.763499, 0, 0.9411765, 1, 1,
0.08428622, 0.002908792, 1.861273, 0, 0.9333333, 1, 1,
0.08522934, 0.4613186, 0.6300189, 0, 0.9294118, 1, 1,
0.08607497, -0.2212913, 3.340129, 0, 0.9215686, 1, 1,
0.09079143, -1.13249, 2.497951, 0, 0.9176471, 1, 1,
0.09557436, 0.3376788, 1.345832, 0, 0.9098039, 1, 1,
0.09570596, 2.465486, 1.262535, 0, 0.9058824, 1, 1,
0.09596694, 1.85267, -0.7114434, 0, 0.8980392, 1, 1,
0.09697339, 0.2454085, -0.6618208, 0, 0.8901961, 1, 1,
0.1042243, -1.042056, 1.861673, 0, 0.8862745, 1, 1,
0.1046053, 0.722993, 0.8178508, 0, 0.8784314, 1, 1,
0.1073534, 0.07734556, 0.4653291, 0, 0.8745098, 1, 1,
0.1154741, -0.3016239, 3.281028, 0, 0.8666667, 1, 1,
0.1160925, -0.6119428, 2.935293, 0, 0.8627451, 1, 1,
0.1170792, -0.7521579, 3.93013, 0, 0.854902, 1, 1,
0.1177577, -0.7176507, 2.721445, 0, 0.8509804, 1, 1,
0.1181729, -0.5981023, 2.511826, 0, 0.8431373, 1, 1,
0.1234433, -1.02732, 3.593086, 0, 0.8392157, 1, 1,
0.1280322, -0.9473168, 3.359941, 0, 0.8313726, 1, 1,
0.1281285, -0.01158944, 1.142094, 0, 0.827451, 1, 1,
0.1332294, 0.6808895, -0.03968786, 0, 0.8196079, 1, 1,
0.1334742, -0.2709458, 3.889266, 0, 0.8156863, 1, 1,
0.1334801, -0.3023328, 5.269405, 0, 0.8078431, 1, 1,
0.1371151, -0.1130285, 1.359636, 0, 0.8039216, 1, 1,
0.1371556, 0.8709986, 0.04496934, 0, 0.7960784, 1, 1,
0.1420071, 1.505942, 1.04008, 0, 0.7882353, 1, 1,
0.1432397, -0.9085225, 2.376742, 0, 0.7843137, 1, 1,
0.1441255, 0.5763438, -0.4098023, 0, 0.7764706, 1, 1,
0.1479099, -0.9421051, 1.094697, 0, 0.772549, 1, 1,
0.149739, 1.237537, -0.233187, 0, 0.7647059, 1, 1,
0.1515708, -0.2813318, 1.180906, 0, 0.7607843, 1, 1,
0.1546514, -0.5213986, 2.778501, 0, 0.7529412, 1, 1,
0.1636835, -1.116929, 1.723259, 0, 0.7490196, 1, 1,
0.1651849, 0.9409467, 0.9588188, 0, 0.7411765, 1, 1,
0.1665443, -1.474991, 3.819086, 0, 0.7372549, 1, 1,
0.1673695, 1.226507, 0.7182251, 0, 0.7294118, 1, 1,
0.1705363, 2.979581, 0.7000081, 0, 0.7254902, 1, 1,
0.1707029, -0.1853601, 1.373615, 0, 0.7176471, 1, 1,
0.1713599, 0.7524275, 1.208758, 0, 0.7137255, 1, 1,
0.1737151, 1.439442, -1.116392, 0, 0.7058824, 1, 1,
0.1743311, -0.1063029, 3.709815, 0, 0.6980392, 1, 1,
0.1753014, 1.107404, 1.378219, 0, 0.6941177, 1, 1,
0.1763788, -0.107999, 2.302186, 0, 0.6862745, 1, 1,
0.1765882, 0.2761462, 0.4123731, 0, 0.682353, 1, 1,
0.1771829, 0.2899523, 0.006317274, 0, 0.6745098, 1, 1,
0.1792865, 0.06578042, 1.588573, 0, 0.6705883, 1, 1,
0.1821711, -0.01189001, 1.374473, 0, 0.6627451, 1, 1,
0.1832204, 0.3360965, 0.7491622, 0, 0.6588235, 1, 1,
0.1832238, 0.1191784, 1.713581, 0, 0.6509804, 1, 1,
0.1832819, 0.1769564, 0.9686087, 0, 0.6470588, 1, 1,
0.1835684, -0.7525414, 1.047916, 0, 0.6392157, 1, 1,
0.184495, 1.31517, -0.1512416, 0, 0.6352941, 1, 1,
0.1884639, 0.4834949, 1.403605, 0, 0.627451, 1, 1,
0.1899188, -2.194554, 3.702101, 0, 0.6235294, 1, 1,
0.1912999, -0.7073792, 1.718928, 0, 0.6156863, 1, 1,
0.1960637, -0.8470141, 3.01739, 0, 0.6117647, 1, 1,
0.2001643, -1.295936, 2.727875, 0, 0.6039216, 1, 1,
0.2025533, -0.9320247, 4.205569, 0, 0.5960785, 1, 1,
0.2045847, 0.1589996, 0.6287799, 0, 0.5921569, 1, 1,
0.2057706, -0.3784652, 4.235404, 0, 0.5843138, 1, 1,
0.2064092, 0.1554626, 1.936282, 0, 0.5803922, 1, 1,
0.2069015, 1.300359, -0.7297416, 0, 0.572549, 1, 1,
0.2101806, -1.923472, 3.572746, 0, 0.5686275, 1, 1,
0.2115055, -0.4345537, 2.527139, 0, 0.5607843, 1, 1,
0.2141616, -1.20962, 2.214004, 0, 0.5568628, 1, 1,
0.2162402, -0.2910962, 5.011318, 0, 0.5490196, 1, 1,
0.2191044, 1.527924, 0.6971219, 0, 0.5450981, 1, 1,
0.222873, 0.8643233, -0.4993832, 0, 0.5372549, 1, 1,
0.2266724, 1.471076, 0.644636, 0, 0.5333334, 1, 1,
0.2268015, 0.02069041, 1.665408, 0, 0.5254902, 1, 1,
0.2346501, -0.9123833, 1.467438, 0, 0.5215687, 1, 1,
0.238955, -0.06649722, 1.277187, 0, 0.5137255, 1, 1,
0.2395323, 0.08770363, 2.42137, 0, 0.509804, 1, 1,
0.2501934, -0.05943846, 3.374036, 0, 0.5019608, 1, 1,
0.2516026, -0.5848265, 1.829369, 0, 0.4941176, 1, 1,
0.2538139, -0.7479028, 2.707481, 0, 0.4901961, 1, 1,
0.2542304, -0.0138343, 0.9736006, 0, 0.4823529, 1, 1,
0.2578584, -1.412951, 1.916189, 0, 0.4784314, 1, 1,
0.2657181, -0.9997188, 2.861268, 0, 0.4705882, 1, 1,
0.266323, -0.2488156, 1.120721, 0, 0.4666667, 1, 1,
0.2739418, 0.6239663, 0.5463115, 0, 0.4588235, 1, 1,
0.2753679, 0.93956, 1.252955, 0, 0.454902, 1, 1,
0.2784095, 0.891599, -0.4054971, 0, 0.4470588, 1, 1,
0.278641, -1.720266, 2.970814, 0, 0.4431373, 1, 1,
0.2814872, -0.1818884, 3.796086, 0, 0.4352941, 1, 1,
0.2855721, 1.248455, 0.1037456, 0, 0.4313726, 1, 1,
0.2895505, 0.6780934, 1.723112, 0, 0.4235294, 1, 1,
0.291878, 0.4067708, -1.54398, 0, 0.4196078, 1, 1,
0.2995391, -0.2257463, 1.766182, 0, 0.4117647, 1, 1,
0.300026, 1.344707, -0.7796111, 0, 0.4078431, 1, 1,
0.3001748, 1.198053, 0.794868, 0, 0.4, 1, 1,
0.3019794, 1.91599, 0.9829929, 0, 0.3921569, 1, 1,
0.3061006, 1.064038, 1.219163, 0, 0.3882353, 1, 1,
0.3061437, 0.6644582, -0.3753221, 0, 0.3803922, 1, 1,
0.3093266, -0.3485089, 0.5057004, 0, 0.3764706, 1, 1,
0.3094936, 0.1454315, 0.9202343, 0, 0.3686275, 1, 1,
0.3117209, 0.4459645, 0.09581647, 0, 0.3647059, 1, 1,
0.3220825, 0.3589399, -0.5339974, 0, 0.3568628, 1, 1,
0.3225575, -0.08236795, 1.518155, 0, 0.3529412, 1, 1,
0.3230294, -1.138779, 1.715406, 0, 0.345098, 1, 1,
0.3262952, -0.5214181, 2.488155, 0, 0.3411765, 1, 1,
0.3271513, -0.7488959, 3.571416, 0, 0.3333333, 1, 1,
0.3311748, 1.289044, 0.145715, 0, 0.3294118, 1, 1,
0.3412014, 1.083246, -0.286593, 0, 0.3215686, 1, 1,
0.341879, 1.429268, 0.6936973, 0, 0.3176471, 1, 1,
0.3424142, 0.7134476, 1.733256, 0, 0.3098039, 1, 1,
0.3434052, 1.072308, 1.096743, 0, 0.3058824, 1, 1,
0.3468055, 0.7867002, -0.2160062, 0, 0.2980392, 1, 1,
0.3482813, -0.4971703, 2.919297, 0, 0.2901961, 1, 1,
0.3489764, -0.9004527, 4.111421, 0, 0.2862745, 1, 1,
0.350756, 0.6067352, 0.9770604, 0, 0.2784314, 1, 1,
0.3537832, -1.023947, 1.786055, 0, 0.2745098, 1, 1,
0.3541248, 0.9082066, -1.869086, 0, 0.2666667, 1, 1,
0.3543756, -0.8567196, 2.414754, 0, 0.2627451, 1, 1,
0.3552942, 1.197576, 0.8650692, 0, 0.254902, 1, 1,
0.3565294, -0.7875337, 3.322866, 0, 0.2509804, 1, 1,
0.3592218, -0.3354981, 2.934633, 0, 0.2431373, 1, 1,
0.3607981, 0.3153971, 1.012073, 0, 0.2392157, 1, 1,
0.3610794, 0.4449071, -1.293659, 0, 0.2313726, 1, 1,
0.3627512, -0.02620837, 1.438308, 0, 0.227451, 1, 1,
0.3637229, -0.5442302, 3.326724, 0, 0.2196078, 1, 1,
0.3639683, 0.112036, 0.2208176, 0, 0.2156863, 1, 1,
0.3649853, 0.4695397, 0.3239829, 0, 0.2078431, 1, 1,
0.3689875, -2.048054, 3.651131, 0, 0.2039216, 1, 1,
0.3704989, 1.616231, 1.13807, 0, 0.1960784, 1, 1,
0.3801026, -0.7947097, 3.403194, 0, 0.1882353, 1, 1,
0.3866156, -1.69561, 1.152761, 0, 0.1843137, 1, 1,
0.388109, 1.084262, 0.3417905, 0, 0.1764706, 1, 1,
0.3885963, 0.7324699, 0.332068, 0, 0.172549, 1, 1,
0.3898482, -0.6905658, 1.649927, 0, 0.1647059, 1, 1,
0.391838, -0.502651, 0.4085673, 0, 0.1607843, 1, 1,
0.3935969, -0.8681604, 1.712197, 0, 0.1529412, 1, 1,
0.3946629, 0.2848126, 2.145267, 0, 0.1490196, 1, 1,
0.3985319, -0.4921766, 2.658448, 0, 0.1411765, 1, 1,
0.3995311, 1.660746, 0.8618979, 0, 0.1372549, 1, 1,
0.401006, 0.1389796, 1.084108, 0, 0.1294118, 1, 1,
0.4018309, 0.8636245, -0.7785761, 0, 0.1254902, 1, 1,
0.4036272, -0.2070897, 3.377602, 0, 0.1176471, 1, 1,
0.4062528, -1.116061, 2.52327, 0, 0.1137255, 1, 1,
0.4086823, 0.4055845, -1.038369, 0, 0.1058824, 1, 1,
0.4099549, 1.733391, 0.3670839, 0, 0.09803922, 1, 1,
0.4112389, 0.6996149, 1.862291, 0, 0.09411765, 1, 1,
0.4119159, 0.008787932, 1.464546, 0, 0.08627451, 1, 1,
0.4145532, 1.045954, -0.03169551, 0, 0.08235294, 1, 1,
0.4173696, -0.9772097, 2.04242, 0, 0.07450981, 1, 1,
0.4182884, -1.022788, 3.022053, 0, 0.07058824, 1, 1,
0.4252179, -1.352126, 2.719082, 0, 0.0627451, 1, 1,
0.4278871, -0.5678396, 4.390854, 0, 0.05882353, 1, 1,
0.4284287, -1.294904, 3.32182, 0, 0.05098039, 1, 1,
0.4296855, -0.8208231, 1.297812, 0, 0.04705882, 1, 1,
0.4388911, -0.009534483, 1.497276, 0, 0.03921569, 1, 1,
0.439228, -0.7442825, 2.209242, 0, 0.03529412, 1, 1,
0.4394168, -0.2979203, 1.353116, 0, 0.02745098, 1, 1,
0.4427257, -0.2634666, 1.473642, 0, 0.02352941, 1, 1,
0.446166, 1.455717, 0.5324798, 0, 0.01568628, 1, 1,
0.4465445, -0.8601776, 1.381491, 0, 0.01176471, 1, 1,
0.4509541, 0.03667818, -0.09501144, 0, 0.003921569, 1, 1,
0.4539155, 0.1073858, 1.020563, 0.003921569, 0, 1, 1,
0.4540542, -0.2756314, 1.674024, 0.007843138, 0, 1, 1,
0.4574018, 0.6383326, 0.7134811, 0.01568628, 0, 1, 1,
0.4627301, 1.029985, -0.3327849, 0.01960784, 0, 1, 1,
0.4654881, 0.2549755, -1.002605, 0.02745098, 0, 1, 1,
0.4657857, -0.5904506, 2.743414, 0.03137255, 0, 1, 1,
0.4665141, -0.2552846, -0.7488421, 0.03921569, 0, 1, 1,
0.4707247, 1.675921, 0.8090015, 0.04313726, 0, 1, 1,
0.471774, -0.08014622, 2.336977, 0.05098039, 0, 1, 1,
0.476624, -0.6581087, 2.593425, 0.05490196, 0, 1, 1,
0.4793478, -0.1197065, 2.244882, 0.0627451, 0, 1, 1,
0.4793656, 0.30748, 0.9162348, 0.06666667, 0, 1, 1,
0.4827847, 1.088592, 0.1692517, 0.07450981, 0, 1, 1,
0.4840766, -0.4945752, 1.592176, 0.07843138, 0, 1, 1,
0.4907878, 0.2674634, 2.213023, 0.08627451, 0, 1, 1,
0.4918372, 0.6985907, -0.6819049, 0.09019608, 0, 1, 1,
0.4973499, -0.05986414, 1.759543, 0.09803922, 0, 1, 1,
0.4984671, 0.7871183, -1.133858, 0.1058824, 0, 1, 1,
0.5012683, 1.26319, 0.5617144, 0.1098039, 0, 1, 1,
0.5017411, 0.3734715, 1.339151, 0.1176471, 0, 1, 1,
0.5052897, 0.9175956, 2.077686, 0.1215686, 0, 1, 1,
0.5066882, -0.1140391, 0.1110994, 0.1294118, 0, 1, 1,
0.5071701, -1.509875, 1.969868, 0.1333333, 0, 1, 1,
0.5089372, 0.4009929, 2.426677, 0.1411765, 0, 1, 1,
0.5129228, -0.0992799, 0.2021435, 0.145098, 0, 1, 1,
0.5146942, -0.1764882, 1.58679, 0.1529412, 0, 1, 1,
0.5155309, 0.8740046, 0.3217273, 0.1568628, 0, 1, 1,
0.516533, 0.236419, 0.7587801, 0.1647059, 0, 1, 1,
0.5252009, 1.909367, -0.412879, 0.1686275, 0, 1, 1,
0.5265754, -0.4441533, 1.721744, 0.1764706, 0, 1, 1,
0.5287465, -0.2127741, 2.24132, 0.1803922, 0, 1, 1,
0.5333686, 1.998156, -1.99864, 0.1882353, 0, 1, 1,
0.5368341, 0.1693427, 0.5334957, 0.1921569, 0, 1, 1,
0.5402237, 2.424487, 2.242047, 0.2, 0, 1, 1,
0.5410412, -0.5102278, 5.001688, 0.2078431, 0, 1, 1,
0.5438634, 0.2975855, 2.376335, 0.2117647, 0, 1, 1,
0.5448039, 0.02206206, 2.218091, 0.2196078, 0, 1, 1,
0.5513436, -1.547651, 3.384261, 0.2235294, 0, 1, 1,
0.5601409, -0.1877924, 1.726253, 0.2313726, 0, 1, 1,
0.5605844, -0.7248464, 2.187826, 0.2352941, 0, 1, 1,
0.561027, 1.667089, 1.802258, 0.2431373, 0, 1, 1,
0.5655661, -0.4595007, 2.939232, 0.2470588, 0, 1, 1,
0.5694814, 1.679569, -1.268608, 0.254902, 0, 1, 1,
0.5718756, -1.300446, 2.07556, 0.2588235, 0, 1, 1,
0.5782564, 0.3943756, 1.574264, 0.2666667, 0, 1, 1,
0.5868242, 0.3671191, 1.088473, 0.2705882, 0, 1, 1,
0.5882217, -1.229722, 4.729432, 0.2784314, 0, 1, 1,
0.5900719, -1.112095, 2.214502, 0.282353, 0, 1, 1,
0.5931686, 1.421115, 1.031297, 0.2901961, 0, 1, 1,
0.5934827, 0.2614023, 0.706837, 0.2941177, 0, 1, 1,
0.5944036, -1.044888, 1.933847, 0.3019608, 0, 1, 1,
0.596137, 0.7538892, -0.5441347, 0.3098039, 0, 1, 1,
0.597632, -0.0252765, 2.246791, 0.3137255, 0, 1, 1,
0.5997561, -1.023567, 2.061495, 0.3215686, 0, 1, 1,
0.6003103, -1.089583, 2.3469, 0.3254902, 0, 1, 1,
0.6003969, 0.8450836, 1.745803, 0.3333333, 0, 1, 1,
0.605138, -1.962189, 2.203003, 0.3372549, 0, 1, 1,
0.6134303, -0.5562122, 2.913742, 0.345098, 0, 1, 1,
0.6143181, 0.2089292, 1.364412, 0.3490196, 0, 1, 1,
0.6146241, -0.457575, 3.304631, 0.3568628, 0, 1, 1,
0.616923, -0.494186, 0.684823, 0.3607843, 0, 1, 1,
0.619337, 0.9998751, -0.1300267, 0.3686275, 0, 1, 1,
0.6195626, 0.1990936, 2.269861, 0.372549, 0, 1, 1,
0.6202393, -0.736005, 1.679398, 0.3803922, 0, 1, 1,
0.6239341, 1.322436, 0.04977923, 0.3843137, 0, 1, 1,
0.6270719, 0.4256609, 2.257274, 0.3921569, 0, 1, 1,
0.6297251, -1.213005, 1.647766, 0.3960784, 0, 1, 1,
0.6306987, 0.266767, 1.854696, 0.4039216, 0, 1, 1,
0.633755, -1.272951, 2.826897, 0.4117647, 0, 1, 1,
0.6387084, 0.6157175, -0.188987, 0.4156863, 0, 1, 1,
0.6391125, -1.196632, 2.66886, 0.4235294, 0, 1, 1,
0.6395101, -0.04603512, 1.276879, 0.427451, 0, 1, 1,
0.6406348, -0.8833401, 1.982598, 0.4352941, 0, 1, 1,
0.6424733, 1.442479, 1.537561, 0.4392157, 0, 1, 1,
0.6452034, 0.8608146, 1.515133, 0.4470588, 0, 1, 1,
0.647949, 1.132878, 0.4765545, 0.4509804, 0, 1, 1,
0.6500511, -0.9603922, 2.4768, 0.4588235, 0, 1, 1,
0.6560489, -0.5753694, 1.780794, 0.4627451, 0, 1, 1,
0.6562203, -1.160376, 2.990899, 0.4705882, 0, 1, 1,
0.6591281, 0.2231087, 1.568411, 0.4745098, 0, 1, 1,
0.666707, 0.2691544, -0.03641381, 0.4823529, 0, 1, 1,
0.6680368, -0.6568039, 0.7885537, 0.4862745, 0, 1, 1,
0.6682054, 0.6230863, 0.7341349, 0.4941176, 0, 1, 1,
0.6713312, -0.283026, 2.206222, 0.5019608, 0, 1, 1,
0.6804388, -0.3710496, 0.594664, 0.5058824, 0, 1, 1,
0.689042, -0.9145658, 2.0344, 0.5137255, 0, 1, 1,
0.6938192, -1.18298, 1.450189, 0.5176471, 0, 1, 1,
0.6940287, 0.2972014, 0.9757719, 0.5254902, 0, 1, 1,
0.707325, -0.3548641, 3.497549, 0.5294118, 0, 1, 1,
0.7085196, -0.9251783, 2.409449, 0.5372549, 0, 1, 1,
0.7119702, 0.7662503, -1.87925, 0.5411765, 0, 1, 1,
0.7145876, 0.2301665, 1.538909, 0.5490196, 0, 1, 1,
0.7146318, 2.984894, 0.8635508, 0.5529412, 0, 1, 1,
0.716609, 0.3708257, 1.421097, 0.5607843, 0, 1, 1,
0.7168224, 0.890667, 0.3299583, 0.5647059, 0, 1, 1,
0.7253875, 0.725045, 1.240916, 0.572549, 0, 1, 1,
0.7314289, 1.118101, 1.540722, 0.5764706, 0, 1, 1,
0.7323179, 0.7189202, 0.5208287, 0.5843138, 0, 1, 1,
0.7324498, 0.5527429, 0.9285512, 0.5882353, 0, 1, 1,
0.7386907, 1.420499, -0.4664081, 0.5960785, 0, 1, 1,
0.7630369, 0.8467986, 0.9746497, 0.6039216, 0, 1, 1,
0.7692811, -0.1103139, 1.527118, 0.6078432, 0, 1, 1,
0.7718611, 0.7649158, 1.111894, 0.6156863, 0, 1, 1,
0.7721779, 0.7303008, 0.6823283, 0.6196079, 0, 1, 1,
0.7731553, -1.057589, 3.347813, 0.627451, 0, 1, 1,
0.7865396, 0.7844682, 2.550704, 0.6313726, 0, 1, 1,
0.7877353, 0.08629183, 1.952665, 0.6392157, 0, 1, 1,
0.7901843, -0.995446, 1.384615, 0.6431373, 0, 1, 1,
0.7906656, -0.111325, 1.672992, 0.6509804, 0, 1, 1,
0.791664, 0.1721704, 1.584143, 0.654902, 0, 1, 1,
0.7948394, 1.810946, 1.657995, 0.6627451, 0, 1, 1,
0.7950404, 0.2432743, -0.3976556, 0.6666667, 0, 1, 1,
0.7973488, -0.775608, 2.213079, 0.6745098, 0, 1, 1,
0.8064461, 1.482108, 1.610058, 0.6784314, 0, 1, 1,
0.807638, 1.583528, -3.014025, 0.6862745, 0, 1, 1,
0.8130422, -0.7621789, 2.102909, 0.6901961, 0, 1, 1,
0.8187507, 1.342568, -0.0784582, 0.6980392, 0, 1, 1,
0.8201698, 0.2641134, 1.784584, 0.7058824, 0, 1, 1,
0.8223726, 0.2228281, -0.8288997, 0.7098039, 0, 1, 1,
0.8237988, -0.9808269, 2.813184, 0.7176471, 0, 1, 1,
0.8240569, 0.6399728, 0.4610583, 0.7215686, 0, 1, 1,
0.8246644, -1.116617, 3.249254, 0.7294118, 0, 1, 1,
0.8279131, 1.637854, -0.4157609, 0.7333333, 0, 1, 1,
0.8326729, 1.583817, 0.9305132, 0.7411765, 0, 1, 1,
0.8427882, 1.327853, 0.04274024, 0.7450981, 0, 1, 1,
0.8548017, 0.2039926, 2.567442, 0.7529412, 0, 1, 1,
0.8602278, 0.1099611, 1.796579, 0.7568628, 0, 1, 1,
0.8634521, 0.6605811, 0.5803542, 0.7647059, 0, 1, 1,
0.8674552, 0.1323222, 0.5210475, 0.7686275, 0, 1, 1,
0.8703014, -0.08441191, 1.779135, 0.7764706, 0, 1, 1,
0.8746178, -1.147521, 1.49291, 0.7803922, 0, 1, 1,
0.8768803, 0.9065425, 2.425386, 0.7882353, 0, 1, 1,
0.8820766, 1.014794, 0.10852, 0.7921569, 0, 1, 1,
0.896392, -0.562593, 3.634311, 0.8, 0, 1, 1,
0.9064653, 0.2140966, 1.447057, 0.8078431, 0, 1, 1,
0.9131964, -1.645388, 3.5486, 0.8117647, 0, 1, 1,
0.9136906, -0.5675179, 0.8700261, 0.8196079, 0, 1, 1,
0.9188365, 0.6964408, 0.6348045, 0.8235294, 0, 1, 1,
0.9238911, -0.06228542, 2.449038, 0.8313726, 0, 1, 1,
0.9247348, 1.197854, -1.677984, 0.8352941, 0, 1, 1,
0.9282271, 0.8203883, 1.745391, 0.8431373, 0, 1, 1,
0.9285175, -0.7047573, 3.287591, 0.8470588, 0, 1, 1,
0.9306452, -0.4257205, 0.0735348, 0.854902, 0, 1, 1,
0.932734, 0.6497552, 0.2367919, 0.8588235, 0, 1, 1,
0.9416564, -0.2746133, 2.121849, 0.8666667, 0, 1, 1,
0.946519, -0.149054, 0.3930163, 0.8705882, 0, 1, 1,
0.9470617, 2.458944, 0.9336081, 0.8784314, 0, 1, 1,
0.9475251, 1.090527, 0.03565324, 0.8823529, 0, 1, 1,
0.952814, -0.0881108, 3.322802, 0.8901961, 0, 1, 1,
0.9608878, -1.297824, 3.227311, 0.8941177, 0, 1, 1,
0.9654602, -2.172076, 2.377956, 0.9019608, 0, 1, 1,
0.9698637, -1.102265, 1.807004, 0.9098039, 0, 1, 1,
0.9741762, 1.597959, 0.6701627, 0.9137255, 0, 1, 1,
0.9790919, -0.08244606, 1.560821, 0.9215686, 0, 1, 1,
0.9844648, -0.5484974, 0.2461587, 0.9254902, 0, 1, 1,
0.9950925, -0.1501857, 2.393895, 0.9333333, 0, 1, 1,
0.9963096, 1.145639, -0.30181, 0.9372549, 0, 1, 1,
0.9985859, 0.04640242, 1.769201, 0.945098, 0, 1, 1,
1.009791, 1.155975, 0.6090907, 0.9490196, 0, 1, 1,
1.011493, -0.6293091, 3.020215, 0.9568627, 0, 1, 1,
1.014494, 0.8559377, 0.2809224, 0.9607843, 0, 1, 1,
1.017344, -0.1691641, 0.6728735, 0.9686275, 0, 1, 1,
1.021995, 0.9042952, 1.298013, 0.972549, 0, 1, 1,
1.024034, 1.374928, 0.4196267, 0.9803922, 0, 1, 1,
1.027005, 1.001109, -0.3238266, 0.9843137, 0, 1, 1,
1.031094, 2.059957, 0.01661386, 0.9921569, 0, 1, 1,
1.032027, 0.2591906, 1.496403, 0.9960784, 0, 1, 1,
1.034816, -0.8524156, 4.362426, 1, 0, 0.9960784, 1,
1.036885, 0.8757452, 2.09005, 1, 0, 0.9882353, 1,
1.040426, -0.09073774, 1.005075, 1, 0, 0.9843137, 1,
1.041788, 0.686444, 0.6649853, 1, 0, 0.9764706, 1,
1.043455, -0.8239903, 2.491057, 1, 0, 0.972549, 1,
1.046072, -1.001107, 4.059556, 1, 0, 0.9647059, 1,
1.046154, -1.912413, 2.421999, 1, 0, 0.9607843, 1,
1.047336, 0.1993399, 2.822269, 1, 0, 0.9529412, 1,
1.055149, -0.6014183, 2.789152, 1, 0, 0.9490196, 1,
1.057834, -0.436561, 1.151615, 1, 0, 0.9411765, 1,
1.058609, -0.2181413, 0.821858, 1, 0, 0.9372549, 1,
1.061201, -0.473033, 3.13669, 1, 0, 0.9294118, 1,
1.062224, 0.5610435, 1.429202, 1, 0, 0.9254902, 1,
1.067145, 0.4098544, 1.779921, 1, 0, 0.9176471, 1,
1.069709, 1.184122, 0.5367821, 1, 0, 0.9137255, 1,
1.070463, -1.223067, 2.909496, 1, 0, 0.9058824, 1,
1.072882, -1.521171, 2.848272, 1, 0, 0.9019608, 1,
1.083532, 0.5091509, 1.071249, 1, 0, 0.8941177, 1,
1.09212, -0.5005358, 0.2490532, 1, 0, 0.8862745, 1,
1.097817, 0.8198715, 0.7414558, 1, 0, 0.8823529, 1,
1.097926, -0.9000773, 4.795959, 1, 0, 0.8745098, 1,
1.101733, -1.818358, 3.800953, 1, 0, 0.8705882, 1,
1.104926, -2.27942, 2.373953, 1, 0, 0.8627451, 1,
1.114028, -0.3429503, 2.376801, 1, 0, 0.8588235, 1,
1.114587, 0.9661508, 2.437083, 1, 0, 0.8509804, 1,
1.12273, -0.4053772, 0.9960768, 1, 0, 0.8470588, 1,
1.126331, 0.06206346, 0.8480766, 1, 0, 0.8392157, 1,
1.1302, 1.625239, 1.112176, 1, 0, 0.8352941, 1,
1.130473, -0.7006112, 2.301681, 1, 0, 0.827451, 1,
1.134308, 0.1814629, 1.207161, 1, 0, 0.8235294, 1,
1.135463, -2.024427, 1.794344, 1, 0, 0.8156863, 1,
1.141955, 0.9934945, 1.773305, 1, 0, 0.8117647, 1,
1.147399, -0.92876, 4.463474, 1, 0, 0.8039216, 1,
1.152686, -1.408927, -0.1900046, 1, 0, 0.7960784, 1,
1.160555, 0.5521152, 2.242033, 1, 0, 0.7921569, 1,
1.160971, 0.1467472, 0.4568191, 1, 0, 0.7843137, 1,
1.16343, -0.991319, 2.299368, 1, 0, 0.7803922, 1,
1.163936, 1.275665, 1.007284, 1, 0, 0.772549, 1,
1.19519, -1.528504, 2.374928, 1, 0, 0.7686275, 1,
1.209797, 1.060442, 0.2384261, 1, 0, 0.7607843, 1,
1.211562, 0.2713212, 0.6990907, 1, 0, 0.7568628, 1,
1.217951, -0.1036935, 0.8295046, 1, 0, 0.7490196, 1,
1.229394, -0.307946, 1.659284, 1, 0, 0.7450981, 1,
1.230252, -0.3989409, 2.174581, 1, 0, 0.7372549, 1,
1.237049, -0.8896133, 3.171849, 1, 0, 0.7333333, 1,
1.244328, -0.8772678, 1.788777, 1, 0, 0.7254902, 1,
1.248371, 1.341239, -1.501195, 1, 0, 0.7215686, 1,
1.252623, 1.811088, 1.050265, 1, 0, 0.7137255, 1,
1.262163, -1.442719, 2.059654, 1, 0, 0.7098039, 1,
1.263524, -0.9291289, 1.882224, 1, 0, 0.7019608, 1,
1.275073, -0.8046786, 1.991235, 1, 0, 0.6941177, 1,
1.277047, -0.541844, 1.784479, 1, 0, 0.6901961, 1,
1.300637, -1.534869, 1.749932, 1, 0, 0.682353, 1,
1.308259, -1.016858, 1.193101, 1, 0, 0.6784314, 1,
1.319314, -0.2548145, 1.340246, 1, 0, 0.6705883, 1,
1.346483, -1.266188, 2.855269, 1, 0, 0.6666667, 1,
1.347457, 0.07258829, 1.586269, 1, 0, 0.6588235, 1,
1.35652, 0.5922091, 0.7990128, 1, 0, 0.654902, 1,
1.359064, 0.2206164, 0.9772366, 1, 0, 0.6470588, 1,
1.371404, 0.09137748, 0.9580132, 1, 0, 0.6431373, 1,
1.375274, 0.3140641, 2.136937, 1, 0, 0.6352941, 1,
1.376087, -0.4146073, 3.178005, 1, 0, 0.6313726, 1,
1.387398, -0.1242307, 1.671684, 1, 0, 0.6235294, 1,
1.401225, -0.8737268, 2.317621, 1, 0, 0.6196079, 1,
1.40248, 0.8681026, 1.724343, 1, 0, 0.6117647, 1,
1.406227, -0.4893402, 2.385522, 1, 0, 0.6078432, 1,
1.410801, -1.257285, 3.769266, 1, 0, 0.6, 1,
1.412727, -1.59039, 2.220995, 1, 0, 0.5921569, 1,
1.41424, 0.1087523, 0.8952259, 1, 0, 0.5882353, 1,
1.414477, -0.05062113, 0.7245866, 1, 0, 0.5803922, 1,
1.416181, -0.9828252, 2.219122, 1, 0, 0.5764706, 1,
1.418413, -0.9962345, 0.5397465, 1, 0, 0.5686275, 1,
1.422766, -0.3307097, 3.843253, 1, 0, 0.5647059, 1,
1.424417, 0.3336, -0.3656731, 1, 0, 0.5568628, 1,
1.428957, 0.2429119, 1.338923, 1, 0, 0.5529412, 1,
1.434747, -1.195655, 0.07693404, 1, 0, 0.5450981, 1,
1.437916, 0.613676, 1.579874, 1, 0, 0.5411765, 1,
1.446632, -0.2061065, 1.560743, 1, 0, 0.5333334, 1,
1.453358, 1.194178, 1.961263, 1, 0, 0.5294118, 1,
1.463526, -0.380574, 0.8552738, 1, 0, 0.5215687, 1,
1.46962, 0.2470994, 0.9037875, 1, 0, 0.5176471, 1,
1.473066, 0.4938218, 1.799439, 1, 0, 0.509804, 1,
1.47412, -1.2408, 2.276766, 1, 0, 0.5058824, 1,
1.478223, 2.467514, -0.2790516, 1, 0, 0.4980392, 1,
1.508474, -2.101623, 2.284036, 1, 0, 0.4901961, 1,
1.51034, -0.5109764, 1.442424, 1, 0, 0.4862745, 1,
1.513721, -0.1518213, 2.232077, 1, 0, 0.4784314, 1,
1.518223, -0.3713827, 1.597683, 1, 0, 0.4745098, 1,
1.519243, -0.3513346, 3.588702, 1, 0, 0.4666667, 1,
1.522564, 1.285112, 1.091121, 1, 0, 0.4627451, 1,
1.522947, 1.237997, 0.4911751, 1, 0, 0.454902, 1,
1.524829, 0.5528494, 0.1431284, 1, 0, 0.4509804, 1,
1.52605, -0.2735335, 0.5419567, 1, 0, 0.4431373, 1,
1.52704, -0.625336, 3.884018, 1, 0, 0.4392157, 1,
1.528549, -1.914118, 2.351714, 1, 0, 0.4313726, 1,
1.534049, -0.7440924, 2.191755, 1, 0, 0.427451, 1,
1.534117, 0.9477192, 2.435176, 1, 0, 0.4196078, 1,
1.535897, -1.557929, 2.917174, 1, 0, 0.4156863, 1,
1.542228, 1.901526, 2.375452, 1, 0, 0.4078431, 1,
1.553904, -0.3933136, 1.571647, 1, 0, 0.4039216, 1,
1.558861, -1.008002, 0.9579698, 1, 0, 0.3960784, 1,
1.568164, -1.767403, 3.951523, 1, 0, 0.3882353, 1,
1.575055, -1.178597, 2.715359, 1, 0, 0.3843137, 1,
1.589193, 2.046369, -0.3317431, 1, 0, 0.3764706, 1,
1.596474, 1.056392, 0.5116334, 1, 0, 0.372549, 1,
1.599491, -0.6302498, 2.639806, 1, 0, 0.3647059, 1,
1.601335, -2.235072, 3.594385, 1, 0, 0.3607843, 1,
1.607043, -0.1942849, 0.7781928, 1, 0, 0.3529412, 1,
1.607895, 1.321298, 0.8168498, 1, 0, 0.3490196, 1,
1.610547, 0.6687222, 1.009411, 1, 0, 0.3411765, 1,
1.616505, 0.2354635, 0.620805, 1, 0, 0.3372549, 1,
1.640061, 0.2933446, 1.145284, 1, 0, 0.3294118, 1,
1.647078, -0.3363101, 1.361588, 1, 0, 0.3254902, 1,
1.647488, 0.6402399, 1.490499, 1, 0, 0.3176471, 1,
1.670357, 0.9218751, 0.3444148, 1, 0, 0.3137255, 1,
1.674328, 0.2254801, 1.341797, 1, 0, 0.3058824, 1,
1.674648, 1.16304, 2.43198, 1, 0, 0.2980392, 1,
1.684147, 1.511692, 1.633999, 1, 0, 0.2941177, 1,
1.686113, 0.7545007, 2.603498, 1, 0, 0.2862745, 1,
1.701819, 0.2332042, 1.937795, 1, 0, 0.282353, 1,
1.717242, -1.042065, 1.435057, 1, 0, 0.2745098, 1,
1.720576, -0.6883739, 1.682969, 1, 0, 0.2705882, 1,
1.722254, -1.080117, 0.9913375, 1, 0, 0.2627451, 1,
1.728274, -0.8764235, 0.9135807, 1, 0, 0.2588235, 1,
1.746525, 0.9997755, 1.082692, 1, 0, 0.2509804, 1,
1.764935, 0.2263122, 0.5991783, 1, 0, 0.2470588, 1,
1.772839, 0.04619791, 3.280593, 1, 0, 0.2392157, 1,
1.773047, 0.4597191, 0.5284812, 1, 0, 0.2352941, 1,
1.776889, -0.1775424, 2.036527, 1, 0, 0.227451, 1,
1.794303, -0.4451988, 0.2779468, 1, 0, 0.2235294, 1,
1.832383, 0.7883648, 0.6470941, 1, 0, 0.2156863, 1,
1.848191, 0.3246356, 2.706937, 1, 0, 0.2117647, 1,
1.85254, 0.4044543, 0.3583395, 1, 0, 0.2039216, 1,
1.891693, -0.3766249, 2.3719, 1, 0, 0.1960784, 1,
1.919914, -1.367657, 2.187325, 1, 0, 0.1921569, 1,
1.93574, -1.193221, 1.354866, 1, 0, 0.1843137, 1,
1.937225, 1.136103, -0.6373079, 1, 0, 0.1803922, 1,
1.943353, 1.120896, 0.6913072, 1, 0, 0.172549, 1,
1.946059, 0.9884351, 0.4638179, 1, 0, 0.1686275, 1,
1.966366, -2.190108, 1.331858, 1, 0, 0.1607843, 1,
1.976471, 0.06652061, 0.8781801, 1, 0, 0.1568628, 1,
1.980849, 0.5320381, 1.414644, 1, 0, 0.1490196, 1,
2.021218, -0.007106823, 2.313279, 1, 0, 0.145098, 1,
2.029674, -0.9493934, 1.071151, 1, 0, 0.1372549, 1,
2.05308, 1.183713, -0.7044769, 1, 0, 0.1333333, 1,
2.089971, 1.043575, 1.764531, 1, 0, 0.1254902, 1,
2.127998, -0.256503, 1.821405, 1, 0, 0.1215686, 1,
2.140402, 1.265287, -0.01485853, 1, 0, 0.1137255, 1,
2.142223, -0.939, 3.944864, 1, 0, 0.1098039, 1,
2.176947, -0.9241568, 3.682823, 1, 0, 0.1019608, 1,
2.213099, -0.4309236, 1.903181, 1, 0, 0.09411765, 1,
2.264419, -0.4848278, 0.9944983, 1, 0, 0.09019608, 1,
2.27847, 0.496178, 1.668496, 1, 0, 0.08235294, 1,
2.32167, -0.3202168, 1.608568, 1, 0, 0.07843138, 1,
2.468548, -0.1718076, 3.498716, 1, 0, 0.07058824, 1,
2.492169, -0.1375729, 3.034782, 1, 0, 0.06666667, 1,
2.505104, 0.7956766, 1.24645, 1, 0, 0.05882353, 1,
2.512343, -2.510719, 2.876245, 1, 0, 0.05490196, 1,
2.680793, 1.184583, -1.141387, 1, 0, 0.04705882, 1,
2.880172, -1.371403, 2.508763, 1, 0, 0.04313726, 1,
2.895434, 1.274585, 2.12155, 1, 0, 0.03529412, 1,
3.017661, -0.2234654, 1.15951, 1, 0, 0.03137255, 1,
3.053656, 1.593125, 0.9031333, 1, 0, 0.02352941, 1,
3.344763, 0.8530022, 1.216062, 1, 0, 0.01960784, 1,
3.507008, -0.6061354, 3.017254, 1, 0, 0.01176471, 1,
3.845344, 0.4642454, 1.88515, 1, 0, 0.007843138, 1
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
0.2000122, -4.048777, -7.630407, 0, -0.5, 0.5, 0.5,
0.2000122, -4.048777, -7.630407, 1, -0.5, 0.5, 0.5,
0.2000122, -4.048777, -7.630407, 1, 1.5, 0.5, 0.5,
0.2000122, -4.048777, -7.630407, 0, 1.5, 0.5, 0.5
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
-4.681087, -0.02223325, -7.630407, 0, -0.5, 0.5, 0.5,
-4.681087, -0.02223325, -7.630407, 1, -0.5, 0.5, 0.5,
-4.681087, -0.02223325, -7.630407, 1, 1.5, 0.5, 0.5,
-4.681087, -0.02223325, -7.630407, 0, 1.5, 0.5, 0.5
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
-4.681087, -4.048777, -0.245692, 0, -0.5, 0.5, 0.5,
-4.681087, -4.048777, -0.245692, 1, -0.5, 0.5, 0.5,
-4.681087, -4.048777, -0.245692, 1, 1.5, 0.5, 0.5,
-4.681087, -4.048777, -0.245692, 0, 1.5, 0.5, 0.5
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
-2, -3.119575, -5.926242,
2, -3.119575, -5.926242,
-2, -3.119575, -5.926242,
-2, -3.274442, -6.210269,
0, -3.119575, -5.926242,
0, -3.274442, -6.210269,
2, -3.119575, -5.926242,
2, -3.274442, -6.210269
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
-2, -3.584176, -6.778324, 0, -0.5, 0.5, 0.5,
-2, -3.584176, -6.778324, 1, -0.5, 0.5, 0.5,
-2, -3.584176, -6.778324, 1, 1.5, 0.5, 0.5,
-2, -3.584176, -6.778324, 0, 1.5, 0.5, 0.5,
0, -3.584176, -6.778324, 0, -0.5, 0.5, 0.5,
0, -3.584176, -6.778324, 1, -0.5, 0.5, 0.5,
0, -3.584176, -6.778324, 1, 1.5, 0.5, 0.5,
0, -3.584176, -6.778324, 0, 1.5, 0.5, 0.5,
2, -3.584176, -6.778324, 0, -0.5, 0.5, 0.5,
2, -3.584176, -6.778324, 1, -0.5, 0.5, 0.5,
2, -3.584176, -6.778324, 1, 1.5, 0.5, 0.5,
2, -3.584176, -6.778324, 0, 1.5, 0.5, 0.5
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
-3.55468, -3, -5.926242,
-3.55468, 2, -5.926242,
-3.55468, -3, -5.926242,
-3.742414, -3, -6.210269,
-3.55468, -2, -5.926242,
-3.742414, -2, -6.210269,
-3.55468, -1, -5.926242,
-3.742414, -1, -6.210269,
-3.55468, 0, -5.926242,
-3.742414, 0, -6.210269,
-3.55468, 1, -5.926242,
-3.742414, 1, -6.210269,
-3.55468, 2, -5.926242,
-3.742414, 2, -6.210269
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
-4.117884, -3, -6.778324, 0, -0.5, 0.5, 0.5,
-4.117884, -3, -6.778324, 1, -0.5, 0.5, 0.5,
-4.117884, -3, -6.778324, 1, 1.5, 0.5, 0.5,
-4.117884, -3, -6.778324, 0, 1.5, 0.5, 0.5,
-4.117884, -2, -6.778324, 0, -0.5, 0.5, 0.5,
-4.117884, -2, -6.778324, 1, -0.5, 0.5, 0.5,
-4.117884, -2, -6.778324, 1, 1.5, 0.5, 0.5,
-4.117884, -2, -6.778324, 0, 1.5, 0.5, 0.5,
-4.117884, -1, -6.778324, 0, -0.5, 0.5, 0.5,
-4.117884, -1, -6.778324, 1, -0.5, 0.5, 0.5,
-4.117884, -1, -6.778324, 1, 1.5, 0.5, 0.5,
-4.117884, -1, -6.778324, 0, 1.5, 0.5, 0.5,
-4.117884, 0, -6.778324, 0, -0.5, 0.5, 0.5,
-4.117884, 0, -6.778324, 1, -0.5, 0.5, 0.5,
-4.117884, 0, -6.778324, 1, 1.5, 0.5, 0.5,
-4.117884, 0, -6.778324, 0, 1.5, 0.5, 0.5,
-4.117884, 1, -6.778324, 0, -0.5, 0.5, 0.5,
-4.117884, 1, -6.778324, 1, -0.5, 0.5, 0.5,
-4.117884, 1, -6.778324, 1, 1.5, 0.5, 0.5,
-4.117884, 1, -6.778324, 0, 1.5, 0.5, 0.5,
-4.117884, 2, -6.778324, 0, -0.5, 0.5, 0.5,
-4.117884, 2, -6.778324, 1, -0.5, 0.5, 0.5,
-4.117884, 2, -6.778324, 1, 1.5, 0.5, 0.5,
-4.117884, 2, -6.778324, 0, 1.5, 0.5, 0.5
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
-3.55468, -3.119575, -4,
-3.55468, -3.119575, 4,
-3.55468, -3.119575, -4,
-3.742414, -3.274442, -4,
-3.55468, -3.119575, -2,
-3.742414, -3.274442, -2,
-3.55468, -3.119575, 0,
-3.742414, -3.274442, 0,
-3.55468, -3.119575, 2,
-3.742414, -3.274442, 2,
-3.55468, -3.119575, 4,
-3.742414, -3.274442, 4
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
-4.117884, -3.584176, -4, 0, -0.5, 0.5, 0.5,
-4.117884, -3.584176, -4, 1, -0.5, 0.5, 0.5,
-4.117884, -3.584176, -4, 1, 1.5, 0.5, 0.5,
-4.117884, -3.584176, -4, 0, 1.5, 0.5, 0.5,
-4.117884, -3.584176, -2, 0, -0.5, 0.5, 0.5,
-4.117884, -3.584176, -2, 1, -0.5, 0.5, 0.5,
-4.117884, -3.584176, -2, 1, 1.5, 0.5, 0.5,
-4.117884, -3.584176, -2, 0, 1.5, 0.5, 0.5,
-4.117884, -3.584176, 0, 0, -0.5, 0.5, 0.5,
-4.117884, -3.584176, 0, 1, -0.5, 0.5, 0.5,
-4.117884, -3.584176, 0, 1, 1.5, 0.5, 0.5,
-4.117884, -3.584176, 0, 0, 1.5, 0.5, 0.5,
-4.117884, -3.584176, 2, 0, -0.5, 0.5, 0.5,
-4.117884, -3.584176, 2, 1, -0.5, 0.5, 0.5,
-4.117884, -3.584176, 2, 1, 1.5, 0.5, 0.5,
-4.117884, -3.584176, 2, 0, 1.5, 0.5, 0.5,
-4.117884, -3.584176, 4, 0, -0.5, 0.5, 0.5,
-4.117884, -3.584176, 4, 1, -0.5, 0.5, 0.5,
-4.117884, -3.584176, 4, 1, 1.5, 0.5, 0.5,
-4.117884, -3.584176, 4, 0, 1.5, 0.5, 0.5
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
-3.55468, -3.119575, -5.926242,
-3.55468, 3.075108, -5.926242,
-3.55468, -3.119575, 5.434858,
-3.55468, 3.075108, 5.434858,
-3.55468, -3.119575, -5.926242,
-3.55468, -3.119575, 5.434858,
-3.55468, 3.075108, -5.926242,
-3.55468, 3.075108, 5.434858,
-3.55468, -3.119575, -5.926242,
3.954704, -3.119575, -5.926242,
-3.55468, -3.119575, 5.434858,
3.954704, -3.119575, 5.434858,
-3.55468, 3.075108, -5.926242,
3.954704, 3.075108, -5.926242,
-3.55468, 3.075108, 5.434858,
3.954704, 3.075108, 5.434858,
3.954704, -3.119575, -5.926242,
3.954704, 3.075108, -5.926242,
3.954704, -3.119575, 5.434858,
3.954704, 3.075108, 5.434858,
3.954704, -3.119575, -5.926242,
3.954704, -3.119575, 5.434858,
3.954704, 3.075108, -5.926242,
3.954704, 3.075108, 5.434858
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
var radius = 7.989026;
var distance = 35.54408;
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
mvMatrix.translate( -0.2000122, 0.02223325, 0.245692 );
mvMatrix.scale( 1.15028, 1.394404, 0.7603042 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54408);
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
pyroquilon<-read.table("pyroquilon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyroquilon$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyroquilon' not found
```

```r
y<-pyroquilon$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyroquilon' not found
```

```r
z<-pyroquilon$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyroquilon' not found
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
-3.44532, -0.9711441, -1.795274, 0, 0, 1, 1, 1,
-3.016587, 1.34577, -2.004967, 1, 0, 0, 1, 1,
-2.83572, 0.3792824, -0.7502193, 1, 0, 0, 1, 1,
-2.777105, 1.411289, -1.056305, 1, 0, 0, 1, 1,
-2.714295, -0.7058563, -1.005508, 1, 0, 0, 1, 1,
-2.642939, -0.4308668, -1.81962, 1, 0, 0, 1, 1,
-2.624894, -0.7633446, -1.320038, 0, 0, 0, 1, 1,
-2.508913, 0.1829126, -1.075706, 0, 0, 0, 1, 1,
-2.491314, 1.011003, -1.959103, 0, 0, 0, 1, 1,
-2.415438, -0.3617775, -0.6951918, 0, 0, 0, 1, 1,
-2.333977, 2.143826, -0.6489291, 0, 0, 0, 1, 1,
-2.319629, 1.93429, -1.013313, 0, 0, 0, 1, 1,
-2.252392, -0.3645816, -2.853332, 0, 0, 0, 1, 1,
-2.21707, -1.552987, -0.1455972, 1, 1, 1, 1, 1,
-2.198421, 0.2133966, -0.7376074, 1, 1, 1, 1, 1,
-2.112633, -1.896626, -3.102885, 1, 1, 1, 1, 1,
-2.112452, 0.7641389, -0.5428809, 1, 1, 1, 1, 1,
-2.053292, -1.083564, -1.622783, 1, 1, 1, 1, 1,
-2.023574, -1.364106, -1.894174, 1, 1, 1, 1, 1,
-2.008846, -0.2433272, -1.041158, 1, 1, 1, 1, 1,
-2.004554, -0.903376, -1.102868, 1, 1, 1, 1, 1,
-1.956672, 0.1782884, 0.02488389, 1, 1, 1, 1, 1,
-1.953463, 0.6874434, -0.595185, 1, 1, 1, 1, 1,
-1.905038, -0.6585308, -0.3870089, 1, 1, 1, 1, 1,
-1.815705, 1.336637, 0.03065966, 1, 1, 1, 1, 1,
-1.811635, -0.7170458, -2.0947, 1, 1, 1, 1, 1,
-1.810845, -0.3541945, -3.84475, 1, 1, 1, 1, 1,
-1.809026, -0.3402938, -2.487103, 1, 1, 1, 1, 1,
-1.782439, 0.8005012, -0.732263, 0, 0, 1, 1, 1,
-1.737027, -0.2538528, -1.070212, 1, 0, 0, 1, 1,
-1.721245, -1.063002, -1.99229, 1, 0, 0, 1, 1,
-1.711799, 1.552768, -1.589455, 1, 0, 0, 1, 1,
-1.695141, 0.8682647, -1.045414, 1, 0, 0, 1, 1,
-1.688185, 1.255475, 0.2136994, 1, 0, 0, 1, 1,
-1.678579, 0.5413622, -1.121947, 0, 0, 0, 1, 1,
-1.675503, 0.1746659, -1.489617, 0, 0, 0, 1, 1,
-1.67518, -1.187125, -4.011612, 0, 0, 0, 1, 1,
-1.652121, -1.399382, -1.035986, 0, 0, 0, 1, 1,
-1.633943, 1.452372, 0.682251, 0, 0, 0, 1, 1,
-1.633211, -1.48068, -3.180773, 0, 0, 0, 1, 1,
-1.623723, 0.6337816, -1.16115, 0, 0, 0, 1, 1,
-1.615821, -0.5710131, -2.559627, 1, 1, 1, 1, 1,
-1.614814, 0.1419045, -1.726298, 1, 1, 1, 1, 1,
-1.610595, -0.992238, -2.477878, 1, 1, 1, 1, 1,
-1.601728, 0.5376137, -2.721588, 1, 1, 1, 1, 1,
-1.570753, 0.2598512, 1.671739, 1, 1, 1, 1, 1,
-1.549446, 1.021505, -1.455409, 1, 1, 1, 1, 1,
-1.528781, 1.017049, -0.5177947, 1, 1, 1, 1, 1,
-1.507308, -0.4871804, -1.436027, 1, 1, 1, 1, 1,
-1.502476, 0.3756941, -1.947327, 1, 1, 1, 1, 1,
-1.501882, 1.078269, -1.216807, 1, 1, 1, 1, 1,
-1.493494, -0.535866, 0.1452155, 1, 1, 1, 1, 1,
-1.487203, 1.231772, -0.5435935, 1, 1, 1, 1, 1,
-1.472161, 1.668886, 0.3797986, 1, 1, 1, 1, 1,
-1.45864, -1.979947, -1.469522, 1, 1, 1, 1, 1,
-1.453161, -0.8826398, -3.305476, 1, 1, 1, 1, 1,
-1.431417, 1.29059, -1.396438, 0, 0, 1, 1, 1,
-1.427307, 0.3931368, -0.3824457, 1, 0, 0, 1, 1,
-1.423411, -1.039546, -2.447852, 1, 0, 0, 1, 1,
-1.421391, 1.251004, -0.1124952, 1, 0, 0, 1, 1,
-1.404012, 0.1337024, -1.254936, 1, 0, 0, 1, 1,
-1.395746, 0.8965607, -1.632428, 1, 0, 0, 1, 1,
-1.393901, -0.5517663, -3.077769, 0, 0, 0, 1, 1,
-1.385748, -1.207134, -1.071678, 0, 0, 0, 1, 1,
-1.374599, -1.195758, -1.076139, 0, 0, 0, 1, 1,
-1.36843, -0.9343432, -1.708629, 0, 0, 0, 1, 1,
-1.362397, -1.25406, -2.102858, 0, 0, 0, 1, 1,
-1.36172, 0.192825, -1.553326, 0, 0, 0, 1, 1,
-1.361014, 1.963805, -0.8891904, 0, 0, 0, 1, 1,
-1.359364, -0.03950326, -2.346255, 1, 1, 1, 1, 1,
-1.356527, 2.27105, 0.5695066, 1, 1, 1, 1, 1,
-1.351383, -1.090858, -2.712046, 1, 1, 1, 1, 1,
-1.345923, -0.06931994, -2.007473, 1, 1, 1, 1, 1,
-1.33477, 0.1087725, -2.91643, 1, 1, 1, 1, 1,
-1.319053, -0.2447066, -1.342409, 1, 1, 1, 1, 1,
-1.31897, -0.01235922, -1.762028, 1, 1, 1, 1, 1,
-1.318116, 0.5106482, 0.3714515, 1, 1, 1, 1, 1,
-1.316636, -0.06797673, -3.445927, 1, 1, 1, 1, 1,
-1.306496, 1.733151, 1.227948, 1, 1, 1, 1, 1,
-1.303467, -1.846894, -0.912438, 1, 1, 1, 1, 1,
-1.303324, 0.8956645, -3.329719, 1, 1, 1, 1, 1,
-1.299269, 0.818137, 0.6134822, 1, 1, 1, 1, 1,
-1.280276, 0.7962303, -1.552327, 1, 1, 1, 1, 1,
-1.275875, 0.8781642, -0.9797775, 1, 1, 1, 1, 1,
-1.275153, 0.7670586, -0.3809974, 0, 0, 1, 1, 1,
-1.273618, -0.08030748, -1.581442, 1, 0, 0, 1, 1,
-1.269688, -1.233953, -2.238817, 1, 0, 0, 1, 1,
-1.269267, 0.04287439, -1.282859, 1, 0, 0, 1, 1,
-1.265986, 0.2392266, -0.1174243, 1, 0, 0, 1, 1,
-1.255579, -0.473401, -0.2639943, 1, 0, 0, 1, 1,
-1.254019, -1.510193, -2.515677, 0, 0, 0, 1, 1,
-1.250809, -0.5405179, -3.381626, 0, 0, 0, 1, 1,
-1.239596, -1.435106, -2.456257, 0, 0, 0, 1, 1,
-1.238169, 0.00465121, -1.789279, 0, 0, 0, 1, 1,
-1.236658, -0.439793, -1.213914, 0, 0, 0, 1, 1,
-1.233266, -0.04563531, -3.224261, 0, 0, 0, 1, 1,
-1.232373, -0.1913659, -3.35515, 0, 0, 0, 1, 1,
-1.230788, 0.458468, -2.042088, 1, 1, 1, 1, 1,
-1.227066, -1.493118, -2.728675, 1, 1, 1, 1, 1,
-1.224039, 0.2089895, -1.816313, 1, 1, 1, 1, 1,
-1.218861, -0.1395385, -0.7747992, 1, 1, 1, 1, 1,
-1.214937, -0.1396854, 0.3269376, 1, 1, 1, 1, 1,
-1.211033, 1.031802, -1.586997, 1, 1, 1, 1, 1,
-1.192181, -0.2359607, -1.411677, 1, 1, 1, 1, 1,
-1.191936, 0.01592698, -2.445822, 1, 1, 1, 1, 1,
-1.186645, -0.1683666, -2.028814, 1, 1, 1, 1, 1,
-1.185875, -0.4849445, -2.447977, 1, 1, 1, 1, 1,
-1.184239, -0.7501097, -2.168911, 1, 1, 1, 1, 1,
-1.184221, 0.5326192, -0.6446058, 1, 1, 1, 1, 1,
-1.179621, -0.8308342, -1.875322, 1, 1, 1, 1, 1,
-1.171099, -0.6484856, -1.364549, 1, 1, 1, 1, 1,
-1.164501, 0.04999321, -1.451005, 1, 1, 1, 1, 1,
-1.162418, -0.6771694, -3.152045, 0, 0, 1, 1, 1,
-1.155573, 0.3088082, -1.793626, 1, 0, 0, 1, 1,
-1.134829, 1.562672, -0.7689125, 1, 0, 0, 1, 1,
-1.129727, -0.03807271, -1.052486, 1, 0, 0, 1, 1,
-1.127774, 0.7437527, 0.7192192, 1, 0, 0, 1, 1,
-1.127412, -0.2678706, -1.457114, 1, 0, 0, 1, 1,
-1.127196, -1.250479, -2.824971, 0, 0, 0, 1, 1,
-1.121806, -0.9749306, -2.132141, 0, 0, 0, 1, 1,
-1.106372, -0.6158602, -2.471374, 0, 0, 0, 1, 1,
-1.105375, 1.438371, -0.2092184, 0, 0, 0, 1, 1,
-1.102584, 0.9821916, -0.9661862, 0, 0, 0, 1, 1,
-1.102166, -2.574558, -2.464864, 0, 0, 0, 1, 1,
-1.095062, -1.107138, -3.496558, 0, 0, 0, 1, 1,
-1.094006, 1.297181, 1.473469, 1, 1, 1, 1, 1,
-1.093273, 0.3097527, -0.3915971, 1, 1, 1, 1, 1,
-1.091815, -0.6322115, -1.821592, 1, 1, 1, 1, 1,
-1.090201, 0.2782546, 0.1402571, 1, 1, 1, 1, 1,
-1.081354, -1.512052, -4.221389, 1, 1, 1, 1, 1,
-1.071194, -0.1210074, -1.189008, 1, 1, 1, 1, 1,
-1.06888, 0.2572054, -1.422747, 1, 1, 1, 1, 1,
-1.06065, 0.6376662, -2.240639, 1, 1, 1, 1, 1,
-1.049185, -0.06767906, -1.402446, 1, 1, 1, 1, 1,
-1.039817, 1.971519, -1.154041, 1, 1, 1, 1, 1,
-1.038229, -0.4553985, -0.9712468, 1, 1, 1, 1, 1,
-1.036564, 1.105396, -1.301252, 1, 1, 1, 1, 1,
-1.035915, -0.8882716, -1.568107, 1, 1, 1, 1, 1,
-1.035475, 0.7263271, -1.463928, 1, 1, 1, 1, 1,
-1.03398, -0.4302332, 0.07049213, 1, 1, 1, 1, 1,
-1.033407, 0.9517955, 0.1002408, 0, 0, 1, 1, 1,
-1.031481, 0.2181306, -1.547145, 1, 0, 0, 1, 1,
-1.029625, 0.06596228, -2.774593, 1, 0, 0, 1, 1,
-1.027335, 0.5311783, -1.521027, 1, 0, 0, 1, 1,
-1.027039, 0.5362412, -0.9262626, 1, 0, 0, 1, 1,
-1.024096, 0.1395907, -1.876604, 1, 0, 0, 1, 1,
-1.022788, -2.190152, -1.070387, 0, 0, 0, 1, 1,
-1.022355, -1.372545, -3.275372, 0, 0, 0, 1, 1,
-1.020913, -0.267303, -0.7429138, 0, 0, 0, 1, 1,
-1.014461, 0.6636547, -0.6658058, 0, 0, 0, 1, 1,
-1.012514, -1.484437, -2.469715, 0, 0, 0, 1, 1,
-1.009049, -0.3825353, -1.034064, 0, 0, 0, 1, 1,
-1.005042, -0.4234741, -3.409968, 0, 0, 0, 1, 1,
-0.9989055, 1.006856, 1.016243, 1, 1, 1, 1, 1,
-0.9986256, 0.3162046, -0.3900947, 1, 1, 1, 1, 1,
-0.9962811, -0.1311954, -0.5441972, 1, 1, 1, 1, 1,
-0.9962513, -0.4777819, -1.751083, 1, 1, 1, 1, 1,
-0.9960675, 0.5706037, -0.2900596, 1, 1, 1, 1, 1,
-0.9906117, 1.430509, -1.646346, 1, 1, 1, 1, 1,
-0.9848487, 1.604112, -0.397604, 1, 1, 1, 1, 1,
-0.9836175, -0.4365719, -2.769068, 1, 1, 1, 1, 1,
-0.9728523, -0.5143577, -2.209844, 1, 1, 1, 1, 1,
-0.9726132, -0.4380357, -1.871298, 1, 1, 1, 1, 1,
-0.9695405, 0.521445, -2.58677, 1, 1, 1, 1, 1,
-0.9662143, -0.0334925, -2.834161, 1, 1, 1, 1, 1,
-0.962926, -0.5245618, -3.065735, 1, 1, 1, 1, 1,
-0.9559012, 1.927722, 1.086543, 1, 1, 1, 1, 1,
-0.950433, -0.2895092, -1.392119, 1, 1, 1, 1, 1,
-0.9375561, 0.5254957, 0.01098778, 0, 0, 1, 1, 1,
-0.9313804, -2.664217, -2.357866, 1, 0, 0, 1, 1,
-0.9267699, 0.009782358, 0.6596867, 1, 0, 0, 1, 1,
-0.9237295, -1.877963, -1.921841, 1, 0, 0, 1, 1,
-0.9221915, -0.4096843, -1.854345, 1, 0, 0, 1, 1,
-0.9159923, -1.039328, -2.408153, 1, 0, 0, 1, 1,
-0.9152573, -0.4235281, -1.459718, 0, 0, 0, 1, 1,
-0.9120711, -0.3367737, -1.138183, 0, 0, 0, 1, 1,
-0.9023846, -0.6139333, -3.61134, 0, 0, 0, 1, 1,
-0.8919392, 0.1212851, -2.708613, 0, 0, 0, 1, 1,
-0.8884398, -0.2503155, -1.960815, 0, 0, 0, 1, 1,
-0.8839589, -1.077976, -3.085181, 0, 0, 0, 1, 1,
-0.8738262, 1.029173, -0.08379331, 0, 0, 0, 1, 1,
-0.87119, -0.02655837, -1.805554, 1, 1, 1, 1, 1,
-0.8692907, -0.4805636, -3.750027, 1, 1, 1, 1, 1,
-0.8633749, -0.8611235, -1.663017, 1, 1, 1, 1, 1,
-0.8614589, 0.2645768, -1.947449, 1, 1, 1, 1, 1,
-0.8592549, 0.2559398, 0.0389776, 1, 1, 1, 1, 1,
-0.8585809, -1.4521, -3.66089, 1, 1, 1, 1, 1,
-0.8502527, -0.2885849, -3.241356, 1, 1, 1, 1, 1,
-0.8491014, -0.5283067, -1.905399, 1, 1, 1, 1, 1,
-0.8429515, 1.000165, -1.1036, 1, 1, 1, 1, 1,
-0.8287195, -0.5583398, -3.204443, 1, 1, 1, 1, 1,
-0.8272722, -0.6248485, -1.945048, 1, 1, 1, 1, 1,
-0.8235817, 0.3915909, -0.9000446, 1, 1, 1, 1, 1,
-0.8235368, -0.6641403, -0.1011028, 1, 1, 1, 1, 1,
-0.8224561, -1.135702, -3.807094, 1, 1, 1, 1, 1,
-0.818, 1.313824, -0.5033478, 1, 1, 1, 1, 1,
-0.8172055, 0.8428292, -1.548738, 0, 0, 1, 1, 1,
-0.8008694, 0.2578269, -1.854274, 1, 0, 0, 1, 1,
-0.8002406, -0.5753849, -2.868778, 1, 0, 0, 1, 1,
-0.7996076, 1.641561, -1.135022, 1, 0, 0, 1, 1,
-0.798858, 1.374598, -0.3978772, 1, 0, 0, 1, 1,
-0.7967371, -0.3362069, -2.135885, 1, 0, 0, 1, 1,
-0.7862239, -1.044602, -2.378805, 0, 0, 0, 1, 1,
-0.7838973, 0.6459707, -0.4740309, 0, 0, 0, 1, 1,
-0.7836973, -0.8255931, -2.277606, 0, 0, 0, 1, 1,
-0.7809973, -0.5306144, -1.747445, 0, 0, 0, 1, 1,
-0.7790173, -3.029361, -1.442752, 0, 0, 0, 1, 1,
-0.7677227, -0.1258834, -2.262003, 0, 0, 0, 1, 1,
-0.7675669, -0.03667726, -1.38301, 0, 0, 0, 1, 1,
-0.7665767, 1.279345, -1.731969, 1, 1, 1, 1, 1,
-0.7564087, -0.2903971, -0.4204572, 1, 1, 1, 1, 1,
-0.7549964, -1.153053, -2.947058, 1, 1, 1, 1, 1,
-0.7535149, 0.6186919, -1.212501, 1, 1, 1, 1, 1,
-0.7498099, 0.1927479, -1.193661, 1, 1, 1, 1, 1,
-0.7428722, -0.7921247, -2.449998, 1, 1, 1, 1, 1,
-0.7394803, -0.1568798, 0.04741313, 1, 1, 1, 1, 1,
-0.738089, 0.05542197, -0.5871283, 1, 1, 1, 1, 1,
-0.732092, -1.606214, -3.613351, 1, 1, 1, 1, 1,
-0.7318516, -0.4683583, -2.487136, 1, 1, 1, 1, 1,
-0.7242016, -0.08835164, -2.904572, 1, 1, 1, 1, 1,
-0.7241793, -1.271627, -2.408319, 1, 1, 1, 1, 1,
-0.7216866, 0.9112514, 0.1672627, 1, 1, 1, 1, 1,
-0.717337, 0.6910083, -2.891844, 1, 1, 1, 1, 1,
-0.7172609, 0.187798, -2.885433, 1, 1, 1, 1, 1,
-0.7155941, 0.9301735, -1.434271, 0, 0, 1, 1, 1,
-0.713549, -1.040325, -5.342349, 1, 0, 0, 1, 1,
-0.7091539, -0.06743956, -1.193834, 1, 0, 0, 1, 1,
-0.708747, -0.2049419, -2.838753, 1, 0, 0, 1, 1,
-0.7056822, 0.4021556, -0.18169, 1, 0, 0, 1, 1,
-0.7011405, 1.342167, 0.2108511, 1, 0, 0, 1, 1,
-0.6952817, 0.7548476, -1.604818, 0, 0, 0, 1, 1,
-0.6951483, 0.3716041, -2.063437, 0, 0, 0, 1, 1,
-0.6945279, -0.4249341, -2.247415, 0, 0, 0, 1, 1,
-0.6900896, 0.03086513, 0.4157939, 0, 0, 0, 1, 1,
-0.6899028, -0.3585858, 0.05329367, 0, 0, 0, 1, 1,
-0.688461, -0.1557154, -0.714729, 0, 0, 0, 1, 1,
-0.6879265, -0.8674095, -3.095533, 0, 0, 0, 1, 1,
-0.6864793, 1.01602, -0.7909657, 1, 1, 1, 1, 1,
-0.683931, 0.2322914, -1.293564, 1, 1, 1, 1, 1,
-0.6807627, 0.4248759, -1.666844, 1, 1, 1, 1, 1,
-0.6660261, 1.387655, 0.1733647, 1, 1, 1, 1, 1,
-0.6648066, 0.2641866, -0.3571702, 1, 1, 1, 1, 1,
-0.6621606, 0.7535677, -0.5558005, 1, 1, 1, 1, 1,
-0.6603329, -1.093569, -4.181673, 1, 1, 1, 1, 1,
-0.6553217, 1.535905, -0.2419582, 1, 1, 1, 1, 1,
-0.6505168, -0.7217748, -2.443718, 1, 1, 1, 1, 1,
-0.6479104, 1.931454, 0.6445501, 1, 1, 1, 1, 1,
-0.646561, 1.939945, -0.4874685, 1, 1, 1, 1, 1,
-0.6430157, -0.725497, -0.3664365, 1, 1, 1, 1, 1,
-0.6410382, 0.6447519, -1.484205, 1, 1, 1, 1, 1,
-0.6381686, 1.164468, -0.6277235, 1, 1, 1, 1, 1,
-0.6325691, -0.1165321, -1.800317, 1, 1, 1, 1, 1,
-0.6294807, -0.1021236, -1.147879, 0, 0, 1, 1, 1,
-0.6262417, -0.5757313, -2.435426, 1, 0, 0, 1, 1,
-0.6162868, -1.348424, -4.224129, 1, 0, 0, 1, 1,
-0.6096454, -1.612052, -4.745284, 1, 0, 0, 1, 1,
-0.6085405, -0.330297, -0.8090851, 1, 0, 0, 1, 1,
-0.6073902, 0.4067655, -0.6768001, 1, 0, 0, 1, 1,
-0.6072022, -0.2569164, -1.889632, 0, 0, 0, 1, 1,
-0.6055924, 0.9596413, -0.2845403, 0, 0, 0, 1, 1,
-0.6019194, -0.6476592, -2.660146, 0, 0, 0, 1, 1,
-0.5979114, -0.4444863, -1.877628, 0, 0, 0, 1, 1,
-0.5861887, 0.3099557, -0.5376436, 0, 0, 0, 1, 1,
-0.5846414, -0.02102017, -2.649751, 0, 0, 0, 1, 1,
-0.5841, 0.1565343, -2.50158, 0, 0, 0, 1, 1,
-0.5801553, 0.9127453, -1.990917, 1, 1, 1, 1, 1,
-0.5771095, -0.7972997, -0.551442, 1, 1, 1, 1, 1,
-0.5763626, 0.8897673, -0.5046493, 1, 1, 1, 1, 1,
-0.5760952, -0.5094997, -1.517704, 1, 1, 1, 1, 1,
-0.5671238, -0.7204755, -2.249795, 1, 1, 1, 1, 1,
-0.5607272, 1.300408, -0.3283318, 1, 1, 1, 1, 1,
-0.555541, -1.136808, -0.8883697, 1, 1, 1, 1, 1,
-0.5525984, 0.7090398, -1.741909, 1, 1, 1, 1, 1,
-0.5517181, -0.324218, -1.89212, 1, 1, 1, 1, 1,
-0.550181, -0.5253783, -2.734833, 1, 1, 1, 1, 1,
-0.5499386, 0.8193786, -0.9517221, 1, 1, 1, 1, 1,
-0.5489857, -1.305462, -3.373981, 1, 1, 1, 1, 1,
-0.5437759, 2.507969, -0.07299688, 1, 1, 1, 1, 1,
-0.5380247, 0.06551779, 0.09896675, 1, 1, 1, 1, 1,
-0.5363468, -1.131982, -4.602418, 1, 1, 1, 1, 1,
-0.5296633, -0.9777703, -2.509598, 0, 0, 1, 1, 1,
-0.5182041, -1.641634, -1.47868, 1, 0, 0, 1, 1,
-0.5156471, -0.256496, -3.626177, 1, 0, 0, 1, 1,
-0.5150185, 1.358748, -0.4681105, 1, 0, 0, 1, 1,
-0.5123983, -0.2118026, -4.046654, 1, 0, 0, 1, 1,
-0.5086015, 0.07793076, -0.7388831, 1, 0, 0, 1, 1,
-0.503837, -0.390443, -2.681321, 0, 0, 0, 1, 1,
-0.4967851, -0.9068533, -3.100456, 0, 0, 0, 1, 1,
-0.4947771, -0.2694558, -1.543822, 0, 0, 0, 1, 1,
-0.4940617, 0.4444329, 0.3256328, 0, 0, 0, 1, 1,
-0.4928569, -0.8149282, -2.005207, 0, 0, 0, 1, 1,
-0.4926557, -0.1800653, -2.665415, 0, 0, 0, 1, 1,
-0.4836967, 0.4504514, -0.7952895, 0, 0, 0, 1, 1,
-0.4801884, -1.2092, -4.305516, 1, 1, 1, 1, 1,
-0.4795801, -0.7829935, -2.522538, 1, 1, 1, 1, 1,
-0.4788025, -0.3342334, -2.097788, 1, 1, 1, 1, 1,
-0.4784473, -0.4409071, -1.851598, 1, 1, 1, 1, 1,
-0.4718279, -0.3928612, -0.7874459, 1, 1, 1, 1, 1,
-0.4710699, 2.386737, -0.2495439, 1, 1, 1, 1, 1,
-0.468238, 1.423072, -1.080206, 1, 1, 1, 1, 1,
-0.4669938, -0.8951287, -2.972247, 1, 1, 1, 1, 1,
-0.4657391, -0.8121464, -3.692519, 1, 1, 1, 1, 1,
-0.4615771, 0.8544044, -0.005345195, 1, 1, 1, 1, 1,
-0.4615581, -1.028267, -1.928354, 1, 1, 1, 1, 1,
-0.4575745, 0.1279351, -0.624426, 1, 1, 1, 1, 1,
-0.4573924, -0.2657926, -2.303431, 1, 1, 1, 1, 1,
-0.4562929, -0.5593535, -2.828817, 1, 1, 1, 1, 1,
-0.4506972, 0.2809388, -1.242525, 1, 1, 1, 1, 1,
-0.4486873, 1.486998, -0.115826, 0, 0, 1, 1, 1,
-0.4485596, -1.805056, -2.787348, 1, 0, 0, 1, 1,
-0.4458113, -0.3457547, -1.475782, 1, 0, 0, 1, 1,
-0.4420791, -2.343287, -3.125632, 1, 0, 0, 1, 1,
-0.440656, -0.2067551, -1.671992, 1, 0, 0, 1, 1,
-0.4403954, 1.113292, -0.2054994, 1, 0, 0, 1, 1,
-0.4390951, -0.5248861, -2.463539, 0, 0, 0, 1, 1,
-0.4386129, 1.710845, -1.91267, 0, 0, 0, 1, 1,
-0.4377424, -0.4322902, -0.1362292, 0, 0, 0, 1, 1,
-0.4355989, 0.6205904, -1.554612, 0, 0, 0, 1, 1,
-0.4320911, -1.019199, -1.635406, 0, 0, 0, 1, 1,
-0.4313409, -0.7580736, -0.820056, 0, 0, 0, 1, 1,
-0.4289826, 0.308065, -1.299827, 0, 0, 0, 1, 1,
-0.4278218, 2.353062, -1.03746, 1, 1, 1, 1, 1,
-0.4199833, -0.2471579, -0.5643294, 1, 1, 1, 1, 1,
-0.4084495, 0.8412338, 0.6802462, 1, 1, 1, 1, 1,
-0.4051543, -0.738075, -2.08357, 1, 1, 1, 1, 1,
-0.4043187, -0.5198184, -3.011292, 1, 1, 1, 1, 1,
-0.4040122, 0.9277077, -0.06926706, 1, 1, 1, 1, 1,
-0.3989108, -0.08371942, -2.367799, 1, 1, 1, 1, 1,
-0.3933331, 1.242985, -0.2861784, 1, 1, 1, 1, 1,
-0.3858264, 0.4393615, -0.8574482, 1, 1, 1, 1, 1,
-0.3848611, 0.0681578, -2.457693, 1, 1, 1, 1, 1,
-0.3831514, -0.5031421, -2.726188, 1, 1, 1, 1, 1,
-0.3831053, -0.696802, -2.787971, 1, 1, 1, 1, 1,
-0.3823307, 0.06000628, -1.136426, 1, 1, 1, 1, 1,
-0.3805361, -0.05644845, -4.021217, 1, 1, 1, 1, 1,
-0.3777217, 2.802719, 0.003328589, 1, 1, 1, 1, 1,
-0.3759813, 0.9893358, 0.1689241, 0, 0, 1, 1, 1,
-0.3722861, 0.3463905, -1.062732, 1, 0, 0, 1, 1,
-0.3712251, -0.04256457, -1.25394, 1, 0, 0, 1, 1,
-0.3685327, 0.2580985, 0.2256036, 1, 0, 0, 1, 1,
-0.3669353, -0.3789491, -2.836592, 1, 0, 0, 1, 1,
-0.3667846, 0.2279109, -0.1438881, 1, 0, 0, 1, 1,
-0.3628357, 1.057809, 0.401371, 0, 0, 0, 1, 1,
-0.3596022, -1.430508, -2.171089, 0, 0, 0, 1, 1,
-0.3586511, -0.4075335, -2.206527, 0, 0, 0, 1, 1,
-0.3578557, 0.1650423, -0.7322096, 0, 0, 0, 1, 1,
-0.3552901, 1.620935, -1.742182, 0, 0, 0, 1, 1,
-0.3532023, -0.6394722, -1.465811, 0, 0, 0, 1, 1,
-0.3489093, 0.4516665, -1.300085, 0, 0, 0, 1, 1,
-0.3469709, -0.5969874, -2.416015, 1, 1, 1, 1, 1,
-0.342138, -1.078144, -2.428276, 1, 1, 1, 1, 1,
-0.3397267, 1.768541, -0.4427298, 1, 1, 1, 1, 1,
-0.3364355, -0.8805831, -1.817588, 1, 1, 1, 1, 1,
-0.3344196, -0.9603541, -2.810523, 1, 1, 1, 1, 1,
-0.3333303, 1.45792, 1.280547, 1, 1, 1, 1, 1,
-0.3284129, 0.5398899, 0.4369797, 1, 1, 1, 1, 1,
-0.3178819, 0.1247236, -0.09717048, 1, 1, 1, 1, 1,
-0.3177165, -0.6829984, -2.347727, 1, 1, 1, 1, 1,
-0.3176405, 1.830232, -0.02613817, 1, 1, 1, 1, 1,
-0.3107355, -1.496451, -4.491804, 1, 1, 1, 1, 1,
-0.3072661, 1.234388, -2.211184, 1, 1, 1, 1, 1,
-0.3052576, -0.5758377, -3.823822, 1, 1, 1, 1, 1,
-0.3011027, -0.09042024, -1.52133, 1, 1, 1, 1, 1,
-0.2938661, 0.5255212, -0.2176783, 1, 1, 1, 1, 1,
-0.2938482, -0.3799678, -1.577936, 0, 0, 1, 1, 1,
-0.2899806, -0.441318, -1.828008, 1, 0, 0, 1, 1,
-0.2885088, 1.921252, 1.010899, 1, 0, 0, 1, 1,
-0.2881216, -0.8574868, -2.122782, 1, 0, 0, 1, 1,
-0.2870336, -0.4229568, -2.822681, 1, 0, 0, 1, 1,
-0.2864015, 0.4003696, -2.670156, 1, 0, 0, 1, 1,
-0.2856228, 0.8024383, 1.213522, 0, 0, 0, 1, 1,
-0.2850267, 0.2720368, -1.977607, 0, 0, 0, 1, 1,
-0.2842574, -0.5822521, -3.534786, 0, 0, 0, 1, 1,
-0.2755787, 0.7024198, -2.085035, 0, 0, 0, 1, 1,
-0.2706807, 1.194716, 0.7723848, 0, 0, 0, 1, 1,
-0.2705948, -2.849645, -4.240825, 0, 0, 0, 1, 1,
-0.2697279, -0.1314012, -2.900017, 0, 0, 0, 1, 1,
-0.2693897, 0.6358895, -0.1263763, 1, 1, 1, 1, 1,
-0.2671025, 1.05488, 0.6982873, 1, 1, 1, 1, 1,
-0.2662352, -0.1964679, -4.244857, 1, 1, 1, 1, 1,
-0.265457, 0.3303022, -3.003192, 1, 1, 1, 1, 1,
-0.2653299, -0.4676507, -0.5517831, 1, 1, 1, 1, 1,
-0.2650559, -1.135406, -1.020345, 1, 1, 1, 1, 1,
-0.2555415, -0.9326741, -0.5444285, 1, 1, 1, 1, 1,
-0.2536946, 0.8248742, -0.3293189, 1, 1, 1, 1, 1,
-0.25017, -0.6931605, -3.086317, 1, 1, 1, 1, 1,
-0.2492425, 0.7609367, 1.722262, 1, 1, 1, 1, 1,
-0.2467006, 1.199625, 0.5259598, 1, 1, 1, 1, 1,
-0.2429812, 0.905532, -0.07501624, 1, 1, 1, 1, 1,
-0.2429652, -0.01033462, -0.2470278, 1, 1, 1, 1, 1,
-0.2412697, 1.611477, -1.391687, 1, 1, 1, 1, 1,
-0.2399809, -0.7085199, -4.766303, 1, 1, 1, 1, 1,
-0.2395188, 0.4725444, -0.1190398, 0, 0, 1, 1, 1,
-0.2350144, -0.4935713, -3.691513, 1, 0, 0, 1, 1,
-0.2347732, -0.3181138, -4.863544, 1, 0, 0, 1, 1,
-0.2343545, 0.610569, -0.8316048, 1, 0, 0, 1, 1,
-0.2312128, -0.447217, -3.305432, 1, 0, 0, 1, 1,
-0.2266939, -1.186512, -1.928286, 1, 0, 0, 1, 1,
-0.2240934, 1.347772, 0.4105506, 0, 0, 0, 1, 1,
-0.2236118, 1.399576, -0.6328321, 0, 0, 0, 1, 1,
-0.2179473, -0.3935597, -2.034703, 0, 0, 0, 1, 1,
-0.2141763, -0.3257025, -2.304683, 0, 0, 0, 1, 1,
-0.2122026, 0.483437, -0.327693, 0, 0, 0, 1, 1,
-0.2085403, -0.1658393, -3.148221, 0, 0, 0, 1, 1,
-0.2079872, -1.247648, -4.140175, 0, 0, 0, 1, 1,
-0.2073569, -0.974629, -2.306094, 1, 1, 1, 1, 1,
-0.2041385, 0.8946945, 0.3344449, 1, 1, 1, 1, 1,
-0.203947, 0.02277881, -1.727902, 1, 1, 1, 1, 1,
-0.1953552, 0.1448239, 0.03315516, 1, 1, 1, 1, 1,
-0.1949768, -0.2400834, -1.218194, 1, 1, 1, 1, 1,
-0.1928537, -1.363207, -2.935424, 1, 1, 1, 1, 1,
-0.1911616, -0.4024955, -2.119539, 1, 1, 1, 1, 1,
-0.1884732, 0.4586046, 0.001497561, 1, 1, 1, 1, 1,
-0.1857563, -1.364568, -1.290777, 1, 1, 1, 1, 1,
-0.1835399, -0.0338368, -1.942112, 1, 1, 1, 1, 1,
-0.1829121, -0.0680826, -0.4562051, 1, 1, 1, 1, 1,
-0.1823254, 0.2007533, 1.03246, 1, 1, 1, 1, 1,
-0.1809157, -1.104904, -2.659507, 1, 1, 1, 1, 1,
-0.1796085, 1.369937, -1.159358, 1, 1, 1, 1, 1,
-0.1789395, 0.7599983, 0.03477361, 1, 1, 1, 1, 1,
-0.1778582, 1.365578, 1.081372, 0, 0, 1, 1, 1,
-0.1732881, 0.8093762, 1.742393, 1, 0, 0, 1, 1,
-0.1686978, 1.495266, 1.279938, 1, 0, 0, 1, 1,
-0.1674152, 0.417322, -1.187163, 1, 0, 0, 1, 1,
-0.1609963, 0.9506696, 0.0738702, 1, 0, 0, 1, 1,
-0.1572118, -0.1692258, -2.473452, 1, 0, 0, 1, 1,
-0.1515085, -0.7461574, -2.970442, 0, 0, 0, 1, 1,
-0.1460544, -0.8283263, -1.869738, 0, 0, 0, 1, 1,
-0.1418975, 2.382161, -0.5437834, 0, 0, 0, 1, 1,
-0.1389356, 0.2646856, 0.5081922, 0, 0, 0, 1, 1,
-0.1379936, -1.669384, -2.781845, 0, 0, 0, 1, 1,
-0.1378628, -0.177843, -1.054795, 0, 0, 0, 1, 1,
-0.1370859, -0.3596318, -5.619418, 0, 0, 0, 1, 1,
-0.1337058, -0.5248705, -2.429028, 1, 1, 1, 1, 1,
-0.1322407, -0.1217797, -2.950006, 1, 1, 1, 1, 1,
-0.1280973, -0.405676, -1.724916, 1, 1, 1, 1, 1,
-0.1270552, -0.6819661, -1.811777, 1, 1, 1, 1, 1,
-0.1255893, -0.05014026, -2.655113, 1, 1, 1, 1, 1,
-0.1243463, 0.589031, -0.2441738, 1, 1, 1, 1, 1,
-0.1242359, -0.8046877, -3.894255, 1, 1, 1, 1, 1,
-0.1197388, 0.2307036, -0.9029336, 1, 1, 1, 1, 1,
-0.1169404, 0.01822352, -1.091495, 1, 1, 1, 1, 1,
-0.1082495, 0.3954064, -2.041078, 1, 1, 1, 1, 1,
-0.1073846, 0.913644, 0.1234167, 1, 1, 1, 1, 1,
-0.1058048, 1.158825, -0.1055349, 1, 1, 1, 1, 1,
-0.1042977, 0.2637527, -0.8293878, 1, 1, 1, 1, 1,
-0.1018913, -1.272374, -2.610354, 1, 1, 1, 1, 1,
-0.101716, -0.5864058, -3.125939, 1, 1, 1, 1, 1,
-0.0950738, 0.342118, 0.09672993, 0, 0, 1, 1, 1,
-0.08744016, 0.2210925, -0.8690424, 1, 0, 0, 1, 1,
-0.08707786, -1.607142, -2.986445, 1, 0, 0, 1, 1,
-0.08571157, -0.8649633, -2.856448, 1, 0, 0, 1, 1,
-0.08026343, 0.8014652, -2.069638, 1, 0, 0, 1, 1,
-0.07496659, 0.7430869, 0.7393783, 1, 0, 0, 1, 1,
-0.07128727, 0.8998291, 0.9677051, 0, 0, 0, 1, 1,
-0.0698622, 0.6272889, 0.8285623, 0, 0, 0, 1, 1,
-0.06676318, 0.6350755, 1.077219, 0, 0, 0, 1, 1,
-0.06604563, 0.5178677, -1.023474, 0, 0, 0, 1, 1,
-0.06577356, -0.8882102, -2.093966, 0, 0, 0, 1, 1,
-0.06570706, -1.426541, -2.96789, 0, 0, 0, 1, 1,
-0.06521096, 0.5359403, 0.8668375, 0, 0, 0, 1, 1,
-0.06466433, 0.5503293, 0.7387034, 1, 1, 1, 1, 1,
-0.06429517, 1.312445, 0.710187, 1, 1, 1, 1, 1,
-0.05860923, -0.6660848, -2.391735, 1, 1, 1, 1, 1,
-0.05685522, 0.8590773, 1.054973, 1, 1, 1, 1, 1,
-0.05341316, 1.260957, 0.3960518, 1, 1, 1, 1, 1,
-0.05234372, -0.9160581, -3.498229, 1, 1, 1, 1, 1,
-0.0491005, 1.914494, -0.6288645, 1, 1, 1, 1, 1,
-0.04804239, 0.4841794, -0.5371419, 1, 1, 1, 1, 1,
-0.03843814, -0.1622173, -3.405771, 1, 1, 1, 1, 1,
-0.03809412, 0.4760693, 0.2835159, 1, 1, 1, 1, 1,
-0.03746813, 0.04090641, -1.475448, 1, 1, 1, 1, 1,
-0.02470504, 0.1824097, 0.1109863, 1, 1, 1, 1, 1,
-0.02467536, -1.085608, -3.44428, 1, 1, 1, 1, 1,
-0.02420093, -0.6069372, -3.852123, 1, 1, 1, 1, 1,
-0.01112071, -0.5931463, -2.779296, 1, 1, 1, 1, 1,
-0.01078078, -0.694882, -5.760789, 0, 0, 1, 1, 1,
-0.008628132, 1.417385, 0.8302504, 1, 0, 0, 1, 1,
-0.003873136, 0.6912564, -0.5356326, 1, 0, 0, 1, 1,
-0.001199139, -0.5209179, -5.639103, 1, 0, 0, 1, 1,
0.003604378, 2.618214, -0.7460297, 1, 0, 0, 1, 1,
0.004179604, -1.8842, 0.8676314, 1, 0, 0, 1, 1,
0.005353887, 0.9090478, 1.338912, 0, 0, 0, 1, 1,
0.008013743, 0.205752, 1.739911, 0, 0, 0, 1, 1,
0.01120989, 0.09746699, 0.7068184, 0, 0, 0, 1, 1,
0.01183896, 0.4529478, 0.5587247, 0, 0, 0, 1, 1,
0.01254251, -0.3160686, 3.722939, 0, 0, 0, 1, 1,
0.01303262, -0.2823179, 5.134458, 0, 0, 0, 1, 1,
0.01615222, 0.6406682, -0.07905029, 0, 0, 0, 1, 1,
0.01865404, 0.4712067, 1.120292, 1, 1, 1, 1, 1,
0.02527509, 0.8231112, 0.1589615, 1, 1, 1, 1, 1,
0.02834443, -1.134627, 1.480812, 1, 1, 1, 1, 1,
0.02943019, 0.3052279, 0.8472903, 1, 1, 1, 1, 1,
0.02985684, -0.1291306, 2.551274, 1, 1, 1, 1, 1,
0.03462692, 1.907279, -0.4352014, 1, 1, 1, 1, 1,
0.03480795, -0.4359624, 1.650164, 1, 1, 1, 1, 1,
0.03579319, -1.904405, 3.506617, 1, 1, 1, 1, 1,
0.03630287, 1.327141, -0.9999455, 1, 1, 1, 1, 1,
0.03714873, -0.7235491, 4.301898, 1, 1, 1, 1, 1,
0.0390019, 0.06615175, 1.596223, 1, 1, 1, 1, 1,
0.04170758, 0.4740917, -0.007573721, 1, 1, 1, 1, 1,
0.04691499, -0.07327607, 3.480143, 1, 1, 1, 1, 1,
0.05504012, 0.4563838, 1.515584, 1, 1, 1, 1, 1,
0.06474672, 1.258497, -0.562911, 1, 1, 1, 1, 1,
0.07478736, 1.340042, -1.139547, 0, 0, 1, 1, 1,
0.07585727, 2.018426, -1.970527, 1, 0, 0, 1, 1,
0.07753382, 0.5976458, -0.4872958, 1, 0, 0, 1, 1,
0.07933336, 0.5880851, 0.4918827, 1, 0, 0, 1, 1,
0.07938945, 0.1883473, -0.9533631, 1, 0, 0, 1, 1,
0.07976785, 0.3718545, -0.6874389, 1, 0, 0, 1, 1,
0.08098815, 1.089993, -1.763499, 0, 0, 0, 1, 1,
0.08428622, 0.002908792, 1.861273, 0, 0, 0, 1, 1,
0.08522934, 0.4613186, 0.6300189, 0, 0, 0, 1, 1,
0.08607497, -0.2212913, 3.340129, 0, 0, 0, 1, 1,
0.09079143, -1.13249, 2.497951, 0, 0, 0, 1, 1,
0.09557436, 0.3376788, 1.345832, 0, 0, 0, 1, 1,
0.09570596, 2.465486, 1.262535, 0, 0, 0, 1, 1,
0.09596694, 1.85267, -0.7114434, 1, 1, 1, 1, 1,
0.09697339, 0.2454085, -0.6618208, 1, 1, 1, 1, 1,
0.1042243, -1.042056, 1.861673, 1, 1, 1, 1, 1,
0.1046053, 0.722993, 0.8178508, 1, 1, 1, 1, 1,
0.1073534, 0.07734556, 0.4653291, 1, 1, 1, 1, 1,
0.1154741, -0.3016239, 3.281028, 1, 1, 1, 1, 1,
0.1160925, -0.6119428, 2.935293, 1, 1, 1, 1, 1,
0.1170792, -0.7521579, 3.93013, 1, 1, 1, 1, 1,
0.1177577, -0.7176507, 2.721445, 1, 1, 1, 1, 1,
0.1181729, -0.5981023, 2.511826, 1, 1, 1, 1, 1,
0.1234433, -1.02732, 3.593086, 1, 1, 1, 1, 1,
0.1280322, -0.9473168, 3.359941, 1, 1, 1, 1, 1,
0.1281285, -0.01158944, 1.142094, 1, 1, 1, 1, 1,
0.1332294, 0.6808895, -0.03968786, 1, 1, 1, 1, 1,
0.1334742, -0.2709458, 3.889266, 1, 1, 1, 1, 1,
0.1334801, -0.3023328, 5.269405, 0, 0, 1, 1, 1,
0.1371151, -0.1130285, 1.359636, 1, 0, 0, 1, 1,
0.1371556, 0.8709986, 0.04496934, 1, 0, 0, 1, 1,
0.1420071, 1.505942, 1.04008, 1, 0, 0, 1, 1,
0.1432397, -0.9085225, 2.376742, 1, 0, 0, 1, 1,
0.1441255, 0.5763438, -0.4098023, 1, 0, 0, 1, 1,
0.1479099, -0.9421051, 1.094697, 0, 0, 0, 1, 1,
0.149739, 1.237537, -0.233187, 0, 0, 0, 1, 1,
0.1515708, -0.2813318, 1.180906, 0, 0, 0, 1, 1,
0.1546514, -0.5213986, 2.778501, 0, 0, 0, 1, 1,
0.1636835, -1.116929, 1.723259, 0, 0, 0, 1, 1,
0.1651849, 0.9409467, 0.9588188, 0, 0, 0, 1, 1,
0.1665443, -1.474991, 3.819086, 0, 0, 0, 1, 1,
0.1673695, 1.226507, 0.7182251, 1, 1, 1, 1, 1,
0.1705363, 2.979581, 0.7000081, 1, 1, 1, 1, 1,
0.1707029, -0.1853601, 1.373615, 1, 1, 1, 1, 1,
0.1713599, 0.7524275, 1.208758, 1, 1, 1, 1, 1,
0.1737151, 1.439442, -1.116392, 1, 1, 1, 1, 1,
0.1743311, -0.1063029, 3.709815, 1, 1, 1, 1, 1,
0.1753014, 1.107404, 1.378219, 1, 1, 1, 1, 1,
0.1763788, -0.107999, 2.302186, 1, 1, 1, 1, 1,
0.1765882, 0.2761462, 0.4123731, 1, 1, 1, 1, 1,
0.1771829, 0.2899523, 0.006317274, 1, 1, 1, 1, 1,
0.1792865, 0.06578042, 1.588573, 1, 1, 1, 1, 1,
0.1821711, -0.01189001, 1.374473, 1, 1, 1, 1, 1,
0.1832204, 0.3360965, 0.7491622, 1, 1, 1, 1, 1,
0.1832238, 0.1191784, 1.713581, 1, 1, 1, 1, 1,
0.1832819, 0.1769564, 0.9686087, 1, 1, 1, 1, 1,
0.1835684, -0.7525414, 1.047916, 0, 0, 1, 1, 1,
0.184495, 1.31517, -0.1512416, 1, 0, 0, 1, 1,
0.1884639, 0.4834949, 1.403605, 1, 0, 0, 1, 1,
0.1899188, -2.194554, 3.702101, 1, 0, 0, 1, 1,
0.1912999, -0.7073792, 1.718928, 1, 0, 0, 1, 1,
0.1960637, -0.8470141, 3.01739, 1, 0, 0, 1, 1,
0.2001643, -1.295936, 2.727875, 0, 0, 0, 1, 1,
0.2025533, -0.9320247, 4.205569, 0, 0, 0, 1, 1,
0.2045847, 0.1589996, 0.6287799, 0, 0, 0, 1, 1,
0.2057706, -0.3784652, 4.235404, 0, 0, 0, 1, 1,
0.2064092, 0.1554626, 1.936282, 0, 0, 0, 1, 1,
0.2069015, 1.300359, -0.7297416, 0, 0, 0, 1, 1,
0.2101806, -1.923472, 3.572746, 0, 0, 0, 1, 1,
0.2115055, -0.4345537, 2.527139, 1, 1, 1, 1, 1,
0.2141616, -1.20962, 2.214004, 1, 1, 1, 1, 1,
0.2162402, -0.2910962, 5.011318, 1, 1, 1, 1, 1,
0.2191044, 1.527924, 0.6971219, 1, 1, 1, 1, 1,
0.222873, 0.8643233, -0.4993832, 1, 1, 1, 1, 1,
0.2266724, 1.471076, 0.644636, 1, 1, 1, 1, 1,
0.2268015, 0.02069041, 1.665408, 1, 1, 1, 1, 1,
0.2346501, -0.9123833, 1.467438, 1, 1, 1, 1, 1,
0.238955, -0.06649722, 1.277187, 1, 1, 1, 1, 1,
0.2395323, 0.08770363, 2.42137, 1, 1, 1, 1, 1,
0.2501934, -0.05943846, 3.374036, 1, 1, 1, 1, 1,
0.2516026, -0.5848265, 1.829369, 1, 1, 1, 1, 1,
0.2538139, -0.7479028, 2.707481, 1, 1, 1, 1, 1,
0.2542304, -0.0138343, 0.9736006, 1, 1, 1, 1, 1,
0.2578584, -1.412951, 1.916189, 1, 1, 1, 1, 1,
0.2657181, -0.9997188, 2.861268, 0, 0, 1, 1, 1,
0.266323, -0.2488156, 1.120721, 1, 0, 0, 1, 1,
0.2739418, 0.6239663, 0.5463115, 1, 0, 0, 1, 1,
0.2753679, 0.93956, 1.252955, 1, 0, 0, 1, 1,
0.2784095, 0.891599, -0.4054971, 1, 0, 0, 1, 1,
0.278641, -1.720266, 2.970814, 1, 0, 0, 1, 1,
0.2814872, -0.1818884, 3.796086, 0, 0, 0, 1, 1,
0.2855721, 1.248455, 0.1037456, 0, 0, 0, 1, 1,
0.2895505, 0.6780934, 1.723112, 0, 0, 0, 1, 1,
0.291878, 0.4067708, -1.54398, 0, 0, 0, 1, 1,
0.2995391, -0.2257463, 1.766182, 0, 0, 0, 1, 1,
0.300026, 1.344707, -0.7796111, 0, 0, 0, 1, 1,
0.3001748, 1.198053, 0.794868, 0, 0, 0, 1, 1,
0.3019794, 1.91599, 0.9829929, 1, 1, 1, 1, 1,
0.3061006, 1.064038, 1.219163, 1, 1, 1, 1, 1,
0.3061437, 0.6644582, -0.3753221, 1, 1, 1, 1, 1,
0.3093266, -0.3485089, 0.5057004, 1, 1, 1, 1, 1,
0.3094936, 0.1454315, 0.9202343, 1, 1, 1, 1, 1,
0.3117209, 0.4459645, 0.09581647, 1, 1, 1, 1, 1,
0.3220825, 0.3589399, -0.5339974, 1, 1, 1, 1, 1,
0.3225575, -0.08236795, 1.518155, 1, 1, 1, 1, 1,
0.3230294, -1.138779, 1.715406, 1, 1, 1, 1, 1,
0.3262952, -0.5214181, 2.488155, 1, 1, 1, 1, 1,
0.3271513, -0.7488959, 3.571416, 1, 1, 1, 1, 1,
0.3311748, 1.289044, 0.145715, 1, 1, 1, 1, 1,
0.3412014, 1.083246, -0.286593, 1, 1, 1, 1, 1,
0.341879, 1.429268, 0.6936973, 1, 1, 1, 1, 1,
0.3424142, 0.7134476, 1.733256, 1, 1, 1, 1, 1,
0.3434052, 1.072308, 1.096743, 0, 0, 1, 1, 1,
0.3468055, 0.7867002, -0.2160062, 1, 0, 0, 1, 1,
0.3482813, -0.4971703, 2.919297, 1, 0, 0, 1, 1,
0.3489764, -0.9004527, 4.111421, 1, 0, 0, 1, 1,
0.350756, 0.6067352, 0.9770604, 1, 0, 0, 1, 1,
0.3537832, -1.023947, 1.786055, 1, 0, 0, 1, 1,
0.3541248, 0.9082066, -1.869086, 0, 0, 0, 1, 1,
0.3543756, -0.8567196, 2.414754, 0, 0, 0, 1, 1,
0.3552942, 1.197576, 0.8650692, 0, 0, 0, 1, 1,
0.3565294, -0.7875337, 3.322866, 0, 0, 0, 1, 1,
0.3592218, -0.3354981, 2.934633, 0, 0, 0, 1, 1,
0.3607981, 0.3153971, 1.012073, 0, 0, 0, 1, 1,
0.3610794, 0.4449071, -1.293659, 0, 0, 0, 1, 1,
0.3627512, -0.02620837, 1.438308, 1, 1, 1, 1, 1,
0.3637229, -0.5442302, 3.326724, 1, 1, 1, 1, 1,
0.3639683, 0.112036, 0.2208176, 1, 1, 1, 1, 1,
0.3649853, 0.4695397, 0.3239829, 1, 1, 1, 1, 1,
0.3689875, -2.048054, 3.651131, 1, 1, 1, 1, 1,
0.3704989, 1.616231, 1.13807, 1, 1, 1, 1, 1,
0.3801026, -0.7947097, 3.403194, 1, 1, 1, 1, 1,
0.3866156, -1.69561, 1.152761, 1, 1, 1, 1, 1,
0.388109, 1.084262, 0.3417905, 1, 1, 1, 1, 1,
0.3885963, 0.7324699, 0.332068, 1, 1, 1, 1, 1,
0.3898482, -0.6905658, 1.649927, 1, 1, 1, 1, 1,
0.391838, -0.502651, 0.4085673, 1, 1, 1, 1, 1,
0.3935969, -0.8681604, 1.712197, 1, 1, 1, 1, 1,
0.3946629, 0.2848126, 2.145267, 1, 1, 1, 1, 1,
0.3985319, -0.4921766, 2.658448, 1, 1, 1, 1, 1,
0.3995311, 1.660746, 0.8618979, 0, 0, 1, 1, 1,
0.401006, 0.1389796, 1.084108, 1, 0, 0, 1, 1,
0.4018309, 0.8636245, -0.7785761, 1, 0, 0, 1, 1,
0.4036272, -0.2070897, 3.377602, 1, 0, 0, 1, 1,
0.4062528, -1.116061, 2.52327, 1, 0, 0, 1, 1,
0.4086823, 0.4055845, -1.038369, 1, 0, 0, 1, 1,
0.4099549, 1.733391, 0.3670839, 0, 0, 0, 1, 1,
0.4112389, 0.6996149, 1.862291, 0, 0, 0, 1, 1,
0.4119159, 0.008787932, 1.464546, 0, 0, 0, 1, 1,
0.4145532, 1.045954, -0.03169551, 0, 0, 0, 1, 1,
0.4173696, -0.9772097, 2.04242, 0, 0, 0, 1, 1,
0.4182884, -1.022788, 3.022053, 0, 0, 0, 1, 1,
0.4252179, -1.352126, 2.719082, 0, 0, 0, 1, 1,
0.4278871, -0.5678396, 4.390854, 1, 1, 1, 1, 1,
0.4284287, -1.294904, 3.32182, 1, 1, 1, 1, 1,
0.4296855, -0.8208231, 1.297812, 1, 1, 1, 1, 1,
0.4388911, -0.009534483, 1.497276, 1, 1, 1, 1, 1,
0.439228, -0.7442825, 2.209242, 1, 1, 1, 1, 1,
0.4394168, -0.2979203, 1.353116, 1, 1, 1, 1, 1,
0.4427257, -0.2634666, 1.473642, 1, 1, 1, 1, 1,
0.446166, 1.455717, 0.5324798, 1, 1, 1, 1, 1,
0.4465445, -0.8601776, 1.381491, 1, 1, 1, 1, 1,
0.4509541, 0.03667818, -0.09501144, 1, 1, 1, 1, 1,
0.4539155, 0.1073858, 1.020563, 1, 1, 1, 1, 1,
0.4540542, -0.2756314, 1.674024, 1, 1, 1, 1, 1,
0.4574018, 0.6383326, 0.7134811, 1, 1, 1, 1, 1,
0.4627301, 1.029985, -0.3327849, 1, 1, 1, 1, 1,
0.4654881, 0.2549755, -1.002605, 1, 1, 1, 1, 1,
0.4657857, -0.5904506, 2.743414, 0, 0, 1, 1, 1,
0.4665141, -0.2552846, -0.7488421, 1, 0, 0, 1, 1,
0.4707247, 1.675921, 0.8090015, 1, 0, 0, 1, 1,
0.471774, -0.08014622, 2.336977, 1, 0, 0, 1, 1,
0.476624, -0.6581087, 2.593425, 1, 0, 0, 1, 1,
0.4793478, -0.1197065, 2.244882, 1, 0, 0, 1, 1,
0.4793656, 0.30748, 0.9162348, 0, 0, 0, 1, 1,
0.4827847, 1.088592, 0.1692517, 0, 0, 0, 1, 1,
0.4840766, -0.4945752, 1.592176, 0, 0, 0, 1, 1,
0.4907878, 0.2674634, 2.213023, 0, 0, 0, 1, 1,
0.4918372, 0.6985907, -0.6819049, 0, 0, 0, 1, 1,
0.4973499, -0.05986414, 1.759543, 0, 0, 0, 1, 1,
0.4984671, 0.7871183, -1.133858, 0, 0, 0, 1, 1,
0.5012683, 1.26319, 0.5617144, 1, 1, 1, 1, 1,
0.5017411, 0.3734715, 1.339151, 1, 1, 1, 1, 1,
0.5052897, 0.9175956, 2.077686, 1, 1, 1, 1, 1,
0.5066882, -0.1140391, 0.1110994, 1, 1, 1, 1, 1,
0.5071701, -1.509875, 1.969868, 1, 1, 1, 1, 1,
0.5089372, 0.4009929, 2.426677, 1, 1, 1, 1, 1,
0.5129228, -0.0992799, 0.2021435, 1, 1, 1, 1, 1,
0.5146942, -0.1764882, 1.58679, 1, 1, 1, 1, 1,
0.5155309, 0.8740046, 0.3217273, 1, 1, 1, 1, 1,
0.516533, 0.236419, 0.7587801, 1, 1, 1, 1, 1,
0.5252009, 1.909367, -0.412879, 1, 1, 1, 1, 1,
0.5265754, -0.4441533, 1.721744, 1, 1, 1, 1, 1,
0.5287465, -0.2127741, 2.24132, 1, 1, 1, 1, 1,
0.5333686, 1.998156, -1.99864, 1, 1, 1, 1, 1,
0.5368341, 0.1693427, 0.5334957, 1, 1, 1, 1, 1,
0.5402237, 2.424487, 2.242047, 0, 0, 1, 1, 1,
0.5410412, -0.5102278, 5.001688, 1, 0, 0, 1, 1,
0.5438634, 0.2975855, 2.376335, 1, 0, 0, 1, 1,
0.5448039, 0.02206206, 2.218091, 1, 0, 0, 1, 1,
0.5513436, -1.547651, 3.384261, 1, 0, 0, 1, 1,
0.5601409, -0.1877924, 1.726253, 1, 0, 0, 1, 1,
0.5605844, -0.7248464, 2.187826, 0, 0, 0, 1, 1,
0.561027, 1.667089, 1.802258, 0, 0, 0, 1, 1,
0.5655661, -0.4595007, 2.939232, 0, 0, 0, 1, 1,
0.5694814, 1.679569, -1.268608, 0, 0, 0, 1, 1,
0.5718756, -1.300446, 2.07556, 0, 0, 0, 1, 1,
0.5782564, 0.3943756, 1.574264, 0, 0, 0, 1, 1,
0.5868242, 0.3671191, 1.088473, 0, 0, 0, 1, 1,
0.5882217, -1.229722, 4.729432, 1, 1, 1, 1, 1,
0.5900719, -1.112095, 2.214502, 1, 1, 1, 1, 1,
0.5931686, 1.421115, 1.031297, 1, 1, 1, 1, 1,
0.5934827, 0.2614023, 0.706837, 1, 1, 1, 1, 1,
0.5944036, -1.044888, 1.933847, 1, 1, 1, 1, 1,
0.596137, 0.7538892, -0.5441347, 1, 1, 1, 1, 1,
0.597632, -0.0252765, 2.246791, 1, 1, 1, 1, 1,
0.5997561, -1.023567, 2.061495, 1, 1, 1, 1, 1,
0.6003103, -1.089583, 2.3469, 1, 1, 1, 1, 1,
0.6003969, 0.8450836, 1.745803, 1, 1, 1, 1, 1,
0.605138, -1.962189, 2.203003, 1, 1, 1, 1, 1,
0.6134303, -0.5562122, 2.913742, 1, 1, 1, 1, 1,
0.6143181, 0.2089292, 1.364412, 1, 1, 1, 1, 1,
0.6146241, -0.457575, 3.304631, 1, 1, 1, 1, 1,
0.616923, -0.494186, 0.684823, 1, 1, 1, 1, 1,
0.619337, 0.9998751, -0.1300267, 0, 0, 1, 1, 1,
0.6195626, 0.1990936, 2.269861, 1, 0, 0, 1, 1,
0.6202393, -0.736005, 1.679398, 1, 0, 0, 1, 1,
0.6239341, 1.322436, 0.04977923, 1, 0, 0, 1, 1,
0.6270719, 0.4256609, 2.257274, 1, 0, 0, 1, 1,
0.6297251, -1.213005, 1.647766, 1, 0, 0, 1, 1,
0.6306987, 0.266767, 1.854696, 0, 0, 0, 1, 1,
0.633755, -1.272951, 2.826897, 0, 0, 0, 1, 1,
0.6387084, 0.6157175, -0.188987, 0, 0, 0, 1, 1,
0.6391125, -1.196632, 2.66886, 0, 0, 0, 1, 1,
0.6395101, -0.04603512, 1.276879, 0, 0, 0, 1, 1,
0.6406348, -0.8833401, 1.982598, 0, 0, 0, 1, 1,
0.6424733, 1.442479, 1.537561, 0, 0, 0, 1, 1,
0.6452034, 0.8608146, 1.515133, 1, 1, 1, 1, 1,
0.647949, 1.132878, 0.4765545, 1, 1, 1, 1, 1,
0.6500511, -0.9603922, 2.4768, 1, 1, 1, 1, 1,
0.6560489, -0.5753694, 1.780794, 1, 1, 1, 1, 1,
0.6562203, -1.160376, 2.990899, 1, 1, 1, 1, 1,
0.6591281, 0.2231087, 1.568411, 1, 1, 1, 1, 1,
0.666707, 0.2691544, -0.03641381, 1, 1, 1, 1, 1,
0.6680368, -0.6568039, 0.7885537, 1, 1, 1, 1, 1,
0.6682054, 0.6230863, 0.7341349, 1, 1, 1, 1, 1,
0.6713312, -0.283026, 2.206222, 1, 1, 1, 1, 1,
0.6804388, -0.3710496, 0.594664, 1, 1, 1, 1, 1,
0.689042, -0.9145658, 2.0344, 1, 1, 1, 1, 1,
0.6938192, -1.18298, 1.450189, 1, 1, 1, 1, 1,
0.6940287, 0.2972014, 0.9757719, 1, 1, 1, 1, 1,
0.707325, -0.3548641, 3.497549, 1, 1, 1, 1, 1,
0.7085196, -0.9251783, 2.409449, 0, 0, 1, 1, 1,
0.7119702, 0.7662503, -1.87925, 1, 0, 0, 1, 1,
0.7145876, 0.2301665, 1.538909, 1, 0, 0, 1, 1,
0.7146318, 2.984894, 0.8635508, 1, 0, 0, 1, 1,
0.716609, 0.3708257, 1.421097, 1, 0, 0, 1, 1,
0.7168224, 0.890667, 0.3299583, 1, 0, 0, 1, 1,
0.7253875, 0.725045, 1.240916, 0, 0, 0, 1, 1,
0.7314289, 1.118101, 1.540722, 0, 0, 0, 1, 1,
0.7323179, 0.7189202, 0.5208287, 0, 0, 0, 1, 1,
0.7324498, 0.5527429, 0.9285512, 0, 0, 0, 1, 1,
0.7386907, 1.420499, -0.4664081, 0, 0, 0, 1, 1,
0.7630369, 0.8467986, 0.9746497, 0, 0, 0, 1, 1,
0.7692811, -0.1103139, 1.527118, 0, 0, 0, 1, 1,
0.7718611, 0.7649158, 1.111894, 1, 1, 1, 1, 1,
0.7721779, 0.7303008, 0.6823283, 1, 1, 1, 1, 1,
0.7731553, -1.057589, 3.347813, 1, 1, 1, 1, 1,
0.7865396, 0.7844682, 2.550704, 1, 1, 1, 1, 1,
0.7877353, 0.08629183, 1.952665, 1, 1, 1, 1, 1,
0.7901843, -0.995446, 1.384615, 1, 1, 1, 1, 1,
0.7906656, -0.111325, 1.672992, 1, 1, 1, 1, 1,
0.791664, 0.1721704, 1.584143, 1, 1, 1, 1, 1,
0.7948394, 1.810946, 1.657995, 1, 1, 1, 1, 1,
0.7950404, 0.2432743, -0.3976556, 1, 1, 1, 1, 1,
0.7973488, -0.775608, 2.213079, 1, 1, 1, 1, 1,
0.8064461, 1.482108, 1.610058, 1, 1, 1, 1, 1,
0.807638, 1.583528, -3.014025, 1, 1, 1, 1, 1,
0.8130422, -0.7621789, 2.102909, 1, 1, 1, 1, 1,
0.8187507, 1.342568, -0.0784582, 1, 1, 1, 1, 1,
0.8201698, 0.2641134, 1.784584, 0, 0, 1, 1, 1,
0.8223726, 0.2228281, -0.8288997, 1, 0, 0, 1, 1,
0.8237988, -0.9808269, 2.813184, 1, 0, 0, 1, 1,
0.8240569, 0.6399728, 0.4610583, 1, 0, 0, 1, 1,
0.8246644, -1.116617, 3.249254, 1, 0, 0, 1, 1,
0.8279131, 1.637854, -0.4157609, 1, 0, 0, 1, 1,
0.8326729, 1.583817, 0.9305132, 0, 0, 0, 1, 1,
0.8427882, 1.327853, 0.04274024, 0, 0, 0, 1, 1,
0.8548017, 0.2039926, 2.567442, 0, 0, 0, 1, 1,
0.8602278, 0.1099611, 1.796579, 0, 0, 0, 1, 1,
0.8634521, 0.6605811, 0.5803542, 0, 0, 0, 1, 1,
0.8674552, 0.1323222, 0.5210475, 0, 0, 0, 1, 1,
0.8703014, -0.08441191, 1.779135, 0, 0, 0, 1, 1,
0.8746178, -1.147521, 1.49291, 1, 1, 1, 1, 1,
0.8768803, 0.9065425, 2.425386, 1, 1, 1, 1, 1,
0.8820766, 1.014794, 0.10852, 1, 1, 1, 1, 1,
0.896392, -0.562593, 3.634311, 1, 1, 1, 1, 1,
0.9064653, 0.2140966, 1.447057, 1, 1, 1, 1, 1,
0.9131964, -1.645388, 3.5486, 1, 1, 1, 1, 1,
0.9136906, -0.5675179, 0.8700261, 1, 1, 1, 1, 1,
0.9188365, 0.6964408, 0.6348045, 1, 1, 1, 1, 1,
0.9238911, -0.06228542, 2.449038, 1, 1, 1, 1, 1,
0.9247348, 1.197854, -1.677984, 1, 1, 1, 1, 1,
0.9282271, 0.8203883, 1.745391, 1, 1, 1, 1, 1,
0.9285175, -0.7047573, 3.287591, 1, 1, 1, 1, 1,
0.9306452, -0.4257205, 0.0735348, 1, 1, 1, 1, 1,
0.932734, 0.6497552, 0.2367919, 1, 1, 1, 1, 1,
0.9416564, -0.2746133, 2.121849, 1, 1, 1, 1, 1,
0.946519, -0.149054, 0.3930163, 0, 0, 1, 1, 1,
0.9470617, 2.458944, 0.9336081, 1, 0, 0, 1, 1,
0.9475251, 1.090527, 0.03565324, 1, 0, 0, 1, 1,
0.952814, -0.0881108, 3.322802, 1, 0, 0, 1, 1,
0.9608878, -1.297824, 3.227311, 1, 0, 0, 1, 1,
0.9654602, -2.172076, 2.377956, 1, 0, 0, 1, 1,
0.9698637, -1.102265, 1.807004, 0, 0, 0, 1, 1,
0.9741762, 1.597959, 0.6701627, 0, 0, 0, 1, 1,
0.9790919, -0.08244606, 1.560821, 0, 0, 0, 1, 1,
0.9844648, -0.5484974, 0.2461587, 0, 0, 0, 1, 1,
0.9950925, -0.1501857, 2.393895, 0, 0, 0, 1, 1,
0.9963096, 1.145639, -0.30181, 0, 0, 0, 1, 1,
0.9985859, 0.04640242, 1.769201, 0, 0, 0, 1, 1,
1.009791, 1.155975, 0.6090907, 1, 1, 1, 1, 1,
1.011493, -0.6293091, 3.020215, 1, 1, 1, 1, 1,
1.014494, 0.8559377, 0.2809224, 1, 1, 1, 1, 1,
1.017344, -0.1691641, 0.6728735, 1, 1, 1, 1, 1,
1.021995, 0.9042952, 1.298013, 1, 1, 1, 1, 1,
1.024034, 1.374928, 0.4196267, 1, 1, 1, 1, 1,
1.027005, 1.001109, -0.3238266, 1, 1, 1, 1, 1,
1.031094, 2.059957, 0.01661386, 1, 1, 1, 1, 1,
1.032027, 0.2591906, 1.496403, 1, 1, 1, 1, 1,
1.034816, -0.8524156, 4.362426, 1, 1, 1, 1, 1,
1.036885, 0.8757452, 2.09005, 1, 1, 1, 1, 1,
1.040426, -0.09073774, 1.005075, 1, 1, 1, 1, 1,
1.041788, 0.686444, 0.6649853, 1, 1, 1, 1, 1,
1.043455, -0.8239903, 2.491057, 1, 1, 1, 1, 1,
1.046072, -1.001107, 4.059556, 1, 1, 1, 1, 1,
1.046154, -1.912413, 2.421999, 0, 0, 1, 1, 1,
1.047336, 0.1993399, 2.822269, 1, 0, 0, 1, 1,
1.055149, -0.6014183, 2.789152, 1, 0, 0, 1, 1,
1.057834, -0.436561, 1.151615, 1, 0, 0, 1, 1,
1.058609, -0.2181413, 0.821858, 1, 0, 0, 1, 1,
1.061201, -0.473033, 3.13669, 1, 0, 0, 1, 1,
1.062224, 0.5610435, 1.429202, 0, 0, 0, 1, 1,
1.067145, 0.4098544, 1.779921, 0, 0, 0, 1, 1,
1.069709, 1.184122, 0.5367821, 0, 0, 0, 1, 1,
1.070463, -1.223067, 2.909496, 0, 0, 0, 1, 1,
1.072882, -1.521171, 2.848272, 0, 0, 0, 1, 1,
1.083532, 0.5091509, 1.071249, 0, 0, 0, 1, 1,
1.09212, -0.5005358, 0.2490532, 0, 0, 0, 1, 1,
1.097817, 0.8198715, 0.7414558, 1, 1, 1, 1, 1,
1.097926, -0.9000773, 4.795959, 1, 1, 1, 1, 1,
1.101733, -1.818358, 3.800953, 1, 1, 1, 1, 1,
1.104926, -2.27942, 2.373953, 1, 1, 1, 1, 1,
1.114028, -0.3429503, 2.376801, 1, 1, 1, 1, 1,
1.114587, 0.9661508, 2.437083, 1, 1, 1, 1, 1,
1.12273, -0.4053772, 0.9960768, 1, 1, 1, 1, 1,
1.126331, 0.06206346, 0.8480766, 1, 1, 1, 1, 1,
1.1302, 1.625239, 1.112176, 1, 1, 1, 1, 1,
1.130473, -0.7006112, 2.301681, 1, 1, 1, 1, 1,
1.134308, 0.1814629, 1.207161, 1, 1, 1, 1, 1,
1.135463, -2.024427, 1.794344, 1, 1, 1, 1, 1,
1.141955, 0.9934945, 1.773305, 1, 1, 1, 1, 1,
1.147399, -0.92876, 4.463474, 1, 1, 1, 1, 1,
1.152686, -1.408927, -0.1900046, 1, 1, 1, 1, 1,
1.160555, 0.5521152, 2.242033, 0, 0, 1, 1, 1,
1.160971, 0.1467472, 0.4568191, 1, 0, 0, 1, 1,
1.16343, -0.991319, 2.299368, 1, 0, 0, 1, 1,
1.163936, 1.275665, 1.007284, 1, 0, 0, 1, 1,
1.19519, -1.528504, 2.374928, 1, 0, 0, 1, 1,
1.209797, 1.060442, 0.2384261, 1, 0, 0, 1, 1,
1.211562, 0.2713212, 0.6990907, 0, 0, 0, 1, 1,
1.217951, -0.1036935, 0.8295046, 0, 0, 0, 1, 1,
1.229394, -0.307946, 1.659284, 0, 0, 0, 1, 1,
1.230252, -0.3989409, 2.174581, 0, 0, 0, 1, 1,
1.237049, -0.8896133, 3.171849, 0, 0, 0, 1, 1,
1.244328, -0.8772678, 1.788777, 0, 0, 0, 1, 1,
1.248371, 1.341239, -1.501195, 0, 0, 0, 1, 1,
1.252623, 1.811088, 1.050265, 1, 1, 1, 1, 1,
1.262163, -1.442719, 2.059654, 1, 1, 1, 1, 1,
1.263524, -0.9291289, 1.882224, 1, 1, 1, 1, 1,
1.275073, -0.8046786, 1.991235, 1, 1, 1, 1, 1,
1.277047, -0.541844, 1.784479, 1, 1, 1, 1, 1,
1.300637, -1.534869, 1.749932, 1, 1, 1, 1, 1,
1.308259, -1.016858, 1.193101, 1, 1, 1, 1, 1,
1.319314, -0.2548145, 1.340246, 1, 1, 1, 1, 1,
1.346483, -1.266188, 2.855269, 1, 1, 1, 1, 1,
1.347457, 0.07258829, 1.586269, 1, 1, 1, 1, 1,
1.35652, 0.5922091, 0.7990128, 1, 1, 1, 1, 1,
1.359064, 0.2206164, 0.9772366, 1, 1, 1, 1, 1,
1.371404, 0.09137748, 0.9580132, 1, 1, 1, 1, 1,
1.375274, 0.3140641, 2.136937, 1, 1, 1, 1, 1,
1.376087, -0.4146073, 3.178005, 1, 1, 1, 1, 1,
1.387398, -0.1242307, 1.671684, 0, 0, 1, 1, 1,
1.401225, -0.8737268, 2.317621, 1, 0, 0, 1, 1,
1.40248, 0.8681026, 1.724343, 1, 0, 0, 1, 1,
1.406227, -0.4893402, 2.385522, 1, 0, 0, 1, 1,
1.410801, -1.257285, 3.769266, 1, 0, 0, 1, 1,
1.412727, -1.59039, 2.220995, 1, 0, 0, 1, 1,
1.41424, 0.1087523, 0.8952259, 0, 0, 0, 1, 1,
1.414477, -0.05062113, 0.7245866, 0, 0, 0, 1, 1,
1.416181, -0.9828252, 2.219122, 0, 0, 0, 1, 1,
1.418413, -0.9962345, 0.5397465, 0, 0, 0, 1, 1,
1.422766, -0.3307097, 3.843253, 0, 0, 0, 1, 1,
1.424417, 0.3336, -0.3656731, 0, 0, 0, 1, 1,
1.428957, 0.2429119, 1.338923, 0, 0, 0, 1, 1,
1.434747, -1.195655, 0.07693404, 1, 1, 1, 1, 1,
1.437916, 0.613676, 1.579874, 1, 1, 1, 1, 1,
1.446632, -0.2061065, 1.560743, 1, 1, 1, 1, 1,
1.453358, 1.194178, 1.961263, 1, 1, 1, 1, 1,
1.463526, -0.380574, 0.8552738, 1, 1, 1, 1, 1,
1.46962, 0.2470994, 0.9037875, 1, 1, 1, 1, 1,
1.473066, 0.4938218, 1.799439, 1, 1, 1, 1, 1,
1.47412, -1.2408, 2.276766, 1, 1, 1, 1, 1,
1.478223, 2.467514, -0.2790516, 1, 1, 1, 1, 1,
1.508474, -2.101623, 2.284036, 1, 1, 1, 1, 1,
1.51034, -0.5109764, 1.442424, 1, 1, 1, 1, 1,
1.513721, -0.1518213, 2.232077, 1, 1, 1, 1, 1,
1.518223, -0.3713827, 1.597683, 1, 1, 1, 1, 1,
1.519243, -0.3513346, 3.588702, 1, 1, 1, 1, 1,
1.522564, 1.285112, 1.091121, 1, 1, 1, 1, 1,
1.522947, 1.237997, 0.4911751, 0, 0, 1, 1, 1,
1.524829, 0.5528494, 0.1431284, 1, 0, 0, 1, 1,
1.52605, -0.2735335, 0.5419567, 1, 0, 0, 1, 1,
1.52704, -0.625336, 3.884018, 1, 0, 0, 1, 1,
1.528549, -1.914118, 2.351714, 1, 0, 0, 1, 1,
1.534049, -0.7440924, 2.191755, 1, 0, 0, 1, 1,
1.534117, 0.9477192, 2.435176, 0, 0, 0, 1, 1,
1.535897, -1.557929, 2.917174, 0, 0, 0, 1, 1,
1.542228, 1.901526, 2.375452, 0, 0, 0, 1, 1,
1.553904, -0.3933136, 1.571647, 0, 0, 0, 1, 1,
1.558861, -1.008002, 0.9579698, 0, 0, 0, 1, 1,
1.568164, -1.767403, 3.951523, 0, 0, 0, 1, 1,
1.575055, -1.178597, 2.715359, 0, 0, 0, 1, 1,
1.589193, 2.046369, -0.3317431, 1, 1, 1, 1, 1,
1.596474, 1.056392, 0.5116334, 1, 1, 1, 1, 1,
1.599491, -0.6302498, 2.639806, 1, 1, 1, 1, 1,
1.601335, -2.235072, 3.594385, 1, 1, 1, 1, 1,
1.607043, -0.1942849, 0.7781928, 1, 1, 1, 1, 1,
1.607895, 1.321298, 0.8168498, 1, 1, 1, 1, 1,
1.610547, 0.6687222, 1.009411, 1, 1, 1, 1, 1,
1.616505, 0.2354635, 0.620805, 1, 1, 1, 1, 1,
1.640061, 0.2933446, 1.145284, 1, 1, 1, 1, 1,
1.647078, -0.3363101, 1.361588, 1, 1, 1, 1, 1,
1.647488, 0.6402399, 1.490499, 1, 1, 1, 1, 1,
1.670357, 0.9218751, 0.3444148, 1, 1, 1, 1, 1,
1.674328, 0.2254801, 1.341797, 1, 1, 1, 1, 1,
1.674648, 1.16304, 2.43198, 1, 1, 1, 1, 1,
1.684147, 1.511692, 1.633999, 1, 1, 1, 1, 1,
1.686113, 0.7545007, 2.603498, 0, 0, 1, 1, 1,
1.701819, 0.2332042, 1.937795, 1, 0, 0, 1, 1,
1.717242, -1.042065, 1.435057, 1, 0, 0, 1, 1,
1.720576, -0.6883739, 1.682969, 1, 0, 0, 1, 1,
1.722254, -1.080117, 0.9913375, 1, 0, 0, 1, 1,
1.728274, -0.8764235, 0.9135807, 1, 0, 0, 1, 1,
1.746525, 0.9997755, 1.082692, 0, 0, 0, 1, 1,
1.764935, 0.2263122, 0.5991783, 0, 0, 0, 1, 1,
1.772839, 0.04619791, 3.280593, 0, 0, 0, 1, 1,
1.773047, 0.4597191, 0.5284812, 0, 0, 0, 1, 1,
1.776889, -0.1775424, 2.036527, 0, 0, 0, 1, 1,
1.794303, -0.4451988, 0.2779468, 0, 0, 0, 1, 1,
1.832383, 0.7883648, 0.6470941, 0, 0, 0, 1, 1,
1.848191, 0.3246356, 2.706937, 1, 1, 1, 1, 1,
1.85254, 0.4044543, 0.3583395, 1, 1, 1, 1, 1,
1.891693, -0.3766249, 2.3719, 1, 1, 1, 1, 1,
1.919914, -1.367657, 2.187325, 1, 1, 1, 1, 1,
1.93574, -1.193221, 1.354866, 1, 1, 1, 1, 1,
1.937225, 1.136103, -0.6373079, 1, 1, 1, 1, 1,
1.943353, 1.120896, 0.6913072, 1, 1, 1, 1, 1,
1.946059, 0.9884351, 0.4638179, 1, 1, 1, 1, 1,
1.966366, -2.190108, 1.331858, 1, 1, 1, 1, 1,
1.976471, 0.06652061, 0.8781801, 1, 1, 1, 1, 1,
1.980849, 0.5320381, 1.414644, 1, 1, 1, 1, 1,
2.021218, -0.007106823, 2.313279, 1, 1, 1, 1, 1,
2.029674, -0.9493934, 1.071151, 1, 1, 1, 1, 1,
2.05308, 1.183713, -0.7044769, 1, 1, 1, 1, 1,
2.089971, 1.043575, 1.764531, 1, 1, 1, 1, 1,
2.127998, -0.256503, 1.821405, 0, 0, 1, 1, 1,
2.140402, 1.265287, -0.01485853, 1, 0, 0, 1, 1,
2.142223, -0.939, 3.944864, 1, 0, 0, 1, 1,
2.176947, -0.9241568, 3.682823, 1, 0, 0, 1, 1,
2.213099, -0.4309236, 1.903181, 1, 0, 0, 1, 1,
2.264419, -0.4848278, 0.9944983, 1, 0, 0, 1, 1,
2.27847, 0.496178, 1.668496, 0, 0, 0, 1, 1,
2.32167, -0.3202168, 1.608568, 0, 0, 0, 1, 1,
2.468548, -0.1718076, 3.498716, 0, 0, 0, 1, 1,
2.492169, -0.1375729, 3.034782, 0, 0, 0, 1, 1,
2.505104, 0.7956766, 1.24645, 0, 0, 0, 1, 1,
2.512343, -2.510719, 2.876245, 0, 0, 0, 1, 1,
2.680793, 1.184583, -1.141387, 0, 0, 0, 1, 1,
2.880172, -1.371403, 2.508763, 1, 1, 1, 1, 1,
2.895434, 1.274585, 2.12155, 1, 1, 1, 1, 1,
3.017661, -0.2234654, 1.15951, 1, 1, 1, 1, 1,
3.053656, 1.593125, 0.9031333, 1, 1, 1, 1, 1,
3.344763, 0.8530022, 1.216062, 1, 1, 1, 1, 1,
3.507008, -0.6061354, 3.017254, 1, 1, 1, 1, 1,
3.845344, 0.4642454, 1.88515, 1, 1, 1, 1, 1
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
var radius = 9.843781;
var distance = 34.57587;
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
mvMatrix.translate( -0.2000122, 0.02223325, 0.245692 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57587);
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
