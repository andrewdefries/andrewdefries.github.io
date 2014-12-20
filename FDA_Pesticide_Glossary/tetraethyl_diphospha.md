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
-2.872009, 1.688957, -0.8118446, 1, 0, 0, 1,
-2.58796, -0.1701592, -2.892925, 1, 0.007843138, 0, 1,
-2.547601, 0.4357086, -1.458396, 1, 0.01176471, 0, 1,
-2.422184, 0.09861479, -1.190919, 1, 0.01960784, 0, 1,
-2.278713, -0.3764226, -3.405285, 1, 0.02352941, 0, 1,
-2.277997, -0.4322265, -1.38879, 1, 0.03137255, 0, 1,
-2.271238, -0.04088184, -0.3860992, 1, 0.03529412, 0, 1,
-2.182758, 0.0393971, -1.388463, 1, 0.04313726, 0, 1,
-2.129671, 0.2687157, -0.9168893, 1, 0.04705882, 0, 1,
-2.120106, -0.1448866, -1.969963, 1, 0.05490196, 0, 1,
-2.093254, 0.3342336, -1.963847, 1, 0.05882353, 0, 1,
-2.072822, -0.1122549, -1.527992, 1, 0.06666667, 0, 1,
-2.072143, -0.6293281, -0.9597889, 1, 0.07058824, 0, 1,
-2.060007, -0.5965973, -1.560026, 1, 0.07843138, 0, 1,
-2.028665, -0.9555589, -2.29246, 1, 0.08235294, 0, 1,
-2.001141, -0.1257944, -2.621251, 1, 0.09019608, 0, 1,
-1.97484, -0.3924168, -1.20292, 1, 0.09411765, 0, 1,
-1.966999, 0.2459994, 0.9001477, 1, 0.1019608, 0, 1,
-1.960387, -0.938103, -0.1587754, 1, 0.1098039, 0, 1,
-1.952301, 0.3349481, -1.113007, 1, 0.1137255, 0, 1,
-1.909231, -0.8971911, -2.48321, 1, 0.1215686, 0, 1,
-1.908119, -0.003669464, -1.339445, 1, 0.1254902, 0, 1,
-1.901885, 0.1716856, -2.849264, 1, 0.1333333, 0, 1,
-1.89203, 2.83123, -1.115915, 1, 0.1372549, 0, 1,
-1.880496, 1.009827, -1.55614, 1, 0.145098, 0, 1,
-1.868295, -0.2347025, -1.363248, 1, 0.1490196, 0, 1,
-1.860978, 0.534098, -3.165216, 1, 0.1568628, 0, 1,
-1.856728, 0.8647471, -1.114625, 1, 0.1607843, 0, 1,
-1.850883, 0.2140998, -1.197605, 1, 0.1686275, 0, 1,
-1.84762, -1.222156, -2.857167, 1, 0.172549, 0, 1,
-1.822108, 0.434043, -1.880858, 1, 0.1803922, 0, 1,
-1.81651, 0.4076232, -1.677184, 1, 0.1843137, 0, 1,
-1.801482, -0.4048271, -4.275591, 1, 0.1921569, 0, 1,
-1.761803, -0.1118399, -1.528927, 1, 0.1960784, 0, 1,
-1.724176, -0.5211408, -1.255115, 1, 0.2039216, 0, 1,
-1.704369, -0.2991538, -2.242528, 1, 0.2117647, 0, 1,
-1.695499, 0.9640433, -3.077208, 1, 0.2156863, 0, 1,
-1.681076, -0.3733374, -1.276398, 1, 0.2235294, 0, 1,
-1.678798, -0.8683742, -2.595701, 1, 0.227451, 0, 1,
-1.673612, -0.9077156, -1.614625, 1, 0.2352941, 0, 1,
-1.636051, -0.1032338, -3.441886, 1, 0.2392157, 0, 1,
-1.631852, -1.455114, -2.324063, 1, 0.2470588, 0, 1,
-1.620665, 0.2046159, -2.232188, 1, 0.2509804, 0, 1,
-1.60582, 1.743708, -0.1796005, 1, 0.2588235, 0, 1,
-1.601385, -0.1479384, -1.615334, 1, 0.2627451, 0, 1,
-1.571292, -1.927714, -2.774615, 1, 0.2705882, 0, 1,
-1.550936, -0.6197366, -4.496984, 1, 0.2745098, 0, 1,
-1.547985, 0.6370227, 0.6647957, 1, 0.282353, 0, 1,
-1.539552, 0.7076607, 0.215994, 1, 0.2862745, 0, 1,
-1.539084, -0.3517586, 0.8343975, 1, 0.2941177, 0, 1,
-1.537512, -0.9550974, -1.82447, 1, 0.3019608, 0, 1,
-1.522413, 0.3546801, 0.0787038, 1, 0.3058824, 0, 1,
-1.517536, 0.9040439, -0.3021421, 1, 0.3137255, 0, 1,
-1.511974, -1.723663, -1.860958, 1, 0.3176471, 0, 1,
-1.510589, 0.573724, -2.209945, 1, 0.3254902, 0, 1,
-1.502225, -2.053105, -1.518623, 1, 0.3294118, 0, 1,
-1.497468, 0.395105, -0.9032395, 1, 0.3372549, 0, 1,
-1.454006, 0.3240713, -2.541971, 1, 0.3411765, 0, 1,
-1.448654, 0.6393901, -1.01421, 1, 0.3490196, 0, 1,
-1.444414, -1.522489, -2.042488, 1, 0.3529412, 0, 1,
-1.443788, -1.191268, -2.169291, 1, 0.3607843, 0, 1,
-1.441554, -0.1180671, -3.141605, 1, 0.3647059, 0, 1,
-1.436007, 0.4803068, -0.665399, 1, 0.372549, 0, 1,
-1.433715, -0.9769553, -2.721071, 1, 0.3764706, 0, 1,
-1.428845, 0.4455812, -2.497034, 1, 0.3843137, 0, 1,
-1.419585, 1.757686, -2.849662, 1, 0.3882353, 0, 1,
-1.4186, 0.2421828, -2.363621, 1, 0.3960784, 0, 1,
-1.417845, 0.2801694, -1.495812, 1, 0.4039216, 0, 1,
-1.386342, 1.368444, -2.902581, 1, 0.4078431, 0, 1,
-1.384685, -0.9856364, -3.349739, 1, 0.4156863, 0, 1,
-1.377161, -0.5144323, -1.827185, 1, 0.4196078, 0, 1,
-1.375805, -0.5076307, -2.3952, 1, 0.427451, 0, 1,
-1.371513, -1.688111, -3.199616, 1, 0.4313726, 0, 1,
-1.36771, -2.155046, -1.662546, 1, 0.4392157, 0, 1,
-1.358528, -0.5053549, -1.651313, 1, 0.4431373, 0, 1,
-1.357658, 0.2662988, -0.6737532, 1, 0.4509804, 0, 1,
-1.357584, -1.114719, -1.123066, 1, 0.454902, 0, 1,
-1.353359, 1.23467, -0.1179638, 1, 0.4627451, 0, 1,
-1.351171, 0.5259646, -1.4075, 1, 0.4666667, 0, 1,
-1.345983, 0.6365832, 0.3797074, 1, 0.4745098, 0, 1,
-1.341191, 0.9454411, -1.369762, 1, 0.4784314, 0, 1,
-1.339971, 1.776383, 0.04761314, 1, 0.4862745, 0, 1,
-1.337776, -1.196781, -2.474617, 1, 0.4901961, 0, 1,
-1.335488, -0.6402746, -0.6349778, 1, 0.4980392, 0, 1,
-1.334949, -0.7620833, -3.862746, 1, 0.5058824, 0, 1,
-1.324282, 0.8268465, -1.268024, 1, 0.509804, 0, 1,
-1.299145, 1.021958, -2.2049, 1, 0.5176471, 0, 1,
-1.288363, 0.7122932, -1.709388, 1, 0.5215687, 0, 1,
-1.286843, 0.3881616, 0.5139716, 1, 0.5294118, 0, 1,
-1.285842, 0.6446802, -2.726009, 1, 0.5333334, 0, 1,
-1.285291, 0.173129, -1.438204, 1, 0.5411765, 0, 1,
-1.285107, -2.218273, -0.6367819, 1, 0.5450981, 0, 1,
-1.283909, -0.2592516, -1.302685, 1, 0.5529412, 0, 1,
-1.277365, 0.07351681, -2.434562, 1, 0.5568628, 0, 1,
-1.268331, 1.74269, -1.418501, 1, 0.5647059, 0, 1,
-1.26599, 0.3015454, -0.2163455, 1, 0.5686275, 0, 1,
-1.265174, -0.5346668, -3.018701, 1, 0.5764706, 0, 1,
-1.258525, -0.5017983, -1.850284, 1, 0.5803922, 0, 1,
-1.25113, -0.6880968, -2.670911, 1, 0.5882353, 0, 1,
-1.25062, 1.825072, -0.5627612, 1, 0.5921569, 0, 1,
-1.237656, 0.07325433, -1.206864, 1, 0.6, 0, 1,
-1.233806, 2.545726, -1.81135, 1, 0.6078432, 0, 1,
-1.232846, -0.3461455, -3.123815, 1, 0.6117647, 0, 1,
-1.219867, -0.01955243, -2.847399, 1, 0.6196079, 0, 1,
-1.201909, -0.6666757, -2.905836, 1, 0.6235294, 0, 1,
-1.196987, -1.068126, -2.543833, 1, 0.6313726, 0, 1,
-1.194168, 0.815989, 0.1518614, 1, 0.6352941, 0, 1,
-1.190674, 0.2882491, -0.05870518, 1, 0.6431373, 0, 1,
-1.187307, -0.6317878, -2.968637, 1, 0.6470588, 0, 1,
-1.186797, -1.844742, -1.966687, 1, 0.654902, 0, 1,
-1.186653, 0.09965804, -1.022936, 1, 0.6588235, 0, 1,
-1.179725, -2.11826, -2.637705, 1, 0.6666667, 0, 1,
-1.173174, -1.379588, -1.776334, 1, 0.6705883, 0, 1,
-1.169617, -1.952736, -5.566479, 1, 0.6784314, 0, 1,
-1.165773, 1.754731, 0.3404526, 1, 0.682353, 0, 1,
-1.160069, -0.4854176, -2.329261, 1, 0.6901961, 0, 1,
-1.157821, -0.0374342, -1.32982, 1, 0.6941177, 0, 1,
-1.157557, -0.2999451, -1.873211, 1, 0.7019608, 0, 1,
-1.147439, -0.5445106, -1.755642, 1, 0.7098039, 0, 1,
-1.133768, 0.6176711, -1.206669, 1, 0.7137255, 0, 1,
-1.118851, 0.2762064, -0.6353226, 1, 0.7215686, 0, 1,
-1.112373, -0.6415724, -3.082408, 1, 0.7254902, 0, 1,
-1.110595, -0.6950397, -1.023594, 1, 0.7333333, 0, 1,
-1.109437, 0.435981, -0.6550463, 1, 0.7372549, 0, 1,
-1.098293, 0.5599957, -1.343111, 1, 0.7450981, 0, 1,
-1.096876, 0.5447512, -1.911344, 1, 0.7490196, 0, 1,
-1.096627, -0.2150228, 0.101498, 1, 0.7568628, 0, 1,
-1.088906, 0.9488476, -0.08315095, 1, 0.7607843, 0, 1,
-1.088456, -0.4677732, -1.687647, 1, 0.7686275, 0, 1,
-1.083973, 1.011123, 0.02745984, 1, 0.772549, 0, 1,
-1.081283, 1.343526, 0.02271575, 1, 0.7803922, 0, 1,
-1.075714, 2.476082, -1.77358, 1, 0.7843137, 0, 1,
-1.074399, 0.4585027, -2.855507, 1, 0.7921569, 0, 1,
-1.068408, 1.700563, -0.2183424, 1, 0.7960784, 0, 1,
-1.059955, 0.7652352, -0.6990865, 1, 0.8039216, 0, 1,
-1.039341, 0.8767786, 2.003404, 1, 0.8117647, 0, 1,
-1.039251, -0.07714714, -2.503239, 1, 0.8156863, 0, 1,
-1.038501, -0.739054, -1.866114, 1, 0.8235294, 0, 1,
-1.030933, 1.641107, -2.41254, 1, 0.827451, 0, 1,
-1.030732, 0.5179365, -0.5635713, 1, 0.8352941, 0, 1,
-1.021842, 1.258072, 0.4749872, 1, 0.8392157, 0, 1,
-1.021716, -1.398496, -3.233563, 1, 0.8470588, 0, 1,
-1.019802, 0.8165407, 0.2387513, 1, 0.8509804, 0, 1,
-1.016129, 0.6080779, -1.589992, 1, 0.8588235, 0, 1,
-1.01519, -0.2097362, -2.111063, 1, 0.8627451, 0, 1,
-1.015031, 1.316492, -0.2487661, 1, 0.8705882, 0, 1,
-1.010209, 0.5519153, -1.509512, 1, 0.8745098, 0, 1,
-0.9981633, -0.2062276, 0.04153924, 1, 0.8823529, 0, 1,
-0.9951791, 0.6141663, -2.333539, 1, 0.8862745, 0, 1,
-0.9809815, 0.04491484, -1.452245, 1, 0.8941177, 0, 1,
-0.9807313, 0.07223798, -2.785139, 1, 0.8980392, 0, 1,
-0.9751724, 0.4010145, -1.094465, 1, 0.9058824, 0, 1,
-0.9675468, 0.3637204, -1.306557, 1, 0.9137255, 0, 1,
-0.9658637, 1.518137, -1.323002, 1, 0.9176471, 0, 1,
-0.9627787, 0.01861085, -1.511928, 1, 0.9254902, 0, 1,
-0.9596868, 0.3008713, -1.53894, 1, 0.9294118, 0, 1,
-0.9520156, -0.2459077, 0.552873, 1, 0.9372549, 0, 1,
-0.951057, -1.055773, -3.367939, 1, 0.9411765, 0, 1,
-0.9455334, 0.3440955, 0.03376218, 1, 0.9490196, 0, 1,
-0.9362624, 0.9194527, -0.0894944, 1, 0.9529412, 0, 1,
-0.9329706, -1.627962, -2.734047, 1, 0.9607843, 0, 1,
-0.9318841, 0.08294912, -1.033762, 1, 0.9647059, 0, 1,
-0.9309817, -0.2536605, -1.27164, 1, 0.972549, 0, 1,
-0.9245882, 1.194233, -2.382612, 1, 0.9764706, 0, 1,
-0.9240894, -0.8620268, -4.519256, 1, 0.9843137, 0, 1,
-0.9092016, -1.287786, -1.312163, 1, 0.9882353, 0, 1,
-0.9007402, 0.920243, -1.099102, 1, 0.9960784, 0, 1,
-0.8986657, -0.3917387, -2.288026, 0.9960784, 1, 0, 1,
-0.8977019, 1.388059, 0.1588558, 0.9921569, 1, 0, 1,
-0.8970301, -0.6306486, -2.239652, 0.9843137, 1, 0, 1,
-0.8959338, -0.1150092, 0.01988539, 0.9803922, 1, 0, 1,
-0.8930489, -0.7846032, -2.337978, 0.972549, 1, 0, 1,
-0.8903028, -1.058591, -5.145878, 0.9686275, 1, 0, 1,
-0.885662, -0.1238933, -3.376639, 0.9607843, 1, 0, 1,
-0.8817745, 0.6780673, -2.006748, 0.9568627, 1, 0, 1,
-0.8775713, -1.754434, -3.140947, 0.9490196, 1, 0, 1,
-0.8752726, -0.9518125, -2.785722, 0.945098, 1, 0, 1,
-0.8752547, 1.091759, -0.6483922, 0.9372549, 1, 0, 1,
-0.8717338, 0.460884, -1.159386, 0.9333333, 1, 0, 1,
-0.8700815, 0.2793523, -0.9399128, 0.9254902, 1, 0, 1,
-0.8675394, 1.309089, -1.88956, 0.9215686, 1, 0, 1,
-0.8663357, 1.212424, 1.65944, 0.9137255, 1, 0, 1,
-0.8626714, -0.1695493, -1.799863, 0.9098039, 1, 0, 1,
-0.8568931, 1.868379, -1.06859, 0.9019608, 1, 0, 1,
-0.8567355, 0.7132913, -2.450557, 0.8941177, 1, 0, 1,
-0.8483861, -1.440118, -0.6933751, 0.8901961, 1, 0, 1,
-0.845178, -0.8989171, -2.792541, 0.8823529, 1, 0, 1,
-0.8437709, -0.8516331, -3.247287, 0.8784314, 1, 0, 1,
-0.8357456, -0.643533, -2.790857, 0.8705882, 1, 0, 1,
-0.8340045, -0.2333169, -1.026374, 0.8666667, 1, 0, 1,
-0.8330716, 0.01227504, -1.340502, 0.8588235, 1, 0, 1,
-0.8317211, -0.3819204, -1.365622, 0.854902, 1, 0, 1,
-0.8312679, -0.2873226, -2.200332, 0.8470588, 1, 0, 1,
-0.8299518, -1.402751, -4.167186, 0.8431373, 1, 0, 1,
-0.8213395, 0.7273835, -0.2166185, 0.8352941, 1, 0, 1,
-0.8192548, -1.139667, -4.695758, 0.8313726, 1, 0, 1,
-0.8157586, 0.3516518, -1.545056, 0.8235294, 1, 0, 1,
-0.8139354, 0.8947058, -1.069743, 0.8196079, 1, 0, 1,
-0.8116781, 0.6358309, -1.833659, 0.8117647, 1, 0, 1,
-0.8030599, 1.123539, -1.289046, 0.8078431, 1, 0, 1,
-0.8028087, -0.02224684, -1.446418, 0.8, 1, 0, 1,
-0.8019574, 0.10359, -0.7264889, 0.7921569, 1, 0, 1,
-0.8002822, -0.5279666, -4.272638, 0.7882353, 1, 0, 1,
-0.7978279, -0.754795, -1.799481, 0.7803922, 1, 0, 1,
-0.7974966, 0.6128551, -0.6972092, 0.7764706, 1, 0, 1,
-0.7955, -0.1641116, -3.451195, 0.7686275, 1, 0, 1,
-0.7884902, 0.6672996, -1.939983, 0.7647059, 1, 0, 1,
-0.7877265, 0.4206561, -0.4991896, 0.7568628, 1, 0, 1,
-0.7872635, -0.3691055, -2.698066, 0.7529412, 1, 0, 1,
-0.7850301, 0.6619723, -1.120851, 0.7450981, 1, 0, 1,
-0.7822955, 0.6452025, -1.26923, 0.7411765, 1, 0, 1,
-0.7760723, 2.62294, 1.687306, 0.7333333, 1, 0, 1,
-0.7755597, 0.9805946, -1.726522, 0.7294118, 1, 0, 1,
-0.7755106, 0.04343425, -0.6368467, 0.7215686, 1, 0, 1,
-0.7684704, 0.7019919, -1.682755, 0.7176471, 1, 0, 1,
-0.7650611, 0.4573697, -2.111346, 0.7098039, 1, 0, 1,
-0.7642086, -0.8801299, -1.860416, 0.7058824, 1, 0, 1,
-0.7616462, 1.026574, 0.3655984, 0.6980392, 1, 0, 1,
-0.7532659, -0.2592939, -2.67377, 0.6901961, 1, 0, 1,
-0.7521769, 1.849548, -0.05113062, 0.6862745, 1, 0, 1,
-0.7482615, 0.5600767, -0.71099, 0.6784314, 1, 0, 1,
-0.7474275, -0.7434163, -1.760647, 0.6745098, 1, 0, 1,
-0.7469202, -0.267157, -2.372579, 0.6666667, 1, 0, 1,
-0.7422119, 0.323166, -0.6321549, 0.6627451, 1, 0, 1,
-0.7360717, -0.0405576, -1.197334, 0.654902, 1, 0, 1,
-0.7273389, -1.921795, -2.386306, 0.6509804, 1, 0, 1,
-0.7263398, 0.3418505, -0.2299211, 0.6431373, 1, 0, 1,
-0.7223259, 0.3973148, -2.413679, 0.6392157, 1, 0, 1,
-0.7203252, 0.7383724, 0.5964386, 0.6313726, 1, 0, 1,
-0.7192424, -0.04567207, -1.069501, 0.627451, 1, 0, 1,
-0.717224, 1.095155, -2.177029, 0.6196079, 1, 0, 1,
-0.7146786, 0.1489089, -0.3327539, 0.6156863, 1, 0, 1,
-0.71104, 0.6138345, -0.4931607, 0.6078432, 1, 0, 1,
-0.7099622, -1.235774, -2.468726, 0.6039216, 1, 0, 1,
-0.709371, 0.4197873, -1.244465, 0.5960785, 1, 0, 1,
-0.7090124, 1.179134, -0.01463621, 0.5882353, 1, 0, 1,
-0.7037631, 0.5398028, -0.6558968, 0.5843138, 1, 0, 1,
-0.7024735, -1.062036, -2.288356, 0.5764706, 1, 0, 1,
-0.6927335, -0.7579437, -3.922738, 0.572549, 1, 0, 1,
-0.6925236, 0.3914107, -1.304901, 0.5647059, 1, 0, 1,
-0.6921449, -2.134521, -2.224695, 0.5607843, 1, 0, 1,
-0.6837464, 0.5771299, -0.6133115, 0.5529412, 1, 0, 1,
-0.6833399, 1.887557, -0.2965307, 0.5490196, 1, 0, 1,
-0.6739643, 1.586809, 0.007736289, 0.5411765, 1, 0, 1,
-0.6739039, 0.2826299, -1.044382, 0.5372549, 1, 0, 1,
-0.6728831, -0.07707696, -3.01935, 0.5294118, 1, 0, 1,
-0.6703801, 2.256097, -0.02523816, 0.5254902, 1, 0, 1,
-0.6702813, -0.7735881, -4.707055, 0.5176471, 1, 0, 1,
-0.6700096, -1.313921, -2.100986, 0.5137255, 1, 0, 1,
-0.6595963, -0.595893, -2.21619, 0.5058824, 1, 0, 1,
-0.659582, 0.2372988, -1.610872, 0.5019608, 1, 0, 1,
-0.6531554, 1.006549, 0.5423408, 0.4941176, 1, 0, 1,
-0.6523139, -0.4365864, -1.070984, 0.4862745, 1, 0, 1,
-0.6384487, -1.404455, -3.280371, 0.4823529, 1, 0, 1,
-0.6340854, -0.6618571, -2.978649, 0.4745098, 1, 0, 1,
-0.6313401, -0.5495681, -1.862043, 0.4705882, 1, 0, 1,
-0.6274184, 0.8806797, 0.3942183, 0.4627451, 1, 0, 1,
-0.6171034, -0.3895531, -1.3432, 0.4588235, 1, 0, 1,
-0.6166745, 0.003437342, -1.538193, 0.4509804, 1, 0, 1,
-0.6132557, 1.616844, -0.5273014, 0.4470588, 1, 0, 1,
-0.6118007, -0.2705464, -1.804584, 0.4392157, 1, 0, 1,
-0.6074157, 0.01409563, -1.481423, 0.4352941, 1, 0, 1,
-0.6068627, 0.9629194, -0.06973516, 0.427451, 1, 0, 1,
-0.6004919, 1.530492, 0.1074858, 0.4235294, 1, 0, 1,
-0.5962359, -1.53691, -3.485675, 0.4156863, 1, 0, 1,
-0.5954943, 1.223715, -1.84252, 0.4117647, 1, 0, 1,
-0.5946772, 0.2377048, -1.432513, 0.4039216, 1, 0, 1,
-0.5912918, -1.397583, -3.199205, 0.3960784, 1, 0, 1,
-0.585744, 0.5360399, -1.101562, 0.3921569, 1, 0, 1,
-0.5857138, 1.706212, -0.7506558, 0.3843137, 1, 0, 1,
-0.585592, 0.524395, -0.8224851, 0.3803922, 1, 0, 1,
-0.5822764, -1.139193, -0.72457, 0.372549, 1, 0, 1,
-0.5781543, -2.358675, -3.313098, 0.3686275, 1, 0, 1,
-0.577616, -0.3838859, -1.331957, 0.3607843, 1, 0, 1,
-0.5732843, -1.435778, -4.040779, 0.3568628, 1, 0, 1,
-0.5654253, -0.9996449, -2.563351, 0.3490196, 1, 0, 1,
-0.5626085, 2.768201, 2.202995, 0.345098, 1, 0, 1,
-0.562409, -1.259404, -3.44237, 0.3372549, 1, 0, 1,
-0.5572115, -0.2144528, -1.223089, 0.3333333, 1, 0, 1,
-0.549885, 0.7605384, -0.5744861, 0.3254902, 1, 0, 1,
-0.5469573, -1.195411, -1.71332, 0.3215686, 1, 0, 1,
-0.5447909, 0.006697882, -2.581301, 0.3137255, 1, 0, 1,
-0.5298322, -0.1640097, -2.421944, 0.3098039, 1, 0, 1,
-0.5283988, 0.913826, 1.431698, 0.3019608, 1, 0, 1,
-0.527129, 1.489713, -2.052398, 0.2941177, 1, 0, 1,
-0.5268266, -1.04699, -1.888477, 0.2901961, 1, 0, 1,
-0.5235708, 1.050943, -1.624773, 0.282353, 1, 0, 1,
-0.5195705, 1.80083, -1.646678, 0.2784314, 1, 0, 1,
-0.5151328, 0.7406461, -1.552245, 0.2705882, 1, 0, 1,
-0.5140429, -0.5390149, -1.900303, 0.2666667, 1, 0, 1,
-0.5134023, 1.371582, -0.8856531, 0.2588235, 1, 0, 1,
-0.5070668, -0.1504935, -2.332706, 0.254902, 1, 0, 1,
-0.5068896, -0.721484, -3.851242, 0.2470588, 1, 0, 1,
-0.5016779, 1.2156, 0.1192572, 0.2431373, 1, 0, 1,
-0.4942473, -2.038473, -3.985936, 0.2352941, 1, 0, 1,
-0.4915302, -1.761123, -2.417128, 0.2313726, 1, 0, 1,
-0.4913313, 0.7047495, -0.1376586, 0.2235294, 1, 0, 1,
-0.4884914, 0.5631601, -0.3098081, 0.2196078, 1, 0, 1,
-0.486899, 1.492936, -1.064898, 0.2117647, 1, 0, 1,
-0.4814485, 2.287124, 0.4388113, 0.2078431, 1, 0, 1,
-0.471237, 1.657765, 0.9142963, 0.2, 1, 0, 1,
-0.4710797, -0.05291323, -0.5844607, 0.1921569, 1, 0, 1,
-0.4686601, 0.3808785, -0.9252346, 0.1882353, 1, 0, 1,
-0.4674485, 0.2904557, -0.1590977, 0.1803922, 1, 0, 1,
-0.4673362, -0.2796081, -2.528738, 0.1764706, 1, 0, 1,
-0.46722, 1.047136, 0.3725953, 0.1686275, 1, 0, 1,
-0.4670466, -0.4990036, -1.932629, 0.1647059, 1, 0, 1,
-0.4667908, -3.633207, -2.13254, 0.1568628, 1, 0, 1,
-0.4588519, 0.9557586, -0.2495712, 0.1529412, 1, 0, 1,
-0.4584028, 0.02666581, -1.546915, 0.145098, 1, 0, 1,
-0.4471209, 0.7944815, -0.5400166, 0.1411765, 1, 0, 1,
-0.4413006, -0.8846551, -2.086244, 0.1333333, 1, 0, 1,
-0.4402778, -0.9235088, -1.279937, 0.1294118, 1, 0, 1,
-0.4301057, 0.4672174, 1.628767, 0.1215686, 1, 0, 1,
-0.4296269, 1.788497, -1.849226, 0.1176471, 1, 0, 1,
-0.4256135, -1.218862, -1.86207, 0.1098039, 1, 0, 1,
-0.4254322, -0.1572417, -0.7544654, 0.1058824, 1, 0, 1,
-0.4252426, -0.5446908, -2.301365, 0.09803922, 1, 0, 1,
-0.4198477, -0.09922104, -1.310792, 0.09019608, 1, 0, 1,
-0.418512, -0.7022346, -0.7438206, 0.08627451, 1, 0, 1,
-0.4157041, -0.7370949, -2.600699, 0.07843138, 1, 0, 1,
-0.405596, -0.2195583, -1.198108, 0.07450981, 1, 0, 1,
-0.4045277, 0.7314534, 0.1164555, 0.06666667, 1, 0, 1,
-0.4013325, 1.065349, 1.122305, 0.0627451, 1, 0, 1,
-0.3997269, 0.07424303, -0.2301035, 0.05490196, 1, 0, 1,
-0.3973781, -0.6428193, -0.4003996, 0.05098039, 1, 0, 1,
-0.3964784, -0.1501872, -0.9862642, 0.04313726, 1, 0, 1,
-0.3947158, 1.175882, -0.3367604, 0.03921569, 1, 0, 1,
-0.392384, -1.287657, -3.050483, 0.03137255, 1, 0, 1,
-0.3899972, 0.05352247, -1.525508, 0.02745098, 1, 0, 1,
-0.3885664, -0.7366272, -2.751437, 0.01960784, 1, 0, 1,
-0.386789, -1.169809, -2.783756, 0.01568628, 1, 0, 1,
-0.3850779, -2.10126, -1.702572, 0.007843138, 1, 0, 1,
-0.3819421, 1.665686, 0.9511129, 0.003921569, 1, 0, 1,
-0.3804238, -0.1331395, -0.5524477, 0, 1, 0.003921569, 1,
-0.3782777, 0.6571344, -1.594333, 0, 1, 0.01176471, 1,
-0.3763841, 0.981783, 1.169538, 0, 1, 0.01568628, 1,
-0.3756767, 0.2652721, -1.596008, 0, 1, 0.02352941, 1,
-0.3703284, 1.352499, -0.7786496, 0, 1, 0.02745098, 1,
-0.3681296, 0.2914091, -1.668411, 0, 1, 0.03529412, 1,
-0.36746, 1.144166, 1.816141, 0, 1, 0.03921569, 1,
-0.3664946, -0.7849257, -2.129747, 0, 1, 0.04705882, 1,
-0.3617984, 1.35321, -0.3731765, 0, 1, 0.05098039, 1,
-0.3601356, -1.600281, -4.130426, 0, 1, 0.05882353, 1,
-0.3598499, -0.3235367, -4.629408, 0, 1, 0.0627451, 1,
-0.358973, -1.094921, -3.078888, 0, 1, 0.07058824, 1,
-0.3485429, 0.5603371, -0.4171223, 0, 1, 0.07450981, 1,
-0.3461176, 1.06518, -1.678433, 0, 1, 0.08235294, 1,
-0.3443435, 0.9172054, 1.331628, 0, 1, 0.08627451, 1,
-0.33888, -0.9374524, -1.764654, 0, 1, 0.09411765, 1,
-0.337675, 0.005145586, -1.638033, 0, 1, 0.1019608, 1,
-0.3359632, 0.7258599, 0.01828488, 0, 1, 0.1058824, 1,
-0.3359297, -0.5789035, -1.189897, 0, 1, 0.1137255, 1,
-0.3305928, -0.6266462, -2.339417, 0, 1, 0.1176471, 1,
-0.3299525, 0.008601991, -1.20305, 0, 1, 0.1254902, 1,
-0.3255925, 0.7441183, -1.469595, 0, 1, 0.1294118, 1,
-0.3241999, 0.06883302, -3.089947, 0, 1, 0.1372549, 1,
-0.3176555, 0.8869798, -2.260767, 0, 1, 0.1411765, 1,
-0.3138562, -0.257188, -4.052201, 0, 1, 0.1490196, 1,
-0.3130021, 0.1582727, -1.803035, 0, 1, 0.1529412, 1,
-0.3112404, -0.3664183, -0.09840923, 0, 1, 0.1607843, 1,
-0.3112158, 1.052252, -0.05933834, 0, 1, 0.1647059, 1,
-0.3098115, 0.209353, -1.068199, 0, 1, 0.172549, 1,
-0.307943, 0.668561, -0.4460195, 0, 1, 0.1764706, 1,
-0.3062395, 0.8927221, -0.1874461, 0, 1, 0.1843137, 1,
-0.3024802, -0.6839908, -2.002482, 0, 1, 0.1882353, 1,
-0.2981979, -1.068556, -0.9719346, 0, 1, 0.1960784, 1,
-0.2975369, 1.262552, -1.533418, 0, 1, 0.2039216, 1,
-0.2948717, -0.4495145, -2.559371, 0, 1, 0.2078431, 1,
-0.2937797, 0.4559899, -0.8175709, 0, 1, 0.2156863, 1,
-0.2932225, 1.205417, -0.8133773, 0, 1, 0.2196078, 1,
-0.2877179, -1.391687, -2.746945, 0, 1, 0.227451, 1,
-0.2869991, -0.06703838, -2.405235, 0, 1, 0.2313726, 1,
-0.2847477, 0.04100546, -1.955399, 0, 1, 0.2392157, 1,
-0.2833723, -0.05376624, -2.216022, 0, 1, 0.2431373, 1,
-0.279376, -2.113665, -3.898507, 0, 1, 0.2509804, 1,
-0.2748854, -0.2379937, -2.327173, 0, 1, 0.254902, 1,
-0.2748689, 1.635184, -0.2062379, 0, 1, 0.2627451, 1,
-0.2744971, 0.01160396, -2.046855, 0, 1, 0.2666667, 1,
-0.2612165, 2.175887, -1.64623, 0, 1, 0.2745098, 1,
-0.2552884, -1.700057, -3.251782, 0, 1, 0.2784314, 1,
-0.2514981, -1.019788, -4.164362, 0, 1, 0.2862745, 1,
-0.2495326, 1.097767, -0.7961209, 0, 1, 0.2901961, 1,
-0.2493907, 0.8837116, 0.623453, 0, 1, 0.2980392, 1,
-0.2484167, -0.8173583, -2.463729, 0, 1, 0.3058824, 1,
-0.2473863, 1.531199, -1.140393, 0, 1, 0.3098039, 1,
-0.2471008, -0.7779547, -2.298231, 0, 1, 0.3176471, 1,
-0.2420829, 0.3883193, -0.4428633, 0, 1, 0.3215686, 1,
-0.2415864, -2.413296, -2.874946, 0, 1, 0.3294118, 1,
-0.2413833, -1.342359, -2.309466, 0, 1, 0.3333333, 1,
-0.2400007, -0.1027781, -2.131905, 0, 1, 0.3411765, 1,
-0.2378512, 1.465249, 0.2664654, 0, 1, 0.345098, 1,
-0.2374821, 0.4166635, -2.842303, 0, 1, 0.3529412, 1,
-0.2359019, -1.094867, -1.952291, 0, 1, 0.3568628, 1,
-0.2339429, -0.1041247, -2.316487, 0, 1, 0.3647059, 1,
-0.2335617, -1.133356, -3.039434, 0, 1, 0.3686275, 1,
-0.2311231, 0.450549, 0.05682839, 0, 1, 0.3764706, 1,
-0.22805, -1.140401, -3.845956, 0, 1, 0.3803922, 1,
-0.2278626, 0.03689139, -0.2931513, 0, 1, 0.3882353, 1,
-0.2237931, 0.9888885, 1.152928, 0, 1, 0.3921569, 1,
-0.222379, 0.1646359, -0.1563, 0, 1, 0.4, 1,
-0.2213291, -0.003282808, -0.9037986, 0, 1, 0.4078431, 1,
-0.217685, -0.006274118, -0.2916774, 0, 1, 0.4117647, 1,
-0.2138584, 1.111388, -0.8262343, 0, 1, 0.4196078, 1,
-0.2121826, -1.431138, -2.481052, 0, 1, 0.4235294, 1,
-0.2085292, -1.359494, -2.108747, 0, 1, 0.4313726, 1,
-0.208249, 0.5183616, -1.203005, 0, 1, 0.4352941, 1,
-0.2072928, 1.410195, 0.6129001, 0, 1, 0.4431373, 1,
-0.2065158, -0.1537347, -2.98753, 0, 1, 0.4470588, 1,
-0.205181, 0.1480901, -1.927457, 0, 1, 0.454902, 1,
-0.2034607, -0.737191, -3.46346, 0, 1, 0.4588235, 1,
-0.2026875, 0.8403834, 1.321792, 0, 1, 0.4666667, 1,
-0.2020262, 0.03113068, -0.1221662, 0, 1, 0.4705882, 1,
-0.1973895, 1.157808, -1.345311, 0, 1, 0.4784314, 1,
-0.1960113, 0.2255305, -0.718891, 0, 1, 0.4823529, 1,
-0.1957323, -0.4778616, -2.909301, 0, 1, 0.4901961, 1,
-0.1941074, -1.839403, -2.553069, 0, 1, 0.4941176, 1,
-0.1921505, -0.01369736, -2.919168, 0, 1, 0.5019608, 1,
-0.1916219, -1.182936, -2.738025, 0, 1, 0.509804, 1,
-0.1904956, 0.3954833, -1.482335, 0, 1, 0.5137255, 1,
-0.1875801, -0.3081006, -2.94467, 0, 1, 0.5215687, 1,
-0.1869125, -1.207326, -4.669686, 0, 1, 0.5254902, 1,
-0.1853087, -0.5219567, -0.4629968, 0, 1, 0.5333334, 1,
-0.1833032, -0.2204003, -3.317583, 0, 1, 0.5372549, 1,
-0.1818209, 0.4588798, -1.689139, 0, 1, 0.5450981, 1,
-0.1815792, 1.407169, 0.3381478, 0, 1, 0.5490196, 1,
-0.179866, 1.328925, -1.079138, 0, 1, 0.5568628, 1,
-0.1749528, -0.05401409, -0.8669051, 0, 1, 0.5607843, 1,
-0.1722703, -0.002258955, -2.889986, 0, 1, 0.5686275, 1,
-0.1704801, 0.4650418, 1.389793, 0, 1, 0.572549, 1,
-0.1662683, 0.6520557, 0.5360619, 0, 1, 0.5803922, 1,
-0.1648685, 0.5103348, -0.2755019, 0, 1, 0.5843138, 1,
-0.1626533, -0.5457504, -2.516773, 0, 1, 0.5921569, 1,
-0.1617897, -2.186217, -2.922077, 0, 1, 0.5960785, 1,
-0.1596583, 2.354987, -0.3049014, 0, 1, 0.6039216, 1,
-0.1585856, -0.6806355, -3.470466, 0, 1, 0.6117647, 1,
-0.1542788, -0.4058098, -3.15574, 0, 1, 0.6156863, 1,
-0.1499934, 0.5065919, -0.02901272, 0, 1, 0.6235294, 1,
-0.1495183, 0.4842645, 0.04512045, 0, 1, 0.627451, 1,
-0.1461684, -0.1201697, -2.981342, 0, 1, 0.6352941, 1,
-0.1412796, 1.136263, -0.775628, 0, 1, 0.6392157, 1,
-0.1381956, 0.7290126, 0.6568369, 0, 1, 0.6470588, 1,
-0.1371693, 0.428688, -2.098677, 0, 1, 0.6509804, 1,
-0.1346701, 0.3780749, 0.1259474, 0, 1, 0.6588235, 1,
-0.1327352, 0.2490969, -1.539643, 0, 1, 0.6627451, 1,
-0.1313132, -0.8917934, -2.124054, 0, 1, 0.6705883, 1,
-0.1271478, -0.01336389, -2.891707, 0, 1, 0.6745098, 1,
-0.126903, -1.200765, -2.757743, 0, 1, 0.682353, 1,
-0.126368, -1.092048, -2.694772, 0, 1, 0.6862745, 1,
-0.1249488, -0.2692993, -4.565672, 0, 1, 0.6941177, 1,
-0.1228125, 1.018595, -1.876187, 0, 1, 0.7019608, 1,
-0.1172327, 0.2962932, -0.2144006, 0, 1, 0.7058824, 1,
-0.1168841, 0.510842, -1.730939, 0, 1, 0.7137255, 1,
-0.1133521, 0.2823901, 0.3771549, 0, 1, 0.7176471, 1,
-0.1128718, -2.516238, -2.847923, 0, 1, 0.7254902, 1,
-0.1128096, 0.06496795, -2.125694, 0, 1, 0.7294118, 1,
-0.1109607, -0.1873931, -3.25793, 0, 1, 0.7372549, 1,
-0.1098967, 0.1887161, -1.410543, 0, 1, 0.7411765, 1,
-0.1055897, -1.297906, -3.037477, 0, 1, 0.7490196, 1,
-0.1043833, -2.195182, -3.956814, 0, 1, 0.7529412, 1,
-0.09436197, -1.158816, -2.402003, 0, 1, 0.7607843, 1,
-0.09425155, -0.01615088, -1.791904, 0, 1, 0.7647059, 1,
-0.09330669, -0.3664874, -3.266374, 0, 1, 0.772549, 1,
-0.09251612, 1.191658, -0.8047285, 0, 1, 0.7764706, 1,
-0.09069163, -1.84607, -4.263454, 0, 1, 0.7843137, 1,
-0.09047213, -1.926007, -4.673975, 0, 1, 0.7882353, 1,
-0.0831389, 0.8948259, -0.1853091, 0, 1, 0.7960784, 1,
-0.07955161, 0.8779867, 0.07095353, 0, 1, 0.8039216, 1,
-0.0785386, 0.9961602, 0.5316713, 0, 1, 0.8078431, 1,
-0.07849265, 0.6450971, -0.4782299, 0, 1, 0.8156863, 1,
-0.07768601, 1.010782, -0.7428464, 0, 1, 0.8196079, 1,
-0.07465217, 0.07209972, -0.001800619, 0, 1, 0.827451, 1,
-0.07429308, 1.044977, 0.5848765, 0, 1, 0.8313726, 1,
-0.07402746, 0.1075814, 1.198877, 0, 1, 0.8392157, 1,
-0.06851844, -1.246993, -4.268938, 0, 1, 0.8431373, 1,
-0.06686942, 0.7239262, -1.199227, 0, 1, 0.8509804, 1,
-0.06642553, 0.9361445, 0.2867204, 0, 1, 0.854902, 1,
-0.0662986, -0.01136914, -0.2541619, 0, 1, 0.8627451, 1,
-0.06560494, -0.9049439, -4.037335, 0, 1, 0.8666667, 1,
-0.05690183, 1.716501, -1.019774, 0, 1, 0.8745098, 1,
-0.05380995, -0.07150264, -3.963139, 0, 1, 0.8784314, 1,
-0.05220234, 1.466656, 0.8352276, 0, 1, 0.8862745, 1,
-0.04945503, -0.9253978, -3.041, 0, 1, 0.8901961, 1,
-0.04655559, 1.265034, 0.8692334, 0, 1, 0.8980392, 1,
-0.04263531, -1.328742, -3.609034, 0, 1, 0.9058824, 1,
-0.03953503, -0.5051948, -0.7116534, 0, 1, 0.9098039, 1,
-0.03717431, -1.495316, -3.917531, 0, 1, 0.9176471, 1,
-0.03309939, -0.348689, -3.969727, 0, 1, 0.9215686, 1,
-0.03298817, 1.398668, 0.9841349, 0, 1, 0.9294118, 1,
-0.03268975, -0.5207068, -3.443058, 0, 1, 0.9333333, 1,
-0.03178846, 0.9573935, -1.073667, 0, 1, 0.9411765, 1,
-0.02810645, -0.9820002, -3.126225, 0, 1, 0.945098, 1,
-0.02089209, 0.1114462, 0.66351, 0, 1, 0.9529412, 1,
-0.01762858, 1.12259, -0.4181087, 0, 1, 0.9568627, 1,
-0.01335534, 0.8359224, 0.6953763, 0, 1, 0.9647059, 1,
-0.00660956, 0.1085758, -0.4253596, 0, 1, 0.9686275, 1,
-0.005077671, -1.122072, -4.225707, 0, 1, 0.9764706, 1,
-0.00422822, -2.188756, -3.899315, 0, 1, 0.9803922, 1,
-0.0009693443, -0.9321989, -3.902497, 0, 1, 0.9882353, 1,
-0.0004642006, -0.9843011, -3.97034, 0, 1, 0.9921569, 1,
0.0006325445, -0.1308926, 2.771956, 0, 1, 1, 1,
0.004241225, -1.106224, 4.969278, 0, 0.9921569, 1, 1,
0.006553735, -0.8229756, 3.72962, 0, 0.9882353, 1, 1,
0.008301653, 1.474348, 0.2855995, 0, 0.9803922, 1, 1,
0.01014283, 0.5067064, 1.047053, 0, 0.9764706, 1, 1,
0.01040222, 0.4902619, -0.2255996, 0, 0.9686275, 1, 1,
0.01101576, -1.186251, 2.279408, 0, 0.9647059, 1, 1,
0.0114832, -0.322092, 3.331818, 0, 0.9568627, 1, 1,
0.01456959, -0.06517693, 4.118722, 0, 0.9529412, 1, 1,
0.01563828, -0.08374596, 3.161474, 0, 0.945098, 1, 1,
0.01856943, -0.1261183, 3.45976, 0, 0.9411765, 1, 1,
0.02241823, 1.337533, 0.7556645, 0, 0.9333333, 1, 1,
0.02338653, 1.119266, 0.5486829, 0, 0.9294118, 1, 1,
0.02441062, -1.212121, 5.555576, 0, 0.9215686, 1, 1,
0.03080796, -1.417453, 2.376351, 0, 0.9176471, 1, 1,
0.03349399, 0.5092109, 1.989534, 0, 0.9098039, 1, 1,
0.03467144, -0.3432068, 4.301544, 0, 0.9058824, 1, 1,
0.03717285, 0.2627032, 0.6097813, 0, 0.8980392, 1, 1,
0.03909177, 0.3769791, -1.432064, 0, 0.8901961, 1, 1,
0.04133886, 1.726584, -0.1271437, 0, 0.8862745, 1, 1,
0.04513118, -0.09118077, 1.168689, 0, 0.8784314, 1, 1,
0.04556064, 0.6261036, -0.2556665, 0, 0.8745098, 1, 1,
0.04635092, -0.1953588, 2.614264, 0, 0.8666667, 1, 1,
0.04636013, 0.8061525, -1.27076, 0, 0.8627451, 1, 1,
0.05013781, 0.1588988, 0.9531341, 0, 0.854902, 1, 1,
0.05030392, 2.011347, -0.75123, 0, 0.8509804, 1, 1,
0.05601006, 2.19497, -0.346493, 0, 0.8431373, 1, 1,
0.05754257, -0.7662475, 4.170424, 0, 0.8392157, 1, 1,
0.05857512, 0.5032242, -1.577601, 0, 0.8313726, 1, 1,
0.0667301, -1.183206, 3.802832, 0, 0.827451, 1, 1,
0.06805863, 0.2647322, 0.8904404, 0, 0.8196079, 1, 1,
0.06976897, -0.464303, 3.552811, 0, 0.8156863, 1, 1,
0.07019188, -1.141917, 2.366668, 0, 0.8078431, 1, 1,
0.07095043, -0.8707247, 2.530416, 0, 0.8039216, 1, 1,
0.07571691, -0.1172046, 4.071288, 0, 0.7960784, 1, 1,
0.07573266, 0.196328, 0.6157522, 0, 0.7882353, 1, 1,
0.07689815, -1.889244, 3.126555, 0, 0.7843137, 1, 1,
0.08095071, 1.048839, -0.5039266, 0, 0.7764706, 1, 1,
0.08175516, -0.08768399, 2.166606, 0, 0.772549, 1, 1,
0.08927242, -0.5627285, 2.781154, 0, 0.7647059, 1, 1,
0.09605066, -1.646904, 1.989856, 0, 0.7607843, 1, 1,
0.0963082, 0.117428, 1.678074, 0, 0.7529412, 1, 1,
0.09656065, 1.621821, 0.6671634, 0, 0.7490196, 1, 1,
0.09678976, 2.092379, -0.2231348, 0, 0.7411765, 1, 1,
0.09793757, -0.2314114, 2.270491, 0, 0.7372549, 1, 1,
0.09879345, 0.6510233, 0.890735, 0, 0.7294118, 1, 1,
0.1015992, -0.3913525, 4.829507, 0, 0.7254902, 1, 1,
0.1017291, -0.4317745, 2.779795, 0, 0.7176471, 1, 1,
0.1040271, 0.8056592, 0.354365, 0, 0.7137255, 1, 1,
0.1062718, -1.150815, 2.769462, 0, 0.7058824, 1, 1,
0.1081619, -1.71868, 2.163944, 0, 0.6980392, 1, 1,
0.1101953, 1.032633, 1.754635, 0, 0.6941177, 1, 1,
0.1132032, 1.716885, -1.981718, 0, 0.6862745, 1, 1,
0.1153312, -0.7160144, 3.458986, 0, 0.682353, 1, 1,
0.1322829, 1.369116, 1.815646, 0, 0.6745098, 1, 1,
0.1329866, -0.9587091, 5.318629, 0, 0.6705883, 1, 1,
0.135324, -0.5533754, 2.628966, 0, 0.6627451, 1, 1,
0.1371248, -0.5908738, 4.641007, 0, 0.6588235, 1, 1,
0.1390316, -3.011039, 3.258995, 0, 0.6509804, 1, 1,
0.1414467, -1.335352, 3.904834, 0, 0.6470588, 1, 1,
0.1416735, -1.58812, 2.913471, 0, 0.6392157, 1, 1,
0.1463018, 1.326752, -0.9716507, 0, 0.6352941, 1, 1,
0.1474557, -0.9129143, 5.389888, 0, 0.627451, 1, 1,
0.1498931, 0.3258812, 1.634637, 0, 0.6235294, 1, 1,
0.1537609, 0.3254774, 0.9529406, 0, 0.6156863, 1, 1,
0.1561837, -2.674227, 2.796474, 0, 0.6117647, 1, 1,
0.1594346, -0.9469969, 1.773347, 0, 0.6039216, 1, 1,
0.1598546, -1.265108, 4.30836, 0, 0.5960785, 1, 1,
0.1608819, -1.030813, 2.884126, 0, 0.5921569, 1, 1,
0.1612682, -0.04146824, 0.7902968, 0, 0.5843138, 1, 1,
0.1712088, 0.3488827, 0.6315845, 0, 0.5803922, 1, 1,
0.1720829, -0.3370402, 2.229235, 0, 0.572549, 1, 1,
0.176903, -1.014969, 2.380327, 0, 0.5686275, 1, 1,
0.1789701, -0.08591505, 2.518453, 0, 0.5607843, 1, 1,
0.1824954, -1.226332, 3.457887, 0, 0.5568628, 1, 1,
0.1835003, 0.3156146, 0.9578241, 0, 0.5490196, 1, 1,
0.1890502, 0.7280284, 1.498526, 0, 0.5450981, 1, 1,
0.1944381, -1.537608, 3.155423, 0, 0.5372549, 1, 1,
0.2008697, -0.2167675, 1.768659, 0, 0.5333334, 1, 1,
0.2065265, 1.518308, -0.1592417, 0, 0.5254902, 1, 1,
0.2067421, -0.1234084, 3.130923, 0, 0.5215687, 1, 1,
0.2096711, 0.9440382, 0.3583037, 0, 0.5137255, 1, 1,
0.2151203, -1.287516, 1.288844, 0, 0.509804, 1, 1,
0.2173411, 0.5733345, 0.9943382, 0, 0.5019608, 1, 1,
0.2210828, -0.730652, 3.50853, 0, 0.4941176, 1, 1,
0.2261307, 0.449275, 0.168927, 0, 0.4901961, 1, 1,
0.2370494, 1.572022, -0.3456643, 0, 0.4823529, 1, 1,
0.2392784, -1.666503, 0.6178008, 0, 0.4784314, 1, 1,
0.2393651, 1.005305, -0.3684694, 0, 0.4705882, 1, 1,
0.2399712, 1.406255, -0.2451979, 0, 0.4666667, 1, 1,
0.2403609, 1.34478, -0.3013921, 0, 0.4588235, 1, 1,
0.2419217, -0.5698286, 4.713996, 0, 0.454902, 1, 1,
0.2428025, 0.3129368, -0.4419593, 0, 0.4470588, 1, 1,
0.2437088, -1.348946, 3.255326, 0, 0.4431373, 1, 1,
0.2456259, 0.6827788, -0.2064396, 0, 0.4352941, 1, 1,
0.2486153, -0.3018447, 3.364582, 0, 0.4313726, 1, 1,
0.2516916, 1.009137, 0.5585793, 0, 0.4235294, 1, 1,
0.2556319, 1.612708, -0.6143633, 0, 0.4196078, 1, 1,
0.2588659, -2.048288, 2.927011, 0, 0.4117647, 1, 1,
0.2590165, 0.8331514, 2.22816, 0, 0.4078431, 1, 1,
0.2615885, -1.387397, 3.721582, 0, 0.4, 1, 1,
0.262108, 0.8489822, -0.7525232, 0, 0.3921569, 1, 1,
0.2672184, 1.908177, -0.6896101, 0, 0.3882353, 1, 1,
0.2673704, 0.09952612, 1.059918, 0, 0.3803922, 1, 1,
0.2747107, 1.36691, 0.7251273, 0, 0.3764706, 1, 1,
0.276429, -0.05916843, 2.107417, 0, 0.3686275, 1, 1,
0.2775568, 0.3006535, 2.041016, 0, 0.3647059, 1, 1,
0.279137, -0.2999858, 2.657627, 0, 0.3568628, 1, 1,
0.2792439, -0.8683745, 4.719926, 0, 0.3529412, 1, 1,
0.2795451, -2.640103, 3.189054, 0, 0.345098, 1, 1,
0.2823104, 1.447378, -1.553627, 0, 0.3411765, 1, 1,
0.2835793, 0.7163637, -1.024978, 0, 0.3333333, 1, 1,
0.2862461, -1.223623, 1.98574, 0, 0.3294118, 1, 1,
0.2876835, -0.8352438, 2.617109, 0, 0.3215686, 1, 1,
0.2886924, -1.60534, 3.38361, 0, 0.3176471, 1, 1,
0.2896259, -0.05322873, 0.1987435, 0, 0.3098039, 1, 1,
0.2904281, -1.547837, 1.946274, 0, 0.3058824, 1, 1,
0.2911096, -1.411374, 3.575896, 0, 0.2980392, 1, 1,
0.2919989, -0.0143818, -0.2245795, 0, 0.2901961, 1, 1,
0.2950579, -0.7019715, 1.925699, 0, 0.2862745, 1, 1,
0.3027814, 0.8299667, 0.3715382, 0, 0.2784314, 1, 1,
0.3047032, 0.3472045, -0.3940102, 0, 0.2745098, 1, 1,
0.3082729, 0.08586154, 1.52091, 0, 0.2666667, 1, 1,
0.3117672, 0.9546613, 0.9805204, 0, 0.2627451, 1, 1,
0.3160401, -1.456879, 2.927198, 0, 0.254902, 1, 1,
0.3162359, 1.46305, -0.05645756, 0, 0.2509804, 1, 1,
0.3204028, -0.3850465, 3.191274, 0, 0.2431373, 1, 1,
0.32447, 0.1796523, -0.2429048, 0, 0.2392157, 1, 1,
0.3257213, 0.01174094, 2.805449, 0, 0.2313726, 1, 1,
0.3361021, 1.431768, -0.6701614, 0, 0.227451, 1, 1,
0.337277, 0.3964714, 0.3551895, 0, 0.2196078, 1, 1,
0.3375751, -0.5565096, 2.787278, 0, 0.2156863, 1, 1,
0.3377714, -0.7333673, 1.550996, 0, 0.2078431, 1, 1,
0.3472273, -0.008151603, 0.2671737, 0, 0.2039216, 1, 1,
0.3483905, 0.2599269, 2.664103, 0, 0.1960784, 1, 1,
0.3557167, -0.1006128, 1.484143, 0, 0.1882353, 1, 1,
0.3599712, -0.5861254, 2.45431, 0, 0.1843137, 1, 1,
0.3602337, 0.1911645, 2.059776, 0, 0.1764706, 1, 1,
0.3626232, -1.47502, 4.617053, 0, 0.172549, 1, 1,
0.3628175, -0.611262, 1.773308, 0, 0.1647059, 1, 1,
0.3628609, 1.044558, 0.3491068, 0, 0.1607843, 1, 1,
0.3630037, -0.4431705, 1.802524, 0, 0.1529412, 1, 1,
0.3630569, 0.1199386, 0.5371359, 0, 0.1490196, 1, 1,
0.3645399, -0.3373023, 2.708878, 0, 0.1411765, 1, 1,
0.3720026, -0.4781619, 2.971408, 0, 0.1372549, 1, 1,
0.3726612, 0.4744884, -0.4790572, 0, 0.1294118, 1, 1,
0.3745563, 1.044676, 0.4135244, 0, 0.1254902, 1, 1,
0.3756339, 1.138366, -0.1828995, 0, 0.1176471, 1, 1,
0.3758447, 0.6190017, 3.308767, 0, 0.1137255, 1, 1,
0.376856, -0.1076181, 1.989154, 0, 0.1058824, 1, 1,
0.3796527, -0.8593513, 5.01001, 0, 0.09803922, 1, 1,
0.3799024, -0.6116162, 4.576539, 0, 0.09411765, 1, 1,
0.3842529, 2.032991, 1.588518, 0, 0.08627451, 1, 1,
0.3920363, 0.2343205, 1.376519, 0, 0.08235294, 1, 1,
0.3920686, 1.049545, 1.04266, 0, 0.07450981, 1, 1,
0.394388, 0.0008508069, -0.2444261, 0, 0.07058824, 1, 1,
0.3950766, 0.2892556, -0.8798875, 0, 0.0627451, 1, 1,
0.3952557, -0.0201976, 0.7999102, 0, 0.05882353, 1, 1,
0.400644, -0.2545954, 2.144528, 0, 0.05098039, 1, 1,
0.4008831, 1.422204, 0.7745789, 0, 0.04705882, 1, 1,
0.405074, -0.1237711, 1.790333, 0, 0.03921569, 1, 1,
0.406504, -0.8079444, 2.993118, 0, 0.03529412, 1, 1,
0.4068066, 1.165697, 1.263012, 0, 0.02745098, 1, 1,
0.4109559, -1.002941, 2.03544, 0, 0.02352941, 1, 1,
0.4120595, -1.56507, 1.530388, 0, 0.01568628, 1, 1,
0.4154724, -1.63359, 3.674008, 0, 0.01176471, 1, 1,
0.4230928, 0.002255745, 0.5414963, 0, 0.003921569, 1, 1,
0.4235643, -0.192223, 2.306982, 0.003921569, 0, 1, 1,
0.4247661, -0.4161776, 2.654887, 0.007843138, 0, 1, 1,
0.4309426, 1.149705, 0.8408251, 0.01568628, 0, 1, 1,
0.4377457, 0.2259519, 1.363421, 0.01960784, 0, 1, 1,
0.440148, -0.9084796, 3.557768, 0.02745098, 0, 1, 1,
0.4412303, 0.06084424, 1.023621, 0.03137255, 0, 1, 1,
0.4440424, -0.2187325, 2.182255, 0.03921569, 0, 1, 1,
0.4458653, 2.747334, -0.01960416, 0.04313726, 0, 1, 1,
0.4465963, 0.1235908, 1.440256, 0.05098039, 0, 1, 1,
0.4478374, -1.689776, 4.143716, 0.05490196, 0, 1, 1,
0.4480011, 0.5519907, -0.2880393, 0.0627451, 0, 1, 1,
0.4487428, -0.4046187, 0.6021429, 0.06666667, 0, 1, 1,
0.4488927, -0.2561171, 0.5237647, 0.07450981, 0, 1, 1,
0.4533254, -0.751513, 2.167283, 0.07843138, 0, 1, 1,
0.4540862, -1.180737, 2.235685, 0.08627451, 0, 1, 1,
0.4545428, 0.3903497, 0.669263, 0.09019608, 0, 1, 1,
0.4585605, -0.8653805, 1.904034, 0.09803922, 0, 1, 1,
0.459549, 0.5986181, 0.8990553, 0.1058824, 0, 1, 1,
0.4600254, 0.3037676, 0.5732777, 0.1098039, 0, 1, 1,
0.4630893, -0.7603796, 1.485595, 0.1176471, 0, 1, 1,
0.4675865, 0.3983952, 1.549969, 0.1215686, 0, 1, 1,
0.4699894, 1.073851, 0.7224044, 0.1294118, 0, 1, 1,
0.4707483, 0.4242001, -0.4638374, 0.1333333, 0, 1, 1,
0.4740705, 0.669424, 0.8459519, 0.1411765, 0, 1, 1,
0.4763142, -0.8929881, 1.334754, 0.145098, 0, 1, 1,
0.4779098, 0.9754601, -0.9762203, 0.1529412, 0, 1, 1,
0.4798814, 0.9642915, -0.5228406, 0.1568628, 0, 1, 1,
0.4848861, -0.5435998, 1.804125, 0.1647059, 0, 1, 1,
0.4863085, -1.044442, 2.197367, 0.1686275, 0, 1, 1,
0.4914135, 0.676204, 1.201087, 0.1764706, 0, 1, 1,
0.4919374, 1.54919, -0.688377, 0.1803922, 0, 1, 1,
0.4939097, 0.1022936, 1.015386, 0.1882353, 0, 1, 1,
0.4954156, -1.020263, 2.216423, 0.1921569, 0, 1, 1,
0.4957411, 0.2356285, 1.759585, 0.2, 0, 1, 1,
0.501296, 0.175303, 2.982586, 0.2078431, 0, 1, 1,
0.5062489, -0.8181828, 2.173519, 0.2117647, 0, 1, 1,
0.5103557, 0.5100198, 0.9083368, 0.2196078, 0, 1, 1,
0.5134674, -1.608418, 2.371858, 0.2235294, 0, 1, 1,
0.5167281, -0.8313744, 3.557471, 0.2313726, 0, 1, 1,
0.5180055, 0.6103618, 2.960228, 0.2352941, 0, 1, 1,
0.5194667, -1.01644, 3.901519, 0.2431373, 0, 1, 1,
0.5231245, 0.9595563, 0.3147198, 0.2470588, 0, 1, 1,
0.5255765, 0.3849937, -0.8903521, 0.254902, 0, 1, 1,
0.5299745, -0.4704176, 1.262052, 0.2588235, 0, 1, 1,
0.5301362, 0.3074676, 2.088004, 0.2666667, 0, 1, 1,
0.5307406, -0.5170948, 1.386057, 0.2705882, 0, 1, 1,
0.5352164, 0.1989688, 0.9819076, 0.2784314, 0, 1, 1,
0.536752, 1.518087, 1.305144, 0.282353, 0, 1, 1,
0.5375055, 0.0506319, 1.705287, 0.2901961, 0, 1, 1,
0.5412617, -1.736887, 1.539606, 0.2941177, 0, 1, 1,
0.5494666, -1.763662, 3.162783, 0.3019608, 0, 1, 1,
0.5525627, -0.3051722, 2.691812, 0.3098039, 0, 1, 1,
0.5531098, 0.1556769, 1.047426, 0.3137255, 0, 1, 1,
0.5540454, 0.252353, -0.3449419, 0.3215686, 0, 1, 1,
0.5567456, 0.6020849, 1.578695, 0.3254902, 0, 1, 1,
0.5575015, -0.8799228, 3.179122, 0.3333333, 0, 1, 1,
0.5581363, -0.8510989, 2.687773, 0.3372549, 0, 1, 1,
0.5646216, 1.247376, 2.021354, 0.345098, 0, 1, 1,
0.5690027, 0.6439615, -1.056684, 0.3490196, 0, 1, 1,
0.5719772, 0.2140675, 2.795865, 0.3568628, 0, 1, 1,
0.5754788, 1.023764, -0.05992926, 0.3607843, 0, 1, 1,
0.5777228, 1.268802, 1.343583, 0.3686275, 0, 1, 1,
0.5792105, 0.8560577, 0.03972216, 0.372549, 0, 1, 1,
0.5805094, 0.4709389, 0.7553686, 0.3803922, 0, 1, 1,
0.5813976, -0.6582798, 1.908234, 0.3843137, 0, 1, 1,
0.5817485, 0.1385815, 1.576806, 0.3921569, 0, 1, 1,
0.5826592, -0.3495053, 3.033125, 0.3960784, 0, 1, 1,
0.5833584, -0.3311599, 1.3687, 0.4039216, 0, 1, 1,
0.5844464, -0.6171283, 2.172878, 0.4117647, 0, 1, 1,
0.5970408, 0.3220982, 0.2033177, 0.4156863, 0, 1, 1,
0.5979863, 0.1144357, 3.829376, 0.4235294, 0, 1, 1,
0.5982128, -0.3719908, 2.426835, 0.427451, 0, 1, 1,
0.6000003, -0.6686804, 4.201955, 0.4352941, 0, 1, 1,
0.6020687, -0.1527625, 1.259316, 0.4392157, 0, 1, 1,
0.6055099, -1.282037, 1.474077, 0.4470588, 0, 1, 1,
0.6057631, -0.8075463, 1.982685, 0.4509804, 0, 1, 1,
0.6077984, -0.1443662, 2.081033, 0.4588235, 0, 1, 1,
0.6134875, 0.502416, 0.84339, 0.4627451, 0, 1, 1,
0.6201476, -1.441449, 4.294966, 0.4705882, 0, 1, 1,
0.6257284, -0.5015082, 2.398103, 0.4745098, 0, 1, 1,
0.6272864, -0.3763624, 0.9947478, 0.4823529, 0, 1, 1,
0.627405, -1.264771, 3.825449, 0.4862745, 0, 1, 1,
0.6334028, -0.2746531, 2.024587, 0.4941176, 0, 1, 1,
0.6344284, 0.09513398, 3.243489, 0.5019608, 0, 1, 1,
0.6414422, 0.04661873, 1.331329, 0.5058824, 0, 1, 1,
0.6427485, 0.4662708, 1.752041, 0.5137255, 0, 1, 1,
0.6452463, 0.5710135, 1.849143, 0.5176471, 0, 1, 1,
0.6474485, 0.1937117, 2.116934, 0.5254902, 0, 1, 1,
0.647944, -1.045753, 3.665724, 0.5294118, 0, 1, 1,
0.6500526, 0.5295805, 1.11828, 0.5372549, 0, 1, 1,
0.6511987, 0.1434461, 0.7422935, 0.5411765, 0, 1, 1,
0.6545959, 0.9277478, -0.3120011, 0.5490196, 0, 1, 1,
0.6564369, 2.128828, 0.1908624, 0.5529412, 0, 1, 1,
0.6623826, -0.9197998, 2.8516, 0.5607843, 0, 1, 1,
0.6635326, 1.46631, 2.546882, 0.5647059, 0, 1, 1,
0.6691239, 0.6221195, -0.4407495, 0.572549, 0, 1, 1,
0.6782643, -0.3691258, 1.582055, 0.5764706, 0, 1, 1,
0.6855147, -0.4627313, 1.728073, 0.5843138, 0, 1, 1,
0.688005, 0.2035728, 3.23175, 0.5882353, 0, 1, 1,
0.688201, 0.2825439, 1.825816, 0.5960785, 0, 1, 1,
0.6889418, 0.6069278, -0.8302935, 0.6039216, 0, 1, 1,
0.6909606, -1.065234, 2.151133, 0.6078432, 0, 1, 1,
0.7010152, 1.28391, -0.933803, 0.6156863, 0, 1, 1,
0.7013408, 0.5120173, -0.8108335, 0.6196079, 0, 1, 1,
0.7040807, 0.6396175, -0.9064795, 0.627451, 0, 1, 1,
0.707981, -0.8529019, 1.457203, 0.6313726, 0, 1, 1,
0.711189, 0.5881563, 0.8524562, 0.6392157, 0, 1, 1,
0.7118377, 1.380645, -0.1560692, 0.6431373, 0, 1, 1,
0.7187504, -0.172505, 1.821676, 0.6509804, 0, 1, 1,
0.7205194, -0.4171104, 2.213663, 0.654902, 0, 1, 1,
0.7214302, 1.256725, -1.414505, 0.6627451, 0, 1, 1,
0.723797, -0.560762, 1.32511, 0.6666667, 0, 1, 1,
0.7278138, -2.22998, 2.8212, 0.6745098, 0, 1, 1,
0.7278874, 0.3552435, 0.5314323, 0.6784314, 0, 1, 1,
0.7291963, -1.064973, 1.873739, 0.6862745, 0, 1, 1,
0.731821, -0.9959466, 2.295213, 0.6901961, 0, 1, 1,
0.7332266, 1.187842, 1.672142, 0.6980392, 0, 1, 1,
0.7380667, 0.869454, 0.9493501, 0.7058824, 0, 1, 1,
0.7426918, -0.7357731, 4.315398, 0.7098039, 0, 1, 1,
0.7428052, -0.5840933, 0.7273062, 0.7176471, 0, 1, 1,
0.743915, -1.221305, 2.347034, 0.7215686, 0, 1, 1,
0.7604494, -0.1625626, 2.859248, 0.7294118, 0, 1, 1,
0.7623596, -0.05036722, 2.510497, 0.7333333, 0, 1, 1,
0.7650175, -0.4388604, 2.220392, 0.7411765, 0, 1, 1,
0.773033, -0.7356312, 2.561592, 0.7450981, 0, 1, 1,
0.7818777, 0.3848011, -0.5541688, 0.7529412, 0, 1, 1,
0.7839417, 0.1021162, 0.6235035, 0.7568628, 0, 1, 1,
0.7860239, -1.435533, 3.598406, 0.7647059, 0, 1, 1,
0.8023241, -0.9282979, 3.268929, 0.7686275, 0, 1, 1,
0.8046957, 1.718224, -0.5192283, 0.7764706, 0, 1, 1,
0.8057059, 0.2987965, 1.996429, 0.7803922, 0, 1, 1,
0.8057985, -0.1598823, 1.200715, 0.7882353, 0, 1, 1,
0.8065735, 2.201983, -1.524501, 0.7921569, 0, 1, 1,
0.8075016, -0.8498236, 2.218158, 0.8, 0, 1, 1,
0.8093441, 1.319821, 1.38933, 0.8078431, 0, 1, 1,
0.8116928, -0.04173984, 1.398907, 0.8117647, 0, 1, 1,
0.8183755, 0.202997, 1.559727, 0.8196079, 0, 1, 1,
0.82032, -1.133044, 3.278061, 0.8235294, 0, 1, 1,
0.8235112, 0.7671364, 1.459208, 0.8313726, 0, 1, 1,
0.8261628, 1.794957, -0.3997417, 0.8352941, 0, 1, 1,
0.8273857, 1.248511, 1.22882, 0.8431373, 0, 1, 1,
0.829073, -0.5757263, 3.853669, 0.8470588, 0, 1, 1,
0.8309676, -0.2587963, 1.752658, 0.854902, 0, 1, 1,
0.8356473, 1.220366, 2.214617, 0.8588235, 0, 1, 1,
0.8369451, -0.6327513, 3.627106, 0.8666667, 0, 1, 1,
0.8419766, -0.5026448, 1.901145, 0.8705882, 0, 1, 1,
0.8445781, -0.3316748, 1.417816, 0.8784314, 0, 1, 1,
0.8451282, 2.35157, 0.0665428, 0.8823529, 0, 1, 1,
0.8499032, -0.3499476, 1.235819, 0.8901961, 0, 1, 1,
0.850906, 0.6035056, 1.435724, 0.8941177, 0, 1, 1,
0.8534341, 1.425792, 0.9036381, 0.9019608, 0, 1, 1,
0.8580748, 0.5815011, 1.434446, 0.9098039, 0, 1, 1,
0.8617242, 1.269122, 0.5718859, 0.9137255, 0, 1, 1,
0.8629318, -1.443132, 2.596514, 0.9215686, 0, 1, 1,
0.8660713, 0.5689749, 0.8645159, 0.9254902, 0, 1, 1,
0.8708822, -1.381679, 3.01673, 0.9333333, 0, 1, 1,
0.8717324, -0.3657475, 3.582904, 0.9372549, 0, 1, 1,
0.8732904, -1.727576, 3.697345, 0.945098, 0, 1, 1,
0.8733107, 1.221968, 0.2510566, 0.9490196, 0, 1, 1,
0.8786442, -0.3440652, -0.1014674, 0.9568627, 0, 1, 1,
0.8798349, 0.2624683, 0.9104524, 0.9607843, 0, 1, 1,
0.8816868, -1.44539, 0.8224097, 0.9686275, 0, 1, 1,
0.8862543, -2.261404, 1.972523, 0.972549, 0, 1, 1,
0.8867401, 0.44343, 1.485017, 0.9803922, 0, 1, 1,
0.8882411, -2.037699, 2.096571, 0.9843137, 0, 1, 1,
0.8925617, 0.4994407, 0.9519662, 0.9921569, 0, 1, 1,
0.8990672, -0.9695929, 2.162532, 0.9960784, 0, 1, 1,
0.8990899, -1.356283, 2.162807, 1, 0, 0.9960784, 1,
0.9008962, 0.5182426, 2.508482, 1, 0, 0.9882353, 1,
0.9078924, -1.083269, 1.357347, 1, 0, 0.9843137, 1,
0.9083391, 0.2862252, 1.241519, 1, 0, 0.9764706, 1,
0.9095066, -1.238623, 2.376063, 1, 0, 0.972549, 1,
0.9166714, 0.3238296, 2.308879, 1, 0, 0.9647059, 1,
0.9236002, 0.6485757, 0.5129235, 1, 0, 0.9607843, 1,
0.932647, 0.787542, 1.125134, 1, 0, 0.9529412, 1,
0.9372081, 2.198361, 0.09234771, 1, 0, 0.9490196, 1,
0.9423314, -1.997441, 4.484605, 1, 0, 0.9411765, 1,
0.9427989, 0.2246903, 1.123569, 1, 0, 0.9372549, 1,
0.9437299, -2.27443, 2.38527, 1, 0, 0.9294118, 1,
0.9659098, 0.4085254, -0.9611034, 1, 0, 0.9254902, 1,
0.967026, -1.067716, 2.15883, 1, 0, 0.9176471, 1,
0.9671174, -0.9663821, 3.332389, 1, 0, 0.9137255, 1,
0.9728444, -0.5934247, 1.661113, 1, 0, 0.9058824, 1,
0.9803901, 1.260795, 1.017731, 1, 0, 0.9019608, 1,
0.9864013, -1.991478, 4.557225, 1, 0, 0.8941177, 1,
0.9876097, -0.7672148, 3.353206, 1, 0, 0.8862745, 1,
0.9880015, -0.4053234, 3.335784, 1, 0, 0.8823529, 1,
0.9965691, -0.5384014, 1.954133, 1, 0, 0.8745098, 1,
0.9981863, -0.8744462, 1.961729, 1, 0, 0.8705882, 1,
0.9989159, -1.566654, 3.186014, 1, 0, 0.8627451, 1,
1.001486, -1.30389, 2.953465, 1, 0, 0.8588235, 1,
1.015491, -0.205256, 3.128258, 1, 0, 0.8509804, 1,
1.030574, 0.8476995, 1.672698, 1, 0, 0.8470588, 1,
1.035077, 0.1186286, 1.1631, 1, 0, 0.8392157, 1,
1.041193, 1.446864, -2.123408, 1, 0, 0.8352941, 1,
1.05322, 0.03925642, 1.044925, 1, 0, 0.827451, 1,
1.053845, 1.094876, 0.6807339, 1, 0, 0.8235294, 1,
1.058613, -1.208634, 3.307197, 1, 0, 0.8156863, 1,
1.061044, -0.760114, 0.3846618, 1, 0, 0.8117647, 1,
1.063412, -0.8960975, 1.406205, 1, 0, 0.8039216, 1,
1.066958, -0.3933046, 2.272904, 1, 0, 0.7960784, 1,
1.070083, -0.1691675, 3.492093, 1, 0, 0.7921569, 1,
1.073843, 1.887431, 1.211527, 1, 0, 0.7843137, 1,
1.076028, -0.02166226, 0.1268886, 1, 0, 0.7803922, 1,
1.076149, 0.8605562, 5.398574, 1, 0, 0.772549, 1,
1.081105, 0.4529554, 3.047721, 1, 0, 0.7686275, 1,
1.081525, 0.1772294, 3.248295, 1, 0, 0.7607843, 1,
1.110621, -0.3746466, 1.968572, 1, 0, 0.7568628, 1,
1.119739, 0.2414333, 2.966602, 1, 0, 0.7490196, 1,
1.121379, 0.1834749, 2.347175, 1, 0, 0.7450981, 1,
1.124569, -2.359895, 3.375421, 1, 0, 0.7372549, 1,
1.12614, -0.5714307, 0.2017424, 1, 0, 0.7333333, 1,
1.128249, 0.5693688, 2.201632, 1, 0, 0.7254902, 1,
1.140198, 1.459214, 0.08402614, 1, 0, 0.7215686, 1,
1.145698, 0.2196125, 1.855293, 1, 0, 0.7137255, 1,
1.147362, 0.8420379, -1.213988, 1, 0, 0.7098039, 1,
1.152313, -1.237849, 2.274484, 1, 0, 0.7019608, 1,
1.158696, 0.1155163, 1.272034, 1, 0, 0.6941177, 1,
1.162088, 0.3372006, 0.9428327, 1, 0, 0.6901961, 1,
1.162572, -0.8297906, 2.131696, 1, 0, 0.682353, 1,
1.167899, -0.5130225, 1.029839, 1, 0, 0.6784314, 1,
1.169801, 1.442733, 0.2909816, 1, 0, 0.6705883, 1,
1.174286, -0.0140414, 0.7852668, 1, 0, 0.6666667, 1,
1.177971, 0.9770434, -1.703078, 1, 0, 0.6588235, 1,
1.178715, -0.2001492, 1.72567, 1, 0, 0.654902, 1,
1.194352, -0.4780864, 2.312796, 1, 0, 0.6470588, 1,
1.198341, 0.7780214, 0.9470109, 1, 0, 0.6431373, 1,
1.200644, -0.7902824, 3.55323, 1, 0, 0.6352941, 1,
1.20156, -2.166843, 0.7029969, 1, 0, 0.6313726, 1,
1.205186, -0.7859361, 1.287841, 1, 0, 0.6235294, 1,
1.205997, -0.0368087, 1.850025, 1, 0, 0.6196079, 1,
1.219366, 1.245738, 0.1656023, 1, 0, 0.6117647, 1,
1.241448, -0.5735481, 1.36061, 1, 0, 0.6078432, 1,
1.241581, 0.8531843, 0.9305646, 1, 0, 0.6, 1,
1.262481, 0.5249153, 0.7498767, 1, 0, 0.5921569, 1,
1.269485, -0.5015585, 1.40081, 1, 0, 0.5882353, 1,
1.27018, 0.5117678, -0.1957373, 1, 0, 0.5803922, 1,
1.282213, 0.6359724, 1.46059, 1, 0, 0.5764706, 1,
1.286207, -0.149032, 0.5779692, 1, 0, 0.5686275, 1,
1.289589, 1.163261, 1.173972, 1, 0, 0.5647059, 1,
1.293378, -1.230645, 2.238533, 1, 0, 0.5568628, 1,
1.300887, 1.079614, 0.8027077, 1, 0, 0.5529412, 1,
1.303657, -0.6047067, 2.889091, 1, 0, 0.5450981, 1,
1.306095, -0.5517977, 1.948274, 1, 0, 0.5411765, 1,
1.310714, -0.7349293, 2.489585, 1, 0, 0.5333334, 1,
1.31266, 1.003298, 1.727192, 1, 0, 0.5294118, 1,
1.324951, -1.402862, 3.229483, 1, 0, 0.5215687, 1,
1.339859, -0.6914352, 2.625818, 1, 0, 0.5176471, 1,
1.342005, 1.130582, 0.7712105, 1, 0, 0.509804, 1,
1.343053, 0.4516502, 1.580465, 1, 0, 0.5058824, 1,
1.348194, -1.108511, 1.832257, 1, 0, 0.4980392, 1,
1.356189, -1.794195, 1.263851, 1, 0, 0.4901961, 1,
1.362411, -0.3208576, 1.851601, 1, 0, 0.4862745, 1,
1.367405, -0.8237548, 0.7298999, 1, 0, 0.4784314, 1,
1.369724, 0.1523715, -1.171755, 1, 0, 0.4745098, 1,
1.375762, 1.327695, -0.2836995, 1, 0, 0.4666667, 1,
1.37635, -0.1430396, 1.339651, 1, 0, 0.4627451, 1,
1.393211, -0.1347357, 1.538579, 1, 0, 0.454902, 1,
1.393683, -0.5351356, 0.9481677, 1, 0, 0.4509804, 1,
1.397682, -1.463277, 3.221757, 1, 0, 0.4431373, 1,
1.409878, 1.620112, 2.061298, 1, 0, 0.4392157, 1,
1.417805, -0.9091858, 0.08660319, 1, 0, 0.4313726, 1,
1.42078, 1.270275, 0.6805297, 1, 0, 0.427451, 1,
1.422213, 1.417129, 0.8950968, 1, 0, 0.4196078, 1,
1.441017, 0.453324, 1.932139, 1, 0, 0.4156863, 1,
1.45865, 0.7275858, 0.7171139, 1, 0, 0.4078431, 1,
1.476806, -1.530736, 2.300496, 1, 0, 0.4039216, 1,
1.494916, -0.9081228, 1.958938, 1, 0, 0.3960784, 1,
1.501247, -0.3943884, 2.002709, 1, 0, 0.3882353, 1,
1.504537, -0.1985875, 0.1386621, 1, 0, 0.3843137, 1,
1.506625, 0.2968901, -0.5746735, 1, 0, 0.3764706, 1,
1.510317, -0.8481914, 2.348342, 1, 0, 0.372549, 1,
1.512327, -0.2566465, 1.355509, 1, 0, 0.3647059, 1,
1.51351, -0.6983972, 1.846525, 1, 0, 0.3607843, 1,
1.519362, 0.3479527, -0.007728518, 1, 0, 0.3529412, 1,
1.537461, 2.044298, -0.1473276, 1, 0, 0.3490196, 1,
1.546067, 3.285979, 3.109293, 1, 0, 0.3411765, 1,
1.566034, -0.4588671, 1.96898, 1, 0, 0.3372549, 1,
1.568807, -0.5452319, 3.79559, 1, 0, 0.3294118, 1,
1.574056, 0.627059, 1.820069, 1, 0, 0.3254902, 1,
1.58249, 0.6102177, 2.487671, 1, 0, 0.3176471, 1,
1.593968, -0.9279619, 0.636607, 1, 0, 0.3137255, 1,
1.604483, 2.433045, -1.313306, 1, 0, 0.3058824, 1,
1.621223, 0.3716593, 3.562317, 1, 0, 0.2980392, 1,
1.622084, -0.1108928, 3.140924, 1, 0, 0.2941177, 1,
1.653931, 1.66251, -0.1556284, 1, 0, 0.2862745, 1,
1.68998, 1.241537, 0.3821749, 1, 0, 0.282353, 1,
1.693824, -0.8566319, 2.623655, 1, 0, 0.2745098, 1,
1.710967, 0.7865719, 1.740359, 1, 0, 0.2705882, 1,
1.725268, 0.109434, 0.8055341, 1, 0, 0.2627451, 1,
1.727024, -2.372491, 1.56274, 1, 0, 0.2588235, 1,
1.7361, -0.6777866, 1.065908, 1, 0, 0.2509804, 1,
1.746849, -0.3697597, 3.238399, 1, 0, 0.2470588, 1,
1.756781, -0.427887, 1.447013, 1, 0, 0.2392157, 1,
1.756801, -0.5663533, 1.421357, 1, 0, 0.2352941, 1,
1.758899, -0.5781373, 3.005014, 1, 0, 0.227451, 1,
1.763055, 0.2871513, -0.2778902, 1, 0, 0.2235294, 1,
1.780362, -1.15149, 1.85368, 1, 0, 0.2156863, 1,
1.806107, -1.131962, 3.778292, 1, 0, 0.2117647, 1,
1.821185, -0.3823032, 0.03770692, 1, 0, 0.2039216, 1,
1.82271, -1.50783, 1.927917, 1, 0, 0.1960784, 1,
1.832097, 1.134487, 0.2368163, 1, 0, 0.1921569, 1,
1.847759, -1.139329, 2.457654, 1, 0, 0.1843137, 1,
1.851485, 0.1115804, 2.667491, 1, 0, 0.1803922, 1,
1.86044, 1.859541, 1.043857, 1, 0, 0.172549, 1,
1.895595, -0.1264712, 2.440192, 1, 0, 0.1686275, 1,
1.89692, 0.5763559, 1.303073, 1, 0, 0.1607843, 1,
1.899159, 1.661666, 2.252444, 1, 0, 0.1568628, 1,
1.930793, -0.8457698, 2.293193, 1, 0, 0.1490196, 1,
2.044587, -0.6095619, 1.703711, 1, 0, 0.145098, 1,
2.053399, 0.2977622, 2.614581, 1, 0, 0.1372549, 1,
2.059553, 1.036488, 1.617062, 1, 0, 0.1333333, 1,
2.102026, 0.5307685, 1.866358, 1, 0, 0.1254902, 1,
2.103294, -0.9111036, 3.268991, 1, 0, 0.1215686, 1,
2.107077, 0.04594348, 1.882251, 1, 0, 0.1137255, 1,
2.107935, -0.06935824, 1.615404, 1, 0, 0.1098039, 1,
2.132193, -0.305458, 2.527169, 1, 0, 0.1019608, 1,
2.185952, 0.712499, 1.902, 1, 0, 0.09411765, 1,
2.209876, -1.221263, 2.363761, 1, 0, 0.09019608, 1,
2.228892, -0.7209924, 2.320239, 1, 0, 0.08235294, 1,
2.232522, 0.05204666, 1.439552, 1, 0, 0.07843138, 1,
2.235024, 2.652714, 1.541797, 1, 0, 0.07058824, 1,
2.306875, -1.36494, 3.355229, 1, 0, 0.06666667, 1,
2.313875, 0.2644025, 0.7846059, 1, 0, 0.05882353, 1,
2.351775, -1.593912, 1.507277, 1, 0, 0.05490196, 1,
2.358866, -1.464261, 2.461892, 1, 0, 0.04705882, 1,
2.361782, -1.003071, 2.180565, 1, 0, 0.04313726, 1,
2.432657, -0.2600408, -0.7907423, 1, 0, 0.03529412, 1,
2.480535, -1.204282, 0.4197468, 1, 0, 0.03137255, 1,
2.724264, -0.7706198, 1.184765, 1, 0, 0.02352941, 1,
2.934222, 0.7389227, -0.3847542, 1, 0, 0.01960784, 1,
2.979162, -0.2832565, 0.6920735, 1, 0, 0.01176471, 1,
3.211588, -0.469865, 1.312769, 1, 0, 0.007843138, 1
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
0.1697896, -4.806009, -7.451667, 0, -0.5, 0.5, 0.5,
0.1697896, -4.806009, -7.451667, 1, -0.5, 0.5, 0.5,
0.1697896, -4.806009, -7.451667, 1, 1.5, 0.5, 0.5,
0.1697896, -4.806009, -7.451667, 0, 1.5, 0.5, 0.5
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
-3.903178, -0.1736141, -7.451667, 0, -0.5, 0.5, 0.5,
-3.903178, -0.1736141, -7.451667, 1, -0.5, 0.5, 0.5,
-3.903178, -0.1736141, -7.451667, 1, 1.5, 0.5, 0.5,
-3.903178, -0.1736141, -7.451667, 0, 1.5, 0.5, 0.5
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
-3.903178, -4.806009, -0.005451679, 0, -0.5, 0.5, 0.5,
-3.903178, -4.806009, -0.005451679, 1, -0.5, 0.5, 0.5,
-3.903178, -4.806009, -0.005451679, 1, 1.5, 0.5, 0.5,
-3.903178, -4.806009, -0.005451679, 0, 1.5, 0.5, 0.5
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
-2, -3.736995, -5.73331,
3, -3.736995, -5.73331,
-2, -3.736995, -5.73331,
-2, -3.915164, -6.019703,
-1, -3.736995, -5.73331,
-1, -3.915164, -6.019703,
0, -3.736995, -5.73331,
0, -3.915164, -6.019703,
1, -3.736995, -5.73331,
1, -3.915164, -6.019703,
2, -3.736995, -5.73331,
2, -3.915164, -6.019703,
3, -3.736995, -5.73331,
3, -3.915164, -6.019703
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
-2, -4.271502, -6.592489, 0, -0.5, 0.5, 0.5,
-2, -4.271502, -6.592489, 1, -0.5, 0.5, 0.5,
-2, -4.271502, -6.592489, 1, 1.5, 0.5, 0.5,
-2, -4.271502, -6.592489, 0, 1.5, 0.5, 0.5,
-1, -4.271502, -6.592489, 0, -0.5, 0.5, 0.5,
-1, -4.271502, -6.592489, 1, -0.5, 0.5, 0.5,
-1, -4.271502, -6.592489, 1, 1.5, 0.5, 0.5,
-1, -4.271502, -6.592489, 0, 1.5, 0.5, 0.5,
0, -4.271502, -6.592489, 0, -0.5, 0.5, 0.5,
0, -4.271502, -6.592489, 1, -0.5, 0.5, 0.5,
0, -4.271502, -6.592489, 1, 1.5, 0.5, 0.5,
0, -4.271502, -6.592489, 0, 1.5, 0.5, 0.5,
1, -4.271502, -6.592489, 0, -0.5, 0.5, 0.5,
1, -4.271502, -6.592489, 1, -0.5, 0.5, 0.5,
1, -4.271502, -6.592489, 1, 1.5, 0.5, 0.5,
1, -4.271502, -6.592489, 0, 1.5, 0.5, 0.5,
2, -4.271502, -6.592489, 0, -0.5, 0.5, 0.5,
2, -4.271502, -6.592489, 1, -0.5, 0.5, 0.5,
2, -4.271502, -6.592489, 1, 1.5, 0.5, 0.5,
2, -4.271502, -6.592489, 0, 1.5, 0.5, 0.5,
3, -4.271502, -6.592489, 0, -0.5, 0.5, 0.5,
3, -4.271502, -6.592489, 1, -0.5, 0.5, 0.5,
3, -4.271502, -6.592489, 1, 1.5, 0.5, 0.5,
3, -4.271502, -6.592489, 0, 1.5, 0.5, 0.5
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
-2.963263, -3, -5.73331,
-2.963263, 3, -5.73331,
-2.963263, -3, -5.73331,
-3.119915, -3, -6.019703,
-2.963263, -2, -5.73331,
-3.119915, -2, -6.019703,
-2.963263, -1, -5.73331,
-3.119915, -1, -6.019703,
-2.963263, 0, -5.73331,
-3.119915, 0, -6.019703,
-2.963263, 1, -5.73331,
-3.119915, 1, -6.019703,
-2.963263, 2, -5.73331,
-3.119915, 2, -6.019703,
-2.963263, 3, -5.73331,
-3.119915, 3, -6.019703
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
-3.433221, -3, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, -3, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, -3, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, -3, -6.592489, 0, 1.5, 0.5, 0.5,
-3.433221, -2, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, -2, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, -2, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, -2, -6.592489, 0, 1.5, 0.5, 0.5,
-3.433221, -1, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, -1, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, -1, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, -1, -6.592489, 0, 1.5, 0.5, 0.5,
-3.433221, 0, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, 0, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, 0, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, 0, -6.592489, 0, 1.5, 0.5, 0.5,
-3.433221, 1, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, 1, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, 1, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, 1, -6.592489, 0, 1.5, 0.5, 0.5,
-3.433221, 2, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, 2, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, 2, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, 2, -6.592489, 0, 1.5, 0.5, 0.5,
-3.433221, 3, -6.592489, 0, -0.5, 0.5, 0.5,
-3.433221, 3, -6.592489, 1, -0.5, 0.5, 0.5,
-3.433221, 3, -6.592489, 1, 1.5, 0.5, 0.5,
-3.433221, 3, -6.592489, 0, 1.5, 0.5, 0.5
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
-2.963263, -3.736995, -4,
-2.963263, -3.736995, 4,
-2.963263, -3.736995, -4,
-3.119915, -3.915164, -4,
-2.963263, -3.736995, -2,
-3.119915, -3.915164, -2,
-2.963263, -3.736995, 0,
-3.119915, -3.915164, 0,
-2.963263, -3.736995, 2,
-3.119915, -3.915164, 2,
-2.963263, -3.736995, 4,
-3.119915, -3.915164, 4
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
-3.433221, -4.271502, -4, 0, -0.5, 0.5, 0.5,
-3.433221, -4.271502, -4, 1, -0.5, 0.5, 0.5,
-3.433221, -4.271502, -4, 1, 1.5, 0.5, 0.5,
-3.433221, -4.271502, -4, 0, 1.5, 0.5, 0.5,
-3.433221, -4.271502, -2, 0, -0.5, 0.5, 0.5,
-3.433221, -4.271502, -2, 1, -0.5, 0.5, 0.5,
-3.433221, -4.271502, -2, 1, 1.5, 0.5, 0.5,
-3.433221, -4.271502, -2, 0, 1.5, 0.5, 0.5,
-3.433221, -4.271502, 0, 0, -0.5, 0.5, 0.5,
-3.433221, -4.271502, 0, 1, -0.5, 0.5, 0.5,
-3.433221, -4.271502, 0, 1, 1.5, 0.5, 0.5,
-3.433221, -4.271502, 0, 0, 1.5, 0.5, 0.5,
-3.433221, -4.271502, 2, 0, -0.5, 0.5, 0.5,
-3.433221, -4.271502, 2, 1, -0.5, 0.5, 0.5,
-3.433221, -4.271502, 2, 1, 1.5, 0.5, 0.5,
-3.433221, -4.271502, 2, 0, 1.5, 0.5, 0.5,
-3.433221, -4.271502, 4, 0, -0.5, 0.5, 0.5,
-3.433221, -4.271502, 4, 1, -0.5, 0.5, 0.5,
-3.433221, -4.271502, 4, 1, 1.5, 0.5, 0.5,
-3.433221, -4.271502, 4, 0, 1.5, 0.5, 0.5
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
-2.963263, -3.736995, -5.73331,
-2.963263, 3.389766, -5.73331,
-2.963263, -3.736995, 5.722407,
-2.963263, 3.389766, 5.722407,
-2.963263, -3.736995, -5.73331,
-2.963263, -3.736995, 5.722407,
-2.963263, 3.389766, -5.73331,
-2.963263, 3.389766, 5.722407,
-2.963263, -3.736995, -5.73331,
3.302842, -3.736995, -5.73331,
-2.963263, -3.736995, 5.722407,
3.302842, -3.736995, 5.722407,
-2.963263, 3.389766, -5.73331,
3.302842, 3.389766, -5.73331,
-2.963263, 3.389766, 5.722407,
3.302842, 3.389766, 5.722407,
3.302842, -3.736995, -5.73331,
3.302842, 3.389766, -5.73331,
3.302842, -3.736995, 5.722407,
3.302842, 3.389766, 5.722407,
3.302842, -3.736995, -5.73331,
3.302842, -3.736995, 5.722407,
3.302842, 3.389766, -5.73331,
3.302842, 3.389766, 5.722407
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
var radius = 7.943367;
var distance = 35.34093;
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
mvMatrix.translate( -0.1697896, 0.1736141, 0.005451679 );
mvMatrix.scale( 1.370632, 1.205109, 0.7497151 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34093);
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
tetraethyl_diphospha<-read.table("tetraethyl_diphospha.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetraethyl_diphospha$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_diphospha' not found
```

```r
y<-tetraethyl_diphospha$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_diphospha' not found
```

```r
z<-tetraethyl_diphospha$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_diphospha' not found
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
-2.872009, 1.688957, -0.8118446, 0, 0, 1, 1, 1,
-2.58796, -0.1701592, -2.892925, 1, 0, 0, 1, 1,
-2.547601, 0.4357086, -1.458396, 1, 0, 0, 1, 1,
-2.422184, 0.09861479, -1.190919, 1, 0, 0, 1, 1,
-2.278713, -0.3764226, -3.405285, 1, 0, 0, 1, 1,
-2.277997, -0.4322265, -1.38879, 1, 0, 0, 1, 1,
-2.271238, -0.04088184, -0.3860992, 0, 0, 0, 1, 1,
-2.182758, 0.0393971, -1.388463, 0, 0, 0, 1, 1,
-2.129671, 0.2687157, -0.9168893, 0, 0, 0, 1, 1,
-2.120106, -0.1448866, -1.969963, 0, 0, 0, 1, 1,
-2.093254, 0.3342336, -1.963847, 0, 0, 0, 1, 1,
-2.072822, -0.1122549, -1.527992, 0, 0, 0, 1, 1,
-2.072143, -0.6293281, -0.9597889, 0, 0, 0, 1, 1,
-2.060007, -0.5965973, -1.560026, 1, 1, 1, 1, 1,
-2.028665, -0.9555589, -2.29246, 1, 1, 1, 1, 1,
-2.001141, -0.1257944, -2.621251, 1, 1, 1, 1, 1,
-1.97484, -0.3924168, -1.20292, 1, 1, 1, 1, 1,
-1.966999, 0.2459994, 0.9001477, 1, 1, 1, 1, 1,
-1.960387, -0.938103, -0.1587754, 1, 1, 1, 1, 1,
-1.952301, 0.3349481, -1.113007, 1, 1, 1, 1, 1,
-1.909231, -0.8971911, -2.48321, 1, 1, 1, 1, 1,
-1.908119, -0.003669464, -1.339445, 1, 1, 1, 1, 1,
-1.901885, 0.1716856, -2.849264, 1, 1, 1, 1, 1,
-1.89203, 2.83123, -1.115915, 1, 1, 1, 1, 1,
-1.880496, 1.009827, -1.55614, 1, 1, 1, 1, 1,
-1.868295, -0.2347025, -1.363248, 1, 1, 1, 1, 1,
-1.860978, 0.534098, -3.165216, 1, 1, 1, 1, 1,
-1.856728, 0.8647471, -1.114625, 1, 1, 1, 1, 1,
-1.850883, 0.2140998, -1.197605, 0, 0, 1, 1, 1,
-1.84762, -1.222156, -2.857167, 1, 0, 0, 1, 1,
-1.822108, 0.434043, -1.880858, 1, 0, 0, 1, 1,
-1.81651, 0.4076232, -1.677184, 1, 0, 0, 1, 1,
-1.801482, -0.4048271, -4.275591, 1, 0, 0, 1, 1,
-1.761803, -0.1118399, -1.528927, 1, 0, 0, 1, 1,
-1.724176, -0.5211408, -1.255115, 0, 0, 0, 1, 1,
-1.704369, -0.2991538, -2.242528, 0, 0, 0, 1, 1,
-1.695499, 0.9640433, -3.077208, 0, 0, 0, 1, 1,
-1.681076, -0.3733374, -1.276398, 0, 0, 0, 1, 1,
-1.678798, -0.8683742, -2.595701, 0, 0, 0, 1, 1,
-1.673612, -0.9077156, -1.614625, 0, 0, 0, 1, 1,
-1.636051, -0.1032338, -3.441886, 0, 0, 0, 1, 1,
-1.631852, -1.455114, -2.324063, 1, 1, 1, 1, 1,
-1.620665, 0.2046159, -2.232188, 1, 1, 1, 1, 1,
-1.60582, 1.743708, -0.1796005, 1, 1, 1, 1, 1,
-1.601385, -0.1479384, -1.615334, 1, 1, 1, 1, 1,
-1.571292, -1.927714, -2.774615, 1, 1, 1, 1, 1,
-1.550936, -0.6197366, -4.496984, 1, 1, 1, 1, 1,
-1.547985, 0.6370227, 0.6647957, 1, 1, 1, 1, 1,
-1.539552, 0.7076607, 0.215994, 1, 1, 1, 1, 1,
-1.539084, -0.3517586, 0.8343975, 1, 1, 1, 1, 1,
-1.537512, -0.9550974, -1.82447, 1, 1, 1, 1, 1,
-1.522413, 0.3546801, 0.0787038, 1, 1, 1, 1, 1,
-1.517536, 0.9040439, -0.3021421, 1, 1, 1, 1, 1,
-1.511974, -1.723663, -1.860958, 1, 1, 1, 1, 1,
-1.510589, 0.573724, -2.209945, 1, 1, 1, 1, 1,
-1.502225, -2.053105, -1.518623, 1, 1, 1, 1, 1,
-1.497468, 0.395105, -0.9032395, 0, 0, 1, 1, 1,
-1.454006, 0.3240713, -2.541971, 1, 0, 0, 1, 1,
-1.448654, 0.6393901, -1.01421, 1, 0, 0, 1, 1,
-1.444414, -1.522489, -2.042488, 1, 0, 0, 1, 1,
-1.443788, -1.191268, -2.169291, 1, 0, 0, 1, 1,
-1.441554, -0.1180671, -3.141605, 1, 0, 0, 1, 1,
-1.436007, 0.4803068, -0.665399, 0, 0, 0, 1, 1,
-1.433715, -0.9769553, -2.721071, 0, 0, 0, 1, 1,
-1.428845, 0.4455812, -2.497034, 0, 0, 0, 1, 1,
-1.419585, 1.757686, -2.849662, 0, 0, 0, 1, 1,
-1.4186, 0.2421828, -2.363621, 0, 0, 0, 1, 1,
-1.417845, 0.2801694, -1.495812, 0, 0, 0, 1, 1,
-1.386342, 1.368444, -2.902581, 0, 0, 0, 1, 1,
-1.384685, -0.9856364, -3.349739, 1, 1, 1, 1, 1,
-1.377161, -0.5144323, -1.827185, 1, 1, 1, 1, 1,
-1.375805, -0.5076307, -2.3952, 1, 1, 1, 1, 1,
-1.371513, -1.688111, -3.199616, 1, 1, 1, 1, 1,
-1.36771, -2.155046, -1.662546, 1, 1, 1, 1, 1,
-1.358528, -0.5053549, -1.651313, 1, 1, 1, 1, 1,
-1.357658, 0.2662988, -0.6737532, 1, 1, 1, 1, 1,
-1.357584, -1.114719, -1.123066, 1, 1, 1, 1, 1,
-1.353359, 1.23467, -0.1179638, 1, 1, 1, 1, 1,
-1.351171, 0.5259646, -1.4075, 1, 1, 1, 1, 1,
-1.345983, 0.6365832, 0.3797074, 1, 1, 1, 1, 1,
-1.341191, 0.9454411, -1.369762, 1, 1, 1, 1, 1,
-1.339971, 1.776383, 0.04761314, 1, 1, 1, 1, 1,
-1.337776, -1.196781, -2.474617, 1, 1, 1, 1, 1,
-1.335488, -0.6402746, -0.6349778, 1, 1, 1, 1, 1,
-1.334949, -0.7620833, -3.862746, 0, 0, 1, 1, 1,
-1.324282, 0.8268465, -1.268024, 1, 0, 0, 1, 1,
-1.299145, 1.021958, -2.2049, 1, 0, 0, 1, 1,
-1.288363, 0.7122932, -1.709388, 1, 0, 0, 1, 1,
-1.286843, 0.3881616, 0.5139716, 1, 0, 0, 1, 1,
-1.285842, 0.6446802, -2.726009, 1, 0, 0, 1, 1,
-1.285291, 0.173129, -1.438204, 0, 0, 0, 1, 1,
-1.285107, -2.218273, -0.6367819, 0, 0, 0, 1, 1,
-1.283909, -0.2592516, -1.302685, 0, 0, 0, 1, 1,
-1.277365, 0.07351681, -2.434562, 0, 0, 0, 1, 1,
-1.268331, 1.74269, -1.418501, 0, 0, 0, 1, 1,
-1.26599, 0.3015454, -0.2163455, 0, 0, 0, 1, 1,
-1.265174, -0.5346668, -3.018701, 0, 0, 0, 1, 1,
-1.258525, -0.5017983, -1.850284, 1, 1, 1, 1, 1,
-1.25113, -0.6880968, -2.670911, 1, 1, 1, 1, 1,
-1.25062, 1.825072, -0.5627612, 1, 1, 1, 1, 1,
-1.237656, 0.07325433, -1.206864, 1, 1, 1, 1, 1,
-1.233806, 2.545726, -1.81135, 1, 1, 1, 1, 1,
-1.232846, -0.3461455, -3.123815, 1, 1, 1, 1, 1,
-1.219867, -0.01955243, -2.847399, 1, 1, 1, 1, 1,
-1.201909, -0.6666757, -2.905836, 1, 1, 1, 1, 1,
-1.196987, -1.068126, -2.543833, 1, 1, 1, 1, 1,
-1.194168, 0.815989, 0.1518614, 1, 1, 1, 1, 1,
-1.190674, 0.2882491, -0.05870518, 1, 1, 1, 1, 1,
-1.187307, -0.6317878, -2.968637, 1, 1, 1, 1, 1,
-1.186797, -1.844742, -1.966687, 1, 1, 1, 1, 1,
-1.186653, 0.09965804, -1.022936, 1, 1, 1, 1, 1,
-1.179725, -2.11826, -2.637705, 1, 1, 1, 1, 1,
-1.173174, -1.379588, -1.776334, 0, 0, 1, 1, 1,
-1.169617, -1.952736, -5.566479, 1, 0, 0, 1, 1,
-1.165773, 1.754731, 0.3404526, 1, 0, 0, 1, 1,
-1.160069, -0.4854176, -2.329261, 1, 0, 0, 1, 1,
-1.157821, -0.0374342, -1.32982, 1, 0, 0, 1, 1,
-1.157557, -0.2999451, -1.873211, 1, 0, 0, 1, 1,
-1.147439, -0.5445106, -1.755642, 0, 0, 0, 1, 1,
-1.133768, 0.6176711, -1.206669, 0, 0, 0, 1, 1,
-1.118851, 0.2762064, -0.6353226, 0, 0, 0, 1, 1,
-1.112373, -0.6415724, -3.082408, 0, 0, 0, 1, 1,
-1.110595, -0.6950397, -1.023594, 0, 0, 0, 1, 1,
-1.109437, 0.435981, -0.6550463, 0, 0, 0, 1, 1,
-1.098293, 0.5599957, -1.343111, 0, 0, 0, 1, 1,
-1.096876, 0.5447512, -1.911344, 1, 1, 1, 1, 1,
-1.096627, -0.2150228, 0.101498, 1, 1, 1, 1, 1,
-1.088906, 0.9488476, -0.08315095, 1, 1, 1, 1, 1,
-1.088456, -0.4677732, -1.687647, 1, 1, 1, 1, 1,
-1.083973, 1.011123, 0.02745984, 1, 1, 1, 1, 1,
-1.081283, 1.343526, 0.02271575, 1, 1, 1, 1, 1,
-1.075714, 2.476082, -1.77358, 1, 1, 1, 1, 1,
-1.074399, 0.4585027, -2.855507, 1, 1, 1, 1, 1,
-1.068408, 1.700563, -0.2183424, 1, 1, 1, 1, 1,
-1.059955, 0.7652352, -0.6990865, 1, 1, 1, 1, 1,
-1.039341, 0.8767786, 2.003404, 1, 1, 1, 1, 1,
-1.039251, -0.07714714, -2.503239, 1, 1, 1, 1, 1,
-1.038501, -0.739054, -1.866114, 1, 1, 1, 1, 1,
-1.030933, 1.641107, -2.41254, 1, 1, 1, 1, 1,
-1.030732, 0.5179365, -0.5635713, 1, 1, 1, 1, 1,
-1.021842, 1.258072, 0.4749872, 0, 0, 1, 1, 1,
-1.021716, -1.398496, -3.233563, 1, 0, 0, 1, 1,
-1.019802, 0.8165407, 0.2387513, 1, 0, 0, 1, 1,
-1.016129, 0.6080779, -1.589992, 1, 0, 0, 1, 1,
-1.01519, -0.2097362, -2.111063, 1, 0, 0, 1, 1,
-1.015031, 1.316492, -0.2487661, 1, 0, 0, 1, 1,
-1.010209, 0.5519153, -1.509512, 0, 0, 0, 1, 1,
-0.9981633, -0.2062276, 0.04153924, 0, 0, 0, 1, 1,
-0.9951791, 0.6141663, -2.333539, 0, 0, 0, 1, 1,
-0.9809815, 0.04491484, -1.452245, 0, 0, 0, 1, 1,
-0.9807313, 0.07223798, -2.785139, 0, 0, 0, 1, 1,
-0.9751724, 0.4010145, -1.094465, 0, 0, 0, 1, 1,
-0.9675468, 0.3637204, -1.306557, 0, 0, 0, 1, 1,
-0.9658637, 1.518137, -1.323002, 1, 1, 1, 1, 1,
-0.9627787, 0.01861085, -1.511928, 1, 1, 1, 1, 1,
-0.9596868, 0.3008713, -1.53894, 1, 1, 1, 1, 1,
-0.9520156, -0.2459077, 0.552873, 1, 1, 1, 1, 1,
-0.951057, -1.055773, -3.367939, 1, 1, 1, 1, 1,
-0.9455334, 0.3440955, 0.03376218, 1, 1, 1, 1, 1,
-0.9362624, 0.9194527, -0.0894944, 1, 1, 1, 1, 1,
-0.9329706, -1.627962, -2.734047, 1, 1, 1, 1, 1,
-0.9318841, 0.08294912, -1.033762, 1, 1, 1, 1, 1,
-0.9309817, -0.2536605, -1.27164, 1, 1, 1, 1, 1,
-0.9245882, 1.194233, -2.382612, 1, 1, 1, 1, 1,
-0.9240894, -0.8620268, -4.519256, 1, 1, 1, 1, 1,
-0.9092016, -1.287786, -1.312163, 1, 1, 1, 1, 1,
-0.9007402, 0.920243, -1.099102, 1, 1, 1, 1, 1,
-0.8986657, -0.3917387, -2.288026, 1, 1, 1, 1, 1,
-0.8977019, 1.388059, 0.1588558, 0, 0, 1, 1, 1,
-0.8970301, -0.6306486, -2.239652, 1, 0, 0, 1, 1,
-0.8959338, -0.1150092, 0.01988539, 1, 0, 0, 1, 1,
-0.8930489, -0.7846032, -2.337978, 1, 0, 0, 1, 1,
-0.8903028, -1.058591, -5.145878, 1, 0, 0, 1, 1,
-0.885662, -0.1238933, -3.376639, 1, 0, 0, 1, 1,
-0.8817745, 0.6780673, -2.006748, 0, 0, 0, 1, 1,
-0.8775713, -1.754434, -3.140947, 0, 0, 0, 1, 1,
-0.8752726, -0.9518125, -2.785722, 0, 0, 0, 1, 1,
-0.8752547, 1.091759, -0.6483922, 0, 0, 0, 1, 1,
-0.8717338, 0.460884, -1.159386, 0, 0, 0, 1, 1,
-0.8700815, 0.2793523, -0.9399128, 0, 0, 0, 1, 1,
-0.8675394, 1.309089, -1.88956, 0, 0, 0, 1, 1,
-0.8663357, 1.212424, 1.65944, 1, 1, 1, 1, 1,
-0.8626714, -0.1695493, -1.799863, 1, 1, 1, 1, 1,
-0.8568931, 1.868379, -1.06859, 1, 1, 1, 1, 1,
-0.8567355, 0.7132913, -2.450557, 1, 1, 1, 1, 1,
-0.8483861, -1.440118, -0.6933751, 1, 1, 1, 1, 1,
-0.845178, -0.8989171, -2.792541, 1, 1, 1, 1, 1,
-0.8437709, -0.8516331, -3.247287, 1, 1, 1, 1, 1,
-0.8357456, -0.643533, -2.790857, 1, 1, 1, 1, 1,
-0.8340045, -0.2333169, -1.026374, 1, 1, 1, 1, 1,
-0.8330716, 0.01227504, -1.340502, 1, 1, 1, 1, 1,
-0.8317211, -0.3819204, -1.365622, 1, 1, 1, 1, 1,
-0.8312679, -0.2873226, -2.200332, 1, 1, 1, 1, 1,
-0.8299518, -1.402751, -4.167186, 1, 1, 1, 1, 1,
-0.8213395, 0.7273835, -0.2166185, 1, 1, 1, 1, 1,
-0.8192548, -1.139667, -4.695758, 1, 1, 1, 1, 1,
-0.8157586, 0.3516518, -1.545056, 0, 0, 1, 1, 1,
-0.8139354, 0.8947058, -1.069743, 1, 0, 0, 1, 1,
-0.8116781, 0.6358309, -1.833659, 1, 0, 0, 1, 1,
-0.8030599, 1.123539, -1.289046, 1, 0, 0, 1, 1,
-0.8028087, -0.02224684, -1.446418, 1, 0, 0, 1, 1,
-0.8019574, 0.10359, -0.7264889, 1, 0, 0, 1, 1,
-0.8002822, -0.5279666, -4.272638, 0, 0, 0, 1, 1,
-0.7978279, -0.754795, -1.799481, 0, 0, 0, 1, 1,
-0.7974966, 0.6128551, -0.6972092, 0, 0, 0, 1, 1,
-0.7955, -0.1641116, -3.451195, 0, 0, 0, 1, 1,
-0.7884902, 0.6672996, -1.939983, 0, 0, 0, 1, 1,
-0.7877265, 0.4206561, -0.4991896, 0, 0, 0, 1, 1,
-0.7872635, -0.3691055, -2.698066, 0, 0, 0, 1, 1,
-0.7850301, 0.6619723, -1.120851, 1, 1, 1, 1, 1,
-0.7822955, 0.6452025, -1.26923, 1, 1, 1, 1, 1,
-0.7760723, 2.62294, 1.687306, 1, 1, 1, 1, 1,
-0.7755597, 0.9805946, -1.726522, 1, 1, 1, 1, 1,
-0.7755106, 0.04343425, -0.6368467, 1, 1, 1, 1, 1,
-0.7684704, 0.7019919, -1.682755, 1, 1, 1, 1, 1,
-0.7650611, 0.4573697, -2.111346, 1, 1, 1, 1, 1,
-0.7642086, -0.8801299, -1.860416, 1, 1, 1, 1, 1,
-0.7616462, 1.026574, 0.3655984, 1, 1, 1, 1, 1,
-0.7532659, -0.2592939, -2.67377, 1, 1, 1, 1, 1,
-0.7521769, 1.849548, -0.05113062, 1, 1, 1, 1, 1,
-0.7482615, 0.5600767, -0.71099, 1, 1, 1, 1, 1,
-0.7474275, -0.7434163, -1.760647, 1, 1, 1, 1, 1,
-0.7469202, -0.267157, -2.372579, 1, 1, 1, 1, 1,
-0.7422119, 0.323166, -0.6321549, 1, 1, 1, 1, 1,
-0.7360717, -0.0405576, -1.197334, 0, 0, 1, 1, 1,
-0.7273389, -1.921795, -2.386306, 1, 0, 0, 1, 1,
-0.7263398, 0.3418505, -0.2299211, 1, 0, 0, 1, 1,
-0.7223259, 0.3973148, -2.413679, 1, 0, 0, 1, 1,
-0.7203252, 0.7383724, 0.5964386, 1, 0, 0, 1, 1,
-0.7192424, -0.04567207, -1.069501, 1, 0, 0, 1, 1,
-0.717224, 1.095155, -2.177029, 0, 0, 0, 1, 1,
-0.7146786, 0.1489089, -0.3327539, 0, 0, 0, 1, 1,
-0.71104, 0.6138345, -0.4931607, 0, 0, 0, 1, 1,
-0.7099622, -1.235774, -2.468726, 0, 0, 0, 1, 1,
-0.709371, 0.4197873, -1.244465, 0, 0, 0, 1, 1,
-0.7090124, 1.179134, -0.01463621, 0, 0, 0, 1, 1,
-0.7037631, 0.5398028, -0.6558968, 0, 0, 0, 1, 1,
-0.7024735, -1.062036, -2.288356, 1, 1, 1, 1, 1,
-0.6927335, -0.7579437, -3.922738, 1, 1, 1, 1, 1,
-0.6925236, 0.3914107, -1.304901, 1, 1, 1, 1, 1,
-0.6921449, -2.134521, -2.224695, 1, 1, 1, 1, 1,
-0.6837464, 0.5771299, -0.6133115, 1, 1, 1, 1, 1,
-0.6833399, 1.887557, -0.2965307, 1, 1, 1, 1, 1,
-0.6739643, 1.586809, 0.007736289, 1, 1, 1, 1, 1,
-0.6739039, 0.2826299, -1.044382, 1, 1, 1, 1, 1,
-0.6728831, -0.07707696, -3.01935, 1, 1, 1, 1, 1,
-0.6703801, 2.256097, -0.02523816, 1, 1, 1, 1, 1,
-0.6702813, -0.7735881, -4.707055, 1, 1, 1, 1, 1,
-0.6700096, -1.313921, -2.100986, 1, 1, 1, 1, 1,
-0.6595963, -0.595893, -2.21619, 1, 1, 1, 1, 1,
-0.659582, 0.2372988, -1.610872, 1, 1, 1, 1, 1,
-0.6531554, 1.006549, 0.5423408, 1, 1, 1, 1, 1,
-0.6523139, -0.4365864, -1.070984, 0, 0, 1, 1, 1,
-0.6384487, -1.404455, -3.280371, 1, 0, 0, 1, 1,
-0.6340854, -0.6618571, -2.978649, 1, 0, 0, 1, 1,
-0.6313401, -0.5495681, -1.862043, 1, 0, 0, 1, 1,
-0.6274184, 0.8806797, 0.3942183, 1, 0, 0, 1, 1,
-0.6171034, -0.3895531, -1.3432, 1, 0, 0, 1, 1,
-0.6166745, 0.003437342, -1.538193, 0, 0, 0, 1, 1,
-0.6132557, 1.616844, -0.5273014, 0, 0, 0, 1, 1,
-0.6118007, -0.2705464, -1.804584, 0, 0, 0, 1, 1,
-0.6074157, 0.01409563, -1.481423, 0, 0, 0, 1, 1,
-0.6068627, 0.9629194, -0.06973516, 0, 0, 0, 1, 1,
-0.6004919, 1.530492, 0.1074858, 0, 0, 0, 1, 1,
-0.5962359, -1.53691, -3.485675, 0, 0, 0, 1, 1,
-0.5954943, 1.223715, -1.84252, 1, 1, 1, 1, 1,
-0.5946772, 0.2377048, -1.432513, 1, 1, 1, 1, 1,
-0.5912918, -1.397583, -3.199205, 1, 1, 1, 1, 1,
-0.585744, 0.5360399, -1.101562, 1, 1, 1, 1, 1,
-0.5857138, 1.706212, -0.7506558, 1, 1, 1, 1, 1,
-0.585592, 0.524395, -0.8224851, 1, 1, 1, 1, 1,
-0.5822764, -1.139193, -0.72457, 1, 1, 1, 1, 1,
-0.5781543, -2.358675, -3.313098, 1, 1, 1, 1, 1,
-0.577616, -0.3838859, -1.331957, 1, 1, 1, 1, 1,
-0.5732843, -1.435778, -4.040779, 1, 1, 1, 1, 1,
-0.5654253, -0.9996449, -2.563351, 1, 1, 1, 1, 1,
-0.5626085, 2.768201, 2.202995, 1, 1, 1, 1, 1,
-0.562409, -1.259404, -3.44237, 1, 1, 1, 1, 1,
-0.5572115, -0.2144528, -1.223089, 1, 1, 1, 1, 1,
-0.549885, 0.7605384, -0.5744861, 1, 1, 1, 1, 1,
-0.5469573, -1.195411, -1.71332, 0, 0, 1, 1, 1,
-0.5447909, 0.006697882, -2.581301, 1, 0, 0, 1, 1,
-0.5298322, -0.1640097, -2.421944, 1, 0, 0, 1, 1,
-0.5283988, 0.913826, 1.431698, 1, 0, 0, 1, 1,
-0.527129, 1.489713, -2.052398, 1, 0, 0, 1, 1,
-0.5268266, -1.04699, -1.888477, 1, 0, 0, 1, 1,
-0.5235708, 1.050943, -1.624773, 0, 0, 0, 1, 1,
-0.5195705, 1.80083, -1.646678, 0, 0, 0, 1, 1,
-0.5151328, 0.7406461, -1.552245, 0, 0, 0, 1, 1,
-0.5140429, -0.5390149, -1.900303, 0, 0, 0, 1, 1,
-0.5134023, 1.371582, -0.8856531, 0, 0, 0, 1, 1,
-0.5070668, -0.1504935, -2.332706, 0, 0, 0, 1, 1,
-0.5068896, -0.721484, -3.851242, 0, 0, 0, 1, 1,
-0.5016779, 1.2156, 0.1192572, 1, 1, 1, 1, 1,
-0.4942473, -2.038473, -3.985936, 1, 1, 1, 1, 1,
-0.4915302, -1.761123, -2.417128, 1, 1, 1, 1, 1,
-0.4913313, 0.7047495, -0.1376586, 1, 1, 1, 1, 1,
-0.4884914, 0.5631601, -0.3098081, 1, 1, 1, 1, 1,
-0.486899, 1.492936, -1.064898, 1, 1, 1, 1, 1,
-0.4814485, 2.287124, 0.4388113, 1, 1, 1, 1, 1,
-0.471237, 1.657765, 0.9142963, 1, 1, 1, 1, 1,
-0.4710797, -0.05291323, -0.5844607, 1, 1, 1, 1, 1,
-0.4686601, 0.3808785, -0.9252346, 1, 1, 1, 1, 1,
-0.4674485, 0.2904557, -0.1590977, 1, 1, 1, 1, 1,
-0.4673362, -0.2796081, -2.528738, 1, 1, 1, 1, 1,
-0.46722, 1.047136, 0.3725953, 1, 1, 1, 1, 1,
-0.4670466, -0.4990036, -1.932629, 1, 1, 1, 1, 1,
-0.4667908, -3.633207, -2.13254, 1, 1, 1, 1, 1,
-0.4588519, 0.9557586, -0.2495712, 0, 0, 1, 1, 1,
-0.4584028, 0.02666581, -1.546915, 1, 0, 0, 1, 1,
-0.4471209, 0.7944815, -0.5400166, 1, 0, 0, 1, 1,
-0.4413006, -0.8846551, -2.086244, 1, 0, 0, 1, 1,
-0.4402778, -0.9235088, -1.279937, 1, 0, 0, 1, 1,
-0.4301057, 0.4672174, 1.628767, 1, 0, 0, 1, 1,
-0.4296269, 1.788497, -1.849226, 0, 0, 0, 1, 1,
-0.4256135, -1.218862, -1.86207, 0, 0, 0, 1, 1,
-0.4254322, -0.1572417, -0.7544654, 0, 0, 0, 1, 1,
-0.4252426, -0.5446908, -2.301365, 0, 0, 0, 1, 1,
-0.4198477, -0.09922104, -1.310792, 0, 0, 0, 1, 1,
-0.418512, -0.7022346, -0.7438206, 0, 0, 0, 1, 1,
-0.4157041, -0.7370949, -2.600699, 0, 0, 0, 1, 1,
-0.405596, -0.2195583, -1.198108, 1, 1, 1, 1, 1,
-0.4045277, 0.7314534, 0.1164555, 1, 1, 1, 1, 1,
-0.4013325, 1.065349, 1.122305, 1, 1, 1, 1, 1,
-0.3997269, 0.07424303, -0.2301035, 1, 1, 1, 1, 1,
-0.3973781, -0.6428193, -0.4003996, 1, 1, 1, 1, 1,
-0.3964784, -0.1501872, -0.9862642, 1, 1, 1, 1, 1,
-0.3947158, 1.175882, -0.3367604, 1, 1, 1, 1, 1,
-0.392384, -1.287657, -3.050483, 1, 1, 1, 1, 1,
-0.3899972, 0.05352247, -1.525508, 1, 1, 1, 1, 1,
-0.3885664, -0.7366272, -2.751437, 1, 1, 1, 1, 1,
-0.386789, -1.169809, -2.783756, 1, 1, 1, 1, 1,
-0.3850779, -2.10126, -1.702572, 1, 1, 1, 1, 1,
-0.3819421, 1.665686, 0.9511129, 1, 1, 1, 1, 1,
-0.3804238, -0.1331395, -0.5524477, 1, 1, 1, 1, 1,
-0.3782777, 0.6571344, -1.594333, 1, 1, 1, 1, 1,
-0.3763841, 0.981783, 1.169538, 0, 0, 1, 1, 1,
-0.3756767, 0.2652721, -1.596008, 1, 0, 0, 1, 1,
-0.3703284, 1.352499, -0.7786496, 1, 0, 0, 1, 1,
-0.3681296, 0.2914091, -1.668411, 1, 0, 0, 1, 1,
-0.36746, 1.144166, 1.816141, 1, 0, 0, 1, 1,
-0.3664946, -0.7849257, -2.129747, 1, 0, 0, 1, 1,
-0.3617984, 1.35321, -0.3731765, 0, 0, 0, 1, 1,
-0.3601356, -1.600281, -4.130426, 0, 0, 0, 1, 1,
-0.3598499, -0.3235367, -4.629408, 0, 0, 0, 1, 1,
-0.358973, -1.094921, -3.078888, 0, 0, 0, 1, 1,
-0.3485429, 0.5603371, -0.4171223, 0, 0, 0, 1, 1,
-0.3461176, 1.06518, -1.678433, 0, 0, 0, 1, 1,
-0.3443435, 0.9172054, 1.331628, 0, 0, 0, 1, 1,
-0.33888, -0.9374524, -1.764654, 1, 1, 1, 1, 1,
-0.337675, 0.005145586, -1.638033, 1, 1, 1, 1, 1,
-0.3359632, 0.7258599, 0.01828488, 1, 1, 1, 1, 1,
-0.3359297, -0.5789035, -1.189897, 1, 1, 1, 1, 1,
-0.3305928, -0.6266462, -2.339417, 1, 1, 1, 1, 1,
-0.3299525, 0.008601991, -1.20305, 1, 1, 1, 1, 1,
-0.3255925, 0.7441183, -1.469595, 1, 1, 1, 1, 1,
-0.3241999, 0.06883302, -3.089947, 1, 1, 1, 1, 1,
-0.3176555, 0.8869798, -2.260767, 1, 1, 1, 1, 1,
-0.3138562, -0.257188, -4.052201, 1, 1, 1, 1, 1,
-0.3130021, 0.1582727, -1.803035, 1, 1, 1, 1, 1,
-0.3112404, -0.3664183, -0.09840923, 1, 1, 1, 1, 1,
-0.3112158, 1.052252, -0.05933834, 1, 1, 1, 1, 1,
-0.3098115, 0.209353, -1.068199, 1, 1, 1, 1, 1,
-0.307943, 0.668561, -0.4460195, 1, 1, 1, 1, 1,
-0.3062395, 0.8927221, -0.1874461, 0, 0, 1, 1, 1,
-0.3024802, -0.6839908, -2.002482, 1, 0, 0, 1, 1,
-0.2981979, -1.068556, -0.9719346, 1, 0, 0, 1, 1,
-0.2975369, 1.262552, -1.533418, 1, 0, 0, 1, 1,
-0.2948717, -0.4495145, -2.559371, 1, 0, 0, 1, 1,
-0.2937797, 0.4559899, -0.8175709, 1, 0, 0, 1, 1,
-0.2932225, 1.205417, -0.8133773, 0, 0, 0, 1, 1,
-0.2877179, -1.391687, -2.746945, 0, 0, 0, 1, 1,
-0.2869991, -0.06703838, -2.405235, 0, 0, 0, 1, 1,
-0.2847477, 0.04100546, -1.955399, 0, 0, 0, 1, 1,
-0.2833723, -0.05376624, -2.216022, 0, 0, 0, 1, 1,
-0.279376, -2.113665, -3.898507, 0, 0, 0, 1, 1,
-0.2748854, -0.2379937, -2.327173, 0, 0, 0, 1, 1,
-0.2748689, 1.635184, -0.2062379, 1, 1, 1, 1, 1,
-0.2744971, 0.01160396, -2.046855, 1, 1, 1, 1, 1,
-0.2612165, 2.175887, -1.64623, 1, 1, 1, 1, 1,
-0.2552884, -1.700057, -3.251782, 1, 1, 1, 1, 1,
-0.2514981, -1.019788, -4.164362, 1, 1, 1, 1, 1,
-0.2495326, 1.097767, -0.7961209, 1, 1, 1, 1, 1,
-0.2493907, 0.8837116, 0.623453, 1, 1, 1, 1, 1,
-0.2484167, -0.8173583, -2.463729, 1, 1, 1, 1, 1,
-0.2473863, 1.531199, -1.140393, 1, 1, 1, 1, 1,
-0.2471008, -0.7779547, -2.298231, 1, 1, 1, 1, 1,
-0.2420829, 0.3883193, -0.4428633, 1, 1, 1, 1, 1,
-0.2415864, -2.413296, -2.874946, 1, 1, 1, 1, 1,
-0.2413833, -1.342359, -2.309466, 1, 1, 1, 1, 1,
-0.2400007, -0.1027781, -2.131905, 1, 1, 1, 1, 1,
-0.2378512, 1.465249, 0.2664654, 1, 1, 1, 1, 1,
-0.2374821, 0.4166635, -2.842303, 0, 0, 1, 1, 1,
-0.2359019, -1.094867, -1.952291, 1, 0, 0, 1, 1,
-0.2339429, -0.1041247, -2.316487, 1, 0, 0, 1, 1,
-0.2335617, -1.133356, -3.039434, 1, 0, 0, 1, 1,
-0.2311231, 0.450549, 0.05682839, 1, 0, 0, 1, 1,
-0.22805, -1.140401, -3.845956, 1, 0, 0, 1, 1,
-0.2278626, 0.03689139, -0.2931513, 0, 0, 0, 1, 1,
-0.2237931, 0.9888885, 1.152928, 0, 0, 0, 1, 1,
-0.222379, 0.1646359, -0.1563, 0, 0, 0, 1, 1,
-0.2213291, -0.003282808, -0.9037986, 0, 0, 0, 1, 1,
-0.217685, -0.006274118, -0.2916774, 0, 0, 0, 1, 1,
-0.2138584, 1.111388, -0.8262343, 0, 0, 0, 1, 1,
-0.2121826, -1.431138, -2.481052, 0, 0, 0, 1, 1,
-0.2085292, -1.359494, -2.108747, 1, 1, 1, 1, 1,
-0.208249, 0.5183616, -1.203005, 1, 1, 1, 1, 1,
-0.2072928, 1.410195, 0.6129001, 1, 1, 1, 1, 1,
-0.2065158, -0.1537347, -2.98753, 1, 1, 1, 1, 1,
-0.205181, 0.1480901, -1.927457, 1, 1, 1, 1, 1,
-0.2034607, -0.737191, -3.46346, 1, 1, 1, 1, 1,
-0.2026875, 0.8403834, 1.321792, 1, 1, 1, 1, 1,
-0.2020262, 0.03113068, -0.1221662, 1, 1, 1, 1, 1,
-0.1973895, 1.157808, -1.345311, 1, 1, 1, 1, 1,
-0.1960113, 0.2255305, -0.718891, 1, 1, 1, 1, 1,
-0.1957323, -0.4778616, -2.909301, 1, 1, 1, 1, 1,
-0.1941074, -1.839403, -2.553069, 1, 1, 1, 1, 1,
-0.1921505, -0.01369736, -2.919168, 1, 1, 1, 1, 1,
-0.1916219, -1.182936, -2.738025, 1, 1, 1, 1, 1,
-0.1904956, 0.3954833, -1.482335, 1, 1, 1, 1, 1,
-0.1875801, -0.3081006, -2.94467, 0, 0, 1, 1, 1,
-0.1869125, -1.207326, -4.669686, 1, 0, 0, 1, 1,
-0.1853087, -0.5219567, -0.4629968, 1, 0, 0, 1, 1,
-0.1833032, -0.2204003, -3.317583, 1, 0, 0, 1, 1,
-0.1818209, 0.4588798, -1.689139, 1, 0, 0, 1, 1,
-0.1815792, 1.407169, 0.3381478, 1, 0, 0, 1, 1,
-0.179866, 1.328925, -1.079138, 0, 0, 0, 1, 1,
-0.1749528, -0.05401409, -0.8669051, 0, 0, 0, 1, 1,
-0.1722703, -0.002258955, -2.889986, 0, 0, 0, 1, 1,
-0.1704801, 0.4650418, 1.389793, 0, 0, 0, 1, 1,
-0.1662683, 0.6520557, 0.5360619, 0, 0, 0, 1, 1,
-0.1648685, 0.5103348, -0.2755019, 0, 0, 0, 1, 1,
-0.1626533, -0.5457504, -2.516773, 0, 0, 0, 1, 1,
-0.1617897, -2.186217, -2.922077, 1, 1, 1, 1, 1,
-0.1596583, 2.354987, -0.3049014, 1, 1, 1, 1, 1,
-0.1585856, -0.6806355, -3.470466, 1, 1, 1, 1, 1,
-0.1542788, -0.4058098, -3.15574, 1, 1, 1, 1, 1,
-0.1499934, 0.5065919, -0.02901272, 1, 1, 1, 1, 1,
-0.1495183, 0.4842645, 0.04512045, 1, 1, 1, 1, 1,
-0.1461684, -0.1201697, -2.981342, 1, 1, 1, 1, 1,
-0.1412796, 1.136263, -0.775628, 1, 1, 1, 1, 1,
-0.1381956, 0.7290126, 0.6568369, 1, 1, 1, 1, 1,
-0.1371693, 0.428688, -2.098677, 1, 1, 1, 1, 1,
-0.1346701, 0.3780749, 0.1259474, 1, 1, 1, 1, 1,
-0.1327352, 0.2490969, -1.539643, 1, 1, 1, 1, 1,
-0.1313132, -0.8917934, -2.124054, 1, 1, 1, 1, 1,
-0.1271478, -0.01336389, -2.891707, 1, 1, 1, 1, 1,
-0.126903, -1.200765, -2.757743, 1, 1, 1, 1, 1,
-0.126368, -1.092048, -2.694772, 0, 0, 1, 1, 1,
-0.1249488, -0.2692993, -4.565672, 1, 0, 0, 1, 1,
-0.1228125, 1.018595, -1.876187, 1, 0, 0, 1, 1,
-0.1172327, 0.2962932, -0.2144006, 1, 0, 0, 1, 1,
-0.1168841, 0.510842, -1.730939, 1, 0, 0, 1, 1,
-0.1133521, 0.2823901, 0.3771549, 1, 0, 0, 1, 1,
-0.1128718, -2.516238, -2.847923, 0, 0, 0, 1, 1,
-0.1128096, 0.06496795, -2.125694, 0, 0, 0, 1, 1,
-0.1109607, -0.1873931, -3.25793, 0, 0, 0, 1, 1,
-0.1098967, 0.1887161, -1.410543, 0, 0, 0, 1, 1,
-0.1055897, -1.297906, -3.037477, 0, 0, 0, 1, 1,
-0.1043833, -2.195182, -3.956814, 0, 0, 0, 1, 1,
-0.09436197, -1.158816, -2.402003, 0, 0, 0, 1, 1,
-0.09425155, -0.01615088, -1.791904, 1, 1, 1, 1, 1,
-0.09330669, -0.3664874, -3.266374, 1, 1, 1, 1, 1,
-0.09251612, 1.191658, -0.8047285, 1, 1, 1, 1, 1,
-0.09069163, -1.84607, -4.263454, 1, 1, 1, 1, 1,
-0.09047213, -1.926007, -4.673975, 1, 1, 1, 1, 1,
-0.0831389, 0.8948259, -0.1853091, 1, 1, 1, 1, 1,
-0.07955161, 0.8779867, 0.07095353, 1, 1, 1, 1, 1,
-0.0785386, 0.9961602, 0.5316713, 1, 1, 1, 1, 1,
-0.07849265, 0.6450971, -0.4782299, 1, 1, 1, 1, 1,
-0.07768601, 1.010782, -0.7428464, 1, 1, 1, 1, 1,
-0.07465217, 0.07209972, -0.001800619, 1, 1, 1, 1, 1,
-0.07429308, 1.044977, 0.5848765, 1, 1, 1, 1, 1,
-0.07402746, 0.1075814, 1.198877, 1, 1, 1, 1, 1,
-0.06851844, -1.246993, -4.268938, 1, 1, 1, 1, 1,
-0.06686942, 0.7239262, -1.199227, 1, 1, 1, 1, 1,
-0.06642553, 0.9361445, 0.2867204, 0, 0, 1, 1, 1,
-0.0662986, -0.01136914, -0.2541619, 1, 0, 0, 1, 1,
-0.06560494, -0.9049439, -4.037335, 1, 0, 0, 1, 1,
-0.05690183, 1.716501, -1.019774, 1, 0, 0, 1, 1,
-0.05380995, -0.07150264, -3.963139, 1, 0, 0, 1, 1,
-0.05220234, 1.466656, 0.8352276, 1, 0, 0, 1, 1,
-0.04945503, -0.9253978, -3.041, 0, 0, 0, 1, 1,
-0.04655559, 1.265034, 0.8692334, 0, 0, 0, 1, 1,
-0.04263531, -1.328742, -3.609034, 0, 0, 0, 1, 1,
-0.03953503, -0.5051948, -0.7116534, 0, 0, 0, 1, 1,
-0.03717431, -1.495316, -3.917531, 0, 0, 0, 1, 1,
-0.03309939, -0.348689, -3.969727, 0, 0, 0, 1, 1,
-0.03298817, 1.398668, 0.9841349, 0, 0, 0, 1, 1,
-0.03268975, -0.5207068, -3.443058, 1, 1, 1, 1, 1,
-0.03178846, 0.9573935, -1.073667, 1, 1, 1, 1, 1,
-0.02810645, -0.9820002, -3.126225, 1, 1, 1, 1, 1,
-0.02089209, 0.1114462, 0.66351, 1, 1, 1, 1, 1,
-0.01762858, 1.12259, -0.4181087, 1, 1, 1, 1, 1,
-0.01335534, 0.8359224, 0.6953763, 1, 1, 1, 1, 1,
-0.00660956, 0.1085758, -0.4253596, 1, 1, 1, 1, 1,
-0.005077671, -1.122072, -4.225707, 1, 1, 1, 1, 1,
-0.00422822, -2.188756, -3.899315, 1, 1, 1, 1, 1,
-0.0009693443, -0.9321989, -3.902497, 1, 1, 1, 1, 1,
-0.0004642006, -0.9843011, -3.97034, 1, 1, 1, 1, 1,
0.0006325445, -0.1308926, 2.771956, 1, 1, 1, 1, 1,
0.004241225, -1.106224, 4.969278, 1, 1, 1, 1, 1,
0.006553735, -0.8229756, 3.72962, 1, 1, 1, 1, 1,
0.008301653, 1.474348, 0.2855995, 1, 1, 1, 1, 1,
0.01014283, 0.5067064, 1.047053, 0, 0, 1, 1, 1,
0.01040222, 0.4902619, -0.2255996, 1, 0, 0, 1, 1,
0.01101576, -1.186251, 2.279408, 1, 0, 0, 1, 1,
0.0114832, -0.322092, 3.331818, 1, 0, 0, 1, 1,
0.01456959, -0.06517693, 4.118722, 1, 0, 0, 1, 1,
0.01563828, -0.08374596, 3.161474, 1, 0, 0, 1, 1,
0.01856943, -0.1261183, 3.45976, 0, 0, 0, 1, 1,
0.02241823, 1.337533, 0.7556645, 0, 0, 0, 1, 1,
0.02338653, 1.119266, 0.5486829, 0, 0, 0, 1, 1,
0.02441062, -1.212121, 5.555576, 0, 0, 0, 1, 1,
0.03080796, -1.417453, 2.376351, 0, 0, 0, 1, 1,
0.03349399, 0.5092109, 1.989534, 0, 0, 0, 1, 1,
0.03467144, -0.3432068, 4.301544, 0, 0, 0, 1, 1,
0.03717285, 0.2627032, 0.6097813, 1, 1, 1, 1, 1,
0.03909177, 0.3769791, -1.432064, 1, 1, 1, 1, 1,
0.04133886, 1.726584, -0.1271437, 1, 1, 1, 1, 1,
0.04513118, -0.09118077, 1.168689, 1, 1, 1, 1, 1,
0.04556064, 0.6261036, -0.2556665, 1, 1, 1, 1, 1,
0.04635092, -0.1953588, 2.614264, 1, 1, 1, 1, 1,
0.04636013, 0.8061525, -1.27076, 1, 1, 1, 1, 1,
0.05013781, 0.1588988, 0.9531341, 1, 1, 1, 1, 1,
0.05030392, 2.011347, -0.75123, 1, 1, 1, 1, 1,
0.05601006, 2.19497, -0.346493, 1, 1, 1, 1, 1,
0.05754257, -0.7662475, 4.170424, 1, 1, 1, 1, 1,
0.05857512, 0.5032242, -1.577601, 1, 1, 1, 1, 1,
0.0667301, -1.183206, 3.802832, 1, 1, 1, 1, 1,
0.06805863, 0.2647322, 0.8904404, 1, 1, 1, 1, 1,
0.06976897, -0.464303, 3.552811, 1, 1, 1, 1, 1,
0.07019188, -1.141917, 2.366668, 0, 0, 1, 1, 1,
0.07095043, -0.8707247, 2.530416, 1, 0, 0, 1, 1,
0.07571691, -0.1172046, 4.071288, 1, 0, 0, 1, 1,
0.07573266, 0.196328, 0.6157522, 1, 0, 0, 1, 1,
0.07689815, -1.889244, 3.126555, 1, 0, 0, 1, 1,
0.08095071, 1.048839, -0.5039266, 1, 0, 0, 1, 1,
0.08175516, -0.08768399, 2.166606, 0, 0, 0, 1, 1,
0.08927242, -0.5627285, 2.781154, 0, 0, 0, 1, 1,
0.09605066, -1.646904, 1.989856, 0, 0, 0, 1, 1,
0.0963082, 0.117428, 1.678074, 0, 0, 0, 1, 1,
0.09656065, 1.621821, 0.6671634, 0, 0, 0, 1, 1,
0.09678976, 2.092379, -0.2231348, 0, 0, 0, 1, 1,
0.09793757, -0.2314114, 2.270491, 0, 0, 0, 1, 1,
0.09879345, 0.6510233, 0.890735, 1, 1, 1, 1, 1,
0.1015992, -0.3913525, 4.829507, 1, 1, 1, 1, 1,
0.1017291, -0.4317745, 2.779795, 1, 1, 1, 1, 1,
0.1040271, 0.8056592, 0.354365, 1, 1, 1, 1, 1,
0.1062718, -1.150815, 2.769462, 1, 1, 1, 1, 1,
0.1081619, -1.71868, 2.163944, 1, 1, 1, 1, 1,
0.1101953, 1.032633, 1.754635, 1, 1, 1, 1, 1,
0.1132032, 1.716885, -1.981718, 1, 1, 1, 1, 1,
0.1153312, -0.7160144, 3.458986, 1, 1, 1, 1, 1,
0.1322829, 1.369116, 1.815646, 1, 1, 1, 1, 1,
0.1329866, -0.9587091, 5.318629, 1, 1, 1, 1, 1,
0.135324, -0.5533754, 2.628966, 1, 1, 1, 1, 1,
0.1371248, -0.5908738, 4.641007, 1, 1, 1, 1, 1,
0.1390316, -3.011039, 3.258995, 1, 1, 1, 1, 1,
0.1414467, -1.335352, 3.904834, 1, 1, 1, 1, 1,
0.1416735, -1.58812, 2.913471, 0, 0, 1, 1, 1,
0.1463018, 1.326752, -0.9716507, 1, 0, 0, 1, 1,
0.1474557, -0.9129143, 5.389888, 1, 0, 0, 1, 1,
0.1498931, 0.3258812, 1.634637, 1, 0, 0, 1, 1,
0.1537609, 0.3254774, 0.9529406, 1, 0, 0, 1, 1,
0.1561837, -2.674227, 2.796474, 1, 0, 0, 1, 1,
0.1594346, -0.9469969, 1.773347, 0, 0, 0, 1, 1,
0.1598546, -1.265108, 4.30836, 0, 0, 0, 1, 1,
0.1608819, -1.030813, 2.884126, 0, 0, 0, 1, 1,
0.1612682, -0.04146824, 0.7902968, 0, 0, 0, 1, 1,
0.1712088, 0.3488827, 0.6315845, 0, 0, 0, 1, 1,
0.1720829, -0.3370402, 2.229235, 0, 0, 0, 1, 1,
0.176903, -1.014969, 2.380327, 0, 0, 0, 1, 1,
0.1789701, -0.08591505, 2.518453, 1, 1, 1, 1, 1,
0.1824954, -1.226332, 3.457887, 1, 1, 1, 1, 1,
0.1835003, 0.3156146, 0.9578241, 1, 1, 1, 1, 1,
0.1890502, 0.7280284, 1.498526, 1, 1, 1, 1, 1,
0.1944381, -1.537608, 3.155423, 1, 1, 1, 1, 1,
0.2008697, -0.2167675, 1.768659, 1, 1, 1, 1, 1,
0.2065265, 1.518308, -0.1592417, 1, 1, 1, 1, 1,
0.2067421, -0.1234084, 3.130923, 1, 1, 1, 1, 1,
0.2096711, 0.9440382, 0.3583037, 1, 1, 1, 1, 1,
0.2151203, -1.287516, 1.288844, 1, 1, 1, 1, 1,
0.2173411, 0.5733345, 0.9943382, 1, 1, 1, 1, 1,
0.2210828, -0.730652, 3.50853, 1, 1, 1, 1, 1,
0.2261307, 0.449275, 0.168927, 1, 1, 1, 1, 1,
0.2370494, 1.572022, -0.3456643, 1, 1, 1, 1, 1,
0.2392784, -1.666503, 0.6178008, 1, 1, 1, 1, 1,
0.2393651, 1.005305, -0.3684694, 0, 0, 1, 1, 1,
0.2399712, 1.406255, -0.2451979, 1, 0, 0, 1, 1,
0.2403609, 1.34478, -0.3013921, 1, 0, 0, 1, 1,
0.2419217, -0.5698286, 4.713996, 1, 0, 0, 1, 1,
0.2428025, 0.3129368, -0.4419593, 1, 0, 0, 1, 1,
0.2437088, -1.348946, 3.255326, 1, 0, 0, 1, 1,
0.2456259, 0.6827788, -0.2064396, 0, 0, 0, 1, 1,
0.2486153, -0.3018447, 3.364582, 0, 0, 0, 1, 1,
0.2516916, 1.009137, 0.5585793, 0, 0, 0, 1, 1,
0.2556319, 1.612708, -0.6143633, 0, 0, 0, 1, 1,
0.2588659, -2.048288, 2.927011, 0, 0, 0, 1, 1,
0.2590165, 0.8331514, 2.22816, 0, 0, 0, 1, 1,
0.2615885, -1.387397, 3.721582, 0, 0, 0, 1, 1,
0.262108, 0.8489822, -0.7525232, 1, 1, 1, 1, 1,
0.2672184, 1.908177, -0.6896101, 1, 1, 1, 1, 1,
0.2673704, 0.09952612, 1.059918, 1, 1, 1, 1, 1,
0.2747107, 1.36691, 0.7251273, 1, 1, 1, 1, 1,
0.276429, -0.05916843, 2.107417, 1, 1, 1, 1, 1,
0.2775568, 0.3006535, 2.041016, 1, 1, 1, 1, 1,
0.279137, -0.2999858, 2.657627, 1, 1, 1, 1, 1,
0.2792439, -0.8683745, 4.719926, 1, 1, 1, 1, 1,
0.2795451, -2.640103, 3.189054, 1, 1, 1, 1, 1,
0.2823104, 1.447378, -1.553627, 1, 1, 1, 1, 1,
0.2835793, 0.7163637, -1.024978, 1, 1, 1, 1, 1,
0.2862461, -1.223623, 1.98574, 1, 1, 1, 1, 1,
0.2876835, -0.8352438, 2.617109, 1, 1, 1, 1, 1,
0.2886924, -1.60534, 3.38361, 1, 1, 1, 1, 1,
0.2896259, -0.05322873, 0.1987435, 1, 1, 1, 1, 1,
0.2904281, -1.547837, 1.946274, 0, 0, 1, 1, 1,
0.2911096, -1.411374, 3.575896, 1, 0, 0, 1, 1,
0.2919989, -0.0143818, -0.2245795, 1, 0, 0, 1, 1,
0.2950579, -0.7019715, 1.925699, 1, 0, 0, 1, 1,
0.3027814, 0.8299667, 0.3715382, 1, 0, 0, 1, 1,
0.3047032, 0.3472045, -0.3940102, 1, 0, 0, 1, 1,
0.3082729, 0.08586154, 1.52091, 0, 0, 0, 1, 1,
0.3117672, 0.9546613, 0.9805204, 0, 0, 0, 1, 1,
0.3160401, -1.456879, 2.927198, 0, 0, 0, 1, 1,
0.3162359, 1.46305, -0.05645756, 0, 0, 0, 1, 1,
0.3204028, -0.3850465, 3.191274, 0, 0, 0, 1, 1,
0.32447, 0.1796523, -0.2429048, 0, 0, 0, 1, 1,
0.3257213, 0.01174094, 2.805449, 0, 0, 0, 1, 1,
0.3361021, 1.431768, -0.6701614, 1, 1, 1, 1, 1,
0.337277, 0.3964714, 0.3551895, 1, 1, 1, 1, 1,
0.3375751, -0.5565096, 2.787278, 1, 1, 1, 1, 1,
0.3377714, -0.7333673, 1.550996, 1, 1, 1, 1, 1,
0.3472273, -0.008151603, 0.2671737, 1, 1, 1, 1, 1,
0.3483905, 0.2599269, 2.664103, 1, 1, 1, 1, 1,
0.3557167, -0.1006128, 1.484143, 1, 1, 1, 1, 1,
0.3599712, -0.5861254, 2.45431, 1, 1, 1, 1, 1,
0.3602337, 0.1911645, 2.059776, 1, 1, 1, 1, 1,
0.3626232, -1.47502, 4.617053, 1, 1, 1, 1, 1,
0.3628175, -0.611262, 1.773308, 1, 1, 1, 1, 1,
0.3628609, 1.044558, 0.3491068, 1, 1, 1, 1, 1,
0.3630037, -0.4431705, 1.802524, 1, 1, 1, 1, 1,
0.3630569, 0.1199386, 0.5371359, 1, 1, 1, 1, 1,
0.3645399, -0.3373023, 2.708878, 1, 1, 1, 1, 1,
0.3720026, -0.4781619, 2.971408, 0, 0, 1, 1, 1,
0.3726612, 0.4744884, -0.4790572, 1, 0, 0, 1, 1,
0.3745563, 1.044676, 0.4135244, 1, 0, 0, 1, 1,
0.3756339, 1.138366, -0.1828995, 1, 0, 0, 1, 1,
0.3758447, 0.6190017, 3.308767, 1, 0, 0, 1, 1,
0.376856, -0.1076181, 1.989154, 1, 0, 0, 1, 1,
0.3796527, -0.8593513, 5.01001, 0, 0, 0, 1, 1,
0.3799024, -0.6116162, 4.576539, 0, 0, 0, 1, 1,
0.3842529, 2.032991, 1.588518, 0, 0, 0, 1, 1,
0.3920363, 0.2343205, 1.376519, 0, 0, 0, 1, 1,
0.3920686, 1.049545, 1.04266, 0, 0, 0, 1, 1,
0.394388, 0.0008508069, -0.2444261, 0, 0, 0, 1, 1,
0.3950766, 0.2892556, -0.8798875, 0, 0, 0, 1, 1,
0.3952557, -0.0201976, 0.7999102, 1, 1, 1, 1, 1,
0.400644, -0.2545954, 2.144528, 1, 1, 1, 1, 1,
0.4008831, 1.422204, 0.7745789, 1, 1, 1, 1, 1,
0.405074, -0.1237711, 1.790333, 1, 1, 1, 1, 1,
0.406504, -0.8079444, 2.993118, 1, 1, 1, 1, 1,
0.4068066, 1.165697, 1.263012, 1, 1, 1, 1, 1,
0.4109559, -1.002941, 2.03544, 1, 1, 1, 1, 1,
0.4120595, -1.56507, 1.530388, 1, 1, 1, 1, 1,
0.4154724, -1.63359, 3.674008, 1, 1, 1, 1, 1,
0.4230928, 0.002255745, 0.5414963, 1, 1, 1, 1, 1,
0.4235643, -0.192223, 2.306982, 1, 1, 1, 1, 1,
0.4247661, -0.4161776, 2.654887, 1, 1, 1, 1, 1,
0.4309426, 1.149705, 0.8408251, 1, 1, 1, 1, 1,
0.4377457, 0.2259519, 1.363421, 1, 1, 1, 1, 1,
0.440148, -0.9084796, 3.557768, 1, 1, 1, 1, 1,
0.4412303, 0.06084424, 1.023621, 0, 0, 1, 1, 1,
0.4440424, -0.2187325, 2.182255, 1, 0, 0, 1, 1,
0.4458653, 2.747334, -0.01960416, 1, 0, 0, 1, 1,
0.4465963, 0.1235908, 1.440256, 1, 0, 0, 1, 1,
0.4478374, -1.689776, 4.143716, 1, 0, 0, 1, 1,
0.4480011, 0.5519907, -0.2880393, 1, 0, 0, 1, 1,
0.4487428, -0.4046187, 0.6021429, 0, 0, 0, 1, 1,
0.4488927, -0.2561171, 0.5237647, 0, 0, 0, 1, 1,
0.4533254, -0.751513, 2.167283, 0, 0, 0, 1, 1,
0.4540862, -1.180737, 2.235685, 0, 0, 0, 1, 1,
0.4545428, 0.3903497, 0.669263, 0, 0, 0, 1, 1,
0.4585605, -0.8653805, 1.904034, 0, 0, 0, 1, 1,
0.459549, 0.5986181, 0.8990553, 0, 0, 0, 1, 1,
0.4600254, 0.3037676, 0.5732777, 1, 1, 1, 1, 1,
0.4630893, -0.7603796, 1.485595, 1, 1, 1, 1, 1,
0.4675865, 0.3983952, 1.549969, 1, 1, 1, 1, 1,
0.4699894, 1.073851, 0.7224044, 1, 1, 1, 1, 1,
0.4707483, 0.4242001, -0.4638374, 1, 1, 1, 1, 1,
0.4740705, 0.669424, 0.8459519, 1, 1, 1, 1, 1,
0.4763142, -0.8929881, 1.334754, 1, 1, 1, 1, 1,
0.4779098, 0.9754601, -0.9762203, 1, 1, 1, 1, 1,
0.4798814, 0.9642915, -0.5228406, 1, 1, 1, 1, 1,
0.4848861, -0.5435998, 1.804125, 1, 1, 1, 1, 1,
0.4863085, -1.044442, 2.197367, 1, 1, 1, 1, 1,
0.4914135, 0.676204, 1.201087, 1, 1, 1, 1, 1,
0.4919374, 1.54919, -0.688377, 1, 1, 1, 1, 1,
0.4939097, 0.1022936, 1.015386, 1, 1, 1, 1, 1,
0.4954156, -1.020263, 2.216423, 1, 1, 1, 1, 1,
0.4957411, 0.2356285, 1.759585, 0, 0, 1, 1, 1,
0.501296, 0.175303, 2.982586, 1, 0, 0, 1, 1,
0.5062489, -0.8181828, 2.173519, 1, 0, 0, 1, 1,
0.5103557, 0.5100198, 0.9083368, 1, 0, 0, 1, 1,
0.5134674, -1.608418, 2.371858, 1, 0, 0, 1, 1,
0.5167281, -0.8313744, 3.557471, 1, 0, 0, 1, 1,
0.5180055, 0.6103618, 2.960228, 0, 0, 0, 1, 1,
0.5194667, -1.01644, 3.901519, 0, 0, 0, 1, 1,
0.5231245, 0.9595563, 0.3147198, 0, 0, 0, 1, 1,
0.5255765, 0.3849937, -0.8903521, 0, 0, 0, 1, 1,
0.5299745, -0.4704176, 1.262052, 0, 0, 0, 1, 1,
0.5301362, 0.3074676, 2.088004, 0, 0, 0, 1, 1,
0.5307406, -0.5170948, 1.386057, 0, 0, 0, 1, 1,
0.5352164, 0.1989688, 0.9819076, 1, 1, 1, 1, 1,
0.536752, 1.518087, 1.305144, 1, 1, 1, 1, 1,
0.5375055, 0.0506319, 1.705287, 1, 1, 1, 1, 1,
0.5412617, -1.736887, 1.539606, 1, 1, 1, 1, 1,
0.5494666, -1.763662, 3.162783, 1, 1, 1, 1, 1,
0.5525627, -0.3051722, 2.691812, 1, 1, 1, 1, 1,
0.5531098, 0.1556769, 1.047426, 1, 1, 1, 1, 1,
0.5540454, 0.252353, -0.3449419, 1, 1, 1, 1, 1,
0.5567456, 0.6020849, 1.578695, 1, 1, 1, 1, 1,
0.5575015, -0.8799228, 3.179122, 1, 1, 1, 1, 1,
0.5581363, -0.8510989, 2.687773, 1, 1, 1, 1, 1,
0.5646216, 1.247376, 2.021354, 1, 1, 1, 1, 1,
0.5690027, 0.6439615, -1.056684, 1, 1, 1, 1, 1,
0.5719772, 0.2140675, 2.795865, 1, 1, 1, 1, 1,
0.5754788, 1.023764, -0.05992926, 1, 1, 1, 1, 1,
0.5777228, 1.268802, 1.343583, 0, 0, 1, 1, 1,
0.5792105, 0.8560577, 0.03972216, 1, 0, 0, 1, 1,
0.5805094, 0.4709389, 0.7553686, 1, 0, 0, 1, 1,
0.5813976, -0.6582798, 1.908234, 1, 0, 0, 1, 1,
0.5817485, 0.1385815, 1.576806, 1, 0, 0, 1, 1,
0.5826592, -0.3495053, 3.033125, 1, 0, 0, 1, 1,
0.5833584, -0.3311599, 1.3687, 0, 0, 0, 1, 1,
0.5844464, -0.6171283, 2.172878, 0, 0, 0, 1, 1,
0.5970408, 0.3220982, 0.2033177, 0, 0, 0, 1, 1,
0.5979863, 0.1144357, 3.829376, 0, 0, 0, 1, 1,
0.5982128, -0.3719908, 2.426835, 0, 0, 0, 1, 1,
0.6000003, -0.6686804, 4.201955, 0, 0, 0, 1, 1,
0.6020687, -0.1527625, 1.259316, 0, 0, 0, 1, 1,
0.6055099, -1.282037, 1.474077, 1, 1, 1, 1, 1,
0.6057631, -0.8075463, 1.982685, 1, 1, 1, 1, 1,
0.6077984, -0.1443662, 2.081033, 1, 1, 1, 1, 1,
0.6134875, 0.502416, 0.84339, 1, 1, 1, 1, 1,
0.6201476, -1.441449, 4.294966, 1, 1, 1, 1, 1,
0.6257284, -0.5015082, 2.398103, 1, 1, 1, 1, 1,
0.6272864, -0.3763624, 0.9947478, 1, 1, 1, 1, 1,
0.627405, -1.264771, 3.825449, 1, 1, 1, 1, 1,
0.6334028, -0.2746531, 2.024587, 1, 1, 1, 1, 1,
0.6344284, 0.09513398, 3.243489, 1, 1, 1, 1, 1,
0.6414422, 0.04661873, 1.331329, 1, 1, 1, 1, 1,
0.6427485, 0.4662708, 1.752041, 1, 1, 1, 1, 1,
0.6452463, 0.5710135, 1.849143, 1, 1, 1, 1, 1,
0.6474485, 0.1937117, 2.116934, 1, 1, 1, 1, 1,
0.647944, -1.045753, 3.665724, 1, 1, 1, 1, 1,
0.6500526, 0.5295805, 1.11828, 0, 0, 1, 1, 1,
0.6511987, 0.1434461, 0.7422935, 1, 0, 0, 1, 1,
0.6545959, 0.9277478, -0.3120011, 1, 0, 0, 1, 1,
0.6564369, 2.128828, 0.1908624, 1, 0, 0, 1, 1,
0.6623826, -0.9197998, 2.8516, 1, 0, 0, 1, 1,
0.6635326, 1.46631, 2.546882, 1, 0, 0, 1, 1,
0.6691239, 0.6221195, -0.4407495, 0, 0, 0, 1, 1,
0.6782643, -0.3691258, 1.582055, 0, 0, 0, 1, 1,
0.6855147, -0.4627313, 1.728073, 0, 0, 0, 1, 1,
0.688005, 0.2035728, 3.23175, 0, 0, 0, 1, 1,
0.688201, 0.2825439, 1.825816, 0, 0, 0, 1, 1,
0.6889418, 0.6069278, -0.8302935, 0, 0, 0, 1, 1,
0.6909606, -1.065234, 2.151133, 0, 0, 0, 1, 1,
0.7010152, 1.28391, -0.933803, 1, 1, 1, 1, 1,
0.7013408, 0.5120173, -0.8108335, 1, 1, 1, 1, 1,
0.7040807, 0.6396175, -0.9064795, 1, 1, 1, 1, 1,
0.707981, -0.8529019, 1.457203, 1, 1, 1, 1, 1,
0.711189, 0.5881563, 0.8524562, 1, 1, 1, 1, 1,
0.7118377, 1.380645, -0.1560692, 1, 1, 1, 1, 1,
0.7187504, -0.172505, 1.821676, 1, 1, 1, 1, 1,
0.7205194, -0.4171104, 2.213663, 1, 1, 1, 1, 1,
0.7214302, 1.256725, -1.414505, 1, 1, 1, 1, 1,
0.723797, -0.560762, 1.32511, 1, 1, 1, 1, 1,
0.7278138, -2.22998, 2.8212, 1, 1, 1, 1, 1,
0.7278874, 0.3552435, 0.5314323, 1, 1, 1, 1, 1,
0.7291963, -1.064973, 1.873739, 1, 1, 1, 1, 1,
0.731821, -0.9959466, 2.295213, 1, 1, 1, 1, 1,
0.7332266, 1.187842, 1.672142, 1, 1, 1, 1, 1,
0.7380667, 0.869454, 0.9493501, 0, 0, 1, 1, 1,
0.7426918, -0.7357731, 4.315398, 1, 0, 0, 1, 1,
0.7428052, -0.5840933, 0.7273062, 1, 0, 0, 1, 1,
0.743915, -1.221305, 2.347034, 1, 0, 0, 1, 1,
0.7604494, -0.1625626, 2.859248, 1, 0, 0, 1, 1,
0.7623596, -0.05036722, 2.510497, 1, 0, 0, 1, 1,
0.7650175, -0.4388604, 2.220392, 0, 0, 0, 1, 1,
0.773033, -0.7356312, 2.561592, 0, 0, 0, 1, 1,
0.7818777, 0.3848011, -0.5541688, 0, 0, 0, 1, 1,
0.7839417, 0.1021162, 0.6235035, 0, 0, 0, 1, 1,
0.7860239, -1.435533, 3.598406, 0, 0, 0, 1, 1,
0.8023241, -0.9282979, 3.268929, 0, 0, 0, 1, 1,
0.8046957, 1.718224, -0.5192283, 0, 0, 0, 1, 1,
0.8057059, 0.2987965, 1.996429, 1, 1, 1, 1, 1,
0.8057985, -0.1598823, 1.200715, 1, 1, 1, 1, 1,
0.8065735, 2.201983, -1.524501, 1, 1, 1, 1, 1,
0.8075016, -0.8498236, 2.218158, 1, 1, 1, 1, 1,
0.8093441, 1.319821, 1.38933, 1, 1, 1, 1, 1,
0.8116928, -0.04173984, 1.398907, 1, 1, 1, 1, 1,
0.8183755, 0.202997, 1.559727, 1, 1, 1, 1, 1,
0.82032, -1.133044, 3.278061, 1, 1, 1, 1, 1,
0.8235112, 0.7671364, 1.459208, 1, 1, 1, 1, 1,
0.8261628, 1.794957, -0.3997417, 1, 1, 1, 1, 1,
0.8273857, 1.248511, 1.22882, 1, 1, 1, 1, 1,
0.829073, -0.5757263, 3.853669, 1, 1, 1, 1, 1,
0.8309676, -0.2587963, 1.752658, 1, 1, 1, 1, 1,
0.8356473, 1.220366, 2.214617, 1, 1, 1, 1, 1,
0.8369451, -0.6327513, 3.627106, 1, 1, 1, 1, 1,
0.8419766, -0.5026448, 1.901145, 0, 0, 1, 1, 1,
0.8445781, -0.3316748, 1.417816, 1, 0, 0, 1, 1,
0.8451282, 2.35157, 0.0665428, 1, 0, 0, 1, 1,
0.8499032, -0.3499476, 1.235819, 1, 0, 0, 1, 1,
0.850906, 0.6035056, 1.435724, 1, 0, 0, 1, 1,
0.8534341, 1.425792, 0.9036381, 1, 0, 0, 1, 1,
0.8580748, 0.5815011, 1.434446, 0, 0, 0, 1, 1,
0.8617242, 1.269122, 0.5718859, 0, 0, 0, 1, 1,
0.8629318, -1.443132, 2.596514, 0, 0, 0, 1, 1,
0.8660713, 0.5689749, 0.8645159, 0, 0, 0, 1, 1,
0.8708822, -1.381679, 3.01673, 0, 0, 0, 1, 1,
0.8717324, -0.3657475, 3.582904, 0, 0, 0, 1, 1,
0.8732904, -1.727576, 3.697345, 0, 0, 0, 1, 1,
0.8733107, 1.221968, 0.2510566, 1, 1, 1, 1, 1,
0.8786442, -0.3440652, -0.1014674, 1, 1, 1, 1, 1,
0.8798349, 0.2624683, 0.9104524, 1, 1, 1, 1, 1,
0.8816868, -1.44539, 0.8224097, 1, 1, 1, 1, 1,
0.8862543, -2.261404, 1.972523, 1, 1, 1, 1, 1,
0.8867401, 0.44343, 1.485017, 1, 1, 1, 1, 1,
0.8882411, -2.037699, 2.096571, 1, 1, 1, 1, 1,
0.8925617, 0.4994407, 0.9519662, 1, 1, 1, 1, 1,
0.8990672, -0.9695929, 2.162532, 1, 1, 1, 1, 1,
0.8990899, -1.356283, 2.162807, 1, 1, 1, 1, 1,
0.9008962, 0.5182426, 2.508482, 1, 1, 1, 1, 1,
0.9078924, -1.083269, 1.357347, 1, 1, 1, 1, 1,
0.9083391, 0.2862252, 1.241519, 1, 1, 1, 1, 1,
0.9095066, -1.238623, 2.376063, 1, 1, 1, 1, 1,
0.9166714, 0.3238296, 2.308879, 1, 1, 1, 1, 1,
0.9236002, 0.6485757, 0.5129235, 0, 0, 1, 1, 1,
0.932647, 0.787542, 1.125134, 1, 0, 0, 1, 1,
0.9372081, 2.198361, 0.09234771, 1, 0, 0, 1, 1,
0.9423314, -1.997441, 4.484605, 1, 0, 0, 1, 1,
0.9427989, 0.2246903, 1.123569, 1, 0, 0, 1, 1,
0.9437299, -2.27443, 2.38527, 1, 0, 0, 1, 1,
0.9659098, 0.4085254, -0.9611034, 0, 0, 0, 1, 1,
0.967026, -1.067716, 2.15883, 0, 0, 0, 1, 1,
0.9671174, -0.9663821, 3.332389, 0, 0, 0, 1, 1,
0.9728444, -0.5934247, 1.661113, 0, 0, 0, 1, 1,
0.9803901, 1.260795, 1.017731, 0, 0, 0, 1, 1,
0.9864013, -1.991478, 4.557225, 0, 0, 0, 1, 1,
0.9876097, -0.7672148, 3.353206, 0, 0, 0, 1, 1,
0.9880015, -0.4053234, 3.335784, 1, 1, 1, 1, 1,
0.9965691, -0.5384014, 1.954133, 1, 1, 1, 1, 1,
0.9981863, -0.8744462, 1.961729, 1, 1, 1, 1, 1,
0.9989159, -1.566654, 3.186014, 1, 1, 1, 1, 1,
1.001486, -1.30389, 2.953465, 1, 1, 1, 1, 1,
1.015491, -0.205256, 3.128258, 1, 1, 1, 1, 1,
1.030574, 0.8476995, 1.672698, 1, 1, 1, 1, 1,
1.035077, 0.1186286, 1.1631, 1, 1, 1, 1, 1,
1.041193, 1.446864, -2.123408, 1, 1, 1, 1, 1,
1.05322, 0.03925642, 1.044925, 1, 1, 1, 1, 1,
1.053845, 1.094876, 0.6807339, 1, 1, 1, 1, 1,
1.058613, -1.208634, 3.307197, 1, 1, 1, 1, 1,
1.061044, -0.760114, 0.3846618, 1, 1, 1, 1, 1,
1.063412, -0.8960975, 1.406205, 1, 1, 1, 1, 1,
1.066958, -0.3933046, 2.272904, 1, 1, 1, 1, 1,
1.070083, -0.1691675, 3.492093, 0, 0, 1, 1, 1,
1.073843, 1.887431, 1.211527, 1, 0, 0, 1, 1,
1.076028, -0.02166226, 0.1268886, 1, 0, 0, 1, 1,
1.076149, 0.8605562, 5.398574, 1, 0, 0, 1, 1,
1.081105, 0.4529554, 3.047721, 1, 0, 0, 1, 1,
1.081525, 0.1772294, 3.248295, 1, 0, 0, 1, 1,
1.110621, -0.3746466, 1.968572, 0, 0, 0, 1, 1,
1.119739, 0.2414333, 2.966602, 0, 0, 0, 1, 1,
1.121379, 0.1834749, 2.347175, 0, 0, 0, 1, 1,
1.124569, -2.359895, 3.375421, 0, 0, 0, 1, 1,
1.12614, -0.5714307, 0.2017424, 0, 0, 0, 1, 1,
1.128249, 0.5693688, 2.201632, 0, 0, 0, 1, 1,
1.140198, 1.459214, 0.08402614, 0, 0, 0, 1, 1,
1.145698, 0.2196125, 1.855293, 1, 1, 1, 1, 1,
1.147362, 0.8420379, -1.213988, 1, 1, 1, 1, 1,
1.152313, -1.237849, 2.274484, 1, 1, 1, 1, 1,
1.158696, 0.1155163, 1.272034, 1, 1, 1, 1, 1,
1.162088, 0.3372006, 0.9428327, 1, 1, 1, 1, 1,
1.162572, -0.8297906, 2.131696, 1, 1, 1, 1, 1,
1.167899, -0.5130225, 1.029839, 1, 1, 1, 1, 1,
1.169801, 1.442733, 0.2909816, 1, 1, 1, 1, 1,
1.174286, -0.0140414, 0.7852668, 1, 1, 1, 1, 1,
1.177971, 0.9770434, -1.703078, 1, 1, 1, 1, 1,
1.178715, -0.2001492, 1.72567, 1, 1, 1, 1, 1,
1.194352, -0.4780864, 2.312796, 1, 1, 1, 1, 1,
1.198341, 0.7780214, 0.9470109, 1, 1, 1, 1, 1,
1.200644, -0.7902824, 3.55323, 1, 1, 1, 1, 1,
1.20156, -2.166843, 0.7029969, 1, 1, 1, 1, 1,
1.205186, -0.7859361, 1.287841, 0, 0, 1, 1, 1,
1.205997, -0.0368087, 1.850025, 1, 0, 0, 1, 1,
1.219366, 1.245738, 0.1656023, 1, 0, 0, 1, 1,
1.241448, -0.5735481, 1.36061, 1, 0, 0, 1, 1,
1.241581, 0.8531843, 0.9305646, 1, 0, 0, 1, 1,
1.262481, 0.5249153, 0.7498767, 1, 0, 0, 1, 1,
1.269485, -0.5015585, 1.40081, 0, 0, 0, 1, 1,
1.27018, 0.5117678, -0.1957373, 0, 0, 0, 1, 1,
1.282213, 0.6359724, 1.46059, 0, 0, 0, 1, 1,
1.286207, -0.149032, 0.5779692, 0, 0, 0, 1, 1,
1.289589, 1.163261, 1.173972, 0, 0, 0, 1, 1,
1.293378, -1.230645, 2.238533, 0, 0, 0, 1, 1,
1.300887, 1.079614, 0.8027077, 0, 0, 0, 1, 1,
1.303657, -0.6047067, 2.889091, 1, 1, 1, 1, 1,
1.306095, -0.5517977, 1.948274, 1, 1, 1, 1, 1,
1.310714, -0.7349293, 2.489585, 1, 1, 1, 1, 1,
1.31266, 1.003298, 1.727192, 1, 1, 1, 1, 1,
1.324951, -1.402862, 3.229483, 1, 1, 1, 1, 1,
1.339859, -0.6914352, 2.625818, 1, 1, 1, 1, 1,
1.342005, 1.130582, 0.7712105, 1, 1, 1, 1, 1,
1.343053, 0.4516502, 1.580465, 1, 1, 1, 1, 1,
1.348194, -1.108511, 1.832257, 1, 1, 1, 1, 1,
1.356189, -1.794195, 1.263851, 1, 1, 1, 1, 1,
1.362411, -0.3208576, 1.851601, 1, 1, 1, 1, 1,
1.367405, -0.8237548, 0.7298999, 1, 1, 1, 1, 1,
1.369724, 0.1523715, -1.171755, 1, 1, 1, 1, 1,
1.375762, 1.327695, -0.2836995, 1, 1, 1, 1, 1,
1.37635, -0.1430396, 1.339651, 1, 1, 1, 1, 1,
1.393211, -0.1347357, 1.538579, 0, 0, 1, 1, 1,
1.393683, -0.5351356, 0.9481677, 1, 0, 0, 1, 1,
1.397682, -1.463277, 3.221757, 1, 0, 0, 1, 1,
1.409878, 1.620112, 2.061298, 1, 0, 0, 1, 1,
1.417805, -0.9091858, 0.08660319, 1, 0, 0, 1, 1,
1.42078, 1.270275, 0.6805297, 1, 0, 0, 1, 1,
1.422213, 1.417129, 0.8950968, 0, 0, 0, 1, 1,
1.441017, 0.453324, 1.932139, 0, 0, 0, 1, 1,
1.45865, 0.7275858, 0.7171139, 0, 0, 0, 1, 1,
1.476806, -1.530736, 2.300496, 0, 0, 0, 1, 1,
1.494916, -0.9081228, 1.958938, 0, 0, 0, 1, 1,
1.501247, -0.3943884, 2.002709, 0, 0, 0, 1, 1,
1.504537, -0.1985875, 0.1386621, 0, 0, 0, 1, 1,
1.506625, 0.2968901, -0.5746735, 1, 1, 1, 1, 1,
1.510317, -0.8481914, 2.348342, 1, 1, 1, 1, 1,
1.512327, -0.2566465, 1.355509, 1, 1, 1, 1, 1,
1.51351, -0.6983972, 1.846525, 1, 1, 1, 1, 1,
1.519362, 0.3479527, -0.007728518, 1, 1, 1, 1, 1,
1.537461, 2.044298, -0.1473276, 1, 1, 1, 1, 1,
1.546067, 3.285979, 3.109293, 1, 1, 1, 1, 1,
1.566034, -0.4588671, 1.96898, 1, 1, 1, 1, 1,
1.568807, -0.5452319, 3.79559, 1, 1, 1, 1, 1,
1.574056, 0.627059, 1.820069, 1, 1, 1, 1, 1,
1.58249, 0.6102177, 2.487671, 1, 1, 1, 1, 1,
1.593968, -0.9279619, 0.636607, 1, 1, 1, 1, 1,
1.604483, 2.433045, -1.313306, 1, 1, 1, 1, 1,
1.621223, 0.3716593, 3.562317, 1, 1, 1, 1, 1,
1.622084, -0.1108928, 3.140924, 1, 1, 1, 1, 1,
1.653931, 1.66251, -0.1556284, 0, 0, 1, 1, 1,
1.68998, 1.241537, 0.3821749, 1, 0, 0, 1, 1,
1.693824, -0.8566319, 2.623655, 1, 0, 0, 1, 1,
1.710967, 0.7865719, 1.740359, 1, 0, 0, 1, 1,
1.725268, 0.109434, 0.8055341, 1, 0, 0, 1, 1,
1.727024, -2.372491, 1.56274, 1, 0, 0, 1, 1,
1.7361, -0.6777866, 1.065908, 0, 0, 0, 1, 1,
1.746849, -0.3697597, 3.238399, 0, 0, 0, 1, 1,
1.756781, -0.427887, 1.447013, 0, 0, 0, 1, 1,
1.756801, -0.5663533, 1.421357, 0, 0, 0, 1, 1,
1.758899, -0.5781373, 3.005014, 0, 0, 0, 1, 1,
1.763055, 0.2871513, -0.2778902, 0, 0, 0, 1, 1,
1.780362, -1.15149, 1.85368, 0, 0, 0, 1, 1,
1.806107, -1.131962, 3.778292, 1, 1, 1, 1, 1,
1.821185, -0.3823032, 0.03770692, 1, 1, 1, 1, 1,
1.82271, -1.50783, 1.927917, 1, 1, 1, 1, 1,
1.832097, 1.134487, 0.2368163, 1, 1, 1, 1, 1,
1.847759, -1.139329, 2.457654, 1, 1, 1, 1, 1,
1.851485, 0.1115804, 2.667491, 1, 1, 1, 1, 1,
1.86044, 1.859541, 1.043857, 1, 1, 1, 1, 1,
1.895595, -0.1264712, 2.440192, 1, 1, 1, 1, 1,
1.89692, 0.5763559, 1.303073, 1, 1, 1, 1, 1,
1.899159, 1.661666, 2.252444, 1, 1, 1, 1, 1,
1.930793, -0.8457698, 2.293193, 1, 1, 1, 1, 1,
2.044587, -0.6095619, 1.703711, 1, 1, 1, 1, 1,
2.053399, 0.2977622, 2.614581, 1, 1, 1, 1, 1,
2.059553, 1.036488, 1.617062, 1, 1, 1, 1, 1,
2.102026, 0.5307685, 1.866358, 1, 1, 1, 1, 1,
2.103294, -0.9111036, 3.268991, 0, 0, 1, 1, 1,
2.107077, 0.04594348, 1.882251, 1, 0, 0, 1, 1,
2.107935, -0.06935824, 1.615404, 1, 0, 0, 1, 1,
2.132193, -0.305458, 2.527169, 1, 0, 0, 1, 1,
2.185952, 0.712499, 1.902, 1, 0, 0, 1, 1,
2.209876, -1.221263, 2.363761, 1, 0, 0, 1, 1,
2.228892, -0.7209924, 2.320239, 0, 0, 0, 1, 1,
2.232522, 0.05204666, 1.439552, 0, 0, 0, 1, 1,
2.235024, 2.652714, 1.541797, 0, 0, 0, 1, 1,
2.306875, -1.36494, 3.355229, 0, 0, 0, 1, 1,
2.313875, 0.2644025, 0.7846059, 0, 0, 0, 1, 1,
2.351775, -1.593912, 1.507277, 0, 0, 0, 1, 1,
2.358866, -1.464261, 2.461892, 0, 0, 0, 1, 1,
2.361782, -1.003071, 2.180565, 1, 1, 1, 1, 1,
2.432657, -0.2600408, -0.7907423, 1, 1, 1, 1, 1,
2.480535, -1.204282, 0.4197468, 1, 1, 1, 1, 1,
2.724264, -0.7706198, 1.184765, 1, 1, 1, 1, 1,
2.934222, 0.7389227, -0.3847542, 1, 1, 1, 1, 1,
2.979162, -0.2832565, 0.6920735, 1, 1, 1, 1, 1,
3.211588, -0.469865, 1.312769, 1, 1, 1, 1, 1
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
var radius = 9.79378;
var distance = 34.40024;
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
mvMatrix.translate( -0.1697896, 0.1736143, 0.005451679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.40024);
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
