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
-3.032544, -2.214787, -1.372994, 1, 0, 0, 1,
-3.018825, -0.9180306, -2.708616, 1, 0.007843138, 0, 1,
-2.925819, 0.2093276, -2.026592, 1, 0.01176471, 0, 1,
-2.69491, -1.93112, -0.1421957, 1, 0.01960784, 0, 1,
-2.547343, -0.4947731, -2.773727, 1, 0.02352941, 0, 1,
-2.541679, -0.952493, -3.423184, 1, 0.03137255, 0, 1,
-2.473372, -0.2328948, -2.708504, 1, 0.03529412, 0, 1,
-2.446117, 1.418355, -2.362646, 1, 0.04313726, 0, 1,
-2.44041, -1.337705, -3.074727, 1, 0.04705882, 0, 1,
-2.365379, 0.6541682, -2.669801, 1, 0.05490196, 0, 1,
-2.350845, -0.2084438, 1.289782, 1, 0.05882353, 0, 1,
-2.33382, 0.4382101, -1.402378, 1, 0.06666667, 0, 1,
-2.309314, 0.02079595, 0.7908077, 1, 0.07058824, 0, 1,
-2.285026, -0.2326761, -3.297568, 1, 0.07843138, 0, 1,
-2.269196, 0.05444198, -2.134838, 1, 0.08235294, 0, 1,
-2.247229, -1.387131, -2.573409, 1, 0.09019608, 0, 1,
-2.229663, -0.1756591, -1.365861, 1, 0.09411765, 0, 1,
-2.186121, -0.8781946, -1.332252, 1, 0.1019608, 0, 1,
-2.112169, 1.641361, -0.9429232, 1, 0.1098039, 0, 1,
-2.100559, 2.359049, -1.771803, 1, 0.1137255, 0, 1,
-2.094309, -0.613107, -1.748035, 1, 0.1215686, 0, 1,
-2.07006, -0.2047243, -2.935962, 1, 0.1254902, 0, 1,
-2.065242, 1.189427, -0.8822008, 1, 0.1333333, 0, 1,
-2.055284, 0.1262439, -2.055235, 1, 0.1372549, 0, 1,
-2.017468, -0.4033352, -1.27853, 1, 0.145098, 0, 1,
-2.014698, -0.9194576, -1.200741, 1, 0.1490196, 0, 1,
-2.013282, 0.218137, -1.436135, 1, 0.1568628, 0, 1,
-2.010047, 0.6832503, -1.243586, 1, 0.1607843, 0, 1,
-1.958151, -0.4777489, -1.871094, 1, 0.1686275, 0, 1,
-1.93106, 0.3396086, 0.2417498, 1, 0.172549, 0, 1,
-1.899863, 0.3454659, -0.4634282, 1, 0.1803922, 0, 1,
-1.894034, -0.6756281, 1.249631, 1, 0.1843137, 0, 1,
-1.892107, -0.1571349, -3.010854, 1, 0.1921569, 0, 1,
-1.888728, 1.182683, 0.1323288, 1, 0.1960784, 0, 1,
-1.870439, 0.5712667, -1.938431, 1, 0.2039216, 0, 1,
-1.859123, -0.9718826, -0.1408536, 1, 0.2117647, 0, 1,
-1.852685, -0.5138962, -2.433151, 1, 0.2156863, 0, 1,
-1.821552, 0.2709863, -1.438658, 1, 0.2235294, 0, 1,
-1.786188, -0.7967675, -3.57982, 1, 0.227451, 0, 1,
-1.770865, 0.6191821, -1.173832, 1, 0.2352941, 0, 1,
-1.767072, 0.7350062, -1.617224, 1, 0.2392157, 0, 1,
-1.765421, -1.639402, -3.218122, 1, 0.2470588, 0, 1,
-1.754677, 0.6656222, -0.730424, 1, 0.2509804, 0, 1,
-1.737764, -1.902998, -2.33066, 1, 0.2588235, 0, 1,
-1.73347, -0.4278649, -2.457493, 1, 0.2627451, 0, 1,
-1.718842, -0.7749055, -1.653409, 1, 0.2705882, 0, 1,
-1.706111, 1.477011, -1.877803, 1, 0.2745098, 0, 1,
-1.70113, 1.933888, -0.4684043, 1, 0.282353, 0, 1,
-1.700195, 1.563792, -2.942974, 1, 0.2862745, 0, 1,
-1.6903, 0.8204073, -0.1768204, 1, 0.2941177, 0, 1,
-1.68619, 0.7538069, -2.567805, 1, 0.3019608, 0, 1,
-1.681481, 1.030964, -0.607787, 1, 0.3058824, 0, 1,
-1.675948, -0.4318986, -1.473096, 1, 0.3137255, 0, 1,
-1.671772, -0.01137409, 1.078105, 1, 0.3176471, 0, 1,
-1.668949, 0.7861724, -1.823959, 1, 0.3254902, 0, 1,
-1.636782, -0.2957709, -3.027408, 1, 0.3294118, 0, 1,
-1.636436, 0.2802381, -1.671453, 1, 0.3372549, 0, 1,
-1.629804, -0.3959839, -1.87267, 1, 0.3411765, 0, 1,
-1.623826, -1.447361, -3.296439, 1, 0.3490196, 0, 1,
-1.622301, -0.7257296, -1.643807, 1, 0.3529412, 0, 1,
-1.608998, 0.183001, -2.139207, 1, 0.3607843, 0, 1,
-1.58036, -1.638962, -1.247268, 1, 0.3647059, 0, 1,
-1.561939, -2.084944, -1.454343, 1, 0.372549, 0, 1,
-1.554829, 2.440645, -0.9229579, 1, 0.3764706, 0, 1,
-1.546708, -0.6385269, -3.288725, 1, 0.3843137, 0, 1,
-1.546311, 0.0425325, -1.022587, 1, 0.3882353, 0, 1,
-1.542867, -0.6517322, -1.743537, 1, 0.3960784, 0, 1,
-1.542785, -0.4787072, -2.213465, 1, 0.4039216, 0, 1,
-1.53984, -2.788682, -2.361311, 1, 0.4078431, 0, 1,
-1.519671, 0.7089394, -2.894473, 1, 0.4156863, 0, 1,
-1.515968, 0.9733536, 0.1256064, 1, 0.4196078, 0, 1,
-1.515693, 1.313677, -2.218084, 1, 0.427451, 0, 1,
-1.505979, -0.4448904, -2.748821, 1, 0.4313726, 0, 1,
-1.501805, 0.2088751, -2.365671, 1, 0.4392157, 0, 1,
-1.501361, -1.732924, -2.629651, 1, 0.4431373, 0, 1,
-1.486306, 1.160442, 0.7915553, 1, 0.4509804, 0, 1,
-1.481273, -1.599224, -2.412774, 1, 0.454902, 0, 1,
-1.467084, 1.057264, -1.324816, 1, 0.4627451, 0, 1,
-1.461485, -2.49347, -1.842726, 1, 0.4666667, 0, 1,
-1.459143, 1.015891, -0.3940665, 1, 0.4745098, 0, 1,
-1.456879, -1.249597, -2.406188, 1, 0.4784314, 0, 1,
-1.456139, -0.2927324, -0.7687603, 1, 0.4862745, 0, 1,
-1.454905, 0.6863037, -2.869272, 1, 0.4901961, 0, 1,
-1.454168, -0.4395106, -0.5609933, 1, 0.4980392, 0, 1,
-1.433891, -0.7734743, -3.889641, 1, 0.5058824, 0, 1,
-1.431012, -1.260737, -1.969715, 1, 0.509804, 0, 1,
-1.426589, 0.4166713, -0.5540904, 1, 0.5176471, 0, 1,
-1.41701, -0.6650479, -2.542485, 1, 0.5215687, 0, 1,
-1.412458, 2.151644, -0.8040394, 1, 0.5294118, 0, 1,
-1.411925, -0.07886445, -1.675107, 1, 0.5333334, 0, 1,
-1.407972, -0.6820702, -1.02585, 1, 0.5411765, 0, 1,
-1.398148, -1.317927, -2.297692, 1, 0.5450981, 0, 1,
-1.396185, 0.1771839, -1.77129, 1, 0.5529412, 0, 1,
-1.38093, 1.227011, -1.213158, 1, 0.5568628, 0, 1,
-1.380515, -0.9524766, -1.256081, 1, 0.5647059, 0, 1,
-1.379639, 0.6577951, -1.17097, 1, 0.5686275, 0, 1,
-1.375539, -0.4358326, -2.351222, 1, 0.5764706, 0, 1,
-1.368822, -0.9974194, -2.76185, 1, 0.5803922, 0, 1,
-1.366982, -0.1235014, -1.828756, 1, 0.5882353, 0, 1,
-1.363768, -0.6915735, -4.415398, 1, 0.5921569, 0, 1,
-1.358551, 1.847825, 0.3972776, 1, 0.6, 0, 1,
-1.345842, 0.2652968, -1.175232, 1, 0.6078432, 0, 1,
-1.337471, 0.5487724, -3.38553, 1, 0.6117647, 0, 1,
-1.332552, 1.13801, 0.6328368, 1, 0.6196079, 0, 1,
-1.332301, -0.5166113, -2.431716, 1, 0.6235294, 0, 1,
-1.328812, -0.8500137, -3.099764, 1, 0.6313726, 0, 1,
-1.32019, -0.8459195, -2.012906, 1, 0.6352941, 0, 1,
-1.319247, -1.381861, -3.4252, 1, 0.6431373, 0, 1,
-1.31709, 0.04772965, -1.843998, 1, 0.6470588, 0, 1,
-1.313352, 0.834182, -2.933154, 1, 0.654902, 0, 1,
-1.309862, 0.200419, -2.036818, 1, 0.6588235, 0, 1,
-1.302556, 0.4998775, -3.049045, 1, 0.6666667, 0, 1,
-1.276318, -0.5602974, -1.174472, 1, 0.6705883, 0, 1,
-1.271456, -0.4079954, -2.928816, 1, 0.6784314, 0, 1,
-1.27044, 0.09085075, -1.983534, 1, 0.682353, 0, 1,
-1.262378, -1.4989, -3.817642, 1, 0.6901961, 0, 1,
-1.259781, -2.139695, -3.224974, 1, 0.6941177, 0, 1,
-1.257482, 0.986292, -1.821998, 1, 0.7019608, 0, 1,
-1.257106, 0.06579049, -0.894928, 1, 0.7098039, 0, 1,
-1.251685, -1.196378, -1.855546, 1, 0.7137255, 0, 1,
-1.241958, 1.203999, -0.8609344, 1, 0.7215686, 0, 1,
-1.236521, 0.8068453, -0.3711727, 1, 0.7254902, 0, 1,
-1.235121, 0.3366044, -3.116618, 1, 0.7333333, 0, 1,
-1.234153, 1.076287, -2.698785, 1, 0.7372549, 0, 1,
-1.23247, 0.3321345, -2.487661, 1, 0.7450981, 0, 1,
-1.231975, 0.0324863, -2.050485, 1, 0.7490196, 0, 1,
-1.231667, -0.4538793, -1.974224, 1, 0.7568628, 0, 1,
-1.228402, -0.4649133, -1.287603, 1, 0.7607843, 0, 1,
-1.217529, -0.2326762, -1.225259, 1, 0.7686275, 0, 1,
-1.197092, -0.0480717, -1.555983, 1, 0.772549, 0, 1,
-1.196083, 0.2862526, -1.068913, 1, 0.7803922, 0, 1,
-1.189447, -0.4389629, -2.363236, 1, 0.7843137, 0, 1,
-1.180632, 0.6469034, -0.532397, 1, 0.7921569, 0, 1,
-1.17659, 0.2896671, 0.1751065, 1, 0.7960784, 0, 1,
-1.176528, -0.3928401, -0.4236179, 1, 0.8039216, 0, 1,
-1.175474, 0.0698218, -3.04747, 1, 0.8117647, 0, 1,
-1.171604, 0.4455765, -0.492399, 1, 0.8156863, 0, 1,
-1.16909, -0.5939466, -1.909455, 1, 0.8235294, 0, 1,
-1.166219, -2.039801, -3.243794, 1, 0.827451, 0, 1,
-1.165631, 1.659654, 0.7726579, 1, 0.8352941, 0, 1,
-1.159101, 0.1817144, -1.352467, 1, 0.8392157, 0, 1,
-1.158494, 2.243654, 1.375946, 1, 0.8470588, 0, 1,
-1.144952, -0.7696242, -1.977892, 1, 0.8509804, 0, 1,
-1.143967, -0.3031414, -3.549731, 1, 0.8588235, 0, 1,
-1.143918, 0.2436775, -2.307532, 1, 0.8627451, 0, 1,
-1.137283, 1.00376, 0.2333864, 1, 0.8705882, 0, 1,
-1.136355, -1.001428, -1.111227, 1, 0.8745098, 0, 1,
-1.125307, 1.148924, 0.2107677, 1, 0.8823529, 0, 1,
-1.110536, -1.551051, -1.354787, 1, 0.8862745, 0, 1,
-1.110495, 0.3116345, -1.232427, 1, 0.8941177, 0, 1,
-1.109621, -1.241289, -3.066549, 1, 0.8980392, 0, 1,
-1.105836, -1.320205, -2.985968, 1, 0.9058824, 0, 1,
-1.103454, 0.8098082, -2.333833, 1, 0.9137255, 0, 1,
-1.091488, 2.121725, 0.02601939, 1, 0.9176471, 0, 1,
-1.084307, 1.122786, 0.5151176, 1, 0.9254902, 0, 1,
-1.08102, 0.1613429, -2.1354, 1, 0.9294118, 0, 1,
-1.075054, 0.7060322, 0.5303132, 1, 0.9372549, 0, 1,
-1.049348, 2.321261, 0.1870518, 1, 0.9411765, 0, 1,
-1.048695, -0.2062158, -1.738091, 1, 0.9490196, 0, 1,
-1.047098, 1.646635, 0.07286325, 1, 0.9529412, 0, 1,
-1.045182, 0.05459294, -2.824272, 1, 0.9607843, 0, 1,
-1.044988, -0.4078753, -2.215608, 1, 0.9647059, 0, 1,
-1.035291, -0.7190896, -0.4764693, 1, 0.972549, 0, 1,
-1.026348, 1.169114, -0.8622919, 1, 0.9764706, 0, 1,
-1.015255, -0.9724995, -1.13576, 1, 0.9843137, 0, 1,
-1.013461, 0.9146644, 0.6583538, 1, 0.9882353, 0, 1,
-1.01283, 0.6412252, -1.975876, 1, 0.9960784, 0, 1,
-1.011248, -0.1278121, -0.5386074, 0.9960784, 1, 0, 1,
-1.005982, 0.860309, -1.098787, 0.9921569, 1, 0, 1,
-0.9994439, -1.411639, -2.803317, 0.9843137, 1, 0, 1,
-0.9962465, 0.1654369, -3.088341, 0.9803922, 1, 0, 1,
-0.9944689, -0.7441069, -1.514419, 0.972549, 1, 0, 1,
-0.9887038, -0.5224732, -2.172336, 0.9686275, 1, 0, 1,
-0.9878528, -0.7520121, -1.739032, 0.9607843, 1, 0, 1,
-0.9845288, -0.01943864, -2.587979, 0.9568627, 1, 0, 1,
-0.9834269, 0.5918461, 0.1252706, 0.9490196, 1, 0, 1,
-0.9825101, -1.347597, -2.69093, 0.945098, 1, 0, 1,
-0.9801056, -0.4697062, -3.192645, 0.9372549, 1, 0, 1,
-0.9795762, 0.0918663, -0.9460816, 0.9333333, 1, 0, 1,
-0.9784517, -0.004146683, -0.7551928, 0.9254902, 1, 0, 1,
-0.9753839, -0.6505116, -4.75983, 0.9215686, 1, 0, 1,
-0.9711339, -1.773017, -2.143133, 0.9137255, 1, 0, 1,
-0.9711083, -1.295446, -2.466946, 0.9098039, 1, 0, 1,
-0.9706194, -1.10257, -2.307456, 0.9019608, 1, 0, 1,
-0.9642335, -1.070499, -2.556483, 0.8941177, 1, 0, 1,
-0.9615571, -0.2444641, -1.807597, 0.8901961, 1, 0, 1,
-0.9603705, 0.1809115, -2.385454, 0.8823529, 1, 0, 1,
-0.9518609, -0.1450623, -2.008891, 0.8784314, 1, 0, 1,
-0.9433951, -1.383414, -2.854151, 0.8705882, 1, 0, 1,
-0.9364381, -0.2458024, -2.440928, 0.8666667, 1, 0, 1,
-0.9302918, -1.586789, -3.34515, 0.8588235, 1, 0, 1,
-0.9201392, 1.243136, -1.271116, 0.854902, 1, 0, 1,
-0.9181622, 1.333731, -0.9023867, 0.8470588, 1, 0, 1,
-0.9064205, 0.4864664, -2.025794, 0.8431373, 1, 0, 1,
-0.9025442, 0.5096571, 1.315475, 0.8352941, 1, 0, 1,
-0.8985426, 0.6687836, -0.07968817, 0.8313726, 1, 0, 1,
-0.8967012, 0.9802099, -0.06046878, 0.8235294, 1, 0, 1,
-0.8906432, 0.1970502, -2.802795, 0.8196079, 1, 0, 1,
-0.8900618, 0.4885874, -1.823347, 0.8117647, 1, 0, 1,
-0.8818757, 1.147488, -2.077445, 0.8078431, 1, 0, 1,
-0.8802828, -1.215428, -2.896672, 0.8, 1, 0, 1,
-0.8738267, -2.338888, -0.5485876, 0.7921569, 1, 0, 1,
-0.8548441, -0.3400019, -2.482174, 0.7882353, 1, 0, 1,
-0.8524063, -0.5376173, -1.391871, 0.7803922, 1, 0, 1,
-0.8516753, 0.7224278, -1.516257, 0.7764706, 1, 0, 1,
-0.8473704, -0.9865381, -2.437989, 0.7686275, 1, 0, 1,
-0.8469535, 1.287272, -0.9112879, 0.7647059, 1, 0, 1,
-0.8422627, 0.301248, -1.262117, 0.7568628, 1, 0, 1,
-0.8387967, -1.496118, -1.900225, 0.7529412, 1, 0, 1,
-0.8384249, -0.4088431, -1.099884, 0.7450981, 1, 0, 1,
-0.8376812, -0.08717159, -1.582059, 0.7411765, 1, 0, 1,
-0.8362588, 0.398337, -0.4820808, 0.7333333, 1, 0, 1,
-0.8280265, -0.7244547, -2.916784, 0.7294118, 1, 0, 1,
-0.8220268, -1.713863, -3.4307, 0.7215686, 1, 0, 1,
-0.8166519, 0.3710436, -1.219552, 0.7176471, 1, 0, 1,
-0.8165123, 0.1499965, -0.1207424, 0.7098039, 1, 0, 1,
-0.81286, -0.007501935, -0.4636516, 0.7058824, 1, 0, 1,
-0.8111888, -0.6362244, -3.59386, 0.6980392, 1, 0, 1,
-0.8059556, 0.2866215, -1.593913, 0.6901961, 1, 0, 1,
-0.8013363, -1.611497, -3.352671, 0.6862745, 1, 0, 1,
-0.7994716, -2.522747, -3.77921, 0.6784314, 1, 0, 1,
-0.7976045, -0.4110704, -2.954087, 0.6745098, 1, 0, 1,
-0.7943968, -2.26725, -2.042987, 0.6666667, 1, 0, 1,
-0.777732, -0.2812018, -3.800368, 0.6627451, 1, 0, 1,
-0.7680204, -0.7896226, -1.917255, 0.654902, 1, 0, 1,
-0.7663072, -0.2098492, -1.289954, 0.6509804, 1, 0, 1,
-0.7553872, -0.6778734, -0.7538098, 0.6431373, 1, 0, 1,
-0.744315, -0.2772644, -2.906304, 0.6392157, 1, 0, 1,
-0.7432992, 0.2944815, -0.6325054, 0.6313726, 1, 0, 1,
-0.73835, 0.3038927, -0.2641041, 0.627451, 1, 0, 1,
-0.7299454, 1.507976, -1.0185, 0.6196079, 1, 0, 1,
-0.7173735, 0.008568387, -0.6034096, 0.6156863, 1, 0, 1,
-0.7165945, 0.3878701, -0.7977226, 0.6078432, 1, 0, 1,
-0.7161852, 2.605765, 0.2426641, 0.6039216, 1, 0, 1,
-0.7120637, 0.09313268, -1.905801, 0.5960785, 1, 0, 1,
-0.711042, 0.4788724, -0.3468322, 0.5882353, 1, 0, 1,
-0.7087721, 0.6591095, -2.353667, 0.5843138, 1, 0, 1,
-0.6940871, -0.5553136, -2.416627, 0.5764706, 1, 0, 1,
-0.6890309, 0.257652, -1.350172, 0.572549, 1, 0, 1,
-0.6832786, -0.6107212, -2.48173, 0.5647059, 1, 0, 1,
-0.6780684, 0.07106171, -1.859919, 0.5607843, 1, 0, 1,
-0.6757996, -0.4570566, -3.122389, 0.5529412, 1, 0, 1,
-0.6704171, 0.3688254, -0.3144737, 0.5490196, 1, 0, 1,
-0.6691824, 1.650511, -1.04874, 0.5411765, 1, 0, 1,
-0.6672996, -0.08377832, -0.8361434, 0.5372549, 1, 0, 1,
-0.6623331, -0.5744762, -2.415068, 0.5294118, 1, 0, 1,
-0.6607316, 1.128333, 0.5535768, 0.5254902, 1, 0, 1,
-0.6597664, -2.077891, -3.264963, 0.5176471, 1, 0, 1,
-0.6570494, -0.5296946, -0.5768129, 0.5137255, 1, 0, 1,
-0.6549751, -0.6024736, -2.594701, 0.5058824, 1, 0, 1,
-0.6547868, -0.1594185, -1.047566, 0.5019608, 1, 0, 1,
-0.654775, -0.629213, -2.217539, 0.4941176, 1, 0, 1,
-0.6546094, 0.7639943, 0.1286617, 0.4862745, 1, 0, 1,
-0.6523927, 1.726316, 0.923216, 0.4823529, 1, 0, 1,
-0.6471732, 0.04611995, -2.862588, 0.4745098, 1, 0, 1,
-0.6467735, 1.545428, 1.151042, 0.4705882, 1, 0, 1,
-0.6461345, 0.3529472, -0.1726259, 0.4627451, 1, 0, 1,
-0.6415961, 0.6132275, -1.294475, 0.4588235, 1, 0, 1,
-0.6386224, 0.2847011, -0.8437703, 0.4509804, 1, 0, 1,
-0.6369259, 1.121701, -0.6417837, 0.4470588, 1, 0, 1,
-0.6350884, -0.6489708, -3.376915, 0.4392157, 1, 0, 1,
-0.6342211, -0.9785223, -2.582978, 0.4352941, 1, 0, 1,
-0.6300219, 0.3454947, -3.196057, 0.427451, 1, 0, 1,
-0.6234841, -1.668437, -1.962864, 0.4235294, 1, 0, 1,
-0.6168939, -0.08003038, -2.457061, 0.4156863, 1, 0, 1,
-0.6161283, -0.5657396, -2.889399, 0.4117647, 1, 0, 1,
-0.615203, 0.3187609, -2.795232, 0.4039216, 1, 0, 1,
-0.6137526, -0.07251491, -1.766147, 0.3960784, 1, 0, 1,
-0.6135183, -0.6680285, -3.554505, 0.3921569, 1, 0, 1,
-0.6133908, -0.863946, -2.185824, 0.3843137, 1, 0, 1,
-0.6097858, 1.096141, 0.8350067, 0.3803922, 1, 0, 1,
-0.6026672, 0.01671769, -2.711068, 0.372549, 1, 0, 1,
-0.5999461, 0.515195, -0.72313, 0.3686275, 1, 0, 1,
-0.5963288, 2.111697, -0.6102341, 0.3607843, 1, 0, 1,
-0.5948108, 0.1036689, -2.17277, 0.3568628, 1, 0, 1,
-0.5947638, 1.977326, -2.886772, 0.3490196, 1, 0, 1,
-0.5894188, 0.6070884, -0.7435754, 0.345098, 1, 0, 1,
-0.58325, 2.819188, -0.3491675, 0.3372549, 1, 0, 1,
-0.5789763, -2.846267, -0.5731273, 0.3333333, 1, 0, 1,
-0.5725767, -0.2835694, -2.147986, 0.3254902, 1, 0, 1,
-0.5682211, 0.1941614, -1.169092, 0.3215686, 1, 0, 1,
-0.5616896, -0.5665634, -3.281825, 0.3137255, 1, 0, 1,
-0.549786, -0.6572239, -2.189192, 0.3098039, 1, 0, 1,
-0.5460393, 0.9893662, -0.9093327, 0.3019608, 1, 0, 1,
-0.5449565, 0.1984916, -1.920715, 0.2941177, 1, 0, 1,
-0.5416913, 0.2906492, -0.9903674, 0.2901961, 1, 0, 1,
-0.5398028, 0.4658463, -1.321379, 0.282353, 1, 0, 1,
-0.5280613, 0.6898292, 0.6201553, 0.2784314, 1, 0, 1,
-0.525759, -1.180506, -3.735925, 0.2705882, 1, 0, 1,
-0.5194246, 1.307476, -0.9180858, 0.2666667, 1, 0, 1,
-0.5162403, 0.02971039, -1.712894, 0.2588235, 1, 0, 1,
-0.5131189, 0.05836061, -2.107769, 0.254902, 1, 0, 1,
-0.511188, 0.3625689, -2.595365, 0.2470588, 1, 0, 1,
-0.5110499, -0.8871834, -2.545382, 0.2431373, 1, 0, 1,
-0.5091197, 1.541942, -1.163236, 0.2352941, 1, 0, 1,
-0.5090612, -0.3184954, -2.04168, 0.2313726, 1, 0, 1,
-0.5048435, 0.6588259, 0.6142341, 0.2235294, 1, 0, 1,
-0.5012091, -0.7356079, -2.689587, 0.2196078, 1, 0, 1,
-0.4995394, 1.250713, -1.514476, 0.2117647, 1, 0, 1,
-0.4962137, 0.3417585, -0.5536097, 0.2078431, 1, 0, 1,
-0.4955003, -1.130779, -2.378839, 0.2, 1, 0, 1,
-0.4954628, 0.444563, -0.2273111, 0.1921569, 1, 0, 1,
-0.4912621, -0.1965336, -0.8183154, 0.1882353, 1, 0, 1,
-0.4899359, -0.2245526, -2.768277, 0.1803922, 1, 0, 1,
-0.4859213, 0.6140456, -1.555298, 0.1764706, 1, 0, 1,
-0.4806567, 0.4603338, -0.5231715, 0.1686275, 1, 0, 1,
-0.4792317, 0.103543, -1.290595, 0.1647059, 1, 0, 1,
-0.4791761, -0.05646478, 0.02973306, 0.1568628, 1, 0, 1,
-0.4778353, 0.4385684, -0.5469602, 0.1529412, 1, 0, 1,
-0.4756827, 1.218272, -1.48973, 0.145098, 1, 0, 1,
-0.4681898, 1.324233, 0.117797, 0.1411765, 1, 0, 1,
-0.4634016, 0.3792191, -1.753979, 0.1333333, 1, 0, 1,
-0.4593506, -0.1753208, -2.016526, 0.1294118, 1, 0, 1,
-0.4568502, 1.146939, -0.2993389, 0.1215686, 1, 0, 1,
-0.4557434, -0.2992601, -1.453932, 0.1176471, 1, 0, 1,
-0.4555573, 1.269539, -0.508157, 0.1098039, 1, 0, 1,
-0.4539778, -0.1929426, -1.363858, 0.1058824, 1, 0, 1,
-0.4525302, -0.4133788, -3.203862, 0.09803922, 1, 0, 1,
-0.4517994, -0.219607, -1.459461, 0.09019608, 1, 0, 1,
-0.4504997, 0.03232228, -2.118915, 0.08627451, 1, 0, 1,
-0.4437163, -0.06805693, -1.717089, 0.07843138, 1, 0, 1,
-0.4375137, -0.1487594, -2.122082, 0.07450981, 1, 0, 1,
-0.4370668, -1.466553, -3.922621, 0.06666667, 1, 0, 1,
-0.4302357, 0.5684736, 1.123842, 0.0627451, 1, 0, 1,
-0.429192, -0.3715178, -0.5696373, 0.05490196, 1, 0, 1,
-0.4261492, 0.02857456, -2.105389, 0.05098039, 1, 0, 1,
-0.4242038, -0.5581903, -3.293643, 0.04313726, 1, 0, 1,
-0.4183345, 0.7204821, -1.396536, 0.03921569, 1, 0, 1,
-0.4178306, 0.442124, -2.171076, 0.03137255, 1, 0, 1,
-0.4130229, 0.3893582, -0.1655396, 0.02745098, 1, 0, 1,
-0.4119791, -0.4911819, -1.514375, 0.01960784, 1, 0, 1,
-0.4086053, -0.7688664, -2.726208, 0.01568628, 1, 0, 1,
-0.4078279, 2.737376, -0.6155609, 0.007843138, 1, 0, 1,
-0.4038709, -0.2917381, -1.712769, 0.003921569, 1, 0, 1,
-0.3966798, 1.722154, 1.967577, 0, 1, 0.003921569, 1,
-0.3966617, -0.1343884, -2.082138, 0, 1, 0.01176471, 1,
-0.3953687, -0.1688911, -2.741738, 0, 1, 0.01568628, 1,
-0.3932233, -0.09678596, -0.2111788, 0, 1, 0.02352941, 1,
-0.3915915, -1.381331, -2.42159, 0, 1, 0.02745098, 1,
-0.3910117, -0.05511427, -1.474405, 0, 1, 0.03529412, 1,
-0.3874, -0.1987572, -4.96026, 0, 1, 0.03921569, 1,
-0.3856988, 1.399503, -0.7197648, 0, 1, 0.04705882, 1,
-0.3856879, 2.82973, -0.893774, 0, 1, 0.05098039, 1,
-0.3829405, 1.725132, 0.2940754, 0, 1, 0.05882353, 1,
-0.3819037, -0.3976129, -3.192687, 0, 1, 0.0627451, 1,
-0.3798596, -0.2980064, -3.547273, 0, 1, 0.07058824, 1,
-0.3770846, -0.7050897, -3.522655, 0, 1, 0.07450981, 1,
-0.3743092, 0.6063867, -0.7328815, 0, 1, 0.08235294, 1,
-0.370806, 1.682464, 0.9034231, 0, 1, 0.08627451, 1,
-0.3685309, -1.025543, -2.33972, 0, 1, 0.09411765, 1,
-0.3622298, -0.7663113, -4.150361, 0, 1, 0.1019608, 1,
-0.3620257, -0.1058925, -2.695084, 0, 1, 0.1058824, 1,
-0.3581765, -0.225082, -2.186895, 0, 1, 0.1137255, 1,
-0.3552708, -0.3923893, -0.6078355, 0, 1, 0.1176471, 1,
-0.3534372, 0.1039537, -1.614848, 0, 1, 0.1254902, 1,
-0.3523567, 0.2748123, -2.398577, 0, 1, 0.1294118, 1,
-0.3508222, -1.141684, -2.624817, 0, 1, 0.1372549, 1,
-0.3499635, 0.2332534, -2.886558, 0, 1, 0.1411765, 1,
-0.3468432, 0.1696803, -1.260597, 0, 1, 0.1490196, 1,
-0.3465236, -0.5673248, -2.315106, 0, 1, 0.1529412, 1,
-0.3464398, 0.8886971, -1.504628, 0, 1, 0.1607843, 1,
-0.3454411, 0.01395284, -0.7166082, 0, 1, 0.1647059, 1,
-0.3452192, 0.1572949, -1.402692, 0, 1, 0.172549, 1,
-0.3409391, -0.9740353, -3.307192, 0, 1, 0.1764706, 1,
-0.3387638, -0.5380977, -1.07239, 0, 1, 0.1843137, 1,
-0.3335079, 1.170757, -0.2802493, 0, 1, 0.1882353, 1,
-0.3327933, 0.02198131, -1.361634, 0, 1, 0.1960784, 1,
-0.327388, 0.3375782, -0.8705423, 0, 1, 0.2039216, 1,
-0.3202311, 0.3026915, -1.097012, 0, 1, 0.2078431, 1,
-0.3191611, -0.747025, -2.98989, 0, 1, 0.2156863, 1,
-0.3182655, 2.274658, 1.186076, 0, 1, 0.2196078, 1,
-0.3130586, -0.01895989, -1.226294, 0, 1, 0.227451, 1,
-0.3129199, -0.2710863, -1.028099, 0, 1, 0.2313726, 1,
-0.312142, 0.08359563, -0.8039129, 0, 1, 0.2392157, 1,
-0.3107185, -1.111388, -2.038662, 0, 1, 0.2431373, 1,
-0.3093965, 0.174454, -2.294518, 0, 1, 0.2509804, 1,
-0.3071417, -1.811146, -2.313292, 0, 1, 0.254902, 1,
-0.3037711, -1.993955, -2.452865, 0, 1, 0.2627451, 1,
-0.3018045, -0.6032336, -2.745506, 0, 1, 0.2666667, 1,
-0.2996656, -1.209569, -2.510085, 0, 1, 0.2745098, 1,
-0.2992491, -2.042037, -2.383907, 0, 1, 0.2784314, 1,
-0.2989995, 0.4108936, -2.053735, 0, 1, 0.2862745, 1,
-0.2988694, 0.7825826, -1.356371, 0, 1, 0.2901961, 1,
-0.2957712, -0.6141928, -2.401022, 0, 1, 0.2980392, 1,
-0.2955267, -0.2788728, -4.581254, 0, 1, 0.3058824, 1,
-0.2928703, -0.9547852, -2.522404, 0, 1, 0.3098039, 1,
-0.2922274, 0.07899147, -1.59744, 0, 1, 0.3176471, 1,
-0.2917552, 1.548961, 1.31162, 0, 1, 0.3215686, 1,
-0.2915947, -1.642251, -1.476679, 0, 1, 0.3294118, 1,
-0.2906684, 0.8963258, 0.4311227, 0, 1, 0.3333333, 1,
-0.2887239, 0.9590096, -0.763773, 0, 1, 0.3411765, 1,
-0.2878482, 1.723208, 0.3525392, 0, 1, 0.345098, 1,
-0.2869694, 0.5626708, -1.931745, 0, 1, 0.3529412, 1,
-0.2795519, 0.720638, 0.6360192, 0, 1, 0.3568628, 1,
-0.2773297, 0.1990653, -1.930583, 0, 1, 0.3647059, 1,
-0.2738528, 0.002584137, -1.341429, 0, 1, 0.3686275, 1,
-0.2738089, 0.3054244, -0.2682269, 0, 1, 0.3764706, 1,
-0.272047, 1.047658, -0.5870985, 0, 1, 0.3803922, 1,
-0.2713876, -0.7082053, -2.561182, 0, 1, 0.3882353, 1,
-0.2630597, 1.355866, -0.9293927, 0, 1, 0.3921569, 1,
-0.2605836, -0.7537336, -1.791314, 0, 1, 0.4, 1,
-0.2579705, 0.6723912, -1.30066, 0, 1, 0.4078431, 1,
-0.2534024, -1.582016, -4.182777, 0, 1, 0.4117647, 1,
-0.2492205, 0.2383209, 0.4743107, 0, 1, 0.4196078, 1,
-0.2457908, -0.5573289, -1.902305, 0, 1, 0.4235294, 1,
-0.2447739, -0.2857023, -2.654309, 0, 1, 0.4313726, 1,
-0.2415359, -0.6069405, -1.620324, 0, 1, 0.4352941, 1,
-0.2376235, 0.7316911, -1.349984, 0, 1, 0.4431373, 1,
-0.2335833, 0.3636675, 0.6084903, 0, 1, 0.4470588, 1,
-0.2290208, -1.78115, -2.644291, 0, 1, 0.454902, 1,
-0.2287556, 0.2767941, -1.198733, 0, 1, 0.4588235, 1,
-0.2270463, 1.338297, -0.4019312, 0, 1, 0.4666667, 1,
-0.2216802, 1.914379, 0.843718, 0, 1, 0.4705882, 1,
-0.2175296, -1.307304, -1.459513, 0, 1, 0.4784314, 1,
-0.2165265, -0.1006849, -3.816771, 0, 1, 0.4823529, 1,
-0.216013, 1.218264, 1.316446, 0, 1, 0.4901961, 1,
-0.2157076, 1.998453, 1.621254, 0, 1, 0.4941176, 1,
-0.2155165, 0.4234528, -1.569291, 0, 1, 0.5019608, 1,
-0.2147797, -0.3425573, -2.479773, 0, 1, 0.509804, 1,
-0.211942, -0.06250896, -4.134859, 0, 1, 0.5137255, 1,
-0.2093075, 0.3088081, -0.588696, 0, 1, 0.5215687, 1,
-0.2082893, 0.9263594, 0.8741038, 0, 1, 0.5254902, 1,
-0.2076069, -0.1688723, -4.245646, 0, 1, 0.5333334, 1,
-0.2073593, -0.4342532, -4.348398, 0, 1, 0.5372549, 1,
-0.2065145, 0.03633259, -2.50888, 0, 1, 0.5450981, 1,
-0.2053268, -0.5451701, -2.67446, 0, 1, 0.5490196, 1,
-0.2047019, 0.2775798, -1.09715, 0, 1, 0.5568628, 1,
-0.2036333, 0.8914913, -1.616077, 0, 1, 0.5607843, 1,
-0.2009668, 0.2191534, -0.4235081, 0, 1, 0.5686275, 1,
-0.2008691, -0.3949611, -1.238311, 0, 1, 0.572549, 1,
-0.1995912, -0.7887525, -1.890125, 0, 1, 0.5803922, 1,
-0.195985, 0.9343395, 0.5203851, 0, 1, 0.5843138, 1,
-0.1959147, 0.7396079, -1.700421, 0, 1, 0.5921569, 1,
-0.1916417, -1.049851, -2.673456, 0, 1, 0.5960785, 1,
-0.1873503, 0.2181914, -0.2387794, 0, 1, 0.6039216, 1,
-0.1872866, 2.213873, 0.25765, 0, 1, 0.6117647, 1,
-0.1867969, -2.038468, -2.556732, 0, 1, 0.6156863, 1,
-0.1853746, 0.3220739, -0.2606871, 0, 1, 0.6235294, 1,
-0.1778478, -0.4178848, -4.250132, 0, 1, 0.627451, 1,
-0.1758187, -0.8369511, -4.061207, 0, 1, 0.6352941, 1,
-0.1753558, 0.7971731, -1.578172, 0, 1, 0.6392157, 1,
-0.173723, 1.283205, -0.9651113, 0, 1, 0.6470588, 1,
-0.1724981, 1.201817, -0.6410456, 0, 1, 0.6509804, 1,
-0.1688825, -0.5736453, -3.764667, 0, 1, 0.6588235, 1,
-0.1662643, -0.5203429, -1.460355, 0, 1, 0.6627451, 1,
-0.1647191, -0.7866058, -3.592393, 0, 1, 0.6705883, 1,
-0.1638024, 0.0465343, -0.9543189, 0, 1, 0.6745098, 1,
-0.1578921, -1.372854, -1.288214, 0, 1, 0.682353, 1,
-0.155468, -1.206286, -4.356257, 0, 1, 0.6862745, 1,
-0.1545239, 1.267422, -0.3628069, 0, 1, 0.6941177, 1,
-0.1535781, -1.684971, -3.720367, 0, 1, 0.7019608, 1,
-0.1516814, -1.79774, -1.77203, 0, 1, 0.7058824, 1,
-0.1509151, 1.16697, 0.7917762, 0, 1, 0.7137255, 1,
-0.150041, -1.190866, -3.044016, 0, 1, 0.7176471, 1,
-0.14759, 0.3678701, -0.3840473, 0, 1, 0.7254902, 1,
-0.1445359, -0.435641, -1.216836, 0, 1, 0.7294118, 1,
-0.142009, 0.1735261, -0.9292954, 0, 1, 0.7372549, 1,
-0.1409719, -0.4347774, -2.818012, 0, 1, 0.7411765, 1,
-0.1388229, -1.198727, -1.506256, 0, 1, 0.7490196, 1,
-0.1337949, -1.27255, -2.007725, 0, 1, 0.7529412, 1,
-0.132157, -0.3838723, -3.542938, 0, 1, 0.7607843, 1,
-0.1309745, -0.966572, -4.161404, 0, 1, 0.7647059, 1,
-0.1301281, -0.3139024, -3.332611, 0, 1, 0.772549, 1,
-0.1277479, -0.9105849, -2.457123, 0, 1, 0.7764706, 1,
-0.1262685, 0.5390978, 0.4591761, 0, 1, 0.7843137, 1,
-0.1247634, 0.09915067, -1.952279, 0, 1, 0.7882353, 1,
-0.1156252, 0.7137161, -1.9138, 0, 1, 0.7960784, 1,
-0.1148887, 0.3814852, -0.3680224, 0, 1, 0.8039216, 1,
-0.1031241, 0.8739649, 1.066535, 0, 1, 0.8078431, 1,
-0.1014043, -0.04657774, -1.424866, 0, 1, 0.8156863, 1,
-0.1011745, -0.3346214, -2.015974, 0, 1, 0.8196079, 1,
-0.09299371, 0.2032358, 0.1234363, 0, 1, 0.827451, 1,
-0.09125249, -0.2737591, -2.318624, 0, 1, 0.8313726, 1,
-0.08951035, 0.1669659, 1.025954, 0, 1, 0.8392157, 1,
-0.08879914, -1.902456, -1.673831, 0, 1, 0.8431373, 1,
-0.08782648, 0.1414569, 0.8256009, 0, 1, 0.8509804, 1,
-0.0864211, -0.1692661, -2.687095, 0, 1, 0.854902, 1,
-0.08373977, -1.372518, -2.866293, 0, 1, 0.8627451, 1,
-0.0819171, 0.3470511, 1.996846, 0, 1, 0.8666667, 1,
-0.08079121, -1.048601, -2.415751, 0, 1, 0.8745098, 1,
-0.08033045, 0.7668554, 0.6843871, 0, 1, 0.8784314, 1,
-0.07932594, -0.03479245, -1.103658, 0, 1, 0.8862745, 1,
-0.06990615, -0.7923964, -2.917417, 0, 1, 0.8901961, 1,
-0.06145209, 1.510757, -0.03892336, 0, 1, 0.8980392, 1,
-0.05878224, -0.7156149, -1.860004, 0, 1, 0.9058824, 1,
-0.05780691, 0.5557256, -0.2626413, 0, 1, 0.9098039, 1,
-0.05610726, 0.1503299, 1.245042, 0, 1, 0.9176471, 1,
-0.05588733, 0.8454049, 0.5586826, 0, 1, 0.9215686, 1,
-0.05544404, -0.09333768, -3.41586, 0, 1, 0.9294118, 1,
-0.05499707, 0.4346272, 1.007542, 0, 1, 0.9333333, 1,
-0.04981799, -0.7788858, -2.303986, 0, 1, 0.9411765, 1,
-0.04829568, 0.2237865, -1.567414, 0, 1, 0.945098, 1,
-0.04779458, -0.298083, -2.205392, 0, 1, 0.9529412, 1,
-0.04603239, -0.561958, -2.381976, 0, 1, 0.9568627, 1,
-0.04420195, 0.306995, -1.077585, 0, 1, 0.9647059, 1,
-0.04211884, -1.225843, -2.085062, 0, 1, 0.9686275, 1,
-0.04108552, 1.49243, -0.788559, 0, 1, 0.9764706, 1,
-0.04035739, 0.6879294, 0.03412854, 0, 1, 0.9803922, 1,
-0.03999712, -0.03193072, -2.309489, 0, 1, 0.9882353, 1,
-0.03917445, 1.278341, -0.6145419, 0, 1, 0.9921569, 1,
-0.03717209, -1.323621, -2.028402, 0, 1, 1, 1,
-0.03001004, -0.04536906, -2.873984, 0, 0.9921569, 1, 1,
-0.02411952, 2.290084, -1.194125, 0, 0.9882353, 1, 1,
-0.02216757, -0.6468045, -3.861628, 0, 0.9803922, 1, 1,
-0.02182224, 0.5199222, -3.038034, 0, 0.9764706, 1, 1,
-0.02181629, -1.160957, -4.447009, 0, 0.9686275, 1, 1,
-0.01755988, -0.84835, -2.521775, 0, 0.9647059, 1, 1,
-0.01227103, -0.1289869, -3.821636, 0, 0.9568627, 1, 1,
-0.01144889, 0.1342127, 1.233041, 0, 0.9529412, 1, 1,
-0.00932468, 0.06162573, -0.03928523, 0, 0.945098, 1, 1,
-0.005064675, 0.2602921, 0.3607614, 0, 0.9411765, 1, 1,
-0.00374727, 0.551591, -0.5794048, 0, 0.9333333, 1, 1,
-0.003662359, -0.3015586, -2.145643, 0, 0.9294118, 1, 1,
-0.002932573, 2.527223, 2.701678, 0, 0.9215686, 1, 1,
0.0008574959, -0.6824576, 1.693303, 0, 0.9176471, 1, 1,
0.007189127, 1.358882, -1.063075, 0, 0.9098039, 1, 1,
0.01094737, 0.8549076, 0.1813464, 0, 0.9058824, 1, 1,
0.01424236, -0.5953267, 4.653725, 0, 0.8980392, 1, 1,
0.01437537, 0.4093178, 0.9925845, 0, 0.8901961, 1, 1,
0.01471913, 2.120221, 0.7195848, 0, 0.8862745, 1, 1,
0.01477836, -0.446126, 2.924155, 0, 0.8784314, 1, 1,
0.01571909, -0.9919269, 3.598577, 0, 0.8745098, 1, 1,
0.02744516, -0.1068961, 3.321107, 0, 0.8666667, 1, 1,
0.03148657, 0.6609882, 0.03059746, 0, 0.8627451, 1, 1,
0.0359476, -0.3893634, 4.423009, 0, 0.854902, 1, 1,
0.03637417, -0.3706886, 1.799719, 0, 0.8509804, 1, 1,
0.03829298, 0.8327481, 0.1143694, 0, 0.8431373, 1, 1,
0.03963596, 2.707363, 0.0705286, 0, 0.8392157, 1, 1,
0.03992749, 0.7506905, 1.73324, 0, 0.8313726, 1, 1,
0.04028573, -0.6291288, 4.444255, 0, 0.827451, 1, 1,
0.04234955, -0.3657895, 2.410618, 0, 0.8196079, 1, 1,
0.0451108, -0.002121715, 4.315317, 0, 0.8156863, 1, 1,
0.04575846, 0.1793824, 2.492858, 0, 0.8078431, 1, 1,
0.04628478, -0.6737984, 4.958857, 0, 0.8039216, 1, 1,
0.04704498, -0.01378382, 2.133866, 0, 0.7960784, 1, 1,
0.04962033, -1.360559, 2.386269, 0, 0.7882353, 1, 1,
0.05223905, 0.910458, 0.6264444, 0, 0.7843137, 1, 1,
0.05264911, -0.4530725, 3.877958, 0, 0.7764706, 1, 1,
0.05806803, -0.144587, 3.543275, 0, 0.772549, 1, 1,
0.05829328, -0.07970946, 1.861163, 0, 0.7647059, 1, 1,
0.05860762, -1.221249, 1.445387, 0, 0.7607843, 1, 1,
0.05876701, -0.1002031, 1.668175, 0, 0.7529412, 1, 1,
0.05923241, -0.4406114, 2.236379, 0, 0.7490196, 1, 1,
0.05989898, -0.555195, 2.356924, 0, 0.7411765, 1, 1,
0.06530645, -0.6201001, 2.915065, 0, 0.7372549, 1, 1,
0.06763131, -1.569607, 3.719572, 0, 0.7294118, 1, 1,
0.07183713, -0.3905605, 3.812441, 0, 0.7254902, 1, 1,
0.0726222, 0.4637936, 0.3725062, 0, 0.7176471, 1, 1,
0.07515052, 0.06960316, 0.4766957, 0, 0.7137255, 1, 1,
0.07592146, 0.03792598, 1.280743, 0, 0.7058824, 1, 1,
0.07627236, -1.58737, 1.71097, 0, 0.6980392, 1, 1,
0.08078533, 0.1555708, -0.653759, 0, 0.6941177, 1, 1,
0.08129254, -1.306275, 2.070546, 0, 0.6862745, 1, 1,
0.08313324, -1.649414, 3.408704, 0, 0.682353, 1, 1,
0.08463179, 1.081631, -0.5617371, 0, 0.6745098, 1, 1,
0.08472724, -0.5787974, 3.404028, 0, 0.6705883, 1, 1,
0.08996862, 0.1771493, -0.4260564, 0, 0.6627451, 1, 1,
0.09105127, 0.3869094, -0.3974575, 0, 0.6588235, 1, 1,
0.09136747, -0.8925878, 3.140677, 0, 0.6509804, 1, 1,
0.09238261, -0.7485607, 2.059555, 0, 0.6470588, 1, 1,
0.1038825, -0.04994051, 2.864865, 0, 0.6392157, 1, 1,
0.1073655, 0.38141, 0.7575466, 0, 0.6352941, 1, 1,
0.1127711, 1.120361, -0.8171487, 0, 0.627451, 1, 1,
0.1130738, 0.4526496, -0.3201453, 0, 0.6235294, 1, 1,
0.1143456, -0.2204061, 2.746106, 0, 0.6156863, 1, 1,
0.1199309, -0.1725172, 2.669074, 0, 0.6117647, 1, 1,
0.120567, -0.2708673, 5.873471, 0, 0.6039216, 1, 1,
0.1219163, -1.401447, 1.80592, 0, 0.5960785, 1, 1,
0.1225978, 2.323363, 1.618457, 0, 0.5921569, 1, 1,
0.1236342, 0.4509374, 1.795899, 0, 0.5843138, 1, 1,
0.1259046, 1.156784, -0.2039411, 0, 0.5803922, 1, 1,
0.1276026, 0.67077, 0.5801871, 0, 0.572549, 1, 1,
0.1293926, 0.6610652, 0.4103753, 0, 0.5686275, 1, 1,
0.1311832, -2.463414, 2.737717, 0, 0.5607843, 1, 1,
0.1312323, -0.2864585, 1.52077, 0, 0.5568628, 1, 1,
0.1312458, 1.609679, 0.6459807, 0, 0.5490196, 1, 1,
0.1314002, 0.2400952, -0.7308087, 0, 0.5450981, 1, 1,
0.1317266, 0.4046273, 2.105752, 0, 0.5372549, 1, 1,
0.1333163, 1.286416, 0.1548384, 0, 0.5333334, 1, 1,
0.1336864, 0.2150797, 2.475054, 0, 0.5254902, 1, 1,
0.1375417, 0.1339939, 1.246453, 0, 0.5215687, 1, 1,
0.1386062, -0.4541624, 2.739567, 0, 0.5137255, 1, 1,
0.1493712, 0.3169125, -0.759055, 0, 0.509804, 1, 1,
0.1509072, -2.089649, 1.172767, 0, 0.5019608, 1, 1,
0.1595104, -0.1081056, 1.455336, 0, 0.4941176, 1, 1,
0.1613059, 0.1887669, 0.8772908, 0, 0.4901961, 1, 1,
0.1616344, -0.7307346, 2.803126, 0, 0.4823529, 1, 1,
0.1637653, -0.5853914, 3.012636, 0, 0.4784314, 1, 1,
0.1692065, 2.831909, -0.1722188, 0, 0.4705882, 1, 1,
0.174703, -0.1061377, 0.2756742, 0, 0.4666667, 1, 1,
0.1782369, 2.20098, -1.21618, 0, 0.4588235, 1, 1,
0.1808925, -2.228337, 3.894093, 0, 0.454902, 1, 1,
0.182222, -1.145923, 1.070167, 0, 0.4470588, 1, 1,
0.1836459, 0.6591924, -0.8577031, 0, 0.4431373, 1, 1,
0.1842583, -0.2808278, 2.227327, 0, 0.4352941, 1, 1,
0.1846516, -0.5207, 1.676822, 0, 0.4313726, 1, 1,
0.1927821, -1.75197, 3.226708, 0, 0.4235294, 1, 1,
0.1960523, 0.8429821, -1.033709, 0, 0.4196078, 1, 1,
0.1967272, -1.212998, 2.942122, 0, 0.4117647, 1, 1,
0.1973513, -0.5684878, 1.158631, 0, 0.4078431, 1, 1,
0.1990471, -0.2404092, 1.399068, 0, 0.4, 1, 1,
0.2059805, -0.2988571, 0.4529111, 0, 0.3921569, 1, 1,
0.2066677, -1.720198, 4.856979, 0, 0.3882353, 1, 1,
0.207258, 0.834664, -0.06060958, 0, 0.3803922, 1, 1,
0.2089404, -0.9150881, 1.122456, 0, 0.3764706, 1, 1,
0.2094011, 0.7029117, -2.179671, 0, 0.3686275, 1, 1,
0.2094944, -1.350857, 2.086001, 0, 0.3647059, 1, 1,
0.2102165, -0.4542052, 2.155549, 0, 0.3568628, 1, 1,
0.2151626, -0.7249845, 2.349556, 0, 0.3529412, 1, 1,
0.2162054, 1.280622, 1.136916, 0, 0.345098, 1, 1,
0.2189683, -1.282061, 3.930079, 0, 0.3411765, 1, 1,
0.2197423, -0.07614438, 1.608726, 0, 0.3333333, 1, 1,
0.2229725, 1.55559, -0.741393, 0, 0.3294118, 1, 1,
0.226167, 0.3429063, -1.709466, 0, 0.3215686, 1, 1,
0.2283765, 0.2596791, 1.20765, 0, 0.3176471, 1, 1,
0.2291594, 1.062567, 0.7122074, 0, 0.3098039, 1, 1,
0.2307455, 0.5285085, 0.4824636, 0, 0.3058824, 1, 1,
0.2307927, -0.5826226, 4.464685, 0, 0.2980392, 1, 1,
0.2322873, 0.3408335, 2.323833, 0, 0.2901961, 1, 1,
0.237545, 0.07151411, 2.945659, 0, 0.2862745, 1, 1,
0.2433898, 0.06174488, 2.022914, 0, 0.2784314, 1, 1,
0.2465862, -0.9850848, 2.250668, 0, 0.2745098, 1, 1,
0.2483179, -0.09270688, 2.810896, 0, 0.2666667, 1, 1,
0.2500997, 1.1152, -0.3768395, 0, 0.2627451, 1, 1,
0.2541271, -0.2721547, 2.852424, 0, 0.254902, 1, 1,
0.255082, 1.375629, 1.686566, 0, 0.2509804, 1, 1,
0.2584544, -1.466136, 5.468513, 0, 0.2431373, 1, 1,
0.2587279, 0.4326416, -0.1871227, 0, 0.2392157, 1, 1,
0.2591506, -0.7212606, 2.282551, 0, 0.2313726, 1, 1,
0.2661664, -0.09922232, 2.042091, 0, 0.227451, 1, 1,
0.26996, 0.5469818, 0.8816789, 0, 0.2196078, 1, 1,
0.2734454, -0.5215637, 2.294517, 0, 0.2156863, 1, 1,
0.2781972, -0.6766021, 1.601683, 0, 0.2078431, 1, 1,
0.2938283, -1.194906, 1.783963, 0, 0.2039216, 1, 1,
0.2979511, 0.0958281, 2.05284, 0, 0.1960784, 1, 1,
0.2999488, 0.2691661, 0.7102624, 0, 0.1882353, 1, 1,
0.3039875, 1.031368, -0.06079465, 0, 0.1843137, 1, 1,
0.3093444, -0.5586519, 2.14188, 0, 0.1764706, 1, 1,
0.3097562, 2.250293, 0.8871885, 0, 0.172549, 1, 1,
0.310029, -1.243905, 2.863716, 0, 0.1647059, 1, 1,
0.3111137, 1.076307, 0.4459629, 0, 0.1607843, 1, 1,
0.3195095, 1.71205, 0.04039644, 0, 0.1529412, 1, 1,
0.3223042, -0.07387934, 3.30201, 0, 0.1490196, 1, 1,
0.3233379, 0.2255377, -0.5253905, 0, 0.1411765, 1, 1,
0.3314435, 0.7594571, 1.760234, 0, 0.1372549, 1, 1,
0.3316274, -1.799957, 2.389573, 0, 0.1294118, 1, 1,
0.3340553, 1.80627, -0.6247413, 0, 0.1254902, 1, 1,
0.3348882, -0.42556, 1.047199, 0, 0.1176471, 1, 1,
0.3361109, 1.557927, 0.3170921, 0, 0.1137255, 1, 1,
0.3386518, 1.202286, 0.5737044, 0, 0.1058824, 1, 1,
0.339058, 0.2644133, -0.2929975, 0, 0.09803922, 1, 1,
0.3393606, 0.6312742, 0.07037221, 0, 0.09411765, 1, 1,
0.3426745, 1.395634, -0.6856787, 0, 0.08627451, 1, 1,
0.348071, -0.2871587, 1.502645, 0, 0.08235294, 1, 1,
0.3485923, 1.492316, 1.471905, 0, 0.07450981, 1, 1,
0.3498676, 0.3294362, 1.264575, 0, 0.07058824, 1, 1,
0.3500033, 0.9697981, -1.079298, 0, 0.0627451, 1, 1,
0.3509571, -2.4381, 4.309505, 0, 0.05882353, 1, 1,
0.353144, 1.922529, -0.2308932, 0, 0.05098039, 1, 1,
0.3533426, -0.2162522, 0.8763148, 0, 0.04705882, 1, 1,
0.3575987, -0.5981777, 3.041399, 0, 0.03921569, 1, 1,
0.361008, -1.897906, 2.947131, 0, 0.03529412, 1, 1,
0.3616128, -0.1511598, 2.703173, 0, 0.02745098, 1, 1,
0.3639967, -1.331752, 3.296409, 0, 0.02352941, 1, 1,
0.3672324, -1.104877, 3.73598, 0, 0.01568628, 1, 1,
0.3682714, 1.211184, 1.389916, 0, 0.01176471, 1, 1,
0.3684033, 1.532899, -2.698142, 0, 0.003921569, 1, 1,
0.3730547, 0.6944274, 1.791015, 0.003921569, 0, 1, 1,
0.375033, -0.0930557, 1.756145, 0.007843138, 0, 1, 1,
0.3762105, -2.442053, 4.529533, 0.01568628, 0, 1, 1,
0.377146, 0.6145452, 0.4842244, 0.01960784, 0, 1, 1,
0.3813079, -0.3141876, 4.096586, 0.02745098, 0, 1, 1,
0.3829345, -1.143494, 3.065564, 0.03137255, 0, 1, 1,
0.3864937, -0.2300127, 2.097561, 0.03921569, 0, 1, 1,
0.3868841, 1.917366, 0.7050101, 0.04313726, 0, 1, 1,
0.3901587, -2.067633, 2.684054, 0.05098039, 0, 1, 1,
0.390644, -0.2857911, 3.177302, 0.05490196, 0, 1, 1,
0.3962799, -0.04350667, 3.188095, 0.0627451, 0, 1, 1,
0.396298, -0.6940705, 3.37235, 0.06666667, 0, 1, 1,
0.4061817, 1.632379, -0.9704413, 0.07450981, 0, 1, 1,
0.407276, 0.2294663, 0.5508999, 0.07843138, 0, 1, 1,
0.4079783, -0.9656647, 3.32037, 0.08627451, 0, 1, 1,
0.4084844, 0.1342552, 0.9055999, 0.09019608, 0, 1, 1,
0.412911, -1.047251, 2.55399, 0.09803922, 0, 1, 1,
0.4196803, -1.080025, 0.9477209, 0.1058824, 0, 1, 1,
0.4203009, 0.8236947, 1.968074, 0.1098039, 0, 1, 1,
0.4210573, -0.4273002, 3.191421, 0.1176471, 0, 1, 1,
0.4210868, -1.267755, 3.365918, 0.1215686, 0, 1, 1,
0.4233059, 0.005375023, 2.856232, 0.1294118, 0, 1, 1,
0.4248402, -1.594474, 5.169093, 0.1333333, 0, 1, 1,
0.4268706, 1.32517, 0.4276102, 0.1411765, 0, 1, 1,
0.4346359, 0.4891885, 1.283407, 0.145098, 0, 1, 1,
0.4398907, -0.2112963, 1.391136, 0.1529412, 0, 1, 1,
0.4405148, -1.647392, 3.079278, 0.1568628, 0, 1, 1,
0.441016, -2.443925, 1.751602, 0.1647059, 0, 1, 1,
0.442645, -0.7605144, 2.298583, 0.1686275, 0, 1, 1,
0.443538, -0.5692534, 2.598722, 0.1764706, 0, 1, 1,
0.4443464, -1.264632, 1.944796, 0.1803922, 0, 1, 1,
0.4553861, -1.486911, 1.882103, 0.1882353, 0, 1, 1,
0.456402, 0.6494528, 1.632181, 0.1921569, 0, 1, 1,
0.4564909, 0.3415994, 1.011124, 0.2, 0, 1, 1,
0.4585307, 0.8355243, -0.4038293, 0.2078431, 0, 1, 1,
0.4589413, 0.1048328, 0.7420133, 0.2117647, 0, 1, 1,
0.4621139, -0.5937731, 0.3212912, 0.2196078, 0, 1, 1,
0.4632365, 0.616715, 0.7013208, 0.2235294, 0, 1, 1,
0.4640447, 0.1378739, -0.5344682, 0.2313726, 0, 1, 1,
0.466785, 2.641472, -0.1894135, 0.2352941, 0, 1, 1,
0.4677944, -0.6441069, 3.716886, 0.2431373, 0, 1, 1,
0.4701641, -1.433797, 3.984885, 0.2470588, 0, 1, 1,
0.471389, 0.4518699, 0.6654333, 0.254902, 0, 1, 1,
0.4742566, -1.266237, 1.841884, 0.2588235, 0, 1, 1,
0.4754519, -0.5342466, 1.18973, 0.2666667, 0, 1, 1,
0.4761529, 0.924054, -0.36772, 0.2705882, 0, 1, 1,
0.4774569, -1.799247, 3.389576, 0.2784314, 0, 1, 1,
0.4777301, 1.144456, -0.5837695, 0.282353, 0, 1, 1,
0.4782331, 0.4175501, 1.046318, 0.2901961, 0, 1, 1,
0.4796071, -0.07149827, 1.77923, 0.2941177, 0, 1, 1,
0.4813678, -2.192528, 2.050958, 0.3019608, 0, 1, 1,
0.4829008, -0.02073823, 1.614119, 0.3098039, 0, 1, 1,
0.4863806, 0.1935764, -0.6357595, 0.3137255, 0, 1, 1,
0.4888471, 0.04270906, -0.151311, 0.3215686, 0, 1, 1,
0.4899617, 1.173392, 1.133535, 0.3254902, 0, 1, 1,
0.4903544, 0.899091, 0.9615166, 0.3333333, 0, 1, 1,
0.4906443, -1.034353, 3.038744, 0.3372549, 0, 1, 1,
0.4911889, 0.04766163, 0.6525109, 0.345098, 0, 1, 1,
0.4920057, -0.1427689, 1.709621, 0.3490196, 0, 1, 1,
0.492526, 1.142542, 0.4425134, 0.3568628, 0, 1, 1,
0.4936842, -0.5520085, 1.770834, 0.3607843, 0, 1, 1,
0.5032426, -0.1353472, 0.7308568, 0.3686275, 0, 1, 1,
0.5038593, -0.08158244, 3.170499, 0.372549, 0, 1, 1,
0.5047235, 0.9612334, 1.970235, 0.3803922, 0, 1, 1,
0.5071859, 2.515742, -0.2096615, 0.3843137, 0, 1, 1,
0.5075913, 0.542188, 2.069055, 0.3921569, 0, 1, 1,
0.5095513, 1.669185, -1.984337, 0.3960784, 0, 1, 1,
0.5098485, -1.175578, 3.604479, 0.4039216, 0, 1, 1,
0.5156125, 2.239034, 1.390949, 0.4117647, 0, 1, 1,
0.5253907, 1.144499, -0.03322073, 0.4156863, 0, 1, 1,
0.5314611, -0.2741286, 2.623868, 0.4235294, 0, 1, 1,
0.5455586, -0.1584119, -0.3501941, 0.427451, 0, 1, 1,
0.5465983, 0.8250276, 0.6043584, 0.4352941, 0, 1, 1,
0.5500148, 0.2355468, 1.709459, 0.4392157, 0, 1, 1,
0.5505704, 0.2417514, 1.498357, 0.4470588, 0, 1, 1,
0.5515845, 0.868458, 1.312517, 0.4509804, 0, 1, 1,
0.553142, -0.5669646, 3.4918, 0.4588235, 0, 1, 1,
0.5575086, -0.3426377, 2.643785, 0.4627451, 0, 1, 1,
0.5580678, 1.781367, 0.2305902, 0.4705882, 0, 1, 1,
0.5597304, 0.2678187, 2.020481, 0.4745098, 0, 1, 1,
0.5610541, 0.5574976, 0.9825844, 0.4823529, 0, 1, 1,
0.5611525, -1.251642, 2.352314, 0.4862745, 0, 1, 1,
0.5614322, -0.4146584, 2.903251, 0.4941176, 0, 1, 1,
0.5682501, 0.5276739, 0.5078398, 0.5019608, 0, 1, 1,
0.5683222, -0.8936225, 3.199695, 0.5058824, 0, 1, 1,
0.5715217, 0.5362015, 0.3938048, 0.5137255, 0, 1, 1,
0.5732109, 2.638533, 0.9588989, 0.5176471, 0, 1, 1,
0.5769557, 1.822442, 1.14113, 0.5254902, 0, 1, 1,
0.5774109, 0.4547278, 2.566815, 0.5294118, 0, 1, 1,
0.5807123, -2.254135, 2.384977, 0.5372549, 0, 1, 1,
0.5857018, 1.58423, 0.5526844, 0.5411765, 0, 1, 1,
0.5869921, 0.265278, 2.480797, 0.5490196, 0, 1, 1,
0.5906271, 0.02243921, 2.017093, 0.5529412, 0, 1, 1,
0.59319, 1.033937, 2.596852, 0.5607843, 0, 1, 1,
0.5970437, -0.4886141, 1.068231, 0.5647059, 0, 1, 1,
0.6008068, 0.4826621, 0.8320649, 0.572549, 0, 1, 1,
0.6040708, 0.6042208, 0.9038416, 0.5764706, 0, 1, 1,
0.6059741, 1.398543, 0.8580213, 0.5843138, 0, 1, 1,
0.6077586, 0.7480971, 0.3396005, 0.5882353, 0, 1, 1,
0.6081799, 2.214402, 1.735834, 0.5960785, 0, 1, 1,
0.6101009, -1.771154, 2.539276, 0.6039216, 0, 1, 1,
0.6175073, -1.02592, 3.188874, 0.6078432, 0, 1, 1,
0.6181551, 0.4383577, 1.027117, 0.6156863, 0, 1, 1,
0.6195179, 1.423472, 2.348484, 0.6196079, 0, 1, 1,
0.6215022, -1.787873, 3.009525, 0.627451, 0, 1, 1,
0.6217892, -0.8886779, 2.602412, 0.6313726, 0, 1, 1,
0.6250165, -0.7558315, 2.760995, 0.6392157, 0, 1, 1,
0.6268561, 1.024103, -0.4117568, 0.6431373, 0, 1, 1,
0.6366042, 0.3126419, 1.082834, 0.6509804, 0, 1, 1,
0.655552, 1.440688, -0.04200782, 0.654902, 0, 1, 1,
0.6573814, -0.7255802, 0.9648913, 0.6627451, 0, 1, 1,
0.6580077, -1.072677, 3.00534, 0.6666667, 0, 1, 1,
0.663697, -0.7452191, 4.028277, 0.6745098, 0, 1, 1,
0.6657399, 0.5904133, 0.1942718, 0.6784314, 0, 1, 1,
0.6670538, 1.26352, 3.461236, 0.6862745, 0, 1, 1,
0.6724672, 0.1159342, 1.175126, 0.6901961, 0, 1, 1,
0.6727681, 0.1741326, 1.540345, 0.6980392, 0, 1, 1,
0.7044498, -1.050871, 1.672156, 0.7058824, 0, 1, 1,
0.710733, -0.6067001, 4.538799, 0.7098039, 0, 1, 1,
0.7116097, 0.5363383, 1.186757, 0.7176471, 0, 1, 1,
0.7119088, -0.9222219, 2.383462, 0.7215686, 0, 1, 1,
0.714469, -0.6420407, 3.548298, 0.7294118, 0, 1, 1,
0.7166457, -0.0445973, 1.679056, 0.7333333, 0, 1, 1,
0.7167732, 0.0863874, 0.6265874, 0.7411765, 0, 1, 1,
0.7211658, 1.223658, 1.384581, 0.7450981, 0, 1, 1,
0.7225325, -0.6545005, 1.733857, 0.7529412, 0, 1, 1,
0.7244229, 0.5735149, 0.8587483, 0.7568628, 0, 1, 1,
0.7289709, -1.212296, 2.760131, 0.7647059, 0, 1, 1,
0.7329448, 0.7592209, 0.611753, 0.7686275, 0, 1, 1,
0.7355179, 0.4513816, 0.9714746, 0.7764706, 0, 1, 1,
0.7357643, -0.6844193, 2.78384, 0.7803922, 0, 1, 1,
0.7373973, 1.41879, 1.529773, 0.7882353, 0, 1, 1,
0.7409877, 0.008370715, 1.483378, 0.7921569, 0, 1, 1,
0.7420839, 0.4703733, -0.4222099, 0.8, 0, 1, 1,
0.7438108, 0.4706481, 1.780403, 0.8078431, 0, 1, 1,
0.7445779, 0.9664006, 2.098194, 0.8117647, 0, 1, 1,
0.7490109, -1.847627, 4.863899, 0.8196079, 0, 1, 1,
0.7492306, -0.1085854, 2.76579, 0.8235294, 0, 1, 1,
0.755785, 1.219486, 0.2774534, 0.8313726, 0, 1, 1,
0.7563508, 0.002415543, 1.753516, 0.8352941, 0, 1, 1,
0.7570788, 0.8720453, 0.07262842, 0.8431373, 0, 1, 1,
0.757087, -1.827691, 3.077724, 0.8470588, 0, 1, 1,
0.7579244, -0.9111277, 3.783823, 0.854902, 0, 1, 1,
0.7592552, -0.5180697, 2.867076, 0.8588235, 0, 1, 1,
0.7600132, -0.3967479, 2.339155, 0.8666667, 0, 1, 1,
0.7602879, 0.4160919, -1.081852, 0.8705882, 0, 1, 1,
0.7650303, -1.300115, 1.554608, 0.8784314, 0, 1, 1,
0.7650405, 0.9229688, 0.6166708, 0.8823529, 0, 1, 1,
0.765125, 0.04536851, 1.377862, 0.8901961, 0, 1, 1,
0.7652491, -1.200728, 2.120035, 0.8941177, 0, 1, 1,
0.7714902, -1.219229, 1.865312, 0.9019608, 0, 1, 1,
0.7756866, -0.1892319, 2.025943, 0.9098039, 0, 1, 1,
0.7773353, 0.2194359, 0.1296342, 0.9137255, 0, 1, 1,
0.7790837, -0.1411329, 4.304554, 0.9215686, 0, 1, 1,
0.783287, 1.371433, 2.95027, 0.9254902, 0, 1, 1,
0.7859007, -0.6864224, 0.9132088, 0.9333333, 0, 1, 1,
0.7925801, 0.200041, 0.8757904, 0.9372549, 0, 1, 1,
0.8034446, 0.2943738, 0.07595729, 0.945098, 0, 1, 1,
0.8051665, 1.160678, 1.332167, 0.9490196, 0, 1, 1,
0.8061789, 0.2108202, 0.3599055, 0.9568627, 0, 1, 1,
0.8064008, 0.2594497, 0.9414157, 0.9607843, 0, 1, 1,
0.806486, 2.037442, 0.4237705, 0.9686275, 0, 1, 1,
0.806577, 0.7406476, 1.537537, 0.972549, 0, 1, 1,
0.8116413, 0.7337784, 0.8894576, 0.9803922, 0, 1, 1,
0.8119, 0.4124021, 1.046319, 0.9843137, 0, 1, 1,
0.8148432, -0.1775964, 1.131717, 0.9921569, 0, 1, 1,
0.8182508, -0.7393199, 1.484867, 0.9960784, 0, 1, 1,
0.8206216, 0.01431688, 1.74204, 1, 0, 0.9960784, 1,
0.8281882, -1.743153, 2.336725, 1, 0, 0.9882353, 1,
0.8284106, -0.5081207, 0.691269, 1, 0, 0.9843137, 1,
0.833487, 2.30569, 0.08444401, 1, 0, 0.9764706, 1,
0.8346397, -0.9287151, 2.867537, 1, 0, 0.972549, 1,
0.8357462, -0.4182799, 0.9871915, 1, 0, 0.9647059, 1,
0.8364543, 1.636081, 0.8111492, 1, 0, 0.9607843, 1,
0.837774, -0.8149678, -0.3252404, 1, 0, 0.9529412, 1,
0.8486336, 0.03031321, 1.016166, 1, 0, 0.9490196, 1,
0.8546684, -1.263858, 3.525024, 1, 0, 0.9411765, 1,
0.8594891, -0.9656404, 1.764303, 1, 0, 0.9372549, 1,
0.8651304, 1.36927, 0.09891352, 1, 0, 0.9294118, 1,
0.869288, -0.112043, 1.027611, 1, 0, 0.9254902, 1,
0.8718329, -1.651254, 2.399775, 1, 0, 0.9176471, 1,
0.8840304, -0.0469412, 2.276398, 1, 0, 0.9137255, 1,
0.8868735, -0.1765831, 2.461674, 1, 0, 0.9058824, 1,
0.8895187, 0.2666784, 2.010316, 1, 0, 0.9019608, 1,
0.8944443, 1.788031, -1.277548, 1, 0, 0.8941177, 1,
0.894906, -1.255097, 3.964714, 1, 0, 0.8862745, 1,
0.8996826, 0.9121667, 0.2816854, 1, 0, 0.8823529, 1,
0.9073482, -1.131493, 2.074321, 1, 0, 0.8745098, 1,
0.9099721, -1.50883, 2.415421, 1, 0, 0.8705882, 1,
0.9230288, -1.104802, 1.424068, 1, 0, 0.8627451, 1,
0.9263562, 1.198928, 0.356373, 1, 0, 0.8588235, 1,
0.9281532, -0.7165884, 3.059034, 1, 0, 0.8509804, 1,
0.9369987, -1.237652, 4.53541, 1, 0, 0.8470588, 1,
0.9396771, 0.1090989, -0.8927632, 1, 0, 0.8392157, 1,
0.9411622, 1.190499, 0.4640411, 1, 0, 0.8352941, 1,
0.944872, -0.1044258, 1.530307, 1, 0, 0.827451, 1,
0.9500336, 0.5671114, 1.348479, 1, 0, 0.8235294, 1,
0.9505259, 0.9850729, 0.6242972, 1, 0, 0.8156863, 1,
0.9661736, -0.2170402, 1.258169, 1, 0, 0.8117647, 1,
0.9669001, -0.4521455, 2.325124, 1, 0, 0.8039216, 1,
0.9674336, 0.3093021, -0.2537266, 1, 0, 0.7960784, 1,
0.9711888, -0.3169926, 1.101859, 1, 0, 0.7921569, 1,
0.9898551, 1.070184, -0.4264794, 1, 0, 0.7843137, 1,
0.9912214, 0.03897047, 2.272589, 1, 0, 0.7803922, 1,
0.9926632, -0.2028309, 2.186253, 1, 0, 0.772549, 1,
1.01109, -0.3971055, 1.681378, 1, 0, 0.7686275, 1,
1.012557, 1.229853, 0.547958, 1, 0, 0.7607843, 1,
1.013396, 2.323505, 0.5623755, 1, 0, 0.7568628, 1,
1.023159, 0.1080118, 2.321113, 1, 0, 0.7490196, 1,
1.023267, 0.01288802, 2.720267, 1, 0, 0.7450981, 1,
1.060449, 0.006509486, 2.40293, 1, 0, 0.7372549, 1,
1.068637, 0.6495617, 1.158141, 1, 0, 0.7333333, 1,
1.070614, -0.5481799, 1.314049, 1, 0, 0.7254902, 1,
1.079418, -0.8165402, 4.140971, 1, 0, 0.7215686, 1,
1.08277, 0.2500942, 0.1796151, 1, 0, 0.7137255, 1,
1.099292, 1.163106, 1.364671, 1, 0, 0.7098039, 1,
1.102451, 0.3072319, 2.456791, 1, 0, 0.7019608, 1,
1.106016, -0.3364496, 1.307057, 1, 0, 0.6941177, 1,
1.113781, -0.4888139, 2.361921, 1, 0, 0.6901961, 1,
1.114783, 2.101369, 1.834102, 1, 0, 0.682353, 1,
1.128535, 2.513287, 0.5942661, 1, 0, 0.6784314, 1,
1.139786, 1.264706, -0.417474, 1, 0, 0.6705883, 1,
1.144982, 1.611125, 0.174467, 1, 0, 0.6666667, 1,
1.150008, -1.940517, 1.402429, 1, 0, 0.6588235, 1,
1.159888, -0.3705408, 1.225495, 1, 0, 0.654902, 1,
1.172184, -1.169547, 2.631868, 1, 0, 0.6470588, 1,
1.200916, -1.053715, 2.850838, 1, 0, 0.6431373, 1,
1.21002, -0.6926636, 3.350914, 1, 0, 0.6352941, 1,
1.212413, -0.6040215, 1.233706, 1, 0, 0.6313726, 1,
1.231778, -1.163384, 4.175792, 1, 0, 0.6235294, 1,
1.247665, -0.216577, 1.707329, 1, 0, 0.6196079, 1,
1.248778, 1.299673, 0.2488221, 1, 0, 0.6117647, 1,
1.254801, 1.533982, -4.109828, 1, 0, 0.6078432, 1,
1.256513, 0.499724, 1.766673, 1, 0, 0.6, 1,
1.25988, -0.1742765, 1.795512, 1, 0, 0.5921569, 1,
1.262527, -0.9021494, 0.6387262, 1, 0, 0.5882353, 1,
1.263424, 0.5742179, 0.2290375, 1, 0, 0.5803922, 1,
1.265245, 0.322354, 1.577374, 1, 0, 0.5764706, 1,
1.268431, 0.4588934, 2.175789, 1, 0, 0.5686275, 1,
1.268877, 0.4004673, 0.5019491, 1, 0, 0.5647059, 1,
1.27015, -0.5262396, 1.185229, 1, 0, 0.5568628, 1,
1.278983, 0.4627459, 0.8781877, 1, 0, 0.5529412, 1,
1.279158, 0.1334071, 1.175268, 1, 0, 0.5450981, 1,
1.296171, -1.131437, 1.731769, 1, 0, 0.5411765, 1,
1.298869, -0.03043058, -0.9992157, 1, 0, 0.5333334, 1,
1.307355, -1.528416, 2.971387, 1, 0, 0.5294118, 1,
1.329146, 0.05037866, 1.502935, 1, 0, 0.5215687, 1,
1.333211, -1.251153, 3.086124, 1, 0, 0.5176471, 1,
1.337292, 1.981112, 0.01998801, 1, 0, 0.509804, 1,
1.343605, -0.4074626, 0.6361009, 1, 0, 0.5058824, 1,
1.356453, 0.5467338, 1.726214, 1, 0, 0.4980392, 1,
1.361351, 0.01203799, -0.21714, 1, 0, 0.4901961, 1,
1.389994, 0.1618443, 1.176994, 1, 0, 0.4862745, 1,
1.390173, 1.035717, 0.1432178, 1, 0, 0.4784314, 1,
1.397996, 0.6527811, 1.56248, 1, 0, 0.4745098, 1,
1.398524, 0.7918777, 1.534828, 1, 0, 0.4666667, 1,
1.413648, 0.8537995, 1.918862, 1, 0, 0.4627451, 1,
1.421076, -0.3024789, 1.998225, 1, 0, 0.454902, 1,
1.469035, 0.4952941, 1.700171, 1, 0, 0.4509804, 1,
1.473177, -0.3164457, 1.753155, 1, 0, 0.4431373, 1,
1.473409, -1.310468, 1.649919, 1, 0, 0.4392157, 1,
1.484112, -0.3809014, 1.790994, 1, 0, 0.4313726, 1,
1.485335, -0.1791077, 0.1093033, 1, 0, 0.427451, 1,
1.504369, -1.298321, 2.139704, 1, 0, 0.4196078, 1,
1.516351, -0.7799662, 2.81888, 1, 0, 0.4156863, 1,
1.519953, 0.5143108, 0.8926755, 1, 0, 0.4078431, 1,
1.527901, 0.04608365, 1.310306, 1, 0, 0.4039216, 1,
1.533759, 0.3803177, 1.928157, 1, 0, 0.3960784, 1,
1.538489, -1.766752, 1.924557, 1, 0, 0.3882353, 1,
1.542821, -0.6099681, 2.57873, 1, 0, 0.3843137, 1,
1.561285, 1.390179, 0.4150049, 1, 0, 0.3764706, 1,
1.56434, -0.6964268, 2.498505, 1, 0, 0.372549, 1,
1.575783, 0.3123055, 1.444347, 1, 0, 0.3647059, 1,
1.594029, 0.6996022, 0.3652825, 1, 0, 0.3607843, 1,
1.596993, 1.402699, 3.040627, 1, 0, 0.3529412, 1,
1.597884, 0.6672543, 1.412105, 1, 0, 0.3490196, 1,
1.609734, -0.1094242, 2.866261, 1, 0, 0.3411765, 1,
1.615963, -0.2829867, 1.7477, 1, 0, 0.3372549, 1,
1.61816, 0.1893593, 1.756368, 1, 0, 0.3294118, 1,
1.623279, 2.015797, 1.78382, 1, 0, 0.3254902, 1,
1.629059, -0.7469625, 2.009187, 1, 0, 0.3176471, 1,
1.634483, -0.3859838, 1.630005, 1, 0, 0.3137255, 1,
1.652021, 0.2410674, 1.960516, 1, 0, 0.3058824, 1,
1.660517, -0.9548138, 3.867257, 1, 0, 0.2980392, 1,
1.672622, -0.1284074, 1.024977, 1, 0, 0.2941177, 1,
1.679524, -1.295318, 2.925467, 1, 0, 0.2862745, 1,
1.684785, 2.093253, -0.001616245, 1, 0, 0.282353, 1,
1.70127, -0.1464597, 0.6018087, 1, 0, 0.2745098, 1,
1.727386, 1.793789, 1.539415, 1, 0, 0.2705882, 1,
1.730954, 0.441576, 1.710579, 1, 0, 0.2627451, 1,
1.75289, -1.020279, 2.238211, 1, 0, 0.2588235, 1,
1.770356, -2.450469, 2.182167, 1, 0, 0.2509804, 1,
1.78832, -1.234397, 0.5270005, 1, 0, 0.2470588, 1,
1.805006, -1.536076, 0.3126639, 1, 0, 0.2392157, 1,
1.842592, 0.4917708, 0.7397159, 1, 0, 0.2352941, 1,
1.842665, -0.3774461, 2.278054, 1, 0, 0.227451, 1,
1.849286, 0.200339, 2.574977, 1, 0, 0.2235294, 1,
1.85316, 1.437208, 0.008528694, 1, 0, 0.2156863, 1,
1.854498, -1.31294, 1.518057, 1, 0, 0.2117647, 1,
1.897664, 1.21139, 1.038716, 1, 0, 0.2039216, 1,
1.904408, 0.7403366, 0.6981258, 1, 0, 0.1960784, 1,
1.911379, -1.117868, 1.479289, 1, 0, 0.1921569, 1,
1.918994, -1.148688, 2.081428, 1, 0, 0.1843137, 1,
1.930054, -0.723393, 2.085268, 1, 0, 0.1803922, 1,
1.952951, 0.3971229, 1.43093, 1, 0, 0.172549, 1,
1.967439, 0.9330562, 1.335542, 1, 0, 0.1686275, 1,
1.973716, -0.3631147, 1.425212, 1, 0, 0.1607843, 1,
1.98465, -1.107992, 2.819006, 1, 0, 0.1568628, 1,
1.997745, -2.586385, 1.428482, 1, 0, 0.1490196, 1,
1.997863, 0.2934447, 1.621551, 1, 0, 0.145098, 1,
2.026102, -0.7664101, 3.01595, 1, 0, 0.1372549, 1,
2.035066, 1.845769, 0.5076781, 1, 0, 0.1333333, 1,
2.046146, 0.006639762, 1.828433, 1, 0, 0.1254902, 1,
2.04801, -0.5883074, 1.839693, 1, 0, 0.1215686, 1,
2.051418, 0.9403409, 1.018592, 1, 0, 0.1137255, 1,
2.064091, 0.5811413, 0.7089962, 1, 0, 0.1098039, 1,
2.109983, -0.3234192, 1.214786, 1, 0, 0.1019608, 1,
2.112759, 0.5886073, -0.8045573, 1, 0, 0.09411765, 1,
2.168281, -0.60312, 2.485038, 1, 0, 0.09019608, 1,
2.205926, -1.379429, 0.2934963, 1, 0, 0.08235294, 1,
2.2343, 0.8865837, 0.1143457, 1, 0, 0.07843138, 1,
2.330796, -1.631104, 3.169425, 1, 0, 0.07058824, 1,
2.367783, -0.8060307, 2.488921, 1, 0, 0.06666667, 1,
2.443605, -0.1578856, 3.081193, 1, 0, 0.05882353, 1,
2.456835, -0.7577883, 2.502257, 1, 0, 0.05490196, 1,
2.486046, -1.692517, 2.571527, 1, 0, 0.04705882, 1,
2.750668, 0.1316845, 1.873199, 1, 0, 0.04313726, 1,
2.814633, -0.4528625, -0.2458404, 1, 0, 0.03529412, 1,
2.989115, 1.511928, -1.219987, 1, 0, 0.03137255, 1,
3.001859, 1.226171, -0.6291615, 1, 0, 0.02352941, 1,
3.19019, 2.633146, 0.5080253, 1, 0, 0.01960784, 1,
3.345031, -0.1123038, 1.080226, 1, 0, 0.01176471, 1,
3.405, -0.6086636, 2.531209, 1, 0, 0.007843138, 1
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
0.1862278, -3.808718, -6.796578, 0, -0.5, 0.5, 0.5,
0.1862278, -3.808718, -6.796578, 1, -0.5, 0.5, 0.5,
0.1862278, -3.808718, -6.796578, 1, 1.5, 0.5, 0.5,
0.1862278, -3.808718, -6.796578, 0, 1.5, 0.5, 0.5
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
-4.123708, -0.007179141, -6.796578, 0, -0.5, 0.5, 0.5,
-4.123708, -0.007179141, -6.796578, 1, -0.5, 0.5, 0.5,
-4.123708, -0.007179141, -6.796578, 1, 1.5, 0.5, 0.5,
-4.123708, -0.007179141, -6.796578, 0, 1.5, 0.5, 0.5
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
-4.123708, -3.808718, 0.4566054, 0, -0.5, 0.5, 0.5,
-4.123708, -3.808718, 0.4566054, 1, -0.5, 0.5, 0.5,
-4.123708, -3.808718, 0.4566054, 1, 1.5, 0.5, 0.5,
-4.123708, -3.808718, 0.4566054, 0, 1.5, 0.5, 0.5
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
-3, -2.93144, -5.122766,
3, -2.93144, -5.122766,
-3, -2.93144, -5.122766,
-3, -3.077653, -5.401735,
-2, -2.93144, -5.122766,
-2, -3.077653, -5.401735,
-1, -2.93144, -5.122766,
-1, -3.077653, -5.401735,
0, -2.93144, -5.122766,
0, -3.077653, -5.401735,
1, -2.93144, -5.122766,
1, -3.077653, -5.401735,
2, -2.93144, -5.122766,
2, -3.077653, -5.401735,
3, -2.93144, -5.122766,
3, -3.077653, -5.401735
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
-3, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
-3, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
-3, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
-3, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5,
-2, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
-2, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
-2, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
-2, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5,
-1, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
-1, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
-1, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
-1, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5,
0, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
0, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
0, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
0, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5,
1, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
1, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
1, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
1, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5,
2, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
2, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
2, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
2, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5,
3, -3.370079, -5.959672, 0, -0.5, 0.5, 0.5,
3, -3.370079, -5.959672, 1, -0.5, 0.5, 0.5,
3, -3.370079, -5.959672, 1, 1.5, 0.5, 0.5,
3, -3.370079, -5.959672, 0, 1.5, 0.5, 0.5
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
-3.129107, -2, -5.122766,
-3.129107, 2, -5.122766,
-3.129107, -2, -5.122766,
-3.294874, -2, -5.401735,
-3.129107, -1, -5.122766,
-3.294874, -1, -5.401735,
-3.129107, 0, -5.122766,
-3.294874, 0, -5.401735,
-3.129107, 1, -5.122766,
-3.294874, 1, -5.401735,
-3.129107, 2, -5.122766,
-3.294874, 2, -5.401735
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
-3.626408, -2, -5.959672, 0, -0.5, 0.5, 0.5,
-3.626408, -2, -5.959672, 1, -0.5, 0.5, 0.5,
-3.626408, -2, -5.959672, 1, 1.5, 0.5, 0.5,
-3.626408, -2, -5.959672, 0, 1.5, 0.5, 0.5,
-3.626408, -1, -5.959672, 0, -0.5, 0.5, 0.5,
-3.626408, -1, -5.959672, 1, -0.5, 0.5, 0.5,
-3.626408, -1, -5.959672, 1, 1.5, 0.5, 0.5,
-3.626408, -1, -5.959672, 0, 1.5, 0.5, 0.5,
-3.626408, 0, -5.959672, 0, -0.5, 0.5, 0.5,
-3.626408, 0, -5.959672, 1, -0.5, 0.5, 0.5,
-3.626408, 0, -5.959672, 1, 1.5, 0.5, 0.5,
-3.626408, 0, -5.959672, 0, 1.5, 0.5, 0.5,
-3.626408, 1, -5.959672, 0, -0.5, 0.5, 0.5,
-3.626408, 1, -5.959672, 1, -0.5, 0.5, 0.5,
-3.626408, 1, -5.959672, 1, 1.5, 0.5, 0.5,
-3.626408, 1, -5.959672, 0, 1.5, 0.5, 0.5,
-3.626408, 2, -5.959672, 0, -0.5, 0.5, 0.5,
-3.626408, 2, -5.959672, 1, -0.5, 0.5, 0.5,
-3.626408, 2, -5.959672, 1, 1.5, 0.5, 0.5,
-3.626408, 2, -5.959672, 0, 1.5, 0.5, 0.5
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
-3.129107, -2.93144, -4,
-3.129107, -2.93144, 4,
-3.129107, -2.93144, -4,
-3.294874, -3.077653, -4,
-3.129107, -2.93144, -2,
-3.294874, -3.077653, -2,
-3.129107, -2.93144, 0,
-3.294874, -3.077653, 0,
-3.129107, -2.93144, 2,
-3.294874, -3.077653, 2,
-3.129107, -2.93144, 4,
-3.294874, -3.077653, 4
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
-3.626408, -3.370079, -4, 0, -0.5, 0.5, 0.5,
-3.626408, -3.370079, -4, 1, -0.5, 0.5, 0.5,
-3.626408, -3.370079, -4, 1, 1.5, 0.5, 0.5,
-3.626408, -3.370079, -4, 0, 1.5, 0.5, 0.5,
-3.626408, -3.370079, -2, 0, -0.5, 0.5, 0.5,
-3.626408, -3.370079, -2, 1, -0.5, 0.5, 0.5,
-3.626408, -3.370079, -2, 1, 1.5, 0.5, 0.5,
-3.626408, -3.370079, -2, 0, 1.5, 0.5, 0.5,
-3.626408, -3.370079, 0, 0, -0.5, 0.5, 0.5,
-3.626408, -3.370079, 0, 1, -0.5, 0.5, 0.5,
-3.626408, -3.370079, 0, 1, 1.5, 0.5, 0.5,
-3.626408, -3.370079, 0, 0, 1.5, 0.5, 0.5,
-3.626408, -3.370079, 2, 0, -0.5, 0.5, 0.5,
-3.626408, -3.370079, 2, 1, -0.5, 0.5, 0.5,
-3.626408, -3.370079, 2, 1, 1.5, 0.5, 0.5,
-3.626408, -3.370079, 2, 0, 1.5, 0.5, 0.5,
-3.626408, -3.370079, 4, 0, -0.5, 0.5, 0.5,
-3.626408, -3.370079, 4, 1, -0.5, 0.5, 0.5,
-3.626408, -3.370079, 4, 1, 1.5, 0.5, 0.5,
-3.626408, -3.370079, 4, 0, 1.5, 0.5, 0.5
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
-3.129107, -2.93144, -5.122766,
-3.129107, 2.917082, -5.122766,
-3.129107, -2.93144, 6.035977,
-3.129107, 2.917082, 6.035977,
-3.129107, -2.93144, -5.122766,
-3.129107, -2.93144, 6.035977,
-3.129107, 2.917082, -5.122766,
-3.129107, 2.917082, 6.035977,
-3.129107, -2.93144, -5.122766,
3.501563, -2.93144, -5.122766,
-3.129107, -2.93144, 6.035977,
3.501563, -2.93144, 6.035977,
-3.129107, 2.917082, -5.122766,
3.501563, 2.917082, -5.122766,
-3.129107, 2.917082, 6.035977,
3.501563, 2.917082, 6.035977,
3.501563, -2.93144, -5.122766,
3.501563, 2.917082, -5.122766,
3.501563, -2.93144, 6.035977,
3.501563, 2.917082, 6.035977,
3.501563, -2.93144, -5.122766,
3.501563, -2.93144, 6.035977,
3.501563, 2.917082, -5.122766,
3.501563, 2.917082, 6.035977
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
var radius = 7.602214;
var distance = 33.82311;
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
mvMatrix.translate( -0.1862278, 0.007179141, -0.4566054 );
mvMatrix.scale( 1.239643, 1.405426, 0.7366118 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.82311);
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
valerate<-read.table("valerate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-valerate$V2
```

```
## Error in eval(expr, envir, enclos): object 'valerate' not found
```

```r
y<-valerate$V3
```

```
## Error in eval(expr, envir, enclos): object 'valerate' not found
```

```r
z<-valerate$V4
```

```
## Error in eval(expr, envir, enclos): object 'valerate' not found
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
-3.032544, -2.214787, -1.372994, 0, 0, 1, 1, 1,
-3.018825, -0.9180306, -2.708616, 1, 0, 0, 1, 1,
-2.925819, 0.2093276, -2.026592, 1, 0, 0, 1, 1,
-2.69491, -1.93112, -0.1421957, 1, 0, 0, 1, 1,
-2.547343, -0.4947731, -2.773727, 1, 0, 0, 1, 1,
-2.541679, -0.952493, -3.423184, 1, 0, 0, 1, 1,
-2.473372, -0.2328948, -2.708504, 0, 0, 0, 1, 1,
-2.446117, 1.418355, -2.362646, 0, 0, 0, 1, 1,
-2.44041, -1.337705, -3.074727, 0, 0, 0, 1, 1,
-2.365379, 0.6541682, -2.669801, 0, 0, 0, 1, 1,
-2.350845, -0.2084438, 1.289782, 0, 0, 0, 1, 1,
-2.33382, 0.4382101, -1.402378, 0, 0, 0, 1, 1,
-2.309314, 0.02079595, 0.7908077, 0, 0, 0, 1, 1,
-2.285026, -0.2326761, -3.297568, 1, 1, 1, 1, 1,
-2.269196, 0.05444198, -2.134838, 1, 1, 1, 1, 1,
-2.247229, -1.387131, -2.573409, 1, 1, 1, 1, 1,
-2.229663, -0.1756591, -1.365861, 1, 1, 1, 1, 1,
-2.186121, -0.8781946, -1.332252, 1, 1, 1, 1, 1,
-2.112169, 1.641361, -0.9429232, 1, 1, 1, 1, 1,
-2.100559, 2.359049, -1.771803, 1, 1, 1, 1, 1,
-2.094309, -0.613107, -1.748035, 1, 1, 1, 1, 1,
-2.07006, -0.2047243, -2.935962, 1, 1, 1, 1, 1,
-2.065242, 1.189427, -0.8822008, 1, 1, 1, 1, 1,
-2.055284, 0.1262439, -2.055235, 1, 1, 1, 1, 1,
-2.017468, -0.4033352, -1.27853, 1, 1, 1, 1, 1,
-2.014698, -0.9194576, -1.200741, 1, 1, 1, 1, 1,
-2.013282, 0.218137, -1.436135, 1, 1, 1, 1, 1,
-2.010047, 0.6832503, -1.243586, 1, 1, 1, 1, 1,
-1.958151, -0.4777489, -1.871094, 0, 0, 1, 1, 1,
-1.93106, 0.3396086, 0.2417498, 1, 0, 0, 1, 1,
-1.899863, 0.3454659, -0.4634282, 1, 0, 0, 1, 1,
-1.894034, -0.6756281, 1.249631, 1, 0, 0, 1, 1,
-1.892107, -0.1571349, -3.010854, 1, 0, 0, 1, 1,
-1.888728, 1.182683, 0.1323288, 1, 0, 0, 1, 1,
-1.870439, 0.5712667, -1.938431, 0, 0, 0, 1, 1,
-1.859123, -0.9718826, -0.1408536, 0, 0, 0, 1, 1,
-1.852685, -0.5138962, -2.433151, 0, 0, 0, 1, 1,
-1.821552, 0.2709863, -1.438658, 0, 0, 0, 1, 1,
-1.786188, -0.7967675, -3.57982, 0, 0, 0, 1, 1,
-1.770865, 0.6191821, -1.173832, 0, 0, 0, 1, 1,
-1.767072, 0.7350062, -1.617224, 0, 0, 0, 1, 1,
-1.765421, -1.639402, -3.218122, 1, 1, 1, 1, 1,
-1.754677, 0.6656222, -0.730424, 1, 1, 1, 1, 1,
-1.737764, -1.902998, -2.33066, 1, 1, 1, 1, 1,
-1.73347, -0.4278649, -2.457493, 1, 1, 1, 1, 1,
-1.718842, -0.7749055, -1.653409, 1, 1, 1, 1, 1,
-1.706111, 1.477011, -1.877803, 1, 1, 1, 1, 1,
-1.70113, 1.933888, -0.4684043, 1, 1, 1, 1, 1,
-1.700195, 1.563792, -2.942974, 1, 1, 1, 1, 1,
-1.6903, 0.8204073, -0.1768204, 1, 1, 1, 1, 1,
-1.68619, 0.7538069, -2.567805, 1, 1, 1, 1, 1,
-1.681481, 1.030964, -0.607787, 1, 1, 1, 1, 1,
-1.675948, -0.4318986, -1.473096, 1, 1, 1, 1, 1,
-1.671772, -0.01137409, 1.078105, 1, 1, 1, 1, 1,
-1.668949, 0.7861724, -1.823959, 1, 1, 1, 1, 1,
-1.636782, -0.2957709, -3.027408, 1, 1, 1, 1, 1,
-1.636436, 0.2802381, -1.671453, 0, 0, 1, 1, 1,
-1.629804, -0.3959839, -1.87267, 1, 0, 0, 1, 1,
-1.623826, -1.447361, -3.296439, 1, 0, 0, 1, 1,
-1.622301, -0.7257296, -1.643807, 1, 0, 0, 1, 1,
-1.608998, 0.183001, -2.139207, 1, 0, 0, 1, 1,
-1.58036, -1.638962, -1.247268, 1, 0, 0, 1, 1,
-1.561939, -2.084944, -1.454343, 0, 0, 0, 1, 1,
-1.554829, 2.440645, -0.9229579, 0, 0, 0, 1, 1,
-1.546708, -0.6385269, -3.288725, 0, 0, 0, 1, 1,
-1.546311, 0.0425325, -1.022587, 0, 0, 0, 1, 1,
-1.542867, -0.6517322, -1.743537, 0, 0, 0, 1, 1,
-1.542785, -0.4787072, -2.213465, 0, 0, 0, 1, 1,
-1.53984, -2.788682, -2.361311, 0, 0, 0, 1, 1,
-1.519671, 0.7089394, -2.894473, 1, 1, 1, 1, 1,
-1.515968, 0.9733536, 0.1256064, 1, 1, 1, 1, 1,
-1.515693, 1.313677, -2.218084, 1, 1, 1, 1, 1,
-1.505979, -0.4448904, -2.748821, 1, 1, 1, 1, 1,
-1.501805, 0.2088751, -2.365671, 1, 1, 1, 1, 1,
-1.501361, -1.732924, -2.629651, 1, 1, 1, 1, 1,
-1.486306, 1.160442, 0.7915553, 1, 1, 1, 1, 1,
-1.481273, -1.599224, -2.412774, 1, 1, 1, 1, 1,
-1.467084, 1.057264, -1.324816, 1, 1, 1, 1, 1,
-1.461485, -2.49347, -1.842726, 1, 1, 1, 1, 1,
-1.459143, 1.015891, -0.3940665, 1, 1, 1, 1, 1,
-1.456879, -1.249597, -2.406188, 1, 1, 1, 1, 1,
-1.456139, -0.2927324, -0.7687603, 1, 1, 1, 1, 1,
-1.454905, 0.6863037, -2.869272, 1, 1, 1, 1, 1,
-1.454168, -0.4395106, -0.5609933, 1, 1, 1, 1, 1,
-1.433891, -0.7734743, -3.889641, 0, 0, 1, 1, 1,
-1.431012, -1.260737, -1.969715, 1, 0, 0, 1, 1,
-1.426589, 0.4166713, -0.5540904, 1, 0, 0, 1, 1,
-1.41701, -0.6650479, -2.542485, 1, 0, 0, 1, 1,
-1.412458, 2.151644, -0.8040394, 1, 0, 0, 1, 1,
-1.411925, -0.07886445, -1.675107, 1, 0, 0, 1, 1,
-1.407972, -0.6820702, -1.02585, 0, 0, 0, 1, 1,
-1.398148, -1.317927, -2.297692, 0, 0, 0, 1, 1,
-1.396185, 0.1771839, -1.77129, 0, 0, 0, 1, 1,
-1.38093, 1.227011, -1.213158, 0, 0, 0, 1, 1,
-1.380515, -0.9524766, -1.256081, 0, 0, 0, 1, 1,
-1.379639, 0.6577951, -1.17097, 0, 0, 0, 1, 1,
-1.375539, -0.4358326, -2.351222, 0, 0, 0, 1, 1,
-1.368822, -0.9974194, -2.76185, 1, 1, 1, 1, 1,
-1.366982, -0.1235014, -1.828756, 1, 1, 1, 1, 1,
-1.363768, -0.6915735, -4.415398, 1, 1, 1, 1, 1,
-1.358551, 1.847825, 0.3972776, 1, 1, 1, 1, 1,
-1.345842, 0.2652968, -1.175232, 1, 1, 1, 1, 1,
-1.337471, 0.5487724, -3.38553, 1, 1, 1, 1, 1,
-1.332552, 1.13801, 0.6328368, 1, 1, 1, 1, 1,
-1.332301, -0.5166113, -2.431716, 1, 1, 1, 1, 1,
-1.328812, -0.8500137, -3.099764, 1, 1, 1, 1, 1,
-1.32019, -0.8459195, -2.012906, 1, 1, 1, 1, 1,
-1.319247, -1.381861, -3.4252, 1, 1, 1, 1, 1,
-1.31709, 0.04772965, -1.843998, 1, 1, 1, 1, 1,
-1.313352, 0.834182, -2.933154, 1, 1, 1, 1, 1,
-1.309862, 0.200419, -2.036818, 1, 1, 1, 1, 1,
-1.302556, 0.4998775, -3.049045, 1, 1, 1, 1, 1,
-1.276318, -0.5602974, -1.174472, 0, 0, 1, 1, 1,
-1.271456, -0.4079954, -2.928816, 1, 0, 0, 1, 1,
-1.27044, 0.09085075, -1.983534, 1, 0, 0, 1, 1,
-1.262378, -1.4989, -3.817642, 1, 0, 0, 1, 1,
-1.259781, -2.139695, -3.224974, 1, 0, 0, 1, 1,
-1.257482, 0.986292, -1.821998, 1, 0, 0, 1, 1,
-1.257106, 0.06579049, -0.894928, 0, 0, 0, 1, 1,
-1.251685, -1.196378, -1.855546, 0, 0, 0, 1, 1,
-1.241958, 1.203999, -0.8609344, 0, 0, 0, 1, 1,
-1.236521, 0.8068453, -0.3711727, 0, 0, 0, 1, 1,
-1.235121, 0.3366044, -3.116618, 0, 0, 0, 1, 1,
-1.234153, 1.076287, -2.698785, 0, 0, 0, 1, 1,
-1.23247, 0.3321345, -2.487661, 0, 0, 0, 1, 1,
-1.231975, 0.0324863, -2.050485, 1, 1, 1, 1, 1,
-1.231667, -0.4538793, -1.974224, 1, 1, 1, 1, 1,
-1.228402, -0.4649133, -1.287603, 1, 1, 1, 1, 1,
-1.217529, -0.2326762, -1.225259, 1, 1, 1, 1, 1,
-1.197092, -0.0480717, -1.555983, 1, 1, 1, 1, 1,
-1.196083, 0.2862526, -1.068913, 1, 1, 1, 1, 1,
-1.189447, -0.4389629, -2.363236, 1, 1, 1, 1, 1,
-1.180632, 0.6469034, -0.532397, 1, 1, 1, 1, 1,
-1.17659, 0.2896671, 0.1751065, 1, 1, 1, 1, 1,
-1.176528, -0.3928401, -0.4236179, 1, 1, 1, 1, 1,
-1.175474, 0.0698218, -3.04747, 1, 1, 1, 1, 1,
-1.171604, 0.4455765, -0.492399, 1, 1, 1, 1, 1,
-1.16909, -0.5939466, -1.909455, 1, 1, 1, 1, 1,
-1.166219, -2.039801, -3.243794, 1, 1, 1, 1, 1,
-1.165631, 1.659654, 0.7726579, 1, 1, 1, 1, 1,
-1.159101, 0.1817144, -1.352467, 0, 0, 1, 1, 1,
-1.158494, 2.243654, 1.375946, 1, 0, 0, 1, 1,
-1.144952, -0.7696242, -1.977892, 1, 0, 0, 1, 1,
-1.143967, -0.3031414, -3.549731, 1, 0, 0, 1, 1,
-1.143918, 0.2436775, -2.307532, 1, 0, 0, 1, 1,
-1.137283, 1.00376, 0.2333864, 1, 0, 0, 1, 1,
-1.136355, -1.001428, -1.111227, 0, 0, 0, 1, 1,
-1.125307, 1.148924, 0.2107677, 0, 0, 0, 1, 1,
-1.110536, -1.551051, -1.354787, 0, 0, 0, 1, 1,
-1.110495, 0.3116345, -1.232427, 0, 0, 0, 1, 1,
-1.109621, -1.241289, -3.066549, 0, 0, 0, 1, 1,
-1.105836, -1.320205, -2.985968, 0, 0, 0, 1, 1,
-1.103454, 0.8098082, -2.333833, 0, 0, 0, 1, 1,
-1.091488, 2.121725, 0.02601939, 1, 1, 1, 1, 1,
-1.084307, 1.122786, 0.5151176, 1, 1, 1, 1, 1,
-1.08102, 0.1613429, -2.1354, 1, 1, 1, 1, 1,
-1.075054, 0.7060322, 0.5303132, 1, 1, 1, 1, 1,
-1.049348, 2.321261, 0.1870518, 1, 1, 1, 1, 1,
-1.048695, -0.2062158, -1.738091, 1, 1, 1, 1, 1,
-1.047098, 1.646635, 0.07286325, 1, 1, 1, 1, 1,
-1.045182, 0.05459294, -2.824272, 1, 1, 1, 1, 1,
-1.044988, -0.4078753, -2.215608, 1, 1, 1, 1, 1,
-1.035291, -0.7190896, -0.4764693, 1, 1, 1, 1, 1,
-1.026348, 1.169114, -0.8622919, 1, 1, 1, 1, 1,
-1.015255, -0.9724995, -1.13576, 1, 1, 1, 1, 1,
-1.013461, 0.9146644, 0.6583538, 1, 1, 1, 1, 1,
-1.01283, 0.6412252, -1.975876, 1, 1, 1, 1, 1,
-1.011248, -0.1278121, -0.5386074, 1, 1, 1, 1, 1,
-1.005982, 0.860309, -1.098787, 0, 0, 1, 1, 1,
-0.9994439, -1.411639, -2.803317, 1, 0, 0, 1, 1,
-0.9962465, 0.1654369, -3.088341, 1, 0, 0, 1, 1,
-0.9944689, -0.7441069, -1.514419, 1, 0, 0, 1, 1,
-0.9887038, -0.5224732, -2.172336, 1, 0, 0, 1, 1,
-0.9878528, -0.7520121, -1.739032, 1, 0, 0, 1, 1,
-0.9845288, -0.01943864, -2.587979, 0, 0, 0, 1, 1,
-0.9834269, 0.5918461, 0.1252706, 0, 0, 0, 1, 1,
-0.9825101, -1.347597, -2.69093, 0, 0, 0, 1, 1,
-0.9801056, -0.4697062, -3.192645, 0, 0, 0, 1, 1,
-0.9795762, 0.0918663, -0.9460816, 0, 0, 0, 1, 1,
-0.9784517, -0.004146683, -0.7551928, 0, 0, 0, 1, 1,
-0.9753839, -0.6505116, -4.75983, 0, 0, 0, 1, 1,
-0.9711339, -1.773017, -2.143133, 1, 1, 1, 1, 1,
-0.9711083, -1.295446, -2.466946, 1, 1, 1, 1, 1,
-0.9706194, -1.10257, -2.307456, 1, 1, 1, 1, 1,
-0.9642335, -1.070499, -2.556483, 1, 1, 1, 1, 1,
-0.9615571, -0.2444641, -1.807597, 1, 1, 1, 1, 1,
-0.9603705, 0.1809115, -2.385454, 1, 1, 1, 1, 1,
-0.9518609, -0.1450623, -2.008891, 1, 1, 1, 1, 1,
-0.9433951, -1.383414, -2.854151, 1, 1, 1, 1, 1,
-0.9364381, -0.2458024, -2.440928, 1, 1, 1, 1, 1,
-0.9302918, -1.586789, -3.34515, 1, 1, 1, 1, 1,
-0.9201392, 1.243136, -1.271116, 1, 1, 1, 1, 1,
-0.9181622, 1.333731, -0.9023867, 1, 1, 1, 1, 1,
-0.9064205, 0.4864664, -2.025794, 1, 1, 1, 1, 1,
-0.9025442, 0.5096571, 1.315475, 1, 1, 1, 1, 1,
-0.8985426, 0.6687836, -0.07968817, 1, 1, 1, 1, 1,
-0.8967012, 0.9802099, -0.06046878, 0, 0, 1, 1, 1,
-0.8906432, 0.1970502, -2.802795, 1, 0, 0, 1, 1,
-0.8900618, 0.4885874, -1.823347, 1, 0, 0, 1, 1,
-0.8818757, 1.147488, -2.077445, 1, 0, 0, 1, 1,
-0.8802828, -1.215428, -2.896672, 1, 0, 0, 1, 1,
-0.8738267, -2.338888, -0.5485876, 1, 0, 0, 1, 1,
-0.8548441, -0.3400019, -2.482174, 0, 0, 0, 1, 1,
-0.8524063, -0.5376173, -1.391871, 0, 0, 0, 1, 1,
-0.8516753, 0.7224278, -1.516257, 0, 0, 0, 1, 1,
-0.8473704, -0.9865381, -2.437989, 0, 0, 0, 1, 1,
-0.8469535, 1.287272, -0.9112879, 0, 0, 0, 1, 1,
-0.8422627, 0.301248, -1.262117, 0, 0, 0, 1, 1,
-0.8387967, -1.496118, -1.900225, 0, 0, 0, 1, 1,
-0.8384249, -0.4088431, -1.099884, 1, 1, 1, 1, 1,
-0.8376812, -0.08717159, -1.582059, 1, 1, 1, 1, 1,
-0.8362588, 0.398337, -0.4820808, 1, 1, 1, 1, 1,
-0.8280265, -0.7244547, -2.916784, 1, 1, 1, 1, 1,
-0.8220268, -1.713863, -3.4307, 1, 1, 1, 1, 1,
-0.8166519, 0.3710436, -1.219552, 1, 1, 1, 1, 1,
-0.8165123, 0.1499965, -0.1207424, 1, 1, 1, 1, 1,
-0.81286, -0.007501935, -0.4636516, 1, 1, 1, 1, 1,
-0.8111888, -0.6362244, -3.59386, 1, 1, 1, 1, 1,
-0.8059556, 0.2866215, -1.593913, 1, 1, 1, 1, 1,
-0.8013363, -1.611497, -3.352671, 1, 1, 1, 1, 1,
-0.7994716, -2.522747, -3.77921, 1, 1, 1, 1, 1,
-0.7976045, -0.4110704, -2.954087, 1, 1, 1, 1, 1,
-0.7943968, -2.26725, -2.042987, 1, 1, 1, 1, 1,
-0.777732, -0.2812018, -3.800368, 1, 1, 1, 1, 1,
-0.7680204, -0.7896226, -1.917255, 0, 0, 1, 1, 1,
-0.7663072, -0.2098492, -1.289954, 1, 0, 0, 1, 1,
-0.7553872, -0.6778734, -0.7538098, 1, 0, 0, 1, 1,
-0.744315, -0.2772644, -2.906304, 1, 0, 0, 1, 1,
-0.7432992, 0.2944815, -0.6325054, 1, 0, 0, 1, 1,
-0.73835, 0.3038927, -0.2641041, 1, 0, 0, 1, 1,
-0.7299454, 1.507976, -1.0185, 0, 0, 0, 1, 1,
-0.7173735, 0.008568387, -0.6034096, 0, 0, 0, 1, 1,
-0.7165945, 0.3878701, -0.7977226, 0, 0, 0, 1, 1,
-0.7161852, 2.605765, 0.2426641, 0, 0, 0, 1, 1,
-0.7120637, 0.09313268, -1.905801, 0, 0, 0, 1, 1,
-0.711042, 0.4788724, -0.3468322, 0, 0, 0, 1, 1,
-0.7087721, 0.6591095, -2.353667, 0, 0, 0, 1, 1,
-0.6940871, -0.5553136, -2.416627, 1, 1, 1, 1, 1,
-0.6890309, 0.257652, -1.350172, 1, 1, 1, 1, 1,
-0.6832786, -0.6107212, -2.48173, 1, 1, 1, 1, 1,
-0.6780684, 0.07106171, -1.859919, 1, 1, 1, 1, 1,
-0.6757996, -0.4570566, -3.122389, 1, 1, 1, 1, 1,
-0.6704171, 0.3688254, -0.3144737, 1, 1, 1, 1, 1,
-0.6691824, 1.650511, -1.04874, 1, 1, 1, 1, 1,
-0.6672996, -0.08377832, -0.8361434, 1, 1, 1, 1, 1,
-0.6623331, -0.5744762, -2.415068, 1, 1, 1, 1, 1,
-0.6607316, 1.128333, 0.5535768, 1, 1, 1, 1, 1,
-0.6597664, -2.077891, -3.264963, 1, 1, 1, 1, 1,
-0.6570494, -0.5296946, -0.5768129, 1, 1, 1, 1, 1,
-0.6549751, -0.6024736, -2.594701, 1, 1, 1, 1, 1,
-0.6547868, -0.1594185, -1.047566, 1, 1, 1, 1, 1,
-0.654775, -0.629213, -2.217539, 1, 1, 1, 1, 1,
-0.6546094, 0.7639943, 0.1286617, 0, 0, 1, 1, 1,
-0.6523927, 1.726316, 0.923216, 1, 0, 0, 1, 1,
-0.6471732, 0.04611995, -2.862588, 1, 0, 0, 1, 1,
-0.6467735, 1.545428, 1.151042, 1, 0, 0, 1, 1,
-0.6461345, 0.3529472, -0.1726259, 1, 0, 0, 1, 1,
-0.6415961, 0.6132275, -1.294475, 1, 0, 0, 1, 1,
-0.6386224, 0.2847011, -0.8437703, 0, 0, 0, 1, 1,
-0.6369259, 1.121701, -0.6417837, 0, 0, 0, 1, 1,
-0.6350884, -0.6489708, -3.376915, 0, 0, 0, 1, 1,
-0.6342211, -0.9785223, -2.582978, 0, 0, 0, 1, 1,
-0.6300219, 0.3454947, -3.196057, 0, 0, 0, 1, 1,
-0.6234841, -1.668437, -1.962864, 0, 0, 0, 1, 1,
-0.6168939, -0.08003038, -2.457061, 0, 0, 0, 1, 1,
-0.6161283, -0.5657396, -2.889399, 1, 1, 1, 1, 1,
-0.615203, 0.3187609, -2.795232, 1, 1, 1, 1, 1,
-0.6137526, -0.07251491, -1.766147, 1, 1, 1, 1, 1,
-0.6135183, -0.6680285, -3.554505, 1, 1, 1, 1, 1,
-0.6133908, -0.863946, -2.185824, 1, 1, 1, 1, 1,
-0.6097858, 1.096141, 0.8350067, 1, 1, 1, 1, 1,
-0.6026672, 0.01671769, -2.711068, 1, 1, 1, 1, 1,
-0.5999461, 0.515195, -0.72313, 1, 1, 1, 1, 1,
-0.5963288, 2.111697, -0.6102341, 1, 1, 1, 1, 1,
-0.5948108, 0.1036689, -2.17277, 1, 1, 1, 1, 1,
-0.5947638, 1.977326, -2.886772, 1, 1, 1, 1, 1,
-0.5894188, 0.6070884, -0.7435754, 1, 1, 1, 1, 1,
-0.58325, 2.819188, -0.3491675, 1, 1, 1, 1, 1,
-0.5789763, -2.846267, -0.5731273, 1, 1, 1, 1, 1,
-0.5725767, -0.2835694, -2.147986, 1, 1, 1, 1, 1,
-0.5682211, 0.1941614, -1.169092, 0, 0, 1, 1, 1,
-0.5616896, -0.5665634, -3.281825, 1, 0, 0, 1, 1,
-0.549786, -0.6572239, -2.189192, 1, 0, 0, 1, 1,
-0.5460393, 0.9893662, -0.9093327, 1, 0, 0, 1, 1,
-0.5449565, 0.1984916, -1.920715, 1, 0, 0, 1, 1,
-0.5416913, 0.2906492, -0.9903674, 1, 0, 0, 1, 1,
-0.5398028, 0.4658463, -1.321379, 0, 0, 0, 1, 1,
-0.5280613, 0.6898292, 0.6201553, 0, 0, 0, 1, 1,
-0.525759, -1.180506, -3.735925, 0, 0, 0, 1, 1,
-0.5194246, 1.307476, -0.9180858, 0, 0, 0, 1, 1,
-0.5162403, 0.02971039, -1.712894, 0, 0, 0, 1, 1,
-0.5131189, 0.05836061, -2.107769, 0, 0, 0, 1, 1,
-0.511188, 0.3625689, -2.595365, 0, 0, 0, 1, 1,
-0.5110499, -0.8871834, -2.545382, 1, 1, 1, 1, 1,
-0.5091197, 1.541942, -1.163236, 1, 1, 1, 1, 1,
-0.5090612, -0.3184954, -2.04168, 1, 1, 1, 1, 1,
-0.5048435, 0.6588259, 0.6142341, 1, 1, 1, 1, 1,
-0.5012091, -0.7356079, -2.689587, 1, 1, 1, 1, 1,
-0.4995394, 1.250713, -1.514476, 1, 1, 1, 1, 1,
-0.4962137, 0.3417585, -0.5536097, 1, 1, 1, 1, 1,
-0.4955003, -1.130779, -2.378839, 1, 1, 1, 1, 1,
-0.4954628, 0.444563, -0.2273111, 1, 1, 1, 1, 1,
-0.4912621, -0.1965336, -0.8183154, 1, 1, 1, 1, 1,
-0.4899359, -0.2245526, -2.768277, 1, 1, 1, 1, 1,
-0.4859213, 0.6140456, -1.555298, 1, 1, 1, 1, 1,
-0.4806567, 0.4603338, -0.5231715, 1, 1, 1, 1, 1,
-0.4792317, 0.103543, -1.290595, 1, 1, 1, 1, 1,
-0.4791761, -0.05646478, 0.02973306, 1, 1, 1, 1, 1,
-0.4778353, 0.4385684, -0.5469602, 0, 0, 1, 1, 1,
-0.4756827, 1.218272, -1.48973, 1, 0, 0, 1, 1,
-0.4681898, 1.324233, 0.117797, 1, 0, 0, 1, 1,
-0.4634016, 0.3792191, -1.753979, 1, 0, 0, 1, 1,
-0.4593506, -0.1753208, -2.016526, 1, 0, 0, 1, 1,
-0.4568502, 1.146939, -0.2993389, 1, 0, 0, 1, 1,
-0.4557434, -0.2992601, -1.453932, 0, 0, 0, 1, 1,
-0.4555573, 1.269539, -0.508157, 0, 0, 0, 1, 1,
-0.4539778, -0.1929426, -1.363858, 0, 0, 0, 1, 1,
-0.4525302, -0.4133788, -3.203862, 0, 0, 0, 1, 1,
-0.4517994, -0.219607, -1.459461, 0, 0, 0, 1, 1,
-0.4504997, 0.03232228, -2.118915, 0, 0, 0, 1, 1,
-0.4437163, -0.06805693, -1.717089, 0, 0, 0, 1, 1,
-0.4375137, -0.1487594, -2.122082, 1, 1, 1, 1, 1,
-0.4370668, -1.466553, -3.922621, 1, 1, 1, 1, 1,
-0.4302357, 0.5684736, 1.123842, 1, 1, 1, 1, 1,
-0.429192, -0.3715178, -0.5696373, 1, 1, 1, 1, 1,
-0.4261492, 0.02857456, -2.105389, 1, 1, 1, 1, 1,
-0.4242038, -0.5581903, -3.293643, 1, 1, 1, 1, 1,
-0.4183345, 0.7204821, -1.396536, 1, 1, 1, 1, 1,
-0.4178306, 0.442124, -2.171076, 1, 1, 1, 1, 1,
-0.4130229, 0.3893582, -0.1655396, 1, 1, 1, 1, 1,
-0.4119791, -0.4911819, -1.514375, 1, 1, 1, 1, 1,
-0.4086053, -0.7688664, -2.726208, 1, 1, 1, 1, 1,
-0.4078279, 2.737376, -0.6155609, 1, 1, 1, 1, 1,
-0.4038709, -0.2917381, -1.712769, 1, 1, 1, 1, 1,
-0.3966798, 1.722154, 1.967577, 1, 1, 1, 1, 1,
-0.3966617, -0.1343884, -2.082138, 1, 1, 1, 1, 1,
-0.3953687, -0.1688911, -2.741738, 0, 0, 1, 1, 1,
-0.3932233, -0.09678596, -0.2111788, 1, 0, 0, 1, 1,
-0.3915915, -1.381331, -2.42159, 1, 0, 0, 1, 1,
-0.3910117, -0.05511427, -1.474405, 1, 0, 0, 1, 1,
-0.3874, -0.1987572, -4.96026, 1, 0, 0, 1, 1,
-0.3856988, 1.399503, -0.7197648, 1, 0, 0, 1, 1,
-0.3856879, 2.82973, -0.893774, 0, 0, 0, 1, 1,
-0.3829405, 1.725132, 0.2940754, 0, 0, 0, 1, 1,
-0.3819037, -0.3976129, -3.192687, 0, 0, 0, 1, 1,
-0.3798596, -0.2980064, -3.547273, 0, 0, 0, 1, 1,
-0.3770846, -0.7050897, -3.522655, 0, 0, 0, 1, 1,
-0.3743092, 0.6063867, -0.7328815, 0, 0, 0, 1, 1,
-0.370806, 1.682464, 0.9034231, 0, 0, 0, 1, 1,
-0.3685309, -1.025543, -2.33972, 1, 1, 1, 1, 1,
-0.3622298, -0.7663113, -4.150361, 1, 1, 1, 1, 1,
-0.3620257, -0.1058925, -2.695084, 1, 1, 1, 1, 1,
-0.3581765, -0.225082, -2.186895, 1, 1, 1, 1, 1,
-0.3552708, -0.3923893, -0.6078355, 1, 1, 1, 1, 1,
-0.3534372, 0.1039537, -1.614848, 1, 1, 1, 1, 1,
-0.3523567, 0.2748123, -2.398577, 1, 1, 1, 1, 1,
-0.3508222, -1.141684, -2.624817, 1, 1, 1, 1, 1,
-0.3499635, 0.2332534, -2.886558, 1, 1, 1, 1, 1,
-0.3468432, 0.1696803, -1.260597, 1, 1, 1, 1, 1,
-0.3465236, -0.5673248, -2.315106, 1, 1, 1, 1, 1,
-0.3464398, 0.8886971, -1.504628, 1, 1, 1, 1, 1,
-0.3454411, 0.01395284, -0.7166082, 1, 1, 1, 1, 1,
-0.3452192, 0.1572949, -1.402692, 1, 1, 1, 1, 1,
-0.3409391, -0.9740353, -3.307192, 1, 1, 1, 1, 1,
-0.3387638, -0.5380977, -1.07239, 0, 0, 1, 1, 1,
-0.3335079, 1.170757, -0.2802493, 1, 0, 0, 1, 1,
-0.3327933, 0.02198131, -1.361634, 1, 0, 0, 1, 1,
-0.327388, 0.3375782, -0.8705423, 1, 0, 0, 1, 1,
-0.3202311, 0.3026915, -1.097012, 1, 0, 0, 1, 1,
-0.3191611, -0.747025, -2.98989, 1, 0, 0, 1, 1,
-0.3182655, 2.274658, 1.186076, 0, 0, 0, 1, 1,
-0.3130586, -0.01895989, -1.226294, 0, 0, 0, 1, 1,
-0.3129199, -0.2710863, -1.028099, 0, 0, 0, 1, 1,
-0.312142, 0.08359563, -0.8039129, 0, 0, 0, 1, 1,
-0.3107185, -1.111388, -2.038662, 0, 0, 0, 1, 1,
-0.3093965, 0.174454, -2.294518, 0, 0, 0, 1, 1,
-0.3071417, -1.811146, -2.313292, 0, 0, 0, 1, 1,
-0.3037711, -1.993955, -2.452865, 1, 1, 1, 1, 1,
-0.3018045, -0.6032336, -2.745506, 1, 1, 1, 1, 1,
-0.2996656, -1.209569, -2.510085, 1, 1, 1, 1, 1,
-0.2992491, -2.042037, -2.383907, 1, 1, 1, 1, 1,
-0.2989995, 0.4108936, -2.053735, 1, 1, 1, 1, 1,
-0.2988694, 0.7825826, -1.356371, 1, 1, 1, 1, 1,
-0.2957712, -0.6141928, -2.401022, 1, 1, 1, 1, 1,
-0.2955267, -0.2788728, -4.581254, 1, 1, 1, 1, 1,
-0.2928703, -0.9547852, -2.522404, 1, 1, 1, 1, 1,
-0.2922274, 0.07899147, -1.59744, 1, 1, 1, 1, 1,
-0.2917552, 1.548961, 1.31162, 1, 1, 1, 1, 1,
-0.2915947, -1.642251, -1.476679, 1, 1, 1, 1, 1,
-0.2906684, 0.8963258, 0.4311227, 1, 1, 1, 1, 1,
-0.2887239, 0.9590096, -0.763773, 1, 1, 1, 1, 1,
-0.2878482, 1.723208, 0.3525392, 1, 1, 1, 1, 1,
-0.2869694, 0.5626708, -1.931745, 0, 0, 1, 1, 1,
-0.2795519, 0.720638, 0.6360192, 1, 0, 0, 1, 1,
-0.2773297, 0.1990653, -1.930583, 1, 0, 0, 1, 1,
-0.2738528, 0.002584137, -1.341429, 1, 0, 0, 1, 1,
-0.2738089, 0.3054244, -0.2682269, 1, 0, 0, 1, 1,
-0.272047, 1.047658, -0.5870985, 1, 0, 0, 1, 1,
-0.2713876, -0.7082053, -2.561182, 0, 0, 0, 1, 1,
-0.2630597, 1.355866, -0.9293927, 0, 0, 0, 1, 1,
-0.2605836, -0.7537336, -1.791314, 0, 0, 0, 1, 1,
-0.2579705, 0.6723912, -1.30066, 0, 0, 0, 1, 1,
-0.2534024, -1.582016, -4.182777, 0, 0, 0, 1, 1,
-0.2492205, 0.2383209, 0.4743107, 0, 0, 0, 1, 1,
-0.2457908, -0.5573289, -1.902305, 0, 0, 0, 1, 1,
-0.2447739, -0.2857023, -2.654309, 1, 1, 1, 1, 1,
-0.2415359, -0.6069405, -1.620324, 1, 1, 1, 1, 1,
-0.2376235, 0.7316911, -1.349984, 1, 1, 1, 1, 1,
-0.2335833, 0.3636675, 0.6084903, 1, 1, 1, 1, 1,
-0.2290208, -1.78115, -2.644291, 1, 1, 1, 1, 1,
-0.2287556, 0.2767941, -1.198733, 1, 1, 1, 1, 1,
-0.2270463, 1.338297, -0.4019312, 1, 1, 1, 1, 1,
-0.2216802, 1.914379, 0.843718, 1, 1, 1, 1, 1,
-0.2175296, -1.307304, -1.459513, 1, 1, 1, 1, 1,
-0.2165265, -0.1006849, -3.816771, 1, 1, 1, 1, 1,
-0.216013, 1.218264, 1.316446, 1, 1, 1, 1, 1,
-0.2157076, 1.998453, 1.621254, 1, 1, 1, 1, 1,
-0.2155165, 0.4234528, -1.569291, 1, 1, 1, 1, 1,
-0.2147797, -0.3425573, -2.479773, 1, 1, 1, 1, 1,
-0.211942, -0.06250896, -4.134859, 1, 1, 1, 1, 1,
-0.2093075, 0.3088081, -0.588696, 0, 0, 1, 1, 1,
-0.2082893, 0.9263594, 0.8741038, 1, 0, 0, 1, 1,
-0.2076069, -0.1688723, -4.245646, 1, 0, 0, 1, 1,
-0.2073593, -0.4342532, -4.348398, 1, 0, 0, 1, 1,
-0.2065145, 0.03633259, -2.50888, 1, 0, 0, 1, 1,
-0.2053268, -0.5451701, -2.67446, 1, 0, 0, 1, 1,
-0.2047019, 0.2775798, -1.09715, 0, 0, 0, 1, 1,
-0.2036333, 0.8914913, -1.616077, 0, 0, 0, 1, 1,
-0.2009668, 0.2191534, -0.4235081, 0, 0, 0, 1, 1,
-0.2008691, -0.3949611, -1.238311, 0, 0, 0, 1, 1,
-0.1995912, -0.7887525, -1.890125, 0, 0, 0, 1, 1,
-0.195985, 0.9343395, 0.5203851, 0, 0, 0, 1, 1,
-0.1959147, 0.7396079, -1.700421, 0, 0, 0, 1, 1,
-0.1916417, -1.049851, -2.673456, 1, 1, 1, 1, 1,
-0.1873503, 0.2181914, -0.2387794, 1, 1, 1, 1, 1,
-0.1872866, 2.213873, 0.25765, 1, 1, 1, 1, 1,
-0.1867969, -2.038468, -2.556732, 1, 1, 1, 1, 1,
-0.1853746, 0.3220739, -0.2606871, 1, 1, 1, 1, 1,
-0.1778478, -0.4178848, -4.250132, 1, 1, 1, 1, 1,
-0.1758187, -0.8369511, -4.061207, 1, 1, 1, 1, 1,
-0.1753558, 0.7971731, -1.578172, 1, 1, 1, 1, 1,
-0.173723, 1.283205, -0.9651113, 1, 1, 1, 1, 1,
-0.1724981, 1.201817, -0.6410456, 1, 1, 1, 1, 1,
-0.1688825, -0.5736453, -3.764667, 1, 1, 1, 1, 1,
-0.1662643, -0.5203429, -1.460355, 1, 1, 1, 1, 1,
-0.1647191, -0.7866058, -3.592393, 1, 1, 1, 1, 1,
-0.1638024, 0.0465343, -0.9543189, 1, 1, 1, 1, 1,
-0.1578921, -1.372854, -1.288214, 1, 1, 1, 1, 1,
-0.155468, -1.206286, -4.356257, 0, 0, 1, 1, 1,
-0.1545239, 1.267422, -0.3628069, 1, 0, 0, 1, 1,
-0.1535781, -1.684971, -3.720367, 1, 0, 0, 1, 1,
-0.1516814, -1.79774, -1.77203, 1, 0, 0, 1, 1,
-0.1509151, 1.16697, 0.7917762, 1, 0, 0, 1, 1,
-0.150041, -1.190866, -3.044016, 1, 0, 0, 1, 1,
-0.14759, 0.3678701, -0.3840473, 0, 0, 0, 1, 1,
-0.1445359, -0.435641, -1.216836, 0, 0, 0, 1, 1,
-0.142009, 0.1735261, -0.9292954, 0, 0, 0, 1, 1,
-0.1409719, -0.4347774, -2.818012, 0, 0, 0, 1, 1,
-0.1388229, -1.198727, -1.506256, 0, 0, 0, 1, 1,
-0.1337949, -1.27255, -2.007725, 0, 0, 0, 1, 1,
-0.132157, -0.3838723, -3.542938, 0, 0, 0, 1, 1,
-0.1309745, -0.966572, -4.161404, 1, 1, 1, 1, 1,
-0.1301281, -0.3139024, -3.332611, 1, 1, 1, 1, 1,
-0.1277479, -0.9105849, -2.457123, 1, 1, 1, 1, 1,
-0.1262685, 0.5390978, 0.4591761, 1, 1, 1, 1, 1,
-0.1247634, 0.09915067, -1.952279, 1, 1, 1, 1, 1,
-0.1156252, 0.7137161, -1.9138, 1, 1, 1, 1, 1,
-0.1148887, 0.3814852, -0.3680224, 1, 1, 1, 1, 1,
-0.1031241, 0.8739649, 1.066535, 1, 1, 1, 1, 1,
-0.1014043, -0.04657774, -1.424866, 1, 1, 1, 1, 1,
-0.1011745, -0.3346214, -2.015974, 1, 1, 1, 1, 1,
-0.09299371, 0.2032358, 0.1234363, 1, 1, 1, 1, 1,
-0.09125249, -0.2737591, -2.318624, 1, 1, 1, 1, 1,
-0.08951035, 0.1669659, 1.025954, 1, 1, 1, 1, 1,
-0.08879914, -1.902456, -1.673831, 1, 1, 1, 1, 1,
-0.08782648, 0.1414569, 0.8256009, 1, 1, 1, 1, 1,
-0.0864211, -0.1692661, -2.687095, 0, 0, 1, 1, 1,
-0.08373977, -1.372518, -2.866293, 1, 0, 0, 1, 1,
-0.0819171, 0.3470511, 1.996846, 1, 0, 0, 1, 1,
-0.08079121, -1.048601, -2.415751, 1, 0, 0, 1, 1,
-0.08033045, 0.7668554, 0.6843871, 1, 0, 0, 1, 1,
-0.07932594, -0.03479245, -1.103658, 1, 0, 0, 1, 1,
-0.06990615, -0.7923964, -2.917417, 0, 0, 0, 1, 1,
-0.06145209, 1.510757, -0.03892336, 0, 0, 0, 1, 1,
-0.05878224, -0.7156149, -1.860004, 0, 0, 0, 1, 1,
-0.05780691, 0.5557256, -0.2626413, 0, 0, 0, 1, 1,
-0.05610726, 0.1503299, 1.245042, 0, 0, 0, 1, 1,
-0.05588733, 0.8454049, 0.5586826, 0, 0, 0, 1, 1,
-0.05544404, -0.09333768, -3.41586, 0, 0, 0, 1, 1,
-0.05499707, 0.4346272, 1.007542, 1, 1, 1, 1, 1,
-0.04981799, -0.7788858, -2.303986, 1, 1, 1, 1, 1,
-0.04829568, 0.2237865, -1.567414, 1, 1, 1, 1, 1,
-0.04779458, -0.298083, -2.205392, 1, 1, 1, 1, 1,
-0.04603239, -0.561958, -2.381976, 1, 1, 1, 1, 1,
-0.04420195, 0.306995, -1.077585, 1, 1, 1, 1, 1,
-0.04211884, -1.225843, -2.085062, 1, 1, 1, 1, 1,
-0.04108552, 1.49243, -0.788559, 1, 1, 1, 1, 1,
-0.04035739, 0.6879294, 0.03412854, 1, 1, 1, 1, 1,
-0.03999712, -0.03193072, -2.309489, 1, 1, 1, 1, 1,
-0.03917445, 1.278341, -0.6145419, 1, 1, 1, 1, 1,
-0.03717209, -1.323621, -2.028402, 1, 1, 1, 1, 1,
-0.03001004, -0.04536906, -2.873984, 1, 1, 1, 1, 1,
-0.02411952, 2.290084, -1.194125, 1, 1, 1, 1, 1,
-0.02216757, -0.6468045, -3.861628, 1, 1, 1, 1, 1,
-0.02182224, 0.5199222, -3.038034, 0, 0, 1, 1, 1,
-0.02181629, -1.160957, -4.447009, 1, 0, 0, 1, 1,
-0.01755988, -0.84835, -2.521775, 1, 0, 0, 1, 1,
-0.01227103, -0.1289869, -3.821636, 1, 0, 0, 1, 1,
-0.01144889, 0.1342127, 1.233041, 1, 0, 0, 1, 1,
-0.00932468, 0.06162573, -0.03928523, 1, 0, 0, 1, 1,
-0.005064675, 0.2602921, 0.3607614, 0, 0, 0, 1, 1,
-0.00374727, 0.551591, -0.5794048, 0, 0, 0, 1, 1,
-0.003662359, -0.3015586, -2.145643, 0, 0, 0, 1, 1,
-0.002932573, 2.527223, 2.701678, 0, 0, 0, 1, 1,
0.0008574959, -0.6824576, 1.693303, 0, 0, 0, 1, 1,
0.007189127, 1.358882, -1.063075, 0, 0, 0, 1, 1,
0.01094737, 0.8549076, 0.1813464, 0, 0, 0, 1, 1,
0.01424236, -0.5953267, 4.653725, 1, 1, 1, 1, 1,
0.01437537, 0.4093178, 0.9925845, 1, 1, 1, 1, 1,
0.01471913, 2.120221, 0.7195848, 1, 1, 1, 1, 1,
0.01477836, -0.446126, 2.924155, 1, 1, 1, 1, 1,
0.01571909, -0.9919269, 3.598577, 1, 1, 1, 1, 1,
0.02744516, -0.1068961, 3.321107, 1, 1, 1, 1, 1,
0.03148657, 0.6609882, 0.03059746, 1, 1, 1, 1, 1,
0.0359476, -0.3893634, 4.423009, 1, 1, 1, 1, 1,
0.03637417, -0.3706886, 1.799719, 1, 1, 1, 1, 1,
0.03829298, 0.8327481, 0.1143694, 1, 1, 1, 1, 1,
0.03963596, 2.707363, 0.0705286, 1, 1, 1, 1, 1,
0.03992749, 0.7506905, 1.73324, 1, 1, 1, 1, 1,
0.04028573, -0.6291288, 4.444255, 1, 1, 1, 1, 1,
0.04234955, -0.3657895, 2.410618, 1, 1, 1, 1, 1,
0.0451108, -0.002121715, 4.315317, 1, 1, 1, 1, 1,
0.04575846, 0.1793824, 2.492858, 0, 0, 1, 1, 1,
0.04628478, -0.6737984, 4.958857, 1, 0, 0, 1, 1,
0.04704498, -0.01378382, 2.133866, 1, 0, 0, 1, 1,
0.04962033, -1.360559, 2.386269, 1, 0, 0, 1, 1,
0.05223905, 0.910458, 0.6264444, 1, 0, 0, 1, 1,
0.05264911, -0.4530725, 3.877958, 1, 0, 0, 1, 1,
0.05806803, -0.144587, 3.543275, 0, 0, 0, 1, 1,
0.05829328, -0.07970946, 1.861163, 0, 0, 0, 1, 1,
0.05860762, -1.221249, 1.445387, 0, 0, 0, 1, 1,
0.05876701, -0.1002031, 1.668175, 0, 0, 0, 1, 1,
0.05923241, -0.4406114, 2.236379, 0, 0, 0, 1, 1,
0.05989898, -0.555195, 2.356924, 0, 0, 0, 1, 1,
0.06530645, -0.6201001, 2.915065, 0, 0, 0, 1, 1,
0.06763131, -1.569607, 3.719572, 1, 1, 1, 1, 1,
0.07183713, -0.3905605, 3.812441, 1, 1, 1, 1, 1,
0.0726222, 0.4637936, 0.3725062, 1, 1, 1, 1, 1,
0.07515052, 0.06960316, 0.4766957, 1, 1, 1, 1, 1,
0.07592146, 0.03792598, 1.280743, 1, 1, 1, 1, 1,
0.07627236, -1.58737, 1.71097, 1, 1, 1, 1, 1,
0.08078533, 0.1555708, -0.653759, 1, 1, 1, 1, 1,
0.08129254, -1.306275, 2.070546, 1, 1, 1, 1, 1,
0.08313324, -1.649414, 3.408704, 1, 1, 1, 1, 1,
0.08463179, 1.081631, -0.5617371, 1, 1, 1, 1, 1,
0.08472724, -0.5787974, 3.404028, 1, 1, 1, 1, 1,
0.08996862, 0.1771493, -0.4260564, 1, 1, 1, 1, 1,
0.09105127, 0.3869094, -0.3974575, 1, 1, 1, 1, 1,
0.09136747, -0.8925878, 3.140677, 1, 1, 1, 1, 1,
0.09238261, -0.7485607, 2.059555, 1, 1, 1, 1, 1,
0.1038825, -0.04994051, 2.864865, 0, 0, 1, 1, 1,
0.1073655, 0.38141, 0.7575466, 1, 0, 0, 1, 1,
0.1127711, 1.120361, -0.8171487, 1, 0, 0, 1, 1,
0.1130738, 0.4526496, -0.3201453, 1, 0, 0, 1, 1,
0.1143456, -0.2204061, 2.746106, 1, 0, 0, 1, 1,
0.1199309, -0.1725172, 2.669074, 1, 0, 0, 1, 1,
0.120567, -0.2708673, 5.873471, 0, 0, 0, 1, 1,
0.1219163, -1.401447, 1.80592, 0, 0, 0, 1, 1,
0.1225978, 2.323363, 1.618457, 0, 0, 0, 1, 1,
0.1236342, 0.4509374, 1.795899, 0, 0, 0, 1, 1,
0.1259046, 1.156784, -0.2039411, 0, 0, 0, 1, 1,
0.1276026, 0.67077, 0.5801871, 0, 0, 0, 1, 1,
0.1293926, 0.6610652, 0.4103753, 0, 0, 0, 1, 1,
0.1311832, -2.463414, 2.737717, 1, 1, 1, 1, 1,
0.1312323, -0.2864585, 1.52077, 1, 1, 1, 1, 1,
0.1312458, 1.609679, 0.6459807, 1, 1, 1, 1, 1,
0.1314002, 0.2400952, -0.7308087, 1, 1, 1, 1, 1,
0.1317266, 0.4046273, 2.105752, 1, 1, 1, 1, 1,
0.1333163, 1.286416, 0.1548384, 1, 1, 1, 1, 1,
0.1336864, 0.2150797, 2.475054, 1, 1, 1, 1, 1,
0.1375417, 0.1339939, 1.246453, 1, 1, 1, 1, 1,
0.1386062, -0.4541624, 2.739567, 1, 1, 1, 1, 1,
0.1493712, 0.3169125, -0.759055, 1, 1, 1, 1, 1,
0.1509072, -2.089649, 1.172767, 1, 1, 1, 1, 1,
0.1595104, -0.1081056, 1.455336, 1, 1, 1, 1, 1,
0.1613059, 0.1887669, 0.8772908, 1, 1, 1, 1, 1,
0.1616344, -0.7307346, 2.803126, 1, 1, 1, 1, 1,
0.1637653, -0.5853914, 3.012636, 1, 1, 1, 1, 1,
0.1692065, 2.831909, -0.1722188, 0, 0, 1, 1, 1,
0.174703, -0.1061377, 0.2756742, 1, 0, 0, 1, 1,
0.1782369, 2.20098, -1.21618, 1, 0, 0, 1, 1,
0.1808925, -2.228337, 3.894093, 1, 0, 0, 1, 1,
0.182222, -1.145923, 1.070167, 1, 0, 0, 1, 1,
0.1836459, 0.6591924, -0.8577031, 1, 0, 0, 1, 1,
0.1842583, -0.2808278, 2.227327, 0, 0, 0, 1, 1,
0.1846516, -0.5207, 1.676822, 0, 0, 0, 1, 1,
0.1927821, -1.75197, 3.226708, 0, 0, 0, 1, 1,
0.1960523, 0.8429821, -1.033709, 0, 0, 0, 1, 1,
0.1967272, -1.212998, 2.942122, 0, 0, 0, 1, 1,
0.1973513, -0.5684878, 1.158631, 0, 0, 0, 1, 1,
0.1990471, -0.2404092, 1.399068, 0, 0, 0, 1, 1,
0.2059805, -0.2988571, 0.4529111, 1, 1, 1, 1, 1,
0.2066677, -1.720198, 4.856979, 1, 1, 1, 1, 1,
0.207258, 0.834664, -0.06060958, 1, 1, 1, 1, 1,
0.2089404, -0.9150881, 1.122456, 1, 1, 1, 1, 1,
0.2094011, 0.7029117, -2.179671, 1, 1, 1, 1, 1,
0.2094944, -1.350857, 2.086001, 1, 1, 1, 1, 1,
0.2102165, -0.4542052, 2.155549, 1, 1, 1, 1, 1,
0.2151626, -0.7249845, 2.349556, 1, 1, 1, 1, 1,
0.2162054, 1.280622, 1.136916, 1, 1, 1, 1, 1,
0.2189683, -1.282061, 3.930079, 1, 1, 1, 1, 1,
0.2197423, -0.07614438, 1.608726, 1, 1, 1, 1, 1,
0.2229725, 1.55559, -0.741393, 1, 1, 1, 1, 1,
0.226167, 0.3429063, -1.709466, 1, 1, 1, 1, 1,
0.2283765, 0.2596791, 1.20765, 1, 1, 1, 1, 1,
0.2291594, 1.062567, 0.7122074, 1, 1, 1, 1, 1,
0.2307455, 0.5285085, 0.4824636, 0, 0, 1, 1, 1,
0.2307927, -0.5826226, 4.464685, 1, 0, 0, 1, 1,
0.2322873, 0.3408335, 2.323833, 1, 0, 0, 1, 1,
0.237545, 0.07151411, 2.945659, 1, 0, 0, 1, 1,
0.2433898, 0.06174488, 2.022914, 1, 0, 0, 1, 1,
0.2465862, -0.9850848, 2.250668, 1, 0, 0, 1, 1,
0.2483179, -0.09270688, 2.810896, 0, 0, 0, 1, 1,
0.2500997, 1.1152, -0.3768395, 0, 0, 0, 1, 1,
0.2541271, -0.2721547, 2.852424, 0, 0, 0, 1, 1,
0.255082, 1.375629, 1.686566, 0, 0, 0, 1, 1,
0.2584544, -1.466136, 5.468513, 0, 0, 0, 1, 1,
0.2587279, 0.4326416, -0.1871227, 0, 0, 0, 1, 1,
0.2591506, -0.7212606, 2.282551, 0, 0, 0, 1, 1,
0.2661664, -0.09922232, 2.042091, 1, 1, 1, 1, 1,
0.26996, 0.5469818, 0.8816789, 1, 1, 1, 1, 1,
0.2734454, -0.5215637, 2.294517, 1, 1, 1, 1, 1,
0.2781972, -0.6766021, 1.601683, 1, 1, 1, 1, 1,
0.2938283, -1.194906, 1.783963, 1, 1, 1, 1, 1,
0.2979511, 0.0958281, 2.05284, 1, 1, 1, 1, 1,
0.2999488, 0.2691661, 0.7102624, 1, 1, 1, 1, 1,
0.3039875, 1.031368, -0.06079465, 1, 1, 1, 1, 1,
0.3093444, -0.5586519, 2.14188, 1, 1, 1, 1, 1,
0.3097562, 2.250293, 0.8871885, 1, 1, 1, 1, 1,
0.310029, -1.243905, 2.863716, 1, 1, 1, 1, 1,
0.3111137, 1.076307, 0.4459629, 1, 1, 1, 1, 1,
0.3195095, 1.71205, 0.04039644, 1, 1, 1, 1, 1,
0.3223042, -0.07387934, 3.30201, 1, 1, 1, 1, 1,
0.3233379, 0.2255377, -0.5253905, 1, 1, 1, 1, 1,
0.3314435, 0.7594571, 1.760234, 0, 0, 1, 1, 1,
0.3316274, -1.799957, 2.389573, 1, 0, 0, 1, 1,
0.3340553, 1.80627, -0.6247413, 1, 0, 0, 1, 1,
0.3348882, -0.42556, 1.047199, 1, 0, 0, 1, 1,
0.3361109, 1.557927, 0.3170921, 1, 0, 0, 1, 1,
0.3386518, 1.202286, 0.5737044, 1, 0, 0, 1, 1,
0.339058, 0.2644133, -0.2929975, 0, 0, 0, 1, 1,
0.3393606, 0.6312742, 0.07037221, 0, 0, 0, 1, 1,
0.3426745, 1.395634, -0.6856787, 0, 0, 0, 1, 1,
0.348071, -0.2871587, 1.502645, 0, 0, 0, 1, 1,
0.3485923, 1.492316, 1.471905, 0, 0, 0, 1, 1,
0.3498676, 0.3294362, 1.264575, 0, 0, 0, 1, 1,
0.3500033, 0.9697981, -1.079298, 0, 0, 0, 1, 1,
0.3509571, -2.4381, 4.309505, 1, 1, 1, 1, 1,
0.353144, 1.922529, -0.2308932, 1, 1, 1, 1, 1,
0.3533426, -0.2162522, 0.8763148, 1, 1, 1, 1, 1,
0.3575987, -0.5981777, 3.041399, 1, 1, 1, 1, 1,
0.361008, -1.897906, 2.947131, 1, 1, 1, 1, 1,
0.3616128, -0.1511598, 2.703173, 1, 1, 1, 1, 1,
0.3639967, -1.331752, 3.296409, 1, 1, 1, 1, 1,
0.3672324, -1.104877, 3.73598, 1, 1, 1, 1, 1,
0.3682714, 1.211184, 1.389916, 1, 1, 1, 1, 1,
0.3684033, 1.532899, -2.698142, 1, 1, 1, 1, 1,
0.3730547, 0.6944274, 1.791015, 1, 1, 1, 1, 1,
0.375033, -0.0930557, 1.756145, 1, 1, 1, 1, 1,
0.3762105, -2.442053, 4.529533, 1, 1, 1, 1, 1,
0.377146, 0.6145452, 0.4842244, 1, 1, 1, 1, 1,
0.3813079, -0.3141876, 4.096586, 1, 1, 1, 1, 1,
0.3829345, -1.143494, 3.065564, 0, 0, 1, 1, 1,
0.3864937, -0.2300127, 2.097561, 1, 0, 0, 1, 1,
0.3868841, 1.917366, 0.7050101, 1, 0, 0, 1, 1,
0.3901587, -2.067633, 2.684054, 1, 0, 0, 1, 1,
0.390644, -0.2857911, 3.177302, 1, 0, 0, 1, 1,
0.3962799, -0.04350667, 3.188095, 1, 0, 0, 1, 1,
0.396298, -0.6940705, 3.37235, 0, 0, 0, 1, 1,
0.4061817, 1.632379, -0.9704413, 0, 0, 0, 1, 1,
0.407276, 0.2294663, 0.5508999, 0, 0, 0, 1, 1,
0.4079783, -0.9656647, 3.32037, 0, 0, 0, 1, 1,
0.4084844, 0.1342552, 0.9055999, 0, 0, 0, 1, 1,
0.412911, -1.047251, 2.55399, 0, 0, 0, 1, 1,
0.4196803, -1.080025, 0.9477209, 0, 0, 0, 1, 1,
0.4203009, 0.8236947, 1.968074, 1, 1, 1, 1, 1,
0.4210573, -0.4273002, 3.191421, 1, 1, 1, 1, 1,
0.4210868, -1.267755, 3.365918, 1, 1, 1, 1, 1,
0.4233059, 0.005375023, 2.856232, 1, 1, 1, 1, 1,
0.4248402, -1.594474, 5.169093, 1, 1, 1, 1, 1,
0.4268706, 1.32517, 0.4276102, 1, 1, 1, 1, 1,
0.4346359, 0.4891885, 1.283407, 1, 1, 1, 1, 1,
0.4398907, -0.2112963, 1.391136, 1, 1, 1, 1, 1,
0.4405148, -1.647392, 3.079278, 1, 1, 1, 1, 1,
0.441016, -2.443925, 1.751602, 1, 1, 1, 1, 1,
0.442645, -0.7605144, 2.298583, 1, 1, 1, 1, 1,
0.443538, -0.5692534, 2.598722, 1, 1, 1, 1, 1,
0.4443464, -1.264632, 1.944796, 1, 1, 1, 1, 1,
0.4553861, -1.486911, 1.882103, 1, 1, 1, 1, 1,
0.456402, 0.6494528, 1.632181, 1, 1, 1, 1, 1,
0.4564909, 0.3415994, 1.011124, 0, 0, 1, 1, 1,
0.4585307, 0.8355243, -0.4038293, 1, 0, 0, 1, 1,
0.4589413, 0.1048328, 0.7420133, 1, 0, 0, 1, 1,
0.4621139, -0.5937731, 0.3212912, 1, 0, 0, 1, 1,
0.4632365, 0.616715, 0.7013208, 1, 0, 0, 1, 1,
0.4640447, 0.1378739, -0.5344682, 1, 0, 0, 1, 1,
0.466785, 2.641472, -0.1894135, 0, 0, 0, 1, 1,
0.4677944, -0.6441069, 3.716886, 0, 0, 0, 1, 1,
0.4701641, -1.433797, 3.984885, 0, 0, 0, 1, 1,
0.471389, 0.4518699, 0.6654333, 0, 0, 0, 1, 1,
0.4742566, -1.266237, 1.841884, 0, 0, 0, 1, 1,
0.4754519, -0.5342466, 1.18973, 0, 0, 0, 1, 1,
0.4761529, 0.924054, -0.36772, 0, 0, 0, 1, 1,
0.4774569, -1.799247, 3.389576, 1, 1, 1, 1, 1,
0.4777301, 1.144456, -0.5837695, 1, 1, 1, 1, 1,
0.4782331, 0.4175501, 1.046318, 1, 1, 1, 1, 1,
0.4796071, -0.07149827, 1.77923, 1, 1, 1, 1, 1,
0.4813678, -2.192528, 2.050958, 1, 1, 1, 1, 1,
0.4829008, -0.02073823, 1.614119, 1, 1, 1, 1, 1,
0.4863806, 0.1935764, -0.6357595, 1, 1, 1, 1, 1,
0.4888471, 0.04270906, -0.151311, 1, 1, 1, 1, 1,
0.4899617, 1.173392, 1.133535, 1, 1, 1, 1, 1,
0.4903544, 0.899091, 0.9615166, 1, 1, 1, 1, 1,
0.4906443, -1.034353, 3.038744, 1, 1, 1, 1, 1,
0.4911889, 0.04766163, 0.6525109, 1, 1, 1, 1, 1,
0.4920057, -0.1427689, 1.709621, 1, 1, 1, 1, 1,
0.492526, 1.142542, 0.4425134, 1, 1, 1, 1, 1,
0.4936842, -0.5520085, 1.770834, 1, 1, 1, 1, 1,
0.5032426, -0.1353472, 0.7308568, 0, 0, 1, 1, 1,
0.5038593, -0.08158244, 3.170499, 1, 0, 0, 1, 1,
0.5047235, 0.9612334, 1.970235, 1, 0, 0, 1, 1,
0.5071859, 2.515742, -0.2096615, 1, 0, 0, 1, 1,
0.5075913, 0.542188, 2.069055, 1, 0, 0, 1, 1,
0.5095513, 1.669185, -1.984337, 1, 0, 0, 1, 1,
0.5098485, -1.175578, 3.604479, 0, 0, 0, 1, 1,
0.5156125, 2.239034, 1.390949, 0, 0, 0, 1, 1,
0.5253907, 1.144499, -0.03322073, 0, 0, 0, 1, 1,
0.5314611, -0.2741286, 2.623868, 0, 0, 0, 1, 1,
0.5455586, -0.1584119, -0.3501941, 0, 0, 0, 1, 1,
0.5465983, 0.8250276, 0.6043584, 0, 0, 0, 1, 1,
0.5500148, 0.2355468, 1.709459, 0, 0, 0, 1, 1,
0.5505704, 0.2417514, 1.498357, 1, 1, 1, 1, 1,
0.5515845, 0.868458, 1.312517, 1, 1, 1, 1, 1,
0.553142, -0.5669646, 3.4918, 1, 1, 1, 1, 1,
0.5575086, -0.3426377, 2.643785, 1, 1, 1, 1, 1,
0.5580678, 1.781367, 0.2305902, 1, 1, 1, 1, 1,
0.5597304, 0.2678187, 2.020481, 1, 1, 1, 1, 1,
0.5610541, 0.5574976, 0.9825844, 1, 1, 1, 1, 1,
0.5611525, -1.251642, 2.352314, 1, 1, 1, 1, 1,
0.5614322, -0.4146584, 2.903251, 1, 1, 1, 1, 1,
0.5682501, 0.5276739, 0.5078398, 1, 1, 1, 1, 1,
0.5683222, -0.8936225, 3.199695, 1, 1, 1, 1, 1,
0.5715217, 0.5362015, 0.3938048, 1, 1, 1, 1, 1,
0.5732109, 2.638533, 0.9588989, 1, 1, 1, 1, 1,
0.5769557, 1.822442, 1.14113, 1, 1, 1, 1, 1,
0.5774109, 0.4547278, 2.566815, 1, 1, 1, 1, 1,
0.5807123, -2.254135, 2.384977, 0, 0, 1, 1, 1,
0.5857018, 1.58423, 0.5526844, 1, 0, 0, 1, 1,
0.5869921, 0.265278, 2.480797, 1, 0, 0, 1, 1,
0.5906271, 0.02243921, 2.017093, 1, 0, 0, 1, 1,
0.59319, 1.033937, 2.596852, 1, 0, 0, 1, 1,
0.5970437, -0.4886141, 1.068231, 1, 0, 0, 1, 1,
0.6008068, 0.4826621, 0.8320649, 0, 0, 0, 1, 1,
0.6040708, 0.6042208, 0.9038416, 0, 0, 0, 1, 1,
0.6059741, 1.398543, 0.8580213, 0, 0, 0, 1, 1,
0.6077586, 0.7480971, 0.3396005, 0, 0, 0, 1, 1,
0.6081799, 2.214402, 1.735834, 0, 0, 0, 1, 1,
0.6101009, -1.771154, 2.539276, 0, 0, 0, 1, 1,
0.6175073, -1.02592, 3.188874, 0, 0, 0, 1, 1,
0.6181551, 0.4383577, 1.027117, 1, 1, 1, 1, 1,
0.6195179, 1.423472, 2.348484, 1, 1, 1, 1, 1,
0.6215022, -1.787873, 3.009525, 1, 1, 1, 1, 1,
0.6217892, -0.8886779, 2.602412, 1, 1, 1, 1, 1,
0.6250165, -0.7558315, 2.760995, 1, 1, 1, 1, 1,
0.6268561, 1.024103, -0.4117568, 1, 1, 1, 1, 1,
0.6366042, 0.3126419, 1.082834, 1, 1, 1, 1, 1,
0.655552, 1.440688, -0.04200782, 1, 1, 1, 1, 1,
0.6573814, -0.7255802, 0.9648913, 1, 1, 1, 1, 1,
0.6580077, -1.072677, 3.00534, 1, 1, 1, 1, 1,
0.663697, -0.7452191, 4.028277, 1, 1, 1, 1, 1,
0.6657399, 0.5904133, 0.1942718, 1, 1, 1, 1, 1,
0.6670538, 1.26352, 3.461236, 1, 1, 1, 1, 1,
0.6724672, 0.1159342, 1.175126, 1, 1, 1, 1, 1,
0.6727681, 0.1741326, 1.540345, 1, 1, 1, 1, 1,
0.7044498, -1.050871, 1.672156, 0, 0, 1, 1, 1,
0.710733, -0.6067001, 4.538799, 1, 0, 0, 1, 1,
0.7116097, 0.5363383, 1.186757, 1, 0, 0, 1, 1,
0.7119088, -0.9222219, 2.383462, 1, 0, 0, 1, 1,
0.714469, -0.6420407, 3.548298, 1, 0, 0, 1, 1,
0.7166457, -0.0445973, 1.679056, 1, 0, 0, 1, 1,
0.7167732, 0.0863874, 0.6265874, 0, 0, 0, 1, 1,
0.7211658, 1.223658, 1.384581, 0, 0, 0, 1, 1,
0.7225325, -0.6545005, 1.733857, 0, 0, 0, 1, 1,
0.7244229, 0.5735149, 0.8587483, 0, 0, 0, 1, 1,
0.7289709, -1.212296, 2.760131, 0, 0, 0, 1, 1,
0.7329448, 0.7592209, 0.611753, 0, 0, 0, 1, 1,
0.7355179, 0.4513816, 0.9714746, 0, 0, 0, 1, 1,
0.7357643, -0.6844193, 2.78384, 1, 1, 1, 1, 1,
0.7373973, 1.41879, 1.529773, 1, 1, 1, 1, 1,
0.7409877, 0.008370715, 1.483378, 1, 1, 1, 1, 1,
0.7420839, 0.4703733, -0.4222099, 1, 1, 1, 1, 1,
0.7438108, 0.4706481, 1.780403, 1, 1, 1, 1, 1,
0.7445779, 0.9664006, 2.098194, 1, 1, 1, 1, 1,
0.7490109, -1.847627, 4.863899, 1, 1, 1, 1, 1,
0.7492306, -0.1085854, 2.76579, 1, 1, 1, 1, 1,
0.755785, 1.219486, 0.2774534, 1, 1, 1, 1, 1,
0.7563508, 0.002415543, 1.753516, 1, 1, 1, 1, 1,
0.7570788, 0.8720453, 0.07262842, 1, 1, 1, 1, 1,
0.757087, -1.827691, 3.077724, 1, 1, 1, 1, 1,
0.7579244, -0.9111277, 3.783823, 1, 1, 1, 1, 1,
0.7592552, -0.5180697, 2.867076, 1, 1, 1, 1, 1,
0.7600132, -0.3967479, 2.339155, 1, 1, 1, 1, 1,
0.7602879, 0.4160919, -1.081852, 0, 0, 1, 1, 1,
0.7650303, -1.300115, 1.554608, 1, 0, 0, 1, 1,
0.7650405, 0.9229688, 0.6166708, 1, 0, 0, 1, 1,
0.765125, 0.04536851, 1.377862, 1, 0, 0, 1, 1,
0.7652491, -1.200728, 2.120035, 1, 0, 0, 1, 1,
0.7714902, -1.219229, 1.865312, 1, 0, 0, 1, 1,
0.7756866, -0.1892319, 2.025943, 0, 0, 0, 1, 1,
0.7773353, 0.2194359, 0.1296342, 0, 0, 0, 1, 1,
0.7790837, -0.1411329, 4.304554, 0, 0, 0, 1, 1,
0.783287, 1.371433, 2.95027, 0, 0, 0, 1, 1,
0.7859007, -0.6864224, 0.9132088, 0, 0, 0, 1, 1,
0.7925801, 0.200041, 0.8757904, 0, 0, 0, 1, 1,
0.8034446, 0.2943738, 0.07595729, 0, 0, 0, 1, 1,
0.8051665, 1.160678, 1.332167, 1, 1, 1, 1, 1,
0.8061789, 0.2108202, 0.3599055, 1, 1, 1, 1, 1,
0.8064008, 0.2594497, 0.9414157, 1, 1, 1, 1, 1,
0.806486, 2.037442, 0.4237705, 1, 1, 1, 1, 1,
0.806577, 0.7406476, 1.537537, 1, 1, 1, 1, 1,
0.8116413, 0.7337784, 0.8894576, 1, 1, 1, 1, 1,
0.8119, 0.4124021, 1.046319, 1, 1, 1, 1, 1,
0.8148432, -0.1775964, 1.131717, 1, 1, 1, 1, 1,
0.8182508, -0.7393199, 1.484867, 1, 1, 1, 1, 1,
0.8206216, 0.01431688, 1.74204, 1, 1, 1, 1, 1,
0.8281882, -1.743153, 2.336725, 1, 1, 1, 1, 1,
0.8284106, -0.5081207, 0.691269, 1, 1, 1, 1, 1,
0.833487, 2.30569, 0.08444401, 1, 1, 1, 1, 1,
0.8346397, -0.9287151, 2.867537, 1, 1, 1, 1, 1,
0.8357462, -0.4182799, 0.9871915, 1, 1, 1, 1, 1,
0.8364543, 1.636081, 0.8111492, 0, 0, 1, 1, 1,
0.837774, -0.8149678, -0.3252404, 1, 0, 0, 1, 1,
0.8486336, 0.03031321, 1.016166, 1, 0, 0, 1, 1,
0.8546684, -1.263858, 3.525024, 1, 0, 0, 1, 1,
0.8594891, -0.9656404, 1.764303, 1, 0, 0, 1, 1,
0.8651304, 1.36927, 0.09891352, 1, 0, 0, 1, 1,
0.869288, -0.112043, 1.027611, 0, 0, 0, 1, 1,
0.8718329, -1.651254, 2.399775, 0, 0, 0, 1, 1,
0.8840304, -0.0469412, 2.276398, 0, 0, 0, 1, 1,
0.8868735, -0.1765831, 2.461674, 0, 0, 0, 1, 1,
0.8895187, 0.2666784, 2.010316, 0, 0, 0, 1, 1,
0.8944443, 1.788031, -1.277548, 0, 0, 0, 1, 1,
0.894906, -1.255097, 3.964714, 0, 0, 0, 1, 1,
0.8996826, 0.9121667, 0.2816854, 1, 1, 1, 1, 1,
0.9073482, -1.131493, 2.074321, 1, 1, 1, 1, 1,
0.9099721, -1.50883, 2.415421, 1, 1, 1, 1, 1,
0.9230288, -1.104802, 1.424068, 1, 1, 1, 1, 1,
0.9263562, 1.198928, 0.356373, 1, 1, 1, 1, 1,
0.9281532, -0.7165884, 3.059034, 1, 1, 1, 1, 1,
0.9369987, -1.237652, 4.53541, 1, 1, 1, 1, 1,
0.9396771, 0.1090989, -0.8927632, 1, 1, 1, 1, 1,
0.9411622, 1.190499, 0.4640411, 1, 1, 1, 1, 1,
0.944872, -0.1044258, 1.530307, 1, 1, 1, 1, 1,
0.9500336, 0.5671114, 1.348479, 1, 1, 1, 1, 1,
0.9505259, 0.9850729, 0.6242972, 1, 1, 1, 1, 1,
0.9661736, -0.2170402, 1.258169, 1, 1, 1, 1, 1,
0.9669001, -0.4521455, 2.325124, 1, 1, 1, 1, 1,
0.9674336, 0.3093021, -0.2537266, 1, 1, 1, 1, 1,
0.9711888, -0.3169926, 1.101859, 0, 0, 1, 1, 1,
0.9898551, 1.070184, -0.4264794, 1, 0, 0, 1, 1,
0.9912214, 0.03897047, 2.272589, 1, 0, 0, 1, 1,
0.9926632, -0.2028309, 2.186253, 1, 0, 0, 1, 1,
1.01109, -0.3971055, 1.681378, 1, 0, 0, 1, 1,
1.012557, 1.229853, 0.547958, 1, 0, 0, 1, 1,
1.013396, 2.323505, 0.5623755, 0, 0, 0, 1, 1,
1.023159, 0.1080118, 2.321113, 0, 0, 0, 1, 1,
1.023267, 0.01288802, 2.720267, 0, 0, 0, 1, 1,
1.060449, 0.006509486, 2.40293, 0, 0, 0, 1, 1,
1.068637, 0.6495617, 1.158141, 0, 0, 0, 1, 1,
1.070614, -0.5481799, 1.314049, 0, 0, 0, 1, 1,
1.079418, -0.8165402, 4.140971, 0, 0, 0, 1, 1,
1.08277, 0.2500942, 0.1796151, 1, 1, 1, 1, 1,
1.099292, 1.163106, 1.364671, 1, 1, 1, 1, 1,
1.102451, 0.3072319, 2.456791, 1, 1, 1, 1, 1,
1.106016, -0.3364496, 1.307057, 1, 1, 1, 1, 1,
1.113781, -0.4888139, 2.361921, 1, 1, 1, 1, 1,
1.114783, 2.101369, 1.834102, 1, 1, 1, 1, 1,
1.128535, 2.513287, 0.5942661, 1, 1, 1, 1, 1,
1.139786, 1.264706, -0.417474, 1, 1, 1, 1, 1,
1.144982, 1.611125, 0.174467, 1, 1, 1, 1, 1,
1.150008, -1.940517, 1.402429, 1, 1, 1, 1, 1,
1.159888, -0.3705408, 1.225495, 1, 1, 1, 1, 1,
1.172184, -1.169547, 2.631868, 1, 1, 1, 1, 1,
1.200916, -1.053715, 2.850838, 1, 1, 1, 1, 1,
1.21002, -0.6926636, 3.350914, 1, 1, 1, 1, 1,
1.212413, -0.6040215, 1.233706, 1, 1, 1, 1, 1,
1.231778, -1.163384, 4.175792, 0, 0, 1, 1, 1,
1.247665, -0.216577, 1.707329, 1, 0, 0, 1, 1,
1.248778, 1.299673, 0.2488221, 1, 0, 0, 1, 1,
1.254801, 1.533982, -4.109828, 1, 0, 0, 1, 1,
1.256513, 0.499724, 1.766673, 1, 0, 0, 1, 1,
1.25988, -0.1742765, 1.795512, 1, 0, 0, 1, 1,
1.262527, -0.9021494, 0.6387262, 0, 0, 0, 1, 1,
1.263424, 0.5742179, 0.2290375, 0, 0, 0, 1, 1,
1.265245, 0.322354, 1.577374, 0, 0, 0, 1, 1,
1.268431, 0.4588934, 2.175789, 0, 0, 0, 1, 1,
1.268877, 0.4004673, 0.5019491, 0, 0, 0, 1, 1,
1.27015, -0.5262396, 1.185229, 0, 0, 0, 1, 1,
1.278983, 0.4627459, 0.8781877, 0, 0, 0, 1, 1,
1.279158, 0.1334071, 1.175268, 1, 1, 1, 1, 1,
1.296171, -1.131437, 1.731769, 1, 1, 1, 1, 1,
1.298869, -0.03043058, -0.9992157, 1, 1, 1, 1, 1,
1.307355, -1.528416, 2.971387, 1, 1, 1, 1, 1,
1.329146, 0.05037866, 1.502935, 1, 1, 1, 1, 1,
1.333211, -1.251153, 3.086124, 1, 1, 1, 1, 1,
1.337292, 1.981112, 0.01998801, 1, 1, 1, 1, 1,
1.343605, -0.4074626, 0.6361009, 1, 1, 1, 1, 1,
1.356453, 0.5467338, 1.726214, 1, 1, 1, 1, 1,
1.361351, 0.01203799, -0.21714, 1, 1, 1, 1, 1,
1.389994, 0.1618443, 1.176994, 1, 1, 1, 1, 1,
1.390173, 1.035717, 0.1432178, 1, 1, 1, 1, 1,
1.397996, 0.6527811, 1.56248, 1, 1, 1, 1, 1,
1.398524, 0.7918777, 1.534828, 1, 1, 1, 1, 1,
1.413648, 0.8537995, 1.918862, 1, 1, 1, 1, 1,
1.421076, -0.3024789, 1.998225, 0, 0, 1, 1, 1,
1.469035, 0.4952941, 1.700171, 1, 0, 0, 1, 1,
1.473177, -0.3164457, 1.753155, 1, 0, 0, 1, 1,
1.473409, -1.310468, 1.649919, 1, 0, 0, 1, 1,
1.484112, -0.3809014, 1.790994, 1, 0, 0, 1, 1,
1.485335, -0.1791077, 0.1093033, 1, 0, 0, 1, 1,
1.504369, -1.298321, 2.139704, 0, 0, 0, 1, 1,
1.516351, -0.7799662, 2.81888, 0, 0, 0, 1, 1,
1.519953, 0.5143108, 0.8926755, 0, 0, 0, 1, 1,
1.527901, 0.04608365, 1.310306, 0, 0, 0, 1, 1,
1.533759, 0.3803177, 1.928157, 0, 0, 0, 1, 1,
1.538489, -1.766752, 1.924557, 0, 0, 0, 1, 1,
1.542821, -0.6099681, 2.57873, 0, 0, 0, 1, 1,
1.561285, 1.390179, 0.4150049, 1, 1, 1, 1, 1,
1.56434, -0.6964268, 2.498505, 1, 1, 1, 1, 1,
1.575783, 0.3123055, 1.444347, 1, 1, 1, 1, 1,
1.594029, 0.6996022, 0.3652825, 1, 1, 1, 1, 1,
1.596993, 1.402699, 3.040627, 1, 1, 1, 1, 1,
1.597884, 0.6672543, 1.412105, 1, 1, 1, 1, 1,
1.609734, -0.1094242, 2.866261, 1, 1, 1, 1, 1,
1.615963, -0.2829867, 1.7477, 1, 1, 1, 1, 1,
1.61816, 0.1893593, 1.756368, 1, 1, 1, 1, 1,
1.623279, 2.015797, 1.78382, 1, 1, 1, 1, 1,
1.629059, -0.7469625, 2.009187, 1, 1, 1, 1, 1,
1.634483, -0.3859838, 1.630005, 1, 1, 1, 1, 1,
1.652021, 0.2410674, 1.960516, 1, 1, 1, 1, 1,
1.660517, -0.9548138, 3.867257, 1, 1, 1, 1, 1,
1.672622, -0.1284074, 1.024977, 1, 1, 1, 1, 1,
1.679524, -1.295318, 2.925467, 0, 0, 1, 1, 1,
1.684785, 2.093253, -0.001616245, 1, 0, 0, 1, 1,
1.70127, -0.1464597, 0.6018087, 1, 0, 0, 1, 1,
1.727386, 1.793789, 1.539415, 1, 0, 0, 1, 1,
1.730954, 0.441576, 1.710579, 1, 0, 0, 1, 1,
1.75289, -1.020279, 2.238211, 1, 0, 0, 1, 1,
1.770356, -2.450469, 2.182167, 0, 0, 0, 1, 1,
1.78832, -1.234397, 0.5270005, 0, 0, 0, 1, 1,
1.805006, -1.536076, 0.3126639, 0, 0, 0, 1, 1,
1.842592, 0.4917708, 0.7397159, 0, 0, 0, 1, 1,
1.842665, -0.3774461, 2.278054, 0, 0, 0, 1, 1,
1.849286, 0.200339, 2.574977, 0, 0, 0, 1, 1,
1.85316, 1.437208, 0.008528694, 0, 0, 0, 1, 1,
1.854498, -1.31294, 1.518057, 1, 1, 1, 1, 1,
1.897664, 1.21139, 1.038716, 1, 1, 1, 1, 1,
1.904408, 0.7403366, 0.6981258, 1, 1, 1, 1, 1,
1.911379, -1.117868, 1.479289, 1, 1, 1, 1, 1,
1.918994, -1.148688, 2.081428, 1, 1, 1, 1, 1,
1.930054, -0.723393, 2.085268, 1, 1, 1, 1, 1,
1.952951, 0.3971229, 1.43093, 1, 1, 1, 1, 1,
1.967439, 0.9330562, 1.335542, 1, 1, 1, 1, 1,
1.973716, -0.3631147, 1.425212, 1, 1, 1, 1, 1,
1.98465, -1.107992, 2.819006, 1, 1, 1, 1, 1,
1.997745, -2.586385, 1.428482, 1, 1, 1, 1, 1,
1.997863, 0.2934447, 1.621551, 1, 1, 1, 1, 1,
2.026102, -0.7664101, 3.01595, 1, 1, 1, 1, 1,
2.035066, 1.845769, 0.5076781, 1, 1, 1, 1, 1,
2.046146, 0.006639762, 1.828433, 1, 1, 1, 1, 1,
2.04801, -0.5883074, 1.839693, 0, 0, 1, 1, 1,
2.051418, 0.9403409, 1.018592, 1, 0, 0, 1, 1,
2.064091, 0.5811413, 0.7089962, 1, 0, 0, 1, 1,
2.109983, -0.3234192, 1.214786, 1, 0, 0, 1, 1,
2.112759, 0.5886073, -0.8045573, 1, 0, 0, 1, 1,
2.168281, -0.60312, 2.485038, 1, 0, 0, 1, 1,
2.205926, -1.379429, 0.2934963, 0, 0, 0, 1, 1,
2.2343, 0.8865837, 0.1143457, 0, 0, 0, 1, 1,
2.330796, -1.631104, 3.169425, 0, 0, 0, 1, 1,
2.367783, -0.8060307, 2.488921, 0, 0, 0, 1, 1,
2.443605, -0.1578856, 3.081193, 0, 0, 0, 1, 1,
2.456835, -0.7577883, 2.502257, 0, 0, 0, 1, 1,
2.486046, -1.692517, 2.571527, 0, 0, 0, 1, 1,
2.750668, 0.1316845, 1.873199, 1, 1, 1, 1, 1,
2.814633, -0.4528625, -0.2458404, 1, 1, 1, 1, 1,
2.989115, 1.511928, -1.219987, 1, 1, 1, 1, 1,
3.001859, 1.226171, -0.6291615, 1, 1, 1, 1, 1,
3.19019, 2.633146, 0.5080253, 1, 1, 1, 1, 1,
3.345031, -0.1123038, 1.080226, 1, 1, 1, 1, 1,
3.405, -0.6086636, 2.531209, 1, 1, 1, 1, 1
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
var radius = 9.444178;
var distance = 33.17227;
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
mvMatrix.translate( -0.1862278, 0.007179141, -0.4566054 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17227);
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
