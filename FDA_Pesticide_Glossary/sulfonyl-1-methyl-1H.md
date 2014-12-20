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
-2.897173, -1.423442, -1.513116, 1, 0, 0, 1,
-2.801028, -1.381784, -1.498867, 1, 0.007843138, 0, 1,
-2.771244, 1.349127, 0.1061717, 1, 0.01176471, 0, 1,
-2.725323, 0.8041953, -2.397089, 1, 0.01960784, 0, 1,
-2.721907, 0.1479876, -0.8394549, 1, 0.02352941, 0, 1,
-2.612201, -0.3873985, -2.85186, 1, 0.03137255, 0, 1,
-2.605202, -0.8950497, -0.7021449, 1, 0.03529412, 0, 1,
-2.448307, -0.4860199, -1.607041, 1, 0.04313726, 0, 1,
-2.444938, 0.04122945, -0.9828549, 1, 0.04705882, 0, 1,
-2.423198, -0.5830539, -3.313915, 1, 0.05490196, 0, 1,
-2.386279, 0.4151355, -0.9255805, 1, 0.05882353, 0, 1,
-2.339279, 0.4479605, -1.211852, 1, 0.06666667, 0, 1,
-2.299136, 0.3352578, -1.993447, 1, 0.07058824, 0, 1,
-2.254767, 2.609248, -0.3446274, 1, 0.07843138, 0, 1,
-2.231585, -0.6498433, 0.1159819, 1, 0.08235294, 0, 1,
-2.226896, -0.5497814, -2.773227, 1, 0.09019608, 0, 1,
-2.204755, -0.2906728, -0.6369174, 1, 0.09411765, 0, 1,
-2.200469, 1.240756, 0.5459437, 1, 0.1019608, 0, 1,
-2.175731, -0.1447741, -1.764405, 1, 0.1098039, 0, 1,
-2.156073, -1.878477, -1.616908, 1, 0.1137255, 0, 1,
-2.109248, 0.3022947, -0.9836983, 1, 0.1215686, 0, 1,
-2.081855, 2.148833, -0.3555948, 1, 0.1254902, 0, 1,
-2.078783, -1.007799, -2.963986, 1, 0.1333333, 0, 1,
-2.069615, -0.04917026, -1.689968, 1, 0.1372549, 0, 1,
-2.056558, -0.5596774, -0.9439209, 1, 0.145098, 0, 1,
-2.048454, -0.8133199, -1.122286, 1, 0.1490196, 0, 1,
-2.045472, 0.3649932, -0.7099971, 1, 0.1568628, 0, 1,
-1.962907, -0.004240934, -1.350434, 1, 0.1607843, 0, 1,
-1.959526, -1.056415, -2.301332, 1, 0.1686275, 0, 1,
-1.898925, -0.8090932, -1.596822, 1, 0.172549, 0, 1,
-1.897658, 1.010136, 0.02682612, 1, 0.1803922, 0, 1,
-1.895214, -2.195321, -2.015517, 1, 0.1843137, 0, 1,
-1.892286, 0.5799341, -2.240089, 1, 0.1921569, 0, 1,
-1.874434, 0.06534785, -3.901458, 1, 0.1960784, 0, 1,
-1.853741, 0.7477576, -0.8270251, 1, 0.2039216, 0, 1,
-1.838601, -0.7288124, -3.091265, 1, 0.2117647, 0, 1,
-1.830224, -0.1286159, -3.243501, 1, 0.2156863, 0, 1,
-1.820748, -1.295126, -2.743765, 1, 0.2235294, 0, 1,
-1.808557, -0.7436028, -0.8980348, 1, 0.227451, 0, 1,
-1.79968, -0.6681154, -3.633968, 1, 0.2352941, 0, 1,
-1.795736, 1.456137, -0.4945558, 1, 0.2392157, 0, 1,
-1.792435, -0.3527464, 0.4289846, 1, 0.2470588, 0, 1,
-1.789783, -1.25406, -2.121308, 1, 0.2509804, 0, 1,
-1.771825, -0.4842, -3.007723, 1, 0.2588235, 0, 1,
-1.747885, -0.06576424, -2.660383, 1, 0.2627451, 0, 1,
-1.73348, 1.108073, -0.9598756, 1, 0.2705882, 0, 1,
-1.717673, 0.1995578, -1.924507, 1, 0.2745098, 0, 1,
-1.697556, -0.2933475, -1.620464, 1, 0.282353, 0, 1,
-1.696999, -1.442037, -3.778026, 1, 0.2862745, 0, 1,
-1.683983, 0.3021598, 1.89619, 1, 0.2941177, 0, 1,
-1.682033, -0.4446681, -2.756778, 1, 0.3019608, 0, 1,
-1.678643, 0.07514128, -1.084591, 1, 0.3058824, 0, 1,
-1.651434, -0.3371156, -0.2277825, 1, 0.3137255, 0, 1,
-1.6498, -0.309261, -1.214973, 1, 0.3176471, 0, 1,
-1.649423, 0.9945196, -2.796153, 1, 0.3254902, 0, 1,
-1.629482, 0.6795961, -1.236616, 1, 0.3294118, 0, 1,
-1.626404, 0.0878692, -1.681291, 1, 0.3372549, 0, 1,
-1.617671, 1.489397, 0.1317837, 1, 0.3411765, 0, 1,
-1.59446, 0.1203855, -0.8583962, 1, 0.3490196, 0, 1,
-1.592246, 0.2360199, -1.488968, 1, 0.3529412, 0, 1,
-1.591971, 2.152479, -0.3395906, 1, 0.3607843, 0, 1,
-1.590296, -1.986208, -1.184121, 1, 0.3647059, 0, 1,
-1.58985, 0.6096255, -1.055567, 1, 0.372549, 0, 1,
-1.585201, -0.5775862, -1.026283, 1, 0.3764706, 0, 1,
-1.576442, 0.09372988, -1.047525, 1, 0.3843137, 0, 1,
-1.570813, -2.495883, -3.819213, 1, 0.3882353, 0, 1,
-1.568694, 0.4686348, -1.965772, 1, 0.3960784, 0, 1,
-1.563884, 0.08314572, -0.4960985, 1, 0.4039216, 0, 1,
-1.563135, 0.07828803, -2.831467, 1, 0.4078431, 0, 1,
-1.520543, 0.3992983, -3.173738, 1, 0.4156863, 0, 1,
-1.51331, 0.9630083, -1.530729, 1, 0.4196078, 0, 1,
-1.505987, -1.992479, -3.030777, 1, 0.427451, 0, 1,
-1.497998, 0.2202635, -1.041193, 1, 0.4313726, 0, 1,
-1.490553, 0.07538617, 0.09939587, 1, 0.4392157, 0, 1,
-1.490281, 0.8891203, -1.085388, 1, 0.4431373, 0, 1,
-1.466939, -1.088485, -0.6520923, 1, 0.4509804, 0, 1,
-1.457339, -0.1569251, -1.495326, 1, 0.454902, 0, 1,
-1.449377, 0.4443726, -2.061252, 1, 0.4627451, 0, 1,
-1.424531, 0.7025199, -0.7090639, 1, 0.4666667, 0, 1,
-1.414433, -2.141196, -0.6675985, 1, 0.4745098, 0, 1,
-1.413484, -0.3408857, -2.328746, 1, 0.4784314, 0, 1,
-1.412803, 0.7348637, -0.8753129, 1, 0.4862745, 0, 1,
-1.410393, 1.72505, -1.772362, 1, 0.4901961, 0, 1,
-1.409193, -1.967839, -3.199291, 1, 0.4980392, 0, 1,
-1.406718, -0.9575719, -2.846652, 1, 0.5058824, 0, 1,
-1.405385, 1.258374, 0.4633518, 1, 0.509804, 0, 1,
-1.40109, 0.07222305, -1.987486, 1, 0.5176471, 0, 1,
-1.397669, 0.846121, -1.324227, 1, 0.5215687, 0, 1,
-1.38264, -1.13945, -2.749082, 1, 0.5294118, 0, 1,
-1.354266, -0.5169603, -1.660972, 1, 0.5333334, 0, 1,
-1.352651, -0.836531, -0.4669136, 1, 0.5411765, 0, 1,
-1.342958, -1.859627, -0.9558715, 1, 0.5450981, 0, 1,
-1.34284, 1.061678, -2.021657, 1, 0.5529412, 0, 1,
-1.342454, 1.391143, -2.510174, 1, 0.5568628, 0, 1,
-1.339665, -0.8140718, -2.361557, 1, 0.5647059, 0, 1,
-1.334528, -0.3828423, -0.6064392, 1, 0.5686275, 0, 1,
-1.328293, -0.04357823, 0.03576882, 1, 0.5764706, 0, 1,
-1.32815, 0.4513541, -1.371012, 1, 0.5803922, 0, 1,
-1.326059, 0.1466558, -2.979311, 1, 0.5882353, 0, 1,
-1.312111, -1.183136, -2.323478, 1, 0.5921569, 0, 1,
-1.30218, -0.8377274, -1.730939, 1, 0.6, 0, 1,
-1.295048, 0.278293, -1.271982, 1, 0.6078432, 0, 1,
-1.29463, 0.5787557, -2.755909, 1, 0.6117647, 0, 1,
-1.287768, 0.04585649, -0.7244592, 1, 0.6196079, 0, 1,
-1.286949, -0.2211429, -0.7830229, 1, 0.6235294, 0, 1,
-1.266342, -1.207544, -3.478556, 1, 0.6313726, 0, 1,
-1.263256, -1.153629, -3.172027, 1, 0.6352941, 0, 1,
-1.258921, 1.912506, -0.6430047, 1, 0.6431373, 0, 1,
-1.254659, 0.05464552, -2.853062, 1, 0.6470588, 0, 1,
-1.245726, -0.6043613, -1.554808, 1, 0.654902, 0, 1,
-1.238674, 0.1410433, -1.350485, 1, 0.6588235, 0, 1,
-1.238187, -2.203904, -3.262255, 1, 0.6666667, 0, 1,
-1.235672, -1.693529, -1.517088, 1, 0.6705883, 0, 1,
-1.233523, 0.6070198, -2.38109, 1, 0.6784314, 0, 1,
-1.231058, 0.153084, -1.829474, 1, 0.682353, 0, 1,
-1.221074, -0.5433865, -1.453579, 1, 0.6901961, 0, 1,
-1.218849, -2.362398, -3.107188, 1, 0.6941177, 0, 1,
-1.213183, 0.3505423, -1.708818, 1, 0.7019608, 0, 1,
-1.208088, 0.9878488, -0.8181121, 1, 0.7098039, 0, 1,
-1.20732, -0.215001, -2.424312, 1, 0.7137255, 0, 1,
-1.205106, -1.026375, -4.321786, 1, 0.7215686, 0, 1,
-1.202, 1.327148, -0.9561347, 1, 0.7254902, 0, 1,
-1.201686, -0.2544734, -0.03374582, 1, 0.7333333, 0, 1,
-1.19947, 0.8846976, -3.227994, 1, 0.7372549, 0, 1,
-1.195338, 0.5480182, -1.190695, 1, 0.7450981, 0, 1,
-1.192878, 0.9777765, -1.397869, 1, 0.7490196, 0, 1,
-1.190072, 1.224617, -1.186384, 1, 0.7568628, 0, 1,
-1.182748, 0.1367437, -1.561154, 1, 0.7607843, 0, 1,
-1.182482, 0.04733585, -1.760956, 1, 0.7686275, 0, 1,
-1.176873, 0.3931657, -0.7743619, 1, 0.772549, 0, 1,
-1.174884, -0.7705662, -2.791023, 1, 0.7803922, 0, 1,
-1.163924, -0.323614, -1.145441, 1, 0.7843137, 0, 1,
-1.159478, 0.9985436, -0.8223469, 1, 0.7921569, 0, 1,
-1.156012, -0.6663697, -1.738711, 1, 0.7960784, 0, 1,
-1.153458, 1.558339, -1.913536, 1, 0.8039216, 0, 1,
-1.148935, -0.2755243, -1.598794, 1, 0.8117647, 0, 1,
-1.140818, 1.188719, -2.039595, 1, 0.8156863, 0, 1,
-1.135487, -0.005959713, -1.575657, 1, 0.8235294, 0, 1,
-1.126338, 0.2417281, -1.256403, 1, 0.827451, 0, 1,
-1.122685, -0.7052117, -2.919179, 1, 0.8352941, 0, 1,
-1.117694, 0.5412195, -0.865665, 1, 0.8392157, 0, 1,
-1.112293, -1.093973, -1.655061, 1, 0.8470588, 0, 1,
-1.112268, -0.963204, -1.815782, 1, 0.8509804, 0, 1,
-1.102884, -0.4335948, -0.8665656, 1, 0.8588235, 0, 1,
-1.088049, 1.517871, -2.181716, 1, 0.8627451, 0, 1,
-1.087234, 0.2157547, -1.136395, 1, 0.8705882, 0, 1,
-1.083768, -0.6733934, -1.574771, 1, 0.8745098, 0, 1,
-1.083352, 1.915629, -0.1088405, 1, 0.8823529, 0, 1,
-1.075662, -0.6470912, -3.66365, 1, 0.8862745, 0, 1,
-1.070766, -1.59459, -2.531362, 1, 0.8941177, 0, 1,
-1.058977, 0.282281, -2.050876, 1, 0.8980392, 0, 1,
-1.058402, -1.240198, -1.998301, 1, 0.9058824, 0, 1,
-1.051489, 1.492892, -0.1754581, 1, 0.9137255, 0, 1,
-1.045353, 0.4857659, -1.895367, 1, 0.9176471, 0, 1,
-1.039647, -0.268249, -0.6480134, 1, 0.9254902, 0, 1,
-1.039445, 0.122187, -1.212095, 1, 0.9294118, 0, 1,
-1.038848, -1.445746, -3.991018, 1, 0.9372549, 0, 1,
-1.03438, -0.9372532, -2.206405, 1, 0.9411765, 0, 1,
-1.032111, -0.1517976, -0.3365308, 1, 0.9490196, 0, 1,
-1.028517, 0.4297896, -1.273501, 1, 0.9529412, 0, 1,
-1.022025, 0.8073387, 0.02848271, 1, 0.9607843, 0, 1,
-1.013359, -0.008298039, -0.5206473, 1, 0.9647059, 0, 1,
-1.01299, 0.2312261, -0.8426657, 1, 0.972549, 0, 1,
-1.006395, -0.01657579, -0.8903682, 1, 0.9764706, 0, 1,
-1.004868, 0.4885852, -0.6296509, 1, 0.9843137, 0, 1,
-1.003936, -1.084799, -3.75698, 1, 0.9882353, 0, 1,
-1.001285, -0.7650979, -0.3703812, 1, 0.9960784, 0, 1,
-1.00056, -0.3585949, -0.451087, 0.9960784, 1, 0, 1,
-0.9878967, -1.391537, -2.288586, 0.9921569, 1, 0, 1,
-0.9777046, 0.6630211, -1.39873, 0.9843137, 1, 0, 1,
-0.9756139, 1.965912, 0.2515565, 0.9803922, 1, 0, 1,
-0.9693981, 0.03361253, -2.826197, 0.972549, 1, 0, 1,
-0.9632708, 0.3488577, -2.094365, 0.9686275, 1, 0, 1,
-0.9616237, 1.3223, -2.318027, 0.9607843, 1, 0, 1,
-0.9480481, -1.982108, -2.747089, 0.9568627, 1, 0, 1,
-0.9439475, -0.2635959, -1.111211, 0.9490196, 1, 0, 1,
-0.9411409, 1.417872, -0.341816, 0.945098, 1, 0, 1,
-0.9371066, -1.252092, -1.882058, 0.9372549, 1, 0, 1,
-0.9368926, 1.493406, -0.4500207, 0.9333333, 1, 0, 1,
-0.9342161, -0.2357852, -0.8822373, 0.9254902, 1, 0, 1,
-0.9261076, -0.2351709, -0.4365181, 0.9215686, 1, 0, 1,
-0.9193482, -0.9514189, -2.380316, 0.9137255, 1, 0, 1,
-0.9186777, -1.103304, -3.094427, 0.9098039, 1, 0, 1,
-0.9180306, -0.3916373, -2.245932, 0.9019608, 1, 0, 1,
-0.912772, 0.4062752, -3.327719, 0.8941177, 1, 0, 1,
-0.9077601, -0.3797961, -2.269343, 0.8901961, 1, 0, 1,
-0.9056558, -0.717387, -2.927902, 0.8823529, 1, 0, 1,
-0.8999388, 0.4873969, -1.788797, 0.8784314, 1, 0, 1,
-0.8997328, -1.206317, -1.165667, 0.8705882, 1, 0, 1,
-0.8918714, -0.5254055, -1.566523, 0.8666667, 1, 0, 1,
-0.8892342, -0.279177, -2.752538, 0.8588235, 1, 0, 1,
-0.8883942, 2.245788, 0.3416629, 0.854902, 1, 0, 1,
-0.8874358, -0.5253428, -1.481016, 0.8470588, 1, 0, 1,
-0.8788759, -0.0937736, 0.1050868, 0.8431373, 1, 0, 1,
-0.8764411, -0.9001952, -1.848253, 0.8352941, 1, 0, 1,
-0.8755655, -1.025638, -0.149524, 0.8313726, 1, 0, 1,
-0.8752921, -0.4107796, -1.778089, 0.8235294, 1, 0, 1,
-0.8725727, -0.8815702, -2.579007, 0.8196079, 1, 0, 1,
-0.8641938, -1.819077, -2.812932, 0.8117647, 1, 0, 1,
-0.8618423, -1.685443, -2.654725, 0.8078431, 1, 0, 1,
-0.8617383, -0.5682271, -2.659191, 0.8, 1, 0, 1,
-0.8597041, 0.004746748, -1.188582, 0.7921569, 1, 0, 1,
-0.8594953, 0.8843344, -2.142913, 0.7882353, 1, 0, 1,
-0.8594218, 0.4275544, -2.29606, 0.7803922, 1, 0, 1,
-0.8551999, 1.131436, 0.5374841, 0.7764706, 1, 0, 1,
-0.8516008, -0.2706487, -0.03028883, 0.7686275, 1, 0, 1,
-0.8453385, -0.376653, -2.948424, 0.7647059, 1, 0, 1,
-0.8425347, 0.4648996, -0.6552041, 0.7568628, 1, 0, 1,
-0.8325164, 0.03018326, -1.423136, 0.7529412, 1, 0, 1,
-0.8159505, 0.3528149, -2.175634, 0.7450981, 1, 0, 1,
-0.8103604, -1.130141, -3.549653, 0.7411765, 1, 0, 1,
-0.8052031, -0.2602998, 0.543759, 0.7333333, 1, 0, 1,
-0.8049524, -1.084027, -3.253551, 0.7294118, 1, 0, 1,
-0.8034518, 2.735788, 0.6134276, 0.7215686, 1, 0, 1,
-0.7978991, -0.4809408, -2.860826, 0.7176471, 1, 0, 1,
-0.7927763, -0.9460779, -1.036727, 0.7098039, 1, 0, 1,
-0.7925831, 0.9527244, -3.051064, 0.7058824, 1, 0, 1,
-0.7912057, -1.696027, -1.827936, 0.6980392, 1, 0, 1,
-0.7843163, 0.3424151, -1.208441, 0.6901961, 1, 0, 1,
-0.7835069, 0.6217917, -2.323614, 0.6862745, 1, 0, 1,
-0.7768263, -0.6822177, -3.077802, 0.6784314, 1, 0, 1,
-0.7746106, -0.5843008, -1.494241, 0.6745098, 1, 0, 1,
-0.7735894, 0.6642128, -0.5300361, 0.6666667, 1, 0, 1,
-0.7650701, -0.3818911, -1.682574, 0.6627451, 1, 0, 1,
-0.7615699, 0.4263756, -0.5223795, 0.654902, 1, 0, 1,
-0.7528021, -0.7553732, -2.063933, 0.6509804, 1, 0, 1,
-0.7515785, -1.056974, -4.114807, 0.6431373, 1, 0, 1,
-0.7508034, 0.5709882, 0.07001141, 0.6392157, 1, 0, 1,
-0.7470639, 0.6604872, -0.7006989, 0.6313726, 1, 0, 1,
-0.7451594, -0.6814811, -3.518947, 0.627451, 1, 0, 1,
-0.7277232, -0.3814631, -0.3437949, 0.6196079, 1, 0, 1,
-0.7273367, -0.8708422, -2.145611, 0.6156863, 1, 0, 1,
-0.7264147, 0.3983534, -0.580022, 0.6078432, 1, 0, 1,
-0.7244127, -0.2733676, -3.657369, 0.6039216, 1, 0, 1,
-0.7208223, -0.7234609, -2.812602, 0.5960785, 1, 0, 1,
-0.7206392, 0.604956, -1.172552, 0.5882353, 1, 0, 1,
-0.7196136, 0.1662512, -1.715752, 0.5843138, 1, 0, 1,
-0.7194966, 0.8974206, -2.64455, 0.5764706, 1, 0, 1,
-0.7170744, -0.1638257, -1.038519, 0.572549, 1, 0, 1,
-0.715106, 0.3447305, -2.973171, 0.5647059, 1, 0, 1,
-0.7129828, -0.886596, -2.827464, 0.5607843, 1, 0, 1,
-0.7089975, 0.6892077, -0.09883704, 0.5529412, 1, 0, 1,
-0.694918, 0.4551813, -2.237549, 0.5490196, 1, 0, 1,
-0.6881339, -0.03688823, -2.597481, 0.5411765, 1, 0, 1,
-0.6815556, 1.016526, -2.401254, 0.5372549, 1, 0, 1,
-0.6798584, 0.9938988, 0.4154885, 0.5294118, 1, 0, 1,
-0.6782345, 0.2207241, 0.8174276, 0.5254902, 1, 0, 1,
-0.6737533, -0.427637, -2.997528, 0.5176471, 1, 0, 1,
-0.66716, -0.03806943, 0.364133, 0.5137255, 1, 0, 1,
-0.6620049, 0.2274294, -0.4304574, 0.5058824, 1, 0, 1,
-0.6583619, 0.3006687, 0.003497004, 0.5019608, 1, 0, 1,
-0.6562109, -0.8022552, -0.8487585, 0.4941176, 1, 0, 1,
-0.6516285, -1.080121, -2.54059, 0.4862745, 1, 0, 1,
-0.6505705, -0.4769296, -1.925605, 0.4823529, 1, 0, 1,
-0.6498956, 0.2519785, -1.267453, 0.4745098, 1, 0, 1,
-0.6491766, 1.190396, 0.7016052, 0.4705882, 1, 0, 1,
-0.64589, -0.5928689, -3.900724, 0.4627451, 1, 0, 1,
-0.6435674, -0.0692559, -3.09962, 0.4588235, 1, 0, 1,
-0.6401146, -1.969619, -3.876497, 0.4509804, 1, 0, 1,
-0.636646, -0.3863041, -2.314134, 0.4470588, 1, 0, 1,
-0.634137, -1.073512, -2.959594, 0.4392157, 1, 0, 1,
-0.630388, 0.4030624, -0.675465, 0.4352941, 1, 0, 1,
-0.6297869, -1.924419, -3.026648, 0.427451, 1, 0, 1,
-0.6260638, -0.2151759, -1.466617, 0.4235294, 1, 0, 1,
-0.623798, -2.369464, -3.743804, 0.4156863, 1, 0, 1,
-0.6200562, -0.8976606, -1.767676, 0.4117647, 1, 0, 1,
-0.6165372, -0.5188389, -3.10931, 0.4039216, 1, 0, 1,
-0.6161522, -0.7975656, -0.9576821, 0.3960784, 1, 0, 1,
-0.6126826, -1.081275, -1.115676, 0.3921569, 1, 0, 1,
-0.6109514, 1.45533, -0.3601791, 0.3843137, 1, 0, 1,
-0.605929, 0.6229645, -1.623567, 0.3803922, 1, 0, 1,
-0.6012705, 1.716593, -1.229281, 0.372549, 1, 0, 1,
-0.5902267, 1.174325, 0.5996193, 0.3686275, 1, 0, 1,
-0.5887387, -1.342395, -2.86371, 0.3607843, 1, 0, 1,
-0.5872107, 0.1170403, -1.039913, 0.3568628, 1, 0, 1,
-0.5838178, 1.641005, -1.612151, 0.3490196, 1, 0, 1,
-0.5802944, 0.3683471, -1.131766, 0.345098, 1, 0, 1,
-0.5793307, -0.6560232, -3.512353, 0.3372549, 1, 0, 1,
-0.5745802, 0.8571491, -0.5172759, 0.3333333, 1, 0, 1,
-0.5705484, 0.2151771, -1.445644, 0.3254902, 1, 0, 1,
-0.5688583, -0.1144125, -1.835788, 0.3215686, 1, 0, 1,
-0.5663543, 1.333307, 1.525617, 0.3137255, 1, 0, 1,
-0.5588437, 0.4668653, -0.06358481, 0.3098039, 1, 0, 1,
-0.5499251, -1.046789, -3.897616, 0.3019608, 1, 0, 1,
-0.542225, -1.232886, -2.752157, 0.2941177, 1, 0, 1,
-0.5419971, 2.308127, 1.141211, 0.2901961, 1, 0, 1,
-0.5382825, 0.4562009, 1.092665, 0.282353, 1, 0, 1,
-0.5374865, 0.3947973, -2.029343, 0.2784314, 1, 0, 1,
-0.5351841, 0.7845166, -0.3214324, 0.2705882, 1, 0, 1,
-0.5341712, -1.12286, -2.779096, 0.2666667, 1, 0, 1,
-0.532199, -1.234734, -2.233894, 0.2588235, 1, 0, 1,
-0.5313013, -0.3371345, -0.8018333, 0.254902, 1, 0, 1,
-0.5295077, -0.8919287, -3.269711, 0.2470588, 1, 0, 1,
-0.5294821, -0.08060505, -1.404279, 0.2431373, 1, 0, 1,
-0.5293992, 0.01771399, -1.622666, 0.2352941, 1, 0, 1,
-0.5275658, -1.681589, -2.600369, 0.2313726, 1, 0, 1,
-0.5242592, -0.8233693, -2.178335, 0.2235294, 1, 0, 1,
-0.5231666, 0.08997866, -1.112825, 0.2196078, 1, 0, 1,
-0.5218128, -0.5004815, -0.6869628, 0.2117647, 1, 0, 1,
-0.5211965, -0.001914578, -0.5781518, 0.2078431, 1, 0, 1,
-0.5206231, -1.068059, -3.933203, 0.2, 1, 0, 1,
-0.5055645, 1.004307, -2.37844, 0.1921569, 1, 0, 1,
-0.5052017, 1.750825, -1.18259, 0.1882353, 1, 0, 1,
-0.4968542, 0.3367801, -0.7596749, 0.1803922, 1, 0, 1,
-0.4944191, 0.4423715, -0.654985, 0.1764706, 1, 0, 1,
-0.4900663, 0.9470405, -2.347399, 0.1686275, 1, 0, 1,
-0.489747, -0.3942248, -2.278444, 0.1647059, 1, 0, 1,
-0.4849748, 1.783506, 0.1679573, 0.1568628, 1, 0, 1,
-0.4806627, 0.9294307, -1.746716, 0.1529412, 1, 0, 1,
-0.4758974, 1.297077, -1.069001, 0.145098, 1, 0, 1,
-0.4729415, 0.9649912, -0.1872948, 0.1411765, 1, 0, 1,
-0.4660075, 1.267868, -1.265965, 0.1333333, 1, 0, 1,
-0.4619555, -1.781292, -3.084862, 0.1294118, 1, 0, 1,
-0.454381, -1.105309, -3.109199, 0.1215686, 1, 0, 1,
-0.4543481, -0.7801324, -2.565855, 0.1176471, 1, 0, 1,
-0.4533512, 0.05612841, -1.4692, 0.1098039, 1, 0, 1,
-0.4513437, 0.7170389, -1.534544, 0.1058824, 1, 0, 1,
-0.4504432, -1.537635, -2.516749, 0.09803922, 1, 0, 1,
-0.4494567, -0.5346331, -3.070737, 0.09019608, 1, 0, 1,
-0.4481891, -1.450405, -4.14639, 0.08627451, 1, 0, 1,
-0.4477777, 0.1540248, -3.171839, 0.07843138, 1, 0, 1,
-0.4453084, -0.7353503, -2.838876, 0.07450981, 1, 0, 1,
-0.4423499, -0.09330001, -0.7578346, 0.06666667, 1, 0, 1,
-0.4271228, 1.145756, -2.439502, 0.0627451, 1, 0, 1,
-0.426517, -1.383644, -1.589939, 0.05490196, 1, 0, 1,
-0.4258036, -1.723034, -2.294855, 0.05098039, 1, 0, 1,
-0.4241364, 0.2448713, -2.368011, 0.04313726, 1, 0, 1,
-0.4237425, -1.876462, -4.287385, 0.03921569, 1, 0, 1,
-0.411355, -0.8665676, -2.525757, 0.03137255, 1, 0, 1,
-0.4090073, 0.1736709, -1.255784, 0.02745098, 1, 0, 1,
-0.4078461, -0.6793351, -0.609454, 0.01960784, 1, 0, 1,
-0.4055926, 1.12125, -1.191322, 0.01568628, 1, 0, 1,
-0.402821, 2.790723, 1.842789, 0.007843138, 1, 0, 1,
-0.3996668, 1.144293, -1.677788, 0.003921569, 1, 0, 1,
-0.3967918, -0.9732308, -1.577704, 0, 1, 0.003921569, 1,
-0.3953616, 0.01641371, -1.404242, 0, 1, 0.01176471, 1,
-0.3953334, -0.134552, -1.546234, 0, 1, 0.01568628, 1,
-0.394306, 1.351864, 0.04894194, 0, 1, 0.02352941, 1,
-0.3939005, 1.598329, -1.129691, 0, 1, 0.02745098, 1,
-0.3926274, -0.5584077, -1.076033, 0, 1, 0.03529412, 1,
-0.3898884, 0.8350466, -0.5807273, 0, 1, 0.03921569, 1,
-0.3892174, 1.012925, -0.8906459, 0, 1, 0.04705882, 1,
-0.3858421, 0.9466668, -1.235386, 0, 1, 0.05098039, 1,
-0.3831351, -0.3313349, -3.43231, 0, 1, 0.05882353, 1,
-0.3825387, -0.473351, -3.624719, 0, 1, 0.0627451, 1,
-0.3820092, -1.271004, -4.004241, 0, 1, 0.07058824, 1,
-0.3706173, 0.8549338, 0.03966996, 0, 1, 0.07450981, 1,
-0.3659528, -1.115955, -3.704205, 0, 1, 0.08235294, 1,
-0.3632367, -1.412986, -2.453743, 0, 1, 0.08627451, 1,
-0.3497668, -0.7273377, -2.638311, 0, 1, 0.09411765, 1,
-0.3449807, 1.507268, 0.01589078, 0, 1, 0.1019608, 1,
-0.3449188, -0.4872331, -2.257054, 0, 1, 0.1058824, 1,
-0.3411687, 1.552286, 0.9832237, 0, 1, 0.1137255, 1,
-0.340315, -1.682055, -1.819239, 0, 1, 0.1176471, 1,
-0.3360361, 0.501835, -0.3866931, 0, 1, 0.1254902, 1,
-0.3313651, 0.6177871, 0.4522923, 0, 1, 0.1294118, 1,
-0.3309317, 0.1516667, -1.035289, 0, 1, 0.1372549, 1,
-0.327782, 0.1339289, -2.853382, 0, 1, 0.1411765, 1,
-0.3255504, -2.128333, -3.211898, 0, 1, 0.1490196, 1,
-0.3245291, -1.428572, -3.981596, 0, 1, 0.1529412, 1,
-0.3225928, 0.8186979, -0.5349025, 0, 1, 0.1607843, 1,
-0.3192873, -0.7041042, -2.483358, 0, 1, 0.1647059, 1,
-0.317152, 1.297715, 1.995552, 0, 1, 0.172549, 1,
-0.3153342, -0.2252054, -2.207057, 0, 1, 0.1764706, 1,
-0.3098183, 0.4459202, -1.043648, 0, 1, 0.1843137, 1,
-0.3029201, -0.8725634, -4.689832, 0, 1, 0.1882353, 1,
-0.2978127, 0.5312036, -0.8742375, 0, 1, 0.1960784, 1,
-0.2963361, -1.387639, -2.997598, 0, 1, 0.2039216, 1,
-0.2935151, 1.53532, 2.15205, 0, 1, 0.2078431, 1,
-0.2930498, -0.6659937, -2.560782, 0, 1, 0.2156863, 1,
-0.2912923, 0.08530405, -0.4532659, 0, 1, 0.2196078, 1,
-0.2911166, 0.6664694, 0.0547169, 0, 1, 0.227451, 1,
-0.2910048, 0.6646679, -1.065823, 0, 1, 0.2313726, 1,
-0.2894951, 0.1970666, -1.113917, 0, 1, 0.2392157, 1,
-0.2893894, 0.124943, -1.947549, 0, 1, 0.2431373, 1,
-0.286354, 0.4665088, -0.4624745, 0, 1, 0.2509804, 1,
-0.2847372, 1.416021, -0.7060119, 0, 1, 0.254902, 1,
-0.2843075, -0.9636009, -4.023185, 0, 1, 0.2627451, 1,
-0.2802677, -0.4269164, -1.951477, 0, 1, 0.2666667, 1,
-0.2790711, -1.467834, -3.668439, 0, 1, 0.2745098, 1,
-0.2738901, 0.9567095, 1.771511, 0, 1, 0.2784314, 1,
-0.2735163, 0.8897308, -0.003787396, 0, 1, 0.2862745, 1,
-0.2727718, 0.05589349, 0.01773593, 0, 1, 0.2901961, 1,
-0.2713871, -0.4514316, -2.273728, 0, 1, 0.2980392, 1,
-0.2712413, -0.2411513, -2.349806, 0, 1, 0.3058824, 1,
-0.2688207, -2.130589, -3.185325, 0, 1, 0.3098039, 1,
-0.2651049, -0.9767615, -1.946232, 0, 1, 0.3176471, 1,
-0.2627045, 1.632508, 0.07464199, 0, 1, 0.3215686, 1,
-0.2625748, -0.4221453, -2.927962, 0, 1, 0.3294118, 1,
-0.2624534, 1.144503, 0.6070179, 0, 1, 0.3333333, 1,
-0.2610663, 1.101255, 1.369158, 0, 1, 0.3411765, 1,
-0.2562158, 0.6305354, -0.8286923, 0, 1, 0.345098, 1,
-0.2548292, -1.395834, -1.880028, 0, 1, 0.3529412, 1,
-0.2541796, -0.5621004, -3.046243, 0, 1, 0.3568628, 1,
-0.2537561, 0.2089856, -2.364277, 0, 1, 0.3647059, 1,
-0.251275, 0.1576462, -0.7145727, 0, 1, 0.3686275, 1,
-0.2510802, 1.666042, 0.138955, 0, 1, 0.3764706, 1,
-0.2506494, -0.5688316, -1.920895, 0, 1, 0.3803922, 1,
-0.2468382, -0.1452851, -0.4224299, 0, 1, 0.3882353, 1,
-0.2457699, 0.3405493, 0.02356639, 0, 1, 0.3921569, 1,
-0.2448712, 1.32594, -0.810477, 0, 1, 0.4, 1,
-0.2433549, -1.734696, -2.786394, 0, 1, 0.4078431, 1,
-0.2432109, 1.534005, 0.5907028, 0, 1, 0.4117647, 1,
-0.241926, 0.1539241, -0.8039168, 0, 1, 0.4196078, 1,
-0.2356616, -0.5442953, -2.499878, 0, 1, 0.4235294, 1,
-0.2355878, 0.4753433, 0.002796783, 0, 1, 0.4313726, 1,
-0.2355261, 1.130542, -0.1461722, 0, 1, 0.4352941, 1,
-0.2338428, 0.2720415, -1.124679, 0, 1, 0.4431373, 1,
-0.2287957, 0.1062602, -1.060375, 0, 1, 0.4470588, 1,
-0.2261918, -1.830745, -2.544046, 0, 1, 0.454902, 1,
-0.2207469, -0.7356273, -2.343281, 0, 1, 0.4588235, 1,
-0.2182774, -0.6538423, -1.655542, 0, 1, 0.4666667, 1,
-0.2175744, 0.3436891, 0.04397965, 0, 1, 0.4705882, 1,
-0.2150299, 2.322351, -0.4624418, 0, 1, 0.4784314, 1,
-0.210539, 0.2904159, -2.057108, 0, 1, 0.4823529, 1,
-0.2091611, -0.3173019, -3.438432, 0, 1, 0.4901961, 1,
-0.2068979, -0.3392352, -2.706285, 0, 1, 0.4941176, 1,
-0.2058864, 0.002862073, -1.752949, 0, 1, 0.5019608, 1,
-0.2049097, -1.151856, -3.670222, 0, 1, 0.509804, 1,
-0.203013, 0.3369194, -0.4132396, 0, 1, 0.5137255, 1,
-0.2028818, -1.01825, -3.14032, 0, 1, 0.5215687, 1,
-0.2021015, 0.07096107, -1.654115, 0, 1, 0.5254902, 1,
-0.2006597, -0.5332036, -4.02509, 0, 1, 0.5333334, 1,
-0.1997446, -0.2434636, -2.674127, 0, 1, 0.5372549, 1,
-0.1966422, 0.9823654, 0.1564762, 0, 1, 0.5450981, 1,
-0.1931276, 0.1215823, 0.8919013, 0, 1, 0.5490196, 1,
-0.191607, 0.9022574, -1.848995, 0, 1, 0.5568628, 1,
-0.1802335, 0.2793103, 0.3760297, 0, 1, 0.5607843, 1,
-0.1792684, -0.5495047, -1.334537, 0, 1, 0.5686275, 1,
-0.1788404, -0.4675105, -2.121399, 0, 1, 0.572549, 1,
-0.177933, -0.3284975, -3.682411, 0, 1, 0.5803922, 1,
-0.1752182, -0.5828853, -2.258789, 0, 1, 0.5843138, 1,
-0.1724354, 0.5516922, -0.5149752, 0, 1, 0.5921569, 1,
-0.1722046, 0.1438123, -1.477607, 0, 1, 0.5960785, 1,
-0.171176, 1.485069, -0.4087137, 0, 1, 0.6039216, 1,
-0.1674018, -0.1645194, -2.333003, 0, 1, 0.6117647, 1,
-0.1661903, -0.8898837, -4.089578, 0, 1, 0.6156863, 1,
-0.1660717, -0.7951022, -3.053037, 0, 1, 0.6235294, 1,
-0.164188, 0.1886256, -1.827265, 0, 1, 0.627451, 1,
-0.1632209, 1.489302, -1.112258, 0, 1, 0.6352941, 1,
-0.1616918, 1.147834, -0.5478278, 0, 1, 0.6392157, 1,
-0.1602566, -0.2948004, -2.421653, 0, 1, 0.6470588, 1,
-0.144603, 0.01312744, -1.707669, 0, 1, 0.6509804, 1,
-0.1419693, 1.978647, 0.4580202, 0, 1, 0.6588235, 1,
-0.1412991, -1.623784, -3.936328, 0, 1, 0.6627451, 1,
-0.1353333, -0.614085, -4.106153, 0, 1, 0.6705883, 1,
-0.1333688, 0.3387991, 0.1575798, 0, 1, 0.6745098, 1,
-0.1327248, -0.04459194, -2.120204, 0, 1, 0.682353, 1,
-0.1326618, -0.9907751, -3.847324, 0, 1, 0.6862745, 1,
-0.1297167, 0.3931971, 0.5580102, 0, 1, 0.6941177, 1,
-0.1262459, 0.3147802, 0.01114141, 0, 1, 0.7019608, 1,
-0.1247567, -0.04820322, -3.329633, 0, 1, 0.7058824, 1,
-0.1228975, 1.923875, -1.126223, 0, 1, 0.7137255, 1,
-0.1221788, -1.947311, -1.563064, 0, 1, 0.7176471, 1,
-0.1177285, -0.3540355, -4.218496, 0, 1, 0.7254902, 1,
-0.1153581, 0.2858534, -0.5928246, 0, 1, 0.7294118, 1,
-0.1123781, 0.3612414, -1.021429, 0, 1, 0.7372549, 1,
-0.09663793, 0.426478, -0.732512, 0, 1, 0.7411765, 1,
-0.09283873, 0.04102559, -1.7088, 0, 1, 0.7490196, 1,
-0.08838012, -1.778148, -3.787625, 0, 1, 0.7529412, 1,
-0.08796109, -0.3645009, -3.242801, 0, 1, 0.7607843, 1,
-0.08568326, -0.4000472, -4.382096, 0, 1, 0.7647059, 1,
-0.08420856, -2.182087, -4.545419, 0, 1, 0.772549, 1,
-0.08353731, -1.92385, -5.179682, 0, 1, 0.7764706, 1,
-0.08324163, -0.9699494, -3.069073, 0, 1, 0.7843137, 1,
-0.08202665, 0.1070489, -1.621747, 0, 1, 0.7882353, 1,
-0.08181162, 0.5941407, -0.5157202, 0, 1, 0.7960784, 1,
-0.08167928, 0.234514, 0.3882816, 0, 1, 0.8039216, 1,
-0.07474637, 1.280413, -1.187325, 0, 1, 0.8078431, 1,
-0.07468965, -1.465623, -3.020478, 0, 1, 0.8156863, 1,
-0.07195048, -0.1341227, -2.662263, 0, 1, 0.8196079, 1,
-0.06658675, 0.146421, -2.390662, 0, 1, 0.827451, 1,
-0.06602976, 1.463696, -0.3601755, 0, 1, 0.8313726, 1,
-0.06523108, 0.2084462, -0.7933415, 0, 1, 0.8392157, 1,
-0.0639793, 0.1931386, 0.3408608, 0, 1, 0.8431373, 1,
-0.06205852, 1.221418, 0.8086966, 0, 1, 0.8509804, 1,
-0.05920595, -1.734124, -2.712522, 0, 1, 0.854902, 1,
-0.05692925, 0.530548, -0.1464037, 0, 1, 0.8627451, 1,
-0.0558507, 0.5638936, -0.9293603, 0, 1, 0.8666667, 1,
-0.05462902, -0.7378811, -4.206507, 0, 1, 0.8745098, 1,
-0.05430646, -0.006868693, -1.623432, 0, 1, 0.8784314, 1,
-0.05105783, -1.186658, -2.29496, 0, 1, 0.8862745, 1,
-0.04679606, 1.85405, -0.06120891, 0, 1, 0.8901961, 1,
-0.04667755, -0.4298468, -5.412446, 0, 1, 0.8980392, 1,
-0.04061498, -1.269992, -3.17837, 0, 1, 0.9058824, 1,
-0.03384446, -0.2054186, -5.314254, 0, 1, 0.9098039, 1,
-0.03127156, -0.3026384, -3.465859, 0, 1, 0.9176471, 1,
-0.03122944, -1.688003, -2.142513, 0, 1, 0.9215686, 1,
-0.03058895, 1.444142, 0.1542438, 0, 1, 0.9294118, 1,
-0.03028355, -0.8912635, -4.627206, 0, 1, 0.9333333, 1,
-0.02829332, 1.299441, 0.05930385, 0, 1, 0.9411765, 1,
-0.02537131, 1.003915, 0.5593482, 0, 1, 0.945098, 1,
-0.02464317, 0.8488712, 0.7879941, 0, 1, 0.9529412, 1,
-0.02434552, -0.9575596, -3.173797, 0, 1, 0.9568627, 1,
-0.02308388, -0.6809516, -5.062081, 0, 1, 0.9647059, 1,
-0.01441945, 1.657931, -0.779263, 0, 1, 0.9686275, 1,
-0.01365913, 0.0005676802, -3.159558, 0, 1, 0.9764706, 1,
-0.01262232, 1.249448, -0.01292077, 0, 1, 0.9803922, 1,
-0.01203799, 0.7078235, 0.5747811, 0, 1, 0.9882353, 1,
-0.00746138, 0.2802264, -0.747755, 0, 1, 0.9921569, 1,
-0.00721587, -0.2308272, -1.269008, 0, 1, 1, 1,
-0.005926648, -1.453265, -2.970431, 0, 0.9921569, 1, 1,
0.003838385, 1.020955, 0.5881129, 0, 0.9882353, 1, 1,
0.007291992, 1.653771, 1.393552, 0, 0.9803922, 1, 1,
0.008443429, -1.235978, 2.524891, 0, 0.9764706, 1, 1,
0.01150859, 0.2480297, 0.4919738, 0, 0.9686275, 1, 1,
0.01492702, -0.03545091, 0.4844804, 0, 0.9647059, 1, 1,
0.02363875, -1.036672, 5.060855, 0, 0.9568627, 1, 1,
0.02381369, -0.6604304, 4.236613, 0, 0.9529412, 1, 1,
0.02415776, 0.9817995, 1.477951, 0, 0.945098, 1, 1,
0.02721624, -2.310766, 2.717091, 0, 0.9411765, 1, 1,
0.03418335, 0.3134514, -0.8468705, 0, 0.9333333, 1, 1,
0.04994482, 0.4598602, 0.9279101, 0, 0.9294118, 1, 1,
0.05148734, -0.05915675, 4.116515, 0, 0.9215686, 1, 1,
0.0532491, -0.7612866, 3.538454, 0, 0.9176471, 1, 1,
0.05454552, -0.9531224, 4.68259, 0, 0.9098039, 1, 1,
0.05523219, -0.7075659, 4.549336, 0, 0.9058824, 1, 1,
0.05941219, 0.02824378, 2.644696, 0, 0.8980392, 1, 1,
0.06665143, -0.8048925, 3.646136, 0, 0.8901961, 1, 1,
0.06978732, -0.4112182, 2.560923, 0, 0.8862745, 1, 1,
0.07173326, 0.4181485, -0.8155662, 0, 0.8784314, 1, 1,
0.07644125, 1.156985, 1.795882, 0, 0.8745098, 1, 1,
0.07839949, 0.1970473, -0.3831676, 0, 0.8666667, 1, 1,
0.07928425, -0.1216678, 1.107456, 0, 0.8627451, 1, 1,
0.07980047, -0.7099816, 2.815325, 0, 0.854902, 1, 1,
0.08190583, 1.429787, 0.5866589, 0, 0.8509804, 1, 1,
0.08258458, -0.5730275, 3.405921, 0, 0.8431373, 1, 1,
0.08668843, -0.7954978, 1.870258, 0, 0.8392157, 1, 1,
0.0920223, 1.78629, -1.266, 0, 0.8313726, 1, 1,
0.09261712, 1.754618, -0.3229172, 0, 0.827451, 1, 1,
0.09512369, 0.05295176, 1.940466, 0, 0.8196079, 1, 1,
0.09537725, 0.985862, -1.656978, 0, 0.8156863, 1, 1,
0.09940413, 0.3918724, 0.6983415, 0, 0.8078431, 1, 1,
0.1045776, -0.3039356, 2.232008, 0, 0.8039216, 1, 1,
0.1136119, -0.5534656, 2.094881, 0, 0.7960784, 1, 1,
0.115923, 0.3019556, -0.2027141, 0, 0.7882353, 1, 1,
0.1164301, 0.5061564, 0.7379239, 0, 0.7843137, 1, 1,
0.1164594, 1.539764, -0.886389, 0, 0.7764706, 1, 1,
0.1221543, 1.052781, -0.3929834, 0, 0.772549, 1, 1,
0.122336, 1.217409, 0.3559255, 0, 0.7647059, 1, 1,
0.1261651, -1.561353, 2.56334, 0, 0.7607843, 1, 1,
0.130244, 0.5895151, 0.3421338, 0, 0.7529412, 1, 1,
0.1308601, 1.171184, -1.534167, 0, 0.7490196, 1, 1,
0.134212, -1.464589, 1.93306, 0, 0.7411765, 1, 1,
0.1357444, 0.283127, 0.8687986, 0, 0.7372549, 1, 1,
0.1437596, 1.742034, 1.754568, 0, 0.7294118, 1, 1,
0.1445221, -0.219546, 2.64322, 0, 0.7254902, 1, 1,
0.1455943, -0.9834862, 2.553975, 0, 0.7176471, 1, 1,
0.1465303, 0.3697714, 0.5311676, 0, 0.7137255, 1, 1,
0.1500974, -1.559591, 2.70153, 0, 0.7058824, 1, 1,
0.1504399, 1.083833, -1.316696, 0, 0.6980392, 1, 1,
0.1552542, -0.378571, 3.612787, 0, 0.6941177, 1, 1,
0.161207, 1.483695, 0.9299255, 0, 0.6862745, 1, 1,
0.1643941, -0.3873321, 3.009088, 0, 0.682353, 1, 1,
0.1681079, 0.4147232, 0.8680338, 0, 0.6745098, 1, 1,
0.1714843, 0.5415326, -1.251579, 0, 0.6705883, 1, 1,
0.1719363, -0.07122672, 1.634543, 0, 0.6627451, 1, 1,
0.1722616, -1.30879, 2.853003, 0, 0.6588235, 1, 1,
0.1740043, -0.1170689, 1.784219, 0, 0.6509804, 1, 1,
0.1768872, 1.348909, 0.04502064, 0, 0.6470588, 1, 1,
0.1808192, 0.8786336, 0.9447227, 0, 0.6392157, 1, 1,
0.1817871, -1.842186, 0.6512114, 0, 0.6352941, 1, 1,
0.1875996, -0.03340517, 0.6594961, 0, 0.627451, 1, 1,
0.1900649, -0.1377394, 3.038891, 0, 0.6235294, 1, 1,
0.1965944, 0.4354878, 1.266994, 0, 0.6156863, 1, 1,
0.1971332, -0.1562299, 2.648867, 0, 0.6117647, 1, 1,
0.1972721, -0.4551091, 3.891009, 0, 0.6039216, 1, 1,
0.1986838, 1.035397, -0.4008225, 0, 0.5960785, 1, 1,
0.1989938, 0.2271547, 0.9084615, 0, 0.5921569, 1, 1,
0.2053565, -0.4917391, 3.116277, 0, 0.5843138, 1, 1,
0.2055701, 0.3139006, 2.335892, 0, 0.5803922, 1, 1,
0.2060814, -0.9571288, 2.570765, 0, 0.572549, 1, 1,
0.2084455, -1.955235, 1.008007, 0, 0.5686275, 1, 1,
0.2085941, -0.9566754, 1.619304, 0, 0.5607843, 1, 1,
0.2118305, -1.172251, 3.38061, 0, 0.5568628, 1, 1,
0.212878, -0.8875645, 1.24986, 0, 0.5490196, 1, 1,
0.2163154, -0.47922, 4.083541, 0, 0.5450981, 1, 1,
0.2297892, 1.325133, 0.3589468, 0, 0.5372549, 1, 1,
0.2312292, 1.08001, -0.6564571, 0, 0.5333334, 1, 1,
0.2333003, -0.4403548, 2.892858, 0, 0.5254902, 1, 1,
0.2335103, 0.1058046, 1.756406, 0, 0.5215687, 1, 1,
0.23704, 0.1219295, 0.4956312, 0, 0.5137255, 1, 1,
0.2424205, 0.4831351, 0.3347724, 0, 0.509804, 1, 1,
0.2432636, 0.4382991, 0.3128259, 0, 0.5019608, 1, 1,
0.2528528, 0.8166848, 0.5035687, 0, 0.4941176, 1, 1,
0.2531905, 0.5622461, -0.2534058, 0, 0.4901961, 1, 1,
0.2535147, -0.7765117, 2.962355, 0, 0.4823529, 1, 1,
0.2554662, 1.977651, 1.342051, 0, 0.4784314, 1, 1,
0.2572106, -0.7857032, 3.501154, 0, 0.4705882, 1, 1,
0.2588212, 0.7633688, -0.255621, 0, 0.4666667, 1, 1,
0.2635667, 1.572039, 0.1082782, 0, 0.4588235, 1, 1,
0.2643012, 0.725852, 1.738201, 0, 0.454902, 1, 1,
0.2662745, 1.163655, -0.4781054, 0, 0.4470588, 1, 1,
0.2698296, 0.7083606, -0.6860225, 0, 0.4431373, 1, 1,
0.2762508, 1.172962, 0.2262159, 0, 0.4352941, 1, 1,
0.2772826, -0.4232302, 3.476337, 0, 0.4313726, 1, 1,
0.2783063, -0.9738039, 2.540434, 0, 0.4235294, 1, 1,
0.2786588, -1.253144, 2.564956, 0, 0.4196078, 1, 1,
0.2787581, -0.5852824, 0.5435415, 0, 0.4117647, 1, 1,
0.2869495, 1.660885, 0.2005977, 0, 0.4078431, 1, 1,
0.2910409, 1.387452, 0.463847, 0, 0.4, 1, 1,
0.2942236, 1.171783, 1.416367, 0, 0.3921569, 1, 1,
0.29524, 1.100553, 1.046644, 0, 0.3882353, 1, 1,
0.2962229, -0.01859594, 2.843298, 0, 0.3803922, 1, 1,
0.2998843, 0.08044555, 1.254412, 0, 0.3764706, 1, 1,
0.3013783, 1.212726, -2.3249, 0, 0.3686275, 1, 1,
0.3034651, -0.1329211, 2.648156, 0, 0.3647059, 1, 1,
0.3035936, -0.630879, 3.03141, 0, 0.3568628, 1, 1,
0.3041171, 2.559052, 1.225086, 0, 0.3529412, 1, 1,
0.3100157, 1.057477, 1.239585, 0, 0.345098, 1, 1,
0.3119792, -1.143812, 2.619798, 0, 0.3411765, 1, 1,
0.3140935, 0.9591214, 0.9308897, 0, 0.3333333, 1, 1,
0.3157787, -0.58056, 3.849921, 0, 0.3294118, 1, 1,
0.3180832, 0.3472755, -1.956886, 0, 0.3215686, 1, 1,
0.3210336, -0.2040836, 2.434205, 0, 0.3176471, 1, 1,
0.3238352, 0.1856356, 2.068352, 0, 0.3098039, 1, 1,
0.3284425, -0.7328712, 2.613502, 0, 0.3058824, 1, 1,
0.3294555, 0.2056622, 0.2214244, 0, 0.2980392, 1, 1,
0.3314151, 0.1292439, 1.514595, 0, 0.2901961, 1, 1,
0.331465, -0.6662275, 1.720155, 0, 0.2862745, 1, 1,
0.3319581, -1.389912, 1.62629, 0, 0.2784314, 1, 1,
0.3322603, -0.05459934, 2.075654, 0, 0.2745098, 1, 1,
0.3326997, 0.7034656, -0.05147459, 0, 0.2666667, 1, 1,
0.3327489, 1.581667, -0.2003331, 0, 0.2627451, 1, 1,
0.3330807, -1.369433, 1.574225, 0, 0.254902, 1, 1,
0.3338091, -0.543619, 0.7722372, 0, 0.2509804, 1, 1,
0.335142, 0.7415536, -0.2646407, 0, 0.2431373, 1, 1,
0.3392482, 1.451406, -1.156821, 0, 0.2392157, 1, 1,
0.3396008, 0.6572767, 0.4239981, 0, 0.2313726, 1, 1,
0.3420467, -0.3288213, 1.081541, 0, 0.227451, 1, 1,
0.3579898, 1.531266, -1.188934, 0, 0.2196078, 1, 1,
0.3589115, -0.5175086, 2.773499, 0, 0.2156863, 1, 1,
0.3597423, 1.308419, 0.08422157, 0, 0.2078431, 1, 1,
0.3614438, -0.6238449, 3.299646, 0, 0.2039216, 1, 1,
0.3617361, 1.21871, -0.9433502, 0, 0.1960784, 1, 1,
0.3629345, -1.473873, 2.816274, 0, 0.1882353, 1, 1,
0.3670677, -0.0006294075, 2.945038, 0, 0.1843137, 1, 1,
0.375175, -0.3872402, 2.654368, 0, 0.1764706, 1, 1,
0.3766232, -1.299845, 1.628983, 0, 0.172549, 1, 1,
0.3784853, 1.148453, 0.1292827, 0, 0.1647059, 1, 1,
0.3790622, -0.3931156, 1.800608, 0, 0.1607843, 1, 1,
0.3808469, 0.3582256, 1.726151, 0, 0.1529412, 1, 1,
0.3856448, 0.9586307, 1.289587, 0, 0.1490196, 1, 1,
0.3939233, -0.4160846, 2.960831, 0, 0.1411765, 1, 1,
0.3955964, -2.27083, 1.868808, 0, 0.1372549, 1, 1,
0.4009235, -0.1728147, 2.088455, 0, 0.1294118, 1, 1,
0.4028855, 1.784755, 0.2788921, 0, 0.1254902, 1, 1,
0.4032666, 1.203681, -0.2139822, 0, 0.1176471, 1, 1,
0.4037776, 0.2710782, -0.2465035, 0, 0.1137255, 1, 1,
0.4051151, 1.867803, 0.9994963, 0, 0.1058824, 1, 1,
0.4074159, -1.141213, 1.848176, 0, 0.09803922, 1, 1,
0.4089957, 0.1992942, 0.2335707, 0, 0.09411765, 1, 1,
0.4117071, -0.6741491, 0.9737352, 0, 0.08627451, 1, 1,
0.4122439, -0.9006125, 2.608873, 0, 0.08235294, 1, 1,
0.4134758, 0.3452006, 0.6609603, 0, 0.07450981, 1, 1,
0.4145962, -0.5343722, 3.724087, 0, 0.07058824, 1, 1,
0.4147791, 0.1959029, 3.085417, 0, 0.0627451, 1, 1,
0.415358, 0.98558, 1.718796, 0, 0.05882353, 1, 1,
0.4163896, 0.2843699, 1.033173, 0, 0.05098039, 1, 1,
0.4181657, 0.3502051, 2.292721, 0, 0.04705882, 1, 1,
0.4185772, -0.3766033, 3.036847, 0, 0.03921569, 1, 1,
0.4188174, 0.8594237, 0.08138248, 0, 0.03529412, 1, 1,
0.4195205, 1.237153, 2.830406, 0, 0.02745098, 1, 1,
0.4228171, 0.1101652, 1.751414, 0, 0.02352941, 1, 1,
0.4284648, -0.08004108, 1.542729, 0, 0.01568628, 1, 1,
0.4286849, 0.01637491, 1.384839, 0, 0.01176471, 1, 1,
0.4306158, -0.2007266, 2.429337, 0, 0.003921569, 1, 1,
0.4314118, 0.2701634, 1.593208, 0.003921569, 0, 1, 1,
0.4327621, 0.9232158, -0.3080035, 0.007843138, 0, 1, 1,
0.4341009, -0.4532379, 0.7718435, 0.01568628, 0, 1, 1,
0.4355896, 0.7690451, -0.0810262, 0.01960784, 0, 1, 1,
0.4403817, -0.4773838, 2.846872, 0.02745098, 0, 1, 1,
0.4408727, -0.7264106, 3.513238, 0.03137255, 0, 1, 1,
0.4429801, 0.4211961, 1.233097, 0.03921569, 0, 1, 1,
0.4445192, -2.160345, 2.870773, 0.04313726, 0, 1, 1,
0.4466286, -1.407082, 3.380244, 0.05098039, 0, 1, 1,
0.4518161, 0.5967998, 0.1857959, 0.05490196, 0, 1, 1,
0.456346, 0.3584175, 0.9558688, 0.0627451, 0, 1, 1,
0.4603261, 1.692867, 0.05394133, 0.06666667, 0, 1, 1,
0.4638233, 0.1955447, 1.493554, 0.07450981, 0, 1, 1,
0.4710855, -0.7119429, 2.257185, 0.07843138, 0, 1, 1,
0.4759254, 0.3116752, 0.9767681, 0.08627451, 0, 1, 1,
0.4782321, -0.9034762, 2.462484, 0.09019608, 0, 1, 1,
0.4897892, 0.9922284, 0.8598537, 0.09803922, 0, 1, 1,
0.4902009, 0.4497831, 1.840924, 0.1058824, 0, 1, 1,
0.4962541, 0.07124057, 2.278057, 0.1098039, 0, 1, 1,
0.4968656, -0.1045676, 2.981938, 0.1176471, 0, 1, 1,
0.5002799, 0.7441562, 1.724758, 0.1215686, 0, 1, 1,
0.5007986, 0.6998664, 0.1220641, 0.1294118, 0, 1, 1,
0.5031976, -0.003040976, -0.2686672, 0.1333333, 0, 1, 1,
0.5037234, -0.9798607, 2.861884, 0.1411765, 0, 1, 1,
0.5068134, -0.3621719, 3.895482, 0.145098, 0, 1, 1,
0.5102775, -0.01497497, 1.035484, 0.1529412, 0, 1, 1,
0.5103127, 0.3322186, 1.057799, 0.1568628, 0, 1, 1,
0.5110624, 0.8139264, 1.19531, 0.1647059, 0, 1, 1,
0.5129685, 0.3496906, 0.6673185, 0.1686275, 0, 1, 1,
0.5161557, 0.164842, 1.56669, 0.1764706, 0, 1, 1,
0.5176615, -0.5956196, 2.463251, 0.1803922, 0, 1, 1,
0.5230014, -1.245683, 4.796887, 0.1882353, 0, 1, 1,
0.5261952, -0.8878113, 2.087847, 0.1921569, 0, 1, 1,
0.5282836, 0.213332, 1.932436, 0.2, 0, 1, 1,
0.5285998, 0.1893892, 0.7983443, 0.2078431, 0, 1, 1,
0.5353713, -0.5913674, 1.571211, 0.2117647, 0, 1, 1,
0.5355847, 0.2725458, 3.076559, 0.2196078, 0, 1, 1,
0.5380881, -1.971388, 1.268126, 0.2235294, 0, 1, 1,
0.5412501, -0.1728303, 2.159589, 0.2313726, 0, 1, 1,
0.5426981, 0.1051525, 0.628967, 0.2352941, 0, 1, 1,
0.5433152, 0.810848, 1.855521, 0.2431373, 0, 1, 1,
0.5443878, 1.220323, 0.237169, 0.2470588, 0, 1, 1,
0.5481739, 2.447062, 0.4696785, 0.254902, 0, 1, 1,
0.5524788, 0.4651485, 1.068147, 0.2588235, 0, 1, 1,
0.557341, 0.2994625, 0.3109145, 0.2666667, 0, 1, 1,
0.5630934, 0.1857061, 0.934824, 0.2705882, 0, 1, 1,
0.5634866, 0.234507, 1.09543, 0.2784314, 0, 1, 1,
0.5654794, -2.878126, 2.22806, 0.282353, 0, 1, 1,
0.5692251, 0.2926659, -0.208082, 0.2901961, 0, 1, 1,
0.5699911, 1.226625, 1.992173, 0.2941177, 0, 1, 1,
0.5714771, -0.06024581, 1.191259, 0.3019608, 0, 1, 1,
0.5736009, -0.7669275, 2.030992, 0.3098039, 0, 1, 1,
0.5745513, 0.3048858, 0.9828362, 0.3137255, 0, 1, 1,
0.5817164, 1.532227, -0.1732942, 0.3215686, 0, 1, 1,
0.5907018, 0.1774709, 1.450536, 0.3254902, 0, 1, 1,
0.5948746, -2.801648, 4.286251, 0.3333333, 0, 1, 1,
0.5974225, -1.06239, 1.95191, 0.3372549, 0, 1, 1,
0.5993428, 1.835949, 0.5466193, 0.345098, 0, 1, 1,
0.6065506, -0.8537513, 2.477982, 0.3490196, 0, 1, 1,
0.6109666, -0.1345467, 1.57837, 0.3568628, 0, 1, 1,
0.618626, -1.810277, 1.212384, 0.3607843, 0, 1, 1,
0.6198489, 2.033783, -0.7260548, 0.3686275, 0, 1, 1,
0.6198809, -0.2220862, 0.8457148, 0.372549, 0, 1, 1,
0.6244674, 0.4107603, 0.09070452, 0.3803922, 0, 1, 1,
0.6259738, 0.6434589, 0.1570384, 0.3843137, 0, 1, 1,
0.6374985, -0.05195349, 2.055362, 0.3921569, 0, 1, 1,
0.6495709, 0.1006439, 1.262436, 0.3960784, 0, 1, 1,
0.6524219, -1.212482, 3.298831, 0.4039216, 0, 1, 1,
0.6527703, 0.4433958, 1.133959, 0.4117647, 0, 1, 1,
0.6545907, 0.922597, 1.701641, 0.4156863, 0, 1, 1,
0.6549182, 0.5292147, 1.136774, 0.4235294, 0, 1, 1,
0.6580443, -1.286945, 1.065903, 0.427451, 0, 1, 1,
0.6597637, 0.1016186, 0.5351406, 0.4352941, 0, 1, 1,
0.668149, -0.02665933, 3.14364, 0.4392157, 0, 1, 1,
0.6734796, 0.8445996, 0.3907724, 0.4470588, 0, 1, 1,
0.6779609, 0.9637839, 0.9742171, 0.4509804, 0, 1, 1,
0.6811207, 0.2959092, 0.919949, 0.4588235, 0, 1, 1,
0.6811788, -0.7948024, 0.8631207, 0.4627451, 0, 1, 1,
0.6824172, 1.036586, 1.377299, 0.4705882, 0, 1, 1,
0.6862745, 1.976426, -1.759485, 0.4745098, 0, 1, 1,
0.6933264, -0.8680022, 2.218157, 0.4823529, 0, 1, 1,
0.6990426, -2.210253, 3.663282, 0.4862745, 0, 1, 1,
0.7020184, -2.186386, 3.503511, 0.4941176, 0, 1, 1,
0.7140058, -1.477839, 3.418035, 0.5019608, 0, 1, 1,
0.7204667, -1.311968, 3.304426, 0.5058824, 0, 1, 1,
0.7256691, 0.6883781, 1.089912, 0.5137255, 0, 1, 1,
0.7267359, 1.817811, -0.6626762, 0.5176471, 0, 1, 1,
0.7300349, 1.297674, 1.442862, 0.5254902, 0, 1, 1,
0.7305104, -0.5003489, 3.886595, 0.5294118, 0, 1, 1,
0.7400838, -0.8605512, 2.902232, 0.5372549, 0, 1, 1,
0.7415741, 0.4187968, 1.977921, 0.5411765, 0, 1, 1,
0.7427217, -0.1340457, 2.55773, 0.5490196, 0, 1, 1,
0.7458069, 0.3543785, 1.242485, 0.5529412, 0, 1, 1,
0.7513069, -2.993389, 2.738554, 0.5607843, 0, 1, 1,
0.7574221, -0.6179652, 4.054232, 0.5647059, 0, 1, 1,
0.7641949, -0.4748679, 2.571158, 0.572549, 0, 1, 1,
0.7652737, -0.2248565, 1.98231, 0.5764706, 0, 1, 1,
0.7684251, 1.039317, 0.5907052, 0.5843138, 0, 1, 1,
0.7700193, 0.1966789, 1.231896, 0.5882353, 0, 1, 1,
0.7704319, -2.073695, 4.151645, 0.5960785, 0, 1, 1,
0.7706941, -0.5579738, 3.402665, 0.6039216, 0, 1, 1,
0.7725412, 0.6059405, 0.3988145, 0.6078432, 0, 1, 1,
0.7729073, -0.45387, 3.224099, 0.6156863, 0, 1, 1,
0.7864512, -0.1331729, 3.461092, 0.6196079, 0, 1, 1,
0.7887888, -0.5187436, 2.123862, 0.627451, 0, 1, 1,
0.7921897, -0.5103543, 3.288073, 0.6313726, 0, 1, 1,
0.8036298, -0.158457, -0.6895177, 0.6392157, 0, 1, 1,
0.8175759, 1.574131, 1.340156, 0.6431373, 0, 1, 1,
0.8268752, 1.271775, -1.114664, 0.6509804, 0, 1, 1,
0.8281414, -0.4643017, 2.435533, 0.654902, 0, 1, 1,
0.8367042, -1.83981, 2.744133, 0.6627451, 0, 1, 1,
0.8427358, -0.2208927, 2.639284, 0.6666667, 0, 1, 1,
0.8501435, -1.904876, 1.588983, 0.6745098, 0, 1, 1,
0.8524833, -0.2672433, 0.8121582, 0.6784314, 0, 1, 1,
0.8534513, 0.6495655, 1.684406, 0.6862745, 0, 1, 1,
0.8599764, 1.205201, 0.7284478, 0.6901961, 0, 1, 1,
0.8625305, 0.172734, 0.5223226, 0.6980392, 0, 1, 1,
0.870034, 0.08186256, 0.608177, 0.7058824, 0, 1, 1,
0.8755763, 0.1406, 1.546953, 0.7098039, 0, 1, 1,
0.876835, 1.230628, 0.6648818, 0.7176471, 0, 1, 1,
0.8783677, -1.652895, 2.718203, 0.7215686, 0, 1, 1,
0.879222, -0.2987534, 2.728531, 0.7294118, 0, 1, 1,
0.8797228, 0.8679404, 1.588799, 0.7333333, 0, 1, 1,
0.8805962, -0.1351248, 0.9498802, 0.7411765, 0, 1, 1,
0.881107, -1.140137, 2.738925, 0.7450981, 0, 1, 1,
0.8822243, 0.9999969, -0.2820803, 0.7529412, 0, 1, 1,
0.8884865, -0.3384724, 2.773724, 0.7568628, 0, 1, 1,
0.8916729, 0.7039021, 0.484594, 0.7647059, 0, 1, 1,
0.8931463, 0.9612567, 1.566969, 0.7686275, 0, 1, 1,
0.8934373, 1.40159, 1.222788, 0.7764706, 0, 1, 1,
0.8944015, 1.445766, 1.483101, 0.7803922, 0, 1, 1,
0.8962727, 1.783891, 0.8382025, 0.7882353, 0, 1, 1,
0.896902, 1.241355, -1.661368, 0.7921569, 0, 1, 1,
0.9059811, -0.7911441, 0.7798263, 0.8, 0, 1, 1,
0.9108098, -1.152076, 0.3994802, 0.8078431, 0, 1, 1,
0.9218703, 1.790706, -0.6999389, 0.8117647, 0, 1, 1,
0.9281927, 0.9261016, 0.7096213, 0.8196079, 0, 1, 1,
0.9293458, 0.8815594, 0.7347829, 0.8235294, 0, 1, 1,
0.9346235, 1.639058, 0.1384451, 0.8313726, 0, 1, 1,
0.9408271, 1.363594, 0.1634649, 0.8352941, 0, 1, 1,
0.9451707, 0.4218814, 0.8619741, 0.8431373, 0, 1, 1,
0.9451947, -0.691008, 1.066705, 0.8470588, 0, 1, 1,
0.9466778, 0.005787912, 1.503332, 0.854902, 0, 1, 1,
0.9497159, 1.29952, 0.8304498, 0.8588235, 0, 1, 1,
0.9521683, -1.874509, 2.095152, 0.8666667, 0, 1, 1,
0.9564492, 0.506067, 1.146128, 0.8705882, 0, 1, 1,
0.9607689, -2.138396, 2.531589, 0.8784314, 0, 1, 1,
0.9631615, 0.1734271, 0.2576894, 0.8823529, 0, 1, 1,
0.9650773, 0.01473723, 3.072868, 0.8901961, 0, 1, 1,
0.9665263, 1.665652, -0.5691619, 0.8941177, 0, 1, 1,
0.9678888, -0.5485075, 2.872967, 0.9019608, 0, 1, 1,
0.9683338, -1.068061, 0.7675821, 0.9098039, 0, 1, 1,
0.9703437, -1.640149, 3.592132, 0.9137255, 0, 1, 1,
0.9779683, -0.1533614, 3.053121, 0.9215686, 0, 1, 1,
0.9814888, -0.1073263, 0.9284173, 0.9254902, 0, 1, 1,
0.9857859, 1.818665, 1.231248, 0.9333333, 0, 1, 1,
0.9870889, -0.672121, 3.967737, 0.9372549, 0, 1, 1,
0.9886733, 2.227554, -0.7465787, 0.945098, 0, 1, 1,
0.9889441, 2.035415, -0.318218, 0.9490196, 0, 1, 1,
0.9929115, -1.895177, 2.000343, 0.9568627, 0, 1, 1,
1.004171, 1.273174, 0.9961725, 0.9607843, 0, 1, 1,
1.006202, 0.8652691, 0.6664286, 0.9686275, 0, 1, 1,
1.006732, -0.03904003, 0.3428888, 0.972549, 0, 1, 1,
1.016602, -1.164498, 3.094405, 0.9803922, 0, 1, 1,
1.016665, -2.200042, 3.742702, 0.9843137, 0, 1, 1,
1.023754, 0.4671868, 0.9307718, 0.9921569, 0, 1, 1,
1.029652, -0.4153971, 2.343359, 0.9960784, 0, 1, 1,
1.029939, 1.462, -0.1426547, 1, 0, 0.9960784, 1,
1.034639, -0.2046724, 1.843638, 1, 0, 0.9882353, 1,
1.037754, -0.9440895, 3.548433, 1, 0, 0.9843137, 1,
1.038572, 0.2828083, -0.009478459, 1, 0, 0.9764706, 1,
1.038949, -0.2578898, 1.698141, 1, 0, 0.972549, 1,
1.041484, 1.207706, 0.9087199, 1, 0, 0.9647059, 1,
1.049237, 1.011783, 0.5122308, 1, 0, 0.9607843, 1,
1.049455, 0.4935903, 2.144464, 1, 0, 0.9529412, 1,
1.052404, 1.28659, 1.640928, 1, 0, 0.9490196, 1,
1.056075, 0.9371725, -0.4865317, 1, 0, 0.9411765, 1,
1.05814, 0.1733257, -0.6226485, 1, 0, 0.9372549, 1,
1.060147, -1.081361, -0.4093879, 1, 0, 0.9294118, 1,
1.061632, -0.3620198, 2.733377, 1, 0, 0.9254902, 1,
1.067869, -1.472901, 2.441655, 1, 0, 0.9176471, 1,
1.071982, -0.2695842, 3.116051, 1, 0, 0.9137255, 1,
1.075985, -0.6798016, 2.101187, 1, 0, 0.9058824, 1,
1.077503, 1.550487, 0.8663603, 1, 0, 0.9019608, 1,
1.078794, 0.4203308, 0.06120933, 1, 0, 0.8941177, 1,
1.089434, 0.8329754, -0.8101135, 1, 0, 0.8862745, 1,
1.095555, 0.224516, 1.568903, 1, 0, 0.8823529, 1,
1.096843, -0.7999924, 1.652457, 1, 0, 0.8745098, 1,
1.103706, 0.604233, -0.713681, 1, 0, 0.8705882, 1,
1.129233, 1.647195, 0.5094849, 1, 0, 0.8627451, 1,
1.129552, -1.542567, 2.562871, 1, 0, 0.8588235, 1,
1.130541, 2.124266, 1.875558, 1, 0, 0.8509804, 1,
1.133381, -0.7820536, 1.253529, 1, 0, 0.8470588, 1,
1.136516, 0.224087, 1.149224, 1, 0, 0.8392157, 1,
1.137597, -0.8391419, 3.43615, 1, 0, 0.8352941, 1,
1.140061, -0.3170086, 1.566571, 1, 0, 0.827451, 1,
1.143464, -0.8982468, 2.788468, 1, 0, 0.8235294, 1,
1.162427, -1.432272, 2.672159, 1, 0, 0.8156863, 1,
1.163633, -0.8877139, 1.86584, 1, 0, 0.8117647, 1,
1.163642, 0.655516, 0.8914292, 1, 0, 0.8039216, 1,
1.16949, 1.818643, -0.6857712, 1, 0, 0.7960784, 1,
1.171536, 0.03497556, 1.639071, 1, 0, 0.7921569, 1,
1.173672, -1.40366, 0.6460773, 1, 0, 0.7843137, 1,
1.174476, -1.592008, 2.367566, 1, 0, 0.7803922, 1,
1.175595, 0.4976341, 2.11526, 1, 0, 0.772549, 1,
1.188899, 1.09964, 2.213477, 1, 0, 0.7686275, 1,
1.195611, 0.7727733, 1.462213, 1, 0, 0.7607843, 1,
1.203075, 2.329474, 0.9257876, 1, 0, 0.7568628, 1,
1.203451, 0.4441989, 0.406616, 1, 0, 0.7490196, 1,
1.204468, -1.752794, 4.164067, 1, 0, 0.7450981, 1,
1.218831, 0.9175004, 2.39808, 1, 0, 0.7372549, 1,
1.226408, 0.3308235, 1.315005, 1, 0, 0.7333333, 1,
1.228808, -0.6156431, 4.771817, 1, 0, 0.7254902, 1,
1.230334, 0.1604189, 1.912351, 1, 0, 0.7215686, 1,
1.23658, 0.5985472, 1.597134, 1, 0, 0.7137255, 1,
1.246971, -0.4003325, 2.156019, 1, 0, 0.7098039, 1,
1.255675, 0.6044288, -0.2772719, 1, 0, 0.7019608, 1,
1.262073, 0.1787903, 1.315984, 1, 0, 0.6941177, 1,
1.263974, 0.8978152, 0.1651153, 1, 0, 0.6901961, 1,
1.264984, 1.328126, -0.4880528, 1, 0, 0.682353, 1,
1.266553, -0.1367337, 2.175446, 1, 0, 0.6784314, 1,
1.277741, -0.7351082, 1.916794, 1, 0, 0.6705883, 1,
1.279425, 0.008117077, 2.596347, 1, 0, 0.6666667, 1,
1.280535, -0.62369, 2.123782, 1, 0, 0.6588235, 1,
1.28087, -1.73477, 2.726482, 1, 0, 0.654902, 1,
1.285038, -1.788471, 0.5362135, 1, 0, 0.6470588, 1,
1.287262, -1.006593, 0.9417073, 1, 0, 0.6431373, 1,
1.28897, -0.7424813, 3.933586, 1, 0, 0.6352941, 1,
1.290685, -1.443457, 2.197695, 1, 0, 0.6313726, 1,
1.293014, -0.1537814, 3.961299, 1, 0, 0.6235294, 1,
1.294636, -0.3468114, 1.11024, 1, 0, 0.6196079, 1,
1.299385, -1.73633, 2.210309, 1, 0, 0.6117647, 1,
1.313157, 1.631186, 0.3651572, 1, 0, 0.6078432, 1,
1.316365, -0.906482, 2.074775, 1, 0, 0.6, 1,
1.325223, 1.371075, 2.178473, 1, 0, 0.5921569, 1,
1.328204, 0.1090997, 1.966319, 1, 0, 0.5882353, 1,
1.35752, 0.005442237, 1.573553, 1, 0, 0.5803922, 1,
1.358532, -0.8653654, 0.7845694, 1, 0, 0.5764706, 1,
1.366008, 0.5825711, 0.3142789, 1, 0, 0.5686275, 1,
1.3755, 0.2099154, 1.716173, 1, 0, 0.5647059, 1,
1.375609, 1.172325, 2.55682, 1, 0, 0.5568628, 1,
1.380999, -1.020422, 1.539468, 1, 0, 0.5529412, 1,
1.381248, 1.949984, 2.957307, 1, 0, 0.5450981, 1,
1.393782, 0.08144208, 2.068017, 1, 0, 0.5411765, 1,
1.39648, 3.170255, 0.8685804, 1, 0, 0.5333334, 1,
1.396777, -0.9756913, 2.931091, 1, 0, 0.5294118, 1,
1.415157, 1.470441, 1.373069, 1, 0, 0.5215687, 1,
1.41755, -1.057424, 2.303772, 1, 0, 0.5176471, 1,
1.421471, 0.7053064, 0.2237404, 1, 0, 0.509804, 1,
1.429446, -1.054706, 3.300812, 1, 0, 0.5058824, 1,
1.434278, 0.8903835, 1.081169, 1, 0, 0.4980392, 1,
1.438573, 1.058252, 1.033721, 1, 0, 0.4901961, 1,
1.446671, -0.5121067, 2.348943, 1, 0, 0.4862745, 1,
1.449443, -0.3858768, 0.7773795, 1, 0, 0.4784314, 1,
1.451163, -0.423602, 3.515506, 1, 0, 0.4745098, 1,
1.455312, 1.225217, 0.5701367, 1, 0, 0.4666667, 1,
1.456545, 2.027984, 1.495799, 1, 0, 0.4627451, 1,
1.465198, 0.6569208, 0.2617864, 1, 0, 0.454902, 1,
1.466985, 1.732696, 0.2174697, 1, 0, 0.4509804, 1,
1.475343, -0.5442427, 1.547368, 1, 0, 0.4431373, 1,
1.484097, 0.8934324, 3.355021, 1, 0, 0.4392157, 1,
1.488626, 0.2316154, 1.43978, 1, 0, 0.4313726, 1,
1.500047, -0.8430469, 1.987638, 1, 0, 0.427451, 1,
1.504709, 1.908457, 1.067954, 1, 0, 0.4196078, 1,
1.510824, 1.009044, 1.292279, 1, 0, 0.4156863, 1,
1.515309, 1.703321, 0.07381056, 1, 0, 0.4078431, 1,
1.518825, -0.5636588, 1.734898, 1, 0, 0.4039216, 1,
1.532395, -0.8901762, 3.464188, 1, 0, 0.3960784, 1,
1.539295, -1.233596, 2.176839, 1, 0, 0.3882353, 1,
1.540953, 0.1396872, 1.945328, 1, 0, 0.3843137, 1,
1.543003, 0.227004, 2.783912, 1, 0, 0.3764706, 1,
1.546387, 0.4091404, 2.232192, 1, 0, 0.372549, 1,
1.548701, 0.796449, 2.092082, 1, 0, 0.3647059, 1,
1.553223, -0.1597156, -1.02476, 1, 0, 0.3607843, 1,
1.555813, 0.3157333, 1.225139, 1, 0, 0.3529412, 1,
1.570902, -1.338093, 3.251124, 1, 0, 0.3490196, 1,
1.571358, -0.8021822, 1.358094, 1, 0, 0.3411765, 1,
1.572144, -0.8015949, 2.635183, 1, 0, 0.3372549, 1,
1.579111, -0.6938905, 1.709044, 1, 0, 0.3294118, 1,
1.580158, 0.2254775, 1.88862, 1, 0, 0.3254902, 1,
1.584046, -1.074827, 3.044264, 1, 0, 0.3176471, 1,
1.586196, -0.1209433, 1.856704, 1, 0, 0.3137255, 1,
1.606358, -0.5845368, 0.5657915, 1, 0, 0.3058824, 1,
1.608262, -0.5162454, 3.988783, 1, 0, 0.2980392, 1,
1.641682, -1.64469, 3.539013, 1, 0, 0.2941177, 1,
1.658443, 0.371459, 2.127222, 1, 0, 0.2862745, 1,
1.683344, 0.5384857, 1.453476, 1, 0, 0.282353, 1,
1.691452, -0.4501102, 2.99398, 1, 0, 0.2745098, 1,
1.724421, -1.057048, 2.042904, 1, 0, 0.2705882, 1,
1.736709, -1.035677, 2.571369, 1, 0, 0.2627451, 1,
1.742382, -0.1210694, 0.8534531, 1, 0, 0.2588235, 1,
1.743497, 0.403385, 1.72802, 1, 0, 0.2509804, 1,
1.753809, 0.2765716, 1.326843, 1, 0, 0.2470588, 1,
1.754101, 2.116927, 1.031212, 1, 0, 0.2392157, 1,
1.77444, -2.005419, 2.631376, 1, 0, 0.2352941, 1,
1.775805, -1.106345, 3.272103, 1, 0, 0.227451, 1,
1.791277, -1.403701, 2.304589, 1, 0, 0.2235294, 1,
1.804749, -0.6526852, 2.388439, 1, 0, 0.2156863, 1,
1.811707, 0.3243639, 2.633405, 1, 0, 0.2117647, 1,
1.813133, 1.897565, 1.914485, 1, 0, 0.2039216, 1,
1.822527, -0.5760677, 1.867046, 1, 0, 0.1960784, 1,
1.83255, -0.9100922, 3.473153, 1, 0, 0.1921569, 1,
1.842836, -0.5849543, 1.654591, 1, 0, 0.1843137, 1,
1.842913, -1.07036, 2.209545, 1, 0, 0.1803922, 1,
1.843393, -1.159717, 0.8746904, 1, 0, 0.172549, 1,
1.846288, 1.193064, 0.2424102, 1, 0, 0.1686275, 1,
1.847489, -0.3770625, 2.794231, 1, 0, 0.1607843, 1,
1.85363, -0.7989335, -0.2848373, 1, 0, 0.1568628, 1,
1.889501, 0.3068804, 1.500498, 1, 0, 0.1490196, 1,
1.907805, 0.5534731, 1.20916, 1, 0, 0.145098, 1,
1.912801, -1.332104, 1.667962, 1, 0, 0.1372549, 1,
1.9265, 0.8703938, 1.756159, 1, 0, 0.1333333, 1,
1.964778, -1.321067, 2.387318, 1, 0, 0.1254902, 1,
1.964973, -0.8598752, 2.041023, 1, 0, 0.1215686, 1,
2.060443, 1.27216, 0.003274187, 1, 0, 0.1137255, 1,
2.089684, -2.072947, 3.381941, 1, 0, 0.1098039, 1,
2.207434, 0.02538255, 1.723808, 1, 0, 0.1019608, 1,
2.20755, 1.053206, 1.317813, 1, 0, 0.09411765, 1,
2.234081, 0.2847626, 0.7462395, 1, 0, 0.09019608, 1,
2.248183, -0.3500737, 2.537087, 1, 0, 0.08235294, 1,
2.292256, -0.4635089, 3.207062, 1, 0, 0.07843138, 1,
2.339947, 0.08221383, 3.321845, 1, 0, 0.07058824, 1,
2.376508, -0.4738958, 2.549634, 1, 0, 0.06666667, 1,
2.436155, 0.9742641, 1.158438, 1, 0, 0.05882353, 1,
2.447629, -0.6618618, 2.911949, 1, 0, 0.05490196, 1,
2.53269, 0.6221558, 1.24741, 1, 0, 0.04705882, 1,
2.572024, -2.09402, 2.821977, 1, 0, 0.04313726, 1,
2.657887, 0.7782758, 0.8728421, 1, 0, 0.03529412, 1,
2.759528, -0.9191737, 1.522948, 1, 0, 0.03137255, 1,
2.929408, 0.4172181, 1.236078, 1, 0, 0.02352941, 1,
2.990348, 0.6732423, -0.1493294, 1, 0, 0.01960784, 1,
3.014582, 0.458427, 0.7458658, 1, 0, 0.01176471, 1,
3.186848, 0.6344858, 1.318677, 1, 0, 0.007843138, 1
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
0.1448377, -4.038127, -7.187671, 0, -0.5, 0.5, 0.5,
0.1448377, -4.038127, -7.187671, 1, -0.5, 0.5, 0.5,
0.1448377, -4.038127, -7.187671, 1, 1.5, 0.5, 0.5,
0.1448377, -4.038127, -7.187671, 0, 1.5, 0.5, 0.5
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
-3.928415, 0.08843303, -7.187671, 0, -0.5, 0.5, 0.5,
-3.928415, 0.08843303, -7.187671, 1, -0.5, 0.5, 0.5,
-3.928415, 0.08843303, -7.187671, 1, 1.5, 0.5, 0.5,
-3.928415, 0.08843303, -7.187671, 0, 1.5, 0.5, 0.5
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
-3.928415, -4.038127, -0.1757958, 0, -0.5, 0.5, 0.5,
-3.928415, -4.038127, -0.1757958, 1, -0.5, 0.5, 0.5,
-3.928415, -4.038127, -0.1757958, 1, 1.5, 0.5, 0.5,
-3.928415, -4.038127, -0.1757958, 0, 1.5, 0.5, 0.5
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
-2, -3.085844, -5.569546,
3, -3.085844, -5.569546,
-2, -3.085844, -5.569546,
-2, -3.244558, -5.839233,
-1, -3.085844, -5.569546,
-1, -3.244558, -5.839233,
0, -3.085844, -5.569546,
0, -3.244558, -5.839233,
1, -3.085844, -5.569546,
1, -3.244558, -5.839233,
2, -3.085844, -5.569546,
2, -3.244558, -5.839233,
3, -3.085844, -5.569546,
3, -3.244558, -5.839233
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
-2, -3.561985, -6.378609, 0, -0.5, 0.5, 0.5,
-2, -3.561985, -6.378609, 1, -0.5, 0.5, 0.5,
-2, -3.561985, -6.378609, 1, 1.5, 0.5, 0.5,
-2, -3.561985, -6.378609, 0, 1.5, 0.5, 0.5,
-1, -3.561985, -6.378609, 0, -0.5, 0.5, 0.5,
-1, -3.561985, -6.378609, 1, -0.5, 0.5, 0.5,
-1, -3.561985, -6.378609, 1, 1.5, 0.5, 0.5,
-1, -3.561985, -6.378609, 0, 1.5, 0.5, 0.5,
0, -3.561985, -6.378609, 0, -0.5, 0.5, 0.5,
0, -3.561985, -6.378609, 1, -0.5, 0.5, 0.5,
0, -3.561985, -6.378609, 1, 1.5, 0.5, 0.5,
0, -3.561985, -6.378609, 0, 1.5, 0.5, 0.5,
1, -3.561985, -6.378609, 0, -0.5, 0.5, 0.5,
1, -3.561985, -6.378609, 1, -0.5, 0.5, 0.5,
1, -3.561985, -6.378609, 1, 1.5, 0.5, 0.5,
1, -3.561985, -6.378609, 0, 1.5, 0.5, 0.5,
2, -3.561985, -6.378609, 0, -0.5, 0.5, 0.5,
2, -3.561985, -6.378609, 1, -0.5, 0.5, 0.5,
2, -3.561985, -6.378609, 1, 1.5, 0.5, 0.5,
2, -3.561985, -6.378609, 0, 1.5, 0.5, 0.5,
3, -3.561985, -6.378609, 0, -0.5, 0.5, 0.5,
3, -3.561985, -6.378609, 1, -0.5, 0.5, 0.5,
3, -3.561985, -6.378609, 1, 1.5, 0.5, 0.5,
3, -3.561985, -6.378609, 0, 1.5, 0.5, 0.5
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
-2.988433, -2, -5.569546,
-2.988433, 3, -5.569546,
-2.988433, -2, -5.569546,
-3.145097, -2, -5.839233,
-2.988433, -1, -5.569546,
-3.145097, -1, -5.839233,
-2.988433, 0, -5.569546,
-3.145097, 0, -5.839233,
-2.988433, 1, -5.569546,
-3.145097, 1, -5.839233,
-2.988433, 2, -5.569546,
-3.145097, 2, -5.839233,
-2.988433, 3, -5.569546,
-3.145097, 3, -5.839233
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
-3.458424, -2, -6.378609, 0, -0.5, 0.5, 0.5,
-3.458424, -2, -6.378609, 1, -0.5, 0.5, 0.5,
-3.458424, -2, -6.378609, 1, 1.5, 0.5, 0.5,
-3.458424, -2, -6.378609, 0, 1.5, 0.5, 0.5,
-3.458424, -1, -6.378609, 0, -0.5, 0.5, 0.5,
-3.458424, -1, -6.378609, 1, -0.5, 0.5, 0.5,
-3.458424, -1, -6.378609, 1, 1.5, 0.5, 0.5,
-3.458424, -1, -6.378609, 0, 1.5, 0.5, 0.5,
-3.458424, 0, -6.378609, 0, -0.5, 0.5, 0.5,
-3.458424, 0, -6.378609, 1, -0.5, 0.5, 0.5,
-3.458424, 0, -6.378609, 1, 1.5, 0.5, 0.5,
-3.458424, 0, -6.378609, 0, 1.5, 0.5, 0.5,
-3.458424, 1, -6.378609, 0, -0.5, 0.5, 0.5,
-3.458424, 1, -6.378609, 1, -0.5, 0.5, 0.5,
-3.458424, 1, -6.378609, 1, 1.5, 0.5, 0.5,
-3.458424, 1, -6.378609, 0, 1.5, 0.5, 0.5,
-3.458424, 2, -6.378609, 0, -0.5, 0.5, 0.5,
-3.458424, 2, -6.378609, 1, -0.5, 0.5, 0.5,
-3.458424, 2, -6.378609, 1, 1.5, 0.5, 0.5,
-3.458424, 2, -6.378609, 0, 1.5, 0.5, 0.5,
-3.458424, 3, -6.378609, 0, -0.5, 0.5, 0.5,
-3.458424, 3, -6.378609, 1, -0.5, 0.5, 0.5,
-3.458424, 3, -6.378609, 1, 1.5, 0.5, 0.5,
-3.458424, 3, -6.378609, 0, 1.5, 0.5, 0.5
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
-2.988433, -3.085844, -4,
-2.988433, -3.085844, 4,
-2.988433, -3.085844, -4,
-3.145097, -3.244558, -4,
-2.988433, -3.085844, -2,
-3.145097, -3.244558, -2,
-2.988433, -3.085844, 0,
-3.145097, -3.244558, 0,
-2.988433, -3.085844, 2,
-3.145097, -3.244558, 2,
-2.988433, -3.085844, 4,
-3.145097, -3.244558, 4
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
-3.458424, -3.561985, -4, 0, -0.5, 0.5, 0.5,
-3.458424, -3.561985, -4, 1, -0.5, 0.5, 0.5,
-3.458424, -3.561985, -4, 1, 1.5, 0.5, 0.5,
-3.458424, -3.561985, -4, 0, 1.5, 0.5, 0.5,
-3.458424, -3.561985, -2, 0, -0.5, 0.5, 0.5,
-3.458424, -3.561985, -2, 1, -0.5, 0.5, 0.5,
-3.458424, -3.561985, -2, 1, 1.5, 0.5, 0.5,
-3.458424, -3.561985, -2, 0, 1.5, 0.5, 0.5,
-3.458424, -3.561985, 0, 0, -0.5, 0.5, 0.5,
-3.458424, -3.561985, 0, 1, -0.5, 0.5, 0.5,
-3.458424, -3.561985, 0, 1, 1.5, 0.5, 0.5,
-3.458424, -3.561985, 0, 0, 1.5, 0.5, 0.5,
-3.458424, -3.561985, 2, 0, -0.5, 0.5, 0.5,
-3.458424, -3.561985, 2, 1, -0.5, 0.5, 0.5,
-3.458424, -3.561985, 2, 1, 1.5, 0.5, 0.5,
-3.458424, -3.561985, 2, 0, 1.5, 0.5, 0.5,
-3.458424, -3.561985, 4, 0, -0.5, 0.5, 0.5,
-3.458424, -3.561985, 4, 1, -0.5, 0.5, 0.5,
-3.458424, -3.561985, 4, 1, 1.5, 0.5, 0.5,
-3.458424, -3.561985, 4, 0, 1.5, 0.5, 0.5
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
-2.988433, -3.085844, -5.569546,
-2.988433, 3.26271, -5.569546,
-2.988433, -3.085844, 5.217955,
-2.988433, 3.26271, 5.217955,
-2.988433, -3.085844, -5.569546,
-2.988433, -3.085844, 5.217955,
-2.988433, 3.26271, -5.569546,
-2.988433, 3.26271, 5.217955,
-2.988433, -3.085844, -5.569546,
3.278109, -3.085844, -5.569546,
-2.988433, -3.085844, 5.217955,
3.278109, -3.085844, 5.217955,
-2.988433, 3.26271, -5.569546,
3.278109, 3.26271, -5.569546,
-2.988433, 3.26271, 5.217955,
3.278109, 3.26271, 5.217955,
3.278109, -3.085844, -5.569546,
3.278109, 3.26271, -5.569546,
3.278109, -3.085844, 5.217955,
3.278109, 3.26271, 5.217955,
3.278109, -3.085844, -5.569546,
3.278109, -3.085844, 5.217955,
3.278109, 3.26271, -5.569546,
3.278109, 3.26271, 5.217955
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
var radius = 7.474657;
var distance = 33.2556;
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
mvMatrix.translate( -0.1448377, -0.08843303, 0.1757958 );
mvMatrix.scale( 1.289666, 1.273006, 0.7491769 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.2556);
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


