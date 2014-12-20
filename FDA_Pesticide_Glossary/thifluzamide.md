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
-3.428889, 1.879749, -1.015832, 1, 0, 0, 1,
-2.644404, -0.4283644, -0.6842838, 1, 0.007843138, 0, 1,
-2.54175, -0.07320569, -2.462948, 1, 0.01176471, 0, 1,
-2.42057, -0.628287, -2.00243, 1, 0.01960784, 0, 1,
-2.367702, -0.2542574, -1.712991, 1, 0.02352941, 0, 1,
-2.316017, -0.01206827, -1.501254, 1, 0.03137255, 0, 1,
-2.225283, -0.2705061, -2.628996, 1, 0.03529412, 0, 1,
-2.212521, 0.01676772, -0.4978847, 1, 0.04313726, 0, 1,
-2.162314, -1.272221, -2.48722, 1, 0.04705882, 0, 1,
-2.144994, 1.316467, 1.156576, 1, 0.05490196, 0, 1,
-2.138774, -0.6364669, -0.5362868, 1, 0.05882353, 0, 1,
-2.137413, -0.0581345, -0.4449681, 1, 0.06666667, 0, 1,
-2.093316, -1.66193, -2.040031, 1, 0.07058824, 0, 1,
-2.045076, 0.6607949, 0.1178339, 1, 0.07843138, 0, 1,
-2.019292, 0.4241695, -2.68039, 1, 0.08235294, 0, 1,
-2.010165, -1.116109, -2.178698, 1, 0.09019608, 0, 1,
-2.007948, 1.326831, -2.360499, 1, 0.09411765, 0, 1,
-1.965235, 1.146221, -0.1652676, 1, 0.1019608, 0, 1,
-1.953449, 0.9949048, -1.28936, 1, 0.1098039, 0, 1,
-1.941436, 0.1189707, -1.904397, 1, 0.1137255, 0, 1,
-1.936711, -1.173007, -0.4858663, 1, 0.1215686, 0, 1,
-1.86363, -0.9975295, -3.200835, 1, 0.1254902, 0, 1,
-1.860431, -0.2785155, -0.9974354, 1, 0.1333333, 0, 1,
-1.85644, -0.3905992, -0.5919229, 1, 0.1372549, 0, 1,
-1.848289, -0.2396311, 0.4178744, 1, 0.145098, 0, 1,
-1.812601, 1.616907, -1.38886, 1, 0.1490196, 0, 1,
-1.782183, 0.3403811, -4.038193, 1, 0.1568628, 0, 1,
-1.770676, 0.3716808, -1.256098, 1, 0.1607843, 0, 1,
-1.761841, 1.110769, -2.074831, 1, 0.1686275, 0, 1,
-1.761339, -0.6587402, -2.741834, 1, 0.172549, 0, 1,
-1.753481, 1.133788, -0.1839014, 1, 0.1803922, 0, 1,
-1.751342, 1.328807, -2.179887, 1, 0.1843137, 0, 1,
-1.749809, -1.392618, -3.032176, 1, 0.1921569, 0, 1,
-1.744492, 1.300358, -1.355442, 1, 0.1960784, 0, 1,
-1.715991, 1.407502, -2.06686, 1, 0.2039216, 0, 1,
-1.71592, -1.308237, -3.542746, 1, 0.2117647, 0, 1,
-1.693394, 2.040662, -0.01770373, 1, 0.2156863, 0, 1,
-1.663685, -0.5025858, -2.307069, 1, 0.2235294, 0, 1,
-1.641626, 1.310277, -1.929018, 1, 0.227451, 0, 1,
-1.637841, 0.1333219, -0.4415404, 1, 0.2352941, 0, 1,
-1.634774, -1.017369, -2.213107, 1, 0.2392157, 0, 1,
-1.633958, -0.5893928, -2.262219, 1, 0.2470588, 0, 1,
-1.627048, 1.700052, -0.8753266, 1, 0.2509804, 0, 1,
-1.626307, -1.356109, -2.363181, 1, 0.2588235, 0, 1,
-1.625582, 0.02425371, -1.295, 1, 0.2627451, 0, 1,
-1.623619, -0.7658757, -1.772102, 1, 0.2705882, 0, 1,
-1.623458, -1.940834, -1.932073, 1, 0.2745098, 0, 1,
-1.606096, -0.7462752, -1.686841, 1, 0.282353, 0, 1,
-1.593463, 1.580218, -0.8486867, 1, 0.2862745, 0, 1,
-1.553929, -0.3841254, -1.603995, 1, 0.2941177, 0, 1,
-1.553476, 1.103456, -1.072646, 1, 0.3019608, 0, 1,
-1.54457, -1.051957, -3.0515, 1, 0.3058824, 0, 1,
-1.503897, -0.645028, -1.624931, 1, 0.3137255, 0, 1,
-1.488187, -0.3790565, -2.448987, 1, 0.3176471, 0, 1,
-1.486314, 0.05885153, -2.957085, 1, 0.3254902, 0, 1,
-1.48353, -0.1258256, -2.729856, 1, 0.3294118, 0, 1,
-1.482825, -1.489056, -2.403018, 1, 0.3372549, 0, 1,
-1.465932, -0.3476988, -0.07539782, 1, 0.3411765, 0, 1,
-1.455229, -0.2382796, -1.303006, 1, 0.3490196, 0, 1,
-1.444764, -0.8247526, -2.256674, 1, 0.3529412, 0, 1,
-1.441154, 0.2842951, -2.298018, 1, 0.3607843, 0, 1,
-1.440464, -0.2167293, -0.897053, 1, 0.3647059, 0, 1,
-1.433162, -0.5814792, -1.818054, 1, 0.372549, 0, 1,
-1.426921, -1.232551, -1.80328, 1, 0.3764706, 0, 1,
-1.416372, 0.3121573, -2.44351, 1, 0.3843137, 0, 1,
-1.413634, -0.9294278, -1.241982, 1, 0.3882353, 0, 1,
-1.413517, -0.6047094, -1.378145, 1, 0.3960784, 0, 1,
-1.405199, -0.2319661, -2.285166, 1, 0.4039216, 0, 1,
-1.393872, 0.4415089, -1.341286, 1, 0.4078431, 0, 1,
-1.393327, -1.608115, -4.444911, 1, 0.4156863, 0, 1,
-1.390741, 1.09615, -0.2385372, 1, 0.4196078, 0, 1,
-1.389526, -1.265393, -0.9996312, 1, 0.427451, 0, 1,
-1.383802, -1.87936, -2.368484, 1, 0.4313726, 0, 1,
-1.37601, -0.9641528, -1.67579, 1, 0.4392157, 0, 1,
-1.370318, -1.309549, -2.650528, 1, 0.4431373, 0, 1,
-1.364899, -1.517985, -2.095487, 1, 0.4509804, 0, 1,
-1.351582, -0.9312962, -0.7818554, 1, 0.454902, 0, 1,
-1.341524, 0.7727861, -0.8313147, 1, 0.4627451, 0, 1,
-1.340307, -0.5354107, -2.533451, 1, 0.4666667, 0, 1,
-1.337449, 0.9642566, -1.169985, 1, 0.4745098, 0, 1,
-1.335712, -0.4837076, -1.68071, 1, 0.4784314, 0, 1,
-1.329726, -0.3399273, -1.429736, 1, 0.4862745, 0, 1,
-1.327523, 3.502964, 0.5490741, 1, 0.4901961, 0, 1,
-1.324045, -0.7201864, -1.385386, 1, 0.4980392, 0, 1,
-1.318197, 0.59221, -0.7727432, 1, 0.5058824, 0, 1,
-1.29383, 0.8403302, -0.08881628, 1, 0.509804, 0, 1,
-1.293182, -0.2564434, -0.9587942, 1, 0.5176471, 0, 1,
-1.292567, 0.1874512, -2.485925, 1, 0.5215687, 0, 1,
-1.290283, 1.244436, 0.3874344, 1, 0.5294118, 0, 1,
-1.274568, -1.536084, -3.130068, 1, 0.5333334, 0, 1,
-1.272469, -0.7172215, -3.950051, 1, 0.5411765, 0, 1,
-1.266837, 0.9574826, -1.174522, 1, 0.5450981, 0, 1,
-1.258486, -0.6595476, -2.745762, 1, 0.5529412, 0, 1,
-1.251371, 0.4182275, -2.534959, 1, 0.5568628, 0, 1,
-1.245849, 0.01602744, -1.296387, 1, 0.5647059, 0, 1,
-1.243184, 0.9294727, -2.106241, 1, 0.5686275, 0, 1,
-1.239966, 0.1248515, -1.863654, 1, 0.5764706, 0, 1,
-1.235783, -0.3579056, -3.048838, 1, 0.5803922, 0, 1,
-1.22927, -0.4424047, -2.755353, 1, 0.5882353, 0, 1,
-1.228328, -1.22539, -0.3927611, 1, 0.5921569, 0, 1,
-1.214706, -1.191475, -1.692385, 1, 0.6, 0, 1,
-1.21317, -1.633076, -2.378735, 1, 0.6078432, 0, 1,
-1.205123, 0.03745788, -2.064077, 1, 0.6117647, 0, 1,
-1.197094, 0.02642417, -1.620708, 1, 0.6196079, 0, 1,
-1.192278, 0.7522788, -1.134972, 1, 0.6235294, 0, 1,
-1.185197, 0.5155329, -1.733339, 1, 0.6313726, 0, 1,
-1.184959, 0.3744955, -2.029094, 1, 0.6352941, 0, 1,
-1.183347, -0.3851264, -2.516812, 1, 0.6431373, 0, 1,
-1.180789, 1.423785, -1.128592, 1, 0.6470588, 0, 1,
-1.178612, 1.075828, 0.3874734, 1, 0.654902, 0, 1,
-1.178482, -0.7878099, -2.07974, 1, 0.6588235, 0, 1,
-1.177046, -0.6848387, -3.49619, 1, 0.6666667, 0, 1,
-1.164692, -0.910923, -2.302715, 1, 0.6705883, 0, 1,
-1.162908, -0.6539373, -1.368716, 1, 0.6784314, 0, 1,
-1.162482, 0.5080487, -2.6735, 1, 0.682353, 0, 1,
-1.162025, 1.338299, 1.36699, 1, 0.6901961, 0, 1,
-1.160969, -0.6172105, -0.4873382, 1, 0.6941177, 0, 1,
-1.139807, 0.7024944, -1.497581, 1, 0.7019608, 0, 1,
-1.139801, -0.1894987, -1.96179, 1, 0.7098039, 0, 1,
-1.131625, -1.267983, -4.599465, 1, 0.7137255, 0, 1,
-1.129098, -1.166153, 0.9932665, 1, 0.7215686, 0, 1,
-1.129077, 0.6280745, -1.245476, 1, 0.7254902, 0, 1,
-1.109637, 2.716822, 0.5292594, 1, 0.7333333, 0, 1,
-1.106274, 1.29257, -0.1294774, 1, 0.7372549, 0, 1,
-1.102804, -0.199877, -2.436806, 1, 0.7450981, 0, 1,
-1.100777, 0.9855676, -1.156373, 1, 0.7490196, 0, 1,
-1.095012, 0.1003622, -0.6337512, 1, 0.7568628, 0, 1,
-1.094868, 1.285657, -0.7485888, 1, 0.7607843, 0, 1,
-1.091992, -0.8494698, -2.399729, 1, 0.7686275, 0, 1,
-1.091376, -0.8332221, -1.711569, 1, 0.772549, 0, 1,
-1.078415, 0.3077633, -0.2317455, 1, 0.7803922, 0, 1,
-1.075957, -0.5178197, -2.820006, 1, 0.7843137, 0, 1,
-1.067872, 1.294361, -0.9192523, 1, 0.7921569, 0, 1,
-1.064107, -1.185946, -2.354846, 1, 0.7960784, 0, 1,
-1.063171, -0.5184759, -3.422114, 1, 0.8039216, 0, 1,
-1.062954, 0.5698382, -1.411243, 1, 0.8117647, 0, 1,
-1.060184, -0.3239971, -2.409665, 1, 0.8156863, 0, 1,
-1.057511, 0.4408704, -1.995387, 1, 0.8235294, 0, 1,
-1.056353, 1.457731, 0.272343, 1, 0.827451, 0, 1,
-1.05553, -1.287326, -2.245283, 1, 0.8352941, 0, 1,
-1.052098, -0.5706908, -3.171853, 1, 0.8392157, 0, 1,
-1.043458, 1.816135, -0.7988073, 1, 0.8470588, 0, 1,
-1.04068, -0.9832808, -2.050929, 1, 0.8509804, 0, 1,
-1.035299, 0.1974531, -2.518484, 1, 0.8588235, 0, 1,
-1.020052, -0.4663324, -1.034642, 1, 0.8627451, 0, 1,
-1.018423, -0.6781636, -2.984842, 1, 0.8705882, 0, 1,
-1.016019, -0.7886129, -3.121461, 1, 0.8745098, 0, 1,
-1.013724, 0.4850363, -1.498445, 1, 0.8823529, 0, 1,
-1.008886, -1.503696, -2.055574, 1, 0.8862745, 0, 1,
-0.9993252, -0.09308674, -0.4441667, 1, 0.8941177, 0, 1,
-0.9987931, 0.2633493, 0.1913652, 1, 0.8980392, 0, 1,
-0.9974685, 1.418625, -0.7127807, 1, 0.9058824, 0, 1,
-0.9958091, 0.09767751, -1.880338, 1, 0.9137255, 0, 1,
-0.9931396, -1.078085, -1.966632, 1, 0.9176471, 0, 1,
-0.9924105, 1.488252, -0.8801786, 1, 0.9254902, 0, 1,
-0.9877955, 0.7737827, -0.5415128, 1, 0.9294118, 0, 1,
-0.9721785, 0.04176368, -2.845597, 1, 0.9372549, 0, 1,
-0.9675032, -1.839683, -2.781467, 1, 0.9411765, 0, 1,
-0.9657398, -0.5734788, -0.600402, 1, 0.9490196, 0, 1,
-0.9587796, -0.4181509, -3.162942, 1, 0.9529412, 0, 1,
-0.9583383, 0.1116198, -1.371666, 1, 0.9607843, 0, 1,
-0.9577448, -0.8978997, -3.338472, 1, 0.9647059, 0, 1,
-0.955453, 1.881578, -1.44876, 1, 0.972549, 0, 1,
-0.9508052, -2.247675, -2.135068, 1, 0.9764706, 0, 1,
-0.9485517, -0.6110624, -2.570089, 1, 0.9843137, 0, 1,
-0.9453481, 2.541611, 0.3532712, 1, 0.9882353, 0, 1,
-0.9416257, -0.4357162, -0.7607732, 1, 0.9960784, 0, 1,
-0.9398119, 2.0679, -0.7169849, 0.9960784, 1, 0, 1,
-0.9387345, 0.7024701, -0.05985713, 0.9921569, 1, 0, 1,
-0.9365937, 1.245744, -1.428896, 0.9843137, 1, 0, 1,
-0.9338809, -0.843621, -0.8438233, 0.9803922, 1, 0, 1,
-0.9264363, 1.150642, -0.5582308, 0.972549, 1, 0, 1,
-0.9234269, -0.1084823, -0.9021551, 0.9686275, 1, 0, 1,
-0.9204444, 2.141151, -0.7152119, 0.9607843, 1, 0, 1,
-0.9188797, -0.6673744, -1.738426, 0.9568627, 1, 0, 1,
-0.9186441, 0.8607137, -0.4624982, 0.9490196, 1, 0, 1,
-0.9172049, 0.2731967, -3.226526, 0.945098, 1, 0, 1,
-0.9137986, 1.211522, -1.301196, 0.9372549, 1, 0, 1,
-0.9098696, -0.4324869, -2.165568, 0.9333333, 1, 0, 1,
-0.9095072, -1.242375, -2.333114, 0.9254902, 1, 0, 1,
-0.9035273, -1.510233, -3.957316, 0.9215686, 1, 0, 1,
-0.8973392, 0.8629618, -0.8095372, 0.9137255, 1, 0, 1,
-0.8959589, 0.3074359, -0.9238415, 0.9098039, 1, 0, 1,
-0.8954156, -2.180377, -3.04233, 0.9019608, 1, 0, 1,
-0.8930203, 0.7628542, -1.191903, 0.8941177, 1, 0, 1,
-0.8915918, -0.05131805, -3.676764, 0.8901961, 1, 0, 1,
-0.8854133, 0.5007846, -0.9697559, 0.8823529, 1, 0, 1,
-0.881459, -0.6135448, -3.046172, 0.8784314, 1, 0, 1,
-0.8777319, -1.717746, -3.175581, 0.8705882, 1, 0, 1,
-0.8727833, -0.8163412, -2.505881, 0.8666667, 1, 0, 1,
-0.8680205, 0.1408775, 0.17483, 0.8588235, 1, 0, 1,
-0.867392, -0.7939197, -2.341944, 0.854902, 1, 0, 1,
-0.8671715, 0.988605, 0.4864926, 0.8470588, 1, 0, 1,
-0.8655825, -0.8633502, -1.184612, 0.8431373, 1, 0, 1,
-0.8654983, -0.3442525, -1.811303, 0.8352941, 1, 0, 1,
-0.8649136, -1.196987, -1.728176, 0.8313726, 1, 0, 1,
-0.8545132, 1.235967, -0.6599612, 0.8235294, 1, 0, 1,
-0.8544429, 0.006165036, -3.069982, 0.8196079, 1, 0, 1,
-0.8495062, -0.03553323, -1.30539, 0.8117647, 1, 0, 1,
-0.8412845, -0.0692937, -1.555232, 0.8078431, 1, 0, 1,
-0.8411889, -0.3767093, -1.486603, 0.8, 1, 0, 1,
-0.8405634, 0.9734986, -0.8747463, 0.7921569, 1, 0, 1,
-0.8399878, 1.338766, -0.829106, 0.7882353, 1, 0, 1,
-0.8397371, 0.1023403, -0.3863764, 0.7803922, 1, 0, 1,
-0.8383127, 0.2190036, -1.838806, 0.7764706, 1, 0, 1,
-0.831625, 1.560086, -0.9556389, 0.7686275, 1, 0, 1,
-0.8252142, -0.6733792, -2.048158, 0.7647059, 1, 0, 1,
-0.8189064, 1.66029, 0.1144103, 0.7568628, 1, 0, 1,
-0.8186394, -0.6336798, -2.434744, 0.7529412, 1, 0, 1,
-0.8174815, 0.927025, 0.3346389, 0.7450981, 1, 0, 1,
-0.8174163, -0.1747321, 0.6176155, 0.7411765, 1, 0, 1,
-0.8168444, -0.7133867, -2.76299, 0.7333333, 1, 0, 1,
-0.8131526, -1.092855, -2.173697, 0.7294118, 1, 0, 1,
-0.8125597, -1.190732, -2.530159, 0.7215686, 1, 0, 1,
-0.8086392, -0.8752217, -1.99978, 0.7176471, 1, 0, 1,
-0.8083878, 0.101233, -1.876973, 0.7098039, 1, 0, 1,
-0.7994169, -0.8354588, -0.9520988, 0.7058824, 1, 0, 1,
-0.7962367, 0.2672974, -0.5991592, 0.6980392, 1, 0, 1,
-0.7920881, 0.4514913, -0.9752299, 0.6901961, 1, 0, 1,
-0.7886159, 0.4438013, -1.076949, 0.6862745, 1, 0, 1,
-0.7664234, 0.4393734, -2.203458, 0.6784314, 1, 0, 1,
-0.7648632, -1.664562, -4.288548, 0.6745098, 1, 0, 1,
-0.7608076, -1.182132, -4.252487, 0.6666667, 1, 0, 1,
-0.7545525, 3.063601, -0.5372148, 0.6627451, 1, 0, 1,
-0.7502303, 1.147453, -1.292381, 0.654902, 1, 0, 1,
-0.749145, -0.503357, -3.719493, 0.6509804, 1, 0, 1,
-0.7463103, 0.4246796, 0.941232, 0.6431373, 1, 0, 1,
-0.7395691, 1.988876, -0.05940011, 0.6392157, 1, 0, 1,
-0.725325, -1.123736, -0.8832186, 0.6313726, 1, 0, 1,
-0.711053, -0.3767175, -0.6973929, 0.627451, 1, 0, 1,
-0.7104817, -1.389924, -1.065521, 0.6196079, 1, 0, 1,
-0.709792, 2.547816, 0.7653776, 0.6156863, 1, 0, 1,
-0.7077457, -0.8413631, -3.523074, 0.6078432, 1, 0, 1,
-0.7044098, 0.6159662, -0.1979892, 0.6039216, 1, 0, 1,
-0.7032539, -0.4931126, -2.764745, 0.5960785, 1, 0, 1,
-0.7006907, -0.5104016, -2.926828, 0.5882353, 1, 0, 1,
-0.6972668, 1.301903, -2.159412, 0.5843138, 1, 0, 1,
-0.6957217, 0.261686, -0.2583823, 0.5764706, 1, 0, 1,
-0.6949327, 1.895882, 0.4809882, 0.572549, 1, 0, 1,
-0.6928359, -0.6523882, -1.423686, 0.5647059, 1, 0, 1,
-0.6916523, 2.534908, 1.51918, 0.5607843, 1, 0, 1,
-0.6906374, -0.9105033, -3.615021, 0.5529412, 1, 0, 1,
-0.6868448, -1.295601, -0.7743487, 0.5490196, 1, 0, 1,
-0.6859176, 1.170215, 2.587749, 0.5411765, 1, 0, 1,
-0.6812734, -0.4010218, -2.130093, 0.5372549, 1, 0, 1,
-0.6791236, -1.402736, -2.454876, 0.5294118, 1, 0, 1,
-0.6754771, 0.5552856, -1.392487, 0.5254902, 1, 0, 1,
-0.6748177, 0.103517, -0.7062804, 0.5176471, 1, 0, 1,
-0.6724658, 0.2314076, -1.391084, 0.5137255, 1, 0, 1,
-0.6696061, 0.2502729, -1.38779, 0.5058824, 1, 0, 1,
-0.6689928, 1.159126, -0.3229949, 0.5019608, 1, 0, 1,
-0.6635696, 1.101023, -1.059686, 0.4941176, 1, 0, 1,
-0.6568832, 1.427699, -0.3806095, 0.4862745, 1, 0, 1,
-0.6519048, 0.02723331, -1.105475, 0.4823529, 1, 0, 1,
-0.65033, 0.02711182, -1.370272, 0.4745098, 1, 0, 1,
-0.6498012, -0.369386, -3.772768, 0.4705882, 1, 0, 1,
-0.6478458, -0.6065559, -3.507292, 0.4627451, 1, 0, 1,
-0.6460277, -0.5431929, -1.193994, 0.4588235, 1, 0, 1,
-0.6388607, -1.013445, -2.37731, 0.4509804, 1, 0, 1,
-0.6339582, 0.3404576, -1.742192, 0.4470588, 1, 0, 1,
-0.6305031, 2.707435, -0.0744463, 0.4392157, 1, 0, 1,
-0.6225986, 1.071517, -3.026979, 0.4352941, 1, 0, 1,
-0.6186858, 1.191356, -0.5273715, 0.427451, 1, 0, 1,
-0.6183882, -0.3974322, -1.790606, 0.4235294, 1, 0, 1,
-0.6148105, 0.7701164, -0.7066405, 0.4156863, 1, 0, 1,
-0.6124529, 0.5523934, -1.760049, 0.4117647, 1, 0, 1,
-0.6110807, 1.187987, -1.385008, 0.4039216, 1, 0, 1,
-0.6024538, -0.9201029, -1.5864, 0.3960784, 1, 0, 1,
-0.6007401, 1.809098, 0.8121896, 0.3921569, 1, 0, 1,
-0.6007068, -0.2989745, -1.077934, 0.3843137, 1, 0, 1,
-0.5953803, -0.3849681, -1.620558, 0.3803922, 1, 0, 1,
-0.593238, 1.092685, 0.506558, 0.372549, 1, 0, 1,
-0.5923383, 1.542498, 0.5319739, 0.3686275, 1, 0, 1,
-0.5823622, -0.6430554, -0.7861616, 0.3607843, 1, 0, 1,
-0.5820696, -1.398843, -3.375748, 0.3568628, 1, 0, 1,
-0.5819726, -0.7704537, -1.735999, 0.3490196, 1, 0, 1,
-0.5791354, -0.7119514, -0.9624478, 0.345098, 1, 0, 1,
-0.5765189, -0.1427581, -1.876537, 0.3372549, 1, 0, 1,
-0.5719048, 0.4030542, 0.3931681, 0.3333333, 1, 0, 1,
-0.5616695, 1.282457, 0.461318, 0.3254902, 1, 0, 1,
-0.557874, 1.195754, -0.8615761, 0.3215686, 1, 0, 1,
-0.5575711, -0.8330849, -2.471095, 0.3137255, 1, 0, 1,
-0.5514007, -1.31596, -2.035475, 0.3098039, 1, 0, 1,
-0.5450739, 0.9252352, 0.6678153, 0.3019608, 1, 0, 1,
-0.5435934, 0.1068899, -1.523649, 0.2941177, 1, 0, 1,
-0.5381626, 0.1631715, 0.5345074, 0.2901961, 1, 0, 1,
-0.5346205, 1.241234, -1.600452, 0.282353, 1, 0, 1,
-0.5327599, -0.5857247, -2.817909, 0.2784314, 1, 0, 1,
-0.5313861, -1.654697, -1.833457, 0.2705882, 1, 0, 1,
-0.5312173, -0.5897818, -1.958944, 0.2666667, 1, 0, 1,
-0.5254933, 2.024483, -0.5189467, 0.2588235, 1, 0, 1,
-0.5233821, -0.1183184, -0.405963, 0.254902, 1, 0, 1,
-0.5216226, -1.099432, -2.100725, 0.2470588, 1, 0, 1,
-0.5190519, -0.0980077, -1.221764, 0.2431373, 1, 0, 1,
-0.5125851, 0.7443358, -2.854241, 0.2352941, 1, 0, 1,
-0.5064741, 0.1760931, 0.3439013, 0.2313726, 1, 0, 1,
-0.4959691, -1.059943, -2.203453, 0.2235294, 1, 0, 1,
-0.4955402, 0.1761572, 1.41444, 0.2196078, 1, 0, 1,
-0.4950711, 0.1637025, -0.429347, 0.2117647, 1, 0, 1,
-0.4940239, -0.9593765, -3.218791, 0.2078431, 1, 0, 1,
-0.4895271, -1.912217, -3.144225, 0.2, 1, 0, 1,
-0.4860799, 0.3351132, -0.2571621, 0.1921569, 1, 0, 1,
-0.4857346, -1.181471, 0.7799796, 0.1882353, 1, 0, 1,
-0.4837905, -0.1983487, -1.170939, 0.1803922, 1, 0, 1,
-0.4833379, -0.1073628, -0.9131318, 0.1764706, 1, 0, 1,
-0.4813627, -0.1763951, -2.519503, 0.1686275, 1, 0, 1,
-0.4804692, -1.3344, -2.99365, 0.1647059, 1, 0, 1,
-0.4803775, 0.4533828, -1.697192, 0.1568628, 1, 0, 1,
-0.476161, 0.807399, -0.6109011, 0.1529412, 1, 0, 1,
-0.4761457, 0.8847157, -0.6351315, 0.145098, 1, 0, 1,
-0.4747271, 0.8032017, 0.6318867, 0.1411765, 1, 0, 1,
-0.4726257, -1.113333, -3.096884, 0.1333333, 1, 0, 1,
-0.470548, -1.466594, -2.081266, 0.1294118, 1, 0, 1,
-0.4667779, 1.844144, -1.870721, 0.1215686, 1, 0, 1,
-0.459228, -0.2575109, -2.584064, 0.1176471, 1, 0, 1,
-0.458454, 0.882463, 0.8554866, 0.1098039, 1, 0, 1,
-0.4579564, -0.6316152, -4.979704, 0.1058824, 1, 0, 1,
-0.4574357, 1.227372, -0.523805, 0.09803922, 1, 0, 1,
-0.4557178, 3.211445, -1.279109, 0.09019608, 1, 0, 1,
-0.4556734, -0.5253964, -1.927597, 0.08627451, 1, 0, 1,
-0.4516346, -0.5896578, -2.098537, 0.07843138, 1, 0, 1,
-0.4485828, -0.1771484, -1.558465, 0.07450981, 1, 0, 1,
-0.4484937, -1.564859, -1.767524, 0.06666667, 1, 0, 1,
-0.4474407, -0.9661665, -1.617322, 0.0627451, 1, 0, 1,
-0.4473552, -1.801162, -2.230273, 0.05490196, 1, 0, 1,
-0.4379626, -0.8020279, -2.536668, 0.05098039, 1, 0, 1,
-0.433699, 1.361825, -1.039289, 0.04313726, 1, 0, 1,
-0.4221338, 0.8081691, -0.7908362, 0.03921569, 1, 0, 1,
-0.4203061, -0.1541286, -2.042122, 0.03137255, 1, 0, 1,
-0.4189441, 1.133101, 1.088579, 0.02745098, 1, 0, 1,
-0.4071273, 0.8982663, -1.132258, 0.01960784, 1, 0, 1,
-0.4070918, -1.519415, -2.204197, 0.01568628, 1, 0, 1,
-0.3954104, -1.701312, -2.3134, 0.007843138, 1, 0, 1,
-0.3900283, 0.4340503, -0.7372403, 0.003921569, 1, 0, 1,
-0.3896353, 0.1142243, -3.511767, 0, 1, 0.003921569, 1,
-0.3856848, -0.7796693, -3.058766, 0, 1, 0.01176471, 1,
-0.382318, -0.03764798, -1.582091, 0, 1, 0.01568628, 1,
-0.3817239, 0.2230715, 0.7662264, 0, 1, 0.02352941, 1,
-0.3785902, -0.008949137, -1.270753, 0, 1, 0.02745098, 1,
-0.3764952, -0.1292556, -0.730664, 0, 1, 0.03529412, 1,
-0.3744974, 1.484867, -0.4320565, 0, 1, 0.03921569, 1,
-0.3719136, -0.8199416, -2.739079, 0, 1, 0.04705882, 1,
-0.3688366, 0.7088867, -0.8594037, 0, 1, 0.05098039, 1,
-0.3655384, 0.1363627, -2.579211, 0, 1, 0.05882353, 1,
-0.365483, -1.786112, -3.491769, 0, 1, 0.0627451, 1,
-0.3634723, 0.04738786, -2.467655, 0, 1, 0.07058824, 1,
-0.3619671, 1.842453, -1.340404, 0, 1, 0.07450981, 1,
-0.3606709, -0.1072596, -2.200406, 0, 1, 0.08235294, 1,
-0.3575756, 0.6210338, 1.189253, 0, 1, 0.08627451, 1,
-0.3490706, -1.442697, -2.847426, 0, 1, 0.09411765, 1,
-0.3483634, -0.86742, -2.425034, 0, 1, 0.1019608, 1,
-0.3474712, -0.1256107, -2.870071, 0, 1, 0.1058824, 1,
-0.3458491, 0.259754, -1.339785, 0, 1, 0.1137255, 1,
-0.3452502, 0.8291009, -0.7017051, 0, 1, 0.1176471, 1,
-0.3390432, 0.6447347, -2.997437, 0, 1, 0.1254902, 1,
-0.3381034, -0.9469367, -3.725787, 0, 1, 0.1294118, 1,
-0.3352406, 0.1301259, -2.244583, 0, 1, 0.1372549, 1,
-0.3296371, 0.7193238, 0.04525644, 0, 1, 0.1411765, 1,
-0.3276493, -0.8648002, -2.374191, 0, 1, 0.1490196, 1,
-0.3257412, -0.155243, -3.4719, 0, 1, 0.1529412, 1,
-0.3237264, 0.4924173, 1.539349, 0, 1, 0.1607843, 1,
-0.313975, -0.601027, -3.686316, 0, 1, 0.1647059, 1,
-0.3114882, -0.2378938, -3.625854, 0, 1, 0.172549, 1,
-0.3088968, -0.1166698, -1.111905, 0, 1, 0.1764706, 1,
-0.3082605, -1.405989, -2.017747, 0, 1, 0.1843137, 1,
-0.3068906, -0.8663949, -3.596743, 0, 1, 0.1882353, 1,
-0.3044416, 1.094777, -0.9690216, 0, 1, 0.1960784, 1,
-0.3022006, -0.5370263, -2.468768, 0, 1, 0.2039216, 1,
-0.3007415, 0.6892427, 0.6579702, 0, 1, 0.2078431, 1,
-0.2982069, -2.085224, -2.761257, 0, 1, 0.2156863, 1,
-0.2979415, 0.9102255, 0.1780995, 0, 1, 0.2196078, 1,
-0.2938526, 0.1643248, -1.145546, 0, 1, 0.227451, 1,
-0.2929541, 0.5280886, -2.445018, 0, 1, 0.2313726, 1,
-0.2872719, 0.4411995, -0.1608261, 0, 1, 0.2392157, 1,
-0.2863271, 0.3622288, -0.278754, 0, 1, 0.2431373, 1,
-0.2831914, 0.2439974, -1.35451, 0, 1, 0.2509804, 1,
-0.2829038, -0.9374874, -2.181579, 0, 1, 0.254902, 1,
-0.2822804, -1.471776, -2.91493, 0, 1, 0.2627451, 1,
-0.2782743, -0.07696433, -2.359483, 0, 1, 0.2666667, 1,
-0.2772972, 1.655562, -1.71382, 0, 1, 0.2745098, 1,
-0.2759137, 0.1511073, -0.1512152, 0, 1, 0.2784314, 1,
-0.272861, 1.850963, -1.125145, 0, 1, 0.2862745, 1,
-0.2671477, -0.2955957, -2.82372, 0, 1, 0.2901961, 1,
-0.2569829, 0.684097, -0.9987812, 0, 1, 0.2980392, 1,
-0.2564085, -1.658783, -3.419153, 0, 1, 0.3058824, 1,
-0.2515095, 1.23708, 0.5930142, 0, 1, 0.3098039, 1,
-0.2499534, 1.145961, 1.933813, 0, 1, 0.3176471, 1,
-0.2476172, -0.1686317, -0.7493452, 0, 1, 0.3215686, 1,
-0.2401674, -1.626469, -3.638652, 0, 1, 0.3294118, 1,
-0.2379424, 1.761067, 1.204092, 0, 1, 0.3333333, 1,
-0.2337948, 0.6855553, -0.8796876, 0, 1, 0.3411765, 1,
-0.2279796, 0.08501378, -0.1101605, 0, 1, 0.345098, 1,
-0.2259334, 2.086124, -0.6082463, 0, 1, 0.3529412, 1,
-0.2219795, -2.008701, -3.105489, 0, 1, 0.3568628, 1,
-0.2184812, 0.3573608, -0.11522, 0, 1, 0.3647059, 1,
-0.2161486, 0.2368499, 0.3096814, 0, 1, 0.3686275, 1,
-0.2154803, 0.7175907, -0.4768099, 0, 1, 0.3764706, 1,
-0.2084378, 0.409373, 0.358774, 0, 1, 0.3803922, 1,
-0.2042149, -0.417329, -2.143441, 0, 1, 0.3882353, 1,
-0.2004506, -1.79688, -2.435731, 0, 1, 0.3921569, 1,
-0.1998167, 0.4623858, -1.331914, 0, 1, 0.4, 1,
-0.1963364, 1.100261, -0.2995709, 0, 1, 0.4078431, 1,
-0.1921479, 0.6378233, -0.5403164, 0, 1, 0.4117647, 1,
-0.191911, -0.7218192, -2.210593, 0, 1, 0.4196078, 1,
-0.1906581, -1.202025, -3.178473, 0, 1, 0.4235294, 1,
-0.1717588, 1.256746, -0.2077166, 0, 1, 0.4313726, 1,
-0.1631435, -0.08405259, -2.055622, 0, 1, 0.4352941, 1,
-0.1585304, -0.5732774, -1.956403, 0, 1, 0.4431373, 1,
-0.1556847, -0.005605537, -2.096877, 0, 1, 0.4470588, 1,
-0.1481355, 1.537638, -0.9225419, 0, 1, 0.454902, 1,
-0.1476071, 0.7471807, 0.012937, 0, 1, 0.4588235, 1,
-0.1464259, 0.5438604, -0.09949818, 0, 1, 0.4666667, 1,
-0.1453482, -1.409601, -3.478132, 0, 1, 0.4705882, 1,
-0.1332226, 0.851478, 0.4601912, 0, 1, 0.4784314, 1,
-0.1331337, -0.4176953, -3.350321, 0, 1, 0.4823529, 1,
-0.1317611, -0.8092519, -2.352628, 0, 1, 0.4901961, 1,
-0.127403, -0.9165938, -3.000149, 0, 1, 0.4941176, 1,
-0.1235093, -0.939645, -3.689562, 0, 1, 0.5019608, 1,
-0.1202825, 0.2707352, 0.2931762, 0, 1, 0.509804, 1,
-0.1190739, -1.095711, -3.462876, 0, 1, 0.5137255, 1,
-0.1178649, 0.1848191, 0.4597318, 0, 1, 0.5215687, 1,
-0.1099896, -0.8599371, -3.338036, 0, 1, 0.5254902, 1,
-0.1073144, 0.5475264, -0.2688587, 0, 1, 0.5333334, 1,
-0.1036524, -0.9909842, -3.894773, 0, 1, 0.5372549, 1,
-0.1006312, -1.897069, -4.263376, 0, 1, 0.5450981, 1,
-0.09961106, 0.5794899, -0.3411143, 0, 1, 0.5490196, 1,
-0.0991697, 0.4323433, -0.8077188, 0, 1, 0.5568628, 1,
-0.09501193, 1.633003, -0.8954222, 0, 1, 0.5607843, 1,
-0.0934739, 0.7208465, 1.713217, 0, 1, 0.5686275, 1,
-0.08406671, 0.6134758, -0.3215135, 0, 1, 0.572549, 1,
-0.08150999, -0.4499079, -2.91644, 0, 1, 0.5803922, 1,
-0.07592937, -0.3073687, -2.361845, 0, 1, 0.5843138, 1,
-0.07311918, -0.2833841, -2.309769, 0, 1, 0.5921569, 1,
-0.07065473, -0.2038791, -1.590998, 0, 1, 0.5960785, 1,
-0.06754385, 1.48257, 0.3851781, 0, 1, 0.6039216, 1,
-0.06666511, -0.9204039, -3.010088, 0, 1, 0.6117647, 1,
-0.06423245, -0.772568, -4.309978, 0, 1, 0.6156863, 1,
-0.06405557, -0.3736109, -1.694517, 0, 1, 0.6235294, 1,
-0.05858412, 0.5758008, -0.2169519, 0, 1, 0.627451, 1,
-0.05726189, -0.1151879, -2.82873, 0, 1, 0.6352941, 1,
-0.0570645, -0.9153661, -2.605051, 0, 1, 0.6392157, 1,
-0.05609784, 1.011665, -0.07084636, 0, 1, 0.6470588, 1,
-0.05546488, -0.1246327, -2.686081, 0, 1, 0.6509804, 1,
-0.05032767, 2.558077, 1.747978, 0, 1, 0.6588235, 1,
-0.04532071, 0.6928665, -2.492932, 0, 1, 0.6627451, 1,
-0.0398964, -1.289935, -3.446692, 0, 1, 0.6705883, 1,
-0.0379805, 0.305191, -1.741429, 0, 1, 0.6745098, 1,
-0.03716934, -0.4761775, -1.587099, 0, 1, 0.682353, 1,
-0.03554801, -0.680497, -2.995544, 0, 1, 0.6862745, 1,
-0.03493961, -0.9290085, -3.95576, 0, 1, 0.6941177, 1,
-0.03402748, 0.2924781, 1.085182, 0, 1, 0.7019608, 1,
-0.03374392, 2.702525, 0.4106669, 0, 1, 0.7058824, 1,
-0.03043626, -0.9088418, -3.59748, 0, 1, 0.7137255, 1,
-0.02831346, -1.291023, -1.991448, 0, 1, 0.7176471, 1,
-0.02829052, 0.006697726, -0.2926092, 0, 1, 0.7254902, 1,
-0.02636954, 1.309085, -1.859293, 0, 1, 0.7294118, 1,
-0.02525142, -0.4290752, -3.501305, 0, 1, 0.7372549, 1,
-0.02516999, 0.000129193, 0.486084, 0, 1, 0.7411765, 1,
-0.02501896, 2.534462, 2.425236, 0, 1, 0.7490196, 1,
-0.02418479, 1.83988, 0.5475398, 0, 1, 0.7529412, 1,
-0.02071716, 0.4998779, 1.291317, 0, 1, 0.7607843, 1,
-0.02043135, -1.088708, -3.264611, 0, 1, 0.7647059, 1,
-0.01872888, -0.4873584, -2.33863, 0, 1, 0.772549, 1,
-0.01478915, -1.426829, -2.653991, 0, 1, 0.7764706, 1,
-0.01174059, 0.7761379, -1.606242, 0, 1, 0.7843137, 1,
-0.0100055, -1.471238, -3.67419, 0, 1, 0.7882353, 1,
-0.009499998, 1.980106, -0.3098394, 0, 1, 0.7960784, 1,
-0.004557278, -0.56376, -3.131558, 0, 1, 0.8039216, 1,
-0.003333837, -1.978976, -1.885643, 0, 1, 0.8078431, 1,
-0.0007574684, -0.04168153, -3.137098, 0, 1, 0.8156863, 1,
8.149006e-05, 0.09208087, -0.601274, 0, 1, 0.8196079, 1,
0.0004989504, 0.7226511, 0.1307205, 0, 1, 0.827451, 1,
0.0005936084, -0.4464652, 2.92388, 0, 1, 0.8313726, 1,
0.003843345, -0.1151789, 0.69506, 0, 1, 0.8392157, 1,
0.005962946, -0.1182687, 1.213448, 0, 1, 0.8431373, 1,
0.006052936, -0.1504533, 4.510523, 0, 1, 0.8509804, 1,
0.006620875, -2.428559, 3.920292, 0, 1, 0.854902, 1,
0.007047688, 0.1994911, 0.2093779, 0, 1, 0.8627451, 1,
0.01258492, 1.874527, -0.04982888, 0, 1, 0.8666667, 1,
0.02186005, -0.7281065, 3.178293, 0, 1, 0.8745098, 1,
0.02228906, -0.2060964, 2.876699, 0, 1, 0.8784314, 1,
0.02384092, -0.6605095, 2.206418, 0, 1, 0.8862745, 1,
0.03540224, -0.03824034, 1.282206, 0, 1, 0.8901961, 1,
0.045506, 0.2120147, -0.3046525, 0, 1, 0.8980392, 1,
0.04700131, -0.5106273, 1.930161, 0, 1, 0.9058824, 1,
0.04700582, 0.5915937, -0.7437018, 0, 1, 0.9098039, 1,
0.04749092, 1.284899, -0.4426727, 0, 1, 0.9176471, 1,
0.05039384, 0.4556434, -1.744904, 0, 1, 0.9215686, 1,
0.05462951, -1.937211, 3.505586, 0, 1, 0.9294118, 1,
0.05499236, -0.03439511, 3.09738, 0, 1, 0.9333333, 1,
0.05512518, -0.1446221, 2.749972, 0, 1, 0.9411765, 1,
0.05803305, -1.124063, 2.722293, 0, 1, 0.945098, 1,
0.06290862, -0.3010267, 2.621677, 0, 1, 0.9529412, 1,
0.0648203, -0.8721803, 0.6897498, 0, 1, 0.9568627, 1,
0.06734675, -0.05162304, 1.37499, 0, 1, 0.9647059, 1,
0.06776878, -0.9004644, 3.546295, 0, 1, 0.9686275, 1,
0.07212721, -0.09276367, 1.910701, 0, 1, 0.9764706, 1,
0.07467846, 1.846067, -0.1574559, 0, 1, 0.9803922, 1,
0.07780632, 1.016945, -1.171946, 0, 1, 0.9882353, 1,
0.07839946, -1.702288, 2.171836, 0, 1, 0.9921569, 1,
0.07844812, 1.156985, 0.4924245, 0, 1, 1, 1,
0.08077396, -0.1880991, 3.67995, 0, 0.9921569, 1, 1,
0.0823954, 1.429471, -0.06342619, 0, 0.9882353, 1, 1,
0.08495172, -0.07580282, 1.089146, 0, 0.9803922, 1, 1,
0.09582418, -0.2794096, 2.563626, 0, 0.9764706, 1, 1,
0.102341, -2.140381, 2.745435, 0, 0.9686275, 1, 1,
0.1031594, -1.582395, 2.173457, 0, 0.9647059, 1, 1,
0.1032423, 0.3397064, 0.647772, 0, 0.9568627, 1, 1,
0.1034569, 1.46813, -0.1612512, 0, 0.9529412, 1, 1,
0.1047674, -1.262666, 4.243339, 0, 0.945098, 1, 1,
0.1062335, 0.4059418, -0.6408793, 0, 0.9411765, 1, 1,
0.1172369, 0.3304497, -1.232995, 0, 0.9333333, 1, 1,
0.1188953, -0.5800003, 2.869287, 0, 0.9294118, 1, 1,
0.1195975, -0.1903976, 2.425467, 0, 0.9215686, 1, 1,
0.1211849, -1.106663, 1.653948, 0, 0.9176471, 1, 1,
0.1213289, 0.6947086, -0.4852015, 0, 0.9098039, 1, 1,
0.1227267, 1.023301, 0.1003988, 0, 0.9058824, 1, 1,
0.1261286, -1.925292, 5.154735, 0, 0.8980392, 1, 1,
0.1285126, -0.08425267, 1.713285, 0, 0.8901961, 1, 1,
0.1337517, -0.6594523, 3.979141, 0, 0.8862745, 1, 1,
0.1370763, -0.05616437, 1.566277, 0, 0.8784314, 1, 1,
0.1400946, -0.6868318, 3.498195, 0, 0.8745098, 1, 1,
0.1425214, 0.822421, -1.262204, 0, 0.8666667, 1, 1,
0.1456598, 0.4759544, 0.4720378, 0, 0.8627451, 1, 1,
0.146173, -0.6296384, 2.842931, 0, 0.854902, 1, 1,
0.1491909, -0.185651, 3.218846, 0, 0.8509804, 1, 1,
0.1497605, -2.109962, 2.625531, 0, 0.8431373, 1, 1,
0.1500691, 1.053, 1.147914, 0, 0.8392157, 1, 1,
0.1510849, -0.6656495, 1.711151, 0, 0.8313726, 1, 1,
0.1512494, 0.6205451, 1.4274, 0, 0.827451, 1, 1,
0.1515737, 0.08268539, -0.7504911, 0, 0.8196079, 1, 1,
0.1520774, -1.380535, 4.155748, 0, 0.8156863, 1, 1,
0.1537098, 1.448245, -0.2423855, 0, 0.8078431, 1, 1,
0.1540003, -0.643807, 3.571259, 0, 0.8039216, 1, 1,
0.1564155, 0.3268753, 1.296331, 0, 0.7960784, 1, 1,
0.15874, -0.6785588, 2.128109, 0, 0.7882353, 1, 1,
0.1592661, -1.40231, 2.262508, 0, 0.7843137, 1, 1,
0.1666657, -0.9967771, 3.986635, 0, 0.7764706, 1, 1,
0.167722, 0.4127114, 1.185279, 0, 0.772549, 1, 1,
0.1697679, 0.4109121, 0.9513352, 0, 0.7647059, 1, 1,
0.1733954, -0.5604864, 2.385897, 0, 0.7607843, 1, 1,
0.1767946, -0.4864987, 2.581811, 0, 0.7529412, 1, 1,
0.1769672, 0.8222932, -0.4494563, 0, 0.7490196, 1, 1,
0.1796178, 0.8634799, -0.5100073, 0, 0.7411765, 1, 1,
0.1803193, -1.543443, 3.458313, 0, 0.7372549, 1, 1,
0.1810087, -0.006144589, 1.234354, 0, 0.7294118, 1, 1,
0.1812192, -0.2144068, 0.6890312, 0, 0.7254902, 1, 1,
0.1819934, 1.359649, -1.01496, 0, 0.7176471, 1, 1,
0.1824257, -0.08952069, 2.73694, 0, 0.7137255, 1, 1,
0.1831434, 0.3123129, 1.326724, 0, 0.7058824, 1, 1,
0.1878909, -1.754062, 5.726758, 0, 0.6980392, 1, 1,
0.1892401, 1.574867, -1.798832, 0, 0.6941177, 1, 1,
0.1899606, 0.3911354, -1.175065, 0, 0.6862745, 1, 1,
0.1926489, -1.90644, 1.085896, 0, 0.682353, 1, 1,
0.1932481, -0.06427354, 4.919686, 0, 0.6745098, 1, 1,
0.1932627, 0.9664901, 0.05363097, 0, 0.6705883, 1, 1,
0.1973212, 0.3178165, -1.82991, 0, 0.6627451, 1, 1,
0.197438, -0.02522905, 2.108484, 0, 0.6588235, 1, 1,
0.2046638, 0.6771694, 0.6197532, 0, 0.6509804, 1, 1,
0.2098291, -0.194482, 2.720609, 0, 0.6470588, 1, 1,
0.2098691, -0.8015544, 4.098832, 0, 0.6392157, 1, 1,
0.2107932, 0.3441981, -0.7026635, 0, 0.6352941, 1, 1,
0.2124065, -0.823826, 3.439727, 0, 0.627451, 1, 1,
0.2133853, 1.142568, 0.4673536, 0, 0.6235294, 1, 1,
0.2146151, 1.053384, 0.3292792, 0, 0.6156863, 1, 1,
0.2148375, 1.249858, -0.3176406, 0, 0.6117647, 1, 1,
0.2203251, 0.3617804, 0.7202128, 0, 0.6039216, 1, 1,
0.2206855, -0.09030932, 2.587659, 0, 0.5960785, 1, 1,
0.2222669, -0.4821326, 3.663161, 0, 0.5921569, 1, 1,
0.2324795, 0.2083277, -1.131431, 0, 0.5843138, 1, 1,
0.2333485, -0.4557262, 2.762566, 0, 0.5803922, 1, 1,
0.239153, 0.2994384, 1.359412, 0, 0.572549, 1, 1,
0.2437767, 0.0045819, 1.448861, 0, 0.5686275, 1, 1,
0.246675, -1.450286, 1.81863, 0, 0.5607843, 1, 1,
0.2488851, -0.510492, 1.879079, 0, 0.5568628, 1, 1,
0.2518926, 0.5806139, 0.7258639, 0, 0.5490196, 1, 1,
0.2522072, 1.28142, 0.02639205, 0, 0.5450981, 1, 1,
0.2533345, -1.72964, 2.742027, 0, 0.5372549, 1, 1,
0.2535295, 1.321427, 0.546701, 0, 0.5333334, 1, 1,
0.256239, 1.297502, 0.974651, 0, 0.5254902, 1, 1,
0.2566769, 0.8406774, -0.6994836, 0, 0.5215687, 1, 1,
0.2621318, 0.4670532, 1.826936, 0, 0.5137255, 1, 1,
0.2635625, 0.01940434, 3.446983, 0, 0.509804, 1, 1,
0.2659162, -0.9637727, 2.876692, 0, 0.5019608, 1, 1,
0.2668524, 2.396313, 0.04869269, 0, 0.4941176, 1, 1,
0.2680584, -0.3783679, 3.78741, 0, 0.4901961, 1, 1,
0.2685617, 0.5431851, 1.022165, 0, 0.4823529, 1, 1,
0.2724335, -0.1871955, 1.922968, 0, 0.4784314, 1, 1,
0.2747729, -0.497312, 2.879819, 0, 0.4705882, 1, 1,
0.2755127, 0.852923, 0.4097479, 0, 0.4666667, 1, 1,
0.2763046, -1.077666, 2.630811, 0, 0.4588235, 1, 1,
0.2765047, 1.699899, -0.5249892, 0, 0.454902, 1, 1,
0.2769606, 1.243142, 0.4363175, 0, 0.4470588, 1, 1,
0.2771927, 0.07351321, 2.303736, 0, 0.4431373, 1, 1,
0.2836802, -1.187387, 2.03727, 0, 0.4352941, 1, 1,
0.2847914, 1.5231, -0.6792141, 0, 0.4313726, 1, 1,
0.2863434, 1.37852, -0.7026997, 0, 0.4235294, 1, 1,
0.2873888, -0.4888518, 1.723816, 0, 0.4196078, 1, 1,
0.2883477, -0.2336357, 3.461797, 0, 0.4117647, 1, 1,
0.2898106, 0.3450658, 0.1092303, 0, 0.4078431, 1, 1,
0.2939578, 0.1922151, 0.6078569, 0, 0.4, 1, 1,
0.2956215, 0.5778639, -0.5279971, 0, 0.3921569, 1, 1,
0.2959571, 0.5240408, 0.2002772, 0, 0.3882353, 1, 1,
0.2961357, 0.8013477, 0.6798998, 0, 0.3803922, 1, 1,
0.2969136, -1.143793, 2.78638, 0, 0.3764706, 1, 1,
0.2980712, 0.3917374, 1.362668, 0, 0.3686275, 1, 1,
0.2998112, 1.657292, -0.4024318, 0, 0.3647059, 1, 1,
0.3046161, -0.3014854, 2.694209, 0, 0.3568628, 1, 1,
0.3083812, -0.493179, 1.701426, 0, 0.3529412, 1, 1,
0.3095935, 0.7226923, -0.5271339, 0, 0.345098, 1, 1,
0.3141299, -0.8225952, 3.448136, 0, 0.3411765, 1, 1,
0.3176528, 1.123562, 0.5610412, 0, 0.3333333, 1, 1,
0.3248591, 0.537518, -0.4274819, 0, 0.3294118, 1, 1,
0.3258395, 1.000552, -1.214562, 0, 0.3215686, 1, 1,
0.3270821, -1.181252, 2.797525, 0, 0.3176471, 1, 1,
0.3297114, 0.4921607, 0.4209534, 0, 0.3098039, 1, 1,
0.3310873, -0.1476452, 1.942687, 0, 0.3058824, 1, 1,
0.3392551, 0.3518583, -0.4551223, 0, 0.2980392, 1, 1,
0.3423764, -0.345772, 4.625609, 0, 0.2901961, 1, 1,
0.3444164, 0.1799006, 0.1268543, 0, 0.2862745, 1, 1,
0.3458952, 0.2092682, 1.473324, 0, 0.2784314, 1, 1,
0.3482635, 0.1764636, -1.452432, 0, 0.2745098, 1, 1,
0.3521269, -1.121554, 2.643174, 0, 0.2666667, 1, 1,
0.3564884, -0.3333573, 3.632221, 0, 0.2627451, 1, 1,
0.358015, -0.3808371, 3.077131, 0, 0.254902, 1, 1,
0.3587032, -0.5962067, 3.284055, 0, 0.2509804, 1, 1,
0.3626713, -0.17655, 2.847706, 0, 0.2431373, 1, 1,
0.3649659, 0.8553521, 0.2347024, 0, 0.2392157, 1, 1,
0.3710968, 0.4459833, 2.242771, 0, 0.2313726, 1, 1,
0.3730695, 0.2602172, 0.9332036, 0, 0.227451, 1, 1,
0.373706, -1.187552, 2.959239, 0, 0.2196078, 1, 1,
0.3799234, 0.9264832, -0.1146338, 0, 0.2156863, 1, 1,
0.385315, -0.0766995, 3.640983, 0, 0.2078431, 1, 1,
0.387244, -0.1635619, 4.06689, 0, 0.2039216, 1, 1,
0.38748, -0.3069301, 2.00616, 0, 0.1960784, 1, 1,
0.3886199, 0.07988937, -0.05736421, 0, 0.1882353, 1, 1,
0.3894309, 0.5015555, -0.1346495, 0, 0.1843137, 1, 1,
0.3935231, 0.4937766, -1.950771, 0, 0.1764706, 1, 1,
0.3940239, 0.2401572, 0.82749, 0, 0.172549, 1, 1,
0.3944373, 0.4484042, 1.542796, 0, 0.1647059, 1, 1,
0.3944699, -1.180997, 2.17721, 0, 0.1607843, 1, 1,
0.4005437, -0.5652953, 3.70215, 0, 0.1529412, 1, 1,
0.4030228, -0.8211824, 2.691629, 0, 0.1490196, 1, 1,
0.4059652, -0.8149073, 1.978142, 0, 0.1411765, 1, 1,
0.4064094, 0.6043892, 1.582131, 0, 0.1372549, 1, 1,
0.4078201, -0.1449506, 1.591426, 0, 0.1294118, 1, 1,
0.408909, -0.7324051, 4.135273, 0, 0.1254902, 1, 1,
0.4092941, -0.1706147, 2.620387, 0, 0.1176471, 1, 1,
0.4103845, 0.03134585, 2.092696, 0, 0.1137255, 1, 1,
0.4118975, -1.241485, 3.352268, 0, 0.1058824, 1, 1,
0.4155903, 0.05881569, -0.1880836, 0, 0.09803922, 1, 1,
0.4195464, -0.3960213, 2.780669, 0, 0.09411765, 1, 1,
0.4207389, -1.627623, 2.074351, 0, 0.08627451, 1, 1,
0.429138, 0.9747817, 0.2928983, 0, 0.08235294, 1, 1,
0.4345265, 0.6071883, 0.8945966, 0, 0.07450981, 1, 1,
0.4357411, 0.1581034, 2.587642, 0, 0.07058824, 1, 1,
0.439929, -0.5493968, 1.633315, 0, 0.0627451, 1, 1,
0.4411274, 0.3767968, 1.037237, 0, 0.05882353, 1, 1,
0.4478223, -0.1306566, -0.4882199, 0, 0.05098039, 1, 1,
0.4478584, 0.7797232, 1.651462, 0, 0.04705882, 1, 1,
0.4500678, 1.201992, -0.7381272, 0, 0.03921569, 1, 1,
0.4573616, 0.06642545, 0.9348252, 0, 0.03529412, 1, 1,
0.4574786, -0.5102684, 2.342887, 0, 0.02745098, 1, 1,
0.4582695, 0.2735384, 1.911347, 0, 0.02352941, 1, 1,
0.4597084, -0.6404669, 4.776083, 0, 0.01568628, 1, 1,
0.4619133, 1.325425, 1.890588, 0, 0.01176471, 1, 1,
0.4624207, 0.5783098, 2.163654, 0, 0.003921569, 1, 1,
0.4639651, 0.1135963, 3.804629, 0.003921569, 0, 1, 1,
0.466195, 0.9015378, -0.3800502, 0.007843138, 0, 1, 1,
0.4662075, -0.2287562, 1.858696, 0.01568628, 0, 1, 1,
0.4674822, 0.8946255, -0.1942613, 0.01960784, 0, 1, 1,
0.4682595, -0.9452052, 2.966816, 0.02745098, 0, 1, 1,
0.477146, -1.709013, 1.918507, 0.03137255, 0, 1, 1,
0.4891986, 1.430745, -0.2685338, 0.03921569, 0, 1, 1,
0.4898807, 0.1304824, 0.5205555, 0.04313726, 0, 1, 1,
0.4916619, 0.405422, 1.518332, 0.05098039, 0, 1, 1,
0.4925542, -0.04490011, 2.421113, 0.05490196, 0, 1, 1,
0.4938974, 0.5467651, 1.790753, 0.0627451, 0, 1, 1,
0.4955581, -0.1352255, 0.4419725, 0.06666667, 0, 1, 1,
0.4994831, 0.6147724, 0.3227951, 0.07450981, 0, 1, 1,
0.5007004, 0.4589559, 2.228255, 0.07843138, 0, 1, 1,
0.502668, 2.401853, -0.1177656, 0.08627451, 0, 1, 1,
0.5036792, -0.2785609, 2.190023, 0.09019608, 0, 1, 1,
0.5083387, -0.4267766, 0.8662586, 0.09803922, 0, 1, 1,
0.5104333, 0.4723819, 1.870741, 0.1058824, 0, 1, 1,
0.5105535, 0.7402123, 1.346512, 0.1098039, 0, 1, 1,
0.5134941, -0.825878, 4.962815, 0.1176471, 0, 1, 1,
0.5176296, -0.1287142, 1.232211, 0.1215686, 0, 1, 1,
0.521992, -0.8667131, 1.610194, 0.1294118, 0, 1, 1,
0.5248782, -0.8880345, 2.88131, 0.1333333, 0, 1, 1,
0.527, -0.7111521, 2.08432, 0.1411765, 0, 1, 1,
0.5275951, -0.9982383, 3.217405, 0.145098, 0, 1, 1,
0.5291562, -0.7546157, 2.275738, 0.1529412, 0, 1, 1,
0.5308785, 0.1895014, -0.06218447, 0.1568628, 0, 1, 1,
0.5363795, 1.0388, 1.034783, 0.1647059, 0, 1, 1,
0.5371974, 1.129261, -1.84983, 0.1686275, 0, 1, 1,
0.5372657, -0.1940836, 1.251706, 0.1764706, 0, 1, 1,
0.5385638, 0.2491688, 0.3937979, 0.1803922, 0, 1, 1,
0.5405539, -0.3675438, 3.430226, 0.1882353, 0, 1, 1,
0.5432806, 0.1161337, 0.1255768, 0.1921569, 0, 1, 1,
0.5467189, -1.446816, 2.086701, 0.2, 0, 1, 1,
0.5474233, -1.007453, 2.860594, 0.2078431, 0, 1, 1,
0.5477527, 0.8103939, 0.806582, 0.2117647, 0, 1, 1,
0.5480138, -0.7886288, 4.276546, 0.2196078, 0, 1, 1,
0.5486275, 0.06558379, 2.003924, 0.2235294, 0, 1, 1,
0.5514033, -0.4824483, 1.608672, 0.2313726, 0, 1, 1,
0.5526291, -0.5261804, 2.366145, 0.2352941, 0, 1, 1,
0.5640602, 0.2693236, 2.092561, 0.2431373, 0, 1, 1,
0.5656977, -0.1185563, 1.270608, 0.2470588, 0, 1, 1,
0.5667561, -0.4224404, 3.421057, 0.254902, 0, 1, 1,
0.5752061, -0.7609583, 1.575255, 0.2588235, 0, 1, 1,
0.5768861, -0.2530559, 3.594008, 0.2666667, 0, 1, 1,
0.5793956, 0.2543156, 0.4280773, 0.2705882, 0, 1, 1,
0.5815072, 2.121766, 0.09085607, 0.2784314, 0, 1, 1,
0.5819293, 0.6484412, -0.04355134, 0.282353, 0, 1, 1,
0.5824891, 0.09695023, 0.9552032, 0.2901961, 0, 1, 1,
0.5825595, 0.2603698, -0.0660226, 0.2941177, 0, 1, 1,
0.583496, -0.8061078, 3.922081, 0.3019608, 0, 1, 1,
0.5843669, 1.656836, 0.06346931, 0.3098039, 0, 1, 1,
0.5894433, -0.2766759, 1.296965, 0.3137255, 0, 1, 1,
0.5918658, 0.008920045, 1.683836, 0.3215686, 0, 1, 1,
0.5924025, -0.3867028, 1.859154, 0.3254902, 0, 1, 1,
0.5942328, 1.991992, 0.8508293, 0.3333333, 0, 1, 1,
0.5951926, 1.404503, -0.1742741, 0.3372549, 0, 1, 1,
0.5964879, 0.9653101, 0.1711704, 0.345098, 0, 1, 1,
0.5965684, 1.566149, 1.180923, 0.3490196, 0, 1, 1,
0.6027204, 0.7312573, 1.065289, 0.3568628, 0, 1, 1,
0.60419, -0.1854149, 1.846924, 0.3607843, 0, 1, 1,
0.6090638, 0.2250023, 2.720718, 0.3686275, 0, 1, 1,
0.6096339, -0.0004826984, 1.162072, 0.372549, 0, 1, 1,
0.6136747, 1.178905, 0.9845919, 0.3803922, 0, 1, 1,
0.615412, 0.768689, 0.615675, 0.3843137, 0, 1, 1,
0.6162214, 2.092116, -0.4255243, 0.3921569, 0, 1, 1,
0.6217167, -0.2407182, 0.9155897, 0.3960784, 0, 1, 1,
0.6327991, 1.929281, 1.670268, 0.4039216, 0, 1, 1,
0.6371729, 0.4519776, 1.427395, 0.4117647, 0, 1, 1,
0.6384679, -1.273019, 3.034882, 0.4156863, 0, 1, 1,
0.6421379, 0.5288177, 0.6494551, 0.4235294, 0, 1, 1,
0.6430629, 0.009496525, 0.2822914, 0.427451, 0, 1, 1,
0.6435481, -1.843203, 3.55044, 0.4352941, 0, 1, 1,
0.6457096, -1.737071, 1.707552, 0.4392157, 0, 1, 1,
0.6481811, -2.023507, 3.650543, 0.4470588, 0, 1, 1,
0.6497357, 0.9496278, 1.245924, 0.4509804, 0, 1, 1,
0.652331, 0.5051199, 2.080925, 0.4588235, 0, 1, 1,
0.6535226, 0.7149454, 2.831289, 0.4627451, 0, 1, 1,
0.6546382, 2.159209, 1.853165, 0.4705882, 0, 1, 1,
0.6579853, -0.684297, 2.758362, 0.4745098, 0, 1, 1,
0.6596019, 0.93986, 0.9522638, 0.4823529, 0, 1, 1,
0.6622431, 1.755851, -1.205024, 0.4862745, 0, 1, 1,
0.6633494, -1.132487, 2.192538, 0.4941176, 0, 1, 1,
0.6651332, -0.2343429, 1.552456, 0.5019608, 0, 1, 1,
0.6664372, -0.5935894, 2.109571, 0.5058824, 0, 1, 1,
0.6691408, 0.4868137, 1.335842, 0.5137255, 0, 1, 1,
0.6757127, -0.7744816, 1.4273, 0.5176471, 0, 1, 1,
0.6836942, -0.7536551, 2.060796, 0.5254902, 0, 1, 1,
0.685263, -0.7605426, 2.120119, 0.5294118, 0, 1, 1,
0.6885158, -0.6670569, 2.691107, 0.5372549, 0, 1, 1,
0.68968, -1.138755, 3.002137, 0.5411765, 0, 1, 1,
0.6910248, -0.7212611, 3.411349, 0.5490196, 0, 1, 1,
0.6965402, 0.7198491, 3.073668, 0.5529412, 0, 1, 1,
0.7006528, -0.05344285, -0.2714154, 0.5607843, 0, 1, 1,
0.7022596, 0.09324899, 2.478626, 0.5647059, 0, 1, 1,
0.7025838, -0.984867, 1.426279, 0.572549, 0, 1, 1,
0.7031564, 0.5995855, -0.4368927, 0.5764706, 0, 1, 1,
0.7033269, 0.5286908, 1.900404, 0.5843138, 0, 1, 1,
0.707195, 2.23986, 0.5893795, 0.5882353, 0, 1, 1,
0.7082441, 1.249372, 0.4856607, 0.5960785, 0, 1, 1,
0.7110957, -1.691314, 4.302094, 0.6039216, 0, 1, 1,
0.7154931, 0.1027753, 2.510108, 0.6078432, 0, 1, 1,
0.7173359, 0.1271659, -0.5627795, 0.6156863, 0, 1, 1,
0.7295304, 0.3178001, 0.3485121, 0.6196079, 0, 1, 1,
0.736271, -0.1098157, 2.778163, 0.627451, 0, 1, 1,
0.7415833, -0.3560128, 2.386621, 0.6313726, 0, 1, 1,
0.7482994, 0.7050943, 1.771213, 0.6392157, 0, 1, 1,
0.7569814, -2.130141, 2.100679, 0.6431373, 0, 1, 1,
0.7650199, 0.4709679, 1.470099, 0.6509804, 0, 1, 1,
0.7657291, 0.04285736, 1.578289, 0.654902, 0, 1, 1,
0.7672063, -0.2555361, 1.797356, 0.6627451, 0, 1, 1,
0.7682514, -1.250815, 0.532725, 0.6666667, 0, 1, 1,
0.7697713, 0.3821676, 0.3455264, 0.6745098, 0, 1, 1,
0.7737122, -0.2909283, 1.430164, 0.6784314, 0, 1, 1,
0.7746087, -1.413068, 1.369818, 0.6862745, 0, 1, 1,
0.7762051, 0.6154989, 2.715769, 0.6901961, 0, 1, 1,
0.7789435, -0.1428656, 1.212508, 0.6980392, 0, 1, 1,
0.7794608, -0.2595228, 1.142926, 0.7058824, 0, 1, 1,
0.7830552, 0.8160103, 1.606651, 0.7098039, 0, 1, 1,
0.7860974, -0.8379847, 2.085248, 0.7176471, 0, 1, 1,
0.7875906, 1.305416, 1.854177, 0.7215686, 0, 1, 1,
0.7900019, 1.563701, 1.062629, 0.7294118, 0, 1, 1,
0.7927449, -0.5119889, 1.379537, 0.7333333, 0, 1, 1,
0.7929239, -0.1353601, 0.4036987, 0.7411765, 0, 1, 1,
0.7932193, -0.1521739, 2.121045, 0.7450981, 0, 1, 1,
0.7984316, 1.157878, 0.7796558, 0.7529412, 0, 1, 1,
0.7992046, 1.09122, 0.9523551, 0.7568628, 0, 1, 1,
0.8011834, 1.784202, 1.917122, 0.7647059, 0, 1, 1,
0.8039371, 1.941625, 0.3734441, 0.7686275, 0, 1, 1,
0.8072761, 0.1102501, 2.582006, 0.7764706, 0, 1, 1,
0.8108729, -0.7572144, 1.788982, 0.7803922, 0, 1, 1,
0.8118435, 0.1301384, 2.736782, 0.7882353, 0, 1, 1,
0.8166969, -0.5081227, 2.43455, 0.7921569, 0, 1, 1,
0.8175077, 0.9475625, -0.1898727, 0.8, 0, 1, 1,
0.8258846, 0.2767646, 1.764118, 0.8078431, 0, 1, 1,
0.8299198, 0.01590634, 4.33288, 0.8117647, 0, 1, 1,
0.8493114, 1.559736, 1.025887, 0.8196079, 0, 1, 1,
0.8499143, -0.08058444, 1.101691, 0.8235294, 0, 1, 1,
0.8537377, 0.6117218, 1.761246, 0.8313726, 0, 1, 1,
0.8593245, 1.955737, 0.7488511, 0.8352941, 0, 1, 1,
0.8632405, -1.323791, 1.496389, 0.8431373, 0, 1, 1,
0.8680792, 0.9779521, 0.83964, 0.8470588, 0, 1, 1,
0.8710279, 0.01616999, 2.477101, 0.854902, 0, 1, 1,
0.8715004, 1.300328, 0.5878727, 0.8588235, 0, 1, 1,
0.8726922, -0.1426084, 0.9810838, 0.8666667, 0, 1, 1,
0.8783739, -0.8529465, 2.817928, 0.8705882, 0, 1, 1,
0.8783864, 0.1067927, 4.151127, 0.8784314, 0, 1, 1,
0.884241, 0.8801652, 0.5405664, 0.8823529, 0, 1, 1,
0.8881738, 0.7279099, 3.509032, 0.8901961, 0, 1, 1,
0.891573, 0.1155352, 1.625393, 0.8941177, 0, 1, 1,
0.8919609, -0.0872012, 3.050171, 0.9019608, 0, 1, 1,
0.8943021, -0.2553099, 1.924543, 0.9098039, 0, 1, 1,
0.8978412, -0.8765399, 2.775611, 0.9137255, 0, 1, 1,
0.9006628, -0.7109111, 2.783805, 0.9215686, 0, 1, 1,
0.913737, 0.9774361, 1.80365, 0.9254902, 0, 1, 1,
0.9140176, 0.02215848, 2.436816, 0.9333333, 0, 1, 1,
0.9169475, 1.40122, -0.2939713, 0.9372549, 0, 1, 1,
0.9177537, 0.1320564, 1.301406, 0.945098, 0, 1, 1,
0.9184989, 1.696133, -1.015841, 0.9490196, 0, 1, 1,
0.9215073, 1.153597, 0.05660502, 0.9568627, 0, 1, 1,
0.9243015, 0.9323438, 0.8573043, 0.9607843, 0, 1, 1,
0.924632, 0.4836623, 2.50156, 0.9686275, 0, 1, 1,
0.9291312, 1.427752, 0.2511826, 0.972549, 0, 1, 1,
0.9321872, 0.3112736, 1.998828, 0.9803922, 0, 1, 1,
0.938524, -0.2643382, 2.813311, 0.9843137, 0, 1, 1,
0.9460064, -0.6198899, 3.35585, 0.9921569, 0, 1, 1,
0.9485266, 0.2330841, 1.002634, 0.9960784, 0, 1, 1,
0.9512702, -1.050467, 2.299875, 1, 0, 0.9960784, 1,
0.9530774, -0.2501196, 2.55492, 1, 0, 0.9882353, 1,
0.9550413, -0.3388323, 1.443897, 1, 0, 0.9843137, 1,
0.958568, -0.3947612, 2.921187, 1, 0, 0.9764706, 1,
0.9647884, 0.2099097, 0.3146302, 1, 0, 0.972549, 1,
0.9662876, 1.254617, 1.658181, 1, 0, 0.9647059, 1,
0.9682696, -1.31982, 1.892404, 1, 0, 0.9607843, 1,
0.9722863, 1.197743, 0.5360851, 1, 0, 0.9529412, 1,
0.9733944, -0.2320196, 1.623879, 1, 0, 0.9490196, 1,
0.978045, -0.149482, 2.312117, 1, 0, 0.9411765, 1,
0.9819018, -0.7273512, 0.817226, 1, 0, 0.9372549, 1,
0.9854465, -0.0398108, 1.967939, 1, 0, 0.9294118, 1,
0.9932184, -0.8980448, 0.3056604, 1, 0, 0.9254902, 1,
0.9935763, -0.2290695, 2.146071, 1, 0, 0.9176471, 1,
0.9956588, -1.601544, 0.5775412, 1, 0, 0.9137255, 1,
0.9975978, -0.9382125, 2.611712, 1, 0, 0.9058824, 1,
1.006373, 1.061184, -0.01610039, 1, 0, 0.9019608, 1,
1.023402, 1.215146, 2.534591, 1, 0, 0.8941177, 1,
1.03235, 0.2723847, -0.1510054, 1, 0, 0.8862745, 1,
1.035155, 0.1745783, 0.3358925, 1, 0, 0.8823529, 1,
1.037536, 0.1752745, 2.797816, 1, 0, 0.8745098, 1,
1.041789, -1.129282, 3.501858, 1, 0, 0.8705882, 1,
1.04709, -3.533232, 3.023067, 1, 0, 0.8627451, 1,
1.048469, 0.8460455, -0.135907, 1, 0, 0.8588235, 1,
1.067351, -0.3106251, 3.925344, 1, 0, 0.8509804, 1,
1.068078, 1.5982, -0.2976502, 1, 0, 0.8470588, 1,
1.068385, 0.8633847, 1.902042, 1, 0, 0.8392157, 1,
1.07338, 2.066482, 1.150691, 1, 0, 0.8352941, 1,
1.082537, 0.5244836, 1.703663, 1, 0, 0.827451, 1,
1.088213, 0.2617179, 1.809709, 1, 0, 0.8235294, 1,
1.088511, 1.824197, -0.1804344, 1, 0, 0.8156863, 1,
1.091826, -0.1416491, 2.356286, 1, 0, 0.8117647, 1,
1.093295, 0.8357024, 0.3521279, 1, 0, 0.8039216, 1,
1.094676, 0.07550793, 1.068572, 1, 0, 0.7960784, 1,
1.097641, -0.4301074, 2.547867, 1, 0, 0.7921569, 1,
1.105331, -0.42914, 1.844545, 1, 0, 0.7843137, 1,
1.107919, 1.996005, -0.4536916, 1, 0, 0.7803922, 1,
1.114352, 0.09717514, 0.4761609, 1, 0, 0.772549, 1,
1.122866, 1.181228, 0.653428, 1, 0, 0.7686275, 1,
1.132216, -1.128806, 3.226667, 1, 0, 0.7607843, 1,
1.132399, 1.607834, 1.981995, 1, 0, 0.7568628, 1,
1.134888, 1.729794, 0.4808309, 1, 0, 0.7490196, 1,
1.135043, 1.928004, -0.5077912, 1, 0, 0.7450981, 1,
1.136885, 0.9282163, 1.335332, 1, 0, 0.7372549, 1,
1.137629, 2.112303, 2.046503, 1, 0, 0.7333333, 1,
1.138046, 0.0560613, 0.4270708, 1, 0, 0.7254902, 1,
1.149118, -1.03382, 1.01749, 1, 0, 0.7215686, 1,
1.153315, 0.4873011, 1.910255, 1, 0, 0.7137255, 1,
1.162691, 1.278363, 0.9899686, 1, 0, 0.7098039, 1,
1.169743, -0.1525713, 2.672235, 1, 0, 0.7019608, 1,
1.179965, 1.405764, 2.651781, 1, 0, 0.6941177, 1,
1.181775, -0.9431955, 2.296427, 1, 0, 0.6901961, 1,
1.184477, -1.181927, 0.8868117, 1, 0, 0.682353, 1,
1.184723, -0.4163986, 3.36834, 1, 0, 0.6784314, 1,
1.196222, 0.5885396, 1.511225, 1, 0, 0.6705883, 1,
1.197182, -2.242326, 3.450088, 1, 0, 0.6666667, 1,
1.200172, -0.493823, 1.270414, 1, 0, 0.6588235, 1,
1.201464, -1.050541, 3.077479, 1, 0, 0.654902, 1,
1.203151, 0.2536346, 1.486956, 1, 0, 0.6470588, 1,
1.206788, -1.059853, 2.428405, 1, 0, 0.6431373, 1,
1.213543, 1.903279, 1.895021, 1, 0, 0.6352941, 1,
1.214225, -1.238432, 0.09685123, 1, 0, 0.6313726, 1,
1.215461, -0.09137306, 3.322964, 1, 0, 0.6235294, 1,
1.23436, -0.2336063, -0.6929352, 1, 0, 0.6196079, 1,
1.235392, -0.06700803, 1.598019, 1, 0, 0.6117647, 1,
1.23907, -1.65551, 3.553533, 1, 0, 0.6078432, 1,
1.240905, -1.190485, 2.591918, 1, 0, 0.6, 1,
1.243472, 1.597644, -0.0152339, 1, 0, 0.5921569, 1,
1.250565, -0.08809441, 0.8237122, 1, 0, 0.5882353, 1,
1.255885, 0.1383002, 2.749611, 1, 0, 0.5803922, 1,
1.266432, -0.5346903, 1.773513, 1, 0, 0.5764706, 1,
1.266528, 0.549798, 1.501756, 1, 0, 0.5686275, 1,
1.272307, 1.711769, 0.1849391, 1, 0, 0.5647059, 1,
1.272578, 1.776509, 0.01075671, 1, 0, 0.5568628, 1,
1.279, 0.05999564, 3.384231, 1, 0, 0.5529412, 1,
1.280912, -0.2892712, 1.369327, 1, 0, 0.5450981, 1,
1.284322, -0.9162673, 1.934487, 1, 0, 0.5411765, 1,
1.286273, 0.5513732, 0.4950804, 1, 0, 0.5333334, 1,
1.286998, 0.8551789, 0.9042277, 1, 0, 0.5294118, 1,
1.303482, 0.2310679, 1.238189, 1, 0, 0.5215687, 1,
1.307939, 1.324563, -0.6317594, 1, 0, 0.5176471, 1,
1.309683, 0.856815, -0.1787781, 1, 0, 0.509804, 1,
1.327156, -0.1756665, 2.017358, 1, 0, 0.5058824, 1,
1.3382, 0.5924593, 1.960375, 1, 0, 0.4980392, 1,
1.342375, -0.6781617, 2.213154, 1, 0, 0.4901961, 1,
1.343518, 1.799723, 1.585644, 1, 0, 0.4862745, 1,
1.347634, -0.4279262, 0.7952706, 1, 0, 0.4784314, 1,
1.349491, 0.7248557, -0.3166408, 1, 0, 0.4745098, 1,
1.354512, 2.245275, 0.7578597, 1, 0, 0.4666667, 1,
1.355369, 0.4642641, 1.353037, 1, 0, 0.4627451, 1,
1.357358, 0.5365439, 1.928325, 1, 0, 0.454902, 1,
1.362649, -2.317627, 4.664979, 1, 0, 0.4509804, 1,
1.367718, 0.8555432, 2.061759, 1, 0, 0.4431373, 1,
1.372894, -2.171937, 1.002626, 1, 0, 0.4392157, 1,
1.373383, 0.1797205, 1.312936, 1, 0, 0.4313726, 1,
1.376066, -0.1328722, 3.027209, 1, 0, 0.427451, 1,
1.389202, 1.98326, 0.3387343, 1, 0, 0.4196078, 1,
1.39325, -0.8537127, 1.210206, 1, 0, 0.4156863, 1,
1.398794, -1.005159, 2.185658, 1, 0, 0.4078431, 1,
1.407198, -0.2318183, 0.2945893, 1, 0, 0.4039216, 1,
1.414646, 0.9113054, 0.9599393, 1, 0, 0.3960784, 1,
1.421237, -1.235345, 4.647635, 1, 0, 0.3882353, 1,
1.422945, 0.01239159, 0.3940363, 1, 0, 0.3843137, 1,
1.42653, 0.5087197, -0.1074238, 1, 0, 0.3764706, 1,
1.432238, 0.6433702, 1.963359, 1, 0, 0.372549, 1,
1.438064, -1.019555, 0.4716455, 1, 0, 0.3647059, 1,
1.444977, -0.5750889, 2.644531, 1, 0, 0.3607843, 1,
1.446643, -0.04037975, 1.32212, 1, 0, 0.3529412, 1,
1.465286, 0.1657804, 2.440672, 1, 0, 0.3490196, 1,
1.470399, -0.6625377, 2.512737, 1, 0, 0.3411765, 1,
1.472963, -0.4847918, 1.076409, 1, 0, 0.3372549, 1,
1.477846, -0.1847995, 1.40827, 1, 0, 0.3294118, 1,
1.49054, 1.038097, 0.1618452, 1, 0, 0.3254902, 1,
1.495006, 0.0275266, 1.480868, 1, 0, 0.3176471, 1,
1.499396, 1.08041, 0.6789496, 1, 0, 0.3137255, 1,
1.510811, -0.3464961, 1.825539, 1, 0, 0.3058824, 1,
1.529297, 0.3078676, 2.842364, 1, 0, 0.2980392, 1,
1.567208, -0.4059628, 1.929363, 1, 0, 0.2941177, 1,
1.601135, 1.02476, 3.574313, 1, 0, 0.2862745, 1,
1.614249, 0.546657, 0.284368, 1, 0, 0.282353, 1,
1.645568, -0.1305339, 2.582787, 1, 0, 0.2745098, 1,
1.654413, -0.3514113, 1.766269, 1, 0, 0.2705882, 1,
1.664552, 1.288034, 0.8217669, 1, 0, 0.2627451, 1,
1.677456, 0.8568049, 1.639272, 1, 0, 0.2588235, 1,
1.695516, -1.312058, 1.151535, 1, 0, 0.2509804, 1,
1.696543, -0.3136006, 2.813734, 1, 0, 0.2470588, 1,
1.70074, -0.5724622, 0.03666098, 1, 0, 0.2392157, 1,
1.70798, -0.9707955, 2.837507, 1, 0, 0.2352941, 1,
1.708593, 1.957994, 1.722453, 1, 0, 0.227451, 1,
1.716538, 0.0997868, 1.365285, 1, 0, 0.2235294, 1,
1.728424, 0.9768827, 2.750831, 1, 0, 0.2156863, 1,
1.753827, -0.6030424, 1.338393, 1, 0, 0.2117647, 1,
1.757276, 1.124553, 2.762068, 1, 0, 0.2039216, 1,
1.766575, 0.6848485, 0.8015326, 1, 0, 0.1960784, 1,
1.774945, 1.958321, 1.208308, 1, 0, 0.1921569, 1,
1.837064, -0.5759478, 0.7362273, 1, 0, 0.1843137, 1,
1.844745, -0.3697864, 0.4177315, 1, 0, 0.1803922, 1,
1.870541, -0.004943598, 0.6557945, 1, 0, 0.172549, 1,
1.871958, 0.9750709, 0.4272776, 1, 0, 0.1686275, 1,
1.891015, 1.037347, 0.9705281, 1, 0, 0.1607843, 1,
1.900787, 0.08133561, 0.9113514, 1, 0, 0.1568628, 1,
1.901784, -1.101922, 0.2426446, 1, 0, 0.1490196, 1,
1.949875, 0.1659213, 0.6620548, 1, 0, 0.145098, 1,
1.975419, 0.1509359, 2.004072, 1, 0, 0.1372549, 1,
1.997071, 0.2044872, -0.3261744, 1, 0, 0.1333333, 1,
2.012557, 1.494489, 0.02074963, 1, 0, 0.1254902, 1,
2.040481, 0.7855381, 2.262633, 1, 0, 0.1215686, 1,
2.077434, -0.4452275, 0.7493523, 1, 0, 0.1137255, 1,
2.084742, 1.432864, 0.4154293, 1, 0, 0.1098039, 1,
2.085328, -1.209965, 0.924522, 1, 0, 0.1019608, 1,
2.087095, 0.4415539, 4.012866, 1, 0, 0.09411765, 1,
2.094897, -1.534805, 1.889784, 1, 0, 0.09019608, 1,
2.107294, -0.2095119, 1.557811, 1, 0, 0.08235294, 1,
2.146389, -0.5429212, 5.848892, 1, 0, 0.07843138, 1,
2.148508, -0.4870851, 2.201013, 1, 0, 0.07058824, 1,
2.206073, 0.2079633, 2.544689, 1, 0, 0.06666667, 1,
2.240574, 0.9464015, 0.6527582, 1, 0, 0.05882353, 1,
2.283624, -0.2679707, 0.9676924, 1, 0, 0.05490196, 1,
2.34112, 0.492372, 2.387069, 1, 0, 0.04705882, 1,
2.342547, 1.513174, -0.5799218, 1, 0, 0.04313726, 1,
2.365396, -0.4338676, 2.01648, 1, 0, 0.03529412, 1,
2.445687, -1.264426, 1.981987, 1, 0, 0.03137255, 1,
2.568529, 0.8117369, 1.246386, 1, 0, 0.02352941, 1,
2.587918, -0.1975855, 0.02817069, 1, 0, 0.01960784, 1,
2.85063, -0.4873561, 0.1295697, 1, 0, 0.01176471, 1,
3.227522, 0.6112769, -0.197901, 1, 0, 0.007843138, 1
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
-0.1006837, -4.725867, -6.815151, 0, -0.5, 0.5, 0.5,
-0.1006837, -4.725867, -6.815151, 1, -0.5, 0.5, 0.5,
-0.1006837, -4.725867, -6.815151, 1, 1.5, 0.5, 0.5,
-0.1006837, -4.725867, -6.815151, 0, 1.5, 0.5, 0.5
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
-4.557151, -0.0151341, -6.815151, 0, -0.5, 0.5, 0.5,
-4.557151, -0.0151341, -6.815151, 1, -0.5, 0.5, 0.5,
-4.557151, -0.0151341, -6.815151, 1, 1.5, 0.5, 0.5,
-4.557151, -0.0151341, -6.815151, 0, 1.5, 0.5, 0.5
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
-4.557151, -4.725867, 0.4345939, 0, -0.5, 0.5, 0.5,
-4.557151, -4.725867, 0.4345939, 1, -0.5, 0.5, 0.5,
-4.557151, -4.725867, 0.4345939, 1, 1.5, 0.5, 0.5,
-4.557151, -4.725867, 0.4345939, 0, 1.5, 0.5, 0.5
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
-3, -3.638775, -5.142133,
3, -3.638775, -5.142133,
-3, -3.638775, -5.142133,
-3, -3.819957, -5.420969,
-2, -3.638775, -5.142133,
-2, -3.819957, -5.420969,
-1, -3.638775, -5.142133,
-1, -3.819957, -5.420969,
0, -3.638775, -5.142133,
0, -3.819957, -5.420969,
1, -3.638775, -5.142133,
1, -3.819957, -5.420969,
2, -3.638775, -5.142133,
2, -3.819957, -5.420969,
3, -3.638775, -5.142133,
3, -3.819957, -5.420969
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
-3, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
-3, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
-3, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
-3, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5,
-2, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
-2, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
-2, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
-2, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5,
-1, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
-1, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
-1, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
-1, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5,
0, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
0, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
0, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
0, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5,
1, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
1, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
1, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
1, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5,
2, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
2, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
2, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
2, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5,
3, -4.182322, -5.978642, 0, -0.5, 0.5, 0.5,
3, -4.182322, -5.978642, 1, -0.5, 0.5, 0.5,
3, -4.182322, -5.978642, 1, 1.5, 0.5, 0.5,
3, -4.182322, -5.978642, 0, 1.5, 0.5, 0.5
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
-3.528735, -2, -5.142133,
-3.528735, 2, -5.142133,
-3.528735, -2, -5.142133,
-3.700138, -2, -5.420969,
-3.528735, 0, -5.142133,
-3.700138, 0, -5.420969,
-3.528735, 2, -5.142133,
-3.700138, 2, -5.420969
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
"0",
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
-4.042943, -2, -5.978642, 0, -0.5, 0.5, 0.5,
-4.042943, -2, -5.978642, 1, -0.5, 0.5, 0.5,
-4.042943, -2, -5.978642, 1, 1.5, 0.5, 0.5,
-4.042943, -2, -5.978642, 0, 1.5, 0.5, 0.5,
-4.042943, 0, -5.978642, 0, -0.5, 0.5, 0.5,
-4.042943, 0, -5.978642, 1, -0.5, 0.5, 0.5,
-4.042943, 0, -5.978642, 1, 1.5, 0.5, 0.5,
-4.042943, 0, -5.978642, 0, 1.5, 0.5, 0.5,
-4.042943, 2, -5.978642, 0, -0.5, 0.5, 0.5,
-4.042943, 2, -5.978642, 1, -0.5, 0.5, 0.5,
-4.042943, 2, -5.978642, 1, 1.5, 0.5, 0.5,
-4.042943, 2, -5.978642, 0, 1.5, 0.5, 0.5
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
-3.528735, -3.638775, -4,
-3.528735, -3.638775, 4,
-3.528735, -3.638775, -4,
-3.700138, -3.819957, -4,
-3.528735, -3.638775, -2,
-3.700138, -3.819957, -2,
-3.528735, -3.638775, 0,
-3.700138, -3.819957, 0,
-3.528735, -3.638775, 2,
-3.700138, -3.819957, 2,
-3.528735, -3.638775, 4,
-3.700138, -3.819957, 4
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
-4.042943, -4.182322, -4, 0, -0.5, 0.5, 0.5,
-4.042943, -4.182322, -4, 1, -0.5, 0.5, 0.5,
-4.042943, -4.182322, -4, 1, 1.5, 0.5, 0.5,
-4.042943, -4.182322, -4, 0, 1.5, 0.5, 0.5,
-4.042943, -4.182322, -2, 0, -0.5, 0.5, 0.5,
-4.042943, -4.182322, -2, 1, -0.5, 0.5, 0.5,
-4.042943, -4.182322, -2, 1, 1.5, 0.5, 0.5,
-4.042943, -4.182322, -2, 0, 1.5, 0.5, 0.5,
-4.042943, -4.182322, 0, 0, -0.5, 0.5, 0.5,
-4.042943, -4.182322, 0, 1, -0.5, 0.5, 0.5,
-4.042943, -4.182322, 0, 1, 1.5, 0.5, 0.5,
-4.042943, -4.182322, 0, 0, 1.5, 0.5, 0.5,
-4.042943, -4.182322, 2, 0, -0.5, 0.5, 0.5,
-4.042943, -4.182322, 2, 1, -0.5, 0.5, 0.5,
-4.042943, -4.182322, 2, 1, 1.5, 0.5, 0.5,
-4.042943, -4.182322, 2, 0, 1.5, 0.5, 0.5,
-4.042943, -4.182322, 4, 0, -0.5, 0.5, 0.5,
-4.042943, -4.182322, 4, 1, -0.5, 0.5, 0.5,
-4.042943, -4.182322, 4, 1, 1.5, 0.5, 0.5,
-4.042943, -4.182322, 4, 0, 1.5, 0.5, 0.5
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
-3.528735, -3.638775, -5.142133,
-3.528735, 3.608507, -5.142133,
-3.528735, -3.638775, 6.011321,
-3.528735, 3.608507, 6.011321,
-3.528735, -3.638775, -5.142133,
-3.528735, -3.638775, 6.011321,
-3.528735, 3.608507, -5.142133,
-3.528735, 3.608507, 6.011321,
-3.528735, -3.638775, -5.142133,
3.327368, -3.638775, -5.142133,
-3.528735, -3.638775, 6.011321,
3.327368, -3.638775, 6.011321,
-3.528735, 3.608507, -5.142133,
3.327368, 3.608507, -5.142133,
-3.528735, 3.608507, 6.011321,
3.327368, 3.608507, 6.011321,
3.327368, -3.638775, -5.142133,
3.327368, 3.608507, -5.142133,
3.327368, -3.638775, 6.011321,
3.327368, 3.608507, 6.011321,
3.327368, -3.638775, -5.142133,
3.327368, -3.638775, 6.011321,
3.327368, 3.608507, -5.142133,
3.327368, 3.608507, 6.011321
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
var radius = 7.990619;
var distance = 35.55117;
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
mvMatrix.translate( 0.1006837, 0.0151341, -0.4345939 );
mvMatrix.scale( 1.260135, 1.192118, 0.7746133 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.55117);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
thifluzamide<-read.table("thifluzamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thifluzamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
```

```r
y<-thifluzamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
```

```r
z<-thifluzamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
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
-3.428889, 1.879749, -1.015832, 0, 0, 1, 1, 1,
-2.644404, -0.4283644, -0.6842838, 1, 0, 0, 1, 1,
-2.54175, -0.07320569, -2.462948, 1, 0, 0, 1, 1,
-2.42057, -0.628287, -2.00243, 1, 0, 0, 1, 1,
-2.367702, -0.2542574, -1.712991, 1, 0, 0, 1, 1,
-2.316017, -0.01206827, -1.501254, 1, 0, 0, 1, 1,
-2.225283, -0.2705061, -2.628996, 0, 0, 0, 1, 1,
-2.212521, 0.01676772, -0.4978847, 0, 0, 0, 1, 1,
-2.162314, -1.272221, -2.48722, 0, 0, 0, 1, 1,
-2.144994, 1.316467, 1.156576, 0, 0, 0, 1, 1,
-2.138774, -0.6364669, -0.5362868, 0, 0, 0, 1, 1,
-2.137413, -0.0581345, -0.4449681, 0, 0, 0, 1, 1,
-2.093316, -1.66193, -2.040031, 0, 0, 0, 1, 1,
-2.045076, 0.6607949, 0.1178339, 1, 1, 1, 1, 1,
-2.019292, 0.4241695, -2.68039, 1, 1, 1, 1, 1,
-2.010165, -1.116109, -2.178698, 1, 1, 1, 1, 1,
-2.007948, 1.326831, -2.360499, 1, 1, 1, 1, 1,
-1.965235, 1.146221, -0.1652676, 1, 1, 1, 1, 1,
-1.953449, 0.9949048, -1.28936, 1, 1, 1, 1, 1,
-1.941436, 0.1189707, -1.904397, 1, 1, 1, 1, 1,
-1.936711, -1.173007, -0.4858663, 1, 1, 1, 1, 1,
-1.86363, -0.9975295, -3.200835, 1, 1, 1, 1, 1,
-1.860431, -0.2785155, -0.9974354, 1, 1, 1, 1, 1,
-1.85644, -0.3905992, -0.5919229, 1, 1, 1, 1, 1,
-1.848289, -0.2396311, 0.4178744, 1, 1, 1, 1, 1,
-1.812601, 1.616907, -1.38886, 1, 1, 1, 1, 1,
-1.782183, 0.3403811, -4.038193, 1, 1, 1, 1, 1,
-1.770676, 0.3716808, -1.256098, 1, 1, 1, 1, 1,
-1.761841, 1.110769, -2.074831, 0, 0, 1, 1, 1,
-1.761339, -0.6587402, -2.741834, 1, 0, 0, 1, 1,
-1.753481, 1.133788, -0.1839014, 1, 0, 0, 1, 1,
-1.751342, 1.328807, -2.179887, 1, 0, 0, 1, 1,
-1.749809, -1.392618, -3.032176, 1, 0, 0, 1, 1,
-1.744492, 1.300358, -1.355442, 1, 0, 0, 1, 1,
-1.715991, 1.407502, -2.06686, 0, 0, 0, 1, 1,
-1.71592, -1.308237, -3.542746, 0, 0, 0, 1, 1,
-1.693394, 2.040662, -0.01770373, 0, 0, 0, 1, 1,
-1.663685, -0.5025858, -2.307069, 0, 0, 0, 1, 1,
-1.641626, 1.310277, -1.929018, 0, 0, 0, 1, 1,
-1.637841, 0.1333219, -0.4415404, 0, 0, 0, 1, 1,
-1.634774, -1.017369, -2.213107, 0, 0, 0, 1, 1,
-1.633958, -0.5893928, -2.262219, 1, 1, 1, 1, 1,
-1.627048, 1.700052, -0.8753266, 1, 1, 1, 1, 1,
-1.626307, -1.356109, -2.363181, 1, 1, 1, 1, 1,
-1.625582, 0.02425371, -1.295, 1, 1, 1, 1, 1,
-1.623619, -0.7658757, -1.772102, 1, 1, 1, 1, 1,
-1.623458, -1.940834, -1.932073, 1, 1, 1, 1, 1,
-1.606096, -0.7462752, -1.686841, 1, 1, 1, 1, 1,
-1.593463, 1.580218, -0.8486867, 1, 1, 1, 1, 1,
-1.553929, -0.3841254, -1.603995, 1, 1, 1, 1, 1,
-1.553476, 1.103456, -1.072646, 1, 1, 1, 1, 1,
-1.54457, -1.051957, -3.0515, 1, 1, 1, 1, 1,
-1.503897, -0.645028, -1.624931, 1, 1, 1, 1, 1,
-1.488187, -0.3790565, -2.448987, 1, 1, 1, 1, 1,
-1.486314, 0.05885153, -2.957085, 1, 1, 1, 1, 1,
-1.48353, -0.1258256, -2.729856, 1, 1, 1, 1, 1,
-1.482825, -1.489056, -2.403018, 0, 0, 1, 1, 1,
-1.465932, -0.3476988, -0.07539782, 1, 0, 0, 1, 1,
-1.455229, -0.2382796, -1.303006, 1, 0, 0, 1, 1,
-1.444764, -0.8247526, -2.256674, 1, 0, 0, 1, 1,
-1.441154, 0.2842951, -2.298018, 1, 0, 0, 1, 1,
-1.440464, -0.2167293, -0.897053, 1, 0, 0, 1, 1,
-1.433162, -0.5814792, -1.818054, 0, 0, 0, 1, 1,
-1.426921, -1.232551, -1.80328, 0, 0, 0, 1, 1,
-1.416372, 0.3121573, -2.44351, 0, 0, 0, 1, 1,
-1.413634, -0.9294278, -1.241982, 0, 0, 0, 1, 1,
-1.413517, -0.6047094, -1.378145, 0, 0, 0, 1, 1,
-1.405199, -0.2319661, -2.285166, 0, 0, 0, 1, 1,
-1.393872, 0.4415089, -1.341286, 0, 0, 0, 1, 1,
-1.393327, -1.608115, -4.444911, 1, 1, 1, 1, 1,
-1.390741, 1.09615, -0.2385372, 1, 1, 1, 1, 1,
-1.389526, -1.265393, -0.9996312, 1, 1, 1, 1, 1,
-1.383802, -1.87936, -2.368484, 1, 1, 1, 1, 1,
-1.37601, -0.9641528, -1.67579, 1, 1, 1, 1, 1,
-1.370318, -1.309549, -2.650528, 1, 1, 1, 1, 1,
-1.364899, -1.517985, -2.095487, 1, 1, 1, 1, 1,
-1.351582, -0.9312962, -0.7818554, 1, 1, 1, 1, 1,
-1.341524, 0.7727861, -0.8313147, 1, 1, 1, 1, 1,
-1.340307, -0.5354107, -2.533451, 1, 1, 1, 1, 1,
-1.337449, 0.9642566, -1.169985, 1, 1, 1, 1, 1,
-1.335712, -0.4837076, -1.68071, 1, 1, 1, 1, 1,
-1.329726, -0.3399273, -1.429736, 1, 1, 1, 1, 1,
-1.327523, 3.502964, 0.5490741, 1, 1, 1, 1, 1,
-1.324045, -0.7201864, -1.385386, 1, 1, 1, 1, 1,
-1.318197, 0.59221, -0.7727432, 0, 0, 1, 1, 1,
-1.29383, 0.8403302, -0.08881628, 1, 0, 0, 1, 1,
-1.293182, -0.2564434, -0.9587942, 1, 0, 0, 1, 1,
-1.292567, 0.1874512, -2.485925, 1, 0, 0, 1, 1,
-1.290283, 1.244436, 0.3874344, 1, 0, 0, 1, 1,
-1.274568, -1.536084, -3.130068, 1, 0, 0, 1, 1,
-1.272469, -0.7172215, -3.950051, 0, 0, 0, 1, 1,
-1.266837, 0.9574826, -1.174522, 0, 0, 0, 1, 1,
-1.258486, -0.6595476, -2.745762, 0, 0, 0, 1, 1,
-1.251371, 0.4182275, -2.534959, 0, 0, 0, 1, 1,
-1.245849, 0.01602744, -1.296387, 0, 0, 0, 1, 1,
-1.243184, 0.9294727, -2.106241, 0, 0, 0, 1, 1,
-1.239966, 0.1248515, -1.863654, 0, 0, 0, 1, 1,
-1.235783, -0.3579056, -3.048838, 1, 1, 1, 1, 1,
-1.22927, -0.4424047, -2.755353, 1, 1, 1, 1, 1,
-1.228328, -1.22539, -0.3927611, 1, 1, 1, 1, 1,
-1.214706, -1.191475, -1.692385, 1, 1, 1, 1, 1,
-1.21317, -1.633076, -2.378735, 1, 1, 1, 1, 1,
-1.205123, 0.03745788, -2.064077, 1, 1, 1, 1, 1,
-1.197094, 0.02642417, -1.620708, 1, 1, 1, 1, 1,
-1.192278, 0.7522788, -1.134972, 1, 1, 1, 1, 1,
-1.185197, 0.5155329, -1.733339, 1, 1, 1, 1, 1,
-1.184959, 0.3744955, -2.029094, 1, 1, 1, 1, 1,
-1.183347, -0.3851264, -2.516812, 1, 1, 1, 1, 1,
-1.180789, 1.423785, -1.128592, 1, 1, 1, 1, 1,
-1.178612, 1.075828, 0.3874734, 1, 1, 1, 1, 1,
-1.178482, -0.7878099, -2.07974, 1, 1, 1, 1, 1,
-1.177046, -0.6848387, -3.49619, 1, 1, 1, 1, 1,
-1.164692, -0.910923, -2.302715, 0, 0, 1, 1, 1,
-1.162908, -0.6539373, -1.368716, 1, 0, 0, 1, 1,
-1.162482, 0.5080487, -2.6735, 1, 0, 0, 1, 1,
-1.162025, 1.338299, 1.36699, 1, 0, 0, 1, 1,
-1.160969, -0.6172105, -0.4873382, 1, 0, 0, 1, 1,
-1.139807, 0.7024944, -1.497581, 1, 0, 0, 1, 1,
-1.139801, -0.1894987, -1.96179, 0, 0, 0, 1, 1,
-1.131625, -1.267983, -4.599465, 0, 0, 0, 1, 1,
-1.129098, -1.166153, 0.9932665, 0, 0, 0, 1, 1,
-1.129077, 0.6280745, -1.245476, 0, 0, 0, 1, 1,
-1.109637, 2.716822, 0.5292594, 0, 0, 0, 1, 1,
-1.106274, 1.29257, -0.1294774, 0, 0, 0, 1, 1,
-1.102804, -0.199877, -2.436806, 0, 0, 0, 1, 1,
-1.100777, 0.9855676, -1.156373, 1, 1, 1, 1, 1,
-1.095012, 0.1003622, -0.6337512, 1, 1, 1, 1, 1,
-1.094868, 1.285657, -0.7485888, 1, 1, 1, 1, 1,
-1.091992, -0.8494698, -2.399729, 1, 1, 1, 1, 1,
-1.091376, -0.8332221, -1.711569, 1, 1, 1, 1, 1,
-1.078415, 0.3077633, -0.2317455, 1, 1, 1, 1, 1,
-1.075957, -0.5178197, -2.820006, 1, 1, 1, 1, 1,
-1.067872, 1.294361, -0.9192523, 1, 1, 1, 1, 1,
-1.064107, -1.185946, -2.354846, 1, 1, 1, 1, 1,
-1.063171, -0.5184759, -3.422114, 1, 1, 1, 1, 1,
-1.062954, 0.5698382, -1.411243, 1, 1, 1, 1, 1,
-1.060184, -0.3239971, -2.409665, 1, 1, 1, 1, 1,
-1.057511, 0.4408704, -1.995387, 1, 1, 1, 1, 1,
-1.056353, 1.457731, 0.272343, 1, 1, 1, 1, 1,
-1.05553, -1.287326, -2.245283, 1, 1, 1, 1, 1,
-1.052098, -0.5706908, -3.171853, 0, 0, 1, 1, 1,
-1.043458, 1.816135, -0.7988073, 1, 0, 0, 1, 1,
-1.04068, -0.9832808, -2.050929, 1, 0, 0, 1, 1,
-1.035299, 0.1974531, -2.518484, 1, 0, 0, 1, 1,
-1.020052, -0.4663324, -1.034642, 1, 0, 0, 1, 1,
-1.018423, -0.6781636, -2.984842, 1, 0, 0, 1, 1,
-1.016019, -0.7886129, -3.121461, 0, 0, 0, 1, 1,
-1.013724, 0.4850363, -1.498445, 0, 0, 0, 1, 1,
-1.008886, -1.503696, -2.055574, 0, 0, 0, 1, 1,
-0.9993252, -0.09308674, -0.4441667, 0, 0, 0, 1, 1,
-0.9987931, 0.2633493, 0.1913652, 0, 0, 0, 1, 1,
-0.9974685, 1.418625, -0.7127807, 0, 0, 0, 1, 1,
-0.9958091, 0.09767751, -1.880338, 0, 0, 0, 1, 1,
-0.9931396, -1.078085, -1.966632, 1, 1, 1, 1, 1,
-0.9924105, 1.488252, -0.8801786, 1, 1, 1, 1, 1,
-0.9877955, 0.7737827, -0.5415128, 1, 1, 1, 1, 1,
-0.9721785, 0.04176368, -2.845597, 1, 1, 1, 1, 1,
-0.9675032, -1.839683, -2.781467, 1, 1, 1, 1, 1,
-0.9657398, -0.5734788, -0.600402, 1, 1, 1, 1, 1,
-0.9587796, -0.4181509, -3.162942, 1, 1, 1, 1, 1,
-0.9583383, 0.1116198, -1.371666, 1, 1, 1, 1, 1,
-0.9577448, -0.8978997, -3.338472, 1, 1, 1, 1, 1,
-0.955453, 1.881578, -1.44876, 1, 1, 1, 1, 1,
-0.9508052, -2.247675, -2.135068, 1, 1, 1, 1, 1,
-0.9485517, -0.6110624, -2.570089, 1, 1, 1, 1, 1,
-0.9453481, 2.541611, 0.3532712, 1, 1, 1, 1, 1,
-0.9416257, -0.4357162, -0.7607732, 1, 1, 1, 1, 1,
-0.9398119, 2.0679, -0.7169849, 1, 1, 1, 1, 1,
-0.9387345, 0.7024701, -0.05985713, 0, 0, 1, 1, 1,
-0.9365937, 1.245744, -1.428896, 1, 0, 0, 1, 1,
-0.9338809, -0.843621, -0.8438233, 1, 0, 0, 1, 1,
-0.9264363, 1.150642, -0.5582308, 1, 0, 0, 1, 1,
-0.9234269, -0.1084823, -0.9021551, 1, 0, 0, 1, 1,
-0.9204444, 2.141151, -0.7152119, 1, 0, 0, 1, 1,
-0.9188797, -0.6673744, -1.738426, 0, 0, 0, 1, 1,
-0.9186441, 0.8607137, -0.4624982, 0, 0, 0, 1, 1,
-0.9172049, 0.2731967, -3.226526, 0, 0, 0, 1, 1,
-0.9137986, 1.211522, -1.301196, 0, 0, 0, 1, 1,
-0.9098696, -0.4324869, -2.165568, 0, 0, 0, 1, 1,
-0.9095072, -1.242375, -2.333114, 0, 0, 0, 1, 1,
-0.9035273, -1.510233, -3.957316, 0, 0, 0, 1, 1,
-0.8973392, 0.8629618, -0.8095372, 1, 1, 1, 1, 1,
-0.8959589, 0.3074359, -0.9238415, 1, 1, 1, 1, 1,
-0.8954156, -2.180377, -3.04233, 1, 1, 1, 1, 1,
-0.8930203, 0.7628542, -1.191903, 1, 1, 1, 1, 1,
-0.8915918, -0.05131805, -3.676764, 1, 1, 1, 1, 1,
-0.8854133, 0.5007846, -0.9697559, 1, 1, 1, 1, 1,
-0.881459, -0.6135448, -3.046172, 1, 1, 1, 1, 1,
-0.8777319, -1.717746, -3.175581, 1, 1, 1, 1, 1,
-0.8727833, -0.8163412, -2.505881, 1, 1, 1, 1, 1,
-0.8680205, 0.1408775, 0.17483, 1, 1, 1, 1, 1,
-0.867392, -0.7939197, -2.341944, 1, 1, 1, 1, 1,
-0.8671715, 0.988605, 0.4864926, 1, 1, 1, 1, 1,
-0.8655825, -0.8633502, -1.184612, 1, 1, 1, 1, 1,
-0.8654983, -0.3442525, -1.811303, 1, 1, 1, 1, 1,
-0.8649136, -1.196987, -1.728176, 1, 1, 1, 1, 1,
-0.8545132, 1.235967, -0.6599612, 0, 0, 1, 1, 1,
-0.8544429, 0.006165036, -3.069982, 1, 0, 0, 1, 1,
-0.8495062, -0.03553323, -1.30539, 1, 0, 0, 1, 1,
-0.8412845, -0.0692937, -1.555232, 1, 0, 0, 1, 1,
-0.8411889, -0.3767093, -1.486603, 1, 0, 0, 1, 1,
-0.8405634, 0.9734986, -0.8747463, 1, 0, 0, 1, 1,
-0.8399878, 1.338766, -0.829106, 0, 0, 0, 1, 1,
-0.8397371, 0.1023403, -0.3863764, 0, 0, 0, 1, 1,
-0.8383127, 0.2190036, -1.838806, 0, 0, 0, 1, 1,
-0.831625, 1.560086, -0.9556389, 0, 0, 0, 1, 1,
-0.8252142, -0.6733792, -2.048158, 0, 0, 0, 1, 1,
-0.8189064, 1.66029, 0.1144103, 0, 0, 0, 1, 1,
-0.8186394, -0.6336798, -2.434744, 0, 0, 0, 1, 1,
-0.8174815, 0.927025, 0.3346389, 1, 1, 1, 1, 1,
-0.8174163, -0.1747321, 0.6176155, 1, 1, 1, 1, 1,
-0.8168444, -0.7133867, -2.76299, 1, 1, 1, 1, 1,
-0.8131526, -1.092855, -2.173697, 1, 1, 1, 1, 1,
-0.8125597, -1.190732, -2.530159, 1, 1, 1, 1, 1,
-0.8086392, -0.8752217, -1.99978, 1, 1, 1, 1, 1,
-0.8083878, 0.101233, -1.876973, 1, 1, 1, 1, 1,
-0.7994169, -0.8354588, -0.9520988, 1, 1, 1, 1, 1,
-0.7962367, 0.2672974, -0.5991592, 1, 1, 1, 1, 1,
-0.7920881, 0.4514913, -0.9752299, 1, 1, 1, 1, 1,
-0.7886159, 0.4438013, -1.076949, 1, 1, 1, 1, 1,
-0.7664234, 0.4393734, -2.203458, 1, 1, 1, 1, 1,
-0.7648632, -1.664562, -4.288548, 1, 1, 1, 1, 1,
-0.7608076, -1.182132, -4.252487, 1, 1, 1, 1, 1,
-0.7545525, 3.063601, -0.5372148, 1, 1, 1, 1, 1,
-0.7502303, 1.147453, -1.292381, 0, 0, 1, 1, 1,
-0.749145, -0.503357, -3.719493, 1, 0, 0, 1, 1,
-0.7463103, 0.4246796, 0.941232, 1, 0, 0, 1, 1,
-0.7395691, 1.988876, -0.05940011, 1, 0, 0, 1, 1,
-0.725325, -1.123736, -0.8832186, 1, 0, 0, 1, 1,
-0.711053, -0.3767175, -0.6973929, 1, 0, 0, 1, 1,
-0.7104817, -1.389924, -1.065521, 0, 0, 0, 1, 1,
-0.709792, 2.547816, 0.7653776, 0, 0, 0, 1, 1,
-0.7077457, -0.8413631, -3.523074, 0, 0, 0, 1, 1,
-0.7044098, 0.6159662, -0.1979892, 0, 0, 0, 1, 1,
-0.7032539, -0.4931126, -2.764745, 0, 0, 0, 1, 1,
-0.7006907, -0.5104016, -2.926828, 0, 0, 0, 1, 1,
-0.6972668, 1.301903, -2.159412, 0, 0, 0, 1, 1,
-0.6957217, 0.261686, -0.2583823, 1, 1, 1, 1, 1,
-0.6949327, 1.895882, 0.4809882, 1, 1, 1, 1, 1,
-0.6928359, -0.6523882, -1.423686, 1, 1, 1, 1, 1,
-0.6916523, 2.534908, 1.51918, 1, 1, 1, 1, 1,
-0.6906374, -0.9105033, -3.615021, 1, 1, 1, 1, 1,
-0.6868448, -1.295601, -0.7743487, 1, 1, 1, 1, 1,
-0.6859176, 1.170215, 2.587749, 1, 1, 1, 1, 1,
-0.6812734, -0.4010218, -2.130093, 1, 1, 1, 1, 1,
-0.6791236, -1.402736, -2.454876, 1, 1, 1, 1, 1,
-0.6754771, 0.5552856, -1.392487, 1, 1, 1, 1, 1,
-0.6748177, 0.103517, -0.7062804, 1, 1, 1, 1, 1,
-0.6724658, 0.2314076, -1.391084, 1, 1, 1, 1, 1,
-0.6696061, 0.2502729, -1.38779, 1, 1, 1, 1, 1,
-0.6689928, 1.159126, -0.3229949, 1, 1, 1, 1, 1,
-0.6635696, 1.101023, -1.059686, 1, 1, 1, 1, 1,
-0.6568832, 1.427699, -0.3806095, 0, 0, 1, 1, 1,
-0.6519048, 0.02723331, -1.105475, 1, 0, 0, 1, 1,
-0.65033, 0.02711182, -1.370272, 1, 0, 0, 1, 1,
-0.6498012, -0.369386, -3.772768, 1, 0, 0, 1, 1,
-0.6478458, -0.6065559, -3.507292, 1, 0, 0, 1, 1,
-0.6460277, -0.5431929, -1.193994, 1, 0, 0, 1, 1,
-0.6388607, -1.013445, -2.37731, 0, 0, 0, 1, 1,
-0.6339582, 0.3404576, -1.742192, 0, 0, 0, 1, 1,
-0.6305031, 2.707435, -0.0744463, 0, 0, 0, 1, 1,
-0.6225986, 1.071517, -3.026979, 0, 0, 0, 1, 1,
-0.6186858, 1.191356, -0.5273715, 0, 0, 0, 1, 1,
-0.6183882, -0.3974322, -1.790606, 0, 0, 0, 1, 1,
-0.6148105, 0.7701164, -0.7066405, 0, 0, 0, 1, 1,
-0.6124529, 0.5523934, -1.760049, 1, 1, 1, 1, 1,
-0.6110807, 1.187987, -1.385008, 1, 1, 1, 1, 1,
-0.6024538, -0.9201029, -1.5864, 1, 1, 1, 1, 1,
-0.6007401, 1.809098, 0.8121896, 1, 1, 1, 1, 1,
-0.6007068, -0.2989745, -1.077934, 1, 1, 1, 1, 1,
-0.5953803, -0.3849681, -1.620558, 1, 1, 1, 1, 1,
-0.593238, 1.092685, 0.506558, 1, 1, 1, 1, 1,
-0.5923383, 1.542498, 0.5319739, 1, 1, 1, 1, 1,
-0.5823622, -0.6430554, -0.7861616, 1, 1, 1, 1, 1,
-0.5820696, -1.398843, -3.375748, 1, 1, 1, 1, 1,
-0.5819726, -0.7704537, -1.735999, 1, 1, 1, 1, 1,
-0.5791354, -0.7119514, -0.9624478, 1, 1, 1, 1, 1,
-0.5765189, -0.1427581, -1.876537, 1, 1, 1, 1, 1,
-0.5719048, 0.4030542, 0.3931681, 1, 1, 1, 1, 1,
-0.5616695, 1.282457, 0.461318, 1, 1, 1, 1, 1,
-0.557874, 1.195754, -0.8615761, 0, 0, 1, 1, 1,
-0.5575711, -0.8330849, -2.471095, 1, 0, 0, 1, 1,
-0.5514007, -1.31596, -2.035475, 1, 0, 0, 1, 1,
-0.5450739, 0.9252352, 0.6678153, 1, 0, 0, 1, 1,
-0.5435934, 0.1068899, -1.523649, 1, 0, 0, 1, 1,
-0.5381626, 0.1631715, 0.5345074, 1, 0, 0, 1, 1,
-0.5346205, 1.241234, -1.600452, 0, 0, 0, 1, 1,
-0.5327599, -0.5857247, -2.817909, 0, 0, 0, 1, 1,
-0.5313861, -1.654697, -1.833457, 0, 0, 0, 1, 1,
-0.5312173, -0.5897818, -1.958944, 0, 0, 0, 1, 1,
-0.5254933, 2.024483, -0.5189467, 0, 0, 0, 1, 1,
-0.5233821, -0.1183184, -0.405963, 0, 0, 0, 1, 1,
-0.5216226, -1.099432, -2.100725, 0, 0, 0, 1, 1,
-0.5190519, -0.0980077, -1.221764, 1, 1, 1, 1, 1,
-0.5125851, 0.7443358, -2.854241, 1, 1, 1, 1, 1,
-0.5064741, 0.1760931, 0.3439013, 1, 1, 1, 1, 1,
-0.4959691, -1.059943, -2.203453, 1, 1, 1, 1, 1,
-0.4955402, 0.1761572, 1.41444, 1, 1, 1, 1, 1,
-0.4950711, 0.1637025, -0.429347, 1, 1, 1, 1, 1,
-0.4940239, -0.9593765, -3.218791, 1, 1, 1, 1, 1,
-0.4895271, -1.912217, -3.144225, 1, 1, 1, 1, 1,
-0.4860799, 0.3351132, -0.2571621, 1, 1, 1, 1, 1,
-0.4857346, -1.181471, 0.7799796, 1, 1, 1, 1, 1,
-0.4837905, -0.1983487, -1.170939, 1, 1, 1, 1, 1,
-0.4833379, -0.1073628, -0.9131318, 1, 1, 1, 1, 1,
-0.4813627, -0.1763951, -2.519503, 1, 1, 1, 1, 1,
-0.4804692, -1.3344, -2.99365, 1, 1, 1, 1, 1,
-0.4803775, 0.4533828, -1.697192, 1, 1, 1, 1, 1,
-0.476161, 0.807399, -0.6109011, 0, 0, 1, 1, 1,
-0.4761457, 0.8847157, -0.6351315, 1, 0, 0, 1, 1,
-0.4747271, 0.8032017, 0.6318867, 1, 0, 0, 1, 1,
-0.4726257, -1.113333, -3.096884, 1, 0, 0, 1, 1,
-0.470548, -1.466594, -2.081266, 1, 0, 0, 1, 1,
-0.4667779, 1.844144, -1.870721, 1, 0, 0, 1, 1,
-0.459228, -0.2575109, -2.584064, 0, 0, 0, 1, 1,
-0.458454, 0.882463, 0.8554866, 0, 0, 0, 1, 1,
-0.4579564, -0.6316152, -4.979704, 0, 0, 0, 1, 1,
-0.4574357, 1.227372, -0.523805, 0, 0, 0, 1, 1,
-0.4557178, 3.211445, -1.279109, 0, 0, 0, 1, 1,
-0.4556734, -0.5253964, -1.927597, 0, 0, 0, 1, 1,
-0.4516346, -0.5896578, -2.098537, 0, 0, 0, 1, 1,
-0.4485828, -0.1771484, -1.558465, 1, 1, 1, 1, 1,
-0.4484937, -1.564859, -1.767524, 1, 1, 1, 1, 1,
-0.4474407, -0.9661665, -1.617322, 1, 1, 1, 1, 1,
-0.4473552, -1.801162, -2.230273, 1, 1, 1, 1, 1,
-0.4379626, -0.8020279, -2.536668, 1, 1, 1, 1, 1,
-0.433699, 1.361825, -1.039289, 1, 1, 1, 1, 1,
-0.4221338, 0.8081691, -0.7908362, 1, 1, 1, 1, 1,
-0.4203061, -0.1541286, -2.042122, 1, 1, 1, 1, 1,
-0.4189441, 1.133101, 1.088579, 1, 1, 1, 1, 1,
-0.4071273, 0.8982663, -1.132258, 1, 1, 1, 1, 1,
-0.4070918, -1.519415, -2.204197, 1, 1, 1, 1, 1,
-0.3954104, -1.701312, -2.3134, 1, 1, 1, 1, 1,
-0.3900283, 0.4340503, -0.7372403, 1, 1, 1, 1, 1,
-0.3896353, 0.1142243, -3.511767, 1, 1, 1, 1, 1,
-0.3856848, -0.7796693, -3.058766, 1, 1, 1, 1, 1,
-0.382318, -0.03764798, -1.582091, 0, 0, 1, 1, 1,
-0.3817239, 0.2230715, 0.7662264, 1, 0, 0, 1, 1,
-0.3785902, -0.008949137, -1.270753, 1, 0, 0, 1, 1,
-0.3764952, -0.1292556, -0.730664, 1, 0, 0, 1, 1,
-0.3744974, 1.484867, -0.4320565, 1, 0, 0, 1, 1,
-0.3719136, -0.8199416, -2.739079, 1, 0, 0, 1, 1,
-0.3688366, 0.7088867, -0.8594037, 0, 0, 0, 1, 1,
-0.3655384, 0.1363627, -2.579211, 0, 0, 0, 1, 1,
-0.365483, -1.786112, -3.491769, 0, 0, 0, 1, 1,
-0.3634723, 0.04738786, -2.467655, 0, 0, 0, 1, 1,
-0.3619671, 1.842453, -1.340404, 0, 0, 0, 1, 1,
-0.3606709, -0.1072596, -2.200406, 0, 0, 0, 1, 1,
-0.3575756, 0.6210338, 1.189253, 0, 0, 0, 1, 1,
-0.3490706, -1.442697, -2.847426, 1, 1, 1, 1, 1,
-0.3483634, -0.86742, -2.425034, 1, 1, 1, 1, 1,
-0.3474712, -0.1256107, -2.870071, 1, 1, 1, 1, 1,
-0.3458491, 0.259754, -1.339785, 1, 1, 1, 1, 1,
-0.3452502, 0.8291009, -0.7017051, 1, 1, 1, 1, 1,
-0.3390432, 0.6447347, -2.997437, 1, 1, 1, 1, 1,
-0.3381034, -0.9469367, -3.725787, 1, 1, 1, 1, 1,
-0.3352406, 0.1301259, -2.244583, 1, 1, 1, 1, 1,
-0.3296371, 0.7193238, 0.04525644, 1, 1, 1, 1, 1,
-0.3276493, -0.8648002, -2.374191, 1, 1, 1, 1, 1,
-0.3257412, -0.155243, -3.4719, 1, 1, 1, 1, 1,
-0.3237264, 0.4924173, 1.539349, 1, 1, 1, 1, 1,
-0.313975, -0.601027, -3.686316, 1, 1, 1, 1, 1,
-0.3114882, -0.2378938, -3.625854, 1, 1, 1, 1, 1,
-0.3088968, -0.1166698, -1.111905, 1, 1, 1, 1, 1,
-0.3082605, -1.405989, -2.017747, 0, 0, 1, 1, 1,
-0.3068906, -0.8663949, -3.596743, 1, 0, 0, 1, 1,
-0.3044416, 1.094777, -0.9690216, 1, 0, 0, 1, 1,
-0.3022006, -0.5370263, -2.468768, 1, 0, 0, 1, 1,
-0.3007415, 0.6892427, 0.6579702, 1, 0, 0, 1, 1,
-0.2982069, -2.085224, -2.761257, 1, 0, 0, 1, 1,
-0.2979415, 0.9102255, 0.1780995, 0, 0, 0, 1, 1,
-0.2938526, 0.1643248, -1.145546, 0, 0, 0, 1, 1,
-0.2929541, 0.5280886, -2.445018, 0, 0, 0, 1, 1,
-0.2872719, 0.4411995, -0.1608261, 0, 0, 0, 1, 1,
-0.2863271, 0.3622288, -0.278754, 0, 0, 0, 1, 1,
-0.2831914, 0.2439974, -1.35451, 0, 0, 0, 1, 1,
-0.2829038, -0.9374874, -2.181579, 0, 0, 0, 1, 1,
-0.2822804, -1.471776, -2.91493, 1, 1, 1, 1, 1,
-0.2782743, -0.07696433, -2.359483, 1, 1, 1, 1, 1,
-0.2772972, 1.655562, -1.71382, 1, 1, 1, 1, 1,
-0.2759137, 0.1511073, -0.1512152, 1, 1, 1, 1, 1,
-0.272861, 1.850963, -1.125145, 1, 1, 1, 1, 1,
-0.2671477, -0.2955957, -2.82372, 1, 1, 1, 1, 1,
-0.2569829, 0.684097, -0.9987812, 1, 1, 1, 1, 1,
-0.2564085, -1.658783, -3.419153, 1, 1, 1, 1, 1,
-0.2515095, 1.23708, 0.5930142, 1, 1, 1, 1, 1,
-0.2499534, 1.145961, 1.933813, 1, 1, 1, 1, 1,
-0.2476172, -0.1686317, -0.7493452, 1, 1, 1, 1, 1,
-0.2401674, -1.626469, -3.638652, 1, 1, 1, 1, 1,
-0.2379424, 1.761067, 1.204092, 1, 1, 1, 1, 1,
-0.2337948, 0.6855553, -0.8796876, 1, 1, 1, 1, 1,
-0.2279796, 0.08501378, -0.1101605, 1, 1, 1, 1, 1,
-0.2259334, 2.086124, -0.6082463, 0, 0, 1, 1, 1,
-0.2219795, -2.008701, -3.105489, 1, 0, 0, 1, 1,
-0.2184812, 0.3573608, -0.11522, 1, 0, 0, 1, 1,
-0.2161486, 0.2368499, 0.3096814, 1, 0, 0, 1, 1,
-0.2154803, 0.7175907, -0.4768099, 1, 0, 0, 1, 1,
-0.2084378, 0.409373, 0.358774, 1, 0, 0, 1, 1,
-0.2042149, -0.417329, -2.143441, 0, 0, 0, 1, 1,
-0.2004506, -1.79688, -2.435731, 0, 0, 0, 1, 1,
-0.1998167, 0.4623858, -1.331914, 0, 0, 0, 1, 1,
-0.1963364, 1.100261, -0.2995709, 0, 0, 0, 1, 1,
-0.1921479, 0.6378233, -0.5403164, 0, 0, 0, 1, 1,
-0.191911, -0.7218192, -2.210593, 0, 0, 0, 1, 1,
-0.1906581, -1.202025, -3.178473, 0, 0, 0, 1, 1,
-0.1717588, 1.256746, -0.2077166, 1, 1, 1, 1, 1,
-0.1631435, -0.08405259, -2.055622, 1, 1, 1, 1, 1,
-0.1585304, -0.5732774, -1.956403, 1, 1, 1, 1, 1,
-0.1556847, -0.005605537, -2.096877, 1, 1, 1, 1, 1,
-0.1481355, 1.537638, -0.9225419, 1, 1, 1, 1, 1,
-0.1476071, 0.7471807, 0.012937, 1, 1, 1, 1, 1,
-0.1464259, 0.5438604, -0.09949818, 1, 1, 1, 1, 1,
-0.1453482, -1.409601, -3.478132, 1, 1, 1, 1, 1,
-0.1332226, 0.851478, 0.4601912, 1, 1, 1, 1, 1,
-0.1331337, -0.4176953, -3.350321, 1, 1, 1, 1, 1,
-0.1317611, -0.8092519, -2.352628, 1, 1, 1, 1, 1,
-0.127403, -0.9165938, -3.000149, 1, 1, 1, 1, 1,
-0.1235093, -0.939645, -3.689562, 1, 1, 1, 1, 1,
-0.1202825, 0.2707352, 0.2931762, 1, 1, 1, 1, 1,
-0.1190739, -1.095711, -3.462876, 1, 1, 1, 1, 1,
-0.1178649, 0.1848191, 0.4597318, 0, 0, 1, 1, 1,
-0.1099896, -0.8599371, -3.338036, 1, 0, 0, 1, 1,
-0.1073144, 0.5475264, -0.2688587, 1, 0, 0, 1, 1,
-0.1036524, -0.9909842, -3.894773, 1, 0, 0, 1, 1,
-0.1006312, -1.897069, -4.263376, 1, 0, 0, 1, 1,
-0.09961106, 0.5794899, -0.3411143, 1, 0, 0, 1, 1,
-0.0991697, 0.4323433, -0.8077188, 0, 0, 0, 1, 1,
-0.09501193, 1.633003, -0.8954222, 0, 0, 0, 1, 1,
-0.0934739, 0.7208465, 1.713217, 0, 0, 0, 1, 1,
-0.08406671, 0.6134758, -0.3215135, 0, 0, 0, 1, 1,
-0.08150999, -0.4499079, -2.91644, 0, 0, 0, 1, 1,
-0.07592937, -0.3073687, -2.361845, 0, 0, 0, 1, 1,
-0.07311918, -0.2833841, -2.309769, 0, 0, 0, 1, 1,
-0.07065473, -0.2038791, -1.590998, 1, 1, 1, 1, 1,
-0.06754385, 1.48257, 0.3851781, 1, 1, 1, 1, 1,
-0.06666511, -0.9204039, -3.010088, 1, 1, 1, 1, 1,
-0.06423245, -0.772568, -4.309978, 1, 1, 1, 1, 1,
-0.06405557, -0.3736109, -1.694517, 1, 1, 1, 1, 1,
-0.05858412, 0.5758008, -0.2169519, 1, 1, 1, 1, 1,
-0.05726189, -0.1151879, -2.82873, 1, 1, 1, 1, 1,
-0.0570645, -0.9153661, -2.605051, 1, 1, 1, 1, 1,
-0.05609784, 1.011665, -0.07084636, 1, 1, 1, 1, 1,
-0.05546488, -0.1246327, -2.686081, 1, 1, 1, 1, 1,
-0.05032767, 2.558077, 1.747978, 1, 1, 1, 1, 1,
-0.04532071, 0.6928665, -2.492932, 1, 1, 1, 1, 1,
-0.0398964, -1.289935, -3.446692, 1, 1, 1, 1, 1,
-0.0379805, 0.305191, -1.741429, 1, 1, 1, 1, 1,
-0.03716934, -0.4761775, -1.587099, 1, 1, 1, 1, 1,
-0.03554801, -0.680497, -2.995544, 0, 0, 1, 1, 1,
-0.03493961, -0.9290085, -3.95576, 1, 0, 0, 1, 1,
-0.03402748, 0.2924781, 1.085182, 1, 0, 0, 1, 1,
-0.03374392, 2.702525, 0.4106669, 1, 0, 0, 1, 1,
-0.03043626, -0.9088418, -3.59748, 1, 0, 0, 1, 1,
-0.02831346, -1.291023, -1.991448, 1, 0, 0, 1, 1,
-0.02829052, 0.006697726, -0.2926092, 0, 0, 0, 1, 1,
-0.02636954, 1.309085, -1.859293, 0, 0, 0, 1, 1,
-0.02525142, -0.4290752, -3.501305, 0, 0, 0, 1, 1,
-0.02516999, 0.000129193, 0.486084, 0, 0, 0, 1, 1,
-0.02501896, 2.534462, 2.425236, 0, 0, 0, 1, 1,
-0.02418479, 1.83988, 0.5475398, 0, 0, 0, 1, 1,
-0.02071716, 0.4998779, 1.291317, 0, 0, 0, 1, 1,
-0.02043135, -1.088708, -3.264611, 1, 1, 1, 1, 1,
-0.01872888, -0.4873584, -2.33863, 1, 1, 1, 1, 1,
-0.01478915, -1.426829, -2.653991, 1, 1, 1, 1, 1,
-0.01174059, 0.7761379, -1.606242, 1, 1, 1, 1, 1,
-0.0100055, -1.471238, -3.67419, 1, 1, 1, 1, 1,
-0.009499998, 1.980106, -0.3098394, 1, 1, 1, 1, 1,
-0.004557278, -0.56376, -3.131558, 1, 1, 1, 1, 1,
-0.003333837, -1.978976, -1.885643, 1, 1, 1, 1, 1,
-0.0007574684, -0.04168153, -3.137098, 1, 1, 1, 1, 1,
8.149006e-05, 0.09208087, -0.601274, 1, 1, 1, 1, 1,
0.0004989504, 0.7226511, 0.1307205, 1, 1, 1, 1, 1,
0.0005936084, -0.4464652, 2.92388, 1, 1, 1, 1, 1,
0.003843345, -0.1151789, 0.69506, 1, 1, 1, 1, 1,
0.005962946, -0.1182687, 1.213448, 1, 1, 1, 1, 1,
0.006052936, -0.1504533, 4.510523, 1, 1, 1, 1, 1,
0.006620875, -2.428559, 3.920292, 0, 0, 1, 1, 1,
0.007047688, 0.1994911, 0.2093779, 1, 0, 0, 1, 1,
0.01258492, 1.874527, -0.04982888, 1, 0, 0, 1, 1,
0.02186005, -0.7281065, 3.178293, 1, 0, 0, 1, 1,
0.02228906, -0.2060964, 2.876699, 1, 0, 0, 1, 1,
0.02384092, -0.6605095, 2.206418, 1, 0, 0, 1, 1,
0.03540224, -0.03824034, 1.282206, 0, 0, 0, 1, 1,
0.045506, 0.2120147, -0.3046525, 0, 0, 0, 1, 1,
0.04700131, -0.5106273, 1.930161, 0, 0, 0, 1, 1,
0.04700582, 0.5915937, -0.7437018, 0, 0, 0, 1, 1,
0.04749092, 1.284899, -0.4426727, 0, 0, 0, 1, 1,
0.05039384, 0.4556434, -1.744904, 0, 0, 0, 1, 1,
0.05462951, -1.937211, 3.505586, 0, 0, 0, 1, 1,
0.05499236, -0.03439511, 3.09738, 1, 1, 1, 1, 1,
0.05512518, -0.1446221, 2.749972, 1, 1, 1, 1, 1,
0.05803305, -1.124063, 2.722293, 1, 1, 1, 1, 1,
0.06290862, -0.3010267, 2.621677, 1, 1, 1, 1, 1,
0.0648203, -0.8721803, 0.6897498, 1, 1, 1, 1, 1,
0.06734675, -0.05162304, 1.37499, 1, 1, 1, 1, 1,
0.06776878, -0.9004644, 3.546295, 1, 1, 1, 1, 1,
0.07212721, -0.09276367, 1.910701, 1, 1, 1, 1, 1,
0.07467846, 1.846067, -0.1574559, 1, 1, 1, 1, 1,
0.07780632, 1.016945, -1.171946, 1, 1, 1, 1, 1,
0.07839946, -1.702288, 2.171836, 1, 1, 1, 1, 1,
0.07844812, 1.156985, 0.4924245, 1, 1, 1, 1, 1,
0.08077396, -0.1880991, 3.67995, 1, 1, 1, 1, 1,
0.0823954, 1.429471, -0.06342619, 1, 1, 1, 1, 1,
0.08495172, -0.07580282, 1.089146, 1, 1, 1, 1, 1,
0.09582418, -0.2794096, 2.563626, 0, 0, 1, 1, 1,
0.102341, -2.140381, 2.745435, 1, 0, 0, 1, 1,
0.1031594, -1.582395, 2.173457, 1, 0, 0, 1, 1,
0.1032423, 0.3397064, 0.647772, 1, 0, 0, 1, 1,
0.1034569, 1.46813, -0.1612512, 1, 0, 0, 1, 1,
0.1047674, -1.262666, 4.243339, 1, 0, 0, 1, 1,
0.1062335, 0.4059418, -0.6408793, 0, 0, 0, 1, 1,
0.1172369, 0.3304497, -1.232995, 0, 0, 0, 1, 1,
0.1188953, -0.5800003, 2.869287, 0, 0, 0, 1, 1,
0.1195975, -0.1903976, 2.425467, 0, 0, 0, 1, 1,
0.1211849, -1.106663, 1.653948, 0, 0, 0, 1, 1,
0.1213289, 0.6947086, -0.4852015, 0, 0, 0, 1, 1,
0.1227267, 1.023301, 0.1003988, 0, 0, 0, 1, 1,
0.1261286, -1.925292, 5.154735, 1, 1, 1, 1, 1,
0.1285126, -0.08425267, 1.713285, 1, 1, 1, 1, 1,
0.1337517, -0.6594523, 3.979141, 1, 1, 1, 1, 1,
0.1370763, -0.05616437, 1.566277, 1, 1, 1, 1, 1,
0.1400946, -0.6868318, 3.498195, 1, 1, 1, 1, 1,
0.1425214, 0.822421, -1.262204, 1, 1, 1, 1, 1,
0.1456598, 0.4759544, 0.4720378, 1, 1, 1, 1, 1,
0.146173, -0.6296384, 2.842931, 1, 1, 1, 1, 1,
0.1491909, -0.185651, 3.218846, 1, 1, 1, 1, 1,
0.1497605, -2.109962, 2.625531, 1, 1, 1, 1, 1,
0.1500691, 1.053, 1.147914, 1, 1, 1, 1, 1,
0.1510849, -0.6656495, 1.711151, 1, 1, 1, 1, 1,
0.1512494, 0.6205451, 1.4274, 1, 1, 1, 1, 1,
0.1515737, 0.08268539, -0.7504911, 1, 1, 1, 1, 1,
0.1520774, -1.380535, 4.155748, 1, 1, 1, 1, 1,
0.1537098, 1.448245, -0.2423855, 0, 0, 1, 1, 1,
0.1540003, -0.643807, 3.571259, 1, 0, 0, 1, 1,
0.1564155, 0.3268753, 1.296331, 1, 0, 0, 1, 1,
0.15874, -0.6785588, 2.128109, 1, 0, 0, 1, 1,
0.1592661, -1.40231, 2.262508, 1, 0, 0, 1, 1,
0.1666657, -0.9967771, 3.986635, 1, 0, 0, 1, 1,
0.167722, 0.4127114, 1.185279, 0, 0, 0, 1, 1,
0.1697679, 0.4109121, 0.9513352, 0, 0, 0, 1, 1,
0.1733954, -0.5604864, 2.385897, 0, 0, 0, 1, 1,
0.1767946, -0.4864987, 2.581811, 0, 0, 0, 1, 1,
0.1769672, 0.8222932, -0.4494563, 0, 0, 0, 1, 1,
0.1796178, 0.8634799, -0.5100073, 0, 0, 0, 1, 1,
0.1803193, -1.543443, 3.458313, 0, 0, 0, 1, 1,
0.1810087, -0.006144589, 1.234354, 1, 1, 1, 1, 1,
0.1812192, -0.2144068, 0.6890312, 1, 1, 1, 1, 1,
0.1819934, 1.359649, -1.01496, 1, 1, 1, 1, 1,
0.1824257, -0.08952069, 2.73694, 1, 1, 1, 1, 1,
0.1831434, 0.3123129, 1.326724, 1, 1, 1, 1, 1,
0.1878909, -1.754062, 5.726758, 1, 1, 1, 1, 1,
0.1892401, 1.574867, -1.798832, 1, 1, 1, 1, 1,
0.1899606, 0.3911354, -1.175065, 1, 1, 1, 1, 1,
0.1926489, -1.90644, 1.085896, 1, 1, 1, 1, 1,
0.1932481, -0.06427354, 4.919686, 1, 1, 1, 1, 1,
0.1932627, 0.9664901, 0.05363097, 1, 1, 1, 1, 1,
0.1973212, 0.3178165, -1.82991, 1, 1, 1, 1, 1,
0.197438, -0.02522905, 2.108484, 1, 1, 1, 1, 1,
0.2046638, 0.6771694, 0.6197532, 1, 1, 1, 1, 1,
0.2098291, -0.194482, 2.720609, 1, 1, 1, 1, 1,
0.2098691, -0.8015544, 4.098832, 0, 0, 1, 1, 1,
0.2107932, 0.3441981, -0.7026635, 1, 0, 0, 1, 1,
0.2124065, -0.823826, 3.439727, 1, 0, 0, 1, 1,
0.2133853, 1.142568, 0.4673536, 1, 0, 0, 1, 1,
0.2146151, 1.053384, 0.3292792, 1, 0, 0, 1, 1,
0.2148375, 1.249858, -0.3176406, 1, 0, 0, 1, 1,
0.2203251, 0.3617804, 0.7202128, 0, 0, 0, 1, 1,
0.2206855, -0.09030932, 2.587659, 0, 0, 0, 1, 1,
0.2222669, -0.4821326, 3.663161, 0, 0, 0, 1, 1,
0.2324795, 0.2083277, -1.131431, 0, 0, 0, 1, 1,
0.2333485, -0.4557262, 2.762566, 0, 0, 0, 1, 1,
0.239153, 0.2994384, 1.359412, 0, 0, 0, 1, 1,
0.2437767, 0.0045819, 1.448861, 0, 0, 0, 1, 1,
0.246675, -1.450286, 1.81863, 1, 1, 1, 1, 1,
0.2488851, -0.510492, 1.879079, 1, 1, 1, 1, 1,
0.2518926, 0.5806139, 0.7258639, 1, 1, 1, 1, 1,
0.2522072, 1.28142, 0.02639205, 1, 1, 1, 1, 1,
0.2533345, -1.72964, 2.742027, 1, 1, 1, 1, 1,
0.2535295, 1.321427, 0.546701, 1, 1, 1, 1, 1,
0.256239, 1.297502, 0.974651, 1, 1, 1, 1, 1,
0.2566769, 0.8406774, -0.6994836, 1, 1, 1, 1, 1,
0.2621318, 0.4670532, 1.826936, 1, 1, 1, 1, 1,
0.2635625, 0.01940434, 3.446983, 1, 1, 1, 1, 1,
0.2659162, -0.9637727, 2.876692, 1, 1, 1, 1, 1,
0.2668524, 2.396313, 0.04869269, 1, 1, 1, 1, 1,
0.2680584, -0.3783679, 3.78741, 1, 1, 1, 1, 1,
0.2685617, 0.5431851, 1.022165, 1, 1, 1, 1, 1,
0.2724335, -0.1871955, 1.922968, 1, 1, 1, 1, 1,
0.2747729, -0.497312, 2.879819, 0, 0, 1, 1, 1,
0.2755127, 0.852923, 0.4097479, 1, 0, 0, 1, 1,
0.2763046, -1.077666, 2.630811, 1, 0, 0, 1, 1,
0.2765047, 1.699899, -0.5249892, 1, 0, 0, 1, 1,
0.2769606, 1.243142, 0.4363175, 1, 0, 0, 1, 1,
0.2771927, 0.07351321, 2.303736, 1, 0, 0, 1, 1,
0.2836802, -1.187387, 2.03727, 0, 0, 0, 1, 1,
0.2847914, 1.5231, -0.6792141, 0, 0, 0, 1, 1,
0.2863434, 1.37852, -0.7026997, 0, 0, 0, 1, 1,
0.2873888, -0.4888518, 1.723816, 0, 0, 0, 1, 1,
0.2883477, -0.2336357, 3.461797, 0, 0, 0, 1, 1,
0.2898106, 0.3450658, 0.1092303, 0, 0, 0, 1, 1,
0.2939578, 0.1922151, 0.6078569, 0, 0, 0, 1, 1,
0.2956215, 0.5778639, -0.5279971, 1, 1, 1, 1, 1,
0.2959571, 0.5240408, 0.2002772, 1, 1, 1, 1, 1,
0.2961357, 0.8013477, 0.6798998, 1, 1, 1, 1, 1,
0.2969136, -1.143793, 2.78638, 1, 1, 1, 1, 1,
0.2980712, 0.3917374, 1.362668, 1, 1, 1, 1, 1,
0.2998112, 1.657292, -0.4024318, 1, 1, 1, 1, 1,
0.3046161, -0.3014854, 2.694209, 1, 1, 1, 1, 1,
0.3083812, -0.493179, 1.701426, 1, 1, 1, 1, 1,
0.3095935, 0.7226923, -0.5271339, 1, 1, 1, 1, 1,
0.3141299, -0.8225952, 3.448136, 1, 1, 1, 1, 1,
0.3176528, 1.123562, 0.5610412, 1, 1, 1, 1, 1,
0.3248591, 0.537518, -0.4274819, 1, 1, 1, 1, 1,
0.3258395, 1.000552, -1.214562, 1, 1, 1, 1, 1,
0.3270821, -1.181252, 2.797525, 1, 1, 1, 1, 1,
0.3297114, 0.4921607, 0.4209534, 1, 1, 1, 1, 1,
0.3310873, -0.1476452, 1.942687, 0, 0, 1, 1, 1,
0.3392551, 0.3518583, -0.4551223, 1, 0, 0, 1, 1,
0.3423764, -0.345772, 4.625609, 1, 0, 0, 1, 1,
0.3444164, 0.1799006, 0.1268543, 1, 0, 0, 1, 1,
0.3458952, 0.2092682, 1.473324, 1, 0, 0, 1, 1,
0.3482635, 0.1764636, -1.452432, 1, 0, 0, 1, 1,
0.3521269, -1.121554, 2.643174, 0, 0, 0, 1, 1,
0.3564884, -0.3333573, 3.632221, 0, 0, 0, 1, 1,
0.358015, -0.3808371, 3.077131, 0, 0, 0, 1, 1,
0.3587032, -0.5962067, 3.284055, 0, 0, 0, 1, 1,
0.3626713, -0.17655, 2.847706, 0, 0, 0, 1, 1,
0.3649659, 0.8553521, 0.2347024, 0, 0, 0, 1, 1,
0.3710968, 0.4459833, 2.242771, 0, 0, 0, 1, 1,
0.3730695, 0.2602172, 0.9332036, 1, 1, 1, 1, 1,
0.373706, -1.187552, 2.959239, 1, 1, 1, 1, 1,
0.3799234, 0.9264832, -0.1146338, 1, 1, 1, 1, 1,
0.385315, -0.0766995, 3.640983, 1, 1, 1, 1, 1,
0.387244, -0.1635619, 4.06689, 1, 1, 1, 1, 1,
0.38748, -0.3069301, 2.00616, 1, 1, 1, 1, 1,
0.3886199, 0.07988937, -0.05736421, 1, 1, 1, 1, 1,
0.3894309, 0.5015555, -0.1346495, 1, 1, 1, 1, 1,
0.3935231, 0.4937766, -1.950771, 1, 1, 1, 1, 1,
0.3940239, 0.2401572, 0.82749, 1, 1, 1, 1, 1,
0.3944373, 0.4484042, 1.542796, 1, 1, 1, 1, 1,
0.3944699, -1.180997, 2.17721, 1, 1, 1, 1, 1,
0.4005437, -0.5652953, 3.70215, 1, 1, 1, 1, 1,
0.4030228, -0.8211824, 2.691629, 1, 1, 1, 1, 1,
0.4059652, -0.8149073, 1.978142, 1, 1, 1, 1, 1,
0.4064094, 0.6043892, 1.582131, 0, 0, 1, 1, 1,
0.4078201, -0.1449506, 1.591426, 1, 0, 0, 1, 1,
0.408909, -0.7324051, 4.135273, 1, 0, 0, 1, 1,
0.4092941, -0.1706147, 2.620387, 1, 0, 0, 1, 1,
0.4103845, 0.03134585, 2.092696, 1, 0, 0, 1, 1,
0.4118975, -1.241485, 3.352268, 1, 0, 0, 1, 1,
0.4155903, 0.05881569, -0.1880836, 0, 0, 0, 1, 1,
0.4195464, -0.3960213, 2.780669, 0, 0, 0, 1, 1,
0.4207389, -1.627623, 2.074351, 0, 0, 0, 1, 1,
0.429138, 0.9747817, 0.2928983, 0, 0, 0, 1, 1,
0.4345265, 0.6071883, 0.8945966, 0, 0, 0, 1, 1,
0.4357411, 0.1581034, 2.587642, 0, 0, 0, 1, 1,
0.439929, -0.5493968, 1.633315, 0, 0, 0, 1, 1,
0.4411274, 0.3767968, 1.037237, 1, 1, 1, 1, 1,
0.4478223, -0.1306566, -0.4882199, 1, 1, 1, 1, 1,
0.4478584, 0.7797232, 1.651462, 1, 1, 1, 1, 1,
0.4500678, 1.201992, -0.7381272, 1, 1, 1, 1, 1,
0.4573616, 0.06642545, 0.9348252, 1, 1, 1, 1, 1,
0.4574786, -0.5102684, 2.342887, 1, 1, 1, 1, 1,
0.4582695, 0.2735384, 1.911347, 1, 1, 1, 1, 1,
0.4597084, -0.6404669, 4.776083, 1, 1, 1, 1, 1,
0.4619133, 1.325425, 1.890588, 1, 1, 1, 1, 1,
0.4624207, 0.5783098, 2.163654, 1, 1, 1, 1, 1,
0.4639651, 0.1135963, 3.804629, 1, 1, 1, 1, 1,
0.466195, 0.9015378, -0.3800502, 1, 1, 1, 1, 1,
0.4662075, -0.2287562, 1.858696, 1, 1, 1, 1, 1,
0.4674822, 0.8946255, -0.1942613, 1, 1, 1, 1, 1,
0.4682595, -0.9452052, 2.966816, 1, 1, 1, 1, 1,
0.477146, -1.709013, 1.918507, 0, 0, 1, 1, 1,
0.4891986, 1.430745, -0.2685338, 1, 0, 0, 1, 1,
0.4898807, 0.1304824, 0.5205555, 1, 0, 0, 1, 1,
0.4916619, 0.405422, 1.518332, 1, 0, 0, 1, 1,
0.4925542, -0.04490011, 2.421113, 1, 0, 0, 1, 1,
0.4938974, 0.5467651, 1.790753, 1, 0, 0, 1, 1,
0.4955581, -0.1352255, 0.4419725, 0, 0, 0, 1, 1,
0.4994831, 0.6147724, 0.3227951, 0, 0, 0, 1, 1,
0.5007004, 0.4589559, 2.228255, 0, 0, 0, 1, 1,
0.502668, 2.401853, -0.1177656, 0, 0, 0, 1, 1,
0.5036792, -0.2785609, 2.190023, 0, 0, 0, 1, 1,
0.5083387, -0.4267766, 0.8662586, 0, 0, 0, 1, 1,
0.5104333, 0.4723819, 1.870741, 0, 0, 0, 1, 1,
0.5105535, 0.7402123, 1.346512, 1, 1, 1, 1, 1,
0.5134941, -0.825878, 4.962815, 1, 1, 1, 1, 1,
0.5176296, -0.1287142, 1.232211, 1, 1, 1, 1, 1,
0.521992, -0.8667131, 1.610194, 1, 1, 1, 1, 1,
0.5248782, -0.8880345, 2.88131, 1, 1, 1, 1, 1,
0.527, -0.7111521, 2.08432, 1, 1, 1, 1, 1,
0.5275951, -0.9982383, 3.217405, 1, 1, 1, 1, 1,
0.5291562, -0.7546157, 2.275738, 1, 1, 1, 1, 1,
0.5308785, 0.1895014, -0.06218447, 1, 1, 1, 1, 1,
0.5363795, 1.0388, 1.034783, 1, 1, 1, 1, 1,
0.5371974, 1.129261, -1.84983, 1, 1, 1, 1, 1,
0.5372657, -0.1940836, 1.251706, 1, 1, 1, 1, 1,
0.5385638, 0.2491688, 0.3937979, 1, 1, 1, 1, 1,
0.5405539, -0.3675438, 3.430226, 1, 1, 1, 1, 1,
0.5432806, 0.1161337, 0.1255768, 1, 1, 1, 1, 1,
0.5467189, -1.446816, 2.086701, 0, 0, 1, 1, 1,
0.5474233, -1.007453, 2.860594, 1, 0, 0, 1, 1,
0.5477527, 0.8103939, 0.806582, 1, 0, 0, 1, 1,
0.5480138, -0.7886288, 4.276546, 1, 0, 0, 1, 1,
0.5486275, 0.06558379, 2.003924, 1, 0, 0, 1, 1,
0.5514033, -0.4824483, 1.608672, 1, 0, 0, 1, 1,
0.5526291, -0.5261804, 2.366145, 0, 0, 0, 1, 1,
0.5640602, 0.2693236, 2.092561, 0, 0, 0, 1, 1,
0.5656977, -0.1185563, 1.270608, 0, 0, 0, 1, 1,
0.5667561, -0.4224404, 3.421057, 0, 0, 0, 1, 1,
0.5752061, -0.7609583, 1.575255, 0, 0, 0, 1, 1,
0.5768861, -0.2530559, 3.594008, 0, 0, 0, 1, 1,
0.5793956, 0.2543156, 0.4280773, 0, 0, 0, 1, 1,
0.5815072, 2.121766, 0.09085607, 1, 1, 1, 1, 1,
0.5819293, 0.6484412, -0.04355134, 1, 1, 1, 1, 1,
0.5824891, 0.09695023, 0.9552032, 1, 1, 1, 1, 1,
0.5825595, 0.2603698, -0.0660226, 1, 1, 1, 1, 1,
0.583496, -0.8061078, 3.922081, 1, 1, 1, 1, 1,
0.5843669, 1.656836, 0.06346931, 1, 1, 1, 1, 1,
0.5894433, -0.2766759, 1.296965, 1, 1, 1, 1, 1,
0.5918658, 0.008920045, 1.683836, 1, 1, 1, 1, 1,
0.5924025, -0.3867028, 1.859154, 1, 1, 1, 1, 1,
0.5942328, 1.991992, 0.8508293, 1, 1, 1, 1, 1,
0.5951926, 1.404503, -0.1742741, 1, 1, 1, 1, 1,
0.5964879, 0.9653101, 0.1711704, 1, 1, 1, 1, 1,
0.5965684, 1.566149, 1.180923, 1, 1, 1, 1, 1,
0.6027204, 0.7312573, 1.065289, 1, 1, 1, 1, 1,
0.60419, -0.1854149, 1.846924, 1, 1, 1, 1, 1,
0.6090638, 0.2250023, 2.720718, 0, 0, 1, 1, 1,
0.6096339, -0.0004826984, 1.162072, 1, 0, 0, 1, 1,
0.6136747, 1.178905, 0.9845919, 1, 0, 0, 1, 1,
0.615412, 0.768689, 0.615675, 1, 0, 0, 1, 1,
0.6162214, 2.092116, -0.4255243, 1, 0, 0, 1, 1,
0.6217167, -0.2407182, 0.9155897, 1, 0, 0, 1, 1,
0.6327991, 1.929281, 1.670268, 0, 0, 0, 1, 1,
0.6371729, 0.4519776, 1.427395, 0, 0, 0, 1, 1,
0.6384679, -1.273019, 3.034882, 0, 0, 0, 1, 1,
0.6421379, 0.5288177, 0.6494551, 0, 0, 0, 1, 1,
0.6430629, 0.009496525, 0.2822914, 0, 0, 0, 1, 1,
0.6435481, -1.843203, 3.55044, 0, 0, 0, 1, 1,
0.6457096, -1.737071, 1.707552, 0, 0, 0, 1, 1,
0.6481811, -2.023507, 3.650543, 1, 1, 1, 1, 1,
0.6497357, 0.9496278, 1.245924, 1, 1, 1, 1, 1,
0.652331, 0.5051199, 2.080925, 1, 1, 1, 1, 1,
0.6535226, 0.7149454, 2.831289, 1, 1, 1, 1, 1,
0.6546382, 2.159209, 1.853165, 1, 1, 1, 1, 1,
0.6579853, -0.684297, 2.758362, 1, 1, 1, 1, 1,
0.6596019, 0.93986, 0.9522638, 1, 1, 1, 1, 1,
0.6622431, 1.755851, -1.205024, 1, 1, 1, 1, 1,
0.6633494, -1.132487, 2.192538, 1, 1, 1, 1, 1,
0.6651332, -0.2343429, 1.552456, 1, 1, 1, 1, 1,
0.6664372, -0.5935894, 2.109571, 1, 1, 1, 1, 1,
0.6691408, 0.4868137, 1.335842, 1, 1, 1, 1, 1,
0.6757127, -0.7744816, 1.4273, 1, 1, 1, 1, 1,
0.6836942, -0.7536551, 2.060796, 1, 1, 1, 1, 1,
0.685263, -0.7605426, 2.120119, 1, 1, 1, 1, 1,
0.6885158, -0.6670569, 2.691107, 0, 0, 1, 1, 1,
0.68968, -1.138755, 3.002137, 1, 0, 0, 1, 1,
0.6910248, -0.7212611, 3.411349, 1, 0, 0, 1, 1,
0.6965402, 0.7198491, 3.073668, 1, 0, 0, 1, 1,
0.7006528, -0.05344285, -0.2714154, 1, 0, 0, 1, 1,
0.7022596, 0.09324899, 2.478626, 1, 0, 0, 1, 1,
0.7025838, -0.984867, 1.426279, 0, 0, 0, 1, 1,
0.7031564, 0.5995855, -0.4368927, 0, 0, 0, 1, 1,
0.7033269, 0.5286908, 1.900404, 0, 0, 0, 1, 1,
0.707195, 2.23986, 0.5893795, 0, 0, 0, 1, 1,
0.7082441, 1.249372, 0.4856607, 0, 0, 0, 1, 1,
0.7110957, -1.691314, 4.302094, 0, 0, 0, 1, 1,
0.7154931, 0.1027753, 2.510108, 0, 0, 0, 1, 1,
0.7173359, 0.1271659, -0.5627795, 1, 1, 1, 1, 1,
0.7295304, 0.3178001, 0.3485121, 1, 1, 1, 1, 1,
0.736271, -0.1098157, 2.778163, 1, 1, 1, 1, 1,
0.7415833, -0.3560128, 2.386621, 1, 1, 1, 1, 1,
0.7482994, 0.7050943, 1.771213, 1, 1, 1, 1, 1,
0.7569814, -2.130141, 2.100679, 1, 1, 1, 1, 1,
0.7650199, 0.4709679, 1.470099, 1, 1, 1, 1, 1,
0.7657291, 0.04285736, 1.578289, 1, 1, 1, 1, 1,
0.7672063, -0.2555361, 1.797356, 1, 1, 1, 1, 1,
0.7682514, -1.250815, 0.532725, 1, 1, 1, 1, 1,
0.7697713, 0.3821676, 0.3455264, 1, 1, 1, 1, 1,
0.7737122, -0.2909283, 1.430164, 1, 1, 1, 1, 1,
0.7746087, -1.413068, 1.369818, 1, 1, 1, 1, 1,
0.7762051, 0.6154989, 2.715769, 1, 1, 1, 1, 1,
0.7789435, -0.1428656, 1.212508, 1, 1, 1, 1, 1,
0.7794608, -0.2595228, 1.142926, 0, 0, 1, 1, 1,
0.7830552, 0.8160103, 1.606651, 1, 0, 0, 1, 1,
0.7860974, -0.8379847, 2.085248, 1, 0, 0, 1, 1,
0.7875906, 1.305416, 1.854177, 1, 0, 0, 1, 1,
0.7900019, 1.563701, 1.062629, 1, 0, 0, 1, 1,
0.7927449, -0.5119889, 1.379537, 1, 0, 0, 1, 1,
0.7929239, -0.1353601, 0.4036987, 0, 0, 0, 1, 1,
0.7932193, -0.1521739, 2.121045, 0, 0, 0, 1, 1,
0.7984316, 1.157878, 0.7796558, 0, 0, 0, 1, 1,
0.7992046, 1.09122, 0.9523551, 0, 0, 0, 1, 1,
0.8011834, 1.784202, 1.917122, 0, 0, 0, 1, 1,
0.8039371, 1.941625, 0.3734441, 0, 0, 0, 1, 1,
0.8072761, 0.1102501, 2.582006, 0, 0, 0, 1, 1,
0.8108729, -0.7572144, 1.788982, 1, 1, 1, 1, 1,
0.8118435, 0.1301384, 2.736782, 1, 1, 1, 1, 1,
0.8166969, -0.5081227, 2.43455, 1, 1, 1, 1, 1,
0.8175077, 0.9475625, -0.1898727, 1, 1, 1, 1, 1,
0.8258846, 0.2767646, 1.764118, 1, 1, 1, 1, 1,
0.8299198, 0.01590634, 4.33288, 1, 1, 1, 1, 1,
0.8493114, 1.559736, 1.025887, 1, 1, 1, 1, 1,
0.8499143, -0.08058444, 1.101691, 1, 1, 1, 1, 1,
0.8537377, 0.6117218, 1.761246, 1, 1, 1, 1, 1,
0.8593245, 1.955737, 0.7488511, 1, 1, 1, 1, 1,
0.8632405, -1.323791, 1.496389, 1, 1, 1, 1, 1,
0.8680792, 0.9779521, 0.83964, 1, 1, 1, 1, 1,
0.8710279, 0.01616999, 2.477101, 1, 1, 1, 1, 1,
0.8715004, 1.300328, 0.5878727, 1, 1, 1, 1, 1,
0.8726922, -0.1426084, 0.9810838, 1, 1, 1, 1, 1,
0.8783739, -0.8529465, 2.817928, 0, 0, 1, 1, 1,
0.8783864, 0.1067927, 4.151127, 1, 0, 0, 1, 1,
0.884241, 0.8801652, 0.5405664, 1, 0, 0, 1, 1,
0.8881738, 0.7279099, 3.509032, 1, 0, 0, 1, 1,
0.891573, 0.1155352, 1.625393, 1, 0, 0, 1, 1,
0.8919609, -0.0872012, 3.050171, 1, 0, 0, 1, 1,
0.8943021, -0.2553099, 1.924543, 0, 0, 0, 1, 1,
0.8978412, -0.8765399, 2.775611, 0, 0, 0, 1, 1,
0.9006628, -0.7109111, 2.783805, 0, 0, 0, 1, 1,
0.913737, 0.9774361, 1.80365, 0, 0, 0, 1, 1,
0.9140176, 0.02215848, 2.436816, 0, 0, 0, 1, 1,
0.9169475, 1.40122, -0.2939713, 0, 0, 0, 1, 1,
0.9177537, 0.1320564, 1.301406, 0, 0, 0, 1, 1,
0.9184989, 1.696133, -1.015841, 1, 1, 1, 1, 1,
0.9215073, 1.153597, 0.05660502, 1, 1, 1, 1, 1,
0.9243015, 0.9323438, 0.8573043, 1, 1, 1, 1, 1,
0.924632, 0.4836623, 2.50156, 1, 1, 1, 1, 1,
0.9291312, 1.427752, 0.2511826, 1, 1, 1, 1, 1,
0.9321872, 0.3112736, 1.998828, 1, 1, 1, 1, 1,
0.938524, -0.2643382, 2.813311, 1, 1, 1, 1, 1,
0.9460064, -0.6198899, 3.35585, 1, 1, 1, 1, 1,
0.9485266, 0.2330841, 1.002634, 1, 1, 1, 1, 1,
0.9512702, -1.050467, 2.299875, 1, 1, 1, 1, 1,
0.9530774, -0.2501196, 2.55492, 1, 1, 1, 1, 1,
0.9550413, -0.3388323, 1.443897, 1, 1, 1, 1, 1,
0.958568, -0.3947612, 2.921187, 1, 1, 1, 1, 1,
0.9647884, 0.2099097, 0.3146302, 1, 1, 1, 1, 1,
0.9662876, 1.254617, 1.658181, 1, 1, 1, 1, 1,
0.9682696, -1.31982, 1.892404, 0, 0, 1, 1, 1,
0.9722863, 1.197743, 0.5360851, 1, 0, 0, 1, 1,
0.9733944, -0.2320196, 1.623879, 1, 0, 0, 1, 1,
0.978045, -0.149482, 2.312117, 1, 0, 0, 1, 1,
0.9819018, -0.7273512, 0.817226, 1, 0, 0, 1, 1,
0.9854465, -0.0398108, 1.967939, 1, 0, 0, 1, 1,
0.9932184, -0.8980448, 0.3056604, 0, 0, 0, 1, 1,
0.9935763, -0.2290695, 2.146071, 0, 0, 0, 1, 1,
0.9956588, -1.601544, 0.5775412, 0, 0, 0, 1, 1,
0.9975978, -0.9382125, 2.611712, 0, 0, 0, 1, 1,
1.006373, 1.061184, -0.01610039, 0, 0, 0, 1, 1,
1.023402, 1.215146, 2.534591, 0, 0, 0, 1, 1,
1.03235, 0.2723847, -0.1510054, 0, 0, 0, 1, 1,
1.035155, 0.1745783, 0.3358925, 1, 1, 1, 1, 1,
1.037536, 0.1752745, 2.797816, 1, 1, 1, 1, 1,
1.041789, -1.129282, 3.501858, 1, 1, 1, 1, 1,
1.04709, -3.533232, 3.023067, 1, 1, 1, 1, 1,
1.048469, 0.8460455, -0.135907, 1, 1, 1, 1, 1,
1.067351, -0.3106251, 3.925344, 1, 1, 1, 1, 1,
1.068078, 1.5982, -0.2976502, 1, 1, 1, 1, 1,
1.068385, 0.8633847, 1.902042, 1, 1, 1, 1, 1,
1.07338, 2.066482, 1.150691, 1, 1, 1, 1, 1,
1.082537, 0.5244836, 1.703663, 1, 1, 1, 1, 1,
1.088213, 0.2617179, 1.809709, 1, 1, 1, 1, 1,
1.088511, 1.824197, -0.1804344, 1, 1, 1, 1, 1,
1.091826, -0.1416491, 2.356286, 1, 1, 1, 1, 1,
1.093295, 0.8357024, 0.3521279, 1, 1, 1, 1, 1,
1.094676, 0.07550793, 1.068572, 1, 1, 1, 1, 1,
1.097641, -0.4301074, 2.547867, 0, 0, 1, 1, 1,
1.105331, -0.42914, 1.844545, 1, 0, 0, 1, 1,
1.107919, 1.996005, -0.4536916, 1, 0, 0, 1, 1,
1.114352, 0.09717514, 0.4761609, 1, 0, 0, 1, 1,
1.122866, 1.181228, 0.653428, 1, 0, 0, 1, 1,
1.132216, -1.128806, 3.226667, 1, 0, 0, 1, 1,
1.132399, 1.607834, 1.981995, 0, 0, 0, 1, 1,
1.134888, 1.729794, 0.4808309, 0, 0, 0, 1, 1,
1.135043, 1.928004, -0.5077912, 0, 0, 0, 1, 1,
1.136885, 0.9282163, 1.335332, 0, 0, 0, 1, 1,
1.137629, 2.112303, 2.046503, 0, 0, 0, 1, 1,
1.138046, 0.0560613, 0.4270708, 0, 0, 0, 1, 1,
1.149118, -1.03382, 1.01749, 0, 0, 0, 1, 1,
1.153315, 0.4873011, 1.910255, 1, 1, 1, 1, 1,
1.162691, 1.278363, 0.9899686, 1, 1, 1, 1, 1,
1.169743, -0.1525713, 2.672235, 1, 1, 1, 1, 1,
1.179965, 1.405764, 2.651781, 1, 1, 1, 1, 1,
1.181775, -0.9431955, 2.296427, 1, 1, 1, 1, 1,
1.184477, -1.181927, 0.8868117, 1, 1, 1, 1, 1,
1.184723, -0.4163986, 3.36834, 1, 1, 1, 1, 1,
1.196222, 0.5885396, 1.511225, 1, 1, 1, 1, 1,
1.197182, -2.242326, 3.450088, 1, 1, 1, 1, 1,
1.200172, -0.493823, 1.270414, 1, 1, 1, 1, 1,
1.201464, -1.050541, 3.077479, 1, 1, 1, 1, 1,
1.203151, 0.2536346, 1.486956, 1, 1, 1, 1, 1,
1.206788, -1.059853, 2.428405, 1, 1, 1, 1, 1,
1.213543, 1.903279, 1.895021, 1, 1, 1, 1, 1,
1.214225, -1.238432, 0.09685123, 1, 1, 1, 1, 1,
1.215461, -0.09137306, 3.322964, 0, 0, 1, 1, 1,
1.23436, -0.2336063, -0.6929352, 1, 0, 0, 1, 1,
1.235392, -0.06700803, 1.598019, 1, 0, 0, 1, 1,
1.23907, -1.65551, 3.553533, 1, 0, 0, 1, 1,
1.240905, -1.190485, 2.591918, 1, 0, 0, 1, 1,
1.243472, 1.597644, -0.0152339, 1, 0, 0, 1, 1,
1.250565, -0.08809441, 0.8237122, 0, 0, 0, 1, 1,
1.255885, 0.1383002, 2.749611, 0, 0, 0, 1, 1,
1.266432, -0.5346903, 1.773513, 0, 0, 0, 1, 1,
1.266528, 0.549798, 1.501756, 0, 0, 0, 1, 1,
1.272307, 1.711769, 0.1849391, 0, 0, 0, 1, 1,
1.272578, 1.776509, 0.01075671, 0, 0, 0, 1, 1,
1.279, 0.05999564, 3.384231, 0, 0, 0, 1, 1,
1.280912, -0.2892712, 1.369327, 1, 1, 1, 1, 1,
1.284322, -0.9162673, 1.934487, 1, 1, 1, 1, 1,
1.286273, 0.5513732, 0.4950804, 1, 1, 1, 1, 1,
1.286998, 0.8551789, 0.9042277, 1, 1, 1, 1, 1,
1.303482, 0.2310679, 1.238189, 1, 1, 1, 1, 1,
1.307939, 1.324563, -0.6317594, 1, 1, 1, 1, 1,
1.309683, 0.856815, -0.1787781, 1, 1, 1, 1, 1,
1.327156, -0.1756665, 2.017358, 1, 1, 1, 1, 1,
1.3382, 0.5924593, 1.960375, 1, 1, 1, 1, 1,
1.342375, -0.6781617, 2.213154, 1, 1, 1, 1, 1,
1.343518, 1.799723, 1.585644, 1, 1, 1, 1, 1,
1.347634, -0.4279262, 0.7952706, 1, 1, 1, 1, 1,
1.349491, 0.7248557, -0.3166408, 1, 1, 1, 1, 1,
1.354512, 2.245275, 0.7578597, 1, 1, 1, 1, 1,
1.355369, 0.4642641, 1.353037, 1, 1, 1, 1, 1,
1.357358, 0.5365439, 1.928325, 0, 0, 1, 1, 1,
1.362649, -2.317627, 4.664979, 1, 0, 0, 1, 1,
1.367718, 0.8555432, 2.061759, 1, 0, 0, 1, 1,
1.372894, -2.171937, 1.002626, 1, 0, 0, 1, 1,
1.373383, 0.1797205, 1.312936, 1, 0, 0, 1, 1,
1.376066, -0.1328722, 3.027209, 1, 0, 0, 1, 1,
1.389202, 1.98326, 0.3387343, 0, 0, 0, 1, 1,
1.39325, -0.8537127, 1.210206, 0, 0, 0, 1, 1,
1.398794, -1.005159, 2.185658, 0, 0, 0, 1, 1,
1.407198, -0.2318183, 0.2945893, 0, 0, 0, 1, 1,
1.414646, 0.9113054, 0.9599393, 0, 0, 0, 1, 1,
1.421237, -1.235345, 4.647635, 0, 0, 0, 1, 1,
1.422945, 0.01239159, 0.3940363, 0, 0, 0, 1, 1,
1.42653, 0.5087197, -0.1074238, 1, 1, 1, 1, 1,
1.432238, 0.6433702, 1.963359, 1, 1, 1, 1, 1,
1.438064, -1.019555, 0.4716455, 1, 1, 1, 1, 1,
1.444977, -0.5750889, 2.644531, 1, 1, 1, 1, 1,
1.446643, -0.04037975, 1.32212, 1, 1, 1, 1, 1,
1.465286, 0.1657804, 2.440672, 1, 1, 1, 1, 1,
1.470399, -0.6625377, 2.512737, 1, 1, 1, 1, 1,
1.472963, -0.4847918, 1.076409, 1, 1, 1, 1, 1,
1.477846, -0.1847995, 1.40827, 1, 1, 1, 1, 1,
1.49054, 1.038097, 0.1618452, 1, 1, 1, 1, 1,
1.495006, 0.0275266, 1.480868, 1, 1, 1, 1, 1,
1.499396, 1.08041, 0.6789496, 1, 1, 1, 1, 1,
1.510811, -0.3464961, 1.825539, 1, 1, 1, 1, 1,
1.529297, 0.3078676, 2.842364, 1, 1, 1, 1, 1,
1.567208, -0.4059628, 1.929363, 1, 1, 1, 1, 1,
1.601135, 1.02476, 3.574313, 0, 0, 1, 1, 1,
1.614249, 0.546657, 0.284368, 1, 0, 0, 1, 1,
1.645568, -0.1305339, 2.582787, 1, 0, 0, 1, 1,
1.654413, -0.3514113, 1.766269, 1, 0, 0, 1, 1,
1.664552, 1.288034, 0.8217669, 1, 0, 0, 1, 1,
1.677456, 0.8568049, 1.639272, 1, 0, 0, 1, 1,
1.695516, -1.312058, 1.151535, 0, 0, 0, 1, 1,
1.696543, -0.3136006, 2.813734, 0, 0, 0, 1, 1,
1.70074, -0.5724622, 0.03666098, 0, 0, 0, 1, 1,
1.70798, -0.9707955, 2.837507, 0, 0, 0, 1, 1,
1.708593, 1.957994, 1.722453, 0, 0, 0, 1, 1,
1.716538, 0.0997868, 1.365285, 0, 0, 0, 1, 1,
1.728424, 0.9768827, 2.750831, 0, 0, 0, 1, 1,
1.753827, -0.6030424, 1.338393, 1, 1, 1, 1, 1,
1.757276, 1.124553, 2.762068, 1, 1, 1, 1, 1,
1.766575, 0.6848485, 0.8015326, 1, 1, 1, 1, 1,
1.774945, 1.958321, 1.208308, 1, 1, 1, 1, 1,
1.837064, -0.5759478, 0.7362273, 1, 1, 1, 1, 1,
1.844745, -0.3697864, 0.4177315, 1, 1, 1, 1, 1,
1.870541, -0.004943598, 0.6557945, 1, 1, 1, 1, 1,
1.871958, 0.9750709, 0.4272776, 1, 1, 1, 1, 1,
1.891015, 1.037347, 0.9705281, 1, 1, 1, 1, 1,
1.900787, 0.08133561, 0.9113514, 1, 1, 1, 1, 1,
1.901784, -1.101922, 0.2426446, 1, 1, 1, 1, 1,
1.949875, 0.1659213, 0.6620548, 1, 1, 1, 1, 1,
1.975419, 0.1509359, 2.004072, 1, 1, 1, 1, 1,
1.997071, 0.2044872, -0.3261744, 1, 1, 1, 1, 1,
2.012557, 1.494489, 0.02074963, 1, 1, 1, 1, 1,
2.040481, 0.7855381, 2.262633, 0, 0, 1, 1, 1,
2.077434, -0.4452275, 0.7493523, 1, 0, 0, 1, 1,
2.084742, 1.432864, 0.4154293, 1, 0, 0, 1, 1,
2.085328, -1.209965, 0.924522, 1, 0, 0, 1, 1,
2.087095, 0.4415539, 4.012866, 1, 0, 0, 1, 1,
2.094897, -1.534805, 1.889784, 1, 0, 0, 1, 1,
2.107294, -0.2095119, 1.557811, 0, 0, 0, 1, 1,
2.146389, -0.5429212, 5.848892, 0, 0, 0, 1, 1,
2.148508, -0.4870851, 2.201013, 0, 0, 0, 1, 1,
2.206073, 0.2079633, 2.544689, 0, 0, 0, 1, 1,
2.240574, 0.9464015, 0.6527582, 0, 0, 0, 1, 1,
2.283624, -0.2679707, 0.9676924, 0, 0, 0, 1, 1,
2.34112, 0.492372, 2.387069, 0, 0, 0, 1, 1,
2.342547, 1.513174, -0.5799218, 1, 1, 1, 1, 1,
2.365396, -0.4338676, 2.01648, 1, 1, 1, 1, 1,
2.445687, -1.264426, 1.981987, 1, 1, 1, 1, 1,
2.568529, 0.8117369, 1.246386, 1, 1, 1, 1, 1,
2.587918, -0.1975855, 0.02817069, 1, 1, 1, 1, 1,
2.85063, -0.4873561, 0.1295697, 1, 1, 1, 1, 1,
3.227522, 0.6112769, -0.197901, 1, 1, 1, 1, 1
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
var radius = 9.856503;
var distance = 34.62055;
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
mvMatrix.translate( 0.1006837, 0.0151341, -0.4345939 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62055);
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
