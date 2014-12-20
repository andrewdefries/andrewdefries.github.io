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
-3.480392, -0.381737, -1.721166, 1, 0, 0, 1,
-3.329458, 1.511582, -1.016032, 1, 0.007843138, 0, 1,
-3.084316, 0.1666142, -0.9159535, 1, 0.01176471, 0, 1,
-2.850962, -2.021635, -2.407064, 1, 0.01960784, 0, 1,
-2.832182, 1.454025, -1.91869, 1, 0.02352941, 0, 1,
-2.63846, -2.427828, -3.175668, 1, 0.03137255, 0, 1,
-2.576391, -0.1455066, -0.8080066, 1, 0.03529412, 0, 1,
-2.417966, 0.6933277, -0.2338101, 1, 0.04313726, 0, 1,
-2.290108, -1.17352, -5.077806, 1, 0.04705882, 0, 1,
-2.248979, -0.07778779, -2.209563, 1, 0.05490196, 0, 1,
-2.23342, -1.007438, -2.16911, 1, 0.05882353, 0, 1,
-2.194425, -0.7982172, -3.616489, 1, 0.06666667, 0, 1,
-2.177068, -1.301963, -0.2623342, 1, 0.07058824, 0, 1,
-2.169395, -0.07173775, -0.3368068, 1, 0.07843138, 0, 1,
-2.146708, 0.8077312, -0.7651207, 1, 0.08235294, 0, 1,
-2.142782, -1.3033, -2.347427, 1, 0.09019608, 0, 1,
-2.097555, 1.860917, -1.109456, 1, 0.09411765, 0, 1,
-2.066743, -0.6847336, -3.195539, 1, 0.1019608, 0, 1,
-2.054015, 1.253905, -2.295749, 1, 0.1098039, 0, 1,
-2.016374, -0.1049766, -0.2368518, 1, 0.1137255, 0, 1,
-1.991318, 0.6726093, 0.1761134, 1, 0.1215686, 0, 1,
-1.980587, -1.21024, -2.224116, 1, 0.1254902, 0, 1,
-1.97403, -0.661796, -1.555025, 1, 0.1333333, 0, 1,
-1.971572, 0.911432, -2.185148, 1, 0.1372549, 0, 1,
-1.958366, 0.4205275, -1.693231, 1, 0.145098, 0, 1,
-1.956396, -0.2896489, -1.068445, 1, 0.1490196, 0, 1,
-1.948824, 0.2400569, -0.04352813, 1, 0.1568628, 0, 1,
-1.940666, -2.144646, -3.029221, 1, 0.1607843, 0, 1,
-1.910608, -0.9213993, -3.096575, 1, 0.1686275, 0, 1,
-1.907686, 0.9429612, -0.5607935, 1, 0.172549, 0, 1,
-1.902562, 1.68314, -1.898543, 1, 0.1803922, 0, 1,
-1.869485, -0.5150471, -1.241398, 1, 0.1843137, 0, 1,
-1.869164, 1.567229, -0.672069, 1, 0.1921569, 0, 1,
-1.850277, 1.512421, 0.3684405, 1, 0.1960784, 0, 1,
-1.843794, 1.169746, -1.005022, 1, 0.2039216, 0, 1,
-1.83739, -0.2216432, -1.352184, 1, 0.2117647, 0, 1,
-1.826631, -0.4594065, -4.0869, 1, 0.2156863, 0, 1,
-1.812015, 0.648632, 0.1806977, 1, 0.2235294, 0, 1,
-1.808907, 0.5451435, -0.9377084, 1, 0.227451, 0, 1,
-1.805258, 0.07329322, -1.959935, 1, 0.2352941, 0, 1,
-1.793999, -0.4474764, -2.962135, 1, 0.2392157, 0, 1,
-1.792421, -0.4724587, -3.943446, 1, 0.2470588, 0, 1,
-1.78907, -0.2518978, 0.1185849, 1, 0.2509804, 0, 1,
-1.764434, -0.7263622, -2.342656, 1, 0.2588235, 0, 1,
-1.75056, -0.4905771, -1.900964, 1, 0.2627451, 0, 1,
-1.731723, 0.9937406, -1.081535, 1, 0.2705882, 0, 1,
-1.729583, -0.606279, -1.879328, 1, 0.2745098, 0, 1,
-1.720651, 0.6943899, -0.4000025, 1, 0.282353, 0, 1,
-1.71163, 0.1172917, -3.29773, 1, 0.2862745, 0, 1,
-1.697177, -0.8929392, -2.230495, 1, 0.2941177, 0, 1,
-1.692392, -0.6979679, -1.9897, 1, 0.3019608, 0, 1,
-1.680802, 0.4044235, -0.5648218, 1, 0.3058824, 0, 1,
-1.654039, -0.06037347, -2.218948, 1, 0.3137255, 0, 1,
-1.628555, 2.230442, -1.32315, 1, 0.3176471, 0, 1,
-1.624138, -0.8054276, -4.084545, 1, 0.3254902, 0, 1,
-1.613158, 0.7628676, -1.805624, 1, 0.3294118, 0, 1,
-1.611271, 0.1366185, -0.8884466, 1, 0.3372549, 0, 1,
-1.607882, 0.2699962, -0.5771074, 1, 0.3411765, 0, 1,
-1.580348, 0.8720105, -2.080186, 1, 0.3490196, 0, 1,
-1.579742, -1.308053, -3.029932, 1, 0.3529412, 0, 1,
-1.568693, -0.9856955, -1.66383, 1, 0.3607843, 0, 1,
-1.568034, 1.293268, -0.9786964, 1, 0.3647059, 0, 1,
-1.564219, 0.9081156, -2.437273, 1, 0.372549, 0, 1,
-1.552351, 1.409122, -0.7050034, 1, 0.3764706, 0, 1,
-1.542255, -1.501373, -2.28893, 1, 0.3843137, 0, 1,
-1.533475, -0.6208932, -2.078061, 1, 0.3882353, 0, 1,
-1.531773, 0.3657947, -1.785599, 1, 0.3960784, 0, 1,
-1.516561, -1.174147, -4.257676, 1, 0.4039216, 0, 1,
-1.516463, 2.041016, -2.333093, 1, 0.4078431, 0, 1,
-1.511583, -0.1570334, -0.6908259, 1, 0.4156863, 0, 1,
-1.50284, -0.1702865, -0.9371747, 1, 0.4196078, 0, 1,
-1.497709, 1.181908, -1.806535, 1, 0.427451, 0, 1,
-1.494253, 0.6318, -0.1643421, 1, 0.4313726, 0, 1,
-1.491975, -1.497014, -1.394127, 1, 0.4392157, 0, 1,
-1.487084, 1.786613, 0.6403766, 1, 0.4431373, 0, 1,
-1.484542, 0.008649463, -1.31167, 1, 0.4509804, 0, 1,
-1.454562, 0.6788244, -1.153488, 1, 0.454902, 0, 1,
-1.445986, 1.118477, -4.238963, 1, 0.4627451, 0, 1,
-1.44346, -0.9766841, -2.301432, 1, 0.4666667, 0, 1,
-1.432627, -1.008676, -2.007035, 1, 0.4745098, 0, 1,
-1.42784, -0.008983728, -1.960656, 1, 0.4784314, 0, 1,
-1.418344, -1.260863, -1.941718, 1, 0.4862745, 0, 1,
-1.411545, 0.817216, -1.931282, 1, 0.4901961, 0, 1,
-1.394696, -1.787078, -3.318308, 1, 0.4980392, 0, 1,
-1.37861, 0.07057624, -2.060478, 1, 0.5058824, 0, 1,
-1.377386, 1.525027, -0.09425601, 1, 0.509804, 0, 1,
-1.375628, -0.2647333, -2.664752, 1, 0.5176471, 0, 1,
-1.374994, 0.0846149, -2.343453, 1, 0.5215687, 0, 1,
-1.371845, -0.7782143, -2.241478, 1, 0.5294118, 0, 1,
-1.371731, 0.9742867, -1.699015, 1, 0.5333334, 0, 1,
-1.360459, -0.6365977, -1.519829, 1, 0.5411765, 0, 1,
-1.348863, 0.9713374, -0.1967862, 1, 0.5450981, 0, 1,
-1.340542, 0.1935912, -0.6259336, 1, 0.5529412, 0, 1,
-1.339875, 1.33577, -1.205852, 1, 0.5568628, 0, 1,
-1.337254, 1.111542, -0.9849046, 1, 0.5647059, 0, 1,
-1.330656, -1.46799, -0.9500772, 1, 0.5686275, 0, 1,
-1.326526, 0.5936767, -0.5760882, 1, 0.5764706, 0, 1,
-1.31504, 0.4220769, -1.06896, 1, 0.5803922, 0, 1,
-1.313384, -0.2351838, -0.7772384, 1, 0.5882353, 0, 1,
-1.312116, 0.334682, -0.7715747, 1, 0.5921569, 0, 1,
-1.305445, 0.3330901, -1.58803, 1, 0.6, 0, 1,
-1.305441, -0.0677794, -1.953588, 1, 0.6078432, 0, 1,
-1.299912, 0.6412368, -0.1438479, 1, 0.6117647, 0, 1,
-1.288818, 1.658004, -1.495045, 1, 0.6196079, 0, 1,
-1.276296, -1.388557, -2.314451, 1, 0.6235294, 0, 1,
-1.265958, -0.2357139, -1.068817, 1, 0.6313726, 0, 1,
-1.243534, -0.533136, -1.195938, 1, 0.6352941, 0, 1,
-1.234815, 0.133755, -0.9949697, 1, 0.6431373, 0, 1,
-1.232232, -0.1064771, -2.333638, 1, 0.6470588, 0, 1,
-1.229244, -0.04341309, -2.666913, 1, 0.654902, 0, 1,
-1.228929, 1.445056, 1.519661, 1, 0.6588235, 0, 1,
-1.226189, 0.02570763, -3.380206, 1, 0.6666667, 0, 1,
-1.220387, -1.807365, -2.576257, 1, 0.6705883, 0, 1,
-1.220236, -0.6545368, -0.7014738, 1, 0.6784314, 0, 1,
-1.220198, -0.3705457, -1.585921, 1, 0.682353, 0, 1,
-1.215062, -1.335963, -2.787188, 1, 0.6901961, 0, 1,
-1.213601, -0.639427, -1.885183, 1, 0.6941177, 0, 1,
-1.20899, -0.8646132, -1.759679, 1, 0.7019608, 0, 1,
-1.195912, -1.514596, -1.50225, 1, 0.7098039, 0, 1,
-1.192363, 0.151512, -2.537769, 1, 0.7137255, 0, 1,
-1.184341, -0.6812619, -4.221664, 1, 0.7215686, 0, 1,
-1.18321, -0.1573891, -1.629993, 1, 0.7254902, 0, 1,
-1.181683, 1.397773, -0.9572878, 1, 0.7333333, 0, 1,
-1.17359, -1.182568, -2.055, 1, 0.7372549, 0, 1,
-1.173396, 1.474814, -0.2218872, 1, 0.7450981, 0, 1,
-1.151633, -1.125213, -1.774444, 1, 0.7490196, 0, 1,
-1.145909, 0.3088346, 0.9341933, 1, 0.7568628, 0, 1,
-1.141576, -0.1717241, -1.512719, 1, 0.7607843, 0, 1,
-1.138035, -0.2121806, -2.47651, 1, 0.7686275, 0, 1,
-1.132826, 0.1416413, -2.848939, 1, 0.772549, 0, 1,
-1.129033, 1.630438, 0.147636, 1, 0.7803922, 0, 1,
-1.126939, -0.9177907, -2.603401, 1, 0.7843137, 0, 1,
-1.124299, 0.2944266, -1.705847, 1, 0.7921569, 0, 1,
-1.122652, -1.771286, -2.934585, 1, 0.7960784, 0, 1,
-1.120558, -0.09993836, -1.477591, 1, 0.8039216, 0, 1,
-1.118354, -1.143281, -3.056496, 1, 0.8117647, 0, 1,
-1.113645, 0.4051687, -1.025244, 1, 0.8156863, 0, 1,
-1.10906, -0.415294, -1.988179, 1, 0.8235294, 0, 1,
-1.103199, 0.1162067, -1.306417, 1, 0.827451, 0, 1,
-1.099272, 1.722015, 0.1741876, 1, 0.8352941, 0, 1,
-1.094497, -0.1738681, -3.967463, 1, 0.8392157, 0, 1,
-1.090521, -0.9827023, -3.512881, 1, 0.8470588, 0, 1,
-1.08488, -0.2304283, -2.692172, 1, 0.8509804, 0, 1,
-1.083428, 0.3254249, -1.943395, 1, 0.8588235, 0, 1,
-1.065105, 1.342257, 0.2891811, 1, 0.8627451, 0, 1,
-1.064602, 0.5507851, -1.09161, 1, 0.8705882, 0, 1,
-1.050892, 1.107662, -0.1488184, 1, 0.8745098, 0, 1,
-1.050522, 0.6202198, -2.285016, 1, 0.8823529, 0, 1,
-1.03784, -2.902552, -3.426575, 1, 0.8862745, 0, 1,
-1.035546, 0.1821472, -1.225621, 1, 0.8941177, 0, 1,
-1.034224, 0.2079933, -1.52762, 1, 0.8980392, 0, 1,
-1.023439, 0.8146334, 0.3929997, 1, 0.9058824, 0, 1,
-1.01985, -1.487512, -1.673369, 1, 0.9137255, 0, 1,
-1.013311, 0.3730787, -0.5390666, 1, 0.9176471, 0, 1,
-1.010432, 1.673587, 2.294211, 1, 0.9254902, 0, 1,
-0.9920369, -0.06628563, -0.07542697, 1, 0.9294118, 0, 1,
-0.9790737, -3.056241, -4.242651, 1, 0.9372549, 0, 1,
-0.9746304, -0.4344481, -4.334569, 1, 0.9411765, 0, 1,
-0.9736961, -0.2253525, -0.8299916, 1, 0.9490196, 0, 1,
-0.9702138, 1.062361, 0.2293747, 1, 0.9529412, 0, 1,
-0.9700289, 1.160749, 0.2162401, 1, 0.9607843, 0, 1,
-0.9693466, -1.808197, -3.230727, 1, 0.9647059, 0, 1,
-0.949402, 0.3075144, -0.5874525, 1, 0.972549, 0, 1,
-0.9485917, 1.243354, -1.365955, 1, 0.9764706, 0, 1,
-0.9390499, 0.9220701, -0.4592145, 1, 0.9843137, 0, 1,
-0.9372917, 0.6320782, -1.966004, 1, 0.9882353, 0, 1,
-0.9352583, 0.08782056, -0.6946285, 1, 0.9960784, 0, 1,
-0.9330584, 1.793505, 0.2441076, 0.9960784, 1, 0, 1,
-0.9276433, 0.2754014, -0.675662, 0.9921569, 1, 0, 1,
-0.9257685, 0.6797042, 0.4543343, 0.9843137, 1, 0, 1,
-0.9251417, 1.458781, -0.1675278, 0.9803922, 1, 0, 1,
-0.9242215, -0.2880461, -1.183114, 0.972549, 1, 0, 1,
-0.9153037, 0.3416089, 0.9585351, 0.9686275, 1, 0, 1,
-0.9151646, -0.4607405, -3.87861, 0.9607843, 1, 0, 1,
-0.9122546, 0.5262205, 0.09108795, 0.9568627, 1, 0, 1,
-0.9039217, 1.699064, -1.429079, 0.9490196, 1, 0, 1,
-0.8914483, 0.961928, -1.162149, 0.945098, 1, 0, 1,
-0.8878021, -1.772663, -3.068139, 0.9372549, 1, 0, 1,
-0.8877145, -0.3603531, -2.402501, 0.9333333, 1, 0, 1,
-0.8854815, 1.264793, -0.7099146, 0.9254902, 1, 0, 1,
-0.872924, -0.5042138, -3.066318, 0.9215686, 1, 0, 1,
-0.8717218, 1.215658, 0.6071295, 0.9137255, 1, 0, 1,
-0.8698806, -1.898651, -4.497819, 0.9098039, 1, 0, 1,
-0.8681266, 1.212522, -1.403004, 0.9019608, 1, 0, 1,
-0.8676785, 0.0847486, -0.731987, 0.8941177, 1, 0, 1,
-0.8652766, -0.03163882, -2.109165, 0.8901961, 1, 0, 1,
-0.862241, 0.5967904, -0.2638892, 0.8823529, 1, 0, 1,
-0.8611053, -0.9266087, -3.386187, 0.8784314, 1, 0, 1,
-0.8568707, -0.3275373, -1.557174, 0.8705882, 1, 0, 1,
-0.8550954, -1.887872, -4.8758, 0.8666667, 1, 0, 1,
-0.8490481, -1.493071, -1.297724, 0.8588235, 1, 0, 1,
-0.8486102, -0.5764446, -1.597006, 0.854902, 1, 0, 1,
-0.8485803, -1.354356, -3.139927, 0.8470588, 1, 0, 1,
-0.8376454, 0.7955276, 0.231069, 0.8431373, 1, 0, 1,
-0.8372329, 0.2698855, -0.146952, 0.8352941, 1, 0, 1,
-0.83625, -0.761947, -2.131421, 0.8313726, 1, 0, 1,
-0.8288841, -1.544074, -2.314512, 0.8235294, 1, 0, 1,
-0.8259146, -2.037136, -3.512614, 0.8196079, 1, 0, 1,
-0.8212144, 0.4389912, -0.6368849, 0.8117647, 1, 0, 1,
-0.8204758, -0.6565463, -0.3365886, 0.8078431, 1, 0, 1,
-0.818204, 1.414241, -0.939284, 0.8, 1, 0, 1,
-0.8153445, 0.911195, -1.525845, 0.7921569, 1, 0, 1,
-0.813763, -0.4923295, 0.5854359, 0.7882353, 1, 0, 1,
-0.8132315, 0.7964033, -0.9183605, 0.7803922, 1, 0, 1,
-0.8112584, -0.07600096, -2.17548, 0.7764706, 1, 0, 1,
-0.8097571, -0.5496462, -3.262397, 0.7686275, 1, 0, 1,
-0.8034986, 0.5732373, -2.188398, 0.7647059, 1, 0, 1,
-0.8023847, -1.407619, -5.163013, 0.7568628, 1, 0, 1,
-0.8018194, 0.1116313, -0.4194314, 0.7529412, 1, 0, 1,
-0.8009181, -0.7348425, -2.692693, 0.7450981, 1, 0, 1,
-0.7993338, 0.9792992, -1.162227, 0.7411765, 1, 0, 1,
-0.7984626, -0.1343159, -0.8091567, 0.7333333, 1, 0, 1,
-0.7957072, 0.1325165, -0.8012357, 0.7294118, 1, 0, 1,
-0.792842, 0.6982976, 0.6149126, 0.7215686, 1, 0, 1,
-0.7922727, -2.67214, -2.365181, 0.7176471, 1, 0, 1,
-0.7862215, -0.293558, -1.651051, 0.7098039, 1, 0, 1,
-0.7827812, 0.3266513, -1.197202, 0.7058824, 1, 0, 1,
-0.775124, 0.4784244, 0.1477752, 0.6980392, 1, 0, 1,
-0.7735537, 2.492251, -2.272067, 0.6901961, 1, 0, 1,
-0.768656, 2.17605, -1.628312, 0.6862745, 1, 0, 1,
-0.7650344, 0.5381469, 0.2410706, 0.6784314, 1, 0, 1,
-0.7626621, -0.2008613, -2.745534, 0.6745098, 1, 0, 1,
-0.7588192, -0.1646804, -1.753247, 0.6666667, 1, 0, 1,
-0.755764, 0.3293077, -0.7173619, 0.6627451, 1, 0, 1,
-0.7550001, 0.3535937, -1.220492, 0.654902, 1, 0, 1,
-0.7528271, 0.1226727, -1.36209, 0.6509804, 1, 0, 1,
-0.7495609, 0.3865617, -0.3252202, 0.6431373, 1, 0, 1,
-0.7470312, 1.132968, -0.2573396, 0.6392157, 1, 0, 1,
-0.7440257, -0.9668046, -2.86124, 0.6313726, 1, 0, 1,
-0.740522, -0.3567777, -3.220985, 0.627451, 1, 0, 1,
-0.7402261, 0.7841618, -0.427004, 0.6196079, 1, 0, 1,
-0.7316102, -0.5299553, -1.474584, 0.6156863, 1, 0, 1,
-0.7305763, -0.550089, -1.384698, 0.6078432, 1, 0, 1,
-0.7287909, 1.091946, -2.386977, 0.6039216, 1, 0, 1,
-0.7276741, 0.1744758, -0.08176533, 0.5960785, 1, 0, 1,
-0.7261155, -0.9486678, -2.47487, 0.5882353, 1, 0, 1,
-0.7252312, 1.814995, 0.3128124, 0.5843138, 1, 0, 1,
-0.721683, 0.2047616, -2.353702, 0.5764706, 1, 0, 1,
-0.7212123, -0.1266568, -3.08615, 0.572549, 1, 0, 1,
-0.7202049, -1.435211, -1.980718, 0.5647059, 1, 0, 1,
-0.7132812, -1.752436, -1.169682, 0.5607843, 1, 0, 1,
-0.7108425, 0.3240758, -3.04833, 0.5529412, 1, 0, 1,
-0.7091673, 0.008488263, -0.1815139, 0.5490196, 1, 0, 1,
-0.7037991, 1.548253, 1.028892, 0.5411765, 1, 0, 1,
-0.6945067, -0.3501534, -2.483481, 0.5372549, 1, 0, 1,
-0.6917125, -0.4434494, -2.745437, 0.5294118, 1, 0, 1,
-0.6854333, 0.7591612, -1.821943, 0.5254902, 1, 0, 1,
-0.6841578, 2.022674, 0.3554474, 0.5176471, 1, 0, 1,
-0.6736922, 1.070292, -1.866642, 0.5137255, 1, 0, 1,
-0.6723918, 1.279114, 0.4793177, 0.5058824, 1, 0, 1,
-0.6706887, -1.417809, -3.543329, 0.5019608, 1, 0, 1,
-0.6683162, 0.8410819, 1.013263, 0.4941176, 1, 0, 1,
-0.6664221, 1.593055, -0.1027792, 0.4862745, 1, 0, 1,
-0.6655239, 1.011099, -0.8415163, 0.4823529, 1, 0, 1,
-0.6558562, -1.759381, -2.801917, 0.4745098, 1, 0, 1,
-0.6518127, 0.8425322, -1.047211, 0.4705882, 1, 0, 1,
-0.6484879, -1.005617, -1.09555, 0.4627451, 1, 0, 1,
-0.6460051, 0.6319277, 0.8463648, 0.4588235, 1, 0, 1,
-0.6423824, -0.987316, -2.817455, 0.4509804, 1, 0, 1,
-0.6422782, 0.6140202, -1.623674, 0.4470588, 1, 0, 1,
-0.639699, -0.7958792, -2.601282, 0.4392157, 1, 0, 1,
-0.6357105, 1.277498, -0.4617282, 0.4352941, 1, 0, 1,
-0.6316852, -0.4802447, -2.63994, 0.427451, 1, 0, 1,
-0.6298745, -0.7028139, -1.534659, 0.4235294, 1, 0, 1,
-0.627501, 2.529208, -0.4813922, 0.4156863, 1, 0, 1,
-0.6213013, -0.1849618, -0.6645521, 0.4117647, 1, 0, 1,
-0.6198606, 0.8029482, -0.4706125, 0.4039216, 1, 0, 1,
-0.616041, 0.8422936, -1.575981, 0.3960784, 1, 0, 1,
-0.6151354, -0.3874612, -3.818909, 0.3921569, 1, 0, 1,
-0.6145588, -1.301833, -2.594493, 0.3843137, 1, 0, 1,
-0.6136901, -0.720862, 0.2566139, 0.3803922, 1, 0, 1,
-0.610254, -0.7843334, -2.062874, 0.372549, 1, 0, 1,
-0.6066016, 2.638187, -0.3248418, 0.3686275, 1, 0, 1,
-0.6050522, 0.1287012, -2.93721, 0.3607843, 1, 0, 1,
-0.6047933, -0.2170301, -1.199711, 0.3568628, 1, 0, 1,
-0.6047143, 0.6873842, 0.6549289, 0.3490196, 1, 0, 1,
-0.5999353, 0.9577262, -1.494274, 0.345098, 1, 0, 1,
-0.5984959, 1.273392, -0.9391468, 0.3372549, 1, 0, 1,
-0.5965217, 0.6198431, -0.2418851, 0.3333333, 1, 0, 1,
-0.5936628, 0.2213459, -1.131873, 0.3254902, 1, 0, 1,
-0.5916841, 1.705286, 0.01256743, 0.3215686, 1, 0, 1,
-0.5879977, -1.417681, -3.326368, 0.3137255, 1, 0, 1,
-0.5870798, 0.7871312, -1.271209, 0.3098039, 1, 0, 1,
-0.5734356, -0.08567207, -3.986997, 0.3019608, 1, 0, 1,
-0.5724235, -0.5930101, -3.186999, 0.2941177, 1, 0, 1,
-0.5719652, 1.297511, 0.05367601, 0.2901961, 1, 0, 1,
-0.5711414, 1.415274, 1.183727, 0.282353, 1, 0, 1,
-0.5671189, -0.4708132, -1.104657, 0.2784314, 1, 0, 1,
-0.5645881, -0.3489375, -2.614736, 0.2705882, 1, 0, 1,
-0.5638511, -0.9998175, -1.909649, 0.2666667, 1, 0, 1,
-0.5621846, -0.9229535, -2.63652, 0.2588235, 1, 0, 1,
-0.5611706, -0.808768, -2.827131, 0.254902, 1, 0, 1,
-0.559611, -1.122762, -3.448384, 0.2470588, 1, 0, 1,
-0.5590209, -0.6056014, -3.101314, 0.2431373, 1, 0, 1,
-0.5585035, 0.7528324, -4.061974, 0.2352941, 1, 0, 1,
-0.5584546, -0.5022126, -1.889151, 0.2313726, 1, 0, 1,
-0.5528834, 0.05533037, -2.229766, 0.2235294, 1, 0, 1,
-0.5508353, 1.503196, 0.29103, 0.2196078, 1, 0, 1,
-0.5444258, -0.7311559, -2.46571, 0.2117647, 1, 0, 1,
-0.5437257, -0.1209597, 0.1507176, 0.2078431, 1, 0, 1,
-0.5355728, -0.03267431, -1.722078, 0.2, 1, 0, 1,
-0.5295458, -0.1731917, -1.239428, 0.1921569, 1, 0, 1,
-0.5260845, 0.03322861, -2.023302, 0.1882353, 1, 0, 1,
-0.5224679, -0.244186, -0.7717771, 0.1803922, 1, 0, 1,
-0.5191347, -0.114809, -2.363277, 0.1764706, 1, 0, 1,
-0.5181785, 0.07522647, -0.07404152, 0.1686275, 1, 0, 1,
-0.5119838, -0.7404809, -1.931887, 0.1647059, 1, 0, 1,
-0.5114775, 0.8268912, -0.3270549, 0.1568628, 1, 0, 1,
-0.5091658, -1.439094, -3.069591, 0.1529412, 1, 0, 1,
-0.5051083, 2.251131, -0.750255, 0.145098, 1, 0, 1,
-0.4985396, -1.750701, -2.992535, 0.1411765, 1, 0, 1,
-0.4965794, 1.512521, -1.467512, 0.1333333, 1, 0, 1,
-0.4942906, 1.088233, -1.516521, 0.1294118, 1, 0, 1,
-0.4922924, -0.4288941, -2.919669, 0.1215686, 1, 0, 1,
-0.4858846, -1.765898, -2.429029, 0.1176471, 1, 0, 1,
-0.4822039, -1.362308, -2.441626, 0.1098039, 1, 0, 1,
-0.4760585, -0.9500276, -2.642209, 0.1058824, 1, 0, 1,
-0.46718, 1.265468, -1.539298, 0.09803922, 1, 0, 1,
-0.4546289, 1.227323, -0.446308, 0.09019608, 1, 0, 1,
-0.453369, -1.271945, -3.302776, 0.08627451, 1, 0, 1,
-0.4503224, 0.7931166, -1.086763, 0.07843138, 1, 0, 1,
-0.4491366, -2.739022, -2.295358, 0.07450981, 1, 0, 1,
-0.4485357, -0.09050769, -1.457862, 0.06666667, 1, 0, 1,
-0.4450448, -0.7294734, -3.513968, 0.0627451, 1, 0, 1,
-0.4388438, 3.563582, -1.428322, 0.05490196, 1, 0, 1,
-0.4369971, -0.900892, -4.881168, 0.05098039, 1, 0, 1,
-0.432238, -0.3183273, -1.969488, 0.04313726, 1, 0, 1,
-0.4321578, -0.4299628, -2.060097, 0.03921569, 1, 0, 1,
-0.4290455, 0.2510239, -1.111227, 0.03137255, 1, 0, 1,
-0.4239862, -0.9109063, -1.649246, 0.02745098, 1, 0, 1,
-0.4238755, 1.354616, 0.8413703, 0.01960784, 1, 0, 1,
-0.4192914, -0.04455538, -1.780307, 0.01568628, 1, 0, 1,
-0.4185842, 0.8424032, -0.6974515, 0.007843138, 1, 0, 1,
-0.4115443, -0.5770586, -2.404989, 0.003921569, 1, 0, 1,
-0.411429, -0.6377606, -3.170348, 0, 1, 0.003921569, 1,
-0.411056, -0.3441123, -0.6515936, 0, 1, 0.01176471, 1,
-0.4088762, 0.04076862, -2.140135, 0, 1, 0.01568628, 1,
-0.4079119, 0.1355952, -1.239684, 0, 1, 0.02352941, 1,
-0.4058482, 1.691644, 0.9722957, 0, 1, 0.02745098, 1,
-0.402702, 1.075294, -0.7874927, 0, 1, 0.03529412, 1,
-0.3976176, -0.859086, -2.315816, 0, 1, 0.03921569, 1,
-0.3887991, -0.8643113, -3.113948, 0, 1, 0.04705882, 1,
-0.3885822, 1.09331, -0.4338523, 0, 1, 0.05098039, 1,
-0.3873362, 1.546077, -0.4651189, 0, 1, 0.05882353, 1,
-0.3872747, 1.362587, -0.6882582, 0, 1, 0.0627451, 1,
-0.3855236, -0.8596865, -1.660499, 0, 1, 0.07058824, 1,
-0.3821911, 1.660214, -1.04423, 0, 1, 0.07450981, 1,
-0.3787196, 0.5634813, 1.332628, 0, 1, 0.08235294, 1,
-0.378599, 2.064792, -0.8091637, 0, 1, 0.08627451, 1,
-0.3770099, -0.6295287, -2.529545, 0, 1, 0.09411765, 1,
-0.3734154, -0.616379, -1.929504, 0, 1, 0.1019608, 1,
-0.3708017, -2.045362, -3.215652, 0, 1, 0.1058824, 1,
-0.3686616, -1.039629, -3.274235, 0, 1, 0.1137255, 1,
-0.3662076, -0.3935607, -3.80238, 0, 1, 0.1176471, 1,
-0.3636299, 2.37542, -1.422849, 0, 1, 0.1254902, 1,
-0.3612191, 0.3249682, -0.7572439, 0, 1, 0.1294118, 1,
-0.3609784, -0.3252312, -1.956802, 0, 1, 0.1372549, 1,
-0.3516751, -0.7023711, -2.969396, 0, 1, 0.1411765, 1,
-0.344869, 0.5345668, 1.131036, 0, 1, 0.1490196, 1,
-0.3435107, 0.5119932, -0.09185623, 0, 1, 0.1529412, 1,
-0.3420341, -0.5971819, -1.328245, 0, 1, 0.1607843, 1,
-0.3395251, -0.6950364, -1.805661, 0, 1, 0.1647059, 1,
-0.339199, -0.1030037, -3.025076, 0, 1, 0.172549, 1,
-0.3284696, -0.127786, -2.327068, 0, 1, 0.1764706, 1,
-0.3268553, 0.6002163, 0.01942174, 0, 1, 0.1843137, 1,
-0.3211231, -0.1268373, -1.720531, 0, 1, 0.1882353, 1,
-0.3122486, -0.5574049, -3.596254, 0, 1, 0.1960784, 1,
-0.3091834, 0.457436, -1.092319, 0, 1, 0.2039216, 1,
-0.3037725, -0.08146112, -2.351906, 0, 1, 0.2078431, 1,
-0.3022916, -1.762586, -4.515703, 0, 1, 0.2156863, 1,
-0.2995397, -0.9197969, -2.633202, 0, 1, 0.2196078, 1,
-0.2977122, -1.280028, -4.271571, 0, 1, 0.227451, 1,
-0.2946912, 0.5651037, -0.58556, 0, 1, 0.2313726, 1,
-0.2931573, -0.4386586, -0.8654664, 0, 1, 0.2392157, 1,
-0.2913564, 0.9067951, 1.502095, 0, 1, 0.2431373, 1,
-0.2912323, -0.9899461, -2.675285, 0, 1, 0.2509804, 1,
-0.2842801, -3.02059, -1.939626, 0, 1, 0.254902, 1,
-0.2836897, -0.1002898, -1.17744, 0, 1, 0.2627451, 1,
-0.2822008, 1.034551, 0.4534253, 0, 1, 0.2666667, 1,
-0.2815646, -1.685641, -3.180951, 0, 1, 0.2745098, 1,
-0.2793209, -0.03361842, -2.082269, 0, 1, 0.2784314, 1,
-0.278147, -0.07111397, -2.347497, 0, 1, 0.2862745, 1,
-0.2743021, 0.1125689, -0.3822044, 0, 1, 0.2901961, 1,
-0.2709644, 0.1480815, -1.263636, 0, 1, 0.2980392, 1,
-0.2663086, -0.6717063, -3.016003, 0, 1, 0.3058824, 1,
-0.262517, -0.03879867, -0.5150237, 0, 1, 0.3098039, 1,
-0.2609509, 0.5346495, -1.546976, 0, 1, 0.3176471, 1,
-0.259935, -0.4193098, -3.313466, 0, 1, 0.3215686, 1,
-0.2585385, 0.1082324, 0.01206523, 0, 1, 0.3294118, 1,
-0.257127, -0.7289927, -1.55996, 0, 1, 0.3333333, 1,
-0.2570403, 2.194509, -0.9801738, 0, 1, 0.3411765, 1,
-0.2567734, -0.795157, -2.809034, 0, 1, 0.345098, 1,
-0.2562635, 0.2000551, -1.285323, 0, 1, 0.3529412, 1,
-0.254264, 0.4098172, -0.7515682, 0, 1, 0.3568628, 1,
-0.2531114, 0.2716877, -0.02328651, 0, 1, 0.3647059, 1,
-0.2489384, 0.1729245, -1.118414, 0, 1, 0.3686275, 1,
-0.242765, -2.295229, -2.383623, 0, 1, 0.3764706, 1,
-0.2413169, 1.521965, 0.8256057, 0, 1, 0.3803922, 1,
-0.2401737, 0.4423552, -1.645137, 0, 1, 0.3882353, 1,
-0.2368228, -0.8819981, -2.43535, 0, 1, 0.3921569, 1,
-0.2362162, -0.9834753, -1.986326, 0, 1, 0.4, 1,
-0.2350774, 0.4999925, -1.134107, 0, 1, 0.4078431, 1,
-0.2337543, 0.002670444, -2.880087, 0, 1, 0.4117647, 1,
-0.2286961, 0.3475335, -2.125255, 0, 1, 0.4196078, 1,
-0.2285397, 0.5206674, 0.3319337, 0, 1, 0.4235294, 1,
-0.2283584, -0.7303159, -2.724751, 0, 1, 0.4313726, 1,
-0.2279746, -0.3331591, -2.845984, 0, 1, 0.4352941, 1,
-0.2138273, -0.9020193, -2.778555, 0, 1, 0.4431373, 1,
-0.2131058, -0.6939406, -1.308914, 0, 1, 0.4470588, 1,
-0.2118085, 0.4670798, -0.8133146, 0, 1, 0.454902, 1,
-0.2112991, 0.8130635, -1.313414, 0, 1, 0.4588235, 1,
-0.1968621, -0.5682335, -3.360357, 0, 1, 0.4666667, 1,
-0.1937376, -0.9325898, -3.364326, 0, 1, 0.4705882, 1,
-0.1924176, -0.313269, -2.366613, 0, 1, 0.4784314, 1,
-0.1922237, -1.601361, -3.666948, 0, 1, 0.4823529, 1,
-0.1889302, 0.9352708, -0.2638475, 0, 1, 0.4901961, 1,
-0.1888244, -0.8932082, -2.812788, 0, 1, 0.4941176, 1,
-0.1865571, 2.302341, -0.4879677, 0, 1, 0.5019608, 1,
-0.1864011, 0.3327123, -1.464125, 0, 1, 0.509804, 1,
-0.1854673, 0.3925676, 0.8907672, 0, 1, 0.5137255, 1,
-0.1841374, 1.036091, -0.7062559, 0, 1, 0.5215687, 1,
-0.1798604, -1.663962, -2.835048, 0, 1, 0.5254902, 1,
-0.17947, 0.3239354, -0.5938189, 0, 1, 0.5333334, 1,
-0.1773773, -2.13207, -4.056782, 0, 1, 0.5372549, 1,
-0.1714576, 1.591763, -1.329224, 0, 1, 0.5450981, 1,
-0.1665606, -0.2690082, -0.5246693, 0, 1, 0.5490196, 1,
-0.1640386, 0.2153433, -0.7773885, 0, 1, 0.5568628, 1,
-0.1581041, 1.15959, 0.2713861, 0, 1, 0.5607843, 1,
-0.1571911, -0.04606857, -2.481752, 0, 1, 0.5686275, 1,
-0.1570307, 0.3476398, 0.3400533, 0, 1, 0.572549, 1,
-0.1551928, -1.161242, -4.157094, 0, 1, 0.5803922, 1,
-0.1487606, 1.151067, -1.532861, 0, 1, 0.5843138, 1,
-0.148173, 0.1230768, -2.305282, 0, 1, 0.5921569, 1,
-0.1446369, -1.019762, -3.366929, 0, 1, 0.5960785, 1,
-0.1441744, 0.8381895, -0.6493862, 0, 1, 0.6039216, 1,
-0.1422325, -1.197249, -1.636156, 0, 1, 0.6117647, 1,
-0.138769, -0.6847765, -5.203885, 0, 1, 0.6156863, 1,
-0.1384346, 1.205899, -0.1140591, 0, 1, 0.6235294, 1,
-0.1378669, -1.474139, -3.874963, 0, 1, 0.627451, 1,
-0.1348837, -1.070818, -3.680921, 0, 1, 0.6352941, 1,
-0.1259224, 1.27304, -0.6003968, 0, 1, 0.6392157, 1,
-0.1254177, -1.051369, -2.792688, 0, 1, 0.6470588, 1,
-0.1243618, 0.6868229, -1.149972, 0, 1, 0.6509804, 1,
-0.1241192, -0.3750596, -3.171261, 0, 1, 0.6588235, 1,
-0.1215049, -0.6649639, -3.488162, 0, 1, 0.6627451, 1,
-0.1167906, 0.2880595, -2.023252, 0, 1, 0.6705883, 1,
-0.1157022, 0.3076731, 0.07685568, 0, 1, 0.6745098, 1,
-0.1154951, -1.441306, -2.517864, 0, 1, 0.682353, 1,
-0.1027044, 0.9169333, -0.3215135, 0, 1, 0.6862745, 1,
-0.09800752, 1.15042, -1.273804, 0, 1, 0.6941177, 1,
-0.09794587, -0.1603896, -1.539338, 0, 1, 0.7019608, 1,
-0.09790729, -1.016516, -2.53593, 0, 1, 0.7058824, 1,
-0.09453356, -1.049917, -2.153311, 0, 1, 0.7137255, 1,
-0.09453298, 0.5415633, -0.5514406, 0, 1, 0.7176471, 1,
-0.09315348, 2.273869, 2.078963, 0, 1, 0.7254902, 1,
-0.09207405, -0.5284409, -2.855734, 0, 1, 0.7294118, 1,
-0.08718573, 0.08597052, -3.556141, 0, 1, 0.7372549, 1,
-0.07481216, -3.324992, -3.85548, 0, 1, 0.7411765, 1,
-0.07167693, -0.7266067, -3.147972, 0, 1, 0.7490196, 1,
-0.06705593, 0.1736592, 1.13363, 0, 1, 0.7529412, 1,
-0.06087501, -0.4385659, -3.054405, 0, 1, 0.7607843, 1,
-0.06044756, 0.2062416, 0.01235533, 0, 1, 0.7647059, 1,
-0.05967614, 0.8744943, 0.3256762, 0, 1, 0.772549, 1,
-0.05841575, 1.367761, -0.06359512, 0, 1, 0.7764706, 1,
-0.05817832, 0.1675131, -0.8000637, 0, 1, 0.7843137, 1,
-0.05219387, 0.1082263, -1.598121, 0, 1, 0.7882353, 1,
-0.05126626, -0.04710865, -1.955749, 0, 1, 0.7960784, 1,
-0.0494385, 1.005869, -0.1483981, 0, 1, 0.8039216, 1,
-0.04320471, 0.8236357, 1.314811, 0, 1, 0.8078431, 1,
-0.0430717, 0.08722615, -0.4506569, 0, 1, 0.8156863, 1,
-0.04247886, 2.968073, -1.603484, 0, 1, 0.8196079, 1,
-0.04120233, 0.3480106, 0.5745333, 0, 1, 0.827451, 1,
-0.04071919, 0.3651123, -0.04160943, 0, 1, 0.8313726, 1,
-0.03865692, -2.533688, -0.4327147, 0, 1, 0.8392157, 1,
-0.0364223, 0.9403873, -1.286864, 0, 1, 0.8431373, 1,
-0.03435347, -0.7851014, -4.182634, 0, 1, 0.8509804, 1,
-0.03371805, -1.174348, -2.228809, 0, 1, 0.854902, 1,
-0.03271535, -0.3138684, -2.546953, 0, 1, 0.8627451, 1,
-0.03250467, 0.2201159, 0.03408152, 0, 1, 0.8666667, 1,
-0.03189972, -0.1632122, -3.535769, 0, 1, 0.8745098, 1,
-0.03000803, -0.09249825, -0.06924763, 0, 1, 0.8784314, 1,
-0.02997499, 0.9043581, 0.3443215, 0, 1, 0.8862745, 1,
-0.02961826, -0.1050574, -0.7905228, 0, 1, 0.8901961, 1,
-0.0274441, -0.244895, -2.09794, 0, 1, 0.8980392, 1,
-0.02665103, 0.4776061, 0.04288774, 0, 1, 0.9058824, 1,
-0.02539315, 0.06458895, -0.8070535, 0, 1, 0.9098039, 1,
-0.01759341, 0.09694532, -0.6496812, 0, 1, 0.9176471, 1,
-0.01617957, 0.3435635, -0.1959535, 0, 1, 0.9215686, 1,
-0.01372521, 1.207985, -1.027925, 0, 1, 0.9294118, 1,
-0.01076872, -0.09686432, -2.707881, 0, 1, 0.9333333, 1,
-0.009586159, 0.1735413, -1.027338, 0, 1, 0.9411765, 1,
-0.008566423, 0.2784135, -1.682485, 0, 1, 0.945098, 1,
-0.003055789, 0.205708, 1.229122, 0, 1, 0.9529412, 1,
0.001157684, -0.02305542, 2.132209, 0, 1, 0.9568627, 1,
0.004482359, 0.1715796, -1.678538, 0, 1, 0.9647059, 1,
0.007640369, 0.6620089, -1.038245, 0, 1, 0.9686275, 1,
0.008947287, 1.357028, 0.0346889, 0, 1, 0.9764706, 1,
0.01022638, -0.4446269, 4.865912, 0, 1, 0.9803922, 1,
0.01045239, 0.9004751, 1.684819, 0, 1, 0.9882353, 1,
0.01578589, 0.7927122, -1.602453, 0, 1, 0.9921569, 1,
0.01648452, 0.9334897, 0.6633281, 0, 1, 1, 1,
0.01723544, -0.1471845, 2.63869, 0, 0.9921569, 1, 1,
0.01913303, 0.4869874, -0.8259721, 0, 0.9882353, 1, 1,
0.01936664, -0.8713762, 2.337864, 0, 0.9803922, 1, 1,
0.02210463, -0.2655402, 1.033027, 0, 0.9764706, 1, 1,
0.02746326, -1.267414, 3.677851, 0, 0.9686275, 1, 1,
0.02899428, 0.307455, 0.264376, 0, 0.9647059, 1, 1,
0.02942713, 1.654158, -0.2482113, 0, 0.9568627, 1, 1,
0.03096171, -0.3870167, 3.494398, 0, 0.9529412, 1, 1,
0.03183158, -0.4771523, 2.498977, 0, 0.945098, 1, 1,
0.03200209, 0.2665752, -0.4142009, 0, 0.9411765, 1, 1,
0.03281793, -0.7847035, 4.857979, 0, 0.9333333, 1, 1,
0.03503897, -0.1600131, 5.153772, 0, 0.9294118, 1, 1,
0.03588882, -0.3785878, 3.159027, 0, 0.9215686, 1, 1,
0.03628675, 0.8730916, 0.6449372, 0, 0.9176471, 1, 1,
0.03805707, 1.553134, 0.6769889, 0, 0.9098039, 1, 1,
0.03895991, 0.5420848, -0.3556605, 0, 0.9058824, 1, 1,
0.04456516, -0.2751578, 2.512414, 0, 0.8980392, 1, 1,
0.04519476, -0.2165684, 2.887444, 0, 0.8901961, 1, 1,
0.04797757, -2.107291, 3.028728, 0, 0.8862745, 1, 1,
0.06062623, -1.302641, 2.662208, 0, 0.8784314, 1, 1,
0.06090396, -0.5855249, 2.188848, 0, 0.8745098, 1, 1,
0.06241985, 1.758865, -0.8384519, 0, 0.8666667, 1, 1,
0.06365115, -0.6970862, 1.724452, 0, 0.8627451, 1, 1,
0.06562617, 0.4508736, 0.528074, 0, 0.854902, 1, 1,
0.06757008, 1.195696, -1.743927, 0, 0.8509804, 1, 1,
0.07265852, 0.481105, 0.6741318, 0, 0.8431373, 1, 1,
0.0773212, 1.907769, 0.8537391, 0, 0.8392157, 1, 1,
0.07736442, 2.468922, 0.5493413, 0, 0.8313726, 1, 1,
0.07745255, -0.1592531, 2.647738, 0, 0.827451, 1, 1,
0.08147828, -0.2913328, 2.524921, 0, 0.8196079, 1, 1,
0.08357525, -0.313071, 3.622157, 0, 0.8156863, 1, 1,
0.08361057, -1.037072, 3.221052, 0, 0.8078431, 1, 1,
0.08478668, 0.4223972, -0.8087827, 0, 0.8039216, 1, 1,
0.08885664, 1.373023, -1.930238, 0, 0.7960784, 1, 1,
0.08950216, 1.571682, 1.067131, 0, 0.7882353, 1, 1,
0.09480046, -1.180187, 3.034216, 0, 0.7843137, 1, 1,
0.09828299, -0.512598, 2.76327, 0, 0.7764706, 1, 1,
0.1031041, 2.38453, -1.43193, 0, 0.772549, 1, 1,
0.1059144, 0.6759256, -0.4495242, 0, 0.7647059, 1, 1,
0.1066279, 0.04015851, 2.4956, 0, 0.7607843, 1, 1,
0.1185891, -0.3808923, 3.859607, 0, 0.7529412, 1, 1,
0.1199481, 1.287671, -0.8701416, 0, 0.7490196, 1, 1,
0.1213148, -1.49269, 2.503572, 0, 0.7411765, 1, 1,
0.1243689, -0.1762059, 3.427096, 0, 0.7372549, 1, 1,
0.1298931, -1.08473, 3.112725, 0, 0.7294118, 1, 1,
0.1305767, 0.3919508, 0.01847508, 0, 0.7254902, 1, 1,
0.1352371, -0.163967, 1.53227, 0, 0.7176471, 1, 1,
0.1469601, 2.315359, 0.159261, 0, 0.7137255, 1, 1,
0.1487519, 0.1129963, 0.05083246, 0, 0.7058824, 1, 1,
0.1512523, -0.3648435, 2.801401, 0, 0.6980392, 1, 1,
0.151943, 0.8064555, -0.2913908, 0, 0.6941177, 1, 1,
0.1543538, -0.4038051, 1.137946, 0, 0.6862745, 1, 1,
0.1580399, -1.061437, 3.707098, 0, 0.682353, 1, 1,
0.1586511, -0.4636225, 3.033123, 0, 0.6745098, 1, 1,
0.1595963, -0.7231722, 2.437933, 0, 0.6705883, 1, 1,
0.164231, -1.163472, 1.543527, 0, 0.6627451, 1, 1,
0.1668389, 0.5710263, 2.37329, 0, 0.6588235, 1, 1,
0.1730625, 0.823427, 0.8939636, 0, 0.6509804, 1, 1,
0.1749588, -0.02785345, 1.913548, 0, 0.6470588, 1, 1,
0.1774487, -0.1366192, 0.7505621, 0, 0.6392157, 1, 1,
0.178985, 0.1007751, 0.6304829, 0, 0.6352941, 1, 1,
0.182957, 0.3106587, 1.949724, 0, 0.627451, 1, 1,
0.192602, 1.907611, 0.6246174, 0, 0.6235294, 1, 1,
0.1932696, 1.316249, -1.143243, 0, 0.6156863, 1, 1,
0.1956617, 0.1156277, 0.9996334, 0, 0.6117647, 1, 1,
0.1957096, -1.107284, 2.532363, 0, 0.6039216, 1, 1,
0.1960552, -0.9950226, 1.980068, 0, 0.5960785, 1, 1,
0.1966035, 0.1595519, -0.4401928, 0, 0.5921569, 1, 1,
0.2024789, 0.8141986, -0.4398164, 0, 0.5843138, 1, 1,
0.2043925, 0.6118514, -0.3803864, 0, 0.5803922, 1, 1,
0.2133644, -0.8094311, 5.423976, 0, 0.572549, 1, 1,
0.2136313, -0.1448413, 2.508806, 0, 0.5686275, 1, 1,
0.2159558, 0.8669553, -0.6958393, 0, 0.5607843, 1, 1,
0.2206491, -0.8377998, 3.076751, 0, 0.5568628, 1, 1,
0.2223349, -0.4724572, 3.310771, 0, 0.5490196, 1, 1,
0.223165, 0.4193428, 1.109986, 0, 0.5450981, 1, 1,
0.2236581, 0.2820503, 0.9462304, 0, 0.5372549, 1, 1,
0.2268605, -0.3897012, 3.607692, 0, 0.5333334, 1, 1,
0.2288269, -0.9326863, 3.988239, 0, 0.5254902, 1, 1,
0.2298526, 0.5115478, -0.7123051, 0, 0.5215687, 1, 1,
0.2321938, 1.482726, 1.65553, 0, 0.5137255, 1, 1,
0.2337465, -1.742469, 4.998328, 0, 0.509804, 1, 1,
0.2393455, -1.777836, 3.197861, 0, 0.5019608, 1, 1,
0.2409828, 0.3531084, 0.9523333, 0, 0.4941176, 1, 1,
0.2413471, -0.3535331, 2.133555, 0, 0.4901961, 1, 1,
0.2443084, -0.7436261, 3.444966, 0, 0.4823529, 1, 1,
0.2456603, -0.04523, 2.090654, 0, 0.4784314, 1, 1,
0.2459667, -1.586372, 2.607209, 0, 0.4705882, 1, 1,
0.2479058, -0.724611, 3.869835, 0, 0.4666667, 1, 1,
0.2480849, -0.601941, 2.932156, 0, 0.4588235, 1, 1,
0.2510779, 0.1744927, -0.115036, 0, 0.454902, 1, 1,
0.2596592, -0.5141473, 3.584498, 0, 0.4470588, 1, 1,
0.2707523, 0.03938444, 1.434604, 0, 0.4431373, 1, 1,
0.2712945, 0.2501381, 0.8823975, 0, 0.4352941, 1, 1,
0.2733375, -0.8118551, 2.658624, 0, 0.4313726, 1, 1,
0.2752194, -0.0377254, 2.069978, 0, 0.4235294, 1, 1,
0.2752215, 0.0226754, 1.882786, 0, 0.4196078, 1, 1,
0.2783349, -1.340362, 3.66078, 0, 0.4117647, 1, 1,
0.2876864, 1.012091, 0.05125789, 0, 0.4078431, 1, 1,
0.2903006, 0.4494974, -1.813088, 0, 0.4, 1, 1,
0.2998079, -0.6373221, 3.63705, 0, 0.3921569, 1, 1,
0.3008283, 0.9166116, -0.7669083, 0, 0.3882353, 1, 1,
0.3008965, 0.7369877, -0.904674, 0, 0.3803922, 1, 1,
0.3020746, -0.1752157, 3.507239, 0, 0.3764706, 1, 1,
0.3039702, -0.1657884, 1.957094, 0, 0.3686275, 1, 1,
0.3053533, 0.4575648, -1.514583, 0, 0.3647059, 1, 1,
0.3083138, 1.31833, 2.130643, 0, 0.3568628, 1, 1,
0.3088104, -0.2835841, 0.2877322, 0, 0.3529412, 1, 1,
0.3112497, 0.6279913, 1.179876, 0, 0.345098, 1, 1,
0.3151784, 1.588475, -0.8818598, 0, 0.3411765, 1, 1,
0.3172299, -1.402166, 2.266534, 0, 0.3333333, 1, 1,
0.3304684, 0.5363595, 0.4853544, 0, 0.3294118, 1, 1,
0.33222, -1.985663, 4.937915, 0, 0.3215686, 1, 1,
0.3380528, 0.4703325, 2.167264, 0, 0.3176471, 1, 1,
0.3389297, -0.3658979, 2.016013, 0, 0.3098039, 1, 1,
0.3397363, 0.7444591, -0.6569598, 0, 0.3058824, 1, 1,
0.3471664, 1.25327, -0.004074735, 0, 0.2980392, 1, 1,
0.3473859, 1.144775, 1.103484, 0, 0.2901961, 1, 1,
0.3474351, 0.2067406, 2.430193, 0, 0.2862745, 1, 1,
0.353663, -0.2624416, 1.014424, 0, 0.2784314, 1, 1,
0.3562036, -0.01438647, 1.559755, 0, 0.2745098, 1, 1,
0.3577461, -0.006787343, 0.5136237, 0, 0.2666667, 1, 1,
0.3580931, 1.88773, 1.178612, 0, 0.2627451, 1, 1,
0.3590896, -1.840961, 4.007728, 0, 0.254902, 1, 1,
0.3751729, 0.549391, -0.8103108, 0, 0.2509804, 1, 1,
0.3776388, 0.7955378, -0.5572765, 0, 0.2431373, 1, 1,
0.377818, -0.3764107, 2.445668, 0, 0.2392157, 1, 1,
0.3805023, -0.5451956, 4.981885, 0, 0.2313726, 1, 1,
0.3806564, 1.1023, 1.073578, 0, 0.227451, 1, 1,
0.3832918, -0.1507899, 1.628371, 0, 0.2196078, 1, 1,
0.3856057, -1.029183, 1.168167, 0, 0.2156863, 1, 1,
0.385661, -0.03471253, 2.516442, 0, 0.2078431, 1, 1,
0.3876074, -0.6235291, 1.44898, 0, 0.2039216, 1, 1,
0.387736, 0.5940907, 1.896852, 0, 0.1960784, 1, 1,
0.3916499, -1.592029, 2.475061, 0, 0.1882353, 1, 1,
0.3921064, -0.9266589, 3.68647, 0, 0.1843137, 1, 1,
0.3945525, -0.8619244, 2.966504, 0, 0.1764706, 1, 1,
0.4020213, -0.5951129, 2.626016, 0, 0.172549, 1, 1,
0.4023746, 0.826997, -1.677304, 0, 0.1647059, 1, 1,
0.4035271, 0.6102244, 1.884735, 0, 0.1607843, 1, 1,
0.4046902, -1.382351, 3.482479, 0, 0.1529412, 1, 1,
0.4061299, -0.6697432, 4.619389, 0, 0.1490196, 1, 1,
0.4092549, 1.415746, 1.251448, 0, 0.1411765, 1, 1,
0.4101854, 1.801133, 1.437702, 0, 0.1372549, 1, 1,
0.4114001, 0.8122073, 0.5980242, 0, 0.1294118, 1, 1,
0.4120205, 1.278197, -1.123552, 0, 0.1254902, 1, 1,
0.4144348, 1.118149, 0.05555527, 0, 0.1176471, 1, 1,
0.4158107, 0.6407181, 2.95118, 0, 0.1137255, 1, 1,
0.4174114, -0.932344, 2.257357, 0, 0.1058824, 1, 1,
0.4199434, -0.5330307, 2.094279, 0, 0.09803922, 1, 1,
0.4218327, -0.9806324, 2.870289, 0, 0.09411765, 1, 1,
0.4228594, 0.2909964, 1.343574, 0, 0.08627451, 1, 1,
0.4301305, 0.05388926, 1.232627, 0, 0.08235294, 1, 1,
0.4327307, -0.4941521, 2.332983, 0, 0.07450981, 1, 1,
0.4355781, 0.5180613, 0.8275433, 0, 0.07058824, 1, 1,
0.4364169, -1.071725, 4.437976, 0, 0.0627451, 1, 1,
0.4391656, -2.261884, 2.054461, 0, 0.05882353, 1, 1,
0.4418857, -0.2318328, 2.683665, 0, 0.05098039, 1, 1,
0.4431726, 0.8553095, -0.01931511, 0, 0.04705882, 1, 1,
0.4438157, -0.1044289, 2.510645, 0, 0.03921569, 1, 1,
0.4455739, 3.574247, -0.001237205, 0, 0.03529412, 1, 1,
0.4489739, 1.320853, -0.1499805, 0, 0.02745098, 1, 1,
0.4589741, -1.069679, 1.461375, 0, 0.02352941, 1, 1,
0.4601913, 1.376742, -0.5998059, 0, 0.01568628, 1, 1,
0.4634152, -2.568872, 1.388304, 0, 0.01176471, 1, 1,
0.4666642, 0.5021514, 0.2427783, 0, 0.003921569, 1, 1,
0.4668817, -1.567237, 3.393465, 0.003921569, 0, 1, 1,
0.4703379, 0.03317644, 1.449436, 0.007843138, 0, 1, 1,
0.4764488, -0.846338, 3.010142, 0.01568628, 0, 1, 1,
0.4765805, -1.589156, 2.579653, 0.01960784, 0, 1, 1,
0.4796734, 0.1556876, 1.290639, 0.02745098, 0, 1, 1,
0.4824843, 1.666648, 0.1305851, 0.03137255, 0, 1, 1,
0.4825083, -1.112872, 2.667651, 0.03921569, 0, 1, 1,
0.4830637, -0.2346651, 1.790601, 0.04313726, 0, 1, 1,
0.4867522, 0.06730937, 1.658514, 0.05098039, 0, 1, 1,
0.4871817, -0.1145225, 2.067479, 0.05490196, 0, 1, 1,
0.4884496, 1.412226, -0.3144844, 0.0627451, 0, 1, 1,
0.4934061, 1.828661, 0.1183608, 0.06666667, 0, 1, 1,
0.4961559, -0.6546471, 0.9407742, 0.07450981, 0, 1, 1,
0.497169, 0.5104221, -0.1430221, 0.07843138, 0, 1, 1,
0.5042661, -0.7023266, 2.965096, 0.08627451, 0, 1, 1,
0.5046239, 1.138537, 2.124757, 0.09019608, 0, 1, 1,
0.5061538, 0.7572092, 0.6408081, 0.09803922, 0, 1, 1,
0.5103878, -1.529438, 3.111471, 0.1058824, 0, 1, 1,
0.5148908, -0.5916559, 2.798192, 0.1098039, 0, 1, 1,
0.5168334, -1.372654, -0.09403282, 0.1176471, 0, 1, 1,
0.5201292, -0.9731945, 2.68067, 0.1215686, 0, 1, 1,
0.5204935, 0.3131467, 0.1674897, 0.1294118, 0, 1, 1,
0.5223343, 1.005473, 0.9771097, 0.1333333, 0, 1, 1,
0.5357904, -0.1966867, 2.174936, 0.1411765, 0, 1, 1,
0.5387444, 0.923183, -0.04761029, 0.145098, 0, 1, 1,
0.5410486, -0.6813266, 2.810588, 0.1529412, 0, 1, 1,
0.5480144, 0.2792972, 2.382351, 0.1568628, 0, 1, 1,
0.5503039, 0.5608818, -0.2178878, 0.1647059, 0, 1, 1,
0.5503075, -1.03473, 3.410676, 0.1686275, 0, 1, 1,
0.5585201, 1.885208, -0.4048755, 0.1764706, 0, 1, 1,
0.5612157, 0.411789, -0.4381188, 0.1803922, 0, 1, 1,
0.5634285, -0.1596991, 2.572354, 0.1882353, 0, 1, 1,
0.5687572, 0.7159824, 1.599819, 0.1921569, 0, 1, 1,
0.5709049, -0.1144156, 1.957494, 0.2, 0, 1, 1,
0.5720885, -0.2760147, 1.614133, 0.2078431, 0, 1, 1,
0.5727713, -0.4312832, 2.136006, 0.2117647, 0, 1, 1,
0.572851, 0.1100642, 0.3456225, 0.2196078, 0, 1, 1,
0.5729747, 0.6596256, 0.2288337, 0.2235294, 0, 1, 1,
0.5746924, 0.9685649, 0.6222934, 0.2313726, 0, 1, 1,
0.5773261, -0.8694158, 3.467807, 0.2352941, 0, 1, 1,
0.5778407, 1.556405, 0.4322307, 0.2431373, 0, 1, 1,
0.5779609, 1.66998, 0.7206423, 0.2470588, 0, 1, 1,
0.579777, 0.3898926, 2.082238, 0.254902, 0, 1, 1,
0.5818329, 0.6927735, 0.6765997, 0.2588235, 0, 1, 1,
0.5869448, 1.186291, -0.6130837, 0.2666667, 0, 1, 1,
0.5877879, -1.355319, 2.622707, 0.2705882, 0, 1, 1,
0.5884933, 0.7820668, -0.03460295, 0.2784314, 0, 1, 1,
0.5896409, 0.5876957, 1.697973, 0.282353, 0, 1, 1,
0.5900075, 0.9741966, 0.6129299, 0.2901961, 0, 1, 1,
0.5950002, -0.8549448, 1.66646, 0.2941177, 0, 1, 1,
0.598215, -2.479168, 3.284344, 0.3019608, 0, 1, 1,
0.5988082, -0.8952888, 3.663343, 0.3098039, 0, 1, 1,
0.6042947, -1.270581, 1.840146, 0.3137255, 0, 1, 1,
0.6087541, -0.1052956, 3.845019, 0.3215686, 0, 1, 1,
0.6224487, -0.2750923, 2.247042, 0.3254902, 0, 1, 1,
0.6228815, 0.2029524, 0.2736641, 0.3333333, 0, 1, 1,
0.6245475, -1.115384, 2.067481, 0.3372549, 0, 1, 1,
0.6266046, -0.8572075, 2.999577, 0.345098, 0, 1, 1,
0.6364336, 0.07441641, -0.2529735, 0.3490196, 0, 1, 1,
0.6436204, -0.07209735, 1.607185, 0.3568628, 0, 1, 1,
0.6447605, 0.3027108, -0.1617913, 0.3607843, 0, 1, 1,
0.6484519, 0.2603749, 0.04497971, 0.3686275, 0, 1, 1,
0.6551389, 2.189613, 0.8121317, 0.372549, 0, 1, 1,
0.6563579, -0.1561573, 3.472469, 0.3803922, 0, 1, 1,
0.6578891, 0.9092231, 0.6520784, 0.3843137, 0, 1, 1,
0.6639563, -0.1156938, 2.296139, 0.3921569, 0, 1, 1,
0.6653756, 1.756308, -1.248567, 0.3960784, 0, 1, 1,
0.6703722, -0.4497412, 1.586757, 0.4039216, 0, 1, 1,
0.6708167, -0.2134469, 2.939265, 0.4117647, 0, 1, 1,
0.6716204, 0.3304321, 2.088239, 0.4156863, 0, 1, 1,
0.6750746, 1.11873, 0.5045219, 0.4235294, 0, 1, 1,
0.6775556, -1.194212, 3.117375, 0.427451, 0, 1, 1,
0.6779419, 0.8548226, 0.01996683, 0.4352941, 0, 1, 1,
0.6812183, 2.169228, -0.05335462, 0.4392157, 0, 1, 1,
0.6815822, 0.0437003, 0.9883418, 0.4470588, 0, 1, 1,
0.683714, 1.544823, -0.7127445, 0.4509804, 0, 1, 1,
0.690053, 1.52376, 1.170743, 0.4588235, 0, 1, 1,
0.6910563, 0.2966987, 2.505121, 0.4627451, 0, 1, 1,
0.6915805, 0.8758819, 2.105637, 0.4705882, 0, 1, 1,
0.6916724, -0.7816206, 3.091112, 0.4745098, 0, 1, 1,
0.6924647, 2.023303, 0.9092106, 0.4823529, 0, 1, 1,
0.6957344, -0.1238683, 1.557697, 0.4862745, 0, 1, 1,
0.6959841, 0.975019, 0.603096, 0.4941176, 0, 1, 1,
0.6971852, 2.439226, -0.7556136, 0.5019608, 0, 1, 1,
0.699326, 2.386399, -0.5110878, 0.5058824, 0, 1, 1,
0.7023945, 0.08391251, 2.500694, 0.5137255, 0, 1, 1,
0.7069438, 0.2738611, 3.354583, 0.5176471, 0, 1, 1,
0.7121112, -0.1676693, 1.7353, 0.5254902, 0, 1, 1,
0.7179285, 0.684859, 0.7525771, 0.5294118, 0, 1, 1,
0.7182704, 0.2791102, 0.9490464, 0.5372549, 0, 1, 1,
0.7211557, 1.63694, 1.196391, 0.5411765, 0, 1, 1,
0.7216782, -0.2726991, 2.634554, 0.5490196, 0, 1, 1,
0.7229906, -0.2545428, 0.5180547, 0.5529412, 0, 1, 1,
0.7277308, 0.4547829, -0.309931, 0.5607843, 0, 1, 1,
0.7384579, 1.86122, -0.6546636, 0.5647059, 0, 1, 1,
0.7388515, -0.3664078, 2.684954, 0.572549, 0, 1, 1,
0.7398344, 0.3574748, 0.6081411, 0.5764706, 0, 1, 1,
0.7400566, 0.5927551, -0.7868645, 0.5843138, 0, 1, 1,
0.7401969, -1.416897, 1.380753, 0.5882353, 0, 1, 1,
0.7408707, 1.121387, 0.4215128, 0.5960785, 0, 1, 1,
0.7426686, -0.01850529, 1.661007, 0.6039216, 0, 1, 1,
0.7449845, -1.697111, 2.656474, 0.6078432, 0, 1, 1,
0.7460083, 0.1641261, 1.309371, 0.6156863, 0, 1, 1,
0.747301, 1.055132, 0.5045004, 0.6196079, 0, 1, 1,
0.7591218, 1.390223, -0.1497181, 0.627451, 0, 1, 1,
0.7683712, -1.409095, 4.132952, 0.6313726, 0, 1, 1,
0.770824, -0.2273643, 1.568079, 0.6392157, 0, 1, 1,
0.7869051, 0.1522114, 2.41411, 0.6431373, 0, 1, 1,
0.7877645, -0.09530196, 1.042355, 0.6509804, 0, 1, 1,
0.7929726, -1.60138, 3.063315, 0.654902, 0, 1, 1,
0.7980465, -1.454272, 1.017716, 0.6627451, 0, 1, 1,
0.799661, 1.376099, 1.226511, 0.6666667, 0, 1, 1,
0.8002825, -0.9105418, 2.662438, 0.6745098, 0, 1, 1,
0.8056628, -0.1973646, 0.4022111, 0.6784314, 0, 1, 1,
0.8111187, -1.259013, 3.225285, 0.6862745, 0, 1, 1,
0.8234125, -0.5071211, 1.095438, 0.6901961, 0, 1, 1,
0.8236256, 0.2385954, 1.446111, 0.6980392, 0, 1, 1,
0.8248343, -1.393973, 2.419107, 0.7058824, 0, 1, 1,
0.8295447, -0.9925086, 3.384861, 0.7098039, 0, 1, 1,
0.8404453, 2.188245, 0.53509, 0.7176471, 0, 1, 1,
0.8411841, -0.05129683, 1.728724, 0.7215686, 0, 1, 1,
0.8459889, 0.5309671, 1.850113, 0.7294118, 0, 1, 1,
0.8491986, -0.5422342, 4.212064, 0.7333333, 0, 1, 1,
0.8553082, -0.2048369, 2.028004, 0.7411765, 0, 1, 1,
0.8557351, -0.1041735, 1.012101, 0.7450981, 0, 1, 1,
0.8606657, 0.4370176, 0.1269568, 0.7529412, 0, 1, 1,
0.861521, 0.8928533, 1.414877, 0.7568628, 0, 1, 1,
0.8641962, -1.186983, 2.584646, 0.7647059, 0, 1, 1,
0.8644542, 1.096445, 1.086406, 0.7686275, 0, 1, 1,
0.8663933, -1.636183, 1.9964, 0.7764706, 0, 1, 1,
0.869648, -0.9375315, 2.288393, 0.7803922, 0, 1, 1,
0.8756586, 0.5839224, 0.5509497, 0.7882353, 0, 1, 1,
0.8817314, -0.9054583, 2.188206, 0.7921569, 0, 1, 1,
0.8836244, -0.3971986, 1.36628, 0.8, 0, 1, 1,
0.894686, 0.2499463, 1.20805, 0.8078431, 0, 1, 1,
0.905346, -0.2185612, 1.587868, 0.8117647, 0, 1, 1,
0.9088421, 0.2171918, 2.636323, 0.8196079, 0, 1, 1,
0.9136457, -0.3501499, -0.09003709, 0.8235294, 0, 1, 1,
0.9164938, 0.7322068, 0.2477535, 0.8313726, 0, 1, 1,
0.9234532, 1.825799, 0.04337089, 0.8352941, 0, 1, 1,
0.9275386, -0.2737978, 2.466166, 0.8431373, 0, 1, 1,
0.9331811, 0.7988949, 0.7422648, 0.8470588, 0, 1, 1,
0.9446162, 2.848545, -0.2269583, 0.854902, 0, 1, 1,
0.94548, -1.18486, 3.502945, 0.8588235, 0, 1, 1,
0.9486965, 0.1646725, 0.6097216, 0.8666667, 0, 1, 1,
0.956531, 2.359299, -0.7633404, 0.8705882, 0, 1, 1,
0.9595046, -0.3075183, 2.54093, 0.8784314, 0, 1, 1,
0.9609995, 0.05598379, -0.6634457, 0.8823529, 0, 1, 1,
0.9612554, 0.1957234, 1.133206, 0.8901961, 0, 1, 1,
0.9663568, 1.393507, 1.15016, 0.8941177, 0, 1, 1,
0.9825087, -0.8847656, 3.846248, 0.9019608, 0, 1, 1,
0.9884073, -1.750361, 3.56428, 0.9098039, 0, 1, 1,
0.9885688, -2.860465, 2.036848, 0.9137255, 0, 1, 1,
0.9902403, 0.7649267, 1.378145, 0.9215686, 0, 1, 1,
0.9942818, 0.4349983, 0.01959256, 0.9254902, 0, 1, 1,
0.9946538, -0.06947546, 2.05052, 0.9333333, 0, 1, 1,
0.9979461, 1.687097, 0.05937782, 0.9372549, 0, 1, 1,
1.001567, -0.210667, 2.875086, 0.945098, 0, 1, 1,
1.005572, -1.564567, 2.225292, 0.9490196, 0, 1, 1,
1.014075, -0.6131693, 2.084691, 0.9568627, 0, 1, 1,
1.015085, -1.240867, 3.70813, 0.9607843, 0, 1, 1,
1.019525, 0.2494945, 0.4974526, 0.9686275, 0, 1, 1,
1.038972, -0.1455082, 0.405623, 0.972549, 0, 1, 1,
1.04363, -1.139294, 2.749836, 0.9803922, 0, 1, 1,
1.045526, 1.812719, -0.6997784, 0.9843137, 0, 1, 1,
1.054591, 0.04214453, 2.414399, 0.9921569, 0, 1, 1,
1.055001, 0.1130378, 0.7283045, 0.9960784, 0, 1, 1,
1.057838, -1.707053, 2.959656, 1, 0, 0.9960784, 1,
1.061223, 0.4314071, 2.270096, 1, 0, 0.9882353, 1,
1.063302, -0.5972568, 1.517826, 1, 0, 0.9843137, 1,
1.06617, 1.135736, 2.043742, 1, 0, 0.9764706, 1,
1.069644, 0.3251221, 2.770449, 1, 0, 0.972549, 1,
1.072961, -1.231816, 0.7718135, 1, 0, 0.9647059, 1,
1.074397, 2.677725, 0.6706793, 1, 0, 0.9607843, 1,
1.080932, -0.3088323, 1.492812, 1, 0, 0.9529412, 1,
1.091376, -1.134255, 2.587195, 1, 0, 0.9490196, 1,
1.098529, -1.853862, 1.938638, 1, 0, 0.9411765, 1,
1.101163, -0.5421515, 1.424556, 1, 0, 0.9372549, 1,
1.102333, 1.802707, 0.03980771, 1, 0, 0.9294118, 1,
1.105855, -0.914861, 1.640856, 1, 0, 0.9254902, 1,
1.106331, 0.1604457, 1.680862, 1, 0, 0.9176471, 1,
1.106916, 0.1168595, 2.191525, 1, 0, 0.9137255, 1,
1.108258, 0.2064026, 3.177982, 1, 0, 0.9058824, 1,
1.108623, -0.6067845, -0.9828812, 1, 0, 0.9019608, 1,
1.109949, -1.309729, 2.009336, 1, 0, 0.8941177, 1,
1.114417, -0.1160563, 2.169581, 1, 0, 0.8862745, 1,
1.115527, -0.6596296, 1.000422, 1, 0, 0.8823529, 1,
1.119316, 0.3055893, 1.515366, 1, 0, 0.8745098, 1,
1.120212, -0.4668033, 1.608515, 1, 0, 0.8705882, 1,
1.131859, 1.463942, 1.496879, 1, 0, 0.8627451, 1,
1.135198, 0.6409293, 1.954345, 1, 0, 0.8588235, 1,
1.136964, 0.813303, 1.439004, 1, 0, 0.8509804, 1,
1.13888, -1.500451, 2.741917, 1, 0, 0.8470588, 1,
1.153808, -0.3885764, 0.2274414, 1, 0, 0.8392157, 1,
1.157039, 0.6739381, 0.8726683, 1, 0, 0.8352941, 1,
1.157356, -1.032988, 1.455958, 1, 0, 0.827451, 1,
1.158827, -0.634358, 2.274628, 1, 0, 0.8235294, 1,
1.160655, -1.189026, 2.810997, 1, 0, 0.8156863, 1,
1.16206, -0.8353303, 1.332442, 1, 0, 0.8117647, 1,
1.166927, 0.9143594, -0.2062551, 1, 0, 0.8039216, 1,
1.170244, -0.5938395, 1.616397, 1, 0, 0.7960784, 1,
1.170769, 0.2082721, 2.323126, 1, 0, 0.7921569, 1,
1.171486, 0.6374484, 1.860786, 1, 0, 0.7843137, 1,
1.179584, -0.122176, 0.3608726, 1, 0, 0.7803922, 1,
1.18914, -0.4951273, 1.497085, 1, 0, 0.772549, 1,
1.190534, 1.461445, 2.007682, 1, 0, 0.7686275, 1,
1.190917, -0.5135514, 3.318699, 1, 0, 0.7607843, 1,
1.207041, 1.027418, 1.419075, 1, 0, 0.7568628, 1,
1.210235, 1.956453, -2.287277, 1, 0, 0.7490196, 1,
1.219065, -1.015684, 1.745742, 1, 0, 0.7450981, 1,
1.22045, -0.8203345, 1.127036, 1, 0, 0.7372549, 1,
1.222173, 1.307212, 0.7258117, 1, 0, 0.7333333, 1,
1.222561, -0.2285324, 0.5488548, 1, 0, 0.7254902, 1,
1.227753, -0.4491566, 3.174584, 1, 0, 0.7215686, 1,
1.229748, 0.1298953, 0.6238263, 1, 0, 0.7137255, 1,
1.232293, -0.939078, 2.263038, 1, 0, 0.7098039, 1,
1.238396, -0.8093471, 3.150658, 1, 0, 0.7019608, 1,
1.240126, -0.2465689, 1.707599, 1, 0, 0.6941177, 1,
1.246737, 1.033011, 1.564034, 1, 0, 0.6901961, 1,
1.247468, 1.440716, 2.449307, 1, 0, 0.682353, 1,
1.25762, -0.232632, 0.5870506, 1, 0, 0.6784314, 1,
1.26259, 0.2358855, 1.032446, 1, 0, 0.6705883, 1,
1.264888, 0.2021223, 0.4481509, 1, 0, 0.6666667, 1,
1.27115, -1.12042, 1.43508, 1, 0, 0.6588235, 1,
1.272006, 1.151664, 1.534942, 1, 0, 0.654902, 1,
1.277927, 0.9430149, 0.5998039, 1, 0, 0.6470588, 1,
1.282578, 0.9531174, 0.1866159, 1, 0, 0.6431373, 1,
1.28928, 2.49513, 0.4383887, 1, 0, 0.6352941, 1,
1.298506, -1.260468, 3.703444, 1, 0, 0.6313726, 1,
1.315554, 1.285404, 2.146487, 1, 0, 0.6235294, 1,
1.326657, 0.5316929, 1.546978, 1, 0, 0.6196079, 1,
1.332468, 0.351018, 0.0824952, 1, 0, 0.6117647, 1,
1.337526, -1.658139, 1.312119, 1, 0, 0.6078432, 1,
1.344431, 0.3099469, -0.0417203, 1, 0, 0.6, 1,
1.346185, 0.3589426, 0.6344832, 1, 0, 0.5921569, 1,
1.349707, 0.004739378, 1.24812, 1, 0, 0.5882353, 1,
1.357779, 1.514451, 1.954771, 1, 0, 0.5803922, 1,
1.358501, 1.029167, -1.085945, 1, 0, 0.5764706, 1,
1.369494, 0.6553237, 3.143224, 1, 0, 0.5686275, 1,
1.370074, -0.9431921, 1.794367, 1, 0, 0.5647059, 1,
1.372373, 0.5023122, 0.9485098, 1, 0, 0.5568628, 1,
1.375295, -0.7126051, 1.814739, 1, 0, 0.5529412, 1,
1.385644, 0.1981123, 0.3952874, 1, 0, 0.5450981, 1,
1.386995, -0.391762, 1.20324, 1, 0, 0.5411765, 1,
1.393896, 0.4242757, 1.805645, 1, 0, 0.5333334, 1,
1.414312, 1.001659, 0.7991516, 1, 0, 0.5294118, 1,
1.416109, 1.028333, 1.386802, 1, 0, 0.5215687, 1,
1.420008, -0.5725666, 1.243014, 1, 0, 0.5176471, 1,
1.424722, 0.3337644, 2.373595, 1, 0, 0.509804, 1,
1.427166, 0.101887, 0.6366081, 1, 0, 0.5058824, 1,
1.434974, 0.3390087, 1.668223, 1, 0, 0.4980392, 1,
1.475648, -0.9404965, 2.698785, 1, 0, 0.4901961, 1,
1.484047, -0.0001026313, 1.124893, 1, 0, 0.4862745, 1,
1.484695, -0.1559505, 0.6734293, 1, 0, 0.4784314, 1,
1.490507, -0.9330107, 3.590365, 1, 0, 0.4745098, 1,
1.505424, -1.99133, 4.462864, 1, 0, 0.4666667, 1,
1.511853, -1.092377, 1.763628, 1, 0, 0.4627451, 1,
1.516072, 0.1571505, -0.9696838, 1, 0, 0.454902, 1,
1.518697, 0.09696952, -0.4577795, 1, 0, 0.4509804, 1,
1.530837, -0.4202534, 2.722706, 1, 0, 0.4431373, 1,
1.531728, -0.237874, 1.980947, 1, 0, 0.4392157, 1,
1.542664, 1.530156, -0.8906595, 1, 0, 0.4313726, 1,
1.546075, -0.6581607, 3.545451, 1, 0, 0.427451, 1,
1.578044, 0.4193936, 2.457259, 1, 0, 0.4196078, 1,
1.582286, -0.9933257, 3.250308, 1, 0, 0.4156863, 1,
1.589001, 0.1695341, 0.2876217, 1, 0, 0.4078431, 1,
1.598734, 0.3950598, 2.443636, 1, 0, 0.4039216, 1,
1.613307, 0.5199553, 0.5655007, 1, 0, 0.3960784, 1,
1.617997, -0.1845542, 1.042303, 1, 0, 0.3882353, 1,
1.625032, 0.6928024, 1.714523, 1, 0, 0.3843137, 1,
1.641212, 0.3350542, 3.036005, 1, 0, 0.3764706, 1,
1.64689, 1.335994, -0.1603768, 1, 0, 0.372549, 1,
1.654302, 0.04418836, 2.008467, 1, 0, 0.3647059, 1,
1.659943, 1.413069, 0.4398943, 1, 0, 0.3607843, 1,
1.663703, 1.176535, 0.1351604, 1, 0, 0.3529412, 1,
1.686215, -1.053262, 2.194741, 1, 0, 0.3490196, 1,
1.690933, -0.08419163, 0.7448427, 1, 0, 0.3411765, 1,
1.697883, 0.8440906, 0.2714514, 1, 0, 0.3372549, 1,
1.704136, 0.5727955, 0.9267179, 1, 0, 0.3294118, 1,
1.709051, 0.24102, 1.741284, 1, 0, 0.3254902, 1,
1.711769, -1.292105, 2.187424, 1, 0, 0.3176471, 1,
1.739354, -0.4615127, 2.40284, 1, 0, 0.3137255, 1,
1.747774, 0.1859763, 1.942516, 1, 0, 0.3058824, 1,
1.750527, 0.3144531, 1.209179, 1, 0, 0.2980392, 1,
1.757575, -0.7595378, 1.695294, 1, 0, 0.2941177, 1,
1.76689, -2.011522, 1.527562, 1, 0, 0.2862745, 1,
1.774751, -0.382449, 0.7948081, 1, 0, 0.282353, 1,
1.777633, -0.7951056, 1.879985, 1, 0, 0.2745098, 1,
1.777868, -0.7113862, 2.037976, 1, 0, 0.2705882, 1,
1.794779, 1.602464, 0.6999093, 1, 0, 0.2627451, 1,
1.802362, -1.043846, 2.226526, 1, 0, 0.2588235, 1,
1.806952, 1.458805, 2.067489, 1, 0, 0.2509804, 1,
1.815477, 1.026997, 0.1862197, 1, 0, 0.2470588, 1,
1.85563, 0.6828629, 0.1237257, 1, 0, 0.2392157, 1,
1.872296, 0.8296921, 0.3260427, 1, 0, 0.2352941, 1,
1.891783, 1.883426, 1.082391, 1, 0, 0.227451, 1,
1.895333, -0.1438718, 0.8449894, 1, 0, 0.2235294, 1,
1.899188, 1.298483, 1.227888, 1, 0, 0.2156863, 1,
1.906376, 0.3539693, 1.247063, 1, 0, 0.2117647, 1,
1.910635, -0.6929227, 2.364638, 1, 0, 0.2039216, 1,
1.930753, -0.6423497, 2.109602, 1, 0, 0.1960784, 1,
1.951174, -1.121473, 0.6887974, 1, 0, 0.1921569, 1,
1.991798, 1.462251, 1.984268, 1, 0, 0.1843137, 1,
1.992244, -0.6304824, 2.757703, 1, 0, 0.1803922, 1,
1.993543, 1.68473, 4.209487, 1, 0, 0.172549, 1,
2.005866, 0.09784491, 1.132605, 1, 0, 0.1686275, 1,
2.024157, -0.6309304, 1.221006, 1, 0, 0.1607843, 1,
2.03474, -0.8279319, 1.416277, 1, 0, 0.1568628, 1,
2.057812, 0.4525181, 1.914443, 1, 0, 0.1490196, 1,
2.072299, 0.4120254, 1.208858, 1, 0, 0.145098, 1,
2.085129, -1.277962, 2.233052, 1, 0, 0.1372549, 1,
2.090778, -1.084685, 2.961061, 1, 0, 0.1333333, 1,
2.111604, 0.1932901, 1.617099, 1, 0, 0.1254902, 1,
2.112789, 0.2972991, 1.817131, 1, 0, 0.1215686, 1,
2.1461, -0.3224789, 1.319528, 1, 0, 0.1137255, 1,
2.163604, -0.3985237, -0.880614, 1, 0, 0.1098039, 1,
2.177607, -2.135093, 2.128672, 1, 0, 0.1019608, 1,
2.227414, -0.2965839, 2.899163, 1, 0, 0.09411765, 1,
2.240422, -0.2951024, 0.9801928, 1, 0, 0.09019608, 1,
2.244053, 0.4130785, 1.060963, 1, 0, 0.08235294, 1,
2.272255, -0.4363848, 2.14695, 1, 0, 0.07843138, 1,
2.326466, 0.2929764, 0.5326589, 1, 0, 0.07058824, 1,
2.327551, 1.190866, 1.092756, 1, 0, 0.06666667, 1,
2.380477, 1.182304, 1.322075, 1, 0, 0.05882353, 1,
2.481531, 0.2967144, 2.033197, 1, 0, 0.05490196, 1,
2.533019, -0.5861509, 2.53874, 1, 0, 0.04705882, 1,
2.557363, 0.2949037, 1.122605, 1, 0, 0.04313726, 1,
2.682697, 1.935251, 0.484665, 1, 0, 0.03529412, 1,
2.777106, -3.023526, 2.814743, 1, 0, 0.03137255, 1,
2.955814, 0.4557881, 0.4251191, 1, 0, 0.02352941, 1,
2.982361, -0.3320444, 2.298339, 1, 0, 0.01960784, 1,
3.022989, -1.02288, 2.084368, 1, 0, 0.01176471, 1,
3.040354, 1.249741, 1.839648, 1, 0, 0.007843138, 1
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
-0.2200189, -4.494413, -7.005307, 0, -0.5, 0.5, 0.5,
-0.2200189, -4.494413, -7.005307, 1, -0.5, 0.5, 0.5,
-0.2200189, -4.494413, -7.005307, 1, 1.5, 0.5, 0.5,
-0.2200189, -4.494413, -7.005307, 0, 1.5, 0.5, 0.5
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
-4.585658, 0.1246274, -7.005307, 0, -0.5, 0.5, 0.5,
-4.585658, 0.1246274, -7.005307, 1, -0.5, 0.5, 0.5,
-4.585658, 0.1246274, -7.005307, 1, 1.5, 0.5, 0.5,
-4.585658, 0.1246274, -7.005307, 0, 1.5, 0.5, 0.5
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
-4.585658, -4.494413, 0.1100457, 0, -0.5, 0.5, 0.5,
-4.585658, -4.494413, 0.1100457, 1, -0.5, 0.5, 0.5,
-4.585658, -4.494413, 0.1100457, 1, 1.5, 0.5, 0.5,
-4.585658, -4.494413, 0.1100457, 0, 1.5, 0.5, 0.5
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
-3, -3.428481, -5.363303,
3, -3.428481, -5.363303,
-3, -3.428481, -5.363303,
-3, -3.606136, -5.63697,
-2, -3.428481, -5.363303,
-2, -3.606136, -5.63697,
-1, -3.428481, -5.363303,
-1, -3.606136, -5.63697,
0, -3.428481, -5.363303,
0, -3.606136, -5.63697,
1, -3.428481, -5.363303,
1, -3.606136, -5.63697,
2, -3.428481, -5.363303,
2, -3.606136, -5.63697,
3, -3.428481, -5.363303,
3, -3.606136, -5.63697
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
-3, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
-3, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
-3, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
-3, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5,
-2, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
-2, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
-2, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
-2, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5,
-1, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
-1, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
-1, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
-1, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5,
0, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
0, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
0, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
0, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5,
1, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
1, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
1, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
1, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5,
2, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
2, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
2, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
2, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5,
3, -3.961447, -6.184305, 0, -0.5, 0.5, 0.5,
3, -3.961447, -6.184305, 1, -0.5, 0.5, 0.5,
3, -3.961447, -6.184305, 1, 1.5, 0.5, 0.5,
3, -3.961447, -6.184305, 0, 1.5, 0.5, 0.5
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
-3.578203, -3, -5.363303,
-3.578203, 3, -5.363303,
-3.578203, -3, -5.363303,
-3.746112, -3, -5.63697,
-3.578203, -2, -5.363303,
-3.746112, -2, -5.63697,
-3.578203, -1, -5.363303,
-3.746112, -1, -5.63697,
-3.578203, 0, -5.363303,
-3.746112, 0, -5.63697,
-3.578203, 1, -5.363303,
-3.746112, 1, -5.63697,
-3.578203, 2, -5.363303,
-3.746112, 2, -5.63697,
-3.578203, 3, -5.363303,
-3.746112, 3, -5.63697
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
-4.08193, -3, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, -3, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, -3, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, -3, -6.184305, 0, 1.5, 0.5, 0.5,
-4.08193, -2, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, -2, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, -2, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, -2, -6.184305, 0, 1.5, 0.5, 0.5,
-4.08193, -1, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, -1, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, -1, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, -1, -6.184305, 0, 1.5, 0.5, 0.5,
-4.08193, 0, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, 0, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, 0, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, 0, -6.184305, 0, 1.5, 0.5, 0.5,
-4.08193, 1, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, 1, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, 1, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, 1, -6.184305, 0, 1.5, 0.5, 0.5,
-4.08193, 2, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, 2, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, 2, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, 2, -6.184305, 0, 1.5, 0.5, 0.5,
-4.08193, 3, -6.184305, 0, -0.5, 0.5, 0.5,
-4.08193, 3, -6.184305, 1, -0.5, 0.5, 0.5,
-4.08193, 3, -6.184305, 1, 1.5, 0.5, 0.5,
-4.08193, 3, -6.184305, 0, 1.5, 0.5, 0.5
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
-3.578203, -3.428481, -4,
-3.578203, -3.428481, 4,
-3.578203, -3.428481, -4,
-3.746112, -3.606136, -4,
-3.578203, -3.428481, -2,
-3.746112, -3.606136, -2,
-3.578203, -3.428481, 0,
-3.746112, -3.606136, 0,
-3.578203, -3.428481, 2,
-3.746112, -3.606136, 2,
-3.578203, -3.428481, 4,
-3.746112, -3.606136, 4
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
-4.08193, -3.961447, -4, 0, -0.5, 0.5, 0.5,
-4.08193, -3.961447, -4, 1, -0.5, 0.5, 0.5,
-4.08193, -3.961447, -4, 1, 1.5, 0.5, 0.5,
-4.08193, -3.961447, -4, 0, 1.5, 0.5, 0.5,
-4.08193, -3.961447, -2, 0, -0.5, 0.5, 0.5,
-4.08193, -3.961447, -2, 1, -0.5, 0.5, 0.5,
-4.08193, -3.961447, -2, 1, 1.5, 0.5, 0.5,
-4.08193, -3.961447, -2, 0, 1.5, 0.5, 0.5,
-4.08193, -3.961447, 0, 0, -0.5, 0.5, 0.5,
-4.08193, -3.961447, 0, 1, -0.5, 0.5, 0.5,
-4.08193, -3.961447, 0, 1, 1.5, 0.5, 0.5,
-4.08193, -3.961447, 0, 0, 1.5, 0.5, 0.5,
-4.08193, -3.961447, 2, 0, -0.5, 0.5, 0.5,
-4.08193, -3.961447, 2, 1, -0.5, 0.5, 0.5,
-4.08193, -3.961447, 2, 1, 1.5, 0.5, 0.5,
-4.08193, -3.961447, 2, 0, 1.5, 0.5, 0.5,
-4.08193, -3.961447, 4, 0, -0.5, 0.5, 0.5,
-4.08193, -3.961447, 4, 1, -0.5, 0.5, 0.5,
-4.08193, -3.961447, 4, 1, 1.5, 0.5, 0.5,
-4.08193, -3.961447, 4, 0, 1.5, 0.5, 0.5
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
-3.578203, -3.428481, -5.363303,
-3.578203, 3.677736, -5.363303,
-3.578203, -3.428481, 5.583394,
-3.578203, 3.677736, 5.583394,
-3.578203, -3.428481, -5.363303,
-3.578203, -3.428481, 5.583394,
-3.578203, 3.677736, -5.363303,
-3.578203, 3.677736, 5.583394,
-3.578203, -3.428481, -5.363303,
3.138165, -3.428481, -5.363303,
-3.578203, -3.428481, 5.583394,
3.138165, -3.428481, 5.583394,
-3.578203, 3.677736, -5.363303,
3.138165, 3.677736, -5.363303,
-3.578203, 3.677736, 5.583394,
3.138165, 3.677736, 5.583394,
3.138165, -3.428481, -5.363303,
3.138165, 3.677736, -5.363303,
3.138165, -3.428481, 5.583394,
3.138165, 3.677736, 5.583394,
3.138165, -3.428481, -5.363303,
3.138165, -3.428481, 5.583394,
3.138165, 3.677736, -5.363303,
3.138165, 3.677736, 5.583394
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
var radius = 7.837665;
var distance = 34.87066;
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
mvMatrix.translate( 0.2200189, -0.1246274, -0.1100457 );
mvMatrix.scale( 1.261729, 1.19251, 0.7741365 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.87066);
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
secbumeton<-read.table("secbumeton.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-secbumeton$V2
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
```

```r
y<-secbumeton$V3
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
```

```r
z<-secbumeton$V4
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
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
-3.480392, -0.381737, -1.721166, 0, 0, 1, 1, 1,
-3.329458, 1.511582, -1.016032, 1, 0, 0, 1, 1,
-3.084316, 0.1666142, -0.9159535, 1, 0, 0, 1, 1,
-2.850962, -2.021635, -2.407064, 1, 0, 0, 1, 1,
-2.832182, 1.454025, -1.91869, 1, 0, 0, 1, 1,
-2.63846, -2.427828, -3.175668, 1, 0, 0, 1, 1,
-2.576391, -0.1455066, -0.8080066, 0, 0, 0, 1, 1,
-2.417966, 0.6933277, -0.2338101, 0, 0, 0, 1, 1,
-2.290108, -1.17352, -5.077806, 0, 0, 0, 1, 1,
-2.248979, -0.07778779, -2.209563, 0, 0, 0, 1, 1,
-2.23342, -1.007438, -2.16911, 0, 0, 0, 1, 1,
-2.194425, -0.7982172, -3.616489, 0, 0, 0, 1, 1,
-2.177068, -1.301963, -0.2623342, 0, 0, 0, 1, 1,
-2.169395, -0.07173775, -0.3368068, 1, 1, 1, 1, 1,
-2.146708, 0.8077312, -0.7651207, 1, 1, 1, 1, 1,
-2.142782, -1.3033, -2.347427, 1, 1, 1, 1, 1,
-2.097555, 1.860917, -1.109456, 1, 1, 1, 1, 1,
-2.066743, -0.6847336, -3.195539, 1, 1, 1, 1, 1,
-2.054015, 1.253905, -2.295749, 1, 1, 1, 1, 1,
-2.016374, -0.1049766, -0.2368518, 1, 1, 1, 1, 1,
-1.991318, 0.6726093, 0.1761134, 1, 1, 1, 1, 1,
-1.980587, -1.21024, -2.224116, 1, 1, 1, 1, 1,
-1.97403, -0.661796, -1.555025, 1, 1, 1, 1, 1,
-1.971572, 0.911432, -2.185148, 1, 1, 1, 1, 1,
-1.958366, 0.4205275, -1.693231, 1, 1, 1, 1, 1,
-1.956396, -0.2896489, -1.068445, 1, 1, 1, 1, 1,
-1.948824, 0.2400569, -0.04352813, 1, 1, 1, 1, 1,
-1.940666, -2.144646, -3.029221, 1, 1, 1, 1, 1,
-1.910608, -0.9213993, -3.096575, 0, 0, 1, 1, 1,
-1.907686, 0.9429612, -0.5607935, 1, 0, 0, 1, 1,
-1.902562, 1.68314, -1.898543, 1, 0, 0, 1, 1,
-1.869485, -0.5150471, -1.241398, 1, 0, 0, 1, 1,
-1.869164, 1.567229, -0.672069, 1, 0, 0, 1, 1,
-1.850277, 1.512421, 0.3684405, 1, 0, 0, 1, 1,
-1.843794, 1.169746, -1.005022, 0, 0, 0, 1, 1,
-1.83739, -0.2216432, -1.352184, 0, 0, 0, 1, 1,
-1.826631, -0.4594065, -4.0869, 0, 0, 0, 1, 1,
-1.812015, 0.648632, 0.1806977, 0, 0, 0, 1, 1,
-1.808907, 0.5451435, -0.9377084, 0, 0, 0, 1, 1,
-1.805258, 0.07329322, -1.959935, 0, 0, 0, 1, 1,
-1.793999, -0.4474764, -2.962135, 0, 0, 0, 1, 1,
-1.792421, -0.4724587, -3.943446, 1, 1, 1, 1, 1,
-1.78907, -0.2518978, 0.1185849, 1, 1, 1, 1, 1,
-1.764434, -0.7263622, -2.342656, 1, 1, 1, 1, 1,
-1.75056, -0.4905771, -1.900964, 1, 1, 1, 1, 1,
-1.731723, 0.9937406, -1.081535, 1, 1, 1, 1, 1,
-1.729583, -0.606279, -1.879328, 1, 1, 1, 1, 1,
-1.720651, 0.6943899, -0.4000025, 1, 1, 1, 1, 1,
-1.71163, 0.1172917, -3.29773, 1, 1, 1, 1, 1,
-1.697177, -0.8929392, -2.230495, 1, 1, 1, 1, 1,
-1.692392, -0.6979679, -1.9897, 1, 1, 1, 1, 1,
-1.680802, 0.4044235, -0.5648218, 1, 1, 1, 1, 1,
-1.654039, -0.06037347, -2.218948, 1, 1, 1, 1, 1,
-1.628555, 2.230442, -1.32315, 1, 1, 1, 1, 1,
-1.624138, -0.8054276, -4.084545, 1, 1, 1, 1, 1,
-1.613158, 0.7628676, -1.805624, 1, 1, 1, 1, 1,
-1.611271, 0.1366185, -0.8884466, 0, 0, 1, 1, 1,
-1.607882, 0.2699962, -0.5771074, 1, 0, 0, 1, 1,
-1.580348, 0.8720105, -2.080186, 1, 0, 0, 1, 1,
-1.579742, -1.308053, -3.029932, 1, 0, 0, 1, 1,
-1.568693, -0.9856955, -1.66383, 1, 0, 0, 1, 1,
-1.568034, 1.293268, -0.9786964, 1, 0, 0, 1, 1,
-1.564219, 0.9081156, -2.437273, 0, 0, 0, 1, 1,
-1.552351, 1.409122, -0.7050034, 0, 0, 0, 1, 1,
-1.542255, -1.501373, -2.28893, 0, 0, 0, 1, 1,
-1.533475, -0.6208932, -2.078061, 0, 0, 0, 1, 1,
-1.531773, 0.3657947, -1.785599, 0, 0, 0, 1, 1,
-1.516561, -1.174147, -4.257676, 0, 0, 0, 1, 1,
-1.516463, 2.041016, -2.333093, 0, 0, 0, 1, 1,
-1.511583, -0.1570334, -0.6908259, 1, 1, 1, 1, 1,
-1.50284, -0.1702865, -0.9371747, 1, 1, 1, 1, 1,
-1.497709, 1.181908, -1.806535, 1, 1, 1, 1, 1,
-1.494253, 0.6318, -0.1643421, 1, 1, 1, 1, 1,
-1.491975, -1.497014, -1.394127, 1, 1, 1, 1, 1,
-1.487084, 1.786613, 0.6403766, 1, 1, 1, 1, 1,
-1.484542, 0.008649463, -1.31167, 1, 1, 1, 1, 1,
-1.454562, 0.6788244, -1.153488, 1, 1, 1, 1, 1,
-1.445986, 1.118477, -4.238963, 1, 1, 1, 1, 1,
-1.44346, -0.9766841, -2.301432, 1, 1, 1, 1, 1,
-1.432627, -1.008676, -2.007035, 1, 1, 1, 1, 1,
-1.42784, -0.008983728, -1.960656, 1, 1, 1, 1, 1,
-1.418344, -1.260863, -1.941718, 1, 1, 1, 1, 1,
-1.411545, 0.817216, -1.931282, 1, 1, 1, 1, 1,
-1.394696, -1.787078, -3.318308, 1, 1, 1, 1, 1,
-1.37861, 0.07057624, -2.060478, 0, 0, 1, 1, 1,
-1.377386, 1.525027, -0.09425601, 1, 0, 0, 1, 1,
-1.375628, -0.2647333, -2.664752, 1, 0, 0, 1, 1,
-1.374994, 0.0846149, -2.343453, 1, 0, 0, 1, 1,
-1.371845, -0.7782143, -2.241478, 1, 0, 0, 1, 1,
-1.371731, 0.9742867, -1.699015, 1, 0, 0, 1, 1,
-1.360459, -0.6365977, -1.519829, 0, 0, 0, 1, 1,
-1.348863, 0.9713374, -0.1967862, 0, 0, 0, 1, 1,
-1.340542, 0.1935912, -0.6259336, 0, 0, 0, 1, 1,
-1.339875, 1.33577, -1.205852, 0, 0, 0, 1, 1,
-1.337254, 1.111542, -0.9849046, 0, 0, 0, 1, 1,
-1.330656, -1.46799, -0.9500772, 0, 0, 0, 1, 1,
-1.326526, 0.5936767, -0.5760882, 0, 0, 0, 1, 1,
-1.31504, 0.4220769, -1.06896, 1, 1, 1, 1, 1,
-1.313384, -0.2351838, -0.7772384, 1, 1, 1, 1, 1,
-1.312116, 0.334682, -0.7715747, 1, 1, 1, 1, 1,
-1.305445, 0.3330901, -1.58803, 1, 1, 1, 1, 1,
-1.305441, -0.0677794, -1.953588, 1, 1, 1, 1, 1,
-1.299912, 0.6412368, -0.1438479, 1, 1, 1, 1, 1,
-1.288818, 1.658004, -1.495045, 1, 1, 1, 1, 1,
-1.276296, -1.388557, -2.314451, 1, 1, 1, 1, 1,
-1.265958, -0.2357139, -1.068817, 1, 1, 1, 1, 1,
-1.243534, -0.533136, -1.195938, 1, 1, 1, 1, 1,
-1.234815, 0.133755, -0.9949697, 1, 1, 1, 1, 1,
-1.232232, -0.1064771, -2.333638, 1, 1, 1, 1, 1,
-1.229244, -0.04341309, -2.666913, 1, 1, 1, 1, 1,
-1.228929, 1.445056, 1.519661, 1, 1, 1, 1, 1,
-1.226189, 0.02570763, -3.380206, 1, 1, 1, 1, 1,
-1.220387, -1.807365, -2.576257, 0, 0, 1, 1, 1,
-1.220236, -0.6545368, -0.7014738, 1, 0, 0, 1, 1,
-1.220198, -0.3705457, -1.585921, 1, 0, 0, 1, 1,
-1.215062, -1.335963, -2.787188, 1, 0, 0, 1, 1,
-1.213601, -0.639427, -1.885183, 1, 0, 0, 1, 1,
-1.20899, -0.8646132, -1.759679, 1, 0, 0, 1, 1,
-1.195912, -1.514596, -1.50225, 0, 0, 0, 1, 1,
-1.192363, 0.151512, -2.537769, 0, 0, 0, 1, 1,
-1.184341, -0.6812619, -4.221664, 0, 0, 0, 1, 1,
-1.18321, -0.1573891, -1.629993, 0, 0, 0, 1, 1,
-1.181683, 1.397773, -0.9572878, 0, 0, 0, 1, 1,
-1.17359, -1.182568, -2.055, 0, 0, 0, 1, 1,
-1.173396, 1.474814, -0.2218872, 0, 0, 0, 1, 1,
-1.151633, -1.125213, -1.774444, 1, 1, 1, 1, 1,
-1.145909, 0.3088346, 0.9341933, 1, 1, 1, 1, 1,
-1.141576, -0.1717241, -1.512719, 1, 1, 1, 1, 1,
-1.138035, -0.2121806, -2.47651, 1, 1, 1, 1, 1,
-1.132826, 0.1416413, -2.848939, 1, 1, 1, 1, 1,
-1.129033, 1.630438, 0.147636, 1, 1, 1, 1, 1,
-1.126939, -0.9177907, -2.603401, 1, 1, 1, 1, 1,
-1.124299, 0.2944266, -1.705847, 1, 1, 1, 1, 1,
-1.122652, -1.771286, -2.934585, 1, 1, 1, 1, 1,
-1.120558, -0.09993836, -1.477591, 1, 1, 1, 1, 1,
-1.118354, -1.143281, -3.056496, 1, 1, 1, 1, 1,
-1.113645, 0.4051687, -1.025244, 1, 1, 1, 1, 1,
-1.10906, -0.415294, -1.988179, 1, 1, 1, 1, 1,
-1.103199, 0.1162067, -1.306417, 1, 1, 1, 1, 1,
-1.099272, 1.722015, 0.1741876, 1, 1, 1, 1, 1,
-1.094497, -0.1738681, -3.967463, 0, 0, 1, 1, 1,
-1.090521, -0.9827023, -3.512881, 1, 0, 0, 1, 1,
-1.08488, -0.2304283, -2.692172, 1, 0, 0, 1, 1,
-1.083428, 0.3254249, -1.943395, 1, 0, 0, 1, 1,
-1.065105, 1.342257, 0.2891811, 1, 0, 0, 1, 1,
-1.064602, 0.5507851, -1.09161, 1, 0, 0, 1, 1,
-1.050892, 1.107662, -0.1488184, 0, 0, 0, 1, 1,
-1.050522, 0.6202198, -2.285016, 0, 0, 0, 1, 1,
-1.03784, -2.902552, -3.426575, 0, 0, 0, 1, 1,
-1.035546, 0.1821472, -1.225621, 0, 0, 0, 1, 1,
-1.034224, 0.2079933, -1.52762, 0, 0, 0, 1, 1,
-1.023439, 0.8146334, 0.3929997, 0, 0, 0, 1, 1,
-1.01985, -1.487512, -1.673369, 0, 0, 0, 1, 1,
-1.013311, 0.3730787, -0.5390666, 1, 1, 1, 1, 1,
-1.010432, 1.673587, 2.294211, 1, 1, 1, 1, 1,
-0.9920369, -0.06628563, -0.07542697, 1, 1, 1, 1, 1,
-0.9790737, -3.056241, -4.242651, 1, 1, 1, 1, 1,
-0.9746304, -0.4344481, -4.334569, 1, 1, 1, 1, 1,
-0.9736961, -0.2253525, -0.8299916, 1, 1, 1, 1, 1,
-0.9702138, 1.062361, 0.2293747, 1, 1, 1, 1, 1,
-0.9700289, 1.160749, 0.2162401, 1, 1, 1, 1, 1,
-0.9693466, -1.808197, -3.230727, 1, 1, 1, 1, 1,
-0.949402, 0.3075144, -0.5874525, 1, 1, 1, 1, 1,
-0.9485917, 1.243354, -1.365955, 1, 1, 1, 1, 1,
-0.9390499, 0.9220701, -0.4592145, 1, 1, 1, 1, 1,
-0.9372917, 0.6320782, -1.966004, 1, 1, 1, 1, 1,
-0.9352583, 0.08782056, -0.6946285, 1, 1, 1, 1, 1,
-0.9330584, 1.793505, 0.2441076, 1, 1, 1, 1, 1,
-0.9276433, 0.2754014, -0.675662, 0, 0, 1, 1, 1,
-0.9257685, 0.6797042, 0.4543343, 1, 0, 0, 1, 1,
-0.9251417, 1.458781, -0.1675278, 1, 0, 0, 1, 1,
-0.9242215, -0.2880461, -1.183114, 1, 0, 0, 1, 1,
-0.9153037, 0.3416089, 0.9585351, 1, 0, 0, 1, 1,
-0.9151646, -0.4607405, -3.87861, 1, 0, 0, 1, 1,
-0.9122546, 0.5262205, 0.09108795, 0, 0, 0, 1, 1,
-0.9039217, 1.699064, -1.429079, 0, 0, 0, 1, 1,
-0.8914483, 0.961928, -1.162149, 0, 0, 0, 1, 1,
-0.8878021, -1.772663, -3.068139, 0, 0, 0, 1, 1,
-0.8877145, -0.3603531, -2.402501, 0, 0, 0, 1, 1,
-0.8854815, 1.264793, -0.7099146, 0, 0, 0, 1, 1,
-0.872924, -0.5042138, -3.066318, 0, 0, 0, 1, 1,
-0.8717218, 1.215658, 0.6071295, 1, 1, 1, 1, 1,
-0.8698806, -1.898651, -4.497819, 1, 1, 1, 1, 1,
-0.8681266, 1.212522, -1.403004, 1, 1, 1, 1, 1,
-0.8676785, 0.0847486, -0.731987, 1, 1, 1, 1, 1,
-0.8652766, -0.03163882, -2.109165, 1, 1, 1, 1, 1,
-0.862241, 0.5967904, -0.2638892, 1, 1, 1, 1, 1,
-0.8611053, -0.9266087, -3.386187, 1, 1, 1, 1, 1,
-0.8568707, -0.3275373, -1.557174, 1, 1, 1, 1, 1,
-0.8550954, -1.887872, -4.8758, 1, 1, 1, 1, 1,
-0.8490481, -1.493071, -1.297724, 1, 1, 1, 1, 1,
-0.8486102, -0.5764446, -1.597006, 1, 1, 1, 1, 1,
-0.8485803, -1.354356, -3.139927, 1, 1, 1, 1, 1,
-0.8376454, 0.7955276, 0.231069, 1, 1, 1, 1, 1,
-0.8372329, 0.2698855, -0.146952, 1, 1, 1, 1, 1,
-0.83625, -0.761947, -2.131421, 1, 1, 1, 1, 1,
-0.8288841, -1.544074, -2.314512, 0, 0, 1, 1, 1,
-0.8259146, -2.037136, -3.512614, 1, 0, 0, 1, 1,
-0.8212144, 0.4389912, -0.6368849, 1, 0, 0, 1, 1,
-0.8204758, -0.6565463, -0.3365886, 1, 0, 0, 1, 1,
-0.818204, 1.414241, -0.939284, 1, 0, 0, 1, 1,
-0.8153445, 0.911195, -1.525845, 1, 0, 0, 1, 1,
-0.813763, -0.4923295, 0.5854359, 0, 0, 0, 1, 1,
-0.8132315, 0.7964033, -0.9183605, 0, 0, 0, 1, 1,
-0.8112584, -0.07600096, -2.17548, 0, 0, 0, 1, 1,
-0.8097571, -0.5496462, -3.262397, 0, 0, 0, 1, 1,
-0.8034986, 0.5732373, -2.188398, 0, 0, 0, 1, 1,
-0.8023847, -1.407619, -5.163013, 0, 0, 0, 1, 1,
-0.8018194, 0.1116313, -0.4194314, 0, 0, 0, 1, 1,
-0.8009181, -0.7348425, -2.692693, 1, 1, 1, 1, 1,
-0.7993338, 0.9792992, -1.162227, 1, 1, 1, 1, 1,
-0.7984626, -0.1343159, -0.8091567, 1, 1, 1, 1, 1,
-0.7957072, 0.1325165, -0.8012357, 1, 1, 1, 1, 1,
-0.792842, 0.6982976, 0.6149126, 1, 1, 1, 1, 1,
-0.7922727, -2.67214, -2.365181, 1, 1, 1, 1, 1,
-0.7862215, -0.293558, -1.651051, 1, 1, 1, 1, 1,
-0.7827812, 0.3266513, -1.197202, 1, 1, 1, 1, 1,
-0.775124, 0.4784244, 0.1477752, 1, 1, 1, 1, 1,
-0.7735537, 2.492251, -2.272067, 1, 1, 1, 1, 1,
-0.768656, 2.17605, -1.628312, 1, 1, 1, 1, 1,
-0.7650344, 0.5381469, 0.2410706, 1, 1, 1, 1, 1,
-0.7626621, -0.2008613, -2.745534, 1, 1, 1, 1, 1,
-0.7588192, -0.1646804, -1.753247, 1, 1, 1, 1, 1,
-0.755764, 0.3293077, -0.7173619, 1, 1, 1, 1, 1,
-0.7550001, 0.3535937, -1.220492, 0, 0, 1, 1, 1,
-0.7528271, 0.1226727, -1.36209, 1, 0, 0, 1, 1,
-0.7495609, 0.3865617, -0.3252202, 1, 0, 0, 1, 1,
-0.7470312, 1.132968, -0.2573396, 1, 0, 0, 1, 1,
-0.7440257, -0.9668046, -2.86124, 1, 0, 0, 1, 1,
-0.740522, -0.3567777, -3.220985, 1, 0, 0, 1, 1,
-0.7402261, 0.7841618, -0.427004, 0, 0, 0, 1, 1,
-0.7316102, -0.5299553, -1.474584, 0, 0, 0, 1, 1,
-0.7305763, -0.550089, -1.384698, 0, 0, 0, 1, 1,
-0.7287909, 1.091946, -2.386977, 0, 0, 0, 1, 1,
-0.7276741, 0.1744758, -0.08176533, 0, 0, 0, 1, 1,
-0.7261155, -0.9486678, -2.47487, 0, 0, 0, 1, 1,
-0.7252312, 1.814995, 0.3128124, 0, 0, 0, 1, 1,
-0.721683, 0.2047616, -2.353702, 1, 1, 1, 1, 1,
-0.7212123, -0.1266568, -3.08615, 1, 1, 1, 1, 1,
-0.7202049, -1.435211, -1.980718, 1, 1, 1, 1, 1,
-0.7132812, -1.752436, -1.169682, 1, 1, 1, 1, 1,
-0.7108425, 0.3240758, -3.04833, 1, 1, 1, 1, 1,
-0.7091673, 0.008488263, -0.1815139, 1, 1, 1, 1, 1,
-0.7037991, 1.548253, 1.028892, 1, 1, 1, 1, 1,
-0.6945067, -0.3501534, -2.483481, 1, 1, 1, 1, 1,
-0.6917125, -0.4434494, -2.745437, 1, 1, 1, 1, 1,
-0.6854333, 0.7591612, -1.821943, 1, 1, 1, 1, 1,
-0.6841578, 2.022674, 0.3554474, 1, 1, 1, 1, 1,
-0.6736922, 1.070292, -1.866642, 1, 1, 1, 1, 1,
-0.6723918, 1.279114, 0.4793177, 1, 1, 1, 1, 1,
-0.6706887, -1.417809, -3.543329, 1, 1, 1, 1, 1,
-0.6683162, 0.8410819, 1.013263, 1, 1, 1, 1, 1,
-0.6664221, 1.593055, -0.1027792, 0, 0, 1, 1, 1,
-0.6655239, 1.011099, -0.8415163, 1, 0, 0, 1, 1,
-0.6558562, -1.759381, -2.801917, 1, 0, 0, 1, 1,
-0.6518127, 0.8425322, -1.047211, 1, 0, 0, 1, 1,
-0.6484879, -1.005617, -1.09555, 1, 0, 0, 1, 1,
-0.6460051, 0.6319277, 0.8463648, 1, 0, 0, 1, 1,
-0.6423824, -0.987316, -2.817455, 0, 0, 0, 1, 1,
-0.6422782, 0.6140202, -1.623674, 0, 0, 0, 1, 1,
-0.639699, -0.7958792, -2.601282, 0, 0, 0, 1, 1,
-0.6357105, 1.277498, -0.4617282, 0, 0, 0, 1, 1,
-0.6316852, -0.4802447, -2.63994, 0, 0, 0, 1, 1,
-0.6298745, -0.7028139, -1.534659, 0, 0, 0, 1, 1,
-0.627501, 2.529208, -0.4813922, 0, 0, 0, 1, 1,
-0.6213013, -0.1849618, -0.6645521, 1, 1, 1, 1, 1,
-0.6198606, 0.8029482, -0.4706125, 1, 1, 1, 1, 1,
-0.616041, 0.8422936, -1.575981, 1, 1, 1, 1, 1,
-0.6151354, -0.3874612, -3.818909, 1, 1, 1, 1, 1,
-0.6145588, -1.301833, -2.594493, 1, 1, 1, 1, 1,
-0.6136901, -0.720862, 0.2566139, 1, 1, 1, 1, 1,
-0.610254, -0.7843334, -2.062874, 1, 1, 1, 1, 1,
-0.6066016, 2.638187, -0.3248418, 1, 1, 1, 1, 1,
-0.6050522, 0.1287012, -2.93721, 1, 1, 1, 1, 1,
-0.6047933, -0.2170301, -1.199711, 1, 1, 1, 1, 1,
-0.6047143, 0.6873842, 0.6549289, 1, 1, 1, 1, 1,
-0.5999353, 0.9577262, -1.494274, 1, 1, 1, 1, 1,
-0.5984959, 1.273392, -0.9391468, 1, 1, 1, 1, 1,
-0.5965217, 0.6198431, -0.2418851, 1, 1, 1, 1, 1,
-0.5936628, 0.2213459, -1.131873, 1, 1, 1, 1, 1,
-0.5916841, 1.705286, 0.01256743, 0, 0, 1, 1, 1,
-0.5879977, -1.417681, -3.326368, 1, 0, 0, 1, 1,
-0.5870798, 0.7871312, -1.271209, 1, 0, 0, 1, 1,
-0.5734356, -0.08567207, -3.986997, 1, 0, 0, 1, 1,
-0.5724235, -0.5930101, -3.186999, 1, 0, 0, 1, 1,
-0.5719652, 1.297511, 0.05367601, 1, 0, 0, 1, 1,
-0.5711414, 1.415274, 1.183727, 0, 0, 0, 1, 1,
-0.5671189, -0.4708132, -1.104657, 0, 0, 0, 1, 1,
-0.5645881, -0.3489375, -2.614736, 0, 0, 0, 1, 1,
-0.5638511, -0.9998175, -1.909649, 0, 0, 0, 1, 1,
-0.5621846, -0.9229535, -2.63652, 0, 0, 0, 1, 1,
-0.5611706, -0.808768, -2.827131, 0, 0, 0, 1, 1,
-0.559611, -1.122762, -3.448384, 0, 0, 0, 1, 1,
-0.5590209, -0.6056014, -3.101314, 1, 1, 1, 1, 1,
-0.5585035, 0.7528324, -4.061974, 1, 1, 1, 1, 1,
-0.5584546, -0.5022126, -1.889151, 1, 1, 1, 1, 1,
-0.5528834, 0.05533037, -2.229766, 1, 1, 1, 1, 1,
-0.5508353, 1.503196, 0.29103, 1, 1, 1, 1, 1,
-0.5444258, -0.7311559, -2.46571, 1, 1, 1, 1, 1,
-0.5437257, -0.1209597, 0.1507176, 1, 1, 1, 1, 1,
-0.5355728, -0.03267431, -1.722078, 1, 1, 1, 1, 1,
-0.5295458, -0.1731917, -1.239428, 1, 1, 1, 1, 1,
-0.5260845, 0.03322861, -2.023302, 1, 1, 1, 1, 1,
-0.5224679, -0.244186, -0.7717771, 1, 1, 1, 1, 1,
-0.5191347, -0.114809, -2.363277, 1, 1, 1, 1, 1,
-0.5181785, 0.07522647, -0.07404152, 1, 1, 1, 1, 1,
-0.5119838, -0.7404809, -1.931887, 1, 1, 1, 1, 1,
-0.5114775, 0.8268912, -0.3270549, 1, 1, 1, 1, 1,
-0.5091658, -1.439094, -3.069591, 0, 0, 1, 1, 1,
-0.5051083, 2.251131, -0.750255, 1, 0, 0, 1, 1,
-0.4985396, -1.750701, -2.992535, 1, 0, 0, 1, 1,
-0.4965794, 1.512521, -1.467512, 1, 0, 0, 1, 1,
-0.4942906, 1.088233, -1.516521, 1, 0, 0, 1, 1,
-0.4922924, -0.4288941, -2.919669, 1, 0, 0, 1, 1,
-0.4858846, -1.765898, -2.429029, 0, 0, 0, 1, 1,
-0.4822039, -1.362308, -2.441626, 0, 0, 0, 1, 1,
-0.4760585, -0.9500276, -2.642209, 0, 0, 0, 1, 1,
-0.46718, 1.265468, -1.539298, 0, 0, 0, 1, 1,
-0.4546289, 1.227323, -0.446308, 0, 0, 0, 1, 1,
-0.453369, -1.271945, -3.302776, 0, 0, 0, 1, 1,
-0.4503224, 0.7931166, -1.086763, 0, 0, 0, 1, 1,
-0.4491366, -2.739022, -2.295358, 1, 1, 1, 1, 1,
-0.4485357, -0.09050769, -1.457862, 1, 1, 1, 1, 1,
-0.4450448, -0.7294734, -3.513968, 1, 1, 1, 1, 1,
-0.4388438, 3.563582, -1.428322, 1, 1, 1, 1, 1,
-0.4369971, -0.900892, -4.881168, 1, 1, 1, 1, 1,
-0.432238, -0.3183273, -1.969488, 1, 1, 1, 1, 1,
-0.4321578, -0.4299628, -2.060097, 1, 1, 1, 1, 1,
-0.4290455, 0.2510239, -1.111227, 1, 1, 1, 1, 1,
-0.4239862, -0.9109063, -1.649246, 1, 1, 1, 1, 1,
-0.4238755, 1.354616, 0.8413703, 1, 1, 1, 1, 1,
-0.4192914, -0.04455538, -1.780307, 1, 1, 1, 1, 1,
-0.4185842, 0.8424032, -0.6974515, 1, 1, 1, 1, 1,
-0.4115443, -0.5770586, -2.404989, 1, 1, 1, 1, 1,
-0.411429, -0.6377606, -3.170348, 1, 1, 1, 1, 1,
-0.411056, -0.3441123, -0.6515936, 1, 1, 1, 1, 1,
-0.4088762, 0.04076862, -2.140135, 0, 0, 1, 1, 1,
-0.4079119, 0.1355952, -1.239684, 1, 0, 0, 1, 1,
-0.4058482, 1.691644, 0.9722957, 1, 0, 0, 1, 1,
-0.402702, 1.075294, -0.7874927, 1, 0, 0, 1, 1,
-0.3976176, -0.859086, -2.315816, 1, 0, 0, 1, 1,
-0.3887991, -0.8643113, -3.113948, 1, 0, 0, 1, 1,
-0.3885822, 1.09331, -0.4338523, 0, 0, 0, 1, 1,
-0.3873362, 1.546077, -0.4651189, 0, 0, 0, 1, 1,
-0.3872747, 1.362587, -0.6882582, 0, 0, 0, 1, 1,
-0.3855236, -0.8596865, -1.660499, 0, 0, 0, 1, 1,
-0.3821911, 1.660214, -1.04423, 0, 0, 0, 1, 1,
-0.3787196, 0.5634813, 1.332628, 0, 0, 0, 1, 1,
-0.378599, 2.064792, -0.8091637, 0, 0, 0, 1, 1,
-0.3770099, -0.6295287, -2.529545, 1, 1, 1, 1, 1,
-0.3734154, -0.616379, -1.929504, 1, 1, 1, 1, 1,
-0.3708017, -2.045362, -3.215652, 1, 1, 1, 1, 1,
-0.3686616, -1.039629, -3.274235, 1, 1, 1, 1, 1,
-0.3662076, -0.3935607, -3.80238, 1, 1, 1, 1, 1,
-0.3636299, 2.37542, -1.422849, 1, 1, 1, 1, 1,
-0.3612191, 0.3249682, -0.7572439, 1, 1, 1, 1, 1,
-0.3609784, -0.3252312, -1.956802, 1, 1, 1, 1, 1,
-0.3516751, -0.7023711, -2.969396, 1, 1, 1, 1, 1,
-0.344869, 0.5345668, 1.131036, 1, 1, 1, 1, 1,
-0.3435107, 0.5119932, -0.09185623, 1, 1, 1, 1, 1,
-0.3420341, -0.5971819, -1.328245, 1, 1, 1, 1, 1,
-0.3395251, -0.6950364, -1.805661, 1, 1, 1, 1, 1,
-0.339199, -0.1030037, -3.025076, 1, 1, 1, 1, 1,
-0.3284696, -0.127786, -2.327068, 1, 1, 1, 1, 1,
-0.3268553, 0.6002163, 0.01942174, 0, 0, 1, 1, 1,
-0.3211231, -0.1268373, -1.720531, 1, 0, 0, 1, 1,
-0.3122486, -0.5574049, -3.596254, 1, 0, 0, 1, 1,
-0.3091834, 0.457436, -1.092319, 1, 0, 0, 1, 1,
-0.3037725, -0.08146112, -2.351906, 1, 0, 0, 1, 1,
-0.3022916, -1.762586, -4.515703, 1, 0, 0, 1, 1,
-0.2995397, -0.9197969, -2.633202, 0, 0, 0, 1, 1,
-0.2977122, -1.280028, -4.271571, 0, 0, 0, 1, 1,
-0.2946912, 0.5651037, -0.58556, 0, 0, 0, 1, 1,
-0.2931573, -0.4386586, -0.8654664, 0, 0, 0, 1, 1,
-0.2913564, 0.9067951, 1.502095, 0, 0, 0, 1, 1,
-0.2912323, -0.9899461, -2.675285, 0, 0, 0, 1, 1,
-0.2842801, -3.02059, -1.939626, 0, 0, 0, 1, 1,
-0.2836897, -0.1002898, -1.17744, 1, 1, 1, 1, 1,
-0.2822008, 1.034551, 0.4534253, 1, 1, 1, 1, 1,
-0.2815646, -1.685641, -3.180951, 1, 1, 1, 1, 1,
-0.2793209, -0.03361842, -2.082269, 1, 1, 1, 1, 1,
-0.278147, -0.07111397, -2.347497, 1, 1, 1, 1, 1,
-0.2743021, 0.1125689, -0.3822044, 1, 1, 1, 1, 1,
-0.2709644, 0.1480815, -1.263636, 1, 1, 1, 1, 1,
-0.2663086, -0.6717063, -3.016003, 1, 1, 1, 1, 1,
-0.262517, -0.03879867, -0.5150237, 1, 1, 1, 1, 1,
-0.2609509, 0.5346495, -1.546976, 1, 1, 1, 1, 1,
-0.259935, -0.4193098, -3.313466, 1, 1, 1, 1, 1,
-0.2585385, 0.1082324, 0.01206523, 1, 1, 1, 1, 1,
-0.257127, -0.7289927, -1.55996, 1, 1, 1, 1, 1,
-0.2570403, 2.194509, -0.9801738, 1, 1, 1, 1, 1,
-0.2567734, -0.795157, -2.809034, 1, 1, 1, 1, 1,
-0.2562635, 0.2000551, -1.285323, 0, 0, 1, 1, 1,
-0.254264, 0.4098172, -0.7515682, 1, 0, 0, 1, 1,
-0.2531114, 0.2716877, -0.02328651, 1, 0, 0, 1, 1,
-0.2489384, 0.1729245, -1.118414, 1, 0, 0, 1, 1,
-0.242765, -2.295229, -2.383623, 1, 0, 0, 1, 1,
-0.2413169, 1.521965, 0.8256057, 1, 0, 0, 1, 1,
-0.2401737, 0.4423552, -1.645137, 0, 0, 0, 1, 1,
-0.2368228, -0.8819981, -2.43535, 0, 0, 0, 1, 1,
-0.2362162, -0.9834753, -1.986326, 0, 0, 0, 1, 1,
-0.2350774, 0.4999925, -1.134107, 0, 0, 0, 1, 1,
-0.2337543, 0.002670444, -2.880087, 0, 0, 0, 1, 1,
-0.2286961, 0.3475335, -2.125255, 0, 0, 0, 1, 1,
-0.2285397, 0.5206674, 0.3319337, 0, 0, 0, 1, 1,
-0.2283584, -0.7303159, -2.724751, 1, 1, 1, 1, 1,
-0.2279746, -0.3331591, -2.845984, 1, 1, 1, 1, 1,
-0.2138273, -0.9020193, -2.778555, 1, 1, 1, 1, 1,
-0.2131058, -0.6939406, -1.308914, 1, 1, 1, 1, 1,
-0.2118085, 0.4670798, -0.8133146, 1, 1, 1, 1, 1,
-0.2112991, 0.8130635, -1.313414, 1, 1, 1, 1, 1,
-0.1968621, -0.5682335, -3.360357, 1, 1, 1, 1, 1,
-0.1937376, -0.9325898, -3.364326, 1, 1, 1, 1, 1,
-0.1924176, -0.313269, -2.366613, 1, 1, 1, 1, 1,
-0.1922237, -1.601361, -3.666948, 1, 1, 1, 1, 1,
-0.1889302, 0.9352708, -0.2638475, 1, 1, 1, 1, 1,
-0.1888244, -0.8932082, -2.812788, 1, 1, 1, 1, 1,
-0.1865571, 2.302341, -0.4879677, 1, 1, 1, 1, 1,
-0.1864011, 0.3327123, -1.464125, 1, 1, 1, 1, 1,
-0.1854673, 0.3925676, 0.8907672, 1, 1, 1, 1, 1,
-0.1841374, 1.036091, -0.7062559, 0, 0, 1, 1, 1,
-0.1798604, -1.663962, -2.835048, 1, 0, 0, 1, 1,
-0.17947, 0.3239354, -0.5938189, 1, 0, 0, 1, 1,
-0.1773773, -2.13207, -4.056782, 1, 0, 0, 1, 1,
-0.1714576, 1.591763, -1.329224, 1, 0, 0, 1, 1,
-0.1665606, -0.2690082, -0.5246693, 1, 0, 0, 1, 1,
-0.1640386, 0.2153433, -0.7773885, 0, 0, 0, 1, 1,
-0.1581041, 1.15959, 0.2713861, 0, 0, 0, 1, 1,
-0.1571911, -0.04606857, -2.481752, 0, 0, 0, 1, 1,
-0.1570307, 0.3476398, 0.3400533, 0, 0, 0, 1, 1,
-0.1551928, -1.161242, -4.157094, 0, 0, 0, 1, 1,
-0.1487606, 1.151067, -1.532861, 0, 0, 0, 1, 1,
-0.148173, 0.1230768, -2.305282, 0, 0, 0, 1, 1,
-0.1446369, -1.019762, -3.366929, 1, 1, 1, 1, 1,
-0.1441744, 0.8381895, -0.6493862, 1, 1, 1, 1, 1,
-0.1422325, -1.197249, -1.636156, 1, 1, 1, 1, 1,
-0.138769, -0.6847765, -5.203885, 1, 1, 1, 1, 1,
-0.1384346, 1.205899, -0.1140591, 1, 1, 1, 1, 1,
-0.1378669, -1.474139, -3.874963, 1, 1, 1, 1, 1,
-0.1348837, -1.070818, -3.680921, 1, 1, 1, 1, 1,
-0.1259224, 1.27304, -0.6003968, 1, 1, 1, 1, 1,
-0.1254177, -1.051369, -2.792688, 1, 1, 1, 1, 1,
-0.1243618, 0.6868229, -1.149972, 1, 1, 1, 1, 1,
-0.1241192, -0.3750596, -3.171261, 1, 1, 1, 1, 1,
-0.1215049, -0.6649639, -3.488162, 1, 1, 1, 1, 1,
-0.1167906, 0.2880595, -2.023252, 1, 1, 1, 1, 1,
-0.1157022, 0.3076731, 0.07685568, 1, 1, 1, 1, 1,
-0.1154951, -1.441306, -2.517864, 1, 1, 1, 1, 1,
-0.1027044, 0.9169333, -0.3215135, 0, 0, 1, 1, 1,
-0.09800752, 1.15042, -1.273804, 1, 0, 0, 1, 1,
-0.09794587, -0.1603896, -1.539338, 1, 0, 0, 1, 1,
-0.09790729, -1.016516, -2.53593, 1, 0, 0, 1, 1,
-0.09453356, -1.049917, -2.153311, 1, 0, 0, 1, 1,
-0.09453298, 0.5415633, -0.5514406, 1, 0, 0, 1, 1,
-0.09315348, 2.273869, 2.078963, 0, 0, 0, 1, 1,
-0.09207405, -0.5284409, -2.855734, 0, 0, 0, 1, 1,
-0.08718573, 0.08597052, -3.556141, 0, 0, 0, 1, 1,
-0.07481216, -3.324992, -3.85548, 0, 0, 0, 1, 1,
-0.07167693, -0.7266067, -3.147972, 0, 0, 0, 1, 1,
-0.06705593, 0.1736592, 1.13363, 0, 0, 0, 1, 1,
-0.06087501, -0.4385659, -3.054405, 0, 0, 0, 1, 1,
-0.06044756, 0.2062416, 0.01235533, 1, 1, 1, 1, 1,
-0.05967614, 0.8744943, 0.3256762, 1, 1, 1, 1, 1,
-0.05841575, 1.367761, -0.06359512, 1, 1, 1, 1, 1,
-0.05817832, 0.1675131, -0.8000637, 1, 1, 1, 1, 1,
-0.05219387, 0.1082263, -1.598121, 1, 1, 1, 1, 1,
-0.05126626, -0.04710865, -1.955749, 1, 1, 1, 1, 1,
-0.0494385, 1.005869, -0.1483981, 1, 1, 1, 1, 1,
-0.04320471, 0.8236357, 1.314811, 1, 1, 1, 1, 1,
-0.0430717, 0.08722615, -0.4506569, 1, 1, 1, 1, 1,
-0.04247886, 2.968073, -1.603484, 1, 1, 1, 1, 1,
-0.04120233, 0.3480106, 0.5745333, 1, 1, 1, 1, 1,
-0.04071919, 0.3651123, -0.04160943, 1, 1, 1, 1, 1,
-0.03865692, -2.533688, -0.4327147, 1, 1, 1, 1, 1,
-0.0364223, 0.9403873, -1.286864, 1, 1, 1, 1, 1,
-0.03435347, -0.7851014, -4.182634, 1, 1, 1, 1, 1,
-0.03371805, -1.174348, -2.228809, 0, 0, 1, 1, 1,
-0.03271535, -0.3138684, -2.546953, 1, 0, 0, 1, 1,
-0.03250467, 0.2201159, 0.03408152, 1, 0, 0, 1, 1,
-0.03189972, -0.1632122, -3.535769, 1, 0, 0, 1, 1,
-0.03000803, -0.09249825, -0.06924763, 1, 0, 0, 1, 1,
-0.02997499, 0.9043581, 0.3443215, 1, 0, 0, 1, 1,
-0.02961826, -0.1050574, -0.7905228, 0, 0, 0, 1, 1,
-0.0274441, -0.244895, -2.09794, 0, 0, 0, 1, 1,
-0.02665103, 0.4776061, 0.04288774, 0, 0, 0, 1, 1,
-0.02539315, 0.06458895, -0.8070535, 0, 0, 0, 1, 1,
-0.01759341, 0.09694532, -0.6496812, 0, 0, 0, 1, 1,
-0.01617957, 0.3435635, -0.1959535, 0, 0, 0, 1, 1,
-0.01372521, 1.207985, -1.027925, 0, 0, 0, 1, 1,
-0.01076872, -0.09686432, -2.707881, 1, 1, 1, 1, 1,
-0.009586159, 0.1735413, -1.027338, 1, 1, 1, 1, 1,
-0.008566423, 0.2784135, -1.682485, 1, 1, 1, 1, 1,
-0.003055789, 0.205708, 1.229122, 1, 1, 1, 1, 1,
0.001157684, -0.02305542, 2.132209, 1, 1, 1, 1, 1,
0.004482359, 0.1715796, -1.678538, 1, 1, 1, 1, 1,
0.007640369, 0.6620089, -1.038245, 1, 1, 1, 1, 1,
0.008947287, 1.357028, 0.0346889, 1, 1, 1, 1, 1,
0.01022638, -0.4446269, 4.865912, 1, 1, 1, 1, 1,
0.01045239, 0.9004751, 1.684819, 1, 1, 1, 1, 1,
0.01578589, 0.7927122, -1.602453, 1, 1, 1, 1, 1,
0.01648452, 0.9334897, 0.6633281, 1, 1, 1, 1, 1,
0.01723544, -0.1471845, 2.63869, 1, 1, 1, 1, 1,
0.01913303, 0.4869874, -0.8259721, 1, 1, 1, 1, 1,
0.01936664, -0.8713762, 2.337864, 1, 1, 1, 1, 1,
0.02210463, -0.2655402, 1.033027, 0, 0, 1, 1, 1,
0.02746326, -1.267414, 3.677851, 1, 0, 0, 1, 1,
0.02899428, 0.307455, 0.264376, 1, 0, 0, 1, 1,
0.02942713, 1.654158, -0.2482113, 1, 0, 0, 1, 1,
0.03096171, -0.3870167, 3.494398, 1, 0, 0, 1, 1,
0.03183158, -0.4771523, 2.498977, 1, 0, 0, 1, 1,
0.03200209, 0.2665752, -0.4142009, 0, 0, 0, 1, 1,
0.03281793, -0.7847035, 4.857979, 0, 0, 0, 1, 1,
0.03503897, -0.1600131, 5.153772, 0, 0, 0, 1, 1,
0.03588882, -0.3785878, 3.159027, 0, 0, 0, 1, 1,
0.03628675, 0.8730916, 0.6449372, 0, 0, 0, 1, 1,
0.03805707, 1.553134, 0.6769889, 0, 0, 0, 1, 1,
0.03895991, 0.5420848, -0.3556605, 0, 0, 0, 1, 1,
0.04456516, -0.2751578, 2.512414, 1, 1, 1, 1, 1,
0.04519476, -0.2165684, 2.887444, 1, 1, 1, 1, 1,
0.04797757, -2.107291, 3.028728, 1, 1, 1, 1, 1,
0.06062623, -1.302641, 2.662208, 1, 1, 1, 1, 1,
0.06090396, -0.5855249, 2.188848, 1, 1, 1, 1, 1,
0.06241985, 1.758865, -0.8384519, 1, 1, 1, 1, 1,
0.06365115, -0.6970862, 1.724452, 1, 1, 1, 1, 1,
0.06562617, 0.4508736, 0.528074, 1, 1, 1, 1, 1,
0.06757008, 1.195696, -1.743927, 1, 1, 1, 1, 1,
0.07265852, 0.481105, 0.6741318, 1, 1, 1, 1, 1,
0.0773212, 1.907769, 0.8537391, 1, 1, 1, 1, 1,
0.07736442, 2.468922, 0.5493413, 1, 1, 1, 1, 1,
0.07745255, -0.1592531, 2.647738, 1, 1, 1, 1, 1,
0.08147828, -0.2913328, 2.524921, 1, 1, 1, 1, 1,
0.08357525, -0.313071, 3.622157, 1, 1, 1, 1, 1,
0.08361057, -1.037072, 3.221052, 0, 0, 1, 1, 1,
0.08478668, 0.4223972, -0.8087827, 1, 0, 0, 1, 1,
0.08885664, 1.373023, -1.930238, 1, 0, 0, 1, 1,
0.08950216, 1.571682, 1.067131, 1, 0, 0, 1, 1,
0.09480046, -1.180187, 3.034216, 1, 0, 0, 1, 1,
0.09828299, -0.512598, 2.76327, 1, 0, 0, 1, 1,
0.1031041, 2.38453, -1.43193, 0, 0, 0, 1, 1,
0.1059144, 0.6759256, -0.4495242, 0, 0, 0, 1, 1,
0.1066279, 0.04015851, 2.4956, 0, 0, 0, 1, 1,
0.1185891, -0.3808923, 3.859607, 0, 0, 0, 1, 1,
0.1199481, 1.287671, -0.8701416, 0, 0, 0, 1, 1,
0.1213148, -1.49269, 2.503572, 0, 0, 0, 1, 1,
0.1243689, -0.1762059, 3.427096, 0, 0, 0, 1, 1,
0.1298931, -1.08473, 3.112725, 1, 1, 1, 1, 1,
0.1305767, 0.3919508, 0.01847508, 1, 1, 1, 1, 1,
0.1352371, -0.163967, 1.53227, 1, 1, 1, 1, 1,
0.1469601, 2.315359, 0.159261, 1, 1, 1, 1, 1,
0.1487519, 0.1129963, 0.05083246, 1, 1, 1, 1, 1,
0.1512523, -0.3648435, 2.801401, 1, 1, 1, 1, 1,
0.151943, 0.8064555, -0.2913908, 1, 1, 1, 1, 1,
0.1543538, -0.4038051, 1.137946, 1, 1, 1, 1, 1,
0.1580399, -1.061437, 3.707098, 1, 1, 1, 1, 1,
0.1586511, -0.4636225, 3.033123, 1, 1, 1, 1, 1,
0.1595963, -0.7231722, 2.437933, 1, 1, 1, 1, 1,
0.164231, -1.163472, 1.543527, 1, 1, 1, 1, 1,
0.1668389, 0.5710263, 2.37329, 1, 1, 1, 1, 1,
0.1730625, 0.823427, 0.8939636, 1, 1, 1, 1, 1,
0.1749588, -0.02785345, 1.913548, 1, 1, 1, 1, 1,
0.1774487, -0.1366192, 0.7505621, 0, 0, 1, 1, 1,
0.178985, 0.1007751, 0.6304829, 1, 0, 0, 1, 1,
0.182957, 0.3106587, 1.949724, 1, 0, 0, 1, 1,
0.192602, 1.907611, 0.6246174, 1, 0, 0, 1, 1,
0.1932696, 1.316249, -1.143243, 1, 0, 0, 1, 1,
0.1956617, 0.1156277, 0.9996334, 1, 0, 0, 1, 1,
0.1957096, -1.107284, 2.532363, 0, 0, 0, 1, 1,
0.1960552, -0.9950226, 1.980068, 0, 0, 0, 1, 1,
0.1966035, 0.1595519, -0.4401928, 0, 0, 0, 1, 1,
0.2024789, 0.8141986, -0.4398164, 0, 0, 0, 1, 1,
0.2043925, 0.6118514, -0.3803864, 0, 0, 0, 1, 1,
0.2133644, -0.8094311, 5.423976, 0, 0, 0, 1, 1,
0.2136313, -0.1448413, 2.508806, 0, 0, 0, 1, 1,
0.2159558, 0.8669553, -0.6958393, 1, 1, 1, 1, 1,
0.2206491, -0.8377998, 3.076751, 1, 1, 1, 1, 1,
0.2223349, -0.4724572, 3.310771, 1, 1, 1, 1, 1,
0.223165, 0.4193428, 1.109986, 1, 1, 1, 1, 1,
0.2236581, 0.2820503, 0.9462304, 1, 1, 1, 1, 1,
0.2268605, -0.3897012, 3.607692, 1, 1, 1, 1, 1,
0.2288269, -0.9326863, 3.988239, 1, 1, 1, 1, 1,
0.2298526, 0.5115478, -0.7123051, 1, 1, 1, 1, 1,
0.2321938, 1.482726, 1.65553, 1, 1, 1, 1, 1,
0.2337465, -1.742469, 4.998328, 1, 1, 1, 1, 1,
0.2393455, -1.777836, 3.197861, 1, 1, 1, 1, 1,
0.2409828, 0.3531084, 0.9523333, 1, 1, 1, 1, 1,
0.2413471, -0.3535331, 2.133555, 1, 1, 1, 1, 1,
0.2443084, -0.7436261, 3.444966, 1, 1, 1, 1, 1,
0.2456603, -0.04523, 2.090654, 1, 1, 1, 1, 1,
0.2459667, -1.586372, 2.607209, 0, 0, 1, 1, 1,
0.2479058, -0.724611, 3.869835, 1, 0, 0, 1, 1,
0.2480849, -0.601941, 2.932156, 1, 0, 0, 1, 1,
0.2510779, 0.1744927, -0.115036, 1, 0, 0, 1, 1,
0.2596592, -0.5141473, 3.584498, 1, 0, 0, 1, 1,
0.2707523, 0.03938444, 1.434604, 1, 0, 0, 1, 1,
0.2712945, 0.2501381, 0.8823975, 0, 0, 0, 1, 1,
0.2733375, -0.8118551, 2.658624, 0, 0, 0, 1, 1,
0.2752194, -0.0377254, 2.069978, 0, 0, 0, 1, 1,
0.2752215, 0.0226754, 1.882786, 0, 0, 0, 1, 1,
0.2783349, -1.340362, 3.66078, 0, 0, 0, 1, 1,
0.2876864, 1.012091, 0.05125789, 0, 0, 0, 1, 1,
0.2903006, 0.4494974, -1.813088, 0, 0, 0, 1, 1,
0.2998079, -0.6373221, 3.63705, 1, 1, 1, 1, 1,
0.3008283, 0.9166116, -0.7669083, 1, 1, 1, 1, 1,
0.3008965, 0.7369877, -0.904674, 1, 1, 1, 1, 1,
0.3020746, -0.1752157, 3.507239, 1, 1, 1, 1, 1,
0.3039702, -0.1657884, 1.957094, 1, 1, 1, 1, 1,
0.3053533, 0.4575648, -1.514583, 1, 1, 1, 1, 1,
0.3083138, 1.31833, 2.130643, 1, 1, 1, 1, 1,
0.3088104, -0.2835841, 0.2877322, 1, 1, 1, 1, 1,
0.3112497, 0.6279913, 1.179876, 1, 1, 1, 1, 1,
0.3151784, 1.588475, -0.8818598, 1, 1, 1, 1, 1,
0.3172299, -1.402166, 2.266534, 1, 1, 1, 1, 1,
0.3304684, 0.5363595, 0.4853544, 1, 1, 1, 1, 1,
0.33222, -1.985663, 4.937915, 1, 1, 1, 1, 1,
0.3380528, 0.4703325, 2.167264, 1, 1, 1, 1, 1,
0.3389297, -0.3658979, 2.016013, 1, 1, 1, 1, 1,
0.3397363, 0.7444591, -0.6569598, 0, 0, 1, 1, 1,
0.3471664, 1.25327, -0.004074735, 1, 0, 0, 1, 1,
0.3473859, 1.144775, 1.103484, 1, 0, 0, 1, 1,
0.3474351, 0.2067406, 2.430193, 1, 0, 0, 1, 1,
0.353663, -0.2624416, 1.014424, 1, 0, 0, 1, 1,
0.3562036, -0.01438647, 1.559755, 1, 0, 0, 1, 1,
0.3577461, -0.006787343, 0.5136237, 0, 0, 0, 1, 1,
0.3580931, 1.88773, 1.178612, 0, 0, 0, 1, 1,
0.3590896, -1.840961, 4.007728, 0, 0, 0, 1, 1,
0.3751729, 0.549391, -0.8103108, 0, 0, 0, 1, 1,
0.3776388, 0.7955378, -0.5572765, 0, 0, 0, 1, 1,
0.377818, -0.3764107, 2.445668, 0, 0, 0, 1, 1,
0.3805023, -0.5451956, 4.981885, 0, 0, 0, 1, 1,
0.3806564, 1.1023, 1.073578, 1, 1, 1, 1, 1,
0.3832918, -0.1507899, 1.628371, 1, 1, 1, 1, 1,
0.3856057, -1.029183, 1.168167, 1, 1, 1, 1, 1,
0.385661, -0.03471253, 2.516442, 1, 1, 1, 1, 1,
0.3876074, -0.6235291, 1.44898, 1, 1, 1, 1, 1,
0.387736, 0.5940907, 1.896852, 1, 1, 1, 1, 1,
0.3916499, -1.592029, 2.475061, 1, 1, 1, 1, 1,
0.3921064, -0.9266589, 3.68647, 1, 1, 1, 1, 1,
0.3945525, -0.8619244, 2.966504, 1, 1, 1, 1, 1,
0.4020213, -0.5951129, 2.626016, 1, 1, 1, 1, 1,
0.4023746, 0.826997, -1.677304, 1, 1, 1, 1, 1,
0.4035271, 0.6102244, 1.884735, 1, 1, 1, 1, 1,
0.4046902, -1.382351, 3.482479, 1, 1, 1, 1, 1,
0.4061299, -0.6697432, 4.619389, 1, 1, 1, 1, 1,
0.4092549, 1.415746, 1.251448, 1, 1, 1, 1, 1,
0.4101854, 1.801133, 1.437702, 0, 0, 1, 1, 1,
0.4114001, 0.8122073, 0.5980242, 1, 0, 0, 1, 1,
0.4120205, 1.278197, -1.123552, 1, 0, 0, 1, 1,
0.4144348, 1.118149, 0.05555527, 1, 0, 0, 1, 1,
0.4158107, 0.6407181, 2.95118, 1, 0, 0, 1, 1,
0.4174114, -0.932344, 2.257357, 1, 0, 0, 1, 1,
0.4199434, -0.5330307, 2.094279, 0, 0, 0, 1, 1,
0.4218327, -0.9806324, 2.870289, 0, 0, 0, 1, 1,
0.4228594, 0.2909964, 1.343574, 0, 0, 0, 1, 1,
0.4301305, 0.05388926, 1.232627, 0, 0, 0, 1, 1,
0.4327307, -0.4941521, 2.332983, 0, 0, 0, 1, 1,
0.4355781, 0.5180613, 0.8275433, 0, 0, 0, 1, 1,
0.4364169, -1.071725, 4.437976, 0, 0, 0, 1, 1,
0.4391656, -2.261884, 2.054461, 1, 1, 1, 1, 1,
0.4418857, -0.2318328, 2.683665, 1, 1, 1, 1, 1,
0.4431726, 0.8553095, -0.01931511, 1, 1, 1, 1, 1,
0.4438157, -0.1044289, 2.510645, 1, 1, 1, 1, 1,
0.4455739, 3.574247, -0.001237205, 1, 1, 1, 1, 1,
0.4489739, 1.320853, -0.1499805, 1, 1, 1, 1, 1,
0.4589741, -1.069679, 1.461375, 1, 1, 1, 1, 1,
0.4601913, 1.376742, -0.5998059, 1, 1, 1, 1, 1,
0.4634152, -2.568872, 1.388304, 1, 1, 1, 1, 1,
0.4666642, 0.5021514, 0.2427783, 1, 1, 1, 1, 1,
0.4668817, -1.567237, 3.393465, 1, 1, 1, 1, 1,
0.4703379, 0.03317644, 1.449436, 1, 1, 1, 1, 1,
0.4764488, -0.846338, 3.010142, 1, 1, 1, 1, 1,
0.4765805, -1.589156, 2.579653, 1, 1, 1, 1, 1,
0.4796734, 0.1556876, 1.290639, 1, 1, 1, 1, 1,
0.4824843, 1.666648, 0.1305851, 0, 0, 1, 1, 1,
0.4825083, -1.112872, 2.667651, 1, 0, 0, 1, 1,
0.4830637, -0.2346651, 1.790601, 1, 0, 0, 1, 1,
0.4867522, 0.06730937, 1.658514, 1, 0, 0, 1, 1,
0.4871817, -0.1145225, 2.067479, 1, 0, 0, 1, 1,
0.4884496, 1.412226, -0.3144844, 1, 0, 0, 1, 1,
0.4934061, 1.828661, 0.1183608, 0, 0, 0, 1, 1,
0.4961559, -0.6546471, 0.9407742, 0, 0, 0, 1, 1,
0.497169, 0.5104221, -0.1430221, 0, 0, 0, 1, 1,
0.5042661, -0.7023266, 2.965096, 0, 0, 0, 1, 1,
0.5046239, 1.138537, 2.124757, 0, 0, 0, 1, 1,
0.5061538, 0.7572092, 0.6408081, 0, 0, 0, 1, 1,
0.5103878, -1.529438, 3.111471, 0, 0, 0, 1, 1,
0.5148908, -0.5916559, 2.798192, 1, 1, 1, 1, 1,
0.5168334, -1.372654, -0.09403282, 1, 1, 1, 1, 1,
0.5201292, -0.9731945, 2.68067, 1, 1, 1, 1, 1,
0.5204935, 0.3131467, 0.1674897, 1, 1, 1, 1, 1,
0.5223343, 1.005473, 0.9771097, 1, 1, 1, 1, 1,
0.5357904, -0.1966867, 2.174936, 1, 1, 1, 1, 1,
0.5387444, 0.923183, -0.04761029, 1, 1, 1, 1, 1,
0.5410486, -0.6813266, 2.810588, 1, 1, 1, 1, 1,
0.5480144, 0.2792972, 2.382351, 1, 1, 1, 1, 1,
0.5503039, 0.5608818, -0.2178878, 1, 1, 1, 1, 1,
0.5503075, -1.03473, 3.410676, 1, 1, 1, 1, 1,
0.5585201, 1.885208, -0.4048755, 1, 1, 1, 1, 1,
0.5612157, 0.411789, -0.4381188, 1, 1, 1, 1, 1,
0.5634285, -0.1596991, 2.572354, 1, 1, 1, 1, 1,
0.5687572, 0.7159824, 1.599819, 1, 1, 1, 1, 1,
0.5709049, -0.1144156, 1.957494, 0, 0, 1, 1, 1,
0.5720885, -0.2760147, 1.614133, 1, 0, 0, 1, 1,
0.5727713, -0.4312832, 2.136006, 1, 0, 0, 1, 1,
0.572851, 0.1100642, 0.3456225, 1, 0, 0, 1, 1,
0.5729747, 0.6596256, 0.2288337, 1, 0, 0, 1, 1,
0.5746924, 0.9685649, 0.6222934, 1, 0, 0, 1, 1,
0.5773261, -0.8694158, 3.467807, 0, 0, 0, 1, 1,
0.5778407, 1.556405, 0.4322307, 0, 0, 0, 1, 1,
0.5779609, 1.66998, 0.7206423, 0, 0, 0, 1, 1,
0.579777, 0.3898926, 2.082238, 0, 0, 0, 1, 1,
0.5818329, 0.6927735, 0.6765997, 0, 0, 0, 1, 1,
0.5869448, 1.186291, -0.6130837, 0, 0, 0, 1, 1,
0.5877879, -1.355319, 2.622707, 0, 0, 0, 1, 1,
0.5884933, 0.7820668, -0.03460295, 1, 1, 1, 1, 1,
0.5896409, 0.5876957, 1.697973, 1, 1, 1, 1, 1,
0.5900075, 0.9741966, 0.6129299, 1, 1, 1, 1, 1,
0.5950002, -0.8549448, 1.66646, 1, 1, 1, 1, 1,
0.598215, -2.479168, 3.284344, 1, 1, 1, 1, 1,
0.5988082, -0.8952888, 3.663343, 1, 1, 1, 1, 1,
0.6042947, -1.270581, 1.840146, 1, 1, 1, 1, 1,
0.6087541, -0.1052956, 3.845019, 1, 1, 1, 1, 1,
0.6224487, -0.2750923, 2.247042, 1, 1, 1, 1, 1,
0.6228815, 0.2029524, 0.2736641, 1, 1, 1, 1, 1,
0.6245475, -1.115384, 2.067481, 1, 1, 1, 1, 1,
0.6266046, -0.8572075, 2.999577, 1, 1, 1, 1, 1,
0.6364336, 0.07441641, -0.2529735, 1, 1, 1, 1, 1,
0.6436204, -0.07209735, 1.607185, 1, 1, 1, 1, 1,
0.6447605, 0.3027108, -0.1617913, 1, 1, 1, 1, 1,
0.6484519, 0.2603749, 0.04497971, 0, 0, 1, 1, 1,
0.6551389, 2.189613, 0.8121317, 1, 0, 0, 1, 1,
0.6563579, -0.1561573, 3.472469, 1, 0, 0, 1, 1,
0.6578891, 0.9092231, 0.6520784, 1, 0, 0, 1, 1,
0.6639563, -0.1156938, 2.296139, 1, 0, 0, 1, 1,
0.6653756, 1.756308, -1.248567, 1, 0, 0, 1, 1,
0.6703722, -0.4497412, 1.586757, 0, 0, 0, 1, 1,
0.6708167, -0.2134469, 2.939265, 0, 0, 0, 1, 1,
0.6716204, 0.3304321, 2.088239, 0, 0, 0, 1, 1,
0.6750746, 1.11873, 0.5045219, 0, 0, 0, 1, 1,
0.6775556, -1.194212, 3.117375, 0, 0, 0, 1, 1,
0.6779419, 0.8548226, 0.01996683, 0, 0, 0, 1, 1,
0.6812183, 2.169228, -0.05335462, 0, 0, 0, 1, 1,
0.6815822, 0.0437003, 0.9883418, 1, 1, 1, 1, 1,
0.683714, 1.544823, -0.7127445, 1, 1, 1, 1, 1,
0.690053, 1.52376, 1.170743, 1, 1, 1, 1, 1,
0.6910563, 0.2966987, 2.505121, 1, 1, 1, 1, 1,
0.6915805, 0.8758819, 2.105637, 1, 1, 1, 1, 1,
0.6916724, -0.7816206, 3.091112, 1, 1, 1, 1, 1,
0.6924647, 2.023303, 0.9092106, 1, 1, 1, 1, 1,
0.6957344, -0.1238683, 1.557697, 1, 1, 1, 1, 1,
0.6959841, 0.975019, 0.603096, 1, 1, 1, 1, 1,
0.6971852, 2.439226, -0.7556136, 1, 1, 1, 1, 1,
0.699326, 2.386399, -0.5110878, 1, 1, 1, 1, 1,
0.7023945, 0.08391251, 2.500694, 1, 1, 1, 1, 1,
0.7069438, 0.2738611, 3.354583, 1, 1, 1, 1, 1,
0.7121112, -0.1676693, 1.7353, 1, 1, 1, 1, 1,
0.7179285, 0.684859, 0.7525771, 1, 1, 1, 1, 1,
0.7182704, 0.2791102, 0.9490464, 0, 0, 1, 1, 1,
0.7211557, 1.63694, 1.196391, 1, 0, 0, 1, 1,
0.7216782, -0.2726991, 2.634554, 1, 0, 0, 1, 1,
0.7229906, -0.2545428, 0.5180547, 1, 0, 0, 1, 1,
0.7277308, 0.4547829, -0.309931, 1, 0, 0, 1, 1,
0.7384579, 1.86122, -0.6546636, 1, 0, 0, 1, 1,
0.7388515, -0.3664078, 2.684954, 0, 0, 0, 1, 1,
0.7398344, 0.3574748, 0.6081411, 0, 0, 0, 1, 1,
0.7400566, 0.5927551, -0.7868645, 0, 0, 0, 1, 1,
0.7401969, -1.416897, 1.380753, 0, 0, 0, 1, 1,
0.7408707, 1.121387, 0.4215128, 0, 0, 0, 1, 1,
0.7426686, -0.01850529, 1.661007, 0, 0, 0, 1, 1,
0.7449845, -1.697111, 2.656474, 0, 0, 0, 1, 1,
0.7460083, 0.1641261, 1.309371, 1, 1, 1, 1, 1,
0.747301, 1.055132, 0.5045004, 1, 1, 1, 1, 1,
0.7591218, 1.390223, -0.1497181, 1, 1, 1, 1, 1,
0.7683712, -1.409095, 4.132952, 1, 1, 1, 1, 1,
0.770824, -0.2273643, 1.568079, 1, 1, 1, 1, 1,
0.7869051, 0.1522114, 2.41411, 1, 1, 1, 1, 1,
0.7877645, -0.09530196, 1.042355, 1, 1, 1, 1, 1,
0.7929726, -1.60138, 3.063315, 1, 1, 1, 1, 1,
0.7980465, -1.454272, 1.017716, 1, 1, 1, 1, 1,
0.799661, 1.376099, 1.226511, 1, 1, 1, 1, 1,
0.8002825, -0.9105418, 2.662438, 1, 1, 1, 1, 1,
0.8056628, -0.1973646, 0.4022111, 1, 1, 1, 1, 1,
0.8111187, -1.259013, 3.225285, 1, 1, 1, 1, 1,
0.8234125, -0.5071211, 1.095438, 1, 1, 1, 1, 1,
0.8236256, 0.2385954, 1.446111, 1, 1, 1, 1, 1,
0.8248343, -1.393973, 2.419107, 0, 0, 1, 1, 1,
0.8295447, -0.9925086, 3.384861, 1, 0, 0, 1, 1,
0.8404453, 2.188245, 0.53509, 1, 0, 0, 1, 1,
0.8411841, -0.05129683, 1.728724, 1, 0, 0, 1, 1,
0.8459889, 0.5309671, 1.850113, 1, 0, 0, 1, 1,
0.8491986, -0.5422342, 4.212064, 1, 0, 0, 1, 1,
0.8553082, -0.2048369, 2.028004, 0, 0, 0, 1, 1,
0.8557351, -0.1041735, 1.012101, 0, 0, 0, 1, 1,
0.8606657, 0.4370176, 0.1269568, 0, 0, 0, 1, 1,
0.861521, 0.8928533, 1.414877, 0, 0, 0, 1, 1,
0.8641962, -1.186983, 2.584646, 0, 0, 0, 1, 1,
0.8644542, 1.096445, 1.086406, 0, 0, 0, 1, 1,
0.8663933, -1.636183, 1.9964, 0, 0, 0, 1, 1,
0.869648, -0.9375315, 2.288393, 1, 1, 1, 1, 1,
0.8756586, 0.5839224, 0.5509497, 1, 1, 1, 1, 1,
0.8817314, -0.9054583, 2.188206, 1, 1, 1, 1, 1,
0.8836244, -0.3971986, 1.36628, 1, 1, 1, 1, 1,
0.894686, 0.2499463, 1.20805, 1, 1, 1, 1, 1,
0.905346, -0.2185612, 1.587868, 1, 1, 1, 1, 1,
0.9088421, 0.2171918, 2.636323, 1, 1, 1, 1, 1,
0.9136457, -0.3501499, -0.09003709, 1, 1, 1, 1, 1,
0.9164938, 0.7322068, 0.2477535, 1, 1, 1, 1, 1,
0.9234532, 1.825799, 0.04337089, 1, 1, 1, 1, 1,
0.9275386, -0.2737978, 2.466166, 1, 1, 1, 1, 1,
0.9331811, 0.7988949, 0.7422648, 1, 1, 1, 1, 1,
0.9446162, 2.848545, -0.2269583, 1, 1, 1, 1, 1,
0.94548, -1.18486, 3.502945, 1, 1, 1, 1, 1,
0.9486965, 0.1646725, 0.6097216, 1, 1, 1, 1, 1,
0.956531, 2.359299, -0.7633404, 0, 0, 1, 1, 1,
0.9595046, -0.3075183, 2.54093, 1, 0, 0, 1, 1,
0.9609995, 0.05598379, -0.6634457, 1, 0, 0, 1, 1,
0.9612554, 0.1957234, 1.133206, 1, 0, 0, 1, 1,
0.9663568, 1.393507, 1.15016, 1, 0, 0, 1, 1,
0.9825087, -0.8847656, 3.846248, 1, 0, 0, 1, 1,
0.9884073, -1.750361, 3.56428, 0, 0, 0, 1, 1,
0.9885688, -2.860465, 2.036848, 0, 0, 0, 1, 1,
0.9902403, 0.7649267, 1.378145, 0, 0, 0, 1, 1,
0.9942818, 0.4349983, 0.01959256, 0, 0, 0, 1, 1,
0.9946538, -0.06947546, 2.05052, 0, 0, 0, 1, 1,
0.9979461, 1.687097, 0.05937782, 0, 0, 0, 1, 1,
1.001567, -0.210667, 2.875086, 0, 0, 0, 1, 1,
1.005572, -1.564567, 2.225292, 1, 1, 1, 1, 1,
1.014075, -0.6131693, 2.084691, 1, 1, 1, 1, 1,
1.015085, -1.240867, 3.70813, 1, 1, 1, 1, 1,
1.019525, 0.2494945, 0.4974526, 1, 1, 1, 1, 1,
1.038972, -0.1455082, 0.405623, 1, 1, 1, 1, 1,
1.04363, -1.139294, 2.749836, 1, 1, 1, 1, 1,
1.045526, 1.812719, -0.6997784, 1, 1, 1, 1, 1,
1.054591, 0.04214453, 2.414399, 1, 1, 1, 1, 1,
1.055001, 0.1130378, 0.7283045, 1, 1, 1, 1, 1,
1.057838, -1.707053, 2.959656, 1, 1, 1, 1, 1,
1.061223, 0.4314071, 2.270096, 1, 1, 1, 1, 1,
1.063302, -0.5972568, 1.517826, 1, 1, 1, 1, 1,
1.06617, 1.135736, 2.043742, 1, 1, 1, 1, 1,
1.069644, 0.3251221, 2.770449, 1, 1, 1, 1, 1,
1.072961, -1.231816, 0.7718135, 1, 1, 1, 1, 1,
1.074397, 2.677725, 0.6706793, 0, 0, 1, 1, 1,
1.080932, -0.3088323, 1.492812, 1, 0, 0, 1, 1,
1.091376, -1.134255, 2.587195, 1, 0, 0, 1, 1,
1.098529, -1.853862, 1.938638, 1, 0, 0, 1, 1,
1.101163, -0.5421515, 1.424556, 1, 0, 0, 1, 1,
1.102333, 1.802707, 0.03980771, 1, 0, 0, 1, 1,
1.105855, -0.914861, 1.640856, 0, 0, 0, 1, 1,
1.106331, 0.1604457, 1.680862, 0, 0, 0, 1, 1,
1.106916, 0.1168595, 2.191525, 0, 0, 0, 1, 1,
1.108258, 0.2064026, 3.177982, 0, 0, 0, 1, 1,
1.108623, -0.6067845, -0.9828812, 0, 0, 0, 1, 1,
1.109949, -1.309729, 2.009336, 0, 0, 0, 1, 1,
1.114417, -0.1160563, 2.169581, 0, 0, 0, 1, 1,
1.115527, -0.6596296, 1.000422, 1, 1, 1, 1, 1,
1.119316, 0.3055893, 1.515366, 1, 1, 1, 1, 1,
1.120212, -0.4668033, 1.608515, 1, 1, 1, 1, 1,
1.131859, 1.463942, 1.496879, 1, 1, 1, 1, 1,
1.135198, 0.6409293, 1.954345, 1, 1, 1, 1, 1,
1.136964, 0.813303, 1.439004, 1, 1, 1, 1, 1,
1.13888, -1.500451, 2.741917, 1, 1, 1, 1, 1,
1.153808, -0.3885764, 0.2274414, 1, 1, 1, 1, 1,
1.157039, 0.6739381, 0.8726683, 1, 1, 1, 1, 1,
1.157356, -1.032988, 1.455958, 1, 1, 1, 1, 1,
1.158827, -0.634358, 2.274628, 1, 1, 1, 1, 1,
1.160655, -1.189026, 2.810997, 1, 1, 1, 1, 1,
1.16206, -0.8353303, 1.332442, 1, 1, 1, 1, 1,
1.166927, 0.9143594, -0.2062551, 1, 1, 1, 1, 1,
1.170244, -0.5938395, 1.616397, 1, 1, 1, 1, 1,
1.170769, 0.2082721, 2.323126, 0, 0, 1, 1, 1,
1.171486, 0.6374484, 1.860786, 1, 0, 0, 1, 1,
1.179584, -0.122176, 0.3608726, 1, 0, 0, 1, 1,
1.18914, -0.4951273, 1.497085, 1, 0, 0, 1, 1,
1.190534, 1.461445, 2.007682, 1, 0, 0, 1, 1,
1.190917, -0.5135514, 3.318699, 1, 0, 0, 1, 1,
1.207041, 1.027418, 1.419075, 0, 0, 0, 1, 1,
1.210235, 1.956453, -2.287277, 0, 0, 0, 1, 1,
1.219065, -1.015684, 1.745742, 0, 0, 0, 1, 1,
1.22045, -0.8203345, 1.127036, 0, 0, 0, 1, 1,
1.222173, 1.307212, 0.7258117, 0, 0, 0, 1, 1,
1.222561, -0.2285324, 0.5488548, 0, 0, 0, 1, 1,
1.227753, -0.4491566, 3.174584, 0, 0, 0, 1, 1,
1.229748, 0.1298953, 0.6238263, 1, 1, 1, 1, 1,
1.232293, -0.939078, 2.263038, 1, 1, 1, 1, 1,
1.238396, -0.8093471, 3.150658, 1, 1, 1, 1, 1,
1.240126, -0.2465689, 1.707599, 1, 1, 1, 1, 1,
1.246737, 1.033011, 1.564034, 1, 1, 1, 1, 1,
1.247468, 1.440716, 2.449307, 1, 1, 1, 1, 1,
1.25762, -0.232632, 0.5870506, 1, 1, 1, 1, 1,
1.26259, 0.2358855, 1.032446, 1, 1, 1, 1, 1,
1.264888, 0.2021223, 0.4481509, 1, 1, 1, 1, 1,
1.27115, -1.12042, 1.43508, 1, 1, 1, 1, 1,
1.272006, 1.151664, 1.534942, 1, 1, 1, 1, 1,
1.277927, 0.9430149, 0.5998039, 1, 1, 1, 1, 1,
1.282578, 0.9531174, 0.1866159, 1, 1, 1, 1, 1,
1.28928, 2.49513, 0.4383887, 1, 1, 1, 1, 1,
1.298506, -1.260468, 3.703444, 1, 1, 1, 1, 1,
1.315554, 1.285404, 2.146487, 0, 0, 1, 1, 1,
1.326657, 0.5316929, 1.546978, 1, 0, 0, 1, 1,
1.332468, 0.351018, 0.0824952, 1, 0, 0, 1, 1,
1.337526, -1.658139, 1.312119, 1, 0, 0, 1, 1,
1.344431, 0.3099469, -0.0417203, 1, 0, 0, 1, 1,
1.346185, 0.3589426, 0.6344832, 1, 0, 0, 1, 1,
1.349707, 0.004739378, 1.24812, 0, 0, 0, 1, 1,
1.357779, 1.514451, 1.954771, 0, 0, 0, 1, 1,
1.358501, 1.029167, -1.085945, 0, 0, 0, 1, 1,
1.369494, 0.6553237, 3.143224, 0, 0, 0, 1, 1,
1.370074, -0.9431921, 1.794367, 0, 0, 0, 1, 1,
1.372373, 0.5023122, 0.9485098, 0, 0, 0, 1, 1,
1.375295, -0.7126051, 1.814739, 0, 0, 0, 1, 1,
1.385644, 0.1981123, 0.3952874, 1, 1, 1, 1, 1,
1.386995, -0.391762, 1.20324, 1, 1, 1, 1, 1,
1.393896, 0.4242757, 1.805645, 1, 1, 1, 1, 1,
1.414312, 1.001659, 0.7991516, 1, 1, 1, 1, 1,
1.416109, 1.028333, 1.386802, 1, 1, 1, 1, 1,
1.420008, -0.5725666, 1.243014, 1, 1, 1, 1, 1,
1.424722, 0.3337644, 2.373595, 1, 1, 1, 1, 1,
1.427166, 0.101887, 0.6366081, 1, 1, 1, 1, 1,
1.434974, 0.3390087, 1.668223, 1, 1, 1, 1, 1,
1.475648, -0.9404965, 2.698785, 1, 1, 1, 1, 1,
1.484047, -0.0001026313, 1.124893, 1, 1, 1, 1, 1,
1.484695, -0.1559505, 0.6734293, 1, 1, 1, 1, 1,
1.490507, -0.9330107, 3.590365, 1, 1, 1, 1, 1,
1.505424, -1.99133, 4.462864, 1, 1, 1, 1, 1,
1.511853, -1.092377, 1.763628, 1, 1, 1, 1, 1,
1.516072, 0.1571505, -0.9696838, 0, 0, 1, 1, 1,
1.518697, 0.09696952, -0.4577795, 1, 0, 0, 1, 1,
1.530837, -0.4202534, 2.722706, 1, 0, 0, 1, 1,
1.531728, -0.237874, 1.980947, 1, 0, 0, 1, 1,
1.542664, 1.530156, -0.8906595, 1, 0, 0, 1, 1,
1.546075, -0.6581607, 3.545451, 1, 0, 0, 1, 1,
1.578044, 0.4193936, 2.457259, 0, 0, 0, 1, 1,
1.582286, -0.9933257, 3.250308, 0, 0, 0, 1, 1,
1.589001, 0.1695341, 0.2876217, 0, 0, 0, 1, 1,
1.598734, 0.3950598, 2.443636, 0, 0, 0, 1, 1,
1.613307, 0.5199553, 0.5655007, 0, 0, 0, 1, 1,
1.617997, -0.1845542, 1.042303, 0, 0, 0, 1, 1,
1.625032, 0.6928024, 1.714523, 0, 0, 0, 1, 1,
1.641212, 0.3350542, 3.036005, 1, 1, 1, 1, 1,
1.64689, 1.335994, -0.1603768, 1, 1, 1, 1, 1,
1.654302, 0.04418836, 2.008467, 1, 1, 1, 1, 1,
1.659943, 1.413069, 0.4398943, 1, 1, 1, 1, 1,
1.663703, 1.176535, 0.1351604, 1, 1, 1, 1, 1,
1.686215, -1.053262, 2.194741, 1, 1, 1, 1, 1,
1.690933, -0.08419163, 0.7448427, 1, 1, 1, 1, 1,
1.697883, 0.8440906, 0.2714514, 1, 1, 1, 1, 1,
1.704136, 0.5727955, 0.9267179, 1, 1, 1, 1, 1,
1.709051, 0.24102, 1.741284, 1, 1, 1, 1, 1,
1.711769, -1.292105, 2.187424, 1, 1, 1, 1, 1,
1.739354, -0.4615127, 2.40284, 1, 1, 1, 1, 1,
1.747774, 0.1859763, 1.942516, 1, 1, 1, 1, 1,
1.750527, 0.3144531, 1.209179, 1, 1, 1, 1, 1,
1.757575, -0.7595378, 1.695294, 1, 1, 1, 1, 1,
1.76689, -2.011522, 1.527562, 0, 0, 1, 1, 1,
1.774751, -0.382449, 0.7948081, 1, 0, 0, 1, 1,
1.777633, -0.7951056, 1.879985, 1, 0, 0, 1, 1,
1.777868, -0.7113862, 2.037976, 1, 0, 0, 1, 1,
1.794779, 1.602464, 0.6999093, 1, 0, 0, 1, 1,
1.802362, -1.043846, 2.226526, 1, 0, 0, 1, 1,
1.806952, 1.458805, 2.067489, 0, 0, 0, 1, 1,
1.815477, 1.026997, 0.1862197, 0, 0, 0, 1, 1,
1.85563, 0.6828629, 0.1237257, 0, 0, 0, 1, 1,
1.872296, 0.8296921, 0.3260427, 0, 0, 0, 1, 1,
1.891783, 1.883426, 1.082391, 0, 0, 0, 1, 1,
1.895333, -0.1438718, 0.8449894, 0, 0, 0, 1, 1,
1.899188, 1.298483, 1.227888, 0, 0, 0, 1, 1,
1.906376, 0.3539693, 1.247063, 1, 1, 1, 1, 1,
1.910635, -0.6929227, 2.364638, 1, 1, 1, 1, 1,
1.930753, -0.6423497, 2.109602, 1, 1, 1, 1, 1,
1.951174, -1.121473, 0.6887974, 1, 1, 1, 1, 1,
1.991798, 1.462251, 1.984268, 1, 1, 1, 1, 1,
1.992244, -0.6304824, 2.757703, 1, 1, 1, 1, 1,
1.993543, 1.68473, 4.209487, 1, 1, 1, 1, 1,
2.005866, 0.09784491, 1.132605, 1, 1, 1, 1, 1,
2.024157, -0.6309304, 1.221006, 1, 1, 1, 1, 1,
2.03474, -0.8279319, 1.416277, 1, 1, 1, 1, 1,
2.057812, 0.4525181, 1.914443, 1, 1, 1, 1, 1,
2.072299, 0.4120254, 1.208858, 1, 1, 1, 1, 1,
2.085129, -1.277962, 2.233052, 1, 1, 1, 1, 1,
2.090778, -1.084685, 2.961061, 1, 1, 1, 1, 1,
2.111604, 0.1932901, 1.617099, 1, 1, 1, 1, 1,
2.112789, 0.2972991, 1.817131, 0, 0, 1, 1, 1,
2.1461, -0.3224789, 1.319528, 1, 0, 0, 1, 1,
2.163604, -0.3985237, -0.880614, 1, 0, 0, 1, 1,
2.177607, -2.135093, 2.128672, 1, 0, 0, 1, 1,
2.227414, -0.2965839, 2.899163, 1, 0, 0, 1, 1,
2.240422, -0.2951024, 0.9801928, 1, 0, 0, 1, 1,
2.244053, 0.4130785, 1.060963, 0, 0, 0, 1, 1,
2.272255, -0.4363848, 2.14695, 0, 0, 0, 1, 1,
2.326466, 0.2929764, 0.5326589, 0, 0, 0, 1, 1,
2.327551, 1.190866, 1.092756, 0, 0, 0, 1, 1,
2.380477, 1.182304, 1.322075, 0, 0, 0, 1, 1,
2.481531, 0.2967144, 2.033197, 0, 0, 0, 1, 1,
2.533019, -0.5861509, 2.53874, 0, 0, 0, 1, 1,
2.557363, 0.2949037, 1.122605, 1, 1, 1, 1, 1,
2.682697, 1.935251, 0.484665, 1, 1, 1, 1, 1,
2.777106, -3.023526, 2.814743, 1, 1, 1, 1, 1,
2.955814, 0.4557881, 0.4251191, 1, 1, 1, 1, 1,
2.982361, -0.3320444, 2.298339, 1, 1, 1, 1, 1,
3.022989, -1.02288, 2.084368, 1, 1, 1, 1, 1,
3.040354, 1.249741, 1.839648, 1, 1, 1, 1, 1
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
var radius = 9.703447;
var distance = 34.08295;
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
mvMatrix.translate( 0.2200189, -0.1246274, -0.1100457 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.08295);
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
