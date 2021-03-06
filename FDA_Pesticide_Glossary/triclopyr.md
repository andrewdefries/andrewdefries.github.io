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
-3.04517, 0.2739798, -1.304335, 1, 0, 0, 1,
-2.977716, -0.2715846, -2.031486, 1, 0.007843138, 0, 1,
-2.838045, -1.44693, -1.88486, 1, 0.01176471, 0, 1,
-2.67575, 0.3700573, -0.5304869, 1, 0.01960784, 0, 1,
-2.648476, -0.4245653, -2.522703, 1, 0.02352941, 0, 1,
-2.550313, -0.8764012, -2.666111, 1, 0.03137255, 0, 1,
-2.534744, 0.2650774, -3.145971, 1, 0.03529412, 0, 1,
-2.344894, 0.1943762, -1.106745, 1, 0.04313726, 0, 1,
-2.284255, 0.07056937, -1.49938, 1, 0.04705882, 0, 1,
-2.257698, -0.3096831, -2.285883, 1, 0.05490196, 0, 1,
-2.245114, 0.4163098, -1.038366, 1, 0.05882353, 0, 1,
-2.241905, 1.794979, -0.6714886, 1, 0.06666667, 0, 1,
-2.233231, 0.2774035, -1.834775, 1, 0.07058824, 0, 1,
-2.202178, -0.3646284, -1.239563, 1, 0.07843138, 0, 1,
-2.177816, -2.339276, -2.266666, 1, 0.08235294, 0, 1,
-2.131903, -1.578282, -3.041596, 1, 0.09019608, 0, 1,
-2.115901, -2.117921, -3.791699, 1, 0.09411765, 0, 1,
-2.096649, 1.268321, -2.916191, 1, 0.1019608, 0, 1,
-2.040867, 1.00751, -0.6071753, 1, 0.1098039, 0, 1,
-1.96919, 0.8016531, -0.3039891, 1, 0.1137255, 0, 1,
-1.964514, 0.344268, -1.569165, 1, 0.1215686, 0, 1,
-1.964021, -0.03689324, -1.739382, 1, 0.1254902, 0, 1,
-1.936344, -0.9931163, -3.165035, 1, 0.1333333, 0, 1,
-1.926316, -0.461723, 0.6500388, 1, 0.1372549, 0, 1,
-1.902964, 0.6970561, -1.242374, 1, 0.145098, 0, 1,
-1.870121, 1.904276, -0.987857, 1, 0.1490196, 0, 1,
-1.852638, -0.7471761, -1.278463, 1, 0.1568628, 0, 1,
-1.850472, -0.02561894, -2.853907, 1, 0.1607843, 0, 1,
-1.839636, -0.4351346, -2.762829, 1, 0.1686275, 0, 1,
-1.836788, -1.048097, -2.591093, 1, 0.172549, 0, 1,
-1.825604, 0.8624799, -1.692726, 1, 0.1803922, 0, 1,
-1.8223, 0.9278255, -3.211507, 1, 0.1843137, 0, 1,
-1.813232, 0.07636765, -1.568807, 1, 0.1921569, 0, 1,
-1.801882, 0.4926509, -0.8261169, 1, 0.1960784, 0, 1,
-1.755912, 0.4689703, -1.439796, 1, 0.2039216, 0, 1,
-1.732589, 0.9481396, -1.357774, 1, 0.2117647, 0, 1,
-1.727673, -1.94613, -0.9195535, 1, 0.2156863, 0, 1,
-1.72205, -2.237318, -3.763118, 1, 0.2235294, 0, 1,
-1.719643, -1.375717, -3.095107, 1, 0.227451, 0, 1,
-1.70915, -1.204094, -1.925428, 1, 0.2352941, 0, 1,
-1.707535, 0.9205624, -2.218354, 1, 0.2392157, 0, 1,
-1.643221, -0.7807254, -4.962858, 1, 0.2470588, 0, 1,
-1.640349, -0.5544969, -1.187756, 1, 0.2509804, 0, 1,
-1.63929, -0.04367742, -1.966653, 1, 0.2588235, 0, 1,
-1.620133, 1.024545, -1.123946, 1, 0.2627451, 0, 1,
-1.613598, 0.4246089, -2.663419, 1, 0.2705882, 0, 1,
-1.605413, -0.02988908, -2.476358, 1, 0.2745098, 0, 1,
-1.534345, 0.5784394, -0.6996316, 1, 0.282353, 0, 1,
-1.52706, 0.09573571, 0.3057827, 1, 0.2862745, 0, 1,
-1.524023, -1.138222, -0.6920595, 1, 0.2941177, 0, 1,
-1.52005, -0.07733769, -0.4974181, 1, 0.3019608, 0, 1,
-1.502475, 2.464751, -0.7706118, 1, 0.3058824, 0, 1,
-1.482588, 0.3720662, -0.4436713, 1, 0.3137255, 0, 1,
-1.479863, -1.460913, -1.514583, 1, 0.3176471, 0, 1,
-1.474219, -0.1715883, -2.074868, 1, 0.3254902, 0, 1,
-1.467887, -1.15267, -2.305543, 1, 0.3294118, 0, 1,
-1.453732, -0.6468871, -1.792308, 1, 0.3372549, 0, 1,
-1.443961, 0.5113657, -1.049394, 1, 0.3411765, 0, 1,
-1.441061, 0.1448305, -3.012803, 1, 0.3490196, 0, 1,
-1.434282, -0.3219599, -1.50349, 1, 0.3529412, 0, 1,
-1.429806, 0.4051351, -0.1398882, 1, 0.3607843, 0, 1,
-1.415653, -0.3246213, -2.868934, 1, 0.3647059, 0, 1,
-1.413703, 1.391574, -1.866704, 1, 0.372549, 0, 1,
-1.405486, 1.575012, 0.4292841, 1, 0.3764706, 0, 1,
-1.401883, -0.881126, -1.733925, 1, 0.3843137, 0, 1,
-1.389148, 1.95014, -1.27849, 1, 0.3882353, 0, 1,
-1.380655, 0.01289999, -2.04755, 1, 0.3960784, 0, 1,
-1.375781, 1.673082, -1.019931, 1, 0.4039216, 0, 1,
-1.374763, 1.004074, -1.054512, 1, 0.4078431, 0, 1,
-1.360355, -1.09346, -3.576815, 1, 0.4156863, 0, 1,
-1.351798, -2.419169, -1.676793, 1, 0.4196078, 0, 1,
-1.34547, 0.869006, -1.255616, 1, 0.427451, 0, 1,
-1.335016, -0.3264837, -3.730711, 1, 0.4313726, 0, 1,
-1.333498, -0.9982827, -1.01186, 1, 0.4392157, 0, 1,
-1.332738, 0.3443493, -2.883311, 1, 0.4431373, 0, 1,
-1.311446, -0.2389384, -1.373271, 1, 0.4509804, 0, 1,
-1.309769, -0.3684711, -2.593364, 1, 0.454902, 0, 1,
-1.30735, -0.4262588, -0.8150153, 1, 0.4627451, 0, 1,
-1.303835, -0.2702995, 0.3944404, 1, 0.4666667, 0, 1,
-1.292687, -1.271706, -1.339589, 1, 0.4745098, 0, 1,
-1.282626, -2.026703, -3.234439, 1, 0.4784314, 0, 1,
-1.279093, 0.08922046, -2.041052, 1, 0.4862745, 0, 1,
-1.270118, -0.1640252, -0.8279165, 1, 0.4901961, 0, 1,
-1.268561, -1.335545, -3.115292, 1, 0.4980392, 0, 1,
-1.266297, -1.882101, -4.078201, 1, 0.5058824, 0, 1,
-1.250621, -0.09208845, -2.006118, 1, 0.509804, 0, 1,
-1.247229, -0.03132521, -1.366243, 1, 0.5176471, 0, 1,
-1.243758, 0.2748972, -2.473272, 1, 0.5215687, 0, 1,
-1.243568, 0.6289405, -0.9928066, 1, 0.5294118, 0, 1,
-1.240181, -1.117603, -3.086465, 1, 0.5333334, 0, 1,
-1.229917, -0.2175147, -2.432667, 1, 0.5411765, 0, 1,
-1.22479, -0.412417, -1.55429, 1, 0.5450981, 0, 1,
-1.219813, -1.175827, -1.730584, 1, 0.5529412, 0, 1,
-1.201661, 0.480483, -0.401829, 1, 0.5568628, 0, 1,
-1.199298, -0.6772968, -2.380932, 1, 0.5647059, 0, 1,
-1.198224, -1.078968, -2.028242, 1, 0.5686275, 0, 1,
-1.182189, 1.272018, -1.676888, 1, 0.5764706, 0, 1,
-1.170098, 1.387383, -0.3380436, 1, 0.5803922, 0, 1,
-1.165006, -0.5602792, -0.8583906, 1, 0.5882353, 0, 1,
-1.163515, -2.120778, -1.226816, 1, 0.5921569, 0, 1,
-1.159478, -0.7923524, -3.170439, 1, 0.6, 0, 1,
-1.159123, -0.6859047, -0.7625026, 1, 0.6078432, 0, 1,
-1.145776, 2.369366, -0.1055235, 1, 0.6117647, 0, 1,
-1.145627, -0.5077256, -1.126559, 1, 0.6196079, 0, 1,
-1.143905, 0.8417574, -0.7273444, 1, 0.6235294, 0, 1,
-1.112579, 0.4374567, -3.545905, 1, 0.6313726, 0, 1,
-1.108013, 1.67789, -0.08573015, 1, 0.6352941, 0, 1,
-1.102203, -0.1810354, -1.328783, 1, 0.6431373, 0, 1,
-1.098368, -0.1202293, -1.769268, 1, 0.6470588, 0, 1,
-1.096682, -0.4593952, -2.645783, 1, 0.654902, 0, 1,
-1.093658, 0.7699608, -0.7356863, 1, 0.6588235, 0, 1,
-1.088514, -0.4527814, -2.429733, 1, 0.6666667, 0, 1,
-1.086665, 1.911959, -0.2354309, 1, 0.6705883, 0, 1,
-1.083856, -1.760958, -1.464755, 1, 0.6784314, 0, 1,
-1.08235, -0.009724788, -2.589021, 1, 0.682353, 0, 1,
-1.078312, -0.9491534, -1.796645, 1, 0.6901961, 0, 1,
-1.075296, 0.4674937, -1.044617, 1, 0.6941177, 0, 1,
-1.073317, -0.2279067, -1.312408, 1, 0.7019608, 0, 1,
-1.062389, 1.157465, -0.5776269, 1, 0.7098039, 0, 1,
-1.060359, -0.6311909, -2.244036, 1, 0.7137255, 0, 1,
-1.057747, -0.04651197, -0.8292319, 1, 0.7215686, 0, 1,
-1.057273, 1.075955, -1.838205, 1, 0.7254902, 0, 1,
-1.053491, -0.3855263, -3.048735, 1, 0.7333333, 0, 1,
-1.053369, 1.581901, -1.718514, 1, 0.7372549, 0, 1,
-1.04899, -0.4733673, -1.186862, 1, 0.7450981, 0, 1,
-1.042724, -0.1606941, -2.652121, 1, 0.7490196, 0, 1,
-1.041085, -0.5227568, -2.269663, 1, 0.7568628, 0, 1,
-1.040682, 0.5354584, 0.69531, 1, 0.7607843, 0, 1,
-1.03949, -0.5676123, -1.729232, 1, 0.7686275, 0, 1,
-1.035619, -0.9524992, -3.246468, 1, 0.772549, 0, 1,
-1.031546, 0.604067, -1.981152, 1, 0.7803922, 0, 1,
-1.028466, 0.3654518, -1.180517, 1, 0.7843137, 0, 1,
-1.00547, 0.1226679, -1.589138, 1, 0.7921569, 0, 1,
-1.002378, 0.7702534, -0.7160761, 1, 0.7960784, 0, 1,
-0.9946712, 1.583036, -1.627106, 1, 0.8039216, 0, 1,
-0.9893117, -1.564188, -2.07002, 1, 0.8117647, 0, 1,
-0.9762962, -0.4747339, -1.430009, 1, 0.8156863, 0, 1,
-0.9703636, 0.06408393, -0.8972409, 1, 0.8235294, 0, 1,
-0.9543514, -1.321255, -2.237179, 1, 0.827451, 0, 1,
-0.9424867, -1.147877, -3.136053, 1, 0.8352941, 0, 1,
-0.9402742, -1.457257, -2.721105, 1, 0.8392157, 0, 1,
-0.9402028, -0.3512925, -0.742268, 1, 0.8470588, 0, 1,
-0.935866, 0.3795476, -1.743482, 1, 0.8509804, 0, 1,
-0.9313583, -0.5659516, -0.7423207, 1, 0.8588235, 0, 1,
-0.9289992, 0.05974892, -1.319581, 1, 0.8627451, 0, 1,
-0.9275439, 0.3353918, -1.152251, 1, 0.8705882, 0, 1,
-0.9209687, 0.2433828, -0.05577036, 1, 0.8745098, 0, 1,
-0.9198107, 0.1019716, -2.916826, 1, 0.8823529, 0, 1,
-0.9196168, 0.9425177, 0.2189491, 1, 0.8862745, 0, 1,
-0.9136857, 0.1600248, -1.316315, 1, 0.8941177, 0, 1,
-0.9134282, 1.368153, -0.460853, 1, 0.8980392, 0, 1,
-0.9067831, 0.9420677, -1.823488, 1, 0.9058824, 0, 1,
-0.9065937, 0.2684219, -1.423474, 1, 0.9137255, 0, 1,
-0.9032062, 1.007911, 0.6898622, 1, 0.9176471, 0, 1,
-0.8950302, 0.3630688, -2.032608, 1, 0.9254902, 0, 1,
-0.8943701, -0.4511589, -1.947476, 1, 0.9294118, 0, 1,
-0.8931436, -0.558141, -1.117131, 1, 0.9372549, 0, 1,
-0.8903191, 1.33522, -1.229529, 1, 0.9411765, 0, 1,
-0.8886456, 0.5990464, -0.8458577, 1, 0.9490196, 0, 1,
-0.8863748, -1.565816, -3.019033, 1, 0.9529412, 0, 1,
-0.8852359, -0.1468182, -1.926518, 1, 0.9607843, 0, 1,
-0.8834085, -0.9795128, -2.816383, 1, 0.9647059, 0, 1,
-0.8733671, 0.4130551, 0.3504276, 1, 0.972549, 0, 1,
-0.8675599, -0.4477409, -1.457692, 1, 0.9764706, 0, 1,
-0.8646719, -0.1300881, -2.481772, 1, 0.9843137, 0, 1,
-0.8643782, 1.187432, -0.1109568, 1, 0.9882353, 0, 1,
-0.8618221, 2.016117, 0.2834482, 1, 0.9960784, 0, 1,
-0.8591579, 1.012123, -0.6369998, 0.9960784, 1, 0, 1,
-0.8576615, 0.01370951, -2.978119, 0.9921569, 1, 0, 1,
-0.8554767, 0.3766521, 0.3839842, 0.9843137, 1, 0, 1,
-0.8524197, 0.4101349, -2.766993, 0.9803922, 1, 0, 1,
-0.8503855, 1.370994, 1.474334, 0.972549, 1, 0, 1,
-0.8485522, 1.004466, -0.5513874, 0.9686275, 1, 0, 1,
-0.8479673, -0.3112179, -0.9598415, 0.9607843, 1, 0, 1,
-0.8472218, -0.09102583, -1.611938, 0.9568627, 1, 0, 1,
-0.8424387, 0.4696168, -0.748625, 0.9490196, 1, 0, 1,
-0.8366581, 2.87225, 0.527689, 0.945098, 1, 0, 1,
-0.8341483, -0.1679894, -2.716687, 0.9372549, 1, 0, 1,
-0.8265169, -1.174769, -2.923031, 0.9333333, 1, 0, 1,
-0.8209317, -0.4403555, -2.187027, 0.9254902, 1, 0, 1,
-0.8187754, -0.3411844, -1.908691, 0.9215686, 1, 0, 1,
-0.8156581, -0.6342636, -3.075406, 0.9137255, 1, 0, 1,
-0.813167, -0.6441962, -1.727312, 0.9098039, 1, 0, 1,
-0.8102393, -0.3655417, -2.665056, 0.9019608, 1, 0, 1,
-0.8032963, 0.6899498, -0.03596171, 0.8941177, 1, 0, 1,
-0.7993665, 0.2871489, -2.499417, 0.8901961, 1, 0, 1,
-0.7974761, 0.05068511, -2.238298, 0.8823529, 1, 0, 1,
-0.7938142, 1.225821, -2.123091, 0.8784314, 1, 0, 1,
-0.7917082, -0.9056978, -1.382445, 0.8705882, 1, 0, 1,
-0.784741, 0.7128486, -0.6295112, 0.8666667, 1, 0, 1,
-0.784357, -0.1351859, -1.415449, 0.8588235, 1, 0, 1,
-0.783886, -0.4848255, -2.533044, 0.854902, 1, 0, 1,
-0.7784434, 0.1477122, -1.425817, 0.8470588, 1, 0, 1,
-0.7777171, 0.01215234, -2.130626, 0.8431373, 1, 0, 1,
-0.7717931, 0.9141799, -1.231616, 0.8352941, 1, 0, 1,
-0.771177, -0.6488463, -1.875121, 0.8313726, 1, 0, 1,
-0.7692039, 0.3825564, -1.043142, 0.8235294, 1, 0, 1,
-0.7672638, -0.7981197, -3.061689, 0.8196079, 1, 0, 1,
-0.7662338, -0.8854383, -3.464435, 0.8117647, 1, 0, 1,
-0.7606165, 0.7420685, -1.371392, 0.8078431, 1, 0, 1,
-0.7513688, 0.7787395, -0.2140358, 0.8, 1, 0, 1,
-0.7470323, 0.9954879, 1.134812, 0.7921569, 1, 0, 1,
-0.7468178, -1.070451, -1.947544, 0.7882353, 1, 0, 1,
-0.7405273, 0.04839994, -3.314242, 0.7803922, 1, 0, 1,
-0.738319, -0.8403074, -2.797384, 0.7764706, 1, 0, 1,
-0.7362744, 0.783178, -1.376379, 0.7686275, 1, 0, 1,
-0.7322348, -0.7538262, -3.422728, 0.7647059, 1, 0, 1,
-0.7309862, -2.307066, -1.974344, 0.7568628, 1, 0, 1,
-0.7222939, -0.08519264, -3.068568, 0.7529412, 1, 0, 1,
-0.7205165, 0.1213734, -1.366789, 0.7450981, 1, 0, 1,
-0.7200893, 0.4089643, -2.697854, 0.7411765, 1, 0, 1,
-0.7182918, 2.033587, -0.7370027, 0.7333333, 1, 0, 1,
-0.7170131, 0.8628728, -1.235815, 0.7294118, 1, 0, 1,
-0.7163115, 1.89509, -0.5830201, 0.7215686, 1, 0, 1,
-0.7143901, 1.241169, 0.8927295, 0.7176471, 1, 0, 1,
-0.7106668, 0.05385936, 0.0909373, 0.7098039, 1, 0, 1,
-0.7104642, 0.7578839, -0.6969887, 0.7058824, 1, 0, 1,
-0.7089896, 0.07839035, -2.401636, 0.6980392, 1, 0, 1,
-0.7088215, 0.2945088, -2.327123, 0.6901961, 1, 0, 1,
-0.7045648, -0.007251147, -2.230221, 0.6862745, 1, 0, 1,
-0.7000135, 0.7685561, -0.4743352, 0.6784314, 1, 0, 1,
-0.6997491, 0.3872659, -0.3993007, 0.6745098, 1, 0, 1,
-0.6970086, 0.5423312, -0.7271526, 0.6666667, 1, 0, 1,
-0.6920738, -0.9669017, -2.220731, 0.6627451, 1, 0, 1,
-0.689071, -0.6293704, -1.517311, 0.654902, 1, 0, 1,
-0.6871222, -0.3963795, -2.348627, 0.6509804, 1, 0, 1,
-0.6829544, -0.4552305, -4.146416, 0.6431373, 1, 0, 1,
-0.6764969, -1.665619, -4.08979, 0.6392157, 1, 0, 1,
-0.6749594, 1.2934, -1.12262, 0.6313726, 1, 0, 1,
-0.6738783, -0.5803334, -2.018355, 0.627451, 1, 0, 1,
-0.6709601, 0.06201905, -1.842761, 0.6196079, 1, 0, 1,
-0.6638556, -0.6102945, -2.649754, 0.6156863, 1, 0, 1,
-0.6583564, -0.9305817, -2.265632, 0.6078432, 1, 0, 1,
-0.6556952, -0.2083528, -0.500659, 0.6039216, 1, 0, 1,
-0.6543911, 0.8971803, 0.08960978, 0.5960785, 1, 0, 1,
-0.6510017, 0.2595943, -0.2328413, 0.5882353, 1, 0, 1,
-0.6417605, -0.06090983, -3.448233, 0.5843138, 1, 0, 1,
-0.638763, -0.6194501, -2.073472, 0.5764706, 1, 0, 1,
-0.6365091, -0.0838988, -0.4556632, 0.572549, 1, 0, 1,
-0.635389, 0.6829888, -0.2705319, 0.5647059, 1, 0, 1,
-0.6340582, 0.3399151, -2.58575, 0.5607843, 1, 0, 1,
-0.6338283, -0.6254236, -2.653521, 0.5529412, 1, 0, 1,
-0.6327513, 1.748731, -0.6447887, 0.5490196, 1, 0, 1,
-0.6279333, 0.4351399, -0.5074245, 0.5411765, 1, 0, 1,
-0.62765, -0.8920755, -2.444434, 0.5372549, 1, 0, 1,
-0.6270732, 1.791776, 0.3894932, 0.5294118, 1, 0, 1,
-0.6267691, -0.325923, -1.620661, 0.5254902, 1, 0, 1,
-0.6220351, -0.7483851, -2.845894, 0.5176471, 1, 0, 1,
-0.6120467, -1.788582, -3.789401, 0.5137255, 1, 0, 1,
-0.6118075, -0.1970455, -1.475422, 0.5058824, 1, 0, 1,
-0.6090279, -2.275957, -3.66088, 0.5019608, 1, 0, 1,
-0.6063771, 0.8222613, -0.8388434, 0.4941176, 1, 0, 1,
-0.6021966, 1.351044, 0.8390492, 0.4862745, 1, 0, 1,
-0.5986525, 0.002149459, -3.651092, 0.4823529, 1, 0, 1,
-0.5944427, 0.1301506, -1.746387, 0.4745098, 1, 0, 1,
-0.5935467, -1.290127, -3.30869, 0.4705882, 1, 0, 1,
-0.5870499, 0.6069378, -0.7311136, 0.4627451, 1, 0, 1,
-0.5802245, 0.6670135, -0.962222, 0.4588235, 1, 0, 1,
-0.5796604, 0.3818287, -2.40885, 0.4509804, 1, 0, 1,
-0.5795093, 0.2592888, 0.02320479, 0.4470588, 1, 0, 1,
-0.5778292, -0.6609571, -0.7337338, 0.4392157, 1, 0, 1,
-0.5770446, -2.898146, -4.29942, 0.4352941, 1, 0, 1,
-0.5757398, -0.3830968, -2.489306, 0.427451, 1, 0, 1,
-0.5748909, -0.3056689, -2.453564, 0.4235294, 1, 0, 1,
-0.5729299, -0.4288094, -2.948841, 0.4156863, 1, 0, 1,
-0.5696191, -1.633314, -3.0439, 0.4117647, 1, 0, 1,
-0.5679489, 2.435568, -0.5447863, 0.4039216, 1, 0, 1,
-0.5635526, -0.9599313, -2.480958, 0.3960784, 1, 0, 1,
-0.5597889, 0.04066617, -1.913498, 0.3921569, 1, 0, 1,
-0.5572941, 0.7192332, -0.7668027, 0.3843137, 1, 0, 1,
-0.5554169, -0.8195576, -3.771593, 0.3803922, 1, 0, 1,
-0.5542775, -0.06935897, -3.068304, 0.372549, 1, 0, 1,
-0.5536421, -0.8247513, -0.3717706, 0.3686275, 1, 0, 1,
-0.5517601, 0.6555136, 0.3851217, 0.3607843, 1, 0, 1,
-0.5508744, -0.145991, -1.818172, 0.3568628, 1, 0, 1,
-0.5502912, -1.367472, -2.281241, 0.3490196, 1, 0, 1,
-0.5469882, -0.6247202, -2.827046, 0.345098, 1, 0, 1,
-0.5463545, -0.6953678, -3.117931, 0.3372549, 1, 0, 1,
-0.5444713, 0.8223302, -1.145055, 0.3333333, 1, 0, 1,
-0.536365, 0.1712327, -1.285331, 0.3254902, 1, 0, 1,
-0.5355213, -0.04015362, -1.758699, 0.3215686, 1, 0, 1,
-0.5342621, 0.6389982, -0.2155539, 0.3137255, 1, 0, 1,
-0.5324641, 0.2245964, -0.2102906, 0.3098039, 1, 0, 1,
-0.5308897, 0.6617579, -0.1869503, 0.3019608, 1, 0, 1,
-0.529807, 1.169188, -1.804576, 0.2941177, 1, 0, 1,
-0.5234507, -0.6636337, -1.958385, 0.2901961, 1, 0, 1,
-0.5197165, 0.3529138, 0.06977943, 0.282353, 1, 0, 1,
-0.5123558, 0.6466337, -0.4134868, 0.2784314, 1, 0, 1,
-0.5080171, -0.9185933, -1.413868, 0.2705882, 1, 0, 1,
-0.5061706, -0.3094895, -2.00606, 0.2666667, 1, 0, 1,
-0.5038437, -1.388217, -4.49197, 0.2588235, 1, 0, 1,
-0.5032104, -1.00943, -2.156425, 0.254902, 1, 0, 1,
-0.5028445, 0.017712, -1.651127, 0.2470588, 1, 0, 1,
-0.4955308, 0.2022597, -0.8231739, 0.2431373, 1, 0, 1,
-0.4950955, -2.738629, -3.786778, 0.2352941, 1, 0, 1,
-0.4944603, -0.1736303, -2.807991, 0.2313726, 1, 0, 1,
-0.4912437, 0.1038729, -1.628641, 0.2235294, 1, 0, 1,
-0.4909678, -0.1290127, 0.7341692, 0.2196078, 1, 0, 1,
-0.4905714, -1.250125, -3.513686, 0.2117647, 1, 0, 1,
-0.4895371, 1.028191, 0.6860439, 0.2078431, 1, 0, 1,
-0.4864628, 1.046697, -1.371838, 0.2, 1, 0, 1,
-0.4856894, 0.9117515, -2.297976, 0.1921569, 1, 0, 1,
-0.4854058, -0.04473884, -1.679885, 0.1882353, 1, 0, 1,
-0.4724798, -0.1755697, -1.94408, 0.1803922, 1, 0, 1,
-0.4670523, 0.4856755, 0.2385049, 0.1764706, 1, 0, 1,
-0.4665067, 0.5525633, -1.675341, 0.1686275, 1, 0, 1,
-0.4635582, -0.6355693, -0.4991901, 0.1647059, 1, 0, 1,
-0.4585776, 0.02777741, -1.760315, 0.1568628, 1, 0, 1,
-0.4578462, -1.141424, -1.098736, 0.1529412, 1, 0, 1,
-0.4563443, -0.4936698, -2.008181, 0.145098, 1, 0, 1,
-0.4515802, 0.7154303, -3.360524, 0.1411765, 1, 0, 1,
-0.451344, 1.034766, -1.221256, 0.1333333, 1, 0, 1,
-0.4491226, 2.776198, 1.448904, 0.1294118, 1, 0, 1,
-0.4478433, 1.405567, 1.593085, 0.1215686, 1, 0, 1,
-0.446736, 2.386294, -0.1502324, 0.1176471, 1, 0, 1,
-0.4439199, -0.2302555, -1.663515, 0.1098039, 1, 0, 1,
-0.4429978, 1.438075, 0.06462559, 0.1058824, 1, 0, 1,
-0.4416883, 2.33991, 0.3377015, 0.09803922, 1, 0, 1,
-0.441597, -1.659944, -0.2821585, 0.09019608, 1, 0, 1,
-0.4409393, 0.8083097, -2.996767, 0.08627451, 1, 0, 1,
-0.4404506, -1.690699, -2.697509, 0.07843138, 1, 0, 1,
-0.427954, 0.6725875, -2.012197, 0.07450981, 1, 0, 1,
-0.4271928, -0.2274114, -1.630339, 0.06666667, 1, 0, 1,
-0.4264522, 2.157413, -0.3216645, 0.0627451, 1, 0, 1,
-0.4200129, 0.9440399, -1.214707, 0.05490196, 1, 0, 1,
-0.4200038, 1.221823, -2.254353, 0.05098039, 1, 0, 1,
-0.4133322, 0.02359792, -3.270654, 0.04313726, 1, 0, 1,
-0.4064162, 2.667022, 1.044584, 0.03921569, 1, 0, 1,
-0.4056411, 0.6986232, -1.426858, 0.03137255, 1, 0, 1,
-0.402502, -0.5439854, -3.448523, 0.02745098, 1, 0, 1,
-0.3997783, 0.3017715, -2.932306, 0.01960784, 1, 0, 1,
-0.3990398, 2.126179, -0.5856176, 0.01568628, 1, 0, 1,
-0.398914, 0.694739, -2.192052, 0.007843138, 1, 0, 1,
-0.3889548, 0.6791322, -0.1380938, 0.003921569, 1, 0, 1,
-0.388889, 0.1187163, -2.424376, 0, 1, 0.003921569, 1,
-0.384612, 2.110904, -0.2969226, 0, 1, 0.01176471, 1,
-0.3839729, -0.2895203, -1.488624, 0, 1, 0.01568628, 1,
-0.3795547, 0.5112383, -1.578546, 0, 1, 0.02352941, 1,
-0.3746761, -0.4472615, -2.370278, 0, 1, 0.02745098, 1,
-0.3702898, 0.2612716, -1.064411, 0, 1, 0.03529412, 1,
-0.3671312, 1.470585, -0.02110598, 0, 1, 0.03921569, 1,
-0.365618, 1.114108, 0.07555077, 0, 1, 0.04705882, 1,
-0.3635441, 2.634916, -1.233749, 0, 1, 0.05098039, 1,
-0.3611845, 0.7518315, -0.5936716, 0, 1, 0.05882353, 1,
-0.358804, 0.7521858, -1.234821, 0, 1, 0.0627451, 1,
-0.3569747, 0.03549045, -1.312802, 0, 1, 0.07058824, 1,
-0.3558289, 1.87384, -0.5176162, 0, 1, 0.07450981, 1,
-0.3537177, 0.811615, 0.4174966, 0, 1, 0.08235294, 1,
-0.3533791, 0.2259813, -1.699535, 0, 1, 0.08627451, 1,
-0.3519654, 0.3761538, -0.3930389, 0, 1, 0.09411765, 1,
-0.3514247, 0.0883344, 0.06668177, 0, 1, 0.1019608, 1,
-0.349468, -0.8783113, -2.837873, 0, 1, 0.1058824, 1,
-0.348244, 0.6784134, 1.669489, 0, 1, 0.1137255, 1,
-0.3452422, -0.7294334, -2.604174, 0, 1, 0.1176471, 1,
-0.3425079, 0.1745199, -0.1519308, 0, 1, 0.1254902, 1,
-0.3398277, -0.4132732, -4.75037, 0, 1, 0.1294118, 1,
-0.3392133, -2.336984, -2.772942, 0, 1, 0.1372549, 1,
-0.3387325, -1.197425, -4.676588, 0, 1, 0.1411765, 1,
-0.3386568, -0.6823575, -2.861534, 0, 1, 0.1490196, 1,
-0.3359661, 0.08232275, -0.1939805, 0, 1, 0.1529412, 1,
-0.3356268, 0.7123641, -0.9508992, 0, 1, 0.1607843, 1,
-0.3330006, 0.3539013, -1.585181, 0, 1, 0.1647059, 1,
-0.3320597, -2.176808, -3.090239, 0, 1, 0.172549, 1,
-0.3254673, 1.242395, 0.2607414, 0, 1, 0.1764706, 1,
-0.3235494, -1.371694, -2.372674, 0, 1, 0.1843137, 1,
-0.3233211, 0.2568954, -1.97683, 0, 1, 0.1882353, 1,
-0.3203833, 1.025204, -0.4525601, 0, 1, 0.1960784, 1,
-0.3201632, 0.4985886, -0.2622673, 0, 1, 0.2039216, 1,
-0.3163639, 0.9228697, -0.03379368, 0, 1, 0.2078431, 1,
-0.3112058, -0.6250417, -2.850328, 0, 1, 0.2156863, 1,
-0.3109353, 0.9447559, 0.8813977, 0, 1, 0.2196078, 1,
-0.3093422, 0.1913317, -1.629763, 0, 1, 0.227451, 1,
-0.3067672, 0.1235364, -1.152156, 0, 1, 0.2313726, 1,
-0.3061573, -1.360928, -1.582353, 0, 1, 0.2392157, 1,
-0.3006276, -0.1898091, -1.852383, 0, 1, 0.2431373, 1,
-0.298383, -0.3902768, -2.758513, 0, 1, 0.2509804, 1,
-0.2941355, -1.113396, -2.636271, 0, 1, 0.254902, 1,
-0.2932469, 0.7726814, -0.7568911, 0, 1, 0.2627451, 1,
-0.2885179, -0.4628417, -2.896454, 0, 1, 0.2666667, 1,
-0.286286, -0.0922601, -1.189499, 0, 1, 0.2745098, 1,
-0.2858796, 0.2275814, -0.3771329, 0, 1, 0.2784314, 1,
-0.2836684, -1.102713, -1.357366, 0, 1, 0.2862745, 1,
-0.2824107, 0.4125249, -1.299323, 0, 1, 0.2901961, 1,
-0.2817499, 0.1677474, 0.124844, 0, 1, 0.2980392, 1,
-0.2802366, 1.762287, -1.271602, 0, 1, 0.3058824, 1,
-0.2800772, 0.7077906, 0.1531277, 0, 1, 0.3098039, 1,
-0.2789092, -0.3484693, -3.067552, 0, 1, 0.3176471, 1,
-0.2770403, 0.1464216, -1.374704, 0, 1, 0.3215686, 1,
-0.2760592, 1.548537, 0.3169, 0, 1, 0.3294118, 1,
-0.2735575, 0.6598028, -1.209188, 0, 1, 0.3333333, 1,
-0.270135, -0.7423044, -2.03015, 0, 1, 0.3411765, 1,
-0.2634557, 1.342332, -0.1548955, 0, 1, 0.345098, 1,
-0.2617348, 1.484907, -0.02261367, 0, 1, 0.3529412, 1,
-0.2595642, 0.5082216, 0.328259, 0, 1, 0.3568628, 1,
-0.2545741, 0.4428992, -0.232674, 0, 1, 0.3647059, 1,
-0.2478497, -0.9203267, -1.930969, 0, 1, 0.3686275, 1,
-0.245933, 0.1187826, -0.8158094, 0, 1, 0.3764706, 1,
-0.2420641, -1.170118, -3.086666, 0, 1, 0.3803922, 1,
-0.2408095, -0.4218698, -2.400289, 0, 1, 0.3882353, 1,
-0.240437, 1.56078, -0.762738, 0, 1, 0.3921569, 1,
-0.2372334, -0.278471, -2.01113, 0, 1, 0.4, 1,
-0.23306, -0.7803673, -3.882985, 0, 1, 0.4078431, 1,
-0.2328032, 1.177839, -1.405675, 0, 1, 0.4117647, 1,
-0.232037, -0.6980144, -1.337138, 0, 1, 0.4196078, 1,
-0.2281184, -0.442462, -2.756453, 0, 1, 0.4235294, 1,
-0.2274795, 0.01361219, -1.999605, 0, 1, 0.4313726, 1,
-0.2217458, -0.5817555, -1.646165, 0, 1, 0.4352941, 1,
-0.2201659, 0.7968773, -0.8434268, 0, 1, 0.4431373, 1,
-0.2169205, 1.717673, -1.152123, 0, 1, 0.4470588, 1,
-0.2151743, 0.4820739, 0.1015503, 0, 1, 0.454902, 1,
-0.2087373, 1.632998, -0.6363829, 0, 1, 0.4588235, 1,
-0.2029196, -1.014001, -2.216727, 0, 1, 0.4666667, 1,
-0.1983217, 2.296201, -0.06769798, 0, 1, 0.4705882, 1,
-0.1954188, 1.294262, 1.591588, 0, 1, 0.4784314, 1,
-0.1934905, -1.959737, -1.317603, 0, 1, 0.4823529, 1,
-0.1903429, 1.423412, -1.693333, 0, 1, 0.4901961, 1,
-0.1882156, -0.4344162, -1.272059, 0, 1, 0.4941176, 1,
-0.1858685, -1.595396, -2.773628, 0, 1, 0.5019608, 1,
-0.1843186, 1.879936, -0.2385083, 0, 1, 0.509804, 1,
-0.1801184, 0.6901908, -1.117043, 0, 1, 0.5137255, 1,
-0.1739163, -1.058269, -1.22097, 0, 1, 0.5215687, 1,
-0.1680142, -0.7095191, -2.968149, 0, 1, 0.5254902, 1,
-0.1639668, -0.3402212, -1.578258, 0, 1, 0.5333334, 1,
-0.1603671, 0.7840579, 0.8831775, 0, 1, 0.5372549, 1,
-0.1603601, 0.4115621, -0.6966387, 0, 1, 0.5450981, 1,
-0.1592892, -1.716276, -3.527784, 0, 1, 0.5490196, 1,
-0.1585512, 0.4565476, -0.4055518, 0, 1, 0.5568628, 1,
-0.1487717, -0.5510815, -4.342538, 0, 1, 0.5607843, 1,
-0.1476229, -0.9919931, -4.734179, 0, 1, 0.5686275, 1,
-0.1452192, 0.8708545, 1.583938, 0, 1, 0.572549, 1,
-0.1435936, 1.895318, -0.03421837, 0, 1, 0.5803922, 1,
-0.1408735, -1.092401, -2.750793, 0, 1, 0.5843138, 1,
-0.1368206, -0.7339344, -3.940824, 0, 1, 0.5921569, 1,
-0.1335722, 0.4293331, -0.2267088, 0, 1, 0.5960785, 1,
-0.1302672, 0.8610132, 3.338328, 0, 1, 0.6039216, 1,
-0.1268714, 0.1757674, -2.146729, 0, 1, 0.6117647, 1,
-0.1231629, 0.6264802, 0.9873483, 0, 1, 0.6156863, 1,
-0.1218104, 1.27315, -1.649269, 0, 1, 0.6235294, 1,
-0.12129, -0.1223634, -1.748312, 0, 1, 0.627451, 1,
-0.1193922, 0.8372586, -1.522568, 0, 1, 0.6352941, 1,
-0.1159896, -0.4025759, 0.08302175, 0, 1, 0.6392157, 1,
-0.1159276, 0.2677955, 0.4581156, 0, 1, 0.6470588, 1,
-0.1143293, 1.99821, -0.09093579, 0, 1, 0.6509804, 1,
-0.1096493, 0.6856498, 0.8942667, 0, 1, 0.6588235, 1,
-0.1075832, 0.05540072, -0.6412916, 0, 1, 0.6627451, 1,
-0.1069639, -0.7096897, -3.504254, 0, 1, 0.6705883, 1,
-0.1058832, -1.073652, -2.303127, 0, 1, 0.6745098, 1,
-0.09864985, -2.718946, -3.663335, 0, 1, 0.682353, 1,
-0.09654302, -0.7119774, -3.915714, 0, 1, 0.6862745, 1,
-0.09590477, -1.245556, -2.903363, 0, 1, 0.6941177, 1,
-0.09355316, 0.8886954, -1.029497, 0, 1, 0.7019608, 1,
-0.0879703, 0.2560117, -0.3397086, 0, 1, 0.7058824, 1,
-0.08686477, -0.4987408, -2.657851, 0, 1, 0.7137255, 1,
-0.08517022, 0.6161908, -0.5377243, 0, 1, 0.7176471, 1,
-0.0828245, 0.2722495, -0.2629268, 0, 1, 0.7254902, 1,
-0.08201075, 0.5034221, 0.1668548, 0, 1, 0.7294118, 1,
-0.08104315, -0.5210681, -3.072381, 0, 1, 0.7372549, 1,
-0.08081396, -0.5586473, -3.225497, 0, 1, 0.7411765, 1,
-0.07922567, 0.6435775, 0.2521754, 0, 1, 0.7490196, 1,
-0.07385172, 0.2937326, -1.958813, 0, 1, 0.7529412, 1,
-0.06931939, 0.2693686, -1.278592, 0, 1, 0.7607843, 1,
-0.06396529, -0.4826887, -1.861315, 0, 1, 0.7647059, 1,
-0.06191556, 0.5207086, -2.259318, 0, 1, 0.772549, 1,
-0.0614582, 0.7529856, -0.4218625, 0, 1, 0.7764706, 1,
-0.06032578, -0.8832748, -4.20194, 0, 1, 0.7843137, 1,
-0.05970241, 0.7101419, 0.7553921, 0, 1, 0.7882353, 1,
-0.0594093, -0.1244926, -3.271842, 0, 1, 0.7960784, 1,
-0.05541616, -0.8433916, -2.539133, 0, 1, 0.8039216, 1,
-0.05472256, 1.476323, -0.3160212, 0, 1, 0.8078431, 1,
-0.05400158, -0.5519843, -2.376751, 0, 1, 0.8156863, 1,
-0.05124475, 0.7208759, -0.09209105, 0, 1, 0.8196079, 1,
-0.05083562, 0.1483691, 1.68533, 0, 1, 0.827451, 1,
-0.04883735, 1.095816, 0.4415283, 0, 1, 0.8313726, 1,
-0.04754901, -0.5242843, -3.579766, 0, 1, 0.8392157, 1,
-0.04662063, -1.294735, -4.275783, 0, 1, 0.8431373, 1,
-0.0463095, -1.617027, -3.816826, 0, 1, 0.8509804, 1,
-0.04545713, 0.6663655, -0.3555957, 0, 1, 0.854902, 1,
-0.04533648, 0.8669959, 0.4415328, 0, 1, 0.8627451, 1,
-0.04215259, 0.8484864, -0.952921, 0, 1, 0.8666667, 1,
-0.03322659, 0.6053815, -0.454673, 0, 1, 0.8745098, 1,
-0.03043881, 0.1218391, -1.219537, 0, 1, 0.8784314, 1,
-0.02906269, -0.6611989, -3.971919, 0, 1, 0.8862745, 1,
-0.02807198, 0.4334495, -1.336017, 0, 1, 0.8901961, 1,
-0.02738214, -0.4871055, -3.80569, 0, 1, 0.8980392, 1,
-0.02412804, 0.9030522, -1.250422, 0, 1, 0.9058824, 1,
-0.02129653, -0.9829113, -4.196999, 0, 1, 0.9098039, 1,
-0.01998693, 0.8858681, 1.01069, 0, 1, 0.9176471, 1,
-0.01599818, -1.654358, -2.531463, 0, 1, 0.9215686, 1,
-0.00992, -1.540291, -2.529938, 0, 1, 0.9294118, 1,
-0.001661969, 0.9994794, -1.042359, 0, 1, 0.9333333, 1,
0.002443096, 1.265182, -0.4875477, 0, 1, 0.9411765, 1,
0.008931108, -1.673789, 2.661334, 0, 1, 0.945098, 1,
0.0108985, 0.5140362, 0.3494344, 0, 1, 0.9529412, 1,
0.01259582, -0.4133573, 2.485205, 0, 1, 0.9568627, 1,
0.01908691, -1.161177, 4.981878, 0, 1, 0.9647059, 1,
0.02015324, -0.0241252, 1.239784, 0, 1, 0.9686275, 1,
0.02120186, -0.05559057, 4.164028, 0, 1, 0.9764706, 1,
0.03252905, 0.5433736, -0.1559193, 0, 1, 0.9803922, 1,
0.03316742, 1.064481, -0.7787124, 0, 1, 0.9882353, 1,
0.0373256, 0.93577, 0.2423197, 0, 1, 0.9921569, 1,
0.03737112, 0.6332914, 0.01542021, 0, 1, 1, 1,
0.04131088, -1.555597, 3.395786, 0, 0.9921569, 1, 1,
0.04599147, 0.935921, 0.7085692, 0, 0.9882353, 1, 1,
0.04676811, 0.8518928, 0.0149763, 0, 0.9803922, 1, 1,
0.04806716, 0.8120241, -0.6885412, 0, 0.9764706, 1, 1,
0.04908793, -0.2436655, 1.774563, 0, 0.9686275, 1, 1,
0.05418211, -0.03128939, 2.101322, 0, 0.9647059, 1, 1,
0.05769062, 1.696801, -0.02212016, 0, 0.9568627, 1, 1,
0.05869175, -1.746326, 3.132298, 0, 0.9529412, 1, 1,
0.05923711, -0.5155255, 3.994427, 0, 0.945098, 1, 1,
0.05954918, 0.7705271, 0.669131, 0, 0.9411765, 1, 1,
0.0600376, -0.1038728, 4.169046, 0, 0.9333333, 1, 1,
0.06607004, 0.4777975, -1.027651, 0, 0.9294118, 1, 1,
0.06729867, -1.182548, 3.754377, 0, 0.9215686, 1, 1,
0.06785855, -0.4850096, 2.995442, 0, 0.9176471, 1, 1,
0.07584414, 0.06748461, 0.02213916, 0, 0.9098039, 1, 1,
0.07693765, 1.227656, -0.042146, 0, 0.9058824, 1, 1,
0.07925209, -0.3560972, 3.178305, 0, 0.8980392, 1, 1,
0.0805074, 0.7668205, 1.358061, 0, 0.8901961, 1, 1,
0.08107108, 1.25517, 0.788246, 0, 0.8862745, 1, 1,
0.08471584, -0.6888065, 4.206716, 0, 0.8784314, 1, 1,
0.08475019, -0.7329356, 4.112876, 0, 0.8745098, 1, 1,
0.08614226, -0.2305015, 4.075563, 0, 0.8666667, 1, 1,
0.09034219, -0.3207436, 3.182038, 0, 0.8627451, 1, 1,
0.09199139, 1.989204, -0.8235372, 0, 0.854902, 1, 1,
0.09383062, -0.001396376, 2.285674, 0, 0.8509804, 1, 1,
0.0956994, 1.474315, 2.260668, 0, 0.8431373, 1, 1,
0.09651206, -1.695151, 2.108482, 0, 0.8392157, 1, 1,
0.1031814, 0.8036767, -0.8322523, 0, 0.8313726, 1, 1,
0.1033003, -0.7223212, 3.368201, 0, 0.827451, 1, 1,
0.1039904, -0.3750705, 4.850085, 0, 0.8196079, 1, 1,
0.1047018, 1.022291, 1.220336, 0, 0.8156863, 1, 1,
0.1084071, 0.5645726, -0.2138807, 0, 0.8078431, 1, 1,
0.1104931, -1.203948, 2.733404, 0, 0.8039216, 1, 1,
0.1149463, -0.7277058, 1.991954, 0, 0.7960784, 1, 1,
0.1152706, 0.2337773, 1.537215, 0, 0.7882353, 1, 1,
0.1158794, 0.4291886, 1.926357, 0, 0.7843137, 1, 1,
0.1178456, 0.1076265, 0.1501171, 0, 0.7764706, 1, 1,
0.1185838, 0.4794864, 1.076415, 0, 0.772549, 1, 1,
0.1200062, 1.364803, 1.117095, 0, 0.7647059, 1, 1,
0.1271346, -2.238301, 0.901932, 0, 0.7607843, 1, 1,
0.1289477, 0.429366, 0.6959078, 0, 0.7529412, 1, 1,
0.1311803, 1.971814, -0.8791769, 0, 0.7490196, 1, 1,
0.1315859, -0.9303786, 1.715654, 0, 0.7411765, 1, 1,
0.132456, 0.2089345, -0.4749844, 0, 0.7372549, 1, 1,
0.1331577, -0.1804447, 2.924131, 0, 0.7294118, 1, 1,
0.1338741, -0.7620553, 2.540553, 0, 0.7254902, 1, 1,
0.1493502, -1.006808, 1.805966, 0, 0.7176471, 1, 1,
0.1544954, -1.497343, 4.404827, 0, 0.7137255, 1, 1,
0.155117, 0.8329467, 0.6023517, 0, 0.7058824, 1, 1,
0.1555113, -2.39193, 3.239347, 0, 0.6980392, 1, 1,
0.1567868, 0.560534, -0.615384, 0, 0.6941177, 1, 1,
0.1590812, 1.673819, 0.09035718, 0, 0.6862745, 1, 1,
0.1607432, 0.4705572, 2.259346, 0, 0.682353, 1, 1,
0.1617159, 0.8434951, 2.112079, 0, 0.6745098, 1, 1,
0.1631581, -0.8377749, 2.455693, 0, 0.6705883, 1, 1,
0.1640218, -0.11353, 2.676427, 0, 0.6627451, 1, 1,
0.166686, 0.7565753, 0.495581, 0, 0.6588235, 1, 1,
0.1676401, 1.393108, -1.439473, 0, 0.6509804, 1, 1,
0.177425, -0.3657945, 2.615169, 0, 0.6470588, 1, 1,
0.1905156, -2.026675, 4.389562, 0, 0.6392157, 1, 1,
0.1906082, -1.517057, 2.623179, 0, 0.6352941, 1, 1,
0.1917741, -1.045608, 4.717938, 0, 0.627451, 1, 1,
0.1932573, -0.4079456, 1.562458, 0, 0.6235294, 1, 1,
0.1954509, 0.6253913, 0.3175323, 0, 0.6156863, 1, 1,
0.1970287, -0.5102634, 2.149833, 0, 0.6117647, 1, 1,
0.1996443, 0.4818222, 0.6636193, 0, 0.6039216, 1, 1,
0.2011262, 0.1033651, 0.7260476, 0, 0.5960785, 1, 1,
0.2020233, 1.359678, -0.303791, 0, 0.5921569, 1, 1,
0.202976, -0.2708832, 1.479136, 0, 0.5843138, 1, 1,
0.2031807, 1.056314, 0.7406077, 0, 0.5803922, 1, 1,
0.2039694, -0.3692318, 2.686442, 0, 0.572549, 1, 1,
0.2049199, 3.461731, 0.9625792, 0, 0.5686275, 1, 1,
0.2057405, -0.5915805, 2.79515, 0, 0.5607843, 1, 1,
0.2065674, 0.5896415, -1.227364, 0, 0.5568628, 1, 1,
0.209446, -0.2072252, 3.092953, 0, 0.5490196, 1, 1,
0.2123124, -1.144509, 1.621285, 0, 0.5450981, 1, 1,
0.216669, 0.172466, 0.01917192, 0, 0.5372549, 1, 1,
0.2168107, 0.2619977, 2.225348, 0, 0.5333334, 1, 1,
0.2171369, 0.4271884, 1.813648, 0, 0.5254902, 1, 1,
0.2255497, -0.1956606, 3.733792, 0, 0.5215687, 1, 1,
0.2256195, 2.272299, -1.731618, 0, 0.5137255, 1, 1,
0.2307214, 0.7603295, 0.8637993, 0, 0.509804, 1, 1,
0.2365863, -0.4353334, 1.098415, 0, 0.5019608, 1, 1,
0.2368077, 0.3734161, 0.1435459, 0, 0.4941176, 1, 1,
0.2395, 0.5865719, 0.8620995, 0, 0.4901961, 1, 1,
0.2444891, -1.050924, 3.223864, 0, 0.4823529, 1, 1,
0.2451161, 1.743396, 0.8027477, 0, 0.4784314, 1, 1,
0.2460964, -2.113009, 4.80855, 0, 0.4705882, 1, 1,
0.2496238, -2.161927, 3.004078, 0, 0.4666667, 1, 1,
0.2522379, 0.3217024, -0.6304322, 0, 0.4588235, 1, 1,
0.2532861, 0.1224235, 0.573576, 0, 0.454902, 1, 1,
0.2569423, 1.19584, 1.313692, 0, 0.4470588, 1, 1,
0.2575195, -0.3495297, 1.593565, 0, 0.4431373, 1, 1,
0.2597812, -0.6809418, 2.802184, 0, 0.4352941, 1, 1,
0.2602553, 0.8632714, -0.09100494, 0, 0.4313726, 1, 1,
0.2630992, 1.509394, 2.631238, 0, 0.4235294, 1, 1,
0.264134, -0.4013762, 2.746066, 0, 0.4196078, 1, 1,
0.26533, -1.795998, 2.291027, 0, 0.4117647, 1, 1,
0.2678964, 0.1056189, 1.442893, 0, 0.4078431, 1, 1,
0.268586, -0.4341316, 1.546098, 0, 0.4, 1, 1,
0.268652, -1.453011, 1.442487, 0, 0.3921569, 1, 1,
0.2691411, -1.387449, 1.524634, 0, 0.3882353, 1, 1,
0.2722693, 1.293223, -1.839647, 0, 0.3803922, 1, 1,
0.2740165, 1.000955, 0.2817428, 0, 0.3764706, 1, 1,
0.2759197, 0.4394498, 1.081658, 0, 0.3686275, 1, 1,
0.2809334, 0.1400785, 2.895477, 0, 0.3647059, 1, 1,
0.2819096, 1.858446, -0.1127848, 0, 0.3568628, 1, 1,
0.2829362, 0.3164198, -0.07536335, 0, 0.3529412, 1, 1,
0.2857621, 0.1158963, 1.329647, 0, 0.345098, 1, 1,
0.2875425, -0.257317, 2.804345, 0, 0.3411765, 1, 1,
0.2897949, 1.094716, -0.4458272, 0, 0.3333333, 1, 1,
0.2900391, -0.5897405, 0.1426932, 0, 0.3294118, 1, 1,
0.292605, 0.9491876, 1.513946, 0, 0.3215686, 1, 1,
0.2947274, 0.6181495, 0.2793333, 0, 0.3176471, 1, 1,
0.2986302, -1.14258, 2.545847, 0, 0.3098039, 1, 1,
0.2999033, -1.065919, 2.316698, 0, 0.3058824, 1, 1,
0.3010712, 0.2723807, 2.060611, 0, 0.2980392, 1, 1,
0.3024677, 0.5869654, 0.1667442, 0, 0.2901961, 1, 1,
0.3054137, 0.7169693, -0.625191, 0, 0.2862745, 1, 1,
0.3067396, 1.071311, -0.7457585, 0, 0.2784314, 1, 1,
0.31391, -0.6150647, 5.697716, 0, 0.2745098, 1, 1,
0.3145271, 0.496015, 2.868192, 0, 0.2666667, 1, 1,
0.3215084, 1.328909, 1.014103, 0, 0.2627451, 1, 1,
0.3271103, 0.2843252, -0.8401912, 0, 0.254902, 1, 1,
0.328251, -0.2848875, 3.070054, 0, 0.2509804, 1, 1,
0.3321862, 0.5139629, -0.2954887, 0, 0.2431373, 1, 1,
0.3345937, -2.031107, 2.942844, 0, 0.2392157, 1, 1,
0.3415587, -0.9450569, 3.44921, 0, 0.2313726, 1, 1,
0.3424394, -0.4870325, 2.192201, 0, 0.227451, 1, 1,
0.348467, -0.187255, 0.9615623, 0, 0.2196078, 1, 1,
0.3536045, -1.782568, 1.924743, 0, 0.2156863, 1, 1,
0.3570288, -0.3623792, 3.653829, 0, 0.2078431, 1, 1,
0.359758, -0.06197277, 2.088425, 0, 0.2039216, 1, 1,
0.3607122, -0.1013067, 3.10429, 0, 0.1960784, 1, 1,
0.3650151, 0.5085095, 0.5653017, 0, 0.1882353, 1, 1,
0.3656703, -1.640961, 3.712862, 0, 0.1843137, 1, 1,
0.3721439, 0.0892189, 1.257365, 0, 0.1764706, 1, 1,
0.3756735, 1.367802, 0.4016833, 0, 0.172549, 1, 1,
0.3781754, 1.50602, 2.171814, 0, 0.1647059, 1, 1,
0.3797509, 0.06255921, 1.608546, 0, 0.1607843, 1, 1,
0.3841991, 1.121794, 0.6085246, 0, 0.1529412, 1, 1,
0.386627, 0.08794294, 0.06241076, 0, 0.1490196, 1, 1,
0.3866678, 1.281338, 0.7663646, 0, 0.1411765, 1, 1,
0.3877349, 0.5253661, 1.807125, 0, 0.1372549, 1, 1,
0.3938031, -0.3776249, 1.946465, 0, 0.1294118, 1, 1,
0.3956208, 0.7670112, 0.9656774, 0, 0.1254902, 1, 1,
0.3969793, 0.6235406, 0.5241662, 0, 0.1176471, 1, 1,
0.4020785, 1.00074, -0.3860597, 0, 0.1137255, 1, 1,
0.4036493, -1.222334, 2.347423, 0, 0.1058824, 1, 1,
0.4075904, -0.7865075, 2.128834, 0, 0.09803922, 1, 1,
0.4077764, 0.0460122, 3.284619, 0, 0.09411765, 1, 1,
0.408883, 0.4167902, -0.05123658, 0, 0.08627451, 1, 1,
0.4110949, 1.452442, -0.7049619, 0, 0.08235294, 1, 1,
0.4115794, 0.1307467, 2.92188, 0, 0.07450981, 1, 1,
0.4173323, 0.2275493, -0.3474448, 0, 0.07058824, 1, 1,
0.4178805, 0.9678247, 1.817677, 0, 0.0627451, 1, 1,
0.4225412, 0.3964739, 0.7230342, 0, 0.05882353, 1, 1,
0.4286616, 1.662149, 2.188549, 0, 0.05098039, 1, 1,
0.4296744, 1.569403, -0.5597192, 0, 0.04705882, 1, 1,
0.4320884, 0.3125925, 0.1891723, 0, 0.03921569, 1, 1,
0.4327329, -0.1388291, 0.9780694, 0, 0.03529412, 1, 1,
0.436202, -0.6627937, 0.1202941, 0, 0.02745098, 1, 1,
0.4372206, 0.2004389, 0.9941214, 0, 0.02352941, 1, 1,
0.4427004, 0.2701511, 1.312656, 0, 0.01568628, 1, 1,
0.443244, -1.693121, 4.55326, 0, 0.01176471, 1, 1,
0.4438392, -0.08236639, 2.182927, 0, 0.003921569, 1, 1,
0.4489654, 0.8976692, 0.8941057, 0.003921569, 0, 1, 1,
0.4490006, 0.4243948, -0.715255, 0.007843138, 0, 1, 1,
0.4513589, -1.273393, 0.8820884, 0.01568628, 0, 1, 1,
0.4546839, 1.144067, -0.1503926, 0.01960784, 0, 1, 1,
0.4569218, 1.49384, -0.3479262, 0.02745098, 0, 1, 1,
0.464704, 0.782441, 0.6975124, 0.03137255, 0, 1, 1,
0.4654388, -0.4122896, 1.360848, 0.03921569, 0, 1, 1,
0.4668227, 0.3945943, 0.4409637, 0.04313726, 0, 1, 1,
0.4754328, -1.223452, 2.57192, 0.05098039, 0, 1, 1,
0.4767153, 0.5755511, 1.987312, 0.05490196, 0, 1, 1,
0.4771739, 0.9433733, 1.506914, 0.0627451, 0, 1, 1,
0.4817439, 0.8474045, 0.4852883, 0.06666667, 0, 1, 1,
0.4835333, 0.7345641, 0.4075334, 0.07450981, 0, 1, 1,
0.4857336, 0.407457, 0.817904, 0.07843138, 0, 1, 1,
0.4869329, -0.3202834, 4.591191, 0.08627451, 0, 1, 1,
0.4952604, 3.443053, 0.7171486, 0.09019608, 0, 1, 1,
0.4956614, 0.08729761, 2.134055, 0.09803922, 0, 1, 1,
0.4958601, 0.5517218, 0.2212628, 0.1058824, 0, 1, 1,
0.4962452, 0.430439, 1.50491, 0.1098039, 0, 1, 1,
0.4980426, 0.3113538, 1.975442, 0.1176471, 0, 1, 1,
0.5002983, -1.092676, 2.427044, 0.1215686, 0, 1, 1,
0.5036871, 0.4537027, 1.217184, 0.1294118, 0, 1, 1,
0.5060044, -0.1351449, 0.6035963, 0.1333333, 0, 1, 1,
0.5074864, -0.1826096, 0.0288124, 0.1411765, 0, 1, 1,
0.5184484, -0.4111047, 1.774003, 0.145098, 0, 1, 1,
0.5313309, 0.9473397, 2.704252, 0.1529412, 0, 1, 1,
0.5317623, 0.2304263, 0.9933828, 0.1568628, 0, 1, 1,
0.5331179, 0.9951841, 0.2701386, 0.1647059, 0, 1, 1,
0.535886, -0.4986018, 2.95884, 0.1686275, 0, 1, 1,
0.537109, 0.1706215, 0.3720494, 0.1764706, 0, 1, 1,
0.5392537, -0.577787, 2.575514, 0.1803922, 0, 1, 1,
0.5465485, 0.2423335, -0.5277731, 0.1882353, 0, 1, 1,
0.5476434, 1.354714, 0.2546648, 0.1921569, 0, 1, 1,
0.5552512, -0.9675179, 3.701295, 0.2, 0, 1, 1,
0.557664, 2.297197, -0.5721663, 0.2078431, 0, 1, 1,
0.5600216, -0.277706, 2.934491, 0.2117647, 0, 1, 1,
0.5640445, 0.2684781, 2.212675, 0.2196078, 0, 1, 1,
0.5657467, 0.6302232, 0.7591234, 0.2235294, 0, 1, 1,
0.5674143, -1.126154, 2.242933, 0.2313726, 0, 1, 1,
0.5697706, 1.19259, -0.773616, 0.2352941, 0, 1, 1,
0.5702357, -0.8278804, 3.756264, 0.2431373, 0, 1, 1,
0.5710999, -0.9881203, 4.013922, 0.2470588, 0, 1, 1,
0.5739338, -1.108179, 4.573386, 0.254902, 0, 1, 1,
0.5746654, -0.4365524, 1.676139, 0.2588235, 0, 1, 1,
0.5766684, -0.3555529, 4.122374, 0.2666667, 0, 1, 1,
0.57768, 1.487582, -0.1842723, 0.2705882, 0, 1, 1,
0.5797291, 0.9780404, 1.518926, 0.2784314, 0, 1, 1,
0.5812007, -0.1035305, 2.240736, 0.282353, 0, 1, 1,
0.5827184, -0.002293781, 1.240829, 0.2901961, 0, 1, 1,
0.5848836, 2.685998, 0.7028509, 0.2941177, 0, 1, 1,
0.5864769, 0.6731609, -0.6116176, 0.3019608, 0, 1, 1,
0.5865395, -0.6003415, 3.16871, 0.3098039, 0, 1, 1,
0.5882544, 1.127406, 1.337666, 0.3137255, 0, 1, 1,
0.5980816, -0.4887457, 3.905712, 0.3215686, 0, 1, 1,
0.5995271, -0.05747981, 1.056574, 0.3254902, 0, 1, 1,
0.6034517, 0.8554195, -0.5528368, 0.3333333, 0, 1, 1,
0.6038442, -0.3955209, 0.6941563, 0.3372549, 0, 1, 1,
0.6062856, -0.2474661, 1.985456, 0.345098, 0, 1, 1,
0.6150185, -0.8192076, 4.134049, 0.3490196, 0, 1, 1,
0.6195065, 1.304628, 0.08313306, 0.3568628, 0, 1, 1,
0.6199758, 0.292967, -0.05227153, 0.3607843, 0, 1, 1,
0.6246443, 0.3123162, 1.674579, 0.3686275, 0, 1, 1,
0.6259254, -0.1720353, 1.805595, 0.372549, 0, 1, 1,
0.6285962, 0.9246949, 0.1629966, 0.3803922, 0, 1, 1,
0.6294033, -0.9531658, 3.036282, 0.3843137, 0, 1, 1,
0.6301031, -0.8413925, 1.911803, 0.3921569, 0, 1, 1,
0.6340675, 2.147031, -0.7692713, 0.3960784, 0, 1, 1,
0.63981, 0.5242538, 1.875409, 0.4039216, 0, 1, 1,
0.6413977, 0.3175319, -0.01418781, 0.4117647, 0, 1, 1,
0.641901, 0.5906682, 0.7151174, 0.4156863, 0, 1, 1,
0.6528327, -0.5230781, 2.887792, 0.4235294, 0, 1, 1,
0.6540992, 0.9673834, 0.06844568, 0.427451, 0, 1, 1,
0.6541115, 1.256376, 0.2230827, 0.4352941, 0, 1, 1,
0.6575544, 1.107045, 2.236909, 0.4392157, 0, 1, 1,
0.660155, 1.903134, 1.03473, 0.4470588, 0, 1, 1,
0.6680669, -0.3616352, 2.03666, 0.4509804, 0, 1, 1,
0.6700648, 1.660618, 0.6834279, 0.4588235, 0, 1, 1,
0.6729366, -1.328228, 3.221604, 0.4627451, 0, 1, 1,
0.6758795, 2.124006, 1.378843, 0.4705882, 0, 1, 1,
0.6779181, -0.1498225, 0.348314, 0.4745098, 0, 1, 1,
0.679514, 0.2531106, -0.3185438, 0.4823529, 0, 1, 1,
0.682776, 0.8505486, 1.54852, 0.4862745, 0, 1, 1,
0.6840565, -1.263537, 1.386049, 0.4941176, 0, 1, 1,
0.6858115, -1.856768, 2.091503, 0.5019608, 0, 1, 1,
0.6961425, 1.018295, 1.037586, 0.5058824, 0, 1, 1,
0.6970305, -1.164096, 2.185927, 0.5137255, 0, 1, 1,
0.6980109, 1.286635, 0.2363771, 0.5176471, 0, 1, 1,
0.7079723, -1.845464, 2.879287, 0.5254902, 0, 1, 1,
0.7082935, -0.7401453, 3.210244, 0.5294118, 0, 1, 1,
0.7083018, 1.795342, 1.284448, 0.5372549, 0, 1, 1,
0.7106338, -1.508506, 2.71658, 0.5411765, 0, 1, 1,
0.717736, -1.598289, 1.509836, 0.5490196, 0, 1, 1,
0.7181198, -1.120287, 2.658492, 0.5529412, 0, 1, 1,
0.7283232, 0.3324417, 0.5256104, 0.5607843, 0, 1, 1,
0.7302967, 0.07407215, 0.6424948, 0.5647059, 0, 1, 1,
0.732152, 0.1694202, 0.7947455, 0.572549, 0, 1, 1,
0.7364954, 0.3778804, 1.37606, 0.5764706, 0, 1, 1,
0.7412451, 0.1863507, 2.050961, 0.5843138, 0, 1, 1,
0.7489665, 0.08788245, 1.99764, 0.5882353, 0, 1, 1,
0.7498189, 0.2851109, 2.244207, 0.5960785, 0, 1, 1,
0.7559295, 2.359252, 0.3391808, 0.6039216, 0, 1, 1,
0.7628357, -0.05307503, -0.4929134, 0.6078432, 0, 1, 1,
0.7668865, -0.4874003, 2.987443, 0.6156863, 0, 1, 1,
0.7672714, 0.6138489, -0.1375049, 0.6196079, 0, 1, 1,
0.7677091, 0.4749258, -0.7465736, 0.627451, 0, 1, 1,
0.7721357, -0.5272955, 1.935842, 0.6313726, 0, 1, 1,
0.7739857, -0.1083884, 1.097631, 0.6392157, 0, 1, 1,
0.7756473, -0.6496901, 3.043611, 0.6431373, 0, 1, 1,
0.7840043, 0.1869795, 0.9090347, 0.6509804, 0, 1, 1,
0.7844032, 0.3152819, 1.808227, 0.654902, 0, 1, 1,
0.7845174, -2.07687, 2.852423, 0.6627451, 0, 1, 1,
0.7864071, 0.1251157, 2.243933, 0.6666667, 0, 1, 1,
0.7884459, 0.1783796, 1.245087, 0.6745098, 0, 1, 1,
0.789376, -1.354611, 3.843145, 0.6784314, 0, 1, 1,
0.7900974, -0.9720882, 2.171152, 0.6862745, 0, 1, 1,
0.7935094, 0.869199, 0.754689, 0.6901961, 0, 1, 1,
0.8028498, 0.8921397, 2.741221, 0.6980392, 0, 1, 1,
0.8081068, -1.397738, 2.339894, 0.7058824, 0, 1, 1,
0.8108662, 0.6210297, 0.8657994, 0.7098039, 0, 1, 1,
0.8152413, 1.539844, 0.4604155, 0.7176471, 0, 1, 1,
0.8292841, -1.933393, 2.683794, 0.7215686, 0, 1, 1,
0.8352144, 1.481415, 1.005648, 0.7294118, 0, 1, 1,
0.835375, -1.217647, 1.423152, 0.7333333, 0, 1, 1,
0.8378004, -1.395599, 3.625717, 0.7411765, 0, 1, 1,
0.8390306, 0.04321511, 0.6638696, 0.7450981, 0, 1, 1,
0.8436739, 1.007751, 0.5970673, 0.7529412, 0, 1, 1,
0.8529797, 1.664183, 1.851344, 0.7568628, 0, 1, 1,
0.8555949, -0.922554, 2.366432, 0.7647059, 0, 1, 1,
0.8587017, -2.188342, 0.8695952, 0.7686275, 0, 1, 1,
0.8598937, -0.1729153, 2.868577, 0.7764706, 0, 1, 1,
0.8650451, -1.566735, 2.514555, 0.7803922, 0, 1, 1,
0.8697597, -0.1641157, 1.273304, 0.7882353, 0, 1, 1,
0.8709521, -0.5973289, 1.111383, 0.7921569, 0, 1, 1,
0.8719644, 0.7797709, 1.097156, 0.8, 0, 1, 1,
0.8782838, 0.7548927, 0.06294625, 0.8078431, 0, 1, 1,
0.87872, -1.19934, 2.622767, 0.8117647, 0, 1, 1,
0.8795555, 0.9670208, 0.1084001, 0.8196079, 0, 1, 1,
0.8841073, 1.068525, 0.4997019, 0.8235294, 0, 1, 1,
0.8841735, 1.568645, 0.2553618, 0.8313726, 0, 1, 1,
0.8848805, -0.9861178, 3.208269, 0.8352941, 0, 1, 1,
0.8877168, 1.005025, -0.04845183, 0.8431373, 0, 1, 1,
0.9149836, -0.4452746, 1.596327, 0.8470588, 0, 1, 1,
0.9216495, -0.512414, 2.109567, 0.854902, 0, 1, 1,
0.9224243, -1.041875, 0.8600558, 0.8588235, 0, 1, 1,
0.9279413, -0.06203182, 1.285139, 0.8666667, 0, 1, 1,
0.9297241, -0.4895832, 2.870405, 0.8705882, 0, 1, 1,
0.9346051, -0.8957138, 3.631982, 0.8784314, 0, 1, 1,
0.9353572, 0.4847011, 0.4519663, 0.8823529, 0, 1, 1,
0.9387894, -0.6437519, 1.348264, 0.8901961, 0, 1, 1,
0.9472413, -0.6573237, 2.036457, 0.8941177, 0, 1, 1,
0.9491583, -1.033833, 2.302385, 0.9019608, 0, 1, 1,
0.9567549, -0.8332928, 3.637363, 0.9098039, 0, 1, 1,
0.9577633, -0.6554706, 1.204909, 0.9137255, 0, 1, 1,
0.9799816, 0.3463797, 1.474954, 0.9215686, 0, 1, 1,
0.9814823, 1.503442, -0.5420973, 0.9254902, 0, 1, 1,
0.9850482, -0.7246925, 2.648782, 0.9333333, 0, 1, 1,
0.9868595, -1.475369, 1.955007, 0.9372549, 0, 1, 1,
0.9913014, 1.121211, 0.4433401, 0.945098, 0, 1, 1,
0.9954073, -1.490707, 4.070058, 0.9490196, 0, 1, 1,
1.000338, 1.118675, 1.319093, 0.9568627, 0, 1, 1,
1.003754, -1.121078, 0.1109872, 0.9607843, 0, 1, 1,
1.005643, 2.301917, -0.08932672, 0.9686275, 0, 1, 1,
1.006036, 1.540151, 0.6143339, 0.972549, 0, 1, 1,
1.007286, 0.2136364, 2.427231, 0.9803922, 0, 1, 1,
1.007841, 1.656853, -0.8695682, 0.9843137, 0, 1, 1,
1.013104, -1.638816, 1.393545, 0.9921569, 0, 1, 1,
1.016397, 0.4084685, 1.156305, 0.9960784, 0, 1, 1,
1.01785, 0.07864701, 1.182071, 1, 0, 0.9960784, 1,
1.024655, 0.06680271, 1.54556, 1, 0, 0.9882353, 1,
1.027495, 2.250026, 0.6791651, 1, 0, 0.9843137, 1,
1.028027, 0.3887107, 1.140122, 1, 0, 0.9764706, 1,
1.028046, -0.03684213, 2.573771, 1, 0, 0.972549, 1,
1.029599, -0.5034158, 2.207783, 1, 0, 0.9647059, 1,
1.029889, -0.3344827, 2.067625, 1, 0, 0.9607843, 1,
1.032934, 0.1522767, 1.71859, 1, 0, 0.9529412, 1,
1.036698, 0.3362294, 3.121825, 1, 0, 0.9490196, 1,
1.039123, -0.5507997, 0.008753955, 1, 0, 0.9411765, 1,
1.041173, -1.020824, 1.485478, 1, 0, 0.9372549, 1,
1.048681, 1.83757, 0.7196779, 1, 0, 0.9294118, 1,
1.050224, -1.065429, 3.019317, 1, 0, 0.9254902, 1,
1.054139, 1.297395, 2.204882, 1, 0, 0.9176471, 1,
1.059245, -0.0676446, 2.048574, 1, 0, 0.9137255, 1,
1.061562, 0.3997117, 1.64104, 1, 0, 0.9058824, 1,
1.065369, 2.74218, -0.6499403, 1, 0, 0.9019608, 1,
1.069152, -0.006623816, 2.795249, 1, 0, 0.8941177, 1,
1.08193, 0.9631816, -0.3722207, 1, 0, 0.8862745, 1,
1.097673, -1.2304, 1.244727, 1, 0, 0.8823529, 1,
1.101516, 0.5506402, 0.1203373, 1, 0, 0.8745098, 1,
1.103637, -0.8452659, 2.936351, 1, 0, 0.8705882, 1,
1.105658, 0.4276586, 1.662827, 1, 0, 0.8627451, 1,
1.108498, -1.603197, -0.05865194, 1, 0, 0.8588235, 1,
1.110722, -0.1512632, 3.421074, 1, 0, 0.8509804, 1,
1.118977, 1.063885, 1.484691, 1, 0, 0.8470588, 1,
1.121104, 0.5791605, 3.162607, 1, 0, 0.8392157, 1,
1.124465, -1.962486, 3.868632, 1, 0, 0.8352941, 1,
1.131076, 0.8945709, 0.01238899, 1, 0, 0.827451, 1,
1.133866, -1.517114, 2.331549, 1, 0, 0.8235294, 1,
1.141134, -0.2274057, 1.825344, 1, 0, 0.8156863, 1,
1.14605, 2.077702, -0.5456398, 1, 0, 0.8117647, 1,
1.155561, -0.7816483, 2.175185, 1, 0, 0.8039216, 1,
1.156888, 0.1929695, 0.8646578, 1, 0, 0.7960784, 1,
1.15717, 0.4478308, 0.9905137, 1, 0, 0.7921569, 1,
1.160954, 0.7395409, 2.024134, 1, 0, 0.7843137, 1,
1.162964, -1.278066, 1.701709, 1, 0, 0.7803922, 1,
1.164199, 0.139827, 2.541539, 1, 0, 0.772549, 1,
1.166228, 1.710021, 1.540383, 1, 0, 0.7686275, 1,
1.17995, -1.15302, 2.83347, 1, 0, 0.7607843, 1,
1.185029, -0.9539821, 3.017091, 1, 0, 0.7568628, 1,
1.188636, 1.481609, 0.895097, 1, 0, 0.7490196, 1,
1.190324, 0.1361791, 0.4853785, 1, 0, 0.7450981, 1,
1.207399, 0.01068131, 3.192332, 1, 0, 0.7372549, 1,
1.210698, -1.721695, 3.446612, 1, 0, 0.7333333, 1,
1.226603, 0.5500749, 1.221831, 1, 0, 0.7254902, 1,
1.234761, 1.730425, 0.9897591, 1, 0, 0.7215686, 1,
1.243166, 0.7351653, 1.450794, 1, 0, 0.7137255, 1,
1.248037, -0.7541564, 2.433546, 1, 0, 0.7098039, 1,
1.249388, -0.708564, 4.341703, 1, 0, 0.7019608, 1,
1.251836, -0.367633, 2.103382, 1, 0, 0.6941177, 1,
1.26193, -0.4557978, 2.184756, 1, 0, 0.6901961, 1,
1.269575, -0.3838609, 0.855544, 1, 0, 0.682353, 1,
1.269608, -1.452535, 2.839499, 1, 0, 0.6784314, 1,
1.276911, -0.8452598, 1.067467, 1, 0, 0.6705883, 1,
1.278212, 0.1624734, 1.86022, 1, 0, 0.6666667, 1,
1.288619, 1.201979, -1.0113, 1, 0, 0.6588235, 1,
1.289253, -1.523459, 2.089819, 1, 0, 0.654902, 1,
1.289894, 0.9468917, -0.04190265, 1, 0, 0.6470588, 1,
1.29874, 0.5157737, 0.41756, 1, 0, 0.6431373, 1,
1.306653, -2.113371, 3.725215, 1, 0, 0.6352941, 1,
1.310303, -0.02409612, 0.947432, 1, 0, 0.6313726, 1,
1.317995, 0.1290639, 1.522321, 1, 0, 0.6235294, 1,
1.318457, -0.7059673, 1.470047, 1, 0, 0.6196079, 1,
1.325398, -2.021435, 3.019521, 1, 0, 0.6117647, 1,
1.325623, -0.5377952, 1.143037, 1, 0, 0.6078432, 1,
1.330571, -0.06361146, 1.537594, 1, 0, 0.6, 1,
1.331402, -1.594321, 3.005754, 1, 0, 0.5921569, 1,
1.331728, 0.07584466, 1.193603, 1, 0, 0.5882353, 1,
1.333105, 0.02015785, 0.207781, 1, 0, 0.5803922, 1,
1.333871, 0.5586694, -0.0449893, 1, 0, 0.5764706, 1,
1.35427, -0.6452417, 4.196239, 1, 0, 0.5686275, 1,
1.362739, -0.1067028, 3.118446, 1, 0, 0.5647059, 1,
1.375238, -0.1882337, 1.935129, 1, 0, 0.5568628, 1,
1.375775, 1.462055, 0.4708033, 1, 0, 0.5529412, 1,
1.388588, 0.3630316, -0.4117527, 1, 0, 0.5450981, 1,
1.392733, 0.3811072, 2.83776, 1, 0, 0.5411765, 1,
1.402022, 0.7807402, 2.383463, 1, 0, 0.5333334, 1,
1.402717, -0.5872422, 0.346004, 1, 0, 0.5294118, 1,
1.408165, -1.109539, 2.539131, 1, 0, 0.5215687, 1,
1.416291, 0.4037554, 0.9202881, 1, 0, 0.5176471, 1,
1.417905, 0.3465981, 2.782551, 1, 0, 0.509804, 1,
1.428115, -0.6736975, 2.78443, 1, 0, 0.5058824, 1,
1.440516, -0.5404853, 0.6310238, 1, 0, 0.4980392, 1,
1.446164, -0.9973467, 2.217644, 1, 0, 0.4901961, 1,
1.453434, 1.18705, 0.02631808, 1, 0, 0.4862745, 1,
1.454914, 0.8441299, 0.3021201, 1, 0, 0.4784314, 1,
1.459778, -0.9422477, 0.9180959, 1, 0, 0.4745098, 1,
1.464489, -0.3305426, 3.362458, 1, 0, 0.4666667, 1,
1.464675, 0.5702985, 0.500887, 1, 0, 0.4627451, 1,
1.48152, -0.3759966, 1.988092, 1, 0, 0.454902, 1,
1.488051, 0.6065117, 0.9594011, 1, 0, 0.4509804, 1,
1.489534, 0.4262416, 2.398545, 1, 0, 0.4431373, 1,
1.49498, -0.8796273, 0.6902985, 1, 0, 0.4392157, 1,
1.49904, 1.252393, 0.7158468, 1, 0, 0.4313726, 1,
1.50466, 0.9677349, 0.07056856, 1, 0, 0.427451, 1,
1.505633, 0.5607705, 0.4402391, 1, 0, 0.4196078, 1,
1.507431, 0.9640199, 0.3864049, 1, 0, 0.4156863, 1,
1.538088, 0.8215494, -0.6437259, 1, 0, 0.4078431, 1,
1.545755, 0.4355197, 1.678003, 1, 0, 0.4039216, 1,
1.546963, -1.037519, 2.304335, 1, 0, 0.3960784, 1,
1.551179, -1.36698, 3.44982, 1, 0, 0.3882353, 1,
1.555371, -0.1966023, 1.836152, 1, 0, 0.3843137, 1,
1.571905, 0.4765517, 0.7473222, 1, 0, 0.3764706, 1,
1.584263, -0.3442667, -0.1352886, 1, 0, 0.372549, 1,
1.589026, -0.8624634, 0.5954795, 1, 0, 0.3647059, 1,
1.602301, -0.9196396, 4.079419, 1, 0, 0.3607843, 1,
1.60644, -0.2807986, 2.407358, 1, 0, 0.3529412, 1,
1.614844, -0.6878128, 1.935933, 1, 0, 0.3490196, 1,
1.643551, 1.175111, 1.097077, 1, 0, 0.3411765, 1,
1.654268, 0.5337853, 1.427208, 1, 0, 0.3372549, 1,
1.675849, -0.9446645, 3.093833, 1, 0, 0.3294118, 1,
1.71427, 1.052721, 1.171904, 1, 0, 0.3254902, 1,
1.723406, 0.2222047, -0.4827972, 1, 0, 0.3176471, 1,
1.73371, 0.3450018, 0.6611027, 1, 0, 0.3137255, 1,
1.738535, -0.2744624, 2.551936, 1, 0, 0.3058824, 1,
1.73918, -1.614642, 2.252867, 1, 0, 0.2980392, 1,
1.739406, 0.169609, 0.7842783, 1, 0, 0.2941177, 1,
1.758658, -0.3743814, 1.819728, 1, 0, 0.2862745, 1,
1.763903, -0.6953467, 2.283168, 1, 0, 0.282353, 1,
1.775686, 1.014112, 2.16588, 1, 0, 0.2745098, 1,
1.807565, -0.4052907, 0.9908565, 1, 0, 0.2705882, 1,
1.814832, 1.211347, 1.762029, 1, 0, 0.2627451, 1,
1.827719, 0.9357588, 1.844007, 1, 0, 0.2588235, 1,
1.829243, 0.1168858, 2.814283, 1, 0, 0.2509804, 1,
1.841293, -1.42375, 3.114452, 1, 0, 0.2470588, 1,
1.841485, 0.8009362, 0.9160069, 1, 0, 0.2392157, 1,
1.853237, -0.4987435, 1.245407, 1, 0, 0.2352941, 1,
1.876017, 1.216895, 1.858429, 1, 0, 0.227451, 1,
1.879892, 0.6217995, 0.3905311, 1, 0, 0.2235294, 1,
1.882197, 0.483747, 0.2640949, 1, 0, 0.2156863, 1,
1.923894, -0.04550151, 2.947514, 1, 0, 0.2117647, 1,
1.941362, -1.331699, 0.9297805, 1, 0, 0.2039216, 1,
1.948328, 0.702389, 2.09335, 1, 0, 0.1960784, 1,
1.955865, -1.179415, 3.082713, 1, 0, 0.1921569, 1,
1.968609, 0.6281046, 1.976674, 1, 0, 0.1843137, 1,
1.969765, 0.1503344, 2.690517, 1, 0, 0.1803922, 1,
1.973297, -0.2892579, 2.78274, 1, 0, 0.172549, 1,
1.974185, 0.1314323, 0.9925789, 1, 0, 0.1686275, 1,
1.981589, 0.5493711, 0.8191609, 1, 0, 0.1607843, 1,
2.015037, -1.261633, 2.187176, 1, 0, 0.1568628, 1,
2.018532, 0.8158872, 2.106265, 1, 0, 0.1490196, 1,
2.034652, 0.4180704, 0.974758, 1, 0, 0.145098, 1,
2.043299, -0.1372301, -0.6079856, 1, 0, 0.1372549, 1,
2.045991, -0.5275953, 0.9580046, 1, 0, 0.1333333, 1,
2.053895, 0.4022489, 3.126501, 1, 0, 0.1254902, 1,
2.056891, -0.6808049, 3.608013, 1, 0, 0.1215686, 1,
2.079855, -1.296968, 3.289522, 1, 0, 0.1137255, 1,
2.12423, -1.141334, 2.172835, 1, 0, 0.1098039, 1,
2.126243, -1.342094, 3.422506, 1, 0, 0.1019608, 1,
2.135111, 0.8598235, 1.914884, 1, 0, 0.09411765, 1,
2.164904, -0.1789939, 2.342782, 1, 0, 0.09019608, 1,
2.206306, -0.3921255, 3.378982, 1, 0, 0.08235294, 1,
2.215574, 0.446748, 1.286745, 1, 0, 0.07843138, 1,
2.221858, 1.267218, 1.294227, 1, 0, 0.07058824, 1,
2.252184, 2.533702, 1.469016, 1, 0, 0.06666667, 1,
2.268414, -1.175362, 4.871581, 1, 0, 0.05882353, 1,
2.293726, 1.768138, -0.3731573, 1, 0, 0.05490196, 1,
2.31176, 1.505129, 1.190489, 1, 0, 0.04705882, 1,
2.33202, 0.3002584, 2.073755, 1, 0, 0.04313726, 1,
2.390273, -0.5174798, 2.497029, 1, 0, 0.03529412, 1,
2.391254, 0.6464125, 1.74843, 1, 0, 0.03137255, 1,
2.466972, -0.3520252, 4.567601, 1, 0, 0.02352941, 1,
2.508865, 0.07071953, 1.996018, 1, 0, 0.01960784, 1,
2.725526, 1.723318, 0.4010051, 1, 0, 0.01176471, 1,
2.943118, -0.6807972, 2.273178, 1, 0, 0.007843138, 1
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
-0.05102634, -3.976145, -6.769825, 0, -0.5, 0.5, 0.5,
-0.05102634, -3.976145, -6.769825, 1, -0.5, 0.5, 0.5,
-0.05102634, -3.976145, -6.769825, 1, 1.5, 0.5, 0.5,
-0.05102634, -3.976145, -6.769825, 0, 1.5, 0.5, 0.5
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
-4.060185, 0.2817928, -6.769825, 0, -0.5, 0.5, 0.5,
-4.060185, 0.2817928, -6.769825, 1, -0.5, 0.5, 0.5,
-4.060185, 0.2817928, -6.769825, 1, 1.5, 0.5, 0.5,
-4.060185, 0.2817928, -6.769825, 0, 1.5, 0.5, 0.5
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
-4.060185, -3.976145, 0.3674293, 0, -0.5, 0.5, 0.5,
-4.060185, -3.976145, 0.3674293, 1, -0.5, 0.5, 0.5,
-4.060185, -3.976145, 0.3674293, 1, 1.5, 0.5, 0.5,
-4.060185, -3.976145, 0.3674293, 0, 1.5, 0.5, 0.5
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
-3, -2.993544, -5.122766,
2, -2.993544, -5.122766,
-3, -2.993544, -5.122766,
-3, -3.157311, -5.397276,
-2, -2.993544, -5.122766,
-2, -3.157311, -5.397276,
-1, -2.993544, -5.122766,
-1, -3.157311, -5.397276,
0, -2.993544, -5.122766,
0, -3.157311, -5.397276,
1, -2.993544, -5.122766,
1, -3.157311, -5.397276,
2, -2.993544, -5.122766,
2, -3.157311, -5.397276
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
-3, -3.484844, -5.946296, 0, -0.5, 0.5, 0.5,
-3, -3.484844, -5.946296, 1, -0.5, 0.5, 0.5,
-3, -3.484844, -5.946296, 1, 1.5, 0.5, 0.5,
-3, -3.484844, -5.946296, 0, 1.5, 0.5, 0.5,
-2, -3.484844, -5.946296, 0, -0.5, 0.5, 0.5,
-2, -3.484844, -5.946296, 1, -0.5, 0.5, 0.5,
-2, -3.484844, -5.946296, 1, 1.5, 0.5, 0.5,
-2, -3.484844, -5.946296, 0, 1.5, 0.5, 0.5,
-1, -3.484844, -5.946296, 0, -0.5, 0.5, 0.5,
-1, -3.484844, -5.946296, 1, -0.5, 0.5, 0.5,
-1, -3.484844, -5.946296, 1, 1.5, 0.5, 0.5,
-1, -3.484844, -5.946296, 0, 1.5, 0.5, 0.5,
0, -3.484844, -5.946296, 0, -0.5, 0.5, 0.5,
0, -3.484844, -5.946296, 1, -0.5, 0.5, 0.5,
0, -3.484844, -5.946296, 1, 1.5, 0.5, 0.5,
0, -3.484844, -5.946296, 0, 1.5, 0.5, 0.5,
1, -3.484844, -5.946296, 0, -0.5, 0.5, 0.5,
1, -3.484844, -5.946296, 1, -0.5, 0.5, 0.5,
1, -3.484844, -5.946296, 1, 1.5, 0.5, 0.5,
1, -3.484844, -5.946296, 0, 1.5, 0.5, 0.5,
2, -3.484844, -5.946296, 0, -0.5, 0.5, 0.5,
2, -3.484844, -5.946296, 1, -0.5, 0.5, 0.5,
2, -3.484844, -5.946296, 1, 1.5, 0.5, 0.5,
2, -3.484844, -5.946296, 0, 1.5, 0.5, 0.5
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
-3.134995, -2, -5.122766,
-3.134995, 3, -5.122766,
-3.134995, -2, -5.122766,
-3.289193, -2, -5.397276,
-3.134995, -1, -5.122766,
-3.289193, -1, -5.397276,
-3.134995, 0, -5.122766,
-3.289193, 0, -5.397276,
-3.134995, 1, -5.122766,
-3.289193, 1, -5.397276,
-3.134995, 2, -5.122766,
-3.289193, 2, -5.397276,
-3.134995, 3, -5.122766,
-3.289193, 3, -5.397276
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
-3.59759, -2, -5.946296, 0, -0.5, 0.5, 0.5,
-3.59759, -2, -5.946296, 1, -0.5, 0.5, 0.5,
-3.59759, -2, -5.946296, 1, 1.5, 0.5, 0.5,
-3.59759, -2, -5.946296, 0, 1.5, 0.5, 0.5,
-3.59759, -1, -5.946296, 0, -0.5, 0.5, 0.5,
-3.59759, -1, -5.946296, 1, -0.5, 0.5, 0.5,
-3.59759, -1, -5.946296, 1, 1.5, 0.5, 0.5,
-3.59759, -1, -5.946296, 0, 1.5, 0.5, 0.5,
-3.59759, 0, -5.946296, 0, -0.5, 0.5, 0.5,
-3.59759, 0, -5.946296, 1, -0.5, 0.5, 0.5,
-3.59759, 0, -5.946296, 1, 1.5, 0.5, 0.5,
-3.59759, 0, -5.946296, 0, 1.5, 0.5, 0.5,
-3.59759, 1, -5.946296, 0, -0.5, 0.5, 0.5,
-3.59759, 1, -5.946296, 1, -0.5, 0.5, 0.5,
-3.59759, 1, -5.946296, 1, 1.5, 0.5, 0.5,
-3.59759, 1, -5.946296, 0, 1.5, 0.5, 0.5,
-3.59759, 2, -5.946296, 0, -0.5, 0.5, 0.5,
-3.59759, 2, -5.946296, 1, -0.5, 0.5, 0.5,
-3.59759, 2, -5.946296, 1, 1.5, 0.5, 0.5,
-3.59759, 2, -5.946296, 0, 1.5, 0.5, 0.5,
-3.59759, 3, -5.946296, 0, -0.5, 0.5, 0.5,
-3.59759, 3, -5.946296, 1, -0.5, 0.5, 0.5,
-3.59759, 3, -5.946296, 1, 1.5, 0.5, 0.5,
-3.59759, 3, -5.946296, 0, 1.5, 0.5, 0.5
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
-3.134995, -2.993544, -4,
-3.134995, -2.993544, 4,
-3.134995, -2.993544, -4,
-3.289193, -3.157311, -4,
-3.134995, -2.993544, -2,
-3.289193, -3.157311, -2,
-3.134995, -2.993544, 0,
-3.289193, -3.157311, 0,
-3.134995, -2.993544, 2,
-3.289193, -3.157311, 2,
-3.134995, -2.993544, 4,
-3.289193, -3.157311, 4
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
-3.59759, -3.484844, -4, 0, -0.5, 0.5, 0.5,
-3.59759, -3.484844, -4, 1, -0.5, 0.5, 0.5,
-3.59759, -3.484844, -4, 1, 1.5, 0.5, 0.5,
-3.59759, -3.484844, -4, 0, 1.5, 0.5, 0.5,
-3.59759, -3.484844, -2, 0, -0.5, 0.5, 0.5,
-3.59759, -3.484844, -2, 1, -0.5, 0.5, 0.5,
-3.59759, -3.484844, -2, 1, 1.5, 0.5, 0.5,
-3.59759, -3.484844, -2, 0, 1.5, 0.5, 0.5,
-3.59759, -3.484844, 0, 0, -0.5, 0.5, 0.5,
-3.59759, -3.484844, 0, 1, -0.5, 0.5, 0.5,
-3.59759, -3.484844, 0, 1, 1.5, 0.5, 0.5,
-3.59759, -3.484844, 0, 0, 1.5, 0.5, 0.5,
-3.59759, -3.484844, 2, 0, -0.5, 0.5, 0.5,
-3.59759, -3.484844, 2, 1, -0.5, 0.5, 0.5,
-3.59759, -3.484844, 2, 1, 1.5, 0.5, 0.5,
-3.59759, -3.484844, 2, 0, 1.5, 0.5, 0.5,
-3.59759, -3.484844, 4, 0, -0.5, 0.5, 0.5,
-3.59759, -3.484844, 4, 1, -0.5, 0.5, 0.5,
-3.59759, -3.484844, 4, 1, 1.5, 0.5, 0.5,
-3.59759, -3.484844, 4, 0, 1.5, 0.5, 0.5
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
-3.134995, -2.993544, -5.122766,
-3.134995, 3.557129, -5.122766,
-3.134995, -2.993544, 5.857625,
-3.134995, 3.557129, 5.857625,
-3.134995, -2.993544, -5.122766,
-3.134995, -2.993544, 5.857625,
-3.134995, 3.557129, -5.122766,
-3.134995, 3.557129, 5.857625,
-3.134995, -2.993544, -5.122766,
3.032942, -2.993544, -5.122766,
-3.134995, -2.993544, 5.857625,
3.032942, -2.993544, 5.857625,
-3.134995, 3.557129, -5.122766,
3.032942, 3.557129, -5.122766,
-3.134995, 3.557129, 5.857625,
3.032942, 3.557129, 5.857625,
3.032942, -2.993544, -5.122766,
3.032942, 3.557129, -5.122766,
3.032942, -2.993544, 5.857625,
3.032942, 3.557129, 5.857625,
3.032942, -2.993544, -5.122766,
3.032942, -2.993544, 5.857625,
3.032942, 3.557129, -5.122766,
3.032942, 3.557129, 5.857625
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
var radius = 7.580338;
var distance = 33.72578;
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
mvMatrix.translate( 0.05102634, -0.2817928, -0.3674293 );
mvMatrix.scale( 1.328809, 1.251171, 0.7464224 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72578);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
triclopyr<-read.table("triclopyr.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triclopyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'triclopyr' not found
```

```r
y<-triclopyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'triclopyr' not found
```

```r
z<-triclopyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'triclopyr' not found
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
-3.04517, 0.2739798, -1.304335, 0, 0, 1, 1, 1,
-2.977716, -0.2715846, -2.031486, 1, 0, 0, 1, 1,
-2.838045, -1.44693, -1.88486, 1, 0, 0, 1, 1,
-2.67575, 0.3700573, -0.5304869, 1, 0, 0, 1, 1,
-2.648476, -0.4245653, -2.522703, 1, 0, 0, 1, 1,
-2.550313, -0.8764012, -2.666111, 1, 0, 0, 1, 1,
-2.534744, 0.2650774, -3.145971, 0, 0, 0, 1, 1,
-2.344894, 0.1943762, -1.106745, 0, 0, 0, 1, 1,
-2.284255, 0.07056937, -1.49938, 0, 0, 0, 1, 1,
-2.257698, -0.3096831, -2.285883, 0, 0, 0, 1, 1,
-2.245114, 0.4163098, -1.038366, 0, 0, 0, 1, 1,
-2.241905, 1.794979, -0.6714886, 0, 0, 0, 1, 1,
-2.233231, 0.2774035, -1.834775, 0, 0, 0, 1, 1,
-2.202178, -0.3646284, -1.239563, 1, 1, 1, 1, 1,
-2.177816, -2.339276, -2.266666, 1, 1, 1, 1, 1,
-2.131903, -1.578282, -3.041596, 1, 1, 1, 1, 1,
-2.115901, -2.117921, -3.791699, 1, 1, 1, 1, 1,
-2.096649, 1.268321, -2.916191, 1, 1, 1, 1, 1,
-2.040867, 1.00751, -0.6071753, 1, 1, 1, 1, 1,
-1.96919, 0.8016531, -0.3039891, 1, 1, 1, 1, 1,
-1.964514, 0.344268, -1.569165, 1, 1, 1, 1, 1,
-1.964021, -0.03689324, -1.739382, 1, 1, 1, 1, 1,
-1.936344, -0.9931163, -3.165035, 1, 1, 1, 1, 1,
-1.926316, -0.461723, 0.6500388, 1, 1, 1, 1, 1,
-1.902964, 0.6970561, -1.242374, 1, 1, 1, 1, 1,
-1.870121, 1.904276, -0.987857, 1, 1, 1, 1, 1,
-1.852638, -0.7471761, -1.278463, 1, 1, 1, 1, 1,
-1.850472, -0.02561894, -2.853907, 1, 1, 1, 1, 1,
-1.839636, -0.4351346, -2.762829, 0, 0, 1, 1, 1,
-1.836788, -1.048097, -2.591093, 1, 0, 0, 1, 1,
-1.825604, 0.8624799, -1.692726, 1, 0, 0, 1, 1,
-1.8223, 0.9278255, -3.211507, 1, 0, 0, 1, 1,
-1.813232, 0.07636765, -1.568807, 1, 0, 0, 1, 1,
-1.801882, 0.4926509, -0.8261169, 1, 0, 0, 1, 1,
-1.755912, 0.4689703, -1.439796, 0, 0, 0, 1, 1,
-1.732589, 0.9481396, -1.357774, 0, 0, 0, 1, 1,
-1.727673, -1.94613, -0.9195535, 0, 0, 0, 1, 1,
-1.72205, -2.237318, -3.763118, 0, 0, 0, 1, 1,
-1.719643, -1.375717, -3.095107, 0, 0, 0, 1, 1,
-1.70915, -1.204094, -1.925428, 0, 0, 0, 1, 1,
-1.707535, 0.9205624, -2.218354, 0, 0, 0, 1, 1,
-1.643221, -0.7807254, -4.962858, 1, 1, 1, 1, 1,
-1.640349, -0.5544969, -1.187756, 1, 1, 1, 1, 1,
-1.63929, -0.04367742, -1.966653, 1, 1, 1, 1, 1,
-1.620133, 1.024545, -1.123946, 1, 1, 1, 1, 1,
-1.613598, 0.4246089, -2.663419, 1, 1, 1, 1, 1,
-1.605413, -0.02988908, -2.476358, 1, 1, 1, 1, 1,
-1.534345, 0.5784394, -0.6996316, 1, 1, 1, 1, 1,
-1.52706, 0.09573571, 0.3057827, 1, 1, 1, 1, 1,
-1.524023, -1.138222, -0.6920595, 1, 1, 1, 1, 1,
-1.52005, -0.07733769, -0.4974181, 1, 1, 1, 1, 1,
-1.502475, 2.464751, -0.7706118, 1, 1, 1, 1, 1,
-1.482588, 0.3720662, -0.4436713, 1, 1, 1, 1, 1,
-1.479863, -1.460913, -1.514583, 1, 1, 1, 1, 1,
-1.474219, -0.1715883, -2.074868, 1, 1, 1, 1, 1,
-1.467887, -1.15267, -2.305543, 1, 1, 1, 1, 1,
-1.453732, -0.6468871, -1.792308, 0, 0, 1, 1, 1,
-1.443961, 0.5113657, -1.049394, 1, 0, 0, 1, 1,
-1.441061, 0.1448305, -3.012803, 1, 0, 0, 1, 1,
-1.434282, -0.3219599, -1.50349, 1, 0, 0, 1, 1,
-1.429806, 0.4051351, -0.1398882, 1, 0, 0, 1, 1,
-1.415653, -0.3246213, -2.868934, 1, 0, 0, 1, 1,
-1.413703, 1.391574, -1.866704, 0, 0, 0, 1, 1,
-1.405486, 1.575012, 0.4292841, 0, 0, 0, 1, 1,
-1.401883, -0.881126, -1.733925, 0, 0, 0, 1, 1,
-1.389148, 1.95014, -1.27849, 0, 0, 0, 1, 1,
-1.380655, 0.01289999, -2.04755, 0, 0, 0, 1, 1,
-1.375781, 1.673082, -1.019931, 0, 0, 0, 1, 1,
-1.374763, 1.004074, -1.054512, 0, 0, 0, 1, 1,
-1.360355, -1.09346, -3.576815, 1, 1, 1, 1, 1,
-1.351798, -2.419169, -1.676793, 1, 1, 1, 1, 1,
-1.34547, 0.869006, -1.255616, 1, 1, 1, 1, 1,
-1.335016, -0.3264837, -3.730711, 1, 1, 1, 1, 1,
-1.333498, -0.9982827, -1.01186, 1, 1, 1, 1, 1,
-1.332738, 0.3443493, -2.883311, 1, 1, 1, 1, 1,
-1.311446, -0.2389384, -1.373271, 1, 1, 1, 1, 1,
-1.309769, -0.3684711, -2.593364, 1, 1, 1, 1, 1,
-1.30735, -0.4262588, -0.8150153, 1, 1, 1, 1, 1,
-1.303835, -0.2702995, 0.3944404, 1, 1, 1, 1, 1,
-1.292687, -1.271706, -1.339589, 1, 1, 1, 1, 1,
-1.282626, -2.026703, -3.234439, 1, 1, 1, 1, 1,
-1.279093, 0.08922046, -2.041052, 1, 1, 1, 1, 1,
-1.270118, -0.1640252, -0.8279165, 1, 1, 1, 1, 1,
-1.268561, -1.335545, -3.115292, 1, 1, 1, 1, 1,
-1.266297, -1.882101, -4.078201, 0, 0, 1, 1, 1,
-1.250621, -0.09208845, -2.006118, 1, 0, 0, 1, 1,
-1.247229, -0.03132521, -1.366243, 1, 0, 0, 1, 1,
-1.243758, 0.2748972, -2.473272, 1, 0, 0, 1, 1,
-1.243568, 0.6289405, -0.9928066, 1, 0, 0, 1, 1,
-1.240181, -1.117603, -3.086465, 1, 0, 0, 1, 1,
-1.229917, -0.2175147, -2.432667, 0, 0, 0, 1, 1,
-1.22479, -0.412417, -1.55429, 0, 0, 0, 1, 1,
-1.219813, -1.175827, -1.730584, 0, 0, 0, 1, 1,
-1.201661, 0.480483, -0.401829, 0, 0, 0, 1, 1,
-1.199298, -0.6772968, -2.380932, 0, 0, 0, 1, 1,
-1.198224, -1.078968, -2.028242, 0, 0, 0, 1, 1,
-1.182189, 1.272018, -1.676888, 0, 0, 0, 1, 1,
-1.170098, 1.387383, -0.3380436, 1, 1, 1, 1, 1,
-1.165006, -0.5602792, -0.8583906, 1, 1, 1, 1, 1,
-1.163515, -2.120778, -1.226816, 1, 1, 1, 1, 1,
-1.159478, -0.7923524, -3.170439, 1, 1, 1, 1, 1,
-1.159123, -0.6859047, -0.7625026, 1, 1, 1, 1, 1,
-1.145776, 2.369366, -0.1055235, 1, 1, 1, 1, 1,
-1.145627, -0.5077256, -1.126559, 1, 1, 1, 1, 1,
-1.143905, 0.8417574, -0.7273444, 1, 1, 1, 1, 1,
-1.112579, 0.4374567, -3.545905, 1, 1, 1, 1, 1,
-1.108013, 1.67789, -0.08573015, 1, 1, 1, 1, 1,
-1.102203, -0.1810354, -1.328783, 1, 1, 1, 1, 1,
-1.098368, -0.1202293, -1.769268, 1, 1, 1, 1, 1,
-1.096682, -0.4593952, -2.645783, 1, 1, 1, 1, 1,
-1.093658, 0.7699608, -0.7356863, 1, 1, 1, 1, 1,
-1.088514, -0.4527814, -2.429733, 1, 1, 1, 1, 1,
-1.086665, 1.911959, -0.2354309, 0, 0, 1, 1, 1,
-1.083856, -1.760958, -1.464755, 1, 0, 0, 1, 1,
-1.08235, -0.009724788, -2.589021, 1, 0, 0, 1, 1,
-1.078312, -0.9491534, -1.796645, 1, 0, 0, 1, 1,
-1.075296, 0.4674937, -1.044617, 1, 0, 0, 1, 1,
-1.073317, -0.2279067, -1.312408, 1, 0, 0, 1, 1,
-1.062389, 1.157465, -0.5776269, 0, 0, 0, 1, 1,
-1.060359, -0.6311909, -2.244036, 0, 0, 0, 1, 1,
-1.057747, -0.04651197, -0.8292319, 0, 0, 0, 1, 1,
-1.057273, 1.075955, -1.838205, 0, 0, 0, 1, 1,
-1.053491, -0.3855263, -3.048735, 0, 0, 0, 1, 1,
-1.053369, 1.581901, -1.718514, 0, 0, 0, 1, 1,
-1.04899, -0.4733673, -1.186862, 0, 0, 0, 1, 1,
-1.042724, -0.1606941, -2.652121, 1, 1, 1, 1, 1,
-1.041085, -0.5227568, -2.269663, 1, 1, 1, 1, 1,
-1.040682, 0.5354584, 0.69531, 1, 1, 1, 1, 1,
-1.03949, -0.5676123, -1.729232, 1, 1, 1, 1, 1,
-1.035619, -0.9524992, -3.246468, 1, 1, 1, 1, 1,
-1.031546, 0.604067, -1.981152, 1, 1, 1, 1, 1,
-1.028466, 0.3654518, -1.180517, 1, 1, 1, 1, 1,
-1.00547, 0.1226679, -1.589138, 1, 1, 1, 1, 1,
-1.002378, 0.7702534, -0.7160761, 1, 1, 1, 1, 1,
-0.9946712, 1.583036, -1.627106, 1, 1, 1, 1, 1,
-0.9893117, -1.564188, -2.07002, 1, 1, 1, 1, 1,
-0.9762962, -0.4747339, -1.430009, 1, 1, 1, 1, 1,
-0.9703636, 0.06408393, -0.8972409, 1, 1, 1, 1, 1,
-0.9543514, -1.321255, -2.237179, 1, 1, 1, 1, 1,
-0.9424867, -1.147877, -3.136053, 1, 1, 1, 1, 1,
-0.9402742, -1.457257, -2.721105, 0, 0, 1, 1, 1,
-0.9402028, -0.3512925, -0.742268, 1, 0, 0, 1, 1,
-0.935866, 0.3795476, -1.743482, 1, 0, 0, 1, 1,
-0.9313583, -0.5659516, -0.7423207, 1, 0, 0, 1, 1,
-0.9289992, 0.05974892, -1.319581, 1, 0, 0, 1, 1,
-0.9275439, 0.3353918, -1.152251, 1, 0, 0, 1, 1,
-0.9209687, 0.2433828, -0.05577036, 0, 0, 0, 1, 1,
-0.9198107, 0.1019716, -2.916826, 0, 0, 0, 1, 1,
-0.9196168, 0.9425177, 0.2189491, 0, 0, 0, 1, 1,
-0.9136857, 0.1600248, -1.316315, 0, 0, 0, 1, 1,
-0.9134282, 1.368153, -0.460853, 0, 0, 0, 1, 1,
-0.9067831, 0.9420677, -1.823488, 0, 0, 0, 1, 1,
-0.9065937, 0.2684219, -1.423474, 0, 0, 0, 1, 1,
-0.9032062, 1.007911, 0.6898622, 1, 1, 1, 1, 1,
-0.8950302, 0.3630688, -2.032608, 1, 1, 1, 1, 1,
-0.8943701, -0.4511589, -1.947476, 1, 1, 1, 1, 1,
-0.8931436, -0.558141, -1.117131, 1, 1, 1, 1, 1,
-0.8903191, 1.33522, -1.229529, 1, 1, 1, 1, 1,
-0.8886456, 0.5990464, -0.8458577, 1, 1, 1, 1, 1,
-0.8863748, -1.565816, -3.019033, 1, 1, 1, 1, 1,
-0.8852359, -0.1468182, -1.926518, 1, 1, 1, 1, 1,
-0.8834085, -0.9795128, -2.816383, 1, 1, 1, 1, 1,
-0.8733671, 0.4130551, 0.3504276, 1, 1, 1, 1, 1,
-0.8675599, -0.4477409, -1.457692, 1, 1, 1, 1, 1,
-0.8646719, -0.1300881, -2.481772, 1, 1, 1, 1, 1,
-0.8643782, 1.187432, -0.1109568, 1, 1, 1, 1, 1,
-0.8618221, 2.016117, 0.2834482, 1, 1, 1, 1, 1,
-0.8591579, 1.012123, -0.6369998, 1, 1, 1, 1, 1,
-0.8576615, 0.01370951, -2.978119, 0, 0, 1, 1, 1,
-0.8554767, 0.3766521, 0.3839842, 1, 0, 0, 1, 1,
-0.8524197, 0.4101349, -2.766993, 1, 0, 0, 1, 1,
-0.8503855, 1.370994, 1.474334, 1, 0, 0, 1, 1,
-0.8485522, 1.004466, -0.5513874, 1, 0, 0, 1, 1,
-0.8479673, -0.3112179, -0.9598415, 1, 0, 0, 1, 1,
-0.8472218, -0.09102583, -1.611938, 0, 0, 0, 1, 1,
-0.8424387, 0.4696168, -0.748625, 0, 0, 0, 1, 1,
-0.8366581, 2.87225, 0.527689, 0, 0, 0, 1, 1,
-0.8341483, -0.1679894, -2.716687, 0, 0, 0, 1, 1,
-0.8265169, -1.174769, -2.923031, 0, 0, 0, 1, 1,
-0.8209317, -0.4403555, -2.187027, 0, 0, 0, 1, 1,
-0.8187754, -0.3411844, -1.908691, 0, 0, 0, 1, 1,
-0.8156581, -0.6342636, -3.075406, 1, 1, 1, 1, 1,
-0.813167, -0.6441962, -1.727312, 1, 1, 1, 1, 1,
-0.8102393, -0.3655417, -2.665056, 1, 1, 1, 1, 1,
-0.8032963, 0.6899498, -0.03596171, 1, 1, 1, 1, 1,
-0.7993665, 0.2871489, -2.499417, 1, 1, 1, 1, 1,
-0.7974761, 0.05068511, -2.238298, 1, 1, 1, 1, 1,
-0.7938142, 1.225821, -2.123091, 1, 1, 1, 1, 1,
-0.7917082, -0.9056978, -1.382445, 1, 1, 1, 1, 1,
-0.784741, 0.7128486, -0.6295112, 1, 1, 1, 1, 1,
-0.784357, -0.1351859, -1.415449, 1, 1, 1, 1, 1,
-0.783886, -0.4848255, -2.533044, 1, 1, 1, 1, 1,
-0.7784434, 0.1477122, -1.425817, 1, 1, 1, 1, 1,
-0.7777171, 0.01215234, -2.130626, 1, 1, 1, 1, 1,
-0.7717931, 0.9141799, -1.231616, 1, 1, 1, 1, 1,
-0.771177, -0.6488463, -1.875121, 1, 1, 1, 1, 1,
-0.7692039, 0.3825564, -1.043142, 0, 0, 1, 1, 1,
-0.7672638, -0.7981197, -3.061689, 1, 0, 0, 1, 1,
-0.7662338, -0.8854383, -3.464435, 1, 0, 0, 1, 1,
-0.7606165, 0.7420685, -1.371392, 1, 0, 0, 1, 1,
-0.7513688, 0.7787395, -0.2140358, 1, 0, 0, 1, 1,
-0.7470323, 0.9954879, 1.134812, 1, 0, 0, 1, 1,
-0.7468178, -1.070451, -1.947544, 0, 0, 0, 1, 1,
-0.7405273, 0.04839994, -3.314242, 0, 0, 0, 1, 1,
-0.738319, -0.8403074, -2.797384, 0, 0, 0, 1, 1,
-0.7362744, 0.783178, -1.376379, 0, 0, 0, 1, 1,
-0.7322348, -0.7538262, -3.422728, 0, 0, 0, 1, 1,
-0.7309862, -2.307066, -1.974344, 0, 0, 0, 1, 1,
-0.7222939, -0.08519264, -3.068568, 0, 0, 0, 1, 1,
-0.7205165, 0.1213734, -1.366789, 1, 1, 1, 1, 1,
-0.7200893, 0.4089643, -2.697854, 1, 1, 1, 1, 1,
-0.7182918, 2.033587, -0.7370027, 1, 1, 1, 1, 1,
-0.7170131, 0.8628728, -1.235815, 1, 1, 1, 1, 1,
-0.7163115, 1.89509, -0.5830201, 1, 1, 1, 1, 1,
-0.7143901, 1.241169, 0.8927295, 1, 1, 1, 1, 1,
-0.7106668, 0.05385936, 0.0909373, 1, 1, 1, 1, 1,
-0.7104642, 0.7578839, -0.6969887, 1, 1, 1, 1, 1,
-0.7089896, 0.07839035, -2.401636, 1, 1, 1, 1, 1,
-0.7088215, 0.2945088, -2.327123, 1, 1, 1, 1, 1,
-0.7045648, -0.007251147, -2.230221, 1, 1, 1, 1, 1,
-0.7000135, 0.7685561, -0.4743352, 1, 1, 1, 1, 1,
-0.6997491, 0.3872659, -0.3993007, 1, 1, 1, 1, 1,
-0.6970086, 0.5423312, -0.7271526, 1, 1, 1, 1, 1,
-0.6920738, -0.9669017, -2.220731, 1, 1, 1, 1, 1,
-0.689071, -0.6293704, -1.517311, 0, 0, 1, 1, 1,
-0.6871222, -0.3963795, -2.348627, 1, 0, 0, 1, 1,
-0.6829544, -0.4552305, -4.146416, 1, 0, 0, 1, 1,
-0.6764969, -1.665619, -4.08979, 1, 0, 0, 1, 1,
-0.6749594, 1.2934, -1.12262, 1, 0, 0, 1, 1,
-0.6738783, -0.5803334, -2.018355, 1, 0, 0, 1, 1,
-0.6709601, 0.06201905, -1.842761, 0, 0, 0, 1, 1,
-0.6638556, -0.6102945, -2.649754, 0, 0, 0, 1, 1,
-0.6583564, -0.9305817, -2.265632, 0, 0, 0, 1, 1,
-0.6556952, -0.2083528, -0.500659, 0, 0, 0, 1, 1,
-0.6543911, 0.8971803, 0.08960978, 0, 0, 0, 1, 1,
-0.6510017, 0.2595943, -0.2328413, 0, 0, 0, 1, 1,
-0.6417605, -0.06090983, -3.448233, 0, 0, 0, 1, 1,
-0.638763, -0.6194501, -2.073472, 1, 1, 1, 1, 1,
-0.6365091, -0.0838988, -0.4556632, 1, 1, 1, 1, 1,
-0.635389, 0.6829888, -0.2705319, 1, 1, 1, 1, 1,
-0.6340582, 0.3399151, -2.58575, 1, 1, 1, 1, 1,
-0.6338283, -0.6254236, -2.653521, 1, 1, 1, 1, 1,
-0.6327513, 1.748731, -0.6447887, 1, 1, 1, 1, 1,
-0.6279333, 0.4351399, -0.5074245, 1, 1, 1, 1, 1,
-0.62765, -0.8920755, -2.444434, 1, 1, 1, 1, 1,
-0.6270732, 1.791776, 0.3894932, 1, 1, 1, 1, 1,
-0.6267691, -0.325923, -1.620661, 1, 1, 1, 1, 1,
-0.6220351, -0.7483851, -2.845894, 1, 1, 1, 1, 1,
-0.6120467, -1.788582, -3.789401, 1, 1, 1, 1, 1,
-0.6118075, -0.1970455, -1.475422, 1, 1, 1, 1, 1,
-0.6090279, -2.275957, -3.66088, 1, 1, 1, 1, 1,
-0.6063771, 0.8222613, -0.8388434, 1, 1, 1, 1, 1,
-0.6021966, 1.351044, 0.8390492, 0, 0, 1, 1, 1,
-0.5986525, 0.002149459, -3.651092, 1, 0, 0, 1, 1,
-0.5944427, 0.1301506, -1.746387, 1, 0, 0, 1, 1,
-0.5935467, -1.290127, -3.30869, 1, 0, 0, 1, 1,
-0.5870499, 0.6069378, -0.7311136, 1, 0, 0, 1, 1,
-0.5802245, 0.6670135, -0.962222, 1, 0, 0, 1, 1,
-0.5796604, 0.3818287, -2.40885, 0, 0, 0, 1, 1,
-0.5795093, 0.2592888, 0.02320479, 0, 0, 0, 1, 1,
-0.5778292, -0.6609571, -0.7337338, 0, 0, 0, 1, 1,
-0.5770446, -2.898146, -4.29942, 0, 0, 0, 1, 1,
-0.5757398, -0.3830968, -2.489306, 0, 0, 0, 1, 1,
-0.5748909, -0.3056689, -2.453564, 0, 0, 0, 1, 1,
-0.5729299, -0.4288094, -2.948841, 0, 0, 0, 1, 1,
-0.5696191, -1.633314, -3.0439, 1, 1, 1, 1, 1,
-0.5679489, 2.435568, -0.5447863, 1, 1, 1, 1, 1,
-0.5635526, -0.9599313, -2.480958, 1, 1, 1, 1, 1,
-0.5597889, 0.04066617, -1.913498, 1, 1, 1, 1, 1,
-0.5572941, 0.7192332, -0.7668027, 1, 1, 1, 1, 1,
-0.5554169, -0.8195576, -3.771593, 1, 1, 1, 1, 1,
-0.5542775, -0.06935897, -3.068304, 1, 1, 1, 1, 1,
-0.5536421, -0.8247513, -0.3717706, 1, 1, 1, 1, 1,
-0.5517601, 0.6555136, 0.3851217, 1, 1, 1, 1, 1,
-0.5508744, -0.145991, -1.818172, 1, 1, 1, 1, 1,
-0.5502912, -1.367472, -2.281241, 1, 1, 1, 1, 1,
-0.5469882, -0.6247202, -2.827046, 1, 1, 1, 1, 1,
-0.5463545, -0.6953678, -3.117931, 1, 1, 1, 1, 1,
-0.5444713, 0.8223302, -1.145055, 1, 1, 1, 1, 1,
-0.536365, 0.1712327, -1.285331, 1, 1, 1, 1, 1,
-0.5355213, -0.04015362, -1.758699, 0, 0, 1, 1, 1,
-0.5342621, 0.6389982, -0.2155539, 1, 0, 0, 1, 1,
-0.5324641, 0.2245964, -0.2102906, 1, 0, 0, 1, 1,
-0.5308897, 0.6617579, -0.1869503, 1, 0, 0, 1, 1,
-0.529807, 1.169188, -1.804576, 1, 0, 0, 1, 1,
-0.5234507, -0.6636337, -1.958385, 1, 0, 0, 1, 1,
-0.5197165, 0.3529138, 0.06977943, 0, 0, 0, 1, 1,
-0.5123558, 0.6466337, -0.4134868, 0, 0, 0, 1, 1,
-0.5080171, -0.9185933, -1.413868, 0, 0, 0, 1, 1,
-0.5061706, -0.3094895, -2.00606, 0, 0, 0, 1, 1,
-0.5038437, -1.388217, -4.49197, 0, 0, 0, 1, 1,
-0.5032104, -1.00943, -2.156425, 0, 0, 0, 1, 1,
-0.5028445, 0.017712, -1.651127, 0, 0, 0, 1, 1,
-0.4955308, 0.2022597, -0.8231739, 1, 1, 1, 1, 1,
-0.4950955, -2.738629, -3.786778, 1, 1, 1, 1, 1,
-0.4944603, -0.1736303, -2.807991, 1, 1, 1, 1, 1,
-0.4912437, 0.1038729, -1.628641, 1, 1, 1, 1, 1,
-0.4909678, -0.1290127, 0.7341692, 1, 1, 1, 1, 1,
-0.4905714, -1.250125, -3.513686, 1, 1, 1, 1, 1,
-0.4895371, 1.028191, 0.6860439, 1, 1, 1, 1, 1,
-0.4864628, 1.046697, -1.371838, 1, 1, 1, 1, 1,
-0.4856894, 0.9117515, -2.297976, 1, 1, 1, 1, 1,
-0.4854058, -0.04473884, -1.679885, 1, 1, 1, 1, 1,
-0.4724798, -0.1755697, -1.94408, 1, 1, 1, 1, 1,
-0.4670523, 0.4856755, 0.2385049, 1, 1, 1, 1, 1,
-0.4665067, 0.5525633, -1.675341, 1, 1, 1, 1, 1,
-0.4635582, -0.6355693, -0.4991901, 1, 1, 1, 1, 1,
-0.4585776, 0.02777741, -1.760315, 1, 1, 1, 1, 1,
-0.4578462, -1.141424, -1.098736, 0, 0, 1, 1, 1,
-0.4563443, -0.4936698, -2.008181, 1, 0, 0, 1, 1,
-0.4515802, 0.7154303, -3.360524, 1, 0, 0, 1, 1,
-0.451344, 1.034766, -1.221256, 1, 0, 0, 1, 1,
-0.4491226, 2.776198, 1.448904, 1, 0, 0, 1, 1,
-0.4478433, 1.405567, 1.593085, 1, 0, 0, 1, 1,
-0.446736, 2.386294, -0.1502324, 0, 0, 0, 1, 1,
-0.4439199, -0.2302555, -1.663515, 0, 0, 0, 1, 1,
-0.4429978, 1.438075, 0.06462559, 0, 0, 0, 1, 1,
-0.4416883, 2.33991, 0.3377015, 0, 0, 0, 1, 1,
-0.441597, -1.659944, -0.2821585, 0, 0, 0, 1, 1,
-0.4409393, 0.8083097, -2.996767, 0, 0, 0, 1, 1,
-0.4404506, -1.690699, -2.697509, 0, 0, 0, 1, 1,
-0.427954, 0.6725875, -2.012197, 1, 1, 1, 1, 1,
-0.4271928, -0.2274114, -1.630339, 1, 1, 1, 1, 1,
-0.4264522, 2.157413, -0.3216645, 1, 1, 1, 1, 1,
-0.4200129, 0.9440399, -1.214707, 1, 1, 1, 1, 1,
-0.4200038, 1.221823, -2.254353, 1, 1, 1, 1, 1,
-0.4133322, 0.02359792, -3.270654, 1, 1, 1, 1, 1,
-0.4064162, 2.667022, 1.044584, 1, 1, 1, 1, 1,
-0.4056411, 0.6986232, -1.426858, 1, 1, 1, 1, 1,
-0.402502, -0.5439854, -3.448523, 1, 1, 1, 1, 1,
-0.3997783, 0.3017715, -2.932306, 1, 1, 1, 1, 1,
-0.3990398, 2.126179, -0.5856176, 1, 1, 1, 1, 1,
-0.398914, 0.694739, -2.192052, 1, 1, 1, 1, 1,
-0.3889548, 0.6791322, -0.1380938, 1, 1, 1, 1, 1,
-0.388889, 0.1187163, -2.424376, 1, 1, 1, 1, 1,
-0.384612, 2.110904, -0.2969226, 1, 1, 1, 1, 1,
-0.3839729, -0.2895203, -1.488624, 0, 0, 1, 1, 1,
-0.3795547, 0.5112383, -1.578546, 1, 0, 0, 1, 1,
-0.3746761, -0.4472615, -2.370278, 1, 0, 0, 1, 1,
-0.3702898, 0.2612716, -1.064411, 1, 0, 0, 1, 1,
-0.3671312, 1.470585, -0.02110598, 1, 0, 0, 1, 1,
-0.365618, 1.114108, 0.07555077, 1, 0, 0, 1, 1,
-0.3635441, 2.634916, -1.233749, 0, 0, 0, 1, 1,
-0.3611845, 0.7518315, -0.5936716, 0, 0, 0, 1, 1,
-0.358804, 0.7521858, -1.234821, 0, 0, 0, 1, 1,
-0.3569747, 0.03549045, -1.312802, 0, 0, 0, 1, 1,
-0.3558289, 1.87384, -0.5176162, 0, 0, 0, 1, 1,
-0.3537177, 0.811615, 0.4174966, 0, 0, 0, 1, 1,
-0.3533791, 0.2259813, -1.699535, 0, 0, 0, 1, 1,
-0.3519654, 0.3761538, -0.3930389, 1, 1, 1, 1, 1,
-0.3514247, 0.0883344, 0.06668177, 1, 1, 1, 1, 1,
-0.349468, -0.8783113, -2.837873, 1, 1, 1, 1, 1,
-0.348244, 0.6784134, 1.669489, 1, 1, 1, 1, 1,
-0.3452422, -0.7294334, -2.604174, 1, 1, 1, 1, 1,
-0.3425079, 0.1745199, -0.1519308, 1, 1, 1, 1, 1,
-0.3398277, -0.4132732, -4.75037, 1, 1, 1, 1, 1,
-0.3392133, -2.336984, -2.772942, 1, 1, 1, 1, 1,
-0.3387325, -1.197425, -4.676588, 1, 1, 1, 1, 1,
-0.3386568, -0.6823575, -2.861534, 1, 1, 1, 1, 1,
-0.3359661, 0.08232275, -0.1939805, 1, 1, 1, 1, 1,
-0.3356268, 0.7123641, -0.9508992, 1, 1, 1, 1, 1,
-0.3330006, 0.3539013, -1.585181, 1, 1, 1, 1, 1,
-0.3320597, -2.176808, -3.090239, 1, 1, 1, 1, 1,
-0.3254673, 1.242395, 0.2607414, 1, 1, 1, 1, 1,
-0.3235494, -1.371694, -2.372674, 0, 0, 1, 1, 1,
-0.3233211, 0.2568954, -1.97683, 1, 0, 0, 1, 1,
-0.3203833, 1.025204, -0.4525601, 1, 0, 0, 1, 1,
-0.3201632, 0.4985886, -0.2622673, 1, 0, 0, 1, 1,
-0.3163639, 0.9228697, -0.03379368, 1, 0, 0, 1, 1,
-0.3112058, -0.6250417, -2.850328, 1, 0, 0, 1, 1,
-0.3109353, 0.9447559, 0.8813977, 0, 0, 0, 1, 1,
-0.3093422, 0.1913317, -1.629763, 0, 0, 0, 1, 1,
-0.3067672, 0.1235364, -1.152156, 0, 0, 0, 1, 1,
-0.3061573, -1.360928, -1.582353, 0, 0, 0, 1, 1,
-0.3006276, -0.1898091, -1.852383, 0, 0, 0, 1, 1,
-0.298383, -0.3902768, -2.758513, 0, 0, 0, 1, 1,
-0.2941355, -1.113396, -2.636271, 0, 0, 0, 1, 1,
-0.2932469, 0.7726814, -0.7568911, 1, 1, 1, 1, 1,
-0.2885179, -0.4628417, -2.896454, 1, 1, 1, 1, 1,
-0.286286, -0.0922601, -1.189499, 1, 1, 1, 1, 1,
-0.2858796, 0.2275814, -0.3771329, 1, 1, 1, 1, 1,
-0.2836684, -1.102713, -1.357366, 1, 1, 1, 1, 1,
-0.2824107, 0.4125249, -1.299323, 1, 1, 1, 1, 1,
-0.2817499, 0.1677474, 0.124844, 1, 1, 1, 1, 1,
-0.2802366, 1.762287, -1.271602, 1, 1, 1, 1, 1,
-0.2800772, 0.7077906, 0.1531277, 1, 1, 1, 1, 1,
-0.2789092, -0.3484693, -3.067552, 1, 1, 1, 1, 1,
-0.2770403, 0.1464216, -1.374704, 1, 1, 1, 1, 1,
-0.2760592, 1.548537, 0.3169, 1, 1, 1, 1, 1,
-0.2735575, 0.6598028, -1.209188, 1, 1, 1, 1, 1,
-0.270135, -0.7423044, -2.03015, 1, 1, 1, 1, 1,
-0.2634557, 1.342332, -0.1548955, 1, 1, 1, 1, 1,
-0.2617348, 1.484907, -0.02261367, 0, 0, 1, 1, 1,
-0.2595642, 0.5082216, 0.328259, 1, 0, 0, 1, 1,
-0.2545741, 0.4428992, -0.232674, 1, 0, 0, 1, 1,
-0.2478497, -0.9203267, -1.930969, 1, 0, 0, 1, 1,
-0.245933, 0.1187826, -0.8158094, 1, 0, 0, 1, 1,
-0.2420641, -1.170118, -3.086666, 1, 0, 0, 1, 1,
-0.2408095, -0.4218698, -2.400289, 0, 0, 0, 1, 1,
-0.240437, 1.56078, -0.762738, 0, 0, 0, 1, 1,
-0.2372334, -0.278471, -2.01113, 0, 0, 0, 1, 1,
-0.23306, -0.7803673, -3.882985, 0, 0, 0, 1, 1,
-0.2328032, 1.177839, -1.405675, 0, 0, 0, 1, 1,
-0.232037, -0.6980144, -1.337138, 0, 0, 0, 1, 1,
-0.2281184, -0.442462, -2.756453, 0, 0, 0, 1, 1,
-0.2274795, 0.01361219, -1.999605, 1, 1, 1, 1, 1,
-0.2217458, -0.5817555, -1.646165, 1, 1, 1, 1, 1,
-0.2201659, 0.7968773, -0.8434268, 1, 1, 1, 1, 1,
-0.2169205, 1.717673, -1.152123, 1, 1, 1, 1, 1,
-0.2151743, 0.4820739, 0.1015503, 1, 1, 1, 1, 1,
-0.2087373, 1.632998, -0.6363829, 1, 1, 1, 1, 1,
-0.2029196, -1.014001, -2.216727, 1, 1, 1, 1, 1,
-0.1983217, 2.296201, -0.06769798, 1, 1, 1, 1, 1,
-0.1954188, 1.294262, 1.591588, 1, 1, 1, 1, 1,
-0.1934905, -1.959737, -1.317603, 1, 1, 1, 1, 1,
-0.1903429, 1.423412, -1.693333, 1, 1, 1, 1, 1,
-0.1882156, -0.4344162, -1.272059, 1, 1, 1, 1, 1,
-0.1858685, -1.595396, -2.773628, 1, 1, 1, 1, 1,
-0.1843186, 1.879936, -0.2385083, 1, 1, 1, 1, 1,
-0.1801184, 0.6901908, -1.117043, 1, 1, 1, 1, 1,
-0.1739163, -1.058269, -1.22097, 0, 0, 1, 1, 1,
-0.1680142, -0.7095191, -2.968149, 1, 0, 0, 1, 1,
-0.1639668, -0.3402212, -1.578258, 1, 0, 0, 1, 1,
-0.1603671, 0.7840579, 0.8831775, 1, 0, 0, 1, 1,
-0.1603601, 0.4115621, -0.6966387, 1, 0, 0, 1, 1,
-0.1592892, -1.716276, -3.527784, 1, 0, 0, 1, 1,
-0.1585512, 0.4565476, -0.4055518, 0, 0, 0, 1, 1,
-0.1487717, -0.5510815, -4.342538, 0, 0, 0, 1, 1,
-0.1476229, -0.9919931, -4.734179, 0, 0, 0, 1, 1,
-0.1452192, 0.8708545, 1.583938, 0, 0, 0, 1, 1,
-0.1435936, 1.895318, -0.03421837, 0, 0, 0, 1, 1,
-0.1408735, -1.092401, -2.750793, 0, 0, 0, 1, 1,
-0.1368206, -0.7339344, -3.940824, 0, 0, 0, 1, 1,
-0.1335722, 0.4293331, -0.2267088, 1, 1, 1, 1, 1,
-0.1302672, 0.8610132, 3.338328, 1, 1, 1, 1, 1,
-0.1268714, 0.1757674, -2.146729, 1, 1, 1, 1, 1,
-0.1231629, 0.6264802, 0.9873483, 1, 1, 1, 1, 1,
-0.1218104, 1.27315, -1.649269, 1, 1, 1, 1, 1,
-0.12129, -0.1223634, -1.748312, 1, 1, 1, 1, 1,
-0.1193922, 0.8372586, -1.522568, 1, 1, 1, 1, 1,
-0.1159896, -0.4025759, 0.08302175, 1, 1, 1, 1, 1,
-0.1159276, 0.2677955, 0.4581156, 1, 1, 1, 1, 1,
-0.1143293, 1.99821, -0.09093579, 1, 1, 1, 1, 1,
-0.1096493, 0.6856498, 0.8942667, 1, 1, 1, 1, 1,
-0.1075832, 0.05540072, -0.6412916, 1, 1, 1, 1, 1,
-0.1069639, -0.7096897, -3.504254, 1, 1, 1, 1, 1,
-0.1058832, -1.073652, -2.303127, 1, 1, 1, 1, 1,
-0.09864985, -2.718946, -3.663335, 1, 1, 1, 1, 1,
-0.09654302, -0.7119774, -3.915714, 0, 0, 1, 1, 1,
-0.09590477, -1.245556, -2.903363, 1, 0, 0, 1, 1,
-0.09355316, 0.8886954, -1.029497, 1, 0, 0, 1, 1,
-0.0879703, 0.2560117, -0.3397086, 1, 0, 0, 1, 1,
-0.08686477, -0.4987408, -2.657851, 1, 0, 0, 1, 1,
-0.08517022, 0.6161908, -0.5377243, 1, 0, 0, 1, 1,
-0.0828245, 0.2722495, -0.2629268, 0, 0, 0, 1, 1,
-0.08201075, 0.5034221, 0.1668548, 0, 0, 0, 1, 1,
-0.08104315, -0.5210681, -3.072381, 0, 0, 0, 1, 1,
-0.08081396, -0.5586473, -3.225497, 0, 0, 0, 1, 1,
-0.07922567, 0.6435775, 0.2521754, 0, 0, 0, 1, 1,
-0.07385172, 0.2937326, -1.958813, 0, 0, 0, 1, 1,
-0.06931939, 0.2693686, -1.278592, 0, 0, 0, 1, 1,
-0.06396529, -0.4826887, -1.861315, 1, 1, 1, 1, 1,
-0.06191556, 0.5207086, -2.259318, 1, 1, 1, 1, 1,
-0.0614582, 0.7529856, -0.4218625, 1, 1, 1, 1, 1,
-0.06032578, -0.8832748, -4.20194, 1, 1, 1, 1, 1,
-0.05970241, 0.7101419, 0.7553921, 1, 1, 1, 1, 1,
-0.0594093, -0.1244926, -3.271842, 1, 1, 1, 1, 1,
-0.05541616, -0.8433916, -2.539133, 1, 1, 1, 1, 1,
-0.05472256, 1.476323, -0.3160212, 1, 1, 1, 1, 1,
-0.05400158, -0.5519843, -2.376751, 1, 1, 1, 1, 1,
-0.05124475, 0.7208759, -0.09209105, 1, 1, 1, 1, 1,
-0.05083562, 0.1483691, 1.68533, 1, 1, 1, 1, 1,
-0.04883735, 1.095816, 0.4415283, 1, 1, 1, 1, 1,
-0.04754901, -0.5242843, -3.579766, 1, 1, 1, 1, 1,
-0.04662063, -1.294735, -4.275783, 1, 1, 1, 1, 1,
-0.0463095, -1.617027, -3.816826, 1, 1, 1, 1, 1,
-0.04545713, 0.6663655, -0.3555957, 0, 0, 1, 1, 1,
-0.04533648, 0.8669959, 0.4415328, 1, 0, 0, 1, 1,
-0.04215259, 0.8484864, -0.952921, 1, 0, 0, 1, 1,
-0.03322659, 0.6053815, -0.454673, 1, 0, 0, 1, 1,
-0.03043881, 0.1218391, -1.219537, 1, 0, 0, 1, 1,
-0.02906269, -0.6611989, -3.971919, 1, 0, 0, 1, 1,
-0.02807198, 0.4334495, -1.336017, 0, 0, 0, 1, 1,
-0.02738214, -0.4871055, -3.80569, 0, 0, 0, 1, 1,
-0.02412804, 0.9030522, -1.250422, 0, 0, 0, 1, 1,
-0.02129653, -0.9829113, -4.196999, 0, 0, 0, 1, 1,
-0.01998693, 0.8858681, 1.01069, 0, 0, 0, 1, 1,
-0.01599818, -1.654358, -2.531463, 0, 0, 0, 1, 1,
-0.00992, -1.540291, -2.529938, 0, 0, 0, 1, 1,
-0.001661969, 0.9994794, -1.042359, 1, 1, 1, 1, 1,
0.002443096, 1.265182, -0.4875477, 1, 1, 1, 1, 1,
0.008931108, -1.673789, 2.661334, 1, 1, 1, 1, 1,
0.0108985, 0.5140362, 0.3494344, 1, 1, 1, 1, 1,
0.01259582, -0.4133573, 2.485205, 1, 1, 1, 1, 1,
0.01908691, -1.161177, 4.981878, 1, 1, 1, 1, 1,
0.02015324, -0.0241252, 1.239784, 1, 1, 1, 1, 1,
0.02120186, -0.05559057, 4.164028, 1, 1, 1, 1, 1,
0.03252905, 0.5433736, -0.1559193, 1, 1, 1, 1, 1,
0.03316742, 1.064481, -0.7787124, 1, 1, 1, 1, 1,
0.0373256, 0.93577, 0.2423197, 1, 1, 1, 1, 1,
0.03737112, 0.6332914, 0.01542021, 1, 1, 1, 1, 1,
0.04131088, -1.555597, 3.395786, 1, 1, 1, 1, 1,
0.04599147, 0.935921, 0.7085692, 1, 1, 1, 1, 1,
0.04676811, 0.8518928, 0.0149763, 1, 1, 1, 1, 1,
0.04806716, 0.8120241, -0.6885412, 0, 0, 1, 1, 1,
0.04908793, -0.2436655, 1.774563, 1, 0, 0, 1, 1,
0.05418211, -0.03128939, 2.101322, 1, 0, 0, 1, 1,
0.05769062, 1.696801, -0.02212016, 1, 0, 0, 1, 1,
0.05869175, -1.746326, 3.132298, 1, 0, 0, 1, 1,
0.05923711, -0.5155255, 3.994427, 1, 0, 0, 1, 1,
0.05954918, 0.7705271, 0.669131, 0, 0, 0, 1, 1,
0.0600376, -0.1038728, 4.169046, 0, 0, 0, 1, 1,
0.06607004, 0.4777975, -1.027651, 0, 0, 0, 1, 1,
0.06729867, -1.182548, 3.754377, 0, 0, 0, 1, 1,
0.06785855, -0.4850096, 2.995442, 0, 0, 0, 1, 1,
0.07584414, 0.06748461, 0.02213916, 0, 0, 0, 1, 1,
0.07693765, 1.227656, -0.042146, 0, 0, 0, 1, 1,
0.07925209, -0.3560972, 3.178305, 1, 1, 1, 1, 1,
0.0805074, 0.7668205, 1.358061, 1, 1, 1, 1, 1,
0.08107108, 1.25517, 0.788246, 1, 1, 1, 1, 1,
0.08471584, -0.6888065, 4.206716, 1, 1, 1, 1, 1,
0.08475019, -0.7329356, 4.112876, 1, 1, 1, 1, 1,
0.08614226, -0.2305015, 4.075563, 1, 1, 1, 1, 1,
0.09034219, -0.3207436, 3.182038, 1, 1, 1, 1, 1,
0.09199139, 1.989204, -0.8235372, 1, 1, 1, 1, 1,
0.09383062, -0.001396376, 2.285674, 1, 1, 1, 1, 1,
0.0956994, 1.474315, 2.260668, 1, 1, 1, 1, 1,
0.09651206, -1.695151, 2.108482, 1, 1, 1, 1, 1,
0.1031814, 0.8036767, -0.8322523, 1, 1, 1, 1, 1,
0.1033003, -0.7223212, 3.368201, 1, 1, 1, 1, 1,
0.1039904, -0.3750705, 4.850085, 1, 1, 1, 1, 1,
0.1047018, 1.022291, 1.220336, 1, 1, 1, 1, 1,
0.1084071, 0.5645726, -0.2138807, 0, 0, 1, 1, 1,
0.1104931, -1.203948, 2.733404, 1, 0, 0, 1, 1,
0.1149463, -0.7277058, 1.991954, 1, 0, 0, 1, 1,
0.1152706, 0.2337773, 1.537215, 1, 0, 0, 1, 1,
0.1158794, 0.4291886, 1.926357, 1, 0, 0, 1, 1,
0.1178456, 0.1076265, 0.1501171, 1, 0, 0, 1, 1,
0.1185838, 0.4794864, 1.076415, 0, 0, 0, 1, 1,
0.1200062, 1.364803, 1.117095, 0, 0, 0, 1, 1,
0.1271346, -2.238301, 0.901932, 0, 0, 0, 1, 1,
0.1289477, 0.429366, 0.6959078, 0, 0, 0, 1, 1,
0.1311803, 1.971814, -0.8791769, 0, 0, 0, 1, 1,
0.1315859, -0.9303786, 1.715654, 0, 0, 0, 1, 1,
0.132456, 0.2089345, -0.4749844, 0, 0, 0, 1, 1,
0.1331577, -0.1804447, 2.924131, 1, 1, 1, 1, 1,
0.1338741, -0.7620553, 2.540553, 1, 1, 1, 1, 1,
0.1493502, -1.006808, 1.805966, 1, 1, 1, 1, 1,
0.1544954, -1.497343, 4.404827, 1, 1, 1, 1, 1,
0.155117, 0.8329467, 0.6023517, 1, 1, 1, 1, 1,
0.1555113, -2.39193, 3.239347, 1, 1, 1, 1, 1,
0.1567868, 0.560534, -0.615384, 1, 1, 1, 1, 1,
0.1590812, 1.673819, 0.09035718, 1, 1, 1, 1, 1,
0.1607432, 0.4705572, 2.259346, 1, 1, 1, 1, 1,
0.1617159, 0.8434951, 2.112079, 1, 1, 1, 1, 1,
0.1631581, -0.8377749, 2.455693, 1, 1, 1, 1, 1,
0.1640218, -0.11353, 2.676427, 1, 1, 1, 1, 1,
0.166686, 0.7565753, 0.495581, 1, 1, 1, 1, 1,
0.1676401, 1.393108, -1.439473, 1, 1, 1, 1, 1,
0.177425, -0.3657945, 2.615169, 1, 1, 1, 1, 1,
0.1905156, -2.026675, 4.389562, 0, 0, 1, 1, 1,
0.1906082, -1.517057, 2.623179, 1, 0, 0, 1, 1,
0.1917741, -1.045608, 4.717938, 1, 0, 0, 1, 1,
0.1932573, -0.4079456, 1.562458, 1, 0, 0, 1, 1,
0.1954509, 0.6253913, 0.3175323, 1, 0, 0, 1, 1,
0.1970287, -0.5102634, 2.149833, 1, 0, 0, 1, 1,
0.1996443, 0.4818222, 0.6636193, 0, 0, 0, 1, 1,
0.2011262, 0.1033651, 0.7260476, 0, 0, 0, 1, 1,
0.2020233, 1.359678, -0.303791, 0, 0, 0, 1, 1,
0.202976, -0.2708832, 1.479136, 0, 0, 0, 1, 1,
0.2031807, 1.056314, 0.7406077, 0, 0, 0, 1, 1,
0.2039694, -0.3692318, 2.686442, 0, 0, 0, 1, 1,
0.2049199, 3.461731, 0.9625792, 0, 0, 0, 1, 1,
0.2057405, -0.5915805, 2.79515, 1, 1, 1, 1, 1,
0.2065674, 0.5896415, -1.227364, 1, 1, 1, 1, 1,
0.209446, -0.2072252, 3.092953, 1, 1, 1, 1, 1,
0.2123124, -1.144509, 1.621285, 1, 1, 1, 1, 1,
0.216669, 0.172466, 0.01917192, 1, 1, 1, 1, 1,
0.2168107, 0.2619977, 2.225348, 1, 1, 1, 1, 1,
0.2171369, 0.4271884, 1.813648, 1, 1, 1, 1, 1,
0.2255497, -0.1956606, 3.733792, 1, 1, 1, 1, 1,
0.2256195, 2.272299, -1.731618, 1, 1, 1, 1, 1,
0.2307214, 0.7603295, 0.8637993, 1, 1, 1, 1, 1,
0.2365863, -0.4353334, 1.098415, 1, 1, 1, 1, 1,
0.2368077, 0.3734161, 0.1435459, 1, 1, 1, 1, 1,
0.2395, 0.5865719, 0.8620995, 1, 1, 1, 1, 1,
0.2444891, -1.050924, 3.223864, 1, 1, 1, 1, 1,
0.2451161, 1.743396, 0.8027477, 1, 1, 1, 1, 1,
0.2460964, -2.113009, 4.80855, 0, 0, 1, 1, 1,
0.2496238, -2.161927, 3.004078, 1, 0, 0, 1, 1,
0.2522379, 0.3217024, -0.6304322, 1, 0, 0, 1, 1,
0.2532861, 0.1224235, 0.573576, 1, 0, 0, 1, 1,
0.2569423, 1.19584, 1.313692, 1, 0, 0, 1, 1,
0.2575195, -0.3495297, 1.593565, 1, 0, 0, 1, 1,
0.2597812, -0.6809418, 2.802184, 0, 0, 0, 1, 1,
0.2602553, 0.8632714, -0.09100494, 0, 0, 0, 1, 1,
0.2630992, 1.509394, 2.631238, 0, 0, 0, 1, 1,
0.264134, -0.4013762, 2.746066, 0, 0, 0, 1, 1,
0.26533, -1.795998, 2.291027, 0, 0, 0, 1, 1,
0.2678964, 0.1056189, 1.442893, 0, 0, 0, 1, 1,
0.268586, -0.4341316, 1.546098, 0, 0, 0, 1, 1,
0.268652, -1.453011, 1.442487, 1, 1, 1, 1, 1,
0.2691411, -1.387449, 1.524634, 1, 1, 1, 1, 1,
0.2722693, 1.293223, -1.839647, 1, 1, 1, 1, 1,
0.2740165, 1.000955, 0.2817428, 1, 1, 1, 1, 1,
0.2759197, 0.4394498, 1.081658, 1, 1, 1, 1, 1,
0.2809334, 0.1400785, 2.895477, 1, 1, 1, 1, 1,
0.2819096, 1.858446, -0.1127848, 1, 1, 1, 1, 1,
0.2829362, 0.3164198, -0.07536335, 1, 1, 1, 1, 1,
0.2857621, 0.1158963, 1.329647, 1, 1, 1, 1, 1,
0.2875425, -0.257317, 2.804345, 1, 1, 1, 1, 1,
0.2897949, 1.094716, -0.4458272, 1, 1, 1, 1, 1,
0.2900391, -0.5897405, 0.1426932, 1, 1, 1, 1, 1,
0.292605, 0.9491876, 1.513946, 1, 1, 1, 1, 1,
0.2947274, 0.6181495, 0.2793333, 1, 1, 1, 1, 1,
0.2986302, -1.14258, 2.545847, 1, 1, 1, 1, 1,
0.2999033, -1.065919, 2.316698, 0, 0, 1, 1, 1,
0.3010712, 0.2723807, 2.060611, 1, 0, 0, 1, 1,
0.3024677, 0.5869654, 0.1667442, 1, 0, 0, 1, 1,
0.3054137, 0.7169693, -0.625191, 1, 0, 0, 1, 1,
0.3067396, 1.071311, -0.7457585, 1, 0, 0, 1, 1,
0.31391, -0.6150647, 5.697716, 1, 0, 0, 1, 1,
0.3145271, 0.496015, 2.868192, 0, 0, 0, 1, 1,
0.3215084, 1.328909, 1.014103, 0, 0, 0, 1, 1,
0.3271103, 0.2843252, -0.8401912, 0, 0, 0, 1, 1,
0.328251, -0.2848875, 3.070054, 0, 0, 0, 1, 1,
0.3321862, 0.5139629, -0.2954887, 0, 0, 0, 1, 1,
0.3345937, -2.031107, 2.942844, 0, 0, 0, 1, 1,
0.3415587, -0.9450569, 3.44921, 0, 0, 0, 1, 1,
0.3424394, -0.4870325, 2.192201, 1, 1, 1, 1, 1,
0.348467, -0.187255, 0.9615623, 1, 1, 1, 1, 1,
0.3536045, -1.782568, 1.924743, 1, 1, 1, 1, 1,
0.3570288, -0.3623792, 3.653829, 1, 1, 1, 1, 1,
0.359758, -0.06197277, 2.088425, 1, 1, 1, 1, 1,
0.3607122, -0.1013067, 3.10429, 1, 1, 1, 1, 1,
0.3650151, 0.5085095, 0.5653017, 1, 1, 1, 1, 1,
0.3656703, -1.640961, 3.712862, 1, 1, 1, 1, 1,
0.3721439, 0.0892189, 1.257365, 1, 1, 1, 1, 1,
0.3756735, 1.367802, 0.4016833, 1, 1, 1, 1, 1,
0.3781754, 1.50602, 2.171814, 1, 1, 1, 1, 1,
0.3797509, 0.06255921, 1.608546, 1, 1, 1, 1, 1,
0.3841991, 1.121794, 0.6085246, 1, 1, 1, 1, 1,
0.386627, 0.08794294, 0.06241076, 1, 1, 1, 1, 1,
0.3866678, 1.281338, 0.7663646, 1, 1, 1, 1, 1,
0.3877349, 0.5253661, 1.807125, 0, 0, 1, 1, 1,
0.3938031, -0.3776249, 1.946465, 1, 0, 0, 1, 1,
0.3956208, 0.7670112, 0.9656774, 1, 0, 0, 1, 1,
0.3969793, 0.6235406, 0.5241662, 1, 0, 0, 1, 1,
0.4020785, 1.00074, -0.3860597, 1, 0, 0, 1, 1,
0.4036493, -1.222334, 2.347423, 1, 0, 0, 1, 1,
0.4075904, -0.7865075, 2.128834, 0, 0, 0, 1, 1,
0.4077764, 0.0460122, 3.284619, 0, 0, 0, 1, 1,
0.408883, 0.4167902, -0.05123658, 0, 0, 0, 1, 1,
0.4110949, 1.452442, -0.7049619, 0, 0, 0, 1, 1,
0.4115794, 0.1307467, 2.92188, 0, 0, 0, 1, 1,
0.4173323, 0.2275493, -0.3474448, 0, 0, 0, 1, 1,
0.4178805, 0.9678247, 1.817677, 0, 0, 0, 1, 1,
0.4225412, 0.3964739, 0.7230342, 1, 1, 1, 1, 1,
0.4286616, 1.662149, 2.188549, 1, 1, 1, 1, 1,
0.4296744, 1.569403, -0.5597192, 1, 1, 1, 1, 1,
0.4320884, 0.3125925, 0.1891723, 1, 1, 1, 1, 1,
0.4327329, -0.1388291, 0.9780694, 1, 1, 1, 1, 1,
0.436202, -0.6627937, 0.1202941, 1, 1, 1, 1, 1,
0.4372206, 0.2004389, 0.9941214, 1, 1, 1, 1, 1,
0.4427004, 0.2701511, 1.312656, 1, 1, 1, 1, 1,
0.443244, -1.693121, 4.55326, 1, 1, 1, 1, 1,
0.4438392, -0.08236639, 2.182927, 1, 1, 1, 1, 1,
0.4489654, 0.8976692, 0.8941057, 1, 1, 1, 1, 1,
0.4490006, 0.4243948, -0.715255, 1, 1, 1, 1, 1,
0.4513589, -1.273393, 0.8820884, 1, 1, 1, 1, 1,
0.4546839, 1.144067, -0.1503926, 1, 1, 1, 1, 1,
0.4569218, 1.49384, -0.3479262, 1, 1, 1, 1, 1,
0.464704, 0.782441, 0.6975124, 0, 0, 1, 1, 1,
0.4654388, -0.4122896, 1.360848, 1, 0, 0, 1, 1,
0.4668227, 0.3945943, 0.4409637, 1, 0, 0, 1, 1,
0.4754328, -1.223452, 2.57192, 1, 0, 0, 1, 1,
0.4767153, 0.5755511, 1.987312, 1, 0, 0, 1, 1,
0.4771739, 0.9433733, 1.506914, 1, 0, 0, 1, 1,
0.4817439, 0.8474045, 0.4852883, 0, 0, 0, 1, 1,
0.4835333, 0.7345641, 0.4075334, 0, 0, 0, 1, 1,
0.4857336, 0.407457, 0.817904, 0, 0, 0, 1, 1,
0.4869329, -0.3202834, 4.591191, 0, 0, 0, 1, 1,
0.4952604, 3.443053, 0.7171486, 0, 0, 0, 1, 1,
0.4956614, 0.08729761, 2.134055, 0, 0, 0, 1, 1,
0.4958601, 0.5517218, 0.2212628, 0, 0, 0, 1, 1,
0.4962452, 0.430439, 1.50491, 1, 1, 1, 1, 1,
0.4980426, 0.3113538, 1.975442, 1, 1, 1, 1, 1,
0.5002983, -1.092676, 2.427044, 1, 1, 1, 1, 1,
0.5036871, 0.4537027, 1.217184, 1, 1, 1, 1, 1,
0.5060044, -0.1351449, 0.6035963, 1, 1, 1, 1, 1,
0.5074864, -0.1826096, 0.0288124, 1, 1, 1, 1, 1,
0.5184484, -0.4111047, 1.774003, 1, 1, 1, 1, 1,
0.5313309, 0.9473397, 2.704252, 1, 1, 1, 1, 1,
0.5317623, 0.2304263, 0.9933828, 1, 1, 1, 1, 1,
0.5331179, 0.9951841, 0.2701386, 1, 1, 1, 1, 1,
0.535886, -0.4986018, 2.95884, 1, 1, 1, 1, 1,
0.537109, 0.1706215, 0.3720494, 1, 1, 1, 1, 1,
0.5392537, -0.577787, 2.575514, 1, 1, 1, 1, 1,
0.5465485, 0.2423335, -0.5277731, 1, 1, 1, 1, 1,
0.5476434, 1.354714, 0.2546648, 1, 1, 1, 1, 1,
0.5552512, -0.9675179, 3.701295, 0, 0, 1, 1, 1,
0.557664, 2.297197, -0.5721663, 1, 0, 0, 1, 1,
0.5600216, -0.277706, 2.934491, 1, 0, 0, 1, 1,
0.5640445, 0.2684781, 2.212675, 1, 0, 0, 1, 1,
0.5657467, 0.6302232, 0.7591234, 1, 0, 0, 1, 1,
0.5674143, -1.126154, 2.242933, 1, 0, 0, 1, 1,
0.5697706, 1.19259, -0.773616, 0, 0, 0, 1, 1,
0.5702357, -0.8278804, 3.756264, 0, 0, 0, 1, 1,
0.5710999, -0.9881203, 4.013922, 0, 0, 0, 1, 1,
0.5739338, -1.108179, 4.573386, 0, 0, 0, 1, 1,
0.5746654, -0.4365524, 1.676139, 0, 0, 0, 1, 1,
0.5766684, -0.3555529, 4.122374, 0, 0, 0, 1, 1,
0.57768, 1.487582, -0.1842723, 0, 0, 0, 1, 1,
0.5797291, 0.9780404, 1.518926, 1, 1, 1, 1, 1,
0.5812007, -0.1035305, 2.240736, 1, 1, 1, 1, 1,
0.5827184, -0.002293781, 1.240829, 1, 1, 1, 1, 1,
0.5848836, 2.685998, 0.7028509, 1, 1, 1, 1, 1,
0.5864769, 0.6731609, -0.6116176, 1, 1, 1, 1, 1,
0.5865395, -0.6003415, 3.16871, 1, 1, 1, 1, 1,
0.5882544, 1.127406, 1.337666, 1, 1, 1, 1, 1,
0.5980816, -0.4887457, 3.905712, 1, 1, 1, 1, 1,
0.5995271, -0.05747981, 1.056574, 1, 1, 1, 1, 1,
0.6034517, 0.8554195, -0.5528368, 1, 1, 1, 1, 1,
0.6038442, -0.3955209, 0.6941563, 1, 1, 1, 1, 1,
0.6062856, -0.2474661, 1.985456, 1, 1, 1, 1, 1,
0.6150185, -0.8192076, 4.134049, 1, 1, 1, 1, 1,
0.6195065, 1.304628, 0.08313306, 1, 1, 1, 1, 1,
0.6199758, 0.292967, -0.05227153, 1, 1, 1, 1, 1,
0.6246443, 0.3123162, 1.674579, 0, 0, 1, 1, 1,
0.6259254, -0.1720353, 1.805595, 1, 0, 0, 1, 1,
0.6285962, 0.9246949, 0.1629966, 1, 0, 0, 1, 1,
0.6294033, -0.9531658, 3.036282, 1, 0, 0, 1, 1,
0.6301031, -0.8413925, 1.911803, 1, 0, 0, 1, 1,
0.6340675, 2.147031, -0.7692713, 1, 0, 0, 1, 1,
0.63981, 0.5242538, 1.875409, 0, 0, 0, 1, 1,
0.6413977, 0.3175319, -0.01418781, 0, 0, 0, 1, 1,
0.641901, 0.5906682, 0.7151174, 0, 0, 0, 1, 1,
0.6528327, -0.5230781, 2.887792, 0, 0, 0, 1, 1,
0.6540992, 0.9673834, 0.06844568, 0, 0, 0, 1, 1,
0.6541115, 1.256376, 0.2230827, 0, 0, 0, 1, 1,
0.6575544, 1.107045, 2.236909, 0, 0, 0, 1, 1,
0.660155, 1.903134, 1.03473, 1, 1, 1, 1, 1,
0.6680669, -0.3616352, 2.03666, 1, 1, 1, 1, 1,
0.6700648, 1.660618, 0.6834279, 1, 1, 1, 1, 1,
0.6729366, -1.328228, 3.221604, 1, 1, 1, 1, 1,
0.6758795, 2.124006, 1.378843, 1, 1, 1, 1, 1,
0.6779181, -0.1498225, 0.348314, 1, 1, 1, 1, 1,
0.679514, 0.2531106, -0.3185438, 1, 1, 1, 1, 1,
0.682776, 0.8505486, 1.54852, 1, 1, 1, 1, 1,
0.6840565, -1.263537, 1.386049, 1, 1, 1, 1, 1,
0.6858115, -1.856768, 2.091503, 1, 1, 1, 1, 1,
0.6961425, 1.018295, 1.037586, 1, 1, 1, 1, 1,
0.6970305, -1.164096, 2.185927, 1, 1, 1, 1, 1,
0.6980109, 1.286635, 0.2363771, 1, 1, 1, 1, 1,
0.7079723, -1.845464, 2.879287, 1, 1, 1, 1, 1,
0.7082935, -0.7401453, 3.210244, 1, 1, 1, 1, 1,
0.7083018, 1.795342, 1.284448, 0, 0, 1, 1, 1,
0.7106338, -1.508506, 2.71658, 1, 0, 0, 1, 1,
0.717736, -1.598289, 1.509836, 1, 0, 0, 1, 1,
0.7181198, -1.120287, 2.658492, 1, 0, 0, 1, 1,
0.7283232, 0.3324417, 0.5256104, 1, 0, 0, 1, 1,
0.7302967, 0.07407215, 0.6424948, 1, 0, 0, 1, 1,
0.732152, 0.1694202, 0.7947455, 0, 0, 0, 1, 1,
0.7364954, 0.3778804, 1.37606, 0, 0, 0, 1, 1,
0.7412451, 0.1863507, 2.050961, 0, 0, 0, 1, 1,
0.7489665, 0.08788245, 1.99764, 0, 0, 0, 1, 1,
0.7498189, 0.2851109, 2.244207, 0, 0, 0, 1, 1,
0.7559295, 2.359252, 0.3391808, 0, 0, 0, 1, 1,
0.7628357, -0.05307503, -0.4929134, 0, 0, 0, 1, 1,
0.7668865, -0.4874003, 2.987443, 1, 1, 1, 1, 1,
0.7672714, 0.6138489, -0.1375049, 1, 1, 1, 1, 1,
0.7677091, 0.4749258, -0.7465736, 1, 1, 1, 1, 1,
0.7721357, -0.5272955, 1.935842, 1, 1, 1, 1, 1,
0.7739857, -0.1083884, 1.097631, 1, 1, 1, 1, 1,
0.7756473, -0.6496901, 3.043611, 1, 1, 1, 1, 1,
0.7840043, 0.1869795, 0.9090347, 1, 1, 1, 1, 1,
0.7844032, 0.3152819, 1.808227, 1, 1, 1, 1, 1,
0.7845174, -2.07687, 2.852423, 1, 1, 1, 1, 1,
0.7864071, 0.1251157, 2.243933, 1, 1, 1, 1, 1,
0.7884459, 0.1783796, 1.245087, 1, 1, 1, 1, 1,
0.789376, -1.354611, 3.843145, 1, 1, 1, 1, 1,
0.7900974, -0.9720882, 2.171152, 1, 1, 1, 1, 1,
0.7935094, 0.869199, 0.754689, 1, 1, 1, 1, 1,
0.8028498, 0.8921397, 2.741221, 1, 1, 1, 1, 1,
0.8081068, -1.397738, 2.339894, 0, 0, 1, 1, 1,
0.8108662, 0.6210297, 0.8657994, 1, 0, 0, 1, 1,
0.8152413, 1.539844, 0.4604155, 1, 0, 0, 1, 1,
0.8292841, -1.933393, 2.683794, 1, 0, 0, 1, 1,
0.8352144, 1.481415, 1.005648, 1, 0, 0, 1, 1,
0.835375, -1.217647, 1.423152, 1, 0, 0, 1, 1,
0.8378004, -1.395599, 3.625717, 0, 0, 0, 1, 1,
0.8390306, 0.04321511, 0.6638696, 0, 0, 0, 1, 1,
0.8436739, 1.007751, 0.5970673, 0, 0, 0, 1, 1,
0.8529797, 1.664183, 1.851344, 0, 0, 0, 1, 1,
0.8555949, -0.922554, 2.366432, 0, 0, 0, 1, 1,
0.8587017, -2.188342, 0.8695952, 0, 0, 0, 1, 1,
0.8598937, -0.1729153, 2.868577, 0, 0, 0, 1, 1,
0.8650451, -1.566735, 2.514555, 1, 1, 1, 1, 1,
0.8697597, -0.1641157, 1.273304, 1, 1, 1, 1, 1,
0.8709521, -0.5973289, 1.111383, 1, 1, 1, 1, 1,
0.8719644, 0.7797709, 1.097156, 1, 1, 1, 1, 1,
0.8782838, 0.7548927, 0.06294625, 1, 1, 1, 1, 1,
0.87872, -1.19934, 2.622767, 1, 1, 1, 1, 1,
0.8795555, 0.9670208, 0.1084001, 1, 1, 1, 1, 1,
0.8841073, 1.068525, 0.4997019, 1, 1, 1, 1, 1,
0.8841735, 1.568645, 0.2553618, 1, 1, 1, 1, 1,
0.8848805, -0.9861178, 3.208269, 1, 1, 1, 1, 1,
0.8877168, 1.005025, -0.04845183, 1, 1, 1, 1, 1,
0.9149836, -0.4452746, 1.596327, 1, 1, 1, 1, 1,
0.9216495, -0.512414, 2.109567, 1, 1, 1, 1, 1,
0.9224243, -1.041875, 0.8600558, 1, 1, 1, 1, 1,
0.9279413, -0.06203182, 1.285139, 1, 1, 1, 1, 1,
0.9297241, -0.4895832, 2.870405, 0, 0, 1, 1, 1,
0.9346051, -0.8957138, 3.631982, 1, 0, 0, 1, 1,
0.9353572, 0.4847011, 0.4519663, 1, 0, 0, 1, 1,
0.9387894, -0.6437519, 1.348264, 1, 0, 0, 1, 1,
0.9472413, -0.6573237, 2.036457, 1, 0, 0, 1, 1,
0.9491583, -1.033833, 2.302385, 1, 0, 0, 1, 1,
0.9567549, -0.8332928, 3.637363, 0, 0, 0, 1, 1,
0.9577633, -0.6554706, 1.204909, 0, 0, 0, 1, 1,
0.9799816, 0.3463797, 1.474954, 0, 0, 0, 1, 1,
0.9814823, 1.503442, -0.5420973, 0, 0, 0, 1, 1,
0.9850482, -0.7246925, 2.648782, 0, 0, 0, 1, 1,
0.9868595, -1.475369, 1.955007, 0, 0, 0, 1, 1,
0.9913014, 1.121211, 0.4433401, 0, 0, 0, 1, 1,
0.9954073, -1.490707, 4.070058, 1, 1, 1, 1, 1,
1.000338, 1.118675, 1.319093, 1, 1, 1, 1, 1,
1.003754, -1.121078, 0.1109872, 1, 1, 1, 1, 1,
1.005643, 2.301917, -0.08932672, 1, 1, 1, 1, 1,
1.006036, 1.540151, 0.6143339, 1, 1, 1, 1, 1,
1.007286, 0.2136364, 2.427231, 1, 1, 1, 1, 1,
1.007841, 1.656853, -0.8695682, 1, 1, 1, 1, 1,
1.013104, -1.638816, 1.393545, 1, 1, 1, 1, 1,
1.016397, 0.4084685, 1.156305, 1, 1, 1, 1, 1,
1.01785, 0.07864701, 1.182071, 1, 1, 1, 1, 1,
1.024655, 0.06680271, 1.54556, 1, 1, 1, 1, 1,
1.027495, 2.250026, 0.6791651, 1, 1, 1, 1, 1,
1.028027, 0.3887107, 1.140122, 1, 1, 1, 1, 1,
1.028046, -0.03684213, 2.573771, 1, 1, 1, 1, 1,
1.029599, -0.5034158, 2.207783, 1, 1, 1, 1, 1,
1.029889, -0.3344827, 2.067625, 0, 0, 1, 1, 1,
1.032934, 0.1522767, 1.71859, 1, 0, 0, 1, 1,
1.036698, 0.3362294, 3.121825, 1, 0, 0, 1, 1,
1.039123, -0.5507997, 0.008753955, 1, 0, 0, 1, 1,
1.041173, -1.020824, 1.485478, 1, 0, 0, 1, 1,
1.048681, 1.83757, 0.7196779, 1, 0, 0, 1, 1,
1.050224, -1.065429, 3.019317, 0, 0, 0, 1, 1,
1.054139, 1.297395, 2.204882, 0, 0, 0, 1, 1,
1.059245, -0.0676446, 2.048574, 0, 0, 0, 1, 1,
1.061562, 0.3997117, 1.64104, 0, 0, 0, 1, 1,
1.065369, 2.74218, -0.6499403, 0, 0, 0, 1, 1,
1.069152, -0.006623816, 2.795249, 0, 0, 0, 1, 1,
1.08193, 0.9631816, -0.3722207, 0, 0, 0, 1, 1,
1.097673, -1.2304, 1.244727, 1, 1, 1, 1, 1,
1.101516, 0.5506402, 0.1203373, 1, 1, 1, 1, 1,
1.103637, -0.8452659, 2.936351, 1, 1, 1, 1, 1,
1.105658, 0.4276586, 1.662827, 1, 1, 1, 1, 1,
1.108498, -1.603197, -0.05865194, 1, 1, 1, 1, 1,
1.110722, -0.1512632, 3.421074, 1, 1, 1, 1, 1,
1.118977, 1.063885, 1.484691, 1, 1, 1, 1, 1,
1.121104, 0.5791605, 3.162607, 1, 1, 1, 1, 1,
1.124465, -1.962486, 3.868632, 1, 1, 1, 1, 1,
1.131076, 0.8945709, 0.01238899, 1, 1, 1, 1, 1,
1.133866, -1.517114, 2.331549, 1, 1, 1, 1, 1,
1.141134, -0.2274057, 1.825344, 1, 1, 1, 1, 1,
1.14605, 2.077702, -0.5456398, 1, 1, 1, 1, 1,
1.155561, -0.7816483, 2.175185, 1, 1, 1, 1, 1,
1.156888, 0.1929695, 0.8646578, 1, 1, 1, 1, 1,
1.15717, 0.4478308, 0.9905137, 0, 0, 1, 1, 1,
1.160954, 0.7395409, 2.024134, 1, 0, 0, 1, 1,
1.162964, -1.278066, 1.701709, 1, 0, 0, 1, 1,
1.164199, 0.139827, 2.541539, 1, 0, 0, 1, 1,
1.166228, 1.710021, 1.540383, 1, 0, 0, 1, 1,
1.17995, -1.15302, 2.83347, 1, 0, 0, 1, 1,
1.185029, -0.9539821, 3.017091, 0, 0, 0, 1, 1,
1.188636, 1.481609, 0.895097, 0, 0, 0, 1, 1,
1.190324, 0.1361791, 0.4853785, 0, 0, 0, 1, 1,
1.207399, 0.01068131, 3.192332, 0, 0, 0, 1, 1,
1.210698, -1.721695, 3.446612, 0, 0, 0, 1, 1,
1.226603, 0.5500749, 1.221831, 0, 0, 0, 1, 1,
1.234761, 1.730425, 0.9897591, 0, 0, 0, 1, 1,
1.243166, 0.7351653, 1.450794, 1, 1, 1, 1, 1,
1.248037, -0.7541564, 2.433546, 1, 1, 1, 1, 1,
1.249388, -0.708564, 4.341703, 1, 1, 1, 1, 1,
1.251836, -0.367633, 2.103382, 1, 1, 1, 1, 1,
1.26193, -0.4557978, 2.184756, 1, 1, 1, 1, 1,
1.269575, -0.3838609, 0.855544, 1, 1, 1, 1, 1,
1.269608, -1.452535, 2.839499, 1, 1, 1, 1, 1,
1.276911, -0.8452598, 1.067467, 1, 1, 1, 1, 1,
1.278212, 0.1624734, 1.86022, 1, 1, 1, 1, 1,
1.288619, 1.201979, -1.0113, 1, 1, 1, 1, 1,
1.289253, -1.523459, 2.089819, 1, 1, 1, 1, 1,
1.289894, 0.9468917, -0.04190265, 1, 1, 1, 1, 1,
1.29874, 0.5157737, 0.41756, 1, 1, 1, 1, 1,
1.306653, -2.113371, 3.725215, 1, 1, 1, 1, 1,
1.310303, -0.02409612, 0.947432, 1, 1, 1, 1, 1,
1.317995, 0.1290639, 1.522321, 0, 0, 1, 1, 1,
1.318457, -0.7059673, 1.470047, 1, 0, 0, 1, 1,
1.325398, -2.021435, 3.019521, 1, 0, 0, 1, 1,
1.325623, -0.5377952, 1.143037, 1, 0, 0, 1, 1,
1.330571, -0.06361146, 1.537594, 1, 0, 0, 1, 1,
1.331402, -1.594321, 3.005754, 1, 0, 0, 1, 1,
1.331728, 0.07584466, 1.193603, 0, 0, 0, 1, 1,
1.333105, 0.02015785, 0.207781, 0, 0, 0, 1, 1,
1.333871, 0.5586694, -0.0449893, 0, 0, 0, 1, 1,
1.35427, -0.6452417, 4.196239, 0, 0, 0, 1, 1,
1.362739, -0.1067028, 3.118446, 0, 0, 0, 1, 1,
1.375238, -0.1882337, 1.935129, 0, 0, 0, 1, 1,
1.375775, 1.462055, 0.4708033, 0, 0, 0, 1, 1,
1.388588, 0.3630316, -0.4117527, 1, 1, 1, 1, 1,
1.392733, 0.3811072, 2.83776, 1, 1, 1, 1, 1,
1.402022, 0.7807402, 2.383463, 1, 1, 1, 1, 1,
1.402717, -0.5872422, 0.346004, 1, 1, 1, 1, 1,
1.408165, -1.109539, 2.539131, 1, 1, 1, 1, 1,
1.416291, 0.4037554, 0.9202881, 1, 1, 1, 1, 1,
1.417905, 0.3465981, 2.782551, 1, 1, 1, 1, 1,
1.428115, -0.6736975, 2.78443, 1, 1, 1, 1, 1,
1.440516, -0.5404853, 0.6310238, 1, 1, 1, 1, 1,
1.446164, -0.9973467, 2.217644, 1, 1, 1, 1, 1,
1.453434, 1.18705, 0.02631808, 1, 1, 1, 1, 1,
1.454914, 0.8441299, 0.3021201, 1, 1, 1, 1, 1,
1.459778, -0.9422477, 0.9180959, 1, 1, 1, 1, 1,
1.464489, -0.3305426, 3.362458, 1, 1, 1, 1, 1,
1.464675, 0.5702985, 0.500887, 1, 1, 1, 1, 1,
1.48152, -0.3759966, 1.988092, 0, 0, 1, 1, 1,
1.488051, 0.6065117, 0.9594011, 1, 0, 0, 1, 1,
1.489534, 0.4262416, 2.398545, 1, 0, 0, 1, 1,
1.49498, -0.8796273, 0.6902985, 1, 0, 0, 1, 1,
1.49904, 1.252393, 0.7158468, 1, 0, 0, 1, 1,
1.50466, 0.9677349, 0.07056856, 1, 0, 0, 1, 1,
1.505633, 0.5607705, 0.4402391, 0, 0, 0, 1, 1,
1.507431, 0.9640199, 0.3864049, 0, 0, 0, 1, 1,
1.538088, 0.8215494, -0.6437259, 0, 0, 0, 1, 1,
1.545755, 0.4355197, 1.678003, 0, 0, 0, 1, 1,
1.546963, -1.037519, 2.304335, 0, 0, 0, 1, 1,
1.551179, -1.36698, 3.44982, 0, 0, 0, 1, 1,
1.555371, -0.1966023, 1.836152, 0, 0, 0, 1, 1,
1.571905, 0.4765517, 0.7473222, 1, 1, 1, 1, 1,
1.584263, -0.3442667, -0.1352886, 1, 1, 1, 1, 1,
1.589026, -0.8624634, 0.5954795, 1, 1, 1, 1, 1,
1.602301, -0.9196396, 4.079419, 1, 1, 1, 1, 1,
1.60644, -0.2807986, 2.407358, 1, 1, 1, 1, 1,
1.614844, -0.6878128, 1.935933, 1, 1, 1, 1, 1,
1.643551, 1.175111, 1.097077, 1, 1, 1, 1, 1,
1.654268, 0.5337853, 1.427208, 1, 1, 1, 1, 1,
1.675849, -0.9446645, 3.093833, 1, 1, 1, 1, 1,
1.71427, 1.052721, 1.171904, 1, 1, 1, 1, 1,
1.723406, 0.2222047, -0.4827972, 1, 1, 1, 1, 1,
1.73371, 0.3450018, 0.6611027, 1, 1, 1, 1, 1,
1.738535, -0.2744624, 2.551936, 1, 1, 1, 1, 1,
1.73918, -1.614642, 2.252867, 1, 1, 1, 1, 1,
1.739406, 0.169609, 0.7842783, 1, 1, 1, 1, 1,
1.758658, -0.3743814, 1.819728, 0, 0, 1, 1, 1,
1.763903, -0.6953467, 2.283168, 1, 0, 0, 1, 1,
1.775686, 1.014112, 2.16588, 1, 0, 0, 1, 1,
1.807565, -0.4052907, 0.9908565, 1, 0, 0, 1, 1,
1.814832, 1.211347, 1.762029, 1, 0, 0, 1, 1,
1.827719, 0.9357588, 1.844007, 1, 0, 0, 1, 1,
1.829243, 0.1168858, 2.814283, 0, 0, 0, 1, 1,
1.841293, -1.42375, 3.114452, 0, 0, 0, 1, 1,
1.841485, 0.8009362, 0.9160069, 0, 0, 0, 1, 1,
1.853237, -0.4987435, 1.245407, 0, 0, 0, 1, 1,
1.876017, 1.216895, 1.858429, 0, 0, 0, 1, 1,
1.879892, 0.6217995, 0.3905311, 0, 0, 0, 1, 1,
1.882197, 0.483747, 0.2640949, 0, 0, 0, 1, 1,
1.923894, -0.04550151, 2.947514, 1, 1, 1, 1, 1,
1.941362, -1.331699, 0.9297805, 1, 1, 1, 1, 1,
1.948328, 0.702389, 2.09335, 1, 1, 1, 1, 1,
1.955865, -1.179415, 3.082713, 1, 1, 1, 1, 1,
1.968609, 0.6281046, 1.976674, 1, 1, 1, 1, 1,
1.969765, 0.1503344, 2.690517, 1, 1, 1, 1, 1,
1.973297, -0.2892579, 2.78274, 1, 1, 1, 1, 1,
1.974185, 0.1314323, 0.9925789, 1, 1, 1, 1, 1,
1.981589, 0.5493711, 0.8191609, 1, 1, 1, 1, 1,
2.015037, -1.261633, 2.187176, 1, 1, 1, 1, 1,
2.018532, 0.8158872, 2.106265, 1, 1, 1, 1, 1,
2.034652, 0.4180704, 0.974758, 1, 1, 1, 1, 1,
2.043299, -0.1372301, -0.6079856, 1, 1, 1, 1, 1,
2.045991, -0.5275953, 0.9580046, 1, 1, 1, 1, 1,
2.053895, 0.4022489, 3.126501, 1, 1, 1, 1, 1,
2.056891, -0.6808049, 3.608013, 0, 0, 1, 1, 1,
2.079855, -1.296968, 3.289522, 1, 0, 0, 1, 1,
2.12423, -1.141334, 2.172835, 1, 0, 0, 1, 1,
2.126243, -1.342094, 3.422506, 1, 0, 0, 1, 1,
2.135111, 0.8598235, 1.914884, 1, 0, 0, 1, 1,
2.164904, -0.1789939, 2.342782, 1, 0, 0, 1, 1,
2.206306, -0.3921255, 3.378982, 0, 0, 0, 1, 1,
2.215574, 0.446748, 1.286745, 0, 0, 0, 1, 1,
2.221858, 1.267218, 1.294227, 0, 0, 0, 1, 1,
2.252184, 2.533702, 1.469016, 0, 0, 0, 1, 1,
2.268414, -1.175362, 4.871581, 0, 0, 0, 1, 1,
2.293726, 1.768138, -0.3731573, 0, 0, 0, 1, 1,
2.31176, 1.505129, 1.190489, 0, 0, 0, 1, 1,
2.33202, 0.3002584, 2.073755, 1, 1, 1, 1, 1,
2.390273, -0.5174798, 2.497029, 1, 1, 1, 1, 1,
2.391254, 0.6464125, 1.74843, 1, 1, 1, 1, 1,
2.466972, -0.3520252, 4.567601, 1, 1, 1, 1, 1,
2.508865, 0.07071953, 1.996018, 1, 1, 1, 1, 1,
2.725526, 1.723318, 0.4010051, 1, 1, 1, 1, 1,
2.943118, -0.6807972, 2.273178, 1, 1, 1, 1, 1
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
var radius = 9.430382;
var distance = 33.12382;
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
mvMatrix.translate( 0.05102634, -0.2817926, -0.3674293 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.12382);
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
