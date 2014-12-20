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
-3.831272, 0.03091226, -3.041901, 1, 0, 0, 1,
-3.410965, 0.1174264, -1.950683, 1, 0.007843138, 0, 1,
-3.120513, -0.3681509, -0.8949926, 1, 0.01176471, 0, 1,
-2.735626, -0.2262641, -3.46203, 1, 0.01960784, 0, 1,
-2.696315, 0.07723206, -2.524912, 1, 0.02352941, 0, 1,
-2.669996, -0.5163109, -1.534976, 1, 0.03137255, 0, 1,
-2.652205, 1.570449, -1.797861, 1, 0.03529412, 0, 1,
-2.633826, -1.829566, -1.787646, 1, 0.04313726, 0, 1,
-2.620732, 0.4800127, 0.2540592, 1, 0.04705882, 0, 1,
-2.619631, -1.059455, -1.578455, 1, 0.05490196, 0, 1,
-2.524066, -0.5654946, -2.628481, 1, 0.05882353, 0, 1,
-2.310774, 0.7885114, -1.790406, 1, 0.06666667, 0, 1,
-2.285534, 0.9057382, -4.126068, 1, 0.07058824, 0, 1,
-2.284693, 0.04834231, -2.168036, 1, 0.07843138, 0, 1,
-2.279467, 2.366034, -0.3328685, 1, 0.08235294, 0, 1,
-2.279463, -1.199624, -1.391204, 1, 0.09019608, 0, 1,
-2.275886, -0.7362999, -1.395967, 1, 0.09411765, 0, 1,
-2.206362, -0.6865064, -1.321117, 1, 0.1019608, 0, 1,
-2.176539, -1.013511, -1.468982, 1, 0.1098039, 0, 1,
-2.176526, -0.003778965, -1.212453, 1, 0.1137255, 0, 1,
-2.148168, 1.03242, -0.5539157, 1, 0.1215686, 0, 1,
-2.141114, -0.4304159, -0.9032477, 1, 0.1254902, 0, 1,
-2.109297, -0.7141974, -1.885947, 1, 0.1333333, 0, 1,
-2.101814, -1.567268, -2.245228, 1, 0.1372549, 0, 1,
-2.082874, 0.9027318, -1.999904, 1, 0.145098, 0, 1,
-2.045136, -0.6346099, -1.703681, 1, 0.1490196, 0, 1,
-2.027629, -0.491608, -2.753004, 1, 0.1568628, 0, 1,
-2.005078, 1.128993, -1.368739, 1, 0.1607843, 0, 1,
-1.989906, -0.5403024, -2.785386, 1, 0.1686275, 0, 1,
-1.971138, -0.3397047, -1.479583, 1, 0.172549, 0, 1,
-1.962458, -0.6030936, -3.014061, 1, 0.1803922, 0, 1,
-1.960502, -1.082467, -1.638668, 1, 0.1843137, 0, 1,
-1.920012, 1.085838, -0.6460867, 1, 0.1921569, 0, 1,
-1.914051, -0.2086853, -0.5812422, 1, 0.1960784, 0, 1,
-1.907252, -0.8425212, -4.751626, 1, 0.2039216, 0, 1,
-1.896482, -0.8020785, -2.483886, 1, 0.2117647, 0, 1,
-1.864856, 1.782717, -2.189075, 1, 0.2156863, 0, 1,
-1.864689, -0.4089859, -1.111351, 1, 0.2235294, 0, 1,
-1.854584, 1.165485, -2.094591, 1, 0.227451, 0, 1,
-1.853131, -0.4916797, -1.549026, 1, 0.2352941, 0, 1,
-1.830413, 0.3681516, -2.512009, 1, 0.2392157, 0, 1,
-1.819488, -0.6919586, -0.4457634, 1, 0.2470588, 0, 1,
-1.809013, -0.1625523, -1.603221, 1, 0.2509804, 0, 1,
-1.797739, -0.5748714, -0.556778, 1, 0.2588235, 0, 1,
-1.771673, 0.8563266, -1.19488, 1, 0.2627451, 0, 1,
-1.754955, -0.4703011, -2.653971, 1, 0.2705882, 0, 1,
-1.737792, -0.5340861, -2.585998, 1, 0.2745098, 0, 1,
-1.73697, 1.352341, -1.078337, 1, 0.282353, 0, 1,
-1.717634, 0.8420793, -0.6635042, 1, 0.2862745, 0, 1,
-1.717121, -0.1624758, -0.2301417, 1, 0.2941177, 0, 1,
-1.71111, 2.102093, -0.2571717, 1, 0.3019608, 0, 1,
-1.709927, -3.332963, -3.166359, 1, 0.3058824, 0, 1,
-1.708942, 1.504735, -0.2288306, 1, 0.3137255, 0, 1,
-1.684657, -1.367699, -2.1828, 1, 0.3176471, 0, 1,
-1.679698, 0.08200257, -1.218686, 1, 0.3254902, 0, 1,
-1.670783, -1.468721, -2.839167, 1, 0.3294118, 0, 1,
-1.658372, -0.2260465, -0.1142755, 1, 0.3372549, 0, 1,
-1.651634, 1.042824, -3.257732, 1, 0.3411765, 0, 1,
-1.618526, 0.7898761, -0.4071042, 1, 0.3490196, 0, 1,
-1.610622, 0.475335, -2.244341, 1, 0.3529412, 0, 1,
-1.606256, 0.03768497, -1.690542, 1, 0.3607843, 0, 1,
-1.585131, 1.993014, -0.534799, 1, 0.3647059, 0, 1,
-1.569173, 2.216268, -0.152594, 1, 0.372549, 0, 1,
-1.561378, 1.762142, 0.2084431, 1, 0.3764706, 0, 1,
-1.543609, -0.5494525, -1.818319, 1, 0.3843137, 0, 1,
-1.524027, 1.628325, 0.01667635, 1, 0.3882353, 0, 1,
-1.522452, -1.60259, -4.693236, 1, 0.3960784, 0, 1,
-1.520957, 2.137356, 0.8341368, 1, 0.4039216, 0, 1,
-1.513426, 1.008729, -1.027413, 1, 0.4078431, 0, 1,
-1.510801, -2.165315, -2.181259, 1, 0.4156863, 0, 1,
-1.48561, 0.1737213, -1.290293, 1, 0.4196078, 0, 1,
-1.484342, 1.265741, -1.646224, 1, 0.427451, 0, 1,
-1.482867, 1.138381, -0.3055321, 1, 0.4313726, 0, 1,
-1.482134, 1.706103, 1.444681, 1, 0.4392157, 0, 1,
-1.474306, -0.3413844, -1.587199, 1, 0.4431373, 0, 1,
-1.472173, -0.6173831, -2.019181, 1, 0.4509804, 0, 1,
-1.46673, -0.329905, -0.981806, 1, 0.454902, 0, 1,
-1.465593, 0.6905322, -2.051612, 1, 0.4627451, 0, 1,
-1.458348, 0.6549008, -1.166912, 1, 0.4666667, 0, 1,
-1.458296, -0.1155656, -2.709623, 1, 0.4745098, 0, 1,
-1.45773, -0.06880528, -2.970148, 1, 0.4784314, 0, 1,
-1.448903, 0.8163952, -0.08544785, 1, 0.4862745, 0, 1,
-1.448687, -0.1391072, -1.706631, 1, 0.4901961, 0, 1,
-1.441363, -0.1994156, -4.22549, 1, 0.4980392, 0, 1,
-1.438911, 0.10565, -1.748658, 1, 0.5058824, 0, 1,
-1.431322, -0.3908845, -2.69807, 1, 0.509804, 0, 1,
-1.429425, -0.7490742, -1.199522, 1, 0.5176471, 0, 1,
-1.42249, -0.8960773, -3.566439, 1, 0.5215687, 0, 1,
-1.42198, 2.068029, -1.347411, 1, 0.5294118, 0, 1,
-1.400275, -1.32142, -1.442023, 1, 0.5333334, 0, 1,
-1.385748, 0.5600519, 0.3737613, 1, 0.5411765, 0, 1,
-1.376177, 0.9319093, 0.1176072, 1, 0.5450981, 0, 1,
-1.366358, 1.109174, -0.8226348, 1, 0.5529412, 0, 1,
-1.365814, 1.193765, -0.2019834, 1, 0.5568628, 0, 1,
-1.359634, 1.205131, -1.702921, 1, 0.5647059, 0, 1,
-1.358927, -1.177331, -4.789363, 1, 0.5686275, 0, 1,
-1.358015, -0.8194079, -2.836825, 1, 0.5764706, 0, 1,
-1.346648, -0.2950297, -3.401754, 1, 0.5803922, 0, 1,
-1.3431, 1.691129, 1.031886, 1, 0.5882353, 0, 1,
-1.335374, -1.290729, -3.453965, 1, 0.5921569, 0, 1,
-1.333294, -0.7821766, 0.03795051, 1, 0.6, 0, 1,
-1.327109, -0.4727798, -1.960686, 1, 0.6078432, 0, 1,
-1.326829, 0.7110519, -3.519646, 1, 0.6117647, 0, 1,
-1.314206, -1.153418, -3.168081, 1, 0.6196079, 0, 1,
-1.306121, -0.1092075, -1.254192, 1, 0.6235294, 0, 1,
-1.302709, -0.7230085, -1.342331, 1, 0.6313726, 0, 1,
-1.29822, -0.8283083, -0.6291496, 1, 0.6352941, 0, 1,
-1.296998, -0.2571952, -1.262523, 1, 0.6431373, 0, 1,
-1.284708, 0.4723387, -0.679089, 1, 0.6470588, 0, 1,
-1.274449, -0.1433928, -1.533391, 1, 0.654902, 0, 1,
-1.272055, 1.779513, -1.037332, 1, 0.6588235, 0, 1,
-1.269005, 0.6331995, -1.846911, 1, 0.6666667, 0, 1,
-1.265787, 0.4968174, -1.537675, 1, 0.6705883, 0, 1,
-1.248794, -0.0289604, -1.048446, 1, 0.6784314, 0, 1,
-1.24757, -0.997763, -2.955619, 1, 0.682353, 0, 1,
-1.232576, 0.2415723, -0.283865, 1, 0.6901961, 0, 1,
-1.220764, -1.090074, -1.545308, 1, 0.6941177, 0, 1,
-1.219364, 0.4639866, 0.4650919, 1, 0.7019608, 0, 1,
-1.219281, 2.781756, -0.4915606, 1, 0.7098039, 0, 1,
-1.218754, 0.2332436, -1.774533, 1, 0.7137255, 0, 1,
-1.197976, 1.004098, -0.6678216, 1, 0.7215686, 0, 1,
-1.19397, -0.7874401, -3.29666, 1, 0.7254902, 0, 1,
-1.19371, -0.3956097, -3.329719, 1, 0.7333333, 0, 1,
-1.188581, -1.518221, -1.780219, 1, 0.7372549, 0, 1,
-1.186939, 0.03289606, -0.1013114, 1, 0.7450981, 0, 1,
-1.186608, -0.7659194, -4.533577, 1, 0.7490196, 0, 1,
-1.184372, 1.308107, -0.3317387, 1, 0.7568628, 0, 1,
-1.168427, 1.360757, 0.4113062, 1, 0.7607843, 0, 1,
-1.159949, -0.06673931, -1.210314, 1, 0.7686275, 0, 1,
-1.159221, 1.1466, -1.53167, 1, 0.772549, 0, 1,
-1.158648, 0.06530164, -0.03930219, 1, 0.7803922, 0, 1,
-1.155356, -0.08569393, -2.286343, 1, 0.7843137, 0, 1,
-1.14213, -0.6597739, -3.735066, 1, 0.7921569, 0, 1,
-1.134363, -0.9610823, -4.297887, 1, 0.7960784, 0, 1,
-1.132179, 0.7676385, 0.0302868, 1, 0.8039216, 0, 1,
-1.128723, -0.06928036, -2.015168, 1, 0.8117647, 0, 1,
-1.126015, -1.091447, -2.617012, 1, 0.8156863, 0, 1,
-1.114042, -0.6726968, -2.091493, 1, 0.8235294, 0, 1,
-1.113539, 0.07506901, -1.578958, 1, 0.827451, 0, 1,
-1.113085, -0.2908842, -0.5610348, 1, 0.8352941, 0, 1,
-1.098394, -0.6810675, -0.9737959, 1, 0.8392157, 0, 1,
-1.078604, 2.483136, 2.205827, 1, 0.8470588, 0, 1,
-1.076875, 0.9303126, -0.8822752, 1, 0.8509804, 0, 1,
-1.071626, -0.9661271, -1.345742, 1, 0.8588235, 0, 1,
-1.065083, 0.4257248, -2.154754, 1, 0.8627451, 0, 1,
-1.064247, 1.043485, -2.020433, 1, 0.8705882, 0, 1,
-1.057279, 0.1949644, -2.741906, 1, 0.8745098, 0, 1,
-1.056587, 1.324805, 0.2796848, 1, 0.8823529, 0, 1,
-1.05467, 1.129714, -2.284847, 1, 0.8862745, 0, 1,
-1.053697, 2.237568, 0.4093303, 1, 0.8941177, 0, 1,
-1.053164, -0.4376761, -2.492691, 1, 0.8980392, 0, 1,
-1.04999, -1.986934, -0.2551208, 1, 0.9058824, 0, 1,
-1.048242, 1.245132, 0.2130414, 1, 0.9137255, 0, 1,
-1.046577, 0.7449166, -2.308455, 1, 0.9176471, 0, 1,
-1.038387, -0.5435648, -2.053527, 1, 0.9254902, 0, 1,
-1.021701, -1.382486, -1.487654, 1, 0.9294118, 0, 1,
-1.013372, 0.1355109, -2.115286, 1, 0.9372549, 0, 1,
-1.006688, -0.602449, -1.946856, 1, 0.9411765, 0, 1,
-1.004061, 2.07897, -0.9630665, 1, 0.9490196, 0, 1,
-0.9988853, 0.4005035, -1.624897, 1, 0.9529412, 0, 1,
-0.998579, 2.446598, 0.6915124, 1, 0.9607843, 0, 1,
-0.9974003, -1.285722, -1.768729, 1, 0.9647059, 0, 1,
-0.9963065, -0.9868503, -1.414034, 1, 0.972549, 0, 1,
-0.9943627, -1.394791, -2.282804, 1, 0.9764706, 0, 1,
-0.9936742, 0.3371916, -0.6252953, 1, 0.9843137, 0, 1,
-0.9856703, 0.4517345, -1.480463, 1, 0.9882353, 0, 1,
-0.9826871, 0.0762523, -3.375247, 1, 0.9960784, 0, 1,
-0.9737452, 0.851057, 0.3072318, 0.9960784, 1, 0, 1,
-0.9713326, 0.8458035, -1.206698, 0.9921569, 1, 0, 1,
-0.9701977, 0.00553529, -0.5450289, 0.9843137, 1, 0, 1,
-0.9645332, 1.092439, 0.2380309, 0.9803922, 1, 0, 1,
-0.9642049, -1.267699, -1.493604, 0.972549, 1, 0, 1,
-0.9602347, -1.105682, -4.892283, 0.9686275, 1, 0, 1,
-0.9559567, -0.5579627, -2.581743, 0.9607843, 1, 0, 1,
-0.9555401, -0.4348474, -1.921461, 0.9568627, 1, 0, 1,
-0.9548469, -0.1939407, -1.68866, 0.9490196, 1, 0, 1,
-0.9529293, -0.9529516, -1.915066, 0.945098, 1, 0, 1,
-0.9495842, 1.050951, -0.1737402, 0.9372549, 1, 0, 1,
-0.9445676, -1.238904, -3.221297, 0.9333333, 1, 0, 1,
-0.9415518, 2.7529, -0.4094937, 0.9254902, 1, 0, 1,
-0.939589, 0.582087, 0.04137309, 0.9215686, 1, 0, 1,
-0.9361529, 0.8993041, -1.832635, 0.9137255, 1, 0, 1,
-0.9286494, -2.062878, -2.810609, 0.9098039, 1, 0, 1,
-0.9255784, -1.38089, -2.295754, 0.9019608, 1, 0, 1,
-0.9244915, 1.971383, 0.06219304, 0.8941177, 1, 0, 1,
-0.9193059, 0.006064507, -1.019502, 0.8901961, 1, 0, 1,
-0.916061, -0.4127102, -1.07569, 0.8823529, 1, 0, 1,
-0.9160597, -0.7128775, -4.124336, 0.8784314, 1, 0, 1,
-0.9119318, 0.1500091, -1.289539, 0.8705882, 1, 0, 1,
-0.9057795, 0.1090022, -4.197938, 0.8666667, 1, 0, 1,
-0.9008793, -0.5716286, -3.070267, 0.8588235, 1, 0, 1,
-0.897332, 1.604408, -1.531879, 0.854902, 1, 0, 1,
-0.8951415, -0.01166132, 0.428593, 0.8470588, 1, 0, 1,
-0.8895689, 0.5270429, -1.878014, 0.8431373, 1, 0, 1,
-0.8863363, 1.223882, -1.018508, 0.8352941, 1, 0, 1,
-0.8814511, -0.4176196, -1.752792, 0.8313726, 1, 0, 1,
-0.8768175, -1.681313, -1.657886, 0.8235294, 1, 0, 1,
-0.8678492, 0.1438719, -1.275103, 0.8196079, 1, 0, 1,
-0.8670532, -0.1005045, -0.757044, 0.8117647, 1, 0, 1,
-0.8650529, 0.1879132, -0.4094913, 0.8078431, 1, 0, 1,
-0.8647766, -2.142759, -2.193246, 0.8, 1, 0, 1,
-0.8636543, 0.3550558, -2.544402, 0.7921569, 1, 0, 1,
-0.8602204, -0.7623471, -2.332483, 0.7882353, 1, 0, 1,
-0.8541272, 1.481289, 0.5773238, 0.7803922, 1, 0, 1,
-0.8487113, -0.2180019, -1.816131, 0.7764706, 1, 0, 1,
-0.8476487, -0.379891, -0.6604681, 0.7686275, 1, 0, 1,
-0.8444833, -1.088909, -2.716934, 0.7647059, 1, 0, 1,
-0.838402, 0.4142094, -2.055694, 0.7568628, 1, 0, 1,
-0.8374285, -0.1437407, -0.3999942, 0.7529412, 1, 0, 1,
-0.8366577, 0.9508284, -0.3527406, 0.7450981, 1, 0, 1,
-0.8330817, 0.7266024, 0.4998575, 0.7411765, 1, 0, 1,
-0.8317492, 0.04422675, 0.0534489, 0.7333333, 1, 0, 1,
-0.8168411, 0.03032412, -3.077109, 0.7294118, 1, 0, 1,
-0.8163747, 0.5207625, -2.717287, 0.7215686, 1, 0, 1,
-0.8106952, 0.429274, -0.635487, 0.7176471, 1, 0, 1,
-0.8074525, -0.5169771, -2.184612, 0.7098039, 1, 0, 1,
-0.8060632, -0.6876231, -2.696122, 0.7058824, 1, 0, 1,
-0.8050333, -0.1899601, -1.791748, 0.6980392, 1, 0, 1,
-0.7982446, -0.4718494, -2.616003, 0.6901961, 1, 0, 1,
-0.796447, 1.113443, -1.28125, 0.6862745, 1, 0, 1,
-0.7950386, 0.1099243, -1.791901, 0.6784314, 1, 0, 1,
-0.7815201, 0.07424264, -1.379269, 0.6745098, 1, 0, 1,
-0.7814298, -0.9264647, -2.528657, 0.6666667, 1, 0, 1,
-0.7674984, 0.4256914, -1.253779, 0.6627451, 1, 0, 1,
-0.7664044, 0.258756, -2.20848, 0.654902, 1, 0, 1,
-0.7614564, -0.4674376, -1.970223, 0.6509804, 1, 0, 1,
-0.75713, 1.028065, 0.009408101, 0.6431373, 1, 0, 1,
-0.7517152, 1.117478, -0.4663574, 0.6392157, 1, 0, 1,
-0.7495055, -0.6868093, -2.896361, 0.6313726, 1, 0, 1,
-0.7470078, -0.2875556, -1.5257, 0.627451, 1, 0, 1,
-0.7460985, -1.945038, -3.203722, 0.6196079, 1, 0, 1,
-0.7452745, 0.2404206, -1.911179, 0.6156863, 1, 0, 1,
-0.7452599, -0.4711224, -1.60564, 0.6078432, 1, 0, 1,
-0.7401712, -0.2635668, -1.861735, 0.6039216, 1, 0, 1,
-0.7396157, -1.429101, -3.540581, 0.5960785, 1, 0, 1,
-0.7390648, -1.848427, -1.21892, 0.5882353, 1, 0, 1,
-0.7365983, 0.4534904, 0.08565357, 0.5843138, 1, 0, 1,
-0.7337332, -1.196289, -1.67644, 0.5764706, 1, 0, 1,
-0.7316845, 1.273402, -3.129789, 0.572549, 1, 0, 1,
-0.7311754, -0.319698, -1.809562, 0.5647059, 1, 0, 1,
-0.7294944, 1.165788, -0.7899825, 0.5607843, 1, 0, 1,
-0.72552, 0.5636607, -1.584105, 0.5529412, 1, 0, 1,
-0.7171048, -1.284831, -3.224178, 0.5490196, 1, 0, 1,
-0.7152822, 2.147405, -0.8397067, 0.5411765, 1, 0, 1,
-0.7151152, -0.09208098, -2.303651, 0.5372549, 1, 0, 1,
-0.7127432, -0.8699446, -1.697891, 0.5294118, 1, 0, 1,
-0.7098305, -0.5663154, -1.839296, 0.5254902, 1, 0, 1,
-0.7082293, -1.629946, -2.409115, 0.5176471, 1, 0, 1,
-0.7018562, 0.169839, -0.9775105, 0.5137255, 1, 0, 1,
-0.7004922, 1.466746, -1.679062, 0.5058824, 1, 0, 1,
-0.7004273, -0.9761662, -2.882445, 0.5019608, 1, 0, 1,
-0.700105, -1.990643, -2.760566, 0.4941176, 1, 0, 1,
-0.6947882, 0.9063393, 0.8366508, 0.4862745, 1, 0, 1,
-0.6924868, 1.865948, 0.5065652, 0.4823529, 1, 0, 1,
-0.6903155, -0.1307832, -0.8858266, 0.4745098, 1, 0, 1,
-0.6900239, -0.1142462, -2.447027, 0.4705882, 1, 0, 1,
-0.6873205, 0.105813, -1.942714, 0.4627451, 1, 0, 1,
-0.6861565, 1.447101, -0.6983247, 0.4588235, 1, 0, 1,
-0.6839226, 1.168795, -0.4515245, 0.4509804, 1, 0, 1,
-0.6832071, -0.8629211, -1.526451, 0.4470588, 1, 0, 1,
-0.6787342, 1.771662, -0.2547757, 0.4392157, 1, 0, 1,
-0.6704197, 0.8167013, -2.663496, 0.4352941, 1, 0, 1,
-0.66135, 0.5019496, -0.3990844, 0.427451, 1, 0, 1,
-0.6566866, 0.01210913, -2.389913, 0.4235294, 1, 0, 1,
-0.6546977, -0.6065967, -3.915266, 0.4156863, 1, 0, 1,
-0.6529859, -0.09106894, -0.8695991, 0.4117647, 1, 0, 1,
-0.651742, -0.3280266, -2.060741, 0.4039216, 1, 0, 1,
-0.648307, 0.2000441, -1.011962, 0.3960784, 1, 0, 1,
-0.6458319, 0.7336434, -1.328181, 0.3921569, 1, 0, 1,
-0.6433908, 2.092398, -0.3395067, 0.3843137, 1, 0, 1,
-0.6410897, -0.7683356, -1.988954, 0.3803922, 1, 0, 1,
-0.6396521, 0.9862035, -1.46671, 0.372549, 1, 0, 1,
-0.6388329, -1.537204, -3.076832, 0.3686275, 1, 0, 1,
-0.6361539, 0.8208514, 0.9296944, 0.3607843, 1, 0, 1,
-0.6359515, -0.604583, -0.7443415, 0.3568628, 1, 0, 1,
-0.6342648, -0.3870918, -1.234353, 0.3490196, 1, 0, 1,
-0.6201114, 2.686375, -0.6898759, 0.345098, 1, 0, 1,
-0.6180651, 0.2632125, -0.5593051, 0.3372549, 1, 0, 1,
-0.6163197, -1.621125, -2.927123, 0.3333333, 1, 0, 1,
-0.6134436, -0.2258051, -1.556333, 0.3254902, 1, 0, 1,
-0.6102911, -0.5198256, -1.027687, 0.3215686, 1, 0, 1,
-0.6086274, -1.821192, -3.008111, 0.3137255, 1, 0, 1,
-0.6064648, 1.171892, -0.4696079, 0.3098039, 1, 0, 1,
-0.5977488, 1.02292, -1.368116, 0.3019608, 1, 0, 1,
-0.5970931, 1.632073, 0.2354092, 0.2941177, 1, 0, 1,
-0.5938447, 0.7969423, -2.05632, 0.2901961, 1, 0, 1,
-0.5915806, -1.066023, -1.422514, 0.282353, 1, 0, 1,
-0.5891489, 0.8065558, -0.8983006, 0.2784314, 1, 0, 1,
-0.5810335, 1.789738, 0.5413768, 0.2705882, 1, 0, 1,
-0.5775069, 0.6550137, -1.11031, 0.2666667, 1, 0, 1,
-0.576506, 0.6011425, -0.08259189, 0.2588235, 1, 0, 1,
-0.5748559, 0.7204672, -1.448295, 0.254902, 1, 0, 1,
-0.5738089, -0.9128698, -1.410793, 0.2470588, 1, 0, 1,
-0.5734537, 1.079665, 0.8960013, 0.2431373, 1, 0, 1,
-0.5727623, -0.8568484, -2.489291, 0.2352941, 1, 0, 1,
-0.5717463, 1.328759, -0.2788699, 0.2313726, 1, 0, 1,
-0.5715682, -0.6292275, -3.919393, 0.2235294, 1, 0, 1,
-0.5626577, -2.027969, -4.647363, 0.2196078, 1, 0, 1,
-0.5605742, -0.1568919, -3.551338, 0.2117647, 1, 0, 1,
-0.5563798, -0.2965553, -2.393679, 0.2078431, 1, 0, 1,
-0.5558519, -0.5801043, -1.839346, 0.2, 1, 0, 1,
-0.5545771, -0.5198156, -4.288999, 0.1921569, 1, 0, 1,
-0.5539229, 0.5817669, 0.6832052, 0.1882353, 1, 0, 1,
-0.5519388, -0.4603054, -3.098078, 0.1803922, 1, 0, 1,
-0.5452183, -0.8115505, -3.222657, 0.1764706, 1, 0, 1,
-0.5444847, -0.639881, -3.26573, 0.1686275, 1, 0, 1,
-0.5443598, 1.205775, -0.08277886, 0.1647059, 1, 0, 1,
-0.5417883, -0.5658055, -1.323285, 0.1568628, 1, 0, 1,
-0.5349033, -0.1580153, -0.9891148, 0.1529412, 1, 0, 1,
-0.5341442, 1.65448, 0.4663673, 0.145098, 1, 0, 1,
-0.5332376, 0.6155671, -0.4858938, 0.1411765, 1, 0, 1,
-0.5307866, -1.345851, -2.563706, 0.1333333, 1, 0, 1,
-0.5303009, 1.626526, -0.3097064, 0.1294118, 1, 0, 1,
-0.5290391, 1.233664, -0.7709202, 0.1215686, 1, 0, 1,
-0.5289608, -0.5663432, -3.415791, 0.1176471, 1, 0, 1,
-0.5282441, 0.1228032, -0.3834218, 0.1098039, 1, 0, 1,
-0.5262501, 0.557935, -0.1598988, 0.1058824, 1, 0, 1,
-0.5239857, -1.60139, -2.046001, 0.09803922, 1, 0, 1,
-0.5233337, -1.407172, -3.19751, 0.09019608, 1, 0, 1,
-0.5209135, 2.196766, -0.5744098, 0.08627451, 1, 0, 1,
-0.5205762, -1.385424, -4.786671, 0.07843138, 1, 0, 1,
-0.5104039, -0.0624055, -1.277265, 0.07450981, 1, 0, 1,
-0.510249, 0.3703023, -1.23847, 0.06666667, 1, 0, 1,
-0.5078141, -1.331189, -1.957577, 0.0627451, 1, 0, 1,
-0.5013447, -1.136185, -2.490373, 0.05490196, 1, 0, 1,
-0.5012195, -0.0300796, -5.114215, 0.05098039, 1, 0, 1,
-0.5005191, 0.3276898, 0.3204126, 0.04313726, 1, 0, 1,
-0.4994376, -0.3346845, -2.368341, 0.03921569, 1, 0, 1,
-0.4993192, 0.7435522, -0.7007508, 0.03137255, 1, 0, 1,
-0.4981347, -0.9593474, -3.472447, 0.02745098, 1, 0, 1,
-0.4951763, -0.07347757, -1.480028, 0.01960784, 1, 0, 1,
-0.493521, -0.1911631, -0.4272415, 0.01568628, 1, 0, 1,
-0.4905967, -0.9454069, -1.834881, 0.007843138, 1, 0, 1,
-0.4883677, -0.2430642, -2.512134, 0.003921569, 1, 0, 1,
-0.4872656, -1.679524, -2.385516, 0, 1, 0.003921569, 1,
-0.4852031, 0.1568656, -1.127062, 0, 1, 0.01176471, 1,
-0.4844597, 0.6935634, -1.705326, 0, 1, 0.01568628, 1,
-0.4834394, 0.2032593, 0.2922672, 0, 1, 0.02352941, 1,
-0.483353, -0.32982, -0.7663437, 0, 1, 0.02745098, 1,
-0.4778235, 0.02817987, -0.5227982, 0, 1, 0.03529412, 1,
-0.4722141, 1.462131, 0.7545698, 0, 1, 0.03921569, 1,
-0.4708288, -0.2122609, -2.162132, 0, 1, 0.04705882, 1,
-0.4653984, -0.3122562, -1.962923, 0, 1, 0.05098039, 1,
-0.4633256, -1.205029, -2.465166, 0, 1, 0.05882353, 1,
-0.4611238, 0.4779649, -1.308641, 0, 1, 0.0627451, 1,
-0.460929, -0.4151611, -0.8320776, 0, 1, 0.07058824, 1,
-0.4605489, 0.7248389, -0.5418015, 0, 1, 0.07450981, 1,
-0.4587368, 1.479379, -1.02059, 0, 1, 0.08235294, 1,
-0.4575791, -0.2476246, -2.612923, 0, 1, 0.08627451, 1,
-0.4515279, 0.6012618, -2.372476, 0, 1, 0.09411765, 1,
-0.450863, -1.329247, -0.923805, 0, 1, 0.1019608, 1,
-0.4500913, -1.193242, -1.754475, 0, 1, 0.1058824, 1,
-0.4492844, -0.8037043, -3.689652, 0, 1, 0.1137255, 1,
-0.4449953, -1.155395, -3.71186, 0, 1, 0.1176471, 1,
-0.4447203, 0.1291347, -1.589209, 0, 1, 0.1254902, 1,
-0.4437372, -1.249422, -3.32327, 0, 1, 0.1294118, 1,
-0.4405258, -1.384793, -3.602176, 0, 1, 0.1372549, 1,
-0.4370382, 0.3275664, -1.005658, 0, 1, 0.1411765, 1,
-0.4339403, 0.1419472, -1.531444, 0, 1, 0.1490196, 1,
-0.4325126, 0.2662971, 0.2275997, 0, 1, 0.1529412, 1,
-0.4304768, 0.3511401, -1.676271, 0, 1, 0.1607843, 1,
-0.4278567, 1.309256, -2.672293, 0, 1, 0.1647059, 1,
-0.4242625, -0.03700096, 0.5554395, 0, 1, 0.172549, 1,
-0.4229247, -0.7309897, -2.387828, 0, 1, 0.1764706, 1,
-0.4210084, -0.233536, -1.703321, 0, 1, 0.1843137, 1,
-0.4189782, 2.401246, 0.4546337, 0, 1, 0.1882353, 1,
-0.4189256, -0.5980626, -3.170262, 0, 1, 0.1960784, 1,
-0.4183438, -0.07732025, -0.5633907, 0, 1, 0.2039216, 1,
-0.4161974, 0.03827571, -2.870964, 0, 1, 0.2078431, 1,
-0.4123394, -1.187708, -3.113936, 0, 1, 0.2156863, 1,
-0.4030074, -0.807349, -1.596184, 0, 1, 0.2196078, 1,
-0.3998354, -0.1713995, -2.34248, 0, 1, 0.227451, 1,
-0.3993827, 1.313749, 0.6039732, 0, 1, 0.2313726, 1,
-0.3906792, 0.1948358, -1.630737, 0, 1, 0.2392157, 1,
-0.3905653, 0.7051941, -0.3158257, 0, 1, 0.2431373, 1,
-0.3901769, 1.018121, -0.1575341, 0, 1, 0.2509804, 1,
-0.3813049, 0.2364065, 0.243389, 0, 1, 0.254902, 1,
-0.3804325, -0.01198795, -0.06600562, 0, 1, 0.2627451, 1,
-0.380119, 0.7663653, -1.047675, 0, 1, 0.2666667, 1,
-0.3735521, -0.7971399, -2.325389, 0, 1, 0.2745098, 1,
-0.3702758, -0.4789548, -3.634935, 0, 1, 0.2784314, 1,
-0.3697449, 0.524613, -2.342325, 0, 1, 0.2862745, 1,
-0.3668901, -0.3779394, -1.284631, 0, 1, 0.2901961, 1,
-0.3641466, 1.055366, 0.5015604, 0, 1, 0.2980392, 1,
-0.3600825, 0.1865787, -3.389516, 0, 1, 0.3058824, 1,
-0.3564635, -0.6381404, -4.316518, 0, 1, 0.3098039, 1,
-0.3561239, 0.2998451, -0.2667607, 0, 1, 0.3176471, 1,
-0.3342056, 0.1001637, -0.8729896, 0, 1, 0.3215686, 1,
-0.3311955, 2.600468, 0.4741874, 0, 1, 0.3294118, 1,
-0.3295486, -0.03674695, -1.343924, 0, 1, 0.3333333, 1,
-0.3268967, -0.04794321, -1.352809, 0, 1, 0.3411765, 1,
-0.325141, 0.3938743, -0.6358529, 0, 1, 0.345098, 1,
-0.3237869, -0.05222167, -0.009320722, 0, 1, 0.3529412, 1,
-0.3236905, -0.4502569, -2.608843, 0, 1, 0.3568628, 1,
-0.3136847, -1.518476, -3.251505, 0, 1, 0.3647059, 1,
-0.3095552, -0.4655217, -3.444878, 0, 1, 0.3686275, 1,
-0.3093544, -0.8625364, -2.111394, 0, 1, 0.3764706, 1,
-0.2958339, -0.1396647, -1.562138, 0, 1, 0.3803922, 1,
-0.2950497, -0.24162, -2.382163, 0, 1, 0.3882353, 1,
-0.294194, 0.02532913, -2.127174, 0, 1, 0.3921569, 1,
-0.2915247, -0.2933801, -2.952696, 0, 1, 0.4, 1,
-0.2880678, 0.006394875, -1.167656, 0, 1, 0.4078431, 1,
-0.2830477, 1.715132, -0.4781968, 0, 1, 0.4117647, 1,
-0.2760376, -1.658824, -2.015637, 0, 1, 0.4196078, 1,
-0.2743776, 1.835274, 1.819121, 0, 1, 0.4235294, 1,
-0.2737899, 0.562219, -0.7334137, 0, 1, 0.4313726, 1,
-0.2699347, 0.3051366, -0.6746302, 0, 1, 0.4352941, 1,
-0.2692215, -0.5158702, -3.101972, 0, 1, 0.4431373, 1,
-0.2664345, 1.553708, 0.371992, 0, 1, 0.4470588, 1,
-0.2581451, -0.8599274, -2.974809, 0, 1, 0.454902, 1,
-0.25676, -0.07842702, -2.240605, 0, 1, 0.4588235, 1,
-0.2496733, 0.823282, 0.6562664, 0, 1, 0.4666667, 1,
-0.2480611, -0.8056712, -1.739337, 0, 1, 0.4705882, 1,
-0.2451967, 0.6283414, -1.405145, 0, 1, 0.4784314, 1,
-0.2419031, -1.219297, -2.055851, 0, 1, 0.4823529, 1,
-0.2390354, 2.262678, 1.110793, 0, 1, 0.4901961, 1,
-0.2377423, 0.7540286, 1.055589, 0, 1, 0.4941176, 1,
-0.236155, -1.062325, -1.183602, 0, 1, 0.5019608, 1,
-0.2297387, -0.5294936, -2.68384, 0, 1, 0.509804, 1,
-0.2251595, 0.4921365, 0.8600858, 0, 1, 0.5137255, 1,
-0.2178589, -0.4390284, -3.188112, 0, 1, 0.5215687, 1,
-0.2175166, 1.160019, -0.4472252, 0, 1, 0.5254902, 1,
-0.2096766, -2.296703, -4.405183, 0, 1, 0.5333334, 1,
-0.2081814, -0.5943276, -3.544893, 0, 1, 0.5372549, 1,
-0.2042476, -0.2858718, -1.480469, 0, 1, 0.5450981, 1,
-0.2024857, -0.5259697, -4.038938, 0, 1, 0.5490196, 1,
-0.2023433, 0.7603724, -0.4087998, 0, 1, 0.5568628, 1,
-0.1990226, 0.08264612, 1.690429, 0, 1, 0.5607843, 1,
-0.1975286, 0.831214, 0.5990272, 0, 1, 0.5686275, 1,
-0.1934551, -1.683021, -3.60687, 0, 1, 0.572549, 1,
-0.1910745, 0.4754438, -0.5067908, 0, 1, 0.5803922, 1,
-0.1880693, 0.2552213, -0.7935897, 0, 1, 0.5843138, 1,
-0.1871373, 0.02829928, -2.241948, 0, 1, 0.5921569, 1,
-0.1752467, -1.584417, -2.430254, 0, 1, 0.5960785, 1,
-0.1690846, -1.044557, -1.540733, 0, 1, 0.6039216, 1,
-0.1624299, 1.760648, -0.01984358, 0, 1, 0.6117647, 1,
-0.1601437, -0.5319078, -3.09735, 0, 1, 0.6156863, 1,
-0.1596589, -1.911488, -2.806957, 0, 1, 0.6235294, 1,
-0.1591212, -0.3202653, -1.77743, 0, 1, 0.627451, 1,
-0.1558839, -0.7385413, -2.233224, 0, 1, 0.6352941, 1,
-0.1518247, 0.2560335, 1.398925, 0, 1, 0.6392157, 1,
-0.1462844, 0.4002654, -0.9915399, 0, 1, 0.6470588, 1,
-0.1448877, 0.3606105, 1.024695, 0, 1, 0.6509804, 1,
-0.1392785, -1.018921, -3.930475, 0, 1, 0.6588235, 1,
-0.1387122, -0.11836, -3.372256, 0, 1, 0.6627451, 1,
-0.1383922, -0.997953, -3.746294, 0, 1, 0.6705883, 1,
-0.1376862, -0.5865847, -4.746972, 0, 1, 0.6745098, 1,
-0.1343056, 0.03174084, -1.937093, 0, 1, 0.682353, 1,
-0.1313719, 1.435231, 1.787281, 0, 1, 0.6862745, 1,
-0.1312167, 1.052872, 0.156737, 0, 1, 0.6941177, 1,
-0.1308211, -1.034471, -3.666861, 0, 1, 0.7019608, 1,
-0.1295598, 0.9545199, 0.5015472, 0, 1, 0.7058824, 1,
-0.1279464, 0.8802066, 0.3752587, 0, 1, 0.7137255, 1,
-0.1256579, 1.035343, 1.298058, 0, 1, 0.7176471, 1,
-0.1247525, 1.880306, 0.7248281, 0, 1, 0.7254902, 1,
-0.1243751, -1.402627, -2.194111, 0, 1, 0.7294118, 1,
-0.1235647, 0.3446728, -0.6801947, 0, 1, 0.7372549, 1,
-0.1206119, -0.727196, -2.778586, 0, 1, 0.7411765, 1,
-0.1187831, -0.8937225, -1.171207, 0, 1, 0.7490196, 1,
-0.1159446, -0.9126409, -2.596617, 0, 1, 0.7529412, 1,
-0.1156448, 1.901503, 0.7857977, 0, 1, 0.7607843, 1,
-0.1156277, 0.8014395, 0.0810807, 0, 1, 0.7647059, 1,
-0.1127253, -0.3154121, -2.322158, 0, 1, 0.772549, 1,
-0.1076908, 2.14814, -1.906959, 0, 1, 0.7764706, 1,
-0.1048422, -1.023007, -2.588731, 0, 1, 0.7843137, 1,
-0.1025487, -1.076515, -2.367862, 0, 1, 0.7882353, 1,
-0.1019292, -0.6840808, -1.902652, 0, 1, 0.7960784, 1,
-0.1012837, 0.6946966, 0.4469125, 0, 1, 0.8039216, 1,
-0.09662184, 0.8919924, -0.04871801, 0, 1, 0.8078431, 1,
-0.09634061, -0.6164906, -3.687237, 0, 1, 0.8156863, 1,
-0.0949012, -0.5341836, -3.077007, 0, 1, 0.8196079, 1,
-0.09187322, -0.9619284, -3.426215, 0, 1, 0.827451, 1,
-0.08901411, -1.404543, -2.852337, 0, 1, 0.8313726, 1,
-0.08069639, -0.8945395, -3.781309, 0, 1, 0.8392157, 1,
-0.07963382, 0.0385601, -1.733098, 0, 1, 0.8431373, 1,
-0.07506559, 1.091846, -0.3981704, 0, 1, 0.8509804, 1,
-0.07270601, 0.05589317, -0.1735923, 0, 1, 0.854902, 1,
-0.07210712, 1.301864, -1.278962, 0, 1, 0.8627451, 1,
-0.07082471, 1.655269, -0.7057863, 0, 1, 0.8666667, 1,
-0.0703393, 1.109778, -0.9443608, 0, 1, 0.8745098, 1,
-0.06842899, -1.206478, -4.044995, 0, 1, 0.8784314, 1,
-0.06573502, -2.368755, -4.285497, 0, 1, 0.8862745, 1,
-0.0650444, -0.8902366, -2.836345, 0, 1, 0.8901961, 1,
-0.06251242, -0.136553, -1.112531, 0, 1, 0.8980392, 1,
-0.05651289, -0.2618205, -1.688837, 0, 1, 0.9058824, 1,
-0.05562561, -0.2125312, -1.728261, 0, 1, 0.9098039, 1,
-0.05555791, -1.853508, -3.331358, 0, 1, 0.9176471, 1,
-0.05205845, -0.3659092, -4.285617, 0, 1, 0.9215686, 1,
-0.04797454, -2.476668, -2.574843, 0, 1, 0.9294118, 1,
-0.04763373, -0.06235144, -2.71077, 0, 1, 0.9333333, 1,
-0.04657485, 0.04834581, -1.828559, 0, 1, 0.9411765, 1,
-0.04639906, 1.183093, -2.174992, 0, 1, 0.945098, 1,
-0.04150164, -0.224279, -3.650837, 0, 1, 0.9529412, 1,
-0.03643565, -1.615691, -2.846369, 0, 1, 0.9568627, 1,
-0.03455092, -0.6699412, -2.430211, 0, 1, 0.9647059, 1,
-0.03206364, -0.3451131, -2.995279, 0, 1, 0.9686275, 1,
-0.02584252, 1.177896, 1.159497, 0, 1, 0.9764706, 1,
-0.02510487, -0.1830376, -4.613067, 0, 1, 0.9803922, 1,
-0.02506374, -0.6174241, -4.711321, 0, 1, 0.9882353, 1,
-0.02295324, -0.3272524, -3.569069, 0, 1, 0.9921569, 1,
-0.02293397, 0.3283071, -0.815385, 0, 1, 1, 1,
-0.02267464, 0.564667, -2.00724, 0, 0.9921569, 1, 1,
-0.01917124, 1.396543, 0.4550635, 0, 0.9882353, 1, 1,
-0.01861384, 1.185076, -2.096132, 0, 0.9803922, 1, 1,
-0.01680326, -0.7027803, -3.611753, 0, 0.9764706, 1, 1,
-0.01530741, 1.351828, -0.1140263, 0, 0.9686275, 1, 1,
-0.01508005, -0.3021605, -3.837395, 0, 0.9647059, 1, 1,
-0.00926581, 0.6300951, -2.105439, 0, 0.9568627, 1, 1,
-0.00155925, -0.3084843, -2.814771, 0, 0.9529412, 1, 1,
0.003289857, 0.2335751, 0.1741002, 0, 0.945098, 1, 1,
0.003332459, -0.3049965, 4.141695, 0, 0.9411765, 1, 1,
0.004645589, -0.904599, 3.129323, 0, 0.9333333, 1, 1,
0.006183011, 1.25178, -0.0737408, 0, 0.9294118, 1, 1,
0.006989087, -0.8592238, 3.105903, 0, 0.9215686, 1, 1,
0.01260611, -0.667556, 3.572749, 0, 0.9176471, 1, 1,
0.01267004, 1.082653, 0.3440671, 0, 0.9098039, 1, 1,
0.0147886, 1.381268, -0.9554681, 0, 0.9058824, 1, 1,
0.01644976, -1.852864, 1.603148, 0, 0.8980392, 1, 1,
0.0183351, 0.6410561, 0.4326654, 0, 0.8901961, 1, 1,
0.02059531, -1.068379, 4.388584, 0, 0.8862745, 1, 1,
0.02568101, -0.02704745, 4.183372, 0, 0.8784314, 1, 1,
0.03077006, 0.9717634, -0.5682538, 0, 0.8745098, 1, 1,
0.03302974, 0.9228006, 1.475856, 0, 0.8666667, 1, 1,
0.03824592, -0.4573659, 3.543532, 0, 0.8627451, 1, 1,
0.03883749, 1.144071, -0.1438825, 0, 0.854902, 1, 1,
0.04370734, -1.547839, 1.097251, 0, 0.8509804, 1, 1,
0.04573269, -1.764855, 3.922831, 0, 0.8431373, 1, 1,
0.04774792, -0.7651598, 3.64573, 0, 0.8392157, 1, 1,
0.05315471, 0.03302198, 0.6747993, 0, 0.8313726, 1, 1,
0.05632297, 1.784515, 1.0282, 0, 0.827451, 1, 1,
0.05728837, 0.2947195, -1.677233, 0, 0.8196079, 1, 1,
0.06013497, 0.5352439, 1.012442, 0, 0.8156863, 1, 1,
0.06146743, -0.1349337, 2.419462, 0, 0.8078431, 1, 1,
0.06240575, 1.873251, 1.289857, 0, 0.8039216, 1, 1,
0.06596525, 0.6031417, -1.513074, 0, 0.7960784, 1, 1,
0.06768335, -0.3554021, 1.870814, 0, 0.7882353, 1, 1,
0.06771258, 2.073309, 1.391195, 0, 0.7843137, 1, 1,
0.06798682, -0.8191485, 4.732166, 0, 0.7764706, 1, 1,
0.06902342, -0.6588697, 3.285571, 0, 0.772549, 1, 1,
0.06932244, 1.666942, -0.8077972, 0, 0.7647059, 1, 1,
0.06934571, 0.5850466, 0.7613437, 0, 0.7607843, 1, 1,
0.07400489, 0.8545533, 0.8657182, 0, 0.7529412, 1, 1,
0.07455756, 0.9480791, 0.07337093, 0, 0.7490196, 1, 1,
0.07633999, -0.8900857, 3.200202, 0, 0.7411765, 1, 1,
0.07856499, 1.158669, -0.3717139, 0, 0.7372549, 1, 1,
0.07942166, -0.4787466, 3.288587, 0, 0.7294118, 1, 1,
0.08654242, 0.9719096, 2.483571, 0, 0.7254902, 1, 1,
0.08833364, 0.4715346, 0.9419653, 0, 0.7176471, 1, 1,
0.09846036, -0.9579889, 4.084581, 0, 0.7137255, 1, 1,
0.09896049, 0.5091359, -0.2129917, 0, 0.7058824, 1, 1,
0.09982985, 0.05746988, -0.1428521, 0, 0.6980392, 1, 1,
0.1038265, 0.09457356, -0.2496056, 0, 0.6941177, 1, 1,
0.1071298, -0.4420865, 1.989552, 0, 0.6862745, 1, 1,
0.1071423, -1.208177, 1.105904, 0, 0.682353, 1, 1,
0.1072846, -0.1894689, 2.278663, 0, 0.6745098, 1, 1,
0.1162515, -1.108273, 1.874747, 0, 0.6705883, 1, 1,
0.1185546, 1.193133, -0.5010183, 0, 0.6627451, 1, 1,
0.1189693, 0.1676979, 1.097613, 0, 0.6588235, 1, 1,
0.1194439, 2.179043, 1.68086, 0, 0.6509804, 1, 1,
0.1237114, -2.155993, 3.206987, 0, 0.6470588, 1, 1,
0.1256823, -0.2532099, 4.008123, 0, 0.6392157, 1, 1,
0.1263963, -0.516516, 1.89375, 0, 0.6352941, 1, 1,
0.1295375, 0.1845282, 0.1767219, 0, 0.627451, 1, 1,
0.1299853, 0.333921, 0.06816265, 0, 0.6235294, 1, 1,
0.132579, -0.03394821, 2.516614, 0, 0.6156863, 1, 1,
0.1339387, 0.7775661, -0.8040977, 0, 0.6117647, 1, 1,
0.137724, -1.400331, 3.327241, 0, 0.6039216, 1, 1,
0.1397162, 0.8529825, -0.3150913, 0, 0.5960785, 1, 1,
0.144943, -0.2817352, 2.771761, 0, 0.5921569, 1, 1,
0.1465172, -0.4326392, 1.289424, 0, 0.5843138, 1, 1,
0.1489861, -0.787011, 2.9777, 0, 0.5803922, 1, 1,
0.1520103, 0.6442154, 1.803282, 0, 0.572549, 1, 1,
0.1582419, -0.8548656, 2.152415, 0, 0.5686275, 1, 1,
0.1608192, 0.09238135, 0.03275413, 0, 0.5607843, 1, 1,
0.1612207, -0.4080337, 1.140338, 0, 0.5568628, 1, 1,
0.1629344, -1.466979, 3.719238, 0, 0.5490196, 1, 1,
0.1634626, 1.446588, -0.6954336, 0, 0.5450981, 1, 1,
0.1642822, 0.7176201, 0.87279, 0, 0.5372549, 1, 1,
0.1694124, -1.021218, 3.754456, 0, 0.5333334, 1, 1,
0.1729762, 0.0163367, 2.124229, 0, 0.5254902, 1, 1,
0.173423, 0.02955631, 3.009758, 0, 0.5215687, 1, 1,
0.1745652, -0.8325782, 3.805973, 0, 0.5137255, 1, 1,
0.1768813, -0.3635975, 2.413089, 0, 0.509804, 1, 1,
0.1777806, -0.6036498, 1.561369, 0, 0.5019608, 1, 1,
0.1788779, -1.857927, 3.624662, 0, 0.4941176, 1, 1,
0.1811978, -0.1887764, 1.23481, 0, 0.4901961, 1, 1,
0.1823006, -0.3228044, 2.280954, 0, 0.4823529, 1, 1,
0.1843964, 1.410447, -0.5147346, 0, 0.4784314, 1, 1,
0.1865978, 0.8603408, 0.550158, 0, 0.4705882, 1, 1,
0.187269, -2.024247, 4.409565, 0, 0.4666667, 1, 1,
0.1878909, -0.5123206, 3.025572, 0, 0.4588235, 1, 1,
0.1905906, -1.450589, 2.643796, 0, 0.454902, 1, 1,
0.1915244, -0.3204107, 1.153263, 0, 0.4470588, 1, 1,
0.1925982, -0.04008559, 2.675934, 0, 0.4431373, 1, 1,
0.1926447, 0.4770347, 0.8434872, 0, 0.4352941, 1, 1,
0.1929171, -0.5756938, 1.764334, 0, 0.4313726, 1, 1,
0.2008622, 0.1871311, -0.6782322, 0, 0.4235294, 1, 1,
0.210178, 0.3271445, 0.4645643, 0, 0.4196078, 1, 1,
0.2104765, -0.7579491, 3.127885, 0, 0.4117647, 1, 1,
0.2107136, 1.798294, 2.33503, 0, 0.4078431, 1, 1,
0.2142418, 0.8283691, -0.6062332, 0, 0.4, 1, 1,
0.2186153, -0.9252104, 2.664252, 0, 0.3921569, 1, 1,
0.2191097, 0.5492908, 1.12487, 0, 0.3882353, 1, 1,
0.2230348, -0.5044005, 2.955054, 0, 0.3803922, 1, 1,
0.2237944, 0.059792, 1.446905, 0, 0.3764706, 1, 1,
0.2318358, -1.328436, 1.068094, 0, 0.3686275, 1, 1,
0.2331273, 1.453835, -0.8933828, 0, 0.3647059, 1, 1,
0.2386257, 2.153563, -2.255131, 0, 0.3568628, 1, 1,
0.2439912, 0.3038201, -1.377032, 0, 0.3529412, 1, 1,
0.2441271, 0.9916003, 0.2858942, 0, 0.345098, 1, 1,
0.2516155, 0.4565901, 0.7400402, 0, 0.3411765, 1, 1,
0.2536106, -0.5783838, 2.789549, 0, 0.3333333, 1, 1,
0.2538747, 0.7376046, 0.7038442, 0, 0.3294118, 1, 1,
0.2544774, -1.599783, 2.916342, 0, 0.3215686, 1, 1,
0.2557526, -0.534606, 3.152279, 0, 0.3176471, 1, 1,
0.2593855, -0.9212042, 2.619276, 0, 0.3098039, 1, 1,
0.2681409, -0.2510673, 2.827427, 0, 0.3058824, 1, 1,
0.2705761, -0.05024846, 1.659457, 0, 0.2980392, 1, 1,
0.2711239, 0.8074952, -0.03141197, 0, 0.2901961, 1, 1,
0.2756902, 2.144532, -0.5535603, 0, 0.2862745, 1, 1,
0.2906003, 1.26836, -0.09904012, 0, 0.2784314, 1, 1,
0.2928575, -0.9254309, 4.050673, 0, 0.2745098, 1, 1,
0.2953387, 0.4510695, 2.055749, 0, 0.2666667, 1, 1,
0.3005978, 0.9369163, 0.6997309, 0, 0.2627451, 1, 1,
0.3025417, -0.8441002, 3.635205, 0, 0.254902, 1, 1,
0.3040848, -1.521571, 4.233572, 0, 0.2509804, 1, 1,
0.3045265, 1.081434, 1.351991, 0, 0.2431373, 1, 1,
0.3057821, 1.240036, -0.1560481, 0, 0.2392157, 1, 1,
0.3063206, 0.03922808, -0.5020621, 0, 0.2313726, 1, 1,
0.3079977, 0.6062841, -1.491791, 0, 0.227451, 1, 1,
0.3121999, -0.1670653, 1.78776, 0, 0.2196078, 1, 1,
0.313939, 0.9707372, -0.3346641, 0, 0.2156863, 1, 1,
0.3178899, -2.038203, 4.695912, 0, 0.2078431, 1, 1,
0.3225526, 0.4374686, -0.04686897, 0, 0.2039216, 1, 1,
0.324668, -0.5941752, 2.418676, 0, 0.1960784, 1, 1,
0.326693, 1.690252, 1.135396, 0, 0.1882353, 1, 1,
0.3268989, -1.263095, 2.831926, 0, 0.1843137, 1, 1,
0.3270139, 0.5776893, 0.2345263, 0, 0.1764706, 1, 1,
0.3334858, -0.1875287, 0.6736251, 0, 0.172549, 1, 1,
0.3335075, 0.7046068, -0.346554, 0, 0.1647059, 1, 1,
0.3362311, -0.1881032, 2.462378, 0, 0.1607843, 1, 1,
0.3387575, 0.3203181, 1.281531, 0, 0.1529412, 1, 1,
0.3413122, -1.271797, 2.937567, 0, 0.1490196, 1, 1,
0.3417399, -0.616666, 3.374816, 0, 0.1411765, 1, 1,
0.3452017, 1.681068, 0.7518975, 0, 0.1372549, 1, 1,
0.3467518, -0.01566676, 0.9745383, 0, 0.1294118, 1, 1,
0.3489446, -2.173647, 1.611075, 0, 0.1254902, 1, 1,
0.3492627, -0.6052381, 1.810998, 0, 0.1176471, 1, 1,
0.3500023, -0.2085613, 1.581753, 0, 0.1137255, 1, 1,
0.3500856, 0.89276, 0.2820863, 0, 0.1058824, 1, 1,
0.3528439, 0.839693, -1.727351, 0, 0.09803922, 1, 1,
0.3535147, -0.2529383, 0.9357663, 0, 0.09411765, 1, 1,
0.3556323, -0.7564323, 2.110448, 0, 0.08627451, 1, 1,
0.356376, -0.6052306, 2.389304, 0, 0.08235294, 1, 1,
0.3602851, 1.165485, 0.8964361, 0, 0.07450981, 1, 1,
0.3612295, 0.4373531, 1.186381, 0, 0.07058824, 1, 1,
0.3628774, -0.3235393, 2.360909, 0, 0.0627451, 1, 1,
0.3701606, 1.013439, 0.6378863, 0, 0.05882353, 1, 1,
0.3756579, -1.951843, 2.670584, 0, 0.05098039, 1, 1,
0.3798181, -0.8626128, 2.636345, 0, 0.04705882, 1, 1,
0.3804104, -1.312248, 3.384211, 0, 0.03921569, 1, 1,
0.385771, -1.203418, 3.741976, 0, 0.03529412, 1, 1,
0.3858001, 0.7209834, 1.233332, 0, 0.02745098, 1, 1,
0.3858379, 0.8775633, 1.013958, 0, 0.02352941, 1, 1,
0.3862185, -0.6234222, 1.564944, 0, 0.01568628, 1, 1,
0.3866305, -0.08370304, 1.673164, 0, 0.01176471, 1, 1,
0.3878759, 0.1978468, 2.065898, 0, 0.003921569, 1, 1,
0.3895003, 0.5292891, 0.4589901, 0.003921569, 0, 1, 1,
0.3956229, 1.582297, -0.2454283, 0.007843138, 0, 1, 1,
0.4020893, 1.319971, 1.247537, 0.01568628, 0, 1, 1,
0.4071822, 0.2979035, 1.149581, 0.01960784, 0, 1, 1,
0.4073021, 1.324813, -0.3959377, 0.02745098, 0, 1, 1,
0.4076945, -0.5401838, 1.886003, 0.03137255, 0, 1, 1,
0.4147414, -0.2773305, 2.940681, 0.03921569, 0, 1, 1,
0.4157394, 0.6176506, -0.1842469, 0.04313726, 0, 1, 1,
0.421835, -0.1299672, 0.8578174, 0.05098039, 0, 1, 1,
0.4218642, -0.6886567, 3.054978, 0.05490196, 0, 1, 1,
0.4274252, -0.2723735, 2.401775, 0.0627451, 0, 1, 1,
0.427687, 1.406405, 1.827793, 0.06666667, 0, 1, 1,
0.4292063, 0.5767959, 0.5289625, 0.07450981, 0, 1, 1,
0.4306386, -0.8451141, 2.423695, 0.07843138, 0, 1, 1,
0.4335071, -1.604884, 2.773964, 0.08627451, 0, 1, 1,
0.4365056, 0.7588014, -0.5814962, 0.09019608, 0, 1, 1,
0.4368338, 0.6107327, 2.53835, 0.09803922, 0, 1, 1,
0.4369355, -0.4463211, 2.849415, 0.1058824, 0, 1, 1,
0.4374488, 0.795595, -1.217783, 0.1098039, 0, 1, 1,
0.44017, 0.7442229, 1.55089, 0.1176471, 0, 1, 1,
0.4501664, -1.102319, 2.155579, 0.1215686, 0, 1, 1,
0.4538625, 1.590325, 0.4254194, 0.1294118, 0, 1, 1,
0.4582182, -0.3060943, 2.410751, 0.1333333, 0, 1, 1,
0.4706338, -0.1831118, 1.959662, 0.1411765, 0, 1, 1,
0.477225, 0.01921204, 3.160271, 0.145098, 0, 1, 1,
0.4773699, -0.06290973, 3.045129, 0.1529412, 0, 1, 1,
0.4774872, -1.176966, 2.728068, 0.1568628, 0, 1, 1,
0.4784592, -0.7370713, 1.943596, 0.1647059, 0, 1, 1,
0.4820914, -0.3830908, 3.916964, 0.1686275, 0, 1, 1,
0.4826895, 0.4116218, 1.033271, 0.1764706, 0, 1, 1,
0.489389, -0.1657679, 3.866209, 0.1803922, 0, 1, 1,
0.4894938, -0.8258526, 2.350037, 0.1882353, 0, 1, 1,
0.4927939, 0.4814451, 0.2247463, 0.1921569, 0, 1, 1,
0.4934929, -1.323174, 3.376927, 0.2, 0, 1, 1,
0.5016096, -0.2219242, 0.7999036, 0.2078431, 0, 1, 1,
0.5058236, -0.1641611, 2.088817, 0.2117647, 0, 1, 1,
0.5119846, 1.192819, 0.8091279, 0.2196078, 0, 1, 1,
0.5138254, -1.278521, 2.976337, 0.2235294, 0, 1, 1,
0.515367, -0.3696616, 2.043039, 0.2313726, 0, 1, 1,
0.5256092, 0.167781, 1.466528, 0.2352941, 0, 1, 1,
0.526628, -0.2882093, 2.278672, 0.2431373, 0, 1, 1,
0.526746, -0.3472152, 0.1512586, 0.2470588, 0, 1, 1,
0.5283763, 1.371965, 0.5873662, 0.254902, 0, 1, 1,
0.5297022, 0.3631078, 1.137075, 0.2588235, 0, 1, 1,
0.5311451, -0.1600752, 2.732333, 0.2666667, 0, 1, 1,
0.5354437, 0.01856791, 3.237336, 0.2705882, 0, 1, 1,
0.5382215, -0.7779086, 2.691632, 0.2784314, 0, 1, 1,
0.5405312, -1.791756, 2.557666, 0.282353, 0, 1, 1,
0.5426886, 0.7129008, -0.0746727, 0.2901961, 0, 1, 1,
0.547386, 0.4625805, 0.08785706, 0.2941177, 0, 1, 1,
0.5479237, 0.2007919, -0.5584374, 0.3019608, 0, 1, 1,
0.5490934, -0.1093491, 1.522806, 0.3098039, 0, 1, 1,
0.5560923, -0.1221388, 1.576491, 0.3137255, 0, 1, 1,
0.5571168, -0.9774021, 3.107157, 0.3215686, 0, 1, 1,
0.5573993, -1.248353, 3.665314, 0.3254902, 0, 1, 1,
0.5596002, -1.150081, 2.315154, 0.3333333, 0, 1, 1,
0.5596183, 1.037246, -0.8124256, 0.3372549, 0, 1, 1,
0.560372, 1.515626, 0.5568469, 0.345098, 0, 1, 1,
0.562035, 0.3353834, 1.309122, 0.3490196, 0, 1, 1,
0.5627843, -0.1593154, 1.444255, 0.3568628, 0, 1, 1,
0.5638356, 0.3271093, 1.329307, 0.3607843, 0, 1, 1,
0.5703698, -0.293931, 2.235411, 0.3686275, 0, 1, 1,
0.5794828, 0.2639592, 1.668566, 0.372549, 0, 1, 1,
0.580224, -0.2397952, 2.452212, 0.3803922, 0, 1, 1,
0.5860877, 0.2202745, 1.652001, 0.3843137, 0, 1, 1,
0.5893094, -0.3003354, 2.442189, 0.3921569, 0, 1, 1,
0.5917644, 1.070788, -0.7304519, 0.3960784, 0, 1, 1,
0.5958869, 0.0204553, -0.02988848, 0.4039216, 0, 1, 1,
0.6071003, 1.094726, 0.09245253, 0.4117647, 0, 1, 1,
0.6101452, -0.7148119, 2.31688, 0.4156863, 0, 1, 1,
0.6143379, -0.6967329, 2.483677, 0.4235294, 0, 1, 1,
0.6169657, 1.114311, 0.6431862, 0.427451, 0, 1, 1,
0.6203088, -0.1301661, 0.6928023, 0.4352941, 0, 1, 1,
0.6226557, -0.277462, -0.1877919, 0.4392157, 0, 1, 1,
0.6273036, 1.187555, -0.06524441, 0.4470588, 0, 1, 1,
0.6292167, 0.4188313, 1.692995, 0.4509804, 0, 1, 1,
0.6298769, -0.1774036, 4.192492, 0.4588235, 0, 1, 1,
0.6313193, 1.580771, -0.08564638, 0.4627451, 0, 1, 1,
0.6335758, 0.5419362, 2.6132, 0.4705882, 0, 1, 1,
0.6339462, -0.04194616, 1.203252, 0.4745098, 0, 1, 1,
0.636304, -0.8666962, 2.256419, 0.4823529, 0, 1, 1,
0.6422209, -1.210286, 2.145759, 0.4862745, 0, 1, 1,
0.6445763, 0.3276275, 0.223643, 0.4941176, 0, 1, 1,
0.6448314, 0.7634873, 1.453595, 0.5019608, 0, 1, 1,
0.651293, 0.003843236, 3.98018, 0.5058824, 0, 1, 1,
0.664325, 0.01140542, 1.33723, 0.5137255, 0, 1, 1,
0.6662229, -1.777663, 3.572538, 0.5176471, 0, 1, 1,
0.6699746, 0.4470263, -0.1258705, 0.5254902, 0, 1, 1,
0.6701049, -0.7226147, 1.75261, 0.5294118, 0, 1, 1,
0.6710625, 0.2365218, -0.3920455, 0.5372549, 0, 1, 1,
0.672179, -1.289218, 3.731687, 0.5411765, 0, 1, 1,
0.6788771, 0.9732879, -0.1836382, 0.5490196, 0, 1, 1,
0.6796227, 2.4228, -0.9284723, 0.5529412, 0, 1, 1,
0.6808068, -0.2197256, 2.596655, 0.5607843, 0, 1, 1,
0.6853383, 2.007713, 1.597527, 0.5647059, 0, 1, 1,
0.688175, 0.1414127, 1.347296, 0.572549, 0, 1, 1,
0.7053019, -0.1940624, 3.027296, 0.5764706, 0, 1, 1,
0.7062322, 0.6209006, -0.9452617, 0.5843138, 0, 1, 1,
0.7092436, 0.6373998, 2.709513, 0.5882353, 0, 1, 1,
0.7127107, 1.45572, -0.02889406, 0.5960785, 0, 1, 1,
0.7145523, 1.181951, -0.7616202, 0.6039216, 0, 1, 1,
0.7255787, -0.5071757, 4.548429, 0.6078432, 0, 1, 1,
0.7257075, 2.596203, -1.645244, 0.6156863, 0, 1, 1,
0.7269163, 0.2210545, 0.9731961, 0.6196079, 0, 1, 1,
0.7274352, 0.9965868, 0.860761, 0.627451, 0, 1, 1,
0.7282234, 1.621433, 1.054251, 0.6313726, 0, 1, 1,
0.7310943, -0.5757337, 0.124731, 0.6392157, 0, 1, 1,
0.7313499, 0.989812, 0.2919459, 0.6431373, 0, 1, 1,
0.738502, 0.2950749, 0.9022585, 0.6509804, 0, 1, 1,
0.739603, 0.4822452, 1.745932, 0.654902, 0, 1, 1,
0.7410763, 1.037042, -0.2379815, 0.6627451, 0, 1, 1,
0.7411788, -0.0008114431, 2.682722, 0.6666667, 0, 1, 1,
0.7417119, 0.636528, 0.8158215, 0.6745098, 0, 1, 1,
0.7553744, 1.294296, -0.326936, 0.6784314, 0, 1, 1,
0.7628474, 0.7655908, 0.01146389, 0.6862745, 0, 1, 1,
0.7630544, 1.50103, 0.9192861, 0.6901961, 0, 1, 1,
0.7651427, 1.114375, -0.4825448, 0.6980392, 0, 1, 1,
0.7663683, 0.4653608, 0.9316508, 0.7058824, 0, 1, 1,
0.7675399, -0.6159197, 2.293187, 0.7098039, 0, 1, 1,
0.7678968, 0.4819784, 0.7026604, 0.7176471, 0, 1, 1,
0.7681153, -0.8501293, 3.164064, 0.7215686, 0, 1, 1,
0.7744466, -0.7282908, 1.567627, 0.7294118, 0, 1, 1,
0.7783253, -0.8446719, 3.744426, 0.7333333, 0, 1, 1,
0.7808138, -0.5146777, 3.785073, 0.7411765, 0, 1, 1,
0.7821355, -0.3504919, 2.698315, 0.7450981, 0, 1, 1,
0.7857702, 0.8795742, -0.2687782, 0.7529412, 0, 1, 1,
0.7889567, 0.3777008, -0.2253052, 0.7568628, 0, 1, 1,
0.792178, 0.9173004, 1.492967, 0.7647059, 0, 1, 1,
0.7946336, -0.9097348, 0.5665612, 0.7686275, 0, 1, 1,
0.8027609, -0.7634254, -0.2735814, 0.7764706, 0, 1, 1,
0.8049123, 1.118285, -0.4363838, 0.7803922, 0, 1, 1,
0.8106438, 0.8369936, 2.188951, 0.7882353, 0, 1, 1,
0.8114727, 0.07332637, 2.482389, 0.7921569, 0, 1, 1,
0.8126667, 0.8639767, 1.447032, 0.8, 0, 1, 1,
0.8144635, 0.3236633, 2.534364, 0.8078431, 0, 1, 1,
0.8176067, -0.9168476, 1.313984, 0.8117647, 0, 1, 1,
0.8246813, -0.003755459, 2.260742, 0.8196079, 0, 1, 1,
0.8276051, 0.8604389, 0.9157644, 0.8235294, 0, 1, 1,
0.8365625, 0.2562708, 1.551375, 0.8313726, 0, 1, 1,
0.8366014, 0.1873649, 1.075982, 0.8352941, 0, 1, 1,
0.8381596, 1.425548, 0.6820211, 0.8431373, 0, 1, 1,
0.8432486, -1.558121, 5.191591, 0.8470588, 0, 1, 1,
0.8467143, -0.3206417, 2.312469, 0.854902, 0, 1, 1,
0.8485105, 1.70981, 0.9388149, 0.8588235, 0, 1, 1,
0.8508433, -1.589944, 3.050555, 0.8666667, 0, 1, 1,
0.8545693, -0.212497, 1.093194, 0.8705882, 0, 1, 1,
0.8549513, 1.2253, -1.235468, 0.8784314, 0, 1, 1,
0.8581039, -0.7643514, 1.921209, 0.8823529, 0, 1, 1,
0.8610577, 0.3540093, 1.226537, 0.8901961, 0, 1, 1,
0.8623106, 0.5637666, 1.754062, 0.8941177, 0, 1, 1,
0.8654525, -1.734887, 2.888295, 0.9019608, 0, 1, 1,
0.8658159, -0.5634714, 3.845822, 0.9098039, 0, 1, 1,
0.8682324, 0.1602412, 1.688246, 0.9137255, 0, 1, 1,
0.8692573, 0.8889039, 0.007363255, 0.9215686, 0, 1, 1,
0.8712625, 1.643038, -1.067285, 0.9254902, 0, 1, 1,
0.8715031, -1.393146, 2.835086, 0.9333333, 0, 1, 1,
0.8717011, -1.524894, 1.258823, 0.9372549, 0, 1, 1,
0.8726346, 1.128856, 2.489695, 0.945098, 0, 1, 1,
0.87491, -0.7844755, 1.122596, 0.9490196, 0, 1, 1,
0.8782226, 0.6321059, 1.336263, 0.9568627, 0, 1, 1,
0.8943543, 1.653954, 2.441181, 0.9607843, 0, 1, 1,
0.8951477, -0.9220825, 1.721244, 0.9686275, 0, 1, 1,
0.8957798, 1.499447, -0.1848094, 0.972549, 0, 1, 1,
0.9002873, 0.8766878, 1.470502, 0.9803922, 0, 1, 1,
0.9072052, 0.2796745, 3.061075, 0.9843137, 0, 1, 1,
0.9074157, -0.3935404, 2.586824, 0.9921569, 0, 1, 1,
0.9109687, 0.09773724, 0.9932871, 0.9960784, 0, 1, 1,
0.9309779, -0.6652564, 1.039679, 1, 0, 0.9960784, 1,
0.9320856, 0.7815359, 0.9302035, 1, 0, 0.9882353, 1,
0.9353957, 0.01027417, 1.632228, 1, 0, 0.9843137, 1,
0.938047, 0.3014593, 1.787145, 1, 0, 0.9764706, 1,
0.9462357, -0.5902131, 3.03289, 1, 0, 0.972549, 1,
0.9522694, -0.6325141, 1.335294, 1, 0, 0.9647059, 1,
0.9539503, 0.5421089, 2.896737, 1, 0, 0.9607843, 1,
0.9539883, 0.6148587, -1.178154, 1, 0, 0.9529412, 1,
0.9623243, 0.650873, 2.080684, 1, 0, 0.9490196, 1,
0.9651597, 0.1025834, 1.29002, 1, 0, 0.9411765, 1,
0.9679819, 0.4959829, 0.5485291, 1, 0, 0.9372549, 1,
0.9697668, -0.3744228, 0.8227679, 1, 0, 0.9294118, 1,
0.9724783, -1.132871, 0.3785036, 1, 0, 0.9254902, 1,
0.9738609, 0.07635669, 1.214413, 1, 0, 0.9176471, 1,
0.9752867, 0.999025, 0.9570192, 1, 0, 0.9137255, 1,
0.9767143, -0.6670887, 1.714789, 1, 0, 0.9058824, 1,
0.988521, 1.300341, 0.4527172, 1, 0, 0.9019608, 1,
0.9976091, 0.6718192, 0.8486979, 1, 0, 0.8941177, 1,
0.9978081, 0.6689557, 1.228226, 1, 0, 0.8862745, 1,
0.9987777, 1.384992, 0.5974661, 1, 0, 0.8823529, 1,
1.004698, -1.01715, 2.416137, 1, 0, 0.8745098, 1,
1.017611, 0.5581141, 2.410058, 1, 0, 0.8705882, 1,
1.018708, -0.459044, 0.2230164, 1, 0, 0.8627451, 1,
1.024895, -0.8275485, 1.024143, 1, 0, 0.8588235, 1,
1.028307, -0.3002276, 3.653251, 1, 0, 0.8509804, 1,
1.032353, -1.344026, 2.713815, 1, 0, 0.8470588, 1,
1.036385, 0.11051, 0.9121648, 1, 0, 0.8392157, 1,
1.041808, 0.5297028, 0.7014489, 1, 0, 0.8352941, 1,
1.052463, -0.5759324, 1.978324, 1, 0, 0.827451, 1,
1.053696, 0.785348, -0.1929671, 1, 0, 0.8235294, 1,
1.053739, 2.036579, 0.3800788, 1, 0, 0.8156863, 1,
1.053758, -1.138437, 4.209228, 1, 0, 0.8117647, 1,
1.054874, -0.2969266, 3.20313, 1, 0, 0.8039216, 1,
1.06078, -1.024098, 2.625926, 1, 0, 0.7960784, 1,
1.061003, 0.8789847, 1.581996, 1, 0, 0.7921569, 1,
1.064751, 1.385631, 1.087345, 1, 0, 0.7843137, 1,
1.071001, 0.4662645, 1.934913, 1, 0, 0.7803922, 1,
1.07634, 1.786356, 0.1510255, 1, 0, 0.772549, 1,
1.080572, -0.2251238, 2.976642, 1, 0, 0.7686275, 1,
1.082044, -2.914658, 2.36141, 1, 0, 0.7607843, 1,
1.087806, 0.3640619, 1.929567, 1, 0, 0.7568628, 1,
1.090157, -1.73551, 3.02611, 1, 0, 0.7490196, 1,
1.091741, -1.269328, 2.841469, 1, 0, 0.7450981, 1,
1.110233, -2.78748, 3.06422, 1, 0, 0.7372549, 1,
1.129866, 1.388125, -0.1045192, 1, 0, 0.7333333, 1,
1.131933, -1.375983, 2.167992, 1, 0, 0.7254902, 1,
1.141287, -0.9331868, 2.109766, 1, 0, 0.7215686, 1,
1.147323, 1.064562, 0.5999346, 1, 0, 0.7137255, 1,
1.151354, 1.326741, 0.1579318, 1, 0, 0.7098039, 1,
1.167755, 0.05804928, 1.646513, 1, 0, 0.7019608, 1,
1.181503, -0.3228768, 1.606119, 1, 0, 0.6941177, 1,
1.18394, 0.4627365, 2.293377, 1, 0, 0.6901961, 1,
1.191397, -0.3430378, 2.422405, 1, 0, 0.682353, 1,
1.200673, 0.3628832, 1.412825, 1, 0, 0.6784314, 1,
1.201892, 0.5392671, 0.7667969, 1, 0, 0.6705883, 1,
1.20414, -0.5772433, 0.5125557, 1, 0, 0.6666667, 1,
1.208521, -0.7975321, 1.964526, 1, 0, 0.6588235, 1,
1.209357, 0.201928, 1.043689, 1, 0, 0.654902, 1,
1.217042, -1.462041, 0.4058251, 1, 0, 0.6470588, 1,
1.220223, -0.5662821, 1.053369, 1, 0, 0.6431373, 1,
1.220546, 1.764461, -0.2403775, 1, 0, 0.6352941, 1,
1.235194, -0.8056527, 1.679806, 1, 0, 0.6313726, 1,
1.23942, 1.45087, 0.8957205, 1, 0, 0.6235294, 1,
1.241854, 1.2021, 0.133435, 1, 0, 0.6196079, 1,
1.241977, 0.5922424, 3.48471, 1, 0, 0.6117647, 1,
1.248161, 0.7343232, 0.5634651, 1, 0, 0.6078432, 1,
1.257136, 1.298274, 1.287835, 1, 0, 0.6, 1,
1.259999, -1.211421, 0.493107, 1, 0, 0.5921569, 1,
1.26051, 1.622241, 1.60663, 1, 0, 0.5882353, 1,
1.263899, -0.1127375, 1.668549, 1, 0, 0.5803922, 1,
1.271738, -1.597496, 2.165888, 1, 0, 0.5764706, 1,
1.274829, 1.062352, 1.425299, 1, 0, 0.5686275, 1,
1.281217, 0.07409562, 3.628226, 1, 0, 0.5647059, 1,
1.291734, -0.4232375, 1.264332, 1, 0, 0.5568628, 1,
1.294741, -0.5616574, 2.643535, 1, 0, 0.5529412, 1,
1.29583, 1.06925, 0.2413288, 1, 0, 0.5450981, 1,
1.299281, 0.6484663, 4.393527, 1, 0, 0.5411765, 1,
1.300737, 0.9124811, -1.494935, 1, 0, 0.5333334, 1,
1.30269, 0.5688909, 2.277861, 1, 0, 0.5294118, 1,
1.307006, -0.2946513, 2.110008, 1, 0, 0.5215687, 1,
1.307446, -0.1943931, 0.3345944, 1, 0, 0.5176471, 1,
1.309715, 0.122443, 1.64415, 1, 0, 0.509804, 1,
1.319087, -0.5037636, 1.558651, 1, 0, 0.5058824, 1,
1.32402, 0.1936256, 0.3450699, 1, 0, 0.4980392, 1,
1.324767, -1.34704, 2.661, 1, 0, 0.4901961, 1,
1.327534, 0.7635495, 2.098228, 1, 0, 0.4862745, 1,
1.328241, -0.2111063, 0.5639912, 1, 0, 0.4784314, 1,
1.329406, 0.2673056, 0.988711, 1, 0, 0.4745098, 1,
1.335637, -0.6662385, 1.95506, 1, 0, 0.4666667, 1,
1.344607, -0.9696406, 1.497949, 1, 0, 0.4627451, 1,
1.348291, 1.005124, 1.472269, 1, 0, 0.454902, 1,
1.356596, -0.8668524, 2.446375, 1, 0, 0.4509804, 1,
1.36171, 1.866231, 1.071717, 1, 0, 0.4431373, 1,
1.367258, 1.366745, 0.925886, 1, 0, 0.4392157, 1,
1.370485, 0.5825361, 0.2394394, 1, 0, 0.4313726, 1,
1.375061, -0.6694462, 2.191214, 1, 0, 0.427451, 1,
1.37643, -0.4857498, 1.41364, 1, 0, 0.4196078, 1,
1.378143, 0.09251437, 3.271116, 1, 0, 0.4156863, 1,
1.380483, -0.1438203, -0.8298529, 1, 0, 0.4078431, 1,
1.380628, -0.2331837, 0.7517462, 1, 0, 0.4039216, 1,
1.392906, 0.341772, 0.6364987, 1, 0, 0.3960784, 1,
1.403532, -0.9218256, 1.735241, 1, 0, 0.3882353, 1,
1.415862, -1.01883, 1.806398, 1, 0, 0.3843137, 1,
1.423974, -2.162911, 4.184232, 1, 0, 0.3764706, 1,
1.432068, -0.3321896, 2.30704, 1, 0, 0.372549, 1,
1.439828, 0.6774962, 0.7744398, 1, 0, 0.3647059, 1,
1.4442, 0.6678283, -0.1076635, 1, 0, 0.3607843, 1,
1.502177, -1.739979, 2.284287, 1, 0, 0.3529412, 1,
1.523028, 0.1765459, 1.165622, 1, 0, 0.3490196, 1,
1.52754, 0.4083657, 1.119702, 1, 0, 0.3411765, 1,
1.528401, -0.7392079, 2.993948, 1, 0, 0.3372549, 1,
1.544022, -0.3969882, 0.7360213, 1, 0, 0.3294118, 1,
1.548165, -0.4445723, 2.020016, 1, 0, 0.3254902, 1,
1.5536, 0.5846173, 2.738318, 1, 0, 0.3176471, 1,
1.555338, 1.003076, 0.2099699, 1, 0, 0.3137255, 1,
1.557886, -0.592585, 1.869721, 1, 0, 0.3058824, 1,
1.558761, 1.022479, 1.225853, 1, 0, 0.2980392, 1,
1.588805, -0.3599775, 1.427477, 1, 0, 0.2941177, 1,
1.595016, -1.21995, 2.497998, 1, 0, 0.2862745, 1,
1.609886, 0.1649621, 1.472196, 1, 0, 0.282353, 1,
1.610339, -0.8091799, 3.092263, 1, 0, 0.2745098, 1,
1.635953, -1.794412, 2.510122, 1, 0, 0.2705882, 1,
1.662581, 1.223137, 0.463262, 1, 0, 0.2627451, 1,
1.673787, 0.3236009, 2.079261, 1, 0, 0.2588235, 1,
1.694908, 0.2305264, 0.5092175, 1, 0, 0.2509804, 1,
1.701374, 0.8870025, 1.851102, 1, 0, 0.2470588, 1,
1.711969, -0.2430222, 1.305024, 1, 0, 0.2392157, 1,
1.733318, 0.7462116, 2.465511, 1, 0, 0.2352941, 1,
1.74015, 0.1014108, 2.841945, 1, 0, 0.227451, 1,
1.744416, 1.746517, 2.027649, 1, 0, 0.2235294, 1,
1.746763, 0.5315504, 3.188805, 1, 0, 0.2156863, 1,
1.749987, 0.2927605, 0.3840267, 1, 0, 0.2117647, 1,
1.76002, -0.4563937, 2.360152, 1, 0, 0.2039216, 1,
1.802341, 1.023036, 4.134472, 1, 0, 0.1960784, 1,
1.803796, 2.74953, 0.1002206, 1, 0, 0.1921569, 1,
1.841099, 1.862755, 0.02506009, 1, 0, 0.1843137, 1,
1.852905, -0.7052535, 2.293042, 1, 0, 0.1803922, 1,
1.868738, -1.228757, 0.7374855, 1, 0, 0.172549, 1,
1.910445, 0.2702017, 2.587675, 1, 0, 0.1686275, 1,
1.925186, -0.5198846, 2.656167, 1, 0, 0.1607843, 1,
1.92843, 1.637806, 3.904183, 1, 0, 0.1568628, 1,
1.928897, 0.04594575, -0.2827092, 1, 0, 0.1490196, 1,
1.933137, 0.5865333, 1.473425, 1, 0, 0.145098, 1,
1.970343, 0.4123367, 1.823501, 1, 0, 0.1372549, 1,
1.976449, -1.133031, 1.286589, 1, 0, 0.1333333, 1,
2.007307, -0.7752032, 3.633383, 1, 0, 0.1254902, 1,
2.007433, 1.091909, 2.575789, 1, 0, 0.1215686, 1,
2.0139, 0.4254595, 2.822382, 1, 0, 0.1137255, 1,
2.024179, -0.09107908, -0.4271436, 1, 0, 0.1098039, 1,
2.090579, 1.014776, 1.917175, 1, 0, 0.1019608, 1,
2.098916, 0.1639834, 0.3060991, 1, 0, 0.09411765, 1,
2.113816, 1.539246, 0.1036644, 1, 0, 0.09019608, 1,
2.121374, -1.149889, 2.86662, 1, 0, 0.08235294, 1,
2.181296, -1.456136, 2.904498, 1, 0, 0.07843138, 1,
2.236537, 1.260399, -0.2009602, 1, 0, 0.07058824, 1,
2.32725, -0.8484303, 3.757228, 1, 0, 0.06666667, 1,
2.37142, 0.4069733, 0.6886343, 1, 0, 0.05882353, 1,
2.465682, -0.1523482, 2.676124, 1, 0, 0.05490196, 1,
2.476119, 1.153312, 0.3507001, 1, 0, 0.04705882, 1,
2.523295, -0.1473351, 1.769839, 1, 0, 0.04313726, 1,
2.537901, 0.9620516, 2.18942, 1, 0, 0.03529412, 1,
2.571007, -1.747699, 1.924811, 1, 0, 0.03137255, 1,
2.710932, -0.771252, 2.78024, 1, 0, 0.02352941, 1,
2.81948, 0.2085482, 0.2761659, 1, 0, 0.01960784, 1,
3.081915, 0.4749509, 1.066867, 1, 0, 0.01176471, 1,
3.169569, 1.15654, 0.2186291, 1, 0, 0.007843138, 1
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
-0.3308517, -4.369409, -6.861049, 0, -0.5, 0.5, 0.5,
-0.3308517, -4.369409, -6.861049, 1, -0.5, 0.5, 0.5,
-0.3308517, -4.369409, -6.861049, 1, 1.5, 0.5, 0.5,
-0.3308517, -4.369409, -6.861049, 0, 1.5, 0.5, 0.5
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
-5.017915, -0.2756035, -6.861049, 0, -0.5, 0.5, 0.5,
-5.017915, -0.2756035, -6.861049, 1, -0.5, 0.5, 0.5,
-5.017915, -0.2756035, -6.861049, 1, 1.5, 0.5, 0.5,
-5.017915, -0.2756035, -6.861049, 0, 1.5, 0.5, 0.5
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
-5.017915, -4.369409, 0.03868794, 0, -0.5, 0.5, 0.5,
-5.017915, -4.369409, 0.03868794, 1, -0.5, 0.5, 0.5,
-5.017915, -4.369409, 0.03868794, 1, 1.5, 0.5, 0.5,
-5.017915, -4.369409, 0.03868794, 0, 1.5, 0.5, 0.5
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
-2, -3.424684, -5.268802,
2, -3.424684, -5.268802,
-2, -3.424684, -5.268802,
-2, -3.582138, -5.534176,
0, -3.424684, -5.268802,
0, -3.582138, -5.534176,
2, -3.424684, -5.268802,
2, -3.582138, -5.534176
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
-2, -3.897046, -6.064926, 0, -0.5, 0.5, 0.5,
-2, -3.897046, -6.064926, 1, -0.5, 0.5, 0.5,
-2, -3.897046, -6.064926, 1, 1.5, 0.5, 0.5,
-2, -3.897046, -6.064926, 0, 1.5, 0.5, 0.5,
0, -3.897046, -6.064926, 0, -0.5, 0.5, 0.5,
0, -3.897046, -6.064926, 1, -0.5, 0.5, 0.5,
0, -3.897046, -6.064926, 1, 1.5, 0.5, 0.5,
0, -3.897046, -6.064926, 0, 1.5, 0.5, 0.5,
2, -3.897046, -6.064926, 0, -0.5, 0.5, 0.5,
2, -3.897046, -6.064926, 1, -0.5, 0.5, 0.5,
2, -3.897046, -6.064926, 1, 1.5, 0.5, 0.5,
2, -3.897046, -6.064926, 0, 1.5, 0.5, 0.5
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
-3.936285, -3, -5.268802,
-3.936285, 2, -5.268802,
-3.936285, -3, -5.268802,
-4.116557, -3, -5.534176,
-3.936285, -2, -5.268802,
-4.116557, -2, -5.534176,
-3.936285, -1, -5.268802,
-4.116557, -1, -5.534176,
-3.936285, 0, -5.268802,
-4.116557, 0, -5.534176,
-3.936285, 1, -5.268802,
-4.116557, 1, -5.534176,
-3.936285, 2, -5.268802,
-4.116557, 2, -5.534176
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
-4.4771, -3, -6.064926, 0, -0.5, 0.5, 0.5,
-4.4771, -3, -6.064926, 1, -0.5, 0.5, 0.5,
-4.4771, -3, -6.064926, 1, 1.5, 0.5, 0.5,
-4.4771, -3, -6.064926, 0, 1.5, 0.5, 0.5,
-4.4771, -2, -6.064926, 0, -0.5, 0.5, 0.5,
-4.4771, -2, -6.064926, 1, -0.5, 0.5, 0.5,
-4.4771, -2, -6.064926, 1, 1.5, 0.5, 0.5,
-4.4771, -2, -6.064926, 0, 1.5, 0.5, 0.5,
-4.4771, -1, -6.064926, 0, -0.5, 0.5, 0.5,
-4.4771, -1, -6.064926, 1, -0.5, 0.5, 0.5,
-4.4771, -1, -6.064926, 1, 1.5, 0.5, 0.5,
-4.4771, -1, -6.064926, 0, 1.5, 0.5, 0.5,
-4.4771, 0, -6.064926, 0, -0.5, 0.5, 0.5,
-4.4771, 0, -6.064926, 1, -0.5, 0.5, 0.5,
-4.4771, 0, -6.064926, 1, 1.5, 0.5, 0.5,
-4.4771, 0, -6.064926, 0, 1.5, 0.5, 0.5,
-4.4771, 1, -6.064926, 0, -0.5, 0.5, 0.5,
-4.4771, 1, -6.064926, 1, -0.5, 0.5, 0.5,
-4.4771, 1, -6.064926, 1, 1.5, 0.5, 0.5,
-4.4771, 1, -6.064926, 0, 1.5, 0.5, 0.5,
-4.4771, 2, -6.064926, 0, -0.5, 0.5, 0.5,
-4.4771, 2, -6.064926, 1, -0.5, 0.5, 0.5,
-4.4771, 2, -6.064926, 1, 1.5, 0.5, 0.5,
-4.4771, 2, -6.064926, 0, 1.5, 0.5, 0.5
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
-3.936285, -3.424684, -4,
-3.936285, -3.424684, 4,
-3.936285, -3.424684, -4,
-4.116557, -3.582138, -4,
-3.936285, -3.424684, -2,
-4.116557, -3.582138, -2,
-3.936285, -3.424684, 0,
-4.116557, -3.582138, 0,
-3.936285, -3.424684, 2,
-4.116557, -3.582138, 2,
-3.936285, -3.424684, 4,
-4.116557, -3.582138, 4
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
-4.4771, -3.897046, -4, 0, -0.5, 0.5, 0.5,
-4.4771, -3.897046, -4, 1, -0.5, 0.5, 0.5,
-4.4771, -3.897046, -4, 1, 1.5, 0.5, 0.5,
-4.4771, -3.897046, -4, 0, 1.5, 0.5, 0.5,
-4.4771, -3.897046, -2, 0, -0.5, 0.5, 0.5,
-4.4771, -3.897046, -2, 1, -0.5, 0.5, 0.5,
-4.4771, -3.897046, -2, 1, 1.5, 0.5, 0.5,
-4.4771, -3.897046, -2, 0, 1.5, 0.5, 0.5,
-4.4771, -3.897046, 0, 0, -0.5, 0.5, 0.5,
-4.4771, -3.897046, 0, 1, -0.5, 0.5, 0.5,
-4.4771, -3.897046, 0, 1, 1.5, 0.5, 0.5,
-4.4771, -3.897046, 0, 0, 1.5, 0.5, 0.5,
-4.4771, -3.897046, 2, 0, -0.5, 0.5, 0.5,
-4.4771, -3.897046, 2, 1, -0.5, 0.5, 0.5,
-4.4771, -3.897046, 2, 1, 1.5, 0.5, 0.5,
-4.4771, -3.897046, 2, 0, 1.5, 0.5, 0.5,
-4.4771, -3.897046, 4, 0, -0.5, 0.5, 0.5,
-4.4771, -3.897046, 4, 1, -0.5, 0.5, 0.5,
-4.4771, -3.897046, 4, 1, 1.5, 0.5, 0.5,
-4.4771, -3.897046, 4, 0, 1.5, 0.5, 0.5
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
-3.936285, -3.424684, -5.268802,
-3.936285, 2.873477, -5.268802,
-3.936285, -3.424684, 5.346178,
-3.936285, 2.873477, 5.346178,
-3.936285, -3.424684, -5.268802,
-3.936285, -3.424684, 5.346178,
-3.936285, 2.873477, -5.268802,
-3.936285, 2.873477, 5.346178,
-3.936285, -3.424684, -5.268802,
3.274582, -3.424684, -5.268802,
-3.936285, -3.424684, 5.346178,
3.274582, -3.424684, 5.346178,
-3.936285, 2.873477, -5.268802,
3.274582, 2.873477, -5.268802,
-3.936285, 2.873477, 5.346178,
3.274582, 2.873477, 5.346178,
3.274582, -3.424684, -5.268802,
3.274582, 2.873477, -5.268802,
3.274582, -3.424684, 5.346178,
3.274582, 2.873477, 5.346178,
3.274582, -3.424684, -5.268802,
3.274582, -3.424684, 5.346178,
3.274582, 2.873477, -5.268802,
3.274582, 2.873477, 5.346178
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
var radius = 7.633144;
var distance = 33.96072;
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
mvMatrix.translate( 0.3308517, 0.2756035, -0.03868794 );
mvMatrix.scale( 1.144537, 1.310399, 0.7774961 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.96072);
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
sodium_dehydroacetat<-read.table("sodium_dehydroacetat.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_dehydroacetat$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
y<-sodium_dehydroacetat$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
```

```r
z<-sodium_dehydroacetat$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dehydroacetat' not found
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
-3.831272, 0.03091226, -3.041901, 0, 0, 1, 1, 1,
-3.410965, 0.1174264, -1.950683, 1, 0, 0, 1, 1,
-3.120513, -0.3681509, -0.8949926, 1, 0, 0, 1, 1,
-2.735626, -0.2262641, -3.46203, 1, 0, 0, 1, 1,
-2.696315, 0.07723206, -2.524912, 1, 0, 0, 1, 1,
-2.669996, -0.5163109, -1.534976, 1, 0, 0, 1, 1,
-2.652205, 1.570449, -1.797861, 0, 0, 0, 1, 1,
-2.633826, -1.829566, -1.787646, 0, 0, 0, 1, 1,
-2.620732, 0.4800127, 0.2540592, 0, 0, 0, 1, 1,
-2.619631, -1.059455, -1.578455, 0, 0, 0, 1, 1,
-2.524066, -0.5654946, -2.628481, 0, 0, 0, 1, 1,
-2.310774, 0.7885114, -1.790406, 0, 0, 0, 1, 1,
-2.285534, 0.9057382, -4.126068, 0, 0, 0, 1, 1,
-2.284693, 0.04834231, -2.168036, 1, 1, 1, 1, 1,
-2.279467, 2.366034, -0.3328685, 1, 1, 1, 1, 1,
-2.279463, -1.199624, -1.391204, 1, 1, 1, 1, 1,
-2.275886, -0.7362999, -1.395967, 1, 1, 1, 1, 1,
-2.206362, -0.6865064, -1.321117, 1, 1, 1, 1, 1,
-2.176539, -1.013511, -1.468982, 1, 1, 1, 1, 1,
-2.176526, -0.003778965, -1.212453, 1, 1, 1, 1, 1,
-2.148168, 1.03242, -0.5539157, 1, 1, 1, 1, 1,
-2.141114, -0.4304159, -0.9032477, 1, 1, 1, 1, 1,
-2.109297, -0.7141974, -1.885947, 1, 1, 1, 1, 1,
-2.101814, -1.567268, -2.245228, 1, 1, 1, 1, 1,
-2.082874, 0.9027318, -1.999904, 1, 1, 1, 1, 1,
-2.045136, -0.6346099, -1.703681, 1, 1, 1, 1, 1,
-2.027629, -0.491608, -2.753004, 1, 1, 1, 1, 1,
-2.005078, 1.128993, -1.368739, 1, 1, 1, 1, 1,
-1.989906, -0.5403024, -2.785386, 0, 0, 1, 1, 1,
-1.971138, -0.3397047, -1.479583, 1, 0, 0, 1, 1,
-1.962458, -0.6030936, -3.014061, 1, 0, 0, 1, 1,
-1.960502, -1.082467, -1.638668, 1, 0, 0, 1, 1,
-1.920012, 1.085838, -0.6460867, 1, 0, 0, 1, 1,
-1.914051, -0.2086853, -0.5812422, 1, 0, 0, 1, 1,
-1.907252, -0.8425212, -4.751626, 0, 0, 0, 1, 1,
-1.896482, -0.8020785, -2.483886, 0, 0, 0, 1, 1,
-1.864856, 1.782717, -2.189075, 0, 0, 0, 1, 1,
-1.864689, -0.4089859, -1.111351, 0, 0, 0, 1, 1,
-1.854584, 1.165485, -2.094591, 0, 0, 0, 1, 1,
-1.853131, -0.4916797, -1.549026, 0, 0, 0, 1, 1,
-1.830413, 0.3681516, -2.512009, 0, 0, 0, 1, 1,
-1.819488, -0.6919586, -0.4457634, 1, 1, 1, 1, 1,
-1.809013, -0.1625523, -1.603221, 1, 1, 1, 1, 1,
-1.797739, -0.5748714, -0.556778, 1, 1, 1, 1, 1,
-1.771673, 0.8563266, -1.19488, 1, 1, 1, 1, 1,
-1.754955, -0.4703011, -2.653971, 1, 1, 1, 1, 1,
-1.737792, -0.5340861, -2.585998, 1, 1, 1, 1, 1,
-1.73697, 1.352341, -1.078337, 1, 1, 1, 1, 1,
-1.717634, 0.8420793, -0.6635042, 1, 1, 1, 1, 1,
-1.717121, -0.1624758, -0.2301417, 1, 1, 1, 1, 1,
-1.71111, 2.102093, -0.2571717, 1, 1, 1, 1, 1,
-1.709927, -3.332963, -3.166359, 1, 1, 1, 1, 1,
-1.708942, 1.504735, -0.2288306, 1, 1, 1, 1, 1,
-1.684657, -1.367699, -2.1828, 1, 1, 1, 1, 1,
-1.679698, 0.08200257, -1.218686, 1, 1, 1, 1, 1,
-1.670783, -1.468721, -2.839167, 1, 1, 1, 1, 1,
-1.658372, -0.2260465, -0.1142755, 0, 0, 1, 1, 1,
-1.651634, 1.042824, -3.257732, 1, 0, 0, 1, 1,
-1.618526, 0.7898761, -0.4071042, 1, 0, 0, 1, 1,
-1.610622, 0.475335, -2.244341, 1, 0, 0, 1, 1,
-1.606256, 0.03768497, -1.690542, 1, 0, 0, 1, 1,
-1.585131, 1.993014, -0.534799, 1, 0, 0, 1, 1,
-1.569173, 2.216268, -0.152594, 0, 0, 0, 1, 1,
-1.561378, 1.762142, 0.2084431, 0, 0, 0, 1, 1,
-1.543609, -0.5494525, -1.818319, 0, 0, 0, 1, 1,
-1.524027, 1.628325, 0.01667635, 0, 0, 0, 1, 1,
-1.522452, -1.60259, -4.693236, 0, 0, 0, 1, 1,
-1.520957, 2.137356, 0.8341368, 0, 0, 0, 1, 1,
-1.513426, 1.008729, -1.027413, 0, 0, 0, 1, 1,
-1.510801, -2.165315, -2.181259, 1, 1, 1, 1, 1,
-1.48561, 0.1737213, -1.290293, 1, 1, 1, 1, 1,
-1.484342, 1.265741, -1.646224, 1, 1, 1, 1, 1,
-1.482867, 1.138381, -0.3055321, 1, 1, 1, 1, 1,
-1.482134, 1.706103, 1.444681, 1, 1, 1, 1, 1,
-1.474306, -0.3413844, -1.587199, 1, 1, 1, 1, 1,
-1.472173, -0.6173831, -2.019181, 1, 1, 1, 1, 1,
-1.46673, -0.329905, -0.981806, 1, 1, 1, 1, 1,
-1.465593, 0.6905322, -2.051612, 1, 1, 1, 1, 1,
-1.458348, 0.6549008, -1.166912, 1, 1, 1, 1, 1,
-1.458296, -0.1155656, -2.709623, 1, 1, 1, 1, 1,
-1.45773, -0.06880528, -2.970148, 1, 1, 1, 1, 1,
-1.448903, 0.8163952, -0.08544785, 1, 1, 1, 1, 1,
-1.448687, -0.1391072, -1.706631, 1, 1, 1, 1, 1,
-1.441363, -0.1994156, -4.22549, 1, 1, 1, 1, 1,
-1.438911, 0.10565, -1.748658, 0, 0, 1, 1, 1,
-1.431322, -0.3908845, -2.69807, 1, 0, 0, 1, 1,
-1.429425, -0.7490742, -1.199522, 1, 0, 0, 1, 1,
-1.42249, -0.8960773, -3.566439, 1, 0, 0, 1, 1,
-1.42198, 2.068029, -1.347411, 1, 0, 0, 1, 1,
-1.400275, -1.32142, -1.442023, 1, 0, 0, 1, 1,
-1.385748, 0.5600519, 0.3737613, 0, 0, 0, 1, 1,
-1.376177, 0.9319093, 0.1176072, 0, 0, 0, 1, 1,
-1.366358, 1.109174, -0.8226348, 0, 0, 0, 1, 1,
-1.365814, 1.193765, -0.2019834, 0, 0, 0, 1, 1,
-1.359634, 1.205131, -1.702921, 0, 0, 0, 1, 1,
-1.358927, -1.177331, -4.789363, 0, 0, 0, 1, 1,
-1.358015, -0.8194079, -2.836825, 0, 0, 0, 1, 1,
-1.346648, -0.2950297, -3.401754, 1, 1, 1, 1, 1,
-1.3431, 1.691129, 1.031886, 1, 1, 1, 1, 1,
-1.335374, -1.290729, -3.453965, 1, 1, 1, 1, 1,
-1.333294, -0.7821766, 0.03795051, 1, 1, 1, 1, 1,
-1.327109, -0.4727798, -1.960686, 1, 1, 1, 1, 1,
-1.326829, 0.7110519, -3.519646, 1, 1, 1, 1, 1,
-1.314206, -1.153418, -3.168081, 1, 1, 1, 1, 1,
-1.306121, -0.1092075, -1.254192, 1, 1, 1, 1, 1,
-1.302709, -0.7230085, -1.342331, 1, 1, 1, 1, 1,
-1.29822, -0.8283083, -0.6291496, 1, 1, 1, 1, 1,
-1.296998, -0.2571952, -1.262523, 1, 1, 1, 1, 1,
-1.284708, 0.4723387, -0.679089, 1, 1, 1, 1, 1,
-1.274449, -0.1433928, -1.533391, 1, 1, 1, 1, 1,
-1.272055, 1.779513, -1.037332, 1, 1, 1, 1, 1,
-1.269005, 0.6331995, -1.846911, 1, 1, 1, 1, 1,
-1.265787, 0.4968174, -1.537675, 0, 0, 1, 1, 1,
-1.248794, -0.0289604, -1.048446, 1, 0, 0, 1, 1,
-1.24757, -0.997763, -2.955619, 1, 0, 0, 1, 1,
-1.232576, 0.2415723, -0.283865, 1, 0, 0, 1, 1,
-1.220764, -1.090074, -1.545308, 1, 0, 0, 1, 1,
-1.219364, 0.4639866, 0.4650919, 1, 0, 0, 1, 1,
-1.219281, 2.781756, -0.4915606, 0, 0, 0, 1, 1,
-1.218754, 0.2332436, -1.774533, 0, 0, 0, 1, 1,
-1.197976, 1.004098, -0.6678216, 0, 0, 0, 1, 1,
-1.19397, -0.7874401, -3.29666, 0, 0, 0, 1, 1,
-1.19371, -0.3956097, -3.329719, 0, 0, 0, 1, 1,
-1.188581, -1.518221, -1.780219, 0, 0, 0, 1, 1,
-1.186939, 0.03289606, -0.1013114, 0, 0, 0, 1, 1,
-1.186608, -0.7659194, -4.533577, 1, 1, 1, 1, 1,
-1.184372, 1.308107, -0.3317387, 1, 1, 1, 1, 1,
-1.168427, 1.360757, 0.4113062, 1, 1, 1, 1, 1,
-1.159949, -0.06673931, -1.210314, 1, 1, 1, 1, 1,
-1.159221, 1.1466, -1.53167, 1, 1, 1, 1, 1,
-1.158648, 0.06530164, -0.03930219, 1, 1, 1, 1, 1,
-1.155356, -0.08569393, -2.286343, 1, 1, 1, 1, 1,
-1.14213, -0.6597739, -3.735066, 1, 1, 1, 1, 1,
-1.134363, -0.9610823, -4.297887, 1, 1, 1, 1, 1,
-1.132179, 0.7676385, 0.0302868, 1, 1, 1, 1, 1,
-1.128723, -0.06928036, -2.015168, 1, 1, 1, 1, 1,
-1.126015, -1.091447, -2.617012, 1, 1, 1, 1, 1,
-1.114042, -0.6726968, -2.091493, 1, 1, 1, 1, 1,
-1.113539, 0.07506901, -1.578958, 1, 1, 1, 1, 1,
-1.113085, -0.2908842, -0.5610348, 1, 1, 1, 1, 1,
-1.098394, -0.6810675, -0.9737959, 0, 0, 1, 1, 1,
-1.078604, 2.483136, 2.205827, 1, 0, 0, 1, 1,
-1.076875, 0.9303126, -0.8822752, 1, 0, 0, 1, 1,
-1.071626, -0.9661271, -1.345742, 1, 0, 0, 1, 1,
-1.065083, 0.4257248, -2.154754, 1, 0, 0, 1, 1,
-1.064247, 1.043485, -2.020433, 1, 0, 0, 1, 1,
-1.057279, 0.1949644, -2.741906, 0, 0, 0, 1, 1,
-1.056587, 1.324805, 0.2796848, 0, 0, 0, 1, 1,
-1.05467, 1.129714, -2.284847, 0, 0, 0, 1, 1,
-1.053697, 2.237568, 0.4093303, 0, 0, 0, 1, 1,
-1.053164, -0.4376761, -2.492691, 0, 0, 0, 1, 1,
-1.04999, -1.986934, -0.2551208, 0, 0, 0, 1, 1,
-1.048242, 1.245132, 0.2130414, 0, 0, 0, 1, 1,
-1.046577, 0.7449166, -2.308455, 1, 1, 1, 1, 1,
-1.038387, -0.5435648, -2.053527, 1, 1, 1, 1, 1,
-1.021701, -1.382486, -1.487654, 1, 1, 1, 1, 1,
-1.013372, 0.1355109, -2.115286, 1, 1, 1, 1, 1,
-1.006688, -0.602449, -1.946856, 1, 1, 1, 1, 1,
-1.004061, 2.07897, -0.9630665, 1, 1, 1, 1, 1,
-0.9988853, 0.4005035, -1.624897, 1, 1, 1, 1, 1,
-0.998579, 2.446598, 0.6915124, 1, 1, 1, 1, 1,
-0.9974003, -1.285722, -1.768729, 1, 1, 1, 1, 1,
-0.9963065, -0.9868503, -1.414034, 1, 1, 1, 1, 1,
-0.9943627, -1.394791, -2.282804, 1, 1, 1, 1, 1,
-0.9936742, 0.3371916, -0.6252953, 1, 1, 1, 1, 1,
-0.9856703, 0.4517345, -1.480463, 1, 1, 1, 1, 1,
-0.9826871, 0.0762523, -3.375247, 1, 1, 1, 1, 1,
-0.9737452, 0.851057, 0.3072318, 1, 1, 1, 1, 1,
-0.9713326, 0.8458035, -1.206698, 0, 0, 1, 1, 1,
-0.9701977, 0.00553529, -0.5450289, 1, 0, 0, 1, 1,
-0.9645332, 1.092439, 0.2380309, 1, 0, 0, 1, 1,
-0.9642049, -1.267699, -1.493604, 1, 0, 0, 1, 1,
-0.9602347, -1.105682, -4.892283, 1, 0, 0, 1, 1,
-0.9559567, -0.5579627, -2.581743, 1, 0, 0, 1, 1,
-0.9555401, -0.4348474, -1.921461, 0, 0, 0, 1, 1,
-0.9548469, -0.1939407, -1.68866, 0, 0, 0, 1, 1,
-0.9529293, -0.9529516, -1.915066, 0, 0, 0, 1, 1,
-0.9495842, 1.050951, -0.1737402, 0, 0, 0, 1, 1,
-0.9445676, -1.238904, -3.221297, 0, 0, 0, 1, 1,
-0.9415518, 2.7529, -0.4094937, 0, 0, 0, 1, 1,
-0.939589, 0.582087, 0.04137309, 0, 0, 0, 1, 1,
-0.9361529, 0.8993041, -1.832635, 1, 1, 1, 1, 1,
-0.9286494, -2.062878, -2.810609, 1, 1, 1, 1, 1,
-0.9255784, -1.38089, -2.295754, 1, 1, 1, 1, 1,
-0.9244915, 1.971383, 0.06219304, 1, 1, 1, 1, 1,
-0.9193059, 0.006064507, -1.019502, 1, 1, 1, 1, 1,
-0.916061, -0.4127102, -1.07569, 1, 1, 1, 1, 1,
-0.9160597, -0.7128775, -4.124336, 1, 1, 1, 1, 1,
-0.9119318, 0.1500091, -1.289539, 1, 1, 1, 1, 1,
-0.9057795, 0.1090022, -4.197938, 1, 1, 1, 1, 1,
-0.9008793, -0.5716286, -3.070267, 1, 1, 1, 1, 1,
-0.897332, 1.604408, -1.531879, 1, 1, 1, 1, 1,
-0.8951415, -0.01166132, 0.428593, 1, 1, 1, 1, 1,
-0.8895689, 0.5270429, -1.878014, 1, 1, 1, 1, 1,
-0.8863363, 1.223882, -1.018508, 1, 1, 1, 1, 1,
-0.8814511, -0.4176196, -1.752792, 1, 1, 1, 1, 1,
-0.8768175, -1.681313, -1.657886, 0, 0, 1, 1, 1,
-0.8678492, 0.1438719, -1.275103, 1, 0, 0, 1, 1,
-0.8670532, -0.1005045, -0.757044, 1, 0, 0, 1, 1,
-0.8650529, 0.1879132, -0.4094913, 1, 0, 0, 1, 1,
-0.8647766, -2.142759, -2.193246, 1, 0, 0, 1, 1,
-0.8636543, 0.3550558, -2.544402, 1, 0, 0, 1, 1,
-0.8602204, -0.7623471, -2.332483, 0, 0, 0, 1, 1,
-0.8541272, 1.481289, 0.5773238, 0, 0, 0, 1, 1,
-0.8487113, -0.2180019, -1.816131, 0, 0, 0, 1, 1,
-0.8476487, -0.379891, -0.6604681, 0, 0, 0, 1, 1,
-0.8444833, -1.088909, -2.716934, 0, 0, 0, 1, 1,
-0.838402, 0.4142094, -2.055694, 0, 0, 0, 1, 1,
-0.8374285, -0.1437407, -0.3999942, 0, 0, 0, 1, 1,
-0.8366577, 0.9508284, -0.3527406, 1, 1, 1, 1, 1,
-0.8330817, 0.7266024, 0.4998575, 1, 1, 1, 1, 1,
-0.8317492, 0.04422675, 0.0534489, 1, 1, 1, 1, 1,
-0.8168411, 0.03032412, -3.077109, 1, 1, 1, 1, 1,
-0.8163747, 0.5207625, -2.717287, 1, 1, 1, 1, 1,
-0.8106952, 0.429274, -0.635487, 1, 1, 1, 1, 1,
-0.8074525, -0.5169771, -2.184612, 1, 1, 1, 1, 1,
-0.8060632, -0.6876231, -2.696122, 1, 1, 1, 1, 1,
-0.8050333, -0.1899601, -1.791748, 1, 1, 1, 1, 1,
-0.7982446, -0.4718494, -2.616003, 1, 1, 1, 1, 1,
-0.796447, 1.113443, -1.28125, 1, 1, 1, 1, 1,
-0.7950386, 0.1099243, -1.791901, 1, 1, 1, 1, 1,
-0.7815201, 0.07424264, -1.379269, 1, 1, 1, 1, 1,
-0.7814298, -0.9264647, -2.528657, 1, 1, 1, 1, 1,
-0.7674984, 0.4256914, -1.253779, 1, 1, 1, 1, 1,
-0.7664044, 0.258756, -2.20848, 0, 0, 1, 1, 1,
-0.7614564, -0.4674376, -1.970223, 1, 0, 0, 1, 1,
-0.75713, 1.028065, 0.009408101, 1, 0, 0, 1, 1,
-0.7517152, 1.117478, -0.4663574, 1, 0, 0, 1, 1,
-0.7495055, -0.6868093, -2.896361, 1, 0, 0, 1, 1,
-0.7470078, -0.2875556, -1.5257, 1, 0, 0, 1, 1,
-0.7460985, -1.945038, -3.203722, 0, 0, 0, 1, 1,
-0.7452745, 0.2404206, -1.911179, 0, 0, 0, 1, 1,
-0.7452599, -0.4711224, -1.60564, 0, 0, 0, 1, 1,
-0.7401712, -0.2635668, -1.861735, 0, 0, 0, 1, 1,
-0.7396157, -1.429101, -3.540581, 0, 0, 0, 1, 1,
-0.7390648, -1.848427, -1.21892, 0, 0, 0, 1, 1,
-0.7365983, 0.4534904, 0.08565357, 0, 0, 0, 1, 1,
-0.7337332, -1.196289, -1.67644, 1, 1, 1, 1, 1,
-0.7316845, 1.273402, -3.129789, 1, 1, 1, 1, 1,
-0.7311754, -0.319698, -1.809562, 1, 1, 1, 1, 1,
-0.7294944, 1.165788, -0.7899825, 1, 1, 1, 1, 1,
-0.72552, 0.5636607, -1.584105, 1, 1, 1, 1, 1,
-0.7171048, -1.284831, -3.224178, 1, 1, 1, 1, 1,
-0.7152822, 2.147405, -0.8397067, 1, 1, 1, 1, 1,
-0.7151152, -0.09208098, -2.303651, 1, 1, 1, 1, 1,
-0.7127432, -0.8699446, -1.697891, 1, 1, 1, 1, 1,
-0.7098305, -0.5663154, -1.839296, 1, 1, 1, 1, 1,
-0.7082293, -1.629946, -2.409115, 1, 1, 1, 1, 1,
-0.7018562, 0.169839, -0.9775105, 1, 1, 1, 1, 1,
-0.7004922, 1.466746, -1.679062, 1, 1, 1, 1, 1,
-0.7004273, -0.9761662, -2.882445, 1, 1, 1, 1, 1,
-0.700105, -1.990643, -2.760566, 1, 1, 1, 1, 1,
-0.6947882, 0.9063393, 0.8366508, 0, 0, 1, 1, 1,
-0.6924868, 1.865948, 0.5065652, 1, 0, 0, 1, 1,
-0.6903155, -0.1307832, -0.8858266, 1, 0, 0, 1, 1,
-0.6900239, -0.1142462, -2.447027, 1, 0, 0, 1, 1,
-0.6873205, 0.105813, -1.942714, 1, 0, 0, 1, 1,
-0.6861565, 1.447101, -0.6983247, 1, 0, 0, 1, 1,
-0.6839226, 1.168795, -0.4515245, 0, 0, 0, 1, 1,
-0.6832071, -0.8629211, -1.526451, 0, 0, 0, 1, 1,
-0.6787342, 1.771662, -0.2547757, 0, 0, 0, 1, 1,
-0.6704197, 0.8167013, -2.663496, 0, 0, 0, 1, 1,
-0.66135, 0.5019496, -0.3990844, 0, 0, 0, 1, 1,
-0.6566866, 0.01210913, -2.389913, 0, 0, 0, 1, 1,
-0.6546977, -0.6065967, -3.915266, 0, 0, 0, 1, 1,
-0.6529859, -0.09106894, -0.8695991, 1, 1, 1, 1, 1,
-0.651742, -0.3280266, -2.060741, 1, 1, 1, 1, 1,
-0.648307, 0.2000441, -1.011962, 1, 1, 1, 1, 1,
-0.6458319, 0.7336434, -1.328181, 1, 1, 1, 1, 1,
-0.6433908, 2.092398, -0.3395067, 1, 1, 1, 1, 1,
-0.6410897, -0.7683356, -1.988954, 1, 1, 1, 1, 1,
-0.6396521, 0.9862035, -1.46671, 1, 1, 1, 1, 1,
-0.6388329, -1.537204, -3.076832, 1, 1, 1, 1, 1,
-0.6361539, 0.8208514, 0.9296944, 1, 1, 1, 1, 1,
-0.6359515, -0.604583, -0.7443415, 1, 1, 1, 1, 1,
-0.6342648, -0.3870918, -1.234353, 1, 1, 1, 1, 1,
-0.6201114, 2.686375, -0.6898759, 1, 1, 1, 1, 1,
-0.6180651, 0.2632125, -0.5593051, 1, 1, 1, 1, 1,
-0.6163197, -1.621125, -2.927123, 1, 1, 1, 1, 1,
-0.6134436, -0.2258051, -1.556333, 1, 1, 1, 1, 1,
-0.6102911, -0.5198256, -1.027687, 0, 0, 1, 1, 1,
-0.6086274, -1.821192, -3.008111, 1, 0, 0, 1, 1,
-0.6064648, 1.171892, -0.4696079, 1, 0, 0, 1, 1,
-0.5977488, 1.02292, -1.368116, 1, 0, 0, 1, 1,
-0.5970931, 1.632073, 0.2354092, 1, 0, 0, 1, 1,
-0.5938447, 0.7969423, -2.05632, 1, 0, 0, 1, 1,
-0.5915806, -1.066023, -1.422514, 0, 0, 0, 1, 1,
-0.5891489, 0.8065558, -0.8983006, 0, 0, 0, 1, 1,
-0.5810335, 1.789738, 0.5413768, 0, 0, 0, 1, 1,
-0.5775069, 0.6550137, -1.11031, 0, 0, 0, 1, 1,
-0.576506, 0.6011425, -0.08259189, 0, 0, 0, 1, 1,
-0.5748559, 0.7204672, -1.448295, 0, 0, 0, 1, 1,
-0.5738089, -0.9128698, -1.410793, 0, 0, 0, 1, 1,
-0.5734537, 1.079665, 0.8960013, 1, 1, 1, 1, 1,
-0.5727623, -0.8568484, -2.489291, 1, 1, 1, 1, 1,
-0.5717463, 1.328759, -0.2788699, 1, 1, 1, 1, 1,
-0.5715682, -0.6292275, -3.919393, 1, 1, 1, 1, 1,
-0.5626577, -2.027969, -4.647363, 1, 1, 1, 1, 1,
-0.5605742, -0.1568919, -3.551338, 1, 1, 1, 1, 1,
-0.5563798, -0.2965553, -2.393679, 1, 1, 1, 1, 1,
-0.5558519, -0.5801043, -1.839346, 1, 1, 1, 1, 1,
-0.5545771, -0.5198156, -4.288999, 1, 1, 1, 1, 1,
-0.5539229, 0.5817669, 0.6832052, 1, 1, 1, 1, 1,
-0.5519388, -0.4603054, -3.098078, 1, 1, 1, 1, 1,
-0.5452183, -0.8115505, -3.222657, 1, 1, 1, 1, 1,
-0.5444847, -0.639881, -3.26573, 1, 1, 1, 1, 1,
-0.5443598, 1.205775, -0.08277886, 1, 1, 1, 1, 1,
-0.5417883, -0.5658055, -1.323285, 1, 1, 1, 1, 1,
-0.5349033, -0.1580153, -0.9891148, 0, 0, 1, 1, 1,
-0.5341442, 1.65448, 0.4663673, 1, 0, 0, 1, 1,
-0.5332376, 0.6155671, -0.4858938, 1, 0, 0, 1, 1,
-0.5307866, -1.345851, -2.563706, 1, 0, 0, 1, 1,
-0.5303009, 1.626526, -0.3097064, 1, 0, 0, 1, 1,
-0.5290391, 1.233664, -0.7709202, 1, 0, 0, 1, 1,
-0.5289608, -0.5663432, -3.415791, 0, 0, 0, 1, 1,
-0.5282441, 0.1228032, -0.3834218, 0, 0, 0, 1, 1,
-0.5262501, 0.557935, -0.1598988, 0, 0, 0, 1, 1,
-0.5239857, -1.60139, -2.046001, 0, 0, 0, 1, 1,
-0.5233337, -1.407172, -3.19751, 0, 0, 0, 1, 1,
-0.5209135, 2.196766, -0.5744098, 0, 0, 0, 1, 1,
-0.5205762, -1.385424, -4.786671, 0, 0, 0, 1, 1,
-0.5104039, -0.0624055, -1.277265, 1, 1, 1, 1, 1,
-0.510249, 0.3703023, -1.23847, 1, 1, 1, 1, 1,
-0.5078141, -1.331189, -1.957577, 1, 1, 1, 1, 1,
-0.5013447, -1.136185, -2.490373, 1, 1, 1, 1, 1,
-0.5012195, -0.0300796, -5.114215, 1, 1, 1, 1, 1,
-0.5005191, 0.3276898, 0.3204126, 1, 1, 1, 1, 1,
-0.4994376, -0.3346845, -2.368341, 1, 1, 1, 1, 1,
-0.4993192, 0.7435522, -0.7007508, 1, 1, 1, 1, 1,
-0.4981347, -0.9593474, -3.472447, 1, 1, 1, 1, 1,
-0.4951763, -0.07347757, -1.480028, 1, 1, 1, 1, 1,
-0.493521, -0.1911631, -0.4272415, 1, 1, 1, 1, 1,
-0.4905967, -0.9454069, -1.834881, 1, 1, 1, 1, 1,
-0.4883677, -0.2430642, -2.512134, 1, 1, 1, 1, 1,
-0.4872656, -1.679524, -2.385516, 1, 1, 1, 1, 1,
-0.4852031, 0.1568656, -1.127062, 1, 1, 1, 1, 1,
-0.4844597, 0.6935634, -1.705326, 0, 0, 1, 1, 1,
-0.4834394, 0.2032593, 0.2922672, 1, 0, 0, 1, 1,
-0.483353, -0.32982, -0.7663437, 1, 0, 0, 1, 1,
-0.4778235, 0.02817987, -0.5227982, 1, 0, 0, 1, 1,
-0.4722141, 1.462131, 0.7545698, 1, 0, 0, 1, 1,
-0.4708288, -0.2122609, -2.162132, 1, 0, 0, 1, 1,
-0.4653984, -0.3122562, -1.962923, 0, 0, 0, 1, 1,
-0.4633256, -1.205029, -2.465166, 0, 0, 0, 1, 1,
-0.4611238, 0.4779649, -1.308641, 0, 0, 0, 1, 1,
-0.460929, -0.4151611, -0.8320776, 0, 0, 0, 1, 1,
-0.4605489, 0.7248389, -0.5418015, 0, 0, 0, 1, 1,
-0.4587368, 1.479379, -1.02059, 0, 0, 0, 1, 1,
-0.4575791, -0.2476246, -2.612923, 0, 0, 0, 1, 1,
-0.4515279, 0.6012618, -2.372476, 1, 1, 1, 1, 1,
-0.450863, -1.329247, -0.923805, 1, 1, 1, 1, 1,
-0.4500913, -1.193242, -1.754475, 1, 1, 1, 1, 1,
-0.4492844, -0.8037043, -3.689652, 1, 1, 1, 1, 1,
-0.4449953, -1.155395, -3.71186, 1, 1, 1, 1, 1,
-0.4447203, 0.1291347, -1.589209, 1, 1, 1, 1, 1,
-0.4437372, -1.249422, -3.32327, 1, 1, 1, 1, 1,
-0.4405258, -1.384793, -3.602176, 1, 1, 1, 1, 1,
-0.4370382, 0.3275664, -1.005658, 1, 1, 1, 1, 1,
-0.4339403, 0.1419472, -1.531444, 1, 1, 1, 1, 1,
-0.4325126, 0.2662971, 0.2275997, 1, 1, 1, 1, 1,
-0.4304768, 0.3511401, -1.676271, 1, 1, 1, 1, 1,
-0.4278567, 1.309256, -2.672293, 1, 1, 1, 1, 1,
-0.4242625, -0.03700096, 0.5554395, 1, 1, 1, 1, 1,
-0.4229247, -0.7309897, -2.387828, 1, 1, 1, 1, 1,
-0.4210084, -0.233536, -1.703321, 0, 0, 1, 1, 1,
-0.4189782, 2.401246, 0.4546337, 1, 0, 0, 1, 1,
-0.4189256, -0.5980626, -3.170262, 1, 0, 0, 1, 1,
-0.4183438, -0.07732025, -0.5633907, 1, 0, 0, 1, 1,
-0.4161974, 0.03827571, -2.870964, 1, 0, 0, 1, 1,
-0.4123394, -1.187708, -3.113936, 1, 0, 0, 1, 1,
-0.4030074, -0.807349, -1.596184, 0, 0, 0, 1, 1,
-0.3998354, -0.1713995, -2.34248, 0, 0, 0, 1, 1,
-0.3993827, 1.313749, 0.6039732, 0, 0, 0, 1, 1,
-0.3906792, 0.1948358, -1.630737, 0, 0, 0, 1, 1,
-0.3905653, 0.7051941, -0.3158257, 0, 0, 0, 1, 1,
-0.3901769, 1.018121, -0.1575341, 0, 0, 0, 1, 1,
-0.3813049, 0.2364065, 0.243389, 0, 0, 0, 1, 1,
-0.3804325, -0.01198795, -0.06600562, 1, 1, 1, 1, 1,
-0.380119, 0.7663653, -1.047675, 1, 1, 1, 1, 1,
-0.3735521, -0.7971399, -2.325389, 1, 1, 1, 1, 1,
-0.3702758, -0.4789548, -3.634935, 1, 1, 1, 1, 1,
-0.3697449, 0.524613, -2.342325, 1, 1, 1, 1, 1,
-0.3668901, -0.3779394, -1.284631, 1, 1, 1, 1, 1,
-0.3641466, 1.055366, 0.5015604, 1, 1, 1, 1, 1,
-0.3600825, 0.1865787, -3.389516, 1, 1, 1, 1, 1,
-0.3564635, -0.6381404, -4.316518, 1, 1, 1, 1, 1,
-0.3561239, 0.2998451, -0.2667607, 1, 1, 1, 1, 1,
-0.3342056, 0.1001637, -0.8729896, 1, 1, 1, 1, 1,
-0.3311955, 2.600468, 0.4741874, 1, 1, 1, 1, 1,
-0.3295486, -0.03674695, -1.343924, 1, 1, 1, 1, 1,
-0.3268967, -0.04794321, -1.352809, 1, 1, 1, 1, 1,
-0.325141, 0.3938743, -0.6358529, 1, 1, 1, 1, 1,
-0.3237869, -0.05222167, -0.009320722, 0, 0, 1, 1, 1,
-0.3236905, -0.4502569, -2.608843, 1, 0, 0, 1, 1,
-0.3136847, -1.518476, -3.251505, 1, 0, 0, 1, 1,
-0.3095552, -0.4655217, -3.444878, 1, 0, 0, 1, 1,
-0.3093544, -0.8625364, -2.111394, 1, 0, 0, 1, 1,
-0.2958339, -0.1396647, -1.562138, 1, 0, 0, 1, 1,
-0.2950497, -0.24162, -2.382163, 0, 0, 0, 1, 1,
-0.294194, 0.02532913, -2.127174, 0, 0, 0, 1, 1,
-0.2915247, -0.2933801, -2.952696, 0, 0, 0, 1, 1,
-0.2880678, 0.006394875, -1.167656, 0, 0, 0, 1, 1,
-0.2830477, 1.715132, -0.4781968, 0, 0, 0, 1, 1,
-0.2760376, -1.658824, -2.015637, 0, 0, 0, 1, 1,
-0.2743776, 1.835274, 1.819121, 0, 0, 0, 1, 1,
-0.2737899, 0.562219, -0.7334137, 1, 1, 1, 1, 1,
-0.2699347, 0.3051366, -0.6746302, 1, 1, 1, 1, 1,
-0.2692215, -0.5158702, -3.101972, 1, 1, 1, 1, 1,
-0.2664345, 1.553708, 0.371992, 1, 1, 1, 1, 1,
-0.2581451, -0.8599274, -2.974809, 1, 1, 1, 1, 1,
-0.25676, -0.07842702, -2.240605, 1, 1, 1, 1, 1,
-0.2496733, 0.823282, 0.6562664, 1, 1, 1, 1, 1,
-0.2480611, -0.8056712, -1.739337, 1, 1, 1, 1, 1,
-0.2451967, 0.6283414, -1.405145, 1, 1, 1, 1, 1,
-0.2419031, -1.219297, -2.055851, 1, 1, 1, 1, 1,
-0.2390354, 2.262678, 1.110793, 1, 1, 1, 1, 1,
-0.2377423, 0.7540286, 1.055589, 1, 1, 1, 1, 1,
-0.236155, -1.062325, -1.183602, 1, 1, 1, 1, 1,
-0.2297387, -0.5294936, -2.68384, 1, 1, 1, 1, 1,
-0.2251595, 0.4921365, 0.8600858, 1, 1, 1, 1, 1,
-0.2178589, -0.4390284, -3.188112, 0, 0, 1, 1, 1,
-0.2175166, 1.160019, -0.4472252, 1, 0, 0, 1, 1,
-0.2096766, -2.296703, -4.405183, 1, 0, 0, 1, 1,
-0.2081814, -0.5943276, -3.544893, 1, 0, 0, 1, 1,
-0.2042476, -0.2858718, -1.480469, 1, 0, 0, 1, 1,
-0.2024857, -0.5259697, -4.038938, 1, 0, 0, 1, 1,
-0.2023433, 0.7603724, -0.4087998, 0, 0, 0, 1, 1,
-0.1990226, 0.08264612, 1.690429, 0, 0, 0, 1, 1,
-0.1975286, 0.831214, 0.5990272, 0, 0, 0, 1, 1,
-0.1934551, -1.683021, -3.60687, 0, 0, 0, 1, 1,
-0.1910745, 0.4754438, -0.5067908, 0, 0, 0, 1, 1,
-0.1880693, 0.2552213, -0.7935897, 0, 0, 0, 1, 1,
-0.1871373, 0.02829928, -2.241948, 0, 0, 0, 1, 1,
-0.1752467, -1.584417, -2.430254, 1, 1, 1, 1, 1,
-0.1690846, -1.044557, -1.540733, 1, 1, 1, 1, 1,
-0.1624299, 1.760648, -0.01984358, 1, 1, 1, 1, 1,
-0.1601437, -0.5319078, -3.09735, 1, 1, 1, 1, 1,
-0.1596589, -1.911488, -2.806957, 1, 1, 1, 1, 1,
-0.1591212, -0.3202653, -1.77743, 1, 1, 1, 1, 1,
-0.1558839, -0.7385413, -2.233224, 1, 1, 1, 1, 1,
-0.1518247, 0.2560335, 1.398925, 1, 1, 1, 1, 1,
-0.1462844, 0.4002654, -0.9915399, 1, 1, 1, 1, 1,
-0.1448877, 0.3606105, 1.024695, 1, 1, 1, 1, 1,
-0.1392785, -1.018921, -3.930475, 1, 1, 1, 1, 1,
-0.1387122, -0.11836, -3.372256, 1, 1, 1, 1, 1,
-0.1383922, -0.997953, -3.746294, 1, 1, 1, 1, 1,
-0.1376862, -0.5865847, -4.746972, 1, 1, 1, 1, 1,
-0.1343056, 0.03174084, -1.937093, 1, 1, 1, 1, 1,
-0.1313719, 1.435231, 1.787281, 0, 0, 1, 1, 1,
-0.1312167, 1.052872, 0.156737, 1, 0, 0, 1, 1,
-0.1308211, -1.034471, -3.666861, 1, 0, 0, 1, 1,
-0.1295598, 0.9545199, 0.5015472, 1, 0, 0, 1, 1,
-0.1279464, 0.8802066, 0.3752587, 1, 0, 0, 1, 1,
-0.1256579, 1.035343, 1.298058, 1, 0, 0, 1, 1,
-0.1247525, 1.880306, 0.7248281, 0, 0, 0, 1, 1,
-0.1243751, -1.402627, -2.194111, 0, 0, 0, 1, 1,
-0.1235647, 0.3446728, -0.6801947, 0, 0, 0, 1, 1,
-0.1206119, -0.727196, -2.778586, 0, 0, 0, 1, 1,
-0.1187831, -0.8937225, -1.171207, 0, 0, 0, 1, 1,
-0.1159446, -0.9126409, -2.596617, 0, 0, 0, 1, 1,
-0.1156448, 1.901503, 0.7857977, 0, 0, 0, 1, 1,
-0.1156277, 0.8014395, 0.0810807, 1, 1, 1, 1, 1,
-0.1127253, -0.3154121, -2.322158, 1, 1, 1, 1, 1,
-0.1076908, 2.14814, -1.906959, 1, 1, 1, 1, 1,
-0.1048422, -1.023007, -2.588731, 1, 1, 1, 1, 1,
-0.1025487, -1.076515, -2.367862, 1, 1, 1, 1, 1,
-0.1019292, -0.6840808, -1.902652, 1, 1, 1, 1, 1,
-0.1012837, 0.6946966, 0.4469125, 1, 1, 1, 1, 1,
-0.09662184, 0.8919924, -0.04871801, 1, 1, 1, 1, 1,
-0.09634061, -0.6164906, -3.687237, 1, 1, 1, 1, 1,
-0.0949012, -0.5341836, -3.077007, 1, 1, 1, 1, 1,
-0.09187322, -0.9619284, -3.426215, 1, 1, 1, 1, 1,
-0.08901411, -1.404543, -2.852337, 1, 1, 1, 1, 1,
-0.08069639, -0.8945395, -3.781309, 1, 1, 1, 1, 1,
-0.07963382, 0.0385601, -1.733098, 1, 1, 1, 1, 1,
-0.07506559, 1.091846, -0.3981704, 1, 1, 1, 1, 1,
-0.07270601, 0.05589317, -0.1735923, 0, 0, 1, 1, 1,
-0.07210712, 1.301864, -1.278962, 1, 0, 0, 1, 1,
-0.07082471, 1.655269, -0.7057863, 1, 0, 0, 1, 1,
-0.0703393, 1.109778, -0.9443608, 1, 0, 0, 1, 1,
-0.06842899, -1.206478, -4.044995, 1, 0, 0, 1, 1,
-0.06573502, -2.368755, -4.285497, 1, 0, 0, 1, 1,
-0.0650444, -0.8902366, -2.836345, 0, 0, 0, 1, 1,
-0.06251242, -0.136553, -1.112531, 0, 0, 0, 1, 1,
-0.05651289, -0.2618205, -1.688837, 0, 0, 0, 1, 1,
-0.05562561, -0.2125312, -1.728261, 0, 0, 0, 1, 1,
-0.05555791, -1.853508, -3.331358, 0, 0, 0, 1, 1,
-0.05205845, -0.3659092, -4.285617, 0, 0, 0, 1, 1,
-0.04797454, -2.476668, -2.574843, 0, 0, 0, 1, 1,
-0.04763373, -0.06235144, -2.71077, 1, 1, 1, 1, 1,
-0.04657485, 0.04834581, -1.828559, 1, 1, 1, 1, 1,
-0.04639906, 1.183093, -2.174992, 1, 1, 1, 1, 1,
-0.04150164, -0.224279, -3.650837, 1, 1, 1, 1, 1,
-0.03643565, -1.615691, -2.846369, 1, 1, 1, 1, 1,
-0.03455092, -0.6699412, -2.430211, 1, 1, 1, 1, 1,
-0.03206364, -0.3451131, -2.995279, 1, 1, 1, 1, 1,
-0.02584252, 1.177896, 1.159497, 1, 1, 1, 1, 1,
-0.02510487, -0.1830376, -4.613067, 1, 1, 1, 1, 1,
-0.02506374, -0.6174241, -4.711321, 1, 1, 1, 1, 1,
-0.02295324, -0.3272524, -3.569069, 1, 1, 1, 1, 1,
-0.02293397, 0.3283071, -0.815385, 1, 1, 1, 1, 1,
-0.02267464, 0.564667, -2.00724, 1, 1, 1, 1, 1,
-0.01917124, 1.396543, 0.4550635, 1, 1, 1, 1, 1,
-0.01861384, 1.185076, -2.096132, 1, 1, 1, 1, 1,
-0.01680326, -0.7027803, -3.611753, 0, 0, 1, 1, 1,
-0.01530741, 1.351828, -0.1140263, 1, 0, 0, 1, 1,
-0.01508005, -0.3021605, -3.837395, 1, 0, 0, 1, 1,
-0.00926581, 0.6300951, -2.105439, 1, 0, 0, 1, 1,
-0.00155925, -0.3084843, -2.814771, 1, 0, 0, 1, 1,
0.003289857, 0.2335751, 0.1741002, 1, 0, 0, 1, 1,
0.003332459, -0.3049965, 4.141695, 0, 0, 0, 1, 1,
0.004645589, -0.904599, 3.129323, 0, 0, 0, 1, 1,
0.006183011, 1.25178, -0.0737408, 0, 0, 0, 1, 1,
0.006989087, -0.8592238, 3.105903, 0, 0, 0, 1, 1,
0.01260611, -0.667556, 3.572749, 0, 0, 0, 1, 1,
0.01267004, 1.082653, 0.3440671, 0, 0, 0, 1, 1,
0.0147886, 1.381268, -0.9554681, 0, 0, 0, 1, 1,
0.01644976, -1.852864, 1.603148, 1, 1, 1, 1, 1,
0.0183351, 0.6410561, 0.4326654, 1, 1, 1, 1, 1,
0.02059531, -1.068379, 4.388584, 1, 1, 1, 1, 1,
0.02568101, -0.02704745, 4.183372, 1, 1, 1, 1, 1,
0.03077006, 0.9717634, -0.5682538, 1, 1, 1, 1, 1,
0.03302974, 0.9228006, 1.475856, 1, 1, 1, 1, 1,
0.03824592, -0.4573659, 3.543532, 1, 1, 1, 1, 1,
0.03883749, 1.144071, -0.1438825, 1, 1, 1, 1, 1,
0.04370734, -1.547839, 1.097251, 1, 1, 1, 1, 1,
0.04573269, -1.764855, 3.922831, 1, 1, 1, 1, 1,
0.04774792, -0.7651598, 3.64573, 1, 1, 1, 1, 1,
0.05315471, 0.03302198, 0.6747993, 1, 1, 1, 1, 1,
0.05632297, 1.784515, 1.0282, 1, 1, 1, 1, 1,
0.05728837, 0.2947195, -1.677233, 1, 1, 1, 1, 1,
0.06013497, 0.5352439, 1.012442, 1, 1, 1, 1, 1,
0.06146743, -0.1349337, 2.419462, 0, 0, 1, 1, 1,
0.06240575, 1.873251, 1.289857, 1, 0, 0, 1, 1,
0.06596525, 0.6031417, -1.513074, 1, 0, 0, 1, 1,
0.06768335, -0.3554021, 1.870814, 1, 0, 0, 1, 1,
0.06771258, 2.073309, 1.391195, 1, 0, 0, 1, 1,
0.06798682, -0.8191485, 4.732166, 1, 0, 0, 1, 1,
0.06902342, -0.6588697, 3.285571, 0, 0, 0, 1, 1,
0.06932244, 1.666942, -0.8077972, 0, 0, 0, 1, 1,
0.06934571, 0.5850466, 0.7613437, 0, 0, 0, 1, 1,
0.07400489, 0.8545533, 0.8657182, 0, 0, 0, 1, 1,
0.07455756, 0.9480791, 0.07337093, 0, 0, 0, 1, 1,
0.07633999, -0.8900857, 3.200202, 0, 0, 0, 1, 1,
0.07856499, 1.158669, -0.3717139, 0, 0, 0, 1, 1,
0.07942166, -0.4787466, 3.288587, 1, 1, 1, 1, 1,
0.08654242, 0.9719096, 2.483571, 1, 1, 1, 1, 1,
0.08833364, 0.4715346, 0.9419653, 1, 1, 1, 1, 1,
0.09846036, -0.9579889, 4.084581, 1, 1, 1, 1, 1,
0.09896049, 0.5091359, -0.2129917, 1, 1, 1, 1, 1,
0.09982985, 0.05746988, -0.1428521, 1, 1, 1, 1, 1,
0.1038265, 0.09457356, -0.2496056, 1, 1, 1, 1, 1,
0.1071298, -0.4420865, 1.989552, 1, 1, 1, 1, 1,
0.1071423, -1.208177, 1.105904, 1, 1, 1, 1, 1,
0.1072846, -0.1894689, 2.278663, 1, 1, 1, 1, 1,
0.1162515, -1.108273, 1.874747, 1, 1, 1, 1, 1,
0.1185546, 1.193133, -0.5010183, 1, 1, 1, 1, 1,
0.1189693, 0.1676979, 1.097613, 1, 1, 1, 1, 1,
0.1194439, 2.179043, 1.68086, 1, 1, 1, 1, 1,
0.1237114, -2.155993, 3.206987, 1, 1, 1, 1, 1,
0.1256823, -0.2532099, 4.008123, 0, 0, 1, 1, 1,
0.1263963, -0.516516, 1.89375, 1, 0, 0, 1, 1,
0.1295375, 0.1845282, 0.1767219, 1, 0, 0, 1, 1,
0.1299853, 0.333921, 0.06816265, 1, 0, 0, 1, 1,
0.132579, -0.03394821, 2.516614, 1, 0, 0, 1, 1,
0.1339387, 0.7775661, -0.8040977, 1, 0, 0, 1, 1,
0.137724, -1.400331, 3.327241, 0, 0, 0, 1, 1,
0.1397162, 0.8529825, -0.3150913, 0, 0, 0, 1, 1,
0.144943, -0.2817352, 2.771761, 0, 0, 0, 1, 1,
0.1465172, -0.4326392, 1.289424, 0, 0, 0, 1, 1,
0.1489861, -0.787011, 2.9777, 0, 0, 0, 1, 1,
0.1520103, 0.6442154, 1.803282, 0, 0, 0, 1, 1,
0.1582419, -0.8548656, 2.152415, 0, 0, 0, 1, 1,
0.1608192, 0.09238135, 0.03275413, 1, 1, 1, 1, 1,
0.1612207, -0.4080337, 1.140338, 1, 1, 1, 1, 1,
0.1629344, -1.466979, 3.719238, 1, 1, 1, 1, 1,
0.1634626, 1.446588, -0.6954336, 1, 1, 1, 1, 1,
0.1642822, 0.7176201, 0.87279, 1, 1, 1, 1, 1,
0.1694124, -1.021218, 3.754456, 1, 1, 1, 1, 1,
0.1729762, 0.0163367, 2.124229, 1, 1, 1, 1, 1,
0.173423, 0.02955631, 3.009758, 1, 1, 1, 1, 1,
0.1745652, -0.8325782, 3.805973, 1, 1, 1, 1, 1,
0.1768813, -0.3635975, 2.413089, 1, 1, 1, 1, 1,
0.1777806, -0.6036498, 1.561369, 1, 1, 1, 1, 1,
0.1788779, -1.857927, 3.624662, 1, 1, 1, 1, 1,
0.1811978, -0.1887764, 1.23481, 1, 1, 1, 1, 1,
0.1823006, -0.3228044, 2.280954, 1, 1, 1, 1, 1,
0.1843964, 1.410447, -0.5147346, 1, 1, 1, 1, 1,
0.1865978, 0.8603408, 0.550158, 0, 0, 1, 1, 1,
0.187269, -2.024247, 4.409565, 1, 0, 0, 1, 1,
0.1878909, -0.5123206, 3.025572, 1, 0, 0, 1, 1,
0.1905906, -1.450589, 2.643796, 1, 0, 0, 1, 1,
0.1915244, -0.3204107, 1.153263, 1, 0, 0, 1, 1,
0.1925982, -0.04008559, 2.675934, 1, 0, 0, 1, 1,
0.1926447, 0.4770347, 0.8434872, 0, 0, 0, 1, 1,
0.1929171, -0.5756938, 1.764334, 0, 0, 0, 1, 1,
0.2008622, 0.1871311, -0.6782322, 0, 0, 0, 1, 1,
0.210178, 0.3271445, 0.4645643, 0, 0, 0, 1, 1,
0.2104765, -0.7579491, 3.127885, 0, 0, 0, 1, 1,
0.2107136, 1.798294, 2.33503, 0, 0, 0, 1, 1,
0.2142418, 0.8283691, -0.6062332, 0, 0, 0, 1, 1,
0.2186153, -0.9252104, 2.664252, 1, 1, 1, 1, 1,
0.2191097, 0.5492908, 1.12487, 1, 1, 1, 1, 1,
0.2230348, -0.5044005, 2.955054, 1, 1, 1, 1, 1,
0.2237944, 0.059792, 1.446905, 1, 1, 1, 1, 1,
0.2318358, -1.328436, 1.068094, 1, 1, 1, 1, 1,
0.2331273, 1.453835, -0.8933828, 1, 1, 1, 1, 1,
0.2386257, 2.153563, -2.255131, 1, 1, 1, 1, 1,
0.2439912, 0.3038201, -1.377032, 1, 1, 1, 1, 1,
0.2441271, 0.9916003, 0.2858942, 1, 1, 1, 1, 1,
0.2516155, 0.4565901, 0.7400402, 1, 1, 1, 1, 1,
0.2536106, -0.5783838, 2.789549, 1, 1, 1, 1, 1,
0.2538747, 0.7376046, 0.7038442, 1, 1, 1, 1, 1,
0.2544774, -1.599783, 2.916342, 1, 1, 1, 1, 1,
0.2557526, -0.534606, 3.152279, 1, 1, 1, 1, 1,
0.2593855, -0.9212042, 2.619276, 1, 1, 1, 1, 1,
0.2681409, -0.2510673, 2.827427, 0, 0, 1, 1, 1,
0.2705761, -0.05024846, 1.659457, 1, 0, 0, 1, 1,
0.2711239, 0.8074952, -0.03141197, 1, 0, 0, 1, 1,
0.2756902, 2.144532, -0.5535603, 1, 0, 0, 1, 1,
0.2906003, 1.26836, -0.09904012, 1, 0, 0, 1, 1,
0.2928575, -0.9254309, 4.050673, 1, 0, 0, 1, 1,
0.2953387, 0.4510695, 2.055749, 0, 0, 0, 1, 1,
0.3005978, 0.9369163, 0.6997309, 0, 0, 0, 1, 1,
0.3025417, -0.8441002, 3.635205, 0, 0, 0, 1, 1,
0.3040848, -1.521571, 4.233572, 0, 0, 0, 1, 1,
0.3045265, 1.081434, 1.351991, 0, 0, 0, 1, 1,
0.3057821, 1.240036, -0.1560481, 0, 0, 0, 1, 1,
0.3063206, 0.03922808, -0.5020621, 0, 0, 0, 1, 1,
0.3079977, 0.6062841, -1.491791, 1, 1, 1, 1, 1,
0.3121999, -0.1670653, 1.78776, 1, 1, 1, 1, 1,
0.313939, 0.9707372, -0.3346641, 1, 1, 1, 1, 1,
0.3178899, -2.038203, 4.695912, 1, 1, 1, 1, 1,
0.3225526, 0.4374686, -0.04686897, 1, 1, 1, 1, 1,
0.324668, -0.5941752, 2.418676, 1, 1, 1, 1, 1,
0.326693, 1.690252, 1.135396, 1, 1, 1, 1, 1,
0.3268989, -1.263095, 2.831926, 1, 1, 1, 1, 1,
0.3270139, 0.5776893, 0.2345263, 1, 1, 1, 1, 1,
0.3334858, -0.1875287, 0.6736251, 1, 1, 1, 1, 1,
0.3335075, 0.7046068, -0.346554, 1, 1, 1, 1, 1,
0.3362311, -0.1881032, 2.462378, 1, 1, 1, 1, 1,
0.3387575, 0.3203181, 1.281531, 1, 1, 1, 1, 1,
0.3413122, -1.271797, 2.937567, 1, 1, 1, 1, 1,
0.3417399, -0.616666, 3.374816, 1, 1, 1, 1, 1,
0.3452017, 1.681068, 0.7518975, 0, 0, 1, 1, 1,
0.3467518, -0.01566676, 0.9745383, 1, 0, 0, 1, 1,
0.3489446, -2.173647, 1.611075, 1, 0, 0, 1, 1,
0.3492627, -0.6052381, 1.810998, 1, 0, 0, 1, 1,
0.3500023, -0.2085613, 1.581753, 1, 0, 0, 1, 1,
0.3500856, 0.89276, 0.2820863, 1, 0, 0, 1, 1,
0.3528439, 0.839693, -1.727351, 0, 0, 0, 1, 1,
0.3535147, -0.2529383, 0.9357663, 0, 0, 0, 1, 1,
0.3556323, -0.7564323, 2.110448, 0, 0, 0, 1, 1,
0.356376, -0.6052306, 2.389304, 0, 0, 0, 1, 1,
0.3602851, 1.165485, 0.8964361, 0, 0, 0, 1, 1,
0.3612295, 0.4373531, 1.186381, 0, 0, 0, 1, 1,
0.3628774, -0.3235393, 2.360909, 0, 0, 0, 1, 1,
0.3701606, 1.013439, 0.6378863, 1, 1, 1, 1, 1,
0.3756579, -1.951843, 2.670584, 1, 1, 1, 1, 1,
0.3798181, -0.8626128, 2.636345, 1, 1, 1, 1, 1,
0.3804104, -1.312248, 3.384211, 1, 1, 1, 1, 1,
0.385771, -1.203418, 3.741976, 1, 1, 1, 1, 1,
0.3858001, 0.7209834, 1.233332, 1, 1, 1, 1, 1,
0.3858379, 0.8775633, 1.013958, 1, 1, 1, 1, 1,
0.3862185, -0.6234222, 1.564944, 1, 1, 1, 1, 1,
0.3866305, -0.08370304, 1.673164, 1, 1, 1, 1, 1,
0.3878759, 0.1978468, 2.065898, 1, 1, 1, 1, 1,
0.3895003, 0.5292891, 0.4589901, 1, 1, 1, 1, 1,
0.3956229, 1.582297, -0.2454283, 1, 1, 1, 1, 1,
0.4020893, 1.319971, 1.247537, 1, 1, 1, 1, 1,
0.4071822, 0.2979035, 1.149581, 1, 1, 1, 1, 1,
0.4073021, 1.324813, -0.3959377, 1, 1, 1, 1, 1,
0.4076945, -0.5401838, 1.886003, 0, 0, 1, 1, 1,
0.4147414, -0.2773305, 2.940681, 1, 0, 0, 1, 1,
0.4157394, 0.6176506, -0.1842469, 1, 0, 0, 1, 1,
0.421835, -0.1299672, 0.8578174, 1, 0, 0, 1, 1,
0.4218642, -0.6886567, 3.054978, 1, 0, 0, 1, 1,
0.4274252, -0.2723735, 2.401775, 1, 0, 0, 1, 1,
0.427687, 1.406405, 1.827793, 0, 0, 0, 1, 1,
0.4292063, 0.5767959, 0.5289625, 0, 0, 0, 1, 1,
0.4306386, -0.8451141, 2.423695, 0, 0, 0, 1, 1,
0.4335071, -1.604884, 2.773964, 0, 0, 0, 1, 1,
0.4365056, 0.7588014, -0.5814962, 0, 0, 0, 1, 1,
0.4368338, 0.6107327, 2.53835, 0, 0, 0, 1, 1,
0.4369355, -0.4463211, 2.849415, 0, 0, 0, 1, 1,
0.4374488, 0.795595, -1.217783, 1, 1, 1, 1, 1,
0.44017, 0.7442229, 1.55089, 1, 1, 1, 1, 1,
0.4501664, -1.102319, 2.155579, 1, 1, 1, 1, 1,
0.4538625, 1.590325, 0.4254194, 1, 1, 1, 1, 1,
0.4582182, -0.3060943, 2.410751, 1, 1, 1, 1, 1,
0.4706338, -0.1831118, 1.959662, 1, 1, 1, 1, 1,
0.477225, 0.01921204, 3.160271, 1, 1, 1, 1, 1,
0.4773699, -0.06290973, 3.045129, 1, 1, 1, 1, 1,
0.4774872, -1.176966, 2.728068, 1, 1, 1, 1, 1,
0.4784592, -0.7370713, 1.943596, 1, 1, 1, 1, 1,
0.4820914, -0.3830908, 3.916964, 1, 1, 1, 1, 1,
0.4826895, 0.4116218, 1.033271, 1, 1, 1, 1, 1,
0.489389, -0.1657679, 3.866209, 1, 1, 1, 1, 1,
0.4894938, -0.8258526, 2.350037, 1, 1, 1, 1, 1,
0.4927939, 0.4814451, 0.2247463, 1, 1, 1, 1, 1,
0.4934929, -1.323174, 3.376927, 0, 0, 1, 1, 1,
0.5016096, -0.2219242, 0.7999036, 1, 0, 0, 1, 1,
0.5058236, -0.1641611, 2.088817, 1, 0, 0, 1, 1,
0.5119846, 1.192819, 0.8091279, 1, 0, 0, 1, 1,
0.5138254, -1.278521, 2.976337, 1, 0, 0, 1, 1,
0.515367, -0.3696616, 2.043039, 1, 0, 0, 1, 1,
0.5256092, 0.167781, 1.466528, 0, 0, 0, 1, 1,
0.526628, -0.2882093, 2.278672, 0, 0, 0, 1, 1,
0.526746, -0.3472152, 0.1512586, 0, 0, 0, 1, 1,
0.5283763, 1.371965, 0.5873662, 0, 0, 0, 1, 1,
0.5297022, 0.3631078, 1.137075, 0, 0, 0, 1, 1,
0.5311451, -0.1600752, 2.732333, 0, 0, 0, 1, 1,
0.5354437, 0.01856791, 3.237336, 0, 0, 0, 1, 1,
0.5382215, -0.7779086, 2.691632, 1, 1, 1, 1, 1,
0.5405312, -1.791756, 2.557666, 1, 1, 1, 1, 1,
0.5426886, 0.7129008, -0.0746727, 1, 1, 1, 1, 1,
0.547386, 0.4625805, 0.08785706, 1, 1, 1, 1, 1,
0.5479237, 0.2007919, -0.5584374, 1, 1, 1, 1, 1,
0.5490934, -0.1093491, 1.522806, 1, 1, 1, 1, 1,
0.5560923, -0.1221388, 1.576491, 1, 1, 1, 1, 1,
0.5571168, -0.9774021, 3.107157, 1, 1, 1, 1, 1,
0.5573993, -1.248353, 3.665314, 1, 1, 1, 1, 1,
0.5596002, -1.150081, 2.315154, 1, 1, 1, 1, 1,
0.5596183, 1.037246, -0.8124256, 1, 1, 1, 1, 1,
0.560372, 1.515626, 0.5568469, 1, 1, 1, 1, 1,
0.562035, 0.3353834, 1.309122, 1, 1, 1, 1, 1,
0.5627843, -0.1593154, 1.444255, 1, 1, 1, 1, 1,
0.5638356, 0.3271093, 1.329307, 1, 1, 1, 1, 1,
0.5703698, -0.293931, 2.235411, 0, 0, 1, 1, 1,
0.5794828, 0.2639592, 1.668566, 1, 0, 0, 1, 1,
0.580224, -0.2397952, 2.452212, 1, 0, 0, 1, 1,
0.5860877, 0.2202745, 1.652001, 1, 0, 0, 1, 1,
0.5893094, -0.3003354, 2.442189, 1, 0, 0, 1, 1,
0.5917644, 1.070788, -0.7304519, 1, 0, 0, 1, 1,
0.5958869, 0.0204553, -0.02988848, 0, 0, 0, 1, 1,
0.6071003, 1.094726, 0.09245253, 0, 0, 0, 1, 1,
0.6101452, -0.7148119, 2.31688, 0, 0, 0, 1, 1,
0.6143379, -0.6967329, 2.483677, 0, 0, 0, 1, 1,
0.6169657, 1.114311, 0.6431862, 0, 0, 0, 1, 1,
0.6203088, -0.1301661, 0.6928023, 0, 0, 0, 1, 1,
0.6226557, -0.277462, -0.1877919, 0, 0, 0, 1, 1,
0.6273036, 1.187555, -0.06524441, 1, 1, 1, 1, 1,
0.6292167, 0.4188313, 1.692995, 1, 1, 1, 1, 1,
0.6298769, -0.1774036, 4.192492, 1, 1, 1, 1, 1,
0.6313193, 1.580771, -0.08564638, 1, 1, 1, 1, 1,
0.6335758, 0.5419362, 2.6132, 1, 1, 1, 1, 1,
0.6339462, -0.04194616, 1.203252, 1, 1, 1, 1, 1,
0.636304, -0.8666962, 2.256419, 1, 1, 1, 1, 1,
0.6422209, -1.210286, 2.145759, 1, 1, 1, 1, 1,
0.6445763, 0.3276275, 0.223643, 1, 1, 1, 1, 1,
0.6448314, 0.7634873, 1.453595, 1, 1, 1, 1, 1,
0.651293, 0.003843236, 3.98018, 1, 1, 1, 1, 1,
0.664325, 0.01140542, 1.33723, 1, 1, 1, 1, 1,
0.6662229, -1.777663, 3.572538, 1, 1, 1, 1, 1,
0.6699746, 0.4470263, -0.1258705, 1, 1, 1, 1, 1,
0.6701049, -0.7226147, 1.75261, 1, 1, 1, 1, 1,
0.6710625, 0.2365218, -0.3920455, 0, 0, 1, 1, 1,
0.672179, -1.289218, 3.731687, 1, 0, 0, 1, 1,
0.6788771, 0.9732879, -0.1836382, 1, 0, 0, 1, 1,
0.6796227, 2.4228, -0.9284723, 1, 0, 0, 1, 1,
0.6808068, -0.2197256, 2.596655, 1, 0, 0, 1, 1,
0.6853383, 2.007713, 1.597527, 1, 0, 0, 1, 1,
0.688175, 0.1414127, 1.347296, 0, 0, 0, 1, 1,
0.7053019, -0.1940624, 3.027296, 0, 0, 0, 1, 1,
0.7062322, 0.6209006, -0.9452617, 0, 0, 0, 1, 1,
0.7092436, 0.6373998, 2.709513, 0, 0, 0, 1, 1,
0.7127107, 1.45572, -0.02889406, 0, 0, 0, 1, 1,
0.7145523, 1.181951, -0.7616202, 0, 0, 0, 1, 1,
0.7255787, -0.5071757, 4.548429, 0, 0, 0, 1, 1,
0.7257075, 2.596203, -1.645244, 1, 1, 1, 1, 1,
0.7269163, 0.2210545, 0.9731961, 1, 1, 1, 1, 1,
0.7274352, 0.9965868, 0.860761, 1, 1, 1, 1, 1,
0.7282234, 1.621433, 1.054251, 1, 1, 1, 1, 1,
0.7310943, -0.5757337, 0.124731, 1, 1, 1, 1, 1,
0.7313499, 0.989812, 0.2919459, 1, 1, 1, 1, 1,
0.738502, 0.2950749, 0.9022585, 1, 1, 1, 1, 1,
0.739603, 0.4822452, 1.745932, 1, 1, 1, 1, 1,
0.7410763, 1.037042, -0.2379815, 1, 1, 1, 1, 1,
0.7411788, -0.0008114431, 2.682722, 1, 1, 1, 1, 1,
0.7417119, 0.636528, 0.8158215, 1, 1, 1, 1, 1,
0.7553744, 1.294296, -0.326936, 1, 1, 1, 1, 1,
0.7628474, 0.7655908, 0.01146389, 1, 1, 1, 1, 1,
0.7630544, 1.50103, 0.9192861, 1, 1, 1, 1, 1,
0.7651427, 1.114375, -0.4825448, 1, 1, 1, 1, 1,
0.7663683, 0.4653608, 0.9316508, 0, 0, 1, 1, 1,
0.7675399, -0.6159197, 2.293187, 1, 0, 0, 1, 1,
0.7678968, 0.4819784, 0.7026604, 1, 0, 0, 1, 1,
0.7681153, -0.8501293, 3.164064, 1, 0, 0, 1, 1,
0.7744466, -0.7282908, 1.567627, 1, 0, 0, 1, 1,
0.7783253, -0.8446719, 3.744426, 1, 0, 0, 1, 1,
0.7808138, -0.5146777, 3.785073, 0, 0, 0, 1, 1,
0.7821355, -0.3504919, 2.698315, 0, 0, 0, 1, 1,
0.7857702, 0.8795742, -0.2687782, 0, 0, 0, 1, 1,
0.7889567, 0.3777008, -0.2253052, 0, 0, 0, 1, 1,
0.792178, 0.9173004, 1.492967, 0, 0, 0, 1, 1,
0.7946336, -0.9097348, 0.5665612, 0, 0, 0, 1, 1,
0.8027609, -0.7634254, -0.2735814, 0, 0, 0, 1, 1,
0.8049123, 1.118285, -0.4363838, 1, 1, 1, 1, 1,
0.8106438, 0.8369936, 2.188951, 1, 1, 1, 1, 1,
0.8114727, 0.07332637, 2.482389, 1, 1, 1, 1, 1,
0.8126667, 0.8639767, 1.447032, 1, 1, 1, 1, 1,
0.8144635, 0.3236633, 2.534364, 1, 1, 1, 1, 1,
0.8176067, -0.9168476, 1.313984, 1, 1, 1, 1, 1,
0.8246813, -0.003755459, 2.260742, 1, 1, 1, 1, 1,
0.8276051, 0.8604389, 0.9157644, 1, 1, 1, 1, 1,
0.8365625, 0.2562708, 1.551375, 1, 1, 1, 1, 1,
0.8366014, 0.1873649, 1.075982, 1, 1, 1, 1, 1,
0.8381596, 1.425548, 0.6820211, 1, 1, 1, 1, 1,
0.8432486, -1.558121, 5.191591, 1, 1, 1, 1, 1,
0.8467143, -0.3206417, 2.312469, 1, 1, 1, 1, 1,
0.8485105, 1.70981, 0.9388149, 1, 1, 1, 1, 1,
0.8508433, -1.589944, 3.050555, 1, 1, 1, 1, 1,
0.8545693, -0.212497, 1.093194, 0, 0, 1, 1, 1,
0.8549513, 1.2253, -1.235468, 1, 0, 0, 1, 1,
0.8581039, -0.7643514, 1.921209, 1, 0, 0, 1, 1,
0.8610577, 0.3540093, 1.226537, 1, 0, 0, 1, 1,
0.8623106, 0.5637666, 1.754062, 1, 0, 0, 1, 1,
0.8654525, -1.734887, 2.888295, 1, 0, 0, 1, 1,
0.8658159, -0.5634714, 3.845822, 0, 0, 0, 1, 1,
0.8682324, 0.1602412, 1.688246, 0, 0, 0, 1, 1,
0.8692573, 0.8889039, 0.007363255, 0, 0, 0, 1, 1,
0.8712625, 1.643038, -1.067285, 0, 0, 0, 1, 1,
0.8715031, -1.393146, 2.835086, 0, 0, 0, 1, 1,
0.8717011, -1.524894, 1.258823, 0, 0, 0, 1, 1,
0.8726346, 1.128856, 2.489695, 0, 0, 0, 1, 1,
0.87491, -0.7844755, 1.122596, 1, 1, 1, 1, 1,
0.8782226, 0.6321059, 1.336263, 1, 1, 1, 1, 1,
0.8943543, 1.653954, 2.441181, 1, 1, 1, 1, 1,
0.8951477, -0.9220825, 1.721244, 1, 1, 1, 1, 1,
0.8957798, 1.499447, -0.1848094, 1, 1, 1, 1, 1,
0.9002873, 0.8766878, 1.470502, 1, 1, 1, 1, 1,
0.9072052, 0.2796745, 3.061075, 1, 1, 1, 1, 1,
0.9074157, -0.3935404, 2.586824, 1, 1, 1, 1, 1,
0.9109687, 0.09773724, 0.9932871, 1, 1, 1, 1, 1,
0.9309779, -0.6652564, 1.039679, 1, 1, 1, 1, 1,
0.9320856, 0.7815359, 0.9302035, 1, 1, 1, 1, 1,
0.9353957, 0.01027417, 1.632228, 1, 1, 1, 1, 1,
0.938047, 0.3014593, 1.787145, 1, 1, 1, 1, 1,
0.9462357, -0.5902131, 3.03289, 1, 1, 1, 1, 1,
0.9522694, -0.6325141, 1.335294, 1, 1, 1, 1, 1,
0.9539503, 0.5421089, 2.896737, 0, 0, 1, 1, 1,
0.9539883, 0.6148587, -1.178154, 1, 0, 0, 1, 1,
0.9623243, 0.650873, 2.080684, 1, 0, 0, 1, 1,
0.9651597, 0.1025834, 1.29002, 1, 0, 0, 1, 1,
0.9679819, 0.4959829, 0.5485291, 1, 0, 0, 1, 1,
0.9697668, -0.3744228, 0.8227679, 1, 0, 0, 1, 1,
0.9724783, -1.132871, 0.3785036, 0, 0, 0, 1, 1,
0.9738609, 0.07635669, 1.214413, 0, 0, 0, 1, 1,
0.9752867, 0.999025, 0.9570192, 0, 0, 0, 1, 1,
0.9767143, -0.6670887, 1.714789, 0, 0, 0, 1, 1,
0.988521, 1.300341, 0.4527172, 0, 0, 0, 1, 1,
0.9976091, 0.6718192, 0.8486979, 0, 0, 0, 1, 1,
0.9978081, 0.6689557, 1.228226, 0, 0, 0, 1, 1,
0.9987777, 1.384992, 0.5974661, 1, 1, 1, 1, 1,
1.004698, -1.01715, 2.416137, 1, 1, 1, 1, 1,
1.017611, 0.5581141, 2.410058, 1, 1, 1, 1, 1,
1.018708, -0.459044, 0.2230164, 1, 1, 1, 1, 1,
1.024895, -0.8275485, 1.024143, 1, 1, 1, 1, 1,
1.028307, -0.3002276, 3.653251, 1, 1, 1, 1, 1,
1.032353, -1.344026, 2.713815, 1, 1, 1, 1, 1,
1.036385, 0.11051, 0.9121648, 1, 1, 1, 1, 1,
1.041808, 0.5297028, 0.7014489, 1, 1, 1, 1, 1,
1.052463, -0.5759324, 1.978324, 1, 1, 1, 1, 1,
1.053696, 0.785348, -0.1929671, 1, 1, 1, 1, 1,
1.053739, 2.036579, 0.3800788, 1, 1, 1, 1, 1,
1.053758, -1.138437, 4.209228, 1, 1, 1, 1, 1,
1.054874, -0.2969266, 3.20313, 1, 1, 1, 1, 1,
1.06078, -1.024098, 2.625926, 1, 1, 1, 1, 1,
1.061003, 0.8789847, 1.581996, 0, 0, 1, 1, 1,
1.064751, 1.385631, 1.087345, 1, 0, 0, 1, 1,
1.071001, 0.4662645, 1.934913, 1, 0, 0, 1, 1,
1.07634, 1.786356, 0.1510255, 1, 0, 0, 1, 1,
1.080572, -0.2251238, 2.976642, 1, 0, 0, 1, 1,
1.082044, -2.914658, 2.36141, 1, 0, 0, 1, 1,
1.087806, 0.3640619, 1.929567, 0, 0, 0, 1, 1,
1.090157, -1.73551, 3.02611, 0, 0, 0, 1, 1,
1.091741, -1.269328, 2.841469, 0, 0, 0, 1, 1,
1.110233, -2.78748, 3.06422, 0, 0, 0, 1, 1,
1.129866, 1.388125, -0.1045192, 0, 0, 0, 1, 1,
1.131933, -1.375983, 2.167992, 0, 0, 0, 1, 1,
1.141287, -0.9331868, 2.109766, 0, 0, 0, 1, 1,
1.147323, 1.064562, 0.5999346, 1, 1, 1, 1, 1,
1.151354, 1.326741, 0.1579318, 1, 1, 1, 1, 1,
1.167755, 0.05804928, 1.646513, 1, 1, 1, 1, 1,
1.181503, -0.3228768, 1.606119, 1, 1, 1, 1, 1,
1.18394, 0.4627365, 2.293377, 1, 1, 1, 1, 1,
1.191397, -0.3430378, 2.422405, 1, 1, 1, 1, 1,
1.200673, 0.3628832, 1.412825, 1, 1, 1, 1, 1,
1.201892, 0.5392671, 0.7667969, 1, 1, 1, 1, 1,
1.20414, -0.5772433, 0.5125557, 1, 1, 1, 1, 1,
1.208521, -0.7975321, 1.964526, 1, 1, 1, 1, 1,
1.209357, 0.201928, 1.043689, 1, 1, 1, 1, 1,
1.217042, -1.462041, 0.4058251, 1, 1, 1, 1, 1,
1.220223, -0.5662821, 1.053369, 1, 1, 1, 1, 1,
1.220546, 1.764461, -0.2403775, 1, 1, 1, 1, 1,
1.235194, -0.8056527, 1.679806, 1, 1, 1, 1, 1,
1.23942, 1.45087, 0.8957205, 0, 0, 1, 1, 1,
1.241854, 1.2021, 0.133435, 1, 0, 0, 1, 1,
1.241977, 0.5922424, 3.48471, 1, 0, 0, 1, 1,
1.248161, 0.7343232, 0.5634651, 1, 0, 0, 1, 1,
1.257136, 1.298274, 1.287835, 1, 0, 0, 1, 1,
1.259999, -1.211421, 0.493107, 1, 0, 0, 1, 1,
1.26051, 1.622241, 1.60663, 0, 0, 0, 1, 1,
1.263899, -0.1127375, 1.668549, 0, 0, 0, 1, 1,
1.271738, -1.597496, 2.165888, 0, 0, 0, 1, 1,
1.274829, 1.062352, 1.425299, 0, 0, 0, 1, 1,
1.281217, 0.07409562, 3.628226, 0, 0, 0, 1, 1,
1.291734, -0.4232375, 1.264332, 0, 0, 0, 1, 1,
1.294741, -0.5616574, 2.643535, 0, 0, 0, 1, 1,
1.29583, 1.06925, 0.2413288, 1, 1, 1, 1, 1,
1.299281, 0.6484663, 4.393527, 1, 1, 1, 1, 1,
1.300737, 0.9124811, -1.494935, 1, 1, 1, 1, 1,
1.30269, 0.5688909, 2.277861, 1, 1, 1, 1, 1,
1.307006, -0.2946513, 2.110008, 1, 1, 1, 1, 1,
1.307446, -0.1943931, 0.3345944, 1, 1, 1, 1, 1,
1.309715, 0.122443, 1.64415, 1, 1, 1, 1, 1,
1.319087, -0.5037636, 1.558651, 1, 1, 1, 1, 1,
1.32402, 0.1936256, 0.3450699, 1, 1, 1, 1, 1,
1.324767, -1.34704, 2.661, 1, 1, 1, 1, 1,
1.327534, 0.7635495, 2.098228, 1, 1, 1, 1, 1,
1.328241, -0.2111063, 0.5639912, 1, 1, 1, 1, 1,
1.329406, 0.2673056, 0.988711, 1, 1, 1, 1, 1,
1.335637, -0.6662385, 1.95506, 1, 1, 1, 1, 1,
1.344607, -0.9696406, 1.497949, 1, 1, 1, 1, 1,
1.348291, 1.005124, 1.472269, 0, 0, 1, 1, 1,
1.356596, -0.8668524, 2.446375, 1, 0, 0, 1, 1,
1.36171, 1.866231, 1.071717, 1, 0, 0, 1, 1,
1.367258, 1.366745, 0.925886, 1, 0, 0, 1, 1,
1.370485, 0.5825361, 0.2394394, 1, 0, 0, 1, 1,
1.375061, -0.6694462, 2.191214, 1, 0, 0, 1, 1,
1.37643, -0.4857498, 1.41364, 0, 0, 0, 1, 1,
1.378143, 0.09251437, 3.271116, 0, 0, 0, 1, 1,
1.380483, -0.1438203, -0.8298529, 0, 0, 0, 1, 1,
1.380628, -0.2331837, 0.7517462, 0, 0, 0, 1, 1,
1.392906, 0.341772, 0.6364987, 0, 0, 0, 1, 1,
1.403532, -0.9218256, 1.735241, 0, 0, 0, 1, 1,
1.415862, -1.01883, 1.806398, 0, 0, 0, 1, 1,
1.423974, -2.162911, 4.184232, 1, 1, 1, 1, 1,
1.432068, -0.3321896, 2.30704, 1, 1, 1, 1, 1,
1.439828, 0.6774962, 0.7744398, 1, 1, 1, 1, 1,
1.4442, 0.6678283, -0.1076635, 1, 1, 1, 1, 1,
1.502177, -1.739979, 2.284287, 1, 1, 1, 1, 1,
1.523028, 0.1765459, 1.165622, 1, 1, 1, 1, 1,
1.52754, 0.4083657, 1.119702, 1, 1, 1, 1, 1,
1.528401, -0.7392079, 2.993948, 1, 1, 1, 1, 1,
1.544022, -0.3969882, 0.7360213, 1, 1, 1, 1, 1,
1.548165, -0.4445723, 2.020016, 1, 1, 1, 1, 1,
1.5536, 0.5846173, 2.738318, 1, 1, 1, 1, 1,
1.555338, 1.003076, 0.2099699, 1, 1, 1, 1, 1,
1.557886, -0.592585, 1.869721, 1, 1, 1, 1, 1,
1.558761, 1.022479, 1.225853, 1, 1, 1, 1, 1,
1.588805, -0.3599775, 1.427477, 1, 1, 1, 1, 1,
1.595016, -1.21995, 2.497998, 0, 0, 1, 1, 1,
1.609886, 0.1649621, 1.472196, 1, 0, 0, 1, 1,
1.610339, -0.8091799, 3.092263, 1, 0, 0, 1, 1,
1.635953, -1.794412, 2.510122, 1, 0, 0, 1, 1,
1.662581, 1.223137, 0.463262, 1, 0, 0, 1, 1,
1.673787, 0.3236009, 2.079261, 1, 0, 0, 1, 1,
1.694908, 0.2305264, 0.5092175, 0, 0, 0, 1, 1,
1.701374, 0.8870025, 1.851102, 0, 0, 0, 1, 1,
1.711969, -0.2430222, 1.305024, 0, 0, 0, 1, 1,
1.733318, 0.7462116, 2.465511, 0, 0, 0, 1, 1,
1.74015, 0.1014108, 2.841945, 0, 0, 0, 1, 1,
1.744416, 1.746517, 2.027649, 0, 0, 0, 1, 1,
1.746763, 0.5315504, 3.188805, 0, 0, 0, 1, 1,
1.749987, 0.2927605, 0.3840267, 1, 1, 1, 1, 1,
1.76002, -0.4563937, 2.360152, 1, 1, 1, 1, 1,
1.802341, 1.023036, 4.134472, 1, 1, 1, 1, 1,
1.803796, 2.74953, 0.1002206, 1, 1, 1, 1, 1,
1.841099, 1.862755, 0.02506009, 1, 1, 1, 1, 1,
1.852905, -0.7052535, 2.293042, 1, 1, 1, 1, 1,
1.868738, -1.228757, 0.7374855, 1, 1, 1, 1, 1,
1.910445, 0.2702017, 2.587675, 1, 1, 1, 1, 1,
1.925186, -0.5198846, 2.656167, 1, 1, 1, 1, 1,
1.92843, 1.637806, 3.904183, 1, 1, 1, 1, 1,
1.928897, 0.04594575, -0.2827092, 1, 1, 1, 1, 1,
1.933137, 0.5865333, 1.473425, 1, 1, 1, 1, 1,
1.970343, 0.4123367, 1.823501, 1, 1, 1, 1, 1,
1.976449, -1.133031, 1.286589, 1, 1, 1, 1, 1,
2.007307, -0.7752032, 3.633383, 1, 1, 1, 1, 1,
2.007433, 1.091909, 2.575789, 0, 0, 1, 1, 1,
2.0139, 0.4254595, 2.822382, 1, 0, 0, 1, 1,
2.024179, -0.09107908, -0.4271436, 1, 0, 0, 1, 1,
2.090579, 1.014776, 1.917175, 1, 0, 0, 1, 1,
2.098916, 0.1639834, 0.3060991, 1, 0, 0, 1, 1,
2.113816, 1.539246, 0.1036644, 1, 0, 0, 1, 1,
2.121374, -1.149889, 2.86662, 0, 0, 0, 1, 1,
2.181296, -1.456136, 2.904498, 0, 0, 0, 1, 1,
2.236537, 1.260399, -0.2009602, 0, 0, 0, 1, 1,
2.32725, -0.8484303, 3.757228, 0, 0, 0, 1, 1,
2.37142, 0.4069733, 0.6886343, 0, 0, 0, 1, 1,
2.465682, -0.1523482, 2.676124, 0, 0, 0, 1, 1,
2.476119, 1.153312, 0.3507001, 0, 0, 0, 1, 1,
2.523295, -0.1473351, 1.769839, 1, 1, 1, 1, 1,
2.537901, 0.9620516, 2.18942, 1, 1, 1, 1, 1,
2.571007, -1.747699, 1.924811, 1, 1, 1, 1, 1,
2.710932, -0.771252, 2.78024, 1, 1, 1, 1, 1,
2.81948, 0.2085482, 0.2761659, 1, 1, 1, 1, 1,
3.081915, 0.4749509, 1.066867, 1, 1, 1, 1, 1,
3.169569, 1.15654, 0.2186291, 1, 1, 1, 1, 1
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
var radius = 9.499197;
var distance = 33.36552;
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
mvMatrix.translate( 0.3308516, 0.2756035, -0.03868794 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36552);
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
