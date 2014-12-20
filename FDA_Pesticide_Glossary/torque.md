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
-3.43623, 0.6364136, -2.693913, 1, 0, 0, 1,
-2.863554, -0.3233267, -2.381665, 1, 0.007843138, 0, 1,
-2.355757, 1.063364, -0.8868382, 1, 0.01176471, 0, 1,
-2.33134, -0.3534247, -3.041512, 1, 0.01960784, 0, 1,
-2.292721, -0.1229065, -0.7008711, 1, 0.02352941, 0, 1,
-2.212344, -0.3862517, -1.222217, 1, 0.03137255, 0, 1,
-2.210873, 0.3233206, -0.7594963, 1, 0.03529412, 0, 1,
-2.16827, -0.1791382, -2.096131, 1, 0.04313726, 0, 1,
-2.153036, -0.4732375, -1.086212, 1, 0.04705882, 0, 1,
-2.095894, 0.1647762, -0.7999373, 1, 0.05490196, 0, 1,
-2.078188, -1.231557, -3.028416, 1, 0.05882353, 0, 1,
-2.059092, 0.5886004, -2.838014, 1, 0.06666667, 0, 1,
-2.042531, 0.7932729, -2.394356, 1, 0.07058824, 0, 1,
-2.039839, -0.6910601, -2.309064, 1, 0.07843138, 0, 1,
-2.028656, -1.300806, -3.622035, 1, 0.08235294, 0, 1,
-2.017303, -0.8866596, -1.850262, 1, 0.09019608, 0, 1,
-2.014529, -0.6598128, -2.013071, 1, 0.09411765, 0, 1,
-1.947736, 0.5824498, -0.526323, 1, 0.1019608, 0, 1,
-1.939275, -0.1324936, -1.87015, 1, 0.1098039, 0, 1,
-1.876384, 2.312992, -1.928817, 1, 0.1137255, 0, 1,
-1.8726, 0.8632926, -1.160731, 1, 0.1215686, 0, 1,
-1.871911, -0.1424085, -0.9316672, 1, 0.1254902, 0, 1,
-1.855224, 0.9840181, -1.591461, 1, 0.1333333, 0, 1,
-1.846584, -0.03772078, -0.3321397, 1, 0.1372549, 0, 1,
-1.838386, -0.5476144, -1.867869, 1, 0.145098, 0, 1,
-1.835716, -0.4138859, -1.170631, 1, 0.1490196, 0, 1,
-1.821876, 0.7903543, -0.4882974, 1, 0.1568628, 0, 1,
-1.811415, 0.4520886, -1.756608, 1, 0.1607843, 0, 1,
-1.802712, -0.1542679, -2.131927, 1, 0.1686275, 0, 1,
-1.787642, 1.925589, -1.386228, 1, 0.172549, 0, 1,
-1.783704, -0.6985215, -4.0129, 1, 0.1803922, 0, 1,
-1.75418, 0.8857579, -0.9413661, 1, 0.1843137, 0, 1,
-1.751828, 0.02865481, -2.491827, 1, 0.1921569, 0, 1,
-1.747789, 0.7205963, -3.38218, 1, 0.1960784, 0, 1,
-1.745797, 0.1594686, -3.973424, 1, 0.2039216, 0, 1,
-1.726422, -0.8048746, -2.280668, 1, 0.2117647, 0, 1,
-1.701897, 0.5444955, -2.054832, 1, 0.2156863, 0, 1,
-1.689058, -0.339269, -2.424059, 1, 0.2235294, 0, 1,
-1.685189, 1.27056, -1.744588, 1, 0.227451, 0, 1,
-1.671255, -0.1736797, -1.224181, 1, 0.2352941, 0, 1,
-1.648884, 0.7786911, -0.4784573, 1, 0.2392157, 0, 1,
-1.647224, 1.841219, -1.505561, 1, 0.2470588, 0, 1,
-1.645236, 1.199449, -2.590251, 1, 0.2509804, 0, 1,
-1.63956, -0.2826813, -1.903824, 1, 0.2588235, 0, 1,
-1.637244, 1.175489, -1.186339, 1, 0.2627451, 0, 1,
-1.627595, 1.175835, 0.7182244, 1, 0.2705882, 0, 1,
-1.623548, 0.8905082, -1.339074, 1, 0.2745098, 0, 1,
-1.607044, 0.347233, -0.0223782, 1, 0.282353, 0, 1,
-1.597849, -0.6109421, -1.135083, 1, 0.2862745, 0, 1,
-1.586696, -0.07837576, -2.912938, 1, 0.2941177, 0, 1,
-1.562447, -0.6963435, -1.191605, 1, 0.3019608, 0, 1,
-1.550142, 0.3246974, -1.331362, 1, 0.3058824, 0, 1,
-1.533323, 0.469113, -1.551442, 1, 0.3137255, 0, 1,
-1.53106, 1.383572, -0.9455642, 1, 0.3176471, 0, 1,
-1.523731, -2.025467, -2.463924, 1, 0.3254902, 0, 1,
-1.523673, 0.6964458, -1.440022, 1, 0.3294118, 0, 1,
-1.51941, 0.2007552, -0.7972482, 1, 0.3372549, 0, 1,
-1.513037, 0.1024713, -1.190196, 1, 0.3411765, 0, 1,
-1.510314, 1.140751, -0.2632464, 1, 0.3490196, 0, 1,
-1.507136, -1.657303, -2.47212, 1, 0.3529412, 0, 1,
-1.500464, -1.083095, -2.102093, 1, 0.3607843, 0, 1,
-1.499857, 1.680158, -0.5704062, 1, 0.3647059, 0, 1,
-1.498287, -0.09964337, -0.9441862, 1, 0.372549, 0, 1,
-1.476243, 1.135095, 0.3655079, 1, 0.3764706, 0, 1,
-1.467712, -0.2796796, -3.553888, 1, 0.3843137, 0, 1,
-1.449116, 1.51574, -1.677176, 1, 0.3882353, 0, 1,
-1.447211, 0.4562363, 1.471641, 1, 0.3960784, 0, 1,
-1.440427, 0.8941235, -1.911326, 1, 0.4039216, 0, 1,
-1.433565, 0.5001733, -2.047514, 1, 0.4078431, 0, 1,
-1.425134, 0.8945097, 1.206636, 1, 0.4156863, 0, 1,
-1.424478, -1.222194, -3.973248, 1, 0.4196078, 0, 1,
-1.414648, 1.355614, -0.455148, 1, 0.427451, 0, 1,
-1.406046, -0.196429, -2.767617, 1, 0.4313726, 0, 1,
-1.397086, 0.589973, -1.995591, 1, 0.4392157, 0, 1,
-1.395106, 0.01335924, -1.707861, 1, 0.4431373, 0, 1,
-1.374011, -0.6038162, -0.2758458, 1, 0.4509804, 0, 1,
-1.366207, -0.773131, -2.81858, 1, 0.454902, 0, 1,
-1.353184, 0.6206878, -1.498976, 1, 0.4627451, 0, 1,
-1.353153, 0.2198889, -1.133259, 1, 0.4666667, 0, 1,
-1.34152, -0.3965338, -0.9038514, 1, 0.4745098, 0, 1,
-1.340903, -0.7957059, -1.67683, 1, 0.4784314, 0, 1,
-1.337097, -1.080186, -3.758874, 1, 0.4862745, 0, 1,
-1.336823, 0.6645386, -0.4710657, 1, 0.4901961, 0, 1,
-1.324559, 0.1006786, -0.5565774, 1, 0.4980392, 0, 1,
-1.322569, -0.1311091, -1.88777, 1, 0.5058824, 0, 1,
-1.314368, -1.143595, -4.044431, 1, 0.509804, 0, 1,
-1.311967, -3.156338, -3.378862, 1, 0.5176471, 0, 1,
-1.303486, -1.396783, -1.925121, 1, 0.5215687, 0, 1,
-1.301343, -1.308339, -5.611742, 1, 0.5294118, 0, 1,
-1.298624, -0.7694884, -1.909658, 1, 0.5333334, 0, 1,
-1.298606, -1.868559, -1.24182, 1, 0.5411765, 0, 1,
-1.285301, 0.9825194, -0.1409283, 1, 0.5450981, 0, 1,
-1.285196, 0.1064577, -1.710542, 1, 0.5529412, 0, 1,
-1.28258, -0.5618849, -1.982526, 1, 0.5568628, 0, 1,
-1.28228, 0.4565918, -0.8893921, 1, 0.5647059, 0, 1,
-1.272412, -1.153685, -1.740847, 1, 0.5686275, 0, 1,
-1.267754, 0.6074375, -0.4298273, 1, 0.5764706, 0, 1,
-1.266479, 0.814902, -1.22805, 1, 0.5803922, 0, 1,
-1.264942, 0.5692532, -1.009654, 1, 0.5882353, 0, 1,
-1.257229, 2.511642, -0.326221, 1, 0.5921569, 0, 1,
-1.243086, -0.7725425, -2.219772, 1, 0.6, 0, 1,
-1.236516, 1.182609, -0.6064644, 1, 0.6078432, 0, 1,
-1.235669, -2.012711, -2.215904, 1, 0.6117647, 0, 1,
-1.229118, 0.5686768, 0.4745791, 1, 0.6196079, 0, 1,
-1.227952, 1.250743, -2.440408, 1, 0.6235294, 0, 1,
-1.216563, -0.9804121, -2.039565, 1, 0.6313726, 0, 1,
-1.21099, -0.06023332, -1.800037, 1, 0.6352941, 0, 1,
-1.204768, -0.1986976, -2.538643, 1, 0.6431373, 0, 1,
-1.203253, -0.5002362, -2.325489, 1, 0.6470588, 0, 1,
-1.199636, -0.3728409, -1.635885, 1, 0.654902, 0, 1,
-1.193943, -0.8417493, -4.112044, 1, 0.6588235, 0, 1,
-1.180943, -0.1390495, -0.5228717, 1, 0.6666667, 0, 1,
-1.174652, -0.1501774, 0.07573879, 1, 0.6705883, 0, 1,
-1.165393, 0.1824165, 1.643769, 1, 0.6784314, 0, 1,
-1.16204, 0.05932905, 0.6216097, 1, 0.682353, 0, 1,
-1.16172, 0.8409152, -0.9167686, 1, 0.6901961, 0, 1,
-1.156905, 0.7337396, 0.6620315, 1, 0.6941177, 0, 1,
-1.154033, -0.8409098, -1.807918, 1, 0.7019608, 0, 1,
-1.153665, 0.4739327, -1.267459, 1, 0.7098039, 0, 1,
-1.152376, -0.03580729, -0.2381778, 1, 0.7137255, 0, 1,
-1.150013, 1.167228, -1.510093, 1, 0.7215686, 0, 1,
-1.149722, 0.162029, 0.1369232, 1, 0.7254902, 0, 1,
-1.13978, -1.090931, -2.076732, 1, 0.7333333, 0, 1,
-1.137457, -1.147458, -1.964125, 1, 0.7372549, 0, 1,
-1.130055, 0.6415929, -0.9106099, 1, 0.7450981, 0, 1,
-1.127132, -1.189953, -2.431161, 1, 0.7490196, 0, 1,
-1.126581, 1.005384, -2.846976, 1, 0.7568628, 0, 1,
-1.126518, 1.247977, -0.7899873, 1, 0.7607843, 0, 1,
-1.120962, -0.9146181, -4.371546, 1, 0.7686275, 0, 1,
-1.118915, -0.3017436, -1.594822, 1, 0.772549, 0, 1,
-1.118464, 0.171327, -1.730006, 1, 0.7803922, 0, 1,
-1.105471, 1.354515, -1.647624, 1, 0.7843137, 0, 1,
-1.103794, 0.8121507, 0.4025978, 1, 0.7921569, 0, 1,
-1.090693, 1.174574, 0.8184048, 1, 0.7960784, 0, 1,
-1.087036, -0.4618326, -1.973069, 1, 0.8039216, 0, 1,
-1.086882, -1.275535, -1.24761, 1, 0.8117647, 0, 1,
-1.08551, 0.2158771, -1.561964, 1, 0.8156863, 0, 1,
-1.083271, 0.5704025, -0.8681591, 1, 0.8235294, 0, 1,
-1.07612, 0.4834373, -1.465329, 1, 0.827451, 0, 1,
-1.063747, -0.2690077, -1.84923, 1, 0.8352941, 0, 1,
-1.063504, 1.224668, -0.3381053, 1, 0.8392157, 0, 1,
-1.058634, -0.18678, -1.224486, 1, 0.8470588, 0, 1,
-1.055021, -0.9479592, -3.86038, 1, 0.8509804, 0, 1,
-1.05309, 1.81948, 0.0570892, 1, 0.8588235, 0, 1,
-1.049335, -0.3508873, -3.019084, 1, 0.8627451, 0, 1,
-1.045332, -1.138914, -3.072281, 1, 0.8705882, 0, 1,
-1.04303, -0.7010761, -3.148618, 1, 0.8745098, 0, 1,
-1.036639, 1.886416, 1.119354, 1, 0.8823529, 0, 1,
-1.036566, -0.1989098, -1.616185, 1, 0.8862745, 0, 1,
-1.029637, -0.7401344, -1.12308, 1, 0.8941177, 0, 1,
-1.007714, -0.1079649, -3.428864, 1, 0.8980392, 0, 1,
-1.007695, -0.2176164, 0.9095529, 1, 0.9058824, 0, 1,
-1.007215, -0.01197559, -0.9359106, 1, 0.9137255, 0, 1,
-0.9987413, 0.5869994, -1.210194, 1, 0.9176471, 0, 1,
-0.9976745, 0.9630675, -1.212366, 1, 0.9254902, 0, 1,
-0.9945774, 0.1086995, -2.745693, 1, 0.9294118, 0, 1,
-0.9918151, -0.8153438, -1.835326, 1, 0.9372549, 0, 1,
-0.9907908, 1.39198, -2.244858, 1, 0.9411765, 0, 1,
-0.9907517, 0.1150509, -0.693562, 1, 0.9490196, 0, 1,
-0.9905857, 0.5584205, -0.6275229, 1, 0.9529412, 0, 1,
-0.9656224, 0.1361404, -0.7370555, 1, 0.9607843, 0, 1,
-0.9638891, -1.414896, -2.607805, 1, 0.9647059, 0, 1,
-0.9609611, 0.7397047, -2.325826, 1, 0.972549, 0, 1,
-0.9586276, -0.625992, -3.154914, 1, 0.9764706, 0, 1,
-0.9512881, 0.4729396, -0.1400662, 1, 0.9843137, 0, 1,
-0.9475334, -1.316691, -2.093727, 1, 0.9882353, 0, 1,
-0.9456642, 0.6933508, -0.6971483, 1, 0.9960784, 0, 1,
-0.9404113, 0.1639743, -2.561171, 0.9960784, 1, 0, 1,
-0.9376188, 1.237014, 0.5297297, 0.9921569, 1, 0, 1,
-0.9229785, 2.046821, 1.644994, 0.9843137, 1, 0, 1,
-0.913443, 0.96408, -1.534604, 0.9803922, 1, 0, 1,
-0.9027406, -0.9927857, -1.119799, 0.972549, 1, 0, 1,
-0.9023678, 2.786318, -0.2194824, 0.9686275, 1, 0, 1,
-0.8998331, 1.072132, -1.669936, 0.9607843, 1, 0, 1,
-0.8935656, -0.5231706, -3.678922, 0.9568627, 1, 0, 1,
-0.8932434, -1.760983, -4.10458, 0.9490196, 1, 0, 1,
-0.8897331, -0.07200889, -1.469346, 0.945098, 1, 0, 1,
-0.8894554, 0.6955271, -0.5894365, 0.9372549, 1, 0, 1,
-0.889002, 1.736813, -1.25123, 0.9333333, 1, 0, 1,
-0.8886782, -1.214812, -3.128651, 0.9254902, 1, 0, 1,
-0.8845237, -0.1467292, -2.126381, 0.9215686, 1, 0, 1,
-0.8838228, -1.362285, -0.9524452, 0.9137255, 1, 0, 1,
-0.8820366, -1.168912, 0.008818578, 0.9098039, 1, 0, 1,
-0.878073, -0.2814403, -0.2235763, 0.9019608, 1, 0, 1,
-0.8766759, 0.6298624, -1.04508, 0.8941177, 1, 0, 1,
-0.8738517, -0.9605947, -3.195286, 0.8901961, 1, 0, 1,
-0.8659248, 0.6270627, -0.3049817, 0.8823529, 1, 0, 1,
-0.8654517, -0.4729793, -2.143375, 0.8784314, 1, 0, 1,
-0.8640902, -0.5649487, -2.085046, 0.8705882, 1, 0, 1,
-0.8567517, 0.386282, -1.918731, 0.8666667, 1, 0, 1,
-0.8560216, -0.0627824, -1.330985, 0.8588235, 1, 0, 1,
-0.8495143, -0.5748921, -2.530461, 0.854902, 1, 0, 1,
-0.8490554, -0.207649, -3.46866, 0.8470588, 1, 0, 1,
-0.8464286, 1.58981, -0.4301451, 0.8431373, 1, 0, 1,
-0.845712, 1.385991, 0.9750747, 0.8352941, 1, 0, 1,
-0.8449571, -1.322027, -3.273445, 0.8313726, 1, 0, 1,
-0.8448415, 0.483054, -2.13843, 0.8235294, 1, 0, 1,
-0.8430572, 0.8754879, -0.3975659, 0.8196079, 1, 0, 1,
-0.8384168, -0.7454106, -3.514409, 0.8117647, 1, 0, 1,
-0.8376411, 0.8341381, -1.318044, 0.8078431, 1, 0, 1,
-0.8365405, 2.444852, -1.018549, 0.8, 1, 0, 1,
-0.8282702, 0.9479676, -2.333932, 0.7921569, 1, 0, 1,
-0.8277599, -1.311156, -2.200332, 0.7882353, 1, 0, 1,
-0.8268884, 0.4022148, -1.129861, 0.7803922, 1, 0, 1,
-0.8214141, -0.2551037, -3.084753, 0.7764706, 1, 0, 1,
-0.8199035, -0.1090281, -3.279503, 0.7686275, 1, 0, 1,
-0.8157585, -0.6298073, -1.397358, 0.7647059, 1, 0, 1,
-0.8149558, 0.9024283, -0.7193076, 0.7568628, 1, 0, 1,
-0.8117488, 0.7088917, -1.399687, 0.7529412, 1, 0, 1,
-0.8093848, -0.7795792, -2.981109, 0.7450981, 1, 0, 1,
-0.8059134, -0.8127068, -1.040702, 0.7411765, 1, 0, 1,
-0.805262, -0.5723634, -2.951709, 0.7333333, 1, 0, 1,
-0.8051624, -0.5146272, -2.233939, 0.7294118, 1, 0, 1,
-0.8050387, -0.2264313, 0.04706245, 0.7215686, 1, 0, 1,
-0.796299, -0.6224745, -3.417464, 0.7176471, 1, 0, 1,
-0.7941377, -1.305156, -3.658403, 0.7098039, 1, 0, 1,
-0.7892337, -0.7321641, -2.234883, 0.7058824, 1, 0, 1,
-0.7859543, 1.718768, 0.9086589, 0.6980392, 1, 0, 1,
-0.7847568, 0.8365061, 1.970834, 0.6901961, 1, 0, 1,
-0.7817096, -0.2913474, -1.88497, 0.6862745, 1, 0, 1,
-0.7774554, -1.766882, -0.3924705, 0.6784314, 1, 0, 1,
-0.7748917, -1.23676, -4.642951, 0.6745098, 1, 0, 1,
-0.7742778, 0.07895662, -2.308617, 0.6666667, 1, 0, 1,
-0.7737547, 3.474315, -0.04591553, 0.6627451, 1, 0, 1,
-0.7716463, 1.48595, -1.453278, 0.654902, 1, 0, 1,
-0.7683214, 0.1014319, -0.5104846, 0.6509804, 1, 0, 1,
-0.7653876, -0.8707029, -0.9099725, 0.6431373, 1, 0, 1,
-0.7642468, -0.6782625, -4.575499, 0.6392157, 1, 0, 1,
-0.7631567, 0.6198991, -0.4073493, 0.6313726, 1, 0, 1,
-0.7582996, -0.9282126, -3.307476, 0.627451, 1, 0, 1,
-0.7533646, 1.23575, 0.6803536, 0.6196079, 1, 0, 1,
-0.7510872, -0.5335639, -2.284795, 0.6156863, 1, 0, 1,
-0.7506984, -1.823401, -1.610244, 0.6078432, 1, 0, 1,
-0.7490262, -0.3668428, -0.9147532, 0.6039216, 1, 0, 1,
-0.7482948, -1.33578, -4.453441, 0.5960785, 1, 0, 1,
-0.7416854, 0.7132361, -0.6755478, 0.5882353, 1, 0, 1,
-0.7341808, 1.42045, -0.8093641, 0.5843138, 1, 0, 1,
-0.7326742, 0.9574956, -2.575937, 0.5764706, 1, 0, 1,
-0.7294633, -0.2383585, -2.074032, 0.572549, 1, 0, 1,
-0.7285078, 2.014621, -0.7975027, 0.5647059, 1, 0, 1,
-0.7241155, 1.150067, -0.251548, 0.5607843, 1, 0, 1,
-0.7231299, 0.3280669, -0.7430772, 0.5529412, 1, 0, 1,
-0.7226443, 0.9306692, -0.8882936, 0.5490196, 1, 0, 1,
-0.7128561, 1.501477, -2.016415, 0.5411765, 1, 0, 1,
-0.7085599, 2.672915, -1.143283, 0.5372549, 1, 0, 1,
-0.7073285, 0.3497803, -1.839909, 0.5294118, 1, 0, 1,
-0.7046156, -1.396811, -3.212552, 0.5254902, 1, 0, 1,
-0.7012901, -0.7355443, -1.965279, 0.5176471, 1, 0, 1,
-0.6981325, -0.2374018, -1.639443, 0.5137255, 1, 0, 1,
-0.6970302, 1.068757, 0.7821627, 0.5058824, 1, 0, 1,
-0.6939172, -1.694411, -2.131562, 0.5019608, 1, 0, 1,
-0.687198, 0.2135577, -0.4260686, 0.4941176, 1, 0, 1,
-0.6856284, 1.008795, -1.628532, 0.4862745, 1, 0, 1,
-0.6839595, 0.03952577, -2.421065, 0.4823529, 1, 0, 1,
-0.6825243, 0.7822875, 1.330423, 0.4745098, 1, 0, 1,
-0.677137, -0.4687911, -1.976338, 0.4705882, 1, 0, 1,
-0.6766797, -1.031107, -2.323023, 0.4627451, 1, 0, 1,
-0.6742772, -0.9740235, -3.883527, 0.4588235, 1, 0, 1,
-0.6726022, 0.4662506, -1.550444, 0.4509804, 1, 0, 1,
-0.6617839, -1.123546, -1.843892, 0.4470588, 1, 0, 1,
-0.6593073, -0.4380305, -1.595295, 0.4392157, 1, 0, 1,
-0.658446, -0.1690861, -0.4813868, 0.4352941, 1, 0, 1,
-0.6562448, -0.8053189, -2.723649, 0.427451, 1, 0, 1,
-0.6560178, 1.114561, -0.08307657, 0.4235294, 1, 0, 1,
-0.6545269, 0.5445474, -0.7427466, 0.4156863, 1, 0, 1,
-0.652984, -0.405733, -1.261841, 0.4117647, 1, 0, 1,
-0.6527953, 0.2292379, -1.577758, 0.4039216, 1, 0, 1,
-0.6461859, 0.05311497, -1.599261, 0.3960784, 1, 0, 1,
-0.6458082, -1.50283, -4.328246, 0.3921569, 1, 0, 1,
-0.6393677, 3.438856, -0.802182, 0.3843137, 1, 0, 1,
-0.6372133, 0.1649896, -2.652505, 0.3803922, 1, 0, 1,
-0.632054, 0.2006175, -0.7972873, 0.372549, 1, 0, 1,
-0.6280864, -0.07484846, -1.391263, 0.3686275, 1, 0, 1,
-0.6280315, -0.4002733, -1.834772, 0.3607843, 1, 0, 1,
-0.6256455, -1.580025, -4.161092, 0.3568628, 1, 0, 1,
-0.6221849, -1.613896, -0.6913168, 0.3490196, 1, 0, 1,
-0.6214119, -0.06085656, -2.498639, 0.345098, 1, 0, 1,
-0.6207383, -2.665022, -3.405788, 0.3372549, 1, 0, 1,
-0.6206498, -1.687564, -4.069429, 0.3333333, 1, 0, 1,
-0.6171337, 0.533165, 0.001022597, 0.3254902, 1, 0, 1,
-0.6124844, 0.8921852, -1.731463, 0.3215686, 1, 0, 1,
-0.6117075, 2.310777, -1.866867, 0.3137255, 1, 0, 1,
-0.6028585, 1.349084, 0.2471161, 0.3098039, 1, 0, 1,
-0.5998554, 0.03973568, 1.364031, 0.3019608, 1, 0, 1,
-0.5997853, -0.8597817, -2.414937, 0.2941177, 1, 0, 1,
-0.5987596, 0.3631904, -0.7971407, 0.2901961, 1, 0, 1,
-0.5986763, 0.03979358, -2.268214, 0.282353, 1, 0, 1,
-0.5948211, 0.09023549, -1.949016, 0.2784314, 1, 0, 1,
-0.5911957, 0.2132075, -2.254324, 0.2705882, 1, 0, 1,
-0.5901161, -1.721296, -3.696068, 0.2666667, 1, 0, 1,
-0.5860507, 2.146041, -0.9065825, 0.2588235, 1, 0, 1,
-0.5832743, -0.362667, -1.766784, 0.254902, 1, 0, 1,
-0.5764762, 0.8313624, 0.6524785, 0.2470588, 1, 0, 1,
-0.5748072, 0.8947405, -1.354191, 0.2431373, 1, 0, 1,
-0.5734309, 1.560137, -0.5147069, 0.2352941, 1, 0, 1,
-0.5708561, 0.118305, -2.528416, 0.2313726, 1, 0, 1,
-0.5635417, 0.6025552, -1.607798, 0.2235294, 1, 0, 1,
-0.5628603, -0.5388111, -1.976906, 0.2196078, 1, 0, 1,
-0.5582891, -0.5722312, -1.708896, 0.2117647, 1, 0, 1,
-0.5568973, 1.508693, -0.8672278, 0.2078431, 1, 0, 1,
-0.5527741, -0.2334679, -1.109905, 0.2, 1, 0, 1,
-0.5516187, 1.365318, 0.8274543, 0.1921569, 1, 0, 1,
-0.5484201, 1.26464, -1.167281, 0.1882353, 1, 0, 1,
-0.5401206, 0.7087308, 0.07193163, 0.1803922, 1, 0, 1,
-0.5368894, -0.1542052, -2.085268, 0.1764706, 1, 0, 1,
-0.5367803, -1.357574, -1.898314, 0.1686275, 1, 0, 1,
-0.5356222, 1.512007, -2.941902, 0.1647059, 1, 0, 1,
-0.5342765, -0.8380283, -2.699741, 0.1568628, 1, 0, 1,
-0.5263663, -0.04724341, -2.10454, 0.1529412, 1, 0, 1,
-0.5220535, -0.4540977, -3.252813, 0.145098, 1, 0, 1,
-0.5208818, -0.315547, -2.152832, 0.1411765, 1, 0, 1,
-0.5188017, 1.266208, 0.6196134, 0.1333333, 1, 0, 1,
-0.5142013, -0.3779756, -2.631229, 0.1294118, 1, 0, 1,
-0.5134313, 1.142421, -0.8289776, 0.1215686, 1, 0, 1,
-0.5105039, -0.89565, -2.773046, 0.1176471, 1, 0, 1,
-0.5070813, 0.01310361, -2.511041, 0.1098039, 1, 0, 1,
-0.5058552, -0.07549659, -0.3558147, 0.1058824, 1, 0, 1,
-0.5031365, 1.360304, 0.6162696, 0.09803922, 1, 0, 1,
-0.5009876, -0.9623286, -2.346239, 0.09019608, 1, 0, 1,
-0.496499, 0.876191, -1.046412, 0.08627451, 1, 0, 1,
-0.4962443, 0.3651465, -1.121583, 0.07843138, 1, 0, 1,
-0.4921789, 1.538386, 0.1099832, 0.07450981, 1, 0, 1,
-0.490698, 0.5531483, -2.807218, 0.06666667, 1, 0, 1,
-0.4895556, 0.06043748, -0.6127018, 0.0627451, 1, 0, 1,
-0.4857939, 0.5443141, -2.015094, 0.05490196, 1, 0, 1,
-0.4829599, -0.1501239, 0.4952995, 0.05098039, 1, 0, 1,
-0.4819432, -0.6101825, -2.627835, 0.04313726, 1, 0, 1,
-0.480765, 0.274572, -1.202228, 0.03921569, 1, 0, 1,
-0.4721675, -0.2231584, -2.034484, 0.03137255, 1, 0, 1,
-0.4686224, 0.5321373, -0.880419, 0.02745098, 1, 0, 1,
-0.4663155, -0.1174142, -2.303585, 0.01960784, 1, 0, 1,
-0.465895, 0.1520275, -0.6662971, 0.01568628, 1, 0, 1,
-0.4631541, 0.7437025, -0.5787454, 0.007843138, 1, 0, 1,
-0.4593616, -0.4884533, -2.590065, 0.003921569, 1, 0, 1,
-0.4551846, 1.554489, -0.4220723, 0, 1, 0.003921569, 1,
-0.4551213, 1.286531, 0.7978624, 0, 1, 0.01176471, 1,
-0.4545042, -0.9987605, -3.638541, 0, 1, 0.01568628, 1,
-0.4509008, -1.496656, -1.539669, 0, 1, 0.02352941, 1,
-0.4498206, -1.209389, -2.923029, 0, 1, 0.02745098, 1,
-0.4495693, -0.143736, -2.013788, 0, 1, 0.03529412, 1,
-0.4453929, -1.510767, -4.11025, 0, 1, 0.03921569, 1,
-0.442067, -0.01058095, -1.785041, 0, 1, 0.04705882, 1,
-0.4419034, 0.8924114, 0.3115754, 0, 1, 0.05098039, 1,
-0.4400169, 0.671538, 0.1802832, 0, 1, 0.05882353, 1,
-0.433464, -0.8577262, 0.0995558, 0, 1, 0.0627451, 1,
-0.4302717, 0.1014955, -1.402765, 0, 1, 0.07058824, 1,
-0.4271878, 1.087814, -1.560243, 0, 1, 0.07450981, 1,
-0.425324, 2.011061, -0.4229132, 0, 1, 0.08235294, 1,
-0.4244038, -0.6709605, -3.10544, 0, 1, 0.08627451, 1,
-0.42083, 0.9958699, 0.4002619, 0, 1, 0.09411765, 1,
-0.4199984, -0.9357443, -2.484233, 0, 1, 0.1019608, 1,
-0.4193201, 0.04352302, 0.3326518, 0, 1, 0.1058824, 1,
-0.4169171, 0.6945764, -2.872174, 0, 1, 0.1137255, 1,
-0.4169138, -0.06068302, -0.659902, 0, 1, 0.1176471, 1,
-0.4101723, -1.337908, -3.478598, 0, 1, 0.1254902, 1,
-0.4098407, 1.545271, -0.1838127, 0, 1, 0.1294118, 1,
-0.4063981, 0.3546565, -0.03778452, 0, 1, 0.1372549, 1,
-0.3925244, -1.847324, -3.250224, 0, 1, 0.1411765, 1,
-0.3916291, 0.9921945, -1.128988, 0, 1, 0.1490196, 1,
-0.3893068, -1.569144, -1.495295, 0, 1, 0.1529412, 1,
-0.3850267, -1.232752, -3.109326, 0, 1, 0.1607843, 1,
-0.383982, 0.3570524, -1.556504, 0, 1, 0.1647059, 1,
-0.3823195, 0.9631198, 0.3513766, 0, 1, 0.172549, 1,
-0.3767351, -1.573932, -3.810953, 0, 1, 0.1764706, 1,
-0.37513, -1.886237, -3.93154, 0, 1, 0.1843137, 1,
-0.3624835, 0.4406115, 0.9956112, 0, 1, 0.1882353, 1,
-0.3591056, -0.2052617, -2.378049, 0, 1, 0.1960784, 1,
-0.3560725, -0.7552624, -2.505349, 0, 1, 0.2039216, 1,
-0.3517539, -0.2136365, -2.456375, 0, 1, 0.2078431, 1,
-0.3496062, 1.624665, -1.617514, 0, 1, 0.2156863, 1,
-0.3487768, 0.8518118, 0.6843048, 0, 1, 0.2196078, 1,
-0.348764, -1.663597, -2.977645, 0, 1, 0.227451, 1,
-0.3477127, -0.05774795, -1.033046, 0, 1, 0.2313726, 1,
-0.3432958, 0.5360763, -1.30218, 0, 1, 0.2392157, 1,
-0.3415276, 0.2584344, -0.3050021, 0, 1, 0.2431373, 1,
-0.3411877, -1.218603, -1.211283, 0, 1, 0.2509804, 1,
-0.3393277, 0.2157777, -0.8794752, 0, 1, 0.254902, 1,
-0.3387003, 0.2896379, -2.127596, 0, 1, 0.2627451, 1,
-0.3367938, 0.9016535, 0.5312011, 0, 1, 0.2666667, 1,
-0.336639, -0.6755683, -2.521038, 0, 1, 0.2745098, 1,
-0.3364559, -0.2388618, -2.205448, 0, 1, 0.2784314, 1,
-0.3273378, -0.03493577, -2.021378, 0, 1, 0.2862745, 1,
-0.3260226, 0.7359277, -0.4333603, 0, 1, 0.2901961, 1,
-0.3185622, -0.00370025, -0.8685152, 0, 1, 0.2980392, 1,
-0.3101473, 0.727255, -0.2272365, 0, 1, 0.3058824, 1,
-0.3059294, -1.441637, -4.482748, 0, 1, 0.3098039, 1,
-0.3051383, -1.631478, -3.015452, 0, 1, 0.3176471, 1,
-0.30461, 0.702642, -0.8643206, 0, 1, 0.3215686, 1,
-0.3021679, -0.6350188, -3.582294, 0, 1, 0.3294118, 1,
-0.3009917, -0.625836, -2.637598, 0, 1, 0.3333333, 1,
-0.297188, -1.23291, -2.835543, 0, 1, 0.3411765, 1,
-0.2968738, -0.1161586, -2.676486, 0, 1, 0.345098, 1,
-0.2931009, -1.339737, -4.648804, 0, 1, 0.3529412, 1,
-0.292582, 0.1523029, -3.381081, 0, 1, 0.3568628, 1,
-0.2885898, -1.006592, -4.420931, 0, 1, 0.3647059, 1,
-0.2878569, -0.6932921, -4.21454, 0, 1, 0.3686275, 1,
-0.2852005, -1.277057, -0.6892883, 0, 1, 0.3764706, 1,
-0.2840653, -1.18943, -3.913641, 0, 1, 0.3803922, 1,
-0.2789395, 0.6485656, -0.9297202, 0, 1, 0.3882353, 1,
-0.2761537, 0.4697261, -0.9223821, 0, 1, 0.3921569, 1,
-0.271607, 0.605639, 0.4902462, 0, 1, 0.4, 1,
-0.2715625, 0.4543274, -0.6127061, 0, 1, 0.4078431, 1,
-0.2633385, -1.193584, -1.151398, 0, 1, 0.4117647, 1,
-0.2608287, 2.136567, -0.7648093, 0, 1, 0.4196078, 1,
-0.2603488, -1.128325, -1.176168, 0, 1, 0.4235294, 1,
-0.259658, -0.2040455, -2.85608, 0, 1, 0.4313726, 1,
-0.2576416, -0.9430181, -3.166349, 0, 1, 0.4352941, 1,
-0.2571891, 1.371563, -0.4204726, 0, 1, 0.4431373, 1,
-0.2565811, 0.2310375, -0.2088272, 0, 1, 0.4470588, 1,
-0.252572, 0.3828746, -1.700487, 0, 1, 0.454902, 1,
-0.2501189, 1.230254, -0.6081857, 0, 1, 0.4588235, 1,
-0.2500272, -0.05101437, -4.027061, 0, 1, 0.4666667, 1,
-0.2480928, 0.4230156, -0.2498878, 0, 1, 0.4705882, 1,
-0.2471204, -2.271012, -3.633679, 0, 1, 0.4784314, 1,
-0.243729, 0.3057661, -2.38418, 0, 1, 0.4823529, 1,
-0.2331685, 0.6701217, -0.6323035, 0, 1, 0.4901961, 1,
-0.231424, -1.190567, -2.499389, 0, 1, 0.4941176, 1,
-0.2269897, -2.259247, -0.743126, 0, 1, 0.5019608, 1,
-0.2253077, -0.01502939, -0.9720486, 0, 1, 0.509804, 1,
-0.2252617, 0.05508767, -1.555099, 0, 1, 0.5137255, 1,
-0.2232602, 0.259863, -0.6560085, 0, 1, 0.5215687, 1,
-0.2227279, -0.7633169, -3.890002, 0, 1, 0.5254902, 1,
-0.2224895, -1.693154, -3.975755, 0, 1, 0.5333334, 1,
-0.209067, 0.1727328, -0.7805427, 0, 1, 0.5372549, 1,
-0.2072468, 0.4009897, 0.1916201, 0, 1, 0.5450981, 1,
-0.206476, -0.2931953, -2.252843, 0, 1, 0.5490196, 1,
-0.2051369, 0.2584259, -0.8438215, 0, 1, 0.5568628, 1,
-0.2040622, 1.167421, -0.4723683, 0, 1, 0.5607843, 1,
-0.2033446, 2.572349, -1.187648, 0, 1, 0.5686275, 1,
-0.2018613, 0.3712152, -0.387098, 0, 1, 0.572549, 1,
-0.2005464, 1.419243, -0.6219613, 0, 1, 0.5803922, 1,
-0.1935957, 0.4071958, -1.679911, 0, 1, 0.5843138, 1,
-0.1931534, 1.324152, 0.07832624, 0, 1, 0.5921569, 1,
-0.1922055, 1.471206, 1.512046, 0, 1, 0.5960785, 1,
-0.1873447, 1.736105, 1.388086, 0, 1, 0.6039216, 1,
-0.1840619, 1.678242, -1.988081, 0, 1, 0.6117647, 1,
-0.1832104, 0.4981451, -0.4535657, 0, 1, 0.6156863, 1,
-0.1784382, 0.3610044, 0.1457647, 0, 1, 0.6235294, 1,
-0.1782667, -0.7133587, -3.780539, 0, 1, 0.627451, 1,
-0.1723433, -0.7423719, -4.53863, 0, 1, 0.6352941, 1,
-0.1721688, 0.0869675, -0.9042795, 0, 1, 0.6392157, 1,
-0.1710514, -0.5021479, -2.671707, 0, 1, 0.6470588, 1,
-0.1651427, 1.469326, 0.9854399, 0, 1, 0.6509804, 1,
-0.1614294, 0.4512547, -1.289335, 0, 1, 0.6588235, 1,
-0.1540788, 0.4964789, 0.8075357, 0, 1, 0.6627451, 1,
-0.1525542, -0.6795396, -2.426101, 0, 1, 0.6705883, 1,
-0.1497563, 1.253258, -0.1059261, 0, 1, 0.6745098, 1,
-0.1374087, -0.573243, -1.534017, 0, 1, 0.682353, 1,
-0.1367033, 0.2721834, -0.7663354, 0, 1, 0.6862745, 1,
-0.136263, 0.9472989, 0.9950913, 0, 1, 0.6941177, 1,
-0.136188, -0.5753985, -3.724032, 0, 1, 0.7019608, 1,
-0.1324991, -0.7284999, -1.51091, 0, 1, 0.7058824, 1,
-0.1320115, -1.033692, -2.216761, 0, 1, 0.7137255, 1,
-0.1311957, 0.8042715, -0.5032311, 0, 1, 0.7176471, 1,
-0.1292015, 0.1431334, -0.2594327, 0, 1, 0.7254902, 1,
-0.1266948, -0.4908957, -2.086586, 0, 1, 0.7294118, 1,
-0.1260324, -0.3381468, -3.078043, 0, 1, 0.7372549, 1,
-0.1242063, -0.1500914, -3.265833, 0, 1, 0.7411765, 1,
-0.1216625, 1.374557, -1.18748, 0, 1, 0.7490196, 1,
-0.1216377, -0.2623065, -3.16531, 0, 1, 0.7529412, 1,
-0.1206257, -1.052213, -2.894043, 0, 1, 0.7607843, 1,
-0.1192998, 0.7933567, -1.889536, 0, 1, 0.7647059, 1,
-0.1180782, -0.3443222, -3.304219, 0, 1, 0.772549, 1,
-0.1176871, -0.9638559, -1.672105, 0, 1, 0.7764706, 1,
-0.1167692, 1.84739, 0.2882759, 0, 1, 0.7843137, 1,
-0.1098824, 0.6978583, 0.136408, 0, 1, 0.7882353, 1,
-0.1087741, -0.2660016, -4.675992, 0, 1, 0.7960784, 1,
-0.1057029, 0.4353811, 1.290533, 0, 1, 0.8039216, 1,
-0.1047876, 0.2261427, 0.0179196, 0, 1, 0.8078431, 1,
-0.1039954, -0.3641023, -2.811802, 0, 1, 0.8156863, 1,
-0.1020998, 1.149506, -3.31363, 0, 1, 0.8196079, 1,
-0.09972624, -0.683699, -3.353483, 0, 1, 0.827451, 1,
-0.09657452, -1.228778, -2.547956, 0, 1, 0.8313726, 1,
-0.09224955, 1.982431, 0.8425831, 0, 1, 0.8392157, 1,
-0.09069633, -1.850956, -4.261021, 0, 1, 0.8431373, 1,
-0.08882491, -0.4216395, -2.74832, 0, 1, 0.8509804, 1,
-0.08781491, -0.2113891, -2.981559, 0, 1, 0.854902, 1,
-0.08684698, -0.4716855, -2.763807, 0, 1, 0.8627451, 1,
-0.08341452, -0.3361909, -3.947472, 0, 1, 0.8666667, 1,
-0.0826802, -0.4128658, -1.705515, 0, 1, 0.8745098, 1,
-0.08226168, 0.7615085, 0.05474019, 0, 1, 0.8784314, 1,
-0.08065351, -2.54554, -3.929676, 0, 1, 0.8862745, 1,
-0.07888787, 0.1198803, -0.0653816, 0, 1, 0.8901961, 1,
-0.07473049, -1.206829, -1.89026, 0, 1, 0.8980392, 1,
-0.06682965, 0.7387638, -0.4797522, 0, 1, 0.9058824, 1,
-0.06429445, -0.8296564, -0.287622, 0, 1, 0.9098039, 1,
-0.06114047, 0.3919923, -0.8622202, 0, 1, 0.9176471, 1,
-0.06082269, 0.9363958, 1.193847, 0, 1, 0.9215686, 1,
-0.06063624, 1.04893, 0.04964285, 0, 1, 0.9294118, 1,
-0.05909779, 1.039858, 0.9732733, 0, 1, 0.9333333, 1,
-0.05623718, 1.004443, -1.636088, 0, 1, 0.9411765, 1,
-0.04863818, -1.389467, -3.365473, 0, 1, 0.945098, 1,
-0.04846319, 1.935902, 0.7476897, 0, 1, 0.9529412, 1,
-0.03891077, -0.006725639, -1.086346, 0, 1, 0.9568627, 1,
-0.0384724, -1.545908, -3.149941, 0, 1, 0.9647059, 1,
-0.03809757, 0.8234982, 1.586208, 0, 1, 0.9686275, 1,
-0.03664042, -0.6336921, -3.230345, 0, 1, 0.9764706, 1,
-0.02956886, 0.305373, 0.9808326, 0, 1, 0.9803922, 1,
-0.02420209, 0.3198376, 0.3988714, 0, 1, 0.9882353, 1,
-0.02339748, 0.3179656, 1.505649, 0, 1, 0.9921569, 1,
-0.01793023, -0.2506347, -3.494228, 0, 1, 1, 1,
-0.01252789, 0.8468896, 0.1053723, 0, 0.9921569, 1, 1,
-0.01213357, -0.1178347, -2.006188, 0, 0.9882353, 1, 1,
-0.006449388, -1.224621, -5.023125, 0, 0.9803922, 1, 1,
0.0003907649, 0.2177234, -1.629704, 0, 0.9764706, 1, 1,
0.001327637, 0.7511272, 0.7341999, 0, 0.9686275, 1, 1,
0.008345647, 0.3013078, 0.05984987, 0, 0.9647059, 1, 1,
0.01290884, 0.6888488, -0.48977, 0, 0.9568627, 1, 1,
0.01780997, 0.3724053, 1.420928, 0, 0.9529412, 1, 1,
0.01825555, -0.3177172, 2.697521, 0, 0.945098, 1, 1,
0.02014995, -0.8466619, 1.906602, 0, 0.9411765, 1, 1,
0.02171682, -0.2156564, 3.276842, 0, 0.9333333, 1, 1,
0.02577593, -0.320285, 3.023917, 0, 0.9294118, 1, 1,
0.02778731, -0.7631865, 3.189238, 0, 0.9215686, 1, 1,
0.02870756, -1.697321, 3.534867, 0, 0.9176471, 1, 1,
0.02912655, -0.4257542, 3.388066, 0, 0.9098039, 1, 1,
0.02981634, 1.526636, 1.100085, 0, 0.9058824, 1, 1,
0.036422, -1.281653, 4.438879, 0, 0.8980392, 1, 1,
0.03855953, 0.7028194, 0.3682672, 0, 0.8901961, 1, 1,
0.03864659, 1.511672, -0.7244501, 0, 0.8862745, 1, 1,
0.04074916, -1.339716, 0.7452207, 0, 0.8784314, 1, 1,
0.04315162, -0.01462832, 3.603543, 0, 0.8745098, 1, 1,
0.04456576, 1.80187, 1.045534, 0, 0.8666667, 1, 1,
0.04561453, 1.413656, -1.568821, 0, 0.8627451, 1, 1,
0.04571402, 1.906608, 1.200231, 0, 0.854902, 1, 1,
0.0462024, 0.7374289, -0.1360365, 0, 0.8509804, 1, 1,
0.05116352, 1.02053, 0.5354259, 0, 0.8431373, 1, 1,
0.05497136, -0.5433667, 4.006105, 0, 0.8392157, 1, 1,
0.0553367, 1.423304, 0.09943771, 0, 0.8313726, 1, 1,
0.05677911, 0.2653079, 0.6636912, 0, 0.827451, 1, 1,
0.05801339, 0.5692206, -0.6378216, 0, 0.8196079, 1, 1,
0.05822608, 0.01190941, -0.07222804, 0, 0.8156863, 1, 1,
0.06213302, 0.4257451, 0.5940078, 0, 0.8078431, 1, 1,
0.0786633, -0.3075572, 1.464549, 0, 0.8039216, 1, 1,
0.08354936, -0.2576765, 3.596156, 0, 0.7960784, 1, 1,
0.08408903, 0.8801959, 1.217186, 0, 0.7882353, 1, 1,
0.08411666, -0.5196408, 3.237134, 0, 0.7843137, 1, 1,
0.08490886, -0.2075562, 2.805319, 0, 0.7764706, 1, 1,
0.08491981, 1.327245, 0.8074918, 0, 0.772549, 1, 1,
0.08804325, -0.05294362, 2.703246, 0, 0.7647059, 1, 1,
0.09067346, 0.4886538, -0.193671, 0, 0.7607843, 1, 1,
0.09218457, -2.057782, 2.918783, 0, 0.7529412, 1, 1,
0.09784296, -1.427907, 2.74274, 0, 0.7490196, 1, 1,
0.09839626, -0.07990945, 0.9251395, 0, 0.7411765, 1, 1,
0.1030908, 1.310035, 0.8181505, 0, 0.7372549, 1, 1,
0.1155924, 0.4058031, -1.027848, 0, 0.7294118, 1, 1,
0.1166383, 0.3541994, 0.8987523, 0, 0.7254902, 1, 1,
0.1215498, -0.6955009, 2.38958, 0, 0.7176471, 1, 1,
0.1219623, -0.5444248, 2.425354, 0, 0.7137255, 1, 1,
0.124002, -0.06765074, 2.997753, 0, 0.7058824, 1, 1,
0.1261263, -1.295445, 3.002787, 0, 0.6980392, 1, 1,
0.1276956, 0.1739775, 0.1177218, 0, 0.6941177, 1, 1,
0.1311615, -1.207197, 1.909823, 0, 0.6862745, 1, 1,
0.133719, 1.31053, 2.597725, 0, 0.682353, 1, 1,
0.1352525, -0.750558, 4.120011, 0, 0.6745098, 1, 1,
0.1359567, 0.3907827, 1.213127, 0, 0.6705883, 1, 1,
0.1400311, -0.5692564, 1.787724, 0, 0.6627451, 1, 1,
0.1481244, -1.417981, 2.422728, 0, 0.6588235, 1, 1,
0.1484369, 1.138828, 0.2709785, 0, 0.6509804, 1, 1,
0.1527407, 1.51903, -0.1672579, 0, 0.6470588, 1, 1,
0.1565809, 0.05137282, 2.109425, 0, 0.6392157, 1, 1,
0.1617243, 0.01242925, 1.317133, 0, 0.6352941, 1, 1,
0.1619721, 0.05214191, 2.340571, 0, 0.627451, 1, 1,
0.1653149, 0.8430074, -0.3796977, 0, 0.6235294, 1, 1,
0.1668594, 1.332637, 0.853358, 0, 0.6156863, 1, 1,
0.1687379, -0.3487279, 2.11504, 0, 0.6117647, 1, 1,
0.1719172, 0.05876756, -0.2044774, 0, 0.6039216, 1, 1,
0.1725826, 1.681477, 0.6451991, 0, 0.5960785, 1, 1,
0.1775961, 0.3970024, -0.19949, 0, 0.5921569, 1, 1,
0.1781573, -1.014969, 3.580438, 0, 0.5843138, 1, 1,
0.1795208, 0.5926403, 1.353255, 0, 0.5803922, 1, 1,
0.1811337, 0.3100395, 1.129162, 0, 0.572549, 1, 1,
0.1814693, -0.3443441, 3.790001, 0, 0.5686275, 1, 1,
0.1819216, -1.393779, 1.760925, 0, 0.5607843, 1, 1,
0.1822705, -0.4032482, 3.171972, 0, 0.5568628, 1, 1,
0.1917121, 1.515556, 1.353986, 0, 0.5490196, 1, 1,
0.1931852, -0.4257946, 2.947731, 0, 0.5450981, 1, 1,
0.2087516, -0.06699847, 2.475357, 0, 0.5372549, 1, 1,
0.2088946, 0.3007342, -0.4753883, 0, 0.5333334, 1, 1,
0.2119132, 0.002960042, -0.1796438, 0, 0.5254902, 1, 1,
0.2138287, -0.9505065, 2.25791, 0, 0.5215687, 1, 1,
0.2159233, -0.9174162, 2.999328, 0, 0.5137255, 1, 1,
0.2170676, 0.6572499, 0.8541282, 0, 0.509804, 1, 1,
0.2179045, 1.603331, 0.6831343, 0, 0.5019608, 1, 1,
0.2233998, 1.366509, -0.4239716, 0, 0.4941176, 1, 1,
0.224592, -0.1561282, 2.380498, 0, 0.4901961, 1, 1,
0.2248702, -2.909557, 1.556725, 0, 0.4823529, 1, 1,
0.2262787, 0.9097068, -0.4858176, 0, 0.4784314, 1, 1,
0.2266648, -1.746487, 2.472143, 0, 0.4705882, 1, 1,
0.2323231, -0.4375279, 1.985664, 0, 0.4666667, 1, 1,
0.2342044, 1.413216, 0.053253, 0, 0.4588235, 1, 1,
0.2353514, -0.2238025, 1.954176, 0, 0.454902, 1, 1,
0.237292, -0.975701, 1.837952, 0, 0.4470588, 1, 1,
0.2376876, -0.4414596, 4.120466, 0, 0.4431373, 1, 1,
0.24433, 0.8667455, -2.338377, 0, 0.4352941, 1, 1,
0.2464036, -1.135335, 3.423353, 0, 0.4313726, 1, 1,
0.2478911, 1.013022, -1.363711, 0, 0.4235294, 1, 1,
0.2489036, -0.178552, 0.3578626, 0, 0.4196078, 1, 1,
0.2502003, 0.7434599, 0.5752807, 0, 0.4117647, 1, 1,
0.2521484, -1.376643, 3.270604, 0, 0.4078431, 1, 1,
0.2563636, 0.2907367, -0.09082417, 0, 0.4, 1, 1,
0.2591035, 1.149949, -1.446311, 0, 0.3921569, 1, 1,
0.2654649, -1.459321, 3.165456, 0, 0.3882353, 1, 1,
0.2682976, 1.266307, 1.47058, 0, 0.3803922, 1, 1,
0.2691487, -0.1264713, 3.258249, 0, 0.3764706, 1, 1,
0.2722333, 0.7767473, 1.774552, 0, 0.3686275, 1, 1,
0.2733592, -0.8302748, 0.5618583, 0, 0.3647059, 1, 1,
0.2760247, -0.4596429, 2.676191, 0, 0.3568628, 1, 1,
0.278002, 0.3869575, -0.03555703, 0, 0.3529412, 1, 1,
0.2790493, -1.461303, 3.920756, 0, 0.345098, 1, 1,
0.2824678, -0.7676178, 0.1873227, 0, 0.3411765, 1, 1,
0.2873706, -1.419634, 2.745455, 0, 0.3333333, 1, 1,
0.2919367, -0.9885825, 3.289716, 0, 0.3294118, 1, 1,
0.2929654, 0.07343671, 2.418632, 0, 0.3215686, 1, 1,
0.2957709, -0.2034182, 1.937226, 0, 0.3176471, 1, 1,
0.2959538, 1.475735, -0.6645743, 0, 0.3098039, 1, 1,
0.3007545, -0.6524613, 1.028981, 0, 0.3058824, 1, 1,
0.3010241, -0.06992628, 0.5657584, 0, 0.2980392, 1, 1,
0.3017567, -1.210417, 1.967246, 0, 0.2901961, 1, 1,
0.3034911, -0.04816564, 2.366596, 0, 0.2862745, 1, 1,
0.3057785, 0.1451671, 2.11704, 0, 0.2784314, 1, 1,
0.3067798, 1.258293, 1.269701, 0, 0.2745098, 1, 1,
0.3086222, 0.1718805, 1.669184, 0, 0.2666667, 1, 1,
0.3092416, 1.297875, -0.4443404, 0, 0.2627451, 1, 1,
0.3095464, 0.1275147, 1.821546, 0, 0.254902, 1, 1,
0.3104021, 1.730608, 0.00799366, 0, 0.2509804, 1, 1,
0.3131573, -1.001595, 3.013366, 0, 0.2431373, 1, 1,
0.3150854, -1.857525, 2.742534, 0, 0.2392157, 1, 1,
0.3184948, 0.6024067, 0.2759745, 0, 0.2313726, 1, 1,
0.3261522, -0.4675639, 2.47113, 0, 0.227451, 1, 1,
0.3268379, -0.6927046, 3.016217, 0, 0.2196078, 1, 1,
0.3272535, 0.8251194, -0.6387509, 0, 0.2156863, 1, 1,
0.3297513, 0.7564659, 0.4827702, 0, 0.2078431, 1, 1,
0.3307363, 1.340528, -1.115191, 0, 0.2039216, 1, 1,
0.3338831, -2.171158, 0.4216324, 0, 0.1960784, 1, 1,
0.3388955, 0.4191048, 0.7266772, 0, 0.1882353, 1, 1,
0.3422835, 0.02663658, 0.4635381, 0, 0.1843137, 1, 1,
0.3426304, 1.122101, 1.153797, 0, 0.1764706, 1, 1,
0.3463462, 2.515534, -0.1110164, 0, 0.172549, 1, 1,
0.3467715, -0.3685214, 2.479465, 0, 0.1647059, 1, 1,
0.3524632, 0.428804, 1.079829, 0, 0.1607843, 1, 1,
0.3529876, -1.200959, 3.31964, 0, 0.1529412, 1, 1,
0.3542892, 0.1436593, 1.739698, 0, 0.1490196, 1, 1,
0.3558565, 0.68825, 0.5791784, 0, 0.1411765, 1, 1,
0.3627898, 0.4199056, 0.2985266, 0, 0.1372549, 1, 1,
0.3665236, -0.9394483, 2.615844, 0, 0.1294118, 1, 1,
0.3680091, 2.753491, 0.5053619, 0, 0.1254902, 1, 1,
0.3713035, -1.708265, 2.740041, 0, 0.1176471, 1, 1,
0.3720564, -1.410852, 3.615984, 0, 0.1137255, 1, 1,
0.3722902, 1.844026, 0.3920928, 0, 0.1058824, 1, 1,
0.3744904, 0.4630859, 1.666916, 0, 0.09803922, 1, 1,
0.3787346, -0.3560896, 2.967985, 0, 0.09411765, 1, 1,
0.3796887, 0.9887946, 1.851849, 0, 0.08627451, 1, 1,
0.3806582, -0.585464, 3.867274, 0, 0.08235294, 1, 1,
0.3825022, -0.7088524, 1.192194, 0, 0.07450981, 1, 1,
0.3838907, 0.8701452, 0.7496388, 0, 0.07058824, 1, 1,
0.3839561, -1.023335, 4.360699, 0, 0.0627451, 1, 1,
0.3862972, 0.09599254, 0.2215732, 0, 0.05882353, 1, 1,
0.3912642, -2.130741, 3.494285, 0, 0.05098039, 1, 1,
0.3913672, -0.6899921, 1.134783, 0, 0.04705882, 1, 1,
0.3914481, 0.9870211, 0.04529228, 0, 0.03921569, 1, 1,
0.3922555, -1.908485, 1.569638, 0, 0.03529412, 1, 1,
0.3946722, -0.6522617, 2.439994, 0, 0.02745098, 1, 1,
0.4044728, -0.835849, 4.250914, 0, 0.02352941, 1, 1,
0.4078405, 0.5975043, -0.2440039, 0, 0.01568628, 1, 1,
0.4078889, -0.7025788, 0.7290517, 0, 0.01176471, 1, 1,
0.4219021, 1.28251, -1.39875, 0, 0.003921569, 1, 1,
0.4254158, -1.790732, 2.948678, 0.003921569, 0, 1, 1,
0.4261264, 0.4181054, -0.9927421, 0.007843138, 0, 1, 1,
0.4360184, 0.2381604, 0.0955449, 0.01568628, 0, 1, 1,
0.4384799, -0.2599361, 2.603769, 0.01960784, 0, 1, 1,
0.4400561, -0.1684477, 1.982172, 0.02745098, 0, 1, 1,
0.4402814, -0.6295964, 2.172408, 0.03137255, 0, 1, 1,
0.4426222, 0.8966725, 0.9786397, 0.03921569, 0, 1, 1,
0.4428646, 2.002348, -1.474874, 0.04313726, 0, 1, 1,
0.4433686, 1.325146, 0.9366014, 0.05098039, 0, 1, 1,
0.4446482, 0.4094753, 1.037267, 0.05490196, 0, 1, 1,
0.4526654, 0.07352404, 3.172072, 0.0627451, 0, 1, 1,
0.4533495, 0.2154301, 1.578342, 0.06666667, 0, 1, 1,
0.4533942, -0.1527943, 2.07115, 0.07450981, 0, 1, 1,
0.4580153, -1.194581, 2.435335, 0.07843138, 0, 1, 1,
0.4614767, 0.549346, 0.3847367, 0.08627451, 0, 1, 1,
0.4644259, 0.3832904, 1.022057, 0.09019608, 0, 1, 1,
0.465504, 1.138608, 1.200402, 0.09803922, 0, 1, 1,
0.4682852, 0.2747704, 1.250498, 0.1058824, 0, 1, 1,
0.4702055, 0.8271343, 0.7470974, 0.1098039, 0, 1, 1,
0.4743294, 0.536408, 0.7539355, 0.1176471, 0, 1, 1,
0.4749806, -2.650722, 4.079071, 0.1215686, 0, 1, 1,
0.4796317, 1.985852, -1.065208, 0.1294118, 0, 1, 1,
0.4938725, 1.185122, 0.7562508, 0.1333333, 0, 1, 1,
0.5003321, -1.626307, 2.374223, 0.1411765, 0, 1, 1,
0.503027, 1.881376, -0.4710135, 0.145098, 0, 1, 1,
0.5044954, -0.8148859, 1.420335, 0.1529412, 0, 1, 1,
0.5057781, -0.8385431, 3.350112, 0.1568628, 0, 1, 1,
0.5097881, -1.471119, 2.718113, 0.1647059, 0, 1, 1,
0.5166915, -0.4182275, 3.031626, 0.1686275, 0, 1, 1,
0.5179985, 0.232119, 1.230469, 0.1764706, 0, 1, 1,
0.5202072, -0.7232721, 2.146423, 0.1803922, 0, 1, 1,
0.5204791, 0.4536408, -0.8398459, 0.1882353, 0, 1, 1,
0.5248402, -1.62971, 2.86422, 0.1921569, 0, 1, 1,
0.5253868, 0.6245838, 0.05124694, 0.2, 0, 1, 1,
0.5300431, 1.378642, 1.238074, 0.2078431, 0, 1, 1,
0.5303631, -1.832283, 2.42626, 0.2117647, 0, 1, 1,
0.5310367, 0.6655139, 1.214758, 0.2196078, 0, 1, 1,
0.5324661, 0.6506209, -0.1173516, 0.2235294, 0, 1, 1,
0.5341586, -1.279207, 3.797791, 0.2313726, 0, 1, 1,
0.5356416, -0.1423945, 2.269875, 0.2352941, 0, 1, 1,
0.5380338, 1.571767, -0.3552849, 0.2431373, 0, 1, 1,
0.548413, -0.1818128, 1.244436, 0.2470588, 0, 1, 1,
0.5510492, 0.9927711, 1.028959, 0.254902, 0, 1, 1,
0.5518734, -0.3826091, 2.109854, 0.2588235, 0, 1, 1,
0.5553637, -0.6371486, 1.371814, 0.2666667, 0, 1, 1,
0.5569983, 0.1991845, -0.3500639, 0.2705882, 0, 1, 1,
0.5626174, -1.128943, 3.249154, 0.2784314, 0, 1, 1,
0.5629521, -0.2438994, 3.072737, 0.282353, 0, 1, 1,
0.5657398, -0.715076, 2.435549, 0.2901961, 0, 1, 1,
0.5658673, -1.240181, 2.137071, 0.2941177, 0, 1, 1,
0.5677302, 0.3401854, 1.559967, 0.3019608, 0, 1, 1,
0.5719774, 0.6445454, 1.224775, 0.3098039, 0, 1, 1,
0.5774, -0.1045502, 2.085298, 0.3137255, 0, 1, 1,
0.5795142, 0.1872265, 0.06197929, 0.3215686, 0, 1, 1,
0.5806519, -1.506736, 3.247104, 0.3254902, 0, 1, 1,
0.5827924, 1.428868, -0.1356604, 0.3333333, 0, 1, 1,
0.5837798, 0.8316323, 0.786866, 0.3372549, 0, 1, 1,
0.5859336, 1.047844, 1.283288, 0.345098, 0, 1, 1,
0.5863206, -1.234249, 2.66295, 0.3490196, 0, 1, 1,
0.5866174, -1.455178, 3.837135, 0.3568628, 0, 1, 1,
0.5907901, -0.6202185, 3.026815, 0.3607843, 0, 1, 1,
0.5955622, 1.638526, 0.2596761, 0.3686275, 0, 1, 1,
0.5978558, 0.8947673, 0.1416387, 0.372549, 0, 1, 1,
0.6168074, -1.950007, 0.6302181, 0.3803922, 0, 1, 1,
0.6178673, 0.09645292, 1.149318, 0.3843137, 0, 1, 1,
0.6217681, -0.8204103, 1.14491, 0.3921569, 0, 1, 1,
0.6231062, 0.5065464, 2.072622, 0.3960784, 0, 1, 1,
0.6238887, -1.02103, 2.336902, 0.4039216, 0, 1, 1,
0.6335169, 0.6040236, 0.4888116, 0.4117647, 0, 1, 1,
0.6349548, -0.2563941, 1.363276, 0.4156863, 0, 1, 1,
0.6404169, 0.6415815, -0.8046849, 0.4235294, 0, 1, 1,
0.6421055, 0.7819164, -0.3970402, 0.427451, 0, 1, 1,
0.6421264, 0.08789688, 1.124456, 0.4352941, 0, 1, 1,
0.6432604, 0.1371447, -0.7586488, 0.4392157, 0, 1, 1,
0.650645, 1.545772, 0.7180935, 0.4470588, 0, 1, 1,
0.6527711, 1.822146, 0.5909822, 0.4509804, 0, 1, 1,
0.6527902, 0.5249642, 0.09901027, 0.4588235, 0, 1, 1,
0.654545, 0.06164403, 2.011608, 0.4627451, 0, 1, 1,
0.6588645, 0.1553846, 0.9552367, 0.4705882, 0, 1, 1,
0.6602774, -1.328629, 3.565463, 0.4745098, 0, 1, 1,
0.6604831, 0.1626829, 1.495576, 0.4823529, 0, 1, 1,
0.6612899, 0.05864066, 1.164013, 0.4862745, 0, 1, 1,
0.6649559, 0.1832366, -0.234417, 0.4941176, 0, 1, 1,
0.665707, 1.066706, -0.2236861, 0.5019608, 0, 1, 1,
0.6682249, -0.894926, 1.97429, 0.5058824, 0, 1, 1,
0.6710159, -0.1524557, 0.8954796, 0.5137255, 0, 1, 1,
0.6718526, 0.7270099, 1.238463, 0.5176471, 0, 1, 1,
0.6767343, -0.9367439, 1.027854, 0.5254902, 0, 1, 1,
0.6831706, 0.6546462, 1.144498, 0.5294118, 0, 1, 1,
0.6847879, -1.048967, 2.34533, 0.5372549, 0, 1, 1,
0.6916907, 1.639477, -0.8330579, 0.5411765, 0, 1, 1,
0.6941355, -0.6687173, 3.147571, 0.5490196, 0, 1, 1,
0.6990478, -0.244622, 2.644668, 0.5529412, 0, 1, 1,
0.7044486, -0.5250695, 2.653177, 0.5607843, 0, 1, 1,
0.7059133, 0.29258, 0.7992554, 0.5647059, 0, 1, 1,
0.7071937, 0.1598139, 0.37479, 0.572549, 0, 1, 1,
0.7094809, 1.435213, 0.8122134, 0.5764706, 0, 1, 1,
0.7099172, -0.8085694, 1.681589, 0.5843138, 0, 1, 1,
0.714554, -1.243664, 3.720449, 0.5882353, 0, 1, 1,
0.7146963, 0.8087183, 2.755042, 0.5960785, 0, 1, 1,
0.7193959, -2.229901, 1.541793, 0.6039216, 0, 1, 1,
0.7212485, 0.3317685, 1.053359, 0.6078432, 0, 1, 1,
0.7218819, 1.042769, 2.471418, 0.6156863, 0, 1, 1,
0.7264754, -0.4717767, 2.081343, 0.6196079, 0, 1, 1,
0.72843, 1.012871, 0.3496478, 0.627451, 0, 1, 1,
0.7345217, 0.7853831, -1.356201, 0.6313726, 0, 1, 1,
0.7346179, 0.4925693, 1.450219, 0.6392157, 0, 1, 1,
0.7351222, -0.1850562, 2.375648, 0.6431373, 0, 1, 1,
0.7409812, -1.078704, 4.11031, 0.6509804, 0, 1, 1,
0.7415128, 1.154891, -0.320888, 0.654902, 0, 1, 1,
0.7475041, -0.7506914, 1.117759, 0.6627451, 0, 1, 1,
0.7480232, -0.144711, 2.494961, 0.6666667, 0, 1, 1,
0.7518138, 0.2320639, 2.89285, 0.6745098, 0, 1, 1,
0.7527128, -0.3914323, 1.779759, 0.6784314, 0, 1, 1,
0.7554584, 1.077379, -0.5178275, 0.6862745, 0, 1, 1,
0.7574623, -0.6343002, 3.418427, 0.6901961, 0, 1, 1,
0.7714544, 0.02833637, 1.513993, 0.6980392, 0, 1, 1,
0.7716002, -0.8032648, 2.827738, 0.7058824, 0, 1, 1,
0.7719603, -0.7662885, 2.351771, 0.7098039, 0, 1, 1,
0.7790212, -1.111292, 4.540068, 0.7176471, 0, 1, 1,
0.7790304, 2.030821, 0.5731764, 0.7215686, 0, 1, 1,
0.7792587, -0.3252249, 3.488065, 0.7294118, 0, 1, 1,
0.7797528, 0.814204, 0.5511002, 0.7333333, 0, 1, 1,
0.7800687, 0.7871873, 1.559398, 0.7411765, 0, 1, 1,
0.7913779, -0.8753279, 1.658913, 0.7450981, 0, 1, 1,
0.7983739, -1.503225, 2.839531, 0.7529412, 0, 1, 1,
0.8061834, -1.706459, 1.826527, 0.7568628, 0, 1, 1,
0.8100123, -0.3835308, 0.8504589, 0.7647059, 0, 1, 1,
0.8117344, -1.664264, 2.523042, 0.7686275, 0, 1, 1,
0.8194089, -0.2280225, 2.290334, 0.7764706, 0, 1, 1,
0.820541, 0.5066499, 0.9222934, 0.7803922, 0, 1, 1,
0.8212079, 1.931091, -0.1744152, 0.7882353, 0, 1, 1,
0.824481, -0.8893539, 1.988218, 0.7921569, 0, 1, 1,
0.830102, -1.386771, 2.258113, 0.8, 0, 1, 1,
0.833589, -0.3823317, 2.744897, 0.8078431, 0, 1, 1,
0.8339195, 0.1215441, 1.238818, 0.8117647, 0, 1, 1,
0.8354604, -1.467612, 3.288216, 0.8196079, 0, 1, 1,
0.8409074, 0.9848696, 1.757967, 0.8235294, 0, 1, 1,
0.8411237, 1.382141, 2.218166, 0.8313726, 0, 1, 1,
0.8518061, 0.9175941, 1.759603, 0.8352941, 0, 1, 1,
0.8519249, 0.6451018, 2.840436, 0.8431373, 0, 1, 1,
0.8577888, -2.663232, 2.942082, 0.8470588, 0, 1, 1,
0.8714604, -0.09707578, 2.478423, 0.854902, 0, 1, 1,
0.8748618, 0.793398, 0.693942, 0.8588235, 0, 1, 1,
0.8759629, 0.6146412, 1.541887, 0.8666667, 0, 1, 1,
0.8777939, -0.08422764, 1.26475, 0.8705882, 0, 1, 1,
0.8801743, -0.02712434, 2.758033, 0.8784314, 0, 1, 1,
0.8868178, 0.1235324, 2.570824, 0.8823529, 0, 1, 1,
0.8892586, 0.142571, 2.320294, 0.8901961, 0, 1, 1,
0.8892719, -0.9095119, 3.126001, 0.8941177, 0, 1, 1,
0.8893886, 0.5062612, 0.05749011, 0.9019608, 0, 1, 1,
0.8923208, 0.2430898, 2.580772, 0.9098039, 0, 1, 1,
0.8970466, -0.4854008, 2.924941, 0.9137255, 0, 1, 1,
0.9007993, -0.8138628, -0.2884598, 0.9215686, 0, 1, 1,
0.9059587, 0.1307056, 1.971255, 0.9254902, 0, 1, 1,
0.9146246, -0.2284544, 2.999752, 0.9333333, 0, 1, 1,
0.918103, 0.9055998, 1.126477, 0.9372549, 0, 1, 1,
0.9193271, -1.597084, 4.542319, 0.945098, 0, 1, 1,
0.9205238, 1.338782, -0.1314591, 0.9490196, 0, 1, 1,
0.9258291, -0.2660562, 2.205693, 0.9568627, 0, 1, 1,
0.9258621, 0.3710445, 1.12728, 0.9607843, 0, 1, 1,
0.926245, -0.3546694, 1.595688, 0.9686275, 0, 1, 1,
0.9266024, 0.5328841, 0.9102558, 0.972549, 0, 1, 1,
0.9292697, -1.013019, 3.692441, 0.9803922, 0, 1, 1,
0.9298453, -1.556381, 3.685936, 0.9843137, 0, 1, 1,
0.9392105, 1.019949, -1.829336, 0.9921569, 0, 1, 1,
0.9408281, 1.244629, 1.327453, 0.9960784, 0, 1, 1,
0.9408854, -0.1612714, 0.00997428, 1, 0, 0.9960784, 1,
0.9416574, 0.05645335, 2.107667, 1, 0, 0.9882353, 1,
0.9449858, -0.025509, 3.403997, 1, 0, 0.9843137, 1,
0.9530969, -0.7648667, 3.76839, 1, 0, 0.9764706, 1,
0.9552191, 1.397006, 2.028544, 1, 0, 0.972549, 1,
0.9618354, -0.2020312, 1.985108, 1, 0, 0.9647059, 1,
0.966284, 0.03459534, 0.7677346, 1, 0, 0.9607843, 1,
0.9684147, 0.605297, -0.3809657, 1, 0, 0.9529412, 1,
0.9697961, -0.4936165, 2.776993, 1, 0, 0.9490196, 1,
0.9702648, 0.9602821, 1.419237, 1, 0, 0.9411765, 1,
0.9746104, 0.05517583, 1.699375, 1, 0, 0.9372549, 1,
0.9753343, -0.9744098, 1.465741, 1, 0, 0.9294118, 1,
0.9772334, -0.2868397, 0.51985, 1, 0, 0.9254902, 1,
0.9817684, 0.4826118, 1.766992, 1, 0, 0.9176471, 1,
0.984386, -1.089203, 2.246909, 1, 0, 0.9137255, 1,
0.9868584, 0.02597684, -0.1511189, 1, 0, 0.9058824, 1,
0.9896842, 0.285724, -0.09858481, 1, 0, 0.9019608, 1,
0.9915834, 0.9389396, 1.157167, 1, 0, 0.8941177, 1,
0.994143, -0.432233, 2.427344, 1, 0, 0.8862745, 1,
1.001152, -0.1052323, 2.45227, 1, 0, 0.8823529, 1,
1.001277, 0.4841753, -0.3010789, 1, 0, 0.8745098, 1,
1.009086, -0.7731829, 2.876298, 1, 0, 0.8705882, 1,
1.010263, -0.2114176, 0.6503317, 1, 0, 0.8627451, 1,
1.023189, 0.7497182, -0.2113783, 1, 0, 0.8588235, 1,
1.026736, -0.8669844, 4.072645, 1, 0, 0.8509804, 1,
1.029583, -1.468841, 2.206576, 1, 0, 0.8470588, 1,
1.038511, -0.7073674, 3.769108, 1, 0, 0.8392157, 1,
1.046844, -0.4221407, 0.111947, 1, 0, 0.8352941, 1,
1.048012, -0.06977655, 0.9517335, 1, 0, 0.827451, 1,
1.050404, -1.407846, 2.800778, 1, 0, 0.8235294, 1,
1.052113, -0.2817011, 2.304099, 1, 0, 0.8156863, 1,
1.052736, 1.119913, 1.101964, 1, 0, 0.8117647, 1,
1.053833, -1.65479, 2.721684, 1, 0, 0.8039216, 1,
1.059086, 0.2587174, -0.6676946, 1, 0, 0.7960784, 1,
1.061592, 0.09652867, -0.2037653, 1, 0, 0.7921569, 1,
1.061757, -0.1848384, 2.714789, 1, 0, 0.7843137, 1,
1.065209, 0.2466835, 0.7796754, 1, 0, 0.7803922, 1,
1.068933, 0.5367979, 0.3214855, 1, 0, 0.772549, 1,
1.073895, 1.733854, 0.9087299, 1, 0, 0.7686275, 1,
1.079912, -0.04167679, 2.168054, 1, 0, 0.7607843, 1,
1.088112, -0.622483, 2.169679, 1, 0, 0.7568628, 1,
1.099739, 0.2860943, -1.070081, 1, 0, 0.7490196, 1,
1.103531, 0.1579167, 0.6390141, 1, 0, 0.7450981, 1,
1.108161, -0.6533923, 2.691252, 1, 0, 0.7372549, 1,
1.111738, 0.1943319, 1.357591, 1, 0, 0.7333333, 1,
1.113437, -0.0391525, 0.7903093, 1, 0, 0.7254902, 1,
1.119178, 0.3502924, 2.427002, 1, 0, 0.7215686, 1,
1.11944, 2.494945, 0.4749382, 1, 0, 0.7137255, 1,
1.119498, 0.1807455, 0.3848162, 1, 0, 0.7098039, 1,
1.121877, 0.4366135, 0.9575318, 1, 0, 0.7019608, 1,
1.122104, -0.2887936, 1.928207, 1, 0, 0.6941177, 1,
1.12228, -0.6139108, 1.463553, 1, 0, 0.6901961, 1,
1.128534, -0.1715074, 1.041421, 1, 0, 0.682353, 1,
1.12974, -0.7009107, 1.915315, 1, 0, 0.6784314, 1,
1.137431, -0.114177, 3.091485, 1, 0, 0.6705883, 1,
1.170682, -0.8534709, 3.976802, 1, 0, 0.6666667, 1,
1.172848, 1.02266, 0.4256402, 1, 0, 0.6588235, 1,
1.183173, -0.8702285, 3.011706, 1, 0, 0.654902, 1,
1.188273, -0.97511, 3.387968, 1, 0, 0.6470588, 1,
1.197298, 1.673835, 0.0003087592, 1, 0, 0.6431373, 1,
1.198215, -1.001851, 2.310272, 1, 0, 0.6352941, 1,
1.202497, -0.4661385, 1.860174, 1, 0, 0.6313726, 1,
1.228349, 0.8298621, 1.353739, 1, 0, 0.6235294, 1,
1.231967, -1.093485, 1.413059, 1, 0, 0.6196079, 1,
1.232358, -0.7276158, 0.845718, 1, 0, 0.6117647, 1,
1.233661, 0.8546996, 0.9925228, 1, 0, 0.6078432, 1,
1.251758, -1.510224, 2.353739, 1, 0, 0.6, 1,
1.252428, 0.09404727, 2.666235, 1, 0, 0.5921569, 1,
1.265073, -0.1026081, 0.970976, 1, 0, 0.5882353, 1,
1.265911, 0.3597348, 1.708865, 1, 0, 0.5803922, 1,
1.275106, 0.1967377, 0.8715454, 1, 0, 0.5764706, 1,
1.28877, -0.3081267, 1.684035, 1, 0, 0.5686275, 1,
1.301306, -1.107507, 3.36872, 1, 0, 0.5647059, 1,
1.309933, 0.9521513, 0.08120178, 1, 0, 0.5568628, 1,
1.311507, 0.7462277, 0.925844, 1, 0, 0.5529412, 1,
1.319638, 0.09594102, 1.325409, 1, 0, 0.5450981, 1,
1.339889, 0.3322547, 0.02763424, 1, 0, 0.5411765, 1,
1.345275, 0.7390178, 0.5208336, 1, 0, 0.5333334, 1,
1.356702, -0.2115335, 3.068505, 1, 0, 0.5294118, 1,
1.359681, -1.854682, 3.605582, 1, 0, 0.5215687, 1,
1.379378, 0.1875883, 2.033896, 1, 0, 0.5176471, 1,
1.390764, -0.6854526, 2.27838, 1, 0, 0.509804, 1,
1.391598, -0.6409502, 1.526538, 1, 0, 0.5058824, 1,
1.412013, -0.5906941, 3.363259, 1, 0, 0.4980392, 1,
1.417455, 1.786855, 0.725435, 1, 0, 0.4901961, 1,
1.426258, -0.08863395, 1.577492, 1, 0, 0.4862745, 1,
1.428461, -0.631361, 2.442384, 1, 0, 0.4784314, 1,
1.43471, 0.05712668, 1.704565, 1, 0, 0.4745098, 1,
1.439189, 0.02385278, 2.045524, 1, 0, 0.4666667, 1,
1.445634, 0.3330826, 0.4587348, 1, 0, 0.4627451, 1,
1.451128, -0.7196091, 2.216307, 1, 0, 0.454902, 1,
1.453462, -0.1715694, 1.443568, 1, 0, 0.4509804, 1,
1.468811, 2.062076, 2.030312, 1, 0, 0.4431373, 1,
1.471665, 1.139719, 0.4769026, 1, 0, 0.4392157, 1,
1.472095, -0.9704297, 1.729972, 1, 0, 0.4313726, 1,
1.478196, 1.01053, 0.0678477, 1, 0, 0.427451, 1,
1.487457, -0.8617256, 1.546685, 1, 0, 0.4196078, 1,
1.494624, -2.021625, 2.808372, 1, 0, 0.4156863, 1,
1.501263, 1.505711, -2.081562, 1, 0, 0.4078431, 1,
1.510011, -0.2795272, 2.297078, 1, 0, 0.4039216, 1,
1.512916, 0.03046067, 3.748309, 1, 0, 0.3960784, 1,
1.514297, 1.411397, 1.789126, 1, 0, 0.3882353, 1,
1.517913, -1.013132, 1.331276, 1, 0, 0.3843137, 1,
1.526434, -0.4860692, 2.208679, 1, 0, 0.3764706, 1,
1.544083, -1.14134, 1.325127, 1, 0, 0.372549, 1,
1.549351, 0.7722096, 1.388493, 1, 0, 0.3647059, 1,
1.556032, 0.9390979, 4.471562, 1, 0, 0.3607843, 1,
1.563501, -2.688455, 2.54545, 1, 0, 0.3529412, 1,
1.564861, -1.717636, 2.514911, 1, 0, 0.3490196, 1,
1.565563, -1.023941, 1.857899, 1, 0, 0.3411765, 1,
1.569127, 0.9151325, 1.403357, 1, 0, 0.3372549, 1,
1.580601, 0.4259996, 0.6484265, 1, 0, 0.3294118, 1,
1.625589, -0.9441684, 1.228968, 1, 0, 0.3254902, 1,
1.637814, -1.527107, 1.862365, 1, 0, 0.3176471, 1,
1.654145, 2.405567, 0.1848802, 1, 0, 0.3137255, 1,
1.661837, 1.34875, -0.1111537, 1, 0, 0.3058824, 1,
1.66199, -1.251635, -1.153345, 1, 0, 0.2980392, 1,
1.664144, -1.698375, 1.726208, 1, 0, 0.2941177, 1,
1.688696, 0.7188667, 0.6544188, 1, 0, 0.2862745, 1,
1.692623, 0.2804171, 2.544336, 1, 0, 0.282353, 1,
1.700145, -2.356379, 3.552885, 1, 0, 0.2745098, 1,
1.708246, 1.215073, 0.130167, 1, 0, 0.2705882, 1,
1.730621, 0.5452082, 0.6915071, 1, 0, 0.2627451, 1,
1.731382, -0.722261, 0.1590926, 1, 0, 0.2588235, 1,
1.733462, -0.4184363, 0.8705999, 1, 0, 0.2509804, 1,
1.734605, -0.3115724, 1.770714, 1, 0, 0.2470588, 1,
1.765852, 1.4527, 0.6436508, 1, 0, 0.2392157, 1,
1.788147, -0.3534579, 1.786039, 1, 0, 0.2352941, 1,
1.804954, 1.662756, 0.1924712, 1, 0, 0.227451, 1,
1.835175, 0.6461453, 0.9570135, 1, 0, 0.2235294, 1,
1.849139, -1.116916, 2.141042, 1, 0, 0.2156863, 1,
1.85217, 0.4276562, 0.5109676, 1, 0, 0.2117647, 1,
1.854734, 0.4579213, 0.7520463, 1, 0, 0.2039216, 1,
1.856212, 0.6024551, 5.163871, 1, 0, 0.1960784, 1,
1.866561, 3.342915, 1.052779, 1, 0, 0.1921569, 1,
1.893647, 0.1828726, 1.086288, 1, 0, 0.1843137, 1,
1.906393, -1.022504, 3.074034, 1, 0, 0.1803922, 1,
1.907114, 1.390488, 0.9069741, 1, 0, 0.172549, 1,
1.914448, 1.300628, 0.04377043, 1, 0, 0.1686275, 1,
1.927156, -0.6675496, 2.054848, 1, 0, 0.1607843, 1,
1.94006, 1.292825, -0.333602, 1, 0, 0.1568628, 1,
1.944366, 1.537826, 0.5621325, 1, 0, 0.1490196, 1,
1.955062, 0.2671166, 1.003104, 1, 0, 0.145098, 1,
1.961032, -0.0130916, 2.016478, 1, 0, 0.1372549, 1,
1.970118, 0.1128431, 0.784337, 1, 0, 0.1333333, 1,
1.998229, -0.3882285, 2.315012, 1, 0, 0.1254902, 1,
2.001281, 0.2267375, 2.919556, 1, 0, 0.1215686, 1,
2.003174, -0.6090217, 2.46419, 1, 0, 0.1137255, 1,
2.014706, -0.6920472, 2.849009, 1, 0, 0.1098039, 1,
2.055867, -0.8214738, 2.057383, 1, 0, 0.1019608, 1,
2.098132, 0.3887502, 1.387507, 1, 0, 0.09411765, 1,
2.110024, 0.5711956, 1.951125, 1, 0, 0.09019608, 1,
2.118852, -0.01123701, 2.800846, 1, 0, 0.08235294, 1,
2.119473, 0.2359771, 1.522353, 1, 0, 0.07843138, 1,
2.172062, -0.8819253, 2.562314, 1, 0, 0.07058824, 1,
2.19404, 0.7164878, 1.059129, 1, 0, 0.06666667, 1,
2.223164, 0.2492636, 2.17816, 1, 0, 0.05882353, 1,
2.249739, -0.6885586, 3.407423, 1, 0, 0.05490196, 1,
2.405955, 0.6670407, 0.6344811, 1, 0, 0.04705882, 1,
2.485076, -0.85892, 1.387866, 1, 0, 0.04313726, 1,
2.634316, -1.079022, 2.666271, 1, 0, 0.03529412, 1,
2.6412, -0.522093, 3.601313, 1, 0, 0.03137255, 1,
2.666255, 0.2410919, 0.9095361, 1, 0, 0.02352941, 1,
3.085414, 0.1613776, 1.033883, 1, 0, 0.01960784, 1,
3.444748, -0.6175821, 1.898475, 1, 0, 0.01176471, 1,
3.55308, -0.8861543, 1.432095, 1, 0, 0.007843138, 1
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
0.05842471, -4.280234, -7.438209, 0, -0.5, 0.5, 0.5,
0.05842471, -4.280234, -7.438209, 1, -0.5, 0.5, 0.5,
0.05842471, -4.280234, -7.438209, 1, 1.5, 0.5, 0.5,
0.05842471, -4.280234, -7.438209, 0, 1.5, 0.5, 0.5
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
-4.620918, 0.1589884, -7.438209, 0, -0.5, 0.5, 0.5,
-4.620918, 0.1589884, -7.438209, 1, -0.5, 0.5, 0.5,
-4.620918, 0.1589884, -7.438209, 1, 1.5, 0.5, 0.5,
-4.620918, 0.1589884, -7.438209, 0, 1.5, 0.5, 0.5
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
-4.620918, -4.280234, -0.2239358, 0, -0.5, 0.5, 0.5,
-4.620918, -4.280234, -0.2239358, 1, -0.5, 0.5, 0.5,
-4.620918, -4.280234, -0.2239358, 1, 1.5, 0.5, 0.5,
-4.620918, -4.280234, -0.2239358, 0, 1.5, 0.5, 0.5
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
-3, -3.255798, -5.773376,
3, -3.255798, -5.773376,
-3, -3.255798, -5.773376,
-3, -3.426538, -6.050849,
-2, -3.255798, -5.773376,
-2, -3.426538, -6.050849,
-1, -3.255798, -5.773376,
-1, -3.426538, -6.050849,
0, -3.255798, -5.773376,
0, -3.426538, -6.050849,
1, -3.255798, -5.773376,
1, -3.426538, -6.050849,
2, -3.255798, -5.773376,
2, -3.426538, -6.050849,
3, -3.255798, -5.773376,
3, -3.426538, -6.050849
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
-3, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
-3, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
-3, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
-3, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5,
-2, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
-2, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
-2, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
-2, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5,
-1, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
-1, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
-1, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
-1, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5,
0, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
0, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
0, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
0, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5,
1, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
1, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
1, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
1, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5,
2, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
2, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
2, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
2, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5,
3, -3.768016, -6.605793, 0, -0.5, 0.5, 0.5,
3, -3.768016, -6.605793, 1, -0.5, 0.5, 0.5,
3, -3.768016, -6.605793, 1, 1.5, 0.5, 0.5,
3, -3.768016, -6.605793, 0, 1.5, 0.5, 0.5
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
-3.54107, -3, -5.773376,
-3.54107, 3, -5.773376,
-3.54107, -3, -5.773376,
-3.721045, -3, -6.050849,
-3.54107, -2, -5.773376,
-3.721045, -2, -6.050849,
-3.54107, -1, -5.773376,
-3.721045, -1, -6.050849,
-3.54107, 0, -5.773376,
-3.721045, 0, -6.050849,
-3.54107, 1, -5.773376,
-3.721045, 1, -6.050849,
-3.54107, 2, -5.773376,
-3.721045, 2, -6.050849,
-3.54107, 3, -5.773376,
-3.721045, 3, -6.050849
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
-4.080994, -3, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, -3, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, -3, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, -3, -6.605793, 0, 1.5, 0.5, 0.5,
-4.080994, -2, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, -2, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, -2, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, -2, -6.605793, 0, 1.5, 0.5, 0.5,
-4.080994, -1, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, -1, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, -1, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, -1, -6.605793, 0, 1.5, 0.5, 0.5,
-4.080994, 0, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, 0, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, 0, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, 0, -6.605793, 0, 1.5, 0.5, 0.5,
-4.080994, 1, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, 1, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, 1, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, 1, -6.605793, 0, 1.5, 0.5, 0.5,
-4.080994, 2, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, 2, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, 2, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, 2, -6.605793, 0, 1.5, 0.5, 0.5,
-4.080994, 3, -6.605793, 0, -0.5, 0.5, 0.5,
-4.080994, 3, -6.605793, 1, -0.5, 0.5, 0.5,
-4.080994, 3, -6.605793, 1, 1.5, 0.5, 0.5,
-4.080994, 3, -6.605793, 0, 1.5, 0.5, 0.5
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
-3.54107, -3.255798, -4,
-3.54107, -3.255798, 4,
-3.54107, -3.255798, -4,
-3.721045, -3.426538, -4,
-3.54107, -3.255798, -2,
-3.721045, -3.426538, -2,
-3.54107, -3.255798, 0,
-3.721045, -3.426538, 0,
-3.54107, -3.255798, 2,
-3.721045, -3.426538, 2,
-3.54107, -3.255798, 4,
-3.721045, -3.426538, 4
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
-4.080994, -3.768016, -4, 0, -0.5, 0.5, 0.5,
-4.080994, -3.768016, -4, 1, -0.5, 0.5, 0.5,
-4.080994, -3.768016, -4, 1, 1.5, 0.5, 0.5,
-4.080994, -3.768016, -4, 0, 1.5, 0.5, 0.5,
-4.080994, -3.768016, -2, 0, -0.5, 0.5, 0.5,
-4.080994, -3.768016, -2, 1, -0.5, 0.5, 0.5,
-4.080994, -3.768016, -2, 1, 1.5, 0.5, 0.5,
-4.080994, -3.768016, -2, 0, 1.5, 0.5, 0.5,
-4.080994, -3.768016, 0, 0, -0.5, 0.5, 0.5,
-4.080994, -3.768016, 0, 1, -0.5, 0.5, 0.5,
-4.080994, -3.768016, 0, 1, 1.5, 0.5, 0.5,
-4.080994, -3.768016, 0, 0, 1.5, 0.5, 0.5,
-4.080994, -3.768016, 2, 0, -0.5, 0.5, 0.5,
-4.080994, -3.768016, 2, 1, -0.5, 0.5, 0.5,
-4.080994, -3.768016, 2, 1, 1.5, 0.5, 0.5,
-4.080994, -3.768016, 2, 0, 1.5, 0.5, 0.5,
-4.080994, -3.768016, 4, 0, -0.5, 0.5, 0.5,
-4.080994, -3.768016, 4, 1, -0.5, 0.5, 0.5,
-4.080994, -3.768016, 4, 1, 1.5, 0.5, 0.5,
-4.080994, -3.768016, 4, 0, 1.5, 0.5, 0.5
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
-3.54107, -3.255798, -5.773376,
-3.54107, 3.573775, -5.773376,
-3.54107, -3.255798, 5.325505,
-3.54107, 3.573775, 5.325505,
-3.54107, -3.255798, -5.773376,
-3.54107, -3.255798, 5.325505,
-3.54107, 3.573775, -5.773376,
-3.54107, 3.573775, 5.325505,
-3.54107, -3.255798, -5.773376,
3.657919, -3.255798, -5.773376,
-3.54107, -3.255798, 5.325505,
3.657919, -3.255798, 5.325505,
-3.54107, 3.573775, -5.773376,
3.657919, 3.573775, -5.773376,
-3.54107, 3.573775, 5.325505,
3.657919, 3.573775, 5.325505,
3.657919, -3.255798, -5.773376,
3.657919, 3.573775, -5.773376,
3.657919, -3.255798, 5.325505,
3.657919, 3.573775, 5.325505,
3.657919, -3.255798, -5.773376,
3.657919, -3.255798, 5.325505,
3.657919, 3.573775, -5.773376,
3.657919, 3.573775, 5.325505
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
var radius = 7.949923;
var distance = 35.37011;
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
mvMatrix.translate( -0.05842471, -0.1589884, 0.2239358 );
mvMatrix.scale( 1.194003, 1.258587, 0.7744576 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.37011);
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
torque<-read.table("torque.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-torque$V2
```

```
## Error in eval(expr, envir, enclos): object 'torque' not found
```

```r
y<-torque$V3
```

```
## Error in eval(expr, envir, enclos): object 'torque' not found
```

```r
z<-torque$V4
```

```
## Error in eval(expr, envir, enclos): object 'torque' not found
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
-3.43623, 0.6364136, -2.693913, 0, 0, 1, 1, 1,
-2.863554, -0.3233267, -2.381665, 1, 0, 0, 1, 1,
-2.355757, 1.063364, -0.8868382, 1, 0, 0, 1, 1,
-2.33134, -0.3534247, -3.041512, 1, 0, 0, 1, 1,
-2.292721, -0.1229065, -0.7008711, 1, 0, 0, 1, 1,
-2.212344, -0.3862517, -1.222217, 1, 0, 0, 1, 1,
-2.210873, 0.3233206, -0.7594963, 0, 0, 0, 1, 1,
-2.16827, -0.1791382, -2.096131, 0, 0, 0, 1, 1,
-2.153036, -0.4732375, -1.086212, 0, 0, 0, 1, 1,
-2.095894, 0.1647762, -0.7999373, 0, 0, 0, 1, 1,
-2.078188, -1.231557, -3.028416, 0, 0, 0, 1, 1,
-2.059092, 0.5886004, -2.838014, 0, 0, 0, 1, 1,
-2.042531, 0.7932729, -2.394356, 0, 0, 0, 1, 1,
-2.039839, -0.6910601, -2.309064, 1, 1, 1, 1, 1,
-2.028656, -1.300806, -3.622035, 1, 1, 1, 1, 1,
-2.017303, -0.8866596, -1.850262, 1, 1, 1, 1, 1,
-2.014529, -0.6598128, -2.013071, 1, 1, 1, 1, 1,
-1.947736, 0.5824498, -0.526323, 1, 1, 1, 1, 1,
-1.939275, -0.1324936, -1.87015, 1, 1, 1, 1, 1,
-1.876384, 2.312992, -1.928817, 1, 1, 1, 1, 1,
-1.8726, 0.8632926, -1.160731, 1, 1, 1, 1, 1,
-1.871911, -0.1424085, -0.9316672, 1, 1, 1, 1, 1,
-1.855224, 0.9840181, -1.591461, 1, 1, 1, 1, 1,
-1.846584, -0.03772078, -0.3321397, 1, 1, 1, 1, 1,
-1.838386, -0.5476144, -1.867869, 1, 1, 1, 1, 1,
-1.835716, -0.4138859, -1.170631, 1, 1, 1, 1, 1,
-1.821876, 0.7903543, -0.4882974, 1, 1, 1, 1, 1,
-1.811415, 0.4520886, -1.756608, 1, 1, 1, 1, 1,
-1.802712, -0.1542679, -2.131927, 0, 0, 1, 1, 1,
-1.787642, 1.925589, -1.386228, 1, 0, 0, 1, 1,
-1.783704, -0.6985215, -4.0129, 1, 0, 0, 1, 1,
-1.75418, 0.8857579, -0.9413661, 1, 0, 0, 1, 1,
-1.751828, 0.02865481, -2.491827, 1, 0, 0, 1, 1,
-1.747789, 0.7205963, -3.38218, 1, 0, 0, 1, 1,
-1.745797, 0.1594686, -3.973424, 0, 0, 0, 1, 1,
-1.726422, -0.8048746, -2.280668, 0, 0, 0, 1, 1,
-1.701897, 0.5444955, -2.054832, 0, 0, 0, 1, 1,
-1.689058, -0.339269, -2.424059, 0, 0, 0, 1, 1,
-1.685189, 1.27056, -1.744588, 0, 0, 0, 1, 1,
-1.671255, -0.1736797, -1.224181, 0, 0, 0, 1, 1,
-1.648884, 0.7786911, -0.4784573, 0, 0, 0, 1, 1,
-1.647224, 1.841219, -1.505561, 1, 1, 1, 1, 1,
-1.645236, 1.199449, -2.590251, 1, 1, 1, 1, 1,
-1.63956, -0.2826813, -1.903824, 1, 1, 1, 1, 1,
-1.637244, 1.175489, -1.186339, 1, 1, 1, 1, 1,
-1.627595, 1.175835, 0.7182244, 1, 1, 1, 1, 1,
-1.623548, 0.8905082, -1.339074, 1, 1, 1, 1, 1,
-1.607044, 0.347233, -0.0223782, 1, 1, 1, 1, 1,
-1.597849, -0.6109421, -1.135083, 1, 1, 1, 1, 1,
-1.586696, -0.07837576, -2.912938, 1, 1, 1, 1, 1,
-1.562447, -0.6963435, -1.191605, 1, 1, 1, 1, 1,
-1.550142, 0.3246974, -1.331362, 1, 1, 1, 1, 1,
-1.533323, 0.469113, -1.551442, 1, 1, 1, 1, 1,
-1.53106, 1.383572, -0.9455642, 1, 1, 1, 1, 1,
-1.523731, -2.025467, -2.463924, 1, 1, 1, 1, 1,
-1.523673, 0.6964458, -1.440022, 1, 1, 1, 1, 1,
-1.51941, 0.2007552, -0.7972482, 0, 0, 1, 1, 1,
-1.513037, 0.1024713, -1.190196, 1, 0, 0, 1, 1,
-1.510314, 1.140751, -0.2632464, 1, 0, 0, 1, 1,
-1.507136, -1.657303, -2.47212, 1, 0, 0, 1, 1,
-1.500464, -1.083095, -2.102093, 1, 0, 0, 1, 1,
-1.499857, 1.680158, -0.5704062, 1, 0, 0, 1, 1,
-1.498287, -0.09964337, -0.9441862, 0, 0, 0, 1, 1,
-1.476243, 1.135095, 0.3655079, 0, 0, 0, 1, 1,
-1.467712, -0.2796796, -3.553888, 0, 0, 0, 1, 1,
-1.449116, 1.51574, -1.677176, 0, 0, 0, 1, 1,
-1.447211, 0.4562363, 1.471641, 0, 0, 0, 1, 1,
-1.440427, 0.8941235, -1.911326, 0, 0, 0, 1, 1,
-1.433565, 0.5001733, -2.047514, 0, 0, 0, 1, 1,
-1.425134, 0.8945097, 1.206636, 1, 1, 1, 1, 1,
-1.424478, -1.222194, -3.973248, 1, 1, 1, 1, 1,
-1.414648, 1.355614, -0.455148, 1, 1, 1, 1, 1,
-1.406046, -0.196429, -2.767617, 1, 1, 1, 1, 1,
-1.397086, 0.589973, -1.995591, 1, 1, 1, 1, 1,
-1.395106, 0.01335924, -1.707861, 1, 1, 1, 1, 1,
-1.374011, -0.6038162, -0.2758458, 1, 1, 1, 1, 1,
-1.366207, -0.773131, -2.81858, 1, 1, 1, 1, 1,
-1.353184, 0.6206878, -1.498976, 1, 1, 1, 1, 1,
-1.353153, 0.2198889, -1.133259, 1, 1, 1, 1, 1,
-1.34152, -0.3965338, -0.9038514, 1, 1, 1, 1, 1,
-1.340903, -0.7957059, -1.67683, 1, 1, 1, 1, 1,
-1.337097, -1.080186, -3.758874, 1, 1, 1, 1, 1,
-1.336823, 0.6645386, -0.4710657, 1, 1, 1, 1, 1,
-1.324559, 0.1006786, -0.5565774, 1, 1, 1, 1, 1,
-1.322569, -0.1311091, -1.88777, 0, 0, 1, 1, 1,
-1.314368, -1.143595, -4.044431, 1, 0, 0, 1, 1,
-1.311967, -3.156338, -3.378862, 1, 0, 0, 1, 1,
-1.303486, -1.396783, -1.925121, 1, 0, 0, 1, 1,
-1.301343, -1.308339, -5.611742, 1, 0, 0, 1, 1,
-1.298624, -0.7694884, -1.909658, 1, 0, 0, 1, 1,
-1.298606, -1.868559, -1.24182, 0, 0, 0, 1, 1,
-1.285301, 0.9825194, -0.1409283, 0, 0, 0, 1, 1,
-1.285196, 0.1064577, -1.710542, 0, 0, 0, 1, 1,
-1.28258, -0.5618849, -1.982526, 0, 0, 0, 1, 1,
-1.28228, 0.4565918, -0.8893921, 0, 0, 0, 1, 1,
-1.272412, -1.153685, -1.740847, 0, 0, 0, 1, 1,
-1.267754, 0.6074375, -0.4298273, 0, 0, 0, 1, 1,
-1.266479, 0.814902, -1.22805, 1, 1, 1, 1, 1,
-1.264942, 0.5692532, -1.009654, 1, 1, 1, 1, 1,
-1.257229, 2.511642, -0.326221, 1, 1, 1, 1, 1,
-1.243086, -0.7725425, -2.219772, 1, 1, 1, 1, 1,
-1.236516, 1.182609, -0.6064644, 1, 1, 1, 1, 1,
-1.235669, -2.012711, -2.215904, 1, 1, 1, 1, 1,
-1.229118, 0.5686768, 0.4745791, 1, 1, 1, 1, 1,
-1.227952, 1.250743, -2.440408, 1, 1, 1, 1, 1,
-1.216563, -0.9804121, -2.039565, 1, 1, 1, 1, 1,
-1.21099, -0.06023332, -1.800037, 1, 1, 1, 1, 1,
-1.204768, -0.1986976, -2.538643, 1, 1, 1, 1, 1,
-1.203253, -0.5002362, -2.325489, 1, 1, 1, 1, 1,
-1.199636, -0.3728409, -1.635885, 1, 1, 1, 1, 1,
-1.193943, -0.8417493, -4.112044, 1, 1, 1, 1, 1,
-1.180943, -0.1390495, -0.5228717, 1, 1, 1, 1, 1,
-1.174652, -0.1501774, 0.07573879, 0, 0, 1, 1, 1,
-1.165393, 0.1824165, 1.643769, 1, 0, 0, 1, 1,
-1.16204, 0.05932905, 0.6216097, 1, 0, 0, 1, 1,
-1.16172, 0.8409152, -0.9167686, 1, 0, 0, 1, 1,
-1.156905, 0.7337396, 0.6620315, 1, 0, 0, 1, 1,
-1.154033, -0.8409098, -1.807918, 1, 0, 0, 1, 1,
-1.153665, 0.4739327, -1.267459, 0, 0, 0, 1, 1,
-1.152376, -0.03580729, -0.2381778, 0, 0, 0, 1, 1,
-1.150013, 1.167228, -1.510093, 0, 0, 0, 1, 1,
-1.149722, 0.162029, 0.1369232, 0, 0, 0, 1, 1,
-1.13978, -1.090931, -2.076732, 0, 0, 0, 1, 1,
-1.137457, -1.147458, -1.964125, 0, 0, 0, 1, 1,
-1.130055, 0.6415929, -0.9106099, 0, 0, 0, 1, 1,
-1.127132, -1.189953, -2.431161, 1, 1, 1, 1, 1,
-1.126581, 1.005384, -2.846976, 1, 1, 1, 1, 1,
-1.126518, 1.247977, -0.7899873, 1, 1, 1, 1, 1,
-1.120962, -0.9146181, -4.371546, 1, 1, 1, 1, 1,
-1.118915, -0.3017436, -1.594822, 1, 1, 1, 1, 1,
-1.118464, 0.171327, -1.730006, 1, 1, 1, 1, 1,
-1.105471, 1.354515, -1.647624, 1, 1, 1, 1, 1,
-1.103794, 0.8121507, 0.4025978, 1, 1, 1, 1, 1,
-1.090693, 1.174574, 0.8184048, 1, 1, 1, 1, 1,
-1.087036, -0.4618326, -1.973069, 1, 1, 1, 1, 1,
-1.086882, -1.275535, -1.24761, 1, 1, 1, 1, 1,
-1.08551, 0.2158771, -1.561964, 1, 1, 1, 1, 1,
-1.083271, 0.5704025, -0.8681591, 1, 1, 1, 1, 1,
-1.07612, 0.4834373, -1.465329, 1, 1, 1, 1, 1,
-1.063747, -0.2690077, -1.84923, 1, 1, 1, 1, 1,
-1.063504, 1.224668, -0.3381053, 0, 0, 1, 1, 1,
-1.058634, -0.18678, -1.224486, 1, 0, 0, 1, 1,
-1.055021, -0.9479592, -3.86038, 1, 0, 0, 1, 1,
-1.05309, 1.81948, 0.0570892, 1, 0, 0, 1, 1,
-1.049335, -0.3508873, -3.019084, 1, 0, 0, 1, 1,
-1.045332, -1.138914, -3.072281, 1, 0, 0, 1, 1,
-1.04303, -0.7010761, -3.148618, 0, 0, 0, 1, 1,
-1.036639, 1.886416, 1.119354, 0, 0, 0, 1, 1,
-1.036566, -0.1989098, -1.616185, 0, 0, 0, 1, 1,
-1.029637, -0.7401344, -1.12308, 0, 0, 0, 1, 1,
-1.007714, -0.1079649, -3.428864, 0, 0, 0, 1, 1,
-1.007695, -0.2176164, 0.9095529, 0, 0, 0, 1, 1,
-1.007215, -0.01197559, -0.9359106, 0, 0, 0, 1, 1,
-0.9987413, 0.5869994, -1.210194, 1, 1, 1, 1, 1,
-0.9976745, 0.9630675, -1.212366, 1, 1, 1, 1, 1,
-0.9945774, 0.1086995, -2.745693, 1, 1, 1, 1, 1,
-0.9918151, -0.8153438, -1.835326, 1, 1, 1, 1, 1,
-0.9907908, 1.39198, -2.244858, 1, 1, 1, 1, 1,
-0.9907517, 0.1150509, -0.693562, 1, 1, 1, 1, 1,
-0.9905857, 0.5584205, -0.6275229, 1, 1, 1, 1, 1,
-0.9656224, 0.1361404, -0.7370555, 1, 1, 1, 1, 1,
-0.9638891, -1.414896, -2.607805, 1, 1, 1, 1, 1,
-0.9609611, 0.7397047, -2.325826, 1, 1, 1, 1, 1,
-0.9586276, -0.625992, -3.154914, 1, 1, 1, 1, 1,
-0.9512881, 0.4729396, -0.1400662, 1, 1, 1, 1, 1,
-0.9475334, -1.316691, -2.093727, 1, 1, 1, 1, 1,
-0.9456642, 0.6933508, -0.6971483, 1, 1, 1, 1, 1,
-0.9404113, 0.1639743, -2.561171, 1, 1, 1, 1, 1,
-0.9376188, 1.237014, 0.5297297, 0, 0, 1, 1, 1,
-0.9229785, 2.046821, 1.644994, 1, 0, 0, 1, 1,
-0.913443, 0.96408, -1.534604, 1, 0, 0, 1, 1,
-0.9027406, -0.9927857, -1.119799, 1, 0, 0, 1, 1,
-0.9023678, 2.786318, -0.2194824, 1, 0, 0, 1, 1,
-0.8998331, 1.072132, -1.669936, 1, 0, 0, 1, 1,
-0.8935656, -0.5231706, -3.678922, 0, 0, 0, 1, 1,
-0.8932434, -1.760983, -4.10458, 0, 0, 0, 1, 1,
-0.8897331, -0.07200889, -1.469346, 0, 0, 0, 1, 1,
-0.8894554, 0.6955271, -0.5894365, 0, 0, 0, 1, 1,
-0.889002, 1.736813, -1.25123, 0, 0, 0, 1, 1,
-0.8886782, -1.214812, -3.128651, 0, 0, 0, 1, 1,
-0.8845237, -0.1467292, -2.126381, 0, 0, 0, 1, 1,
-0.8838228, -1.362285, -0.9524452, 1, 1, 1, 1, 1,
-0.8820366, -1.168912, 0.008818578, 1, 1, 1, 1, 1,
-0.878073, -0.2814403, -0.2235763, 1, 1, 1, 1, 1,
-0.8766759, 0.6298624, -1.04508, 1, 1, 1, 1, 1,
-0.8738517, -0.9605947, -3.195286, 1, 1, 1, 1, 1,
-0.8659248, 0.6270627, -0.3049817, 1, 1, 1, 1, 1,
-0.8654517, -0.4729793, -2.143375, 1, 1, 1, 1, 1,
-0.8640902, -0.5649487, -2.085046, 1, 1, 1, 1, 1,
-0.8567517, 0.386282, -1.918731, 1, 1, 1, 1, 1,
-0.8560216, -0.0627824, -1.330985, 1, 1, 1, 1, 1,
-0.8495143, -0.5748921, -2.530461, 1, 1, 1, 1, 1,
-0.8490554, -0.207649, -3.46866, 1, 1, 1, 1, 1,
-0.8464286, 1.58981, -0.4301451, 1, 1, 1, 1, 1,
-0.845712, 1.385991, 0.9750747, 1, 1, 1, 1, 1,
-0.8449571, -1.322027, -3.273445, 1, 1, 1, 1, 1,
-0.8448415, 0.483054, -2.13843, 0, 0, 1, 1, 1,
-0.8430572, 0.8754879, -0.3975659, 1, 0, 0, 1, 1,
-0.8384168, -0.7454106, -3.514409, 1, 0, 0, 1, 1,
-0.8376411, 0.8341381, -1.318044, 1, 0, 0, 1, 1,
-0.8365405, 2.444852, -1.018549, 1, 0, 0, 1, 1,
-0.8282702, 0.9479676, -2.333932, 1, 0, 0, 1, 1,
-0.8277599, -1.311156, -2.200332, 0, 0, 0, 1, 1,
-0.8268884, 0.4022148, -1.129861, 0, 0, 0, 1, 1,
-0.8214141, -0.2551037, -3.084753, 0, 0, 0, 1, 1,
-0.8199035, -0.1090281, -3.279503, 0, 0, 0, 1, 1,
-0.8157585, -0.6298073, -1.397358, 0, 0, 0, 1, 1,
-0.8149558, 0.9024283, -0.7193076, 0, 0, 0, 1, 1,
-0.8117488, 0.7088917, -1.399687, 0, 0, 0, 1, 1,
-0.8093848, -0.7795792, -2.981109, 1, 1, 1, 1, 1,
-0.8059134, -0.8127068, -1.040702, 1, 1, 1, 1, 1,
-0.805262, -0.5723634, -2.951709, 1, 1, 1, 1, 1,
-0.8051624, -0.5146272, -2.233939, 1, 1, 1, 1, 1,
-0.8050387, -0.2264313, 0.04706245, 1, 1, 1, 1, 1,
-0.796299, -0.6224745, -3.417464, 1, 1, 1, 1, 1,
-0.7941377, -1.305156, -3.658403, 1, 1, 1, 1, 1,
-0.7892337, -0.7321641, -2.234883, 1, 1, 1, 1, 1,
-0.7859543, 1.718768, 0.9086589, 1, 1, 1, 1, 1,
-0.7847568, 0.8365061, 1.970834, 1, 1, 1, 1, 1,
-0.7817096, -0.2913474, -1.88497, 1, 1, 1, 1, 1,
-0.7774554, -1.766882, -0.3924705, 1, 1, 1, 1, 1,
-0.7748917, -1.23676, -4.642951, 1, 1, 1, 1, 1,
-0.7742778, 0.07895662, -2.308617, 1, 1, 1, 1, 1,
-0.7737547, 3.474315, -0.04591553, 1, 1, 1, 1, 1,
-0.7716463, 1.48595, -1.453278, 0, 0, 1, 1, 1,
-0.7683214, 0.1014319, -0.5104846, 1, 0, 0, 1, 1,
-0.7653876, -0.8707029, -0.9099725, 1, 0, 0, 1, 1,
-0.7642468, -0.6782625, -4.575499, 1, 0, 0, 1, 1,
-0.7631567, 0.6198991, -0.4073493, 1, 0, 0, 1, 1,
-0.7582996, -0.9282126, -3.307476, 1, 0, 0, 1, 1,
-0.7533646, 1.23575, 0.6803536, 0, 0, 0, 1, 1,
-0.7510872, -0.5335639, -2.284795, 0, 0, 0, 1, 1,
-0.7506984, -1.823401, -1.610244, 0, 0, 0, 1, 1,
-0.7490262, -0.3668428, -0.9147532, 0, 0, 0, 1, 1,
-0.7482948, -1.33578, -4.453441, 0, 0, 0, 1, 1,
-0.7416854, 0.7132361, -0.6755478, 0, 0, 0, 1, 1,
-0.7341808, 1.42045, -0.8093641, 0, 0, 0, 1, 1,
-0.7326742, 0.9574956, -2.575937, 1, 1, 1, 1, 1,
-0.7294633, -0.2383585, -2.074032, 1, 1, 1, 1, 1,
-0.7285078, 2.014621, -0.7975027, 1, 1, 1, 1, 1,
-0.7241155, 1.150067, -0.251548, 1, 1, 1, 1, 1,
-0.7231299, 0.3280669, -0.7430772, 1, 1, 1, 1, 1,
-0.7226443, 0.9306692, -0.8882936, 1, 1, 1, 1, 1,
-0.7128561, 1.501477, -2.016415, 1, 1, 1, 1, 1,
-0.7085599, 2.672915, -1.143283, 1, 1, 1, 1, 1,
-0.7073285, 0.3497803, -1.839909, 1, 1, 1, 1, 1,
-0.7046156, -1.396811, -3.212552, 1, 1, 1, 1, 1,
-0.7012901, -0.7355443, -1.965279, 1, 1, 1, 1, 1,
-0.6981325, -0.2374018, -1.639443, 1, 1, 1, 1, 1,
-0.6970302, 1.068757, 0.7821627, 1, 1, 1, 1, 1,
-0.6939172, -1.694411, -2.131562, 1, 1, 1, 1, 1,
-0.687198, 0.2135577, -0.4260686, 1, 1, 1, 1, 1,
-0.6856284, 1.008795, -1.628532, 0, 0, 1, 1, 1,
-0.6839595, 0.03952577, -2.421065, 1, 0, 0, 1, 1,
-0.6825243, 0.7822875, 1.330423, 1, 0, 0, 1, 1,
-0.677137, -0.4687911, -1.976338, 1, 0, 0, 1, 1,
-0.6766797, -1.031107, -2.323023, 1, 0, 0, 1, 1,
-0.6742772, -0.9740235, -3.883527, 1, 0, 0, 1, 1,
-0.6726022, 0.4662506, -1.550444, 0, 0, 0, 1, 1,
-0.6617839, -1.123546, -1.843892, 0, 0, 0, 1, 1,
-0.6593073, -0.4380305, -1.595295, 0, 0, 0, 1, 1,
-0.658446, -0.1690861, -0.4813868, 0, 0, 0, 1, 1,
-0.6562448, -0.8053189, -2.723649, 0, 0, 0, 1, 1,
-0.6560178, 1.114561, -0.08307657, 0, 0, 0, 1, 1,
-0.6545269, 0.5445474, -0.7427466, 0, 0, 0, 1, 1,
-0.652984, -0.405733, -1.261841, 1, 1, 1, 1, 1,
-0.6527953, 0.2292379, -1.577758, 1, 1, 1, 1, 1,
-0.6461859, 0.05311497, -1.599261, 1, 1, 1, 1, 1,
-0.6458082, -1.50283, -4.328246, 1, 1, 1, 1, 1,
-0.6393677, 3.438856, -0.802182, 1, 1, 1, 1, 1,
-0.6372133, 0.1649896, -2.652505, 1, 1, 1, 1, 1,
-0.632054, 0.2006175, -0.7972873, 1, 1, 1, 1, 1,
-0.6280864, -0.07484846, -1.391263, 1, 1, 1, 1, 1,
-0.6280315, -0.4002733, -1.834772, 1, 1, 1, 1, 1,
-0.6256455, -1.580025, -4.161092, 1, 1, 1, 1, 1,
-0.6221849, -1.613896, -0.6913168, 1, 1, 1, 1, 1,
-0.6214119, -0.06085656, -2.498639, 1, 1, 1, 1, 1,
-0.6207383, -2.665022, -3.405788, 1, 1, 1, 1, 1,
-0.6206498, -1.687564, -4.069429, 1, 1, 1, 1, 1,
-0.6171337, 0.533165, 0.001022597, 1, 1, 1, 1, 1,
-0.6124844, 0.8921852, -1.731463, 0, 0, 1, 1, 1,
-0.6117075, 2.310777, -1.866867, 1, 0, 0, 1, 1,
-0.6028585, 1.349084, 0.2471161, 1, 0, 0, 1, 1,
-0.5998554, 0.03973568, 1.364031, 1, 0, 0, 1, 1,
-0.5997853, -0.8597817, -2.414937, 1, 0, 0, 1, 1,
-0.5987596, 0.3631904, -0.7971407, 1, 0, 0, 1, 1,
-0.5986763, 0.03979358, -2.268214, 0, 0, 0, 1, 1,
-0.5948211, 0.09023549, -1.949016, 0, 0, 0, 1, 1,
-0.5911957, 0.2132075, -2.254324, 0, 0, 0, 1, 1,
-0.5901161, -1.721296, -3.696068, 0, 0, 0, 1, 1,
-0.5860507, 2.146041, -0.9065825, 0, 0, 0, 1, 1,
-0.5832743, -0.362667, -1.766784, 0, 0, 0, 1, 1,
-0.5764762, 0.8313624, 0.6524785, 0, 0, 0, 1, 1,
-0.5748072, 0.8947405, -1.354191, 1, 1, 1, 1, 1,
-0.5734309, 1.560137, -0.5147069, 1, 1, 1, 1, 1,
-0.5708561, 0.118305, -2.528416, 1, 1, 1, 1, 1,
-0.5635417, 0.6025552, -1.607798, 1, 1, 1, 1, 1,
-0.5628603, -0.5388111, -1.976906, 1, 1, 1, 1, 1,
-0.5582891, -0.5722312, -1.708896, 1, 1, 1, 1, 1,
-0.5568973, 1.508693, -0.8672278, 1, 1, 1, 1, 1,
-0.5527741, -0.2334679, -1.109905, 1, 1, 1, 1, 1,
-0.5516187, 1.365318, 0.8274543, 1, 1, 1, 1, 1,
-0.5484201, 1.26464, -1.167281, 1, 1, 1, 1, 1,
-0.5401206, 0.7087308, 0.07193163, 1, 1, 1, 1, 1,
-0.5368894, -0.1542052, -2.085268, 1, 1, 1, 1, 1,
-0.5367803, -1.357574, -1.898314, 1, 1, 1, 1, 1,
-0.5356222, 1.512007, -2.941902, 1, 1, 1, 1, 1,
-0.5342765, -0.8380283, -2.699741, 1, 1, 1, 1, 1,
-0.5263663, -0.04724341, -2.10454, 0, 0, 1, 1, 1,
-0.5220535, -0.4540977, -3.252813, 1, 0, 0, 1, 1,
-0.5208818, -0.315547, -2.152832, 1, 0, 0, 1, 1,
-0.5188017, 1.266208, 0.6196134, 1, 0, 0, 1, 1,
-0.5142013, -0.3779756, -2.631229, 1, 0, 0, 1, 1,
-0.5134313, 1.142421, -0.8289776, 1, 0, 0, 1, 1,
-0.5105039, -0.89565, -2.773046, 0, 0, 0, 1, 1,
-0.5070813, 0.01310361, -2.511041, 0, 0, 0, 1, 1,
-0.5058552, -0.07549659, -0.3558147, 0, 0, 0, 1, 1,
-0.5031365, 1.360304, 0.6162696, 0, 0, 0, 1, 1,
-0.5009876, -0.9623286, -2.346239, 0, 0, 0, 1, 1,
-0.496499, 0.876191, -1.046412, 0, 0, 0, 1, 1,
-0.4962443, 0.3651465, -1.121583, 0, 0, 0, 1, 1,
-0.4921789, 1.538386, 0.1099832, 1, 1, 1, 1, 1,
-0.490698, 0.5531483, -2.807218, 1, 1, 1, 1, 1,
-0.4895556, 0.06043748, -0.6127018, 1, 1, 1, 1, 1,
-0.4857939, 0.5443141, -2.015094, 1, 1, 1, 1, 1,
-0.4829599, -0.1501239, 0.4952995, 1, 1, 1, 1, 1,
-0.4819432, -0.6101825, -2.627835, 1, 1, 1, 1, 1,
-0.480765, 0.274572, -1.202228, 1, 1, 1, 1, 1,
-0.4721675, -0.2231584, -2.034484, 1, 1, 1, 1, 1,
-0.4686224, 0.5321373, -0.880419, 1, 1, 1, 1, 1,
-0.4663155, -0.1174142, -2.303585, 1, 1, 1, 1, 1,
-0.465895, 0.1520275, -0.6662971, 1, 1, 1, 1, 1,
-0.4631541, 0.7437025, -0.5787454, 1, 1, 1, 1, 1,
-0.4593616, -0.4884533, -2.590065, 1, 1, 1, 1, 1,
-0.4551846, 1.554489, -0.4220723, 1, 1, 1, 1, 1,
-0.4551213, 1.286531, 0.7978624, 1, 1, 1, 1, 1,
-0.4545042, -0.9987605, -3.638541, 0, 0, 1, 1, 1,
-0.4509008, -1.496656, -1.539669, 1, 0, 0, 1, 1,
-0.4498206, -1.209389, -2.923029, 1, 0, 0, 1, 1,
-0.4495693, -0.143736, -2.013788, 1, 0, 0, 1, 1,
-0.4453929, -1.510767, -4.11025, 1, 0, 0, 1, 1,
-0.442067, -0.01058095, -1.785041, 1, 0, 0, 1, 1,
-0.4419034, 0.8924114, 0.3115754, 0, 0, 0, 1, 1,
-0.4400169, 0.671538, 0.1802832, 0, 0, 0, 1, 1,
-0.433464, -0.8577262, 0.0995558, 0, 0, 0, 1, 1,
-0.4302717, 0.1014955, -1.402765, 0, 0, 0, 1, 1,
-0.4271878, 1.087814, -1.560243, 0, 0, 0, 1, 1,
-0.425324, 2.011061, -0.4229132, 0, 0, 0, 1, 1,
-0.4244038, -0.6709605, -3.10544, 0, 0, 0, 1, 1,
-0.42083, 0.9958699, 0.4002619, 1, 1, 1, 1, 1,
-0.4199984, -0.9357443, -2.484233, 1, 1, 1, 1, 1,
-0.4193201, 0.04352302, 0.3326518, 1, 1, 1, 1, 1,
-0.4169171, 0.6945764, -2.872174, 1, 1, 1, 1, 1,
-0.4169138, -0.06068302, -0.659902, 1, 1, 1, 1, 1,
-0.4101723, -1.337908, -3.478598, 1, 1, 1, 1, 1,
-0.4098407, 1.545271, -0.1838127, 1, 1, 1, 1, 1,
-0.4063981, 0.3546565, -0.03778452, 1, 1, 1, 1, 1,
-0.3925244, -1.847324, -3.250224, 1, 1, 1, 1, 1,
-0.3916291, 0.9921945, -1.128988, 1, 1, 1, 1, 1,
-0.3893068, -1.569144, -1.495295, 1, 1, 1, 1, 1,
-0.3850267, -1.232752, -3.109326, 1, 1, 1, 1, 1,
-0.383982, 0.3570524, -1.556504, 1, 1, 1, 1, 1,
-0.3823195, 0.9631198, 0.3513766, 1, 1, 1, 1, 1,
-0.3767351, -1.573932, -3.810953, 1, 1, 1, 1, 1,
-0.37513, -1.886237, -3.93154, 0, 0, 1, 1, 1,
-0.3624835, 0.4406115, 0.9956112, 1, 0, 0, 1, 1,
-0.3591056, -0.2052617, -2.378049, 1, 0, 0, 1, 1,
-0.3560725, -0.7552624, -2.505349, 1, 0, 0, 1, 1,
-0.3517539, -0.2136365, -2.456375, 1, 0, 0, 1, 1,
-0.3496062, 1.624665, -1.617514, 1, 0, 0, 1, 1,
-0.3487768, 0.8518118, 0.6843048, 0, 0, 0, 1, 1,
-0.348764, -1.663597, -2.977645, 0, 0, 0, 1, 1,
-0.3477127, -0.05774795, -1.033046, 0, 0, 0, 1, 1,
-0.3432958, 0.5360763, -1.30218, 0, 0, 0, 1, 1,
-0.3415276, 0.2584344, -0.3050021, 0, 0, 0, 1, 1,
-0.3411877, -1.218603, -1.211283, 0, 0, 0, 1, 1,
-0.3393277, 0.2157777, -0.8794752, 0, 0, 0, 1, 1,
-0.3387003, 0.2896379, -2.127596, 1, 1, 1, 1, 1,
-0.3367938, 0.9016535, 0.5312011, 1, 1, 1, 1, 1,
-0.336639, -0.6755683, -2.521038, 1, 1, 1, 1, 1,
-0.3364559, -0.2388618, -2.205448, 1, 1, 1, 1, 1,
-0.3273378, -0.03493577, -2.021378, 1, 1, 1, 1, 1,
-0.3260226, 0.7359277, -0.4333603, 1, 1, 1, 1, 1,
-0.3185622, -0.00370025, -0.8685152, 1, 1, 1, 1, 1,
-0.3101473, 0.727255, -0.2272365, 1, 1, 1, 1, 1,
-0.3059294, -1.441637, -4.482748, 1, 1, 1, 1, 1,
-0.3051383, -1.631478, -3.015452, 1, 1, 1, 1, 1,
-0.30461, 0.702642, -0.8643206, 1, 1, 1, 1, 1,
-0.3021679, -0.6350188, -3.582294, 1, 1, 1, 1, 1,
-0.3009917, -0.625836, -2.637598, 1, 1, 1, 1, 1,
-0.297188, -1.23291, -2.835543, 1, 1, 1, 1, 1,
-0.2968738, -0.1161586, -2.676486, 1, 1, 1, 1, 1,
-0.2931009, -1.339737, -4.648804, 0, 0, 1, 1, 1,
-0.292582, 0.1523029, -3.381081, 1, 0, 0, 1, 1,
-0.2885898, -1.006592, -4.420931, 1, 0, 0, 1, 1,
-0.2878569, -0.6932921, -4.21454, 1, 0, 0, 1, 1,
-0.2852005, -1.277057, -0.6892883, 1, 0, 0, 1, 1,
-0.2840653, -1.18943, -3.913641, 1, 0, 0, 1, 1,
-0.2789395, 0.6485656, -0.9297202, 0, 0, 0, 1, 1,
-0.2761537, 0.4697261, -0.9223821, 0, 0, 0, 1, 1,
-0.271607, 0.605639, 0.4902462, 0, 0, 0, 1, 1,
-0.2715625, 0.4543274, -0.6127061, 0, 0, 0, 1, 1,
-0.2633385, -1.193584, -1.151398, 0, 0, 0, 1, 1,
-0.2608287, 2.136567, -0.7648093, 0, 0, 0, 1, 1,
-0.2603488, -1.128325, -1.176168, 0, 0, 0, 1, 1,
-0.259658, -0.2040455, -2.85608, 1, 1, 1, 1, 1,
-0.2576416, -0.9430181, -3.166349, 1, 1, 1, 1, 1,
-0.2571891, 1.371563, -0.4204726, 1, 1, 1, 1, 1,
-0.2565811, 0.2310375, -0.2088272, 1, 1, 1, 1, 1,
-0.252572, 0.3828746, -1.700487, 1, 1, 1, 1, 1,
-0.2501189, 1.230254, -0.6081857, 1, 1, 1, 1, 1,
-0.2500272, -0.05101437, -4.027061, 1, 1, 1, 1, 1,
-0.2480928, 0.4230156, -0.2498878, 1, 1, 1, 1, 1,
-0.2471204, -2.271012, -3.633679, 1, 1, 1, 1, 1,
-0.243729, 0.3057661, -2.38418, 1, 1, 1, 1, 1,
-0.2331685, 0.6701217, -0.6323035, 1, 1, 1, 1, 1,
-0.231424, -1.190567, -2.499389, 1, 1, 1, 1, 1,
-0.2269897, -2.259247, -0.743126, 1, 1, 1, 1, 1,
-0.2253077, -0.01502939, -0.9720486, 1, 1, 1, 1, 1,
-0.2252617, 0.05508767, -1.555099, 1, 1, 1, 1, 1,
-0.2232602, 0.259863, -0.6560085, 0, 0, 1, 1, 1,
-0.2227279, -0.7633169, -3.890002, 1, 0, 0, 1, 1,
-0.2224895, -1.693154, -3.975755, 1, 0, 0, 1, 1,
-0.209067, 0.1727328, -0.7805427, 1, 0, 0, 1, 1,
-0.2072468, 0.4009897, 0.1916201, 1, 0, 0, 1, 1,
-0.206476, -0.2931953, -2.252843, 1, 0, 0, 1, 1,
-0.2051369, 0.2584259, -0.8438215, 0, 0, 0, 1, 1,
-0.2040622, 1.167421, -0.4723683, 0, 0, 0, 1, 1,
-0.2033446, 2.572349, -1.187648, 0, 0, 0, 1, 1,
-0.2018613, 0.3712152, -0.387098, 0, 0, 0, 1, 1,
-0.2005464, 1.419243, -0.6219613, 0, 0, 0, 1, 1,
-0.1935957, 0.4071958, -1.679911, 0, 0, 0, 1, 1,
-0.1931534, 1.324152, 0.07832624, 0, 0, 0, 1, 1,
-0.1922055, 1.471206, 1.512046, 1, 1, 1, 1, 1,
-0.1873447, 1.736105, 1.388086, 1, 1, 1, 1, 1,
-0.1840619, 1.678242, -1.988081, 1, 1, 1, 1, 1,
-0.1832104, 0.4981451, -0.4535657, 1, 1, 1, 1, 1,
-0.1784382, 0.3610044, 0.1457647, 1, 1, 1, 1, 1,
-0.1782667, -0.7133587, -3.780539, 1, 1, 1, 1, 1,
-0.1723433, -0.7423719, -4.53863, 1, 1, 1, 1, 1,
-0.1721688, 0.0869675, -0.9042795, 1, 1, 1, 1, 1,
-0.1710514, -0.5021479, -2.671707, 1, 1, 1, 1, 1,
-0.1651427, 1.469326, 0.9854399, 1, 1, 1, 1, 1,
-0.1614294, 0.4512547, -1.289335, 1, 1, 1, 1, 1,
-0.1540788, 0.4964789, 0.8075357, 1, 1, 1, 1, 1,
-0.1525542, -0.6795396, -2.426101, 1, 1, 1, 1, 1,
-0.1497563, 1.253258, -0.1059261, 1, 1, 1, 1, 1,
-0.1374087, -0.573243, -1.534017, 1, 1, 1, 1, 1,
-0.1367033, 0.2721834, -0.7663354, 0, 0, 1, 1, 1,
-0.136263, 0.9472989, 0.9950913, 1, 0, 0, 1, 1,
-0.136188, -0.5753985, -3.724032, 1, 0, 0, 1, 1,
-0.1324991, -0.7284999, -1.51091, 1, 0, 0, 1, 1,
-0.1320115, -1.033692, -2.216761, 1, 0, 0, 1, 1,
-0.1311957, 0.8042715, -0.5032311, 1, 0, 0, 1, 1,
-0.1292015, 0.1431334, -0.2594327, 0, 0, 0, 1, 1,
-0.1266948, -0.4908957, -2.086586, 0, 0, 0, 1, 1,
-0.1260324, -0.3381468, -3.078043, 0, 0, 0, 1, 1,
-0.1242063, -0.1500914, -3.265833, 0, 0, 0, 1, 1,
-0.1216625, 1.374557, -1.18748, 0, 0, 0, 1, 1,
-0.1216377, -0.2623065, -3.16531, 0, 0, 0, 1, 1,
-0.1206257, -1.052213, -2.894043, 0, 0, 0, 1, 1,
-0.1192998, 0.7933567, -1.889536, 1, 1, 1, 1, 1,
-0.1180782, -0.3443222, -3.304219, 1, 1, 1, 1, 1,
-0.1176871, -0.9638559, -1.672105, 1, 1, 1, 1, 1,
-0.1167692, 1.84739, 0.2882759, 1, 1, 1, 1, 1,
-0.1098824, 0.6978583, 0.136408, 1, 1, 1, 1, 1,
-0.1087741, -0.2660016, -4.675992, 1, 1, 1, 1, 1,
-0.1057029, 0.4353811, 1.290533, 1, 1, 1, 1, 1,
-0.1047876, 0.2261427, 0.0179196, 1, 1, 1, 1, 1,
-0.1039954, -0.3641023, -2.811802, 1, 1, 1, 1, 1,
-0.1020998, 1.149506, -3.31363, 1, 1, 1, 1, 1,
-0.09972624, -0.683699, -3.353483, 1, 1, 1, 1, 1,
-0.09657452, -1.228778, -2.547956, 1, 1, 1, 1, 1,
-0.09224955, 1.982431, 0.8425831, 1, 1, 1, 1, 1,
-0.09069633, -1.850956, -4.261021, 1, 1, 1, 1, 1,
-0.08882491, -0.4216395, -2.74832, 1, 1, 1, 1, 1,
-0.08781491, -0.2113891, -2.981559, 0, 0, 1, 1, 1,
-0.08684698, -0.4716855, -2.763807, 1, 0, 0, 1, 1,
-0.08341452, -0.3361909, -3.947472, 1, 0, 0, 1, 1,
-0.0826802, -0.4128658, -1.705515, 1, 0, 0, 1, 1,
-0.08226168, 0.7615085, 0.05474019, 1, 0, 0, 1, 1,
-0.08065351, -2.54554, -3.929676, 1, 0, 0, 1, 1,
-0.07888787, 0.1198803, -0.0653816, 0, 0, 0, 1, 1,
-0.07473049, -1.206829, -1.89026, 0, 0, 0, 1, 1,
-0.06682965, 0.7387638, -0.4797522, 0, 0, 0, 1, 1,
-0.06429445, -0.8296564, -0.287622, 0, 0, 0, 1, 1,
-0.06114047, 0.3919923, -0.8622202, 0, 0, 0, 1, 1,
-0.06082269, 0.9363958, 1.193847, 0, 0, 0, 1, 1,
-0.06063624, 1.04893, 0.04964285, 0, 0, 0, 1, 1,
-0.05909779, 1.039858, 0.9732733, 1, 1, 1, 1, 1,
-0.05623718, 1.004443, -1.636088, 1, 1, 1, 1, 1,
-0.04863818, -1.389467, -3.365473, 1, 1, 1, 1, 1,
-0.04846319, 1.935902, 0.7476897, 1, 1, 1, 1, 1,
-0.03891077, -0.006725639, -1.086346, 1, 1, 1, 1, 1,
-0.0384724, -1.545908, -3.149941, 1, 1, 1, 1, 1,
-0.03809757, 0.8234982, 1.586208, 1, 1, 1, 1, 1,
-0.03664042, -0.6336921, -3.230345, 1, 1, 1, 1, 1,
-0.02956886, 0.305373, 0.9808326, 1, 1, 1, 1, 1,
-0.02420209, 0.3198376, 0.3988714, 1, 1, 1, 1, 1,
-0.02339748, 0.3179656, 1.505649, 1, 1, 1, 1, 1,
-0.01793023, -0.2506347, -3.494228, 1, 1, 1, 1, 1,
-0.01252789, 0.8468896, 0.1053723, 1, 1, 1, 1, 1,
-0.01213357, -0.1178347, -2.006188, 1, 1, 1, 1, 1,
-0.006449388, -1.224621, -5.023125, 1, 1, 1, 1, 1,
0.0003907649, 0.2177234, -1.629704, 0, 0, 1, 1, 1,
0.001327637, 0.7511272, 0.7341999, 1, 0, 0, 1, 1,
0.008345647, 0.3013078, 0.05984987, 1, 0, 0, 1, 1,
0.01290884, 0.6888488, -0.48977, 1, 0, 0, 1, 1,
0.01780997, 0.3724053, 1.420928, 1, 0, 0, 1, 1,
0.01825555, -0.3177172, 2.697521, 1, 0, 0, 1, 1,
0.02014995, -0.8466619, 1.906602, 0, 0, 0, 1, 1,
0.02171682, -0.2156564, 3.276842, 0, 0, 0, 1, 1,
0.02577593, -0.320285, 3.023917, 0, 0, 0, 1, 1,
0.02778731, -0.7631865, 3.189238, 0, 0, 0, 1, 1,
0.02870756, -1.697321, 3.534867, 0, 0, 0, 1, 1,
0.02912655, -0.4257542, 3.388066, 0, 0, 0, 1, 1,
0.02981634, 1.526636, 1.100085, 0, 0, 0, 1, 1,
0.036422, -1.281653, 4.438879, 1, 1, 1, 1, 1,
0.03855953, 0.7028194, 0.3682672, 1, 1, 1, 1, 1,
0.03864659, 1.511672, -0.7244501, 1, 1, 1, 1, 1,
0.04074916, -1.339716, 0.7452207, 1, 1, 1, 1, 1,
0.04315162, -0.01462832, 3.603543, 1, 1, 1, 1, 1,
0.04456576, 1.80187, 1.045534, 1, 1, 1, 1, 1,
0.04561453, 1.413656, -1.568821, 1, 1, 1, 1, 1,
0.04571402, 1.906608, 1.200231, 1, 1, 1, 1, 1,
0.0462024, 0.7374289, -0.1360365, 1, 1, 1, 1, 1,
0.05116352, 1.02053, 0.5354259, 1, 1, 1, 1, 1,
0.05497136, -0.5433667, 4.006105, 1, 1, 1, 1, 1,
0.0553367, 1.423304, 0.09943771, 1, 1, 1, 1, 1,
0.05677911, 0.2653079, 0.6636912, 1, 1, 1, 1, 1,
0.05801339, 0.5692206, -0.6378216, 1, 1, 1, 1, 1,
0.05822608, 0.01190941, -0.07222804, 1, 1, 1, 1, 1,
0.06213302, 0.4257451, 0.5940078, 0, 0, 1, 1, 1,
0.0786633, -0.3075572, 1.464549, 1, 0, 0, 1, 1,
0.08354936, -0.2576765, 3.596156, 1, 0, 0, 1, 1,
0.08408903, 0.8801959, 1.217186, 1, 0, 0, 1, 1,
0.08411666, -0.5196408, 3.237134, 1, 0, 0, 1, 1,
0.08490886, -0.2075562, 2.805319, 1, 0, 0, 1, 1,
0.08491981, 1.327245, 0.8074918, 0, 0, 0, 1, 1,
0.08804325, -0.05294362, 2.703246, 0, 0, 0, 1, 1,
0.09067346, 0.4886538, -0.193671, 0, 0, 0, 1, 1,
0.09218457, -2.057782, 2.918783, 0, 0, 0, 1, 1,
0.09784296, -1.427907, 2.74274, 0, 0, 0, 1, 1,
0.09839626, -0.07990945, 0.9251395, 0, 0, 0, 1, 1,
0.1030908, 1.310035, 0.8181505, 0, 0, 0, 1, 1,
0.1155924, 0.4058031, -1.027848, 1, 1, 1, 1, 1,
0.1166383, 0.3541994, 0.8987523, 1, 1, 1, 1, 1,
0.1215498, -0.6955009, 2.38958, 1, 1, 1, 1, 1,
0.1219623, -0.5444248, 2.425354, 1, 1, 1, 1, 1,
0.124002, -0.06765074, 2.997753, 1, 1, 1, 1, 1,
0.1261263, -1.295445, 3.002787, 1, 1, 1, 1, 1,
0.1276956, 0.1739775, 0.1177218, 1, 1, 1, 1, 1,
0.1311615, -1.207197, 1.909823, 1, 1, 1, 1, 1,
0.133719, 1.31053, 2.597725, 1, 1, 1, 1, 1,
0.1352525, -0.750558, 4.120011, 1, 1, 1, 1, 1,
0.1359567, 0.3907827, 1.213127, 1, 1, 1, 1, 1,
0.1400311, -0.5692564, 1.787724, 1, 1, 1, 1, 1,
0.1481244, -1.417981, 2.422728, 1, 1, 1, 1, 1,
0.1484369, 1.138828, 0.2709785, 1, 1, 1, 1, 1,
0.1527407, 1.51903, -0.1672579, 1, 1, 1, 1, 1,
0.1565809, 0.05137282, 2.109425, 0, 0, 1, 1, 1,
0.1617243, 0.01242925, 1.317133, 1, 0, 0, 1, 1,
0.1619721, 0.05214191, 2.340571, 1, 0, 0, 1, 1,
0.1653149, 0.8430074, -0.3796977, 1, 0, 0, 1, 1,
0.1668594, 1.332637, 0.853358, 1, 0, 0, 1, 1,
0.1687379, -0.3487279, 2.11504, 1, 0, 0, 1, 1,
0.1719172, 0.05876756, -0.2044774, 0, 0, 0, 1, 1,
0.1725826, 1.681477, 0.6451991, 0, 0, 0, 1, 1,
0.1775961, 0.3970024, -0.19949, 0, 0, 0, 1, 1,
0.1781573, -1.014969, 3.580438, 0, 0, 0, 1, 1,
0.1795208, 0.5926403, 1.353255, 0, 0, 0, 1, 1,
0.1811337, 0.3100395, 1.129162, 0, 0, 0, 1, 1,
0.1814693, -0.3443441, 3.790001, 0, 0, 0, 1, 1,
0.1819216, -1.393779, 1.760925, 1, 1, 1, 1, 1,
0.1822705, -0.4032482, 3.171972, 1, 1, 1, 1, 1,
0.1917121, 1.515556, 1.353986, 1, 1, 1, 1, 1,
0.1931852, -0.4257946, 2.947731, 1, 1, 1, 1, 1,
0.2087516, -0.06699847, 2.475357, 1, 1, 1, 1, 1,
0.2088946, 0.3007342, -0.4753883, 1, 1, 1, 1, 1,
0.2119132, 0.002960042, -0.1796438, 1, 1, 1, 1, 1,
0.2138287, -0.9505065, 2.25791, 1, 1, 1, 1, 1,
0.2159233, -0.9174162, 2.999328, 1, 1, 1, 1, 1,
0.2170676, 0.6572499, 0.8541282, 1, 1, 1, 1, 1,
0.2179045, 1.603331, 0.6831343, 1, 1, 1, 1, 1,
0.2233998, 1.366509, -0.4239716, 1, 1, 1, 1, 1,
0.224592, -0.1561282, 2.380498, 1, 1, 1, 1, 1,
0.2248702, -2.909557, 1.556725, 1, 1, 1, 1, 1,
0.2262787, 0.9097068, -0.4858176, 1, 1, 1, 1, 1,
0.2266648, -1.746487, 2.472143, 0, 0, 1, 1, 1,
0.2323231, -0.4375279, 1.985664, 1, 0, 0, 1, 1,
0.2342044, 1.413216, 0.053253, 1, 0, 0, 1, 1,
0.2353514, -0.2238025, 1.954176, 1, 0, 0, 1, 1,
0.237292, -0.975701, 1.837952, 1, 0, 0, 1, 1,
0.2376876, -0.4414596, 4.120466, 1, 0, 0, 1, 1,
0.24433, 0.8667455, -2.338377, 0, 0, 0, 1, 1,
0.2464036, -1.135335, 3.423353, 0, 0, 0, 1, 1,
0.2478911, 1.013022, -1.363711, 0, 0, 0, 1, 1,
0.2489036, -0.178552, 0.3578626, 0, 0, 0, 1, 1,
0.2502003, 0.7434599, 0.5752807, 0, 0, 0, 1, 1,
0.2521484, -1.376643, 3.270604, 0, 0, 0, 1, 1,
0.2563636, 0.2907367, -0.09082417, 0, 0, 0, 1, 1,
0.2591035, 1.149949, -1.446311, 1, 1, 1, 1, 1,
0.2654649, -1.459321, 3.165456, 1, 1, 1, 1, 1,
0.2682976, 1.266307, 1.47058, 1, 1, 1, 1, 1,
0.2691487, -0.1264713, 3.258249, 1, 1, 1, 1, 1,
0.2722333, 0.7767473, 1.774552, 1, 1, 1, 1, 1,
0.2733592, -0.8302748, 0.5618583, 1, 1, 1, 1, 1,
0.2760247, -0.4596429, 2.676191, 1, 1, 1, 1, 1,
0.278002, 0.3869575, -0.03555703, 1, 1, 1, 1, 1,
0.2790493, -1.461303, 3.920756, 1, 1, 1, 1, 1,
0.2824678, -0.7676178, 0.1873227, 1, 1, 1, 1, 1,
0.2873706, -1.419634, 2.745455, 1, 1, 1, 1, 1,
0.2919367, -0.9885825, 3.289716, 1, 1, 1, 1, 1,
0.2929654, 0.07343671, 2.418632, 1, 1, 1, 1, 1,
0.2957709, -0.2034182, 1.937226, 1, 1, 1, 1, 1,
0.2959538, 1.475735, -0.6645743, 1, 1, 1, 1, 1,
0.3007545, -0.6524613, 1.028981, 0, 0, 1, 1, 1,
0.3010241, -0.06992628, 0.5657584, 1, 0, 0, 1, 1,
0.3017567, -1.210417, 1.967246, 1, 0, 0, 1, 1,
0.3034911, -0.04816564, 2.366596, 1, 0, 0, 1, 1,
0.3057785, 0.1451671, 2.11704, 1, 0, 0, 1, 1,
0.3067798, 1.258293, 1.269701, 1, 0, 0, 1, 1,
0.3086222, 0.1718805, 1.669184, 0, 0, 0, 1, 1,
0.3092416, 1.297875, -0.4443404, 0, 0, 0, 1, 1,
0.3095464, 0.1275147, 1.821546, 0, 0, 0, 1, 1,
0.3104021, 1.730608, 0.00799366, 0, 0, 0, 1, 1,
0.3131573, -1.001595, 3.013366, 0, 0, 0, 1, 1,
0.3150854, -1.857525, 2.742534, 0, 0, 0, 1, 1,
0.3184948, 0.6024067, 0.2759745, 0, 0, 0, 1, 1,
0.3261522, -0.4675639, 2.47113, 1, 1, 1, 1, 1,
0.3268379, -0.6927046, 3.016217, 1, 1, 1, 1, 1,
0.3272535, 0.8251194, -0.6387509, 1, 1, 1, 1, 1,
0.3297513, 0.7564659, 0.4827702, 1, 1, 1, 1, 1,
0.3307363, 1.340528, -1.115191, 1, 1, 1, 1, 1,
0.3338831, -2.171158, 0.4216324, 1, 1, 1, 1, 1,
0.3388955, 0.4191048, 0.7266772, 1, 1, 1, 1, 1,
0.3422835, 0.02663658, 0.4635381, 1, 1, 1, 1, 1,
0.3426304, 1.122101, 1.153797, 1, 1, 1, 1, 1,
0.3463462, 2.515534, -0.1110164, 1, 1, 1, 1, 1,
0.3467715, -0.3685214, 2.479465, 1, 1, 1, 1, 1,
0.3524632, 0.428804, 1.079829, 1, 1, 1, 1, 1,
0.3529876, -1.200959, 3.31964, 1, 1, 1, 1, 1,
0.3542892, 0.1436593, 1.739698, 1, 1, 1, 1, 1,
0.3558565, 0.68825, 0.5791784, 1, 1, 1, 1, 1,
0.3627898, 0.4199056, 0.2985266, 0, 0, 1, 1, 1,
0.3665236, -0.9394483, 2.615844, 1, 0, 0, 1, 1,
0.3680091, 2.753491, 0.5053619, 1, 0, 0, 1, 1,
0.3713035, -1.708265, 2.740041, 1, 0, 0, 1, 1,
0.3720564, -1.410852, 3.615984, 1, 0, 0, 1, 1,
0.3722902, 1.844026, 0.3920928, 1, 0, 0, 1, 1,
0.3744904, 0.4630859, 1.666916, 0, 0, 0, 1, 1,
0.3787346, -0.3560896, 2.967985, 0, 0, 0, 1, 1,
0.3796887, 0.9887946, 1.851849, 0, 0, 0, 1, 1,
0.3806582, -0.585464, 3.867274, 0, 0, 0, 1, 1,
0.3825022, -0.7088524, 1.192194, 0, 0, 0, 1, 1,
0.3838907, 0.8701452, 0.7496388, 0, 0, 0, 1, 1,
0.3839561, -1.023335, 4.360699, 0, 0, 0, 1, 1,
0.3862972, 0.09599254, 0.2215732, 1, 1, 1, 1, 1,
0.3912642, -2.130741, 3.494285, 1, 1, 1, 1, 1,
0.3913672, -0.6899921, 1.134783, 1, 1, 1, 1, 1,
0.3914481, 0.9870211, 0.04529228, 1, 1, 1, 1, 1,
0.3922555, -1.908485, 1.569638, 1, 1, 1, 1, 1,
0.3946722, -0.6522617, 2.439994, 1, 1, 1, 1, 1,
0.4044728, -0.835849, 4.250914, 1, 1, 1, 1, 1,
0.4078405, 0.5975043, -0.2440039, 1, 1, 1, 1, 1,
0.4078889, -0.7025788, 0.7290517, 1, 1, 1, 1, 1,
0.4219021, 1.28251, -1.39875, 1, 1, 1, 1, 1,
0.4254158, -1.790732, 2.948678, 1, 1, 1, 1, 1,
0.4261264, 0.4181054, -0.9927421, 1, 1, 1, 1, 1,
0.4360184, 0.2381604, 0.0955449, 1, 1, 1, 1, 1,
0.4384799, -0.2599361, 2.603769, 1, 1, 1, 1, 1,
0.4400561, -0.1684477, 1.982172, 1, 1, 1, 1, 1,
0.4402814, -0.6295964, 2.172408, 0, 0, 1, 1, 1,
0.4426222, 0.8966725, 0.9786397, 1, 0, 0, 1, 1,
0.4428646, 2.002348, -1.474874, 1, 0, 0, 1, 1,
0.4433686, 1.325146, 0.9366014, 1, 0, 0, 1, 1,
0.4446482, 0.4094753, 1.037267, 1, 0, 0, 1, 1,
0.4526654, 0.07352404, 3.172072, 1, 0, 0, 1, 1,
0.4533495, 0.2154301, 1.578342, 0, 0, 0, 1, 1,
0.4533942, -0.1527943, 2.07115, 0, 0, 0, 1, 1,
0.4580153, -1.194581, 2.435335, 0, 0, 0, 1, 1,
0.4614767, 0.549346, 0.3847367, 0, 0, 0, 1, 1,
0.4644259, 0.3832904, 1.022057, 0, 0, 0, 1, 1,
0.465504, 1.138608, 1.200402, 0, 0, 0, 1, 1,
0.4682852, 0.2747704, 1.250498, 0, 0, 0, 1, 1,
0.4702055, 0.8271343, 0.7470974, 1, 1, 1, 1, 1,
0.4743294, 0.536408, 0.7539355, 1, 1, 1, 1, 1,
0.4749806, -2.650722, 4.079071, 1, 1, 1, 1, 1,
0.4796317, 1.985852, -1.065208, 1, 1, 1, 1, 1,
0.4938725, 1.185122, 0.7562508, 1, 1, 1, 1, 1,
0.5003321, -1.626307, 2.374223, 1, 1, 1, 1, 1,
0.503027, 1.881376, -0.4710135, 1, 1, 1, 1, 1,
0.5044954, -0.8148859, 1.420335, 1, 1, 1, 1, 1,
0.5057781, -0.8385431, 3.350112, 1, 1, 1, 1, 1,
0.5097881, -1.471119, 2.718113, 1, 1, 1, 1, 1,
0.5166915, -0.4182275, 3.031626, 1, 1, 1, 1, 1,
0.5179985, 0.232119, 1.230469, 1, 1, 1, 1, 1,
0.5202072, -0.7232721, 2.146423, 1, 1, 1, 1, 1,
0.5204791, 0.4536408, -0.8398459, 1, 1, 1, 1, 1,
0.5248402, -1.62971, 2.86422, 1, 1, 1, 1, 1,
0.5253868, 0.6245838, 0.05124694, 0, 0, 1, 1, 1,
0.5300431, 1.378642, 1.238074, 1, 0, 0, 1, 1,
0.5303631, -1.832283, 2.42626, 1, 0, 0, 1, 1,
0.5310367, 0.6655139, 1.214758, 1, 0, 0, 1, 1,
0.5324661, 0.6506209, -0.1173516, 1, 0, 0, 1, 1,
0.5341586, -1.279207, 3.797791, 1, 0, 0, 1, 1,
0.5356416, -0.1423945, 2.269875, 0, 0, 0, 1, 1,
0.5380338, 1.571767, -0.3552849, 0, 0, 0, 1, 1,
0.548413, -0.1818128, 1.244436, 0, 0, 0, 1, 1,
0.5510492, 0.9927711, 1.028959, 0, 0, 0, 1, 1,
0.5518734, -0.3826091, 2.109854, 0, 0, 0, 1, 1,
0.5553637, -0.6371486, 1.371814, 0, 0, 0, 1, 1,
0.5569983, 0.1991845, -0.3500639, 0, 0, 0, 1, 1,
0.5626174, -1.128943, 3.249154, 1, 1, 1, 1, 1,
0.5629521, -0.2438994, 3.072737, 1, 1, 1, 1, 1,
0.5657398, -0.715076, 2.435549, 1, 1, 1, 1, 1,
0.5658673, -1.240181, 2.137071, 1, 1, 1, 1, 1,
0.5677302, 0.3401854, 1.559967, 1, 1, 1, 1, 1,
0.5719774, 0.6445454, 1.224775, 1, 1, 1, 1, 1,
0.5774, -0.1045502, 2.085298, 1, 1, 1, 1, 1,
0.5795142, 0.1872265, 0.06197929, 1, 1, 1, 1, 1,
0.5806519, -1.506736, 3.247104, 1, 1, 1, 1, 1,
0.5827924, 1.428868, -0.1356604, 1, 1, 1, 1, 1,
0.5837798, 0.8316323, 0.786866, 1, 1, 1, 1, 1,
0.5859336, 1.047844, 1.283288, 1, 1, 1, 1, 1,
0.5863206, -1.234249, 2.66295, 1, 1, 1, 1, 1,
0.5866174, -1.455178, 3.837135, 1, 1, 1, 1, 1,
0.5907901, -0.6202185, 3.026815, 1, 1, 1, 1, 1,
0.5955622, 1.638526, 0.2596761, 0, 0, 1, 1, 1,
0.5978558, 0.8947673, 0.1416387, 1, 0, 0, 1, 1,
0.6168074, -1.950007, 0.6302181, 1, 0, 0, 1, 1,
0.6178673, 0.09645292, 1.149318, 1, 0, 0, 1, 1,
0.6217681, -0.8204103, 1.14491, 1, 0, 0, 1, 1,
0.6231062, 0.5065464, 2.072622, 1, 0, 0, 1, 1,
0.6238887, -1.02103, 2.336902, 0, 0, 0, 1, 1,
0.6335169, 0.6040236, 0.4888116, 0, 0, 0, 1, 1,
0.6349548, -0.2563941, 1.363276, 0, 0, 0, 1, 1,
0.6404169, 0.6415815, -0.8046849, 0, 0, 0, 1, 1,
0.6421055, 0.7819164, -0.3970402, 0, 0, 0, 1, 1,
0.6421264, 0.08789688, 1.124456, 0, 0, 0, 1, 1,
0.6432604, 0.1371447, -0.7586488, 0, 0, 0, 1, 1,
0.650645, 1.545772, 0.7180935, 1, 1, 1, 1, 1,
0.6527711, 1.822146, 0.5909822, 1, 1, 1, 1, 1,
0.6527902, 0.5249642, 0.09901027, 1, 1, 1, 1, 1,
0.654545, 0.06164403, 2.011608, 1, 1, 1, 1, 1,
0.6588645, 0.1553846, 0.9552367, 1, 1, 1, 1, 1,
0.6602774, -1.328629, 3.565463, 1, 1, 1, 1, 1,
0.6604831, 0.1626829, 1.495576, 1, 1, 1, 1, 1,
0.6612899, 0.05864066, 1.164013, 1, 1, 1, 1, 1,
0.6649559, 0.1832366, -0.234417, 1, 1, 1, 1, 1,
0.665707, 1.066706, -0.2236861, 1, 1, 1, 1, 1,
0.6682249, -0.894926, 1.97429, 1, 1, 1, 1, 1,
0.6710159, -0.1524557, 0.8954796, 1, 1, 1, 1, 1,
0.6718526, 0.7270099, 1.238463, 1, 1, 1, 1, 1,
0.6767343, -0.9367439, 1.027854, 1, 1, 1, 1, 1,
0.6831706, 0.6546462, 1.144498, 1, 1, 1, 1, 1,
0.6847879, -1.048967, 2.34533, 0, 0, 1, 1, 1,
0.6916907, 1.639477, -0.8330579, 1, 0, 0, 1, 1,
0.6941355, -0.6687173, 3.147571, 1, 0, 0, 1, 1,
0.6990478, -0.244622, 2.644668, 1, 0, 0, 1, 1,
0.7044486, -0.5250695, 2.653177, 1, 0, 0, 1, 1,
0.7059133, 0.29258, 0.7992554, 1, 0, 0, 1, 1,
0.7071937, 0.1598139, 0.37479, 0, 0, 0, 1, 1,
0.7094809, 1.435213, 0.8122134, 0, 0, 0, 1, 1,
0.7099172, -0.8085694, 1.681589, 0, 0, 0, 1, 1,
0.714554, -1.243664, 3.720449, 0, 0, 0, 1, 1,
0.7146963, 0.8087183, 2.755042, 0, 0, 0, 1, 1,
0.7193959, -2.229901, 1.541793, 0, 0, 0, 1, 1,
0.7212485, 0.3317685, 1.053359, 0, 0, 0, 1, 1,
0.7218819, 1.042769, 2.471418, 1, 1, 1, 1, 1,
0.7264754, -0.4717767, 2.081343, 1, 1, 1, 1, 1,
0.72843, 1.012871, 0.3496478, 1, 1, 1, 1, 1,
0.7345217, 0.7853831, -1.356201, 1, 1, 1, 1, 1,
0.7346179, 0.4925693, 1.450219, 1, 1, 1, 1, 1,
0.7351222, -0.1850562, 2.375648, 1, 1, 1, 1, 1,
0.7409812, -1.078704, 4.11031, 1, 1, 1, 1, 1,
0.7415128, 1.154891, -0.320888, 1, 1, 1, 1, 1,
0.7475041, -0.7506914, 1.117759, 1, 1, 1, 1, 1,
0.7480232, -0.144711, 2.494961, 1, 1, 1, 1, 1,
0.7518138, 0.2320639, 2.89285, 1, 1, 1, 1, 1,
0.7527128, -0.3914323, 1.779759, 1, 1, 1, 1, 1,
0.7554584, 1.077379, -0.5178275, 1, 1, 1, 1, 1,
0.7574623, -0.6343002, 3.418427, 1, 1, 1, 1, 1,
0.7714544, 0.02833637, 1.513993, 1, 1, 1, 1, 1,
0.7716002, -0.8032648, 2.827738, 0, 0, 1, 1, 1,
0.7719603, -0.7662885, 2.351771, 1, 0, 0, 1, 1,
0.7790212, -1.111292, 4.540068, 1, 0, 0, 1, 1,
0.7790304, 2.030821, 0.5731764, 1, 0, 0, 1, 1,
0.7792587, -0.3252249, 3.488065, 1, 0, 0, 1, 1,
0.7797528, 0.814204, 0.5511002, 1, 0, 0, 1, 1,
0.7800687, 0.7871873, 1.559398, 0, 0, 0, 1, 1,
0.7913779, -0.8753279, 1.658913, 0, 0, 0, 1, 1,
0.7983739, -1.503225, 2.839531, 0, 0, 0, 1, 1,
0.8061834, -1.706459, 1.826527, 0, 0, 0, 1, 1,
0.8100123, -0.3835308, 0.8504589, 0, 0, 0, 1, 1,
0.8117344, -1.664264, 2.523042, 0, 0, 0, 1, 1,
0.8194089, -0.2280225, 2.290334, 0, 0, 0, 1, 1,
0.820541, 0.5066499, 0.9222934, 1, 1, 1, 1, 1,
0.8212079, 1.931091, -0.1744152, 1, 1, 1, 1, 1,
0.824481, -0.8893539, 1.988218, 1, 1, 1, 1, 1,
0.830102, -1.386771, 2.258113, 1, 1, 1, 1, 1,
0.833589, -0.3823317, 2.744897, 1, 1, 1, 1, 1,
0.8339195, 0.1215441, 1.238818, 1, 1, 1, 1, 1,
0.8354604, -1.467612, 3.288216, 1, 1, 1, 1, 1,
0.8409074, 0.9848696, 1.757967, 1, 1, 1, 1, 1,
0.8411237, 1.382141, 2.218166, 1, 1, 1, 1, 1,
0.8518061, 0.9175941, 1.759603, 1, 1, 1, 1, 1,
0.8519249, 0.6451018, 2.840436, 1, 1, 1, 1, 1,
0.8577888, -2.663232, 2.942082, 1, 1, 1, 1, 1,
0.8714604, -0.09707578, 2.478423, 1, 1, 1, 1, 1,
0.8748618, 0.793398, 0.693942, 1, 1, 1, 1, 1,
0.8759629, 0.6146412, 1.541887, 1, 1, 1, 1, 1,
0.8777939, -0.08422764, 1.26475, 0, 0, 1, 1, 1,
0.8801743, -0.02712434, 2.758033, 1, 0, 0, 1, 1,
0.8868178, 0.1235324, 2.570824, 1, 0, 0, 1, 1,
0.8892586, 0.142571, 2.320294, 1, 0, 0, 1, 1,
0.8892719, -0.9095119, 3.126001, 1, 0, 0, 1, 1,
0.8893886, 0.5062612, 0.05749011, 1, 0, 0, 1, 1,
0.8923208, 0.2430898, 2.580772, 0, 0, 0, 1, 1,
0.8970466, -0.4854008, 2.924941, 0, 0, 0, 1, 1,
0.9007993, -0.8138628, -0.2884598, 0, 0, 0, 1, 1,
0.9059587, 0.1307056, 1.971255, 0, 0, 0, 1, 1,
0.9146246, -0.2284544, 2.999752, 0, 0, 0, 1, 1,
0.918103, 0.9055998, 1.126477, 0, 0, 0, 1, 1,
0.9193271, -1.597084, 4.542319, 0, 0, 0, 1, 1,
0.9205238, 1.338782, -0.1314591, 1, 1, 1, 1, 1,
0.9258291, -0.2660562, 2.205693, 1, 1, 1, 1, 1,
0.9258621, 0.3710445, 1.12728, 1, 1, 1, 1, 1,
0.926245, -0.3546694, 1.595688, 1, 1, 1, 1, 1,
0.9266024, 0.5328841, 0.9102558, 1, 1, 1, 1, 1,
0.9292697, -1.013019, 3.692441, 1, 1, 1, 1, 1,
0.9298453, -1.556381, 3.685936, 1, 1, 1, 1, 1,
0.9392105, 1.019949, -1.829336, 1, 1, 1, 1, 1,
0.9408281, 1.244629, 1.327453, 1, 1, 1, 1, 1,
0.9408854, -0.1612714, 0.00997428, 1, 1, 1, 1, 1,
0.9416574, 0.05645335, 2.107667, 1, 1, 1, 1, 1,
0.9449858, -0.025509, 3.403997, 1, 1, 1, 1, 1,
0.9530969, -0.7648667, 3.76839, 1, 1, 1, 1, 1,
0.9552191, 1.397006, 2.028544, 1, 1, 1, 1, 1,
0.9618354, -0.2020312, 1.985108, 1, 1, 1, 1, 1,
0.966284, 0.03459534, 0.7677346, 0, 0, 1, 1, 1,
0.9684147, 0.605297, -0.3809657, 1, 0, 0, 1, 1,
0.9697961, -0.4936165, 2.776993, 1, 0, 0, 1, 1,
0.9702648, 0.9602821, 1.419237, 1, 0, 0, 1, 1,
0.9746104, 0.05517583, 1.699375, 1, 0, 0, 1, 1,
0.9753343, -0.9744098, 1.465741, 1, 0, 0, 1, 1,
0.9772334, -0.2868397, 0.51985, 0, 0, 0, 1, 1,
0.9817684, 0.4826118, 1.766992, 0, 0, 0, 1, 1,
0.984386, -1.089203, 2.246909, 0, 0, 0, 1, 1,
0.9868584, 0.02597684, -0.1511189, 0, 0, 0, 1, 1,
0.9896842, 0.285724, -0.09858481, 0, 0, 0, 1, 1,
0.9915834, 0.9389396, 1.157167, 0, 0, 0, 1, 1,
0.994143, -0.432233, 2.427344, 0, 0, 0, 1, 1,
1.001152, -0.1052323, 2.45227, 1, 1, 1, 1, 1,
1.001277, 0.4841753, -0.3010789, 1, 1, 1, 1, 1,
1.009086, -0.7731829, 2.876298, 1, 1, 1, 1, 1,
1.010263, -0.2114176, 0.6503317, 1, 1, 1, 1, 1,
1.023189, 0.7497182, -0.2113783, 1, 1, 1, 1, 1,
1.026736, -0.8669844, 4.072645, 1, 1, 1, 1, 1,
1.029583, -1.468841, 2.206576, 1, 1, 1, 1, 1,
1.038511, -0.7073674, 3.769108, 1, 1, 1, 1, 1,
1.046844, -0.4221407, 0.111947, 1, 1, 1, 1, 1,
1.048012, -0.06977655, 0.9517335, 1, 1, 1, 1, 1,
1.050404, -1.407846, 2.800778, 1, 1, 1, 1, 1,
1.052113, -0.2817011, 2.304099, 1, 1, 1, 1, 1,
1.052736, 1.119913, 1.101964, 1, 1, 1, 1, 1,
1.053833, -1.65479, 2.721684, 1, 1, 1, 1, 1,
1.059086, 0.2587174, -0.6676946, 1, 1, 1, 1, 1,
1.061592, 0.09652867, -0.2037653, 0, 0, 1, 1, 1,
1.061757, -0.1848384, 2.714789, 1, 0, 0, 1, 1,
1.065209, 0.2466835, 0.7796754, 1, 0, 0, 1, 1,
1.068933, 0.5367979, 0.3214855, 1, 0, 0, 1, 1,
1.073895, 1.733854, 0.9087299, 1, 0, 0, 1, 1,
1.079912, -0.04167679, 2.168054, 1, 0, 0, 1, 1,
1.088112, -0.622483, 2.169679, 0, 0, 0, 1, 1,
1.099739, 0.2860943, -1.070081, 0, 0, 0, 1, 1,
1.103531, 0.1579167, 0.6390141, 0, 0, 0, 1, 1,
1.108161, -0.6533923, 2.691252, 0, 0, 0, 1, 1,
1.111738, 0.1943319, 1.357591, 0, 0, 0, 1, 1,
1.113437, -0.0391525, 0.7903093, 0, 0, 0, 1, 1,
1.119178, 0.3502924, 2.427002, 0, 0, 0, 1, 1,
1.11944, 2.494945, 0.4749382, 1, 1, 1, 1, 1,
1.119498, 0.1807455, 0.3848162, 1, 1, 1, 1, 1,
1.121877, 0.4366135, 0.9575318, 1, 1, 1, 1, 1,
1.122104, -0.2887936, 1.928207, 1, 1, 1, 1, 1,
1.12228, -0.6139108, 1.463553, 1, 1, 1, 1, 1,
1.128534, -0.1715074, 1.041421, 1, 1, 1, 1, 1,
1.12974, -0.7009107, 1.915315, 1, 1, 1, 1, 1,
1.137431, -0.114177, 3.091485, 1, 1, 1, 1, 1,
1.170682, -0.8534709, 3.976802, 1, 1, 1, 1, 1,
1.172848, 1.02266, 0.4256402, 1, 1, 1, 1, 1,
1.183173, -0.8702285, 3.011706, 1, 1, 1, 1, 1,
1.188273, -0.97511, 3.387968, 1, 1, 1, 1, 1,
1.197298, 1.673835, 0.0003087592, 1, 1, 1, 1, 1,
1.198215, -1.001851, 2.310272, 1, 1, 1, 1, 1,
1.202497, -0.4661385, 1.860174, 1, 1, 1, 1, 1,
1.228349, 0.8298621, 1.353739, 0, 0, 1, 1, 1,
1.231967, -1.093485, 1.413059, 1, 0, 0, 1, 1,
1.232358, -0.7276158, 0.845718, 1, 0, 0, 1, 1,
1.233661, 0.8546996, 0.9925228, 1, 0, 0, 1, 1,
1.251758, -1.510224, 2.353739, 1, 0, 0, 1, 1,
1.252428, 0.09404727, 2.666235, 1, 0, 0, 1, 1,
1.265073, -0.1026081, 0.970976, 0, 0, 0, 1, 1,
1.265911, 0.3597348, 1.708865, 0, 0, 0, 1, 1,
1.275106, 0.1967377, 0.8715454, 0, 0, 0, 1, 1,
1.28877, -0.3081267, 1.684035, 0, 0, 0, 1, 1,
1.301306, -1.107507, 3.36872, 0, 0, 0, 1, 1,
1.309933, 0.9521513, 0.08120178, 0, 0, 0, 1, 1,
1.311507, 0.7462277, 0.925844, 0, 0, 0, 1, 1,
1.319638, 0.09594102, 1.325409, 1, 1, 1, 1, 1,
1.339889, 0.3322547, 0.02763424, 1, 1, 1, 1, 1,
1.345275, 0.7390178, 0.5208336, 1, 1, 1, 1, 1,
1.356702, -0.2115335, 3.068505, 1, 1, 1, 1, 1,
1.359681, -1.854682, 3.605582, 1, 1, 1, 1, 1,
1.379378, 0.1875883, 2.033896, 1, 1, 1, 1, 1,
1.390764, -0.6854526, 2.27838, 1, 1, 1, 1, 1,
1.391598, -0.6409502, 1.526538, 1, 1, 1, 1, 1,
1.412013, -0.5906941, 3.363259, 1, 1, 1, 1, 1,
1.417455, 1.786855, 0.725435, 1, 1, 1, 1, 1,
1.426258, -0.08863395, 1.577492, 1, 1, 1, 1, 1,
1.428461, -0.631361, 2.442384, 1, 1, 1, 1, 1,
1.43471, 0.05712668, 1.704565, 1, 1, 1, 1, 1,
1.439189, 0.02385278, 2.045524, 1, 1, 1, 1, 1,
1.445634, 0.3330826, 0.4587348, 1, 1, 1, 1, 1,
1.451128, -0.7196091, 2.216307, 0, 0, 1, 1, 1,
1.453462, -0.1715694, 1.443568, 1, 0, 0, 1, 1,
1.468811, 2.062076, 2.030312, 1, 0, 0, 1, 1,
1.471665, 1.139719, 0.4769026, 1, 0, 0, 1, 1,
1.472095, -0.9704297, 1.729972, 1, 0, 0, 1, 1,
1.478196, 1.01053, 0.0678477, 1, 0, 0, 1, 1,
1.487457, -0.8617256, 1.546685, 0, 0, 0, 1, 1,
1.494624, -2.021625, 2.808372, 0, 0, 0, 1, 1,
1.501263, 1.505711, -2.081562, 0, 0, 0, 1, 1,
1.510011, -0.2795272, 2.297078, 0, 0, 0, 1, 1,
1.512916, 0.03046067, 3.748309, 0, 0, 0, 1, 1,
1.514297, 1.411397, 1.789126, 0, 0, 0, 1, 1,
1.517913, -1.013132, 1.331276, 0, 0, 0, 1, 1,
1.526434, -0.4860692, 2.208679, 1, 1, 1, 1, 1,
1.544083, -1.14134, 1.325127, 1, 1, 1, 1, 1,
1.549351, 0.7722096, 1.388493, 1, 1, 1, 1, 1,
1.556032, 0.9390979, 4.471562, 1, 1, 1, 1, 1,
1.563501, -2.688455, 2.54545, 1, 1, 1, 1, 1,
1.564861, -1.717636, 2.514911, 1, 1, 1, 1, 1,
1.565563, -1.023941, 1.857899, 1, 1, 1, 1, 1,
1.569127, 0.9151325, 1.403357, 1, 1, 1, 1, 1,
1.580601, 0.4259996, 0.6484265, 1, 1, 1, 1, 1,
1.625589, -0.9441684, 1.228968, 1, 1, 1, 1, 1,
1.637814, -1.527107, 1.862365, 1, 1, 1, 1, 1,
1.654145, 2.405567, 0.1848802, 1, 1, 1, 1, 1,
1.661837, 1.34875, -0.1111537, 1, 1, 1, 1, 1,
1.66199, -1.251635, -1.153345, 1, 1, 1, 1, 1,
1.664144, -1.698375, 1.726208, 1, 1, 1, 1, 1,
1.688696, 0.7188667, 0.6544188, 0, 0, 1, 1, 1,
1.692623, 0.2804171, 2.544336, 1, 0, 0, 1, 1,
1.700145, -2.356379, 3.552885, 1, 0, 0, 1, 1,
1.708246, 1.215073, 0.130167, 1, 0, 0, 1, 1,
1.730621, 0.5452082, 0.6915071, 1, 0, 0, 1, 1,
1.731382, -0.722261, 0.1590926, 1, 0, 0, 1, 1,
1.733462, -0.4184363, 0.8705999, 0, 0, 0, 1, 1,
1.734605, -0.3115724, 1.770714, 0, 0, 0, 1, 1,
1.765852, 1.4527, 0.6436508, 0, 0, 0, 1, 1,
1.788147, -0.3534579, 1.786039, 0, 0, 0, 1, 1,
1.804954, 1.662756, 0.1924712, 0, 0, 0, 1, 1,
1.835175, 0.6461453, 0.9570135, 0, 0, 0, 1, 1,
1.849139, -1.116916, 2.141042, 0, 0, 0, 1, 1,
1.85217, 0.4276562, 0.5109676, 1, 1, 1, 1, 1,
1.854734, 0.4579213, 0.7520463, 1, 1, 1, 1, 1,
1.856212, 0.6024551, 5.163871, 1, 1, 1, 1, 1,
1.866561, 3.342915, 1.052779, 1, 1, 1, 1, 1,
1.893647, 0.1828726, 1.086288, 1, 1, 1, 1, 1,
1.906393, -1.022504, 3.074034, 1, 1, 1, 1, 1,
1.907114, 1.390488, 0.9069741, 1, 1, 1, 1, 1,
1.914448, 1.300628, 0.04377043, 1, 1, 1, 1, 1,
1.927156, -0.6675496, 2.054848, 1, 1, 1, 1, 1,
1.94006, 1.292825, -0.333602, 1, 1, 1, 1, 1,
1.944366, 1.537826, 0.5621325, 1, 1, 1, 1, 1,
1.955062, 0.2671166, 1.003104, 1, 1, 1, 1, 1,
1.961032, -0.0130916, 2.016478, 1, 1, 1, 1, 1,
1.970118, 0.1128431, 0.784337, 1, 1, 1, 1, 1,
1.998229, -0.3882285, 2.315012, 1, 1, 1, 1, 1,
2.001281, 0.2267375, 2.919556, 0, 0, 1, 1, 1,
2.003174, -0.6090217, 2.46419, 1, 0, 0, 1, 1,
2.014706, -0.6920472, 2.849009, 1, 0, 0, 1, 1,
2.055867, -0.8214738, 2.057383, 1, 0, 0, 1, 1,
2.098132, 0.3887502, 1.387507, 1, 0, 0, 1, 1,
2.110024, 0.5711956, 1.951125, 1, 0, 0, 1, 1,
2.118852, -0.01123701, 2.800846, 0, 0, 0, 1, 1,
2.119473, 0.2359771, 1.522353, 0, 0, 0, 1, 1,
2.172062, -0.8819253, 2.562314, 0, 0, 0, 1, 1,
2.19404, 0.7164878, 1.059129, 0, 0, 0, 1, 1,
2.223164, 0.2492636, 2.17816, 0, 0, 0, 1, 1,
2.249739, -0.6885586, 3.407423, 0, 0, 0, 1, 1,
2.405955, 0.6670407, 0.6344811, 0, 0, 0, 1, 1,
2.485076, -0.85892, 1.387866, 1, 1, 1, 1, 1,
2.634316, -1.079022, 2.666271, 1, 1, 1, 1, 1,
2.6412, -0.522093, 3.601313, 1, 1, 1, 1, 1,
2.666255, 0.2410919, 0.9095361, 1, 1, 1, 1, 1,
3.085414, 0.1613776, 1.033883, 1, 1, 1, 1, 1,
3.444748, -0.6175821, 1.898475, 1, 1, 1, 1, 1,
3.55308, -0.8861543, 1.432095, 1, 1, 1, 1, 1
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
var radius = 9.8158;
var distance = 34.47758;
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
mvMatrix.translate( -0.05842471, -0.1589882, 0.2239358 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47758);
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
